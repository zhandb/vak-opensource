КАС2211 Файл TEST : Лист 1 Дата 10.3.89 (0:3)


Тг   Адрес Код:		Строка	Текст

				1		.ОБЛ	ТЕС(03500)
				2	ОСТ	.ГЛОБ
				3	Е100	.ГЛОБ
				4	ТЕРМ	.ГЛОБ
				5	НОВРАБ	.ГЛОБ
				6	ВСЕЕД	.ГЛОБ
				7	ШАШКИ	.ГЛОБ
				8	ОДИН	.ГЛОБ
				9	ДВА	.ГЛОБ
   0003500			10	ТЕСТ	.ВХОД
00 0003500 04 074 0003501	11		ПА	:1П,4
	   01 074 3777600	12		ПА	-0200,1
00 0003501 01 002 0000000 @	13	:1	СН	ДВА,1
	   01 012 0000000 @	14		СР	ДВА,1
00 0003502 00 050 0003503	15		УР	:2П
	   05 031 0000000 @	16		ПВ	ОСТ,5
00 0003503 01 033 0003501	17	:2	КЦ	:1Н,1
	   00 102 0000001	18		СНЦ	1
00 0003504 00 000 0112357	19		ЗЧ	РЯ
	   01 074 3777701	20		ПА	-077,1
00 0003505 02 074 0000000	21		ПА	0,2
	   04 074 0003510	22		ПА	СД1,4
00 0003506 05 074 0003512	23		ПА	СД1+2,5
	   03 074 0000077	24		ПА	077,3
00 0003507 00 002 0000000 @	25		СН	Е100
	   00 000 0112362	26		ЗЧ	РЯ2
00 0003510 00 102 0000001	27	СД1	СНЦ	1
	   02 077 036 2000	28		ОД	1024,2
00 0003511 00 012 0112357	29		СР	РЯ
	   00 050 0003513	30		УР	СД2
00 0003512 05 031 0000000 @	31		ПВ	ОСТ,5
	   00 072 0000000
00 0003513 00 077 037 1000	32	СД2	РА	01000
	   04 074 0003513	33		ПА	СД2,4
00 0003514 00 002 0000000 @	34		СН	Е100
	   02 077 026 2000	35		СД	1024,2
00 0003515 00 012 0112362	36		СР	РЯ2
	   00 050 0003517	37		УР	СД3
00 0003516 05 031 0000000 @	38		ПВ	ОСТ,5
	   00 072 0000000
   0003517			39	СД3	
00 0003517 00 002 0000000 @	40		СН	Е100
	   02 077 036 2001	41		ОД	1024+1,2
00 0003520 00 000 0112361	42		ЗЧ	РЯ1
	   00 077 031 0000	43		МР
00 0003521 00 012 0112361	44		СР	РЯ1	
	   00 012 0112357	45		СР	РЯ
00 0003522 00 050 0003523	46		УР	СД5
	   05 031 0000000 @	47		ПВ	ОСТ,5
00 0003523 00 102 0000001	48	СД5	СНЦ	1
	   00 012 0000000 @	49		СР	ВСЕЕД
00 0003524 02 077 036 2000	50		ОД	1024,2
	   00 000 0112361	51		ЗЧ	РЯ1
00 0003525 00 077 031 0000	52		МР
	   00 012 0112361	53		СР	РЯ1
00 0003526 00 012 0112357	54		СР	РЯ
	   00 012 0000000 @	55		СР	ВСЕЕД
00 0003527 00 050 0003530	56		УР	СД6
	   05 031 0000000 @	57		ПВ	ОСТ,5
00 0003530 00 002 0000000 @	58	СД6	СН	Е100
	   00 012 0000000 @	59		СР	ВСЕЕД
00 0003531 02 077 026 2000	60		СД	1024,2
КАС2211 Файл TEST : Лист 2 Дата 10.3.89 (0:3)


Тг   Адрес Код:		Строка	Текст

	   00 000 0112361	61		ЗЧ	РЯ1
00 0003532 00 077 031 0000	62		МР
	   00 012 0112361	63		СР	РЯ1
00 0003533 00 012 0112362	64		СР	РЯ2
	   00 012 0000000 @	65		СР	ВСЕЕД
