
signal_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000508 <exit>:
     508:	1101                	addi	sp,sp,-32
     50a:	e42a                	sd	a0,8(sp)
     50c:	ec06                	sd	ra,24(sp)
     50e:	4ee000ef          	jal	ra,9fc <_fini>
     512:	4ec000ef          	jal	ra,9fe <__libc_exit_fini>
     516:	00008317          	auipc	t1,0x8
     51a:	c6233303          	ld	t1,-926(t1) # 8178 <_GLOBAL_OFFSET_TABLE_+0x60>
     51e:	9302                	jalr	t1
     520:	6522                	ld	a0,8(sp)
     522:	660020ef          	jal	ra,2b82 <_Exit>

0000000000000526 <_start>:
     526:	00008197          	auipc	gp,0x8
     52a:	2da18193          	addi	gp,gp,730 # 8800 <__global_pointer$>
     52e:	850a                	mv	a0,sp
     530:	00008597          	auipc	a1,0x8
     534:	96058593          	addi	a1,a1,-1696 # 7e90 <_DYNAMIC>
     538:	ff017113          	andi	sp,sp,-16
     53c:	a015                	j	560 <_start_c>

000000000000053e <__dls2>:
     53e:	00858613          	addi	a2,a1,8
     542:	418c                	lw	a1,0(a1)
     544:	4781                	li	a5,0
     546:	00008717          	auipc	a4,0x8
     54a:	c4273703          	ld	a4,-958(a4) # 8188 <_GLOBAL_OFFSET_TABLE_+0x70>
     54e:	00008697          	auipc	a3,0x8
     552:	bf26b683          	ld	a3,-1038(a3) # 8140 <_GLOBAL_OFFSET_TABLE_+0x28>
     556:	00008517          	auipc	a0,0x8
     55a:	c1a53503          	ld	a0,-998(a0) # 8170 <_GLOBAL_OFFSET_TABLE_+0x58>
     55e:	a1ad                	j	9c8 <__libc_start_main>

0000000000000560 <_start_c>:
     560:	6118                	ld	a4,0(a0)
     562:	df010113          	addi	sp,sp,-528
     566:	862a                	mv	a2,a0
     568:	2705                	addiw	a4,a4,1
     56a:	00371793          	slli	a5,a4,0x3
     56e:	00f606b3          	add	a3,a2,a5
     572:	6694                	ld	a3,8(a3)
     574:	0705                	addi	a4,a4,1
     576:	faf5                	bnez	a3,56a <_start_c+0xa>
     578:	07c1                	addi	a5,a5,16
     57a:	97b2                	add	a5,a5,a2
     57c:	0814                	addi	a3,sp,16
     57e:	0a18                	addi	a4,sp,272
     580:	0006b023          	sd	zero,0(a3)
     584:	06a1                	addi	a3,a3,8
     586:	fee69de3          	bne	a3,a4,580 <_start_c+0x20>
     58a:	457d                	li	a0,31
     58c:	6394                	ld	a3,0(a5)
     58e:	eeb5                	bnez	a3,60a <_start_c+0xaa>
     590:	87ba                	mv	a5,a4
     592:	0c18                	addi	a4,sp,528
     594:	e43a                	sd	a4,8(sp)
     596:	6722                	ld	a4,8(sp)
     598:	0007b023          	sd	zero,0(a5)
     59c:	07a1                	addi	a5,a5,8
     59e:	fee79ce3          	bne	a5,a4,596 <_start_c+0x36>
     5a2:	872e                	mv	a4,a1
     5a4:	46fd                	li	a3,31
     5a6:	631c                	ld	a5,0(a4)
     5a8:	efbd                	bnez	a5,626 <_start_c+0xc6>
     5aa:	6526                	ld	a0,72(sp)
     5ac:	ed11                	bnez	a0,5c8 <_start_c+0x68>
     5ae:	7562                	ld	a0,56(sp)
     5b0:	7742                	ld	a4,48(sp)
     5b2:	77a2                	ld	a5,40(sp)
     5b4:	4689                	li	a3,2
     5b6:	c909                	beqz	a0,5c8 <_start_c+0x68>
     5b8:	0007a803          	lw	a6,0(a5)
     5bc:	157d                	addi	a0,a0,-1
     5be:	08d81063          	bne	a6,a3,63e <_start_c+0xde>
     5c2:	6b88                	ld	a0,16(a5)
     5c4:	40a58533          	sub	a0,a1,a0
     5c8:	677a                	ld	a4,408(sp)
     5ca:	779a                	ld	a5,416(sp)
     5cc:	800005b7          	lui	a1,0x80000
     5d0:	972a                	add	a4,a4,a0
     5d2:	973e                	add	a4,a4,a5
     5d4:	fff5c593          	not	a1,a1
     5d8:	488d                	li	a7,3
     5da:	40f70833          	sub	a6,a4,a5
     5de:	e3b5                	bnez	a5,642 <_start_c+0xe2>
     5e0:	6736                	ld	a4,328(sp)
     5e2:	67d6                	ld	a5,336(sp)
     5e4:	800005b7          	lui	a1,0x80000
     5e8:	972a                	add	a4,a4,a0
     5ea:	973e                	add	a4,a4,a5
     5ec:	fff5c593          	not	a1,a1
     5f0:	488d                	li	a7,3
     5f2:	40f706b3          	sub	a3,a4,a5
     5f6:	e7ad                	bnez	a5,660 <_start_c+0x100>
     5f8:	00008797          	auipc	a5,0x8
     5fc:	a0878793          	addi	a5,a5,-1528 # 8000 <static_func_ptr.0>
     600:	639c                	ld	a5,0(a5)
     602:	85b2                	mv	a1,a2
     604:	21010113          	addi	sp,sp,528
     608:	8782                	jr	a5
     60a:	00d56c63          	bltu	a0,a3,622 <_start_c+0xc2>
     60e:	068e                	slli	a3,a3,0x3
     610:	01010813          	addi	a6,sp,16
     614:	20068693          	addi	a3,a3,512
     618:	96c2                	add	a3,a3,a6
     61a:	0087b803          	ld	a6,8(a5)
     61e:	e106b023          	sd	a6,-512(a3)
     622:	07c1                	addi	a5,a5,16
     624:	b7a5                	j	58c <_start_c+0x2c>
     626:	00f6ea63          	bltu	a3,a5,63a <_start_c+0xda>
     62a:	078e                	slli	a5,a5,0x3
     62c:	0808                	addi	a0,sp,16
     62e:	20078793          	addi	a5,a5,512
     632:	97aa                	add	a5,a5,a0
     634:	6708                	ld	a0,8(a4)
     636:	f0a7b023          	sd	a0,-256(a5)
     63a:	0741                	addi	a4,a4,16
     63c:	b7ad                	j	5a6 <_start_c+0x46>
     63e:	97ba                	add	a5,a5,a4
     640:	bf9d                	j	5b6 <_start_c+0x56>
     642:	00883683          	ld	a3,8(a6)
     646:	8eed                	and	a3,a3,a1
     648:	01169a63          	bne	a3,a7,65c <_start_c+0xfc>
     64c:	00083683          	ld	a3,0(a6)
     650:	96aa                	add	a3,a3,a0
     652:	0006b803          	ld	a6,0(a3)
     656:	982a                	add	a6,a6,a0
     658:	0106b023          	sd	a6,0(a3)
     65c:	17c1                	addi	a5,a5,-16
     65e:	bfb5                	j	5da <_start_c+0x7a>
     660:	0086b803          	ld	a6,8(a3)
     664:	00b87833          	and	a6,a6,a1
     668:	01181963          	bne	a6,a7,67a <_start_c+0x11a>
     66c:	0006b803          	ld	a6,0(a3)
     670:	6a94                	ld	a3,16(a3)
     672:	982a                	add	a6,a6,a0
     674:	96aa                	add	a3,a3,a0
     676:	00d83023          	sd	a3,0(a6)
     67a:	17a1                	addi	a5,a5,-24
     67c:	bf9d                	j	5f2 <_start_c+0x92>

000000000000067e <deregister_tm_clones>:
     67e:	00008517          	auipc	a0,0x8
     682:	a8a50513          	addi	a0,a0,-1398 # 8108 <__TMC_END__>
     686:	00008797          	auipc	a5,0x8
     68a:	a8278793          	addi	a5,a5,-1406 # 8108 <__TMC_END__>
     68e:	00a78863          	beq	a5,a0,69e <deregister_tm_clones+0x20>
     692:	00008797          	auipc	a5,0x8
     696:	ace7b783          	ld	a5,-1330(a5) # 8160 <_GLOBAL_OFFSET_TABLE_+0x48>
     69a:	c391                	beqz	a5,69e <deregister_tm_clones+0x20>
     69c:	8782                	jr	a5
     69e:	8082                	ret

00000000000006a0 <register_tm_clones>:
     6a0:	00008517          	auipc	a0,0x8
     6a4:	a6850513          	addi	a0,a0,-1432 # 8108 <__TMC_END__>
     6a8:	00008597          	auipc	a1,0x8
     6ac:	a6058593          	addi	a1,a1,-1440 # 8108 <__TMC_END__>
     6b0:	8d89                	sub	a1,a1,a0
     6b2:	4035d793          	srai	a5,a1,0x3
     6b6:	91fd                	srli	a1,a1,0x3f
     6b8:	95be                	add	a1,a1,a5
     6ba:	8585                	srai	a1,a1,0x1
     6bc:	c599                	beqz	a1,6ca <register_tm_clones+0x2a>
     6be:	00008797          	auipc	a5,0x8
     6c2:	a927b783          	ld	a5,-1390(a5) # 8150 <_GLOBAL_OFFSET_TABLE_+0x38>
     6c6:	c391                	beqz	a5,6ca <register_tm_clones+0x2a>
     6c8:	8782                	jr	a5
     6ca:	8082                	ret

00000000000006cc <__do_global_dtors_aux>:
     6cc:	1141                	addi	sp,sp,-16
     6ce:	e022                	sd	s0,0(sp)
     6d0:	00008417          	auipc	s0,0x8
     6d4:	ae040413          	addi	s0,s0,-1312 # 81b0 <completed.1>
     6d8:	00044783          	lbu	a5,0(s0)
     6dc:	e406                	sd	ra,8(sp)
     6de:	eb95                	bnez	a5,712 <__do_global_dtors_aux+0x46>
     6e0:	00008797          	auipc	a5,0x8
     6e4:	a487b783          	ld	a5,-1464(a5) # 8128 <_GLOBAL_OFFSET_TABLE_+0x10>
     6e8:	c791                	beqz	a5,6f4 <__do_global_dtors_aux+0x28>
     6ea:	00008517          	auipc	a0,0x8
     6ee:	91e53503          	ld	a0,-1762(a0) # 8008 <__dso_handle>
     6f2:	9782                	jalr	a5
     6f4:	f8bff0ef          	jal	ra,67e <deregister_tm_clones>
     6f8:	00008797          	auipc	a5,0x8
     6fc:	a507b783          	ld	a5,-1456(a5) # 8148 <_GLOBAL_OFFSET_TABLE_+0x30>
     700:	c791                	beqz	a5,70c <__do_global_dtors_aux+0x40>
     702:	00006517          	auipc	a0,0x6
     706:	95650513          	addi	a0,a0,-1706 # 6058 <__FRAME_END__>
     70a:	9782                	jalr	a5
     70c:	4785                	li	a5,1
     70e:	00f40023          	sb	a5,0(s0)
     712:	60a2                	ld	ra,8(sp)
     714:	6402                	ld	s0,0(sp)
     716:	0141                	addi	sp,sp,16
     718:	8082                	ret

000000000000071a <frame_dummy>:
     71a:	00008797          	auipc	a5,0x8
     71e:	a867b783          	ld	a5,-1402(a5) # 81a0 <_GLOBAL_OFFSET_TABLE_+0x88>
     722:	cf99                	beqz	a5,740 <frame_dummy+0x26>
     724:	1141                	addi	sp,sp,-16
     726:	e406                	sd	ra,8(sp)
     728:	00008597          	auipc	a1,0x8
     72c:	a9058593          	addi	a1,a1,-1392 # 81b8 <object.0>
     730:	00006517          	auipc	a0,0x6
     734:	92850513          	addi	a0,a0,-1752 # 6058 <__FRAME_END__>
     738:	9782                	jalr	a5
     73a:	60a2                	ld	ra,8(sp)
     73c:	0141                	addi	sp,sp,16
     73e:	b78d                	j	6a0 <register_tm_clones>
     740:	b785                	j	6a0 <register_tm_clones>

0000000000000742 <signal_handler>:
     742:	1101                	addi	sp,sp,-32
     744:	ec06                	sd	ra,24(sp)
     746:	e822                	sd	s0,16(sp)
     748:	1000                	addi	s0,sp,32
     74a:	87aa                	mv	a5,a0
     74c:	fef42623          	sw	a5,-20(s0)
     750:	fec42783          	lw	a5,-20(s0)
     754:	85be                	mv	a1,a5
     756:	00005517          	auipc	a0,0x5
     75a:	aca50513          	addi	a0,a0,-1334 # 5220 <__clzdi2+0x4e>
     75e:	51a000ef          	jal	ra,c78 <printf>
     762:	0001                	nop
     764:	60e2                	ld	ra,24(sp)
     766:	6442                	ld	s0,16(sp)
     768:	6105                	addi	sp,sp,32
     76a:	8082                	ret

000000000000076c <main>:
     76c:	7169                	addi	sp,sp,-304
     76e:	f606                	sd	ra,296(sp)
     770:	f222                	sd	s0,288(sp)
     772:	1a00                	addi	s0,sp,304
     774:	00000797          	auipc	a5,0x0
     778:	fce78793          	addi	a5,a5,-50 # 742 <signal_handler>
     77c:	f4f43c23          	sd	a5,-168(s0)
     780:	fe042023          	sw	zero,-32(s0)
     784:	f5840793          	addi	a5,s0,-168
     788:	07a1                	addi	a5,a5,8
     78a:	853e                	mv	a0,a5
     78c:	4c4000ef          	jal	ra,c50 <sigemptyset>
     790:	f5840793          	addi	a5,s0,-168
     794:	4601                	li	a2,0
     796:	85be                	mv	a1,a5
     798:	4529                	li	a0,10
     79a:	404000ef          	jal	ra,b9e <__sigaction>
     79e:	ed840793          	addi	a5,s0,-296
     7a2:	853e                	mv	a0,a5
     7a4:	4ac000ef          	jal	ra,c50 <sigemptyset>
     7a8:	ed840793          	addi	a5,s0,-296
     7ac:	45a9                	li	a1,10
     7ae:	853e                	mv	a0,a5
     7b0:	468000ef          	jal	ra,c18 <sigaddset>
     7b4:	ed840793          	addi	a5,s0,-296
     7b8:	4601                	li	a2,0
     7ba:	85be                	mv	a1,a5
     7bc:	4501                	li	a0,0
     7be:	49a000ef          	jal	ra,c58 <sigprocmask>
     7c2:	00005517          	auipc	a0,0x5
     7c6:	a7650513          	addi	a0,a0,-1418 # 5238 <__clzdi2+0x66>
     7ca:	4d8000ef          	jal	ra,ca2 <puts>
     7ce:	142020ef          	jal	ra,2910 <getpid>
     7d2:	87aa                	mv	a5,a0
     7d4:	45a9                	li	a1,10
     7d6:	853e                	mv	a0,a5
     7d8:	25e000ef          	jal	ra,a36 <kill>
     7dc:	00005517          	auipc	a0,0x5
     7e0:	a8c50513          	addi	a0,a0,-1396 # 5268 <__clzdi2+0x96>
     7e4:	4be000ef          	jal	ra,ca2 <puts>
     7e8:	ed840793          	addi	a5,s0,-296
     7ec:	4601                	li	a2,0
     7ee:	85be                	mv	a1,a5
     7f0:	4505                	li	a0,1
     7f2:	466000ef          	jal	ra,c58 <sigprocmask>
     7f6:	00005517          	auipc	a0,0x5
     7fa:	a9a50513          	addi	a0,a0,-1382 # 5290 <__clzdi2+0xbe>
     7fe:	4a4000ef          	jal	ra,ca2 <puts>
     802:	00005517          	auipc	a0,0x5
     806:	abe50513          	addi	a0,a0,-1346 # 52c0 <__clzdi2+0xee>
     80a:	498000ef          	jal	ra,ca2 <puts>
     80e:	4781                	li	a5,0
     810:	853e                	mv	a0,a5
     812:	70b2                	ld	ra,296(sp)
     814:	7412                	ld	s0,288(sp)
     816:	6155                	addi	sp,sp,304
     818:	8082                	ret

000000000000081a <_init>:
     81a:	8082                	ret

000000000000081c <__init_ssp>:
     81c:	8082                	ret

000000000000081e <__init_libc>:
     81e:	7109                	addi	sp,sp,-384
     820:	f2ca                	sd	s2,352(sp)
     822:	03010913          	addi	s2,sp,48
     826:	faa2                	sd	s0,368(sp)
     828:	f6a6                	sd	s1,360(sp)
     82a:	842e                	mv	s0,a1
     82c:	84aa                	mv	s1,a0
     82e:	13000613          	li	a2,304
     832:	4581                	li	a1,0
     834:	854a                	mv	a0,s2
     836:	fe86                	sd	ra,376(sp)
     838:	683010ef          	jal	ra,26ba <memset>
     83c:	00008797          	auipc	a5,0x8
     840:	8fc7b783          	ld	a5,-1796(a5) # 8138 <_GLOBAL_OFFSET_TABLE_+0x20>
     844:	e384                	sd	s1,0(a5)
     846:	4701                	li	a4,0
     848:	00371793          	slli	a5,a4,0x3
     84c:	00f486b3          	add	a3,s1,a5
     850:	6294                	ld	a3,0(a3)
     852:	0705                	addi	a4,a4,1
     854:	faf5                	bnez	a3,848 <__init_libc+0x2a>
     856:	07a1                	addi	a5,a5,8
     858:	00f48533          	add	a0,s1,a5
     85c:	00008497          	auipc	s1,0x8
     860:	99c48493          	addi	s1,s1,-1636 # 81f8 <__libc>
     864:	e488                	sd	a0,8(s1)
     866:	02500713          	li	a4,37
     86a:	611c                	ld	a5,0(a0)
     86c:	e3f1                	bnez	a5,930 <__init_libc+0x112>
     86e:	77ca                	ld	a5,176(sp)
     870:	00008717          	auipc	a4,0x8
     874:	98f73023          	sd	a5,-1664(a4) # 81f0 <__hwcap>
     878:	77d2                	ld	a5,304(sp)
     87a:	c789                	beqz	a5,884 <__init_libc+0x66>
     87c:	00008717          	auipc	a4,0x8
     880:	96f73623          	sd	a5,-1684(a4) # 81e8 <__sysinfo>
     884:	7786                	ld	a5,96(sp)
     886:	f89c                	sd	a5,48(s1)
     888:	e801                	bnez	s0,898 <__init_libc+0x7a>
     88a:	77b2                	ld	a5,296(sp)
     88c:	00005417          	auipc	s0,0x5
     890:	a4c40413          	addi	s0,s0,-1460 # 52d8 <__clzdi2+0x106>
     894:	c391                	beqz	a5,898 <__init_libc+0x7a>
     896:	843e                	mv	s0,a5
     898:	00008797          	auipc	a5,0x8
     89c:	9107b783          	ld	a5,-1776(a5) # 81a8 <_GLOBAL_OFFSET_TABLE_+0x90>
     8a0:	00008717          	auipc	a4,0x8
     8a4:	8b873703          	ld	a4,-1864(a4) # 8158 <_GLOBAL_OFFSET_TABLE_+0x40>
     8a8:	e380                	sd	s0,0(a5)
     8aa:	e300                	sd	s0,0(a4)
     8ac:	02f00693          	li	a3,47
     8b0:	0405                	addi	s0,s0,1
     8b2:	fff44783          	lbu	a5,-1(s0)
     8b6:	ebc1                	bnez	a5,946 <__init_libc+0x128>
     8b8:	854a                	mv	a0,s2
     8ba:	15c020ef          	jal	ra,2a16 <__init_tls>
     8be:	756e                	ld	a0,248(sp)
     8c0:	f5dff0ef          	jal	ra,81c <__init_ssp>
     8c4:	672a                	ld	a4,136(sp)
     8c6:	67ca                	ld	a5,144(sp)
     8c8:	00f71863          	bne	a4,a5,8d8 <__init_libc+0xba>
     8cc:	676a                	ld	a4,152(sp)
     8ce:	778a                	ld	a5,160(sp)
     8d0:	00f71463          	bne	a4,a5,8d8 <__init_libc+0xba>
     8d4:	77ae                	ld	a5,232(sp)
     8d6:	c3d9                	beqz	a5,95c <__init_libc+0x13e>
     8d8:	f002                	sd	zero,32(sp)
     8da:	4785                	li	a5,1
     8dc:	f402                	sd	zero,40(sp)
     8de:	d03e                	sw	a5,32(sp)
     8e0:	4789                	li	a5,2
     8e2:	d43e                	sw	a5,40(sp)
     8e4:	083c                	addi	a5,sp,24
     8e6:	ec02                	sd	zero,24(sp)
     8e8:	e402                	sd	zero,8(sp)
     8ea:	e802                	sd	zero,16(sp)
     8ec:	04900893          	li	a7,73
     8f0:	853e                	mv	a0,a5
     8f2:	458d                	li	a1,3
     8f4:	0030                	addi	a2,sp,8
     8f6:	4681                	li	a3,0
     8f8:	4721                	li	a4,8
     8fa:	00000073          	ecall
     8fe:	2501                	sext.w	a0,a0
     900:	02054563          	bltz	a0,92a <__init_libc+0x10c>
     904:	6621                	lui	a2,0x8
     906:	00005597          	auipc	a1,0x5
     90a:	9da58593          	addi	a1,a1,-1574 # 52e0 <__clzdi2+0x10e>
     90e:	0609                	addi	a2,a2,2
     910:	0067d703          	lhu	a4,6(a5)
     914:	02077713          	andi	a4,a4,32
     918:	cf05                	beqz	a4,950 <__init_libc+0x132>
     91a:	03800893          	li	a7,56
     91e:	f9c00513          	li	a0,-100
     922:	00000073          	ecall
     926:	02055563          	bgez	a0,950 <__init_libc+0x132>
     92a:	00000023          	sb	zero,0(zero) # 0 <exit-0x508>
     92e:	9002                	ebreak
     930:	00f76963          	bltu	a4,a5,942 <__init_libc+0x124>
     934:	6514                	ld	a3,8(a0)
     936:	078e                	slli	a5,a5,0x3
     938:	16078793          	addi	a5,a5,352
     93c:	978a                	add	a5,a5,sp
     93e:	ecd7b823          	sd	a3,-304(a5)
     942:	0541                	addi	a0,a0,16
     944:	b71d                	j	86a <__init_libc+0x4c>
     946:	00d79363          	bne	a5,a3,94c <__init_libc+0x12e>
     94a:	e300                	sd	s0,0(a4)
     94c:	0405                	addi	s0,s0,1
     94e:	b795                	j	8b2 <__init_libc+0x94>
     950:	07a1                	addi	a5,a5,8
     952:	faf91fe3          	bne	s2,a5,910 <__init_libc+0xf2>
     956:	4785                	li	a5,1
     958:	00f48123          	sb	a5,2(s1)
     95c:	70f6                	ld	ra,376(sp)
     95e:	7456                	ld	s0,368(sp)
     960:	74b6                	ld	s1,360(sp)
     962:	7916                	ld	s2,352(sp)
     964:	6119                	addi	sp,sp,384
     966:	8082                	ret

0000000000000968 <__libc_start_init>:
     968:	1101                	addi	sp,sp,-32
     96a:	00007317          	auipc	t1,0x7
     96e:	7d633303          	ld	t1,2006(t1) # 8140 <_GLOBAL_OFFSET_TABLE_+0x28>
     972:	e822                	sd	s0,16(sp)
     974:	e426                	sd	s1,8(sp)
     976:	ec06                	sd	ra,24(sp)
     978:	00008417          	auipc	s0,0x8
     97c:	82043403          	ld	s0,-2016(s0) # 8198 <_GLOBAL_OFFSET_TABLE_+0x80>
     980:	9302                	jalr	t1
     982:	00007497          	auipc	s1,0x7
     986:	7fe4b483          	ld	s1,2046(s1) # 8180 <_GLOBAL_OFFSET_TABLE_+0x68>
     98a:	00946763          	bltu	s0,s1,998 <__libc_start_init+0x30>
     98e:	60e2                	ld	ra,24(sp)
     990:	6442                	ld	s0,16(sp)
     992:	64a2                	ld	s1,8(sp)
     994:	6105                	addi	sp,sp,32
     996:	8082                	ret
     998:	601c                	ld	a5,0(s0)
     99a:	0421                	addi	s0,s0,8
     99c:	9782                	jalr	a5
     99e:	b7f5                	j	98a <__libc_start_init+0x22>

00000000000009a0 <libc_start_main_stage2>:
     9a0:	7179                	addi	sp,sp,-48
     9a2:	f022                	sd	s0,32(sp)
     9a4:	00158413          	addi	s0,a1,1
     9a8:	040e                	slli	s0,s0,0x3
     9aa:	f406                	sd	ra,40(sp)
     9ac:	ec26                	sd	s1,24(sp)
     9ae:	e84a                	sd	s2,16(sp)
     9b0:	84ae                	mv	s1,a1
     9b2:	892a                	mv	s2,a0
     9b4:	9432                	add	s0,s0,a2
     9b6:	e432                	sd	a2,8(sp)
     9b8:	fb1ff0ef          	jal	ra,968 <__libc_start_init>
     9bc:	65a2                	ld	a1,8(sp)
     9be:	8622                	mv	a2,s0
     9c0:	8526                	mv	a0,s1
     9c2:	9902                	jalr	s2
     9c4:	b45ff0ef          	jal	ra,508 <exit>

00000000000009c8 <__libc_start_main>:
     9c8:	7179                	addi	sp,sp,-48
     9ca:	f022                	sd	s0,32(sp)
     9cc:	ec26                	sd	s1,24(sp)
     9ce:	842e                	mv	s0,a1
     9d0:	84aa                	mv	s1,a0
     9d2:	00158513          	addi	a0,a1,1
     9d6:	620c                	ld	a1,0(a2)
     9d8:	050e                	slli	a0,a0,0x3
     9da:	9532                	add	a0,a0,a2
     9dc:	f406                	sd	ra,40(sp)
     9de:	e432                	sd	a2,8(sp)
     9e0:	e3fff0ef          	jal	ra,81e <__init_libc>
     9e4:	00000797          	auipc	a5,0x0
     9e8:	fbc78793          	addi	a5,a5,-68 # 9a0 <libc_start_main_stage2>
     9ec:	85a2                	mv	a1,s0
     9ee:	7402                	ld	s0,32(sp)
     9f0:	6622                	ld	a2,8(sp)
     9f2:	70a2                	ld	ra,40(sp)
     9f4:	8526                	mv	a0,s1
     9f6:	64e2                	ld	s1,24(sp)
     9f8:	6145                	addi	sp,sp,48
     9fa:	8782                	jr	a5

00000000000009fc <_fini>:
     9fc:	8082                	ret

00000000000009fe <__libc_exit_fini>:
     9fe:	1101                	addi	sp,sp,-32
     a00:	e822                	sd	s0,16(sp)
     a02:	e426                	sd	s1,8(sp)
     a04:	ec06                	sd	ra,24(sp)
     a06:	00007417          	auipc	s0,0x7
     a0a:	72a43403          	ld	s0,1834(s0) # 8130 <_GLOBAL_OFFSET_TABLE_+0x18>
     a0e:	00007497          	auipc	s1,0x7
     a12:	75a4b483          	ld	s1,1882(s1) # 8168 <_GLOBAL_OFFSET_TABLE_+0x50>
     a16:	0084eb63          	bltu	s1,s0,a2c <__libc_exit_fini+0x2e>
     a1a:	6442                	ld	s0,16(sp)
     a1c:	60e2                	ld	ra,24(sp)
     a1e:	64a2                	ld	s1,8(sp)
     a20:	00007317          	auipc	t1,0x7
     a24:	76833303          	ld	t1,1896(t1) # 8188 <_GLOBAL_OFFSET_TABLE_+0x70>
     a28:	6105                	addi	sp,sp,32
     a2a:	8302                	jr	t1
     a2c:	ff843783          	ld	a5,-8(s0)
     a30:	1461                	addi	s0,s0,-8
     a32:	9782                	jalr	a5
     a34:	b7cd                	j	a16 <__libc_exit_fini+0x18>

0000000000000a36 <kill>:
     a36:	1141                	addi	sp,sp,-16
     a38:	e406                	sd	ra,8(sp)
     a3a:	08100893          	li	a7,129
     a3e:	00000073          	ecall
     a42:	152020ef          	jal	ra,2b94 <__syscall_ret>
     a46:	60a2                	ld	ra,8(sp)
     a48:	2501                	sext.w	a0,a0
     a4a:	0141                	addi	sp,sp,16
     a4c:	8082                	ret

0000000000000a4e <a_fetch_or.isra.0>:
     a4e:	411c                	lw	a5,0(a0)
     a50:	0007869b          	sext.w	a3,a5
     a54:	8fcd                	or	a5,a5,a1
     a56:	1605272f          	lr.w.aqrl	a4,(a0)
     a5a:	00d71563          	bne	a4,a3,a64 <a_fetch_or.isra.0+0x16>
     a5e:	1ef5262f          	sc.w.aqrl	a2,a5,(a0)
     a62:	fa75                	bnez	a2,a56 <a_fetch_or.isra.0+0x8>
     a64:	0007079b          	sext.w	a5,a4
     a68:	fef693e3          	bne	a3,a5,a4e <a_fetch_or.isra.0>
     a6c:	8082                	ret

0000000000000a6e <__get_handler_set>:
     a6e:	4621                	li	a2,8
     a70:	00008597          	auipc	a1,0x8
     a74:	80858593          	addi	a1,a1,-2040 # 8278 <handler_set>
     a78:	7f20106f          	j	226a <memcpy>

0000000000000a7c <__libc_sigaction>:
     a7c:	7159                	addi	sp,sp,-112
     a7e:	e8ca                	sd	s2,80(sp)
     a80:	e4ce                	sd	s3,72(sp)
     a82:	f486                	sd	ra,104(sp)
     a84:	f0a2                	sd	s0,96(sp)
     a86:	eca6                	sd	s1,88(sp)
     a88:	e0d2                	sd	s4,64(sp)
     a8a:	89aa                	mv	s3,a0
     a8c:	8932                	mv	s2,a2
     a8e:	c1e1                	beqz	a1,b4e <__libc_sigaction+0xd2>
     a90:	619c                	ld	a5,0(a1)
     a92:	4485                	li	s1,1
     a94:	842e                	mv	s0,a1
     a96:	08f4f163          	bgeu	s1,a5,b18 <__libc_sigaction+0x9c>
     a9a:	fff5079b          	addiw	a5,a0,-1
     a9e:	873e                	mv	a4,a5
     aa0:	00e494b3          	sll	s1,s1,a4
     aa4:	8399                	srli	a5,a5,0x6
     aa6:	078e                	slli	a5,a5,0x3
     aa8:	00007a17          	auipc	s4,0x7
     aac:	7d0a0a13          	addi	s4,s4,2000 # 8278 <handler_set>
     ab0:	0004859b          	sext.w	a1,s1
     ab4:	9a3e                	add	s4,s4,a5
     ab6:	c581                	beqz	a1,abe <__libc_sigaction+0x42>
     ab8:	8552                	mv	a0,s4
     aba:	f95ff0ef          	jal	ra,a4e <a_fetch_or.isra.0>
     abe:	4204d593          	srai	a1,s1,0x20
     ac2:	c589                	beqz	a1,acc <__libc_sigaction+0x50>
     ac4:	004a0513          	addi	a0,s4,4
     ac8:	f87ff0ef          	jal	ra,a4e <a_fetch_or.isra.0>
     acc:	00007797          	auipc	a5,0x7
     ad0:	72d7c783          	lbu	a5,1837(a5) # 81f9 <__libc+0x1>
     ad4:	e785                	bnez	a5,afc <__libc_sigaction+0x80>
     ad6:	00007717          	auipc	a4,0x7
     ada:	7aa70713          	addi	a4,a4,1962 # 8280 <unmask_done>
     ade:	431c                	lw	a5,0(a4)
     ae0:	ef91                	bnez	a5,afc <__libc_sigaction+0x80>
     ae2:	478d                	li	a5,3
     ae4:	1782                	slli	a5,a5,0x20
     ae6:	f03e                	sd	a5,32(sp)
     ae8:	08700893          	li	a7,135
     aec:	4505                	li	a0,1
     aee:	100c                	addi	a1,sp,32
     af0:	4601                	li	a2,0
     af2:	46a1                	li	a3,8
     af4:	00000073          	ecall
     af8:	4785                	li	a5,1
     afa:	c31c                	sw	a5,0(a4)
     afc:	08842783          	lw	a5,136(s0)
     b00:	83f1                	srli	a5,a5,0x1c
     b02:	8b85                	andi	a5,a5,1
     b04:	eb91                	bnez	a5,b18 <__libc_sigaction+0x9c>
     b06:	0330000f          	fence	rw,rw
     b0a:	4785                	li	a5,1
     b0c:	00007717          	auipc	a4,0x7
     b10:	76f72223          	sw	a5,1892(a4) # 8270 <__eintr_valid_flag>
     b14:	0330000f          	fence	rw,rw
     b18:	601c                	ld	a5,0(s0)
     b1a:	04000737          	lui	a4,0x4000
     b1e:	e03e                	sd	a5,0(sp)
     b20:	08842783          	lw	a5,136(s0)
     b24:	8f5d                	or	a4,a4,a5
     b26:	e43a                	sd	a4,8(sp)
     b28:	8b91                	andi	a5,a5,4
     b2a:	00002717          	auipc	a4,0x2
     b2e:	1b470713          	addi	a4,a4,436 # 2cde <__restore>
     b32:	e789                	bnez	a5,b3c <__libc_sigaction+0xc0>
     b34:	00002717          	auipc	a4,0x2
     b38:	1aa70713          	addi	a4,a4,426 # 2cde <__restore>
     b3c:	00840593          	addi	a1,s0,8
     b40:	4621                	li	a2,8
     b42:	0828                	addi	a0,sp,24
     b44:	e83a                	sd	a4,16(sp)
     b46:	724010ef          	jal	ra,226a <memcpy>
     b4a:	858a                	mv	a1,sp
     b4c:	e011                	bnez	s0,b50 <__libc_sigaction+0xd4>
     b4e:	4581                	li	a1,0
     b50:	4601                	li	a2,0
     b52:	00090363          	beqz	s2,b58 <__libc_sigaction+0xdc>
     b56:	1010                	addi	a2,sp,32
     b58:	08600893          	li	a7,134
     b5c:	854e                	mv	a0,s3
     b5e:	46a1                	li	a3,8
     b60:	00000073          	ecall
     b64:	0005041b          	sext.w	s0,a0
     b68:	00090f63          	beqz	s2,b86 <__libc_sigaction+0x10a>
     b6c:	ec09                	bnez	s0,b86 <__libc_sigaction+0x10a>
     b6e:	7782                	ld	a5,32(sp)
     b70:	4621                	li	a2,8
     b72:	182c                	addi	a1,sp,56
     b74:	00f93023          	sd	a5,0(s2)
     b78:	77a2                	ld	a5,40(sp)
     b7a:	00890513          	addi	a0,s2,8
     b7e:	08f92423          	sw	a5,136(s2)
     b82:	6e8010ef          	jal	ra,226a <memcpy>
     b86:	8522                	mv	a0,s0
     b88:	00c020ef          	jal	ra,2b94 <__syscall_ret>
     b8c:	70a6                	ld	ra,104(sp)
     b8e:	7406                	ld	s0,96(sp)
     b90:	64e6                	ld	s1,88(sp)
     b92:	6946                	ld	s2,80(sp)
     b94:	69a6                	ld	s3,72(sp)
     b96:	6a06                	ld	s4,64(sp)
     b98:	2501                	sext.w	a0,a0
     b9a:	6165                	addi	sp,sp,112
     b9c:	8082                	ret

0000000000000b9e <__sigaction>:
     b9e:	7139                	addi	sp,sp,-64
     ba0:	fc06                	sd	ra,56(sp)
     ba2:	f822                	sd	s0,48(sp)
     ba4:	f426                	sd	s1,40(sp)
     ba6:	fe05069b          	addiw	a3,a0,-32
     baa:	4709                	li	a4,2
     bac:	00d77963          	bgeu	a4,a3,bbe <__sigaction+0x20>
     bb0:	0005079b          	sext.w	a5,a0
     bb4:	37fd                	addiw	a5,a5,-1
     bb6:	03f00713          	li	a4,63
     bba:	00f77d63          	bgeu	a4,a5,bd4 <__sigaction+0x36>
     bbe:	78d010ef          	jal	ra,2b4a <__errno_location>
     bc2:	47d9                	li	a5,22
     bc4:	c11c                	sw	a5,0(a0)
     bc6:	54fd                	li	s1,-1
     bc8:	70e2                	ld	ra,56(sp)
     bca:	7442                	ld	s0,48(sp)
     bcc:	8526                	mv	a0,s1
     bce:	74a2                	ld	s1,40(sp)
     bd0:	6121                	addi	sp,sp,64
     bd2:	8082                	ret
     bd4:	4799                	li	a5,6
     bd6:	842a                	mv	s0,a0
     bd8:	00f51f63          	bne	a0,a5,bf6 <__sigaction+0x58>
     bdc:	0828                	addi	a0,sp,24
     bde:	e432                	sd	a2,8(sp)
     be0:	e02e                	sd	a1,0(sp)
     be2:	0ba020ef          	jal	ra,2c9c <__block_all_sigs>
     be6:	00008517          	auipc	a0,0x8
     bea:	c3a50513          	addi	a0,a0,-966 # 8820 <__abort_lock>
     bee:	3cb010ef          	jal	ra,27b8 <__lock>
     bf2:	6622                	ld	a2,8(sp)
     bf4:	6582                	ld	a1,0(sp)
     bf6:	8522                	mv	a0,s0
     bf8:	e85ff0ef          	jal	ra,a7c <__libc_sigaction>
     bfc:	4799                	li	a5,6
     bfe:	84aa                	mv	s1,a0
     c00:	fcf414e3          	bne	s0,a5,bc8 <__sigaction+0x2a>
     c04:	00008517          	auipc	a0,0x8
     c08:	c1c50513          	addi	a0,a0,-996 # 8820 <__abort_lock>
     c0c:	47f010ef          	jal	ra,288a <__unlock>
     c10:	0828                	addi	a0,sp,24
     c12:	0ba020ef          	jal	ra,2ccc <__restore_sigs>
     c16:	bf4d                	j	bc8 <__sigaction+0x2a>

0000000000000c18 <sigaddset>:
     c18:	fff5879b          	addiw	a5,a1,-1
     c1c:	03f00713          	li	a4,63
     c20:	00f76663          	bltu	a4,a5,c2c <sigaddset+0x14>
     c24:	3581                	addiw	a1,a1,-32
     c26:	4709                	li	a4,2
     c28:	00b76c63          	bltu	a4,a1,c40 <sigaddset+0x28>
     c2c:	1141                	addi	sp,sp,-16
     c2e:	e406                	sd	ra,8(sp)
     c30:	71b010ef          	jal	ra,2b4a <__errno_location>
     c34:	60a2                	ld	ra,8(sp)
     c36:	47d9                	li	a5,22
     c38:	c11c                	sw	a5,0(a0)
     c3a:	557d                	li	a0,-1
     c3c:	0141                	addi	sp,sp,16
     c3e:	8082                	ret
     c40:	4705                	li	a4,1
     c42:	00f71733          	sll	a4,a4,a5
     c46:	611c                	ld	a5,0(a0)
     c48:	8fd9                	or	a5,a5,a4
     c4a:	e11c                	sd	a5,0(a0)
     c4c:	4501                	li	a0,0
     c4e:	8082                	ret

0000000000000c50 <sigemptyset>:
     c50:	00053023          	sd	zero,0(a0)
     c54:	4501                	li	a0,0
     c56:	8082                	ret

0000000000000c58 <sigprocmask>:
     c58:	1141                	addi	sp,sp,-16
     c5a:	e022                	sd	s0,0(sp)
     c5c:	e406                	sd	ra,8(sp)
     c5e:	487010ef          	jal	ra,28e4 <pthread_sigmask>
     c62:	842a                	mv	s0,a0
     c64:	c509                	beqz	a0,c6e <sigprocmask+0x16>
     c66:	6e5010ef          	jal	ra,2b4a <__errno_location>
     c6a:	c100                	sw	s0,0(a0)
     c6c:	547d                	li	s0,-1
     c6e:	60a2                	ld	ra,8(sp)
     c70:	8522                	mv	a0,s0
     c72:	6402                	ld	s0,0(sp)
     c74:	0141                	addi	sp,sp,16
     c76:	8082                	ret

0000000000000c78 <printf>:
     c78:	711d                	addi	sp,sp,-96
     c7a:	f42e                	sd	a1,40(sp)
     c7c:	f832                	sd	a2,48(sp)
     c7e:	85aa                	mv	a1,a0
     c80:	1030                	addi	a2,sp,40
     c82:	00007517          	auipc	a0,0x7
     c86:	38e50513          	addi	a0,a0,910 # 8010 <__stdout_FILE>
     c8a:	ec06                	sd	ra,24(sp)
     c8c:	fc36                	sd	a3,56(sp)
     c8e:	e0ba                	sd	a4,64(sp)
     c90:	e4be                	sd	a5,72(sp)
     c92:	e8c2                	sd	a6,80(sp)
     c94:	ecc6                	sd	a7,88(sp)
     c96:	e432                	sd	a2,8(sp)
     c98:	4c8010ef          	jal	ra,2160 <vfprintf>
     c9c:	60e2                	ld	ra,24(sp)
     c9e:	6125                	addi	sp,sp,96
     ca0:	8082                	ret

0000000000000ca2 <puts>:
     ca2:	1101                	addi	sp,sp,-32
     ca4:	e822                	sd	s0,16(sp)
     ca6:	e426                	sd	s1,8(sp)
     ca8:	e04a                	sd	s2,0(sp)
     caa:	ec06                	sd	ra,24(sp)
     cac:	00007797          	auipc	a5,0x7
     cb0:	3f07a783          	lw	a5,1008(a5) # 809c <__stdout_FILE+0x8c>
     cb4:	892a                	mv	s2,a0
     cb6:	00007417          	auipc	s0,0x7
     cba:	35a40413          	addi	s0,s0,858 # 8010 <__stdout_FILE>
     cbe:	4481                	li	s1,0
     cc0:	0007c663          	bltz	a5,ccc <puts+0x2a>
     cc4:	8522                	mv	a0,s0
     cc6:	020020ef          	jal	ra,2ce6 <__lockfile>
     cca:	84aa                	mv	s1,a0
     ccc:	00007597          	auipc	a1,0x7
     cd0:	34458593          	addi	a1,a1,836 # 8010 <__stdout_FILE>
     cd4:	854a                	mv	a0,s2
     cd6:	1f2020ef          	jal	ra,2ec8 <fputs>
     cda:	4785                	li	a5,1
     cdc:	02054163          	bltz	a0,cfe <puts+0x5c>
     ce0:	09042783          	lw	a5,144(s0)
     ce4:	4729                	li	a4,10
     ce6:	02e78c63          	beq	a5,a4,d1e <puts+0x7c>
     cea:	741c                	ld	a5,40(s0)
     cec:	7014                	ld	a3,32(s0)
     cee:	02d78863          	beq	a5,a3,d1e <puts+0x7c>
     cf2:	00178693          	addi	a3,a5,1
     cf6:	f414                	sd	a3,40(s0)
     cf8:	00e78023          	sb	a4,0(a5)
     cfc:	4781                	li	a5,0
     cfe:	40f00433          	neg	s0,a5
     d02:	c499                	beqz	s1,d10 <puts+0x6e>
     d04:	00007517          	auipc	a0,0x7
     d08:	30c50513          	addi	a0,a0,780 # 8010 <__stdout_FILE>
     d0c:	076020ef          	jal	ra,2d82 <__unlockfile>
     d10:	60e2                	ld	ra,24(sp)
     d12:	8522                	mv	a0,s0
     d14:	6442                	ld	s0,16(sp)
     d16:	64a2                	ld	s1,8(sp)
     d18:	6902                	ld	s2,0(sp)
     d1a:	6105                	addi	sp,sp,32
     d1c:	8082                	ret
     d1e:	45a9                	li	a1,10
     d20:	00007517          	auipc	a0,0x7
     d24:	2f050513          	addi	a0,a0,752 # 8010 <__stdout_FILE>
     d28:	0a2020ef          	jal	ra,2dca <__overflow>
     d2c:	01f5579b          	srliw	a5,a0,0x1f
     d30:	b7f9                	j	cfe <puts+0x5c>

0000000000000d32 <pop_arg>:
     d32:	35dd                	addiw	a1,a1,-9
     d34:	0005871b          	sext.w	a4,a1
     d38:	47c5                	li	a5,17
     d3a:	0ae7e263          	bltu	a5,a4,dde <pop_arg+0xac>
     d3e:	02059793          	slli	a5,a1,0x20
     d42:	01e7d593          	srli	a1,a5,0x1e
     d46:	00004797          	auipc	a5,0x4
     d4a:	5a678793          	addi	a5,a5,1446 # 52ec <__clzdi2+0x11a>
     d4e:	95be                	add	a1,a1,a5
     d50:	4198                	lw	a4,0(a1)
     d52:	1141                	addi	sp,sp,-16
     d54:	e022                	sd	s0,0(sp)
     d56:	973e                	add	a4,a4,a5
     d58:	e406                	sd	ra,8(sp)
     d5a:	621c                	ld	a5,0(a2)
     d5c:	842a                	mv	s0,a0
     d5e:	8702                	jr	a4
     d60:	00878713          	addi	a4,a5,8
     d64:	439c                	lw	a5,0(a5)
     d66:	e218                	sd	a4,0(a2)
     d68:	e01c                	sd	a5,0(s0)
     d6a:	60a2                	ld	ra,8(sp)
     d6c:	6402                	ld	s0,0(sp)
     d6e:	0141                	addi	sp,sp,16
     d70:	8082                	ret
     d72:	00878713          	addi	a4,a5,8
     d76:	e218                	sd	a4,0(a2)
     d78:	0007e783          	lwu	a5,0(a5)
     d7c:	b7f5                	j	d68 <pop_arg+0x36>
     d7e:	00878713          	addi	a4,a5,8
     d82:	e218                	sd	a4,0(a2)
     d84:	00079783          	lh	a5,0(a5)
     d88:	b7c5                	j	d68 <pop_arg+0x36>
     d8a:	00878713          	addi	a4,a5,8
     d8e:	e218                	sd	a4,0(a2)
     d90:	0007d783          	lhu	a5,0(a5)
     d94:	bfd1                	j	d68 <pop_arg+0x36>
     d96:	00878713          	addi	a4,a5,8
     d9a:	e218                	sd	a4,0(a2)
     d9c:	00078783          	lb	a5,0(a5)
     da0:	b7e1                	j	d68 <pop_arg+0x36>
     da2:	00878713          	addi	a4,a5,8
     da6:	e218                	sd	a4,0(a2)
     da8:	0007c783          	lbu	a5,0(a5)
     dac:	bf75                	j	d68 <pop_arg+0x36>
     dae:	00878713          	addi	a4,a5,8
     db2:	e218                	sd	a4,0(a2)
     db4:	639c                	ld	a5,0(a5)
     db6:	bf4d                	j	d68 <pop_arg+0x36>
     db8:	2388                	fld	fa0,0(a5)
     dba:	00878713          	addi	a4,a5,8
     dbe:	e218                	sd	a4,0(a2)
     dc0:	328040ef          	jal	ra,50e8 <__extenddftf2>
     dc4:	e008                	sd	a0,0(s0)
     dc6:	e40c                	sd	a1,8(s0)
     dc8:	b74d                	j	d6a <pop_arg+0x38>
     dca:	07bd                	addi	a5,a5,15
     dcc:	9bc1                	andi	a5,a5,-16
     dce:	01078713          	addi	a4,a5,16
     dd2:	e218                	sd	a4,0(a2)
     dd4:	6398                	ld	a4,0(a5)
     dd6:	679c                	ld	a5,8(a5)
     dd8:	e118                	sd	a4,0(a0)
     dda:	e51c                	sd	a5,8(a0)
     ddc:	b779                	j	d6a <pop_arg+0x38>
     dde:	8082                	ret

0000000000000de0 <fmt_u>:
     de0:	87aa                	mv	a5,a0
     de2:	46a9                	li	a3,10
     de4:	852e                	mv	a0,a1
     de6:	e391                	bnez	a5,dea <fmt_u+0xa>
     de8:	8082                	ret
     dea:	02d7f733          	remu	a4,a5,a3
     dee:	157d                	addi	a0,a0,-1
     df0:	0307071b          	addiw	a4,a4,48
     df4:	02d7d7b3          	divu	a5,a5,a3
     df8:	00e50023          	sb	a4,0(a0)
     dfc:	b7ed                	j	de6 <fmt_u+0x6>

0000000000000dfe <getint>:
     dfe:	0cccd637          	lui	a2,0xcccd
     e02:	800005b7          	lui	a1,0x80000
     e06:	86aa                	mv	a3,a0
     e08:	4325                	li	t1,9
     e0a:	4501                	li	a0,0
     e0c:	ccc60613          	addi	a2,a2,-820 # ccccccc <__BSS_END__+0xccc448c>
     e10:	5e59                	li	t3,-10
     e12:	fff5c593          	not	a1,a1
     e16:	6298                	ld	a4,0(a3)
     e18:	00074783          	lbu	a5,0(a4)
     e1c:	fd07881b          	addiw	a6,a5,-48
     e20:	87c2                	mv	a5,a6
     e22:	01037363          	bgeu	t1,a6,e28 <getint+0x2a>
     e26:	8082                	ret
     e28:	00a66e63          	bltu	a2,a0,e44 <getint+0x46>
     e2c:	02ae08bb          	mulw	a7,t3,a0
     e30:	557d                	li	a0,-1
     e32:	00b88ebb          	addw	t4,a7,a1
     e36:	010ec463          	blt	t4,a6,e3e <getint+0x40>
     e3a:	4117853b          	subw	a0,a5,a7
     e3e:	0705                	addi	a4,a4,1
     e40:	e298                	sd	a4,0(a3)
     e42:	bfd1                	j	e16 <getint+0x18>
     e44:	557d                	li	a0,-1
     e46:	bfe5                	j	e3e <getint+0x40>

0000000000000e48 <out>:
     e48:	87aa                	mv	a5,a0
     e4a:	4398                	lw	a4,0(a5)
     e4c:	852e                	mv	a0,a1
     e4e:	85b2                	mv	a1,a2
     e50:	02077713          	andi	a4,a4,32
     e54:	e701                	bnez	a4,e5c <out+0x14>
     e56:	863e                	mv	a2,a5
     e58:	0a20206f          	j	2efa <__fwritex>
     e5c:	8082                	ret

0000000000000e5e <pad>:
     e5e:	67c9                	lui	a5,0x12
     e60:	8f7d                	and	a4,a4,a5
     e62:	eb35                	bnez	a4,ed6 <pad+0x78>
     e64:	06c6d963          	bge	a3,a2,ed6 <pad+0x78>
     e68:	7169                	addi	sp,sp,-304
     e6a:	f222                	sd	s0,288(sp)
     e6c:	ee26                	sd	s1,280(sp)
     e6e:	ea4a                	sd	s2,272(sp)
     e70:	40d604bb          	subw	s1,a2,a3
     e74:	f606                	sd	ra,296(sp)
     e76:	e64e                	sd	s3,264(sp)
     e78:	e252                	sd	s4,256(sp)
     e7a:	10000793          	li	a5,256
     e7e:	892a                	mv	s2,a0
     e80:	8426                	mv	s0,s1
     e82:	0004861b          	sext.w	a2,s1
     e86:	0097d463          	bge	a5,s1,e8e <pad+0x30>
     e8a:	10000613          	li	a2,256
     e8e:	898a                	mv	s3,sp
     e90:	854e                	mv	a0,s3
     e92:	029010ef          	jal	ra,26ba <memset>
     e96:	0ff00a13          	li	s4,255
     e9a:	029a4563          	blt	s4,s1,ec4 <pad+0x66>
     e9e:	0084561b          	srliw	a2,s0,0x8
     ea2:	f0000793          	li	a5,-256
     ea6:	02f6063b          	mulw	a2,a2,a5
     eaa:	85ce                	mv	a1,s3
     eac:	854a                	mv	a0,s2
     eae:	9e21                	addw	a2,a2,s0
     eb0:	f99ff0ef          	jal	ra,e48 <out>
     eb4:	70b2                	ld	ra,296(sp)
     eb6:	7412                	ld	s0,288(sp)
     eb8:	64f2                	ld	s1,280(sp)
     eba:	6952                	ld	s2,272(sp)
     ebc:	69b2                	ld	s3,264(sp)
     ebe:	6a12                	ld	s4,256(sp)
     ec0:	6155                	addi	sp,sp,304
     ec2:	8082                	ret
     ec4:	10000613          	li	a2,256
     ec8:	85ce                	mv	a1,s3
     eca:	854a                	mv	a0,s2
     ecc:	f7dff0ef          	jal	ra,e48 <out>
     ed0:	f004849b          	addiw	s1,s1,-256
     ed4:	b7d9                	j	e9a <pad+0x3c>
     ed6:	8082                	ret

0000000000000ed8 <fmt_fp>:
     ed8:	7119                	addi	sp,sp,-128
     eda:	72f9                	lui	t0,0xffffe
     edc:	f8a2                	sd	s0,112(sp)
     ede:	2c028293          	addi	t0,t0,704 # ffffffffffffe2c0 <__BSS_END__+0xffffffffffff5a80>
     ee2:	843a                	mv	s0,a4
     ee4:	6709                	lui	a4,0x2
     ee6:	f4a6                	sd	s1,104(sp)
     ee8:	f0ca                	sd	s2,96(sp)
     eea:	ecce                	sd	s3,88(sp)
     eec:	e0da                	sd	s6,64(sp)
     eee:	f862                	sd	s8,48(sp)
     ef0:	f466                	sd	s9,40(sp)
     ef2:	fc86                	sd	ra,120(sp)
     ef4:	e8d2                	sd	s4,80(sp)
     ef6:	e4d6                	sd	s5,72(sp)
     ef8:	fc5e                	sd	s7,56(sp)
     efa:	f06a                	sd	s10,32(sp)
     efc:	ec6e                	sd	s11,24(sp)
     efe:	89be                	mv	s3,a5
     f00:	9116                	add	sp,sp,t0
     f02:	77f9                	lui	a5,0xffffe
     f04:	d1070713          	addi	a4,a4,-752 # 1d10 <printf_core+0x236>
     f08:	973e                	add	a4,a4,a5
     f0a:	009c                	addi	a5,sp,64
     f0c:	84aa                	mv	s1,a0
     f0e:	8cae                	mv	s9,a1
     f10:	97ba                	add	a5,a5,a4
     f12:	852e                	mv	a0,a1
     f14:	85b2                	mv	a1,a2
     f16:	8c32                	mv	s8,a2
     f18:	8936                	mv	s2,a3
     f1a:	8b42                	mv	s6,a6
     f1c:	2e07ae23          	sw	zero,764(a5) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
     f20:	4d1010ef          	jal	ra,2bf0 <__signbitl>
     f24:	c961                	beqz	a0,ff4 <fmt_fp+0x11c>
     f26:	57fd                	li	a5,-1
     f28:	17fe                	slli	a5,a5,0x3f
     f2a:	00fc4c33          	xor	s8,s8,a5
     f2e:	4a05                	li	s4,1
     f30:	00004a97          	auipc	s5,0x4
     f34:	408a8a93          	addi	s5,s5,1032 # 5338 <__clzdi2+0x166>
     f38:	8566                	mv	a0,s9
     f3a:	85e2                	mv	a1,s8
     f3c:	48b010ef          	jal	ra,2bc6 <__fpclassifyl>
     f40:	4785                	li	a5,1
     f42:	0ea7c363          	blt	a5,a0,1028 <fmt_fp+0x150>
     f46:	020b7b13          	andi	s6,s6,32
     f4a:	00004b97          	auipc	s7,0x4
     f4e:	406b8b93          	addi	s7,s7,1030 # 5350 <__clzdi2+0x17e>
     f52:	000b1663          	bnez	s6,f5e <fmt_fp+0x86>
     f56:	00004b97          	auipc	s7,0x4
     f5a:	402b8b93          	addi	s7,s7,1026 # 5358 <__clzdi2+0x186>
     f5e:	8666                	mv	a2,s9
     f60:	86e2                	mv	a3,s8
     f62:	8566                	mv	a0,s9
     f64:	85e2                	mv	a1,s8
     f66:	5ff020ef          	jal	ra,3d64 <__eqtf2>
     f6a:	c919                	beqz	a0,f80 <fmt_fp+0xa8>
     f6c:	00004b97          	auipc	s7,0x4
     f70:	3fcb8b93          	addi	s7,s7,1020 # 5368 <__clzdi2+0x196>
     f74:	000b1663          	bnez	s6,f80 <fmt_fp+0xa8>
     f78:	00004b97          	auipc	s7,0x4
     f7c:	3e8b8b93          	addi	s7,s7,1000 # 5360 <__clzdi2+0x18e>
     f80:	7741                	lui	a4,0xffff0
     f82:	003a0b1b          	addiw	s6,s4,3
     f86:	177d                	addi	a4,a4,-1
     f88:	00e9f733          	and	a4,s3,a4
     f8c:	86da                	mv	a3,s6
     f8e:	864a                	mv	a2,s2
     f90:	02000593          	li	a1,32
     f94:	8526                	mv	a0,s1
     f96:	ec9ff0ef          	jal	ra,e5e <pad>
     f9a:	8652                	mv	a2,s4
     f9c:	85d6                	mv	a1,s5
     f9e:	8526                	mv	a0,s1
     fa0:	ea9ff0ef          	jal	ra,e48 <out>
     fa4:	460d                	li	a2,3
     fa6:	85de                	mv	a1,s7
     fa8:	8526                	mv	a0,s1
     faa:	e9fff0ef          	jal	ra,e48 <out>
     fae:	6709                	lui	a4,0x2
     fb0:	00e9c733          	xor	a4,s3,a4
     fb4:	86da                	mv	a3,s6
     fb6:	864a                	mv	a2,s2
     fb8:	02000593          	li	a1,32
     fbc:	8526                	mv	a0,s1
     fbe:	845a                	mv	s0,s6
     fc0:	e9fff0ef          	jal	ra,e5e <pad>
     fc4:	012b5363          	bge	s6,s2,fca <fmt_fp+0xf2>
     fc8:	844a                	mv	s0,s2
     fca:	0004051b          	sext.w	a0,s0
     fce:	6289                	lui	t0,0x2
     fd0:	d4028293          	addi	t0,t0,-704 # 1d40 <printf_core+0x266>
     fd4:	9116                	add	sp,sp,t0
     fd6:	70e6                	ld	ra,120(sp)
     fd8:	7446                	ld	s0,112(sp)
     fda:	74a6                	ld	s1,104(sp)
     fdc:	7906                	ld	s2,96(sp)
     fde:	69e6                	ld	s3,88(sp)
     fe0:	6a46                	ld	s4,80(sp)
     fe2:	6aa6                	ld	s5,72(sp)
     fe4:	6b06                	ld	s6,64(sp)
     fe6:	7be2                	ld	s7,56(sp)
     fe8:	7c42                	ld	s8,48(sp)
     fea:	7ca2                	ld	s9,40(sp)
     fec:	7d02                	ld	s10,32(sp)
     fee:	6de2                	ld	s11,24(sp)
     ff0:	6109                	addi	sp,sp,128
     ff2:	8082                	ret
     ff4:	00b9d713          	srli	a4,s3,0xb
     ff8:	8b05                	andi	a4,a4,1
     ffa:	0009879b          	sext.w	a5,s3
     ffe:	eb09                	bnez	a4,1010 <fmt_fp+0x138>
    1000:	8b85                	andi	a5,a5,1
    1002:	ef89                	bnez	a5,101c <fmt_fp+0x144>
    1004:	8a2a                	mv	s4,a0
    1006:	00004a97          	auipc	s5,0x4
    100a:	333a8a93          	addi	s5,s5,819 # 5339 <__clzdi2+0x167>
    100e:	b72d                	j	f38 <fmt_fp+0x60>
    1010:	4a05                	li	s4,1
    1012:	00004a97          	auipc	s5,0x4
    1016:	329a8a93          	addi	s5,s5,809 # 533b <__clzdi2+0x169>
    101a:	bf39                	j	f38 <fmt_fp+0x60>
    101c:	4a05                	li	s4,1
    101e:	00004a97          	auipc	s5,0x4
    1022:	320a8a93          	addi	s5,s5,800 # 533e <__clzdi2+0x16c>
    1026:	bf09                	j	f38 <fmt_fp+0x60>
    1028:	7d79                	lui	s10,0xffffe
    102a:	6b89                	lui	s7,0x2
    102c:	2fcd0613          	addi	a2,s10,764 # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    1030:	d10b8793          	addi	a5,s7,-752 # 1d10 <printf_core+0x236>
    1034:	97b2                	add	a5,a5,a2
    1036:	0098                	addi	a4,sp,64
    1038:	00e78633          	add	a2,a5,a4
    103c:	8566                	mv	a0,s9
    103e:	85e2                	mv	a1,s8
    1040:	3b7010ef          	jal	ra,2bf6 <frexpl>
    1044:	862a                	mv	a2,a0
    1046:	86ae                	mv	a3,a1
    1048:	300020ef          	jal	ra,3348 <__addtf3>
    104c:	4601                	li	a2,0
    104e:	4681                	li	a3,0
    1050:	8caa                	mv	s9,a0
    1052:	8c2e                	mv	s8,a1
    1054:	e82a                	sd	a0,16(sp)
    1056:	e02e                	sd	a1,0(sp)
    1058:	50d020ef          	jal	ra,3d64 <__eqtf2>
    105c:	87e2                	mv	a5,s8
    105e:	8766                	mv	a4,s9
    1060:	cd01                	beqz	a0,1078 <fmt_fp+0x1a0>
    1062:	d10b8693          	addi	a3,s7,-752
    1066:	96ea                	add	a3,a3,s10
    1068:	0090                	addi	a2,sp,64
    106a:	00c68d33          	add	s10,a3,a2
    106e:	2fcd2683          	lw	a3,764(s10)
    1072:	36fd                	addiw	a3,a3,-1
    1074:	2edd2e23          	sw	a3,764(s10)
    1078:	020b6693          	ori	a3,s6,32
    107c:	e036                	sd	a3,0(sp)
    107e:	020b6613          	ori	a2,s6,32
    1082:	06100693          	li	a3,97
    1086:	2cd61263          	bne	a2,a3,134a <fmt_fp+0x472>
    108a:	020b7693          	andi	a3,s6,32
    108e:	e836                	sd	a3,16(sp)
    1090:	c291                	beqz	a3,1094 <fmt_fp+0x1bc>
    1092:	0aa5                	addi	s5,s5,9
    1094:	0004069b          	sext.w	a3,s0
    1098:	002a0d1b          	addiw	s10,s4,2
    109c:	e436                	sd	a3,8(sp)
    109e:	46e9                	li	a3,26
    10a0:	8a6a                	mv	s4,s10
    10a2:	00004d97          	auipc	s11,0x4
    10a6:	3eed8d93          	addi	s11,s11,1006 # 5490 <__clzdi2+0x2be>
    10aa:	0486e463          	bltu	a3,s0,10f2 <fmt_fp+0x21a>
    10ae:	000dbc83          	ld	s9,0(s11)
    10b2:	008dbc03          	ld	s8,8(s11)
    10b6:	4bed                	li	s7,27
    10b8:	408b8bbb          	subw	s7,s7,s0
    10bc:	587d                	li	a6,-1
    10be:	3bfd                	addiw	s7,s7,-1
    10c0:	190b9563          	bne	s7,a6,124a <fmt_fp+0x372>
    10c4:	000ac603          	lbu	a2,0(s5)
    10c8:	02d00693          	li	a3,45
    10cc:	18d61e63          	bne	a2,a3,1268 <fmt_fp+0x390>
    10d0:	1bfe                	slli	s7,s7,0x3f
    10d2:	8666                	mv	a2,s9
    10d4:	86e2                	mv	a3,s8
    10d6:	853a                	mv	a0,a4
    10d8:	0177c5b3          	xor	a1,a5,s7
    10dc:	448030ef          	jal	ra,4524 <__subtf3>
    10e0:	862a                	mv	a2,a0
    10e2:	86ae                	mv	a3,a1
    10e4:	8566                	mv	a0,s9
    10e6:	85e2                	mv	a1,s8
    10e8:	260020ef          	jal	ra,3348 <__addtf3>
    10ec:	8caa                	mv	s9,a0
    10ee:	0175cc33          	xor	s8,a1,s7
    10f2:	7bf9                	lui	s7,0xffffe
    10f4:	6689                	lui	a3,0x2
    10f6:	300b8793          	addi	a5,s7,768 # ffffffffffffe300 <__BSS_END__+0xffffffffffff5ac0>
    10fa:	d1068713          	addi	a4,a3,-752 # 1d10 <printf_core+0x236>
    10fe:	973e                	add	a4,a4,a5
    1100:	009c                	addi	a5,sp,64
    1102:	97ba                	add	a5,a5,a4
    1104:	00c78593          	addi	a1,a5,12
    1108:	ec3e                	sd	a5,24(sp)
    110a:	d1068793          	addi	a5,a3,-752
    110e:	97de                	add	a5,a5,s7
    1110:	0098                	addi	a4,sp,64
    1112:	00e78bb3          	add	s7,a5,a4
    1116:	2fcba703          	lw	a4,764(s7)
    111a:	e02e                	sd	a1,0(sp)
    111c:	41f7551b          	sraiw	a0,a4,0x1f
    1120:	8f29                	xor	a4,a4,a0
    1122:	40a7053b          	subw	a0,a4,a0
    1126:	cbbff0ef          	jal	ra,de0 <fmt_u>
    112a:	6582                	ld	a1,0(sp)
    112c:	67e2                	ld	a5,24(sp)
    112e:	00b51863          	bne	a0,a1,113e <fmt_fp+0x266>
    1132:	03000713          	li	a4,48
    1136:	30eb85a3          	sb	a4,779(s7)
    113a:	00b78513          	addi	a0,a5,11
    113e:	6709                	lui	a4,0x2
    1140:	77f9                	lui	a5,0xffffe
    1142:	d1070713          	addi	a4,a4,-752 # 1d10 <printf_core+0x236>
    1146:	973e                	add	a4,a4,a5
    1148:	009c                	addi	a5,sp,64
    114a:	97ba                	add	a5,a5,a4
    114c:	2fc7a703          	lw	a4,764(a5) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    1150:	02d00793          	li	a5,45
    1154:	00074463          	bltz	a4,115c <fmt_fp+0x284>
    1158:	02b00793          	li	a5,43
    115c:	fef50fa3          	sb	a5,-1(a0)
    1160:	ffe50793          	addi	a5,a0,-2
    1164:	e03e                	sd	a5,0(sp)
    1166:	6709                	lui	a4,0x2
    1168:	77f9                	lui	a5,0xffffe
    116a:	31078793          	addi	a5,a5,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    116e:	d1070713          	addi	a4,a4,-752 # 1d10 <printf_core+0x236>
    1172:	973e                	add	a4,a4,a5
    1174:	009c                	addi	a5,sp,64
    1176:	00f70bb3          	add	s7,a4,a5
    117a:	000db783          	ld	a5,0(s11)
    117e:	2b3d                	addiw	s6,s6,15
    1180:	ff650f23          	sb	s6,-2(a0)
    1184:	f03e                	sd	a5,32(sp)
    1186:	008db783          	ld	a5,8(s11)
    118a:	ec5e                	sd	s7,24(sp)
    118c:	0089fd93          	andi	s11,s3,8
    1190:	f43e                	sd	a5,40(sp)
    1192:	85e2                	mv	a1,s8
    1194:	8566                	mv	a0,s9
    1196:	58d030ef          	jal	ra,4f22 <__fixtfsi>
    119a:	2501                	sext.w	a0,a0
    119c:	00004797          	auipc	a5,0x4
    11a0:	54478793          	addi	a5,a5,1348 # 56e0 <xdigits>
    11a4:	00a78733          	add	a4,a5,a0
    11a8:	00074703          	lbu	a4,0(a4)
    11ac:	67c2                	ld	a5,16(sp)
    11ae:	001b8b13          	addi	s6,s7,1
    11b2:	8f5d                	or	a4,a4,a5
    11b4:	00eb8023          	sb	a4,0(s7)
    11b8:	681030ef          	jal	ra,5038 <__floatsitf>
    11bc:	862a                	mv	a2,a0
    11be:	86ae                	mv	a3,a1
    11c0:	8566                	mv	a0,s9
    11c2:	85e2                	mv	a1,s8
    11c4:	360030ef          	jal	ra,4524 <__subtf3>
    11c8:	76a2                	ld	a3,40(sp)
    11ca:	7602                	ld	a2,32(sp)
    11cc:	427020ef          	jal	ra,3df2 <__multf3>
    11d0:	67e2                	ld	a5,24(sp)
    11d2:	882a                	mv	a6,a0
    11d4:	872e                	mv	a4,a1
    11d6:	40fb06b3          	sub	a3,s6,a5
    11da:	4785                	li	a5,1
    11dc:	8caa                	mv	s9,a0
    11de:	8c2e                	mv	s8,a1
    11e0:	02f69563          	bne	a3,a5,120a <fmt_fp+0x332>
    11e4:	4601                	li	a2,0
    11e6:	4681                	li	a3,0
    11e8:	fc2e                	sd	a1,56(sp)
    11ea:	f82a                	sd	a0,48(sp)
    11ec:	379020ef          	jal	ra,3d64 <__eqtf2>
    11f0:	8866                	mv	a6,s9
    11f2:	8762                	mv	a4,s8
    11f4:	e509                	bnez	a0,11fe <fmt_fp+0x326>
    11f6:	00804463          	bgtz	s0,11fe <fmt_fp+0x326>
    11fa:	000d8f63          	beqz	s11,1218 <fmt_fp+0x340>
    11fe:	02e00793          	li	a5,46
    1202:	002b8b13          	addi	s6,s7,2
    1206:	00fb80a3          	sb	a5,1(s7)
    120a:	4601                	li	a2,0
    120c:	4681                	li	a3,0
    120e:	8542                	mv	a0,a6
    1210:	85ba                	mv	a1,a4
    1212:	353020ef          	jal	ra,3d64 <__eqtf2>
    1216:	e535                	bnez	a0,1282 <fmt_fp+0x3aa>
    1218:	6789                	lui	a5,0x2
    121a:	7779                	lui	a4,0xffffe
    121c:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1220:	97ba                	add	a5,a5,a4
    1222:	0094                	addi	a3,sp,64
    1224:	00d78c33          	add	s8,a5,a3
    1228:	6782                	ld	a5,0(sp)
    122a:	30cc0c13          	addi	s8,s8,780
    122e:	40fc0c33          	sub	s8,s8,a5
    1232:	800007b7          	lui	a5,0x80000
    1236:	ffd7c793          	xori	a5,a5,-3
    123a:	418787b3          	sub	a5,a5,s8
    123e:	41a787b3          	sub	a5,a5,s10
    1242:	0487d263          	bge	a5,s0,1286 <fmt_fp+0x3ae>
    1246:	557d                	li	a0,-1
    1248:	b359                	j	fce <fmt_fp+0xf6>
    124a:	000db603          	ld	a2,0(s11)
    124e:	008db683          	ld	a3,8(s11)
    1252:	8566                	mv	a0,s9
    1254:	85e2                	mv	a1,s8
    1256:	ec3e                	sd	a5,24(sp)
    1258:	e03a                	sd	a4,0(sp)
    125a:	399020ef          	jal	ra,3df2 <__multf3>
    125e:	67e2                	ld	a5,24(sp)
    1260:	6702                	ld	a4,0(sp)
    1262:	8caa                	mv	s9,a0
    1264:	8c2e                	mv	s8,a1
    1266:	bd99                	j	10bc <fmt_fp+0x1e4>
    1268:	863a                	mv	a2,a4
    126a:	86be                	mv	a3,a5
    126c:	8566                	mv	a0,s9
    126e:	85e2                	mv	a1,s8
    1270:	0d8020ef          	jal	ra,3348 <__addtf3>
    1274:	8666                	mv	a2,s9
    1276:	86e2                	mv	a3,s8
    1278:	2ac030ef          	jal	ra,4524 <__subtf3>
    127c:	8caa                	mv	s9,a0
    127e:	8c2e                	mv	s8,a1
    1280:	bd8d                	j	10f2 <fmt_fp+0x21a>
    1282:	8bda                	mv	s7,s6
    1284:	b739                	j	1192 <fmt_fp+0x2ba>
    1286:	6789                	lui	a5,0x2
    1288:	31070713          	addi	a4,a4,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    128c:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1290:	97ba                	add	a5,a5,a4
    1292:	0098                	addi	a4,sp,64
    1294:	973e                	add	a4,a4,a5
    1296:	40eb0b33          	sub	s6,s6,a4
    129a:	000c079b          	sext.w	a5,s8
    129e:	016c0dbb          	addw	s11,s8,s6
    12a2:	c04d                	beqz	s0,1344 <fmt_fp+0x46c>
    12a4:	fffb0713          	addi	a4,s6,-1
    12a8:	08e44e63          	blt	s0,a4,1344 <fmt_fp+0x46c>
    12ac:	6722                	ld	a4,8(sp)
    12ae:	0027041b          	addiw	s0,a4,2
    12b2:	9c3d                	addw	s0,s0,a5
    12b4:	01440cbb          	addw	s9,s0,s4
    12b8:	874e                	mv	a4,s3
    12ba:	86e6                	mv	a3,s9
    12bc:	864a                	mv	a2,s2
    12be:	02000593          	li	a1,32
    12c2:	8526                	mv	a0,s1
    12c4:	b9bff0ef          	jal	ra,e5e <pad>
    12c8:	85d6                	mv	a1,s5
    12ca:	866a                	mv	a2,s10
    12cc:	8526                	mv	a0,s1
    12ce:	b7bff0ef          	jal	ra,e48 <out>
    12d2:	6741                	lui	a4,0x10
    12d4:	86e6                	mv	a3,s9
    12d6:	00e9c733          	xor	a4,s3,a4
    12da:	864a                	mv	a2,s2
    12dc:	03000593          	li	a1,48
    12e0:	8526                	mv	a0,s1
    12e2:	b7dff0ef          	jal	ra,e5e <pad>
    12e6:	75f9                	lui	a1,0xffffe
    12e8:	6789                	lui	a5,0x2
    12ea:	31058593          	addi	a1,a1,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    12ee:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    12f2:	97ae                	add	a5,a5,a1
    12f4:	0098                	addi	a4,sp,64
    12f6:	00e785b3          	add	a1,a5,a4
    12fa:	865a                	mv	a2,s6
    12fc:	8526                	mv	a0,s1
    12fe:	b4bff0ef          	jal	ra,e48 <out>
    1302:	4701                	li	a4,0
    1304:	4681                	li	a3,0
    1306:	41b4063b          	subw	a2,s0,s11
    130a:	03000593          	li	a1,48
    130e:	8526                	mv	a0,s1
    1310:	b4fff0ef          	jal	ra,e5e <pad>
    1314:	6582                	ld	a1,0(sp)
    1316:	8662                	mv	a2,s8
    1318:	8526                	mv	a0,s1
    131a:	b2fff0ef          	jal	ra,e48 <out>
    131e:	00098a9b          	sext.w	s5,s3
    1322:	6709                	lui	a4,0x2
    1324:	00eac733          	xor	a4,s5,a4
    1328:	86e6                	mv	a3,s9
    132a:	864a                	mv	a2,s2
    132c:	02000593          	li	a1,32
    1330:	8526                	mv	a0,s1
    1332:	8a66                	mv	s4,s9
    1334:	b2bff0ef          	jal	ra,e5e <pad>
    1338:	012cd363          	bge	s9,s2,133e <fmt_fp+0x466>
    133c:	8a4a                	mv	s4,s2
    133e:	000a051b          	sext.w	a0,s4
    1342:	b171                	j	fce <fmt_fp+0xf6>
    1344:	000d841b          	sext.w	s0,s11
    1348:	b7b5                	j	12b4 <fmt_fp+0x3dc>
    134a:	00045363          	bgez	s0,1350 <fmt_fp+0x478>
    134e:	4419                	li	s0,6
    1350:	4601                	li	a2,0
    1352:	4681                	li	a3,0
    1354:	853a                	mv	a0,a4
    1356:	85be                	mv	a1,a5
    1358:	ec3a                	sd	a4,24(sp)
    135a:	e83e                	sd	a5,16(sp)
    135c:	209020ef          	jal	ra,3d64 <__eqtf2>
    1360:	c91d                	beqz	a0,1396 <fmt_fp+0x4be>
    1362:	6762                	ld	a4,24(sp)
    1364:	67c2                	ld	a5,16(sp)
    1366:	00004697          	auipc	a3,0x4
    136a:	18a68693          	addi	a3,a3,394 # 54f0 <__clzdi2+0x31e>
    136e:	6290                	ld	a2,0(a3)
    1370:	6694                	ld	a3,8(a3)
    1372:	853a                	mv	a0,a4
    1374:	85be                	mv	a1,a5
    1376:	27d020ef          	jal	ra,3df2 <__multf3>
    137a:	6709                	lui	a4,0x2
    137c:	77f9                	lui	a5,0xffffe
    137e:	d1070713          	addi	a4,a4,-752 # 1d10 <printf_core+0x236>
    1382:	973e                	add	a4,a4,a5
    1384:	009c                	addi	a5,sp,64
    1386:	97ba                	add	a5,a5,a4
    1388:	2fc7a703          	lw	a4,764(a5) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    138c:	8caa                	mv	s9,a0
    138e:	8c2e                	mv	s8,a1
    1390:	3711                	addiw	a4,a4,-28
    1392:	2ee7ae23          	sw	a4,764(a5)
    1396:	6689                	lui	a3,0x2
    1398:	d1068713          	addi	a4,a3,-752 # 1d10 <printf_core+0x236>
    139c:	77f9                	lui	a5,0xffffe
    139e:	973e                	add	a4,a4,a5
    13a0:	0090                	addi	a2,sp,64
    13a2:	9732                	add	a4,a4,a2
    13a4:	2fc72303          	lw	t1,764(a4)
    13a8:	8736                	mv	a4,a3
    13aa:	b8868693          	addi	a3,a3,-1144
    13ae:	002688b3          	add	a7,a3,sp
    13b2:	00035963          	bgez	t1,13c4 <fmt_fp+0x4ec>
    13b6:	33878793          	addi	a5,a5,824 # ffffffffffffe338 <__BSS_END__+0xffffffffffff5af8>
    13ba:	d1070713          	addi	a4,a4,-752
    13be:	973e                	add	a4,a4,a5
    13c0:	00c708b3          	add	a7,a4,a2
    13c4:	00004717          	auipc	a4,0x4
    13c8:	13c70713          	addi	a4,a4,316 # 5500 <__clzdi2+0x32e>
    13cc:	00073d83          	ld	s11,0(a4)
    13d0:	00873b83          	ld	s7,8(a4)
    13d4:	8d46                	mv	s10,a7
    13d6:	85e2                	mv	a1,s8
    13d8:	8566                	mv	a0,s9
    13da:	ec46                	sd	a7,24(sp)
    13dc:	e81a                	sd	t1,16(sp)
    13de:	3e3030ef          	jal	ra,4fc0 <__fixunstfsi>
    13e2:	00ad2023          	sw	a0,0(s10)
    13e6:	2501                	sext.w	a0,a0
    13e8:	4b3030ef          	jal	ra,509a <__floatunsitf>
    13ec:	862a                	mv	a2,a0
    13ee:	86ae                	mv	a3,a1
    13f0:	8566                	mv	a0,s9
    13f2:	85e2                	mv	a1,s8
    13f4:	130030ef          	jal	ra,4524 <__subtf3>
    13f8:	866e                	mv	a2,s11
    13fa:	86de                	mv	a3,s7
    13fc:	1f7020ef          	jal	ra,3df2 <__multf3>
    1400:	4601                	li	a2,0
    1402:	4681                	li	a3,0
    1404:	8caa                	mv	s9,a0
    1406:	8c2e                	mv	s8,a1
    1408:	15d020ef          	jal	ra,3d64 <__eqtf2>
    140c:	6342                	ld	t1,16(sp)
    140e:	68e2                	ld	a7,24(sp)
    1410:	0d11                	addi	s10,s10,4
    1412:	f171                	bnez	a0,13d6 <fmt_fp+0x4fe>
    1414:	3b9ad537          	lui	a0,0x3b9ad
    1418:	8bc6                	mv	s7,a7
    141a:	4701                	li	a4,0
    141c:	4e75                	li	t3,29
    141e:	a0050513          	addi	a0,a0,-1536 # 3b9aca00 <__BSS_END__+0x3b9a41c0>
    1422:	14604263          	bgtz	t1,1566 <fmt_fp+0x68e>
    1426:	cb11                	beqz	a4,143a <fmt_fp+0x562>
    1428:	6789                	lui	a5,0x2
    142a:	7779                	lui	a4,0xffffe
    142c:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1430:	97ba                	add	a5,a5,a4
    1432:	0098                	addi	a4,sp,64
    1434:	973e                	add	a4,a4,a5
    1436:	2e672e23          	sw	t1,764(a4) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    143a:	46a5                	li	a3,9
    143c:	02d4071b          	addiw	a4,s0,45
    1440:	02d7573b          	divuw	a4,a4,a3
    1444:	6789                	lui	a5,0x2
    1446:	76f9                	lui	a3,0xffffe
    1448:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    144c:	97b6                	add	a5,a5,a3
    144e:	0094                	addi	a3,sp,64
    1450:	96be                	add	a3,a3,a5
    1452:	3b9ade37          	lui	t3,0x3b9ad
    1456:	2fc6a603          	lw	a2,764(a3) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    145a:	5f5d                	li	t5,-9
    145c:	4681                	li	a3,0
    145e:	4f85                	li	t6,1
    1460:	a00e0e1b          	addiw	t3,t3,-1536
    1464:	06600293          	li	t0,102
    1468:	2705                	addiw	a4,a4,1
    146a:	1702                	slli	a4,a4,0x20
    146c:	9301                	srli	a4,a4,0x20
    146e:	00271e93          	slli	t4,a4,0x2
    1472:	14064363          	bltz	a2,15b8 <fmt_fp+0x6e0>
    1476:	ca91                	beqz	a3,148a <fmt_fp+0x5b2>
    1478:	6789                	lui	a5,0x2
    147a:	7779                	lui	a4,0xffffe
    147c:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1480:	97ba                	add	a5,a5,a4
    1482:	0098                	addi	a4,sp,64
    1484:	973e                	add	a4,a4,a5
    1486:	2ec72e23          	sw	a2,764(a4) # ffffffffffffe2fc <__BSS_END__+0xffffffffffff5abc>
    148a:	4301                	li	t1,0
    148c:	01abfe63          	bgeu	s7,s10,14a8 <fmt_fp+0x5d0>
    1490:	41788733          	sub	a4,a7,s7
    1494:	000ba683          	lw	a3,0(s7)
    1498:	8709                	srai	a4,a4,0x2
    149a:	4325                	li	t1,9
    149c:	02e3033b          	mulw	t1,t1,a4
    14a0:	4629                	li	a2,10
    14a2:	4729                	li	a4,10
    14a4:	16e6fc63          	bgeu	a3,a4,161c <fmt_fp+0x744>
    14a8:	6782                	ld	a5,0(sp)
    14aa:	06700613          	li	a2,103
    14ae:	4701                	li	a4,0
    14b0:	f9a78693          	addi	a3,a5,-102
    14b4:	00d036b3          	snez	a3,a3
    14b8:	026686bb          	mulw	a3,a3,t1
    14bc:	40d406bb          	subw	a3,s0,a3
    14c0:	00c79463          	bne	a5,a2,14c8 <fmt_fp+0x5f0>
    14c4:	00803733          	snez	a4,s0
    14c8:	40e6863b          	subw	a2,a3,a4
    14cc:	411d0733          	sub	a4,s10,a7
    14d0:	8709                	srai	a4,a4,0x2
    14d2:	177d                	addi	a4,a4,-1
    14d4:	45a5                	li	a1,9
    14d6:	02b70733          	mul	a4,a4,a1
    14da:	1ae65b63          	bge	a2,a4,1690 <fmt_fp+0x7b8>
    14de:	00024737          	lui	a4,0x24
    14e2:	9f31                	addw	a4,a4,a2
    14e4:	4625                	li	a2,9
    14e6:	02c74c3b          	divw	s8,a4,a2
    14ea:	76c1                	lui	a3,0xffff0
    14ec:	0691                	addi	a3,a3,4
    14ee:	45a9                	li	a1,10
    14f0:	02c7673b          	remw	a4,a4,a2
    14f4:	0c0a                	slli	s8,s8,0x2
    14f6:	9c36                	add	s8,s8,a3
    14f8:	9c46                	add	s8,s8,a7
    14fa:	46a9                	li	a3,10
    14fc:	4625                	li	a2,9
    14fe:	2705                	addiw	a4,a4,1
    1500:	12c71263          	bne	a4,a2,1624 <fmt_fp+0x74c>
    1504:	000c2d83          	lw	s11,0(s8)
    1508:	00068e1b          	sext.w	t3,a3
    150c:	02ddf63b          	remuw	a2,s11,a3
    1510:	8532                	mv	a0,a2
    1512:	e609                	bnez	a2,151c <fmt_fp+0x644>
    1514:	004c0713          	addi	a4,s8,4
    1518:	16ed0863          	beq	s10,a4,1688 <fmt_fp+0x7b0>
    151c:	03cdd73b          	divuw	a4,s11,t3
    1520:	8b05                	andi	a4,a4,1
    1522:	ef09                	bnez	a4,153c <fmt_fp+0x664>
    1524:	3b9ad737          	lui	a4,0x3b9ad
    1528:	a0070713          	addi	a4,a4,-1536 # 3b9aca00 <__BSS_END__+0x3b9a41c0>
    152c:	10e69063          	bne	a3,a4,162c <fmt_fp+0x754>
    1530:	0f8bfe63          	bgeu	s7,s8,162c <fmt_fp+0x754>
    1534:	ffcc2703          	lw	a4,-4(s8)
    1538:	8b05                	andi	a4,a4,1
    153a:	cb6d                	beqz	a4,162c <fmt_fp+0x754>
    153c:	00004597          	auipc	a1,0x4
    1540:	f6458593          	addi	a1,a1,-156 # 54a0 <__clzdi2+0x2ce>
    1544:	8685                	srai	a3,a3,0x1
    1546:	6198                	ld	a4,0(a1)
    1548:	0085bc83          	ld	s9,8(a1)
    154c:	0ed66563          	bltu	a2,a3,1636 <fmt_fp+0x75e>
    1550:	00c69663          	bne	a3,a2,155c <fmt_fp+0x684>
    1554:	004c0693          	addi	a3,s8,4
    1558:	2add0f63          	beq	s10,a3,1816 <fmt_fp+0x93e>
    155c:	00004697          	auipc	a3,0x4
    1560:	f8468693          	addi	a3,a3,-124 # 54e0 <__clzdi2+0x30e>
    1564:	a8e9                	j	163e <fmt_fp+0x766>
    1566:	0003061b          	sext.w	a2,t1
    156a:	006e5363          	bge	t3,t1,1570 <fmt_fp+0x698>
    156e:	4675                	li	a2,29
    1570:	ffcd0593          	addi	a1,s10,-4
    1574:	4681                	li	a3,0
    1576:	0175ff63          	bgeu	a1,s7,1594 <fmt_fp+0x6bc>
    157a:	c681                	beqz	a3,1582 <fmt_fp+0x6aa>
    157c:	fedbae23          	sw	a3,-4(s7)
    1580:	1bf1                	addi	s7,s7,-4
    1582:	01abf563          	bgeu	s7,s10,158c <fmt_fp+0x6b4>
    1586:	ffcd2703          	lw	a4,-4(s10)
    158a:	c70d                	beqz	a4,15b4 <fmt_fp+0x6dc>
    158c:	40c3033b          	subw	t1,t1,a2
    1590:	4705                	li	a4,1
    1592:	bd41                	j	1422 <fmt_fp+0x54a>
    1594:	0005e703          	lwu	a4,0(a1)
    1598:	1682                	slli	a3,a3,0x20
    159a:	9281                	srli	a3,a3,0x20
    159c:	00c71733          	sll	a4,a4,a2
    15a0:	9736                	add	a4,a4,a3
    15a2:	02a776b3          	remu	a3,a4,a0
    15a6:	15f1                	addi	a1,a1,-4
    15a8:	02a75733          	divu	a4,a4,a0
    15ac:	c1d4                	sw	a3,4(a1)
    15ae:	0007069b          	sext.w	a3,a4
    15b2:	b7d1                	j	1576 <fmt_fp+0x69e>
    15b4:	1d71                	addi	s10,s10,-4
    15b6:	b7f1                	j	1582 <fmt_fp+0x6aa>
    15b8:	45a5                	li	a1,9
    15ba:	01e64463          	blt	a2,t5,15c2 <fmt_fp+0x6ea>
    15be:	40c005bb          	negw	a1,a2
    15c2:	00bf93bb          	sllw	t2,t6,a1
    15c6:	33fd                	addiw	t2,t2,-1
    15c8:	40be5c3b          	sraw	s8,t3,a1
    15cc:	86de                	mv	a3,s7
    15ce:	4501                	li	a0,0
    15d0:	03a6e963          	bltu	a3,s10,1602 <fmt_fp+0x72a>
    15d4:	000ba683          	lw	a3,0(s7)
    15d8:	e291                	bnez	a3,15dc <fmt_fp+0x704>
    15da:	0b91                	addi	s7,s7,4
    15dc:	c501                	beqz	a0,15e4 <fmt_fp+0x70c>
    15de:	00ad2023          	sw	a0,0(s10)
    15e2:	0d11                	addi	s10,s10,4
    15e4:	6782                	ld	a5,0(sp)
    15e6:	86c6                	mv	a3,a7
    15e8:	00578363          	beq	a5,t0,15ee <fmt_fp+0x716>
    15ec:	86de                	mv	a3,s7
    15ee:	40dd0533          	sub	a0,s10,a3
    15f2:	8509                	srai	a0,a0,0x2
    15f4:	00a75463          	bge	a4,a0,15fc <fmt_fp+0x724>
    15f8:	01d68d33          	add	s10,a3,t4
    15fc:	9e2d                	addw	a2,a2,a1
    15fe:	4685                	li	a3,1
    1600:	bd8d                	j	1472 <fmt_fp+0x59a>
    1602:	0006a303          	lw	t1,0(a3)
    1606:	00b35cbb          	srlw	s9,t1,a1
    160a:	00ac853b          	addw	a0,s9,a0
    160e:	00737333          	and	t1,t1,t2
    1612:	c288                	sw	a0,0(a3)
    1614:	0383053b          	mulw	a0,t1,s8
    1618:	0691                	addi	a3,a3,4
    161a:	bf5d                	j	15d0 <fmt_fp+0x6f8>
    161c:	02e6073b          	mulw	a4,a2,a4
    1620:	2305                	addiw	t1,t1,1
    1622:	b549                	j	14a4 <fmt_fp+0x5cc>
    1624:	02d586bb          	mulw	a3,a1,a3
    1628:	2705                	addiw	a4,a4,1
    162a:	bdd9                	j	1500 <fmt_fp+0x628>
    162c:	00004597          	auipc	a1,0x4
    1630:	e8458593          	addi	a1,a1,-380 # 54b0 <__clzdi2+0x2de>
    1634:	bf01                	j	1544 <fmt_fp+0x66c>
    1636:	00004697          	auipc	a3,0x4
    163a:	e8a68693          	addi	a3,a3,-374 # 54c0 <__clzdi2+0x2ee>
    163e:	6290                	ld	a2,0(a3)
    1640:	6694                	ld	a3,8(a3)
    1642:	000a0d63          	beqz	s4,165c <fmt_fp+0x784>
    1646:	000ace83          	lbu	t4,0(s5)
    164a:	02d00593          	li	a1,45
    164e:	00be9763          	bne	t4,a1,165c <fmt_fp+0x784>
    1652:	55fd                	li	a1,-1
    1654:	15fe                	slli	a1,a1,0x3f
    1656:	00bcccb3          	xor	s9,s9,a1
    165a:	8ead                	xor	a3,a3,a1
    165c:	40ad8dbb          	subw	s11,s11,a0
    1660:	85e6                	mv	a1,s9
    1662:	853a                	mv	a0,a4
    1664:	f446                	sd	a7,40(sp)
    1666:	ec72                	sd	t3,24(sp)
    1668:	f01a                	sd	t1,32(sp)
    166a:	e83a                	sd	a4,16(sp)
    166c:	4dd010ef          	jal	ra,3348 <__addtf3>
    1670:	6742                	ld	a4,16(sp)
    1672:	86e6                	mv	a3,s9
    1674:	863a                	mv	a2,a4
    1676:	6ee020ef          	jal	ra,3d64 <__eqtf2>
    167a:	6e62                	ld	t3,24(sp)
    167c:	78a2                	ld	a7,40(sp)
    167e:	1a051163          	bnez	a0,1820 <fmt_fp+0x948>
    1682:	7302                	ld	t1,32(sp)
    1684:	01bc2023          	sw	s11,0(s8)
    1688:	0c11                	addi	s8,s8,4
    168a:	01ac7363          	bgeu	s8,s10,1690 <fmt_fp+0x7b8>
    168e:	8d62                	mv	s10,s8
    1690:	01abf663          	bgeu	s7,s10,169c <fmt_fp+0x7c4>
    1694:	ffcd2703          	lw	a4,-4(s10)
    1698:	1c070e63          	beqz	a4,1874 <fmt_fp+0x99c>
    169c:	6782                	ld	a5,0(sp)
    169e:	06700713          	li	a4,103
    16a2:	04e79d63          	bne	a5,a4,16fc <fmt_fp+0x824>
    16a6:	e011                	bnez	s0,16aa <fmt_fp+0x7d2>
    16a8:	4405                	li	s0,1
    16aa:	1c835763          	bge	t1,s0,1878 <fmt_fp+0x9a0>
    16ae:	5771                	li	a4,-4
    16b0:	1ce34463          	blt	t1,a4,1878 <fmt_fp+0x9a0>
    16b4:	0013071b          	addiw	a4,t1,1
    16b8:	3b7d                	addiw	s6,s6,-1
    16ba:	9c19                	subw	s0,s0,a4
    16bc:	0089f713          	andi	a4,s3,8
    16c0:	ef15                	bnez	a4,16fc <fmt_fp+0x824>
    16c2:	46a5                	li	a3,9
    16c4:	01abf663          	bgeu	s7,s10,16d0 <fmt_fp+0x7f8>
    16c8:	ffcd2603          	lw	a2,-4(s10)
    16cc:	1c061063          	bnez	a2,188c <fmt_fp+0x9b4>
    16d0:	411d0733          	sub	a4,s10,a7
    16d4:	8709                	srai	a4,a4,0x2
    16d6:	4625                	li	a2,9
    16d8:	177d                	addi	a4,a4,-1
    16da:	02c70733          	mul	a4,a4,a2
    16de:	06600593          	li	a1,102
    16e2:	020b6613          	ori	a2,s6,32
    16e6:	1ab61763          	bne	a2,a1,1894 <fmt_fp+0x9bc>
    16ea:	8f15                	sub	a4,a4,a3
    16ec:	00075363          	bgez	a4,16f2 <fmt_fp+0x81a>
    16f0:	4701                	li	a4,0
    16f2:	00e45363          	bge	s0,a4,16f8 <fmt_fp+0x820>
    16f6:	8722                	mv	a4,s0
    16f8:	0007041b          	sext.w	s0,a4
    16fc:	80000737          	lui	a4,0x80000
    1700:	ffd74713          	xori	a4,a4,-3
    1704:	b48741e3          	blt	a4,s0,1246 <fmt_fp+0x36e>
    1708:	0089fc93          	andi	s9,s3,8
    170c:	01946c33          	or	s8,s0,s9
    1710:	0009879b          	sext.w	a5,s3
    1714:	018036b3          	snez	a3,s8
    1718:	0014071b          	addiw	a4,s0,1
    171c:	80000637          	lui	a2,0x80000
    1720:	9f35                	addw	a4,a4,a3
    1722:	fff64613          	not	a2,a2
    1726:	e03e                	sd	a5,0(sp)
    1728:	020b6d93          	ori	s11,s6,32
    172c:	06600593          	li	a1,102
    1730:	9e19                	subw	a2,a2,a4
    1732:	16bd9363          	bne	s11,a1,1898 <fmt_fp+0x9c0>
    1736:	b06648e3          	blt	a2,t1,1246 <fmt_fp+0x36e>
    173a:	00605463          	blez	t1,1742 <fmt_fp+0x86a>
    173e:	0067073b          	addw	a4,a4,t1
    1742:	800006b7          	lui	a3,0x80000
    1746:	1c0a1b63          	bnez	s4,191c <fmt_fp+0xa44>
    174a:	fff6c693          	not	a3,a3
    174e:	ec46                	sd	a7,24(sp)
    1750:	2681                	sext.w	a3,a3
    1752:	aee6cae3          	blt	a3,a4,1246 <fmt_fp+0x36e>
    1756:	01470b3b          	addw	s6,a4,s4
    175a:	86da                	mv	a3,s6
    175c:	874e                	mv	a4,s3
    175e:	864a                	mv	a2,s2
    1760:	02000593          	li	a1,32
    1764:	8526                	mv	a0,s1
    1766:	c85a                	sw	s6,16(sp)
    1768:	ef6ff0ef          	jal	ra,e5e <pad>
    176c:	8652                	mv	a2,s4
    176e:	85d6                	mv	a1,s5
    1770:	8526                	mv	a0,s1
    1772:	ed6ff0ef          	jal	ra,e48 <out>
    1776:	6782                	ld	a5,0(sp)
    1778:	6741                	lui	a4,0x10
    177a:	86da                	mv	a3,s6
    177c:	8f3d                	xor	a4,a4,a5
    177e:	864a                	mv	a2,s2
    1780:	03000593          	li	a1,48
    1784:	8526                	mv	a0,s1
    1786:	ed8ff0ef          	jal	ra,e5e <pad>
    178a:	06600713          	li	a4,102
    178e:	68e2                	ld	a7,24(sp)
    1790:	24ed9b63          	bne	s11,a4,19e6 <fmt_fp+0xb0e>
    1794:	89c6                	mv	s3,a7
    1796:	011bf363          	bgeu	s7,a7,179c <fmt_fp+0x8c4>
    179a:	89de                	mv	s3,s7
    179c:	7a79                	lui	s4,0xffffe
    179e:	6709                	lui	a4,0x2
    17a0:	310a0b93          	addi	s7,s4,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    17a4:	d1070793          	addi	a5,a4,-752 # 1d10 <printf_core+0x236>
    17a8:	97de                	add	a5,a5,s7
    17aa:	0094                	addi	a3,sp,64
    17ac:	00d78bb3          	add	s7,a5,a3
    17b0:	d1070793          	addi	a5,a4,-752
    17b4:	97d2                	add	a5,a5,s4
    17b6:	8cce                	mv	s9,s3
    17b8:	009b8d93          	addi	s11,s7,9
    17bc:	03000a93          	li	s5,48
    17c0:	00d78a33          	add	s4,a5,a3
    17c4:	1598ff63          	bgeu	a7,s9,1922 <fmt_fp+0xa4a>
    17c8:	00188693          	addi	a3,a7,1
    17cc:	ffd98713          	addi	a4,s3,-3
    17d0:	4601                	li	a2,0
    17d2:	00e6e763          	bltu	a3,a4,17e0 <fmt_fp+0x908>
    17d6:	0891                	addi	a7,a7,4
    17d8:	413888b3          	sub	a7,a7,s3
    17dc:	ffc8f613          	andi	a2,a7,-4
    17e0:	99b2                	add	s3,s3,a2
    17e2:	200c0063          	beqz	s8,19e2 <fmt_fp+0xb0a>
    17e6:	4605                	li	a2,1
    17e8:	00004597          	auipc	a1,0x4
    17ec:	b8858593          	addi	a1,a1,-1144 # 5370 <__clzdi2+0x19e>
    17f0:	8526                	mv	a0,s1
    17f2:	e56ff0ef          	jal	ra,e48 <out>
    17f6:	7a79                	lui	s4,0xffffe
    17f8:	6789                	lui	a5,0x2
    17fa:	310a0a13          	addi	s4,s4,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    17fe:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1802:	97d2                	add	a5,a5,s4
    1804:	0098                	addi	a4,sp,64
    1806:	00e78a33          	add	s4,a5,a4
    180a:	009a0a93          	addi	s5,s4,9
    180e:	03000b93          	li	s7,48
    1812:	4ca5                	li	s9,9
    1814:	a269                	j	199e <fmt_fp+0xac6>
    1816:	00004697          	auipc	a3,0x4
    181a:	cba68693          	addi	a3,a3,-838 # 54d0 <__clzdi2+0x2fe>
    181e:	b505                	j	163e <fmt_fp+0x766>
    1820:	01be0e3b          	addw	t3,t3,s11
    1824:	3b9ad737          	lui	a4,0x3b9ad
    1828:	01cc2023          	sw	t3,0(s8)
    182c:	9ff70713          	addi	a4,a4,-1537 # 3b9ac9ff <__BSS_END__+0x3b9a41bf>
    1830:	000c2683          	lw	a3,0(s8)
    1834:	02d76263          	bltu	a4,a3,1858 <fmt_fp+0x980>
    1838:	41788733          	sub	a4,a7,s7
    183c:	000ba683          	lw	a3,0(s7)
    1840:	8709                	srai	a4,a4,0x2
    1842:	4325                	li	t1,9
    1844:	02e3033b          	mulw	t1,t1,a4
    1848:	4629                	li	a2,10
    184a:	4729                	li	a4,10
    184c:	e2e6eee3          	bltu	a3,a4,1688 <fmt_fp+0x7b0>
    1850:	2305                	addiw	t1,t1,1
    1852:	02e6073b          	mulw	a4,a2,a4
    1856:	bfdd                	j	184c <fmt_fp+0x974>
    1858:	1c71                	addi	s8,s8,-4
    185a:	000c2223          	sw	zero,4(s8)
    185e:	017c7563          	bgeu	s8,s7,1868 <fmt_fp+0x990>
    1862:	fe0bae23          	sw	zero,-4(s7)
    1866:	1bf1                	addi	s7,s7,-4
    1868:	000c2683          	lw	a3,0(s8)
    186c:	2685                	addiw	a3,a3,1
    186e:	00dc2023          	sw	a3,0(s8)
    1872:	bf7d                	j	1830 <fmt_fp+0x958>
    1874:	1d71                	addi	s10,s10,-4
    1876:	bd29                	j	1690 <fmt_fp+0x7b8>
    1878:	3b79                	addiw	s6,s6,-2
    187a:	347d                	addiw	s0,s0,-1
    187c:	b581                	j	16bc <fmt_fp+0x7e4>
    187e:	02e5073b          	mulw	a4,a0,a4
    1882:	2685                	addiw	a3,a3,1
    1884:	02e675bb          	remuw	a1,a2,a4
    1888:	d9fd                	beqz	a1,187e <fmt_fp+0x9a6>
    188a:	b599                	j	16d0 <fmt_fp+0x7f8>
    188c:	4681                	li	a3,0
    188e:	4729                	li	a4,10
    1890:	4529                	li	a0,10
    1892:	bfcd                	j	1884 <fmt_fp+0x9ac>
    1894:	971a                	add	a4,a4,t1
    1896:	bd91                	j	16ea <fmt_fp+0x812>
    1898:	d43a                	sw	a4,40(sp)
    189a:	6709                	lui	a4,0x2
    189c:	77f9                	lui	a5,0xffffe
    189e:	d1070713          	addi	a4,a4,-752 # 1d10 <printf_core+0x236>
    18a2:	973e                	add	a4,a4,a5
    18a4:	009c                	addi	a5,sp,64
    18a6:	97ba                	add	a5,a5,a4
    18a8:	41f3571b          	sraiw	a4,t1,0x1f
    18ac:	30c78793          	addi	a5,a5,780 # ffffffffffffe30c <__BSS_END__+0xffffffffffff5acc>
    18b0:	00e34533          	xor	a0,t1,a4
    18b4:	85be                	mv	a1,a5
    18b6:	9d19                	subw	a0,a0,a4
    18b8:	f032                	sd	a2,32(sp)
    18ba:	ec46                	sd	a7,24(sp)
    18bc:	e81a                	sd	t1,16(sp)
    18be:	e43e                	sd	a5,8(sp)
    18c0:	d20ff0ef          	jal	ra,de0 <fmt_u>
    18c4:	67a2                	ld	a5,8(sp)
    18c6:	6342                	ld	t1,16(sp)
    18c8:	68e2                	ld	a7,24(sp)
    18ca:	7602                	ld	a2,32(sp)
    18cc:	56a2                	lw	a3,40(sp)
    18ce:	4705                	li	a4,1
    18d0:	03000e13          	li	t3,48
    18d4:	40a785b3          	sub	a1,a5,a0
    18d8:	02b75e63          	bge	a4,a1,1914 <fmt_fp+0xa3c>
    18dc:	02d00713          	li	a4,45
    18e0:	00034463          	bltz	t1,18e8 <fmt_fp+0xa10>
    18e4:	02b00713          	li	a4,43
    18e8:	ffe50793          	addi	a5,a0,-2
    18ec:	e43e                	sd	a5,8(sp)
    18ee:	6789                	lui	a5,0x2
    18f0:	fee50fa3          	sb	a4,-1(a0)
    18f4:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    18f8:	7779                	lui	a4,0xffffe
    18fa:	97ba                	add	a5,a5,a4
    18fc:	0098                	addi	a4,sp,64
    18fe:	973e                	add	a4,a4,a5
    1900:	67a2                	ld	a5,8(sp)
    1902:	30c70713          	addi	a4,a4,780 # ffffffffffffe30c <__BSS_END__+0xffffffffffff5acc>
    1906:	ff650f23          	sb	s6,-2(a0)
    190a:	8f1d                	sub	a4,a4,a5
    190c:	92e64de3          	blt	a2,a4,1246 <fmt_fp+0x36e>
    1910:	9f35                	addw	a4,a4,a3
    1912:	bd05                	j	1742 <fmt_fp+0x86a>
    1914:	157d                	addi	a0,a0,-1
    1916:	01c50023          	sb	t3,0(a0)
    191a:	bf6d                	j	18d4 <fmt_fp+0x9fc>
    191c:	ffe6c693          	xori	a3,a3,-2
    1920:	b53d                	j	174e <fmt_fp+0x876>
    1922:	000ce503          	lwu	a0,0(s9)
    1926:	85ee                	mv	a1,s11
    1928:	e446                	sd	a7,8(sp)
    192a:	cb6ff0ef          	jal	ra,de0 <fmt_u>
    192e:	68a2                	ld	a7,8(sp)
    1930:	85aa                	mv	a1,a0
    1932:	872a                	mv	a4,a0
    1934:	013c9c63          	bne	s9,s3,194c <fmt_fp+0xa74>
    1938:	03b51263          	bne	a0,s11,195c <fmt_fp+0xa84>
    193c:	315a0c23          	sb	s5,792(s4)
    1940:	008b8593          	addi	a1,s7,8
    1944:	a821                	j	195c <fmt_fp+0xa84>
    1946:	177d                	addi	a4,a4,-1
    1948:	01570023          	sb	s5,0(a4)
    194c:	feebede3          	bltu	s7,a4,1946 <fmt_fp+0xa6e>
    1950:	4701                	li	a4,0
    1952:	0175e463          	bltu	a1,s7,195a <fmt_fp+0xa82>
    1956:	40bb8733          	sub	a4,s7,a1
    195a:	95ba                	add	a1,a1,a4
    195c:	40bd8633          	sub	a2,s11,a1
    1960:	8526                	mv	a0,s1
    1962:	e446                	sd	a7,8(sp)
    1964:	ce4ff0ef          	jal	ra,e48 <out>
    1968:	68a2                	ld	a7,8(sp)
    196a:	0c91                	addi	s9,s9,4
    196c:	bda1                	j	17c4 <fmt_fp+0x8ec>
    196e:	0009e503          	lwu	a0,0(s3)
    1972:	85d6                	mv	a1,s5
    1974:	c6cff0ef          	jal	ra,de0 <fmt_u>
    1978:	872a                	mv	a4,a0
    197a:	06ea6063          	bltu	s4,a4,19da <fmt_fp+0xb02>
    197e:	4581                	li	a1,0
    1980:	01456463          	bltu	a0,s4,1988 <fmt_fp+0xab0>
    1984:	40aa05b3          	sub	a1,s4,a0
    1988:	0004061b          	sext.w	a2,s0
    198c:	008cd363          	bge	s9,s0,1992 <fmt_fp+0xaba>
    1990:	4625                	li	a2,9
    1992:	95aa                	add	a1,a1,a0
    1994:	8526                	mv	a0,s1
    1996:	cb2ff0ef          	jal	ra,e48 <out>
    199a:	0991                	addi	s3,s3,4
    199c:	345d                	addiw	s0,s0,-9
    199e:	01a9f463          	bgeu	s3,s10,19a6 <fmt_fp+0xace>
    19a2:	fc8046e3          	bgtz	s0,196e <fmt_fp+0xa96>
    19a6:	4701                	li	a4,0
    19a8:	46a5                	li	a3,9
    19aa:	0094061b          	addiw	a2,s0,9
    19ae:	03000593          	li	a1,48
    19b2:	8526                	mv	a0,s1
    19b4:	caaff0ef          	jal	ra,e5e <pad>
    19b8:	6782                	ld	a5,0(sp)
    19ba:	6709                	lui	a4,0x2
    19bc:	8526                	mv	a0,s1
    19be:	8f3d                	xor	a4,a4,a5
    19c0:	86da                	mv	a3,s6
    19c2:	864a                	mv	a2,s2
    19c4:	02000593          	li	a1,32
    19c8:	c96ff0ef          	jal	ra,e5e <pad>
    19cc:	4542                	lw	a0,16(sp)
    19ce:	012b5363          	bge	s6,s2,19d4 <fmt_fp+0xafc>
    19d2:	854a                	mv	a0,s2
    19d4:	2501                	sext.w	a0,a0
    19d6:	df8ff06f          	j	fce <fmt_fp+0xf6>
    19da:	177d                	addi	a4,a4,-1
    19dc:	01770023          	sb	s7,0(a4) # 2000 <printf_core+0x526>
    19e0:	bf69                	j	197a <fmt_fp+0xaa2>
    19e2:	4401                	li	s0,0
    19e4:	bd09                	j	17f6 <fmt_fp+0x91e>
    19e6:	01abe463          	bltu	s7,s10,19ee <fmt_fp+0xb16>
    19ea:	004b8d13          	addi	s10,s7,4
    19ee:	7779                	lui	a4,0xffffe
    19f0:	6689                	lui	a3,0x2
    19f2:	31070993          	addi	s3,a4,784 # ffffffffffffe310 <__BSS_END__+0xffffffffffff5ad0>
    19f6:	d1068793          	addi	a5,a3,-752 # 1d10 <printf_core+0x236>
    19fa:	97ce                	add	a5,a5,s3
    19fc:	0090                	addi	a2,sp,64
    19fe:	00c789b3          	add	s3,a5,a2
    1a02:	d1068793          	addi	a5,a3,-752
    1a06:	97ba                	add	a5,a5,a4
    1a08:	97b2                	add	a5,a5,a2
    1a0a:	ec3e                	sd	a5,24(sp)
    1a0c:	00898793          	addi	a5,s3,8
    1a10:	8a5e                	mv	s4,s7
    1a12:	00998a93          	addi	s5,s3,9
    1a16:	f03e                	sd	a5,32(sp)
    1a18:	01aa7463          	bgeu	s4,s10,1a20 <fmt_fp+0xb48>
    1a1c:	02045c63          	bgez	s0,1a54 <fmt_fp+0xb7c>
    1a20:	0124061b          	addiw	a2,s0,18
    1a24:	8526                	mv	a0,s1
    1a26:	4701                	li	a4,0
    1a28:	46c9                	li	a3,18
    1a2a:	03000593          	li	a1,48
    1a2e:	c30ff0ef          	jal	ra,e5e <pad>
    1a32:	6789                	lui	a5,0x2
    1a34:	7679                	lui	a2,0xffffe
    1a36:	d1078793          	addi	a5,a5,-752 # 1d10 <printf_core+0x236>
    1a3a:	97b2                	add	a5,a5,a2
    1a3c:	0098                	addi	a4,sp,64
    1a3e:	00e78633          	add	a2,a5,a4
    1a42:	67a2                	ld	a5,8(sp)
    1a44:	30c60613          	addi	a2,a2,780 # ffffffffffffe30c <__BSS_END__+0xffffffffffff5acc>
    1a48:	8526                	mv	a0,s1
    1a4a:	8e1d                	sub	a2,a2,a5
    1a4c:	85be                	mv	a1,a5
    1a4e:	bfaff0ef          	jal	ra,e48 <out>
    1a52:	b79d                	j	19b8 <fmt_fp+0xae0>
    1a54:	000a6503          	lwu	a0,0(s4)
    1a58:	85d6                	mv	a1,s5
    1a5a:	b86ff0ef          	jal	ra,de0 <fmt_u>
    1a5e:	85aa                	mv	a1,a0
    1a60:	01551863          	bne	a0,s5,1a70 <fmt_fp+0xb98>
    1a64:	67e2                	ld	a5,24(sp)
    1a66:	7582                	ld	a1,32(sp)
    1a68:	03000713          	li	a4,48
    1a6c:	30e78c23          	sb	a4,792(a5)
    1a70:	00040d9b          	sext.w	s11,s0
    1a74:	872e                	mv	a4,a1
    1a76:	037a1963          	bne	s4,s7,1aa8 <fmt_fp+0xbd0>
    1a7a:	4605                	li	a2,1
    1a7c:	8526                	mv	a0,s1
    1a7e:	00158c13          	addi	s8,a1,1
    1a82:	bc6ff0ef          	jal	ra,e48 <out>
    1a86:	01bce6b3          	or	a3,s9,s11
    1a8a:	ca85                	beqz	a3,1aba <fmt_fp+0xbe2>
    1a8c:	4605                	li	a2,1
    1a8e:	00004597          	auipc	a1,0x4
    1a92:	8e258593          	addi	a1,a1,-1822 # 5370 <__clzdi2+0x19e>
    1a96:	8526                	mv	a0,s1
    1a98:	bb0ff0ef          	jal	ra,e48 <out>
    1a9c:	a839                	j	1aba <fmt_fp+0xbe2>
    1a9e:	177d                	addi	a4,a4,-1
    1aa0:	03000793          	li	a5,48
    1aa4:	00f70023          	sb	a5,0(a4)
    1aa8:	fee9ebe3          	bltu	s3,a4,1a9e <fmt_fp+0xbc6>
    1aac:	4701                	li	a4,0
    1aae:	0135e463          	bltu	a1,s3,1ab6 <fmt_fp+0xbde>
    1ab2:	40b98733          	sub	a4,s3,a1
    1ab6:	00e58c33          	add	s8,a1,a4
    1aba:	418a86b3          	sub	a3,s5,s8
    1abe:	8622                	mv	a2,s0
    1ac0:	0086d363          	bge	a3,s0,1ac6 <fmt_fp+0xbee>
    1ac4:	8636                	mv	a2,a3
    1ac6:	85e2                	mv	a1,s8
    1ac8:	8526                	mv	a0,s1
    1aca:	f436                	sd	a3,40(sp)
    1acc:	b7cff0ef          	jal	ra,e48 <out>
    1ad0:	76a2                	ld	a3,40(sp)
    1ad2:	0a11                	addi	s4,s4,4
    1ad4:	40dd843b          	subw	s0,s11,a3
    1ad8:	b781                	j	1a18 <fmt_fp+0xb40>

0000000000001ada <printf_core>:
    1ada:	800007b7          	lui	a5,0x80000
    1ade:	716d                	addi	sp,sp,-272
    1ae0:	fff7c793          	not	a5,a5
    1ae4:	cc3e                	sw	a5,24(sp)
    1ae6:	67cd                	lui	a5,0x13
    1ae8:	8897879b          	addiw	a5,a5,-1911
    1aec:	e222                	sd	s0,256(sp)
    1aee:	f9ca                	sd	s2,240(sp)
    1af0:	f5ce                	sd	s3,232(sp)
    1af2:	f1d2                	sd	s4,224(sp)
    1af4:	edd6                	sd	s5,216(sp)
    1af6:	e5de                	sd	s7,200(sp)
    1af8:	f56e                	sd	s11,168(sp)
    1afa:	e606                	sd	ra,264(sp)
    1afc:	fda6                	sd	s1,248(sp)
    1afe:	e9da                	sd	s6,208(sp)
    1b00:	e1e2                	sd	s8,192(sp)
    1b02:	fd66                	sd	s9,184(sp)
    1b04:	f96a                	sd	s10,176(sp)
    1b06:	842a                	mv	s0,a0
    1b08:	8a32                	mv	s4,a2
    1b0a:	e036                	sd	a3,0(sp)
    1b0c:	8aba                	mv	s5,a4
    1b0e:	e0ae                	sd	a1,64(sp)
    1b10:	4d81                	li	s11,0
    1b12:	4901                	li	s2,0
    1b14:	4b81                	li	s7,0
    1b16:	ce3e                	sw	a5,28(sp)
    1b18:	00004997          	auipc	s3,0x4
    1b1c:	86098993          	addi	s3,s3,-1952 # 5378 <__clzdi2+0x1a6>
    1b20:	6d06                	ld	s10,64(sp)
    1b22:	012d893b          	addw	s2,s11,s2
    1b26:	8c4a                	mv	s8,s2
    1b28:	000d4783          	lbu	a5,0(s10)
    1b2c:	5e078863          	beqz	a5,211c <printf_core+0x642>
    1b30:	02500713          	li	a4,37
    1b34:	6d86                	ld	s11,64(sp)
    1b36:	000dc783          	lbu	a5,0(s11)
    1b3a:	c399                	beqz	a5,1b40 <printf_core+0x66>
    1b3c:	00e79563          	bne	a5,a4,1b46 <printf_core+0x6c>
    1b40:	02500713          	li	a4,37
    1b44:	a039                	j	1b52 <printf_core+0x78>
    1b46:	0d85                	addi	s11,s11,1
    1b48:	e0ee                	sd	s11,64(sp)
    1b4a:	b7ed                	j	1b34 <printf_core+0x5a>
    1b4c:	0789                	addi	a5,a5,2
    1b4e:	0d85                	addi	s11,s11,1
    1b50:	e0be                	sd	a5,64(sp)
    1b52:	6786                	ld	a5,64(sp)
    1b54:	0007c683          	lbu	a3,0(a5) # 13000 <__BSS_END__+0xa7c0>
    1b58:	00e69663          	bne	a3,a4,1b64 <printf_core+0x8a>
    1b5c:	0017c683          	lbu	a3,1(a5)
    1b60:	fee686e3          	beq	a3,a4,1b4c <printf_core+0x72>
    1b64:	47e2                	lw	a5,24(sp)
    1b66:	41ad8db3          	sub	s11,s11,s10
    1b6a:	418787bb          	subw	a5,a5,s8
    1b6e:	e43e                	sd	a5,8(sp)
    1b70:	55b7c963          	blt	a5,s11,20c2 <printf_core+0x5e8>
    1b74:	2d81                	sext.w	s11,s11
    1b76:	c411                	beqz	s0,1b82 <printf_core+0xa8>
    1b78:	866e                	mv	a2,s11
    1b7a:	85ea                	mv	a1,s10
    1b7c:	8522                	mv	a0,s0
    1b7e:	acaff0ef          	jal	ra,e48 <out>
    1b82:	520d9d63          	bnez	s11,20bc <printf_core+0x5e2>
    1b86:	6706                	ld	a4,64(sp)
    1b88:	47a5                	li	a5,9
    1b8a:	00174683          	lbu	a3,1(a4)
    1b8e:	fd06869b          	addiw	a3,a3,-48
    1b92:	12d7ed63          	bltu	a5,a3,1ccc <printf_core+0x1f2>
    1b96:	00274603          	lbu	a2,2(a4)
    1b9a:	02400793          	li	a5,36
    1b9e:	12f61763          	bne	a2,a5,1ccc <printf_core+0x1f2>
    1ba2:	070d                	addi	a4,a4,3
    1ba4:	4b85                	li	s7,1
    1ba6:	4b01                	li	s6,0
    1ba8:	487d                	li	a6,31
    1baa:	4305                	li	t1,1
    1bac:	e0ba                	sd	a4,64(sp)
    1bae:	00074503          	lbu	a0,0(a4)
    1bb2:	fe05061b          	addiw	a2,a0,-32
    1bb6:	00c86863          	bltu	a6,a2,1bc6 <printf_core+0xec>
    1bba:	47f2                	lw	a5,28(sp)
    1bbc:	00c7d5bb          	srlw	a1,a5,a2
    1bc0:	8985                	andi	a1,a1,1
    1bc2:	10059863          	bnez	a1,1cd2 <printf_core+0x1f8>
    1bc6:	02a00613          	li	a2,42
    1bca:	12c51f63          	bne	a0,a2,1d08 <printf_core+0x22e>
    1bce:	00174603          	lbu	a2,1(a4)
    1bd2:	45a5                	li	a1,9
    1bd4:	fd06051b          	addiw	a0,a2,-48
    1bd8:	10a5e563          	bltu	a1,a0,1ce2 <printf_core+0x208>
    1bdc:	00274503          	lbu	a0,2(a4)
    1be0:	02400593          	li	a1,36
    1be4:	0eb51f63          	bne	a0,a1,1ce2 <printf_core+0x208>
    1be8:	060a                	slli	a2,a2,0x2
    1bea:	9656                	add	a2,a2,s5
    1bec:	45a9                	li	a1,10
    1bee:	f4b62023          	sw	a1,-192(a2)
    1bf2:	00174603          	lbu	a2,1(a4)
    1bf6:	6782                	ld	a5,0(sp)
    1bf8:	070d                	addi	a4,a4,3
    1bfa:	0612                	slli	a2,a2,0x4
    1bfc:	963e                	add	a2,a2,a5
    1bfe:	d0062483          	lw	s1,-768(a2)
    1c02:	4b85                	li	s7,1
    1c04:	e0ba                	sd	a4,64(sp)
    1c06:	0004d763          	bgez	s1,1c14 <printf_core+0x13a>
    1c0a:	6709                	lui	a4,0x2
    1c0c:	00eb6b33          	or	s6,s6,a4
    1c10:	409004bb          	negw	s1,s1
    1c14:	6706                	ld	a4,64(sp)
    1c16:	02e00613          	li	a2,46
    1c1a:	00074583          	lbu	a1,0(a4) # 2000 <printf_core+0x526>
    1c1e:	12c59663          	bne	a1,a2,1d4a <printf_core+0x270>
    1c22:	00174583          	lbu	a1,1(a4)
    1c26:	02a00613          	li	a2,42
    1c2a:	10c59663          	bne	a1,a2,1d36 <printf_core+0x25c>
    1c2e:	00274603          	lbu	a2,2(a4)
    1c32:	45a5                	li	a1,9
    1c34:	fd06051b          	addiw	a0,a2,-48
    1c38:	0ea5e163          	bltu	a1,a0,1d1a <printf_core+0x240>
    1c3c:	00374503          	lbu	a0,3(a4)
    1c40:	02400593          	li	a1,36
    1c44:	0cb51b63          	bne	a0,a1,1d1a <printf_core+0x240>
    1c48:	060a                	slli	a2,a2,0x2
    1c4a:	9656                	add	a2,a2,s5
    1c4c:	45a9                	li	a1,10
    1c4e:	f4b62023          	sw	a1,-192(a2)
    1c52:	00274603          	lbu	a2,2(a4)
    1c56:	6782                	ld	a5,0(sp)
    1c58:	0711                	addi	a4,a4,4
    1c5a:	0612                	slli	a2,a2,0x4
    1c5c:	963e                	add	a2,a2,a5
    1c5e:	d0062c83          	lw	s9,-768(a2)
    1c62:	fffcce13          	not	t3,s9
    1c66:	e0ba                	sd	a4,64(sp)
    1c68:	01fe5e1b          	srliw	t3,t3,0x1f
    1c6c:	4701                	li	a4,0
    1c6e:	03900e93          	li	t4,57
    1c72:	03a00313          	li	t1,58
    1c76:	451d                	li	a0,7
    1c78:	6806                	ld	a6,64(sp)
    1c7a:	00084603          	lbu	a2,0(a6)
    1c7e:	fbf6061b          	addiw	a2,a2,-65
    1c82:	06cee263          	bltu	t4,a2,1ce6 <printf_core+0x20c>
    1c86:	00180613          	addi	a2,a6,1
    1c8a:	e0b2                	sd	a2,64(sp)
    1c8c:	02071613          	slli	a2,a4,0x20
    1c90:	9201                	srli	a2,a2,0x20
    1c92:	02660633          	mul	a2,a2,t1
    1c96:	00084583          	lbu	a1,0(a6)
    1c9a:	00004797          	auipc	a5,0x4
    1c9e:	87678793          	addi	a5,a5,-1930 # 5510 <states>
    1ca2:	fbf5859b          	addiw	a1,a1,-65
    1ca6:	963e                	add	a2,a2,a5
    1ca8:	962e                	add	a2,a2,a1
    1caa:	00064f03          	lbu	t5,0(a2)
    1cae:	ffff061b          	addiw	a2,t5,-1
    1cb2:	000f059b          	sext.w	a1,t5
    1cb6:	08c57d63          	bgeu	a0,a2,1d50 <printf_core+0x276>
    1cba:	c595                	beqz	a1,1ce6 <printf_core+0x20c>
    1cbc:	466d                	li	a2,27
    1cbe:	08c59b63          	bne	a1,a2,1d54 <printf_core+0x27a>
    1cc2:	567d                	li	a2,-1
    1cc4:	02c69163          	bne	a3,a2,1ce6 <printf_core+0x20c>
    1cc8:	e075                	bnez	s0,1dac <printf_core+0x2d2>
    1cca:	bd99                	j	1b20 <printf_core+0x46>
    1ccc:	0705                	addi	a4,a4,1
    1cce:	56fd                	li	a3,-1
    1cd0:	bdd9                	j	1ba6 <printf_core+0xcc>
    1cd2:	00c3163b          	sllw	a2,t1,a2
    1cd6:	00cb6633          	or	a2,s6,a2
    1cda:	00060b1b          	sext.w	s6,a2
    1cde:	0705                	addi	a4,a4,1
    1ce0:	b5f1                	j	1bac <printf_core+0xd2>
    1ce2:	000b8863          	beqz	s7,1cf2 <printf_core+0x218>
    1ce6:	665000ef          	jal	ra,2b4a <__errno_location>
    1cea:	47d9                	li	a5,22
    1cec:	c11c                	sw	a5,0(a0)
    1cee:	597d                	li	s2,-1
    1cf0:	a061                	j	1d78 <printf_core+0x29e>
    1cf2:	4481                	li	s1,0
    1cf4:	c801                	beqz	s0,1d04 <printf_core+0x22a>
    1cf6:	000a3603          	ld	a2,0(s4)
    1cfa:	4204                	lw	s1,0(a2)
    1cfc:	00860593          	addi	a1,a2,8
    1d00:	00ba3023          	sd	a1,0(s4)
    1d04:	0705                	addi	a4,a4,1
    1d06:	bdfd                	j	1c04 <printf_core+0x12a>
    1d08:	0088                	addi	a0,sp,64
    1d0a:	e836                	sd	a3,16(sp)
    1d0c:	8f2ff0ef          	jal	ra,dfe <getint>
    1d10:	66c2                	ld	a3,16(sp)
    1d12:	84aa                	mv	s1,a0
    1d14:	f00550e3          	bgez	a0,1c14 <printf_core+0x13a>
    1d18:	a66d                	j	20c2 <printf_core+0x5e8>
    1d1a:	fc0b96e3          	bnez	s7,1ce6 <printf_core+0x20c>
    1d1e:	4c81                	li	s9,0
    1d20:	c809                	beqz	s0,1d32 <printf_core+0x258>
    1d22:	000a3603          	ld	a2,0(s4)
    1d26:	00062c83          	lw	s9,0(a2)
    1d2a:	00860593          	addi	a1,a2,8
    1d2e:	00ba3023          	sd	a1,0(s4)
    1d32:	0709                	addi	a4,a4,2
    1d34:	b73d                	j	1c62 <printf_core+0x188>
    1d36:	0705                	addi	a4,a4,1
    1d38:	0088                	addi	a0,sp,64
    1d3a:	e836                	sd	a3,16(sp)
    1d3c:	e0ba                	sd	a4,64(sp)
    1d3e:	8c0ff0ef          	jal	ra,dfe <getint>
    1d42:	66c2                	ld	a3,16(sp)
    1d44:	8caa                	mv	s9,a0
    1d46:	4e05                	li	t3,1
    1d48:	b715                	j	1c6c <printf_core+0x192>
    1d4a:	4e01                	li	t3,0
    1d4c:	5cfd                	li	s9,-1
    1d4e:	bf39                	j	1c6c <printf_core+0x192>
    1d50:	872e                	mv	a4,a1
    1d52:	b71d                	j	1c78 <printf_core+0x19e>
    1d54:	567d                	li	a2,-1
    1d56:	00c68f63          	beq	a3,a2,1d74 <printf_core+0x29a>
    1d5a:	6782                	ld	a5,0(sp)
    1d5c:	00269613          	slli	a2,a3,0x2
    1d60:	0692                	slli	a3,a3,0x4
    1d62:	9656                	add	a2,a2,s5
    1d64:	96be                	add	a3,a3,a5
    1d66:	01e62023          	sw	t5,0(a2)
    1d6a:	6290                	ld	a2,0(a3)
    1d6c:	6694                	ld	a3,8(a3)
    1d6e:	e8b2                	sd	a2,80(sp)
    1d70:	ecb6                	sd	a3,88(sp)
    1d72:	bf99                	j	1cc8 <printf_core+0x1ee>
    1d74:	e015                	bnez	s0,1d98 <printf_core+0x2be>
    1d76:	4901                	li	s2,0
    1d78:	60b2                	ld	ra,264(sp)
    1d7a:	6412                	ld	s0,256(sp)
    1d7c:	74ee                	ld	s1,248(sp)
    1d7e:	79ae                	ld	s3,232(sp)
    1d80:	7a0e                	ld	s4,224(sp)
    1d82:	6aee                	ld	s5,216(sp)
    1d84:	6b4e                	ld	s6,208(sp)
    1d86:	6bae                	ld	s7,200(sp)
    1d88:	6c0e                	ld	s8,192(sp)
    1d8a:	7cea                	ld	s9,184(sp)
    1d8c:	7d4a                	ld	s10,176(sp)
    1d8e:	7daa                	ld	s11,168(sp)
    1d90:	854a                	mv	a0,s2
    1d92:	794e                	ld	s2,240(sp)
    1d94:	6151                	addi	sp,sp,272
    1d96:	8082                	ret
    1d98:	8652                	mv	a2,s4
    1d9a:	0888                	addi	a0,sp,80
    1d9c:	f43a                	sd	a4,40(sp)
    1d9e:	f072                	sd	t3,32(sp)
    1da0:	e842                	sd	a6,16(sp)
    1da2:	f91fe0ef          	jal	ra,d32 <pop_arg>
    1da6:	6842                	ld	a6,16(sp)
    1da8:	7e02                	ld	t3,32(sp)
    1daa:	7722                	ld	a4,40(sp)
    1dac:	00084683          	lbu	a3,0(a6)
    1db0:	0006881b          	sext.w	a6,a3
    1db4:	c719                	beqz	a4,1dc2 <printf_core+0x2e8>
    1db6:	8abd                	andi	a3,a3,15
    1db8:	460d                	li	a2,3
    1dba:	00c69463          	bne	a3,a2,1dc2 <printf_core+0x2e8>
    1dbe:	0df87813          	andi	a6,a6,223
    1dc2:	00db5693          	srli	a3,s6,0xd
    1dc6:	8a85                	andi	a3,a3,1
    1dc8:	c689                	beqz	a3,1dd2 <printf_core+0x2f8>
    1dca:	76c1                	lui	a3,0xffff0
    1dcc:	16fd                	addi	a3,a3,-1
    1dce:	00db7b33          	and	s6,s6,a3
    1dd2:	fbf8069b          	addiw	a3,a6,-65
    1dd6:	0006859b          	sext.w	a1,a3
    1dda:	03700613          	li	a2,55
    1dde:	32b66963          	bltu	a2,a1,2110 <printf_core+0x636>
    1de2:	02069613          	slli	a2,a3,0x20
    1de6:	01e65693          	srli	a3,a2,0x1e
    1dea:	00003617          	auipc	a2,0x3
    1dee:	5a660613          	addi	a2,a2,1446 # 5390 <__clzdi2+0x1be>
    1df2:	96b2                	add	a3,a3,a2
    1df4:	4294                	lw	a3,0(a3)
    1df6:	96b2                	add	a3,a3,a2
    1df8:	8682                	jr	a3
    1dfa:	479d                	li	a5,7
    1dfc:	2ce7e063          	bltu	a5,a4,20bc <printf_core+0x5e2>
    1e00:	00003697          	auipc	a3,0x3
    1e04:	67068693          	addi	a3,a3,1648 # 5470 <__clzdi2+0x29e>
    1e08:	070a                	slli	a4,a4,0x2
    1e0a:	9736                	add	a4,a4,a3
    1e0c:	431c                	lw	a5,0(a4)
    1e0e:	97b6                	add	a5,a5,a3
    1e10:	8782                	jr	a5
    1e12:	67c6                	ld	a5,80(sp)
    1e14:	0187a023          	sw	s8,0(a5)
    1e18:	b321                	j	1b20 <printf_core+0x46>
    1e1a:	67c6                	ld	a5,80(sp)
    1e1c:	01279023          	sh	s2,0(a5)
    1e20:	b301                	j	1b20 <printf_core+0x46>
    1e22:	67c6                	ld	a5,80(sp)
    1e24:	01278023          	sb	s2,0(a5)
    1e28:	b9e5                	j	1b20 <printf_core+0x46>
    1e2a:	67c6                	ld	a5,80(sp)
    1e2c:	0127b023          	sd	s2,0(a5)
    1e30:	b9c5                	j	1b20 <printf_core+0x46>
    1e32:	8766                	mv	a4,s9
    1e34:	46c1                	li	a3,16
    1e36:	2c81                	sext.w	s9,s9
    1e38:	00dcf363          	bgeu	s9,a3,1e3e <printf_core+0x364>
    1e3c:	4741                	li	a4,16
    1e3e:	00070c9b          	sext.w	s9,a4
    1e42:	008b6b13          	ori	s6,s6,8
    1e46:	07800813          	li	a6,120
    1e4a:	6646                	ld	a2,80(sp)
    1e4c:	02087593          	andi	a1,a6,32
    1e50:	09f10d13          	addi	s10,sp,159
    1e54:	8732                	mv	a4,a2
    1e56:	00004517          	auipc	a0,0x4
    1e5a:	88a50513          	addi	a0,a0,-1910 # 56e0 <xdigits>
    1e5e:	ef79                	bnez	a4,1f3c <printf_core+0x462>
    1e60:	834e                	mv	t1,s3
    1e62:	ca09                	beqz	a2,1e74 <printf_core+0x39a>
    1e64:	008b7713          	andi	a4,s6,8
    1e68:	c711                	beqz	a4,1e74 <printf_core+0x39a>
    1e6a:	00485813          	srli	a6,a6,0x4
    1e6e:	01098333          	add	t1,s3,a6
    1e72:	4d89                	li	s11,2
    1e74:	000e0863          	beqz	t3,1e84 <printf_core+0x3aa>
    1e78:	240cc563          	bltz	s9,20c2 <printf_core+0x5e8>
    1e7c:	7741                	lui	a4,0xffff0
    1e7e:	177d                	addi	a4,a4,-1
    1e80:	00eb7b33          	and	s6,s6,a4
    1e84:	66c6                	ld	a3,80(sp)
    1e86:	09f10613          	addi	a2,sp,159
    1e8a:	e299                	bnez	a3,1e90 <printf_core+0x3b6>
    1e8c:	280c8663          	beqz	s9,2118 <printf_core+0x63e>
    1e90:	41a60733          	sub	a4,a2,s10
    1e94:	0016b693          	seqz	a3,a3
    1e98:	9736                	add	a4,a4,a3
    1e9a:	01975363          	bge	a4,s9,1ea0 <printf_core+0x3c6>
    1e9e:	8766                	mv	a4,s9
    1ea0:	00070c9b          	sext.w	s9,a4
    1ea4:	41a60c33          	sub	s8,a2,s10
    1ea8:	018cd463          	bge	s9,s8,1eb0 <printf_core+0x3d6>
    1eac:	000c0c9b          	sext.w	s9,s8
    1eb0:	47e2                	lw	a5,24(sp)
    1eb2:	41b7873b          	subw	a4,a5,s11
    1eb6:	21974663          	blt	a4,s9,20c2 <printf_core+0x5e8>
    1eba:	01bc87bb          	addw	a5,s9,s11
    1ebe:	873e                	mv	a4,a5
    1ec0:	0097d363          	bge	a5,s1,1ec6 <printf_core+0x3ec>
    1ec4:	8726                	mv	a4,s1
    1ec6:	0007049b          	sext.w	s1,a4
    1eca:	6722                	ld	a4,8(sp)
    1ecc:	e81a                	sd	t1,16(sp)
    1ece:	1e974a63          	blt	a4,s1,20c2 <printf_core+0x5e8>
    1ed2:	86be                	mv	a3,a5
    1ed4:	875a                	mv	a4,s6
    1ed6:	8626                	mv	a2,s1
    1ed8:	02000593          	li	a1,32
    1edc:	8522                	mv	a0,s0
    1ede:	e43e                	sd	a5,8(sp)
    1ee0:	f7ffe0ef          	jal	ra,e5e <pad>
    1ee4:	6342                	ld	t1,16(sp)
    1ee6:	866e                	mv	a2,s11
    1ee8:	8522                	mv	a0,s0
    1eea:	859a                	mv	a1,t1
    1eec:	f5dfe0ef          	jal	ra,e48 <out>
    1ef0:	67a2                	ld	a5,8(sp)
    1ef2:	6741                	lui	a4,0x10
    1ef4:	00eb4733          	xor	a4,s6,a4
    1ef8:	86be                	mv	a3,a5
    1efa:	8626                	mv	a2,s1
    1efc:	03000593          	li	a1,48
    1f00:	8522                	mv	a0,s0
    1f02:	f5dfe0ef          	jal	ra,e5e <pad>
    1f06:	4701                	li	a4,0
    1f08:	000c069b          	sext.w	a3,s8
    1f0c:	8666                	mv	a2,s9
    1f0e:	03000593          	li	a1,48
    1f12:	8522                	mv	a0,s0
    1f14:	f4bfe0ef          	jal	ra,e5e <pad>
    1f18:	8662                	mv	a2,s8
    1f1a:	85ea                	mv	a1,s10
    1f1c:	8522                	mv	a0,s0
    1f1e:	f2bfe0ef          	jal	ra,e48 <out>
    1f22:	67a2                	ld	a5,8(sp)
    1f24:	6709                	lui	a4,0x2
    1f26:	00eb4733          	xor	a4,s6,a4
    1f2a:	86be                	mv	a3,a5
    1f2c:	8626                	mv	a2,s1
    1f2e:	02000593          	li	a1,32
    1f32:	8522                	mv	a0,s0
    1f34:	f2bfe0ef          	jal	ra,e5e <pad>
    1f38:	8da6                	mv	s11,s1
    1f3a:	b6dd                	j	1b20 <printf_core+0x46>
    1f3c:	00f77693          	andi	a3,a4,15
    1f40:	96aa                	add	a3,a3,a0
    1f42:	0006c683          	lbu	a3,0(a3)
    1f46:	1d7d                	addi	s10,s10,-1
    1f48:	8311                	srli	a4,a4,0x4
    1f4a:	8ecd                	or	a3,a3,a1
    1f4c:	00dd0023          	sb	a3,0(s10)
    1f50:	b739                	j	1e5e <printf_core+0x384>
    1f52:	66c6                	ld	a3,80(sp)
    1f54:	09f10d13          	addi	s10,sp,159
    1f58:	876a                	mv	a4,s10
    1f5a:	ee89                	bnez	a3,1f74 <printf_core+0x49a>
    1f5c:	008b7693          	andi	a3,s6,8
    1f60:	834e                	mv	t1,s3
    1f62:	f00689e3          	beqz	a3,1e74 <printf_core+0x39a>
    1f66:	41a70733          	sub	a4,a4,s10
    1f6a:	f19745e3          	blt	a4,s9,1e74 <printf_core+0x39a>
    1f6e:	00170c9b          	addiw	s9,a4,1
    1f72:	b709                	j	1e74 <printf_core+0x39a>
    1f74:	0076f613          	andi	a2,a3,7
    1f78:	1d7d                	addi	s10,s10,-1
    1f7a:	0306061b          	addiw	a2,a2,48
    1f7e:	00cd0023          	sb	a2,0(s10)
    1f82:	828d                	srli	a3,a3,0x3
    1f84:	bfd9                	j	1f5a <printf_core+0x480>
    1f86:	6746                	ld	a4,80(sp)
    1f88:	02075263          	bgez	a4,1fac <printf_core+0x4d2>
    1f8c:	40e00733          	neg	a4,a4
    1f90:	e8ba                	sd	a4,80(sp)
    1f92:	4d85                	li	s11,1
    1f94:	834e                	mv	t1,s3
    1f96:	6546                	ld	a0,80(sp)
    1f98:	09f10593          	addi	a1,sp,159
    1f9c:	f01a                	sd	t1,32(sp)
    1f9e:	e872                	sd	t3,16(sp)
    1fa0:	e41fe0ef          	jal	ra,de0 <fmt_u>
    1fa4:	7302                	ld	t1,32(sp)
    1fa6:	6e42                	ld	t3,16(sp)
    1fa8:	8d2a                	mv	s10,a0
    1faa:	b5e9                	j	1e74 <printf_core+0x39a>
    1fac:	00bb5713          	srli	a4,s6,0xb
    1fb0:	8b05                	andi	a4,a4,1
    1fb2:	eb11                	bnez	a4,1fc6 <printf_core+0x4ec>
    1fb4:	001b7713          	andi	a4,s6,1
    1fb8:	df71                	beqz	a4,1f94 <printf_core+0x4ba>
    1fba:	4d85                	li	s11,1
    1fbc:	00003317          	auipc	t1,0x3
    1fc0:	3be30313          	addi	t1,t1,958 # 537a <__clzdi2+0x1a8>
    1fc4:	bfc9                	j	1f96 <printf_core+0x4bc>
    1fc6:	4d85                	li	s11,1
    1fc8:	00003317          	auipc	t1,0x3
    1fcc:	3b130313          	addi	t1,t1,945 # 5379 <__clzdi2+0x1a7>
    1fd0:	b7d9                	j	1f96 <printf_core+0x4bc>
    1fd2:	6746                	ld	a4,80(sp)
    1fd4:	834e                	mv	t1,s3
    1fd6:	4c85                	li	s9,1
    1fd8:	08e10f23          	sb	a4,158(sp)
    1fdc:	7741                	lui	a4,0xffff0
    1fde:	177d                	addi	a4,a4,-1
    1fe0:	00eb7b33          	and	s6,s6,a4
    1fe4:	09f10613          	addi	a2,sp,159
    1fe8:	09e10d13          	addi	s10,sp,158
    1fec:	bd65                	j	1ea4 <printf_core+0x3ca>
    1fee:	35d000ef          	jal	ra,2b4a <__errno_location>
    1ff2:	4108                	lw	a0,0(a0)
    1ff4:	387000ef          	jal	ra,2b7a <strerror>
    1ff8:	8d2a                	mv	s10,a0
    1ffa:	85e6                	mv	a1,s9
    1ffc:	000cd663          	bgez	s9,2008 <printf_core+0x52e>
    2000:	800005b7          	lui	a1,0x80000
    2004:	fff5c593          	not	a1,a1
    2008:	856a                	mv	a0,s10
    200a:	780000ef          	jal	ra,278a <strnlen>
    200e:	00ad0633          	add	a2,s10,a0
    2012:	000cd563          	bgez	s9,201c <printf_core+0x542>
    2016:	00064703          	lbu	a4,0(a2)
    201a:	e745                	bnez	a4,20c2 <printf_core+0x5e8>
    201c:	7741                	lui	a4,0xffff0
    201e:	177d                	addi	a4,a4,-1
    2020:	00050c9b          	sext.w	s9,a0
    2024:	00eb7b33          	and	s6,s6,a4
    2028:	834e                	mv	t1,s3
    202a:	bdad                	j	1ea4 <printf_core+0x3ca>
    202c:	6d46                	ld	s10,80(sp)
    202e:	fc0d16e3          	bnez	s10,1ffa <printf_core+0x520>
    2032:	00003d17          	auipc	s10,0x3
    2036:	356d0d13          	addi	s10,s10,854 # 5388 <__clzdi2+0x1b6>
    203a:	b7c1                	j	1ffa <printf_core+0x520>
    203c:	6746                	ld	a4,80(sp)
    203e:	c682                	sw	zero,76(sp)
    2040:	5cfd                	li	s9,-1
    2042:	c4ba                	sw	a4,72(sp)
    2044:	00b8                	addi	a4,sp,72
    2046:	e8ba                	sd	a4,80(sp)
    2048:	6c46                	ld	s8,80(sp)
    204a:	4d01                	li	s10,0
    204c:	1834                	addi	a3,sp,56
    204e:	8de2                	mv	s11,s8
    2050:	039d7163          	bgeu	s10,s9,2072 <printf_core+0x598>
    2054:	000da583          	lw	a1,0(s11)
    2058:	cd89                	beqz	a1,2072 <printf_core+0x598>
    205a:	8536                	mv	a0,a3
    205c:	0d91                	addi	s11,s11,4
    205e:	e836                	sd	a3,16(sp)
    2060:	425000ef          	jal	ra,2c84 <wctomb>
    2064:	c80545e3          	bltz	a0,1cee <printf_core+0x214>
    2068:	41ac8733          	sub	a4,s9,s10
    206c:	66c2                	ld	a3,16(sp)
    206e:	04a77f63          	bgeu	a4,a0,20cc <printf_core+0x5f2>
    2072:	80000737          	lui	a4,0x80000
    2076:	fff74713          	not	a4,a4
    207a:	05a76463          	bltu	a4,s10,20c2 <printf_core+0x5e8>
    207e:	000d0c9b          	sext.w	s9,s10
    2082:	875a                	mv	a4,s6
    2084:	86e6                	mv	a3,s9
    2086:	8626                	mv	a2,s1
    2088:	02000593          	li	a1,32
    208c:	8522                	mv	a0,s0
    208e:	dd1fe0ef          	jal	ra,e5e <pad>
    2092:	183c                	addi	a5,sp,56
    2094:	4d81                	li	s11,0
    2096:	e83e                	sd	a5,16(sp)
    2098:	03adec63          	bltu	s11,s10,20d0 <printf_core+0x5f6>
    209c:	6709                	lui	a4,0x2
    209e:	00eb4733          	xor	a4,s6,a4
    20a2:	86e6                	mv	a3,s9
    20a4:	8626                	mv	a2,s1
    20a6:	02000593          	li	a1,32
    20aa:	8522                	mv	a0,s0
    20ac:	db3fe0ef          	jal	ra,e5e <pad>
    20b0:	00048d9b          	sext.w	s11,s1
    20b4:	0194d463          	bge	s1,s9,20bc <printf_core+0x5e2>
    20b8:	000c8d9b          	sext.w	s11,s9
    20bc:	67a2                	ld	a5,8(sp)
    20be:	a7b7d1e3          	bge	a5,s11,1b20 <printf_core+0x46>
    20c2:	289000ef          	jal	ra,2b4a <__errno_location>
    20c6:	04b00793          	li	a5,75
    20ca:	b10d                	j	1cec <printf_core+0x212>
    20cc:	9d2a                	add	s10,s10,a0
    20ce:	b749                	j	2050 <printf_core+0x576>
    20d0:	000c2583          	lw	a1,0(s8)
    20d4:	d5e1                	beqz	a1,209c <printf_core+0x5c2>
    20d6:	6542                	ld	a0,16(sp)
    20d8:	0c11                	addi	s8,s8,4
    20da:	3ab000ef          	jal	ra,2c84 <wctomb>
    20de:	9daa                	add	s11,s11,a0
    20e0:	862a                	mv	a2,a0
    20e2:	fbbd6de3          	bltu	s10,s11,209c <printf_core+0x5c2>
    20e6:	65c2                	ld	a1,16(sp)
    20e8:	8522                	mv	a0,s0
    20ea:	d5ffe0ef          	jal	ra,e48 <out>
    20ee:	b76d                	j	2098 <printf_core+0x5be>
    20f0:	000e0463          	beqz	t3,20f8 <printf_core+0x61e>
    20f4:	fc0cc7e3          	bltz	s9,20c2 <printf_core+0x5e8>
    20f8:	65c6                	ld	a1,80(sp)
    20fa:	6666                	ld	a2,88(sp)
    20fc:	87da                	mv	a5,s6
    20fe:	8766                	mv	a4,s9
    2100:	86a6                	mv	a3,s1
    2102:	8522                	mv	a0,s0
    2104:	dd5fe0ef          	jal	ra,ed8 <fmt_fp>
    2108:	8daa                	mv	s11,a0
    210a:	fa0559e3          	bgez	a0,20bc <printf_core+0x5e2>
    210e:	bf55                	j	20c2 <printf_core+0x5e8>
    2110:	834e                	mv	t1,s3
    2112:	09f10613          	addi	a2,sp,159
    2116:	b379                	j	1ea4 <printf_core+0x3ca>
    2118:	8d32                	mv	s10,a2
    211a:	b369                	j	1ea4 <printf_core+0x3ca>
    211c:	c4041ee3          	bnez	s0,1d78 <printf_core+0x29e>
    2120:	c40b8be3          	beqz	s7,1d76 <printf_core+0x29c>
    2124:	4405                	li	s0,1
    2126:	44a9                	li	s1,10
    2128:	00241793          	slli	a5,s0,0x2
    212c:	97d6                	add	a5,a5,s5
    212e:	438c                	lw	a1,0(a5)
    2130:	ed81                	bnez	a1,2148 <printf_core+0x66e>
    2132:	4729                	li	a4,10
    2134:	00241793          	slli	a5,s0,0x2
    2138:	97d6                	add	a5,a5,s5
    213a:	439c                	lw	a5,0(a5)
    213c:	ba0795e3          	bnez	a5,1ce6 <printf_core+0x20c>
    2140:	0405                	addi	s0,s0,1
    2142:	fee419e3          	bne	s0,a4,2134 <printf_core+0x65a>
    2146:	a819                	j	215c <printf_core+0x682>
    2148:	6782                	ld	a5,0(sp)
    214a:	00441513          	slli	a0,s0,0x4
    214e:	8652                	mv	a2,s4
    2150:	953e                	add	a0,a0,a5
    2152:	0405                	addi	s0,s0,1
    2154:	bdffe0ef          	jal	ra,d32 <pop_arg>
    2158:	fc9418e3          	bne	s0,s1,2128 <printf_core+0x64e>
    215c:	4905                	li	s2,1
    215e:	b929                	j	1d78 <printf_core+0x29e>

0000000000002160 <vfprintf>:
    2160:	7149                	addi	sp,sp,-368
    2162:	fa5a                	sd	s6,304(sp)
    2164:	f65e                	sd	s7,296(sp)
    2166:	f262                	sd	s8,288(sp)
    2168:	08010b93          	addi	s7,sp,128
    216c:	00810c13          	addi	s8,sp,8
    2170:	8b0a                	mv	s6,sp
    2172:	f2a2                	sd	s0,352(sp)
    2174:	e032                	sd	a2,0(sp)
    2176:	842a                	mv	s0,a0
    2178:	8762                	mv	a4,s8
    217a:	86de                	mv	a3,s7
    217c:	865a                	mv	a2,s6
    217e:	4501                	li	a0,0
    2180:	eea6                	sd	s1,344(sp)
    2182:	fe56                	sd	s5,312(sp)
    2184:	f686                	sd	ra,360(sp)
    2186:	eaca                	sd	s2,336(sp)
    2188:	e6ce                	sd	s3,328(sp)
    218a:	e2d2                	sd	s4,320(sp)
    218c:	8aae                	mv	s5,a1
    218e:	e402                	sd	zero,8(sp)
    2190:	e802                	sd	zero,16(sp)
    2192:	ec02                	sd	zero,24(sp)
    2194:	f002                	sd	zero,32(sp)
    2196:	f402                	sd	zero,40(sp)
    2198:	943ff0ef          	jal	ra,1ada <printf_core>
    219c:	54fd                	li	s1,-1
    219e:	0a054363          	bltz	a0,2244 <vfprintf+0xe4>
    21a2:	08c42783          	lw	a5,140(s0)
    21a6:	4981                	li	s3,0
    21a8:	0007c663          	bltz	a5,21b4 <vfprintf+0x54>
    21ac:	8522                	mv	a0,s0
    21ae:	339000ef          	jal	ra,2ce6 <__lockfile>
    21b2:	89aa                	mv	s3,a0
    21b4:	401c                	lw	a5,0(s0)
    21b6:	08842703          	lw	a4,136(s0)
    21ba:	0207fa13          	andi	s4,a5,32
    21be:	00e04563          	bgtz	a4,21c8 <vfprintf+0x68>
    21c2:	fdf7f793          	andi	a5,a5,-33
    21c6:	c01c                	sw	a5,0(s0)
    21c8:	703c                	ld	a5,96(s0)
    21ca:	ebd1                	bnez	a5,225e <vfprintf+0xfe>
    21cc:	181c                	addi	a5,sp,48
    21ce:	05843903          	ld	s2,88(s0)
    21d2:	ec3c                	sd	a5,88(s0)
    21d4:	05000793          	li	a5,80
    21d8:	f03c                	sd	a5,96(s0)
    21da:	02043023          	sd	zero,32(s0)
    21de:	02043c23          	sd	zero,56(s0)
    21e2:	02043423          	sd	zero,40(s0)
    21e6:	8522                	mv	a0,s0
    21e8:	4a7000ef          	jal	ra,2e8e <__towrite>
    21ec:	54fd                	li	s1,-1
    21ee:	e909                	bnez	a0,2200 <vfprintf+0xa0>
    21f0:	8762                	mv	a4,s8
    21f2:	86de                	mv	a3,s7
    21f4:	865a                	mv	a2,s6
    21f6:	85d6                	mv	a1,s5
    21f8:	8522                	mv	a0,s0
    21fa:	8e1ff0ef          	jal	ra,1ada <printf_core>
    21fe:	84aa                	mv	s1,a0
    2200:	02090463          	beqz	s2,2228 <vfprintf+0xc8>
    2204:	643c                	ld	a5,72(s0)
    2206:	4601                	li	a2,0
    2208:	4581                	li	a1,0
    220a:	8522                	mv	a0,s0
    220c:	9782                	jalr	a5
    220e:	741c                	ld	a5,40(s0)
    2210:	e391                	bnez	a5,2214 <vfprintf+0xb4>
    2212:	54fd                	li	s1,-1
    2214:	05243c23          	sd	s2,88(s0)
    2218:	06043023          	sd	zero,96(s0)
    221c:	02043023          	sd	zero,32(s0)
    2220:	02043c23          	sd	zero,56(s0)
    2224:	02043423          	sd	zero,40(s0)
    2228:	401c                	lw	a5,0(s0)
    222a:	0207f713          	andi	a4,a5,32
    222e:	c311                	beqz	a4,2232 <vfprintf+0xd2>
    2230:	54fd                	li	s1,-1
    2232:	00fa6a33          	or	s4,s4,a5
    2236:	01442023          	sw	s4,0(s0)
    223a:	00098563          	beqz	s3,2244 <vfprintf+0xe4>
    223e:	8522                	mv	a0,s0
    2240:	343000ef          	jal	ra,2d82 <__unlockfile>
    2244:	70b6                	ld	ra,360(sp)
    2246:	7416                	ld	s0,352(sp)
    2248:	6956                	ld	s2,336(sp)
    224a:	69b6                	ld	s3,328(sp)
    224c:	6a16                	ld	s4,320(sp)
    224e:	7af2                	ld	s5,312(sp)
    2250:	7b52                	ld	s6,304(sp)
    2252:	7bb2                	ld	s7,296(sp)
    2254:	7c12                	ld	s8,288(sp)
    2256:	8526                	mv	a0,s1
    2258:	64f6                	ld	s1,344(sp)
    225a:	6175                	addi	sp,sp,368
    225c:	8082                	ret
    225e:	02043903          	ld	s2,32(s0)
    2262:	f80902e3          	beqz	s2,21e6 <vfprintf+0x86>
    2266:	4901                	li	s2,0
    2268:	b761                	j	21f0 <vfprintf+0x90>

000000000000226a <memcpy>:
    226a:	0035f793          	andi	a5,a1,3
    226e:	40078363          	beqz	a5,2674 <memcpy+0x40a>
    2272:	22060b63          	beqz	a2,24a8 <memcpy+0x23e>
    2276:	8e2a                	mv	t3,a0
    2278:	a019                	j	227e <memcpy+0x14>
    227a:	22060663          	beqz	a2,24a6 <memcpy+0x23c>
    227e:	0005c703          	lbu	a4,0(a1) # ffffffff80000000 <__BSS_END__+0xffffffff7fff77c0>
    2282:	0585                	addi	a1,a1,1
    2284:	0035f793          	andi	a5,a1,3
    2288:	00ee0023          	sb	a4,0(t3) # 3b9ad000 <__BSS_END__+0x3b9a47c0>
    228c:	167d                	addi	a2,a2,-1
    228e:	0e05                	addi	t3,t3,1
    2290:	f7ed                	bnez	a5,227a <memcpy+0x10>
    2292:	003e7693          	andi	a3,t3,3
    2296:	87f2                	mv	a5,t3
    2298:	20068963          	beqz	a3,24aa <memcpy+0x240>
    229c:	7139                	addi	sp,sp,-64
    229e:	fc22                	sd	s0,56(sp)
    22a0:	f826                	sd	s1,48(sp)
    22a2:	f44a                	sd	s2,40(sp)
    22a4:	f04e                	sd	s3,32(sp)
    22a6:	ec52                	sd	s4,24(sp)
    22a8:	e856                	sd	s5,16(sp)
    22aa:	e45a                	sd	s6,8(sp)
    22ac:	e05e                	sd	s7,0(sp)
    22ae:	47fd                	li	a5,31
    22b0:	0ac7f763          	bgeu	a5,a2,235e <memcpy+0xf4>
    22b4:	4709                	li	a4,2
    22b6:	0005c803          	lbu	a6,0(a1)
    22ba:	419c                	lw	a5,0(a1)
    22bc:	30e68f63          	beq	a3,a4,25da <memcpy+0x370>
    22c0:	470d                	li	a4,3
    22c2:	28e68863          	beq	a3,a4,2552 <memcpy+0x2e8>
    22c6:	0015c883          	lbu	a7,1(a1)
    22ca:	0025c683          	lbu	a3,2(a1)
    22ce:	fec60713          	addi	a4,a2,-20
    22d2:	ff077393          	andi	t2,a4,-16
    22d6:	058d                	addi	a1,a1,3
    22d8:	003e0413          	addi	s0,t3,3
    22dc:	01338913          	addi	s2,t2,19
    22e0:	00475493          	srli	s1,a4,0x4
    22e4:	010e0023          	sb	a6,0(t3)
    22e8:	011e00a3          	sb	a7,1(t3)
    22ec:	00de0123          	sb	a3,2(t3)
    22f0:	9972                	add	s2,s2,t3
    22f2:	832e                	mv	t1,a1
    22f4:	8722                	mv	a4,s0
    22f6:	00132883          	lw	a7,1(t1)
    22fa:	00532803          	lw	a6,5(t1)
    22fe:	00932683          	lw	a3,9(t1)
    2302:	0187de1b          	srliw	t3,a5,0x18
    2306:	00d32783          	lw	a5,13(t1)
    230a:	0088929b          	slliw	t0,a7,0x8
    230e:	00881f9b          	slliw	t6,a6,0x8
    2312:	00869f1b          	slliw	t5,a3,0x8
    2316:	0188d89b          	srliw	a7,a7,0x18
    231a:	0188581b          	srliw	a6,a6,0x18
    231e:	0186d69b          	srliw	a3,a3,0x18
    2322:	00879e9b          	slliw	t4,a5,0x8
    2326:	005e6e33          	or	t3,t3,t0
    232a:	01f8e8b3          	or	a7,a7,t6
    232e:	01e86833          	or	a6,a6,t5
    2332:	01d6e6b3          	or	a3,a3,t4
    2336:	01c72023          	sw	t3,0(a4) # 2000 <printf_core+0x526>
    233a:	01172223          	sw	a7,4(a4)
    233e:	01072423          	sw	a6,8(a4)
    2342:	c754                	sw	a3,12(a4)
    2344:	0741                	addi	a4,a4,16
    2346:	0341                	addi	t1,t1,16
    2348:	fb2717e3          	bne	a4,s2,22f6 <memcpy+0x8c>
    234c:	00148793          	addi	a5,s1,1
    2350:	0792                	slli	a5,a5,0x4
    2352:	1635                	addi	a2,a2,-19
    2354:	40760633          	sub	a2,a2,t2
    2358:	00f40e33          	add	t3,s0,a5
    235c:	95be                	add	a1,a1,a5
    235e:	01067793          	andi	a5,a2,16
    2362:	00867713          	andi	a4,a2,8
    2366:	00467813          	andi	a6,a2,4
    236a:	00267693          	andi	a3,a2,2
    236e:	8a05                	andi	a2,a2,1
    2370:	34078163          	beqz	a5,26b2 <memcpy+0x448>
    2374:	00e5c783          	lbu	a5,14(a1)
    2378:	0005cb83          	lbu	s7,0(a1)
    237c:	0015cb03          	lbu	s6,1(a1)
    2380:	0025ca83          	lbu	s5,2(a1)
    2384:	0035ca03          	lbu	s4,3(a1)
    2388:	0045c983          	lbu	s3,4(a1)
    238c:	0055c903          	lbu	s2,5(a1)
    2390:	0065c483          	lbu	s1,6(a1)
    2394:	0075c403          	lbu	s0,7(a1)
    2398:	0085c383          	lbu	t2,8(a1)
    239c:	0095c283          	lbu	t0,9(a1)
    23a0:	00a5cf83          	lbu	t6,10(a1)
    23a4:	00b5cf03          	lbu	t5,11(a1)
    23a8:	00c5ce83          	lbu	t4,12(a1)
    23ac:	00d5c303          	lbu	t1,13(a1)
    23b0:	00f5c883          	lbu	a7,15(a1)
    23b4:	00fe0723          	sb	a5,14(t3)
    23b8:	017e0023          	sb	s7,0(t3)
    23bc:	016e00a3          	sb	s6,1(t3)
    23c0:	015e0123          	sb	s5,2(t3)
    23c4:	014e01a3          	sb	s4,3(t3)
    23c8:	013e0223          	sb	s3,4(t3)
    23cc:	012e02a3          	sb	s2,5(t3)
    23d0:	009e0323          	sb	s1,6(t3)
    23d4:	008e03a3          	sb	s0,7(t3)
    23d8:	007e0423          	sb	t2,8(t3)
    23dc:	005e04a3          	sb	t0,9(t3)
    23e0:	01fe0523          	sb	t6,10(t3)
    23e4:	01ee05a3          	sb	t5,11(t3)
    23e8:	01de0623          	sb	t4,12(t3)
    23ec:	006e06a3          	sb	t1,13(t3)
    23f0:	05c1                	addi	a1,a1,16
    23f2:	010e0793          	addi	a5,t3,16
    23f6:	011e07a3          	sb	a7,15(t3)
    23fa:	26070b63          	beqz	a4,2670 <memcpy+0x406>
    23fe:	0065c703          	lbu	a4,6(a1)
    2402:	0005c283          	lbu	t0,0(a1)
    2406:	0015cf83          	lbu	t6,1(a1)
    240a:	0025cf03          	lbu	t5,2(a1)
    240e:	0035ce83          	lbu	t4,3(a1)
    2412:	0045ce03          	lbu	t3,4(a1)
    2416:	0055c303          	lbu	t1,5(a1)
    241a:	0075c883          	lbu	a7,7(a1)
    241e:	00e78323          	sb	a4,6(a5)
    2422:	00578023          	sb	t0,0(a5)
    2426:	01f780a3          	sb	t6,1(a5)
    242a:	01e78123          	sb	t5,2(a5)
    242e:	01d781a3          	sb	t4,3(a5)
    2432:	01c78223          	sb	t3,4(a5)
    2436:	006782a3          	sb	t1,5(a5)
    243a:	05a1                	addi	a1,a1,8
    243c:	00878713          	addi	a4,a5,8
    2440:	011783a3          	sb	a7,7(a5)
    2444:	26080563          	beqz	a6,26ae <memcpy+0x444>
    2448:	0025c783          	lbu	a5,2(a1)
    244c:	0005c303          	lbu	t1,0(a1)
    2450:	0015c883          	lbu	a7,1(a1)
    2454:	0035c803          	lbu	a6,3(a1)
    2458:	00f70123          	sb	a5,2(a4)
    245c:	00670023          	sb	t1,0(a4)
    2460:	011700a3          	sb	a7,1(a4)
    2464:	0591                	addi	a1,a1,4
    2466:	00470793          	addi	a5,a4,4
    246a:	010701a3          	sb	a6,3(a4)
    246e:	1e068f63          	beqz	a3,266c <memcpy+0x402>
    2472:	0005c703          	lbu	a4,0(a1)
    2476:	0015c683          	lbu	a3,1(a1)
    247a:	0589                	addi	a1,a1,2
    247c:	00e78023          	sb	a4,0(a5)
    2480:	00d780a3          	sb	a3,1(a5)
    2484:	00278713          	addi	a4,a5,2
    2488:	c609                	beqz	a2,2492 <memcpy+0x228>
    248a:	0005c783          	lbu	a5,0(a1)
    248e:	00f70023          	sb	a5,0(a4)
    2492:	7462                	ld	s0,56(sp)
    2494:	74c2                	ld	s1,48(sp)
    2496:	7922                	ld	s2,40(sp)
    2498:	7982                	ld	s3,32(sp)
    249a:	6a62                	ld	s4,24(sp)
    249c:	6ac2                	ld	s5,16(sp)
    249e:	6b22                	ld	s6,8(sp)
    24a0:	6b82                	ld	s7,0(sp)
    24a2:	6121                	addi	sp,sp,64
    24a4:	8082                	ret
    24a6:	8082                	ret
    24a8:	8082                	ret
    24aa:	473d                	li	a4,15
    24ac:	04c77963          	bgeu	a4,a2,24fe <memcpy+0x294>
    24b0:	01c5e733          	or	a4,a1,t3
    24b4:	8b1d                	andi	a4,a4,7
    24b6:	ff060e93          	addi	t4,a2,-16
    24ba:	1a071f63          	bnez	a4,2678 <memcpy+0x40e>
    24be:	010eb713          	sltiu	a4,t4,16
    24c2:	00174713          	xori	a4,a4,1
    24c6:	0ff77713          	zext.b	a4,a4
    24ca:	1a070763          	beqz	a4,2678 <memcpy+0x40e>
    24ce:	004ede93          	srli	t4,t4,0x4
    24d2:	001e8313          	addi	t1,t4,1
    24d6:	872e                	mv	a4,a1
    24d8:	00873883          	ld	a7,8(a4)
    24dc:	00073803          	ld	a6,0(a4)
    24e0:	0685                	addi	a3,a3,1
    24e2:	0117b423          	sd	a7,8(a5)
    24e6:	0107b023          	sd	a6,0(a5)
    24ea:	0741                	addi	a4,a4,16
    24ec:	07c1                	addi	a5,a5,16
    24ee:	fe66e5e3          	bltu	a3,t1,24d8 <memcpy+0x26e>
    24f2:	001e8793          	addi	a5,t4,1
    24f6:	0792                	slli	a5,a5,0x4
    24f8:	8a3d                	andi	a2,a2,15
    24fa:	9e3e                	add	t3,t3,a5
    24fc:	95be                	add	a1,a1,a5
    24fe:	00867693          	andi	a3,a2,8
    2502:	00467713          	andi	a4,a2,4
    2506:	00267793          	andi	a5,a2,2
    250a:	8a05                	andi	a2,a2,1
    250c:	ca91                	beqz	a3,2520 <memcpy+0x2b6>
    250e:	0005a803          	lw	a6,0(a1)
    2512:	41d4                	lw	a3,4(a1)
    2514:	0e21                	addi	t3,t3,8
    2516:	05a1                	addi	a1,a1,8
    2518:	ff0e2c23          	sw	a6,-8(t3)
    251c:	fede2e23          	sw	a3,-4(t3)
    2520:	c711                	beqz	a4,252c <memcpy+0x2c2>
    2522:	4198                	lw	a4,0(a1)
    2524:	0e11                	addi	t3,t3,4
    2526:	0591                	addi	a1,a1,4
    2528:	feee2e23          	sw	a4,-4(t3)
    252c:	18078563          	beqz	a5,26b6 <memcpy+0x44c>
    2530:	0005c783          	lbu	a5,0(a1)
    2534:	0015c703          	lbu	a4,1(a1)
    2538:	0589                	addi	a1,a1,2
    253a:	00fe0023          	sb	a5,0(t3)
    253e:	00ee00a3          	sb	a4,1(t3)
    2542:	002e0793          	addi	a5,t3,2
    2546:	d22d                	beqz	a2,24a8 <memcpy+0x23e>
    2548:	0005c703          	lbu	a4,0(a1)
    254c:	00e78023          	sb	a4,0(a5)
    2550:	8082                	ret
    2552:	fec60713          	addi	a4,a2,-20
    2556:	ff077413          	andi	s0,a4,-16
    255a:	0585                	addi	a1,a1,1
    255c:	001e0493          	addi	s1,t3,1
    2560:	01140393          	addi	t2,s0,17
    2564:	00475913          	srli	s2,a4,0x4
    2568:	010e0023          	sb	a6,0(t3)
    256c:	93f2                	add	t2,t2,t3
    256e:	832e                	mv	t1,a1
    2570:	8726                	mv	a4,s1
    2572:	00332883          	lw	a7,3(t1)
    2576:	00732803          	lw	a6,7(t1)
    257a:	00b32683          	lw	a3,11(t1)
    257e:	0087de1b          	srliw	t3,a5,0x8
    2582:	00f32783          	lw	a5,15(t1)
    2586:	0188929b          	slliw	t0,a7,0x18
    258a:	01881f9b          	slliw	t6,a6,0x18
    258e:	01869f1b          	slliw	t5,a3,0x18
    2592:	0088d89b          	srliw	a7,a7,0x8
    2596:	0088581b          	srliw	a6,a6,0x8
    259a:	0086d69b          	srliw	a3,a3,0x8
    259e:	01879e9b          	slliw	t4,a5,0x18
    25a2:	005e6e33          	or	t3,t3,t0
    25a6:	01f8e8b3          	or	a7,a7,t6
    25aa:	01e86833          	or	a6,a6,t5
    25ae:	01d6e6b3          	or	a3,a3,t4
    25b2:	01c72023          	sw	t3,0(a4)
    25b6:	01172223          	sw	a7,4(a4)
    25ba:	01072423          	sw	a6,8(a4)
    25be:	c754                	sw	a3,12(a4)
    25c0:	0741                	addi	a4,a4,16
    25c2:	0341                	addi	t1,t1,16
    25c4:	fa7717e3          	bne	a4,t2,2572 <memcpy+0x308>
    25c8:	00190793          	addi	a5,s2,1
    25cc:	0792                	slli	a5,a5,0x4
    25ce:	163d                	addi	a2,a2,-17
    25d0:	8e01                	sub	a2,a2,s0
    25d2:	00f48e33          	add	t3,s1,a5
    25d6:	95be                	add	a1,a1,a5
    25d8:	b359                	j	235e <memcpy+0xf4>
    25da:	0015c683          	lbu	a3,1(a1)
    25de:	fec60713          	addi	a4,a2,-20
    25e2:	ff077393          	andi	t2,a4,-16
    25e6:	0589                	addi	a1,a1,2
    25e8:	002e0413          	addi	s0,t3,2
    25ec:	01238913          	addi	s2,t2,18
    25f0:	00475493          	srli	s1,a4,0x4
    25f4:	010e0023          	sb	a6,0(t3)
    25f8:	00de00a3          	sb	a3,1(t3)
    25fc:	9972                	add	s2,s2,t3
    25fe:	832e                	mv	t1,a1
    2600:	8722                	mv	a4,s0
    2602:	00232883          	lw	a7,2(t1)
    2606:	00632803          	lw	a6,6(t1)
    260a:	00a32683          	lw	a3,10(t1)
    260e:	0107de1b          	srliw	t3,a5,0x10
    2612:	00e32783          	lw	a5,14(t1)
    2616:	0108929b          	slliw	t0,a7,0x10
    261a:	01081f9b          	slliw	t6,a6,0x10
    261e:	01069f1b          	slliw	t5,a3,0x10
    2622:	0108d89b          	srliw	a7,a7,0x10
    2626:	0108581b          	srliw	a6,a6,0x10
    262a:	0106d69b          	srliw	a3,a3,0x10
    262e:	01079e9b          	slliw	t4,a5,0x10
    2632:	005e6e33          	or	t3,t3,t0
    2636:	01f8e8b3          	or	a7,a7,t6
    263a:	01e86833          	or	a6,a6,t5
    263e:	01d6e6b3          	or	a3,a3,t4
    2642:	01c72023          	sw	t3,0(a4)
    2646:	01172223          	sw	a7,4(a4)
    264a:	01072423          	sw	a6,8(a4)
    264e:	c754                	sw	a3,12(a4)
    2650:	0741                	addi	a4,a4,16
    2652:	0341                	addi	t1,t1,16
    2654:	fb2717e3          	bne	a4,s2,2602 <memcpy+0x398>
    2658:	00148793          	addi	a5,s1,1
    265c:	0792                	slli	a5,a5,0x4
    265e:	1639                	addi	a2,a2,-18
    2660:	40760633          	sub	a2,a2,t2
    2664:	00f40e33          	add	t3,s0,a5
    2668:	95be                	add	a1,a1,a5
    266a:	b9d5                	j	235e <memcpy+0xf4>
    266c:	873e                	mv	a4,a5
    266e:	bd29                	j	2488 <memcpy+0x21e>
    2670:	873e                	mv	a4,a5
    2672:	bbc9                	j	2444 <memcpy+0x1da>
    2674:	8e2a                	mv	t3,a0
    2676:	b931                	j	2292 <memcpy+0x28>
    2678:	004ede93          	srli	t4,t4,0x4
    267c:	001e8f13          	addi	t5,t4,1
    2680:	0f12                	slli	t5,t5,0x4
    2682:	9f2e                	add	t5,t5,a1
    2684:	87ae                	mv	a5,a1
    2686:	8772                	mv	a4,t3
    2688:	0007a303          	lw	t1,0(a5)
    268c:	0047a883          	lw	a7,4(a5)
    2690:	0087a803          	lw	a6,8(a5)
    2694:	47d4                	lw	a3,12(a5)
    2696:	00672023          	sw	t1,0(a4)
    269a:	01172223          	sw	a7,4(a4)
    269e:	01072423          	sw	a6,8(a4)
    26a2:	c754                	sw	a3,12(a4)
    26a4:	07c1                	addi	a5,a5,16
    26a6:	0741                	addi	a4,a4,16
    26a8:	feff10e3          	bne	t5,a5,2688 <memcpy+0x41e>
    26ac:	b599                	j	24f2 <memcpy+0x288>
    26ae:	87ba                	mv	a5,a4
    26b0:	bb7d                	j	246e <memcpy+0x204>
    26b2:	87f2                	mv	a5,t3
    26b4:	b399                	j	23fa <memcpy+0x190>
    26b6:	87f2                	mv	a5,t3
    26b8:	b579                	j	2546 <memcpy+0x2dc>

00000000000026ba <memset>:
    26ba:	c679                	beqz	a2,2788 <memset+0xce>
    26bc:	0ff5f793          	zext.b	a5,a1
    26c0:	00f50023          	sb	a5,0(a0)
    26c4:	00c50733          	add	a4,a0,a2
    26c8:	fef70fa3          	sb	a5,-1(a4)
    26cc:	4689                	li	a3,2
    26ce:	0ac6fd63          	bgeu	a3,a2,2788 <memset+0xce>
    26d2:	00f500a3          	sb	a5,1(a0)
    26d6:	00f50123          	sb	a5,2(a0)
    26da:	fef70f23          	sb	a5,-2(a4)
    26de:	fef70ea3          	sb	a5,-3(a4)
    26e2:	4699                	li	a3,6
    26e4:	0ac6f263          	bgeu	a3,a2,2788 <memset+0xce>
    26e8:	00f501a3          	sb	a5,3(a0)
    26ec:	fef70e23          	sb	a5,-4(a4)
    26f0:	46a1                	li	a3,8
    26f2:	08c6fb63          	bgeu	a3,a2,2788 <memset+0xce>
    26f6:	0ff5f593          	zext.b	a1,a1
    26fa:	0085979b          	slliw	a5,a1,0x8
    26fe:	40a00733          	neg	a4,a0
    2702:	8b0d                	andi	a4,a4,3
    2704:	9fad                	addw	a5,a5,a1
    2706:	8e19                	sub	a2,a2,a4
    2708:	0107959b          	slliw	a1,a5,0x10
    270c:	9fad                	addw	a5,a5,a1
    270e:	972a                	add	a4,a4,a0
    2710:	9a71                	andi	a2,a2,-4
    2712:	c31c                	sw	a5,0(a4)
    2714:	00c705b3          	add	a1,a4,a2
    2718:	fef5ae23          	sw	a5,-4(a1)
    271c:	06c6f663          	bgeu	a3,a2,2788 <memset+0xce>
    2720:	c35c                	sw	a5,4(a4)
    2722:	c71c                	sw	a5,8(a4)
    2724:	fef5aa23          	sw	a5,-12(a1)
    2728:	fef5ac23          	sw	a5,-8(a1)
    272c:	46e1                	li	a3,24
    272e:	04c6fd63          	bgeu	a3,a2,2788 <memset+0xce>
    2732:	00477813          	andi	a6,a4,4
    2736:	c75c                	sw	a5,12(a4)
    2738:	cb1c                	sw	a5,16(a4)
    273a:	cb5c                	sw	a5,20(a4)
    273c:	cf1c                	sw	a5,24(a4)
    273e:	0861                	addi	a6,a6,24
    2740:	02079893          	slli	a7,a5,0x20
    2744:	02079693          	slli	a3,a5,0x20
    2748:	0208d893          	srli	a7,a7,0x20
    274c:	fef5a223          	sw	a5,-28(a1)
    2750:	fef5a423          	sw	a5,-24(a1)
    2754:	fef5a623          	sw	a5,-20(a1)
    2758:	fef5a823          	sw	a5,-16(a1)
    275c:	41060633          	sub	a2,a2,a6
    2760:	47fd                	li	a5,31
    2762:	9742                	add	a4,a4,a6
    2764:	0116e6b3          	or	a3,a3,a7
    2768:	02c7f063          	bgeu	a5,a2,2788 <memset+0xce>
    276c:	1601                	addi	a2,a2,-32
    276e:	fe067793          	andi	a5,a2,-32
    2772:	02078793          	addi	a5,a5,32
    2776:	97ba                	add	a5,a5,a4
    2778:	e314                	sd	a3,0(a4)
    277a:	e714                	sd	a3,8(a4)
    277c:	eb14                	sd	a3,16(a4)
    277e:	ef14                	sd	a3,24(a4)
    2780:	02070713          	addi	a4,a4,32
    2784:	fef71ae3          	bne	a4,a5,2778 <memset+0xbe>
    2788:	8082                	ret

000000000000278a <strnlen>:
    278a:	1101                	addi	sp,sp,-32
    278c:	e822                	sd	s0,16(sp)
    278e:	862e                	mv	a2,a1
    2790:	842e                	mv	s0,a1
    2792:	4581                	li	a1,0
    2794:	e426                	sd	s1,8(sp)
    2796:	ec06                	sd	ra,24(sp)
    2798:	84aa                	mv	s1,a0
    279a:	061000ef          	jal	ra,2ffa <memchr>
    279e:	c519                	beqz	a0,27ac <strnlen+0x22>
    27a0:	60e2                	ld	ra,24(sp)
    27a2:	6442                	ld	s0,16(sp)
    27a4:	8d05                	sub	a0,a0,s1
    27a6:	64a2                	ld	s1,8(sp)
    27a8:	6105                	addi	sp,sp,32
    27aa:	8082                	ret
    27ac:	60e2                	ld	ra,24(sp)
    27ae:	8522                	mv	a0,s0
    27b0:	6442                	ld	s0,16(sp)
    27b2:	64a2                	ld	s1,8(sp)
    27b4:	6105                	addi	sp,sp,32
    27b6:	8082                	ret

00000000000027b8 <__lock>:
    27b8:	00006617          	auipc	a2,0x6
    27bc:	a4360603          	lb	a2,-1469(a2) # 81fb <__libc+0x3>
    27c0:	872a                	mv	a4,a0
    27c2:	c279                	beqz	a2,2888 <__lock+0xd0>
    27c4:	800006b7          	lui	a3,0x80000
    27c8:	4581                	li	a1,0
    27ca:	0685                	addi	a3,a3,1
    27cc:	160727af          	lr.w.aqrl	a5,(a4)
    27d0:	00b79563          	bne	a5,a1,27da <__lock+0x22>
    27d4:	1ed7252f          	sc.w.aqrl	a0,a3,(a4)
    27d8:	f975                	bnez	a0,27cc <__lock+0x14>
    27da:	2781                	sext.w	a5,a5
    27dc:	00065663          	bgez	a2,27e8 <__lock+0x30>
    27e0:	00006697          	auipc	a3,0x6
    27e4:	a0068da3          	sb	zero,-1509(a3) # 81fb <__libc+0x3>
    27e8:	c3c5                	beqz	a5,2888 <__lock+0xd0>
    27ea:	800006b7          	lui	a3,0x80000
    27ee:	45a9                	li	a1,10
    27f0:	fff6c813          	not	a6,a3
    27f4:	0016861b          	addiw	a2,a3,1
    27f8:	86be                	mv	a3,a5
    27fa:	0007d463          	bgez	a5,2802 <__lock+0x4a>
    27fe:	00f806bb          	addw	a3,a6,a5
    2802:	00d6053b          	addw	a0,a2,a3
    2806:	160727af          	lr.w.aqrl	a5,(a4)
    280a:	00d79663          	bne	a5,a3,2816 <__lock+0x5e>
    280e:	1ea728af          	sc.w.aqrl	a7,a0,(a4)
    2812:	fe089ae3          	bnez	a7,2806 <__lock+0x4e>
    2816:	2781                	sext.w	a5,a5
    2818:	06f68863          	beq	a3,a5,2888 <__lock+0xd0>
    281c:	35fd                	addiw	a1,a1,-1
    281e:	fde9                	bnez	a1,27f8 <__lock+0x40>
    2820:	431c                	lw	a5,0(a4)
    2822:	0007861b          	sext.w	a2,a5
    2826:	2785                	addiw	a5,a5,1
    2828:	160726af          	lr.w.aqrl	a3,(a4)
    282c:	00c69563          	bne	a3,a2,2836 <__lock+0x7e>
    2830:	1ef725af          	sc.w.aqrl	a1,a5,(a4)
    2834:	f9f5                	bnez	a1,2828 <__lock+0x70>
    2836:	2681                	sext.w	a3,a3
    2838:	fed614e3          	bne	a2,a3,2820 <__lock+0x68>
    283c:	80000837          	lui	a6,0x80000
    2840:	fda00313          	li	t1,-38
    2844:	fff84e13          	not	t3,a6
    2848:	86be                	mv	a3,a5
    284a:	0207d363          	bgez	a5,2870 <__lock+0xb8>
    284e:	06200893          	li	a7,98
    2852:	853a                	mv	a0,a4
    2854:	08000593          	li	a1,128
    2858:	863e                	mv	a2,a5
    285a:	4681                	li	a3,0
    285c:	00000073          	ecall
    2860:	00651663          	bne	a0,t1,286c <__lock+0xb4>
    2864:	853a                	mv	a0,a4
    2866:	4581                	li	a1,0
    2868:	00000073          	ecall
    286c:	00fe06bb          	addw	a3,t3,a5
    2870:	00d8063b          	addw	a2,a6,a3
    2874:	160727af          	lr.w.aqrl	a5,(a4)
    2878:	00d79563          	bne	a5,a3,2882 <__lock+0xca>
    287c:	1ec725af          	sc.w.aqrl	a1,a2,(a4)
    2880:	f9f5                	bnez	a1,2874 <__lock+0xbc>
    2882:	2781                	sext.w	a5,a5
    2884:	fcf692e3          	bne	a3,a5,2848 <__lock+0x90>
    2888:	8082                	ret

000000000000288a <__unlock>:
    288a:	4118                	lw	a4,0(a0)
    288c:	87aa                	mv	a5,a0
    288e:	04075a63          	bgez	a4,28e2 <__unlock+0x58>
    2892:	800005b7          	lui	a1,0x80000
    2896:	fff5c593          	not	a1,a1
    289a:	4398                	lw	a4,0(a5)
    289c:	0007069b          	sext.w	a3,a4
    28a0:	9f2d                	addw	a4,a4,a1
    28a2:	1607a62f          	lr.w.aqrl	a2,(a5)
    28a6:	00d61563          	bne	a2,a3,28b0 <__unlock+0x26>
    28aa:	1ee7a52f          	sc.w.aqrl	a0,a4,(a5)
    28ae:	f975                	bnez	a0,28a2 <__unlock+0x18>
    28b0:	0006071b          	sext.w	a4,a2
    28b4:	fee693e3          	bne	a3,a4,289a <__unlock+0x10>
    28b8:	80000737          	lui	a4,0x80000
    28bc:	0705                	addi	a4,a4,1
    28be:	02e68263          	beq	a3,a4,28e2 <__unlock+0x58>
    28c2:	06200893          	li	a7,98
    28c6:	853e                	mv	a0,a5
    28c8:	08100593          	li	a1,129
    28cc:	4605                	li	a2,1
    28ce:	00000073          	ecall
    28d2:	fda00713          	li	a4,-38
    28d6:	00e51663          	bne	a0,a4,28e2 <__unlock+0x58>
    28da:	853e                	mv	a0,a5
    28dc:	4585                	li	a1,1
    28de:	00000073          	ecall
    28e2:	8082                	ret

00000000000028e4 <pthread_sigmask>:
    28e4:	c589                	beqz	a1,28ee <pthread_sigmask+0xa>
    28e6:	4709                	li	a4,2
    28e8:	47d9                	li	a5,22
    28ea:	02a76163          	bltu	a4,a0,290c <pthread_sigmask+0x28>
    28ee:	08700893          	li	a7,135
    28f2:	46a1                	li	a3,8
    28f4:	00000073          	ecall
    28f8:	40a007bb          	negw	a5,a0
    28fc:	eb81                	bnez	a5,290c <pthread_sigmask+0x28>
    28fe:	c619                	beqz	a2,290c <pthread_sigmask+0x28>
    2900:	6214                	ld	a3,0(a2)
    2902:	5765                	li	a4,-7
    2904:	077e                	slli	a4,a4,0x1f
    2906:	177d                	addi	a4,a4,-1
    2908:	8f75                	and	a4,a4,a3
    290a:	e218                	sd	a4,0(a2)
    290c:	853e                	mv	a0,a5
    290e:	8082                	ret

0000000000002910 <getpid>:
    2910:	0ac00893          	li	a7,172
    2914:	00000073          	ecall
    2918:	2501                	sext.w	a0,a0
    291a:	8082                	ret

000000000000291c <__init_tp>:
    291c:	1141                	addi	sp,sp,-16
    291e:	e022                	sd	s0,0(sp)
    2920:	e406                	sd	ra,8(sp)
    2922:	842a                	mv	s0,a0
    2924:	e108                	sd	a0,0(a0)
    2926:	0c850513          	addi	a0,a0,200
    292a:	7bc000ef          	jal	ra,30e6 <__set_thread_area>
    292e:	04054763          	bltz	a0,297c <__init_tp+0x60>
    2932:	e511                	bnez	a0,293e <__init_tp+0x22>
    2934:	4785                	li	a5,1
    2936:	00006717          	auipc	a4,0x6
    293a:	8cf70123          	sb	a5,-1854(a4) # 81f8 <__libc>
    293e:	4789                	li	a5,2
    2940:	d41c                	sw	a5,40(s0)
    2942:	06000893          	li	a7,96
    2946:	00006517          	auipc	a0,0x6
    294a:	d5250513          	addi	a0,a0,-686 # 8698 <__thread_list_lock>
    294e:	00000073          	ecall
    2952:	00006797          	auipc	a5,0x6
    2956:	8de78793          	addi	a5,a5,-1826 # 8230 <__libc+0x38>
    295a:	ec5c                	sd	a5,152(s0)
    295c:	07840793          	addi	a5,s0,120
    2960:	fc3c                	sd	a5,120(s0)
    2962:	00006797          	auipc	a5,0x6
    2966:	8867b783          	ld	a5,-1914(a5) # 81e8 <__sysinfo>
    296a:	d008                	sw	a0,32(s0)
    296c:	ec1c                	sd	a5,24(s0)
    296e:	e400                	sd	s0,8(s0)
    2970:	e800                	sd	s0,16(s0)
    2972:	4501                	li	a0,0
    2974:	60a2                	ld	ra,8(sp)
    2976:	6402                	ld	s0,0(sp)
    2978:	0141                	addi	sp,sp,16
    297a:	8082                	ret
    297c:	557d                	li	a0,-1
    297e:	bfdd                	j	2974 <__init_tp+0x58>

0000000000002980 <__copy_tls>:
    2980:	7139                	addi	sp,sp,-64
    2982:	ec4e                	sd	s3,24(sp)
    2984:	00006997          	auipc	s3,0x6
    2988:	87498993          	addi	s3,s3,-1932 # 81f8 <__libc>
    298c:	0289b783          	ld	a5,40(s3)
    2990:	f426                	sd	s1,40(sp)
    2992:	0189b483          	ld	s1,24(s3)
    2996:	078e                	slli	a5,a5,0x3
    2998:	f3800713          	li	a4,-200
    299c:	14e1                	addi	s1,s1,-8
    299e:	8c9d                	sub	s1,s1,a5
    29a0:	0209b783          	ld	a5,32(s3)
    29a4:	8f09                	sub	a4,a4,a0
    29a6:	f04a                	sd	s2,32(sp)
    29a8:	17fd                	addi	a5,a5,-1
    29aa:	8ff9                	and	a5,a5,a4
    29ac:	0109b903          	ld	s2,16(s3)
    29b0:	f822                	sd	s0,48(sp)
    29b2:	e456                	sd	s5,8(sp)
    29b4:	94aa                	add	s1,s1,a0
    29b6:	00f50433          	add	s0,a0,a5
    29ba:	6a85                	lui	s5,0x1
    29bc:	e852                	sd	s4,16(sp)
    29be:	e05a                	sd	s6,0(sp)
    29c0:	fc06                	sd	ra,56(sp)
    29c2:	0c840b13          	addi	s6,s0,200
    29c6:	00848a13          	addi	s4,s1,8
    29ca:	800a8a93          	addi	s5,s5,-2048 # 800 <main+0x94>
    29ce:	02091163          	bnez	s2,29f0 <__copy_tls+0x70>
    29d2:	0289b783          	ld	a5,40(s3)
    29d6:	70e2                	ld	ra,56(sp)
    29d8:	8522                	mv	a0,s0
    29da:	e09c                	sd	a5,0(s1)
    29dc:	e064                	sd	s1,192(s0)
    29de:	7442                	ld	s0,48(sp)
    29e0:	74a2                	ld	s1,40(sp)
    29e2:	7902                	ld	s2,32(sp)
    29e4:	69e2                	ld	s3,24(sp)
    29e6:	6a42                	ld	s4,16(sp)
    29e8:	6aa2                	ld	s5,8(sp)
    29ea:	6b02                	ld	s6,0(sp)
    29ec:	6121                	addi	sp,sp,64
    29ee:	8082                	ret
    29f0:	02893783          	ld	a5,40(s2)
    29f4:	00893583          	ld	a1,8(s2)
    29f8:	0a21                	addi	s4,s4,8
    29fa:	97da                	add	a5,a5,s6
    29fc:	97d6                	add	a5,a5,s5
    29fe:	fefa3c23          	sd	a5,-8(s4)
    2a02:	02893503          	ld	a0,40(s2)
    2a06:	01093603          	ld	a2,16(s2)
    2a0a:	955a                	add	a0,a0,s6
    2a0c:	85fff0ef          	jal	ra,226a <memcpy>
    2a10:	00093903          	ld	s2,0(s2)
    2a14:	bf6d                	j	29ce <__copy_tls+0x4e>

0000000000002a16 <__init_tls>:
    2a16:	01853e83          	ld	t4,24(a0)
    2a1a:	00005317          	auipc	t1,0x5
    2a1e:	6ea30313          	addi	t1,t1,1770 # 8104 <__default_stacksize>
    2a22:	02853803          	ld	a6,40(a0)
    2a26:	00032583          	lw	a1,0(t1)
    2a2a:	1141                	addi	sp,sp,-16
    2a2c:	6474e8b7          	lui	a7,0x6474e
    2a30:	e406                	sd	ra,8(sp)
    2a32:	e022                	sd	s0,0(sp)
    2a34:	87f6                	mv	a5,t4
    2a36:	4e01                	li	t3,0
    2a38:	4701                	li	a4,0
    2a3a:	4681                	li	a3,0
    2a3c:	4f99                	li	t6,6
    2a3e:	4289                	li	t0,2
    2a40:	00005f17          	auipc	t5,0x5
    2a44:	6e0f3f03          	ld	t5,1760(t5) # 8120 <_GLOBAL_OFFSET_TABLE_+0x8>
    2a48:	439d                	li	t2,7
    2a4a:	55188893          	addi	a7,a7,1361 # 6474e551 <__BSS_END__+0x64745d11>
    2a4e:	008000b7          	lui	ra,0x800
    2a52:	0a081263          	bnez	a6,2af6 <__init_tls+0xe0>
    2a56:	000e0463          	beqz	t3,2a5e <__init_tls+0x48>
    2a5a:	00b32023          	sw	a1,0(t1)
    2a5e:	00006797          	auipc	a5,0x6
    2a62:	d9278793          	addi	a5,a5,-622 # 87f0 <main_tls>
    2a66:	00005617          	auipc	a2,0x5
    2a6a:	79260613          	addi	a2,a2,1938 # 81f8 <__libc>
    2a6e:	ce89                	beqz	a3,2a88 <__init_tls+0x72>
    2a70:	6a8c                	ld	a1,16(a3)
    2a72:	ea1c                	sd	a5,16(a2)
    2a74:	972e                	add	a4,a4,a1
    2a76:	e798                	sd	a4,8(a5)
    2a78:	7298                	ld	a4,32(a3)
    2a7a:	eb98                	sd	a4,16(a5)
    2a7c:	7698                	ld	a4,40(a3)
    2a7e:	ef98                	sd	a4,24(a5)
    2a80:	7a98                	ld	a4,48(a3)
    2a82:	f398                	sd	a4,32(a5)
    2a84:	4705                	li	a4,1
    2a86:	f618                	sd	a4,40(a2)
    2a88:	0187b803          	ld	a6,24(a5)
    2a8c:	6794                	ld	a3,8(a5)
    2a8e:	738c                	ld	a1,32(a5)
    2a90:	00d80733          	add	a4,a6,a3
    2a94:	fff58513          	addi	a0,a1,-1 # ffffffff7fffffff <__BSS_END__+0xffffffff7fff77bf>
    2a98:	40e00733          	neg	a4,a4
    2a9c:	8f69                	and	a4,a4,a0
    2a9e:	8ee9                	and	a3,a3,a0
    2aa0:	9742                	add	a4,a4,a6
    2aa2:	ef98                	sd	a4,24(a5)
    2aa4:	f794                	sd	a3,40(a5)
    2aa6:	451d                	li	a0,7
    2aa8:	00b56463          	bltu	a0,a1,2ab0 <__init_tls+0x9a>
    2aac:	45a1                	li	a1,8
    2aae:	f38c                	sd	a1,32(a5)
    2ab0:	739c                	ld	a5,32(a5)
    2ab2:	00006517          	auipc	a0,0x6
    2ab6:	bee50513          	addi	a0,a0,-1042 # 86a0 <builtin_tls>
    2aba:	0df78593          	addi	a1,a5,223
    2abe:	95b6                	add	a1,a1,a3
    2ac0:	95ba                	add	a1,a1,a4
    2ac2:	99e1                	andi	a1,a1,-8
    2ac4:	f21c                	sd	a5,32(a2)
    2ac6:	ee0c                	sd	a1,24(a2)
    2ac8:	15000793          	li	a5,336
    2acc:	00b7fc63          	bgeu	a5,a1,2ae4 <__init_tls+0xce>
    2ad0:	0de00893          	li	a7,222
    2ad4:	4501                	li	a0,0
    2ad6:	460d                	li	a2,3
    2ad8:	02200693          	li	a3,34
    2adc:	577d                	li	a4,-1
    2ade:	4781                	li	a5,0
    2ae0:	00000073          	ecall
    2ae4:	e9dff0ef          	jal	ra,2980 <__copy_tls>
    2ae8:	e35ff0ef          	jal	ra,291c <__init_tp>
    2aec:	04055b63          	bgez	a0,2b42 <__init_tls+0x12c>
    2af0:	00000023          	sb	zero,0(zero) # 0 <exit-0x508>
    2af4:	9002                	ebreak
    2af6:	4390                	lw	a2,0(a5)
    2af8:	01f61963          	bne	a2,t6,2b0a <__init_tls+0xf4>
    2afc:	6b98                	ld	a4,16(a5)
    2afe:	40ee8733          	sub	a4,t4,a4
    2b02:	7110                	ld	a2,32(a0)
    2b04:	187d                	addi	a6,a6,-1
    2b06:	97b2                	add	a5,a5,a2
    2b08:	b7a9                	j	2a52 <__init_tls+0x3c>
    2b0a:	02560463          	beq	a2,t0,2b32 <__init_tls+0x11c>
    2b0e:	02760863          	beq	a2,t2,2b3e <__init_tls+0x128>
    2b12:	ff1618e3          	bne	a2,a7,2b02 <__init_tls+0xec>
    2b16:	7790                	ld	a2,40(a5)
    2b18:	02059413          	slli	s0,a1,0x20
    2b1c:	9001                	srli	s0,s0,0x20
    2b1e:	fec472e3          	bgeu	s0,a2,2b02 <__init_tls+0xec>
    2b22:	00c0f463          	bgeu	ra,a2,2b2a <__init_tls+0x114>
    2b26:	00800637          	lui	a2,0x800
    2b2a:	0006059b          	sext.w	a1,a2
    2b2e:	4e05                	li	t3,1
    2b30:	bfc9                	j	2b02 <__init_tls+0xec>
    2b32:	fc0f08e3          	beqz	t5,2b02 <__init_tls+0xec>
    2b36:	6b98                	ld	a4,16(a5)
    2b38:	40ef0733          	sub	a4,t5,a4
    2b3c:	b7d9                	j	2b02 <__init_tls+0xec>
    2b3e:	86be                	mv	a3,a5
    2b40:	b7c9                	j	2b02 <__init_tls+0xec>
    2b42:	60a2                	ld	ra,8(sp)
    2b44:	6402                	ld	s0,0(sp)
    2b46:	0141                	addi	sp,sp,16
    2b48:	8082                	ret

0000000000002b4a <__errno_location>:
    2b4a:	8512                	mv	a0,tp
    2b4c:	f5c50513          	addi	a0,a0,-164
    2b50:	8082                	ret

0000000000002b52 <__strerror_l>:
    2b52:	08300793          	li	a5,131
    2b56:	00a7f363          	bgeu	a5,a0,2b5c <__strerror_l+0xa>
    2b5a:	4501                	li	a0,0
    2b5c:	0506                	slli	a0,a0,0x1
    2b5e:	00003797          	auipc	a5,0x3
    2b62:	b9278793          	addi	a5,a5,-1134 # 56f0 <errmsgidx>
    2b66:	97aa                	add	a5,a5,a0
    2b68:	0007d783          	lhu	a5,0(a5)
    2b6c:	758c                	ld	a1,40(a1)
    2b6e:	00003517          	auipc	a0,0x3
    2b72:	c8a50513          	addi	a0,a0,-886 # 57f8 <errmsgstr>
    2b76:	953e                	add	a0,a0,a5
    2b78:	a089                	j	2bba <__lctrans>

0000000000002b7a <strerror>:
    2b7a:	8792                	mv	a5,tp
    2b7c:	fd07b583          	ld	a1,-48(a5)
    2b80:	bfc9                	j	2b52 <__strerror_l>

0000000000002b82 <_Exit>:
    2b82:	87aa                	mv	a5,a0
    2b84:	05e00893          	li	a7,94
    2b88:	00000073          	ecall
    2b8c:	05d00893          	li	a7,93
    2b90:	853e                	mv	a0,a5
    2b92:	bfdd                	j	2b88 <_Exit+0x6>

0000000000002b94 <__syscall_ret>:
    2b94:	1141                	addi	sp,sp,-16
    2b96:	e022                	sd	s0,0(sp)
    2b98:	e406                	sd	ra,8(sp)
    2b9a:	77fd                	lui	a5,0xfffff
    2b9c:	842a                	mv	s0,a0
    2b9e:	00a7e663          	bltu	a5,a0,2baa <__syscall_ret+0x16>
    2ba2:	60a2                	ld	ra,8(sp)
    2ba4:	6402                	ld	s0,0(sp)
    2ba6:	0141                	addi	sp,sp,16
    2ba8:	8082                	ret
    2baa:	fa1ff0ef          	jal	ra,2b4a <__errno_location>
    2bae:	4080043b          	negw	s0,s0
    2bb2:	c100                	sw	s0,0(a0)
    2bb4:	557d                	li	a0,-1
    2bb6:	b7f5                	j	2ba2 <__syscall_ret+0xe>

0000000000002bb8 <__lctrans_impl>:
    2bb8:	8082                	ret

0000000000002bba <__lctrans>:
    2bba:	bffd                	j	2bb8 <__lctrans_impl>

0000000000002bbc <__lctrans_cur>:
    2bbc:	8792                	mv	a5,tp
    2bbe:	fd07b783          	ld	a5,-48(a5) # ffffffffffffefd0 <__BSS_END__+0xffffffffffff6790>
    2bc2:	778c                	ld	a1,40(a5)
    2bc4:	bfd5                	j	2bb8 <__lctrans_impl>

0000000000002bc6 <__fpclassifyl>:
    2bc6:	6721                	lui	a4,0x8
    2bc8:	0305d693          	srli	a3,a1,0x30
    2bcc:	177d                	addi	a4,a4,-1
    2bce:	05c2                	slli	a1,a1,0x10
    2bd0:	8ef9                	and	a3,a3,a4
    2bd2:	87aa                	mv	a5,a0
    2bd4:	81c1                	srli	a1,a1,0x10
    2bd6:	e691                	bnez	a3,2be2 <__fpclassifyl+0x1c>
    2bd8:	8dc9                	or	a1,a1,a0
    2bda:	00b03533          	snez	a0,a1
    2bde:	0509                	addi	a0,a0,2
    2be0:	8082                	ret
    2be2:	4511                	li	a0,4
    2be4:	00e69563          	bne	a3,a4,2bee <__fpclassifyl+0x28>
    2be8:	8ddd                	or	a1,a1,a5
    2bea:	0015b513          	seqz	a0,a1
    2bee:	8082                	ret

0000000000002bf0 <__signbitl>:
    2bf0:	03f5d513          	srli	a0,a1,0x3f
    2bf4:	8082                	ret

0000000000002bf6 <frexpl>:
    2bf6:	6721                	lui	a4,0x8
    2bf8:	1101                	addi	sp,sp,-32
    2bfa:	0305d793          	srli	a5,a1,0x30
    2bfe:	177d                	addi	a4,a4,-1
    2c00:	e822                	sd	s0,16(sp)
    2c02:	e426                	sd	s1,8(sp)
    2c04:	e04a                	sd	s2,0(sp)
    2c06:	ec06                	sd	ra,24(sp)
    2c08:	8932                	mv	s2,a2
    2c0a:	00e7f633          	and	a2,a5,a4
    2c0e:	84aa                	mv	s1,a0
    2c10:	842e                	mv	s0,a1
    2c12:	e629                	bnez	a2,2c5c <frexpl+0x66>
    2c14:	4681                	li	a3,0
    2c16:	14e010ef          	jal	ra,3d64 <__eqtf2>
    2c1a:	cd15                	beqz	a0,2c56 <frexpl+0x60>
    2c1c:	00003797          	auipc	a5,0x3
    2c20:	30478793          	addi	a5,a5,772 # 5f20 <errmsgstr+0x728>
    2c24:	6390                	ld	a2,0(a5)
    2c26:	6794                	ld	a3,8(a5)
    2c28:	8526                	mv	a0,s1
    2c2a:	85a2                	mv	a1,s0
    2c2c:	1c6010ef          	jal	ra,3df2 <__multf3>
    2c30:	864a                	mv	a2,s2
    2c32:	fc5ff0ef          	jal	ra,2bf6 <frexpl>
    2c36:	00092783          	lw	a5,0(s2)
    2c3a:	84aa                	mv	s1,a0
    2c3c:	842e                	mv	s0,a1
    2c3e:	f887879b          	addiw	a5,a5,-120
    2c42:	00f92023          	sw	a5,0(s2)
    2c46:	60e2                	ld	ra,24(sp)
    2c48:	85a2                	mv	a1,s0
    2c4a:	6442                	ld	s0,16(sp)
    2c4c:	6902                	ld	s2,0(sp)
    2c4e:	8526                	mv	a0,s1
    2c50:	64a2                	ld	s1,8(sp)
    2c52:	6105                	addi	sp,sp,32
    2c54:	8082                	ret
    2c56:	00092023          	sw	zero,0(s2)
    2c5a:	b7f5                	j	2c46 <frexpl+0x50>
    2c5c:	0006069b          	sext.w	a3,a2
    2c60:	fee603e3          	beq	a2,a4,2c46 <frexpl+0x50>
    2c64:	7771                	lui	a4,0xffffc
    2c66:	2709                	addiw	a4,a4,2
    2c68:	9f35                	addw	a4,a4,a3
    2c6a:	00e92023          	sw	a4,0(s2)
    2c6e:	7761                	lui	a4,0xffff8
    2c70:	8ff9                	and	a5,a5,a4
    2c72:	6711                	lui	a4,0x4
    2c74:	1779                	addi	a4,a4,-2
    2c76:	8fd9                	or	a5,a5,a4
    2c78:	01059413          	slli	s0,a1,0x10
    2c7c:	17c2                	slli	a5,a5,0x30
    2c7e:	8041                	srli	s0,s0,0x10
    2c80:	8c5d                	or	s0,s0,a5
    2c82:	b7d1                	j	2c46 <frexpl+0x50>

0000000000002c84 <wctomb>:
    2c84:	c911                	beqz	a0,2c98 <wctomb+0x14>
    2c86:	1141                	addi	sp,sp,-16
    2c88:	4601                	li	a2,0
    2c8a:	e406                	sd	ra,8(sp)
    2c8c:	46c000ef          	jal	ra,30f8 <wcrtomb>
    2c90:	60a2                	ld	ra,8(sp)
    2c92:	2501                	sext.w	a0,a0
    2c94:	0141                	addi	sp,sp,16
    2c96:	8082                	ret
    2c98:	4501                	li	a0,0
    2c9a:	8082                	ret

0000000000002c9c <__block_all_sigs>:
    2c9c:	862a                	mv	a2,a0
    2c9e:	08700893          	li	a7,135
    2ca2:	4501                	li	a0,0
    2ca4:	00003597          	auipc	a1,0x3
    2ca8:	28c58593          	addi	a1,a1,652 # 5f30 <all_mask>
    2cac:	46a1                	li	a3,8
    2cae:	00000073          	ecall
    2cb2:	8082                	ret

0000000000002cb4 <__block_app_sigs>:
    2cb4:	862a                	mv	a2,a0
    2cb6:	08700893          	li	a7,135
    2cba:	4501                	li	a0,0
    2cbc:	00003597          	auipc	a1,0x3
    2cc0:	27c58593          	addi	a1,a1,636 # 5f38 <app_mask>
    2cc4:	46a1                	li	a3,8
    2cc6:	00000073          	ecall
    2cca:	8082                	ret

0000000000002ccc <__restore_sigs>:
    2ccc:	85aa                	mv	a1,a0
    2cce:	08700893          	li	a7,135
    2cd2:	4509                	li	a0,2
    2cd4:	4601                	li	a2,0
    2cd6:	46a1                	li	a3,8
    2cd8:	00000073          	ecall
    2cdc:	8082                	ret

0000000000002cde <__restore>:
    2cde:	08b00893          	li	a7,139
    2ce2:	00000073          	ecall

0000000000002ce6 <__lockfile>:
    2ce6:	08c52783          	lw	a5,140(a0)
    2cea:	2781                	sext.w	a5,a5
    2cec:	8712                	mv	a4,tp
    2cee:	c00006b7          	lui	a3,0xc0000
    2cf2:	f5872703          	lw	a4,-168(a4) # 3f58 <__multf3+0x166>
    2cf6:	16fd                	addi	a3,a3,-1
    2cf8:	8ff5                	and	a5,a5,a3
    2cfa:	08e78263          	beq	a5,a4,2d7e <__lockfile+0x98>
    2cfe:	08c50793          	addi	a5,a0,140
    2d02:	4601                	li	a2,0
    2d04:	1607a6af          	lr.w.aqrl	a3,(a5)
    2d08:	00c69563          	bne	a3,a2,2d12 <__lockfile+0x2c>
    2d0c:	1ee7a5af          	sc.w.aqrl	a1,a4,(a5)
    2d10:	f9f5                	bnez	a1,2d04 <__lockfile+0x1e>
    2d12:	2681                	sext.w	a3,a3
    2d14:	c295                	beqz	a3,2d38 <__lockfile+0x52>
    2d16:	40000837          	lui	a6,0x40000
    2d1a:	01076733          	or	a4,a4,a6
    2d1e:	4301                	li	t1,0
    2d20:	2701                	sext.w	a4,a4
    2d22:	fda00e13          	li	t3,-38
    2d26:	1607a6af          	lr.w.aqrl	a3,(a5)
    2d2a:	00669563          	bne	a3,t1,2d34 <__lockfile+0x4e>
    2d2e:	1ee7a62f          	sc.w.aqrl	a2,a4,(a5)
    2d32:	fa75                	bnez	a2,2d26 <__lockfile+0x40>
    2d34:	2681                	sext.w	a3,a3
    2d36:	e299                	bnez	a3,2d3c <__lockfile+0x56>
    2d38:	4505                	li	a0,1
    2d3a:	8082                	ret
    2d3c:	0106f5b3          	and	a1,a3,a6
    2d40:	0106e633          	or	a2,a3,a6
    2d44:	2581                	sext.w	a1,a1
    2d46:	2601                	sext.w	a2,a2
    2d48:	c185                	beqz	a1,2d68 <__lockfile+0x82>
    2d4a:	06200893          	li	a7,98
    2d4e:	853e                	mv	a0,a5
    2d50:	08000593          	li	a1,128
    2d54:	4681                	li	a3,0
    2d56:	00000073          	ecall
    2d5a:	fdc516e3          	bne	a0,t3,2d26 <__lockfile+0x40>
    2d5e:	853e                	mv	a0,a5
    2d60:	4581                	li	a1,0
    2d62:	00000073          	ecall
    2d66:	b7c1                	j	2d26 <__lockfile+0x40>
    2d68:	1607a5af          	lr.w.aqrl	a1,(a5)
    2d6c:	00d59563          	bne	a1,a3,2d76 <__lockfile+0x90>
    2d70:	1ec7a52f          	sc.w.aqrl	a0,a2,(a5)
    2d74:	f975                	bnez	a0,2d68 <__lockfile+0x82>
    2d76:	2581                	sext.w	a1,a1
    2d78:	fad597e3          	bne	a1,a3,2d26 <__lockfile+0x40>
    2d7c:	b7f9                	j	2d4a <__lockfile+0x64>
    2d7e:	4501                	li	a0,0
    2d80:	8082                	ret

0000000000002d82 <__unlockfile>:
    2d82:	08c50713          	addi	a4,a0,140
    2d86:	4601                	li	a2,0
    2d88:	08c52783          	lw	a5,140(a0)
    2d8c:	2781                	sext.w	a5,a5
    2d8e:	160726af          	lr.w.aqrl	a3,(a4)
    2d92:	00f69563          	bne	a3,a5,2d9c <__unlockfile+0x1a>
    2d96:	1ec725af          	sc.w.aqrl	a1,a2,(a4)
    2d9a:	f9f5                	bnez	a1,2d8e <__unlockfile+0xc>
    2d9c:	2681                	sext.w	a3,a3
    2d9e:	fed795e3          	bne	a5,a3,2d88 <__unlockfile+0x6>
    2da2:	83f9                	srli	a5,a5,0x1e
    2da4:	8b85                	andi	a5,a5,1
    2da6:	c38d                	beqz	a5,2dc8 <__unlockfile+0x46>
    2da8:	06200893          	li	a7,98
    2dac:	853a                	mv	a0,a4
    2dae:	08100593          	li	a1,129
    2db2:	4605                	li	a2,1
    2db4:	00000073          	ecall
    2db8:	fda00793          	li	a5,-38
    2dbc:	00f51663          	bne	a0,a5,2dc8 <__unlockfile+0x46>
    2dc0:	853a                	mv	a0,a4
    2dc2:	4585                	li	a1,1
    2dc4:	00000073          	ecall
    2dc8:	8082                	ret

0000000000002dca <__overflow>:
    2dca:	711c                	ld	a5,32(a0)
    2dcc:	1101                	addi	sp,sp,-32
    2dce:	e822                	sd	s0,16(sp)
    2dd0:	ec06                	sd	ra,24(sp)
    2dd2:	00b107a3          	sb	a1,15(sp)
    2dd6:	842a                	mv	s0,a0
    2dd8:	c38d                	beqz	a5,2dfa <__overflow+0x30>
    2dda:	741c                	ld	a5,40(s0)
    2ddc:	7018                	ld	a4,32(s0)
    2dde:	02e79663          	bne	a5,a4,2e0a <__overflow+0x40>
    2de2:	643c                	ld	a5,72(s0)
    2de4:	4605                	li	a2,1
    2de6:	00f10593          	addi	a1,sp,15
    2dea:	8522                	mv	a0,s0
    2dec:	9782                	jalr	a5
    2dee:	4785                	li	a5,1
    2df0:	00f51863          	bne	a0,a5,2e00 <__overflow+0x36>
    2df4:	00f14503          	lbu	a0,15(sp)
    2df8:	a029                	j	2e02 <__overflow+0x38>
    2dfa:	094000ef          	jal	ra,2e8e <__towrite>
    2dfe:	dd71                	beqz	a0,2dda <__overflow+0x10>
    2e00:	557d                	li	a0,-1
    2e02:	60e2                	ld	ra,24(sp)
    2e04:	6442                	ld	s0,16(sp)
    2e06:	6105                	addi	sp,sp,32
    2e08:	8082                	ret
    2e0a:	00f14703          	lbu	a4,15(sp)
    2e0e:	09042683          	lw	a3,144(s0)
    2e12:	0007051b          	sext.w	a0,a4
    2e16:	fce686e3          	beq	a3,a4,2de2 <__overflow+0x18>
    2e1a:	00178693          	addi	a3,a5,1
    2e1e:	f414                	sd	a3,40(s0)
    2e20:	00e78023          	sb	a4,0(a5)
    2e24:	bff9                	j	2e02 <__overflow+0x38>

0000000000002e26 <__aio_close>:
    2e26:	8082                	ret

0000000000002e28 <__stdio_close>:
    2e28:	5d28                	lw	a0,120(a0)
    2e2a:	1141                	addi	sp,sp,-16
    2e2c:	e406                	sd	ra,8(sp)
    2e2e:	ff9ff0ef          	jal	ra,2e26 <__aio_close>
    2e32:	03900893          	li	a7,57
    2e36:	00000073          	ecall
    2e3a:	d5bff0ef          	jal	ra,2b94 <__syscall_ret>
    2e3e:	60a2                	ld	ra,8(sp)
    2e40:	2501                	sext.w	a0,a0
    2e42:	0141                	addi	sp,sp,16
    2e44:	8082                	ret

0000000000002e46 <__stdio_seek>:
    2e46:	5d28                	lw	a0,120(a0)
    2e48:	a455                	j	30ec <lseek>

0000000000002e4a <__stdout_write>:
    2e4a:	1101                	addi	sp,sp,-32
    2e4c:	ec06                	sd	ra,24(sp)
    2e4e:	86b2                	mv	a3,a2
    2e50:	00000617          	auipc	a2,0x0
    2e54:	42860613          	addi	a2,a2,1064 # 3278 <__stdio_write>
    2e58:	e530                	sd	a2,72(a0)
    2e5a:	4110                	lw	a2,0(a0)
    2e5c:	87aa                	mv	a5,a0
    2e5e:	872e                	mv	a4,a1
    2e60:	04067613          	andi	a2,a2,64
    2e64:	ee09                	bnez	a2,2e7e <__stdout_write+0x34>
    2e66:	6595                	lui	a1,0x5
    2e68:	5d28                	lw	a0,120(a0)
    2e6a:	48f5                	li	a7,29
    2e6c:	41358593          	addi	a1,a1,1043 # 5413 <__clzdi2+0x241>
    2e70:	0030                	addi	a2,sp,8
    2e72:	00000073          	ecall
    2e76:	c501                	beqz	a0,2e7e <__stdout_write+0x34>
    2e78:	567d                	li	a2,-1
    2e7a:	08c7a823          	sw	a2,144(a5)
    2e7e:	8636                	mv	a2,a3
    2e80:	85ba                	mv	a1,a4
    2e82:	853e                	mv	a0,a5
    2e84:	3f4000ef          	jal	ra,3278 <__stdio_write>
    2e88:	60e2                	ld	ra,24(sp)
    2e8a:	6105                	addi	sp,sp,32
    2e8c:	8082                	ret

0000000000002e8e <__towrite>:
    2e8e:	08852783          	lw	a5,136(a0)
    2e92:	fff7871b          	addiw	a4,a5,-1
    2e96:	8fd9                	or	a5,a5,a4
    2e98:	08f52423          	sw	a5,136(a0)
    2e9c:	411c                	lw	a5,0(a0)
    2e9e:	0087f713          	andi	a4,a5,8
    2ea2:	c711                	beqz	a4,2eae <__towrite+0x20>
    2ea4:	0207e793          	ori	a5,a5,32
    2ea8:	c11c                	sw	a5,0(a0)
    2eaa:	557d                	li	a0,-1
    2eac:	8082                	ret
    2eae:	6d3c                	ld	a5,88(a0)
    2eb0:	7138                	ld	a4,96(a0)
    2eb2:	00053823          	sd	zero,16(a0)
    2eb6:	fd1c                	sd	a5,56(a0)
    2eb8:	f51c                	sd	a5,40(a0)
    2eba:	97ba                	add	a5,a5,a4
    2ebc:	00053423          	sd	zero,8(a0)
    2ec0:	f11c                	sd	a5,32(a0)
    2ec2:	4501                	li	a0,0
    2ec4:	8082                	ret

0000000000002ec6 <__towrite_needs_stdio_exit>:
    2ec6:	ae8d                	j	3238 <__stdio_exit>

0000000000002ec8 <fputs>:
    2ec8:	7179                	addi	sp,sp,-48
    2eca:	f406                	sd	ra,40(sp)
    2ecc:	f022                	sd	s0,32(sp)
    2ece:	ec26                	sd	s1,24(sp)
    2ed0:	e42e                	sd	a1,8(sp)
    2ed2:	84aa                	mv	s1,a0
    2ed4:	1b4000ef          	jal	ra,3088 <strlen>
    2ed8:	66a2                	ld	a3,8(sp)
    2eda:	842a                	mv	s0,a0
    2edc:	862a                	mv	a2,a0
    2ede:	4585                	li	a1,1
    2ee0:	8526                	mv	a0,s1
    2ee2:	0b4000ef          	jal	ra,2f96 <fwrite>
    2ee6:	70a2                	ld	ra,40(sp)
    2ee8:	8d01                	sub	a0,a0,s0
    2eea:	7402                	ld	s0,32(sp)
    2eec:	00a03533          	snez	a0,a0
    2ef0:	64e2                	ld	s1,24(sp)
    2ef2:	40a00533          	neg	a0,a0
    2ef6:	6145                	addi	sp,sp,48
    2ef8:	8082                	ret

0000000000002efa <__fwritex>:
    2efa:	721c                	ld	a5,32(a2)
    2efc:	7179                	addi	sp,sp,-48
    2efe:	f022                	sd	s0,32(sp)
    2f00:	e84a                	sd	s2,16(sp)
    2f02:	e44e                	sd	s3,8(sp)
    2f04:	f406                	sd	ra,40(sp)
    2f06:	ec26                	sd	s1,24(sp)
    2f08:	89aa                	mv	s3,a0
    2f0a:	892e                	mv	s2,a1
    2f0c:	8432                	mv	s0,a2
    2f0e:	c38d                	beqz	a5,2f30 <__fwritex+0x36>
    2f10:	701c                	ld	a5,32(s0)
    2f12:	7418                	ld	a4,40(s0)
    2f14:	8f99                	sub	a5,a5,a4
    2f16:	0327f363          	bgeu	a5,s2,2f3c <__fwritex+0x42>
    2f1a:	643c                	ld	a5,72(s0)
    2f1c:	8522                	mv	a0,s0
    2f1e:	7402                	ld	s0,32(sp)
    2f20:	70a2                	ld	ra,40(sp)
    2f22:	64e2                	ld	s1,24(sp)
    2f24:	864a                	mv	a2,s2
    2f26:	85ce                	mv	a1,s3
    2f28:	6942                	ld	s2,16(sp)
    2f2a:	69a2                	ld	s3,8(sp)
    2f2c:	6145                	addi	sp,sp,48
    2f2e:	8782                	jr	a5
    2f30:	8532                	mv	a0,a2
    2f32:	f5dff0ef          	jal	ra,2e8e <__towrite>
    2f36:	dd69                	beqz	a0,2f10 <__fwritex+0x16>
    2f38:	4501                	li	a0,0
    2f3a:	a005                	j	2f5a <__fwritex+0x60>
    2f3c:	09042783          	lw	a5,144(s0)
    2f40:	84ca                	mv	s1,s2
    2f42:	4729                	li	a4,10
    2f44:	0207d363          	bgez	a5,2f6a <__fwritex+0x70>
    2f48:	7408                	ld	a0,40(s0)
    2f4a:	8626                	mv	a2,s1
    2f4c:	85ce                	mv	a1,s3
    2f4e:	b1cff0ef          	jal	ra,226a <memcpy>
    2f52:	741c                	ld	a5,40(s0)
    2f54:	854a                	mv	a0,s2
    2f56:	97a6                	add	a5,a5,s1
    2f58:	f41c                	sd	a5,40(s0)
    2f5a:	70a2                	ld	ra,40(sp)
    2f5c:	7402                	ld	s0,32(sp)
    2f5e:	64e2                	ld	s1,24(sp)
    2f60:	6942                	ld	s2,16(sp)
    2f62:	69a2                	ld	s3,8(sp)
    2f64:	6145                	addi	sp,sp,48
    2f66:	8082                	ret
    2f68:	84be                	mv	s1,a5
    2f6a:	c485                	beqz	s1,2f92 <__fwritex+0x98>
    2f6c:	fff48793          	addi	a5,s1,-1
    2f70:	00f986b3          	add	a3,s3,a5
    2f74:	0006c683          	lbu	a3,0(a3) # ffffffffc0000000 <__BSS_END__+0xffffffffbfff77c0>
    2f78:	fee698e3          	bne	a3,a4,2f68 <__fwritex+0x6e>
    2f7c:	643c                	ld	a5,72(s0)
    2f7e:	8626                	mv	a2,s1
    2f80:	85ce                	mv	a1,s3
    2f82:	8522                	mv	a0,s0
    2f84:	9782                	jalr	a5
    2f86:	fc956ae3          	bltu	a0,s1,2f5a <__fwritex+0x60>
    2f8a:	99a6                	add	s3,s3,s1
    2f8c:	409904b3          	sub	s1,s2,s1
    2f90:	bf65                	j	2f48 <__fwritex+0x4e>
    2f92:	84ca                	mv	s1,s2
    2f94:	bf55                	j	2f48 <__fwritex+0x4e>

0000000000002f96 <fwrite>:
    2f96:	7139                	addi	sp,sp,-64
    2f98:	f822                	sd	s0,48(sp)
    2f9a:	f426                	sd	s1,40(sp)
    2f9c:	f04a                	sd	s2,32(sp)
    2f9e:	ec4e                	sd	s3,24(sp)
    2fa0:	e456                	sd	s5,8(sp)
    2fa2:	fc06                	sd	ra,56(sp)
    2fa4:	e852                	sd	s4,16(sp)
    2fa6:	02c58ab3          	mul	s5,a1,a2
    2faa:	89aa                	mv	s3,a0
    2fac:	892e                	mv	s2,a1
    2fae:	84b6                	mv	s1,a3
    2fb0:	4401                	li	s0,0
    2fb2:	c191                	beqz	a1,2fb6 <fwrite+0x20>
    2fb4:	8432                	mv	s0,a2
    2fb6:	08c4a783          	lw	a5,140(s1)
    2fba:	4a01                	li	s4,0
    2fbc:	0007c663          	bltz	a5,2fc8 <fwrite+0x32>
    2fc0:	8526                	mv	a0,s1
    2fc2:	d25ff0ef          	jal	ra,2ce6 <__lockfile>
    2fc6:	8a2a                	mv	s4,a0
    2fc8:	854e                	mv	a0,s3
    2fca:	8626                	mv	a2,s1
    2fcc:	85d6                	mv	a1,s5
    2fce:	f2dff0ef          	jal	ra,2efa <__fwritex>
    2fd2:	89aa                	mv	s3,a0
    2fd4:	000a0563          	beqz	s4,2fde <fwrite+0x48>
    2fd8:	8526                	mv	a0,s1
    2fda:	da9ff0ef          	jal	ra,2d82 <__unlockfile>
    2fde:	013a8463          	beq	s5,s3,2fe6 <fwrite+0x50>
    2fe2:	0329d433          	divu	s0,s3,s2
    2fe6:	70e2                	ld	ra,56(sp)
    2fe8:	8522                	mv	a0,s0
    2fea:	7442                	ld	s0,48(sp)
    2fec:	74a2                	ld	s1,40(sp)
    2fee:	7902                	ld	s2,32(sp)
    2ff0:	69e2                	ld	s3,24(sp)
    2ff2:	6a42                	ld	s4,16(sp)
    2ff4:	6aa2                	ld	s5,8(sp)
    2ff6:	6121                	addi	sp,sp,64
    2ff8:	8082                	ret

0000000000002ffa <memchr>:
    2ffa:	00757713          	andi	a4,a0,7
    2ffe:	87aa                	mv	a5,a0
    3000:	0ff5f593          	zext.b	a1,a1
    3004:	cb19                	beqz	a4,301a <memchr+0x20>
    3006:	ce25                	beqz	a2,307e <memchr+0x84>
    3008:	0007c703          	lbu	a4,0(a5)
    300c:	04b70e63          	beq	a4,a1,3068 <memchr+0x6e>
    3010:	0785                	addi	a5,a5,1
    3012:	0077f713          	andi	a4,a5,7
    3016:	167d                	addi	a2,a2,-1
    3018:	f77d                	bnez	a4,3006 <memchr+0xc>
    301a:	4501                	li	a0,0
    301c:	c235                	beqz	a2,3080 <memchr+0x86>
    301e:	0007c703          	lbu	a4,0(a5)
    3022:	04b70363          	beq	a4,a1,3068 <memchr+0x6e>
    3026:	00003517          	auipc	a0,0x3
    302a:	f1a53503          	ld	a0,-230(a0) # 5f40 <app_mask+0x8>
    302e:	471d                	li	a4,7
    3030:	02a58533          	mul	a0,a1,a0
    3034:	02c77a63          	bgeu	a4,a2,3068 <memchr+0x6e>
    3038:	00003897          	auipc	a7,0x3
    303c:	f108b883          	ld	a7,-240(a7) # 5f48 <app_mask+0x10>
    3040:	00003817          	auipc	a6,0x3
    3044:	f1083803          	ld	a6,-240(a6) # 5f50 <app_mask+0x18>
    3048:	431d                	li	t1,7
    304a:	a029                	j	3054 <memchr+0x5a>
    304c:	1661                	addi	a2,a2,-8
    304e:	07a1                	addi	a5,a5,8
    3050:	02c37963          	bgeu	t1,a2,3082 <memchr+0x88>
    3054:	6398                	ld	a4,0(a5)
    3056:	8f29                	xor	a4,a4,a0
    3058:	011706b3          	add	a3,a4,a7
    305c:	fff74713          	not	a4,a4
    3060:	8f75                	and	a4,a4,a3
    3062:	01077733          	and	a4,a4,a6
    3066:	d37d                	beqz	a4,304c <memchr+0x52>
    3068:	853e                	mv	a0,a5
    306a:	97b2                	add	a5,a5,a2
    306c:	a021                	j	3074 <memchr+0x7a>
    306e:	0505                	addi	a0,a0,1
    3070:	00f50763          	beq	a0,a5,307e <memchr+0x84>
    3074:	00054703          	lbu	a4,0(a0)
    3078:	feb71be3          	bne	a4,a1,306e <memchr+0x74>
    307c:	8082                	ret
    307e:	4501                	li	a0,0
    3080:	8082                	ret
    3082:	4501                	li	a0,0
    3084:	f275                	bnez	a2,3068 <memchr+0x6e>
    3086:	8082                	ret

0000000000003088 <strlen>:
    3088:	00757793          	andi	a5,a0,7
    308c:	cf89                	beqz	a5,30a6 <strlen+0x1e>
    308e:	87aa                	mv	a5,a0
    3090:	a029                	j	309a <strlen+0x12>
    3092:	0785                	addi	a5,a5,1
    3094:	0077f713          	andi	a4,a5,7
    3098:	cb01                	beqz	a4,30a8 <strlen+0x20>
    309a:	0007c703          	lbu	a4,0(a5)
    309e:	fb75                	bnez	a4,3092 <strlen+0xa>
    30a0:	40a78533          	sub	a0,a5,a0
    30a4:	8082                	ret
    30a6:	87aa                	mv	a5,a0
    30a8:	6394                	ld	a3,0(a5)
    30aa:	00003597          	auipc	a1,0x3
    30ae:	e9e5b583          	ld	a1,-354(a1) # 5f48 <app_mask+0x10>
    30b2:	00003617          	auipc	a2,0x3
    30b6:	e9e63603          	ld	a2,-354(a2) # 5f50 <app_mask+0x18>
    30ba:	a019                	j	30c0 <strlen+0x38>
    30bc:	6794                	ld	a3,8(a5)
    30be:	07a1                	addi	a5,a5,8
    30c0:	00b68733          	add	a4,a3,a1
    30c4:	fff6c693          	not	a3,a3
    30c8:	8f75                	and	a4,a4,a3
    30ca:	8f71                	and	a4,a4,a2
    30cc:	db65                	beqz	a4,30bc <strlen+0x34>
    30ce:	0007c703          	lbu	a4,0(a5)
    30d2:	d779                	beqz	a4,30a0 <strlen+0x18>
    30d4:	0017c703          	lbu	a4,1(a5)
    30d8:	0785                	addi	a5,a5,1
    30da:	d379                	beqz	a4,30a0 <strlen+0x18>
    30dc:	0017c703          	lbu	a4,1(a5)
    30e0:	0785                	addi	a5,a5,1
    30e2:	fb6d                	bnez	a4,30d4 <strlen+0x4c>
    30e4:	bf75                	j	30a0 <strlen+0x18>

00000000000030e6 <__set_thread_area>:
    30e6:	822a                	mv	tp,a0
    30e8:	4501                	li	a0,0
    30ea:	8082                	ret

00000000000030ec <lseek>:
    30ec:	03e00893          	li	a7,62
    30f0:	00000073          	ecall
    30f4:	aa1ff06f          	j	2b94 <__syscall_ret>

00000000000030f8 <wcrtomb>:
    30f8:	c909                	beqz	a0,310a <wcrtomb+0x12>
    30fa:	07f00693          	li	a3,127
    30fe:	0005879b          	sext.w	a5,a1
    3102:	00b6ec63          	bltu	a3,a1,311a <wcrtomb+0x22>
    3106:	00b50023          	sb	a1,0(a0)
    310a:	4505                	li	a0,1
    310c:	8082                	ret
    310e:	00b50023          	sb	a1,0(a0)
    3112:	4505                	li	a0,1
    3114:	60a2                	ld	ra,8(sp)
    3116:	0141                	addi	sp,sp,16
    3118:	8082                	ret
    311a:	1141                	addi	sp,sp,-16
    311c:	e406                	sd	ra,8(sp)
    311e:	8712                	mv	a4,tp
    3120:	fd073703          	ld	a4,-48(a4)
    3124:	6318                	ld	a4,0(a4)
    3126:	ef11                	bnez	a4,3142 <wcrtomb+0x4a>
    3128:	7749                	lui	a4,0xffff2
    312a:	0807071b          	addiw	a4,a4,128
    312e:	9fb9                	addw	a5,a5,a4
    3130:	fcf6ffe3          	bgeu	a3,a5,310e <wcrtomb+0x16>
    3134:	a17ff0ef          	jal	ra,2b4a <__errno_location>
    3138:	05400793          	li	a5,84
    313c:	c11c                	sw	a5,0(a0)
    313e:	557d                	li	a0,-1
    3140:	bfd1                	j	3114 <wcrtomb+0x1c>
    3142:	7ff00713          	li	a4,2047
    3146:	02f76063          	bltu	a4,a5,3166 <wcrtomb+0x6e>
    314a:	4065d79b          	sraiw	a5,a1,0x6
    314e:	03f5f593          	andi	a1,a1,63
    3152:	fc07e793          	ori	a5,a5,-64
    3156:	f805e593          	ori	a1,a1,-128
    315a:	00f50023          	sb	a5,0(a0)
    315e:	00b500a3          	sb	a1,1(a0)
    3162:	4509                	li	a0,2
    3164:	bf45                	j	3114 <wcrtomb+0x1c>
    3166:	6735                	lui	a4,0xd
    3168:	7ff70713          	addi	a4,a4,2047 # d7ff <__BSS_END__+0x4fbf>
    316c:	00f77763          	bgeu	a4,a5,317a <wcrtomb+0x82>
    3170:	7749                	lui	a4,0xffff2
    3172:	9f3d                	addw	a4,a4,a5
    3174:	6689                	lui	a3,0x2
    3176:	02d77863          	bgeu	a4,a3,31a6 <wcrtomb+0xae>
    317a:	40c5d79b          	sraiw	a5,a1,0xc
    317e:	fe07e793          	ori	a5,a5,-32
    3182:	00f50023          	sb	a5,0(a0)
    3186:	4065d79b          	sraiw	a5,a1,0x6
    318a:	03f7f793          	andi	a5,a5,63
    318e:	03f5f593          	andi	a1,a1,63
    3192:	f807e793          	ori	a5,a5,-128
    3196:	f805e593          	ori	a1,a1,-128
    319a:	00f500a3          	sb	a5,1(a0)
    319e:	00b50123          	sb	a1,2(a0)
    31a2:	450d                	li	a0,3
    31a4:	bf85                	j	3114 <wcrtomb+0x1c>
    31a6:	7741                	lui	a4,0xffff0
    31a8:	9fb9                	addw	a5,a5,a4
    31aa:	00100737          	lui	a4,0x100
    31ae:	f8e7f3e3          	bgeu	a5,a4,3134 <wcrtomb+0x3c>
    31b2:	4125d79b          	sraiw	a5,a1,0x12
    31b6:	ff07e793          	ori	a5,a5,-16
    31ba:	00f50023          	sb	a5,0(a0)
    31be:	40c5d79b          	sraiw	a5,a1,0xc
    31c2:	03f7f793          	andi	a5,a5,63
    31c6:	f807e793          	ori	a5,a5,-128
    31ca:	00f500a3          	sb	a5,1(a0)
    31ce:	4065d79b          	sraiw	a5,a1,0x6
    31d2:	03f7f793          	andi	a5,a5,63
    31d6:	03f5f593          	andi	a1,a1,63
    31da:	f807e793          	ori	a5,a5,-128
    31de:	f805e593          	ori	a1,a1,-128
    31e2:	00f50123          	sb	a5,2(a0)
    31e6:	00b501a3          	sb	a1,3(a0)
    31ea:	4511                	li	a0,4
    31ec:	b725                	j	3114 <wcrtomb+0x1c>

00000000000031ee <close_file>:
    31ee:	c521                	beqz	a0,3236 <close_file+0x48>
    31f0:	08c52783          	lw	a5,140(a0)
    31f4:	1141                	addi	sp,sp,-16
    31f6:	e022                	sd	s0,0(sp)
    31f8:	e406                	sd	ra,8(sp)
    31fa:	842a                	mv	s0,a0
    31fc:	0007c463          	bltz	a5,3204 <close_file+0x16>
    3200:	ae7ff0ef          	jal	ra,2ce6 <__lockfile>
    3204:	7418                	ld	a4,40(s0)
    3206:	7c1c                	ld	a5,56(s0)
    3208:	00f70763          	beq	a4,a5,3216 <close_file+0x28>
    320c:	643c                	ld	a5,72(s0)
    320e:	4601                	li	a2,0
    3210:	4581                	li	a1,0
    3212:	8522                	mv	a0,s0
    3214:	9782                	jalr	a5
    3216:	640c                	ld	a1,8(s0)
    3218:	681c                	ld	a5,16(s0)
    321a:	00f58a63          	beq	a1,a5,322e <close_file+0x40>
    321e:	6838                	ld	a4,80(s0)
    3220:	8522                	mv	a0,s0
    3222:	6402                	ld	s0,0(sp)
    3224:	60a2                	ld	ra,8(sp)
    3226:	4605                	li	a2,1
    3228:	8d9d                	sub	a1,a1,a5
    322a:	0141                	addi	sp,sp,16
    322c:	8702                	jr	a4
    322e:	60a2                	ld	ra,8(sp)
    3230:	6402                	ld	s0,0(sp)
    3232:	0141                	addi	sp,sp,16
    3234:	8082                	ret
    3236:	8082                	ret

0000000000003238 <__stdio_exit>:
    3238:	1141                	addi	sp,sp,-16
    323a:	e022                	sd	s0,0(sp)
    323c:	e406                	sd	ra,8(sp)
    323e:	0e0000ef          	jal	ra,331e <__ofl_lock>
    3242:	6100                	ld	s0,0(a0)
    3244:	e40d                	bnez	s0,326e <__stdio_exit+0x36>
    3246:	00005517          	auipc	a0,0x5
    324a:	5e253503          	ld	a0,1506(a0) # 8828 <__stderr_used>
    324e:	fa1ff0ef          	jal	ra,31ee <close_file>
    3252:	00005517          	auipc	a0,0x5
    3256:	ea653503          	ld	a0,-346(a0) # 80f8 <__stdout_used>
    325a:	f95ff0ef          	jal	ra,31ee <close_file>
    325e:	6402                	ld	s0,0(sp)
    3260:	60a2                	ld	ra,8(sp)
    3262:	00005517          	auipc	a0,0x5
    3266:	5c653503          	ld	a0,1478(a0) # 8828 <__stderr_used>
    326a:	0141                	addi	sp,sp,16
    326c:	b749                	j	31ee <close_file>
    326e:	8522                	mv	a0,s0
    3270:	f7fff0ef          	jal	ra,31ee <close_file>
    3274:	7820                	ld	s0,112(s0)
    3276:	b7f9                	j	3244 <__stdio_exit+0xc>

0000000000003278 <__stdio_write>:
    3278:	715d                	addi	sp,sp,-80
    327a:	7d1c                	ld	a5,56(a0)
    327c:	f44e                	sd	s3,40(sp)
    327e:	02853983          	ld	s3,40(a0)
    3282:	e0a2                	sd	s0,64(sp)
    3284:	fc26                	sd	s1,56(sp)
    3286:	40f989b3          	sub	s3,s3,a5
    328a:	f84a                	sd	s2,48(sp)
    328c:	f052                	sd	s4,32(sp)
    328e:	e44e                	sd	s3,8(sp)
    3290:	e486                	sd	ra,72(sp)
    3292:	842a                	mv	s0,a0
    3294:	8932                	mv	s2,a2
    3296:	e03e                	sd	a5,0(sp)
    3298:	e82e                	sd	a1,16(sp)
    329a:	ec32                	sd	a2,24(sp)
    329c:	99b2                	add	s3,s3,a2
    329e:	4a09                	li	s4,2
    32a0:	848a                	mv	s1,sp
    32a2:	5c28                	lw	a0,120(s0)
    32a4:	04200893          	li	a7,66
    32a8:	85a6                	mv	a1,s1
    32aa:	8652                	mv	a2,s4
    32ac:	00000073          	ecall
    32b0:	8e5ff0ef          	jal	ra,2b94 <__syscall_ret>
    32b4:	02a99163          	bne	s3,a0,32d6 <__stdio_write+0x5e>
    32b8:	6c3c                	ld	a5,88(s0)
    32ba:	7038                	ld	a4,96(s0)
    32bc:	fc1c                	sd	a5,56(s0)
    32be:	973e                	add	a4,a4,a5
    32c0:	f018                	sd	a4,32(s0)
    32c2:	f41c                	sd	a5,40(s0)
    32c4:	60a6                	ld	ra,72(sp)
    32c6:	6406                	ld	s0,64(sp)
    32c8:	74e2                	ld	s1,56(sp)
    32ca:	79a2                	ld	s3,40(sp)
    32cc:	7a02                	ld	s4,32(sp)
    32ce:	854a                	mv	a0,s2
    32d0:	7942                	ld	s2,48(sp)
    32d2:	6161                	addi	sp,sp,80
    32d4:	8082                	ret
    32d6:	02055363          	bgez	a0,32fc <__stdio_write+0x84>
    32da:	401c                	lw	a5,0(s0)
    32dc:	02043023          	sd	zero,32(s0)
    32e0:	02043c23          	sd	zero,56(s0)
    32e4:	0207e793          	ori	a5,a5,32
    32e8:	c01c                	sw	a5,0(s0)
    32ea:	02043423          	sd	zero,40(s0)
    32ee:	4789                	li	a5,2
    32f0:	02fa0563          	beq	s4,a5,331a <__stdio_write+0xa2>
    32f4:	649c                	ld	a5,8(s1)
    32f6:	40f90933          	sub	s2,s2,a5
    32fa:	b7e9                	j	32c4 <__stdio_write+0x4c>
    32fc:	649c                	ld	a5,8(s1)
    32fe:	40a989b3          	sub	s3,s3,a0
    3302:	00a7f563          	bgeu	a5,a0,330c <__stdio_write+0x94>
    3306:	8d1d                	sub	a0,a0,a5
    3308:	04c1                	addi	s1,s1,16
    330a:	3a7d                	addiw	s4,s4,-1
    330c:	609c                	ld	a5,0(s1)
    330e:	97aa                	add	a5,a5,a0
    3310:	e09c                	sd	a5,0(s1)
    3312:	649c                	ld	a5,8(s1)
    3314:	8f89                	sub	a5,a5,a0
    3316:	e49c                	sd	a5,8(s1)
    3318:	b769                	j	32a2 <__stdio_write+0x2a>
    331a:	4901                	li	s2,0
    331c:	b765                	j	32c4 <__stdio_write+0x4c>

000000000000331e <__ofl_lock>:
    331e:	1141                	addi	sp,sp,-16
    3320:	00005517          	auipc	a0,0x5
    3324:	51850513          	addi	a0,a0,1304 # 8838 <ofl_lock>
    3328:	e406                	sd	ra,8(sp)
    332a:	c8eff0ef          	jal	ra,27b8 <__lock>
    332e:	60a2                	ld	ra,8(sp)
    3330:	00005517          	auipc	a0,0x5
    3334:	50050513          	addi	a0,a0,1280 # 8830 <ofl_head>
    3338:	0141                	addi	sp,sp,16
    333a:	8082                	ret

000000000000333c <__ofl_unlock>:
    333c:	00005517          	auipc	a0,0x5
    3340:	4fc50513          	addi	a0,a0,1276 # 8838 <ofl_lock>
    3344:	d46ff06f          	j	288a <__unlock>

0000000000003348 <__addtf3>:
    3348:	7179                	addi	sp,sp,-48
    334a:	f406                	sd	ra,40(sp)
    334c:	f022                	sd	s0,32(sp)
    334e:	ec26                	sd	s1,24(sp)
    3350:	e84a                	sd	s2,16(sp)
    3352:	e44e                	sd	s3,8(sp)
    3354:	e052                	sd	s4,0(sp)
    3356:	002029f3          	frrm	s3
    335a:	58fd                	li	a7,-1
    335c:	0108d793          	srli	a5,a7,0x10
    3360:	00f5f833          	and	a6,a1,a5
    3364:	62a1                	lui	t0,0x8
    3366:	8ff5                	and	a5,a5,a3
    3368:	fff28f13          	addi	t5,t0,-1 # 7fff <_DYNAMIC+0x16f>
    336c:	0305d713          	srli	a4,a1,0x30
    3370:	0306d313          	srli	t1,a3,0x30
    3374:	03d65e13          	srli	t3,a2,0x3d
    3378:	080e                	slli	a6,a6,0x3
    337a:	03d55e93          	srli	t4,a0,0x3d
    337e:	078e                	slli	a5,a5,0x3
    3380:	03f5d413          	srli	s0,a1,0x3f
    3384:	92fd                	srli	a3,a3,0x3f
    3386:	01e774b3          	and	s1,a4,t5
    338a:	2981                	sext.w	s3,s3
    338c:	00fe6733          	or	a4,t3,a5
    3390:	010ee833          	or	a6,t4,a6
    3394:	00351f93          	slli	t6,a0,0x3
    3398:	01e37333          	and	t1,t1,t5
    339c:	00361e13          	slli	t3,a2,0x3
    33a0:	1cd40e63          	beq	s0,a3,357c <__addtf3+0x234>
    33a4:	40648ebb          	subw	t4,s1,t1
    33a8:	000e879b          	sext.w	a5,t4
    33ac:	16f05d63          	blez	a5,3526 <__addtf3+0x1de>
    33b0:	22030063          	beqz	t1,35d0 <__addtf3+0x288>
    33b4:	23e48863          	beq	s1,t5,35e4 <__addtf3+0x29c>
    33b8:	4685                	li	a3,1
    33ba:	16ce                	slli	a3,a3,0x33
    33bc:	8f55                	or	a4,a4,a3
    33be:	07400693          	li	a3,116
    33c2:	3ef6c763          	blt	a3,a5,37b0 <__addtf3+0x468>
    33c6:	03f00693          	li	a3,63
    33ca:	56f6ca63          	blt	a3,a5,393e <__addtf3+0x5f6>
    33ce:	04000693          	li	a3,64
    33d2:	9e9d                	subw	a3,a3,a5
    33d4:	00d71933          	sll	s2,a4,a3
    33d8:	00fe5633          	srl	a2,t3,a5
    33dc:	00de16b3          	sll	a3,t3,a3
    33e0:	00c96933          	or	s2,s2,a2
    33e4:	00d036b3          	snez	a3,a3
    33e8:	00f75733          	srl	a4,a4,a5
    33ec:	00d96933          	or	s2,s2,a3
    33f0:	40e80833          	sub	a6,a6,a4
    33f4:	412f8933          	sub	s2,t6,s2
    33f8:	012fbfb3          	sltu	t6,t6,s2
    33fc:	41f80833          	sub	a6,a6,t6
    3400:	03385793          	srli	a5,a6,0x33
    3404:	8b85                	andi	a5,a5,1
    3406:	2c078563          	beqz	a5,36d0 <__addtf3+0x388>
    340a:	00d81a13          	slli	s4,a6,0xd
    340e:	00da5a13          	srli	s4,s4,0xd
    3412:	2e0a0f63          	beqz	s4,3710 <__addtf3+0x3c8>
    3416:	8552                	mv	a0,s4
    3418:	5bb010ef          	jal	ra,51d2 <__clzdi2>
    341c:	3551                	addiw	a0,a0,-12
    341e:	04000813          	li	a6,64
    3422:	40a8083b          	subw	a6,a6,a0
    3426:	00aa1a33          	sll	s4,s4,a0
    342a:	01095833          	srl	a6,s2,a6
    342e:	01486833          	or	a6,a6,s4
    3432:	00a91a33          	sll	s4,s2,a0
    3436:	28954663          	blt	a0,s1,36c2 <__addtf3+0x37a>
    343a:	9d05                	subw	a0,a0,s1
    343c:	0015071b          	addiw	a4,a0,1
    3440:	03f00793          	li	a5,63
    3444:	4ce7c763          	blt	a5,a4,3912 <__addtf3+0x5ca>
    3448:	04000793          	li	a5,64
    344c:	9f99                	subw	a5,a5,a4
    344e:	00f81933          	sll	s2,a6,a5
    3452:	00ea56b3          	srl	a3,s4,a4
    3456:	00fa17b3          	sll	a5,s4,a5
    345a:	00d96933          	or	s2,s2,a3
    345e:	00f037b3          	snez	a5,a5
    3462:	00f96933          	or	s2,s2,a5
    3466:	00e85833          	srl	a6,a6,a4
    346a:	010965b3          	or	a1,s2,a6
    346e:	1e058063          	beqz	a1,364e <__addtf3+0x306>
    3472:	00797593          	andi	a1,s2,7
    3476:	00191693          	slli	a3,s2,0x1
    347a:	03f95793          	srli	a5,s2,0x3f
    347e:	00181713          	slli	a4,a6,0x1
    3482:	0076f613          	andi	a2,a3,7
    3486:	973e                	add	a4,a4,a5
    3488:	4781                	li	a5,0
    348a:	ca11                	beqz	a2,349e <__addtf3+0x156>
    348c:	4789                	li	a5,2
    348e:	6af98063          	beq	s3,a5,3b2e <__addtf3+0x7e6>
    3492:	478d                	li	a5,3
    3494:	68f98263          	beq	s3,a5,3b18 <__addtf3+0x7d0>
    3498:	4785                	li	a5,1
    349a:	66098263          	beqz	s3,3afe <__addtf3+0x7b6>
    349e:	4685                	li	a3,1
    34a0:	03469613          	slli	a2,a3,0x34
    34a4:	8f71                	and	a4,a4,a2
    34a6:	00173613          	seqz	a2,a4
    34aa:	4481                	li	s1,0
    34ac:	6a058563          	beqz	a1,3b56 <__addtf3+0x80e>
    34b0:	4789                	li	a5,2
    34b2:	2cf98963          	beq	s3,a5,3784 <__addtf3+0x43c>
    34b6:	478d                	li	a5,3
    34b8:	2ef98263          	beq	s3,a5,379c <__addtf3+0x454>
    34bc:	4785                	li	a5,1
    34be:	1e098463          	beqz	s3,36a6 <__addtf3+0x35e>
    34c2:	c219                	beqz	a2,34c8 <__addtf3+0x180>
    34c4:	0027e793          	ori	a5,a5,2
    34c8:	4685                	li	a3,1
    34ca:	16ce                	slli	a3,a3,0x33
    34cc:	00d876b3          	and	a3,a6,a3
    34d0:	1a068f63          	beqz	a3,368e <__addtf3+0x346>
    34d4:	66a1                	lui	a3,0x8
    34d6:	00148713          	addi	a4,s1,1
    34da:	fff68613          	addi	a2,a3,-1 # 7fff <_DYNAMIC+0x16f>
    34de:	20c70863          	beq	a4,a2,36ee <__addtf3+0x3a6>
    34e2:	56fd                	li	a3,-1
    34e4:	03369593          	slli	a1,a3,0x33
    34e8:	15fd                	addi	a1,a1,-1
    34ea:	00b875b3          	and	a1,a6,a1
    34ee:	8f71                	and	a4,a4,a2
    34f0:	03d59513          	slli	a0,a1,0x3d
    34f4:	00395913          	srli	s2,s2,0x3
    34f8:	818d                	srli	a1,a1,0x3
    34fa:	82c1                	srli	a3,a3,0x10
    34fc:	1742                	slli	a4,a4,0x30
    34fe:	01256533          	or	a0,a0,s2
    3502:	8df5                	and	a1,a1,a3
    3504:	9341                	srli	a4,a4,0x30
    3506:	043e                	slli	s0,s0,0xf
    3508:	05c2                	slli	a1,a1,0x10
    350a:	8c59                	or	s0,s0,a4
    350c:	1442                	slli	s0,s0,0x30
    350e:	81c1                	srli	a1,a1,0x10
    3510:	8dc1                	or	a1,a1,s0
    3512:	2c079163          	bnez	a5,37d4 <__addtf3+0x48c>
    3516:	70a2                	ld	ra,40(sp)
    3518:	7402                	ld	s0,32(sp)
    351a:	64e2                	ld	s1,24(sp)
    351c:	6942                	ld	s2,16(sp)
    351e:	69a2                	ld	s3,8(sp)
    3520:	6a02                	ld	s4,0(sp)
    3522:	6145                	addi	sp,sp,48
    3524:	8082                	ret
    3526:	cbe9                	beqz	a5,35f8 <__addtf3+0x2b0>
    3528:	32049f63          	bnez	s1,3866 <__addtf3+0x51e>
    352c:	01f867b3          	or	a5,a6,t6
    3530:	50078563          	beqz	a5,3a3a <__addtf3+0x6f2>
    3534:	fffece93          	not	t4,t4
    3538:	2e81                	sext.w	t4,t4
    353a:	6a0e8763          	beqz	t4,3be8 <__addtf3+0x8a0>
    353e:	33e31c63          	bne	t1,t5,3876 <__addtf3+0x52e>
    3542:	01c76e33          	or	t3,a4,t3
    3546:	6a0e0d63          	beqz	t3,3c00 <__addtf3+0x8b8>
    354a:	03275793          	srli	a5,a4,0x32
    354e:	0038d513          	srli	a0,a7,0x3
    3552:	0017c793          	xori	a5,a5,1
    3556:	03d71593          	slli	a1,a4,0x3d
    355a:	8b85                	andi	a5,a5,1
    355c:	8e69                	and	a2,a2,a0
    355e:	00b66533          	or	a0,a2,a1
    3562:	0792                	slli	a5,a5,0x4
    3564:	00375593          	srli	a1,a4,0x3
    3568:	8436                	mv	s0,a3
    356a:	8d4d                	or	a0,a0,a1
    356c:	c149                	beqz	a0,35ee <__addtf3+0x2a6>
    356e:	6721                	lui	a4,0x8
    3570:	4585                	li	a1,1
    3572:	4401                	li	s0,0
    3574:	177d                	addi	a4,a4,-1
    3576:	15be                	slli	a1,a1,0x2f
    3578:	4501                	li	a0,0
    357a:	b771                	j	3506 <__addtf3+0x1be>
    357c:	406486bb          	subw	a3,s1,t1
    3580:	0006879b          	sext.w	a5,a3
    3584:	1af05463          	blez	a5,372c <__addtf3+0x3e4>
    3588:	0c030c63          	beqz	t1,3660 <__addtf3+0x318>
    358c:	5de48f63          	beq	s1,t5,3b6a <__addtf3+0x822>
    3590:	4685                	li	a3,1
    3592:	16ce                	slli	a3,a3,0x33
    3594:	8f55                	or	a4,a4,a3
    3596:	07400693          	li	a3,116
    359a:	32f6c663          	blt	a3,a5,38c6 <__addtf3+0x57e>
    359e:	03f00693          	li	a3,63
    35a2:	44f6d763          	bge	a3,a5,39f0 <__addtf3+0x6a8>
    35a6:	fc07869b          	addiw	a3,a5,-64
    35aa:	04000613          	li	a2,64
    35ae:	00d756b3          	srl	a3,a4,a3
    35b2:	00c78a63          	beq	a5,a2,35c6 <__addtf3+0x27e>
    35b6:	08000613          	li	a2,128
    35ba:	40f607bb          	subw	a5,a2,a5
    35be:	00f717b3          	sll	a5,a4,a5
    35c2:	00fe6e33          	or	t3,t3,a5
    35c6:	01c03933          	snez	s2,t3
    35ca:	00d96933          	or	s2,s2,a3
    35ce:	a601                	j	38ce <__addtf3+0x586>
    35d0:	01c767b3          	or	a5,a4,t3
    35d4:	2c078e63          	beqz	a5,38b0 <__addtf3+0x568>
    35d8:	fffe879b          	addiw	a5,t4,-1
    35dc:	4e078363          	beqz	a5,3ac2 <__addtf3+0x77a>
    35e0:	dde49fe3          	bne	s1,t5,33be <__addtf3+0x76>
    35e4:	01f86fb3          	or	t6,a6,t6
    35e8:	3c0f9b63          	bnez	t6,39be <__addtf3+0x676>
    35ec:	4781                	li	a5,0
    35ee:	6721                	lui	a4,0x8
    35f0:	177d                	addi	a4,a4,-1
    35f2:	4581                	li	a1,0
    35f4:	4501                	li	a0,0
    35f6:	bf01                	j	3506 <__addtf3+0x1be>
    35f8:	00148893          	addi	a7,s1,1
    35fc:	ffe28593          	addi	a1,t0,-2
    3600:	00b8f5b3          	and	a1,a7,a1
    3604:	22059a63          	bnez	a1,3838 <__addtf3+0x4f0>
    3608:	01f868b3          	or	a7,a6,t6
    360c:	01c765b3          	or	a1,a4,t3
    3610:	1a049563          	bnez	s1,37ba <__addtf3+0x472>
    3614:	4c088063          	beqz	a7,3ad4 <__addtf3+0x78c>
    3618:	4c058463          	beqz	a1,3ae0 <__addtf3+0x798>
    361c:	41cf8533          	sub	a0,t6,t3
    3620:	00afb5b3          	sltu	a1,t6,a0
    3624:	40e80633          	sub	a2,a6,a4
    3628:	8e0d                	sub	a2,a2,a1
    362a:	03365593          	srli	a1,a2,0x33
    362e:	8985                	andi	a1,a1,1
    3630:	68058f63          	beqz	a1,3cce <__addtf3+0x986>
    3634:	41fe0933          	sub	s2,t3,t6
    3638:	41070733          	sub	a4,a4,a6
    363c:	012e3e33          	sltu	t3,t3,s2
    3640:	41c70833          	sub	a6,a4,t3
    3644:	010965b3          	or	a1,s2,a6
    3648:	8436                	mv	s0,a3
    364a:	e20594e3          	bnez	a1,3472 <__addtf3+0x12a>
    364e:	4501                	li	a0,0
    3650:	4481                	li	s1,0
    3652:	4781                	li	a5,0
    3654:	05c2                	slli	a1,a1,0x10
    3656:	03149713          	slli	a4,s1,0x31
    365a:	81c1                	srli	a1,a1,0x10
    365c:	9345                	srli	a4,a4,0x31
    365e:	b565                	j	3506 <__addtf3+0x1be>
    3660:	01c767b3          	or	a5,a4,t3
    3664:	48078063          	beqz	a5,3ae4 <__addtf3+0x79c>
    3668:	fff6879b          	addiw	a5,a3,-1
    366c:	3e078863          	beqz	a5,3a5c <__addtf3+0x714>
    3670:	f3e493e3          	bne	s1,t5,3596 <__addtf3+0x24e>
    3674:	01f867b3          	or	a5,a6,t6
    3678:	dbb5                	beqz	a5,35ec <__addtf3+0x2a4>
    367a:	03285793          	srli	a5,a6,0x32
    367e:	0017c793          	xori	a5,a5,1
    3682:	8b85                	andi	a5,a5,1
    3684:	0792                	slli	a5,a5,0x4
    3686:	6721                	lui	a4,0x8
    3688:	897e                	mv	s2,t6
    368a:	fff70493          	addi	s1,a4,-1 # 7fff <_DYNAMIC+0x16f>
    368e:	6721                	lui	a4,0x8
    3690:	00395513          	srli	a0,s2,0x3
    3694:	03d81693          	slli	a3,a6,0x3d
    3698:	177d                	addi	a4,a4,-1
    369a:	8d55                	or	a0,a0,a3
    369c:	00385593          	srli	a1,a6,0x3
    36a0:	ece485e3          	beq	s1,a4,356a <__addtf3+0x222>
    36a4:	bf45                	j	3654 <__addtf3+0x30c>
    36a6:	00f97713          	andi	a4,s2,15
    36aa:	4691                	li	a3,4
    36ac:	e0d70be3          	beq	a4,a3,34c2 <__addtf3+0x17a>
    36b0:	00490713          	addi	a4,s2,4
    36b4:	01273933          	sltu	s2,a4,s2
    36b8:	984a                	add	a6,a6,s2
    36ba:	893a                	mv	s2,a4
    36bc:	e00614e3          	bnez	a2,34c4 <__addtf3+0x17c>
    36c0:	b521                	j	34c8 <__addtf3+0x180>
    36c2:	57fd                	li	a5,-1
    36c4:	17ce                	slli	a5,a5,0x33
    36c6:	17fd                	addi	a5,a5,-1
    36c8:	8c89                	sub	s1,s1,a0
    36ca:	00f87833          	and	a6,a6,a5
    36ce:	8952                	mv	s2,s4
    36d0:	010965b3          	or	a1,s2,a6
    36d4:	00797793          	andi	a5,s2,7
    36d8:	d8048be3          	beqz	s1,346e <__addtf3+0x126>
    36dc:	4601                	li	a2,0
    36de:	dc0799e3          	bnez	a5,34b0 <__addtf3+0x168>
    36e2:	4685                	li	a3,1
    36e4:	16ce                	slli	a3,a3,0x33
    36e6:	00d876b3          	and	a3,a6,a3
    36ea:	4781                	li	a5,0
    36ec:	b3d5                	j	34d0 <__addtf3+0x188>
    36ee:	0a098e63          	beqz	s3,37aa <__addtf3+0x462>
    36f2:	470d                	li	a4,3
    36f4:	2ee98463          	beq	s3,a4,39dc <__addtf3+0x694>
    36f8:	4709                	li	a4,2
    36fa:	0ae98663          	beq	s3,a4,37a6 <__addtf3+0x45e>
    36fe:	557d                	li	a0,-1
    3700:	6721                	lui	a4,0x8
    3702:	0057e793          	ori	a5,a5,5
    3706:	00355593          	srli	a1,a0,0x3
    370a:	ffe70493          	addi	s1,a4,-2 # 7ffe <_DYNAMIC+0x16e>
    370e:	b799                	j	3654 <__addtf3+0x30c>
    3710:	854a                	mv	a0,s2
    3712:	2c1010ef          	jal	ra,51d2 <__clzdi2>
    3716:	ff45081b          	addiw	a6,a0,-12
    371a:	03f00793          	li	a5,63
    371e:	0345051b          	addiw	a0,a0,52
    3722:	01091833          	sll	a6,s2,a6
    3726:	d0a7c8e3          	blt	a5,a0,3436 <__addtf3+0xee>
    372a:	b9d5                	j	341e <__addtf3+0xd6>
    372c:	cfd5                	beqz	a5,37e8 <__addtf3+0x4a0>
    372e:	24048a63          	beqz	s1,3982 <__addtf3+0x63a>
    3732:	5be30863          	beq	t1,t5,3ce2 <__addtf3+0x99a>
    3736:	4785                	li	a5,1
    3738:	17ce                	slli	a5,a5,0x33
    373a:	40d006bb          	negw	a3,a3
    373e:	00f86833          	or	a6,a6,a5
    3742:	07400793          	li	a5,116
    3746:	44d7c663          	blt	a5,a3,3b92 <__addtf3+0x84a>
    374a:	03f00793          	li	a5,63
    374e:	4cd7c963          	blt	a5,a3,3c20 <__addtf3+0x8d8>
    3752:	04000793          	li	a5,64
    3756:	9f95                	subw	a5,a5,a3
    3758:	00f81933          	sll	s2,a6,a5
    375c:	00dfd633          	srl	a2,t6,a3
    3760:	00ff97b3          	sll	a5,t6,a5
    3764:	00c96933          	or	s2,s2,a2
    3768:	00f037b3          	snez	a5,a5
    376c:	00d856b3          	srl	a3,a6,a3
    3770:	00f96933          	or	s2,s2,a5
    3774:	9736                	add	a4,a4,a3
    3776:	9972                	add	s2,s2,t3
    3778:	01c93e33          	sltu	t3,s2,t3
    377c:	00ee0833          	add	a6,t3,a4
    3780:	849a                	mv	s1,t1
    3782:	aa91                	j	38d6 <__addtf3+0x58e>
    3784:	4785                	li	a5,1
    3786:	d2040ee3          	beqz	s0,34c2 <__addtf3+0x17a>
    378a:	00890713          	addi	a4,s2,8
    378e:	01273933          	sltu	s2,a4,s2
    3792:	984a                	add	a6,a6,s2
    3794:	893a                	mv	s2,a4
    3796:	d20617e3          	bnez	a2,34c4 <__addtf3+0x17c>
    379a:	b33d                	j	34c8 <__addtf3+0x180>
    379c:	4785                	li	a5,1
    379e:	d475                	beqz	s0,378a <__addtf3+0x442>
    37a0:	d20612e3          	bnez	a2,34c4 <__addtf3+0x17c>
    37a4:	b315                	j	34c8 <__addtf3+0x180>
    37a6:	22040d63          	beqz	s0,39e0 <__addtf3+0x698>
    37aa:	0057e793          	ori	a5,a5,5
    37ae:	b581                	j	35ee <__addtf3+0x2a6>
    37b0:	01c76933          	or	s2,a4,t3
    37b4:	01203933          	snez	s2,s2
    37b8:	b935                	j	33f4 <__addtf3+0xac>
    37ba:	2be48963          	beq	s1,t5,3a6c <__addtf3+0x724>
    37be:	2de30f63          	beq	t1,t5,3a9c <__addtf3+0x754>
    37c2:	2a089f63          	bnez	a7,3a80 <__addtf3+0x738>
    37c6:	2e059463          	bnez	a1,3aae <__addtf3+0x766>
    37ca:	0ffff5b7          	lui	a1,0xffff
    37ce:	4501                	li	a0,0
    37d0:	158e                	slli	a1,a1,0x23
    37d2:	47c1                	li	a5,16
    37d4:	0017a073          	csrs	fflags,a5
    37d8:	70a2                	ld	ra,40(sp)
    37da:	7402                	ld	s0,32(sp)
    37dc:	64e2                	ld	s1,24(sp)
    37de:	6942                	ld	s2,16(sp)
    37e0:	69a2                	ld	s3,8(sp)
    37e2:	6a02                	ld	s4,0(sp)
    37e4:	6145                	addi	sp,sp,48
    37e6:	8082                	ret
    37e8:	00148693          	addi	a3,s1,1
    37ec:	ffe28593          	addi	a1,t0,-2
    37f0:	00b6feb3          	and	t4,a3,a1
    37f4:	220e9163          	bnez	t4,3a16 <__addtf3+0x6ce>
    37f8:	01f866b3          	or	a3,a6,t6
    37fc:	3c049563          	bnez	s1,3bc6 <__addtf3+0x87e>
    3800:	01c765b3          	or	a1,a4,t3
    3804:	40068b63          	beqz	a3,3c1a <__addtf3+0x8d2>
    3808:	2c058c63          	beqz	a1,3ae0 <__addtf3+0x798>
    380c:	01cf8933          	add	s2,t6,t3
    3810:	9742                	add	a4,a4,a6
    3812:	01f93fb3          	sltu	t6,s2,t6
    3816:	01f70833          	add	a6,a4,t6
    381a:	03385793          	srli	a5,a6,0x33
    381e:	8b85                	andi	a5,a5,1
    3820:	c40785e3          	beqz	a5,346a <__addtf3+0x122>
    3824:	03389513          	slli	a0,a7,0x33
    3828:	fff50793          	addi	a5,a0,-1
    382c:	00f87833          	and	a6,a6,a5
    3830:	4485                	li	s1,1
    3832:	00797793          	andi	a5,s2,7
    3836:	b55d                	j	36dc <__addtf3+0x394>
    3838:	41cf8933          	sub	s2,t6,t3
    383c:	012fb633          	sltu	a2,t6,s2
    3840:	40e80a33          	sub	s4,a6,a4
    3844:	40ca0a33          	sub	s4,s4,a2
    3848:	033a5613          	srli	a2,s4,0x33
    384c:	8a05                	andi	a2,a2,1
    384e:	1e061d63          	bnez	a2,3a48 <__addtf3+0x700>
    3852:	014965b3          	or	a1,s2,s4
    3856:	ba059ee3          	bnez	a1,3412 <__addtf3+0xca>
    385a:	19f9                	addi	s3,s3,-2
    385c:	0019b413          	seqz	s0,s3
    3860:	4501                	li	a0,0
    3862:	4481                	li	s1,0
    3864:	bbc5                	j	3654 <__addtf3+0x30c>
    3866:	cde30ee3          	beq	t1,t5,3542 <__addtf3+0x1fa>
    386a:	4785                	li	a5,1
    386c:	17ce                	slli	a5,a5,0x33
    386e:	41d00ebb          	negw	t4,t4
    3872:	00f86833          	or	a6,a6,a5
    3876:	07400793          	li	a5,116
    387a:	0fd7c763          	blt	a5,t4,3968 <__addtf3+0x620>
    387e:	03f00793          	li	a5,63
    3882:	31d7cd63          	blt	a5,t4,3b9c <__addtf3+0x854>
    3886:	04000793          	li	a5,64
    388a:	41d787bb          	subw	a5,a5,t4
    388e:	00f81933          	sll	s2,a6,a5
    3892:	01dfd633          	srl	a2,t6,t4
    3896:	00ff97b3          	sll	a5,t6,a5
    389a:	00c96933          	or	s2,s2,a2
    389e:	00f037b3          	snez	a5,a5
    38a2:	01d85eb3          	srl	t4,a6,t4
    38a6:	00f96933          	or	s2,s2,a5
    38aa:	41d70733          	sub	a4,a4,t4
    38ae:	a0c9                	j	3970 <__addtf3+0x628>
    38b0:	897e                	mv	s2,t6
    38b2:	e1e49fe3          	bne	s1,t5,36d0 <__addtf3+0x388>
    38b6:	01f867b3          	or	a5,a6,t6
    38ba:	dc0790e3          	bnez	a5,367a <__addtf3+0x332>
    38be:	4501                	li	a0,0
    38c0:	4581                	li	a1,0
    38c2:	4781                	li	a5,0
    38c4:	b15d                	j	356a <__addtf3+0x222>
    38c6:	01c76933          	or	s2,a4,t3
    38ca:	01203933          	snez	s2,s2
    38ce:	997e                	add	s2,s2,t6
    38d0:	01f93fb3          	sltu	t6,s2,t6
    38d4:	987e                	add	a6,a6,t6
    38d6:	03385793          	srli	a5,a6,0x33
    38da:	8b85                	andi	a5,a5,1
    38dc:	de078ae3          	beqz	a5,36d0 <__addtf3+0x388>
    38e0:	6721                	lui	a4,0x8
    38e2:	0485                	addi	s1,s1,1
    38e4:	fff70793          	addi	a5,a4,-1 # 7fff <_DYNAMIC+0x16f>
    38e8:	24f48763          	beq	s1,a5,3b36 <__addtf3+0x7ee>
    38ec:	577d                	li	a4,-1
    38ee:	174e                	slli	a4,a4,0x33
    38f0:	177d                	addi	a4,a4,-1
    38f2:	00e87733          	and	a4,a6,a4
    38f6:	00195793          	srli	a5,s2,0x1
    38fa:	00197913          	andi	s2,s2,1
    38fe:	0127e7b3          	or	a5,a5,s2
    3902:	03f71913          	slli	s2,a4,0x3f
    3906:	00f96933          	or	s2,s2,a5
    390a:	00175813          	srli	a6,a4,0x1
    390e:	8b9d                	andi	a5,a5,7
    3910:	b3f1                	j	36dc <__addtf3+0x394>
    3912:	fc15051b          	addiw	a0,a0,-63
    3916:	04000793          	li	a5,64
    391a:	00a855b3          	srl	a1,a6,a0
    391e:	00f70963          	beq	a4,a5,3930 <__addtf3+0x5e8>
    3922:	08000793          	li	a5,128
    3926:	9f99                	subw	a5,a5,a4
    3928:	00f81833          	sll	a6,a6,a5
    392c:	010a6a33          	or	s4,s4,a6
    3930:	01403a33          	snez	s4,s4
    3934:	00ba65b3          	or	a1,s4,a1
    3938:	892e                	mv	s2,a1
    393a:	4801                	li	a6,0
    393c:	be0d                	j	346e <__addtf3+0x126>
    393e:	fc07869b          	addiw	a3,a5,-64
    3942:	04000613          	li	a2,64
    3946:	00d756b3          	srl	a3,a4,a3
    394a:	00c78a63          	beq	a5,a2,395e <__addtf3+0x616>
    394e:	08000613          	li	a2,128
    3952:	40f607bb          	subw	a5,a2,a5
    3956:	00f717b3          	sll	a5,a4,a5
    395a:	00fe6e33          	or	t3,t3,a5
    395e:	01c03933          	snez	s2,t3
    3962:	00d96933          	or	s2,s2,a3
    3966:	b479                	j	33f4 <__addtf3+0xac>
    3968:	01f86933          	or	s2,a6,t6
    396c:	01203933          	snez	s2,s2
    3970:	412e0933          	sub	s2,t3,s2
    3974:	012e3e33          	sltu	t3,t3,s2
    3978:	41c70833          	sub	a6,a4,t3
    397c:	849a                	mv	s1,t1
    397e:	8436                	mv	s0,a3
    3980:	b441                	j	3400 <__addtf3+0xb8>
    3982:	01f867b3          	or	a5,a6,t6
    3986:	26078f63          	beqz	a5,3c04 <__addtf3+0x8bc>
    398a:	fff6c693          	not	a3,a3
    398e:	2681                	sext.w	a3,a3
    3990:	2e068963          	beqz	a3,3c82 <__addtf3+0x93a>
    3994:	dbe317e3          	bne	t1,t5,3742 <__addtf3+0x3fa>
    3998:	01c76e33          	or	t3,a4,t3
    399c:	c40e08e3          	beqz	t3,35ec <__addtf3+0x2a4>
    39a0:	03275793          	srli	a5,a4,0x32
    39a4:	0017c793          	xori	a5,a5,1
    39a8:	0038d693          	srli	a3,a7,0x3
    39ac:	8b85                	andi	a5,a5,1
    39ae:	03d71513          	slli	a0,a4,0x3d
    39b2:	8ef1                	and	a3,a3,a2
    39b4:	0792                	slli	a5,a5,0x4
    39b6:	8d55                	or	a0,a0,a3
    39b8:	00375593          	srli	a1,a4,0x3
    39bc:	b67d                	j	356a <__addtf3+0x222>
    39be:	03285793          	srli	a5,a6,0x32
    39c2:	0038d713          	srli	a4,a7,0x3
    39c6:	0017c793          	xori	a5,a5,1
    39ca:	8d79                	and	a0,a0,a4
    39cc:	8b85                	andi	a5,a5,1
    39ce:	03d81713          	slli	a4,a6,0x3d
    39d2:	0792                	slli	a5,a5,0x4
    39d4:	8d59                	or	a0,a0,a4
    39d6:	00385593          	srli	a1,a6,0x3
    39da:	be41                	j	356a <__addtf3+0x222>
    39dc:	dc0407e3          	beqz	s0,37aa <__addtf3+0x462>
    39e0:	557d                	li	a0,-1
    39e2:	0057e793          	ori	a5,a5,5
    39e6:	00355593          	srli	a1,a0,0x3
    39ea:	ffe68493          	addi	s1,a3,-2
    39ee:	b19d                	j	3654 <__addtf3+0x30c>
    39f0:	04000693          	li	a3,64
    39f4:	9e9d                	subw	a3,a3,a5
    39f6:	00d71933          	sll	s2,a4,a3
    39fa:	00fe5633          	srl	a2,t3,a5
    39fe:	00de16b3          	sll	a3,t3,a3
    3a02:	00c96933          	or	s2,s2,a2
    3a06:	00d036b3          	snez	a3,a3
    3a0a:	00f75733          	srl	a4,a4,a5
    3a0e:	00d96933          	or	s2,s2,a3
    3a12:	983a                	add	a6,a6,a4
    3a14:	bd6d                	j	38ce <__addtf3+0x586>
    3a16:	23e68a63          	beq	a3,t5,3c4a <__addtf3+0x902>
    3a1a:	01cf87b3          	add	a5,t6,t3
    3a1e:	9742                	add	a4,a4,a6
    3a20:	01f7bfb3          	sltu	t6,a5,t6
    3a24:	977e                	add	a4,a4,t6
    3a26:	8385                	srli	a5,a5,0x1
    3a28:	03f71913          	slli	s2,a4,0x3f
    3a2c:	00f96933          	or	s2,s2,a5
    3a30:	00175813          	srli	a6,a4,0x1
    3a34:	8b9d                	andi	a5,a5,7
    3a36:	84b6                	mv	s1,a3
    3a38:	b155                	j	36dc <__addtf3+0x394>
    3a3a:	23e30763          	beq	t1,t5,3c68 <__addtf3+0x920>
    3a3e:	883a                	mv	a6,a4
    3a40:	8972                	mv	s2,t3
    3a42:	849a                	mv	s1,t1
    3a44:	8436                	mv	s0,a3
    3a46:	b169                	j	36d0 <__addtf3+0x388>
    3a48:	41fe0933          	sub	s2,t3,t6
    3a4c:	41070a33          	sub	s4,a4,a6
    3a50:	012e3e33          	sltu	t3,t3,s2
    3a54:	41ca0a33          	sub	s4,s4,t3
    3a58:	8436                	mv	s0,a3
    3a5a:	ba65                	j	3412 <__addtf3+0xca>
    3a5c:	01cf8933          	add	s2,t6,t3
    3a60:	9742                	add	a4,a4,a6
    3a62:	01f93fb3          	sltu	t6,s2,t6
    3a66:	01f70833          	add	a6,a4,t6
    3a6a:	b5b5                	j	38d6 <__addtf3+0x58e>
    3a6c:	02088663          	beqz	a7,3a98 <__addtf3+0x750>
    3a70:	03285793          	srli	a5,a6,0x32
    3a74:	0017c793          	xori	a5,a5,1
    3a78:	8b85                	andi	a5,a5,1
    3a7a:	0792                	slli	a5,a5,0x4
    3a7c:	02930063          	beq	t1,s1,3a9c <__addtf3+0x754>
    3a80:	ae0597e3          	bnez	a1,356e <__addtf3+0x226>
    3a84:	00351693          	slli	a3,a0,0x3
    3a88:	03d81713          	slli	a4,a6,0x3d
    3a8c:	828d                	srli	a3,a3,0x3
    3a8e:	00d76533          	or	a0,a4,a3
    3a92:	00385593          	srli	a1,a6,0x3
    3a96:	bcd1                	j	356a <__addtf3+0x222>
    3a98:	d29317e3          	bne	t1,s1,37c6 <__addtf3+0x47e>
    3a9c:	d20583e3          	beqz	a1,37c2 <__addtf3+0x47a>
    3aa0:	03275593          	srli	a1,a4,0x32
    3aa4:	8985                	andi	a1,a1,1
    3aa6:	e191                	bnez	a1,3aaa <__addtf3+0x762>
    3aa8:	47c1                	li	a5,16
    3aaa:	ac0892e3          	bnez	a7,356e <__addtf3+0x226>
    3aae:	060e                	slli	a2,a2,0x3
    3ab0:	03d71593          	slli	a1,a4,0x3d
    3ab4:	820d                	srli	a2,a2,0x3
    3ab6:	00b66533          	or	a0,a2,a1
    3aba:	8436                	mv	s0,a3
    3abc:	00375593          	srli	a1,a4,0x3
    3ac0:	b46d                	j	356a <__addtf3+0x222>
    3ac2:	41cf8933          	sub	s2,t6,t3
    3ac6:	40e80733          	sub	a4,a6,a4
    3aca:	012fbfb3          	sltu	t6,t6,s2
    3ace:	41f70833          	sub	a6,a4,t6
    3ad2:	b23d                	j	3400 <__addtf3+0xb8>
    3ad4:	12058e63          	beqz	a1,3c10 <__addtf3+0x8c8>
    3ad8:	4581                	li	a1,0
    3ada:	883a                	mv	a6,a4
    3adc:	8ff2                	mv	t6,t3
    3ade:	8436                	mv	s0,a3
    3ae0:	897e                	mv	s2,t6
    3ae2:	ba51                	j	3476 <__addtf3+0x12e>
    3ae4:	897e                	mv	s2,t6
    3ae6:	bfe495e3          	bne	s1,t5,36d0 <__addtf3+0x388>
    3aea:	01f867b3          	or	a5,a6,t6
    3aee:	dc0788e3          	beqz	a5,38be <__addtf3+0x576>
    3af2:	03285793          	srli	a5,a6,0x32
    3af6:	0017c793          	xori	a5,a5,1
    3afa:	0792                	slli	a5,a5,0x4
    3afc:	b669                	j	3686 <__addtf3+0x33e>
    3afe:	00f6f613          	andi	a2,a3,15
    3b02:	4511                	li	a0,4
    3b04:	98a60de3          	beq	a2,a0,349e <__addtf3+0x156>
    3b08:	ffc6b693          	sltiu	a3,a3,-4
    3b0c:	0016c693          	xori	a3,a3,1
    3b10:	1682                	slli	a3,a3,0x20
    3b12:	9281                	srli	a3,a3,0x20
    3b14:	9736                	add	a4,a4,a3
    3b16:	b261                	j	349e <__addtf3+0x156>
    3b18:	4785                	li	a5,1
    3b1a:	980412e3          	bnez	s0,349e <__addtf3+0x156>
    3b1e:	ff86b693          	sltiu	a3,a3,-8
    3b22:	0016c693          	xori	a3,a3,1
    3b26:	1682                	slli	a3,a3,0x20
    3b28:	9281                	srli	a3,a3,0x20
    3b2a:	9736                	add	a4,a4,a3
    3b2c:	ba8d                	j	349e <__addtf3+0x156>
    3b2e:	4785                	li	a5,1
    3b30:	960407e3          	beqz	s0,349e <__addtf3+0x156>
    3b34:	b7ed                	j	3b1e <__addtf3+0x7d6>
    3b36:	02098863          	beqz	s3,3b66 <__addtf3+0x81e>
    3b3a:	478d                	li	a5,3
    3b3c:	1cf98763          	beq	s3,a5,3d0a <__addtf3+0x9c2>
    3b40:	4689                	li	a3,2
    3b42:	4795                	li	a5,5
    3b44:	bad99de3          	bne	s3,a3,36fe <__addtf3+0x3b6>
    3b48:	aa0413e3          	bnez	s0,35ee <__addtf3+0x2a6>
    3b4c:	587d                	li	a6,-1
    3b4e:	597d                	li	s2,-1
    3b50:	ffe70493          	addi	s1,a4,-2
    3b54:	ba95                	j	34c8 <__addtf3+0x180>
    3b56:	16ce                	slli	a3,a3,0x33
    3b58:	00d876b3          	and	a3,a6,a3
    3b5c:	96071ae3          	bnez	a4,34d0 <__addtf3+0x188>
    3b60:	960788e3          	beqz	a5,34d0 <__addtf3+0x188>
    3b64:	b285                	j	34c4 <__addtf3+0x17c>
    3b66:	4795                	li	a5,5
    3b68:	b459                	j	35ee <__addtf3+0x2a6>
    3b6a:	01f86fb3          	or	t6,a6,t6
    3b6e:	a60f8fe3          	beqz	t6,35ec <__addtf3+0x2a4>
    3b72:	03285793          	srli	a5,a6,0x32
    3b76:	0017c793          	xori	a5,a5,1
    3b7a:	0038d693          	srli	a3,a7,0x3
    3b7e:	8b85                	andi	a5,a5,1
    3b80:	03d81713          	slli	a4,a6,0x3d
    3b84:	8ee9                	and	a3,a3,a0
    3b86:	0792                	slli	a5,a5,0x4
    3b88:	00d76533          	or	a0,a4,a3
    3b8c:	00385593          	srli	a1,a6,0x3
    3b90:	bae9                	j	356a <__addtf3+0x222>
    3b92:	01f86933          	or	s2,a6,t6
    3b96:	01203933          	snez	s2,s2
    3b9a:	bef1                	j	3776 <__addtf3+0x42e>
    3b9c:	fc0e879b          	addiw	a5,t4,-64
    3ba0:	04000613          	li	a2,64
    3ba4:	00f857b3          	srl	a5,a6,a5
    3ba8:	00ce8a63          	beq	t4,a2,3bbc <__addtf3+0x874>
    3bac:	08000613          	li	a2,128
    3bb0:	41d6063b          	subw	a2,a2,t4
    3bb4:	00c81633          	sll	a2,a6,a2
    3bb8:	00cfefb3          	or	t6,t6,a2
    3bbc:	01f03933          	snez	s2,t6
    3bc0:	00f96933          	or	s2,s2,a5
    3bc4:	b375                	j	3970 <__addtf3+0x628>
    3bc6:	0de48763          	beq	s1,t5,3c94 <__addtf3+0x94c>
    3bca:	17e30863          	beq	t1,t5,3d3a <__addtf3+0x9f2>
    3bce:	c6fd                	beqz	a3,3cbc <__addtf3+0x974>
    3bd0:	01c76e33          	or	t3,a4,t3
    3bd4:	980e1de3          	bnez	t3,356e <__addtf3+0x226>
    3bd8:	050e                	slli	a0,a0,0x3
    3bda:	810d                	srli	a0,a0,0x3
    3bdc:	03d81713          	slli	a4,a6,0x3d
    3be0:	8d59                	or	a0,a0,a4
    3be2:	00385593          	srli	a1,a6,0x3
    3be6:	b251                	j	356a <__addtf3+0x222>
    3be8:	41fe0933          	sub	s2,t3,t6
    3bec:	41070733          	sub	a4,a4,a6
    3bf0:	012e3e33          	sltu	t3,t3,s2
    3bf4:	41c70833          	sub	a6,a4,t3
    3bf8:	849a                	mv	s1,t1
    3bfa:	8436                	mv	s0,a3
    3bfc:	805ff06f          	j	3400 <__addtf3+0xb8>
    3c00:	8436                	mv	s0,a3
    3c02:	b2ed                	j	35ec <__addtf3+0x2a4>
    3c04:	11e30c63          	beq	t1,t5,3d1c <__addtf3+0x9d4>
    3c08:	883a                	mv	a6,a4
    3c0a:	8972                	mv	s2,t3
    3c0c:	849a                	mv	s1,t1
    3c0e:	b4c9                	j	36d0 <__addtf3+0x388>
    3c10:	19f9                	addi	s3,s3,-2
    3c12:	0019b413          	seqz	s0,s3
    3c16:	4501                	li	a0,0
    3c18:	bc35                	j	3654 <__addtf3+0x30c>
    3c1a:	883a                	mv	a6,a4
    3c1c:	8972                	mv	s2,t3
    3c1e:	b881                	j	346e <__addtf3+0x126>
    3c20:	fc06879b          	addiw	a5,a3,-64
    3c24:	04000613          	li	a2,64
    3c28:	00f857b3          	srl	a5,a6,a5
    3c2c:	00c68a63          	beq	a3,a2,3c40 <__addtf3+0x8f8>
    3c30:	08000613          	li	a2,128
    3c34:	40d606bb          	subw	a3,a2,a3
    3c38:	00d816b3          	sll	a3,a6,a3
    3c3c:	00dfefb3          	or	t6,t6,a3
    3c40:	01f03933          	snez	s2,t6
    3c44:	00f96933          	or	s2,s2,a5
    3c48:	b63d                	j	3776 <__addtf3+0x42e>
    3c4a:	f0098ee3          	beqz	s3,3b66 <__addtf3+0x81e>
    3c4e:	478d                	li	a5,3
    3c50:	10f98263          	beq	s3,a5,3d54 <__addtf3+0xa0c>
    3c54:	4709                	li	a4,2
    3c56:	4795                	li	a5,5
    3c58:	aae993e3          	bne	s3,a4,36fe <__addtf3+0x3b6>
    3c5c:	980419e3          	bnez	s0,35ee <__addtf3+0x2a6>
    3c60:	587d                	li	a6,-1
    3c62:	597d                	li	s2,-1
    3c64:	84ae                	mv	s1,a1
    3c66:	b08d                	j	34c8 <__addtf3+0x180>
    3c68:	01c767b3          	or	a5,a4,t3
    3c6c:	c7e9                	beqz	a5,3d36 <__addtf3+0x9ee>
    3c6e:	03275793          	srli	a5,a4,0x32
    3c72:	0017c793          	xori	a5,a5,1
    3c76:	8b85                	andi	a5,a5,1
    3c78:	0792                	slli	a5,a5,0x4
    3c7a:	883a                	mv	a6,a4
    3c7c:	8ff2                	mv	t6,t3
    3c7e:	8436                	mv	s0,a3
    3c80:	b419                	j	3686 <__addtf3+0x33e>
    3c82:	01cf8933          	add	s2,t6,t3
    3c86:	9742                	add	a4,a4,a6
    3c88:	01c93e33          	sltu	t3,s2,t3
    3c8c:	01c70833          	add	a6,a4,t3
    3c90:	849a                	mv	s1,t1
    3c92:	b191                	j	38d6 <__addtf3+0x58e>
    3c94:	cacd                	beqz	a3,3d46 <__addtf3+0x9fe>
    3c96:	03285793          	srli	a5,a6,0x32
    3c9a:	0017c793          	xori	a5,a5,1
    3c9e:	8b85                	andi	a5,a5,1
    3ca0:	0792                	slli	a5,a5,0x4
    3ca2:	f29317e3          	bne	t1,s1,3bd0 <__addtf3+0x888>
    3ca6:	01c76e33          	or	t3,a4,t3
    3caa:	f20e07e3          	beqz	t3,3bd8 <__addtf3+0x890>
    3cae:	03275593          	srli	a1,a4,0x32
    3cb2:	8985                	andi	a1,a1,1
    3cb4:	e191                	bnez	a1,3cb8 <__addtf3+0x970>
    3cb6:	47c1                	li	a5,16
    3cb8:	8a069be3          	bnez	a3,356e <__addtf3+0x226>
    3cbc:	060e                	slli	a2,a2,0x3
    3cbe:	820d                	srli	a2,a2,0x3
    3cc0:	03d71693          	slli	a3,a4,0x3d
    3cc4:	00d66533          	or	a0,a2,a3
    3cc8:	00375593          	srli	a1,a4,0x3
    3ccc:	b879                	j	356a <__addtf3+0x222>
    3cce:	00c565b3          	or	a1,a0,a2
    3cd2:	dd9d                	beqz	a1,3c10 <__addtf3+0x8c8>
    3cd4:	8faa                	mv	t6,a0
    3cd6:	00757593          	andi	a1,a0,7
    3cda:	8832                	mv	a6,a2
    3cdc:	897e                	mv	s2,t6
    3cde:	f98ff06f          	j	3476 <__addtf3+0x12e>
    3ce2:	01c76e33          	or	t3,a4,t3
    3ce6:	900e03e3          	beqz	t3,35ec <__addtf3+0x2a4>
    3cea:	03275793          	srli	a5,a4,0x32
    3cee:	0038d513          	srli	a0,a7,0x3
    3cf2:	0017c793          	xori	a5,a5,1
    3cf6:	8b85                	andi	a5,a5,1
    3cf8:	8e69                	and	a2,a2,a0
    3cfa:	03d71693          	slli	a3,a4,0x3d
    3cfe:	0792                	slli	a5,a5,0x4
    3d00:	00d66533          	or	a0,a2,a3
    3d04:	00375593          	srli	a1,a4,0x3
    3d08:	b08d                	j	356a <__addtf3+0x222>
    3d0a:	e4040ee3          	beqz	s0,3b66 <__addtf3+0x81e>
    3d0e:	ffe70493          	addi	s1,a4,-2
    3d12:	4795                	li	a5,5
    3d14:	587d                	li	a6,-1
    3d16:	597d                	li	s2,-1
    3d18:	fb0ff06f          	j	34c8 <__addtf3+0x180>
    3d1c:	01c767b3          	or	a5,a4,t3
    3d20:	b8078fe3          	beqz	a5,38be <__addtf3+0x576>
    3d24:	03275793          	srli	a5,a4,0x32
    3d28:	0017c793          	xori	a5,a5,1
    3d2c:	8b85                	andi	a5,a5,1
    3d2e:	0792                	slli	a5,a5,0x4
    3d30:	883a                	mv	a6,a4
    3d32:	8ff2                	mv	t6,t3
    3d34:	ba89                	j	3686 <__addtf3+0x33e>
    3d36:	8436                	mv	s0,a3
    3d38:	b659                	j	38be <__addtf3+0x576>
    3d3a:	01c76e33          	or	t3,a4,t3
    3d3e:	f60e18e3          	bnez	t3,3cae <__addtf3+0x966>
    3d42:	dead                	beqz	a3,3cbc <__addtf3+0x974>
    3d44:	bd51                	j	3bd8 <__addtf3+0x890>
    3d46:	f6931be3          	bne	t1,s1,3cbc <__addtf3+0x974>
    3d4a:	01c76e33          	or	t3,a4,t3
    3d4e:	f60e10e3          	bnez	t3,3cae <__addtf3+0x966>
    3d52:	b7ad                	j	3cbc <__addtf3+0x974>
    3d54:	e00409e3          	beqz	s0,3b66 <__addtf3+0x81e>
    3d58:	84ae                	mv	s1,a1
    3d5a:	4795                	li	a5,5
    3d5c:	587d                	li	a6,-1
    3d5e:	597d                	li	s2,-1
    3d60:	f68ff06f          	j	34c8 <__addtf3+0x180>

0000000000003d64 <__eqtf2>:
    3d64:	832a                	mv	t1,a0
    3d66:	002027f3          	frrm	a5
    3d6a:	6721                	lui	a4,0x8
    3d6c:	177d                	addi	a4,a4,-1
    3d6e:	0305d813          	srli	a6,a1,0x30
    3d72:	57fd                	li	a5,-1
    3d74:	83c1                	srli	a5,a5,0x10
    3d76:	0306d893          	srli	a7,a3,0x30
    3d7a:	00e87833          	and	a6,a6,a4
    3d7e:	00f5fe33          	and	t3,a1,a5
    3d82:	00e8f8b3          	and	a7,a7,a4
    3d86:	8ff5                	and	a5,a5,a3
    3d88:	91fd                	srli	a1,a1,0x3f
    3d8a:	92fd                	srli	a3,a3,0x3f
    3d8c:	02e80063          	beq	a6,a4,3dac <__eqtf2+0x48>
    3d90:	00e88663          	beq	a7,a4,3d9c <__eqtf2+0x38>
    3d94:	4505                	li	a0,1
    3d96:	03180463          	beq	a6,a7,3dbe <__eqtf2+0x5a>
    3d9a:	8082                	ret
    3d9c:	8e5d                	or	a2,a2,a5
    3d9e:	c609                	beqz	a2,3da8 <__eqtf2+0x44>
    3da0:	93bd                	srli	a5,a5,0x2f
    3da2:	e399                	bnez	a5,3da8 <__eqtf2+0x44>
    3da4:	00186073          	csrsi	fflags,16
    3da8:	4505                	li	a0,1
    3daa:	8082                	ret
    3dac:	00ae6733          	or	a4,t3,a0
    3db0:	e71d                	bnez	a4,3dde <__eqtf2+0x7a>
    3db2:	4505                	li	a0,1
    3db4:	ff0893e3          	bne	a7,a6,3d9a <__eqtf2+0x36>
    3db8:	00c7e733          	or	a4,a5,a2
    3dbc:	f375                	bnez	a4,3da0 <__eqtf2+0x3c>
    3dbe:	4505                	li	a0,1
    3dc0:	fcfe1de3          	bne	t3,a5,3d9a <__eqtf2+0x36>
    3dc4:	fcc31be3          	bne	t1,a2,3d9a <__eqtf2+0x36>
    3dc8:	4501                	li	a0,0
    3dca:	fcd588e3          	beq	a1,a3,3d9a <__eqtf2+0x36>
    3dce:	4505                	li	a0,1
    3dd0:	fc0815e3          	bnez	a6,3d9a <__eqtf2+0x36>
    3dd4:	006e6e33          	or	t3,t3,t1
    3dd8:	01c03533          	snez	a0,t3
    3ddc:	8082                	ret
    3dde:	02fe5e13          	srli	t3,t3,0x2f
    3de2:	fc0e01e3          	beqz	t3,3da4 <__eqtf2+0x40>
    3de6:	4505                	li	a0,1
    3de8:	fb0899e3          	bne	a7,a6,3d9a <__eqtf2+0x36>
    3dec:	8e5d                	or	a2,a2,a5
    3dee:	fa4d                	bnez	a2,3da0 <__eqtf2+0x3c>
    3df0:	8082                	ret

0000000000003df2 <__multf3>:
    3df2:	7159                	addi	sp,sp,-112
    3df4:	f0a2                	sd	s0,96(sp)
    3df6:	e8ca                	sd	s2,80(sp)
    3df8:	ec66                	sd	s9,24(sp)
    3dfa:	f486                	sd	ra,104(sp)
    3dfc:	eca6                	sd	s1,88(sp)
    3dfe:	e4ce                	sd	s3,72(sp)
    3e00:	e0d2                	sd	s4,64(sp)
    3e02:	fc56                	sd	s5,56(sp)
    3e04:	f85a                	sd	s6,48(sp)
    3e06:	f45e                	sd	s7,40(sp)
    3e08:	f062                	sd	s8,32(sp)
    3e0a:	e86a                	sd	s10,16(sp)
    3e0c:	e46e                	sd	s11,8(sp)
    3e0e:	842a                	mv	s0,a0
    3e10:	8cb2                	mv	s9,a2
    3e12:	8936                	mv	s2,a3
    3e14:	00202a73          	frrm	s4
    3e18:	6721                	lui	a4,0x8
    3e1a:	0305d793          	srli	a5,a1,0x30
    3e1e:	177d                	addi	a4,a4,-1
    3e20:	01059a93          	slli	s5,a1,0x10
    3e24:	8ff9                	and	a5,a5,a4
    3e26:	2a01                	sext.w	s4,s4
    3e28:	010ada93          	srli	s5,s5,0x10
    3e2c:	03f5dc13          	srli	s8,a1,0x3f
    3e30:	38078063          	beqz	a5,41b0 <__multf3+0x3be>
    3e34:	0007881b          	sext.w	a6,a5
    3e38:	30e78a63          	beq	a5,a4,414c <__multf3+0x35a>
    3e3c:	0a8e                	slli	s5,s5,0x3
    3e3e:	03d55713          	srli	a4,a0,0x3d
    3e42:	01576733          	or	a4,a4,s5
    3e46:	7871                	lui	a6,0xffffc
    3e48:	4a85                	li	s5,1
    3e4a:	1ace                	slli	s5,s5,0x33
    3e4c:	0805                	addi	a6,a6,1
    3e4e:	01576ab3          	or	s5,a4,s5
    3e52:	00351b93          	slli	s7,a0,0x3
    3e56:	01078db3          	add	s11,a5,a6
    3e5a:	4481                	li	s1,0
    3e5c:	4d01                	li	s10,0
    3e5e:	4981                	li	s3,0
    3e60:	6721                	lui	a4,0x8
    3e62:	03095693          	srli	a3,s2,0x30
    3e66:	fff70793          	addi	a5,a4,-1 # 7fff <_DYNAMIC+0x16f>
    3e6a:	01091413          	slli	s0,s2,0x10
    3e6e:	8efd                	and	a3,a3,a5
    3e70:	8b66                	mv	s6,s9
    3e72:	8041                	srli	s0,s0,0x10
    3e74:	03f95913          	srli	s2,s2,0x3f
    3e78:	2e068463          	beqz	a3,4160 <__multf3+0x36e>
    3e7c:	0006851b          	sext.w	a0,a3
    3e80:	04f68163          	beq	a3,a5,3ec2 <__multf3+0xd0>
    3e84:	040e                	slli	s0,s0,0x3
    3e86:	03dcd793          	srli	a5,s9,0x3d
    3e8a:	7571                	lui	a0,0xffffc
    3e8c:	8fc1                	or	a5,a5,s0
    3e8e:	0505                	addi	a0,a0,1
    3e90:	4405                	li	s0,1
    3e92:	9536                	add	a0,a0,a3
    3e94:	144e                	slli	s0,s0,0x33
    3e96:	8c5d                	or	s0,s0,a5
    3e98:	956e                	add	a0,a0,s11
    3e9a:	012c47b3          	xor	a5,s8,s2
    3e9e:	4729                	li	a4,10
    3ea0:	003c9b13          	slli	s6,s9,0x3
    3ea4:	4581                	li	a1,0
    3ea6:	863e                	mv	a2,a5
    3ea8:	00150813          	addi	a6,a0,1 # ffffffffffffc001 <__BSS_END__+0xffffffffffff37c1>
    3eac:	02975c63          	bge	a4,s1,3ee4 <__multf3+0xf2>
    3eb0:	47ad                	li	a5,11
    3eb2:	8662                	mv	a2,s8
    3eb4:	0af49763          	bne	s1,a5,3f62 <__multf3+0x170>
    3eb8:	864a                	mv	a2,s2
    3eba:	8aa2                	mv	s5,s0
    3ebc:	8bda                	mv	s7,s6
    3ebe:	8d2e                	mv	s10,a1
    3ec0:	a04d                	j	3f62 <__multf3+0x170>
    3ec2:	008ce7b3          	or	a5,s9,s0
    3ec6:	956e                	add	a0,a0,s11
    3ec8:	e7b5                	bnez	a5,3f34 <__multf3+0x142>
    3eca:	012c47b3          	xor	a5,s8,s2
    3ece:	0024e493          	ori	s1,s1,2
    3ed2:	45a9                	li	a1,10
    3ed4:	863e                	mv	a2,a5
    3ed6:	00ed8833          	add	a6,s11,a4
    3eda:	4401                	li	s0,0
    3edc:	4b01                	li	s6,0
    3ede:	3a95cd63          	blt	a1,s1,4298 <__multf3+0x4a6>
    3ee2:	4589                	li	a1,2
    3ee4:	4709                	li	a4,2
    3ee6:	06974863          	blt	a4,s1,3f56 <__multf3+0x164>
    3eea:	14fd                	addi	s1,s1,-1
    3eec:	4685                	li	a3,1
    3eee:	0896ee63          	bltu	a3,s1,3f8a <__multf3+0x198>
    3ef2:	24e58763          	beq	a1,a4,4140 <__multf3+0x34e>
    3ef6:	4785                	li	a5,1
    3ef8:	2ef59f63          	bne	a1,a5,41f6 <__multf3+0x404>
    3efc:	87b2                	mv	a5,a2
    3efe:	4681                	li	a3,0
    3f00:	4401                	li	s0,0
    3f02:	4501                	li	a0,0
    3f04:	07be                	slli	a5,a5,0xf
    3f06:	01041593          	slli	a1,s0,0x10
    3f0a:	8fd5                	or	a5,a5,a3
    3f0c:	17c2                	slli	a5,a5,0x30
    3f0e:	81c1                	srli	a1,a1,0x10
    3f10:	8ddd                	or	a1,a1,a5
    3f12:	44099963          	bnez	s3,4364 <__multf3+0x572>
    3f16:	70a6                	ld	ra,104(sp)
    3f18:	7406                	ld	s0,96(sp)
    3f1a:	64e6                	ld	s1,88(sp)
    3f1c:	6946                	ld	s2,80(sp)
    3f1e:	69a6                	ld	s3,72(sp)
    3f20:	6a06                	ld	s4,64(sp)
    3f22:	7ae2                	ld	s5,56(sp)
    3f24:	7b42                	ld	s6,48(sp)
    3f26:	7ba2                	ld	s7,40(sp)
    3f28:	7c02                	ld	s8,32(sp)
    3f2a:	6ce2                	ld	s9,24(sp)
    3f2c:	6d42                	ld	s10,16(sp)
    3f2e:	6da2                	ld	s11,8(sp)
    3f30:	6165                	addi	sp,sp,112
    3f32:	8082                	ret
    3f34:	02f45793          	srli	a5,s0,0x2f
    3f38:	8b85                	andi	a5,a5,1
    3f3a:	0034e493          	ori	s1,s1,3
    3f3e:	e391                	bnez	a5,3f42 <__multf3+0x150>
    3f40:	49c1                	li	s3,16
    3f42:	65a1                	lui	a1,0x8
    3f44:	012c47b3          	xor	a5,s8,s2
    3f48:	4729                	li	a4,10
    3f4a:	00bd8833          	add	a6,s11,a1
    3f4e:	863e                	mv	a2,a5
    3f50:	458d                	li	a1,3
    3f52:	34974463          	blt	a4,s1,429a <__multf3+0x4a8>
    3f56:	4705                	li	a4,1
    3f58:	00971733          	sll	a4,a4,s1
    3f5c:	53077693          	andi	a3,a4,1328
    3f60:	ce91                	beqz	a3,3f7c <__multf3+0x18a>
    3f62:	4789                	li	a5,2
    3f64:	1cfd0e63          	beq	s10,a5,4140 <__multf3+0x34e>
    3f68:	478d                	li	a5,3
    3f6a:	4efd0f63          	beq	s10,a5,4468 <__multf3+0x676>
    3f6e:	85ea                	mv	a1,s10
    3f70:	4785                	li	a5,1
    3f72:	8456                	mv	s0,s5
    3f74:	8b5e                	mv	s6,s7
    3f76:	f8f583e3          	beq	a1,a5,3efc <__multf3+0x10a>
    3f7a:	acb5                	j	41f6 <__multf3+0x404>
    3f7c:	24077693          	andi	a3,a4,576
    3f80:	48069b63          	bnez	a3,4416 <__multf3+0x624>
    3f84:	08877713          	andi	a4,a4,136
    3f88:	fb05                	bnez	a4,3eb8 <__multf3+0xc6>
    3f8a:	577d                	li	a4,-1
    3f8c:	9301                	srli	a4,a4,0x20
    3f8e:	00ebf6b3          	and	a3,s7,a4
    3f92:	020bd493          	srli	s1,s7,0x20
    3f96:	020b5313          	srli	t1,s6,0x20
    3f9a:	00eb7733          	and	a4,s6,a4
    3f9e:	02d703b3          	mul	t2,a4,a3
    3fa2:	017a8eb3          	add	t4,s5,s7
    3fa6:	016408b3          	add	a7,s0,s6
    3faa:	017ebf33          	sltu	t5,t4,s7
    3fae:	0168bfb3          	sltu	t6,a7,s6
    3fb2:	8bfa                	mv	s7,t5
    3fb4:	8b7e                	mv	s6,t6
    3fb6:	02e48733          	mul	a4,s1,a4
    3fba:	0203d593          	srli	a1,t2,0x20
    3fbe:	02d306b3          	mul	a3,t1,a3
    3fc2:	96ba                	add	a3,a3,a4
    3fc4:	95b6                	add	a1,a1,a3
    3fc6:	026484b3          	mul	s1,s1,t1
    3fca:	00e5f563          	bgeu	a1,a4,3fd4 <__multf3+0x1e2>
    3fce:	4705                	li	a4,1
    3fd0:	1702                	slli	a4,a4,0x20
    3fd2:	94ba                	add	s1,s1,a4
    3fd4:	577d                	li	a4,-1
    3fd6:	9301                	srli	a4,a4,0x20
    3fd8:	00eef6b3          	and	a3,t4,a4
    3fdc:	00e8f333          	and	t1,a7,a4
    3fe0:	020ed913          	srli	s2,t4,0x20
    3fe4:	0208d293          	srli	t0,a7,0x20
    3fe8:	02d30c33          	mul	s8,t1,a3
    3fec:	00e5fe33          	and	t3,a1,a4
    3ff0:	1e02                	slli	t3,t3,0x20
    3ff2:	00e3f733          	and	a4,t2,a4
    3ff6:	9e3a                	add	t3,t3,a4
    3ff8:	9181                	srli	a1,a1,0x20
    3ffa:	95a6                	add	a1,a1,s1
    3ffc:	02690333          	mul	t1,s2,t1
    4000:	020c5713          	srli	a4,s8,0x20
    4004:	02d286b3          	mul	a3,t0,a3
    4008:	969a                	add	a3,a3,t1
    400a:	9736                	add	a4,a4,a3
    400c:	02590933          	mul	s2,s2,t0
    4010:	00677563          	bgeu	a4,t1,401a <__multf3+0x228>
    4014:	4685                	li	a3,1
    4016:	1682                	slli	a3,a3,0x20
    4018:	9936                	add	s2,s2,a3
    401a:	56fd                	li	a3,-1
    401c:	9281                	srli	a3,a3,0x20
    401e:	020ad493          	srli	s1,s5,0x20
    4022:	02045c93          	srli	s9,s0,0x20
    4026:	00dafab3          	and	s5,s5,a3
    402a:	8c75                	and	s0,s0,a3
    402c:	028a83b3          	mul	t2,s5,s0
    4030:	00d772b3          	and	t0,a4,a3
    4034:	1282                	slli	t0,t0,0x20
    4036:	00dc7c33          	and	s8,s8,a3
    403a:	9301                	srli	a4,a4,0x20
    403c:	92e2                	add	t0,t0,s8
    403e:	02848433          	mul	s0,s1,s0
    4042:	0203d313          	srli	t1,t2,0x20
    4046:	035c8ab3          	mul	s5,s9,s5
    404a:	9aa2                	add	s5,s5,s0
    404c:	9356                	add	t1,t1,s5
    404e:	039484b3          	mul	s1,s1,s9
    4052:	00837563          	bgeu	t1,s0,405c <__multf3+0x26a>
    4056:	4685                	li	a3,1
    4058:	1682                	slli	a3,a3,0x20
    405a:	94b6                	add	s1,s1,a3
    405c:	92ae                	add	t0,t0,a1
    405e:	00b2b6b3          	sltu	a3,t0,a1
    4062:	9736                	add	a4,a4,a3
    4064:	41600b33          	neg	s6,s6
    4068:	01270433          	add	s0,a4,s2
    406c:	01db7b33          	and	s6,s6,t4
    4070:	41700bb3          	neg	s7,s7
    4074:	5efd                	li	t4,-1
    4076:	9b22                	add	s6,s6,s0
    4078:	020ede93          	srli	t4,t4,0x20
    407c:	01ff7f33          	and	t5,t5,t6
    4080:	011bfbb3          	and	s7,s7,a7
    4084:	00d436b3          	sltu	a3,s0,a3
    4088:	9bda                	add	s7,s7,s6
    408a:	01d37733          	and	a4,t1,t4
    408e:	96fa                	add	a3,a3,t5
    4090:	41c28fb3          	sub	t6,t0,t3
    4094:	008b3f33          	sltu	t5,s6,s0
    4098:	01d3f3b3          	and	t2,t2,t4
    409c:	40bb88b3          	sub	a7,s7,a1
    40a0:	96fa                	add	a3,a3,t5
    40a2:	02035313          	srli	t1,t1,0x20
    40a6:	1702                	slli	a4,a4,0x20
    40a8:	016bbeb3          	sltu	t4,s7,s6
    40ac:	01f2bf33          	sltu	t5,t0,t6
    40b0:	971e                	add	a4,a4,t2
    40b2:	9326                	add	t1,t1,s1
    40b4:	011bb3b3          	sltu	t2,s7,a7
    40b8:	96f6                	add	a3,a3,t4
    40ba:	41e888b3          	sub	a7,a7,t5
    40be:	01f2f463          	bgeu	t0,t6,40c6 <__multf3+0x2d4>
    40c2:	3b758163          	beq	a1,s7,4464 <__multf3+0x672>
    40c6:	40ef8f33          	sub	t5,t6,a4
    40ca:	406885b3          	sub	a1,a7,t1
    40ce:	01efbeb3          	sltu	t4,t6,t5
    40d2:	969a                	add	a3,a3,t1
    40d4:	00b8b8b3          	sltu	a7,a7,a1
    40d8:	41d70333          	sub	t1,a4,t4
    40dc:	01eff663          	bgeu	t6,t5,40e8 <__multf3+0x2f6>
    40e0:	0015be93          	seqz	t4,a1
    40e4:	011ee8b3          	or	a7,t4,a7
    40e8:	959a                	add	a1,a1,t1
    40ea:	00e5b433          	sltu	s0,a1,a4
    40ee:	9436                	add	s0,s0,a3
    40f0:	40740433          	sub	s0,s0,t2
    40f4:	41140433          	sub	s0,s0,a7
    40f8:	00df1b13          	slli	s6,t5,0xd
    40fc:	0436                	slli	s0,s0,0xd
    40fe:	01cb6b33          	or	s6,s6,t3
    4102:	033f5713          	srli	a4,t5,0x33
    4106:	03445693          	srli	a3,s0,0x34
    410a:	01603b33          	snez	s6,s6
    410e:	0335d893          	srli	a7,a1,0x33
    4112:	00eb6b33          	or	s6,s6,a4
    4116:	05b6                	slli	a1,a1,0xd
    4118:	0016f713          	andi	a4,a3,1
    411c:	01146433          	or	s0,s0,a7
    4120:	00bb6b33          	or	s6,s6,a1
    4124:	cb79                	beqz	a4,41fa <__multf3+0x408>
    4126:	001b5713          	srli	a4,s6,0x1
    412a:	001b7b13          	andi	s6,s6,1
    412e:	03f41693          	slli	a3,s0,0x3f
    4132:	01676733          	or	a4,a4,s6
    4136:	00d76b33          	or	s6,a4,a3
    413a:	8005                	srli	s0,s0,0x1
    413c:	8542                	mv	a0,a6
    413e:	a875                	j	41fa <__multf3+0x408>
    4140:	66a1                	lui	a3,0x8
    4142:	87b2                	mv	a5,a2
    4144:	16fd                	addi	a3,a3,-1
    4146:	4401                	li	s0,0
    4148:	4501                	li	a0,0
    414a:	bb6d                	j	3f04 <__multf3+0x112>
    414c:	00aaebb3          	or	s7,s5,a0
    4150:	100b9363          	bnez	s7,4256 <__multf3+0x464>
    4154:	4a81                	li	s5,0
    4156:	44a1                	li	s1,8
    4158:	8dc2                	mv	s11,a6
    415a:	4d09                	li	s10,2
    415c:	4981                	li	s3,0
    415e:	b309                	j	3e60 <__multf3+0x6e>
    4160:	008ce7b3          	or	a5,s9,s0
    4164:	10078b63          	beqz	a5,427a <__multf3+0x488>
    4168:	22040363          	beqz	s0,438e <__multf3+0x59c>
    416c:	8522                	mv	a0,s0
    416e:	064010ef          	jal	ra,51d2 <__clzdi2>
    4172:	0005071b          	sext.w	a4,a0
    4176:	ff15079b          	addiw	a5,a0,-15
    417a:	03d00693          	li	a3,61
    417e:	00378b1b          	addiw	s6,a5,3
    4182:	40f687bb          	subw	a5,a3,a5
    4186:	01641433          	sll	s0,s0,s6
    418a:	00fcd7b3          	srl	a5,s9,a5
    418e:	8c5d                	or	s0,s0,a5
    4190:	016c9b33          	sll	s6,s9,s6
    4194:	7571                	lui	a0,0xffffc
    4196:	0545                	addi	a0,a0,17
    4198:	8d19                	sub	a0,a0,a4
    419a:	956e                	add	a0,a0,s11
    419c:	012c47b3          	xor	a5,s8,s2
    41a0:	4729                	li	a4,10
    41a2:	4581                	li	a1,0
    41a4:	863e                	mv	a2,a5
    41a6:	00150813          	addi	a6,a0,1 # ffffffffffffc001 <__BSS_END__+0xffffffffffff37c1>
    41aa:	d09743e3          	blt	a4,s1,3eb0 <__multf3+0xbe>
    41ae:	bb1d                	j	3ee4 <__multf3+0xf2>
    41b0:	00aaebb3          	or	s7,s5,a0
    41b4:	0a0b8d63          	beqz	s7,426e <__multf3+0x47c>
    41b8:	1a0a8963          	beqz	s5,436a <__multf3+0x578>
    41bc:	8556                	mv	a0,s5
    41be:	014010ef          	jal	ra,51d2 <__clzdi2>
    41c2:	0005071b          	sext.w	a4,a0
    41c6:	ff15079b          	addiw	a5,a0,-15
    41ca:	03d00693          	li	a3,61
    41ce:	00378b9b          	addiw	s7,a5,3
    41d2:	40f687bb          	subw	a5,a3,a5
    41d6:	017a9ab3          	sll	s5,s5,s7
    41da:	00f457b3          	srl	a5,s0,a5
    41de:	0157eab3          	or	s5,a5,s5
    41e2:	01741bb3          	sll	s7,s0,s7
    41e6:	7871                	lui	a6,0xffffc
    41e8:	0845                	addi	a6,a6,17
    41ea:	40e80db3          	sub	s11,a6,a4
    41ee:	4481                	li	s1,0
    41f0:	4d01                	li	s10,0
    41f2:	4981                	li	s3,0
    41f4:	b1b5                	j	3e60 <__multf3+0x6e>
    41f6:	87b2                	mv	a5,a2
    41f8:	8542                	mv	a0,a6
    41fa:	6711                	lui	a4,0x4
    41fc:	177d                	addi	a4,a4,-1
    41fe:	972a                	add	a4,a4,a0
    4200:	0ae05563          	blez	a4,42aa <__multf3+0x4b8>
    4204:	007b7693          	andi	a3,s6,7
    4208:	ca99                	beqz	a3,421e <__multf3+0x42c>
    420a:	4689                	li	a3,2
    420c:	0019e993          	ori	s3,s3,1
    4210:	2ada0263          	beq	s4,a3,44b4 <__multf3+0x6c2>
    4214:	468d                	li	a3,3
    4216:	22da0e63          	beq	s4,a3,4452 <__multf3+0x660>
    421a:	220a0063          	beqz	s4,443a <__multf3+0x648>
    421e:	03445693          	srli	a3,s0,0x34
    4222:	8a85                	andi	a3,a3,1
    4224:	c699                	beqz	a3,4232 <__multf3+0x440>
    4226:	577d                	li	a4,-1
    4228:	1752                	slli	a4,a4,0x34
    422a:	177d                	addi	a4,a4,-1
    422c:	8c79                	and	s0,s0,a4
    422e:	6711                	lui	a4,0x4
    4230:	972a                	add	a4,a4,a0
    4232:	66a1                	lui	a3,0x8
    4234:	ffe68593          	addi	a1,a3,-2 # 7ffe <_DYNAMIC+0x16e>
    4238:	1ce5c063          	blt	a1,a4,43f8 <__multf3+0x606>
    423c:	16fd                	addi	a3,a3,-1
    423e:	8ef9                	and	a3,a3,a4
    4240:	03d41513          	slli	a0,s0,0x3d
    4244:	003b5b13          	srli	s6,s6,0x3
    4248:	0436                	slli	s0,s0,0xd
    424a:	16c2                	slli	a3,a3,0x30
    424c:	01656533          	or	a0,a0,s6
    4250:	8041                	srli	s0,s0,0x10
    4252:	92c1                	srli	a3,a3,0x30
    4254:	b945                	j	3f04 <__multf3+0x112>
    4256:	02fad993          	srli	s3,s5,0x2f
    425a:	0019c993          	xori	s3,s3,1
    425e:	0019f993          	andi	s3,s3,1
    4262:	0992                	slli	s3,s3,0x4
    4264:	8baa                	mv	s7,a0
    4266:	44b1                	li	s1,12
    4268:	8dc2                	mv	s11,a6
    426a:	4d0d                	li	s10,3
    426c:	bed5                	j	3e60 <__multf3+0x6e>
    426e:	4a81                	li	s5,0
    4270:	4491                	li	s1,4
    4272:	4d81                	li	s11,0
    4274:	4d05                	li	s10,1
    4276:	4981                	li	s3,0
    4278:	b6e5                	j	3e60 <__multf3+0x6e>
    427a:	856e                	mv	a0,s11
    427c:	012c47b3          	xor	a5,s8,s2
    4280:	0014e493          	ori	s1,s1,1
    4284:	4729                	li	a4,10
    4286:	4401                	li	s0,0
    4288:	4b01                	li	s6,0
    428a:	4585                	li	a1,1
    428c:	863e                	mv	a2,a5
    428e:	00150813          	addi	a6,a0,1
    4292:	c0974fe3          	blt	a4,s1,3eb0 <__multf3+0xbe>
    4296:	b1b9                	j	3ee4 <__multf3+0xf2>
    4298:	4589                	li	a1,2
    429a:	47bd                	li	a5,15
    429c:	c0f49ae3          	bne	s1,a5,3eb0 <__multf3+0xbe>
    42a0:	4405                	li	s0,1
    42a2:	4781                	li	a5,0
    42a4:	143e                	slli	s0,s0,0x2f
    42a6:	4501                	li	a0,0
    42a8:	b9b1                	j	3f04 <__multf3+0x112>
    42aa:	4685                	li	a3,1
    42ac:	40e685b3          	sub	a1,a3,a4
    42b0:	10071363          	bnez	a4,43b6 <__multf3+0x5c4>
    42b4:	007b7693          	andi	a3,s6,7
    42b8:	8722                	mv	a4,s0
    42ba:	c69d                	beqz	a3,42e8 <__multf3+0x4f6>
    42bc:	4689                	li	a3,2
    42be:	0019e993          	ori	s3,s3,1
    42c2:	24da0063          	beq	s4,a3,4502 <__multf3+0x710>
    42c6:	468d                	li	a3,3
    42c8:	22da0363          	beq	s4,a3,44ee <__multf3+0x6fc>
    42cc:	000a1e63          	bnez	s4,42e8 <__multf3+0x4f6>
    42d0:	00fb7693          	andi	a3,s6,15
    42d4:	4511                	li	a0,4
    42d6:	00a68963          	beq	a3,a0,42e8 <__multf3+0x4f6>
    42da:	ffcb3713          	sltiu	a4,s6,-4
    42de:	00174713          	xori	a4,a4,1
    42e2:	1702                	slli	a4,a4,0x20
    42e4:	9301                	srli	a4,a4,0x20
    42e6:	9722                	add	a4,a4,s0
    42e8:	9351                	srli	a4,a4,0x34
    42ea:	00174713          	xori	a4,a4,1
    42ee:	8b05                	andi	a4,a4,1
    42f0:	0005869b          	sext.w	a3,a1
    42f4:	04000593          	li	a1,64
    42f8:	9d95                	subw	a1,a1,a3
    42fa:	00b41533          	sll	a0,s0,a1
    42fe:	00db5833          	srl	a6,s6,a3
    4302:	00bb15b3          	sll	a1,s6,a1
    4306:	00b035b3          	snez	a1,a1
    430a:	01056533          	or	a0,a0,a6
    430e:	8d4d                	or	a0,a0,a1
    4310:	00757593          	andi	a1,a0,7
    4314:	00d456b3          	srl	a3,s0,a3
    4318:	c595                	beqz	a1,4344 <__multf3+0x552>
    431a:	4589                	li	a1,2
    431c:	0019e993          	ori	s3,s3,1
    4320:	1eba0d63          	beq	s4,a1,451a <__multf3+0x728>
    4324:	458d                	li	a1,3
    4326:	1eba0163          	beq	s4,a1,4508 <__multf3+0x716>
    432a:	000a1d63          	bnez	s4,4344 <__multf3+0x552>
    432e:	00f57613          	andi	a2,a0,15
    4332:	4591                	li	a1,4
    4334:	00b60863          	beq	a2,a1,4344 <__multf3+0x552>
    4338:	00450613          	addi	a2,a0,4
    433c:	00a63533          	sltu	a0,a2,a0
    4340:	96aa                	add	a3,a3,a0
    4342:	8532                	mv	a0,a2
    4344:	4805                	li	a6,1
    4346:	03381613          	slli	a2,a6,0x33
    434a:	8e75                	and	a2,a2,a3
    434c:	18060863          	beqz	a2,44dc <__multf3+0x6ea>
    4350:	0019e993          	ori	s3,s3,1
    4354:	16071e63          	bnez	a4,44d0 <__multf3+0x6de>
    4358:	03f79593          	slli	a1,a5,0x3f
    435c:	1842                	slli	a6,a6,0x30
    435e:	4501                	li	a0,0
    4360:	0105e5b3          	or	a1,a1,a6
    4364:	0019a073          	csrs	fflags,s3
    4368:	b67d                	j	3f16 <__multf3+0x124>
    436a:	669000ef          	jal	ra,51d2 <__clzdi2>
    436e:	0405071b          	addiw	a4,a0,64
    4372:	ff170693          	addi	a3,a4,-15 # 3ff1 <__multf3+0x1ff>
    4376:	03c00613          	li	a2,60
    437a:	0006879b          	sext.w	a5,a3
    437e:	e4d656e3          	bge	a2,a3,41ca <__multf3+0x3d8>
    4382:	fc37879b          	addiw	a5,a5,-61
    4386:	4b81                	li	s7,0
    4388:	00f41ab3          	sll	s5,s0,a5
    438c:	bda9                	j	41e6 <__multf3+0x3f4>
    438e:	8566                	mv	a0,s9
    4390:	643000ef          	jal	ra,51d2 <__clzdi2>
    4394:	0405071b          	addiw	a4,a0,64
    4398:	ff170693          	addi	a3,a4,-15
    439c:	03c00613          	li	a2,60
    43a0:	0006879b          	sext.w	a5,a3
    43a4:	dcd65be3          	bge	a2,a3,417a <__multf3+0x388>
    43a8:	fc37879b          	addiw	a5,a5,-61
    43ac:	00fc97b3          	sll	a5,s9,a5
    43b0:	843e                	mv	s0,a5
    43b2:	4b01                	li	s6,0
    43b4:	b3c5                	j	4194 <__multf3+0x3a2>
    43b6:	07400713          	li	a4,116
    43ba:	0ab75e63          	bge	a4,a1,4476 <__multf3+0x684>
    43be:	008b6533          	or	a0,s6,s0
    43c2:	cd09                	beqz	a0,43dc <__multf3+0x5ea>
    43c4:	4709                	li	a4,2
    43c6:	0019e993          	ori	s3,s3,1
    43ca:	8532                	mv	a0,a2
    43cc:	00ea0863          	beq	s4,a4,43dc <__multf3+0x5ea>
    43d0:	470d                	li	a4,3
    43d2:	4501                	li	a0,0
    43d4:	00ea1463          	bne	s4,a4,43dc <__multf3+0x5ea>
    43d8:	40c68533          	sub	a0,a3,a2
    43dc:	0029e993          	ori	s3,s3,2
    43e0:	4701                	li	a4,0
    43e2:	4401                	li	s0,0
    43e4:	01041593          	slli	a1,s0,0x10
    43e8:	1742                	slli	a4,a4,0x30
    43ea:	81c1                	srli	a1,a1,0x10
    43ec:	17fe                	slli	a5,a5,0x3f
    43ee:	8dd9                	or	a1,a1,a4
    43f0:	8ddd                	or	a1,a1,a5
    43f2:	0019a073          	csrs	fflags,s3
    43f6:	b605                	j	3f16 <__multf3+0x124>
    43f8:	4709                	li	a4,2
    43fa:	02ea0663          	beq	s4,a4,4426 <__multf3+0x634>
    43fe:	470d                	li	a4,3
    4400:	02ea0b63          	beq	s4,a4,4436 <__multf3+0x644>
    4404:	020a0263          	beqz	s4,4428 <__multf3+0x636>
    4408:	547d                	li	s0,-1
    440a:	872e                	mv	a4,a1
    440c:	8041                	srli	s0,s0,0x10
    440e:	557d                	li	a0,-1
    4410:	0059e993          	ori	s3,s3,5
    4414:	bfc1                	j	43e4 <__multf3+0x5f2>
    4416:	0ffff5b7          	lui	a1,0xffff
    441a:	4501                	li	a0,0
    441c:	158e                	slli	a1,a1,0x23
    441e:	49c1                	li	s3,16
    4420:	0019a073          	csrs	fflags,s3
    4424:	bccd                	j	3f16 <__multf3+0x124>
    4426:	d26d                	beqz	a2,4408 <__multf3+0x616>
    4428:	fff68713          	addi	a4,a3,-1
    442c:	4401                	li	s0,0
    442e:	4501                	li	a0,0
    4430:	0059e993          	ori	s3,s3,5
    4434:	bf45                	j	43e4 <__multf3+0x5f2>
    4436:	fa69                	bnez	a2,4408 <__multf3+0x616>
    4438:	bfc5                	j	4428 <__multf3+0x636>
    443a:	00fb7693          	andi	a3,s6,15
    443e:	4591                	li	a1,4
    4440:	dcb68fe3          	beq	a3,a1,421e <__multf3+0x42c>
    4444:	004b0693          	addi	a3,s6,4
    4448:	0166bb33          	sltu	s6,a3,s6
    444c:	945a                	add	s0,s0,s6
    444e:	8b36                	mv	s6,a3
    4450:	b3f9                	j	421e <__multf3+0x42c>
    4452:	dc0616e3          	bnez	a2,421e <__multf3+0x42c>
    4456:	008b0693          	addi	a3,s6,8
    445a:	0166bb33          	sltu	s6,a3,s6
    445e:	945a                	add	s0,s0,s6
    4460:	8b36                	mv	s6,a3
    4462:	bb75                	j	421e <__multf3+0x42c>
    4464:	4385                	li	t2,1
    4466:	b185                	j	40c6 <__multf3+0x2d4>
    4468:	66a1                	lui	a3,0x8
    446a:	4405                	li	s0,1
    446c:	4781                	li	a5,0
    446e:	16fd                	addi	a3,a3,-1
    4470:	143e                	slli	s0,s0,0x2f
    4472:	4501                	li	a0,0
    4474:	bc41                	j	3f04 <__multf3+0x112>
    4476:	03f00713          	li	a4,63
    447a:	0005869b          	sext.w	a3,a1
    447e:	0ab75163          	bge	a4,a1,4520 <__multf3+0x72e>
    4482:	fc06871b          	addiw	a4,a3,-64
    4486:	04000513          	li	a0,64
    448a:	00e45733          	srl	a4,s0,a4
    448e:	00a58a63          	beq	a1,a0,44a2 <__multf3+0x6b0>
    4492:	08000593          	li	a1,128
    4496:	40d586bb          	subw	a3,a1,a3
    449a:	00d416b3          	sll	a3,s0,a3
    449e:	00db6b33          	or	s6,s6,a3
    44a2:	01603533          	snez	a0,s6
    44a6:	8d59                	or	a0,a0,a4
    44a8:	00757713          	andi	a4,a0,7
    44ac:	c719                	beqz	a4,44ba <__multf3+0x6c8>
    44ae:	4705                	li	a4,1
    44b0:	4681                	li	a3,0
    44b2:	b5a5                	j	431a <__multf3+0x528>
    44b4:	d60605e3          	beqz	a2,421e <__multf3+0x42c>
    44b8:	bf79                	j	4456 <__multf3+0x664>
    44ba:	810d                	srli	a0,a0,0x3
    44bc:	4401                	li	s0,0
    44be:	0019f713          	andi	a4,s3,1
    44c2:	4681                	li	a3,0
    44c4:	a40700e3          	beqz	a4,3f04 <__multf3+0x112>
    44c8:	4701                	li	a4,0
    44ca:	0029e993          	ori	s3,s3,2
    44ce:	bf19                	j	43e4 <__multf3+0x5f2>
    44d0:	4705                	li	a4,1
    44d2:	4401                	li	s0,0
    44d4:	4501                	li	a0,0
    44d6:	0029e993          	ori	s3,s3,2
    44da:	b729                	j	43e4 <__multf3+0x5f2>
    44dc:	00d69413          	slli	s0,a3,0xd
    44e0:	810d                	srli	a0,a0,0x3
    44e2:	16f6                	slli	a3,a3,0x3d
    44e4:	8041                	srli	s0,s0,0x10
    44e6:	8d55                	or	a0,a0,a3
    44e8:	fb79                	bnez	a4,44be <__multf3+0x6cc>
    44ea:	4681                	li	a3,0
    44ec:	bc21                	j	3f04 <__multf3+0x112>
    44ee:	de061de3          	bnez	a2,42e8 <__multf3+0x4f6>
    44f2:	ff8b3713          	sltiu	a4,s6,-8
    44f6:	00174713          	xori	a4,a4,1
    44fa:	1702                	slli	a4,a4,0x20
    44fc:	9301                	srli	a4,a4,0x20
    44fe:	9722                	add	a4,a4,s0
    4500:	b3e5                	j	42e8 <__multf3+0x4f6>
    4502:	de0603e3          	beqz	a2,42e8 <__multf3+0x4f6>
    4506:	b7f5                	j	44f2 <__multf3+0x700>
    4508:	e2061ee3          	bnez	a2,4344 <__multf3+0x552>
    450c:	00850613          	addi	a2,a0,8
    4510:	00a63533          	sltu	a0,a2,a0
    4514:	96aa                	add	a3,a3,a0
    4516:	8532                	mv	a0,a2
    4518:	b535                	j	4344 <__multf3+0x552>
    451a:	e20605e3          	beqz	a2,4344 <__multf3+0x552>
    451e:	b7fd                	j	450c <__multf3+0x71a>
    4520:	4705                	li	a4,1
    4522:	bbc9                	j	42f4 <__multf3+0x502>

0000000000004524 <__subtf3>:
    4524:	7179                	addi	sp,sp,-48
    4526:	f406                	sd	ra,40(sp)
    4528:	f022                	sd	s0,32(sp)
    452a:	ec26                	sd	s1,24(sp)
    452c:	e84a                	sd	s2,16(sp)
    452e:	e44e                	sd	s3,8(sp)
    4530:	e052                	sd	s4,0(sp)
    4532:	002029f3          	frrm	s3
    4536:	5efd                	li	t4,-1
    4538:	010ed813          	srli	a6,t4,0x10
    453c:	68a1                	lui	a7,0x8
    453e:	0105f7b3          	and	a5,a1,a6
    4542:	18fd                	addi	a7,a7,-1
    4544:	0306d713          	srli	a4,a3,0x30
    4548:	0106f833          	and	a6,a3,a6
    454c:	0305d413          	srli	s0,a1,0x30
    4550:	03d55e13          	srli	t3,a0,0x3d
    4554:	03d65313          	srli	t1,a2,0x3d
    4558:	078e                	slli	a5,a5,0x3
    455a:	080e                	slli	a6,a6,0x3
    455c:	01177733          	and	a4,a4,a7
    4560:	03f5d913          	srli	s2,a1,0x3f
    4564:	2981                	sext.w	s3,s3
    4566:	00fe65b3          	or	a1,t3,a5
    456a:	01147433          	and	s0,s0,a7
    456e:	01036e33          	or	t3,t1,a6
    4572:	00351f13          	slli	t5,a0,0x3
    4576:	92fd                	srli	a3,a3,0x3f
    4578:	00361313          	slli	t1,a2,0x3
    457c:	1d170b63          	beq	a4,a7,4752 <__subtf3+0x22e>
    4580:	0016c693          	xori	a3,a3,1
    4584:	16d90f63          	beq	s2,a3,4702 <__subtf3+0x1de>
    4588:	40e4083b          	subw	a6,s0,a4
    458c:	1d005c63          	blez	a6,4764 <__subtf3+0x240>
    4590:	22070763          	beqz	a4,47be <__subtf3+0x29a>
    4594:	67a1                	lui	a5,0x8
    4596:	17fd                	addi	a5,a5,-1
    4598:	22f40e63          	beq	s0,a5,47d4 <__subtf3+0x2b0>
    459c:	4785                	li	a5,1
    459e:	17ce                	slli	a5,a5,0x33
    45a0:	00fe6e33          	or	t3,t3,a5
    45a4:	07400793          	li	a5,116
    45a8:	4107c663          	blt	a5,a6,49b4 <__subtf3+0x490>
    45ac:	03f00793          	li	a5,63
    45b0:	5907c763          	blt	a5,a6,4b3e <__subtf3+0x61a>
    45b4:	04000793          	li	a5,64
    45b8:	410787bb          	subw	a5,a5,a6
    45bc:	00fe14b3          	sll	s1,t3,a5
    45c0:	01035733          	srl	a4,t1,a6
    45c4:	00f317b3          	sll	a5,t1,a5
    45c8:	8cd9                	or	s1,s1,a4
    45ca:	00f037b3          	snez	a5,a5
    45ce:	010e5333          	srl	t1,t3,a6
    45d2:	8cdd                	or	s1,s1,a5
    45d4:	406585b3          	sub	a1,a1,t1
    45d8:	409f04b3          	sub	s1,t5,s1
    45dc:	009f3f33          	sltu	t5,t5,s1
    45e0:	41e585b3          	sub	a1,a1,t5
    45e4:	0335d793          	srli	a5,a1,0x33
    45e8:	8b85                	andi	a5,a5,1
    45ea:	32078363          	beqz	a5,4910 <__subtf3+0x3ec>
    45ee:	00d59a13          	slli	s4,a1,0xd
    45f2:	00da5a13          	srli	s4,s4,0xd
    45f6:	340a0b63          	beqz	s4,494c <__subtf3+0x428>
    45fa:	8552                	mv	a0,s4
    45fc:	3d7000ef          	jal	ra,51d2 <__clzdi2>
    4600:	3551                	addiw	a0,a0,-12
    4602:	04000593          	li	a1,64
    4606:	9d89                	subw	a1,a1,a0
    4608:	00aa1a33          	sll	s4,s4,a0
    460c:	00b4d5b3          	srl	a1,s1,a1
    4610:	0145e5b3          	or	a1,a1,s4
    4614:	00a49a33          	sll	s4,s1,a0
    4618:	2e854663          	blt	a0,s0,4904 <__subtf3+0x3e0>
    461c:	9d01                	subw	a0,a0,s0
    461e:	0015071b          	addiw	a4,a0,1
    4622:	03f00793          	li	a5,63
    4626:	86ba                	mv	a3,a4
    4628:	4ee7c563          	blt	a5,a4,4b12 <__subtf3+0x5ee>
    462c:	04000793          	li	a5,64
    4630:	9f99                	subw	a5,a5,a4
    4632:	00f594b3          	sll	s1,a1,a5
    4636:	00ea56b3          	srl	a3,s4,a4
    463a:	00fa17b3          	sll	a5,s4,a5
    463e:	8cd5                	or	s1,s1,a3
    4640:	00f037b3          	snez	a5,a5
    4644:	8cdd                	or	s1,s1,a5
    4646:	00e5d5b3          	srl	a1,a1,a4
    464a:	00b4e7b3          	or	a5,s1,a1
    464e:	26078063          	beqz	a5,48ae <__subtf3+0x38a>
    4652:	0074f793          	andi	a5,s1,7
    4656:	00149613          	slli	a2,s1,0x1
    465a:	00159693          	slli	a3,a1,0x1
    465e:	03f4d713          	srli	a4,s1,0x3f
    4662:	00767513          	andi	a0,a2,7
    4666:	96ba                	add	a3,a3,a4
    4668:	4801                	li	a6,0
    466a:	c911                	beqz	a0,467e <__subtf3+0x15a>
    466c:	4709                	li	a4,2
    466e:	66e98d63          	beq	s3,a4,4ce8 <__subtf3+0x7c4>
    4672:	470d                	li	a4,3
    4674:	4805                	li	a6,1
    4676:	6ae98163          	beq	s3,a4,4d18 <__subtf3+0x7f4>
    467a:	68098263          	beqz	s3,4cfe <__subtf3+0x7da>
    467e:	4705                	li	a4,1
    4680:	03471613          	slli	a2,a4,0x34
    4684:	8ef1                	and	a3,a3,a2
    4686:	0016b613          	seqz	a2,a3
    468a:	4401                	li	s0,0
    468c:	6a078963          	beqz	a5,4d3e <__subtf3+0x81a>
    4690:	4789                	li	a5,2
    4692:	2ef98d63          	beq	s3,a5,498c <__subtf3+0x468>
    4696:	478d                	li	a5,3
    4698:	2ef98f63          	beq	s3,a5,4996 <__subtf3+0x472>
    469c:	2c098663          	beqz	s3,4968 <__subtf3+0x444>
    46a0:	4785                	li	a5,1
    46a2:	17ce                	slli	a5,a5,0x33
    46a4:	8fed                	and	a5,a5,a1
    46a6:	4805                	li	a6,1
    46a8:	c219                	beqz	a2,46ae <__subtf3+0x18a>
    46aa:	00286813          	ori	a6,a6,2
    46ae:	24078063          	beqz	a5,48ee <__subtf3+0x3ca>
    46b2:	6721                	lui	a4,0x8
    46b4:	0405                	addi	s0,s0,1
    46b6:	177d                	addi	a4,a4,-1
    46b8:	26e40a63          	beq	s0,a4,492c <__subtf3+0x408>
    46bc:	56fd                	li	a3,-1
    46be:	03369793          	slli	a5,a3,0x33
    46c2:	17fd                	addi	a5,a5,-1
    46c4:	8fed                	and	a5,a5,a1
    46c6:	8c79                	and	s0,s0,a4
    46c8:	03d79513          	slli	a0,a5,0x3d
    46cc:	808d                	srli	s1,s1,0x3
    46ce:	838d                	srli	a5,a5,0x3
    46d0:	82c1                	srli	a3,a3,0x10
    46d2:	1442                	slli	s0,s0,0x30
    46d4:	8d45                	or	a0,a0,s1
    46d6:	8ff5                	and	a5,a5,a3
    46d8:	9041                	srli	s0,s0,0x30
    46da:	00197713          	andi	a4,s2,1
    46de:	073e                	slli	a4,a4,0xf
    46e0:	01079593          	slli	a1,a5,0x10
    46e4:	008767b3          	or	a5,a4,s0
    46e8:	17c2                	slli	a5,a5,0x30
    46ea:	81c1                	srli	a1,a1,0x10
    46ec:	8ddd                	or	a1,a1,a5
    46ee:	2e081663          	bnez	a6,49da <__subtf3+0x4b6>
    46f2:	70a2                	ld	ra,40(sp)
    46f4:	7402                	ld	s0,32(sp)
    46f6:	64e2                	ld	s1,24(sp)
    46f8:	6942                	ld	s2,16(sp)
    46fa:	69a2                	ld	s3,8(sp)
    46fc:	6a02                	ld	s4,0(sp)
    46fe:	6145                	addi	sp,sp,48
    4700:	8082                	ret
    4702:	40e4083b          	subw	a6,s0,a4
    4706:	0f005b63          	blez	a6,47fc <__subtf3+0x2d8>
    470a:	1a070c63          	beqz	a4,48c2 <__subtf3+0x39e>
    470e:	65140263          	beq	s0,a7,4d52 <__subtf3+0x82e>
    4712:	4785                	li	a5,1
    4714:	17ce                	slli	a5,a5,0x33
    4716:	00fe6e33          	or	t3,t3,a5
    471a:	07400793          	li	a5,116
    471e:	3b07c863          	blt	a5,a6,4ace <__subtf3+0x5aa>
    4722:	03f00793          	li	a5,63
    4726:	4b07dc63          	bge	a5,a6,4bde <__subtf3+0x6ba>
    472a:	fc08079b          	addiw	a5,a6,-64
    472e:	04000713          	li	a4,64
    4732:	00fe57b3          	srl	a5,t3,a5
    4736:	00e80a63          	beq	a6,a4,474a <__subtf3+0x226>
    473a:	08000713          	li	a4,128
    473e:	4107073b          	subw	a4,a4,a6
    4742:	00ee1733          	sll	a4,t3,a4
    4746:	00e36333          	or	t1,t1,a4
    474a:	006034b3          	snez	s1,t1
    474e:	8cdd                	or	s1,s1,a5
    4750:	a659                	j	4ad6 <__subtf3+0x5b2>
    4752:	006e67b3          	or	a5,t3,t1
    4756:	cbd9                	beqz	a5,47ec <__subtf3+0x2c8>
    4758:	08d90e63          	beq	s2,a3,47f4 <__subtf3+0x2d0>
    475c:	7861                	lui	a6,0xffff8
    475e:	2805                	addiw	a6,a6,1
    4760:	0088083b          	addw	a6,a6,s0
    4764:	0e080963          	beqz	a6,4856 <__subtf3+0x332>
    4768:	30041263          	bnez	s0,4a6c <__subtf3+0x548>
    476c:	01e5e7b3          	or	a5,a1,t5
    4770:	4c078663          	beqz	a5,4c3c <__subtf3+0x718>
    4774:	fff84813          	not	a6,a6
    4778:	64080763          	beqz	a6,4dc6 <__subtf3+0x8a2>
    477c:	67a1                	lui	a5,0x8
    477e:	17fd                	addi	a5,a5,-1
    4780:	2ef71f63          	bne	a4,a5,4a7e <__subtf3+0x55a>
    4784:	006e6333          	or	t1,t3,t1
    4788:	64030a63          	beqz	t1,4ddc <__subtf3+0x8b8>
    478c:	032e5813          	srli	a6,t3,0x32
    4790:	00184813          	xori	a6,a6,1
    4794:	00361793          	slli	a5,a2,0x3
    4798:	838d                	srli	a5,a5,0x3
    479a:	00187813          	andi	a6,a6,1
    479e:	03de1513          	slli	a0,t3,0x3d
    47a2:	8d5d                	or	a0,a0,a5
    47a4:	0812                	slli	a6,a6,0x4
    47a6:	003e5793          	srli	a5,t3,0x3
    47aa:	8936                	mv	s2,a3
    47ac:	8d5d                	or	a0,a0,a5
    47ae:	c905                	beqz	a0,47de <__subtf3+0x2ba>
    47b0:	6421                	lui	s0,0x8
    47b2:	4785                	li	a5,1
    47b4:	4701                	li	a4,0
    47b6:	147d                	addi	s0,s0,-1
    47b8:	17be                	slli	a5,a5,0x2f
    47ba:	4501                	li	a0,0
    47bc:	b70d                	j	46de <__subtf3+0x1ba>
    47be:	006e6733          	or	a4,t3,t1
    47c2:	2e070963          	beqz	a4,4ab4 <__subtf3+0x590>
    47c6:	387d                	addiw	a6,a6,-1
    47c8:	4e080b63          	beqz	a6,4cbe <__subtf3+0x79a>
    47cc:	67a1                	lui	a5,0x8
    47ce:	17fd                	addi	a5,a5,-1
    47d0:	dcf41ae3          	bne	s0,a5,45a4 <__subtf3+0x80>
    47d4:	01e5ef33          	or	t5,a1,t5
    47d8:	3e0f1463          	bnez	t5,4bc0 <__subtf3+0x69c>
    47dc:	4801                	li	a6,0
    47de:	6421                	lui	s0,0x8
    47e0:	00197713          	andi	a4,s2,1
    47e4:	147d                	addi	s0,s0,-1
    47e6:	4781                	li	a5,0
    47e8:	4501                	li	a0,0
    47ea:	bdd5                	j	46de <__subtf3+0x1ba>
    47ec:	0016c693          	xori	a3,a3,1
    47f0:	d8d91ce3          	bne	s2,a3,4588 <__subtf3+0x64>
    47f4:	7861                	lui	a6,0xffff8
    47f6:	2805                	addiw	a6,a6,1
    47f8:	0088083b          	addw	a6,a6,s0
    47fc:	1e080963          	beqz	a6,49ee <__subtf3+0x4ca>
    4800:	38040063          	beqz	s0,4b80 <__subtf3+0x65c>
    4804:	67a1                	lui	a5,0x8
    4806:	17fd                	addi	a5,a5,-1
    4808:	38f70863          	beq	a4,a5,4b98 <__subtf3+0x674>
    480c:	4785                	li	a5,1
    480e:	17ce                	slli	a5,a5,0x33
    4810:	4100083b          	negw	a6,a6
    4814:	8ddd                	or	a1,a1,a5
    4816:	07400793          	li	a5,116
    481a:	5707c263          	blt	a5,a6,4d7e <__subtf3+0x85a>
    481e:	03f00793          	li	a5,63
    4822:	5d07cf63          	blt	a5,a6,4e00 <__subtf3+0x8dc>
    4826:	04000793          	li	a5,64
    482a:	410787bb          	subw	a5,a5,a6
    482e:	00f594b3          	sll	s1,a1,a5
    4832:	010f56b3          	srl	a3,t5,a6
    4836:	00ff17b3          	sll	a5,t5,a5
    483a:	8cd5                	or	s1,s1,a3
    483c:	00f037b3          	snez	a5,a5
    4840:	0105d833          	srl	a6,a1,a6
    4844:	8cdd                	or	s1,s1,a5
    4846:	9e42                	add	t3,t3,a6
    4848:	949a                	add	s1,s1,t1
    484a:	0064b333          	sltu	t1,s1,t1
    484e:	01c305b3          	add	a1,t1,t3
    4852:	843a                	mv	s0,a4
    4854:	a469                	j	4ade <__subtf3+0x5ba>
    4856:	68a1                	lui	a7,0x8
    4858:	00140793          	addi	a5,s0,1 # 8001 <static_func_ptr.0+0x1>
    485c:	ffe88e93          	addi	t4,a7,-2 # 7ffe <_DYNAMIC+0x16e>
    4860:	01d7f7b3          	and	a5,a5,t4
    4864:	1c079d63          	bnez	a5,4a3e <__subtf3+0x51a>
    4868:	006e67b3          	or	a5,t3,t1
    486c:	01e5eeb3          	or	t4,a1,t5
    4870:	14041763          	bnez	s0,49be <__subtf3+0x49a>
    4874:	440e8e63          	beqz	t4,4cd0 <__subtf3+0x7ac>
    4878:	46078263          	beqz	a5,4cdc <__subtf3+0x7b8>
    487c:	406f0633          	sub	a2,t5,t1
    4880:	00cf37b3          	sltu	a5,t5,a2
    4884:	41c58733          	sub	a4,a1,t3
    4888:	8f1d                	sub	a4,a4,a5
    488a:	03375793          	srli	a5,a4,0x33
    488e:	8b85                	andi	a5,a5,1
    4890:	62078063          	beqz	a5,4eb0 <__subtf3+0x98c>
    4894:	41e304b3          	sub	s1,t1,t5
    4898:	009337b3          	sltu	a5,t1,s1
    489c:	40be0e33          	sub	t3,t3,a1
    48a0:	40fe05b3          	sub	a1,t3,a5
    48a4:	00b4e7b3          	or	a5,s1,a1
    48a8:	8936                	mv	s2,a3
    48aa:	da0794e3          	bnez	a5,4652 <__subtf3+0x12e>
    48ae:	4501                	li	a0,0
    48b0:	4401                	li	s0,0
    48b2:	4801                	li	a6,0
    48b4:	07c2                	slli	a5,a5,0x10
    48b6:	1446                	slli	s0,s0,0x31
    48b8:	83c1                	srli	a5,a5,0x10
    48ba:	9045                	srli	s0,s0,0x31
    48bc:	00197713          	andi	a4,s2,1
    48c0:	bd39                	j	46de <__subtf3+0x1ba>
    48c2:	006e6733          	or	a4,t3,t1
    48c6:	40070d63          	beqz	a4,4ce0 <__subtf3+0x7bc>
    48ca:	387d                	addiw	a6,a6,-1
    48cc:	38080163          	beqz	a6,4c4e <__subtf3+0x72a>
    48d0:	e51415e3          	bne	s0,a7,471a <__subtf3+0x1f6>
    48d4:	01e5e7b3          	or	a5,a1,t5
    48d8:	d391                	beqz	a5,47dc <__subtf3+0x2b8>
    48da:	0325d813          	srli	a6,a1,0x32
    48de:	00184813          	xori	a6,a6,1
    48e2:	00187813          	andi	a6,a6,1
    48e6:	0812                	slli	a6,a6,0x4
    48e8:	6421                	lui	s0,0x8
    48ea:	84fa                	mv	s1,t5
    48ec:	147d                	addi	s0,s0,-1
    48ee:	6721                	lui	a4,0x8
    48f0:	03d59513          	slli	a0,a1,0x3d
    48f4:	808d                	srli	s1,s1,0x3
    48f6:	177d                	addi	a4,a4,-1
    48f8:	8d45                	or	a0,a0,s1
    48fa:	0035d793          	srli	a5,a1,0x3
    48fe:	eae407e3          	beq	s0,a4,47ac <__subtf3+0x288>
    4902:	bf4d                	j	48b4 <__subtf3+0x390>
    4904:	57fd                	li	a5,-1
    4906:	17ce                	slli	a5,a5,0x33
    4908:	17fd                	addi	a5,a5,-1
    490a:	8c09                	sub	s0,s0,a0
    490c:	8dfd                	and	a1,a1,a5
    490e:	84d2                	mv	s1,s4
    4910:	00b4e7b3          	or	a5,s1,a1
    4914:	d2040de3          	beqz	s0,464e <__subtf3+0x12a>
    4918:	0074f793          	andi	a5,s1,7
    491c:	4601                	li	a2,0
    491e:	d60799e3          	bnez	a5,4690 <__subtf3+0x16c>
    4922:	4785                	li	a5,1
    4924:	17ce                	slli	a5,a5,0x33
    4926:	8fed                	and	a5,a5,a1
    4928:	4801                	li	a6,0
    492a:	b351                	j	46ae <__subtf3+0x18a>
    492c:	08098163          	beqz	s3,49ae <__subtf3+0x48a>
    4930:	478d                	li	a5,3
    4932:	06f98c63          	beq	s3,a5,49aa <__subtf3+0x486>
    4936:	4789                	li	a5,2
    4938:	32f98463          	beq	s3,a5,4c60 <__subtf3+0x73c>
    493c:	557d                	li	a0,-1
    493e:	6421                	lui	s0,0x8
    4940:	00586813          	ori	a6,a6,5
    4944:	00355793          	srli	a5,a0,0x3
    4948:	1479                	addi	s0,s0,-2
    494a:	b7ad                	j	48b4 <__subtf3+0x390>
    494c:	8526                	mv	a0,s1
    494e:	085000ef          	jal	ra,51d2 <__clzdi2>
    4952:	ff45059b          	addiw	a1,a0,-12
    4956:	03f00793          	li	a5,63
    495a:	0345051b          	addiw	a0,a0,52
    495e:	00b495b3          	sll	a1,s1,a1
    4962:	caa7cbe3          	blt	a5,a0,4618 <__subtf3+0xf4>
    4966:	b971                	j	4602 <__subtf3+0xde>
    4968:	00f4f793          	andi	a5,s1,15
    496c:	4711                	li	a4,4
    496e:	d2e789e3          	beq	a5,a4,46a0 <__subtf3+0x17c>
    4972:	00448713          	addi	a4,s1,4
    4976:	009734b3          	sltu	s1,a4,s1
    497a:	4785                	li	a5,1
    497c:	95a6                	add	a1,a1,s1
    497e:	17ce                	slli	a5,a5,0x33
    4980:	8fed                	and	a5,a5,a1
    4982:	84ba                	mv	s1,a4
    4984:	4805                	li	a6,1
    4986:	d20612e3          	bnez	a2,46aa <__subtf3+0x186>
    498a:	b315                	j	46ae <__subtf3+0x18a>
    498c:	d0090ae3          	beqz	s2,46a0 <__subtf3+0x17c>
    4990:	00848713          	addi	a4,s1,8
    4994:	b7cd                	j	4976 <__subtf3+0x452>
    4996:	fe090de3          	beqz	s2,4990 <__subtf3+0x46c>
    499a:	4805                	li	a6,1
    499c:	4785                	li	a5,1
    499e:	17ce                	slli	a5,a5,0x33
    49a0:	8fed                	and	a5,a5,a1
    49a2:	4905                	li	s2,1
    49a4:	d00613e3          	bnez	a2,46aa <__subtf3+0x186>
    49a8:	b319                	j	46ae <__subtf3+0x18a>
    49aa:	f80919e3          	bnez	s2,493c <__subtf3+0x418>
    49ae:	00586813          	ori	a6,a6,5
    49b2:	b535                	j	47de <__subtf3+0x2ba>
    49b4:	006e64b3          	or	s1,t3,t1
    49b8:	009034b3          	snez	s1,s1
    49bc:	b931                	j	45d8 <__subtf3+0xb4>
    49be:	18fd                	addi	a7,a7,-1
    49c0:	2b140363          	beq	s0,a7,4c66 <__subtf3+0x742>
    49c4:	2d170a63          	beq	a4,a7,4c98 <__subtf3+0x774>
    49c8:	2a0e9a63          	bnez	t4,4c7c <__subtf3+0x758>
    49cc:	2c079f63          	bnez	a5,4caa <__subtf3+0x786>
    49d0:	0ffff5b7          	lui	a1,0xffff
    49d4:	4501                	li	a0,0
    49d6:	158e                	slli	a1,a1,0x23
    49d8:	4841                	li	a6,16
    49da:	00182073          	csrs	fflags,a6
    49de:	70a2                	ld	ra,40(sp)
    49e0:	7402                	ld	s0,32(sp)
    49e2:	64e2                	ld	s1,24(sp)
    49e4:	6942                	ld	s2,16(sp)
    49e6:	69a2                	ld	s3,8(sp)
    49e8:	6a02                	ld	s4,0(sp)
    49ea:	6145                	addi	sp,sp,48
    49ec:	8082                	ret
    49ee:	67a1                	lui	a5,0x8
    49f0:	00140693          	addi	a3,s0,1 # 8001 <static_func_ptr.0+0x1>
    49f4:	ffe78893          	addi	a7,a5,-2 # 7ffe <_DYNAMIC+0x16e>
    49f8:	0116feb3          	and	t4,a3,a7
    49fc:	200e9363          	bnez	t4,4c02 <__subtf3+0x6de>
    4a00:	01e5e6b3          	or	a3,a1,t5
    4a04:	3a041663          	bnez	s0,4db0 <__subtf3+0x88c>
    4a08:	006e67b3          	or	a5,t3,t1
    4a0c:	3e068763          	beqz	a3,4dfa <__subtf3+0x8d6>
    4a10:	2c078663          	beqz	a5,4cdc <__subtf3+0x7b8>
    4a14:	006f04b3          	add	s1,t5,t1
    4a18:	01e4bf33          	sltu	t5,s1,t5
    4a1c:	01c58333          	add	t1,a1,t3
    4a20:	01e305b3          	add	a1,t1,t5
    4a24:	0335d793          	srli	a5,a1,0x33
    4a28:	8b85                	andi	a5,a5,1
    4a2a:	c20780e3          	beqz	a5,464a <__subtf3+0x126>
    4a2e:	57fd                	li	a5,-1
    4a30:	17ce                	slli	a5,a5,0x33
    4a32:	17fd                	addi	a5,a5,-1
    4a34:	8dfd                	and	a1,a1,a5
    4a36:	4405                	li	s0,1
    4a38:	0074f793          	andi	a5,s1,7
    4a3c:	b5c5                	j	491c <__subtf3+0x3f8>
    4a3e:	406f04b3          	sub	s1,t5,t1
    4a42:	009f37b3          	sltu	a5,t5,s1
    4a46:	41c58a33          	sub	s4,a1,t3
    4a4a:	40fa0a33          	sub	s4,s4,a5
    4a4e:	033a5793          	srli	a5,s4,0x33
    4a52:	8b85                	andi	a5,a5,1
    4a54:	1c079a63          	bnez	a5,4c28 <__subtf3+0x704>
    4a58:	0144e7b3          	or	a5,s1,s4
    4a5c:	b8079de3          	bnez	a5,45f6 <__subtf3+0xd2>
    4a60:	19f9                	addi	s3,s3,-2
    4a62:	0019b913          	seqz	s2,s3
    4a66:	4501                	li	a0,0
    4a68:	4401                	li	s0,0
    4a6a:	b5a9                	j	48b4 <__subtf3+0x390>
    4a6c:	67a1                	lui	a5,0x8
    4a6e:	17fd                	addi	a5,a5,-1
    4a70:	d0f70ae3          	beq	a4,a5,4784 <__subtf3+0x260>
    4a74:	4785                	li	a5,1
    4a76:	17ce                	slli	a5,a5,0x33
    4a78:	4100083b          	negw	a6,a6
    4a7c:	8ddd                	or	a1,a1,a5
    4a7e:	07400793          	li	a5,116
    4a82:	0f07c263          	blt	a5,a6,4b66 <__subtf3+0x642>
    4a86:	03f00793          	li	a5,63
    4a8a:	2f07cf63          	blt	a5,a6,4d88 <__subtf3+0x864>
    4a8e:	04000793          	li	a5,64
    4a92:	410787bb          	subw	a5,a5,a6
    4a96:	00f594b3          	sll	s1,a1,a5
    4a9a:	010f5633          	srl	a2,t5,a6
    4a9e:	00ff17b3          	sll	a5,t5,a5
    4aa2:	8cd1                	or	s1,s1,a2
    4aa4:	00f037b3          	snez	a5,a5
    4aa8:	0105d833          	srl	a6,a1,a6
    4aac:	8cdd                	or	s1,s1,a5
    4aae:	410e0e33          	sub	t3,t3,a6
    4ab2:	a875                	j	4b6e <__subtf3+0x64a>
    4ab4:	67a1                	lui	a5,0x8
    4ab6:	17fd                	addi	a5,a5,-1
    4ab8:	84fa                	mv	s1,t5
    4aba:	e4f41be3          	bne	s0,a5,4910 <__subtf3+0x3ec>
    4abe:	01e5e7b3          	or	a5,a1,t5
    4ac2:	e0079ce3          	bnez	a5,48da <__subtf3+0x3b6>
    4ac6:	4501                	li	a0,0
    4ac8:	4781                	li	a5,0
    4aca:	4801                	li	a6,0
    4acc:	b1c5                	j	47ac <__subtf3+0x288>
    4ace:	006e64b3          	or	s1,t3,t1
    4ad2:	009034b3          	snez	s1,s1
    4ad6:	94fa                	add	s1,s1,t5
    4ad8:	01e4bf33          	sltu	t5,s1,t5
    4adc:	95fa                	add	a1,a1,t5
    4ade:	0335d793          	srli	a5,a1,0x33
    4ae2:	8b85                	andi	a5,a5,1
    4ae4:	e20786e3          	beqz	a5,4910 <__subtf3+0x3ec>
    4ae8:	67a1                	lui	a5,0x8
    4aea:	0405                	addi	s0,s0,1
    4aec:	fff78713          	addi	a4,a5,-1 # 7fff <_DYNAMIC+0x16f>
    4af0:	22e40763          	beq	s0,a4,4d1e <__subtf3+0x7fa>
    4af4:	577d                	li	a4,-1
    4af6:	174e                	slli	a4,a4,0x33
    4af8:	177d                	addi	a4,a4,-1
    4afa:	8f6d                	and	a4,a4,a1
    4afc:	0014d793          	srli	a5,s1,0x1
    4b00:	8885                	andi	s1,s1,1
    4b02:	8fc5                	or	a5,a5,s1
    4b04:	03f71493          	slli	s1,a4,0x3f
    4b08:	8cdd                	or	s1,s1,a5
    4b0a:	00175593          	srli	a1,a4,0x1
    4b0e:	8b9d                	andi	a5,a5,7
    4b10:	b531                	j	491c <__subtf3+0x3f8>
    4b12:	fc15051b          	addiw	a0,a0,-63
    4b16:	04000613          	li	a2,64
    4b1a:	00a5d7b3          	srl	a5,a1,a0
    4b1e:	00c70963          	beq	a4,a2,4b30 <__subtf3+0x60c>
    4b22:	08000713          	li	a4,128
    4b26:	9f15                	subw	a4,a4,a3
    4b28:	00e595b3          	sll	a1,a1,a4
    4b2c:	00ba6a33          	or	s4,s4,a1
    4b30:	01403a33          	snez	s4,s4
    4b34:	00fa67b3          	or	a5,s4,a5
    4b38:	84be                	mv	s1,a5
    4b3a:	4581                	li	a1,0
    4b3c:	be09                	j	464e <__subtf3+0x12a>
    4b3e:	fc08079b          	addiw	a5,a6,-64
    4b42:	04000713          	li	a4,64
    4b46:	00fe57b3          	srl	a5,t3,a5
    4b4a:	00e80a63          	beq	a6,a4,4b5e <__subtf3+0x63a>
    4b4e:	08000713          	li	a4,128
    4b52:	4107073b          	subw	a4,a4,a6
    4b56:	00ee1733          	sll	a4,t3,a4
    4b5a:	00e36333          	or	t1,t1,a4
    4b5e:	006034b3          	snez	s1,t1
    4b62:	8cdd                	or	s1,s1,a5
    4b64:	bc95                	j	45d8 <__subtf3+0xb4>
    4b66:	01e5e4b3          	or	s1,a1,t5
    4b6a:	009034b3          	snez	s1,s1
    4b6e:	409304b3          	sub	s1,t1,s1
    4b72:	00933333          	sltu	t1,t1,s1
    4b76:	406e05b3          	sub	a1,t3,t1
    4b7a:	843a                	mv	s0,a4
    4b7c:	8936                	mv	s2,a3
    4b7e:	b49d                	j	45e4 <__subtf3+0xc0>
    4b80:	01e5e7b3          	or	a5,a1,t5
    4b84:	24078e63          	beqz	a5,4de0 <__subtf3+0x8bc>
    4b88:	fff84813          	not	a6,a6
    4b8c:	30080963          	beqz	a6,4e9e <__subtf3+0x97a>
    4b90:	67a1                	lui	a5,0x8
    4b92:	17fd                	addi	a5,a5,-1
    4b94:	c8f711e3          	bne	a4,a5,4816 <__subtf3+0x2f2>
    4b98:	006e6333          	or	t1,t3,t1
    4b9c:	c40300e3          	beqz	t1,47dc <__subtf3+0x2b8>
    4ba0:	032e5813          	srli	a6,t3,0x32
    4ba4:	00184813          	xori	a6,a6,1
    4ba8:	060e                	slli	a2,a2,0x3
    4baa:	03de1793          	slli	a5,t3,0x3d
    4bae:	00187813          	andi	a6,a6,1
    4bb2:	820d                	srli	a2,a2,0x3
    4bb4:	00f66533          	or	a0,a2,a5
    4bb8:	0812                	slli	a6,a6,0x4
    4bba:	003e5793          	srli	a5,t3,0x3
    4bbe:	b6fd                	j	47ac <__subtf3+0x288>
    4bc0:	0325d813          	srli	a6,a1,0x32
    4bc4:	00184813          	xori	a6,a6,1
    4bc8:	050e                	slli	a0,a0,0x3
    4bca:	03d59793          	slli	a5,a1,0x3d
    4bce:	00187813          	andi	a6,a6,1
    4bd2:	810d                	srli	a0,a0,0x3
    4bd4:	8d5d                	or	a0,a0,a5
    4bd6:	0812                	slli	a6,a6,0x4
    4bd8:	0035d793          	srli	a5,a1,0x3
    4bdc:	bec1                	j	47ac <__subtf3+0x288>
    4bde:	04000793          	li	a5,64
    4be2:	410787bb          	subw	a5,a5,a6
    4be6:	00fe14b3          	sll	s1,t3,a5
    4bea:	01035733          	srl	a4,t1,a6
    4bee:	00f317b3          	sll	a5,t1,a5
    4bf2:	8cd9                	or	s1,s1,a4
    4bf4:	00f037b3          	snez	a5,a5
    4bf8:	010e5333          	srl	t1,t3,a6
    4bfc:	8cdd                	or	s1,s1,a5
    4bfe:	959a                	add	a1,a1,t1
    4c00:	bdd9                	j	4ad6 <__subtf3+0x5b2>
    4c02:	17fd                	addi	a5,a5,-1
    4c04:	22f68263          	beq	a3,a5,4e28 <__subtf3+0x904>
    4c08:	006f07b3          	add	a5,t5,t1
    4c0c:	01c58733          	add	a4,a1,t3
    4c10:	01e7bf33          	sltu	t5,a5,t5
    4c14:	977a                	add	a4,a4,t5
    4c16:	8385                	srli	a5,a5,0x1
    4c18:	03f71493          	slli	s1,a4,0x3f
    4c1c:	8cdd                	or	s1,s1,a5
    4c1e:	00175593          	srli	a1,a4,0x1
    4c22:	8b9d                	andi	a5,a5,7
    4c24:	8436                	mv	s0,a3
    4c26:	b9dd                	j	491c <__subtf3+0x3f8>
    4c28:	41e304b3          	sub	s1,t1,t5
    4c2c:	40be0a33          	sub	s4,t3,a1
    4c30:	00933333          	sltu	t1,t1,s1
    4c34:	406a0a33          	sub	s4,s4,t1
    4c38:	8936                	mv	s2,a3
    4c3a:	ba75                	j	45f6 <__subtf3+0xd2>
    4c3c:	67a1                	lui	a5,0x8
    4c3e:	17fd                	addi	a5,a5,-1
    4c40:	20f70363          	beq	a4,a5,4e46 <__subtf3+0x922>
    4c44:	85f2                	mv	a1,t3
    4c46:	849a                	mv	s1,t1
    4c48:	843a                	mv	s0,a4
    4c4a:	8936                	mv	s2,a3
    4c4c:	b1d1                	j	4910 <__subtf3+0x3ec>
    4c4e:	006f04b3          	add	s1,t5,t1
    4c52:	01e4bf33          	sltu	t5,s1,t5
    4c56:	01c58333          	add	t1,a1,t3
    4c5a:	01e305b3          	add	a1,t1,t5
    4c5e:	b541                	j	4ade <__subtf3+0x5ba>
    4c60:	cc090ee3          	beqz	s2,493c <__subtf3+0x418>
    4c64:	b3a9                	j	49ae <__subtf3+0x48a>
    4c66:	020e8763          	beqz	t4,4c94 <__subtf3+0x770>
    4c6a:	0325d813          	srli	a6,a1,0x32
    4c6e:	00184813          	xori	a6,a6,1
    4c72:	00187813          	andi	a6,a6,1
    4c76:	0812                	slli	a6,a6,0x4
    4c78:	02870063          	beq	a4,s0,4c98 <__subtf3+0x774>
    4c7c:	b2079ae3          	bnez	a5,47b0 <__subtf3+0x28c>
    4c80:	00351713          	slli	a4,a0,0x3
    4c84:	03d59793          	slli	a5,a1,0x3d
    4c88:	830d                	srli	a4,a4,0x3
    4c8a:	00e7e533          	or	a0,a5,a4
    4c8e:	0035d793          	srli	a5,a1,0x3
    4c92:	be29                	j	47ac <__subtf3+0x288>
    4c94:	d2871ce3          	bne	a4,s0,49cc <__subtf3+0x4a8>
    4c98:	d20788e3          	beqz	a5,49c8 <__subtf3+0x4a4>
    4c9c:	032e5793          	srli	a5,t3,0x32
    4ca0:	8b85                	andi	a5,a5,1
    4ca2:	e391                	bnez	a5,4ca6 <__subtf3+0x782>
    4ca4:	4841                	li	a6,16
    4ca6:	b00e95e3          	bnez	t4,47b0 <__subtf3+0x28c>
    4caa:	00361793          	slli	a5,a2,0x3
    4cae:	838d                	srli	a5,a5,0x3
    4cb0:	03de1513          	slli	a0,t3,0x3d
    4cb4:	8d5d                	or	a0,a0,a5
    4cb6:	8936                	mv	s2,a3
    4cb8:	003e5793          	srli	a5,t3,0x3
    4cbc:	bcc5                	j	47ac <__subtf3+0x288>
    4cbe:	406f04b3          	sub	s1,t5,t1
    4cc2:	009f3f33          	sltu	t5,t5,s1
    4cc6:	41c58333          	sub	t1,a1,t3
    4cca:	41e305b3          	sub	a1,t1,t5
    4cce:	ba19                	j	45e4 <__subtf3+0xc0>
    4cd0:	12078063          	beqz	a5,4df0 <__subtf3+0x8cc>
    4cd4:	4781                	li	a5,0
    4cd6:	85f2                	mv	a1,t3
    4cd8:	8f1a                	mv	t5,t1
    4cda:	8936                	mv	s2,a3
    4cdc:	84fa                	mv	s1,t5
    4cde:	baa5                	j	4656 <__subtf3+0x132>
    4ce0:	84fa                	mv	s1,t5
    4ce2:	c31417e3          	bne	s0,a7,4910 <__subtf3+0x3ec>
    4ce6:	bbe1                	j	4abe <__subtf3+0x59a>
    4ce8:	4805                	li	a6,1
    4cea:	98090ae3          	beqz	s2,467e <__subtf3+0x15a>
    4cee:	ff863713          	sltiu	a4,a2,-8
    4cf2:	00174713          	xori	a4,a4,1
    4cf6:	1702                	slli	a4,a4,0x20
    4cf8:	9301                	srli	a4,a4,0x20
    4cfa:	96ba                	add	a3,a3,a4
    4cfc:	b249                	j	467e <__subtf3+0x15a>
    4cfe:	00f67713          	andi	a4,a2,15
    4d02:	4511                	li	a0,4
    4d04:	96a70de3          	beq	a4,a0,467e <__subtf3+0x15a>
    4d08:	ffc63713          	sltiu	a4,a2,-4
    4d0c:	00174713          	xori	a4,a4,1
    4d10:	1702                	slli	a4,a4,0x20
    4d12:	9301                	srli	a4,a4,0x20
    4d14:	96ba                	add	a3,a3,a4
    4d16:	b2a5                	j	467e <__subtf3+0x15a>
    4d18:	960913e3          	bnez	s2,467e <__subtf3+0x15a>
    4d1c:	bfc9                	j	4cee <__subtf3+0x7ca>
    4d1e:	04098e63          	beqz	s3,4d7a <__subtf3+0x856>
    4d22:	470d                	li	a4,3
    4d24:	1ae98063          	beq	s3,a4,4ec4 <__subtf3+0x9a0>
    4d28:	4709                	li	a4,2
    4d2a:	4815                	li	a6,5
    4d2c:	c0e992e3          	bne	s3,a4,4930 <__subtf3+0x40c>
    4d30:	aa0917e3          	bnez	s2,47de <__subtf3+0x2ba>
    4d34:	ffe78413          	addi	s0,a5,-2 # 7ffe <_DYNAMIC+0x16e>
    4d38:	55fd                	li	a1,-1
    4d3a:	54fd                	li	s1,-1
    4d3c:	ba9d                	j	46b2 <__subtf3+0x18e>
    4d3e:	03371793          	slli	a5,a4,0x33
    4d42:	8fed                	and	a5,a5,a1
    4d44:	960695e3          	bnez	a3,46ae <__subtf3+0x18a>
    4d48:	960803e3          	beqz	a6,46ae <__subtf3+0x18a>
    4d4c:	00286813          	ori	a6,a6,2
    4d50:	bab9                	j	46ae <__subtf3+0x18a>
    4d52:	01e5ef33          	or	t5,a1,t5
    4d56:	a80f03e3          	beqz	t5,47dc <__subtf3+0x2b8>
    4d5a:	0325d813          	srli	a6,a1,0x32
    4d5e:	00184813          	xori	a6,a6,1
    4d62:	003ed713          	srli	a4,t4,0x3
    4d66:	03d59793          	slli	a5,a1,0x3d
    4d6a:	00187813          	andi	a6,a6,1
    4d6e:	8d79                	and	a0,a0,a4
    4d70:	8d5d                	or	a0,a0,a5
    4d72:	0812                	slli	a6,a6,0x4
    4d74:	0035d793          	srli	a5,a1,0x3
    4d78:	bc15                	j	47ac <__subtf3+0x288>
    4d7a:	4815                	li	a6,5
    4d7c:	b48d                	j	47de <__subtf3+0x2ba>
    4d7e:	01e5e4b3          	or	s1,a1,t5
    4d82:	009034b3          	snez	s1,s1
    4d86:	b4c9                	j	4848 <__subtf3+0x324>
    4d88:	fc08079b          	addiw	a5,a6,-64
    4d8c:	04000613          	li	a2,64
    4d90:	00f5d7b3          	srl	a5,a1,a5
    4d94:	00c80a63          	beq	a6,a2,4da8 <__subtf3+0x884>
    4d98:	08000613          	li	a2,128
    4d9c:	4106063b          	subw	a2,a2,a6
    4da0:	00c59633          	sll	a2,a1,a2
    4da4:	00cf6f33          	or	t5,t5,a2
    4da8:	01e034b3          	snez	s1,t5
    4dac:	8cdd                	or	s1,s1,a5
    4dae:	b3c1                	j	4b6e <__subtf3+0x64a>
    4db0:	17fd                	addi	a5,a5,-1
    4db2:	0af40863          	beq	s0,a5,4e62 <__subtf3+0x93e>
    4db6:	14f70063          	beq	a4,a5,4ef6 <__subtf3+0x9d2>
    4dba:	cae9                	beqz	a3,4e8c <__subtf3+0x968>
    4dbc:	006e6333          	or	t1,t3,t1
    4dc0:	9e0318e3          	bnez	t1,47b0 <__subtf3+0x28c>
    4dc4:	bd75                	j	4c80 <__subtf3+0x75c>
    4dc6:	41e304b3          	sub	s1,t1,t5
    4dca:	40be0e33          	sub	t3,t3,a1
    4dce:	009337b3          	sltu	a5,t1,s1
    4dd2:	40fe05b3          	sub	a1,t3,a5
    4dd6:	843a                	mv	s0,a4
    4dd8:	8936                	mv	s2,a3
    4dda:	b029                	j	45e4 <__subtf3+0xc0>
    4ddc:	8936                	mv	s2,a3
    4dde:	bafd                	j	47dc <__subtf3+0x2b8>
    4de0:	67a1                	lui	a5,0x8
    4de2:	17fd                	addi	a5,a5,-1
    4de4:	0ef70963          	beq	a4,a5,4ed6 <__subtf3+0x9b2>
    4de8:	85f2                	mv	a1,t3
    4dea:	849a                	mv	s1,t1
    4dec:	843a                	mv	s0,a4
    4dee:	b60d                	j	4910 <__subtf3+0x3ec>
    4df0:	19f9                	addi	s3,s3,-2
    4df2:	0019b913          	seqz	s2,s3
    4df6:	4501                	li	a0,0
    4df8:	bc75                	j	48b4 <__subtf3+0x390>
    4dfa:	85f2                	mv	a1,t3
    4dfc:	849a                	mv	s1,t1
    4dfe:	b881                	j	464e <__subtf3+0x12a>
    4e00:	fc08079b          	addiw	a5,a6,-64
    4e04:	04000693          	li	a3,64
    4e08:	00f5d7b3          	srl	a5,a1,a5
    4e0c:	00d80a63          	beq	a6,a3,4e20 <__subtf3+0x8fc>
    4e10:	08000693          	li	a3,128
    4e14:	410686bb          	subw	a3,a3,a6
    4e18:	00d596b3          	sll	a3,a1,a3
    4e1c:	00df6f33          	or	t5,t5,a3
    4e20:	01e034b3          	snez	s1,t5
    4e24:	8cdd                	or	s1,s1,a5
    4e26:	b40d                	j	4848 <__subtf3+0x324>
    4e28:	f40989e3          	beqz	s3,4d7a <__subtf3+0x856>
    4e2c:	478d                	li	a5,3
    4e2e:	0ef98263          	beq	s3,a5,4f12 <__subtf3+0x9ee>
    4e32:	4789                	li	a5,2
    4e34:	4815                	li	a6,5
    4e36:	b0f993e3          	bne	s3,a5,493c <__subtf3+0x418>
    4e3a:	9a0912e3          	bnez	s2,47de <__subtf3+0x2ba>
    4e3e:	8446                	mv	s0,a7
    4e40:	55fd                	li	a1,-1
    4e42:	54fd                	li	s1,-1
    4e44:	b0bd                	j	46b2 <__subtf3+0x18e>
    4e46:	006e67b3          	or	a5,t3,t1
    4e4a:	c7c5                	beqz	a5,4ef2 <__subtf3+0x9ce>
    4e4c:	032e5813          	srli	a6,t3,0x32
    4e50:	00184813          	xori	a6,a6,1
    4e54:	00187813          	andi	a6,a6,1
    4e58:	0812                	slli	a6,a6,0x4
    4e5a:	85f2                	mv	a1,t3
    4e5c:	8f1a                	mv	t5,t1
    4e5e:	8936                	mv	s2,a3
    4e60:	b461                	j	48e8 <__subtf3+0x3c4>
    4e62:	c2cd                	beqz	a3,4f04 <__subtf3+0x9e0>
    4e64:	0325d813          	srli	a6,a1,0x32
    4e68:	00184813          	xori	a6,a6,1
    4e6c:	00187813          	andi	a6,a6,1
    4e70:	0812                	slli	a6,a6,0x4
    4e72:	f48715e3          	bne	a4,s0,4dbc <__subtf3+0x898>
    4e76:	006e6333          	or	t1,t3,t1
    4e7a:	e00303e3          	beqz	t1,4c80 <__subtf3+0x75c>
    4e7e:	032e5793          	srli	a5,t3,0x32
    4e82:	8b85                	andi	a5,a5,1
    4e84:	e391                	bnez	a5,4e88 <__subtf3+0x964>
    4e86:	4841                	li	a6,16
    4e88:	920694e3          	bnez	a3,47b0 <__subtf3+0x28c>
    4e8c:	00361793          	slli	a5,a2,0x3
    4e90:	838d                	srli	a5,a5,0x3
    4e92:	03de1513          	slli	a0,t3,0x3d
    4e96:	8d5d                	or	a0,a0,a5
    4e98:	003e5793          	srli	a5,t3,0x3
    4e9c:	ba01                	j	47ac <__subtf3+0x288>
    4e9e:	006f04b3          	add	s1,t5,t1
    4ea2:	9e2e                	add	t3,t3,a1
    4ea4:	0064b7b3          	sltu	a5,s1,t1
    4ea8:	00fe05b3          	add	a1,t3,a5
    4eac:	843a                	mv	s0,a4
    4eae:	b905                	j	4ade <__subtf3+0x5ba>
    4eb0:	00e667b3          	or	a5,a2,a4
    4eb4:	df95                	beqz	a5,4df0 <__subtf3+0x8cc>
    4eb6:	8f32                	mv	t5,a2
    4eb8:	00767793          	andi	a5,a2,7
    4ebc:	85ba                	mv	a1,a4
    4ebe:	84fa                	mv	s1,t5
    4ec0:	f96ff06f          	j	4656 <__subtf3+0x132>
    4ec4:	4815                	li	a6,5
    4ec6:	90090ce3          	beqz	s2,47de <__subtf3+0x2ba>
    4eca:	54fd                	li	s1,-1
    4ecc:	55fd                	li	a1,-1
    4ece:	ffe78413          	addi	s0,a5,-2 # 7ffe <_DYNAMIC+0x16e>
    4ed2:	4601                	li	a2,0
    4ed4:	b4e1                	j	499c <__subtf3+0x478>
    4ed6:	006e67b3          	or	a5,t3,t1
    4eda:	be0786e3          	beqz	a5,4ac6 <__subtf3+0x5a2>
    4ede:	032e5813          	srli	a6,t3,0x32
    4ee2:	00184813          	xori	a6,a6,1
    4ee6:	00187813          	andi	a6,a6,1
    4eea:	0812                	slli	a6,a6,0x4
    4eec:	85f2                	mv	a1,t3
    4eee:	8f1a                	mv	t5,t1
    4ef0:	bae5                	j	48e8 <__subtf3+0x3c4>
    4ef2:	8936                	mv	s2,a3
    4ef4:	bec9                	j	4ac6 <__subtf3+0x5a2>
    4ef6:	006e6333          	or	t1,t3,t1
    4efa:	f80312e3          	bnez	t1,4e7e <__subtf3+0x95a>
    4efe:	d80691e3          	bnez	a3,4c80 <__subtf3+0x75c>
    4f02:	b769                	j	4e8c <__subtf3+0x968>
    4f04:	f88714e3          	bne	a4,s0,4e8c <__subtf3+0x968>
    4f08:	006e6333          	or	t1,t3,t1
    4f0c:	f60319e3          	bnez	t1,4e7e <__subtf3+0x95a>
    4f10:	bfb5                	j	4e8c <__subtf3+0x968>
    4f12:	e60904e3          	beqz	s2,4d7a <__subtf3+0x856>
    4f16:	4601                	li	a2,0
    4f18:	4815                	li	a6,5
    4f1a:	54fd                	li	s1,-1
    4f1c:	55fd                	li	a1,-1
    4f1e:	8446                	mv	s0,a7
    4f20:	bcb5                	j	499c <__subtf3+0x478>

0000000000004f22 <__fixtfsi>:
    4f22:	882a                	mv	a6,a0
    4f24:	002027f3          	frrm	a5
    4f28:	6611                	lui	a2,0x4
    4f2a:	00159793          	slli	a5,a1,0x1
    4f2e:	01059713          	slli	a4,a1,0x10
    4f32:	93c5                	srli	a5,a5,0x31
    4f34:	ffe60693          	addi	a3,a2,-2 # 3ffe <__multf3+0x20c>
    4f38:	8341                	srli	a4,a4,0x10
    4f3a:	91fd                	srli	a1,a1,0x3f
    4f3c:	00f6c863          	blt	a3,a5,4f4c <__fixtfsi+0x2a>
    4f40:	cbad                	beqz	a5,4fb2 <__fixtfsi+0x90>
    4f42:	4501                	li	a0,0
    4f44:	4685                	li	a3,1
    4f46:	0016a073          	csrs	fflags,a3
    4f4a:	8082                	ret
    4f4c:	01d60693          	addi	a3,a2,29
    4f50:	02f6d563          	bge	a3,a5,4f7a <__fixtfsi+0x58>
    4f54:	800006b7          	lui	a3,0x80000
    4f58:	fff6c693          	not	a3,a3
    4f5c:	00b6853b          	addw	a0,a3,a1
    4f60:	cdb1                	beqz	a1,4fbc <__fixtfsi+0x9a>
    4f62:	0679                	addi	a2,a2,30
    4f64:	46c1                	li	a3,16
    4f66:	fec790e3          	bne	a5,a2,4f46 <__fixtfsi+0x24>
    4f6a:	01175793          	srli	a5,a4,0x11
    4f6e:	ffe1                	bnez	a5,4f46 <__fixtfsi+0x24>
    4f70:	173e                	slli	a4,a4,0x2f
    4f72:	01076733          	or	a4,a4,a6
    4f76:	eb15                	bnez	a4,4faa <__fixtfsi+0x88>
    4f78:	8082                	ret
    4f7a:	4685                	li	a3,1
    4f7c:	16c2                	slli	a3,a3,0x30
    4f7e:	8f55                	or	a4,a4,a3
    4f80:	6611                	lui	a2,0x4
    4f82:	76f1                	lui	a3,0xffffc
    4f84:	26c5                	addiw	a3,a3,17
    4f86:	02f6061b          	addiw	a2,a2,47
    4f8a:	9ebd                	addw	a3,a3,a5
    4f8c:	40f607bb          	subw	a5,a2,a5
    4f90:	00d716b3          	sll	a3,a4,a3
    4f94:	00f75733          	srl	a4,a4,a5
    4f98:	8ec9                	or	a3,a3,a0
    4f9a:	0007079b          	sext.w	a5,a4
    4f9e:	c199                	beqz	a1,4fa4 <__fixtfsi+0x82>
    4fa0:	40f007bb          	negw	a5,a5
    4fa4:	0007851b          	sext.w	a0,a5
    4fa8:	ca89                	beqz	a3,4fba <__fixtfsi+0x98>
    4faa:	4685                	li	a3,1
    4fac:	0016a073          	csrs	fflags,a3
    4fb0:	8082                	ret
    4fb2:	8f49                	or	a4,a4,a0
    4fb4:	4501                	li	a0,0
    4fb6:	fb75                	bnez	a4,4faa <__fixtfsi+0x88>
    4fb8:	8082                	ret
    4fba:	8082                	ret
    4fbc:	46c1                	li	a3,16
    4fbe:	b761                	j	4f46 <__fixtfsi+0x24>

0000000000004fc0 <__fixunstfsi>:
    4fc0:	002027f3          	frrm	a5
    4fc4:	6611                	lui	a2,0x4
    4fc6:	00159793          	slli	a5,a1,0x1
    4fca:	01059713          	slli	a4,a1,0x10
    4fce:	93c5                	srli	a5,a5,0x31
    4fd0:	ffe60693          	addi	a3,a2,-2 # 3ffe <__multf3+0x20c>
    4fd4:	8341                	srli	a4,a4,0x10
    4fd6:	91fd                	srli	a1,a1,0x3f
    4fd8:	00f6c863          	blt	a3,a5,4fe8 <__fixunstfsi+0x28>
    4fdc:	c395                	beqz	a5,5000 <__fixunstfsi+0x40>
    4fde:	4501                	li	a0,0
    4fe0:	4785                	li	a5,1
    4fe2:	0017a073          	csrs	fflags,a5
    4fe6:	8082                	ret
    4fe8:	0015b693          	seqz	a3,a1
    4fec:	96b2                	add	a3,a3,a2
    4fee:	06f9                	addi	a3,a3,30
    4ff0:	00d7cb63          	blt	a5,a3,5006 <__fixunstfsi+0x46>
    4ff4:	fff5851b          	addiw	a0,a1,-1
    4ff8:	47c1                	li	a5,16
    4ffa:	0017a073          	csrs	fflags,a5
    4ffe:	8082                	ret
    5000:	8d59                	or	a0,a0,a4
    5002:	fd71                	bnez	a0,4fde <__fixunstfsi+0x1e>
    5004:	8082                	ret
    5006:	e585                	bnez	a1,502e <__fixunstfsi+0x6e>
    5008:	4685                	li	a3,1
    500a:	16c2                	slli	a3,a3,0x30
    500c:	8f55                	or	a4,a4,a3
    500e:	76f1                	lui	a3,0xffffc
    5010:	26c5                	addiw	a3,a3,17
    5012:	6611                	lui	a2,0x4
    5014:	9ebd                	addw	a3,a3,a5
    5016:	02f6061b          	addiw	a2,a2,47
    501a:	9e1d                	subw	a2,a2,a5
    501c:	00d717b3          	sll	a5,a4,a3
    5020:	8fc9                	or	a5,a5,a0
    5022:	00c75733          	srl	a4,a4,a2
    5026:	0007051b          	sext.w	a0,a4
    502a:	e789                	bnez	a5,5034 <__fixunstfsi+0x74>
    502c:	8082                	ret
    502e:	4501                	li	a0,0
    5030:	47c1                	li	a5,16
    5032:	bf45                	j	4fe2 <__fixunstfsi+0x22>
    5034:	4785                	li	a5,1
    5036:	b775                	j	4fe2 <__fixunstfsi+0x22>

0000000000005038 <__floatsitf>:
    5038:	1101                	addi	sp,sp,-32
    503a:	ec06                	sd	ra,24(sp)
    503c:	e822                	sd	s0,16(sp)
    503e:	e426                	sd	s1,8(sp)
    5040:	c531                	beqz	a0,508c <__floatsitf+0x54>
    5042:	0005079b          	sext.w	a5,a0
    5046:	01f5549b          	srliw	s1,a0,0x1f
    504a:	04054563          	bltz	a0,5094 <__floatsitf+0x5c>
    504e:	02079413          	slli	s0,a5,0x20
    5052:	9001                	srli	s0,s0,0x20
    5054:	8522                	mv	a0,s0
    5056:	17c000ef          	jal	ra,51d2 <__clzdi2>
    505a:	6711                	lui	a4,0x4
    505c:	ff15079b          	addiw	a5,a0,-15
    5060:	03e7071b          	addiw	a4,a4,62
    5064:	00f417b3          	sll	a5,s0,a5
    5068:	9f09                	subw	a4,a4,a0
    506a:	07c2                	slli	a5,a5,0x10
    506c:	1746                	slli	a4,a4,0x31
    506e:	83c1                	srli	a5,a5,0x10
    5070:	9345                	srli	a4,a4,0x31
    5072:	60e2                	ld	ra,24(sp)
    5074:	6442                	ld	s0,16(sp)
    5076:	00f49593          	slli	a1,s1,0xf
    507a:	07c2                	slli	a5,a5,0x10
    507c:	8dd9                	or	a1,a1,a4
    507e:	15c2                	slli	a1,a1,0x30
    5080:	83c1                	srli	a5,a5,0x10
    5082:	64a2                	ld	s1,8(sp)
    5084:	4501                	li	a0,0
    5086:	8ddd                	or	a1,a1,a5
    5088:	6105                	addi	sp,sp,32
    508a:	8082                	ret
    508c:	4481                	li	s1,0
    508e:	4701                	li	a4,0
    5090:	4781                	li	a5,0
    5092:	b7c5                	j	5072 <__floatsitf+0x3a>
    5094:	40f007bb          	negw	a5,a5
    5098:	bf5d                	j	504e <__floatsitf+0x16>

000000000000509a <__floatunsitf>:
    509a:	cd1d                	beqz	a0,50d8 <__floatunsitf+0x3e>
    509c:	1141                	addi	sp,sp,-16
    509e:	e022                	sd	s0,0(sp)
    50a0:	02051413          	slli	s0,a0,0x20
    50a4:	9001                	srli	s0,s0,0x20
    50a6:	8522                	mv	a0,s0
    50a8:	e406                	sd	ra,8(sp)
    50aa:	128000ef          	jal	ra,51d2 <__clzdi2>
    50ae:	ff15079b          	addiw	a5,a0,-15
    50b2:	6591                	lui	a1,0x4
    50b4:	00f417b3          	sll	a5,s0,a5
    50b8:	03e5859b          	addiw	a1,a1,62
    50bc:	9d89                	subw	a1,a1,a0
    50be:	07c2                	slli	a5,a5,0x10
    50c0:	60a2                	ld	ra,8(sp)
    50c2:	6402                	ld	s0,0(sp)
    50c4:	15c6                	slli	a1,a1,0x31
    50c6:	83c1                	srli	a5,a5,0x10
    50c8:	91c5                	srli	a1,a1,0x31
    50ca:	07c2                	slli	a5,a5,0x10
    50cc:	15c2                	slli	a1,a1,0x30
    50ce:	83c1                	srli	a5,a5,0x10
    50d0:	4501                	li	a0,0
    50d2:	8ddd                	or	a1,a1,a5
    50d4:	0141                	addi	sp,sp,16
    50d6:	8082                	ret
    50d8:	4781                	li	a5,0
    50da:	4581                	li	a1,0
    50dc:	07c2                	slli	a5,a5,0x10
    50de:	83c1                	srli	a5,a5,0x10
    50e0:	15c2                	slli	a1,a1,0x30
    50e2:	4501                	li	a0,0
    50e4:	8ddd                	or	a1,a1,a5
    50e6:	8082                	ret

00000000000050e8 <__extenddftf2>:
    50e8:	1101                	addi	sp,sp,-32
    50ea:	e2050753          	fmv.x.d	a4,fa0
    50ee:	ec06                	sd	ra,24(sp)
    50f0:	e822                	sd	s0,16(sp)
    50f2:	e426                	sd	s1,8(sp)
    50f4:	002027f3          	frrm	a5
    50f8:	03475793          	srli	a5,a4,0x34
    50fc:	7ff7f793          	andi	a5,a5,2047
    5100:	567d                	li	a2,-1
    5102:	00178693          	addi	a3,a5,1
    5106:	00c65513          	srli	a0,a2,0xc
    510a:	7fe6f693          	andi	a3,a3,2046
    510e:	00e57433          	and	s0,a0,a4
    5112:	03f75493          	srli	s1,a4,0x3f
    5116:	c695                	beqz	a3,5142 <__extenddftf2+0x5a>
    5118:	6711                	lui	a4,0x4
    511a:	c0070713          	addi	a4,a4,-1024 # 3c00 <__addtf3+0x8b8>
    511e:	97ba                	add	a5,a5,a4
    5120:	17c6                	slli	a5,a5,0x31
    5122:	00445593          	srli	a1,s0,0x4
    5126:	93c5                	srli	a5,a5,0x31
    5128:	1472                	slli	s0,s0,0x3c
    512a:	17c6                	slli	a5,a5,0x31
    512c:	8385                	srli	a5,a5,0x1
    512e:	03f49713          	slli	a4,s1,0x3f
    5132:	8ddd                	or	a1,a1,a5
    5134:	8522                	mv	a0,s0
    5136:	8dd9                	or	a1,a1,a4
    5138:	60e2                	ld	ra,24(sp)
    513a:	6442                	ld	s0,16(sp)
    513c:	64a2                	ld	s1,8(sp)
    513e:	6105                	addi	sp,sp,32
    5140:	8082                	ret
    5142:	eb9d                	bnez	a5,5178 <__extenddftf2+0x90>
    5144:	c835                	beqz	s0,51b8 <__extenddftf2+0xd0>
    5146:	8522                	mv	a0,s0
    5148:	08a000ef          	jal	ra,51d2 <__clzdi2>
    514c:	0005071b          	sext.w	a4,a0
    5150:	47b9                	li	a5,14
    5152:	06e7ca63          	blt	a5,a4,51c6 <__extenddftf2+0xde>
    5156:	45bd                	li	a1,15
    5158:	9d89                	subw	a1,a1,a0
    515a:	0315079b          	addiw	a5,a0,49
    515e:	00b455b3          	srl	a1,s0,a1
    5162:	00f41433          	sll	s0,s0,a5
    5166:	6791                	lui	a5,0x4
    5168:	c0c7879b          	addiw	a5,a5,-1012
    516c:	9f89                	subw	a5,a5,a0
    516e:	05c2                	slli	a1,a1,0x10
    5170:	17c6                	slli	a5,a5,0x31
    5172:	81c1                	srli	a1,a1,0x10
    5174:	93c5                	srli	a5,a5,0x31
    5176:	bf55                	j	512a <__extenddftf2+0x42>
    5178:	c039                	beqz	s0,51be <__extenddftf2+0xd6>
    517a:	4705                	li	a4,1
    517c:	173e                	slli	a4,a4,0x2f
    517e:	00445593          	srli	a1,s0,0x4
    5182:	8dd9                	or	a1,a1,a4
    5184:	03345793          	srli	a5,s0,0x33
    5188:	8241                	srli	a2,a2,0x10
    518a:	07fff6b7          	lui	a3,0x7fff
    518e:	1692                	slli	a3,a3,0x24
    5190:	0017c793          	xori	a5,a5,1
    5194:	8df1                	and	a1,a1,a2
    5196:	8dd5                	or	a1,a1,a3
    5198:	8b85                	andi	a5,a5,1
    519a:	03f49713          	slli	a4,s1,0x3f
    519e:	0047969b          	slliw	a3,a5,0x4
    51a2:	03c41513          	slli	a0,s0,0x3c
    51a6:	8dd9                	or	a1,a1,a4
    51a8:	dbc1                	beqz	a5,5138 <__extenddftf2+0x50>
    51aa:	0016a073          	csrs	fflags,a3
    51ae:	60e2                	ld	ra,24(sp)
    51b0:	6442                	ld	s0,16(sp)
    51b2:	64a2                	ld	s1,8(sp)
    51b4:	6105                	addi	sp,sp,32
    51b6:	8082                	ret
    51b8:	4781                	li	a5,0
    51ba:	4581                	li	a1,0
    51bc:	b7bd                	j	512a <__extenddftf2+0x42>
    51be:	67a1                	lui	a5,0x8
    51c0:	17fd                	addi	a5,a5,-1
    51c2:	4581                	li	a1,0
    51c4:	b79d                	j	512a <__extenddftf2+0x42>
    51c6:	ff15059b          	addiw	a1,a0,-15
    51ca:	00b415b3          	sll	a1,s0,a1
    51ce:	4401                	li	s0,0
    51d0:	bf59                	j	5166 <__extenddftf2+0x7e>

00000000000051d2 <__clzdi2>:
    51d2:	03800793          	li	a5,56
    51d6:	00f55733          	srl	a4,a0,a5
    51da:	0ff77693          	zext.b	a3,a4
    51de:	ee99                	bnez	a3,51fc <__clzdi2+0x2a>
    51e0:	17e1                	addi	a5,a5,-8
    51e2:	fbf5                	bnez	a5,51d6 <__clzdi2+0x4>
    51e4:	00003797          	auipc	a5,0x3
    51e8:	fac7b783          	ld	a5,-84(a5) # 8190 <_GLOBAL_OFFSET_TABLE_+0x78>
    51ec:	97aa                	add	a5,a5,a0
    51ee:	0007c503          	lbu	a0,0(a5)
    51f2:	04000693          	li	a3,64
    51f6:	40a6853b          	subw	a0,a3,a0
    51fa:	8082                	ret
    51fc:	04000693          	li	a3,64
    5200:	8e9d                	sub	a3,a3,a5
    5202:	853a                	mv	a0,a4
    5204:	00003797          	auipc	a5,0x3
    5208:	f8c7b783          	ld	a5,-116(a5) # 8190 <_GLOBAL_OFFSET_TABLE_+0x78>
    520c:	97aa                	add	a5,a5,a0
    520e:	0007c503          	lbu	a0,0(a5)
    5212:	40a6853b          	subw	a0,a3,a0
    5216:	8082                	ret
