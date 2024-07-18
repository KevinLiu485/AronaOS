
signal_test:	file format elf64-littleriscv

Disassembly of section .text:

0000000000000508 <exit>:
     508: 01 11        	addi	sp, sp, -32
     50a: 2a e4        	sd	a0, 8(sp)
     50c: 06 ec        	sd	ra, 24(sp)
     50e: ef 00 e0 4e  	jal	0x9fc <dummy>
     512: ef 00 c0 4e  	jal	0x9fe <libc_exit_fini>
     516: 17 83 00 00  	auipc	t1, 8
     51a: 03 33 23 c6  	ld	t1, -926(t1)
     51e: 02 93        	jalr	t1
     520: 22 65        	ld	a0, 8(sp)
     522: ef 20 00 66  	jal	0x2b82 <_Exit>

0000000000000526 <_start>:
     526: 97 81 00 00  	auipc	gp, 8
     52a: 93 81 a1 2d  	addi	gp, gp, 730
     52e: 0a 85        	mv	a0, sp
     530: 97 85 00 00  	auipc	a1, 8
     534: 93 85 05 96  	addi	a1, a1, -1696
     538: 13 71 01 ff  	andi	sp, sp, -16
     53c: 15 a0        	j	0x560 <_start_c>

000000000000053e <__dls2>:
     53e: 13 86 85 00  	addi	a2, a1, 8
     542: 8c 41        	lw	a1, 0(a1)
     544: 81 47        	li	a5, 0
     546: 17 87 00 00  	auipc	a4, 8
     54a: 03 37 27 c4  	ld	a4, -958(a4)
     54e: 97 86 00 00  	auipc	a3, 8
     552: 83 b6 26 bf  	ld	a3, -1038(a3)
     556: 17 85 00 00  	auipc	a0, 8
     55a: 03 35 a5 c1  	ld	a0, -998(a0)
     55e: ad a1        	j	0x9c8 <__libc_start_main>

0000000000000560 <_start_c>:
     560: 18 61        	ld	a4, 0(a0)
     562: 13 01 01 df  	addi	sp, sp, -528
     566: 2a 86        	mv	a2, a0
     568: 05 27        	addiw	a4, a4, 1
     56a: 93 17 37 00  	slli	a5, a4, 3
     56e: b3 06 f6 00  	add	a3, a2, a5
     572: 94 66        	ld	a3, 8(a3)
     574: 05 07        	addi	a4, a4, 1
     576: f5 fa        	bnez	a3, 0x56a <_start_c+0xa>
     578: c1 07        	addi	a5, a5, 16
     57a: b2 97        	add	a5, a5, a2
     57c: 14 08        	addi	a3, sp, 16
     57e: 18 0a        	addi	a4, sp, 272
     580: 23 b0 06 00  	sd	zero, 0(a3)
     584: a1 06        	addi	a3, a3, 8
     586: e3 9d e6 fe  	bne	a3, a4, 0x580 <_start_c+0x20>
     58a: 7d 45        	li	a0, 31
     58c: 94 63        	ld	a3, 0(a5)
     58e: b5 ee        	bnez	a3, 0x60a <_start_c+0xaa>
     590: ba 87        	mv	a5, a4
     592: 18 0c        	addi	a4, sp, 528
     594: 3a e4        	sd	a4, 8(sp)
     596: 22 67        	ld	a4, 8(sp)
     598: 23 b0 07 00  	sd	zero, 0(a5)
     59c: a1 07        	addi	a5, a5, 8
     59e: e3 9c e7 fe  	bne	a5, a4, 0x596 <_start_c+0x36>
     5a2: 2e 87        	mv	a4, a1
     5a4: fd 46        	li	a3, 31
     5a6: 1c 63        	ld	a5, 0(a4)
     5a8: bd ef        	bnez	a5, 0x626 <_start_c+0xc6>
     5aa: 26 65        	ld	a0, 72(sp)
     5ac: 11 ed        	bnez	a0, 0x5c8 <_start_c+0x68>
     5ae: 62 75        	ld	a0, 56(sp)
     5b0: 42 77        	ld	a4, 48(sp)
     5b2: a2 77        	ld	a5, 40(sp)
     5b4: 89 46        	li	a3, 2
     5b6: 09 c9        	beqz	a0, 0x5c8 <_start_c+0x68>
     5b8: 03 a8 07 00  	lw	a6, 0(a5)
     5bc: 7d 15        	addi	a0, a0, -1
     5be: 63 10 d8 08  	bne	a6, a3, 0x63e <_start_c+0xde>
     5c2: 88 6b        	ld	a0, 16(a5)
     5c4: 33 85 a5 40  	sub	a0, a1, a0
     5c8: 7a 67        	ld	a4, 408(sp)
     5ca: 9a 77        	ld	a5, 416(sp)
     5cc: b7 05 00 80  	lui	a1, 524288
     5d0: 2a 97        	add	a4, a4, a0
     5d2: 3e 97        	add	a4, a4, a5
     5d4: 93 c5 f5 ff  	not	a1, a1
     5d8: 8d 48        	li	a7, 3
     5da: 33 08 f7 40  	sub	a6, a4, a5
     5de: b5 e3        	bnez	a5, 0x642 <_start_c+0xe2>
     5e0: 36 67        	ld	a4, 328(sp)
     5e2: d6 67        	ld	a5, 336(sp)
     5e4: b7 05 00 80  	lui	a1, 524288
     5e8: 2a 97        	add	a4, a4, a0
     5ea: 3e 97        	add	a4, a4, a5
     5ec: 93 c5 f5 ff  	not	a1, a1
     5f0: 8d 48        	li	a7, 3
     5f2: b3 06 f7 40  	sub	a3, a4, a5
     5f6: ad e7        	bnez	a5, 0x660 <_start_c+0x100>
     5f8: 97 87 00 00  	auipc	a5, 8
     5fc: 93 87 87 a0  	addi	a5, a5, -1528
     600: 9c 63        	ld	a5, 0(a5)
     602: b2 85        	mv	a1, a2
     604: 13 01 01 21  	addi	sp, sp, 528
     608: 82 87        	jr	a5
     60a: 63 6c d5 00  	bltu	a0, a3, 0x622 <_start_c+0xc2>
     60e: 8e 06        	slli	a3, a3, 3
     610: 13 08 01 01  	addi	a6, sp, 16
     614: 93 86 06 20  	addi	a3, a3, 512
     618: c2 96        	add	a3, a3, a6
     61a: 03 b8 87 00  	ld	a6, 8(a5)
     61e: 23 b0 06 e1  	sd	a6, -512(a3)
     622: c1 07        	addi	a5, a5, 16
     624: a5 b7        	j	0x58c <_start_c+0x2c>
     626: 63 ea f6 00  	bltu	a3, a5, 0x63a <_start_c+0xda>
     62a: 8e 07        	slli	a5, a5, 3
     62c: 08 08        	addi	a0, sp, 16
     62e: 93 87 07 20  	addi	a5, a5, 512
     632: aa 97        	add	a5, a5, a0
     634: 08 67        	ld	a0, 8(a4)
     636: 23 b0 a7 f0  	sd	a0, -256(a5)
     63a: 41 07        	addi	a4, a4, 16
     63c: ad b7        	j	0x5a6 <_start_c+0x46>
     63e: ba 97        	add	a5, a5, a4
     640: 9d bf        	j	0x5b6 <_start_c+0x56>
     642: 83 36 88 00  	ld	a3, 8(a6)
     646: ed 8e        	and	a3, a3, a1
     648: 63 9a 16 01  	bne	a3, a7, 0x65c <_start_c+0xfc>
     64c: 83 36 08 00  	ld	a3, 0(a6)
     650: aa 96        	add	a3, a3, a0
     652: 03 b8 06 00  	ld	a6, 0(a3)
     656: 2a 98        	add	a6, a6, a0
     658: 23 b0 06 01  	sd	a6, 0(a3)
     65c: c1 17        	addi	a5, a5, -16
     65e: b5 bf        	j	0x5da <_start_c+0x7a>
     660: 03 b8 86 00  	ld	a6, 8(a3)
     664: 33 78 b8 00  	and	a6, a6, a1
     668: 63 19 18 01  	bne	a6, a7, 0x67a <_start_c+0x11a>
     66c: 03 b8 06 00  	ld	a6, 0(a3)
     670: 94 6a        	ld	a3, 16(a3)
     672: 2a 98        	add	a6, a6, a0
     674: aa 96        	add	a3, a3, a0
     676: 23 30 d8 00  	sd	a3, 0(a6)
     67a: a1 17        	addi	a5, a5, -24
     67c: 9d bf        	j	0x5f2 <_start_c+0x92>

000000000000067e <deregister_tm_clones>:
     67e: 17 85 00 00  	auipc	a0, 8
     682: 13 05 a5 a8  	addi	a0, a0, -1398
     686: 97 87 00 00  	auipc	a5, 8
     68a: 93 87 27 a8  	addi	a5, a5, -1406
     68e: 63 88 a7 00  	beq	a5, a0, 0x69e <deregister_tm_clones+0x20>
     692: 97 87 00 00  	auipc	a5, 8
     696: 83 b7 e7 ac  	ld	a5, -1330(a5)
     69a: 91 c3        	beqz	a5, 0x69e <deregister_tm_clones+0x20>
     69c: 82 87        	jr	a5
     69e: 82 80        	ret

00000000000006a0 <register_tm_clones>:
     6a0: 17 85 00 00  	auipc	a0, 8
     6a4: 13 05 85 a6  	addi	a0, a0, -1432
     6a8: 97 85 00 00  	auipc	a1, 8
     6ac: 93 85 05 a6  	addi	a1, a1, -1440
     6b0: 89 8d        	sub	a1, a1, a0
     6b2: 93 d7 35 40  	srai	a5, a1, 3
     6b6: fd 91        	srli	a1, a1, 63
     6b8: be 95        	add	a1, a1, a5
     6ba: 85 85        	srai	a1, a1, 1
     6bc: 99 c5        	beqz	a1, 0x6ca <register_tm_clones+0x2a>
     6be: 97 87 00 00  	auipc	a5, 8
     6c2: 83 b7 27 a9  	ld	a5, -1390(a5)
     6c6: 91 c3        	beqz	a5, 0x6ca <register_tm_clones+0x2a>
     6c8: 82 87        	jr	a5
     6ca: 82 80        	ret

00000000000006cc <__do_global_dtors_aux>:
     6cc: 41 11        	addi	sp, sp, -16
     6ce: 22 e0        	sd	s0, 0(sp)
     6d0: 17 84 00 00  	auipc	s0, 8
     6d4: 13 04 04 ae  	addi	s0, s0, -1312
     6d8: 83 47 04 00  	lbu	a5, 0(s0)
     6dc: 06 e4        	sd	ra, 8(sp)
     6de: 95 eb        	bnez	a5, 0x712 <__do_global_dtors_aux+0x46>
     6e0: 97 87 00 00  	auipc	a5, 8
     6e4: 83 b7 87 a4  	ld	a5, -1464(a5)
     6e8: 91 c7        	beqz	a5, 0x6f4 <__do_global_dtors_aux+0x28>
     6ea: 17 85 00 00  	auipc	a0, 8
     6ee: 03 35 e5 91  	ld	a0, -1762(a0)
     6f2: 82 97        	jalr	a5
     6f4: ef f0 bf f8  	jal	0x67e <deregister_tm_clones>
     6f8: 97 87 00 00  	auipc	a5, 8
     6fc: 83 b7 07 a5  	ld	a5, -1456(a5)
     700: 91 c7        	beqz	a5, 0x70c <__do_global_dtors_aux+0x40>
     702: 17 65 00 00  	auipc	a0, 6
     706: 13 05 65 95  	addi	a0, a0, -1706
     70a: 82 97        	jalr	a5
     70c: 85 47        	li	a5, 1
     70e: 23 00 f4 00  	sb	a5, 0(s0)
     712: a2 60        	ld	ra, 8(sp)
     714: 02 64        	ld	s0, 0(sp)
     716: 41 01        	addi	sp, sp, 16
     718: 82 80        	ret

000000000000071a <frame_dummy>:
     71a: 97 87 00 00  	auipc	a5, 8
     71e: 83 b7 67 a8  	ld	a5, -1402(a5)
     722: 99 cf        	beqz	a5, 0x740 <frame_dummy+0x26>
     724: 41 11        	addi	sp, sp, -16
     726: 06 e4        	sd	ra, 8(sp)
     728: 97 85 00 00  	auipc	a1, 8
     72c: 93 85 05 a9  	addi	a1, a1, -1392
     730: 17 65 00 00  	auipc	a0, 6
     734: 13 05 85 92  	addi	a0, a0, -1752
     738: 82 97        	jalr	a5
     73a: a2 60        	ld	ra, 8(sp)
     73c: 41 01        	addi	sp, sp, 16
     73e: 8d b7        	j	0x6a0 <register_tm_clones>
     740: 85 b7        	j	0x6a0 <register_tm_clones>

0000000000000742 <signal_handler>:
     742: 01 11        	addi	sp, sp, -32
     744: 06 ec        	sd	ra, 24(sp)
     746: 22 e8        	sd	s0, 16(sp)
     748: 00 10        	addi	s0, sp, 32
     74a: aa 87        	mv	a5, a0
     74c: 23 26 f4 fe  	sw	a5, -20(s0)
     750: 83 27 c4 fe  	lw	a5, -20(s0)
     754: be 85        	mv	a1, a5
     756: 17 55 00 00  	auipc	a0, 5
     75a: 13 05 a5 ac  	addi	a0, a0, -1334
     75e: ef 00 a0 51  	jal	0xc78 <printf>
     762: 01 00        	nop
     764: e2 60        	ld	ra, 24(sp)
     766: 42 64        	ld	s0, 16(sp)
     768: 05 61        	addi	sp, sp, 32
     76a: 82 80        	ret

000000000000076c <main>:
     76c: 69 71        	addi	sp, sp, -304
     76e: 06 f6        	sd	ra, 296(sp)
     770: 22 f2        	sd	s0, 288(sp)
     772: 00 1a        	addi	s0, sp, 304
     774: 97 07 00 00  	auipc	a5, 0
     778: 93 87 e7 fc  	addi	a5, a5, -50
     77c: 23 3c f4 f4  	sd	a5, -168(s0)
     780: 23 20 04 fe  	sw	zero, -32(s0)
     784: 93 07 84 f5  	addi	a5, s0, -168
     788: a1 07        	addi	a5, a5, 8
     78a: 3e 85        	mv	a0, a5
     78c: ef 00 40 4c  	jal	0xc50 <sigemptyset>
     790: 93 07 84 f5  	addi	a5, s0, -168
     794: 01 46        	li	a2, 0
     796: be 85        	mv	a1, a5
     798: 29 45        	li	a0, 10
     79a: ef 00 40 40  	jal	0xb9e <sigaction>
     79e: 93 07 84 ed  	addi	a5, s0, -296
     7a2: 3e 85        	mv	a0, a5
     7a4: ef 00 c0 4a  	jal	0xc50 <sigemptyset>
     7a8: 93 07 84 ed  	addi	a5, s0, -296
     7ac: a9 45        	li	a1, 10
     7ae: 3e 85        	mv	a0, a5
     7b0: ef 00 80 46  	jal	0xc18 <sigaddset>
     7b4: 93 07 84 ed  	addi	a5, s0, -296
     7b8: 01 46        	li	a2, 0
     7ba: be 85        	mv	a1, a5
     7bc: 01 45        	li	a0, 0
     7be: ef 00 a0 49  	jal	0xc58 <sigprocmask>
     7c2: 17 55 00 00  	auipc	a0, 5
     7c6: 13 05 65 a7  	addi	a0, a0, -1418
     7ca: ef 00 80 4d  	jal	0xca2 <puts>
     7ce: ef 20 20 14  	jal	0x2910 <getpid>
     7d2: aa 87        	mv	a5, a0
     7d4: a9 45        	li	a1, 10
     7d6: 3e 85        	mv	a0, a5
     7d8: ef 00 e0 25  	jal	0xa36 <kill>
     7dc: 17 55 00 00  	auipc	a0, 5
     7e0: 13 05 c5 a8  	addi	a0, a0, -1396
     7e4: ef 00 e0 4b  	jal	0xca2 <puts>
     7e8: 93 07 84 ed  	addi	a5, s0, -296
     7ec: 01 46        	li	a2, 0
     7ee: be 85        	mv	a1, a5
     7f0: 05 45        	li	a0, 1
     7f2: ef 00 60 46  	jal	0xc58 <sigprocmask>
     7f6: 17 55 00 00  	auipc	a0, 5
     7fa: 13 05 a5 a9  	addi	a0, a0, -1382
     7fe: ef 00 40 4a  	jal	0xca2 <puts>
     802: 17 55 00 00  	auipc	a0, 5
     806: 13 05 e5 ab  	addi	a0, a0, -1346
     80a: ef 00 80 49  	jal	0xca2 <puts>
     80e: 81 47        	li	a5, 0
     810: 3e 85        	mv	a0, a5
     812: b2 70        	ld	ra, 296(sp)
     814: 12 74        	ld	s0, 288(sp)
     816: 55 61        	addi	sp, sp, 304
     818: 82 80        	ret

000000000000081a <dummy>:
     81a: 82 80        	ret

000000000000081c <dummy1>:
     81c: 82 80        	ret

000000000000081e <__init_libc>:
     81e: 09 71        	addi	sp, sp, -384
     820: ca f2        	sd	s2, 352(sp)
     822: 13 09 01 03  	addi	s2, sp, 48
     826: a2 fa        	sd	s0, 368(sp)
     828: a6 f6        	sd	s1, 360(sp)
     82a: 2e 84        	mv	s0, a1
     82c: aa 84        	mv	s1, a0
     82e: 13 06 00 13  	li	a2, 304
     832: 81 45        	li	a1, 0
     834: 4a 85        	mv	a0, s2
     836: 86 fe        	sd	ra, 376(sp)
     838: ef 10 30 68  	jal	0x26ba <memset>
     83c: 97 87 00 00  	auipc	a5, 8
     840: 83 b7 c7 8f  	ld	a5, -1796(a5)
     844: 84 e3        	sd	s1, 0(a5)
     846: 01 47        	li	a4, 0
     848: 93 17 37 00  	slli	a5, a4, 3
     84c: b3 86 f4 00  	add	a3, s1, a5
     850: 94 62        	ld	a3, 0(a3)
     852: 05 07        	addi	a4, a4, 1
     854: f5 fa        	bnez	a3, 0x848 <__init_libc+0x2a>
     856: a1 07        	addi	a5, a5, 8
     858: 33 85 f4 00  	add	a0, s1, a5
     85c: 97 84 00 00  	auipc	s1, 8
     860: 93 84 c4 99  	addi	s1, s1, -1636
     864: 88 e4        	sd	a0, 8(s1)
     866: 13 07 50 02  	li	a4, 37
     86a: 1c 61        	ld	a5, 0(a0)
     86c: f1 e3        	bnez	a5, 0x930 <__init_libc+0x112>
     86e: ca 77        	ld	a5, 176(sp)
     870: 17 87 00 00  	auipc	a4, 8
     874: 23 30 f7 98  	sd	a5, -1664(a4)
     878: d2 77        	ld	a5, 304(sp)
     87a: 89 c7        	beqz	a5, 0x884 <__init_libc+0x66>
     87c: 17 87 00 00  	auipc	a4, 8
     880: 23 36 f7 96  	sd	a5, -1684(a4)
     884: 86 77        	ld	a5, 96(sp)
     886: 9c f8        	sd	a5, 48(s1)
     888: 01 e8        	bnez	s0, 0x898 <__init_libc+0x7a>
     88a: b2 77        	ld	a5, 296(sp)
     88c: 17 54 00 00  	auipc	s0, 5
     890: 13 04 c4 a4  	addi	s0, s0, -1460
     894: 91 c3        	beqz	a5, 0x898 <__init_libc+0x7a>
     896: 3e 84        	mv	s0, a5
     898: 97 87 00 00  	auipc	a5, 8
     89c: 83 b7 07 91  	ld	a5, -1776(a5)
     8a0: 17 87 00 00  	auipc	a4, 8
     8a4: 03 37 87 8b  	ld	a4, -1864(a4)
     8a8: 80 e3        	sd	s0, 0(a5)
     8aa: 00 e3        	sd	s0, 0(a4)
     8ac: 93 06 f0 02  	li	a3, 47
     8b0: 05 04        	addi	s0, s0, 1
     8b2: 83 47 f4 ff  	lbu	a5, -1(s0)
     8b6: c1 eb        	bnez	a5, 0x946 <__init_libc+0x128>
     8b8: 4a 85        	mv	a0, s2
     8ba: ef 20 c0 15  	jal	0x2a16 <static_init_tls>
     8be: 6e 75        	ld	a0, 248(sp)
     8c0: ef f0 df f5  	jal	0x81c <dummy1>
     8c4: 2a 67        	ld	a4, 136(sp)
     8c6: ca 67        	ld	a5, 144(sp)
     8c8: 63 18 f7 00  	bne	a4, a5, 0x8d8 <__init_libc+0xba>
     8cc: 6a 67        	ld	a4, 152(sp)
     8ce: 8a 77        	ld	a5, 160(sp)
     8d0: 63 14 f7 00  	bne	a4, a5, 0x8d8 <__init_libc+0xba>
     8d4: ae 77        	ld	a5, 232(sp)
     8d6: d9 c3        	beqz	a5, 0x95c <__init_libc+0x13e>
     8d8: 02 f0        	sd	zero, 32(sp)
     8da: 85 47        	li	a5, 1
     8dc: 02 f4        	sd	zero, 40(sp)
     8de: 3e d0        	sw	a5, 32(sp)
     8e0: 89 47        	li	a5, 2
     8e2: 3e d4        	sw	a5, 40(sp)
     8e4: 3c 08        	addi	a5, sp, 24
     8e6: 02 ec        	sd	zero, 24(sp)
     8e8: 02 e4        	sd	zero, 8(sp)
     8ea: 02 e8        	sd	zero, 16(sp)
     8ec: 93 08 90 04  	li	a7, 73
     8f0: 3e 85        	mv	a0, a5
     8f2: 8d 45        	li	a1, 3
     8f4: 30 00        	addi	a2, sp, 8
     8f6: 81 46        	li	a3, 0
     8f8: 21 47        	li	a4, 8
     8fa: 73 00 00 00  	ecall
     8fe: 01 25        	sext.w	a0, a0
     900: 63 45 05 02  	bltz	a0, 0x92a <__init_libc+0x10c>
     904: 21 66        	lui	a2, 8
     906: 97 55 00 00  	auipc	a1, 5
     90a: 93 85 a5 9d  	addi	a1, a1, -1574
     90e: 09 06        	addi	a2, a2, 2
     910: 03 d7 67 00  	lhu	a4, 6(a5)
     914: 13 77 07 02  	andi	a4, a4, 32
     918: 05 cf        	beqz	a4, 0x950 <__init_libc+0x132>
     91a: 93 08 80 03  	li	a7, 56
     91e: 13 05 c0 f9  	li	a0, -100
     922: 73 00 00 00  	ecall
     926: 63 55 05 02  	bgez	a0, 0x950 <__init_libc+0x132>
     92a: 23 00 00 00  	sb	zero, 0(zero)
     92e: 02 90        	ebreak
     930: 63 69 f7 00  	bltu	a4, a5, 0x942 <__init_libc+0x124>
     934: 14 65        	ld	a3, 8(a0)
     936: 8e 07        	slli	a5, a5, 3
     938: 93 87 07 16  	addi	a5, a5, 352
     93c: 8a 97        	add	a5, a5, sp
     93e: 23 b8 d7 ec  	sd	a3, -304(a5)
     942: 41 05        	addi	a0, a0, 16
     944: 1d b7        	j	0x86a <__init_libc+0x4c>
     946: 63 93 d7 00  	bne	a5, a3, 0x94c <__init_libc+0x12e>
     94a: 00 e3        	sd	s0, 0(a4)
     94c: 05 04        	addi	s0, s0, 1
     94e: 95 b7        	j	0x8b2 <__init_libc+0x94>
     950: a1 07        	addi	a5, a5, 8
     952: e3 1f f9 fa  	bne	s2, a5, 0x910 <__init_libc+0xf2>
     956: 85 47        	li	a5, 1
     958: 23 81 f4 00  	sb	a5, 2(s1)
     95c: f6 70        	ld	ra, 376(sp)
     95e: 56 74        	ld	s0, 368(sp)
     960: b6 74        	ld	s1, 360(sp)
     962: 16 79        	ld	s2, 352(sp)
     964: 19 61        	addi	sp, sp, 384
     966: 82 80        	ret

0000000000000968 <libc_start_init>:
     968: 01 11        	addi	sp, sp, -32
     96a: 17 73 00 00  	auipc	t1, 7
     96e: 03 33 63 7d  	ld	t1, 2006(t1)
     972: 22 e8        	sd	s0, 16(sp)
     974: 26 e4        	sd	s1, 8(sp)
     976: 06 ec        	sd	ra, 24(sp)
     978: 17 84 00 00  	auipc	s0, 8
     97c: 03 34 04 82  	ld	s0, -2016(s0)
     980: 02 93        	jalr	t1
     982: 97 74 00 00  	auipc	s1, 7
     986: 83 b4 e4 7f  	ld	s1, 2046(s1)
     98a: 63 67 94 00  	bltu	s0, s1, 0x998 <libc_start_init+0x30>
     98e: e2 60        	ld	ra, 24(sp)
     990: 42 64        	ld	s0, 16(sp)
     992: a2 64        	ld	s1, 8(sp)
     994: 05 61        	addi	sp, sp, 32
     996: 82 80        	ret
     998: 1c 60        	ld	a5, 0(s0)
     99a: 21 04        	addi	s0, s0, 8
     99c: 82 97        	jalr	a5
     99e: f5 b7        	j	0x98a <libc_start_init+0x22>

00000000000009a0 <libc_start_main_stage2>:
     9a0: 79 71        	addi	sp, sp, -48
     9a2: 22 f0        	sd	s0, 32(sp)
     9a4: 13 84 15 00  	addi	s0, a1, 1
     9a8: 0e 04        	slli	s0, s0, 3
     9aa: 06 f4        	sd	ra, 40(sp)
     9ac: 26 ec        	sd	s1, 24(sp)
     9ae: 4a e8        	sd	s2, 16(sp)
     9b0: ae 84        	mv	s1, a1
     9b2: 2a 89        	mv	s2, a0
     9b4: 32 94        	add	s0, s0, a2
     9b6: 32 e4        	sd	a2, 8(sp)
     9b8: ef f0 1f fb  	jal	0x968 <libc_start_init>
     9bc: a2 65        	ld	a1, 8(sp)
     9be: 22 86        	mv	a2, s0
     9c0: 26 85        	mv	a0, s1
     9c2: 02 99        	jalr	s2
     9c4: ef f0 5f b4  	jal	0x508 <exit>

00000000000009c8 <__libc_start_main>:
     9c8: 79 71        	addi	sp, sp, -48
     9ca: 22 f0        	sd	s0, 32(sp)
     9cc: 26 ec        	sd	s1, 24(sp)
     9ce: 2e 84        	mv	s0, a1
     9d0: aa 84        	mv	s1, a0
     9d2: 13 85 15 00  	addi	a0, a1, 1
     9d6: 0c 62        	ld	a1, 0(a2)
     9d8: 0e 05        	slli	a0, a0, 3
     9da: 32 95        	add	a0, a0, a2
     9dc: 06 f4        	sd	ra, 40(sp)
     9de: 32 e4        	sd	a2, 8(sp)
     9e0: ef f0 ff e3  	jal	0x81e <__init_libc>
     9e4: 97 07 00 00  	auipc	a5, 0
     9e8: 93 87 c7 fb  	addi	a5, a5, -68
     9ec: a2 85        	mv	a1, s0
     9ee: 02 74        	ld	s0, 32(sp)
     9f0: 22 66        	ld	a2, 8(sp)
     9f2: a2 70        	ld	ra, 40(sp)
     9f4: 26 85        	mv	a0, s1
     9f6: e2 64        	ld	s1, 24(sp)
     9f8: 45 61        	addi	sp, sp, 48
     9fa: 82 87        	jr	a5

00000000000009fc <dummy>:
     9fc: 82 80        	ret

00000000000009fe <libc_exit_fini>:
     9fe: 01 11        	addi	sp, sp, -32
     a00: 22 e8        	sd	s0, 16(sp)
     a02: 26 e4        	sd	s1, 8(sp)
     a04: 06 ec        	sd	ra, 24(sp)
     a06: 17 74 00 00  	auipc	s0, 7
     a0a: 03 34 a4 72  	ld	s0, 1834(s0)
     a0e: 97 74 00 00  	auipc	s1, 7
     a12: 83 b4 a4 75  	ld	s1, 1882(s1)
     a16: 63 eb 84 00  	bltu	s1, s0, 0xa2c <libc_exit_fini+0x2e>
     a1a: 42 64        	ld	s0, 16(sp)
     a1c: e2 60        	ld	ra, 24(sp)
     a1e: a2 64        	ld	s1, 8(sp)
     a20: 17 73 00 00  	auipc	t1, 7
     a24: 03 33 83 76  	ld	t1, 1896(t1)
     a28: 05 61        	addi	sp, sp, 32
     a2a: 02 83        	jr	t1
     a2c: 83 37 84 ff  	ld	a5, -8(s0)
     a30: 61 14        	addi	s0, s0, -8
     a32: 82 97        	jalr	a5
     a34: cd b7        	j	0xa16 <libc_exit_fini+0x18>

0000000000000a36 <kill>:
     a36: 41 11        	addi	sp, sp, -16
     a38: 06 e4        	sd	ra, 8(sp)
     a3a: 93 08 10 08  	li	a7, 129
     a3e: 73 00 00 00  	ecall
     a42: ef 20 20 15  	jal	0x2b94 <__syscall_ret>
     a46: a2 60        	ld	ra, 8(sp)
     a48: 01 25        	sext.w	a0, a0
     a4a: 41 01        	addi	sp, sp, 16
     a4c: 82 80        	ret

0000000000000a4e <a_fetch_or.isra.0>:
     a4e: 1c 41        	lw	a5, 0(a0)
     a50: 9b 86 07 00  	sext.w	a3, a5
     a54: cd 8f        	or	a5, a5, a1
     a56: 2f 27 05 16  	<unknown>
     a5a: 63 15 d7 00  	bne	a4, a3, 0xa64 <a_fetch_or.isra.0+0x16>
     a5e: 2f 26 f5 1e  	<unknown>
     a62: 75 fa        	bnez	a2, 0xa56 <a_fetch_or.isra.0+0x8>
     a64: 9b 07 07 00  	sext.w	a5, a4
     a68: e3 93 f6 fe  	bne	a3, a5, 0xa4e <a_fetch_or.isra.0>
     a6c: 82 80        	ret

0000000000000a6e <__get_handler_set>:
     a6e: 21 46        	li	a2, 8
     a70: 97 85 00 00  	auipc	a1, 8
     a74: 93 85 85 80  	addi	a1, a1, -2040
     a78: 6f 10 20 7f  	j	0x226a <memcpy>

0000000000000a7c <__libc_sigaction>:
     a7c: 59 71        	addi	sp, sp, -112
     a7e: ca e8        	sd	s2, 80(sp)
     a80: ce e4        	sd	s3, 72(sp)
     a82: 86 f4        	sd	ra, 104(sp)
     a84: a2 f0        	sd	s0, 96(sp)
     a86: a6 ec        	sd	s1, 88(sp)
     a88: d2 e0        	sd	s4, 64(sp)
     a8a: aa 89        	mv	s3, a0
     a8c: 32 89        	mv	s2, a2
     a8e: e1 c1        	beqz	a1, 0xb4e <__libc_sigaction+0xd2>
     a90: 9c 61        	ld	a5, 0(a1)
     a92: 85 44        	li	s1, 1
     a94: 2e 84        	mv	s0, a1
     a96: 63 f1 f4 08  	bgeu	s1, a5, 0xb18 <__libc_sigaction+0x9c>
     a9a: 9b 07 f5 ff  	addiw	a5, a0, -1
     a9e: 3e 87        	mv	a4, a5
     aa0: b3 94 e4 00  	sll	s1, s1, a4
     aa4: 99 83        	srli	a5, a5, 6
     aa6: 8e 07        	slli	a5, a5, 3
     aa8: 17 7a 00 00  	auipc	s4, 7
     aac: 13 0a 0a 7d  	addi	s4, s4, 2000
     ab0: 9b 85 04 00  	sext.w	a1, s1
     ab4: 3e 9a        	add	s4, s4, a5
     ab6: 81 c5        	beqz	a1, 0xabe <__libc_sigaction+0x42>
     ab8: 52 85        	mv	a0, s4
     aba: ef f0 5f f9  	jal	0xa4e <a_fetch_or.isra.0>
     abe: 93 d5 04 42  	srai	a1, s1, 32
     ac2: 89 c5        	beqz	a1, 0xacc <__libc_sigaction+0x50>
     ac4: 13 05 4a 00  	addi	a0, s4, 4
     ac8: ef f0 7f f8  	jal	0xa4e <a_fetch_or.isra.0>
     acc: 97 77 00 00  	auipc	a5, 7
     ad0: 83 c7 d7 72  	lbu	a5, 1837(a5)
     ad4: 85 e7        	bnez	a5, 0xafc <__libc_sigaction+0x80>
     ad6: 17 77 00 00  	auipc	a4, 7
     ada: 13 07 a7 7a  	addi	a4, a4, 1962
     ade: 1c 43        	lw	a5, 0(a4)
     ae0: 91 ef        	bnez	a5, 0xafc <__libc_sigaction+0x80>
     ae2: 8d 47        	li	a5, 3
     ae4: 82 17        	slli	a5, a5, 32
     ae6: 3e f0        	sd	a5, 32(sp)
     ae8: 93 08 70 08  	li	a7, 135
     aec: 05 45        	li	a0, 1
     aee: 0c 10        	addi	a1, sp, 32
     af0: 01 46        	li	a2, 0
     af2: a1 46        	li	a3, 8
     af4: 73 00 00 00  	ecall
     af8: 85 47        	li	a5, 1
     afa: 1c c3        	sw	a5, 0(a4)
     afc: 83 27 84 08  	lw	a5, 136(s0)
     b00: f1 83        	srli	a5, a5, 28
     b02: 85 8b        	andi	a5, a5, 1
     b04: 91 eb        	bnez	a5, 0xb18 <__libc_sigaction+0x9c>
     b06: 0f 00 30 03  	fence	rw, rw
     b0a: 85 47        	li	a5, 1
     b0c: 17 77 00 00  	auipc	a4, 7
     b10: 23 22 f7 76  	sw	a5, 1892(a4)
     b14: 0f 00 30 03  	fence	rw, rw
     b18: 1c 60        	ld	a5, 0(s0)
     b1a: 37 07 00 04  	lui	a4, 16384
     b1e: 3e e0        	sd	a5, 0(sp)
     b20: 83 27 84 08  	lw	a5, 136(s0)
     b24: 5d 8f        	or	a4, a4, a5
     b26: 3a e4        	sd	a4, 8(sp)
     b28: 91 8b        	andi	a5, a5, 4
     b2a: 17 27 00 00  	auipc	a4, 2
     b2e: 13 07 47 1b  	addi	a4, a4, 436
     b32: 89 e7        	bnez	a5, 0xb3c <__libc_sigaction+0xc0>
     b34: 17 27 00 00  	auipc	a4, 2
     b38: 13 07 a7 1a  	addi	a4, a4, 426
     b3c: 93 05 84 00  	addi	a1, s0, 8
     b40: 21 46        	li	a2, 8
     b42: 28 08        	addi	a0, sp, 24
     b44: 3a e8        	sd	a4, 16(sp)
     b46: ef 10 40 72  	jal	0x226a <memcpy>
     b4a: 8a 85        	mv	a1, sp
     b4c: 11 e0        	bnez	s0, 0xb50 <__libc_sigaction+0xd4>
     b4e: 81 45        	li	a1, 0
     b50: 01 46        	li	a2, 0
     b52: 63 03 09 00  	beqz	s2, 0xb58 <__libc_sigaction+0xdc>
     b56: 10 10        	addi	a2, sp, 32
     b58: 93 08 60 08  	li	a7, 134
     b5c: 4e 85        	mv	a0, s3
     b5e: a1 46        	li	a3, 8
     b60: 73 00 00 00  	ecall
     b64: 1b 04 05 00  	sext.w	s0, a0
     b68: 63 0f 09 00  	beqz	s2, 0xb86 <__libc_sigaction+0x10a>
     b6c: 09 ec        	bnez	s0, 0xb86 <__libc_sigaction+0x10a>
     b6e: 82 77        	ld	a5, 32(sp)
     b70: 21 46        	li	a2, 8
     b72: 2c 18        	addi	a1, sp, 56
     b74: 23 30 f9 00  	sd	a5, 0(s2)
     b78: a2 77        	ld	a5, 40(sp)
     b7a: 13 05 89 00  	addi	a0, s2, 8
     b7e: 23 24 f9 08  	sw	a5, 136(s2)
     b82: ef 10 80 6e  	jal	0x226a <memcpy>
     b86: 22 85        	mv	a0, s0
     b88: ef 20 c0 00  	jal	0x2b94 <__syscall_ret>
     b8c: a6 70        	ld	ra, 104(sp)
     b8e: 06 74        	ld	s0, 96(sp)
     b90: e6 64        	ld	s1, 88(sp)
     b92: 46 69        	ld	s2, 80(sp)
     b94: a6 69        	ld	s3, 72(sp)
     b96: 06 6a        	ld	s4, 64(sp)
     b98: 01 25        	sext.w	a0, a0
     b9a: 65 61        	addi	sp, sp, 112
     b9c: 82 80        	ret

0000000000000b9e <sigaction>:
     b9e: 39 71        	addi	sp, sp, -64
     ba0: 06 fc        	sd	ra, 56(sp)
     ba2: 22 f8        	sd	s0, 48(sp)
     ba4: 26 f4        	sd	s1, 40(sp)
     ba6: 9b 06 05 fe  	addiw	a3, a0, -32
     baa: 09 47        	li	a4, 2
     bac: 63 79 d7 00  	bgeu	a4, a3, 0xbbe <sigaction+0x20>
     bb0: 9b 07 05 00  	sext.w	a5, a0
     bb4: fd 37        	addiw	a5, a5, -1
     bb6: 13 07 f0 03  	li	a4, 63
     bba: 63 7d f7 00  	bgeu	a4, a5, 0xbd4 <sigaction+0x36>
     bbe: ef 10 d0 78  	jal	0x2b4a <__errno_location>
     bc2: d9 47        	li	a5, 22
     bc4: 1c c1        	sw	a5, 0(a0)
     bc6: fd 54        	li	s1, -1
     bc8: e2 70        	ld	ra, 56(sp)
     bca: 42 74        	ld	s0, 48(sp)
     bcc: 26 85        	mv	a0, s1
     bce: a2 74        	ld	s1, 40(sp)
     bd0: 21 61        	addi	sp, sp, 64
     bd2: 82 80        	ret
     bd4: 99 47        	li	a5, 6
     bd6: 2a 84        	mv	s0, a0
     bd8: 63 1f f5 00  	bne	a0, a5, 0xbf6 <sigaction+0x58>
     bdc: 28 08        	addi	a0, sp, 24
     bde: 32 e4        	sd	a2, 8(sp)
     be0: 2e e0        	sd	a1, 0(sp)
     be2: ef 20 a0 0b  	jal	0x2c9c <__block_all_sigs>
     be6: 17 85 00 00  	auipc	a0, 8
     bea: 13 05 a5 c3  	addi	a0, a0, -966
     bee: ef 10 b0 3c  	jal	0x27b8 <__lock>
     bf2: 22 66        	ld	a2, 8(sp)
     bf4: 82 65        	ld	a1, 0(sp)
     bf6: 22 85        	mv	a0, s0
     bf8: ef f0 5f e8  	jal	0xa7c <__libc_sigaction>
     bfc: 99 47        	li	a5, 6
     bfe: aa 84        	mv	s1, a0
     c00: e3 14 f4 fc  	bne	s0, a5, 0xbc8 <sigaction+0x2a>
     c04: 17 85 00 00  	auipc	a0, 8
     c08: 13 05 c5 c1  	addi	a0, a0, -996
     c0c: ef 10 f0 47  	jal	0x288a <__unlock>
     c10: 28 08        	addi	a0, sp, 24
     c12: ef 20 a0 0b  	jal	0x2ccc <__restore_sigs>
     c16: 4d bf        	j	0xbc8 <sigaction+0x2a>

0000000000000c18 <sigaddset>:
     c18: 9b 87 f5 ff  	addiw	a5, a1, -1
     c1c: 13 07 f0 03  	li	a4, 63
     c20: 63 66 f7 00  	bltu	a4, a5, 0xc2c <sigaddset+0x14>
     c24: 81 35        	addiw	a1, a1, -32
     c26: 09 47        	li	a4, 2
     c28: 63 6c b7 00  	bltu	a4, a1, 0xc40 <sigaddset+0x28>
     c2c: 41 11        	addi	sp, sp, -16
     c2e: 06 e4        	sd	ra, 8(sp)
     c30: ef 10 b0 71  	jal	0x2b4a <__errno_location>
     c34: a2 60        	ld	ra, 8(sp)
     c36: d9 47        	li	a5, 22
     c38: 1c c1        	sw	a5, 0(a0)
     c3a: 7d 55        	li	a0, -1
     c3c: 41 01        	addi	sp, sp, 16
     c3e: 82 80        	ret
     c40: 05 47        	li	a4, 1
     c42: 33 17 f7 00  	sll	a4, a4, a5
     c46: 1c 61        	ld	a5, 0(a0)
     c48: d9 8f        	or	a5, a5, a4
     c4a: 1c e1        	sd	a5, 0(a0)
     c4c: 01 45        	li	a0, 0
     c4e: 82 80        	ret

0000000000000c50 <sigemptyset>:
     c50: 23 30 05 00  	sd	zero, 0(a0)
     c54: 01 45        	li	a0, 0
     c56: 82 80        	ret

0000000000000c58 <sigprocmask>:
     c58: 41 11        	addi	sp, sp, -16
     c5a: 22 e0        	sd	s0, 0(sp)
     c5c: 06 e4        	sd	ra, 8(sp)
     c5e: ef 10 70 48  	jal	0x28e4 <pthread_sigmask>
     c62: 2a 84        	mv	s0, a0
     c64: 09 c5        	beqz	a0, 0xc6e <sigprocmask+0x16>
     c66: ef 10 50 6e  	jal	0x2b4a <__errno_location>
     c6a: 00 c1        	sw	s0, 0(a0)
     c6c: 7d 54        	li	s0, -1
     c6e: a2 60        	ld	ra, 8(sp)
     c70: 22 85        	mv	a0, s0
     c72: 02 64        	ld	s0, 0(sp)
     c74: 41 01        	addi	sp, sp, 16
     c76: 82 80        	ret

0000000000000c78 <printf>:
     c78: 1d 71        	addi	sp, sp, -96
     c7a: 2e f4        	sd	a1, 40(sp)
     c7c: 32 f8        	sd	a2, 48(sp)
     c7e: aa 85        	mv	a1, a0
     c80: 30 10        	addi	a2, sp, 40
     c82: 17 75 00 00  	auipc	a0, 7
     c86: 13 05 e5 38  	addi	a0, a0, 910
     c8a: 06 ec        	sd	ra, 24(sp)
     c8c: 36 fc        	sd	a3, 56(sp)
     c8e: ba e0        	sd	a4, 64(sp)
     c90: be e4        	sd	a5, 72(sp)
     c92: c2 e8        	sd	a6, 80(sp)
     c94: c6 ec        	sd	a7, 88(sp)
     c96: 32 e4        	sd	a2, 8(sp)
     c98: ef 10 80 4c  	jal	0x2160 <vfprintf>
     c9c: e2 60        	ld	ra, 24(sp)
     c9e: 25 61        	addi	sp, sp, 96
     ca0: 82 80        	ret

0000000000000ca2 <puts>:
     ca2: 01 11        	addi	sp, sp, -32
     ca4: 22 e8        	sd	s0, 16(sp)
     ca6: 26 e4        	sd	s1, 8(sp)
     ca8: 4a e0        	sd	s2, 0(sp)
     caa: 06 ec        	sd	ra, 24(sp)
     cac: 97 77 00 00  	auipc	a5, 7
     cb0: 83 a7 07 3f  	lw	a5, 1008(a5)
     cb4: 2a 89        	mv	s2, a0
     cb6: 17 74 00 00  	auipc	s0, 7
     cba: 13 04 a4 35  	addi	s0, s0, 858
     cbe: 81 44        	li	s1, 0
     cc0: 63 c6 07 00  	bltz	a5, 0xccc <puts+0x2a>
     cc4: 22 85        	mv	a0, s0
     cc6: ef 20 00 02  	jal	0x2ce6 <__lockfile>
     cca: aa 84        	mv	s1, a0
     ccc: 97 75 00 00  	auipc	a1, 7
     cd0: 93 85 45 34  	addi	a1, a1, 836
     cd4: 4a 85        	mv	a0, s2
     cd6: ef 20 20 1f  	jal	0x2ec8 <fputs_unlocked>
     cda: 85 47        	li	a5, 1
     cdc: 63 41 05 02  	bltz	a0, 0xcfe <puts+0x5c>
     ce0: 83 27 04 09  	lw	a5, 144(s0)
     ce4: 29 47        	li	a4, 10
     ce6: 63 8c e7 02  	beq	a5, a4, 0xd1e <puts+0x7c>
     cea: 1c 74        	ld	a5, 40(s0)
     cec: 14 70        	ld	a3, 32(s0)
     cee: 63 88 d7 02  	beq	a5, a3, 0xd1e <puts+0x7c>
     cf2: 93 86 17 00  	addi	a3, a5, 1
     cf6: 14 f4        	sd	a3, 40(s0)
     cf8: 23 80 e7 00  	sb	a4, 0(a5)
     cfc: 81 47        	li	a5, 0
     cfe: 33 04 f0 40  	neg	s0, a5
     d02: 99 c4        	beqz	s1, 0xd10 <puts+0x6e>
     d04: 17 75 00 00  	auipc	a0, 7
     d08: 13 05 c5 30  	addi	a0, a0, 780
     d0c: ef 20 60 07  	jal	0x2d82 <__unlockfile>
     d10: e2 60        	ld	ra, 24(sp)
     d12: 22 85        	mv	a0, s0
     d14: 42 64        	ld	s0, 16(sp)
     d16: a2 64        	ld	s1, 8(sp)
     d18: 02 69        	ld	s2, 0(sp)
     d1a: 05 61        	addi	sp, sp, 32
     d1c: 82 80        	ret
     d1e: a9 45        	li	a1, 10
     d20: 17 75 00 00  	auipc	a0, 7
     d24: 13 05 05 2f  	addi	a0, a0, 752
     d28: ef 20 20 0a  	jal	0x2dca <__overflow>
     d2c: 9b 57 f5 01  	srliw	a5, a0, 31
     d30: f9 b7        	j	0xcfe <puts+0x5c>

0000000000000d32 <pop_arg>:
     d32: dd 35        	addiw	a1, a1, -9
     d34: 1b 87 05 00  	sext.w	a4, a1
     d38: c5 47        	li	a5, 17
     d3a: 63 e2 e7 0a  	bltu	a5, a4, 0xdde <pop_arg+0xac>
     d3e: 93 97 05 02  	slli	a5, a1, 32
     d42: 93 d5 e7 01  	srli	a1, a5, 30
     d46: 97 47 00 00  	auipc	a5, 4
     d4a: 93 87 67 5a  	addi	a5, a5, 1446
     d4e: be 95        	add	a1, a1, a5
     d50: 98 41        	lw	a4, 0(a1)
     d52: 41 11        	addi	sp, sp, -16
     d54: 22 e0        	sd	s0, 0(sp)
     d56: 3e 97        	add	a4, a4, a5
     d58: 06 e4        	sd	ra, 8(sp)
     d5a: 1c 62        	ld	a5, 0(a2)
     d5c: 2a 84        	mv	s0, a0
     d5e: 02 87        	jr	a4
     d60: 13 87 87 00  	addi	a4, a5, 8
     d64: 9c 43        	lw	a5, 0(a5)
     d66: 18 e2        	sd	a4, 0(a2)
     d68: 1c e0        	sd	a5, 0(s0)
     d6a: a2 60        	ld	ra, 8(sp)
     d6c: 02 64        	ld	s0, 0(sp)
     d6e: 41 01        	addi	sp, sp, 16
     d70: 82 80        	ret
     d72: 13 87 87 00  	addi	a4, a5, 8
     d76: 18 e2        	sd	a4, 0(a2)
     d78: 83 e7 07 00  	lwu	a5, 0(a5)
     d7c: f5 b7        	j	0xd68 <pop_arg+0x36>
     d7e: 13 87 87 00  	addi	a4, a5, 8
     d82: 18 e2        	sd	a4, 0(a2)
     d84: 83 97 07 00  	lh	a5, 0(a5)
     d88: c5 b7        	j	0xd68 <pop_arg+0x36>
     d8a: 13 87 87 00  	addi	a4, a5, 8
     d8e: 18 e2        	sd	a4, 0(a2)
     d90: 83 d7 07 00  	lhu	a5, 0(a5)
     d94: d1 bf        	j	0xd68 <pop_arg+0x36>
     d96: 13 87 87 00  	addi	a4, a5, 8
     d9a: 18 e2        	sd	a4, 0(a2)
     d9c: 83 87 07 00  	lb	a5, 0(a5)
     da0: e1 b7        	j	0xd68 <pop_arg+0x36>
     da2: 13 87 87 00  	addi	a4, a5, 8
     da6: 18 e2        	sd	a4, 0(a2)
     da8: 83 c7 07 00  	lbu	a5, 0(a5)
     dac: 75 bf        	j	0xd68 <pop_arg+0x36>
     dae: 13 87 87 00  	addi	a4, a5, 8
     db2: 18 e2        	sd	a4, 0(a2)
     db4: 9c 63        	ld	a5, 0(a5)
     db6: 4d bf        	j	0xd68 <pop_arg+0x36>
     db8: 88 23        	<unknown>
     dba: 13 87 87 00  	addi	a4, a5, 8
     dbe: 18 e2        	sd	a4, 0(a2)
     dc0: ef 40 80 32  	jal	0x50e8 <__extenddftf2>
     dc4: 08 e0        	sd	a0, 0(s0)
     dc6: 0c e4        	sd	a1, 8(s0)
     dc8: 4d b7        	j	0xd6a <pop_arg+0x38>
     dca: bd 07        	addi	a5, a5, 15
     dcc: c1 9b        	andi	a5, a5, -16
     dce: 13 87 07 01  	addi	a4, a5, 16
     dd2: 18 e2        	sd	a4, 0(a2)
     dd4: 98 63        	ld	a4, 0(a5)
     dd6: 9c 67        	ld	a5, 8(a5)
     dd8: 18 e1        	sd	a4, 0(a0)
     dda: 1c e5        	sd	a5, 8(a0)
     ddc: 79 b7        	j	0xd6a <pop_arg+0x38>
     dde: 82 80        	ret

0000000000000de0 <fmt_u>:
     de0: aa 87        	mv	a5, a0
     de2: a9 46        	li	a3, 10
     de4: 2e 85        	mv	a0, a1
     de6: 91 e3        	bnez	a5, 0xdea <fmt_u+0xa>
     de8: 82 80        	ret
     dea: 33 f7 d7 02  	<unknown>
     dee: 7d 15        	addi	a0, a0, -1
     df0: 1b 07 07 03  	addiw	a4, a4, 48
     df4: b3 d7 d7 02  	<unknown>
     df8: 23 00 e5 00  	sb	a4, 0(a0)
     dfc: ed b7        	j	0xde6 <fmt_u+0x6>

0000000000000dfe <getint>:
     dfe: 37 d6 cc 0c  	lui	a2, 52429
     e02: b7 05 00 80  	lui	a1, 524288
     e06: aa 86        	mv	a3, a0
     e08: 25 43        	li	t1, 9
     e0a: 01 45        	li	a0, 0
     e0c: 13 06 c6 cc  	addi	a2, a2, -820
     e10: 59 5e        	li	t3, -10
     e12: 93 c5 f5 ff  	not	a1, a1
     e16: 98 62        	ld	a4, 0(a3)
     e18: 83 47 07 00  	lbu	a5, 0(a4)
     e1c: 1b 88 07 fd  	addiw	a6, a5, -48
     e20: c2 87        	mv	a5, a6
     e22: 63 73 03 01  	bgeu	t1, a6, 0xe28 <getint+0x2a>
     e26: 82 80        	ret
     e28: 63 6e a6 00  	bltu	a2, a0, 0xe44 <getint+0x46>
     e2c: bb 08 ae 02  	<unknown>
     e30: 7d 55        	li	a0, -1
     e32: bb 8e b8 00  	addw	t4, a7, a1
     e36: 63 c4 0e 01  	blt	t4, a6, 0xe3e <getint+0x40>
     e3a: 3b 85 17 41  	subw	a0, a5, a7
     e3e: 05 07        	addi	a4, a4, 1
     e40: 98 e2        	sd	a4, 0(a3)
     e42: d1 bf        	j	0xe16 <getint+0x18>
     e44: 7d 55        	li	a0, -1
     e46: e5 bf        	j	0xe3e <getint+0x40>

0000000000000e48 <out>:
     e48: aa 87        	mv	a5, a0
     e4a: 98 43        	lw	a4, 0(a5)
     e4c: 2e 85        	mv	a0, a1
     e4e: b2 85        	mv	a1, a2
     e50: 13 77 07 02  	andi	a4, a4, 32
     e54: 01 e7        	bnez	a4, 0xe5c <out+0x14>
     e56: 3e 86        	mv	a2, a5
     e58: 6f 20 20 0a  	j	0x2efa <__fwritex>
     e5c: 82 80        	ret

0000000000000e5e <pad>:
     e5e: c9 67        	lui	a5, 18
     e60: 7d 8f        	and	a4, a4, a5
     e62: 35 eb        	bnez	a4, 0xed6 <pad+0x78>
     e64: 63 d9 c6 06  	bge	a3, a2, 0xed6 <pad+0x78>
     e68: 69 71        	addi	sp, sp, -304
     e6a: 22 f2        	sd	s0, 288(sp)
     e6c: 26 ee        	sd	s1, 280(sp)
     e6e: 4a ea        	sd	s2, 272(sp)
     e70: bb 04 d6 40  	subw	s1, a2, a3
     e74: 06 f6        	sd	ra, 296(sp)
     e76: 4e e6        	sd	s3, 264(sp)
     e78: 52 e2        	sd	s4, 256(sp)
     e7a: 93 07 00 10  	li	a5, 256
     e7e: 2a 89        	mv	s2, a0
     e80: 26 84        	mv	s0, s1
     e82: 1b 86 04 00  	sext.w	a2, s1
     e86: 63 d4 97 00  	bge	a5, s1, 0xe8e <pad+0x30>
     e8a: 13 06 00 10  	li	a2, 256
     e8e: 8a 89        	mv	s3, sp
     e90: 4e 85        	mv	a0, s3
     e92: ef 10 90 02  	jal	0x26ba <memset>
     e96: 13 0a f0 0f  	li	s4, 255
     e9a: 63 45 9a 02  	blt	s4, s1, 0xec4 <pad+0x66>
     e9e: 1b 56 84 00  	srliw	a2, s0, 8
     ea2: 93 07 00 f0  	li	a5, -256
     ea6: 3b 06 f6 02  	<unknown>
     eaa: ce 85        	mv	a1, s3
     eac: 4a 85        	mv	a0, s2
     eae: 21 9e        	addw	a2, a2, s0
     eb0: ef f0 9f f9  	jal	0xe48 <out>
     eb4: b2 70        	ld	ra, 296(sp)
     eb6: 12 74        	ld	s0, 288(sp)
     eb8: f2 64        	ld	s1, 280(sp)
     eba: 52 69        	ld	s2, 272(sp)
     ebc: b2 69        	ld	s3, 264(sp)
     ebe: 12 6a        	ld	s4, 256(sp)
     ec0: 55 61        	addi	sp, sp, 304
     ec2: 82 80        	ret
     ec4: 13 06 00 10  	li	a2, 256
     ec8: ce 85        	mv	a1, s3
     eca: 4a 85        	mv	a0, s2
     ecc: ef f0 df f7  	jal	0xe48 <out>
     ed0: 9b 84 04 f0  	addiw	s1, s1, -256
     ed4: d9 b7        	j	0xe9a <pad+0x3c>
     ed6: 82 80        	ret

0000000000000ed8 <fmt_fp>:
     ed8: 19 71        	addi	sp, sp, -128
     eda: f9 72        	lui	t0, 1048574
     edc: a2 f8        	sd	s0, 112(sp)
     ede: 93 82 02 2c  	addi	t0, t0, 704
     ee2: 3a 84        	mv	s0, a4
     ee4: 09 67        	lui	a4, 2
     ee6: a6 f4        	sd	s1, 104(sp)
     ee8: ca f0        	sd	s2, 96(sp)
     eea: ce ec        	sd	s3, 88(sp)
     eec: da e0        	sd	s6, 64(sp)
     eee: 62 f8        	sd	s8, 48(sp)
     ef0: 66 f4        	sd	s9, 40(sp)
     ef2: 86 fc        	sd	ra, 120(sp)
     ef4: d2 e8        	sd	s4, 80(sp)
     ef6: d6 e4        	sd	s5, 72(sp)
     ef8: 5e fc        	sd	s7, 56(sp)
     efa: 6a f0        	sd	s10, 32(sp)
     efc: 6e ec        	sd	s11, 24(sp)
     efe: be 89        	mv	s3, a5
     f00: 16 91        	add	sp, sp, t0
     f02: f9 77        	lui	a5, 1048574
     f04: 13 07 07 d1  	addi	a4, a4, -752
     f08: 3e 97        	add	a4, a4, a5
     f0a: 9c 00        	addi	a5, sp, 64
     f0c: aa 84        	mv	s1, a0
     f0e: ae 8c        	mv	s9, a1
     f10: ba 97        	add	a5, a5, a4
     f12: 2e 85        	mv	a0, a1
     f14: b2 85        	mv	a1, a2
     f16: 32 8c        	mv	s8, a2
     f18: 36 89        	mv	s2, a3
     f1a: 42 8b        	mv	s6, a6
     f1c: 23 ae 07 2e  	sw	zero, 764(a5)
     f20: ef 10 10 4d  	jal	0x2bf0 <__signbitl>
     f24: 61 c9        	beqz	a0, 0xff4 <fmt_fp+0x11c>
     f26: fd 57        	li	a5, -1
     f28: fe 17        	slli	a5, a5, 63
     f2a: 33 4c fc 00  	xor	s8, s8, a5
     f2e: 05 4a        	li	s4, 1
     f30: 97 4a 00 00  	auipc	s5, 4
     f34: 93 8a 8a 40  	addi	s5, s5, 1032
     f38: 66 85        	mv	a0, s9
     f3a: e2 85        	mv	a1, s8
     f3c: ef 10 b0 48  	jal	0x2bc6 <__fpclassifyl>
     f40: 85 47        	li	a5, 1
     f42: 63 c3 a7 0e  	blt	a5, a0, 0x1028 <fmt_fp+0x150>
     f46: 13 7b 0b 02  	andi	s6, s6, 32
     f4a: 97 4b 00 00  	auipc	s7, 4
     f4e: 93 8b 6b 40  	addi	s7, s7, 1030
     f52: 63 16 0b 00  	bnez	s6, 0xf5e <fmt_fp+0x86>
     f56: 97 4b 00 00  	auipc	s7, 4
     f5a: 93 8b 2b 40  	addi	s7, s7, 1026
     f5e: 66 86        	mv	a2, s9
     f60: e2 86        	mv	a3, s8
     f62: 66 85        	mv	a0, s9
     f64: e2 85        	mv	a1, s8
     f66: ef 20 f0 5f  	jal	0x3d64 <__netf2>
     f6a: 19 c9        	beqz	a0, 0xf80 <fmt_fp+0xa8>
     f6c: 97 4b 00 00  	auipc	s7, 4
     f70: 93 8b cb 3f  	addi	s7, s7, 1020
     f74: 63 16 0b 00  	bnez	s6, 0xf80 <fmt_fp+0xa8>
     f78: 97 4b 00 00  	auipc	s7, 4
     f7c: 93 8b 8b 3e  	addi	s7, s7, 1000
     f80: 41 77        	lui	a4, 1048560
     f82: 1b 0b 3a 00  	addiw	s6, s4, 3
     f86: 7d 17        	addi	a4, a4, -1
     f88: 33 f7 e9 00  	and	a4, s3, a4
     f8c: da 86        	mv	a3, s6
     f8e: 4a 86        	mv	a2, s2
     f90: 93 05 00 02  	li	a1, 32
     f94: 26 85        	mv	a0, s1
     f96: ef f0 9f ec  	jal	0xe5e <pad>
     f9a: 52 86        	mv	a2, s4
     f9c: d6 85        	mv	a1, s5
     f9e: 26 85        	mv	a0, s1
     fa0: ef f0 9f ea  	jal	0xe48 <out>
     fa4: 0d 46        	li	a2, 3
     fa6: de 85        	mv	a1, s7
     fa8: 26 85        	mv	a0, s1
     faa: ef f0 ff e9  	jal	0xe48 <out>
     fae: 09 67        	lui	a4, 2
     fb0: 33 c7 e9 00  	xor	a4, s3, a4
     fb4: da 86        	mv	a3, s6
     fb6: 4a 86        	mv	a2, s2
     fb8: 93 05 00 02  	li	a1, 32
     fbc: 26 85        	mv	a0, s1
     fbe: 5a 84        	mv	s0, s6
     fc0: ef f0 ff e9  	jal	0xe5e <pad>
     fc4: 63 53 2b 01  	bge	s6, s2, 0xfca <fmt_fp+0xf2>
     fc8: 4a 84        	mv	s0, s2
     fca: 1b 05 04 00  	sext.w	a0, s0
     fce: 89 62        	lui	t0, 2
     fd0: 93 82 02 d4  	addi	t0, t0, -704
     fd4: 16 91        	add	sp, sp, t0
     fd6: e6 70        	ld	ra, 120(sp)
     fd8: 46 74        	ld	s0, 112(sp)
     fda: a6 74        	ld	s1, 104(sp)
     fdc: 06 79        	ld	s2, 96(sp)
     fde: e6 69        	ld	s3, 88(sp)
     fe0: 46 6a        	ld	s4, 80(sp)
     fe2: a6 6a        	ld	s5, 72(sp)
     fe4: 06 6b        	ld	s6, 64(sp)
     fe6: e2 7b        	ld	s7, 56(sp)
     fe8: 42 7c        	ld	s8, 48(sp)
     fea: a2 7c        	ld	s9, 40(sp)
     fec: 02 7d        	ld	s10, 32(sp)
     fee: e2 6d        	ld	s11, 24(sp)
     ff0: 09 61        	addi	sp, sp, 128
     ff2: 82 80        	ret
     ff4: 13 d7 b9 00  	srli	a4, s3, 11
     ff8: 05 8b        	andi	a4, a4, 1
     ffa: 9b 87 09 00  	sext.w	a5, s3
     ffe: 09 eb        	bnez	a4, 0x1010 <fmt_fp+0x138>
    1000: 85 8b        	andi	a5, a5, 1
    1002: 89 ef        	bnez	a5, 0x101c <fmt_fp+0x144>
    1004: 2a 8a        	mv	s4, a0
    1006: 97 4a 00 00  	auipc	s5, 4
    100a: 93 8a 3a 33  	addi	s5, s5, 819
    100e: 2d b7        	j	0xf38 <fmt_fp+0x60>
    1010: 05 4a        	li	s4, 1
    1012: 97 4a 00 00  	auipc	s5, 4
    1016: 93 8a 9a 32  	addi	s5, s5, 809
    101a: 39 bf        	j	0xf38 <fmt_fp+0x60>
    101c: 05 4a        	li	s4, 1
    101e: 97 4a 00 00  	auipc	s5, 4
    1022: 93 8a 0a 32  	addi	s5, s5, 800
    1026: 09 bf        	j	0xf38 <fmt_fp+0x60>
    1028: 79 7d        	lui	s10, 1048574
    102a: 89 6b        	lui	s7, 2
    102c: 13 06 cd 2f  	addi	a2, s10, 764
    1030: 93 87 0b d1  	addi	a5, s7, -752
    1034: b2 97        	add	a5, a5, a2
    1036: 98 00        	addi	a4, sp, 64
    1038: 33 86 e7 00  	add	a2, a5, a4
    103c: 66 85        	mv	a0, s9
    103e: e2 85        	mv	a1, s8
    1040: ef 10 70 3b  	jal	0x2bf6 <frexpl.localalias>
    1044: 2a 86        	mv	a2, a0
    1046: ae 86        	mv	a3, a1
    1048: ef 20 00 30  	jal	0x3348 <__addtf3>
    104c: 01 46        	li	a2, 0
    104e: 81 46        	li	a3, 0
    1050: aa 8c        	mv	s9, a0
    1052: 2e 8c        	mv	s8, a1
    1054: 2a e8        	sd	a0, 16(sp)
    1056: 2e e0        	sd	a1, 0(sp)
    1058: ef 20 d0 50  	jal	0x3d64 <__netf2>
    105c: e2 87        	mv	a5, s8
    105e: 66 87        	mv	a4, s9
    1060: 01 cd        	beqz	a0, 0x1078 <fmt_fp+0x1a0>
    1062: 93 86 0b d1  	addi	a3, s7, -752
    1066: ea 96        	add	a3, a3, s10
    1068: 90 00        	addi	a2, sp, 64
    106a: 33 8d c6 00  	add	s10, a3, a2
    106e: 83 26 cd 2f  	lw	a3, 764(s10)
    1072: fd 36        	addiw	a3, a3, -1
    1074: 23 2e dd 2e  	sw	a3, 764(s10)
    1078: 93 66 0b 02  	ori	a3, s6, 32
    107c: 36 e0        	sd	a3, 0(sp)
    107e: 13 66 0b 02  	ori	a2, s6, 32
    1082: 93 06 10 06  	li	a3, 97
    1086: 63 12 d6 2c  	bne	a2, a3, 0x134a <fmt_fp+0x472>
    108a: 93 76 0b 02  	andi	a3, s6, 32
    108e: 36 e8        	sd	a3, 16(sp)
    1090: 91 c2        	beqz	a3, 0x1094 <fmt_fp+0x1bc>
    1092: a5 0a        	addi	s5, s5, 9
    1094: 9b 06 04 00  	sext.w	a3, s0
    1098: 1b 0d 2a 00  	addiw	s10, s4, 2
    109c: 36 e4        	sd	a3, 8(sp)
    109e: e9 46        	li	a3, 26
    10a0: 6a 8a        	mv	s4, s10
    10a2: 97 4d 00 00  	auipc	s11, 4
    10a6: 93 8d ed 3e  	addi	s11, s11, 1006
    10aa: 63 e4 86 04  	bltu	a3, s0, 0x10f2 <fmt_fp+0x21a>
    10ae: 83 bc 0d 00  	ld	s9, 0(s11)
    10b2: 03 bc 8d 00  	ld	s8, 8(s11)
    10b6: ed 4b        	li	s7, 27
    10b8: bb 8b 8b 40  	subw	s7, s7, s0
    10bc: 7d 58        	li	a6, -1
    10be: fd 3b        	addiw	s7, s7, -1
    10c0: 63 95 0b 19  	bne	s7, a6, 0x124a <fmt_fp+0x372>
    10c4: 03 c6 0a 00  	lbu	a2, 0(s5)
    10c8: 93 06 d0 02  	li	a3, 45
    10cc: 63 1e d6 18  	bne	a2, a3, 0x1268 <fmt_fp+0x390>
    10d0: fe 1b        	slli	s7, s7, 63
    10d2: 66 86        	mv	a2, s9
    10d4: e2 86        	mv	a3, s8
    10d6: 3a 85        	mv	a0, a4
    10d8: b3 c5 77 01  	xor	a1, a5, s7
    10dc: ef 30 80 44  	jal	0x4524 <__subtf3>
    10e0: 2a 86        	mv	a2, a0
    10e2: ae 86        	mv	a3, a1
    10e4: 66 85        	mv	a0, s9
    10e6: e2 85        	mv	a1, s8
    10e8: ef 20 00 26  	jal	0x3348 <__addtf3>
    10ec: aa 8c        	mv	s9, a0
    10ee: 33 cc 75 01  	xor	s8, a1, s7
    10f2: f9 7b        	lui	s7, 1048574
    10f4: 89 66        	lui	a3, 2
    10f6: 93 87 0b 30  	addi	a5, s7, 768
    10fa: 13 87 06 d1  	addi	a4, a3, -752
    10fe: 3e 97        	add	a4, a4, a5
    1100: 9c 00        	addi	a5, sp, 64
    1102: ba 97        	add	a5, a5, a4
    1104: 93 85 c7 00  	addi	a1, a5, 12
    1108: 3e ec        	sd	a5, 24(sp)
    110a: 93 87 06 d1  	addi	a5, a3, -752
    110e: de 97        	add	a5, a5, s7
    1110: 98 00        	addi	a4, sp, 64
    1112: b3 8b e7 00  	add	s7, a5, a4
    1116: 03 a7 cb 2f  	lw	a4, 764(s7)
    111a: 2e e0        	sd	a1, 0(sp)
    111c: 1b 55 f7 41  	sraiw	a0, a4, 31
    1120: 29 8f        	xor	a4, a4, a0
    1122: 3b 05 a7 40  	subw	a0, a4, a0
    1126: ef f0 bf cb  	jal	0xde0 <fmt_u>
    112a: 82 65        	ld	a1, 0(sp)
    112c: e2 67        	ld	a5, 24(sp)
    112e: 63 18 b5 00  	bne	a0, a1, 0x113e <fmt_fp+0x266>
    1132: 13 07 00 03  	li	a4, 48
    1136: a3 85 eb 30  	sb	a4, 779(s7)
    113a: 13 85 b7 00  	addi	a0, a5, 11
    113e: 09 67        	lui	a4, 2
    1140: f9 77        	lui	a5, 1048574
    1142: 13 07 07 d1  	addi	a4, a4, -752
    1146: 3e 97        	add	a4, a4, a5
    1148: 9c 00        	addi	a5, sp, 64
    114a: ba 97        	add	a5, a5, a4
    114c: 03 a7 c7 2f  	lw	a4, 764(a5)
    1150: 93 07 d0 02  	li	a5, 45
    1154: 63 44 07 00  	bltz	a4, 0x115c <fmt_fp+0x284>
    1158: 93 07 b0 02  	li	a5, 43
    115c: a3 0f f5 fe  	sb	a5, -1(a0)
    1160: 93 07 e5 ff  	addi	a5, a0, -2
    1164: 3e e0        	sd	a5, 0(sp)
    1166: 09 67        	lui	a4, 2
    1168: f9 77        	lui	a5, 1048574
    116a: 93 87 07 31  	addi	a5, a5, 784
    116e: 13 07 07 d1  	addi	a4, a4, -752
    1172: 3e 97        	add	a4, a4, a5
    1174: 9c 00        	addi	a5, sp, 64
    1176: b3 0b f7 00  	add	s7, a4, a5
    117a: 83 b7 0d 00  	ld	a5, 0(s11)
    117e: 3d 2b        	addiw	s6, s6, 15
    1180: 23 0f 65 ff  	sb	s6, -2(a0)
    1184: 3e f0        	sd	a5, 32(sp)
    1186: 83 b7 8d 00  	ld	a5, 8(s11)
    118a: 5e ec        	sd	s7, 24(sp)
    118c: 93 fd 89 00  	andi	s11, s3, 8
    1190: 3e f4        	sd	a5, 40(sp)
    1192: e2 85        	mv	a1, s8
    1194: 66 85        	mv	a0, s9
    1196: ef 30 d0 58  	jal	0x4f22 <__fixtfsi>
    119a: 01 25        	sext.w	a0, a0
    119c: 97 47 00 00  	auipc	a5, 4
    11a0: 93 87 47 54  	addi	a5, a5, 1348
    11a4: 33 87 a7 00  	add	a4, a5, a0
    11a8: 03 47 07 00  	lbu	a4, 0(a4)
    11ac: c2 67        	ld	a5, 16(sp)
    11ae: 13 8b 1b 00  	addi	s6, s7, 1
    11b2: 5d 8f        	or	a4, a4, a5
    11b4: 23 80 eb 00  	sb	a4, 0(s7)
    11b8: ef 30 10 68  	jal	0x5038 <__floatsitf>
    11bc: 2a 86        	mv	a2, a0
    11be: ae 86        	mv	a3, a1
    11c0: 66 85        	mv	a0, s9
    11c2: e2 85        	mv	a1, s8
    11c4: ef 30 00 36  	jal	0x4524 <__subtf3>
    11c8: a2 76        	ld	a3, 40(sp)
    11ca: 02 76        	ld	a2, 32(sp)
    11cc: ef 20 70 42  	jal	0x3df2 <__multf3>
    11d0: e2 67        	ld	a5, 24(sp)
    11d2: 2a 88        	mv	a6, a0
    11d4: 2e 87        	mv	a4, a1
    11d6: b3 06 fb 40  	sub	a3, s6, a5
    11da: 85 47        	li	a5, 1
    11dc: aa 8c        	mv	s9, a0
    11de: 2e 8c        	mv	s8, a1
    11e0: 63 95 f6 02  	bne	a3, a5, 0x120a <fmt_fp+0x332>
    11e4: 01 46        	li	a2, 0
    11e6: 81 46        	li	a3, 0
    11e8: 2e fc        	sd	a1, 56(sp)
    11ea: 2a f8        	sd	a0, 48(sp)
    11ec: ef 20 90 37  	jal	0x3d64 <__netf2>
    11f0: 66 88        	mv	a6, s9
    11f2: 62 87        	mv	a4, s8
    11f4: 09 e5        	bnez	a0, 0x11fe <fmt_fp+0x326>
    11f6: 63 44 80 00  	bgtz	s0, 0x11fe <fmt_fp+0x326>
    11fa: 63 8f 0d 00  	beqz	s11, 0x1218 <fmt_fp+0x340>
    11fe: 93 07 e0 02  	li	a5, 46
    1202: 13 8b 2b 00  	addi	s6, s7, 2
    1206: a3 80 fb 00  	sb	a5, 1(s7)
    120a: 01 46        	li	a2, 0
    120c: 81 46        	li	a3, 0
    120e: 42 85        	mv	a0, a6
    1210: ba 85        	mv	a1, a4
    1212: ef 20 30 35  	jal	0x3d64 <__netf2>
    1216: 35 e5        	bnez	a0, 0x1282 <fmt_fp+0x3aa>
    1218: 89 67        	lui	a5, 2
    121a: 79 77        	lui	a4, 1048574
    121c: 93 87 07 d1  	addi	a5, a5, -752
    1220: ba 97        	add	a5, a5, a4
    1222: 94 00        	addi	a3, sp, 64
    1224: 33 8c d7 00  	add	s8, a5, a3
    1228: 82 67        	ld	a5, 0(sp)
    122a: 13 0c cc 30  	addi	s8, s8, 780
    122e: 33 0c fc 40  	sub	s8, s8, a5
    1232: b7 07 00 80  	lui	a5, 524288
    1236: 93 c7 d7 ff  	xori	a5, a5, -3
    123a: b3 87 87 41  	sub	a5, a5, s8
    123e: b3 87 a7 41  	sub	a5, a5, s10
    1242: 63 d2 87 04  	bge	a5, s0, 0x1286 <fmt_fp+0x3ae>
    1246: 7d 55        	li	a0, -1
    1248: 59 b3        	j	0xfce <fmt_fp+0xf6>
    124a: 03 b6 0d 00  	ld	a2, 0(s11)
    124e: 83 b6 8d 00  	ld	a3, 8(s11)
    1252: 66 85        	mv	a0, s9
    1254: e2 85        	mv	a1, s8
    1256: 3e ec        	sd	a5, 24(sp)
    1258: 3a e0        	sd	a4, 0(sp)
    125a: ef 20 90 39  	jal	0x3df2 <__multf3>
    125e: e2 67        	ld	a5, 24(sp)
    1260: 02 67        	ld	a4, 0(sp)
    1262: aa 8c        	mv	s9, a0
    1264: 2e 8c        	mv	s8, a1
    1266: 99 bd        	j	0x10bc <fmt_fp+0x1e4>
    1268: 3a 86        	mv	a2, a4
    126a: be 86        	mv	a3, a5
    126c: 66 85        	mv	a0, s9
    126e: e2 85        	mv	a1, s8
    1270: ef 20 80 0d  	jal	0x3348 <__addtf3>
    1274: 66 86        	mv	a2, s9
    1276: e2 86        	mv	a3, s8
    1278: ef 30 c0 2a  	jal	0x4524 <__subtf3>
    127c: aa 8c        	mv	s9, a0
    127e: 2e 8c        	mv	s8, a1
    1280: 8d bd        	j	0x10f2 <fmt_fp+0x21a>
    1282: da 8b        	mv	s7, s6
    1284: 39 b7        	j	0x1192 <fmt_fp+0x2ba>
    1286: 89 67        	lui	a5, 2
    1288: 13 07 07 31  	addi	a4, a4, 784
    128c: 93 87 07 d1  	addi	a5, a5, -752
    1290: ba 97        	add	a5, a5, a4
    1292: 98 00        	addi	a4, sp, 64
    1294: 3e 97        	add	a4, a4, a5
    1296: 33 0b eb 40  	sub	s6, s6, a4
    129a: 9b 07 0c 00  	sext.w	a5, s8
    129e: bb 0d 6c 01  	addw	s11, s8, s6
    12a2: 4d c0        	beqz	s0, 0x1344 <fmt_fp+0x46c>
    12a4: 13 07 fb ff  	addi	a4, s6, -1
    12a8: 63 4e e4 08  	blt	s0, a4, 0x1344 <fmt_fp+0x46c>
    12ac: 22 67        	ld	a4, 8(sp)
    12ae: 1b 04 27 00  	addiw	s0, a4, 2
    12b2: 3d 9c        	addw	s0, s0, a5
    12b4: bb 0c 44 01  	addw	s9, s0, s4
    12b8: 4e 87        	mv	a4, s3
    12ba: e6 86        	mv	a3, s9
    12bc: 4a 86        	mv	a2, s2
    12be: 93 05 00 02  	li	a1, 32
    12c2: 26 85        	mv	a0, s1
    12c4: ef f0 bf b9  	jal	0xe5e <pad>
    12c8: d6 85        	mv	a1, s5
    12ca: 6a 86        	mv	a2, s10
    12cc: 26 85        	mv	a0, s1
    12ce: ef f0 bf b7  	jal	0xe48 <out>
    12d2: 41 67        	lui	a4, 16
    12d4: e6 86        	mv	a3, s9
    12d6: 33 c7 e9 00  	xor	a4, s3, a4
    12da: 4a 86        	mv	a2, s2
    12dc: 93 05 00 03  	li	a1, 48
    12e0: 26 85        	mv	a0, s1
    12e2: ef f0 df b7  	jal	0xe5e <pad>
    12e6: f9 75        	lui	a1, 1048574
    12e8: 89 67        	lui	a5, 2
    12ea: 93 85 05 31  	addi	a1, a1, 784
    12ee: 93 87 07 d1  	addi	a5, a5, -752
    12f2: ae 97        	add	a5, a5, a1
    12f4: 98 00        	addi	a4, sp, 64
    12f6: b3 85 e7 00  	add	a1, a5, a4
    12fa: 5a 86        	mv	a2, s6
    12fc: 26 85        	mv	a0, s1
    12fe: ef f0 bf b4  	jal	0xe48 <out>
    1302: 01 47        	li	a4, 0
    1304: 81 46        	li	a3, 0
    1306: 3b 06 b4 41  	subw	a2, s0, s11
    130a: 93 05 00 03  	li	a1, 48
    130e: 26 85        	mv	a0, s1
    1310: ef f0 ff b4  	jal	0xe5e <pad>
    1314: 82 65        	ld	a1, 0(sp)
    1316: 62 86        	mv	a2, s8
    1318: 26 85        	mv	a0, s1
    131a: ef f0 ff b2  	jal	0xe48 <out>
    131e: 9b 8a 09 00  	sext.w	s5, s3
    1322: 09 67        	lui	a4, 2
    1324: 33 c7 ea 00  	xor	a4, s5, a4
    1328: e6 86        	mv	a3, s9
    132a: 4a 86        	mv	a2, s2
    132c: 93 05 00 02  	li	a1, 32
    1330: 26 85        	mv	a0, s1
    1332: 66 8a        	mv	s4, s9
    1334: ef f0 bf b2  	jal	0xe5e <pad>
    1338: 63 d3 2c 01  	bge	s9, s2, 0x133e <fmt_fp+0x466>
    133c: 4a 8a        	mv	s4, s2
    133e: 1b 05 0a 00  	sext.w	a0, s4
    1342: 71 b1        	j	0xfce <fmt_fp+0xf6>
    1344: 1b 84 0d 00  	sext.w	s0, s11
    1348: b5 b7        	j	0x12b4 <fmt_fp+0x3dc>
    134a: 63 53 04 00  	bgez	s0, 0x1350 <fmt_fp+0x478>
    134e: 19 44        	li	s0, 6
    1350: 01 46        	li	a2, 0
    1352: 81 46        	li	a3, 0
    1354: 3a 85        	mv	a0, a4
    1356: be 85        	mv	a1, a5
    1358: 3a ec        	sd	a4, 24(sp)
    135a: 3e e8        	sd	a5, 16(sp)
    135c: ef 20 90 20  	jal	0x3d64 <__netf2>
    1360: 1d c9        	beqz	a0, 0x1396 <fmt_fp+0x4be>
    1362: 62 67        	ld	a4, 24(sp)
    1364: c2 67        	ld	a5, 16(sp)
    1366: 97 46 00 00  	auipc	a3, 4
    136a: 93 86 a6 18  	addi	a3, a3, 394
    136e: 90 62        	ld	a2, 0(a3)
    1370: 94 66        	ld	a3, 8(a3)
    1372: 3a 85        	mv	a0, a4
    1374: be 85        	mv	a1, a5
    1376: ef 20 d0 27  	jal	0x3df2 <__multf3>
    137a: 09 67        	lui	a4, 2
    137c: f9 77        	lui	a5, 1048574
    137e: 13 07 07 d1  	addi	a4, a4, -752
    1382: 3e 97        	add	a4, a4, a5
    1384: 9c 00        	addi	a5, sp, 64
    1386: ba 97        	add	a5, a5, a4
    1388: 03 a7 c7 2f  	lw	a4, 764(a5)
    138c: aa 8c        	mv	s9, a0
    138e: 2e 8c        	mv	s8, a1
    1390: 11 37        	addiw	a4, a4, -28
    1392: 23 ae e7 2e  	sw	a4, 764(a5)
    1396: 89 66        	lui	a3, 2
    1398: 13 87 06 d1  	addi	a4, a3, -752
    139c: f9 77        	lui	a5, 1048574
    139e: 3e 97        	add	a4, a4, a5
    13a0: 90 00        	addi	a2, sp, 64
    13a2: 32 97        	add	a4, a4, a2
    13a4: 03 23 c7 2f  	lw	t1, 764(a4)
    13a8: 36 87        	mv	a4, a3
    13aa: 93 86 86 b8  	addi	a3, a3, -1144
    13ae: b3 88 26 00  	add	a7, a3, sp
    13b2: 63 59 03 00  	bgez	t1, 0x13c4 <fmt_fp+0x4ec>
    13b6: 93 87 87 33  	addi	a5, a5, 824
    13ba: 13 07 07 d1  	addi	a4, a4, -752
    13be: 3e 97        	add	a4, a4, a5
    13c0: b3 08 c7 00  	add	a7, a4, a2
    13c4: 17 47 00 00  	auipc	a4, 4
    13c8: 13 07 c7 13  	addi	a4, a4, 316
    13cc: 83 3d 07 00  	ld	s11, 0(a4)
    13d0: 83 3b 87 00  	ld	s7, 8(a4)
    13d4: 46 8d        	mv	s10, a7
    13d6: e2 85        	mv	a1, s8
    13d8: 66 85        	mv	a0, s9
    13da: 46 ec        	sd	a7, 24(sp)
    13dc: 1a e8        	sd	t1, 16(sp)
    13de: ef 30 30 3e  	jal	0x4fc0 <__fixunstfsi>
    13e2: 23 20 ad 00  	sw	a0, 0(s10)
    13e6: 01 25        	sext.w	a0, a0
    13e8: ef 30 30 4b  	jal	0x509a <__floatunsitf>
    13ec: 2a 86        	mv	a2, a0
    13ee: ae 86        	mv	a3, a1
    13f0: 66 85        	mv	a0, s9
    13f2: e2 85        	mv	a1, s8
    13f4: ef 30 00 13  	jal	0x4524 <__subtf3>
    13f8: 6e 86        	mv	a2, s11
    13fa: de 86        	mv	a3, s7
    13fc: ef 20 70 1f  	jal	0x3df2 <__multf3>
    1400: 01 46        	li	a2, 0
    1402: 81 46        	li	a3, 0
    1404: aa 8c        	mv	s9, a0
    1406: 2e 8c        	mv	s8, a1
    1408: ef 20 d0 15  	jal	0x3d64 <__netf2>
    140c: 42 63        	ld	t1, 16(sp)
    140e: e2 68        	ld	a7, 24(sp)
    1410: 11 0d        	addi	s10, s10, 4
    1412: 71 f1        	bnez	a0, 0x13d6 <fmt_fp+0x4fe>
    1414: 37 d5 9a 3b  	lui	a0, 244141
    1418: c6 8b        	mv	s7, a7
    141a: 01 47        	li	a4, 0
    141c: 75 4e        	li	t3, 29
    141e: 13 05 05 a0  	addi	a0, a0, -1536
    1422: 63 42 60 14  	bgtz	t1, 0x1566 <fmt_fp+0x68e>
    1426: 11 cb        	beqz	a4, 0x143a <fmt_fp+0x562>
    1428: 89 67        	lui	a5, 2
    142a: 79 77        	lui	a4, 1048574
    142c: 93 87 07 d1  	addi	a5, a5, -752
    1430: ba 97        	add	a5, a5, a4
    1432: 98 00        	addi	a4, sp, 64
    1434: 3e 97        	add	a4, a4, a5
    1436: 23 2e 67 2e  	sw	t1, 764(a4)
    143a: a5 46        	li	a3, 9
    143c: 1b 07 d4 02  	addiw	a4, s0, 45
    1440: 3b 57 d7 02  	<unknown>
    1444: 89 67        	lui	a5, 2
    1446: f9 76        	lui	a3, 1048574
    1448: 93 87 07 d1  	addi	a5, a5, -752
    144c: b6 97        	add	a5, a5, a3
    144e: 94 00        	addi	a3, sp, 64
    1450: be 96        	add	a3, a3, a5
    1452: 37 de 9a 3b  	lui	t3, 244141
    1456: 03 a6 c6 2f  	lw	a2, 764(a3)
    145a: 5d 5f        	li	t5, -9
    145c: 81 46        	li	a3, 0
    145e: 85 4f        	li	t6, 1
    1460: 1b 0e 0e a0  	addiw	t3, t3, -1536
    1464: 93 02 60 06  	li	t0, 102
    1468: 05 27        	addiw	a4, a4, 1
    146a: 02 17        	slli	a4, a4, 32
    146c: 01 93        	srli	a4, a4, 32
    146e: 93 1e 27 00  	slli	t4, a4, 2
    1472: 63 43 06 14  	bltz	a2, 0x15b8 <fmt_fp+0x6e0>
    1476: 91 ca        	beqz	a3, 0x148a <fmt_fp+0x5b2>
    1478: 89 67        	lui	a5, 2
    147a: 79 77        	lui	a4, 1048574
    147c: 93 87 07 d1  	addi	a5, a5, -752
    1480: ba 97        	add	a5, a5, a4
    1482: 98 00        	addi	a4, sp, 64
    1484: 3e 97        	add	a4, a4, a5
    1486: 23 2e c7 2e  	sw	a2, 764(a4)
    148a: 01 43        	li	t1, 0
    148c: 63 fe ab 01  	bgeu	s7, s10, 0x14a8 <fmt_fp+0x5d0>
    1490: 33 87 78 41  	sub	a4, a7, s7
    1494: 83 a6 0b 00  	lw	a3, 0(s7)
    1498: 09 87        	srai	a4, a4, 2
    149a: 25 43        	li	t1, 9
    149c: 3b 03 e3 02  	<unknown>
    14a0: 29 46        	li	a2, 10
    14a2: 29 47        	li	a4, 10
    14a4: 63 fc e6 16  	bgeu	a3, a4, 0x161c <fmt_fp+0x744>
    14a8: 82 67        	ld	a5, 0(sp)
    14aa: 13 06 70 06  	li	a2, 103
    14ae: 01 47        	li	a4, 0
    14b0: 93 86 a7 f9  	addi	a3, a5, -102
    14b4: b3 36 d0 00  	snez	a3, a3
    14b8: bb 86 66 02  	<unknown>
    14bc: bb 06 d4 40  	subw	a3, s0, a3
    14c0: 63 94 c7 00  	bne	a5, a2, 0x14c8 <fmt_fp+0x5f0>
    14c4: 33 37 80 00  	snez	a4, s0
    14c8: 3b 86 e6 40  	subw	a2, a3, a4
    14cc: 33 07 1d 41  	sub	a4, s10, a7
    14d0: 09 87        	srai	a4, a4, 2
    14d2: 7d 17        	addi	a4, a4, -1
    14d4: a5 45        	li	a1, 9
    14d6: 33 07 b7 02  	<unknown>
    14da: 63 5b e6 1a  	bge	a2, a4, 0x1690 <fmt_fp+0x7b8>
    14de: 37 47 02 00  	lui	a4, 36
    14e2: 31 9f        	addw	a4, a4, a2
    14e4: 25 46        	li	a2, 9
    14e6: 3b 4c c7 02  	<unknown>
    14ea: c1 76        	lui	a3, 1048560
    14ec: 91 06        	addi	a3, a3, 4
    14ee: a9 45        	li	a1, 10
    14f0: 3b 67 c7 02  	<unknown>
    14f4: 0a 0c        	slli	s8, s8, 2
    14f6: 36 9c        	add	s8, s8, a3
    14f8: 46 9c        	add	s8, s8, a7
    14fa: a9 46        	li	a3, 10
    14fc: 25 46        	li	a2, 9
    14fe: 05 27        	addiw	a4, a4, 1
    1500: 63 12 c7 12  	bne	a4, a2, 0x1624 <fmt_fp+0x74c>
    1504: 83 2d 0c 00  	lw	s11, 0(s8)
    1508: 1b 8e 06 00  	sext.w	t3, a3
    150c: 3b f6 dd 02  	<unknown>
    1510: 32 85        	mv	a0, a2
    1512: 09 e6        	bnez	a2, 0x151c <fmt_fp+0x644>
    1514: 13 07 4c 00  	addi	a4, s8, 4
    1518: 63 08 ed 16  	beq	s10, a4, 0x1688 <fmt_fp+0x7b0>
    151c: 3b d7 cd 03  	<unknown>
    1520: 05 8b        	andi	a4, a4, 1
    1522: 09 ef        	bnez	a4, 0x153c <fmt_fp+0x664>
    1524: 37 d7 9a 3b  	lui	a4, 244141
    1528: 13 07 07 a0  	addi	a4, a4, -1536
    152c: 63 90 e6 10  	bne	a3, a4, 0x162c <fmt_fp+0x754>
    1530: 63 fe 8b 0f  	bgeu	s7, s8, 0x162c <fmt_fp+0x754>
    1534: 03 27 cc ff  	lw	a4, -4(s8)
    1538: 05 8b        	andi	a4, a4, 1
    153a: 6d cb        	beqz	a4, 0x162c <fmt_fp+0x754>
    153c: 97 45 00 00  	auipc	a1, 4
    1540: 93 85 45 f6  	addi	a1, a1, -156
    1544: 85 86        	srai	a3, a3, 1
    1546: 98 61        	ld	a4, 0(a1)
    1548: 83 bc 85 00  	ld	s9, 8(a1)
    154c: 63 65 d6 0e  	bltu	a2, a3, 0x1636 <fmt_fp+0x75e>
    1550: 63 96 c6 00  	bne	a3, a2, 0x155c <fmt_fp+0x684>
    1554: 93 06 4c 00  	addi	a3, s8, 4
    1558: 63 0f dd 2a  	beq	s10, a3, 0x1816 <fmt_fp+0x93e>
    155c: 97 46 00 00  	auipc	a3, 4
    1560: 93 86 46 f8  	addi	a3, a3, -124
    1564: e9 a8        	j	0x163e <fmt_fp+0x766>
    1566: 1b 06 03 00  	sext.w	a2, t1
    156a: 63 53 6e 00  	bge	t3, t1, 0x1570 <fmt_fp+0x698>
    156e: 75 46        	li	a2, 29
    1570: 93 05 cd ff  	addi	a1, s10, -4
    1574: 81 46        	li	a3, 0
    1576: 63 ff 75 01  	bgeu	a1, s7, 0x1594 <fmt_fp+0x6bc>
    157a: 81 c6        	beqz	a3, 0x1582 <fmt_fp+0x6aa>
    157c: 23 ae db fe  	sw	a3, -4(s7)
    1580: f1 1b        	addi	s7, s7, -4
    1582: 63 f5 ab 01  	bgeu	s7, s10, 0x158c <fmt_fp+0x6b4>
    1586: 03 27 cd ff  	lw	a4, -4(s10)
    158a: 0d c7        	beqz	a4, 0x15b4 <fmt_fp+0x6dc>
    158c: 3b 03 c3 40  	subw	t1, t1, a2
    1590: 05 47        	li	a4, 1
    1592: 41 bd        	j	0x1422 <fmt_fp+0x54a>
    1594: 03 e7 05 00  	lwu	a4, 0(a1)
    1598: 82 16        	slli	a3, a3, 32
    159a: 81 92        	srli	a3, a3, 32
    159c: 33 17 c7 00  	sll	a4, a4, a2
    15a0: 36 97        	add	a4, a4, a3
    15a2: b3 76 a7 02  	<unknown>
    15a6: f1 15        	addi	a1, a1, -4
    15a8: 33 57 a7 02  	<unknown>
    15ac: d4 c1        	sw	a3, 4(a1)
    15ae: 9b 06 07 00  	sext.w	a3, a4
    15b2: d1 b7        	j	0x1576 <fmt_fp+0x69e>
    15b4: 71 1d        	addi	s10, s10, -4
    15b6: f1 b7        	j	0x1582 <fmt_fp+0x6aa>
    15b8: a5 45        	li	a1, 9
    15ba: 63 44 e6 01  	blt	a2, t5, 0x15c2 <fmt_fp+0x6ea>
    15be: bb 05 c0 40  	negw	a1, a2
    15c2: bb 93 bf 00  	sllw	t2, t6, a1
    15c6: fd 33        	addiw	t2, t2, -1
    15c8: 3b 5c be 40  	sraw	s8, t3, a1
    15cc: de 86        	mv	a3, s7
    15ce: 01 45        	li	a0, 0
    15d0: 63 e9 a6 03  	bltu	a3, s10, 0x1602 <fmt_fp+0x72a>
    15d4: 83 a6 0b 00  	lw	a3, 0(s7)
    15d8: 91 e2        	bnez	a3, 0x15dc <fmt_fp+0x704>
    15da: 91 0b        	addi	s7, s7, 4
    15dc: 01 c5        	beqz	a0, 0x15e4 <fmt_fp+0x70c>
    15de: 23 20 ad 00  	sw	a0, 0(s10)
    15e2: 11 0d        	addi	s10, s10, 4
    15e4: 82 67        	ld	a5, 0(sp)
    15e6: c6 86        	mv	a3, a7
    15e8: 63 83 57 00  	beq	a5, t0, 0x15ee <fmt_fp+0x716>
    15ec: de 86        	mv	a3, s7
    15ee: 33 05 dd 40  	sub	a0, s10, a3
    15f2: 09 85        	srai	a0, a0, 2
    15f4: 63 54 a7 00  	bge	a4, a0, 0x15fc <fmt_fp+0x724>
    15f8: 33 8d d6 01  	add	s10, a3, t4
    15fc: 2d 9e        	addw	a2, a2, a1
    15fe: 85 46        	li	a3, 1
    1600: 8d bd        	j	0x1472 <fmt_fp+0x59a>
    1602: 03 a3 06 00  	lw	t1, 0(a3)
    1606: bb 5c b3 00  	srlw	s9, t1, a1
    160a: 3b 85 ac 00  	addw	a0, s9, a0
    160e: 33 73 73 00  	and	t1, t1, t2
    1612: 88 c2        	sw	a0, 0(a3)
    1614: 3b 05 83 03  	<unknown>
    1618: 91 06        	addi	a3, a3, 4
    161a: 5d bf        	j	0x15d0 <fmt_fp+0x6f8>
    161c: 3b 07 e6 02  	<unknown>
    1620: 05 23        	addiw	t1, t1, 1
    1622: 49 b5        	j	0x14a4 <fmt_fp+0x5cc>
    1624: bb 86 d5 02  	<unknown>
    1628: 05 27        	addiw	a4, a4, 1
    162a: d9 bd        	j	0x1500 <fmt_fp+0x628>
    162c: 97 45 00 00  	auipc	a1, 4
    1630: 93 85 45 e8  	addi	a1, a1, -380
    1634: 01 bf        	j	0x1544 <fmt_fp+0x66c>
    1636: 97 46 00 00  	auipc	a3, 4
    163a: 93 86 a6 e8  	addi	a3, a3, -374
    163e: 90 62        	ld	a2, 0(a3)
    1640: 94 66        	ld	a3, 8(a3)
    1642: 63 0d 0a 00  	beqz	s4, 0x165c <fmt_fp+0x784>
    1646: 83 ce 0a 00  	lbu	t4, 0(s5)
    164a: 93 05 d0 02  	li	a1, 45
    164e: 63 97 be 00  	bne	t4, a1, 0x165c <fmt_fp+0x784>
    1652: fd 55        	li	a1, -1
    1654: fe 15        	slli	a1, a1, 63
    1656: b3 cc bc 00  	xor	s9, s9, a1
    165a: ad 8e        	xor	a3, a3, a1
    165c: bb 8d ad 40  	subw	s11, s11, a0
    1660: e6 85        	mv	a1, s9
    1662: 3a 85        	mv	a0, a4
    1664: 46 f4        	sd	a7, 40(sp)
    1666: 72 ec        	sd	t3, 24(sp)
    1668: 1a f0        	sd	t1, 32(sp)
    166a: 3a e8        	sd	a4, 16(sp)
    166c: ef 10 d0 4d  	jal	0x3348 <__addtf3>
    1670: 42 67        	ld	a4, 16(sp)
    1672: e6 86        	mv	a3, s9
    1674: 3a 86        	mv	a2, a4
    1676: ef 20 e0 6e  	jal	0x3d64 <__netf2>
    167a: 62 6e        	ld	t3, 24(sp)
    167c: a2 78        	ld	a7, 40(sp)
    167e: 63 11 05 1a  	bnez	a0, 0x1820 <fmt_fp+0x948>
    1682: 02 73        	ld	t1, 32(sp)
    1684: 23 20 bc 01  	sw	s11, 0(s8)
    1688: 11 0c        	addi	s8, s8, 4
    168a: 63 73 ac 01  	bgeu	s8, s10, 0x1690 <fmt_fp+0x7b8>
    168e: 62 8d        	mv	s10, s8
    1690: 63 f6 ab 01  	bgeu	s7, s10, 0x169c <fmt_fp+0x7c4>
    1694: 03 27 cd ff  	lw	a4, -4(s10)
    1698: 63 0e 07 1c  	beqz	a4, 0x1874 <fmt_fp+0x99c>
    169c: 82 67        	ld	a5, 0(sp)
    169e: 13 07 70 06  	li	a4, 103
    16a2: 63 9d e7 04  	bne	a5, a4, 0x16fc <fmt_fp+0x824>
    16a6: 11 e0        	bnez	s0, 0x16aa <fmt_fp+0x7d2>
    16a8: 05 44        	li	s0, 1
    16aa: 63 57 83 1c  	bge	t1, s0, 0x1878 <fmt_fp+0x9a0>
    16ae: 71 57        	li	a4, -4
    16b0: 63 44 e3 1c  	blt	t1, a4, 0x1878 <fmt_fp+0x9a0>
    16b4: 1b 07 13 00  	addiw	a4, t1, 1
    16b8: 7d 3b        	addiw	s6, s6, -1
    16ba: 19 9c        	subw	s0, s0, a4
    16bc: 13 f7 89 00  	andi	a4, s3, 8
    16c0: 15 ef        	bnez	a4, 0x16fc <fmt_fp+0x824>
    16c2: a5 46        	li	a3, 9
    16c4: 63 f6 ab 01  	bgeu	s7, s10, 0x16d0 <fmt_fp+0x7f8>
    16c8: 03 26 cd ff  	lw	a2, -4(s10)
    16cc: 63 10 06 1c  	bnez	a2, 0x188c <fmt_fp+0x9b4>
    16d0: 33 07 1d 41  	sub	a4, s10, a7
    16d4: 09 87        	srai	a4, a4, 2
    16d6: 25 46        	li	a2, 9
    16d8: 7d 17        	addi	a4, a4, -1
    16da: 33 07 c7 02  	<unknown>
    16de: 93 05 60 06  	li	a1, 102
    16e2: 13 66 0b 02  	ori	a2, s6, 32
    16e6: 63 17 b6 1a  	bne	a2, a1, 0x1894 <fmt_fp+0x9bc>
    16ea: 15 8f        	sub	a4, a4, a3
    16ec: 63 53 07 00  	bgez	a4, 0x16f2 <fmt_fp+0x81a>
    16f0: 01 47        	li	a4, 0
    16f2: 63 53 e4 00  	bge	s0, a4, 0x16f8 <fmt_fp+0x820>
    16f6: 22 87        	mv	a4, s0
    16f8: 1b 04 07 00  	sext.w	s0, a4
    16fc: 37 07 00 80  	lui	a4, 524288
    1700: 13 47 d7 ff  	xori	a4, a4, -3
    1704: e3 41 87 b4  	blt	a4, s0, 0x1246 <fmt_fp+0x36e>
    1708: 93 fc 89 00  	andi	s9, s3, 8
    170c: 33 6c 94 01  	or	s8, s0, s9
    1710: 9b 87 09 00  	sext.w	a5, s3
    1714: b3 36 80 01  	snez	a3, s8
    1718: 1b 07 14 00  	addiw	a4, s0, 1
    171c: 37 06 00 80  	lui	a2, 524288
    1720: 35 9f        	addw	a4, a4, a3
    1722: 13 46 f6 ff  	not	a2, a2
    1726: 3e e0        	sd	a5, 0(sp)
    1728: 93 6d 0b 02  	ori	s11, s6, 32
    172c: 93 05 60 06  	li	a1, 102
    1730: 19 9e        	subw	a2, a2, a4
    1732: 63 93 bd 16  	bne	s11, a1, 0x1898 <fmt_fp+0x9c0>
    1736: e3 48 66 b0  	blt	a2, t1, 0x1246 <fmt_fp+0x36e>
    173a: 63 54 60 00  	blez	t1, 0x1742 <fmt_fp+0x86a>
    173e: 3b 07 67 00  	addw	a4, a4, t1
    1742: b7 06 00 80  	lui	a3, 524288
    1746: 63 1b 0a 1c  	bnez	s4, 0x191c <fmt_fp+0xa44>
    174a: 93 c6 f6 ff  	not	a3, a3
    174e: 46 ec        	sd	a7, 24(sp)
    1750: 81 26        	sext.w	a3, a3
    1752: e3 ca e6 ae  	blt	a3, a4, 0x1246 <fmt_fp+0x36e>
    1756: 3b 0b 47 01  	addw	s6, a4, s4
    175a: da 86        	mv	a3, s6
    175c: 4e 87        	mv	a4, s3
    175e: 4a 86        	mv	a2, s2
    1760: 93 05 00 02  	li	a1, 32
    1764: 26 85        	mv	a0, s1
    1766: 5a c8        	sw	s6, 16(sp)
    1768: ef f0 6f ef  	jal	0xe5e <pad>
    176c: 52 86        	mv	a2, s4
    176e: d6 85        	mv	a1, s5
    1770: 26 85        	mv	a0, s1
    1772: ef f0 6f ed  	jal	0xe48 <out>
    1776: 82 67        	ld	a5, 0(sp)
    1778: 41 67        	lui	a4, 16
    177a: da 86        	mv	a3, s6
    177c: 3d 8f        	xor	a4, a4, a5
    177e: 4a 86        	mv	a2, s2
    1780: 93 05 00 03  	li	a1, 48
    1784: 26 85        	mv	a0, s1
    1786: ef f0 8f ed  	jal	0xe5e <pad>
    178a: 13 07 60 06  	li	a4, 102
    178e: e2 68        	ld	a7, 24(sp)
    1790: 63 9b ed 24  	bne	s11, a4, 0x19e6 <fmt_fp+0xb0e>
    1794: c6 89        	mv	s3, a7
    1796: 63 f3 1b 01  	bgeu	s7, a7, 0x179c <fmt_fp+0x8c4>
    179a: de 89        	mv	s3, s7
    179c: 79 7a        	lui	s4, 1048574
    179e: 09 67        	lui	a4, 2
    17a0: 93 0b 0a 31  	addi	s7, s4, 784
    17a4: 93 07 07 d1  	addi	a5, a4, -752
    17a8: de 97        	add	a5, a5, s7
    17aa: 94 00        	addi	a3, sp, 64
    17ac: b3 8b d7 00  	add	s7, a5, a3
    17b0: 93 07 07 d1  	addi	a5, a4, -752
    17b4: d2 97        	add	a5, a5, s4
    17b6: ce 8c        	mv	s9, s3
    17b8: 93 8d 9b 00  	addi	s11, s7, 9
    17bc: 93 0a 00 03  	li	s5, 48
    17c0: 33 8a d7 00  	add	s4, a5, a3
    17c4: 63 ff 98 15  	bgeu	a7, s9, 0x1922 <fmt_fp+0xa4a>
    17c8: 93 86 18 00  	addi	a3, a7, 1
    17cc: 13 87 d9 ff  	addi	a4, s3, -3
    17d0: 01 46        	li	a2, 0
    17d2: 63 e7 e6 00  	bltu	a3, a4, 0x17e0 <fmt_fp+0x908>
    17d6: 91 08        	addi	a7, a7, 4
    17d8: b3 88 38 41  	sub	a7, a7, s3
    17dc: 13 f6 c8 ff  	andi	a2, a7, -4
    17e0: b2 99        	add	s3, s3, a2
    17e2: 63 00 0c 20  	beqz	s8, 0x19e2 <fmt_fp+0xb0a>
    17e6: 05 46        	li	a2, 1
    17e8: 97 45 00 00  	auipc	a1, 4
    17ec: 93 85 85 b8  	addi	a1, a1, -1144
    17f0: 26 85        	mv	a0, s1
    17f2: ef f0 6f e5  	jal	0xe48 <out>
    17f6: 79 7a        	lui	s4, 1048574
    17f8: 89 67        	lui	a5, 2
    17fa: 13 0a 0a 31  	addi	s4, s4, 784
    17fe: 93 87 07 d1  	addi	a5, a5, -752
    1802: d2 97        	add	a5, a5, s4
    1804: 98 00        	addi	a4, sp, 64
    1806: 33 8a e7 00  	add	s4, a5, a4
    180a: 93 0a 9a 00  	addi	s5, s4, 9
    180e: 93 0b 00 03  	li	s7, 48
    1812: a5 4c        	li	s9, 9
    1814: 69 a2        	j	0x199e <fmt_fp+0xac6>
    1816: 97 46 00 00  	auipc	a3, 4
    181a: 93 86 a6 cb  	addi	a3, a3, -838
    181e: 05 b5        	j	0x163e <fmt_fp+0x766>
    1820: 3b 0e be 01  	addw	t3, t3, s11
    1824: 37 d7 9a 3b  	lui	a4, 244141
    1828: 23 20 cc 01  	sw	t3, 0(s8)
    182c: 13 07 f7 9f  	addi	a4, a4, -1537
    1830: 83 26 0c 00  	lw	a3, 0(s8)
    1834: 63 62 d7 02  	bltu	a4, a3, 0x1858 <fmt_fp+0x980>
    1838: 33 87 78 41  	sub	a4, a7, s7
    183c: 83 a6 0b 00  	lw	a3, 0(s7)
    1840: 09 87        	srai	a4, a4, 2
    1842: 25 43        	li	t1, 9
    1844: 3b 03 e3 02  	<unknown>
    1848: 29 46        	li	a2, 10
    184a: 29 47        	li	a4, 10
    184c: e3 ee e6 e2  	bltu	a3, a4, 0x1688 <fmt_fp+0x7b0>
    1850: 05 23        	addiw	t1, t1, 1
    1852: 3b 07 e6 02  	<unknown>
    1856: dd bf        	j	0x184c <fmt_fp+0x974>
    1858: 71 1c        	addi	s8, s8, -4
    185a: 23 22 0c 00  	sw	zero, 4(s8)
    185e: 63 75 7c 01  	bgeu	s8, s7, 0x1868 <fmt_fp+0x990>
    1862: 23 ae 0b fe  	sw	zero, -4(s7)
    1866: f1 1b        	addi	s7, s7, -4
    1868: 83 26 0c 00  	lw	a3, 0(s8)
    186c: 85 26        	addiw	a3, a3, 1
    186e: 23 20 dc 00  	sw	a3, 0(s8)
    1872: 7d bf        	j	0x1830 <fmt_fp+0x958>
    1874: 71 1d        	addi	s10, s10, -4
    1876: 29 bd        	j	0x1690 <fmt_fp+0x7b8>
    1878: 79 3b        	addiw	s6, s6, -2
    187a: 7d 34        	addiw	s0, s0, -1
    187c: 81 b5        	j	0x16bc <fmt_fp+0x7e4>
    187e: 3b 07 e5 02  	<unknown>
    1882: 85 26        	addiw	a3, a3, 1
    1884: bb 75 e6 02  	<unknown>
    1888: fd d9        	beqz	a1, 0x187e <fmt_fp+0x9a6>
    188a: 99 b5        	j	0x16d0 <fmt_fp+0x7f8>
    188c: 81 46        	li	a3, 0
    188e: 29 47        	li	a4, 10
    1890: 29 45        	li	a0, 10
    1892: cd bf        	j	0x1884 <fmt_fp+0x9ac>
    1894: 1a 97        	add	a4, a4, t1
    1896: 91 bd        	j	0x16ea <fmt_fp+0x812>
    1898: 3a d4        	sw	a4, 40(sp)
    189a: 09 67        	lui	a4, 2
    189c: f9 77        	lui	a5, 1048574
    189e: 13 07 07 d1  	addi	a4, a4, -752
    18a2: 3e 97        	add	a4, a4, a5
    18a4: 9c 00        	addi	a5, sp, 64
    18a6: ba 97        	add	a5, a5, a4
    18a8: 1b 57 f3 41  	sraiw	a4, t1, 31
    18ac: 93 87 c7 30  	addi	a5, a5, 780
    18b0: 33 45 e3 00  	xor	a0, t1, a4
    18b4: be 85        	mv	a1, a5
    18b6: 19 9d        	subw	a0, a0, a4
    18b8: 32 f0        	sd	a2, 32(sp)
    18ba: 46 ec        	sd	a7, 24(sp)
    18bc: 1a e8        	sd	t1, 16(sp)
    18be: 3e e4        	sd	a5, 8(sp)
    18c0: ef f0 0f d2  	jal	0xde0 <fmt_u>
    18c4: a2 67        	ld	a5, 8(sp)
    18c6: 42 63        	ld	t1, 16(sp)
    18c8: e2 68        	ld	a7, 24(sp)
    18ca: 02 76        	ld	a2, 32(sp)
    18cc: a2 56        	lw	a3, 40(sp)
    18ce: 05 47        	li	a4, 1
    18d0: 13 0e 00 03  	li	t3, 48
    18d4: b3 85 a7 40  	sub	a1, a5, a0
    18d8: 63 5e b7 02  	bge	a4, a1, 0x1914 <fmt_fp+0xa3c>
    18dc: 13 07 d0 02  	li	a4, 45
    18e0: 63 44 03 00  	bltz	t1, 0x18e8 <fmt_fp+0xa10>
    18e4: 13 07 b0 02  	li	a4, 43
    18e8: 93 07 e5 ff  	addi	a5, a0, -2
    18ec: 3e e4        	sd	a5, 8(sp)
    18ee: 89 67        	lui	a5, 2
    18f0: a3 0f e5 fe  	sb	a4, -1(a0)
    18f4: 93 87 07 d1  	addi	a5, a5, -752
    18f8: 79 77        	lui	a4, 1048574
    18fa: ba 97        	add	a5, a5, a4
    18fc: 98 00        	addi	a4, sp, 64
    18fe: 3e 97        	add	a4, a4, a5
    1900: a2 67        	ld	a5, 8(sp)
    1902: 13 07 c7 30  	addi	a4, a4, 780
    1906: 23 0f 65 ff  	sb	s6, -2(a0)
    190a: 1d 8f        	sub	a4, a4, a5
    190c: e3 4d e6 92  	blt	a2, a4, 0x1246 <fmt_fp+0x36e>
    1910: 35 9f        	addw	a4, a4, a3
    1912: 05 bd        	j	0x1742 <fmt_fp+0x86a>
    1914: 7d 15        	addi	a0, a0, -1
    1916: 23 00 c5 01  	sb	t3, 0(a0)
    191a: 6d bf        	j	0x18d4 <fmt_fp+0x9fc>
    191c: 93 c6 e6 ff  	xori	a3, a3, -2
    1920: 3d b5        	j	0x174e <fmt_fp+0x876>
    1922: 03 e5 0c 00  	lwu	a0, 0(s9)
    1926: ee 85        	mv	a1, s11
    1928: 46 e4        	sd	a7, 8(sp)
    192a: ef f0 6f cb  	jal	0xde0 <fmt_u>
    192e: a2 68        	ld	a7, 8(sp)
    1930: aa 85        	mv	a1, a0
    1932: 2a 87        	mv	a4, a0
    1934: 63 9c 3c 01  	bne	s9, s3, 0x194c <fmt_fp+0xa74>
    1938: 63 12 b5 03  	bne	a0, s11, 0x195c <fmt_fp+0xa84>
    193c: 23 0c 5a 31  	sb	s5, 792(s4)
    1940: 93 85 8b 00  	addi	a1, s7, 8
    1944: 21 a8        	j	0x195c <fmt_fp+0xa84>
    1946: 7d 17        	addi	a4, a4, -1
    1948: 23 00 57 01  	sb	s5, 0(a4)
    194c: e3 ed eb fe  	bltu	s7, a4, 0x1946 <fmt_fp+0xa6e>
    1950: 01 47        	li	a4, 0
    1952: 63 e4 75 01  	bltu	a1, s7, 0x195a <fmt_fp+0xa82>
    1956: 33 87 bb 40  	sub	a4, s7, a1
    195a: ba 95        	add	a1, a1, a4
    195c: 33 86 bd 40  	sub	a2, s11, a1
    1960: 26 85        	mv	a0, s1
    1962: 46 e4        	sd	a7, 8(sp)
    1964: ef f0 4f ce  	jal	0xe48 <out>
    1968: a2 68        	ld	a7, 8(sp)
    196a: 91 0c        	addi	s9, s9, 4
    196c: a1 bd        	j	0x17c4 <fmt_fp+0x8ec>
    196e: 03 e5 09 00  	lwu	a0, 0(s3)
    1972: d6 85        	mv	a1, s5
    1974: ef f0 cf c6  	jal	0xde0 <fmt_u>
    1978: 2a 87        	mv	a4, a0
    197a: 63 60 ea 06  	bltu	s4, a4, 0x19da <fmt_fp+0xb02>
    197e: 81 45        	li	a1, 0
    1980: 63 64 45 01  	bltu	a0, s4, 0x1988 <fmt_fp+0xab0>
    1984: b3 05 aa 40  	sub	a1, s4, a0
    1988: 1b 06 04 00  	sext.w	a2, s0
    198c: 63 d3 8c 00  	bge	s9, s0, 0x1992 <fmt_fp+0xaba>
    1990: 25 46        	li	a2, 9
    1992: aa 95        	add	a1, a1, a0
    1994: 26 85        	mv	a0, s1
    1996: ef f0 2f cb  	jal	0xe48 <out>
    199a: 91 09        	addi	s3, s3, 4
    199c: 5d 34        	addiw	s0, s0, -9
    199e: 63 f4 a9 01  	bgeu	s3, s10, 0x19a6 <fmt_fp+0xace>
    19a2: e3 46 80 fc  	bgtz	s0, 0x196e <fmt_fp+0xa96>
    19a6: 01 47        	li	a4, 0
    19a8: a5 46        	li	a3, 9
    19aa: 1b 06 94 00  	addiw	a2, s0, 9
    19ae: 93 05 00 03  	li	a1, 48
    19b2: 26 85        	mv	a0, s1
    19b4: ef f0 af ca  	jal	0xe5e <pad>
    19b8: 82 67        	ld	a5, 0(sp)
    19ba: 09 67        	lui	a4, 2
    19bc: 26 85        	mv	a0, s1
    19be: 3d 8f        	xor	a4, a4, a5
    19c0: da 86        	mv	a3, s6
    19c2: 4a 86        	mv	a2, s2
    19c4: 93 05 00 02  	li	a1, 32
    19c8: ef f0 6f c9  	jal	0xe5e <pad>
    19cc: 42 45        	lw	a0, 16(sp)
    19ce: 63 53 2b 01  	bge	s6, s2, 0x19d4 <fmt_fp+0xafc>
    19d2: 4a 85        	mv	a0, s2
    19d4: 01 25        	sext.w	a0, a0
    19d6: 6f f0 8f df  	j	0xfce <fmt_fp+0xf6>
    19da: 7d 17        	addi	a4, a4, -1
    19dc: 23 00 77 01  	sb	s7, 0(a4)
    19e0: 69 bf        	j	0x197a <fmt_fp+0xaa2>
    19e2: 01 44        	li	s0, 0
    19e4: 09 bd        	j	0x17f6 <fmt_fp+0x91e>
    19e6: 63 e4 ab 01  	bltu	s7, s10, 0x19ee <fmt_fp+0xb16>
    19ea: 13 8d 4b 00  	addi	s10, s7, 4
    19ee: 79 77        	lui	a4, 1048574
    19f0: 89 66        	lui	a3, 2
    19f2: 93 09 07 31  	addi	s3, a4, 784
    19f6: 93 87 06 d1  	addi	a5, a3, -752
    19fa: ce 97        	add	a5, a5, s3
    19fc: 90 00        	addi	a2, sp, 64
    19fe: b3 89 c7 00  	add	s3, a5, a2
    1a02: 93 87 06 d1  	addi	a5, a3, -752
    1a06: ba 97        	add	a5, a5, a4
    1a08: b2 97        	add	a5, a5, a2
    1a0a: 3e ec        	sd	a5, 24(sp)
    1a0c: 93 87 89 00  	addi	a5, s3, 8
    1a10: 5e 8a        	mv	s4, s7
    1a12: 93 8a 99 00  	addi	s5, s3, 9
    1a16: 3e f0        	sd	a5, 32(sp)
    1a18: 63 74 aa 01  	bgeu	s4, s10, 0x1a20 <fmt_fp+0xb48>
    1a1c: 63 5c 04 02  	bgez	s0, 0x1a54 <fmt_fp+0xb7c>
    1a20: 1b 06 24 01  	addiw	a2, s0, 18
    1a24: 26 85        	mv	a0, s1
    1a26: 01 47        	li	a4, 0
    1a28: c9 46        	li	a3, 18
    1a2a: 93 05 00 03  	li	a1, 48
    1a2e: ef f0 0f c3  	jal	0xe5e <pad>
    1a32: 89 67        	lui	a5, 2
    1a34: 79 76        	lui	a2, 1048574
    1a36: 93 87 07 d1  	addi	a5, a5, -752
    1a3a: b2 97        	add	a5, a5, a2
    1a3c: 98 00        	addi	a4, sp, 64
    1a3e: 33 86 e7 00  	add	a2, a5, a4
    1a42: a2 67        	ld	a5, 8(sp)
    1a44: 13 06 c6 30  	addi	a2, a2, 780
    1a48: 26 85        	mv	a0, s1
    1a4a: 1d 8e        	sub	a2, a2, a5
    1a4c: be 85        	mv	a1, a5
    1a4e: ef f0 af bf  	jal	0xe48 <out>
    1a52: 9d b7        	j	0x19b8 <fmt_fp+0xae0>
    1a54: 03 65 0a 00  	lwu	a0, 0(s4)
    1a58: d6 85        	mv	a1, s5
    1a5a: ef f0 6f b8  	jal	0xde0 <fmt_u>
    1a5e: aa 85        	mv	a1, a0
    1a60: 63 18 55 01  	bne	a0, s5, 0x1a70 <fmt_fp+0xb98>
    1a64: e2 67        	ld	a5, 24(sp)
    1a66: 82 75        	ld	a1, 32(sp)
    1a68: 13 07 00 03  	li	a4, 48
    1a6c: 23 8c e7 30  	sb	a4, 792(a5)
    1a70: 9b 0d 04 00  	sext.w	s11, s0
    1a74: 2e 87        	mv	a4, a1
    1a76: 63 19 7a 03  	bne	s4, s7, 0x1aa8 <fmt_fp+0xbd0>
    1a7a: 05 46        	li	a2, 1
    1a7c: 26 85        	mv	a0, s1
    1a7e: 13 8c 15 00  	addi	s8, a1, 1
    1a82: ef f0 6f bc  	jal	0xe48 <out>
    1a86: b3 e6 bc 01  	or	a3, s9, s11
    1a8a: 85 ca        	beqz	a3, 0x1aba <fmt_fp+0xbe2>
    1a8c: 05 46        	li	a2, 1
    1a8e: 97 45 00 00  	auipc	a1, 4
    1a92: 93 85 25 8e  	addi	a1, a1, -1822
    1a96: 26 85        	mv	a0, s1
    1a98: ef f0 0f bb  	jal	0xe48 <out>
    1a9c: 39 a8        	j	0x1aba <fmt_fp+0xbe2>
    1a9e: 7d 17        	addi	a4, a4, -1
    1aa0: 93 07 00 03  	li	a5, 48
    1aa4: 23 00 f7 00  	sb	a5, 0(a4)
    1aa8: e3 eb e9 fe  	bltu	s3, a4, 0x1a9e <fmt_fp+0xbc6>
    1aac: 01 47        	li	a4, 0
    1aae: 63 e4 35 01  	bltu	a1, s3, 0x1ab6 <fmt_fp+0xbde>
    1ab2: 33 87 b9 40  	sub	a4, s3, a1
    1ab6: 33 8c e5 00  	add	s8, a1, a4
    1aba: b3 86 8a 41  	sub	a3, s5, s8
    1abe: 22 86        	mv	a2, s0
    1ac0: 63 d3 86 00  	bge	a3, s0, 0x1ac6 <fmt_fp+0xbee>
    1ac4: 36 86        	mv	a2, a3
    1ac6: e2 85        	mv	a1, s8
    1ac8: 26 85        	mv	a0, s1
    1aca: 36 f4        	sd	a3, 40(sp)
    1acc: ef f0 cf b7  	jal	0xe48 <out>
    1ad0: a2 76        	ld	a3, 40(sp)
    1ad2: 11 0a        	addi	s4, s4, 4
    1ad4: 3b 84 dd 40  	subw	s0, s11, a3
    1ad8: 81 b7        	j	0x1a18 <fmt_fp+0xb40>

0000000000001ada <printf_core>:
    1ada: b7 07 00 80  	lui	a5, 524288
    1ade: 6d 71        	addi	sp, sp, -272
    1ae0: 93 c7 f7 ff  	not	a5, a5
    1ae4: 3e cc        	sw	a5, 24(sp)
    1ae6: cd 67        	lui	a5, 19
    1ae8: 9b 87 97 88  	addiw	a5, a5, -1911
    1aec: 22 e2        	sd	s0, 256(sp)
    1aee: ca f9        	sd	s2, 240(sp)
    1af0: ce f5        	sd	s3, 232(sp)
    1af2: d2 f1        	sd	s4, 224(sp)
    1af4: d6 ed        	sd	s5, 216(sp)
    1af6: de e5        	sd	s7, 200(sp)
    1af8: 6e f5        	sd	s11, 168(sp)
    1afa: 06 e6        	sd	ra, 264(sp)
    1afc: a6 fd        	sd	s1, 248(sp)
    1afe: da e9        	sd	s6, 208(sp)
    1b00: e2 e1        	sd	s8, 192(sp)
    1b02: 66 fd        	sd	s9, 184(sp)
    1b04: 6a f9        	sd	s10, 176(sp)
    1b06: 2a 84        	mv	s0, a0
    1b08: 32 8a        	mv	s4, a2
    1b0a: 36 e0        	sd	a3, 0(sp)
    1b0c: ba 8a        	mv	s5, a4
    1b0e: ae e0        	sd	a1, 64(sp)
    1b10: 81 4d        	li	s11, 0
    1b12: 01 49        	li	s2, 0
    1b14: 81 4b        	li	s7, 0
    1b16: 3e ce        	sw	a5, 28(sp)
    1b18: 97 49 00 00  	auipc	s3, 4
    1b1c: 93 89 09 86  	addi	s3, s3, -1952
    1b20: 06 6d        	ld	s10, 64(sp)
    1b22: 3b 89 2d 01  	addw	s2, s11, s2
    1b26: 4a 8c        	mv	s8, s2
    1b28: 83 47 0d 00  	lbu	a5, 0(s10)
    1b2c: 63 88 07 5e  	beqz	a5, 0x211c <printf_core+0x642>
    1b30: 13 07 50 02  	li	a4, 37
    1b34: 86 6d        	ld	s11, 64(sp)
    1b36: 83 c7 0d 00  	lbu	a5, 0(s11)
    1b3a: 99 c3        	beqz	a5, 0x1b40 <printf_core+0x66>
    1b3c: 63 95 e7 00  	bne	a5, a4, 0x1b46 <printf_core+0x6c>
    1b40: 13 07 50 02  	li	a4, 37
    1b44: 39 a0        	j	0x1b52 <printf_core+0x78>
    1b46: 85 0d        	addi	s11, s11, 1
    1b48: ee e0        	sd	s11, 64(sp)
    1b4a: ed b7        	j	0x1b34 <printf_core+0x5a>
    1b4c: 89 07        	addi	a5, a5, 2
    1b4e: 85 0d        	addi	s11, s11, 1
    1b50: be e0        	sd	a5, 64(sp)
    1b52: 86 67        	ld	a5, 64(sp)
    1b54: 83 c6 07 00  	lbu	a3, 0(a5)
    1b58: 63 96 e6 00  	bne	a3, a4, 0x1b64 <printf_core+0x8a>
    1b5c: 83 c6 17 00  	lbu	a3, 1(a5)
    1b60: e3 86 e6 fe  	beq	a3, a4, 0x1b4c <printf_core+0x72>
    1b64: e2 47        	lw	a5, 24(sp)
    1b66: b3 8d ad 41  	sub	s11, s11, s10
    1b6a: bb 87 87 41  	subw	a5, a5, s8
    1b6e: 3e e4        	sd	a5, 8(sp)
    1b70: 63 c9 b7 55  	blt	a5, s11, 0x20c2 <printf_core+0x5e8>
    1b74: 81 2d        	sext.w	s11, s11
    1b76: 11 c4        	beqz	s0, 0x1b82 <printf_core+0xa8>
    1b78: 6e 86        	mv	a2, s11
    1b7a: ea 85        	mv	a1, s10
    1b7c: 22 85        	mv	a0, s0
    1b7e: ef f0 af ac  	jal	0xe48 <out>
    1b82: 63 9d 0d 52  	bnez	s11, 0x20bc <printf_core+0x5e2>
    1b86: 06 67        	ld	a4, 64(sp)
    1b88: a5 47        	li	a5, 9
    1b8a: 83 46 17 00  	lbu	a3, 1(a4)
    1b8e: 9b 86 06 fd  	addiw	a3, a3, -48
    1b92: 63 ed d7 12  	bltu	a5, a3, 0x1ccc <printf_core+0x1f2>
    1b96: 03 46 27 00  	lbu	a2, 2(a4)
    1b9a: 93 07 40 02  	li	a5, 36
    1b9e: 63 17 f6 12  	bne	a2, a5, 0x1ccc <printf_core+0x1f2>
    1ba2: 0d 07        	addi	a4, a4, 3
    1ba4: 85 4b        	li	s7, 1
    1ba6: 01 4b        	li	s6, 0
    1ba8: 7d 48        	li	a6, 31
    1baa: 05 43        	li	t1, 1
    1bac: ba e0        	sd	a4, 64(sp)
    1bae: 03 45 07 00  	lbu	a0, 0(a4)
    1bb2: 1b 06 05 fe  	addiw	a2, a0, -32
    1bb6: 63 68 c8 00  	bltu	a6, a2, 0x1bc6 <printf_core+0xec>
    1bba: f2 47        	lw	a5, 28(sp)
    1bbc: bb d5 c7 00  	srlw	a1, a5, a2
    1bc0: 85 89        	andi	a1, a1, 1
    1bc2: 63 98 05 10  	bnez	a1, 0x1cd2 <printf_core+0x1f8>
    1bc6: 13 06 a0 02  	li	a2, 42
    1bca: 63 1f c5 12  	bne	a0, a2, 0x1d08 <printf_core+0x22e>
    1bce: 03 46 17 00  	lbu	a2, 1(a4)
    1bd2: a5 45        	li	a1, 9
    1bd4: 1b 05 06 fd  	addiw	a0, a2, -48
    1bd8: 63 e5 a5 10  	bltu	a1, a0, 0x1ce2 <printf_core+0x208>
    1bdc: 03 45 27 00  	lbu	a0, 2(a4)
    1be0: 93 05 40 02  	li	a1, 36
    1be4: 63 1f b5 0e  	bne	a0, a1, 0x1ce2 <printf_core+0x208>
    1be8: 0a 06        	slli	a2, a2, 2
    1bea: 56 96        	add	a2, a2, s5
    1bec: a9 45        	li	a1, 10
    1bee: 23 20 b6 f4  	sw	a1, -192(a2)
    1bf2: 03 46 17 00  	lbu	a2, 1(a4)
    1bf6: 82 67        	ld	a5, 0(sp)
    1bf8: 0d 07        	addi	a4, a4, 3
    1bfa: 12 06        	slli	a2, a2, 4
    1bfc: 3e 96        	add	a2, a2, a5
    1bfe: 83 24 06 d0  	lw	s1, -768(a2)
    1c02: 85 4b        	li	s7, 1
    1c04: ba e0        	sd	a4, 64(sp)
    1c06: 63 d7 04 00  	bgez	s1, 0x1c14 <printf_core+0x13a>
    1c0a: 09 67        	lui	a4, 2
    1c0c: 33 6b eb 00  	or	s6, s6, a4
    1c10: bb 04 90 40  	negw	s1, s1
    1c14: 06 67        	ld	a4, 64(sp)
    1c16: 13 06 e0 02  	li	a2, 46
    1c1a: 83 45 07 00  	lbu	a1, 0(a4)
    1c1e: 63 96 c5 12  	bne	a1, a2, 0x1d4a <printf_core+0x270>
    1c22: 83 45 17 00  	lbu	a1, 1(a4)
    1c26: 13 06 a0 02  	li	a2, 42
    1c2a: 63 96 c5 10  	bne	a1, a2, 0x1d36 <printf_core+0x25c>
    1c2e: 03 46 27 00  	lbu	a2, 2(a4)
    1c32: a5 45        	li	a1, 9
    1c34: 1b 05 06 fd  	addiw	a0, a2, -48
    1c38: 63 e1 a5 0e  	bltu	a1, a0, 0x1d1a <printf_core+0x240>
    1c3c: 03 45 37 00  	lbu	a0, 3(a4)
    1c40: 93 05 40 02  	li	a1, 36
    1c44: 63 1b b5 0c  	bne	a0, a1, 0x1d1a <printf_core+0x240>
    1c48: 0a 06        	slli	a2, a2, 2
    1c4a: 56 96        	add	a2, a2, s5
    1c4c: a9 45        	li	a1, 10
    1c4e: 23 20 b6 f4  	sw	a1, -192(a2)
    1c52: 03 46 27 00  	lbu	a2, 2(a4)
    1c56: 82 67        	ld	a5, 0(sp)
    1c58: 11 07        	addi	a4, a4, 4
    1c5a: 12 06        	slli	a2, a2, 4
    1c5c: 3e 96        	add	a2, a2, a5
    1c5e: 83 2c 06 d0  	lw	s9, -768(a2)
    1c62: 13 ce fc ff  	not	t3, s9
    1c66: ba e0        	sd	a4, 64(sp)
    1c68: 1b 5e fe 01  	srliw	t3, t3, 31
    1c6c: 01 47        	li	a4, 0
    1c6e: 93 0e 90 03  	li	t4, 57
    1c72: 13 03 a0 03  	li	t1, 58
    1c76: 1d 45        	li	a0, 7
    1c78: 06 68        	ld	a6, 64(sp)
    1c7a: 03 46 08 00  	lbu	a2, 0(a6)
    1c7e: 1b 06 f6 fb  	addiw	a2, a2, -65
    1c82: 63 e2 ce 06  	bltu	t4, a2, 0x1ce6 <printf_core+0x20c>
    1c86: 13 06 18 00  	addi	a2, a6, 1
    1c8a: b2 e0        	sd	a2, 64(sp)
    1c8c: 13 16 07 02  	slli	a2, a4, 32
    1c90: 01 92        	srli	a2, a2, 32
    1c92: 33 06 66 02  	<unknown>
    1c96: 83 45 08 00  	lbu	a1, 0(a6)
    1c9a: 97 47 00 00  	auipc	a5, 4
    1c9e: 93 87 67 87  	addi	a5, a5, -1930
    1ca2: 9b 85 f5 fb  	addiw	a1, a1, -65
    1ca6: 3e 96        	add	a2, a2, a5
    1ca8: 2e 96        	add	a2, a2, a1
    1caa: 03 4f 06 00  	lbu	t5, 0(a2)
    1cae: 1b 06 ff ff  	addiw	a2, t5, -1
    1cb2: 9b 05 0f 00  	sext.w	a1, t5
    1cb6: 63 7d c5 08  	bgeu	a0, a2, 0x1d50 <printf_core+0x276>
    1cba: 95 c5        	beqz	a1, 0x1ce6 <printf_core+0x20c>
    1cbc: 6d 46        	li	a2, 27
    1cbe: 63 9b c5 08  	bne	a1, a2, 0x1d54 <printf_core+0x27a>
    1cc2: 7d 56        	li	a2, -1
    1cc4: 63 91 c6 02  	bne	a3, a2, 0x1ce6 <printf_core+0x20c>
    1cc8: 75 e0        	bnez	s0, 0x1dac <printf_core+0x2d2>
    1cca: 99 bd        	j	0x1b20 <printf_core+0x46>
    1ccc: 05 07        	addi	a4, a4, 1
    1cce: fd 56        	li	a3, -1
    1cd0: d9 bd        	j	0x1ba6 <printf_core+0xcc>
    1cd2: 3b 16 c3 00  	sllw	a2, t1, a2
    1cd6: 33 66 cb 00  	or	a2, s6, a2
    1cda: 1b 0b 06 00  	sext.w	s6, a2
    1cde: 05 07        	addi	a4, a4, 1
    1ce0: f1 b5        	j	0x1bac <printf_core+0xd2>
    1ce2: 63 88 0b 00  	beqz	s7, 0x1cf2 <printf_core+0x218>
    1ce6: ef 00 50 66  	jal	0x2b4a <__errno_location>
    1cea: d9 47        	li	a5, 22
    1cec: 1c c1        	sw	a5, 0(a0)
    1cee: 7d 59        	li	s2, -1
    1cf0: 61 a0        	j	0x1d78 <printf_core+0x29e>
    1cf2: 81 44        	li	s1, 0
    1cf4: 01 c8        	beqz	s0, 0x1d04 <printf_core+0x22a>
    1cf6: 03 36 0a 00  	ld	a2, 0(s4)
    1cfa: 04 42        	lw	s1, 0(a2)
    1cfc: 93 05 86 00  	addi	a1, a2, 8
    1d00: 23 30 ba 00  	sd	a1, 0(s4)
    1d04: 05 07        	addi	a4, a4, 1
    1d06: fd bd        	j	0x1c04 <printf_core+0x12a>
    1d08: 88 00        	addi	a0, sp, 64
    1d0a: 36 e8        	sd	a3, 16(sp)
    1d0c: ef f0 2f 8f  	jal	0xdfe <getint>
    1d10: c2 66        	ld	a3, 16(sp)
    1d12: aa 84        	mv	s1, a0
    1d14: e3 50 05 f0  	bgez	a0, 0x1c14 <printf_core+0x13a>
    1d18: 6d a6        	j	0x20c2 <printf_core+0x5e8>
    1d1a: e3 96 0b fc  	bnez	s7, 0x1ce6 <printf_core+0x20c>
    1d1e: 81 4c        	li	s9, 0
    1d20: 09 c8        	beqz	s0, 0x1d32 <printf_core+0x258>
    1d22: 03 36 0a 00  	ld	a2, 0(s4)
    1d26: 83 2c 06 00  	lw	s9, 0(a2)
    1d2a: 93 05 86 00  	addi	a1, a2, 8
    1d2e: 23 30 ba 00  	sd	a1, 0(s4)
    1d32: 09 07        	addi	a4, a4, 2
    1d34: 3d b7        	j	0x1c62 <printf_core+0x188>
    1d36: 05 07        	addi	a4, a4, 1
    1d38: 88 00        	addi	a0, sp, 64
    1d3a: 36 e8        	sd	a3, 16(sp)
    1d3c: ba e0        	sd	a4, 64(sp)
    1d3e: ef f0 0f 8c  	jal	0xdfe <getint>
    1d42: c2 66        	ld	a3, 16(sp)
    1d44: aa 8c        	mv	s9, a0
    1d46: 05 4e        	li	t3, 1
    1d48: 15 b7        	j	0x1c6c <printf_core+0x192>
    1d4a: 01 4e        	li	t3, 0
    1d4c: fd 5c        	li	s9, -1
    1d4e: 39 bf        	j	0x1c6c <printf_core+0x192>
    1d50: 2e 87        	mv	a4, a1
    1d52: 1d b7        	j	0x1c78 <printf_core+0x19e>
    1d54: 7d 56        	li	a2, -1
    1d56: 63 8f c6 00  	beq	a3, a2, 0x1d74 <printf_core+0x29a>
    1d5a: 82 67        	ld	a5, 0(sp)
    1d5c: 13 96 26 00  	slli	a2, a3, 2
    1d60: 92 06        	slli	a3, a3, 4
    1d62: 56 96        	add	a2, a2, s5
    1d64: be 96        	add	a3, a3, a5
    1d66: 23 20 e6 01  	sw	t5, 0(a2)
    1d6a: 90 62        	ld	a2, 0(a3)
    1d6c: 94 66        	ld	a3, 8(a3)
    1d6e: b2 e8        	sd	a2, 80(sp)
    1d70: b6 ec        	sd	a3, 88(sp)
    1d72: 99 bf        	j	0x1cc8 <printf_core+0x1ee>
    1d74: 15 e0        	bnez	s0, 0x1d98 <printf_core+0x2be>
    1d76: 01 49        	li	s2, 0
    1d78: b2 60        	ld	ra, 264(sp)
    1d7a: 12 64        	ld	s0, 256(sp)
    1d7c: ee 74        	ld	s1, 248(sp)
    1d7e: ae 79        	ld	s3, 232(sp)
    1d80: 0e 7a        	ld	s4, 224(sp)
    1d82: ee 6a        	ld	s5, 216(sp)
    1d84: 4e 6b        	ld	s6, 208(sp)
    1d86: ae 6b        	ld	s7, 200(sp)
    1d88: 0e 6c        	ld	s8, 192(sp)
    1d8a: ea 7c        	ld	s9, 184(sp)
    1d8c: 4a 7d        	ld	s10, 176(sp)
    1d8e: aa 7d        	ld	s11, 168(sp)
    1d90: 4a 85        	mv	a0, s2
    1d92: 4e 79        	ld	s2, 240(sp)
    1d94: 51 61        	addi	sp, sp, 272
    1d96: 82 80        	ret
    1d98: 52 86        	mv	a2, s4
    1d9a: 88 08        	addi	a0, sp, 80
    1d9c: 3a f4        	sd	a4, 40(sp)
    1d9e: 72 f0        	sd	t3, 32(sp)
    1da0: 42 e8        	sd	a6, 16(sp)
    1da2: ef e0 1f f9  	jal	0xd32 <pop_arg>
    1da6: 42 68        	ld	a6, 16(sp)
    1da8: 02 7e        	ld	t3, 32(sp)
    1daa: 22 77        	ld	a4, 40(sp)
    1dac: 83 46 08 00  	lbu	a3, 0(a6)
    1db0: 1b 88 06 00  	sext.w	a6, a3
    1db4: 19 c7        	beqz	a4, 0x1dc2 <printf_core+0x2e8>
    1db6: bd 8a        	andi	a3, a3, 15
    1db8: 0d 46        	li	a2, 3
    1dba: 63 94 c6 00  	bne	a3, a2, 0x1dc2 <printf_core+0x2e8>
    1dbe: 13 78 f8 0d  	andi	a6, a6, 223
    1dc2: 93 56 db 00  	srli	a3, s6, 13
    1dc6: 85 8a        	andi	a3, a3, 1
    1dc8: 89 c6        	beqz	a3, 0x1dd2 <printf_core+0x2f8>
    1dca: c1 76        	lui	a3, 1048560
    1dcc: fd 16        	addi	a3, a3, -1
    1dce: 33 7b db 00  	and	s6, s6, a3
    1dd2: 9b 06 f8 fb  	addiw	a3, a6, -65
    1dd6: 9b 85 06 00  	sext.w	a1, a3
    1dda: 13 06 70 03  	li	a2, 55
    1dde: 63 69 b6 32  	bltu	a2, a1, 0x2110 <printf_core+0x636>
    1de2: 13 96 06 02  	slli	a2, a3, 32
    1de6: 93 56 e6 01  	srli	a3, a2, 30
    1dea: 17 36 00 00  	auipc	a2, 3
    1dee: 13 06 66 5a  	addi	a2, a2, 1446
    1df2: b2 96        	add	a3, a3, a2
    1df4: 94 42        	lw	a3, 0(a3)
    1df6: b2 96        	add	a3, a3, a2
    1df8: 82 86        	jr	a3
    1dfa: 9d 47        	li	a5, 7
    1dfc: 63 e0 e7 2c  	bltu	a5, a4, 0x20bc <printf_core+0x5e2>
    1e00: 97 36 00 00  	auipc	a3, 3
    1e04: 93 86 06 67  	addi	a3, a3, 1648
    1e08: 0a 07        	slli	a4, a4, 2
    1e0a: 36 97        	add	a4, a4, a3
    1e0c: 1c 43        	lw	a5, 0(a4)
    1e0e: b6 97        	add	a5, a5, a3
    1e10: 82 87        	jr	a5
    1e12: c6 67        	ld	a5, 80(sp)
    1e14: 23 a0 87 01  	sw	s8, 0(a5)
    1e18: 21 b3        	j	0x1b20 <printf_core+0x46>
    1e1a: c6 67        	ld	a5, 80(sp)
    1e1c: 23 90 27 01  	sh	s2, 0(a5)
    1e20: 01 b3        	j	0x1b20 <printf_core+0x46>
    1e22: c6 67        	ld	a5, 80(sp)
    1e24: 23 80 27 01  	sb	s2, 0(a5)
    1e28: e5 b9        	j	0x1b20 <printf_core+0x46>
    1e2a: c6 67        	ld	a5, 80(sp)
    1e2c: 23 b0 27 01  	sd	s2, 0(a5)
    1e30: c5 b9        	j	0x1b20 <printf_core+0x46>
    1e32: 66 87        	mv	a4, s9
    1e34: c1 46        	li	a3, 16
    1e36: 81 2c        	sext.w	s9, s9
    1e38: 63 f3 dc 00  	bgeu	s9, a3, 0x1e3e <printf_core+0x364>
    1e3c: 41 47        	li	a4, 16
    1e3e: 9b 0c 07 00  	sext.w	s9, a4
    1e42: 13 6b 8b 00  	ori	s6, s6, 8
    1e46: 13 08 80 07  	li	a6, 120
    1e4a: 46 66        	ld	a2, 80(sp)
    1e4c: 93 75 08 02  	andi	a1, a6, 32
    1e50: 13 0d f1 09  	addi	s10, sp, 159
    1e54: 32 87        	mv	a4, a2
    1e56: 17 45 00 00  	auipc	a0, 4
    1e5a: 13 05 a5 88  	addi	a0, a0, -1910
    1e5e: 79 ef        	bnez	a4, 0x1f3c <printf_core+0x462>
    1e60: 4e 83        	mv	t1, s3
    1e62: 09 ca        	beqz	a2, 0x1e74 <printf_core+0x39a>
    1e64: 13 77 8b 00  	andi	a4, s6, 8
    1e68: 11 c7        	beqz	a4, 0x1e74 <printf_core+0x39a>
    1e6a: 13 58 48 00  	srli	a6, a6, 4
    1e6e: 33 83 09 01  	add	t1, s3, a6
    1e72: 89 4d        	li	s11, 2
    1e74: 63 08 0e 00  	beqz	t3, 0x1e84 <printf_core+0x3aa>
    1e78: 63 c5 0c 24  	bltz	s9, 0x20c2 <printf_core+0x5e8>
    1e7c: 41 77        	lui	a4, 1048560
    1e7e: 7d 17        	addi	a4, a4, -1
    1e80: 33 7b eb 00  	and	s6, s6, a4
    1e84: c6 66        	ld	a3, 80(sp)
    1e86: 13 06 f1 09  	addi	a2, sp, 159
    1e8a: 99 e2        	bnez	a3, 0x1e90 <printf_core+0x3b6>
    1e8c: 63 86 0c 28  	beqz	s9, 0x2118 <printf_core+0x63e>
    1e90: 33 07 a6 41  	sub	a4, a2, s10
    1e94: 93 b6 16 00  	seqz	a3, a3
    1e98: 36 97        	add	a4, a4, a3
    1e9a: 63 53 97 01  	bge	a4, s9, 0x1ea0 <printf_core+0x3c6>
    1e9e: 66 87        	mv	a4, s9
    1ea0: 9b 0c 07 00  	sext.w	s9, a4
    1ea4: 33 0c a6 41  	sub	s8, a2, s10
    1ea8: 63 d4 8c 01  	bge	s9, s8, 0x1eb0 <printf_core+0x3d6>
    1eac: 9b 0c 0c 00  	sext.w	s9, s8
    1eb0: e2 47        	lw	a5, 24(sp)
    1eb2: 3b 87 b7 41  	subw	a4, a5, s11
    1eb6: 63 46 97 21  	blt	a4, s9, 0x20c2 <printf_core+0x5e8>
    1eba: bb 87 bc 01  	addw	a5, s9, s11
    1ebe: 3e 87        	mv	a4, a5
    1ec0: 63 d3 97 00  	bge	a5, s1, 0x1ec6 <printf_core+0x3ec>
    1ec4: 26 87        	mv	a4, s1
    1ec6: 9b 04 07 00  	sext.w	s1, a4
    1eca: 22 67        	ld	a4, 8(sp)
    1ecc: 1a e8        	sd	t1, 16(sp)
    1ece: 63 4a 97 1e  	blt	a4, s1, 0x20c2 <printf_core+0x5e8>
    1ed2: be 86        	mv	a3, a5
    1ed4: 5a 87        	mv	a4, s6
    1ed6: 26 86        	mv	a2, s1
    1ed8: 93 05 00 02  	li	a1, 32
    1edc: 22 85        	mv	a0, s0
    1ede: 3e e4        	sd	a5, 8(sp)
    1ee0: ef e0 ff f7  	jal	0xe5e <pad>
    1ee4: 42 63        	ld	t1, 16(sp)
    1ee6: 6e 86        	mv	a2, s11
    1ee8: 22 85        	mv	a0, s0
    1eea: 9a 85        	mv	a1, t1
    1eec: ef e0 df f5  	jal	0xe48 <out>
    1ef0: a2 67        	ld	a5, 8(sp)
    1ef2: 41 67        	lui	a4, 16
    1ef4: 33 47 eb 00  	xor	a4, s6, a4
    1ef8: be 86        	mv	a3, a5
    1efa: 26 86        	mv	a2, s1
    1efc: 93 05 00 03  	li	a1, 48
    1f00: 22 85        	mv	a0, s0
    1f02: ef e0 df f5  	jal	0xe5e <pad>
    1f06: 01 47        	li	a4, 0
    1f08: 9b 06 0c 00  	sext.w	a3, s8
    1f0c: 66 86        	mv	a2, s9
    1f0e: 93 05 00 03  	li	a1, 48
    1f12: 22 85        	mv	a0, s0
    1f14: ef e0 bf f4  	jal	0xe5e <pad>
    1f18: 62 86        	mv	a2, s8
    1f1a: ea 85        	mv	a1, s10
    1f1c: 22 85        	mv	a0, s0
    1f1e: ef e0 bf f2  	jal	0xe48 <out>
    1f22: a2 67        	ld	a5, 8(sp)
    1f24: 09 67        	lui	a4, 2
    1f26: 33 47 eb 00  	xor	a4, s6, a4
    1f2a: be 86        	mv	a3, a5
    1f2c: 26 86        	mv	a2, s1
    1f2e: 93 05 00 02  	li	a1, 32
    1f32: 22 85        	mv	a0, s0
    1f34: ef e0 bf f2  	jal	0xe5e <pad>
    1f38: a6 8d        	mv	s11, s1
    1f3a: dd b6        	j	0x1b20 <printf_core+0x46>
    1f3c: 93 76 f7 00  	andi	a3, a4, 15
    1f40: aa 96        	add	a3, a3, a0
    1f42: 83 c6 06 00  	lbu	a3, 0(a3)
    1f46: 7d 1d        	addi	s10, s10, -1
    1f48: 11 83        	srli	a4, a4, 4
    1f4a: cd 8e        	or	a3, a3, a1
    1f4c: 23 00 dd 00  	sb	a3, 0(s10)
    1f50: 39 b7        	j	0x1e5e <printf_core+0x384>
    1f52: c6 66        	ld	a3, 80(sp)
    1f54: 13 0d f1 09  	addi	s10, sp, 159
    1f58: 6a 87        	mv	a4, s10
    1f5a: 89 ee        	bnez	a3, 0x1f74 <printf_core+0x49a>
    1f5c: 93 76 8b 00  	andi	a3, s6, 8
    1f60: 4e 83        	mv	t1, s3
    1f62: e3 89 06 f0  	beqz	a3, 0x1e74 <printf_core+0x39a>
    1f66: 33 07 a7 41  	sub	a4, a4, s10
    1f6a: e3 45 97 f1  	blt	a4, s9, 0x1e74 <printf_core+0x39a>
    1f6e: 9b 0c 17 00  	addiw	s9, a4, 1
    1f72: 09 b7        	j	0x1e74 <printf_core+0x39a>
    1f74: 13 f6 76 00  	andi	a2, a3, 7
    1f78: 7d 1d        	addi	s10, s10, -1
    1f7a: 1b 06 06 03  	addiw	a2, a2, 48
    1f7e: 23 00 cd 00  	sb	a2, 0(s10)
    1f82: 8d 82        	srli	a3, a3, 3
    1f84: d9 bf        	j	0x1f5a <printf_core+0x480>
    1f86: 46 67        	ld	a4, 80(sp)
    1f88: 63 52 07 02  	bgez	a4, 0x1fac <printf_core+0x4d2>
    1f8c: 33 07 e0 40  	neg	a4, a4
    1f90: ba e8        	sd	a4, 80(sp)
    1f92: 85 4d        	li	s11, 1
    1f94: 4e 83        	mv	t1, s3
    1f96: 46 65        	ld	a0, 80(sp)
    1f98: 93 05 f1 09  	addi	a1, sp, 159
    1f9c: 1a f0        	sd	t1, 32(sp)
    1f9e: 72 e8        	sd	t3, 16(sp)
    1fa0: ef e0 1f e4  	jal	0xde0 <fmt_u>
    1fa4: 02 73        	ld	t1, 32(sp)
    1fa6: 42 6e        	ld	t3, 16(sp)
    1fa8: 2a 8d        	mv	s10, a0
    1faa: e9 b5        	j	0x1e74 <printf_core+0x39a>
    1fac: 13 57 bb 00  	srli	a4, s6, 11
    1fb0: 05 8b        	andi	a4, a4, 1
    1fb2: 11 eb        	bnez	a4, 0x1fc6 <printf_core+0x4ec>
    1fb4: 13 77 1b 00  	andi	a4, s6, 1
    1fb8: 71 df        	beqz	a4, 0x1f94 <printf_core+0x4ba>
    1fba: 85 4d        	li	s11, 1
    1fbc: 17 33 00 00  	auipc	t1, 3
    1fc0: 13 03 e3 3b  	addi	t1, t1, 958
    1fc4: c9 bf        	j	0x1f96 <printf_core+0x4bc>
    1fc6: 85 4d        	li	s11, 1
    1fc8: 17 33 00 00  	auipc	t1, 3
    1fcc: 13 03 13 3b  	addi	t1, t1, 945
    1fd0: d9 b7        	j	0x1f96 <printf_core+0x4bc>
    1fd2: 46 67        	ld	a4, 80(sp)
    1fd4: 4e 83        	mv	t1, s3
    1fd6: 85 4c        	li	s9, 1
    1fd8: 23 0f e1 08  	sb	a4, 158(sp)
    1fdc: 41 77        	lui	a4, 1048560
    1fde: 7d 17        	addi	a4, a4, -1
    1fe0: 33 7b eb 00  	and	s6, s6, a4
    1fe4: 13 06 f1 09  	addi	a2, sp, 159
    1fe8: 13 0d e1 09  	addi	s10, sp, 158
    1fec: 65 bd        	j	0x1ea4 <printf_core+0x3ca>
    1fee: ef 00 d0 35  	jal	0x2b4a <__errno_location>
    1ff2: 08 41        	lw	a0, 0(a0)
    1ff4: ef 00 70 38  	jal	0x2b7a <strerror>
    1ff8: 2a 8d        	mv	s10, a0
    1ffa: e6 85        	mv	a1, s9
    1ffc: 63 d6 0c 00  	bgez	s9, 0x2008 <printf_core+0x52e>
    2000: b7 05 00 80  	lui	a1, 524288
    2004: 93 c5 f5 ff  	not	a1, a1
    2008: 6a 85        	mv	a0, s10
    200a: ef 00 00 78  	jal	0x278a <strnlen>
    200e: 33 06 ad 00  	add	a2, s10, a0
    2012: 63 d5 0c 00  	bgez	s9, 0x201c <printf_core+0x542>
    2016: 03 47 06 00  	lbu	a4, 0(a2)
    201a: 45 e7        	bnez	a4, 0x20c2 <printf_core+0x5e8>
    201c: 41 77        	lui	a4, 1048560
    201e: 7d 17        	addi	a4, a4, -1
    2020: 9b 0c 05 00  	sext.w	s9, a0
    2024: 33 7b eb 00  	and	s6, s6, a4
    2028: 4e 83        	mv	t1, s3
    202a: ad bd        	j	0x1ea4 <printf_core+0x3ca>
    202c: 46 6d        	ld	s10, 80(sp)
    202e: e3 16 0d fc  	bnez	s10, 0x1ffa <printf_core+0x520>
    2032: 17 3d 00 00  	auipc	s10, 3
    2036: 13 0d 6d 35  	addi	s10, s10, 854
    203a: c1 b7        	j	0x1ffa <printf_core+0x520>
    203c: 46 67        	ld	a4, 80(sp)
    203e: 82 c6        	sw	zero, 76(sp)
    2040: fd 5c        	li	s9, -1
    2042: ba c4        	sw	a4, 72(sp)
    2044: b8 00        	addi	a4, sp, 72
    2046: ba e8        	sd	a4, 80(sp)
    2048: 46 6c        	ld	s8, 80(sp)
    204a: 01 4d        	li	s10, 0
    204c: 34 18        	addi	a3, sp, 56
    204e: e2 8d        	mv	s11, s8
    2050: 63 71 9d 03  	bgeu	s10, s9, 0x2072 <printf_core+0x598>
    2054: 83 a5 0d 00  	lw	a1, 0(s11)
    2058: 89 cd        	beqz	a1, 0x2072 <printf_core+0x598>
    205a: 36 85        	mv	a0, a3
    205c: 91 0d        	addi	s11, s11, 4
    205e: 36 e8        	sd	a3, 16(sp)
    2060: ef 00 50 42  	jal	0x2c84 <wctomb>
    2064: e3 45 05 c8  	bltz	a0, 0x1cee <printf_core+0x214>
    2068: 33 87 ac 41  	sub	a4, s9, s10
    206c: c2 66        	ld	a3, 16(sp)
    206e: 63 7f a7 04  	bgeu	a4, a0, 0x20cc <printf_core+0x5f2>
    2072: 37 07 00 80  	lui	a4, 524288
    2076: 13 47 f7 ff  	not	a4, a4
    207a: 63 64 a7 05  	bltu	a4, s10, 0x20c2 <printf_core+0x5e8>
    207e: 9b 0c 0d 00  	sext.w	s9, s10
    2082: 5a 87        	mv	a4, s6
    2084: e6 86        	mv	a3, s9
    2086: 26 86        	mv	a2, s1
    2088: 93 05 00 02  	li	a1, 32
    208c: 22 85        	mv	a0, s0
    208e: ef e0 1f dd  	jal	0xe5e <pad>
    2092: 3c 18        	addi	a5, sp, 56
    2094: 81 4d        	li	s11, 0
    2096: 3e e8        	sd	a5, 16(sp)
    2098: 63 ec ad 03  	bltu	s11, s10, 0x20d0 <printf_core+0x5f6>
    209c: 09 67        	lui	a4, 2
    209e: 33 47 eb 00  	xor	a4, s6, a4
    20a2: e6 86        	mv	a3, s9
    20a4: 26 86        	mv	a2, s1
    20a6: 93 05 00 02  	li	a1, 32
    20aa: 22 85        	mv	a0, s0
    20ac: ef e0 3f db  	jal	0xe5e <pad>
    20b0: 9b 8d 04 00  	sext.w	s11, s1
    20b4: 63 d4 94 01  	bge	s1, s9, 0x20bc <printf_core+0x5e2>
    20b8: 9b 8d 0c 00  	sext.w	s11, s9
    20bc: a2 67        	ld	a5, 8(sp)
    20be: e3 d1 b7 a7  	bge	a5, s11, 0x1b20 <printf_core+0x46>
    20c2: ef 00 90 28  	jal	0x2b4a <__errno_location>
    20c6: 93 07 b0 04  	li	a5, 75
    20ca: 0d b1        	j	0x1cec <printf_core+0x212>
    20cc: 2a 9d        	add	s10, s10, a0
    20ce: 49 b7        	j	0x2050 <printf_core+0x576>
    20d0: 83 25 0c 00  	lw	a1, 0(s8)
    20d4: e1 d5        	beqz	a1, 0x209c <printf_core+0x5c2>
    20d6: 42 65        	ld	a0, 16(sp)
    20d8: 11 0c        	addi	s8, s8, 4
    20da: ef 00 b0 3a  	jal	0x2c84 <wctomb>
    20de: aa 9d        	add	s11, s11, a0
    20e0: 2a 86        	mv	a2, a0
    20e2: e3 6d bd fb  	bltu	s10, s11, 0x209c <printf_core+0x5c2>
    20e6: c2 65        	ld	a1, 16(sp)
    20e8: 22 85        	mv	a0, s0
    20ea: ef e0 ff d5  	jal	0xe48 <out>
    20ee: 6d b7        	j	0x2098 <printf_core+0x5be>
    20f0: 63 04 0e 00  	beqz	t3, 0x20f8 <printf_core+0x61e>
    20f4: e3 c7 0c fc  	bltz	s9, 0x20c2 <printf_core+0x5e8>
    20f8: c6 65        	ld	a1, 80(sp)
    20fa: 66 66        	ld	a2, 88(sp)
    20fc: da 87        	mv	a5, s6
    20fe: 66 87        	mv	a4, s9
    2100: a6 86        	mv	a3, s1
    2102: 22 85        	mv	a0, s0
    2104: ef e0 5f dd  	jal	0xed8 <fmt_fp>
    2108: aa 8d        	mv	s11, a0
    210a: e3 59 05 fa  	bgez	a0, 0x20bc <printf_core+0x5e2>
    210e: 55 bf        	j	0x20c2 <printf_core+0x5e8>
    2110: 4e 83        	mv	t1, s3
    2112: 13 06 f1 09  	addi	a2, sp, 159
    2116: 79 b3        	j	0x1ea4 <printf_core+0x3ca>
    2118: 32 8d        	mv	s10, a2
    211a: 69 b3        	j	0x1ea4 <printf_core+0x3ca>
    211c: e3 1e 04 c4  	bnez	s0, 0x1d78 <printf_core+0x29e>
    2120: e3 8b 0b c4  	beqz	s7, 0x1d76 <printf_core+0x29c>
    2124: 05 44        	li	s0, 1
    2126: a9 44        	li	s1, 10
    2128: 93 17 24 00  	slli	a5, s0, 2
    212c: d6 97        	add	a5, a5, s5
    212e: 8c 43        	lw	a1, 0(a5)
    2130: 81 ed        	bnez	a1, 0x2148 <printf_core+0x66e>
    2132: 29 47        	li	a4, 10
    2134: 93 17 24 00  	slli	a5, s0, 2
    2138: d6 97        	add	a5, a5, s5
    213a: 9c 43        	lw	a5, 0(a5)
    213c: e3 95 07 ba  	bnez	a5, 0x1ce6 <printf_core+0x20c>
    2140: 05 04        	addi	s0, s0, 1
    2142: e3 19 e4 fe  	bne	s0, a4, 0x2134 <printf_core+0x65a>
    2146: 19 a8        	j	0x215c <printf_core+0x682>
    2148: 82 67        	ld	a5, 0(sp)
    214a: 13 15 44 00  	slli	a0, s0, 4
    214e: 52 86        	mv	a2, s4
    2150: 3e 95        	add	a0, a0, a5
    2152: 05 04        	addi	s0, s0, 1
    2154: ef e0 ff bd  	jal	0xd32 <pop_arg>
    2158: e3 18 94 fc  	bne	s0, s1, 0x2128 <printf_core+0x64e>
    215c: 05 49        	li	s2, 1
    215e: 29 b9        	j	0x1d78 <printf_core+0x29e>

0000000000002160 <vfprintf>:
    2160: 49 71        	addi	sp, sp, -368
    2162: 5a fa        	sd	s6, 304(sp)
    2164: 5e f6        	sd	s7, 296(sp)
    2166: 62 f2        	sd	s8, 288(sp)
    2168: 93 0b 01 08  	addi	s7, sp, 128
    216c: 13 0c 81 00  	addi	s8, sp, 8
    2170: 0a 8b        	mv	s6, sp
    2172: a2 f2        	sd	s0, 352(sp)
    2174: 32 e0        	sd	a2, 0(sp)
    2176: 2a 84        	mv	s0, a0
    2178: 62 87        	mv	a4, s8
    217a: de 86        	mv	a3, s7
    217c: 5a 86        	mv	a2, s6
    217e: 01 45        	li	a0, 0
    2180: a6 ee        	sd	s1, 344(sp)
    2182: 56 fe        	sd	s5, 312(sp)
    2184: 86 f6        	sd	ra, 360(sp)
    2186: ca ea        	sd	s2, 336(sp)
    2188: ce e6        	sd	s3, 328(sp)
    218a: d2 e2        	sd	s4, 320(sp)
    218c: ae 8a        	mv	s5, a1
    218e: 02 e4        	sd	zero, 8(sp)
    2190: 02 e8        	sd	zero, 16(sp)
    2192: 02 ec        	sd	zero, 24(sp)
    2194: 02 f0        	sd	zero, 32(sp)
    2196: 02 f4        	sd	zero, 40(sp)
    2198: ef f0 3f 94  	jal	0x1ada <printf_core>
    219c: fd 54        	li	s1, -1
    219e: 63 43 05 0a  	bltz	a0, 0x2244 <vfprintf+0xe4>
    21a2: 83 27 c4 08  	lw	a5, 140(s0)
    21a6: 81 49        	li	s3, 0
    21a8: 63 c6 07 00  	bltz	a5, 0x21b4 <vfprintf+0x54>
    21ac: 22 85        	mv	a0, s0
    21ae: ef 00 90 33  	jal	0x2ce6 <__lockfile>
    21b2: aa 89        	mv	s3, a0
    21b4: 1c 40        	lw	a5, 0(s0)
    21b6: 03 27 84 08  	lw	a4, 136(s0)
    21ba: 13 fa 07 02  	andi	s4, a5, 32
    21be: 63 45 e0 00  	bgtz	a4, 0x21c8 <vfprintf+0x68>
    21c2: 93 f7 f7 fd  	andi	a5, a5, -33
    21c6: 1c c0        	sw	a5, 0(s0)
    21c8: 3c 70        	ld	a5, 96(s0)
    21ca: d1 eb        	bnez	a5, 0x225e <vfprintf+0xfe>
    21cc: 1c 18        	addi	a5, sp, 48
    21ce: 03 39 84 05  	ld	s2, 88(s0)
    21d2: 3c ec        	sd	a5, 88(s0)
    21d4: 93 07 00 05  	li	a5, 80
    21d8: 3c f0        	sd	a5, 96(s0)
    21da: 23 30 04 02  	sd	zero, 32(s0)
    21de: 23 3c 04 02  	sd	zero, 56(s0)
    21e2: 23 34 04 02  	sd	zero, 40(s0)
    21e6: 22 85        	mv	a0, s0
    21e8: ef 00 70 4a  	jal	0x2e8e <__towrite>
    21ec: fd 54        	li	s1, -1
    21ee: 09 e9        	bnez	a0, 0x2200 <vfprintf+0xa0>
    21f0: 62 87        	mv	a4, s8
    21f2: de 86        	mv	a3, s7
    21f4: 5a 86        	mv	a2, s6
    21f6: d6 85        	mv	a1, s5
    21f8: 22 85        	mv	a0, s0
    21fa: ef f0 1f 8e  	jal	0x1ada <printf_core>
    21fe: aa 84        	mv	s1, a0
    2200: 63 04 09 02  	beqz	s2, 0x2228 <vfprintf+0xc8>
    2204: 3c 64        	ld	a5, 72(s0)
    2206: 01 46        	li	a2, 0
    2208: 81 45        	li	a1, 0
    220a: 22 85        	mv	a0, s0
    220c: 82 97        	jalr	a5
    220e: 1c 74        	ld	a5, 40(s0)
    2210: 91 e3        	bnez	a5, 0x2214 <vfprintf+0xb4>
    2212: fd 54        	li	s1, -1
    2214: 23 3c 24 05  	sd	s2, 88(s0)
    2218: 23 30 04 06  	sd	zero, 96(s0)
    221c: 23 30 04 02  	sd	zero, 32(s0)
    2220: 23 3c 04 02  	sd	zero, 56(s0)
    2224: 23 34 04 02  	sd	zero, 40(s0)
    2228: 1c 40        	lw	a5, 0(s0)
    222a: 13 f7 07 02  	andi	a4, a5, 32
    222e: 11 c3        	beqz	a4, 0x2232 <vfprintf+0xd2>
    2230: fd 54        	li	s1, -1
    2232: 33 6a fa 00  	or	s4, s4, a5
    2236: 23 20 44 01  	sw	s4, 0(s0)
    223a: 63 85 09 00  	beqz	s3, 0x2244 <vfprintf+0xe4>
    223e: 22 85        	mv	a0, s0
    2240: ef 00 30 34  	jal	0x2d82 <__unlockfile>
    2244: b6 70        	ld	ra, 360(sp)
    2246: 16 74        	ld	s0, 352(sp)
    2248: 56 69        	ld	s2, 336(sp)
    224a: b6 69        	ld	s3, 328(sp)
    224c: 16 6a        	ld	s4, 320(sp)
    224e: f2 7a        	ld	s5, 312(sp)
    2250: 52 7b        	ld	s6, 304(sp)
    2252: b2 7b        	ld	s7, 296(sp)
    2254: 12 7c        	ld	s8, 288(sp)
    2256: 26 85        	mv	a0, s1
    2258: f6 64        	ld	s1, 344(sp)
    225a: 75 61        	addi	sp, sp, 368
    225c: 82 80        	ret
    225e: 03 39 04 02  	ld	s2, 32(s0)
    2262: e3 02 09 f8  	beqz	s2, 0x21e6 <vfprintf+0x86>
    2266: 01 49        	li	s2, 0
    2268: 61 b7        	j	0x21f0 <vfprintf+0x90>

000000000000226a <memcpy>:
    226a: 93 f7 35 00  	andi	a5, a1, 3
    226e: 63 83 07 40  	beqz	a5, 0x2674 <memcpy+0x40a>
    2272: 63 0b 06 22  	beqz	a2, 0x24a8 <memcpy+0x23e>
    2276: 2a 8e        	mv	t3, a0
    2278: 19 a0        	j	0x227e <memcpy+0x14>
    227a: 63 06 06 22  	beqz	a2, 0x24a6 <memcpy+0x23c>
    227e: 03 c7 05 00  	lbu	a4, 0(a1)
    2282: 85 05        	addi	a1, a1, 1
    2284: 93 f7 35 00  	andi	a5, a1, 3
    2288: 23 00 ee 00  	sb	a4, 0(t3)
    228c: 7d 16        	addi	a2, a2, -1
    228e: 05 0e        	addi	t3, t3, 1
    2290: ed f7        	bnez	a5, 0x227a <memcpy+0x10>
    2292: 93 76 3e 00  	andi	a3, t3, 3
    2296: f2 87        	mv	a5, t3
    2298: 63 89 06 20  	beqz	a3, 0x24aa <memcpy+0x240>
    229c: 39 71        	addi	sp, sp, -64
    229e: 22 fc        	sd	s0, 56(sp)
    22a0: 26 f8        	sd	s1, 48(sp)
    22a2: 4a f4        	sd	s2, 40(sp)
    22a4: 4e f0        	sd	s3, 32(sp)
    22a6: 52 ec        	sd	s4, 24(sp)
    22a8: 56 e8        	sd	s5, 16(sp)
    22aa: 5a e4        	sd	s6, 8(sp)
    22ac: 5e e0        	sd	s7, 0(sp)
    22ae: fd 47        	li	a5, 31
    22b0: 63 f7 c7 0a  	bgeu	a5, a2, 0x235e <memcpy+0xf4>
    22b4: 09 47        	li	a4, 2
    22b6: 03 c8 05 00  	lbu	a6, 0(a1)
    22ba: 9c 41        	lw	a5, 0(a1)
    22bc: 63 8f e6 30  	beq	a3, a4, 0x25da <memcpy+0x370>
    22c0: 0d 47        	li	a4, 3
    22c2: 63 88 e6 28  	beq	a3, a4, 0x2552 <memcpy+0x2e8>
    22c6: 83 c8 15 00  	lbu	a7, 1(a1)
    22ca: 83 c6 25 00  	lbu	a3, 2(a1)
    22ce: 13 07 c6 fe  	addi	a4, a2, -20
    22d2: 93 73 07 ff  	andi	t2, a4, -16
    22d6: 8d 05        	addi	a1, a1, 3
    22d8: 13 04 3e 00  	addi	s0, t3, 3
    22dc: 13 89 33 01  	addi	s2, t2, 19
    22e0: 93 54 47 00  	srli	s1, a4, 4
    22e4: 23 00 0e 01  	sb	a6, 0(t3)
    22e8: a3 00 1e 01  	sb	a7, 1(t3)
    22ec: 23 01 de 00  	sb	a3, 2(t3)
    22f0: 72 99        	add	s2, s2, t3
    22f2: 2e 83        	mv	t1, a1
    22f4: 22 87        	mv	a4, s0
    22f6: 83 28 13 00  	lw	a7, 1(t1)
    22fa: 03 28 53 00  	lw	a6, 5(t1)
    22fe: 83 26 93 00  	lw	a3, 9(t1)
    2302: 1b de 87 01  	srliw	t3, a5, 24
    2306: 83 27 d3 00  	lw	a5, 13(t1)
    230a: 9b 92 88 00  	slliw	t0, a7, 8
    230e: 9b 1f 88 00  	slliw	t6, a6, 8
    2312: 1b 9f 86 00  	slliw	t5, a3, 8
    2316: 9b d8 88 01  	srliw	a7, a7, 24
    231a: 1b 58 88 01  	srliw	a6, a6, 24
    231e: 9b d6 86 01  	srliw	a3, a3, 24
    2322: 9b 9e 87 00  	slliw	t4, a5, 8
    2326: 33 6e 5e 00  	or	t3, t3, t0
    232a: b3 e8 f8 01  	or	a7, a7, t6
    232e: 33 68 e8 01  	or	a6, a6, t5
    2332: b3 e6 d6 01  	or	a3, a3, t4
    2336: 23 20 c7 01  	sw	t3, 0(a4)
    233a: 23 22 17 01  	sw	a7, 4(a4)
    233e: 23 24 07 01  	sw	a6, 8(a4)
    2342: 54 c7        	sw	a3, 12(a4)
    2344: 41 07        	addi	a4, a4, 16
    2346: 41 03        	addi	t1, t1, 16
    2348: e3 17 27 fb  	bne	a4, s2, 0x22f6 <memcpy+0x8c>
    234c: 93 87 14 00  	addi	a5, s1, 1
    2350: 92 07        	slli	a5, a5, 4
    2352: 35 16        	addi	a2, a2, -19
    2354: 33 06 76 40  	sub	a2, a2, t2
    2358: 33 0e f4 00  	add	t3, s0, a5
    235c: be 95        	add	a1, a1, a5
    235e: 93 77 06 01  	andi	a5, a2, 16
    2362: 13 77 86 00  	andi	a4, a2, 8
    2366: 13 78 46 00  	andi	a6, a2, 4
    236a: 93 76 26 00  	andi	a3, a2, 2
    236e: 05 8a        	andi	a2, a2, 1
    2370: 63 81 07 34  	beqz	a5, 0x26b2 <memcpy+0x448>
    2374: 83 c7 e5 00  	lbu	a5, 14(a1)
    2378: 83 cb 05 00  	lbu	s7, 0(a1)
    237c: 03 cb 15 00  	lbu	s6, 1(a1)
    2380: 83 ca 25 00  	lbu	s5, 2(a1)
    2384: 03 ca 35 00  	lbu	s4, 3(a1)
    2388: 83 c9 45 00  	lbu	s3, 4(a1)
    238c: 03 c9 55 00  	lbu	s2, 5(a1)
    2390: 83 c4 65 00  	lbu	s1, 6(a1)
    2394: 03 c4 75 00  	lbu	s0, 7(a1)
    2398: 83 c3 85 00  	lbu	t2, 8(a1)
    239c: 83 c2 95 00  	lbu	t0, 9(a1)
    23a0: 83 cf a5 00  	lbu	t6, 10(a1)
    23a4: 03 cf b5 00  	lbu	t5, 11(a1)
    23a8: 83 ce c5 00  	lbu	t4, 12(a1)
    23ac: 03 c3 d5 00  	lbu	t1, 13(a1)
    23b0: 83 c8 f5 00  	lbu	a7, 15(a1)
    23b4: 23 07 fe 00  	sb	a5, 14(t3)
    23b8: 23 00 7e 01  	sb	s7, 0(t3)
    23bc: a3 00 6e 01  	sb	s6, 1(t3)
    23c0: 23 01 5e 01  	sb	s5, 2(t3)
    23c4: a3 01 4e 01  	sb	s4, 3(t3)
    23c8: 23 02 3e 01  	sb	s3, 4(t3)
    23cc: a3 02 2e 01  	sb	s2, 5(t3)
    23d0: 23 03 9e 00  	sb	s1, 6(t3)
    23d4: a3 03 8e 00  	sb	s0, 7(t3)
    23d8: 23 04 7e 00  	sb	t2, 8(t3)
    23dc: a3 04 5e 00  	sb	t0, 9(t3)
    23e0: 23 05 fe 01  	sb	t6, 10(t3)
    23e4: a3 05 ee 01  	sb	t5, 11(t3)
    23e8: 23 06 de 01  	sb	t4, 12(t3)
    23ec: a3 06 6e 00  	sb	t1, 13(t3)
    23f0: c1 05        	addi	a1, a1, 16
    23f2: 93 07 0e 01  	addi	a5, t3, 16
    23f6: a3 07 1e 01  	sb	a7, 15(t3)
    23fa: 63 0b 07 26  	beqz	a4, 0x2670 <memcpy+0x406>
    23fe: 03 c7 65 00  	lbu	a4, 6(a1)
    2402: 83 c2 05 00  	lbu	t0, 0(a1)
    2406: 83 cf 15 00  	lbu	t6, 1(a1)
    240a: 03 cf 25 00  	lbu	t5, 2(a1)
    240e: 83 ce 35 00  	lbu	t4, 3(a1)
    2412: 03 ce 45 00  	lbu	t3, 4(a1)
    2416: 03 c3 55 00  	lbu	t1, 5(a1)
    241a: 83 c8 75 00  	lbu	a7, 7(a1)
    241e: 23 83 e7 00  	sb	a4, 6(a5)
    2422: 23 80 57 00  	sb	t0, 0(a5)
    2426: a3 80 f7 01  	sb	t6, 1(a5)
    242a: 23 81 e7 01  	sb	t5, 2(a5)
    242e: a3 81 d7 01  	sb	t4, 3(a5)
    2432: 23 82 c7 01  	sb	t3, 4(a5)
    2436: a3 82 67 00  	sb	t1, 5(a5)
    243a: a1 05        	addi	a1, a1, 8
    243c: 13 87 87 00  	addi	a4, a5, 8
    2440: a3 83 17 01  	sb	a7, 7(a5)
    2444: 63 05 08 26  	beqz	a6, 0x26ae <memcpy+0x444>
    2448: 83 c7 25 00  	lbu	a5, 2(a1)
    244c: 03 c3 05 00  	lbu	t1, 0(a1)
    2450: 83 c8 15 00  	lbu	a7, 1(a1)
    2454: 03 c8 35 00  	lbu	a6, 3(a1)
    2458: 23 01 f7 00  	sb	a5, 2(a4)
    245c: 23 00 67 00  	sb	t1, 0(a4)
    2460: a3 00 17 01  	sb	a7, 1(a4)
    2464: 91 05        	addi	a1, a1, 4
    2466: 93 07 47 00  	addi	a5, a4, 4
    246a: a3 01 07 01  	sb	a6, 3(a4)
    246e: 63 8f 06 1e  	beqz	a3, 0x266c <memcpy+0x402>
    2472: 03 c7 05 00  	lbu	a4, 0(a1)
    2476: 83 c6 15 00  	lbu	a3, 1(a1)
    247a: 89 05        	addi	a1, a1, 2
    247c: 23 80 e7 00  	sb	a4, 0(a5)
    2480: a3 80 d7 00  	sb	a3, 1(a5)
    2484: 13 87 27 00  	addi	a4, a5, 2
    2488: 09 c6        	beqz	a2, 0x2492 <memcpy+0x228>
    248a: 83 c7 05 00  	lbu	a5, 0(a1)
    248e: 23 00 f7 00  	sb	a5, 0(a4)
    2492: 62 74        	ld	s0, 56(sp)
    2494: c2 74        	ld	s1, 48(sp)
    2496: 22 79        	ld	s2, 40(sp)
    2498: 82 79        	ld	s3, 32(sp)
    249a: 62 6a        	ld	s4, 24(sp)
    249c: c2 6a        	ld	s5, 16(sp)
    249e: 22 6b        	ld	s6, 8(sp)
    24a0: 82 6b        	ld	s7, 0(sp)
    24a2: 21 61        	addi	sp, sp, 64
    24a4: 82 80        	ret
    24a6: 82 80        	ret
    24a8: 82 80        	ret
    24aa: 3d 47        	li	a4, 15
    24ac: 63 79 c7 04  	bgeu	a4, a2, 0x24fe <memcpy+0x294>
    24b0: 33 e7 c5 01  	or	a4, a1, t3
    24b4: 1d 8b        	andi	a4, a4, 7
    24b6: 93 0e 06 ff  	addi	t4, a2, -16
    24ba: 63 1f 07 1a  	bnez	a4, 0x2678 <memcpy+0x40e>
    24be: 13 b7 0e 01  	sltiu	a4, t4, 16
    24c2: 13 47 17 00  	xori	a4, a4, 1
    24c6: 13 77 f7 0f  	andi	a4, a4, 255
    24ca: 63 07 07 1a  	beqz	a4, 0x2678 <memcpy+0x40e>
    24ce: 93 de 4e 00  	srli	t4, t4, 4
    24d2: 13 83 1e 00  	addi	t1, t4, 1
    24d6: 2e 87        	mv	a4, a1
    24d8: 83 38 87 00  	ld	a7, 8(a4)
    24dc: 03 38 07 00  	ld	a6, 0(a4)
    24e0: 85 06        	addi	a3, a3, 1
    24e2: 23 b4 17 01  	sd	a7, 8(a5)
    24e6: 23 b0 07 01  	sd	a6, 0(a5)
    24ea: 41 07        	addi	a4, a4, 16
    24ec: c1 07        	addi	a5, a5, 16
    24ee: e3 e5 66 fe  	bltu	a3, t1, 0x24d8 <memcpy+0x26e>
    24f2: 93 87 1e 00  	addi	a5, t4, 1
    24f6: 92 07        	slli	a5, a5, 4
    24f8: 3d 8a        	andi	a2, a2, 15
    24fa: 3e 9e        	add	t3, t3, a5
    24fc: be 95        	add	a1, a1, a5
    24fe: 93 76 86 00  	andi	a3, a2, 8
    2502: 13 77 46 00  	andi	a4, a2, 4
    2506: 93 77 26 00  	andi	a5, a2, 2
    250a: 05 8a        	andi	a2, a2, 1
    250c: 91 ca        	beqz	a3, 0x2520 <memcpy+0x2b6>
    250e: 03 a8 05 00  	lw	a6, 0(a1)
    2512: d4 41        	lw	a3, 4(a1)
    2514: 21 0e        	addi	t3, t3, 8
    2516: a1 05        	addi	a1, a1, 8
    2518: 23 2c 0e ff  	sw	a6, -8(t3)
    251c: 23 2e de fe  	sw	a3, -4(t3)
    2520: 11 c7        	beqz	a4, 0x252c <memcpy+0x2c2>
    2522: 98 41        	lw	a4, 0(a1)
    2524: 11 0e        	addi	t3, t3, 4
    2526: 91 05        	addi	a1, a1, 4
    2528: 23 2e ee fe  	sw	a4, -4(t3)
    252c: 63 85 07 18  	beqz	a5, 0x26b6 <memcpy+0x44c>
    2530: 83 c7 05 00  	lbu	a5, 0(a1)
    2534: 03 c7 15 00  	lbu	a4, 1(a1)
    2538: 89 05        	addi	a1, a1, 2
    253a: 23 00 fe 00  	sb	a5, 0(t3)
    253e: a3 00 ee 00  	sb	a4, 1(t3)
    2542: 93 07 2e 00  	addi	a5, t3, 2
    2546: 2d d2        	beqz	a2, 0x24a8 <memcpy+0x23e>
    2548: 03 c7 05 00  	lbu	a4, 0(a1)
    254c: 23 80 e7 00  	sb	a4, 0(a5)
    2550: 82 80        	ret
    2552: 13 07 c6 fe  	addi	a4, a2, -20
    2556: 13 74 07 ff  	andi	s0, a4, -16
    255a: 85 05        	addi	a1, a1, 1
    255c: 93 04 1e 00  	addi	s1, t3, 1
    2560: 93 03 14 01  	addi	t2, s0, 17
    2564: 13 59 47 00  	srli	s2, a4, 4
    2568: 23 00 0e 01  	sb	a6, 0(t3)
    256c: f2 93        	add	t2, t2, t3
    256e: 2e 83        	mv	t1, a1
    2570: 26 87        	mv	a4, s1
    2572: 83 28 33 00  	lw	a7, 3(t1)
    2576: 03 28 73 00  	lw	a6, 7(t1)
    257a: 83 26 b3 00  	lw	a3, 11(t1)
    257e: 1b de 87 00  	srliw	t3, a5, 8
    2582: 83 27 f3 00  	lw	a5, 15(t1)
    2586: 9b 92 88 01  	slliw	t0, a7, 24
    258a: 9b 1f 88 01  	slliw	t6, a6, 24
    258e: 1b 9f 86 01  	slliw	t5, a3, 24
    2592: 9b d8 88 00  	srliw	a7, a7, 8
    2596: 1b 58 88 00  	srliw	a6, a6, 8
    259a: 9b d6 86 00  	srliw	a3, a3, 8
    259e: 9b 9e 87 01  	slliw	t4, a5, 24
    25a2: 33 6e 5e 00  	or	t3, t3, t0
    25a6: b3 e8 f8 01  	or	a7, a7, t6
    25aa: 33 68 e8 01  	or	a6, a6, t5
    25ae: b3 e6 d6 01  	or	a3, a3, t4
    25b2: 23 20 c7 01  	sw	t3, 0(a4)
    25b6: 23 22 17 01  	sw	a7, 4(a4)
    25ba: 23 24 07 01  	sw	a6, 8(a4)
    25be: 54 c7        	sw	a3, 12(a4)
    25c0: 41 07        	addi	a4, a4, 16
    25c2: 41 03        	addi	t1, t1, 16
    25c4: e3 17 77 fa  	bne	a4, t2, 0x2572 <memcpy+0x308>
    25c8: 93 07 19 00  	addi	a5, s2, 1
    25cc: 92 07        	slli	a5, a5, 4
    25ce: 3d 16        	addi	a2, a2, -17
    25d0: 01 8e        	sub	a2, a2, s0
    25d2: 33 8e f4 00  	add	t3, s1, a5
    25d6: be 95        	add	a1, a1, a5
    25d8: 59 b3        	j	0x235e <memcpy+0xf4>
    25da: 83 c6 15 00  	lbu	a3, 1(a1)
    25de: 13 07 c6 fe  	addi	a4, a2, -20
    25e2: 93 73 07 ff  	andi	t2, a4, -16
    25e6: 89 05        	addi	a1, a1, 2
    25e8: 13 04 2e 00  	addi	s0, t3, 2
    25ec: 13 89 23 01  	addi	s2, t2, 18
    25f0: 93 54 47 00  	srli	s1, a4, 4
    25f4: 23 00 0e 01  	sb	a6, 0(t3)
    25f8: a3 00 de 00  	sb	a3, 1(t3)
    25fc: 72 99        	add	s2, s2, t3
    25fe: 2e 83        	mv	t1, a1
    2600: 22 87        	mv	a4, s0
    2602: 83 28 23 00  	lw	a7, 2(t1)
    2606: 03 28 63 00  	lw	a6, 6(t1)
    260a: 83 26 a3 00  	lw	a3, 10(t1)
    260e: 1b de 07 01  	srliw	t3, a5, 16
    2612: 83 27 e3 00  	lw	a5, 14(t1)
    2616: 9b 92 08 01  	slliw	t0, a7, 16
    261a: 9b 1f 08 01  	slliw	t6, a6, 16
    261e: 1b 9f 06 01  	slliw	t5, a3, 16
    2622: 9b d8 08 01  	srliw	a7, a7, 16
    2626: 1b 58 08 01  	srliw	a6, a6, 16
    262a: 9b d6 06 01  	srliw	a3, a3, 16
    262e: 9b 9e 07 01  	slliw	t4, a5, 16
    2632: 33 6e 5e 00  	or	t3, t3, t0
    2636: b3 e8 f8 01  	or	a7, a7, t6
    263a: 33 68 e8 01  	or	a6, a6, t5
    263e: b3 e6 d6 01  	or	a3, a3, t4
    2642: 23 20 c7 01  	sw	t3, 0(a4)
    2646: 23 22 17 01  	sw	a7, 4(a4)
    264a: 23 24 07 01  	sw	a6, 8(a4)
    264e: 54 c7        	sw	a3, 12(a4)
    2650: 41 07        	addi	a4, a4, 16
    2652: 41 03        	addi	t1, t1, 16
    2654: e3 17 27 fb  	bne	a4, s2, 0x2602 <memcpy+0x398>
    2658: 93 87 14 00  	addi	a5, s1, 1
    265c: 92 07        	slli	a5, a5, 4
    265e: 39 16        	addi	a2, a2, -18
    2660: 33 06 76 40  	sub	a2, a2, t2
    2664: 33 0e f4 00  	add	t3, s0, a5
    2668: be 95        	add	a1, a1, a5
    266a: d5 b9        	j	0x235e <memcpy+0xf4>
    266c: 3e 87        	mv	a4, a5
    266e: 29 bd        	j	0x2488 <memcpy+0x21e>
    2670: 3e 87        	mv	a4, a5
    2672: c9 bb        	j	0x2444 <memcpy+0x1da>
    2674: 2a 8e        	mv	t3, a0
    2676: 31 b9        	j	0x2292 <memcpy+0x28>
    2678: 93 de 4e 00  	srli	t4, t4, 4
    267c: 13 8f 1e 00  	addi	t5, t4, 1
    2680: 12 0f        	slli	t5, t5, 4
    2682: 2e 9f        	add	t5, t5, a1
    2684: ae 87        	mv	a5, a1
    2686: 72 87        	mv	a4, t3
    2688: 03 a3 07 00  	lw	t1, 0(a5)
    268c: 83 a8 47 00  	lw	a7, 4(a5)
    2690: 03 a8 87 00  	lw	a6, 8(a5)
    2694: d4 47        	lw	a3, 12(a5)
    2696: 23 20 67 00  	sw	t1, 0(a4)
    269a: 23 22 17 01  	sw	a7, 4(a4)
    269e: 23 24 07 01  	sw	a6, 8(a4)
    26a2: 54 c7        	sw	a3, 12(a4)
    26a4: c1 07        	addi	a5, a5, 16
    26a6: 41 07        	addi	a4, a4, 16
    26a8: e3 10 ff fe  	bne	t5, a5, 0x2688 <memcpy+0x41e>
    26ac: 99 b5        	j	0x24f2 <memcpy+0x288>
    26ae: ba 87        	mv	a5, a4
    26b0: 7d bb        	j	0x246e <memcpy+0x204>
    26b2: f2 87        	mv	a5, t3
    26b4: 99 b3        	j	0x23fa <memcpy+0x190>
    26b6: f2 87        	mv	a5, t3
    26b8: 79 b5        	j	0x2546 <memcpy+0x2dc>

00000000000026ba <memset>:
    26ba: 79 c6        	beqz	a2, 0x2788 <memset+0xce>
    26bc: 93 f7 f5 0f  	andi	a5, a1, 255
    26c0: 23 00 f5 00  	sb	a5, 0(a0)
    26c4: 33 07 c5 00  	add	a4, a0, a2
    26c8: a3 0f f7 fe  	sb	a5, -1(a4)
    26cc: 89 46        	li	a3, 2
    26ce: 63 fd c6 0a  	bgeu	a3, a2, 0x2788 <memset+0xce>
    26d2: a3 00 f5 00  	sb	a5, 1(a0)
    26d6: 23 01 f5 00  	sb	a5, 2(a0)
    26da: 23 0f f7 fe  	sb	a5, -2(a4)
    26de: a3 0e f7 fe  	sb	a5, -3(a4)
    26e2: 99 46        	li	a3, 6
    26e4: 63 f2 c6 0a  	bgeu	a3, a2, 0x2788 <memset+0xce>
    26e8: a3 01 f5 00  	sb	a5, 3(a0)
    26ec: 23 0e f7 fe  	sb	a5, -4(a4)
    26f0: a1 46        	li	a3, 8
    26f2: 63 fb c6 08  	bgeu	a3, a2, 0x2788 <memset+0xce>
    26f6: 93 f5 f5 0f  	andi	a1, a1, 255
    26fa: 9b 97 85 00  	slliw	a5, a1, 8
    26fe: 33 07 a0 40  	neg	a4, a0
    2702: 0d 8b        	andi	a4, a4, 3
    2704: ad 9f        	addw	a5, a5, a1
    2706: 19 8e        	sub	a2, a2, a4
    2708: 9b 95 07 01  	slliw	a1, a5, 16
    270c: ad 9f        	addw	a5, a5, a1
    270e: 2a 97        	add	a4, a4, a0
    2710: 71 9a        	andi	a2, a2, -4
    2712: 1c c3        	sw	a5, 0(a4)
    2714: b3 05 c7 00  	add	a1, a4, a2
    2718: 23 ae f5 fe  	sw	a5, -4(a1)
    271c: 63 f6 c6 06  	bgeu	a3, a2, 0x2788 <memset+0xce>
    2720: 5c c3        	sw	a5, 4(a4)
    2722: 1c c7        	sw	a5, 8(a4)
    2724: 23 aa f5 fe  	sw	a5, -12(a1)
    2728: 23 ac f5 fe  	sw	a5, -8(a1)
    272c: e1 46        	li	a3, 24
    272e: 63 fd c6 04  	bgeu	a3, a2, 0x2788 <memset+0xce>
    2732: 13 78 47 00  	andi	a6, a4, 4
    2736: 5c c7        	sw	a5, 12(a4)
    2738: 1c cb        	sw	a5, 16(a4)
    273a: 5c cb        	sw	a5, 20(a4)
    273c: 1c cf        	sw	a5, 24(a4)
    273e: 61 08        	addi	a6, a6, 24
    2740: 93 98 07 02  	slli	a7, a5, 32
    2744: 93 96 07 02  	slli	a3, a5, 32
    2748: 93 d8 08 02  	srli	a7, a7, 32
    274c: 23 a2 f5 fe  	sw	a5, -28(a1)
    2750: 23 a4 f5 fe  	sw	a5, -24(a1)
    2754: 23 a6 f5 fe  	sw	a5, -20(a1)
    2758: 23 a8 f5 fe  	sw	a5, -16(a1)
    275c: 33 06 06 41  	sub	a2, a2, a6
    2760: fd 47        	li	a5, 31
    2762: 42 97        	add	a4, a4, a6
    2764: b3 e6 16 01  	or	a3, a3, a7
    2768: 63 f0 c7 02  	bgeu	a5, a2, 0x2788 <memset+0xce>
    276c: 01 16        	addi	a2, a2, -32
    276e: 93 77 06 fe  	andi	a5, a2, -32
    2772: 93 87 07 02  	addi	a5, a5, 32
    2776: ba 97        	add	a5, a5, a4
    2778: 14 e3        	sd	a3, 0(a4)
    277a: 14 e7        	sd	a3, 8(a4)
    277c: 14 eb        	sd	a3, 16(a4)
    277e: 14 ef        	sd	a3, 24(a4)
    2780: 13 07 07 02  	addi	a4, a4, 32
    2784: e3 1a f7 fe  	bne	a4, a5, 0x2778 <memset+0xbe>
    2788: 82 80        	ret

000000000000278a <strnlen>:
    278a: 01 11        	addi	sp, sp, -32
    278c: 22 e8        	sd	s0, 16(sp)
    278e: 2e 86        	mv	a2, a1
    2790: 2e 84        	mv	s0, a1
    2792: 81 45        	li	a1, 0
    2794: 26 e4        	sd	s1, 8(sp)
    2796: 06 ec        	sd	ra, 24(sp)
    2798: aa 84        	mv	s1, a0
    279a: ef 00 10 06  	jal	0x2ffa <memchr>
    279e: 19 c5        	beqz	a0, 0x27ac <strnlen+0x22>
    27a0: e2 60        	ld	ra, 24(sp)
    27a2: 42 64        	ld	s0, 16(sp)
    27a4: 05 8d        	sub	a0, a0, s1
    27a6: a2 64        	ld	s1, 8(sp)
    27a8: 05 61        	addi	sp, sp, 32
    27aa: 82 80        	ret
    27ac: e2 60        	ld	ra, 24(sp)
    27ae: 22 85        	mv	a0, s0
    27b0: 42 64        	ld	s0, 16(sp)
    27b2: a2 64        	ld	s1, 8(sp)
    27b4: 05 61        	addi	sp, sp, 32
    27b6: 82 80        	ret

00000000000027b8 <__lock>:
    27b8: 17 66 00 00  	auipc	a2, 6
    27bc: 03 06 36 a4  	lb	a2, -1469(a2)
    27c0: 2a 87        	mv	a4, a0
    27c2: 79 c2        	beqz	a2, 0x2888 <__lock+0xd0>
    27c4: b7 06 00 80  	lui	a3, 524288
    27c8: 81 45        	li	a1, 0
    27ca: 85 06        	addi	a3, a3, 1
    27cc: af 27 07 16  	<unknown>
    27d0: 63 95 b7 00  	bne	a5, a1, 0x27da <__lock+0x22>
    27d4: 2f 25 d7 1e  	<unknown>
    27d8: 75 f9        	bnez	a0, 0x27cc <__lock+0x14>
    27da: 81 27        	sext.w	a5, a5
    27dc: 63 56 06 00  	bgez	a2, 0x27e8 <__lock+0x30>
    27e0: 97 66 00 00  	auipc	a3, 6
    27e4: a3 8d 06 a0  	sb	zero, -1509(a3)
    27e8: c5 c3        	beqz	a5, 0x2888 <__lock+0xd0>
    27ea: b7 06 00 80  	lui	a3, 524288
    27ee: a9 45        	li	a1, 10
    27f0: 13 c8 f6 ff  	not	a6, a3
    27f4: 1b 86 16 00  	addiw	a2, a3, 1
    27f8: be 86        	mv	a3, a5
    27fa: 63 d4 07 00  	bgez	a5, 0x2802 <__lock+0x4a>
    27fe: bb 06 f8 00  	addw	a3, a6, a5
    2802: 3b 05 d6 00  	addw	a0, a2, a3
    2806: af 27 07 16  	<unknown>
    280a: 63 96 d7 00  	bne	a5, a3, 0x2816 <__lock+0x5e>
    280e: af 28 a7 1e  	<unknown>
    2812: e3 9a 08 fe  	bnez	a7, 0x2806 <__lock+0x4e>
    2816: 81 27        	sext.w	a5, a5
    2818: 63 88 f6 06  	beq	a3, a5, 0x2888 <__lock+0xd0>
    281c: fd 35        	addiw	a1, a1, -1
    281e: e9 fd        	bnez	a1, 0x27f8 <__lock+0x40>
    2820: 1c 43        	lw	a5, 0(a4)
    2822: 1b 86 07 00  	sext.w	a2, a5
    2826: 85 27        	addiw	a5, a5, 1
    2828: af 26 07 16  	<unknown>
    282c: 63 95 c6 00  	bne	a3, a2, 0x2836 <__lock+0x7e>
    2830: af 25 f7 1e  	<unknown>
    2834: f5 f9        	bnez	a1, 0x2828 <__lock+0x70>
    2836: 81 26        	sext.w	a3, a3
    2838: e3 14 d6 fe  	bne	a2, a3, 0x2820 <__lock+0x68>
    283c: 37 08 00 80  	lui	a6, 524288
    2840: 13 03 a0 fd  	li	t1, -38
    2844: 13 4e f8 ff  	not	t3, a6
    2848: be 86        	mv	a3, a5
    284a: 63 d3 07 02  	bgez	a5, 0x2870 <__lock+0xb8>
    284e: 93 08 20 06  	li	a7, 98
    2852: 3a 85        	mv	a0, a4
    2854: 93 05 00 08  	li	a1, 128
    2858: 3e 86        	mv	a2, a5
    285a: 81 46        	li	a3, 0
    285c: 73 00 00 00  	ecall
    2860: 63 16 65 00  	bne	a0, t1, 0x286c <__lock+0xb4>
    2864: 3a 85        	mv	a0, a4
    2866: 81 45        	li	a1, 0
    2868: 73 00 00 00  	ecall
    286c: bb 06 fe 00  	addw	a3, t3, a5
    2870: 3b 06 d8 00  	addw	a2, a6, a3
    2874: af 27 07 16  	<unknown>
    2878: 63 95 d7 00  	bne	a5, a3, 0x2882 <__lock+0xca>
    287c: af 25 c7 1e  	<unknown>
    2880: f5 f9        	bnez	a1, 0x2874 <__lock+0xbc>
    2882: 81 27        	sext.w	a5, a5
    2884: e3 92 f6 fc  	bne	a3, a5, 0x2848 <__lock+0x90>
    2888: 82 80        	ret

000000000000288a <__unlock>:
    288a: 18 41        	lw	a4, 0(a0)
    288c: aa 87        	mv	a5, a0
    288e: 63 5a 07 04  	bgez	a4, 0x28e2 <__unlock+0x58>
    2892: b7 05 00 80  	lui	a1, 524288
    2896: 93 c5 f5 ff  	not	a1, a1
    289a: 98 43        	lw	a4, 0(a5)
    289c: 9b 06 07 00  	sext.w	a3, a4
    28a0: 2d 9f        	addw	a4, a4, a1
    28a2: 2f a6 07 16  	<unknown>
    28a6: 63 15 d6 00  	bne	a2, a3, 0x28b0 <__unlock+0x26>
    28aa: 2f a5 e7 1e  	<unknown>
    28ae: 75 f9        	bnez	a0, 0x28a2 <__unlock+0x18>
    28b0: 1b 07 06 00  	sext.w	a4, a2
    28b4: e3 93 e6 fe  	bne	a3, a4, 0x289a <__unlock+0x10>
    28b8: 37 07 00 80  	lui	a4, 524288
    28bc: 05 07        	addi	a4, a4, 1
    28be: 63 82 e6 02  	beq	a3, a4, 0x28e2 <__unlock+0x58>
    28c2: 93 08 20 06  	li	a7, 98
    28c6: 3e 85        	mv	a0, a5
    28c8: 93 05 10 08  	li	a1, 129
    28cc: 05 46        	li	a2, 1
    28ce: 73 00 00 00  	ecall
    28d2: 13 07 a0 fd  	li	a4, -38
    28d6: 63 16 e5 00  	bne	a0, a4, 0x28e2 <__unlock+0x58>
    28da: 3e 85        	mv	a0, a5
    28dc: 85 45        	li	a1, 1
    28de: 73 00 00 00  	ecall
    28e2: 82 80        	ret

00000000000028e4 <pthread_sigmask>:
    28e4: 89 c5        	beqz	a1, 0x28ee <pthread_sigmask+0xa>
    28e6: 09 47        	li	a4, 2
    28e8: d9 47        	li	a5, 22
    28ea: 63 61 a7 02  	bltu	a4, a0, 0x290c <pthread_sigmask+0x28>
    28ee: 93 08 70 08  	li	a7, 135
    28f2: a1 46        	li	a3, 8
    28f4: 73 00 00 00  	ecall
    28f8: bb 07 a0 40  	negw	a5, a0
    28fc: 81 eb        	bnez	a5, 0x290c <pthread_sigmask+0x28>
    28fe: 19 c6        	beqz	a2, 0x290c <pthread_sigmask+0x28>
    2900: 14 62        	ld	a3, 0(a2)
    2902: 65 57        	li	a4, -7
    2904: 7e 07        	slli	a4, a4, 31
    2906: 7d 17        	addi	a4, a4, -1
    2908: 75 8f        	and	a4, a4, a3
    290a: 18 e2        	sd	a4, 0(a2)
    290c: 3e 85        	mv	a0, a5
    290e: 82 80        	ret

0000000000002910 <getpid>:
    2910: 93 08 c0 0a  	li	a7, 172
    2914: 73 00 00 00  	ecall
    2918: 01 25        	sext.w	a0, a0
    291a: 82 80        	ret

000000000000291c <__init_tp>:
    291c: 41 11        	addi	sp, sp, -16
    291e: 22 e0        	sd	s0, 0(sp)
    2920: 06 e4        	sd	ra, 8(sp)
    2922: 2a 84        	mv	s0, a0
    2924: 08 e1        	sd	a0, 0(a0)
    2926: 13 05 85 0c  	addi	a0, a0, 200
    292a: ef 00 c0 7b  	jal	0x30e6 <__set_thread_area>
    292e: 63 47 05 04  	bltz	a0, 0x297c <__init_tp+0x60>
    2932: 11 e5        	bnez	a0, 0x293e <__init_tp+0x22>
    2934: 85 47        	li	a5, 1
    2936: 17 67 00 00  	auipc	a4, 6
    293a: 23 01 f7 8c  	sb	a5, -1854(a4)
    293e: 89 47        	li	a5, 2
    2940: 1c d4        	sw	a5, 40(s0)
    2942: 93 08 00 06  	li	a7, 96
    2946: 17 65 00 00  	auipc	a0, 6
    294a: 13 05 25 d5  	addi	a0, a0, -686
    294e: 73 00 00 00  	ecall
    2952: 97 67 00 00  	auipc	a5, 6
    2956: 93 87 e7 8d  	addi	a5, a5, -1826
    295a: 5c ec        	sd	a5, 152(s0)
    295c: 93 07 84 07  	addi	a5, s0, 120
    2960: 3c fc        	sd	a5, 120(s0)
    2962: 97 67 00 00  	auipc	a5, 6
    2966: 83 b7 67 88  	ld	a5, -1914(a5)
    296a: 08 d0        	sw	a0, 32(s0)
    296c: 1c ec        	sd	a5, 24(s0)
    296e: 00 e4        	sd	s0, 8(s0)
    2970: 00 e8        	sd	s0, 16(s0)
    2972: 01 45        	li	a0, 0
    2974: a2 60        	ld	ra, 8(sp)
    2976: 02 64        	ld	s0, 0(sp)
    2978: 41 01        	addi	sp, sp, 16
    297a: 82 80        	ret
    297c: 7d 55        	li	a0, -1
    297e: dd bf        	j	0x2974 <__init_tp+0x58>

0000000000002980 <__copy_tls>:
    2980: 39 71        	addi	sp, sp, -64
    2982: 4e ec        	sd	s3, 24(sp)
    2984: 97 69 00 00  	auipc	s3, 6
    2988: 93 89 49 87  	addi	s3, s3, -1932
    298c: 83 b7 89 02  	ld	a5, 40(s3)
    2990: 26 f4        	sd	s1, 40(sp)
    2992: 83 b4 89 01  	ld	s1, 24(s3)
    2996: 8e 07        	slli	a5, a5, 3
    2998: 13 07 80 f3  	li	a4, -200
    299c: e1 14        	addi	s1, s1, -8
    299e: 9d 8c        	sub	s1, s1, a5
    29a0: 83 b7 09 02  	ld	a5, 32(s3)
    29a4: 09 8f        	sub	a4, a4, a0
    29a6: 4a f0        	sd	s2, 32(sp)
    29a8: fd 17        	addi	a5, a5, -1
    29aa: f9 8f        	and	a5, a5, a4
    29ac: 03 b9 09 01  	ld	s2, 16(s3)
    29b0: 22 f8        	sd	s0, 48(sp)
    29b2: 56 e4        	sd	s5, 8(sp)
    29b4: aa 94        	add	s1, s1, a0
    29b6: 33 04 f5 00  	add	s0, a0, a5
    29ba: 85 6a        	lui	s5, 1
    29bc: 52 e8        	sd	s4, 16(sp)
    29be: 5a e0        	sd	s6, 0(sp)
    29c0: 06 fc        	sd	ra, 56(sp)
    29c2: 13 0b 84 0c  	addi	s6, s0, 200
    29c6: 13 8a 84 00  	addi	s4, s1, 8
    29ca: 93 8a 0a 80  	addi	s5, s5, -2048
    29ce: 63 11 09 02  	bnez	s2, 0x29f0 <__copy_tls+0x70>
    29d2: 83 b7 89 02  	ld	a5, 40(s3)
    29d6: e2 70        	ld	ra, 56(sp)
    29d8: 22 85        	mv	a0, s0
    29da: 9c e0        	sd	a5, 0(s1)
    29dc: 64 e0        	sd	s1, 192(s0)
    29de: 42 74        	ld	s0, 48(sp)
    29e0: a2 74        	ld	s1, 40(sp)
    29e2: 02 79        	ld	s2, 32(sp)
    29e4: e2 69        	ld	s3, 24(sp)
    29e6: 42 6a        	ld	s4, 16(sp)
    29e8: a2 6a        	ld	s5, 8(sp)
    29ea: 02 6b        	ld	s6, 0(sp)
    29ec: 21 61        	addi	sp, sp, 64
    29ee: 82 80        	ret
    29f0: 83 37 89 02  	ld	a5, 40(s2)
    29f4: 83 35 89 00  	ld	a1, 8(s2)
    29f8: 21 0a        	addi	s4, s4, 8
    29fa: da 97        	add	a5, a5, s6
    29fc: d6 97        	add	a5, a5, s5
    29fe: 23 3c fa fe  	sd	a5, -8(s4)
    2a02: 03 35 89 02  	ld	a0, 40(s2)
    2a06: 03 36 09 01  	ld	a2, 16(s2)
    2a0a: 5a 95        	add	a0, a0, s6
    2a0c: ef f0 ff 85  	jal	0x226a <memcpy>
    2a10: 03 39 09 00  	ld	s2, 0(s2)
    2a14: 6d bf        	j	0x29ce <__copy_tls+0x4e>

0000000000002a16 <static_init_tls>:
    2a16: 83 3e 85 01  	ld	t4, 24(a0)
    2a1a: 17 53 00 00  	auipc	t1, 5
    2a1e: 13 03 a3 6e  	addi	t1, t1, 1770
    2a22: 03 38 85 02  	ld	a6, 40(a0)
    2a26: 83 25 03 00  	lw	a1, 0(t1)
    2a2a: 41 11        	addi	sp, sp, -16
    2a2c: b7 e8 74 64  	lui	a7, 411470
    2a30: 06 e4        	sd	ra, 8(sp)
    2a32: 22 e0        	sd	s0, 0(sp)
    2a34: f6 87        	mv	a5, t4
    2a36: 01 4e        	li	t3, 0
    2a38: 01 47        	li	a4, 0
    2a3a: 81 46        	li	a3, 0
    2a3c: 99 4f        	li	t6, 6
    2a3e: 89 42        	li	t0, 2
    2a40: 17 5f 00 00  	auipc	t5, 5
    2a44: 03 3f 0f 6e  	ld	t5, 1760(t5)
    2a48: 9d 43        	li	t2, 7
    2a4a: 93 88 18 55  	addi	a7, a7, 1361
    2a4e: b7 00 80 00  	lui	ra, 2048
    2a52: 63 12 08 0a  	bnez	a6, 0x2af6 <static_init_tls+0xe0>
    2a56: 63 04 0e 00  	beqz	t3, 0x2a5e <static_init_tls+0x48>
    2a5a: 23 20 b3 00  	sw	a1, 0(t1)
    2a5e: 97 67 00 00  	auipc	a5, 6
    2a62: 93 87 27 d9  	addi	a5, a5, -622
    2a66: 17 56 00 00  	auipc	a2, 5
    2a6a: 13 06 26 79  	addi	a2, a2, 1938
    2a6e: 89 ce        	beqz	a3, 0x2a88 <static_init_tls+0x72>
    2a70: 8c 6a        	ld	a1, 16(a3)
    2a72: 1c ea        	sd	a5, 16(a2)
    2a74: 2e 97        	add	a4, a4, a1
    2a76: 98 e7        	sd	a4, 8(a5)
    2a78: 98 72        	ld	a4, 32(a3)
    2a7a: 98 eb        	sd	a4, 16(a5)
    2a7c: 98 76        	ld	a4, 40(a3)
    2a7e: 98 ef        	sd	a4, 24(a5)
    2a80: 98 7a        	ld	a4, 48(a3)
    2a82: 98 f3        	sd	a4, 32(a5)
    2a84: 05 47        	li	a4, 1
    2a86: 18 f6        	sd	a4, 40(a2)
    2a88: 03 b8 87 01  	ld	a6, 24(a5)
    2a8c: 94 67        	ld	a3, 8(a5)
    2a8e: 8c 73        	ld	a1, 32(a5)
    2a90: 33 07 d8 00  	add	a4, a6, a3
    2a94: 13 85 f5 ff  	addi	a0, a1, -1
    2a98: 33 07 e0 40  	neg	a4, a4
    2a9c: 69 8f        	and	a4, a4, a0
    2a9e: e9 8e        	and	a3, a3, a0
    2aa0: 42 97        	add	a4, a4, a6
    2aa2: 98 ef        	sd	a4, 24(a5)
    2aa4: 94 f7        	sd	a3, 40(a5)
    2aa6: 1d 45        	li	a0, 7
    2aa8: 63 64 b5 00  	bltu	a0, a1, 0x2ab0 <static_init_tls+0x9a>
    2aac: a1 45        	li	a1, 8
    2aae: 8c f3        	sd	a1, 32(a5)
    2ab0: 9c 73        	ld	a5, 32(a5)
    2ab2: 17 65 00 00  	auipc	a0, 6
    2ab6: 13 05 e5 be  	addi	a0, a0, -1042
    2aba: 93 85 f7 0d  	addi	a1, a5, 223
    2abe: b6 95        	add	a1, a1, a3
    2ac0: ba 95        	add	a1, a1, a4
    2ac2: e1 99        	andi	a1, a1, -8
    2ac4: 1c f2        	sd	a5, 32(a2)
    2ac6: 0c ee        	sd	a1, 24(a2)
    2ac8: 93 07 00 15  	li	a5, 336
    2acc: 63 fc b7 00  	bgeu	a5, a1, 0x2ae4 <static_init_tls+0xce>
    2ad0: 93 08 e0 0d  	li	a7, 222
    2ad4: 01 45        	li	a0, 0
    2ad6: 0d 46        	li	a2, 3
    2ad8: 93 06 20 02  	li	a3, 34
    2adc: 7d 57        	li	a4, -1
    2ade: 81 47        	li	a5, 0
    2ae0: 73 00 00 00  	ecall
    2ae4: ef f0 df e9  	jal	0x2980 <__copy_tls>
    2ae8: ef f0 5f e3  	jal	0x291c <__init_tp>
    2aec: 63 5b 05 04  	bgez	a0, 0x2b42 <static_init_tls+0x12c>
    2af0: 23 00 00 00  	sb	zero, 0(zero)
    2af4: 02 90        	ebreak
    2af6: 90 43        	lw	a2, 0(a5)
    2af8: 63 19 f6 01  	bne	a2, t6, 0x2b0a <static_init_tls+0xf4>
    2afc: 98 6b        	ld	a4, 16(a5)
    2afe: 33 87 ee 40  	sub	a4, t4, a4
    2b02: 10 71        	ld	a2, 32(a0)
    2b04: 7d 18        	addi	a6, a6, -1
    2b06: b2 97        	add	a5, a5, a2
    2b08: a9 b7        	j	0x2a52 <static_init_tls+0x3c>
    2b0a: 63 04 56 02  	beq	a2, t0, 0x2b32 <static_init_tls+0x11c>
    2b0e: 63 08 76 02  	beq	a2, t2, 0x2b3e <static_init_tls+0x128>
    2b12: e3 18 16 ff  	bne	a2, a7, 0x2b02 <static_init_tls+0xec>
    2b16: 90 77        	ld	a2, 40(a5)
    2b18: 13 94 05 02  	slli	s0, a1, 32
    2b1c: 01 90        	srli	s0, s0, 32
    2b1e: e3 72 c4 fe  	bgeu	s0, a2, 0x2b02 <static_init_tls+0xec>
    2b22: 63 f4 c0 00  	bgeu	ra, a2, 0x2b2a <static_init_tls+0x114>
    2b26: 37 06 80 00  	lui	a2, 2048
    2b2a: 9b 05 06 00  	sext.w	a1, a2
    2b2e: 05 4e        	li	t3, 1
    2b30: c9 bf        	j	0x2b02 <static_init_tls+0xec>
    2b32: e3 08 0f fc  	beqz	t5, 0x2b02 <static_init_tls+0xec>
    2b36: 98 6b        	ld	a4, 16(a5)
    2b38: 33 07 ef 40  	sub	a4, t5, a4
    2b3c: d9 b7        	j	0x2b02 <static_init_tls+0xec>
    2b3e: be 86        	mv	a3, a5
    2b40: c9 b7        	j	0x2b02 <static_init_tls+0xec>
    2b42: a2 60        	ld	ra, 8(sp)
    2b44: 02 64        	ld	s0, 0(sp)
    2b46: 41 01        	addi	sp, sp, 16
    2b48: 82 80        	ret

0000000000002b4a <__errno_location>:
    2b4a: 12 85        	mv	a0, tp
    2b4c: 13 05 c5 f5  	addi	a0, a0, -164
    2b50: 82 80        	ret

0000000000002b52 <strerror_l>:
    2b52: 93 07 30 08  	li	a5, 131
    2b56: 63 f3 a7 00  	bgeu	a5, a0, 0x2b5c <strerror_l+0xa>
    2b5a: 01 45        	li	a0, 0
    2b5c: 06 05        	slli	a0, a0, 1
    2b5e: 97 37 00 00  	auipc	a5, 3
    2b62: 93 87 27 b9  	addi	a5, a5, -1134
    2b66: aa 97        	add	a5, a5, a0
    2b68: 83 d7 07 00  	lhu	a5, 0(a5)
    2b6c: 8c 75        	ld	a1, 40(a1)
    2b6e: 17 35 00 00  	auipc	a0, 3
    2b72: 13 05 a5 c8  	addi	a0, a0, -886
    2b76: 3e 95        	add	a0, a0, a5
    2b78: 89 a0        	j	0x2bba <__lctrans>

0000000000002b7a <strerror>:
    2b7a: 92 87        	mv	a5, tp
    2b7c: 83 b5 07 fd  	ld	a1, -48(a5)
    2b80: c9 bf        	j	0x2b52 <strerror_l>

0000000000002b82 <_Exit>:
    2b82: aa 87        	mv	a5, a0
    2b84: 93 08 e0 05  	li	a7, 94
    2b88: 73 00 00 00  	ecall
    2b8c: 93 08 d0 05  	li	a7, 93
    2b90: 3e 85        	mv	a0, a5
    2b92: dd bf        	j	0x2b88 <_Exit+0x6>

0000000000002b94 <__syscall_ret>:
    2b94: 41 11        	addi	sp, sp, -16
    2b96: 22 e0        	sd	s0, 0(sp)
    2b98: 06 e4        	sd	ra, 8(sp)
    2b9a: fd 77        	lui	a5, 1048575
    2b9c: 2a 84        	mv	s0, a0
    2b9e: 63 e6 a7 00  	bltu	a5, a0, 0x2baa <__syscall_ret+0x16>
    2ba2: a2 60        	ld	ra, 8(sp)
    2ba4: 02 64        	ld	s0, 0(sp)
    2ba6: 41 01        	addi	sp, sp, 16
    2ba8: 82 80        	ret
    2baa: ef f0 1f fa  	jal	0x2b4a <__errno_location>
    2bae: 3b 04 80 40  	negw	s0, s0
    2bb2: 00 c1        	sw	s0, 0(a0)
    2bb4: 7d 55        	li	a0, -1
    2bb6: f5 b7        	j	0x2ba2 <__syscall_ret+0xe>

0000000000002bb8 <dummy>:
    2bb8: 82 80        	ret

0000000000002bba <__lctrans>:
    2bba: fd bf        	j	0x2bb8 <dummy>

0000000000002bbc <__lctrans_cur>:
    2bbc: 92 87        	mv	a5, tp
    2bbe: 83 b7 07 fd  	ld	a5, -48(a5)
    2bc2: 8c 77        	ld	a1, 40(a5)
    2bc4: d5 bf        	j	0x2bb8 <dummy>

0000000000002bc6 <__fpclassifyl>:
    2bc6: 21 67        	lui	a4, 8
    2bc8: 93 d6 05 03  	srli	a3, a1, 48
    2bcc: 7d 17        	addi	a4, a4, -1
    2bce: c2 05        	slli	a1, a1, 16
    2bd0: f9 8e        	and	a3, a3, a4
    2bd2: aa 87        	mv	a5, a0
    2bd4: c1 81        	srli	a1, a1, 16
    2bd6: 91 e6        	bnez	a3, 0x2be2 <__fpclassifyl+0x1c>
    2bd8: c9 8d        	or	a1, a1, a0
    2bda: 33 35 b0 00  	snez	a0, a1
    2bde: 09 05        	addi	a0, a0, 2
    2be0: 82 80        	ret
    2be2: 11 45        	li	a0, 4
    2be4: 63 95 e6 00  	bne	a3, a4, 0x2bee <__fpclassifyl+0x28>
    2be8: dd 8d        	or	a1, a1, a5
    2bea: 13 b5 15 00  	seqz	a0, a1
    2bee: 82 80        	ret

0000000000002bf0 <__signbitl>:
    2bf0: 13 d5 f5 03  	srli	a0, a1, 63
    2bf4: 82 80        	ret

0000000000002bf6 <frexpl.localalias>:
    2bf6: 21 67        	lui	a4, 8
    2bf8: 01 11        	addi	sp, sp, -32
    2bfa: 93 d7 05 03  	srli	a5, a1, 48
    2bfe: 7d 17        	addi	a4, a4, -1
    2c00: 22 e8        	sd	s0, 16(sp)
    2c02: 26 e4        	sd	s1, 8(sp)
    2c04: 4a e0        	sd	s2, 0(sp)
    2c06: 06 ec        	sd	ra, 24(sp)
    2c08: 32 89        	mv	s2, a2
    2c0a: 33 f6 e7 00  	and	a2, a5, a4
    2c0e: aa 84        	mv	s1, a0
    2c10: 2e 84        	mv	s0, a1
    2c12: 29 e6        	bnez	a2, 0x2c5c <frexpl.localalias+0x66>
    2c14: 81 46        	li	a3, 0
    2c16: ef 10 e0 14  	jal	0x3d64 <__netf2>
    2c1a: 15 cd        	beqz	a0, 0x2c56 <frexpl.localalias+0x60>
    2c1c: 97 37 00 00  	auipc	a5, 3
    2c20: 93 87 47 30  	addi	a5, a5, 772
    2c24: 90 63        	ld	a2, 0(a5)
    2c26: 94 67        	ld	a3, 8(a5)
    2c28: 26 85        	mv	a0, s1
    2c2a: a2 85        	mv	a1, s0
    2c2c: ef 10 60 1c  	jal	0x3df2 <__multf3>
    2c30: 4a 86        	mv	a2, s2
    2c32: ef f0 5f fc  	jal	0x2bf6 <frexpl.localalias>
    2c36: 83 27 09 00  	lw	a5, 0(s2)
    2c3a: aa 84        	mv	s1, a0
    2c3c: 2e 84        	mv	s0, a1
    2c3e: 9b 87 87 f8  	addiw	a5, a5, -120
    2c42: 23 20 f9 00  	sw	a5, 0(s2)
    2c46: e2 60        	ld	ra, 24(sp)
    2c48: a2 85        	mv	a1, s0
    2c4a: 42 64        	ld	s0, 16(sp)
    2c4c: 02 69        	ld	s2, 0(sp)
    2c4e: 26 85        	mv	a0, s1
    2c50: a2 64        	ld	s1, 8(sp)
    2c52: 05 61        	addi	sp, sp, 32
    2c54: 82 80        	ret
    2c56: 23 20 09 00  	sw	zero, 0(s2)
    2c5a: f5 b7        	j	0x2c46 <frexpl.localalias+0x50>
    2c5c: 9b 06 06 00  	sext.w	a3, a2
    2c60: e3 03 e6 fe  	beq	a2, a4, 0x2c46 <frexpl.localalias+0x50>
    2c64: 71 77        	lui	a4, 1048572
    2c66: 09 27        	addiw	a4, a4, 2
    2c68: 35 9f        	addw	a4, a4, a3
    2c6a: 23 20 e9 00  	sw	a4, 0(s2)
    2c6e: 61 77        	lui	a4, 1048568
    2c70: f9 8f        	and	a5, a5, a4
    2c72: 11 67        	lui	a4, 4
    2c74: 79 17        	addi	a4, a4, -2
    2c76: d9 8f        	or	a5, a5, a4
    2c78: 13 94 05 01  	slli	s0, a1, 16
    2c7c: c2 17        	slli	a5, a5, 48
    2c7e: 41 80        	srli	s0, s0, 16
    2c80: 5d 8c        	or	s0, s0, a5
    2c82: d1 b7        	j	0x2c46 <frexpl.localalias+0x50>

0000000000002c84 <wctomb>:
    2c84: 11 c9        	beqz	a0, 0x2c98 <wctomb+0x14>
    2c86: 41 11        	addi	sp, sp, -16
    2c88: 01 46        	li	a2, 0
    2c8a: 06 e4        	sd	ra, 8(sp)
    2c8c: ef 00 c0 46  	jal	0x30f8 <wcrtomb>
    2c90: a2 60        	ld	ra, 8(sp)
    2c92: 01 25        	sext.w	a0, a0
    2c94: 41 01        	addi	sp, sp, 16
    2c96: 82 80        	ret
    2c98: 01 45        	li	a0, 0
    2c9a: 82 80        	ret

0000000000002c9c <__block_all_sigs>:
    2c9c: 2a 86        	mv	a2, a0
    2c9e: 93 08 70 08  	li	a7, 135
    2ca2: 01 45        	li	a0, 0
    2ca4: 97 35 00 00  	auipc	a1, 3
    2ca8: 93 85 c5 28  	addi	a1, a1, 652
    2cac: a1 46        	li	a3, 8
    2cae: 73 00 00 00  	ecall
    2cb2: 82 80        	ret

0000000000002cb4 <__block_app_sigs>:
    2cb4: 2a 86        	mv	a2, a0
    2cb6: 93 08 70 08  	li	a7, 135
    2cba: 01 45        	li	a0, 0
    2cbc: 97 35 00 00  	auipc	a1, 3
    2cc0: 93 85 c5 27  	addi	a1, a1, 636
    2cc4: a1 46        	li	a3, 8
    2cc6: 73 00 00 00  	ecall
    2cca: 82 80        	ret

0000000000002ccc <__restore_sigs>:
    2ccc: aa 85        	mv	a1, a0
    2cce: 93 08 70 08  	li	a7, 135
    2cd2: 09 45        	li	a0, 2
    2cd4: 01 46        	li	a2, 0
    2cd6: a1 46        	li	a3, 8
    2cd8: 73 00 00 00  	ecall
    2cdc: 82 80        	ret

0000000000002cde <__restore_rt>:
    2cde: 93 08 b0 08  	li	a7, 139
    2ce2: 73 00 00 00  	ecall

0000000000002ce6 <__lockfile>:
    2ce6: 83 27 c5 08  	lw	a5, 140(a0)
    2cea: 81 27        	sext.w	a5, a5
    2cec: 12 87        	mv	a4, tp
    2cee: b7 06 00 c0  	lui	a3, 786432
    2cf2: 03 27 87 f5  	lw	a4, -168(a4)
    2cf6: fd 16        	addi	a3, a3, -1
    2cf8: f5 8f        	and	a5, a5, a3
    2cfa: 63 82 e7 08  	beq	a5, a4, 0x2d7e <__lockfile+0x98>
    2cfe: 93 07 c5 08  	addi	a5, a0, 140
    2d02: 01 46        	li	a2, 0
    2d04: af a6 07 16  	<unknown>
    2d08: 63 95 c6 00  	bne	a3, a2, 0x2d12 <__lockfile+0x2c>
    2d0c: af a5 e7 1e  	<unknown>
    2d10: f5 f9        	bnez	a1, 0x2d04 <__lockfile+0x1e>
    2d12: 81 26        	sext.w	a3, a3
    2d14: 95 c2        	beqz	a3, 0x2d38 <__lockfile+0x52>
    2d16: 37 08 00 40  	lui	a6, 262144
    2d1a: 33 67 07 01  	or	a4, a4, a6
    2d1e: 01 43        	li	t1, 0
    2d20: 01 27        	sext.w	a4, a4
    2d22: 13 0e a0 fd  	li	t3, -38
    2d26: af a6 07 16  	<unknown>
    2d2a: 63 95 66 00  	bne	a3, t1, 0x2d34 <__lockfile+0x4e>
    2d2e: 2f a6 e7 1e  	<unknown>
    2d32: 75 fa        	bnez	a2, 0x2d26 <__lockfile+0x40>
    2d34: 81 26        	sext.w	a3, a3
    2d36: 99 e2        	bnez	a3, 0x2d3c <__lockfile+0x56>
    2d38: 05 45        	li	a0, 1
    2d3a: 82 80        	ret
    2d3c: b3 f5 06 01  	and	a1, a3, a6
    2d40: 33 e6 06 01  	or	a2, a3, a6
    2d44: 81 25        	sext.w	a1, a1
    2d46: 01 26        	sext.w	a2, a2
    2d48: 85 c1        	beqz	a1, 0x2d68 <__lockfile+0x82>
    2d4a: 93 08 20 06  	li	a7, 98
    2d4e: 3e 85        	mv	a0, a5
    2d50: 93 05 00 08  	li	a1, 128
    2d54: 81 46        	li	a3, 0
    2d56: 73 00 00 00  	ecall
    2d5a: e3 16 c5 fd  	bne	a0, t3, 0x2d26 <__lockfile+0x40>
    2d5e: 3e 85        	mv	a0, a5
    2d60: 81 45        	li	a1, 0
    2d62: 73 00 00 00  	ecall
    2d66: c1 b7        	j	0x2d26 <__lockfile+0x40>
    2d68: af a5 07 16  	<unknown>
    2d6c: 63 95 d5 00  	bne	a1, a3, 0x2d76 <__lockfile+0x90>
    2d70: 2f a5 c7 1e  	<unknown>
    2d74: 75 f9        	bnez	a0, 0x2d68 <__lockfile+0x82>
    2d76: 81 25        	sext.w	a1, a1
    2d78: e3 97 d5 fa  	bne	a1, a3, 0x2d26 <__lockfile+0x40>
    2d7c: f9 b7        	j	0x2d4a <__lockfile+0x64>
    2d7e: 01 45        	li	a0, 0
    2d80: 82 80        	ret

0000000000002d82 <__unlockfile>:
    2d82: 13 07 c5 08  	addi	a4, a0, 140
    2d86: 01 46        	li	a2, 0
    2d88: 83 27 c5 08  	lw	a5, 140(a0)
    2d8c: 81 27        	sext.w	a5, a5
    2d8e: af 26 07 16  	<unknown>
    2d92: 63 95 f6 00  	bne	a3, a5, 0x2d9c <__unlockfile+0x1a>
    2d96: af 25 c7 1e  	<unknown>
    2d9a: f5 f9        	bnez	a1, 0x2d8e <__unlockfile+0xc>
    2d9c: 81 26        	sext.w	a3, a3
    2d9e: e3 95 d7 fe  	bne	a5, a3, 0x2d88 <__unlockfile+0x6>
    2da2: f9 83        	srli	a5, a5, 30
    2da4: 85 8b        	andi	a5, a5, 1
    2da6: 8d c3        	beqz	a5, 0x2dc8 <__unlockfile+0x46>
    2da8: 93 08 20 06  	li	a7, 98
    2dac: 3a 85        	mv	a0, a4
    2dae: 93 05 10 08  	li	a1, 129
    2db2: 05 46        	li	a2, 1
    2db4: 73 00 00 00  	ecall
    2db8: 93 07 a0 fd  	li	a5, -38
    2dbc: 63 16 f5 00  	bne	a0, a5, 0x2dc8 <__unlockfile+0x46>
    2dc0: 3a 85        	mv	a0, a4
    2dc2: 85 45        	li	a1, 1
    2dc4: 73 00 00 00  	ecall
    2dc8: 82 80        	ret

0000000000002dca <__overflow>:
    2dca: 1c 71        	ld	a5, 32(a0)
    2dcc: 01 11        	addi	sp, sp, -32
    2dce: 22 e8        	sd	s0, 16(sp)
    2dd0: 06 ec        	sd	ra, 24(sp)
    2dd2: a3 07 b1 00  	sb	a1, 15(sp)
    2dd6: 2a 84        	mv	s0, a0
    2dd8: 8d c3        	beqz	a5, 0x2dfa <__overflow+0x30>
    2dda: 1c 74        	ld	a5, 40(s0)
    2ddc: 18 70        	ld	a4, 32(s0)
    2dde: 63 96 e7 02  	bne	a5, a4, 0x2e0a <__overflow+0x40>
    2de2: 3c 64        	ld	a5, 72(s0)
    2de4: 05 46        	li	a2, 1
    2de6: 93 05 f1 00  	addi	a1, sp, 15
    2dea: 22 85        	mv	a0, s0
    2dec: 82 97        	jalr	a5
    2dee: 85 47        	li	a5, 1
    2df0: 63 18 f5 00  	bne	a0, a5, 0x2e00 <__overflow+0x36>
    2df4: 03 45 f1 00  	lbu	a0, 15(sp)
    2df8: 29 a0        	j	0x2e02 <__overflow+0x38>
    2dfa: ef 00 40 09  	jal	0x2e8e <__towrite>
    2dfe: 71 dd        	beqz	a0, 0x2dda <__overflow+0x10>
    2e00: 7d 55        	li	a0, -1
    2e02: e2 60        	ld	ra, 24(sp)
    2e04: 42 64        	ld	s0, 16(sp)
    2e06: 05 61        	addi	sp, sp, 32
    2e08: 82 80        	ret
    2e0a: 03 47 f1 00  	lbu	a4, 15(sp)
    2e0e: 83 26 04 09  	lw	a3, 144(s0)
    2e12: 1b 05 07 00  	sext.w	a0, a4
    2e16: e3 86 e6 fc  	beq	a3, a4, 0x2de2 <__overflow+0x18>
    2e1a: 93 86 17 00  	addi	a3, a5, 1
    2e1e: 14 f4        	sd	a3, 40(s0)
    2e20: 23 80 e7 00  	sb	a4, 0(a5)
    2e24: f9 bf        	j	0x2e02 <__overflow+0x38>

0000000000002e26 <dummy>:
    2e26: 82 80        	ret

0000000000002e28 <__stdio_close>:
    2e28: 28 5d        	lw	a0, 120(a0)
    2e2a: 41 11        	addi	sp, sp, -16
    2e2c: 06 e4        	sd	ra, 8(sp)
    2e2e: ef f0 9f ff  	jal	0x2e26 <dummy>
    2e32: 93 08 90 03  	li	a7, 57
    2e36: 73 00 00 00  	ecall
    2e3a: ef f0 bf d5  	jal	0x2b94 <__syscall_ret>
    2e3e: a2 60        	ld	ra, 8(sp)
    2e40: 01 25        	sext.w	a0, a0
    2e42: 41 01        	addi	sp, sp, 16
    2e44: 82 80        	ret

0000000000002e46 <__stdio_seek>:
    2e46: 28 5d        	lw	a0, 120(a0)
    2e48: 55 a4        	j	0x30ec <lseek64>

0000000000002e4a <__stdout_write>:
    2e4a: 01 11        	addi	sp, sp, -32
    2e4c: 06 ec        	sd	ra, 24(sp)
    2e4e: b2 86        	mv	a3, a2
    2e50: 17 06 00 00  	auipc	a2, 0
    2e54: 13 06 86 42  	addi	a2, a2, 1064
    2e58: 30 e5        	sd	a2, 72(a0)
    2e5a: 10 41        	lw	a2, 0(a0)
    2e5c: aa 87        	mv	a5, a0
    2e5e: 2e 87        	mv	a4, a1
    2e60: 13 76 06 04  	andi	a2, a2, 64
    2e64: 09 ee        	bnez	a2, 0x2e7e <__stdout_write+0x34>
    2e66: 95 65        	lui	a1, 5
    2e68: 28 5d        	lw	a0, 120(a0)
    2e6a: f5 48        	li	a7, 29
    2e6c: 93 85 35 41  	addi	a1, a1, 1043
    2e70: 30 00        	addi	a2, sp, 8
    2e72: 73 00 00 00  	ecall
    2e76: 01 c5        	beqz	a0, 0x2e7e <__stdout_write+0x34>
    2e78: 7d 56        	li	a2, -1
    2e7a: 23 a8 c7 08  	sw	a2, 144(a5)
    2e7e: 36 86        	mv	a2, a3
    2e80: ba 85        	mv	a1, a4
    2e82: 3e 85        	mv	a0, a5
    2e84: ef 00 40 3f  	jal	0x3278 <__stdio_write>
    2e88: e2 60        	ld	ra, 24(sp)
    2e8a: 05 61        	addi	sp, sp, 32
    2e8c: 82 80        	ret

0000000000002e8e <__towrite>:
    2e8e: 83 27 85 08  	lw	a5, 136(a0)
    2e92: 1b 87 f7 ff  	addiw	a4, a5, -1
    2e96: d9 8f        	or	a5, a5, a4
    2e98: 23 24 f5 08  	sw	a5, 136(a0)
    2e9c: 1c 41        	lw	a5, 0(a0)
    2e9e: 13 f7 87 00  	andi	a4, a5, 8
    2ea2: 11 c7        	beqz	a4, 0x2eae <__towrite+0x20>
    2ea4: 93 e7 07 02  	ori	a5, a5, 32
    2ea8: 1c c1        	sw	a5, 0(a0)
    2eaa: 7d 55        	li	a0, -1
    2eac: 82 80        	ret
    2eae: 3c 6d        	ld	a5, 88(a0)
    2eb0: 38 71        	ld	a4, 96(a0)
    2eb2: 23 38 05 00  	sd	zero, 16(a0)
    2eb6: 1c fd        	sd	a5, 56(a0)
    2eb8: 1c f5        	sd	a5, 40(a0)
    2eba: ba 97        	add	a5, a5, a4
    2ebc: 23 34 05 00  	sd	zero, 8(a0)
    2ec0: 1c f1        	sd	a5, 32(a0)
    2ec2: 01 45        	li	a0, 0
    2ec4: 82 80        	ret

0000000000002ec6 <__towrite_needs_stdio_exit>:
    2ec6: 8d ae        	j	0x3238 <__stdio_exit_needed>

0000000000002ec8 <fputs_unlocked>:
    2ec8: 79 71        	addi	sp, sp, -48
    2eca: 06 f4        	sd	ra, 40(sp)
    2ecc: 22 f0        	sd	s0, 32(sp)
    2ece: 26 ec        	sd	s1, 24(sp)
    2ed0: 2e e4        	sd	a1, 8(sp)
    2ed2: aa 84        	mv	s1, a0
    2ed4: ef 00 40 1b  	jal	0x3088 <strlen>
    2ed8: a2 66        	ld	a3, 8(sp)
    2eda: 2a 84        	mv	s0, a0
    2edc: 2a 86        	mv	a2, a0
    2ede: 85 45        	li	a1, 1
    2ee0: 26 85        	mv	a0, s1
    2ee2: ef 00 40 0b  	jal	0x2f96 <fwrite_unlocked>
    2ee6: a2 70        	ld	ra, 40(sp)
    2ee8: 01 8d        	sub	a0, a0, s0
    2eea: 02 74        	ld	s0, 32(sp)
    2eec: 33 35 a0 00  	snez	a0, a0
    2ef0: e2 64        	ld	s1, 24(sp)
    2ef2: 33 05 a0 40  	neg	a0, a0
    2ef6: 45 61        	addi	sp, sp, 48
    2ef8: 82 80        	ret

0000000000002efa <__fwritex>:
    2efa: 1c 72        	ld	a5, 32(a2)
    2efc: 79 71        	addi	sp, sp, -48
    2efe: 22 f0        	sd	s0, 32(sp)
    2f00: 4a e8        	sd	s2, 16(sp)
    2f02: 4e e4        	sd	s3, 8(sp)
    2f04: 06 f4        	sd	ra, 40(sp)
    2f06: 26 ec        	sd	s1, 24(sp)
    2f08: aa 89        	mv	s3, a0
    2f0a: 2e 89        	mv	s2, a1
    2f0c: 32 84        	mv	s0, a2
    2f0e: 8d c3        	beqz	a5, 0x2f30 <__fwritex+0x36>
    2f10: 1c 70        	ld	a5, 32(s0)
    2f12: 18 74        	ld	a4, 40(s0)
    2f14: 99 8f        	sub	a5, a5, a4
    2f16: 63 f3 27 03  	bgeu	a5, s2, 0x2f3c <__fwritex+0x42>
    2f1a: 3c 64        	ld	a5, 72(s0)
    2f1c: 22 85        	mv	a0, s0
    2f1e: 02 74        	ld	s0, 32(sp)
    2f20: a2 70        	ld	ra, 40(sp)
    2f22: e2 64        	ld	s1, 24(sp)
    2f24: 4a 86        	mv	a2, s2
    2f26: ce 85        	mv	a1, s3
    2f28: 42 69        	ld	s2, 16(sp)
    2f2a: a2 69        	ld	s3, 8(sp)
    2f2c: 45 61        	addi	sp, sp, 48
    2f2e: 82 87        	jr	a5
    2f30: 32 85        	mv	a0, a2
    2f32: ef f0 df f5  	jal	0x2e8e <__towrite>
    2f36: 69 dd        	beqz	a0, 0x2f10 <__fwritex+0x16>
    2f38: 01 45        	li	a0, 0
    2f3a: 05 a0        	j	0x2f5a <__fwritex+0x60>
    2f3c: 83 27 04 09  	lw	a5, 144(s0)
    2f40: ca 84        	mv	s1, s2
    2f42: 29 47        	li	a4, 10
    2f44: 63 d3 07 02  	bgez	a5, 0x2f6a <__fwritex+0x70>
    2f48: 08 74        	ld	a0, 40(s0)
    2f4a: 26 86        	mv	a2, s1
    2f4c: ce 85        	mv	a1, s3
    2f4e: ef f0 cf b1  	jal	0x226a <memcpy>
    2f52: 1c 74        	ld	a5, 40(s0)
    2f54: 4a 85        	mv	a0, s2
    2f56: a6 97        	add	a5, a5, s1
    2f58: 1c f4        	sd	a5, 40(s0)
    2f5a: a2 70        	ld	ra, 40(sp)
    2f5c: 02 74        	ld	s0, 32(sp)
    2f5e: e2 64        	ld	s1, 24(sp)
    2f60: 42 69        	ld	s2, 16(sp)
    2f62: a2 69        	ld	s3, 8(sp)
    2f64: 45 61        	addi	sp, sp, 48
    2f66: 82 80        	ret
    2f68: be 84        	mv	s1, a5
    2f6a: 85 c4        	beqz	s1, 0x2f92 <__fwritex+0x98>
    2f6c: 93 87 f4 ff  	addi	a5, s1, -1
    2f70: b3 86 f9 00  	add	a3, s3, a5
    2f74: 83 c6 06 00  	lbu	a3, 0(a3)
    2f78: e3 98 e6 fe  	bne	a3, a4, 0x2f68 <__fwritex+0x6e>
    2f7c: 3c 64        	ld	a5, 72(s0)
    2f7e: 26 86        	mv	a2, s1
    2f80: ce 85        	mv	a1, s3
    2f82: 22 85        	mv	a0, s0
    2f84: 82 97        	jalr	a5
    2f86: e3 6a 95 fc  	bltu	a0, s1, 0x2f5a <__fwritex+0x60>
    2f8a: a6 99        	add	s3, s3, s1
    2f8c: b3 04 99 40  	sub	s1, s2, s1
    2f90: 65 bf        	j	0x2f48 <__fwritex+0x4e>
    2f92: ca 84        	mv	s1, s2
    2f94: 55 bf        	j	0x2f48 <__fwritex+0x4e>

0000000000002f96 <fwrite_unlocked>:
    2f96: 39 71        	addi	sp, sp, -64
    2f98: 22 f8        	sd	s0, 48(sp)
    2f9a: 26 f4        	sd	s1, 40(sp)
    2f9c: 4a f0        	sd	s2, 32(sp)
    2f9e: 4e ec        	sd	s3, 24(sp)
    2fa0: 56 e4        	sd	s5, 8(sp)
    2fa2: 06 fc        	sd	ra, 56(sp)
    2fa4: 52 e8        	sd	s4, 16(sp)
    2fa6: b3 8a c5 02  	<unknown>
    2faa: aa 89        	mv	s3, a0
    2fac: 2e 89        	mv	s2, a1
    2fae: b6 84        	mv	s1, a3
    2fb0: 01 44        	li	s0, 0
    2fb2: 91 c1        	beqz	a1, 0x2fb6 <fwrite_unlocked+0x20>
    2fb4: 32 84        	mv	s0, a2
    2fb6: 83 a7 c4 08  	lw	a5, 140(s1)
    2fba: 01 4a        	li	s4, 0
    2fbc: 63 c6 07 00  	bltz	a5, 0x2fc8 <fwrite_unlocked+0x32>
    2fc0: 26 85        	mv	a0, s1
    2fc2: ef f0 5f d2  	jal	0x2ce6 <__lockfile>
    2fc6: 2a 8a        	mv	s4, a0
    2fc8: 4e 85        	mv	a0, s3
    2fca: 26 86        	mv	a2, s1
    2fcc: d6 85        	mv	a1, s5
    2fce: ef f0 df f2  	jal	0x2efa <__fwritex>
    2fd2: aa 89        	mv	s3, a0
    2fd4: 63 05 0a 00  	beqz	s4, 0x2fde <fwrite_unlocked+0x48>
    2fd8: 26 85        	mv	a0, s1
    2fda: ef f0 9f da  	jal	0x2d82 <__unlockfile>
    2fde: 63 84 3a 01  	beq	s5, s3, 0x2fe6 <fwrite_unlocked+0x50>
    2fe2: 33 d4 29 03  	<unknown>
    2fe6: e2 70        	ld	ra, 56(sp)
    2fe8: 22 85        	mv	a0, s0
    2fea: 42 74        	ld	s0, 48(sp)
    2fec: a2 74        	ld	s1, 40(sp)
    2fee: 02 79        	ld	s2, 32(sp)
    2ff0: e2 69        	ld	s3, 24(sp)
    2ff2: 42 6a        	ld	s4, 16(sp)
    2ff4: a2 6a        	ld	s5, 8(sp)
    2ff6: 21 61        	addi	sp, sp, 64
    2ff8: 82 80        	ret

0000000000002ffa <memchr>:
    2ffa: 13 77 75 00  	andi	a4, a0, 7
    2ffe: aa 87        	mv	a5, a0
    3000: 93 f5 f5 0f  	andi	a1, a1, 255
    3004: 19 cb        	beqz	a4, 0x301a <memchr+0x20>
    3006: 25 ce        	beqz	a2, 0x307e <memchr+0x84>
    3008: 03 c7 07 00  	lbu	a4, 0(a5)
    300c: 63 0e b7 04  	beq	a4, a1, 0x3068 <memchr+0x6e>
    3010: 85 07        	addi	a5, a5, 1
    3012: 13 f7 77 00  	andi	a4, a5, 7
    3016: 7d 16        	addi	a2, a2, -1
    3018: 7d f7        	bnez	a4, 0x3006 <memchr+0xc>
    301a: 01 45        	li	a0, 0
    301c: 35 c2        	beqz	a2, 0x3080 <memchr+0x86>
    301e: 03 c7 07 00  	lbu	a4, 0(a5)
    3022: 63 03 b7 04  	beq	a4, a1, 0x3068 <memchr+0x6e>
    3026: 17 35 00 00  	auipc	a0, 3
    302a: 03 35 a5 f1  	ld	a0, -230(a0)
    302e: 1d 47        	li	a4, 7
    3030: 33 85 a5 02  	<unknown>
    3034: 63 7a c7 02  	bgeu	a4, a2, 0x3068 <memchr+0x6e>
    3038: 97 38 00 00  	auipc	a7, 3
    303c: 83 b8 08 f1  	ld	a7, -240(a7)
    3040: 17 38 00 00  	auipc	a6, 3
    3044: 03 38 08 f1  	ld	a6, -240(a6)
    3048: 1d 43        	li	t1, 7
    304a: 29 a0        	j	0x3054 <memchr+0x5a>
    304c: 61 16        	addi	a2, a2, -8
    304e: a1 07        	addi	a5, a5, 8
    3050: 63 79 c3 02  	bgeu	t1, a2, 0x3082 <memchr+0x88>
    3054: 98 63        	ld	a4, 0(a5)
    3056: 29 8f        	xor	a4, a4, a0
    3058: b3 06 17 01  	add	a3, a4, a7
    305c: 13 47 f7 ff  	not	a4, a4
    3060: 75 8f        	and	a4, a4, a3
    3062: 33 77 07 01  	and	a4, a4, a6
    3066: 7d d3        	beqz	a4, 0x304c <memchr+0x52>
    3068: 3e 85        	mv	a0, a5
    306a: b2 97        	add	a5, a5, a2
    306c: 21 a0        	j	0x3074 <memchr+0x7a>
    306e: 05 05        	addi	a0, a0, 1
    3070: 63 07 f5 00  	beq	a0, a5, 0x307e <memchr+0x84>
    3074: 03 47 05 00  	lbu	a4, 0(a0)
    3078: e3 1b b7 fe  	bne	a4, a1, 0x306e <memchr+0x74>
    307c: 82 80        	ret
    307e: 01 45        	li	a0, 0
    3080: 82 80        	ret
    3082: 01 45        	li	a0, 0
    3084: 75 f2        	bnez	a2, 0x3068 <memchr+0x6e>
    3086: 82 80        	ret

0000000000003088 <strlen>:
    3088: 93 77 75 00  	andi	a5, a0, 7
    308c: 89 cf        	beqz	a5, 0x30a6 <strlen+0x1e>
    308e: aa 87        	mv	a5, a0
    3090: 29 a0        	j	0x309a <strlen+0x12>
    3092: 85 07        	addi	a5, a5, 1
    3094: 13 f7 77 00  	andi	a4, a5, 7
    3098: 01 cb        	beqz	a4, 0x30a8 <strlen+0x20>
    309a: 03 c7 07 00  	lbu	a4, 0(a5)
    309e: 75 fb        	bnez	a4, 0x3092 <strlen+0xa>
    30a0: 33 85 a7 40  	sub	a0, a5, a0
    30a4: 82 80        	ret
    30a6: aa 87        	mv	a5, a0
    30a8: 94 63        	ld	a3, 0(a5)
    30aa: 97 35 00 00  	auipc	a1, 3
    30ae: 83 b5 e5 e9  	ld	a1, -354(a1)
    30b2: 17 36 00 00  	auipc	a2, 3
    30b6: 03 36 e6 e9  	ld	a2, -354(a2)
    30ba: 19 a0        	j	0x30c0 <strlen+0x38>
    30bc: 94 67        	ld	a3, 8(a5)
    30be: a1 07        	addi	a5, a5, 8
    30c0: 33 87 b6 00  	add	a4, a3, a1
    30c4: 93 c6 f6 ff  	not	a3, a3
    30c8: 75 8f        	and	a4, a4, a3
    30ca: 71 8f        	and	a4, a4, a2
    30cc: 65 db        	beqz	a4, 0x30bc <strlen+0x34>
    30ce: 03 c7 07 00  	lbu	a4, 0(a5)
    30d2: 79 d7        	beqz	a4, 0x30a0 <strlen+0x18>
    30d4: 03 c7 17 00  	lbu	a4, 1(a5)
    30d8: 85 07        	addi	a5, a5, 1
    30da: 79 d3        	beqz	a4, 0x30a0 <strlen+0x18>
    30dc: 03 c7 17 00  	lbu	a4, 1(a5)
    30e0: 85 07        	addi	a5, a5, 1
    30e2: 6d fb        	bnez	a4, 0x30d4 <strlen+0x4c>
    30e4: 75 bf        	j	0x30a0 <strlen+0x18>

00000000000030e6 <__set_thread_area>:
    30e6: 2a 82        	mv	tp, a0
    30e8: 01 45        	li	a0, 0
    30ea: 82 80        	ret

00000000000030ec <lseek64>:
    30ec: 93 08 e0 03  	li	a7, 62
    30f0: 73 00 00 00  	ecall
    30f4: 6f f0 1f aa  	j	0x2b94 <__syscall_ret>

00000000000030f8 <wcrtomb>:
    30f8: 09 c9        	beqz	a0, 0x310a <wcrtomb+0x12>
    30fa: 93 06 f0 07  	li	a3, 127
    30fe: 9b 87 05 00  	sext.w	a5, a1
    3102: 63 ec b6 00  	bltu	a3, a1, 0x311a <wcrtomb+0x22>
    3106: 23 00 b5 00  	sb	a1, 0(a0)
    310a: 05 45        	li	a0, 1
    310c: 82 80        	ret
    310e: 23 00 b5 00  	sb	a1, 0(a0)
    3112: 05 45        	li	a0, 1
    3114: a2 60        	ld	ra, 8(sp)
    3116: 41 01        	addi	sp, sp, 16
    3118: 82 80        	ret
    311a: 41 11        	addi	sp, sp, -16
    311c: 06 e4        	sd	ra, 8(sp)
    311e: 12 87        	mv	a4, tp
    3120: 03 37 07 fd  	ld	a4, -48(a4)
    3124: 18 63        	ld	a4, 0(a4)
    3126: 11 ef        	bnez	a4, 0x3142 <wcrtomb+0x4a>
    3128: 49 77        	lui	a4, 1048562
    312a: 1b 07 07 08  	addiw	a4, a4, 128
    312e: b9 9f        	addw	a5, a5, a4
    3130: e3 ff f6 fc  	bgeu	a3, a5, 0x310e <wcrtomb+0x16>
    3134: ef f0 7f a1  	jal	0x2b4a <__errno_location>
    3138: 93 07 40 05  	li	a5, 84
    313c: 1c c1        	sw	a5, 0(a0)
    313e: 7d 55        	li	a0, -1
    3140: d1 bf        	j	0x3114 <wcrtomb+0x1c>
    3142: 13 07 f0 7f  	li	a4, 2047
    3146: 63 60 f7 02  	bltu	a4, a5, 0x3166 <wcrtomb+0x6e>
    314a: 9b d7 65 40  	sraiw	a5, a1, 6
    314e: 93 f5 f5 03  	andi	a1, a1, 63
    3152: 93 e7 07 fc  	ori	a5, a5, -64
    3156: 93 e5 05 f8  	ori	a1, a1, -128
    315a: 23 00 f5 00  	sb	a5, 0(a0)
    315e: a3 00 b5 00  	sb	a1, 1(a0)
    3162: 09 45        	li	a0, 2
    3164: 45 bf        	j	0x3114 <wcrtomb+0x1c>
    3166: 35 67        	lui	a4, 13
    3168: 13 07 f7 7f  	addi	a4, a4, 2047
    316c: 63 77 f7 00  	bgeu	a4, a5, 0x317a <wcrtomb+0x82>
    3170: 49 77        	lui	a4, 1048562
    3172: 3d 9f        	addw	a4, a4, a5
    3174: 89 66        	lui	a3, 2
    3176: 63 78 d7 02  	bgeu	a4, a3, 0x31a6 <wcrtomb+0xae>
    317a: 9b d7 c5 40  	sraiw	a5, a1, 12
    317e: 93 e7 07 fe  	ori	a5, a5, -32
    3182: 23 00 f5 00  	sb	a5, 0(a0)
    3186: 9b d7 65 40  	sraiw	a5, a1, 6
    318a: 93 f7 f7 03  	andi	a5, a5, 63
    318e: 93 f5 f5 03  	andi	a1, a1, 63
    3192: 93 e7 07 f8  	ori	a5, a5, -128
    3196: 93 e5 05 f8  	ori	a1, a1, -128
    319a: a3 00 f5 00  	sb	a5, 1(a0)
    319e: 23 01 b5 00  	sb	a1, 2(a0)
    31a2: 0d 45        	li	a0, 3
    31a4: 85 bf        	j	0x3114 <wcrtomb+0x1c>
    31a6: 41 77        	lui	a4, 1048560
    31a8: b9 9f        	addw	a5, a5, a4
    31aa: 37 07 10 00  	lui	a4, 256
    31ae: e3 f3 e7 f8  	bgeu	a5, a4, 0x3134 <wcrtomb+0x3c>
    31b2: 9b d7 25 41  	sraiw	a5, a1, 18
    31b6: 93 e7 07 ff  	ori	a5, a5, -16
    31ba: 23 00 f5 00  	sb	a5, 0(a0)
    31be: 9b d7 c5 40  	sraiw	a5, a1, 12
    31c2: 93 f7 f7 03  	andi	a5, a5, 63
    31c6: 93 e7 07 f8  	ori	a5, a5, -128
    31ca: a3 00 f5 00  	sb	a5, 1(a0)
    31ce: 9b d7 65 40  	sraiw	a5, a1, 6
    31d2: 93 f7 f7 03  	andi	a5, a5, 63
    31d6: 93 f5 f5 03  	andi	a1, a1, 63
    31da: 93 e7 07 f8  	ori	a5, a5, -128
    31de: 93 e5 05 f8  	ori	a1, a1, -128
    31e2: 23 01 f5 00  	sb	a5, 2(a0)
    31e6: a3 01 b5 00  	sb	a1, 3(a0)
    31ea: 11 45        	li	a0, 4
    31ec: 25 b7        	j	0x3114 <wcrtomb+0x1c>

00000000000031ee <close_file>:
    31ee: 21 c5        	beqz	a0, 0x3236 <close_file+0x48>
    31f0: 83 27 c5 08  	lw	a5, 140(a0)
    31f4: 41 11        	addi	sp, sp, -16
    31f6: 22 e0        	sd	s0, 0(sp)
    31f8: 06 e4        	sd	ra, 8(sp)
    31fa: 2a 84        	mv	s0, a0
    31fc: 63 c4 07 00  	bltz	a5, 0x3204 <close_file+0x16>
    3200: ef f0 7f ae  	jal	0x2ce6 <__lockfile>
    3204: 18 74        	ld	a4, 40(s0)
    3206: 1c 7c        	ld	a5, 56(s0)
    3208: 63 07 f7 00  	beq	a4, a5, 0x3216 <close_file+0x28>
    320c: 3c 64        	ld	a5, 72(s0)
    320e: 01 46        	li	a2, 0
    3210: 81 45        	li	a1, 0
    3212: 22 85        	mv	a0, s0
    3214: 82 97        	jalr	a5
    3216: 0c 64        	ld	a1, 8(s0)
    3218: 1c 68        	ld	a5, 16(s0)
    321a: 63 8a f5 00  	beq	a1, a5, 0x322e <close_file+0x40>
    321e: 38 68        	ld	a4, 80(s0)
    3220: 22 85        	mv	a0, s0
    3222: 02 64        	ld	s0, 0(sp)
    3224: a2 60        	ld	ra, 8(sp)
    3226: 05 46        	li	a2, 1
    3228: 9d 8d        	sub	a1, a1, a5
    322a: 41 01        	addi	sp, sp, 16
    322c: 02 87        	jr	a4
    322e: a2 60        	ld	ra, 8(sp)
    3230: 02 64        	ld	s0, 0(sp)
    3232: 41 01        	addi	sp, sp, 16
    3234: 82 80        	ret
    3236: 82 80        	ret

0000000000003238 <__stdio_exit_needed>:
    3238: 41 11        	addi	sp, sp, -16
    323a: 22 e0        	sd	s0, 0(sp)
    323c: 06 e4        	sd	ra, 8(sp)
    323e: ef 00 00 0e  	jal	0x331e <__ofl_lock>
    3242: 00 61        	ld	s0, 0(a0)
    3244: 0d e4        	bnez	s0, 0x326e <__stdio_exit_needed+0x36>
    3246: 17 55 00 00  	auipc	a0, 5
    324a: 03 35 25 5e  	ld	a0, 1506(a0)
    324e: ef f0 1f fa  	jal	0x31ee <close_file>
    3252: 17 55 00 00  	auipc	a0, 5
    3256: 03 35 65 ea  	ld	a0, -346(a0)
    325a: ef f0 5f f9  	jal	0x31ee <close_file>
    325e: 02 64        	ld	s0, 0(sp)
    3260: a2 60        	ld	ra, 8(sp)
    3262: 17 55 00 00  	auipc	a0, 5
    3266: 03 35 65 5c  	ld	a0, 1478(a0)
    326a: 41 01        	addi	sp, sp, 16
    326c: 49 b7        	j	0x31ee <close_file>
    326e: 22 85        	mv	a0, s0
    3270: ef f0 ff f7  	jal	0x31ee <close_file>
    3274: 20 78        	ld	s0, 112(s0)
    3276: f9 b7        	j	0x3244 <__stdio_exit_needed+0xc>

0000000000003278 <__stdio_write>:
    3278: 5d 71        	addi	sp, sp, -80
    327a: 1c 7d        	ld	a5, 56(a0)
    327c: 4e f4        	sd	s3, 40(sp)
    327e: 83 39 85 02  	ld	s3, 40(a0)
    3282: a2 e0        	sd	s0, 64(sp)
    3284: 26 fc        	sd	s1, 56(sp)
    3286: b3 89 f9 40  	sub	s3, s3, a5
    328a: 4a f8        	sd	s2, 48(sp)
    328c: 52 f0        	sd	s4, 32(sp)
    328e: 4e e4        	sd	s3, 8(sp)
    3290: 86 e4        	sd	ra, 72(sp)
    3292: 2a 84        	mv	s0, a0
    3294: 32 89        	mv	s2, a2
    3296: 3e e0        	sd	a5, 0(sp)
    3298: 2e e8        	sd	a1, 16(sp)
    329a: 32 ec        	sd	a2, 24(sp)
    329c: b2 99        	add	s3, s3, a2
    329e: 09 4a        	li	s4, 2
    32a0: 8a 84        	mv	s1, sp
    32a2: 28 5c        	lw	a0, 120(s0)
    32a4: 93 08 20 04  	li	a7, 66
    32a8: a6 85        	mv	a1, s1
    32aa: 52 86        	mv	a2, s4
    32ac: 73 00 00 00  	ecall
    32b0: ef f0 5f 8e  	jal	0x2b94 <__syscall_ret>
    32b4: 63 91 a9 02  	bne	s3, a0, 0x32d6 <__stdio_write+0x5e>
    32b8: 3c 6c        	ld	a5, 88(s0)
    32ba: 38 70        	ld	a4, 96(s0)
    32bc: 1c fc        	sd	a5, 56(s0)
    32be: 3e 97        	add	a4, a4, a5
    32c0: 18 f0        	sd	a4, 32(s0)
    32c2: 1c f4        	sd	a5, 40(s0)
    32c4: a6 60        	ld	ra, 72(sp)
    32c6: 06 64        	ld	s0, 64(sp)
    32c8: e2 74        	ld	s1, 56(sp)
    32ca: a2 79        	ld	s3, 40(sp)
    32cc: 02 7a        	ld	s4, 32(sp)
    32ce: 4a 85        	mv	a0, s2
    32d0: 42 79        	ld	s2, 48(sp)
    32d2: 61 61        	addi	sp, sp, 80
    32d4: 82 80        	ret
    32d6: 63 53 05 02  	bgez	a0, 0x32fc <__stdio_write+0x84>
    32da: 1c 40        	lw	a5, 0(s0)
    32dc: 23 30 04 02  	sd	zero, 32(s0)
    32e0: 23 3c 04 02  	sd	zero, 56(s0)
    32e4: 93 e7 07 02  	ori	a5, a5, 32
    32e8: 1c c0        	sw	a5, 0(s0)
    32ea: 23 34 04 02  	sd	zero, 40(s0)
    32ee: 89 47        	li	a5, 2
    32f0: 63 05 fa 02  	beq	s4, a5, 0x331a <__stdio_write+0xa2>
    32f4: 9c 64        	ld	a5, 8(s1)
    32f6: 33 09 f9 40  	sub	s2, s2, a5
    32fa: e9 b7        	j	0x32c4 <__stdio_write+0x4c>
    32fc: 9c 64        	ld	a5, 8(s1)
    32fe: b3 89 a9 40  	sub	s3, s3, a0
    3302: 63 f5 a7 00  	bgeu	a5, a0, 0x330c <__stdio_write+0x94>
    3306: 1d 8d        	sub	a0, a0, a5
    3308: c1 04        	addi	s1, s1, 16
    330a: 7d 3a        	addiw	s4, s4, -1
    330c: 9c 60        	ld	a5, 0(s1)
    330e: aa 97        	add	a5, a5, a0
    3310: 9c e0        	sd	a5, 0(s1)
    3312: 9c 64        	ld	a5, 8(s1)
    3314: 89 8f        	sub	a5, a5, a0
    3316: 9c e4        	sd	a5, 8(s1)
    3318: 69 b7        	j	0x32a2 <__stdio_write+0x2a>
    331a: 01 49        	li	s2, 0
    331c: 65 b7        	j	0x32c4 <__stdio_write+0x4c>

000000000000331e <__ofl_lock>:
    331e: 41 11        	addi	sp, sp, -16
    3320: 17 55 00 00  	auipc	a0, 5
    3324: 13 05 85 51  	addi	a0, a0, 1304
    3328: 06 e4        	sd	ra, 8(sp)
    332a: ef f0 ef c8  	jal	0x27b8 <__lock>
    332e: a2 60        	ld	ra, 8(sp)
    3330: 17 55 00 00  	auipc	a0, 5
    3334: 13 05 05 50  	addi	a0, a0, 1280
    3338: 41 01        	addi	sp, sp, 16
    333a: 82 80        	ret

000000000000333c <__ofl_unlock>:
    333c: 17 55 00 00  	auipc	a0, 5
    3340: 13 05 c5 4f  	addi	a0, a0, 1276
    3344: 6f f0 6f d4  	j	0x288a <__unlock>

0000000000003348 <__addtf3>:
    3348: 79 71        	addi	sp, sp, -48
    334a: 06 f4        	sd	ra, 40(sp)
    334c: 22 f0        	sd	s0, 32(sp)
    334e: 26 ec        	sd	s1, 24(sp)
    3350: 4a e8        	sd	s2, 16(sp)
    3352: 4e e4        	sd	s3, 8(sp)
    3354: 52 e0        	sd	s4, 0(sp)
    3356: f3 29 20 00  	csrr	s3, frm
    335a: fd 58        	li	a7, -1
    335c: 93 d7 08 01  	srli	a5, a7, 16
    3360: 33 f8 f5 00  	and	a6, a1, a5
    3364: a1 62        	lui	t0, 8
    3366: f5 8f        	and	a5, a5, a3
    3368: 13 8f f2 ff  	addi	t5, t0, -1
    336c: 13 d7 05 03  	srli	a4, a1, 48
    3370: 13 d3 06 03  	srli	t1, a3, 48
    3374: 13 5e d6 03  	srli	t3, a2, 61
    3378: 0e 08        	slli	a6, a6, 3
    337a: 93 5e d5 03  	srli	t4, a0, 61
    337e: 8e 07        	slli	a5, a5, 3
    3380: 13 d4 f5 03  	srli	s0, a1, 63
    3384: fd 92        	srli	a3, a3, 63
    3386: b3 74 e7 01  	and	s1, a4, t5
    338a: 81 29        	sext.w	s3, s3
    338c: 33 67 fe 00  	or	a4, t3, a5
    3390: 33 e8 0e 01  	or	a6, t4, a6
    3394: 93 1f 35 00  	slli	t6, a0, 3
    3398: 33 73 e3 01  	and	t1, t1, t5
    339c: 13 1e 36 00  	slli	t3, a2, 3
    33a0: 63 0e d4 1c  	beq	s0, a3, 0x357c <__addtf3+0x234>
    33a4: bb 8e 64 40  	subw	t4, s1, t1
    33a8: 9b 87 0e 00  	sext.w	a5, t4
    33ac: 63 5d f0 16  	blez	a5, 0x3526 <__addtf3+0x1de>
    33b0: 63 00 03 22  	beqz	t1, 0x35d0 <__addtf3+0x288>
    33b4: 63 88 e4 23  	beq	s1, t5, 0x35e4 <__addtf3+0x29c>
    33b8: 85 46        	li	a3, 1
    33ba: ce 16        	slli	a3, a3, 51
    33bc: 55 8f        	or	a4, a4, a3
    33be: 93 06 40 07  	li	a3, 116
    33c2: 63 c7 f6 3e  	blt	a3, a5, 0x37b0 <__addtf3+0x468>
    33c6: 93 06 f0 03  	li	a3, 63
    33ca: 63 ca f6 56  	blt	a3, a5, 0x393e <__addtf3+0x5f6>
    33ce: 93 06 00 04  	li	a3, 64
    33d2: 9d 9e        	subw	a3, a3, a5
    33d4: 33 19 d7 00  	sll	s2, a4, a3
    33d8: 33 56 fe 00  	srl	a2, t3, a5
    33dc: b3 16 de 00  	sll	a3, t3, a3
    33e0: 33 69 c9 00  	or	s2, s2, a2
    33e4: b3 36 d0 00  	snez	a3, a3
    33e8: 33 57 f7 00  	srl	a4, a4, a5
    33ec: 33 69 d9 00  	or	s2, s2, a3
    33f0: 33 08 e8 40  	sub	a6, a6, a4
    33f4: 33 89 2f 41  	sub	s2, t6, s2
    33f8: b3 bf 2f 01  	sltu	t6, t6, s2
    33fc: 33 08 f8 41  	sub	a6, a6, t6
    3400: 93 57 38 03  	srli	a5, a6, 51
    3404: 85 8b        	andi	a5, a5, 1
    3406: 63 85 07 2c  	beqz	a5, 0x36d0 <__addtf3+0x388>
    340a: 13 1a d8 00  	slli	s4, a6, 13
    340e: 13 5a da 00  	srli	s4, s4, 13
    3412: 63 0f 0a 2e  	beqz	s4, 0x3710 <__addtf3+0x3c8>
    3416: 52 85        	mv	a0, s4
    3418: ef 10 b0 5b  	jal	0x51d2 <__clzdi2>
    341c: 51 35        	addiw	a0, a0, -12
    341e: 13 08 00 04  	li	a6, 64
    3422: 3b 08 a8 40  	subw	a6, a6, a0
    3426: 33 1a aa 00  	sll	s4, s4, a0
    342a: 33 58 09 01  	srl	a6, s2, a6
    342e: 33 68 48 01  	or	a6, a6, s4
    3432: 33 1a a9 00  	sll	s4, s2, a0
    3436: 63 46 95 28  	blt	a0, s1, 0x36c2 <__addtf3+0x37a>
    343a: 05 9d        	subw	a0, a0, s1
    343c: 1b 07 15 00  	addiw	a4, a0, 1
    3440: 93 07 f0 03  	li	a5, 63
    3444: 63 c7 e7 4c  	blt	a5, a4, 0x3912 <__addtf3+0x5ca>
    3448: 93 07 00 04  	li	a5, 64
    344c: 99 9f        	subw	a5, a5, a4
    344e: 33 19 f8 00  	sll	s2, a6, a5
    3452: b3 56 ea 00  	srl	a3, s4, a4
    3456: b3 17 fa 00  	sll	a5, s4, a5
    345a: 33 69 d9 00  	or	s2, s2, a3
    345e: b3 37 f0 00  	snez	a5, a5
    3462: 33 69 f9 00  	or	s2, s2, a5
    3466: 33 58 e8 00  	srl	a6, a6, a4
    346a: b3 65 09 01  	or	a1, s2, a6
    346e: 63 80 05 1e  	beqz	a1, 0x364e <__addtf3+0x306>
    3472: 93 75 79 00  	andi	a1, s2, 7
    3476: 93 16 19 00  	slli	a3, s2, 1
    347a: 93 57 f9 03  	srli	a5, s2, 63
    347e: 13 17 18 00  	slli	a4, a6, 1
    3482: 13 f6 76 00  	andi	a2, a3, 7
    3486: 3e 97        	add	a4, a4, a5
    3488: 81 47        	li	a5, 0
    348a: 11 ca        	beqz	a2, 0x349e <__addtf3+0x156>
    348c: 89 47        	li	a5, 2
    348e: 63 80 f9 6a  	beq	s3, a5, 0x3b2e <__addtf3+0x7e6>
    3492: 8d 47        	li	a5, 3
    3494: 63 82 f9 68  	beq	s3, a5, 0x3b18 <__addtf3+0x7d0>
    3498: 85 47        	li	a5, 1
    349a: 63 82 09 66  	beqz	s3, 0x3afe <__addtf3+0x7b6>
    349e: 85 46        	li	a3, 1
    34a0: 13 96 46 03  	slli	a2, a3, 52
    34a4: 71 8f        	and	a4, a4, a2
    34a6: 13 36 17 00  	seqz	a2, a4
    34aa: 81 44        	li	s1, 0
    34ac: 63 85 05 6a  	beqz	a1, 0x3b56 <__addtf3+0x80e>
    34b0: 89 47        	li	a5, 2
    34b2: 63 89 f9 2c  	beq	s3, a5, 0x3784 <__addtf3+0x43c>
    34b6: 8d 47        	li	a5, 3
    34b8: 63 82 f9 2e  	beq	s3, a5, 0x379c <__addtf3+0x454>
    34bc: 85 47        	li	a5, 1
    34be: 63 84 09 1e  	beqz	s3, 0x36a6 <__addtf3+0x35e>
    34c2: 19 c2        	beqz	a2, 0x34c8 <__addtf3+0x180>
    34c4: 93 e7 27 00  	ori	a5, a5, 2
    34c8: 85 46        	li	a3, 1
    34ca: ce 16        	slli	a3, a3, 51
    34cc: b3 76 d8 00  	and	a3, a6, a3
    34d0: 63 8f 06 1a  	beqz	a3, 0x368e <__addtf3+0x346>
    34d4: a1 66        	lui	a3, 8
    34d6: 13 87 14 00  	addi	a4, s1, 1
    34da: 13 86 f6 ff  	addi	a2, a3, -1
    34de: 63 08 c7 20  	beq	a4, a2, 0x36ee <__addtf3+0x3a6>
    34e2: fd 56        	li	a3, -1
    34e4: 93 95 36 03  	slli	a1, a3, 51
    34e8: fd 15        	addi	a1, a1, -1
    34ea: b3 75 b8 00  	and	a1, a6, a1
    34ee: 71 8f        	and	a4, a4, a2
    34f0: 13 95 d5 03  	slli	a0, a1, 61
    34f4: 13 59 39 00  	srli	s2, s2, 3
    34f8: 8d 81        	srli	a1, a1, 3
    34fa: c1 82        	srli	a3, a3, 16
    34fc: 42 17        	slli	a4, a4, 48
    34fe: 33 65 25 01  	or	a0, a0, s2
    3502: f5 8d        	and	a1, a1, a3
    3504: 41 93        	srli	a4, a4, 48
    3506: 3e 04        	slli	s0, s0, 15
    3508: c2 05        	slli	a1, a1, 16
    350a: 59 8c        	or	s0, s0, a4
    350c: 42 14        	slli	s0, s0, 48
    350e: c1 81        	srli	a1, a1, 16
    3510: c1 8d        	or	a1, a1, s0
    3512: 63 91 07 2c  	bnez	a5, 0x37d4 <__addtf3+0x48c>
    3516: a2 70        	ld	ra, 40(sp)
    3518: 02 74        	ld	s0, 32(sp)
    351a: e2 64        	ld	s1, 24(sp)
    351c: 42 69        	ld	s2, 16(sp)
    351e: a2 69        	ld	s3, 8(sp)
    3520: 02 6a        	ld	s4, 0(sp)
    3522: 45 61        	addi	sp, sp, 48
    3524: 82 80        	ret
    3526: e9 cb        	beqz	a5, 0x35f8 <__addtf3+0x2b0>
    3528: 63 9f 04 32  	bnez	s1, 0x3866 <__addtf3+0x51e>
    352c: b3 67 f8 01  	or	a5, a6, t6
    3530: 63 85 07 50  	beqz	a5, 0x3a3a <__addtf3+0x6f2>
    3534: 93 ce fe ff  	not	t4, t4
    3538: 81 2e        	sext.w	t4, t4
    353a: 63 87 0e 6a  	beqz	t4, 0x3be8 <__addtf3+0x8a0>
    353e: 63 1c e3 33  	bne	t1, t5, 0x3876 <__addtf3+0x52e>
    3542: 33 6e c7 01  	or	t3, a4, t3
    3546: 63 0d 0e 6a  	beqz	t3, 0x3c00 <__addtf3+0x8b8>
    354a: 93 57 27 03  	srli	a5, a4, 50
    354e: 13 d5 38 00  	srli	a0, a7, 3
    3552: 93 c7 17 00  	xori	a5, a5, 1
    3556: 93 15 d7 03  	slli	a1, a4, 61
    355a: 85 8b        	andi	a5, a5, 1
    355c: 69 8e        	and	a2, a2, a0
    355e: 33 65 b6 00  	or	a0, a2, a1
    3562: 92 07        	slli	a5, a5, 4
    3564: 93 55 37 00  	srli	a1, a4, 3
    3568: 36 84        	mv	s0, a3
    356a: 4d 8d        	or	a0, a0, a1
    356c: 49 c1        	beqz	a0, 0x35ee <__addtf3+0x2a6>
    356e: 21 67        	lui	a4, 8
    3570: 85 45        	li	a1, 1
    3572: 01 44        	li	s0, 0
    3574: 7d 17        	addi	a4, a4, -1
    3576: be 15        	slli	a1, a1, 47
    3578: 01 45        	li	a0, 0
    357a: 71 b7        	j	0x3506 <__addtf3+0x1be>
    357c: bb 86 64 40  	subw	a3, s1, t1
    3580: 9b 87 06 00  	sext.w	a5, a3
    3584: 63 54 f0 1a  	blez	a5, 0x372c <__addtf3+0x3e4>
    3588: 63 0c 03 0c  	beqz	t1, 0x3660 <__addtf3+0x318>
    358c: 63 8f e4 5d  	beq	s1, t5, 0x3b6a <__addtf3+0x822>
    3590: 85 46        	li	a3, 1
    3592: ce 16        	slli	a3, a3, 51
    3594: 55 8f        	or	a4, a4, a3
    3596: 93 06 40 07  	li	a3, 116
    359a: 63 c6 f6 32  	blt	a3, a5, 0x38c6 <__addtf3+0x57e>
    359e: 93 06 f0 03  	li	a3, 63
    35a2: 63 d7 f6 44  	bge	a3, a5, 0x39f0 <__addtf3+0x6a8>
    35a6: 9b 86 07 fc  	addiw	a3, a5, -64
    35aa: 13 06 00 04  	li	a2, 64
    35ae: b3 56 d7 00  	srl	a3, a4, a3
    35b2: 63 8a c7 00  	beq	a5, a2, 0x35c6 <__addtf3+0x27e>
    35b6: 13 06 00 08  	li	a2, 128
    35ba: bb 07 f6 40  	subw	a5, a2, a5
    35be: b3 17 f7 00  	sll	a5, a4, a5
    35c2: 33 6e fe 00  	or	t3, t3, a5
    35c6: 33 39 c0 01  	snez	s2, t3
    35ca: 33 69 d9 00  	or	s2, s2, a3
    35ce: 01 a6        	j	0x38ce <__addtf3+0x586>
    35d0: b3 67 c7 01  	or	a5, a4, t3
    35d4: 63 8e 07 2c  	beqz	a5, 0x38b0 <__addtf3+0x568>
    35d8: 9b 87 fe ff  	addiw	a5, t4, -1
    35dc: 63 83 07 4e  	beqz	a5, 0x3ac2 <__addtf3+0x77a>
    35e0: e3 9f e4 dd  	bne	s1, t5, 0x33be <__addtf3+0x76>
    35e4: b3 6f f8 01  	or	t6, a6, t6
    35e8: 63 9b 0f 3c  	bnez	t6, 0x39be <__addtf3+0x676>
    35ec: 81 47        	li	a5, 0
    35ee: 21 67        	lui	a4, 8
    35f0: 7d 17        	addi	a4, a4, -1
    35f2: 81 45        	li	a1, 0
    35f4: 01 45        	li	a0, 0
    35f6: 01 bf        	j	0x3506 <__addtf3+0x1be>
    35f8: 93 88 14 00  	addi	a7, s1, 1
    35fc: 93 85 e2 ff  	addi	a1, t0, -2
    3600: b3 f5 b8 00  	and	a1, a7, a1
    3604: 63 9a 05 22  	bnez	a1, 0x3838 <__addtf3+0x4f0>
    3608: b3 68 f8 01  	or	a7, a6, t6
    360c: b3 65 c7 01  	or	a1, a4, t3
    3610: 63 95 04 1a  	bnez	s1, 0x37ba <__addtf3+0x472>
    3614: 63 80 08 4c  	beqz	a7, 0x3ad4 <__addtf3+0x78c>
    3618: 63 84 05 4c  	beqz	a1, 0x3ae0 <__addtf3+0x798>
    361c: 33 85 cf 41  	sub	a0, t6, t3
    3620: b3 b5 af 00  	sltu	a1, t6, a0
    3624: 33 06 e8 40  	sub	a2, a6, a4
    3628: 0d 8e        	sub	a2, a2, a1
    362a: 93 55 36 03  	srli	a1, a2, 51
    362e: 85 89        	andi	a1, a1, 1
    3630: 63 8f 05 68  	beqz	a1, 0x3cce <__addtf3+0x986>
    3634: 33 09 fe 41  	sub	s2, t3, t6
    3638: 33 07 07 41  	sub	a4, a4, a6
    363c: 33 3e 2e 01  	sltu	t3, t3, s2
    3640: 33 08 c7 41  	sub	a6, a4, t3
    3644: b3 65 09 01  	or	a1, s2, a6
    3648: 36 84        	mv	s0, a3
    364a: e3 94 05 e2  	bnez	a1, 0x3472 <__addtf3+0x12a>
    364e: 01 45        	li	a0, 0
    3650: 81 44        	li	s1, 0
    3652: 81 47        	li	a5, 0
    3654: c2 05        	slli	a1, a1, 16
    3656: 13 97 14 03  	slli	a4, s1, 49
    365a: c1 81        	srli	a1, a1, 16
    365c: 45 93        	srli	a4, a4, 49
    365e: 65 b5        	j	0x3506 <__addtf3+0x1be>
    3660: b3 67 c7 01  	or	a5, a4, t3
    3664: 63 80 07 48  	beqz	a5, 0x3ae4 <__addtf3+0x79c>
    3668: 9b 87 f6 ff  	addiw	a5, a3, -1
    366c: 63 88 07 3e  	beqz	a5, 0x3a5c <__addtf3+0x714>
    3670: e3 93 e4 f3  	bne	s1, t5, 0x3596 <__addtf3+0x24e>
    3674: b3 67 f8 01  	or	a5, a6, t6
    3678: b5 db        	beqz	a5, 0x35ec <__addtf3+0x2a4>
    367a: 93 57 28 03  	srli	a5, a6, 50
    367e: 93 c7 17 00  	xori	a5, a5, 1
    3682: 85 8b        	andi	a5, a5, 1
    3684: 92 07        	slli	a5, a5, 4
    3686: 21 67        	lui	a4, 8
    3688: 7e 89        	mv	s2, t6
    368a: 93 04 f7 ff  	addi	s1, a4, -1
    368e: 21 67        	lui	a4, 8
    3690: 13 55 39 00  	srli	a0, s2, 3
    3694: 93 16 d8 03  	slli	a3, a6, 61
    3698: 7d 17        	addi	a4, a4, -1
    369a: 55 8d        	or	a0, a0, a3
    369c: 93 55 38 00  	srli	a1, a6, 3
    36a0: e3 85 e4 ec  	beq	s1, a4, 0x356a <__addtf3+0x222>
    36a4: 45 bf        	j	0x3654 <__addtf3+0x30c>
    36a6: 13 77 f9 00  	andi	a4, s2, 15
    36aa: 91 46        	li	a3, 4
    36ac: e3 0b d7 e0  	beq	a4, a3, 0x34c2 <__addtf3+0x17a>
    36b0: 13 07 49 00  	addi	a4, s2, 4
    36b4: 33 39 27 01  	sltu	s2, a4, s2
    36b8: 4a 98        	add	a6, a6, s2
    36ba: 3a 89        	mv	s2, a4
    36bc: e3 14 06 e0  	bnez	a2, 0x34c4 <__addtf3+0x17c>
    36c0: 21 b5        	j	0x34c8 <__addtf3+0x180>
    36c2: fd 57        	li	a5, -1
    36c4: ce 17        	slli	a5, a5, 51
    36c6: fd 17        	addi	a5, a5, -1
    36c8: 89 8c        	sub	s1, s1, a0
    36ca: 33 78 f8 00  	and	a6, a6, a5
    36ce: 52 89        	mv	s2, s4
    36d0: b3 65 09 01  	or	a1, s2, a6
    36d4: 93 77 79 00  	andi	a5, s2, 7
    36d8: e3 8b 04 d8  	beqz	s1, 0x346e <__addtf3+0x126>
    36dc: 01 46        	li	a2, 0
    36de: e3 99 07 dc  	bnez	a5, 0x34b0 <__addtf3+0x168>
    36e2: 85 46        	li	a3, 1
    36e4: ce 16        	slli	a3, a3, 51
    36e6: b3 76 d8 00  	and	a3, a6, a3
    36ea: 81 47        	li	a5, 0
    36ec: d5 b3        	j	0x34d0 <__addtf3+0x188>
    36ee: 63 8e 09 0a  	beqz	s3, 0x37aa <__addtf3+0x462>
    36f2: 0d 47        	li	a4, 3
    36f4: 63 84 e9 2e  	beq	s3, a4, 0x39dc <__addtf3+0x694>
    36f8: 09 47        	li	a4, 2
    36fa: 63 86 e9 0a  	beq	s3, a4, 0x37a6 <__addtf3+0x45e>
    36fe: 7d 55        	li	a0, -1
    3700: 21 67        	lui	a4, 8
    3702: 93 e7 57 00  	ori	a5, a5, 5
    3706: 93 55 35 00  	srli	a1, a0, 3
    370a: 93 04 e7 ff  	addi	s1, a4, -2
    370e: 99 b7        	j	0x3654 <__addtf3+0x30c>
    3710: 4a 85        	mv	a0, s2
    3712: ef 10 10 2c  	jal	0x51d2 <__clzdi2>
    3716: 1b 08 45 ff  	addiw	a6, a0, -12
    371a: 93 07 f0 03  	li	a5, 63
    371e: 1b 05 45 03  	addiw	a0, a0, 52
    3722: 33 18 09 01  	sll	a6, s2, a6
    3726: e3 c8 a7 d0  	blt	a5, a0, 0x3436 <__addtf3+0xee>
    372a: d5 b9        	j	0x341e <__addtf3+0xd6>
    372c: d5 cf        	beqz	a5, 0x37e8 <__addtf3+0x4a0>
    372e: 63 8a 04 24  	beqz	s1, 0x3982 <__addtf3+0x63a>
    3732: 63 08 e3 5b  	beq	t1, t5, 0x3ce2 <__addtf3+0x99a>
    3736: 85 47        	li	a5, 1
    3738: ce 17        	slli	a5, a5, 51
    373a: bb 06 d0 40  	negw	a3, a3
    373e: 33 68 f8 00  	or	a6, a6, a5
    3742: 93 07 40 07  	li	a5, 116
    3746: 63 c6 d7 44  	blt	a5, a3, 0x3b92 <__addtf3+0x84a>
    374a: 93 07 f0 03  	li	a5, 63
    374e: 63 c9 d7 4c  	blt	a5, a3, 0x3c20 <__addtf3+0x8d8>
    3752: 93 07 00 04  	li	a5, 64
    3756: 95 9f        	subw	a5, a5, a3
    3758: 33 19 f8 00  	sll	s2, a6, a5
    375c: 33 d6 df 00  	srl	a2, t6, a3
    3760: b3 97 ff 00  	sll	a5, t6, a5
    3764: 33 69 c9 00  	or	s2, s2, a2
    3768: b3 37 f0 00  	snez	a5, a5
    376c: b3 56 d8 00  	srl	a3, a6, a3
    3770: 33 69 f9 00  	or	s2, s2, a5
    3774: 36 97        	add	a4, a4, a3
    3776: 72 99        	add	s2, s2, t3
    3778: 33 3e c9 01  	sltu	t3, s2, t3
    377c: 33 08 ee 00  	add	a6, t3, a4
    3780: 9a 84        	mv	s1, t1
    3782: 91 aa        	j	0x38d6 <__addtf3+0x58e>
    3784: 85 47        	li	a5, 1
    3786: e3 0e 04 d2  	beqz	s0, 0x34c2 <__addtf3+0x17a>
    378a: 13 07 89 00  	addi	a4, s2, 8
    378e: 33 39 27 01  	sltu	s2, a4, s2
    3792: 4a 98        	add	a6, a6, s2
    3794: 3a 89        	mv	s2, a4
    3796: e3 17 06 d2  	bnez	a2, 0x34c4 <__addtf3+0x17c>
    379a: 3d b3        	j	0x34c8 <__addtf3+0x180>
    379c: 85 47        	li	a5, 1
    379e: 75 d4        	beqz	s0, 0x378a <__addtf3+0x442>
    37a0: e3 12 06 d2  	bnez	a2, 0x34c4 <__addtf3+0x17c>
    37a4: 15 b3        	j	0x34c8 <__addtf3+0x180>
    37a6: 63 0d 04 22  	beqz	s0, 0x39e0 <__addtf3+0x698>
    37aa: 93 e7 57 00  	ori	a5, a5, 5
    37ae: 81 b5        	j	0x35ee <__addtf3+0x2a6>
    37b0: 33 69 c7 01  	or	s2, a4, t3
    37b4: 33 39 20 01  	snez	s2, s2
    37b8: 35 b9        	j	0x33f4 <__addtf3+0xac>
    37ba: 63 89 e4 2b  	beq	s1, t5, 0x3a6c <__addtf3+0x724>
    37be: 63 0f e3 2d  	beq	t1, t5, 0x3a9c <__addtf3+0x754>
    37c2: 63 9f 08 2a  	bnez	a7, 0x3a80 <__addtf3+0x738>
    37c6: 63 94 05 2e  	bnez	a1, 0x3aae <__addtf3+0x766>
    37ca: b7 f5 ff 0f  	lui	a1, 65535
    37ce: 01 45        	li	a0, 0
    37d0: 8e 15        	slli	a1, a1, 35
    37d2: c1 47        	li	a5, 16
    37d4: 73 a0 17 00  	csrs	fflags, a5
    37d8: a2 70        	ld	ra, 40(sp)
    37da: 02 74        	ld	s0, 32(sp)
    37dc: e2 64        	ld	s1, 24(sp)
    37de: 42 69        	ld	s2, 16(sp)
    37e0: a2 69        	ld	s3, 8(sp)
    37e2: 02 6a        	ld	s4, 0(sp)
    37e4: 45 61        	addi	sp, sp, 48
    37e6: 82 80        	ret
    37e8: 93 86 14 00  	addi	a3, s1, 1
    37ec: 93 85 e2 ff  	addi	a1, t0, -2
    37f0: b3 fe b6 00  	and	t4, a3, a1
    37f4: 63 91 0e 22  	bnez	t4, 0x3a16 <__addtf3+0x6ce>
    37f8: b3 66 f8 01  	or	a3, a6, t6
    37fc: 63 95 04 3c  	bnez	s1, 0x3bc6 <__addtf3+0x87e>
    3800: b3 65 c7 01  	or	a1, a4, t3
    3804: 63 8b 06 40  	beqz	a3, 0x3c1a <__addtf3+0x8d2>
    3808: 63 8c 05 2c  	beqz	a1, 0x3ae0 <__addtf3+0x798>
    380c: 33 89 cf 01  	add	s2, t6, t3
    3810: 42 97        	add	a4, a4, a6
    3812: b3 3f f9 01  	sltu	t6, s2, t6
    3816: 33 08 f7 01  	add	a6, a4, t6
    381a: 93 57 38 03  	srli	a5, a6, 51
    381e: 85 8b        	andi	a5, a5, 1
    3820: e3 85 07 c4  	beqz	a5, 0x346a <__addtf3+0x122>
    3824: 13 95 38 03  	slli	a0, a7, 51
    3828: 93 07 f5 ff  	addi	a5, a0, -1
    382c: 33 78 f8 00  	and	a6, a6, a5
    3830: 85 44        	li	s1, 1
    3832: 93 77 79 00  	andi	a5, s2, 7
    3836: 5d b5        	j	0x36dc <__addtf3+0x394>
    3838: 33 89 cf 41  	sub	s2, t6, t3
    383c: 33 b6 2f 01  	sltu	a2, t6, s2
    3840: 33 0a e8 40  	sub	s4, a6, a4
    3844: 33 0a ca 40  	sub	s4, s4, a2
    3848: 13 56 3a 03  	srli	a2, s4, 51
    384c: 05 8a        	andi	a2, a2, 1
    384e: 63 1d 06 1e  	bnez	a2, 0x3a48 <__addtf3+0x700>
    3852: b3 65 49 01  	or	a1, s2, s4
    3856: e3 9e 05 ba  	bnez	a1, 0x3412 <__addtf3+0xca>
    385a: f9 19        	addi	s3, s3, -2
    385c: 13 b4 19 00  	seqz	s0, s3
    3860: 01 45        	li	a0, 0
    3862: 81 44        	li	s1, 0
    3864: c5 bb        	j	0x3654 <__addtf3+0x30c>
    3866: e3 0e e3 cd  	beq	t1, t5, 0x3542 <__addtf3+0x1fa>
    386a: 85 47        	li	a5, 1
    386c: ce 17        	slli	a5, a5, 51
    386e: bb 0e d0 41  	negw	t4, t4
    3872: 33 68 f8 00  	or	a6, a6, a5
    3876: 93 07 40 07  	li	a5, 116
    387a: 63 c7 d7 0f  	blt	a5, t4, 0x3968 <__addtf3+0x620>
    387e: 93 07 f0 03  	li	a5, 63
    3882: 63 cd d7 31  	blt	a5, t4, 0x3b9c <__addtf3+0x854>
    3886: 93 07 00 04  	li	a5, 64
    388a: bb 87 d7 41  	subw	a5, a5, t4
    388e: 33 19 f8 00  	sll	s2, a6, a5
    3892: 33 d6 df 01  	srl	a2, t6, t4
    3896: b3 97 ff 00  	sll	a5, t6, a5
    389a: 33 69 c9 00  	or	s2, s2, a2
    389e: b3 37 f0 00  	snez	a5, a5
    38a2: b3 5e d8 01  	srl	t4, a6, t4
    38a6: 33 69 f9 00  	or	s2, s2, a5
    38aa: 33 07 d7 41  	sub	a4, a4, t4
    38ae: c9 a0        	j	0x3970 <__addtf3+0x628>
    38b0: 7e 89        	mv	s2, t6
    38b2: e3 9f e4 e1  	bne	s1, t5, 0x36d0 <__addtf3+0x388>
    38b6: b3 67 f8 01  	or	a5, a6, t6
    38ba: e3 90 07 dc  	bnez	a5, 0x367a <__addtf3+0x332>
    38be: 01 45        	li	a0, 0
    38c0: 81 45        	li	a1, 0
    38c2: 81 47        	li	a5, 0
    38c4: 5d b1        	j	0x356a <__addtf3+0x222>
    38c6: 33 69 c7 01  	or	s2, a4, t3
    38ca: 33 39 20 01  	snez	s2, s2
    38ce: 7e 99        	add	s2, s2, t6
    38d0: b3 3f f9 01  	sltu	t6, s2, t6
    38d4: 7e 98        	add	a6, a6, t6
    38d6: 93 57 38 03  	srli	a5, a6, 51
    38da: 85 8b        	andi	a5, a5, 1
    38dc: e3 8a 07 de  	beqz	a5, 0x36d0 <__addtf3+0x388>
    38e0: 21 67        	lui	a4, 8
    38e2: 85 04        	addi	s1, s1, 1
    38e4: 93 07 f7 ff  	addi	a5, a4, -1
    38e8: 63 87 f4 24  	beq	s1, a5, 0x3b36 <__addtf3+0x7ee>
    38ec: 7d 57        	li	a4, -1
    38ee: 4e 17        	slli	a4, a4, 51
    38f0: 7d 17        	addi	a4, a4, -1
    38f2: 33 77 e8 00  	and	a4, a6, a4
    38f6: 93 57 19 00  	srli	a5, s2, 1
    38fa: 13 79 19 00  	andi	s2, s2, 1
    38fe: b3 e7 27 01  	or	a5, a5, s2
    3902: 13 19 f7 03  	slli	s2, a4, 63
    3906: 33 69 f9 00  	or	s2, s2, a5
    390a: 13 58 17 00  	srli	a6, a4, 1
    390e: 9d 8b        	andi	a5, a5, 7
    3910: f1 b3        	j	0x36dc <__addtf3+0x394>
    3912: 1b 05 15 fc  	addiw	a0, a0, -63
    3916: 93 07 00 04  	li	a5, 64
    391a: b3 55 a8 00  	srl	a1, a6, a0
    391e: 63 09 f7 00  	beq	a4, a5, 0x3930 <__addtf3+0x5e8>
    3922: 93 07 00 08  	li	a5, 128
    3926: 99 9f        	subw	a5, a5, a4
    3928: 33 18 f8 00  	sll	a6, a6, a5
    392c: 33 6a 0a 01  	or	s4, s4, a6
    3930: 33 3a 40 01  	snez	s4, s4
    3934: b3 65 ba 00  	or	a1, s4, a1
    3938: 2e 89        	mv	s2, a1
    393a: 01 48        	li	a6, 0
    393c: 0d be        	j	0x346e <__addtf3+0x126>
    393e: 9b 86 07 fc  	addiw	a3, a5, -64
    3942: 13 06 00 04  	li	a2, 64
    3946: b3 56 d7 00  	srl	a3, a4, a3
    394a: 63 8a c7 00  	beq	a5, a2, 0x395e <__addtf3+0x616>
    394e: 13 06 00 08  	li	a2, 128
    3952: bb 07 f6 40  	subw	a5, a2, a5
    3956: b3 17 f7 00  	sll	a5, a4, a5
    395a: 33 6e fe 00  	or	t3, t3, a5
    395e: 33 39 c0 01  	snez	s2, t3
    3962: 33 69 d9 00  	or	s2, s2, a3
    3966: 79 b4        	j	0x33f4 <__addtf3+0xac>
    3968: 33 69 f8 01  	or	s2, a6, t6
    396c: 33 39 20 01  	snez	s2, s2
    3970: 33 09 2e 41  	sub	s2, t3, s2
    3974: 33 3e 2e 01  	sltu	t3, t3, s2
    3978: 33 08 c7 41  	sub	a6, a4, t3
    397c: 9a 84        	mv	s1, t1
    397e: 36 84        	mv	s0, a3
    3980: 41 b4        	j	0x3400 <__addtf3+0xb8>
    3982: b3 67 f8 01  	or	a5, a6, t6
    3986: 63 8f 07 26  	beqz	a5, 0x3c04 <__addtf3+0x8bc>
    398a: 93 c6 f6 ff  	not	a3, a3
    398e: 81 26        	sext.w	a3, a3
    3990: 63 89 06 2e  	beqz	a3, 0x3c82 <__addtf3+0x93a>
    3994: e3 17 e3 db  	bne	t1, t5, 0x3742 <__addtf3+0x3fa>
    3998: 33 6e c7 01  	or	t3, a4, t3
    399c: e3 08 0e c4  	beqz	t3, 0x35ec <__addtf3+0x2a4>
    39a0: 93 57 27 03  	srli	a5, a4, 50
    39a4: 93 c7 17 00  	xori	a5, a5, 1
    39a8: 93 d6 38 00  	srli	a3, a7, 3
    39ac: 85 8b        	andi	a5, a5, 1
    39ae: 13 15 d7 03  	slli	a0, a4, 61
    39b2: f1 8e        	and	a3, a3, a2
    39b4: 92 07        	slli	a5, a5, 4
    39b6: 55 8d        	or	a0, a0, a3
    39b8: 93 55 37 00  	srli	a1, a4, 3
    39bc: 7d b6        	j	0x356a <__addtf3+0x222>
    39be: 93 57 28 03  	srli	a5, a6, 50
    39c2: 13 d7 38 00  	srli	a4, a7, 3
    39c6: 93 c7 17 00  	xori	a5, a5, 1
    39ca: 79 8d        	and	a0, a0, a4
    39cc: 85 8b        	andi	a5, a5, 1
    39ce: 13 17 d8 03  	slli	a4, a6, 61
    39d2: 92 07        	slli	a5, a5, 4
    39d4: 59 8d        	or	a0, a0, a4
    39d6: 93 55 38 00  	srli	a1, a6, 3
    39da: 41 be        	j	0x356a <__addtf3+0x222>
    39dc: e3 07 04 dc  	beqz	s0, 0x37aa <__addtf3+0x462>
    39e0: 7d 55        	li	a0, -1
    39e2: 93 e7 57 00  	ori	a5, a5, 5
    39e6: 93 55 35 00  	srli	a1, a0, 3
    39ea: 93 84 e6 ff  	addi	s1, a3, -2
    39ee: 9d b1        	j	0x3654 <__addtf3+0x30c>
    39f0: 93 06 00 04  	li	a3, 64
    39f4: 9d 9e        	subw	a3, a3, a5
    39f6: 33 19 d7 00  	sll	s2, a4, a3
    39fa: 33 56 fe 00  	srl	a2, t3, a5
    39fe: b3 16 de 00  	sll	a3, t3, a3
    3a02: 33 69 c9 00  	or	s2, s2, a2
    3a06: b3 36 d0 00  	snez	a3, a3
    3a0a: 33 57 f7 00  	srl	a4, a4, a5
    3a0e: 33 69 d9 00  	or	s2, s2, a3
    3a12: 3a 98        	add	a6, a6, a4
    3a14: 6d bd        	j	0x38ce <__addtf3+0x586>
    3a16: 63 8a e6 23  	beq	a3, t5, 0x3c4a <__addtf3+0x902>
    3a1a: b3 87 cf 01  	add	a5, t6, t3
    3a1e: 42 97        	add	a4, a4, a6
    3a20: b3 bf f7 01  	sltu	t6, a5, t6
    3a24: 7e 97        	add	a4, a4, t6
    3a26: 85 83        	srli	a5, a5, 1
    3a28: 13 19 f7 03  	slli	s2, a4, 63
    3a2c: 33 69 f9 00  	or	s2, s2, a5
    3a30: 13 58 17 00  	srli	a6, a4, 1
    3a34: 9d 8b        	andi	a5, a5, 7
    3a36: b6 84        	mv	s1, a3
    3a38: 55 b1        	j	0x36dc <__addtf3+0x394>
    3a3a: 63 07 e3 23  	beq	t1, t5, 0x3c68 <__addtf3+0x920>
    3a3e: 3a 88        	mv	a6, a4
    3a40: 72 89        	mv	s2, t3
    3a42: 9a 84        	mv	s1, t1
    3a44: 36 84        	mv	s0, a3
    3a46: 69 b1        	j	0x36d0 <__addtf3+0x388>
    3a48: 33 09 fe 41  	sub	s2, t3, t6
    3a4c: 33 0a 07 41  	sub	s4, a4, a6
    3a50: 33 3e 2e 01  	sltu	t3, t3, s2
    3a54: 33 0a ca 41  	sub	s4, s4, t3
    3a58: 36 84        	mv	s0, a3
    3a5a: 65 ba        	j	0x3412 <__addtf3+0xca>
    3a5c: 33 89 cf 01  	add	s2, t6, t3
    3a60: 42 97        	add	a4, a4, a6
    3a62: b3 3f f9 01  	sltu	t6, s2, t6
    3a66: 33 08 f7 01  	add	a6, a4, t6
    3a6a: b5 b5        	j	0x38d6 <__addtf3+0x58e>
    3a6c: 63 86 08 02  	beqz	a7, 0x3a98 <__addtf3+0x750>
    3a70: 93 57 28 03  	srli	a5, a6, 50
    3a74: 93 c7 17 00  	xori	a5, a5, 1
    3a78: 85 8b        	andi	a5, a5, 1
    3a7a: 92 07        	slli	a5, a5, 4
    3a7c: 63 00 93 02  	beq	t1, s1, 0x3a9c <__addtf3+0x754>
    3a80: e3 97 05 ae  	bnez	a1, 0x356e <__addtf3+0x226>
    3a84: 93 16 35 00  	slli	a3, a0, 3
    3a88: 13 17 d8 03  	slli	a4, a6, 61
    3a8c: 8d 82        	srli	a3, a3, 3
    3a8e: 33 65 d7 00  	or	a0, a4, a3
    3a92: 93 55 38 00  	srli	a1, a6, 3
    3a96: d1 bc        	j	0x356a <__addtf3+0x222>
    3a98: e3 17 93 d2  	bne	t1, s1, 0x37c6 <__addtf3+0x47e>
    3a9c: e3 83 05 d2  	beqz	a1, 0x37c2 <__addtf3+0x47a>
    3aa0: 93 55 27 03  	srli	a1, a4, 50
    3aa4: 85 89        	andi	a1, a1, 1
    3aa6: 91 e1        	bnez	a1, 0x3aaa <__addtf3+0x762>
    3aa8: c1 47        	li	a5, 16
    3aaa: e3 92 08 ac  	bnez	a7, 0x356e <__addtf3+0x226>
    3aae: 0e 06        	slli	a2, a2, 3
    3ab0: 93 15 d7 03  	slli	a1, a4, 61
    3ab4: 0d 82        	srli	a2, a2, 3
    3ab6: 33 65 b6 00  	or	a0, a2, a1
    3aba: 36 84        	mv	s0, a3
    3abc: 93 55 37 00  	srli	a1, a4, 3
    3ac0: 6d b4        	j	0x356a <__addtf3+0x222>
    3ac2: 33 89 cf 41  	sub	s2, t6, t3
    3ac6: 33 07 e8 40  	sub	a4, a6, a4
    3aca: b3 bf 2f 01  	sltu	t6, t6, s2
    3ace: 33 08 f7 41  	sub	a6, a4, t6
    3ad2: 3d b2        	j	0x3400 <__addtf3+0xb8>
    3ad4: 63 8e 05 12  	beqz	a1, 0x3c10 <__addtf3+0x8c8>
    3ad8: 81 45        	li	a1, 0
    3ada: 3a 88        	mv	a6, a4
    3adc: f2 8f        	mv	t6, t3
    3ade: 36 84        	mv	s0, a3
    3ae0: 7e 89        	mv	s2, t6
    3ae2: 51 ba        	j	0x3476 <__addtf3+0x12e>
    3ae4: 7e 89        	mv	s2, t6
    3ae6: e3 95 e4 bf  	bne	s1, t5, 0x36d0 <__addtf3+0x388>
    3aea: b3 67 f8 01  	or	a5, a6, t6
    3aee: e3 88 07 dc  	beqz	a5, 0x38be <__addtf3+0x576>
    3af2: 93 57 28 03  	srli	a5, a6, 50
    3af6: 93 c7 17 00  	xori	a5, a5, 1
    3afa: 92 07        	slli	a5, a5, 4
    3afc: 69 b6        	j	0x3686 <__addtf3+0x33e>
    3afe: 13 f6 f6 00  	andi	a2, a3, 15
    3b02: 11 45        	li	a0, 4
    3b04: e3 0d a6 98  	beq	a2, a0, 0x349e <__addtf3+0x156>
    3b08: 93 b6 c6 ff  	sltiu	a3, a3, -4
    3b0c: 93 c6 16 00  	xori	a3, a3, 1
    3b10: 82 16        	slli	a3, a3, 32
    3b12: 81 92        	srli	a3, a3, 32
    3b14: 36 97        	add	a4, a4, a3
    3b16: 61 b2        	j	0x349e <__addtf3+0x156>
    3b18: 85 47        	li	a5, 1
    3b1a: e3 12 04 98  	bnez	s0, 0x349e <__addtf3+0x156>
    3b1e: 93 b6 86 ff  	sltiu	a3, a3, -8
    3b22: 93 c6 16 00  	xori	a3, a3, 1
    3b26: 82 16        	slli	a3, a3, 32
    3b28: 81 92        	srli	a3, a3, 32
    3b2a: 36 97        	add	a4, a4, a3
    3b2c: 8d ba        	j	0x349e <__addtf3+0x156>
    3b2e: 85 47        	li	a5, 1
    3b30: e3 07 04 96  	beqz	s0, 0x349e <__addtf3+0x156>
    3b34: ed b7        	j	0x3b1e <__addtf3+0x7d6>
    3b36: 63 88 09 02  	beqz	s3, 0x3b66 <__addtf3+0x81e>
    3b3a: 8d 47        	li	a5, 3
    3b3c: 63 87 f9 1c  	beq	s3, a5, 0x3d0a <__addtf3+0x9c2>
    3b40: 89 46        	li	a3, 2
    3b42: 95 47        	li	a5, 5
    3b44: e3 9d d9 ba  	bne	s3, a3, 0x36fe <__addtf3+0x3b6>
    3b48: e3 13 04 aa  	bnez	s0, 0x35ee <__addtf3+0x2a6>
    3b4c: 7d 58        	li	a6, -1
    3b4e: 7d 59        	li	s2, -1
    3b50: 93 04 e7 ff  	addi	s1, a4, -2
    3b54: 95 ba        	j	0x34c8 <__addtf3+0x180>
    3b56: ce 16        	slli	a3, a3, 51
    3b58: b3 76 d8 00  	and	a3, a6, a3
    3b5c: e3 1a 07 96  	bnez	a4, 0x34d0 <__addtf3+0x188>
    3b60: e3 88 07 96  	beqz	a5, 0x34d0 <__addtf3+0x188>
    3b64: 85 b2        	j	0x34c4 <__addtf3+0x17c>
    3b66: 95 47        	li	a5, 5
    3b68: 59 b4        	j	0x35ee <__addtf3+0x2a6>
    3b6a: b3 6f f8 01  	or	t6, a6, t6
    3b6e: e3 8f 0f a6  	beqz	t6, 0x35ec <__addtf3+0x2a4>
    3b72: 93 57 28 03  	srli	a5, a6, 50
    3b76: 93 c7 17 00  	xori	a5, a5, 1
    3b7a: 93 d6 38 00  	srli	a3, a7, 3
    3b7e: 85 8b        	andi	a5, a5, 1
    3b80: 13 17 d8 03  	slli	a4, a6, 61
    3b84: e9 8e        	and	a3, a3, a0
    3b86: 92 07        	slli	a5, a5, 4
    3b88: 33 65 d7 00  	or	a0, a4, a3
    3b8c: 93 55 38 00  	srli	a1, a6, 3
    3b90: e9 ba        	j	0x356a <__addtf3+0x222>
    3b92: 33 69 f8 01  	or	s2, a6, t6
    3b96: 33 39 20 01  	snez	s2, s2
    3b9a: f1 be        	j	0x3776 <__addtf3+0x42e>
    3b9c: 9b 87 0e fc  	addiw	a5, t4, -64
    3ba0: 13 06 00 04  	li	a2, 64
    3ba4: b3 57 f8 00  	srl	a5, a6, a5
    3ba8: 63 8a ce 00  	beq	t4, a2, 0x3bbc <__addtf3+0x874>
    3bac: 13 06 00 08  	li	a2, 128
    3bb0: 3b 06 d6 41  	subw	a2, a2, t4
    3bb4: 33 16 c8 00  	sll	a2, a6, a2
    3bb8: b3 ef cf 00  	or	t6, t6, a2
    3bbc: 33 39 f0 01  	snez	s2, t6
    3bc0: 33 69 f9 00  	or	s2, s2, a5
    3bc4: 75 b3        	j	0x3970 <__addtf3+0x628>
    3bc6: 63 87 e4 0d  	beq	s1, t5, 0x3c94 <__addtf3+0x94c>
    3bca: 63 08 e3 17  	beq	t1, t5, 0x3d3a <__addtf3+0x9f2>
    3bce: fd c6        	beqz	a3, 0x3cbc <__addtf3+0x974>
    3bd0: 33 6e c7 01  	or	t3, a4, t3
    3bd4: e3 1d 0e 98  	bnez	t3, 0x356e <__addtf3+0x226>
    3bd8: 0e 05        	slli	a0, a0, 3
    3bda: 0d 81        	srli	a0, a0, 3
    3bdc: 13 17 d8 03  	slli	a4, a6, 61
    3be0: 59 8d        	or	a0, a0, a4
    3be2: 93 55 38 00  	srli	a1, a6, 3
    3be6: 51 b2        	j	0x356a <__addtf3+0x222>
    3be8: 33 09 fe 41  	sub	s2, t3, t6
    3bec: 33 07 07 41  	sub	a4, a4, a6
    3bf0: 33 3e 2e 01  	sltu	t3, t3, s2
    3bf4: 33 08 c7 41  	sub	a6, a4, t3
    3bf8: 9a 84        	mv	s1, t1
    3bfa: 36 84        	mv	s0, a3
    3bfc: 6f f0 5f 80  	j	0x3400 <__addtf3+0xb8>
    3c00: 36 84        	mv	s0, a3
    3c02: ed b2        	j	0x35ec <__addtf3+0x2a4>
    3c04: 63 0c e3 11  	beq	t1, t5, 0x3d1c <__addtf3+0x9d4>
    3c08: 3a 88        	mv	a6, a4
    3c0a: 72 89        	mv	s2, t3
    3c0c: 9a 84        	mv	s1, t1
    3c0e: c9 b4        	j	0x36d0 <__addtf3+0x388>
    3c10: f9 19        	addi	s3, s3, -2
    3c12: 13 b4 19 00  	seqz	s0, s3
    3c16: 01 45        	li	a0, 0
    3c18: 35 bc        	j	0x3654 <__addtf3+0x30c>
    3c1a: 3a 88        	mv	a6, a4
    3c1c: 72 89        	mv	s2, t3
    3c1e: 81 b8        	j	0x346e <__addtf3+0x126>
    3c20: 9b 87 06 fc  	addiw	a5, a3, -64
    3c24: 13 06 00 04  	li	a2, 64
    3c28: b3 57 f8 00  	srl	a5, a6, a5
    3c2c: 63 8a c6 00  	beq	a3, a2, 0x3c40 <__addtf3+0x8f8>
    3c30: 13 06 00 08  	li	a2, 128
    3c34: bb 06 d6 40  	subw	a3, a2, a3
    3c38: b3 16 d8 00  	sll	a3, a6, a3
    3c3c: b3 ef df 00  	or	t6, t6, a3
    3c40: 33 39 f0 01  	snez	s2, t6
    3c44: 33 69 f9 00  	or	s2, s2, a5
    3c48: 3d b6        	j	0x3776 <__addtf3+0x42e>
    3c4a: e3 8e 09 f0  	beqz	s3, 0x3b66 <__addtf3+0x81e>
    3c4e: 8d 47        	li	a5, 3
    3c50: 63 82 f9 10  	beq	s3, a5, 0x3d54 <__addtf3+0xa0c>
    3c54: 09 47        	li	a4, 2
    3c56: 95 47        	li	a5, 5
    3c58: e3 93 e9 aa  	bne	s3, a4, 0x36fe <__addtf3+0x3b6>
    3c5c: e3 19 04 98  	bnez	s0, 0x35ee <__addtf3+0x2a6>
    3c60: 7d 58        	li	a6, -1
    3c62: 7d 59        	li	s2, -1
    3c64: ae 84        	mv	s1, a1
    3c66: 8d b0        	j	0x34c8 <__addtf3+0x180>
    3c68: b3 67 c7 01  	or	a5, a4, t3
    3c6c: e9 c7        	beqz	a5, 0x3d36 <__addtf3+0x9ee>
    3c6e: 93 57 27 03  	srli	a5, a4, 50
    3c72: 93 c7 17 00  	xori	a5, a5, 1
    3c76: 85 8b        	andi	a5, a5, 1
    3c78: 92 07        	slli	a5, a5, 4
    3c7a: 3a 88        	mv	a6, a4
    3c7c: f2 8f        	mv	t6, t3
    3c7e: 36 84        	mv	s0, a3
    3c80: 19 b4        	j	0x3686 <__addtf3+0x33e>
    3c82: 33 89 cf 01  	add	s2, t6, t3
    3c86: 42 97        	add	a4, a4, a6
    3c88: 33 3e c9 01  	sltu	t3, s2, t3
    3c8c: 33 08 c7 01  	add	a6, a4, t3
    3c90: 9a 84        	mv	s1, t1
    3c92: 91 b1        	j	0x38d6 <__addtf3+0x58e>
    3c94: cd ca        	beqz	a3, 0x3d46 <__addtf3+0x9fe>
    3c96: 93 57 28 03  	srli	a5, a6, 50
    3c9a: 93 c7 17 00  	xori	a5, a5, 1
    3c9e: 85 8b        	andi	a5, a5, 1
    3ca0: 92 07        	slli	a5, a5, 4
    3ca2: e3 17 93 f2  	bne	t1, s1, 0x3bd0 <__addtf3+0x888>
    3ca6: 33 6e c7 01  	or	t3, a4, t3
    3caa: e3 07 0e f2  	beqz	t3, 0x3bd8 <__addtf3+0x890>
    3cae: 93 55 27 03  	srli	a1, a4, 50
    3cb2: 85 89        	andi	a1, a1, 1
    3cb4: 91 e1        	bnez	a1, 0x3cb8 <__addtf3+0x970>
    3cb6: c1 47        	li	a5, 16
    3cb8: e3 9b 06 8a  	bnez	a3, 0x356e <__addtf3+0x226>
    3cbc: 0e 06        	slli	a2, a2, 3
    3cbe: 0d 82        	srli	a2, a2, 3
    3cc0: 93 16 d7 03  	slli	a3, a4, 61
    3cc4: 33 65 d6 00  	or	a0, a2, a3
    3cc8: 93 55 37 00  	srli	a1, a4, 3
    3ccc: 79 b8        	j	0x356a <__addtf3+0x222>
    3cce: b3 65 c5 00  	or	a1, a0, a2
    3cd2: 9d dd        	beqz	a1, 0x3c10 <__addtf3+0x8c8>
    3cd4: aa 8f        	mv	t6, a0
    3cd6: 93 75 75 00  	andi	a1, a0, 7
    3cda: 32 88        	mv	a6, a2
    3cdc: 7e 89        	mv	s2, t6
    3cde: 6f f0 8f f9  	j	0x3476 <__addtf3+0x12e>
    3ce2: 33 6e c7 01  	or	t3, a4, t3
    3ce6: e3 03 0e 90  	beqz	t3, 0x35ec <__addtf3+0x2a4>
    3cea: 93 57 27 03  	srli	a5, a4, 50
    3cee: 13 d5 38 00  	srli	a0, a7, 3
    3cf2: 93 c7 17 00  	xori	a5, a5, 1
    3cf6: 85 8b        	andi	a5, a5, 1
    3cf8: 69 8e        	and	a2, a2, a0
    3cfa: 93 16 d7 03  	slli	a3, a4, 61
    3cfe: 92 07        	slli	a5, a5, 4
    3d00: 33 65 d6 00  	or	a0, a2, a3
    3d04: 93 55 37 00  	srli	a1, a4, 3
    3d08: 8d b0        	j	0x356a <__addtf3+0x222>
    3d0a: e3 0e 04 e4  	beqz	s0, 0x3b66 <__addtf3+0x81e>
    3d0e: 93 04 e7 ff  	addi	s1, a4, -2
    3d12: 95 47        	li	a5, 5
    3d14: 7d 58        	li	a6, -1
    3d16: 7d 59        	li	s2, -1
    3d18: 6f f0 0f fb  	j	0x34c8 <__addtf3+0x180>
    3d1c: b3 67 c7 01  	or	a5, a4, t3
    3d20: e3 8f 07 b8  	beqz	a5, 0x38be <__addtf3+0x576>
    3d24: 93 57 27 03  	srli	a5, a4, 50
    3d28: 93 c7 17 00  	xori	a5, a5, 1
    3d2c: 85 8b        	andi	a5, a5, 1
    3d2e: 92 07        	slli	a5, a5, 4
    3d30: 3a 88        	mv	a6, a4
    3d32: f2 8f        	mv	t6, t3
    3d34: 89 ba        	j	0x3686 <__addtf3+0x33e>
    3d36: 36 84        	mv	s0, a3
    3d38: 59 b6        	j	0x38be <__addtf3+0x576>
    3d3a: 33 6e c7 01  	or	t3, a4, t3
    3d3e: e3 18 0e f6  	bnez	t3, 0x3cae <__addtf3+0x966>
    3d42: ad de        	beqz	a3, 0x3cbc <__addtf3+0x974>
    3d44: 51 bd        	j	0x3bd8 <__addtf3+0x890>
    3d46: e3 1b 93 f6  	bne	t1, s1, 0x3cbc <__addtf3+0x974>
    3d4a: 33 6e c7 01  	or	t3, a4, t3
    3d4e: e3 10 0e f6  	bnez	t3, 0x3cae <__addtf3+0x966>
    3d52: ad b7        	j	0x3cbc <__addtf3+0x974>
    3d54: e3 09 04 e0  	beqz	s0, 0x3b66 <__addtf3+0x81e>
    3d58: ae 84        	mv	s1, a1
    3d5a: 95 47        	li	a5, 5
    3d5c: 7d 58        	li	a6, -1
    3d5e: 7d 59        	li	s2, -1
    3d60: 6f f0 8f f6  	j	0x34c8 <__addtf3+0x180>

0000000000003d64 <__netf2>:
    3d64: 2a 83        	mv	t1, a0
    3d66: f3 27 20 00  	csrr	a5, frm
    3d6a: 21 67        	lui	a4, 8
    3d6c: 7d 17        	addi	a4, a4, -1
    3d6e: 13 d8 05 03  	srli	a6, a1, 48
    3d72: fd 57        	li	a5, -1
    3d74: c1 83        	srli	a5, a5, 16
    3d76: 93 d8 06 03  	srli	a7, a3, 48
    3d7a: 33 78 e8 00  	and	a6, a6, a4
    3d7e: 33 fe f5 00  	and	t3, a1, a5
    3d82: b3 f8 e8 00  	and	a7, a7, a4
    3d86: f5 8f        	and	a5, a5, a3
    3d88: fd 91        	srli	a1, a1, 63
    3d8a: fd 92        	srli	a3, a3, 63
    3d8c: 63 00 e8 02  	beq	a6, a4, 0x3dac <__netf2+0x48>
    3d90: 63 86 e8 00  	beq	a7, a4, 0x3d9c <__netf2+0x38>
    3d94: 05 45        	li	a0, 1
    3d96: 63 04 18 03  	beq	a6, a7, 0x3dbe <__netf2+0x5a>
    3d9a: 82 80        	ret
    3d9c: 5d 8e        	or	a2, a2, a5
    3d9e: 09 c6        	beqz	a2, 0x3da8 <__netf2+0x44>
    3da0: bd 93        	srli	a5, a5, 47
    3da2: 99 e3        	bnez	a5, 0x3da8 <__netf2+0x44>
    3da4: 73 60 18 00  	csrsi	fflags, 16
    3da8: 05 45        	li	a0, 1
    3daa: 82 80        	ret
    3dac: 33 67 ae 00  	or	a4, t3, a0
    3db0: 1d e7        	bnez	a4, 0x3dde <__netf2+0x7a>
    3db2: 05 45        	li	a0, 1
    3db4: e3 93 08 ff  	bne	a7, a6, 0x3d9a <__netf2+0x36>
    3db8: 33 e7 c7 00  	or	a4, a5, a2
    3dbc: 75 f3        	bnez	a4, 0x3da0 <__netf2+0x3c>
    3dbe: 05 45        	li	a0, 1
    3dc0: e3 1d fe fc  	bne	t3, a5, 0x3d9a <__netf2+0x36>
    3dc4: e3 1b c3 fc  	bne	t1, a2, 0x3d9a <__netf2+0x36>
    3dc8: 01 45        	li	a0, 0
    3dca: e3 88 d5 fc  	beq	a1, a3, 0x3d9a <__netf2+0x36>
    3dce: 05 45        	li	a0, 1
    3dd0: e3 15 08 fc  	bnez	a6, 0x3d9a <__netf2+0x36>
    3dd4: 33 6e 6e 00  	or	t3, t3, t1
    3dd8: 33 35 c0 01  	snez	a0, t3
    3ddc: 82 80        	ret
    3dde: 13 5e fe 02  	srli	t3, t3, 47
    3de2: e3 01 0e fc  	beqz	t3, 0x3da4 <__netf2+0x40>
    3de6: 05 45        	li	a0, 1
    3de8: e3 99 08 fb  	bne	a7, a6, 0x3d9a <__netf2+0x36>
    3dec: 5d 8e        	or	a2, a2, a5
    3dee: 4d fa        	bnez	a2, 0x3da0 <__netf2+0x3c>
    3df0: 82 80        	ret

0000000000003df2 <__multf3>:
    3df2: 59 71        	addi	sp, sp, -112
    3df4: a2 f0        	sd	s0, 96(sp)
    3df6: ca e8        	sd	s2, 80(sp)
    3df8: 66 ec        	sd	s9, 24(sp)
    3dfa: 86 f4        	sd	ra, 104(sp)
    3dfc: a6 ec        	sd	s1, 88(sp)
    3dfe: ce e4        	sd	s3, 72(sp)
    3e00: d2 e0        	sd	s4, 64(sp)
    3e02: 56 fc        	sd	s5, 56(sp)
    3e04: 5a f8        	sd	s6, 48(sp)
    3e06: 5e f4        	sd	s7, 40(sp)
    3e08: 62 f0        	sd	s8, 32(sp)
    3e0a: 6a e8        	sd	s10, 16(sp)
    3e0c: 6e e4        	sd	s11, 8(sp)
    3e0e: 2a 84        	mv	s0, a0
    3e10: b2 8c        	mv	s9, a2
    3e12: 36 89        	mv	s2, a3
    3e14: 73 2a 20 00  	csrr	s4, frm
    3e18: 21 67        	lui	a4, 8
    3e1a: 93 d7 05 03  	srli	a5, a1, 48
    3e1e: 7d 17        	addi	a4, a4, -1
    3e20: 93 9a 05 01  	slli	s5, a1, 16
    3e24: f9 8f        	and	a5, a5, a4
    3e26: 01 2a        	sext.w	s4, s4
    3e28: 93 da 0a 01  	srli	s5, s5, 16
    3e2c: 13 dc f5 03  	srli	s8, a1, 63
    3e30: 63 80 07 38  	beqz	a5, 0x41b0 <__multf3+0x3be>
    3e34: 1b 88 07 00  	sext.w	a6, a5
    3e38: 63 8a e7 30  	beq	a5, a4, 0x414c <__multf3+0x35a>
    3e3c: 8e 0a        	slli	s5, s5, 3
    3e3e: 13 57 d5 03  	srli	a4, a0, 61
    3e42: 33 67 57 01  	or	a4, a4, s5
    3e46: 71 78        	lui	a6, 1048572
    3e48: 85 4a        	li	s5, 1
    3e4a: ce 1a        	slli	s5, s5, 51
    3e4c: 05 08        	addi	a6, a6, 1
    3e4e: b3 6a 57 01  	or	s5, a4, s5
    3e52: 93 1b 35 00  	slli	s7, a0, 3
    3e56: b3 8d 07 01  	add	s11, a5, a6
    3e5a: 81 44        	li	s1, 0
    3e5c: 01 4d        	li	s10, 0
    3e5e: 81 49        	li	s3, 0
    3e60: 21 67        	lui	a4, 8
    3e62: 93 56 09 03  	srli	a3, s2, 48
    3e66: 93 07 f7 ff  	addi	a5, a4, -1
    3e6a: 13 14 09 01  	slli	s0, s2, 16
    3e6e: fd 8e        	and	a3, a3, a5
    3e70: 66 8b        	mv	s6, s9
    3e72: 41 80        	srli	s0, s0, 16
    3e74: 13 59 f9 03  	srli	s2, s2, 63
    3e78: 63 84 06 2e  	beqz	a3, 0x4160 <__multf3+0x36e>
    3e7c: 1b 85 06 00  	sext.w	a0, a3
    3e80: 63 81 f6 04  	beq	a3, a5, 0x3ec2 <__multf3+0xd0>
    3e84: 0e 04        	slli	s0, s0, 3
    3e86: 93 d7 dc 03  	srli	a5, s9, 61
    3e8a: 71 75        	lui	a0, 1048572
    3e8c: c1 8f        	or	a5, a5, s0
    3e8e: 05 05        	addi	a0, a0, 1
    3e90: 05 44        	li	s0, 1
    3e92: 36 95        	add	a0, a0, a3
    3e94: 4e 14        	slli	s0, s0, 51
    3e96: 5d 8c        	or	s0, s0, a5
    3e98: 6e 95        	add	a0, a0, s11
    3e9a: b3 47 2c 01  	xor	a5, s8, s2
    3e9e: 29 47        	li	a4, 10
    3ea0: 13 9b 3c 00  	slli	s6, s9, 3
    3ea4: 81 45        	li	a1, 0
    3ea6: 3e 86        	mv	a2, a5
    3ea8: 13 08 15 00  	addi	a6, a0, 1
    3eac: 63 5c 97 02  	bge	a4, s1, 0x3ee4 <__multf3+0xf2>
    3eb0: ad 47        	li	a5, 11
    3eb2: 62 86        	mv	a2, s8
    3eb4: 63 97 f4 0a  	bne	s1, a5, 0x3f62 <__multf3+0x170>
    3eb8: 4a 86        	mv	a2, s2
    3eba: a2 8a        	mv	s5, s0
    3ebc: da 8b        	mv	s7, s6
    3ebe: 2e 8d        	mv	s10, a1
    3ec0: 4d a0        	j	0x3f62 <__multf3+0x170>
    3ec2: b3 e7 8c 00  	or	a5, s9, s0
    3ec6: 6e 95        	add	a0, a0, s11
    3ec8: b5 e7        	bnez	a5, 0x3f34 <__multf3+0x142>
    3eca: b3 47 2c 01  	xor	a5, s8, s2
    3ece: 93 e4 24 00  	ori	s1, s1, 2
    3ed2: a9 45        	li	a1, 10
    3ed4: 3e 86        	mv	a2, a5
    3ed6: 33 88 ed 00  	add	a6, s11, a4
    3eda: 01 44        	li	s0, 0
    3edc: 01 4b        	li	s6, 0
    3ede: 63 cd 95 3a  	blt	a1, s1, 0x4298 <__multf3+0x4a6>
    3ee2: 89 45        	li	a1, 2
    3ee4: 09 47        	li	a4, 2
    3ee6: 63 48 97 06  	blt	a4, s1, 0x3f56 <__multf3+0x164>
    3eea: fd 14        	addi	s1, s1, -1
    3eec: 85 46        	li	a3, 1
    3eee: 63 ee 96 08  	bltu	a3, s1, 0x3f8a <__multf3+0x198>
    3ef2: 63 87 e5 24  	beq	a1, a4, 0x4140 <__multf3+0x34e>
    3ef6: 85 47        	li	a5, 1
    3ef8: 63 9f f5 2e  	bne	a1, a5, 0x41f6 <__multf3+0x404>
    3efc: b2 87        	mv	a5, a2
    3efe: 81 46        	li	a3, 0
    3f00: 01 44        	li	s0, 0
    3f02: 01 45        	li	a0, 0
    3f04: be 07        	slli	a5, a5, 15
    3f06: 93 15 04 01  	slli	a1, s0, 16
    3f0a: d5 8f        	or	a5, a5, a3
    3f0c: c2 17        	slli	a5, a5, 48
    3f0e: c1 81        	srli	a1, a1, 16
    3f10: dd 8d        	or	a1, a1, a5
    3f12: 63 99 09 44  	bnez	s3, 0x4364 <__multf3+0x572>
    3f16: a6 70        	ld	ra, 104(sp)
    3f18: 06 74        	ld	s0, 96(sp)
    3f1a: e6 64        	ld	s1, 88(sp)
    3f1c: 46 69        	ld	s2, 80(sp)
    3f1e: a6 69        	ld	s3, 72(sp)
    3f20: 06 6a        	ld	s4, 64(sp)
    3f22: e2 7a        	ld	s5, 56(sp)
    3f24: 42 7b        	ld	s6, 48(sp)
    3f26: a2 7b        	ld	s7, 40(sp)
    3f28: 02 7c        	ld	s8, 32(sp)
    3f2a: e2 6c        	ld	s9, 24(sp)
    3f2c: 42 6d        	ld	s10, 16(sp)
    3f2e: a2 6d        	ld	s11, 8(sp)
    3f30: 65 61        	addi	sp, sp, 112
    3f32: 82 80        	ret
    3f34: 93 57 f4 02  	srli	a5, s0, 47
    3f38: 85 8b        	andi	a5, a5, 1
    3f3a: 93 e4 34 00  	ori	s1, s1, 3
    3f3e: 91 e3        	bnez	a5, 0x3f42 <__multf3+0x150>
    3f40: c1 49        	li	s3, 16
    3f42: a1 65        	lui	a1, 8
    3f44: b3 47 2c 01  	xor	a5, s8, s2
    3f48: 29 47        	li	a4, 10
    3f4a: 33 88 bd 00  	add	a6, s11, a1
    3f4e: 3e 86        	mv	a2, a5
    3f50: 8d 45        	li	a1, 3
    3f52: 63 44 97 34  	blt	a4, s1, 0x429a <__multf3+0x4a8>
    3f56: 05 47        	li	a4, 1
    3f58: 33 17 97 00  	sll	a4, a4, s1
    3f5c: 93 76 07 53  	andi	a3, a4, 1328
    3f60: 91 ce        	beqz	a3, 0x3f7c <__multf3+0x18a>
    3f62: 89 47        	li	a5, 2
    3f64: 63 0e fd 1c  	beq	s10, a5, 0x4140 <__multf3+0x34e>
    3f68: 8d 47        	li	a5, 3
    3f6a: 63 0f fd 4e  	beq	s10, a5, 0x4468 <__multf3+0x676>
    3f6e: ea 85        	mv	a1, s10
    3f70: 85 47        	li	a5, 1
    3f72: 56 84        	mv	s0, s5
    3f74: 5e 8b        	mv	s6, s7
    3f76: e3 83 f5 f8  	beq	a1, a5, 0x3efc <__multf3+0x10a>
    3f7a: b5 ac        	j	0x41f6 <__multf3+0x404>
    3f7c: 93 76 07 24  	andi	a3, a4, 576
    3f80: 63 9b 06 48  	bnez	a3, 0x4416 <__multf3+0x624>
    3f84: 13 77 87 08  	andi	a4, a4, 136
    3f88: 05 fb        	bnez	a4, 0x3eb8 <__multf3+0xc6>
    3f8a: 7d 57        	li	a4, -1
    3f8c: 01 93        	srli	a4, a4, 32
    3f8e: b3 f6 eb 00  	and	a3, s7, a4
    3f92: 93 d4 0b 02  	srli	s1, s7, 32
    3f96: 13 53 0b 02  	srli	t1, s6, 32
    3f9a: 33 77 eb 00  	and	a4, s6, a4
    3f9e: b3 03 d7 02  	<unknown>
    3fa2: b3 8e 7a 01  	add	t4, s5, s7
    3fa6: b3 08 64 01  	add	a7, s0, s6
    3faa: 33 bf 7e 01  	sltu	t5, t4, s7
    3fae: b3 bf 68 01  	sltu	t6, a7, s6
    3fb2: fa 8b        	mv	s7, t5
    3fb4: 7e 8b        	mv	s6, t6
    3fb6: 33 87 e4 02  	<unknown>
    3fba: 93 d5 03 02  	srli	a1, t2, 32
    3fbe: b3 06 d3 02  	<unknown>
    3fc2: ba 96        	add	a3, a3, a4
    3fc4: b6 95        	add	a1, a1, a3
    3fc6: b3 84 64 02  	<unknown>
    3fca: 63 f5 e5 00  	bgeu	a1, a4, 0x3fd4 <__multf3+0x1e2>
    3fce: 05 47        	li	a4, 1
    3fd0: 02 17        	slli	a4, a4, 32
    3fd2: ba 94        	add	s1, s1, a4
    3fd4: 7d 57        	li	a4, -1
    3fd6: 01 93        	srli	a4, a4, 32
    3fd8: b3 f6 ee 00  	and	a3, t4, a4
    3fdc: 33 f3 e8 00  	and	t1, a7, a4
    3fe0: 13 d9 0e 02  	srli	s2, t4, 32
    3fe4: 93 d2 08 02  	srli	t0, a7, 32
    3fe8: 33 0c d3 02  	<unknown>
    3fec: 33 fe e5 00  	and	t3, a1, a4
    3ff0: 02 1e        	slli	t3, t3, 32
    3ff2: 33 f7 e3 00  	and	a4, t2, a4
    3ff6: 3a 9e        	add	t3, t3, a4
    3ff8: 81 91        	srli	a1, a1, 32
    3ffa: a6 95        	add	a1, a1, s1
    3ffc: 33 03 69 02  	<unknown>
    4000: 13 57 0c 02  	srli	a4, s8, 32
    4004: b3 86 d2 02  	<unknown>
    4008: 9a 96        	add	a3, a3, t1
    400a: 36 97        	add	a4, a4, a3
    400c: 33 09 59 02  	<unknown>
    4010: 63 75 67 00  	bgeu	a4, t1, 0x401a <__multf3+0x228>
    4014: 85 46        	li	a3, 1
    4016: 82 16        	slli	a3, a3, 32
    4018: 36 99        	add	s2, s2, a3
    401a: fd 56        	li	a3, -1
    401c: 81 92        	srli	a3, a3, 32
    401e: 93 d4 0a 02  	srli	s1, s5, 32
    4022: 93 5c 04 02  	srli	s9, s0, 32
    4026: b3 fa da 00  	and	s5, s5, a3
    402a: 75 8c        	and	s0, s0, a3
    402c: b3 83 8a 02  	<unknown>
    4030: b3 72 d7 00  	and	t0, a4, a3
    4034: 82 12        	slli	t0, t0, 32
    4036: 33 7c dc 00  	and	s8, s8, a3
    403a: 01 93        	srli	a4, a4, 32
    403c: e2 92        	add	t0, t0, s8
    403e: 33 84 84 02  	<unknown>
    4042: 13 d3 03 02  	srli	t1, t2, 32
    4046: b3 8a 5c 03  	<unknown>
    404a: a2 9a        	add	s5, s5, s0
    404c: 56 93        	add	t1, t1, s5
    404e: b3 84 94 03  	<unknown>
    4052: 63 75 83 00  	bgeu	t1, s0, 0x405c <__multf3+0x26a>
    4056: 85 46        	li	a3, 1
    4058: 82 16        	slli	a3, a3, 32
    405a: b6 94        	add	s1, s1, a3
    405c: ae 92        	add	t0, t0, a1
    405e: b3 b6 b2 00  	sltu	a3, t0, a1
    4062: 36 97        	add	a4, a4, a3
    4064: 33 0b 60 41  	neg	s6, s6
    4068: 33 04 27 01  	add	s0, a4, s2
    406c: 33 7b db 01  	and	s6, s6, t4
    4070: b3 0b 70 41  	neg	s7, s7
    4074: fd 5e        	li	t4, -1
    4076: 22 9b        	add	s6, s6, s0
    4078: 93 de 0e 02  	srli	t4, t4, 32
    407c: 33 7f ff 01  	and	t5, t5, t6
    4080: b3 fb 1b 01  	and	s7, s7, a7
    4084: b3 36 d4 00  	sltu	a3, s0, a3
    4088: da 9b        	add	s7, s7, s6
    408a: 33 77 d3 01  	and	a4, t1, t4
    408e: fa 96        	add	a3, a3, t5
    4090: b3 8f c2 41  	sub	t6, t0, t3
    4094: 33 3f 8b 00  	sltu	t5, s6, s0
    4098: b3 f3 d3 01  	and	t2, t2, t4
    409c: b3 88 bb 40  	sub	a7, s7, a1
    40a0: fa 96        	add	a3, a3, t5
    40a2: 13 53 03 02  	srli	t1, t1, 32
    40a6: 02 17        	slli	a4, a4, 32
    40a8: b3 be 6b 01  	sltu	t4, s7, s6
    40ac: 33 bf f2 01  	sltu	t5, t0, t6
    40b0: 1e 97        	add	a4, a4, t2
    40b2: 26 93        	add	t1, t1, s1
    40b4: b3 b3 1b 01  	sltu	t2, s7, a7
    40b8: f6 96        	add	a3, a3, t4
    40ba: b3 88 e8 41  	sub	a7, a7, t5
    40be: 63 f4 f2 01  	bgeu	t0, t6, 0x40c6 <__multf3+0x2d4>
    40c2: 63 81 75 3b  	beq	a1, s7, 0x4464 <__multf3+0x672>
    40c6: 33 8f ef 40  	sub	t5, t6, a4
    40ca: b3 85 68 40  	sub	a1, a7, t1
    40ce: b3 be ef 01  	sltu	t4, t6, t5
    40d2: 9a 96        	add	a3, a3, t1
    40d4: b3 b8 b8 00  	sltu	a7, a7, a1
    40d8: 33 03 d7 41  	sub	t1, a4, t4
    40dc: 63 f6 ef 01  	bgeu	t6, t5, 0x40e8 <__multf3+0x2f6>
    40e0: 93 be 15 00  	seqz	t4, a1
    40e4: b3 e8 1e 01  	or	a7, t4, a7
    40e8: 9a 95        	add	a1, a1, t1
    40ea: 33 b4 e5 00  	sltu	s0, a1, a4
    40ee: 36 94        	add	s0, s0, a3
    40f0: 33 04 74 40  	sub	s0, s0, t2
    40f4: 33 04 14 41  	sub	s0, s0, a7
    40f8: 13 1b df 00  	slli	s6, t5, 13
    40fc: 36 04        	slli	s0, s0, 13
    40fe: 33 6b cb 01  	or	s6, s6, t3
    4102: 13 57 3f 03  	srli	a4, t5, 51
    4106: 93 56 44 03  	srli	a3, s0, 52
    410a: 33 3b 60 01  	snez	s6, s6
    410e: 93 d8 35 03  	srli	a7, a1, 51
    4112: 33 6b eb 00  	or	s6, s6, a4
    4116: b6 05        	slli	a1, a1, 13
    4118: 13 f7 16 00  	andi	a4, a3, 1
    411c: 33 64 14 01  	or	s0, s0, a7
    4120: 33 6b bb 00  	or	s6, s6, a1
    4124: 79 cb        	beqz	a4, 0x41fa <__multf3+0x408>
    4126: 13 57 1b 00  	srli	a4, s6, 1
    412a: 13 7b 1b 00  	andi	s6, s6, 1
    412e: 93 16 f4 03  	slli	a3, s0, 63
    4132: 33 67 67 01  	or	a4, a4, s6
    4136: 33 6b d7 00  	or	s6, a4, a3
    413a: 05 80        	srli	s0, s0, 1
    413c: 42 85        	mv	a0, a6
    413e: 75 a8        	j	0x41fa <__multf3+0x408>
    4140: a1 66        	lui	a3, 8
    4142: b2 87        	mv	a5, a2
    4144: fd 16        	addi	a3, a3, -1
    4146: 01 44        	li	s0, 0
    4148: 01 45        	li	a0, 0
    414a: 6d bb        	j	0x3f04 <__multf3+0x112>
    414c: b3 eb aa 00  	or	s7, s5, a0
    4150: 63 93 0b 10  	bnez	s7, 0x4256 <__multf3+0x464>
    4154: 81 4a        	li	s5, 0
    4156: a1 44        	li	s1, 8
    4158: c2 8d        	mv	s11, a6
    415a: 09 4d        	li	s10, 2
    415c: 81 49        	li	s3, 0
    415e: 09 b3        	j	0x3e60 <__multf3+0x6e>
    4160: b3 e7 8c 00  	or	a5, s9, s0
    4164: 63 8b 07 10  	beqz	a5, 0x427a <__multf3+0x488>
    4168: 63 03 04 22  	beqz	s0, 0x438e <__multf3+0x59c>
    416c: 22 85        	mv	a0, s0
    416e: ef 10 40 06  	jal	0x51d2 <__clzdi2>
    4172: 1b 07 05 00  	sext.w	a4, a0
    4176: 9b 07 15 ff  	addiw	a5, a0, -15
    417a: 93 06 d0 03  	li	a3, 61
    417e: 1b 8b 37 00  	addiw	s6, a5, 3
    4182: bb 87 f6 40  	subw	a5, a3, a5
    4186: 33 14 64 01  	sll	s0, s0, s6
    418a: b3 d7 fc 00  	srl	a5, s9, a5
    418e: 5d 8c        	or	s0, s0, a5
    4190: 33 9b 6c 01  	sll	s6, s9, s6
    4194: 71 75        	lui	a0, 1048572
    4196: 45 05        	addi	a0, a0, 17
    4198: 19 8d        	sub	a0, a0, a4
    419a: 6e 95        	add	a0, a0, s11
    419c: b3 47 2c 01  	xor	a5, s8, s2
    41a0: 29 47        	li	a4, 10
    41a2: 81 45        	li	a1, 0
    41a4: 3e 86        	mv	a2, a5
    41a6: 13 08 15 00  	addi	a6, a0, 1
    41aa: e3 43 97 d0  	blt	a4, s1, 0x3eb0 <__multf3+0xbe>
    41ae: 1d bb        	j	0x3ee4 <__multf3+0xf2>
    41b0: b3 eb aa 00  	or	s7, s5, a0
    41b4: 63 8d 0b 0a  	beqz	s7, 0x426e <__multf3+0x47c>
    41b8: 63 89 0a 1a  	beqz	s5, 0x436a <__multf3+0x578>
    41bc: 56 85        	mv	a0, s5
    41be: ef 10 40 01  	jal	0x51d2 <__clzdi2>
    41c2: 1b 07 05 00  	sext.w	a4, a0
    41c6: 9b 07 15 ff  	addiw	a5, a0, -15
    41ca: 93 06 d0 03  	li	a3, 61
    41ce: 9b 8b 37 00  	addiw	s7, a5, 3
    41d2: bb 87 f6 40  	subw	a5, a3, a5
    41d6: b3 9a 7a 01  	sll	s5, s5, s7
    41da: b3 57 f4 00  	srl	a5, s0, a5
    41de: b3 ea 57 01  	or	s5, a5, s5
    41e2: b3 1b 74 01  	sll	s7, s0, s7
    41e6: 71 78        	lui	a6, 1048572
    41e8: 45 08        	addi	a6, a6, 17
    41ea: b3 0d e8 40  	sub	s11, a6, a4
    41ee: 81 44        	li	s1, 0
    41f0: 01 4d        	li	s10, 0
    41f2: 81 49        	li	s3, 0
    41f4: b5 b1        	j	0x3e60 <__multf3+0x6e>
    41f6: b2 87        	mv	a5, a2
    41f8: 42 85        	mv	a0, a6
    41fa: 11 67        	lui	a4, 4
    41fc: 7d 17        	addi	a4, a4, -1
    41fe: 2a 97        	add	a4, a4, a0
    4200: 63 55 e0 0a  	blez	a4, 0x42aa <__multf3+0x4b8>
    4204: 93 76 7b 00  	andi	a3, s6, 7
    4208: 99 ca        	beqz	a3, 0x421e <__multf3+0x42c>
    420a: 89 46        	li	a3, 2
    420c: 93 e9 19 00  	ori	s3, s3, 1
    4210: 63 02 da 2a  	beq	s4, a3, 0x44b4 <__multf3+0x6c2>
    4214: 8d 46        	li	a3, 3
    4216: 63 0e da 22  	beq	s4, a3, 0x4452 <__multf3+0x660>
    421a: 63 00 0a 22  	beqz	s4, 0x443a <__multf3+0x648>
    421e: 93 56 44 03  	srli	a3, s0, 52
    4222: 85 8a        	andi	a3, a3, 1
    4224: 99 c6        	beqz	a3, 0x4232 <__multf3+0x440>
    4226: 7d 57        	li	a4, -1
    4228: 52 17        	slli	a4, a4, 52
    422a: 7d 17        	addi	a4, a4, -1
    422c: 79 8c        	and	s0, s0, a4
    422e: 11 67        	lui	a4, 4
    4230: 2a 97        	add	a4, a4, a0
    4232: a1 66        	lui	a3, 8
    4234: 93 85 e6 ff  	addi	a1, a3, -2
    4238: 63 c0 e5 1c  	blt	a1, a4, 0x43f8 <__multf3+0x606>
    423c: fd 16        	addi	a3, a3, -1
    423e: f9 8e        	and	a3, a3, a4
    4240: 13 15 d4 03  	slli	a0, s0, 61
    4244: 13 5b 3b 00  	srli	s6, s6, 3
    4248: 36 04        	slli	s0, s0, 13
    424a: c2 16        	slli	a3, a3, 48
    424c: 33 65 65 01  	or	a0, a0, s6
    4250: 41 80        	srli	s0, s0, 16
    4252: c1 92        	srli	a3, a3, 48
    4254: 45 b9        	j	0x3f04 <__multf3+0x112>
    4256: 93 d9 fa 02  	srli	s3, s5, 47
    425a: 93 c9 19 00  	xori	s3, s3, 1
    425e: 93 f9 19 00  	andi	s3, s3, 1
    4262: 92 09        	slli	s3, s3, 4
    4264: aa 8b        	mv	s7, a0
    4266: b1 44        	li	s1, 12
    4268: c2 8d        	mv	s11, a6
    426a: 0d 4d        	li	s10, 3
    426c: d5 be        	j	0x3e60 <__multf3+0x6e>
    426e: 81 4a        	li	s5, 0
    4270: 91 44        	li	s1, 4
    4272: 81 4d        	li	s11, 0
    4274: 05 4d        	li	s10, 1
    4276: 81 49        	li	s3, 0
    4278: e5 b6        	j	0x3e60 <__multf3+0x6e>
    427a: 6e 85        	mv	a0, s11
    427c: b3 47 2c 01  	xor	a5, s8, s2
    4280: 93 e4 14 00  	ori	s1, s1, 1
    4284: 29 47        	li	a4, 10
    4286: 01 44        	li	s0, 0
    4288: 01 4b        	li	s6, 0
    428a: 85 45        	li	a1, 1
    428c: 3e 86        	mv	a2, a5
    428e: 13 08 15 00  	addi	a6, a0, 1
    4292: e3 4f 97 c0  	blt	a4, s1, 0x3eb0 <__multf3+0xbe>
    4296: b9 b1        	j	0x3ee4 <__multf3+0xf2>
    4298: 89 45        	li	a1, 2
    429a: bd 47        	li	a5, 15
    429c: e3 9a f4 c0  	bne	s1, a5, 0x3eb0 <__multf3+0xbe>
    42a0: 05 44        	li	s0, 1
    42a2: 81 47        	li	a5, 0
    42a4: 3e 14        	slli	s0, s0, 47
    42a6: 01 45        	li	a0, 0
    42a8: b1 b9        	j	0x3f04 <__multf3+0x112>
    42aa: 85 46        	li	a3, 1
    42ac: b3 85 e6 40  	sub	a1, a3, a4
    42b0: 63 13 07 10  	bnez	a4, 0x43b6 <__multf3+0x5c4>
    42b4: 93 76 7b 00  	andi	a3, s6, 7
    42b8: 22 87        	mv	a4, s0
    42ba: 9d c6        	beqz	a3, 0x42e8 <__multf3+0x4f6>
    42bc: 89 46        	li	a3, 2
    42be: 93 e9 19 00  	ori	s3, s3, 1
    42c2: 63 00 da 24  	beq	s4, a3, 0x4502 <__multf3+0x710>
    42c6: 8d 46        	li	a3, 3
    42c8: 63 03 da 22  	beq	s4, a3, 0x44ee <__multf3+0x6fc>
    42cc: 63 1e 0a 00  	bnez	s4, 0x42e8 <__multf3+0x4f6>
    42d0: 93 76 fb 00  	andi	a3, s6, 15
    42d4: 11 45        	li	a0, 4
    42d6: 63 89 a6 00  	beq	a3, a0, 0x42e8 <__multf3+0x4f6>
    42da: 13 37 cb ff  	sltiu	a4, s6, -4
    42de: 13 47 17 00  	xori	a4, a4, 1
    42e2: 02 17        	slli	a4, a4, 32
    42e4: 01 93        	srli	a4, a4, 32
    42e6: 22 97        	add	a4, a4, s0
    42e8: 51 93        	srli	a4, a4, 52
    42ea: 13 47 17 00  	xori	a4, a4, 1
    42ee: 05 8b        	andi	a4, a4, 1
    42f0: 9b 86 05 00  	sext.w	a3, a1
    42f4: 93 05 00 04  	li	a1, 64
    42f8: 95 9d        	subw	a1, a1, a3
    42fa: 33 15 b4 00  	sll	a0, s0, a1
    42fe: 33 58 db 00  	srl	a6, s6, a3
    4302: b3 15 bb 00  	sll	a1, s6, a1
    4306: b3 35 b0 00  	snez	a1, a1
    430a: 33 65 05 01  	or	a0, a0, a6
    430e: 4d 8d        	or	a0, a0, a1
    4310: 93 75 75 00  	andi	a1, a0, 7
    4314: b3 56 d4 00  	srl	a3, s0, a3
    4318: 95 c5        	beqz	a1, 0x4344 <__multf3+0x552>
    431a: 89 45        	li	a1, 2
    431c: 93 e9 19 00  	ori	s3, s3, 1
    4320: 63 0d ba 1e  	beq	s4, a1, 0x451a <__multf3+0x728>
    4324: 8d 45        	li	a1, 3
    4326: 63 01 ba 1e  	beq	s4, a1, 0x4508 <__multf3+0x716>
    432a: 63 1d 0a 00  	bnez	s4, 0x4344 <__multf3+0x552>
    432e: 13 76 f5 00  	andi	a2, a0, 15
    4332: 91 45        	li	a1, 4
    4334: 63 08 b6 00  	beq	a2, a1, 0x4344 <__multf3+0x552>
    4338: 13 06 45 00  	addi	a2, a0, 4
    433c: 33 35 a6 00  	sltu	a0, a2, a0
    4340: aa 96        	add	a3, a3, a0
    4342: 32 85        	mv	a0, a2
    4344: 05 48        	li	a6, 1
    4346: 13 16 38 03  	slli	a2, a6, 51
    434a: 75 8e        	and	a2, a2, a3
    434c: 63 08 06 18  	beqz	a2, 0x44dc <__multf3+0x6ea>
    4350: 93 e9 19 00  	ori	s3, s3, 1
    4354: 63 1e 07 16  	bnez	a4, 0x44d0 <__multf3+0x6de>
    4358: 93 95 f7 03  	slli	a1, a5, 63
    435c: 42 18        	slli	a6, a6, 48
    435e: 01 45        	li	a0, 0
    4360: b3 e5 05 01  	or	a1, a1, a6
    4364: 73 a0 19 00  	csrs	fflags, s3
    4368: 7d b6        	j	0x3f16 <__multf3+0x124>
    436a: ef 00 90 66  	jal	0x51d2 <__clzdi2>
    436e: 1b 07 05 04  	addiw	a4, a0, 64
    4372: 93 06 17 ff  	addi	a3, a4, -15
    4376: 13 06 c0 03  	li	a2, 60
    437a: 9b 87 06 00  	sext.w	a5, a3
    437e: e3 56 d6 e4  	bge	a2, a3, 0x41ca <__multf3+0x3d8>
    4382: 9b 87 37 fc  	addiw	a5, a5, -61
    4386: 81 4b        	li	s7, 0
    4388: b3 1a f4 00  	sll	s5, s0, a5
    438c: a9 bd        	j	0x41e6 <__multf3+0x3f4>
    438e: 66 85        	mv	a0, s9
    4390: ef 00 30 64  	jal	0x51d2 <__clzdi2>
    4394: 1b 07 05 04  	addiw	a4, a0, 64
    4398: 93 06 17 ff  	addi	a3, a4, -15
    439c: 13 06 c0 03  	li	a2, 60
    43a0: 9b 87 06 00  	sext.w	a5, a3
    43a4: e3 5b d6 dc  	bge	a2, a3, 0x417a <__multf3+0x388>
    43a8: 9b 87 37 fc  	addiw	a5, a5, -61
    43ac: b3 97 fc 00  	sll	a5, s9, a5
    43b0: 3e 84        	mv	s0, a5
    43b2: 01 4b        	li	s6, 0
    43b4: c5 b3        	j	0x4194 <__multf3+0x3a2>
    43b6: 13 07 40 07  	li	a4, 116
    43ba: 63 5e b7 0a  	bge	a4, a1, 0x4476 <__multf3+0x684>
    43be: 33 65 8b 00  	or	a0, s6, s0
    43c2: 09 cd        	beqz	a0, 0x43dc <__multf3+0x5ea>
    43c4: 09 47        	li	a4, 2
    43c6: 93 e9 19 00  	ori	s3, s3, 1
    43ca: 32 85        	mv	a0, a2
    43cc: 63 08 ea 00  	beq	s4, a4, 0x43dc <__multf3+0x5ea>
    43d0: 0d 47        	li	a4, 3
    43d2: 01 45        	li	a0, 0
    43d4: 63 14 ea 00  	bne	s4, a4, 0x43dc <__multf3+0x5ea>
    43d8: 33 85 c6 40  	sub	a0, a3, a2
    43dc: 93 e9 29 00  	ori	s3, s3, 2
    43e0: 01 47        	li	a4, 0
    43e2: 01 44        	li	s0, 0
    43e4: 93 15 04 01  	slli	a1, s0, 16
    43e8: 42 17        	slli	a4, a4, 48
    43ea: c1 81        	srli	a1, a1, 16
    43ec: fe 17        	slli	a5, a5, 63
    43ee: d9 8d        	or	a1, a1, a4
    43f0: dd 8d        	or	a1, a1, a5
    43f2: 73 a0 19 00  	csrs	fflags, s3
    43f6: 05 b6        	j	0x3f16 <__multf3+0x124>
    43f8: 09 47        	li	a4, 2
    43fa: 63 06 ea 02  	beq	s4, a4, 0x4426 <__multf3+0x634>
    43fe: 0d 47        	li	a4, 3
    4400: 63 0b ea 02  	beq	s4, a4, 0x4436 <__multf3+0x644>
    4404: 63 02 0a 02  	beqz	s4, 0x4428 <__multf3+0x636>
    4408: 7d 54        	li	s0, -1
    440a: 2e 87        	mv	a4, a1
    440c: 41 80        	srli	s0, s0, 16
    440e: 7d 55        	li	a0, -1
    4410: 93 e9 59 00  	ori	s3, s3, 5
    4414: c1 bf        	j	0x43e4 <__multf3+0x5f2>
    4416: b7 f5 ff 0f  	lui	a1, 65535
    441a: 01 45        	li	a0, 0
    441c: 8e 15        	slli	a1, a1, 35
    441e: c1 49        	li	s3, 16
    4420: 73 a0 19 00  	csrs	fflags, s3
    4424: cd bc        	j	0x3f16 <__multf3+0x124>
    4426: 6d d2        	beqz	a2, 0x4408 <__multf3+0x616>
    4428: 13 87 f6 ff  	addi	a4, a3, -1
    442c: 01 44        	li	s0, 0
    442e: 01 45        	li	a0, 0
    4430: 93 e9 59 00  	ori	s3, s3, 5
    4434: 45 bf        	j	0x43e4 <__multf3+0x5f2>
    4436: 69 fa        	bnez	a2, 0x4408 <__multf3+0x616>
    4438: c5 bf        	j	0x4428 <__multf3+0x636>
    443a: 93 76 fb 00  	andi	a3, s6, 15
    443e: 91 45        	li	a1, 4
    4440: e3 8f b6 dc  	beq	a3, a1, 0x421e <__multf3+0x42c>
    4444: 93 06 4b 00  	addi	a3, s6, 4
    4448: 33 bb 66 01  	sltu	s6, a3, s6
    444c: 5a 94        	add	s0, s0, s6
    444e: 36 8b        	mv	s6, a3
    4450: f9 b3        	j	0x421e <__multf3+0x42c>
    4452: e3 16 06 dc  	bnez	a2, 0x421e <__multf3+0x42c>
    4456: 93 06 8b 00  	addi	a3, s6, 8
    445a: 33 bb 66 01  	sltu	s6, a3, s6
    445e: 5a 94        	add	s0, s0, s6
    4460: 36 8b        	mv	s6, a3
    4462: 75 bb        	j	0x421e <__multf3+0x42c>
    4464: 85 43        	li	t2, 1
    4466: 85 b1        	j	0x40c6 <__multf3+0x2d4>
    4468: a1 66        	lui	a3, 8
    446a: 05 44        	li	s0, 1
    446c: 81 47        	li	a5, 0
    446e: fd 16        	addi	a3, a3, -1
    4470: 3e 14        	slli	s0, s0, 47
    4472: 01 45        	li	a0, 0
    4474: 41 bc        	j	0x3f04 <__multf3+0x112>
    4476: 13 07 f0 03  	li	a4, 63
    447a: 9b 86 05 00  	sext.w	a3, a1
    447e: 63 51 b7 0a  	bge	a4, a1, 0x4520 <__multf3+0x72e>
    4482: 1b 87 06 fc  	addiw	a4, a3, -64
    4486: 13 05 00 04  	li	a0, 64
    448a: 33 57 e4 00  	srl	a4, s0, a4
    448e: 63 8a a5 00  	beq	a1, a0, 0x44a2 <__multf3+0x6b0>
    4492: 93 05 00 08  	li	a1, 128
    4496: bb 86 d5 40  	subw	a3, a1, a3
    449a: b3 16 d4 00  	sll	a3, s0, a3
    449e: 33 6b db 00  	or	s6, s6, a3
    44a2: 33 35 60 01  	snez	a0, s6
    44a6: 59 8d        	or	a0, a0, a4
    44a8: 13 77 75 00  	andi	a4, a0, 7
    44ac: 19 c7        	beqz	a4, 0x44ba <__multf3+0x6c8>
    44ae: 05 47        	li	a4, 1
    44b0: 81 46        	li	a3, 0
    44b2: a5 b5        	j	0x431a <__multf3+0x528>
    44b4: e3 05 06 d6  	beqz	a2, 0x421e <__multf3+0x42c>
    44b8: 79 bf        	j	0x4456 <__multf3+0x664>
    44ba: 0d 81        	srli	a0, a0, 3
    44bc: 01 44        	li	s0, 0
    44be: 13 f7 19 00  	andi	a4, s3, 1
    44c2: 81 46        	li	a3, 0
    44c4: e3 00 07 a4  	beqz	a4, 0x3f04 <__multf3+0x112>
    44c8: 01 47        	li	a4, 0
    44ca: 93 e9 29 00  	ori	s3, s3, 2
    44ce: 19 bf        	j	0x43e4 <__multf3+0x5f2>
    44d0: 05 47        	li	a4, 1
    44d2: 01 44        	li	s0, 0
    44d4: 01 45        	li	a0, 0
    44d6: 93 e9 29 00  	ori	s3, s3, 2
    44da: 29 b7        	j	0x43e4 <__multf3+0x5f2>
    44dc: 13 94 d6 00  	slli	s0, a3, 13
    44e0: 0d 81        	srli	a0, a0, 3
    44e2: f6 16        	slli	a3, a3, 61
    44e4: 41 80        	srli	s0, s0, 16
    44e6: 55 8d        	or	a0, a0, a3
    44e8: 79 fb        	bnez	a4, 0x44be <__multf3+0x6cc>
    44ea: 81 46        	li	a3, 0
    44ec: 21 bc        	j	0x3f04 <__multf3+0x112>
    44ee: e3 1d 06 de  	bnez	a2, 0x42e8 <__multf3+0x4f6>
    44f2: 13 37 8b ff  	sltiu	a4, s6, -8
    44f6: 13 47 17 00  	xori	a4, a4, 1
    44fa: 02 17        	slli	a4, a4, 32
    44fc: 01 93        	srli	a4, a4, 32
    44fe: 22 97        	add	a4, a4, s0
    4500: e5 b3        	j	0x42e8 <__multf3+0x4f6>
    4502: e3 03 06 de  	beqz	a2, 0x42e8 <__multf3+0x4f6>
    4506: f5 b7        	j	0x44f2 <__multf3+0x700>
    4508: e3 1e 06 e2  	bnez	a2, 0x4344 <__multf3+0x552>
    450c: 13 06 85 00  	addi	a2, a0, 8
    4510: 33 35 a6 00  	sltu	a0, a2, a0
    4514: aa 96        	add	a3, a3, a0
    4516: 32 85        	mv	a0, a2
    4518: 35 b5        	j	0x4344 <__multf3+0x552>
    451a: e3 05 06 e2  	beqz	a2, 0x4344 <__multf3+0x552>
    451e: fd b7        	j	0x450c <__multf3+0x71a>
    4520: 05 47        	li	a4, 1
    4522: c9 bb        	j	0x42f4 <__multf3+0x502>

0000000000004524 <__subtf3>:
    4524: 79 71        	addi	sp, sp, -48
    4526: 06 f4        	sd	ra, 40(sp)
    4528: 22 f0        	sd	s0, 32(sp)
    452a: 26 ec        	sd	s1, 24(sp)
    452c: 4a e8        	sd	s2, 16(sp)
    452e: 4e e4        	sd	s3, 8(sp)
    4530: 52 e0        	sd	s4, 0(sp)
    4532: f3 29 20 00  	csrr	s3, frm
    4536: fd 5e        	li	t4, -1
    4538: 13 d8 0e 01  	srli	a6, t4, 16
    453c: a1 68        	lui	a7, 8
    453e: b3 f7 05 01  	and	a5, a1, a6
    4542: fd 18        	addi	a7, a7, -1
    4544: 13 d7 06 03  	srli	a4, a3, 48
    4548: 33 f8 06 01  	and	a6, a3, a6
    454c: 13 d4 05 03  	srli	s0, a1, 48
    4550: 13 5e d5 03  	srli	t3, a0, 61
    4554: 13 53 d6 03  	srli	t1, a2, 61
    4558: 8e 07        	slli	a5, a5, 3
    455a: 0e 08        	slli	a6, a6, 3
    455c: 33 77 17 01  	and	a4, a4, a7
    4560: 13 d9 f5 03  	srli	s2, a1, 63
    4564: 81 29        	sext.w	s3, s3
    4566: b3 65 fe 00  	or	a1, t3, a5
    456a: 33 74 14 01  	and	s0, s0, a7
    456e: 33 6e 03 01  	or	t3, t1, a6
    4572: 13 1f 35 00  	slli	t5, a0, 3
    4576: fd 92        	srli	a3, a3, 63
    4578: 13 13 36 00  	slli	t1, a2, 3
    457c: 63 0b 17 1d  	beq	a4, a7, 0x4752 <__subtf3+0x22e>
    4580: 93 c6 16 00  	xori	a3, a3, 1
    4584: 63 0f d9 16  	beq	s2, a3, 0x4702 <__subtf3+0x1de>
    4588: 3b 08 e4 40  	subw	a6, s0, a4
    458c: 63 5c 00 1d  	blez	a6, 0x4764 <__subtf3+0x240>
    4590: 63 07 07 22  	beqz	a4, 0x47be <__subtf3+0x29a>
    4594: a1 67        	lui	a5, 8
    4596: fd 17        	addi	a5, a5, -1
    4598: 63 0e f4 22  	beq	s0, a5, 0x47d4 <__subtf3+0x2b0>
    459c: 85 47        	li	a5, 1
    459e: ce 17        	slli	a5, a5, 51
    45a0: 33 6e fe 00  	or	t3, t3, a5
    45a4: 93 07 40 07  	li	a5, 116
    45a8: 63 c6 07 41  	blt	a5, a6, 0x49b4 <__subtf3+0x490>
    45ac: 93 07 f0 03  	li	a5, 63
    45b0: 63 c7 07 59  	blt	a5, a6, 0x4b3e <__subtf3+0x61a>
    45b4: 93 07 00 04  	li	a5, 64
    45b8: bb 87 07 41  	subw	a5, a5, a6
    45bc: b3 14 fe 00  	sll	s1, t3, a5
    45c0: 33 57 03 01  	srl	a4, t1, a6
    45c4: b3 17 f3 00  	sll	a5, t1, a5
    45c8: d9 8c        	or	s1, s1, a4
    45ca: b3 37 f0 00  	snez	a5, a5
    45ce: 33 53 0e 01  	srl	t1, t3, a6
    45d2: dd 8c        	or	s1, s1, a5
    45d4: b3 85 65 40  	sub	a1, a1, t1
    45d8: b3 04 9f 40  	sub	s1, t5, s1
    45dc: 33 3f 9f 00  	sltu	t5, t5, s1
    45e0: b3 85 e5 41  	sub	a1, a1, t5
    45e4: 93 d7 35 03  	srli	a5, a1, 51
    45e8: 85 8b        	andi	a5, a5, 1
    45ea: 63 83 07 32  	beqz	a5, 0x4910 <__subtf3+0x3ec>
    45ee: 13 9a d5 00  	slli	s4, a1, 13
    45f2: 13 5a da 00  	srli	s4, s4, 13
    45f6: 63 0b 0a 34  	beqz	s4, 0x494c <__subtf3+0x428>
    45fa: 52 85        	mv	a0, s4
    45fc: ef 00 70 3d  	jal	0x51d2 <__clzdi2>
    4600: 51 35        	addiw	a0, a0, -12
    4602: 93 05 00 04  	li	a1, 64
    4606: 89 9d        	subw	a1, a1, a0
    4608: 33 1a aa 00  	sll	s4, s4, a0
    460c: b3 d5 b4 00  	srl	a1, s1, a1
    4610: b3 e5 45 01  	or	a1, a1, s4
    4614: 33 9a a4 00  	sll	s4, s1, a0
    4618: 63 46 85 2e  	blt	a0, s0, 0x4904 <__subtf3+0x3e0>
    461c: 01 9d        	subw	a0, a0, s0
    461e: 1b 07 15 00  	addiw	a4, a0, 1
    4622: 93 07 f0 03  	li	a5, 63
    4626: ba 86        	mv	a3, a4
    4628: 63 c5 e7 4e  	blt	a5, a4, 0x4b12 <__subtf3+0x5ee>
    462c: 93 07 00 04  	li	a5, 64
    4630: 99 9f        	subw	a5, a5, a4
    4632: b3 94 f5 00  	sll	s1, a1, a5
    4636: b3 56 ea 00  	srl	a3, s4, a4
    463a: b3 17 fa 00  	sll	a5, s4, a5
    463e: d5 8c        	or	s1, s1, a3
    4640: b3 37 f0 00  	snez	a5, a5
    4644: dd 8c        	or	s1, s1, a5
    4646: b3 d5 e5 00  	srl	a1, a1, a4
    464a: b3 e7 b4 00  	or	a5, s1, a1
    464e: 63 80 07 26  	beqz	a5, 0x48ae <__subtf3+0x38a>
    4652: 93 f7 74 00  	andi	a5, s1, 7
    4656: 13 96 14 00  	slli	a2, s1, 1
    465a: 93 96 15 00  	slli	a3, a1, 1
    465e: 13 d7 f4 03  	srli	a4, s1, 63
    4662: 13 75 76 00  	andi	a0, a2, 7
    4666: ba 96        	add	a3, a3, a4
    4668: 01 48        	li	a6, 0
    466a: 11 c9        	beqz	a0, 0x467e <__subtf3+0x15a>
    466c: 09 47        	li	a4, 2
    466e: 63 8d e9 66  	beq	s3, a4, 0x4ce8 <__subtf3+0x7c4>
    4672: 0d 47        	li	a4, 3
    4674: 05 48        	li	a6, 1
    4676: 63 81 e9 6a  	beq	s3, a4, 0x4d18 <__subtf3+0x7f4>
    467a: 63 82 09 68  	beqz	s3, 0x4cfe <__subtf3+0x7da>
    467e: 05 47        	li	a4, 1
    4680: 13 16 47 03  	slli	a2, a4, 52
    4684: f1 8e        	and	a3, a3, a2
    4686: 13 b6 16 00  	seqz	a2, a3
    468a: 01 44        	li	s0, 0
    468c: 63 89 07 6a  	beqz	a5, 0x4d3e <__subtf3+0x81a>
    4690: 89 47        	li	a5, 2
    4692: 63 8d f9 2e  	beq	s3, a5, 0x498c <__subtf3+0x468>
    4696: 8d 47        	li	a5, 3
    4698: 63 8f f9 2e  	beq	s3, a5, 0x4996 <__subtf3+0x472>
    469c: 63 86 09 2c  	beqz	s3, 0x4968 <__subtf3+0x444>
    46a0: 85 47        	li	a5, 1
    46a2: ce 17        	slli	a5, a5, 51
    46a4: ed 8f        	and	a5, a5, a1
    46a6: 05 48        	li	a6, 1
    46a8: 19 c2        	beqz	a2, 0x46ae <__subtf3+0x18a>
    46aa: 13 68 28 00  	ori	a6, a6, 2
    46ae: 63 80 07 24  	beqz	a5, 0x48ee <__subtf3+0x3ca>
    46b2: 21 67        	lui	a4, 8
    46b4: 05 04        	addi	s0, s0, 1
    46b6: 7d 17        	addi	a4, a4, -1
    46b8: 63 0a e4 26  	beq	s0, a4, 0x492c <__subtf3+0x408>
    46bc: fd 56        	li	a3, -1
    46be: 93 97 36 03  	slli	a5, a3, 51
    46c2: fd 17        	addi	a5, a5, -1
    46c4: ed 8f        	and	a5, a5, a1
    46c6: 79 8c        	and	s0, s0, a4
    46c8: 13 95 d7 03  	slli	a0, a5, 61
    46cc: 8d 80        	srli	s1, s1, 3
    46ce: 8d 83        	srli	a5, a5, 3
    46d0: c1 82        	srli	a3, a3, 16
    46d2: 42 14        	slli	s0, s0, 48
    46d4: 45 8d        	or	a0, a0, s1
    46d6: f5 8f        	and	a5, a5, a3
    46d8: 41 90        	srli	s0, s0, 48
    46da: 13 77 19 00  	andi	a4, s2, 1
    46de: 3e 07        	slli	a4, a4, 15
    46e0: 93 95 07 01  	slli	a1, a5, 16
    46e4: b3 67 87 00  	or	a5, a4, s0
    46e8: c2 17        	slli	a5, a5, 48
    46ea: c1 81        	srli	a1, a1, 16
    46ec: dd 8d        	or	a1, a1, a5
    46ee: 63 16 08 2e  	bnez	a6, 0x49da <__subtf3+0x4b6>
    46f2: a2 70        	ld	ra, 40(sp)
    46f4: 02 74        	ld	s0, 32(sp)
    46f6: e2 64        	ld	s1, 24(sp)
    46f8: 42 69        	ld	s2, 16(sp)
    46fa: a2 69        	ld	s3, 8(sp)
    46fc: 02 6a        	ld	s4, 0(sp)
    46fe: 45 61        	addi	sp, sp, 48
    4700: 82 80        	ret
    4702: 3b 08 e4 40  	subw	a6, s0, a4
    4706: 63 5b 00 0f  	blez	a6, 0x47fc <__subtf3+0x2d8>
    470a: 63 0c 07 1a  	beqz	a4, 0x48c2 <__subtf3+0x39e>
    470e: 63 02 14 65  	beq	s0, a7, 0x4d52 <__subtf3+0x82e>
    4712: 85 47        	li	a5, 1
    4714: ce 17        	slli	a5, a5, 51
    4716: 33 6e fe 00  	or	t3, t3, a5
    471a: 93 07 40 07  	li	a5, 116
    471e: 63 c8 07 3b  	blt	a5, a6, 0x4ace <__subtf3+0x5aa>
    4722: 93 07 f0 03  	li	a5, 63
    4726: 63 dc 07 4b  	bge	a5, a6, 0x4bde <__subtf3+0x6ba>
    472a: 9b 07 08 fc  	addiw	a5, a6, -64
    472e: 13 07 00 04  	li	a4, 64
    4732: b3 57 fe 00  	srl	a5, t3, a5
    4736: 63 0a e8 00  	beq	a6, a4, 0x474a <__subtf3+0x226>
    473a: 13 07 00 08  	li	a4, 128
    473e: 3b 07 07 41  	subw	a4, a4, a6
    4742: 33 17 ee 00  	sll	a4, t3, a4
    4746: 33 63 e3 00  	or	t1, t1, a4
    474a: b3 34 60 00  	snez	s1, t1
    474e: dd 8c        	or	s1, s1, a5
    4750: 59 a6        	j	0x4ad6 <__subtf3+0x5b2>
    4752: b3 67 6e 00  	or	a5, t3, t1
    4756: d9 cb        	beqz	a5, 0x47ec <__subtf3+0x2c8>
    4758: 63 0e d9 08  	beq	s2, a3, 0x47f4 <__subtf3+0x2d0>
    475c: 61 78        	lui	a6, 1048568
    475e: 05 28        	addiw	a6, a6, 1
    4760: 3b 08 88 00  	addw	a6, a6, s0
    4764: 63 09 08 0e  	beqz	a6, 0x4856 <__subtf3+0x332>
    4768: 63 12 04 30  	bnez	s0, 0x4a6c <__subtf3+0x548>
    476c: b3 e7 e5 01  	or	a5, a1, t5
    4770: 63 86 07 4c  	beqz	a5, 0x4c3c <__subtf3+0x718>
    4774: 13 48 f8 ff  	not	a6, a6
    4778: 63 07 08 64  	beqz	a6, 0x4dc6 <__subtf3+0x8a2>
    477c: a1 67        	lui	a5, 8
    477e: fd 17        	addi	a5, a5, -1
    4780: 63 1f f7 2e  	bne	a4, a5, 0x4a7e <__subtf3+0x55a>
    4784: 33 63 6e 00  	or	t1, t3, t1
    4788: 63 0a 03 64  	beqz	t1, 0x4ddc <__subtf3+0x8b8>
    478c: 13 58 2e 03  	srli	a6, t3, 50
    4790: 13 48 18 00  	xori	a6, a6, 1
    4794: 93 17 36 00  	slli	a5, a2, 3
    4798: 8d 83        	srli	a5, a5, 3
    479a: 13 78 18 00  	andi	a6, a6, 1
    479e: 13 15 de 03  	slli	a0, t3, 61
    47a2: 5d 8d        	or	a0, a0, a5
    47a4: 12 08        	slli	a6, a6, 4
    47a6: 93 57 3e 00  	srli	a5, t3, 3
    47aa: 36 89        	mv	s2, a3
    47ac: 5d 8d        	or	a0, a0, a5
    47ae: 05 c9        	beqz	a0, 0x47de <__subtf3+0x2ba>
    47b0: 21 64        	lui	s0, 8
    47b2: 85 47        	li	a5, 1
    47b4: 01 47        	li	a4, 0
    47b6: 7d 14        	addi	s0, s0, -1
    47b8: be 17        	slli	a5, a5, 47
    47ba: 01 45        	li	a0, 0
    47bc: 0d b7        	j	0x46de <__subtf3+0x1ba>
    47be: 33 67 6e 00  	or	a4, t3, t1
    47c2: 63 09 07 2e  	beqz	a4, 0x4ab4 <__subtf3+0x590>
    47c6: 7d 38        	addiw	a6, a6, -1
    47c8: 63 0b 08 4e  	beqz	a6, 0x4cbe <__subtf3+0x79a>
    47cc: a1 67        	lui	a5, 8
    47ce: fd 17        	addi	a5, a5, -1
    47d0: e3 1a f4 dc  	bne	s0, a5, 0x45a4 <__subtf3+0x80>
    47d4: 33 ef e5 01  	or	t5, a1, t5
    47d8: 63 14 0f 3e  	bnez	t5, 0x4bc0 <__subtf3+0x69c>
    47dc: 01 48        	li	a6, 0
    47de: 21 64        	lui	s0, 8
    47e0: 13 77 19 00  	andi	a4, s2, 1
    47e4: 7d 14        	addi	s0, s0, -1
    47e6: 81 47        	li	a5, 0
    47e8: 01 45        	li	a0, 0
    47ea: d5 bd        	j	0x46de <__subtf3+0x1ba>
    47ec: 93 c6 16 00  	xori	a3, a3, 1
    47f0: e3 1c d9 d8  	bne	s2, a3, 0x4588 <__subtf3+0x64>
    47f4: 61 78        	lui	a6, 1048568
    47f6: 05 28        	addiw	a6, a6, 1
    47f8: 3b 08 88 00  	addw	a6, a6, s0
    47fc: 63 09 08 1e  	beqz	a6, 0x49ee <__subtf3+0x4ca>
    4800: 63 00 04 38  	beqz	s0, 0x4b80 <__subtf3+0x65c>
    4804: a1 67        	lui	a5, 8
    4806: fd 17        	addi	a5, a5, -1
    4808: 63 08 f7 38  	beq	a4, a5, 0x4b98 <__subtf3+0x674>
    480c: 85 47        	li	a5, 1
    480e: ce 17        	slli	a5, a5, 51
    4810: 3b 08 00 41  	negw	a6, a6
    4814: dd 8d        	or	a1, a1, a5
    4816: 93 07 40 07  	li	a5, 116
    481a: 63 c2 07 57  	blt	a5, a6, 0x4d7e <__subtf3+0x85a>
    481e: 93 07 f0 03  	li	a5, 63
    4822: 63 cf 07 5d  	blt	a5, a6, 0x4e00 <__subtf3+0x8dc>
    4826: 93 07 00 04  	li	a5, 64
    482a: bb 87 07 41  	subw	a5, a5, a6
    482e: b3 94 f5 00  	sll	s1, a1, a5
    4832: b3 56 0f 01  	srl	a3, t5, a6
    4836: b3 17 ff 00  	sll	a5, t5, a5
    483a: d5 8c        	or	s1, s1, a3
    483c: b3 37 f0 00  	snez	a5, a5
    4840: 33 d8 05 01  	srl	a6, a1, a6
    4844: dd 8c        	or	s1, s1, a5
    4846: 42 9e        	add	t3, t3, a6
    4848: 9a 94        	add	s1, s1, t1
    484a: 33 b3 64 00  	sltu	t1, s1, t1
    484e: b3 05 c3 01  	add	a1, t1, t3
    4852: 3a 84        	mv	s0, a4
    4854: 69 a4        	j	0x4ade <__subtf3+0x5ba>
    4856: a1 68        	lui	a7, 8
    4858: 93 07 14 00  	addi	a5, s0, 1
    485c: 93 8e e8 ff  	addi	t4, a7, -2
    4860: b3 f7 d7 01  	and	a5, a5, t4
    4864: 63 9d 07 1c  	bnez	a5, 0x4a3e <__subtf3+0x51a>
    4868: b3 67 6e 00  	or	a5, t3, t1
    486c: b3 ee e5 01  	or	t4, a1, t5
    4870: 63 17 04 14  	bnez	s0, 0x49be <__subtf3+0x49a>
    4874: 63 8e 0e 44  	beqz	t4, 0x4cd0 <__subtf3+0x7ac>
    4878: 63 82 07 46  	beqz	a5, 0x4cdc <__subtf3+0x7b8>
    487c: 33 06 6f 40  	sub	a2, t5, t1
    4880: b3 37 cf 00  	sltu	a5, t5, a2
    4884: 33 87 c5 41  	sub	a4, a1, t3
    4888: 1d 8f        	sub	a4, a4, a5
    488a: 93 57 37 03  	srli	a5, a4, 51
    488e: 85 8b        	andi	a5, a5, 1
    4890: 63 80 07 62  	beqz	a5, 0x4eb0 <__subtf3+0x98c>
    4894: b3 04 e3 41  	sub	s1, t1, t5
    4898: b3 37 93 00  	sltu	a5, t1, s1
    489c: 33 0e be 40  	sub	t3, t3, a1
    48a0: b3 05 fe 40  	sub	a1, t3, a5
    48a4: b3 e7 b4 00  	or	a5, s1, a1
    48a8: 36 89        	mv	s2, a3
    48aa: e3 94 07 da  	bnez	a5, 0x4652 <__subtf3+0x12e>
    48ae: 01 45        	li	a0, 0
    48b0: 01 44        	li	s0, 0
    48b2: 01 48        	li	a6, 0
    48b4: c2 07        	slli	a5, a5, 16
    48b6: 46 14        	slli	s0, s0, 49
    48b8: c1 83        	srli	a5, a5, 16
    48ba: 45 90        	srli	s0, s0, 49
    48bc: 13 77 19 00  	andi	a4, s2, 1
    48c0: 39 bd        	j	0x46de <__subtf3+0x1ba>
    48c2: 33 67 6e 00  	or	a4, t3, t1
    48c6: 63 0d 07 40  	beqz	a4, 0x4ce0 <__subtf3+0x7bc>
    48ca: 7d 38        	addiw	a6, a6, -1
    48cc: 63 01 08 38  	beqz	a6, 0x4c4e <__subtf3+0x72a>
    48d0: e3 15 14 e5  	bne	s0, a7, 0x471a <__subtf3+0x1f6>
    48d4: b3 e7 e5 01  	or	a5, a1, t5
    48d8: 91 d3        	beqz	a5, 0x47dc <__subtf3+0x2b8>
    48da: 13 d8 25 03  	srli	a6, a1, 50
    48de: 13 48 18 00  	xori	a6, a6, 1
    48e2: 13 78 18 00  	andi	a6, a6, 1
    48e6: 12 08        	slli	a6, a6, 4
    48e8: 21 64        	lui	s0, 8
    48ea: fa 84        	mv	s1, t5
    48ec: 7d 14        	addi	s0, s0, -1
    48ee: 21 67        	lui	a4, 8
    48f0: 13 95 d5 03  	slli	a0, a1, 61
    48f4: 8d 80        	srli	s1, s1, 3
    48f6: 7d 17        	addi	a4, a4, -1
    48f8: 45 8d        	or	a0, a0, s1
    48fa: 93 d7 35 00  	srli	a5, a1, 3
    48fe: e3 07 e4 ea  	beq	s0, a4, 0x47ac <__subtf3+0x288>
    4902: 4d bf        	j	0x48b4 <__subtf3+0x390>
    4904: fd 57        	li	a5, -1
    4906: ce 17        	slli	a5, a5, 51
    4908: fd 17        	addi	a5, a5, -1
    490a: 09 8c        	sub	s0, s0, a0
    490c: fd 8d        	and	a1, a1, a5
    490e: d2 84        	mv	s1, s4
    4910: b3 e7 b4 00  	or	a5, s1, a1
    4914: e3 0d 04 d2  	beqz	s0, 0x464e <__subtf3+0x12a>
    4918: 93 f7 74 00  	andi	a5, s1, 7
    491c: 01 46        	li	a2, 0
    491e: e3 99 07 d6  	bnez	a5, 0x4690 <__subtf3+0x16c>
    4922: 85 47        	li	a5, 1
    4924: ce 17        	slli	a5, a5, 51
    4926: ed 8f        	and	a5, a5, a1
    4928: 01 48        	li	a6, 0
    492a: 51 b3        	j	0x46ae <__subtf3+0x18a>
    492c: 63 81 09 08  	beqz	s3, 0x49ae <__subtf3+0x48a>
    4930: 8d 47        	li	a5, 3
    4932: 63 8c f9 06  	beq	s3, a5, 0x49aa <__subtf3+0x486>
    4936: 89 47        	li	a5, 2
    4938: 63 84 f9 32  	beq	s3, a5, 0x4c60 <__subtf3+0x73c>
    493c: 7d 55        	li	a0, -1
    493e: 21 64        	lui	s0, 8
    4940: 13 68 58 00  	ori	a6, a6, 5
    4944: 93 57 35 00  	srli	a5, a0, 3
    4948: 79 14        	addi	s0, s0, -2
    494a: ad b7        	j	0x48b4 <__subtf3+0x390>
    494c: 26 85        	mv	a0, s1
    494e: ef 00 50 08  	jal	0x51d2 <__clzdi2>
    4952: 9b 05 45 ff  	addiw	a1, a0, -12
    4956: 93 07 f0 03  	li	a5, 63
    495a: 1b 05 45 03  	addiw	a0, a0, 52
    495e: b3 95 b4 00  	sll	a1, s1, a1
    4962: e3 cb a7 ca  	blt	a5, a0, 0x4618 <__subtf3+0xf4>
    4966: 71 b9        	j	0x4602 <__subtf3+0xde>
    4968: 93 f7 f4 00  	andi	a5, s1, 15
    496c: 11 47        	li	a4, 4
    496e: e3 89 e7 d2  	beq	a5, a4, 0x46a0 <__subtf3+0x17c>
    4972: 13 87 44 00  	addi	a4, s1, 4
    4976: b3 34 97 00  	sltu	s1, a4, s1
    497a: 85 47        	li	a5, 1
    497c: a6 95        	add	a1, a1, s1
    497e: ce 17        	slli	a5, a5, 51
    4980: ed 8f        	and	a5, a5, a1
    4982: ba 84        	mv	s1, a4
    4984: 05 48        	li	a6, 1
    4986: e3 12 06 d2  	bnez	a2, 0x46aa <__subtf3+0x186>
    498a: 15 b3        	j	0x46ae <__subtf3+0x18a>
    498c: e3 0a 09 d0  	beqz	s2, 0x46a0 <__subtf3+0x17c>
    4990: 13 87 84 00  	addi	a4, s1, 8
    4994: cd b7        	j	0x4976 <__subtf3+0x452>
    4996: e3 0d 09 fe  	beqz	s2, 0x4990 <__subtf3+0x46c>
    499a: 05 48        	li	a6, 1
    499c: 85 47        	li	a5, 1
    499e: ce 17        	slli	a5, a5, 51
    49a0: ed 8f        	and	a5, a5, a1
    49a2: 05 49        	li	s2, 1
    49a4: e3 13 06 d0  	bnez	a2, 0x46aa <__subtf3+0x186>
    49a8: 19 b3        	j	0x46ae <__subtf3+0x18a>
    49aa: e3 19 09 f8  	bnez	s2, 0x493c <__subtf3+0x418>
    49ae: 13 68 58 00  	ori	a6, a6, 5
    49b2: 35 b5        	j	0x47de <__subtf3+0x2ba>
    49b4: b3 64 6e 00  	or	s1, t3, t1
    49b8: b3 34 90 00  	snez	s1, s1
    49bc: 31 b9        	j	0x45d8 <__subtf3+0xb4>
    49be: fd 18        	addi	a7, a7, -1
    49c0: 63 03 14 2b  	beq	s0, a7, 0x4c66 <__subtf3+0x742>
    49c4: 63 0a 17 2d  	beq	a4, a7, 0x4c98 <__subtf3+0x774>
    49c8: 63 9a 0e 2a  	bnez	t4, 0x4c7c <__subtf3+0x758>
    49cc: 63 9f 07 2c  	bnez	a5, 0x4caa <__subtf3+0x786>
    49d0: b7 f5 ff 0f  	lui	a1, 65535
    49d4: 01 45        	li	a0, 0
    49d6: 8e 15        	slli	a1, a1, 35
    49d8: 41 48        	li	a6, 16
    49da: 73 20 18 00  	csrs	fflags, a6
    49de: a2 70        	ld	ra, 40(sp)
    49e0: 02 74        	ld	s0, 32(sp)
    49e2: e2 64        	ld	s1, 24(sp)
    49e4: 42 69        	ld	s2, 16(sp)
    49e6: a2 69        	ld	s3, 8(sp)
    49e8: 02 6a        	ld	s4, 0(sp)
    49ea: 45 61        	addi	sp, sp, 48
    49ec: 82 80        	ret
    49ee: a1 67        	lui	a5, 8
    49f0: 93 06 14 00  	addi	a3, s0, 1
    49f4: 93 88 e7 ff  	addi	a7, a5, -2
    49f8: b3 fe 16 01  	and	t4, a3, a7
    49fc: 63 93 0e 20  	bnez	t4, 0x4c02 <__subtf3+0x6de>
    4a00: b3 e6 e5 01  	or	a3, a1, t5
    4a04: 63 16 04 3a  	bnez	s0, 0x4db0 <__subtf3+0x88c>
    4a08: b3 67 6e 00  	or	a5, t3, t1
    4a0c: 63 87 06 3e  	beqz	a3, 0x4dfa <__subtf3+0x8d6>
    4a10: 63 86 07 2c  	beqz	a5, 0x4cdc <__subtf3+0x7b8>
    4a14: b3 04 6f 00  	add	s1, t5, t1
    4a18: 33 bf e4 01  	sltu	t5, s1, t5
    4a1c: 33 83 c5 01  	add	t1, a1, t3
    4a20: b3 05 e3 01  	add	a1, t1, t5
    4a24: 93 d7 35 03  	srli	a5, a1, 51
    4a28: 85 8b        	andi	a5, a5, 1
    4a2a: e3 80 07 c2  	beqz	a5, 0x464a <__subtf3+0x126>
    4a2e: fd 57        	li	a5, -1
    4a30: ce 17        	slli	a5, a5, 51
    4a32: fd 17        	addi	a5, a5, -1
    4a34: fd 8d        	and	a1, a1, a5
    4a36: 05 44        	li	s0, 1
    4a38: 93 f7 74 00  	andi	a5, s1, 7
    4a3c: c5 b5        	j	0x491c <__subtf3+0x3f8>
    4a3e: b3 04 6f 40  	sub	s1, t5, t1
    4a42: b3 37 9f 00  	sltu	a5, t5, s1
    4a46: 33 8a c5 41  	sub	s4, a1, t3
    4a4a: 33 0a fa 40  	sub	s4, s4, a5
    4a4e: 93 57 3a 03  	srli	a5, s4, 51
    4a52: 85 8b        	andi	a5, a5, 1
    4a54: 63 9a 07 1c  	bnez	a5, 0x4c28 <__subtf3+0x704>
    4a58: b3 e7 44 01  	or	a5, s1, s4
    4a5c: e3 9d 07 b8  	bnez	a5, 0x45f6 <__subtf3+0xd2>
    4a60: f9 19        	addi	s3, s3, -2
    4a62: 13 b9 19 00  	seqz	s2, s3
    4a66: 01 45        	li	a0, 0
    4a68: 01 44        	li	s0, 0
    4a6a: a9 b5        	j	0x48b4 <__subtf3+0x390>
    4a6c: a1 67        	lui	a5, 8
    4a6e: fd 17        	addi	a5, a5, -1
    4a70: e3 0a f7 d0  	beq	a4, a5, 0x4784 <__subtf3+0x260>
    4a74: 85 47        	li	a5, 1
    4a76: ce 17        	slli	a5, a5, 51
    4a78: 3b 08 00 41  	negw	a6, a6
    4a7c: dd 8d        	or	a1, a1, a5
    4a7e: 93 07 40 07  	li	a5, 116
    4a82: 63 c2 07 0f  	blt	a5, a6, 0x4b66 <__subtf3+0x642>
    4a86: 93 07 f0 03  	li	a5, 63
    4a8a: 63 cf 07 2f  	blt	a5, a6, 0x4d88 <__subtf3+0x864>
    4a8e: 93 07 00 04  	li	a5, 64
    4a92: bb 87 07 41  	subw	a5, a5, a6
    4a96: b3 94 f5 00  	sll	s1, a1, a5
    4a9a: 33 56 0f 01  	srl	a2, t5, a6
    4a9e: b3 17 ff 00  	sll	a5, t5, a5
    4aa2: d1 8c        	or	s1, s1, a2
    4aa4: b3 37 f0 00  	snez	a5, a5
    4aa8: 33 d8 05 01  	srl	a6, a1, a6
    4aac: dd 8c        	or	s1, s1, a5
    4aae: 33 0e 0e 41  	sub	t3, t3, a6
    4ab2: 75 a8        	j	0x4b6e <__subtf3+0x64a>
    4ab4: a1 67        	lui	a5, 8
    4ab6: fd 17        	addi	a5, a5, -1
    4ab8: fa 84        	mv	s1, t5
    4aba: e3 1b f4 e4  	bne	s0, a5, 0x4910 <__subtf3+0x3ec>
    4abe: b3 e7 e5 01  	or	a5, a1, t5
    4ac2: e3 9c 07 e0  	bnez	a5, 0x48da <__subtf3+0x3b6>
    4ac6: 01 45        	li	a0, 0
    4ac8: 81 47        	li	a5, 0
    4aca: 01 48        	li	a6, 0
    4acc: c5 b1        	j	0x47ac <__subtf3+0x288>
    4ace: b3 64 6e 00  	or	s1, t3, t1
    4ad2: b3 34 90 00  	snez	s1, s1
    4ad6: fa 94        	add	s1, s1, t5
    4ad8: 33 bf e4 01  	sltu	t5, s1, t5
    4adc: fa 95        	add	a1, a1, t5
    4ade: 93 d7 35 03  	srli	a5, a1, 51
    4ae2: 85 8b        	andi	a5, a5, 1
    4ae4: e3 86 07 e2  	beqz	a5, 0x4910 <__subtf3+0x3ec>
    4ae8: a1 67        	lui	a5, 8
    4aea: 05 04        	addi	s0, s0, 1
    4aec: 13 87 f7 ff  	addi	a4, a5, -1
    4af0: 63 07 e4 22  	beq	s0, a4, 0x4d1e <__subtf3+0x7fa>
    4af4: 7d 57        	li	a4, -1
    4af6: 4e 17        	slli	a4, a4, 51
    4af8: 7d 17        	addi	a4, a4, -1
    4afa: 6d 8f        	and	a4, a4, a1
    4afc: 93 d7 14 00  	srli	a5, s1, 1
    4b00: 85 88        	andi	s1, s1, 1
    4b02: c5 8f        	or	a5, a5, s1
    4b04: 93 14 f7 03  	slli	s1, a4, 63
    4b08: dd 8c        	or	s1, s1, a5
    4b0a: 93 55 17 00  	srli	a1, a4, 1
    4b0e: 9d 8b        	andi	a5, a5, 7
    4b10: 31 b5        	j	0x491c <__subtf3+0x3f8>
    4b12: 1b 05 15 fc  	addiw	a0, a0, -63
    4b16: 13 06 00 04  	li	a2, 64
    4b1a: b3 d7 a5 00  	srl	a5, a1, a0
    4b1e: 63 09 c7 00  	beq	a4, a2, 0x4b30 <__subtf3+0x60c>
    4b22: 13 07 00 08  	li	a4, 128
    4b26: 15 9f        	subw	a4, a4, a3
    4b28: b3 95 e5 00  	sll	a1, a1, a4
    4b2c: 33 6a ba 00  	or	s4, s4, a1
    4b30: 33 3a 40 01  	snez	s4, s4
    4b34: b3 67 fa 00  	or	a5, s4, a5
    4b38: be 84        	mv	s1, a5
    4b3a: 81 45        	li	a1, 0
    4b3c: 09 be        	j	0x464e <__subtf3+0x12a>
    4b3e: 9b 07 08 fc  	addiw	a5, a6, -64
    4b42: 13 07 00 04  	li	a4, 64
    4b46: b3 57 fe 00  	srl	a5, t3, a5
    4b4a: 63 0a e8 00  	beq	a6, a4, 0x4b5e <__subtf3+0x63a>
    4b4e: 13 07 00 08  	li	a4, 128
    4b52: 3b 07 07 41  	subw	a4, a4, a6
    4b56: 33 17 ee 00  	sll	a4, t3, a4
    4b5a: 33 63 e3 00  	or	t1, t1, a4
    4b5e: b3 34 60 00  	snez	s1, t1
    4b62: dd 8c        	or	s1, s1, a5
    4b64: 95 bc        	j	0x45d8 <__subtf3+0xb4>
    4b66: b3 e4 e5 01  	or	s1, a1, t5
    4b6a: b3 34 90 00  	snez	s1, s1
    4b6e: b3 04 93 40  	sub	s1, t1, s1
    4b72: 33 33 93 00  	sltu	t1, t1, s1
    4b76: b3 05 6e 40  	sub	a1, t3, t1
    4b7a: 3a 84        	mv	s0, a4
    4b7c: 36 89        	mv	s2, a3
    4b7e: 9d b4        	j	0x45e4 <__subtf3+0xc0>
    4b80: b3 e7 e5 01  	or	a5, a1, t5
    4b84: 63 8e 07 24  	beqz	a5, 0x4de0 <__subtf3+0x8bc>
    4b88: 13 48 f8 ff  	not	a6, a6
    4b8c: 63 09 08 30  	beqz	a6, 0x4e9e <__subtf3+0x97a>
    4b90: a1 67        	lui	a5, 8
    4b92: fd 17        	addi	a5, a5, -1
    4b94: e3 11 f7 c8  	bne	a4, a5, 0x4816 <__subtf3+0x2f2>
    4b98: 33 63 6e 00  	or	t1, t3, t1
    4b9c: e3 00 03 c4  	beqz	t1, 0x47dc <__subtf3+0x2b8>
    4ba0: 13 58 2e 03  	srli	a6, t3, 50
    4ba4: 13 48 18 00  	xori	a6, a6, 1
    4ba8: 0e 06        	slli	a2, a2, 3
    4baa: 93 17 de 03  	slli	a5, t3, 61
    4bae: 13 78 18 00  	andi	a6, a6, 1
    4bb2: 0d 82        	srli	a2, a2, 3
    4bb4: 33 65 f6 00  	or	a0, a2, a5
    4bb8: 12 08        	slli	a6, a6, 4
    4bba: 93 57 3e 00  	srli	a5, t3, 3
    4bbe: fd b6        	j	0x47ac <__subtf3+0x288>
    4bc0: 13 d8 25 03  	srli	a6, a1, 50
    4bc4: 13 48 18 00  	xori	a6, a6, 1
    4bc8: 0e 05        	slli	a0, a0, 3
    4bca: 93 97 d5 03  	slli	a5, a1, 61
    4bce: 13 78 18 00  	andi	a6, a6, 1
    4bd2: 0d 81        	srli	a0, a0, 3
    4bd4: 5d 8d        	or	a0, a0, a5
    4bd6: 12 08        	slli	a6, a6, 4
    4bd8: 93 d7 35 00  	srli	a5, a1, 3
    4bdc: c1 be        	j	0x47ac <__subtf3+0x288>
    4bde: 93 07 00 04  	li	a5, 64
    4be2: bb 87 07 41  	subw	a5, a5, a6
    4be6: b3 14 fe 00  	sll	s1, t3, a5
    4bea: 33 57 03 01  	srl	a4, t1, a6
    4bee: b3 17 f3 00  	sll	a5, t1, a5
    4bf2: d9 8c        	or	s1, s1, a4
    4bf4: b3 37 f0 00  	snez	a5, a5
    4bf8: 33 53 0e 01  	srl	t1, t3, a6
    4bfc: dd 8c        	or	s1, s1, a5
    4bfe: 9a 95        	add	a1, a1, t1
    4c00: d9 bd        	j	0x4ad6 <__subtf3+0x5b2>
    4c02: fd 17        	addi	a5, a5, -1
    4c04: 63 82 f6 22  	beq	a3, a5, 0x4e28 <__subtf3+0x904>
    4c08: b3 07 6f 00  	add	a5, t5, t1
    4c0c: 33 87 c5 01  	add	a4, a1, t3
    4c10: 33 bf e7 01  	sltu	t5, a5, t5
    4c14: 7a 97        	add	a4, a4, t5
    4c16: 85 83        	srli	a5, a5, 1
    4c18: 93 14 f7 03  	slli	s1, a4, 63
    4c1c: dd 8c        	or	s1, s1, a5
    4c1e: 93 55 17 00  	srli	a1, a4, 1
    4c22: 9d 8b        	andi	a5, a5, 7
    4c24: 36 84        	mv	s0, a3
    4c26: dd b9        	j	0x491c <__subtf3+0x3f8>
    4c28: b3 04 e3 41  	sub	s1, t1, t5
    4c2c: 33 0a be 40  	sub	s4, t3, a1
    4c30: 33 33 93 00  	sltu	t1, t1, s1
    4c34: 33 0a 6a 40  	sub	s4, s4, t1
    4c38: 36 89        	mv	s2, a3
    4c3a: 75 ba        	j	0x45f6 <__subtf3+0xd2>
    4c3c: a1 67        	lui	a5, 8
    4c3e: fd 17        	addi	a5, a5, -1
    4c40: 63 03 f7 20  	beq	a4, a5, 0x4e46 <__subtf3+0x922>
    4c44: f2 85        	mv	a1, t3
    4c46: 9a 84        	mv	s1, t1
    4c48: 3a 84        	mv	s0, a4
    4c4a: 36 89        	mv	s2, a3
    4c4c: d1 b1        	j	0x4910 <__subtf3+0x3ec>
    4c4e: b3 04 6f 00  	add	s1, t5, t1
    4c52: 33 bf e4 01  	sltu	t5, s1, t5
    4c56: 33 83 c5 01  	add	t1, a1, t3
    4c5a: b3 05 e3 01  	add	a1, t1, t5
    4c5e: 41 b5        	j	0x4ade <__subtf3+0x5ba>
    4c60: e3 0e 09 cc  	beqz	s2, 0x493c <__subtf3+0x418>
    4c64: a9 b3        	j	0x49ae <__subtf3+0x48a>
    4c66: 63 87 0e 02  	beqz	t4, 0x4c94 <__subtf3+0x770>
    4c6a: 13 d8 25 03  	srli	a6, a1, 50
    4c6e: 13 48 18 00  	xori	a6, a6, 1
    4c72: 13 78 18 00  	andi	a6, a6, 1
    4c76: 12 08        	slli	a6, a6, 4
    4c78: 63 00 87 02  	beq	a4, s0, 0x4c98 <__subtf3+0x774>
    4c7c: e3 9a 07 b2  	bnez	a5, 0x47b0 <__subtf3+0x28c>
    4c80: 13 17 35 00  	slli	a4, a0, 3
    4c84: 93 97 d5 03  	slli	a5, a1, 61
    4c88: 0d 83        	srli	a4, a4, 3
    4c8a: 33 e5 e7 00  	or	a0, a5, a4
    4c8e: 93 d7 35 00  	srli	a5, a1, 3
    4c92: 29 be        	j	0x47ac <__subtf3+0x288>
    4c94: e3 1c 87 d2  	bne	a4, s0, 0x49cc <__subtf3+0x4a8>
    4c98: e3 88 07 d2  	beqz	a5, 0x49c8 <__subtf3+0x4a4>
    4c9c: 93 57 2e 03  	srli	a5, t3, 50
    4ca0: 85 8b        	andi	a5, a5, 1
    4ca2: 91 e3        	bnez	a5, 0x4ca6 <__subtf3+0x782>
    4ca4: 41 48        	li	a6, 16
    4ca6: e3 95 0e b0  	bnez	t4, 0x47b0 <__subtf3+0x28c>
    4caa: 93 17 36 00  	slli	a5, a2, 3
    4cae: 8d 83        	srli	a5, a5, 3
    4cb0: 13 15 de 03  	slli	a0, t3, 61
    4cb4: 5d 8d        	or	a0, a0, a5
    4cb6: 36 89        	mv	s2, a3
    4cb8: 93 57 3e 00  	srli	a5, t3, 3
    4cbc: c5 bc        	j	0x47ac <__subtf3+0x288>
    4cbe: b3 04 6f 40  	sub	s1, t5, t1
    4cc2: 33 3f 9f 00  	sltu	t5, t5, s1
    4cc6: 33 83 c5 41  	sub	t1, a1, t3
    4cca: b3 05 e3 41  	sub	a1, t1, t5
    4cce: 19 ba        	j	0x45e4 <__subtf3+0xc0>
    4cd0: 63 80 07 12  	beqz	a5, 0x4df0 <__subtf3+0x8cc>
    4cd4: 81 47        	li	a5, 0
    4cd6: f2 85        	mv	a1, t3
    4cd8: 1a 8f        	mv	t5, t1
    4cda: 36 89        	mv	s2, a3
    4cdc: fa 84        	mv	s1, t5
    4cde: a5 ba        	j	0x4656 <__subtf3+0x132>
    4ce0: fa 84        	mv	s1, t5
    4ce2: e3 17 14 c3  	bne	s0, a7, 0x4910 <__subtf3+0x3ec>
    4ce6: e1 bb        	j	0x4abe <__subtf3+0x59a>
    4ce8: 05 48        	li	a6, 1
    4cea: e3 0a 09 98  	beqz	s2, 0x467e <__subtf3+0x15a>
    4cee: 13 37 86 ff  	sltiu	a4, a2, -8
    4cf2: 13 47 17 00  	xori	a4, a4, 1
    4cf6: 02 17        	slli	a4, a4, 32
    4cf8: 01 93        	srli	a4, a4, 32
    4cfa: ba 96        	add	a3, a3, a4
    4cfc: 49 b2        	j	0x467e <__subtf3+0x15a>
    4cfe: 13 77 f6 00  	andi	a4, a2, 15
    4d02: 11 45        	li	a0, 4
    4d04: e3 0d a7 96  	beq	a4, a0, 0x467e <__subtf3+0x15a>
    4d08: 13 37 c6 ff  	sltiu	a4, a2, -4
    4d0c: 13 47 17 00  	xori	a4, a4, 1
    4d10: 02 17        	slli	a4, a4, 32
    4d12: 01 93        	srli	a4, a4, 32
    4d14: ba 96        	add	a3, a3, a4
    4d16: a5 b2        	j	0x467e <__subtf3+0x15a>
    4d18: e3 13 09 96  	bnez	s2, 0x467e <__subtf3+0x15a>
    4d1c: c9 bf        	j	0x4cee <__subtf3+0x7ca>
    4d1e: 63 8e 09 04  	beqz	s3, 0x4d7a <__subtf3+0x856>
    4d22: 0d 47        	li	a4, 3
    4d24: 63 80 e9 1a  	beq	s3, a4, 0x4ec4 <__subtf3+0x9a0>
    4d28: 09 47        	li	a4, 2
    4d2a: 15 48        	li	a6, 5
    4d2c: e3 92 e9 c0  	bne	s3, a4, 0x4930 <__subtf3+0x40c>
    4d30: e3 17 09 aa  	bnez	s2, 0x47de <__subtf3+0x2ba>
    4d34: 13 84 e7 ff  	addi	s0, a5, -2
    4d38: fd 55        	li	a1, -1
    4d3a: fd 54        	li	s1, -1
    4d3c: 9d ba        	j	0x46b2 <__subtf3+0x18e>
    4d3e: 93 17 37 03  	slli	a5, a4, 51
    4d42: ed 8f        	and	a5, a5, a1
    4d44: e3 95 06 96  	bnez	a3, 0x46ae <__subtf3+0x18a>
    4d48: e3 03 08 96  	beqz	a6, 0x46ae <__subtf3+0x18a>
    4d4c: 13 68 28 00  	ori	a6, a6, 2
    4d50: b9 ba        	j	0x46ae <__subtf3+0x18a>
    4d52: 33 ef e5 01  	or	t5, a1, t5
    4d56: e3 03 0f a8  	beqz	t5, 0x47dc <__subtf3+0x2b8>
    4d5a: 13 d8 25 03  	srli	a6, a1, 50
    4d5e: 13 48 18 00  	xori	a6, a6, 1
    4d62: 13 d7 3e 00  	srli	a4, t4, 3
    4d66: 93 97 d5 03  	slli	a5, a1, 61
    4d6a: 13 78 18 00  	andi	a6, a6, 1
    4d6e: 79 8d        	and	a0, a0, a4
    4d70: 5d 8d        	or	a0, a0, a5
    4d72: 12 08        	slli	a6, a6, 4
    4d74: 93 d7 35 00  	srli	a5, a1, 3
    4d78: 15 bc        	j	0x47ac <__subtf3+0x288>
    4d7a: 15 48        	li	a6, 5
    4d7c: 8d b4        	j	0x47de <__subtf3+0x2ba>
    4d7e: b3 e4 e5 01  	or	s1, a1, t5
    4d82: b3 34 90 00  	snez	s1, s1
    4d86: c9 b4        	j	0x4848 <__subtf3+0x324>
    4d88: 9b 07 08 fc  	addiw	a5, a6, -64
    4d8c: 13 06 00 04  	li	a2, 64
    4d90: b3 d7 f5 00  	srl	a5, a1, a5
    4d94: 63 0a c8 00  	beq	a6, a2, 0x4da8 <__subtf3+0x884>
    4d98: 13 06 00 08  	li	a2, 128
    4d9c: 3b 06 06 41  	subw	a2, a2, a6
    4da0: 33 96 c5 00  	sll	a2, a1, a2
    4da4: 33 6f cf 00  	or	t5, t5, a2
    4da8: b3 34 e0 01  	snez	s1, t5
    4dac: dd 8c        	or	s1, s1, a5
    4dae: c1 b3        	j	0x4b6e <__subtf3+0x64a>
    4db0: fd 17        	addi	a5, a5, -1
    4db2: 63 08 f4 0a  	beq	s0, a5, 0x4e62 <__subtf3+0x93e>
    4db6: 63 00 f7 14  	beq	a4, a5, 0x4ef6 <__subtf3+0x9d2>
    4dba: e9 ca        	beqz	a3, 0x4e8c <__subtf3+0x968>
    4dbc: 33 63 6e 00  	or	t1, t3, t1
    4dc0: e3 18 03 9e  	bnez	t1, 0x47b0 <__subtf3+0x28c>
    4dc4: 75 bd        	j	0x4c80 <__subtf3+0x75c>
    4dc6: b3 04 e3 41  	sub	s1, t1, t5
    4dca: 33 0e be 40  	sub	t3, t3, a1
    4dce: b3 37 93 00  	sltu	a5, t1, s1
    4dd2: b3 05 fe 40  	sub	a1, t3, a5
    4dd6: 3a 84        	mv	s0, a4
    4dd8: 36 89        	mv	s2, a3
    4dda: 29 b0        	j	0x45e4 <__subtf3+0xc0>
    4ddc: 36 89        	mv	s2, a3
    4dde: fd ba        	j	0x47dc <__subtf3+0x2b8>
    4de0: a1 67        	lui	a5, 8
    4de2: fd 17        	addi	a5, a5, -1
    4de4: 63 09 f7 0e  	beq	a4, a5, 0x4ed6 <__subtf3+0x9b2>
    4de8: f2 85        	mv	a1, t3
    4dea: 9a 84        	mv	s1, t1
    4dec: 3a 84        	mv	s0, a4
    4dee: 0d b6        	j	0x4910 <__subtf3+0x3ec>
    4df0: f9 19        	addi	s3, s3, -2
    4df2: 13 b9 19 00  	seqz	s2, s3
    4df6: 01 45        	li	a0, 0
    4df8: 75 bc        	j	0x48b4 <__subtf3+0x390>
    4dfa: f2 85        	mv	a1, t3
    4dfc: 9a 84        	mv	s1, t1
    4dfe: 81 b8        	j	0x464e <__subtf3+0x12a>
    4e00: 9b 07 08 fc  	addiw	a5, a6, -64
    4e04: 93 06 00 04  	li	a3, 64
    4e08: b3 d7 f5 00  	srl	a5, a1, a5
    4e0c: 63 0a d8 00  	beq	a6, a3, 0x4e20 <__subtf3+0x8fc>
    4e10: 93 06 00 08  	li	a3, 128
    4e14: bb 86 06 41  	subw	a3, a3, a6
    4e18: b3 96 d5 00  	sll	a3, a1, a3
    4e1c: 33 6f df 00  	or	t5, t5, a3
    4e20: b3 34 e0 01  	snez	s1, t5
    4e24: dd 8c        	or	s1, s1, a5
    4e26: 0d b4        	j	0x4848 <__subtf3+0x324>
    4e28: e3 89 09 f4  	beqz	s3, 0x4d7a <__subtf3+0x856>
    4e2c: 8d 47        	li	a5, 3
    4e2e: 63 82 f9 0e  	beq	s3, a5, 0x4f12 <__subtf3+0x9ee>
    4e32: 89 47        	li	a5, 2
    4e34: 15 48        	li	a6, 5
    4e36: e3 93 f9 b0  	bne	s3, a5, 0x493c <__subtf3+0x418>
    4e3a: e3 12 09 9a  	bnez	s2, 0x47de <__subtf3+0x2ba>
    4e3e: 46 84        	mv	s0, a7
    4e40: fd 55        	li	a1, -1
    4e42: fd 54        	li	s1, -1
    4e44: bd b0        	j	0x46b2 <__subtf3+0x18e>
    4e46: b3 67 6e 00  	or	a5, t3, t1
    4e4a: c5 c7        	beqz	a5, 0x4ef2 <__subtf3+0x9ce>
    4e4c: 13 58 2e 03  	srli	a6, t3, 50
    4e50: 13 48 18 00  	xori	a6, a6, 1
    4e54: 13 78 18 00  	andi	a6, a6, 1
    4e58: 12 08        	slli	a6, a6, 4
    4e5a: f2 85        	mv	a1, t3
    4e5c: 1a 8f        	mv	t5, t1
    4e5e: 36 89        	mv	s2, a3
    4e60: 61 b4        	j	0x48e8 <__subtf3+0x3c4>
    4e62: cd c2        	beqz	a3, 0x4f04 <__subtf3+0x9e0>
    4e64: 13 d8 25 03  	srli	a6, a1, 50
    4e68: 13 48 18 00  	xori	a6, a6, 1
    4e6c: 13 78 18 00  	andi	a6, a6, 1
    4e70: 12 08        	slli	a6, a6, 4
    4e72: e3 15 87 f4  	bne	a4, s0, 0x4dbc <__subtf3+0x898>
    4e76: 33 63 6e 00  	or	t1, t3, t1
    4e7a: e3 03 03 e0  	beqz	t1, 0x4c80 <__subtf3+0x75c>
    4e7e: 93 57 2e 03  	srli	a5, t3, 50
    4e82: 85 8b        	andi	a5, a5, 1
    4e84: 91 e3        	bnez	a5, 0x4e88 <__subtf3+0x964>
    4e86: 41 48        	li	a6, 16
    4e88: e3 94 06 92  	bnez	a3, 0x47b0 <__subtf3+0x28c>
    4e8c: 93 17 36 00  	slli	a5, a2, 3
    4e90: 8d 83        	srli	a5, a5, 3
    4e92: 13 15 de 03  	slli	a0, t3, 61
    4e96: 5d 8d        	or	a0, a0, a5
    4e98: 93 57 3e 00  	srli	a5, t3, 3
    4e9c: 01 ba        	j	0x47ac <__subtf3+0x288>
    4e9e: b3 04 6f 00  	add	s1, t5, t1
    4ea2: 2e 9e        	add	t3, t3, a1
    4ea4: b3 b7 64 00  	sltu	a5, s1, t1
    4ea8: b3 05 fe 00  	add	a1, t3, a5
    4eac: 3a 84        	mv	s0, a4
    4eae: 05 b9        	j	0x4ade <__subtf3+0x5ba>
    4eb0: b3 67 e6 00  	or	a5, a2, a4
    4eb4: 95 df        	beqz	a5, 0x4df0 <__subtf3+0x8cc>
    4eb6: 32 8f        	mv	t5, a2
    4eb8: 93 77 76 00  	andi	a5, a2, 7
    4ebc: ba 85        	mv	a1, a4
    4ebe: fa 84        	mv	s1, t5
    4ec0: 6f f0 6f f9  	j	0x4656 <__subtf3+0x132>
    4ec4: 15 48        	li	a6, 5
    4ec6: e3 0c 09 90  	beqz	s2, 0x47de <__subtf3+0x2ba>
    4eca: fd 54        	li	s1, -1
    4ecc: fd 55        	li	a1, -1
    4ece: 13 84 e7 ff  	addi	s0, a5, -2
    4ed2: 01 46        	li	a2, 0
    4ed4: e1 b4        	j	0x499c <__subtf3+0x478>
    4ed6: b3 67 6e 00  	or	a5, t3, t1
    4eda: e3 86 07 be  	beqz	a5, 0x4ac6 <__subtf3+0x5a2>
    4ede: 13 58 2e 03  	srli	a6, t3, 50
    4ee2: 13 48 18 00  	xori	a6, a6, 1
    4ee6: 13 78 18 00  	andi	a6, a6, 1
    4eea: 12 08        	slli	a6, a6, 4
    4eec: f2 85        	mv	a1, t3
    4eee: 1a 8f        	mv	t5, t1
    4ef0: e5 ba        	j	0x48e8 <__subtf3+0x3c4>
    4ef2: 36 89        	mv	s2, a3
    4ef4: c9 be        	j	0x4ac6 <__subtf3+0x5a2>
    4ef6: 33 63 6e 00  	or	t1, t3, t1
    4efa: e3 12 03 f8  	bnez	t1, 0x4e7e <__subtf3+0x95a>
    4efe: e3 91 06 d8  	bnez	a3, 0x4c80 <__subtf3+0x75c>
    4f02: 69 b7        	j	0x4e8c <__subtf3+0x968>
    4f04: e3 14 87 f8  	bne	a4, s0, 0x4e8c <__subtf3+0x968>
    4f08: 33 63 6e 00  	or	t1, t3, t1
    4f0c: e3 19 03 f6  	bnez	t1, 0x4e7e <__subtf3+0x95a>
    4f10: b5 bf        	j	0x4e8c <__subtf3+0x968>
    4f12: e3 04 09 e6  	beqz	s2, 0x4d7a <__subtf3+0x856>
    4f16: 01 46        	li	a2, 0
    4f18: 15 48        	li	a6, 5
    4f1a: fd 54        	li	s1, -1
    4f1c: fd 55        	li	a1, -1
    4f1e: 46 84        	mv	s0, a7
    4f20: b5 bc        	j	0x499c <__subtf3+0x478>

0000000000004f22 <__fixtfsi>:
    4f22: 2a 88        	mv	a6, a0
    4f24: f3 27 20 00  	csrr	a5, frm
    4f28: 11 66        	lui	a2, 4
    4f2a: 93 97 15 00  	slli	a5, a1, 1
    4f2e: 13 97 05 01  	slli	a4, a1, 16
    4f32: c5 93        	srli	a5, a5, 49
    4f34: 93 06 e6 ff  	addi	a3, a2, -2
    4f38: 41 83        	srli	a4, a4, 16
    4f3a: fd 91        	srli	a1, a1, 63
    4f3c: 63 c8 f6 00  	blt	a3, a5, 0x4f4c <__fixtfsi+0x2a>
    4f40: ad cb        	beqz	a5, 0x4fb2 <__fixtfsi+0x90>
    4f42: 01 45        	li	a0, 0
    4f44: 85 46        	li	a3, 1
    4f46: 73 a0 16 00  	csrs	fflags, a3
    4f4a: 82 80        	ret
    4f4c: 93 06 d6 01  	addi	a3, a2, 29
    4f50: 63 d5 f6 02  	bge	a3, a5, 0x4f7a <__fixtfsi+0x58>
    4f54: b7 06 00 80  	lui	a3, 524288
    4f58: 93 c6 f6 ff  	not	a3, a3
    4f5c: 3b 85 b6 00  	addw	a0, a3, a1
    4f60: b1 cd        	beqz	a1, 0x4fbc <__fixtfsi+0x9a>
    4f62: 79 06        	addi	a2, a2, 30
    4f64: c1 46        	li	a3, 16
    4f66: e3 90 c7 fe  	bne	a5, a2, 0x4f46 <__fixtfsi+0x24>
    4f6a: 93 57 17 01  	srli	a5, a4, 17
    4f6e: e1 ff        	bnez	a5, 0x4f46 <__fixtfsi+0x24>
    4f70: 3e 17        	slli	a4, a4, 47
    4f72: 33 67 07 01  	or	a4, a4, a6
    4f76: 15 eb        	bnez	a4, 0x4faa <__fixtfsi+0x88>
    4f78: 82 80        	ret
    4f7a: 85 46        	li	a3, 1
    4f7c: c2 16        	slli	a3, a3, 48
    4f7e: 55 8f        	or	a4, a4, a3
    4f80: 11 66        	lui	a2, 4
    4f82: f1 76        	lui	a3, 1048572
    4f84: c5 26        	addiw	a3, a3, 17
    4f86: 1b 06 f6 02  	addiw	a2, a2, 47
    4f8a: bd 9e        	addw	a3, a3, a5
    4f8c: bb 07 f6 40  	subw	a5, a2, a5
    4f90: b3 16 d7 00  	sll	a3, a4, a3
    4f94: 33 57 f7 00  	srl	a4, a4, a5
    4f98: c9 8e        	or	a3, a3, a0
    4f9a: 9b 07 07 00  	sext.w	a5, a4
    4f9e: 99 c1        	beqz	a1, 0x4fa4 <__fixtfsi+0x82>
    4fa0: bb 07 f0 40  	negw	a5, a5
    4fa4: 1b 85 07 00  	sext.w	a0, a5
    4fa8: 89 ca        	beqz	a3, 0x4fba <__fixtfsi+0x98>
    4faa: 85 46        	li	a3, 1
    4fac: 73 a0 16 00  	csrs	fflags, a3
    4fb0: 82 80        	ret
    4fb2: 49 8f        	or	a4, a4, a0
    4fb4: 01 45        	li	a0, 0
    4fb6: 75 fb        	bnez	a4, 0x4faa <__fixtfsi+0x88>
    4fb8: 82 80        	ret
    4fba: 82 80        	ret
    4fbc: c1 46        	li	a3, 16
    4fbe: 61 b7        	j	0x4f46 <__fixtfsi+0x24>

0000000000004fc0 <__fixunstfsi>:
    4fc0: f3 27 20 00  	csrr	a5, frm
    4fc4: 11 66        	lui	a2, 4
    4fc6: 93 97 15 00  	slli	a5, a1, 1
    4fca: 13 97 05 01  	slli	a4, a1, 16
    4fce: c5 93        	srli	a5, a5, 49
    4fd0: 93 06 e6 ff  	addi	a3, a2, -2
    4fd4: 41 83        	srli	a4, a4, 16
    4fd6: fd 91        	srli	a1, a1, 63
    4fd8: 63 c8 f6 00  	blt	a3, a5, 0x4fe8 <__fixunstfsi+0x28>
    4fdc: 95 c3        	beqz	a5, 0x5000 <__fixunstfsi+0x40>
    4fde: 01 45        	li	a0, 0
    4fe0: 85 47        	li	a5, 1
    4fe2: 73 a0 17 00  	csrs	fflags, a5
    4fe6: 82 80        	ret
    4fe8: 93 b6 15 00  	seqz	a3, a1
    4fec: b2 96        	add	a3, a3, a2
    4fee: f9 06        	addi	a3, a3, 30
    4ff0: 63 cb d7 00  	blt	a5, a3, 0x5006 <__fixunstfsi+0x46>
    4ff4: 1b 85 f5 ff  	addiw	a0, a1, -1
    4ff8: c1 47        	li	a5, 16
    4ffa: 73 a0 17 00  	csrs	fflags, a5
    4ffe: 82 80        	ret
    5000: 59 8d        	or	a0, a0, a4
    5002: 71 fd        	bnez	a0, 0x4fde <__fixunstfsi+0x1e>
    5004: 82 80        	ret
    5006: 85 e5        	bnez	a1, 0x502e <__fixunstfsi+0x6e>
    5008: 85 46        	li	a3, 1
    500a: c2 16        	slli	a3, a3, 48
    500c: 55 8f        	or	a4, a4, a3
    500e: f1 76        	lui	a3, 1048572
    5010: c5 26        	addiw	a3, a3, 17
    5012: 11 66        	lui	a2, 4
    5014: bd 9e        	addw	a3, a3, a5
    5016: 1b 06 f6 02  	addiw	a2, a2, 47
    501a: 1d 9e        	subw	a2, a2, a5
    501c: b3 17 d7 00  	sll	a5, a4, a3
    5020: c9 8f        	or	a5, a5, a0
    5022: 33 57 c7 00  	srl	a4, a4, a2
    5026: 1b 05 07 00  	sext.w	a0, a4
    502a: 89 e7        	bnez	a5, 0x5034 <__fixunstfsi+0x74>
    502c: 82 80        	ret
    502e: 01 45        	li	a0, 0
    5030: c1 47        	li	a5, 16
    5032: 45 bf        	j	0x4fe2 <__fixunstfsi+0x22>
    5034: 85 47        	li	a5, 1
    5036: 75 b7        	j	0x4fe2 <__fixunstfsi+0x22>

0000000000005038 <__floatsitf>:
    5038: 01 11        	addi	sp, sp, -32
    503a: 06 ec        	sd	ra, 24(sp)
    503c: 22 e8        	sd	s0, 16(sp)
    503e: 26 e4        	sd	s1, 8(sp)
    5040: 31 c5        	beqz	a0, 0x508c <__floatsitf+0x54>
    5042: 9b 07 05 00  	sext.w	a5, a0
    5046: 9b 54 f5 01  	srliw	s1, a0, 31
    504a: 63 45 05 04  	bltz	a0, 0x5094 <__floatsitf+0x5c>
    504e: 13 94 07 02  	slli	s0, a5, 32
    5052: 01 90        	srli	s0, s0, 32
    5054: 22 85        	mv	a0, s0
    5056: ef 00 c0 17  	jal	0x51d2 <__clzdi2>
    505a: 11 67        	lui	a4, 4
    505c: 9b 07 15 ff  	addiw	a5, a0, -15
    5060: 1b 07 e7 03  	addiw	a4, a4, 62
    5064: b3 17 f4 00  	sll	a5, s0, a5
    5068: 09 9f        	subw	a4, a4, a0
    506a: c2 07        	slli	a5, a5, 16
    506c: 46 17        	slli	a4, a4, 49
    506e: c1 83        	srli	a5, a5, 16
    5070: 45 93        	srli	a4, a4, 49
    5072: e2 60        	ld	ra, 24(sp)
    5074: 42 64        	ld	s0, 16(sp)
    5076: 93 95 f4 00  	slli	a1, s1, 15
    507a: c2 07        	slli	a5, a5, 16
    507c: d9 8d        	or	a1, a1, a4
    507e: c2 15        	slli	a1, a1, 48
    5080: c1 83        	srli	a5, a5, 16
    5082: a2 64        	ld	s1, 8(sp)
    5084: 01 45        	li	a0, 0
    5086: dd 8d        	or	a1, a1, a5
    5088: 05 61        	addi	sp, sp, 32
    508a: 82 80        	ret
    508c: 81 44        	li	s1, 0
    508e: 01 47        	li	a4, 0
    5090: 81 47        	li	a5, 0
    5092: c5 b7        	j	0x5072 <__floatsitf+0x3a>
    5094: bb 07 f0 40  	negw	a5, a5
    5098: 5d bf        	j	0x504e <__floatsitf+0x16>

000000000000509a <__floatunsitf>:
    509a: 1d cd        	beqz	a0, 0x50d8 <__floatunsitf+0x3e>
    509c: 41 11        	addi	sp, sp, -16
    509e: 22 e0        	sd	s0, 0(sp)
    50a0: 13 14 05 02  	slli	s0, a0, 32
    50a4: 01 90        	srli	s0, s0, 32
    50a6: 22 85        	mv	a0, s0
    50a8: 06 e4        	sd	ra, 8(sp)
    50aa: ef 00 80 12  	jal	0x51d2 <__clzdi2>
    50ae: 9b 07 15 ff  	addiw	a5, a0, -15
    50b2: 91 65        	lui	a1, 4
    50b4: b3 17 f4 00  	sll	a5, s0, a5
    50b8: 9b 85 e5 03  	addiw	a1, a1, 62
    50bc: 89 9d        	subw	a1, a1, a0
    50be: c2 07        	slli	a5, a5, 16
    50c0: a2 60        	ld	ra, 8(sp)
    50c2: 02 64        	ld	s0, 0(sp)
    50c4: c6 15        	slli	a1, a1, 49
    50c6: c1 83        	srli	a5, a5, 16
    50c8: c5 91        	srli	a1, a1, 49
    50ca: c2 07        	slli	a5, a5, 16
    50cc: c2 15        	slli	a1, a1, 48
    50ce: c1 83        	srli	a5, a5, 16
    50d0: 01 45        	li	a0, 0
    50d2: dd 8d        	or	a1, a1, a5
    50d4: 41 01        	addi	sp, sp, 16
    50d6: 82 80        	ret
    50d8: 81 47        	li	a5, 0
    50da: 81 45        	li	a1, 0
    50dc: c2 07        	slli	a5, a5, 16
    50de: c1 83        	srli	a5, a5, 16
    50e0: c2 15        	slli	a1, a1, 48
    50e2: 01 45        	li	a0, 0
    50e4: dd 8d        	or	a1, a1, a5
    50e6: 82 80        	ret

00000000000050e8 <__extenddftf2>:
    50e8: 01 11        	addi	sp, sp, -32
    50ea: 53 07 05 e2  	<unknown>
    50ee: 06 ec        	sd	ra, 24(sp)
    50f0: 22 e8        	sd	s0, 16(sp)
    50f2: 26 e4        	sd	s1, 8(sp)
    50f4: f3 27 20 00  	csrr	a5, frm
    50f8: 93 57 47 03  	srli	a5, a4, 52
    50fc: 93 f7 f7 7f  	andi	a5, a5, 2047
    5100: 7d 56        	li	a2, -1
    5102: 93 86 17 00  	addi	a3, a5, 1
    5106: 13 55 c6 00  	srli	a0, a2, 12
    510a: 93 f6 e6 7f  	andi	a3, a3, 2046
    510e: 33 74 e5 00  	and	s0, a0, a4
    5112: 93 54 f7 03  	srli	s1, a4, 63
    5116: 95 c6        	beqz	a3, 0x5142 <__extenddftf2+0x5a>
    5118: 11 67        	lui	a4, 4
    511a: 13 07 07 c0  	addi	a4, a4, -1024
    511e: ba 97        	add	a5, a5, a4
    5120: c6 17        	slli	a5, a5, 49
    5122: 93 55 44 00  	srli	a1, s0, 4
    5126: c5 93        	srli	a5, a5, 49
    5128: 72 14        	slli	s0, s0, 60
    512a: c6 17        	slli	a5, a5, 49
    512c: 85 83        	srli	a5, a5, 1
    512e: 13 97 f4 03  	slli	a4, s1, 63
    5132: dd 8d        	or	a1, a1, a5
    5134: 22 85        	mv	a0, s0
    5136: d9 8d        	or	a1, a1, a4
    5138: e2 60        	ld	ra, 24(sp)
    513a: 42 64        	ld	s0, 16(sp)
    513c: a2 64        	ld	s1, 8(sp)
    513e: 05 61        	addi	sp, sp, 32
    5140: 82 80        	ret
    5142: 9d eb        	bnez	a5, 0x5178 <__extenddftf2+0x90>
    5144: 35 c8        	beqz	s0, 0x51b8 <__extenddftf2+0xd0>
    5146: 22 85        	mv	a0, s0
    5148: ef 00 a0 08  	jal	0x51d2 <__clzdi2>
    514c: 1b 07 05 00  	sext.w	a4, a0
    5150: b9 47        	li	a5, 14
    5152: 63 ca e7 06  	blt	a5, a4, 0x51c6 <__extenddftf2+0xde>
    5156: bd 45        	li	a1, 15
    5158: 89 9d        	subw	a1, a1, a0
    515a: 9b 07 15 03  	addiw	a5, a0, 49
    515e: b3 55 b4 00  	srl	a1, s0, a1
    5162: 33 14 f4 00  	sll	s0, s0, a5
    5166: 91 67        	lui	a5, 4
    5168: 9b 87 c7 c0  	addiw	a5, a5, -1012
    516c: 89 9f        	subw	a5, a5, a0
    516e: c2 05        	slli	a1, a1, 16
    5170: c6 17        	slli	a5, a5, 49
    5172: c1 81        	srli	a1, a1, 16
    5174: c5 93        	srli	a5, a5, 49
    5176: 55 bf        	j	0x512a <__extenddftf2+0x42>
    5178: 39 c0        	beqz	s0, 0x51be <__extenddftf2+0xd6>
    517a: 05 47        	li	a4, 1
    517c: 3e 17        	slli	a4, a4, 47
    517e: 93 55 44 00  	srli	a1, s0, 4
    5182: d9 8d        	or	a1, a1, a4
    5184: 93 57 34 03  	srli	a5, s0, 51
    5188: 41 82        	srli	a2, a2, 16
    518a: b7 f6 ff 07  	lui	a3, 32767
    518e: 92 16        	slli	a3, a3, 36
    5190: 93 c7 17 00  	xori	a5, a5, 1
    5194: f1 8d        	and	a1, a1, a2
    5196: d5 8d        	or	a1, a1, a3
    5198: 85 8b        	andi	a5, a5, 1
    519a: 13 97 f4 03  	slli	a4, s1, 63
    519e: 9b 96 47 00  	slliw	a3, a5, 4
    51a2: 13 15 c4 03  	slli	a0, s0, 60
    51a6: d9 8d        	or	a1, a1, a4
    51a8: c1 db        	beqz	a5, 0x5138 <__extenddftf2+0x50>
    51aa: 73 a0 16 00  	csrs	fflags, a3
    51ae: e2 60        	ld	ra, 24(sp)
    51b0: 42 64        	ld	s0, 16(sp)
    51b2: a2 64        	ld	s1, 8(sp)
    51b4: 05 61        	addi	sp, sp, 32
    51b6: 82 80        	ret
    51b8: 81 47        	li	a5, 0
    51ba: 81 45        	li	a1, 0
    51bc: bd b7        	j	0x512a <__extenddftf2+0x42>
    51be: a1 67        	lui	a5, 8
    51c0: fd 17        	addi	a5, a5, -1
    51c2: 81 45        	li	a1, 0
    51c4: 9d b7        	j	0x512a <__extenddftf2+0x42>
    51c6: 9b 05 15 ff  	addiw	a1, a0, -15
    51ca: b3 15 b4 00  	sll	a1, s0, a1
    51ce: 01 44        	li	s0, 0
    51d0: 59 bf        	j	0x5166 <__extenddftf2+0x7e>

00000000000051d2 <__clzdi2>:
    51d2: 93 07 80 03  	li	a5, 56
    51d6: 33 57 f5 00  	srl	a4, a0, a5
    51da: 93 76 f7 0f  	andi	a3, a4, 255
    51de: 99 ee        	bnez	a3, 0x51fc <__clzdi2+0x2a>
    51e0: e1 17        	addi	a5, a5, -8
    51e2: f5 fb        	bnez	a5, 0x51d6 <__clzdi2+0x4>
    51e4: 97 37 00 00  	auipc	a5, 3
    51e8: 83 b7 c7 fa  	ld	a5, -84(a5)
    51ec: aa 97        	add	a5, a5, a0
    51ee: 03 c5 07 00  	lbu	a0, 0(a5)
    51f2: 93 06 00 04  	li	a3, 64
    51f6: 3b 85 a6 40  	subw	a0, a3, a0
    51fa: 82 80        	ret
    51fc: 93 06 00 04  	li	a3, 64
    5200: 9d 8e        	sub	a3, a3, a5
    5202: 3a 85        	mv	a0, a4
    5204: 97 37 00 00  	auipc	a5, 3
    5208: 83 b7 c7 f8  	ld	a5, -116(a5)
    520c: aa 97        	add	a5, a5, a0
    520e: 03 c5 07 00  	lbu	a0, 0(a5)
    5212: 3b 85 a6 40  	subw	a0, a3, a0
    5216: 82 80        	ret