00 0003534 00 050 0003535	66		УР	СД7
	   05 031 0000000 @	67		ПВ	ОСТ,5
00 0003535 00 002 0000000 @	68	СД7	СН	ВСЕЕД
	   02 077 026 2000	69		СД	1024,2
00 0003536 00 000 0112361	70		ЗЧ	РЯ1
	   00 077 031 0000	71		МР
00 0003537 00 012 0112361	72		СР	РЯ1
	   00 012 0000000 @	73		СР	ВСЕЕД
00 0003540 00 050 0003541	74		УР	СД8
	   05 031 0000000 @	75		ПВ	ОСТ,5
00 0003541 00 002 0000000 @	76	СД8	СН	ВСЕЕД
	   02 077 036 2000	77		ОД	1024,2
00 0003542 00 000 0112361	78		ЗЧ	РЯ1
	   00 077 031 0000	79		МР
00 0003543 00 012 0112361	80		СР	РЯ1
	   00 012 0000000 @	81		СР	ВСЕЕД
00 0003544 00 050 0003545	82		УР	СД9
	   05 031 0000000 @	83		ПВ	ОСТ,5
00 0003545 00 002 0000000 @	84	СД9	СН	ВСЕЕД
	   02 077 026 2000	85		СД	1024,2
00 0003546 00 000 0112361	86		ЗЧ	РЯ1
	   00 002 0000000 @	87		СН	ВСЕЕД
00 0003547 02 077 026 2100	88		СД	1024+0100,2
	   00 077 031 0000	89		МР
00 0003550 00 012 0112361	90		СР	РЯ1
	   00 050 0003552	91		УР	СД10
00 0003551 05 031 0000000 @	92		ПВ	ОСТ,5
	   00 072 0000000
00 0003552 00 002 0000000 @	93	СД10	СН	ВСЕЕД
	   02 077 036 2000	94		ОД	1024,2
00 0003553 00 000 0112361	95		ЗЧ	РЯ1
	   00 002 0000000 @	96		СН	ВСЕЕД
00 0003554 02 077 036 2100	97		ОД	1024+0100,2
	   00 077 031 0000	98		МР
00 0003555 00 012 0112361	99		СР	РЯ1
	   00 050 0003557	100		УР	СДА
00 0003556 05 031 0000000 @	101		ПВ	ОСТ,5
	   00 072 0000000
00 0003557 00 002 0112357	102	СДА	СН	РЯ
	   00 013 0112357	103		ЦС	РЯ
00 0003560 00 000 0112357	104		ЗЧ	РЯ
	   03 075 3777777	105		СА	-1,3
00 0003561 00 102 0000001	106		СНЦ	1
	   03 077 036 2000	107		ОД	1024,3
00 0003562 00 000 0112362	108		ЗЧ	РЯ2
	   02 075 0000001	109		СА	1,2
00 0003563 01 033 0003510	110		КЦ	СД1,1
	   00 030 0003564	111		ПБ	СЛЦ0
00 0003564 01 074 3777701	112	СЛЦ0	ПА	-077,1
	   00 102 0000001	113		СНЦ	1
00 0003565 00 000 0112357	114	ЦС1	ЗЧ	РЯ
	   00 012 0000000 @	115		СР	ВСЕЕД
00 0003566 00 000 0112361	116		ЗЧ	РЯ1
	   00 013 0000000 @	117		ЦС	ВСЕЕД
00 0003567 00 012 0112361	118		СР	РЯ1
	   00 050 0003571	119		УР	ЦС2
00 0003570 05 031 0000000 @	120		ПВ	ОСТ,5
КАС2211 Файл TEST : Лист 3 Дата 10.3.89 (0:3)


Тг   Адрес Код:		Строка	Текст

	   00 072 0000000
00 0003571 00 002 0112357	121	ЦС2	СН	РЯ
	   00 013 0000000 @	122		ЦС	ВСЕЕД
00 0003572 00 012 0112357	123		СР	РЯ
	   00 050 0003574	124		УР	СЛЦ3
00 0003573 05 031 0000000 @	125		ПВ	ОСТ,5
	   00 072 0000000
