
user/target/riscv64gc-unknown-none-elf/debug/initproc:	file format elf64-littleriscv

Disassembly of section .text:

0000000000010000 <_start>:
   10000: 75 71        	addi	sp, sp, -144
   10002: 06 e5        	sd	ra, 136(sp)
   10004: 22 e1        	sd	s0, 128(sp)
   10006: 00 09        	addi	s0, sp, 144

0000000000010008 <.Lpcrel_hi0>:
   10008: 17 35 01 00  	auipc	a0, 19
   1000c: 13 05 05 21  	addi	a0, a0, 528
   10010: 97 60 00 00  	auipc	ra, 6
   10014: e7 80 a0 db  	jalr	-582(ra)
   10018: aa 85        	mv	a1, a0
   1001a: 23 3c b4 f6  	sd	a1, -136(s0)
   1001e: 23 34 a4 fc  	sd	a0, -56(s0)
   10022: 23 3c a4 fc  	sd	a0, -40(s0)
   10026: 81 45        	li	a1, 0
   10028: 23 0b b4 fc  	sb	a1, -42(s0)
   1002c: 03 46 64 fd  	lbu	a2, -42(s0)
   10030: 85 45        	li	a1, 1
   10032: 97 20 00 00  	auipc	ra, 2
   10036: e7 80 00 85  	jalr	-1968(ra)
   1003a: aa 85        	mv	a1, a0
   1003c: 23 30 b4 f8  	sd	a1, -128(s0)
   10040: 23 30 a4 fe  	sd	a0, -32(s0)
   10044: 09 a0        	j	0x10046 <.Lpcrel_hi0+0x3e>
   10046: 03 35 84 f7  	ld	a0, -136(s0)
   1004a: 21 05        	addi	a0, a0, 8
   1004c: 89 45        	li	a1, 2
   1004e: a3 0b b4 fc  	sb	a1, -41(s0)
   10052: 83 45 74 fd  	lbu	a1, -41(s0)
   10056: 97 20 00 00  	auipc	ra, 2
   1005a: e7 80 80 80  	jalr	-2040(ra)
   1005e: 83 35 04 f8  	ld	a1, -128(s0)
   10062: 63 08 b5 00  	beq	a0, a1, 0x10072 <.Lpcrel_hi0+0x6a>
   10066: 09 a0        	j	0x10068 <.Lpcrel_hi0+0x60>
   10068: 97 20 00 00  	auipc	ra, 2
   1006c: e7 80 20 8c  	jalr	-1854(ra)
   10070: d9 bf        	j	0x10046 <.Lpcrel_hi0+0x3e>
   10072: 83 35 04 f8  	ld	a1, -128(s0)
   10076: 03 35 84 f7  	ld	a0, -136(s0)
   1007a: 13 06 85 00  	addi	a2, a0, 8
   1007e: 41 05        	addi	a0, a0, 16
   10080: 23 34 a4 fe  	sd	a0, -24(s0)
   10084: 23 38 c4 fa  	sd	a2, -80(s0)
   10088: 23 30 b4 fc  	sd	a1, -64(s0)
   1008c: 23 3c a4 fa  	sd	a0, -72(s0)
   10090: 03 35 04 fc  	ld	a0, -64(s0)
   10094: 23 3c a4 f8  	sd	a0, -104(s0)
   10098: 03 35 84 fb  	ld	a0, -72(s0)
   1009c: 23 38 a4 f8  	sd	a0, -112(s0)
   100a0: 03 35 04 fb  	ld	a0, -80(s0)
   100a4: 23 34 a4 f8  	sd	a0, -120(s0)
   100a8: 13 05 84 f8  	addi	a0, s0, -120
   100ac: 23 38 a4 f6  	sd	a0, -144(s0)
   100b0: 97 50 00 00  	auipc	ra, 5
   100b4: e7 80 a0 e4  	jalr	-438(ra)

00000000000100b8 <.Lpcrel_hi1>:
   100b8: 97 b5 00 00  	auipc	a1, 11
   100bc: 93 85 05 16  	addi	a1, a1, 352
   100c0: 23 30 b4 fa  	sd	a1, -96(s0)
   100c4: 21 66        	lui	a2, 8
   100c6: 23 34 c4 fa  	sd	a2, -88(s0)
   100ca: 97 50 00 00  	auipc	ra, 5
   100ce: e7 80 40 43  	jalr	1076(ra)
   100d2: 03 35 04 f7  	ld	a0, -144(s0)
   100d6: 97 50 00 00  	auipc	ra, 5
   100da: e7 80 e0 a8  	jalr	-1394(ra)
   100de: 97 00 00 00  	auipc	ra, 0
   100e2: e7 80 40 1b  	jalr	436(ra)
   100e6: 97 10 00 00  	auipc	ra, 1
   100ea: e7 80 20 55  	jalr	1362(ra)

00000000000100ee <_ZN4core3fmt9Arguments6new_v117h643521f895d139ceE>:
   100ee: 55 71        	addi	sp, sp, -208
   100f0: 86 e5        	sd	ra, 200(sp)
   100f2: a2 e1        	sd	s0, 192(sp)
   100f4: 80 09        	addi	s0, sp, 208
   100f6: 23 3c e4 f2  	sd	a4, -200(s0)
   100fa: 23 30 d4 f4  	sd	a3, -192(s0)
   100fe: 23 34 c4 f4  	sd	a2, -184(s0)
   10102: 23 38 b4 f4  	sd	a1, -176(s0)
   10106: 23 3c a4 f4  	sd	a0, -168(s0)
   1010a: 23 30 b4 fc  	sd	a1, -64(s0)
   1010e: 23 34 c4 fc  	sd	a2, -56(s0)
   10112: 23 38 d4 fc  	sd	a3, -48(s0)
   10116: 23 3c e4 fc  	sd	a4, -40(s0)
   1011a: 63 6b e6 00  	bltu	a2, a4, 0x10130 <.Lpcrel_hi0>
   1011e: 09 a0        	j	0x10120 <_ZN4core3fmt9Arguments6new_v117h643521f895d139ceE+0x32>
   10120: 83 35 84 f4  	ld	a1, -184(s0)
   10124: 03 35 84 f3  	ld	a0, -200(s0)
   10128: 05 05        	addi	a0, a0, 1
   1012a: 63 7f b5 00  	bgeu	a0, a1, 0x10148 <.Lpcrel_hi0+0x18>
   1012e: 09 a0        	j	0x10130 <.Lpcrel_hi0>

0000000000010130 <.Lpcrel_hi0>:
   10130: 17 85 00 00  	auipc	a0, 8
   10134: 13 05 05 f1  	addi	a0, a0, -240
   10138: 23 30 a4 fe  	sd	a0, -32(s0)
   1013c: 05 45        	li	a0, 1
   1013e: 23 34 a4 fe  	sd	a0, -24(s0)
   10142: 01 45        	li	a0, 0
   10144: 51 e1        	bnez	a0, 0x101c8 <.Lpcrel_hi6>
   10146: 1d a8        	j	0x1017c <.Lpcrel_hi2>
   10148: 03 35 84 f3  	ld	a0, -200(s0)
   1014c: 83 35 84 f5  	ld	a1, -168(s0)
   10150: 03 36 04 f4  	ld	a2, -192(s0)
   10154: 83 36 84 f4  	ld	a3, -184(s0)
   10158: 03 37 04 f5  	ld	a4, -176(s0)
   1015c: 98 e1        	sd	a4, 0(a1)
   1015e: 94 e5        	sd	a3, 8(a1)

0000000000010160 <.Lpcrel_hi1>:
   10160: 97 86 00 00  	auipc	a3, 8
   10164: 93 86 06 ec  	addi	a3, a3, -320
   10168: 98 62        	ld	a4, 0(a3)
   1016a: 94 66        	ld	a3, 8(a3)
   1016c: 98 f1        	sd	a4, 32(a1)
   1016e: 94 f5        	sd	a3, 40(a1)
   10170: 90 e9        	sd	a2, 16(a1)
   10172: 88 ed        	sd	a0, 24(a1)
   10174: ae 60        	ld	ra, 200(sp)
   10176: 0e 64        	ld	s0, 192(sp)
   10178: 69 61        	addi	sp, sp, 208
   1017a: 82 80        	ret

000000000001017c <.Lpcrel_hi2>:
   1017c: 17 85 00 00  	auipc	a0, 8
   10180: 13 05 45 ec  	addi	a0, a0, -316
   10184: 23 30 a4 f6  	sd	a0, -160(s0)
   10188: 05 45        	li	a0, 1
   1018a: 23 34 a4 f6  	sd	a0, -152(s0)

000000000001018e <.Lpcrel_hi3>:
   1018e: 17 85 00 00  	auipc	a0, 8
   10192: 13 05 25 e9  	addi	a0, a0, -366
   10196: 0c 61        	ld	a1, 0(a0)
   10198: 08 65        	ld	a0, 8(a0)
   1019a: 23 30 b4 f8  	sd	a1, -128(s0)
   1019e: 23 34 a4 f8  	sd	a0, -120(s0)

00000000000101a2 <.Lpcrel_hi4>:
   101a2: 17 85 00 00  	auipc	a0, 8
   101a6: 13 05 e5 ea  	addi	a0, a0, -338
   101aa: 23 38 a4 f6  	sd	a0, -144(s0)
   101ae: 01 45        	li	a0, 0
   101b0: 23 3c a4 f6  	sd	a0, -136(s0)

00000000000101b4 <.Lpcrel_hi5>:
   101b4: 17 85 00 00  	auipc	a0, 8
   101b8: 93 05 c5 ee  	addi	a1, a0, -276
   101bc: 13 05 04 f6  	addi	a0, s0, -160
   101c0: 97 60 00 00  	auipc	ra, 6
   101c4: e7 80 00 46  	jalr	1120(ra)

00000000000101c8 <.Lpcrel_hi6>:
   101c8: 17 85 00 00  	auipc	a0, 8
   101cc: 93 05 85 e7  	addi	a1, a0, -392
   101d0: 13 05 04 f9  	addi	a0, s0, -112
   101d4: 23 38 a4 f2  	sd	a0, -208(s0)
   101d8: 05 46        	li	a2, 1
   101da: 97 00 00 00  	auipc	ra, 0
   101de: e7 80 c0 01  	jalr	28(ra)
   101e2: 03 35 04 f3  	ld	a0, -208(s0)

00000000000101e6 <.Lpcrel_hi7>:
   101e6: 97 85 00 00  	auipc	a1, 8
   101ea: 93 85 25 ed  	addi	a1, a1, -302
   101ee: 97 60 00 00  	auipc	ra, 6
   101f2: e7 80 20 43  	jalr	1074(ra)

00000000000101f6 <_ZN4core3fmt9Arguments9new_const17hb1950fcb13629bccE>:
   101f6: 59 71        	addi	sp, sp, -112
   101f8: 86 f4        	sd	ra, 104(sp)
   101fa: a2 f0        	sd	s0, 96(sp)
   101fc: 80 18        	addi	s0, sp, 112
   101fe: 23 3c c4 f8  	sd	a2, -104(s0)
   10202: 23 30 b4 fa  	sd	a1, -96(s0)
   10206: 23 34 a4 fa  	sd	a0, -88(s0)
   1020a: 23 30 b4 fe  	sd	a1, -32(s0)
   1020e: 23 34 c4 fe  	sd	a2, -24(s0)
   10212: 05 45        	li	a0, 1
   10214: 63 6e c5 02  	bltu	a0, a2, 0x10250 <.Lpcrel_hi10>
   10218: 09 a0        	j	0x1021a <_ZN4core3fmt9Arguments9new_const17hb1950fcb13629bccE+0x24>
   1021a: 83 35 84 fa  	ld	a1, -88(s0)
   1021e: 03 35 84 f9  	ld	a0, -104(s0)
   10222: 03 36 04 fa  	ld	a2, -96(s0)
   10226: 90 e1        	sd	a2, 0(a1)
   10228: 88 e5        	sd	a0, 8(a1)

000000000001022a <.Lpcrel_hi8>:
   1022a: 17 85 00 00  	auipc	a0, 8
   1022e: 13 05 65 df  	addi	a0, a0, -522
   10232: 10 61        	ld	a2, 0(a0)
   10234: 08 65        	ld	a0, 8(a0)
   10236: 90 f1        	sd	a2, 32(a1)
   10238: 88 f5        	sd	a0, 40(a1)

000000000001023a <.Lpcrel_hi9>:
   1023a: 17 85 00 00  	auipc	a0, 8
   1023e: 13 05 65 e1  	addi	a0, a0, -490
   10242: 88 e9        	sd	a0, 16(a1)
   10244: 01 45        	li	a0, 0
   10246: 88 ed        	sd	a0, 24(a1)
   10248: a6 70        	ld	ra, 104(sp)
   1024a: 06 74        	ld	s0, 96(sp)
   1024c: 65 61        	addi	sp, sp, 112
   1024e: 82 80        	ret

0000000000010250 <.Lpcrel_hi10>:
   10250: 17 85 00 00  	auipc	a0, 8
   10254: 93 05 05 df  	addi	a1, a0, -528
   10258: 13 05 04 fb  	addi	a0, s0, -80
   1025c: 23 38 a4 f8  	sd	a0, -112(s0)
   10260: 05 46        	li	a2, 1
   10262: 97 00 00 00  	auipc	ra, 0
   10266: e7 80 40 f9  	jalr	-108(ra)
   1026a: 03 35 04 f9  	ld	a0, -112(s0)

000000000001026e <.Lpcrel_hi11>:
   1026e: 97 85 00 00  	auipc	a1, 8
   10272: 93 85 a5 e4  	addi	a1, a1, -438
   10276: 97 60 00 00  	auipc	ra, 6
   1027a: e7 80 a0 3a  	jalr	938(ra)

000000000001027e <_ZN4core3ptr47drop_in_place$LT$user_lib..defs..SyscallErr$GT$17h29ad3a6d9f4688d8E>:
   1027e: 01 11        	addi	sp, sp, -32
   10280: 06 ec        	sd	ra, 24(sp)
   10282: 22 e8        	sd	s0, 16(sp)
   10284: 00 10        	addi	s0, sp, 32
   10286: 23 34 a4 fe  	sd	a0, -24(s0)
   1028a: e2 60        	ld	ra, 24(sp)
   1028c: 42 64        	ld	s0, 16(sp)
   1028e: 05 61        	addi	sp, sp, 32
   10290: 82 80        	ret

0000000000010292 <main>:
   10292: 65 71        	addi	sp, sp, -400
   10294: 06 e7        	sd	ra, 392(sp)
   10296: 22 e3        	sd	s0, 384(sp)
   10298: 00 0b        	addi	s0, sp, 400

000000000001029a <.Lpcrel_hi0>:
   1029a: 17 85 00 00  	auipc	a0, 8
   1029e: 93 05 e5 e9  	addi	a1, a0, -354
   102a2: 13 05 04 e9  	addi	a0, s0, -368
   102a6: 23 34 a4 e8  	sd	a0, -376(s0)
   102aa: 05 46        	li	a2, 1
   102ac: 97 00 00 00  	auipc	ra, 0
   102b0: e7 80 a0 f4  	jalr	-182(ra)
   102b4: 03 35 84 e8  	ld	a0, -376(s0)
   102b8: 97 10 00 00  	auipc	ra, 1
   102bc: e7 80 c0 df  	jalr	-516(ra)
   102c0: 97 10 00 00  	auipc	ra, 1
   102c4: e7 80 60 0d  	jalr	214(ra)
   102c8: 23 30 a4 f8  	sd	a0, -128(s0)
   102cc: 03 35 04 f8  	ld	a0, -128(s0)
   102d0: 23 30 a4 ec  	sd	a0, -320(s0)
   102d4: 03 65 44 ec  	lwu	a0, -316(s0)
   102d8: 02 15        	slli	a0, a0, 32
   102da: 83 65 04 ec  	lwu	a1, -320(s0)
   102de: 4d 8d        	or	a0, a0, a1

00000000000102e0 <.Lpcrel_hi1>:
   102e0: 97 85 00 00  	auipc	a1, 8
   102e4: 93 85 85 e6  	addi	a1, a1, -408

00000000000102e8 <.Lpcrel_hi2>:
   102e8: 17 86 00 00  	auipc	a2, 8
   102ec: 93 06 86 e9  	addi	a3, a2, -360
   102f0: 13 06 30 02  	li	a2, 35
   102f4: 97 10 00 00  	auipc	ra, 1
   102f8: e7 80 80 cb  	jalr	-840(ra)
   102fc: 01 25        	sext.w	a0, a0
   102fe: 39 e9        	bnez	a0, 0x10354 <.Lpcrel_hi7+0x20>
   10300: 09 a0        	j	0x10302 <.Lpcrel_hi3>

0000000000010302 <.Lpcrel_hi3>:
   10302: 17 85 00 00  	auipc	a0, 8
   10306: 13 05 65 e9  	addi	a0, a0, -362

000000000001030a <.Lpcrel_hi4>:
   1030a: 97 85 00 00  	auipc	a1, 8
   1030e: 13 86 e5 e9  	addi	a2, a1, -354

0000000000010312 <.Lpcrel_hi5>:
   10312: 97 85 00 00  	auipc	a1, 8
   10316: 13 87 65 ea  	addi	a4, a1, -346
   1031a: b1 45        	li	a1, 12
   1031c: 85 46        	li	a3, 1
   1031e: 81 47        	li	a5, 0
   10320: 23 30 f4 e8  	sd	a5, -384(s0)
   10324: 97 10 00 00  	auipc	ra, 1
   10328: e7 80 60 0e  	jalr	230(ra)

000000000001032c <.Lpcrel_hi6>:
   1032c: 97 85 00 00  	auipc	a1, 8
   10330: 93 85 c5 e8  	addi	a1, a1, -372

0000000000010334 <.Lpcrel_hi7>:
   10334: 17 86 00 00  	auipc	a2, 8
   10338: 93 06 c6 ea  	addi	a3, a2, -340
   1033c: 13 06 30 02  	li	a2, 35
   10340: 97 10 00 00  	auipc	ra, 1
   10344: e7 80 60 cd  	jalr	-810(ra)
   10348: 03 35 04 e8  	ld	a0, -384(s0)
   1034c: ba 60        	ld	ra, 392(sp)
   1034e: 1a 64        	ld	s0, 384(sp)
   10350: 59 61        	addi	sp, sp, 400
   10352: 82 80        	ret
   10354: 01 45        	li	a0, 0
   10356: 23 26 a4 ec  	sw	a0, -308(s0)
   1035a: 97 10 00 00  	auipc	ra, 1
   1035e: e7 80 80 c3  	jalr	-968(ra)
   10362: aa 86        	mv	a3, a0
   10364: 13 05 04 ed  	addi	a0, s0, -304
   10368: fd 55        	li	a1, -1
   1036a: 13 06 c4 ec  	addi	a2, s0, -308
   1036e: 97 10 00 00  	auipc	ra, 1
   10372: e7 80 40 23  	jalr	564(ra)
   10376: 03 45 04 ed  	lbu	a0, -304(s0)
   1037a: 05 89        	andi	a0, a0, 1
   1037c: 49 e9        	bnez	a0, 0x1040e <.Lpcrel_hi10+0x2e>
   1037e: 09 a0        	j	0x10380 <.Lpcrel_hi7+0x4c>
   10380: 03 35 84 ed  	ld	a0, -296(s0)
   10384: 23 34 a4 f2  	sd	a0, -216(s0)
   10388: 93 05 84 f2  	addi	a1, s0, -216
   1038c: 23 3c b4 f8  	sd	a1, -104(s0)

0000000000010390 <.Lpcrel_hi8>:
   10390: 17 75 00 00  	auipc	a0, 7
   10394: 13 05 45 57  	addi	a0, a0, 1396
   10398: 23 30 a4 fa  	sd	a0, -96(s0)
   1039c: 23 34 b4 f8  	sd	a1, -120(s0)
   103a0: 23 38 a4 f8  	sd	a0, -112(s0)
   103a4: 83 36 84 f8  	ld	a3, -120(s0)
   103a8: 03 36 04 f9  	ld	a2, -112(s0)
   103ac: 93 05 c4 ec  	addi	a1, s0, -308
   103b0: 23 3c b4 fa  	sd	a1, -72(s0)

00000000000103b4 <.Lpcrel_hi9>:
   103b4: 17 75 00 00  	auipc	a0, 7
   103b8: 13 05 85 51  	addi	a0, a0, 1304
   103bc: 23 30 a4 fc  	sd	a0, -64(s0)
   103c0: 23 34 b4 fa  	sd	a1, -88(s0)
   103c4: 23 38 a4 fa  	sd	a0, -80(s0)
   103c8: 83 35 84 fa  	ld	a1, -88(s0)
   103cc: 03 35 04 fb  	ld	a0, -80(s0)
   103d0: 23 30 d4 f6  	sd	a3, -160(s0)
   103d4: 23 34 c4 f6  	sd	a2, -152(s0)
   103d8: 23 38 b4 f6  	sd	a1, -144(s0)
   103dc: 23 3c a4 f6  	sd	a0, -136(s0)

00000000000103e0 <.Lpcrel_hi10>:
   103e0: 17 85 00 00  	auipc	a0, 8
   103e4: 93 05 05 e5  	addi	a1, a0, -432
   103e8: 13 05 04 f3  	addi	a0, s0, -208
   103ec: 23 3c a4 e6  	sd	a0, -392(s0)
   103f0: 0d 46        	li	a2, 3
   103f2: 93 06 04 f6  	addi	a3, s0, -160
   103f6: 09 47        	li	a4, 2
   103f8: 97 00 00 00  	auipc	ra, 0
   103fc: e7 80 60 cf  	jalr	-778(ra)
   10400: 03 35 84 e7  	ld	a0, -392(s0)
   10404: 97 10 00 00  	auipc	ra, 1
   10408: e7 80 00 cb  	jalr	-848(ra)
   1040c: a1 b7        	j	0x10354 <.Lpcrel_hi7+0x20>
   1040e: 03 45 14 ed  	lbu	a0, -303(s0)
   10412: a3 03 a4 ee  	sb	a0, -281(s0)
   10416: 93 05 74 ee  	addi	a1, s0, -281
   1041a: 23 3c b4 fc  	sd	a1, -40(s0)

000000000001041e <.Lpcrel_hi11>:
   1041e: 17 05 00 00  	auipc	a0, 0
   10422: 13 05 c5 09  	addi	a0, a0, 156
   10426: 23 30 a4 fe  	sd	a0, -32(s0)
   1042a: 23 34 b4 fc  	sd	a1, -56(s0)
   1042e: 23 38 a4 fc  	sd	a0, -48(s0)
   10432: 83 35 84 fc  	ld	a1, -56(s0)
   10436: 03 35 04 fd  	ld	a0, -48(s0)
   1043a: 23 3c b4 f0  	sd	a1, -232(s0)
   1043e: 23 30 a4 f2  	sd	a0, -224(s0)

0000000000010442 <.Lpcrel_hi12>:
   10442: 17 85 00 00  	auipc	a0, 8
   10446: 93 05 e5 e3  	addi	a1, a0, -450
   1044a: 13 05 84 ee  	addi	a0, s0, -280
   1044e: 23 38 a4 e6  	sd	a0, -400(s0)
   10452: 09 46        	li	a2, 2
   10454: 93 06 84 f1  	addi	a3, s0, -232
   10458: 05 47        	li	a4, 1
   1045a: 97 00 00 00  	auipc	ra, 0
   1045e: e7 80 40 c9  	jalr	-876(ra)
   10462: 03 35 04 e7  	ld	a0, -400(s0)
   10466: 97 10 00 00  	auipc	ra, 1
   1046a: e7 80 e0 c4  	jalr	-946(ra)
   1046e: 97 10 00 00  	auipc	ra, 1
   10472: e7 80 e0 1d  	jalr	478(ra)
   10476: 23 07 a4 fe  	sb	a0, -18(s0)
   1047a: 03 45 e4 fe  	lbu	a0, -18(s0)
   1047e: 93 05 60 08  	li	a1, 134
   10482: 63 0b b5 02  	beq	a0, a1, 0x104b8 <.Lpcrel_hi15+0x18>
   10486: 09 a0        	j	0x10488 <.Lpcrel_hi12+0x46>
   10488: 03 45 e4 fe  	lbu	a0, -18(s0)
   1048c: a3 07 a4 fe  	sb	a0, -17(s0)

0000000000010490 <.Lpcrel_hi13>:
   10490: 17 85 00 00  	auipc	a0, 8
   10494: 13 05 05 c4  	addi	a0, a0, -960

0000000000010498 <.Lpcrel_hi14>:
   10498: 97 85 00 00  	auipc	a1, 8
   1049c: 93 86 85 c6  	addi	a3, a1, -920

00000000000104a0 <.Lpcrel_hi15>:
   104a0: 97 85 00 00  	auipc	a1, 8
   104a4: 13 87 05 e0  	addi	a4, a1, -512
   104a8: 93 05 b0 02  	li	a1, 43
   104ac: 13 06 f4 fe  	addi	a2, s0, -17
   104b0: 97 60 00 00  	auipc	ra, 6
   104b4: e7 80 40 20  	jalr	516(ra)
   104b8: 71 bd        	j	0x10354 <.Lpcrel_hi7+0x20>

00000000000104ba <_ZN63_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..fmt..Debug$GT$3fmt17h68ca32aaed6f3ff4E>:
   104ba: 39 71        	addi	sp, sp, -64
   104bc: 06 fc        	sd	ra, 56(sp)
   104be: 22 f8        	sd	s0, 48(sp)
   104c0: 80 00        	addi	s0, sp, 64
   104c2: 23 30 b4 fc  	sd	a1, -64(s0)
   104c6: 23 30 a4 fe  	sd	a0, -32(s0)
   104ca: 23 34 b4 fe  	sd	a1, -24(s0)
   104ce: 03 45 05 00  	lbu	a0, 0(a0)
   104d2: 23 34 a4 fc  	sd	a0, -56(s0)
   104d6: 03 35 84 fc  	ld	a0, -56(s0)
   104da: 0e 05        	slli	a0, a0, 3

00000000000104dc <.Lpcrel_hi0>:
   104dc: 97 85 00 00  	auipc	a1, 8
   104e0: 93 85 c5 dd  	addi	a1, a1, -548
   104e4: 2e 95        	add	a0, a0, a1
   104e6: 08 61        	ld	a0, 0(a0)
   104e8: 02 85        	jr	a0

00000000000104ea <.LBB0_2>:
   104ea: 00 00        	unimp

00000000000104ec <.Lpcrel_hi1>:
   104ec: 17 85 00 00  	auipc	a0, 8
   104f0: 13 05 c5 1f  	addi	a0, a0, 508
   104f4: 23 38 a4 fc  	sd	a0, -48(s0)
   104f8: 19 45        	li	a0, 6
   104fa: 23 3c a4 fc  	sd	a0, -40(s0)
   104fe: 6f 00 90 27  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010502 <.Lpcrel_hi2>:
   10502: 17 85 00 00  	auipc	a0, 8
   10506: 13 05 c5 1e  	addi	a0, a0, 492
   1050a: 23 38 a4 fc  	sd	a0, -48(s0)
   1050e: 15 45        	li	a0, 5
   10510: 23 3c a4 fc  	sd	a0, -40(s0)
   10514: 6f 00 30 26  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010518 <.Lpcrel_hi3>:
   10518: 17 85 00 00  	auipc	a0, 8
   1051c: 13 05 b5 1d  	addi	a0, a0, 475
   10520: 23 38 a4 fc  	sd	a0, -48(s0)
   10524: 19 45        	li	a0, 6
   10526: 23 3c a4 fc  	sd	a0, -40(s0)
   1052a: 6f 00 d0 24  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001052e <.Lpcrel_hi4>:
   1052e: 17 85 00 00  	auipc	a0, 8
   10532: 13 05 b5 1c  	addi	a0, a0, 459
   10536: 23 38 a4 fc  	sd	a0, -48(s0)
   1053a: 15 45        	li	a0, 5
   1053c: 23 3c a4 fc  	sd	a0, -40(s0)
   10540: 6f 00 70 23  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010544 <.Lpcrel_hi5>:
   10544: 17 85 00 00  	auipc	a0, 8
   10548: 13 05 a5 1b  	addi	a0, a0, 442
   1054c: 23 38 a4 fc  	sd	a0, -48(s0)
   10550: 15 45        	li	a0, 5
   10552: 23 3c a4 fc  	sd	a0, -40(s0)
   10556: 6f 00 10 22  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001055a <.Lpcrel_hi6>:
   1055a: 17 85 00 00  	auipc	a0, 8
   1055e: 13 05 95 1a  	addi	a0, a0, 425
   10562: 23 38 a4 fc  	sd	a0, -48(s0)
   10566: 0d 45        	li	a0, 3
   10568: 23 3c a4 fc  	sd	a0, -40(s0)
   1056c: 6f 00 b0 20  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010570 <.Lpcrel_hi7>:
   10570: 17 85 00 00  	auipc	a0, 8
   10574: 13 05 65 19  	addi	a0, a0, 406
   10578: 23 38 a4 fc  	sd	a0, -48(s0)
   1057c: 15 45        	li	a0, 5
   1057e: 23 3c a4 fc  	sd	a0, -40(s0)
   10582: 6f 00 50 1f  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010586 <.Lpcrel_hi8>:
   10586: 17 85 00 00  	auipc	a0, 8
   1058a: 13 05 55 18  	addi	a0, a0, 389
   1058e: 23 38 a4 fc  	sd	a0, -48(s0)
   10592: 15 45        	li	a0, 5
   10594: 23 3c a4 fc  	sd	a0, -40(s0)
   10598: 6f 00 f0 1d  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001059c <.Lpcrel_hi9>:
   1059c: 17 85 00 00  	auipc	a0, 8
   105a0: 13 05 45 17  	addi	a0, a0, 372
   105a4: 23 38 a4 fc  	sd	a0, -48(s0)
   105a8: 1d 45        	li	a0, 7
   105aa: 23 3c a4 fc  	sd	a0, -40(s0)
   105ae: 6f 00 90 1c  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000105b2 <.Lpcrel_hi10>:
   105b2: 17 85 00 00  	auipc	a0, 8
   105b6: 13 05 55 16  	addi	a0, a0, 357
   105ba: 23 38 a4 fc  	sd	a0, -48(s0)
   105be: 15 45        	li	a0, 5
   105c0: 23 3c a4 fc  	sd	a0, -40(s0)
   105c4: 6f 00 30 1b  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000105c8 <.Lpcrel_hi11>:
   105c8: 17 85 00 00  	auipc	a0, 8
   105cc: 13 05 45 15  	addi	a0, a0, 340
   105d0: 23 38 a4 fc  	sd	a0, -48(s0)
   105d4: 19 45        	li	a0, 6
   105d6: 23 3c a4 fc  	sd	a0, -40(s0)
   105da: 6f 00 d0 19  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000105de <.Lpcrel_hi12>:
   105de: 17 85 00 00  	auipc	a0, 8
   105e2: 13 05 45 14  	addi	a0, a0, 324
   105e6: 23 38 a4 fc  	sd	a0, -48(s0)
   105ea: 19 45        	li	a0, 6
   105ec: 23 3c a4 fc  	sd	a0, -40(s0)
   105f0: 6f 00 70 18  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000105f4 <.Lpcrel_hi13>:
   105f4: 17 85 00 00  	auipc	a0, 8
   105f8: 13 05 45 13  	addi	a0, a0, 308
   105fc: 23 38 a4 fc  	sd	a0, -48(s0)
   10600: 19 45        	li	a0, 6
   10602: 23 3c a4 fc  	sd	a0, -40(s0)
   10606: 6f 00 10 17  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001060a <.Lpcrel_hi14>:
   1060a: 17 85 00 00  	auipc	a0, 8
   1060e: 13 05 45 12  	addi	a0, a0, 292
   10612: 23 38 a4 fc  	sd	a0, -48(s0)
   10616: 19 45        	li	a0, 6
   10618: 23 3c a4 fc  	sd	a0, -40(s0)
   1061c: 6f 00 b0 15  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010620 <.Lpcrel_hi15>:
   10620: 17 85 00 00  	auipc	a0, 8
   10624: 13 05 45 11  	addi	a0, a0, 276
   10628: 23 38 a4 fc  	sd	a0, -48(s0)
   1062c: 19 45        	li	a0, 6
   1062e: 23 3c a4 fc  	sd	a0, -40(s0)
   10632: 6f 00 50 14  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010636 <.Lpcrel_hi16>:
   10636: 17 85 00 00  	auipc	a0, 8
   1063a: 13 05 45 10  	addi	a0, a0, 260
   1063e: 23 38 a4 fc  	sd	a0, -48(s0)
   10642: 1d 45        	li	a0, 7
   10644: 23 3c a4 fc  	sd	a0, -40(s0)
   10648: 6f 00 f0 12  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001064c <.Lpcrel_hi17>:
   1064c: 17 85 00 00  	auipc	a0, 8
   10650: 13 05 55 0f  	addi	a0, a0, 245
   10654: 23 38 a4 fc  	sd	a0, -48(s0)
   10658: 15 45        	li	a0, 5
   1065a: 23 3c a4 fc  	sd	a0, -40(s0)
   1065e: 6f 00 90 11  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010662 <.Lpcrel_hi18>:
   10662: 17 85 00 00  	auipc	a0, 8
   10666: 13 05 45 0e  	addi	a0, a0, 228
   1066a: 23 38 a4 fc  	sd	a0, -48(s0)
   1066e: 19 45        	li	a0, 6
   10670: 23 3c a4 fc  	sd	a0, -40(s0)
   10674: 6f 00 30 10  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010678 <.Lpcrel_hi19>:
   10678: 17 85 00 00  	auipc	a0, 8
   1067c: 13 05 45 0d  	addi	a0, a0, 212
   10680: 23 38 a4 fc  	sd	a0, -48(s0)
   10684: 15 45        	li	a0, 5
   10686: 23 3c a4 fc  	sd	a0, -40(s0)
   1068a: 6f 00 d0 0e  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001068e <.Lpcrel_hi20>:
   1068e: 17 85 00 00  	auipc	a0, 8
   10692: 13 05 35 0c  	addi	a0, a0, 195
   10696: 23 38 a4 fc  	sd	a0, -48(s0)
   1069a: 19 45        	li	a0, 6
   1069c: 23 3c a4 fc  	sd	a0, -40(s0)
   106a0: 6f 00 70 0d  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000106a4 <.Lpcrel_hi21>:
   106a4: 17 85 00 00  	auipc	a0, 8
   106a8: 13 05 35 0b  	addi	a0, a0, 179
   106ac: 23 38 a4 fc  	sd	a0, -48(s0)
   106b0: 1d 45        	li	a0, 7
   106b2: 23 3c a4 fc  	sd	a0, -40(s0)
   106b6: 6f 00 10 0c  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000106ba <.Lpcrel_hi22>:
   106ba: 17 85 00 00  	auipc	a0, 8
   106be: 13 05 45 0a  	addi	a0, a0, 164
   106c2: 23 38 a4 fc  	sd	a0, -48(s0)
   106c6: 19 45        	li	a0, 6
   106c8: 23 3c a4 fc  	sd	a0, -40(s0)
   106cc: 6f 00 b0 0a  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000106d0 <.Lpcrel_hi23>:
   106d0: 17 85 00 00  	auipc	a0, 8
   106d4: 13 05 45 09  	addi	a0, a0, 148
   106d8: 23 38 a4 fc  	sd	a0, -48(s0)
   106dc: 19 45        	li	a0, 6
   106de: 23 3c a4 fc  	sd	a0, -40(s0)
   106e2: 6f 00 50 09  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000106e6 <.Lpcrel_hi24>:
   106e6: 17 85 00 00  	auipc	a0, 8
   106ea: 13 05 45 08  	addi	a0, a0, 132
   106ee: 23 38 a4 fc  	sd	a0, -48(s0)
   106f2: 19 45        	li	a0, 6
   106f4: 23 3c a4 fc  	sd	a0, -40(s0)
   106f8: 6f 00 f0 07  	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000106fc <.Lpcrel_hi25>:
   106fc: 17 85 00 00  	auipc	a0, 8
   10700: 13 05 45 07  	addi	a0, a0, 116
   10704: 23 38 a4 fc  	sd	a0, -48(s0)
   10708: 19 45        	li	a0, 6
   1070a: 23 3c a4 fc  	sd	a0, -40(s0)
   1070e: 6f 00 90 06  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010712 <.Lpcrel_hi26>:
   10712: 17 85 00 00  	auipc	a0, 8
   10716: 13 05 45 06  	addi	a0, a0, 100
   1071a: 23 38 a4 fc  	sd	a0, -48(s0)
   1071e: 19 45        	li	a0, 6
   10720: 23 3c a4 fc  	sd	a0, -40(s0)
   10724: 6f 00 30 05  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010728 <.Lpcrel_hi27>:
   10728: 17 85 00 00  	auipc	a0, 8
   1072c: 13 05 45 05  	addi	a0, a0, 84
   10730: 23 38 a4 fc  	sd	a0, -48(s0)
   10734: 1d 45        	li	a0, 7
   10736: 23 3c a4 fc  	sd	a0, -40(s0)
   1073a: 6f 00 d0 03  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001073e <.Lpcrel_hi28>:
   1073e: 17 85 00 00  	auipc	a0, 8
   10742: 13 05 55 04  	addi	a0, a0, 69
   10746: 23 38 a4 fc  	sd	a0, -48(s0)
   1074a: 15 45        	li	a0, 5
   1074c: 23 3c a4 fc  	sd	a0, -40(s0)
   10750: 6f 00 70 02  	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010754 <.Lpcrel_hi29>:
   10754: 17 85 00 00  	auipc	a0, 8
   10758: 13 05 45 03  	addi	a0, a0, 52
   1075c: 23 38 a4 fc  	sd	a0, -48(s0)
   10760: 19 45        	li	a0, 6
   10762: 23 3c a4 fc  	sd	a0, -40(s0)
   10766: 6f 00 10 01  	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001076a <.Lpcrel_hi30>:
   1076a: 17 85 00 00  	auipc	a0, 8
   1076e: 13 05 45 02  	addi	a0, a0, 36
   10772: 23 38 a4 fc  	sd	a0, -48(s0)
   10776: 19 45        	li	a0, 6
   10778: 23 3c a4 fc  	sd	a0, -40(s0)
   1077c: ed af        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001077e <.Lpcrel_hi31>:
   1077e: 17 85 00 00  	auipc	a0, 8
   10782: 13 05 65 01  	addi	a0, a0, 22
   10786: 23 38 a4 fc  	sd	a0, -48(s0)
   1078a: 15 45        	li	a0, 5
   1078c: 23 3c a4 fc  	sd	a0, -40(s0)
   10790: dd a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010792 <.Lpcrel_hi32>:
   10792: 17 85 00 00  	auipc	a0, 8
   10796: 13 05 75 00  	addi	a0, a0, 7
   1079a: 23 38 a4 fc  	sd	a0, -48(s0)
   1079e: 19 45        	li	a0, 6
   107a0: 23 3c a4 fc  	sd	a0, -40(s0)
   107a4: c9 af        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000107a6 <.Lpcrel_hi33>:
   107a6: 17 85 00 00  	auipc	a0, 8
   107aa: 13 05 95 ff  	addi	a0, a0, -7
   107ae: 23 38 a4 fc  	sd	a0, -48(s0)
   107b2: 15 45        	li	a0, 5
   107b4: 23 3c a4 fc  	sd	a0, -40(s0)
   107b8: 7d af        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000107ba <.Lpcrel_hi34>:
   107ba: 17 85 00 00  	auipc	a0, 8
   107be: 13 05 25 ff  	addi	a0, a0, -14
   107c2: 23 38 a4 fc  	sd	a0, -48(s0)
   107c6: 11 45        	li	a0, 4
   107c8: 23 3c a4 fc  	sd	a0, -40(s0)
   107cc: 6d a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000107ce <.Lpcrel_hi35>:
   107ce: 17 85 00 00  	auipc	a0, 8
   107d2: 13 05 65 fe  	addi	a0, a0, -26
   107d6: 23 38 a4 fc  	sd	a0, -48(s0)
   107da: 19 45        	li	a0, 6
   107dc: 23 3c a4 fc  	sd	a0, -40(s0)
   107e0: 59 af        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000107e2 <.Lpcrel_hi36>:
   107e2: 17 85 00 00  	auipc	a0, 8
   107e6: 13 05 85 fd  	addi	a0, a0, -40
   107ea: 23 38 a4 fc  	sd	a0, -48(s0)
   107ee: 1d 45        	li	a0, 7
   107f0: 23 3c a4 fc  	sd	a0, -40(s0)
   107f4: 49 a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000107f6 <.Lpcrel_hi37>:
   107f6: 17 85 00 00  	auipc	a0, 8
   107fa: 13 05 b5 fc  	addi	a0, a0, -53
   107fe: 23 38 a4 fc  	sd	a0, -48(s0)
   10802: 31 45        	li	a0, 12
   10804: 23 3c a4 fc  	sd	a0, -40(s0)
   10808: bd a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001080a <.Lpcrel_hi38>:
   1080a: 17 85 00 00  	auipc	a0, 8
   1080e: 13 05 35 fc  	addi	a0, a0, -61
   10812: 23 38 a4 fc  	sd	a0, -48(s0)
   10816: 19 45        	li	a0, 6
   10818: 23 3c a4 fc  	sd	a0, -40(s0)
   1081c: a9 af        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001081e <.Lpcrel_hi39>:
   1081e: 17 85 00 00  	auipc	a0, 8
   10822: 13 05 55 fb  	addi	a0, a0, -75
   10826: 23 38 a4 fc  	sd	a0, -48(s0)
   1082a: 19 45        	li	a0, 6
   1082c: 23 3c a4 fc  	sd	a0, -40(s0)
   10830: 99 a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010832 <.Lpcrel_hi40>:
   10832: 17 85 00 00  	auipc	a0, 8
   10836: 13 05 75 fa  	addi	a0, a0, -89
   1083a: 23 38 a4 fc  	sd	a0, -48(s0)
   1083e: 25 45        	li	a0, 9
   10840: 23 3c a4 fc  	sd	a0, -40(s0)
   10844: 0d af        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010846 <.Lpcrel_hi41>:
   10846: 17 85 00 00  	auipc	a0, 8
   1084a: 13 05 c5 f9  	addi	a0, a0, -100
   1084e: 23 38 a4 fc  	sd	a0, -48(s0)
   10852: 15 45        	li	a0, 5
   10854: 23 3c a4 fc  	sd	a0, -40(s0)
   10858: 39 af        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001085a <.Lpcrel_hi42>:
   1085a: 17 85 00 00  	auipc	a0, 8
   1085e: 13 05 d5 f8  	addi	a0, a0, -115
   10862: 23 38 a4 fc  	sd	a0, -48(s0)
   10866: 19 45        	li	a0, 6
   10868: 23 3c a4 fc  	sd	a0, -40(s0)
   1086c: 29 a7        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001086e <.Lpcrel_hi43>:
   1086e: 17 85 00 00  	auipc	a0, 8
   10872: 13 05 f5 f7  	addi	a0, a0, -129
   10876: 23 38 a4 fc  	sd	a0, -48(s0)
   1087a: 15 45        	li	a0, 5
   1087c: 23 3c a4 fc  	sd	a0, -40(s0)
   10880: dd ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010882 <.Lpcrel_hi44>:
   10882: 17 85 00 00  	auipc	a0, 8
   10886: 13 05 05 f7  	addi	a0, a0, -144
   1088a: 23 38 a4 fc  	sd	a0, -48(s0)
   1088e: 19 45        	li	a0, 6
   10890: 23 3c a4 fc  	sd	a0, -40(s0)
   10894: cd a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010896 <.Lpcrel_hi45>:
   10896: 17 85 00 00  	auipc	a0, 8
   1089a: 13 05 25 fa  	addi	a0, a0, -94
   1089e: 23 38 a4 fc  	sd	a0, -48(s0)
   108a2: 21 45        	li	a0, 8
   108a4: 23 3c a4 fc  	sd	a0, -40(s0)
   108a8: f9 a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000108aa <.Lpcrel_hi46>:
   108aa: 17 85 00 00  	auipc	a0, 8
   108ae: 13 05 e5 f9  	addi	a0, a0, -98
   108b2: 23 38 a4 fc  	sd	a0, -48(s0)
   108b6: 19 45        	li	a0, 6
   108b8: 23 3c a4 fc  	sd	a0, -40(s0)
   108bc: 6d ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000108be <.Lpcrel_hi47>:
   108be: 17 85 00 00  	auipc	a0, 8
   108c2: 13 05 05 f9  	addi	a0, a0, -112
   108c6: 23 38 a4 fc  	sd	a0, -48(s0)
   108ca: 19 45        	li	a0, 6
   108cc: 23 3c a4 fc  	sd	a0, -40(s0)
   108d0: 5d a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000108d2 <.Lpcrel_hi48>:
   108d2: 17 85 00 00  	auipc	a0, 8
   108d6: 13 05 25 f8  	addi	a0, a0, -126
   108da: 23 38 a4 fc  	sd	a0, -48(s0)
   108de: 19 45        	li	a0, 6
   108e0: 23 3c a4 fc  	sd	a0, -40(s0)
   108e4: 49 ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000108e6 <.Lpcrel_hi49>:
   108e6: 17 85 00 00  	auipc	a0, 8
   108ea: 13 05 45 f7  	addi	a0, a0, -140
   108ee: 23 38 a4 fc  	sd	a0, -48(s0)
   108f2: 1d 45        	li	a0, 7
   108f4: 23 3c a4 fc  	sd	a0, -40(s0)
   108f8: bd ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000108fa <.Lpcrel_hi50>:
   108fa: 17 85 00 00  	auipc	a0, 8
   108fe: 13 05 75 f6  	addi	a0, a0, -153
   10902: 23 38 a4 fc  	sd	a0, -48(s0)
   10906: 19 45        	li	a0, 6
   10908: 23 3c a4 fc  	sd	a0, -40(s0)
   1090c: ad a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001090e <.Lpcrel_hi51>:
   1090e: 17 85 00 00  	auipc	a0, 8
   10912: 13 05 95 f5  	addi	a0, a0, -167
   10916: 23 38 a4 fc  	sd	a0, -48(s0)
   1091a: 19 45        	li	a0, 6
   1091c: 23 3c a4 fc  	sd	a0, -40(s0)
   10920: 99 ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010922 <.Lpcrel_hi52>:
   10922: 17 85 00 00  	auipc	a0, 8
   10926: 13 05 b5 f4  	addi	a0, a0, -181
   1092a: 23 38 a4 fc  	sd	a0, -48(s0)
   1092e: 15 45        	li	a0, 5
   10930: 23 3c a4 fc  	sd	a0, -40(s0)
   10934: 89 a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010936 <.Lpcrel_hi53>:
   10936: 17 85 00 00  	auipc	a0, 8
   1093a: 13 05 c5 f3  	addi	a0, a0, -196
   1093e: 23 38 a4 fc  	sd	a0, -48(s0)
   10942: 15 45        	li	a0, 5
   10944: 23 3c a4 fc  	sd	a0, -40(s0)
   10948: 3d a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001094a <.Lpcrel_hi54>:
   1094a: 17 85 00 00  	auipc	a0, 8
   1094e: 13 05 d5 f2  	addi	a0, a0, -211
   10952: 23 38 a4 fc  	sd	a0, -48(s0)
   10956: 19 45        	li	a0, 6
   10958: 23 3c a4 fc  	sd	a0, -40(s0)
   1095c: 29 ad        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001095e <.Lpcrel_hi55>:
   1095e: 17 85 00 00  	auipc	a0, 8
   10962: 13 05 f5 f1  	addi	a0, a0, -225
   10966: 23 38 a4 fc  	sd	a0, -48(s0)
   1096a: 19 45        	li	a0, 6
   1096c: 23 3c a4 fc  	sd	a0, -40(s0)
   10970: 19 a5        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010972 <.Lpcrel_hi56>:
   10972: 17 85 00 00  	auipc	a0, 8
   10976: 13 05 15 f1  	addi	a0, a0, -239
   1097a: 23 38 a4 fc  	sd	a0, -48(s0)
   1097e: 1d 45        	li	a0, 7
   10980: 23 3c a4 fc  	sd	a0, -40(s0)
   10984: cd ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010986 <.Lpcrel_hi57>:
   10986: 17 85 00 00  	auipc	a0, 8
   1098a: 13 05 45 f0  	addi	a0, a0, -252
   1098e: 23 38 a4 fc  	sd	a0, -48(s0)
   10992: 1d 45        	li	a0, 7
   10994: 23 3c a4 fc  	sd	a0, -40(s0)
   10998: f9 ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

000000000001099a <.Lpcrel_hi58>:
   1099a: 17 85 00 00  	auipc	a0, 8
   1099e: 13 05 75 ef  	addi	a0, a0, -265
   109a2: 23 38 a4 fc  	sd	a0, -48(s0)
   109a6: 19 45        	li	a0, 6
   109a8: 23 3c a4 fc  	sd	a0, -40(s0)
   109ac: e9 a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000109ae <.Lpcrel_hi59>:
   109ae: 17 85 00 00  	auipc	a0, 8
   109b2: 13 05 95 ee  	addi	a0, a0, -279
   109b6: 23 38 a4 fc  	sd	a0, -48(s0)
   109ba: 19 45        	li	a0, 6
   109bc: 23 3c a4 fc  	sd	a0, -40(s0)
   109c0: 5d ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000109c2 <.Lpcrel_hi60>:
   109c2: 17 85 00 00  	auipc	a0, 8
   109c6: 13 05 b5 ed  	addi	a0, a0, -293
   109ca: 23 38 a4 fc  	sd	a0, -48(s0)
   109ce: 1d 45        	li	a0, 7
   109d0: 23 3c a4 fc  	sd	a0, -40(s0)
   109d4: 4d a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000109d6 <.Lpcrel_hi61>:
   109d6: 17 85 00 00  	auipc	a0, 8
   109da: 13 05 e5 ec  	addi	a0, a0, -306
   109de: 23 38 a4 fc  	sd	a0, -48(s0)
   109e2: 15 45        	li	a0, 5
   109e4: 23 3c a4 fc  	sd	a0, -40(s0)
   109e8: 79 a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000109ea <.Lpcrel_hi62>:
   109ea: 17 85 00 00  	auipc	a0, 8
   109ee: 13 05 f5 eb  	addi	a0, a0, -321
   109f2: 23 38 a4 fc  	sd	a0, -48(s0)
   109f6: 15 45        	li	a0, 5
   109f8: 23 3c a4 fc  	sd	a0, -40(s0)
   109fc: ad ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

00000000000109fe <.Lpcrel_hi63>:
   109fe: 17 85 00 00  	auipc	a0, 8
   10a02: 13 05 05 eb  	addi	a0, a0, -336
   10a06: 23 38 a4 fc  	sd	a0, -48(s0)
   10a0a: 19 45        	li	a0, 6
   10a0c: 23 3c a4 fc  	sd	a0, -40(s0)
   10a10: 9d a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a12 <.Lpcrel_hi64>:
   10a12: 17 85 00 00  	auipc	a0, 8
   10a16: 13 05 25 ea  	addi	a0, a0, -350
   10a1a: 23 38 a4 fc  	sd	a0, -48(s0)
   10a1e: 19 45        	li	a0, 6
   10a20: 23 3c a4 fc  	sd	a0, -40(s0)
   10a24: 89 ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a26 <.Lpcrel_hi65>:
   10a26: 17 85 00 00  	auipc	a0, 8
   10a2a: 13 05 45 e9  	addi	a0, a0, -364
   10a2e: 23 38 a4 fc  	sd	a0, -48(s0)
   10a32: 1d 45        	li	a0, 7
   10a34: 23 3c a4 fc  	sd	a0, -40(s0)
   10a38: 3d ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a3a <.Lpcrel_hi66>:
   10a3a: 17 85 00 00  	auipc	a0, 8
   10a3e: 13 05 75 e8  	addi	a0, a0, -377
   10a42: 23 38 a4 fc  	sd	a0, -48(s0)
   10a46: 1d 45        	li	a0, 7
   10a48: 23 3c a4 fc  	sd	a0, -40(s0)
   10a4c: 2d a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a4e <.Lpcrel_hi67>:
   10a4e: 17 85 00 00  	auipc	a0, 8
   10a52: 13 05 a5 d5  	addi	a0, a0, -678
   10a56: 23 38 a4 fc  	sd	a0, -48(s0)
   10a5a: 11 45        	li	a0, 4
   10a5c: 23 3c a4 fc  	sd	a0, -40(s0)
   10a60: 19 ab        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a62 <.Lpcrel_hi68>:
   10a62: 17 85 00 00  	auipc	a0, 8
   10a66: 13 05 65 e6  	addi	a0, a0, -410
   10a6a: 23 38 a4 fc  	sd	a0, -48(s0)
   10a6e: 19 45        	li	a0, 6
   10a70: 23 3c a4 fc  	sd	a0, -40(s0)
   10a74: 09 a3        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a76 <.Lpcrel_hi69>:
   10a76: 17 85 00 00  	auipc	a0, 8
   10a7a: 13 05 85 e5  	addi	a0, a0, -424
   10a7e: 23 38 a4 fc  	sd	a0, -48(s0)
   10a82: 15 45        	li	a0, 5
   10a84: 23 3c a4 fc  	sd	a0, -40(s0)
   10a88: fd a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a8a <.Lpcrel_hi70>:
   10a8a: 17 85 00 00  	auipc	a0, 8
   10a8e: 13 05 95 e4  	addi	a0, a0, -439
   10a92: 23 38 a4 fc  	sd	a0, -48(s0)
   10a96: 19 45        	li	a0, 6
   10a98: 23 3c a4 fc  	sd	a0, -40(s0)
   10a9c: e9 a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010a9e <.Lpcrel_hi71>:
   10a9e: 17 85 00 00  	auipc	a0, 8
   10aa2: 13 05 b5 e3  	addi	a0, a0, -453
   10aa6: 23 38 a4 fc  	sd	a0, -48(s0)
   10aaa: 25 45        	li	a0, 9
   10aac: 23 3c a4 fc  	sd	a0, -40(s0)
   10ab0: d9 a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ab2 <.Lpcrel_hi72>:
   10ab2: 17 85 00 00  	auipc	a0, 8
   10ab6: 13 05 05 e3  	addi	a0, a0, -464
   10aba: 23 38 a4 fc  	sd	a0, -48(s0)
   10abe: 1d 45        	li	a0, 7
   10ac0: 23 3c a4 fc  	sd	a0, -40(s0)
   10ac4: 4d a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ac6 <.Lpcrel_hi73>:
   10ac6: 17 85 00 00  	auipc	a0, 8
   10aca: 13 05 35 e2  	addi	a0, a0, -477
   10ace: 23 38 a4 fc  	sd	a0, -48(s0)
   10ad2: 1d 45        	li	a0, 7
   10ad4: 23 3c a4 fc  	sd	a0, -40(s0)
   10ad8: 79 a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ada <.Lpcrel_hi74>:
   10ada: 17 85 00 00  	auipc	a0, 8
   10ade: 13 05 65 e1  	addi	a0, a0, -490
   10ae2: 23 38 a4 fc  	sd	a0, -48(s0)
   10ae6: 25 45        	li	a0, 9
   10ae8: 23 3c a4 fc  	sd	a0, -40(s0)
   10aec: 69 a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010aee <.Lpcrel_hi75>:
   10aee: 17 85 00 00  	auipc	a0, 8
   10af2: 13 05 a5 d1  	addi	a0, a0, -742
   10af6: 23 38 a4 fc  	sd	a0, -48(s0)
   10afa: 21 45        	li	a0, 8
   10afc: 23 3c a4 fc  	sd	a0, -40(s0)
   10b00: 9d a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b02 <.Lpcrel_hi76>:
   10b02: 17 85 00 00  	auipc	a0, 8
   10b06: 13 05 75 df  	addi	a0, a0, -521
   10b0a: 23 38 a4 fc  	sd	a0, -48(s0)
   10b0e: 19 45        	li	a0, 6
   10b10: 23 3c a4 fc  	sd	a0, -40(s0)
   10b14: 8d a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b16 <.Lpcrel_hi77>:
   10b16: 17 85 00 00  	auipc	a0, 8
   10b1a: 13 05 95 de  	addi	a0, a0, -535
   10b1e: 23 38 a4 fc  	sd	a0, -48(s0)
   10b22: 1d 45        	li	a0, 7
   10b24: 23 3c a4 fc  	sd	a0, -40(s0)
   10b28: b9 a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b2a <.Lpcrel_hi78>:
   10b2a: 17 85 00 00  	auipc	a0, 8
   10b2e: 13 05 c5 dd  	addi	a0, a0, -548
   10b32: 23 38 a4 fc  	sd	a0, -48(s0)
   10b36: 1d 45        	li	a0, 7
   10b38: 23 3c a4 fc  	sd	a0, -40(s0)
   10b3c: 2d a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b3e <.Lpcrel_hi79>:
   10b3e: 17 85 00 00  	auipc	a0, 8
   10b42: 13 05 f5 dc  	addi	a0, a0, -561
   10b46: 23 38 a4 fc  	sd	a0, -48(s0)
   10b4a: 1d 45        	li	a0, 7
   10b4c: 23 3c a4 fc  	sd	a0, -40(s0)
   10b50: 1d a1        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b52 <.Lpcrel_hi80>:
   10b52: 17 85 00 00  	auipc	a0, 8
   10b56: 13 05 25 dc  	addi	a0, a0, -574
   10b5a: 23 38 a4 fc  	sd	a0, -48(s0)
   10b5e: 1d 45        	li	a0, 7
   10b60: 23 3c a4 fc  	sd	a0, -40(s0)
   10b64: 09 a9        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b66 <.Lpcrel_hi81>:
   10b66: 17 85 00 00  	auipc	a0, 8
   10b6a: 13 05 55 db  	addi	a0, a0, -587
   10b6e: 23 38 a4 fc  	sd	a0, -48(s0)
   10b72: 1d 45        	li	a0, 7
   10b74: 23 3c a4 fc  	sd	a0, -40(s0)
   10b78: fd ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b7a <.Lpcrel_hi82>:
   10b7a: 17 85 00 00  	auipc	a0, 8
   10b7e: 13 05 65 c9  	addi	a0, a0, -874
   10b82: 23 38 a4 fc  	sd	a0, -48(s0)
   10b86: 21 45        	li	a0, 8
   10b88: 23 3c a4 fc  	sd	a0, -40(s0)
   10b8c: ed a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010b8e <.Lpcrel_hi83>:
   10b8e: 17 85 00 00  	auipc	a0, 8
   10b92: 13 05 45 d9  	addi	a0, a0, -620
   10b96: 23 38 a4 fc  	sd	a0, -48(s0)
   10b9a: 19 45        	li	a0, 6
   10b9c: 23 3c a4 fc  	sd	a0, -40(s0)
   10ba0: d9 ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ba2 <.Lpcrel_hi84>:
   10ba2: 17 85 00 00  	auipc	a0, 8
   10ba6: 13 05 e5 c7  	addi	a0, a0, -898
   10baa: 23 38 a4 fc  	sd	a0, -48(s0)
   10bae: 21 45        	li	a0, 8
   10bb0: 23 3c a4 fc  	sd	a0, -40(s0)
   10bb4: c9 a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010bb6 <.Lpcrel_hi85>:
   10bb6: 17 85 00 00  	auipc	a0, 8
   10bba: 13 05 25 c4  	addi	a0, a0, -958
   10bbe: 23 38 a4 fc  	sd	a0, -48(s0)
   10bc2: 21 45        	li	a0, 8
   10bc4: 23 3c a4 fc  	sd	a0, -40(s0)
   10bc8: 7d a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010bca <.Lpcrel_hi86>:
   10bca: 17 85 00 00  	auipc	a0, 8
   10bce: 13 05 e5 d5  	addi	a0, a0, -674
   10bd2: 23 38 a4 fc  	sd	a0, -48(s0)
   10bd6: 19 45        	li	a0, 6
   10bd8: 23 3c a4 fc  	sd	a0, -40(s0)
   10bdc: 69 ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010bde <.Lpcrel_hi87>:
   10bde: 17 85 00 00  	auipc	a0, 8
   10be2: 13 05 a5 c3  	addi	a0, a0, -966
   10be6: 23 38 a4 fc  	sd	a0, -48(s0)
   10bea: 21 45        	li	a0, 8
   10bec: 23 3c a4 fc  	sd	a0, -40(s0)
   10bf0: 59 a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010bf2 <.Lpcrel_hi88>:
   10bf2: 17 85 00 00  	auipc	a0, 8
   10bf6: 13 05 c5 d3  	addi	a0, a0, -708
   10bfa: 23 38 a4 fc  	sd	a0, -48(s0)
   10bfe: 31 45        	li	a0, 12
   10c00: 23 3c a4 fc  	sd	a0, -40(s0)
   10c04: 8d ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c06 <.Lpcrel_hi89>:
   10c06: 17 85 00 00  	auipc	a0, 8
   10c0a: 13 05 25 c2  	addi	a0, a0, -990
   10c0e: 23 38 a4 fc  	sd	a0, -48(s0)
   10c12: 21 45        	li	a0, 8
   10c14: 23 3c a4 fc  	sd	a0, -40(s0)
   10c18: b9 ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c1a <.Lpcrel_hi90>:
   10c1a: 17 85 00 00  	auipc	a0, 8
   10c1e: 13 05 05 d2  	addi	a0, a0, -736
   10c22: 23 38 a4 fc  	sd	a0, -48(s0)
   10c26: 29 45        	li	a0, 10
   10c28: 23 3c a4 fc  	sd	a0, -40(s0)
   10c2c: a9 a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c2e <.Lpcrel_hi91>:
   10c2e: 17 85 00 00  	auipc	a0, 8
   10c32: 13 05 65 d1  	addi	a0, a0, -746
   10c36: 23 38 a4 fc  	sd	a0, -48(s0)
   10c3a: 2d 45        	li	a0, 11
   10c3c: 23 3c a4 fc  	sd	a0, -40(s0)
   10c40: 1d ae        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c42 <.Lpcrel_hi92>:
   10c42: 17 85 00 00  	auipc	a0, 8
   10c46: 13 05 d5 d0  	addi	a0, a0, -755
   10c4a: 23 38 a4 fc  	sd	a0, -48(s0)
   10c4e: 3d 45        	li	a0, 15
   10c50: 23 3c a4 fc  	sd	a0, -40(s0)
   10c54: 0d a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c56 <.Lpcrel_hi93>:
   10c56: 17 85 00 00  	auipc	a0, 8
   10c5a: 13 05 85 d0  	addi	a0, a0, -760
   10c5e: 23 38 a4 fc  	sd	a0, -48(s0)
   10c62: 3d 45        	li	a0, 15
   10c64: 23 3c a4 fc  	sd	a0, -40(s0)
   10c68: 39 a6        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c6a <.Lpcrel_hi94>:
   10c6a: 17 85 00 00  	auipc	a0, 8
   10c6e: 13 05 35 d0  	addi	a0, a0, -765
   10c72: 23 38 a4 fc  	sd	a0, -48(s0)
   10c76: 29 45        	li	a0, 10
   10c78: 23 3c a4 fc  	sd	a0, -40(s0)
   10c7c: ed ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c7e <.Lpcrel_hi95>:
   10c7e: 17 85 00 00  	auipc	a0, 8
   10c82: 13 05 95 cf  	addi	a0, a0, -775
   10c86: 23 38 a4 fc  	sd	a0, -48(s0)
   10c8a: 31 45        	li	a0, 12
   10c8c: 23 3c a4 fc  	sd	a0, -40(s0)
   10c90: dd a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010c92 <.Lpcrel_hi96>:
   10c92: 17 85 00 00  	auipc	a0, 8
   10c96: 13 05 15 cf  	addi	a0, a0, -783
   10c9a: 23 38 a4 fc  	sd	a0, -48(s0)
   10c9e: 31 45        	li	a0, 12
   10ca0: 23 3c a4 fc  	sd	a0, -40(s0)
   10ca4: c9 ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ca6 <.Lpcrel_hi97>:
   10ca6: 17 85 00 00  	auipc	a0, 8
   10caa: 13 05 95 ce  	addi	a0, a0, -791
   10cae: 23 38 a4 fc  	sd	a0, -48(s0)
   10cb2: 29 45        	li	a0, 10
   10cb4: 23 3c a4 fc  	sd	a0, -40(s0)
   10cb8: 7d ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010cba <.Lpcrel_hi98>:
   10cba: 17 85 00 00  	auipc	a0, 8
   10cbe: 13 05 f5 cd  	addi	a0, a0, -801
   10cc2: 23 38 a4 fc  	sd	a0, -48(s0)
   10cc6: 35 45        	li	a0, 13
   10cc8: 23 3c a4 fc  	sd	a0, -40(s0)
   10ccc: 6d a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010cce <.Lpcrel_hi99>:
   10cce: 17 85 00 00  	auipc	a0, 8
   10cd2: 13 05 25 b3  	addi	a0, a0, -1230
   10cd6: 23 38 a4 fc  	sd	a0, -48(s0)
   10cda: 21 45        	li	a0, 8
   10cdc: 23 3c a4 fc  	sd	a0, -40(s0)
   10ce0: 59 ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ce2 <.Lpcrel_hi100>:
   10ce2: 17 85 00 00  	auipc	a0, 8
   10ce6: 13 05 45 cc  	addi	a0, a0, -828
   10cea: 23 38 a4 fc  	sd	a0, -48(s0)
   10cee: 2d 45        	li	a0, 11
   10cf0: 23 3c a4 fc  	sd	a0, -40(s0)
   10cf4: 49 a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010cf6 <.Lpcrel_hi101>:
   10cf6: 17 85 00 00  	auipc	a0, 8
   10cfa: 13 05 b5 cb  	addi	a0, a0, -837
   10cfe: 23 38 a4 fc  	sd	a0, -48(s0)
   10d02: 25 45        	li	a0, 9
   10d04: 23 3c a4 fc  	sd	a0, -40(s0)
   10d08: bd a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d0a <.Lpcrel_hi102>:
   10d0a: 17 85 00 00  	auipc	a0, 8
   10d0e: 13 05 05 cb  	addi	a0, a0, -848
   10d12: 23 38 a4 fc  	sd	a0, -48(s0)
   10d16: 31 45        	li	a0, 12
   10d18: 23 3c a4 fc  	sd	a0, -40(s0)
   10d1c: a9 ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d1e <.Lpcrel_hi103>:
   10d1e: 17 85 00 00  	auipc	a0, 8
   10d22: 13 05 85 ca  	addi	a0, a0, -856
   10d26: 23 38 a4 fc  	sd	a0, -48(s0)
   10d2a: 29 45        	li	a0, 10
   10d2c: 23 3c a4 fc  	sd	a0, -40(s0)
   10d30: 99 a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d32 <.Lpcrel_hi104>:
   10d32: 17 85 00 00  	auipc	a0, 8
   10d36: 13 05 e5 c9  	addi	a0, a0, -866
   10d3a: 23 38 a4 fc  	sd	a0, -48(s0)
   10d3e: 1d 45        	li	a0, 7
   10d40: 23 3c a4 fc  	sd	a0, -40(s0)
   10d44: 0d ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d46 <.Lpcrel_hi105>:
   10d46: 17 85 00 00  	auipc	a0, 8
   10d4a: 13 05 15 c9  	addi	a0, a0, -879
   10d4e: 23 38 a4 fc  	sd	a0, -48(s0)
   10d52: 1d 45        	li	a0, 7
   10d54: 23 3c a4 fc  	sd	a0, -40(s0)
   10d58: 39 ac        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d5a <.Lpcrel_hi106>:
   10d5a: 17 85 00 00  	auipc	a0, 8
   10d5e: 13 05 65 ae  	addi	a0, a0, -1306
   10d62: 23 38 a4 fc  	sd	a0, -48(s0)
   10d66: 21 45        	li	a0, 8
   10d68: 23 3c a4 fc  	sd	a0, -40(s0)
   10d6c: 29 a4        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d6e <.Lpcrel_hi107>:
   10d6e: 17 85 00 00  	auipc	a0, 8
   10d72: 13 05 05 c7  	addi	a0, a0, -912
   10d76: 23 38 a4 fc  	sd	a0, -48(s0)
   10d7a: 25 45        	li	a0, 9
   10d7c: 23 3c a4 fc  	sd	a0, -40(s0)
   10d80: dd aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d82 <.Lpcrel_hi108>:
   10d82: 17 85 00 00  	auipc	a0, 8
   10d86: 13 05 55 c6  	addi	a0, a0, -923
   10d8a: 23 38 a4 fc  	sd	a0, -48(s0)
   10d8e: 31 45        	li	a0, 12
   10d90: 23 3c a4 fc  	sd	a0, -40(s0)
   10d94: cd a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010d96 <.Lpcrel_hi109>:
   10d96: 17 85 00 00  	auipc	a0, 8
   10d9a: 13 05 d5 c5  	addi	a0, a0, -931
   10d9e: 23 38 a4 fc  	sd	a0, -48(s0)
   10da2: 25 45        	li	a0, 9
   10da4: 23 3c a4 fc  	sd	a0, -40(s0)
   10da8: f9 a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010daa <.Lpcrel_hi110>:
   10daa: 17 85 00 00  	auipc	a0, 8
   10dae: 13 05 25 c5  	addi	a0, a0, -942
   10db2: 23 38 a4 fc  	sd	a0, -48(s0)
   10db6: 31 45        	li	a0, 12
   10db8: 23 3c a4 fc  	sd	a0, -40(s0)
   10dbc: 6d aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010dbe <.Lpcrel_hi111>:
   10dbe: 17 85 00 00  	auipc	a0, 8
   10dc2: 13 05 a5 c4  	addi	a0, a0, -950
   10dc6: 23 38 a4 fc  	sd	a0, -48(s0)
   10dca: 25 45        	li	a0, 9
   10dcc: 23 3c a4 fc  	sd	a0, -40(s0)
   10dd0: 5d a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010dd2 <.Lpcrel_hi112>:
   10dd2: 17 85 00 00  	auipc	a0, 8
   10dd6: 13 05 f5 c3  	addi	a0, a0, -961
   10dda: 23 38 a4 fc  	sd	a0, -48(s0)
   10dde: 31 45        	li	a0, 12
   10de0: 23 3c a4 fc  	sd	a0, -40(s0)
   10de4: 49 aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010de6 <.Lpcrel_hi113>:
   10de6: 17 85 00 00  	auipc	a0, 8
   10dea: 13 05 a5 a4  	addi	a0, a0, -1462
   10dee: 23 38 a4 fc  	sd	a0, -48(s0)
   10df2: 21 45        	li	a0, 8
   10df4: 23 3c a4 fc  	sd	a0, -40(s0)
   10df8: bd aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010dfa <.Lpcrel_hi114>:
   10dfa: 17 85 00 00  	auipc	a0, 8
   10dfe: 13 05 35 c2  	addi	a0, a0, -989
   10e02: 23 38 a4 fc  	sd	a0, -48(s0)
   10e06: 2d 45        	li	a0, 11
   10e08: 23 3c a4 fc  	sd	a0, -40(s0)
   10e0c: ad a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e0e <.Lpcrel_hi115>:
   10e0e: 17 85 00 00  	auipc	a0, 8
   10e12: 13 05 a5 c1  	addi	a0, a0, -998
   10e16: 23 38 a4 fc  	sd	a0, -48(s0)
   10e1a: 19 45        	li	a0, 6
   10e1c: 23 3c a4 fc  	sd	a0, -40(s0)
   10e20: 99 aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e22 <.Lpcrel_hi116>:
   10e22: 17 85 00 00  	auipc	a0, 8
   10e26: 13 05 c5 c0  	addi	a0, a0, -1012
   10e2a: 23 38 a4 fc  	sd	a0, -48(s0)
   10e2e: 1d 45        	li	a0, 7
   10e30: 23 3c a4 fc  	sd	a0, -40(s0)
   10e34: 89 a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e36 <.Lpcrel_hi117>:
   10e36: 17 85 00 00  	auipc	a0, 8
   10e3a: 13 05 f5 bf  	addi	a0, a0, -1025
   10e3e: 23 38 a4 fc  	sd	a0, -48(s0)
   10e42: 1d 45        	li	a0, 7
   10e44: 23 3c a4 fc  	sd	a0, -40(s0)
   10e48: 3d a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e4a <.Lpcrel_hi118>:
   10e4a: 17 85 00 00  	auipc	a0, 8
   10e4e: 13 05 25 bf  	addi	a0, a0, -1038
   10e52: 23 38 a4 fc  	sd	a0, -48(s0)
   10e56: 1d 45        	li	a0, 7
   10e58: 23 3c a4 fc  	sd	a0, -40(s0)
   10e5c: 29 aa        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e5e <.Lpcrel_hi119>:
   10e5e: 17 85 00 00  	auipc	a0, 8
   10e62: 13 05 55 be  	addi	a0, a0, -1051
   10e66: 23 38 a4 fc  	sd	a0, -48(s0)
   10e6a: 19 45        	li	a0, 6
   10e6c: 23 3c a4 fc  	sd	a0, -40(s0)
   10e70: 19 a2        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e72 <.Lpcrel_hi120>:
   10e72: 17 85 00 00  	auipc	a0, 8
   10e76: 13 05 75 bd  	addi	a0, a0, -1065
   10e7a: 23 38 a4 fc  	sd	a0, -48(s0)
   10e7e: 25 45        	li	a0, 9
   10e80: 23 3c a4 fc  	sd	a0, -40(s0)
   10e84: cd a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e86 <.Lpcrel_hi121>:
   10e86: 17 85 00 00  	auipc	a0, 8
   10e8a: 13 05 c5 bc  	addi	a0, a0, -1076
   10e8e: 23 38 a4 fc  	sd	a0, -48(s0)
   10e92: 19 45        	li	a0, 6
   10e94: 23 3c a4 fc  	sd	a0, -40(s0)
   10e98: f9 a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010e9a <.Lpcrel_hi122>:
   10e9a: 17 85 00 00  	auipc	a0, 8
   10e9e: 13 05 e5 bb  	addi	a0, a0, -1090
   10ea2: 23 38 a4 fc  	sd	a0, -48(s0)
   10ea6: 25 45        	li	a0, 9
   10ea8: 23 3c a4 fc  	sd	a0, -40(s0)
   10eac: e9 a0        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010eae <.Lpcrel_hi123>:
   10eae: 17 85 00 00  	auipc	a0, 8
   10eb2: 13 05 35 bb  	addi	a0, a0, -1101
   10eb6: 23 38 a4 fc  	sd	a0, -48(s0)
   10eba: 2d 45        	li	a0, 11
   10ebc: 23 3c a4 fc  	sd	a0, -40(s0)
   10ec0: 5d a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ec2 <.Lpcrel_hi124>:
   10ec2: 17 85 00 00  	auipc	a0, 8
   10ec6: 13 05 a5 ba  	addi	a0, a0, -1110
   10eca: 23 38 a4 fc  	sd	a0, -48(s0)
   10ece: 25 45        	li	a0, 9
   10ed0: 23 3c a4 fc  	sd	a0, -40(s0)
   10ed4: 4d a0        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010ed6 <.Lpcrel_hi125>:
   10ed6: 17 85 00 00  	auipc	a0, 8
   10eda: 13 05 f5 b9  	addi	a0, a0, -1121
   10ede: 23 38 a4 fc  	sd	a0, -48(s0)
   10ee2: 19 45        	li	a0, 6
   10ee4: 23 3c a4 fc  	sd	a0, -40(s0)
   10ee8: 79 a0        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010eea <.Lpcrel_hi126>:
   10eea: 17 85 00 00  	auipc	a0, 8
   10eee: 13 05 15 b9  	addi	a0, a0, -1135
   10ef2: 23 38 a4 fc  	sd	a0, -48(s0)
   10ef6: 2d 45        	li	a0, 11
   10ef8: 23 3c a4 fc  	sd	a0, -40(s0)
   10efc: ad a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010efe <.Lpcrel_hi127>:
   10efe: 17 85 00 00  	auipc	a0, 8
   10f02: 13 05 85 b8  	addi	a0, a0, -1144
   10f06: 23 38 a4 fc  	sd	a0, -48(s0)
   10f0a: 2d 45        	li	a0, 11
   10f0c: 23 3c a4 fc  	sd	a0, -40(s0)
   10f10: 9d a0        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010f12 <.Lpcrel_hi128>:
   10f12: 17 85 00 00  	auipc	a0, 8
   10f16: 13 05 f5 b7  	addi	a0, a0, -1153
   10f1a: 23 38 a4 fc  	sd	a0, -48(s0)
   10f1e: 31 45        	li	a0, 12
   10f20: 23 3c a4 fc  	sd	a0, -40(s0)
   10f24: 89 a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010f26 <.Lpcrel_hi129>:
   10f26: 17 85 00 00  	auipc	a0, 8
   10f2a: 13 05 75 b7  	addi	a0, a0, -1161
   10f2e: 23 38 a4 fc  	sd	a0, -48(s0)
   10f32: 29 45        	li	a0, 10
   10f34: 23 3c a4 fc  	sd	a0, -40(s0)
   10f38: 3d a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010f3a <.Lpcrel_hi130>:
   10f3a: 17 85 00 00  	auipc	a0, 8
   10f3e: 13 05 d5 b6  	addi	a0, a0, -1171
   10f42: 23 38 a4 fc  	sd	a0, -48(s0)
   10f46: 3d 45        	li	a0, 15
   10f48: 23 3c a4 fc  	sd	a0, -40(s0)
   10f4c: 2d a0        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010f4e <.Lpcrel_hi131>:
   10f4e: 17 85 00 00  	auipc	a0, 8
   10f52: 13 05 85 b6  	addi	a0, a0, -1176
   10f56: 23 38 a4 fc  	sd	a0, -48(s0)
   10f5a: 1d 45        	li	a0, 7
   10f5c: 23 3c a4 fc  	sd	a0, -40(s0)
   10f60: 19 a8        	j	0x10f76 <.Lpcrel_hi132+0x14>

0000000000010f62 <.Lpcrel_hi132>:
   10f62: 17 85 00 00  	auipc	a0, 8
   10f66: 13 05 b5 b5  	addi	a0, a0, -1189
   10f6a: 23 38 a4 fc  	sd	a0, -48(s0)
   10f6e: 25 45        	li	a0, 9
   10f70: 23 3c a4 fc  	sd	a0, -40(s0)
   10f74: 09 a0        	j	0x10f76 <.Lpcrel_hi132+0x14>
   10f76: 03 35 04 fc  	ld	a0, -64(s0)
   10f7a: 83 35 04 fd  	ld	a1, -48(s0)
   10f7e: 03 36 84 fd  	ld	a2, -40(s0)
   10f82: 97 60 00 00  	auipc	ra, 6
   10f86: e7 80 40 17  	jalr	372(ra)
   10f8a: e2 70        	ld	ra, 56(sp)
   10f8c: 42 74        	ld	s0, 48(sp)
   10f8e: 21 61        	addi	sp, sp, 64
   10f90: 82 80        	ret

0000000000010f92 <_ZN8user_lib4defs10WaitOption5empty17h47223c5a454f1b6bE>:
   10f92: 01 11        	addi	sp, sp, -32
   10f94: 06 ec        	sd	ra, 24(sp)
   10f96: 22 e8        	sd	s0, 16(sp)
   10f98: 00 10        	addi	s0, sp, 32
   10f9a: 01 45        	li	a0, 0
   10f9c: 23 26 a4 fe  	sw	a0, -20(s0)
   10fa0: 03 25 c4 fe  	lw	a0, -20(s0)
   10fa4: e2 60        	ld	ra, 24(sp)
   10fa6: 42 64        	ld	s0, 16(sp)
   10fa8: 05 61        	addi	sp, sp, 32
   10faa: 82 80        	ret

0000000000010fac <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h2966cd403493d534E>:
   10fac: 1d 71        	addi	sp, sp, -96
   10fae: 86 ec        	sd	ra, 88(sp)
   10fb0: a2 e8        	sd	s0, 80(sp)
   10fb2: 80 10        	addi	s0, sp, 96
   10fb4: 23 34 d4 fa  	sd	a3, -88(s0)
   10fb8: 23 38 c4 fa  	sd	a2, -80(s0)
   10fbc: 23 3c b4 fa  	sd	a1, -72(s0)
   10fc0: 23 34 a4 fc  	sd	a0, -56(s0)
   10fc4: 03 35 84 fc  	ld	a0, -56(s0)
   10fc8: 23 30 a4 fc  	sd	a0, -64(s0)
   10fcc: 23 3c b4 fc  	sd	a1, -40(s0)
   10fd0: 23 30 c4 fe  	sd	a2, -32(s0)
   10fd4: 03 45 04 fc  	lbu	a0, -64(s0)
   10fd8: 05 89        	andi	a0, a0, 1
   10fda: 11 e9        	bnez	a0, 0x10fee <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h2966cd403493d534E+0x42>
   10fdc: 09 a0        	j	0x10fde <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h2966cd403493d534E+0x32>
   10fde: 03 25 44 fc  	lw	a0, -60(s0)
   10fe2: 23 26 a4 fe  	sw	a0, -20(s0)
   10fe6: e6 60        	ld	ra, 88(sp)
   10fe8: 46 64        	ld	s0, 80(sp)
   10fea: 25 61        	addi	sp, sp, 96
   10fec: 82 80        	ret
   10fee: 03 37 84 fa  	ld	a4, -88(s0)
   10ff2: 83 35 04 fb  	ld	a1, -80(s0)
   10ff6: 03 35 84 fb  	ld	a0, -72(s0)
   10ffa: 03 46 14 fc  	lbu	a2, -63(s0)
   10ffe: a3 0b c4 fc  	sb	a2, -41(s0)

0000000000011002 <.Lpcrel_hi0>:
   11002: 17 86 00 00  	auipc	a2, 8
   11006: 93 06 66 ac  	addi	a3, a2, -1338
   1100a: 13 06 74 fd  	addi	a2, s0, -41
   1100e: 97 50 00 00  	auipc	ra, 5
   11012: e7 80 60 6a  	jalr	1702(ra)

0000000000011016 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h423a62fa2ee9cd45E>:
   11016: 39 71        	addi	sp, sp, -64
   11018: 06 fc        	sd	ra, 56(sp)
   1101a: 22 f8        	sd	s0, 48(sp)
   1101c: 80 00        	addi	s0, sp, 64
   1101e: 23 30 d4 fc  	sd	a3, -64(s0)
   11022: 23 34 c4 fc  	sd	a2, -56(s0)
   11026: 23 38 b4 fc  	sd	a1, -48(s0)
   1102a: a3 0e a4 fc  	sb	a0, -35(s0)
   1102e: 23 30 b4 fe  	sd	a1, -32(s0)
   11032: 23 34 c4 fe  	sd	a2, -24(s0)
   11036: 03 45 d4 fd  	lbu	a0, -35(s0)
   1103a: 93 05 60 08  	li	a1, 134
   1103e: 63 17 b5 00  	bne	a0, a1, 0x1104c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h423a62fa2ee9cd45E+0x36>
   11042: 09 a0        	j	0x11044 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h423a62fa2ee9cd45E+0x2e>
   11044: e2 70        	ld	ra, 56(sp)
   11046: 42 74        	ld	s0, 48(sp)
   11048: 21 61        	addi	sp, sp, 64
   1104a: 82 80        	ret
   1104c: 03 37 04 fc  	ld	a4, -64(s0)
   11050: 83 35 84 fc  	ld	a1, -56(s0)
   11054: 03 35 04 fd  	ld	a0, -48(s0)
   11058: 03 46 d4 fd  	lbu	a2, -35(s0)
   1105c: 23 0f c4 fc  	sb	a2, -34(s0)

0000000000011060 <.Lpcrel_hi1>:
   11060: 17 86 00 00  	auipc	a2, 8
   11064: 93 06 86 a6  	addi	a3, a2, -1432
   11068: 13 06 e4 fd  	addi	a2, s0, -34
   1106c: 97 50 00 00  	auipc	ra, 5
   11070: e7 80 80 64  	jalr	1608(ra)

0000000000011074 <__rust_alloc_error_handler>:
   11074: 17 03 00 00  	auipc	t1, 0
   11078: 67 00 a3 7c  	jr	1994(t1)

000000000001107c <_ZN62_$LT$user_lib..console..Stdout$u20$as$u20$core..fmt..Write$GT$9write_str17hd4f8ed8f18f2d683E>:
   1107c: 39 71        	addi	sp, sp, -64
   1107e: 06 fc        	sd	ra, 56(sp)
   11080: 22 f8        	sd	s0, 48(sp)
   11082: 80 00        	addi	s0, sp, 64
   11084: 23 34 a4 fc  	sd	a0, -56(s0)
   11088: 23 38 b4 fc  	sd	a1, -48(s0)
   1108c: 23 3c c4 fc  	sd	a2, -40(s0)
   11090: 23 30 b4 fe  	sd	a1, -32(s0)
   11094: 23 34 c4 fe  	sd	a2, -24(s0)
   11098: 05 45        	li	a0, 1
   1109a: 97 30 00 00  	auipc	ra, 3
   1109e: e7 80 60 3f  	jalr	1014(ra)
   110a2: 01 45        	li	a0, 0
   110a4: a3 03 a4 fc  	sb	a0, -57(s0)
   110a8: 03 45 74 fc  	lbu	a0, -57(s0)
   110ac: e2 70        	ld	ra, 56(sp)
   110ae: 42 74        	ld	s0, 48(sp)
   110b0: 21 61        	addi	sp, sp, 64
   110b2: 82 80        	ret

00000000000110b4 <_ZN8user_lib7console5print17hfaff23744b10bf4eE>:
   110b4: 5d 71        	addi	sp, sp, -80
   110b6: 86 e4        	sd	ra, 72(sp)
   110b8: a2 e0        	sd	s0, 64(sp)
   110ba: 80 08        	addi	s0, sp, 80
   110bc: 0c 75        	ld	a1, 40(a0)
   110be: 23 30 b4 fe  	sd	a1, -32(s0)
   110c2: 0c 71        	ld	a1, 32(a0)
   110c4: 23 3c b4 fc  	sd	a1, -40(s0)
   110c8: 0c 6d        	ld	a1, 24(a0)
   110ca: 23 38 b4 fc  	sd	a1, -48(s0)
   110ce: 0c 69        	ld	a1, 16(a0)
   110d0: 23 34 b4 fc  	sd	a1, -56(s0)
   110d4: 0c 65        	ld	a1, 8(a0)
   110d6: 23 30 b4 fc  	sd	a1, -64(s0)
   110da: 08 61        	ld	a0, 0(a0)
   110dc: 23 3c a4 fa  	sd	a0, -72(s0)
   110e0: 13 05 74 fb  	addi	a0, s0, -73
   110e4: 93 05 84 fb  	addi	a1, s0, -72
   110e8: 97 00 00 00  	auipc	ra, 0
   110ec: e7 80 80 0a  	jalr	168(ra)
   110f0: 23 07 a4 fe  	sb	a0, -18(s0)
   110f4: 03 45 e4 fe  	lbu	a0, -18(s0)
   110f8: 05 89        	andi	a0, a0, 1
   110fa: 15 c5        	beqz	a0, 0x11126 <.Lpcrel_hi2+0x18>
   110fc: 09 a0        	j	0x110fe <.Lpcrel_hi0>

00000000000110fe <.Lpcrel_hi0>:
   110fe: 17 85 00 00  	auipc	a0, 8
   11102: 13 05 a5 9e  	addi	a0, a0, -1558

0000000000011106 <.Lpcrel_hi1>:
   11106: 97 85 00 00  	auipc	a1, 8
   1110a: 93 86 25 a1  	addi	a3, a1, -1518

000000000001110e <.Lpcrel_hi2>:
   1110e: 97 85 00 00  	auipc	a1, 8
   11112: 13 87 a5 a3  	addi	a4, a1, -1478
   11116: 93 05 b0 02  	li	a1, 43
   1111a: 13 06 f4 fe  	addi	a2, s0, -17
   1111e: 97 50 00 00  	auipc	ra, 5
   11122: e7 80 60 59  	jalr	1430(ra)
   11126: a6 60        	ld	ra, 72(sp)
   11128: 06 64        	ld	s0, 64(sp)
   1112a: 61 61        	addi	sp, sp, 80
   1112c: 82 80        	ret

000000000001112e <_ZN4core3fmt5Write10write_char17hd7b9796b8a3670c6E>:
   1112e: 1d 71        	addi	sp, sp, -96
   11130: 86 ec        	sd	ra, 88(sp)
   11132: a2 e8        	sd	s0, 80(sp)
   11134: 80 10        	addi	s0, sp, 96
   11136: 23 30 b4 fa  	sd	a1, -96(s0)
   1113a: aa 85        	mv	a1, a0
   1113c: 03 35 04 fa  	ld	a0, -96(s0)
   11140: 23 34 b4 fa  	sd	a1, -88(s0)
   11144: 23 30 b4 fc  	sd	a1, -64(s0)
   11148: 23 26 a4 fc  	sw	a0, -52(s0)
   1114c: 81 45        	li	a1, 0
   1114e: 23 2e b4 fa  	sw	a1, -68(s0)
   11152: 93 05 c4 fb  	addi	a1, s0, -68
   11156: 23 38 b4 fc  	sd	a1, -48(s0)
   1115a: 11 46        	li	a2, 4
   1115c: 23 3c c4 fc  	sd	a2, -40(s0)
   11160: 97 20 00 00  	auipc	ra, 2
   11164: e7 80 a0 b3  	jalr	-1222(ra)
   11168: 2a 86        	mv	a2, a0
   1116a: 03 35 84 fa  	ld	a0, -88(s0)
   1116e: 23 38 c4 fa  	sd	a2, -80(s0)
   11172: 2e 86        	mv	a2, a1
   11174: 83 35 04 fb  	ld	a1, -80(s0)
   11178: 23 30 b4 fe  	sd	a1, -32(s0)
   1117c: 23 34 c4 fe  	sd	a2, -24(s0)
   11180: 97 00 00 00  	auipc	ra, 0
   11184: e7 80 c0 ef  	jalr	-260(ra)
   11188: e6 60        	ld	ra, 88(sp)
   1118a: 46 64        	ld	s0, 80(sp)
   1118c: 25 61        	addi	sp, sp, 96
   1118e: 82 80        	ret

0000000000011190 <_ZN4core3fmt5Write9write_fmt17hd31f3a9e25c81e2bE>:
   11190: 01 11        	addi	sp, sp, -32
   11192: 06 ec        	sd	ra, 24(sp)
   11194: 22 e8        	sd	s0, 16(sp)
   11196: 00 10        	addi	s0, sp, 32
   11198: 23 34 a4 fe  	sd	a0, -24(s0)
   1119c: 97 00 00 00  	auipc	ra, 0
   111a0: e7 80 00 01  	jalr	16(ra)
   111a4: e2 60        	ld	ra, 24(sp)
   111a6: 42 64        	ld	s0, 16(sp)
   111a8: 05 61        	addi	sp, sp, 32
   111aa: 82 80        	ret

00000000000111ac <_ZN75_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write..write_fmt..SpecWriteFmt$GT$14spec_write_fmt17he410b2487b660517E>:
   111ac: 01 11        	addi	sp, sp, -32
   111ae: 06 ec        	sd	ra, 24(sp)
   111b0: 22 e8        	sd	s0, 16(sp)
   111b2: 00 10        	addi	s0, sp, 32
   111b4: 2e 86        	mv	a2, a1
   111b6: 23 34 a4 fe  	sd	a0, -24(s0)

00000000000111ba <.Lpcrel_hi0>:
   111ba: 97 85 00 00  	auipc	a1, 8
   111be: 93 85 65 9a  	addi	a1, a1, -1626
   111c2: 97 60 00 00  	auipc	ra, 6
   111c6: e7 80 a0 91  	jalr	-1766(ra)
   111ca: e2 60        	ld	ra, 24(sp)
   111cc: 42 64        	ld	s0, 16(sp)
   111ce: 05 61        	addi	sp, sp, 32
   111d0: 82 80        	ret

00000000000111d2 <_ZN4core3fmt9Arguments6new_v117hf3b541fa6a2d42f3E>:
   111d2: 55 71        	addi	sp, sp, -208
   111d4: 86 e5        	sd	ra, 200(sp)
   111d6: a2 e1        	sd	s0, 192(sp)
   111d8: 80 09        	addi	s0, sp, 208
   111da: 23 3c e4 f2  	sd	a4, -200(s0)
   111de: 23 30 d4 f4  	sd	a3, -192(s0)
   111e2: 23 34 c4 f4  	sd	a2, -184(s0)
   111e6: 23 38 b4 f4  	sd	a1, -176(s0)
   111ea: 23 3c a4 f4  	sd	a0, -168(s0)
   111ee: 23 30 b4 fc  	sd	a1, -64(s0)
   111f2: 23 34 c4 fc  	sd	a2, -56(s0)
   111f6: 23 38 d4 fc  	sd	a3, -48(s0)
   111fa: 23 3c e4 fc  	sd	a4, -40(s0)
   111fe: 63 6b e6 00  	bltu	a2, a4, 0x11214 <.Lpcrel_hi0>
   11202: 09 a0        	j	0x11204 <_ZN4core3fmt9Arguments6new_v117hf3b541fa6a2d42f3E+0x32>
   11204: 83 35 84 f4  	ld	a1, -184(s0)
   11208: 03 35 84 f3  	ld	a0, -200(s0)
   1120c: 05 05        	addi	a0, a0, 1
   1120e: 63 7f b5 00  	bgeu	a0, a1, 0x1122c <.Lpcrel_hi0+0x18>
   11212: 09 a0        	j	0x11214 <.Lpcrel_hi0>

0000000000011214 <.Lpcrel_hi0>:
   11214: 17 85 00 00  	auipc	a0, 8
   11218: 13 05 c5 98  	addi	a0, a0, -1652
   1121c: 23 30 a4 fe  	sd	a0, -32(s0)
   11220: 05 45        	li	a0, 1
   11222: 23 34 a4 fe  	sd	a0, -24(s0)
   11226: 01 45        	li	a0, 0
   11228: 51 e1        	bnez	a0, 0x112ac <.Lpcrel_hi6>
   1122a: 1d a8        	j	0x11260 <.Lpcrel_hi2>
   1122c: 03 35 84 f3  	ld	a0, -200(s0)
   11230: 83 35 84 f5  	ld	a1, -168(s0)
   11234: 03 36 04 f4  	ld	a2, -192(s0)
   11238: 83 36 84 f4  	ld	a3, -184(s0)
   1123c: 03 37 04 f5  	ld	a4, -176(s0)
   11240: 98 e1        	sd	a4, 0(a1)
   11242: 94 e5        	sd	a3, 8(a1)

0000000000011244 <.Lpcrel_hi1>:
   11244: 97 76 00 00  	auipc	a3, 7
   11248: 93 86 c6 dd  	addi	a3, a3, -548
   1124c: 98 62        	ld	a4, 0(a3)
   1124e: 94 66        	ld	a3, 8(a3)
   11250: 98 f1        	sd	a4, 32(a1)
   11252: 94 f5        	sd	a3, 40(a1)
   11254: 90 e9        	sd	a2, 16(a1)
   11256: 88 ed        	sd	a0, 24(a1)
   11258: ae 60        	ld	ra, 200(sp)
   1125a: 0e 64        	ld	s0, 192(sp)
   1125c: 69 61        	addi	sp, sp, 208
   1125e: 82 80        	ret

0000000000011260 <.Lpcrel_hi2>:
   11260: 17 85 00 00  	auipc	a0, 8
   11264: 13 05 05 94  	addi	a0, a0, -1728
   11268: 23 30 a4 f6  	sd	a0, -160(s0)
   1126c: 05 45        	li	a0, 1
   1126e: 23 34 a4 f6  	sd	a0, -152(s0)

0000000000011272 <.Lpcrel_hi3>:
   11272: 17 75 00 00  	auipc	a0, 7
   11276: 13 05 e5 da  	addi	a0, a0, -594
   1127a: 0c 61        	ld	a1, 0(a0)
   1127c: 08 65        	ld	a0, 8(a0)
   1127e: 23 30 b4 f8  	sd	a1, -128(s0)
   11282: 23 34 a4 f8  	sd	a0, -120(s0)

0000000000011286 <.Lpcrel_hi4>:
   11286: 17 85 00 00  	auipc	a0, 8
   1128a: 13 05 a5 92  	addi	a0, a0, -1750
   1128e: 23 38 a4 f6  	sd	a0, -144(s0)
   11292: 01 45        	li	a0, 0
   11294: 23 3c a4 f6  	sd	a0, -136(s0)

0000000000011298 <.Lpcrel_hi5>:
   11298: 17 85 00 00  	auipc	a0, 8
   1129c: 93 05 85 96  	addi	a1, a0, -1688
   112a0: 13 05 04 f6  	addi	a0, s0, -160
   112a4: 97 50 00 00  	auipc	ra, 5
   112a8: e7 80 c0 37  	jalr	892(ra)

00000000000112ac <.Lpcrel_hi6>:
   112ac: 17 85 00 00  	auipc	a0, 8
   112b0: 93 05 45 8f  	addi	a1, a0, -1804
   112b4: 13 05 04 f9  	addi	a0, s0, -112
   112b8: 23 38 a4 f2  	sd	a0, -208(s0)
   112bc: 05 46        	li	a2, 1
   112be: 97 00 00 00  	auipc	ra, 0
   112c2: e7 80 c0 01  	jalr	28(ra)
   112c6: 03 35 04 f3  	ld	a0, -208(s0)

00000000000112ca <.Lpcrel_hi7>:
   112ca: 97 85 00 00  	auipc	a1, 8
   112ce: 93 85 e5 94  	addi	a1, a1, -1714
   112d2: 97 50 00 00  	auipc	ra, 5
   112d6: e7 80 e0 34  	jalr	846(ra)

00000000000112da <_ZN4core3fmt9Arguments9new_const17h7e282a55c1c907deE>:
   112da: 59 71        	addi	sp, sp, -112
   112dc: 86 f4        	sd	ra, 104(sp)
   112de: a2 f0        	sd	s0, 96(sp)
   112e0: 80 18        	addi	s0, sp, 112
   112e2: 23 3c c4 f8  	sd	a2, -104(s0)
   112e6: 23 30 b4 fa  	sd	a1, -96(s0)
   112ea: 23 34 a4 fa  	sd	a0, -88(s0)
   112ee: 23 30 b4 fe  	sd	a1, -32(s0)
   112f2: 23 34 c4 fe  	sd	a2, -24(s0)
   112f6: 05 45        	li	a0, 1
   112f8: 63 6e c5 02  	bltu	a0, a2, 0x11334 <.Lpcrel_hi10>
   112fc: 09 a0        	j	0x112fe <_ZN4core3fmt9Arguments9new_const17h7e282a55c1c907deE+0x24>
   112fe: 83 35 84 fa  	ld	a1, -88(s0)
   11302: 03 35 84 f9  	ld	a0, -104(s0)
   11306: 03 36 04 fa  	ld	a2, -96(s0)
   1130a: 90 e1        	sd	a2, 0(a1)
   1130c: 88 e5        	sd	a0, 8(a1)

000000000001130e <.Lpcrel_hi8>:
   1130e: 17 75 00 00  	auipc	a0, 7
   11312: 13 05 25 d1  	addi	a0, a0, -750
   11316: 10 61        	ld	a2, 0(a0)
   11318: 08 65        	ld	a0, 8(a0)
   1131a: 90 f1        	sd	a2, 32(a1)
   1131c: 88 f5        	sd	a0, 40(a1)

000000000001131e <.Lpcrel_hi9>:
   1131e: 17 85 00 00  	auipc	a0, 8
   11322: 13 05 25 89  	addi	a0, a0, -1902
   11326: 88 e9        	sd	a0, 16(a1)
   11328: 01 45        	li	a0, 0
   1132a: 88 ed        	sd	a0, 24(a1)
   1132c: a6 70        	ld	ra, 104(sp)
   1132e: 06 74        	ld	s0, 96(sp)
   11330: 65 61        	addi	sp, sp, 112
   11332: 82 80        	ret

0000000000011334 <.Lpcrel_hi10>:
   11334: 17 85 00 00  	auipc	a0, 8
   11338: 93 05 c5 86  	addi	a1, a0, -1940
   1133c: 13 05 04 fb  	addi	a0, s0, -80
   11340: 23 38 a4 f8  	sd	a0, -112(s0)
   11344: 05 46        	li	a2, 1
   11346: 97 00 00 00  	auipc	ra, 0
   1134a: e7 80 40 f9  	jalr	-108(ra)
   1134e: 03 35 04 f9  	ld	a0, -112(s0)

0000000000011352 <.Lpcrel_hi11>:
   11352: 97 85 00 00  	auipc	a1, 8
   11356: 93 85 65 8c  	addi	a1, a1, -1850
   1135a: 97 50 00 00  	auipc	ra, 5
   1135e: e7 80 60 2c  	jalr	710(ra)

0000000000011362 <_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h5c6d513c8acd4f06E>:
   11362: 79 71        	addi	sp, sp, -48
   11364: 06 f4        	sd	ra, 40(sp)
   11366: 22 f0        	sd	s0, 32(sp)
   11368: 00 18        	addi	s0, sp, 48
   1136a: 23 3c b4 fc  	sd	a1, -40(s0)
   1136e: aa 85        	mv	a1, a0
   11370: 03 35 84 fd  	ld	a0, -40(s0)
   11374: 23 30 b4 fe  	sd	a1, -32(s0)
   11378: 23 34 a4 fe  	sd	a0, -24(s0)

000000000001137c <.Lpcrel_hi12>:
   1137c: 97 85 00 00  	auipc	a1, 8
   11380: 93 85 45 8b  	addi	a1, a1, -1868
   11384: 15 46        	li	a2, 5
   11386: 97 60 00 00  	auipc	ra, 6
   1138a: e7 80 00 d7  	jalr	-656(ra)
   1138e: a2 70        	ld	ra, 40(sp)
   11390: 02 74        	ld	s0, 32(sp)
   11392: 45 61        	addi	sp, sp, 48
   11394: 82 80        	ret

0000000000011396 <_ZN8user_lib4fork17h351b59af2a11f886E>:
   11396: 39 71        	addi	sp, sp, -64
   11398: 06 fc        	sd	ra, 56(sp)
   1139a: 22 f8        	sd	s0, 48(sp)
   1139c: 80 00        	addi	s0, sp, 64
   1139e: 45 45        	li	a0, 17
   113a0: 01 47        	li	a4, 0
   113a2: ba 85        	mv	a1, a4
   113a4: 3a 86        	mv	a2, a4
   113a6: ba 86        	mv	a3, a4
   113a8: 97 30 00 00  	auipc	ra, 3
   113ac: e7 80 80 13  	jalr	312(ra)
   113b0: 23 38 a4 fc  	sd	a0, -48(s0)
   113b4: 13 05 04 fd  	addi	a0, s0, -48
   113b8: 23 3c a4 fc  	sd	a0, -40(s0)
   113bc: 03 35 04 fd  	ld	a0, -48(s0)
   113c0: 63 51 05 02  	bgez	a0, 0x113e2 <_ZN8user_lib4fork17h351b59af2a11f886E+0x4c>
   113c4: 09 a0        	j	0x113c6 <_ZN8user_lib4fork17h351b59af2a11f886E+0x30>
   113c6: 03 35 04 fd  	ld	a0, -48(s0)
   113ca: 23 30 a4 fe  	sd	a0, -32(s0)
   113ce: 97 20 00 00  	auipc	ra, 2
   113d2: e7 80 00 c4  	jalr	-960(ra)
   113d6: a3 04 a4 fc  	sb	a0, -55(s0)
   113da: 05 45        	li	a0, 1
   113dc: 23 04 a4 fc  	sb	a0, -56(s0)
   113e0: 19 a8        	j	0x113f6 <_ZN8user_lib4fork17h351b59af2a11f886E+0x60>
   113e2: 03 35 04 fd  	ld	a0, -48(s0)
   113e6: 23 34 a4 fe  	sd	a0, -24(s0)
   113ea: 23 26 a4 fc  	sw	a0, -52(s0)
   113ee: 01 45        	li	a0, 0
   113f0: 23 04 a4 fc  	sb	a0, -56(s0)
   113f4: 09 a0        	j	0x113f6 <_ZN8user_lib4fork17h351b59af2a11f886E+0x60>
   113f6: 03 65 c4 fc  	lwu	a0, -52(s0)
   113fa: 02 15        	slli	a0, a0, 32
   113fc: 83 65 84 fc  	lwu	a1, -56(s0)
   11400: 4d 8d        	or	a0, a0, a1
   11402: e2 70        	ld	ra, 56(sp)
   11404: 42 74        	ld	s0, 48(sp)
   11406: 21 61        	addi	sp, sp, 64
   11408: 82 80        	ret

000000000001140a <_ZN8user_lib6execve17h0d3bf4273c7e06b7E>:
   1140a: 29 71        	addi	sp, sp, -320
   1140c: 06 fe        	sd	ra, 312(sp)
   1140e: 22 fa        	sd	s0, 304(sp)
   11410: 80 02        	addi	s0, sp, 320
   11412: 23 30 f4 ee  	sd	a5, -288(s0)
   11416: 23 3c e4 ec  	sd	a4, -296(s0)
   1141a: 23 30 d4 ec  	sd	a3, -320(s0)
   1141e: 23 34 c4 ec  	sd	a2, -312(s0)
   11422: 2e 86        	mv	a2, a1
   11424: 83 35 04 ec  	ld	a1, -320(s0)
   11428: 23 3c c4 f0  	sd	a2, -232(s0)
   1142c: aa 86        	mv	a3, a0
   1142e: 03 35 84 ec  	ld	a0, -312(s0)
   11432: 23 38 d4 f0  	sd	a3, -240(s0)
   11436: 23 34 d4 f6  	sd	a3, -152(s0)
   1143a: 23 38 c4 f6  	sd	a2, -144(s0)
   1143e: 23 3c a4 f6  	sd	a0, -136(s0)
   11442: 23 30 b4 f8  	sd	a1, -128(s0)
   11446: 23 34 e4 f8  	sd	a4, -120(s0)
   1144a: 23 38 f4 f8  	sd	a5, -112(s0)
   1144e: 97 00 00 00  	auipc	ra, 0
   11452: e7 80 00 4f  	jalr	1264(ra)
   11456: 97 00 00 00  	auipc	ra, 0
   1145a: e7 80 20 58  	jalr	1410(ra)
   1145e: 23 38 a4 ec  	sd	a0, -304(s0)
   11462: 2e 86        	mv	a2, a1
   11464: 83 35 04 ed  	ld	a1, -304(s0)
   11468: 13 05 04 f3  	addi	a0, s0, -208
   1146c: 23 38 a4 ee  	sd	a0, -272(s0)
   11470: 97 10 00 00  	auipc	ra, 1
   11474: e7 80 20 9f  	jalr	-1550(ra)
   11478: 03 35 04 ef  	ld	a0, -272(s0)
   1147c: 81 45        	li	a1, 0
   1147e: 23 30 b4 f2  	sd	a1, -224(s0)
   11482: 23 38 b4 fc  	sd	a1, -48(s0)
   11486: 23 3c b4 fc  	sd	a1, -40(s0)
   1148a: 23 34 b4 fe  	sd	a1, -24(s0)
   1148e: 83 35 84 fe  	ld	a1, -24(s0)
   11492: 23 30 b4 fe  	sd	a1, -32(s0)
   11496: 83 35 04 fe  	ld	a1, -32(s0)
   1149a: 97 10 00 00  	auipc	ra, 1
   1149e: e7 80 e0 19  	jalr	414(ra)
   114a2: 03 35 84 ed  	ld	a0, -296(s0)
   114a6: 83 35 04 ee  	ld	a1, -288(s0)
   114aa: 97 00 00 00  	auipc	ra, 0
   114ae: e7 80 40 49  	jalr	1172(ra)
   114b2: 97 00 00 00  	auipc	ra, 0
   114b6: e7 80 e0 4f  	jalr	1278(ra)
   114ba: 23 34 a4 ee  	sd	a0, -280(s0)
   114be: 2e 86        	mv	a2, a1
   114c0: 83 35 84 ee  	ld	a1, -280(s0)
   114c4: 13 05 84 f4  	addi	a0, s0, -184
   114c8: 23 3c a4 ee  	sd	a0, -264(s0)
   114cc: 97 10 00 00  	auipc	ra, 1
   114d0: e7 80 60 97  	jalr	-1674(ra)
   114d4: 03 35 84 ef  	ld	a0, -264(s0)
   114d8: 83 35 04 f2  	ld	a1, -224(s0)
   114dc: 23 38 b4 fa  	sd	a1, -80(s0)
   114e0: 23 3c b4 fa  	sd	a1, -72(s0)
   114e4: 23 34 b4 fc  	sd	a1, -56(s0)
   114e8: 83 35 84 fc  	ld	a1, -56(s0)
   114ec: 23 30 b4 fc  	sd	a1, -64(s0)
   114f0: 83 35 04 fc  	ld	a1, -64(s0)
   114f4: 97 10 00 00  	auipc	ra, 1
   114f8: e7 80 40 14  	jalr	324(ra)
   114fc: 03 35 04 ef  	ld	a0, -272(s0)
   11500: 97 10 00 00  	auipc	ra, 1
   11504: e7 80 a0 23  	jalr	570(ra)
   11508: 2a 86        	mv	a2, a0
   1150a: 03 35 84 ef  	ld	a0, -264(s0)
   1150e: 23 30 c4 f0  	sd	a2, -256(s0)
   11512: 23 34 b4 f0  	sd	a1, -248(s0)
   11516: 97 10 00 00  	auipc	ra, 1
   1151a: e7 80 40 22  	jalr	548(ra)
   1151e: 03 36 04 f0  	ld	a2, -256(s0)
   11522: 83 36 84 f0  	ld	a3, -248(s0)
   11526: 2a 87        	mv	a4, a0
   11528: 03 35 04 f1  	ld	a0, -240(s0)
   1152c: ae 87        	mv	a5, a1
   1152e: 83 35 84 f1  	ld	a1, -232(s0)
   11532: 97 30 00 00  	auipc	ra, 3
   11536: e7 80 c0 02  	jalr	44(ra)
   1153a: aa 85        	mv	a1, a0
   1153c: 03 35 04 f2  	ld	a0, -224(s0)
   11540: 23 30 b4 f6  	sd	a1, -160(s0)
   11544: 93 05 04 f6  	addi	a1, s0, -160
   11548: 23 3c b4 f8  	sd	a1, -104(s0)
   1154c: 83 35 04 f6  	ld	a1, -160(s0)
   11550: 63 4e b5 00  	blt	a0, a1, 0x1156c <_ZN8user_lib6execve17h0d3bf4273c7e06b7E+0x162>
   11554: 09 a0        	j	0x11556 <_ZN8user_lib6execve17h0d3bf4273c7e06b7E+0x14c>
   11556: 03 35 04 f6  	ld	a0, -160(s0)
   1155a: 23 30 a4 fa  	sd	a0, -96(s0)
   1155e: 97 20 00 00  	auipc	ra, 2
   11562: e7 80 00 ab  	jalr	-1360(ra)
   11566: a3 07 a4 f2  	sb	a0, -209(s0)
   1156a: 11 a8        	j	0x1157e <_ZN8user_lib6execve17h0d3bf4273c7e06b7E+0x174>
   1156c: 03 35 04 f6  	ld	a0, -160(s0)
   11570: 23 34 a4 fa  	sd	a0, -88(s0)
   11574: 13 05 60 08  	li	a0, 134
   11578: a3 07 a4 f2  	sb	a0, -209(s0)
   1157c: 09 a0        	j	0x1157e <_ZN8user_lib6execve17h0d3bf4273c7e06b7E+0x174>
   1157e: 13 05 84 f4  	addi	a0, s0, -184
   11582: 97 10 00 00  	auipc	ra, 1
   11586: e7 80 e0 5a  	jalr	1454(ra)
   1158a: 13 05 04 f3  	addi	a0, s0, -208
   1158e: 97 10 00 00  	auipc	ra, 1
   11592: e7 80 20 5a  	jalr	1442(ra)
   11596: 03 45 f4 f2  	lbu	a0, -209(s0)
   1159a: f2 70        	ld	ra, 312(sp)
   1159c: 52 74        	ld	s0, 304(sp)
   1159e: 31 61        	addi	sp, sp, 320
   115a0: 82 80        	ret

00000000000115a2 <_ZN8user_lib7waitpid17hbcd1961ae6278dccE>:
   115a2: 59 71        	addi	sp, sp, -112
   115a4: 86 f4        	sd	ra, 104(sp)
   115a6: a2 f0        	sd	s0, 96(sp)
   115a8: 80 18        	addi	s0, sp, 112
   115aa: 23 3c d4 f8  	sd	a3, -104(s0)
   115ae: b2 86        	mv	a3, a2
   115b0: 03 36 84 f9  	ld	a2, -104(s0)
   115b4: 23 30 d4 fa  	sd	a3, -96(s0)
   115b8: ae 86        	mv	a3, a1
   115ba: 83 35 04 fa  	ld	a1, -96(s0)
   115be: 23 34 d4 fa  	sd	a3, -88(s0)
   115c2: aa 86        	mv	a3, a0
   115c4: 03 35 84 fa  	ld	a0, -88(s0)
   115c8: 23 38 d4 fa  	sd	a3, -80(s0)
   115cc: 23 22 a4 fc  	sw	a0, -60(s0)
   115d0: 23 34 b4 fc  	sd	a1, -56(s0)
   115d4: 23 2a c4 fc  	sw	a2, -44(s0)
   115d8: 01 25        	sext.w	a0, a0
   115da: 97 30 00 00  	auipc	ra, 3
   115de: e7 80 e0 fe  	jalr	-18(ra)
   115e2: 23 3c a4 fa  	sd	a0, -72(s0)
   115e6: 13 05 84 fb  	addi	a0, s0, -72
   115ea: 23 3c a4 fc  	sd	a0, -40(s0)
   115ee: 83 35 84 fb  	ld	a1, -72(s0)
   115f2: 01 45        	li	a0, 0
   115f4: 63 43 b5 02  	blt	a0, a1, 0x1161a <_ZN8user_lib7waitpid17hbcd1961ae6278dccE+0x78>
   115f8: 09 a0        	j	0x115fa <_ZN8user_lib7waitpid17hbcd1961ae6278dccE+0x58>
   115fa: 03 35 84 fb  	ld	a0, -72(s0)
   115fe: 23 30 a4 fe  	sd	a0, -32(s0)
   11602: 97 20 00 00  	auipc	ra, 2
   11606: e7 80 c0 a0  	jalr	-1524(ra)
   1160a: 83 35 04 fb  	ld	a1, -80(s0)
   1160e: a3 80 a5 00  	sb	a0, 1(a1)
   11612: 05 45        	li	a0, 1
   11614: 23 80 a5 00  	sb	a0, 0(a1)
   11618: 21 a8        	j	0x11630 <_ZN8user_lib7waitpid17hbcd1961ae6278dccE+0x8e>
   1161a: 83 35 04 fb  	ld	a1, -80(s0)
   1161e: 03 35 84 fb  	ld	a0, -72(s0)
   11622: 23 34 a4 fe  	sd	a0, -24(s0)
   11626: 88 e5        	sd	a0, 8(a1)
   11628: 01 45        	li	a0, 0
   1162a: 23 80 a5 00  	sb	a0, 0(a1)
   1162e: 09 a0        	j	0x11630 <_ZN8user_lib7waitpid17hbcd1961ae6278dccE+0x8e>
   11630: a6 70        	ld	ra, 104(sp)
   11632: 06 74        	ld	s0, 96(sp)
   11634: 65 61        	addi	sp, sp, 112
   11636: 82 80        	ret

0000000000011638 <_ZN8user_lib4exit17h761dbd70b442fbc9E>:
   11638: 01 11        	addi	sp, sp, -32
   1163a: 06 ec        	sd	ra, 24(sp)
   1163c: 22 e8        	sd	s0, 16(sp)
   1163e: 00 10        	addi	s0, sp, 32
   11640: 23 26 a4 fe  	sw	a0, -20(s0)
   11644: 97 30 00 00  	auipc	ra, 3
   11648: e7 80 80 fe  	jalr	-24(ra)

000000000001164c <_ZN8user_lib11sched_yield17h65bac10873b3815fE>:
   1164c: 39 71        	addi	sp, sp, -64
   1164e: 06 fc        	sd	ra, 56(sp)
   11650: 22 f8        	sd	s0, 48(sp)
   11652: 80 00        	addi	s0, sp, 64
   11654: 97 30 00 00  	auipc	ra, 3
   11658: e7 80 a0 04  	jalr	74(ra)
   1165c: 23 38 a4 fc  	sd	a0, -48(s0)
   11660: 13 05 04 fd  	addi	a0, s0, -48
   11664: 23 3c a4 fc  	sd	a0, -40(s0)
   11668: 03 35 04 fd  	ld	a0, -48(s0)
   1166c: 63 5e 05 00  	bgez	a0, 0x11688 <_ZN8user_lib11sched_yield17h65bac10873b3815fE+0x3c>
   11670: 09 a0        	j	0x11672 <_ZN8user_lib11sched_yield17h65bac10873b3815fE+0x26>
   11672: 03 35 04 fd  	ld	a0, -48(s0)
   11676: 23 30 a4 fe  	sd	a0, -32(s0)
   1167a: 97 20 00 00  	auipc	ra, 2
   1167e: e7 80 40 99  	jalr	-1644(ra)
   11682: a3 07 a4 fc  	sb	a0, -49(s0)
   11686: 11 a8        	j	0x1169a <_ZN8user_lib11sched_yield17h65bac10873b3815fE+0x4e>
   11688: 03 35 04 fd  	ld	a0, -48(s0)
   1168c: 23 34 a4 fe  	sd	a0, -24(s0)
   11690: 13 05 60 08  	li	a0, 134
   11694: a3 07 a4 fc  	sb	a0, -49(s0)
   11698: 09 a0        	j	0x1169a <_ZN8user_lib11sched_yield17h65bac10873b3815fE+0x4e>
   1169a: 03 45 f4 fc  	lbu	a0, -49(s0)
   1169e: e2 70        	ld	ra, 56(sp)
   116a0: 42 74        	ld	s0, 48(sp)
   116a2: 21 61        	addi	sp, sp, 64
   116a4: 82 80        	ret

00000000000116a6 <__rust_alloc>:
   116a6: 79 71        	addi	sp, sp, -48
   116a8: 06 f4        	sd	ra, 40(sp)
   116aa: 22 f0        	sd	s0, 32(sp)
   116ac: 00 18        	addi	s0, sp, 48
   116ae: 23 30 a4 fe  	sd	a0, -32(s0)
   116b2: 23 34 b4 fe  	sd	a1, -24(s0)
   116b6: 97 10 00 00  	auipc	ra, 1
   116ba: e7 80 80 1f  	jalr	504(ra)
   116be: 23 3c a4 fc  	sd	a0, -40(s0)
   116c2: 2e 86        	mv	a2, a1
   116c4: 83 35 84 fd  	ld	a1, -40(s0)

00000000000116c8 <.Lpcrel_hi9>:
   116c8: 17 25 01 00  	auipc	a0, 18
   116cc: 13 05 05 b5  	addi	a0, a0, -1200
   116d0: 97 40 00 00  	auipc	ra, 4
   116d4: e7 80 e0 70  	jalr	1806(ra)
   116d8: a2 70        	ld	ra, 40(sp)
   116da: 02 74        	ld	s0, 32(sp)
   116dc: 45 61        	addi	sp, sp, 48
   116de: 82 80        	ret

00000000000116e0 <__rust_dealloc>:
   116e0: 39 71        	addi	sp, sp, -64
   116e2: 06 fc        	sd	ra, 56(sp)
   116e4: 22 f8        	sd	s0, 48(sp)
   116e6: 80 00        	addi	s0, sp, 64
   116e8: 23 30 c4 fc  	sd	a2, -64(s0)
   116ec: 2e 86        	mv	a2, a1
   116ee: 83 35 04 fc  	ld	a1, -64(s0)
   116f2: 23 34 c4 fc  	sd	a2, -56(s0)
   116f6: 2a 86        	mv	a2, a0
   116f8: 03 35 84 fc  	ld	a0, -56(s0)
   116fc: 23 38 c4 fc  	sd	a2, -48(s0)
   11700: 23 3c c4 fc  	sd	a2, -40(s0)
   11704: 23 30 a4 fe  	sd	a0, -32(s0)
   11708: 23 34 b4 fe  	sd	a1, -24(s0)
   1170c: 97 10 00 00  	auipc	ra, 1
   11710: e7 80 20 1a  	jalr	418(ra)
   11714: 2a 86        	mv	a2, a0
   11716: ae 86        	mv	a3, a1
   11718: 83 35 04 fd  	ld	a1, -48(s0)

000000000001171c <.Lpcrel_hi10>:
   1171c: 17 25 01 00  	auipc	a0, 18
   11720: 13 05 c5 af  	addi	a0, a0, -1284
   11724: 97 40 00 00  	auipc	ra, 4
   11728: e7 80 c0 7c  	jalr	1996(ra)
   1172c: e2 70        	ld	ra, 56(sp)
   1172e: 42 74        	ld	s0, 48(sp)
   11730: 21 61        	addi	sp, sp, 64
   11732: 82 80        	ret

0000000000011734 <__rust_realloc>:
   11734: 5d 71        	addi	sp, sp, -80
   11736: 86 e4        	sd	ra, 72(sp)
   11738: a2 e0        	sd	s0, 64(sp)
   1173a: 80 08        	addi	s0, sp, 80
   1173c: 23 30 d4 fc  	sd	a3, -64(s0)
   11740: 23 38 c4 fa  	sd	a2, -80(s0)
   11744: 2e 86        	mv	a2, a1
   11746: 83 35 04 fb  	ld	a1, -80(s0)
   1174a: 23 3c c4 fa  	sd	a2, -72(s0)
   1174e: 2a 86        	mv	a2, a0
   11750: 03 35 84 fb  	ld	a0, -72(s0)
   11754: 23 34 c4 fc  	sd	a2, -56(s0)
   11758: 23 38 c4 fc  	sd	a2, -48(s0)
   1175c: 23 3c a4 fc  	sd	a0, -40(s0)
   11760: 23 30 b4 fe  	sd	a1, -32(s0)
   11764: 23 34 d4 fe  	sd	a3, -24(s0)
   11768: 97 10 00 00  	auipc	ra, 1
   1176c: e7 80 60 14  	jalr	326(ra)
   11770: 03 37 04 fc  	ld	a4, -64(s0)
   11774: 2a 86        	mv	a2, a0
   11776: ae 86        	mv	a3, a1
   11778: 83 35 84 fc  	ld	a1, -56(s0)

000000000001177c <.Lpcrel_hi11>:
   1177c: 17 25 01 00  	auipc	a0, 18
   11780: 13 05 c5 a9  	addi	a0, a0, -1380
   11784: 97 10 00 00  	auipc	ra, 1
   11788: e7 80 00 89  	jalr	-1904(ra)
   1178c: a6 60        	ld	ra, 72(sp)
   1178e: 06 64        	ld	s0, 64(sp)
   11790: 61 61        	addi	sp, sp, 80
   11792: 82 80        	ret

0000000000011794 <__rust_alloc_zeroed>:
   11794: 79 71        	addi	sp, sp, -48
   11796: 06 f4        	sd	ra, 40(sp)
   11798: 22 f0        	sd	s0, 32(sp)
   1179a: 00 18        	addi	s0, sp, 48
   1179c: 23 30 a4 fe  	sd	a0, -32(s0)
   117a0: 23 34 b4 fe  	sd	a1, -24(s0)
   117a4: 97 10 00 00  	auipc	ra, 1
   117a8: e7 80 a0 10  	jalr	266(ra)
   117ac: 23 3c a4 fc  	sd	a0, -40(s0)
   117b0: 2e 86        	mv	a2, a1
   117b2: 83 35 84 fd  	ld	a1, -40(s0)

00000000000117b6 <.Lpcrel_hi12>:
   117b6: 17 25 01 00  	auipc	a0, 18
   117ba: 13 05 25 a6  	addi	a0, a0, -1438
   117be: 97 00 00 00  	auipc	ra, 0
   117c2: e7 80 80 7e  	jalr	2024(ra)
   117c6: a2 70        	ld	ra, 40(sp)
   117c8: 02 74        	ld	s0, 32(sp)
   117ca: 45 61        	addi	sp, sp, 48
   117cc: 82 80        	ret

00000000000117ce <_ZN8user_lib18handle_alloc_error17h4bebd4ae31214ba1E>:
   117ce: 75 71        	addi	sp, sp, -144
   117d0: 06 e5        	sd	ra, 136(sp)
   117d2: 22 e1        	sd	s0, 128(sp)
   117d4: 00 09        	addi	s0, sp, 144
   117d6: 23 30 a4 f8  	sd	a0, -128(s0)
   117da: 23 34 b4 f8  	sd	a1, -120(s0)
   117de: 93 05 04 f8  	addi	a1, s0, -128
   117e2: 23 30 b4 fe  	sd	a1, -32(s0)

00000000000117e6 <.Lpcrel_hi13>:
   117e6: 17 15 00 00  	auipc	a0, 1
   117ea: 13 05 45 1c  	addi	a0, a0, 452
   117ee: 23 34 a4 fe  	sd	a0, -24(s0)
   117f2: 23 38 b4 fc  	sd	a1, -48(s0)
   117f6: 23 3c a4 fc  	sd	a0, -40(s0)
   117fa: 83 35 04 fd  	ld	a1, -48(s0)
   117fe: 03 35 84 fd  	ld	a0, -40(s0)
   11802: 23 30 b4 fc  	sd	a1, -64(s0)
   11806: 23 34 a4 fc  	sd	a0, -56(s0)

000000000001180a <.Lpcrel_hi14>:
   1180a: 17 75 00 00  	auipc	a0, 7
   1180e: 93 05 65 47  	addi	a1, a0, 1142
   11812: 13 05 04 f9  	addi	a0, s0, -112
   11816: 23 3c a4 f6  	sd	a0, -136(s0)
   1181a: 93 06 04 fc  	addi	a3, s0, -64
   1181e: 05 47        	li	a4, 1
   11820: 3a 86        	mv	a2, a4
   11822: 97 00 00 00  	auipc	ra, 0
   11826: e7 80 00 9b  	jalr	-1616(ra)
   1182a: 03 35 84 f7  	ld	a0, -136(s0)

000000000001182e <.Lpcrel_hi15>:
   1182e: 97 75 00 00  	auipc	a1, 7
   11832: 93 85 25 46  	addi	a1, a1, 1122
   11836: 97 50 00 00  	auipc	ra, 5
   1183a: e7 80 a0 de  	jalr	-534(ra)

000000000001183e <__rg_oom>:
   1183e: 01 11        	addi	sp, sp, -32
   11840: 06 ec        	sd	ra, 24(sp)
   11842: 22 e8        	sd	s0, 16(sp)
   11844: 00 10        	addi	s0, sp, 32
   11846: 23 30 a4 fe  	sd	a0, -32(s0)
   1184a: 23 34 b4 fe  	sd	a1, -24(s0)
   1184e: 97 10 00 00  	auipc	ra, 1
   11852: e7 80 00 06  	jalr	96(ra)
   11856: 97 00 00 00  	auipc	ra, 0
   1185a: e7 80 80 f7  	jalr	-136(ra)

000000000001185e <_ZN4core4sync6atomic11AtomicUsize4load17h8589a6783df101cbE>:
   1185e: 79 71        	addi	sp, sp, -48
   11860: 06 f4        	sd	ra, 40(sp)
   11862: 22 f0        	sd	s0, 32(sp)
   11864: 00 18        	addi	s0, sp, 48
   11866: 23 3c a4 fc  	sd	a0, -40(s0)
   1186a: a3 03 b4 fe  	sb	a1, -25(s0)
   1186e: 23 34 a4 fe  	sd	a0, -24(s0)
   11872: 97 50 00 00  	auipc	ra, 5
   11876: e7 80 60 96  	jalr	-1690(ra)
   1187a: a2 70        	ld	ra, 40(sp)
   1187c: 02 74        	ld	s0, 32(sp)
   1187e: 45 61        	addi	sp, sp, 48
   11880: 82 80        	ret

0000000000011882 <_ZN4core4sync6atomic11AtomicUsize9fetch_add17ha6ddb245f8e1e5c6E>:
   11882: 1d 71        	addi	sp, sp, -96
   11884: 86 ec        	sd	ra, 88(sp)
   11886: a2 e8        	sd	s0, 80(sp)
   11888: 80 10        	addi	s0, sp, 96
   1188a: 23 34 b4 fa  	sd	a1, -88(s0)
   1188e: 23 38 a4 fa  	sd	a0, -80(s0)
   11892: a3 03 c4 fc  	sb	a2, -57(s0)
   11896: 23 38 a4 fc  	sd	a0, -48(s0)
   1189a: 23 3c b4 fc  	sd	a1, -40(s0)
   1189e: 23 30 a4 fe  	sd	a0, -32(s0)
   118a2: 23 34 a4 fe  	sd	a0, -24(s0)
   118a6: 03 45 74 fc  	lbu	a0, -57(s0)
   118aa: 23 3c a4 fa  	sd	a0, -72(s0)
   118ae: 03 35 84 fb  	ld	a0, -72(s0)
   118b2: 0e 05        	slli	a0, a0, 3

00000000000118b4 <.Lpcrel_hi0>:
   118b4: 97 75 00 00  	auipc	a1, 7
   118b8: 93 85 45 3f  	addi	a1, a1, 1012
   118bc: 2e 95        	add	a0, a0, a1
   118be: 08 61        	ld	a0, 0(a0)
   118c0: 02 85        	jr	a0
   118c2: 00 00        	unimp

00000000000118c4 <.LBB1_3>:
   118c4: 03 35 04 fb  	ld	a0, -80(s0)
   118c8: 83 35 84 fa  	ld	a1, -88(s0)
   118cc: 2f 35 b5 00  	amoadd.d	a0, a1, (a0)
   118d0: 23 34 a4 fc  	sd	a0, -56(s0)
   118d4: a9 a0        	j	0x1191e <.LBB1_7+0x12>

00000000000118d6 <.LBB1_4>:
   118d6: 03 35 04 fb  	ld	a0, -80(s0)
   118da: 83 35 84 fa  	ld	a1, -88(s0)
   118de: 2f 35 b5 02  	amoadd.d.rl	a0, a1, (a0)
   118e2: 23 34 a4 fc  	sd	a0, -56(s0)
   118e6: 25 a8        	j	0x1191e <.LBB1_7+0x12>

00000000000118e8 <.LBB1_5>:
   118e8: 03 35 04 fb  	ld	a0, -80(s0)
   118ec: 83 35 84 fa  	ld	a1, -88(s0)
   118f0: 2f 35 b5 04  	amoadd.d.aq	a0, a1, (a0)
   118f4: 23 34 a4 fc  	sd	a0, -56(s0)
   118f8: 1d a0        	j	0x1191e <.LBB1_7+0x12>

00000000000118fa <.LBB1_6>:
   118fa: 03 35 04 fb  	ld	a0, -80(s0)
   118fe: 83 35 84 fa  	ld	a1, -88(s0)
   11902: 2f 35 b5 06  	amoadd.d.aqrl	a0, a1, (a0)
   11906: 23 34 a4 fc  	sd	a0, -56(s0)
   1190a: 11 a8        	j	0x1191e <.LBB1_7+0x12>

000000000001190c <.LBB1_7>:
   1190c: 03 35 04 fb  	ld	a0, -80(s0)
   11910: 83 35 84 fa  	ld	a1, -88(s0)
   11914: 2f 35 b5 06  	amoadd.d.aqrl	a0, a1, (a0)
   11918: 23 34 a4 fc  	sd	a0, -56(s0)
   1191c: 09 a0        	j	0x1191e <.LBB1_7+0x12>
   1191e: 03 35 84 fc  	ld	a0, -56(s0)
   11922: e6 60        	ld	ra, 88(sp)
   11924: 46 64        	ld	s0, 80(sp)
   11926: 25 61        	addi	sp, sp, 96
   11928: 82 80        	ret

000000000001192a <_ZN4core4sync6atomic14spin_loop_hint17he9979f571dc2adc1E>:
   1192a: 41 11        	addi	sp, sp, -16
   1192c: 06 e4        	sd	ra, 8(sp)
   1192e: 22 e0        	sd	s0, 0(sp)
   11930: 00 08        	addi	s0, sp, 16
   11932: 0f 00 00 01  	fence	w, 0
   11936: a2 60        	ld	ra, 8(sp)
   11938: 02 64        	ld	s0, 0(sp)
   1193a: 41 01        	addi	sp, sp, 16
   1193c: 82 80        	ret

000000000001193e <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17h1cc33eaa96cfd2f7E>:
   1193e: 59 71        	addi	sp, sp, -112
   11940: 86 f4        	sd	ra, 104(sp)
   11942: a2 f0        	sd	s0, 96(sp)
   11944: 80 18        	addi	s0, sp, 112
   11946: 23 38 b4 f8  	sd	a1, -112(s0)
   1194a: 23 3c a4 f8  	sd	a0, -104(s0)
   1194e: 23 30 a4 fc  	sd	a0, -64(s0)
   11952: 23 34 b4 fc  	sd	a1, -56(s0)
   11956: 23 38 a4 fc  	sd	a0, -48(s0)
   1195a: 01 45        	li	a0, 0
   1195c: 09 ed        	bnez	a0, 0x11976 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17h1cc33eaa96cfd2f7E+0x38>
   1195e: 09 a0        	j	0x11960 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17h1cc33eaa96cfd2f7E+0x22>
   11960: 03 35 84 f9  	ld	a0, -104(s0)
   11964: 83 35 04 f9  	ld	a1, -112(s0)
   11968: 23 3c b4 fc  	sd	a1, -40(s0)
   1196c: 92 05        	slli	a1, a1, 4
   1196e: 2e 95        	add	a0, a0, a1
   11970: 23 38 a4 fa  	sd	a0, -80(s0)
   11974: 01 a8        	j	0x11984 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17h1cc33eaa96cfd2f7E+0x46>
   11976: 03 35 04 f9  	ld	a0, -112(s0)
   1197a: 23 30 a4 fe  	sd	a0, -32(s0)
   1197e: 23 38 a4 fa  	sd	a0, -80(s0)
   11982: 09 a0        	j	0x11984 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17h1cc33eaa96cfd2f7E+0x46>
   11984: 03 35 84 f9  	ld	a0, -104(s0)
   11988: 23 34 a4 fe  	sd	a0, -24(s0)
   1198c: 23 3c a4 fa  	sd	a0, -72(s0)
   11990: 03 35 04 fb  	ld	a0, -80(s0)
   11994: 83 35 84 fb  	ld	a1, -72(s0)
   11998: 23 30 b4 fa  	sd	a1, -96(s0)
   1199c: 23 34 a4 fa  	sd	a0, -88(s0)
   119a0: 03 35 04 fa  	ld	a0, -96(s0)
   119a4: 83 35 84 fa  	ld	a1, -88(s0)
   119a8: a6 70        	ld	ra, 104(sp)
   119aa: 06 74        	ld	s0, 96(sp)
   119ac: 65 61        	addi	sp, sp, 112
   119ae: 82 80        	ret

00000000000119b0 <_ZN4core4iter6traits8iterator8Iterator3map17h049ae640914957d3E>:
   119b0: 39 71        	addi	sp, sp, -64
   119b2: 06 fc        	sd	ra, 56(sp)
   119b4: 22 f8        	sd	s0, 48(sp)
   119b6: 80 00        	addi	s0, sp, 64
   119b8: 23 3c a4 fc  	sd	a0, -40(s0)
   119bc: 23 30 b4 fe  	sd	a1, -32(s0)
   119c0: 23 34 a4 fc  	sd	a0, -56(s0)
   119c4: 23 38 b4 fc  	sd	a1, -48(s0)
   119c8: 03 35 84 fc  	ld	a0, -56(s0)
   119cc: 83 35 04 fd  	ld	a1, -48(s0)
   119d0: e2 70        	ld	ra, 56(sp)
   119d2: 42 74        	ld	s0, 48(sp)
   119d4: 21 61        	addi	sp, sp, 64
   119d6: 82 80        	ret

00000000000119d8 <_ZN4core4iter6traits8iterator8Iterator3map17h1ed5433ea02967d5E>:
   119d8: 39 71        	addi	sp, sp, -64
   119da: 06 fc        	sd	ra, 56(sp)
   119dc: 22 f8        	sd	s0, 48(sp)
   119de: 80 00        	addi	s0, sp, 64
   119e0: 23 3c a4 fc  	sd	a0, -40(s0)
   119e4: 23 30 b4 fe  	sd	a1, -32(s0)
   119e8: 23 34 a4 fc  	sd	a0, -56(s0)
   119ec: 23 38 b4 fc  	sd	a1, -48(s0)
   119f0: 03 35 84 fc  	ld	a0, -56(s0)
   119f4: 83 35 04 fd  	ld	a1, -48(s0)
   119f8: e2 70        	ld	ra, 56(sp)
   119fa: 42 74        	ld	s0, 48(sp)
   119fc: 21 61        	addi	sp, sp, 64
   119fe: 82 80        	ret

0000000000011a00 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE>:
   11a00: 6d 71        	addi	sp, sp, -272
   11a02: 06 e6        	sd	ra, 264(sp)
   11a04: 22 e2        	sd	s0, 256(sp)
   11a06: 00 0a        	addi	s0, sp, 272
   11a08: 23 34 c4 f0  	sd	a2, -248(s0)
   11a0c: 05 46        	li	a2, 1
   11a0e: 23 38 c4 f0  	sd	a2, -240(s0)
   11a12: 23 3c a4 f0  	sd	a0, -232(s0)
   11a16: 23 30 b4 f2  	sd	a1, -224(s0)
   11a1a: 01 45        	li	a0, 0
   11a1c: 21 e1        	bnez	a0, 0x11a5c <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x5c>
   11a1e: 09 a0        	j	0x11a20 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x20>
   11a20: 13 05 04 f2  	addi	a0, s0, -224
   11a24: 23 30 a4 f6  	sd	a0, -160(s0)
   11a28: 03 35 04 f2  	ld	a0, -224(s0)
   11a2c: 23 38 a4 f2  	sd	a0, -208(s0)
   11a30: 13 05 84 f1  	addi	a0, s0, -232
   11a34: 23 34 a4 f6  	sd	a0, -152(s0)
   11a38: 13 05 04 f3  	addi	a0, s0, -208
   11a3c: 23 38 a4 f6  	sd	a0, -144(s0)
   11a40: 03 35 84 f1  	ld	a0, -232(s0)
   11a44: 23 3c a4 f6  	sd	a0, -136(s0)
   11a48: 83 35 04 f3  	ld	a1, -208(s0)
   11a4c: 23 30 b4 f8  	sd	a1, -128(s0)
   11a50: 2d 8d        	xor	a0, a0, a1
   11a52: 13 35 15 00  	seqz	a0, a0
   11a56: a3 07 a4 f2  	sb	a0, -209(s0)
   11a5a: 21 a8        	j	0x11a72 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x72>
   11a5c: 03 35 04 f2  	ld	a0, -224(s0)
   11a60: 23 34 a4 f8  	sd	a0, -120(s0)
   11a64: 23 38 a4 f8  	sd	a0, -112(s0)
   11a68: 13 35 15 00  	seqz	a0, a0
   11a6c: a3 07 a4 f2  	sb	a0, -209(s0)
   11a70: 09 a0        	j	0x11a72 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x72>
   11a72: 03 45 f4 f2  	lbu	a0, -209(s0)
   11a76: 05 89        	andi	a0, a0, 1
   11a78: 19 e5        	bnez	a0, 0x11a86 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x86>
   11a7a: 09 a0        	j	0x11a7c <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x7c>
   11a7c: 01 45        	li	a0, 0
   11a7e: 23 3c a4 f2  	sd	a0, -200(s0)
   11a82: 39 e1        	bnez	a0, 0x11ac8 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0xc8>
   11a84: 01 a8        	j	0x11a94 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h5686b753edb0e31dE+0x94>
   11a86: 03 35 84 f0  	ld	a0, -248(s0)
   11a8a: 97 10 00 00  	auipc	ra, 1
   11a8e: e7 80 60 07  	jalr	118(ra)
   11a92: d9 a8        	j	0x11b68 <.Lpcrel_hi1+0x86>
   11a94: 13 05 04 f2  	addi	a0, s0, -224
   11a98: 23 3c a4 f8  	sd	a0, -104(s0)
   11a9c: 83 35 04 f2  	ld	a1, -224(s0)
   11aa0: 23 3c b4 ee  	sd	a1, -264(s0)
   11aa4: 23 30 b4 fa  	sd	a1, -96(s0)
   11aa8: 03 35 84 f1  	ld	a0, -232(s0)
   11aac: 23 30 a4 f0  	sd	a0, -256(s0)
   11ab0: 23 34 a4 fa  	sd	a0, -88(s0)
   11ab4: 23 38 b4 fa  	sd	a1, -80(s0)
   11ab8: 23 3c a4 fa  	sd	a0, -72(s0)
   11abc: 41 45        	li	a0, 16
   11abe: 23 30 a4 fc  	sd	a0, -64(s0)
   11ac2: 05 45        	li	a0, 1
   11ac4: 0d e9        	bnez	a0, 0x11af6 <.Lpcrel_hi1+0x14>
   11ac6: 11 a8        	j	0x11ada <.Lpcrel_hi0>
   11ac8: 03 35 04 f2  	ld	a0, -224(s0)
   11acc: 23 34 a4 fc  	sd	a0, -56(s0)
   11ad0: 23 38 a4 fc  	sd	a0, -48(s0)
   11ad4: 23 30 a4 f4  	sd	a0, -192(s0)
   11ad8: 1d a8        	j	0x11b0e <.Lpcrel_hi1+0x2c>

0000000000011ada <.Lpcrel_hi0>:
   11ada: 17 75 00 00  	auipc	a0, 7
   11ade: 13 05 65 1f  	addi	a0, a0, 502

0000000000011ae2 <.Lpcrel_hi1>:
   11ae2: 97 75 00 00  	auipc	a1, 7
   11ae6: 13 86 e5 28  	addi	a2, a1, 654
   11aea: 93 05 90 04  	li	a1, 73
   11aee: 97 50 00 00  	auipc	ra, 5
   11af2: e7 80 e0 b5  	jalr	-1186(ra)
   11af6: 01 45        	li	a0, 0
   11af8: 6d f1        	bnez	a0, 0x11ada <.Lpcrel_hi0>
   11afa: 09 a0        	j	0x11afc <.Lpcrel_hi1+0x1a>
   11afc: 03 35 84 ef  	ld	a0, -264(s0)
   11b00: 83 35 04 f0  	ld	a1, -256(s0)
   11b04: 0d 8d        	sub	a0, a0, a1
   11b06: 11 81        	srli	a0, a0, 4
   11b08: 23 30 a4 f4  	sd	a0, -192(s0)
   11b0c: 09 a0        	j	0x11b0e <.Lpcrel_hi1+0x2c>
   11b0e: 09 a0        	j	0x11b10 <.Lpcrel_hi1+0x2e>
   11b10: 03 35 84 f0  	ld	a0, -248(s0)
   11b14: 83 35 84 f1  	ld	a1, -232(s0)
   11b18: 23 3c b4 fc  	sd	a1, -40(s0)
   11b1c: 03 36 84 f3  	ld	a2, -200(s0)
   11b20: 23 30 c4 fe  	sd	a2, -32(s0)
   11b24: 12 06        	slli	a2, a2, 4
   11b26: b2 95        	add	a1, a1, a2
   11b28: 23 38 b4 f4  	sd	a1, -176(s0)
   11b2c: 23 34 b4 f4  	sd	a1, -184(s0)
   11b30: 83 35 84 f4  	ld	a1, -184(s0)
   11b34: 97 00 00 00  	auipc	ra, 0
   11b38: e7 80 a0 3b  	jalr	954(ra)
   11b3c: 03 35 84 f3  	ld	a0, -200(s0)
   11b40: 23 34 a4 fe  	sd	a0, -24(s0)
   11b44: 05 05        	addi	a0, a0, 1
   11b46: 23 3c a4 f2  	sd	a0, -200(s0)
   11b4a: 03 35 84 f3  	ld	a0, -200(s0)
   11b4e: 83 35 04 f4  	ld	a1, -192(s0)
   11b52: 63 04 b5 00  	beq	a0, a1, 0x11b5a <.Lpcrel_hi1+0x78>
   11b56: 09 a0        	j	0x11b58 <.Lpcrel_hi1+0x76>
   11b58: 65 bf        	j	0x11b10 <.Lpcrel_hi1+0x2e>
   11b5a: 03 35 84 f0  	ld	a0, -248(s0)
   11b5e: 97 10 00 00  	auipc	ra, 1
   11b62: e7 80 20 fa  	jalr	-94(ra)
   11b66: 09 a0        	j	0x11b68 <.Lpcrel_hi1+0x86>
   11b68: b2 60        	ld	ra, 264(sp)
   11b6a: 12 64        	ld	s0, 256(sp)
   11b6c: 51 61        	addi	sp, sp, 272
   11b6e: 82 80        	ret

0000000000011b70 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE>:
   11b70: 6d 71        	addi	sp, sp, -272
   11b72: 06 e6        	sd	ra, 264(sp)
   11b74: 22 e2        	sd	s0, 256(sp)
   11b76: 00 0a        	addi	s0, sp, 272
   11b78: 23 34 c4 f0  	sd	a2, -248(s0)
   11b7c: 05 46        	li	a2, 1
   11b7e: 23 38 c4 f0  	sd	a2, -240(s0)
   11b82: 23 3c a4 f0  	sd	a0, -232(s0)
   11b86: 23 30 b4 f2  	sd	a1, -224(s0)
   11b8a: 01 45        	li	a0, 0
   11b8c: 21 e1        	bnez	a0, 0x11bcc <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x5c>
   11b8e: 09 a0        	j	0x11b90 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x20>
   11b90: 13 05 04 f2  	addi	a0, s0, -224
   11b94: 23 30 a4 f6  	sd	a0, -160(s0)
   11b98: 03 35 04 f2  	ld	a0, -224(s0)
   11b9c: 23 38 a4 f2  	sd	a0, -208(s0)
   11ba0: 13 05 84 f1  	addi	a0, s0, -232
   11ba4: 23 34 a4 f6  	sd	a0, -152(s0)
   11ba8: 13 05 04 f3  	addi	a0, s0, -208
   11bac: 23 38 a4 f6  	sd	a0, -144(s0)
   11bb0: 03 35 84 f1  	ld	a0, -232(s0)
   11bb4: 23 3c a4 f6  	sd	a0, -136(s0)
   11bb8: 83 35 04 f3  	ld	a1, -208(s0)
   11bbc: 23 30 b4 f8  	sd	a1, -128(s0)
   11bc0: 2d 8d        	xor	a0, a0, a1
   11bc2: 13 35 15 00  	seqz	a0, a0
   11bc6: a3 07 a4 f2  	sb	a0, -209(s0)
   11bca: 21 a8        	j	0x11be2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x72>
   11bcc: 03 35 04 f2  	ld	a0, -224(s0)
   11bd0: 23 34 a4 f8  	sd	a0, -120(s0)
   11bd4: 23 38 a4 f8  	sd	a0, -112(s0)
   11bd8: 13 35 15 00  	seqz	a0, a0
   11bdc: a3 07 a4 f2  	sb	a0, -209(s0)
   11be0: 09 a0        	j	0x11be2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x72>
   11be2: 03 45 f4 f2  	lbu	a0, -209(s0)
   11be6: 05 89        	andi	a0, a0, 1
   11be8: 19 e5        	bnez	a0, 0x11bf6 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x86>
   11bea: 09 a0        	j	0x11bec <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x7c>
   11bec: 01 45        	li	a0, 0
   11bee: 23 3c a4 f2  	sd	a0, -200(s0)
   11bf2: 39 e1        	bnez	a0, 0x11c38 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0xc8>
   11bf4: 01 a8        	j	0x11c04 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17hbf677ce0d37999eaE+0x94>
   11bf6: 03 35 84 f0  	ld	a0, -248(s0)
   11bfa: 97 10 00 00  	auipc	ra, 1
   11bfe: e7 80 a0 ee  	jalr	-278(ra)
   11c02: d9 a8        	j	0x11cd8 <.Lpcrel_hi3+0x86>
   11c04: 13 05 04 f2  	addi	a0, s0, -224
   11c08: 23 3c a4 f8  	sd	a0, -104(s0)
   11c0c: 83 35 04 f2  	ld	a1, -224(s0)
   11c10: 23 3c b4 ee  	sd	a1, -264(s0)
   11c14: 23 30 b4 fa  	sd	a1, -96(s0)
   11c18: 03 35 84 f1  	ld	a0, -232(s0)
   11c1c: 23 30 a4 f0  	sd	a0, -256(s0)
   11c20: 23 34 a4 fa  	sd	a0, -88(s0)
   11c24: 23 38 b4 fa  	sd	a1, -80(s0)
   11c28: 23 3c a4 fa  	sd	a0, -72(s0)
   11c2c: 41 45        	li	a0, 16
   11c2e: 23 30 a4 fc  	sd	a0, -64(s0)
   11c32: 05 45        	li	a0, 1
   11c34: 0d e9        	bnez	a0, 0x11c66 <.Lpcrel_hi3+0x14>
   11c36: 11 a8        	j	0x11c4a <.Lpcrel_hi2>
   11c38: 03 35 04 f2  	ld	a0, -224(s0)
   11c3c: 23 34 a4 fc  	sd	a0, -56(s0)
   11c40: 23 38 a4 fc  	sd	a0, -48(s0)
   11c44: 23 30 a4 f4  	sd	a0, -192(s0)
   11c48: 1d a8        	j	0x11c7e <.Lpcrel_hi3+0x2c>

0000000000011c4a <.Lpcrel_hi2>:
   11c4a: 17 75 00 00  	auipc	a0, 7
   11c4e: 13 05 65 08  	addi	a0, a0, 134

0000000000011c52 <.Lpcrel_hi3>:
   11c52: 97 75 00 00  	auipc	a1, 7
   11c56: 13 86 e5 11  	addi	a2, a1, 286
   11c5a: 93 05 90 04  	li	a1, 73
   11c5e: 97 50 00 00  	auipc	ra, 5
   11c62: e7 80 e0 9e  	jalr	-1554(ra)
   11c66: 01 45        	li	a0, 0
   11c68: 6d f1        	bnez	a0, 0x11c4a <.Lpcrel_hi2>
   11c6a: 09 a0        	j	0x11c6c <.Lpcrel_hi3+0x1a>
   11c6c: 03 35 84 ef  	ld	a0, -264(s0)
   11c70: 83 35 04 f0  	ld	a1, -256(s0)
   11c74: 0d 8d        	sub	a0, a0, a1
   11c76: 11 81        	srli	a0, a0, 4
   11c78: 23 30 a4 f4  	sd	a0, -192(s0)
   11c7c: 09 a0        	j	0x11c7e <.Lpcrel_hi3+0x2c>
   11c7e: 09 a0        	j	0x11c80 <.Lpcrel_hi3+0x2e>
   11c80: 03 35 84 f0  	ld	a0, -248(s0)
   11c84: 83 35 84 f1  	ld	a1, -232(s0)
   11c88: 23 3c b4 fc  	sd	a1, -40(s0)
   11c8c: 03 36 84 f3  	ld	a2, -200(s0)
   11c90: 23 30 c4 fe  	sd	a2, -32(s0)
   11c94: 12 06        	slli	a2, a2, 4
   11c96: b2 95        	add	a1, a1, a2
   11c98: 23 38 b4 f4  	sd	a1, -176(s0)
   11c9c: 23 34 b4 f4  	sd	a1, -184(s0)
   11ca0: 83 35 84 f4  	ld	a1, -184(s0)
   11ca4: 97 00 00 00  	auipc	ra, 0
   11ca8: e7 80 e0 28  	jalr	654(ra)
   11cac: 03 35 84 f3  	ld	a0, -200(s0)
   11cb0: 23 34 a4 fe  	sd	a0, -24(s0)
   11cb4: 05 05        	addi	a0, a0, 1
   11cb6: 23 3c a4 f2  	sd	a0, -200(s0)
   11cba: 03 35 84 f3  	ld	a0, -200(s0)
   11cbe: 83 35 04 f4  	ld	a1, -192(s0)
   11cc2: 63 04 b5 00  	beq	a0, a1, 0x11cca <.Lpcrel_hi3+0x78>
   11cc6: 09 a0        	j	0x11cc8 <.Lpcrel_hi3+0x76>
   11cc8: 65 bf        	j	0x11c80 <.Lpcrel_hi3+0x2e>
   11cca: 03 35 84 f0  	ld	a0, -248(s0)
   11cce: 97 10 00 00  	auipc	ra, 1
   11cd2: e7 80 60 e1  	jalr	-490(ra)
   11cd6: 09 a0        	j	0x11cd8 <.Lpcrel_hi3+0x86>
   11cd8: b2 60        	ld	ra, 264(sp)
   11cda: 12 64        	ld	s0, 256(sp)
   11cdc: 51 61        	addi	sp, sp, 272
   11cde: 82 80        	ret

0000000000011ce0 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hf71276ce930e6d02E>:
   11ce0: 75 71        	addi	sp, sp, -144
   11ce2: 06 e5        	sd	ra, 136(sp)
   11ce4: 22 e1        	sd	s0, 128(sp)
   11ce6: 00 09        	addi	s0, sp, 144
   11ce8: 23 30 b4 f8  	sd	a1, -128(s0)
   11cec: 23 34 a4 f8  	sd	a0, -120(s0)
   11cf0: 23 34 b4 fa  	sd	a1, -88(s0)
   11cf4: 01 45        	li	a0, 0
   11cf6: 05 ed        	bnez	a0, 0x11d2e <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hf71276ce930e6d02E+0x4e>
   11cf8: 09 a0        	j	0x11cfa <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hf71276ce930e6d02E+0x1a>
   11cfa: 03 35 04 f8  	ld	a0, -128(s0)
   11cfe: 93 05 85 00  	addi	a1, a0, 8
   11d02: 23 38 b4 fa  	sd	a1, -80(s0)
   11d06: 0c 65        	ld	a1, 8(a0)
   11d08: 23 38 b4 f6  	sd	a1, -144(s0)
   11d0c: 23 3c b4 fa  	sd	a1, -72(s0)
   11d10: 08 61        	ld	a0, 0(a0)
   11d12: 23 3c a4 f6  	sd	a0, -136(s0)
   11d16: 23 30 a4 fc  	sd	a0, -64(s0)
   11d1a: 23 34 b4 fc  	sd	a1, -56(s0)
   11d1e: 23 38 a4 fc  	sd	a0, -48(s0)
   11d22: 41 45        	li	a0, 16
   11d24: 23 3c a4 fc  	sd	a0, -40(s0)
   11d28: 05 45        	li	a0, 1
   11d2a: 15 e9        	bnez	a0, 0x11d5e <.Lpcrel_hi5+0x14>
   11d2c: 19 a8        	j	0x11d42 <.Lpcrel_hi4>
   11d2e: 03 35 04 f8  	ld	a0, -128(s0)
   11d32: 08 65        	ld	a0, 8(a0)
   11d34: 23 30 a4 fe  	sd	a0, -32(s0)
   11d38: 23 34 a4 fe  	sd	a0, -24(s0)
   11d3c: 23 38 a4 f8  	sd	a0, -112(s0)
   11d40: 1d a8        	j	0x11d76 <.Lpcrel_hi5+0x2c>

0000000000011d42 <.Lpcrel_hi4>:
   11d42: 17 75 00 00  	auipc	a0, 7
   11d46: 13 05 e5 f8  	addi	a0, a0, -114

0000000000011d4a <.Lpcrel_hi5>:
   11d4a: 97 75 00 00  	auipc	a1, 7
   11d4e: 13 86 65 02  	addi	a2, a1, 38
   11d52: 93 05 90 04  	li	a1, 73
   11d56: 97 50 00 00  	auipc	ra, 5
   11d5a: e7 80 60 8f  	jalr	-1802(ra)
   11d5e: 01 45        	li	a0, 0
   11d60: 6d f1        	bnez	a0, 0x11d42 <.Lpcrel_hi4>
   11d62: 09 a0        	j	0x11d64 <.Lpcrel_hi5+0x1a>
   11d64: 03 35 04 f7  	ld	a0, -144(s0)
   11d68: 83 35 84 f7  	ld	a1, -136(s0)
   11d6c: 0d 8d        	sub	a0, a0, a1
   11d6e: 11 81        	srli	a0, a0, 4
   11d70: 23 38 a4 f8  	sd	a0, -112(s0)
   11d74: 09 a0        	j	0x11d76 <.Lpcrel_hi5+0x2c>
   11d76: 83 35 84 f8  	ld	a1, -120(s0)
   11d7a: 03 35 04 f9  	ld	a0, -112(s0)
   11d7e: 23 30 a4 fa  	sd	a0, -96(s0)
   11d82: 05 46        	li	a2, 1
   11d84: 23 3c c4 f8  	sd	a2, -104(s0)
   11d88: 88 e1        	sd	a0, 0(a1)
   11d8a: 03 36 84 f9  	ld	a2, -104(s0)
   11d8e: 03 35 04 fa  	ld	a0, -96(s0)
   11d92: 90 e5        	sd	a2, 8(a1)
   11d94: 88 e9        	sd	a0, 16(a1)
   11d96: aa 60        	ld	ra, 136(sp)
   11d98: 0a 64        	ld	s0, 128(sp)
   11d9a: 49 61        	addi	sp, sp, 144
   11d9c: 82 80        	ret

0000000000011d9e <_ZN102_$LT$core..iter..adapters..map..Map$LT$I$C$F$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h76a35d6896bc2abfE>:
   11d9e: 39 71        	addi	sp, sp, -64
   11da0: 06 fc        	sd	ra, 56(sp)
   11da2: 22 f8        	sd	s0, 48(sp)
   11da4: 80 00        	addi	s0, sp, 64
   11da6: 23 3c a4 fc  	sd	a0, -40(s0)
   11daa: 23 30 b4 fe  	sd	a1, -32(s0)
   11dae: 14 6a        	ld	a3, 16(a2)
   11db0: 23 38 d4 fc  	sd	a3, -48(s0)
   11db4: 14 66        	ld	a3, 8(a2)
   11db6: 23 34 d4 fc  	sd	a3, -56(s0)
   11dba: 10 62        	ld	a2, 0(a2)
   11dbc: 23 30 c4 fc  	sd	a2, -64(s0)
   11dc0: 13 06 04 fc  	addi	a2, s0, -64
   11dc4: 97 00 00 00  	auipc	ra, 0
   11dc8: e7 80 c0 c3  	jalr	-964(ra)
   11dcc: e2 70        	ld	ra, 56(sp)
   11dce: 42 74        	ld	s0, 48(sp)
   11dd0: 21 61        	addi	sp, sp, 64
   11dd2: 82 80        	ret

0000000000011dd4 <_ZN102_$LT$core..iter..adapters..map..Map$LT$I$C$F$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4fold17h93637327c49424bbE>:
   11dd4: 39 71        	addi	sp, sp, -64
   11dd6: 06 fc        	sd	ra, 56(sp)
   11dd8: 22 f8        	sd	s0, 48(sp)
   11dda: 80 00        	addi	s0, sp, 64
   11ddc: 23 3c a4 fc  	sd	a0, -40(s0)
   11de0: 23 30 b4 fe  	sd	a1, -32(s0)
   11de4: 14 6a        	ld	a3, 16(a2)
   11de6: 23 38 d4 fc  	sd	a3, -48(s0)
   11dea: 14 66        	ld	a3, 8(a2)
   11dec: 23 34 d4 fc  	sd	a3, -56(s0)
   11df0: 10 62        	ld	a2, 0(a2)
   11df2: 23 30 c4 fc  	sd	a2, -64(s0)
   11df6: 13 06 04 fc  	addi	a2, s0, -64
   11dfa: 97 00 00 00  	auipc	ra, 0
   11dfe: e7 80 60 d7  	jalr	-650(ra)
   11e02: e2 70        	ld	ra, 56(sp)
   11e04: 42 74        	ld	s0, 48(sp)
   11e06: 21 61        	addi	sp, sp, 64
   11e08: 82 80        	ret

0000000000011e0a <_ZN102_$LT$core..iter..adapters..map..Map$LT$I$C$F$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h2326ec6294cdfb31E>:
   11e0a: 01 11        	addi	sp, sp, -32
   11e0c: 06 ec        	sd	ra, 24(sp)
   11e0e: 22 e8        	sd	s0, 16(sp)
   11e10: 00 10        	addi	s0, sp, 32
   11e12: 23 34 b4 fe  	sd	a1, -24(s0)
   11e16: 97 00 00 00  	auipc	ra, 0
   11e1a: e7 80 a0 ec  	jalr	-310(ra)
   11e1e: e2 60        	ld	ra, 24(sp)
   11e20: 42 64        	ld	s0, 16(sp)
   11e22: 05 61        	addi	sp, sp, 32
   11e24: 82 80        	ret

0000000000011e26 <_ZN102_$LT$core..iter..adapters..map..Map$LT$I$C$F$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h3e207800b959ca17E>:
   11e26: 01 11        	addi	sp, sp, -32
   11e28: 06 ec        	sd	ra, 24(sp)
   11e2a: 22 e8        	sd	s0, 16(sp)
   11e2c: 00 10        	addi	s0, sp, 32
   11e2e: 23 34 b4 fe  	sd	a1, -24(s0)
   11e32: 97 00 00 00  	auipc	ra, 0
   11e36: e7 80 e0 ea  	jalr	-338(ra)
   11e3a: e2 60        	ld	ra, 24(sp)
   11e3c: 42 64        	ld	s0, 16(sp)
   11e3e: 05 61        	addi	sp, sp, 32
   11e40: 82 80        	ret

0000000000011e42 <_ZN4core4iter6traits8iterator8Iterator7collect17h521eaa368701ff4aE>:
   11e42: 01 11        	addi	sp, sp, -32
   11e44: 06 ec        	sd	ra, 24(sp)
   11e46: 22 e8        	sd	s0, 16(sp)
   11e48: 00 10        	addi	s0, sp, 32
   11e4a: 23 30 b4 fe  	sd	a1, -32(s0)
   11e4e: 23 34 c4 fe  	sd	a2, -24(s0)
   11e52: 97 10 00 00  	auipc	ra, 1
   11e56: e7 80 40 98  	jalr	-1660(ra)
   11e5a: e2 60        	ld	ra, 24(sp)
   11e5c: 42 64        	ld	s0, 16(sp)
   11e5e: 05 61        	addi	sp, sp, 32
   11e60: 82 80        	ret

0000000000011e62 <_ZN4core4iter6traits8iterator8Iterator7collect17hd0a9cbcb54af1f63E>:
   11e62: 01 11        	addi	sp, sp, -32
   11e64: 06 ec        	sd	ra, 24(sp)
   11e66: 22 e8        	sd	s0, 16(sp)
   11e68: 00 10        	addi	s0, sp, 32
   11e6a: 23 30 b4 fe  	sd	a1, -32(s0)
   11e6e: 23 34 c4 fe  	sd	a2, -24(s0)
   11e72: 97 10 00 00  	auipc	ra, 1
   11e76: e7 80 40 91  	jalr	-1772(ra)
   11e7a: e2 60        	ld	ra, 24(sp)
   11e7c: 42 64        	ld	s0, 16(sp)
   11e7e: 05 61        	addi	sp, sp, 32
   11e80: 82 80        	ret

0000000000011e82 <_ZN4core4iter6traits8iterator8Iterator8for_each17h0f3af542696b31b9E>:
   11e82: 39 71        	addi	sp, sp, -64
   11e84: 06 fc        	sd	ra, 56(sp)
   11e86: 22 f8        	sd	s0, 48(sp)
   11e88: 80 00        	addi	s0, sp, 64
   11e8a: 23 30 a4 fe  	sd	a0, -32(s0)
   11e8e: 23 34 b4 fe  	sd	a1, -24(s0)
   11e92: 14 6a        	ld	a3, 16(a2)
   11e94: 23 3c d4 fc  	sd	a3, -40(s0)
   11e98: 14 66        	ld	a3, 8(a2)
   11e9a: 23 38 d4 fc  	sd	a3, -48(s0)
   11e9e: 10 62        	ld	a2, 0(a2)
   11ea0: 23 34 c4 fc  	sd	a2, -56(s0)
   11ea4: 13 06 84 fc  	addi	a2, s0, -56
   11ea8: 97 00 00 00  	auipc	ra, 0
   11eac: e7 80 c0 f2  	jalr	-212(ra)
   11eb0: e2 70        	ld	ra, 56(sp)
   11eb2: 42 74        	ld	s0, 48(sp)
   11eb4: 21 61        	addi	sp, sp, 64
   11eb6: 82 80        	ret

0000000000011eb8 <_ZN4core4iter6traits8iterator8Iterator8for_each17h6f2b7cb86b93ced7E>:
   11eb8: 39 71        	addi	sp, sp, -64
   11eba: 06 fc        	sd	ra, 56(sp)
   11ebc: 22 f8        	sd	s0, 48(sp)
   11ebe: 80 00        	addi	s0, sp, 64
   11ec0: 23 30 a4 fe  	sd	a0, -32(s0)
   11ec4: 23 34 b4 fe  	sd	a1, -24(s0)
   11ec8: 14 6a        	ld	a3, 16(a2)
   11eca: 23 3c d4 fc  	sd	a3, -40(s0)
   11ece: 14 66        	ld	a3, 8(a2)
   11ed0: 23 38 d4 fc  	sd	a3, -48(s0)
   11ed4: 10 62        	ld	a2, 0(a2)
   11ed6: 23 34 c4 fc  	sd	a2, -56(s0)
   11eda: 13 06 84 fc  	addi	a2, s0, -56
   11ede: 97 00 00 00  	auipc	ra, 0
   11ee2: e7 80 00 ec  	jalr	-320(ra)
   11ee6: e2 70        	ld	ra, 56(sp)
   11ee8: 42 74        	ld	s0, 48(sp)
   11eea: 21 61        	addi	sp, sp, 64
   11eec: 82 80        	ret

0000000000011eee <_ZN4core4iter8adapters3map8map_fold28_$u7b$$u7b$closure$u7d$$u7d$17h1fd7c5230163a63aE>:
   11eee: 39 71        	addi	sp, sp, -64
   11ef0: 06 fc        	sd	ra, 56(sp)
   11ef2: 22 f8        	sd	s0, 48(sp)
   11ef4: 80 00        	addi	s0, sp, 64
   11ef6: 23 30 a4 fc  	sd	a0, -64(s0)
   11efa: 23 3c a4 fc  	sd	a0, -40(s0)
   11efe: 23 34 b4 fe  	sd	a1, -24(s0)
   11f02: 61 05        	addi	a0, a0, 24
   11f04: 23 38 b4 fc  	sd	a1, -48(s0)
   11f08: 83 35 04 fd  	ld	a1, -48(s0)
   11f0c: 97 30 00 00  	auipc	ra, 3
   11f10: e7 80 80 89  	jalr	-1896(ra)
   11f14: aa 85        	mv	a1, a0
   11f16: 03 35 04 fc  	ld	a0, -64(s0)
   11f1a: 23 34 b4 fc  	sd	a1, -56(s0)
   11f1e: 83 35 84 fc  	ld	a1, -56(s0)
   11f22: 97 10 00 00  	auipc	ra, 1
   11f26: e7 80 80 d2  	jalr	-728(ra)
   11f2a: e2 70        	ld	ra, 56(sp)
   11f2c: 42 74        	ld	s0, 48(sp)
   11f2e: 21 61        	addi	sp, sp, 64
   11f30: 82 80        	ret

0000000000011f32 <_ZN4core4iter8adapters3map8map_fold28_$u7b$$u7b$closure$u7d$$u7d$17h2f9ff520d322de7aE>:
   11f32: 39 71        	addi	sp, sp, -64
   11f34: 06 fc        	sd	ra, 56(sp)
   11f36: 22 f8        	sd	s0, 48(sp)
   11f38: 80 00        	addi	s0, sp, 64
   11f3a: 23 30 a4 fc  	sd	a0, -64(s0)
   11f3e: 23 3c a4 fc  	sd	a0, -40(s0)
   11f42: 23 34 b4 fe  	sd	a1, -24(s0)
   11f46: 61 05        	addi	a0, a0, 24
   11f48: 23 38 b4 fc  	sd	a1, -48(s0)
   11f4c: 83 35 04 fd  	ld	a1, -48(s0)
   11f50: 97 30 00 00  	auipc	ra, 3
   11f54: e7 80 80 87  	jalr	-1928(ra)
   11f58: aa 85        	mv	a1, a0
   11f5a: 03 35 04 fc  	ld	a0, -64(s0)
   11f5e: 23 34 b4 fc  	sd	a1, -56(s0)
   11f62: 83 35 84 fc  	ld	a1, -56(s0)
   11f66: 97 10 00 00  	auipc	ra, 1
   11f6a: e7 80 c0 d0  	jalr	-756(ra)
   11f6e: e2 70        	ld	ra, 56(sp)
   11f70: 42 74        	ld	s0, 48(sp)
   11f72: 21 61        	addi	sp, sp, 64
   11f74: 82 80        	ret

0000000000011f76 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h37500ee1d826f848E>:
   11f76: 01 11        	addi	sp, sp, -32
   11f78: 06 ec        	sd	ra, 24(sp)
   11f7a: 22 e8        	sd	s0, 16(sp)
   11f7c: 00 10        	addi	s0, sp, 32
   11f7e: 23 30 a4 fe  	sd	a0, -32(s0)
   11f82: 23 34 b4 fe  	sd	a1, -24(s0)
   11f86: e2 60        	ld	ra, 24(sp)
   11f88: 42 64        	ld	s0, 16(sp)
   11f8a: 05 61        	addi	sp, sp, 32
   11f8c: 82 80        	ret

0000000000011f8e <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17he3d02b360448587eE>:
   11f8e: 01 11        	addi	sp, sp, -32
   11f90: 06 ec        	sd	ra, 24(sp)
   11f92: 22 e8        	sd	s0, 16(sp)
   11f94: 00 10        	addi	s0, sp, 32
   11f96: 23 30 a4 fe  	sd	a0, -32(s0)
   11f9a: 23 34 b4 fe  	sd	a1, -24(s0)
   11f9e: e2 60        	ld	ra, 24(sp)
   11fa0: 42 64        	ld	s0, 16(sp)
   11fa2: 05 61        	addi	sp, sp, 32
   11fa4: 82 80        	ret

0000000000011fa6 <_ZN4core5alloc6global11GlobalAlloc12alloc_zeroed17h6849265b15edf054E>:
   11fa6: 1d 71        	addi	sp, sp, -96
   11fa8: 86 ec        	sd	ra, 88(sp)
   11faa: a2 e8        	sd	s0, 80(sp)
   11fac: 80 10        	addi	s0, sp, 96
   11fae: 81 46        	li	a3, 0
   11fb0: a3 0f d4 fa  	sb	a3, -65(s0)
   11fb4: 23 30 b4 fc  	sd	a1, -64(s0)
   11fb8: 23 34 c4 fc  	sd	a2, -56(s0)
   11fbc: 23 38 a4 fc  	sd	a0, -48(s0)
   11fc0: 93 05 04 fc  	addi	a1, s0, -64
   11fc4: 23 3c b4 fc  	sd	a1, -40(s0)
   11fc8: 83 35 84 fc  	ld	a1, -56(s0)
   11fcc: 23 34 b4 fa  	sd	a1, -88(s0)
   11fd0: 23 30 b4 fe  	sd	a1, -32(s0)
   11fd4: 83 35 04 fc  	ld	a1, -64(s0)
   11fd8: 03 36 84 fc  	ld	a2, -56(s0)
   11fdc: 97 40 00 00  	auipc	ra, 4
   11fe0: e7 80 20 e0  	jalr	-510(ra)
   11fe4: aa 85        	mv	a1, a0
   11fe6: 23 38 b4 fa  	sd	a1, -80(s0)
   11fea: 23 34 a4 fe  	sd	a0, -24(s0)
   11fee: 19 e1        	bnez	a0, 0x11ff4 <_ZN4core5alloc6global11GlobalAlloc12alloc_zeroed17h6849265b15edf054E+0x4e>
   11ff0: 09 a0        	j	0x11ff2 <_ZN4core5alloc6global11GlobalAlloc12alloc_zeroed17h6849265b15edf054E+0x4c>
   11ff2: 19 a8        	j	0x12008 <_ZN4core5alloc6global11GlobalAlloc12alloc_zeroed17h6849265b15edf054E+0x62>
   11ff4: 03 36 84 fa  	ld	a2, -88(s0)
   11ff8: 03 35 04 fb  	ld	a0, -80(s0)
   11ffc: 81 45        	li	a1, 0
   11ffe: 97 60 00 00  	auipc	ra, 6
   12002: e7 80 20 a4  	jalr	-1470(ra)
   12006: 09 a0        	j	0x12008 <_ZN4core5alloc6global11GlobalAlloc12alloc_zeroed17h6849265b15edf054E+0x62>
   12008: 03 35 04 fb  	ld	a0, -80(s0)
   1200c: e6 60        	ld	ra, 88(sp)
   1200e: 46 64        	ld	s0, 80(sp)
   12010: 25 61        	addi	sp, sp, 96
   12012: 82 80        	ret

0000000000012014 <_ZN4core5alloc6global11GlobalAlloc7realloc17h00e480fd1b758726E>:
   12014: 71 71        	addi	sp, sp, -176
   12016: 06 f5        	sd	ra, 168(sp)
   12018: 22 f1        	sd	s0, 160(sp)
   1201a: 00 19        	addi	s0, sp, 176
   1201c: 23 38 e4 f4  	sd	a4, -176(s0)
   12020: 23 3c b4 f4  	sd	a1, -168(s0)
   12024: 23 30 a4 f6  	sd	a0, -160(s0)
   12028: 23 38 c4 f6  	sd	a2, -144(s0)
   1202c: 23 3c d4 f6  	sd	a3, -136(s0)
   12030: 23 3c a4 f8  	sd	a0, -104(s0)
   12034: 23 30 b4 fa  	sd	a1, -96(s0)
   12038: 23 34 e4 fa  	sd	a4, -88(s0)
   1203c: 93 05 04 f7  	addi	a1, s0, -144
   12040: 23 38 b4 fa  	sd	a1, -80(s0)
   12044: 83 35 04 f7  	ld	a1, -144(s0)
   12048: 23 3c b4 fa  	sd	a1, -72(s0)
   1204c: 23 38 b4 f8  	sd	a1, -112(s0)
   12050: 83 35 04 f9  	ld	a1, -112(s0)
   12054: 23 30 b4 fc  	sd	a1, -64(s0)
   12058: 23 34 e4 f8  	sd	a4, -120(s0)
   1205c: 23 30 b4 f8  	sd	a1, -128(s0)
   12060: 83 35 04 f8  	ld	a1, -128(s0)
   12064: 03 36 84 f8  	ld	a2, -120(s0)
   12068: 97 40 00 00  	auipc	ra, 4
   1206c: e7 80 60 d7  	jalr	-650(ra)
   12070: aa 85        	mv	a1, a0
   12072: 23 34 b4 f6  	sd	a1, -152(s0)
   12076: 23 34 a4 fc  	sd	a0, -56(s0)
   1207a: 19 e1        	bnez	a0, 0x12080 <_ZN4core5alloc6global11GlobalAlloc7realloc17h00e480fd1b758726E+0x6c>
   1207c: 09 a0        	j	0x1207e <_ZN4core5alloc6global11GlobalAlloc7realloc17h00e480fd1b758726E+0x6a>
   1207e: 99 a8        	j	0x120d4 <_ZN4core5alloc6global11GlobalAlloc7realloc17h00e480fd1b758726E+0xc0>
   12080: 03 35 84 f5  	ld	a0, -168(s0)
   12084: 83 35 04 f5  	ld	a1, -176(s0)
   12088: 23 38 a4 fc  	sd	a0, -48(s0)
   1208c: 13 05 04 f7  	addi	a0, s0, -144
   12090: 23 3c a4 fc  	sd	a0, -40(s0)
   12094: 03 35 84 f7  	ld	a0, -136(s0)
   12098: 23 30 a4 fe  	sd	a0, -32(s0)
   1209c: 97 30 00 00  	auipc	ra, 3
   120a0: e7 80 40 8f  	jalr	-1804(ra)
   120a4: 83 35 84 f5  	ld	a1, -168(s0)
   120a8: 2a 86        	mv	a2, a0
   120aa: 03 35 84 f6  	ld	a0, -152(s0)
   120ae: 23 34 c4 fe  	sd	a2, -24(s0)
   120b2: 97 60 00 00  	auipc	ra, 6
   120b6: e7 80 60 99  	jalr	-1642(ra)
   120ba: 83 35 84 f5  	ld	a1, -168(s0)
   120be: 03 35 04 f6  	ld	a0, -160(s0)
   120c2: 03 36 04 f7  	ld	a2, -144(s0)
   120c6: 83 36 84 f7  	ld	a3, -136(s0)
   120ca: 97 40 00 00  	auipc	ra, 4
   120ce: e7 80 60 e2  	jalr	-474(ra)
   120d2: 09 a0        	j	0x120d4 <_ZN4core5alloc6global11GlobalAlloc7realloc17h00e480fd1b758726E+0xc0>
   120d4: 03 35 84 f6  	ld	a0, -152(s0)
   120d8: aa 70        	ld	ra, 168(sp)
   120da: 0a 74        	ld	s0, 160(sp)
   120dc: 4d 61        	addi	sp, sp, 176
   120de: 82 80        	ret

00000000000120e0 <_ZN111_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter_nested..SpecFromIterNested$LT$T$C$I$GT$$GT$9from_iter17h14ca6395e08d3a92E>:
   120e0: 51 71        	addi	sp, sp, -240
   120e2: 86 f5        	sd	ra, 232(sp)
   120e4: a2 f1        	sd	s0, 224(sp)
   120e6: 80 19        	addi	s0, sp, 240
   120e8: 23 34 a4 f2  	sd	a0, -216(s0)
   120ec: 23 3c b4 f2  	sd	a1, -200(s0)
   120f0: 23 30 c4 f4  	sd	a2, -192(s0)
   120f4: 13 05 04 f6  	addi	a0, s0, -160
   120f8: 93 05 84 f3  	addi	a1, s0, -200
   120fc: 97 00 00 00  	auipc	ra, 0
   12100: e7 80 a0 d2  	jalr	-726(ra)
   12104: 03 35 84 f6  	ld	a0, -152(s0)
   12108: 39 cd        	beqz	a0, 0x12166 <.Lpcrel_hi0>
   1210a: 09 a0        	j	0x1210c <_ZN111_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter_nested..SpecFromIterNested$LT$T$C$I$GT$$GT$9from_iter17h14ca6395e08d3a92E+0x2c>
   1210c: 03 35 04 f7  	ld	a0, -144(s0)
   12110: 23 3c a4 fc  	sd	a0, -40(s0)
   12114: 81 45        	li	a1, 0
   12116: 23 30 b4 f2  	sd	a1, -224(s0)
   1211a: 97 10 00 00  	auipc	ra, 1
   1211e: e7 80 c0 4c  	jalr	1228(ra)
   12122: 2a 86        	mv	a2, a0
   12124: 03 35 04 f2  	ld	a0, -224(s0)
   12128: 23 34 c4 f4  	sd	a2, -184(s0)
   1212c: 23 38 b4 f4  	sd	a1, -176(s0)
   12130: 23 3c a4 f4  	sd	a0, -168(s0)
   12134: 83 35 84 f3  	ld	a1, -200(s0)
   12138: 03 36 04 f4  	ld	a2, -192(s0)
   1213c: 13 05 84 f4  	addi	a0, s0, -184
   12140: 97 00 00 00  	auipc	ra, 0
   12144: e7 80 a0 70  	jalr	1802(ra)
   12148: 83 35 84 f2  	ld	a1, -216(s0)
   1214c: 03 35 84 f5  	ld	a0, -168(s0)
   12150: 88 e9        	sd	a0, 16(a1)
   12152: 03 35 04 f5  	ld	a0, -176(s0)
   12156: 88 e5        	sd	a0, 8(a1)
   12158: 03 35 84 f4  	ld	a0, -184(s0)
   1215c: 88 e1        	sd	a0, 0(a1)
   1215e: ae 70        	ld	ra, 232(sp)
   12160: 0e 74        	ld	s0, 224(sp)
   12162: 6d 61        	addi	sp, sp, 240
   12164: 82 80        	ret

0000000000012166 <.Lpcrel_hi0>:
   12166: 17 75 00 00  	auipc	a0, 7
   1216a: 13 05 a5 c3  	addi	a0, a0, -966
   1216e: 23 30 a4 fe  	sd	a0, -32(s0)
   12172: 05 45        	li	a0, 1
   12174: 23 34 a4 fe  	sd	a0, -24(s0)
   12178: 01 45        	li	a0, 0
   1217a: 21 e9        	bnez	a0, 0x121ca <.Lpcrel_hi5>
   1217c: 09 a0        	j	0x1217e <.Lpcrel_hi1>

000000000001217e <.Lpcrel_hi1>:
   1217e: 17 75 00 00  	auipc	a0, 7
   12182: 13 05 25 c2  	addi	a0, a0, -990
   12186: 23 3c a4 f6  	sd	a0, -136(s0)
   1218a: 05 45        	li	a0, 1
   1218c: 23 30 a4 f8  	sd	a0, -128(s0)

0000000000012190 <.Lpcrel_hi2>:
   12190: 17 65 00 00  	auipc	a0, 6
   12194: 13 05 05 e9  	addi	a0, a0, -368
   12198: 0c 61        	ld	a1, 0(a0)
   1219a: 08 65        	ld	a0, 8(a0)
   1219c: 23 3c b4 f8  	sd	a1, -104(s0)
   121a0: 23 30 a4 fa  	sd	a0, -96(s0)

00000000000121a4 <.Lpcrel_hi3>:
   121a4: 17 75 00 00  	auipc	a0, 7
   121a8: 13 05 c5 c0  	addi	a0, a0, -1012
   121ac: 23 34 a4 f8  	sd	a0, -120(s0)
   121b0: 01 45        	li	a0, 0
   121b2: 23 38 a4 f8  	sd	a0, -112(s0)

00000000000121b6 <.Lpcrel_hi4>:
   121b6: 17 75 00 00  	auipc	a0, 7
   121ba: 93 05 a5 c5  	addi	a1, a0, -934
   121be: 13 05 84 f7  	addi	a0, s0, -136
   121c2: 97 40 00 00  	auipc	ra, 4
   121c6: e7 80 e0 45  	jalr	1118(ra)

00000000000121ca <.Lpcrel_hi5>:
   121ca: 17 75 00 00  	auipc	a0, 7
   121ce: 93 05 e5 c6  	addi	a1, a0, -914
   121d2: 13 05 84 fa  	addi	a0, s0, -88
   121d6: 23 3c a4 f0  	sd	a0, -232(s0)
   121da: 05 46        	li	a2, 1
   121dc: 97 f0 ff ff  	auipc	ra, 1048575
   121e0: e7 80 e0 0f  	jalr	254(ra)
   121e4: 03 35 84 f1  	ld	a0, -232(s0)

00000000000121e8 <.Lpcrel_hi6>:
   121e8: 97 75 00 00  	auipc	a1, 7
   121ec: 93 85 05 cb  	addi	a1, a1, -848
   121f0: 97 40 00 00  	auipc	ra, 4
   121f4: e7 80 00 43  	jalr	1072(ra)

00000000000121f8 <_ZN111_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter_nested..SpecFromIterNested$LT$T$C$I$GT$$GT$9from_iter17h6b2d18e0b47ac6a7E>:
   121f8: 51 71        	addi	sp, sp, -240
   121fa: 86 f5        	sd	ra, 232(sp)
   121fc: a2 f1        	sd	s0, 224(sp)
   121fe: 80 19        	addi	s0, sp, 240
   12200: 23 34 a4 f2  	sd	a0, -216(s0)
   12204: 23 3c b4 f2  	sd	a1, -200(s0)
   12208: 23 30 c4 f4  	sd	a2, -192(s0)
   1220c: 13 05 04 f6  	addi	a0, s0, -160
   12210: 93 05 84 f3  	addi	a1, s0, -200
   12214: 97 00 00 00  	auipc	ra, 0
   12218: e7 80 60 bf  	jalr	-1034(ra)
   1221c: 03 35 84 f6  	ld	a0, -152(s0)
   12220: 39 cd        	beqz	a0, 0x1227e <.Lpcrel_hi7>
   12222: 09 a0        	j	0x12224 <_ZN111_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter_nested..SpecFromIterNested$LT$T$C$I$GT$$GT$9from_iter17h6b2d18e0b47ac6a7E+0x2c>
   12224: 03 35 04 f7  	ld	a0, -144(s0)
   12228: 23 3c a4 fc  	sd	a0, -40(s0)
   1222c: 81 45        	li	a1, 0
   1222e: 23 30 b4 f2  	sd	a1, -224(s0)
   12232: 97 10 00 00  	auipc	ra, 1
   12236: e7 80 40 3b  	jalr	948(ra)
   1223a: 2a 86        	mv	a2, a0
   1223c: 03 35 04 f2  	ld	a0, -224(s0)
   12240: 23 34 c4 f4  	sd	a2, -184(s0)
   12244: 23 38 b4 f4  	sd	a1, -176(s0)
   12248: 23 3c a4 f4  	sd	a0, -168(s0)
   1224c: 83 35 84 f3  	ld	a1, -200(s0)
   12250: 03 36 04 f4  	ld	a2, -192(s0)
   12254: 13 05 84 f4  	addi	a0, s0, -184
   12258: 97 00 00 00  	auipc	ra, 0
   1225c: e7 80 e0 5c  	jalr	1486(ra)
   12260: 83 35 84 f2  	ld	a1, -216(s0)
   12264: 03 35 84 f5  	ld	a0, -168(s0)
   12268: 88 e9        	sd	a0, 16(a1)
   1226a: 03 35 04 f5  	ld	a0, -176(s0)
   1226e: 88 e5        	sd	a0, 8(a1)
   12270: 03 35 84 f4  	ld	a0, -184(s0)
   12274: 88 e1        	sd	a0, 0(a1)
   12276: ae 70        	ld	ra, 232(sp)
   12278: 0e 74        	ld	s0, 224(sp)
   1227a: 6d 61        	addi	sp, sp, 240
   1227c: 82 80        	ret

000000000001227e <.Lpcrel_hi7>:
   1227e: 17 75 00 00  	auipc	a0, 7
   12282: 13 05 25 b2  	addi	a0, a0, -1246
   12286: 23 30 a4 fe  	sd	a0, -32(s0)
   1228a: 05 45        	li	a0, 1
   1228c: 23 34 a4 fe  	sd	a0, -24(s0)
   12290: 01 45        	li	a0, 0
   12292: 21 e9        	bnez	a0, 0x122e2 <.Lpcrel_hi12>
   12294: 09 a0        	j	0x12296 <.Lpcrel_hi8>

0000000000012296 <.Lpcrel_hi8>:
   12296: 17 75 00 00  	auipc	a0, 7
   1229a: 13 05 a5 b0  	addi	a0, a0, -1270
   1229e: 23 3c a4 f6  	sd	a0, -136(s0)
   122a2: 05 45        	li	a0, 1
   122a4: 23 30 a4 f8  	sd	a0, -128(s0)

00000000000122a8 <.Lpcrel_hi9>:
   122a8: 17 65 00 00  	auipc	a0, 6
   122ac: 13 05 85 d7  	addi	a0, a0, -648
   122b0: 0c 61        	ld	a1, 0(a0)
   122b2: 08 65        	ld	a0, 8(a0)
   122b4: 23 3c b4 f8  	sd	a1, -104(s0)
   122b8: 23 30 a4 fa  	sd	a0, -96(s0)

00000000000122bc <.Lpcrel_hi10>:
   122bc: 17 75 00 00  	auipc	a0, 7
   122c0: 13 05 45 af  	addi	a0, a0, -1292
   122c4: 23 34 a4 f8  	sd	a0, -120(s0)
   122c8: 01 45        	li	a0, 0
   122ca: 23 38 a4 f8  	sd	a0, -112(s0)

00000000000122ce <.Lpcrel_hi11>:
   122ce: 17 75 00 00  	auipc	a0, 7
   122d2: 93 05 25 b4  	addi	a1, a0, -1214
   122d6: 13 05 84 f7  	addi	a0, s0, -136
   122da: 97 40 00 00  	auipc	ra, 4
   122de: e7 80 60 34  	jalr	838(ra)

00000000000122e2 <.Lpcrel_hi12>:
   122e2: 17 75 00 00  	auipc	a0, 7
   122e6: 93 05 65 b5  	addi	a1, a0, -1194
   122ea: 13 05 84 fa  	addi	a0, s0, -88
   122ee: 23 3c a4 f0  	sd	a0, -232(s0)
   122f2: 05 46        	li	a2, 1
   122f4: 97 f0 ff ff  	auipc	ra, 1048575
   122f8: e7 80 60 fe  	jalr	-26(ra)
   122fc: 03 35 84 f1  	ld	a0, -232(s0)

0000000000012300 <.Lpcrel_hi13>:
   12300: 97 75 00 00  	auipc	a1, 7
   12304: 93 85 85 b9  	addi	a1, a1, -1128
   12308: 97 40 00 00  	auipc	ra, 4
   1230c: e7 80 80 31  	jalr	792(ra)

0000000000012310 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted17h33ad428621e2e55cE>:
   12310: 69 71        	addi	sp, sp, -304
   12312: 06 f6        	sd	ra, 296(sp)
   12314: 22 f2        	sd	s0, 288(sp)
   12316: 00 1a        	addi	s0, sp, 304
   12318: 23 3c a4 ec  	sd	a0, -296(s0)
   1231c: 81 46        	li	a3, 0
   1231e: a3 03 d4 ee  	sb	a3, -281(s0)
   12322: 23 34 b4 ee  	sd	a1, -280(s0)
   12326: 23 38 c4 ee  	sd	a2, -272(s0)
   1232a: 23 34 a4 fa  	sd	a0, -88(s0)
   1232e: 13 05 84 f0  	addi	a0, s0, -248
   12332: 93 05 84 ee  	addi	a1, s0, -280
   12336: 97 00 00 00  	auipc	ra, 0
   1233a: e7 80 00 af  	jalr	-1296(ra)
   1233e: 03 35 84 f0  	ld	a0, -248(s0)
   12342: 23 38 a4 fa  	sd	a0, -80(s0)
   12346: 83 35 04 f1  	ld	a1, -240(s0)
   1234a: 03 35 84 f1  	ld	a0, -232(s0)
   1234e: 23 3c b4 ee  	sd	a1, -264(s0)
   12352: 23 30 a4 f0  	sd	a0, -256(s0)
   12356: 03 35 84 ef  	ld	a0, -264(s0)
   1235a: 35 c5        	beqz	a0, 0x123c6 <.Lpcrel_hi14>
   1235c: 09 a0        	j	0x1235e <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted17h33ad428621e2e55cE+0x4e>
   1235e: 03 35 84 ed  	ld	a0, -296(s0)
   12362: 83 35 04 f0  	ld	a1, -256(s0)
   12366: 23 3c b4 fa  	sd	a1, -72(s0)
   1236a: 97 00 00 00  	auipc	ra, 0
   1236e: e7 80 e0 35  	jalr	862(ra)
   12372: 03 35 84 ed  	ld	a0, -296(s0)
   12376: 23 30 a4 fc  	sd	a0, -64(s0)
   1237a: 10 65        	ld	a2, 8(a0)
   1237c: 23 34 c4 fc  	sd	a2, -56(s0)
   12380: 23 38 c4 fc  	sd	a2, -48(s0)
   12384: 93 05 05 01  	addi	a1, a0, 16
   12388: 23 3c b4 fc  	sd	a1, -40(s0)
   1238c: 08 69        	ld	a0, 16(a0)
   1238e: 23 30 b4 f2  	sd	a1, -224(s0)
   12392: 23 34 a4 f2  	sd	a0, -216(s0)
   12396: 03 35 84 ee  	ld	a0, -280(s0)
   1239a: 83 35 04 ef  	ld	a1, -272(s0)
   1239e: 23 30 c4 f4  	sd	a2, -192(s0)
   123a2: 83 36 04 f2  	ld	a3, -224(s0)
   123a6: 03 36 84 f2  	ld	a2, -216(s0)
   123aa: 23 38 d4 f2  	sd	a3, -208(s0)
   123ae: 23 3c c4 f2  	sd	a2, -200(s0)
   123b2: 13 06 04 f3  	addi	a2, s0, -208
   123b6: 97 00 00 00  	auipc	ra, 0
   123ba: e7 80 c0 ac  	jalr	-1332(ra)
   123be: b2 70        	ld	ra, 296(sp)
   123c0: 12 74        	ld	s0, 288(sp)
   123c2: 55 61        	addi	sp, sp, 304
   123c4: 82 80        	ret

00000000000123c6 <.Lpcrel_hi14>:
   123c6: 17 75 00 00  	auipc	a0, 7
   123ca: 13 05 a5 9d  	addi	a0, a0, -1574
   123ce: 23 30 a4 fe  	sd	a0, -32(s0)
   123d2: 05 45        	li	a0, 1
   123d4: 23 34 a4 fe  	sd	a0, -24(s0)
   123d8: 01 45        	li	a0, 0
   123da: 21 e9        	bnez	a0, 0x1242a <.Lpcrel_hi19>
   123dc: 09 a0        	j	0x123de <.Lpcrel_hi15>

00000000000123de <.Lpcrel_hi15>:
   123de: 17 75 00 00  	auipc	a0, 7
   123e2: 13 05 25 9c  	addi	a0, a0, -1598
   123e6: 23 34 a4 f4  	sd	a0, -184(s0)
   123ea: 05 45        	li	a0, 1
   123ec: 23 38 a4 f4  	sd	a0, -176(s0)

00000000000123f0 <.Lpcrel_hi16>:
   123f0: 17 65 00 00  	auipc	a0, 6
   123f4: 13 05 05 c3  	addi	a0, a0, -976
   123f8: 0c 61        	ld	a1, 0(a0)
   123fa: 08 65        	ld	a0, 8(a0)
   123fc: 23 34 b4 f6  	sd	a1, -152(s0)
   12400: 23 38 a4 f6  	sd	a0, -144(s0)

0000000000012404 <.Lpcrel_hi17>:
   12404: 17 75 00 00  	auipc	a0, 7
   12408: 13 05 c5 9a  	addi	a0, a0, -1620
   1240c: 23 3c a4 f4  	sd	a0, -168(s0)
   12410: 01 45        	li	a0, 0
   12412: 23 30 a4 f6  	sd	a0, -160(s0)

0000000000012416 <.Lpcrel_hi18>:
   12416: 17 75 00 00  	auipc	a0, 7
   1241a: 93 05 a5 ae  	addi	a1, a0, -1302
   1241e: 13 05 84 f4  	addi	a0, s0, -184
   12422: 97 40 00 00  	auipc	ra, 4
   12426: e7 80 e0 1f  	jalr	510(ra)

000000000001242a <.Lpcrel_hi19>:
   1242a: 17 75 00 00  	auipc	a0, 7
   1242e: 93 05 e5 a0  	addi	a1, a0, -1522
   12432: 13 05 84 f7  	addi	a0, s0, -136
   12436: 23 38 a4 ec  	sd	a0, -304(s0)
   1243a: 05 46        	li	a2, 1
   1243c: 97 f0 ff ff  	auipc	ra, 1048575
   12440: e7 80 e0 e9  	jalr	-354(ra)
   12444: 03 35 04 ed  	ld	a0, -304(s0)

0000000000012448 <.Lpcrel_hi20>:
   12448: 97 75 00 00  	auipc	a1, 7
   1244c: 93 85 05 a5  	addi	a1, a1, -1456
   12450: 97 40 00 00  	auipc	ra, 4
   12454: e7 80 00 1d  	jalr	464(ra)

0000000000012458 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted17h6aeb91dc7e3f4310E>:
   12458: 69 71        	addi	sp, sp, -304
   1245a: 06 f6        	sd	ra, 296(sp)
   1245c: 22 f2        	sd	s0, 288(sp)
   1245e: 00 1a        	addi	s0, sp, 304
   12460: 23 3c a4 ec  	sd	a0, -296(s0)
   12464: 81 46        	li	a3, 0
   12466: a3 03 d4 ee  	sb	a3, -281(s0)
   1246a: 23 34 b4 ee  	sd	a1, -280(s0)
   1246e: 23 38 c4 ee  	sd	a2, -272(s0)
   12472: 23 34 a4 fa  	sd	a0, -88(s0)
   12476: 13 05 84 f0  	addi	a0, s0, -248
   1247a: 93 05 84 ee  	addi	a1, s0, -280
   1247e: 97 00 00 00  	auipc	ra, 0
   12482: e7 80 c0 98  	jalr	-1652(ra)
   12486: 03 35 84 f0  	ld	a0, -248(s0)
   1248a: 23 38 a4 fa  	sd	a0, -80(s0)
   1248e: 83 35 04 f1  	ld	a1, -240(s0)
   12492: 03 35 84 f1  	ld	a0, -232(s0)
   12496: 23 3c b4 ee  	sd	a1, -264(s0)
   1249a: 23 30 a4 f0  	sd	a0, -256(s0)
   1249e: 03 35 84 ef  	ld	a0, -264(s0)
   124a2: 35 c5        	beqz	a0, 0x1250e <.Lpcrel_hi21>
   124a4: 09 a0        	j	0x124a6 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted17h6aeb91dc7e3f4310E+0x4e>
   124a6: 03 35 84 ed  	ld	a0, -296(s0)
   124aa: 83 35 04 f0  	ld	a1, -256(s0)
   124ae: 23 3c b4 fa  	sd	a1, -72(s0)
   124b2: 97 00 00 00  	auipc	ra, 0
   124b6: e7 80 60 21  	jalr	534(ra)
   124ba: 03 35 84 ed  	ld	a0, -296(s0)
   124be: 23 30 a4 fc  	sd	a0, -64(s0)
   124c2: 10 65        	ld	a2, 8(a0)
   124c4: 23 34 c4 fc  	sd	a2, -56(s0)
   124c8: 23 38 c4 fc  	sd	a2, -48(s0)
   124cc: 93 05 05 01  	addi	a1, a0, 16
   124d0: 23 3c b4 fc  	sd	a1, -40(s0)
   124d4: 08 69        	ld	a0, 16(a0)
   124d6: 23 30 b4 f2  	sd	a1, -224(s0)
   124da: 23 34 a4 f2  	sd	a0, -216(s0)
   124de: 03 35 84 ee  	ld	a0, -280(s0)
   124e2: 83 35 04 ef  	ld	a1, -272(s0)
   124e6: 23 30 c4 f4  	sd	a2, -192(s0)
   124ea: 83 36 04 f2  	ld	a3, -224(s0)
   124ee: 03 36 84 f2  	ld	a2, -216(s0)
   124f2: 23 38 d4 f2  	sd	a3, -208(s0)
   124f6: 23 3c c4 f2  	sd	a2, -200(s0)
   124fa: 13 06 04 f3  	addi	a2, s0, -208
   124fe: 97 00 00 00  	auipc	ra, 0
   12502: e7 80 a0 9b  	jalr	-1606(ra)
   12506: b2 70        	ld	ra, 296(sp)
   12508: 12 74        	ld	s0, 288(sp)
   1250a: 55 61        	addi	sp, sp, 304
   1250c: 82 80        	ret

000000000001250e <.Lpcrel_hi21>:
   1250e: 17 75 00 00  	auipc	a0, 7
   12512: 13 05 25 89  	addi	a0, a0, -1902
   12516: 23 30 a4 fe  	sd	a0, -32(s0)
   1251a: 05 45        	li	a0, 1
   1251c: 23 34 a4 fe  	sd	a0, -24(s0)
   12520: 01 45        	li	a0, 0
   12522: 21 e9        	bnez	a0, 0x12572 <.Lpcrel_hi26>
   12524: 09 a0        	j	0x12526 <.Lpcrel_hi22>

0000000000012526 <.Lpcrel_hi22>:
   12526: 17 75 00 00  	auipc	a0, 7
   1252a: 13 05 a5 87  	addi	a0, a0, -1926
   1252e: 23 34 a4 f4  	sd	a0, -184(s0)
   12532: 05 45        	li	a0, 1
   12534: 23 38 a4 f4  	sd	a0, -176(s0)

0000000000012538 <.Lpcrel_hi23>:
   12538: 17 65 00 00  	auipc	a0, 6
   1253c: 13 05 85 ae  	addi	a0, a0, -1304
   12540: 0c 61        	ld	a1, 0(a0)
   12542: 08 65        	ld	a0, 8(a0)
   12544: 23 34 b4 f6  	sd	a1, -152(s0)
   12548: 23 38 a4 f6  	sd	a0, -144(s0)

000000000001254c <.Lpcrel_hi24>:
   1254c: 17 75 00 00  	auipc	a0, 7
   12550: 13 05 45 86  	addi	a0, a0, -1948
   12554: 23 3c a4 f4  	sd	a0, -168(s0)
   12558: 01 45        	li	a0, 0
   1255a: 23 30 a4 f6  	sd	a0, -160(s0)

000000000001255e <.Lpcrel_hi25>:
   1255e: 17 75 00 00  	auipc	a0, 7
   12562: 93 05 25 9a  	addi	a1, a0, -1630
   12566: 13 05 84 f4  	addi	a0, s0, -184
   1256a: 97 40 00 00  	auipc	ra, 4
   1256e: e7 80 60 0b  	jalr	182(ra)

0000000000012572 <.Lpcrel_hi26>:
   12572: 17 75 00 00  	auipc	a0, 7
   12576: 93 05 65 8c  	addi	a1, a0, -1850
   1257a: 13 05 84 f7  	addi	a0, s0, -136
   1257e: 23 38 a4 ec  	sd	a0, -304(s0)
   12582: 05 46        	li	a2, 1
   12584: 97 f0 ff ff  	auipc	ra, 1048575
   12588: e7 80 60 d5  	jalr	-682(ra)
   1258c: 03 35 04 ed  	ld	a0, -304(s0)

0000000000012590 <.Lpcrel_hi27>:
   12590: 97 75 00 00  	auipc	a1, 7
   12594: 93 85 85 90  	addi	a1, a1, -1784
   12598: 97 40 00 00  	auipc	ra, 4
   1259c: e7 80 80 08  	jalr	136(ra)

00000000000125a0 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted28_$u7b$$u7b$closure$u7d$$u7d$17h233e06dbacdcd6d7E>:
   125a0: 1d 71        	addi	sp, sp, -96
   125a2: 86 ec        	sd	ra, 88(sp)
   125a4: a2 e8        	sd	s0, 80(sp)
   125a6: 80 10        	addi	s0, sp, 96
   125a8: 23 34 b4 fa  	sd	a1, -88(s0)
   125ac: aa 85        	mv	a1, a0
   125ae: 03 35 84 fa  	ld	a0, -88(s0)
   125b2: 05 46        	li	a2, 1
   125b4: 23 38 c4 fa  	sd	a2, -80(s0)
   125b8: 23 3c b4 fa  	sd	a1, -72(s0)
   125bc: 23 30 a4 fc  	sd	a0, -64(s0)
   125c0: 90 69        	ld	a2, 16(a1)
   125c2: 23 34 c4 fc  	sd	a2, -56(s0)
   125c6: 23 38 b4 fc  	sd	a1, -48(s0)
   125ca: 94 65        	ld	a3, 8(a1)
   125cc: 23 3c d4 fc  	sd	a3, -40(s0)
   125d0: 8e 06        	slli	a3, a3, 3
   125d2: 36 96        	add	a2, a2, a3
   125d4: 23 30 c4 fe  	sd	a2, -32(s0)
   125d8: 08 e2        	sd	a0, 0(a2)
   125da: 23 34 b4 fe  	sd	a1, -24(s0)
   125de: 88 65        	ld	a0, 8(a1)
   125e0: 05 05        	addi	a0, a0, 1
   125e2: 88 e5        	sd	a0, 8(a1)
   125e4: e6 60        	ld	ra, 88(sp)
   125e6: 46 64        	ld	s0, 80(sp)
   125e8: 25 61        	addi	sp, sp, 96
   125ea: 82 80        	ret

00000000000125ec <_ZN5alloc3vec16Vec$LT$T$C$A$GT$14extend_trusted28_$u7b$$u7b$closure$u7d$$u7d$17h7b86e39e9845b508E>:
   125ec: 1d 71        	addi	sp, sp, -96
   125ee: 86 ec        	sd	ra, 88(sp)
   125f0: a2 e8        	sd	s0, 80(sp)
   125f2: 80 10        	addi	s0, sp, 96
   125f4: 23 34 b4 fa  	sd	a1, -88(s0)
   125f8: aa 85        	mv	a1, a0
   125fa: 03 35 84 fa  	ld	a0, -88(s0)
   125fe: 05 46        	li	a2, 1
   12600: 23 38 c4 fa  	sd	a2, -80(s0)
   12604: 23 3c b4 fa  	sd	a1, -72(s0)
   12608: 23 30 a4 fc  	sd	a0, -64(s0)
   1260c: 90 69        	ld	a2, 16(a1)
   1260e: 23 34 c4 fc  	sd	a2, -56(s0)
   12612: 23 38 b4 fc  	sd	a1, -48(s0)
   12616: 94 65        	ld	a3, 8(a1)
   12618: 23 3c d4 fc  	sd	a3, -40(s0)
   1261c: 8e 06        	slli	a3, a3, 3
   1261e: 36 96        	add	a2, a2, a3
   12620: 23 30 c4 fe  	sd	a2, -32(s0)
   12624: 08 e2        	sd	a0, 0(a2)
   12626: 23 34 b4 fe  	sd	a1, -24(s0)
   1262a: 88 65        	ld	a0, 8(a1)
   1262c: 05 05        	addi	a0, a0, 1
   1262e: 88 e5        	sd	a0, 8(a1)
   12630: e6 60        	ld	ra, 88(sp)
   12632: 46 64        	ld	s0, 80(sp)
   12634: 25 61        	addi	sp, sp, 96
   12636: 82 80        	ret

0000000000012638 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E>:
   12638: 59 71        	addi	sp, sp, -112
   1263a: 86 f4        	sd	ra, 104(sp)
   1263c: a2 f0        	sd	s0, 96(sp)
   1263e: 80 18        	addi	s0, sp, 112
   12640: 23 38 b4 f8  	sd	a1, -112(s0)
   12644: 23 3c a4 f8  	sd	a0, -104(s0)
   12648: 23 38 a4 fa  	sd	a0, -80(s0)
   1264c: 23 3c b4 fa  	sd	a1, -72(s0)
   12650: 0c 69        	ld	a1, 16(a0)
   12652: 23 30 b4 fa  	sd	a1, -96(s0)
   12656: 23 30 a4 fc  	sd	a0, -64(s0)
   1265a: 01 45        	li	a0, 0
   1265c: 01 e9        	bnez	a0, 0x1266c <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x34>
   1265e: 09 a0        	j	0x12660 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x28>
   12660: 03 35 84 f9  	ld	a0, -104(s0)
   12664: 08 61        	ld	a0, 0(a0)
   12666: 23 34 a4 fa  	sd	a0, -88(s0)
   1266a: 29 a0        	j	0x12674 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x3c>
   1266c: 7d 55        	li	a0, -1
   1266e: 23 34 a4 fa  	sd	a0, -88(s0)
   12672: 09 a0        	j	0x12674 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x3c>
   12674: 03 35 04 fa  	ld	a0, -96(s0)
   12678: 83 35 84 fa  	ld	a1, -88(s0)
   1267c: 63 04 b5 00  	beq	a0, a1, 0x12684 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x4c>
   12680: 09 a0        	j	0x12682 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x4a>
   12682: 09 a8        	j	0x12694 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x5c>
   12684: 03 35 84 f9  	ld	a0, -104(s0)
   12688: 0c 69        	ld	a1, 16(a0)
   1268a: 97 10 00 00  	auipc	ra, 1
   1268e: e7 80 20 49  	jalr	1170(ra)
   12692: 09 a0        	j	0x12694 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$4push17h800388420064a7a3E+0x5c>
   12694: 83 35 84 f9  	ld	a1, -104(s0)
   12698: 03 35 04 f9  	ld	a0, -112(s0)
   1269c: 23 34 b4 fc  	sd	a1, -56(s0)
   126a0: 90 65        	ld	a2, 8(a1)
   126a2: 23 38 c4 fc  	sd	a2, -48(s0)
   126a6: 23 3c c4 fc  	sd	a2, -40(s0)
   126aa: 94 69        	ld	a3, 16(a1)
   126ac: 23 30 d4 fe  	sd	a3, -32(s0)
   126b0: 8e 06        	slli	a3, a3, 3
   126b2: 36 96        	add	a2, a2, a3
   126b4: 23 34 c4 fe  	sd	a2, -24(s0)
   126b8: 08 e2        	sd	a0, 0(a2)
   126ba: 88 69        	ld	a0, 16(a1)
   126bc: 05 05        	addi	a0, a0, 1
   126be: 88 e9        	sd	a0, 16(a1)
   126c0: a6 70        	ld	ra, 104(sp)
   126c2: 06 74        	ld	s0, 96(sp)
   126c4: 65 61        	addi	sp, sp, 112
   126c6: 82 80        	ret

00000000000126c8 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E>:
   126c8: 5d 71        	addi	sp, sp, -80
   126ca: 86 e4        	sd	ra, 72(sp)
   126cc: a2 e0        	sd	s0, 64(sp)
   126ce: 80 08        	addi	s0, sp, 80
   126d0: 23 38 b4 fa  	sd	a1, -80(s0)
   126d4: 23 3c a4 fa  	sd	a0, -72(s0)
   126d8: 23 38 a4 fc  	sd	a0, -48(s0)
   126dc: 23 3c b4 fc  	sd	a1, -40(s0)
   126e0: 23 30 a4 fe  	sd	a0, -32(s0)
   126e4: 08 69        	ld	a0, 16(a0)
   126e6: 23 30 a4 fc  	sd	a0, -64(s0)
   126ea: 23 34 a4 fe  	sd	a0, -24(s0)
   126ee: 01 45        	li	a0, 0
   126f0: 01 e9        	bnez	a0, 0x12700 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x38>
   126f2: 09 a0        	j	0x126f4 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x2c>
   126f4: 03 35 84 fb  	ld	a0, -72(s0)
   126f8: 08 61        	ld	a0, 0(a0)
   126fa: 23 34 a4 fc  	sd	a0, -56(s0)
   126fe: 29 a0        	j	0x12708 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x40>
   12700: 7d 55        	li	a0, -1
   12702: 23 34 a4 fc  	sd	a0, -56(s0)
   12706: 09 a0        	j	0x12708 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x40>
   12708: 83 35 04 fb  	ld	a1, -80(s0)
   1270c: 03 36 04 fc  	ld	a2, -64(s0)
   12710: 03 35 84 fc  	ld	a0, -56(s0)
   12714: 11 8d        	sub	a0, a0, a2
   12716: 63 67 b5 00  	bltu	a0, a1, 0x12724 <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x5c>
   1271a: 09 a0        	j	0x1271c <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x54>
   1271c: a6 60        	ld	ra, 72(sp)
   1271e: 06 64        	ld	s0, 64(sp)
   12720: 61 61        	addi	sp, sp, 80
   12722: 82 80        	ret
   12724: 03 36 04 fb  	ld	a2, -80(s0)
   12728: 83 35 04 fc  	ld	a1, -64(s0)
   1272c: 03 35 84 fb  	ld	a0, -72(s0)
   12730: 97 10 00 00  	auipc	ra, 1
   12734: e7 80 60 41  	jalr	1046(ra)
   12738: d5 b7        	j	0x1271c <_ZN5alloc3vec16Vec$LT$T$C$A$GT$7reserve17h645b75689e977722E+0x54>

000000000001273a <_ZN72_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hefce74c22982763bE>:
   1273a: 1d 71        	addi	sp, sp, -96
   1273c: 86 ec        	sd	ra, 88(sp)
   1273e: a2 e8        	sd	s0, 80(sp)
   12740: 80 10        	addi	s0, sp, 96
   12742: 23 30 a4 fc  	sd	a0, -64(s0)
   12746: 23 34 a4 fc  	sd	a0, -56(s0)
   1274a: 0c 65        	ld	a1, 8(a0)
   1274c: 23 38 b4 fc  	sd	a1, -48(s0)
   12750: 23 3c b4 fc  	sd	a1, -40(s0)
   12754: 08 69        	ld	a0, 16(a0)
   12756: 23 30 a4 fe  	sd	a0, -32(s0)
   1275a: 23 34 b4 fe  	sd	a1, -24(s0)
   1275e: 23 38 b4 fa  	sd	a1, -80(s0)
   12762: 23 3c a4 fa  	sd	a0, -72(s0)
   12766: 83 35 04 fb  	ld	a1, -80(s0)
   1276a: 03 35 84 fb  	ld	a0, -72(s0)
   1276e: 23 30 b4 fa  	sd	a1, -96(s0)
   12772: 23 34 a4 fa  	sd	a0, -88(s0)
   12776: 03 35 04 fa  	ld	a0, -96(s0)
   1277a: 83 35 84 fa  	ld	a1, -88(s0)
   1277e: e6 60        	ld	ra, 88(sp)
   12780: 46 64        	ld	s0, 80(sp)
   12782: 25 61        	addi	sp, sp, 96
   12784: 82 80        	ret

0000000000012786 <_ZN95_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$core..iter..traits..collect..FromIterator$LT$T$GT$$GT$9from_iter17h5d3ae35a72fed8e6E>:
   12786: 39 71        	addi	sp, sp, -64
   12788: 06 fc        	sd	ra, 56(sp)
   1278a: 22 f8        	sd	s0, 48(sp)
   1278c: 80 00        	addi	s0, sp, 64
   1278e: 23 30 c4 fc  	sd	a2, -64(s0)
   12792: 2e 86        	mv	a2, a1
   12794: 83 35 04 fc  	ld	a1, -64(s0)
   12798: 23 34 c4 fc  	sd	a2, -56(s0)
   1279c: 2a 86        	mv	a2, a0
   1279e: 03 35 84 fc  	ld	a0, -56(s0)
   127a2: 23 38 c4 fc  	sd	a2, -48(s0)
   127a6: 23 30 a4 fe  	sd	a0, -32(s0)
   127aa: 23 34 b4 fe  	sd	a1, -24(s0)
   127ae: 97 f0 ff ff  	auipc	ra, 1048575
   127b2: e7 80 80 7c  	jalr	1992(ra)
   127b6: 2a 86        	mv	a2, a0
   127b8: 03 35 04 fd  	ld	a0, -48(s0)
   127bc: 23 3c c4 fc  	sd	a2, -40(s0)
   127c0: 2e 86        	mv	a2, a1
   127c2: 83 35 84 fd  	ld	a1, -40(s0)
   127c6: 97 00 00 00  	auipc	ra, 0
   127ca: e7 80 80 0c  	jalr	200(ra)
   127ce: e2 70        	ld	ra, 56(sp)
   127d0: 42 74        	ld	s0, 48(sp)
   127d2: 21 61        	addi	sp, sp, 64
   127d4: 82 80        	ret

00000000000127d6 <_ZN95_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$core..iter..traits..collect..FromIterator$LT$T$GT$$GT$9from_iter17hf0bbcdac351716e5E>:
   127d6: 39 71        	addi	sp, sp, -64
   127d8: 06 fc        	sd	ra, 56(sp)
   127da: 22 f8        	sd	s0, 48(sp)
   127dc: 80 00        	addi	s0, sp, 64
   127de: 23 30 c4 fc  	sd	a2, -64(s0)
   127e2: 2e 86        	mv	a2, a1
   127e4: 83 35 04 fc  	ld	a1, -64(s0)
   127e8: 23 34 c4 fc  	sd	a2, -56(s0)
   127ec: 2a 86        	mv	a2, a0
   127ee: 03 35 84 fc  	ld	a0, -56(s0)
   127f2: 23 38 c4 fc  	sd	a2, -48(s0)
   127f6: 23 30 a4 fe  	sd	a0, -32(s0)
   127fa: 23 34 b4 fe  	sd	a1, -24(s0)
   127fe: 97 f0 ff ff  	auipc	ra, 1048575
   12802: e7 80 00 79  	jalr	1936(ra)
   12806: 2a 86        	mv	a2, a0
   12808: 03 35 04 fd  	ld	a0, -48(s0)
   1280c: 23 3c c4 fc  	sd	a2, -40(s0)
   12810: 2e 86        	mv	a2, a1
   12812: 83 35 84 fd  	ld	a1, -40(s0)
   12816: 97 00 00 00  	auipc	ra, 0
   1281a: e7 80 80 05  	jalr	88(ra)
   1281e: e2 70        	ld	ra, 56(sp)
   12820: 42 74        	ld	s0, 48(sp)
   12822: 21 61        	addi	sp, sp, 64
   12824: 82 80        	ret

0000000000012826 <_ZN97_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$alloc..vec..spec_extend..SpecExtend$LT$T$C$I$GT$$GT$11spec_extend17hc584a7200f705453E>:
   12826: 79 71        	addi	sp, sp, -48
   12828: 06 f4        	sd	ra, 40(sp)
   1282a: 22 f0        	sd	s0, 32(sp)
   1282c: 00 18        	addi	s0, sp, 48
   1282e: 23 3c a4 fc  	sd	a0, -40(s0)
   12832: 23 30 b4 fe  	sd	a1, -32(s0)
   12836: 23 34 c4 fe  	sd	a2, -24(s0)
   1283a: 97 00 00 00  	auipc	ra, 0
   1283e: e7 80 e0 c1  	jalr	-994(ra)
   12842: a2 70        	ld	ra, 40(sp)
   12844: 02 74        	ld	s0, 32(sp)
   12846: 45 61        	addi	sp, sp, 48
   12848: 82 80        	ret

000000000001284a <_ZN97_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$alloc..vec..spec_extend..SpecExtend$LT$T$C$I$GT$$GT$11spec_extend17hf73d9988198f02a4E>:
   1284a: 79 71        	addi	sp, sp, -48
   1284c: 06 f4        	sd	ra, 40(sp)
   1284e: 22 f0        	sd	s0, 32(sp)
   12850: 00 18        	addi	s0, sp, 48
   12852: 23 3c a4 fc  	sd	a0, -40(s0)
   12856: 23 30 b4 fe  	sd	a1, -32(s0)
   1285a: 23 34 c4 fe  	sd	a2, -24(s0)
   1285e: 97 00 00 00  	auipc	ra, 0
   12862: e7 80 20 ab  	jalr	-1358(ra)
   12866: a2 70        	ld	ra, 40(sp)
   12868: 02 74        	ld	s0, 32(sp)
   1286a: 45 61        	addi	sp, sp, 48
   1286c: 82 80        	ret

000000000001286e <_ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17h86ce3d62a8321005E>:
   1286e: 01 11        	addi	sp, sp, -32
   12870: 06 ec        	sd	ra, 24(sp)
   12872: 22 e8        	sd	s0, 16(sp)
   12874: 00 10        	addi	s0, sp, 32
   12876: 23 30 b4 fe  	sd	a1, -32(s0)
   1287a: 23 34 c4 fe  	sd	a2, -24(s0)
   1287e: 97 00 00 00  	auipc	ra, 0
   12882: e7 80 20 86  	jalr	-1950(ra)
   12886: e2 60        	ld	ra, 24(sp)
   12888: 42 64        	ld	s0, 16(sp)
   1288a: 05 61        	addi	sp, sp, 32
   1288c: 82 80        	ret

000000000001288e <_ZN98_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..spec_from_iter..SpecFromIter$LT$T$C$I$GT$$GT$9from_iter17he9aa6da4fb5c3c81E>:
   1288e: 01 11        	addi	sp, sp, -32
   12890: 06 ec        	sd	ra, 24(sp)
   12892: 22 e8        	sd	s0, 16(sp)
   12894: 00 10        	addi	s0, sp, 32
   12896: 23 30 b4 fe  	sd	a1, -32(s0)
   1289a: 23 34 c4 fe  	sd	a2, -24(s0)
   1289e: 97 00 00 00  	auipc	ra, 0
   128a2: e7 80 a0 95  	jalr	-1702(ra)
   128a6: e2 60        	ld	ra, 24(sp)
   128a8: 42 64        	ld	s0, 16(sp)
   128aa: 05 61        	addi	sp, sp, 32
   128ac: 82 80        	ret

00000000000128ae <_ZN4core5alloc6layout6Layout25from_size_align_unchecked17hd9bd0877bf616a52E>:
   128ae: 79 71        	addi	sp, sp, -48
   128b0: 06 f4        	sd	ra, 40(sp)
   128b2: 22 f0        	sd	s0, 32(sp)
   128b4: 00 18        	addi	s0, sp, 48
   128b6: 23 30 a4 fe  	sd	a0, -32(s0)
   128ba: 23 34 b4 fe  	sd	a1, -24(s0)
   128be: 23 3c a4 fc  	sd	a0, -40(s0)
   128c2: 23 38 b4 fc  	sd	a1, -48(s0)
   128c6: 03 35 04 fd  	ld	a0, -48(s0)
   128ca: 83 35 84 fd  	ld	a1, -40(s0)
   128ce: a2 70        	ld	ra, 40(sp)
   128d0: 02 74        	ld	s0, 32(sp)
   128d2: 45 61        	addi	sp, sp, 48
   128d4: 82 80        	ret

00000000000128d6 <_ZN4core5alloc6layout6Layout5array5inner17hd8cee3ba6c8f98e7E>:
   128d6: 75 71        	addi	sp, sp, -144
   128d8: 06 e5        	sd	ra, 136(sp)
   128da: 22 e1        	sd	s0, 128(sp)
   128dc: 00 09        	addi	s0, sp, 144
   128de: 23 30 c4 f8  	sd	a2, -128(s0)
   128e2: 23 34 b4 f8  	sd	a1, -120(s0)
   128e6: 23 38 a4 f8  	sd	a0, -112(s0)
   128ea: 23 34 a4 fc  	sd	a0, -56(s0)
   128ee: 23 38 b4 fc  	sd	a1, -48(s0)
   128f2: 23 3c c4 fc  	sd	a2, -40(s0)
   128f6: 1d ed        	bnez	a0, 0x12934 <_ZN4core5alloc6layout6Layout5array5inner17hd8cee3ba6c8f98e7E+0x5e>
   128f8: 09 a0        	j	0x128fa <_ZN4core5alloc6layout6Layout5array5inner17hd8cee3ba6c8f98e7E+0x24>
   128fa: 03 35 84 f8  	ld	a0, -120(s0)
   128fe: 83 35 04 f9  	ld	a1, -112(s0)
   12902: 03 36 04 f8  	ld	a2, -128(s0)
   12906: b3 85 c5 02  	mul	a1, a1, a2
   1290a: 23 30 b4 fe  	sd	a1, -32(s0)
   1290e: 23 30 a4 fc  	sd	a0, -64(s0)
   12912: 03 35 04 fc  	ld	a0, -64(s0)
   12916: 23 34 a4 fe  	sd	a0, -24(s0)
   1291a: 23 38 b4 fa  	sd	a1, -80(s0)
   1291e: 23 34 a4 fa  	sd	a0, -88(s0)
   12922: 83 35 84 fa  	ld	a1, -88(s0)
   12926: 03 35 04 fb  	ld	a0, -80(s0)
   1292a: 23 3c b4 f8  	sd	a1, -104(s0)
   1292e: 23 30 a4 fa  	sd	a0, -96(s0)
   12932: a5 a0        	j	0x1299a <.Lpcrel_hi2+0x16>
   12934: 03 35 04 f9  	ld	a0, -112(s0)
   12938: 83 35 84 f8  	ld	a1, -120(s0)
   1293c: 23 3c b4 fa  	sd	a1, -72(s0)
   12940: 03 36 84 fb  	ld	a2, -72(s0)
   12944: fd 55        	li	a1, -1
   12946: fe 15        	slli	a1, a1, 63
   12948: 91 8d        	sub	a1, a1, a2
   1294a: 23 3c b4 f6  	sd	a1, -136(s0)
   1294e: 09 cd        	beqz	a0, 0x12968 <.Lpcrel_hi0>
   12950: 09 a0        	j	0x12952 <_ZN4core5alloc6layout6Layout5array5inner17hd8cee3ba6c8f98e7E+0x7c>
   12952: 83 35 04 f8  	ld	a1, -128(s0)
   12956: 03 35 84 f7  	ld	a0, -136(s0)
   1295a: 03 36 04 f9  	ld	a2, -112(s0)
   1295e: 33 55 c5 02  	divu	a0, a0, a2
   12962: 63 61 b5 02  	bltu	a0, a1, 0x12984 <.Lpcrel_hi2>
   12966: 31 a8        	j	0x12982 <.Lpcrel_hi1+0x12>

0000000000012968 <.Lpcrel_hi0>:
   12968: 17 65 00 00  	auipc	a0, 6
   1296c: 13 05 85 61  	addi	a0, a0, 1560

0000000000012970 <.Lpcrel_hi1>:
   12970: 97 65 00 00  	auipc	a1, 6
   12974: 13 86 85 5f  	addi	a2, a1, 1528
   12978: e5 45        	li	a1, 25
   1297a: 97 40 00 00  	auipc	ra, 4
   1297e: e7 80 20 cd  	jalr	-814(ra)
   12982: a5 bf        	j	0x128fa <_ZN4core5alloc6layout6Layout5array5inner17hd8cee3ba6c8f98e7E+0x24>

0000000000012984 <.Lpcrel_hi2>:
   12984: 17 55 00 00  	auipc	a0, 5
   12988: 13 05 c5 69  	addi	a0, a0, 1692
   1298c: 0c 61        	ld	a1, 0(a0)
   1298e: 08 65        	ld	a0, 8(a0)
   12990: 23 3c b4 f8  	sd	a1, -104(s0)
   12994: 23 30 a4 fa  	sd	a0, -96(s0)
   12998: 09 a0        	j	0x1299a <.Lpcrel_hi2+0x16>
   1299a: 03 35 84 f9  	ld	a0, -104(s0)
   1299e: 83 35 04 fa  	ld	a1, -96(s0)
   129a2: aa 60        	ld	ra, 136(sp)
   129a4: 0a 64        	ld	s0, 128(sp)
   129a6: 49 61        	addi	sp, sp, 144
   129a8: 82 80        	ret

00000000000129aa <_ZN64_$LT$core..alloc..layout..Layout$u20$as$u20$core..fmt..Debug$GT$3fmt17hc3beac6d37169951E>:
   129aa: 5d 71        	addi	sp, sp, -80
   129ac: 86 e4        	sd	ra, 72(sp)
   129ae: a2 e0        	sd	s0, 64(sp)
   129b0: 80 08        	addi	s0, sp, 80
   129b2: 23 38 b4 fc  	sd	a1, -48(s0)
   129b6: aa 85        	mv	a1, a0
   129b8: 03 35 04 fd  	ld	a0, -48(s0)
   129bc: 23 30 b4 fe  	sd	a1, -32(s0)
   129c0: 23 34 a4 fe  	sd	a0, -24(s0)
   129c4: 93 87 85 00  	addi	a5, a1, 8
   129c8: 23 3c b4 fc  	sd	a1, -40(s0)

00000000000129cc <.Lpcrel_hi3>:
   129cc: 97 65 00 00  	auipc	a1, 6
   129d0: 93 85 c5 5f  	addi	a1, a1, 1532
   129d4: 0a 86        	mv	a2, sp
   129d6: 0c ea        	sd	a1, 16(a2)
   129d8: 93 05 84 fd  	addi	a1, s0, -40
   129dc: 0c e6        	sd	a1, 8(a2)
   129de: 95 45        	li	a1, 5
   129e0: 0c e2        	sd	a1, 0(a2)

00000000000129e2 <.Lpcrel_hi4>:
   129e2: 97 65 00 00  	auipc	a1, 6
   129e6: 93 85 75 5b  	addi	a1, a1, 1463

00000000000129ea <.Lpcrel_hi5>:
   129ea: 17 66 00 00  	auipc	a2, 6
   129ee: 93 06 66 dc  	addi	a3, a2, -570

00000000000129f2 <.Lpcrel_hi6>:
   129f2: 17 66 00 00  	auipc	a2, 6
   129f6: 13 08 e6 5a  	addi	a6, a2, 1454

00000000000129fa <.Lpcrel_hi7>:
   129fa: 17 66 00 00  	auipc	a2, 6
   129fe: 93 08 66 5c  	addi	a7, a2, 1478
   12a02: 19 46        	li	a2, 6
   12a04: 11 47        	li	a4, 4
   12a06: 97 40 00 00  	auipc	ra, 4
   12a0a: e7 80 80 6f  	jalr	1784(ra)
   12a0e: a6 60        	ld	ra, 72(sp)
   12a10: 06 64        	ld	s0, 64(sp)
   12a12: 61 61        	addi	sp, sp, 80
   12a14: 82 80        	ret

0000000000012a16 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfc593d190027aed8E>:
   12a16: 01 11        	addi	sp, sp, -32
   12a18: 06 ec        	sd	ra, 24(sp)
   12a1a: 22 e8        	sd	s0, 16(sp)
   12a1c: 00 10        	addi	s0, sp, 32
   12a1e: 23 30 a4 fe  	sd	a0, -32(s0)
   12a22: 23 34 b4 fe  	sd	a1, -24(s0)
   12a26: 08 61        	ld	a0, 0(a0)
   12a28: 97 40 00 00  	auipc	ra, 4
   12a2c: e7 80 00 b2  	jalr	-1248(ra)
   12a30: e2 60        	ld	ra, 24(sp)
   12a32: 42 64        	ld	s0, 16(sp)
   12a34: 05 61        	addi	sp, sp, 32
   12a36: 82 80        	ret

0000000000012a38 <_ZN4core3ptr237drop_in_place$LT$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h03964df26242c23dE>:
   12a38: 01 11        	addi	sp, sp, -32
   12a3a: 06 ec        	sd	ra, 24(sp)
   12a3c: 22 e8        	sd	s0, 16(sp)
   12a3e: 00 10        	addi	s0, sp, 32
   12a40: 23 34 a4 fe  	sd	a0, -24(s0)
   12a44: 97 00 00 00  	auipc	ra, 0
   12a48: e7 80 80 11  	jalr	280(ra)
   12a4c: e2 60        	ld	ra, 24(sp)
   12a4e: 42 64        	ld	s0, 16(sp)
   12a50: 05 61        	addi	sp, sp, 32
   12a52: 82 80        	ret

0000000000012a54 <_ZN4core3ptr237drop_in_place$LT$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h91ec600625d28856E>:
   12a54: 01 11        	addi	sp, sp, -32
   12a56: 06 ec        	sd	ra, 24(sp)
   12a58: 22 e8        	sd	s0, 16(sp)
   12a5a: 00 10        	addi	s0, sp, 32
   12a5c: 23 34 a4 fe  	sd	a0, -24(s0)
   12a60: 97 00 00 00  	auipc	ra, 0
   12a64: e7 80 c0 0f  	jalr	252(ra)
   12a68: e2 60        	ld	ra, 24(sp)
   12a6a: 42 64        	ld	s0, 16(sp)
   12a6c: 05 61        	addi	sp, sp, 32
   12a6e: 82 80        	ret

0000000000012a70 <_ZN4core3ptr26drop_in_place$LT$usize$GT$17h4dcf07e6b34f8ce7E>:
   12a70: 01 11        	addi	sp, sp, -32
   12a72: 06 ec        	sd	ra, 24(sp)
   12a74: 22 e8        	sd	s0, 16(sp)
   12a76: 00 10        	addi	s0, sp, 32
   12a78: 23 34 a4 fe  	sd	a0, -24(s0)
   12a7c: e2 60        	ld	ra, 24(sp)
   12a7e: 42 64        	ld	s0, 16(sp)
   12a80: 05 61        	addi	sp, sp, 32
   12a82: 82 80        	ret

0000000000012a84 <_ZN4core3ptr347drop_in_place$LT$core..iter..traits..iterator..Iterator..for_each..call$LT$$BP$const$u20$u8$C$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17hc2016af72395912aE>:
   12a84: 01 11        	addi	sp, sp, -32
   12a86: 06 ec        	sd	ra, 24(sp)
   12a88: 22 e8        	sd	s0, 16(sp)
   12a8a: 00 10        	addi	s0, sp, 32
   12a8c: 23 34 a4 fe  	sd	a0, -24(s0)
   12a90: 97 00 00 00  	auipc	ra, 0
   12a94: e7 80 40 fc  	jalr	-60(ra)
   12a98: e2 60        	ld	ra, 24(sp)
   12a9a: 42 64        	ld	s0, 16(sp)
   12a9c: 05 61        	addi	sp, sp, 32
   12a9e: 82 80        	ret

0000000000012aa0 <_ZN4core3ptr347drop_in_place$LT$core..iter..traits..iterator..Iterator..for_each..call$LT$$BP$const$u20$u8$C$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17hccbf3f3a89907ea4E>:
   12aa0: 01 11        	addi	sp, sp, -32
   12aa2: 06 ec        	sd	ra, 24(sp)
   12aa4: 22 e8        	sd	s0, 16(sp)
   12aa6: 00 10        	addi	s0, sp, 32
   12aa8: 23 34 a4 fe  	sd	a0, -24(s0)
   12aac: 97 00 00 00  	auipc	ra, 0
   12ab0: e7 80 c0 f8  	jalr	-116(ra)
   12ab4: e2 60        	ld	ra, 24(sp)
   12ab6: 42 64        	ld	s0, 16(sp)
   12ab8: 05 61        	addi	sp, sp, 32
   12aba: 82 80        	ret

0000000000012abc <_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17hb3f688f238f5fb73E>:
   12abc: 01 11        	addi	sp, sp, -32
   12abe: 06 ec        	sd	ra, 24(sp)
   12ac0: 22 e8        	sd	s0, 16(sp)
   12ac2: 00 10        	addi	s0, sp, 32
   12ac4: 23 34 a4 fe  	sd	a0, -24(s0)
   12ac8: e2 60        	ld	ra, 24(sp)
   12aca: 42 64        	ld	s0, 16(sp)
   12acc: 05 61        	addi	sp, sp, 32
   12ace: 82 80        	ret

0000000000012ad0 <_ZN4core3ptr46drop_in_place$LT$user_lib..console..Stdout$GT$17hba2bf805dc7b5e3cE>:
   12ad0: 01 11        	addi	sp, sp, -32
   12ad2: 06 ec        	sd	ra, 24(sp)
   12ad4: 22 e8        	sd	s0, 16(sp)
   12ad6: 00 10        	addi	s0, sp, 32
   12ad8: 23 34 a4 fe  	sd	a0, -24(s0)
   12adc: e2 60        	ld	ra, 24(sp)
   12ade: 42 64        	ld	s0, 16(sp)
   12ae0: 05 61        	addi	sp, sp, 32
   12ae2: 82 80        	ret

0000000000012ae4 <_ZN4core3ptr511drop_in_place$LT$core..iter..adapters..map..map_fold$LT$$RF$$RF$str$C$$BP$const$u20$u8$C$$LP$$RP$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$C$core..iter..traits..iterator..Iterator..for_each..call$LT$$BP$const$u20$u8$C$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h5da0ded90b28a56fE>:
   12ae4: 01 11        	addi	sp, sp, -32
   12ae6: 06 ec        	sd	ra, 24(sp)
   12ae8: 22 e8        	sd	s0, 16(sp)
   12aea: 00 10        	addi	s0, sp, 32
   12aec: 23 34 a4 fe  	sd	a0, -24(s0)
   12af0: 97 00 00 00  	auipc	ra, 0
   12af4: e7 80 40 f9  	jalr	-108(ra)
   12af8: e2 60        	ld	ra, 24(sp)
   12afa: 42 64        	ld	s0, 16(sp)
   12afc: 05 61        	addi	sp, sp, 32
   12afe: 82 80        	ret

0000000000012b00 <_ZN4core3ptr511drop_in_place$LT$core..iter..adapters..map..map_fold$LT$$RF$$RF$str$C$$BP$const$u20$u8$C$$LP$$RP$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$C$core..iter..traits..iterator..Iterator..for_each..call$LT$$BP$const$u20$u8$C$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$..extend_trusted$LT$core..iter..adapters..map..Map$LT$core..slice..iter..Iter$LT$$RF$str$GT$$C$user_lib..execve..$u7b$$u7b$closure$u7d$$u7d$$GT$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h6982fe1131624f43E>:
   12b00: 01 11        	addi	sp, sp, -32
   12b02: 06 ec        	sd	ra, 24(sp)
   12b04: 22 e8        	sd	s0, 16(sp)
   12b06: 00 10        	addi	s0, sp, 32
   12b08: 23 34 a4 fe  	sd	a0, -24(s0)
   12b0c: 97 00 00 00  	auipc	ra, 0
   12b10: e7 80 40 f9  	jalr	-108(ra)
   12b14: e2 60        	ld	ra, 24(sp)
   12b16: 42 64        	ld	s0, 16(sp)
   12b18: 05 61        	addi	sp, sp, 32
   12b1a: 82 80        	ret

0000000000012b1c <_ZN4core3ptr56drop_in_place$LT$$RF$core..ptr..alignment..Alignment$GT$17hd317c758ee917485E>:
   12b1c: 01 11        	addi	sp, sp, -32
   12b1e: 06 ec        	sd	ra, 24(sp)
   12b20: 22 e8        	sd	s0, 16(sp)
   12b22: 00 10        	addi	s0, sp, 32
   12b24: 23 34 a4 fe  	sd	a0, -24(s0)
   12b28: e2 60        	ld	ra, 24(sp)
   12b2a: 42 64        	ld	s0, 16(sp)
   12b2c: 05 61        	addi	sp, sp, 32
   12b2e: 82 80        	ret

0000000000012b30 <_ZN4core3ptr60drop_in_place$LT$alloc..vec..Vec$LT$$BP$const$u20$u8$GT$$GT$17hd867322c426cc419E>:
   12b30: 01 11        	addi	sp, sp, -32
   12b32: 06 ec        	sd	ra, 24(sp)
   12b34: 22 e8        	sd	s0, 16(sp)
   12b36: 00 10        	addi	s0, sp, 32
   12b38: 23 30 a4 fe  	sd	a0, -32(s0)
   12b3c: 23 34 a4 fe  	sd	a0, -24(s0)
   12b40: 97 00 00 00  	auipc	ra, 0
   12b44: e7 80 40 05  	jalr	84(ra)
   12b48: 03 35 04 fe  	ld	a0, -32(s0)
   12b4c: 97 00 00 00  	auipc	ra, 0
   12b50: e7 80 c0 02  	jalr	44(ra)
   12b54: e2 60        	ld	ra, 24(sp)
   12b56: 42 64        	ld	s0, 16(sp)
   12b58: 05 61        	addi	sp, sp, 32
   12b5a: 82 80        	ret

0000000000012b5c <_ZN4core3ptr62drop_in_place$LT$alloc..vec..set_len_on_drop..SetLenOnDrop$GT$17h74b63952e0ff51cdE>:
   12b5c: 01 11        	addi	sp, sp, -32
   12b5e: 06 ec        	sd	ra, 24(sp)
   12b60: 22 e8        	sd	s0, 16(sp)
   12b62: 00 10        	addi	s0, sp, 32
   12b64: 23 34 a4 fe  	sd	a0, -24(s0)
   12b68: 97 00 00 00  	auipc	ra, 0
   12b6c: e7 80 60 0c  	jalr	198(ra)
   12b70: e2 60        	ld	ra, 24(sp)
   12b72: 42 64        	ld	s0, 16(sp)
   12b74: 05 61        	addi	sp, sp, 32
   12b76: 82 80        	ret

0000000000012b78 <_ZN4core3ptr67drop_in_place$LT$alloc..raw_vec..RawVec$LT$$BP$const$u20$u8$GT$$GT$17h26745fb9572f8e49E>:
   12b78: 01 11        	addi	sp, sp, -32
   12b7a: 06 ec        	sd	ra, 24(sp)
   12b7c: 22 e8        	sd	s0, 16(sp)
   12b7e: 00 10        	addi	s0, sp, 32
   12b80: 23 34 a4 fe  	sd	a0, -24(s0)
   12b84: 97 00 00 00  	auipc	ra, 0
   12b88: e7 80 40 05  	jalr	84(ra)
   12b8c: e2 60        	ld	ra, 24(sp)
   12b8e: 42 64        	ld	s0, 16(sp)
   12b90: 05 61        	addi	sp, sp, 32
   12b92: 82 80        	ret

0000000000012b94 <_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hc1d82ff3dc5da92eE>:
   12b94: 1d 71        	addi	sp, sp, -96
   12b96: 86 ec        	sd	ra, 88(sp)
   12b98: a2 e8        	sd	s0, 80(sp)
   12b9a: 80 10        	addi	s0, sp, 96
   12b9c: 23 30 a4 fc  	sd	a0, -64(s0)
   12ba0: 23 34 a4 fc  	sd	a0, -56(s0)
   12ba4: 0c 65        	ld	a1, 8(a0)
   12ba6: 23 38 b4 fc  	sd	a1, -48(s0)
   12baa: 23 3c b4 fc  	sd	a1, -40(s0)
   12bae: 08 69        	ld	a0, 16(a0)
   12bb0: 23 30 a4 fe  	sd	a0, -32(s0)
   12bb4: 23 34 b4 fe  	sd	a1, -24(s0)
   12bb8: 23 38 b4 fa  	sd	a1, -80(s0)
   12bbc: 23 3c a4 fa  	sd	a0, -72(s0)
   12bc0: 83 35 04 fb  	ld	a1, -80(s0)
   12bc4: 03 35 84 fb  	ld	a0, -72(s0)
   12bc8: 23 30 b4 fa  	sd	a1, -96(s0)
   12bcc: 23 34 a4 fa  	sd	a0, -88(s0)
   12bd0: e6 60        	ld	ra, 88(sp)
   12bd2: 46 64        	ld	s0, 80(sp)
   12bd4: 25 61        	addi	sp, sp, 96
   12bd6: 82 80        	ret

0000000000012bd8 <_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h513c25bcfeec1da5E>:
   12bd8: 5d 71        	addi	sp, sp, -80
   12bda: 86 e4        	sd	ra, 72(sp)
   12bdc: a2 e0        	sd	s0, 64(sp)
   12bde: 80 08        	addi	s0, sp, 80
   12be0: aa 85        	mv	a1, a0
   12be2: 23 38 b4 fa  	sd	a1, -80(s0)
   12be6: 23 38 b4 fc  	sd	a1, -48(s0)
   12bea: 13 05 84 fb  	addi	a0, s0, -72
   12bee: 97 10 00 00  	auipc	ra, 1
   12bf2: e7 80 40 b6  	jalr	-1180(ra)
   12bf6: 03 35 04 fc  	ld	a0, -64(s0)
   12bfa: 15 c5        	beqz	a0, 0x12c26 <_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h513c25bcfeec1da5E+0x4e>
   12bfc: 09 a0        	j	0x12bfe <_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h513c25bcfeec1da5E+0x26>
   12bfe: 03 35 04 fb  	ld	a0, -80(s0)
   12c02: 83 35 84 fb  	ld	a1, -72(s0)
   12c06: 23 3c b4 fc  	sd	a1, -40(s0)
   12c0a: 03 36 04 fc  	ld	a2, -64(s0)
   12c0e: 83 36 84 fc  	ld	a3, -56(s0)
   12c12: 23 30 c4 fe  	sd	a2, -32(s0)
   12c16: 23 34 d4 fe  	sd	a3, -24(s0)
   12c1a: 41 05        	addi	a0, a0, 16
   12c1c: 97 10 00 00  	auipc	ra, 1
   12c20: e7 80 e0 53  	jalr	1342(ra)
   12c24: 09 a0        	j	0x12c26 <_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h513c25bcfeec1da5E+0x4e>
   12c26: a6 60        	ld	ra, 72(sp)
   12c28: 06 64        	ld	s0, 64(sp)
   12c2a: 61 61        	addi	sp, sp, 80
   12c2c: 82 80        	ret

0000000000012c2e <_ZN83_$LT$alloc..vec..set_len_on_drop..SetLenOnDrop$u20$as$u20$core..ops..drop..Drop$GT$4drop17hf113f16789e30d1fE>:
   12c2e: 01 11        	addi	sp, sp, -32
   12c30: 06 ec        	sd	ra, 24(sp)
   12c32: 22 e8        	sd	s0, 16(sp)
   12c34: 00 10        	addi	s0, sp, 32
   12c36: aa 85        	mv	a1, a0
   12c38: 23 34 b4 fe  	sd	a1, -24(s0)
   12c3c: 88 65        	ld	a0, 8(a1)
   12c3e: 8c 61        	ld	a1, 0(a1)
   12c40: 88 e1        	sd	a0, 0(a1)
   12c42: e2 60        	ld	ra, 24(sp)
   12c44: 42 64        	ld	s0, 16(sp)
   12c46: 05 61        	addi	sp, sp, 32
   12c48: 82 80        	ret

0000000000012c4a <_ZN4core4iter6traits8iterator8Iterator8for_each4call28_$u7b$$u7b$closure$u7d$$u7d$17ha0d3c57d7878a47aE>:
   12c4a: 79 71        	addi	sp, sp, -48
   12c4c: 06 f4        	sd	ra, 40(sp)
   12c4e: 22 f0        	sd	s0, 32(sp)
   12c50: 00 18        	addi	s0, sp, 48
   12c52: 23 3c a4 fc  	sd	a0, -40(s0)
   12c56: 23 34 b4 fe  	sd	a1, -24(s0)
   12c5a: 23 38 b4 fc  	sd	a1, -48(s0)
   12c5e: 83 35 04 fd  	ld	a1, -48(s0)
   12c62: 97 00 00 00  	auipc	ra, 0
   12c66: e7 80 a0 98  	jalr	-1654(ra)
   12c6a: a2 70        	ld	ra, 40(sp)
   12c6c: 02 74        	ld	s0, 32(sp)
   12c6e: 45 61        	addi	sp, sp, 48
   12c70: 82 80        	ret

0000000000012c72 <_ZN4core4iter6traits8iterator8Iterator8for_each4call28_$u7b$$u7b$closure$u7d$$u7d$17hf424d36fd6b82d83E>:
   12c72: 79 71        	addi	sp, sp, -48
   12c74: 06 f4        	sd	ra, 40(sp)
   12c76: 22 f0        	sd	s0, 32(sp)
   12c78: 00 18        	addi	s0, sp, 48
   12c7a: 23 3c a4 fc  	sd	a0, -40(s0)
   12c7e: 23 34 b4 fe  	sd	a1, -24(s0)
   12c82: 23 38 b4 fc  	sd	a1, -48(s0)
   12c86: 83 35 04 fd  	ld	a1, -48(s0)
   12c8a: 97 00 00 00  	auipc	ra, 0
   12c8e: e7 80 60 91  	jalr	-1770(ra)
   12c92: a2 70        	ld	ra, 40(sp)
   12c94: 02 74        	ld	s0, 32(sp)
   12c96: 45 61        	addi	sp, sp, 48
   12c98: 82 80        	ret

0000000000012c9a <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE>:
   12c9a: 65 71        	addi	sp, sp, -400
   12c9c: 06 e7        	sd	ra, 392(sp)
   12c9e: 22 e3        	sd	s0, 384(sp)
   12ca0: 00 0b        	addi	s0, sp, 400
   12ca2: 23 30 c4 e8  	sd	a2, -384(s0)
   12ca6: 23 34 b4 e8  	sd	a1, -376(s0)
   12caa: 23 2e a4 e8  	sw	a0, -356(s0)
   12cae: 23 38 b4 f4  	sd	a1, -176(s0)
   12cb2: 23 3c c4 f4  	sd	a2, -168(s0)
   12cb6: 03 25 c4 e9  	lw	a0, -356(s0)
   12cba: 23 38 a4 e8  	sd	a0, -368(s0)
   12cbe: 23 22 a4 f6  	sw	a0, -156(s0)
   12cc2: 93 05 00 08  	li	a1, 128
   12cc6: 63 69 b5 00  	bltu	a0, a1, 0x12cd8 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x3e>
   12cca: 09 a0        	j	0x12ccc <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x32>
   12ccc: 03 35 04 e9  	ld	a0, -368(s0)
   12cd0: 1b 55 b5 00  	srliw	a0, a0, 11
   12cd4: 01 cd        	beqz	a0, 0x12cec <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x52>
   12cd6: 29 a0        	j	0x12ce0 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x46>
   12cd8: 05 45        	li	a0, 1
   12cda: 23 30 a4 ea  	sd	a0, -352(s0)
   12cde: 2d a0        	j	0x12d08 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6e>
   12ce0: 03 35 04 e9  	ld	a0, -368(s0)
   12ce4: 1b 55 05 01  	srliw	a0, a0, 16
   12ce8: 11 c9        	beqz	a0, 0x12cfc <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x62>
   12cea: 29 a0        	j	0x12cf4 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x5a>
   12cec: 09 45        	li	a0, 2
   12cee: 23 30 a4 ea  	sd	a0, -352(s0)
   12cf2: 11 a8        	j	0x12d06 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6c>
   12cf4: 11 45        	li	a0, 4
   12cf6: 23 30 a4 ea  	sd	a0, -352(s0)
   12cfa: 29 a0        	j	0x12d04 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6a>
   12cfc: 0d 45        	li	a0, 3
   12cfe: 23 30 a4 ea  	sd	a0, -352(s0)
   12d02: 09 a0        	j	0x12d04 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6a>
   12d04: 09 a0        	j	0x12d06 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6c>
   12d06: 09 a0        	j	0x12d08 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x6e>
   12d08: 03 35 04 ea  	ld	a0, -352(s0)
   12d0c: 23 3c a4 e6  	sd	a0, -392(s0)
   12d10: 85 45        	li	a1, 1
   12d12: 63 01 b5 0e  	beq	a0, a1, 0x12df4 <.Lpcrel_hi3+0x10>
   12d16: 09 a0        	j	0x12d18 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x7e>
   12d18: 03 35 84 e7  	ld	a0, -392(s0)
   12d1c: 89 45        	li	a1, 2
   12d1e: 63 0f b5 0c  	beq	a0, a1, 0x12dfc <.Lpcrel_hi3+0x18>
   12d22: 09 a0        	j	0x12d24 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x8a>
   12d24: 03 35 84 e7  	ld	a0, -392(s0)
   12d28: 8d 45        	li	a1, 3
   12d2a: 63 0f b5 0c  	beq	a0, a1, 0x12e08 <.Lpcrel_hi3+0x24>
   12d2e: 09 a0        	j	0x12d30 <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0x96>
   12d30: 03 35 84 e7  	ld	a0, -392(s0)
   12d34: 91 45        	li	a1, 4
   12d36: 63 0f b5 0c  	beq	a0, a1, 0x12e14 <.Lpcrel_hi3+0x30>
   12d3a: 09 a0        	j	0x12d3c <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0xa2>
   12d3c: 83 35 04 e8  	ld	a1, -384(s0)
   12d40: 13 06 04 ea  	addi	a2, s0, -352
   12d44: 23 30 c4 fc  	sd	a2, -64(s0)

0000000000012d48 <.Lpcrel_hi0>:
   12d48: 17 55 00 00  	auipc	a0, 5
   12d4c: 13 05 c5 bb  	addi	a0, a0, -1092
   12d50: 23 34 a4 fc  	sd	a0, -56(s0)
   12d54: 23 34 c4 f0  	sd	a2, -248(s0)
   12d58: 23 38 a4 f0  	sd	a0, -240(s0)
   12d5c: 93 06 c4 e9  	addi	a3, s0, -356
   12d60: 23 38 d4 fc  	sd	a3, -48(s0)

0000000000012d64 <.Lpcrel_hi1>:
   12d64: 17 46 00 00  	auipc	a2, 4
   12d68: 13 06 86 6c  	addi	a2, a2, 1736
   12d6c: 23 3c c4 fc  	sd	a2, -40(s0)
   12d70: 23 3c d4 f0  	sd	a3, -232(s0)
   12d74: 23 30 c4 f2  	sd	a2, -224(s0)
   12d78: 23 3c b4 f2  	sd	a1, -200(s0)
   12d7c: 93 05 84 f3  	addi	a1, s0, -200
   12d80: 23 30 b4 fe  	sd	a1, -32(s0)
   12d84: 23 34 a4 fe  	sd	a0, -24(s0)
   12d88: 23 34 b4 f2  	sd	a1, -216(s0)
   12d8c: 23 38 a4 f2  	sd	a0, -208(s0)
   12d90: 83 35 84 f0  	ld	a1, -248(s0)
   12d94: 03 35 04 f1  	ld	a0, -240(s0)
   12d98: 23 3c b4 ec  	sd	a1, -296(s0)
   12d9c: 23 30 a4 ee  	sd	a0, -288(s0)
   12da0: 83 35 84 f1  	ld	a1, -232(s0)
   12da4: 03 35 04 f2  	ld	a0, -224(s0)
   12da8: 23 34 b4 ee  	sd	a1, -280(s0)
   12dac: 23 38 a4 ee  	sd	a0, -272(s0)
   12db0: 83 35 84 f2  	ld	a1, -216(s0)
   12db4: 03 35 04 f3  	ld	a0, -208(s0)
   12db8: 23 3c b4 ee  	sd	a1, -264(s0)
   12dbc: 23 30 a4 f0  	sd	a0, -256(s0)

0000000000012dc0 <.Lpcrel_hi2>:
   12dc0: 17 65 00 00  	auipc	a0, 6
   12dc4: 93 05 05 2d  	addi	a1, a0, 720
   12dc8: 13 05 84 ea  	addi	a0, s0, -344
   12dcc: 23 38 a4 e6  	sd	a0, -400(s0)
   12dd0: 93 06 84 ed  	addi	a3, s0, -296
   12dd4: 0d 47        	li	a4, 3
   12dd6: 3a 86        	mv	a2, a4
   12dd8: 97 e0 ff ff  	auipc	ra, 1048574
   12ddc: e7 80 a0 3f  	jalr	1018(ra)
   12de0: 03 35 04 e7  	ld	a0, -400(s0)

0000000000012de4 <.Lpcrel_hi3>:
   12de4: 97 65 00 00  	auipc	a1, 6
   12de8: 93 85 c5 2d  	addi	a1, a1, 732
   12dec: 97 40 00 00  	auipc	ra, 4
   12df0: e7 80 40 83  	jalr	-1996(ra)
   12df4: 03 35 04 e8  	ld	a0, -384(s0)
   12df8: 05 e5        	bnez	a0, 0x12e20 <.Lpcrel_hi3+0x3c>
   12dfa: 89 b7        	j	0x12d3c <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0xa2>
   12dfc: 83 35 04 e8  	ld	a1, -384(s0)
   12e00: 05 45        	li	a0, 1
   12e02: 63 65 b5 06  	bltu	a0, a1, 0x12e6c <.Lpcrel_hi4+0x18>
   12e06: 1d bf        	j	0x12d3c <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0xa2>
   12e08: 83 35 04 e8  	ld	a1, -384(s0)
   12e0c: 09 45        	li	a0, 2
   12e0e: 63 68 b5 08  	bltu	a0, a1, 0x12e9e <.Lpcrel_hi4+0x4a>
   12e12: 2d b7        	j	0x12d3c <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0xa2>
   12e14: 83 35 04 e8  	ld	a1, -384(s0)
   12e18: 0d 45        	li	a0, 3
   12e1a: 63 67 b5 0c  	bltu	a0, a1, 0x12ee8 <.Lpcrel_hi4+0x94>
   12e1e: 39 bf        	j	0x12d3c <_ZN4core4char7methods15encode_utf8_raw17h495103942894d49eE+0xa2>
   12e20: 83 35 84 e8  	ld	a1, -376(s0)
   12e24: 23 34 b4 f6  	sd	a1, -152(s0)
   12e28: 03 45 c4 e9  	lbu	a0, -356(s0)
   12e2c: 23 80 a5 00  	sb	a0, 0(a1)
   12e30: 09 a0        	j	0x12e32 <.Lpcrel_hi3+0x4e>
   12e32: 83 36 04 e8  	ld	a3, -384(s0)
   12e36: 03 36 84 e8  	ld	a2, -376(s0)
   12e3a: 03 35 04 ea  	ld	a0, -352(s0)
   12e3e: 23 3c a4 fa  	sd	a0, -72(s0)
   12e42: 81 45        	li	a1, 0
   12e44: 23 30 b4 f4  	sd	a1, -192(s0)
   12e48: 23 34 a4 f4  	sd	a0, -184(s0)
   12e4c: 03 35 04 f4  	ld	a0, -192(s0)
   12e50: 83 35 84 f4  	ld	a1, -184(s0)

0000000000012e54 <.Lpcrel_hi4>:
   12e54: 17 67 00 00  	auipc	a4, 6
   12e58: 13 07 47 1e  	addi	a4, a4, 484
   12e5c: 97 00 00 00  	auipc	ra, 0
   12e60: e7 80 e0 0e  	jalr	238(ra)
   12e64: ba 60        	ld	ra, 392(sp)
   12e66: 1a 64        	ld	s0, 384(sp)
   12e68: 59 61        	addi	sp, sp, 400
   12e6a: 82 80        	ret
   12e6c: 83 35 84 e8  	ld	a1, -376(s0)
   12e70: 23 38 b4 f6  	sd	a1, -144(s0)
   12e74: 13 85 15 00  	addi	a0, a1, 1
   12e78: 23 3c a4 f6  	sd	a0, -136(s0)
   12e7c: 03 25 c4 e9  	lw	a0, -356(s0)
   12e80: 56 15        	slli	a0, a0, 53
   12e82: 6d 91        	srli	a0, a0, 59
   12e84: 13 05 05 0c  	addi	a0, a0, 192
   12e88: 23 80 a5 00  	sb	a0, 0(a1)
   12e8c: 03 45 c4 e9  	lbu	a0, -356(s0)
   12e90: 13 75 f5 03  	andi	a0, a0, 63
   12e94: 13 05 05 08  	addi	a0, a0, 128
   12e98: a3 80 a5 00  	sb	a0, 1(a1)
   12e9c: 59 bf        	j	0x12e32 <.Lpcrel_hi3+0x4e>
   12e9e: 83 35 84 e8  	ld	a1, -376(s0)
   12ea2: 23 30 b4 f8  	sd	a1, -128(s0)
   12ea6: 13 85 15 00  	addi	a0, a1, 1
   12eaa: 23 34 a4 f8  	sd	a0, -120(s0)
   12eae: 13 85 25 00  	addi	a0, a1, 2
   12eb2: 23 38 a4 f8  	sd	a0, -112(s0)
   12eb6: 03 25 c4 e9  	lw	a0, -356(s0)
   12eba: 42 15        	slli	a0, a0, 48
   12ebc: 71 91        	srli	a0, a0, 60
   12ebe: 13 05 05 0e  	addi	a0, a0, 224
   12ec2: 23 80 a5 00  	sb	a0, 0(a1)
   12ec6: 03 25 c4 e9  	lw	a0, -356(s0)
   12eca: 52 15        	slli	a0, a0, 52
   12ecc: 69 91        	srli	a0, a0, 58
   12ece: 13 05 05 08  	addi	a0, a0, 128
   12ed2: a3 80 a5 00  	sb	a0, 1(a1)
   12ed6: 03 45 c4 e9  	lbu	a0, -356(s0)
   12eda: 13 75 f5 03  	andi	a0, a0, 63
   12ede: 13 05 05 08  	addi	a0, a0, 128
   12ee2: 23 81 a5 00  	sb	a0, 2(a1)
   12ee6: b1 b7        	j	0x12e32 <.Lpcrel_hi3+0x4e>
   12ee8: 83 35 84 e8  	ld	a1, -376(s0)
   12eec: 23 3c b4 f8  	sd	a1, -104(s0)
   12ef0: 13 85 15 00  	addi	a0, a1, 1
   12ef4: 23 30 a4 fa  	sd	a0, -96(s0)
   12ef8: 13 85 25 00  	addi	a0, a1, 2
   12efc: 23 34 a4 fa  	sd	a0, -88(s0)
   12f00: 13 85 35 00  	addi	a0, a1, 3
   12f04: 23 38 a4 fa  	sd	a0, -80(s0)
   12f08: 03 25 c4 e9  	lw	a0, -356(s0)
   12f0c: 2e 15        	slli	a0, a0, 43
   12f0e: 75 91        	srli	a0, a0, 61
   12f10: 13 05 05 0f  	addi	a0, a0, 240
   12f14: 23 80 a5 00  	sb	a0, 0(a1)
   12f18: 03 25 c4 e9  	lw	a0, -356(s0)
   12f1c: 3a 15        	slli	a0, a0, 46
   12f1e: 69 91        	srli	a0, a0, 58
   12f20: 13 05 05 08  	addi	a0, a0, 128
   12f24: a3 80 a5 00  	sb	a0, 1(a1)
   12f28: 03 25 c4 e9  	lw	a0, -356(s0)
   12f2c: 52 15        	slli	a0, a0, 52
   12f2e: 69 91        	srli	a0, a0, 58
   12f30: 13 05 05 08  	addi	a0, a0, 128
   12f34: 23 81 a5 00  	sb	a0, 2(a1)
   12f38: 03 45 c4 e9  	lbu	a0, -356(s0)
   12f3c: 13 75 f5 03  	andi	a0, a0, 63
   12f40: 13 05 05 08  	addi	a0, a0, 128
   12f44: a3 81 a5 00  	sb	a0, 3(a1)
   12f48: ed b5        	j	0x12e32 <.Lpcrel_hi3+0x4e>

0000000000012f4a <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hef9a67883c882581E>:
   12f4a: 31 71        	addi	sp, sp, -192
   12f4c: 06 fd        	sd	ra, 184(sp)
   12f4e: 22 f9        	sd	s0, 176(sp)
   12f50: 80 01        	addi	s0, sp, 192
   12f52: 23 34 e4 f4  	sd	a4, -184(s0)
   12f56: 23 38 d4 f4  	sd	a3, -176(s0)
   12f5a: 23 3c c4 f4  	sd	a2, -168(s0)
   12f5e: 23 30 b4 f6  	sd	a1, -160(s0)
   12f62: 23 34 a4 f6  	sd	a0, -152(s0)
   12f66: 23 38 a4 f8  	sd	a0, -112(s0)
   12f6a: 23 3c b4 f8  	sd	a1, -104(s0)
   12f6e: 23 30 c4 fa  	sd	a2, -96(s0)
   12f72: 23 34 d4 fa  	sd	a3, -88(s0)
   12f76: 23 38 a4 fa  	sd	a0, -80(s0)
   12f7a: 23 3c b4 fa  	sd	a1, -72(s0)
   12f7e: 63 ea a5 00  	bltu	a1, a0, 0x12f92 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hef9a67883c882581E+0x48>
   12f82: 09 a0        	j	0x12f84 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hef9a67883c882581E+0x3a>
   12f84: 03 35 04 f5  	ld	a0, -176(s0)
   12f88: 83 35 04 f6  	ld	a1, -160(s0)
   12f8c: 63 67 b5 06  	bltu	a0, a1, 0x12ffa <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hef9a67883c882581E+0xb0>
   12f90: 19 a8        	j	0x12fa6 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hef9a67883c882581E+0x5c>
   12f92: 03 36 84 f4  	ld	a2, -184(s0)
   12f96: 83 35 04 f6  	ld	a1, -160(s0)
   12f9a: 03 35 84 f6  	ld	a0, -152(s0)
   12f9e: 97 40 00 00  	auipc	ra, 4
   12fa2: e7 80 80 2a  	jalr	680(ra)
   12fa6: 83 35 84 f5  	ld	a1, -168(s0)
   12faa: 03 36 84 f6  	ld	a2, -152(s0)
   12fae: 03 35 04 f6  	ld	a0, -160(s0)
   12fb2: 83 36 04 f5  	ld	a3, -176(s0)
   12fb6: 23 30 b4 fc  	sd	a1, -64(s0)
   12fba: 23 34 d4 fc  	sd	a3, -56(s0)
   12fbe: 11 8d        	sub	a0, a0, a2
   12fc0: 23 38 a4 fc  	sd	a0, -48(s0)
   12fc4: 23 3c b4 fc  	sd	a1, -40(s0)
   12fc8: b2 95        	add	a1, a1, a2
   12fca: 23 30 b4 fe  	sd	a1, -32(s0)
   12fce: 23 34 b4 fe  	sd	a1, -24(s0)
   12fd2: 23 30 b4 f8  	sd	a1, -128(s0)
   12fd6: 23 34 a4 f8  	sd	a0, -120(s0)
   12fda: 83 35 04 f8  	ld	a1, -128(s0)
   12fde: 03 35 84 f8  	ld	a0, -120(s0)
   12fe2: 23 38 b4 f6  	sd	a1, -144(s0)
   12fe6: 23 3c a4 f6  	sd	a0, -136(s0)
   12fea: 03 35 04 f7  	ld	a0, -144(s0)
   12fee: 83 35 84 f7  	ld	a1, -136(s0)
   12ff2: ea 70        	ld	ra, 184(sp)
   12ff4: 4a 74        	ld	s0, 176(sp)
   12ff6: 29 61        	addi	sp, sp, 192
   12ff8: 82 80        	ret
   12ffa: 03 36 84 f4  	ld	a2, -184(s0)
   12ffe: 83 35 04 f5  	ld	a1, -176(s0)
   13002: 03 35 04 f6  	ld	a0, -160(s0)
   13006: 97 40 00 00  	auipc	ra, 4
   1300a: e7 80 20 20  	jalr	514(ra)

000000000001300e <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h55ce08f4aa8b3b35E>:
   1300e: 01 11        	addi	sp, sp, -32
   13010: 06 ec        	sd	ra, 24(sp)
   13012: 22 e8        	sd	s0, 16(sp)
   13014: 00 10        	addi	s0, sp, 32
   13016: 23 34 a4 fe  	sd	a0, -24(s0)
   1301a: 97 00 00 00  	auipc	ra, 0
   1301e: e7 80 00 01  	jalr	16(ra)
   13022: e2 60        	ld	ra, 24(sp)
   13024: 42 64        	ld	s0, 16(sp)
   13026: 05 61        	addi	sp, sp, 32
   13028: 82 80        	ret

000000000001302a <_ZN79_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..convert..From$LT$isize$GT$$GT$4from17h76c164d47bee3d0eE>:
   1302a: 75 71        	addi	sp, sp, -144
   1302c: 06 e5        	sd	ra, 136(sp)
   1302e: 22 e1        	sd	s0, 128(sp)
   13030: 00 09        	addi	s0, sp, 144
   13032: 23 34 a4 fc  	sd	a0, -56(s0)
   13036: 97 00 00 00  	auipc	ra, 0
   1303a: e7 80 80 24  	jalr	584(ra)
   1303e: a3 03 a4 f8  	sb	a0, -121(s0)
   13042: 83 45 74 f8  	lbu	a1, -121(s0)
   13046: 13 05 50 08  	li	a0, 133
   1304a: 63 6a b5 00  	bltu	a0, a1, 0x1305e <_ZN79_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..convert..From$LT$isize$GT$$GT$4from17h76c164d47bee3d0eE+0x34>
   1304e: 09 a0        	j	0x13050 <_ZN79_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..convert..From$LT$isize$GT$$GT$4from17h76c164d47bee3d0eE+0x26>
   13050: 03 45 74 f8  	lbu	a0, -121(s0)
   13054: 93 05 90 02  	li	a1, 41
   13058: 63 13 b5 06  	bne	a0, a1, 0x130be <.Lpcrel_hi2+0x10>
   1305c: 09 a0        	j	0x1305e <_ZN79_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..convert..From$LT$isize$GT$$GT$4from17h76c164d47bee3d0eE+0x34>
   1305e: 93 05 74 f8  	addi	a1, s0, -121
   13062: 23 30 b4 fe  	sd	a1, -32(s0)

0000000000013066 <.Lpcrel_hi0>:
   13066: 17 55 00 00  	auipc	a0, 5
   1306a: 13 05 65 85  	addi	a0, a0, -1962
   1306e: 23 34 a4 fe  	sd	a0, -24(s0)
   13072: 23 38 b4 fc  	sd	a1, -48(s0)
   13076: 23 3c a4 fc  	sd	a0, -40(s0)
   1307a: 83 35 04 fd  	ld	a1, -48(s0)
   1307e: 03 35 84 fd  	ld	a0, -40(s0)
   13082: 23 3c b4 fa  	sd	a1, -72(s0)
   13086: 23 30 a4 fc  	sd	a0, -64(s0)

000000000001308a <.Lpcrel_hi1>:
   1308a: 17 65 00 00  	auipc	a0, 6
   1308e: 93 05 65 06  	addi	a1, a0, 102
   13092: 13 05 84 f8  	addi	a0, s0, -120
   13096: 23 3c a4 f6  	sd	a0, -136(s0)
   1309a: 93 06 84 fb  	addi	a3, s0, -72
   1309e: 05 47        	li	a4, 1
   130a0: 3a 86        	mv	a2, a4
   130a2: 97 e0 ff ff  	auipc	ra, 1048574
   130a6: e7 80 00 13  	jalr	304(ra)
   130aa: 03 35 84 f7  	ld	a0, -136(s0)

00000000000130ae <.Lpcrel_hi2>:
   130ae: 97 65 00 00  	auipc	a1, 6
   130b2: 93 85 25 06  	addi	a1, a1, 98
   130b6: 97 30 00 00  	auipc	ra, 3
   130ba: e7 80 a0 56  	jalr	1386(ra)
   130be: 03 45 74 f8  	lbu	a0, -121(s0)
   130c2: 93 05 a0 03  	li	a1, 58
   130c6: e3 0c b5 f8  	beq	a0, a1, 0x1305e <_ZN79_$LT$user_lib..defs..SyscallErr$u20$as$u20$core..convert..From$LT$isize$GT$$GT$4from17h76c164d47bee3d0eE+0x34>
   130ca: 09 a0        	j	0x130cc <.Lpcrel_hi2+0x1e>
   130cc: 03 45 74 f8  	lbu	a0, -121(s0)
   130d0: aa 60        	ld	ra, 136(sp)
   130d2: 0a 64        	ld	s0, 128(sp)
   130d4: 49 61        	addi	sp, sp, 144
   130d6: 82 80        	ret

00000000000130d8 <_ZN8user_lib4defs10WaitOption4bits17h6bf9f20fad4e84b3E>:
   130d8: 01 11        	addi	sp, sp, -32
   130da: 06 ec        	sd	ra, 24(sp)
   130dc: 22 e8        	sd	s0, 16(sp)
   130de: 00 10        	addi	s0, sp, 32
   130e0: 23 34 a4 fe  	sd	a0, -24(s0)
   130e4: 08 41        	lw	a0, 0(a0)
   130e6: e2 60        	ld	ra, 24(sp)
   130e8: 42 64        	ld	s0, 16(sp)
   130ea: 05 61        	addi	sp, sp, 32
   130ec: 82 80        	ret

00000000000130ee <_ZN8user_lib4defs10CloneFlags4bits17hbc8f448d4274cf42E>:
   130ee: 01 11        	addi	sp, sp, -32
   130f0: 06 ec        	sd	ra, 24(sp)
   130f2: 22 e8        	sd	s0, 16(sp)
   130f4: 00 10        	addi	s0, sp, 32
   130f6: 23 34 a4 fe  	sd	a0, -24(s0)
   130fa: 08 41        	lw	a0, 0(a0)
   130fc: e2 60        	ld	ra, 24(sp)
   130fe: 42 64        	ld	s0, 16(sp)
   13100: 05 61        	addi	sp, sp, 32
   13102: 82 80        	ret

0000000000013104 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E>:
   13104: 1d 71        	addi	sp, sp, -96
   13106: 86 ec        	sd	ra, 88(sp)
   13108: a2 e8        	sd	s0, 80(sp)
   1310a: 80 10        	addi	s0, sp, 96
   1310c: 23 34 a4 fa  	sd	a0, -88(s0)
   13110: 23 38 b4 fa  	sd	a1, -80(s0)
   13114: 05 45        	li	a0, 1
   13116: a3 0e a4 fc  	sb	a0, -35(s0)
   1311a: 03 35 84 fa  	ld	a0, -88(s0)
   1311e: fd 55        	li	a1, -1
   13120: fe 15        	slli	a1, a1, 63
   13122: 85 05        	addi	a1, a1, 1
   13124: 63 19 b5 00  	bne	a0, a1, 0x13136 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x32>
   13128: 09 a0        	j	0x1312a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x26>
   1312a: 7d 55        	li	a0, -1
   1312c: 7e 15        	slli	a0, a0, 63
   1312e: 05 05        	addi	a0, a0, 1
   13130: 23 3c a4 fa  	sd	a0, -72(s0)
   13134: 2d a8        	j	0x1316e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x6a>
   13136: 83 35 84 fa  	ld	a1, -88(s0)
   1313a: 03 35 04 fb  	ld	a0, -80(s0)
   1313e: 23 30 b4 fe  	sd	a1, -32(s0)
   13142: 23 34 a4 fe  	sd	a0, -24(s0)
   13146: 01 46        	li	a2, 0
   13148: a3 0e c4 fc  	sb	a2, -35(s0)
   1314c: 23 34 b4 fc  	sd	a1, -56(s0)
   13150: 23 38 a4 fc  	sd	a0, -48(s0)
   13154: 03 35 84 fc  	ld	a0, -56(s0)
   13158: 83 35 04 fd  	ld	a1, -48(s0)
   1315c: 97 00 00 00  	auipc	ra, 0
   13160: e7 80 a0 41  	jalr	1050(ra)
   13164: 23 3c a4 fa  	sd	a0, -72(s0)
   13168: 23 30 b4 fc  	sd	a1, -64(s0)
   1316c: 09 a0        	j	0x1316e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x6a>
   1316e: 03 45 d4 fd  	lbu	a0, -35(s0)
   13172: 05 89        	andi	a0, a0, 1
   13174: 11 e9        	bnez	a0, 0x13188 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x84>
   13176: 09 a0        	j	0x13178 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x74>
   13178: 03 35 84 fb  	ld	a0, -72(s0)
   1317c: 83 35 04 fc  	ld	a1, -64(s0)
   13180: e6 60        	ld	ra, 88(sp)
   13182: 46 64        	ld	s0, 80(sp)
   13184: 25 61        	addi	sp, sp, 96
   13186: 82 80        	ret
   13188: c5 bf        	j	0x13178 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h6120721637f8c5b3E+0x74>

000000000001318a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE>:
   1318a: 1d 71        	addi	sp, sp, -96
   1318c: 86 ec        	sd	ra, 88(sp)
   1318e: a2 e8        	sd	s0, 80(sp)
   13190: 80 10        	addi	s0, sp, 96
   13192: 23 34 d4 fa  	sd	a3, -88(s0)
   13196: 23 38 a4 fa  	sd	a0, -80(s0)
   1319a: 23 3c b4 fa  	sd	a1, -72(s0)
   1319e: 23 30 c4 fc  	sd	a2, -64(s0)
   131a2: 23 38 d4 fc  	sd	a3, -48(s0)
   131a6: 05 45        	li	a0, 1
   131a8: a3 07 a4 fc  	sb	a0, -49(s0)
   131ac: 03 35 84 fb  	ld	a0, -72(s0)
   131b0: 0d c1        	beqz	a0, 0x131d2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x48>
   131b2: 09 a0        	j	0x131b4 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x2a>
   131b4: 83 35 04 fb  	ld	a1, -80(s0)
   131b8: 03 36 84 fb  	ld	a2, -72(s0)
   131bc: 03 35 04 fc  	ld	a0, -64(s0)
   131c0: 23 30 c4 fe  	sd	a2, -32(s0)
   131c4: 23 34 a4 fe  	sd	a0, -24(s0)
   131c8: 90 e5        	sd	a2, 8(a1)
   131ca: 88 e9        	sd	a0, 16(a1)
   131cc: 01 45        	li	a0, 0
   131ce: 88 e1        	sd	a0, 0(a1)
   131d0: 1d a0        	j	0x131f6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x6c>
   131d2: 03 35 84 fa  	ld	a0, -88(s0)
   131d6: 81 45        	li	a1, 0
   131d8: a3 07 b4 fc  	sb	a1, -49(s0)
   131dc: 97 00 00 00  	auipc	ra, 0
   131e0: e7 80 60 34  	jalr	838(ra)
   131e4: 2a 86        	mv	a2, a0
   131e6: 2e 85        	mv	a0, a1
   131e8: 83 35 04 fb  	ld	a1, -80(s0)
   131ec: 90 e5        	sd	a2, 8(a1)
   131ee: 88 e9        	sd	a0, 16(a1)
   131f0: 05 45        	li	a0, 1
   131f2: 88 e1        	sd	a0, 0(a1)
   131f4: 09 a0        	j	0x131f6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x6c>
   131f6: 03 45 f4 fc  	lbu	a0, -49(s0)
   131fa: 05 89        	andi	a0, a0, 1
   131fc: 11 e5        	bnez	a0, 0x13208 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x7e>
   131fe: 09 a0        	j	0x13200 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x76>
   13200: e6 60        	ld	ra, 88(sp)
   13202: 46 64        	ld	s0, 80(sp)
   13204: 25 61        	addi	sp, sp, 96
   13206: 82 80        	ret
   13208: e5 bf        	j	0x13200 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb9f2ab251005e9deE+0x76>

000000000001320a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E>:
   1320a: 39 71        	addi	sp, sp, -64
   1320c: 06 fc        	sd	ra, 56(sp)
   1320e: 22 f8        	sd	s0, 48(sp)
   13210: 80 00        	addi	s0, sp, 64
   13212: 23 30 a4 fc  	sd	a0, -64(s0)
   13216: 23 34 b4 fc  	sd	a1, -56(s0)
   1321a: 23 38 c4 fc  	sd	a2, -48(s0)
   1321e: 05 45        	li	a0, 1
   13220: a3 0e a4 fc  	sb	a0, -35(s0)
   13224: 03 35 84 fc  	ld	a0, -56(s0)
   13228: 0d c1        	beqz	a0, 0x1324a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x40>
   1322a: 09 a0        	j	0x1322c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x22>
   1322c: 83 35 04 fc  	ld	a1, -64(s0)
   13230: 03 36 84 fc  	ld	a2, -56(s0)
   13234: 03 35 04 fd  	ld	a0, -48(s0)
   13238: 23 30 c4 fe  	sd	a2, -32(s0)
   1323c: 23 34 a4 fe  	sd	a0, -24(s0)
   13240: 90 e5        	sd	a2, 8(a1)
   13242: 88 e9        	sd	a0, 16(a1)
   13244: 01 45        	li	a0, 0
   13246: 88 e1        	sd	a0, 0(a1)
   13248: 0d a0        	j	0x1326a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x60>
   1324a: 01 45        	li	a0, 0
   1324c: a3 0e a4 fc  	sb	a0, -35(s0)
   13250: 97 00 00 00  	auipc	ra, 0
   13254: e7 80 a0 30  	jalr	778(ra)
   13258: 2a 86        	mv	a2, a0
   1325a: 2e 85        	mv	a0, a1
   1325c: 83 35 04 fc  	ld	a1, -64(s0)
   13260: 90 e5        	sd	a2, 8(a1)
   13262: 88 e9        	sd	a0, 16(a1)
   13264: 05 45        	li	a0, 1
   13266: 88 e1        	sd	a0, 0(a1)
   13268: 09 a0        	j	0x1326a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x60>
   1326a: 03 45 d4 fd  	lbu	a0, -35(s0)
   1326e: 05 89        	andi	a0, a0, 1
   13270: 11 e5        	bnez	a0, 0x1327c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x72>
   13272: 09 a0        	j	0x13274 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x6a>
   13274: e2 70        	ld	ra, 56(sp)
   13276: 42 74        	ld	s0, 48(sp)
   13278: 21 61        	addi	sp, sp, 64
   1327a: 82 80        	ret
   1327c: e5 bf        	j	0x13274 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hda4cc5505410b5e0E+0x6a>

000000000001327e <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E>:
   1327e: 79 71        	addi	sp, sp, -48
   13280: 06 f4        	sd	ra, 40(sp)
   13282: 22 f0        	sd	s0, 32(sp)
   13284: 00 18        	addi	s0, sp, 48
   13286: 23 3c a4 fc  	sd	a0, -40(s0)
   1328a: 23 34 a4 fe  	sd	a0, -24(s0)
   1328e: 63 48 05 00  	bltz	a0, 0x1329e <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E+0x20>
   13292: 09 a0        	j	0x13294 <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E+0x16>
   13294: 03 35 84 fd  	ld	a0, -40(s0)
   13298: 23 30 a4 fe  	sd	a0, -32(s0)
   1329c: 01 a8        	j	0x132ac <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E+0x2e>
   1329e: 03 35 84 fd  	ld	a0, -40(s0)
   132a2: fd 55        	li	a1, -1
   132a4: fe 15        	slli	a1, a1, 63
   132a6: 63 00 b5 02  	beq	a0, a1, 0x132c6 <.Lpcrel_hi0>
   132aa: 39 a0        	j	0x132b8 <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E+0x3a>
   132ac: 03 35 04 fe  	ld	a0, -32(s0)
   132b0: a2 70        	ld	ra, 40(sp)
   132b2: 02 74        	ld	s0, 32(sp)
   132b4: 45 61        	addi	sp, sp, 48
   132b6: 82 80        	ret
   132b8: 83 35 84 fd  	ld	a1, -40(s0)
   132bc: 01 45        	li	a0, 0
   132be: 0d 8d        	sub	a0, a0, a1
   132c0: 23 30 a4 fe  	sd	a0, -32(s0)
   132c4: e5 b7        	j	0x132ac <_ZN4core3num23_$LT$impl$u20$isize$GT$3abs17he7c16c539c74e889E+0x2e>

00000000000132c6 <.Lpcrel_hi0>:
   132c6: 17 65 00 00  	auipc	a0, 6
   132ca: 13 05 a5 ec  	addi	a0, a0, -310

00000000000132ce <.Lpcrel_hi1>:
   132ce: 97 65 00 00  	auipc	a1, 6
   132d2: 13 86 a5 ea  	addi	a2, a1, -342
   132d6: fd 45        	li	a1, 31
   132d8: 97 30 00 00  	auipc	ra, 3
   132dc: e7 80 40 37  	jalr	884(ra)

00000000000132e0 <_ZN5alloc7raw_vec11finish_grow17h535e5932ae1dcbbdE>:
   132e0: 05 71        	addi	sp, sp, -480
   132e2: 86 ef        	sd	ra, 472(sp)
   132e4: a2 eb        	sd	s0, 464(sp)
   132e6: 80 13        	addi	s0, sp, 480
   132e8: 23 30 e4 e2  	sd	a4, -480(s0)
   132ec: 23 34 d4 e2  	sd	a3, -472(s0)
   132f0: 23 38 a4 e2  	sd	a0, -464(s0)
   132f4: 01 45        	li	a0, 0
   132f6: a3 0f a4 e2  	sb	a0, -449(s0)

00000000000132fa <.Lpcrel_hi0>:
   132fa: 17 55 00 00  	auipc	a0, 5
   132fe: 13 05 65 d2  	addi	a0, a0, -730
   13302: 1c 61        	ld	a5, 0(a0)
   13304: 14 65        	ld	a3, 8(a0)
   13306: 23 30 f4 e4  	sd	a5, -448(s0)
   1330a: 23 34 d4 e4  	sd	a3, -440(s0)
   1330e: 14 61        	ld	a3, 0(a0)
   13310: 08 65        	ld	a0, 8(a0)
   13312: 23 38 d4 e4  	sd	a3, -432(s0)
   13316: 23 3c a4 e4  	sd	a0, -424(s0)

000000000001331a <.Lpcrel_hi1>:
   1331a: 17 55 00 00  	auipc	a0, 5
   1331e: 13 05 65 cf  	addi	a0, a0, -778
   13322: 1c 61        	ld	a5, 0(a0)
   13324: 14 65        	ld	a3, 8(a0)
   13326: 23 30 f4 e6  	sd	a5, -416(s0)
   1332a: 23 34 d4 e6  	sd	a3, -408(s0)
   1332e: 14 61        	ld	a3, 0(a0)
   13330: 08 65        	ld	a0, 8(a0)
   13332: 23 3c d4 e6  	sd	a3, -392(s0)
   13336: 23 30 a4 e8  	sd	a0, -384(s0)
   1333a: 23 38 b4 f4  	sd	a1, -176(s0)
   1333e: 23 3c c4 f4  	sd	a2, -168(s0)
   13342: 23 30 e4 f6  	sd	a4, -160(s0)
   13346: 13 05 04 eb  	addi	a0, s0, -336
   1334a: 97 00 00 00  	auipc	ra, 0
   1334e: e7 80 00 ec  	jalr	-320(ra)
   13352: 03 35 04 eb  	ld	a0, -336(s0)
   13356: 15 e1        	bnez	a0, 0x1337a <.Lpcrel_hi1+0x60>
   13358: 09 a0        	j	0x1335a <.Lpcrel_hi1+0x40>
   1335a: 83 35 84 eb  	ld	a1, -328(s0)
   1335e: 03 35 04 ec  	ld	a0, -320(s0)
   13362: 23 34 b4 f6  	sd	a1, -152(s0)
   13366: 23 38 a4 f6  	sd	a0, -144(s0)
   1336a: 23 30 b4 ea  	sd	a1, -352(s0)
   1336e: 23 34 a4 ea  	sd	a0, -344(s0)
   13372: 01 45        	li	a0, 0
   13374: 23 3c a4 e8  	sd	a0, -360(s0)
   13378: 0d a8        	j	0x133aa <.Lpcrel_hi1+0x90>
   1337a: 83 35 84 eb  	ld	a1, -328(s0)
   1337e: 03 35 04 ec  	ld	a0, -320(s0)
   13382: 23 3c b4 f6  	sd	a1, -136(s0)
   13386: 23 30 a4 f8  	sd	a0, -128(s0)
   1338a: 23 30 b4 f2  	sd	a1, -224(s0)
   1338e: 23 34 a4 f2  	sd	a0, -216(s0)
   13392: 83 35 04 f2  	ld	a1, -224(s0)
   13396: 03 35 84 f2  	ld	a0, -216(s0)
   1339a: 23 30 b4 ea  	sd	a1, -352(s0)
   1339e: 23 34 a4 ea  	sd	a0, -344(s0)
   133a2: 05 45        	li	a0, 1
   133a4: 23 3c a4 e8  	sd	a0, -360(s0)
   133a8: 09 a0        	j	0x133aa <.Lpcrel_hi1+0x90>
   133aa: 03 35 84 e9  	ld	a0, -360(s0)
   133ae: 21 e9        	bnez	a0, 0x133fe <.Lpcrel_hi2+0x24>
   133b0: 09 a0        	j	0x133b2 <.Lpcrel_hi1+0x98>
   133b2: 83 35 04 ea  	ld	a1, -352(s0)
   133b6: 03 35 84 ea  	ld	a0, -344(s0)
   133ba: 23 34 b4 f8  	sd	a1, -120(s0)
   133be: 23 38 a4 f8  	sd	a0, -112(s0)
   133c2: 23 34 b4 e8  	sd	a1, -376(s0)
   133c6: 23 38 a4 e8  	sd	a0, -368(s0)
   133ca: 13 05 84 e8  	addi	a0, s0, -376
   133ce: 23 3c a4 f8  	sd	a0, -104(s0)
   133d2: 03 35 04 e9  	ld	a0, -368(s0)
   133d6: 23 30 a4 fa  	sd	a0, -96(s0)

00000000000133da <.Lpcrel_hi2>:
   133da: 17 55 00 00  	auipc	a0, 5
   133de: 13 05 65 c3  	addi	a0, a0, -970
   133e2: 0c 61        	ld	a1, 0(a0)
   133e4: 08 65        	ld	a0, 8(a0)
   133e6: 23 3c b4 ec  	sd	a1, -296(s0)
   133ea: 23 30 a4 ee  	sd	a0, -288(s0)
   133ee: 03 35 84 ed  	ld	a0, -296(s0)
   133f2: fd 55        	li	a1, -1
   133f4: fe 15        	slli	a1, a1, 63
   133f6: 85 05        	addi	a1, a1, 1
   133f8: 63 02 b5 04  	beq	a0, a1, 0x1343c <.Lpcrel_hi2+0x62>
   133fc: a9 a0        	j	0x13446 <.Lpcrel_hi2+0x6c>
   133fe: 83 35 04 e3  	ld	a1, -464(s0)
   13402: 03 36 04 ea  	ld	a2, -352(s0)
   13406: 03 35 84 ea  	ld	a0, -344(s0)
   1340a: 23 34 c4 ec  	sd	a2, -312(s0)
   1340e: 23 38 a4 ec  	sd	a0, -304(s0)
   13412: 03 36 84 ec  	ld	a2, -312(s0)
   13416: 03 35 04 ed  	ld	a0, -304(s0)
   1341a: 23 30 c4 fe  	sd	a2, -32(s0)
   1341e: 23 34 a4 fe  	sd	a0, -24(s0)
   13422: 23 38 c4 f2  	sd	a2, -208(s0)
   13426: 23 3c a4 f2  	sd	a0, -200(s0)
   1342a: 03 36 04 f3  	ld	a2, -208(s0)
   1342e: 03 35 84 f3  	ld	a0, -200(s0)
   13432: 90 e5        	sd	a2, 8(a1)
   13434: 88 e9        	sd	a0, 16(a1)
   13436: 05 45        	li	a0, 1
   13438: 88 e1        	sd	a0, 0(a1)
   1343a: dd a0        	j	0x13520 <.Lpcrel_hi2+0x146>
   1343c: 03 35 84 e2  	ld	a0, -472(s0)
   13440: 08 65        	ld	a0, 8(a0)
   13442: 0d e9        	bnez	a0, 0x13474 <.Lpcrel_hi2+0x9a>
   13444: 51 a8        	j	0x134d8 <.Lpcrel_hi2+0xfe>
   13446: 83 35 04 e3  	ld	a1, -464(s0)
   1344a: 03 36 84 ed  	ld	a2, -296(s0)
   1344e: 03 35 04 ee  	ld	a0, -288(s0)
   13452: 23 34 c4 ee  	sd	a2, -280(s0)
   13456: 23 38 a4 ee  	sd	a0, -272(s0)
   1345a: 03 36 84 ee  	ld	a2, -280(s0)
   1345e: 03 35 04 ef  	ld	a0, -272(s0)
   13462: 23 38 c4 fc  	sd	a2, -48(s0)
   13466: 23 3c a4 fc  	sd	a0, -40(s0)
   1346a: 90 e5        	sd	a2, 8(a1)
   1346c: 88 e9        	sd	a0, 16(a1)
   1346e: 05 45        	li	a0, 1
   13470: 88 e1        	sd	a0, 0(a1)
   13472: 7d a0        	j	0x13520 <.Lpcrel_hi2+0x146>
   13474: 03 35 04 e2  	ld	a0, -480(s0)
   13478: 03 36 84 e2  	ld	a2, -472(s0)
   1347c: 0c 62        	ld	a1, 0(a2)
   1347e: 23 34 b4 fa  	sd	a1, -88(s0)
   13482: 14 66        	ld	a3, 8(a2)
   13484: 10 6a        	ld	a2, 16(a2)
   13486: 23 34 d4 f0  	sd	a3, -248(s0)
   1348a: 23 38 c4 f0  	sd	a2, -240(s0)
   1348e: 13 06 84 f0  	addi	a2, s0, -248
   13492: 23 38 c4 fa  	sd	a2, -80(s0)
   13496: 03 36 84 f0  	ld	a2, -248(s0)
   1349a: 23 3c c4 fa  	sd	a2, -72(s0)
   1349e: 23 30 c4 f4  	sd	a2, -192(s0)
   134a2: 13 06 84 e8  	addi	a2, s0, -376
   134a6: 23 30 c4 fc  	sd	a2, -64(s0)
   134aa: 03 36 84 e8  	ld	a2, -376(s0)
   134ae: 23 34 c4 fc  	sd	a2, -56(s0)
   134b2: 23 34 c4 f4  	sd	a2, -184(s0)
   134b6: 03 36 84 f0  	ld	a2, -248(s0)
   134ba: 83 36 04 f1  	ld	a3, -240(s0)
   134be: 03 37 84 e8  	ld	a4, -376(s0)
   134c2: 83 37 04 e9  	ld	a5, -368(s0)
   134c6: 97 10 00 00  	auipc	ra, 1
   134ca: e7 80 20 d3  	jalr	-718(ra)
   134ce: 23 3c a4 ee  	sd	a0, -264(s0)
   134d2: 23 30 b4 f0  	sd	a1, -256(s0)
   134d6: 05 a0        	j	0x134f6 <.Lpcrel_hi2+0x11c>
   134d8: 03 35 04 e2  	ld	a0, -480(s0)
   134dc: 83 35 84 e8  	ld	a1, -376(s0)
   134e0: 03 36 04 e9  	ld	a2, -368(s0)
   134e4: 97 10 00 00  	auipc	ra, 1
   134e8: e7 80 60 d4  	jalr	-698(ra)
   134ec: 23 3c a4 ee  	sd	a0, -264(s0)
   134f0: 23 30 b4 f0  	sd	a1, -256(s0)
   134f4: 09 a0        	j	0x134f6 <.Lpcrel_hi2+0x11c>
   134f6: 03 35 04 e3  	ld	a0, -464(s0)
   134fa: 83 35 84 ef  	ld	a1, -264(s0)
   134fe: 03 36 04 f0  	ld	a2, -256(s0)
   13502: 93 06 84 e8  	addi	a3, s0, -376
   13506: 23 3c d4 f0  	sd	a3, -232(s0)
   1350a: 83 36 84 f1  	ld	a3, -232(s0)
   1350e: 97 00 00 00  	auipc	ra, 0
   13512: e7 80 c0 c7  	jalr	-900(ra)
   13516: 09 a0        	j	0x13518 <.Lpcrel_hi2+0x13e>
   13518: fe 60        	ld	ra, 472(sp)
   1351a: 5e 64        	ld	s0, 464(sp)
   1351c: 3d 61        	addi	sp, sp, 480
   1351e: 82 80        	ret
   13520: e5 bf        	j	0x13518 <.Lpcrel_hi2+0x13e>

0000000000013522 <_ZN5alloc7raw_vec11finish_grow28_$u7b$$u7b$closure$u7d$$u7d$17h55bcf8c788ec19c3E>:
   13522: 39 71        	addi	sp, sp, -64
   13524: 06 fc        	sd	ra, 56(sp)
   13526: 22 f8        	sd	s0, 48(sp)
   13528: 80 00        	addi	s0, sp, 64
   1352a: 23 30 a4 fe  	sd	a0, -32(s0)
   1352e: 0c 61        	ld	a1, 0(a0)
   13530: 08 65        	ld	a0, 8(a0)
   13532: 23 38 b4 fc  	sd	a1, -48(s0)
   13536: 23 3c a4 fc  	sd	a0, -40(s0)
   1353a: 83 35 04 fd  	ld	a1, -48(s0)
   1353e: 03 35 84 fd  	ld	a0, -40(s0)
   13542: 23 30 b4 fc  	sd	a1, -64(s0)
   13546: 23 34 a4 fc  	sd	a0, -56(s0)
   1354a: 03 35 04 fc  	ld	a0, -64(s0)
   1354e: 83 35 84 fc  	ld	a1, -56(s0)
   13552: e2 70        	ld	ra, 56(sp)
   13554: 42 74        	ld	s0, 48(sp)
   13556: 21 61        	addi	sp, sp, 64
   13558: 82 80        	ret

000000000001355a <_ZN5alloc7raw_vec11finish_grow28_$u7b$$u7b$closure$u7d$$u7d$17hd2119c16995a0407E>:
   1355a: 01 11        	addi	sp, sp, -32
   1355c: 06 ec        	sd	ra, 24(sp)
   1355e: 22 e8        	sd	s0, 16(sp)
   13560: 00 10        	addi	s0, sp, 32

0000000000013562 <.Lpcrel_hi3>:
   13562: 17 55 00 00  	auipc	a0, 5
   13566: 93 05 e5 ab  	addi	a1, a0, -1346
   1356a: 88 61        	ld	a0, 0(a1)
   1356c: 8c 65        	ld	a1, 8(a1)
   1356e: e2 60        	ld	ra, 24(sp)
   13570: 42 64        	ld	s0, 16(sp)
   13572: 05 61        	addi	sp, sp, 32
   13574: 82 80        	ret

0000000000013576 <_ZN5alloc7raw_vec14handle_reserve28_$u7b$$u7b$closure$u7d$$u7d$17hcc1bf62cda0f319dE>:
   13576: 1d 71        	addi	sp, sp, -96
   13578: 86 ec        	sd	ra, 88(sp)
   1357a: a2 e8        	sd	s0, 80(sp)
   1357c: 80 10        	addi	s0, sp, 96
   1357e: 23 30 a4 fa  	sd	a0, -96(s0)
   13582: 23 34 b4 fa  	sd	a1, -88(s0)
   13586: 13 05 04 fa  	addi	a0, s0, -96
   1358a: 23 34 a4 fc  	sd	a0, -56(s0)
   1358e: 23 38 a4 fc  	sd	a0, -48(s0)
   13592: 03 35 04 fa  	ld	a0, -96(s0)
   13596: 09 ed        	bnez	a0, 0x135b0 <.Lpcrel_hi4+0x16>
   13598: 09 a0        	j	0x1359a <.Lpcrel_hi4>

000000000001359a <.Lpcrel_hi4>:
   1359a: 17 55 00 00  	auipc	a0, 5
   1359e: 13 05 65 a8  	addi	a0, a0, -1402
   135a2: 0c 61        	ld	a1, 0(a0)
   135a4: 08 65        	ld	a0, 8(a0)
   135a6: 23 38 b4 fa  	sd	a1, -80(s0)
   135aa: 23 3c a4 fa  	sd	a0, -72(s0)
   135ae: 25 a0        	j	0x135d6 <.Lpcrel_hi4+0x3c>
   135b0: 13 05 04 fa  	addi	a0, s0, -96
   135b4: 23 3c a4 fc  	sd	a0, -40(s0)
   135b8: 93 05 04 fb  	addi	a1, s0, -80
   135bc: 23 30 b4 fe  	sd	a1, -32(s0)
   135c0: 23 34 a4 fe  	sd	a0, -24(s0)
   135c4: 83 35 04 fa  	ld	a1, -96(s0)
   135c8: 03 35 84 fa  	ld	a0, -88(s0)
   135cc: 23 38 b4 fa  	sd	a1, -80(s0)
   135d0: 23 3c a4 fa  	sd	a0, -72(s0)
   135d4: 09 a0        	j	0x135d6 <.Lpcrel_hi4+0x3c>
   135d6: 03 35 04 fb  	ld	a0, -80(s0)
   135da: 83 35 84 fb  	ld	a1, -72(s0)
   135de: e6 60        	ld	ra, 88(sp)
   135e0: 46 64        	ld	s0, 80(sp)
   135e2: 25 61        	addi	sp, sp, 96
   135e4: 82 80        	ret

00000000000135e6 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17h7f8bd1fe4df86049E>:
   135e6: 2d 71        	addi	sp, sp, -288
   135e8: 06 ee        	sd	ra, 280(sp)
   135ea: 22 ea        	sd	s0, 272(sp)
   135ec: 00 12        	addi	s0, sp, 288
   135ee: 23 34 a4 ee  	sd	a0, -280(s0)

00000000000135f2 <.Lpcrel_hi5>:
   135f2: 17 56 00 00  	auipc	a2, 5
   135f6: 13 06 e6 a2  	addi	a2, a2, -1490
   135fa: 18 62        	ld	a4, 0(a2)
   135fc: 14 66        	ld	a3, 8(a2)
   135fe: 23 38 e4 ee  	sd	a4, -272(s0)
   13602: 23 3c d4 ee  	sd	a3, -264(s0)
   13606: 14 62        	ld	a3, 0(a2)
   13608: 10 66        	ld	a2, 8(a2)
   1360a: 23 30 d4 f0  	sd	a3, -256(s0)
   1360e: 23 34 c4 f0  	sd	a2, -248(s0)
   13612: 23 0b b4 f0  	sb	a1, -234(s0)
   13616: 23 34 a4 f8  	sd	a0, -120(s0)
   1361a: 01 45        	li	a0, 0
   1361c: 11 e5        	bnez	a0, 0x13628 <.Lpcrel_hi5+0x36>
   1361e: 09 a0        	j	0x13620 <.Lpcrel_hi5+0x2e>
   13620: 03 35 84 ee  	ld	a0, -280(s0)
   13624: 0d e5        	bnez	a0, 0x1364e <.Lpcrel_hi5+0x5c>
   13626: 09 a0        	j	0x13628 <.Lpcrel_hi5+0x36>
   13628: 21 45        	li	a0, 8
   1362a: 23 30 a4 fe  	sd	a0, -32(s0)
   1362e: 23 34 a4 fe  	sd	a0, -24(s0)
   13632: 23 3c a4 f6  	sd	a0, -136(s0)
   13636: 03 35 84 f7  	ld	a0, -136(s0)
   1363a: 23 38 a4 f6  	sd	a0, -144(s0)
   1363e: 03 35 04 f7  	ld	a0, -144(s0)
   13642: 23 30 a4 f2  	sd	a0, -224(s0)
   13646: 01 45        	li	a0, 0
   13648: 23 3c a4 f0  	sd	a0, -232(s0)
   1364c: dd a8        	j	0x13742 <.Lpcrel_hi5+0x150>
   1364e: 03 36 84 ee  	ld	a2, -280(s0)
   13652: a1 45        	li	a1, 8
   13654: 23 3c b4 f8  	sd	a1, -104(s0)
   13658: 2e 85        	mv	a0, a1
   1365a: 97 f0 ff ff  	auipc	ra, 1048575
   1365e: e7 80 c0 27  	jalr	636(ra)
   13662: 23 3c a4 f2  	sd	a0, -200(s0)
   13666: 23 30 b4 f4  	sd	a1, -192(s0)
   1366a: 03 35 84 f3  	ld	a0, -200(s0)
   1366e: 1d c9        	beqz	a0, 0x136a4 <.Lpcrel_hi5+0xb2>
   13670: 09 a0        	j	0x13672 <.Lpcrel_hi5+0x80>
   13672: 83 35 84 f3  	ld	a1, -200(s0)
   13676: 03 35 04 f4  	ld	a0, -192(s0)
   1367a: 23 30 b4 fa  	sd	a1, -96(s0)
   1367e: 23 34 a4 fa  	sd	a0, -88(s0)
   13682: 23 34 b4 f2  	sd	a1, -216(s0)
   13686: 23 38 a4 f2  	sd	a0, -208(s0)
   1368a: 13 05 84 f2  	addi	a0, s0, -216
   1368e: 23 38 a4 fa  	sd	a0, -80(s0)
   13692: 03 35 04 f3  	ld	a0, -208(s0)
   13696: 23 3c a4 fa  	sd	a0, -72(s0)
   1369a: 03 45 64 f1  	lbu	a0, -234(s0)
   1369e: 05 89        	andi	a0, a0, 1
   136a0: 11 c5        	beqz	a0, 0x136ac <.Lpcrel_hi5+0xba>
   136a2: 25 a0        	j	0x136ca <.Lpcrel_hi5+0xd8>
   136a4: 97 30 00 00  	auipc	ra, 3
   136a8: e7 80 80 e5  	jalr	-424(ra)
   136ac: 83 35 84 f2  	ld	a1, -216(s0)
   136b0: 03 36 04 f3  	ld	a2, -208(s0)
   136b4: 13 05 74 f1  	addi	a0, s0, -233
   136b8: 97 10 00 00  	auipc	ra, 1
   136bc: e7 80 20 b7  	jalr	-1166(ra)
   136c0: 23 34 a4 f4  	sd	a0, -184(s0)
   136c4: 23 38 b4 f4  	sd	a1, -176(s0)
   136c8: 05 a0        	j	0x136e8 <.Lpcrel_hi5+0xf6>
   136ca: 83 35 84 f2  	ld	a1, -216(s0)
   136ce: 03 36 04 f3  	ld	a2, -208(s0)
   136d2: 13 05 74 f1  	addi	a0, s0, -233
   136d6: 97 10 00 00  	auipc	ra, 1
   136da: e7 80 c0 af  	jalr	-1284(ra)
   136de: 23 34 a4 f4  	sd	a0, -184(s0)
   136e2: 23 38 b4 f4  	sd	a1, -176(s0)
   136e6: 09 a0        	j	0x136e8 <.Lpcrel_hi5+0xf6>
   136e8: 03 35 84 f4  	ld	a0, -184(s0)
   136ec: 39 c1        	beqz	a0, 0x13732 <.Lpcrel_hi5+0x140>
   136ee: 09 a0        	j	0x136f0 <.Lpcrel_hi5+0xfe>
   136f0: 03 35 84 ee  	ld	a0, -280(s0)
   136f4: 83 35 84 f4  	ld	a1, -184(s0)
   136f8: 03 36 04 f5  	ld	a2, -176(s0)
   136fc: 23 30 b4 fc  	sd	a1, -64(s0)
   13700: 23 34 c4 fc  	sd	a2, -56(s0)
   13704: 23 38 b4 fc  	sd	a1, -48(s0)
   13708: 23 30 b4 f6  	sd	a1, -160(s0)
   1370c: 23 3c b4 fc  	sd	a1, -40(s0)
   13710: 23 30 b4 f8  	sd	a1, -128(s0)
   13714: 83 35 04 f8  	ld	a1, -128(s0)
   13718: 23 3c b4 f4  	sd	a1, -168(s0)
   1371c: 23 34 a4 f6  	sd	a0, -152(s0)
   13720: 03 35 84 f5  	ld	a0, -168(s0)
   13724: 23 30 a4 f2  	sd	a0, -224(s0)
   13728: 03 35 84 f6  	ld	a0, -152(s0)
   1372c: 23 3c a4 f0  	sd	a0, -232(s0)
   13730: 09 a8        	j	0x13742 <.Lpcrel_hi5+0x150>
   13732: 03 35 84 f2  	ld	a0, -216(s0)
   13736: 83 35 04 f3  	ld	a1, -208(s0)
   1373a: 97 30 00 00  	auipc	ra, 3
   1373e: e7 80 40 df  	jalr	-524(ra)
   13742: 03 35 84 f1  	ld	a0, -232(s0)
   13746: 83 35 04 f2  	ld	a1, -224(s0)
   1374a: f2 60        	ld	ra, 280(sp)
   1374c: 52 64        	ld	s0, 272(sp)
   1374e: 15 61        	addi	sp, sp, 288
   13750: 82 80        	ret

0000000000013752 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E>:
   13752: 71 71        	addi	sp, sp, -176
   13754: 06 f5        	sd	ra, 168(sp)
   13756: 22 f1        	sd	s0, 160(sp)
   13758: 00 19        	addi	s0, sp, 176
   1375a: 23 3c b4 f4  	sd	a1, -168(s0)
   1375e: 23 30 a4 f6  	sd	a0, -160(s0)
   13762: 23 34 b4 fa  	sd	a1, -88(s0)
   13766: 01 45        	li	a0, 0
   13768: 19 e5        	bnez	a0, 0x13776 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x24>
   1376a: 09 a0        	j	0x1376c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x1a>
   1376c: 03 35 84 f5  	ld	a0, -168(s0)
   13770: 08 61        	ld	a0, 0(a0)
   13772: 19 e5        	bnez	a0, 0x13780 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x2e>
   13774: 09 a0        	j	0x13776 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x24>
   13776: 83 35 04 f6  	ld	a1, -160(s0)
   1377a: 01 45        	li	a0, 0
   1377c: 88 e5        	sd	a0, 8(a1)
   1377e: 8d a8        	j	0x137f0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x9e>
   13780: 83 35 04 f6  	ld	a1, -160(s0)
   13784: 03 35 84 f5  	ld	a0, -168(s0)
   13788: 21 46        	li	a2, 8
   1378a: 23 38 c4 fa  	sd	a2, -80(s0)
   1378e: 23 3c c4 fa  	sd	a2, -72(s0)
   13792: 14 61        	ld	a3, 0(a0)
   13794: 23 30 d4 fc  	sd	a3, -64(s0)
   13798: 8e 06        	slli	a3, a3, 3
   1379a: 23 34 d4 fc  	sd	a3, -56(s0)
   1379e: 23 38 d4 f6  	sd	a3, -144(s0)
   137a2: 23 34 c4 f6  	sd	a2, -152(s0)
   137a6: 08 65        	ld	a0, 8(a0)
   137a8: 23 38 a4 fc  	sd	a0, -48(s0)
   137ac: 23 3c a4 fc  	sd	a0, -40(s0)
   137b0: 23 3c a4 f8  	sd	a0, -104(s0)
   137b4: 23 30 a4 fe  	sd	a0, -32(s0)
   137b8: 23 30 a4 fa  	sd	a0, -96(s0)
   137bc: 23 34 a4 fe  	sd	a0, -24(s0)
   137c0: 23 38 a4 f8  	sd	a0, -112(s0)
   137c4: 03 35 04 f9  	ld	a0, -112(s0)
   137c8: 23 3c a4 f6  	sd	a0, -136(s0)
   137cc: 03 36 84 f6  	ld	a2, -152(s0)
   137d0: 03 35 04 f7  	ld	a0, -144(s0)
   137d4: 23 30 c4 f8  	sd	a2, -128(s0)
   137d8: 23 34 a4 f8  	sd	a0, -120(s0)
   137dc: 03 35 84 f8  	ld	a0, -120(s0)
   137e0: 88 e9        	sd	a0, 16(a1)
   137e2: 03 35 04 f8  	ld	a0, -128(s0)
   137e6: 88 e5        	sd	a0, 8(a1)
   137e8: 03 35 84 f7  	ld	a0, -136(s0)
   137ec: 88 e1        	sd	a0, 0(a1)
   137ee: 09 a0        	j	0x137f0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h83dcb48e88edd7f2E+0x9e>
   137f0: aa 70        	ld	ra, 168(sp)
   137f2: 0a 74        	ld	s0, 160(sp)
   137f4: 4d 61        	addi	sp, sp, 176
   137f6: 82 80        	ret

00000000000137f8 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14grow_amortized17h909eb51733cb84d4E>:
   137f8: 13 01 01 d8  	addi	sp, sp, -640
   137fc: 23 3c 11 26  	sd	ra, 632(sp)
   13800: 23 38 81 26  	sd	s0, 624(sp)
   13804: 00 05        	addi	s0, sp, 640
   13806: 23 38 c4 da  	sd	a2, -592(s0)
   1380a: 23 3c b4 da  	sd	a1, -584(s0)
   1380e: 23 30 a4 dc  	sd	a0, -576(s0)

0000000000013812 <.Lpcrel_hi7>:
   13812: 97 56 00 00  	auipc	a3, 5
   13816: 93 86 e6 80  	addi	a3, a3, -2034
   1381a: 9c 62        	ld	a5, 0(a3)
   1381c: 98 66        	ld	a4, 8(a3)
   1381e: 23 34 f4 dc  	sd	a5, -568(s0)
   13822: 23 38 e4 dc  	sd	a4, -560(s0)
   13826: 9c 62        	ld	a5, 0(a3)
   13828: 98 66        	ld	a4, 8(a3)
   1382a: 23 3c f4 dc  	sd	a5, -552(s0)
   1382e: 23 30 e4 de  	sd	a4, -544(s0)
   13832: 98 62        	ld	a4, 0(a3)
   13834: 94 66        	ld	a3, 8(a3)
   13836: 23 34 e4 de  	sd	a4, -536(s0)
   1383a: 23 38 d4 de  	sd	a3, -528(s0)
   1383e: 91 46        	li	a3, 4
   13840: 23 3c d4 de  	sd	a3, -520(s0)
   13844: 23 30 d4 e0  	sd	a3, -512(s0)
   13848: 23 30 a4 f0  	sd	a0, -256(s0)
   1384c: 23 34 b4 f0  	sd	a1, -248(s0)
   13850: 23 38 c4 f0  	sd	a2, -240(s0)
   13854: 01 45        	li	a0, 0
   13856: 05 e9        	bnez	a0, 0x13886 <.Lpcrel_hi8>
   13858: 09 a0        	j	0x1385a <.Lpcrel_hi7+0x48>
   1385a: 03 35 84 db  	ld	a0, -584(s0)
   1385e: 83 35 04 db  	ld	a1, -592(s0)
   13862: aa 95        	add	a1, a1, a0
   13864: 23 34 b4 da  	sd	a1, -600(s0)
   13868: 33 b5 a5 00  	sltu	a0, a1, a0
   1386c: 23 3c b4 f0  	sd	a1, -232(s0)
   13870: a3 03 a4 f2  	sb	a0, -217(s0)
   13874: 23 34 b4 f2  	sd	a1, -216(s0)
   13878: a3 0b a4 f2  	sb	a0, -201(s0)
   1387c: 03 45 74 f3  	lbu	a0, -201(s0)
   13880: 05 89        	andi	a0, a0, 1
   13882: 0d e5        	bnez	a0, 0x138ac <.Lpcrel_hi9>
   13884: 21 a8        	j	0x1389c <.Lpcrel_hi8+0x16>

0000000000013886 <.Lpcrel_hi8>:
   13886: 17 45 00 00  	auipc	a0, 4
   1388a: 13 05 a5 79  	addi	a0, a0, 1946
   1388e: 0c 61        	ld	a1, 0(a0)
   13890: 08 65        	ld	a0, 8(a0)
   13892: 23 34 b4 e0  	sd	a1, -504(s0)
   13896: 23 38 a4 e0  	sd	a0, -496(s0)
   1389a: ad a4        	j	0x13b04 <.Lpcrel_hi11+0x40>
   1389c: 03 35 84 da  	ld	a0, -600(s0)
   138a0: 23 30 a4 e4  	sd	a0, -448(s0)
   138a4: 05 45        	li	a0, 1
   138a6: 23 3c a4 e2  	sd	a0, -456(s0)
   138aa: 21 a8        	j	0x138c2 <.Lpcrel_hi9+0x16>

00000000000138ac <.Lpcrel_hi9>:
   138ac: 17 45 00 00  	auipc	a0, 4
   138b0: 13 05 45 77  	addi	a0, a0, 1908
   138b4: 0c 61        	ld	a1, 0(a0)
   138b6: 08 65        	ld	a0, 8(a0)
   138b8: 23 3c b4 e2  	sd	a1, -456(s0)
   138bc: 23 30 a4 e4  	sd	a0, -448(s0)
   138c0: 09 a0        	j	0x138c2 <.Lpcrel_hi9+0x16>
   138c2: 03 35 84 e3  	ld	a0, -456(s0)
   138c6: 09 ed        	bnez	a0, 0x138e0 <.Lpcrel_hi10+0x16>
   138c8: 09 a0        	j	0x138ca <.Lpcrel_hi10>

00000000000138ca <.Lpcrel_hi10>:
   138ca: 17 45 00 00  	auipc	a0, 4
   138ce: 13 05 65 75  	addi	a0, a0, 1878
   138d2: 0c 61        	ld	a1, 0(a0)
   138d4: 08 65        	ld	a0, 8(a0)
   138d6: 23 34 b4 e2  	sd	a1, -472(s0)
   138da: 23 38 a4 e2  	sd	a0, -464(s0)
   138de: 29 a8        	j	0x138f8 <.Lpcrel_hi10+0x2e>
   138e0: 03 35 04 e4  	ld	a0, -448(s0)
   138e4: 23 3c a4 f2  	sd	a0, -200(s0)
   138e8: 23 38 a4 e2  	sd	a0, -464(s0)
   138ec: 7d 55        	li	a0, -1
   138ee: 7e 15        	slli	a0, a0, 63
   138f0: 05 05        	addi	a0, a0, 1
   138f2: 23 34 a4 e2  	sd	a0, -472(s0)
   138f6: 09 a0        	j	0x138f8 <.Lpcrel_hi10+0x2e>
   138f8: 03 35 84 e2  	ld	a0, -472(s0)
   138fc: fd 55        	li	a1, -1
   138fe: fe 15        	slli	a1, a1, 63
   13900: 85 05        	addi	a1, a1, 1
   13902: 63 1f b5 00  	bne	a0, a1, 0x13920 <.Lpcrel_hi10+0x56>
   13906: 09 a0        	j	0x13908 <.Lpcrel_hi10+0x3e>
   13908: 03 35 04 e3  	ld	a0, -464(s0)
   1390c: 23 30 a4 f4  	sd	a0, -192(s0)
   13910: 23 30 a4 e2  	sd	a0, -480(s0)
   13914: 7d 55        	li	a0, -1
   13916: 7e 15        	slli	a0, a0, 63
   13918: 05 05        	addi	a0, a0, 1
   1391a: 23 3c a4 e0  	sd	a0, -488(s0)
   1391e: 35 a0        	j	0x1394a <.Lpcrel_hi10+0x80>
   13920: 83 35 84 e2  	ld	a1, -472(s0)
   13924: 03 35 04 e3  	ld	a0, -464(s0)
   13928: 23 34 b4 f4  	sd	a1, -184(s0)
   1392c: 23 38 a4 f4  	sd	a0, -176(s0)
   13930: 23 38 b4 ea  	sd	a1, -336(s0)
   13934: 23 3c a4 ea  	sd	a0, -328(s0)
   13938: 83 35 04 eb  	ld	a1, -336(s0)
   1393c: 03 35 84 eb  	ld	a0, -328(s0)
   13940: 23 3c b4 e0  	sd	a1, -488(s0)
   13944: 23 30 a4 e2  	sd	a0, -480(s0)
   13948: 09 a0        	j	0x1394a <.Lpcrel_hi10+0x80>
   1394a: 03 35 84 e1  	ld	a0, -488(s0)
   1394e: fd 55        	li	a1, -1
   13950: fe 15        	slli	a1, a1, 63
   13952: 85 05        	addi	a1, a1, 1
   13954: 63 1f b5 08  	bne	a0, a1, 0x139f2 <.Lpcrel_hi10+0x128>
   13958: 09 a0        	j	0x1395a <.Lpcrel_hi10+0x90>
   1395a: 03 35 04 dc  	ld	a0, -576(s0)
   1395e: 83 35 04 e2  	ld	a1, -480(s0)
   13962: 23 3c b4 f4  	sd	a1, -168(s0)
   13966: 08 61        	ld	a0, 0(a0)
   13968: 06 05        	slli	a0, a0, 1
   1396a: 23 30 a4 f6  	sd	a0, -160(s0)
   1396e: 97 10 00 00  	auipc	ra, 1
   13972: e7 80 a0 f8  	jalr	-118(ra)
   13976: aa 85        	mv	a1, a0
   13978: 23 34 b4 f6  	sd	a1, -152(s0)
   1397c: 11 45        	li	a0, 4
   1397e: 97 10 00 00  	auipc	ra, 1
   13982: e7 80 a0 f7  	jalr	-134(ra)
   13986: 2a 86        	mv	a2, a0
   13988: 32 85        	mv	a0, a2
   1398a: 23 34 a4 d8  	sd	a0, -632(s0)
   1398e: 23 38 c4 f6  	sd	a2, -144(s0)
   13992: a1 45        	li	a1, 8
   13994: 23 3c b4 f6  	sd	a1, -136(s0)
   13998: 2e 85        	mv	a0, a1
   1399a: 97 f0 ff ff  	auipc	ra, 1048575
   1399e: e7 80 c0 f3  	jalr	-196(ra)
   139a2: 2a 86        	mv	a2, a0
   139a4: 23 38 c4 d8  	sd	a2, -624(s0)
   139a8: 2e 85        	mv	a0, a1
   139aa: 83 35 04 dc  	ld	a1, -576(s0)
   139ae: 23 3c a4 d8  	sd	a0, -616(s0)
   139b2: 23 30 c4 f8  	sd	a2, -128(s0)
   139b6: 23 34 a4 f8  	sd	a0, -120(s0)
   139ba: 13 05 84 e8  	addi	a0, s0, -376
   139be: 23 30 a4 da  	sd	a0, -608(s0)
   139c2: 97 00 00 00  	auipc	ra, 0
   139c6: e7 80 00 d9  	jalr	-624(ra)
   139ca: 03 35 04 dc  	ld	a0, -576(s0)
   139ce: 83 35 04 d9  	ld	a1, -624(s0)
   139d2: 03 36 84 d9  	ld	a2, -616(s0)
   139d6: 83 36 04 da  	ld	a3, -608(s0)
   139da: 13 07 05 01  	addi	a4, a0, 16
   139de: 13 05 04 e7  	addi	a0, s0, -400
   139e2: 97 00 00 00  	auipc	ra, 0
   139e6: e7 80 e0 8f  	jalr	-1794(ra)
   139ea: 03 35 04 e7  	ld	a0, -400(s0)
   139ee: 1d cd        	beqz	a0, 0x13a2c <.Lpcrel_hi10+0x162>
   139f0: b1 a8        	j	0x13a4c <.Lpcrel_hi10+0x182>
   139f2: 83 35 84 e1  	ld	a1, -488(s0)
   139f6: 03 35 04 e2  	ld	a0, -480(s0)
   139fa: 23 34 b4 e4  	sd	a1, -440(s0)
   139fe: 23 38 a4 e4  	sd	a0, -432(s0)
   13a02: 83 35 84 e4  	ld	a1, -440(s0)
   13a06: 03 35 04 e5  	ld	a0, -432(s0)
   13a0a: 23 30 b4 fe  	sd	a1, -32(s0)
   13a0e: 23 34 a4 fe  	sd	a0, -24(s0)
   13a12: 23 30 b4 ec  	sd	a1, -320(s0)
   13a16: 23 34 a4 ec  	sd	a0, -312(s0)
   13a1a: 83 35 04 ec  	ld	a1, -320(s0)
   13a1e: 03 35 84 ec  	ld	a0, -312(s0)
   13a22: 23 34 b4 e0  	sd	a1, -504(s0)
   13a26: 23 38 a4 e0  	sd	a0, -496(s0)
   13a2a: c5 a8        	j	0x13b1a <.Lpcrel_hi11+0x56>
   13a2c: 83 35 84 e7  	ld	a1, -392(s0)
   13a30: 03 35 04 e8  	ld	a0, -384(s0)
   13a34: 23 38 b4 f8  	sd	a1, -112(s0)
   13a38: 23 3c a4 f8  	sd	a0, -104(s0)
   13a3c: 23 30 b4 e6  	sd	a1, -416(s0)
   13a40: 23 34 a4 e6  	sd	a0, -408(s0)
   13a44: 01 45        	li	a0, 0
   13a46: 23 3c a4 e4  	sd	a0, -424(s0)
   13a4a: 0d a8        	j	0x13a7c <.Lpcrel_hi10+0x1b2>
   13a4c: 83 35 84 e7  	ld	a1, -392(s0)
   13a50: 03 35 04 e8  	ld	a0, -384(s0)
   13a54: 23 30 b4 fa  	sd	a1, -96(s0)
   13a58: 23 34 a4 fa  	sd	a0, -88(s0)
   13a5c: 23 38 b4 ec  	sd	a1, -304(s0)
   13a60: 23 3c a4 ec  	sd	a0, -296(s0)
   13a64: 83 35 04 ed  	ld	a1, -304(s0)
   13a68: 03 35 84 ed  	ld	a0, -296(s0)
   13a6c: 23 30 b4 e6  	sd	a1, -416(s0)
   13a70: 23 34 a4 e6  	sd	a0, -408(s0)
   13a74: 05 45        	li	a0, 1
   13a76: 23 3c a4 e4  	sd	a0, -424(s0)
   13a7a: 09 a0        	j	0x13a7c <.Lpcrel_hi10+0x1b2>
   13a7c: 03 35 84 e5  	ld	a0, -424(s0)
   13a80: 29 ed        	bnez	a0, 0x13ada <.Lpcrel_hi11+0x16>
   13a82: 09 a0        	j	0x13a84 <.Lpcrel_hi10+0x1ba>
   13a84: 83 35 04 dc  	ld	a1, -576(s0)
   13a88: 03 35 84 d8  	ld	a0, -632(s0)
   13a8c: 03 36 04 e6  	ld	a2, -416(s0)
   13a90: 83 36 84 e6  	ld	a3, -408(s0)
   13a94: 23 38 c4 fa  	sd	a2, -80(s0)
   13a98: 23 3c d4 fa  	sd	a3, -72(s0)
   13a9c: 23 30 c4 fc  	sd	a2, -64(s0)
   13aa0: 23 34 c4 ee  	sd	a2, -280(s0)
   13aa4: 23 34 c4 fc  	sd	a2, -56(s0)
   13aa8: 23 3c c4 ee  	sd	a2, -264(s0)
   13aac: 03 36 84 ef  	ld	a2, -264(s0)
   13ab0: 23 30 c4 ee  	sd	a2, -288(s0)
   13ab4: 03 36 04 ee  	ld	a2, -288(s0)
   13ab8: 90 e5        	sd	a2, 8(a1)
   13aba: 23 38 a4 ee  	sd	a0, -272(s0)
   13abe: 03 35 04 ef  	ld	a0, -272(s0)
   13ac2: 88 e1        	sd	a0, 0(a1)

0000000000013ac4 <.Lpcrel_hi11>:
   13ac4: 17 45 00 00  	auipc	a0, 4
   13ac8: 13 05 c5 54  	addi	a0, a0, 1356
   13acc: 0c 61        	ld	a1, 0(a0)
   13ace: 08 65        	ld	a0, 8(a0)
   13ad0: 23 34 b4 e0  	sd	a1, -504(s0)
   13ad4: 23 38 a4 e0  	sd	a0, -496(s0)
   13ad8: 35 a0        	j	0x13b04 <.Lpcrel_hi11+0x40>
   13ada: 83 35 04 e6  	ld	a1, -416(s0)
   13ade: 03 35 84 e6  	ld	a0, -408(s0)
   13ae2: 23 30 b4 ea  	sd	a1, -352(s0)
   13ae6: 23 34 a4 ea  	sd	a0, -344(s0)
   13aea: 83 35 04 ea  	ld	a1, -352(s0)
   13aee: 03 35 84 ea  	ld	a0, -344(s0)
   13af2: 23 38 b4 fc  	sd	a1, -48(s0)
   13af6: 23 3c a4 fc  	sd	a0, -40(s0)
   13afa: 23 34 b4 e0  	sd	a1, -504(s0)
   13afe: 23 38 a4 e0  	sd	a0, -496(s0)
   13b02: 21 a8        	j	0x13b1a <.Lpcrel_hi11+0x56>
   13b04: 03 35 84 e0  	ld	a0, -504(s0)
   13b08: 83 35 04 e1  	ld	a1, -496(s0)
   13b0c: 83 30 81 27  	ld	ra, 632(sp)
   13b10: 03 34 01 27  	ld	s0, 624(sp)
   13b14: 13 01 01 28  	addi	sp, sp, 640
   13b18: 82 80        	ret
   13b1a: ed b7        	j	0x13b04 <.Lpcrel_hi11+0x40>

0000000000013b1c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17he9364d61a2925937E>:
   13b1c: 01 11        	addi	sp, sp, -32
   13b1e: 06 ec        	sd	ra, 24(sp)
   13b20: 22 e8        	sd	s0, 16(sp)
   13b22: 00 10        	addi	s0, sp, 32
   13b24: 23 30 a4 fe  	sd	a0, -32(s0)
   13b28: 23 34 b4 fe  	sd	a1, -24(s0)
   13b2c: 05 46        	li	a2, 1
   13b2e: 97 00 00 00  	auipc	ra, 0
   13b32: e7 80 a0 cc  	jalr	-822(ra)
   13b36: 97 00 00 00  	auipc	ra, 0
   13b3a: e7 80 c0 03  	jalr	60(ra)
   13b3e: e2 60        	ld	ra, 24(sp)
   13b40: 42 64        	ld	s0, 16(sp)
   13b42: 05 61        	addi	sp, sp, 32
   13b44: 82 80        	ret

0000000000013b46 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb8fb5823cf1d4734E>:
   13b46: 79 71        	addi	sp, sp, -48
   13b48: 06 f4        	sd	ra, 40(sp)
   13b4a: 22 f0        	sd	s0, 32(sp)
   13b4c: 00 18        	addi	s0, sp, 48
   13b4e: 23 3c a4 fc  	sd	a0, -40(s0)
   13b52: 23 30 b4 fe  	sd	a1, -32(s0)
   13b56: 23 34 c4 fe  	sd	a2, -24(s0)
   13b5a: 97 00 00 00  	auipc	ra, 0
   13b5e: e7 80 e0 c9  	jalr	-866(ra)
   13b62: 97 00 00 00  	auipc	ra, 0
   13b66: e7 80 00 01  	jalr	16(ra)
   13b6a: a2 70        	ld	ra, 40(sp)
   13b6c: 02 74        	ld	s0, 32(sp)
   13b6e: 45 61        	addi	sp, sp, 48
   13b70: 82 80        	ret

0000000000013b72 <_ZN5alloc7raw_vec14handle_reserve17h4844ad962d2ce844E>:
   13b72: 39 71        	addi	sp, sp, -64
   13b74: 06 fc        	sd	ra, 56(sp)
   13b76: 22 f8        	sd	s0, 48(sp)
   13b78: 80 00        	addi	s0, sp, 64
   13b7a: 23 38 a4 fc  	sd	a0, -48(s0)
   13b7e: 23 3c b4 fc  	sd	a1, -40(s0)
   13b82: 97 f0 ff ff  	auipc	ra, 1048575
   13b86: e7 80 20 58  	jalr	1410(ra)
   13b8a: 23 30 a4 fc  	sd	a0, -64(s0)
   13b8e: 23 34 b4 fc  	sd	a1, -56(s0)
   13b92: 03 35 04 fc  	ld	a0, -64(s0)
   13b96: fd 55        	li	a1, -1
   13b98: fe 15        	slli	a1, a1, 63
   13b9a: 85 05        	addi	a1, a1, 1
   13b9c: 63 17 b5 00  	bne	a0, a1, 0x13baa <_ZN5alloc7raw_vec14handle_reserve17h4844ad962d2ce844E+0x38>
   13ba0: 09 a0        	j	0x13ba2 <_ZN5alloc7raw_vec14handle_reserve17h4844ad962d2ce844E+0x30>
   13ba2: e2 70        	ld	ra, 56(sp)
   13ba4: 42 74        	ld	s0, 48(sp)
   13ba6: 21 61        	addi	sp, sp, 64
   13ba8: 82 80        	ret
   13baa: 03 35 04 fc  	ld	a0, -64(s0)
   13bae: 11 e5        	bnez	a0, 0x13bba <_ZN5alloc7raw_vec14handle_reserve17h4844ad962d2ce844E+0x48>
   13bb0: 09 a0        	j	0x13bb2 <_ZN5alloc7raw_vec14handle_reserve17h4844ad962d2ce844E+0x40>
   13bb2: 97 30 00 00  	auipc	ra, 3
   13bb6: e7 80 a0 94  	jalr	-1718(ra)
   13bba: 03 35 04 fc  	ld	a0, -64(s0)
   13bbe: 83 35 84 fc  	ld	a1, -56(s0)
   13bc2: 23 30 a4 fe  	sd	a0, -32(s0)
   13bc6: 23 34 b4 fe  	sd	a1, -24(s0)
   13bca: 97 30 00 00  	auipc	ra, 3
   13bce: e7 80 40 96  	jalr	-1692(ra)

0000000000013bd2 <_ZN5alloc5alloc6Global10alloc_impl17haa6aab7631583724E>:
   13bd2: 13 01 01 de  	addi	sp, sp, -544
   13bd6: 23 3c 11 20  	sd	ra, 536(sp)
   13bda: 23 38 81 20  	sd	s0, 528(sp)
   13bde: 00 14        	addi	s0, sp, 544
   13be0: 36 87        	mv	a4, a3
   13be2: 23 38 e4 de  	sd	a4, -528(s0)
   13be6: 01 47        	li	a4, 0
   13be8: 23 34 e4 e0  	sd	a4, -504(s0)
   13bec: 23 38 e4 e0  	sd	a4, -496(s0)
   13bf0: 23 3c e4 e0  	sd	a4, -488(s0)

0000000000013bf4 <.Lpcrel_hi0>:
   13bf4: 17 f7 00 00  	auipc	a4, 15
   13bf8: 13 07 d7 74  	addi	a4, a4, 1869
   13bfc: 23 30 e4 e2  	sd	a4, -480(s0)
   13c00: 23 38 b4 e2  	sd	a1, -464(s0)
   13c04: 23 3c c4 e2  	sd	a2, -456(s0)
   13c08: 23 3c a4 f0  	sd	a0, -232(s0)
   13c0c: a3 03 d4 f2  	sb	a3, -217(s0)
   13c10: 13 05 04 e3  	addi	a0, s0, -464
   13c14: 23 34 a4 f2  	sd	a0, -216(s0)
   13c18: 03 35 84 e3  	ld	a0, -456(s0)
   13c1c: 23 3c a4 de  	sd	a0, -520(s0)
   13c20: 23 38 a4 f2  	sd	a0, -208(s0)
   13c24: 35 e9        	bnez	a0, 0x13c98 <.Lpcrel_hi0+0xa4>
   13c26: 09 a0        	j	0x13c28 <.Lpcrel_hi0+0x34>
   13c28: 13 05 04 e3  	addi	a0, s0, -464
   13c2c: 23 3c a4 f2  	sd	a0, -200(s0)
   13c30: 03 35 04 e3  	ld	a0, -464(s0)
   13c34: 23 30 a4 f4  	sd	a0, -192(s0)
   13c38: 23 3c a4 ea  	sd	a0, -328(s0)
   13c3c: 03 35 84 eb  	ld	a0, -328(s0)
   13c40: 23 34 a4 f4  	sd	a0, -184(s0)
   13c44: 23 38 a4 f4  	sd	a0, -176(s0)
   13c48: 23 30 a4 e6  	sd	a0, -416(s0)
   13c4c: 23 3c a4 f4  	sd	a0, -168(s0)
   13c50: 23 30 a4 f6  	sd	a0, -160(s0)
   13c54: 23 38 a4 ec  	sd	a0, -304(s0)
   13c58: 01 45        	li	a0, 0
   13c5a: 23 3c a4 ec  	sd	a0, -296(s0)
   13c5e: 83 35 04 ed  	ld	a1, -304(s0)
   13c62: 03 35 84 ed  	ld	a0, -296(s0)
   13c66: 23 30 b4 ec  	sd	a1, -320(s0)
   13c6a: 23 34 a4 ec  	sd	a0, -312(s0)
   13c6e: 83 35 04 ec  	ld	a1, -320(s0)
   13c72: 03 35 84 ec  	ld	a0, -312(s0)
   13c76: 23 34 b4 f6  	sd	a1, -152(s0)
   13c7a: 23 38 a4 f6  	sd	a0, -144(s0)
   13c7e: 23 38 b4 e4  	sd	a1, -432(s0)
   13c82: 23 3c a4 e4  	sd	a0, -424(s0)
   13c86: 83 35 04 e5  	ld	a1, -432(s0)
   13c8a: 03 35 84 e5  	ld	a0, -424(s0)
   13c8e: 23 30 b4 e4  	sd	a1, -448(s0)
   13c92: 23 34 a4 e4  	sd	a0, -440(s0)
   13c96: 31 a0        	j	0x13ca2 <.Lpcrel_hi0+0xae>
   13c98: 03 35 04 df  	ld	a0, -528(s0)
   13c9c: 05 89        	andi	a0, a0, 1
   13c9e: 25 e5        	bnez	a0, 0x13d06 <.Lpcrel_hi1+0x3e>
   13ca0: 21 a8        	j	0x13cb8 <.Lpcrel_hi0+0xc4>
   13ca2: 03 35 04 e4  	ld	a0, -448(s0)
   13ca6: 83 35 84 e4  	ld	a1, -440(s0)
   13caa: 83 30 81 21  	ld	ra, 536(sp)
   13cae: 03 34 01 21  	ld	s0, 528(sp)
   13cb2: 13 01 01 22  	addi	sp, sp, 544
   13cb6: 82 80        	ret
   13cb8: 83 35 04 e3  	ld	a1, -464(s0)
   13cbc: 03 35 84 e3  	ld	a0, -456(s0)
   13cc0: 23 30 b4 e8  	sd	a1, -384(s0)
   13cc4: 23 34 a4 e8  	sd	a0, -376(s0)

0000000000013cc8 <.Lpcrel_hi1>:
   13cc8: 17 f5 00 00  	auipc	a0, 15
   13ccc: 13 05 95 67  	addi	a0, a0, 1657
   13cd0: 03 45 05 00  	lbu	a0, 0(a0)
   13cd4: a3 0f a4 f6  	sb	a0, -129(s0)
   13cd8: 93 05 04 e8  	addi	a1, s0, -384
   13cdc: 23 30 b4 f8  	sd	a1, -128(s0)
   13ce0: 03 35 84 e8  	ld	a0, -376(s0)
   13ce4: 23 34 b4 f8  	sd	a1, -120(s0)
   13ce8: 83 35 04 e8  	ld	a1, -384(s0)
   13cec: 23 38 b4 f8  	sd	a1, -112(s0)
   13cf0: 23 34 b4 ee  	sd	a1, -280(s0)
   13cf4: 83 35 84 ee  	ld	a1, -280(s0)
   13cf8: 97 e0 ff ff  	auipc	ra, 1048574
   13cfc: e7 80 e0 9a  	jalr	-1618(ra)
   13d00: 23 34 a4 e6  	sd	a0, -408(s0)
   13d04: 81 a0        	j	0x13d44 <.Lpcrel_hi1+0x7c>
   13d06: 83 35 04 e3  	ld	a1, -464(s0)
   13d0a: 03 35 84 e3  	ld	a0, -456(s0)
   13d0e: 23 38 b4 e6  	sd	a1, -400(s0)
   13d12: 23 3c a4 e6  	sd	a0, -392(s0)
   13d16: 93 05 04 e7  	addi	a1, s0, -400
   13d1a: 23 3c b4 f8  	sd	a1, -104(s0)
   13d1e: 03 35 84 e7  	ld	a0, -392(s0)
   13d22: 23 30 b4 fa  	sd	a1, -96(s0)
   13d26: 83 35 04 e7  	ld	a1, -400(s0)
   13d2a: 23 34 b4 fa  	sd	a1, -88(s0)
   13d2e: 23 30 b4 ee  	sd	a1, -288(s0)
   13d32: 83 35 04 ee  	ld	a1, -288(s0)
   13d36: 97 e0 ff ff  	auipc	ra, 1048574
   13d3a: e7 80 e0 a5  	jalr	-1442(ra)
   13d3e: 23 34 a4 e6  	sd	a0, -408(s0)
   13d42: 09 a0        	j	0x13d44 <.Lpcrel_hi1+0x7c>
   13d44: 03 35 84 e6  	ld	a0, -408(s0)
   13d48: 23 34 a4 de  	sd	a0, -536(s0)
   13d4c: 23 38 a4 fa  	sd	a0, -80(s0)
   13d50: 11 e5        	bnez	a0, 0x13d5c <.Lpcrel_hi1+0x94>
   13d52: 09 a0        	j	0x13d54 <.Lpcrel_hi1+0x8c>
   13d54: 01 45        	li	a0, 0
   13d56: 23 30 a4 ea  	sd	a0, -352(s0)
   13d5a: 11 a8        	j	0x13d6e <.Lpcrel_hi1+0xa6>
   13d5c: 03 35 84 de  	ld	a0, -536(s0)
   13d60: 23 38 a4 ee  	sd	a0, -272(s0)
   13d64: 03 35 04 ef  	ld	a0, -272(s0)
   13d68: 23 30 a4 ea  	sd	a0, -352(s0)
   13d6c: 09 a0        	j	0x13d6e <.Lpcrel_hi1+0xa6>
   13d6e: 03 35 04 ea  	ld	a0, -352(s0)
   13d72: 11 e5        	bnez	a0, 0x13d7e <.Lpcrel_hi1+0xb6>
   13d74: 09 a0        	j	0x13d76 <.Lpcrel_hi1+0xae>
   13d76: 01 45        	li	a0, 0
   13d78: 23 3c a4 e8  	sd	a0, -360(s0)
   13d7c: 01 a8        	j	0x13d8c <.Lpcrel_hi1+0xc4>
   13d7e: 03 35 04 ea  	ld	a0, -352(s0)
   13d82: 23 3c a4 fa  	sd	a0, -72(s0)
   13d86: 23 3c a4 e8  	sd	a0, -360(s0)
   13d8a: 09 a0        	j	0x13d8c <.Lpcrel_hi1+0xc4>
   13d8c: 03 35 84 e9  	ld	a0, -360(s0)
   13d90: 09 c9        	beqz	a0, 0x13da2 <.Lpcrel_hi1+0xda>
   13d92: 09 a0        	j	0x13d94 <.Lpcrel_hi1+0xcc>
   13d94: 03 35 84 e9  	ld	a0, -360(s0)
   13d98: 23 30 a4 fc  	sd	a0, -64(s0)
   13d9c: 23 38 a4 e8  	sd	a0, -368(s0)
   13da0: 29 a0        	j	0x13daa <.Lpcrel_hi1+0xe2>
   13da2: 01 45        	li	a0, 0
   13da4: 23 38 a4 e8  	sd	a0, -368(s0)
   13da8: 09 a0        	j	0x13daa <.Lpcrel_hi1+0xe2>
   13daa: 03 35 04 e9  	ld	a0, -368(s0)
   13dae: 29 cd        	beqz	a0, 0x13e08 <.Lpcrel_hi2>
   13db0: 09 a0        	j	0x13db2 <.Lpcrel_hi1+0xea>
   13db2: 03 35 84 df  	ld	a0, -520(s0)
   13db6: 83 35 04 e9  	ld	a1, -368(s0)
   13dba: 23 34 b4 fc  	sd	a1, -56(s0)
   13dbe: 23 38 b4 fc  	sd	a1, -48(s0)
   13dc2: 23 3c b4 fc  	sd	a1, -40(s0)
   13dc6: 23 34 b4 f0  	sd	a1, -248(s0)
   13dca: 23 38 a4 f0  	sd	a0, -240(s0)
   13dce: 83 35 84 f0  	ld	a1, -248(s0)
   13dd2: 03 35 04 f1  	ld	a0, -240(s0)
   13dd6: 23 3c b4 ee  	sd	a1, -264(s0)
   13dda: 23 30 a4 f0  	sd	a0, -256(s0)
   13dde: 83 35 84 ef  	ld	a1, -264(s0)
   13de2: 03 35 04 f0  	ld	a0, -256(s0)
   13de6: 23 30 b4 fe  	sd	a1, -32(s0)
   13dea: 23 34 a4 fe  	sd	a0, -24(s0)
   13dee: 23 34 b4 ea  	sd	a1, -344(s0)
   13df2: 23 38 a4 ea  	sd	a0, -336(s0)
   13df6: 83 35 84 ea  	ld	a1, -344(s0)
   13dfa: 03 35 04 eb  	ld	a0, -336(s0)
   13dfe: 23 30 b4 e4  	sd	a1, -448(s0)
   13e02: 23 34 a4 e4  	sd	a0, -440(s0)
   13e06: 71 bd        	j	0x13ca2 <.Lpcrel_hi0+0xae>

0000000000013e08 <.Lpcrel_hi2>:
   13e08: 17 45 00 00  	auipc	a0, 4
   13e0c: 13 05 85 21  	addi	a0, a0, 536
   13e10: 0c 61        	ld	a1, 0(a0)
   13e12: 08 65        	ld	a0, 8(a0)
   13e14: 23 30 b4 e4  	sd	a1, -448(s0)
   13e18: 23 34 a4 e4  	sd	a0, -440(s0)
   13e1c: 59 b5        	j	0x13ca2 <.Lpcrel_hi0+0xae>

0000000000013e1e <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE>:
   13e1e: 13 01 01 d9  	addi	sp, sp, -624
   13e22: 23 34 11 26  	sd	ra, 616(sp)
   13e26: 23 30 81 26  	sd	s0, 608(sp)
   13e2a: 80 1c        	addi	s0, sp, 624
   13e2c: 23 34 b4 dc  	sd	a1, -568(s0)
   13e30: 23 38 a4 dc  	sd	a0, -560(s0)
   13e34: c2 88        	mv	a7, a6
   13e36: 23 3c 14 dd  	sd	a7, -552(s0)
   13e3a: 81 48        	li	a7, 0
   13e3c: 23 05 14 df  	sb	a7, -534(s0)
   13e40: a3 05 14 df  	sb	a7, -533(s0)
   13e44: 23 38 c4 de  	sd	a2, -528(s0)
   13e48: 23 3c d4 de  	sd	a3, -520(s0)
   13e4c: 23 30 e4 e0  	sd	a4, -512(s0)
   13e50: 23 34 f4 e0  	sd	a5, -504(s0)
   13e54: 23 34 a4 ec  	sd	a0, -312(s0)
   13e58: 23 38 b4 ec  	sd	a1, -304(s0)
   13e5c: a3 0f 04 ed  	sb	a6, -289(s0)
   13e60: 13 05 04 df  	addi	a0, s0, -528
   13e64: 23 30 a4 ee  	sd	a0, -288(s0)
   13e68: 03 35 84 df  	ld	a0, -520(s0)
   13e6c: 23 30 a4 e2  	sd	a0, -480(s0)
   13e70: 03 35 04 e2  	ld	a0, -480(s0)
   13e74: 05 e5        	bnez	a0, 0x13e9c <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0x7e>
   13e76: 09 a0        	j	0x13e78 <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0x5a>
   13e78: 03 35 04 dd  	ld	a0, -560(s0)
   13e7c: 83 36 84 dd  	ld	a3, -552(s0)
   13e80: 83 35 04 e0  	ld	a1, -512(s0)
   13e84: 03 36 84 e0  	ld	a2, -504(s0)
   13e88: 85 8a        	andi	a3, a3, 1
   13e8a: 97 00 00 00  	auipc	ra, 0
   13e8e: e7 80 80 d4  	jalr	-696(ra)
   13e92: 23 38 a4 e0  	sd	a0, -496(s0)
   13e96: 23 3c b4 e0  	sd	a1, -488(s0)
   13e9a: 81 a0        	j	0x13eda <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0xbc>
   13e9c: 13 05 04 e2  	addi	a0, s0, -480
   13ea0: 23 34 a4 ee  	sd	a0, -280(s0)
   13ea4: 13 05 04 df  	addi	a0, s0, -528
   13ea8: 23 38 a4 ee  	sd	a0, -272(s0)
   13eac: 03 35 04 df  	ld	a0, -528(s0)
   13eb0: 23 3c a4 ee  	sd	a0, -264(s0)
   13eb4: 23 30 a4 e8  	sd	a0, -384(s0)
   13eb8: 03 35 04 e8  	ld	a0, -384(s0)
   13ebc: 93 05 04 e0  	addi	a1, s0, -512
   13ec0: 23 30 b4 f0  	sd	a1, -256(s0)
   13ec4: 83 35 04 e0  	ld	a1, -512(s0)
   13ec8: 23 34 b4 f0  	sd	a1, -248(s0)
   13ecc: 23 34 b4 e8  	sd	a1, -376(s0)
   13ed0: 83 35 84 e8  	ld	a1, -376(s0)
   13ed4: 63 0f b5 02  	beq	a0, a1, 0x13f12 <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0xf4>
   13ed8: 11 a0        	j	0x13edc <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0xbe>
   13eda: ad a4        	j	0x14144 <.Lpcrel_hi5+0x8e>
   13edc: 03 35 04 dd  	ld	a0, -560(s0)
   13ee0: 83 36 84 dd  	ld	a3, -552(s0)
   13ee4: 83 35 04 e2  	ld	a1, -480(s0)
   13ee8: 23 30 b4 dc  	sd	a1, -576(s0)
   13eec: 23 38 b4 f0  	sd	a1, -240(s0)
   13ef0: 83 35 04 e0  	ld	a1, -512(s0)
   13ef4: 03 36 84 e0  	ld	a2, -504(s0)
   13ef8: 85 8a        	andi	a3, a3, 1
   13efa: 97 00 00 00  	auipc	ra, 0
   13efe: e7 80 80 cd  	jalr	-808(ra)
   13f02: 23 38 a4 e6  	sd	a0, -400(s0)
   13f06: 23 3c b4 e6  	sd	a1, -392(s0)
   13f0a: 03 35 04 e7  	ld	a0, -400(s0)
   13f0e: 2d ed        	bnez	a0, 0x13f88 <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0x16a>
   13f10: 49 a8        	j	0x13fa2 <.Lpcrel_hi3>
   13f12: 03 35 84 dc  	ld	a0, -568(s0)
   13f16: 83 35 04 e2  	ld	a1, -480(s0)
   13f1a: 23 34 b4 da  	sd	a1, -600(s0)
   13f1e: 23 30 b4 f6  	sd	a1, -160(s0)
   13f22: 93 05 04 e0  	addi	a1, s0, -512
   13f26: 23 34 b4 f6  	sd	a1, -152(s0)
   13f2a: 83 36 84 e0  	ld	a3, -504(s0)
   13f2e: 23 38 d4 da  	sd	a3, -592(s0)
   13f32: 23 38 d4 f6  	sd	a3, -144(s0)
   13f36: 93 05 04 df  	addi	a1, s0, -528
   13f3a: 23 3c b4 f6  	sd	a1, -136(s0)
   13f3e: 23 30 a4 f8  	sd	a0, -128(s0)
   13f42: 03 36 04 df  	ld	a2, -528(s0)
   13f46: 83 35 84 df  	ld	a1, -520(s0)
   13f4a: 23 34 c4 e2  	sd	a2, -472(s0)
   13f4e: 23 38 b4 e2  	sd	a1, -464(s0)
   13f52: 13 06 84 e2  	addi	a2, s0, -472
   13f56: 23 34 c4 f8  	sd	a2, -120(s0)
   13f5a: 83 35 04 e3  	ld	a1, -464(s0)
   13f5e: 23 38 c4 f8  	sd	a2, -112(s0)
   13f62: 03 36 84 e2  	ld	a2, -472(s0)
   13f66: 23 3c c4 f8  	sd	a2, -104(s0)
   13f6a: 23 38 c4 e8  	sd	a2, -368(s0)
   13f6e: 03 36 04 e9  	ld	a2, -368(s0)
   13f72: 97 d0 ff ff  	auipc	ra, 1048573
   13f76: e7 80 20 7c  	jalr	1986(ra)
   13f7a: aa 85        	mv	a1, a0
   13f7c: 23 3c b4 da  	sd	a1, -584(s0)
   13f80: 23 30 a4 fa  	sd	a0, -96(s0)
   13f84: 5d cd        	beqz	a0, 0x14042 <.Lpcrel_hi4+0x18>
   13f86: d1 a0        	j	0x1404a <.Lpcrel_hi4+0x20>
   13f88: 83 35 04 e7  	ld	a1, -400(s0)
   13f8c: 03 35 84 e7  	ld	a0, -392(s0)
   13f90: 23 3c b4 f0  	sd	a1, -232(s0)
   13f94: 23 30 a4 f2  	sd	a0, -224(s0)
   13f98: 23 30 b4 e6  	sd	a1, -416(s0)
   13f9c: 23 34 a4 e6  	sd	a0, -408(s0)
   13fa0: 21 a8        	j	0x13fb8 <.Lpcrel_hi3+0x16>

0000000000013fa2 <.Lpcrel_hi3>:
   13fa2: 17 45 00 00  	auipc	a0, 4
   13fa6: 13 05 e5 07  	addi	a0, a0, 126
   13faa: 0c 61        	ld	a1, 0(a0)
   13fac: 08 65        	ld	a0, 8(a0)
   13fae: 23 30 b4 e6  	sd	a1, -416(s0)
   13fb2: 23 34 a4 e6  	sd	a0, -408(s0)
   13fb6: 09 a0        	j	0x13fb8 <.Lpcrel_hi3+0x16>
   13fb8: 03 35 04 e6  	ld	a0, -416(s0)
   13fbc: 3d c5        	beqz	a0, 0x1402a <.Lpcrel_hi4>
   13fbe: 09 a0        	j	0x13fc0 <.Lpcrel_hi3+0x1e>
   13fc0: 83 35 84 dc  	ld	a1, -568(s0)
   13fc4: 03 36 04 dc  	ld	a2, -576(s0)
   13fc8: 03 35 04 e6  	ld	a0, -416(s0)
   13fcc: 23 3c a4 d8  	sd	a0, -616(s0)
   13fd0: 83 36 84 e6  	ld	a3, -408(s0)
   13fd4: 23 30 d4 da  	sd	a3, -608(s0)
   13fd8: 23 34 a4 f2  	sd	a0, -216(s0)
   13fdc: 23 38 d4 f2  	sd	a3, -208(s0)
   13fe0: 23 3c b4 f2  	sd	a1, -200(s0)
   13fe4: 23 30 a4 f4  	sd	a0, -192(s0)
   13fe8: 23 34 d4 f4  	sd	a3, -184(s0)
   13fec: 23 38 a4 f4  	sd	a0, -176(s0)
   13ff0: 23 30 a4 ec  	sd	a0, -320(s0)
   13ff4: 23 3c a4 f4  	sd	a0, -168(s0)
   13ff8: 97 40 00 00  	auipc	ra, 4
   13ffc: e7 80 00 a5  	jalr	-1456(ra)
   14000: 83 35 84 dc  	ld	a1, -568(s0)
   14004: 03 35 04 dd  	ld	a0, -560(s0)
   14008: 03 36 04 df  	ld	a2, -528(s0)
   1400c: 83 36 84 df  	ld	a3, -520(s0)
   14010: 97 00 00 00  	auipc	ra, 0
   14014: e7 80 a0 14  	jalr	330(ra)
   14018: 83 35 84 d9  	ld	a1, -616(s0)
   1401c: 03 35 04 da  	ld	a0, -608(s0)
   14020: 23 38 b4 e0  	sd	a1, -496(s0)
   14024: 23 3c a4 e0  	sd	a0, -488(s0)
   14028: 4d bd        	j	0x13eda <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0xbc>

000000000001402a <.Lpcrel_hi4>:
   1402a: 17 45 00 00  	auipc	a0, 4
   1402e: 13 05 65 ff  	addi	a0, a0, -10
   14032: 0c 61        	ld	a1, 0(a0)
   14034: 08 65        	ld	a0, 8(a0)
   14036: 23 38 b4 e0  	sd	a1, -496(s0)
   1403a: 23 3c a4 e0  	sd	a0, -488(s0)
   1403e: 09 a0        	j	0x14040 <.Lpcrel_hi4+0x16>
   14040: 11 a2        	j	0x14144 <.Lpcrel_hi5+0x8e>
   14042: 01 45        	li	a0, 0
   14044: 23 34 a4 e4  	sd	a0, -440(s0)
   14048: 11 a8        	j	0x1405c <.Lpcrel_hi4+0x32>
   1404a: 03 35 84 db  	ld	a0, -584(s0)
   1404e: 23 3c a4 e8  	sd	a0, -360(s0)
   14052: 03 35 84 e9  	ld	a0, -360(s0)
   14056: 23 34 a4 e4  	sd	a0, -440(s0)
   1405a: 09 a0        	j	0x1405c <.Lpcrel_hi4+0x32>
   1405c: 03 35 84 e4  	ld	a0, -440(s0)
   14060: 11 e5        	bnez	a0, 0x1406c <.Lpcrel_hi4+0x42>
   14062: 09 a0        	j	0x14064 <.Lpcrel_hi4+0x3a>
   14064: 01 45        	li	a0, 0
   14066: 23 30 a4 e4  	sd	a0, -448(s0)
   1406a: 01 a8        	j	0x1407a <.Lpcrel_hi4+0x50>
   1406c: 03 35 84 e4  	ld	a0, -440(s0)
   14070: 23 34 a4 fa  	sd	a0, -88(s0)
   14074: 23 30 a4 e4  	sd	a0, -448(s0)
   14078: 09 a0        	j	0x1407a <.Lpcrel_hi4+0x50>
   1407a: 03 35 04 e4  	ld	a0, -448(s0)
   1407e: 09 c9        	beqz	a0, 0x14090 <.Lpcrel_hi4+0x66>
   14080: 09 a0        	j	0x14082 <.Lpcrel_hi4+0x58>
   14082: 03 35 04 e4  	ld	a0, -448(s0)
   14086: 23 38 a4 fa  	sd	a0, -80(s0)
   1408a: 23 3c a4 e2  	sd	a0, -456(s0)
   1408e: 29 a0        	j	0x14098 <.Lpcrel_hi4+0x6e>
   14090: 01 45        	li	a0, 0
   14092: 23 3c a4 e2  	sd	a0, -456(s0)
   14096: 09 a0        	j	0x14098 <.Lpcrel_hi4+0x6e>
   14098: 03 35 84 e3  	ld	a0, -456(s0)
   1409c: 09 cd        	beqz	a0, 0x140b6 <.Lpcrel_hi5>
   1409e: 09 a0        	j	0x140a0 <.Lpcrel_hi4+0x76>
   140a0: 03 35 84 dd  	ld	a0, -552(s0)
   140a4: 83 35 84 e3  	ld	a1, -456(s0)
   140a8: 23 38 b4 d8  	sd	a1, -624(s0)
   140ac: 23 3c b4 fa  	sd	a1, -72(s0)
   140b0: 05 89        	andi	a0, a0, 1
   140b2: 35 e5        	bnez	a0, 0x1411e <.Lpcrel_hi5+0x68>
   140b4: 21 a8        	j	0x140cc <.Lpcrel_hi5+0x16>

00000000000140b6 <.Lpcrel_hi5>:
   140b6: 17 45 00 00  	auipc	a0, 4
   140ba: 13 05 a5 f6  	addi	a0, a0, -150
   140be: 0c 61        	ld	a1, 0(a0)
   140c0: 08 65        	ld	a0, 8(a0)
   140c2: 23 38 b4 e0  	sd	a1, -496(s0)
   140c6: 23 3c a4 e0  	sd	a0, -488(s0)
   140ca: 9d bf        	j	0x14040 <.Lpcrel_hi4+0x16>
   140cc: 03 35 04 db  	ld	a0, -592(s0)
   140d0: 83 35 04 d9  	ld	a1, -624(s0)
   140d4: 23 38 b4 fc  	sd	a1, -48(s0)
   140d8: 23 3c b4 fc  	sd	a1, -40(s0)
   140dc: 23 38 b4 ea  	sd	a1, -336(s0)
   140e0: 23 3c a4 ea  	sd	a0, -328(s0)
   140e4: 83 35 04 eb  	ld	a1, -336(s0)
   140e8: 03 35 84 eb  	ld	a0, -328(s0)
   140ec: 23 30 b4 ea  	sd	a1, -352(s0)
   140f0: 23 34 a4 ea  	sd	a0, -344(s0)
   140f4: 83 35 04 ea  	ld	a1, -352(s0)
   140f8: 03 35 84 ea  	ld	a0, -344(s0)
   140fc: 23 30 b4 fe  	sd	a1, -32(s0)
   14100: 23 34 a4 fe  	sd	a0, -24(s0)
   14104: 23 38 b4 e4  	sd	a1, -432(s0)
   14108: 23 3c a4 e4  	sd	a0, -424(s0)
   1410c: 83 35 04 e5  	ld	a1, -432(s0)
   14110: 03 35 84 e5  	ld	a0, -424(s0)
   14114: 23 38 b4 e0  	sd	a1, -496(s0)
   14118: 23 3c a4 e0  	sd	a0, -488(s0)
   1411c: 7d bb        	j	0x13eda <_ZN5alloc5alloc6Global9grow_impl17h66a6b20b6fe08e5fE+0xbc>
   1411e: 83 35 04 db  	ld	a1, -592(s0)
   14122: 03 36 84 da  	ld	a2, -600(s0)
   14126: 03 35 84 db  	ld	a0, -584(s0)
   1412a: 32 95        	add	a0, a0, a2
   1412c: 23 30 a4 fc  	sd	a0, -64(s0)
   14130: 33 86 c5 40  	sub	a2, a1, a2
   14134: 23 34 c4 fc  	sd	a2, -56(s0)
   14138: 81 45        	li	a1, 0
   1413a: 97 40 00 00  	auipc	ra, 4
   1413e: e7 80 60 90  	jalr	-1786(ra)
   14142: 69 b7        	j	0x140cc <.Lpcrel_hi5+0x16>
   14144: 03 35 04 e1  	ld	a0, -496(s0)
   14148: 83 35 84 e1  	ld	a1, -488(s0)
   1414c: 83 30 81 26  	ld	ra, 616(sp)
   14150: 03 34 01 26  	ld	s0, 608(sp)
   14154: 13 01 01 27  	addi	sp, sp, 624
   14158: 82 80        	ret

000000000001415a <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h22ec868003c916ecE>:
   1415a: 19 71        	addi	sp, sp, -128
   1415c: 86 fc        	sd	ra, 120(sp)
   1415e: a2 f8        	sd	s0, 112(sp)
   14160: 00 01        	addi	s0, sp, 128
   14162: 23 34 b4 f8  	sd	a1, -120(s0)
   14166: 23 38 c4 f8  	sd	a2, -112(s0)
   1416a: 23 3c d4 f8  	sd	a3, -104(s0)
   1416e: 23 3c a4 fa  	sd	a0, -72(s0)
   14172: 23 30 b4 fc  	sd	a1, -64(s0)
   14176: 13 05 04 f9  	addi	a0, s0, -112
   1417a: 23 34 a4 fc  	sd	a0, -56(s0)
   1417e: 03 35 84 f9  	ld	a0, -104(s0)
   14182: 19 e1        	bnez	a0, 0x14188 <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h22ec868003c916ecE+0x2e>
   14184: 09 a0        	j	0x14186 <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h22ec868003c916ecE+0x2c>
   14186: 91 a0        	j	0x141ca <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h22ec868003c916ecE+0x70>
   14188: 03 35 84 f8  	ld	a0, -120(s0)
   1418c: 23 38 a4 fc  	sd	a0, -48(s0)
   14190: 03 36 04 f9  	ld	a2, -112(s0)
   14194: 83 35 84 f9  	ld	a1, -104(s0)
   14198: 23 30 c4 fa  	sd	a2, -96(s0)
   1419c: 23 34 b4 fa  	sd	a1, -88(s0)
   141a0: 13 06 04 fa  	addi	a2, s0, -96
   141a4: 23 3c c4 fc  	sd	a2, -40(s0)
   141a8: 83 35 84 fa  	ld	a1, -88(s0)
   141ac: 23 30 c4 fe  	sd	a2, -32(s0)
   141b0: 03 36 04 fa  	ld	a2, -96(s0)
   141b4: 23 34 c4 fe  	sd	a2, -24(s0)
   141b8: 23 38 c4 fa  	sd	a2, -80(s0)
   141bc: 03 36 04 fb  	ld	a2, -80(s0)
   141c0: 97 d0 ff ff  	auipc	ra, 1048573
   141c4: e7 80 00 52  	jalr	1312(ra)
   141c8: 09 a0        	j	0x141ca <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h22ec868003c916ecE+0x70>
   141ca: e6 70        	ld	ra, 120(sp)
   141cc: 46 74        	ld	s0, 112(sp)
   141ce: 09 61        	addi	sp, sp, 128
   141d0: 82 80        	ret

00000000000141d2 <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h11219bffd14efffcE>:
   141d2: 79 71        	addi	sp, sp, -48
   141d4: 06 f4        	sd	ra, 40(sp)
   141d6: 22 f0        	sd	s0, 32(sp)
   141d8: 00 18        	addi	s0, sp, 48
   141da: 23 3c a4 fc  	sd	a0, -40(s0)
   141de: 23 30 b4 fe  	sd	a1, -32(s0)
   141e2: 23 34 c4 fe  	sd	a2, -24(s0)
   141e6: 85 46        	li	a3, 1
   141e8: 97 00 00 00  	auipc	ra, 0
   141ec: e7 80 a0 9e  	jalr	-1558(ra)
   141f0: a2 70        	ld	ra, 40(sp)
   141f2: 02 74        	ld	s0, 32(sp)
   141f4: 45 61        	addi	sp, sp, 48
   141f6: 82 80        	ret

00000000000141f8 <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$4grow17hf78f090424e9eb9fE>:
   141f8: 39 71        	addi	sp, sp, -64
   141fa: 06 fc        	sd	ra, 56(sp)
   141fc: 22 f8        	sd	s0, 48(sp)
   141fe: 80 00        	addi	s0, sp, 64
   14200: 23 30 a4 fc  	sd	a0, -64(s0)
   14204: 23 34 b4 fc  	sd	a1, -56(s0)
   14208: 23 38 c4 fc  	sd	a2, -48(s0)
   1420c: 23 3c d4 fc  	sd	a3, -40(s0)
   14210: 23 30 e4 fe  	sd	a4, -32(s0)
   14214: 23 34 f4 fe  	sd	a5, -24(s0)
   14218: 01 48        	li	a6, 0
   1421a: 97 00 00 00  	auipc	ra, 0
   1421e: e7 80 40 c0  	jalr	-1020(ra)
   14222: e2 70        	ld	ra, 56(sp)
   14224: 42 74        	ld	s0, 48(sp)
   14226: 21 61        	addi	sp, sp, 64
   14228: 82 80        	ret

000000000001422a <_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h0e7c8eadf57cc6c2E>:
   1422a: 79 71        	addi	sp, sp, -48
   1422c: 06 f4        	sd	ra, 40(sp)
   1422e: 22 f0        	sd	s0, 32(sp)
   14230: 00 18        	addi	s0, sp, 48
   14232: 23 3c a4 fc  	sd	a0, -40(s0)
   14236: 23 30 b4 fe  	sd	a1, -32(s0)
   1423a: 23 34 c4 fe  	sd	a2, -24(s0)
   1423e: 81 46        	li	a3, 0
   14240: 97 00 00 00  	auipc	ra, 0
   14244: e7 80 20 99  	jalr	-1646(ra)
   14248: a2 70        	ld	ra, 40(sp)
   1424a: 02 74        	ld	s0, 32(sp)
   1424c: 45 61        	addi	sp, sp, 48
   1424e: 82 80        	ret

0000000000014250 <rust_begin_unwind>:
   14250: 61 71        	addi	sp, sp, -432
   14252: 06 f7        	sd	ra, 424(sp)
   14254: 22 f3        	sd	s0, 416(sp)
   14256: 00 1b        	addi	s0, sp, 432
   14258: 23 30 a4 e8  	sd	a0, -384(s0)
   1425c: 23 38 a4 f4  	sd	a0, -176(s0)
   14260: 97 00 00 00  	auipc	ra, 0
   14264: e7 80 c0 19  	jalr	412(ra)
   14268: 23 30 a4 fe  	sd	a0, -32(s0)
   1426c: 03 35 04 fe  	ld	a0, -32(s0)
   14270: 11 e9        	bnez	a0, 0x14284 <.Lpcrel_hi0+0x10>
   14272: 09 a0        	j	0x14274 <.Lpcrel_hi0>

0000000000014274 <.Lpcrel_hi0>:
   14274: 17 55 00 00  	auipc	a0, 5
   14278: 13 05 c5 f4  	addi	a0, a0, -180
   1427c: 97 20 00 00  	auipc	ra, 2
   14280: e7 80 20 35  	jalr	850(ra)
   14284: 03 35 04 e8  	ld	a0, -384(s0)
   14288: 83 35 04 fe  	ld	a1, -32(s0)
   1428c: 23 34 b4 fe  	sd	a1, -24(s0)
   14290: 23 34 b4 e8  	sd	a1, -376(s0)
   14294: 97 00 00 00  	auipc	ra, 0
   14298: e7 80 e0 17  	jalr	382(ra)
   1429c: 23 38 a4 e8  	sd	a0, -368(s0)
   142a0: 03 35 04 e9  	ld	a0, -368(s0)
   142a4: 75 c9        	beqz	a0, 0x14398 <.Lpcrel_hi4+0x2e>
   142a6: 09 a0        	j	0x142a8 <.Lpcrel_hi0+0x34>
   142a8: 03 35 04 e9  	ld	a0, -368(s0)
   142ac: 23 30 a4 e6  	sd	a0, -416(s0)
   142b0: 23 3c a4 f4  	sd	a0, -168(s0)
   142b4: 97 00 00 00  	auipc	ra, 0
   142b8: e7 80 c0 17  	jalr	380(ra)
   142bc: 2a 86        	mv	a2, a0
   142be: 03 35 04 e6  	ld	a0, -416(s0)
   142c2: 23 3c c4 ee  	sd	a2, -264(s0)
   142c6: 23 30 b4 f0  	sd	a1, -256(s0)
   142ca: 13 06 84 ef  	addi	a2, s0, -264
   142ce: 23 38 c4 fa  	sd	a2, -80(s0)

00000000000142d2 <.Lpcrel_hi1>:
   142d2: 97 05 00 00  	auipc	a1, 0
   142d6: 93 85 85 48  	addi	a1, a1, 1160
   142da: 23 3c b4 fa  	sd	a1, -72(s0)
   142de: 23 30 c4 fa  	sd	a2, -96(s0)
   142e2: 23 34 b4 fa  	sd	a1, -88(s0)
   142e6: 83 35 04 fa  	ld	a1, -96(s0)
   142ea: 23 34 b4 e6  	sd	a1, -408(s0)
   142ee: 83 35 84 fa  	ld	a1, -88(s0)
   142f2: 23 38 b4 e6  	sd	a1, -400(s0)
   142f6: 97 00 00 00  	auipc	ra, 0
   142fa: e7 80 40 15  	jalr	340(ra)
   142fe: 83 37 84 e6  	ld	a5, -408(s0)
   14302: 03 37 04 e7  	ld	a4, -400(s0)
   14306: 23 26 a4 f0  	sw	a0, -244(s0)
   1430a: 93 05 c4 f0  	addi	a1, s0, -244
   1430e: 23 38 b4 fc  	sd	a1, -48(s0)

0000000000014312 <.Lpcrel_hi2>:
   14312: 17 35 00 00  	auipc	a0, 3
   14316: 13 05 25 5e  	addi	a0, a0, 1506
   1431a: 23 3c a4 fc  	sd	a0, -40(s0)
   1431e: 23 30 b4 fc  	sd	a1, -64(s0)
   14322: 23 34 a4 fc  	sd	a0, -56(s0)
   14326: 83 36 04 fc  	ld	a3, -64(s0)
   1432a: 03 36 84 fc  	ld	a2, -56(s0)
   1432e: 93 05 84 e8  	addi	a1, s0, -376
   14332: 23 38 b4 f8  	sd	a1, -112(s0)

0000000000014336 <.Lpcrel_hi3>:
   14336: 17 05 00 00  	auipc	a0, 0
   1433a: 13 05 c5 44  	addi	a0, a0, 1100
   1433e: 23 3c a4 f8  	sd	a0, -104(s0)
   14342: 23 30 b4 f8  	sd	a1, -128(s0)
   14346: 23 34 a4 f8  	sd	a0, -120(s0)
   1434a: 83 35 04 f8  	ld	a1, -128(s0)
   1434e: 03 35 84 f8  	ld	a0, -120(s0)
   14352: 23 34 f4 ec  	sd	a5, -312(s0)
   14356: 23 38 e4 ec  	sd	a4, -304(s0)
   1435a: 23 3c d4 ec  	sd	a3, -296(s0)
   1435e: 23 30 c4 ee  	sd	a2, -288(s0)
   14362: 23 34 b4 ee  	sd	a1, -280(s0)
   14366: 23 38 a4 ee  	sd	a0, -272(s0)

000000000001436a <.Lpcrel_hi4>:
   1436a: 17 55 00 00  	auipc	a0, 5
   1436e: 93 05 e5 e7  	addi	a1, a0, -386
   14372: 13 05 84 e9  	addi	a0, s0, -360
   14376: 23 3c a4 e6  	sd	a0, -392(s0)
   1437a: 11 46        	li	a2, 4
   1437c: 93 06 84 ec  	addi	a3, s0, -312
   14380: 0d 47        	li	a4, 3
   14382: 97 d0 ff ff  	auipc	ra, 1048573
   14386: e7 80 00 e5  	jalr	-432(ra)
   1438a: 03 35 84 e7  	ld	a0, -392(s0)
   1438e: 97 d0 ff ff  	auipc	ra, 1048573
   14392: e7 80 60 d2  	jalr	-730(ra)
   14396: b1 a8        	j	0x143f2 <.Lpcrel_hi6+0x2e>
   14398: 93 05 84 e8  	addi	a1, s0, -376
   1439c: 23 38 b4 f6  	sd	a1, -144(s0)

00000000000143a0 <.Lpcrel_hi5>:
   143a0: 17 05 00 00  	auipc	a0, 0
   143a4: 13 05 25 3e  	addi	a0, a0, 994
   143a8: 23 3c a4 f6  	sd	a0, -136(s0)
   143ac: 23 30 b4 f6  	sd	a1, -160(s0)
   143b0: 23 34 a4 f6  	sd	a0, -152(s0)
   143b4: 83 35 04 f6  	ld	a1, -160(s0)
   143b8: 03 35 84 f6  	ld	a0, -152(s0)
   143bc: 23 30 b4 f4  	sd	a1, -192(s0)
   143c0: 23 34 a4 f4  	sd	a0, -184(s0)

00000000000143c4 <.Lpcrel_hi6>:
   143c4: 17 55 00 00  	auipc	a0, 5
   143c8: 93 05 45 e7  	addi	a1, a0, -396
   143cc: 13 05 04 f1  	addi	a0, s0, -240
   143d0: 23 3c a4 e4  	sd	a0, -424(s0)
   143d4: 09 46        	li	a2, 2
   143d6: 93 06 04 f4  	addi	a3, s0, -192
   143da: 05 47        	li	a4, 1
   143dc: 97 d0 ff ff  	auipc	ra, 1048573
   143e0: e7 80 60 df  	jalr	-522(ra)
   143e4: 03 35 84 e5  	ld	a0, -424(s0)
   143e8: 97 d0 ff ff  	auipc	ra, 1048573
   143ec: e7 80 c0 cc  	jalr	-820(ra)
   143f0: 09 a0        	j	0x143f2 <.Lpcrel_hi6+0x2e>
   143f2: 7d 55        	li	a0, -1
   143f4: 97 d0 ff ff  	auipc	ra, 1048573
   143f8: e7 80 40 24  	jalr	580(ra)

00000000000143fc <_ZN4core5panic10panic_info9PanicInfo7message17hd55cf53646a5934eE>:
   143fc: 01 11        	addi	sp, sp, -32
   143fe: 06 ec        	sd	ra, 24(sp)
   14400: 22 e8        	sd	s0, 16(sp)
   14402: 00 10        	addi	s0, sp, 32
   14404: 23 34 a4 fe  	sd	a0, -24(s0)
   14408: 08 69        	ld	a0, 16(a0)
   1440a: e2 60        	ld	ra, 24(sp)
   1440c: 42 64        	ld	s0, 16(sp)
   1440e: 05 61        	addi	sp, sp, 32
   14410: 82 80        	ret

0000000000014412 <_ZN4core5panic10panic_info9PanicInfo8location17h440ad169a51e1e28E>:
   14412: 01 11        	addi	sp, sp, -32
   14414: 06 ec        	sd	ra, 24(sp)
   14416: 22 e8        	sd	s0, 16(sp)
   14418: 00 10        	addi	s0, sp, 32
   1441a: 23 34 a4 fe  	sd	a0, -24(s0)
   1441e: 08 6d        	ld	a0, 24(a0)
   14420: 23 30 a4 fe  	sd	a0, -32(s0)
   14424: 03 35 04 fe  	ld	a0, -32(s0)
   14428: e2 60        	ld	ra, 24(sp)
   1442a: 42 64        	ld	s0, 16(sp)
   1442c: 05 61        	addi	sp, sp, 32
   1442e: 82 80        	ret

0000000000014430 <_ZN4core5panic8location8Location4file17h40f9684f75cc0d3fE>:
   14430: 01 11        	addi	sp, sp, -32
   14432: 06 ec        	sd	ra, 24(sp)
   14434: 22 e8        	sd	s0, 16(sp)
   14436: 00 10        	addi	s0, sp, 32
   14438: aa 85        	mv	a1, a0
   1443a: 23 34 b4 fe  	sd	a1, -24(s0)
   1443e: 88 61        	ld	a0, 0(a1)
   14440: 8c 65        	ld	a1, 8(a1)
   14442: e2 60        	ld	ra, 24(sp)
   14444: 42 64        	ld	s0, 16(sp)
   14446: 05 61        	addi	sp, sp, 32
   14448: 82 80        	ret

000000000001444a <_ZN4core5panic8location8Location4line17h6810bc076b20be62E>:
   1444a: 01 11        	addi	sp, sp, -32
   1444c: 06 ec        	sd	ra, 24(sp)
   1444e: 22 e8        	sd	s0, 16(sp)
   14450: 00 10        	addi	s0, sp, 32
   14452: 23 34 a4 fe  	sd	a0, -24(s0)
   14456: 08 49        	lw	a0, 16(a0)
   14458: e2 60        	ld	ra, 24(sp)
   1445a: 42 64        	ld	s0, 16(sp)
   1445c: 05 61        	addi	sp, sp, 32
   1445e: 82 80        	ret

0000000000014460 <_ZN8user_lib7syscall7syscall17h965c7456d3d034cfE>:
   14460: 01 11        	addi	sp, sp, -32
   14462: 06 ec        	sd	ra, 24(sp)
   14464: 22 e8        	sd	s0, 16(sp)
   14466: 00 10        	addi	s0, sp, 32
   14468: ae 87        	mv	a5, a1
   1446a: aa 88        	mv	a7, a0
   1446c: 23 34 14 ff  	sd	a7, -24(s0)
   14470: 88 63        	ld	a0, 0(a5)
   14472: 8c 67        	ld	a1, 8(a5)
   14474: 90 6b        	ld	a2, 16(a5)
   14476: 94 6f        	ld	a3, 24(a5)
   14478: 98 73        	ld	a4, 32(a5)
   1447a: 9c 77        	ld	a5, 40(a5)
   1447c: 73 00 00 00  	ecall
   14480: 23 30 a4 fe  	sd	a0, -32(s0)
   14484: 03 35 04 fe  	ld	a0, -32(s0)
   14488: e2 60        	ld	ra, 24(sp)
   1448a: 42 64        	ld	s0, 16(sp)
   1448c: 05 61        	addi	sp, sp, 32
   1448e: 82 80        	ret

0000000000014490 <_ZN8user_lib7syscall9sys_write17h1250e63005361edfE>:
   14490: 59 71        	addi	sp, sp, -112
   14492: 86 f4        	sd	ra, 104(sp)
   14494: a2 f0        	sd	s0, 96(sp)
   14496: 80 18        	addi	s0, sp, 112
   14498: 23 26 a4 fc  	sw	a0, -52(s0)
   1449c: 23 38 b4 fc  	sd	a1, -48(s0)
   144a0: 23 3c c4 fc  	sd	a2, -40(s0)
   144a4: 01 25        	sext.w	a0, a0
   144a6: 23 30 b4 fe  	sd	a1, -32(s0)
   144aa: 23 34 c4 fe  	sd	a2, -24(s0)
   144ae: 23 3c a4 f8  	sd	a0, -104(s0)
   144b2: 23 30 b4 fa  	sd	a1, -96(s0)
   144b6: 23 34 c4 fa  	sd	a2, -88(s0)
   144ba: 01 45        	li	a0, 0
   144bc: 23 38 a4 fa  	sd	a0, -80(s0)
   144c0: 23 3c a4 fa  	sd	a0, -72(s0)
   144c4: 23 30 a4 fc  	sd	a0, -64(s0)
   144c8: 13 05 00 04  	li	a0, 64
   144cc: 93 05 84 f9  	addi	a1, s0, -104
   144d0: 97 00 00 00  	auipc	ra, 0
   144d4: e7 80 00 f9  	jalr	-112(ra)
   144d8: a6 70        	ld	ra, 104(sp)
   144da: 06 74        	ld	s0, 96(sp)
   144dc: 65 61        	addi	sp, sp, 112
   144de: 82 80        	ret

00000000000144e0 <_ZN8user_lib7syscall9sys_clone17h32a1a2e285393ef7E>:
   144e0: 75 71        	addi	sp, sp, -144
   144e2: 06 e5        	sd	ra, 136(sp)
   144e4: 22 e1        	sd	s0, 128(sp)
   144e6: 00 09        	addi	s0, sp, 144
   144e8: 23 38 e4 f8  	sd	a4, -112(s0)
   144ec: 23 34 d4 f8  	sd	a3, -120(s0)
   144f0: 23 30 c4 f8  	sd	a2, -128(s0)
   144f4: 23 3c b4 f6  	sd	a1, -136(s0)
   144f8: 23 2e a4 f8  	sw	a0, -100(s0)
   144fc: 23 38 b4 fc  	sd	a1, -48(s0)
   14500: 23 3c c4 fc  	sd	a2, -40(s0)
   14504: 23 30 d4 fe  	sd	a3, -32(s0)
   14508: 23 34 e4 fe  	sd	a4, -24(s0)
   1450c: 13 05 c4 f9  	addi	a0, s0, -100
   14510: 97 f0 ff ff  	auipc	ra, 1048575
   14514: e7 80 e0 bd  	jalr	-1058(ra)
   14518: 83 35 84 f7  	ld	a1, -136(s0)
   1451c: 03 36 04 f8  	ld	a2, -128(s0)
   14520: 83 36 84 f8  	ld	a3, -120(s0)
   14524: 03 37 04 f9  	ld	a4, -112(s0)
   14528: 02 15        	slli	a0, a0, 32
   1452a: 01 91        	srli	a0, a0, 32
   1452c: 23 30 a4 fa  	sd	a0, -96(s0)
   14530: 23 34 b4 fa  	sd	a1, -88(s0)
   14534: 23 38 c4 fa  	sd	a2, -80(s0)
   14538: 23 3c d4 fa  	sd	a3, -72(s0)
   1453c: 23 30 e4 fc  	sd	a4, -64(s0)
   14540: 01 45        	li	a0, 0
   14542: 23 34 a4 fc  	sd	a0, -56(s0)
   14546: 13 05 c0 0d  	li	a0, 220
   1454a: 93 05 04 fa  	addi	a1, s0, -96
   1454e: 97 00 00 00  	auipc	ra, 0
   14552: e7 80 20 f1  	jalr	-238(ra)
   14556: aa 60        	ld	ra, 136(sp)
   14558: 0a 64        	ld	s0, 128(sp)
   1455a: 49 61        	addi	sp, sp, 144
   1455c: 82 80        	ret

000000000001455e <_ZN8user_lib7syscall10sys_execve17h079cd2b9ec9204d8E>:
   1455e: 35 71        	addi	sp, sp, -160
   14560: 06 ed        	sd	ra, 152(sp)
   14562: 22 e9        	sd	s0, 144(sp)
   14564: 00 11        	addi	s0, sp, 160
   14566: 23 38 a4 f8  	sd	a0, -112(s0)
   1456a: 23 3c b4 f8  	sd	a1, -104(s0)
   1456e: 23 30 c4 fa  	sd	a2, -96(s0)
   14572: 23 34 d4 fa  	sd	a3, -88(s0)
   14576: 23 38 e4 fa  	sd	a4, -80(s0)
   1457a: 23 3c f4 fa  	sd	a5, -72(s0)
   1457e: 23 30 a4 fc  	sd	a0, -64(s0)
   14582: 23 34 b4 fc  	sd	a1, -56(s0)
   14586: 23 30 c4 fe  	sd	a2, -32(s0)
   1458a: 23 34 d4 fe  	sd	a3, -24(s0)
   1458e: 23 38 e4 fc  	sd	a4, -48(s0)
   14592: 23 3c f4 fc  	sd	a5, -40(s0)
   14596: 23 30 a4 f6  	sd	a0, -160(s0)
   1459a: 23 34 c4 f6  	sd	a2, -152(s0)
   1459e: 23 38 e4 f6  	sd	a4, -144(s0)
   145a2: 01 45        	li	a0, 0
   145a4: 23 3c a4 f6  	sd	a0, -136(s0)
   145a8: 23 30 a4 f8  	sd	a0, -128(s0)
   145ac: 23 34 a4 f8  	sd	a0, -120(s0)
   145b0: 13 05 d0 0d  	li	a0, 221
   145b4: 93 05 04 f6  	addi	a1, s0, -160
   145b8: 97 00 00 00  	auipc	ra, 0
   145bc: e7 80 80 ea  	jalr	-344(ra)
   145c0: ea 60        	ld	ra, 152(sp)
   145c2: 4a 64        	ld	s0, 144(sp)
   145c4: 0d 61        	addi	sp, sp, 160
   145c6: 82 80        	ret

00000000000145c8 <_ZN8user_lib7syscall9sys_wait417hede12564ea3332e9E>:
   145c8: 59 71        	addi	sp, sp, -112
   145ca: 86 f4        	sd	ra, 104(sp)
   145cc: a2 f0        	sd	s0, 96(sp)
   145ce: 80 18        	addi	s0, sp, 112
   145d0: 23 30 b4 fa  	sd	a1, -96(s0)
   145d4: 23 3c a4 f8  	sd	a0, -104(s0)
   145d8: 23 26 c4 fa  	sw	a2, -84(s0)
   145dc: 23 30 a4 fe  	sd	a0, -32(s0)
   145e0: 23 34 b4 fe  	sd	a1, -24(s0)
   145e4: 13 05 c4 fa  	addi	a0, s0, -84
   145e8: 97 f0 ff ff  	auipc	ra, 1048575
   145ec: e7 80 00 af  	jalr	-1296(ra)
   145f0: 03 36 84 f9  	ld	a2, -104(s0)
   145f4: 83 35 04 fa  	ld	a1, -96(s0)
   145f8: 01 25        	sext.w	a0, a0
   145fa: 23 38 c4 fa  	sd	a2, -80(s0)
   145fe: 23 3c b4 fa  	sd	a1, -72(s0)
   14602: 23 30 a4 fc  	sd	a0, -64(s0)
   14606: 01 45        	li	a0, 0
   14608: 23 34 a4 fc  	sd	a0, -56(s0)
   1460c: 23 38 a4 fc  	sd	a0, -48(s0)
   14610: 23 3c a4 fc  	sd	a0, -40(s0)
   14614: 13 05 40 10  	li	a0, 260
   14618: 93 05 04 fb  	addi	a1, s0, -80
   1461c: 97 00 00 00  	auipc	ra, 0
   14620: e7 80 40 e4  	jalr	-444(ra)
   14624: a6 70        	ld	ra, 104(sp)
   14626: 06 74        	ld	s0, 96(sp)
   14628: 65 61        	addi	sp, sp, 112
   1462a: 82 80        	ret

000000000001462c <_ZN8user_lib7syscall8sys_exit17h9300b340330ee736E>:
   1462c: 75 71        	addi	sp, sp, -144
   1462e: 06 e5        	sd	ra, 136(sp)
   14630: 22 e1        	sd	s0, 128(sp)
   14632: 00 09        	addi	s0, sp, 144
   14634: 23 26 a4 fe  	sw	a0, -20(s0)
   14638: 01 25        	sext.w	a0, a0
   1463a: 23 34 a4 f8  	sd	a0, -120(s0)
   1463e: 01 45        	li	a0, 0
   14640: 23 3c a4 f6  	sd	a0, -136(s0)
   14644: 23 38 a4 f8  	sd	a0, -112(s0)
   14648: 23 3c a4 f8  	sd	a0, -104(s0)
   1464c: 23 30 a4 fa  	sd	a0, -96(s0)
   14650: 23 34 a4 fa  	sd	a0, -88(s0)
   14654: 23 38 a4 fa  	sd	a0, -80(s0)
   14658: 13 05 d0 05  	li	a0, 93
   1465c: 93 05 84 f8  	addi	a1, s0, -120
   14660: 97 00 00 00  	auipc	ra, 0
   14664: e7 80 00 e0  	jalr	-512(ra)
   14668: 03 37 84 f7  	ld	a4, -136(s0)

000000000001466c <.Lpcrel_hi0>:
   1466c: 17 55 00 00  	auipc	a0, 5
   14670: 93 05 45 c3  	addi	a1, a0, -972
   14674: 13 05 84 fb  	addi	a0, s0, -72
   14678: 23 30 a4 f8  	sd	a0, -128(s0)
   1467c: 05 46        	li	a2, 1
   1467e: 93 06 84 fe  	addi	a3, s0, -24
   14682: 97 d0 ff ff  	auipc	ra, 1048573
   14686: e7 80 00 b5  	jalr	-1200(ra)
   1468a: 03 35 04 f8  	ld	a0, -128(s0)

000000000001468e <.Lpcrel_hi1>:
   1468e: 97 55 00 00  	auipc	a1, 5
   14692: 93 85 25 c3  	addi	a1, a1, -974
   14696: 97 20 00 00  	auipc	ra, 2
   1469a: e7 80 a0 f8  	jalr	-118(ra)

000000000001469e <_ZN8user_lib7syscall15sys_sched_yield17h29fa181de485fd0bE>:
   1469e: 39 71        	addi	sp, sp, -64
   146a0: 06 fc        	sd	ra, 56(sp)
   146a2: 22 f8        	sd	s0, 48(sp)
   146a4: 80 00        	addi	s0, sp, 64
   146a6: 01 45        	li	a0, 0
   146a8: 23 30 a4 fc  	sd	a0, -64(s0)
   146ac: 23 34 a4 fc  	sd	a0, -56(s0)
   146b0: 23 38 a4 fc  	sd	a0, -48(s0)
   146b4: 23 3c a4 fc  	sd	a0, -40(s0)
   146b8: 23 30 a4 fe  	sd	a0, -32(s0)
   146bc: 23 34 a4 fe  	sd	a0, -24(s0)
   146c0: 13 05 c0 07  	li	a0, 124
   146c4: 93 05 04 fc  	addi	a1, s0, -64
   146c8: 97 00 00 00  	auipc	ra, 0
   146cc: e7 80 80 d9  	jalr	-616(ra)
   146d0: e2 70        	ld	ra, 56(sp)
   146d2: 42 74        	ld	s0, 48(sp)
   146d4: 21 61        	addi	sp, sp, 64
   146d6: 82 80        	ret

00000000000146d8 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E>:
   146d8: 39 71        	addi	sp, sp, -64
   146da: 06 fc        	sd	ra, 56(sp)
   146dc: 22 f8        	sd	s0, 48(sp)
   146de: 80 00        	addi	s0, sp, 64
   146e0: 23 34 b4 fc  	sd	a1, -56(s0)
   146e4: 23 38 a4 fc  	sd	a0, -48(s0)
   146e8: 23 30 a4 fe  	sd	a0, -32(s0)
   146ec: 23 34 b4 fe  	sd	a1, -24(s0)
   146f0: 03 c5 45 03  	lbu	a0, 52(a1)
   146f4: 41 89        	andi	a0, a0, 16
   146f6: 11 e9        	bnez	a0, 0x1470a <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x32>
   146f8: 09 a0        	j	0x146fa <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x22>
   146fa: 03 35 84 fc  	ld	a0, -56(s0)
   146fe: 03 45 45 03  	lbu	a0, 52(a0)
   14702: 13 75 05 02  	andi	a0, a0, 32
   14706: 09 cd        	beqz	a0, 0x14720 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x48>
   14708: 3d a0        	j	0x14736 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x5e>
   1470a: 83 35 84 fc  	ld	a1, -56(s0)
   1470e: 03 35 04 fd  	ld	a0, -48(s0)
   14712: 97 30 00 00  	auipc	ra, 3
   14716: e7 80 c0 d8  	jalr	-628(ra)
   1471a: a3 0f a4 fc  	sb	a0, -33(s0)
   1471e: 05 a8        	j	0x1474e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x76>
   14720: 83 35 84 fc  	ld	a1, -56(s0)
   14724: 03 35 04 fd  	ld	a0, -48(s0)
   14728: 97 30 00 00  	auipc	ra, 3
   1472c: e7 80 c0 1d  	jalr	476(ra)
   14730: a3 0f a4 fc  	sb	a0, -33(s0)
   14734: 21 a8        	j	0x1474c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x74>
   14736: 83 35 84 fc  	ld	a1, -56(s0)
   1473a: 03 35 04 fd  	ld	a0, -48(s0)
   1473e: 97 30 00 00  	auipc	ra, 3
   14742: e7 80 00 dd  	jalr	-560(ra)
   14746: a3 0f a4 fc  	sb	a0, -33(s0)
   1474a: 09 a0        	j	0x1474c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x74>
   1474c: 09 a0        	j	0x1474e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hf76fa5394277d064E+0x76>
   1474e: 03 45 f4 fd  	lbu	a0, -33(s0)
   14752: e2 70        	ld	ra, 56(sp)
   14754: 42 74        	ld	s0, 48(sp)
   14756: 21 61        	addi	sp, sp, 64
   14758: 82 80        	ret

000000000001475a <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h58ca9b342953b1c8E>:
   1475a: 01 11        	addi	sp, sp, -32
   1475c: 06 ec        	sd	ra, 24(sp)
   1475e: 22 e8        	sd	s0, 16(sp)
   14760: 00 10        	addi	s0, sp, 32
   14762: 2e 86        	mv	a2, a1
   14764: aa 85        	mv	a1, a0
   14766: 23 30 b4 fe  	sd	a1, -32(s0)
   1476a: 23 34 c4 fe  	sd	a2, -24(s0)
   1476e: 88 61        	ld	a0, 0(a1)
   14770: 8c 65        	ld	a1, 8(a1)
   14772: 97 30 00 00  	auipc	ra, 3
   14776: e7 80 80 a4  	jalr	-1464(ra)
   1477a: e2 60        	ld	ra, 24(sp)
   1477c: 42 64        	ld	s0, 16(sp)
   1477e: 05 61        	addi	sp, sp, 32
   14780: 82 80        	ret

0000000000014782 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hb7498b3f694302d0E>:
   14782: 01 11        	addi	sp, sp, -32
   14784: 06 ec        	sd	ra, 24(sp)
   14786: 22 e8        	sd	s0, 16(sp)
   14788: 00 10        	addi	s0, sp, 32
   1478a: 23 30 a4 fe  	sd	a0, -32(s0)
   1478e: 23 34 b4 fe  	sd	a1, -24(s0)
   14792: 08 61        	ld	a0, 0(a0)
   14794: 97 20 00 00  	auipc	ra, 2
   14798: e7 80 60 33  	jalr	822(ra)
   1479c: e2 60        	ld	ra, 24(sp)
   1479e: 42 64        	ld	s0, 16(sp)
   147a0: 05 61        	addi	sp, sp, 32
   147a2: 82 80        	ret

00000000000147a4 <_ZN8user_lib6execve28_$u7b$$u7b$closure$u7d$$u7d$17hdc024cf296fbfdafE>:
   147a4: 79 71        	addi	sp, sp, -48
   147a6: 06 f4        	sd	ra, 40(sp)
   147a8: 22 f0        	sd	s0, 32(sp)
   147aa: 00 18        	addi	s0, sp, 48
   147ac: 23 38 a4 fc  	sd	a0, -48(s0)
   147b0: 23 3c b4 fc  	sd	a1, -40(s0)
   147b4: 88 61        	ld	a0, 0(a1)
   147b6: 8c 65        	ld	a1, 8(a1)
   147b8: 23 30 a4 fe  	sd	a0, -32(s0)
   147bc: 23 34 b4 fe  	sd	a1, -24(s0)
   147c0: a2 70        	ld	ra, 40(sp)
   147c2: 02 74        	ld	s0, 32(sp)
   147c4: 45 61        	addi	sp, sp, 48
   147c6: 82 80        	ret

00000000000147c8 <_ZN8user_lib6execve28_$u7b$$u7b$closure$u7d$$u7d$17h7a1946b541c6f511E>:
   147c8: 79 71        	addi	sp, sp, -48
   147ca: 06 f4        	sd	ra, 40(sp)
   147cc: 22 f0        	sd	s0, 32(sp)
   147ce: 00 18        	addi	s0, sp, 48
   147d0: 23 38 a4 fc  	sd	a0, -48(s0)
   147d4: 23 3c b4 fc  	sd	a1, -40(s0)
   147d8: 88 61        	ld	a0, 0(a1)
   147da: 8c 65        	ld	a1, 8(a1)
   147dc: 23 30 a4 fe  	sd	a0, -32(s0)
   147e0: 23 34 b4 fe  	sd	a1, -24(s0)
   147e4: a2 70        	ld	ra, 40(sp)
   147e6: 02 74        	ld	s0, 32(sp)
   147e8: 45 61        	addi	sp, sp, 48
   147ea: 82 80        	ret

00000000000147ec <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h1106d5151ac4c02fE>:
   147ec: 01 11        	addi	sp, sp, -32
   147ee: 06 ec        	sd	ra, 24(sp)
   147f0: 22 e8        	sd	s0, 16(sp)
   147f2: 00 10        	addi	s0, sp, 32
   147f4: 23 30 a4 fe  	sd	a0, -32(s0)
   147f8: 23 34 b4 fe  	sd	a1, -24(s0)
   147fc: 2e 95        	add	a0, a0, a1
   147fe: e2 60        	ld	ra, 24(sp)
   14800: 42 64        	ld	s0, 16(sp)
   14802: 05 61        	addi	sp, sp, 32
   14804: 82 80        	ret

0000000000014806 <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$18backward_unchecked17h83c35a9bd8f53e25E>:
   14806: 01 11        	addi	sp, sp, -32
   14808: 06 ec        	sd	ra, 24(sp)
   1480a: 22 e8        	sd	s0, 16(sp)
   1480c: 00 10        	addi	s0, sp, 32
   1480e: 23 30 a4 fe  	sd	a0, -32(s0)
   14812: 23 34 b4 fe  	sd	a1, -24(s0)
   14816: 0d 8d        	sub	a0, a0, a1
   14818: e2 60        	ld	ra, 24(sp)
   1481a: 42 64        	ld	s0, 16(sp)
   1481c: 05 61        	addi	sp, sp, 32
   1481e: 82 80        	ret

0000000000014820 <_ZN4core3cmp3Ord3max17ha100d9cfed92533bE>:
   14820: 01 11        	addi	sp, sp, -32
   14822: 06 ec        	sd	ra, 24(sp)
   14824: 22 e8        	sd	s0, 16(sp)
   14826: 00 10        	addi	s0, sp, 32
   14828: 23 30 a4 fe  	sd	a0, -32(s0)
   1482c: 23 34 b4 fe  	sd	a1, -24(s0)
   14830: 97 00 00 00  	auipc	ra, 0
   14834: e7 80 80 0c  	jalr	200(ra)
   14838: e2 60        	ld	ra, 24(sp)
   1483a: 42 64        	ld	s0, 16(sp)
   1483c: 05 61        	addi	sp, sp, 32
   1483e: 82 80        	ret

0000000000014840 <_ZN4core3cmp3Ord3min17h447781b2e01e61d1E>:
   14840: 01 11        	addi	sp, sp, -32
   14842: 06 ec        	sd	ra, 24(sp)
   14844: 22 e8        	sd	s0, 16(sp)
   14846: 00 10        	addi	s0, sp, 32
   14848: 23 30 a4 fe  	sd	a0, -32(s0)
   1484c: 23 34 b4 fe  	sd	a1, -24(s0)
   14850: 97 00 00 00  	auipc	ra, 0
   14854: e7 80 00 14  	jalr	320(ra)
   14858: e2 60        	ld	ra, 24(sp)
   1485a: 42 64        	ld	s0, 16(sp)
   1485c: 05 61        	addi	sp, sp, 32
   1485e: 82 80        	ret

0000000000014860 <_ZN4core3cmp3max17h02ade42058afaea9E>:
   14860: 01 11        	addi	sp, sp, -32
   14862: 06 ec        	sd	ra, 24(sp)
   14864: 22 e8        	sd	s0, 16(sp)
   14866: 00 10        	addi	s0, sp, 32
   14868: 23 30 a4 fe  	sd	a0, -32(s0)
   1486c: 23 34 b4 fe  	sd	a1, -24(s0)
   14870: 97 00 00 00  	auipc	ra, 0
   14874: e7 80 00 fb  	jalr	-80(ra)
   14878: e2 60        	ld	ra, 24(sp)
   1487a: 42 64        	ld	s0, 16(sp)
   1487c: 05 61        	addi	sp, sp, 32
   1487e: 82 80        	ret

0000000000014880 <_ZN4core3cmp3min17h53ceec677bf9f3cfE>:
   14880: 01 11        	addi	sp, sp, -32
   14882: 06 ec        	sd	ra, 24(sp)
   14884: 22 e8        	sd	s0, 16(sp)
   14886: 00 10        	addi	s0, sp, 32
   14888: 23 30 a4 fe  	sd	a0, -32(s0)
   1488c: 23 34 b4 fe  	sd	a1, -24(s0)
   14890: 97 00 00 00  	auipc	ra, 0
   14894: e7 80 00 fb  	jalr	-80(ra)
   14898: e2 60        	ld	ra, 24(sp)
   1489a: 42 64        	ld	s0, 16(sp)
   1489c: 05 61        	addi	sp, sp, 32
   1489e: 82 80        	ret

00000000000148a0 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E>:
   148a0: 39 71        	addi	sp, sp, -64
   148a2: 06 fc        	sd	ra, 56(sp)
   148a4: 22 f8        	sd	s0, 48(sp)
   148a6: 80 00        	addi	s0, sp, 64
   148a8: 23 30 a4 fe  	sd	a0, -32(s0)
   148ac: 23 34 b4 fe  	sd	a1, -24(s0)
   148b0: 08 61        	ld	a0, 0(a0)
   148b2: 23 34 a4 fc  	sd	a0, -56(s0)
   148b6: 8c 61        	ld	a1, 0(a1)
   148b8: 23 38 b4 fc  	sd	a1, -48(s0)
   148bc: 63 6a b5 00  	bltu	a0, a1, 0x148d0 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x30>
   148c0: 09 a0        	j	0x148c2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x22>
   148c2: 03 35 84 fc  	ld	a0, -56(s0)
   148c6: 83 35 04 fd  	ld	a1, -48(s0)
   148ca: 63 0c b5 00  	beq	a0, a1, 0x148e2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x42>
   148ce: 31 a0        	j	0x148da <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x3a>
   148d0: 13 05 f0 0f  	li	a0, 255
   148d4: a3 0f a4 fc  	sb	a0, -33(s0)
   148d8: 11 a8        	j	0x148ec <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x4c>
   148da: 05 45        	li	a0, 1
   148dc: a3 0f a4 fc  	sb	a0, -33(s0)
   148e0: 29 a0        	j	0x148ea <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x4a>
   148e2: 01 45        	li	a0, 0
   148e4: a3 0f a4 fc  	sb	a0, -33(s0)
   148e8: 09 a0        	j	0x148ea <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x4a>
   148ea: 09 a0        	j	0x148ec <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h80b3d416e3775801E+0x4c>
   148ec: 03 45 f4 fd  	lbu	a0, -33(s0)
   148f0: e2 70        	ld	ra, 56(sp)
   148f2: 42 74        	ld	s0, 48(sp)
   148f4: 21 61        	addi	sp, sp, 64
   148f6: 82 80        	ret

00000000000148f8 <_ZN4core3cmp6max_by17he70d20e91d9595bcE>:
   148f8: 5d 71        	addi	sp, sp, -80
   148fa: 86 e4        	sd	ra, 72(sp)
   148fc: a2 e0        	sd	s0, 64(sp)
   148fe: 80 08        	addi	s0, sp, 80
   14900: 23 3c a4 fa  	sd	a0, -72(s0)
   14904: 23 30 b4 fc  	sd	a1, -64(s0)
   14908: 05 45        	li	a0, 1
   1490a: 23 07 a4 fe  	sb	a0, -18(s0)
   1490e: a3 06 a4 fe  	sb	a0, -19(s0)
   14912: 13 05 84 fb  	addi	a0, s0, -72
   14916: 23 3c a4 fc  	sd	a0, -40(s0)
   1491a: 13 05 04 fc  	addi	a0, s0, -64
   1491e: 23 30 a4 fe  	sd	a0, -32(s0)
   14922: 03 35 84 fd  	ld	a0, -40(s0)
   14926: 83 35 04 fe  	ld	a1, -32(s0)
   1492a: 97 00 00 00  	auipc	ra, 0
   1492e: e7 80 60 1f  	jalr	502(ra)
   14932: a3 0b a4 fc  	sb	a0, -41(s0)
   14936: 03 45 74 fd  	lbu	a0, -41(s0)
   1493a: 05 25        	addiw	a0, a0, 1
   1493c: 13 75 f5 0f  	andi	a0, a0, 255
   14940: 89 45        	li	a1, 2
   14942: 63 65 b5 00  	bltu	a0, a1, 0x1494c <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x54>
   14946: 09 a0        	j	0x14948 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x50>
   14948: 11 a8        	j	0x1495c <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x64>
   1494a: 00 00        	unimp
   1494c: 01 45        	li	a0, 0
   1494e: a3 06 a4 fe  	sb	a0, -19(s0)
   14952: 03 35 04 fc  	ld	a0, -64(s0)
   14956: 23 34 a4 fc  	sd	a0, -56(s0)
   1495a: 09 a8        	j	0x1496c <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x74>
   1495c: 01 45        	li	a0, 0
   1495e: 23 07 a4 fe  	sb	a0, -18(s0)
   14962: 03 35 84 fb  	ld	a0, -72(s0)
   14966: 23 34 a4 fc  	sd	a0, -56(s0)
   1496a: 09 a0        	j	0x1496c <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x74>
   1496c: 03 45 d4 fe  	lbu	a0, -19(s0)
   14970: 05 89        	andi	a0, a0, 1
   14972: 19 e5        	bnez	a0, 0x14980 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x88>
   14974: 09 a0        	j	0x14976 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x7e>
   14976: 03 45 e4 fe  	lbu	a0, -18(s0)
   1497a: 05 89        	andi	a0, a0, 1
   1497c: 09 e9        	bnez	a0, 0x1498e <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x96>
   1497e: 11 a0        	j	0x14982 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x8a>
   14980: dd bf        	j	0x14976 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x7e>
   14982: 03 35 84 fc  	ld	a0, -56(s0)
   14986: a6 60        	ld	ra, 72(sp)
   14988: 06 64        	ld	s0, 64(sp)
   1498a: 61 61        	addi	sp, sp, 80
   1498c: 82 80        	ret
   1498e: d5 bf        	j	0x14982 <_ZN4core3cmp6max_by17he70d20e91d9595bcE+0x8a>

0000000000014990 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE>:
   14990: 5d 71        	addi	sp, sp, -80
   14992: 86 e4        	sd	ra, 72(sp)
   14994: a2 e0        	sd	s0, 64(sp)
   14996: 80 08        	addi	s0, sp, 80
   14998: 23 3c a4 fa  	sd	a0, -72(s0)
   1499c: 23 30 b4 fc  	sd	a1, -64(s0)
   149a0: 05 45        	li	a0, 1
   149a2: 23 07 a4 fe  	sb	a0, -18(s0)
   149a6: a3 06 a4 fe  	sb	a0, -19(s0)
   149aa: 13 05 84 fb  	addi	a0, s0, -72
   149ae: 23 3c a4 fc  	sd	a0, -40(s0)
   149b2: 13 05 04 fc  	addi	a0, s0, -64
   149b6: 23 30 a4 fe  	sd	a0, -32(s0)
   149ba: 03 35 84 fd  	ld	a0, -40(s0)
   149be: 83 35 04 fe  	ld	a1, -32(s0)
   149c2: 97 00 00 00  	auipc	ra, 0
   149c6: e7 80 e0 15  	jalr	350(ra)
   149ca: a3 0b a4 fc  	sb	a0, -41(s0)
   149ce: 03 45 74 fd  	lbu	a0, -41(s0)
   149d2: 05 25        	addiw	a0, a0, 1
   149d4: 13 75 f5 0f  	andi	a0, a0, 255
   149d8: 89 45        	li	a1, 2
   149da: 63 65 b5 00  	bltu	a0, a1, 0x149e4 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x54>
   149de: 09 a0        	j	0x149e0 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x50>
   149e0: 11 a8        	j	0x149f4 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x64>
   149e2: 00 00        	unimp
   149e4: 01 45        	li	a0, 0
   149e6: 23 07 a4 fe  	sb	a0, -18(s0)
   149ea: 03 35 84 fb  	ld	a0, -72(s0)
   149ee: 23 34 a4 fc  	sd	a0, -56(s0)
   149f2: 09 a8        	j	0x14a04 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x74>
   149f4: 01 45        	li	a0, 0
   149f6: a3 06 a4 fe  	sb	a0, -19(s0)
   149fa: 03 35 04 fc  	ld	a0, -64(s0)
   149fe: 23 34 a4 fc  	sd	a0, -56(s0)
   14a02: 09 a0        	j	0x14a04 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x74>
   14a04: 03 45 d4 fe  	lbu	a0, -19(s0)
   14a08: 05 89        	andi	a0, a0, 1
   14a0a: 19 e5        	bnez	a0, 0x14a18 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x88>
   14a0c: 09 a0        	j	0x14a0e <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x7e>
   14a0e: 03 45 e4 fe  	lbu	a0, -18(s0)
   14a12: 05 89        	andi	a0, a0, 1
   14a14: 09 e9        	bnez	a0, 0x14a26 <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x96>
   14a16: 11 a0        	j	0x14a1a <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x8a>
   14a18: dd bf        	j	0x14a0e <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x7e>
   14a1a: 03 35 84 fc  	ld	a0, -56(s0)
   14a1e: a6 60        	ld	ra, 72(sp)
   14a20: 06 64        	ld	s0, 64(sp)
   14a22: 61 61        	addi	sp, sp, 80
   14a24: 82 80        	ret
   14a26: d5 bf        	j	0x14a1a <_ZN4core3cmp6min_by17h27b30a1a0102aeaaE+0x8a>

0000000000014a28 <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE>:
   14a28: 5d 71        	addi	sp, sp, -80
   14a2a: 86 e4        	sd	ra, 72(sp)
   14a2c: a2 e0        	sd	s0, 64(sp)
   14a2e: 80 08        	addi	s0, sp, 80
   14a30: 23 30 a4 fc  	sd	a0, -64(s0)
   14a34: 23 38 a4 fc  	sd	a0, -48(s0)
   14a38: 89 45        	li	a1, 2
   14a3a: 63 65 b5 0a  	bltu	a0, a1, 0x14ae4 <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE+0xbc>
   14a3e: 09 a0        	j	0x14a40 <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE+0x18>
   14a40: 03 35 04 fc  	ld	a0, -64(s0)
   14a44: 7d 15        	addi	a0, a0, -1
   14a46: 23 3c a4 fc  	sd	a0, -40(s0)
   14a4a: 93 55 15 00  	srli	a1, a0, 1
   14a4e: 4d 8d        	or	a0, a0, a1
   14a50: 93 55 25 00  	srli	a1, a0, 2
   14a54: 4d 8d        	or	a0, a0, a1
   14a56: 93 55 45 00  	srli	a1, a0, 4
   14a5a: 4d 8d        	or	a0, a0, a1
   14a5c: 93 55 85 00  	srli	a1, a0, 8
   14a60: 4d 8d        	or	a0, a0, a1
   14a62: 93 55 05 01  	srli	a1, a0, 16
   14a66: 4d 8d        	or	a0, a0, a1
   14a68: 93 55 05 02  	srli	a1, a0, 32
   14a6c: 4d 8d        	or	a0, a0, a1
   14a6e: 13 45 f5 ff  	not	a0, a0
   14a72: 93 55 15 00  	srli	a1, a0, 1
   14a76: 37 56 55 55  	lui	a2, 349525
   14a7a: 1b 06 56 55  	addiw	a2, a2, 1365
   14a7e: 93 16 06 02  	slli	a3, a2, 32
   14a82: 36 96        	add	a2, a2, a3
   14a84: f1 8d        	and	a1, a1, a2
   14a86: b3 05 b5 40  	sub	a1, a0, a1
   14a8a: 37 35 33 33  	lui	a0, 209715
   14a8e: 1b 05 35 33  	addiw	a0, a0, 819
   14a92: 13 16 05 02  	slli	a2, a0, 32
   14a96: 2a 96        	add	a2, a2, a0
   14a98: 33 f5 c5 00  	and	a0, a1, a2
   14a9c: 89 81        	srli	a1, a1, 2
   14a9e: f1 8d        	and	a1, a1, a2
   14aa0: 2e 95        	add	a0, a0, a1
   14aa2: 93 55 45 00  	srli	a1, a0, 4
   14aa6: 2e 95        	add	a0, a0, a1
   14aa8: b7 15 0f 0f  	lui	a1, 61681
   14aac: 9b 85 f5 f0  	addiw	a1, a1, -241
   14ab0: 13 96 05 02  	slli	a2, a1, 32
   14ab4: b2 95        	add	a1, a1, a2
   14ab6: 6d 8d        	and	a0, a0, a1
   14ab8: b7 05 01 01  	lui	a1, 4112
   14abc: 9b 85 15 10  	addiw	a1, a1, 257
   14ac0: 13 96 05 02  	slli	a2, a1, 32
   14ac4: b2 95        	add	a1, a1, a2
   14ac6: 33 05 b5 02  	mul	a0, a0, a1
   14aca: 61 91        	srli	a0, a0, 56
   14acc: 23 30 a4 fe  	sd	a0, -32(s0)
   14ad0: 83 35 04 fe  	ld	a1, -32(s0)
   14ad4: 23 34 b4 fe  	sd	a1, -24(s0)
   14ad8: 7d 55        	li	a0, -1
   14ada: 33 55 b5 00  	srl	a0, a0, a1
   14ade: 23 34 a4 fc  	sd	a0, -56(s0)
   14ae2: 29 a0        	j	0x14aec <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE+0xc4>
   14ae4: 01 45        	li	a0, 0
   14ae6: 23 34 a4 fc  	sd	a0, -56(s0)
   14aea: 09 a0        	j	0x14aec <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE+0xc4>
   14aec: 03 35 84 fc  	ld	a0, -56(s0)
   14af0: 05 05        	addi	a0, a0, 1
   14af2: 23 3c a4 fa  	sd	a0, -72(s0)
   14af6: 01 c9        	beqz	a0, 0x14b06 <.Lpcrel_hi16>
   14af8: 09 a0        	j	0x14afa <_ZN4core3num23_$LT$impl$u20$usize$GT$17next_power_of_two17hfd8595f3625aa30bE+0xd2>
   14afa: 03 35 84 fb  	ld	a0, -72(s0)
   14afe: a6 60        	ld	ra, 72(sp)
   14b00: 06 64        	ld	s0, 64(sp)
   14b02: 61 61        	addi	sp, sp, 80
   14b04: 82 80        	ret

0000000000014b06 <.Lpcrel_hi16>:
   14b06: 17 55 00 00  	auipc	a0, 5
   14b0a: 13 05 a5 97  	addi	a0, a0, -1670

0000000000014b0e <.Lpcrel_hi17>:
   14b0e: 97 55 00 00  	auipc	a1, 5
   14b12: 13 86 a5 9d  	addi	a2, a1, -1574
   14b16: f1 45        	li	a1, 28
   14b18: 97 20 00 00  	auipc	ra, 2
   14b1c: e7 80 40 b3  	jalr	-1228(ra)

0000000000014b20 <_ZN4core3ops8function6FnOnce9call_once17h0c40ee09c6a9c8f0E>:
   14b20: 79 71        	addi	sp, sp, -48
   14b22: 06 f4        	sd	ra, 40(sp)
   14b24: 22 f0        	sd	s0, 32(sp)
   14b26: 00 18        	addi	s0, sp, 48
   14b28: 23 3c a4 fc  	sd	a0, -40(s0)
   14b2c: 23 30 b4 fe  	sd	a1, -32(s0)
   14b30: 03 35 84 fd  	ld	a0, -40(s0)
   14b34: 83 35 04 fe  	ld	a1, -32(s0)
   14b38: 97 00 00 00  	auipc	ra, 0
   14b3c: e7 80 80 d6  	jalr	-664(ra)
   14b40: a2 70        	ld	ra, 40(sp)
   14b42: 02 74        	ld	s0, 32(sp)
   14b44: 45 61        	addi	sp, sp, 48
   14b46: 82 80        	ret

0000000000014b48 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h0a3f6c39c426c794E>:
   14b48: 01 11        	addi	sp, sp, -32
   14b4a: 06 ec        	sd	ra, 24(sp)
   14b4c: 22 e8        	sd	s0, 16(sp)
   14b4e: 00 10        	addi	s0, sp, 32
   14b50: 23 30 a4 fe  	sd	a0, -32(s0)
   14b54: 23 34 a4 fe  	sd	a0, -24(s0)
   14b58: 13 35 15 00  	seqz	a0, a0
   14b5c: e2 60        	ld	ra, 24(sp)
   14b5e: 42 64        	ld	s0, 16(sp)
   14b60: 05 61        	addi	sp, sp, 32
   14b62: 82 80        	ret

0000000000014b64 <_ZN4core3ptr80drop_in_place$LT$spin..mutex..MutexGuard$LT$buddy_system_allocator..Heap$GT$$GT$17h0c66c48a19d4cea1E>:
   14b64: 01 11        	addi	sp, sp, -32
   14b66: 06 ec        	sd	ra, 24(sp)
   14b68: 22 e8        	sd	s0, 16(sp)
   14b6a: 00 10        	addi	s0, sp, 32
   14b6c: 23 34 a4 fe  	sd	a0, -24(s0)
   14b70: 97 00 00 00  	auipc	ra, 0
   14b74: e7 80 a0 06  	jalr	106(ra)
   14b78: e2 60        	ld	ra, 24(sp)
   14b7a: 42 64        	ld	s0, 16(sp)
   14b7c: 05 61        	addi	sp, sp, 32
   14b7e: 82 80        	ret

0000000000014b80 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hfa7113fb48417536E>:
   14b80: 01 11        	addi	sp, sp, -32
   14b82: 06 ec        	sd	ra, 24(sp)
   14b84: 22 e8        	sd	s0, 16(sp)
   14b86: 00 10        	addi	s0, sp, 32
   14b88: 23 34 a4 fe  	sd	a0, -24(s0)
   14b8c: 23 30 a4 fe  	sd	a0, -32(s0)
   14b90: 03 35 04 fe  	ld	a0, -32(s0)
   14b94: e2 60        	ld	ra, 24(sp)
   14b96: 42 64        	ld	s0, 16(sp)
   14b98: 05 61        	addi	sp, sp, 32
   14b9a: 82 80        	ret

0000000000014b9c <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17he3793141fb267a72E>:
   14b9c: 39 71        	addi	sp, sp, -64
   14b9e: 06 fc        	sd	ra, 56(sp)
   14ba0: 22 f8        	sd	s0, 48(sp)
   14ba2: 80 00        	addi	s0, sp, 64
   14ba4: 23 34 a4 fc  	sd	a0, -56(s0)
   14ba8: 23 30 a4 fe  	sd	a0, -32(s0)
   14bac: 23 34 a4 fe  	sd	a0, -24(s0)
   14bb0: 11 e5        	bnez	a0, 0x14bbc <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17he3793141fb267a72E+0x20>
   14bb2: 09 a0        	j	0x14bb4 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17he3793141fb267a72E+0x18>
   14bb4: 01 45        	li	a0, 0
   14bb6: 23 38 a4 fc  	sd	a0, -48(s0)
   14bba: 11 a8        	j	0x14bce <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17he3793141fb267a72E+0x32>
   14bbc: 03 35 84 fc  	ld	a0, -56(s0)
   14bc0: 23 3c a4 fc  	sd	a0, -40(s0)
   14bc4: 03 35 84 fd  	ld	a0, -40(s0)
   14bc8: 23 38 a4 fc  	sd	a0, -48(s0)
   14bcc: 09 a0        	j	0x14bce <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17he3793141fb267a72E+0x32>
   14bce: 03 35 04 fd  	ld	a0, -48(s0)
   14bd2: e2 70        	ld	ra, 56(sp)
   14bd4: 42 74        	ld	s0, 48(sp)
   14bd6: 21 61        	addi	sp, sp, 64
   14bd8: 82 80        	ret

0000000000014bda <_ZN4core3ptr94drop_in_place$LT$spin..mutex..ticket..TicketMutexGuard$LT$buddy_system_allocator..Heap$GT$$GT$17h93b0a90cf4b95404E>:
   14bda: 01 11        	addi	sp, sp, -32
   14bdc: 06 ec        	sd	ra, 24(sp)
   14bde: 22 e8        	sd	s0, 16(sp)
   14be0: 00 10        	addi	s0, sp, 32
   14be2: 23 34 a4 fe  	sd	a0, -24(s0)
   14be6: 97 00 00 00  	auipc	ra, 0
   14bea: e7 80 00 33  	jalr	816(ra)
   14bee: e2 60        	ld	ra, 24(sp)
   14bf0: 42 64        	ld	s0, 16(sp)
   14bf2: 05 61        	addi	sp, sp, 32
   14bf4: 82 80        	ret

0000000000014bf6 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hcff65fce5d45626bE>:
   14bf6: 01 11        	addi	sp, sp, -32
   14bf8: 06 ec        	sd	ra, 24(sp)
   14bfa: 22 e8        	sd	s0, 16(sp)
   14bfc: 00 10        	addi	s0, sp, 32
   14bfe: 23 34 a4 fe  	sd	a0, -24(s0)
   14c02: 97 00 00 00  	auipc	ra, 0
   14c06: e7 80 e0 3d  	jalr	990(ra)
   14c0a: e2 60        	ld	ra, 24(sp)
   14c0c: 42 64        	ld	s0, 16(sp)
   14c0e: 05 61        	addi	sp, sp, 32
   14c10: 82 80        	ret

0000000000014c12 <_ZN4core4iter5range116_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9next_back17h752b8512b23f0f85E>:
   14c12: 01 11        	addi	sp, sp, -32
   14c14: 06 ec        	sd	ra, 24(sp)
   14c16: 22 e8        	sd	s0, 16(sp)
   14c18: 00 10        	addi	s0, sp, 32
   14c1a: 23 34 a4 fe  	sd	a0, -24(s0)
   14c1e: 97 00 00 00  	auipc	ra, 0
   14c22: e7 80 60 35  	jalr	854(ra)
   14c26: e2 60        	ld	ra, 24(sp)
   14c28: 42 64        	ld	s0, 16(sp)
   14c2a: 05 61        	addi	sp, sp, 32
   14c2c: 82 80        	ret

0000000000014c2e <_ZN4core4iter6traits8iterator8Iterator3rev17he550a034ea741d3bE>:
   14c2e: 79 71        	addi	sp, sp, -48
   14c30: 06 f4        	sd	ra, 40(sp)
   14c32: 22 f0        	sd	s0, 32(sp)
   14c34: 00 18        	addi	s0, sp, 48
   14c36: 23 30 a4 fe  	sd	a0, -32(s0)
   14c3a: 23 34 b4 fe  	sd	a1, -24(s0)
   14c3e: 23 38 a4 fc  	sd	a0, -48(s0)
   14c42: 23 3c b4 fc  	sd	a1, -40(s0)
   14c46: 03 35 04 fd  	ld	a0, -48(s0)
   14c4a: 83 35 84 fd  	ld	a1, -40(s0)
   14c4e: a2 70        	ld	ra, 40(sp)
   14c50: 02 74        	ld	s0, 32(sp)
   14c52: 45 61        	addi	sp, sp, 48
   14c54: 82 80        	ret

0000000000014c56 <_ZN4core4sync6atomic11AtomicUsize4load17hdef59da68ea42356E>:
   14c56: 79 71        	addi	sp, sp, -48
   14c58: 06 f4        	sd	ra, 40(sp)
   14c5a: 22 f0        	sd	s0, 32(sp)
   14c5c: 00 18        	addi	s0, sp, 48
   14c5e: 23 3c a4 fc  	sd	a0, -40(s0)
   14c62: a3 03 b4 fe  	sb	a1, -25(s0)
   14c66: 23 34 a4 fe  	sd	a0, -24(s0)
   14c6a: 97 10 00 00  	auipc	ra, 1
   14c6e: e7 80 e0 56  	jalr	1390(ra)
   14c72: a2 70        	ld	ra, 40(sp)
   14c74: 02 74        	ld	s0, 32(sp)
   14c76: 45 61        	addi	sp, sp, 48
   14c78: 82 80        	ret

0000000000014c7a <_ZN4core4sync6atomic11AtomicUsize5store17h98a9900227975580E>:
   14c7a: 79 71        	addi	sp, sp, -48
   14c7c: 06 f4        	sd	ra, 40(sp)
   14c7e: 22 f0        	sd	s0, 32(sp)
   14c80: 00 18        	addi	s0, sp, 48
   14c82: 23 38 a4 fc  	sd	a0, -48(s0)
   14c86: 23 3c b4 fc  	sd	a1, -40(s0)
   14c8a: a3 03 c4 fe  	sb	a2, -25(s0)
   14c8e: 23 34 a4 fe  	sd	a0, -24(s0)
   14c92: 97 10 00 00  	auipc	ra, 1
   14c96: e7 80 80 6d  	jalr	1752(ra)
   14c9a: a2 70        	ld	ra, 40(sp)
   14c9c: 02 74        	ld	s0, 32(sp)
   14c9e: 45 61        	addi	sp, sp, 48
   14ca0: 82 80        	ret

0000000000014ca2 <_ZN4core4sync6atomic11AtomicUsize9fetch_add17h57ffcc9360cf9d67E>:
   14ca2: 1d 71        	addi	sp, sp, -96
   14ca4: 86 ec        	sd	ra, 88(sp)
   14ca6: a2 e8        	sd	s0, 80(sp)
   14ca8: 80 10        	addi	s0, sp, 96
   14caa: 23 34 b4 fa  	sd	a1, -88(s0)
   14cae: 23 38 a4 fa  	sd	a0, -80(s0)
   14cb2: a3 03 c4 fc  	sb	a2, -57(s0)
   14cb6: 23 38 a4 fc  	sd	a0, -48(s0)
   14cba: 23 3c b4 fc  	sd	a1, -40(s0)
   14cbe: 23 30 a4 fe  	sd	a0, -32(s0)
   14cc2: 23 34 a4 fe  	sd	a0, -24(s0)
   14cc6: 03 45 74 fc  	lbu	a0, -57(s0)
   14cca: 23 3c a4 fa  	sd	a0, -72(s0)
   14cce: 03 35 84 fb  	ld	a0, -72(s0)
   14cd2: 0e 05        	slli	a0, a0, 3

0000000000014cd4 <.Lpcrel_hi18>:
   14cd4: 97 45 00 00  	auipc	a1, 4
   14cd8: 93 85 45 60  	addi	a1, a1, 1540
   14cdc: 2e 95        	add	a0, a0, a1
   14cde: 08 61        	ld	a0, 0(a0)
   14ce0: 02 85        	jr	a0
   14ce2: 00 00        	unimp

0000000000014ce4 <.LBB43_3>:
   14ce4: 03 35 04 fb  	ld	a0, -80(s0)
   14ce8: 83 35 84 fa  	ld	a1, -88(s0)
   14cec: 2f 35 b5 00  	amoadd.d	a0, a1, (a0)
   14cf0: 23 34 a4 fc  	sd	a0, -56(s0)
   14cf4: a9 a0        	j	0x14d3e <.LBB43_7+0x12>

0000000000014cf6 <.LBB43_4>:
   14cf6: 03 35 04 fb  	ld	a0, -80(s0)
   14cfa: 83 35 84 fa  	ld	a1, -88(s0)
   14cfe: 2f 35 b5 02  	amoadd.d.rl	a0, a1, (a0)
   14d02: 23 34 a4 fc  	sd	a0, -56(s0)
   14d06: 25 a8        	j	0x14d3e <.LBB43_7+0x12>

0000000000014d08 <.LBB43_5>:
   14d08: 03 35 04 fb  	ld	a0, -80(s0)
   14d0c: 83 35 84 fa  	ld	a1, -88(s0)
   14d10: 2f 35 b5 04  	amoadd.d.aq	a0, a1, (a0)
   14d14: 23 34 a4 fc  	sd	a0, -56(s0)
   14d18: 1d a0        	j	0x14d3e <.LBB43_7+0x12>

0000000000014d1a <.LBB43_6>:
   14d1a: 03 35 04 fb  	ld	a0, -80(s0)
   14d1e: 83 35 84 fa  	ld	a1, -88(s0)
   14d22: 2f 35 b5 06  	amoadd.d.aqrl	a0, a1, (a0)
   14d26: 23 34 a4 fc  	sd	a0, -56(s0)
   14d2a: 11 a8        	j	0x14d3e <.LBB43_7+0x12>

0000000000014d2c <.LBB43_7>:
   14d2c: 03 35 04 fb  	ld	a0, -80(s0)
   14d30: 83 35 84 fa  	ld	a1, -88(s0)
   14d34: 2f 35 b5 06  	amoadd.d.aqrl	a0, a1, (a0)
   14d38: 23 34 a4 fc  	sd	a0, -56(s0)
   14d3c: 09 a0        	j	0x14d3e <.LBB43_7+0x12>
   14d3e: 03 35 84 fc  	ld	a0, -56(s0)
   14d42: e6 60        	ld	ra, 88(sp)
   14d44: 46 64        	ld	s0, 80(sp)
   14d46: 25 61        	addi	sp, sp, 96
   14d48: 82 80        	ret

0000000000014d4a <_ZN4core4sync6atomic14spin_loop_hint17h081b582f8eceb2c6E>:
   14d4a: 41 11        	addi	sp, sp, -16
   14d4c: 06 e4        	sd	ra, 8(sp)
   14d4e: 22 e0        	sd	s0, 0(sp)
   14d50: 00 08        	addi	s0, sp, 16
   14d52: 0f 00 00 01  	fence	w, 0
   14d56: a2 60        	ld	ra, 8(sp)
   14d58: 02 64        	ld	s0, 0(sp)
   14d5a: 41 01        	addi	sp, sp, 16
   14d5c: 82 80        	ret

0000000000014d5e <_ZN4core5alloc6layout6Layout4size17h91e2c061347de2e0E>:
   14d5e: 01 11        	addi	sp, sp, -32
   14d60: 06 ec        	sd	ra, 24(sp)
   14d62: 22 e8        	sd	s0, 16(sp)
   14d64: 00 10        	addi	s0, sp, 32
   14d66: 23 34 a4 fe  	sd	a0, -24(s0)
   14d6a: 08 65        	ld	a0, 8(a0)
   14d6c: e2 60        	ld	ra, 24(sp)
   14d6e: 42 64        	ld	s0, 16(sp)
   14d70: 05 61        	addi	sp, sp, 32
   14d72: 82 80        	ret

0000000000014d74 <_ZN4core5alloc6layout6Layout5align17h3f0c39d7eb20cb60E>:
   14d74: 79 71        	addi	sp, sp, -48
   14d76: 06 f4        	sd	ra, 40(sp)
   14d78: 22 f0        	sd	s0, 32(sp)
   14d7a: 00 18        	addi	s0, sp, 48
   14d7c: 23 30 a4 fe  	sd	a0, -32(s0)
   14d80: 08 61        	ld	a0, 0(a0)
   14d82: 23 34 a4 fe  	sd	a0, -24(s0)
   14d86: 23 3c a4 fc  	sd	a0, -40(s0)
   14d8a: 03 35 84 fd  	ld	a0, -40(s0)
   14d8e: a2 70        	ld	ra, 40(sp)
   14d90: 02 74        	ld	s0, 32(sp)
   14d92: 45 61        	addi	sp, sp, 48
   14d94: 82 80        	ret

0000000000014d96 <_ZN4core6option15Option$LT$T$GT$6expect17h7416a6f11748cb40E>:
   14d96: 5d 71        	addi	sp, sp, -80
   14d98: 86 e4        	sd	ra, 72(sp)
   14d9a: a2 e0        	sd	s0, 64(sp)
   14d9c: 80 08        	addi	s0, sp, 80
   14d9e: 23 38 e4 fa  	sd	a4, -80(s0)
   14da2: 23 3c d4 fa  	sd	a3, -72(s0)
   14da6: 23 30 c4 fc  	sd	a2, -64(s0)
   14daa: 23 34 a4 fc  	sd	a0, -56(s0)
   14dae: 23 38 b4 fc  	sd	a1, -48(s0)
   14db2: 23 3c c4 fc  	sd	a2, -40(s0)
   14db6: 23 30 d4 fe  	sd	a3, -32(s0)
   14dba: 03 35 84 fc  	ld	a0, -56(s0)
   14dbe: 01 ed        	bnez	a0, 0x14dd6 <_ZN4core6option15Option$LT$T$GT$6expect17h7416a6f11748cb40E+0x40>
   14dc0: 09 a0        	j	0x14dc2 <_ZN4core6option15Option$LT$T$GT$6expect17h7416a6f11748cb40E+0x2c>
   14dc2: 03 36 04 fb  	ld	a2, -80(s0)
   14dc6: 83 35 84 fb  	ld	a1, -72(s0)
   14dca: 03 35 04 fc  	ld	a0, -64(s0)
   14dce: 97 20 00 00  	auipc	ra, 2
   14dd2: e7 80 a0 81  	jalr	-2022(ra)
   14dd6: 03 35 04 fd  	ld	a0, -48(s0)
   14dda: 23 34 a4 fe  	sd	a0, -24(s0)
   14dde: a6 60        	ld	ra, 72(sp)
   14de0: 06 64        	ld	s0, 64(sp)
   14de2: 61 61        	addi	sp, sp, 80
   14de4: 82 80        	ret

0000000000014de6 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E>:
   14de6: 5d 71        	addi	sp, sp, -80
   14de8: 86 e4        	sd	ra, 72(sp)
   14dea: a2 e0        	sd	s0, 64(sp)
   14dec: 80 08        	addi	s0, sp, 80
   14dee: 23 38 b4 fa  	sd	a1, -80(s0)
   14df2: 23 3c a4 fa  	sd	a0, -72(s0)
   14df6: 23 3c b4 fc  	sd	a1, -40(s0)
   14dfa: 05 45        	li	a0, 1
   14dfc: a3 0b a4 fc  	sb	a0, -41(s0)
   14e00: 23 0b a4 fc  	sb	a0, -42(s0)
   14e04: 03 35 84 fb  	ld	a0, -72(s0)
   14e08: 11 e9        	bnez	a0, 0x14e1c <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x36>
   14e0a: 09 a0        	j	0x14e0c <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x26>
   14e0c: 03 35 04 fb  	ld	a0, -80(s0)
   14e10: 81 45        	li	a1, 0
   14e12: a3 0b b4 fc  	sb	a1, -41(s0)
   14e16: 23 30 a4 fc  	sd	a0, -64(s0)
   14e1a: 1d a0        	j	0x14e40 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x5a>
   14e1c: 03 35 84 fb  	ld	a0, -72(s0)
   14e20: 23 34 a4 fe  	sd	a0, -24(s0)
   14e24: 81 45        	li	a1, 0
   14e26: 23 0b b4 fc  	sb	a1, -42(s0)
   14e2a: 23 34 a4 fc  	sd	a0, -56(s0)
   14e2e: 03 35 84 fc  	ld	a0, -56(s0)
   14e32: 97 10 00 00  	auipc	ra, 1
   14e36: e7 80 60 0a  	jalr	166(ra)
   14e3a: 23 30 a4 fc  	sd	a0, -64(s0)
   14e3e: 09 a0        	j	0x14e40 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x5a>
   14e40: 03 45 64 fd  	lbu	a0, -42(s0)
   14e44: 05 89        	andi	a0, a0, 1
   14e46: 19 e5        	bnez	a0, 0x14e54 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x6e>
   14e48: 09 a0        	j	0x14e4a <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x64>
   14e4a: 03 45 74 fd  	lbu	a0, -41(s0)
   14e4e: 05 89        	andi	a0, a0, 1
   14e50: 09 e9        	bnez	a0, 0x14e62 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x7c>
   14e52: 11 a0        	j	0x14e56 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x70>
   14e54: dd bf        	j	0x14e4a <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x64>
   14e56: 03 35 04 fc  	ld	a0, -64(s0)
   14e5a: a6 60        	ld	ra, 72(sp)
   14e5c: 06 64        	ld	s0, 64(sp)
   14e5e: 61 61        	addi	sp, sp, 80
   14e60: 82 80        	ret
   14e62: d5 bf        	j	0x14e56 <_ZN4core6option15Option$LT$T$GT$6map_or17h8054af50bd9954d8E+0x70>

0000000000014e64 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E>:
   14e64: 79 71        	addi	sp, sp, -48
   14e66: 06 f4        	sd	ra, 40(sp)
   14e68: 22 f0        	sd	s0, 32(sp)
   14e6a: 00 18        	addi	s0, sp, 48
   14e6c: 23 3c a4 fc  	sd	a0, -40(s0)
   14e70: 03 35 84 fd  	ld	a0, -40(s0)
   14e74: 09 c9        	beqz	a0, 0x14e86 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x22>
   14e76: 09 a0        	j	0x14e78 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x14>
   14e78: 03 35 84 fd  	ld	a0, -40(s0)
   14e7c: 23 34 a4 fe  	sd	a0, -24(s0)
   14e80: 23 30 a4 fe  	sd	a0, -32(s0)
   14e84: 29 a0        	j	0x14e8e <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x2a>
   14e86: 01 45        	li	a0, 0
   14e88: 23 30 a4 fe  	sd	a0, -32(s0)
   14e8c: 09 a0        	j	0x14e8e <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x2a>
   14e8e: 03 35 84 fd  	ld	a0, -40(s0)
   14e92: 01 c9        	beqz	a0, 0x14ea2 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x3e>
   14e94: 09 a0        	j	0x14e96 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x32>
   14e96: 03 35 04 fe  	ld	a0, -32(s0)
   14e9a: a2 70        	ld	ra, 40(sp)
   14e9c: 02 74        	ld	s0, 32(sp)
   14e9e: 45 61        	addi	sp, sp, 48
   14ea0: 82 80        	ret
   14ea2: d5 bf        	j	0x14e96 <_ZN4core6result19Result$LT$T$C$E$GT$2ok17h71645c9d5fcf9553E+0x32>

0000000000014ea4 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h44121883084fdba4E>:
   14ea4: 01 11        	addi	sp, sp, -32
   14ea6: 06 ec        	sd	ra, 24(sp)
   14ea8: 22 e8        	sd	s0, 16(sp)
   14eaa: 00 10        	addi	s0, sp, 32
   14eac: 23 30 a4 fe  	sd	a0, -32(s0)
   14eb0: 23 34 b4 fe  	sd	a1, -24(s0)
   14eb4: e2 60        	ld	ra, 24(sp)
   14eb6: 42 64        	ld	s0, 16(sp)
   14eb8: 05 61        	addi	sp, sp, 32
   14eba: 82 80        	ret

0000000000014ebc <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hc67041f11bd2a0e5E>:
   14ebc: 01 11        	addi	sp, sp, -32
   14ebe: 06 ec        	sd	ra, 24(sp)
   14ec0: 22 e8        	sd	s0, 16(sp)
   14ec2: 00 10        	addi	s0, sp, 32
   14ec4: 23 30 a4 fe  	sd	a0, -32(s0)
   14ec8: 23 34 b4 fe  	sd	a1, -24(s0)
   14ecc: e2 60        	ld	ra, 24(sp)
   14ece: 42 64        	ld	s0, 16(sp)
   14ed0: 05 61        	addi	sp, sp, 32
   14ed2: 82 80        	ret

0000000000014ed4 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17he87be504f5c61a6eE>:
   14ed4: 01 11        	addi	sp, sp, -32
   14ed6: 06 ec        	sd	ra, 24(sp)
   14ed8: 22 e8        	sd	s0, 16(sp)
   14eda: 00 10        	addi	s0, sp, 32
   14edc: 23 34 b4 fe  	sd	a1, -24(s0)
   14ee0: aa 85        	mv	a1, a0
   14ee2: 03 35 84 fe  	ld	a0, -24(s0)
   14ee6: 10 69        	ld	a2, 16(a0)
   14ee8: 90 e9        	sd	a2, 16(a1)
   14eea: 10 65        	ld	a2, 8(a0)
   14eec: 90 e5        	sd	a2, 8(a1)
   14eee: 08 61        	ld	a0, 0(a0)
   14ef0: 88 e1        	sd	a0, 0(a1)
   14ef2: e2 60        	ld	ra, 24(sp)
   14ef4: 42 64        	ld	s0, 16(sp)
   14ef6: 05 61        	addi	sp, sp, 32
   14ef8: 82 80        	ret

0000000000014efa <_ZN79_$LT$spin..mutex..MutexGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17hdb92ad2fe0b63cd6E>:
   14efa: 01 11        	addi	sp, sp, -32
   14efc: 06 ec        	sd	ra, 24(sp)
   14efe: 22 e8        	sd	s0, 16(sp)
   14f00: 00 10        	addi	s0, sp, 32
   14f02: 23 34 a4 fe  	sd	a0, -24(s0)
   14f06: 97 00 00 00  	auipc	ra, 0
   14f0a: e7 80 00 15  	jalr	336(ra)
   14f0e: e2 60        	ld	ra, 24(sp)
   14f10: 42 64        	ld	s0, 16(sp)
   14f12: 05 61        	addi	sp, sp, 32
   14f14: 82 80        	ret

0000000000014f16 <_ZN88_$LT$spin..mutex..ticket..TicketMutexGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5b61ebac5e903e8fE>:
   14f16: 39 71        	addi	sp, sp, -64
   14f18: 06 fc        	sd	ra, 56(sp)
   14f1a: 22 f8        	sd	s0, 48(sp)
   14f1c: 80 00        	addi	s0, sp, 64
   14f1e: 23 34 a4 fc  	sd	a0, -56(s0)
   14f22: 23 30 a4 fe  	sd	a0, -32(s0)
   14f26: 08 69        	ld	a0, 16(a0)
   14f28: 05 05        	addi	a0, a0, 1
   14f2a: 23 38 a4 fc  	sd	a0, -48(s0)
   14f2e: 15 c5        	beqz	a0, 0x14f5a <.Lpcrel_hi28>
   14f30: 09 a0        	j	0x14f32 <_ZN88_$LT$spin..mutex..ticket..TicketMutexGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5b61ebac5e903e8fE+0x1c>
   14f32: 83 35 04 fd  	ld	a1, -48(s0)
   14f36: 03 35 84 fc  	ld	a0, -56(s0)
   14f3a: 23 34 b4 fe  	sd	a1, -24(s0)
   14f3e: 08 61        	ld	a0, 0(a0)
   14f40: 05 46        	li	a2, 1
   14f42: a3 0f c4 fc  	sb	a2, -33(s0)
   14f46: 03 46 f4 fd  	lbu	a2, -33(s0)
   14f4a: 97 00 00 00  	auipc	ra, 0
   14f4e: e7 80 00 d3  	jalr	-720(ra)
   14f52: e2 70        	ld	ra, 56(sp)
   14f54: 42 74        	ld	s0, 48(sp)
   14f56: 21 61        	addi	sp, sp, 64
   14f58: 82 80        	ret

0000000000014f5a <.Lpcrel_hi28>:
   14f5a: 17 45 00 00  	auipc	a0, 4
   14f5e: 13 05 65 52  	addi	a0, a0, 1318

0000000000014f62 <.Lpcrel_hi29>:
   14f62: 97 45 00 00  	auipc	a1, 4
   14f66: 13 86 65 60  	addi	a2, a1, 1542
   14f6a: f1 45        	li	a1, 28
   14f6c: 97 10 00 00  	auipc	ra, 1
   14f70: e7 80 00 6e  	jalr	1760(ra)

0000000000014f74 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$14spec_next_back17h2d460b80ee27959fE>:
   14f74: 5d 71        	addi	sp, sp, -80
   14f76: 86 e4        	sd	ra, 72(sp)
   14f78: a2 e0        	sd	s0, 64(sp)
   14f7a: 80 08        	addi	s0, sp, 80
   14f7c: aa 85        	mv	a1, a0
   14f7e: 23 30 b4 fc  	sd	a1, -64(s0)
   14f82: 23 3c b4 fc  	sd	a1, -40(s0)
   14f86: 13 85 85 00  	addi	a0, a1, 8
   14f8a: 23 30 b4 fe  	sd	a1, -32(s0)
   14f8e: 23 34 a4 fe  	sd	a0, -24(s0)
   14f92: 88 61        	ld	a0, 0(a1)
   14f94: 8c 65        	ld	a1, 8(a1)
   14f96: 63 67 b5 00  	bltu	a0, a1, 0x14fa4 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$14spec_next_back17h2d460b80ee27959fE+0x30>
   14f9a: 09 a0        	j	0x14f9c <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$14spec_next_back17h2d460b80ee27959fE+0x28>
   14f9c: 01 45        	li	a0, 0
   14f9e: 23 34 a4 fc  	sd	a0, -56(s0)
   14fa2: 3d a0        	j	0x14fd0 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$14spec_next_back17h2d460b80ee27959fE+0x5c>
   14fa4: 03 35 04 fc  	ld	a0, -64(s0)
   14fa8: 08 65        	ld	a0, 8(a0)
   14faa: 85 45        	li	a1, 1
   14fac: 23 3c b4 fa  	sd	a1, -72(s0)
   14fb0: 97 00 00 00  	auipc	ra, 0
   14fb4: e7 80 60 85  	jalr	-1962(ra)
   14fb8: 83 35 04 fc  	ld	a1, -64(s0)
   14fbc: 2a 86        	mv	a2, a0
   14fbe: 03 35 84 fb  	ld	a0, -72(s0)
   14fc2: 90 e5        	sd	a2, 8(a1)
   14fc4: 8c 65        	ld	a1, 8(a1)
   14fc6: 23 38 b4 fc  	sd	a1, -48(s0)
   14fca: 23 34 a4 fc  	sd	a0, -56(s0)
   14fce: 09 a0        	j	0x14fd0 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$14spec_next_back17h2d460b80ee27959fE+0x5c>
   14fd0: 03 35 84 fc  	ld	a0, -56(s0)
   14fd4: 83 35 04 fd  	ld	a1, -48(s0)
   14fd8: a6 60        	ld	ra, 72(sp)
   14fda: 06 64        	ld	s0, 64(sp)
   14fdc: 61 61        	addi	sp, sp, 80
   14fde: 82 80        	ret

0000000000014fe0 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hfea0f5538dcfde99E>:
   14fe0: 1d 71        	addi	sp, sp, -96
   14fe2: 86 ec        	sd	ra, 88(sp)
   14fe4: a2 e8        	sd	s0, 80(sp)
   14fe6: 80 10        	addi	s0, sp, 96
   14fe8: aa 85        	mv	a1, a0
   14fea: 23 3c b4 fa  	sd	a1, -72(s0)
   14fee: 23 38 b4 fc  	sd	a1, -48(s0)
   14ff2: 13 85 85 00  	addi	a0, a1, 8
   14ff6: 23 30 b4 fe  	sd	a1, -32(s0)
   14ffa: 23 34 a4 fe  	sd	a0, -24(s0)
   14ffe: 88 61        	ld	a0, 0(a1)
   15000: 8c 65        	ld	a1, 8(a1)
   15002: 63 67 b5 00  	bltu	a0, a1, 0x15010 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hfea0f5538dcfde99E+0x30>
   15006: 09 a0        	j	0x15008 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hfea0f5538dcfde99E+0x28>
   15008: 01 45        	li	a0, 0
   1500a: 23 30 a4 fc  	sd	a0, -64(s0)
   1500e: 25 a8        	j	0x15046 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hfea0f5538dcfde99E+0x66>
   15010: 03 35 84 fb  	ld	a0, -72(s0)
   15014: 08 61        	ld	a0, 0(a0)
   15016: 23 34 a4 fa  	sd	a0, -88(s0)
   1501a: 23 3c a4 fc  	sd	a0, -40(s0)
   1501e: 85 45        	li	a1, 1
   15020: 23 38 b4 fa  	sd	a1, -80(s0)
   15024: 97 f0 ff ff  	auipc	ra, 1048575
   15028: e7 80 80 7c  	jalr	1992(ra)
   1502c: 83 36 84 fb  	ld	a3, -72(s0)
   15030: 83 35 84 fa  	ld	a1, -88(s0)
   15034: 2a 86        	mv	a2, a0
   15036: 03 35 04 fb  	ld	a0, -80(s0)
   1503a: 90 e2        	sd	a2, 0(a3)
   1503c: 23 34 b4 fc  	sd	a1, -56(s0)
   15040: 23 30 a4 fc  	sd	a0, -64(s0)
   15044: 09 a0        	j	0x15046 <_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hfea0f5538dcfde99E+0x66>
   15046: 03 35 04 fc  	ld	a0, -64(s0)
   1504a: 83 35 84 fc  	ld	a1, -56(s0)
   1504e: e6 60        	ld	ra, 88(sp)
   15050: 46 64        	ld	s0, 80(sp)
   15052: 25 61        	addi	sp, sp, 96
   15054: 82 80        	ret

0000000000015056 <_ZN93_$LT$spin..mutex..ticket..TicketMutexGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9be5414c1bbb0d9dE>:
   15056: 01 11        	addi	sp, sp, -32
   15058: 06 ec        	sd	ra, 24(sp)
   1505a: 22 e8        	sd	s0, 16(sp)
   1505c: 00 10        	addi	s0, sp, 32
   1505e: 23 34 a4 fe  	sd	a0, -24(s0)
   15062: 08 65        	ld	a0, 8(a0)
   15064: e2 60        	ld	ra, 24(sp)
   15066: 42 64        	ld	s0, 16(sp)
   15068: 05 61        	addi	sp, sp, 32
   1506a: 82 80        	ret

000000000001506c <_ZN98_$LT$core..iter..adapters..rev..Rev$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h44de2a0b7364d748E>:
   1506c: 01 11        	addi	sp, sp, -32
   1506e: 06 ec        	sd	ra, 24(sp)
   15070: 22 e8        	sd	s0, 16(sp)
   15072: 00 10        	addi	s0, sp, 32
   15074: 23 34 a4 fe  	sd	a0, -24(s0)
   15078: 97 00 00 00  	auipc	ra, 0
   1507c: e7 80 a0 b9  	jalr	-1126(ra)
   15080: e2 60        	ld	ra, 24(sp)
   15082: 42 64        	ld	s0, 16(sp)
   15084: 05 61        	addi	sp, sp, 32
   15086: 82 80        	ret

0000000000015088 <_ZN22buddy_system_allocator11linked_list10LinkedList8is_empty17he8e616cd05c38173E>:
   15088: 01 11        	addi	sp, sp, -32
   1508a: 06 ec        	sd	ra, 24(sp)
   1508c: 22 e8        	sd	s0, 16(sp)
   1508e: 00 10        	addi	s0, sp, 32
   15090: 23 34 a4 fe  	sd	a0, -24(s0)
   15094: 08 61        	ld	a0, 0(a0)
   15096: 97 00 00 00  	auipc	ra, 0
   1509a: e7 80 20 ab  	jalr	-1358(ra)
   1509e: e2 60        	ld	ra, 24(sp)
   150a0: 42 64        	ld	s0, 16(sp)
   150a2: 05 61        	addi	sp, sp, 32
   150a4: 82 80        	ret

00000000000150a6 <_ZN22buddy_system_allocator11linked_list10LinkedList4push17h93afd990520e2105E>:
   150a6: 01 11        	addi	sp, sp, -32
   150a8: 06 ec        	sd	ra, 24(sp)
   150aa: 22 e8        	sd	s0, 16(sp)
   150ac: 00 10        	addi	s0, sp, 32
   150ae: 23 30 a4 fe  	sd	a0, -32(s0)
   150b2: 23 34 b4 fe  	sd	a1, -24(s0)
   150b6: 10 61        	ld	a2, 0(a0)
   150b8: 90 e1        	sd	a2, 0(a1)
   150ba: 0c e1        	sd	a1, 0(a0)
   150bc: e2 60        	ld	ra, 24(sp)
   150be: 42 64        	ld	s0, 16(sp)
   150c0: 05 61        	addi	sp, sp, 32
   150c2: 82 80        	ret

00000000000150c4 <_ZN22buddy_system_allocator11linked_list10LinkedList3pop17hc2a0a9deb8befef1E>:
   150c4: 39 71        	addi	sp, sp, -64
   150c6: 06 fc        	sd	ra, 56(sp)
   150c8: 22 f8        	sd	s0, 48(sp)
   150ca: 80 00        	addi	s0, sp, 64
   150cc: 23 34 a4 fc  	sd	a0, -56(s0)
   150d0: 23 30 a4 fe  	sd	a0, -32(s0)
   150d4: 97 00 00 00  	auipc	ra, 0
   150d8: e7 80 40 fb  	jalr	-76(ra)
   150dc: 19 ed        	bnez	a0, 0x150fa <_ZN22buddy_system_allocator11linked_list10LinkedList3pop17hc2a0a9deb8befef1E+0x36>
   150de: 09 a0        	j	0x150e0 <_ZN22buddy_system_allocator11linked_list10LinkedList3pop17hc2a0a9deb8befef1E+0x1c>
   150e0: 03 36 84 fc  	ld	a2, -56(s0)
   150e4: 08 62        	ld	a0, 0(a2)
   150e6: 23 34 a4 fe  	sd	a0, -24(s0)
   150ea: 0c 61        	ld	a1, 0(a0)
   150ec: 0c e2        	sd	a1, 0(a2)
   150ee: 23 3c a4 fc  	sd	a0, -40(s0)
   150f2: 05 45        	li	a0, 1
   150f4: 23 38 a4 fc  	sd	a0, -48(s0)
   150f8: 29 a0        	j	0x15102 <_ZN22buddy_system_allocator11linked_list10LinkedList3pop17hc2a0a9deb8befef1E+0x3e>
   150fa: 01 45        	li	a0, 0
   150fc: 23 38 a4 fc  	sd	a0, -48(s0)
   15100: 09 a0        	j	0x15102 <_ZN22buddy_system_allocator11linked_list10LinkedList3pop17hc2a0a9deb8befef1E+0x3e>
   15102: 03 35 04 fd  	ld	a0, -48(s0)
   15106: 83 35 84 fd  	ld	a1, -40(s0)
   1510a: e2 70        	ld	ra, 56(sp)
   1510c: 42 74        	ld	s0, 48(sp)
   1510e: 21 61        	addi	sp, sp, 64
   15110: 82 80        	ret

0000000000015112 <_ZN22buddy_system_allocator11linked_list10LinkedList8iter_mut17hcb6df79a00c6d06cE>:
   15112: 01 11        	addi	sp, sp, -32
   15114: 06 ec        	sd	ra, 24(sp)
   15116: 22 e8        	sd	s0, 16(sp)
   15118: 00 10        	addi	s0, sp, 32
   1511a: 2e 86        	mv	a2, a1
   1511c: aa 85        	mv	a1, a0
   1511e: 23 34 c4 fe  	sd	a2, -24(s0)
   15122: 08 62        	ld	a0, 0(a2)
   15124: 90 e1        	sd	a2, 0(a1)
   15126: 90 e5        	sd	a2, 8(a1)
   15128: 88 e9        	sd	a0, 16(a1)
   1512a: e2 60        	ld	ra, 24(sp)
   1512c: 42 64        	ld	s0, 16(sp)
   1512e: 05 61        	addi	sp, sp, 32
   15130: 82 80        	ret

0000000000015132 <_ZN22buddy_system_allocator11linked_list8ListNode3pop17h0600c27198eed637E>:
   15132: 01 11        	addi	sp, sp, -32
   15134: 06 ec        	sd	ra, 24(sp)
   15136: 22 e8        	sd	s0, 16(sp)
   15138: 00 10        	addi	s0, sp, 32
   1513a: 23 30 a4 fe  	sd	a0, -32(s0)
   1513e: 23 34 b4 fe  	sd	a1, -24(s0)
   15142: 03 35 84 fe  	ld	a0, -24(s0)
   15146: 08 61        	ld	a0, 0(a0)
   15148: 83 35 04 fe  	ld	a1, -32(s0)
   1514c: 88 e1        	sd	a0, 0(a1)
   1514e: 03 35 84 fe  	ld	a0, -24(s0)
   15152: e2 60        	ld	ra, 24(sp)
   15154: 42 64        	ld	s0, 16(sp)
   15156: 05 61        	addi	sp, sp, 32
   15158: 82 80        	ret

000000000001515a <_ZN22buddy_system_allocator11linked_list8ListNode5value17h5a1789de21a60692E>:
   1515a: 01 11        	addi	sp, sp, -32
   1515c: 06 ec        	sd	ra, 24(sp)
   1515e: 22 e8        	sd	s0, 16(sp)
   15160: 00 10        	addi	s0, sp, 32
   15162: 23 34 a4 fe  	sd	a0, -24(s0)
   15166: 08 65        	ld	a0, 8(a0)
   15168: e2 60        	ld	ra, 24(sp)
   1516a: 42 64        	ld	s0, 16(sp)
   1516c: 05 61        	addi	sp, sp, 32
   1516e: 82 80        	ret

0000000000015170 <_ZN103_$LT$buddy_system_allocator..linked_list..IterMut$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hb89fd0f39a934b7eE>:
   15170: 39 71        	addi	sp, sp, -64
   15172: 06 fc        	sd	ra, 56(sp)
   15174: 22 f8        	sd	s0, 48(sp)
   15176: 80 00        	addi	s0, sp, 64
   15178: 23 34 b4 fc  	sd	a1, -56(s0)
   1517c: 23 38 a4 fc  	sd	a0, -48(s0)
   15180: 23 34 b4 fe  	sd	a1, -24(s0)
   15184: 88 69        	ld	a0, 16(a1)
   15186: 97 00 00 00  	auipc	ra, 0
   1518a: e7 80 20 9c  	jalr	-1598(ra)
   1518e: 15 e9        	bnez	a0, 0x151c2 <_ZN103_$LT$buddy_system_allocator..linked_list..IterMut$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hb89fd0f39a934b7eE+0x52>
   15190: 09 a0        	j	0x15192 <_ZN103_$LT$buddy_system_allocator..linked_list..IterMut$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hb89fd0f39a934b7eE+0x22>
   15192: 83 35 04 fd  	ld	a1, -48(s0)
   15196: 03 36 84 fc  	ld	a2, -56(s0)
   1519a: 14 66        	ld	a3, 8(a2)
   1519c: 08 6a        	ld	a0, 16(a2)
   1519e: 23 3c d4 fc  	sd	a3, -40(s0)
   151a2: 23 30 a4 fe  	sd	a0, -32(s0)
   151a6: 08 6a        	ld	a0, 16(a2)
   151a8: 08 e6        	sd	a0, 8(a2)
   151aa: 08 6a        	ld	a0, 16(a2)
   151ac: 08 61        	ld	a0, 0(a0)
   151ae: 08 ea        	sd	a0, 16(a2)
   151b0: 03 36 84 fd  	ld	a2, -40(s0)
   151b4: 03 35 04 fe  	ld	a0, -32(s0)
   151b8: 90 e5        	sd	a2, 8(a1)
   151ba: 88 e9        	sd	a0, 16(a1)
   151bc: 05 45        	li	a0, 1
   151be: 88 e1        	sd	a0, 0(a1)
   151c0: 31 a0        	j	0x151cc <_ZN103_$LT$buddy_system_allocator..linked_list..IterMut$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hb89fd0f39a934b7eE+0x5c>
   151c2: 83 35 04 fd  	ld	a1, -48(s0)
   151c6: 01 45        	li	a0, 0
   151c8: 88 e1        	sd	a0, 0(a1)
   151ca: 09 a0        	j	0x151cc <_ZN103_$LT$buddy_system_allocator..linked_list..IterMut$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hb89fd0f39a934b7eE+0x5c>
   151cc: e2 70        	ld	ra, 56(sp)
   151ce: 42 74        	ld	s0, 48(sp)
   151d0: 21 61        	addi	sp, sp, 64
   151d2: 82 80        	ret

00000000000151d4 <_ZN22buddy_system_allocator4Heap11add_to_heap17ha50b28f5c7f7ba48E>:
   151d4: 51 71        	addi	sp, sp, -240
   151d6: 86 f5        	sd	ra, 232(sp)
   151d8: a2 f1        	sd	s0, 224(sp)
   151da: 80 19        	addi	s0, sp, 240
   151dc: 23 3c a4 f8  	sd	a0, -104(s0)
   151e0: 23 34 b4 fa  	sd	a1, -88(s0)
   151e4: 23 38 c4 fa  	sd	a2, -80(s0)
   151e8: 23 34 a4 fc  	sd	a0, -56(s0)
   151ec: 83 35 84 fa  	ld	a1, -88(s0)
   151f0: 13 85 85 00  	addi	a0, a1, 8
   151f4: 23 30 a4 fa  	sd	a0, -96(s0)
   151f8: 63 6b b5 00  	bltu	a0, a1, 0x1520e <.Lpcrel_hi82>
   151fc: 09 a0        	j	0x151fe <_ZN22buddy_system_allocator4Heap11add_to_heap17ha50b28f5c7f7ba48E+0x2a>
   151fe: 03 35 04 fa  	ld	a0, -96(s0)
   15202: 93 05 f5 ff  	addi	a1, a0, -1
   15206: 23 38 b4 f8  	sd	a1, -112(s0)
   1520a: 0d c5        	beqz	a0, 0x15234 <.Lpcrel_hi84>
   1520c: 31 a8        	j	0x15228 <.Lpcrel_hi83+0x12>

000000000001520e <.Lpcrel_hi82>:
   1520e: 17 45 00 00  	auipc	a0, 4
   15212: 13 05 25 27  	addi	a0, a0, 626

0000000000015216 <.Lpcrel_hi83>:
   15216: 97 45 00 00  	auipc	a1, 4
   1521a: 13 86 a5 44  	addi	a2, a1, 1098
   1521e: f1 45        	li	a1, 28
   15220: 97 10 00 00  	auipc	ra, 1
   15224: e7 80 c0 42  	jalr	1068(ra)
   15228: 61 55        	li	a0, -8
   1522a: 23 34 a4 f8  	sd	a0, -120(s0)
   1522e: 01 45        	li	a0, 0
   15230: 29 e1        	bnez	a0, 0x15272 <.Lpcrel_hi86>
   15232: 39 a8        	j	0x15250 <.Lpcrel_hi85+0x14>

0000000000015234 <.Lpcrel_hi84>:
   15234: 17 45 00 00  	auipc	a0, 4
   15238: 13 05 c5 36  	addi	a0, a0, 876

000000000001523c <.Lpcrel_hi85>:
   1523c: 97 45 00 00  	auipc	a1, 4
   15240: 13 86 c5 43  	addi	a2, a1, 1084
   15244: 93 05 10 02  	li	a1, 33
   15248: 97 10 00 00  	auipc	ra, 1
   1524c: e7 80 40 40  	jalr	1028(ra)
   15250: 03 35 04 f9  	ld	a0, -112(s0)
   15254: 83 35 84 f8  	ld	a1, -120(s0)
   15258: 6d 8d        	and	a0, a0, a1
   1525a: 23 34 a4 fa  	sd	a0, -88(s0)
   1525e: 03 35 04 fb  	ld	a0, -80(s0)
   15262: 23 3c a4 f6  	sd	a0, -136(s0)
   15266: 61 55        	li	a0, -8
   15268: 23 30 a4 f8  	sd	a0, -128(s0)
   1526c: 01 45        	li	a0, 0
   1526e: 0d ed        	bnez	a0, 0x152a8 <.Lpcrel_hi88>
   15270: 31 a8        	j	0x1528c <.Lpcrel_hi87+0x12>

0000000000015272 <.Lpcrel_hi86>:
   15272: 17 45 00 00  	auipc	a0, 4
   15276: 13 05 e5 20  	addi	a0, a0, 526

000000000001527a <.Lpcrel_hi87>:
   1527a: 97 45 00 00  	auipc	a1, 4
   1527e: 13 86 65 41  	addi	a2, a1, 1046
   15282: f1 45        	li	a1, 28
   15284: 97 10 00 00  	auipc	ra, 1
   15288: e7 80 80 3c  	jalr	968(ra)
   1528c: 03 35 84 f7  	ld	a0, -136(s0)
   15290: 83 35 04 f8  	ld	a1, -128(s0)
   15294: 6d 8d        	and	a0, a0, a1
   15296: 23 38 a4 fa  	sd	a0, -80(s0)
   1529a: 83 35 84 fa  	ld	a1, -88(s0)
   1529e: 03 35 04 fb  	ld	a0, -80(s0)
   152a2: 63 7d b5 02  	bgeu	a0, a1, 0x152dc <.Lpcrel_hi91+0x12>
   152a6: 31 a8        	j	0x152c2 <.Lpcrel_hi90>

00000000000152a8 <.Lpcrel_hi88>:
   152a8: 17 45 00 00  	auipc	a0, 4
   152ac: 13 05 85 1d  	addi	a0, a0, 472

00000000000152b0 <.Lpcrel_hi89>:
   152b0: 97 45 00 00  	auipc	a1, 4
   152b4: 13 86 85 3f  	addi	a2, a1, 1016
   152b8: f1 45        	li	a1, 28
   152ba: 97 10 00 00  	auipc	ra, 1
   152be: e7 80 20 39  	jalr	914(ra)

00000000000152c2 <.Lpcrel_hi90>:
   152c2: 17 45 00 00  	auipc	a0, 4
   152c6: 13 05 e5 2b  	addi	a0, a0, 702

00000000000152ca <.Lpcrel_hi91>:
   152ca: 97 45 00 00  	auipc	a1, 4
   152ce: 13 86 65 3f  	addi	a2, a1, 1014
   152d2: f9 45        	li	a1, 30
   152d4: 97 10 00 00  	auipc	ra, 1
   152d8: e7 80 80 37  	jalr	888(ra)
   152dc: 01 45        	li	a0, 0
   152de: 23 3c a4 fa  	sd	a0, -72(s0)
   152e2: 03 35 84 fa  	ld	a0, -88(s0)
   152e6: 23 30 a4 fc  	sd	a0, -64(s0)
   152ea: 09 a0        	j	0x152ec <.Lpcrel_hi91+0x22>
   152ec: 83 35 04 fc  	ld	a1, -64(s0)
   152f0: 13 85 85 00  	addi	a0, a1, 8
   152f4: 23 38 a4 f6  	sd	a0, -144(s0)
   152f8: 63 6a b5 00  	bltu	a0, a1, 0x1530c <.Lpcrel_hi92>
   152fc: 09 a0        	j	0x152fe <.Lpcrel_hi91+0x34>
   152fe: 83 35 04 f7  	ld	a1, -144(s0)
   15302: 03 35 04 fb  	ld	a0, -80(s0)
   15306: 63 7c b5 02  	bgeu	a0, a1, 0x1533e <.Lpcrel_hi93+0x2a>
   1530a: 31 a8        	j	0x15326 <.Lpcrel_hi93+0x12>

000000000001530c <.Lpcrel_hi92>:
   1530c: 17 45 00 00  	auipc	a0, 4
   15310: 13 05 45 17  	addi	a0, a0, 372

0000000000015314 <.Lpcrel_hi93>:
   15314: 97 45 00 00  	auipc	a1, 4
   15318: 13 86 45 3c  	addi	a2, a1, 964
   1531c: f1 45        	li	a1, 28
   1531e: 97 10 00 00  	auipc	ra, 1
   15322: e7 80 e0 32  	jalr	814(ra)
   15326: 83 35 84 f9  	ld	a1, -104(s0)
   1532a: 03 35 84 fb  	ld	a0, -72(s0)
   1532e: 83 b5 05 11  	ld	a1, 272(a1)
   15332: 2e 95        	add	a0, a0, a1
   15334: 23 34 a4 f6  	sd	a0, -152(s0)
   15338: 63 69 b5 02  	bltu	a0, a1, 0x1536a <.Lpcrel_hi94>
   1533c: 29 a8        	j	0x15356 <.Lpcrel_hi93+0x42>
   1533e: 83 35 04 fc  	ld	a1, -64(s0)
   15342: 23 3c b4 f4  	sd	a1, -168(s0)
   15346: 01 45        	li	a0, 0
   15348: b3 05 b5 40  	sub	a1, a0, a1
   1534c: 23 30 b4 f6  	sd	a1, -160(s0)
   15350: 63 7e b5 04  	bgeu	a0, a1, 0x153ac <.Lpcrel_hi96>
   15354: 05 a8        	j	0x15384 <.Lpcrel_hi95+0x12>
   15356: 03 35 84 f6  	ld	a0, -152(s0)
   1535a: 83 35 84 f9  	ld	a1, -104(s0)
   1535e: 23 b8 a5 10  	sd	a0, 272(a1)
   15362: ae 70        	ld	ra, 232(sp)
   15364: 0e 74        	ld	s0, 224(sp)
   15366: 6d 61        	addi	sp, sp, 240
   15368: 82 80        	ret

000000000001536a <.Lpcrel_hi94>:
   1536a: 17 45 00 00  	auipc	a0, 4
   1536e: 13 05 65 11  	addi	a0, a0, 278

0000000000015372 <.Lpcrel_hi95>:
   15372: 97 45 00 00  	auipc	a1, 4
   15376: 13 86 e5 37  	addi	a2, a1, 894
   1537a: f1 45        	li	a1, 28
   1537c: 97 10 00 00  	auipc	ra, 1
   15380: e7 80 00 2d  	jalr	720(ra)
   15384: 03 35 84 f5  	ld	a0, -168(s0)
   15388: 83 35 04 f6  	ld	a1, -160(s0)
   1538c: 6d 8d        	and	a0, a0, a1
   1538e: 23 34 a4 f4  	sd	a0, -184(s0)
   15392: 23 38 a4 fc  	sd	a0, -48(s0)
   15396: 03 35 04 fb  	ld	a0, -80(s0)
   1539a: 83 35 04 fc  	ld	a1, -64(s0)
   1539e: 33 06 b5 40  	sub	a2, a0, a1
   153a2: 23 38 c4 f4  	sd	a2, -176(s0)
   153a6: 63 6a b5 04  	bltu	a0, a1, 0x153fa <.Lpcrel_hi98>
   153aa: 31 a8        	j	0x153c6 <.Lpcrel_hi97+0x12>

00000000000153ac <.Lpcrel_hi96>:
   153ac: 17 45 00 00  	auipc	a0, 4
   153b0: 13 05 45 0d  	addi	a0, a0, 212

00000000000153b4 <.Lpcrel_hi97>:
   153b4: 97 45 00 00  	auipc	a1, 4
   153b8: 13 86 45 35  	addi	a2, a1, 852
   153bc: f1 45        	li	a1, 28
   153be: 97 10 00 00  	auipc	ra, 1
   153c2: e7 80 e0 28  	jalr	654(ra)
   153c6: 03 35 04 f5  	ld	a0, -176(s0)
   153ca: 97 10 00 00  	auipc	ra, 1
   153ce: e7 80 40 c2  	jalr	-988(ra)
   153d2: aa 85        	mv	a1, a0
   153d4: 03 35 84 f4  	ld	a0, -184(s0)
   153d8: 97 f0 ff ff  	auipc	ra, 1048575
   153dc: e7 80 80 4a  	jalr	1192(ra)
   153e0: aa 85        	mv	a1, a0
   153e2: 23 3c b4 f2  	sd	a1, -200(s0)
   153e6: 23 3c a4 fc  	sd	a0, -40(s0)
   153ea: 83 35 84 fb  	ld	a1, -72(s0)
   153ee: 2e 95        	add	a0, a0, a1
   153f0: 23 30 a4 f4  	sd	a0, -192(s0)
   153f4: 63 64 b5 08  	bltu	a0, a1, 0x1547c <.Lpcrel_hi102>
   153f8: 39 a8        	j	0x15416 <.Lpcrel_hi99+0x14>

00000000000153fa <.Lpcrel_hi98>:
   153fa: 17 45 00 00  	auipc	a0, 4
   153fe: 13 05 65 1a  	addi	a0, a0, 422

0000000000015402 <.Lpcrel_hi99>:
   15402: 97 45 00 00  	auipc	a1, 4
   15406: 13 86 e5 31  	addi	a2, a1, 798
   1540a: 93 05 10 02  	li	a1, 33
   1540e: 97 10 00 00  	auipc	ra, 1
   15412: e7 80 e0 23  	jalr	574(ra)
   15416: 03 35 84 f3  	ld	a0, -200(s0)
   1541a: 83 35 04 f4  	ld	a1, -192(s0)
   1541e: 23 3c b4 fa  	sd	a1, -72(s0)
   15422: 23 30 a4 fe  	sd	a0, -32(s0)
   15426: 81 45        	li	a1, 0
   15428: 89 8d        	sub	a1, a1, a0
   1542a: e9 8d        	and	a1, a1, a0

000000000001542c <.Lpcrel_hi100>:
   1542c: 17 66 00 00  	auipc	a2, 6
   15430: 13 06 c6 be  	addi	a2, a2, -1044
   15434: 10 62        	ld	a2, 0(a2)
   15436: b3 85 c5 02  	mul	a1, a1, a2
   1543a: 13 d6 a5 03  	srli	a2, a1, 58

000000000001543e <.Lpcrel_hi101>:
   1543e: 97 45 00 00  	auipc	a1, 4
   15442: 93 85 25 f8  	addi	a1, a1, -126
   15446: b2 95        	add	a1, a1, a2
   15448: 83 c5 05 00  	lbu	a1, 0(a1)
   1544c: 13 06 00 04  	li	a2, 64
   15450: 23 34 c4 f2  	sd	a2, -216(s0)
   15454: 23 38 b4 f2  	sd	a1, -208(s0)
   15458: 09 e5        	bnez	a0, 0x15462 <.Lpcrel_hi101+0x24>
   1545a: 03 35 84 f2  	ld	a0, -216(s0)
   1545e: 23 38 a4 f2  	sd	a0, -208(s0)
   15462: 03 35 04 f3  	ld	a0, -208(s0)
   15466: 23 34 a4 fe  	sd	a0, -24(s0)
   1546a: 03 65 84 fe  	lwu	a0, -24(s0)
   1546e: 23 30 a4 f2  	sd	a0, -224(s0)
   15472: 93 05 00 02  	li	a1, 32
   15476: 63 60 b5 02  	bltu	a0, a1, 0x15496 <.Lpcrel_hi103+0x12>
   1547a: a1 a0        	j	0x154c2 <.Lpcrel_hi103+0x3e>

000000000001547c <.Lpcrel_hi102>:
   1547c: 17 45 00 00  	auipc	a0, 4
   15480: 13 05 45 00  	addi	a0, a0, 4

0000000000015484 <.Lpcrel_hi103>:
   15484: 97 45 00 00  	auipc	a1, 4
   15488: 13 86 45 2b  	addi	a2, a1, 692
   1548c: f1 45        	li	a1, 28
   1548e: 97 10 00 00  	auipc	ra, 1
   15492: e7 80 e0 1b  	jalr	446(ra)
   15496: 03 35 84 f9  	ld	a0, -104(s0)
   1549a: 83 35 04 f2  	ld	a1, -224(s0)
   1549e: 8e 05        	slli	a1, a1, 3
   154a0: 2e 95        	add	a0, a0, a1
   154a2: 83 35 04 fc  	ld	a1, -64(s0)
   154a6: 97 00 00 00  	auipc	ra, 0
   154aa: e7 80 00 c0  	jalr	-1024(ra)
   154ae: 03 35 84 f3  	ld	a0, -200(s0)
   154b2: 83 35 04 fc  	ld	a1, -64(s0)
   154b6: 2e 95        	add	a0, a0, a1
   154b8: 23 3c a4 f0  	sd	a0, -232(s0)
   154bc: 63 64 b5 02  	bltu	a0, a1, 0x154e4 <.Lpcrel_hi105>
   154c0: 29 a8        	j	0x154da <.Lpcrel_hi104+0x14>
   154c2: 03 35 04 f2  	ld	a0, -224(s0)

00000000000154c6 <.Lpcrel_hi104>:
   154c6: 97 45 00 00  	auipc	a1, 4
   154ca: 13 86 a5 28  	addi	a2, a1, 650
   154ce: 93 05 00 02  	li	a1, 32
   154d2: 97 10 00 00  	auipc	ra, 1
   154d6: e7 80 40 1a  	jalr	420(ra)
   154da: 03 35 84 f1  	ld	a0, -232(s0)
   154de: 23 30 a4 fc  	sd	a0, -64(s0)
   154e2: 29 b5        	j	0x152ec <.Lpcrel_hi91+0x22>

00000000000154e4 <.Lpcrel_hi105>:
   154e4: 17 45 00 00  	auipc	a0, 4
   154e8: 13 05 c5 f9  	addi	a0, a0, -100

00000000000154ec <.Lpcrel_hi106>:
   154ec: 97 45 00 00  	auipc	a1, 4
   154f0: 13 86 c5 27  	addi	a2, a1, 636
   154f4: f1 45        	li	a1, 28
   154f6: 97 10 00 00  	auipc	ra, 1
   154fa: e7 80 60 15  	jalr	342(ra)

00000000000154fe <_ZN22buddy_system_allocator4Heap4init17h0c7c0d6edd6bad17E>:
   154fe: 39 71        	addi	sp, sp, -64
   15500: 06 fc        	sd	ra, 56(sp)
   15502: 22 f8        	sd	s0, 48(sp)
   15504: 80 00        	addi	s0, sp, 64
   15506: 23 30 b4 fc  	sd	a1, -64(s0)
   1550a: 23 34 a4 fc  	sd	a0, -56(s0)
   1550e: 23 3c a4 fc  	sd	a0, -40(s0)
   15512: 23 30 b4 fe  	sd	a1, -32(s0)
   15516: 23 34 c4 fe  	sd	a2, -24(s0)
   1551a: 33 85 c5 00  	add	a0, a1, a2
   1551e: 23 38 a4 fc  	sd	a0, -48(s0)
   15522: 63 61 b5 02  	bltu	a0, a1, 0x15544 <.Lpcrel_hi107>
   15526: 09 a0        	j	0x15528 <_ZN22buddy_system_allocator4Heap4init17h0c7c0d6edd6bad17E+0x2a>
   15528: 03 36 04 fd  	ld	a2, -48(s0)
   1552c: 83 35 04 fc  	ld	a1, -64(s0)
   15530: 03 35 84 fc  	ld	a0, -56(s0)
   15534: 97 00 00 00  	auipc	ra, 0
   15538: e7 80 00 ca  	jalr	-864(ra)
   1553c: e2 70        	ld	ra, 56(sp)
   1553e: 42 74        	ld	s0, 48(sp)
   15540: 21 61        	addi	sp, sp, 64
   15542: 82 80        	ret

0000000000015544 <.Lpcrel_hi107>:
   15544: 17 45 00 00  	auipc	a0, 4
   15548: 13 05 c5 f3  	addi	a0, a0, -196

000000000001554c <.Lpcrel_hi108>:
   1554c: 97 45 00 00  	auipc	a1, 4
   15550: 13 86 45 23  	addi	a2, a1, 564
   15554: f1 45        	li	a1, 28
   15556: 97 10 00 00  	auipc	ra, 1
   1555a: e7 80 60 0f  	jalr	246(ra)

000000000001555e <_ZN22buddy_system_allocator4Heap5alloc17h941f1852fa86ea6eE>:
   1555e: 65 71        	addi	sp, sp, -400
   15560: 06 e7        	sd	ra, 392(sp)
   15562: 22 e3        	sd	s0, 384(sp)
   15564: 00 0b        	addi	s0, sp, 400
   15566: 23 34 a4 ee  	sd	a0, -280(s0)
   1556a: 23 3c b4 f0  	sd	a1, -232(s0)
   1556e: 23 30 c4 f2  	sd	a2, -224(s0)
   15572: 23 34 a4 fa  	sd	a0, -88(s0)
   15576: 13 05 84 f1  	addi	a0, s0, -232
   1557a: 23 38 a4 ee  	sd	a0, -272(s0)
   1557e: 97 f0 ff ff  	auipc	ra, 1048575
   15582: e7 80 00 7e  	jalr	2016(ra)
   15586: 97 f0 ff ff  	auipc	ra, 1048575
   1558a: e7 80 20 4a  	jalr	1186(ra)
   1558e: aa 85        	mv	a1, a0
   15590: 03 35 04 ef  	ld	a0, -272(s0)
   15594: 23 3c b4 ee  	sd	a1, -264(s0)
   15598: 97 f0 ff ff  	auipc	ra, 1048575
   1559c: e7 80 c0 7d  	jalr	2012(ra)
   155a0: a1 45        	li	a1, 8
   155a2: 97 f0 ff ff  	auipc	ra, 1048575
   155a6: e7 80 e0 2b  	jalr	702(ra)
   155aa: aa 85        	mv	a1, a0
   155ac: 03 35 84 ef  	ld	a0, -264(s0)
   155b0: 97 f0 ff ff  	auipc	ra, 1048575
   155b4: e7 80 00 2b  	jalr	688(ra)
   155b8: aa 85        	mv	a1, a0
   155ba: 23 30 b4 f0  	sd	a1, -256(s0)
   155be: 23 38 a4 fa  	sd	a0, -80(s0)
   155c2: 23 30 a4 fe  	sd	a0, -32(s0)
   155c6: 81 45        	li	a1, 0
   155c8: 89 8d        	sub	a1, a1, a0
   155ca: e9 8d        	and	a1, a1, a0

00000000000155cc <.Lpcrel_hi109>:
   155cc: 17 66 00 00  	auipc	a2, 6
   155d0: 13 06 46 a5  	addi	a2, a2, -1452
   155d4: 10 62        	ld	a2, 0(a2)
   155d6: b3 85 c5 02  	mul	a1, a1, a2
   155da: 13 d6 a5 03  	srli	a2, a1, 58

00000000000155de <.Lpcrel_hi110>:
   155de: 97 45 00 00  	auipc	a1, 4
   155e2: 93 85 25 e2  	addi	a1, a1, -478
   155e6: b2 95        	add	a1, a1, a2
   155e8: 83 c5 05 00  	lbu	a1, 0(a1)
   155ec: 13 06 00 04  	li	a2, 64
   155f0: 23 34 c4 f0  	sd	a2, -248(s0)
   155f4: 23 38 b4 f0  	sd	a1, -240(s0)
   155f8: 09 e5        	bnez	a0, 0x15602 <.Lpcrel_hi110+0x24>
   155fa: 03 35 84 f0  	ld	a0, -248(s0)
   155fe: 23 38 a4 f0  	sd	a0, -240(s0)
   15602: 03 35 04 f1  	ld	a0, -240(s0)
   15606: 23 34 a4 fe  	sd	a0, -24(s0)
   1560a: 03 65 84 fe  	lwu	a0, -24(s0)
   1560e: 23 30 a4 ee  	sd	a0, -288(s0)
   15612: 23 3c a4 fa  	sd	a0, -72(s0)
   15616: 23 38 a4 f2  	sd	a0, -208(s0)
   1561a: 13 05 00 02  	li	a0, 32
   1561e: 23 3c a4 f2  	sd	a0, -200(s0)
   15622: 03 35 04 f3  	ld	a0, -208(s0)
   15626: 83 35 84 f3  	ld	a1, -200(s0)
   1562a: 97 00 00 00  	auipc	ra, 0
   1562e: e7 80 20 89  	jalr	-1902(ra)
   15632: 23 30 a4 f4  	sd	a0, -192(s0)
   15636: 23 34 b4 f4  	sd	a1, -184(s0)
   1563a: 09 a0        	j	0x1563c <.Lpcrel_hi110+0x5e>
   1563c: 13 05 04 f4  	addi	a0, s0, -192
   15640: 97 f0 ff ff  	auipc	ra, 1048575
   15644: e7 80 60 5b  	jalr	1462(ra)
   15648: 23 38 a4 f4  	sd	a0, -176(s0)
   1564c: 23 3c b4 f4  	sd	a1, -168(s0)
   15650: 03 35 04 f5  	ld	a0, -176(s0)
   15654: 11 e5        	bnez	a0, 0x15660 <.Lpcrel_hi110+0x82>
   15656: 09 a0        	j	0x15658 <.Lpcrel_hi110+0x7a>
   15658: 01 45        	li	a0, 0
   1565a: 23 34 a4 f2  	sd	a0, -216(s0)
   1565e: 21 a8        	j	0x15676 <.Lpcrel_hi110+0x98>
   15660: 03 35 84 f5  	ld	a0, -168(s0)
   15664: 23 3c a4 ec  	sd	a0, -296(s0)
   15668: 23 30 a4 fc  	sd	a0, -64(s0)
   1566c: 93 05 00 02  	li	a1, 32
   15670: 63 69 b5 00  	bltu	a0, a1, 0x15682 <.Lpcrel_hi110+0xa4>
   15674: 1d a0        	j	0x1569a <.Lpcrel_hi110+0xbc>
   15676: 03 35 84 f2  	ld	a0, -216(s0)
   1567a: ba 60        	ld	ra, 392(sp)
   1567c: 1a 64        	ld	s0, 384(sp)
   1567e: 59 61        	addi	sp, sp, 400
   15680: 82 80        	ret
   15682: 03 35 84 ee  	ld	a0, -280(s0)
   15686: 83 35 84 ed  	ld	a1, -296(s0)
   1568a: 8e 05        	slli	a1, a1, 3
   1568c: 2e 95        	add	a0, a0, a1
   1568e: 97 00 00 00  	auipc	ra, 0
   15692: e7 80 a0 9f  	jalr	-1542(ra)
   15696: 5d f1        	bnez	a0, 0x1563c <.Lpcrel_hi110+0x5e>
   15698: 29 a8        	j	0x156b2 <.Lpcrel_hi111+0x14>
   1569a: 03 35 84 ed  	ld	a0, -296(s0)

000000000001569e <.Lpcrel_hi111>:
   1569e: 97 45 00 00  	auipc	a1, 4
   156a2: 13 86 a5 0f  	addi	a2, a1, 250
   156a6: 93 05 00 02  	li	a1, 32
   156aa: 97 10 00 00  	auipc	ra, 1
   156ae: e7 80 c0 fc  	jalr	-52(ra)
   156b2: 03 35 04 ee  	ld	a0, -288(s0)
   156b6: 05 05        	addi	a0, a0, 1
   156b8: 23 38 a4 ec  	sd	a0, -304(s0)
   156bc: 09 c9        	beqz	a0, 0x156ce <.Lpcrel_hi112>
   156be: 09 a0        	j	0x156c0 <.Lpcrel_hi111+0x22>
   156c0: 03 35 84 ed  	ld	a0, -296(s0)
   156c4: 05 05        	addi	a0, a0, 1
   156c6: 23 34 a4 ec  	sd	a0, -312(s0)
   156ca: 21 c9        	beqz	a0, 0x1571a <.Lpcrel_hi114>
   156cc: 31 a8        	j	0x156e8 <.Lpcrel_hi113+0x12>

00000000000156ce <.Lpcrel_hi112>:
   156ce: 17 45 00 00  	auipc	a0, 4
   156d2: 13 05 25 db  	addi	a0, a0, -590

00000000000156d6 <.Lpcrel_hi113>:
   156d6: 97 45 00 00  	auipc	a1, 4
   156da: 13 86 a5 0d  	addi	a2, a1, 218
   156de: f1 45        	li	a1, 28
   156e0: 97 10 00 00  	auipc	ra, 1
   156e4: e7 80 c0 f6  	jalr	-148(ra)
   156e8: 03 35 84 ec  	ld	a0, -312(s0)
   156ec: 83 35 04 ed  	ld	a1, -304(s0)
   156f0: 23 30 b4 f6  	sd	a1, -160(s0)
   156f4: 23 34 a4 f6  	sd	a0, -152(s0)
   156f8: 03 35 04 f6  	ld	a0, -160(s0)
   156fc: 83 35 84 f6  	ld	a1, -152(s0)
   15700: 97 f0 ff ff  	auipc	ra, 1048575
   15704: e7 80 e0 52  	jalr	1326(ra)
   15708: 97 f0 ff ff  	auipc	ra, 1048575
   1570c: e7 80 c0 79  	jalr	1948(ra)
   15710: 23 38 a4 f6  	sd	a0, -144(s0)
   15714: 23 3c b4 f6  	sd	a1, -136(s0)
   15718: 31 a8        	j	0x15734 <.Lpcrel_hi115+0x12>

000000000001571a <.Lpcrel_hi114>:
   1571a: 17 45 00 00  	auipc	a0, 4
   1571e: 13 05 65 d6  	addi	a0, a0, -666

0000000000015722 <.Lpcrel_hi115>:
   15722: 97 45 00 00  	auipc	a1, 4
   15726: 13 86 65 0a  	addi	a2, a1, 166
   1572a: f1 45        	li	a1, 28
   1572c: 97 10 00 00  	auipc	ra, 1
   15730: e7 80 00 f2  	jalr	-224(ra)
   15734: 13 05 04 f7  	addi	a0, s0, -144
   15738: 97 00 00 00  	auipc	ra, 0
   1573c: e7 80 40 93  	jalr	-1740(ra)
   15740: 23 30 a4 f8  	sd	a0, -128(s0)
   15744: 23 34 b4 f8  	sd	a1, -120(s0)
   15748: 03 35 04 f8  	ld	a0, -128(s0)
   1574c: 09 e9        	bnez	a0, 0x1575e <.Lpcrel_hi115+0x3c>
   1574e: 09 a0        	j	0x15750 <.Lpcrel_hi115+0x2e>
   15750: 03 35 04 ee  	ld	a0, -288(s0)
   15754: 93 05 00 02  	li	a1, 32
   15758: 63 6e b5 00  	bltu	a0, a1, 0x15774 <.Lpcrel_hi115+0x52>
   1575c: b1 a8        	j	0x157b8 <.Lpcrel_hi117+0x28>
   1575e: 03 35 84 f8  	ld	a0, -120(s0)
   15762: 23 30 a4 ec  	sd	a0, -320(s0)
   15766: 23 38 a4 fc  	sd	a0, -48(s0)
   1576a: 93 05 00 02  	li	a1, 32
   1576e: 63 60 b5 10  	bltu	a0, a1, 0x1586e <.Lpcrel_hi122+0x12>
   15772: 05 a2        	j	0x15892 <.Lpcrel_hi122+0x36>
   15774: 03 35 84 ee  	ld	a0, -280(s0)
   15778: 83 35 04 ee  	ld	a1, -288(s0)
   1577c: 8e 05        	slli	a1, a1, 3
   1577e: 2e 95        	add	a0, a0, a1
   15780: 97 00 00 00  	auipc	ra, 0
   15784: e7 80 40 94  	jalr	-1724(ra)

0000000000015788 <.Lpcrel_hi116>:
   15788: 17 46 00 00  	auipc	a2, 4
   1578c: 13 06 06 07  	addi	a2, a2, 112

0000000000015790 <.Lpcrel_hi117>:
   15790: 97 46 00 00  	auipc	a3, 4
   15794: 13 87 06 09  	addi	a4, a3, 144
   15798: 93 06 80 02  	li	a3, 40
   1579c: 97 f0 ff ff  	auipc	ra, 1048575
   157a0: e7 80 a0 5f  	jalr	1530(ra)
   157a4: 97 f0 ff ff  	auipc	ra, 1048575
   157a8: e7 80 80 3f  	jalr	1016(ra)
   157ac: 23 30 a4 fa  	sd	a0, -96(s0)
   157b0: 03 35 04 fa  	ld	a0, -96(s0)
   157b4: 11 ed        	bnez	a0, 0x157d0 <.Lpcrel_hi118+0x14>
   157b6: 99 a0        	j	0x157fc <.Lpcrel_hi118+0x40>
   157b8: 03 35 04 ee  	ld	a0, -288(s0)

00000000000157bc <.Lpcrel_hi118>:
   157bc: 97 45 00 00  	auipc	a1, 4
   157c0: 13 86 45 02  	addi	a2, a1, 36
   157c4: 93 05 00 02  	li	a1, 32
   157c8: 97 10 00 00  	auipc	ra, 1
   157cc: e7 80 e0 ea  	jalr	-338(ra)
   157d0: 03 35 04 fa  	ld	a0, -96(s0)
   157d4: 23 38 a4 ea  	sd	a0, -336(s0)
   157d8: 23 34 a4 fc  	sd	a0, -56(s0)
   157dc: 13 05 84 f1  	addi	a0, s0, -232
   157e0: 97 f0 ff ff  	auipc	ra, 1048575
   157e4: e7 80 e0 57  	jalr	1406(ra)
   157e8: 83 35 84 ee  	ld	a1, -280(s0)
   157ec: 83 b5 05 10  	ld	a1, 256(a1)
   157f0: 2e 95        	add	a0, a0, a1
   157f2: 23 3c a4 ea  	sd	a0, -328(s0)
   157f6: 63 67 b5 02  	bltu	a0, a1, 0x15824 <.Lpcrel_hi119>
   157fa: 29 a0        	j	0x15804 <.Lpcrel_hi118+0x48>
   157fc: 01 45        	li	a0, 0
   157fe: 23 34 a4 f2  	sd	a0, -216(s0)
   15802: 95 bd        	j	0x15676 <.Lpcrel_hi110+0x98>
   15804: 03 35 04 f0  	ld	a0, -256(s0)
   15808: 83 35 84 ee  	ld	a1, -280(s0)
   1580c: 03 36 84 eb  	ld	a2, -328(s0)
   15810: 23 b0 c5 10  	sd	a2, 256(a1)
   15814: 83 b5 85 10  	ld	a1, 264(a1)
   15818: 2e 95        	add	a0, a0, a1
   1581a: 23 34 a4 ea  	sd	a0, -344(s0)
   1581e: 63 6b b5 02  	bltu	a0, a1, 0x15854 <.Lpcrel_hi121>
   15822: 31 a8        	j	0x1583e <.Lpcrel_hi120+0x12>

0000000000015824 <.Lpcrel_hi119>:
   15824: 17 45 00 00  	auipc	a0, 4
   15828: 13 05 c5 c5  	addi	a0, a0, -932

000000000001582c <.Lpcrel_hi120>:
   1582c: 97 45 00 00  	auipc	a1, 4
   15830: 13 86 c5 00  	addi	a2, a1, 12
   15834: f1 45        	li	a1, 28
   15836: 97 10 00 00  	auipc	ra, 1
   1583a: e7 80 60 e1  	jalr	-490(ra)
   1583e: 03 35 04 eb  	ld	a0, -336(s0)
   15842: 83 35 84 ea  	ld	a1, -344(s0)
   15846: 03 36 84 ee  	ld	a2, -280(s0)
   1584a: 23 34 b6 10  	sd	a1, 264(a2)
   1584e: 23 34 a4 f2  	sd	a0, -216(s0)
   15852: 15 b5        	j	0x15676 <.Lpcrel_hi110+0x98>

0000000000015854 <.Lpcrel_hi121>:
   15854: 17 45 00 00  	auipc	a0, 4
   15858: 13 05 c5 c2  	addi	a0, a0, -980

000000000001585c <.Lpcrel_hi122>:
   1585c: 97 45 00 00  	auipc	a1, 4
   15860: 13 86 45 ff  	addi	a2, a1, -12
   15864: f1 45        	li	a1, 28
   15866: 97 10 00 00  	auipc	ra, 1
   1586a: e7 80 60 de  	jalr	-538(ra)
   1586e: 03 35 84 ee  	ld	a0, -280(s0)
   15872: 83 35 04 ec  	ld	a1, -320(s0)
   15876: 8e 05        	slli	a1, a1, 3
   15878: 2e 95        	add	a0, a0, a1
   1587a: 97 00 00 00  	auipc	ra, 0
   1587e: e7 80 a0 84  	jalr	-1974(ra)
   15882: 23 38 a4 f8  	sd	a0, -112(s0)
   15886: 23 3c b4 f8  	sd	a1, -104(s0)
   1588a: 03 35 04 f9  	ld	a0, -112(s0)
   1588e: 11 ed        	bnez	a0, 0x158aa <.Lpcrel_hi123+0x14>
   15890: 1d a8        	j	0x158c6 <.Lpcrel_hi123+0x30>
   15892: 03 35 04 ec  	ld	a0, -320(s0)

0000000000015896 <.Lpcrel_hi123>:
   15896: 97 45 00 00  	auipc	a1, 4
   1589a: 13 86 25 fd  	addi	a2, a1, -46
   1589e: 93 05 00 02  	li	a1, 32
   158a2: 97 10 00 00  	auipc	ra, 1
   158a6: e7 80 40 dd  	jalr	-556(ra)
   158aa: 03 35 04 ec  	ld	a0, -320(s0)
   158ae: 83 35 84 f9  	ld	a1, -104(s0)
   158b2: 23 3c b4 e8  	sd	a1, -360(s0)
   158b6: 23 3c b4 fc  	sd	a1, -40(s0)
   158ba: 93 05 f5 ff  	addi	a1, a0, -1
   158be: 23 30 b4 ea  	sd	a1, -352(s0)
   158c2: 09 cd        	beqz	a0, 0x158dc <.Lpcrel_hi124>
   158c4: 29 a0        	j	0x158ce <.Lpcrel_hi123+0x38>
   158c6: 01 45        	li	a0, 0
   158c8: 23 34 a4 f2  	sd	a0, -216(s0)
   158cc: 6d b3        	j	0x15676 <.Lpcrel_hi110+0x98>
   158ce: 03 35 04 ea  	ld	a0, -352(s0)
   158d2: 93 05 00 02  	li	a1, 32
   158d6: 63 61 b5 02  	bltu	a0, a1, 0x158f8 <.Lpcrel_hi125+0x14>
   158da: 99 a0        	j	0x15920 <.Lpcrel_hi125+0x3c>

00000000000158dc <.Lpcrel_hi124>:
   158dc: 17 45 00 00  	auipc	a0, 4
   158e0: 13 05 45 cc  	addi	a0, a0, -828

00000000000158e4 <.Lpcrel_hi125>:
   158e4: 97 45 00 00  	auipc	a1, 4
   158e8: 13 86 c5 f9  	addi	a2, a1, -100
   158ec: 93 05 10 02  	li	a1, 33
   158f0: 97 10 00 00  	auipc	ra, 1
   158f4: e7 80 c0 d5  	jalr	-676(ra)
   158f8: 03 35 04 ec  	ld	a0, -320(s0)
   158fc: 83 35 84 e9  	ld	a1, -360(s0)
   15900: 03 36 84 ee  	ld	a2, -280(s0)
   15904: 83 36 04 ea  	ld	a3, -352(s0)
   15908: 8e 06        	slli	a3, a3, 3
   1590a: 36 96        	add	a2, a2, a3
   1590c: 23 30 c4 e8  	sd	a2, -384(s0)
   15910: 23 34 b4 e8  	sd	a1, -376(s0)
   15914: 93 05 f5 ff  	addi	a1, a0, -1
   15918: 23 38 b4 e8  	sd	a1, -368(s0)
   1591c: 0d c5        	beqz	a0, 0x15946 <.Lpcrel_hi127>
   1591e: 29 a8        	j	0x15938 <.Lpcrel_hi126+0x14>
   15920: 03 35 04 ea  	ld	a0, -352(s0)

0000000000015924 <.Lpcrel_hi126>:
   15924: 97 45 00 00  	auipc	a1, 4
   15928: 13 86 45 f7  	addi	a2, a1, -140
   1592c: 93 05 00 02  	li	a1, 32
   15930: 97 10 00 00  	auipc	ra, 1
   15934: e7 80 60 d4  	jalr	-698(ra)
   15938: 03 35 04 e9  	ld	a0, -368(s0)
   1593c: 93 05 00 04  	li	a1, 64
   15940: 63 61 b5 02  	bltu	a0, a1, 0x15962 <.Lpcrel_hi128+0x14>
   15944: 25 a8        	j	0x1597c <.Lpcrel_hi129>

0000000000015946 <.Lpcrel_hi127>:
   15946: 17 45 00 00  	auipc	a0, 4
   1594a: 13 05 a5 c5  	addi	a0, a0, -934

000000000001594e <.Lpcrel_hi128>:
   1594e: 97 45 00 00  	auipc	a1, 4
   15952: 13 86 25 f6  	addi	a2, a1, -158
   15956: 93 05 10 02  	li	a1, 33
   1595a: 97 10 00 00  	auipc	ra, 1
   1595e: e7 80 20 cf  	jalr	-782(ra)
   15962: 83 35 84 e8  	ld	a1, -376(s0)
   15966: 03 36 04 e9  	ld	a2, -368(s0)
   1596a: 05 45        	li	a0, 1
   1596c: 33 15 c5 00  	sll	a0, a0, a2
   15970: 2e 95        	add	a0, a0, a1
   15972: 23 3c a4 e6  	sd	a0, -392(s0)
   15976: 63 61 b5 04  	bltu	a0, a1, 0x159b8 <.Lpcrel_hi131>
   1597a: 39 a8        	j	0x15998 <.Lpcrel_hi130+0x14>

000000000001597c <.Lpcrel_hi129>:
   1597c: 17 45 00 00  	auipc	a0, 4
   15980: 13 05 45 c5  	addi	a0, a0, -940

0000000000015984 <.Lpcrel_hi130>:
   15984: 97 45 00 00  	auipc	a1, 4
   15988: 13 86 45 f4  	addi	a2, a1, -188
   1598c: 93 05 30 02  	li	a1, 35
   15990: 97 10 00 00  	auipc	ra, 1
   15994: e7 80 c0 cb  	jalr	-836(ra)
   15998: 83 35 84 e7  	ld	a1, -392(s0)
   1599c: 03 35 04 e8  	ld	a0, -384(s0)
   159a0: 97 f0 ff ff  	auipc	ra, 1048575
   159a4: e7 80 60 70  	jalr	1798(ra)
   159a8: 03 35 04 ec  	ld	a0, -320(s0)
   159ac: 93 05 f5 ff  	addi	a1, a0, -1
   159b0: 23 38 b4 e6  	sd	a1, -400(s0)
   159b4: 15 c5        	beqz	a0, 0x159e0 <.Lpcrel_hi133>
   159b6: 31 a8        	j	0x159d2 <.Lpcrel_hi132+0x12>

00000000000159b8 <.Lpcrel_hi131>:
   159b8: 17 45 00 00  	auipc	a0, 4
   159bc: 13 05 85 ac  	addi	a0, a0, -1336

00000000000159c0 <.Lpcrel_hi132>:
   159c0: 97 45 00 00  	auipc	a1, 4
   159c4: 13 86 05 f2  	addi	a2, a1, -224
   159c8: f1 45        	li	a1, 28
   159ca: 97 10 00 00  	auipc	ra, 1
   159ce: e7 80 20 c8  	jalr	-894(ra)
   159d2: 03 35 04 e7  	ld	a0, -400(s0)
   159d6: 93 05 00 02  	li	a1, 32
   159da: 63 61 b5 02  	bltu	a0, a1, 0x159fc <.Lpcrel_hi134+0x14>
   159de: 25 a8        	j	0x15a16 <.Lpcrel_hi134+0x2e>

00000000000159e0 <.Lpcrel_hi133>:
   159e0: 17 45 00 00  	auipc	a0, 4
   159e4: 13 05 05 bc  	addi	a0, a0, -1088

00000000000159e8 <.Lpcrel_hi134>:
   159e8: 97 45 00 00  	auipc	a1, 4
   159ec: 13 86 05 f1  	addi	a2, a1, -240
   159f0: 93 05 10 02  	li	a1, 33
   159f4: 97 10 00 00  	auipc	ra, 1
   159f8: e7 80 80 c5  	jalr	-936(ra)
   159fc: 83 35 84 e9  	ld	a1, -360(s0)
   15a00: 03 35 84 ee  	ld	a0, -280(s0)
   15a04: 03 36 04 e7  	ld	a2, -400(s0)
   15a08: 0e 06        	slli	a2, a2, 3
   15a0a: 32 95        	add	a0, a0, a2
   15a0c: 97 f0 ff ff  	auipc	ra, 1048575
   15a10: e7 80 a0 69  	jalr	1690(ra)
   15a14: 05 b3        	j	0x15734 <.Lpcrel_hi115+0x12>
   15a16: 03 35 04 e7  	ld	a0, -400(s0)

0000000000015a1a <.Lpcrel_hi135>:
   15a1a: 97 45 00 00  	auipc	a1, 4
   15a1e: 13 86 65 ef  	addi	a2, a1, -266
   15a22: 93 05 00 02  	li	a1, 32
   15a26: 97 10 00 00  	auipc	ra, 1
   15a2a: e7 80 00 c5  	jalr	-944(ra)

0000000000015a2e <_ZN22buddy_system_allocator4Heap7dealloc17h11ed4ef9a48bc7c4E>:
   15a2e: 09 71        	addi	sp, sp, -384
   15a30: 86 fe        	sd	ra, 376(sp)
   15a32: a2 fa        	sd	s0, 368(sp)
   15a34: 00 03        	addi	s0, sp, 384
   15a36: 23 3c b4 ec  	sd	a1, -296(s0)
   15a3a: 23 30 a4 ee  	sd	a0, -288(s0)
   15a3e: 23 38 c4 f0  	sd	a2, -240(s0)
   15a42: 23 3c d4 f0  	sd	a3, -232(s0)
   15a46: 23 34 a4 fa  	sd	a0, -88(s0)
   15a4a: 23 38 b4 fa  	sd	a1, -80(s0)
   15a4e: 13 05 04 f1  	addi	a0, s0, -240
   15a52: 23 34 a4 ee  	sd	a0, -280(s0)
   15a56: 97 f0 ff ff  	auipc	ra, 1048575
   15a5a: e7 80 80 30  	jalr	776(ra)
   15a5e: 97 f0 ff ff  	auipc	ra, 1048575
   15a62: e7 80 a0 fc  	jalr	-54(ra)
   15a66: aa 85        	mv	a1, a0
   15a68: 03 35 84 ee  	ld	a0, -280(s0)
   15a6c: 23 38 b4 ee  	sd	a1, -272(s0)
   15a70: 97 f0 ff ff  	auipc	ra, 1048575
   15a74: e7 80 40 30  	jalr	772(ra)
   15a78: a1 45        	li	a1, 8
   15a7a: 97 f0 ff ff  	auipc	ra, 1048575
   15a7e: e7 80 60 de  	jalr	-538(ra)
   15a82: aa 85        	mv	a1, a0
   15a84: 03 35 04 ef  	ld	a0, -272(s0)
   15a88: 97 f0 ff ff  	auipc	ra, 1048575
   15a8c: e7 80 80 dd  	jalr	-552(ra)
   15a90: aa 85        	mv	a1, a0
   15a92: 23 3c b4 ee  	sd	a1, -264(s0)
   15a96: 23 3c a4 fa  	sd	a0, -72(s0)
   15a9a: 23 38 a4 fc  	sd	a0, -48(s0)
   15a9e: 81 45        	li	a1, 0
   15aa0: 89 8d        	sub	a1, a1, a0
   15aa2: e9 8d        	and	a1, a1, a0

0000000000015aa4 <.Lpcrel_hi136>:
   15aa4: 17 56 00 00  	auipc	a2, 5
   15aa8: 13 06 46 58  	addi	a2, a2, 1412
   15aac: 10 62        	ld	a2, 0(a2)
   15aae: b3 85 c5 02  	mul	a1, a1, a2
   15ab2: 13 d6 a5 03  	srli	a2, a1, 58

0000000000015ab6 <.Lpcrel_hi137>:
   15ab6: 97 45 00 00  	auipc	a1, 4
   15aba: 93 85 a5 98  	addi	a1, a1, -1654
   15abe: b2 95        	add	a1, a1, a2
   15ac0: 83 c5 05 00  	lbu	a1, 0(a1)
   15ac4: 13 06 00 04  	li	a2, 64
   15ac8: 23 30 c4 f0  	sd	a2, -256(s0)
   15acc: 23 34 b4 f0  	sd	a1, -248(s0)
   15ad0: 09 e5        	bnez	a0, 0x15ada <.Lpcrel_hi137+0x24>
   15ad2: 03 35 04 f0  	ld	a0, -256(s0)
   15ad6: 23 34 a4 f0  	sd	a0, -248(s0)
   15ada: 03 35 84 f0  	ld	a0, -248(s0)
   15ade: 23 3c a4 fc  	sd	a0, -40(s0)
   15ae2: 83 65 84 fd  	lwu	a1, -40(s0)
   15ae6: 23 38 b4 ec  	sd	a1, -304(s0)
   15aea: 23 30 b4 fc  	sd	a1, -64(s0)
   15aee: 7d 45        	li	a0, 31
   15af0: 63 6c b5 02  	bltu	a0, a1, 0x15b28 <.Lpcrel_hi137+0x72>
   15af4: 09 a0        	j	0x15af6 <.Lpcrel_hi137+0x40>
   15af6: 03 36 04 ed  	ld	a2, -304(s0)
   15afa: 83 35 84 ed  	ld	a1, -296(s0)
   15afe: 03 35 04 ee  	ld	a0, -288(s0)
   15b02: 0e 06        	slli	a2, a2, 3
   15b04: 32 95        	add	a0, a0, a2
   15b06: 23 34 b4 fe  	sd	a1, -24(s0)
   15b0a: 97 f0 ff ff  	auipc	ra, 1048575
   15b0e: e7 80 c0 59  	jalr	1436(ra)
   15b12: 83 35 84 ed  	ld	a1, -296(s0)
   15b16: 03 35 04 ed  	ld	a0, -304(s0)
   15b1a: 23 30 b4 fe  	sd	a1, -32(s0)
   15b1e: 23 30 b4 f2  	sd	a1, -224(s0)
   15b22: 23 34 a4 f2  	sd	a0, -216(s0)
   15b26: 29 a8        	j	0x15b40 <.Lpcrel_hi138+0x14>
   15b28: 03 35 04 ed  	ld	a0, -304(s0)

0000000000015b2c <.Lpcrel_hi138>:
   15b2c: 97 45 00 00  	auipc	a1, 4
   15b30: 13 86 c5 df  	addi	a2, a1, -516
   15b34: 93 05 00 02  	li	a1, 32
   15b38: 97 10 00 00  	auipc	ra, 1
   15b3c: e7 80 e0 b3  	jalr	-1218(ra)
   15b40: 03 35 84 f2  	ld	a0, -216(s0)
   15b44: 93 05 00 02  	li	a1, 32
   15b48: 63 65 b5 02  	bltu	a0, a1, 0x15b72 <.Lpcrel_hi138+0x46>
   15b4c: 09 a0        	j	0x15b4e <.Lpcrel_hi138+0x22>
   15b4e: 13 05 04 f1  	addi	a0, s0, -240
   15b52: 97 f0 ff ff  	auipc	ra, 1048575
   15b56: e7 80 c0 20  	jalr	524(ra)
   15b5a: aa 85        	mv	a1, a0
   15b5c: 03 35 04 ee  	ld	a0, -288(s0)
   15b60: 03 35 05 10  	ld	a0, 256(a0)
   15b64: 33 06 b5 40  	sub	a2, a0, a1
   15b68: 23 34 c4 ec  	sd	a2, -312(s0)
   15b6c: 63 6f b5 14  	bltu	a0, a1, 0x15cca <.Lpcrel_hi142>
   15b70: 25 aa        	j	0x15ca8 <.Lpcrel_hi141+0x86>
   15b72: 03 35 04 f2  	ld	a0, -224(s0)
   15b76: 23 3c a4 ea  	sd	a0, -328(s0)
   15b7a: 83 35 84 f2  	ld	a1, -216(s0)
   15b7e: 23 30 b4 ec  	sd	a1, -320(s0)
   15b82: 13 05 f0 03  	li	a0, 63
   15b86: 63 6b b5 02  	bltu	a0, a1, 0x15bbc <.Lpcrel_hi139>
   15b8a: 09 a0        	j	0x15b8c <.Lpcrel_hi138+0x60>
   15b8c: 03 35 84 eb  	ld	a0, -328(s0)
   15b90: 03 36 04 ec  	ld	a2, -320(s0)
   15b94: 85 45        	li	a1, 1
   15b96: b3 95 c5 00  	sll	a1, a1, a2
   15b9a: 2d 8d        	xor	a0, a0, a1
   15b9c: 23 34 a4 ea  	sd	a0, -344(s0)
   15ba0: 23 34 a4 fc  	sd	a0, -56(s0)
   15ba4: 01 45        	li	a0, 0
   15ba6: a3 0b a4 f2  	sb	a0, -201(s0)
   15baa: 03 35 84 f2  	ld	a0, -216(s0)
   15bae: 23 38 a4 ea  	sd	a0, -336(s0)
   15bb2: 93 05 00 02  	li	a1, 32
   15bb6: 63 61 b5 02  	bltu	a0, a1, 0x15bd8 <.Lpcrel_hi140+0x14>
   15bba: 95 a0        	j	0x15c1e <.Lpcrel_hi140+0x5a>

0000000000015bbc <.Lpcrel_hi139>:
   15bbc: 17 45 00 00  	auipc	a0, 4
   15bc0: 13 05 45 a1  	addi	a0, a0, -1516

0000000000015bc4 <.Lpcrel_hi140>:
   15bc4: 97 45 00 00  	auipc	a1, 4
   15bc8: 13 86 c5 d7  	addi	a2, a1, -644
   15bcc: 93 05 30 02  	li	a1, 35
   15bd0: 97 10 00 00  	auipc	ra, 1
   15bd4: e7 80 c0 a7  	jalr	-1412(ra)
   15bd8: 03 35 04 ee  	ld	a0, -288(s0)
   15bdc: 83 35 04 eb  	ld	a1, -336(s0)
   15be0: 8e 05        	slli	a1, a1, 3
   15be2: aa 95        	add	a1, a1, a0
   15be4: 13 05 04 f5  	addi	a0, s0, -176
   15be8: 23 30 a4 ea  	sd	a0, -352(s0)
   15bec: 97 f0 ff ff  	auipc	ra, 1048575
   15bf0: e7 80 60 52  	jalr	1318(ra)
   15bf4: 83 35 04 ea  	ld	a1, -352(s0)
   15bf8: 13 05 84 f3  	addi	a0, s0, -200
   15bfc: 97 f0 ff ff  	auipc	ra, 1048575
   15c00: e7 80 80 2d  	jalr	728(ra)
   15c04: 03 35 84 f4  	ld	a0, -184(s0)
   15c08: 23 3c a4 f6  	sd	a0, -136(s0)
   15c0c: 03 35 04 f4  	ld	a0, -192(s0)
   15c10: 23 38 a4 f6  	sd	a0, -144(s0)
   15c14: 03 35 84 f3  	ld	a0, -200(s0)
   15c18: 23 34 a4 f6  	sd	a0, -152(s0)
   15c1c: 29 a8        	j	0x15c36 <.Lpcrel_hi141+0x14>
   15c1e: 03 35 04 eb  	ld	a0, -336(s0)

0000000000015c22 <.Lpcrel_hi141>:
   15c22: 97 45 00 00  	auipc	a1, 4
   15c26: 13 86 65 d3  	addi	a2, a1, -714
   15c2a: 93 05 00 02  	li	a1, 32
   15c2e: 97 10 00 00  	auipc	ra, 1
   15c32: e7 80 80 a4  	jalr	-1464(ra)
   15c36: 13 05 04 f8  	addi	a0, s0, -128
   15c3a: 93 05 84 f6  	addi	a1, s0, -152
   15c3e: 97 f0 ff ff  	auipc	ra, 1048575
   15c42: e7 80 20 53  	jalr	1330(ra)
   15c46: 03 35 04 f8  	ld	a0, -128(s0)
   15c4a: 19 e5        	bnez	a0, 0x15c58 <.Lpcrel_hi141+0x36>
   15c4c: 09 a0        	j	0x15c4e <.Lpcrel_hi141+0x2c>
   15c4e: 03 45 74 f3  	lbu	a0, -201(s0)
   15c52: 05 89        	andi	a0, a0, 1
   15c54: 29 e1        	bnez	a0, 0x15c96 <.Lpcrel_hi141+0x74>
   15c56: e5 bd        	j	0x15b4e <.Lpcrel_hi138+0x22>
   15c58: 83 35 84 f8  	ld	a1, -120(s0)
   15c5c: 03 35 04 f9  	ld	a0, -112(s0)
   15c60: 23 3c b4 f8  	sd	a1, -104(s0)
   15c64: 23 30 a4 fa  	sd	a0, -96(s0)
   15c68: 13 05 84 f9  	addi	a0, s0, -104
   15c6c: 97 f0 ff ff  	auipc	ra, 1048575
   15c70: e7 80 e0 4e  	jalr	1262(ra)
   15c74: 83 35 84 ea  	ld	a1, -344(s0)
   15c78: e3 1f b5 fa  	bne	a0, a1, 0x15c36 <.Lpcrel_hi141+0x14>
   15c7c: 09 a0        	j	0x15c7e <.Lpcrel_hi141+0x5c>
   15c7e: 03 35 84 f9  	ld	a0, -104(s0)
   15c82: 83 35 04 fa  	ld	a1, -96(s0)
   15c86: 97 f0 ff ff  	auipc	ra, 1048575
   15c8a: e7 80 c0 4a  	jalr	1196(ra)
   15c8e: 05 45        	li	a0, 1
   15c90: a3 0b a4 f2  	sb	a0, -201(s0)
   15c94: 6d bf        	j	0x15c4e <.Lpcrel_hi141+0x2c>
   15c96: 03 35 84 f2  	ld	a0, -216(s0)
   15c9a: 23 3c a4 e8  	sd	a0, -360(s0)
   15c9e: 93 05 00 02  	li	a1, 32
   15ca2: 63 6a b5 06  	bltu	a0, a1, 0x15d16 <.Lpcrel_hi145+0x14>
   15ca6: 5d a0        	j	0x15d4c <.Lpcrel_hi145+0x4a>
   15ca8: 83 35 84 ef  	ld	a1, -264(s0)
   15cac: 03 35 04 ee  	ld	a0, -288(s0)
   15cb0: 03 36 84 ec  	ld	a2, -312(s0)
   15cb4: 23 30 c5 10  	sd	a2, 256(a0)
   15cb8: 03 35 85 10  	ld	a0, 264(a0)
   15cbc: 33 06 b5 40  	sub	a2, a0, a1
   15cc0: 23 38 c4 e8  	sd	a2, -368(s0)
   15cc4: 63 6b b5 02  	bltu	a0, a1, 0x15cfa <.Lpcrel_hi144>
   15cc8: 39 a8        	j	0x15ce6 <.Lpcrel_hi143+0x14>

0000000000015cca <.Lpcrel_hi142>:
   15cca: 17 45 00 00  	auipc	a0, 4
   15cce: 13 05 65 8d  	addi	a0, a0, -1834

0000000000015cd2 <.Lpcrel_hi143>:
   15cd2: 97 45 00 00  	auipc	a1, 4
   15cd6: 13 86 e5 c9  	addi	a2, a1, -866
   15cda: 93 05 10 02  	li	a1, 33
   15cde: 97 10 00 00  	auipc	ra, 1
   15ce2: e7 80 e0 96  	jalr	-1682(ra)
   15ce6: 03 35 04 e9  	ld	a0, -368(s0)
   15cea: 83 35 04 ee  	ld	a1, -288(s0)
   15cee: 23 b4 a5 10  	sd	a0, 264(a1)
   15cf2: f6 70        	ld	ra, 376(sp)
   15cf4: 56 74        	ld	s0, 368(sp)
   15cf6: 19 61        	addi	sp, sp, 384
   15cf8: 82 80        	ret

0000000000015cfa <.Lpcrel_hi144>:
   15cfa: 17 45 00 00  	auipc	a0, 4
   15cfe: 13 05 65 8a  	addi	a0, a0, -1882

0000000000015d02 <.Lpcrel_hi145>:
   15d02: 97 45 00 00  	auipc	a1, 4
   15d06: 13 86 65 c8  	addi	a2, a1, -890
   15d0a: 93 05 10 02  	li	a1, 33
   15d0e: 97 10 00 00  	auipc	ra, 1
   15d12: e7 80 e0 93  	jalr	-1730(ra)
   15d16: 03 35 04 ee  	ld	a0, -288(s0)
   15d1a: 83 35 84 e9  	ld	a1, -360(s0)
   15d1e: 8e 05        	slli	a1, a1, 3
   15d20: 2e 95        	add	a0, a0, a1
   15d22: 97 f0 ff ff  	auipc	ra, 1048575
   15d26: e7 80 20 3a  	jalr	930(ra)
   15d2a: 83 35 84 ea  	ld	a1, -344(s0)
   15d2e: 03 35 04 f2  	ld	a0, -224(s0)
   15d32: 97 f0 ff ff  	auipc	ra, 1048575
   15d36: e7 80 e0 b4  	jalr	-1202(ra)
   15d3a: 23 30 a4 f2  	sd	a0, -224(s0)
   15d3e: 03 35 84 f2  	ld	a0, -216(s0)
   15d42: 05 05        	addi	a0, a0, 1
   15d44: 23 34 a4 e8  	sd	a0, -376(s0)
   15d48: 1d c9        	beqz	a0, 0x15d7e <.Lpcrel_hi147>
   15d4a: 29 a8        	j	0x15d64 <.Lpcrel_hi146+0x14>
   15d4c: 03 35 84 e9  	ld	a0, -360(s0)

0000000000015d50 <.Lpcrel_hi146>:
   15d50: 97 45 00 00  	auipc	a1, 4
   15d54: 13 86 05 c5  	addi	a2, a1, -944
   15d58: 93 05 00 02  	li	a1, 32
   15d5c: 97 10 00 00  	auipc	ra, 1
   15d60: e7 80 a0 91  	jalr	-1766(ra)
   15d64: 03 35 84 e8  	ld	a0, -376(s0)
   15d68: 23 34 a4 f2  	sd	a0, -216(s0)
   15d6c: 03 35 84 f2  	ld	a0, -216(s0)
   15d70: 23 30 a4 e8  	sd	a0, -384(s0)
   15d74: 93 05 00 02  	li	a1, 32
   15d78: 63 60 b5 02  	bltu	a0, a1, 0x15d98 <.Lpcrel_hi148+0x12>
   15d7c: 1d a8        	j	0x15db2 <.Lpcrel_hi148+0x2c>

0000000000015d7e <.Lpcrel_hi147>:
   15d7e: 17 35 00 00  	auipc	a0, 3
   15d82: 13 05 25 70  	addi	a0, a0, 1794

0000000000015d86 <.Lpcrel_hi148>:
   15d86: 97 45 00 00  	auipc	a1, 4
   15d8a: 13 86 25 c3  	addi	a2, a1, -974
   15d8e: f1 45        	li	a1, 28
   15d90: 97 10 00 00  	auipc	ra, 1
   15d94: e7 80 c0 8b  	jalr	-1860(ra)
   15d98: 03 35 04 ee  	ld	a0, -288(s0)
   15d9c: 83 35 04 e8  	ld	a1, -384(s0)
   15da0: 8e 05        	slli	a1, a1, 3
   15da2: 2e 95        	add	a0, a0, a1
   15da4: 83 35 04 f2  	ld	a1, -224(s0)
   15da8: 97 f0 ff ff  	auipc	ra, 1048575
   15dac: e7 80 e0 2f  	jalr	766(ra)
   15db0: 41 bb        	j	0x15b40 <.Lpcrel_hi138+0x14>
   15db2: 03 35 04 e8  	ld	a0, -384(s0)

0000000000015db6 <.Lpcrel_hi149>:
   15db6: 97 45 00 00  	auipc	a1, 4
   15dba: 13 86 a5 c1  	addi	a2, a1, -998
   15dbe: 93 05 00 02  	li	a1, 32
   15dc2: 97 10 00 00  	auipc	ra, 1
   15dc6: e7 80 40 8b  	jalr	-1868(ra)

0000000000015dca <_ZN78_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..ops..deref..Deref$GT$5deref17hde282cfbab02f326E>:
   15dca: 01 11        	addi	sp, sp, -32
   15dcc: 06 ec        	sd	ra, 24(sp)
   15dce: 22 e8        	sd	s0, 16(sp)
   15dd0: 00 10        	addi	s0, sp, 32
   15dd2: 23 34 a4 fe  	sd	a0, -24(s0)
   15dd6: e2 60        	ld	ra, 24(sp)
   15dd8: 42 64        	ld	s0, 16(sp)
   15dda: 05 61        	addi	sp, sp, 32
   15ddc: 82 80        	ret

0000000000015dde <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17hd80af90d3112889bE>:
   15dde: 71 71        	addi	sp, sp, -176
   15de0: 06 f5        	sd	ra, 168(sp)
   15de2: 22 f1        	sd	s0, 160(sp)
   15de4: 00 19        	addi	s0, sp, 176
   15de6: 23 30 c4 f6  	sd	a2, -160(s0)
   15dea: 23 34 b4 f6  	sd	a1, -152(s0)
   15dee: 23 38 a4 f6  	sd	a0, -144(s0)
   15df2: 23 3c a4 f8  	sd	a0, -104(s0)
   15df6: 23 30 b4 fa  	sd	a1, -96(s0)
   15dfa: 23 34 c4 fa  	sd	a2, -88(s0)
   15dfe: 23 34 a4 fc  	sd	a0, -56(s0)
   15e02: 23 3c a4 fc  	sd	a0, -40(s0)
   15e06: 81 45        	li	a1, 0
   15e08: 23 0b b4 fc  	sb	a1, -42(s0)
   15e0c: 03 46 64 fd  	lbu	a2, -42(s0)
   15e10: 85 45        	li	a1, 1
   15e12: 97 f0 ff ff  	auipc	ra, 1048575
   15e16: e7 80 00 e9  	jalr	-368(ra)
   15e1a: aa 85        	mv	a1, a0
   15e1c: 23 3c b4 f6  	sd	a1, -136(s0)
   15e20: 23 30 a4 fe  	sd	a0, -32(s0)
   15e24: 09 a0        	j	0x15e26 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17hd80af90d3112889bE+0x48>
   15e26: 03 35 04 f7  	ld	a0, -144(s0)
   15e2a: 21 05        	addi	a0, a0, 8
   15e2c: 89 45        	li	a1, 2
   15e2e: a3 0b b4 fc  	sb	a1, -41(s0)
   15e32: 83 45 74 fd  	lbu	a1, -41(s0)
   15e36: 97 f0 ff ff  	auipc	ra, 1048575
   15e3a: e7 80 00 e2  	jalr	-480(ra)
   15e3e: 83 35 84 f7  	ld	a1, -136(s0)
   15e42: 63 08 b5 00  	beq	a0, a1, 0x15e52 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17hd80af90d3112889bE+0x74>
   15e46: 09 a0        	j	0x15e48 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17hd80af90d3112889bE+0x6a>
   15e48: 97 f0 ff ff  	auipc	ra, 1048575
   15e4c: e7 80 20 f0  	jalr	-254(ra)
   15e50: d9 bf        	j	0x15e26 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17hd80af90d3112889bE+0x48>
   15e52: 83 35 84 f7  	ld	a1, -136(s0)
   15e56: 03 35 04 f7  	ld	a0, -144(s0)
   15e5a: 13 06 85 00  	addi	a2, a0, 8
   15e5e: 41 05        	addi	a0, a0, 16
   15e60: 23 34 a4 fe  	sd	a0, -24(s0)
   15e64: 23 38 c4 fa  	sd	a2, -80(s0)
   15e68: 23 30 b4 fc  	sd	a1, -64(s0)
   15e6c: 23 3c a4 fa  	sd	a0, -72(s0)
   15e70: 03 35 04 fc  	ld	a0, -64(s0)
   15e74: 23 38 a4 f8  	sd	a0, -112(s0)
   15e78: 03 35 84 fb  	ld	a0, -72(s0)
   15e7c: 23 34 a4 f8  	sd	a0, -120(s0)
   15e80: 03 35 04 fb  	ld	a0, -80(s0)
   15e84: 23 30 a4 f8  	sd	a0, -128(s0)
   15e88: 13 05 04 f8  	addi	a0, s0, -128
   15e8c: 23 38 a4 f4  	sd	a0, -176(s0)
   15e90: 97 f0 ff ff  	auipc	ra, 1048575
   15e94: e7 80 a0 06  	jalr	106(ra)
   15e98: 83 35 84 f6  	ld	a1, -152(s0)
   15e9c: 03 36 04 f6  	ld	a2, -160(s0)
   15ea0: 97 f0 ff ff  	auipc	ra, 1048575
   15ea4: e7 80 e0 6b  	jalr	1726(ra)
   15ea8: 97 f0 ff ff  	auipc	ra, 1048575
   15eac: e7 80 c0 fb  	jalr	-68(ra)
   15eb0: 81 45        	li	a1, 0
   15eb2: 97 f0 ff ff  	auipc	ra, 1048575
   15eb6: e7 80 40 f3  	jalr	-204(ra)
   15eba: aa 85        	mv	a1, a0
   15ebc: 03 35 04 f5  	ld	a0, -176(s0)
   15ec0: 23 3c b4 f4  	sd	a1, -168(s0)
   15ec4: 97 f0 ff ff  	auipc	ra, 1048575
   15ec8: e7 80 00 ca  	jalr	-864(ra)
   15ecc: 03 35 84 f5  	ld	a0, -168(s0)
   15ed0: aa 70        	ld	ra, 168(sp)
   15ed2: 0a 74        	ld	s0, 160(sp)
   15ed4: 4d 61        	addi	sp, sp, 176
   15ed6: 82 80        	ret

0000000000015ed8 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc28_$u7b$$u7b$closure$u7d$$u7d$17h7035a4b5ec2d93b4E>:
   15ed8: 79 71        	addi	sp, sp, -48
   15eda: 06 f4        	sd	ra, 40(sp)
   15edc: 22 f0        	sd	s0, 32(sp)
   15ede: 00 18        	addi	s0, sp, 48
   15ee0: 23 30 a4 fe  	sd	a0, -32(s0)
   15ee4: 23 34 a4 fe  	sd	a0, -24(s0)
   15ee8: a2 70        	ld	ra, 40(sp)
   15eea: 02 74        	ld	s0, 32(sp)
   15eec: 45 61        	addi	sp, sp, 48
   15eee: 82 80        	ret

0000000000015ef0 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h0de3fbe62fbadd21E>:
   15ef0: 31 71        	addi	sp, sp, -192
   15ef2: 06 fd        	sd	ra, 184(sp)
   15ef4: 22 f9        	sd	s0, 176(sp)
   15ef6: 80 01        	addi	s0, sp, 192
   15ef8: 23 38 d4 f4  	sd	a3, -176(s0)
   15efc: 23 3c c4 f4  	sd	a2, -168(s0)
   15f00: 23 30 b4 f6  	sd	a1, -160(s0)
   15f04: 23 34 a4 f6  	sd	a0, -152(s0)
   15f08: 23 38 a4 f8  	sd	a0, -112(s0)
   15f0c: 23 3c b4 f8  	sd	a1, -104(s0)
   15f10: 23 30 c4 fa  	sd	a2, -96(s0)
   15f14: 23 34 d4 fa  	sd	a3, -88(s0)
   15f18: 23 34 a4 fc  	sd	a0, -56(s0)
   15f1c: 23 3c a4 fc  	sd	a0, -40(s0)
   15f20: 81 45        	li	a1, 0
   15f22: 23 0b b4 fc  	sb	a1, -42(s0)
   15f26: 03 46 64 fd  	lbu	a2, -42(s0)
   15f2a: 85 45        	li	a1, 1
   15f2c: 97 f0 ff ff  	auipc	ra, 1048575
   15f30: e7 80 60 d7  	jalr	-650(ra)
   15f34: aa 85        	mv	a1, a0
   15f36: 23 38 b4 f6  	sd	a1, -144(s0)
   15f3a: 23 30 a4 fe  	sd	a0, -32(s0)
   15f3e: 09 a0        	j	0x15f40 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h0de3fbe62fbadd21E+0x50>
   15f40: 03 35 84 f6  	ld	a0, -152(s0)
   15f44: 21 05        	addi	a0, a0, 8
   15f46: 89 45        	li	a1, 2
   15f48: a3 0b b4 fc  	sb	a1, -41(s0)
   15f4c: 83 45 74 fd  	lbu	a1, -41(s0)
   15f50: 97 f0 ff ff  	auipc	ra, 1048575
   15f54: e7 80 60 d0  	jalr	-762(ra)
   15f58: 83 35 04 f7  	ld	a1, -144(s0)
   15f5c: 63 08 b5 00  	beq	a0, a1, 0x15f6c <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h0de3fbe62fbadd21E+0x7c>
   15f60: 09 a0        	j	0x15f62 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h0de3fbe62fbadd21E+0x72>
   15f62: 97 f0 ff ff  	auipc	ra, 1048575
   15f66: e7 80 80 de  	jalr	-536(ra)
   15f6a: d9 bf        	j	0x15f40 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h0de3fbe62fbadd21E+0x50>
   15f6c: 83 35 04 f7  	ld	a1, -144(s0)
   15f70: 03 35 84 f6  	ld	a0, -152(s0)
   15f74: 13 06 85 00  	addi	a2, a0, 8
   15f78: 41 05        	addi	a0, a0, 16
   15f7a: 23 34 a4 fe  	sd	a0, -24(s0)
   15f7e: 23 38 c4 fa  	sd	a2, -80(s0)
   15f82: 23 30 b4 fc  	sd	a1, -64(s0)
   15f86: 23 3c a4 fa  	sd	a0, -72(s0)
   15f8a: 03 35 04 fc  	ld	a0, -64(s0)
   15f8e: 23 34 a4 f8  	sd	a0, -120(s0)
   15f92: 03 35 84 fb  	ld	a0, -72(s0)
   15f96: 23 30 a4 f8  	sd	a0, -128(s0)
   15f9a: 03 35 04 fb  	ld	a0, -80(s0)
   15f9e: 23 3c a4 f6  	sd	a0, -136(s0)
   15fa2: 13 05 84 f7  	addi	a0, s0, -136
   15fa6: 23 34 a4 f4  	sd	a0, -184(s0)
   15faa: 97 f0 ff ff  	auipc	ra, 1048575
   15fae: e7 80 00 f5  	jalr	-176(ra)
   15fb2: aa 85        	mv	a1, a0
   15fb4: 03 35 04 f6  	ld	a0, -160(s0)
   15fb8: 23 30 b4 f4  	sd	a1, -192(s0)
   15fbc: 97 f0 ff ff  	auipc	ra, 1048575
   15fc0: e7 80 40 bc  	jalr	-1084(ra)
   15fc4: 03 36 84 f5  	ld	a2, -168(s0)
   15fc8: 83 36 04 f5  	ld	a3, -176(s0)
   15fcc: aa 85        	mv	a1, a0
   15fce: 03 35 04 f4  	ld	a0, -192(s0)
   15fd2: 97 00 00 00  	auipc	ra, 0
   15fd6: e7 80 c0 a5  	jalr	-1444(ra)
   15fda: 03 35 84 f4  	ld	a0, -184(s0)
   15fde: 97 f0 ff ff  	auipc	ra, 1048575
   15fe2: e7 80 60 b8  	jalr	-1146(ra)
   15fe6: ea 70        	ld	ra, 184(sp)
   15fe8: 4a 74        	ld	s0, 176(sp)
   15fea: 29 61        	addi	sp, sp, 192
   15fec: 82 80        	ret

0000000000015fee <_ZN22buddy_system_allocator17prev_power_of_two17h5686c7eba5863641E>:
   15fee: 5d 71        	addi	sp, sp, -80
   15ff0: 86 e4        	sd	ra, 72(sp)
   15ff2: a2 e0        	sd	s0, 64(sp)
   15ff4: 80 08        	addi	s0, sp, 80
   15ff6: 23 34 a4 fc  	sd	a0, -56(s0)
   15ffa: 23 3c a4 fc  	sd	a0, -40(s0)
   15ffe: 13 05 00 04  	li	a0, 64
   16002: 23 38 a4 fc  	sd	a0, -48(s0)
   16006: 01 45        	li	a0, 0
   16008: 45 e5        	bnez	a0, 0x160b0 <.Lpcrel_hi155>
   1600a: 09 a0        	j	0x1600c <_ZN22buddy_system_allocator17prev_power_of_two17h5686c7eba5863641E+0x1e>
   1600c: 03 35 04 fd  	ld	a0, -48(s0)
   16010: 83 35 84 fc  	ld	a1, -56(s0)
   16014: 23 30 b4 fe  	sd	a1, -32(s0)
   16018: 13 d6 15 00  	srli	a2, a1, 1
   1601c: d1 8d        	or	a1, a1, a2
   1601e: 13 d6 25 00  	srli	a2, a1, 2
   16022: d1 8d        	or	a1, a1, a2
   16024: 13 d6 45 00  	srli	a2, a1, 4
   16028: d1 8d        	or	a1, a1, a2
   1602a: 13 d6 85 00  	srli	a2, a1, 8
   1602e: d1 8d        	or	a1, a1, a2
   16030: 13 d6 05 01  	srli	a2, a1, 16
   16034: d1 8d        	or	a1, a1, a2
   16036: 13 d6 05 02  	srli	a2, a1, 32
   1603a: d1 8d        	or	a1, a1, a2
   1603c: 93 c5 f5 ff  	not	a1, a1
   16040: 13 d6 15 00  	srli	a2, a1, 1
   16044: b7 56 55 55  	lui	a3, 349525
   16048: 9b 86 56 55  	addiw	a3, a3, 1365
   1604c: 13 97 06 02  	slli	a4, a3, 32
   16050: ba 96        	add	a3, a3, a4
   16052: 75 8e        	and	a2, a2, a3
   16054: 33 86 c5 40  	sub	a2, a1, a2
   16058: b7 35 33 33  	lui	a1, 209715
   1605c: 9b 85 35 33  	addiw	a1, a1, 819
   16060: 93 96 05 02  	slli	a3, a1, 32
   16064: ae 96        	add	a3, a3, a1
   16066: b3 75 d6 00  	and	a1, a2, a3
   1606a: 09 82        	srli	a2, a2, 2
   1606c: 75 8e        	and	a2, a2, a3
   1606e: b2 95        	add	a1, a1, a2
   16070: 13 d6 45 00  	srli	a2, a1, 4
   16074: b2 95        	add	a1, a1, a2
   16076: 37 16 0f 0f  	lui	a2, 61681
   1607a: 1b 06 f6 f0  	addiw	a2, a2, -241
   1607e: 93 16 06 02  	slli	a3, a2, 32
   16082: 36 96        	add	a2, a2, a3
   16084: f1 8d        	and	a1, a1, a2
   16086: 37 06 01 01  	lui	a2, 4112
   1608a: 1b 06 16 10  	addiw	a2, a2, 257
   1608e: 93 16 06 02  	slli	a3, a2, 32
   16092: 36 96        	add	a2, a2, a3
   16094: b3 85 c5 02  	mul	a1, a1, a2
   16098: e1 91        	srli	a1, a1, 56
   1609a: 23 34 b4 fe  	sd	a1, -24(s0)
   1609e: 83 65 84 fe  	lwu	a1, -24(s0)
   160a2: 33 06 b5 40  	sub	a2, a0, a1
   160a6: 23 30 c4 fc  	sd	a2, -64(s0)
   160aa: 63 69 b5 02  	bltu	a0, a1, 0x160dc <.Lpcrel_hi157>
   160ae: 39 a8        	j	0x160cc <.Lpcrel_hi156+0x14>

00000000000160b0 <.Lpcrel_hi155>:
   160b0: 17 45 00 00  	auipc	a0, 4
   160b4: 13 05 05 95  	addi	a0, a0, -1712

00000000000160b8 <.Lpcrel_hi156>:
   160b8: 97 45 00 00  	auipc	a1, 4
   160bc: 13 86 05 93  	addi	a2, a1, -1744
   160c0: 93 05 10 02  	li	a1, 33
   160c4: 97 00 00 00  	auipc	ra, 0
   160c8: e7 80 80 58  	jalr	1416(ra)
   160cc: 03 35 04 fc  	ld	a0, -64(s0)
   160d0: 93 05 f5 ff  	addi	a1, a0, -1
   160d4: 23 3c b4 fa  	sd	a1, -72(s0)
   160d8: 1d c5        	beqz	a0, 0x16106 <.Lpcrel_hi159>
   160da: 39 a8        	j	0x160f8 <.Lpcrel_hi158+0x14>

00000000000160dc <.Lpcrel_hi157>:
   160dc: 17 35 00 00  	auipc	a0, 3
   160e0: 13 05 45 4c  	addi	a0, a0, 1220

00000000000160e4 <.Lpcrel_hi158>:
   160e4: 97 45 00 00  	auipc	a1, 4
   160e8: 13 86 45 90  	addi	a2, a1, -1788
   160ec: 93 05 10 02  	li	a1, 33
   160f0: 97 00 00 00  	auipc	ra, 0
   160f4: e7 80 c0 55  	jalr	1372(ra)
   160f8: 03 35 84 fb  	ld	a0, -72(s0)
   160fc: 93 05 00 04  	li	a1, 64
   16100: 63 61 b5 02  	bltu	a0, a1, 0x16122 <.Lpcrel_hi160+0x14>
   16104: 05 a8        	j	0x16134 <.Lpcrel_hi161>

0000000000016106 <.Lpcrel_hi159>:
   16106: 17 35 00 00  	auipc	a0, 3
   1610a: 13 05 a5 49  	addi	a0, a0, 1178

000000000001610e <.Lpcrel_hi160>:
   1610e: 97 45 00 00  	auipc	a1, 4
   16112: 13 86 a5 91  	addi	a2, a1, -1766
   16116: 93 05 10 02  	li	a1, 33
   1611a: 97 00 00 00  	auipc	ra, 0
   1611e: e7 80 20 53  	jalr	1330(ra)
   16122: 83 35 84 fb  	ld	a1, -72(s0)
   16126: 05 45        	li	a0, 1
   16128: 33 15 b5 00  	sll	a0, a0, a1
   1612c: a6 60        	ld	ra, 72(sp)
   1612e: 06 64        	ld	s0, 64(sp)
   16130: 61 61        	addi	sp, sp, 80
   16132: 82 80        	ret

0000000000016134 <.Lpcrel_hi161>:
   16134: 17 35 00 00  	auipc	a0, 3
   16138: 13 05 c5 49  	addi	a0, a0, 1180

000000000001613c <.Lpcrel_hi162>:
   1613c: 97 45 00 00  	auipc	a1, 4
   16140: 13 86 45 90  	addi	a2, a1, -1788
   16144: 93 05 30 02  	li	a1, 35
   16148: 97 00 00 00  	auipc	ra, 0
   1614c: e7 80 40 50  	jalr	1284(ra)

0000000000016150 <_ZN4core3fmt9Arguments9new_const17h69adcd92eb326b0cE>:
   16150: 59 71        	addi	sp, sp, -112
   16152: 86 f4        	sd	ra, 104(sp)
   16154: a2 f0        	sd	s0, 96(sp)
   16156: 80 18        	addi	s0, sp, 112
   16158: 23 3c c4 f8  	sd	a2, -104(s0)
   1615c: 23 30 b4 fa  	sd	a1, -96(s0)
   16160: 23 34 a4 fa  	sd	a0, -88(s0)
   16164: 23 30 b4 fe  	sd	a1, -32(s0)
   16168: 23 34 c4 fe  	sd	a2, -24(s0)
   1616c: 05 45        	li	a0, 1
   1616e: 63 6e c5 02  	bltu	a0, a2, 0x161aa <.Lpcrel_hi2>
   16172: 09 a0        	j	0x16174 <_ZN4core3fmt9Arguments9new_const17h69adcd92eb326b0cE+0x24>
   16174: 83 35 84 fa  	ld	a1, -88(s0)
   16178: 03 35 84 f9  	ld	a0, -104(s0)
   1617c: 03 36 04 fa  	ld	a2, -96(s0)
   16180: 90 e1        	sd	a2, 0(a1)
   16182: 88 e5        	sd	a0, 8(a1)

0000000000016184 <.Lpcrel_hi0>:
   16184: 17 25 00 00  	auipc	a0, 2
   16188: 13 05 c5 e9  	addi	a0, a0, -356
   1618c: 10 61        	ld	a2, 0(a0)
   1618e: 08 65        	ld	a0, 8(a0)
   16190: 90 f1        	sd	a2, 32(a1)
   16192: 88 f5        	sd	a0, 40(a1)

0000000000016194 <.Lpcrel_hi1>:
   16194: 17 45 00 00  	auipc	a0, 4
   16198: 13 05 45 91  	addi	a0, a0, -1772
   1619c: 88 e9        	sd	a0, 16(a1)
   1619e: 01 45        	li	a0, 0
   161a0: 88 ed        	sd	a0, 24(a1)
   161a2: a6 70        	ld	ra, 104(sp)
   161a4: 06 74        	ld	s0, 96(sp)
   161a6: 65 61        	addi	sp, sp, 112
   161a8: 82 80        	ret

00000000000161aa <.Lpcrel_hi2>:
   161aa: 17 45 00 00  	auipc	a0, 4
   161ae: 93 05 e5 90  	addi	a1, a0, -1778
   161b2: 13 05 04 fb  	addi	a0, s0, -80
   161b6: 23 38 a4 f8  	sd	a0, -112(s0)
   161ba: 05 46        	li	a2, 1
   161bc: 97 00 00 00  	auipc	ra, 0
   161c0: e7 80 40 f9  	jalr	-108(ra)
   161c4: 03 35 04 f9  	ld	a0, -112(s0)

00000000000161c8 <.Lpcrel_hi3>:
   161c8: 97 45 00 00  	auipc	a1, 4
   161cc: 93 85 05 95  	addi	a1, a1, -1712
   161d0: 97 00 00 00  	auipc	ra, 0
   161d4: e7 80 00 45  	jalr	1104(ra)

00000000000161d8 <_ZN4core4sync6atomic11atomic_load17h2f2f932fa6412b93E>:
   161d8: 69 71        	addi	sp, sp, -304
   161da: 06 f6        	sd	ra, 296(sp)
   161dc: 22 f2        	sd	s0, 288(sp)
   161de: 00 1a        	addi	s0, sp, 304
   161e0: 23 34 a4 ee  	sd	a0, -280(s0)
   161e4: a3 0f b4 ee  	sb	a1, -257(s0)
   161e8: 23 34 a4 fc  	sd	a0, -56(s0)
   161ec: 03 45 f4 ef  	lbu	a0, -257(s0)
   161f0: 23 38 a4 ee  	sd	a0, -272(s0)
   161f4: 03 35 04 ef  	ld	a0, -272(s0)
   161f8: 0e 05        	slli	a0, a0, 3

00000000000161fa <.Lpcrel_hi5>:
   161fa: 97 45 00 00  	auipc	a1, 4
   161fe: 93 85 e5 85  	addi	a1, a1, -1954
   16202: 2e 95        	add	a0, a0, a1
   16204: 08 61        	ld	a0, 0(a0)
   16206: 02 85        	jr	a0
   16208: 00 00        	unimp

000000000001620a <.LBB8_3>:
   1620a: 03 35 84 ee  	ld	a0, -280(s0)
   1620e: 08 61        	ld	a0, 0(a0)
   16210: 23 30 a4 f0  	sd	a0, -256(s0)
   16214: 99 a8        	j	0x1626a <.LBB8_7+0x14>

0000000000016216 <.Lpcrel_hi6>:
   16216: 17 45 00 00  	auipc	a0, 4
   1621a: 13 05 25 94  	addi	a0, a0, -1726
   1621e: 23 38 a4 fc  	sd	a0, -48(s0)
   16222: 05 45        	li	a0, 1
   16224: 23 3c a4 fc  	sd	a0, -40(s0)
   16228: 01 45        	li	a0, 0
   1622a: 41 ed        	bnez	a0, 0x162c2 <.Lpcrel_hi12>
   1622c: a9 a0        	j	0x16276 <.Lpcrel_hi8>

000000000001622e <.LBB8_5>:
   1622e: 03 35 84 ee  	ld	a0, -280(s0)
   16232: 08 61        	ld	a0, 0(a0)
   16234: 0f 00 30 02  	fence	r, rw
   16238: 23 30 a4 f0  	sd	a0, -256(s0)
   1623c: 3d a0        	j	0x1626a <.LBB8_7+0x14>

000000000001623e <.Lpcrel_hi7>:
   1623e: 17 45 00 00  	auipc	a0, 4
   16242: 13 05 a5 9c  	addi	a0, a0, -1590
   16246: 23 30 a4 fe  	sd	a0, -32(s0)
   1624a: 05 45        	li	a0, 1
   1624c: 23 34 a4 fe  	sd	a0, -24(s0)
   16250: 01 45        	li	a0, 0
   16252: 6d e5        	bnez	a0, 0x1633c <.Lpcrel_hi18>
   16254: 71 a8        	j	0x162f0 <.Lpcrel_hi14>

0000000000016256 <.LBB8_7>:
   16256: 03 35 84 ee  	ld	a0, -280(s0)
   1625a: 0f 00 30 03  	fence	rw, rw
   1625e: 08 61        	ld	a0, 0(a0)
   16260: 0f 00 30 02  	fence	r, rw
   16264: 23 30 a4 f0  	sd	a0, -256(s0)
   16268: 09 a0        	j	0x1626a <.LBB8_7+0x14>
   1626a: 03 35 04 f0  	ld	a0, -256(s0)
   1626e: b2 70        	ld	ra, 296(sp)
   16270: 12 74        	ld	s0, 288(sp)
   16272: 55 61        	addi	sp, sp, 304
   16274: 82 80        	ret

0000000000016276 <.Lpcrel_hi8>:
   16276: 17 45 00 00  	auipc	a0, 4
   1627a: 13 05 25 8e  	addi	a0, a0, -1822
   1627e: 23 34 a4 f0  	sd	a0, -248(s0)
   16282: 05 45        	li	a0, 1
   16284: 23 38 a4 f0  	sd	a0, -240(s0)

0000000000016288 <.Lpcrel_hi9>:
   16288: 17 25 00 00  	auipc	a0, 2
   1628c: 13 05 85 d9  	addi	a0, a0, -616
   16290: 0c 61        	ld	a1, 0(a0)
   16292: 08 65        	ld	a0, 8(a0)
   16294: 23 34 b4 f2  	sd	a1, -216(s0)
   16298: 23 38 a4 f2  	sd	a0, -208(s0)

000000000001629c <.Lpcrel_hi10>:
   1629c: 17 45 00 00  	auipc	a0, 4
   162a0: 13 05 c5 80  	addi	a0, a0, -2036
   162a4: 23 3c a4 f0  	sd	a0, -232(s0)
   162a8: 01 45        	li	a0, 0
   162aa: 23 30 a4 f2  	sd	a0, -224(s0)

00000000000162ae <.Lpcrel_hi11>:
   162ae: 17 45 00 00  	auipc	a0, 4
   162b2: 93 05 a5 90  	addi	a1, a0, -1782
   162b6: 13 05 84 f0  	addi	a0, s0, -248
   162ba: 97 00 00 00  	auipc	ra, 0
   162be: e7 80 60 36  	jalr	870(ra)

00000000000162c2 <.Lpcrel_hi12>:
   162c2: 17 35 00 00  	auipc	a0, 3
   162c6: 93 05 65 7f  	addi	a1, a0, 2038
   162ca: 13 05 84 f9  	addi	a0, s0, -104
   162ce: 23 30 a4 ee  	sd	a0, -288(s0)
   162d2: 05 46        	li	a2, 1
   162d4: 97 00 00 00  	auipc	ra, 0
   162d8: e7 80 c0 e7  	jalr	-388(ra)
   162dc: 03 35 04 ee  	ld	a0, -288(s0)

00000000000162e0 <.Lpcrel_hi13>:
   162e0: 97 45 00 00  	auipc	a1, 4
   162e4: 93 85 85 83  	addi	a1, a1, -1992
   162e8: 97 00 00 00  	auipc	ra, 0
   162ec: e7 80 80 33  	jalr	824(ra)

00000000000162f0 <.Lpcrel_hi14>:
   162f0: 17 45 00 00  	auipc	a0, 4
   162f4: 13 05 85 91  	addi	a0, a0, -1768
   162f8: 23 3c a4 f2  	sd	a0, -200(s0)
   162fc: 05 45        	li	a0, 1
   162fe: 23 30 a4 f4  	sd	a0, -192(s0)

0000000000016302 <.Lpcrel_hi15>:
   16302: 17 25 00 00  	auipc	a0, 2
   16306: 13 05 e5 d1  	addi	a0, a0, -738
   1630a: 0c 61        	ld	a1, 0(a0)
   1630c: 08 65        	ld	a0, 8(a0)
   1630e: 23 3c b4 f4  	sd	a1, -168(s0)
   16312: 23 30 a4 f6  	sd	a0, -160(s0)

0000000000016316 <.Lpcrel_hi16>:
   16316: 17 35 00 00  	auipc	a0, 3
   1631a: 13 05 25 79  	addi	a0, a0, 1938
   1631e: 23 34 a4 f4  	sd	a0, -184(s0)
   16322: 01 45        	li	a0, 0
   16324: 23 38 a4 f4  	sd	a0, -176(s0)

0000000000016328 <.Lpcrel_hi17>:
   16328: 17 45 00 00  	auipc	a0, 4
   1632c: 93 05 05 8f  	addi	a1, a0, -1808
   16330: 13 05 84 f3  	addi	a0, s0, -200
   16334: 97 00 00 00  	auipc	ra, 0
   16338: e7 80 c0 2e  	jalr	748(ra)

000000000001633c <.Lpcrel_hi18>:
   1633c: 17 35 00 00  	auipc	a0, 3
   16340: 93 05 c5 77  	addi	a1, a0, 1916
   16344: 13 05 84 f6  	addi	a0, s0, -152
   16348: 23 3c a4 ec  	sd	a0, -296(s0)
   1634c: 05 46        	li	a2, 1
   1634e: 97 00 00 00  	auipc	ra, 0
   16352: e7 80 20 e0  	jalr	-510(ra)
   16356: 03 35 84 ed  	ld	a0, -296(s0)

000000000001635a <.Lpcrel_hi19>:
   1635a: 97 35 00 00  	auipc	a1, 3
   1635e: 93 85 e5 7b  	addi	a1, a1, 1982
   16362: 97 00 00 00  	auipc	ra, 0
   16366: e7 80 e0 2b  	jalr	702(ra)

000000000001636a <_ZN4core4sync6atomic12atomic_store17h724b1d0e414113c8E>:
   1636a: 69 71        	addi	sp, sp, -304
   1636c: 06 f6        	sd	ra, 296(sp)
   1636e: 22 f2        	sd	s0, 288(sp)
   16370: 00 1a        	addi	s0, sp, 304
   16372: 23 30 b4 ee  	sd	a1, -288(s0)
   16376: 23 34 a4 ee  	sd	a0, -280(s0)
   1637a: a3 0f c4 ee  	sb	a2, -257(s0)
   1637e: 23 30 a4 fc  	sd	a0, -64(s0)
   16382: 23 34 b4 fc  	sd	a1, -56(s0)
   16386: 03 45 f4 ef  	lbu	a0, -257(s0)
   1638a: 23 38 a4 ee  	sd	a0, -272(s0)
   1638e: 03 35 04 ef  	ld	a0, -272(s0)
   16392: 0e 05        	slli	a0, a0, 3

0000000000016394 <.Lpcrel_hi20>:
   16394: 97 35 00 00  	auipc	a1, 3
   16398: 93 85 c5 6e  	addi	a1, a1, 1772
   1639c: 2e 95        	add	a0, a0, a1
   1639e: 08 61        	ld	a0, 0(a0)
   163a0: 02 85        	jr	a0
   163a2: 00 00        	unimp

00000000000163a4 <.LBB9_3>:
   163a4: 03 35 04 ee  	ld	a0, -288(s0)
   163a8: 83 35 84 ee  	ld	a1, -280(s0)
   163ac: 88 e1        	sd	a0, 0(a1)
   163ae: 89 a8        	j	0x16400 <.LBB9_7+0x10>

00000000000163b0 <.LBB9_4>:
   163b0: 03 35 04 ee  	ld	a0, -288(s0)
   163b4: 83 35 84 ee  	ld	a1, -280(s0)
   163b8: 0f 00 10 03  	fence	rw, w
   163bc: 88 e1        	sd	a0, 0(a1)
   163be: 89 a0        	j	0x16400 <.LBB9_7+0x10>

00000000000163c0 <.Lpcrel_hi21>:
   163c0: 17 45 00 00  	auipc	a0, 4
   163c4: 13 05 05 8a  	addi	a0, a0, -1888
   163c8: 23 38 a4 fc  	sd	a0, -48(s0)
   163cc: 05 45        	li	a0, 1
   163ce: 23 3c a4 fc  	sd	a0, -40(s0)
   163d2: 01 45        	li	a0, 0
   163d4: 41 e1        	bnez	a0, 0x16454 <.Lpcrel_hi27>
   163d6: 0d a8        	j	0x16408 <.Lpcrel_hi23>

00000000000163d8 <.Lpcrel_hi22>:
   163d8: 17 45 00 00  	auipc	a0, 4
   163dc: 13 05 85 8e  	addi	a0, a0, -1816
   163e0: 23 30 a4 fe  	sd	a0, -32(s0)
   163e4: 05 45        	li	a0, 1
   163e6: 23 34 a4 fe  	sd	a0, -24(s0)
   163ea: 01 45        	li	a0, 0
   163ec: 6d e1        	bnez	a0, 0x164ce <.Lpcrel_hi33>
   163ee: 51 a8        	j	0x16482 <.Lpcrel_hi29>

00000000000163f0 <.LBB9_7>:
   163f0: 03 35 04 ee  	ld	a0, -288(s0)
   163f4: 83 35 84 ee  	ld	a1, -280(s0)
   163f8: 0f 00 10 03  	fence	rw, w
   163fc: 88 e1        	sd	a0, 0(a1)
   163fe: 09 a0        	j	0x16400 <.LBB9_7+0x10>
   16400: b2 70        	ld	ra, 296(sp)
   16402: 12 74        	ld	s0, 288(sp)
   16404: 55 61        	addi	sp, sp, 304
   16406: 82 80        	ret

0000000000016408 <.Lpcrel_hi23>:
   16408: 17 45 00 00  	auipc	a0, 4
   1640c: 13 05 85 85  	addi	a0, a0, -1960
   16410: 23 30 a4 f0  	sd	a0, -256(s0)
   16414: 05 45        	li	a0, 1
   16416: 23 34 a4 f0  	sd	a0, -248(s0)

000000000001641a <.Lpcrel_hi24>:
   1641a: 17 25 00 00  	auipc	a0, 2
   1641e: 13 05 65 c0  	addi	a0, a0, -1018
   16422: 0c 61        	ld	a1, 0(a0)
   16424: 08 65        	ld	a0, 8(a0)
   16426: 23 30 b4 f2  	sd	a1, -224(s0)
   1642a: 23 34 a4 f2  	sd	a0, -216(s0)

000000000001642e <.Lpcrel_hi25>:
   1642e: 17 35 00 00  	auipc	a0, 3
   16432: 13 05 a5 67  	addi	a0, a0, 1658
   16436: 23 38 a4 f0  	sd	a0, -240(s0)
   1643a: 01 45        	li	a0, 0
   1643c: 23 3c a4 f0  	sd	a0, -232(s0)

0000000000016440 <.Lpcrel_hi26>:
   16440: 17 45 00 00  	auipc	a0, 4
   16444: 93 05 05 83  	addi	a1, a0, -2000
   16448: 13 05 04 f0  	addi	a0, s0, -256
   1644c: 97 00 00 00  	auipc	ra, 0
   16450: e7 80 40 1d  	jalr	468(ra)

0000000000016454 <.Lpcrel_hi27>:
   16454: 17 35 00 00  	auipc	a0, 3
   16458: 93 05 45 66  	addi	a1, a0, 1636
   1645c: 13 05 04 f9  	addi	a0, s0, -112
   16460: 23 3c a4 ec  	sd	a0, -296(s0)
   16464: 05 46        	li	a2, 1
   16466: 97 00 00 00  	auipc	ra, 0
   1646a: e7 80 a0 ce  	jalr	-790(ra)
   1646e: 03 35 84 ed  	ld	a0, -296(s0)

0000000000016472 <.Lpcrel_hi28>:
   16472: 97 35 00 00  	auipc	a1, 3
   16476: 93 85 65 6a  	addi	a1, a1, 1702
   1647a: 97 00 00 00  	auipc	ra, 0
   1647e: e7 80 60 1a  	jalr	422(ra)

0000000000016482 <.Lpcrel_hi29>:
   16482: 17 45 00 00  	auipc	a0, 4
   16486: 13 05 e5 83  	addi	a0, a0, -1986
   1648a: 23 38 a4 f2  	sd	a0, -208(s0)
   1648e: 05 45        	li	a0, 1
   16490: 23 3c a4 f2  	sd	a0, -200(s0)

0000000000016494 <.Lpcrel_hi30>:
   16494: 17 25 00 00  	auipc	a0, 2
   16498: 13 05 c5 b8  	addi	a0, a0, -1140
   1649c: 0c 61        	ld	a1, 0(a0)
   1649e: 08 65        	ld	a0, 8(a0)
   164a0: 23 38 b4 f4  	sd	a1, -176(s0)
   164a4: 23 3c a4 f4  	sd	a0, -168(s0)

00000000000164a8 <.Lpcrel_hi31>:
   164a8: 17 35 00 00  	auipc	a0, 3
   164ac: 13 05 05 60  	addi	a0, a0, 1536
   164b0: 23 30 a4 f4  	sd	a0, -192(s0)
   164b4: 01 45        	li	a0, 0
   164b6: 23 34 a4 f4  	sd	a0, -184(s0)

00000000000164ba <.Lpcrel_hi32>:
   164ba: 17 45 00 00  	auipc	a0, 4
   164be: 93 05 65 81  	addi	a1, a0, -2026
   164c2: 13 05 04 f3  	addi	a0, s0, -208
   164c6: 97 00 00 00  	auipc	ra, 0
   164ca: e7 80 a0 15  	jalr	346(ra)

00000000000164ce <.Lpcrel_hi33>:
   164ce: 17 35 00 00  	auipc	a0, 3
   164d2: 93 05 a5 5e  	addi	a1, a0, 1514
   164d6: 13 05 04 f6  	addi	a0, s0, -160
   164da: 23 38 a4 ec  	sd	a0, -304(s0)
   164de: 05 46        	li	a2, 1
   164e0: 97 00 00 00  	auipc	ra, 0
   164e4: e7 80 00 c7  	jalr	-912(ra)
   164e8: 03 35 04 ed  	ld	a0, -304(s0)

00000000000164ec <.Lpcrel_hi34>:
   164ec: 97 35 00 00  	auipc	a1, 3
   164f0: 93 85 c5 62  	addi	a1, a1, 1580
   164f4: 97 00 00 00  	auipc	ra, 0
   164f8: e7 80 c0 12  	jalr	300(ra)

00000000000164fc <_ZN5alloc7raw_vec17capacity_overflow17h0af550bdc5b34416E>:
   164fc: 39 71        	addi	sp, sp, -64
   164fe: 06 fc        	sd	ra, 56(sp)

0000000000016500 <.Lpcrel_hi7>:
   16500: 17 45 00 00  	auipc	a0, 4
   16504: 13 05 85 81  	addi	a0, a0, -2024
   16508: 2a e4        	sd	a0, 8(sp)
   1650a: 05 45        	li	a0, 1
   1650c: 2a e8        	sd	a0, 16(sp)
   1650e: 02 f4        	sd	zero, 40(sp)

0000000000016510 <.Lpcrel_hi8>:
   16510: 17 35 00 00  	auipc	a0, 3
   16514: 13 05 85 7d  	addi	a0, a0, 2008
   16518: 2a ec        	sd	a0, 24(sp)
   1651a: 02 f0        	sd	zero, 32(sp)

000000000001651c <.Lpcrel_hi9>:
   1651c: 17 45 00 00  	auipc	a0, 4
   16520: 93 05 c5 80  	addi	a1, a0, -2036
   16524: 28 00        	addi	a0, sp, 8
   16526: 97 00 00 00  	auipc	ra, 0
   1652a: e7 80 a0 0f  	jalr	250(ra)

000000000001652e <_ZN5alloc5alloc18handle_alloc_error17hf4ac7aa8a4f89356E>:
   1652e: 41 11        	addi	sp, sp, -16
   16530: 06 e4        	sd	ra, 8(sp)
   16532: 2a 86        	mv	a2, a0
   16534: 2e 85        	mv	a0, a1
   16536: b2 85        	mv	a1, a2
   16538: 97 b0 ff ff  	auipc	ra, 1048571
   1653c: e7 80 c0 b3  	jalr	-1220(ra)

0000000000016540 <_ZN4core3ops8function6FnOnce9call_once17hdafe13a4b16c6b04E>:
   16540: 08 61        	ld	a0, 0(a0)
   16542: 01 a0        	j	0x16542 <_ZN4core3ops8function6FnOnce9call_once17hdafe13a4b16c6b04E+0x2>

0000000000016544 <_ZN4core3ptr26drop_in_place$LT$usize$GT$17h0316501c992288aeE>:
   16544: 82 80        	ret

0000000000016546 <_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h457499e72a109aacE>:
   16546: 82 80        	ret

0000000000016548 <_ZN68_$LT$core..ptr..alignment..Alignment$u20$as$u20$core..fmt..Debug$GT$3fmt17he55123e5a24649a2E>:
   16548: 59 71        	addi	sp, sp, -112
   1654a: 86 f4        	sd	ra, 104(sp)
   1654c: 08 61        	ld	a0, 0(a0)

000000000001654e <.Lpcrel_hi242>:
   1654e: 17 56 00 00  	auipc	a2, 5
   16552: 03 36 26 b0  	ld	a2, -1278(a2)
   16556: b3 06 a0 40  	neg	a3, a0
   1655a: e9 8e        	and	a3, a3, a0
   1655c: 33 86 c6 02  	mul	a2, a3, a2
   16560: 69 92        	srli	a2, a2, 58

0000000000016562 <.Lpcrel_hi243>:
   16562: 97 36 00 00  	auipc	a3, 3
   16566: 93 86 e6 7d  	addi	a3, a3, 2014
   1656a: 36 96        	add	a2, a2, a3
   1656c: 03 46 06 00  	lbu	a2, 0(a2)
   16570: aa ec        	sd	a0, 88(sp)
   16572: b2 d2        	sw	a2, 100(sp)
   16574: a8 08        	addi	a0, sp, 88
   16576: 2a fc        	sd	a0, 56(sp)

0000000000016578 <.Lpcrel_hi244>:
   16578: 17 15 00 00  	auipc	a0, 1
   1657c: 13 05 c5 e9  	addi	a0, a0, -356
   16580: aa e0        	sd	a0, 64(sp)
   16582: c8 10        	addi	a0, sp, 100
   16584: aa e4        	sd	a0, 72(sp)

0000000000016586 <.Lpcrel_hi245>:
   16586: 17 15 00 00  	auipc	a0, 1
   1658a: 13 05 85 ff  	addi	a0, a0, -8
   1658e: aa e8        	sd	a0, 80(sp)

0000000000016590 <.Lpcrel_hi246>:
   16590: 17 35 00 00  	auipc	a0, 3
   16594: 13 05 85 7f  	addi	a0, a0, 2040
   16598: 2a e4        	sd	a0, 8(sp)
   1659a: 0d 45        	li	a0, 3
   1659c: 2a e8        	sd	a0, 16(sp)
   1659e: 02 f4        	sd	zero, 40(sp)
   165a0: 30 18        	addi	a2, sp, 56
   165a2: 88 71        	ld	a0, 32(a1)
   165a4: 8c 75        	ld	a1, 40(a1)
   165a6: 32 ec        	sd	a2, 24(sp)
   165a8: 09 46        	li	a2, 2
   165aa: 32 f0        	sd	a2, 32(sp)
   165ac: 30 00        	addi	a2, sp, 8
   165ae: 97 00 00 00  	auipc	ra, 0
   165b2: e7 80 e0 52  	jalr	1326(ra)
   165b6: a6 70        	ld	ra, 104(sp)
   165b8: 65 61        	addi	sp, sp, 112
   165ba: 82 80        	ret

00000000000165bc <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h05d1f45ec796a085E>:
   165bc: 17 55 00 00  	auipc	a0, 5
   165c0: 03 35 c5 a9  	ld	a0, -1380(a0)

00000000000165c4 <.Lpcrel_hi254>:
   165c4: 97 55 00 00  	auipc	a1, 5
   165c8: 83 b5 c5 a9  	ld	a1, -1380(a1)
   165cc: 82 80        	ret

00000000000165ce <_ZN4core6option13unwrap_failed17h8c51a7e74702ad3fE>:
   165ce: 41 11        	addi	sp, sp, -16
   165d0: 06 e4        	sd	ra, 8(sp)
   165d2: 2a 86        	mv	a2, a0

00000000000165d4 <.Lpcrel_hi385>:
   165d4: 17 35 00 00  	auipc	a0, 3
   165d8: 13 05 45 7f  	addi	a0, a0, 2036
   165dc: 93 05 b0 02  	li	a1, 43
   165e0: 97 00 00 00  	auipc	ra, 0
   165e4: e7 80 c0 06  	jalr	108(ra)

00000000000165e8 <_ZN4core6option13expect_failed17h423e7f415c19d5c5E>:
   165e8: 1d 71        	addi	sp, sp, -96
   165ea: 86 ec        	sd	ra, 88(sp)
   165ec: 2a e4        	sd	a0, 8(sp)
   165ee: 2e e8        	sd	a1, 16(sp)
   165f0: 28 00        	addi	a0, sp, 8
   165f2: aa e4        	sd	a0, 72(sp)

00000000000165f4 <.Lpcrel_hi386>:
   165f4: 17 15 00 00  	auipc	a0, 1
   165f8: 13 05 65 32  	addi	a0, a0, 806
   165fc: aa e8        	sd	a0, 80(sp)

00000000000165fe <.Lpcrel_hi387>:
   165fe: 17 35 00 00  	auipc	a0, 3
   16602: 13 05 a5 7b  	addi	a0, a0, 1978
   16606: 2a ec        	sd	a0, 24(sp)
   16608: 05 45        	li	a0, 1
   1660a: 2a f0        	sd	a0, 32(sp)
   1660c: 02 fc        	sd	zero, 56(sp)
   1660e: ac 00        	addi	a1, sp, 72
   16610: 2e f4        	sd	a1, 40(sp)
   16612: 2a f8        	sd	a0, 48(sp)
   16614: 28 08        	addi	a0, sp, 24
   16616: b2 85        	mv	a1, a2
   16618: 97 00 00 00  	auipc	ra, 0
   1661c: e7 80 80 00  	jalr	8(ra)

0000000000016620 <_ZN4core9panicking9panic_fmt17h5be7c539adb5af41E>:
   16620: 79 71        	addi	sp, sp, -48
   16622: 06 f4        	sd	ra, 40(sp)

0000000000016624 <.Lpcrel_hi399>:
   16624: 17 36 00 00  	auipc	a2, 3
   16628: 13 06 c6 75  	addi	a2, a2, 1884
   1662c: 32 e0        	sd	a2, 0(sp)

000000000001662e <.Lpcrel_hi400>:
   1662e: 17 36 00 00  	auipc	a2, 3
   16632: 13 06 a6 7c  	addi	a2, a2, 1994
   16636: 32 e4        	sd	a2, 8(sp)
   16638: 2a e8        	sd	a0, 16(sp)
   1663a: 2e ec        	sd	a1, 24(sp)
   1663c: 05 45        	li	a0, 1
   1663e: 23 10 a1 02  	sh	a0, 32(sp)
   16642: 0a 85        	mv	a0, sp
   16644: 97 e0 ff ff  	auipc	ra, 1048574
   16648: e7 80 c0 c0  	jalr	-1012(ra)

000000000001664c <_ZN4core9panicking5panic17had384739dd621d04E>:
   1664c: 5d 71        	addi	sp, sp, -80
   1664e: 86 e4        	sd	ra, 72(sp)
   16650: 2a fc        	sd	a0, 56(sp)
   16652: ae e0        	sd	a1, 64(sp)
   16654: 28 18        	addi	a0, sp, 56
   16656: 2a e4        	sd	a0, 8(sp)
   16658: 05 45        	li	a0, 1
   1665a: 2a e8        	sd	a0, 16(sp)
   1665c: 02 f4        	sd	zero, 40(sp)

000000000001665e <.Lpcrel_hi403>:
   1665e: 17 35 00 00  	auipc	a0, 3
   16662: 13 05 25 72  	addi	a0, a0, 1826
   16666: 2a ec        	sd	a0, 24(sp)
   16668: 02 f0        	sd	zero, 32(sp)
   1666a: 28 00        	addi	a0, sp, 8
   1666c: b2 85        	mv	a1, a2
   1666e: 97 00 00 00  	auipc	ra, 0
   16672: e7 80 20 fb  	jalr	-78(ra)

0000000000016676 <_ZN4core9panicking18panic_bounds_check17h5fe1f62a110c652dE>:
   16676: 59 71        	addi	sp, sp, -112
   16678: 86 f4        	sd	ra, 104(sp)
   1667a: 2a e4        	sd	a0, 8(sp)
   1667c: 2e e8        	sd	a1, 16(sp)
   1667e: 08 08        	addi	a0, sp, 16
   16680: aa e4        	sd	a0, 72(sp)

0000000000016682 <.Lpcrel_hi411>:
   16682: 17 15 00 00  	auipc	a0, 1
   16686: 13 05 25 28  	addi	a0, a0, 642
   1668a: aa e8        	sd	a0, 80(sp)
   1668c: 2c 00        	addi	a1, sp, 8
   1668e: ae ec        	sd	a1, 88(sp)
   16690: aa f0        	sd	a0, 96(sp)

0000000000016692 <.Lpcrel_hi412>:
   16692: 17 35 00 00  	auipc	a0, 3
   16696: 13 05 e5 79  	addi	a0, a0, 1950
   1669a: 2a ec        	sd	a0, 24(sp)
   1669c: 09 45        	li	a0, 2
   1669e: 2a f0        	sd	a0, 32(sp)
   166a0: 02 fc        	sd	zero, 56(sp)
   166a2: ac 00        	addi	a1, sp, 72
   166a4: 2e f4        	sd	a1, 40(sp)
   166a6: 2a f8        	sd	a0, 48(sp)
   166a8: 28 08        	addi	a0, sp, 24
   166aa: b2 85        	mv	a1, a2
   166ac: 97 00 00 00  	auipc	ra, 0
   166b0: e7 80 40 f7  	jalr	-140(ra)

00000000000166b4 <_ZN4core6result13unwrap_failed17he50803ee742da9d2E>:
   166b4: 19 71        	addi	sp, sp, -128
   166b6: 86 fc        	sd	ra, 120(sp)
   166b8: 2a e4        	sd	a0, 8(sp)
   166ba: 2e e8        	sd	a1, 16(sp)
   166bc: 32 ec        	sd	a2, 24(sp)
   166be: 36 f0        	sd	a3, 32(sp)
   166c0: 28 00        	addi	a0, sp, 8
   166c2: aa ec        	sd	a0, 88(sp)

00000000000166c4 <.Lpcrel_hi435>:
   166c4: 17 15 00 00  	auipc	a0, 1
   166c8: 13 05 65 25  	addi	a0, a0, 598
   166cc: aa f0        	sd	a0, 96(sp)
   166ce: 28 08        	addi	a0, sp, 24
   166d0: aa f4        	sd	a0, 104(sp)

00000000000166d2 <.Lpcrel_hi436>:
   166d2: 17 15 00 00  	auipc	a0, 1
   166d6: 13 05 05 24  	addi	a0, a0, 576
   166da: aa f8        	sd	a0, 112(sp)

00000000000166dc <.Lpcrel_hi437>:
   166dc: 17 35 00 00  	auipc	a0, 3
   166e0: 13 05 c5 77  	addi	a0, a0, 1916
   166e4: 2a f4        	sd	a0, 40(sp)
   166e6: 09 45        	li	a0, 2
   166e8: 2a f8        	sd	a0, 48(sp)
   166ea: 82 e4        	sd	zero, 72(sp)
   166ec: ac 08        	addi	a1, sp, 88
   166ee: 2e fc        	sd	a1, 56(sp)
   166f0: aa e0        	sd	a0, 64(sp)
   166f2: 28 10        	addi	a0, sp, 40
   166f4: ba 85        	mv	a1, a4
   166f6: 97 00 00 00  	auipc	ra, 0
   166fa: e7 80 a0 f2  	jalr	-214(ra)

00000000000166fe <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h1578b93adde498f6E>:
   166fe: 75 71        	addi	sp, sp, -144
   16700: 06 e5        	sd	ra, 136(sp)
   16702: 22 e1        	sd	s0, 128(sp)
   16704: a6 fc        	sd	s1, 120(sp)
   16706: ca f8        	sd	s2, 112(sp)
   16708: ce f4        	sd	s3, 104(sp)
   1670a: d2 f0        	sd	s4, 96(sp)
   1670c: d6 ec        	sd	s5, 88(sp)
   1670e: da e8        	sd	s6, 80(sp)
   16710: de e4        	sd	s7, 72(sp)
   16712: e2 e0        	sd	s8, 64(sp)
   16714: 66 fc        	sd	s9, 56(sp)
   16716: 6a f8        	sd	s10, 48(sp)
   16718: 6e f4        	sd	s11, 40(sp)
   1671a: 32 8c        	mv	s8, a2
   1671c: 2e 8a        	mv	s4, a1
   1671e: 01 4b        	li	s6, 0
   16720: 81 49        	li	s3, 0
   16722: 01 4d        	li	s10, 0
   16724: b7 05 ff fe  	lui	a1, 1044464
   16728: 9b 84 f5 ef  	addiw	s1, a1, -257
   1672c: 93 95 04 02  	slli	a1, s1, 32
   16730: 33 89 b4 00  	add	s2, s1, a1
   16734: b7 15 0a 0a  	lui	a1, 41121
   16738: 1b 84 a5 a0  	addiw	s0, a1, -1526
   1673c: 93 15 04 02  	slli	a1, s0, 32
   16740: b3 0b b4 00  	add	s7, s0, a1
   16744: 00 69        	ld	s0, 16(a0)
   16746: 04 61        	ld	s1, 0(a0)
   16748: 08 65        	ld	a0, 8(a0)
   1674a: 2a f0        	sd	a0, 32(sp)
   1674c: 13 05 8a 00  	addi	a0, s4, 8
   16750: 2a e4        	sd	a0, 8(sp)

0000000000016752 <.Lpcrel_hi441>:
   16752: 17 25 00 00  	auipc	a0, 2
   16756: 13 05 25 05  	addi	a0, a0, 82
   1675a: 2a ec        	sd	a0, 24(sp)
   1675c: a9 4d        	li	s11, 10
   1675e: 22 e8        	sd	s0, 16(sp)
   16760: 0d a0        	j	0x16782 <.Lpcrel_hi441+0x30>
   16762: 33 05 b6 00  	add	a0, a2, a1
   16766: 03 45 f5 ff  	lbu	a0, -1(a0)
   1676a: 59 15        	addi	a0, a0, -10
   1676c: 13 35 15 00  	seqz	a0, a0
   16770: 23 00 a4 00  	sb	a0, 0(s0)
   16774: 02 75        	ld	a0, 32(sp)
   16776: 14 6d        	ld	a3, 24(a0)
   16778: 26 85        	mv	a0, s1
   1677a: 82 96        	jalr	a3
   1677c: e6 89        	mv	s3, s9
   1677e: 63 1e 05 12  	bnez	a0, 0x168ba <.Lpcrel_hi442+0xba>
   16782: 13 75 fd 0f  	andi	a0, s10, 255
   16786: 63 18 05 12  	bnez	a0, 0x168b6 <.Lpcrel_hi442+0xb6>
   1678a: 63 75 6c 01  	bgeu	s8, s6, 0x16794 <.Lpcrel_hi441+0x42>
   1678e: d5 a0        	j	0x16872 <.Lpcrel_hi442+0x72>
   16790: 63 61 6c 0f  	bltu	s8, s6, 0x16872 <.Lpcrel_hi442+0x72>
   16794: 33 05 6c 41  	sub	a0, s8, s6
   16798: b3 05 6a 01  	add	a1, s4, s6
   1679c: 41 46        	li	a2, 16
   1679e: 63 7f c5 00  	bgeu	a0, a2, 0x167bc <.Lpcrel_hi441+0x6a>
   167a2: 63 07 6c 0d  	beq	s8, s6, 0x16870 <.Lpcrel_hi442+0x70>
   167a6: 81 46        	li	a3, 0
   167a8: 33 86 d5 00  	add	a2, a1, a3
   167ac: 03 46 06 00  	lbu	a2, 0(a2)
   167b0: 63 02 b6 0b  	beq	a2, s11, 0x16854 <.Lpcrel_hi442+0x54>
   167b4: 85 06        	addi	a3, a3, 1
   167b6: e3 19 d5 fe  	bne	a0, a3, 0x167a8 <.Lpcrel_hi441+0x56>
   167ba: 5d a8        	j	0x16870 <.Lpcrel_hi442+0x70>
   167bc: a6 88        	mv	a7, s1
   167be: 13 86 75 00  	addi	a2, a1, 7
   167c2: 93 76 86 ff  	andi	a3, a2, -8
   167c6: b3 84 b6 40  	sub	s1, a3, a1
   167ca: ad 8e        	xor	a3, a3, a1
   167cc: 93 b6 16 00  	seqz	a3, a3
   167d0: 13 b7 14 00  	seqz	a4, s1
   167d4: d9 8e        	or	a3, a3, a4
   167d6: b9 c2        	beqz	a3, 0x1681c <.Lpcrel_hi442+0x1c>
   167d8: 81 44        	li	s1, 0
   167da: 13 08 05 ff  	addi	a6, a0, -16
   167de: 22 67        	ld	a4, 8(sp)
   167e0: 5a 97        	add	a4, a4, s6
   167e2: b3 87 95 00  	add	a5, a1, s1
   167e6: 80 63        	ld	s0, 0(a5)
   167e8: 33 06 97 00  	add	a2, a4, s1
   167ec: 10 62        	ld	a2, 0(a2)
   167ee: b3 47 74 01  	xor	a5, s0, s7
   167f2: ca 97        	add	a5, a5, s2
   167f4: 13 44 f4 ff  	not	s0, s0
   167f8: e1 8f        	and	a5, a5, s0
   167fa: 33 44 76 01  	xor	s0, a2, s7
   167fe: 4a 94        	add	s0, s0, s2

0000000000016800 <.Lpcrel_hi442>:
   16800: 97 56 00 00  	auipc	a3, 5
   16804: 83 b6 86 88  	ld	a3, -1912(a3)
   16808: 13 46 f6 ff  	not	a2, a2
   1680c: 61 8e        	and	a2, a2, s0
   1680e: 5d 8e        	or	a2, a2, a5
   16810: 75 8e        	and	a2, a2, a3
   16812: 15 e2        	bnez	a2, 0x16836 <.Lpcrel_hi442+0x36>
   16814: c1 04        	addi	s1, s1, 16
   16816: e3 76 98 fc  	bgeu	a6, s1, 0x167e2 <.Lpcrel_hi441+0x90>
   1681a: 31 a8        	j	0x16836 <.Lpcrel_hi442+0x36>
   1681c: 33 87 d5 00  	add	a4, a1, a3
   16820: 03 47 07 00  	lbu	a4, 0(a4)
   16824: 63 07 b7 03  	beq	a4, s11, 0x16852 <.Lpcrel_hi442+0x52>
   16828: 85 06        	addi	a3, a3, 1
   1682a: e3 99 d4 fe  	bne	s1, a3, 0x1681c <.Lpcrel_hi442+0x1c>
   1682e: 13 08 05 ff  	addi	a6, a0, -16
   16832: e3 76 98 fa  	bgeu	a6, s1, 0x167de <.Lpcrel_hi441+0x8c>
   16836: 63 8d a4 06  	beq	s1, a0, 0x168b0 <.Lpcrel_hi442+0xb0>
   1683a: 42 64        	ld	s0, 16(sp)
   1683c: 33 86 95 00  	add	a2, a1, s1
   16840: 03 46 06 00  	lbu	a2, 0(a2)
   16844: 63 06 b6 01  	beq	a2, s11, 0x16850 <.Lpcrel_hi442+0x50>
   16848: 85 04        	addi	s1, s1, 1
   1684a: e3 19 95 fe  	bne	a0, s1, 0x1683c <.Lpcrel_hi442+0x3c>
   1684e: 89 a8        	j	0x168a0 <.Lpcrel_hi442+0xa0>
   16850: a6 86        	mv	a3, s1
   16852: c6 84        	mv	s1, a7
   16854: da 96        	add	a3, a3, s6
   16856: 13 8b 16 00  	addi	s6, a3, 1
   1685a: e3 fb 86 f3  	bgeu	a3, s8, 0x16790 <.Lpcrel_hi441+0x3e>
   1685e: d2 96        	add	a3, a3, s4
   16860: 03 c5 06 00  	lbu	a0, 0(a3)
   16864: e3 16 b5 f3  	bne	a0, s11, 0x16790 <.Lpcrel_hi441+0x3e>
   16868: 01 4d        	li	s10, 0
   1686a: da 8c        	mv	s9, s6
   1686c: da 8a        	mv	s5, s6
   1686e: 39 a0        	j	0x1687c <.Lpcrel_hi442+0x7c>
   16870: 62 8b        	mv	s6, s8
   16872: 05 4d        	li	s10, 1
   16874: ce 8c        	mv	s9, s3
   16876: e2 8a        	mv	s5, s8
   16878: 63 8f 89 03  	beq	s3, s8, 0x168b6 <.Lpcrel_hi442+0xb6>
   1687c: 03 45 04 00  	lbu	a0, 0(s0)
   16880: 01 c9        	beqz	a0, 0x16890 <.Lpcrel_hi442+0x90>
   16882: 02 75        	ld	a0, 32(sp)
   16884: 14 6d        	ld	a3, 24(a0)
   16886: 11 46        	li	a2, 4
   16888: 26 85        	mv	a0, s1
   1688a: e2 65        	ld	a1, 24(sp)
   1688c: 82 96        	jalr	a3
   1688e: 15 e5        	bnez	a0, 0x168ba <.Lpcrel_hi442+0xba>
   16890: 33 86 3a 41  	sub	a2, s5, s3
   16894: b3 05 3a 01  	add	a1, s4, s3
   16898: e3 95 3a ed  	bne	s5, s3, 0x16762 <.Lpcrel_hi441+0x10>
   1689c: 01 45        	li	a0, 0
   1689e: c9 bd        	j	0x16770 <.Lpcrel_hi441+0x1e>
   168a0: 62 8b        	mv	s6, s8
   168a2: c6 84        	mv	s1, a7
   168a4: 05 4d        	li	s10, 1
   168a6: ce 8c        	mv	s9, s3
   168a8: e2 8a        	mv	s5, s8
   168aa: e3 99 89 fd  	bne	s3, s8, 0x1687c <.Lpcrel_hi442+0x7c>
   168ae: 21 a0        	j	0x168b6 <.Lpcrel_hi442+0xb6>
   168b0: 62 8b        	mv	s6, s8
   168b2: 42 64        	ld	s0, 16(sp)
   168b4: fd b7        	j	0x168a2 <.Lpcrel_hi442+0xa2>
   168b6: 01 45        	li	a0, 0
   168b8: 11 a0        	j	0x168bc <.Lpcrel_hi442+0xbc>
   168ba: 05 45        	li	a0, 1
   168bc: aa 60        	ld	ra, 136(sp)
   168be: 0a 64        	ld	s0, 128(sp)
   168c0: e6 74        	ld	s1, 120(sp)
   168c2: 46 79        	ld	s2, 112(sp)
   168c4: a6 79        	ld	s3, 104(sp)
   168c6: 06 7a        	ld	s4, 96(sp)
   168c8: e6 6a        	ld	s5, 88(sp)
   168ca: 46 6b        	ld	s6, 80(sp)
   168cc: a6 6b        	ld	s7, 72(sp)
   168ce: 06 6c        	ld	s8, 64(sp)
   168d0: e2 7c        	ld	s9, 56(sp)
   168d2: 42 7d        	ld	s10, 48(sp)
   168d4: a2 7d        	ld	s11, 40(sp)
   168d6: 49 61        	addi	sp, sp, 144
   168d8: 82 80        	ret

00000000000168da <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h6d5e218c383d9855E>:
   168da: 79 71        	addi	sp, sp, -48
   168dc: 06 f4        	sd	ra, 40(sp)
   168de: 22 f0        	sd	s0, 32(sp)
   168e0: 26 ec        	sd	s1, 24(sp)
   168e2: 4a e8        	sd	s2, 16(sp)
   168e4: 4e e4        	sd	s3, 8(sp)
   168e6: 00 69        	ld	s0, 16(a0)
   168e8: 03 46 04 00  	lbu	a2, 0(s0)
   168ec: 03 39 05 00  	ld	s2, 0(a0)
   168f0: 04 65        	ld	s1, 8(a0)
   168f2: ae 89        	mv	s3, a1
   168f4: 15 c2        	beqz	a2, 0x16918 <.Lpcrel_hi443+0x20>
   168f6: 94 6c        	ld	a3, 24(s1)

00000000000168f8 <.Lpcrel_hi443>:
   168f8: 17 25 00 00  	auipc	a0, 2
   168fc: 93 05 c5 ea  	addi	a1, a0, -340
   16900: 11 46        	li	a2, 4
   16902: 4a 85        	mv	a0, s2
   16904: 82 96        	jalr	a3
   16906: 09 c9        	beqz	a0, 0x16918 <.Lpcrel_hi443+0x20>
   16908: 05 45        	li	a0, 1
   1690a: a2 70        	ld	ra, 40(sp)
   1690c: 02 74        	ld	s0, 32(sp)
   1690e: e2 64        	ld	s1, 24(sp)
   16910: 42 69        	ld	s2, 16(sp)
   16912: a2 69        	ld	s3, 8(sp)
   16914: 45 61        	addi	sp, sp, 48
   16916: 82 80        	ret
   16918: 1b 85 09 00  	sext.w	a0, s3
   1691c: 59 15        	addi	a0, a0, -10
   1691e: 13 35 15 00  	seqz	a0, a0
   16922: 23 00 a4 00  	sb	a0, 0(s0)
   16926: 9c 70        	ld	a5, 32(s1)
   16928: 4a 85        	mv	a0, s2
   1692a: ce 85        	mv	a1, s3
   1692c: a2 70        	ld	ra, 40(sp)
   1692e: 02 74        	ld	s0, 32(sp)
   16930: e2 64        	ld	s1, 24(sp)
   16932: 42 69        	ld	s2, 16(sp)
   16934: a2 69        	ld	s3, 8(sp)
   16936: 45 61        	addi	sp, sp, 48
   16938: 82 87        	jr	a5

000000000001693a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E>:
   1693a: 71 71        	addi	sp, sp, -176
   1693c: 06 f5        	sd	ra, 168(sp)
   1693e: 22 f1        	sd	s0, 160(sp)
   16940: 26 ed        	sd	s1, 152(sp)
   16942: 4a e9        	sd	s2, 144(sp)
   16944: 4e e5        	sd	s3, 136(sp)
   16946: 52 e1        	sd	s4, 128(sp)
   16948: d6 fc        	sd	s5, 120(sp)
   1694a: da f8        	sd	s6, 112(sp)
   1694c: de f4        	sd	s7, 104(sp)
   1694e: 2a 84        	mv	s0, a0
   16950: 03 45 85 00  	lbu	a0, 8(a0)
   16954: 85 4b        	li	s7, 1
   16956: 85 44        	li	s1, 1
   16958: 0d c1        	beqz	a0, 0x1697a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x40>
   1695a: 23 04 94 00  	sb	s1, 8(s0)
   1695e: a3 04 74 01  	sb	s7, 9(s0)
   16962: 22 85        	mv	a0, s0
   16964: aa 70        	ld	ra, 168(sp)
   16966: 0a 74        	ld	s0, 160(sp)
   16968: ea 64        	ld	s1, 152(sp)
   1696a: 4a 69        	ld	s2, 144(sp)
   1696c: aa 69        	ld	s3, 136(sp)
   1696e: 0a 6a        	ld	s4, 128(sp)
   16970: e6 7a        	ld	s5, 120(sp)
   16972: 46 7b        	ld	s6, 112(sp)
   16974: a6 7b        	ld	s7, 104(sp)
   16976: 4d 61        	addi	sp, sp, 176
   16978: 82 80        	ret
   1697a: ba 89        	mv	s3, a4
   1697c: 36 89        	mv	s2, a3
   1697e: 32 8a        	mv	s4, a2
   16980: ae 8a        	mv	s5, a1
   16982: 03 3b 04 00  	ld	s6, 0(s0)
   16986: 03 65 4b 03  	lwu	a0, 52(s6)
   1698a: 83 45 94 00  	lbu	a1, 9(s0)
   1698e: 13 76 45 00  	andi	a2, a0, 4
   16992: 09 ea        	bnez	a2, 0x169a4 <.Lpcrel_hi445+0xa>
   16994: 13 b6 15 00  	seqz	a2, a1
   16998: e1 c1        	beqz	a1, 0x16a58 <.Lpcrel_hi444>

000000000001699a <.Lpcrel_hi445>:
   1699a: 17 35 00 00  	auipc	a0, 3
   1699e: 93 05 15 51  	addi	a1, a0, 1297
   169a2: 7d a8        	j	0x16a60 <.Lpcrel_hi444+0x8>
   169a4: 85 e1        	bnez	a1, 0x169c4 <.Lpcrel_hi447+0x14>
   169a6: 83 35 8b 02  	ld	a1, 40(s6)
   169aa: 03 35 0b 02  	ld	a0, 32(s6)
   169ae: 94 6d        	ld	a3, 24(a1)

00000000000169b0 <.Lpcrel_hi447>:
   169b0: 97 35 00 00  	auipc	a1, 3
   169b4: 93 85 d5 4f  	addi	a1, a1, 1277
   169b8: 0d 46        	li	a2, 3
   169ba: 82 96        	jalr	a3
   169bc: 85 44        	li	s1, 1
   169be: 51 fd        	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   169c0: 03 25 4b 03  	lw	a0, 52(s6)
   169c4: 85 44        	li	s1, 1
   169c6: a3 03 91 02  	sb	s1, 39(sp)
   169ca: 83 35 0b 02  	ld	a1, 32(s6)
   169ce: 03 36 8b 02  	ld	a2, 40(s6)
   169d2: 2e e4        	sd	a1, 8(sp)
   169d4: 32 e8        	sd	a2, 16(sp)
   169d6: 93 05 71 02  	addi	a1, sp, 39
   169da: 2e ec        	sd	a1, 24(sp)
   169dc: 83 25 0b 03  	lw	a1, 48(s6)
   169e0: 03 46 8b 03  	lbu	a2, 56(s6)
   169e4: 83 36 0b 00  	ld	a3, 0(s6)
   169e8: 03 37 8b 00  	ld	a4, 8(s6)
   169ec: 83 37 0b 01  	ld	a5, 16(s6)
   169f0: 03 38 8b 01  	ld	a6, 24(s6)
   169f4: aa ce        	sw	a0, 92(sp)
   169f6: ae cc        	sw	a1, 88(sp)
   169f8: 23 00 c1 06  	sb	a2, 96(sp)
   169fc: 36 f4        	sd	a3, 40(sp)
   169fe: 3a f8        	sd	a4, 48(sp)
   16a00: 3e fc        	sd	a5, 56(sp)
   16a02: c2 e0        	sd	a6, 64(sp)
   16a04: 28 00        	addi	a0, sp, 8
   16a06: aa e4        	sd	a0, 72(sp)

0000000000016a08 <.Lpcrel_hi448>:
   16a08: 17 35 00 00  	auipc	a0, 3
   16a0c: 13 05 05 47  	addi	a0, a0, 1136
   16a10: aa e8        	sd	a0, 80(sp)
   16a12: 28 00        	addi	a0, sp, 8
   16a14: d6 85        	mv	a1, s5
   16a16: 52 86        	mv	a2, s4
   16a18: 97 00 00 00  	auipc	ra, 0
   16a1c: e7 80 60 ce  	jalr	-794(ra)
   16a20: 0d fd        	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>

0000000000016a22 <.Lpcrel_hi449>:
   16a22: 17 35 00 00  	auipc	a0, 3
   16a26: 93 05 e5 42  	addi	a1, a0, 1070
   16a2a: 28 00        	addi	a0, sp, 8
   16a2c: 09 46        	li	a2, 2
   16a2e: 97 00 00 00  	auipc	ra, 0
   16a32: e7 80 00 cd  	jalr	-816(ra)
   16a36: 15 f1        	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   16a38: 03 b6 89 01  	ld	a2, 24(s3)
   16a3c: 2c 10        	addi	a1, sp, 40
   16a3e: 4a 85        	mv	a0, s2
   16a40: 02 96        	jalr	a2
   16a42: 01 fd        	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   16a44: c6 65        	ld	a1, 80(sp)
   16a46: 26 65        	ld	a0, 72(sp)
   16a48: 94 6d        	ld	a3, 24(a1)

0000000000016a4a <.Lpcrel_hi450>:
   16a4a: 97 35 00 00  	auipc	a1, 3
   16a4e: 93 85 65 46  	addi	a1, a1, 1126
   16a52: 09 46        	li	a2, 2
   16a54: 82 96        	jalr	a3
   16a56: a9 a8        	j	0x16ab0 <.Lpcrel_hi446+0x1c>

0000000000016a58 <.Lpcrel_hi444>:
   16a58: 17 35 00 00  	auipc	a0, 3
   16a5c: 93 05 05 45  	addi	a1, a0, 1104
   16a60: 83 36 8b 02  	ld	a3, 40(s6)
   16a64: 03 35 0b 02  	ld	a0, 32(s6)
   16a68: 94 6e        	ld	a3, 24(a3)
   16a6a: 09 06        	addi	a2, a2, 2
   16a6c: 82 96        	jalr	a3
   16a6e: 85 44        	li	s1, 1
   16a70: e3 15 05 ee  	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   16a74: 83 35 8b 02  	ld	a1, 40(s6)
   16a78: 03 35 0b 02  	ld	a0, 32(s6)
   16a7c: 94 6d        	ld	a3, 24(a1)
   16a7e: d6 85        	mv	a1, s5
   16a80: 52 86        	mv	a2, s4
   16a82: 82 96        	jalr	a3
   16a84: 85 44        	li	s1, 1
   16a86: e3 1a 05 ec  	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   16a8a: 83 35 8b 02  	ld	a1, 40(s6)
   16a8e: 03 35 0b 02  	ld	a0, 32(s6)
   16a92: 94 6d        	ld	a3, 24(a1)

0000000000016a94 <.Lpcrel_hi446>:
   16a94: 97 35 00 00  	auipc	a1, 3
   16a98: 93 85 c5 3b  	addi	a1, a1, 956
   16a9c: 09 46        	li	a2, 2
   16a9e: 82 96        	jalr	a3
   16aa0: 85 44        	li	s1, 1
   16aa2: e3 1c 05 ea  	bnez	a0, 0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>
   16aa6: 03 b6 89 01  	ld	a2, 24(s3)
   16aaa: 4a 85        	mv	a0, s2
   16aac: da 85        	mv	a1, s6
   16aae: 02 96        	jalr	a2
   16ab0: aa 84        	mv	s1, a0
   16ab2: 65 b5        	j	0x1695a <_ZN4core3fmt8builders11DebugStruct5field17h3abe3758a4cbe318E+0x20>

0000000000016ab4 <_ZN4core3fmt5Write9write_fmt17ha3c076ddc85f6665E>:
   16ab4: 17 36 00 00  	auipc	a2, 3
   16ab8: 13 06 46 3c  	addi	a2, a2, 964
   16abc: ae 86        	mv	a3, a1
   16abe: b2 85        	mv	a1, a2
   16ac0: 36 86        	mv	a2, a3
   16ac2: 17 03 00 00  	auipc	t1, 0
   16ac6: 67 00 a3 01  	jr	26(t1)

0000000000016aca <_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h6a270add3fbdeff5E>:
   16aca: 90 71        	ld	a2, 32(a1)
   16acc: 8c 75        	ld	a1, 40(a1)
   16ace: aa 86        	mv	a3, a0
   16ad0: 32 85        	mv	a0, a2
   16ad2: 36 86        	mv	a2, a3
   16ad4: 17 03 00 00  	auipc	t1, 0
   16ad8: 67 00 83 00  	jr	8(t1)

0000000000016adc <_ZN4core3fmt5write17hfd6703e412aa3390E>:
   16adc: 75 71        	addi	sp, sp, -144
   16ade: 06 e5        	sd	ra, 136(sp)
   16ae0: 22 e1        	sd	s0, 128(sp)
   16ae2: a6 fc        	sd	s1, 120(sp)
   16ae4: ca f8        	sd	s2, 112(sp)
   16ae6: ce f4        	sd	s3, 104(sp)
   16ae8: d2 f0        	sd	s4, 96(sp)
   16aea: d6 ec        	sd	s5, 88(sp)
   16aec: da e8        	sd	s6, 80(sp)
   16aee: de e4        	sd	s7, 72(sp)
   16af0: e2 e0        	sd	s8, 64(sp)
   16af2: b2 89        	mv	s3, a2
   16af4: 13 06 00 02  	li	a2, 32
   16af8: 32 f8        	sd	a2, 48(sp)
   16afa: 0d 46        	li	a2, 3
   16afc: 23 0c c1 02  	sb	a2, 56(sp)
   16b00: 83 b4 09 02  	ld	s1, 32(s3)
   16b04: 02 e0        	sd	zero, 0(sp)
   16b06: 02 e8        	sd	zero, 16(sp)
   16b08: 2a f0        	sd	a0, 32(sp)
   16b0a: 2e f4        	sd	a1, 40(sp)
   16b0c: f9 c0        	beqz	s1, 0x16bd2 <.Lpcrel_hi599+0x98>
   16b0e: 03 b5 89 02  	ld	a0, 40(s3)
   16b12: 63 09 05 10  	beqz	a0, 0x16c24 <.Lpcrel_hi599+0xea>
   16b16: 81 4a        	li	s5, 0
   16b18: 03 b4 09 00  	ld	s0, 0(s3)
   16b1c: 03 ba 09 01  	ld	s4, 16(s3)
   16b20: 93 05 f5 ff  	addi	a1, a0, -1
   16b24: 8e 05        	slli	a1, a1, 3
   16b26: 8d 81        	srli	a1, a1, 3
   16b28: 13 89 15 00  	addi	s2, a1, 1
   16b2c: 21 04        	addi	s0, s0, 8
   16b2e: 93 05 80 03  	li	a1, 56
   16b32: 33 0b b5 02  	mul	s6, a0, a1
   16b36: e1 04        	addi	s1, s1, 24
   16b38: 85 4b        	li	s7, 1

0000000000016b3a <.Lpcrel_hi599>:
   16b3a: 17 05 00 00  	auipc	a0, 0
   16b3e: 13 0c 65 a0  	addi	s8, a0, -1530
   16b42: 10 60        	ld	a2, 0(s0)
   16b44: 01 ca        	beqz	a2, 0x16b54 <.Lpcrel_hi599+0x1a>
   16b46: a2 76        	ld	a3, 40(sp)
   16b48: 02 75        	ld	a0, 32(sp)
   16b4a: 83 35 84 ff  	ld	a1, -8(s0)
   16b4e: 94 6e        	ld	a3, 24(a3)
   16b50: 82 96        	jalr	a3
   16b52: 7d e9        	bnez	a0, 0x16c48 <.Lpcrel_hi599+0x10e>
   16b54: 88 48        	lw	a0, 16(s1)
   16b56: 2a d8        	sw	a0, 48(sp)
   16b58: 03 c5 84 01  	lbu	a0, 24(s1)
   16b5c: 23 0c a1 02  	sb	a0, 56(sp)
   16b60: c8 48        	lw	a0, 20(s1)
   16b62: 2a da        	sw	a0, 52(sp)
   16b64: 83 b5 84 ff  	ld	a1, -8(s1)
   16b68: 88 60        	ld	a0, 0(s1)
   16b6a: 81 cd        	beqz	a1, 0x16b82 <.Lpcrel_hi599+0x48>
   16b6c: 63 97 75 01  	bne	a1, s7, 0x16b7a <.Lpcrel_hi599+0x40>
   16b70: 12 05        	slli	a0, a0, 4
   16b72: 52 95        	add	a0, a0, s4
   16b74: 0c 65        	ld	a1, 8(a0)
   16b76: 63 84 85 01  	beq	a1, s8, 0x16b7e <.Lpcrel_hi599+0x44>
   16b7a: 81 45        	li	a1, 0
   16b7c: 21 a0        	j	0x16b84 <.Lpcrel_hi599+0x4a>
   16b7e: 08 61        	ld	a0, 0(a0)
   16b80: 08 61        	ld	a0, 0(a0)
   16b82: 85 45        	li	a1, 1
   16b84: 2e e0        	sd	a1, 0(sp)
   16b86: 2a e4        	sd	a0, 8(sp)
   16b88: 83 b5 84 fe  	ld	a1, -24(s1)
   16b8c: 03 b5 04 ff  	ld	a0, -16(s1)
   16b90: 81 cd        	beqz	a1, 0x16ba8 <.Lpcrel_hi599+0x6e>
   16b92: 63 97 75 01  	bne	a1, s7, 0x16ba0 <.Lpcrel_hi599+0x66>
   16b96: 12 05        	slli	a0, a0, 4
   16b98: 52 95        	add	a0, a0, s4
   16b9a: 0c 65        	ld	a1, 8(a0)
   16b9c: 63 84 85 01  	beq	a1, s8, 0x16ba4 <.Lpcrel_hi599+0x6a>
   16ba0: 81 45        	li	a1, 0
   16ba2: 21 a0        	j	0x16baa <.Lpcrel_hi599+0x70>
   16ba4: 08 61        	ld	a0, 0(a0)
   16ba6: 08 61        	ld	a0, 0(a0)
   16ba8: 85 45        	li	a1, 1
   16baa: 2e e8        	sd	a1, 16(sp)
   16bac: 2a ec        	sd	a0, 24(sp)
   16bae: 88 64        	ld	a0, 8(s1)
   16bb0: 12 05        	slli	a0, a0, 4
   16bb2: b3 05 aa 00  	add	a1, s4, a0
   16bb6: 88 61        	ld	a0, 0(a1)
   16bb8: 90 65        	ld	a2, 8(a1)
   16bba: 8a 85        	mv	a1, sp
   16bbc: 02 96        	jalr	a2
   16bbe: 49 e5        	bnez	a0, 0x16c48 <.Lpcrel_hi599+0x10e>
   16bc0: 41 04        	addi	s0, s0, 16
   16bc2: 13 0b 8b fc  	addi	s6, s6, -56
   16bc6: 93 84 84 03  	addi	s1, s1, 56
   16bca: 85 0a        	addi	s5, s5, 1
   16bcc: e3 1b 0b f6  	bnez	s6, 0x16b42 <.Lpcrel_hi599+0x8>
   16bd0: a9 a0        	j	0x16c1a <.Lpcrel_hi599+0xe0>
   16bd2: 03 b5 89 01  	ld	a0, 24(s3)
   16bd6: 39 c5        	beqz	a0, 0x16c24 <.Lpcrel_hi599+0xea>
   16bd8: 03 b4 09 01  	ld	s0, 16(s3)
   16bdc: 81 4a        	li	s5, 0
   16bde: 13 1a 45 00  	slli	s4, a0, 4
   16be2: 22 9a        	add	s4, s4, s0
   16be4: 83 b4 09 00  	ld	s1, 0(s3)
   16be8: 7d 15        	addi	a0, a0, -1
   16bea: 12 05        	slli	a0, a0, 4
   16bec: 11 81        	srli	a0, a0, 4
   16bee: 13 09 15 00  	addi	s2, a0, 1
   16bf2: a1 04        	addi	s1, s1, 8
   16bf4: 90 60        	ld	a2, 0(s1)
   16bf6: 01 ca        	beqz	a2, 0x16c06 <.Lpcrel_hi599+0xcc>
   16bf8: a2 76        	ld	a3, 40(sp)
   16bfa: 02 75        	ld	a0, 32(sp)
   16bfc: 83 b5 84 ff  	ld	a1, -8(s1)
   16c00: 94 6e        	ld	a3, 24(a3)
   16c02: 82 96        	jalr	a3
   16c04: 31 e1        	bnez	a0, 0x16c48 <.Lpcrel_hi599+0x10e>
   16c06: 08 60        	ld	a0, 0(s0)
   16c08: 10 64        	ld	a2, 8(s0)
   16c0a: 8a 85        	mv	a1, sp
   16c0c: 02 96        	jalr	a2
   16c0e: 0d ed        	bnez	a0, 0x16c48 <.Lpcrel_hi599+0x10e>
   16c10: c1 04        	addi	s1, s1, 16
   16c12: 41 04        	addi	s0, s0, 16
   16c14: 85 0a        	addi	s5, s5, 1
   16c16: e3 1f 44 fd  	bne	s0, s4, 0x16bf4 <.Lpcrel_hi599+0xba>
   16c1a: 03 b5 89 00  	ld	a0, 8(s3)
   16c1e: 63 68 a9 00  	bltu	s2, a0, 0x16c2e <.Lpcrel_hi599+0xf4>
   16c22: 2d a0        	j	0x16c4c <.Lpcrel_hi599+0x112>
   16c24: 01 49        	li	s2, 0
   16c26: 03 b5 89 00  	ld	a0, 8(s3)
   16c2a: 63 71 a0 02  	bgeu	zero, a0, 0x16c4c <.Lpcrel_hi599+0x112>
   16c2e: 03 b5 09 00  	ld	a0, 0(s3)
   16c32: 12 09        	slli	s2, s2, 4
   16c34: 2a 99        	add	s2, s2, a0
   16c36: a2 76        	ld	a3, 40(sp)
   16c38: 02 75        	ld	a0, 32(sp)
   16c3a: 83 35 09 00  	ld	a1, 0(s2)
   16c3e: 03 36 89 00  	ld	a2, 8(s2)
   16c42: 94 6e        	ld	a3, 24(a3)
   16c44: 82 96        	jalr	a3
   16c46: 19 c1        	beqz	a0, 0x16c4c <.Lpcrel_hi599+0x112>
   16c48: 05 45        	li	a0, 1
   16c4a: 11 a0        	j	0x16c4e <.Lpcrel_hi599+0x114>
   16c4c: 01 45        	li	a0, 0
   16c4e: aa 60        	ld	ra, 136(sp)
   16c50: 0a 64        	ld	s0, 128(sp)
   16c52: e6 74        	ld	s1, 120(sp)
   16c54: 46 79        	ld	s2, 112(sp)
   16c56: a6 79        	ld	s3, 104(sp)
   16c58: 06 7a        	ld	s4, 96(sp)
   16c5a: e6 6a        	ld	s5, 88(sp)
   16c5c: 46 6b        	ld	s6, 80(sp)
   16c5e: a6 6b        	ld	s7, 72(sp)
   16c60: 06 6c        	ld	s8, 64(sp)
   16c62: 49 61        	addi	sp, sp, 144
   16c64: 82 80        	ret

0000000000016c66 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E>:
   16c66: 59 71        	addi	sp, sp, -112
   16c68: 86 f4        	sd	ra, 104(sp)
   16c6a: a2 f0        	sd	s0, 96(sp)
   16c6c: a6 ec        	sd	s1, 88(sp)
   16c6e: ca e8        	sd	s2, 80(sp)
   16c70: ce e4        	sd	s3, 72(sp)
   16c72: d2 e0        	sd	s4, 64(sp)
   16c74: 56 fc        	sd	s5, 56(sp)
   16c76: 5a f8        	sd	s6, 48(sp)
   16c78: 5e f4        	sd	s7, 40(sp)
   16c7a: 62 f0        	sd	s8, 32(sp)
   16c7c: 66 ec        	sd	s9, 24(sp)
   16c7e: 6a e8        	sd	s10, 16(sp)
   16c80: 6e e4        	sd	s11, 8(sp)
   16c82: be 89        	mv	s3, a5
   16c84: 3a 89        	mv	s2, a4
   16c86: 36 8b        	mv	s6, a3
   16c88: 32 8a        	mv	s4, a2
   16c8a: 2a 8c        	mv	s8, a0
   16c8c: b9 c1        	beqz	a1, 0x16cd2 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x6c>
   16c8e: 03 64 4c 03  	lwu	s0, 52(s8)
   16c92: 93 7c 14 00  	andi	s9, s0, 1
   16c96: b7 0a 11 00  	lui	s5, 272
   16c9a: 63 84 0c 00  	beqz	s9, 0x16ca2 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x3c>
   16c9e: 93 0a b0 02  	li	s5, 43
   16ca2: ce 9c        	add	s9, s9, s3
   16ca4: 13 75 44 00  	andi	a0, s0, 4
   16ca8: 15 cd        	beqz	a0, 0x16ce4 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x7e>
   16caa: 13 05 00 02  	li	a0, 32
   16cae: 63 70 ab 04  	bgeu	s6, a0, 0x16cee <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x88>
   16cb2: 01 45        	li	a0, 0
   16cb4: 63 03 0b 04  	beqz	s6, 0x16cfa <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x94>
   16cb8: d2 85        	mv	a1, s4
   16cba: 5a 86        	mv	a2, s6
   16cbc: 83 86 05 00  	lb	a3, 0(a1)
   16cc0: 93 a6 06 fc  	slti	a3, a3, -64
   16cc4: 93 c6 16 00  	xori	a3, a3, 1
   16cc8: 36 95        	add	a0, a0, a3
   16cca: 7d 16        	addi	a2, a2, -1
   16ccc: 85 05        	addi	a1, a1, 1
   16cce: 7d f6        	bnez	a2, 0x16cbc <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x56>
   16cd0: 2d a0        	j	0x16cfa <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x94>
   16cd2: 03 24 4c 03  	lw	s0, 52(s8)
   16cd6: 93 8c 19 00  	addi	s9, s3, 1
   16cda: 93 0a d0 02  	li	s5, 45
   16cde: 13 75 44 00  	andi	a0, s0, 4
   16ce2: 61 f5        	bnez	a0, 0x16caa <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x44>
   16ce4: 01 4a        	li	s4, 0
   16ce6: 03 35 0c 00  	ld	a0, 0(s8)
   16cea: 01 ed        	bnez	a0, 0x16d02 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x9c>
   16cec: 15 a8        	j	0x16d20 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xba>
   16cee: 52 85        	mv	a0, s4
   16cf0: da 85        	mv	a1, s6
   16cf2: 97 00 00 00  	auipc	ra, 0
   16cf6: e7 80 20 59  	jalr	1426(ra)
   16cfa: aa 9c        	add	s9, s9, a0
   16cfc: 03 35 0c 00  	ld	a0, 0(s8)
   16d00: 05 c1        	beqz	a0, 0x16d20 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xba>
   16d02: 03 3d 8c 00  	ld	s10, 8(s8)
   16d06: 63 fd ac 01  	bgeu	s9, s10, 0x16d20 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xba>
   16d0a: 21 88        	andi	s0, s0, 8
   16d0c: 25 ec        	bnez	s0, 0x16d84 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x11e>
   16d0e: 03 45 8c 03  	lbu	a0, 56(s8)
   16d12: 85 45        	li	a1, 1
   16d14: b3 0c 9d 41  	sub	s9, s10, s9
   16d18: 63 cd a5 0a  	blt	a1, a0, 0x16dd2 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x16c>
   16d1c: 61 e5        	bnez	a0, 0x16de4 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x17e>
   16d1e: e9 a0        	j	0x16de8 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x182>
   16d20: 03 34 0c 02  	ld	s0, 32(s8)
   16d24: 83 34 8c 02  	ld	s1, 40(s8)
   16d28: 22 85        	mv	a0, s0
   16d2a: a6 85        	mv	a1, s1
   16d2c: 56 86        	mv	a2, s5
   16d2e: d2 86        	mv	a3, s4
   16d30: 5a 87        	mv	a4, s6
   16d32: 97 00 00 00  	auipc	ra, 0
   16d36: e7 80 00 14  	jalr	320(ra)
   16d3a: 85 4b        	li	s7, 1
   16d3c: 0d c1        	beqz	a0, 0x16d5e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xf8>
   16d3e: 5e 85        	mv	a0, s7
   16d40: a6 70        	ld	ra, 104(sp)
   16d42: 06 74        	ld	s0, 96(sp)
   16d44: e6 64        	ld	s1, 88(sp)
   16d46: 46 69        	ld	s2, 80(sp)
   16d48: a6 69        	ld	s3, 72(sp)
   16d4a: 06 6a        	ld	s4, 64(sp)
   16d4c: e2 7a        	ld	s5, 56(sp)
   16d4e: 42 7b        	ld	s6, 48(sp)
   16d50: a2 7b        	ld	s7, 40(sp)
   16d52: 02 7c        	ld	s8, 32(sp)
   16d54: e2 6c        	ld	s9, 24(sp)
   16d56: 42 6d        	ld	s10, 16(sp)
   16d58: a2 6d        	ld	s11, 8(sp)
   16d5a: 65 61        	addi	sp, sp, 112
   16d5c: 82 80        	ret
   16d5e: 9c 6c        	ld	a5, 24(s1)
   16d60: 22 85        	mv	a0, s0
   16d62: ca 85        	mv	a1, s2
   16d64: 4e 86        	mv	a2, s3
   16d66: a6 70        	ld	ra, 104(sp)
   16d68: 06 74        	ld	s0, 96(sp)
   16d6a: e6 64        	ld	s1, 88(sp)
   16d6c: 46 69        	ld	s2, 80(sp)
   16d6e: a6 69        	ld	s3, 72(sp)
   16d70: 06 6a        	ld	s4, 64(sp)
   16d72: e2 7a        	ld	s5, 56(sp)
   16d74: 42 7b        	ld	s6, 48(sp)
   16d76: a2 7b        	ld	s7, 40(sp)
   16d78: 02 7c        	ld	s8, 32(sp)
   16d7a: e2 6c        	ld	s9, 24(sp)
   16d7c: 42 6d        	ld	s10, 16(sp)
   16d7e: a2 6d        	ld	s11, 8(sp)
   16d80: 65 61        	addi	sp, sp, 112
   16d82: 82 87        	jr	a5
   16d84: 03 24 0c 03  	lw	s0, 48(s8)
   16d88: 13 05 00 03  	li	a0, 48
   16d8c: 83 45 8c 03  	lbu	a1, 56(s8)
   16d90: 2e e0        	sd	a1, 0(sp)
   16d92: 83 3d 0c 02  	ld	s11, 32(s8)
   16d96: 83 34 8c 02  	ld	s1, 40(s8)
   16d9a: 23 28 ac 02  	sw	a0, 48(s8)
   16d9e: 85 4b        	li	s7, 1
   16da0: 23 0c 7c 03  	sb	s7, 56(s8)
   16da4: 6e 85        	mv	a0, s11
   16da6: a6 85        	mv	a1, s1
   16da8: 56 86        	mv	a2, s5
   16daa: d2 86        	mv	a3, s4
   16dac: 5a 87        	mv	a4, s6
   16dae: 97 00 00 00  	auipc	ra, 0
   16db2: e7 80 40 0c  	jalr	196(ra)
   16db6: 41 f5        	bnez	a0, 0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16db8: 22 8a        	mv	s4, s0
   16dba: 33 04 9d 41  	sub	s0, s10, s9
   16dbe: 05 04        	addi	s0, s0, 1
   16dc0: 7d 14        	addi	s0, s0, -1
   16dc2: 51 c4        	beqz	s0, 0x16e4e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x1e8>
   16dc4: 90 70        	ld	a2, 32(s1)
   16dc6: 93 05 00 03  	li	a1, 48
   16dca: 6e 85        	mv	a0, s11
   16dcc: 02 96        	jalr	a2
   16dce: 6d d9        	beqz	a0, 0x16dc0 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x15a>
   16dd0: bd b7        	j	0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16dd2: 89 45        	li	a1, 2
   16dd4: 63 18 b5 00  	bne	a0, a1, 0x16de4 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x17e>
   16dd8: 13 d5 1c 00  	srli	a0, s9, 1
   16ddc: 85 0c        	addi	s9, s9, 1
   16dde: 93 dc 1c 00  	srli	s9, s9, 1
   16de2: 19 a0        	j	0x16de8 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x182>
   16de4: 66 85        	mv	a0, s9
   16de6: 81 4c        	li	s9, 0
   16de8: 03 3d 0c 02  	ld	s10, 32(s8)
   16dec: 83 34 8c 02  	ld	s1, 40(s8)
   16df0: 03 2c 0c 03  	lw	s8, 48(s8)
   16df4: 13 04 15 00  	addi	s0, a0, 1
   16df8: 7d 14        	addi	s0, s0, -1
   16dfa: 01 c8        	beqz	s0, 0x16e0a <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x1a4>
   16dfc: 90 70        	ld	a2, 32(s1)
   16dfe: 6a 85        	mv	a0, s10
   16e00: e2 85        	mv	a1, s8
   16e02: 02 96        	jalr	a2
   16e04: 75 d9        	beqz	a0, 0x16df8 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x192>
   16e06: 85 4b        	li	s7, 1
   16e08: 1d bf        	j	0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e0a: 6a 85        	mv	a0, s10
   16e0c: a6 85        	mv	a1, s1
   16e0e: 56 86        	mv	a2, s5
   16e10: d2 86        	mv	a3, s4
   16e12: 5a 87        	mv	a4, s6
   16e14: 97 00 00 00  	auipc	ra, 0
   16e18: e7 80 e0 05  	jalr	94(ra)
   16e1c: 85 4b        	li	s7, 1
   16e1e: 05 f1        	bnez	a0, 0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e20: 94 6c        	ld	a3, 24(s1)
   16e22: 6a 85        	mv	a0, s10
   16e24: ca 85        	mv	a1, s2
   16e26: 4e 86        	mv	a2, s3
   16e28: 82 96        	jalr	a3
   16e2a: 11 f9        	bnez	a0, 0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e2c: 33 09 90 41  	neg	s2, s9
   16e30: fd 59        	li	s3, -1
   16e32: 7d 54        	li	s0, -1
   16e34: 33 05 89 00  	add	a0, s2, s0
   16e38: 63 09 35 03  	beq	a0, s3, 0x16e6a <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x204>
   16e3c: 90 70        	ld	a2, 32(s1)
   16e3e: 6a 85        	mv	a0, s10
   16e40: e2 85        	mv	a1, s8
   16e42: 02 96        	jalr	a2
   16e44: 05 04        	addi	s0, s0, 1
   16e46: 7d d5        	beqz	a0, 0x16e34 <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0x1ce>
   16e48: b3 3b 94 01  	sltu	s7, s0, s9
   16e4c: cd bd        	j	0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e4e: 94 6c        	ld	a3, 24(s1)
   16e50: 6e 85        	mv	a0, s11
   16e52: ca 85        	mv	a1, s2
   16e54: 4e 86        	mv	a2, s3
   16e56: 82 96        	jalr	a3
   16e58: e3 13 05 ee  	bnez	a0, 0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e5c: 81 4b        	li	s7, 0
   16e5e: 23 28 4c 03  	sw	s4, 48(s8)
   16e62: 02 65        	ld	a0, 0(sp)
   16e64: 23 0c ac 02  	sb	a0, 56(s8)
   16e68: d9 bd        	j	0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>
   16e6a: 66 84        	mv	s0, s9
   16e6c: b3 bb 9c 01  	sltu	s7, s9, s9
   16e70: f9 b5        	j	0x16d3e <_ZN4core3fmt9Formatter12pad_integral17h4bb8ae7464bae8d7E+0xd8>

0000000000016e72 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hb4bb43a03dbc37c9E>:
   16e72: 79 71        	addi	sp, sp, -48
   16e74: 06 f4        	sd	ra, 40(sp)
   16e76: 22 f0        	sd	s0, 32(sp)
   16e78: 26 ec        	sd	s1, 24(sp)
   16e7a: 4a e8        	sd	s2, 16(sp)
   16e7c: 4e e4        	sd	s3, 8(sp)
   16e7e: 9b 07 06 00  	sext.w	a5, a2
   16e82: 37 08 11 00  	lui	a6, 272
   16e86: 3a 89        	mv	s2, a4
   16e88: b6 84        	mv	s1, a3
   16e8a: 2e 84        	mv	s0, a1
   16e8c: aa 89        	mv	s3, a0
   16e8e: 63 89 07 01  	beq	a5, a6, 0x16ea0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hb4bb43a03dbc37c9E+0x2e>
   16e92: 14 70        	ld	a3, 32(s0)
   16e94: 4e 85        	mv	a0, s3
   16e96: b2 85        	mv	a1, a2
   16e98: 82 96        	jalr	a3
   16e9a: aa 85        	mv	a1, a0
   16e9c: 05 45        	li	a0, 1
   16e9e: 91 ed        	bnez	a1, 0x16eba <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hb4bb43a03dbc37c9E+0x48>
   16ea0: 81 cc        	beqz	s1, 0x16eb8 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hb4bb43a03dbc37c9E+0x46>
   16ea2: 1c 6c        	ld	a5, 24(s0)
   16ea4: 4e 85        	mv	a0, s3
   16ea6: a6 85        	mv	a1, s1
   16ea8: 4a 86        	mv	a2, s2
   16eaa: a2 70        	ld	ra, 40(sp)
   16eac: 02 74        	ld	s0, 32(sp)
   16eae: e2 64        	ld	s1, 24(sp)
   16eb0: 42 69        	ld	s2, 16(sp)
   16eb2: a2 69        	ld	s3, 8(sp)
   16eb4: 45 61        	addi	sp, sp, 48
   16eb6: 82 87        	jr	a5
   16eb8: 01 45        	li	a0, 0
   16eba: a2 70        	ld	ra, 40(sp)
   16ebc: 02 74        	ld	s0, 32(sp)
   16ebe: e2 64        	ld	s1, 24(sp)
   16ec0: 42 69        	ld	s2, 16(sp)
   16ec2: a2 69        	ld	s3, 8(sp)
   16ec4: 45 61        	addi	sp, sp, 48
   16ec6: 82 80        	ret

0000000000016ec8 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E>:
   16ec8: 39 71        	addi	sp, sp, -64
   16eca: 06 fc        	sd	ra, 56(sp)
   16ecc: 22 f8        	sd	s0, 48(sp)
   16ece: 26 f4        	sd	s1, 40(sp)
   16ed0: 4a f0        	sd	s2, 32(sp)
   16ed2: 4e ec        	sd	s3, 24(sp)
   16ed4: 52 e8        	sd	s4, 16(sp)
   16ed6: 56 e4        	sd	s5, 8(sp)
   16ed8: 5a e0        	sd	s6, 0(sp)
   16eda: 2a 8b        	mv	s6, a0
   16edc: 83 32 05 00  	ld	t0, 0(a0)
   16ee0: 08 69        	ld	a0, 16(a0)
   16ee2: b3 e6 a2 00  	or	a3, t0, a0
   16ee6: b2 89        	mv	s3, a2
   16ee8: 2e 89        	mv	s2, a1
   16eea: 63 88 06 16  	beqz	a3, 0x1705a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x192>
   16eee: 63 09 05 10  	beqz	a0, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16ef2: 03 37 8b 01  	ld	a4, 24(s6)
   16ef6: 01 45        	li	a0, 0
   16ef8: b3 06 39 01  	add	a3, s2, s3
   16efc: 05 07        	addi	a4, a4, 1
   16efe: 37 03 11 00  	lui	t1, 272
   16f02: 93 08 f0 0d  	li	a7, 223
   16f06: 13 08 00 0f  	li	a6, 240
   16f0a: 4a 86        	mv	a2, s2
   16f0c: 01 a8        	j	0x16f1c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x54>
   16f0e: 93 05 16 00  	addi	a1, a2, 1
   16f12: 11 8d        	sub	a0, a0, a2
   16f14: 2e 95        	add	a0, a0, a1
   16f16: 2e 86        	mv	a2, a1
   16f18: 63 04 64 0e  	beq	s0, t1, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16f1c: 7d 17        	addi	a4, a4, -1
   16f1e: 25 c7        	beqz	a4, 0x16f86 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0xbe>
   16f20: 63 00 d6 0e  	beq	a2, a3, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16f24: 83 05 06 00  	lb	a1, 0(a2)
   16f28: 13 f4 f5 0f  	andi	s0, a1, 255
   16f2c: e3 d1 05 fe  	bgez	a1, 0x16f0e <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x46>
   16f30: 83 45 16 00  	lbu	a1, 1(a2)
   16f34: 93 74 f4 01  	andi	s1, s0, 31
   16f38: 93 f7 f5 03  	andi	a5, a1, 63
   16f3c: 63 f9 88 02  	bgeu	a7, s0, 0x16f6e <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0xa6>
   16f40: 83 45 26 00  	lbu	a1, 2(a2)
   16f44: 9a 07        	slli	a5, a5, 6
   16f46: 93 f5 f5 03  	andi	a1, a1, 63
   16f4a: cd 8f        	or	a5, a5, a1
   16f4c: 63 67 04 03  	bltu	s0, a6, 0x16f7a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0xb2>
   16f50: 83 45 36 00  	lbu	a1, 3(a2)
   16f54: f6 14        	slli	s1, s1, 61
   16f56: ad 90        	srli	s1, s1, 43
   16f58: 9a 07        	slli	a5, a5, 6
   16f5a: 93 f5 f5 03  	andi	a1, a1, 63
   16f5e: dd 8d        	or	a1, a1, a5
   16f60: 33 e4 95 00  	or	s0, a1, s1
   16f64: 63 0e 64 08  	beq	s0, t1, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16f68: 93 05 46 00  	addi	a1, a2, 4
   16f6c: 5d b7        	j	0x16f12 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x4a>
   16f6e: 93 05 26 00  	addi	a1, a2, 2
   16f72: 13 94 64 00  	slli	s0, s1, 6
   16f76: 5d 8c        	or	s0, s0, a5
   16f78: 69 bf        	j	0x16f12 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x4a>
   16f7a: 93 05 36 00  	addi	a1, a2, 3
   16f7e: 13 94 c4 00  	slli	s0, s1, 12
   16f82: 5d 8c        	or	s0, s0, a5
   16f84: 79 b7        	j	0x16f12 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x4a>
   16f86: 63 0d d6 06  	beq	a2, a3, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16f8a: 83 05 06 00  	lb	a1, 0(a2)
   16f8e: 63 d3 05 04  	bgez	a1, 0x16fd4 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x10c>
   16f92: 93 f5 f5 0f  	andi	a1, a1, 255
   16f96: 93 06 00 0e  	li	a3, 224
   16f9a: 63 ed d5 02  	bltu	a1, a3, 0x16fd4 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x10c>
   16f9e: 93 06 00 0f  	li	a3, 240
   16fa2: 63 e9 d5 02  	bltu	a1, a3, 0x16fd4 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x10c>
   16fa6: 83 46 16 00  	lbu	a3, 1(a2)
   16faa: 03 47 26 00  	lbu	a4, 2(a2)
   16fae: 93 f6 f6 03  	andi	a3, a3, 63
   16fb2: 13 77 f7 03  	andi	a4, a4, 63
   16fb6: 03 46 36 00  	lbu	a2, 3(a2)
   16fba: f6 15        	slli	a1, a1, 61
   16fbc: ad 91        	srli	a1, a1, 43
   16fbe: b2 06        	slli	a3, a3, 12
   16fc0: 1a 07        	slli	a4, a4, 6
   16fc2: d9 8e        	or	a3, a3, a4
   16fc4: 13 76 f6 03  	andi	a2, a2, 63
   16fc8: 55 8e        	or	a2, a2, a3
   16fca: d1 8d        	or	a1, a1, a2
   16fcc: 37 06 11 00  	lui	a2, 272
   16fd0: 63 88 c5 02  	beq	a1, a2, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16fd4: 0d c1        	beqz	a0, 0x16ff6 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x12e>
   16fd6: 63 7e 35 01  	bgeu	a0, s3, 0x16ff2 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x12a>
   16fda: b3 05 a9 00  	add	a1, s2, a0
   16fde: 83 85 05 00  	lb	a1, 0(a1)
   16fe2: 13 06 00 fc  	li	a2, -64
   16fe6: 63 d8 c5 00  	bge	a1, a2, 0x16ff6 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x12e>
   16fea: 81 45        	li	a1, 0
   16fec: 63 18 00 00  	bnez	zero, 0x16ffc <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x134>
   16ff0: 01 a8        	j	0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16ff2: e3 1c 35 ff  	bne	a0, s3, 0x16fea <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x122>
   16ff6: ca 85        	mv	a1, s2
   16ff8: 63 04 09 00  	beqz	s2, 0x17000 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x138>
   16ffc: aa 89        	mv	s3, a0
   16ffe: 2e 89        	mv	s2, a1
   17000: 63 8d 02 04  	beqz	t0, 0x1705a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x192>
   17004: 03 34 8b 00  	ld	s0, 8(s6)
   17008: 13 05 00 02  	li	a0, 32
   1700c: 63 ff a9 02  	bgeu	s3, a0, 0x1704a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x182>
   17010: 01 45        	li	a0, 0
   17012: 63 8e 09 00  	beqz	s3, 0x1702e <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x166>
   17016: ca 85        	mv	a1, s2
   17018: 4e 86        	mv	a2, s3
   1701a: 83 86 05 00  	lb	a3, 0(a1)
   1701e: 93 a6 06 fc  	slti	a3, a3, -64
   17022: 93 c6 16 00  	xori	a3, a3, 1
   17026: 36 95        	add	a0, a0, a3
   17028: 7d 16        	addi	a2, a2, -1
   1702a: 85 05        	addi	a1, a1, 1
   1702c: 7d f6        	bnez	a2, 0x1701a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x152>
   1702e: 63 76 85 02  	bgeu	a0, s0, 0x1705a <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x192>
   17032: 03 46 8b 03  	lbu	a2, 56(s6)
   17036: 81 45        	li	a1, 0
   17038: 85 46        	li	a3, 1
   1703a: 33 0a a4 40  	sub	s4, s0, a0
   1703e: 63 cf c6 02  	blt	a3, a2, 0x1707c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1b4>
   17042: 29 c6        	beqz	a2, 0x1708c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1c4>
   17044: d2 85        	mv	a1, s4
   17046: 01 4a        	li	s4, 0
   17048: 91 a0        	j	0x1708c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1c4>
   1704a: 4a 85        	mv	a0, s2
   1704c: ce 85        	mv	a1, s3
   1704e: 97 00 00 00  	auipc	ra, 0
   17052: e7 80 60 23  	jalr	566(ra)
   17056: e3 6e 85 fc  	bltu	a0, s0, 0x17032 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x16a>
   1705a: 83 35 8b 02  	ld	a1, 40(s6)
   1705e: 03 35 0b 02  	ld	a0, 32(s6)
   17062: 9c 6d        	ld	a5, 24(a1)
   17064: ca 85        	mv	a1, s2
   17066: 4e 86        	mv	a2, s3
   17068: e2 70        	ld	ra, 56(sp)
   1706a: 42 74        	ld	s0, 48(sp)
   1706c: a2 74        	ld	s1, 40(sp)
   1706e: 02 79        	ld	s2, 32(sp)
   17070: e2 69        	ld	s3, 24(sp)
   17072: 42 6a        	ld	s4, 16(sp)
   17074: a2 6a        	ld	s5, 8(sp)
   17076: 02 6b        	ld	s6, 0(sp)
   17078: 21 61        	addi	sp, sp, 64
   1707a: 82 87        	jr	a5
   1707c: 09 45        	li	a0, 2
   1707e: 63 17 a6 00  	bne	a2, a0, 0x1708c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1c4>
   17082: 93 55 1a 00  	srli	a1, s4, 1
   17086: 05 0a        	addi	s4, s4, 1
   17088: 13 5a 1a 00  	srli	s4, s4, 1
   1708c: 83 3a 0b 02  	ld	s5, 32(s6)
   17090: 03 34 8b 02  	ld	s0, 40(s6)
   17094: 03 2b 0b 03  	lw	s6, 48(s6)
   17098: 93 84 15 00  	addi	s1, a1, 1
   1709c: fd 14        	addi	s1, s1, -1
   1709e: 81 c8        	beqz	s1, 0x170ae <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1e6>
   170a0: 10 70        	ld	a2, 32(s0)
   170a2: 56 85        	mv	a0, s5
   170a4: da 85        	mv	a1, s6
   170a6: 02 96        	jalr	a2
   170a8: 75 d9        	beqz	a0, 0x1709c <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1d4>
   170aa: 05 45        	li	a0, 1
   170ac: 1d a8        	j	0x170e2 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x21a>
   170ae: 14 6c        	ld	a3, 24(s0)
   170b0: 56 85        	mv	a0, s5
   170b2: ca 85        	mv	a1, s2
   170b4: 4e 86        	mv	a2, s3
   170b6: 82 96        	jalr	a3
   170b8: aa 85        	mv	a1, a0
   170ba: 05 45        	li	a0, 1
   170bc: 9d e1        	bnez	a1, 0x170e2 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x21a>
   170be: 33 09 40 41  	neg	s2, s4
   170c2: fd 59        	li	s3, -1
   170c4: fd 54        	li	s1, -1
   170c6: 33 05 99 00  	add	a0, s2, s1
   170ca: 63 09 35 01  	beq	a0, s3, 0x170dc <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x214>
   170ce: 10 70        	ld	a2, 32(s0)
   170d0: 56 85        	mv	a0, s5
   170d2: da 85        	mv	a1, s6
   170d4: 02 96        	jalr	a2
   170d6: 85 04        	addi	s1, s1, 1
   170d8: 7d d5        	beqz	a0, 0x170c6 <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x1fe>
   170da: 11 a0        	j	0x170de <_ZN4core3fmt9Formatter3pad17hc44a304906562143E+0x216>
   170dc: d2 84        	mv	s1, s4
   170de: 33 b5 44 01  	sltu	a0, s1, s4
   170e2: e2 70        	ld	ra, 56(sp)
   170e4: 42 74        	ld	s0, 48(sp)
   170e6: a2 74        	ld	s1, 40(sp)
   170e8: 02 79        	ld	s2, 32(sp)
   170ea: e2 69        	ld	s3, 24(sp)
   170ec: 42 6a        	ld	s4, 16(sp)
   170ee: a2 6a        	ld	s5, 8(sp)
   170f0: 02 6b        	ld	s6, 0(sp)
   170f2: 21 61        	addi	sp, sp, 64
   170f4: 82 80        	ret

00000000000170f6 <_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$9write_str17hc2f4a03db9f42a3eE>:
   170f6: 14 75        	ld	a3, 40(a0)
   170f8: 08 71        	ld	a0, 32(a0)
   170fa: 9c 6e        	ld	a5, 24(a3)
   170fc: 82 87        	jr	a5

00000000000170fe <_ZN4core3fmt9Formatter26debug_struct_field2_finish17hb102e45f814e088aE>:
   170fe: 59 71        	addi	sp, sp, -112
   17100: 86 f4        	sd	ra, 104(sp)
   17102: a2 f0        	sd	s0, 96(sp)
   17104: a6 ec        	sd	s1, 88(sp)
   17106: ca e8        	sd	s2, 80(sp)
   17108: ce e4        	sd	s3, 72(sp)
   1710a: d2 e0        	sd	s4, 64(sp)
   1710c: 56 fc        	sd	s5, 56(sp)
   1710e: 5a f8        	sd	s6, 48(sp)
   17110: 5e f4        	sd	s7, 40(sp)
   17112: 62 f0        	sd	s8, 32(sp)
   17114: 66 ec        	sd	s9, 24(sp)
   17116: 2a 84        	mv	s0, a0
   17118: 46 79        	ld	s2, 112(sp)
   1711a: 04 75        	ld	s1, 40(a0)
   1711c: 66 7a        	ld	s4, 120(sp)
   1711e: 8a 69        	ld	s3, 128(sp)
   17120: 08 71        	ld	a0, 32(a0)
   17122: 84 6c        	ld	s1, 24(s1)
   17124: c6 8a        	mv	s5, a7
   17126: 42 8b        	mv	s6, a6
   17128: be 8b        	mv	s7, a5
   1712a: 3a 8c        	mv	s8, a4
   1712c: b6 8c        	mv	s9, a3
   1712e: 82 94        	jalr	s1
   17130: 22 e4        	sd	s0, 8(sp)
   17132: 23 08 a1 00  	sb	a0, 16(sp)
   17136: a3 08 01 00  	sb	zero, 17(sp)
   1713a: 28 00        	addi	a0, sp, 8
   1713c: e6 85        	mv	a1, s9
   1713e: 62 86        	mv	a2, s8
   17140: de 86        	mv	a3, s7
   17142: 5a 87        	mv	a4, s6
   17144: 97 f0 ff ff  	auipc	ra, 1048575
   17148: e7 80 60 7f  	jalr	2038(ra)
   1714c: 28 00        	addi	a0, sp, 8
   1714e: d6 85        	mv	a1, s5
   17150: 4a 86        	mv	a2, s2
   17152: d2 86        	mv	a3, s4
   17154: 4e 87        	mv	a4, s3
   17156: 97 f0 ff ff  	auipc	ra, 1048575
   1715a: e7 80 40 7e  	jalr	2020(ra)
   1715e: 03 45 11 01  	lbu	a0, 17(sp)
   17162: 83 45 01 01  	lbu	a1, 16(sp)
   17166: 0d c1        	beqz	a0, 0x17188 <.Lpcrel_hi605+0xc>
   17168: 05 45        	li	a0, 1
   1716a: 9d e9        	bnez	a1, 0x171a0 <.Lpcrel_hi606+0xc>
   1716c: 22 65        	ld	a0, 8(sp)
   1716e: 83 45 45 03  	lbu	a1, 52(a0)
   17172: 91 89        	andi	a1, a1, 4
   17174: 89 ed        	bnez	a1, 0x1718e <.Lpcrel_hi605+0x12>
   17176: 0c 75        	ld	a1, 40(a0)
   17178: 08 71        	ld	a0, 32(a0)
   1717a: 94 6d        	ld	a3, 24(a1)

000000000001717c <.Lpcrel_hi605>:
   1717c: 97 35 00 00  	auipc	a1, 3
   17180: 93 85 75 d3  	addi	a1, a1, -713
   17184: 09 46        	li	a2, 2
   17186: 21 a8        	j	0x1719e <.Lpcrel_hi606+0xa>
   17188: 33 35 b0 00  	snez	a0, a1
   1718c: 11 a8        	j	0x171a0 <.Lpcrel_hi606+0xc>
   1718e: 0c 75        	ld	a1, 40(a0)
   17190: 08 71        	ld	a0, 32(a0)
   17192: 94 6d        	ld	a3, 24(a1)

0000000000017194 <.Lpcrel_hi606>:
   17194: 97 35 00 00  	auipc	a1, 3
   17198: 93 85 e5 d1  	addi	a1, a1, -738
   1719c: 05 46        	li	a2, 1
   1719e: 82 96        	jalr	a3
   171a0: a6 70        	ld	ra, 104(sp)
   171a2: 06 74        	ld	s0, 96(sp)
   171a4: e6 64        	ld	s1, 88(sp)
   171a6: 46 69        	ld	s2, 80(sp)
   171a8: a6 69        	ld	s3, 72(sp)
   171aa: 06 6a        	ld	s4, 64(sp)
   171ac: e2 7a        	ld	s5, 56(sp)
   171ae: 42 7b        	ld	s6, 48(sp)
   171b0: a2 7b        	ld	s7, 40(sp)
   171b2: 02 7c        	ld	s8, 32(sp)
   171b4: e2 6c        	ld	s9, 24(sp)
   171b6: 65 61        	addi	sp, sp, 112
   171b8: 82 80        	ret

00000000000171ba <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h3859daa8f7abae14E>:
   171ba: ae 86        	mv	a3, a1
   171bc: aa 85        	mv	a1, a0
   171be: 32 85        	mv	a0, a2
   171c0: 36 86        	mv	a2, a3
   171c2: 17 03 00 00  	auipc	t1, 0
   171c6: 67 00 63 d0  	jr	-762(t1)

00000000000171ca <_ZN4core5slice5index26slice_start_index_len_fail17hb0405f4486f6da81E>:
   171ca: 59 71        	addi	sp, sp, -112
   171cc: 86 f4        	sd	ra, 104(sp)
   171ce: 2a e4        	sd	a0, 8(sp)
   171d0: 2e e8        	sd	a1, 16(sp)
   171d2: 28 00        	addi	a0, sp, 8
   171d4: aa e4        	sd	a0, 72(sp)

00000000000171d6 <.Lpcrel_hi658>:
   171d6: 17 05 00 00  	auipc	a0, 0
   171da: 13 05 e5 72  	addi	a0, a0, 1838
   171de: aa e8        	sd	a0, 80(sp)
   171e0: 0c 08        	addi	a1, sp, 16
   171e2: ae ec        	sd	a1, 88(sp)
   171e4: aa f0        	sd	a0, 96(sp)

00000000000171e6 <.Lpcrel_hi659>:
   171e6: 17 35 00 00  	auipc	a0, 3
   171ea: 13 05 a5 e0  	addi	a0, a0, -502
   171ee: 2a ec        	sd	a0, 24(sp)
   171f0: 09 45        	li	a0, 2
   171f2: 2a f0        	sd	a0, 32(sp)
   171f4: 02 fc        	sd	zero, 56(sp)
   171f6: ac 00        	addi	a1, sp, 72
   171f8: 2e f4        	sd	a1, 40(sp)
   171fa: 2a f8        	sd	a0, 48(sp)
   171fc: 28 08        	addi	a0, sp, 24
   171fe: b2 85        	mv	a1, a2
   17200: 97 f0 ff ff  	auipc	ra, 1048575
   17204: e7 80 00 42  	jalr	1056(ra)

0000000000017208 <_ZN4core5slice5index24slice_end_index_len_fail17h8be603e93380e26cE>:
   17208: 59 71        	addi	sp, sp, -112
   1720a: 86 f4        	sd	ra, 104(sp)
   1720c: 2a e4        	sd	a0, 8(sp)
   1720e: 2e e8        	sd	a1, 16(sp)
   17210: 28 00        	addi	a0, sp, 8
   17212: aa e4        	sd	a0, 72(sp)

0000000000017214 <.Lpcrel_hi660>:
   17214: 17 05 00 00  	auipc	a0, 0
   17218: 13 05 05 6f  	addi	a0, a0, 1776
   1721c: aa e8        	sd	a0, 80(sp)
   1721e: 0c 08        	addi	a1, sp, 16
   17220: ae ec        	sd	a1, 88(sp)
   17222: aa f0        	sd	a0, 96(sp)

0000000000017224 <.Lpcrel_hi661>:
   17224: 17 35 00 00  	auipc	a0, 3
   17228: 13 05 c5 de  	addi	a0, a0, -532
   1722c: 2a ec        	sd	a0, 24(sp)
   1722e: 09 45        	li	a0, 2
   17230: 2a f0        	sd	a0, 32(sp)
   17232: 02 fc        	sd	zero, 56(sp)
   17234: ac 00        	addi	a1, sp, 72
   17236: 2e f4        	sd	a1, 40(sp)
   17238: 2a f8        	sd	a0, 48(sp)
   1723a: 28 08        	addi	a0, sp, 24
   1723c: b2 85        	mv	a1, a2
   1723e: 97 f0 ff ff  	auipc	ra, 1048575
   17242: e7 80 20 3e  	jalr	994(ra)

0000000000017246 <_ZN4core5slice5index22slice_index_order_fail17h9037501a793058baE>:
   17246: 59 71        	addi	sp, sp, -112
   17248: 86 f4        	sd	ra, 104(sp)
   1724a: 2a e4        	sd	a0, 8(sp)
   1724c: 2e e8        	sd	a1, 16(sp)
   1724e: 28 00        	addi	a0, sp, 8
   17250: aa e4        	sd	a0, 72(sp)

0000000000017252 <.Lpcrel_hi662>:
   17252: 17 05 00 00  	auipc	a0, 0
   17256: 13 05 25 6b  	addi	a0, a0, 1714
   1725a: aa e8        	sd	a0, 80(sp)
   1725c: 0c 08        	addi	a1, sp, 16
   1725e: ae ec        	sd	a1, 88(sp)
   17260: aa f0        	sd	a0, 96(sp)

0000000000017262 <.Lpcrel_hi663>:
   17262: 17 35 00 00  	auipc	a0, 3
   17266: 13 05 65 df  	addi	a0, a0, -522
   1726a: 2a ec        	sd	a0, 24(sp)
   1726c: 09 45        	li	a0, 2
   1726e: 2a f0        	sd	a0, 32(sp)
   17270: 02 fc        	sd	zero, 56(sp)
   17272: ac 00        	addi	a1, sp, 72
   17274: 2e f4        	sd	a1, 40(sp)
   17276: 2a f8        	sd	a0, 48(sp)
   17278: 28 08        	addi	a0, sp, 24
   1727a: b2 85        	mv	a1, a2
   1727c: 97 f0 ff ff  	auipc	ra, 1048575
   17280: e7 80 40 3a  	jalr	932(ra)

0000000000017284 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE>:
   17284: 2a 86        	mv	a2, a0
   17286: 93 07 75 00  	addi	a5, a0, 7
   1728a: e1 9b        	andi	a5, a5, -8
   1728c: b3 88 a7 40  	sub	a7, a5, a0
   17290: 63 ef 15 11  	bltu	a1, a7, 0x173ae <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x12a>
   17294: 33 88 15 41  	sub	a6, a1, a7
   17298: 93 52 38 00  	srli	t0, a6, 3
   1729c: 63 89 02 10  	beqz	t0, 0x173ae <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x12a>
   172a0: 93 75 78 00  	andi	a1, a6, 7
   172a4: 01 45        	li	a0, 0
   172a6: 63 8f c7 00  	beq	a5, a2, 0x172c4 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x40>
   172aa: b3 07 f6 40  	sub	a5, a2, a5
   172ae: b2 86        	mv	a3, a2
   172b0: 03 87 06 00  	lb	a4, 0(a3)
   172b4: 13 27 07 fc  	slti	a4, a4, -64
   172b8: 13 47 17 00  	xori	a4, a4, 1
   172bc: 3a 95        	add	a0, a0, a4
   172be: 85 07        	addi	a5, a5, 1
   172c0: 85 06        	addi	a3, a3, 1
   172c2: fd f7        	bnez	a5, 0x172b0 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x2c>
   172c4: 33 07 16 01  	add	a4, a2, a7
   172c8: 01 46        	li	a2, 0
   172ca: 91 cd        	beqz	a1, 0x172e6 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x62>
   172cc: 93 76 88 ff  	andi	a3, a6, -8
   172d0: ba 96        	add	a3, a3, a4
   172d2: 83 87 06 00  	lb	a5, 0(a3)
   172d6: 93 a7 07 fc  	slti	a5, a5, -64
   172da: 93 c7 17 00  	xori	a5, a5, 1
   172de: 3e 96        	add	a2, a2, a5
   172e0: fd 15        	addi	a1, a1, -1
   172e2: 85 06        	addi	a3, a3, 1
   172e4: fd f5        	bnez	a1, 0x172d2 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x4e>
   172e6: b7 05 01 01  	lui	a1, 4112
   172ea: 9b 85 15 10  	addiw	a1, a1, 257
   172ee: 93 96 05 02  	slli	a3, a1, 32
   172f2: b3 8e d5 00  	add	t4, a1, a3
   172f6: b7 06 ff 00  	lui	a3, 4080
   172fa: 9b 88 f6 0f  	addiw	a7, a3, 255
   172fe: 93 96 08 02  	slli	a3, a7, 32
   17302: b6 98        	add	a7, a7, a3
   17304: c1 66        	lui	a3, 16
   17306: 85 26        	addiw	a3, a3, 1
   17308: 13 98 06 02  	slli	a6, a3, 32
   1730c: 36 98        	add	a6, a6, a3
   1730e: 32 95        	add	a0, a0, a2
   17310: 1d a0        	j	0x17336 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0xb2>
   17312: 13 97 33 00  	slli	a4, t2, 3
   17316: 1a 97        	add	a4, a4, t1
   17318: b3 02 7e 40  	sub	t0, t3, t2
   1731c: 93 f5 33 00  	andi	a1, t2, 3
   17320: b3 76 16 01  	and	a3, a2, a7
   17324: 21 82        	srli	a2, a2, 8
   17326: 33 76 16 01  	and	a2, a2, a7
   1732a: 36 96        	add	a2, a2, a3
   1732c: 33 06 06 03  	mul	a2, a2, a6
   17330: 41 92        	srli	a2, a2, 48
   17332: 32 95        	add	a0, a0, a2
   17334: d1 e9        	bnez	a1, 0x173c8 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x144>
   17336: 63 88 02 08  	beqz	t0, 0x173c6 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x142>
   1733a: 16 8e        	mv	t3, t0
   1733c: 3a 83        	mv	t1, a4
   1733e: 13 06 00 0c  	li	a2, 192
   17342: 96 83        	mv	t2, t0
   17344: 63 e4 c2 00  	bltu	t0, a2, 0x1734c <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0xc8>
   17348: 93 03 00 0c  	li	t2, 192
   1734c: 01 46        	li	a2, 0
   1734e: 93 d6 23 00  	srli	a3, t2, 2
   17352: e1 d2        	beqz	a3, 0x17312 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x8e>
   17354: 96 06        	slli	a3, a3, 5
   17356: b3 02 d3 00  	add	t0, t1, a3
   1735a: 9a 86        	mv	a3, t1
   1735c: 9c 62        	ld	a5, 0(a3)
   1735e: 13 c7 f7 ff  	not	a4, a5
   17362: 1d 83        	srli	a4, a4, 7
   17364: 99 83        	srli	a5, a5, 6
   17366: 8c 66        	ld	a1, 8(a3)
   17368: 5d 8f        	or	a4, a4, a5
   1736a: 33 77 d7 01  	and	a4, a4, t4
   1736e: 3a 96        	add	a2, a2, a4
   17370: 13 c7 f5 ff  	not	a4, a1
   17374: 1d 83        	srli	a4, a4, 7
   17376: 9c 6a        	ld	a5, 16(a3)
   17378: 99 81        	srli	a1, a1, 6
   1737a: d9 8d        	or	a1, a1, a4
   1737c: b3 f5 d5 01  	and	a1, a1, t4
   17380: 13 c7 f7 ff  	not	a4, a5
   17384: 1d 83        	srli	a4, a4, 7
   17386: 99 83        	srli	a5, a5, 6
   17388: 5d 8f        	or	a4, a4, a5
   1738a: 9c 6e        	ld	a5, 24(a3)
   1738c: 33 77 d7 01  	and	a4, a4, t4
   17390: ba 95        	add	a1, a1, a4
   17392: b2 95        	add	a1, a1, a2
   17394: 13 c6 f7 ff  	not	a2, a5
   17398: 1d 82        	srli	a2, a2, 7
   1739a: 99 83        	srli	a5, a5, 6
   1739c: 5d 8e        	or	a2, a2, a5
   1739e: 33 76 d6 01  	and	a2, a2, t4
   173a2: 93 86 06 02  	addi	a3, a3, 32
   173a6: 2e 96        	add	a2, a2, a1
   173a8: e3 9a 56 fa  	bne	a3, t0, 0x1735c <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0xd8>
   173ac: 9d b7        	j	0x17312 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x8e>
   173ae: 01 45        	li	a0, 0
   173b0: 99 c9        	beqz	a1, 0x173c6 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x142>
   173b2: 83 06 06 00  	lb	a3, 0(a2)
   173b6: 93 a6 06 fc  	slti	a3, a3, -64
   173ba: 93 c6 16 00  	xori	a3, a3, 1
   173be: 36 95        	add	a0, a0, a3
   173c0: fd 15        	addi	a1, a1, -1
   173c2: 05 06        	addi	a2, a2, 1
   173c4: fd f5        	bnez	a1, 0x173b2 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x12e>
   173c6: 82 80        	ret
   173c8: 01 46        	li	a2, 0
   173ca: 93 f5 c3 0f  	andi	a1, t2, 252
   173ce: 8e 05        	slli	a1, a1, 3
   173d0: 2e 93        	add	t1, t1, a1
   173d2: 93 35 0e 0c  	sltiu	a1, t3, 192
   173d6: bb 05 b0 40  	negw	a1, a1
   173da: b3 75 be 00  	and	a1, t3, a1
   173de: 8d 89        	andi	a1, a1, 3
   173e0: 93 96 35 00  	slli	a3, a1, 3
   173e4: 83 35 03 00  	ld	a1, 0(t1)
   173e8: 21 03        	addi	t1, t1, 8
   173ea: 13 c7 f5 ff  	not	a4, a1
   173ee: 1d 83        	srli	a4, a4, 7
   173f0: 99 81        	srli	a1, a1, 6
   173f2: d9 8d        	or	a1, a1, a4
   173f4: b3 f5 d5 01  	and	a1, a1, t4
   173f8: e1 16        	addi	a3, a3, -8
   173fa: 2e 96        	add	a2, a2, a1
   173fc: e5 f6        	bnez	a3, 0x173e4 <_ZN4core3str5count14do_count_chars17ha9a90475bdd6484fE+0x160>
   173fe: b3 75 16 01  	and	a1, a2, a7
   17402: 21 82        	srli	a2, a2, 8
   17404: 33 76 16 01  	and	a2, a2, a7
   17408: b2 95        	add	a1, a1, a2
   1740a: b3 85 05 03  	mul	a1, a1, a6
   1740e: c1 91        	srli	a1, a1, 48
   17410: 2e 95        	add	a0, a0, a1
   17412: 82 80        	ret

0000000000017414 <_ZN69_$LT$core..num..nonzero..NonZeroUsize$u20$as$u20$core..fmt..Debug$GT$3fmt17he2762a60713cd745E>:
   17414: 41 11        	addi	sp, sp, -16
   17416: 06 e4        	sd	ra, 8(sp)
   17418: 08 61        	ld	a0, 0(a0)
   1741a: 2a e0        	sd	a0, 0(sp)
   1741c: 0a 85        	mv	a0, sp
   1741e: 97 00 00 00  	auipc	ra, 0
   17422: e7 80 00 25  	jalr	592(ra)
   17426: a2 60        	ld	ra, 8(sp)
   17428: 41 01        	addi	sp, sp, 16
   1742a: 82 80        	ret

000000000001742c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h02241493c0e11b00E>:
   1742c: 75 71        	addi	sp, sp, -144
   1742e: 06 e5        	sd	ra, 136(sp)
   17430: 08 41        	lw	a0, 0(a0)
   17432: 2e 88        	mv	a6, a1
   17434: 81 47        	li	a5, 0
   17436: 30 01        	addi	a2, sp, 136
   17438: a9 48        	li	a7, 10
   1743a: 19 a8        	j	0x17450 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h02241493c0e11b00E+0x24>
   1743c: 13 07 f6 ff  	addi	a4, a2, -1
   17440: 1b 55 45 00  	srliw	a0, a0, 4
   17444: b6 95        	add	a1, a1, a3
   17446: a3 0f b6 fe  	sb	a1, -1(a2)
   1744a: 85 07        	addi	a5, a5, 1
   1744c: 3a 86        	mv	a2, a4
   1744e: 11 c9        	beqz	a0, 0x17462 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h02241493c0e11b00E+0x36>
   17450: 93 76 f5 00  	andi	a3, a0, 15
   17454: 93 05 00 03  	li	a1, 48
   17458: e3 e2 16 ff  	bltu	a3, a7, 0x1743c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h02241493c0e11b00E+0x10>
   1745c: 93 05 70 03  	li	a1, 55
   17460: f1 bf        	j	0x1743c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h02241493c0e11b00E+0x10>
   17462: 93 05 00 08  	li	a1, 128
   17466: 33 85 f5 40  	sub	a0, a1, a5
   1746a: 63 e0 a5 02  	bltu	a1, a0, 0x1748a <.Lpcrel_hi964>

000000000001746e <.Lpcrel_hi965>:
   1746e: 17 35 00 00  	auipc	a0, 3
   17472: 13 06 25 a6  	addi	a2, a0, -1438
   17476: 85 45        	li	a1, 1
   17478: 89 46        	li	a3, 2
   1747a: 42 85        	mv	a0, a6
   1747c: 97 f0 ff ff  	auipc	ra, 1048575
   17480: e7 80 a0 7e  	jalr	2026(ra)
   17484: aa 60        	ld	ra, 136(sp)
   17486: 49 61        	addi	sp, sp, 144
   17488: 82 80        	ret

000000000001748a <.Lpcrel_hi964>:
   1748a: 97 35 00 00  	auipc	a1, 3
   1748e: 13 86 e5 a4  	addi	a2, a1, -1458
   17492: 93 05 00 08  	li	a1, 128
   17496: 97 00 00 00  	auipc	ra, 0
   1749a: e7 80 40 d3  	jalr	-716(ra)

000000000001749e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h5c05c55f8f2832ecE>:
   1749e: 75 71        	addi	sp, sp, -144
   174a0: 06 e5        	sd	ra, 136(sp)
   174a2: 08 61        	ld	a0, 0(a0)
   174a4: 2e 88        	mv	a6, a1
   174a6: 81 47        	li	a5, 0
   174a8: 30 01        	addi	a2, sp, 136
   174aa: a9 48        	li	a7, 10
   174ac: 11 a8        	j	0x174c0 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h5c05c55f8f2832ecE+0x22>
   174ae: 13 07 f6 ff  	addi	a4, a2, -1
   174b2: 11 81        	srli	a0, a0, 4
   174b4: b6 95        	add	a1, a1, a3
   174b6: a3 0f b6 fe  	sb	a1, -1(a2)
   174ba: 85 07        	addi	a5, a5, 1
   174bc: 3a 86        	mv	a2, a4
   174be: 11 c9        	beqz	a0, 0x174d2 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h5c05c55f8f2832ecE+0x34>
   174c0: 93 76 f5 00  	andi	a3, a0, 15
   174c4: 93 05 00 03  	li	a1, 48
   174c8: e3 e3 16 ff  	bltu	a3, a7, 0x174ae <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h5c05c55f8f2832ecE+0x10>
   174cc: 93 05 70 05  	li	a1, 87
   174d0: f9 bf        	j	0x174ae <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h5c05c55f8f2832ecE+0x10>
   174d2: 93 05 00 08  	li	a1, 128
   174d6: 33 85 f5 40  	sub	a0, a1, a5
   174da: 63 e0 a5 02  	bltu	a1, a0, 0x174fa <.Lpcrel_hi970>

00000000000174de <.Lpcrel_hi971>:
   174de: 17 35 00 00  	auipc	a0, 3
   174e2: 13 06 25 9f  	addi	a2, a0, -1550
   174e6: 85 45        	li	a1, 1
   174e8: 89 46        	li	a3, 2
   174ea: 42 85        	mv	a0, a6
   174ec: 97 f0 ff ff  	auipc	ra, 1048575
   174f0: e7 80 a0 77  	jalr	1914(ra)
   174f4: aa 60        	ld	ra, 136(sp)
   174f6: 49 61        	addi	sp, sp, 144
   174f8: 82 80        	ret

00000000000174fa <.Lpcrel_hi970>:
   174fa: 97 35 00 00  	auipc	a1, 3
   174fe: 13 86 e5 9d  	addi	a2, a1, -1570
   17502: 93 05 00 08  	li	a1, 128
   17506: 97 00 00 00  	auipc	ra, 0
   1750a: e7 80 40 cc  	jalr	-828(ra)

000000000001750e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h9fcabff5ebdca4b3E>:
   1750e: 75 71        	addi	sp, sp, -144
   17510: 06 e5        	sd	ra, 136(sp)
   17512: 08 61        	ld	a0, 0(a0)
   17514: 2e 88        	mv	a6, a1
   17516: 81 47        	li	a5, 0
   17518: 30 01        	addi	a2, sp, 136
   1751a: a9 48        	li	a7, 10
   1751c: 11 a8        	j	0x17530 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h9fcabff5ebdca4b3E+0x22>
   1751e: 13 07 f6 ff  	addi	a4, a2, -1
   17522: 11 81        	srli	a0, a0, 4
   17524: b6 95        	add	a1, a1, a3
   17526: a3 0f b6 fe  	sb	a1, -1(a2)
   1752a: 85 07        	addi	a5, a5, 1
   1752c: 3a 86        	mv	a2, a4
   1752e: 11 c9        	beqz	a0, 0x17542 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h9fcabff5ebdca4b3E+0x34>
   17530: 93 76 f5 00  	andi	a3, a0, 15
   17534: 93 05 00 03  	li	a1, 48
   17538: e3 e3 16 ff  	bltu	a3, a7, 0x1751e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h9fcabff5ebdca4b3E+0x10>
   1753c: 93 05 70 03  	li	a1, 55
   17540: f9 bf        	j	0x1751e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h9fcabff5ebdca4b3E+0x10>
   17542: 93 05 00 08  	li	a1, 128
   17546: 33 85 f5 40  	sub	a0, a1, a5
   1754a: 63 e0 a5 02  	bltu	a1, a0, 0x1756a <.Lpcrel_hi972>

000000000001754e <.Lpcrel_hi973>:
   1754e: 17 35 00 00  	auipc	a0, 3
   17552: 13 06 25 98  	addi	a2, a0, -1662
   17556: 85 45        	li	a1, 1
   17558: 89 46        	li	a3, 2
   1755a: 42 85        	mv	a0, a6
   1755c: 97 f0 ff ff  	auipc	ra, 1048575
   17560: e7 80 a0 70  	jalr	1802(ra)
   17564: aa 60        	ld	ra, 136(sp)
   17566: 49 61        	addi	sp, sp, 144
   17568: 82 80        	ret

000000000001756a <.Lpcrel_hi972>:
   1756a: 97 35 00 00  	auipc	a1, 3
   1756e: 13 86 e5 96  	addi	a2, a1, -1682
   17572: 93 05 00 08  	li	a1, 128
   17576: 97 00 00 00  	auipc	ra, 0
   1757a: e7 80 40 c5  	jalr	-940(ra)

000000000001757e <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E>:
   1757e: 75 71        	addi	sp, sp, -144
   17580: 06 e5        	sd	ra, 136(sp)
   17582: 2e 88        	mv	a6, a1
   17584: 83 e5 45 03  	lwu	a1, 52(a1)
   17588: 13 f6 05 01  	andi	a2, a1, 16
   1758c: 11 ee        	bnez	a2, 0x175a8 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E+0x2a>
   1758e: 93 f5 05 02  	andi	a1, a1, 32
   17592: b1 ed        	bnez	a1, 0x175ee <.Lpcrel_hi983+0xa>
   17594: 03 65 05 00  	lwu	a0, 0(a0)
   17598: 85 45        	li	a1, 1
   1759a: 42 86        	mv	a2, a6
   1759c: aa 60        	ld	ra, 136(sp)
   1759e: 49 61        	addi	sp, sp, 144
   175a0: 17 03 00 00  	auipc	t1, 0
   175a4: 67 00 83 1b  	jr	440(t1)
   175a8: 08 41        	lw	a0, 0(a0)
   175aa: 81 47        	li	a5, 0
   175ac: 30 01        	addi	a2, sp, 136
   175ae: a9 48        	li	a7, 10
   175b0: 19 a8        	j	0x175c6 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E+0x48>
   175b2: 13 07 f6 ff  	addi	a4, a2, -1
   175b6: 1b 55 45 00  	srliw	a0, a0, 4
   175ba: b6 95        	add	a1, a1, a3
   175bc: a3 0f b6 fe  	sb	a1, -1(a2)
   175c0: 85 07        	addi	a5, a5, 1
   175c2: 3a 86        	mv	a2, a4
   175c4: 11 c9        	beqz	a0, 0x175d8 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E+0x5a>
   175c6: 93 76 f5 00  	andi	a3, a0, 15
   175ca: 93 05 00 03  	li	a1, 48
   175ce: e3 e2 16 ff  	bltu	a3, a7, 0x175b2 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E+0x34>
   175d2: 93 05 70 05  	li	a1, 87
   175d6: f1 bf        	j	0x175b2 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h528dfe14547d3797E+0x34>
   175d8: 93 05 00 08  	li	a1, 128
   175dc: 33 85 f5 40  	sub	a0, a1, a5
   175e0: 63 e3 a5 06  	bltu	a1, a0, 0x17646 <.Lpcrel_hi982>

00000000000175e4 <.Lpcrel_hi983>:
   175e4: 17 35 00 00  	auipc	a0, 3
   175e8: 13 06 c5 8e  	addi	a2, a0, -1812
   175ec: 99 a0        	j	0x17632 <.Lpcrel_hi985+0x8>
   175ee: 08 41        	lw	a0, 0(a0)
   175f0: 81 47        	li	a5, 0
   175f2: 30 01        	addi	a2, sp, 136
   175f4: a9 48        	li	a7, 10
   175f6: 19 a8        	j	0x1760c <.Lpcrel_hi983+0x28>
   175f8: 13 07 f6 ff  	addi	a4, a2, -1
   175fc: 1b 55 45 00  	srliw	a0, a0, 4
   17600: b6 95        	add	a1, a1, a3
   17602: a3 0f b6 fe  	sb	a1, -1(a2)
   17606: 85 07        	addi	a5, a5, 1
   17608: 3a 86        	mv	a2, a4
   1760a: 11 c9        	beqz	a0, 0x1761e <.Lpcrel_hi983+0x3a>
   1760c: 93 76 f5 00  	andi	a3, a0, 15
   17610: 93 05 00 03  	li	a1, 48
   17614: e3 e2 16 ff  	bltu	a3, a7, 0x175f8 <.Lpcrel_hi983+0x14>
   17618: 93 05 70 03  	li	a1, 55
   1761c: f1 bf        	j	0x175f8 <.Lpcrel_hi983+0x14>
   1761e: 93 05 00 08  	li	a1, 128
   17622: 33 85 f5 40  	sub	a0, a1, a5
   17626: 63 ea a5 02  	bltu	a1, a0, 0x1765a <.Lpcrel_hi984>

000000000001762a <.Lpcrel_hi985>:
   1762a: 17 35 00 00  	auipc	a0, 3
   1762e: 13 06 65 8a  	addi	a2, a0, -1882
   17632: 85 45        	li	a1, 1
   17634: 89 46        	li	a3, 2
   17636: 42 85        	mv	a0, a6
   17638: 97 f0 ff ff  	auipc	ra, 1048575
   1763c: e7 80 e0 62  	jalr	1582(ra)
   17640: aa 60        	ld	ra, 136(sp)
   17642: 49 61        	addi	sp, sp, 144
   17644: 82 80        	ret

0000000000017646 <.Lpcrel_hi982>:
   17646: 97 35 00 00  	auipc	a1, 3
   1764a: 13 86 25 89  	addi	a2, a1, -1902
   1764e: 93 05 00 08  	li	a1, 128
   17652: 97 00 00 00  	auipc	ra, 0
   17656: e7 80 80 b7  	jalr	-1160(ra)

000000000001765a <.Lpcrel_hi984>:
   1765a: 97 35 00 00  	auipc	a1, 3
   1765e: 13 86 e5 87  	addi	a2, a1, -1922
   17662: 93 05 00 08  	li	a1, 128
   17666: 97 00 00 00  	auipc	ra, 0
   1766a: e7 80 40 b6  	jalr	-1180(ra)

000000000001766e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E>:
   1766e: 75 71        	addi	sp, sp, -144
   17670: 06 e5        	sd	ra, 136(sp)
   17672: 2e 88        	mv	a6, a1
   17674: 83 e5 45 03  	lwu	a1, 52(a1)
   17678: 13 f6 05 01  	andi	a2, a1, 16
   1767c: 09 ee        	bnez	a2, 0x17696 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E+0x28>
   1767e: 93 f5 05 02  	andi	a1, a1, 32
   17682: a1 ed        	bnez	a1, 0x176da <.Lpcrel_hi991+0xa>
   17684: 08 61        	ld	a0, 0(a0)
   17686: 85 45        	li	a1, 1
   17688: 42 86        	mv	a2, a6
   1768a: aa 60        	ld	ra, 136(sp)
   1768c: 49 61        	addi	sp, sp, 144
   1768e: 17 03 00 00  	auipc	t1, 0
   17692: 67 00 a3 0c  	jr	202(t1)
   17696: 08 61        	ld	a0, 0(a0)
   17698: 81 47        	li	a5, 0
   1769a: 30 01        	addi	a2, sp, 136
   1769c: a9 48        	li	a7, 10
   1769e: 11 a8        	j	0x176b2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E+0x44>
   176a0: 13 07 f6 ff  	addi	a4, a2, -1
   176a4: 11 81        	srli	a0, a0, 4
   176a6: b6 95        	add	a1, a1, a3
   176a8: a3 0f b6 fe  	sb	a1, -1(a2)
   176ac: 85 07        	addi	a5, a5, 1
   176ae: 3a 86        	mv	a2, a4
   176b0: 11 c9        	beqz	a0, 0x176c4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E+0x56>
   176b2: 93 76 f5 00  	andi	a3, a0, 15
   176b6: 93 05 00 03  	li	a1, 48
   176ba: e3 e3 16 ff  	bltu	a3, a7, 0x176a0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E+0x32>
   176be: 93 05 70 05  	li	a1, 87
   176c2: f9 bf        	j	0x176a0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17he709cdd0f5ee9f66E+0x32>
   176c4: 93 05 00 08  	li	a1, 128
   176c8: 33 85 f5 40  	sub	a0, a1, a5
   176cc: 63 e2 a5 06  	bltu	a1, a0, 0x17730 <.Lpcrel_hi990>

00000000000176d0 <.Lpcrel_hi991>:
   176d0: 17 35 00 00  	auipc	a0, 3
   176d4: 13 06 05 80  	addi	a2, a0, -2048
   176d8: 91 a0        	j	0x1771c <.Lpcrel_hi993+0x8>
   176da: 08 61        	ld	a0, 0(a0)
   176dc: 81 47        	li	a5, 0
   176de: 30 01        	addi	a2, sp, 136
   176e0: a9 48        	li	a7, 10
   176e2: 11 a8        	j	0x176f6 <.Lpcrel_hi991+0x26>
   176e4: 13 07 f6 ff  	addi	a4, a2, -1
   176e8: 11 81        	srli	a0, a0, 4
   176ea: b6 95        	add	a1, a1, a3
   176ec: a3 0f b6 fe  	sb	a1, -1(a2)
   176f0: 85 07        	addi	a5, a5, 1
   176f2: 3a 86        	mv	a2, a4
   176f4: 11 c9        	beqz	a0, 0x17708 <.Lpcrel_hi991+0x38>
   176f6: 93 76 f5 00  	andi	a3, a0, 15
   176fa: 93 05 00 03  	li	a1, 48
   176fe: e3 e3 16 ff  	bltu	a3, a7, 0x176e4 <.Lpcrel_hi991+0x14>
   17702: 93 05 70 03  	li	a1, 55
   17706: f9 bf        	j	0x176e4 <.Lpcrel_hi991+0x14>
   17708: 93 05 00 08  	li	a1, 128
   1770c: 33 85 f5 40  	sub	a0, a1, a5
   17710: 63 ea a5 02  	bltu	a1, a0, 0x17744 <.Lpcrel_hi992>

0000000000017714 <.Lpcrel_hi993>:
   17714: 17 25 00 00  	auipc	a0, 2
   17718: 13 06 c5 7b  	addi	a2, a0, 1980
   1771c: 85 45        	li	a1, 1
   1771e: 89 46        	li	a3, 2
   17720: 42 85        	mv	a0, a6
   17722: 97 f0 ff ff  	auipc	ra, 1048575
   17726: e7 80 40 54  	jalr	1348(ra)
   1772a: aa 60        	ld	ra, 136(sp)
   1772c: 49 61        	addi	sp, sp, 144
   1772e: 82 80        	ret

0000000000017730 <.Lpcrel_hi990>:
   17730: 97 25 00 00  	auipc	a1, 2
   17734: 13 86 85 7a  	addi	a2, a1, 1960
   17738: 93 05 00 08  	li	a1, 128
   1773c: 97 00 00 00  	auipc	ra, 0
   17740: e7 80 e0 a8  	jalr	-1394(ra)

0000000000017744 <.Lpcrel_hi992>:
   17744: 97 25 00 00  	auipc	a1, 2
   17748: 13 86 45 79  	addi	a2, a1, 1940
   1774c: 93 05 00 08  	li	a1, 128
   17750: 97 00 00 00  	auipc	ra, 0
   17754: e7 80 a0 a7  	jalr	-1414(ra)

0000000000017758 <_ZN4core3fmt3num3imp7fmt_u6417h7c4144a61f1891c1E>:
   17758: 39 71        	addi	sp, sp, -64
   1775a: 06 fc        	sd	ra, 56(sp)
   1775c: 22 f8        	sd	s0, 48(sp)
   1775e: 26 f4        	sd	s1, 40(sp)
   17760: 32 88        	mv	a6, a2
   17762: 93 56 45 00  	srli	a3, a0, 4
   17766: 13 07 70 02  	li	a4, 39
   1776a: 93 07 10 27  	li	a5, 625

000000000001776e <.Lpcrel_hi994>:
   1776e: 17 26 00 00  	auipc	a2, 2
   17772: 13 0f 26 78  	addi	t5, a2, 1922
   17776: 63 f3 f6 02  	bgeu	a3, a5, 0x1779c <.Lpcrel_hi994+0x2e>
   1777a: 93 06 30 06  	li	a3, 99
   1777e: 63 ea a6 0a  	bltu	a3, a0, 0x17832 <.Lpcrel_hi995+0x8c>
   17782: 29 46        	li	a2, 10
   17784: 63 78 c5 0e  	bgeu	a0, a2, 0x17874 <.Lpcrel_hi995+0xce>
   17788: 93 06 f7 ff  	addi	a3, a4, -1
   1778c: 13 06 11 00  	addi	a2, sp, 1
   17790: 36 96        	add	a2, a2, a3
   17792: 1b 05 05 03  	addiw	a0, a0, 48
   17796: 23 00 a6 00  	sb	a0, 0(a2)
   1779a: e5 a8        	j	0x17892 <.Lpcrel_hi995+0xec>
   1779c: 01 47        	li	a4, 0
   1779e: 93 08 41 02  	addi	a7, sp, 36
   177a2: 93 02 61 02  	addi	t0, sp, 38

00000000000177a6 <.Lpcrel_hi995>:
   177a6: 97 46 00 00  	auipc	a3, 4
   177aa: 03 b3 26 9e  	ld	t1, -1566(a3)
   177ae: 89 66        	lui	a3, 2
   177b0: 1b 8e 06 71  	addiw	t3, a3, 1808
   177b4: 85 66        	lui	a3, 1
   177b6: 9b 8e b6 47  	addiw	t4, a3, 1147
   177ba: 93 03 40 06  	li	t2, 100
   177be: b7 e6 f5 05  	lui	a3, 24414
   177c2: 9b 8f f6 0f  	addiw	t6, a3, 255
   177c6: aa 86        	mv	a3, a0
   177c8: 33 35 65 02  	mulhu	a0, a0, t1
   177cc: 2d 81        	srli	a0, a0, 11
   177ce: 33 06 c5 03  	mul	a2, a0, t3
   177d2: bb 87 c6 40  	subw	a5, a3, a2
   177d6: 13 96 07 03  	slli	a2, a5, 48
   177da: 49 92        	srli	a2, a2, 50
   177dc: 33 06 d6 03  	mul	a2, a2, t4
   177e0: 13 54 16 01  	srli	s0, a2, 17
   177e4: 41 82        	srli	a2, a2, 16
   177e6: 13 76 e6 7f  	andi	a2, a2, 2046
   177ea: 33 04 74 02  	mul	s0, s0, t2
   177ee: 81 9f        	subw	a5, a5, s0
   177f0: c6 17        	slli	a5, a5, 49
   177f2: 7a 96        	add	a2, a2, t5
   177f4: 03 44 16 00  	lbu	s0, 1(a2)
   177f8: c1 93        	srli	a5, a5, 48
   177fa: b3 84 e8 00  	add	s1, a7, a4
   177fe: 03 46 06 00  	lbu	a2, 0(a2)
   17802: a3 80 84 00  	sb	s0, 1(s1)
   17806: fa 97        	add	a5, a5, t5
   17808: 03 c4 17 00  	lbu	s0, 1(a5)
   1780c: 83 c7 07 00  	lbu	a5, 0(a5)
   17810: 23 80 c4 00  	sb	a2, 0(s1)
   17814: 33 86 e2 00  	add	a2, t0, a4
   17818: a3 00 86 00  	sb	s0, 1(a2)
   1781c: 23 00 f6 00  	sb	a5, 0(a2)
   17820: 71 17        	addi	a4, a4, -4
   17822: e3 e2 df fa  	bltu	t6, a3, 0x177c6 <.Lpcrel_hi995+0x20>
   17826: 13 07 77 02  	addi	a4, a4, 39
   1782a: 93 06 30 06  	li	a3, 99
   1782e: e3 fa a6 f4  	bgeu	a3, a0, 0x17782 <.Lpcrel_hi994+0x14>
   17832: 13 16 05 03  	slli	a2, a0, 48
   17836: 49 92        	srli	a2, a2, 50
   17838: 85 66        	lui	a3, 1
   1783a: 9b 86 b6 47  	addiw	a3, a3, 1147
   1783e: 33 06 d6 02  	mul	a2, a2, a3
   17842: 45 82        	srli	a2, a2, 17
   17844: 93 06 40 06  	li	a3, 100
   17848: b3 06 d6 02  	mul	a3, a2, a3
   1784c: 15 9d        	subw	a0, a0, a3
   1784e: 46 15        	slli	a0, a0, 49
   17850: 41 91        	srli	a0, a0, 48
   17852: 79 17        	addi	a4, a4, -2
   17854: 7a 95        	add	a0, a0, t5
   17856: 83 46 15 00  	lbu	a3, 1(a0)
   1785a: 03 45 05 00  	lbu	a0, 0(a0)
   1785e: 93 07 11 00  	addi	a5, sp, 1
   17862: ba 97        	add	a5, a5, a4
   17864: a3 80 d7 00  	sb	a3, 1(a5)
   17868: 23 80 a7 00  	sb	a0, 0(a5)
   1786c: 32 85        	mv	a0, a2
   1786e: 29 46        	li	a2, 10
   17870: e3 6c c5 f0  	bltu	a0, a2, 0x17788 <.Lpcrel_hi994+0x1a>
   17874: 06 05        	slli	a0, a0, 1
   17876: 93 06 e7 ff  	addi	a3, a4, -2
   1787a: 7a 95        	add	a0, a0, t5
   1787c: 03 46 15 00  	lbu	a2, 1(a0)
   17880: 03 45 05 00  	lbu	a0, 0(a0)
   17884: 13 07 11 00  	addi	a4, sp, 1
   17888: 36 97        	add	a4, a4, a3
   1788a: a3 00 c7 00  	sb	a2, 1(a4)
   1788e: 23 00 a7 00  	sb	a0, 0(a4)
   17892: 13 07 11 00  	addi	a4, sp, 1
   17896: 36 97        	add	a4, a4, a3
   17898: 93 07 70 02  	li	a5, 39
   1789c: 95 8f        	sub	a5, a5, a3

000000000001789e <.Lpcrel_hi996>:
   1789e: 17 25 00 00  	auipc	a0, 2
   178a2: 13 06 25 4e  	addi	a2, a0, 1250
   178a6: 42 85        	mv	a0, a6
   178a8: 81 46        	li	a3, 0
   178aa: 97 f0 ff ff  	auipc	ra, 1048575
   178ae: e7 80 c0 3b  	jalr	956(ra)
   178b2: e2 70        	ld	ra, 56(sp)
   178b4: 42 74        	ld	s0, 48(sp)
   178b6: a2 74        	ld	s1, 40(sp)
   178b8: 21 61        	addi	sp, sp, 64
   178ba: 82 80        	ret

00000000000178bc <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h338a4a66580a1303E>:
   178bc: 03 45 05 00  	lbu	a0, 0(a0)
   178c0: 2e 86        	mv	a2, a1
   178c2: 85 45        	li	a1, 1
   178c4: 17 03 00 00  	auipc	t1, 0
   178c8: 67 00 43 e9  	jr	-364(t1)

00000000000178cc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17hc7a46f825c1e9863E>:
   178cc: 08 41        	lw	a0, 0(a0)
   178ce: 2e 86        	mv	a2, a1
   178d0: 93 25 05 00  	slti	a1, a0, 0
   178d4: 93 c5 15 00  	xori	a1, a1, 1
   178d8: 63 58 05 00  	bgez	a0, 0x178e8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17hc7a46f825c1e9863E+0x1c>
   178dc: 33 05 a0 40  	neg	a0, a0
   178e0: 17 03 00 00  	auipc	t1, 0
   178e4: 67 00 83 e7  	jr	-392(t1)
   178e8: 02 15        	slli	a0, a0, 32
   178ea: 01 91        	srli	a0, a0, 32
   178ec: 17 03 00 00  	auipc	t1, 0
   178f0: 67 00 c3 e6  	jr	-404(t1)

00000000000178f4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h43bfc99c5c26a4d5E>:
   178f4: 03 65 05 00  	lwu	a0, 0(a0)
   178f8: 2e 86        	mv	a2, a1
   178fa: 85 45        	li	a1, 1
   178fc: 17 03 00 00  	auipc	t1, 0
   17900: 67 00 c3 e5  	jr	-420(t1)

0000000000017904 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h47304f4da811d7ddE>:
   17904: 08 61        	ld	a0, 0(a0)
   17906: 2e 86        	mv	a2, a1
   17908: 85 45        	li	a1, 1
   1790a: 17 03 00 00  	auipc	t1, 0
   1790e: 67 00 e3 e4  	jr	-434(t1)

0000000000017912 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7fdb62b9cc2159aaE>:
   17912: 10 65        	ld	a2, 8(a0)
   17914: 08 61        	ld	a0, 0(a0)
   17916: 1c 6e        	ld	a5, 24(a2)
   17918: 82 87        	jr	a5

000000000001791a <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h15126b0637a78de3E>:
   1791a: 14 61        	ld	a3, 0(a0)
   1791c: 10 65        	ld	a2, 8(a0)
   1791e: 2e 85        	mv	a0, a1
   17920: b6 85        	mv	a1, a3
   17922: 17 f3 ff ff  	auipc	t1, 1048575
   17926: 67 00 63 5a  	jr	1446(t1)

000000000001792a <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE>:
   1792a: c1 46        	li	a3, 16
   1792c: 63 6b d6 06  	bltu	a2, a3, 0x179a2 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x78>
   17930: bb 06 a0 40  	negw	a3, a0
   17934: 13 f8 76 00  	andi	a6, a3, 7
   17938: b3 03 05 01  	add	t2, a0, a6
   1793c: 63 0c 08 00  	beqz	a6, 0x17954 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x2a>
   17940: aa 87        	mv	a5, a0
   17942: ae 86        	mv	a3, a1
   17944: 03 c7 06 00  	lbu	a4, 0(a3)
   17948: 23 80 e7 00  	sb	a4, 0(a5)
   1794c: 85 07        	addi	a5, a5, 1
   1794e: 85 06        	addi	a3, a3, 1
   17950: e3 ea 77 fe  	bltu	a5, t2, 0x17944 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x1a>
   17954: b3 88 05 01  	add	a7, a1, a6
   17958: 33 08 06 41  	sub	a6, a2, a6
   1795c: 93 72 88 ff  	andi	t0, a6, -8
   17960: 93 f5 78 00  	andi	a1, a7, 7
   17964: b3 86 53 00  	add	a3, t2, t0
   17968: a1 c1        	beqz	a1, 0x179a8 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x7e>
   1796a: 63 59 50 04  	blez	t0, 0x179bc <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x92>
   1796e: 93 95 38 00  	slli	a1, a7, 3
   17972: 13 f3 85 03  	andi	t1, a1, 56
   17976: 93 f7 88 ff  	andi	a5, a7, -8
   1797a: 90 63        	ld	a2, 0(a5)
   1797c: bb 05 b0 40  	negw	a1, a1
   17980: 13 fe 85 03  	andi	t3, a1, 56
   17984: a1 07        	addi	a5, a5, 8
   17986: 98 63        	ld	a4, 0(a5)
   17988: 33 56 66 00  	srl	a2, a2, t1
   1798c: b3 15 c7 01  	sll	a1, a4, t3
   17990: d1 8d        	or	a1, a1, a2
   17992: 23 b0 b3 00  	sd	a1, 0(t2)
   17996: a1 03        	addi	t2, t2, 8
   17998: a1 07        	addi	a5, a5, 8
   1799a: 3a 86        	mv	a2, a4
   1799c: e3 e5 d3 fe  	bltu	t2, a3, 0x17986 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x5c>
   179a0: 31 a8        	j	0x179bc <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x92>
   179a2: aa 86        	mv	a3, a0
   179a4: 0d e2        	bnez	a2, 0x179c6 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x9c>
   179a6: 0d a8        	j	0x179d8 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0xae>
   179a8: 63 5a 50 00  	blez	t0, 0x179bc <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x92>
   179ac: c6 85        	mv	a1, a7
   179ae: 90 61        	ld	a2, 0(a1)
   179b0: 23 b0 c3 00  	sd	a2, 0(t2)
   179b4: a1 03        	addi	t2, t2, 8
   179b6: a1 05        	addi	a1, a1, 8
   179b8: e3 eb d3 fe  	bltu	t2, a3, 0x179ae <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x84>
   179bc: b3 85 58 00  	add	a1, a7, t0
   179c0: 13 76 78 00  	andi	a2, a6, 7
   179c4: 11 ca        	beqz	a2, 0x179d8 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0xae>
   179c6: 36 96        	add	a2, a2, a3
   179c8: 03 c7 05 00  	lbu	a4, 0(a1)
   179cc: 23 80 e6 00  	sb	a4, 0(a3)
   179d0: 85 06        	addi	a3, a3, 1
   179d2: 85 05        	addi	a1, a1, 1
   179d4: e3 ea c6 fe  	bltu	a3, a2, 0x179c8 <_ZN17compiler_builtins3mem6memcpy17hc5369f1424c79c4fE+0x9e>
   179d8: 82 80        	ret

00000000000179da <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E>:
   179da: c1 46        	li	a3, 16
   179dc: 63 69 d6 04  	bltu	a2, a3, 0x17a2e <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x54>
   179e0: bb 06 a0 40  	negw	a3, a0
   179e4: 9d 8a        	andi	a3, a3, 7
   179e6: 33 07 d5 00  	add	a4, a0, a3
   179ea: 99 c6        	beqz	a3, 0x179f8 <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x1e>
   179ec: aa 87        	mv	a5, a0
   179ee: 23 80 b7 00  	sb	a1, 0(a5)
   179f2: 85 07        	addi	a5, a5, 1
   179f4: e3 ed e7 fe  	bltu	a5, a4, 0x179ee <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x14>
   179f8: b3 08 d6 40  	sub	a7, a2, a3
   179fc: 93 f7 88 ff  	andi	a5, a7, -8
   17a00: b3 06 f7 00  	add	a3, a4, a5
   17a04: 63 51 f0 02  	blez	a5, 0x17a26 <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x4c>
   17a08: 13 f8 f5 0f  	andi	a6, a1, 255
   17a0c: b7 07 01 01  	lui	a5, 4112
   17a10: 1b 86 17 10  	addiw	a2, a5, 257
   17a14: 93 17 06 02  	slli	a5, a2, 32
   17a18: 3e 96        	add	a2, a2, a5
   17a1a: b3 07 c8 02  	mul	a5, a6, a2
   17a1e: 1c e3        	sd	a5, 0(a4)
   17a20: 21 07        	addi	a4, a4, 8
   17a22: e3 6e d7 fe  	bltu	a4, a3, 0x17a1e <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x44>
   17a26: 13 f6 78 00  	andi	a2, a7, 7
   17a2a: 01 e6        	bnez	a2, 0x17a32 <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x58>
   17a2c: 09 a8        	j	0x17a3e <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x64>
   17a2e: aa 86        	mv	a3, a0
   17a30: 19 c6        	beqz	a2, 0x17a3e <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x64>
   17a32: 36 96        	add	a2, a2, a3
   17a34: 23 80 b6 00  	sb	a1, 0(a3)
   17a38: 85 06        	addi	a3, a3, 1
   17a3a: e3 ed c6 fe  	bltu	a3, a2, 0x17a34 <_ZN17compiler_builtins3mem6memset17habf4bad0dff10519E+0x5a>
   17a3e: 82 80        	ret

0000000000017a40 <memset>:
   17a40: 17 03 00 00  	auipc	t1, 0
   17a44: 67 00 a3 f9  	jr	-102(t1)

0000000000017a48 <memcpy>:
   17a48: 17 03 00 00  	auipc	t1, 0
   17a4c: 67 00 23 ee  	jr	-286(t1)
