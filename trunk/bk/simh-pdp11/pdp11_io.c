/* pdp11_io.c: PDP-11 I/O simulator

   Copyright (c) 1993-2008, Robert M Supnik

   Permission is hereby granted, free of charge, to any person obtaining a
   copy of this software and associated documentation files (the "Software"),
   to deal in the Software without restriction, including without limitation
   the rights to use, copy, modify, merge, publish, distribute, sublicense,
   and/or sell copies of the Software, and to permit persons to whom the
   Software is furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
   ROBERT M SUPNIK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

   Except as contained in this notice, the name of Robert M Supnik shall not be
   used in advertising or otherwise to promote the sale, use or other dealings
   in this Software without prior written authorization from Robert M Supnik.

   19-Nov-08    RMS     Moved I/O support routines to I/O library
   16-May-08    RMS     Added multiple DC11 support
                        Renamed DL11 in autoconfigure
   02-Feb-08    RMS     Fixed DMA memory address limit test (found by John Dundas)
   06-Jul-06    RMS     Added multiple KL11/DL11 support
   15-Oct-05    RMS     Fixed bug in autoconfiguration (missing XU)
   25-Jul-05    RMS     Revised autoconfiguration algorithm and interface
   30-Sep-04    RMS     Revised Unibus interface
   28-May-04    RMS     Revised I/O dispatching (from John Dundas)
   25-Jan-04    RMS     Removed local debug logging support
   21-Dec-03    RMS     Fixed bug in autoconfigure vector assignment; added controls
   21-Nov-03    RMS     Added check for interrupt slot conflict (found by Dave Hittner)
   12-Mar-03    RMS     Added logical name support
   08-Oct-02    RMS     Trimmed I/O bus addresses
                        Added support for dynamic tables
                        Added show I/O space, autoconfigure routines
   12-Sep-02    RMS     Added support for TMSCP, KW11P, RX211
   26-Jan-02    RMS     Revised for multiple DZ's
   06-Jan-02    RMS     Revised I/O access, enable/disable support
   11-Dec-01    RMS     Moved interrupt debug code
   08-Nov-01    RMS     Cloned from cpu sources
*/

#include "pdp11_defs.h"

extern uint16 *M;
extern int32 int_req[IPL_HLVL];
extern int32 ub_map[UBM_LNT_LW];
extern int32 cpu_opt, cpu_bme;
extern int32 trap_req, ipl;
extern int32 cpu_log;
extern int32 autcon_enb;
extern int32 uba_last;
extern FILE *sim_log;
extern FILE *sim_deb;
extern DEVICE *sim_devices[], cpu_dev;
extern t_addr cpu_memsize;

int32 calc_ints (int32 nipl, int32 trq);

extern t_stat cpu_build_dib (void);
extern void init_mbus_tab (void);
extern t_stat build_mbus_tab (DEVICE *dptr, DIB *dibp);

/* I/O data structures */

t_stat (*iodispR[IOPAGESIZE >> 1])(int32 *dat, int32 ad, int32 md);
t_stat (*iodispW[IOPAGESIZE >> 1])(int32 dat, int32 ad, int32 md);

int32 int_vec[IPL_HLVL][32];                            /* int req to vector */
int32 (*int_ack[IPL_HLVL][32])(void);                   /* int ack routines */

static const int32 pirq_bit[7] = {
    INT_V_PIR1, INT_V_PIR2, INT_V_PIR3, INT_V_PIR4,
    INT_V_PIR5, INT_V_PIR6, INT_V_PIR7
    };

static const char *devnam (uint32 pa)
{
    switch (pa & 07776) {
    case 02140 ... 02142: return "KMD";
    case 02300 ... 02316: return "KIPDR";
    case 02320 ... 02336: return "KDPDR";
    case 02340 ... 02356: return "KIPAR";
    case 02360 ... 02376: return "KDPAR";
    case 02516:           return "MMR3";
    //case 04400 ... 04410: return "RL11";
    case 07560 ... 07562: return "DL11 rcv";
    case 07564 ... 07566: return "DL11 xmt";
    case 07570:           return "SR";
    case 07572 ... 07576: return "MMR";
    case 07600 ... 07616: return "UIPDR";
    case 07620 ... 07636: return "UDPDR";
    case 07640 ... 07656: return "UIPAR";
    case 07660 ... 07676: return "UDPAR";
    case 07776:           return "PSW";
    }
    return 0;
}

