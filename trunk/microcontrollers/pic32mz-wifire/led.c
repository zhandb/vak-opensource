/*
 * Include processor definitions.
 */
#include "pic32mz.h"

#define MHZ     200             /* CPU clock in MHz. */

/*
 * Main entry point at bd001000.
 * Setup stack pointer and $gp registers, and jump to main().
 */
asm ("          .section .startup,code");
asm ("          .globl _start");
asm ("          .type _start, function");
asm ("_start:   la      $sp, _estack");
asm ("          la      $ra, main");
asm ("          la      $gp, _gp");
asm ("          jr      $ra");
asm ("          .section .text,code");

/*
 * Secondary entry point at bd000000.
 */
asm ("          .section .exception,code");
asm ("          .org    0xf8");
asm ("          .word   0x9d000000");           /* EBase value. */
asm ("          .word   -1");                   /* Image header pointer. */
asm ("          .section .text,code");

/*
 * Delay for a given number of microseconds.
 * The processor has a 32-bit hardware Count register,
 * which increments at half CPU rate.
 * We use it to get a precise delay.
 */
void udelay (unsigned usec)
{
    unsigned now = mfc0 (C0_COUNT, 0);
    unsigned final = now + usec * MHZ / 2;

    for (;;) {
        now = mfc0 (C0_COUNT, 0);

        /* This comparison is valid only when using a signed type. */
        if ((int) (now - final) >= 0)
            break;
    }
}

int main()
{
    /* Use pin PG6 as output: LED control. */
    TRISGCLR = 1 << 6;

    while (1) {
        /* Invert pin PG6. */
        PORTGINV = 1 << 6;

        /* Delay. */
        udelay (500000);
    }
}