00 0003574 00 002 0112357	126	СЛЦ3	СН	РЯ
	   00 013 0112357	127		ЦС	РЯ
00 0003575 01 033 0003565	128		КЦ	ЦС1,1
	   00 072 0000000
00 0003576 01 074 3777701	129	НТЖ0	ПА	-077,1
	   04 074 0003600	130		ПА	НТЖ,4
00 0003577 00 102 0000001	131		СНЦ	1
	   00 000 0112357	132		ЗЧ	РЯ
00 0003600 00 002 0112357	133	НТЖ	СН	РЯ
	   00 012 0112357	134		СР	РЯ
00 0003601 00 050 0003602	135		УР	НТЖ5
	   05 031 0000000 @	136		ПВ	ОСТ,5
00 0003602 00 002 0000000 @	137	НТЖ5	СН	ВСЕЕД
	   00 012 0112357	138		СР	РЯ
00 0003603 00 012 0112357	139		СР	РЯ
	   00 012 0000000 @	140		СР	ВСЕЕД
00 0003604 00 050 0003605	141		УР	НТЖ6
	   05 031 0000000 @	142		ПВ	ОСТ,5
00 0003605 00 002 0112357	143	НТЖ6	СН	РЯ
	   00 012 0000000 @	144		СР	ВСЕЕД
00 0003606 00 012 0000000 @	145		СР	ВСЕЕД
	   00 012 0112357	146		СР	РЯ
00 0003607 00 050 0003610	147		УР	НТЖВ
	   05 031 0000000 @	148		ПВ	ОСТ,5
00 0003610 00 002 0112357	149	НТЖВ	СН	РЯ
	   00 013 0112357	150		ЦС	РЯ
00 0003611 00 000 0112357	151		ЗЧ	РЯ
	   01 033 0003600	152		КЦ	НТЖ,1
00 0003612 01 074 3777700	153		ПА	-0100,1
	   04 074 0003613	154		ПА	НТЖ1,4
00 0003613 00 002 0000000 @	155	НТЖ1	СН	ШАШКИ
	   01 072 0000000	156		ПФ	,1
00 0003614 01 077 026 2100	157		СД	1024+0100,1
	   00 000 0112357	158		ЗЧ	РЯ
00 0003615 00 077 031 0000	159		МР
	   00 015 0112357	160		ЛС	РЯ
00 0003616 00 012 0000000 @	161		СР	ШАШКИ
	   00 050 0003620	162		УР	НТЖ2
00 0003617 05 031 0000000 @	163		ПВ	ОСТ,5
	   00 072 0000000
00 0003620 00 002 0000000 @	164	НТЖ2	СН	ШАШКИ
	   01 072 0000000	165		ПФ	,1
00 0003621 01 077 026 2077	166		СД	1024+077,1
	   00 000 0112357	167		ЗЧ	РЯ
00 0003622 00 077 031 0000	168		МР	0
	   00 015 0112357	169		ЛС	РЯ
00 0003623 00 012 0000000 @	170		СР	ШАШКИ
	   00 012 0000000 @	171		СР	ВСЕЕД
00 0003624 00 050 0003625	172		УР	НТЖ3
	   05 031 0000000 @	173		ПВ	ОСТ,5
00 0003625 01 033 0003613	174	НТЖ3	КЦ	НТЖ1,1
	   00 077 002 0070	175		ЧР	070
00 0003626 00 111 0400000	176		ЛУЛ	0400000
	   00 051 0000000 @	177		УН	ТЕРМ
00 0003627 01 074 3777701	178	ЧЕНЕ	ПА	-077,1
КАС2211 Файл TEST : Лист 4 Дата 10.3.89 (0:3)


Тг   Адрес Код:		Строка	Текст

	   04 074 0003627	179		ПА	ЧЕНЕ,4
00 0003630 00 002 0000000 @	180		СН	ШАШКИ
	   00 122 0000000	181		ВЧЛ
00 0003631 00 112 0000040	182		СРЛ	040
	   00 050 0003633	183		УР	ЧЕД
00 0003632 05 031 0000000 @	184		ПВ	ОСТ,5
	   00 072 0000000
00 0003633 01 102 0000077	185	ЧЕД	СНЦ	077,1
	   00 000 0112357	186		ЗЧ	РЯ