/* I/O page lookup and linkage routines

   Inputs:
        *data   =       pointer to data to read, if READ
        data    =       data to store, if WRITE or WRITEB
        pa      =       address
        access  =       READ, WRITE, or WRITEB
   Outputs:
        status  =       SCPE_OK or SCPE_NXM
*/

t_stat iopageR (int32 *data, uint32 pa, int32 access)
{
int32 idx;
t_stat stat;

idx = (pa & IOPAGEMASK) >> 1;
if (iodispR[idx]) {
    extern DEVICE sys_dev;
    stat = iodispR[idx] (data, pa, access);
    if (sim_deb && sys_dev.dctrl && (pa & 0170000) == 0170000) {
        const char *name = devnam(pa);
        if (! name)
            fprintf (sim_deb, "    read *%04o -> %06o\n",
                pa & 07777, *data);
#ifdef SYS_DEBUG
        else
            fprintf (sim_deb, "    read %s:%04o -> %06o\n",
                name, pa & 07777, *data);
#endif
    }
    trap_req = calc_ints (ipl, trap_req);
    return stat;
    }
//printf (">>> read *%04o -> TRAP\r\n", pa & 07777);
return SCPE_NXM;
}

t_stat iopageW (int32 data, uint32 pa, int32 access)
{
int32 idx;
t_stat stat;

idx = (pa & IOPAGEMASK) >> 1;
if (iodispW[idx]) {
    extern DEVICE sys_dev;
    if (sim_deb && sys_dev.dctrl && (pa & 0170000) == 0170000) {
        const char *name = devnam(pa);
        if (name)
            fprintf (sim_deb, "    write *%04o := %06o\n",
                pa & 07777, data);
#ifdef SYS_DEBUG
        else
            fprintf (sim_deb, "    write %s:%04o := %06o\n",
                name, pa & 07777, data);
#endif
    }
    stat = iodispW[idx] (data, pa, access);
    trap_req = calc_ints (ipl, trap_req);
    return stat;
    }
//printf (">>> write *%04o -> TRAP\r\n", pa & 07777);
return SCPE_NXM;
}

/* Calculate interrupt outstanding */

int32 calc_ints (int32 nipl, int32 trq)
{
int32 i;

for (i = IPL_HLVL - 1; i > nipl; i--) {
    if (int_req[i])
        return (trq | TRAP_INT);
    }
return (trq & ~TRAP_INT);
}

/* Find vector for highest priority interrupt */

int32 get_vector (int32 nipl)
{
int32 i, j, t, vec;

for (i = IPL_HLVL - 1; i > nipl; i--) {                 /* loop thru lvls */
    t = int_req[i];                                     /* get level */
    for (j = 0; t && (j < 32); j++) {                   /* srch level */
        if ((t >> j) & 1) {                             /* irq found? */
            int_req[i] = int_req[i] & ~(1u << j);       /* clr irq */
            if (int_ack[i][j])
                vec = int_ack[i][j]();
            else vec = int_vec[i][j];
            return vec;                                 /* return vector */
            }                                           /* end if t */
        }                                               /* end for j */
    }                                                   /* end for i */
return 0;
}

/* Read and write Unibus map registers

   In any even/odd pair
   even = low 16b, bit <0> clear
   odd  = high 6b

   The Unibus map is stored as an array of longwords.
   These routines are only reachable if a Unibus map is configured.
*/

t_stat ubm_rd (int32 *data, int32 addr, int32 access)
{
int32 pg = (addr >> 2) & UBM_M_PN;

*data = (addr & 2)? ((ub_map[pg] >> 16) & 077):
    (ub_map[pg] & 0177776);
return SCPE_OK;
}

t_stat ubm_wr (int32 data, int32 addr, int32 access)
{
int32 sc, pg = (addr >> 2) & UBM_M_PN;

if (access == WRITEB) {
    sc = (addr & 3) << 3;
    ub_map[pg] = (ub_map[pg] & ~(0377 << sc)) |
        ((data & 0377) << sc);
    }
else {
    sc = (addr & 2) << 3;
    ub_map[pg] = (ub_map[pg] & ~(0177777 << sc)) |
        ((data & 0177777) << sc);
    }
ub_map[pg] = ub_map[pg] & 017777776;
return SCPE_OK;
}

/* Mapped memory access routines for DMA devices */

#define BUSMASK         ((UNIBUS)? UNIMASK: PAMASK)

/* Map I/O address to memory address - caller checks cpu_bme */

uint32 Map_Addr (uint32 ba)
{
int32 pg = UBM_GETPN (ba);                              /* map entry */
int32 off = UBM_GETOFF (ba);                            /* offset */

if (pg != UBM_M_PN)                                     /* last page? */
    uba_last = (ub_map[pg] + off) & PAMASK;             /* no, use map */
else uba_last = (IOPAGEBASE + off) & PAMASK;            /* yes, use fixed */
return uba_last;
}

/* I/O buffer routines, aligned access

   Map_ReadB    -       fetch byte buffer from memory
   Map_ReadW    -       fetch word buffer from memory
   Map_WriteB   -       store byte buffer into memory
   Map_WriteW   -       store word buffer into memory

   These routines are used only for Unibus and Qbus devices.
   Massbus devices have their own IO routines.  As a result,
   the historic 'map' parameter is no longer needed.

   - In a U18 configuration, the map is always disabled.
     Device addresses are trimmed to 18b.
   - In a U22 configuration, the map is always configured
     (although it may be disabled).  Device addresses are
     trimmed to 18b.
   - In a Qbus configuration, the map is always disabled.
     Device addresses are trimmed to 22b.
*/

int32 Map_ReadB (uint32 ba, int32 bc, uint8 *buf)
{
uint32 alim, lim, ma;

ba = ba & BUSMASK;                                      /* trim address */
lim = ba + bc;
if (cpu_bme) {                                          /* map enabled? */
    for ( ; ba < lim; ba++) {                           /* by bytes */
        ma = Map_Addr (ba);                             /* map addr */
        if (!ADDR_IS_MEM (ma))                          /* NXM? err */
            return (lim - ba);
        if (ma & 1)                                     /* get byte */
            *buf++ = (M[ma >> 1] >> 8) & 0377;
        else *buf++ = M[ma >> 1] & 0377;
        }
    return 0;
    }
else {                                                  /* physical */
    if (ADDR_IS_MEM (lim))                              /* end ok? */
        alim = lim;
    else if (ADDR_IS_MEM (ba))                          /* no, strt ok? */
        alim = cpu_memsize;
    else return bc;                                     /* no, err */
    for ( ; ba < alim; ba++) {                          /* by bytes */
        if (ba & 1)
            *buf++ = (M[ba >> 1] >> 8) & 0377;          /* get byte */
        else *buf++ = M[ba >> 1] & 0377;
        }
    return (lim - alim);
    }
}

int32 Map_ReadW (uint32 ba, int32 bc, uint16 *buf)
{
uint32 alim, lim, ma;

ba = (ba & BUSMASK) & ~01;                              /* trim, align addr */
lim = ba + (bc & ~01);
if (cpu_bme) {                                          /* map enabled? */
    for (; ba < lim; ba = ba + 2) {                     /* by words */
        ma = Map_Addr (ba);                             /* map addr */
        if (!ADDR_IS_MEM (ma))                          /* NXM? err */
            return (lim - ba);
        *buf++ = M[ma >> 1];
        }
    return 0;
    }
else {                                                  /* physical */
    if (ADDR_IS_MEM (lim))                              /* end ok? */
        alim = lim;
    else if (ADDR_IS_MEM (ba))                          /* no, strt ok? */
        alim = cpu_memsize;
    else return bc;                                     /* no, err */
    for ( ; ba < alim; ba = ba + 2) {                   /* by words */
        *buf++ = M[ba >> 1];
        }
    return (lim - alim);
    }
}