00 0003634 00 002 0000000 @	187		СН	ВСЕЕД
	   01 077 026 2077	188		СД	1024+077,1
00 0003635 00 022 0112357	189		ВЧ	РЯ
	   00 112 0000100	190		СРЛ	0100
00 0003636 00 050 0003637	191		УР	НЕД
	   05 031 0000000 @	192		ПВ	ОСТ,5
00 0003637 01 102 0000077	193	НЕД	СНЦ	077,1
	   00 112 0000077	194		СРЛ	077
00 0003640 00 000 0112357	195		ЗЧ	РЯ
	   00 002 0000000 @	196		СН	ВСЕЕД
00 0003641 01 077 026 2077	197		СД	1024+077,1
	   00 023 0112357	198		ВН	РЯ
00 0003642 00 112 0000100	199		СРЛ	0100
	   00 050 0003644	200		УР	ЧД
00 0003643 05 031 0000000 @	201		ПВ	ОСТ,5
	   00 072 0000000
00 0003644 00 002 0000000 @	202	ЧД	СН	ВСЕЕД
	   01 077 026 2077	203		СД	1024+077,1
00 0003645 00 000 0112357	204		ЗЧ	РЯ
	   00 122 0007777	205		ВЧЛ	07777
00 0003646 00 000 0112361	206		ЗЧ	РЯ1
	   00 002 0112357	207		СН	РЯ
00 0003647 00 023 0112361	208		ВН	РЯ1
	   00 111 0000177	209		ЛУЛ	0177
00 0003650 00 112 0000100	210		СРЛ	0100
	   00 050 0003652	211		УР	ЧД0
00 0003651 05 031 0000000 @	212		ПВ	ОСТ,5
	   00 072 0000000
00 0003652 01 033 0003633	213	ЧД0	КЦ	ЧЕД,1
	   00 072 0000000
00 0003653 01 074 3777701	214	СБОР	ПА	-077,1
	   04 074 0003654	215		ПА	СБ,4
00 0003654 00 002 0000000 @	216	СБ	СН	ВСЕЕД
	   01 077 026 2000	217		СД	1024,1
00 0003655 00 000 0112357	218		ЗЧ	РЯ
	   00 077 031 0000	219		МР
00 0003656 00 000 0112361	220		ЗЧ	РЯ1
	   00 122 0000000	221		ВЧЛ
00 0003657 00 077 040 0002	222		УИ	2
	   00 002 0000000 @	223		СН	ВСЕЕД
00 0003660 00 020 0112357	224		СБ	РЯ
	   02 077 026 2000	225		СД	1024,2
00 0003661 00 000 0112357	226		ЗЧ	РЯ
	   00 002 0000000 @	227		СН	ВСЕЕД
00 0003662 00 020 0112361	228		СБ	РЯ1
	   00 015 0112357	229		ЛС	РЯ
00 0003663 00 012 0000000 @	230		СР	ВСЕЕД
	   00 050 0003665	231		УР	СБ1
00 0003664 05 031 0000000 @	232		ПВ	ОСТ,5
	   00 072 0000000
   0003665			233	СБ1	.ВХОД
00 0003665 00 002 0000000 @	234		СН	ШАШКИ
	   01 077 026 2000	235		СД	1024,1
КАС2211 Файл TEST : Лист 5 Дата 10.3.89 (0:4)


Тг   Адрес Код:		Строка	Текст

00 0003666 00 000 0112357	236		ЗЧ	РЯ
	   00 012 0000000 @	237		СР	ВСЕЕД
00 0003667 00 000 0112361	238		ЗЧ	РЯ1
	   00 122 0000000	239		ВЧЛ
00 0003670 00 077 040 0002	240		УИ	2
	   00 002 0000000 @	241		СН	ВСЕЕД
00 0003671 00 020 0112357	242		СБ	РЯ
	   02 077 026 2000	243		СД	1024,2
00 0003672 00 000 0112357	244		ЗЧ	РЯ
	   00 002 0000000 @	245		СН	ВСЕЕД
00 0003673 00 020 0112361	246		СБ	РЯ1
	   00 015 0112357	247		ЛС	РЯ