int32 Map_WriteB (uint32 ba, int32 bc, uint8 *buf)
{
uint32 alim, lim, ma;

ba = ba & BUSMASK;                                      /* trim address */
lim = ba + bc;
if (cpu_bme) {                                          /* map enabled? */
    for ( ; ba < lim; ba++) {                           /* by bytes */
        ma = Map_Addr (ba);                             /* map addr */
        if (!ADDR_IS_MEM (ma))                          /* NXM? err */
            return (lim - ba);
        if (ma & 1) M[ma >> 1] = (M[ma >> 1] & 0377) |
            ((uint16) *buf++ << 8);
        else M[ma >> 1] = (M[ma >> 1] & ~0377) | *buf++;
        }
    return 0;
    }
else {                                                  /* physical */
    if (ADDR_IS_MEM (lim))                              /* end ok? */
        alim = lim;
    else if (ADDR_IS_MEM (ba))                          /* no, strt ok? */
        alim = cpu_memsize;
    else return bc;                                     /* no, err */
    for ( ; ba < alim; ba++) {                          /* by bytes */
        if (ba & 1)
            M[ba >> 1] = (M[ba >> 1] & 0377) | ((uint16) *buf++ << 8);
        else M[ba >> 1] = (M[ba >> 1] & ~0377) | *buf++;
        }
    return (lim - alim);
    }
}

int32 Map_WriteW (uint32 ba, int32 bc, uint16 *buf)
{
uint32 alim, lim, ma;

ba = (ba & BUSMASK) & ~01;                              /* trim, align addr */
lim = ba + (bc & ~01);
if (cpu_bme) {                                          /* map enabled? */
    for (; ba < lim; ba = ba + 2) {                     /* by words */
        ma = Map_Addr (ba);                             /* map addr */
        if (!ADDR_IS_MEM (ma))                          /* NXM? err */
            return (lim - ba);
        M[ma >> 1] = *buf++;
        }
    return 0;
    }
else {                                                  /* physical */
    if (ADDR_IS_MEM (lim))                              /* end ok? */
        alim = lim;
    else if (ADDR_IS_MEM (ba))                          /* no, strt ok? */
        alim = cpu_memsize;
    else return bc;                                     /* no, err */
    for ( ; ba < alim; ba = ba + 2) {                   /* by words */
        M[ba >> 1] = *buf++;
        }
    return (lim - alim);
    }
}

/* Build tables from device list */

t_stat build_dib_tab (void)
{
int32 i;
DEVICE *dptr;
DIB *dibp;
t_stat r;

init_ubus_tab ();                                       /* init Unibus tables */
init_mbus_tab ();                                       /* init Massbus tables */
for (i = 0; i < 7; i++)                                 /* seed PIRQ intr */
    int_vec[i + 1][pirq_bit[i]] = VEC_PIRQ;
if (r = cpu_build_dib ())                               /* build CPU entries */
    return r;
for (i = 0; (dptr = sim_devices[i]) != NULL; i++) {     /* loop thru dev */
    dibp = (DIB *) dptr->ctxt;                          /* get DIB */
    if (dibp && !(dptr->flags & DEV_DIS)) {             /* defined, enabled? */
        if (dptr->flags & DEV_MBUS) {                   /* Massbus? */
            if (r = build_mbus_tab (dptr, dibp))        /* add to Mbus tab */
                return r;
            }
        else {                                          /* no, Unibus */
            if (r = build_ubus_tab (dptr, dibp))        /* add to Unibus tab */
                return r;
            }
        }                                               /* end if enabled */
    }                                                   /* end for */
return SCPE_OK;
}