00 0003674 00 012 0000000 @	248		СР	ВСЕЕД
	   00 050 0003676	249		УР	РБ
00 0003675 05 031 0000000 @	250		ПВ	ОСТ,5
	   00 072 0000000
00 0003676 00 002 0000000 @	251	РБ	СН	ШАШКИ
	   01 077 026 2000	252		СД	1024,1
00 0003677 00 000 0112357	253		ЗЧ	РЯ
	   00 012 0000000 @	254		СР	ВСЕЕД
00 0003700 00 000 0112361	255		ЗЧ	РЯ1
	   00 122 0000000	256		ВЧЛ
00 0003701 00 077 040 0002	257		УИ	2
	   00 002 0000000 @	258		СН	ШАШКИ
00 0003702 00 020 0112357	259		СБ	РЯ
	   02 077 026 2000	260		СД	1024,2
00 0003703 00 000 0112362	261		ЗЧ	РЯ2
	   00 002 0000000 @	262		СН	ШАШКИ
00 0003704 00 020 0112361	263		СБ	РЯ1
	   00 015 0112362	264		ЛС	РЯ2
00 0003705 00 000 0112362	265		ЗЧ	РЯ2
	   02 077 036 2000	266		ОД	1024,2
00 0003706 00 021 0112357	267		РБ	РЯ
	   00 000 0112357	268		ЗЧ	РЯ
00 0003707 00 002 0112362	269		СН	РЯ2
	   00 021 0112361	270		РБ	РЯ1
00 0003710 00 015 0112357	271		ЛС	РЯ
	   00 012 0000000 @	272		СР	ШАШКИ
00 0003711 00 050 0003712	273		УР	РБ1
	   05 031 0000000 @	274		ПВ	ОСТ,5
00 0003712 01 033 0003654	275	РБ1	КЦ	СБ,1
	   01 074 3777717	276		ПА	-061,1
00 0003713 02 074 3777717	277		ПА	-061,2
	   03 074 3777777	278		ПА	-1,3
00 0003714 00 002 0000000 @	279	СУМН1	СН	ВСЕЕД
	   01 077 026 2077	280		СД	1024+077,1
00 0003715 00 077 036 2001	281		ОД	1024+1
	   00 015 0000000 @	282		ЛС	ОДИН
00 0003716 00 000 0112357	283		ЗЧ	РЯ
	   00 002 0000000 @	284		СН	ВСЕЕД
00 0003717 01 077 026 2077	285		СД	1024+077,1
	   00 015 0000000 @	286		ЛС	ДВА
00 0003720 00 000 0112361	287		ЗЧ	РЯ1
	   04 074 0003720	288		ПА	СУМН1+4,4
00 0003721 05 074 0003724	289		ПА	СЛ,5
	   00 002 0000000 @	290		СН	ОДИН
00 0003722 00 124 0112357	291		АСФ	РЯ
	   00 012 0112361	292		СР	РЯ1
00 0003723 00 051 0000000 @	293		УН	ОСТ
	   00 072 0000000
00 0003724 04 074 0003724	294	СЛ	ПА	СЛ,4
	   05 074 0003731	295		ПА	АВ,5
КАС2211 Файл TEST : Лист 6 Дата 10.3.89 (0:4)


Тг   Адрес Код:		Строка	Текст

00 0003725 00 002 0112357	296		СН	РЯ
	   00 124 0000000 @	297		АСФ	ОДИН
00 0003726 00 012 0112361	298		СР	РЯ1
	   00 051 0000000 @	299		УН	ОСТ
00 0003727 03 033 0003737	300		КЦ	УМН1,3
	   00 077 002 0070	301		ЧР	070
00 0003730 00 111 0400000	302		ЛУЛ	0400000
	   00 051 0000000 @	303		УН	ТЕРМ
00 0003731 04 074 0003731	304	АВ	ПА	АВ,4
	   05 074 0003734	305		ПА	ОВ,5
00 0003732 00 002 0112361	306		СН	РЯ1
	   00 125 0000000 @	307		АВФ	ОДИН
00 0003733 00 012 0112357	308		СР	РЯ
	   00 051 0000000 @	309		УН	ОСТ
00 0003734 04 074 0003734	310	ОВ	ПА	ОВ,4
	   05 074 0003737	311		ПА	УМН1,5
00 0003735 00 002 0000000 @	312		СН	ОДИН
	   00 126 0112361	313		ОВФ	РЯ1
00 0003736 00 012 0112357	314		СР	РЯ
	   00 051 0000000 @	315		УН	ОСТ
00 0003737 05 074 0003742	316	УМН1	ПА	УМН2,5
	   00 002 0000000 @	317		СН	ОДИН
00 0003740 00 137 0112357	318		АУФ	РЯ
	   00 012 0112357	319		СР	РЯ
00 0003741 00 051 0000000 @	320		УН	ОСТ
	   00 072 0000000
00 0003742 05 074 0003750	321	УМН2	ПА	СУМН2,5
	   00 002 0112357	322		СН	РЯ
00 0003743 00 137 0000000 @	323		АУФ	ОДИН
	   00 012 0112357	324		СР	РЯ
00 0003744 00 051 0000000 @	325		УН	ОСТ
	   00 072 0000000
00 0003745 04 074 0003745	326	ДЕЛ	ПА	ДЕЛ,4
	   05 074 0003750	327		ПА	СУМН2,5
00 0003746 00 002 0112357	328		СН	РЯ
	   00 016 0000000 @	329		АД	ОДИН
00 0003747 00 012 0112357	330		СР	РЯ
	   00 051 0000000 @	331		УН	ОСТ
00 0003750 01 033 0003714	332	СУМН2	КЦ	СУМН1,1
	   00 010 0112016	333		СЧ	ШРАБОТ
00 0003751 00 051 0000000 @	334		УН	НОВРАБ
	   01 074 3777716	335		ПА	-062,1
00 0003752 00 102 3777777	336		СНЦ	-1
	   00 077 026 2001	337		СД	1024+1
00 0003753 00 015 0000000 @	338		ЛС	ОДИН
	   00 000 0112362	339		ЗЧ	РЯ2
00 0003754 00 102 3777777	340	ДЕЛ1	СНЦ	-1
	   01 077 036 1777	341		ОД	1024-1,1
00 0003755 01 077 026 2000	342		СД	1024,1
	   00 000 0112361	343		ЗЧ	РЯ1
00 0003756 00 015 0000000 @	344		ЛС	ОДИН
	   00 000 0112357	345		ЗЧ	РЯ
00 0003757 01 077 044 0002	346		ПИ	2,1
	   00 002 0112361	347		СН	РЯ1
00 0003760 00 122 0000000	348		ВЧЛ
	   00 077 040 0004	349		УИ	4
00 0003761 00 102 0000001	350		СНЦ	1
	   00 077 036 2063	351		ОД	1024+063
00 0003762 00 000 0112361	352		ЗЧ	РЯ1
	   00 072 0000000
00 0003763 04 077 045 0002	353	ДЕЛ2	СИ	2,4
	   00 002 0112361	354		СН	РЯ1
КАС2211 Файл TEST : Лист 7 Дата 10.3.89 (0:4)


Тг   Адрес Код:		Строка	Текст

00 0003764 04 077 026 2000	355		СД	1024,4
	   00 015 0112361	356		ЛС	РЯ1
00 0003765 00 000 0112361	357		ЗЧ	РЯ1
	   02 043 0003763	358		ИМЕ	ДЕЛ2,2
00 0003766 00 015 0000000 @	359		ЛС	ОДИН
	   00 000 0112361	360		ЗЧ	РЯ1
00 0003767 04 031 0003770	361		ПВ	ДЕЛ4,4
	   00 072 0000000
00 0003770 00 002 0112362	362	ДЕЛ4	СН	РЯ2
	   00 016 0112357	363		АД	РЯ
00 0003771 00 012 0112361	364		СР	РЯ1
	   00 050 0003776	365		УР	ДЕЛ3
00 0003772 00 002 0112362	366		СН	РЯ2
	   00 016 0112357	367		АД	РЯ
00 0003773 00 113 0000001	368		ЦСЛ	1
	   00 012 0112361	369		СР	РЯ1
00 0003774 00 111 3777777	370		ЛУЛ	-1
	   00 050 0003776	371		УР	ДЕЛ3
00 0003775 05 031 0000000 @	372		ПВ	ОСТ,5
	   00 072 0000000
00 0003776 01 033 0003754	373	ДЕЛ3	КЦ	ДЕЛ1,1
	   04 074 0003777	374		ПА	П0,4
00 0003777 01 074 3777001	375	П0	ПА	-0777,1
	   00 002 0000000 @	376		СН	ОДИН
00 0004000 00 000 0112357	377		ЗЧ	РЯ
	   00 000 0112361	378		ЗЧ	РЯ1
00 0004001 05 074 0004004	379	П1	ПА	П2,5
	   00 002 0000000 @	380		СН	ОДИН
00 0004002 00 137 0112357	381		АУФ	РЯ
	   00 012 0112357	382		СР	РЯ
00 0004003 00 051 0000000 @	383		УН	ОСТ
	   00 072 0000000
00 0004004 05 074 0004007	384	П2	ПА	П3,5
	   00 002 0112357	385		СН	РЯ
00 0004005 00 137 0000000 @	386		АУФ	ОДИН
	   00 012 0112357	387		СР	РЯ
00 0004006 00 051 0000000 @	388		УН	ОСТ
	   00 072 0000000
00 0004007 05 074 0004012	389	П3	ПА	П4,5
	   00 002 0000000 @	390		СН	ОДИН
00 0004010 00 137 0112361	391		АУФ	РЯ1
	   00 012 0112361	392		СР	РЯ1
00 0004011 00 051 0000000 @	393		УН	ОСТ
	   00 072 0000000
00 0004012 05 074 0004015	394	П4	ПА	П5,5
	   00 002 0112361	395		СН	РЯ1
00 0004013 00 137 0000000 @	396		АУФ	ОДИН
	   00 012 0112361	397		СР	РЯ1
00 0004014 00 051 0000000 @	398		УН	ОСТ
	   00 072 0000000
00 0004015 05 074 0004020	399	П5	ПА	П6,5
	   00 002 0112357	400		СН	РЯ
00 0004016 00 016 0000000 @	401		АД	ОДИН
	   00 012 0112357	402		СР	РЯ
00 0004017 00 051 0000000 @	403		УН	ОСТ
	   00 072 0000000
00 0004020 05 074 0004023	404	П6	ПА	П7,5
	   00 002 0000000 @	405		СН	ОДИН
00 0004021 00 016 0112361	406		АД	РЯ1
	   00 012 0112357	407		СР	РЯ
00 0004022 00 051 0000000 @	408		УН	ОСТ
	   00 072 0000000
КАС2211 Файл TEST : Лист 8 Дата 10.3.89 (0:4)


Тг   Адрес Код:		Строка	Текст

00 0004023 05 074 0004026	409	П7	ПА	П10,5
	   00 002 0112361	410		СН	РЯ1
00 0004024 00 016 0000000 @	411		АД	ОДИН
	   00 012 0112361	412		СР	РЯ1
00 0004025 00 051 0000000 @	413		УН	ОСТ
	   00 072 0000000
00 0004026 05 074 0004031	414	П10	ПА	П11,5
	   00 002 0000000 @	415		СН	ОДИН
00 0004027 00 016 0112361	416		АД	РЯ1
	   00 012 0112357	417		СР	РЯ
00 0004030 00 051 0000000 @	418		УН	ОСТ
	   00 072 0000000
00 0004031 00 002 0112357	419	П11	СН	РЯ
	   00 073 0000000 @	420		ИК	ОДИН
00 0004032 00 077 034 2000	421		КС	1024
	   00 000 0112357	422		ЗЧ	РЯ
00 0004033 00 002 0112361	423		СН	РЯ1
	   00 073 0000000 @	424		ИК	ОДИН
00 0004034 00 077 035 2000	425		КВ	1024
	   00 000 0112361	426		ЗЧ	РЯ1
00 0004035 01 033 0004001	427		КЦ	П1,1
	   00 030 0000000 @	428		ПБ	НОВРАБ
				429		.ВСТ	-V-
				585		.КНЦ

Начало трансляции	00:03:08.
Конец  трансляции	00:04:24.
Транслировано строк	585
