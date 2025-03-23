
timer:     file format elf32-littleriscv


Disassembly of section .text:

000100b4 <exit>:
   100b4:	ff010113          	addi	sp,sp,-16
   100b8:	00000593          	li	a1,0
   100bc:	00812423          	sw	s0,8(sp)
   100c0:	00112623          	sw	ra,12(sp)
   100c4:	00050413          	mv	s0,a0
   100c8:	371000ef          	jal	10c38 <__call_exitprocs>
   100cc:	f181a783          	lw	a5,-232(gp) # 23728 <__stdio_exit_handler>
   100d0:	00078463          	beqz	a5,100d8 <exit+0x24>
   100d4:	000780e7          	jalr	a5
   100d8:	00040513          	mv	a0,s0
   100dc:	3a80c0ef          	jal	1c484 <_exit>

000100e0 <main>:
   100e0:	fd010113          	addi	sp,sp,-48
   100e4:	00000593          	li	a1,0
   100e8:	00010513          	mv	a0,sp
   100ec:	02112623          	sw	ra,44(sp)
   100f0:	02812423          	sw	s0,40(sp)
   100f4:	255000ef          	jal	10b48 <gettimeofday>
   100f8:	00051c63          	bnez	a0,10110 <main+0x30>
   100fc:	19300893          	li	a7,403
   10100:	01010593          	addi	a1,sp,16
   10104:	00000073          	ecall
   10108:	00050413          	mv	s0,a0
   1010c:	00050e63          	beqz	a0,10128 <main+0x48>
   10110:	00100413          	li	s0,1
   10114:	02c12083          	lw	ra,44(sp)
   10118:	00040513          	mv	a0,s0
   1011c:	02812403          	lw	s0,40(sp)
   10120:	03010113          	addi	sp,sp,48
   10124:	00008067          	ret
   10128:	00812703          	lw	a4,8(sp)
   1012c:	00012603          	lw	a2,0(sp)
   10130:	00412683          	lw	a3,4(sp)
   10134:	41f75793          	srai	a5,a4,0x1f
   10138:	00012517          	auipc	a0,0x12
   1013c:	2b850513          	addi	a0,a0,696 # 223f0 <__clzsi2+0x50>
   10140:	550000ef          	jal	10690 <printf>
   10144:	01812703          	lw	a4,24(sp)
   10148:	01c12783          	lw	a5,28(sp)
   1014c:	01012603          	lw	a2,16(sp)
   10150:	01412683          	lw	a3,20(sp)
   10154:	00012517          	auipc	a0,0x12
   10158:	2c050513          	addi	a0,a0,704 # 22414 <__clzsi2+0x74>
   1015c:	534000ef          	jal	10690 <printf>
   10160:	fb5ff06f          	j	10114 <main+0x34>

00010164 <register_fini>:
   10164:	00000793          	li	a5,0
   10168:	00078863          	beqz	a5,10178 <register_fini+0x14>
   1016c:	00016537          	lui	a0,0x16
   10170:	a6450513          	addi	a0,a0,-1436 # 15a64 <__libc_fini_array>
   10174:	3f90006f          	j	10d6c <atexit>
   10178:	00008067          	ret

0001017c <_start>:
   1017c:	00013197          	auipc	gp,0x13
   10180:	69418193          	addi	gp,gp,1684 # 23810 <__global_pointer$>
   10184:	f1818513          	addi	a0,gp,-232 # 23728 <__stdio_exit_handler>
   10188:	24418613          	addi	a2,gp,580 # 23a54 <__BSS_END__>
   1018c:	40a60633          	sub	a2,a2,a0
   10190:	00000593          	li	a1,0
   10194:	1c9000ef          	jal	10b5c <memset>
   10198:	00001517          	auipc	a0,0x1
   1019c:	bd450513          	addi	a0,a0,-1068 # 10d6c <atexit>
   101a0:	00050863          	beqz	a0,101b0 <_start+0x34>
   101a4:	00006517          	auipc	a0,0x6
   101a8:	8c050513          	addi	a0,a0,-1856 # 15a64 <__libc_fini_array>
   101ac:	3c1000ef          	jal	10d6c <atexit>
   101b0:	0fd000ef          	jal	10aac <__libc_init_array>
   101b4:	00012503          	lw	a0,0(sp)
   101b8:	00410593          	addi	a1,sp,4
   101bc:	00000613          	li	a2,0
   101c0:	f21ff0ef          	jal	100e0 <main>
   101c4:	ef1ff06f          	j	100b4 <exit>

000101c8 <__do_global_dtors_aux>:
   101c8:	ff010113          	addi	sp,sp,-16
   101cc:	00812423          	sw	s0,8(sp)
   101d0:	f381c783          	lbu	a5,-200(gp) # 23748 <completed.1>
   101d4:	00112623          	sw	ra,12(sp)
   101d8:	02079263          	bnez	a5,101fc <__do_global_dtors_aux+0x34>
   101dc:	00000793          	li	a5,0
   101e0:	00078a63          	beqz	a5,101f4 <__do_global_dtors_aux+0x2c>
   101e4:	00023537          	lui	a0,0x23
   101e8:	cbc50513          	addi	a0,a0,-836 # 22cbc <__EH_FRAME_BEGIN__>
   101ec:	00000097          	auipc	ra,0x0
   101f0:	000000e7          	jalr	zero # 0 <exit-0x100b4>
   101f4:	00100793          	li	a5,1
   101f8:	f2f18c23          	sb	a5,-200(gp) # 23748 <completed.1>
   101fc:	00c12083          	lw	ra,12(sp)
   10200:	00812403          	lw	s0,8(sp)
   10204:	01010113          	addi	sp,sp,16
   10208:	00008067          	ret

0001020c <frame_dummy>:
   1020c:	00000793          	li	a5,0
   10210:	00078c63          	beqz	a5,10228 <frame_dummy+0x1c>
   10214:	00023537          	lui	a0,0x23
   10218:	f3c18593          	addi	a1,gp,-196 # 2374c <object.0>
   1021c:	cbc50513          	addi	a0,a0,-836 # 22cbc <__EH_FRAME_BEGIN__>
   10220:	00000317          	auipc	t1,0x0
   10224:	00000067          	jr	zero # 0 <exit-0x100b4>
   10228:	00008067          	ret

0001022c <__fp_lock>:
   1022c:	00000513          	li	a0,0
   10230:	00008067          	ret

00010234 <stdio_exit_handler>:
   10234:	00023637          	lui	a2,0x23
   10238:	000155b7          	lui	a1,0x15
   1023c:	00023537          	lui	a0,0x23
   10240:	01060613          	addi	a2,a2,16 # 23010 <__sglue>
   10244:	d4058593          	addi	a1,a1,-704 # 14d40 <_fclose_r>
   10248:	02050513          	addi	a0,a0,32 # 23020 <_impure_data>
   1024c:	3480006f          	j	10594 <_fwalk_sglue>

00010250 <cleanup_stdio>:
   10250:	00452583          	lw	a1,4(a0)
   10254:	ff010113          	addi	sp,sp,-16
   10258:	00812423          	sw	s0,8(sp)
   1025c:	00112623          	sw	ra,12(sp)
   10260:	f5418793          	addi	a5,gp,-172 # 23764 <__sf>
   10264:	00050413          	mv	s0,a0
   10268:	00f58463          	beq	a1,a5,10270 <cleanup_stdio+0x20>
   1026c:	2d5040ef          	jal	14d40 <_fclose_r>
   10270:	00842583          	lw	a1,8(s0)
   10274:	fbc18793          	addi	a5,gp,-68 # 237cc <__sf+0x68>
   10278:	00f58663          	beq	a1,a5,10284 <cleanup_stdio+0x34>
   1027c:	00040513          	mv	a0,s0
   10280:	2c1040ef          	jal	14d40 <_fclose_r>
   10284:	00c42583          	lw	a1,12(s0)
   10288:	02418793          	addi	a5,gp,36 # 23834 <__global_pointer$+0x24>
   1028c:	00f58c63          	beq	a1,a5,102a4 <cleanup_stdio+0x54>
   10290:	00040513          	mv	a0,s0
   10294:	00812403          	lw	s0,8(sp)
   10298:	00c12083          	lw	ra,12(sp)
   1029c:	01010113          	addi	sp,sp,16
   102a0:	2a10406f          	j	14d40 <_fclose_r>
   102a4:	00c12083          	lw	ra,12(sp)
   102a8:	00812403          	lw	s0,8(sp)
   102ac:	01010113          	addi	sp,sp,16
   102b0:	00008067          	ret

000102b4 <__fp_unlock>:
   102b4:	00000513          	li	a0,0
   102b8:	00008067          	ret

000102bc <global_stdio_init.part.0>:
   102bc:	fe010113          	addi	sp,sp,-32
   102c0:	00812c23          	sw	s0,24(sp)
   102c4:	000107b7          	lui	a5,0x10
   102c8:	f5418413          	addi	s0,gp,-172 # 23764 <__sf>
   102cc:	00112e23          	sw	ra,28(sp)
   102d0:	00912a23          	sw	s1,20(sp)
   102d4:	01212823          	sw	s2,16(sp)
   102d8:	01312623          	sw	s3,12(sp)
   102dc:	01412423          	sw	s4,8(sp)
   102e0:	00400713          	li	a4,4
   102e4:	23478793          	addi	a5,a5,564 # 10234 <stdio_exit_handler>
   102e8:	00800613          	li	a2,8
   102ec:	00000593          	li	a1,0
   102f0:	fb018513          	addi	a0,gp,-80 # 237c0 <__sf+0x5c>
   102f4:	f0f1ac23          	sw	a5,-232(gp) # 23728 <__stdio_exit_handler>
   102f8:	00e42623          	sw	a4,12(s0)
   102fc:	00042023          	sw	zero,0(s0)
   10300:	00042223          	sw	zero,4(s0)
   10304:	00042423          	sw	zero,8(s0)
   10308:	06042223          	sw	zero,100(s0)
   1030c:	00042823          	sw	zero,16(s0)
   10310:	00042a23          	sw	zero,20(s0)
   10314:	00042c23          	sw	zero,24(s0)
   10318:	045000ef          	jal	10b5c <memset>
   1031c:	000107b7          	lui	a5,0x10
   10320:	00010a37          	lui	s4,0x10
   10324:	000109b7          	lui	s3,0x10
   10328:	00010937          	lui	s2,0x10
   1032c:	000114b7          	lui	s1,0x11
   10330:	6dca0a13          	addi	s4,s4,1756 # 106dc <__sread>
   10334:	74098993          	addi	s3,s3,1856 # 10740 <__swrite>
   10338:	7c890913          	addi	s2,s2,1992 # 107c8 <__sseek>
   1033c:	82c48493          	addi	s1,s1,-2004 # 1082c <__sclose>
   10340:	00978793          	addi	a5,a5,9 # 10009 <exit-0xab>
   10344:	00800613          	li	a2,8
   10348:	00000593          	li	a1,0
   1034c:	01818513          	addi	a0,gp,24 # 23828 <__global_pointer$+0x18>
   10350:	06f42a23          	sw	a5,116(s0)
   10354:	03442023          	sw	s4,32(s0)
   10358:	03342223          	sw	s3,36(s0)
   1035c:	03242423          	sw	s2,40(s0)
   10360:	02942623          	sw	s1,44(s0)
   10364:	00842e23          	sw	s0,28(s0)
   10368:	06042423          	sw	zero,104(s0)
   1036c:	06042623          	sw	zero,108(s0)
   10370:	06042823          	sw	zero,112(s0)
   10374:	0c042623          	sw	zero,204(s0)
   10378:	06042c23          	sw	zero,120(s0)
   1037c:	06042e23          	sw	zero,124(s0)
   10380:	08042023          	sw	zero,128(s0)
   10384:	7d8000ef          	jal	10b5c <memset>
   10388:	000207b7          	lui	a5,0x20
   1038c:	01278793          	addi	a5,a5,18 # 20012 <__multf3+0x9ae>
   10390:	fbc18713          	addi	a4,gp,-68 # 237cc <__sf+0x68>
   10394:	08018513          	addi	a0,gp,128 # 23890 <__global_pointer$+0x80>
   10398:	00800613          	li	a2,8
   1039c:	00000593          	li	a1,0
   103a0:	09442423          	sw	s4,136(s0)
   103a4:	09342623          	sw	s3,140(s0)
   103a8:	09242823          	sw	s2,144(s0)
   103ac:	08942a23          	sw	s1,148(s0)
   103b0:	0cf42e23          	sw	a5,220(s0)
   103b4:	0c042823          	sw	zero,208(s0)
   103b8:	0c042a23          	sw	zero,212(s0)
   103bc:	0c042c23          	sw	zero,216(s0)
   103c0:	12042a23          	sw	zero,308(s0)
   103c4:	0e042023          	sw	zero,224(s0)
   103c8:	0e042223          	sw	zero,228(s0)
   103cc:	0e042423          	sw	zero,232(s0)
   103d0:	08e42223          	sw	a4,132(s0)
   103d4:	788000ef          	jal	10b5c <memset>
   103d8:	02418793          	addi	a5,gp,36 # 23834 <__global_pointer$+0x24>
   103dc:	0f442823          	sw	s4,240(s0)
   103e0:	0f342a23          	sw	s3,244(s0)
   103e4:	0f242c23          	sw	s2,248(s0)
   103e8:	0e942e23          	sw	s1,252(s0)
   103ec:	01c12083          	lw	ra,28(sp)
   103f0:	0ef42623          	sw	a5,236(s0)
   103f4:	01812403          	lw	s0,24(sp)
   103f8:	01412483          	lw	s1,20(sp)
   103fc:	01012903          	lw	s2,16(sp)
   10400:	00c12983          	lw	s3,12(sp)
   10404:	00812a03          	lw	s4,8(sp)
   10408:	02010113          	addi	sp,sp,32
   1040c:	00008067          	ret

00010410 <__sfp>:
   10410:	f181a783          	lw	a5,-232(gp) # 23728 <__stdio_exit_handler>
   10414:	fe010113          	addi	sp,sp,-32
   10418:	01312623          	sw	s3,12(sp)
   1041c:	00112e23          	sw	ra,28(sp)
   10420:	00812c23          	sw	s0,24(sp)
   10424:	00912a23          	sw	s1,20(sp)
   10428:	01212823          	sw	s2,16(sp)
   1042c:	00050993          	mv	s3,a0
   10430:	0e078863          	beqz	a5,10520 <__sfp+0x110>
   10434:	00023937          	lui	s2,0x23
   10438:	01090913          	addi	s2,s2,16 # 23010 <__sglue>
   1043c:	fff00493          	li	s1,-1
   10440:	00492783          	lw	a5,4(s2)
   10444:	00892403          	lw	s0,8(s2)
   10448:	fff78793          	addi	a5,a5,-1
   1044c:	0007d863          	bgez	a5,1045c <__sfp+0x4c>
   10450:	0800006f          	j	104d0 <__sfp+0xc0>
   10454:	06840413          	addi	s0,s0,104
   10458:	06978c63          	beq	a5,s1,104d0 <__sfp+0xc0>
   1045c:	00c41703          	lh	a4,12(s0)
   10460:	fff78793          	addi	a5,a5,-1
   10464:	fe0718e3          	bnez	a4,10454 <__sfp+0x44>
   10468:	ffff07b7          	lui	a5,0xffff0
   1046c:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffcc5ad>
   10470:	06042223          	sw	zero,100(s0)
   10474:	00042023          	sw	zero,0(s0)
   10478:	00042423          	sw	zero,8(s0)
   1047c:	00042223          	sw	zero,4(s0)
   10480:	00042823          	sw	zero,16(s0)
   10484:	00042a23          	sw	zero,20(s0)
   10488:	00042c23          	sw	zero,24(s0)
   1048c:	00f42623          	sw	a5,12(s0)
   10490:	00800613          	li	a2,8
   10494:	00000593          	li	a1,0
   10498:	05c40513          	addi	a0,s0,92
   1049c:	6c0000ef          	jal	10b5c <memset>
   104a0:	02042823          	sw	zero,48(s0)
   104a4:	02042a23          	sw	zero,52(s0)
   104a8:	04042223          	sw	zero,68(s0)
   104ac:	04042423          	sw	zero,72(s0)
   104b0:	01c12083          	lw	ra,28(sp)
   104b4:	00040513          	mv	a0,s0
   104b8:	01812403          	lw	s0,24(sp)
   104bc:	01412483          	lw	s1,20(sp)
   104c0:	01012903          	lw	s2,16(sp)
   104c4:	00c12983          	lw	s3,12(sp)
   104c8:	02010113          	addi	sp,sp,32
   104cc:	00008067          	ret
   104d0:	00092403          	lw	s0,0(s2)
   104d4:	00040663          	beqz	s0,104e0 <__sfp+0xd0>
   104d8:	00040913          	mv	s2,s0
   104dc:	f65ff06f          	j	10440 <__sfp+0x30>
   104e0:	1ac00593          	li	a1,428
   104e4:	00098513          	mv	a0,s3
   104e8:	4c1000ef          	jal	111a8 <_malloc_r>
   104ec:	00050413          	mv	s0,a0
   104f0:	02050c63          	beqz	a0,10528 <__sfp+0x118>
   104f4:	00400793          	li	a5,4
   104f8:	00c50513          	addi	a0,a0,12
   104fc:	00042023          	sw	zero,0(s0)
   10500:	00f42223          	sw	a5,4(s0)
   10504:	00a42423          	sw	a0,8(s0)
   10508:	1a000613          	li	a2,416
   1050c:	00000593          	li	a1,0
   10510:	64c000ef          	jal	10b5c <memset>
   10514:	00892023          	sw	s0,0(s2)
   10518:	00040913          	mv	s2,s0
   1051c:	f25ff06f          	j	10440 <__sfp+0x30>
   10520:	d9dff0ef          	jal	102bc <global_stdio_init.part.0>
   10524:	f11ff06f          	j	10434 <__sfp+0x24>
   10528:	00092023          	sw	zero,0(s2)
   1052c:	00c00793          	li	a5,12
   10530:	00f9a023          	sw	a5,0(s3)
   10534:	f7dff06f          	j	104b0 <__sfp+0xa0>

00010538 <__sinit>:
   10538:	03452783          	lw	a5,52(a0)
   1053c:	00078463          	beqz	a5,10544 <__sinit+0xc>
   10540:	00008067          	ret
   10544:	000107b7          	lui	a5,0x10
   10548:	f181a703          	lw	a4,-232(gp) # 23728 <__stdio_exit_handler>
   1054c:	25078793          	addi	a5,a5,592 # 10250 <cleanup_stdio>
   10550:	02f52a23          	sw	a5,52(a0)
   10554:	fe0716e3          	bnez	a4,10540 <__sinit+0x8>
   10558:	d65ff06f          	j	102bc <global_stdio_init.part.0>

0001055c <__sfp_lock_acquire>:
   1055c:	00008067          	ret

00010560 <__sfp_lock_release>:
   10560:	00008067          	ret

00010564 <__fp_lock_all>:
   10564:	00023637          	lui	a2,0x23
   10568:	000105b7          	lui	a1,0x10
   1056c:	01060613          	addi	a2,a2,16 # 23010 <__sglue>
   10570:	22c58593          	addi	a1,a1,556 # 1022c <__fp_lock>
   10574:	00000513          	li	a0,0
   10578:	01c0006f          	j	10594 <_fwalk_sglue>

0001057c <__fp_unlock_all>:
   1057c:	00023637          	lui	a2,0x23
   10580:	000105b7          	lui	a1,0x10
   10584:	01060613          	addi	a2,a2,16 # 23010 <__sglue>
   10588:	2b458593          	addi	a1,a1,692 # 102b4 <__fp_unlock>
   1058c:	00000513          	li	a0,0
   10590:	0040006f          	j	10594 <_fwalk_sglue>

00010594 <_fwalk_sglue>:
   10594:	fd010113          	addi	sp,sp,-48
   10598:	03212023          	sw	s2,32(sp)
   1059c:	01312e23          	sw	s3,28(sp)
   105a0:	01412c23          	sw	s4,24(sp)
   105a4:	01512a23          	sw	s5,20(sp)
   105a8:	01612823          	sw	s6,16(sp)
   105ac:	01712623          	sw	s7,12(sp)
   105b0:	02112623          	sw	ra,44(sp)
   105b4:	02812423          	sw	s0,40(sp)
   105b8:	02912223          	sw	s1,36(sp)
   105bc:	00050b13          	mv	s6,a0
   105c0:	00058b93          	mv	s7,a1
   105c4:	00060a93          	mv	s5,a2
   105c8:	00000a13          	li	s4,0
   105cc:	00100993          	li	s3,1
   105d0:	fff00913          	li	s2,-1
   105d4:	004aa483          	lw	s1,4(s5)
   105d8:	008aa403          	lw	s0,8(s5)
   105dc:	fff48493          	addi	s1,s1,-1
   105e0:	0204c863          	bltz	s1,10610 <_fwalk_sglue+0x7c>
   105e4:	00c45783          	lhu	a5,12(s0)
   105e8:	00f9fe63          	bgeu	s3,a5,10604 <_fwalk_sglue+0x70>
   105ec:	00e41783          	lh	a5,14(s0)
   105f0:	00040593          	mv	a1,s0
   105f4:	000b0513          	mv	a0,s6
   105f8:	01278663          	beq	a5,s2,10604 <_fwalk_sglue+0x70>
   105fc:	000b80e7          	jalr	s7
   10600:	00aa6a33          	or	s4,s4,a0
   10604:	fff48493          	addi	s1,s1,-1
   10608:	06840413          	addi	s0,s0,104
   1060c:	fd249ce3          	bne	s1,s2,105e4 <_fwalk_sglue+0x50>
   10610:	000aaa83          	lw	s5,0(s5)
   10614:	fc0a90e3          	bnez	s5,105d4 <_fwalk_sglue+0x40>
   10618:	02c12083          	lw	ra,44(sp)
   1061c:	02812403          	lw	s0,40(sp)
   10620:	02412483          	lw	s1,36(sp)
   10624:	02012903          	lw	s2,32(sp)
   10628:	01c12983          	lw	s3,28(sp)
   1062c:	01412a83          	lw	s5,20(sp)
   10630:	01012b03          	lw	s6,16(sp)
   10634:	00c12b83          	lw	s7,12(sp)
   10638:	000a0513          	mv	a0,s4
   1063c:	01812a03          	lw	s4,24(sp)
   10640:	03010113          	addi	sp,sp,48
   10644:	00008067          	ret

00010648 <_printf_r>:
   10648:	fc010113          	addi	sp,sp,-64
   1064c:	00058e13          	mv	t3,a1
   10650:	00852583          	lw	a1,8(a0)
   10654:	02810313          	addi	t1,sp,40
   10658:	02c12423          	sw	a2,40(sp)
   1065c:	02d12623          	sw	a3,44(sp)
   10660:	000e0613          	mv	a2,t3
   10664:	00030693          	mv	a3,t1
   10668:	00112e23          	sw	ra,28(sp)
   1066c:	02e12823          	sw	a4,48(sp)
   10670:	02f12a23          	sw	a5,52(sp)
   10674:	03012c23          	sw	a6,56(sp)
   10678:	03112e23          	sw	a7,60(sp)
   1067c:	00612623          	sw	t1,12(sp)
   10680:	338010ef          	jal	119b8 <_vfprintf_r>
   10684:	01c12083          	lw	ra,28(sp)
   10688:	04010113          	addi	sp,sp,64
   1068c:	00008067          	ret

00010690 <printf>:
   10690:	f0c1a303          	lw	t1,-244(gp) # 2371c <_impure_ptr>
   10694:	fc010113          	addi	sp,sp,-64
   10698:	02c12423          	sw	a2,40(sp)
   1069c:	02d12623          	sw	a3,44(sp)
   106a0:	02b12223          	sw	a1,36(sp)
   106a4:	02e12823          	sw	a4,48(sp)
   106a8:	02f12a23          	sw	a5,52(sp)
   106ac:	03012c23          	sw	a6,56(sp)
   106b0:	03112e23          	sw	a7,60(sp)
   106b4:	00832583          	lw	a1,8(t1) # 10228 <frame_dummy+0x1c>
   106b8:	02410693          	addi	a3,sp,36
   106bc:	00050613          	mv	a2,a0
   106c0:	00030513          	mv	a0,t1
   106c4:	00112e23          	sw	ra,28(sp)
   106c8:	00d12623          	sw	a3,12(sp)
   106cc:	2ec010ef          	jal	119b8 <_vfprintf_r>
   106d0:	01c12083          	lw	ra,28(sp)
   106d4:	04010113          	addi	sp,sp,64
   106d8:	00008067          	ret

000106dc <__sread>:
   106dc:	ff010113          	addi	sp,sp,-16
   106e0:	00812423          	sw	s0,8(sp)
   106e4:	00058413          	mv	s0,a1
   106e8:	00e59583          	lh	a1,14(a1)
   106ec:	00112623          	sw	ra,12(sp)
   106f0:	2ec000ef          	jal	109dc <_read_r>
   106f4:	02054063          	bltz	a0,10714 <__sread+0x38>
   106f8:	05042783          	lw	a5,80(s0)
   106fc:	00c12083          	lw	ra,12(sp)
   10700:	00a787b3          	add	a5,a5,a0
   10704:	04f42823          	sw	a5,80(s0)
   10708:	00812403          	lw	s0,8(sp)
   1070c:	01010113          	addi	sp,sp,16
   10710:	00008067          	ret
   10714:	00c45783          	lhu	a5,12(s0)
   10718:	fffff737          	lui	a4,0xfffff
   1071c:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffdb5ab>
   10720:	00e7f7b3          	and	a5,a5,a4
   10724:	00c12083          	lw	ra,12(sp)
   10728:	00f41623          	sh	a5,12(s0)
   1072c:	00812403          	lw	s0,8(sp)
   10730:	01010113          	addi	sp,sp,16
   10734:	00008067          	ret

00010738 <__seofread>:
   10738:	00000513          	li	a0,0
   1073c:	00008067          	ret

00010740 <__swrite>:
   10740:	00c59783          	lh	a5,12(a1)
   10744:	fe010113          	addi	sp,sp,-32
   10748:	00812c23          	sw	s0,24(sp)
   1074c:	00912a23          	sw	s1,20(sp)
   10750:	01212823          	sw	s2,16(sp)
   10754:	01312623          	sw	s3,12(sp)
   10758:	00112e23          	sw	ra,28(sp)
   1075c:	1007f713          	andi	a4,a5,256
   10760:	00058413          	mv	s0,a1
   10764:	00060913          	mv	s2,a2
   10768:	00068993          	mv	s3,a3
   1076c:	00050493          	mv	s1,a0
   10770:	04071063          	bnez	a4,107b0 <__swrite+0x70>
   10774:	fffff737          	lui	a4,0xfffff
   10778:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffdb5ab>
   1077c:	00e7f7b3          	and	a5,a5,a4
   10780:	00e41583          	lh	a1,14(s0)
   10784:	00f41623          	sh	a5,12(s0)
   10788:	01812403          	lw	s0,24(sp)
   1078c:	01c12083          	lw	ra,28(sp)
   10790:	00098693          	mv	a3,s3
   10794:	00090613          	mv	a2,s2
   10798:	00c12983          	lw	s3,12(sp)
   1079c:	01012903          	lw	s2,16(sp)
   107a0:	00048513          	mv	a0,s1
   107a4:	01412483          	lw	s1,20(sp)
   107a8:	02010113          	addi	sp,sp,32
   107ac:	2980006f          	j	10a44 <_write_r>
   107b0:	00e59583          	lh	a1,14(a1)
   107b4:	00200693          	li	a3,2
   107b8:	00000613          	li	a2,0
   107bc:	1b8000ef          	jal	10974 <_lseek_r>
   107c0:	00c41783          	lh	a5,12(s0)
   107c4:	fb1ff06f          	j	10774 <__swrite+0x34>

000107c8 <__sseek>:
   107c8:	ff010113          	addi	sp,sp,-16
   107cc:	00812423          	sw	s0,8(sp)
   107d0:	00058413          	mv	s0,a1
   107d4:	00e59583          	lh	a1,14(a1)
   107d8:	00112623          	sw	ra,12(sp)
   107dc:	198000ef          	jal	10974 <_lseek_r>
   107e0:	fff00713          	li	a4,-1
   107e4:	00c41783          	lh	a5,12(s0)
   107e8:	02e50263          	beq	a0,a4,1080c <__sseek+0x44>
   107ec:	00001737          	lui	a4,0x1
   107f0:	00e7e7b3          	or	a5,a5,a4
   107f4:	00c12083          	lw	ra,12(sp)
   107f8:	04a42823          	sw	a0,80(s0)
   107fc:	00f41623          	sh	a5,12(s0)
   10800:	00812403          	lw	s0,8(sp)
   10804:	01010113          	addi	sp,sp,16
   10808:	00008067          	ret
   1080c:	fffff737          	lui	a4,0xfffff
   10810:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffdb5ab>
   10814:	00e7f7b3          	and	a5,a5,a4
   10818:	00c12083          	lw	ra,12(sp)
   1081c:	00f41623          	sh	a5,12(s0)
   10820:	00812403          	lw	s0,8(sp)
   10824:	01010113          	addi	sp,sp,16
   10828:	00008067          	ret

0001082c <__sclose>:
   1082c:	00e59583          	lh	a1,14(a1)
   10830:	0040006f          	j	10834 <_close_r>

00010834 <_close_r>:
   10834:	ff010113          	addi	sp,sp,-16
   10838:	00812423          	sw	s0,8(sp)
   1083c:	00912223          	sw	s1,4(sp)
   10840:	00050413          	mv	s0,a0
   10844:	00058513          	mv	a0,a1
   10848:	00112623          	sw	ra,12(sp)
   1084c:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   10850:	3f10b0ef          	jal	1c440 <_close>
   10854:	fff00793          	li	a5,-1
   10858:	00f50c63          	beq	a0,a5,10870 <_close_r+0x3c>
   1085c:	00c12083          	lw	ra,12(sp)
   10860:	00812403          	lw	s0,8(sp)
   10864:	00412483          	lw	s1,4(sp)
   10868:	01010113          	addi	sp,sp,16
   1086c:	00008067          	ret
   10870:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   10874:	fe0784e3          	beqz	a5,1085c <_close_r+0x28>
   10878:	00c12083          	lw	ra,12(sp)
   1087c:	00f42023          	sw	a5,0(s0)
   10880:	00812403          	lw	s0,8(sp)
   10884:	00412483          	lw	s1,4(sp)
   10888:	01010113          	addi	sp,sp,16
   1088c:	00008067          	ret

00010890 <_reclaim_reent>:
   10890:	f0c1a783          	lw	a5,-244(gp) # 2371c <_impure_ptr>
   10894:	0ca78e63          	beq	a5,a0,10970 <_reclaim_reent+0xe0>
   10898:	04452583          	lw	a1,68(a0)
   1089c:	fe010113          	addi	sp,sp,-32
   108a0:	00912a23          	sw	s1,20(sp)
   108a4:	00112e23          	sw	ra,28(sp)
   108a8:	00812c23          	sw	s0,24(sp)
   108ac:	00050493          	mv	s1,a0
   108b0:	04058863          	beqz	a1,10900 <_reclaim_reent+0x70>
   108b4:	01212823          	sw	s2,16(sp)
   108b8:	01312623          	sw	s3,12(sp)
   108bc:	00000913          	li	s2,0
   108c0:	08000993          	li	s3,128
   108c4:	012587b3          	add	a5,a1,s2
   108c8:	0007a403          	lw	s0,0(a5)
   108cc:	00040e63          	beqz	s0,108e8 <_reclaim_reent+0x58>
   108d0:	00040593          	mv	a1,s0
   108d4:	00042403          	lw	s0,0(s0)
   108d8:	00048513          	mv	a0,s1
   108dc:	5dc000ef          	jal	10eb8 <_free_r>
   108e0:	fe0418e3          	bnez	s0,108d0 <_reclaim_reent+0x40>
   108e4:	0444a583          	lw	a1,68(s1)
   108e8:	00490913          	addi	s2,s2,4
   108ec:	fd391ce3          	bne	s2,s3,108c4 <_reclaim_reent+0x34>
   108f0:	00048513          	mv	a0,s1
   108f4:	5c4000ef          	jal	10eb8 <_free_r>
   108f8:	01012903          	lw	s2,16(sp)
   108fc:	00c12983          	lw	s3,12(sp)
   10900:	0384a583          	lw	a1,56(s1)
   10904:	00058663          	beqz	a1,10910 <_reclaim_reent+0x80>
   10908:	00048513          	mv	a0,s1
   1090c:	5ac000ef          	jal	10eb8 <_free_r>
   10910:	0404a403          	lw	s0,64(s1)
   10914:	00040c63          	beqz	s0,1092c <_reclaim_reent+0x9c>
   10918:	00040593          	mv	a1,s0
   1091c:	00042403          	lw	s0,0(s0)
   10920:	00048513          	mv	a0,s1
   10924:	594000ef          	jal	10eb8 <_free_r>
   10928:	fe0418e3          	bnez	s0,10918 <_reclaim_reent+0x88>
   1092c:	04c4a583          	lw	a1,76(s1)
   10930:	00058663          	beqz	a1,1093c <_reclaim_reent+0xac>
   10934:	00048513          	mv	a0,s1
   10938:	580000ef          	jal	10eb8 <_free_r>
   1093c:	0344a783          	lw	a5,52(s1)
   10940:	00078e63          	beqz	a5,1095c <_reclaim_reent+0xcc>
   10944:	01812403          	lw	s0,24(sp)
   10948:	01c12083          	lw	ra,28(sp)
   1094c:	00048513          	mv	a0,s1
   10950:	01412483          	lw	s1,20(sp)
   10954:	02010113          	addi	sp,sp,32
   10958:	00078067          	jr	a5
   1095c:	01c12083          	lw	ra,28(sp)
   10960:	01812403          	lw	s0,24(sp)
   10964:	01412483          	lw	s1,20(sp)
   10968:	02010113          	addi	sp,sp,32
   1096c:	00008067          	ret
   10970:	00008067          	ret

00010974 <_lseek_r>:
   10974:	ff010113          	addi	sp,sp,-16
   10978:	00058713          	mv	a4,a1
   1097c:	00812423          	sw	s0,8(sp)
   10980:	00912223          	sw	s1,4(sp)
   10984:	00060593          	mv	a1,a2
   10988:	00050413          	mv	s0,a0
   1098c:	00068613          	mv	a2,a3
   10990:	00070513          	mv	a0,a4
   10994:	00112623          	sw	ra,12(sp)
   10998:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   1099c:	45d0b0ef          	jal	1c5f8 <_lseek>
   109a0:	fff00793          	li	a5,-1
   109a4:	00f50c63          	beq	a0,a5,109bc <_lseek_r+0x48>
   109a8:	00c12083          	lw	ra,12(sp)
   109ac:	00812403          	lw	s0,8(sp)
   109b0:	00412483          	lw	s1,4(sp)
   109b4:	01010113          	addi	sp,sp,16
   109b8:	00008067          	ret
   109bc:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   109c0:	fe0784e3          	beqz	a5,109a8 <_lseek_r+0x34>
   109c4:	00c12083          	lw	ra,12(sp)
   109c8:	00f42023          	sw	a5,0(s0)
   109cc:	00812403          	lw	s0,8(sp)
   109d0:	00412483          	lw	s1,4(sp)
   109d4:	01010113          	addi	sp,sp,16
   109d8:	00008067          	ret

000109dc <_read_r>:
   109dc:	ff010113          	addi	sp,sp,-16
   109e0:	00058713          	mv	a4,a1
   109e4:	00812423          	sw	s0,8(sp)
   109e8:	00912223          	sw	s1,4(sp)
   109ec:	00060593          	mv	a1,a2
   109f0:	00050413          	mv	s0,a0
   109f4:	00068613          	mv	a2,a3
   109f8:	00070513          	mv	a0,a4
   109fc:	00112623          	sw	ra,12(sp)
   10a00:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   10a04:	4390b0ef          	jal	1c63c <_read>
   10a08:	fff00793          	li	a5,-1
   10a0c:	00f50c63          	beq	a0,a5,10a24 <_read_r+0x48>
   10a10:	00c12083          	lw	ra,12(sp)
   10a14:	00812403          	lw	s0,8(sp)
   10a18:	00412483          	lw	s1,4(sp)
   10a1c:	01010113          	addi	sp,sp,16
   10a20:	00008067          	ret
   10a24:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   10a28:	fe0784e3          	beqz	a5,10a10 <_read_r+0x34>
   10a2c:	00c12083          	lw	ra,12(sp)
   10a30:	00f42023          	sw	a5,0(s0)
   10a34:	00812403          	lw	s0,8(sp)
   10a38:	00412483          	lw	s1,4(sp)
   10a3c:	01010113          	addi	sp,sp,16
   10a40:	00008067          	ret

00010a44 <_write_r>:
   10a44:	ff010113          	addi	sp,sp,-16
   10a48:	00058713          	mv	a4,a1
   10a4c:	00812423          	sw	s0,8(sp)
   10a50:	00912223          	sw	s1,4(sp)
   10a54:	00060593          	mv	a1,a2
   10a58:	00050413          	mv	s0,a0
   10a5c:	00068613          	mv	a2,a3
   10a60:	00070513          	mv	a0,a4
   10a64:	00112623          	sw	ra,12(sp)
   10a68:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   10a6c:	48d0b0ef          	jal	1c6f8 <_write>
   10a70:	fff00793          	li	a5,-1
   10a74:	00f50c63          	beq	a0,a5,10a8c <_write_r+0x48>
   10a78:	00c12083          	lw	ra,12(sp)
   10a7c:	00812403          	lw	s0,8(sp)
   10a80:	00412483          	lw	s1,4(sp)
   10a84:	01010113          	addi	sp,sp,16
   10a88:	00008067          	ret
   10a8c:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   10a90:	fe0784e3          	beqz	a5,10a78 <_write_r+0x34>
   10a94:	00c12083          	lw	ra,12(sp)
   10a98:	00f42023          	sw	a5,0(s0)
   10a9c:	00812403          	lw	s0,8(sp)
   10aa0:	00412483          	lw	s1,4(sp)
   10aa4:	01010113          	addi	sp,sp,16
   10aa8:	00008067          	ret

00010aac <__libc_init_array>:
   10aac:	ff010113          	addi	sp,sp,-16
   10ab0:	00812423          	sw	s0,8(sp)
   10ab4:	000237b7          	lui	a5,0x23
   10ab8:	00023437          	lui	s0,0x23
   10abc:	01212023          	sw	s2,0(sp)
   10ac0:	00078793          	mv	a5,a5
   10ac4:	00040713          	mv	a4,s0
   10ac8:	00112623          	sw	ra,12(sp)
   10acc:	00912223          	sw	s1,4(sp)
   10ad0:	40e78933          	sub	s2,a5,a4
   10ad4:	02e78263          	beq	a5,a4,10af8 <__libc_init_array+0x4c>
   10ad8:	40295913          	srai	s2,s2,0x2
   10adc:	00040413          	mv	s0,s0
   10ae0:	00000493          	li	s1,0
   10ae4:	00042783          	lw	a5,0(s0) # 23000 <__init_array_start>
   10ae8:	00148493          	addi	s1,s1,1
   10aec:	00440413          	addi	s0,s0,4
   10af0:	000780e7          	jalr	a5 # 23000 <__init_array_start>
   10af4:	ff24e8e3          	bltu	s1,s2,10ae4 <__libc_init_array+0x38>
   10af8:	000237b7          	lui	a5,0x23
   10afc:	00023437          	lui	s0,0x23
   10b00:	00878793          	addi	a5,a5,8 # 23008 <__do_global_dtors_aux_fini_array_entry>
   10b04:	00040713          	mv	a4,s0
   10b08:	40e78933          	sub	s2,a5,a4
   10b0c:	40295913          	srai	s2,s2,0x2
   10b10:	02e78063          	beq	a5,a4,10b30 <__libc_init_array+0x84>
   10b14:	00040413          	mv	s0,s0
   10b18:	00000493          	li	s1,0
   10b1c:	00042783          	lw	a5,0(s0) # 23000 <__init_array_start>
   10b20:	00148493          	addi	s1,s1,1
   10b24:	00440413          	addi	s0,s0,4
   10b28:	000780e7          	jalr	a5
   10b2c:	ff24e8e3          	bltu	s1,s2,10b1c <__libc_init_array+0x70>
   10b30:	00c12083          	lw	ra,12(sp)
   10b34:	00812403          	lw	s0,8(sp)
   10b38:	00412483          	lw	s1,4(sp)
   10b3c:	00012903          	lw	s2,0(sp)
   10b40:	01010113          	addi	sp,sp,16
   10b44:	00008067          	ret

00010b48 <gettimeofday>:
   10b48:	00050793          	mv	a5,a0
   10b4c:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   10b50:	00058613          	mv	a2,a1
   10b54:	00078593          	mv	a1,a5
   10b58:	64d0406f          	j	159a4 <_gettimeofday_r>

00010b5c <memset>:
   10b5c:	00f00313          	li	t1,15
   10b60:	00050713          	mv	a4,a0
   10b64:	02c37e63          	bgeu	t1,a2,10ba0 <memset+0x44>
   10b68:	00f77793          	andi	a5,a4,15
   10b6c:	0a079063          	bnez	a5,10c0c <memset+0xb0>
   10b70:	08059263          	bnez	a1,10bf4 <memset+0x98>
   10b74:	ff067693          	andi	a3,a2,-16
   10b78:	00f67613          	andi	a2,a2,15
   10b7c:	00e686b3          	add	a3,a3,a4
   10b80:	00b72023          	sw	a1,0(a4)
   10b84:	00b72223          	sw	a1,4(a4)
   10b88:	00b72423          	sw	a1,8(a4)
   10b8c:	00b72623          	sw	a1,12(a4)
   10b90:	01070713          	addi	a4,a4,16
   10b94:	fed766e3          	bltu	a4,a3,10b80 <memset+0x24>
   10b98:	00061463          	bnez	a2,10ba0 <memset+0x44>
   10b9c:	00008067          	ret
   10ba0:	40c306b3          	sub	a3,t1,a2
   10ba4:	00269693          	slli	a3,a3,0x2
   10ba8:	00000297          	auipc	t0,0x0
   10bac:	005686b3          	add	a3,a3,t0
   10bb0:	00c68067          	jr	12(a3)
   10bb4:	00b70723          	sb	a1,14(a4)
   10bb8:	00b706a3          	sb	a1,13(a4)
   10bbc:	00b70623          	sb	a1,12(a4)
   10bc0:	00b705a3          	sb	a1,11(a4)
   10bc4:	00b70523          	sb	a1,10(a4)
   10bc8:	00b704a3          	sb	a1,9(a4)
   10bcc:	00b70423          	sb	a1,8(a4)
   10bd0:	00b703a3          	sb	a1,7(a4)
   10bd4:	00b70323          	sb	a1,6(a4)
   10bd8:	00b702a3          	sb	a1,5(a4)
   10bdc:	00b70223          	sb	a1,4(a4)
   10be0:	00b701a3          	sb	a1,3(a4)
   10be4:	00b70123          	sb	a1,2(a4)
   10be8:	00b700a3          	sb	a1,1(a4)
   10bec:	00b70023          	sb	a1,0(a4)
   10bf0:	00008067          	ret
   10bf4:	0ff5f593          	zext.b	a1,a1
   10bf8:	00859693          	slli	a3,a1,0x8
   10bfc:	00d5e5b3          	or	a1,a1,a3
   10c00:	01059693          	slli	a3,a1,0x10
   10c04:	00d5e5b3          	or	a1,a1,a3
   10c08:	f6dff06f          	j	10b74 <memset+0x18>
   10c0c:	00279693          	slli	a3,a5,0x2
   10c10:	00000297          	auipc	t0,0x0
   10c14:	005686b3          	add	a3,a3,t0
   10c18:	00008293          	mv	t0,ra
   10c1c:	fa0680e7          	jalr	-96(a3)
   10c20:	00028093          	mv	ra,t0
   10c24:	ff078793          	addi	a5,a5,-16
   10c28:	40f70733          	sub	a4,a4,a5
   10c2c:	00f60633          	add	a2,a2,a5
   10c30:	f6c378e3          	bgeu	t1,a2,10ba0 <memset+0x44>
   10c34:	f3dff06f          	j	10b70 <memset+0x14>

00010c38 <__call_exitprocs>:
   10c38:	fd010113          	addi	sp,sp,-48
   10c3c:	01412c23          	sw	s4,24(sp)
   10c40:	03212023          	sw	s2,32(sp)
   10c44:	f201a903          	lw	s2,-224(gp) # 23730 <__atexit>
   10c48:	02112623          	sw	ra,44(sp)
   10c4c:	06090c63          	beqz	s2,10cc4 <__call_exitprocs+0x8c>
   10c50:	01312e23          	sw	s3,28(sp)
   10c54:	01512a23          	sw	s5,20(sp)
   10c58:	01612823          	sw	s6,16(sp)
   10c5c:	01712623          	sw	s7,12(sp)
   10c60:	02812423          	sw	s0,40(sp)
   10c64:	02912223          	sw	s1,36(sp)
   10c68:	01812423          	sw	s8,8(sp)
   10c6c:	00050b13          	mv	s6,a0
   10c70:	00058b93          	mv	s7,a1
   10c74:	fff00993          	li	s3,-1
   10c78:	00100a93          	li	s5,1
   10c7c:	00492483          	lw	s1,4(s2)
   10c80:	fff48413          	addi	s0,s1,-1
   10c84:	02044263          	bltz	s0,10ca8 <__call_exitprocs+0x70>
   10c88:	00249493          	slli	s1,s1,0x2
   10c8c:	009904b3          	add	s1,s2,s1
   10c90:	040b8463          	beqz	s7,10cd8 <__call_exitprocs+0xa0>
   10c94:	1044a783          	lw	a5,260(s1)
   10c98:	05778063          	beq	a5,s7,10cd8 <__call_exitprocs+0xa0>
   10c9c:	fff40413          	addi	s0,s0,-1
   10ca0:	ffc48493          	addi	s1,s1,-4
   10ca4:	ff3418e3          	bne	s0,s3,10c94 <__call_exitprocs+0x5c>
   10ca8:	02812403          	lw	s0,40(sp)
   10cac:	02412483          	lw	s1,36(sp)
   10cb0:	01c12983          	lw	s3,28(sp)
   10cb4:	01412a83          	lw	s5,20(sp)
   10cb8:	01012b03          	lw	s6,16(sp)
   10cbc:	00c12b83          	lw	s7,12(sp)
   10cc0:	00812c03          	lw	s8,8(sp)
   10cc4:	02c12083          	lw	ra,44(sp)
   10cc8:	02012903          	lw	s2,32(sp)
   10ccc:	01812a03          	lw	s4,24(sp)
   10cd0:	03010113          	addi	sp,sp,48
   10cd4:	00008067          	ret
   10cd8:	00492783          	lw	a5,4(s2)
   10cdc:	0044a683          	lw	a3,4(s1)
   10ce0:	fff78793          	addi	a5,a5,-1
   10ce4:	06878a63          	beq	a5,s0,10d58 <__call_exitprocs+0x120>
   10ce8:	0004a223          	sw	zero,4(s1)
   10cec:	02068663          	beqz	a3,10d18 <__call_exitprocs+0xe0>
   10cf0:	18892783          	lw	a5,392(s2)
   10cf4:	008a9733          	sll	a4,s5,s0
   10cf8:	00492c03          	lw	s8,4(s2)
   10cfc:	00f777b3          	and	a5,a4,a5
   10d00:	02079463          	bnez	a5,10d28 <__call_exitprocs+0xf0>
   10d04:	000680e7          	jalr	a3
   10d08:	00492703          	lw	a4,4(s2)
   10d0c:	f201a783          	lw	a5,-224(gp) # 23730 <__atexit>
   10d10:	03871e63          	bne	a4,s8,10d4c <__call_exitprocs+0x114>
   10d14:	03279c63          	bne	a5,s2,10d4c <__call_exitprocs+0x114>
   10d18:	fff40413          	addi	s0,s0,-1
   10d1c:	ffc48493          	addi	s1,s1,-4
   10d20:	f73418e3          	bne	s0,s3,10c90 <__call_exitprocs+0x58>
   10d24:	f85ff06f          	j	10ca8 <__call_exitprocs+0x70>
   10d28:	18c92783          	lw	a5,396(s2)
   10d2c:	0844a583          	lw	a1,132(s1)
   10d30:	00f77733          	and	a4,a4,a5
   10d34:	02071663          	bnez	a4,10d60 <__call_exitprocs+0x128>
   10d38:	000b0513          	mv	a0,s6
   10d3c:	000680e7          	jalr	a3
   10d40:	00492703          	lw	a4,4(s2)
   10d44:	f201a783          	lw	a5,-224(gp) # 23730 <__atexit>
   10d48:	fd8706e3          	beq	a4,s8,10d14 <__call_exitprocs+0xdc>
   10d4c:	f4078ee3          	beqz	a5,10ca8 <__call_exitprocs+0x70>
   10d50:	00078913          	mv	s2,a5
   10d54:	f29ff06f          	j	10c7c <__call_exitprocs+0x44>
   10d58:	00892223          	sw	s0,4(s2)
   10d5c:	f91ff06f          	j	10cec <__call_exitprocs+0xb4>
   10d60:	00058513          	mv	a0,a1
   10d64:	000680e7          	jalr	a3
   10d68:	fa1ff06f          	j	10d08 <__call_exitprocs+0xd0>

00010d6c <atexit>:
   10d6c:	00050593          	mv	a1,a0
   10d70:	00000693          	li	a3,0
   10d74:	00000613          	li	a2,0
   10d78:	00000513          	li	a0,0
   10d7c:	1a40506f          	j	15f20 <__register_exitproc>

00010d80 <_malloc_trim_r>:
   10d80:	fe010113          	addi	sp,sp,-32
   10d84:	01312623          	sw	s3,12(sp)
   10d88:	000239b7          	lui	s3,0x23
   10d8c:	00812c23          	sw	s0,24(sp)
   10d90:	00912a23          	sw	s1,20(sp)
   10d94:	01212823          	sw	s2,16(sp)
   10d98:	01412423          	sw	s4,8(sp)
   10d9c:	00112e23          	sw	ra,28(sp)
   10da0:	00058a13          	mv	s4,a1
   10da4:	00050913          	mv	s2,a0
   10da8:	14098993          	addi	s3,s3,320 # 23140 <__malloc_av_>
   10dac:	405000ef          	jal	119b0 <__malloc_lock>
   10db0:	0089a783          	lw	a5,8(s3)
   10db4:	00001437          	lui	s0,0x1
   10db8:	fef40413          	addi	s0,s0,-17 # fef <exit-0xf0c5>
   10dbc:	0047a483          	lw	s1,4(a5)
   10dc0:	000017b7          	lui	a5,0x1
   10dc4:	ffc4f493          	andi	s1,s1,-4
   10dc8:	00848433          	add	s0,s1,s0
   10dcc:	41440433          	sub	s0,s0,s4
   10dd0:	00c45413          	srli	s0,s0,0xc
   10dd4:	fff40413          	addi	s0,s0,-1
   10dd8:	00c41413          	slli	s0,s0,0xc
   10ddc:	00f44e63          	blt	s0,a5,10df8 <_malloc_trim_r+0x78>
   10de0:	00000593          	li	a1,0
   10de4:	00090513          	mv	a0,s2
   10de8:	421040ef          	jal	15a08 <_sbrk_r>
   10dec:	0089a783          	lw	a5,8(s3)
   10df0:	009787b3          	add	a5,a5,s1
   10df4:	02f50863          	beq	a0,a5,10e24 <_malloc_trim_r+0xa4>
   10df8:	00090513          	mv	a0,s2
   10dfc:	3b9000ef          	jal	119b4 <__malloc_unlock>
   10e00:	01c12083          	lw	ra,28(sp)
   10e04:	01812403          	lw	s0,24(sp)
   10e08:	01412483          	lw	s1,20(sp)
   10e0c:	01012903          	lw	s2,16(sp)
   10e10:	00c12983          	lw	s3,12(sp)
   10e14:	00812a03          	lw	s4,8(sp)
   10e18:	00000513          	li	a0,0
   10e1c:	02010113          	addi	sp,sp,32
   10e20:	00008067          	ret
   10e24:	408005b3          	neg	a1,s0
   10e28:	00090513          	mv	a0,s2
   10e2c:	3dd040ef          	jal	15a08 <_sbrk_r>
   10e30:	fff00793          	li	a5,-1
   10e34:	04f50863          	beq	a0,a5,10e84 <_malloc_trim_r+0x104>
   10e38:	08c18793          	addi	a5,gp,140 # 2389c <__malloc_current_mallinfo>
   10e3c:	0089a683          	lw	a3,8(s3)
   10e40:	0007a703          	lw	a4,0(a5) # 1000 <exit-0xf0b4>
   10e44:	408484b3          	sub	s1,s1,s0
   10e48:	0014e493          	ori	s1,s1,1
   10e4c:	00090513          	mv	a0,s2
   10e50:	40870733          	sub	a4,a4,s0
   10e54:	0096a223          	sw	s1,4(a3)
   10e58:	00e7a023          	sw	a4,0(a5)
   10e5c:	359000ef          	jal	119b4 <__malloc_unlock>
   10e60:	01c12083          	lw	ra,28(sp)
   10e64:	01812403          	lw	s0,24(sp)
   10e68:	01412483          	lw	s1,20(sp)
   10e6c:	01012903          	lw	s2,16(sp)
   10e70:	00c12983          	lw	s3,12(sp)
   10e74:	00812a03          	lw	s4,8(sp)
   10e78:	00100513          	li	a0,1
   10e7c:	02010113          	addi	sp,sp,32
   10e80:	00008067          	ret
   10e84:	00000593          	li	a1,0
   10e88:	00090513          	mv	a0,s2
   10e8c:	37d040ef          	jal	15a08 <_sbrk_r>
   10e90:	0089a703          	lw	a4,8(s3)
   10e94:	00f00693          	li	a3,15
   10e98:	40e507b3          	sub	a5,a0,a4
   10e9c:	f4f6dee3          	bge	a3,a5,10df8 <_malloc_trim_r+0x78>
   10ea0:	f101a603          	lw	a2,-240(gp) # 23720 <__malloc_sbrk_base>
   10ea4:	0017e793          	ori	a5,a5,1
   10ea8:	40c50533          	sub	a0,a0,a2
   10eac:	00f72223          	sw	a5,4(a4)
   10eb0:	08a1a623          	sw	a0,140(gp) # 2389c <__malloc_current_mallinfo>
   10eb4:	f45ff06f          	j	10df8 <_malloc_trim_r+0x78>

00010eb8 <_free_r>:
   10eb8:	12058663          	beqz	a1,10fe4 <_free_r+0x12c>
   10ebc:	ff010113          	addi	sp,sp,-16
   10ec0:	00812423          	sw	s0,8(sp)
   10ec4:	00912223          	sw	s1,4(sp)
   10ec8:	00058413          	mv	s0,a1
   10ecc:	00050493          	mv	s1,a0
   10ed0:	00112623          	sw	ra,12(sp)
   10ed4:	2dd000ef          	jal	119b0 <__malloc_lock>
   10ed8:	ffc42503          	lw	a0,-4(s0)
   10edc:	ff840713          	addi	a4,s0,-8
   10ee0:	000235b7          	lui	a1,0x23
   10ee4:	ffe57793          	andi	a5,a0,-2
   10ee8:	00f70633          	add	a2,a4,a5
   10eec:	14058593          	addi	a1,a1,320 # 23140 <__malloc_av_>
   10ef0:	00462683          	lw	a3,4(a2)
   10ef4:	0085a803          	lw	a6,8(a1)
   10ef8:	00157893          	andi	a7,a0,1
   10efc:	ffc6f693          	andi	a3,a3,-4
   10f00:	18c80c63          	beq	a6,a2,11098 <_free_r+0x1e0>
   10f04:	00d62223          	sw	a3,4(a2)
   10f08:	00d60833          	add	a6,a2,a3
   10f0c:	00482803          	lw	a6,4(a6)
   10f10:	00187813          	andi	a6,a6,1
   10f14:	08089c63          	bnez	a7,10fac <_free_r+0xf4>
   10f18:	ff842303          	lw	t1,-8(s0)
   10f1c:	00023537          	lui	a0,0x23
   10f20:	14850513          	addi	a0,a0,328 # 23148 <__malloc_av_+0x8>
   10f24:	40670733          	sub	a4,a4,t1
   10f28:	00872883          	lw	a7,8(a4)
   10f2c:	006787b3          	add	a5,a5,t1
   10f30:	12a88e63          	beq	a7,a0,1106c <_free_r+0x1b4>
   10f34:	00c72303          	lw	t1,12(a4)
   10f38:	0068a623          	sw	t1,12(a7)
   10f3c:	01132423          	sw	a7,8(t1)
   10f40:	1a080063          	beqz	a6,110e0 <_free_r+0x228>
   10f44:	0017e693          	ori	a3,a5,1
   10f48:	00d72223          	sw	a3,4(a4)
   10f4c:	00f62023          	sw	a5,0(a2)
   10f50:	1ff00693          	li	a3,511
   10f54:	0af6e463          	bltu	a3,a5,10ffc <_free_r+0x144>
   10f58:	ff87f693          	andi	a3,a5,-8
   10f5c:	00868693          	addi	a3,a3,8
   10f60:	0045a503          	lw	a0,4(a1)
   10f64:	00d586b3          	add	a3,a1,a3
   10f68:	0006a603          	lw	a2,0(a3)
   10f6c:	0057d813          	srli	a6,a5,0x5
   10f70:	00100793          	li	a5,1
   10f74:	010797b3          	sll	a5,a5,a6
   10f78:	00a7e7b3          	or	a5,a5,a0
   10f7c:	ff868513          	addi	a0,a3,-8
   10f80:	00c72423          	sw	a2,8(a4)
   10f84:	00a72623          	sw	a0,12(a4)
   10f88:	00f5a223          	sw	a5,4(a1)
   10f8c:	00e6a023          	sw	a4,0(a3)
   10f90:	00e62623          	sw	a4,12(a2)
   10f94:	00812403          	lw	s0,8(sp)
   10f98:	00c12083          	lw	ra,12(sp)
   10f9c:	00048513          	mv	a0,s1
   10fa0:	00412483          	lw	s1,4(sp)
   10fa4:	01010113          	addi	sp,sp,16
   10fa8:	20d0006f          	j	119b4 <__malloc_unlock>
   10fac:	02081e63          	bnez	a6,10fe8 <_free_r+0x130>
   10fb0:	00023537          	lui	a0,0x23
   10fb4:	00d787b3          	add	a5,a5,a3
   10fb8:	14850513          	addi	a0,a0,328 # 23148 <__malloc_av_+0x8>
   10fbc:	00862683          	lw	a3,8(a2)
   10fc0:	0017e893          	ori	a7,a5,1
   10fc4:	00f70833          	add	a6,a4,a5
   10fc8:	16a68263          	beq	a3,a0,1112c <_free_r+0x274>
   10fcc:	00c62603          	lw	a2,12(a2)
   10fd0:	00c6a623          	sw	a2,12(a3)
   10fd4:	00d62423          	sw	a3,8(a2)
   10fd8:	01172223          	sw	a7,4(a4)
   10fdc:	00f82023          	sw	a5,0(a6)
   10fe0:	f71ff06f          	j	10f50 <_free_r+0x98>
   10fe4:	00008067          	ret
   10fe8:	00156513          	ori	a0,a0,1
   10fec:	fea42e23          	sw	a0,-4(s0)
   10ff0:	00f62023          	sw	a5,0(a2)
   10ff4:	1ff00693          	li	a3,511
   10ff8:	f6f6f0e3          	bgeu	a3,a5,10f58 <_free_r+0xa0>
   10ffc:	0097d693          	srli	a3,a5,0x9
   11000:	00400613          	li	a2,4
   11004:	0ed66263          	bltu	a2,a3,110e8 <_free_r+0x230>
   11008:	0067d693          	srli	a3,a5,0x6
   1100c:	03968513          	addi	a0,a3,57
   11010:	00351513          	slli	a0,a0,0x3
   11014:	03868613          	addi	a2,a3,56
   11018:	00a58533          	add	a0,a1,a0
   1101c:	00052683          	lw	a3,0(a0)
   11020:	ff850513          	addi	a0,a0,-8
   11024:	00d51863          	bne	a0,a3,11034 <_free_r+0x17c>
   11028:	1200006f          	j	11148 <_free_r+0x290>
   1102c:	0086a683          	lw	a3,8(a3)
   11030:	00d50863          	beq	a0,a3,11040 <_free_r+0x188>
   11034:	0046a603          	lw	a2,4(a3)
   11038:	ffc67613          	andi	a2,a2,-4
   1103c:	fec7e8e3          	bltu	a5,a2,1102c <_free_r+0x174>
   11040:	00c6a503          	lw	a0,12(a3)
   11044:	00a72623          	sw	a0,12(a4)
   11048:	00d72423          	sw	a3,8(a4)
   1104c:	00812403          	lw	s0,8(sp)
   11050:	00e52423          	sw	a4,8(a0)
   11054:	00c12083          	lw	ra,12(sp)
   11058:	00048513          	mv	a0,s1
   1105c:	00412483          	lw	s1,4(sp)
   11060:	00e6a623          	sw	a4,12(a3)
   11064:	01010113          	addi	sp,sp,16
   11068:	14d0006f          	j	119b4 <__malloc_unlock>
   1106c:	0a081063          	bnez	a6,1110c <_free_r+0x254>
   11070:	00c62583          	lw	a1,12(a2)
   11074:	00862603          	lw	a2,8(a2)
   11078:	00f686b3          	add	a3,a3,a5
   1107c:	0016e793          	ori	a5,a3,1
   11080:	00b62623          	sw	a1,12(a2)
   11084:	00c5a423          	sw	a2,8(a1)
   11088:	00f72223          	sw	a5,4(a4)
   1108c:	00d70733          	add	a4,a4,a3
   11090:	00d72023          	sw	a3,0(a4)
   11094:	f01ff06f          	j	10f94 <_free_r+0xdc>
   11098:	00d786b3          	add	a3,a5,a3
   1109c:	02089063          	bnez	a7,110bc <_free_r+0x204>
   110a0:	ff842503          	lw	a0,-8(s0)
   110a4:	40a70733          	sub	a4,a4,a0
   110a8:	00c72783          	lw	a5,12(a4)
   110ac:	00872603          	lw	a2,8(a4)
   110b0:	00a686b3          	add	a3,a3,a0
   110b4:	00f62623          	sw	a5,12(a2)
   110b8:	00c7a423          	sw	a2,8(a5)
   110bc:	0016e613          	ori	a2,a3,1
   110c0:	f141a783          	lw	a5,-236(gp) # 23724 <__malloc_trim_threshold>
   110c4:	00c72223          	sw	a2,4(a4)
   110c8:	00e5a423          	sw	a4,8(a1)
   110cc:	ecf6e4e3          	bltu	a3,a5,10f94 <_free_r+0xdc>
   110d0:	f2c1a583          	lw	a1,-212(gp) # 2373c <__malloc_top_pad>
   110d4:	00048513          	mv	a0,s1
   110d8:	ca9ff0ef          	jal	10d80 <_malloc_trim_r>
   110dc:	eb9ff06f          	j	10f94 <_free_r+0xdc>
   110e0:	00d787b3          	add	a5,a5,a3
   110e4:	ed9ff06f          	j	10fbc <_free_r+0x104>
   110e8:	01400613          	li	a2,20
   110ec:	02d67863          	bgeu	a2,a3,1111c <_free_r+0x264>
   110f0:	05400613          	li	a2,84
   110f4:	06d66863          	bltu	a2,a3,11164 <_free_r+0x2ac>
   110f8:	00c7d693          	srli	a3,a5,0xc
   110fc:	06f68513          	addi	a0,a3,111
   11100:	00351513          	slli	a0,a0,0x3
   11104:	06e68613          	addi	a2,a3,110
   11108:	f11ff06f          	j	11018 <_free_r+0x160>
   1110c:	0017e693          	ori	a3,a5,1
   11110:	00d72223          	sw	a3,4(a4)
   11114:	00f62023          	sw	a5,0(a2)
   11118:	e7dff06f          	j	10f94 <_free_r+0xdc>
   1111c:	05c68513          	addi	a0,a3,92
   11120:	00351513          	slli	a0,a0,0x3
   11124:	05b68613          	addi	a2,a3,91
   11128:	ef1ff06f          	j	11018 <_free_r+0x160>
   1112c:	00e5aa23          	sw	a4,20(a1)
   11130:	00e5a823          	sw	a4,16(a1)
   11134:	00a72623          	sw	a0,12(a4)
   11138:	00a72423          	sw	a0,8(a4)
   1113c:	01172223          	sw	a7,4(a4)
   11140:	00f82023          	sw	a5,0(a6)
   11144:	e51ff06f          	j	10f94 <_free_r+0xdc>
   11148:	0045a803          	lw	a6,4(a1)
   1114c:	40265613          	srai	a2,a2,0x2
   11150:	00100793          	li	a5,1
   11154:	00c797b3          	sll	a5,a5,a2
   11158:	0107e7b3          	or	a5,a5,a6
   1115c:	00f5a223          	sw	a5,4(a1)
   11160:	ee5ff06f          	j	11044 <_free_r+0x18c>
   11164:	15400613          	li	a2,340
   11168:	00d66c63          	bltu	a2,a3,11180 <_free_r+0x2c8>
   1116c:	00f7d693          	srli	a3,a5,0xf
   11170:	07868513          	addi	a0,a3,120
   11174:	00351513          	slli	a0,a0,0x3
   11178:	07768613          	addi	a2,a3,119
   1117c:	e9dff06f          	j	11018 <_free_r+0x160>
   11180:	55400613          	li	a2,1364
   11184:	00d66c63          	bltu	a2,a3,1119c <_free_r+0x2e4>
   11188:	0127d693          	srli	a3,a5,0x12
   1118c:	07d68513          	addi	a0,a3,125
   11190:	00351513          	slli	a0,a0,0x3
   11194:	07c68613          	addi	a2,a3,124
   11198:	e81ff06f          	j	11018 <_free_r+0x160>
   1119c:	3f800513          	li	a0,1016
   111a0:	07e00613          	li	a2,126
   111a4:	e75ff06f          	j	11018 <_free_r+0x160>

000111a8 <_malloc_r>:
   111a8:	fd010113          	addi	sp,sp,-48
   111ac:	01312e23          	sw	s3,28(sp)
   111b0:	02112623          	sw	ra,44(sp)
   111b4:	02812423          	sw	s0,40(sp)
   111b8:	02912223          	sw	s1,36(sp)
   111bc:	03212023          	sw	s2,32(sp)
   111c0:	00b58793          	addi	a5,a1,11
   111c4:	01600713          	li	a4,22
   111c8:	00050993          	mv	s3,a0
   111cc:	08f76063          	bltu	a4,a5,1124c <_malloc_r+0xa4>
   111d0:	01000493          	li	s1,16
   111d4:	20b4e463          	bltu	s1,a1,113dc <_malloc_r+0x234>
   111d8:	7d8000ef          	jal	119b0 <__malloc_lock>
   111dc:	01800793          	li	a5,24
   111e0:	00200593          	li	a1,2
   111e4:	00023937          	lui	s2,0x23
   111e8:	14090913          	addi	s2,s2,320 # 23140 <__malloc_av_>
   111ec:	00f907b3          	add	a5,s2,a5
   111f0:	0047a403          	lw	s0,4(a5)
   111f4:	ff878713          	addi	a4,a5,-8
   111f8:	44e40663          	beq	s0,a4,11644 <_malloc_r+0x49c>
   111fc:	00442783          	lw	a5,4(s0)
   11200:	00c42683          	lw	a3,12(s0)
   11204:	00842603          	lw	a2,8(s0)
   11208:	ffc7f793          	andi	a5,a5,-4
   1120c:	00f407b3          	add	a5,s0,a5
   11210:	0047a703          	lw	a4,4(a5)
   11214:	00d62623          	sw	a3,12(a2)
   11218:	00c6a423          	sw	a2,8(a3)
   1121c:	00176713          	ori	a4,a4,1
   11220:	00098513          	mv	a0,s3
   11224:	00e7a223          	sw	a4,4(a5)
   11228:	78c000ef          	jal	119b4 <__malloc_unlock>
   1122c:	02c12083          	lw	ra,44(sp)
   11230:	00840513          	addi	a0,s0,8
   11234:	02812403          	lw	s0,40(sp)
   11238:	02412483          	lw	s1,36(sp)
   1123c:	02012903          	lw	s2,32(sp)
   11240:	01c12983          	lw	s3,28(sp)
   11244:	03010113          	addi	sp,sp,48
   11248:	00008067          	ret
   1124c:	ff87f493          	andi	s1,a5,-8
   11250:	1807c663          	bltz	a5,113dc <_malloc_r+0x234>
   11254:	18b4e463          	bltu	s1,a1,113dc <_malloc_r+0x234>
   11258:	758000ef          	jal	119b0 <__malloc_lock>
   1125c:	1f700793          	li	a5,503
   11260:	4e97fc63          	bgeu	a5,s1,11758 <_malloc_r+0x5b0>
   11264:	0094d793          	srli	a5,s1,0x9
   11268:	18078e63          	beqz	a5,11404 <_malloc_r+0x25c>
   1126c:	00400713          	li	a4,4
   11270:	44f76263          	bltu	a4,a5,116b4 <_malloc_r+0x50c>
   11274:	0064d793          	srli	a5,s1,0x6
   11278:	03978593          	addi	a1,a5,57
   1127c:	03878813          	addi	a6,a5,56
   11280:	00359613          	slli	a2,a1,0x3
   11284:	00023937          	lui	s2,0x23
   11288:	14090913          	addi	s2,s2,320 # 23140 <__malloc_av_>
   1128c:	00c90633          	add	a2,s2,a2
   11290:	00462403          	lw	s0,4(a2)
   11294:	ff860613          	addi	a2,a2,-8
   11298:	02860863          	beq	a2,s0,112c8 <_malloc_r+0x120>
   1129c:	00f00513          	li	a0,15
   112a0:	0140006f          	j	112b4 <_malloc_r+0x10c>
   112a4:	00c42683          	lw	a3,12(s0)
   112a8:	34075c63          	bgez	a4,11600 <_malloc_r+0x458>
   112ac:	00d60e63          	beq	a2,a3,112c8 <_malloc_r+0x120>
   112b0:	00068413          	mv	s0,a3
   112b4:	00442783          	lw	a5,4(s0)
   112b8:	ffc7f793          	andi	a5,a5,-4
   112bc:	40978733          	sub	a4,a5,s1
   112c0:	fee552e3          	bge	a0,a4,112a4 <_malloc_r+0xfc>
   112c4:	00080593          	mv	a1,a6
   112c8:	01092403          	lw	s0,16(s2)
   112cc:	00023837          	lui	a6,0x23
   112d0:	14880813          	addi	a6,a6,328 # 23148 <__malloc_av_+0x8>
   112d4:	2b040663          	beq	s0,a6,11580 <_malloc_r+0x3d8>
   112d8:	00442783          	lw	a5,4(s0)
   112dc:	00f00693          	li	a3,15
   112e0:	ffc7f793          	andi	a5,a5,-4
   112e4:	40978733          	sub	a4,a5,s1
   112e8:	46e6ce63          	blt	a3,a4,11764 <_malloc_r+0x5bc>
   112ec:	01092a23          	sw	a6,20(s2)
   112f0:	01092823          	sw	a6,16(s2)
   112f4:	44075263          	bgez	a4,11738 <_malloc_r+0x590>
   112f8:	1ff00713          	li	a4,511
   112fc:	00492503          	lw	a0,4(s2)
   11300:	34f76a63          	bltu	a4,a5,11654 <_malloc_r+0x4ac>
   11304:	ff87f713          	andi	a4,a5,-8
   11308:	00870713          	addi	a4,a4,8
   1130c:	00e90733          	add	a4,s2,a4
   11310:	00072683          	lw	a3,0(a4)
   11314:	0057d613          	srli	a2,a5,0x5
   11318:	00100793          	li	a5,1
   1131c:	00c797b3          	sll	a5,a5,a2
   11320:	00f56533          	or	a0,a0,a5
   11324:	ff870793          	addi	a5,a4,-8
   11328:	00d42423          	sw	a3,8(s0)
   1132c:	00f42623          	sw	a5,12(s0)
   11330:	00a92223          	sw	a0,4(s2)
   11334:	00872023          	sw	s0,0(a4)
   11338:	0086a623          	sw	s0,12(a3)
   1133c:	4025d793          	srai	a5,a1,0x2
   11340:	00100613          	li	a2,1
   11344:	00f61633          	sll	a2,a2,a5
   11348:	0cc56663          	bltu	a0,a2,11414 <_malloc_r+0x26c>
   1134c:	00a677b3          	and	a5,a2,a0
   11350:	02079463          	bnez	a5,11378 <_malloc_r+0x1d0>
   11354:	00161613          	slli	a2,a2,0x1
   11358:	ffc5f593          	andi	a1,a1,-4
   1135c:	00a677b3          	and	a5,a2,a0
   11360:	00458593          	addi	a1,a1,4
   11364:	00079a63          	bnez	a5,11378 <_malloc_r+0x1d0>
   11368:	00161613          	slli	a2,a2,0x1
   1136c:	00a677b3          	and	a5,a2,a0
   11370:	00458593          	addi	a1,a1,4
   11374:	fe078ae3          	beqz	a5,11368 <_malloc_r+0x1c0>
   11378:	00f00893          	li	a7,15
   1137c:	00359313          	slli	t1,a1,0x3
   11380:	00690333          	add	t1,s2,t1
   11384:	00030513          	mv	a0,t1
   11388:	00c52783          	lw	a5,12(a0)
   1138c:	00058e13          	mv	t3,a1
   11390:	34f50463          	beq	a0,a5,116d8 <_malloc_r+0x530>
   11394:	0047a703          	lw	a4,4(a5)
   11398:	00078413          	mv	s0,a5
   1139c:	00c7a783          	lw	a5,12(a5)
   113a0:	ffc77713          	andi	a4,a4,-4
   113a4:	409706b3          	sub	a3,a4,s1
   113a8:	34d8c463          	blt	a7,a3,116f0 <_malloc_r+0x548>
   113ac:	fe06c2e3          	bltz	a3,11390 <_malloc_r+0x1e8>
   113b0:	00e40733          	add	a4,s0,a4
   113b4:	00472683          	lw	a3,4(a4)
   113b8:	00842603          	lw	a2,8(s0)
   113bc:	00098513          	mv	a0,s3
   113c0:	0016e693          	ori	a3,a3,1
   113c4:	00d72223          	sw	a3,4(a4)
   113c8:	00f62623          	sw	a5,12(a2)
   113cc:	00c7a423          	sw	a2,8(a5)
   113d0:	5e4000ef          	jal	119b4 <__malloc_unlock>
   113d4:	00840513          	addi	a0,s0,8
   113d8:	0100006f          	j	113e8 <_malloc_r+0x240>
   113dc:	00c00793          	li	a5,12
   113e0:	00f9a023          	sw	a5,0(s3)
   113e4:	00000513          	li	a0,0
   113e8:	02c12083          	lw	ra,44(sp)
   113ec:	02812403          	lw	s0,40(sp)
   113f0:	02412483          	lw	s1,36(sp)
   113f4:	02012903          	lw	s2,32(sp)
   113f8:	01c12983          	lw	s3,28(sp)
   113fc:	03010113          	addi	sp,sp,48
   11400:	00008067          	ret
   11404:	20000613          	li	a2,512
   11408:	04000593          	li	a1,64
   1140c:	03f00813          	li	a6,63
   11410:	e75ff06f          	j	11284 <_malloc_r+0xdc>
   11414:	00892403          	lw	s0,8(s2)
   11418:	01612823          	sw	s6,16(sp)
   1141c:	00442783          	lw	a5,4(s0)
   11420:	ffc7fb13          	andi	s6,a5,-4
   11424:	009b6863          	bltu	s6,s1,11434 <_malloc_r+0x28c>
   11428:	409b0733          	sub	a4,s6,s1
   1142c:	00f00793          	li	a5,15
   11430:	18e7c663          	blt	a5,a4,115bc <_malloc_r+0x414>
   11434:	01912223          	sw	s9,4(sp)
   11438:	01512a23          	sw	s5,20(sp)
   1143c:	f101a703          	lw	a4,-240(gp) # 23720 <__malloc_sbrk_base>
   11440:	f2c1aa83          	lw	s5,-212(gp) # 2373c <__malloc_top_pad>
   11444:	01412c23          	sw	s4,24(sp)
   11448:	01712623          	sw	s7,12(sp)
   1144c:	fff00793          	li	a5,-1
   11450:	01548ab3          	add	s5,s1,s5
   11454:	01640a33          	add	s4,s0,s6
   11458:	3cf70c63          	beq	a4,a5,11830 <_malloc_r+0x688>
   1145c:	000017b7          	lui	a5,0x1
   11460:	00f78793          	addi	a5,a5,15 # 100f <exit-0xf0a5>
   11464:	00fa8ab3          	add	s5,s5,a5
   11468:	fffff7b7          	lui	a5,0xfffff
   1146c:	00fafab3          	and	s5,s5,a5
   11470:	000a8593          	mv	a1,s5
   11474:	00098513          	mv	a0,s3
   11478:	590040ef          	jal	15a08 <_sbrk_r>
   1147c:	fff00793          	li	a5,-1
   11480:	00050b93          	mv	s7,a0
   11484:	46f50863          	beq	a0,a5,118f4 <_malloc_r+0x74c>
   11488:	01812423          	sw	s8,8(sp)
   1148c:	0f456e63          	bltu	a0,s4,11588 <_malloc_r+0x3e0>
   11490:	08c18c13          	addi	s8,gp,140 # 2389c <__malloc_current_mallinfo>
   11494:	000c2583          	lw	a1,0(s8)
   11498:	00ba85b3          	add	a1,s5,a1
   1149c:	00bc2023          	sw	a1,0(s8)
   114a0:	00058713          	mv	a4,a1
   114a4:	44aa0e63          	beq	s4,a0,11900 <_malloc_r+0x758>
   114a8:	f101a683          	lw	a3,-240(gp) # 23720 <__malloc_sbrk_base>
   114ac:	fff00793          	li	a5,-1
   114b0:	46f68663          	beq	a3,a5,1191c <_malloc_r+0x774>
   114b4:	414b87b3          	sub	a5,s7,s4
   114b8:	00e787b3          	add	a5,a5,a4
   114bc:	00fc2023          	sw	a5,0(s8)
   114c0:	007bfc93          	andi	s9,s7,7
   114c4:	380c8663          	beqz	s9,11850 <_malloc_r+0x6a8>
   114c8:	419b8bb3          	sub	s7,s7,s9
   114cc:	000015b7          	lui	a1,0x1
   114d0:	008b8b93          	addi	s7,s7,8
   114d4:	00858593          	addi	a1,a1,8 # 1008 <exit-0xf0ac>
   114d8:	015b8ab3          	add	s5,s7,s5
   114dc:	419585b3          	sub	a1,a1,s9
   114e0:	415585b3          	sub	a1,a1,s5
   114e4:	01459593          	slli	a1,a1,0x14
   114e8:	0145da13          	srli	s4,a1,0x14
   114ec:	000a0593          	mv	a1,s4
   114f0:	00098513          	mv	a0,s3
   114f4:	514040ef          	jal	15a08 <_sbrk_r>
   114f8:	fff00793          	li	a5,-1
   114fc:	46f50063          	beq	a0,a5,1195c <_malloc_r+0x7b4>
   11500:	41750533          	sub	a0,a0,s7
   11504:	01450ab3          	add	s5,a0,s4
   11508:	000c2703          	lw	a4,0(s8)
   1150c:	01792423          	sw	s7,8(s2)
   11510:	001ae793          	ori	a5,s5,1
   11514:	00ea05b3          	add	a1,s4,a4
   11518:	00fba223          	sw	a5,4(s7)
   1151c:	00bc2023          	sw	a1,0(s8)
   11520:	03240e63          	beq	s0,s2,1155c <_malloc_r+0x3b4>
   11524:	00f00693          	li	a3,15
   11528:	3566fa63          	bgeu	a3,s6,1187c <_malloc_r+0x6d4>
   1152c:	00442703          	lw	a4,4(s0)
   11530:	ff4b0793          	addi	a5,s6,-12
   11534:	ff87f793          	andi	a5,a5,-8
   11538:	00177713          	andi	a4,a4,1
   1153c:	00f76733          	or	a4,a4,a5
   11540:	00e42223          	sw	a4,4(s0)
   11544:	00500613          	li	a2,5
   11548:	00f40733          	add	a4,s0,a5
   1154c:	00c72223          	sw	a2,4(a4)
   11550:	00c72423          	sw	a2,8(a4)
   11554:	2cf6e263          	bltu	a3,a5,11818 <_malloc_r+0x670>
   11558:	004ba783          	lw	a5,4(s7)
   1155c:	f281a683          	lw	a3,-216(gp) # 23738 <__malloc_max_sbrked_mem>
   11560:	00b6f463          	bgeu	a3,a1,11568 <_malloc_r+0x3c0>
   11564:	f2b1a423          	sw	a1,-216(gp) # 23738 <__malloc_max_sbrked_mem>
   11568:	f241a683          	lw	a3,-220(gp) # 23734 <__malloc_max_total_mem>
   1156c:	00b6f463          	bgeu	a3,a1,11574 <_malloc_r+0x3cc>
   11570:	f2b1a223          	sw	a1,-220(gp) # 23734 <__malloc_max_total_mem>
   11574:	00812c03          	lw	s8,8(sp)
   11578:	000b8413          	mv	s0,s7
   1157c:	01c0006f          	j	11598 <_malloc_r+0x3f0>
   11580:	00492503          	lw	a0,4(s2)
   11584:	db9ff06f          	j	1133c <_malloc_r+0x194>
   11588:	35240c63          	beq	s0,s2,118e0 <_malloc_r+0x738>
   1158c:	00892403          	lw	s0,8(s2)
   11590:	00812c03          	lw	s8,8(sp)
   11594:	00442783          	lw	a5,4(s0)
   11598:	ffc7f793          	andi	a5,a5,-4
   1159c:	40978733          	sub	a4,a5,s1
   115a0:	2e97e463          	bltu	a5,s1,11888 <_malloc_r+0x6e0>
   115a4:	00f00793          	li	a5,15
   115a8:	2ee7d063          	bge	a5,a4,11888 <_malloc_r+0x6e0>
   115ac:	01812a03          	lw	s4,24(sp)
   115b0:	01412a83          	lw	s5,20(sp)
   115b4:	00c12b83          	lw	s7,12(sp)
   115b8:	00412c83          	lw	s9,4(sp)
   115bc:	0014e793          	ori	a5,s1,1
   115c0:	00f42223          	sw	a5,4(s0)
   115c4:	009404b3          	add	s1,s0,s1
   115c8:	00992423          	sw	s1,8(s2)
   115cc:	00176713          	ori	a4,a4,1
   115d0:	00098513          	mv	a0,s3
   115d4:	00e4a223          	sw	a4,4(s1)
   115d8:	3dc000ef          	jal	119b4 <__malloc_unlock>
   115dc:	02c12083          	lw	ra,44(sp)
   115e0:	00840513          	addi	a0,s0,8
   115e4:	02812403          	lw	s0,40(sp)
   115e8:	01012b03          	lw	s6,16(sp)
   115ec:	02412483          	lw	s1,36(sp)
   115f0:	02012903          	lw	s2,32(sp)
   115f4:	01c12983          	lw	s3,28(sp)
   115f8:	03010113          	addi	sp,sp,48
   115fc:	00008067          	ret
   11600:	00842603          	lw	a2,8(s0)
   11604:	00f407b3          	add	a5,s0,a5
   11608:	0047a703          	lw	a4,4(a5) # fffff004 <__BSS_END__+0xfffdb5b0>
   1160c:	00d62623          	sw	a3,12(a2)
   11610:	00c6a423          	sw	a2,8(a3)
   11614:	00176713          	ori	a4,a4,1
   11618:	00098513          	mv	a0,s3
   1161c:	00e7a223          	sw	a4,4(a5)
   11620:	394000ef          	jal	119b4 <__malloc_unlock>
   11624:	02c12083          	lw	ra,44(sp)
   11628:	00840513          	addi	a0,s0,8
   1162c:	02812403          	lw	s0,40(sp)
   11630:	02412483          	lw	s1,36(sp)
   11634:	02012903          	lw	s2,32(sp)
   11638:	01c12983          	lw	s3,28(sp)
   1163c:	03010113          	addi	sp,sp,48
   11640:	00008067          	ret
   11644:	00c7a403          	lw	s0,12(a5)
   11648:	00258593          	addi	a1,a1,2
   1164c:	c6878ee3          	beq	a5,s0,112c8 <_malloc_r+0x120>
   11650:	badff06f          	j	111fc <_malloc_r+0x54>
   11654:	0097d713          	srli	a4,a5,0x9
   11658:	00400693          	li	a3,4
   1165c:	14e6f263          	bgeu	a3,a4,117a0 <_malloc_r+0x5f8>
   11660:	01400693          	li	a3,20
   11664:	24e6e263          	bltu	a3,a4,118a8 <_malloc_r+0x700>
   11668:	05c70613          	addi	a2,a4,92
   1166c:	00361613          	slli	a2,a2,0x3
   11670:	05b70693          	addi	a3,a4,91
   11674:	00c90633          	add	a2,s2,a2
   11678:	00062703          	lw	a4,0(a2)
   1167c:	ff860613          	addi	a2,a2,-8
   11680:	00e61863          	bne	a2,a4,11690 <_malloc_r+0x4e8>
   11684:	1b40006f          	j	11838 <_malloc_r+0x690>
   11688:	00872703          	lw	a4,8(a4)
   1168c:	00e60863          	beq	a2,a4,1169c <_malloc_r+0x4f4>
   11690:	00472683          	lw	a3,4(a4)
   11694:	ffc6f693          	andi	a3,a3,-4
   11698:	fed7e8e3          	bltu	a5,a3,11688 <_malloc_r+0x4e0>
   1169c:	00c72603          	lw	a2,12(a4)
   116a0:	00c42623          	sw	a2,12(s0)
   116a4:	00e42423          	sw	a4,8(s0)
   116a8:	00862423          	sw	s0,8(a2)
   116ac:	00872623          	sw	s0,12(a4)
   116b0:	c8dff06f          	j	1133c <_malloc_r+0x194>
   116b4:	01400713          	li	a4,20
   116b8:	0ef77e63          	bgeu	a4,a5,117b4 <_malloc_r+0x60c>
   116bc:	05400713          	li	a4,84
   116c0:	20f76263          	bltu	a4,a5,118c4 <_malloc_r+0x71c>
   116c4:	00c4d793          	srli	a5,s1,0xc
   116c8:	06f78593          	addi	a1,a5,111
   116cc:	06e78813          	addi	a6,a5,110
   116d0:	00359613          	slli	a2,a1,0x3
   116d4:	bb1ff06f          	j	11284 <_malloc_r+0xdc>
   116d8:	001e0e13          	addi	t3,t3,1
   116dc:	003e7793          	andi	a5,t3,3
   116e0:	00850513          	addi	a0,a0,8
   116e4:	0e078663          	beqz	a5,117d0 <_malloc_r+0x628>
   116e8:	00c52783          	lw	a5,12(a0)
   116ec:	ca5ff06f          	j	11390 <_malloc_r+0x1e8>
   116f0:	00842603          	lw	a2,8(s0)
   116f4:	0014e593          	ori	a1,s1,1
   116f8:	00b42223          	sw	a1,4(s0)
   116fc:	00f62623          	sw	a5,12(a2)
   11700:	00c7a423          	sw	a2,8(a5)
   11704:	009404b3          	add	s1,s0,s1
   11708:	00992a23          	sw	s1,20(s2)
   1170c:	00992823          	sw	s1,16(s2)
   11710:	0016e793          	ori	a5,a3,1
   11714:	00e40733          	add	a4,s0,a4
   11718:	0104a623          	sw	a6,12(s1)
   1171c:	0104a423          	sw	a6,8(s1)
   11720:	00f4a223          	sw	a5,4(s1)
   11724:	00098513          	mv	a0,s3
   11728:	00d72023          	sw	a3,0(a4)
   1172c:	288000ef          	jal	119b4 <__malloc_unlock>
   11730:	00840513          	addi	a0,s0,8
   11734:	cb5ff06f          	j	113e8 <_malloc_r+0x240>
   11738:	00f407b3          	add	a5,s0,a5
   1173c:	0047a703          	lw	a4,4(a5)
   11740:	00098513          	mv	a0,s3
   11744:	00176713          	ori	a4,a4,1
   11748:	00e7a223          	sw	a4,4(a5)
   1174c:	268000ef          	jal	119b4 <__malloc_unlock>
   11750:	00840513          	addi	a0,s0,8
   11754:	c95ff06f          	j	113e8 <_malloc_r+0x240>
   11758:	0034d593          	srli	a1,s1,0x3
   1175c:	00848793          	addi	a5,s1,8
   11760:	a85ff06f          	j	111e4 <_malloc_r+0x3c>
   11764:	0014e693          	ori	a3,s1,1
   11768:	00d42223          	sw	a3,4(s0)
   1176c:	009404b3          	add	s1,s0,s1
   11770:	00992a23          	sw	s1,20(s2)
   11774:	00992823          	sw	s1,16(s2)
   11778:	00176693          	ori	a3,a4,1
   1177c:	00f407b3          	add	a5,s0,a5
   11780:	0104a623          	sw	a6,12(s1)
   11784:	0104a423          	sw	a6,8(s1)
   11788:	00d4a223          	sw	a3,4(s1)
   1178c:	00098513          	mv	a0,s3
   11790:	00e7a023          	sw	a4,0(a5)
   11794:	220000ef          	jal	119b4 <__malloc_unlock>
   11798:	00840513          	addi	a0,s0,8
   1179c:	c4dff06f          	j	113e8 <_malloc_r+0x240>
   117a0:	0067d713          	srli	a4,a5,0x6
   117a4:	03970613          	addi	a2,a4,57
   117a8:	00361613          	slli	a2,a2,0x3
   117ac:	03870693          	addi	a3,a4,56
   117b0:	ec5ff06f          	j	11674 <_malloc_r+0x4cc>
   117b4:	05c78593          	addi	a1,a5,92
   117b8:	05b78813          	addi	a6,a5,91
   117bc:	00359613          	slli	a2,a1,0x3
   117c0:	ac5ff06f          	j	11284 <_malloc_r+0xdc>
   117c4:	00832783          	lw	a5,8(t1)
   117c8:	fff58593          	addi	a1,a1,-1
   117cc:	1c679e63          	bne	a5,t1,119a8 <_malloc_r+0x800>
   117d0:	0035f793          	andi	a5,a1,3
   117d4:	ff830313          	addi	t1,t1,-8
   117d8:	fe0796e3          	bnez	a5,117c4 <_malloc_r+0x61c>
   117dc:	00492703          	lw	a4,4(s2)
   117e0:	fff64793          	not	a5,a2
   117e4:	00e7f7b3          	and	a5,a5,a4
   117e8:	00f92223          	sw	a5,4(s2)
   117ec:	00161613          	slli	a2,a2,0x1
   117f0:	c2c7e2e3          	bltu	a5,a2,11414 <_malloc_r+0x26c>
   117f4:	c20600e3          	beqz	a2,11414 <_malloc_r+0x26c>
   117f8:	00f67733          	and	a4,a2,a5
   117fc:	00071a63          	bnez	a4,11810 <_malloc_r+0x668>
   11800:	00161613          	slli	a2,a2,0x1
   11804:	00f67733          	and	a4,a2,a5
   11808:	004e0e13          	addi	t3,t3,4
   1180c:	fe070ae3          	beqz	a4,11800 <_malloc_r+0x658>
   11810:	000e0593          	mv	a1,t3
   11814:	b69ff06f          	j	1137c <_malloc_r+0x1d4>
   11818:	00840593          	addi	a1,s0,8
   1181c:	00098513          	mv	a0,s3
   11820:	e98ff0ef          	jal	10eb8 <_free_r>
   11824:	000c2583          	lw	a1,0(s8)
   11828:	00892b83          	lw	s7,8(s2)
   1182c:	d2dff06f          	j	11558 <_malloc_r+0x3b0>
   11830:	010a8a93          	addi	s5,s5,16
   11834:	c3dff06f          	j	11470 <_malloc_r+0x2c8>
   11838:	4026d693          	srai	a3,a3,0x2
   1183c:	00100793          	li	a5,1
   11840:	00d797b3          	sll	a5,a5,a3
   11844:	00f56533          	or	a0,a0,a5
   11848:	00a92223          	sw	a0,4(s2)
   1184c:	e55ff06f          	j	116a0 <_malloc_r+0x4f8>
   11850:	015b85b3          	add	a1,s7,s5
   11854:	40b005b3          	neg	a1,a1
   11858:	01459593          	slli	a1,a1,0x14
   1185c:	0145da13          	srli	s4,a1,0x14
   11860:	000a0593          	mv	a1,s4
   11864:	00098513          	mv	a0,s3
   11868:	1a0040ef          	jal	15a08 <_sbrk_r>
   1186c:	fff00793          	li	a5,-1
   11870:	c8f518e3          	bne	a0,a5,11500 <_malloc_r+0x358>
   11874:	00000a13          	li	s4,0
   11878:	c91ff06f          	j	11508 <_malloc_r+0x360>
   1187c:	00812c03          	lw	s8,8(sp)
   11880:	00100793          	li	a5,1
   11884:	00fba223          	sw	a5,4(s7)
   11888:	00098513          	mv	a0,s3
   1188c:	128000ef          	jal	119b4 <__malloc_unlock>
   11890:	01812a03          	lw	s4,24(sp)
   11894:	01412a83          	lw	s5,20(sp)
   11898:	01012b03          	lw	s6,16(sp)
   1189c:	00c12b83          	lw	s7,12(sp)
   118a0:	00412c83          	lw	s9,4(sp)
   118a4:	b41ff06f          	j	113e4 <_malloc_r+0x23c>
   118a8:	05400693          	li	a3,84
   118ac:	06e6ec63          	bltu	a3,a4,11924 <_malloc_r+0x77c>
   118b0:	00c7d713          	srli	a4,a5,0xc
   118b4:	06f70613          	addi	a2,a4,111
   118b8:	00361613          	slli	a2,a2,0x3
   118bc:	06e70693          	addi	a3,a4,110
   118c0:	db5ff06f          	j	11674 <_malloc_r+0x4cc>
   118c4:	15400713          	li	a4,340
   118c8:	06f76c63          	bltu	a4,a5,11940 <_malloc_r+0x798>
   118cc:	00f4d793          	srli	a5,s1,0xf
   118d0:	07878593          	addi	a1,a5,120
   118d4:	07778813          	addi	a6,a5,119
   118d8:	00359613          	slli	a2,a1,0x3
   118dc:	9a9ff06f          	j	11284 <_malloc_r+0xdc>
   118e0:	08c18c13          	addi	s8,gp,140 # 2389c <__malloc_current_mallinfo>
   118e4:	000c2703          	lw	a4,0(s8)
   118e8:	00ea8733          	add	a4,s5,a4
   118ec:	00ec2023          	sw	a4,0(s8)
   118f0:	bb9ff06f          	j	114a8 <_malloc_r+0x300>
   118f4:	00892403          	lw	s0,8(s2)
   118f8:	00442783          	lw	a5,4(s0)
   118fc:	c9dff06f          	j	11598 <_malloc_r+0x3f0>
   11900:	01451793          	slli	a5,a0,0x14
   11904:	ba0792e3          	bnez	a5,114a8 <_malloc_r+0x300>
   11908:	00892b83          	lw	s7,8(s2)
   1190c:	015b07b3          	add	a5,s6,s5
   11910:	0017e793          	ori	a5,a5,1
   11914:	00fba223          	sw	a5,4(s7)
   11918:	c45ff06f          	j	1155c <_malloc_r+0x3b4>
   1191c:	f171a823          	sw	s7,-240(gp) # 23720 <__malloc_sbrk_base>
   11920:	ba1ff06f          	j	114c0 <_malloc_r+0x318>
   11924:	15400693          	li	a3,340
   11928:	04e6e463          	bltu	a3,a4,11970 <_malloc_r+0x7c8>
   1192c:	00f7d713          	srli	a4,a5,0xf
   11930:	07870613          	addi	a2,a4,120
   11934:	00361613          	slli	a2,a2,0x3
   11938:	07770693          	addi	a3,a4,119
   1193c:	d39ff06f          	j	11674 <_malloc_r+0x4cc>
   11940:	55400713          	li	a4,1364
   11944:	04f76463          	bltu	a4,a5,1198c <_malloc_r+0x7e4>
   11948:	0124d793          	srli	a5,s1,0x12
   1194c:	07d78593          	addi	a1,a5,125
   11950:	07c78813          	addi	a6,a5,124
   11954:	00359613          	slli	a2,a1,0x3
   11958:	92dff06f          	j	11284 <_malloc_r+0xdc>
   1195c:	ff8c8c93          	addi	s9,s9,-8
   11960:	019a8ab3          	add	s5,s5,s9
   11964:	417a8ab3          	sub	s5,s5,s7
   11968:	00000a13          	li	s4,0
   1196c:	b9dff06f          	j	11508 <_malloc_r+0x360>
   11970:	55400693          	li	a3,1364
   11974:	02e6e463          	bltu	a3,a4,1199c <_malloc_r+0x7f4>
   11978:	0127d713          	srli	a4,a5,0x12
   1197c:	07d70613          	addi	a2,a4,125
   11980:	00361613          	slli	a2,a2,0x3
   11984:	07c70693          	addi	a3,a4,124
   11988:	cedff06f          	j	11674 <_malloc_r+0x4cc>
   1198c:	3f800613          	li	a2,1016
   11990:	07f00593          	li	a1,127
   11994:	07e00813          	li	a6,126
   11998:	8edff06f          	j	11284 <_malloc_r+0xdc>
   1199c:	3f800613          	li	a2,1016
   119a0:	07e00693          	li	a3,126
   119a4:	cd1ff06f          	j	11674 <_malloc_r+0x4cc>
   119a8:	00492783          	lw	a5,4(s2)
   119ac:	e41ff06f          	j	117ec <_malloc_r+0x644>

000119b0 <__malloc_lock>:
   119b0:	00008067          	ret

000119b4 <__malloc_unlock>:
   119b4:	00008067          	ret

000119b8 <_vfprintf_r>:
   119b8:	e2010113          	addi	sp,sp,-480
   119bc:	1c112e23          	sw	ra,476(sp)
   119c0:	1c812c23          	sw	s0,472(sp)
   119c4:	1d312623          	sw	s3,460(sp)
   119c8:	1d412423          	sw	s4,456(sp)
   119cc:	00058993          	mv	s3,a1
   119d0:	00060a13          	mv	s4,a2
   119d4:	00d12c23          	sw	a3,24(sp)
   119d8:	00050413          	mv	s0,a0
   119dc:	00a12623          	sw	a0,12(sp)
   119e0:	7b5030ef          	jal	15994 <_localeconv_r>
   119e4:	00052703          	lw	a4,0(a0)
   119e8:	00070513          	mv	a0,a4
   119ec:	02e12a23          	sw	a4,52(sp)
   119f0:	320040ef          	jal	15d10 <strlen>
   119f4:	02a12623          	sw	a0,44(sp)
   119f8:	0e012023          	sw	zero,224(sp)
   119fc:	0e012223          	sw	zero,228(sp)
   11a00:	0e012423          	sw	zero,232(sp)
   11a04:	0e012623          	sw	zero,236(sp)
   11a08:	00040863          	beqz	s0,11a18 <_vfprintf_r+0x60>
   11a0c:	03442703          	lw	a4,52(s0)
   11a10:	00071463          	bnez	a4,11a18 <_vfprintf_r+0x60>
   11a14:	6590106f          	j	1386c <_vfprintf_r+0x1eb4>
   11a18:	00c99703          	lh	a4,12(s3)
   11a1c:	0649a683          	lw	a3,100(s3)
   11a20:	000025b7          	lui	a1,0x2
   11a24:	01271613          	slli	a2,a4,0x12
   11a28:	38064263          	bltz	a2,11dac <_vfprintf_r+0x3f4>
   11a2c:	ffffe637          	lui	a2,0xffffe
   11a30:	00b76733          	or	a4,a4,a1
   11a34:	fff60613          	addi	a2,a2,-1 # ffffdfff <__BSS_END__+0xfffda5ab>
   11a38:	00c6f6b3          	and	a3,a3,a2
   11a3c:	00e99623          	sh	a4,12(s3)
   11a40:	01071713          	slli	a4,a4,0x10
   11a44:	41075713          	srai	a4,a4,0x10
   11a48:	06d9a223          	sw	a3,100(s3)
   11a4c:	00877693          	andi	a3,a4,8
   11a50:	2c068663          	beqz	a3,11d1c <_vfprintf_r+0x364>
   11a54:	0109a683          	lw	a3,16(s3)
   11a58:	2c068263          	beqz	a3,11d1c <_vfprintf_r+0x364>
   11a5c:	01a77713          	andi	a4,a4,26
   11a60:	00a00693          	li	a3,10
   11a64:	2cd70c63          	beq	a4,a3,11d3c <_vfprintf_r+0x384>
   11a68:	1c912a23          	sw	s1,468(sp)
   11a6c:	1d212823          	sw	s2,464(sp)
   11a70:	1d512223          	sw	s5,452(sp)
   11a74:	1d612023          	sw	s6,448(sp)
   11a78:	1b712e23          	sw	s7,444(sp)
   11a7c:	1b812c23          	sw	s8,440(sp)
   11a80:	1b912a23          	sw	s9,436(sp)
   11a84:	1ba12823          	sw	s10,432(sp)
   11a88:	1bb12623          	sw	s11,428(sp)
   11a8c:	000a0893          	mv	a7,s4
   11a90:	0008c703          	lbu	a4,0(a7)
   11a94:	0fc10a93          	addi	s5,sp,252
   11a98:	0c012e23          	sw	zero,220(sp)
   11a9c:	0c012c23          	sw	zero,216(sp)
   11aa0:	0d512a23          	sw	s5,212(sp)
   11aa4:	02012023          	sw	zero,32(sp)
   11aa8:	02012e23          	sw	zero,60(sp)
   11aac:	02012823          	sw	zero,48(sp)
   11ab0:	04012823          	sw	zero,80(sp)
   11ab4:	04012023          	sw	zero,64(sp)
   11ab8:	00012a23          	sw	zero,20(sp)
   11abc:	01312823          	sw	s3,16(sp)
   11ac0:	000a8413          	mv	s0,s5
   11ac4:	02500493          	li	s1,37
   11ac8:	01000913          	li	s2,16
   11acc:	22070863          	beqz	a4,11cfc <_vfprintf_r+0x344>
   11ad0:	00088c13          	mv	s8,a7
   11ad4:	2a970063          	beq	a4,s1,11d74 <_vfprintf_r+0x3bc>
   11ad8:	001c4703          	lbu	a4,1(s8)
   11adc:	001c0c13          	addi	s8,s8,1
   11ae0:	fe071ae3          	bnez	a4,11ad4 <_vfprintf_r+0x11c>
   11ae4:	411c0cb3          	sub	s9,s8,a7
   11ae8:	211c0a63          	beq	s8,a7,11cfc <_vfprintf_r+0x344>
   11aec:	0dc12703          	lw	a4,220(sp)
   11af0:	0d812583          	lw	a1,216(sp)
   11af4:	01142023          	sw	a7,0(s0)
   11af8:	01970733          	add	a4,a4,s9
   11afc:	00158593          	addi	a1,a1,1 # 2001 <exit-0xe0b3>
   11b00:	01942223          	sw	s9,4(s0)
   11b04:	0ce12e23          	sw	a4,220(sp)
   11b08:	0cb12c23          	sw	a1,216(sp)
   11b0c:	00700713          	li	a4,7
   11b10:	00840413          	addi	s0,s0,8
   11b14:	26b74863          	blt	a4,a1,11d84 <_vfprintf_r+0x3cc>
   11b18:	01412783          	lw	a5,20(sp)
   11b1c:	000c4703          	lbu	a4,0(s8)
   11b20:	019787b3          	add	a5,a5,s9
   11b24:	00f12a23          	sw	a5,20(sp)
   11b28:	1c070a63          	beqz	a4,11cfc <_vfprintf_r+0x344>
   11b2c:	001c0e13          	addi	t3,s8,1
   11b30:	00000313          	li	t1,0
   11b34:	001c4d83          	lbu	s11,1(s8)
   11b38:	0a010ba3          	sb	zero,183(sp)
   11b3c:	fff00c93          	li	s9,-1
   11b40:	00000b93          	li	s7,0
   11b44:	05a00c13          	li	s8,90
   11b48:	000e0993          	mv	s3,t3
   11b4c:	00030a13          	mv	s4,t1
   11b50:	00088b13          	mv	s6,a7
   11b54:	00198993          	addi	s3,s3,1
   11b58:	fe0d8793          	addi	a5,s11,-32
   11b5c:	04fc6863          	bltu	s8,a5,11bac <_vfprintf_r+0x1f4>
   11b60:	00022737          	lui	a4,0x22
   11b64:	00279793          	slli	a5,a5,0x2
   11b68:	59470713          	addi	a4,a4,1428 # 22594 <__clzsi2+0x1f4>
   11b6c:	00e787b3          	add	a5,a5,a4
   11b70:	0007a783          	lw	a5,0(a5)
   11b74:	00078067          	jr	a5
   11b78:	fd0d8793          	addi	a5,s11,-48
   11b7c:	00000b93          	li	s7,0
   11b80:	00900693          	li	a3,9
   11b84:	002b9713          	slli	a4,s7,0x2
   11b88:	0009cd83          	lbu	s11,0(s3)
   11b8c:	01770bb3          	add	s7,a4,s7
   11b90:	001b9b93          	slli	s7,s7,0x1
   11b94:	01778bb3          	add	s7,a5,s7
   11b98:	fd0d8793          	addi	a5,s11,-48
   11b9c:	00198993          	addi	s3,s3,1
   11ba0:	fef6f2e3          	bgeu	a3,a5,11b84 <_vfprintf_r+0x1cc>
   11ba4:	fe0d8793          	addi	a5,s11,-32
   11ba8:	fafc7ce3          	bgeu	s8,a5,11b60 <_vfprintf_r+0x1a8>
   11bac:	00098e13          	mv	t3,s3
   11bb0:	000a0313          	mv	t1,s4
   11bb4:	140d8463          	beqz	s11,11cfc <_vfprintf_r+0x344>
   11bb8:	00100d13          	li	s10,1
   11bbc:	13b10e23          	sb	s11,316(sp)
   11bc0:	0a010ba3          	sb	zero,183(sp)
   11bc4:	000d0c13          	mv	s8,s10
   11bc8:	00012e23          	sw	zero,28(sp)
   11bcc:	00000c93          	li	s9,0
   11bd0:	02012423          	sw	zero,40(sp)
   11bd4:	02012223          	sw	zero,36(sp)
   11bd8:	00000993          	li	s3,0
   11bdc:	13c10893          	addi	a7,sp,316
   11be0:	0dc12603          	lw	a2,220(sp)
   11be4:	08437f13          	andi	t5,t1,132
   11be8:	00060513          	mv	a0,a2
   11bec:	480f0a63          	beqz	t5,12080 <_vfprintf_r+0x6c8>
   11bf0:	0b714703          	lbu	a4,183(sp)
   11bf4:	06070663          	beqz	a4,11c60 <_vfprintf_r+0x2a8>
   11bf8:	0d812f83          	lw	t6,216(sp)
   11bfc:	00000713          	li	a4,0
   11c00:	00100593          	li	a1,1
   11c04:	00160613          	addi	a2,a2,1
   11c08:	001f8f93          	addi	t6,t6,1
   11c0c:	0b710513          	addi	a0,sp,183
   11c10:	00b42223          	sw	a1,4(s0)
   11c14:	00a42023          	sw	a0,0(s0)
   11c18:	0cc12e23          	sw	a2,220(sp)
   11c1c:	0df12c23          	sw	t6,216(sp)
   11c20:	00700593          	li	a1,7
   11c24:	00840413          	addi	s0,s0,8
   11c28:	2ff5c063          	blt	a1,t6,11f08 <_vfprintf_r+0x550>
   11c2c:	02070a63          	beqz	a4,11c60 <_vfprintf_r+0x2a8>
   11c30:	0d812f83          	lw	t6,216(sp)
   11c34:	00200713          	li	a4,2
   11c38:	00260613          	addi	a2,a2,2
   11c3c:	001f8f93          	addi	t6,t6,1
   11c40:	0b810593          	addi	a1,sp,184
   11c44:	00e42223          	sw	a4,4(s0)
   11c48:	00b42023          	sw	a1,0(s0)
   11c4c:	0cc12e23          	sw	a2,220(sp)
   11c50:	0df12c23          	sw	t6,216(sp)
   11c54:	00700713          	li	a4,7
   11c58:	00840413          	addi	s0,s0,8
   11c5c:	6df744e3          	blt	a4,t6,12b24 <_vfprintf_r+0x116c>
   11c60:	08000713          	li	a4,128
   11c64:	3eef02e3          	beq	t5,a4,12848 <_vfprintf_r+0xe90>
   11c68:	41ac8cb3          	sub	s9,s9,s10
   11c6c:	43904663          	bgtz	s9,12098 <_vfprintf_r+0x6e0>
   11c70:	10037713          	andi	a4,t1,256
   11c74:	52071063          	bnez	a4,12194 <_vfprintf_r+0x7dc>
   11c78:	0d812703          	lw	a4,216(sp)
   11c7c:	01a60633          	add	a2,a2,s10
   11c80:	0cc12e23          	sw	a2,220(sp)
   11c84:	00170713          	addi	a4,a4,1
   11c88:	01142023          	sw	a7,0(s0)
   11c8c:	01a42223          	sw	s10,4(s0)
   11c90:	0ce12c23          	sw	a4,216(sp)
   11c94:	00700793          	li	a5,7
   11c98:	30e7cc63          	blt	a5,a4,11fb0 <_vfprintf_r+0x5f8>
   11c9c:	00840413          	addi	s0,s0,8
   11ca0:	00437313          	andi	t1,t1,4
   11ca4:	00030663          	beqz	t1,11cb0 <_vfprintf_r+0x2f8>
   11ca8:	418b8cb3          	sub	s9,s7,s8
   11cac:	6b904ce3          	bgtz	s9,12b64 <_vfprintf_r+0x11ac>
   11cb0:	000b8893          	mv	a7,s7
   11cb4:	018bd463          	bge	s7,s8,11cbc <_vfprintf_r+0x304>
   11cb8:	000c0893          	mv	a7,s8
   11cbc:	01412783          	lw	a5,20(sp)
   11cc0:	011787b3          	add	a5,a5,a7
   11cc4:	00f12a23          	sw	a5,20(sp)
   11cc8:	48061ce3          	bnez	a2,12960 <_vfprintf_r+0xfa8>
   11ccc:	01c12783          	lw	a5,28(sp)
   11cd0:	0c012c23          	sw	zero,216(sp)
   11cd4:	00078c63          	beqz	a5,11cec <_vfprintf_r+0x334>
   11cd8:	01c12583          	lw	a1,28(sp)
   11cdc:	00c12503          	lw	a0,12(sp)
   11ce0:	03c12223          	sw	t3,36(sp)
   11ce4:	9d4ff0ef          	jal	10eb8 <_free_r>
   11ce8:	02412e03          	lw	t3,36(sp)
   11cec:	000a8413          	mv	s0,s5
   11cf0:	000e0893          	mv	a7,t3
   11cf4:	0008c703          	lbu	a4,0(a7)
   11cf8:	dc071ce3          	bnez	a4,11ad0 <_vfprintf_r+0x118>
   11cfc:	0dc12783          	lw	a5,220(sp)
   11d00:	01012983          	lw	s3,16(sp)
   11d04:	480786e3          	beqz	a5,12990 <_vfprintf_r+0xfd8>
   11d08:	00c12503          	lw	a0,12(sp)
   11d0c:	0d410613          	addi	a2,sp,212
   11d10:	00098593          	mv	a1,s3
   11d14:	7e1020ef          	jal	14cf4 <__sprint_r>
   11d18:	4790006f          	j	12990 <_vfprintf_r+0xfd8>
   11d1c:	00c12503          	lw	a0,12(sp)
   11d20:	00098593          	mv	a1,s3
   11d24:	155030ef          	jal	15678 <__swsetup_r>
   11d28:	08051663          	bnez	a0,11db4 <_vfprintf_r+0x3fc>
   11d2c:	00c99703          	lh	a4,12(s3)
   11d30:	00a00693          	li	a3,10
   11d34:	01a77713          	andi	a4,a4,26
   11d38:	d2d718e3          	bne	a4,a3,11a68 <_vfprintf_r+0xb0>
   11d3c:	00e99703          	lh	a4,14(s3)
   11d40:	d20744e3          	bltz	a4,11a68 <_vfprintf_r+0xb0>
   11d44:	01812683          	lw	a3,24(sp)
   11d48:	00c12503          	lw	a0,12(sp)
   11d4c:	000a0613          	mv	a2,s4
   11d50:	00098593          	mv	a1,s3
   11d54:	6e1020ef          	jal	14c34 <__sbprintf>
   11d58:	00a12a23          	sw	a0,20(sp)
   11d5c:	4650006f          	j	129c0 <_vfprintf_r+0x1008>
   11d60:	0009cd83          	lbu	s11,0(s3)
   11d64:	df1ff06f          	j	11b54 <_vfprintf_r+0x19c>
   11d68:	0009cd83          	lbu	s11,0(s3)
   11d6c:	020a6a13          	ori	s4,s4,32
   11d70:	de5ff06f          	j	11b54 <_vfprintf_r+0x19c>
   11d74:	411c0cb3          	sub	s9,s8,a7
   11d78:	d71c1ae3          	bne	s8,a7,11aec <_vfprintf_r+0x134>
   11d7c:	000c4703          	lbu	a4,0(s8)
   11d80:	da9ff06f          	j	11b28 <_vfprintf_r+0x170>
   11d84:	01012583          	lw	a1,16(sp)
   11d88:	00c12503          	lw	a0,12(sp)
   11d8c:	0d410613          	addi	a2,sp,212
   11d90:	01112e23          	sw	a7,28(sp)
   11d94:	761020ef          	jal	14cf4 <__sprint_r>
   11d98:	00050463          	beqz	a0,11da0 <_vfprintf_r+0x3e8>
   11d9c:	4810206f          	j	14a1c <_vfprintf_r+0x3064>
   11da0:	01c12883          	lw	a7,28(sp)
   11da4:	000a8413          	mv	s0,s5
   11da8:	d71ff06f          	j	11b18 <_vfprintf_r+0x160>
   11dac:	01269613          	slli	a2,a3,0x12
   11db0:	c8065ee3          	bgez	a2,11a4c <_vfprintf_r+0x94>
   11db4:	fff00793          	li	a5,-1
   11db8:	00f12a23          	sw	a5,20(sp)
   11dbc:	4050006f          	j	129c0 <_vfprintf_r+0x1008>
   11dc0:	008a7713          	andi	a4,s4,8
   11dc4:	00098e13          	mv	t3,s3
   11dc8:	000a0313          	mv	t1,s4
   11dcc:	000b0893          	mv	a7,s6
   11dd0:	00070463          	beqz	a4,11dd8 <_vfprintf_r+0x420>
   11dd4:	1fc0106f          	j	12fd0 <_vfprintf_r+0x1618>
   11dd8:	01812783          	lw	a5,24(sp)
   11ddc:	0a010513          	addi	a0,sp,160
   11de0:	03612423          	sw	s6,40(sp)
   11de4:	00778793          	addi	a5,a5,7
   11de8:	ff87f793          	andi	a5,a5,-8
   11dec:	0007a583          	lw	a1,0(a5)
   11df0:	0047a603          	lw	a2,4(a5)
   11df4:	00878793          	addi	a5,a5,8
   11df8:	03412223          	sw	s4,36(sp)
   11dfc:	01312e23          	sw	s3,28(sp)
   11e00:	00f12c23          	sw	a5,24(sp)
   11e04:	2c0100ef          	jal	220c4 <__extenddftf2>
   11e08:	0a012583          	lw	a1,160(sp)
   11e0c:	0a412603          	lw	a2,164(sp)
   11e10:	0a812683          	lw	a3,168(sp)
   11e14:	0ac12703          	lw	a4,172(sp)
   11e18:	02812883          	lw	a7,40(sp)
   11e1c:	02412303          	lw	t1,36(sp)
   11e20:	01c12e03          	lw	t3,28(sp)
   11e24:	0e010513          	addi	a0,sp,224
   11e28:	03112423          	sw	a7,40(sp)
   11e2c:	02612223          	sw	t1,36(sp)
   11e30:	01c12e23          	sw	t3,28(sp)
   11e34:	0ee12623          	sw	a4,236(sp)
   11e38:	0eb12023          	sw	a1,224(sp)
   11e3c:	0ec12223          	sw	a2,228(sp)
   11e40:	0ed12423          	sw	a3,232(sp)
   11e44:	418040ef          	jal	1625c <_ldcheck>
   11e48:	0aa12e23          	sw	a0,188(sp)
   11e4c:	00200713          	li	a4,2
   11e50:	01c12e03          	lw	t3,28(sp)
   11e54:	02412303          	lw	t1,36(sp)
   11e58:	02812883          	lw	a7,40(sp)
   11e5c:	00e51463          	bne	a0,a4,11e64 <_vfprintf_r+0x4ac>
   11e60:	2910106f          	j	138f0 <_vfprintf_r+0x1f38>
   11e64:	00100713          	li	a4,1
   11e68:	00e51463          	bne	a0,a4,11e70 <_vfprintf_r+0x4b8>
   11e6c:	3c50106f          	j	13a30 <_vfprintf_r+0x2078>
   11e70:	06100693          	li	a3,97
   11e74:	00dd9463          	bne	s11,a3,11e7c <_vfprintf_r+0x4c4>
   11e78:	65c0106f          	j	134d4 <_vfprintf_r+0x1b1c>
   11e7c:	04100693          	li	a3,65
   11e80:	05800793          	li	a5,88
   11e84:	00dd9463          	bne	s11,a3,11e8c <_vfprintf_r+0x4d4>
   11e88:	6500106f          	j	134d8 <_vfprintf_r+0x1b20>
   11e8c:	fff00693          	li	a3,-1
   11e90:	00dc9463          	bne	s9,a3,11e98 <_vfprintf_r+0x4e0>
   11e94:	3650206f          	j	149f8 <_vfprintf_r+0x3040>
   11e98:	fdfdf693          	andi	a3,s11,-33
   11e9c:	04700613          	li	a2,71
   11ea0:	00012e23          	sw	zero,28(sp)
   11ea4:	00c69663          	bne	a3,a2,11eb0 <_vfprintf_r+0x4f8>
   11ea8:	000c9463          	bnez	s9,11eb0 <_vfprintf_r+0x4f8>
   11eac:	00070c93          	mv	s9,a4
   11eb0:	0ec12e83          	lw	t4,236(sp)
   11eb4:	10036793          	ori	a5,t1,256
   11eb8:	02012c23          	sw	zero,56(sp)
   11ebc:	0e012283          	lw	t0,224(sp)
   11ec0:	0e412f83          	lw	t6,228(sp)
   11ec4:	0e812f03          	lw	t5,232(sp)
   11ec8:	00078a13          	mv	s4,a5
   11ecc:	000eda63          	bgez	t4,11ee0 <_vfprintf_r+0x528>
   11ed0:	80000737          	lui	a4,0x80000
   11ed4:	02d00793          	li	a5,45
   11ed8:	00eeceb3          	xor	t4,t4,a4
   11edc:	02f12c23          	sw	a5,56(sp)
   11ee0:	fbfd8713          	addi	a4,s11,-65
   11ee4:	02500693          	li	a3,37
   11ee8:	00e6f463          	bgeu	a3,a4,11ef0 <_vfprintf_r+0x538>
   11eec:	6400106f          	j	1352c <_vfprintf_r+0x1b74>
   11ef0:	000226b7          	lui	a3,0x22
   11ef4:	00271713          	slli	a4,a4,0x2
   11ef8:	70068693          	addi	a3,a3,1792 # 22700 <__clzsi2+0x360>
   11efc:	00d70733          	add	a4,a4,a3
   11f00:	00072703          	lw	a4,0(a4) # 80000000 <__BSS_END__+0x7ffdc5ac>
   11f04:	00070067          	jr	a4
   11f08:	01012583          	lw	a1,16(sp)
   11f0c:	00c12503          	lw	a0,12(sp)
   11f10:	0d410613          	addi	a2,sp,212
   11f14:	05112a23          	sw	a7,84(sp)
   11f18:	04612623          	sw	t1,76(sp)
   11f1c:	05e12423          	sw	t5,72(sp)
   11f20:	04e12223          	sw	a4,68(sp)
   11f24:	03c12c23          	sw	t3,56(sp)
   11f28:	5cd020ef          	jal	14cf4 <__sprint_r>
   11f2c:	240518e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   11f30:	0dc12603          	lw	a2,220(sp)
   11f34:	05412883          	lw	a7,84(sp)
   11f38:	04c12303          	lw	t1,76(sp)
   11f3c:	04812f03          	lw	t5,72(sp)
   11f40:	04412703          	lw	a4,68(sp)
   11f44:	03812e03          	lw	t3,56(sp)
   11f48:	000a8413          	mv	s0,s5
   11f4c:	ce1ff06f          	j	11c2c <_vfprintf_r+0x274>
   11f50:	0d812583          	lw	a1,216(sp)
   11f54:	02c12783          	lw	a5,44(sp)
   11f58:	03412703          	lw	a4,52(sp)
   11f5c:	00158593          	addi	a1,a1,1
   11f60:	00c78633          	add	a2,a5,a2
   11f64:	00e42023          	sw	a4,0(s0)
   11f68:	00f42223          	sw	a5,4(s0)
   11f6c:	0cc12e23          	sw	a2,220(sp)
   11f70:	0cb12c23          	sw	a1,216(sp)
   11f74:	00700713          	li	a4,7
   11f78:	00840413          	addi	s0,s0,8
   11f7c:	00b75463          	bge	a4,a1,11f84 <_vfprintf_r+0x5cc>
   11f80:	7d10106f          	j	13f50 <_vfprintf_r+0x2598>
   11f84:	00055463          	bgez	a0,11f8c <_vfprintf_r+0x5d4>
   11f88:	1490206f          	j	148d0 <_vfprintf_r+0x2f18>
   11f8c:	02012783          	lw	a5,32(sp)
   11f90:	00158593          	addi	a1,a1,1
   11f94:	0cb12c23          	sw	a1,216(sp)
   11f98:	00c78633          	add	a2,a5,a2
   11f9c:	00f42223          	sw	a5,4(s0)
   11fa0:	0cc12e23          	sw	a2,220(sp)
   11fa4:	01142023          	sw	a7,0(s0)
   11fa8:	00700793          	li	a5,7
   11fac:	ceb7d8e3          	bge	a5,a1,11c9c <_vfprintf_r+0x2e4>
   11fb0:	01012583          	lw	a1,16(sp)
   11fb4:	00c12503          	lw	a0,12(sp)
   11fb8:	0d410613          	addi	a2,sp,212
   11fbc:	02612423          	sw	t1,40(sp)
   11fc0:	03c12223          	sw	t3,36(sp)
   11fc4:	531020ef          	jal	14cf4 <__sprint_r>
   11fc8:	1a051ae3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   11fcc:	0dc12603          	lw	a2,220(sp)
   11fd0:	02412e03          	lw	t3,36(sp)
   11fd4:	02812303          	lw	t1,40(sp)
   11fd8:	000a8413          	mv	s0,s5
   11fdc:	cc5ff06f          	j	11ca0 <_vfprintf_r+0x2e8>
   11fe0:	01812783          	lw	a5,24(sp)
   11fe4:	0a010ba3          	sb	zero,183(sp)
   11fe8:	00098e13          	mv	t3,s3
   11fec:	0007a883          	lw	a7,0(a5)
   11ff0:	000a0313          	mv	t1,s4
   11ff4:	00478993          	addi	s3,a5,4
   11ff8:	00089463          	bnez	a7,12000 <_vfprintf_r+0x648>
   11ffc:	3bc0106f          	j	133b8 <_vfprintf_r+0x1a00>
   12000:	000cd463          	bgez	s9,12008 <_vfprintf_r+0x650>
   12004:	4700106f          	j	13474 <_vfprintf_r+0x1abc>
   12008:	00088513          	mv	a0,a7
   1200c:	000c8613          	mv	a2,s9
   12010:	00000593          	li	a1,0
   12014:	03c12223          	sw	t3,36(sp)
   12018:	01112c23          	sw	a7,24(sp)
   1201c:	03412423          	sw	s4,40(sp)
   12020:	7fc030ef          	jal	1581c <memchr>
   12024:	00a12e23          	sw	a0,28(sp)
   12028:	0b714703          	lbu	a4,183(sp)
   1202c:	01812883          	lw	a7,24(sp)
   12030:	02412e03          	lw	t3,36(sp)
   12034:	02812303          	lw	t1,40(sp)
   12038:	00051463          	bnez	a0,12040 <_vfprintf_r+0x688>
   1203c:	7440206f          	j	14780 <_vfprintf_r+0x2dc8>
   12040:	41150d33          	sub	s10,a0,a7
   12044:	fffd4693          	not	a3,s10
   12048:	41f6d693          	srai	a3,a3,0x1f
   1204c:	00dd7c33          	and	s8,s10,a3
   12050:	00070463          	beqz	a4,12058 <_vfprintf_r+0x6a0>
   12054:	45c0106f          	j	134b0 <_vfprintf_r+0x1af8>
   12058:	01312c23          	sw	s3,24(sp)
   1205c:	0dc12603          	lw	a2,220(sp)
   12060:	00012e23          	sw	zero,28(sp)
   12064:	02012423          	sw	zero,40(sp)
   12068:	02012223          	sw	zero,36(sp)
   1206c:	08437f13          	andi	t5,t1,132
   12070:	00000c93          	li	s9,0
   12074:	00000993          	li	s3,0
   12078:	00060513          	mv	a0,a2
   1207c:	b60f1ae3          	bnez	t5,11bf0 <_vfprintf_r+0x238>
   12080:	418b8733          	sub	a4,s7,s8
   12084:	58e04ce3          	bgtz	a4,12e1c <_vfprintf_r+0x1464>
   12088:	0b714703          	lbu	a4,183(sp)
   1208c:	b60716e3          	bnez	a4,11bf8 <_vfprintf_r+0x240>
   12090:	41ac8cb3          	sub	s9,s9,s10
   12094:	bd905ee3          	blez	s9,11c70 <_vfprintf_r+0x2b8>
   12098:	00022737          	lui	a4,0x22
   1209c:	0d812583          	lw	a1,216(sp)
   120a0:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   120a4:	09995863          	bge	s2,s9,12134 <_vfprintf_r+0x77c>
   120a8:	00040793          	mv	a5,s0
   120ac:	000c8a13          	mv	s4,s9
   120b0:	00700813          	li	a6,7
   120b4:	000e0b13          	mv	s6,t3
   120b8:	02612c23          	sw	t1,56(sp)
   120bc:	00088c93          	mv	s9,a7
   120c0:	00070413          	mv	s0,a4
   120c4:	00c0006f          	j	120d0 <_vfprintf_r+0x718>
   120c8:	ff0a0a13          	addi	s4,s4,-16
   120cc:	05495863          	bge	s2,s4,1211c <_vfprintf_r+0x764>
   120d0:	01060613          	addi	a2,a2,16
   120d4:	00158593          	addi	a1,a1,1
   120d8:	0087a023          	sw	s0,0(a5)
   120dc:	0127a223          	sw	s2,4(a5)
   120e0:	0cc12e23          	sw	a2,220(sp)
   120e4:	0cb12c23          	sw	a1,216(sp)
   120e8:	00878793          	addi	a5,a5,8
   120ec:	fcb85ee3          	bge	a6,a1,120c8 <_vfprintf_r+0x710>
   120f0:	01012583          	lw	a1,16(sp)
   120f4:	00c12503          	lw	a0,12(sp)
   120f8:	0d410613          	addi	a2,sp,212
   120fc:	3f9020ef          	jal	14cf4 <__sprint_r>
   12100:	06051ee3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12104:	ff0a0a13          	addi	s4,s4,-16
   12108:	0dc12603          	lw	a2,220(sp)
   1210c:	0d812583          	lw	a1,216(sp)
   12110:	000a8793          	mv	a5,s5
   12114:	00700813          	li	a6,7
   12118:	fb494ce3          	blt	s2,s4,120d0 <_vfprintf_r+0x718>
   1211c:	03812303          	lw	t1,56(sp)
   12120:	000c8893          	mv	a7,s9
   12124:	00040713          	mv	a4,s0
   12128:	000b0e13          	mv	t3,s6
   1212c:	000a0c93          	mv	s9,s4
   12130:	00078413          	mv	s0,a5
   12134:	01960633          	add	a2,a2,s9
   12138:	00158593          	addi	a1,a1,1
   1213c:	00e42023          	sw	a4,0(s0)
   12140:	01942223          	sw	s9,4(s0)
   12144:	0cc12e23          	sw	a2,220(sp)
   12148:	0cb12c23          	sw	a1,216(sp)
   1214c:	00700713          	li	a4,7
   12150:	00840413          	addi	s0,s0,8
   12154:	b0b75ee3          	bge	a4,a1,11c70 <_vfprintf_r+0x2b8>
   12158:	01012583          	lw	a1,16(sp)
   1215c:	00c12503          	lw	a0,12(sp)
   12160:	0d410613          	addi	a2,sp,212
   12164:	05112423          	sw	a7,72(sp)
   12168:	04612223          	sw	t1,68(sp)
   1216c:	03c12c23          	sw	t3,56(sp)
   12170:	385020ef          	jal	14cf4 <__sprint_r>
   12174:	000514e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12178:	04412303          	lw	t1,68(sp)
   1217c:	0dc12603          	lw	a2,220(sp)
   12180:	04812883          	lw	a7,72(sp)
   12184:	10037713          	andi	a4,t1,256
   12188:	03812e03          	lw	t3,56(sp)
   1218c:	000a8413          	mv	s0,s5
   12190:	ae0704e3          	beqz	a4,11c78 <_vfprintf_r+0x2c0>
   12194:	06500713          	li	a4,101
   12198:	05b752e3          	bge	a4,s11,129dc <_vfprintf_r+0x1024>
   1219c:	0e412503          	lw	a0,228(sp)
   121a0:	0e812583          	lw	a1,232(sp)
   121a4:	0e012803          	lw	a6,224(sp)
   121a8:	0ec12703          	lw	a4,236(sp)
   121ac:	0aa12223          	sw	a0,164(sp)
   121b0:	0ab12423          	sw	a1,168(sp)
   121b4:	0a010513          	addi	a0,sp,160
   121b8:	09010593          	addi	a1,sp,144
   121bc:	05112623          	sw	a7,76(sp)
   121c0:	04c12423          	sw	a2,72(sp)
   121c4:	04612223          	sw	t1,68(sp)
   121c8:	03c12c23          	sw	t3,56(sp)
   121cc:	08012823          	sw	zero,144(sp)
   121d0:	08012a23          	sw	zero,148(sp)
   121d4:	08012c23          	sw	zero,152(sp)
   121d8:	08012e23          	sw	zero,156(sp)
   121dc:	0b012023          	sw	a6,160(sp)
   121e0:	0ae12623          	sw	a4,172(sp)
   121e4:	1740d0ef          	jal	1f358 <__eqtf2>
   121e8:	03812e03          	lw	t3,56(sp)
   121ec:	04412303          	lw	t1,68(sp)
   121f0:	04812603          	lw	a2,72(sp)
   121f4:	04c12883          	lw	a7,76(sp)
   121f8:	22051ee3          	bnez	a0,12c34 <_vfprintf_r+0x127c>
   121fc:	0d812783          	lw	a5,216(sp)
   12200:	00022737          	lui	a4,0x22
   12204:	47870713          	addi	a4,a4,1144 # 22478 <__clzsi2+0xd8>
   12208:	00160613          	addi	a2,a2,1
   1220c:	00178793          	addi	a5,a5,1
   12210:	00100593          	li	a1,1
   12214:	00e42023          	sw	a4,0(s0)
   12218:	00b42223          	sw	a1,4(s0)
   1221c:	0cc12e23          	sw	a2,220(sp)
   12220:	0cf12c23          	sw	a5,216(sp)
   12224:	00700713          	li	a4,7
   12228:	00840413          	addi	s0,s0,8
   1222c:	00f75463          	bge	a4,a5,12234 <_vfprintf_r+0x87c>
   12230:	6480106f          	j	13878 <_vfprintf_r+0x1ec0>
   12234:	0bc12783          	lw	a5,188(sp)
   12238:	02012703          	lw	a4,32(sp)
   1223c:	56e7d6e3          	bge	a5,a4,12fa8 <_vfprintf_r+0x15f0>
   12240:	02c12703          	lw	a4,44(sp)
   12244:	0d812783          	lw	a5,216(sp)
   12248:	03412683          	lw	a3,52(sp)
   1224c:	00e60633          	add	a2,a2,a4
   12250:	00178793          	addi	a5,a5,1
   12254:	00e42223          	sw	a4,4(s0)
   12258:	00d42023          	sw	a3,0(s0)
   1225c:	0cc12e23          	sw	a2,220(sp)
   12260:	0cf12c23          	sw	a5,216(sp)
   12264:	00700713          	li	a4,7
   12268:	00840413          	addi	s0,s0,8
   1226c:	00f75463          	bge	a4,a5,12274 <_vfprintf_r+0x8bc>
   12270:	1180106f          	j	13388 <_vfprintf_r+0x19d0>
   12274:	02012783          	lw	a5,32(sp)
   12278:	fff78c93          	addi	s9,a5,-1
   1227c:	a39052e3          	blez	s9,11ca0 <_vfprintf_r+0x2e8>
   12280:	00022737          	lui	a4,0x22
   12284:	01000d13          	li	s10,16
   12288:	0d812783          	lw	a5,216(sp)
   1228c:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   12290:	019d4463          	blt	s10,s9,12298 <_vfprintf_r+0x8e0>
   12294:	6340106f          	j	138c8 <_vfprintf_r+0x1f10>
   12298:	00040693          	mv	a3,s0
   1229c:	000c8993          	mv	s3,s9
   122a0:	000d0b13          	mv	s6,s10
   122a4:	000c0c93          	mv	s9,s8
   122a8:	00700d93          	li	s11,7
   122ac:	000e0413          	mv	s0,t3
   122b0:	00030c13          	mv	s8,t1
   122b4:	00070a13          	mv	s4,a4
   122b8:	0100006f          	j	122c8 <_vfprintf_r+0x910>
   122bc:	ff098993          	addi	s3,s3,-16
   122c0:	013b4463          	blt	s6,s3,122c8 <_vfprintf_r+0x910>
   122c4:	5ec0106f          	j	138b0 <_vfprintf_r+0x1ef8>
   122c8:	01060613          	addi	a2,a2,16
   122cc:	00178793          	addi	a5,a5,1
   122d0:	0146a023          	sw	s4,0(a3)
   122d4:	01a6a223          	sw	s10,4(a3)
   122d8:	0cc12e23          	sw	a2,220(sp)
   122dc:	0cf12c23          	sw	a5,216(sp)
   122e0:	00868693          	addi	a3,a3,8
   122e4:	fcfddce3          	bge	s11,a5,122bc <_vfprintf_r+0x904>
   122e8:	01012583          	lw	a1,16(sp)
   122ec:	00c12503          	lw	a0,12(sp)
   122f0:	0d410613          	addi	a2,sp,212
   122f4:	201020ef          	jal	14cf4 <__sprint_r>
   122f8:	68051263          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   122fc:	0dc12603          	lw	a2,220(sp)
   12300:	0d812783          	lw	a5,216(sp)
   12304:	000a8693          	mv	a3,s5
   12308:	fb5ff06f          	j	122bc <_vfprintf_r+0x904>
   1230c:	020a7793          	andi	a5,s4,32
   12310:	00098e13          	mv	t3,s3
   12314:	000a0313          	mv	t1,s4
   12318:	08079a63          	bnez	a5,123ac <_vfprintf_r+0x9f4>
   1231c:	01812783          	lw	a5,24(sp)
   12320:	010a7713          	andi	a4,s4,16
   12324:	0007a803          	lw	a6,0(a5)
   12328:	00478793          	addi	a5,a5,4
   1232c:	4e0716e3          	bnez	a4,13018 <_vfprintf_r+0x1660>
   12330:	040a7713          	andi	a4,s4,64
   12334:	00071463          	bnez	a4,1233c <_vfprintf_r+0x984>
   12338:	6880106f          	j	139c0 <_vfprintf_r+0x2008>
   1233c:	01081d13          	slli	s10,a6,0x10
   12340:	410d5d13          	srai	s10,s10,0x10
   12344:	41fd5713          	srai	a4,s10,0x1f
   12348:	00f12c23          	sw	a5,24(sp)
   1234c:	00070693          	mv	a3,a4
   12350:	0806c063          	bltz	a3,123d0 <_vfprintf_r+0xa18>
   12354:	080cce63          	bltz	s9,123f0 <_vfprintf_r+0xa38>
   12358:	00ed67b3          	or	a5,s10,a4
   1235c:	f7f37313          	andi	t1,t1,-129
   12360:	08079863          	bnez	a5,123f0 <_vfprintf_r+0xa38>
   12364:	000c9463          	bnez	s9,1236c <_vfprintf_r+0x9b4>
   12368:	2810106f          	j	13de8 <_vfprintf_r+0x2430>
   1236c:	03000793          	li	a5,48
   12370:	0940006f          	j	12404 <_vfprintf_r+0xa4c>
   12374:	01812703          	lw	a4,24(sp)
   12378:	00098e13          	mv	t3,s3
   1237c:	000a0313          	mv	t1,s4
   12380:	00072783          	lw	a5,0(a4)
   12384:	00100d13          	li	s10,1
   12388:	0a010ba3          	sb	zero,183(sp)
   1238c:	12f10e23          	sb	a5,316(sp)
   12390:	00470793          	addi	a5,a4,4
   12394:	00f12c23          	sw	a5,24(sp)
   12398:	82dff06f          	j	11bc4 <_vfprintf_r+0x20c>
   1239c:	020a7793          	andi	a5,s4,32
   123a0:	00098e13          	mv	t3,s3
   123a4:	010a6313          	ori	t1,s4,16
   123a8:	460784e3          	beqz	a5,13010 <_vfprintf_r+0x1658>
   123ac:	01812783          	lw	a5,24(sp)
   123b0:	00778793          	addi	a5,a5,7
   123b4:	ff87f793          	andi	a5,a5,-8
   123b8:	0047a683          	lw	a3,4(a5)
   123bc:	00878713          	addi	a4,a5,8
   123c0:	00e12c23          	sw	a4,24(sp)
   123c4:	0007ad03          	lw	s10,0(a5)
   123c8:	00068713          	mv	a4,a3
   123cc:	f806d4e3          	bgez	a3,12354 <_vfprintf_r+0x99c>
   123d0:	02d00693          	li	a3,45
   123d4:	01a037b3          	snez	a5,s10
   123d8:	40e00733          	neg	a4,a4
   123dc:	0ad10ba3          	sb	a3,183(sp)
   123e0:	40f70733          	sub	a4,a4,a5
   123e4:	41a00d33          	neg	s10,s10
   123e8:	000cc463          	bltz	s9,123f0 <_vfprintf_r+0xa38>
   123ec:	f7f37313          	andi	t1,t1,-129
   123f0:	46071ee3          	bnez	a4,1306c <_vfprintf_r+0x16b4>
   123f4:	00900793          	li	a5,9
   123f8:	47a7eae3          	bltu	a5,s10,1306c <_vfprintf_r+0x16b4>
   123fc:	030d0793          	addi	a5,s10,48
   12400:	0ff7f793          	zext.b	a5,a5
   12404:	18f10fa3          	sb	a5,415(sp)
   12408:	000c8c13          	mv	s8,s9
   1240c:	01904463          	bgtz	s9,12414 <_vfprintf_r+0xa5c>
   12410:	00100c13          	li	s8,1
   12414:	0b714703          	lbu	a4,183(sp)
   12418:	00100d13          	li	s10,1
   1241c:	19f10893          	addi	a7,sp,415
   12420:	0c070c63          	beqz	a4,124f8 <_vfprintf_r+0xb40>
   12424:	001c0c13          	addi	s8,s8,1
   12428:	00012e23          	sw	zero,28(sp)
   1242c:	02012423          	sw	zero,40(sp)
   12430:	02012223          	sw	zero,36(sp)
   12434:	00000993          	li	s3,0
   12438:	fa8ff06f          	j	11be0 <_vfprintf_r+0x228>
   1243c:	01812783          	lw	a5,24(sp)
   12440:	0007ab83          	lw	s7,0(a5)
   12444:	00478793          	addi	a5,a5,4
   12448:	360bd8e3          	bgez	s7,12fb8 <_vfprintf_r+0x1600>
   1244c:	41700bb3          	neg	s7,s7
   12450:	00f12c23          	sw	a5,24(sp)
   12454:	0009cd83          	lbu	s11,0(s3)
   12458:	004a6a13          	ori	s4,s4,4
   1245c:	ef8ff06f          	j	11b54 <_vfprintf_r+0x19c>
   12460:	020a7793          	andi	a5,s4,32
   12464:	00098e13          	mv	t3,s3
   12468:	010a6313          	ori	t1,s4,16
   1246c:	04079663          	bnez	a5,124b8 <_vfprintf_r+0xb00>
   12470:	01812783          	lw	a5,24(sp)
   12474:	00478793          	addi	a5,a5,4
   12478:	01812703          	lw	a4,24(sp)
   1247c:	0a010ba3          	sb	zero,183(sp)
   12480:	00072d03          	lw	s10,0(a4)
   12484:	00000713          	li	a4,0
   12488:	3c0ccce3          	bltz	s9,13060 <_vfprintf_r+0x16a8>
   1248c:	f7f37313          	andi	t1,t1,-129
   12490:	3c0d18e3          	bnez	s10,13060 <_vfprintf_r+0x16a8>
   12494:	00f12c23          	sw	a5,24(sp)
   12498:	000c9463          	bnez	s9,124a0 <_vfprintf_r+0xae8>
   1249c:	01c0106f          	j	134b8 <_vfprintf_r+0x1b00>
   124a0:	00000d13          	li	s10,0
   124a4:	f59ff06f          	j	123fc <_vfprintf_r+0xa44>
   124a8:	020a7793          	andi	a5,s4,32
   124ac:	00098e13          	mv	t3,s3
   124b0:	000a0313          	mv	t1,s4
   124b4:	36078ee3          	beqz	a5,13030 <_vfprintf_r+0x1678>
   124b8:	01812783          	lw	a5,24(sp)
   124bc:	0a010ba3          	sb	zero,183(sp)
   124c0:	00778793          	addi	a5,a5,7
   124c4:	ff87f793          	andi	a5,a5,-8
   124c8:	00878713          	addi	a4,a5,8
   124cc:	00e12c23          	sw	a4,24(sp)
   124d0:	0007ad03          	lw	s10,0(a5)
   124d4:	0047a703          	lw	a4,4(a5)
   124d8:	f00ccce3          	bltz	s9,123f0 <_vfprintf_r+0xa38>
   124dc:	00ed67b3          	or	a5,s10,a4
   124e0:	f7f37313          	andi	t1,t1,-129
   124e4:	f00796e3          	bnez	a5,123f0 <_vfprintf_r+0xa38>
   124e8:	fa0c9ce3          	bnez	s9,124a0 <_vfprintf_r+0xae8>
   124ec:	00000d13          	li	s10,0
   124f0:	00000c13          	li	s8,0
   124f4:	1a010893          	addi	a7,sp,416
   124f8:	00012e23          	sw	zero,28(sp)
   124fc:	02012423          	sw	zero,40(sp)
   12500:	02012223          	sw	zero,36(sp)
   12504:	00000993          	li	s3,0
   12508:	ed8ff06f          	j	11be0 <_vfprintf_r+0x228>
   1250c:	0009cd83          	lbu	s11,0(s3)
   12510:	008a6a13          	ori	s4,s4,8
   12514:	e40ff06f          	j	11b54 <_vfprintf_r+0x19c>
   12518:	020a7793          	andi	a5,s4,32
   1251c:	00098e13          	mv	t3,s3
   12520:	010a6e93          	ori	t4,s4,16
   12524:	2c0788e3          	beqz	a5,12ff4 <_vfprintf_r+0x163c>
   12528:	01812783          	lw	a5,24(sp)
   1252c:	00778793          	addi	a5,a5,7
   12530:	ff87f793          	andi	a5,a5,-8
   12534:	00878713          	addi	a4,a5,8
   12538:	00e12c23          	sw	a4,24(sp)
   1253c:	0047a583          	lw	a1,4(a5)
   12540:	0007a703          	lw	a4,0(a5)
   12544:	0a010ba3          	sb	zero,183(sp)
   12548:	bffef313          	andi	t1,t4,-1025
   1254c:	040cc063          	bltz	s9,1258c <_vfprintf_r+0xbd4>
   12550:	00b767b3          	or	a5,a4,a1
   12554:	b7fef313          	andi	t1,t4,-1153
   12558:	02079a63          	bnez	a5,1258c <_vfprintf_r+0xbd4>
   1255c:	020c9863          	bnez	s9,1258c <_vfprintf_r+0xbd4>
   12560:	001efd13          	andi	s10,t4,1
   12564:	740d0ae3          	beqz	s10,134b8 <_vfprintf_r+0x1b00>
   12568:	03000793          	li	a5,48
   1256c:	18f10fa3          	sb	a5,415(sp)
   12570:	000d0c13          	mv	s8,s10
   12574:	19f10893          	addi	a7,sp,415
   12578:	00012e23          	sw	zero,28(sp)
   1257c:	02012423          	sw	zero,40(sp)
   12580:	02012223          	sw	zero,36(sp)
   12584:	00000993          	li	s3,0
   12588:	e58ff06f          	j	11be0 <_vfprintf_r+0x228>
   1258c:	1a010893          	addi	a7,sp,416
   12590:	01d59793          	slli	a5,a1,0x1d
   12594:	00777693          	andi	a3,a4,7
   12598:	00375713          	srli	a4,a4,0x3
   1259c:	00088513          	mv	a0,a7
   125a0:	03068693          	addi	a3,a3,48
   125a4:	00e7e733          	or	a4,a5,a4
   125a8:	0035d593          	srli	a1,a1,0x3
   125ac:	00b767b3          	or	a5,a4,a1
   125b0:	fed88fa3          	sb	a3,-1(a7)
   125b4:	fff88893          	addi	a7,a7,-1
   125b8:	fc079ce3          	bnez	a5,12590 <_vfprintf_r+0xbd8>
   125bc:	00137713          	andi	a4,t1,1
   125c0:	04070063          	beqz	a4,12600 <_vfprintf_r+0xc48>
   125c4:	03000713          	li	a4,48
   125c8:	02e68c63          	beq	a3,a4,12600 <_vfprintf_r+0xc48>
   125cc:	ffe50513          	addi	a0,a0,-2
   125d0:	1a010793          	addi	a5,sp,416
   125d4:	fee88fa3          	sb	a4,-1(a7)
   125d8:	40a78d33          	sub	s10,a5,a0
   125dc:	000c8c13          	mv	s8,s9
   125e0:	01acd463          	bge	s9,s10,125e8 <_vfprintf_r+0xc30>
   125e4:	000d0c13          	mv	s8,s10
   125e8:	00050893          	mv	a7,a0
   125ec:	00012e23          	sw	zero,28(sp)
   125f0:	02012423          	sw	zero,40(sp)
   125f4:	02012223          	sw	zero,36(sp)
   125f8:	00000993          	li	s3,0
   125fc:	de4ff06f          	j	11be0 <_vfprintf_r+0x228>
   12600:	1a010793          	addi	a5,sp,416
   12604:	41178d33          	sub	s10,a5,a7
   12608:	000c8c13          	mv	s8,s9
   1260c:	efacd6e3          	bge	s9,s10,124f8 <_vfprintf_r+0xb40>
   12610:	000d0c13          	mv	s8,s10
   12614:	00012e23          	sw	zero,28(sp)
   12618:	02012423          	sw	zero,40(sp)
   1261c:	02012223          	sw	zero,36(sp)
   12620:	00000993          	li	s3,0
   12624:	dbcff06f          	j	11be0 <_vfprintf_r+0x228>
   12628:	0009cd83          	lbu	s11,0(s3)
   1262c:	06800793          	li	a5,104
   12630:	52fd8ae3          	beq	s11,a5,13364 <_vfprintf_r+0x19ac>
   12634:	040a6a13          	ori	s4,s4,64
   12638:	d1cff06f          	j	11b54 <_vfprintf_r+0x19c>
   1263c:	01812683          	lw	a3,24(sp)
   12640:	020a7793          	andi	a5,s4,32
   12644:	00098e13          	mv	t3,s3
   12648:	00468713          	addi	a4,a3,4
   1264c:	300792e3          	bnez	a5,13150 <_vfprintf_r+0x1798>
   12650:	010a7793          	andi	a5,s4,16
   12654:	00078463          	beqz	a5,1265c <_vfprintf_r+0xca4>
   12658:	3100106f          	j	13968 <_vfprintf_r+0x1fb0>
   1265c:	040a7793          	andi	a5,s4,64
   12660:	00078463          	beqz	a5,12668 <_vfprintf_r+0xcb0>
   12664:	0510106f          	j	13eb4 <_vfprintf_r+0x24fc>
   12668:	200a7313          	andi	t1,s4,512
   1266c:	00031463          	bnez	t1,12674 <_vfprintf_r+0xcbc>
   12670:	2f80106f          	j	13968 <_vfprintf_r+0x1fb0>
   12674:	01812783          	lw	a5,24(sp)
   12678:	01412683          	lw	a3,20(sp)
   1267c:	00e12c23          	sw	a4,24(sp)
   12680:	0007a783          	lw	a5,0(a5)
   12684:	00d78023          	sb	a3,0(a5)
   12688:	000e0893          	mv	a7,t3
   1268c:	e68ff06f          	j	11cf4 <_vfprintf_r+0x33c>
   12690:	0009cd83          	lbu	s11,0(s3)
   12694:	06c00793          	li	a5,108
   12698:	4afd8ee3          	beq	s11,a5,13354 <_vfprintf_r+0x199c>
   1269c:	010a6a13          	ori	s4,s4,16
   126a0:	cb4ff06f          	j	11b54 <_vfprintf_r+0x19c>
   126a4:	01812703          	lw	a4,24(sp)
   126a8:	000087b7          	lui	a5,0x8
   126ac:	83078793          	addi	a5,a5,-2000 # 7830 <exit-0x8884>
   126b0:	0af11c23          	sh	a5,184(sp)
   126b4:	0a010ba3          	sb	zero,183(sp)
   126b8:	00072683          	lw	a3,0(a4)
   126bc:	00098e13          	mv	t3,s3
   126c0:	00470793          	addi	a5,a4,4
   126c4:	00000613          	li	a2,0
   126c8:	2a0cc6e3          	bltz	s9,13174 <_vfprintf_r+0x17bc>
   126cc:	f7fa7713          	andi	a4,s4,-129
   126d0:	00276713          	ori	a4,a4,2
   126d4:	00068463          	beqz	a3,126dc <_vfprintf_r+0xd24>
   126d8:	2a80106f          	j	13980 <_vfprintf_r+0x1fc8>
   126dc:	000c9463          	bnez	s9,126e4 <_vfprintf_r+0xd2c>
   126e0:	7600106f          	j	13e40 <_vfprintf_r+0x2488>
   126e4:	03000693          	li	a3,48
   126e8:	00f12c23          	sw	a5,24(sp)
   126ec:	00070313          	mv	t1,a4
   126f0:	18d10fa3          	sb	a3,415(sp)
   126f4:	000c8c13          	mv	s8,s9
   126f8:	00012e23          	sw	zero,28(sp)
   126fc:	00100d13          	li	s10,1
   12700:	02012423          	sw	zero,40(sp)
   12704:	02012223          	sw	zero,36(sp)
   12708:	00000993          	li	s3,0
   1270c:	07800d93          	li	s11,120
   12710:	19f10893          	addi	a7,sp,415
   12714:	00000813          	li	a6,0
   12718:	2f90006f          	j	13210 <_vfprintf_r+0x1858>
   1271c:	020a7793          	andi	a5,s4,32
   12720:	00098e13          	mv	t3,s3
   12724:	240794e3          	bnez	a5,1316c <_vfprintf_r+0x17b4>
   12728:	01812783          	lw	a5,24(sp)
   1272c:	010a7693          	andi	a3,s4,16
   12730:	0007a703          	lw	a4,0(a5)
   12734:	00478793          	addi	a5,a5,4
   12738:	00068463          	beqz	a3,12740 <_vfprintf_r+0xd88>
   1273c:	1600206f          	j	1489c <_vfprintf_r+0x2ee4>
   12740:	040a7693          	andi	a3,s4,64
   12744:	00069463          	bnez	a3,1274c <_vfprintf_r+0xd94>
   12748:	2cc0106f          	j	13a14 <_vfprintf_r+0x205c>
   1274c:	01071713          	slli	a4,a4,0x10
   12750:	01075713          	srli	a4,a4,0x10
   12754:	00f12c23          	sw	a5,24(sp)
   12758:	000a0e93          	mv	t4,s4
   1275c:	00000593          	li	a1,0
   12760:	de5ff06f          	j	12544 <_vfprintf_r+0xb8c>
   12764:	00c12d03          	lw	s10,12(sp)
   12768:	000d0513          	mv	a0,s10
   1276c:	228030ef          	jal	15994 <_localeconv_r>
   12770:	00452783          	lw	a5,4(a0)
   12774:	00078513          	mv	a0,a5
   12778:	04f12023          	sw	a5,64(sp)
   1277c:	594030ef          	jal	15d10 <strlen>
   12780:	00050793          	mv	a5,a0
   12784:	000d0513          	mv	a0,s10
   12788:	04f12823          	sw	a5,80(sp)
   1278c:	00078d13          	mv	s10,a5
   12790:	204030ef          	jal	15994 <_localeconv_r>
   12794:	00852703          	lw	a4,8(a0)
   12798:	0009cd83          	lbu	s11,0(s3)
   1279c:	02e12823          	sw	a4,48(sp)
   127a0:	ba0d0a63          	beqz	s10,11b54 <_vfprintf_r+0x19c>
   127a4:	ba070863          	beqz	a4,11b54 <_vfprintf_r+0x19c>
   127a8:	00074783          	lbu	a5,0(a4)
   127ac:	ba078463          	beqz	a5,11b54 <_vfprintf_r+0x19c>
   127b0:	400a6a13          	ori	s4,s4,1024
   127b4:	ba0ff06f          	j	11b54 <_vfprintf_r+0x19c>
   127b8:	0009cd83          	lbu	s11,0(s3)
   127bc:	001a6a13          	ori	s4,s4,1
   127c0:	b94ff06f          	j	11b54 <_vfprintf_r+0x19c>
   127c4:	0b714783          	lbu	a5,183(sp)
   127c8:	0009cd83          	lbu	s11,0(s3)
   127cc:	b8079463          	bnez	a5,11b54 <_vfprintf_r+0x19c>
   127d0:	02000793          	li	a5,32
   127d4:	0af10ba3          	sb	a5,183(sp)
   127d8:	b7cff06f          	j	11b54 <_vfprintf_r+0x19c>
   127dc:	0009cd83          	lbu	s11,0(s3)
   127e0:	080a6a13          	ori	s4,s4,128
   127e4:	b70ff06f          	j	11b54 <_vfprintf_r+0x19c>
   127e8:	02b00793          	li	a5,43
   127ec:	0009cd83          	lbu	s11,0(s3)
   127f0:	0af10ba3          	sb	a5,183(sp)
   127f4:	b60ff06f          	j	11b54 <_vfprintf_r+0x19c>
   127f8:	0009cd83          	lbu	s11,0(s3)
   127fc:	02a00793          	li	a5,42
   12800:	00198693          	addi	a3,s3,1
   12804:	00fd9463          	bne	s11,a5,1280c <_vfprintf_r+0xe54>
   12808:	3380206f          	j	14b40 <_vfprintf_r+0x3188>
   1280c:	00900613          	li	a2,9
   12810:	fd0d8793          	addi	a5,s11,-48
   12814:	00000c93          	li	s9,0
   12818:	02f66463          	bltu	a2,a5,12840 <_vfprintf_r+0xe88>
   1281c:	002c9713          	slli	a4,s9,0x2
   12820:	0006cd83          	lbu	s11,0(a3)
   12824:	01970cb3          	add	s9,a4,s9
   12828:	001c9c93          	slli	s9,s9,0x1
   1282c:	00fc8cb3          	add	s9,s9,a5
   12830:	fd0d8793          	addi	a5,s11,-48
   12834:	00168693          	addi	a3,a3,1
   12838:	fef672e3          	bgeu	a2,a5,1281c <_vfprintf_r+0xe64>
   1283c:	260ccce3          	bltz	s9,132b4 <_vfprintf_r+0x18fc>
   12840:	00068993          	mv	s3,a3
   12844:	b14ff06f          	j	11b58 <_vfprintf_r+0x1a0>
   12848:	418b8833          	sub	a6,s7,s8
   1284c:	c1005e63          	blez	a6,11c68 <_vfprintf_r+0x2b0>
   12850:	00022737          	lui	a4,0x22
   12854:	01000f13          	li	t5,16
   12858:	0d812583          	lw	a1,216(sp)
   1285c:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   12860:	0b0f5263          	bge	t5,a6,12904 <_vfprintf_r+0xf4c>
   12864:	00040793          	mv	a5,s0
   12868:	03312c23          	sw	s3,56(sp)
   1286c:	000f0293          	mv	t0,t5
   12870:	00700f93          	li	t6,7
   12874:	000e0a13          	mv	s4,t3
   12878:	00080413          	mv	s0,a6
   1287c:	00030b13          	mv	s6,t1
   12880:	05112223          	sw	a7,68(sp)
   12884:	00070993          	mv	s3,a4
   12888:	00c0006f          	j	12894 <_vfprintf_r+0xedc>
   1288c:	ff040413          	addi	s0,s0,-16
   12890:	0482dc63          	bge	t0,s0,128e8 <_vfprintf_r+0xf30>
   12894:	01060613          	addi	a2,a2,16
   12898:	00158593          	addi	a1,a1,1
   1289c:	0137a023          	sw	s3,0(a5)
   128a0:	01e7a223          	sw	t5,4(a5)
   128a4:	0cc12e23          	sw	a2,220(sp)
   128a8:	0cb12c23          	sw	a1,216(sp)
   128ac:	00878793          	addi	a5,a5,8
   128b0:	fcbfdee3          	bge	t6,a1,1288c <_vfprintf_r+0xed4>
   128b4:	01012583          	lw	a1,16(sp)
   128b8:	00c12503          	lw	a0,12(sp)
   128bc:	0d410613          	addi	a2,sp,212
   128c0:	434020ef          	jal	14cf4 <__sprint_r>
   128c4:	0a051c63          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   128c8:	01000293          	li	t0,16
   128cc:	ff040413          	addi	s0,s0,-16
   128d0:	0dc12603          	lw	a2,220(sp)
   128d4:	0d812583          	lw	a1,216(sp)
   128d8:	000a8793          	mv	a5,s5
   128dc:	00700f93          	li	t6,7
   128e0:	00028f13          	mv	t5,t0
   128e4:	fa82c8e3          	blt	t0,s0,12894 <_vfprintf_r+0xedc>
   128e8:	00098713          	mv	a4,s3
   128ec:	04412883          	lw	a7,68(sp)
   128f0:	03812983          	lw	s3,56(sp)
   128f4:	00040813          	mv	a6,s0
   128f8:	000a0e13          	mv	t3,s4
   128fc:	00078413          	mv	s0,a5
   12900:	000b0313          	mv	t1,s6
   12904:	01060633          	add	a2,a2,a6
   12908:	00158593          	addi	a1,a1,1
   1290c:	00e42023          	sw	a4,0(s0)
   12910:	01042223          	sw	a6,4(s0)
   12914:	0cc12e23          	sw	a2,220(sp)
   12918:	0cb12c23          	sw	a1,216(sp)
   1291c:	00700713          	li	a4,7
   12920:	00840413          	addi	s0,s0,8
   12924:	b4b75263          	bge	a4,a1,11c68 <_vfprintf_r+0x2b0>
   12928:	01012583          	lw	a1,16(sp)
   1292c:	00c12503          	lw	a0,12(sp)
   12930:	0d410613          	addi	a2,sp,212
   12934:	05112423          	sw	a7,72(sp)
   12938:	04612223          	sw	t1,68(sp)
   1293c:	03c12c23          	sw	t3,56(sp)
   12940:	3b4020ef          	jal	14cf4 <__sprint_r>
   12944:	02051c63          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12948:	0dc12603          	lw	a2,220(sp)
   1294c:	03812e03          	lw	t3,56(sp)
   12950:	04412303          	lw	t1,68(sp)
   12954:	04812883          	lw	a7,72(sp)
   12958:	000a8413          	mv	s0,s5
   1295c:	b0cff06f          	j	11c68 <_vfprintf_r+0x2b0>
   12960:	01012583          	lw	a1,16(sp)
   12964:	00c12503          	lw	a0,12(sp)
   12968:	0d410613          	addi	a2,sp,212
   1296c:	03c12223          	sw	t3,36(sp)
   12970:	384020ef          	jal	14cf4 <__sprint_r>
   12974:	02412e03          	lw	t3,36(sp)
   12978:	b4050a63          	beqz	a0,11ccc <_vfprintf_r+0x314>
   1297c:	01012983          	lw	s3,16(sp)
   12980:	01c12583          	lw	a1,28(sp)
   12984:	00058663          	beqz	a1,12990 <_vfprintf_r+0xfd8>
   12988:	00c12503          	lw	a0,12(sp)
   1298c:	d2cfe0ef          	jal	10eb8 <_free_r>
   12990:	00c9d783          	lhu	a5,12(s3)
   12994:	1d412483          	lw	s1,468(sp)
   12998:	1d012903          	lw	s2,464(sp)
   1299c:	0407f793          	andi	a5,a5,64
   129a0:	1c412a83          	lw	s5,452(sp)
   129a4:	1c012b03          	lw	s6,448(sp)
   129a8:	1bc12b83          	lw	s7,444(sp)
   129ac:	1b812c03          	lw	s8,440(sp)
   129b0:	1b412c83          	lw	s9,436(sp)
   129b4:	1b012d03          	lw	s10,432(sp)
   129b8:	1ac12d83          	lw	s11,428(sp)
   129bc:	be079c63          	bnez	a5,11db4 <_vfprintf_r+0x3fc>
   129c0:	1dc12083          	lw	ra,476(sp)
   129c4:	1d812403          	lw	s0,472(sp)
   129c8:	01412503          	lw	a0,20(sp)
   129cc:	1cc12983          	lw	s3,460(sp)
   129d0:	1c812a03          	lw	s4,456(sp)
   129d4:	1e010113          	addi	sp,sp,480
   129d8:	00008067          	ret
   129dc:	0d812d03          	lw	s10,216(sp)
   129e0:	02012783          	lw	a5,32(sp)
   129e4:	00100713          	li	a4,1
   129e8:	00e60cb3          	add	s9,a2,a4
   129ec:	00ed0d33          	add	s10,s10,a4
   129f0:	00840d93          	addi	s11,s0,8
   129f4:	3cf75a63          	bge	a4,a5,12dc8 <_vfprintf_r+0x1410>
   129f8:	00100713          	li	a4,1
   129fc:	00e42223          	sw	a4,4(s0)
   12a00:	01142023          	sw	a7,0(s0)
   12a04:	0d912e23          	sw	s9,220(sp)
   12a08:	0da12c23          	sw	s10,216(sp)
   12a0c:	00700713          	li	a4,7
   12a10:	4da748e3          	blt	a4,s10,136e0 <_vfprintf_r+0x1d28>
   12a14:	02c12783          	lw	a5,44(sp)
   12a18:	03412703          	lw	a4,52(sp)
   12a1c:	001d0d13          	addi	s10,s10,1
   12a20:	00fc8cb3          	add	s9,s9,a5
   12a24:	00eda023          	sw	a4,0(s11)
   12a28:	00fda223          	sw	a5,4(s11)
   12a2c:	0d912e23          	sw	s9,220(sp)
   12a30:	0da12c23          	sw	s10,216(sp)
   12a34:	00700713          	li	a4,7
   12a38:	008d8d93          	addi	s11,s11,8
   12a3c:	4fa740e3          	blt	a4,s10,1371c <_vfprintf_r+0x1d64>
   12a40:	0e012503          	lw	a0,224(sp)
   12a44:	0e412583          	lw	a1,228(sp)
   12a48:	0e812603          	lw	a2,232(sp)
   12a4c:	0ec12703          	lw	a4,236(sp)
   12a50:	02012783          	lw	a5,32(sp)
   12a54:	0aa12023          	sw	a0,160(sp)
   12a58:	0ab12223          	sw	a1,164(sp)
   12a5c:	0a010513          	addi	a0,sp,160
   12a60:	09010593          	addi	a1,sp,144
   12a64:	02612423          	sw	t1,40(sp)
   12a68:	03c12223          	sw	t3,36(sp)
   12a6c:	03112c23          	sw	a7,56(sp)
   12a70:	08012823          	sw	zero,144(sp)
   12a74:	08012a23          	sw	zero,148(sp)
   12a78:	08012c23          	sw	zero,152(sp)
   12a7c:	08012e23          	sw	zero,156(sp)
   12a80:	0ac12423          	sw	a2,168(sp)
   12a84:	0ae12623          	sw	a4,172(sp)
   12a88:	fff78413          	addi	s0,a5,-1
   12a8c:	0cd0c0ef          	jal	1f358 <__eqtf2>
   12a90:	02412e03          	lw	t3,36(sp)
   12a94:	02812303          	lw	t1,40(sp)
   12a98:	46050e63          	beqz	a0,12f14 <_vfprintf_r+0x155c>
   12a9c:	03812883          	lw	a7,56(sp)
   12aa0:	001d0d13          	addi	s10,s10,1
   12aa4:	008c8cb3          	add	s9,s9,s0
   12aa8:	00188793          	addi	a5,a7,1
   12aac:	0da12c23          	sw	s10,216(sp)
   12ab0:	0d912e23          	sw	s9,220(sp)
   12ab4:	00fda023          	sw	a5,0(s11)
   12ab8:	008da223          	sw	s0,4(s11)
   12abc:	00700793          	li	a5,7
   12ac0:	7da7c063          	blt	a5,s10,13280 <_vfprintf_r+0x18c8>
   12ac4:	008d8d93          	addi	s11,s11,8
   12ac8:	03c12683          	lw	a3,60(sp)
   12acc:	0c410713          	addi	a4,sp,196
   12ad0:	001d0793          	addi	a5,s10,1
   12ad4:	01968633          	add	a2,a3,s9
   12ad8:	00eda023          	sw	a4,0(s11)
   12adc:	0cc12e23          	sw	a2,220(sp)
   12ae0:	0cf12c23          	sw	a5,216(sp)
   12ae4:	00dda223          	sw	a3,4(s11)
   12ae8:	00700713          	li	a4,7
   12aec:	008d8413          	addi	s0,s11,8
   12af0:	9af75863          	bge	a4,a5,11ca0 <_vfprintf_r+0x2e8>
   12af4:	01012583          	lw	a1,16(sp)
   12af8:	00c12503          	lw	a0,12(sp)
   12afc:	0d410613          	addi	a2,sp,212
   12b00:	02612423          	sw	t1,40(sp)
   12b04:	03c12223          	sw	t3,36(sp)
   12b08:	1ec020ef          	jal	14cf4 <__sprint_r>
   12b0c:	e60518e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12b10:	0dc12603          	lw	a2,220(sp)
   12b14:	02812303          	lw	t1,40(sp)
   12b18:	02412e03          	lw	t3,36(sp)
   12b1c:	000a8413          	mv	s0,s5
   12b20:	980ff06f          	j	11ca0 <_vfprintf_r+0x2e8>
   12b24:	01012583          	lw	a1,16(sp)
   12b28:	00c12503          	lw	a0,12(sp)
   12b2c:	0d410613          	addi	a2,sp,212
   12b30:	05112623          	sw	a7,76(sp)
   12b34:	04612423          	sw	t1,72(sp)
   12b38:	05e12223          	sw	t5,68(sp)
   12b3c:	03c12c23          	sw	t3,56(sp)
   12b40:	1b4020ef          	jal	14cf4 <__sprint_r>
   12b44:	e2051ce3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12b48:	0dc12603          	lw	a2,220(sp)
   12b4c:	04c12883          	lw	a7,76(sp)
   12b50:	04812303          	lw	t1,72(sp)
   12b54:	04412f03          	lw	t5,68(sp)
   12b58:	03812e03          	lw	t3,56(sp)
   12b5c:	000a8413          	mv	s0,s5
   12b60:	900ff06f          	j	11c60 <_vfprintf_r+0x2a8>
   12b64:	00022837          	lui	a6,0x22
   12b68:	01000993          	li	s3,16
   12b6c:	0d812783          	lw	a5,216(sp)
   12b70:	7a880813          	addi	a6,a6,1960 # 227a8 <blanks.1>
   12b74:	0799de63          	bge	s3,s9,12bf0 <_vfprintf_r+0x1238>
   12b78:	00040713          	mv	a4,s0
   12b7c:	01012b03          	lw	s6,16(sp)
   12b80:	00098d93          	mv	s11,s3
   12b84:	00700d13          	li	s10,7
   12b88:	000e0413          	mv	s0,t3
   12b8c:	00080a13          	mv	s4,a6
   12b90:	00c0006f          	j	12b9c <_vfprintf_r+0x11e4>
   12b94:	ff0c8c93          	addi	s9,s9,-16
   12b98:	059dd663          	bge	s11,s9,12be4 <_vfprintf_r+0x122c>
   12b9c:	01060613          	addi	a2,a2,16
   12ba0:	00178793          	addi	a5,a5,1
   12ba4:	01472023          	sw	s4,0(a4)
   12ba8:	01372223          	sw	s3,4(a4)
   12bac:	0cc12e23          	sw	a2,220(sp)
   12bb0:	0cf12c23          	sw	a5,216(sp)
   12bb4:	00870713          	addi	a4,a4,8
   12bb8:	fcfd5ee3          	bge	s10,a5,12b94 <_vfprintf_r+0x11dc>
   12bbc:	00c12503          	lw	a0,12(sp)
   12bc0:	0d410613          	addi	a2,sp,212
   12bc4:	000b0593          	mv	a1,s6
   12bc8:	12c020ef          	jal	14cf4 <__sprint_r>
   12bcc:	4c051ee3          	bnez	a0,138a8 <_vfprintf_r+0x1ef0>
   12bd0:	ff0c8c93          	addi	s9,s9,-16
   12bd4:	0dc12603          	lw	a2,220(sp)
   12bd8:	0d812783          	lw	a5,216(sp)
   12bdc:	000a8713          	mv	a4,s5
   12be0:	fb9dcee3          	blt	s11,s9,12b9c <_vfprintf_r+0x11e4>
   12be4:	00040e13          	mv	t3,s0
   12be8:	000a0813          	mv	a6,s4
   12bec:	00070413          	mv	s0,a4
   12bf0:	01960633          	add	a2,a2,s9
   12bf4:	00178793          	addi	a5,a5,1
   12bf8:	0cc12e23          	sw	a2,220(sp)
   12bfc:	0cf12c23          	sw	a5,216(sp)
   12c00:	01042023          	sw	a6,0(s0)
   12c04:	01942223          	sw	s9,4(s0)
   12c08:	00700713          	li	a4,7
   12c0c:	8af75263          	bge	a4,a5,11cb0 <_vfprintf_r+0x2f8>
   12c10:	01012583          	lw	a1,16(sp)
   12c14:	00c12503          	lw	a0,12(sp)
   12c18:	0d410613          	addi	a2,sp,212
   12c1c:	03c12223          	sw	t3,36(sp)
   12c20:	0d4020ef          	jal	14cf4 <__sprint_r>
   12c24:	d4051ce3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12c28:	0dc12603          	lw	a2,220(sp)
   12c2c:	02412e03          	lw	t3,36(sp)
   12c30:	880ff06f          	j	11cb0 <_vfprintf_r+0x2f8>
   12c34:	0bc12503          	lw	a0,188(sp)
   12c38:	34a056e3          	blez	a0,13784 <_vfprintf_r+0x1dcc>
   12c3c:	02012783          	lw	a5,32(sp)
   12c40:	00098c93          	mv	s9,s3
   12c44:	5f37cc63          	blt	a5,s3,1323c <_vfprintf_r+0x1884>
   12c48:	03905863          	blez	s9,12c78 <_vfprintf_r+0x12c0>
   12c4c:	0d812703          	lw	a4,216(sp)
   12c50:	01960633          	add	a2,a2,s9
   12c54:	01142023          	sw	a7,0(s0)
   12c58:	00170713          	addi	a4,a4,1
   12c5c:	01942223          	sw	s9,4(s0)
   12c60:	0cc12e23          	sw	a2,220(sp)
   12c64:	0ce12c23          	sw	a4,216(sp)
   12c68:	00700593          	li	a1,7
   12c6c:	00840413          	addi	s0,s0,8
   12c70:	00e5d463          	bge	a1,a4,12c78 <_vfprintf_r+0x12c0>
   12c74:	1880106f          	j	13dfc <_vfprintf_r+0x2444>
   12c78:	fffcc713          	not	a4,s9
   12c7c:	41f75713          	srai	a4,a4,0x1f
   12c80:	00ecfcb3          	and	s9,s9,a4
   12c84:	41998cb3          	sub	s9,s3,s9
   12c88:	77904263          	bgtz	s9,133ec <_vfprintf_r+0x1a34>
   12c8c:	40037713          	andi	a4,t1,1024
   12c90:	01388db3          	add	s11,a7,s3
   12c94:	6e0710e3          	bnez	a4,13b74 <_vfprintf_r+0x21bc>
   12c98:	0bc12c83          	lw	s9,188(sp)
   12c9c:	02012783          	lw	a5,32(sp)
   12ca0:	00fcc863          	blt	s9,a5,12cb0 <_vfprintf_r+0x12f8>
   12ca4:	00137713          	andi	a4,t1,1
   12ca8:	00071463          	bnez	a4,12cb0 <_vfprintf_r+0x12f8>
   12cac:	1e00106f          	j	13e8c <_vfprintf_r+0x24d4>
   12cb0:	0d812703          	lw	a4,216(sp)
   12cb4:	02c12783          	lw	a5,44(sp)
   12cb8:	03412683          	lw	a3,52(sp)
   12cbc:	00170713          	addi	a4,a4,1
   12cc0:	00f60633          	add	a2,a2,a5
   12cc4:	00d42023          	sw	a3,0(s0)
   12cc8:	00f42223          	sw	a5,4(s0)
   12ccc:	0cc12e23          	sw	a2,220(sp)
   12cd0:	0ce12c23          	sw	a4,216(sp)
   12cd4:	00700593          	li	a1,7
   12cd8:	00840413          	addi	s0,s0,8
   12cdc:	00e5d463          	bge	a1,a4,12ce4 <_vfprintf_r+0x132c>
   12ce0:	2350106f          	j	14714 <_vfprintf_r+0x2d5c>
   12ce4:	02012703          	lw	a4,32(sp)
   12ce8:	00e887b3          	add	a5,a7,a4
   12cec:	41b78d33          	sub	s10,a5,s11
   12cf0:	41970cb3          	sub	s9,a4,s9
   12cf4:	01acd463          	bge	s9,s10,12cfc <_vfprintf_r+0x1344>
   12cf8:	000c8d13          	mv	s10,s9
   12cfc:	03a05863          	blez	s10,12d2c <_vfprintf_r+0x1374>
   12d00:	0d812783          	lw	a5,216(sp)
   12d04:	01a60633          	add	a2,a2,s10
   12d08:	01b42023          	sw	s11,0(s0)
   12d0c:	00178793          	addi	a5,a5,1
   12d10:	01a42223          	sw	s10,4(s0)
   12d14:	0cc12e23          	sw	a2,220(sp)
   12d18:	0cf12c23          	sw	a5,216(sp)
   12d1c:	00700713          	li	a4,7
   12d20:	00840413          	addi	s0,s0,8
   12d24:	00f75463          	bge	a4,a5,12d2c <_vfprintf_r+0x1374>
   12d28:	27d0106f          	j	147a4 <_vfprintf_r+0x2dec>
   12d2c:	fffd4793          	not	a5,s10
   12d30:	41f7d793          	srai	a5,a5,0x1f
   12d34:	00fd7d33          	and	s10,s10,a5
   12d38:	41ac8cb3          	sub	s9,s9,s10
   12d3c:	01904463          	bgtz	s9,12d44 <_vfprintf_r+0x138c>
   12d40:	f61fe06f          	j	11ca0 <_vfprintf_r+0x2e8>
   12d44:	00022737          	lui	a4,0x22
   12d48:	01000d13          	li	s10,16
   12d4c:	0d812783          	lw	a5,216(sp)
   12d50:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   12d54:	379d5ae3          	bge	s10,s9,138c8 <_vfprintf_r+0x1f10>
   12d58:	00040693          	mv	a3,s0
   12d5c:	000c8993          	mv	s3,s9
   12d60:	000d0b13          	mv	s6,s10
   12d64:	000c0c93          	mv	s9,s8
   12d68:	00700d93          	li	s11,7
   12d6c:	000e0413          	mv	s0,t3
   12d70:	00030c13          	mv	s8,t1
   12d74:	00070a13          	mv	s4,a4
   12d78:	00c0006f          	j	12d84 <_vfprintf_r+0x13cc>
   12d7c:	ff098993          	addi	s3,s3,-16
   12d80:	333b58e3          	bge	s6,s3,138b0 <_vfprintf_r+0x1ef8>
   12d84:	01060613          	addi	a2,a2,16
   12d88:	00178793          	addi	a5,a5,1
   12d8c:	0146a023          	sw	s4,0(a3)
   12d90:	01a6a223          	sw	s10,4(a3)
   12d94:	0cc12e23          	sw	a2,220(sp)
   12d98:	0cf12c23          	sw	a5,216(sp)
   12d9c:	00868693          	addi	a3,a3,8
   12da0:	fcfddee3          	bge	s11,a5,12d7c <_vfprintf_r+0x13c4>
   12da4:	01012583          	lw	a1,16(sp)
   12da8:	00c12503          	lw	a0,12(sp)
   12dac:	0d410613          	addi	a2,sp,212
   12db0:	745010ef          	jal	14cf4 <__sprint_r>
   12db4:	bc0514e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12db8:	0dc12603          	lw	a2,220(sp)
   12dbc:	0d812783          	lw	a5,216(sp)
   12dc0:	000a8693          	mv	a3,s5
   12dc4:	fb9ff06f          	j	12d7c <_vfprintf_r+0x13c4>
   12dc8:	00e37633          	and	a2,t1,a4
   12dcc:	c20616e3          	bnez	a2,129f8 <_vfprintf_r+0x1040>
   12dd0:	01142023          	sw	a7,0(s0)
   12dd4:	00e42223          	sw	a4,4(s0)
   12dd8:	0d912e23          	sw	s9,220(sp)
   12ddc:	0da12c23          	sw	s10,216(sp)
   12de0:	00700793          	li	a5,7
   12de4:	cfa7d2e3          	bge	a5,s10,12ac8 <_vfprintf_r+0x1110>
   12de8:	01012583          	lw	a1,16(sp)
   12dec:	00c12503          	lw	a0,12(sp)
   12df0:	0d410613          	addi	a2,sp,212
   12df4:	02612423          	sw	t1,40(sp)
   12df8:	03c12223          	sw	t3,36(sp)
   12dfc:	6f9010ef          	jal	14cf4 <__sprint_r>
   12e00:	b6051ee3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12e04:	0dc12c83          	lw	s9,220(sp)
   12e08:	0d812d03          	lw	s10,216(sp)
   12e0c:	02812303          	lw	t1,40(sp)
   12e10:	02412e03          	lw	t3,36(sp)
   12e14:	000a8d93          	mv	s11,s5
   12e18:	cb1ff06f          	j	12ac8 <_vfprintf_r+0x1110>
   12e1c:	0d812583          	lw	a1,216(sp)
   12e20:	00022837          	lui	a6,0x22
   12e24:	01000f93          	li	t6,16
   12e28:	7a880813          	addi	a6,a6,1960 # 227a8 <blanks.1>
   12e2c:	0aefd663          	bge	t6,a4,12ed8 <_vfprintf_r+0x1520>
   12e30:	00040793          	mv	a5,s0
   12e34:	05312223          	sw	s3,68(sp)
   12e38:	000f8393          	mv	t2,t6
   12e3c:	00700293          	li	t0,7
   12e40:	03c12c23          	sw	t3,56(sp)
   12e44:	00070413          	mv	s0,a4
   12e48:	000f0a13          	mv	s4,t5
   12e4c:	00030b13          	mv	s6,t1
   12e50:	05112423          	sw	a7,72(sp)
   12e54:	00080993          	mv	s3,a6
   12e58:	00c0006f          	j	12e64 <_vfprintf_r+0x14ac>
   12e5c:	ff040413          	addi	s0,s0,-16
   12e60:	0483dc63          	bge	t2,s0,12eb8 <_vfprintf_r+0x1500>
   12e64:	01050513          	addi	a0,a0,16
   12e68:	00158593          	addi	a1,a1,1
   12e6c:	0137a023          	sw	s3,0(a5)
   12e70:	01f7a223          	sw	t6,4(a5)
   12e74:	0ca12e23          	sw	a0,220(sp)
   12e78:	0cb12c23          	sw	a1,216(sp)
   12e7c:	00878793          	addi	a5,a5,8
   12e80:	fcb2dee3          	bge	t0,a1,12e5c <_vfprintf_r+0x14a4>
   12e84:	01012583          	lw	a1,16(sp)
   12e88:	00c12503          	lw	a0,12(sp)
   12e8c:	0d410613          	addi	a2,sp,212
   12e90:	665010ef          	jal	14cf4 <__sprint_r>
   12e94:	ae0514e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12e98:	01000393          	li	t2,16
   12e9c:	ff040413          	addi	s0,s0,-16
   12ea0:	0dc12503          	lw	a0,220(sp)
   12ea4:	0d812583          	lw	a1,216(sp)
   12ea8:	000a8793          	mv	a5,s5
   12eac:	00700293          	li	t0,7
   12eb0:	00038f93          	mv	t6,t2
   12eb4:	fa83c8e3          	blt	t2,s0,12e64 <_vfprintf_r+0x14ac>
   12eb8:	00098813          	mv	a6,s3
   12ebc:	03812e03          	lw	t3,56(sp)
   12ec0:	04812883          	lw	a7,72(sp)
   12ec4:	04412983          	lw	s3,68(sp)
   12ec8:	00040713          	mv	a4,s0
   12ecc:	000a0f13          	mv	t5,s4
   12ed0:	00078413          	mv	s0,a5
   12ed4:	000b0313          	mv	t1,s6
   12ed8:	00a70633          	add	a2,a4,a0
   12edc:	00158f93          	addi	t6,a1,1
   12ee0:	00e42223          	sw	a4,4(s0)
   12ee4:	0cc12e23          	sw	a2,220(sp)
   12ee8:	0df12c23          	sw	t6,216(sp)
   12eec:	01042023          	sw	a6,0(s0)
   12ef0:	00700713          	li	a4,7
   12ef4:	11f74ae3          	blt	a4,t6,13808 <_vfprintf_r+0x1e50>
   12ef8:	0b714703          	lbu	a4,183(sp)
   12efc:	00840413          	addi	s0,s0,8
   12f00:	0c071263          	bnez	a4,12fc4 <_vfprintf_r+0x160c>
   12f04:	000f1463          	bnez	t5,12f0c <_vfprintf_r+0x1554>
   12f08:	d61fe06f          	j	11c68 <_vfprintf_r+0x2b0>
   12f0c:	00000f13          	li	t5,0
   12f10:	d25fe06f          	j	11c34 <_vfprintf_r+0x27c>
   12f14:	02012703          	lw	a4,32(sp)
   12f18:	00100793          	li	a5,1
   12f1c:	bae7d6e3          	bge	a5,a4,12ac8 <_vfprintf_r+0x1110>
   12f20:	01100793          	li	a5,17
   12f24:	00e7c463          	blt	a5,a4,12f2c <_vfprintf_r+0x1574>
   12f28:	40d0106f          	j	14b34 <_vfprintf_r+0x317c>
   12f2c:	00022737          	lui	a4,0x22
   12f30:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   12f34:	000c8693          	mv	a3,s9
   12f38:	00040993          	mv	s3,s0
   12f3c:	000c0c93          	mv	s9,s8
   12f40:	01000793          	li	a5,16
   12f44:	00700b13          	li	s6,7
   12f48:	000e0413          	mv	s0,t3
   12f4c:	00030c13          	mv	s8,t1
   12f50:	00070a13          	mv	s4,a4
   12f54:	00c0006f          	j	12f60 <_vfprintf_r+0x15a8>
   12f58:	ff098993          	addi	s3,s3,-16
   12f5c:	2f37d663          	bge	a5,s3,13248 <_vfprintf_r+0x1890>
   12f60:	01068693          	addi	a3,a3,16
   12f64:	001d0d13          	addi	s10,s10,1
   12f68:	014da023          	sw	s4,0(s11)
   12f6c:	00fda223          	sw	a5,4(s11)
   12f70:	0cd12e23          	sw	a3,220(sp)
   12f74:	0da12c23          	sw	s10,216(sp)
   12f78:	008d8d93          	addi	s11,s11,8
   12f7c:	fdab5ee3          	bge	s6,s10,12f58 <_vfprintf_r+0x15a0>
   12f80:	01012583          	lw	a1,16(sp)
   12f84:	00c12503          	lw	a0,12(sp)
   12f88:	0d410613          	addi	a2,sp,212
   12f8c:	569010ef          	jal	14cf4 <__sprint_r>
   12f90:	9e0516e3          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   12f94:	0dc12683          	lw	a3,220(sp)
   12f98:	0d812d03          	lw	s10,216(sp)
   12f9c:	000a8d93          	mv	s11,s5
   12fa0:	01000793          	li	a5,16
   12fa4:	fb5ff06f          	j	12f58 <_vfprintf_r+0x15a0>
   12fa8:	00137793          	andi	a5,t1,1
   12fac:	00079463          	bnez	a5,12fb4 <_vfprintf_r+0x15fc>
   12fb0:	cf1fe06f          	j	11ca0 <_vfprintf_r+0x2e8>
   12fb4:	a8cff06f          	j	12240 <_vfprintf_r+0x888>
   12fb8:	0009cd83          	lbu	s11,0(s3)
   12fbc:	00f12c23          	sw	a5,24(sp)
   12fc0:	b95fe06f          	j	11b54 <_vfprintf_r+0x19c>
   12fc4:	000f0713          	mv	a4,t5
   12fc8:	00000f13          	li	t5,0
   12fcc:	c35fe06f          	j	11c00 <_vfprintf_r+0x248>
   12fd0:	01812783          	lw	a5,24(sp)
   12fd4:	0007a703          	lw	a4,0(a5)
   12fd8:	00478793          	addi	a5,a5,4
   12fdc:	00f12c23          	sw	a5,24(sp)
   12fe0:	00072583          	lw	a1,0(a4)
   12fe4:	00472603          	lw	a2,4(a4)
   12fe8:	00872683          	lw	a3,8(a4)
   12fec:	00c72703          	lw	a4,12(a4)
   12ff0:	e35fe06f          	j	11e24 <_vfprintf_r+0x46c>
   12ff4:	01812783          	lw	a5,24(sp)
   12ff8:	00478793          	addi	a5,a5,4
   12ffc:	01812703          	lw	a4,24(sp)
   13000:	00000593          	li	a1,0
   13004:	00f12c23          	sw	a5,24(sp)
   13008:	00072703          	lw	a4,0(a4)
   1300c:	d38ff06f          	j	12544 <_vfprintf_r+0xb8c>
   13010:	01812783          	lw	a5,24(sp)
   13014:	00478793          	addi	a5,a5,4
   13018:	01812703          	lw	a4,24(sp)
   1301c:	00f12c23          	sw	a5,24(sp)
   13020:	00072d03          	lw	s10,0(a4)
   13024:	41fd5713          	srai	a4,s10,0x1f
   13028:	00070693          	mv	a3,a4
   1302c:	b24ff06f          	j	12350 <_vfprintf_r+0x998>
   13030:	01812783          	lw	a5,24(sp)
   13034:	010a7713          	andi	a4,s4,16
   13038:	0007a683          	lw	a3,0(a5)
   1303c:	00478793          	addi	a5,a5,4
   13040:	c2071c63          	bnez	a4,12478 <_vfprintf_r+0xac0>
   13044:	040a7713          	andi	a4,s4,64
   13048:	18070ce3          	beqz	a4,139e0 <_vfprintf_r+0x2028>
   1304c:	01069d13          	slli	s10,a3,0x10
   13050:	0a010ba3          	sb	zero,183(sp)
   13054:	010d5d13          	srli	s10,s10,0x10
   13058:	00000713          	li	a4,0
   1305c:	c20cd863          	bgez	s9,1248c <_vfprintf_r+0xad4>
   13060:	00f12c23          	sw	a5,24(sp)
   13064:	00900793          	li	a5,9
   13068:	b9a7fa63          	bgeu	a5,s10,123fc <_vfprintf_r+0xa44>
   1306c:	1a010c13          	addi	s8,sp,416
   13070:	00000793          	li	a5,0
   13074:	03712223          	sw	s7,36(sp)
   13078:	02812423          	sw	s0,40(sp)
   1307c:	40037993          	andi	s3,t1,1024
   13080:	000c0413          	mv	s0,s8
   13084:	03c12023          	sw	t3,32(sp)
   13088:	000d0c13          	mv	s8,s10
   1308c:	02612c23          	sw	t1,56(sp)
   13090:	000c8d13          	mv	s10,s9
   13094:	00078b93          	mv	s7,a5
   13098:	00070c93          	mv	s9,a4
   1309c:	0340006f          	j	130d0 <_vfprintf_r+0x1718>
   130a0:	000c0513          	mv	a0,s8
   130a4:	000c8593          	mv	a1,s9
   130a8:	00a00613          	li	a2,10
   130ac:	00000693          	li	a3,0
   130b0:	01812e23          	sw	s8,28(sp)
   130b4:	000c8b13          	mv	s6,s9
   130b8:	720090ef          	jal	1c7d8 <__udivdi3>
   130bc:	000a0413          	mv	s0,s4
   130c0:	00050c13          	mv	s8,a0
   130c4:	00058c93          	mv	s9,a1
   130c8:	000b1463          	bnez	s6,130d0 <_vfprintf_r+0x1718>
   130cc:	5600106f          	j	1462c <_vfprintf_r+0x2c74>
   130d0:	00a00613          	li	a2,10
   130d4:	00000693          	li	a3,0
   130d8:	000c0513          	mv	a0,s8
   130dc:	000c8593          	mv	a1,s9
   130e0:	4c1090ef          	jal	1cda0 <__umoddi3>
   130e4:	03050513          	addi	a0,a0,48
   130e8:	fea40fa3          	sb	a0,-1(s0)
   130ec:	fff40a13          	addi	s4,s0,-1
   130f0:	001b8b93          	addi	s7,s7,1
   130f4:	fa0986e3          	beqz	s3,130a0 <_vfprintf_r+0x16e8>
   130f8:	03012783          	lw	a5,48(sp)
   130fc:	0007c783          	lbu	a5,0(a5)
   13100:	fb7790e3          	bne	a5,s7,130a0 <_vfprintf_r+0x16e8>
   13104:	0ff00793          	li	a5,255
   13108:	f8fb8ce3          	beq	s7,a5,130a0 <_vfprintf_r+0x16e8>
   1310c:	200c92e3          	bnez	s9,13b10 <_vfprintf_r+0x2158>
   13110:	00900793          	li	a5,9
   13114:	1f87eee3          	bltu	a5,s8,13b10 <_vfprintf_r+0x2158>
   13118:	1a010793          	addi	a5,sp,416
   1311c:	000d0c93          	mv	s9,s10
   13120:	02012e03          	lw	t3,32(sp)
   13124:	41478d33          	sub	s10,a5,s4
   13128:	03712023          	sw	s7,32(sp)
   1312c:	02812403          	lw	s0,40(sp)
   13130:	03812303          	lw	t1,56(sp)
   13134:	02412b83          	lw	s7,36(sp)
   13138:	000a0893          	mv	a7,s4
   1313c:	000c8c13          	mv	s8,s9
   13140:	01acd463          	bge	s9,s10,13148 <_vfprintf_r+0x1790>
   13144:	000d0c13          	mv	s8,s10
   13148:	0b714703          	lbu	a4,183(sp)
   1314c:	ad4ff06f          	j	12420 <_vfprintf_r+0xa68>
   13150:	01412603          	lw	a2,20(sp)
   13154:	0006a783          	lw	a5,0(a3)
   13158:	00e12c23          	sw	a4,24(sp)
   1315c:	41f65693          	srai	a3,a2,0x1f
   13160:	00c7a023          	sw	a2,0(a5)
   13164:	00d7a223          	sw	a3,4(a5)
   13168:	d20ff06f          	j	12688 <_vfprintf_r+0xcd0>
   1316c:	000a0e93          	mv	t4,s4
   13170:	bb8ff06f          	j	12528 <_vfprintf_r+0xb70>
   13174:	00022537          	lui	a0,0x22
   13178:	00f6f613          	andi	a2,a3,15
   1317c:	44850713          	addi	a4,a0,1096 # 22448 <__clzsi2+0xa8>
   13180:	00c70733          	add	a4,a4,a2
   13184:	00074703          	lbu	a4,0(a4)
   13188:	0046d693          	srli	a3,a3,0x4
   1318c:	002a6313          	ori	t1,s4,2
   13190:	18e10fa3          	sb	a4,415(sp)
   13194:	00000613          	li	a2,0
   13198:	00069463          	bnez	a3,131a0 <_vfprintf_r+0x17e8>
   1319c:	2290106f          	j	14bc4 <_vfprintf_r+0x320c>
   131a0:	00f12c23          	sw	a5,24(sp)
   131a4:	44850513          	addi	a0,a0,1096
   131a8:	07800d93          	li	s11,120
   131ac:	00200593          	li	a1,2
   131b0:	19f10893          	addi	a7,sp,415
   131b4:	00f6f793          	andi	a5,a3,15
   131b8:	00f507b3          	add	a5,a0,a5
   131bc:	0007c783          	lbu	a5,0(a5)
   131c0:	01c61713          	slli	a4,a2,0x1c
   131c4:	0046d693          	srli	a3,a3,0x4
   131c8:	00d766b3          	or	a3,a4,a3
   131cc:	00465613          	srli	a2,a2,0x4
   131d0:	fef88fa3          	sb	a5,-1(a7)
   131d4:	00c6e7b3          	or	a5,a3,a2
   131d8:	fff88893          	addi	a7,a7,-1
   131dc:	fc079ce3          	bnez	a5,131b4 <_vfprintf_r+0x17fc>
   131e0:	1a010793          	addi	a5,sp,416
   131e4:	41178d33          	sub	s10,a5,a7
   131e8:	000c8c13          	mv	s8,s9
   131ec:	01acd463          	bge	s9,s10,131f4 <_vfprintf_r+0x183c>
   131f0:	000d0c13          	mv	s8,s10
   131f4:	00012e23          	sw	zero,28(sp)
   131f8:	02012423          	sw	zero,40(sp)
   131fc:	02012223          	sw	zero,36(sp)
   13200:	00000993          	li	s3,0
   13204:	00000813          	li	a6,0
   13208:	00059463          	bnez	a1,13210 <_vfprintf_r+0x1858>
   1320c:	9d5fe06f          	j	11be0 <_vfprintf_r+0x228>
   13210:	0dc12603          	lw	a2,220(sp)
   13214:	0d812f83          	lw	t6,216(sp)
   13218:	08437f13          	andi	t5,t1,132
   1321c:	002c0c13          	addi	s8,s8,2
   13220:	00060513          	mv	a0,a2
   13224:	000f8593          	mv	a1,t6
   13228:	400f0e63          	beqz	t5,13644 <_vfprintf_r+0x1c8c>
   1322c:	00200713          	li	a4,2
   13230:	00080463          	beqz	a6,13238 <_vfprintf_r+0x1880>
   13234:	9cdfe06f          	j	11c00 <_vfprintf_r+0x248>
   13238:	9fdfe06f          	j	11c34 <_vfprintf_r+0x27c>
   1323c:	00078c93          	mv	s9,a5
   13240:	a19046e3          	bgtz	s9,12c4c <_vfprintf_r+0x1294>
   13244:	a35ff06f          	j	12c78 <_vfprintf_r+0x12c0>
   13248:	00040e13          	mv	t3,s0
   1324c:	000c0313          	mv	t1,s8
   13250:	00098413          	mv	s0,s3
   13254:	000c8c13          	mv	s8,s9
   13258:	000a0713          	mv	a4,s4
   1325c:	00068c93          	mv	s9,a3
   13260:	008c8cb3          	add	s9,s9,s0
   13264:	001d0d13          	addi	s10,s10,1
   13268:	0d912e23          	sw	s9,220(sp)
   1326c:	0da12c23          	sw	s10,216(sp)
   13270:	00eda023          	sw	a4,0(s11)
   13274:	008da223          	sw	s0,4(s11)
   13278:	00700793          	li	a5,7
   1327c:	85a7d4e3          	bge	a5,s10,12ac4 <_vfprintf_r+0x110c>
   13280:	01012583          	lw	a1,16(sp)
   13284:	00c12503          	lw	a0,12(sp)
   13288:	0d410613          	addi	a2,sp,212
   1328c:	02612423          	sw	t1,40(sp)
   13290:	03c12223          	sw	t3,36(sp)
   13294:	261010ef          	jal	14cf4 <__sprint_r>
   13298:	ee051263          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   1329c:	0dc12c83          	lw	s9,220(sp)
   132a0:	0d812d03          	lw	s10,216(sp)
   132a4:	02412e03          	lw	t3,36(sp)
   132a8:	02812303          	lw	t1,40(sp)
   132ac:	000a8d93          	mv	s11,s5
   132b0:	819ff06f          	j	12ac8 <_vfprintf_r+0x1110>
   132b4:	fff00c93          	li	s9,-1
   132b8:	00068993          	mv	s3,a3
   132bc:	89dfe06f          	j	11b58 <_vfprintf_r+0x1a0>
   132c0:	00022537          	lui	a0,0x22
   132c4:	00098e13          	mv	t3,s3
   132c8:	000a0313          	mv	t1,s4
   132cc:	45c50513          	addi	a0,a0,1116 # 2245c <__clzsi2+0xbc>
   132d0:	02037793          	andi	a5,t1,32
   132d4:	3c078e63          	beqz	a5,136b0 <_vfprintf_r+0x1cf8>
   132d8:	01812783          	lw	a5,24(sp)
   132dc:	00778793          	addi	a5,a5,7
   132e0:	ff87f793          	andi	a5,a5,-8
   132e4:	0007a683          	lw	a3,0(a5)
   132e8:	0047a603          	lw	a2,4(a5)
   132ec:	00878713          	addi	a4,a5,8
   132f0:	00e12c23          	sw	a4,24(sp)
   132f4:	00137793          	andi	a5,t1,1
   132f8:	36078863          	beqz	a5,13668 <_vfprintf_r+0x1cb0>
   132fc:	00c6e7b3          	or	a5,a3,a2
   13300:	54078e63          	beqz	a5,1385c <_vfprintf_r+0x1ea4>
   13304:	03000793          	li	a5,48
   13308:	0bb10ca3          	sb	s11,185(sp)
   1330c:	0a010ba3          	sb	zero,183(sp)
   13310:	0af10c23          	sb	a5,184(sp)
   13314:	440cca63          	bltz	s9,13768 <_vfprintf_r+0x1db0>
   13318:	b7f37313          	andi	t1,t1,-1153
   1331c:	00236313          	ori	t1,t1,2
   13320:	00f6f793          	andi	a5,a3,15
   13324:	00f507b3          	add	a5,a0,a5
   13328:	0007c783          	lbu	a5,0(a5)
   1332c:	00237593          	andi	a1,t1,2
   13330:	01c61713          	slli	a4,a2,0x1c
   13334:	0046d693          	srli	a3,a3,0x4
   13338:	00d766b3          	or	a3,a4,a3
   1333c:	00465613          	srli	a2,a2,0x4
   13340:	18f10fa3          	sb	a5,415(sp)
   13344:	00c6e7b3          	or	a5,a3,a2
   13348:	e60794e3          	bnez	a5,131b0 <_vfprintf_r+0x17f8>
   1334c:	19f10893          	addi	a7,sp,415
   13350:	e91ff06f          	j	131e0 <_vfprintf_r+0x1828>
   13354:	0019cd83          	lbu	s11,1(s3)
   13358:	020a6a13          	ori	s4,s4,32
   1335c:	00198993          	addi	s3,s3,1
   13360:	ff4fe06f          	j	11b54 <_vfprintf_r+0x19c>
   13364:	0019cd83          	lbu	s11,1(s3)
   13368:	200a6a13          	ori	s4,s4,512
   1336c:	00198993          	addi	s3,s3,1
   13370:	fe4fe06f          	j	11b54 <_vfprintf_r+0x19c>
   13374:	00022537          	lui	a0,0x22
   13378:	00098e13          	mv	t3,s3
   1337c:	000a0313          	mv	t1,s4
   13380:	44850513          	addi	a0,a0,1096 # 22448 <__clzsi2+0xa8>
   13384:	f4dff06f          	j	132d0 <_vfprintf_r+0x1918>
   13388:	01012583          	lw	a1,16(sp)
   1338c:	00c12503          	lw	a0,12(sp)
   13390:	0d410613          	addi	a2,sp,212
   13394:	02612423          	sw	t1,40(sp)
   13398:	03c12223          	sw	t3,36(sp)
   1339c:	159010ef          	jal	14cf4 <__sprint_r>
   133a0:	dc051e63          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   133a4:	0dc12603          	lw	a2,220(sp)
   133a8:	02812303          	lw	t1,40(sp)
   133ac:	02412e03          	lw	t3,36(sp)
   133b0:	000a8413          	mv	s0,s5
   133b4:	ec1fe06f          	j	12274 <_vfprintf_r+0x8bc>
   133b8:	00600793          	li	a5,6
   133bc:	000c8c13          	mv	s8,s9
   133c0:	2797ece3          	bltu	a5,s9,13e38 <_vfprintf_r+0x2480>
   133c4:	000227b7          	lui	a5,0x22
   133c8:	01312c23          	sw	s3,24(sp)
   133cc:	47078893          	addi	a7,a5,1136 # 22470 <__clzsi2+0xd0>
   133d0:	00012e23          	sw	zero,28(sp)
   133d4:	000c0d13          	mv	s10,s8
   133d8:	00000c93          	li	s9,0
   133dc:	02012423          	sw	zero,40(sp)
   133e0:	02012223          	sw	zero,36(sp)
   133e4:	00000993          	li	s3,0
   133e8:	ff8fe06f          	j	11be0 <_vfprintf_r+0x228>
   133ec:	00022737          	lui	a4,0x22
   133f0:	01000d93          	li	s11,16
   133f4:	0d812583          	lw	a1,216(sp)
   133f8:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   133fc:	699dde63          	bge	s11,s9,13a98 <_vfprintf_r+0x20e0>
   13400:	00040793          	mv	a5,s0
   13404:	000c8a13          	mv	s4,s9
   13408:	000d8e93          	mv	t4,s11
   1340c:	00700d13          	li	s10,7
   13410:	000e0b13          	mv	s6,t3
   13414:	02612c23          	sw	t1,56(sp)
   13418:	00088c93          	mv	s9,a7
   1341c:	00070413          	mv	s0,a4
   13420:	00c0006f          	j	1342c <_vfprintf_r+0x1a74>
   13424:	ff0a0a13          	addi	s4,s4,-16
   13428:	654edc63          	bge	t4,s4,13a80 <_vfprintf_r+0x20c8>
   1342c:	01060613          	addi	a2,a2,16
   13430:	00158593          	addi	a1,a1,1
   13434:	0087a023          	sw	s0,0(a5)
   13438:	01b7a223          	sw	s11,4(a5)
   1343c:	0cc12e23          	sw	a2,220(sp)
   13440:	0cb12c23          	sw	a1,216(sp)
   13444:	00878793          	addi	a5,a5,8
   13448:	fcbd5ee3          	bge	s10,a1,13424 <_vfprintf_r+0x1a6c>
   1344c:	01012583          	lw	a1,16(sp)
   13450:	00c12503          	lw	a0,12(sp)
   13454:	0d410613          	addi	a2,sp,212
   13458:	09d010ef          	jal	14cf4 <__sprint_r>
   1345c:	d2051063          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   13460:	0dc12603          	lw	a2,220(sp)
   13464:	0d812583          	lw	a1,216(sp)
   13468:	000a8793          	mv	a5,s5
   1346c:	01000e93          	li	t4,16
   13470:	fb5ff06f          	j	13424 <_vfprintf_r+0x1a6c>
   13474:	00088513          	mv	a0,a7
   13478:	01c12e23          	sw	t3,28(sp)
   1347c:	01112c23          	sw	a7,24(sp)
   13480:	03412223          	sw	s4,36(sp)
   13484:	08d020ef          	jal	15d10 <strlen>
   13488:	0b714703          	lbu	a4,183(sp)
   1348c:	fff54693          	not	a3,a0
   13490:	41f6d693          	srai	a3,a3,0x1f
   13494:	01812883          	lw	a7,24(sp)
   13498:	01c12e03          	lw	t3,28(sp)
   1349c:	02412303          	lw	t1,36(sp)
   134a0:	00050d13          	mv	s10,a0
   134a4:	00d57c33          	and	s8,a0,a3
   134a8:	00071463          	bnez	a4,134b0 <_vfprintf_r+0x1af8>
   134ac:	badfe06f          	j	12058 <_vfprintf_r+0x6a0>
   134b0:	001c0c13          	addi	s8,s8,1
   134b4:	ba5fe06f          	j	12058 <_vfprintf_r+0x6a0>
   134b8:	00000c13          	li	s8,0
   134bc:	1a010893          	addi	a7,sp,416
   134c0:	00012e23          	sw	zero,28(sp)
   134c4:	02012423          	sw	zero,40(sp)
   134c8:	02012223          	sw	zero,36(sp)
   134cc:	00000993          	li	s3,0
   134d0:	f10fe06f          	j	11be0 <_vfprintf_r+0x228>
   134d4:	07800793          	li	a5,120
   134d8:	03000713          	li	a4,48
   134dc:	0ae10c23          	sb	a4,184(sp)
   134e0:	0af10ca3          	sb	a5,185(sp)
   134e4:	06300713          	li	a4,99
   134e8:	00012e23          	sw	zero,28(sp)
   134ec:	00236313          	ori	t1,t1,2
   134f0:	13c10893          	addi	a7,sp,316
   134f4:	01974463          	blt	a4,s9,134fc <_vfprintf_r+0x1b44>
   134f8:	9b9fe06f          	j	11eb0 <_vfprintf_r+0x4f8>
   134fc:	00c12503          	lw	a0,12(sp)
   13500:	001c8593          	addi	a1,s9,1
   13504:	02612023          	sw	t1,32(sp)
   13508:	01c12e23          	sw	t3,28(sp)
   1350c:	c9dfd0ef          	jal	111a8 <_malloc_r>
   13510:	01c12e03          	lw	t3,28(sp)
   13514:	02012303          	lw	t1,32(sp)
   13518:	00050893          	mv	a7,a0
   1351c:	00051463          	bnez	a0,13524 <_vfprintf_r+0x1b6c>
   13520:	6900106f          	j	14bb0 <_vfprintf_r+0x31f8>
   13524:	00a12e23          	sw	a0,28(sp)
   13528:	989fe06f          	j	11eb0 <_vfprintf_r+0x4f8>
   1352c:	00c12503          	lw	a0,12(sp)
   13530:	0a010d13          	addi	s10,sp,160
   13534:	0bc10713          	addi	a4,sp,188
   13538:	000d0593          	mv	a1,s10
   1353c:	0cc10813          	addi	a6,sp,204
   13540:	0c010793          	addi	a5,sp,192
   13544:	000c8693          	mv	a3,s9
   13548:	00200613          	li	a2,2
   1354c:	04612623          	sw	t1,76(sp)
   13550:	05c12423          	sw	t3,72(sp)
   13554:	0a512023          	sw	t0,160(sp)
   13558:	04512223          	sw	t0,68(sp)
   1355c:	0bf12223          	sw	t6,164(sp)
   13560:	03f12423          	sw	t6,40(sp)
   13564:	0be12423          	sw	t5,168(sp)
   13568:	03e12223          	sw	t5,36(sp)
   1356c:	0bd12623          	sw	t4,172(sp)
   13570:	03d12023          	sw	t4,32(sp)
   13574:	245020ef          	jal	15fb8 <_ldtoa_r>
   13578:	04c12303          	lw	t1,76(sp)
   1357c:	02012e83          	lw	t4,32(sp)
   13580:	02412f03          	lw	t5,36(sp)
   13584:	00137713          	andi	a4,t1,1
   13588:	02812f83          	lw	t6,40(sp)
   1358c:	04412283          	lw	t0,68(sp)
   13590:	04812e03          	lw	t3,72(sp)
   13594:	00050893          	mv	a7,a0
   13598:	1e071ee3          	bnez	a4,13f94 <_vfprintf_r+0x25dc>
   1359c:	0cc12783          	lw	a5,204(sp)
   135a0:	0bc12983          	lw	s3,188(sp)
   135a4:	ffd00713          	li	a4,-3
   135a8:	40a787b3          	sub	a5,a5,a0
   135ac:	02f12023          	sw	a5,32(sp)
   135b0:	00e9d463          	bge	s3,a4,135b8 <_vfprintf_r+0x1c00>
   135b4:	1a00106f          	j	14754 <_vfprintf_r+0x2d9c>
   135b8:	013cd463          	bge	s9,s3,135c0 <_vfprintf_r+0x1c08>
   135bc:	0d40106f          	j	14690 <_vfprintf_r+0x2cd8>
   135c0:	00f9d463          	bge	s3,a5,135c8 <_vfprintf_r+0x1c10>
   135c4:	2e00106f          	j	148a4 <_vfprintf_r+0x2eec>
   135c8:	00098d13          	mv	s10,s3
   135cc:	40037313          	andi	t1,t1,1024
   135d0:	00030663          	beqz	t1,135dc <_vfprintf_r+0x1c24>
   135d4:	01305463          	blez	s3,135dc <_vfprintf_r+0x1c24>
   135d8:	44c0106f          	j	14a24 <_vfprintf_r+0x306c>
   135dc:	fffd4693          	not	a3,s10
   135e0:	41f6d693          	srai	a3,a3,0x1f
   135e4:	00dd7c33          	and	s8,s10,a3
   135e8:	06700d93          	li	s11,103
   135ec:	000a0313          	mv	t1,s4
   135f0:	02012423          	sw	zero,40(sp)
   135f4:	02012223          	sw	zero,36(sp)
   135f8:	03812783          	lw	a5,56(sp)
   135fc:	00237593          	andi	a1,t1,2
   13600:	00079463          	bnez	a5,13608 <_vfprintf_r+0x1c50>
   13604:	0140106f          	j	14618 <_vfprintf_r+0x2c60>
   13608:	02d00813          	li	a6,45
   1360c:	0b010ba3          	sb	a6,183(sp)
   13610:	001c0c13          	addi	s8,s8,1
   13614:	00000c93          	li	s9,0
   13618:	bf1ff06f          	j	13208 <_vfprintf_r+0x1850>
   1361c:	00070313          	mv	t1,a4
   13620:	00f12c23          	sw	a5,24(sp)
   13624:	00000993          	li	s3,0
   13628:	02012223          	sw	zero,36(sp)
   1362c:	00000d13          	li	s10,0
   13630:	00012e23          	sw	zero,28(sp)
   13634:	1a010893          	addi	a7,sp,416
   13638:	07800d93          	li	s11,120
   1363c:	00000813          	li	a6,0
   13640:	00200c13          	li	s8,2
   13644:	418b8733          	sub	a4,s7,s8
   13648:	00e04c63          	bgtz	a4,13660 <_vfprintf_r+0x1ca8>
   1364c:	00000f13          	li	t5,0
   13650:	00081463          	bnez	a6,13658 <_vfprintf_r+0x1ca0>
   13654:	de0fe06f          	j	11c34 <_vfprintf_r+0x27c>
   13658:	00200713          	li	a4,2
   1365c:	da4fe06f          	j	11c00 <_vfprintf_r+0x248>
   13660:	00200f13          	li	t5,2
   13664:	fbcff06f          	j	12e20 <_vfprintf_r+0x1468>
   13668:	0a010ba3          	sb	zero,183(sp)
   1366c:	100cc063          	bltz	s9,1376c <_vfprintf_r+0x1db4>
   13670:	00c6e7b3          	or	a5,a3,a2
   13674:	b7f37313          	andi	t1,t1,-1153
   13678:	ca0794e3          	bnez	a5,13320 <_vfprintf_r+0x1968>
   1367c:	000c9463          	bnez	s9,13684 <_vfprintf_r+0x1ccc>
   13680:	e6dfe06f          	j	124ec <_vfprintf_r+0xb34>
   13684:	00054783          	lbu	a5,0(a0)
   13688:	000c8c13          	mv	s8,s9
   1368c:	18f10fa3          	sb	a5,415(sp)
   13690:	099052e3          	blez	s9,13f14 <_vfprintf_r+0x255c>
   13694:	00012e23          	sw	zero,28(sp)
   13698:	00100d13          	li	s10,1
   1369c:	02012423          	sw	zero,40(sp)
   136a0:	02012223          	sw	zero,36(sp)
   136a4:	00000993          	li	s3,0
   136a8:	19f10893          	addi	a7,sp,415
   136ac:	d34fe06f          	j	11be0 <_vfprintf_r+0x228>
   136b0:	01812703          	lw	a4,24(sp)
   136b4:	01037793          	andi	a5,t1,16
   136b8:	00072683          	lw	a3,0(a4)
   136bc:	00470713          	addi	a4,a4,4
   136c0:	00e12c23          	sw	a4,24(sp)
   136c4:	08079e63          	bnez	a5,13760 <_vfprintf_r+0x1da8>
   136c8:	04037793          	andi	a5,t1,64
   136cc:	08078663          	beqz	a5,13758 <_vfprintf_r+0x1da0>
   136d0:	01069693          	slli	a3,a3,0x10
   136d4:	0106d693          	srli	a3,a3,0x10
   136d8:	00000613          	li	a2,0
   136dc:	c19ff06f          	j	132f4 <_vfprintf_r+0x193c>
   136e0:	01012583          	lw	a1,16(sp)
   136e4:	00c12503          	lw	a0,12(sp)
   136e8:	0d410613          	addi	a2,sp,212
   136ec:	03112c23          	sw	a7,56(sp)
   136f0:	02612423          	sw	t1,40(sp)
   136f4:	03c12223          	sw	t3,36(sp)
   136f8:	5fc010ef          	jal	14cf4 <__sprint_r>
   136fc:	a8051063          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   13700:	0dc12c83          	lw	s9,220(sp)
   13704:	0d812d03          	lw	s10,216(sp)
   13708:	03812883          	lw	a7,56(sp)
   1370c:	02812303          	lw	t1,40(sp)
   13710:	02412e03          	lw	t3,36(sp)
   13714:	000a8d93          	mv	s11,s5
   13718:	afcff06f          	j	12a14 <_vfprintf_r+0x105c>
   1371c:	01012583          	lw	a1,16(sp)
   13720:	00c12503          	lw	a0,12(sp)
   13724:	0d410613          	addi	a2,sp,212
   13728:	03112c23          	sw	a7,56(sp)
   1372c:	02612423          	sw	t1,40(sp)
   13730:	03c12223          	sw	t3,36(sp)
   13734:	5c0010ef          	jal	14cf4 <__sprint_r>
   13738:	a4051263          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   1373c:	0dc12c83          	lw	s9,220(sp)
   13740:	0d812d03          	lw	s10,216(sp)
   13744:	03812883          	lw	a7,56(sp)
   13748:	02812303          	lw	t1,40(sp)
   1374c:	02412e03          	lw	t3,36(sp)
   13750:	000a8d93          	mv	s11,s5
   13754:	aecff06f          	j	12a40 <_vfprintf_r+0x1088>
   13758:	20037793          	andi	a5,t1,512
   1375c:	76079863          	bnez	a5,13ecc <_vfprintf_r+0x2514>
   13760:	00000613          	li	a2,0
   13764:	b91ff06f          	j	132f4 <_vfprintf_r+0x193c>
   13768:	00236313          	ori	t1,t1,2
   1376c:	00f6f793          	andi	a5,a3,15
   13770:	00f507b3          	add	a5,a0,a5
   13774:	00237593          	andi	a1,t1,2
   13778:	0007c783          	lbu	a5,0(a5)
   1377c:	bff37313          	andi	t1,t1,-1025
   13780:	bb1ff06f          	j	13330 <_vfprintf_r+0x1978>
   13784:	0d812703          	lw	a4,216(sp)
   13788:	000225b7          	lui	a1,0x22
   1378c:	47858593          	addi	a1,a1,1144 # 22478 <__clzsi2+0xd8>
   13790:	00160613          	addi	a2,a2,1
   13794:	00170713          	addi	a4,a4,1
   13798:	00100813          	li	a6,1
   1379c:	00b42023          	sw	a1,0(s0)
   137a0:	01042223          	sw	a6,4(s0)
   137a4:	0cc12e23          	sw	a2,220(sp)
   137a8:	0ce12c23          	sw	a4,216(sp)
   137ac:	00700593          	li	a1,7
   137b0:	00840413          	addi	s0,s0,8
   137b4:	5ee5ca63          	blt	a1,a4,13da8 <_vfprintf_r+0x23f0>
   137b8:	00050463          	beqz	a0,137c0 <_vfprintf_r+0x1e08>
   137bc:	f94fe06f          	j	11f50 <_vfprintf_r+0x598>
   137c0:	02012783          	lw	a5,32(sp)
   137c4:	00137713          	andi	a4,t1,1
   137c8:	00f76733          	or	a4,a4,a5
   137cc:	00071463          	bnez	a4,137d4 <_vfprintf_r+0x1e1c>
   137d0:	cd0fe06f          	j	11ca0 <_vfprintf_r+0x2e8>
   137d4:	0d812583          	lw	a1,216(sp)
   137d8:	02c12783          	lw	a5,44(sp)
   137dc:	03412703          	lw	a4,52(sp)
   137e0:	00158593          	addi	a1,a1,1
   137e4:	00c78633          	add	a2,a5,a2
   137e8:	00e42023          	sw	a4,0(s0)
   137ec:	0cc12e23          	sw	a2,220(sp)
   137f0:	00f42223          	sw	a5,4(s0)
   137f4:	0cb12c23          	sw	a1,216(sp)
   137f8:	00700713          	li	a4,7
   137fc:	74b74a63          	blt	a4,a1,13f50 <_vfprintf_r+0x2598>
   13800:	00840413          	addi	s0,s0,8
   13804:	f88fe06f          	j	11f8c <_vfprintf_r+0x5d4>
   13808:	01012583          	lw	a1,16(sp)
   1380c:	00c12503          	lw	a0,12(sp)
   13810:	0d410613          	addi	a2,sp,212
   13814:	05112623          	sw	a7,76(sp)
   13818:	04612423          	sw	t1,72(sp)
   1381c:	05e12223          	sw	t5,68(sp)
   13820:	03c12c23          	sw	t3,56(sp)
   13824:	4d0010ef          	jal	14cf4 <__sprint_r>
   13828:	94051a63          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   1382c:	0b714703          	lbu	a4,183(sp)
   13830:	0dc12603          	lw	a2,220(sp)
   13834:	03812e03          	lw	t3,56(sp)
   13838:	04412f03          	lw	t5,68(sp)
   1383c:	04812303          	lw	t1,72(sp)
   13840:	04c12883          	lw	a7,76(sp)
   13844:	16070463          	beqz	a4,139ac <_vfprintf_r+0x1ff4>
   13848:	000f0713          	mv	a4,t5
   1384c:	0d812f83          	lw	t6,216(sp)
   13850:	00000f13          	li	t5,0
   13854:	000a8413          	mv	s0,s5
   13858:	ba8fe06f          	j	11c00 <_vfprintf_r+0x248>
   1385c:	0a010ba3          	sb	zero,183(sp)
   13860:	280ccc63          	bltz	s9,13af8 <_vfprintf_r+0x2140>
   13864:	b7f37313          	andi	t1,t1,-1153
   13868:	e15ff06f          	j	1367c <_vfprintf_r+0x1cc4>
   1386c:	00c12503          	lw	a0,12(sp)
   13870:	cc9fc0ef          	jal	10538 <__sinit>
   13874:	9a4fe06f          	j	11a18 <_vfprintf_r+0x60>
   13878:	01012583          	lw	a1,16(sp)
   1387c:	00c12503          	lw	a0,12(sp)
   13880:	0d410613          	addi	a2,sp,212
   13884:	02612423          	sw	t1,40(sp)
   13888:	03c12223          	sw	t3,36(sp)
   1388c:	468010ef          	jal	14cf4 <__sprint_r>
   13890:	8e051663          	bnez	a0,1297c <_vfprintf_r+0xfc4>
   13894:	0dc12603          	lw	a2,220(sp)
   13898:	02812303          	lw	t1,40(sp)
   1389c:	02412e03          	lw	t3,36(sp)
   138a0:	000a8413          	mv	s0,s5
   138a4:	991fe06f          	j	12234 <_vfprintf_r+0x87c>
   138a8:	000b0993          	mv	s3,s6
   138ac:	8d4ff06f          	j	12980 <_vfprintf_r+0xfc8>
   138b0:	00040e13          	mv	t3,s0
   138b4:	000c0313          	mv	t1,s8
   138b8:	00068413          	mv	s0,a3
   138bc:	000c8c13          	mv	s8,s9
   138c0:	000a0713          	mv	a4,s4
   138c4:	00098c93          	mv	s9,s3
   138c8:	01960633          	add	a2,a2,s9
   138cc:	00178793          	addi	a5,a5,1
   138d0:	0cc12e23          	sw	a2,220(sp)
   138d4:	0cf12c23          	sw	a5,216(sp)
   138d8:	00e42023          	sw	a4,0(s0)
   138dc:	01942223          	sw	s9,4(s0)
   138e0:	00700713          	li	a4,7
   138e4:	00f74463          	blt	a4,a5,138ec <_vfprintf_r+0x1f34>
   138e8:	bb4fe06f          	j	11c9c <_vfprintf_r+0x2e4>
   138ec:	ec4fe06f          	j	11fb0 <_vfprintf_r+0x5f8>
   138f0:	0e012603          	lw	a2,224(sp)
   138f4:	0e412683          	lw	a3,228(sp)
   138f8:	0e812703          	lw	a4,232(sp)
   138fc:	0ec12783          	lw	a5,236(sp)
   13900:	f7f37313          	andi	t1,t1,-129
   13904:	09010593          	addi	a1,sp,144
   13908:	0a010513          	addi	a0,sp,160
   1390c:	03c12223          	sw	t3,36(sp)
   13910:	00612e23          	sw	t1,28(sp)
   13914:	08012823          	sw	zero,144(sp)
   13918:	08012a23          	sw	zero,148(sp)
   1391c:	08012c23          	sw	zero,152(sp)
   13920:	08012e23          	sw	zero,156(sp)
   13924:	0ac12023          	sw	a2,160(sp)
   13928:	0ad12223          	sw	a3,164(sp)
   1392c:	0ae12423          	sw	a4,168(sp)
   13930:	0af12623          	sw	a5,172(sp)
   13934:	4110b0ef          	jal	1f544 <__letf2>
   13938:	01c12303          	lw	t1,28(sp)
   1393c:	02412e03          	lw	t3,36(sp)
   13940:	58054ee3          	bltz	a0,146dc <_vfprintf_r+0x2d24>
   13944:	04700793          	li	a5,71
   13948:	0b714703          	lbu	a4,183(sp)
   1394c:	77b7d063          	bge	a5,s11,140ac <_vfprintf_r+0x26f4>
   13950:	000227b7          	lui	a5,0x22
   13954:	43c78893          	addi	a7,a5,1084 # 2243c <__clzsi2+0x9c>
   13958:	10071463          	bnez	a4,13a60 <_vfprintf_r+0x20a8>
   1395c:	00300d13          	li	s10,3
   13960:	000d0c13          	mv	s8,s10
   13964:	ef8fe06f          	j	1205c <_vfprintf_r+0x6a4>
   13968:	01812783          	lw	a5,24(sp)
   1396c:	01412683          	lw	a3,20(sp)
   13970:	0007a783          	lw	a5,0(a5)
   13974:	00d7a023          	sw	a3,0(a5)
   13978:	00e12c23          	sw	a4,24(sp)
   1397c:	d0dfe06f          	j	12688 <_vfprintf_r+0xcd0>
   13980:	00022537          	lui	a0,0x22
   13984:	44850813          	addi	a6,a0,1096 # 22448 <__clzsi2+0xa8>
   13988:	00f6f593          	andi	a1,a3,15
   1398c:	010585b3          	add	a1,a1,a6
   13990:	00f12c23          	sw	a5,24(sp)
   13994:	00070313          	mv	t1,a4
   13998:	0005c783          	lbu	a5,0(a1)
   1399c:	44850513          	addi	a0,a0,1096
   139a0:	00200593          	li	a1,2
   139a4:	07800d93          	li	s11,120
   139a8:	989ff06f          	j	13330 <_vfprintf_r+0x1978>
   139ac:	500f0063          	beqz	t5,13eac <_vfprintf_r+0x24f4>
   139b0:	0d812f83          	lw	t6,216(sp)
   139b4:	00000f13          	li	t5,0
   139b8:	000a8413          	mv	s0,s5
   139bc:	a78fe06f          	j	11c34 <_vfprintf_r+0x27c>
   139c0:	200a7713          	andi	a4,s4,512
   139c4:	50070a63          	beqz	a4,13ed8 <_vfprintf_r+0x2520>
   139c8:	01881d13          	slli	s10,a6,0x18
   139cc:	418d5d13          	srai	s10,s10,0x18
   139d0:	41fd5713          	srai	a4,s10,0x1f
   139d4:	00f12c23          	sw	a5,24(sp)
   139d8:	00070693          	mv	a3,a4
   139dc:	975fe06f          	j	12350 <_vfprintf_r+0x998>
   139e0:	200a7713          	andi	a4,s4,512
   139e4:	0a010ba3          	sb	zero,183(sp)
   139e8:	50071a63          	bnez	a4,13efc <_vfprintf_r+0x2544>
   139ec:	00068d13          	mv	s10,a3
   139f0:	00000713          	li	a4,0
   139f4:	e60cc663          	bltz	s9,13060 <_vfprintf_r+0x16a8>
   139f8:	f7fa7313          	andi	t1,s4,-129
   139fc:	e6069263          	bnez	a3,13060 <_vfprintf_r+0x16a8>
   13a00:	00f12c23          	sw	a5,24(sp)
   13a04:	000c9463          	bnez	s9,13a0c <_vfprintf_r+0x2054>
   13a08:	ae5fe06f          	j	124ec <_vfprintf_r+0xb34>
   13a0c:	00000d13          	li	s10,0
   13a10:	9edfe06f          	j	123fc <_vfprintf_r+0xa44>
   13a14:	200a7693          	andi	a3,s4,512
   13a18:	4c068a63          	beqz	a3,13eec <_vfprintf_r+0x2534>
   13a1c:	0ff77713          	zext.b	a4,a4
   13a20:	00f12c23          	sw	a5,24(sp)
   13a24:	000a0e93          	mv	t4,s4
   13a28:	00000593          	li	a1,0
   13a2c:	b19fe06f          	j	12544 <_vfprintf_r+0xb8c>
   13a30:	0ec12d03          	lw	s10,236(sp)
   13a34:	800007b7          	lui	a5,0x80000
   13a38:	f7f37313          	andi	t1,t1,-129
   13a3c:	00fd79b3          	and	s3,s10,a5
   13a40:	4c098e63          	beqz	s3,13f1c <_vfprintf_r+0x2564>
   13a44:	02d00793          	li	a5,45
   13a48:	0af10ba3          	sb	a5,183(sp)
   13a4c:	04700793          	li	a5,71
   13a50:	01b7c463          	blt	a5,s11,13a58 <_vfprintf_r+0x20a0>
   13a54:	7b10006f          	j	14a04 <_vfprintf_r+0x304c>
   13a58:	000227b7          	lui	a5,0x22
   13a5c:	44478893          	addi	a7,a5,1092 # 22444 <__clzsi2+0xa4>
   13a60:	00012e23          	sw	zero,28(sp)
   13a64:	00300d13          	li	s10,3
   13a68:	00000c93          	li	s9,0
   13a6c:	02012423          	sw	zero,40(sp)
   13a70:	02012223          	sw	zero,36(sp)
   13a74:	00000993          	li	s3,0
   13a78:	00400c13          	li	s8,4
   13a7c:	964fe06f          	j	11be0 <_vfprintf_r+0x228>
   13a80:	03812303          	lw	t1,56(sp)
   13a84:	000c8893          	mv	a7,s9
   13a88:	00040713          	mv	a4,s0
   13a8c:	000b0e13          	mv	t3,s6
   13a90:	000a0c93          	mv	s9,s4
   13a94:	00078413          	mv	s0,a5
   13a98:	01960633          	add	a2,a2,s9
   13a9c:	00158593          	addi	a1,a1,1
   13aa0:	00e42023          	sw	a4,0(s0)
   13aa4:	01942223          	sw	s9,4(s0)
   13aa8:	0cc12e23          	sw	a2,220(sp)
   13aac:	0cb12c23          	sw	a1,216(sp)
   13ab0:	00700713          	li	a4,7
   13ab4:	00840413          	addi	s0,s0,8
   13ab8:	9cb75a63          	bge	a4,a1,12c8c <_vfprintf_r+0x12d4>
   13abc:	01012583          	lw	a1,16(sp)
   13ac0:	00c12503          	lw	a0,12(sp)
   13ac4:	0d410613          	addi	a2,sp,212
   13ac8:	05112423          	sw	a7,72(sp)
   13acc:	04612223          	sw	t1,68(sp)
   13ad0:	03c12c23          	sw	t3,56(sp)
   13ad4:	220010ef          	jal	14cf4 <__sprint_r>
   13ad8:	00050463          	beqz	a0,13ae0 <_vfprintf_r+0x2128>
   13adc:	ea1fe06f          	j	1297c <_vfprintf_r+0xfc4>
   13ae0:	0dc12603          	lw	a2,220(sp)
   13ae4:	04812883          	lw	a7,72(sp)
   13ae8:	04412303          	lw	t1,68(sp)
   13aec:	03812e03          	lw	t3,56(sp)
   13af0:	000a8413          	mv	s0,s5
   13af4:	998ff06f          	j	12c8c <_vfprintf_r+0x12d4>
   13af8:	00054783          	lbu	a5,0(a0)
   13afc:	bff37313          	andi	t1,t1,-1025
   13b00:	00000593          	li	a1,0
   13b04:	18f10fa3          	sb	a5,415(sp)
   13b08:	19f10893          	addi	a7,sp,415
   13b0c:	ed4ff06f          	j	131e0 <_vfprintf_r+0x1828>
   13b10:	05012603          	lw	a2,80(sp)
   13b14:	04012583          	lw	a1,64(sp)
   13b18:	00100b93          	li	s7,1
   13b1c:	40ca0433          	sub	s0,s4,a2
   13b20:	00040513          	mv	a0,s0
   13b24:	5c5010ef          	jal	158e8 <strncpy>
   13b28:	03012703          	lw	a4,48(sp)
   13b2c:	000c0513          	mv	a0,s8
   13b30:	000c8593          	mv	a1,s9
   13b34:	00174783          	lbu	a5,1(a4)
   13b38:	00a00613          	li	a2,10
   13b3c:	00000693          	li	a3,0
   13b40:	00f037b3          	snez	a5,a5
   13b44:	00f707b3          	add	a5,a4,a5
   13b48:	02f12823          	sw	a5,48(sp)
   13b4c:	48d080ef          	jal	1c7d8 <__udivdi3>
   13b50:	00a00613          	li	a2,10
   13b54:	00000693          	li	a3,0
   13b58:	00050c13          	mv	s8,a0
   13b5c:	00058c93          	mv	s9,a1
   13b60:	240090ef          	jal	1cda0 <__umoddi3>
   13b64:	03050793          	addi	a5,a0,48
   13b68:	fff40a13          	addi	s4,s0,-1
   13b6c:	fef40fa3          	sb	a5,-1(s0)
   13b70:	d88ff06f          	j	130f8 <_vfprintf_r+0x1740>
   13b74:	02012783          	lw	a5,32(sp)
   13b78:	00040713          	mv	a4,s0
   13b7c:	02412403          	lw	s0,36(sp)
   13b80:	00f88b33          	add	s6,a7,a5
   13b84:	02812983          	lw	s3,40(sp)
   13b88:	03612223          	sw	s6,36(sp)
   13b8c:	03812423          	sw	s8,40(sp)
   13b90:	03c12c23          	sw	t3,56(sp)
   13b94:	05712223          	sw	s7,68(sp)
   13b98:	04612423          	sw	t1,72(sp)
   13b9c:	05112623          	sw	a7,76(sp)
   13ba0:	000d8c13          	mv	s8,s11
   13ba4:	03012b03          	lw	s6,48(sp)
   13ba8:	05012d83          	lw	s11,80(sp)
   13bac:	00700813          	li	a6,7
   13bb0:	01000c93          	li	s9,16
   13bb4:	00022a37          	lui	s4,0x22
   13bb8:	08805863          	blez	s0,13c48 <_vfprintf_r+0x2290>
   13bbc:	19305663          	blez	s3,13d48 <_vfprintf_r+0x2390>
   13bc0:	fff98993          	addi	s3,s3,-1
   13bc4:	0d812783          	lw	a5,216(sp)
   13bc8:	04012683          	lw	a3,64(sp)
   13bcc:	01b60633          	add	a2,a2,s11
   13bd0:	00178793          	addi	a5,a5,1
   13bd4:	00d72023          	sw	a3,0(a4)
   13bd8:	01b72223          	sw	s11,4(a4)
   13bdc:	0cc12e23          	sw	a2,220(sp)
   13be0:	0cf12c23          	sw	a5,216(sp)
   13be4:	00870713          	addi	a4,a4,8
   13be8:	16f84663          	blt	a6,a5,13d54 <_vfprintf_r+0x239c>
   13bec:	02412783          	lw	a5,36(sp)
   13bf0:	000b4683          	lbu	a3,0(s6)
   13bf4:	41878bb3          	sub	s7,a5,s8
   13bf8:	0176d463          	bge	a3,s7,13c00 <_vfprintf_r+0x2248>
   13bfc:	00068b93          	mv	s7,a3
   13c00:	03705663          	blez	s7,13c2c <_vfprintf_r+0x2274>
   13c04:	0d812683          	lw	a3,216(sp)
   13c08:	01760633          	add	a2,a2,s7
   13c0c:	0cc12e23          	sw	a2,220(sp)
   13c10:	00168693          	addi	a3,a3,1
   13c14:	01872023          	sw	s8,0(a4)
   13c18:	01772223          	sw	s7,4(a4)
   13c1c:	0cd12c23          	sw	a3,216(sp)
   13c20:	14d84e63          	blt	a6,a3,13d7c <_vfprintf_r+0x23c4>
   13c24:	000b4683          	lbu	a3,0(s6)
   13c28:	00870713          	addi	a4,a4,8
   13c2c:	fffbc593          	not	a1,s7
   13c30:	41f5d593          	srai	a1,a1,0x1f
   13c34:	00bbf7b3          	and	a5,s7,a1
   13c38:	40f68d33          	sub	s10,a3,a5
   13c3c:	05a04463          	bgtz	s10,13c84 <_vfprintf_r+0x22cc>
   13c40:	00dc0c33          	add	s8,s8,a3
   13c44:	f6804ce3          	bgtz	s0,13bbc <_vfprintf_r+0x2204>
   13c48:	f7304ce3          	bgtz	s3,13bc0 <_vfprintf_r+0x2208>
   13c4c:	04c12883          	lw	a7,76(sp)
   13c50:	02012783          	lw	a5,32(sp)
   13c54:	000c0d93          	mv	s11,s8
   13c58:	00070413          	mv	s0,a4
   13c5c:	03612823          	sw	s6,48(sp)
   13c60:	00f88733          	add	a4,a7,a5
   13c64:	03812e03          	lw	t3,56(sp)
   13c68:	04412b83          	lw	s7,68(sp)
   13c6c:	04812303          	lw	t1,72(sp)
   13c70:	02812c03          	lw	s8,40(sp)
   13c74:	01b76463          	bltu	a4,s11,13c7c <_vfprintf_r+0x22c4>
   13c78:	820ff06f          	j	12c98 <_vfprintf_r+0x12e0>
   13c7c:	00070d93          	mv	s11,a4
   13c80:	818ff06f          	j	12c98 <_vfprintf_r+0x12e0>
   13c84:	00022f37          	lui	t5,0x22
   13c88:	0d812683          	lw	a3,216(sp)
   13c8c:	798f0b93          	addi	s7,t5,1944 # 22798 <zeroes.0>
   13c90:	09acd663          	bge	s9,s10,13d1c <_vfprintf_r+0x2364>
   13c94:	798a0b93          	addi	s7,s4,1944 # 22798 <zeroes.0>
   13c98:	000b8793          	mv	a5,s7
   13c9c:	00040b93          	mv	s7,s0
   13ca0:	000d0413          	mv	s0,s10
   13ca4:	00098d13          	mv	s10,s3
   13ca8:	00078993          	mv	s3,a5
   13cac:	00c0006f          	j	13cb8 <_vfprintf_r+0x2300>
   13cb0:	ff040413          	addi	s0,s0,-16
   13cb4:	048cda63          	bge	s9,s0,13d08 <_vfprintf_r+0x2350>
   13cb8:	01060613          	addi	a2,a2,16
   13cbc:	00168693          	addi	a3,a3,1
   13cc0:	01372023          	sw	s3,0(a4)
   13cc4:	01972223          	sw	s9,4(a4)
   13cc8:	0cc12e23          	sw	a2,220(sp)
   13ccc:	0cd12c23          	sw	a3,216(sp)
   13cd0:	00870713          	addi	a4,a4,8
   13cd4:	fcd85ee3          	bge	a6,a3,13cb0 <_vfprintf_r+0x22f8>
   13cd8:	01012583          	lw	a1,16(sp)
   13cdc:	00c12503          	lw	a0,12(sp)
   13ce0:	0d410613          	addi	a2,sp,212
   13ce4:	010010ef          	jal	14cf4 <__sprint_r>
   13ce8:	00050463          	beqz	a0,13cf0 <_vfprintf_r+0x2338>
   13cec:	c91fe06f          	j	1297c <_vfprintf_r+0xfc4>
   13cf0:	ff040413          	addi	s0,s0,-16
   13cf4:	0dc12603          	lw	a2,220(sp)
   13cf8:	0d812683          	lw	a3,216(sp)
   13cfc:	000a8713          	mv	a4,s5
   13d00:	00700813          	li	a6,7
   13d04:	fa8ccae3          	blt	s9,s0,13cb8 <_vfprintf_r+0x2300>
   13d08:	00098793          	mv	a5,s3
   13d0c:	000d0993          	mv	s3,s10
   13d10:	00040d13          	mv	s10,s0
   13d14:	000b8413          	mv	s0,s7
   13d18:	00078b93          	mv	s7,a5
   13d1c:	01a60633          	add	a2,a2,s10
   13d20:	00168693          	addi	a3,a3,1
   13d24:	0cc12e23          	sw	a2,220(sp)
   13d28:	0cd12c23          	sw	a3,216(sp)
   13d2c:	01772023          	sw	s7,0(a4)
   13d30:	01a72223          	sw	s10,4(a4)
   13d34:	10d846e3          	blt	a6,a3,14640 <_vfprintf_r+0x2c88>
   13d38:	000b4683          	lbu	a3,0(s6)
   13d3c:	00870713          	addi	a4,a4,8
   13d40:	00dc0c33          	add	s8,s8,a3
   13d44:	f01ff06f          	j	13c44 <_vfprintf_r+0x228c>
   13d48:	fffb0b13          	addi	s6,s6,-1
   13d4c:	fff40413          	addi	s0,s0,-1
   13d50:	e75ff06f          	j	13bc4 <_vfprintf_r+0x220c>
   13d54:	01012583          	lw	a1,16(sp)
   13d58:	00c12503          	lw	a0,12(sp)
   13d5c:	0d410613          	addi	a2,sp,212
   13d60:	795000ef          	jal	14cf4 <__sprint_r>
   13d64:	00050463          	beqz	a0,13d6c <_vfprintf_r+0x23b4>
   13d68:	c15fe06f          	j	1297c <_vfprintf_r+0xfc4>
   13d6c:	0dc12603          	lw	a2,220(sp)
   13d70:	000a8713          	mv	a4,s5
   13d74:	00700813          	li	a6,7
   13d78:	e75ff06f          	j	13bec <_vfprintf_r+0x2234>
   13d7c:	01012583          	lw	a1,16(sp)
   13d80:	00c12503          	lw	a0,12(sp)
   13d84:	0d410613          	addi	a2,sp,212
   13d88:	76d000ef          	jal	14cf4 <__sprint_r>
   13d8c:	00050463          	beqz	a0,13d94 <_vfprintf_r+0x23dc>
   13d90:	bedfe06f          	j	1297c <_vfprintf_r+0xfc4>
   13d94:	000b4683          	lbu	a3,0(s6)
   13d98:	0dc12603          	lw	a2,220(sp)
   13d9c:	000a8713          	mv	a4,s5
   13da0:	00700813          	li	a6,7
   13da4:	e89ff06f          	j	13c2c <_vfprintf_r+0x2274>
   13da8:	01012583          	lw	a1,16(sp)
   13dac:	00c12503          	lw	a0,12(sp)
   13db0:	0d410613          	addi	a2,sp,212
   13db4:	03112c23          	sw	a7,56(sp)
   13db8:	02612423          	sw	t1,40(sp)
   13dbc:	03c12223          	sw	t3,36(sp)
   13dc0:	735000ef          	jal	14cf4 <__sprint_r>
   13dc4:	00050463          	beqz	a0,13dcc <_vfprintf_r+0x2414>
   13dc8:	bb5fe06f          	j	1297c <_vfprintf_r+0xfc4>
   13dcc:	0bc12503          	lw	a0,188(sp)
   13dd0:	0dc12603          	lw	a2,220(sp)
   13dd4:	03812883          	lw	a7,56(sp)
   13dd8:	02812303          	lw	t1,40(sp)
   13ddc:	02412e03          	lw	t3,36(sp)
   13de0:	000a8413          	mv	s0,s5
   13de4:	9d5ff06f          	j	137b8 <_vfprintf_r+0x1e00>
   13de8:	0b714703          	lbu	a4,183(sp)
   13dec:	00000c13          	li	s8,0
   13df0:	00000d13          	li	s10,0
   13df4:	1a010893          	addi	a7,sp,416
   13df8:	e28fe06f          	j	12420 <_vfprintf_r+0xa68>
   13dfc:	01012583          	lw	a1,16(sp)
   13e00:	00c12503          	lw	a0,12(sp)
   13e04:	0d410613          	addi	a2,sp,212
   13e08:	05112423          	sw	a7,72(sp)
   13e0c:	04612223          	sw	t1,68(sp)
   13e10:	03c12c23          	sw	t3,56(sp)
   13e14:	6e1000ef          	jal	14cf4 <__sprint_r>
   13e18:	00050463          	beqz	a0,13e20 <_vfprintf_r+0x2468>
   13e1c:	b61fe06f          	j	1297c <_vfprintf_r+0xfc4>
   13e20:	0dc12603          	lw	a2,220(sp)
   13e24:	04812883          	lw	a7,72(sp)
   13e28:	04412303          	lw	t1,68(sp)
   13e2c:	03812e03          	lw	t3,56(sp)
   13e30:	000a8413          	mv	s0,s5
   13e34:	e45fe06f          	j	12c78 <_vfprintf_r+0x12c0>
   13e38:	00078c13          	mv	s8,a5
   13e3c:	d88ff06f          	j	133c4 <_vfprintf_r+0x1a0c>
   13e40:	0dc12603          	lw	a2,220(sp)
   13e44:	0d812f83          	lw	t6,216(sp)
   13e48:	004a7693          	andi	a3,s4,4
   13e4c:	02d12423          	sw	a3,40(sp)
   13e50:	00060513          	mv	a0,a2
   13e54:	000f8593          	mv	a1,t6
   13e58:	fc068263          	beqz	a3,1361c <_vfprintf_r+0x1c64>
   13e5c:	00f12c23          	sw	a5,24(sp)
   13e60:	00070313          	mv	t1,a4
   13e64:	00000d13          	li	s10,0
   13e68:	02012423          	sw	zero,40(sp)
   13e6c:	02012223          	sw	zero,36(sp)
   13e70:	00000993          	li	s3,0
   13e74:	00012e23          	sw	zero,28(sp)
   13e78:	00200c13          	li	s8,2
   13e7c:	1a010893          	addi	a7,sp,416
   13e80:	07800d93          	li	s11,120
   13e84:	00400f13          	li	t5,4
   13e88:	dadfd06f          	j	11c34 <_vfprintf_r+0x27c>
   13e8c:	00078713          	mv	a4,a5
   13e90:	00f887b3          	add	a5,a7,a5
   13e94:	41b78d33          	sub	s10,a5,s11
   13e98:	41970cb3          	sub	s9,a4,s9
   13e9c:	01acc463          	blt	s9,s10,13ea4 <_vfprintf_r+0x24ec>
   13ea0:	e8dfe06f          	j	12d2c <_vfprintf_r+0x1374>
   13ea4:	000c8d13          	mv	s10,s9
   13ea8:	e85fe06f          	j	12d2c <_vfprintf_r+0x1374>
   13eac:	000a8413          	mv	s0,s5
   13eb0:	db9fd06f          	j	11c68 <_vfprintf_r+0x2b0>
   13eb4:	01812783          	lw	a5,24(sp)
   13eb8:	01412683          	lw	a3,20(sp)
   13ebc:	00e12c23          	sw	a4,24(sp)
   13ec0:	0007a783          	lw	a5,0(a5)
   13ec4:	00d79023          	sh	a3,0(a5)
   13ec8:	fc0fe06f          	j	12688 <_vfprintf_r+0xcd0>
   13ecc:	0ff6f693          	zext.b	a3,a3
   13ed0:	00000613          	li	a2,0
   13ed4:	c20ff06f          	j	132f4 <_vfprintf_r+0x193c>
   13ed8:	41f85713          	srai	a4,a6,0x1f
   13edc:	00080d13          	mv	s10,a6
   13ee0:	00f12c23          	sw	a5,24(sp)
   13ee4:	00070693          	mv	a3,a4
   13ee8:	c68fe06f          	j	12350 <_vfprintf_r+0x998>
   13eec:	00f12c23          	sw	a5,24(sp)
   13ef0:	000a0e93          	mv	t4,s4
   13ef4:	00000593          	li	a1,0
   13ef8:	e4cfe06f          	j	12544 <_vfprintf_r+0xb8c>
   13efc:	0ff6fd13          	zext.b	s10,a3
   13f00:	00000713          	li	a4,0
   13f04:	000cc463          	bltz	s9,13f0c <_vfprintf_r+0x2554>
   13f08:	d84fe06f          	j	1248c <_vfprintf_r+0xad4>
   13f0c:	00f12c23          	sw	a5,24(sp)
   13f10:	954ff06f          	j	13064 <_vfprintf_r+0x16ac>
   13f14:	00100c13          	li	s8,1
   13f18:	f7cff06f          	j	13694 <_vfprintf_r+0x1cdc>
   13f1c:	04700793          	li	a5,71
   13f20:	0b714703          	lbu	a4,183(sp)
   13f24:	2fb7d6e3          	bge	a5,s11,14a10 <_vfprintf_r+0x3058>
   13f28:	000227b7          	lui	a5,0x22
   13f2c:	44478893          	addi	a7,a5,1092 # 22444 <__clzsi2+0xa4>
   13f30:	4a0714e3          	bnez	a4,14bd8 <_vfprintf_r+0x3220>
   13f34:	00300d13          	li	s10,3
   13f38:	000d0c13          	mv	s8,s10
   13f3c:	00000c93          	li	s9,0
   13f40:	02012423          	sw	zero,40(sp)
   13f44:	02012223          	sw	zero,36(sp)
   13f48:	00012e23          	sw	zero,28(sp)
   13f4c:	c95fd06f          	j	11be0 <_vfprintf_r+0x228>
   13f50:	01012583          	lw	a1,16(sp)
   13f54:	00c12503          	lw	a0,12(sp)
   13f58:	0d410613          	addi	a2,sp,212
   13f5c:	03112c23          	sw	a7,56(sp)
   13f60:	02612423          	sw	t1,40(sp)
   13f64:	03c12223          	sw	t3,36(sp)
   13f68:	58d000ef          	jal	14cf4 <__sprint_r>
   13f6c:	00050463          	beqz	a0,13f74 <_vfprintf_r+0x25bc>
   13f70:	a0dfe06f          	j	1297c <_vfprintf_r+0xfc4>
   13f74:	0bc12503          	lw	a0,188(sp)
   13f78:	0dc12603          	lw	a2,220(sp)
   13f7c:	0d812583          	lw	a1,216(sp)
   13f80:	03812883          	lw	a7,56(sp)
   13f84:	02812303          	lw	t1,40(sp)
   13f88:	02412e03          	lw	t3,36(sp)
   13f8c:	000a8413          	mv	s0,s5
   13f90:	ff5fd06f          	j	11f84 <_vfprintf_r+0x5cc>
   13f94:	01950c33          	add	s8,a0,s9
   13f98:	04700693          	li	a3,71
   13f9c:	09010593          	addi	a1,sp,144
   13fa0:	000d0513          	mv	a0,s10
   13fa4:	05112223          	sw	a7,68(sp)
   13fa8:	02d12423          	sw	a3,40(sp)
   13fac:	02612223          	sw	t1,36(sp)
   13fb0:	03c12023          	sw	t3,32(sp)
   13fb4:	0a512023          	sw	t0,160(sp)
   13fb8:	0bf12223          	sw	t6,164(sp)
   13fbc:	0be12423          	sw	t5,168(sp)
   13fc0:	0bd12623          	sw	t4,172(sp)
   13fc4:	08012823          	sw	zero,144(sp)
   13fc8:	08012a23          	sw	zero,148(sp)
   13fcc:	08012c23          	sw	zero,152(sp)
   13fd0:	08012e23          	sw	zero,156(sp)
   13fd4:	3840b0ef          	jal	1f358 <__eqtf2>
   13fd8:	02012e03          	lw	t3,32(sp)
   13fdc:	02412303          	lw	t1,36(sp)
   13fe0:	02812683          	lw	a3,40(sp)
   13fe4:	04412883          	lw	a7,68(sp)
   13fe8:	68050463          	beqz	a0,14670 <_vfprintf_r+0x2cb8>
   13fec:	0cc12783          	lw	a5,204(sp)
   13ff0:	4187f8e3          	bgeu	a5,s8,14c00 <_vfprintf_r+0x3248>
   13ff4:	03000593          	li	a1,48
   13ff8:	00178713          	addi	a4,a5,1
   13ffc:	0ce12623          	sw	a4,204(sp)
   14000:	00b78023          	sb	a1,0(a5)
   14004:	0cc12783          	lw	a5,204(sp)
   14008:	ff87e8e3          	bltu	a5,s8,13ff8 <_vfprintf_r+0x2640>
   1400c:	411787b3          	sub	a5,a5,a7
   14010:	04700713          	li	a4,71
   14014:	02f12023          	sw	a5,32(sp)
   14018:	0bc12983          	lw	s3,188(sp)
   1401c:	66e68463          	beq	a3,a4,14684 <_vfprintf_r+0x2ccc>
   14020:	04600713          	li	a4,70
   14024:	04e684e3          	beq	a3,a4,1486c <_vfprintf_r+0x2eb4>
   14028:	fff98c13          	addi	s8,s3,-1
   1402c:	0db10223          	sb	s11,196(sp)
   14030:	0b812e23          	sw	s8,188(sp)
   14034:	720c4863          	bltz	s8,14764 <_vfprintf_r+0x2dac>
   14038:	02b00693          	li	a3,43
   1403c:	0cd102a3          	sb	a3,197(sp)
   14040:	00900693          	li	a3,9
   14044:	4f86c463          	blt	a3,s8,1452c <_vfprintf_r+0x2b74>
   14048:	03000693          	li	a3,48
   1404c:	0cd10323          	sb	a3,198(sp)
   14050:	0c710693          	addi	a3,sp,199
   14054:	1a010793          	addi	a5,sp,416
   14058:	40f68633          	sub	a2,a3,a5
   1405c:	030c0713          	addi	a4,s8,48
   14060:	0dd60793          	addi	a5,a2,221
   14064:	00e68023          	sb	a4,0(a3)
   14068:	02f12e23          	sw	a5,60(sp)
   1406c:	02012783          	lw	a5,32(sp)
   14070:	03c12683          	lw	a3,60(sp)
   14074:	00100713          	li	a4,1
   14078:	00d78d33          	add	s10,a5,a3
   1407c:	16f758e3          	bge	a4,a5,149ec <_vfprintf_r+0x3034>
   14080:	02c12783          	lw	a5,44(sp)
   14084:	00fd0d33          	add	s10,s10,a5
   14088:	fffd4693          	not	a3,s10
   1408c:	bff37313          	andi	t1,t1,-1025
   14090:	41f6d693          	srai	a3,a3,0x1f
   14094:	10036313          	ori	t1,t1,256
   14098:	00dd7c33          	and	s8,s10,a3
   1409c:	02012423          	sw	zero,40(sp)
   140a0:	02012223          	sw	zero,36(sp)
   140a4:	00000993          	li	s3,0
   140a8:	d50ff06f          	j	135f8 <_vfprintf_r+0x1c40>
   140ac:	000227b7          	lui	a5,0x22
   140b0:	43878893          	addi	a7,a5,1080 # 22438 <__clzsi2+0x98>
   140b4:	8a5ff06f          	j	13958 <_vfprintf_r+0x1fa0>
   140b8:	001c8793          	addi	a5,s9,1
   140bc:	02f12023          	sw	a5,32(sp)
   140c0:	00200613          	li	a2,2
   140c4:	02012983          	lw	s3,32(sp)
   140c8:	00c12503          	lw	a0,12(sp)
   140cc:	0a010d13          	addi	s10,sp,160
   140d0:	00098693          	mv	a3,s3
   140d4:	000d0593          	mv	a1,s10
   140d8:	0cc10813          	addi	a6,sp,204
   140dc:	0c010793          	addi	a5,sp,192
   140e0:	0bc10713          	addi	a4,sp,188
   140e4:	04612a23          	sw	t1,84(sp)
   140e8:	05c12623          	sw	t3,76(sp)
   140ec:	0a512023          	sw	t0,160(sp)
   140f0:	04512423          	sw	t0,72(sp)
   140f4:	0bf12223          	sw	t6,164(sp)
   140f8:	05f12223          	sw	t6,68(sp)
   140fc:	0be12423          	sw	t5,168(sp)
   14100:	03e12423          	sw	t5,40(sp)
   14104:	0bd12623          	sw	t4,172(sp)
   14108:	03d12223          	sw	t4,36(sp)
   1410c:	6ad010ef          	jal	15fb8 <_ldtoa_r>
   14110:	fdfdf693          	andi	a3,s11,-33
   14114:	04600613          	li	a2,70
   14118:	02412e83          	lw	t4,36(sp)
   1411c:	02812f03          	lw	t5,40(sp)
   14120:	04412f83          	lw	t6,68(sp)
   14124:	04812283          	lw	t0,72(sp)
   14128:	04c12e03          	lw	t3,76(sp)
   1412c:	05412303          	lw	t1,84(sp)
   14130:	00050893          	mv	a7,a0
   14134:	01350c33          	add	s8,a0,s3
   14138:	5cc68063          	beq	a3,a2,146f8 <_vfprintf_r+0x2d40>
   1413c:	000d0513          	mv	a0,s10
   14140:	09010593          	addi	a1,sp,144
   14144:	05112223          	sw	a7,68(sp)
   14148:	02612423          	sw	t1,40(sp)
   1414c:	03c12223          	sw	t3,36(sp)
   14150:	0a512023          	sw	t0,160(sp)
   14154:	0bf12223          	sw	t6,164(sp)
   14158:	0be12423          	sw	t5,168(sp)
   1415c:	0bd12623          	sw	t4,172(sp)
   14160:	08012823          	sw	zero,144(sp)
   14164:	08012a23          	sw	zero,148(sp)
   14168:	08012c23          	sw	zero,152(sp)
   1416c:	08012e23          	sw	zero,156(sp)
   14170:	1e80b0ef          	jal	1f358 <__eqtf2>
   14174:	02412e03          	lw	t3,36(sp)
   14178:	02812303          	lw	t1,40(sp)
   1417c:	04412883          	lw	a7,68(sp)
   14180:	00050c63          	beqz	a0,14198 <_vfprintf_r+0x27e0>
   14184:	0cc12783          	lw	a5,204(sp)
   14188:	04500693          	li	a3,69
   1418c:	e787e4e3          	bltu	a5,s8,13ff4 <_vfprintf_r+0x263c>
   14190:	411787b3          	sub	a5,a5,a7
   14194:	02f12023          	sw	a5,32(sp)
   14198:	0bc12983          	lw	s3,188(sp)
   1419c:	e8dff06f          	j	14028 <_vfprintf_r+0x2670>
   141a0:	0a010d13          	addi	s10,sp,160
   141a4:	09010593          	addi	a1,sp,144
   141a8:	000d0513          	mv	a0,s10
   141ac:	0bc10613          	addi	a2,sp,188
   141b0:	05112a23          	sw	a7,84(sp)
   141b4:	04612623          	sw	t1,76(sp)
   141b8:	05c12423          	sw	t3,72(sp)
   141bc:	08512823          	sw	t0,144(sp)
   141c0:	09f12a23          	sw	t6,148(sp)
   141c4:	09e12c23          	sw	t5,152(sp)
   141c8:	09d12e23          	sw	t4,156(sp)
   141cc:	02b12023          	sw	a1,32(sp)
   141d0:	3cd010ef          	jal	15d9c <frexpl>
   141d4:	0a412503          	lw	a0,164(sp)
   141d8:	0a812603          	lw	a2,168(sp)
   141dc:	0a012803          	lw	a6,160(sp)
   141e0:	0ac12683          	lw	a3,172(sp)
   141e4:	02012583          	lw	a1,32(sp)
   141e8:	3ffc0737          	lui	a4,0x3ffc0
   141ec:	08a12a23          	sw	a0,148(sp)
   141f0:	08c12c23          	sw	a2,152(sp)
   141f4:	000d0513          	mv	a0,s10
   141f8:	08010613          	addi	a2,sp,128
   141fc:	09012823          	sw	a6,144(sp)
   14200:	08d12e23          	sw	a3,156(sp)
   14204:	08e12623          	sw	a4,140(sp)
   14208:	08012023          	sw	zero,128(sp)
   1420c:	08012223          	sw	zero,132(sp)
   14210:	08012423          	sw	zero,136(sp)
   14214:	4500b0ef          	jal	1f664 <__multf3>
   14218:	02012583          	lw	a1,32(sp)
   1421c:	0a012f03          	lw	t5,160(sp)
   14220:	0a412e83          	lw	t4,164(sp)
   14224:	0a812803          	lw	a6,168(sp)
   14228:	0ac12603          	lw	a2,172(sp)
   1422c:	000d0513          	mv	a0,s10
   14230:	04b12223          	sw	a1,68(sp)
   14234:	03e12e23          	sw	t5,60(sp)
   14238:	03d12423          	sw	t4,40(sp)
   1423c:	03012223          	sw	a6,36(sp)
   14240:	02c12023          	sw	a2,32(sp)
   14244:	08012823          	sw	zero,144(sp)
   14248:	08012a23          	sw	zero,148(sp)
   1424c:	08012c23          	sw	zero,152(sp)
   14250:	08012e23          	sw	zero,156(sp)
   14254:	1040b0ef          	jal	1f358 <__eqtf2>
   14258:	02012603          	lw	a2,32(sp)
   1425c:	02412803          	lw	a6,36(sp)
   14260:	02812e83          	lw	t4,40(sp)
   14264:	03c12f03          	lw	t5,60(sp)
   14268:	04412583          	lw	a1,68(sp)
   1426c:	04812e03          	lw	t3,72(sp)
   14270:	04c12303          	lw	t1,76(sp)
   14274:	05412883          	lw	a7,84(sp)
   14278:	00051663          	bnez	a0,14284 <_vfprintf_r+0x28cc>
   1427c:	00100713          	li	a4,1
   14280:	0ae12e23          	sw	a4,188(sp)
   14284:	06100713          	li	a4,97
   14288:	08ed8ee3          	beq	s11,a4,14b24 <_vfprintf_r+0x316c>
   1428c:	00022737          	lui	a4,0x22
   14290:	45c70793          	addi	a5,a4,1116 # 2245c <__clzsi2+0xbc>
   14294:	02f12023          	sw	a5,32(sp)
   14298:	03712423          	sw	s7,40(sp)
   1429c:	05b12223          	sw	s11,68(sp)
   142a0:	fffc8c93          	addi	s9,s9,-1
   142a4:	03c12223          	sw	t3,36(sp)
   142a8:	02812e23          	sw	s0,60(sp)
   142ac:	00088a13          	mv	s4,a7
   142b0:	04612423          	sw	t1,72(sp)
   142b4:	05112623          	sw	a7,76(sp)
   142b8:	000f0b13          	mv	s6,t5
   142bc:	000e8b93          	mv	s7,t4
   142c0:	00080c13          	mv	s8,a6
   142c4:	00060d93          	mv	s11,a2
   142c8:	00058993          	mv	s3,a1
   142cc:	03c0006f          	j	14308 <_vfprintf_r+0x2950>
   142d0:	00098593          	mv	a1,s3
   142d4:	000d0513          	mv	a0,s10
   142d8:	0b612023          	sw	s6,160(sp)
   142dc:	0b712223          	sw	s7,164(sp)
   142e0:	0b812423          	sw	s8,168(sp)
   142e4:	0bb12623          	sw	s11,172(sp)
   142e8:	08012823          	sw	zero,144(sp)
   142ec:	08012a23          	sw	zero,148(sp)
   142f0:	08012c23          	sw	zero,152(sp)
   142f4:	08012e23          	sw	zero,156(sp)
   142f8:	00fc8433          	add	s0,s9,a5
   142fc:	05c0b0ef          	jal	1f358 <__eqtf2>
   14300:	7c050263          	beqz	a0,14ac4 <_vfprintf_r+0x310c>
   14304:	00040c93          	mv	s9,s0
   14308:	400307b7          	lui	a5,0x40030
   1430c:	08010613          	addi	a2,sp,128
   14310:	00098593          	mv	a1,s3
   14314:	000d0513          	mv	a0,s10
   14318:	08f12623          	sw	a5,140(sp)
   1431c:	09612823          	sw	s6,144(sp)
   14320:	09712a23          	sw	s7,148(sp)
   14324:	09812c23          	sw	s8,152(sp)
   14328:	09b12e23          	sw	s11,156(sp)
   1432c:	08012023          	sw	zero,128(sp)
   14330:	08012223          	sw	zero,132(sp)
   14334:	08012423          	sw	zero,136(sp)
   14338:	32c0b0ef          	jal	1f664 <__multf3>
   1433c:	000d0513          	mv	a0,s10
   14340:	3410d0ef          	jal	21e80 <__fixtfsi>
   14344:	00050413          	mv	s0,a0
   14348:	00040593          	mv	a1,s0
   1434c:	000d0513          	mv	a0,s10
   14350:	0a012d83          	lw	s11,160(sp)
   14354:	0a412c03          	lw	s8,164(sp)
   14358:	0a812b83          	lw	s7,168(sp)
   1435c:	0ac12b03          	lw	s6,172(sp)
   14360:	4190d0ef          	jal	21f78 <__floatsitf>
   14364:	0a012503          	lw	a0,160(sp)
   14368:	0a412583          	lw	a1,164(sp)
   1436c:	0a812603          	lw	a2,168(sp)
   14370:	0ac12703          	lw	a4,172(sp)
   14374:	06a12823          	sw	a0,112(sp)
   14378:	06b12a23          	sw	a1,116(sp)
   1437c:	06c12c23          	sw	a2,120(sp)
   14380:	08010593          	addi	a1,sp,128
   14384:	07010613          	addi	a2,sp,112
   14388:	00098513          	mv	a0,s3
   1438c:	09b12023          	sw	s11,128(sp)
   14390:	09812223          	sw	s8,132(sp)
   14394:	09712423          	sw	s7,136(sp)
   14398:	09612623          	sw	s6,140(sp)
   1439c:	06e12e23          	sw	a4,124(sp)
   143a0:	6700c0ef          	jal	20a10 <__subtf3>
   143a4:	02012783          	lw	a5,32(sp)
   143a8:	000a0293          	mv	t0,s4
   143ac:	001a0a13          	addi	s4,s4,1
   143b0:	00878733          	add	a4,a5,s0
   143b4:	00074703          	lbu	a4,0(a4)
   143b8:	09012b03          	lw	s6,144(sp)
   143bc:	09412b83          	lw	s7,148(sp)
   143c0:	09812c03          	lw	s8,152(sp)
   143c4:	09c12d83          	lw	s11,156(sp)
   143c8:	fff00793          	li	a5,-1
   143cc:	feea0fa3          	sb	a4,-1(s4)
   143d0:	f0fc90e3          	bne	s9,a5,142d0 <_vfprintf_r+0x2918>
   143d4:	02412e03          	lw	t3,36(sp)
   143d8:	04812303          	lw	t1,72(sp)
   143dc:	04c12883          	lw	a7,76(sp)
   143e0:	000b8e93          	mv	t4,s7
   143e4:	000c0813          	mv	a6,s8
   143e8:	000d8613          	mv	a2,s11
   143ec:	00098593          	mv	a1,s3
   143f0:	3ffe0cb7          	lui	s9,0x3ffe0
   143f4:	000d0513          	mv	a0,s10
   143f8:	07c12623          	sw	t3,108(sp)
   143fc:	06512423          	sw	t0,104(sp)
   14400:	06612223          	sw	t1,100(sp)
   14404:	03112223          	sw	a7,36(sp)
   14408:	06812023          	sw	s0,96(sp)
   1440c:	0b612023          	sw	s6,160(sp)
   14410:	05612e23          	sw	s6,92(sp)
   14414:	0bd12223          	sw	t4,164(sp)
   14418:	05d12c23          	sw	t4,88(sp)
   1441c:	0b012423          	sw	a6,168(sp)
   14420:	05012a23          	sw	a6,84(sp)
   14424:	0ac12623          	sw	a2,172(sp)
   14428:	04c12623          	sw	a2,76(sp)
   1442c:	08012823          	sw	zero,144(sp)
   14430:	08012a23          	sw	zero,148(sp)
   14434:	08012c23          	sw	zero,152(sp)
   14438:	09912e23          	sw	s9,156(sp)
   1443c:	05312423          	sw	s3,72(sp)
   14440:	7e50a0ef          	jal	1f424 <__getf2>
   14444:	03c12403          	lw	s0,60(sp)
   14448:	02812b83          	lw	s7,40(sp)
   1444c:	04412d83          	lw	s11,68(sp)
   14450:	02412883          	lw	a7,36(sp)
   14454:	06412303          	lw	t1,100(sp)
   14458:	06812283          	lw	t0,104(sp)
   1445c:	06c12e03          	lw	t3,108(sp)
   14460:	000a0c13          	mv	s8,s4
   14464:	04a04063          	bgtz	a0,144a4 <_vfprintf_r+0x2aec>
   14468:	00098593          	mv	a1,s3
   1446c:	000d0513          	mv	a0,s10
   14470:	05112223          	sw	a7,68(sp)
   14474:	02612e23          	sw	t1,60(sp)
   14478:	03c12223          	sw	t3,36(sp)
   1447c:	02512423          	sw	t0,40(sp)
   14480:	6d90a0ef          	jal	1f358 <__eqtf2>
   14484:	02412e03          	lw	t3,36(sp)
   14488:	03c12303          	lw	t1,60(sp)
   1448c:	04412883          	lw	a7,68(sp)
   14490:	04051e63          	bnez	a0,144ec <_vfprintf_r+0x2b34>
   14494:	06012683          	lw	a3,96(sp)
   14498:	02812283          	lw	t0,40(sp)
   1449c:	0016f693          	andi	a3,a3,1
   144a0:	04068663          	beqz	a3,144ec <_vfprintf_r+0x2b34>
   144a4:	02012783          	lw	a5,32(sp)
   144a8:	0c512623          	sw	t0,204(sp)
   144ac:	fffc4603          	lbu	a2,-1(s8)
   144b0:	00f7c583          	lbu	a1,15(a5) # 4003000f <__BSS_END__+0x4000c5bb>
   144b4:	000c0693          	mv	a3,s8
   144b8:	02b61063          	bne	a2,a1,144d8 <_vfprintf_r+0x2b20>
   144bc:	03000513          	li	a0,48
   144c0:	fea68fa3          	sb	a0,-1(a3)
   144c4:	0cc12683          	lw	a3,204(sp)
   144c8:	fff68793          	addi	a5,a3,-1
   144cc:	0cf12623          	sw	a5,204(sp)
   144d0:	fff6c603          	lbu	a2,-1(a3)
   144d4:	feb606e3          	beq	a2,a1,144c0 <_vfprintf_r+0x2b08>
   144d8:	00160593          	addi	a1,a2,1
   144dc:	03900513          	li	a0,57
   144e0:	0ff5f593          	zext.b	a1,a1
   144e4:	12a60463          	beq	a2,a0,1460c <_vfprintf_r+0x2c54>
   144e8:	feb68fa3          	sb	a1,-1(a3)
   144ec:	0bc12683          	lw	a3,188(sp)
   144f0:	411c07b3          	sub	a5,s8,a7
   144f4:	06100593          	li	a1,97
   144f8:	fff68c13          	addi	s8,a3,-1
   144fc:	02f12023          	sw	a5,32(sp)
   14500:	0b812e23          	sw	s8,188(sp)
   14504:	07000613          	li	a2,112
   14508:	00bd8663          	beq	s11,a1,14514 <_vfprintf_r+0x2b5c>
   1450c:	05000613          	li	a2,80
   14510:	04100d93          	li	s11,65
   14514:	0cc10223          	sb	a2,196(sp)
   14518:	0c0c4463          	bltz	s8,145e0 <_vfprintf_r+0x2c28>
   1451c:	02b00693          	li	a3,43
   14520:	0cd102a3          	sb	a3,197(sp)
   14524:	00900693          	li	a3,9
   14528:	0d86d863          	bge	a3,s8,145f8 <_vfprintf_r+0x2c40>
   1452c:	0d310a13          	addi	s4,sp,211
   14530:	02812e23          	sw	s0,60(sp)
   14534:	06300993          	li	s3,99
   14538:	000c0413          	mv	s0,s8
   1453c:	03c12223          	sw	t3,36(sp)
   14540:	03712423          	sw	s7,40(sp)
   14544:	000a0b13          	mv	s6,s4
   14548:	00030c13          	mv	s8,t1
   1454c:	00088c93          	mv	s9,a7
   14550:	00a00593          	li	a1,10
   14554:	00040513          	mv	a0,s0
   14558:	6190d0ef          	jal	22370 <__modsi3>
   1455c:	03050713          	addi	a4,a0,48
   14560:	000b0d13          	mv	s10,s6
   14564:	00040513          	mv	a0,s0
   14568:	feed0fa3          	sb	a4,-1(s10)
   1456c:	00a00593          	li	a1,10
   14570:	00040b93          	mv	s7,s0
   14574:	5790d0ef          	jal	222ec <__divsi3>
   14578:	fffb0b13          	addi	s6,s6,-1
   1457c:	00050413          	mv	s0,a0
   14580:	fd79c8e3          	blt	s3,s7,14550 <_vfprintf_r+0x2b98>
   14584:	03050713          	addi	a4,a0,48
   14588:	feeb0fa3          	sb	a4,-1(s6)
   1458c:	ffed0713          	addi	a4,s10,-2
   14590:	02412e03          	lw	t3,36(sp)
   14594:	02812b83          	lw	s7,40(sp)
   14598:	03c12403          	lw	s0,60(sp)
   1459c:	000c0313          	mv	t1,s8
   145a0:	000c8893          	mv	a7,s9
   145a4:	5f477a63          	bgeu	a4,s4,14b98 <_vfprintf_r+0x31e0>
   145a8:	0c610513          	addi	a0,sp,198
   145ac:	00050693          	mv	a3,a0
   145b0:	00074783          	lbu	a5,0(a4)
   145b4:	00170713          	addi	a4,a4,1
   145b8:	00168693          	addi	a3,a3,1
   145bc:	fef68fa3          	sb	a5,-1(a3)
   145c0:	ff4718e3          	bne	a4,s4,145b0 <_vfprintf_r+0x2bf8>
   145c4:	00a70733          	add	a4,a4,a0
   145c8:	00270713          	addi	a4,a4,2
   145cc:	41a70733          	sub	a4,a4,s10
   145d0:	0c410693          	addi	a3,sp,196
   145d4:	40d707b3          	sub	a5,a4,a3
   145d8:	02f12e23          	sw	a5,60(sp)
   145dc:	a91ff06f          	j	1406c <_vfprintf_r+0x26b4>
   145e0:	00100713          	li	a4,1
   145e4:	02d00613          	li	a2,45
   145e8:	40d70c33          	sub	s8,a4,a3
   145ec:	0cc102a3          	sb	a2,197(sp)
   145f0:	00900693          	li	a3,9
   145f4:	f386cce3          	blt	a3,s8,1452c <_vfprintf_r+0x2b74>
   145f8:	0c610693          	addi	a3,sp,198
   145fc:	a59ff06f          	j	14054 <_vfprintf_r+0x269c>
   14600:	03912023          	sw	s9,32(sp)
   14604:	00300613          	li	a2,3
   14608:	abdff06f          	j	140c4 <_vfprintf_r+0x270c>
   1460c:	02012783          	lw	a5,32(sp)
   14610:	00a7c583          	lbu	a1,10(a5)
   14614:	ed5ff06f          	j	144e8 <_vfprintf_r+0x2b30>
   14618:	0b714803          	lbu	a6,183(sp)
   1461c:	00080463          	beqz	a6,14624 <_vfprintf_r+0x2c6c>
   14620:	ff1fe06f          	j	13610 <_vfprintf_r+0x1c58>
   14624:	00000c93          	li	s9,0
   14628:	be1fe06f          	j	13208 <_vfprintf_r+0x1850>
   1462c:	01c12783          	lw	a5,28(sp)
   14630:	00900693          	li	a3,9
   14634:	00f6f463          	bgeu	a3,a5,1463c <_vfprintf_r+0x2c84>
   14638:	a99fe06f          	j	130d0 <_vfprintf_r+0x1718>
   1463c:	addfe06f          	j	13118 <_vfprintf_r+0x1760>
   14640:	01012583          	lw	a1,16(sp)
   14644:	00c12503          	lw	a0,12(sp)
   14648:	0d410613          	addi	a2,sp,212
   1464c:	6a8000ef          	jal	14cf4 <__sprint_r>
   14650:	00050463          	beqz	a0,14658 <_vfprintf_r+0x2ca0>
   14654:	b28fe06f          	j	1297c <_vfprintf_r+0xfc4>
   14658:	000b4683          	lbu	a3,0(s6)
   1465c:	0dc12603          	lw	a2,220(sp)
   14660:	000a8713          	mv	a4,s5
   14664:	00700813          	li	a6,7
   14668:	00dc0c33          	add	s8,s8,a3
   1466c:	dd8ff06f          	j	13c44 <_vfprintf_r+0x228c>
   14670:	411c07b3          	sub	a5,s8,a7
   14674:	04700613          	li	a2,71
   14678:	02f12023          	sw	a5,32(sp)
   1467c:	0bc12983          	lw	s3,188(sp)
   14680:	1ec69663          	bne	a3,a2,1486c <_vfprintf_r+0x2eb4>
   14684:	ffd00713          	li	a4,-3
   14688:	0ce9c663          	blt	s3,a4,14754 <_vfprintf_r+0x2d9c>
   1468c:	033cd663          	bge	s9,s3,146b8 <_vfprintf_r+0x2d00>
   14690:	ffed8d93          	addi	s11,s11,-2
   14694:	fff98c13          	addi	s8,s3,-1
   14698:	0db10223          	sb	s11,196(sp)
   1469c:	0b812e23          	sw	s8,188(sp)
   146a0:	980c5ce3          	bgez	s8,14038 <_vfprintf_r+0x2680>
   146a4:	00100713          	li	a4,1
   146a8:	02d00693          	li	a3,45
   146ac:	41370c33          	sub	s8,a4,s3
   146b0:	0cd102a3          	sb	a3,197(sp)
   146b4:	995ff06f          	j	14048 <_vfprintf_r+0x2690>
   146b8:	02012783          	lw	a5,32(sp)
   146bc:	1ef9c463          	blt	s3,a5,148a4 <_vfprintf_r+0x2eec>
   146c0:	00137713          	andi	a4,t1,1
   146c4:	00098d13          	mv	s10,s3
   146c8:	00071463          	bnez	a4,146d0 <_vfprintf_r+0x2d18>
   146cc:	f01fe06f          	j	135cc <_vfprintf_r+0x1c14>
   146d0:	02c12783          	lw	a5,44(sp)
   146d4:	00f98d33          	add	s10,s3,a5
   146d8:	ef5fe06f          	j	135cc <_vfprintf_r+0x1c14>
   146dc:	02d00793          	li	a5,45
   146e0:	0af10ba3          	sb	a5,183(sp)
   146e4:	04700793          	li	a5,71
   146e8:	2db7de63          	bge	a5,s11,149c4 <_vfprintf_r+0x300c>
   146ec:	000227b7          	lui	a5,0x22
   146f0:	43c78893          	addi	a7,a5,1084 # 2243c <__clzsi2+0x9c>
   146f4:	b6cff06f          	j	13a60 <_vfprintf_r+0x20a8>
   146f8:	0008c583          	lbu	a1,0(a7)
   146fc:	03000613          	li	a2,48
   14700:	0ec58263          	beq	a1,a2,147e4 <_vfprintf_r+0x2e2c>
   14704:	0bc12603          	lw	a2,188(sp)
   14708:	09010593          	addi	a1,sp,144
   1470c:	00cc0c33          	add	s8,s8,a2
   14710:	891ff06f          	j	13fa0 <_vfprintf_r+0x25e8>
   14714:	01012583          	lw	a1,16(sp)
   14718:	00c12503          	lw	a0,12(sp)
   1471c:	0d410613          	addi	a2,sp,212
   14720:	03112c23          	sw	a7,56(sp)
   14724:	02612423          	sw	t1,40(sp)
   14728:	03c12223          	sw	t3,36(sp)
   1472c:	5c8000ef          	jal	14cf4 <__sprint_r>
   14730:	00050463          	beqz	a0,14738 <_vfprintf_r+0x2d80>
   14734:	a48fe06f          	j	1297c <_vfprintf_r+0xfc4>
   14738:	0bc12c83          	lw	s9,188(sp)
   1473c:	0dc12603          	lw	a2,220(sp)
   14740:	03812883          	lw	a7,56(sp)
   14744:	02812303          	lw	t1,40(sp)
   14748:	02412e03          	lw	t3,36(sp)
   1474c:	000a8413          	mv	s0,s5
   14750:	d94fe06f          	j	12ce4 <_vfprintf_r+0x132c>
   14754:	ffed8d93          	addi	s11,s11,-2
   14758:	fff98713          	addi	a4,s3,-1
   1475c:	0db10223          	sb	s11,196(sp)
   14760:	0ae12e23          	sw	a4,188(sp)
   14764:	02d00693          	li	a3,45
   14768:	00100713          	li	a4,1
   1476c:	0cd102a3          	sb	a3,197(sp)
   14770:	41370c33          	sub	s8,a4,s3
   14774:	00900693          	li	a3,9
   14778:	db86cae3          	blt	a3,s8,1452c <_vfprintf_r+0x2b74>
   1477c:	8cdff06f          	j	14048 <_vfprintf_r+0x2690>
   14780:	01312c23          	sw	s3,24(sp)
   14784:	24070663          	beqz	a4,149d0 <_vfprintf_r+0x3018>
   14788:	001c8c13          	addi	s8,s9,1 # 3ffe0001 <__BSS_END__+0x3ffbc5ad>
   1478c:	000c8d13          	mv	s10,s9
   14790:	02012423          	sw	zero,40(sp)
   14794:	00000c93          	li	s9,0
   14798:	02012223          	sw	zero,36(sp)
   1479c:	00000993          	li	s3,0
   147a0:	c40fd06f          	j	11be0 <_vfprintf_r+0x228>
   147a4:	01012583          	lw	a1,16(sp)
   147a8:	00c12503          	lw	a0,12(sp)
   147ac:	0d410613          	addi	a2,sp,212
   147b0:	02612423          	sw	t1,40(sp)
   147b4:	03c12223          	sw	t3,36(sp)
   147b8:	53c000ef          	jal	14cf4 <__sprint_r>
   147bc:	00050463          	beqz	a0,147c4 <_vfprintf_r+0x2e0c>
   147c0:	9bcfe06f          	j	1297c <_vfprintf_r+0xfc4>
   147c4:	0bc12c83          	lw	s9,188(sp)
   147c8:	02012783          	lw	a5,32(sp)
   147cc:	0dc12603          	lw	a2,220(sp)
   147d0:	02812303          	lw	t1,40(sp)
   147d4:	02412e03          	lw	t3,36(sp)
   147d8:	000a8413          	mv	s0,s5
   147dc:	41978cb3          	sub	s9,a5,s9
   147e0:	d4cfe06f          	j	12d2c <_vfprintf_r+0x1374>
   147e4:	09010593          	addi	a1,sp,144
   147e8:	000d0513          	mv	a0,s10
   147ec:	07112023          	sw	a7,96(sp)
   147f0:	04d12e23          	sw	a3,92(sp)
   147f4:	04612c23          	sw	t1,88(sp)
   147f8:	05c12a23          	sw	t3,84(sp)
   147fc:	0a512023          	sw	t0,160(sp)
   14800:	04512623          	sw	t0,76(sp)
   14804:	0bf12223          	sw	t6,164(sp)
   14808:	05f12423          	sw	t6,72(sp)
   1480c:	0be12423          	sw	t5,168(sp)
   14810:	05e12223          	sw	t5,68(sp)
   14814:	0bd12623          	sw	t4,172(sp)
   14818:	03d12423          	sw	t4,40(sp)
   1481c:	02b12223          	sw	a1,36(sp)
   14820:	08012823          	sw	zero,144(sp)
   14824:	08012a23          	sw	zero,148(sp)
   14828:	08012c23          	sw	zero,152(sp)
   1482c:	08012e23          	sw	zero,156(sp)
   14830:	3290a0ef          	jal	1f358 <__eqtf2>
   14834:	02412583          	lw	a1,36(sp)
   14838:	02812e83          	lw	t4,40(sp)
   1483c:	04412f03          	lw	t5,68(sp)
   14840:	04812f83          	lw	t6,72(sp)
   14844:	04c12283          	lw	t0,76(sp)
   14848:	05412e03          	lw	t3,84(sp)
   1484c:	05812303          	lw	t1,88(sp)
   14850:	05c12683          	lw	a3,92(sp)
   14854:	06012883          	lw	a7,96(sp)
   14858:	2a051a63          	bnez	a0,14b0c <_vfprintf_r+0x3154>
   1485c:	0bc12983          	lw	s3,188(sp)
   14860:	013c0733          	add	a4,s8,s3
   14864:	411707b3          	sub	a5,a4,a7
   14868:	02f12023          	sw	a5,32(sp)
   1486c:	00137713          	andi	a4,t1,1
   14870:	01976733          	or	a4,a4,s9
   14874:	2f305863          	blez	s3,14b64 <_vfprintf_r+0x31ac>
   14878:	22071c63          	bnez	a4,14ab0 <_vfprintf_r+0x30f8>
   1487c:	00098d13          	mv	s10,s3
   14880:	06600d93          	li	s11,102
   14884:	40037313          	andi	t1,t1,1024
   14888:	1a031063          	bnez	t1,14a28 <_vfprintf_r+0x3070>
   1488c:	fffd4693          	not	a3,s10
   14890:	41f6d693          	srai	a3,a3,0x1f
   14894:	00dd7c33          	and	s8,s10,a3
   14898:	d55fe06f          	j	135ec <_vfprintf_r+0x1c34>
   1489c:	000a0e93          	mv	t4,s4
   148a0:	f5cfe06f          	j	12ffc <_vfprintf_r+0x1644>
   148a4:	02012783          	lw	a5,32(sp)
   148a8:	02c12703          	lw	a4,44(sp)
   148ac:	06700d93          	li	s11,103
   148b0:	00e78d33          	add	s10,a5,a4
   148b4:	fd3048e3          	bgtz	s3,14884 <_vfprintf_r+0x2ecc>
   148b8:	413d0eb3          	sub	t4,s10,s3
   148bc:	001e8d13          	addi	s10,t4,1
   148c0:	fffd4693          	not	a3,s10
   148c4:	41f6d693          	srai	a3,a3,0x1f
   148c8:	00dd7c33          	and	s8,s10,a3
   148cc:	d21fe06f          	j	135ec <_vfprintf_r+0x1c34>
   148d0:	ff000713          	li	a4,-16
   148d4:	40a00cb3          	neg	s9,a0
   148d8:	2ce55663          	bge	a0,a4,14ba4 <_vfprintf_r+0x31ec>
   148dc:	00022737          	lui	a4,0x22
   148e0:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   148e4:	01000d13          	li	s10,16
   148e8:	00700d93          	li	s11,7
   148ec:	03c12223          	sw	t3,36(sp)
   148f0:	00030a13          	mv	s4,t1
   148f4:	00088b13          	mv	s6,a7
   148f8:	00070993          	mv	s3,a4
   148fc:	00c0006f          	j	14908 <_vfprintf_r+0x2f50>
   14900:	ff0c8c93          	addi	s9,s9,-16
   14904:	059d5663          	bge	s10,s9,14950 <_vfprintf_r+0x2f98>
   14908:	01060613          	addi	a2,a2,16
   1490c:	00158593          	addi	a1,a1,1
   14910:	01342023          	sw	s3,0(s0)
   14914:	01a42223          	sw	s10,4(s0)
   14918:	0cc12e23          	sw	a2,220(sp)
   1491c:	0cb12c23          	sw	a1,216(sp)
   14920:	00840413          	addi	s0,s0,8
   14924:	fcbddee3          	bge	s11,a1,14900 <_vfprintf_r+0x2f48>
   14928:	01012583          	lw	a1,16(sp)
   1492c:	00c12503          	lw	a0,12(sp)
   14930:	0d410613          	addi	a2,sp,212
   14934:	3c0000ef          	jal	14cf4 <__sprint_r>
   14938:	00050463          	beqz	a0,14940 <_vfprintf_r+0x2f88>
   1493c:	840fe06f          	j	1297c <_vfprintf_r+0xfc4>
   14940:	0dc12603          	lw	a2,220(sp)
   14944:	0d812583          	lw	a1,216(sp)
   14948:	000a8413          	mv	s0,s5
   1494c:	fb5ff06f          	j	14900 <_vfprintf_r+0x2f48>
   14950:	02412e03          	lw	t3,36(sp)
   14954:	000a0313          	mv	t1,s4
   14958:	000b0893          	mv	a7,s6
   1495c:	00098713          	mv	a4,s3
   14960:	01960633          	add	a2,a2,s9
   14964:	00158593          	addi	a1,a1,1
   14968:	00e42023          	sw	a4,0(s0)
   1496c:	0cc12e23          	sw	a2,220(sp)
   14970:	0cb12c23          	sw	a1,216(sp)
   14974:	01942223          	sw	s9,4(s0)
   14978:	00700713          	li	a4,7
   1497c:	00b74463          	blt	a4,a1,14984 <_vfprintf_r+0x2fcc>
   14980:	e81fe06f          	j	13800 <_vfprintf_r+0x1e48>
   14984:	01012583          	lw	a1,16(sp)
   14988:	00c12503          	lw	a0,12(sp)
   1498c:	0d410613          	addi	a2,sp,212
   14990:	03112c23          	sw	a7,56(sp)
   14994:	02612423          	sw	t1,40(sp)
   14998:	03c12223          	sw	t3,36(sp)
   1499c:	358000ef          	jal	14cf4 <__sprint_r>
   149a0:	00050463          	beqz	a0,149a8 <_vfprintf_r+0x2ff0>
   149a4:	fd9fd06f          	j	1297c <_vfprintf_r+0xfc4>
   149a8:	0dc12603          	lw	a2,220(sp)
   149ac:	0d812583          	lw	a1,216(sp)
   149b0:	03812883          	lw	a7,56(sp)
   149b4:	02812303          	lw	t1,40(sp)
   149b8:	02412e03          	lw	t3,36(sp)
   149bc:	000a8413          	mv	s0,s5
   149c0:	dccfd06f          	j	11f8c <_vfprintf_r+0x5d4>
   149c4:	000227b7          	lui	a5,0x22
   149c8:	43878893          	addi	a7,a5,1080 # 22438 <__clzsi2+0x98>
   149cc:	894ff06f          	j	13a60 <_vfprintf_r+0x20a8>
   149d0:	000c8d13          	mv	s10,s9
   149d4:	000c8c13          	mv	s8,s9
   149d8:	02012423          	sw	zero,40(sp)
   149dc:	00000c93          	li	s9,0
   149e0:	02012223          	sw	zero,36(sp)
   149e4:	00000993          	li	s3,0
   149e8:	9f8fd06f          	j	11be0 <_vfprintf_r+0x228>
   149ec:	00e37733          	and	a4,t1,a4
   149f0:	e8070c63          	beqz	a4,14088 <_vfprintf_r+0x26d0>
   149f4:	e8cff06f          	j	14080 <_vfprintf_r+0x26c8>
   149f8:	00012e23          	sw	zero,28(sp)
   149fc:	00600c93          	li	s9,6
   14a00:	cb0fd06f          	j	11eb0 <_vfprintf_r+0x4f8>
   14a04:	000227b7          	lui	a5,0x22
   14a08:	44078893          	addi	a7,a5,1088 # 22440 <__clzsi2+0xa0>
   14a0c:	854ff06f          	j	13a60 <_vfprintf_r+0x20a8>
   14a10:	000227b7          	lui	a5,0x22
   14a14:	44078893          	addi	a7,a5,1088 # 22440 <__clzsi2+0xa0>
   14a18:	d18ff06f          	j	13f30 <_vfprintf_r+0x2578>
   14a1c:	01012983          	lw	s3,16(sp)
   14a20:	f71fd06f          	j	12990 <_vfprintf_r+0xfd8>
   14a24:	06700d93          	li	s11,103
   14a28:	03012783          	lw	a5,48(sp)
   14a2c:	0ff00693          	li	a3,255
   14a30:	0007c703          	lbu	a4,0(a5)
   14a34:	1cd70063          	beq	a4,a3,14bf4 <_vfprintf_r+0x323c>
   14a38:	00000593          	li	a1,0
   14a3c:	00000613          	li	a2,0
   14a40:	01375e63          	bge	a4,s3,14a5c <_vfprintf_r+0x30a4>
   14a44:	40e989b3          	sub	s3,s3,a4
   14a48:	0017c703          	lbu	a4,1(a5)
   14a4c:	04070c63          	beqz	a4,14aa4 <_vfprintf_r+0x30ec>
   14a50:	00160613          	addi	a2,a2,1
   14a54:	00178793          	addi	a5,a5,1
   14a58:	fed714e3          	bne	a4,a3,14a40 <_vfprintf_r+0x3088>
   14a5c:	02f12823          	sw	a5,48(sp)
   14a60:	02c12223          	sw	a2,36(sp)
   14a64:	02b12423          	sw	a1,40(sp)
   14a68:	02812783          	lw	a5,40(sp)
   14a6c:	02412703          	lw	a4,36(sp)
   14a70:	05012583          	lw	a1,80(sp)
   14a74:	05112423          	sw	a7,72(sp)
   14a78:	00e78533          	add	a0,a5,a4
   14a7c:	05c12223          	sw	t3,68(sp)
   14a80:	0490d0ef          	jal	222c8 <__mulsi3>
   14a84:	01a50d33          	add	s10,a0,s10
   14a88:	fffd4693          	not	a3,s10
   14a8c:	41f6d693          	srai	a3,a3,0x1f
   14a90:	04412e03          	lw	t3,68(sp)
   14a94:	04812883          	lw	a7,72(sp)
   14a98:	000a0313          	mv	t1,s4
   14a9c:	00dd7c33          	and	s8,s10,a3
   14aa0:	b59fe06f          	j	135f8 <_vfprintf_r+0x1c40>
   14aa4:	0007c703          	lbu	a4,0(a5)
   14aa8:	00158593          	addi	a1,a1,1
   14aac:	fadff06f          	j	14a58 <_vfprintf_r+0x30a0>
   14ab0:	02c12783          	lw	a5,44(sp)
   14ab4:	06600d93          	li	s11,102
   14ab8:	00fc8eb3          	add	t4,s9,a5
   14abc:	013e8d33          	add	s10,t4,s3
   14ac0:	dc5ff06f          	j	14884 <_vfprintf_r+0x2ecc>
   14ac4:	02412e03          	lw	t3,36(sp)
   14ac8:	02812b83          	lw	s7,40(sp)
   14acc:	03c12403          	lw	s0,60(sp)
   14ad0:	04412d83          	lw	s11,68(sp)
   14ad4:	04812303          	lw	t1,72(sp)
   14ad8:	04c12883          	lw	a7,76(sp)
   14adc:	000a0c13          	mv	s8,s4
   14ae0:	a00cc6e3          	bltz	s9,144ec <_vfprintf_r+0x2b34>
   14ae4:	001c8613          	addi	a2,s9,1
   14ae8:	00ca0633          	add	a2,s4,a2
   14aec:	000a0693          	mv	a3,s4
   14af0:	03000593          	li	a1,48
   14af4:	00168693          	addi	a3,a3,1
   14af8:	feb68fa3          	sb	a1,-1(a3)
   14afc:	fed61ce3          	bne	a2,a3,14af4 <_vfprintf_r+0x313c>
   14b00:	019c0fb3          	add	t6,s8,s9
   14b04:	001f8c13          	addi	s8,t6,1
   14b08:	9e5ff06f          	j	144ec <_vfprintf_r+0x2b34>
   14b0c:	02012783          	lw	a5,32(sp)
   14b10:	00100613          	li	a2,1
   14b14:	40f60633          	sub	a2,a2,a5
   14b18:	0ac12e23          	sw	a2,188(sp)
   14b1c:	00cc0c33          	add	s8,s8,a2
   14b20:	c80ff06f          	j	13fa0 <_vfprintf_r+0x25e8>
   14b24:	00022737          	lui	a4,0x22
   14b28:	44870793          	addi	a5,a4,1096 # 22448 <__clzsi2+0xa8>
   14b2c:	02f12023          	sw	a5,32(sp)
   14b30:	f68ff06f          	j	14298 <_vfprintf_r+0x28e0>
   14b34:	00022737          	lui	a4,0x22
   14b38:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   14b3c:	f24fe06f          	j	13260 <_vfprintf_r+0x18a8>
   14b40:	01812783          	lw	a5,24(sp)
   14b44:	0007ac83          	lw	s9,0(a5)
   14b48:	00478793          	addi	a5,a5,4
   14b4c:	000cd463          	bgez	s9,14b54 <_vfprintf_r+0x319c>
   14b50:	fff00c93          	li	s9,-1
   14b54:	0019cd83          	lbu	s11,1(s3)
   14b58:	00f12c23          	sw	a5,24(sp)
   14b5c:	00068993          	mv	s3,a3
   14b60:	ff5fc06f          	j	11b54 <_vfprintf_r+0x19c>
   14b64:	00071a63          	bnez	a4,14b78 <_vfprintf_r+0x31c0>
   14b68:	00100c13          	li	s8,1
   14b6c:	000c0d13          	mv	s10,s8
   14b70:	06600d93          	li	s11,102
   14b74:	a79fe06f          	j	135ec <_vfprintf_r+0x1c34>
   14b78:	02c12783          	lw	a5,44(sp)
   14b7c:	06600d93          	li	s11,102
   14b80:	00178e93          	addi	t4,a5,1
   14b84:	019e8d33          	add	s10,t4,s9
   14b88:	fffd4693          	not	a3,s10
   14b8c:	41f6d693          	srai	a3,a3,0x1f
   14b90:	00dd7c33          	and	s8,s10,a3
   14b94:	a59fe06f          	j	135ec <_vfprintf_r+0x1c34>
   14b98:	00200793          	li	a5,2
   14b9c:	02f12e23          	sw	a5,60(sp)
   14ba0:	cccff06f          	j	1406c <_vfprintf_r+0x26b4>
   14ba4:	00022737          	lui	a4,0x22
   14ba8:	79870713          	addi	a4,a4,1944 # 22798 <zeroes.0>
   14bac:	db5ff06f          	j	14960 <_vfprintf_r+0x2fa8>
   14bb0:	01012983          	lw	s3,16(sp)
   14bb4:	00c9d783          	lhu	a5,12(s3)
   14bb8:	0407e793          	ori	a5,a5,64
   14bbc:	00f99623          	sh	a5,12(s3)
   14bc0:	dd1fd06f          	j	12990 <_vfprintf_r+0xfd8>
   14bc4:	00100c13          	li	s8,1
   14bc8:	00f12c23          	sw	a5,24(sp)
   14bcc:	000c0d13          	mv	s10,s8
   14bd0:	00012e23          	sw	zero,28(sp)
   14bd4:	b2dfd06f          	j	12700 <_vfprintf_r+0xd48>
   14bd8:	00000c93          	li	s9,0
   14bdc:	02012423          	sw	zero,40(sp)
   14be0:	02012223          	sw	zero,36(sp)
   14be4:	00012e23          	sw	zero,28(sp)
   14be8:	00300d13          	li	s10,3
   14bec:	00400c13          	li	s8,4
   14bf0:	ff1fc06f          	j	11be0 <_vfprintf_r+0x228>
   14bf4:	02012423          	sw	zero,40(sp)
   14bf8:	02012223          	sw	zero,36(sp)
   14bfc:	e6dff06f          	j	14a68 <_vfprintf_r+0x30b0>
   14c00:	411787b3          	sub	a5,a5,a7
   14c04:	04700713          	li	a4,71
   14c08:	02f12023          	sw	a5,32(sp)
   14c0c:	0bc12983          	lw	s3,188(sp)
   14c10:	c4e69ee3          	bne	a3,a4,1486c <_vfprintf_r+0x2eb4>
   14c14:	a71ff06f          	j	14684 <_vfprintf_r+0x2ccc>

00014c18 <vfprintf>:
   14c18:	00050713          	mv	a4,a0
   14c1c:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   14c20:	00058793          	mv	a5,a1
   14c24:	00060693          	mv	a3,a2
   14c28:	00070593          	mv	a1,a4
   14c2c:	00078613          	mv	a2,a5
   14c30:	d89fc06f          	j	119b8 <_vfprintf_r>

00014c34 <__sbprintf>:
   14c34:	00c5d783          	lhu	a5,12(a1)
   14c38:	0645ae83          	lw	t4,100(a1)
   14c3c:	00e5de03          	lhu	t3,14(a1)
   14c40:	01c5a303          	lw	t1,28(a1)
   14c44:	0245a883          	lw	a7,36(a1)
   14c48:	b8010113          	addi	sp,sp,-1152
   14c4c:	07010813          	addi	a6,sp,112
   14c50:	40000713          	li	a4,1024
   14c54:	46812c23          	sw	s0,1144(sp)
   14c58:	ffd7f793          	andi	a5,a5,-3
   14c5c:	00058413          	mv	s0,a1
   14c60:	00810593          	addi	a1,sp,8
   14c64:	46912a23          	sw	s1,1140(sp)
   14c68:	47212823          	sw	s2,1136(sp)
   14c6c:	46112e23          	sw	ra,1148(sp)
   14c70:	02012023          	sw	zero,32(sp)
   14c74:	00f11a23          	sh	a5,20(sp)
   14c78:	07d12623          	sw	t4,108(sp)
   14c7c:	01c11b23          	sh	t3,22(sp)
   14c80:	02612223          	sw	t1,36(sp)
   14c84:	03112623          	sw	a7,44(sp)
   14c88:	00050913          	mv	s2,a0
   14c8c:	01012423          	sw	a6,8(sp)
   14c90:	01012c23          	sw	a6,24(sp)
   14c94:	00e12823          	sw	a4,16(sp)
   14c98:	00e12e23          	sw	a4,28(sp)
   14c9c:	d1dfc0ef          	jal	119b8 <_vfprintf_r>
   14ca0:	00050493          	mv	s1,a0
   14ca4:	02055c63          	bgez	a0,14cdc <__sbprintf+0xa8>
   14ca8:	01415783          	lhu	a5,20(sp)
   14cac:	0407f793          	andi	a5,a5,64
   14cb0:	00078863          	beqz	a5,14cc0 <__sbprintf+0x8c>
   14cb4:	00c45783          	lhu	a5,12(s0)
   14cb8:	0407e793          	ori	a5,a5,64
   14cbc:	00f41623          	sh	a5,12(s0)
   14cc0:	47c12083          	lw	ra,1148(sp)
   14cc4:	47812403          	lw	s0,1144(sp)
   14cc8:	47012903          	lw	s2,1136(sp)
   14ccc:	00048513          	mv	a0,s1
   14cd0:	47412483          	lw	s1,1140(sp)
   14cd4:	48010113          	addi	sp,sp,1152
   14cd8:	00008067          	ret
   14cdc:	00810593          	addi	a1,sp,8
   14ce0:	00090513          	mv	a0,s2
   14ce4:	3c8000ef          	jal	150ac <_fflush_r>
   14ce8:	fc0500e3          	beqz	a0,14ca8 <__sbprintf+0x74>
   14cec:	fff00493          	li	s1,-1
   14cf0:	fb9ff06f          	j	14ca8 <__sbprintf+0x74>

00014cf4 <__sprint_r>:
   14cf4:	00862783          	lw	a5,8(a2)
   14cf8:	ff010113          	addi	sp,sp,-16
   14cfc:	00812423          	sw	s0,8(sp)
   14d00:	00112623          	sw	ra,12(sp)
   14d04:	00060413          	mv	s0,a2
   14d08:	00079e63          	bnez	a5,14d24 <__sprint_r+0x30>
   14d0c:	00c12083          	lw	ra,12(sp)
   14d10:	00042223          	sw	zero,4(s0)
   14d14:	00812403          	lw	s0,8(sp)
   14d18:	00000513          	li	a0,0
   14d1c:	01010113          	addi	sp,sp,16
   14d20:	00008067          	ret
   14d24:	46c000ef          	jal	15190 <__sfvwrite_r>
   14d28:	00c12083          	lw	ra,12(sp)
   14d2c:	00042423          	sw	zero,8(s0)
   14d30:	00042223          	sw	zero,4(s0)
   14d34:	00812403          	lw	s0,8(sp)
   14d38:	01010113          	addi	sp,sp,16
   14d3c:	00008067          	ret

00014d40 <_fclose_r>:
   14d40:	ff010113          	addi	sp,sp,-16
   14d44:	00112623          	sw	ra,12(sp)
   14d48:	01212023          	sw	s2,0(sp)
   14d4c:	02058863          	beqz	a1,14d7c <_fclose_r+0x3c>
   14d50:	00812423          	sw	s0,8(sp)
   14d54:	00912223          	sw	s1,4(sp)
   14d58:	00058413          	mv	s0,a1
   14d5c:	00050493          	mv	s1,a0
   14d60:	00050663          	beqz	a0,14d6c <_fclose_r+0x2c>
   14d64:	03452783          	lw	a5,52(a0)
   14d68:	0c078c63          	beqz	a5,14e40 <_fclose_r+0x100>
   14d6c:	00c41783          	lh	a5,12(s0)
   14d70:	02079263          	bnez	a5,14d94 <_fclose_r+0x54>
   14d74:	00812403          	lw	s0,8(sp)
   14d78:	00412483          	lw	s1,4(sp)
   14d7c:	00c12083          	lw	ra,12(sp)
   14d80:	00000913          	li	s2,0
   14d84:	00090513          	mv	a0,s2
   14d88:	00012903          	lw	s2,0(sp)
   14d8c:	01010113          	addi	sp,sp,16
   14d90:	00008067          	ret
   14d94:	00040593          	mv	a1,s0
   14d98:	00048513          	mv	a0,s1
   14d9c:	0b8000ef          	jal	14e54 <__sflush_r>
   14da0:	02c42783          	lw	a5,44(s0)
   14da4:	00050913          	mv	s2,a0
   14da8:	00078a63          	beqz	a5,14dbc <_fclose_r+0x7c>
   14dac:	01c42583          	lw	a1,28(s0)
   14db0:	00048513          	mv	a0,s1
   14db4:	000780e7          	jalr	a5
   14db8:	06054463          	bltz	a0,14e20 <_fclose_r+0xe0>
   14dbc:	00c45783          	lhu	a5,12(s0)
   14dc0:	0807f793          	andi	a5,a5,128
   14dc4:	06079663          	bnez	a5,14e30 <_fclose_r+0xf0>
   14dc8:	03042583          	lw	a1,48(s0)
   14dcc:	00058c63          	beqz	a1,14de4 <_fclose_r+0xa4>
   14dd0:	04040793          	addi	a5,s0,64
   14dd4:	00f58663          	beq	a1,a5,14de0 <_fclose_r+0xa0>
   14dd8:	00048513          	mv	a0,s1
   14ddc:	8dcfc0ef          	jal	10eb8 <_free_r>
   14de0:	02042823          	sw	zero,48(s0)
   14de4:	04442583          	lw	a1,68(s0)
   14de8:	00058863          	beqz	a1,14df8 <_fclose_r+0xb8>
   14dec:	00048513          	mv	a0,s1
   14df0:	8c8fc0ef          	jal	10eb8 <_free_r>
   14df4:	04042223          	sw	zero,68(s0)
   14df8:	f64fb0ef          	jal	1055c <__sfp_lock_acquire>
   14dfc:	00041623          	sh	zero,12(s0)
   14e00:	f60fb0ef          	jal	10560 <__sfp_lock_release>
   14e04:	00c12083          	lw	ra,12(sp)
   14e08:	00812403          	lw	s0,8(sp)
   14e0c:	00412483          	lw	s1,4(sp)
   14e10:	00090513          	mv	a0,s2
   14e14:	00012903          	lw	s2,0(sp)
   14e18:	01010113          	addi	sp,sp,16
   14e1c:	00008067          	ret
   14e20:	00c45783          	lhu	a5,12(s0)
   14e24:	fff00913          	li	s2,-1
   14e28:	0807f793          	andi	a5,a5,128
   14e2c:	f8078ee3          	beqz	a5,14dc8 <_fclose_r+0x88>
   14e30:	01042583          	lw	a1,16(s0)
   14e34:	00048513          	mv	a0,s1
   14e38:	880fc0ef          	jal	10eb8 <_free_r>
   14e3c:	f8dff06f          	j	14dc8 <_fclose_r+0x88>
   14e40:	ef8fb0ef          	jal	10538 <__sinit>
   14e44:	f29ff06f          	j	14d6c <_fclose_r+0x2c>

00014e48 <fclose>:
   14e48:	00050593          	mv	a1,a0
   14e4c:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   14e50:	ef1ff06f          	j	14d40 <_fclose_r>

00014e54 <__sflush_r>:
   14e54:	00c59703          	lh	a4,12(a1)
   14e58:	fe010113          	addi	sp,sp,-32
   14e5c:	00812c23          	sw	s0,24(sp)
   14e60:	01312623          	sw	s3,12(sp)
   14e64:	00112e23          	sw	ra,28(sp)
   14e68:	00877793          	andi	a5,a4,8
   14e6c:	00058413          	mv	s0,a1
   14e70:	00050993          	mv	s3,a0
   14e74:	12079063          	bnez	a5,14f94 <__sflush_r+0x140>
   14e78:	000017b7          	lui	a5,0x1
   14e7c:	80078793          	addi	a5,a5,-2048 # 800 <exit-0xf8b4>
   14e80:	0045a683          	lw	a3,4(a1)
   14e84:	00f767b3          	or	a5,a4,a5
   14e88:	00f59623          	sh	a5,12(a1)
   14e8c:	18d05a63          	blez	a3,15020 <__sflush_r+0x1cc>
   14e90:	02842803          	lw	a6,40(s0)
   14e94:	0e080463          	beqz	a6,14f7c <__sflush_r+0x128>
   14e98:	00912a23          	sw	s1,20(sp)
   14e9c:	01371693          	slli	a3,a4,0x13
   14ea0:	0009a483          	lw	s1,0(s3)
   14ea4:	0009a023          	sw	zero,0(s3)
   14ea8:	1806c863          	bltz	a3,15038 <__sflush_r+0x1e4>
   14eac:	01c42583          	lw	a1,28(s0)
   14eb0:	00000613          	li	a2,0
   14eb4:	00100693          	li	a3,1
   14eb8:	00098513          	mv	a0,s3
   14ebc:	000800e7          	jalr	a6
   14ec0:	fff00793          	li	a5,-1
   14ec4:	00050613          	mv	a2,a0
   14ec8:	1af50a63          	beq	a0,a5,1507c <__sflush_r+0x228>
   14ecc:	00c41783          	lh	a5,12(s0)
   14ed0:	02842803          	lw	a6,40(s0)
   14ed4:	0047f793          	andi	a5,a5,4
   14ed8:	00078e63          	beqz	a5,14ef4 <__sflush_r+0xa0>
   14edc:	00442703          	lw	a4,4(s0)
   14ee0:	03042783          	lw	a5,48(s0)
   14ee4:	40e60633          	sub	a2,a2,a4
   14ee8:	00078663          	beqz	a5,14ef4 <__sflush_r+0xa0>
   14eec:	03c42783          	lw	a5,60(s0)
   14ef0:	40f60633          	sub	a2,a2,a5
   14ef4:	01c42583          	lw	a1,28(s0)
   14ef8:	00000693          	li	a3,0
   14efc:	00098513          	mv	a0,s3
   14f00:	000800e7          	jalr	a6
   14f04:	fff00713          	li	a4,-1
   14f08:	00c41783          	lh	a5,12(s0)
   14f0c:	12e51a63          	bne	a0,a4,15040 <__sflush_r+0x1ec>
   14f10:	0009a683          	lw	a3,0(s3)
   14f14:	01d00713          	li	a4,29
   14f18:	18d76063          	bltu	a4,a3,15098 <__sflush_r+0x244>
   14f1c:	20400737          	lui	a4,0x20400
   14f20:	00170713          	addi	a4,a4,1 # 20400001 <__BSS_END__+0x203dc5ad>
   14f24:	00d75733          	srl	a4,a4,a3
   14f28:	00177713          	andi	a4,a4,1
   14f2c:	16070663          	beqz	a4,15098 <__sflush_r+0x244>
   14f30:	01042603          	lw	a2,16(s0)
   14f34:	fffff737          	lui	a4,0xfffff
   14f38:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffdbdab>
   14f3c:	00e7f733          	and	a4,a5,a4
   14f40:	00e41623          	sh	a4,12(s0)
   14f44:	00042223          	sw	zero,4(s0)
   14f48:	00c42023          	sw	a2,0(s0)
   14f4c:	01379713          	slli	a4,a5,0x13
   14f50:	00075463          	bgez	a4,14f58 <__sflush_r+0x104>
   14f54:	10068863          	beqz	a3,15064 <__sflush_r+0x210>
   14f58:	03042583          	lw	a1,48(s0)
   14f5c:	0099a023          	sw	s1,0(s3)
   14f60:	10058a63          	beqz	a1,15074 <__sflush_r+0x220>
   14f64:	04040793          	addi	a5,s0,64
   14f68:	00f58663          	beq	a1,a5,14f74 <__sflush_r+0x120>
   14f6c:	00098513          	mv	a0,s3
   14f70:	f49fb0ef          	jal	10eb8 <_free_r>
   14f74:	01412483          	lw	s1,20(sp)
   14f78:	02042823          	sw	zero,48(s0)
   14f7c:	01c12083          	lw	ra,28(sp)
   14f80:	01812403          	lw	s0,24(sp)
   14f84:	00c12983          	lw	s3,12(sp)
   14f88:	00000513          	li	a0,0
   14f8c:	02010113          	addi	sp,sp,32
   14f90:	00008067          	ret
   14f94:	01212823          	sw	s2,16(sp)
   14f98:	0105a903          	lw	s2,16(a1)
   14f9c:	08090a63          	beqz	s2,15030 <__sflush_r+0x1dc>
   14fa0:	00912a23          	sw	s1,20(sp)
   14fa4:	0005a483          	lw	s1,0(a1)
   14fa8:	00377713          	andi	a4,a4,3
   14fac:	0125a023          	sw	s2,0(a1)
   14fb0:	412484b3          	sub	s1,s1,s2
   14fb4:	00000793          	li	a5,0
   14fb8:	00071463          	bnez	a4,14fc0 <__sflush_r+0x16c>
   14fbc:	0145a783          	lw	a5,20(a1)
   14fc0:	00f42423          	sw	a5,8(s0)
   14fc4:	00904863          	bgtz	s1,14fd4 <__sflush_r+0x180>
   14fc8:	0640006f          	j	1502c <__sflush_r+0x1d8>
   14fcc:	00a90933          	add	s2,s2,a0
   14fd0:	04905e63          	blez	s1,1502c <__sflush_r+0x1d8>
   14fd4:	02442783          	lw	a5,36(s0)
   14fd8:	01c42583          	lw	a1,28(s0)
   14fdc:	00048693          	mv	a3,s1
   14fe0:	00090613          	mv	a2,s2
   14fe4:	00098513          	mv	a0,s3
   14fe8:	000780e7          	jalr	a5
   14fec:	40a484b3          	sub	s1,s1,a0
   14ff0:	fca04ee3          	bgtz	a0,14fcc <__sflush_r+0x178>
   14ff4:	00c41783          	lh	a5,12(s0)
   14ff8:	01012903          	lw	s2,16(sp)
   14ffc:	0407e793          	ori	a5,a5,64
   15000:	01c12083          	lw	ra,28(sp)
   15004:	00f41623          	sh	a5,12(s0)
   15008:	01812403          	lw	s0,24(sp)
   1500c:	01412483          	lw	s1,20(sp)
   15010:	00c12983          	lw	s3,12(sp)
   15014:	fff00513          	li	a0,-1
   15018:	02010113          	addi	sp,sp,32
   1501c:	00008067          	ret
   15020:	03c5a683          	lw	a3,60(a1)
   15024:	e6d046e3          	bgtz	a3,14e90 <__sflush_r+0x3c>
   15028:	f55ff06f          	j	14f7c <__sflush_r+0x128>
   1502c:	01412483          	lw	s1,20(sp)
   15030:	01012903          	lw	s2,16(sp)
   15034:	f49ff06f          	j	14f7c <__sflush_r+0x128>
   15038:	05042603          	lw	a2,80(s0)
   1503c:	e99ff06f          	j	14ed4 <__sflush_r+0x80>
   15040:	01042683          	lw	a3,16(s0)
   15044:	fffff737          	lui	a4,0xfffff
   15048:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffdbdab>
   1504c:	00e7f733          	and	a4,a5,a4
   15050:	00e41623          	sh	a4,12(s0)
   15054:	00042223          	sw	zero,4(s0)
   15058:	00d42023          	sw	a3,0(s0)
   1505c:	01379713          	slli	a4,a5,0x13
   15060:	ee075ce3          	bgez	a4,14f58 <__sflush_r+0x104>
   15064:	03042583          	lw	a1,48(s0)
   15068:	04a42823          	sw	a0,80(s0)
   1506c:	0099a023          	sw	s1,0(s3)
   15070:	ee059ae3          	bnez	a1,14f64 <__sflush_r+0x110>
   15074:	01412483          	lw	s1,20(sp)
   15078:	f05ff06f          	j	14f7c <__sflush_r+0x128>
   1507c:	0009a783          	lw	a5,0(s3)
   15080:	e40786e3          	beqz	a5,14ecc <__sflush_r+0x78>
   15084:	01d00713          	li	a4,29
   15088:	00e78c63          	beq	a5,a4,150a0 <__sflush_r+0x24c>
   1508c:	01600713          	li	a4,22
   15090:	00e78863          	beq	a5,a4,150a0 <__sflush_r+0x24c>
   15094:	00c41783          	lh	a5,12(s0)
   15098:	0407e793          	ori	a5,a5,64
   1509c:	f65ff06f          	j	15000 <__sflush_r+0x1ac>
   150a0:	0099a023          	sw	s1,0(s3)
   150a4:	01412483          	lw	s1,20(sp)
   150a8:	ed5ff06f          	j	14f7c <__sflush_r+0x128>

000150ac <_fflush_r>:
   150ac:	fe010113          	addi	sp,sp,-32
   150b0:	00812c23          	sw	s0,24(sp)
   150b4:	00112e23          	sw	ra,28(sp)
   150b8:	00050413          	mv	s0,a0
   150bc:	00050663          	beqz	a0,150c8 <_fflush_r+0x1c>
   150c0:	03452783          	lw	a5,52(a0)
   150c4:	02078a63          	beqz	a5,150f8 <_fflush_r+0x4c>
   150c8:	00c59783          	lh	a5,12(a1)
   150cc:	00079c63          	bnez	a5,150e4 <_fflush_r+0x38>
   150d0:	01c12083          	lw	ra,28(sp)
   150d4:	01812403          	lw	s0,24(sp)
   150d8:	00000513          	li	a0,0
   150dc:	02010113          	addi	sp,sp,32
   150e0:	00008067          	ret
   150e4:	00040513          	mv	a0,s0
   150e8:	01812403          	lw	s0,24(sp)
   150ec:	01c12083          	lw	ra,28(sp)
   150f0:	02010113          	addi	sp,sp,32
   150f4:	d61ff06f          	j	14e54 <__sflush_r>
   150f8:	00b12623          	sw	a1,12(sp)
   150fc:	c3cfb0ef          	jal	10538 <__sinit>
   15100:	00c12583          	lw	a1,12(sp)
   15104:	fc5ff06f          	j	150c8 <_fflush_r+0x1c>

00015108 <fflush>:
   15108:	06050063          	beqz	a0,15168 <fflush+0x60>
   1510c:	00050593          	mv	a1,a0
   15110:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   15114:	00050663          	beqz	a0,15120 <fflush+0x18>
   15118:	03452783          	lw	a5,52(a0)
   1511c:	00078c63          	beqz	a5,15134 <fflush+0x2c>
   15120:	00c59783          	lh	a5,12(a1)
   15124:	00079663          	bnez	a5,15130 <fflush+0x28>
   15128:	00000513          	li	a0,0
   1512c:	00008067          	ret
   15130:	d25ff06f          	j	14e54 <__sflush_r>
   15134:	fe010113          	addi	sp,sp,-32
   15138:	00b12623          	sw	a1,12(sp)
   1513c:	00a12423          	sw	a0,8(sp)
   15140:	00112e23          	sw	ra,28(sp)
   15144:	bf4fb0ef          	jal	10538 <__sinit>
   15148:	00c12583          	lw	a1,12(sp)
   1514c:	00812503          	lw	a0,8(sp)
   15150:	00c59783          	lh	a5,12(a1)
   15154:	02079863          	bnez	a5,15184 <fflush+0x7c>
   15158:	01c12083          	lw	ra,28(sp)
   1515c:	00000513          	li	a0,0
   15160:	02010113          	addi	sp,sp,32
   15164:	00008067          	ret
   15168:	00023637          	lui	a2,0x23
   1516c:	000155b7          	lui	a1,0x15
   15170:	00023537          	lui	a0,0x23
   15174:	01060613          	addi	a2,a2,16 # 23010 <__sglue>
   15178:	0ac58593          	addi	a1,a1,172 # 150ac <_fflush_r>
   1517c:	02050513          	addi	a0,a0,32 # 23020 <_impure_data>
   15180:	c14fb06f          	j	10594 <_fwalk_sglue>
   15184:	01c12083          	lw	ra,28(sp)
   15188:	02010113          	addi	sp,sp,32
   1518c:	cc9ff06f          	j	14e54 <__sflush_r>

00015190 <__sfvwrite_r>:
   15190:	00862783          	lw	a5,8(a2)
   15194:	24078263          	beqz	a5,153d8 <__sfvwrite_r+0x248>
   15198:	00c59703          	lh	a4,12(a1)
   1519c:	fd010113          	addi	sp,sp,-48
   151a0:	02812423          	sw	s0,40(sp)
   151a4:	01412c23          	sw	s4,24(sp)
   151a8:	01512a23          	sw	s5,20(sp)
   151ac:	02112623          	sw	ra,44(sp)
   151b0:	00877793          	andi	a5,a4,8
   151b4:	00060a13          	mv	s4,a2
   151b8:	00050a93          	mv	s5,a0
   151bc:	00058413          	mv	s0,a1
   151c0:	0a078463          	beqz	a5,15268 <__sfvwrite_r+0xd8>
   151c4:	0105a783          	lw	a5,16(a1)
   151c8:	0a078063          	beqz	a5,15268 <__sfvwrite_r+0xd8>
   151cc:	02912223          	sw	s1,36(sp)
   151d0:	03212023          	sw	s2,32(sp)
   151d4:	01312e23          	sw	s3,28(sp)
   151d8:	01612823          	sw	s6,16(sp)
   151dc:	00277793          	andi	a5,a4,2
   151e0:	000a2483          	lw	s1,0(s4)
   151e4:	0a078a63          	beqz	a5,15298 <__sfvwrite_r+0x108>
   151e8:	80000b37          	lui	s6,0x80000
   151ec:	c00b0b13          	addi	s6,s6,-1024 # 7ffffc00 <__BSS_END__+0x7ffdc1ac>
   151f0:	00000993          	li	s3,0
   151f4:	00000913          	li	s2,0
   151f8:	00098613          	mv	a2,s3
   151fc:	000a8513          	mv	a0,s5
   15200:	1c090463          	beqz	s2,153c8 <__sfvwrite_r+0x238>
   15204:	800007b7          	lui	a5,0x80000
   15208:	00090693          	mv	a3,s2
   1520c:	012b7463          	bgeu	s6,s2,15214 <__sfvwrite_r+0x84>
   15210:	c0078693          	addi	a3,a5,-1024 # 7ffffc00 <__BSS_END__+0x7ffdc1ac>
   15214:	02442783          	lw	a5,36(s0)
   15218:	01c42583          	lw	a1,28(s0)
   1521c:	000780e7          	jalr	a5
   15220:	42a05a63          	blez	a0,15654 <__sfvwrite_r+0x4c4>
   15224:	008a2783          	lw	a5,8(s4)
   15228:	00a989b3          	add	s3,s3,a0
   1522c:	40a90933          	sub	s2,s2,a0
   15230:	40a787b3          	sub	a5,a5,a0
   15234:	00fa2423          	sw	a5,8(s4)
   15238:	fc0790e3          	bnez	a5,151f8 <__sfvwrite_r+0x68>
   1523c:	02412483          	lw	s1,36(sp)
   15240:	02012903          	lw	s2,32(sp)
   15244:	01c12983          	lw	s3,28(sp)
   15248:	01012b03          	lw	s6,16(sp)
   1524c:	00000513          	li	a0,0
   15250:	02c12083          	lw	ra,44(sp)
   15254:	02812403          	lw	s0,40(sp)
   15258:	01812a03          	lw	s4,24(sp)
   1525c:	01412a83          	lw	s5,20(sp)
   15260:	03010113          	addi	sp,sp,48
   15264:	00008067          	ret
   15268:	00040593          	mv	a1,s0
   1526c:	000a8513          	mv	a0,s5
   15270:	408000ef          	jal	15678 <__swsetup_r>
   15274:	28051063          	bnez	a0,154f4 <__sfvwrite_r+0x364>
   15278:	00c41703          	lh	a4,12(s0)
   1527c:	02912223          	sw	s1,36(sp)
   15280:	03212023          	sw	s2,32(sp)
   15284:	01312e23          	sw	s3,28(sp)
   15288:	01612823          	sw	s6,16(sp)
   1528c:	00277793          	andi	a5,a4,2
   15290:	000a2483          	lw	s1,0(s4)
   15294:	f4079ae3          	bnez	a5,151e8 <__sfvwrite_r+0x58>
   15298:	01712623          	sw	s7,12(sp)
   1529c:	01812423          	sw	s8,8(sp)
   152a0:	00177793          	andi	a5,a4,1
   152a4:	12079e63          	bnez	a5,153e0 <__sfvwrite_r+0x250>
   152a8:	80000bb7          	lui	s7,0x80000
   152ac:	01912223          	sw	s9,4(sp)
   152b0:	fffb8b93          	addi	s7,s7,-1 # 7fffffff <__BSS_END__+0x7ffdc5ab>
   152b4:	00000b13          	li	s6,0
   152b8:	00000913          	li	s2,0
   152bc:	0e090e63          	beqz	s2,153b8 <__sfvwrite_r+0x228>
   152c0:	20077793          	andi	a5,a4,512
   152c4:	00042503          	lw	a0,0(s0)
   152c8:	00842c03          	lw	s8,8(s0)
   152cc:	22078863          	beqz	a5,154fc <__sfvwrite_r+0x36c>
   152d0:	000c0c93          	mv	s9,s8
   152d4:	2f896663          	bltu	s2,s8,155c0 <__sfvwrite_r+0x430>
   152d8:	48077793          	andi	a5,a4,1152
   152dc:	08078a63          	beqz	a5,15370 <__sfvwrite_r+0x1e0>
   152e0:	01442683          	lw	a3,20(s0)
   152e4:	01042583          	lw	a1,16(s0)
   152e8:	00169793          	slli	a5,a3,0x1
   152ec:	00d787b3          	add	a5,a5,a3
   152f0:	01f7d993          	srli	s3,a5,0x1f
   152f4:	40b50c33          	sub	s8,a0,a1
   152f8:	00f989b3          	add	s3,s3,a5
   152fc:	001c0793          	addi	a5,s8,1
   15300:	4019d993          	srai	s3,s3,0x1
   15304:	012787b3          	add	a5,a5,s2
   15308:	00098613          	mv	a2,s3
   1530c:	00f9f663          	bgeu	s3,a5,15318 <__sfvwrite_r+0x188>
   15310:	00078993          	mv	s3,a5
   15314:	00078613          	mv	a2,a5
   15318:	40077713          	andi	a4,a4,1024
   1531c:	2e070863          	beqz	a4,1560c <__sfvwrite_r+0x47c>
   15320:	00060593          	mv	a1,a2
   15324:	000a8513          	mv	a0,s5
   15328:	e81fb0ef          	jal	111a8 <_malloc_r>
   1532c:	00050c93          	mv	s9,a0
   15330:	32050663          	beqz	a0,1565c <__sfvwrite_r+0x4cc>
   15334:	01042583          	lw	a1,16(s0)
   15338:	000c0613          	mv	a2,s8
   1533c:	0ad000ef          	jal	15be8 <memcpy>
   15340:	00c45783          	lhu	a5,12(s0)
   15344:	b7f7f793          	andi	a5,a5,-1153
   15348:	0807e793          	ori	a5,a5,128
   1534c:	00f41623          	sh	a5,12(s0)
   15350:	018c8533          	add	a0,s9,s8
   15354:	41898c33          	sub	s8,s3,s8
   15358:	01942823          	sw	s9,16(s0)
   1535c:	01842423          	sw	s8,8(s0)
   15360:	00a42023          	sw	a0,0(s0)
   15364:	01342a23          	sw	s3,20(s0)
   15368:	00090c13          	mv	s8,s2
   1536c:	00090c93          	mv	s9,s2
   15370:	000b0593          	mv	a1,s6
   15374:	000c8613          	mv	a2,s9
   15378:	748000ef          	jal	15ac0 <memmove>
   1537c:	00042783          	lw	a5,0(s0)
   15380:	00842703          	lw	a4,8(s0)
   15384:	00090993          	mv	s3,s2
   15388:	019787b3          	add	a5,a5,s9
   1538c:	00f42023          	sw	a5,0(s0)
   15390:	008a2783          	lw	a5,8(s4)
   15394:	41870733          	sub	a4,a4,s8
   15398:	00e42423          	sw	a4,8(s0)
   1539c:	413787b3          	sub	a5,a5,s3
   153a0:	00fa2423          	sw	a5,8(s4)
   153a4:	00000913          	li	s2,0
   153a8:	013b0b33          	add	s6,s6,s3
   153ac:	1a078663          	beqz	a5,15558 <__sfvwrite_r+0x3c8>
   153b0:	00c41703          	lh	a4,12(s0)
   153b4:	f00916e3          	bnez	s2,152c0 <__sfvwrite_r+0x130>
   153b8:	0004ab03          	lw	s6,0(s1)
   153bc:	0044a903          	lw	s2,4(s1)
   153c0:	00848493          	addi	s1,s1,8
   153c4:	ef9ff06f          	j	152bc <__sfvwrite_r+0x12c>
   153c8:	0004a983          	lw	s3,0(s1)
   153cc:	0044a903          	lw	s2,4(s1)
   153d0:	00848493          	addi	s1,s1,8
   153d4:	e25ff06f          	j	151f8 <__sfvwrite_r+0x68>
   153d8:	00000513          	li	a0,0
   153dc:	00008067          	ret
   153e0:	00000b13          	li	s6,0
   153e4:	00000513          	li	a0,0
   153e8:	00000c13          	li	s8,0
   153ec:	00000993          	li	s3,0
   153f0:	08098263          	beqz	s3,15474 <__sfvwrite_r+0x2e4>
   153f4:	08050a63          	beqz	a0,15488 <__sfvwrite_r+0x2f8>
   153f8:	000b0793          	mv	a5,s6
   153fc:	00098b93          	mv	s7,s3
   15400:	0137f463          	bgeu	a5,s3,15408 <__sfvwrite_r+0x278>
   15404:	00078b93          	mv	s7,a5
   15408:	00042503          	lw	a0,0(s0)
   1540c:	01042783          	lw	a5,16(s0)
   15410:	01442683          	lw	a3,20(s0)
   15414:	00a7f863          	bgeu	a5,a0,15424 <__sfvwrite_r+0x294>
   15418:	00842903          	lw	s2,8(s0)
   1541c:	01268933          	add	s2,a3,s2
   15420:	09794463          	blt	s2,s7,154a8 <__sfvwrite_r+0x318>
   15424:	1adbce63          	blt	s7,a3,155e0 <__sfvwrite_r+0x450>
   15428:	02442783          	lw	a5,36(s0)
   1542c:	01c42583          	lw	a1,28(s0)
   15430:	000c0613          	mv	a2,s8
   15434:	000a8513          	mv	a0,s5
   15438:	000780e7          	jalr	a5
   1543c:	00050913          	mv	s2,a0
   15440:	08a05863          	blez	a0,154d0 <__sfvwrite_r+0x340>
   15444:	412b0b33          	sub	s6,s6,s2
   15448:	00100513          	li	a0,1
   1544c:	180b0063          	beqz	s6,155cc <__sfvwrite_r+0x43c>
   15450:	008a2783          	lw	a5,8(s4)
   15454:	012c0c33          	add	s8,s8,s2
   15458:	412989b3          	sub	s3,s3,s2
   1545c:	412787b3          	sub	a5,a5,s2
   15460:	00fa2423          	sw	a5,8(s4)
   15464:	f80796e3          	bnez	a5,153f0 <__sfvwrite_r+0x260>
   15468:	00c12b83          	lw	s7,12(sp)
   1546c:	00812c03          	lw	s8,8(sp)
   15470:	dcdff06f          	j	1523c <__sfvwrite_r+0xac>
   15474:	0044a983          	lw	s3,4(s1)
   15478:	00048793          	mv	a5,s1
   1547c:	00848493          	addi	s1,s1,8
   15480:	fe098ae3          	beqz	s3,15474 <__sfvwrite_r+0x2e4>
   15484:	0007ac03          	lw	s8,0(a5)
   15488:	00098613          	mv	a2,s3
   1548c:	00a00593          	li	a1,10
   15490:	000c0513          	mv	a0,s8
   15494:	388000ef          	jal	1581c <memchr>
   15498:	1a050863          	beqz	a0,15648 <__sfvwrite_r+0x4b8>
   1549c:	00150513          	addi	a0,a0,1
   154a0:	41850b33          	sub	s6,a0,s8
   154a4:	f55ff06f          	j	153f8 <__sfvwrite_r+0x268>
   154a8:	000c0593          	mv	a1,s8
   154ac:	00090613          	mv	a2,s2
   154b0:	610000ef          	jal	15ac0 <memmove>
   154b4:	00042783          	lw	a5,0(s0)
   154b8:	00040593          	mv	a1,s0
   154bc:	000a8513          	mv	a0,s5
   154c0:	012787b3          	add	a5,a5,s2
   154c4:	00f42023          	sw	a5,0(s0)
   154c8:	be5ff0ef          	jal	150ac <_fflush_r>
   154cc:	f6050ce3          	beqz	a0,15444 <__sfvwrite_r+0x2b4>
   154d0:	00c41783          	lh	a5,12(s0)
   154d4:	00c12b83          	lw	s7,12(sp)
   154d8:	00812c03          	lw	s8,8(sp)
   154dc:	02412483          	lw	s1,36(sp)
   154e0:	02012903          	lw	s2,32(sp)
   154e4:	01c12983          	lw	s3,28(sp)
   154e8:	01012b03          	lw	s6,16(sp)
   154ec:	0407e793          	ori	a5,a5,64
   154f0:	00f41623          	sh	a5,12(s0)
   154f4:	fff00513          	li	a0,-1
   154f8:	d59ff06f          	j	15250 <__sfvwrite_r+0xc0>
   154fc:	01042783          	lw	a5,16(s0)
   15500:	06a7e463          	bltu	a5,a0,15568 <__sfvwrite_r+0x3d8>
   15504:	01442583          	lw	a1,20(s0)
   15508:	06b96063          	bltu	s2,a1,15568 <__sfvwrite_r+0x3d8>
   1550c:	00090993          	mv	s3,s2
   15510:	012bf463          	bgeu	s7,s2,15518 <__sfvwrite_r+0x388>
   15514:	000b8993          	mv	s3,s7
   15518:	00098513          	mv	a0,s3
   1551c:	6550c0ef          	jal	22370 <__modsi3>
   15520:	02442783          	lw	a5,36(s0)
   15524:	01c42583          	lw	a1,28(s0)
   15528:	40a986b3          	sub	a3,s3,a0
   1552c:	000b0613          	mv	a2,s6
   15530:	000a8513          	mv	a0,s5
   15534:	000780e7          	jalr	a5
   15538:	00050993          	mv	s3,a0
   1553c:	06a05863          	blez	a0,155ac <__sfvwrite_r+0x41c>
   15540:	008a2783          	lw	a5,8(s4)
   15544:	41390933          	sub	s2,s2,s3
   15548:	013b0b33          	add	s6,s6,s3
   1554c:	413787b3          	sub	a5,a5,s3
   15550:	00fa2423          	sw	a5,8(s4)
   15554:	e4079ee3          	bnez	a5,153b0 <__sfvwrite_r+0x220>
   15558:	00c12b83          	lw	s7,12(sp)
   1555c:	00812c03          	lw	s8,8(sp)
   15560:	00412c83          	lw	s9,4(sp)
   15564:	cd9ff06f          	j	1523c <__sfvwrite_r+0xac>
   15568:	000c0993          	mv	s3,s8
   1556c:	01897463          	bgeu	s2,s8,15574 <__sfvwrite_r+0x3e4>
   15570:	00090993          	mv	s3,s2
   15574:	00098613          	mv	a2,s3
   15578:	000b0593          	mv	a1,s6
   1557c:	544000ef          	jal	15ac0 <memmove>
   15580:	00042703          	lw	a4,0(s0)
   15584:	00842783          	lw	a5,8(s0)
   15588:	01370733          	add	a4,a4,s3
   1558c:	413787b3          	sub	a5,a5,s3
   15590:	00e42023          	sw	a4,0(s0)
   15594:	00f42423          	sw	a5,8(s0)
   15598:	fa0794e3          	bnez	a5,15540 <__sfvwrite_r+0x3b0>
   1559c:	00040593          	mv	a1,s0
   155a0:	000a8513          	mv	a0,s5
   155a4:	b09ff0ef          	jal	150ac <_fflush_r>
   155a8:	f8050ce3          	beqz	a0,15540 <__sfvwrite_r+0x3b0>
   155ac:	00c41783          	lh	a5,12(s0)
   155b0:	00c12b83          	lw	s7,12(sp)
   155b4:	00812c03          	lw	s8,8(sp)
   155b8:	00412c83          	lw	s9,4(sp)
   155bc:	f21ff06f          	j	154dc <__sfvwrite_r+0x34c>
   155c0:	00090c13          	mv	s8,s2
   155c4:	00090c93          	mv	s9,s2
   155c8:	da9ff06f          	j	15370 <__sfvwrite_r+0x1e0>
   155cc:	00040593          	mv	a1,s0
   155d0:	000a8513          	mv	a0,s5
   155d4:	ad9ff0ef          	jal	150ac <_fflush_r>
   155d8:	e6050ce3          	beqz	a0,15450 <__sfvwrite_r+0x2c0>
   155dc:	ef5ff06f          	j	154d0 <__sfvwrite_r+0x340>
   155e0:	000b8613          	mv	a2,s7
   155e4:	000c0593          	mv	a1,s8
   155e8:	4d8000ef          	jal	15ac0 <memmove>
   155ec:	00842703          	lw	a4,8(s0)
   155f0:	00042783          	lw	a5,0(s0)
   155f4:	000b8913          	mv	s2,s7
   155f8:	41770733          	sub	a4,a4,s7
   155fc:	017787b3          	add	a5,a5,s7
   15600:	00e42423          	sw	a4,8(s0)
   15604:	00f42023          	sw	a5,0(s0)
   15608:	e3dff06f          	j	15444 <__sfvwrite_r+0x2b4>
   1560c:	000a8513          	mv	a0,s5
   15610:	47c040ef          	jal	19a8c <_realloc_r>
   15614:	00050c93          	mv	s9,a0
   15618:	d2051ce3          	bnez	a0,15350 <__sfvwrite_r+0x1c0>
   1561c:	01042583          	lw	a1,16(s0)
   15620:	000a8513          	mv	a0,s5
   15624:	895fb0ef          	jal	10eb8 <_free_r>
   15628:	00c41783          	lh	a5,12(s0)
   1562c:	00c00713          	li	a4,12
   15630:	00c12b83          	lw	s7,12(sp)
   15634:	00812c03          	lw	s8,8(sp)
   15638:	00412c83          	lw	s9,4(sp)
   1563c:	00eaa023          	sw	a4,0(s5)
   15640:	f7f7f793          	andi	a5,a5,-129
   15644:	e99ff06f          	j	154dc <__sfvwrite_r+0x34c>
   15648:	00198793          	addi	a5,s3,1
   1564c:	00078b13          	mv	s6,a5
   15650:	dadff06f          	j	153fc <__sfvwrite_r+0x26c>
   15654:	00c41783          	lh	a5,12(s0)
   15658:	e85ff06f          	j	154dc <__sfvwrite_r+0x34c>
   1565c:	00c00793          	li	a5,12
   15660:	00faa023          	sw	a5,0(s5)
   15664:	00c12b83          	lw	s7,12(sp)
   15668:	00c41783          	lh	a5,12(s0)
   1566c:	00812c03          	lw	s8,8(sp)
   15670:	00412c83          	lw	s9,4(sp)
   15674:	e69ff06f          	j	154dc <__sfvwrite_r+0x34c>

00015678 <__swsetup_r>:
   15678:	f0c1a783          	lw	a5,-244(gp) # 2371c <_impure_ptr>
   1567c:	ff010113          	addi	sp,sp,-16
   15680:	00812423          	sw	s0,8(sp)
   15684:	00912223          	sw	s1,4(sp)
   15688:	00112623          	sw	ra,12(sp)
   1568c:	00050493          	mv	s1,a0
   15690:	00058413          	mv	s0,a1
   15694:	00078663          	beqz	a5,156a0 <__swsetup_r+0x28>
   15698:	0347a703          	lw	a4,52(a5)
   1569c:	12070463          	beqz	a4,157c4 <__swsetup_r+0x14c>
   156a0:	00c41783          	lh	a5,12(s0)
   156a4:	0087f713          	andi	a4,a5,8
   156a8:	02070e63          	beqz	a4,156e4 <__swsetup_r+0x6c>
   156ac:	01042703          	lw	a4,16(s0)
   156b0:	04070a63          	beqz	a4,15704 <__swsetup_r+0x8c>
   156b4:	0017f713          	andi	a4,a5,1
   156b8:	08070463          	beqz	a4,15740 <__swsetup_r+0xc8>
   156bc:	01442783          	lw	a5,20(s0)
   156c0:	00042423          	sw	zero,8(s0)
   156c4:	40f007b3          	neg	a5,a5
   156c8:	00f42c23          	sw	a5,24(s0)
   156cc:	00000513          	li	a0,0
   156d0:	00c12083          	lw	ra,12(sp)
   156d4:	00812403          	lw	s0,8(sp)
   156d8:	00412483          	lw	s1,4(sp)
   156dc:	01010113          	addi	sp,sp,16
   156e0:	00008067          	ret
   156e4:	0107f713          	andi	a4,a5,16
   156e8:	10070e63          	beqz	a4,15804 <__swsetup_r+0x18c>
   156ec:	0047f713          	andi	a4,a5,4
   156f0:	06071263          	bnez	a4,15754 <__swsetup_r+0xdc>
   156f4:	01042703          	lw	a4,16(s0)
   156f8:	0087e793          	ori	a5,a5,8
   156fc:	00f41623          	sh	a5,12(s0)
   15700:	fa071ae3          	bnez	a4,156b4 <__swsetup_r+0x3c>
   15704:	2807f693          	andi	a3,a5,640
   15708:	20000613          	li	a2,512
   1570c:	08c69263          	bne	a3,a2,15790 <__swsetup_r+0x118>
   15710:	0017f693          	andi	a3,a5,1
   15714:	0a068e63          	beqz	a3,157d0 <__swsetup_r+0x158>
   15718:	01442703          	lw	a4,20(s0)
   1571c:	00042423          	sw	zero,8(s0)
   15720:	40e00733          	neg	a4,a4
   15724:	00e42c23          	sw	a4,24(s0)
   15728:	0807f713          	andi	a4,a5,128
   1572c:	fa0700e3          	beqz	a4,156cc <__swsetup_r+0x54>
   15730:	0407e793          	ori	a5,a5,64
   15734:	00f41623          	sh	a5,12(s0)
   15738:	fff00513          	li	a0,-1
   1573c:	f95ff06f          	j	156d0 <__swsetup_r+0x58>
   15740:	0027f793          	andi	a5,a5,2
   15744:	04079263          	bnez	a5,15788 <__swsetup_r+0x110>
   15748:	01442783          	lw	a5,20(s0)
   1574c:	00f42423          	sw	a5,8(s0)
   15750:	f7dff06f          	j	156cc <__swsetup_r+0x54>
   15754:	03042583          	lw	a1,48(s0)
   15758:	00058e63          	beqz	a1,15774 <__swsetup_r+0xfc>
   1575c:	04040713          	addi	a4,s0,64
   15760:	00e58863          	beq	a1,a4,15770 <__swsetup_r+0xf8>
   15764:	00048513          	mv	a0,s1
   15768:	f50fb0ef          	jal	10eb8 <_free_r>
   1576c:	00c41783          	lh	a5,12(s0)
   15770:	02042823          	sw	zero,48(s0)
   15774:	01042703          	lw	a4,16(s0)
   15778:	fdb7f793          	andi	a5,a5,-37
   1577c:	00042223          	sw	zero,4(s0)
   15780:	00e42023          	sw	a4,0(s0)
   15784:	f75ff06f          	j	156f8 <__swsetup_r+0x80>
   15788:	00042423          	sw	zero,8(s0)
   1578c:	f41ff06f          	j	156cc <__swsetup_r+0x54>
   15790:	00048513          	mv	a0,s1
   15794:	00040593          	mv	a1,s0
   15798:	0b1040ef          	jal	1a048 <__smakebuf_r>
   1579c:	00c41783          	lh	a5,12(s0)
   157a0:	01042703          	lw	a4,16(s0)
   157a4:	0017f693          	andi	a3,a5,1
   157a8:	04068063          	beqz	a3,157e8 <__swsetup_r+0x170>
   157ac:	01442683          	lw	a3,20(s0)
   157b0:	00042423          	sw	zero,8(s0)
   157b4:	40d006b3          	neg	a3,a3
   157b8:	00d42c23          	sw	a3,24(s0)
   157bc:	f60706e3          	beqz	a4,15728 <__swsetup_r+0xb0>
   157c0:	f0dff06f          	j	156cc <__swsetup_r+0x54>
   157c4:	00078513          	mv	a0,a5
   157c8:	d71fa0ef          	jal	10538 <__sinit>
   157cc:	ed5ff06f          	j	156a0 <__swsetup_r+0x28>
   157d0:	0027f693          	andi	a3,a5,2
   157d4:	02069463          	bnez	a3,157fc <__swsetup_r+0x184>
   157d8:	01442603          	lw	a2,20(s0)
   157dc:	00c42423          	sw	a2,8(s0)
   157e0:	f40704e3          	beqz	a4,15728 <__swsetup_r+0xb0>
   157e4:	ee9ff06f          	j	156cc <__swsetup_r+0x54>
   157e8:	0027f693          	andi	a3,a5,2
   157ec:	00000613          	li	a2,0
   157f0:	fe0696e3          	bnez	a3,157dc <__swsetup_r+0x164>
   157f4:	01442603          	lw	a2,20(s0)
   157f8:	fe5ff06f          	j	157dc <__swsetup_r+0x164>
   157fc:	00042423          	sw	zero,8(s0)
   15800:	f29ff06f          	j	15728 <__swsetup_r+0xb0>
   15804:	00900713          	li	a4,9
   15808:	0407e793          	ori	a5,a5,64
   1580c:	00e4a023          	sw	a4,0(s1)
   15810:	00f41623          	sh	a5,12(s0)
   15814:	fff00513          	li	a0,-1
   15818:	eb9ff06f          	j	156d0 <__swsetup_r+0x58>

0001581c <memchr>:
   1581c:	00357713          	andi	a4,a0,3
   15820:	00050793          	mv	a5,a0
   15824:	0ff5f813          	zext.b	a6,a1
   15828:	00050313          	mv	t1,a0
   1582c:	02070e63          	beqz	a4,15868 <memchr+0x4c>
   15830:	00c508b3          	add	a7,a0,a2
   15834:	0140006f          	j	15848 <memchr+0x2c>
   15838:	0007c683          	lbu	a3,0(a5)
   1583c:	0b068263          	beq	a3,a6,158e0 <memchr+0xc4>
   15840:	00070e63          	beqz	a4,1585c <memchr+0x40>
   15844:	00050793          	mv	a5,a0
   15848:	00178513          	addi	a0,a5,1
   1584c:	00357713          	andi	a4,a0,3
   15850:	fef894e3          	bne	a7,a5,15838 <memchr+0x1c>
   15854:	00000513          	li	a0,0
   15858:	00008067          	ret
   1585c:	fff60613          	addi	a2,a2,-1
   15860:	00660633          	add	a2,a2,t1
   15864:	40f60633          	sub	a2,a2,a5
   15868:	00300793          	li	a5,3
   1586c:	04c7fa63          	bgeu	a5,a2,158c0 <memchr+0xa4>
   15870:	0ff5f593          	zext.b	a1,a1
   15874:	00859693          	slli	a3,a1,0x8
   15878:	00b686b3          	add	a3,a3,a1
   1587c:	01069713          	slli	a4,a3,0x10
   15880:	feff0337          	lui	t1,0xfeff0
   15884:	808088b7          	lui	a7,0x80808
   15888:	00078593          	mv	a1,a5
   1588c:	00e686b3          	add	a3,a3,a4
   15890:	eff30313          	addi	t1,t1,-257 # fefefeff <__BSS_END__+0xfefcc4ab>
   15894:	08088893          	addi	a7,a7,128 # 80808080 <__BSS_END__+0x807e462c>
   15898:	00052783          	lw	a5,0(a0)
   1589c:	00f6c7b3          	xor	a5,a3,a5
   158a0:	00678733          	add	a4,a5,t1
   158a4:	fff7c793          	not	a5,a5
   158a8:	00f777b3          	and	a5,a4,a5
   158ac:	0117f7b3          	and	a5,a5,a7
   158b0:	00079a63          	bnez	a5,158c4 <memchr+0xa8>
   158b4:	ffc60613          	addi	a2,a2,-4
   158b8:	00450513          	addi	a0,a0,4
   158bc:	fcc5eee3          	bltu	a1,a2,15898 <memchr+0x7c>
   158c0:	f8060ae3          	beqz	a2,15854 <memchr+0x38>
   158c4:	00c50633          	add	a2,a0,a2
   158c8:	00c0006f          	j	158d4 <memchr+0xb8>
   158cc:	00150513          	addi	a0,a0,1
   158d0:	f8c502e3          	beq	a0,a2,15854 <memchr+0x38>
   158d4:	00054783          	lbu	a5,0(a0)
   158d8:	ff079ae3          	bne	a5,a6,158cc <memchr+0xb0>
   158dc:	00008067          	ret
   158e0:	00078513          	mv	a0,a5
   158e4:	00008067          	ret

000158e8 <strncpy>:
   158e8:	00a5e7b3          	or	a5,a1,a0
   158ec:	0037f793          	andi	a5,a5,3
   158f0:	00079663          	bnez	a5,158fc <strncpy+0x14>
   158f4:	00300893          	li	a7,3
   158f8:	04c8e663          	bltu	a7,a2,15944 <strncpy+0x5c>
   158fc:	00050713          	mv	a4,a0
   15900:	01c0006f          	j	1591c <strncpy+0x34>
   15904:	fff5c683          	lbu	a3,-1(a1)
   15908:	fff60813          	addi	a6,a2,-1
   1590c:	fed78fa3          	sb	a3,-1(a5)
   15910:	00068e63          	beqz	a3,1592c <strncpy+0x44>
   15914:	00078713          	mv	a4,a5
   15918:	00080613          	mv	a2,a6
   1591c:	00158593          	addi	a1,a1,1
   15920:	00170793          	addi	a5,a4,1
   15924:	fe0610e3          	bnez	a2,15904 <strncpy+0x1c>
   15928:	00008067          	ret
   1592c:	00c70733          	add	a4,a4,a2
   15930:	04080c63          	beqz	a6,15988 <strncpy+0xa0>
   15934:	00178793          	addi	a5,a5,1
   15938:	fe078fa3          	sb	zero,-1(a5)
   1593c:	fee79ce3          	bne	a5,a4,15934 <strncpy+0x4c>
   15940:	00008067          	ret
   15944:	feff0e37          	lui	t3,0xfeff0
   15948:	80808337          	lui	t1,0x80808
   1594c:	effe0e13          	addi	t3,t3,-257 # fefefeff <__BSS_END__+0xfefcc4ab>
   15950:	08030313          	addi	t1,t1,128 # 80808080 <__BSS_END__+0x807e462c>
   15954:	00050713          	mv	a4,a0
   15958:	0005a683          	lw	a3,0(a1)
   1595c:	01c687b3          	add	a5,a3,t3
   15960:	fff6c813          	not	a6,a3
   15964:	0107f7b3          	and	a5,a5,a6
   15968:	0067f7b3          	and	a5,a5,t1
   1596c:	fa0798e3          	bnez	a5,1591c <strncpy+0x34>
   15970:	ffc60613          	addi	a2,a2,-4
   15974:	00d72023          	sw	a3,0(a4)
   15978:	00470713          	addi	a4,a4,4
   1597c:	00458593          	addi	a1,a1,4
   15980:	fcc8ece3          	bltu	a7,a2,15958 <strncpy+0x70>
   15984:	f99ff06f          	j	1591c <strncpy+0x34>
   15988:	00008067          	ret

0001598c <__localeconv_l>:
   1598c:	0f050513          	addi	a0,a0,240
   15990:	00008067          	ret

00015994 <_localeconv_r>:
   15994:	e2818513          	addi	a0,gp,-472 # 23638 <__global_locale+0xf0>
   15998:	00008067          	ret

0001599c <localeconv>:
   1599c:	e2818513          	addi	a0,gp,-472 # 23638 <__global_locale+0xf0>
   159a0:	00008067          	ret

000159a4 <_gettimeofday_r>:
   159a4:	ff010113          	addi	sp,sp,-16
   159a8:	00058713          	mv	a4,a1
   159ac:	00812423          	sw	s0,8(sp)
   159b0:	00912223          	sw	s1,4(sp)
   159b4:	00060593          	mv	a1,a2
   159b8:	00050413          	mv	s0,a0
   159bc:	00070513          	mv	a0,a4
   159c0:	00112623          	sw	ra,12(sp)
   159c4:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   159c8:	355060ef          	jal	1c51c <_gettimeofday>
   159cc:	fff00793          	li	a5,-1
   159d0:	00f50c63          	beq	a0,a5,159e8 <_gettimeofday_r+0x44>
   159d4:	00c12083          	lw	ra,12(sp)
   159d8:	00812403          	lw	s0,8(sp)
   159dc:	00412483          	lw	s1,4(sp)
   159e0:	01010113          	addi	sp,sp,16
   159e4:	00008067          	ret
   159e8:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   159ec:	fe0784e3          	beqz	a5,159d4 <_gettimeofday_r+0x30>
   159f0:	00c12083          	lw	ra,12(sp)
   159f4:	00f42023          	sw	a5,0(s0)
   159f8:	00812403          	lw	s0,8(sp)
   159fc:	00412483          	lw	s1,4(sp)
   15a00:	01010113          	addi	sp,sp,16
   15a04:	00008067          	ret

00015a08 <_sbrk_r>:
   15a08:	ff010113          	addi	sp,sp,-16
   15a0c:	00812423          	sw	s0,8(sp)
   15a10:	00912223          	sw	s1,4(sp)
   15a14:	00050413          	mv	s0,a0
   15a18:	00058513          	mv	a0,a1
   15a1c:	00112623          	sw	ra,12(sp)
   15a20:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   15a24:	45d060ef          	jal	1c680 <_sbrk>
   15a28:	fff00793          	li	a5,-1
   15a2c:	00f50c63          	beq	a0,a5,15a44 <_sbrk_r+0x3c>
   15a30:	00c12083          	lw	ra,12(sp)
   15a34:	00812403          	lw	s0,8(sp)
   15a38:	00412483          	lw	s1,4(sp)
   15a3c:	01010113          	addi	sp,sp,16
   15a40:	00008067          	ret
   15a44:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   15a48:	fe0784e3          	beqz	a5,15a30 <_sbrk_r+0x28>
   15a4c:	00c12083          	lw	ra,12(sp)
   15a50:	00f42023          	sw	a5,0(s0)
   15a54:	00812403          	lw	s0,8(sp)
   15a58:	00412483          	lw	s1,4(sp)
   15a5c:	01010113          	addi	sp,sp,16
   15a60:	00008067          	ret

00015a64 <__libc_fini_array>:
   15a64:	ff010113          	addi	sp,sp,-16
   15a68:	00812423          	sw	s0,8(sp)
   15a6c:	000237b7          	lui	a5,0x23
   15a70:	00023437          	lui	s0,0x23
   15a74:	00c40413          	addi	s0,s0,12 # 2300c <__fini_array_end>
   15a78:	00878793          	addi	a5,a5,8 # 23008 <__do_global_dtors_aux_fini_array_entry>
   15a7c:	40f40433          	sub	s0,s0,a5
   15a80:	00912223          	sw	s1,4(sp)
   15a84:	00112623          	sw	ra,12(sp)
   15a88:	40245493          	srai	s1,s0,0x2
   15a8c:	02048063          	beqz	s1,15aac <__libc_fini_array+0x48>
   15a90:	ffc40413          	addi	s0,s0,-4
   15a94:	00f40433          	add	s0,s0,a5
   15a98:	00042783          	lw	a5,0(s0)
   15a9c:	fff48493          	addi	s1,s1,-1
   15aa0:	ffc40413          	addi	s0,s0,-4
   15aa4:	000780e7          	jalr	a5
   15aa8:	fe0498e3          	bnez	s1,15a98 <__libc_fini_array+0x34>
   15aac:	00c12083          	lw	ra,12(sp)
   15ab0:	00812403          	lw	s0,8(sp)
   15ab4:	00412483          	lw	s1,4(sp)
   15ab8:	01010113          	addi	sp,sp,16
   15abc:	00008067          	ret

00015ac0 <memmove>:
   15ac0:	02a5f663          	bgeu	a1,a0,15aec <memmove+0x2c>
   15ac4:	00c58733          	add	a4,a1,a2
   15ac8:	02e57263          	bgeu	a0,a4,15aec <memmove+0x2c>
   15acc:	00c507b3          	add	a5,a0,a2
   15ad0:	04060663          	beqz	a2,15b1c <memmove+0x5c>
   15ad4:	fff74683          	lbu	a3,-1(a4)
   15ad8:	fff78793          	addi	a5,a5,-1
   15adc:	fff70713          	addi	a4,a4,-1
   15ae0:	00d78023          	sb	a3,0(a5)
   15ae4:	fef518e3          	bne	a0,a5,15ad4 <memmove+0x14>
   15ae8:	00008067          	ret
   15aec:	00f00793          	li	a5,15
   15af0:	02c7e863          	bltu	a5,a2,15b20 <memmove+0x60>
   15af4:	00050793          	mv	a5,a0
   15af8:	fff60693          	addi	a3,a2,-1
   15afc:	0e060063          	beqz	a2,15bdc <memmove+0x11c>
   15b00:	00168693          	addi	a3,a3,1
   15b04:	00d786b3          	add	a3,a5,a3
   15b08:	0005c703          	lbu	a4,0(a1)
   15b0c:	00178793          	addi	a5,a5,1
   15b10:	00158593          	addi	a1,a1,1
   15b14:	fee78fa3          	sb	a4,-1(a5)
   15b18:	fed798e3          	bne	a5,a3,15b08 <memmove+0x48>
   15b1c:	00008067          	ret
   15b20:	00b567b3          	or	a5,a0,a1
   15b24:	0037f793          	andi	a5,a5,3
   15b28:	00058893          	mv	a7,a1
   15b2c:	0a079263          	bnez	a5,15bd0 <memmove+0x110>
   15b30:	ff060793          	addi	a5,a2,-16
   15b34:	ff07f813          	andi	a6,a5,-16
   15b38:	01080813          	addi	a6,a6,16
   15b3c:	01050833          	add	a6,a0,a6
   15b40:	00050713          	mv	a4,a0
   15b44:	0005a683          	lw	a3,0(a1)
   15b48:	01058593          	addi	a1,a1,16
   15b4c:	01070713          	addi	a4,a4,16
   15b50:	fed72823          	sw	a3,-16(a4)
   15b54:	ff45a683          	lw	a3,-12(a1)
   15b58:	fed72a23          	sw	a3,-12(a4)
   15b5c:	ff85a683          	lw	a3,-8(a1)
   15b60:	fed72c23          	sw	a3,-8(a4)
   15b64:	ffc5a683          	lw	a3,-4(a1)
   15b68:	fed72e23          	sw	a3,-4(a4)
   15b6c:	fd071ce3          	bne	a4,a6,15b44 <memmove+0x84>
   15b70:	ff07f793          	andi	a5,a5,-16
   15b74:	01178733          	add	a4,a5,a7
   15b78:	01070593          	addi	a1,a4,16
   15b7c:	00f507b3          	add	a5,a0,a5
   15b80:	00c67813          	andi	a6,a2,12
   15b84:	01078793          	addi	a5,a5,16
   15b88:	00058e13          	mv	t3,a1
   15b8c:	00f67693          	andi	a3,a2,15
   15b90:	04080863          	beqz	a6,15be0 <memmove+0x120>
   15b94:	ffc68693          	addi	a3,a3,-4
   15b98:	ffc6f693          	andi	a3,a3,-4
   15b9c:	00d70733          	add	a4,a4,a3
   15ba0:	01470713          	addi	a4,a4,20
   15ba4:	41150833          	sub	a6,a0,a7
   15ba8:	0005a303          	lw	t1,0(a1)
   15bac:	010588b3          	add	a7,a1,a6
   15bb0:	00458593          	addi	a1,a1,4
   15bb4:	0068a023          	sw	t1,0(a7)
   15bb8:	fee598e3          	bne	a1,a4,15ba8 <memmove+0xe8>
   15bbc:	00468713          	addi	a4,a3,4
   15bc0:	01c705b3          	add	a1,a4,t3
   15bc4:	00f707b3          	add	a5,a4,a5
   15bc8:	00367613          	andi	a2,a2,3
   15bcc:	f2dff06f          	j	15af8 <memmove+0x38>
   15bd0:	fff60693          	addi	a3,a2,-1
   15bd4:	00050793          	mv	a5,a0
   15bd8:	f29ff06f          	j	15b00 <memmove+0x40>
   15bdc:	00008067          	ret
   15be0:	00068613          	mv	a2,a3
   15be4:	f15ff06f          	j	15af8 <memmove+0x38>

00015be8 <memcpy>:
   15be8:	00a5c7b3          	xor	a5,a1,a0
   15bec:	0037f793          	andi	a5,a5,3
   15bf0:	00c508b3          	add	a7,a0,a2
   15bf4:	06079663          	bnez	a5,15c60 <memcpy+0x78>
   15bf8:	00300793          	li	a5,3
   15bfc:	06c7f263          	bgeu	a5,a2,15c60 <memcpy+0x78>
   15c00:	00357793          	andi	a5,a0,3
   15c04:	00050713          	mv	a4,a0
   15c08:	0c079a63          	bnez	a5,15cdc <memcpy+0xf4>
   15c0c:	ffc8f613          	andi	a2,a7,-4
   15c10:	40e606b3          	sub	a3,a2,a4
   15c14:	02000793          	li	a5,32
   15c18:	06d7c463          	blt	a5,a3,15c80 <memcpy+0x98>
   15c1c:	00058693          	mv	a3,a1
   15c20:	00070793          	mv	a5,a4
   15c24:	02c77a63          	bgeu	a4,a2,15c58 <memcpy+0x70>
   15c28:	0006a803          	lw	a6,0(a3)
   15c2c:	00478793          	addi	a5,a5,4
   15c30:	00468693          	addi	a3,a3,4
   15c34:	ff07ae23          	sw	a6,-4(a5)
   15c38:	fec7e8e3          	bltu	a5,a2,15c28 <memcpy+0x40>
   15c3c:	fff60613          	addi	a2,a2,-1
   15c40:	40e60633          	sub	a2,a2,a4
   15c44:	ffc67613          	andi	a2,a2,-4
   15c48:	00458593          	addi	a1,a1,4
   15c4c:	00470713          	addi	a4,a4,4
   15c50:	00c585b3          	add	a1,a1,a2
   15c54:	00c70733          	add	a4,a4,a2
   15c58:	01176863          	bltu	a4,a7,15c68 <memcpy+0x80>
   15c5c:	00008067          	ret
   15c60:	00050713          	mv	a4,a0
   15c64:	ff157ce3          	bgeu	a0,a7,15c5c <memcpy+0x74>
   15c68:	0005c783          	lbu	a5,0(a1)
   15c6c:	00170713          	addi	a4,a4,1
   15c70:	00158593          	addi	a1,a1,1
   15c74:	fef70fa3          	sb	a5,-1(a4)
   15c78:	fee898e3          	bne	a7,a4,15c68 <memcpy+0x80>
   15c7c:	00008067          	ret
   15c80:	0205a683          	lw	a3,32(a1)
   15c84:	0005a383          	lw	t2,0(a1)
   15c88:	0045a283          	lw	t0,4(a1)
   15c8c:	0085af83          	lw	t6,8(a1)
   15c90:	00c5af03          	lw	t5,12(a1)
   15c94:	0105ae83          	lw	t4,16(a1)
   15c98:	0145ae03          	lw	t3,20(a1)
   15c9c:	0185a303          	lw	t1,24(a1)
   15ca0:	01c5a803          	lw	a6,28(a1)
   15ca4:	02470713          	addi	a4,a4,36
   15ca8:	fed72e23          	sw	a3,-4(a4)
   15cac:	fc772e23          	sw	t2,-36(a4)
   15cb0:	40e606b3          	sub	a3,a2,a4
   15cb4:	fe572023          	sw	t0,-32(a4)
   15cb8:	fff72223          	sw	t6,-28(a4)
   15cbc:	ffe72423          	sw	t5,-24(a4)
   15cc0:	ffd72623          	sw	t4,-20(a4)
   15cc4:	ffc72823          	sw	t3,-16(a4)
   15cc8:	fe672a23          	sw	t1,-12(a4)
   15ccc:	ff072c23          	sw	a6,-8(a4)
   15cd0:	02458593          	addi	a1,a1,36
   15cd4:	fad7c6e3          	blt	a5,a3,15c80 <memcpy+0x98>
   15cd8:	f45ff06f          	j	15c1c <memcpy+0x34>
   15cdc:	0005c683          	lbu	a3,0(a1)
   15ce0:	00170713          	addi	a4,a4,1
   15ce4:	00377793          	andi	a5,a4,3
   15ce8:	fed70fa3          	sb	a3,-1(a4)
   15cec:	00158593          	addi	a1,a1,1
   15cf0:	f0078ee3          	beqz	a5,15c0c <memcpy+0x24>
   15cf4:	0005c683          	lbu	a3,0(a1)
   15cf8:	00170713          	addi	a4,a4,1
   15cfc:	00377793          	andi	a5,a4,3
   15d00:	fed70fa3          	sb	a3,-1(a4)
   15d04:	00158593          	addi	a1,a1,1
   15d08:	fc079ae3          	bnez	a5,15cdc <memcpy+0xf4>
   15d0c:	f01ff06f          	j	15c0c <memcpy+0x24>

00015d10 <strlen>:
   15d10:	00357793          	andi	a5,a0,3
   15d14:	00050713          	mv	a4,a0
   15d18:	04079c63          	bnez	a5,15d70 <strlen+0x60>
   15d1c:	7f7f86b7          	lui	a3,0x7f7f8
   15d20:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__BSS_END__+0x7f7d452b>
   15d24:	fff00593          	li	a1,-1
   15d28:	00072603          	lw	a2,0(a4)
   15d2c:	00470713          	addi	a4,a4,4
   15d30:	00d677b3          	and	a5,a2,a3
   15d34:	00d787b3          	add	a5,a5,a3
   15d38:	00c7e7b3          	or	a5,a5,a2
   15d3c:	00d7e7b3          	or	a5,a5,a3
   15d40:	feb784e3          	beq	a5,a1,15d28 <strlen+0x18>
   15d44:	ffc74683          	lbu	a3,-4(a4)
   15d48:	40a707b3          	sub	a5,a4,a0
   15d4c:	04068463          	beqz	a3,15d94 <strlen+0x84>
   15d50:	ffd74683          	lbu	a3,-3(a4)
   15d54:	02068c63          	beqz	a3,15d8c <strlen+0x7c>
   15d58:	ffe74503          	lbu	a0,-2(a4)
   15d5c:	00a03533          	snez	a0,a0
   15d60:	00f50533          	add	a0,a0,a5
   15d64:	ffe50513          	addi	a0,a0,-2
   15d68:	00008067          	ret
   15d6c:	fa0688e3          	beqz	a3,15d1c <strlen+0xc>
   15d70:	00074783          	lbu	a5,0(a4)
   15d74:	00170713          	addi	a4,a4,1
   15d78:	00377693          	andi	a3,a4,3
   15d7c:	fe0798e3          	bnez	a5,15d6c <strlen+0x5c>
   15d80:	40a70733          	sub	a4,a4,a0
   15d84:	fff70513          	addi	a0,a4,-1
   15d88:	00008067          	ret
   15d8c:	ffd78513          	addi	a0,a5,-3
   15d90:	00008067          	ret
   15d94:	ffc78513          	addi	a0,a5,-4
   15d98:	00008067          	ret

00015d9c <frexpl>:
   15d9c:	f9010113          	addi	sp,sp,-112
   15da0:	07212023          	sw	s2,96(sp)
   15da4:	00c5a903          	lw	s2,12(a1)
   15da8:	05412c23          	sw	s4,88(sp)
   15dac:	05512a23          	sw	s5,84(sp)
   15db0:	05612823          	sw	s6,80(sp)
   15db4:	0045aa83          	lw	s5,4(a1)
   15db8:	0005ab03          	lw	s6,0(a1)
   15dbc:	0085aa03          	lw	s4,8(a1)
   15dc0:	05312e23          	sw	s3,92(sp)
   15dc4:	000089b7          	lui	s3,0x8
   15dc8:	06812423          	sw	s0,104(sp)
   15dcc:	06912223          	sw	s1,100(sp)
   15dd0:	06112623          	sw	ra,108(sp)
   15dd4:	01095493          	srli	s1,s2,0x10
   15dd8:	fff98993          	addi	s3,s3,-1 # 7fff <exit-0x80b5>
   15ddc:	00062023          	sw	zero,0(a2)
   15de0:	03212e23          	sw	s2,60(sp)
   15de4:	0134f4b3          	and	s1,s1,s3
   15de8:	03612823          	sw	s6,48(sp)
   15dec:	03512a23          	sw	s5,52(sp)
   15df0:	03412c23          	sw	s4,56(sp)
   15df4:	00050413          	mv	s0,a0
   15df8:	09348063          	beq	s1,s3,15e78 <frexpl+0xdc>
   15dfc:	02010513          	addi	a0,sp,32
   15e00:	01010593          	addi	a1,sp,16
   15e04:	05712623          	sw	s7,76(sp)
   15e08:	03612023          	sw	s6,32(sp)
   15e0c:	00060b93          	mv	s7,a2
   15e10:	03512223          	sw	s5,36(sp)
   15e14:	03412423          	sw	s4,40(sp)
   15e18:	03212623          	sw	s2,44(sp)
   15e1c:	00012823          	sw	zero,16(sp)
   15e20:	00012a23          	sw	zero,20(sp)
   15e24:	00012c23          	sw	zero,24(sp)
   15e28:	00012e23          	sw	zero,28(sp)
   15e2c:	52c090ef          	jal	1f358 <__eqtf2>
   15e30:	0e050463          	beqz	a0,15f18 <frexpl+0x17c>
   15e34:	00000693          	li	a3,0
   15e38:	06048e63          	beqz	s1,15eb4 <frexpl+0x118>
   15e3c:	ffffc737          	lui	a4,0xffffc
   15e40:	00270713          	addi	a4,a4,2 # ffffc002 <__BSS_END__+0xfffd85ae>
   15e44:	03c12903          	lw	s2,60(sp)
   15e48:	00e484b3          	add	s1,s1,a4
   15e4c:	800107b7          	lui	a5,0x80010
   15e50:	00d484b3          	add	s1,s1,a3
   15e54:	fff78793          	addi	a5,a5,-1 # 8000ffff <__BSS_END__+0x7ffec5ab>
   15e58:	009ba023          	sw	s1,0(s7)
   15e5c:	03012b03          	lw	s6,48(sp)
   15e60:	03412a83          	lw	s5,52(sp)
   15e64:	03812a03          	lw	s4,56(sp)
   15e68:	04c12b83          	lw	s7,76(sp)
   15e6c:	00f97933          	and	s2,s2,a5
   15e70:	3ffe07b7          	lui	a5,0x3ffe0
   15e74:	00f96933          	or	s2,s2,a5
   15e78:	01642023          	sw	s6,0(s0)
   15e7c:	01542223          	sw	s5,4(s0)
   15e80:	01442423          	sw	s4,8(s0)
   15e84:	01242623          	sw	s2,12(s0)
   15e88:	06c12083          	lw	ra,108(sp)
   15e8c:	00040513          	mv	a0,s0
   15e90:	06812403          	lw	s0,104(sp)
   15e94:	06412483          	lw	s1,100(sp)
   15e98:	06012903          	lw	s2,96(sp)
   15e9c:	05c12983          	lw	s3,92(sp)
   15ea0:	05812a03          	lw	s4,88(sp)
   15ea4:	05412a83          	lw	s5,84(sp)
   15ea8:	05012b03          	lw	s6,80(sp)
   15eac:	07010113          	addi	sp,sp,112
   15eb0:	00008067          	ret
   15eb4:	407107b7          	lui	a5,0x40710
   15eb8:	00010613          	mv	a2,sp
   15ebc:	01010593          	addi	a1,sp,16
   15ec0:	02010513          	addi	a0,sp,32
   15ec4:	00f12623          	sw	a5,12(sp)
   15ec8:	01612823          	sw	s6,16(sp)
   15ecc:	01512a23          	sw	s5,20(sp)
   15ed0:	01412c23          	sw	s4,24(sp)
   15ed4:	01212e23          	sw	s2,28(sp)
   15ed8:	00012023          	sw	zero,0(sp)
   15edc:	00012223          	sw	zero,4(sp)
   15ee0:	00012423          	sw	zero,8(sp)
   15ee4:	780090ef          	jal	1f664 <__multf3>
   15ee8:	02c12783          	lw	a5,44(sp)
   15eec:	02412683          	lw	a3,36(sp)
   15ef0:	02012603          	lw	a2,32(sp)
   15ef4:	02812703          	lw	a4,40(sp)
   15ef8:	0107d493          	srli	s1,a5,0x10
   15efc:	02d12a23          	sw	a3,52(sp)
   15f00:	02c12823          	sw	a2,48(sp)
   15f04:	02e12c23          	sw	a4,56(sp)
   15f08:	02f12e23          	sw	a5,60(sp)
   15f0c:	0134f4b3          	and	s1,s1,s3
   15f10:	f8e00693          	li	a3,-114
   15f14:	f29ff06f          	j	15e3c <frexpl+0xa0>
   15f18:	04c12b83          	lw	s7,76(sp)
   15f1c:	f5dff06f          	j	15e78 <frexpl+0xdc>

00015f20 <__register_exitproc>:
   15f20:	f201a783          	lw	a5,-224(gp) # 23730 <__atexit>
   15f24:	04078c63          	beqz	a5,15f7c <__register_exitproc+0x5c>
   15f28:	0047a703          	lw	a4,4(a5) # 40710004 <__BSS_END__+0x406ec5b0>
   15f2c:	01f00813          	li	a6,31
   15f30:	08e84063          	blt	a6,a4,15fb0 <__register_exitproc+0x90>
   15f34:	00271813          	slli	a6,a4,0x2
   15f38:	02050663          	beqz	a0,15f64 <__register_exitproc+0x44>
   15f3c:	01078333          	add	t1,a5,a6
   15f40:	08c32423          	sw	a2,136(t1)
   15f44:	1887a883          	lw	a7,392(a5)
   15f48:	00100613          	li	a2,1
   15f4c:	00e61633          	sll	a2,a2,a4
   15f50:	00c8e8b3          	or	a7,a7,a2
   15f54:	1917a423          	sw	a7,392(a5)
   15f58:	10d32423          	sw	a3,264(t1)
   15f5c:	00200693          	li	a3,2
   15f60:	02d50663          	beq	a0,a3,15f8c <__register_exitproc+0x6c>
   15f64:	00170713          	addi	a4,a4,1
   15f68:	00e7a223          	sw	a4,4(a5)
   15f6c:	010787b3          	add	a5,a5,a6
   15f70:	00b7a423          	sw	a1,8(a5)
   15f74:	00000513          	li	a0,0
   15f78:	00008067          	ret
   15f7c:	0b418813          	addi	a6,gp,180 # 238c4 <__atexit0>
   15f80:	f301a023          	sw	a6,-224(gp) # 23730 <__atexit>
   15f84:	0b418793          	addi	a5,gp,180 # 238c4 <__atexit0>
   15f88:	fa1ff06f          	j	15f28 <__register_exitproc+0x8>
   15f8c:	18c7a683          	lw	a3,396(a5)
   15f90:	00170713          	addi	a4,a4,1
   15f94:	00e7a223          	sw	a4,4(a5)
   15f98:	00c6e6b3          	or	a3,a3,a2
   15f9c:	18d7a623          	sw	a3,396(a5)
   15fa0:	010787b3          	add	a5,a5,a6
   15fa4:	00b7a423          	sw	a1,8(a5)
   15fa8:	00000513          	li	a0,0
   15fac:	00008067          	ret
   15fb0:	fff00513          	li	a0,-1
   15fb4:	00008067          	ret

00015fb8 <_ldtoa_r>:
   15fb8:	000228b7          	lui	a7,0x22
   15fbc:	7b888893          	addi	a7,a7,1976 # 227b8 <blanks.1+0x10>
   15fc0:	0008af83          	lw	t6,0(a7)
   15fc4:	0048af03          	lw	t5,4(a7)
   15fc8:	0088ae83          	lw	t4,8(a7)
   15fcc:	00c8ae03          	lw	t3,12(a7)
   15fd0:	0108a303          	lw	t1,16(a7)
   15fd4:	03852883          	lw	a7,56(a0)
   15fd8:	f5010113          	addi	sp,sp,-176
   15fdc:	0b212023          	sw	s2,160(sp)
   15fe0:	09312e23          	sw	s3,156(sp)
   15fe4:	09412c23          	sw	s4,152(sp)
   15fe8:	09612823          	sw	s6,144(sp)
   15fec:	09712623          	sw	s7,140(sp)
   15ff0:	09812423          	sw	s8,136(sp)
   15ff4:	09912223          	sw	s9,132(sp)
   15ff8:	09a12023          	sw	s10,128(sp)
   15ffc:	0a112623          	sw	ra,172(sp)
   16000:	0a812423          	sw	s0,168(sp)
   16004:	0a912223          	sw	s1,164(sp)
   16008:	09512a23          	sw	s5,148(sp)
   1600c:	07b12e23          	sw	s11,124(sp)
   16010:	05f12e23          	sw	t6,92(sp)
   16014:	07e12023          	sw	t5,96(sp)
   16018:	07d12223          	sw	t4,100(sp)
   1601c:	07c12423          	sw	t3,104(sp)
   16020:	06612623          	sw	t1,108(sp)
   16024:	00c12c23          	sw	a2,24(sp)
   16028:	00d12e23          	sw	a3,28(sp)
   1602c:	0005aa03          	lw	s4,0(a1)
   16030:	0045a983          	lw	s3,4(a1)
   16034:	0085a903          	lw	s2,8(a1)
   16038:	00c5ac03          	lw	s8,12(a1)
   1603c:	00050b13          	mv	s6,a0
   16040:	00070b93          	mv	s7,a4
   16044:	00078c93          	mv	s9,a5
   16048:	00080d13          	mv	s10,a6
   1604c:	00088863          	beqz	a7,1605c <_ldtoa_r+0xa4>
   16050:	00088593          	mv	a1,a7
   16054:	324020ef          	jal	18378 <__freedtoa>
   16058:	020b2c23          	sw	zero,56(s6)
   1605c:	06812603          	lw	a2,104(sp)
   16060:	01fc5693          	srli	a3,s8,0x1f
   16064:	001c1a93          	slli	s5,s8,0x1
   16068:	40165713          	srai	a4,a2,0x1
   1606c:	ffffc4b7          	lui	s1,0xffffc
   16070:	001c1413          	slli	s0,s8,0x1
   16074:	010c1d93          	slli	s11,s8,0x10
   16078:	00d77733          	and	a4,a4,a3
   1607c:	03412823          	sw	s4,48(sp)
   16080:	03312a23          	sw	s3,52(sp)
   16084:	03212c23          	sw	s2,56(sp)
   16088:	03412023          	sw	s4,32(sp)
   1608c:	03312223          	sw	s3,36(sp)
   16090:	03212423          	sw	s2,40(sp)
   16094:	011ada93          	srli	s5,s5,0x11
   16098:	f9148493          	addi	s1,s1,-111 # ffffbf91 <__BSS_END__+0xfffd853d>
   1609c:	00145413          	srli	s0,s0,0x1
   160a0:	00dca023          	sw	a3,0(s9)
   160a4:	010ddd93          	srli	s11,s11,0x10
   160a8:	00c74733          	xor	a4,a4,a2
   160ac:	009a87b3          	add	a5,s5,s1
   160b0:	03010513          	addi	a0,sp,48
   160b4:	02010593          	addi	a1,sp,32
   160b8:	02812e23          	sw	s0,60(sp)
   160bc:	02812623          	sw	s0,44(sp)
   160c0:	05412623          	sw	s4,76(sp)
   160c4:	05312823          	sw	s3,80(sp)
   160c8:	05212a23          	sw	s2,84(sp)
   160cc:	06e12423          	sw	a4,104(sp)
   160d0:	00f12a23          	sw	a5,20(sp)
   160d4:	05b12c23          	sw	s11,88(sp)
   160d8:	51d0b0ef          	jal	21df4 <__unordtf2>
   160dc:	16051a63          	bnez	a0,16250 <_ldtoa_r+0x298>
   160e0:	7fff0737          	lui	a4,0x7fff0
   160e4:	fff00493          	li	s1,-1
   160e8:	fff70c93          	addi	s9,a4,-1 # 7ffeffff <__BSS_END__+0x7ffcc5ab>
   160ec:	02010593          	addi	a1,sp,32
   160f0:	03010513          	addi	a0,sp,48
   160f4:	03412823          	sw	s4,48(sp)
   160f8:	03312a23          	sw	s3,52(sp)
   160fc:	03212c23          	sw	s2,56(sp)
   16100:	02812e23          	sw	s0,60(sp)
   16104:	03912623          	sw	s9,44(sp)
   16108:	02912023          	sw	s1,32(sp)
   1610c:	02912223          	sw	s1,36(sp)
   16110:	02912423          	sw	s1,40(sp)
   16114:	4e10b0ef          	jal	21df4 <__unordtf2>
   16118:	08051c63          	bnez	a0,161b0 <_ldtoa_r+0x1f8>
   1611c:	02010593          	addi	a1,sp,32
   16120:	03010513          	addi	a0,sp,48
   16124:	420090ef          	jal	1f544 <__letf2>
   16128:	08a05463          	blez	a0,161b0 <_ldtoa_r+0x1f8>
   1612c:	00300793          	li	a5,3
   16130:	04f12423          	sw	a5,72(sp)
   16134:	01812783          	lw	a5,24(sp)
   16138:	01c12803          	lw	a6,28(sp)
   1613c:	01412603          	lw	a2,20(sp)
   16140:	04810713          	addi	a4,sp,72
   16144:	01a12023          	sw	s10,0(sp)
   16148:	000b0513          	mv	a0,s6
   1614c:	000b8893          	mv	a7,s7
   16150:	04c10693          	addi	a3,sp,76
   16154:	05c10593          	addi	a1,sp,92
   16158:	20c000ef          	jal	16364 <__gdtoa>
   1615c:	000ba703          	lw	a4,0(s7)
   16160:	ffff87b7          	lui	a5,0xffff8
   16164:	00f71863          	bne	a4,a5,16174 <_ldtoa_r+0x1bc>
   16168:	800007b7          	lui	a5,0x80000
   1616c:	fff78793          	addi	a5,a5,-1 # 7fffffff <__BSS_END__+0x7ffdc5ab>
   16170:	00fba023          	sw	a5,0(s7)
   16174:	0ac12083          	lw	ra,172(sp)
   16178:	0a812403          	lw	s0,168(sp)
   1617c:	0a412483          	lw	s1,164(sp)
   16180:	0a012903          	lw	s2,160(sp)
   16184:	09c12983          	lw	s3,156(sp)
   16188:	09812a03          	lw	s4,152(sp)
   1618c:	09412a83          	lw	s5,148(sp)
   16190:	09012b03          	lw	s6,144(sp)
   16194:	08c12b83          	lw	s7,140(sp)
   16198:	08812c03          	lw	s8,136(sp)
   1619c:	08412c83          	lw	s9,132(sp)
   161a0:	08012d03          	lw	s10,128(sp)
   161a4:	07c12d83          	lw	s11,124(sp)
   161a8:	0b010113          	addi	sp,sp,176
   161ac:	00008067          	ret
   161b0:	000107b7          	lui	a5,0x10
   161b4:	02010593          	addi	a1,sp,32
   161b8:	03010513          	addi	a0,sp,48
   161bc:	03412823          	sw	s4,48(sp)
   161c0:	03312a23          	sw	s3,52(sp)
   161c4:	03212c23          	sw	s2,56(sp)
   161c8:	02812e23          	sw	s0,60(sp)
   161cc:	02012023          	sw	zero,32(sp)
   161d0:	02012223          	sw	zero,36(sp)
   161d4:	02012423          	sw	zero,40(sp)
   161d8:	02f12623          	sw	a5,44(sp)
   161dc:	248090ef          	jal	1f424 <__getf2>
   161e0:	00054e63          	bltz	a0,161fc <_ldtoa_r+0x244>
   161e4:	000107b7          	lui	a5,0x10
   161e8:	00fdedb3          	or	s11,s11,a5
   161ec:	00100793          	li	a5,1
   161f0:	05b12c23          	sw	s11,88(sp)
   161f4:	04f12423          	sw	a5,72(sp)
   161f8:	f3dff06f          	j	16134 <_ldtoa_r+0x17c>
   161fc:	02010593          	addi	a1,sp,32
   16200:	03010513          	addi	a0,sp,48
   16204:	03412823          	sw	s4,48(sp)
   16208:	03312a23          	sw	s3,52(sp)
   1620c:	03212c23          	sw	s2,56(sp)
   16210:	03812e23          	sw	s8,60(sp)
   16214:	02012023          	sw	zero,32(sp)
   16218:	02012223          	sw	zero,36(sp)
   1621c:	02012423          	sw	zero,40(sp)
   16220:	02012623          	sw	zero,44(sp)
   16224:	134090ef          	jal	1f358 <__eqtf2>
   16228:	00051663          	bnez	a0,16234 <_ldtoa_r+0x27c>
   1622c:	04012423          	sw	zero,72(sp)
   16230:	f05ff06f          	j	16134 <_ldtoa_r+0x17c>
   16234:	ffffc4b7          	lui	s1,0xffffc
   16238:	f9248493          	addi	s1,s1,-110 # ffffbf92 <__BSS_END__+0xfffd853e>
   1623c:	00200793          	li	a5,2
   16240:	009a8733          	add	a4,s5,s1
   16244:	00e12a23          	sw	a4,20(sp)
   16248:	04f12423          	sw	a5,72(sp)
   1624c:	ee9ff06f          	j	16134 <_ldtoa_r+0x17c>
   16250:	00400793          	li	a5,4
   16254:	04f12423          	sw	a5,72(sp)
   16258:	eddff06f          	j	16134 <_ldtoa_r+0x17c>

0001625c <_ldcheck>:
   1625c:	fc010113          	addi	sp,sp,-64
   16260:	02812c23          	sw	s0,56(sp)
   16264:	00c52403          	lw	s0,12(a0)
   16268:	03312623          	sw	s3,44(sp)
   1626c:	03412423          	sw	s4,40(sp)
   16270:	00852983          	lw	s3,8(a0)
   16274:	00452a03          	lw	s4,4(a0)
   16278:	03512223          	sw	s5,36(sp)
   1627c:	00052a83          	lw	s5,0(a0)
   16280:	00141413          	slli	s0,s0,0x1
   16284:	00145413          	srli	s0,s0,0x1
   16288:	01010513          	addi	a0,sp,16
   1628c:	00010593          	mv	a1,sp
   16290:	02112e23          	sw	ra,60(sp)
   16294:	00812e23          	sw	s0,28(sp)
   16298:	00812623          	sw	s0,12(sp)
   1629c:	01512823          	sw	s5,16(sp)
   162a0:	01512023          	sw	s5,0(sp)
   162a4:	01412a23          	sw	s4,20(sp)
   162a8:	01412223          	sw	s4,4(sp)
   162ac:	01312c23          	sw	s3,24(sp)
   162b0:	01312423          	sw	s3,8(sp)
   162b4:	3410b0ef          	jal	21df4 <__unordtf2>
   162b8:	08051663          	bnez	a0,16344 <_ldcheck+0xe8>
   162bc:	03612023          	sw	s6,32(sp)
   162c0:	7fff0b37          	lui	s6,0x7fff0
   162c4:	03212823          	sw	s2,48(sp)
   162c8:	fffb0b13          	addi	s6,s6,-1 # 7ffeffff <__BSS_END__+0x7ffcc5ab>
   162cc:	fff00913          	li	s2,-1
   162d0:	00010593          	mv	a1,sp
   162d4:	01010513          	addi	a0,sp,16
   162d8:	02912a23          	sw	s1,52(sp)
   162dc:	01612623          	sw	s6,12(sp)
   162e0:	01212023          	sw	s2,0(sp)
   162e4:	01212223          	sw	s2,4(sp)
   162e8:	01212423          	sw	s2,8(sp)
   162ec:	00100493          	li	s1,1
   162f0:	3050b0ef          	jal	21df4 <__unordtf2>
   162f4:	02050c63          	beqz	a0,1632c <_ldcheck+0xd0>
   162f8:	03c12083          	lw	ra,60(sp)
   162fc:	03812403          	lw	s0,56(sp)
   16300:	0014c513          	xori	a0,s1,1
   16304:	0ff57513          	zext.b	a0,a0
   16308:	03412483          	lw	s1,52(sp)
   1630c:	03012903          	lw	s2,48(sp)
   16310:	02012b03          	lw	s6,32(sp)
   16314:	02c12983          	lw	s3,44(sp)
   16318:	02812a03          	lw	s4,40(sp)
   1631c:	02412a83          	lw	s5,36(sp)
   16320:	00151513          	slli	a0,a0,0x1
   16324:	04010113          	addi	sp,sp,64
   16328:	00008067          	ret
   1632c:	00010593          	mv	a1,sp
   16330:	01010513          	addi	a0,sp,16
   16334:	210090ef          	jal	1f544 <__letf2>
   16338:	fca050e3          	blez	a0,162f8 <_ldcheck+0x9c>
   1633c:	00000493          	li	s1,0
   16340:	fb9ff06f          	j	162f8 <_ldcheck+0x9c>
   16344:	03c12083          	lw	ra,60(sp)
   16348:	03812403          	lw	s0,56(sp)
   1634c:	02c12983          	lw	s3,44(sp)
   16350:	02812a03          	lw	s4,40(sp)
   16354:	02412a83          	lw	s5,36(sp)
   16358:	00100513          	li	a0,1
   1635c:	04010113          	addi	sp,sp,64
   16360:	00008067          	ret

00016364 <__gdtoa>:
   16364:	e0010113          	addi	sp,sp,-512
   16368:	1da12823          	sw	s10,464(sp)
   1636c:	00072d03          	lw	s10,0(a4)
   16370:	1e112e23          	sw	ra,508(sp)
   16374:	00070f93          	mv	t6,a4
   16378:	fcfd7e13          	andi	t3,s10,-49
   1637c:	01c72023          	sw	t3,0(a4)
   16380:	20012703          	lw	a4,512(sp)
   16384:	00fd7e13          	andi	t3,s10,15
   16388:	00300e93          	li	t4,3
   1638c:	00b12c23          	sw	a1,24(sp)
   16390:	00c12423          	sw	a2,8(sp)
   16394:	01012a23          	sw	a6,20(sp)
   16398:	01112023          	sw	a7,0(sp)
   1639c:	00e12223          	sw	a4,4(sp)
   163a0:	43de0e63          	beq	t3,t4,167dc <__gdtoa+0x478>
   163a4:	1f612023          	sw	s6,480(sp)
   163a8:	1db12623          	sw	s11,460(sp)
   163ac:	00cd7b13          	andi	s6,s10,12
   163b0:	320b1663          	bnez	s6,166dc <__gdtoa+0x378>
   163b4:	1e812c23          	sw	s0,504(sp)
   163b8:	00050413          	mv	s0,a0
   163bc:	3c0e0e63          	beqz	t3,16798 <__gdtoa+0x434>
   163c0:	1d712e23          	sw	s7,476(sp)
   163c4:	0005ab83          	lw	s7,0(a1)
   163c8:	1f312623          	sw	s3,492(sp)
   163cc:	1f412423          	sw	s4,488(sp)
   163d0:	00078993          	mv	s3,a5
   163d4:	02000793          	li	a5,32
   163d8:	00068a13          	mv	s4,a3
   163dc:	00000593          	li	a1,0
   163e0:	0177d863          	bge	a5,s7,163f0 <__gdtoa+0x8c>
   163e4:	00179793          	slli	a5,a5,0x1
   163e8:	00158593          	addi	a1,a1,1
   163ec:	ff77cce3          	blt	a5,s7,163e4 <__gdtoa+0x80>
   163f0:	00040513          	mv	a0,s0
   163f4:	01f12e23          	sw	t6,28(sp)
   163f8:	35c020ef          	jal	18754 <_Balloc>
   163fc:	00a12823          	sw	a0,16(sp)
   16400:	01c12f83          	lw	t6,28(sp)
   16404:	0c0504e3          	beqz	a0,16ccc <__gdtoa+0x968>
   16408:	01012783          	lw	a5,16(sp)
   1640c:	fffb8513          	addi	a0,s7,-1
   16410:	40555513          	srai	a0,a0,0x5
   16414:	00251593          	slli	a1,a0,0x2
   16418:	01478693          	addi	a3,a5,20 # 10014 <exit-0xa0>
   1641c:	1f512223          	sw	s5,484(sp)
   16420:	1d812c23          	sw	s8,472(sp)
   16424:	00ba05b3          	add	a1,s4,a1
   16428:	000a0793          	mv	a5,s4
   1642c:	0007a703          	lw	a4,0(a5)
   16430:	00478793          	addi	a5,a5,4
   16434:	00468693          	addi	a3,a3,4
   16438:	fee6ae23          	sw	a4,-4(a3)
   1643c:	fef5f8e3          	bgeu	a1,a5,1642c <__gdtoa+0xc8>
   16440:	00158593          	addi	a1,a1,1
   16444:	001a0793          	addi	a5,s4,1
   16448:	00000693          	li	a3,0
   1644c:	00f5e463          	bltu	a1,a5,16454 <__gdtoa+0xf0>
   16450:	00251693          	slli	a3,a0,0x2
   16454:	01012783          	lw	a5,16(sp)
   16458:	00468693          	addi	a3,a3,4
   1645c:	4026da93          	srai	s5,a3,0x2
   16460:	00d786b3          	add	a3,a5,a3
   16464:	00c0006f          	j	16470 <__gdtoa+0x10c>
   16468:	ffc68693          	addi	a3,a3,-4
   1646c:	380a8e63          	beqz	s5,16808 <__gdtoa+0x4a4>
   16470:	0106a783          	lw	a5,16(a3)
   16474:	000a8c13          	mv	s8,s5
   16478:	fffa8a93          	addi	s5,s5,-1
   1647c:	fe0786e3          	beqz	a5,16468 <__gdtoa+0x104>
   16480:	01012703          	lw	a4,16(sp)
   16484:	002a9793          	slli	a5,s5,0x2
   16488:	01f12e23          	sw	t6,28(sp)
   1648c:	00f707b3          	add	a5,a4,a5
   16490:	0147a503          	lw	a0,20(a5)
   16494:	01872823          	sw	s8,16(a4)
   16498:	005c1c13          	slli	s8,s8,0x5
   1649c:	634020ef          	jal	18ad0 <__hi0bits>
   164a0:	01c12f83          	lw	t6,28(sp)
   164a4:	40ac0ab3          	sub	s5,s8,a0
   164a8:	01012503          	lw	a0,16(sp)
   164ac:	01f12e23          	sw	t6,28(sp)
   164b0:	240020ef          	jal	186f0 <__trailz_D2A>
   164b4:	00812783          	lw	a5,8(sp)
   164b8:	1aa12e23          	sw	a0,444(sp)
   164bc:	01c12f83          	lw	t6,28(sp)
   164c0:	04f12823          	sw	a5,80(sp)
   164c4:	7c051463          	bnez	a0,16c8c <__gdtoa+0x928>
   164c8:	01012783          	lw	a5,16(sp)
   164cc:	0107a683          	lw	a3,16(a5)
   164d0:	2a068463          	beqz	a3,16778 <__gdtoa+0x414>
   164d4:	01012503          	lw	a0,16(sp)
   164d8:	1bc10593          	addi	a1,sp,444
   164dc:	01f12e23          	sw	t6,28(sp)
   164e0:	1e912a23          	sw	s1,500(sp)
   164e4:	1f212823          	sw	s2,496(sp)
   164e8:	1d912a23          	sw	s9,468(sp)
   164ec:	0e8030ef          	jal	195d4 <__b2d>
   164f0:	00c59c13          	slli	s8,a1,0xc
   164f4:	00cc5c13          	srli	s8,s8,0xc
   164f8:	3ff006b7          	lui	a3,0x3ff00
   164fc:	00dc6933          	or	s2,s8,a3
   16500:	05012703          	lw	a4,80(sp)
   16504:	02a12023          	sw	a0,32(sp)
   16508:	03212223          	sw	s2,36(sp)
   1650c:	00050793          	mv	a5,a0
   16510:	ea81a603          	lw	a2,-344(gp) # 236b8 <__SDATA_BEGIN__>
   16514:	06a12023          	sw	a0,96(sp)
   16518:	eac1a683          	lw	a3,-340(gp) # 236bc <__SDATA_BEGIN__+0x4>
   1651c:	02012503          	lw	a0,32(sp)
   16520:	02412583          	lw	a1,36(sp)
   16524:	01570c33          	add	s8,a4,s5
   16528:	06f12423          	sw	a5,104(sp)
   1652c:	05812a23          	sw	s8,84(sp)
   16530:	564080ef          	jal	1ea94 <__subdf3>
   16534:	eb01a603          	lw	a2,-336(gp) # 236c0 <__SDATA_BEGIN__+0x8>
   16538:	eb41a683          	lw	a3,-332(gp) # 236c4 <__SDATA_BEGIN__+0xc>
   1653c:	fffc0c93          	addi	s9,s8,-1
   16540:	6a1070ef          	jal	1e3e0 <__muldf3>
   16544:	eb81a603          	lw	a2,-328(gp) # 236c8 <__SDATA_BEGIN__+0x10>
   16548:	ebc1a683          	lw	a3,-324(gp) # 236cc <__SDATA_BEGIN__+0x14>
   1654c:	525060ef          	jal	1d270 <__adddf3>
   16550:	00050d93          	mv	s11,a0
   16554:	000c8513          	mv	a0,s9
   16558:	00058493          	mv	s1,a1
   1655c:	549080ef          	jal	1f2a4 <__floatsidf>
   16560:	ec01a603          	lw	a2,-320(gp) # 236d0 <__SDATA_BEGIN__+0x18>
   16564:	ec41a683          	lw	a3,-316(gp) # 236d4 <__SDATA_BEGIN__+0x1c>
   16568:	679070ef          	jal	1e3e0 <__muldf3>
   1656c:	03b12423          	sw	s11,40(sp)
   16570:	02912623          	sw	s1,44(sp)
   16574:	00050613          	mv	a2,a0
   16578:	00058693          	mv	a3,a1
   1657c:	02812503          	lw	a0,40(sp)
   16580:	02c12583          	lw	a1,44(sp)
   16584:	4ed060ef          	jal	1d270 <__adddf3>
   16588:	00050d93          	mv	s11,a0
   1658c:	01c12f83          	lw	t6,28(sp)
   16590:	00058493          	mv	s1,a1
   16594:	000c8513          	mv	a0,s9
   16598:	000cd663          	bgez	s9,165a4 <__gdtoa+0x240>
   1659c:	00100513          	li	a0,1
   165a0:	41850533          	sub	a0,a0,s8
   165a4:	bcb50513          	addi	a0,a0,-1077
   165a8:	04a05063          	blez	a0,165e8 <__gdtoa+0x284>
   165ac:	01f12e23          	sw	t6,28(sp)
   165b0:	4f5080ef          	jal	1f2a4 <__floatsidf>
   165b4:	ec81a603          	lw	a2,-312(gp) # 236d8 <__SDATA_BEGIN__+0x20>
   165b8:	ecc1a683          	lw	a3,-308(gp) # 236dc <__SDATA_BEGIN__+0x24>
   165bc:	625070ef          	jal	1e3e0 <__muldf3>
   165c0:	05b12023          	sw	s11,64(sp)
   165c4:	04912223          	sw	s1,68(sp)
   165c8:	00050613          	mv	a2,a0
   165cc:	00058693          	mv	a3,a1
   165d0:	04012503          	lw	a0,64(sp)
   165d4:	04412583          	lw	a1,68(sp)
   165d8:	499060ef          	jal	1d270 <__adddf3>
   165dc:	01c12f83          	lw	t6,28(sp)
   165e0:	00050d93          	mv	s11,a0
   165e4:	00058493          	mv	s1,a1
   165e8:	03b12823          	sw	s11,48(sp)
   165ec:	02912a23          	sw	s1,52(sp)
   165f0:	03412583          	lw	a1,52(sp)
   165f4:	03012503          	lw	a0,48(sp)
   165f8:	03f12023          	sw	t6,32(sp)
   165fc:	429080ef          	jal	1f224 <__fixdfsi>
   16600:	03b12c23          	sw	s11,56(sp)
   16604:	02912e23          	sw	s1,60(sp)
   16608:	00050893          	mv	a7,a0
   1660c:	03c12583          	lw	a1,60(sp)
   16610:	03812503          	lw	a0,56(sp)
   16614:	00000613          	li	a2,0
   16618:	00000693          	li	a3,0
   1661c:	00088c13          	mv	s8,a7
   16620:	01112e23          	sw	a7,28(sp)
   16624:	4ed070ef          	jal	1e310 <__ledf2>
   16628:	02012f83          	lw	t6,32(sp)
   1662c:	02055863          	bgez	a0,1665c <__gdtoa+0x2f8>
   16630:	000c0513          	mv	a0,s8
   16634:	471080ef          	jal	1f2a4 <__floatsidf>
   16638:	05b12c23          	sw	s11,88(sp)
   1663c:	04912e23          	sw	s1,92(sp)
   16640:	05812603          	lw	a2,88(sp)
   16644:	05c12683          	lw	a3,92(sp)
   16648:	36d070ef          	jal	1e1b4 <__eqdf2>
   1664c:	00a03533          	snez	a0,a0
   16650:	02012f83          	lw	t6,32(sp)
   16654:	40ac07b3          	sub	a5,s8,a0
   16658:	00f12e23          	sw	a5,28(sp)
   1665c:	014c9613          	slli	a2,s9,0x14
   16660:	01c12483          	lw	s1,28(sp)
   16664:	419a8cb3          	sub	s9,s5,s9
   16668:	01260c33          	add	s8,a2,s2
   1666c:	fffc8913          	addi	s2,s9,-1
   16670:	01600693          	li	a3,22
   16674:	03212023          	sw	s2,32(sp)
   16678:	1896ee63          	bltu	a3,s1,16814 <__gdtoa+0x4b0>
   1667c:	06012603          	lw	a2,96(sp)
   16680:	00023e37          	lui	t3,0x23
   16684:	828e0593          	addi	a1,t3,-2008 # 22828 <__mprec_tens>
   16688:	00349693          	slli	a3,s1,0x3
   1668c:	00b686b3          	add	a3,a3,a1
   16690:	04c12423          	sw	a2,72(sp)
   16694:	05812623          	sw	s8,76(sp)
   16698:	0006a503          	lw	a0,0(a3) # 3ff00000 <__BSS_END__+0x3fedc5ac>
   1669c:	0046a583          	lw	a1,4(a3)
   166a0:	04812603          	lw	a2,72(sp)
   166a4:	04c12683          	lw	a3,76(sp)
   166a8:	03f12423          	sw	t6,40(sp)
   166ac:	395070ef          	jal	1e240 <__gedf2>
   166b0:	02812f83          	lw	t6,40(sp)
   166b4:	64a04063          	bgtz	a0,16cf4 <__gdtoa+0x990>
   166b8:	01904463          	bgtz	s9,166c0 <__gdtoa+0x35c>
   166bc:	05c0106f          	j	17718 <__gdtoa+0x13b4>
   166c0:	009907b3          	add	a5,s2,s1
   166c4:	02f12023          	sw	a5,32(sp)
   166c8:	06012223          	sw	zero,100(sp)
   166cc:	04912423          	sw	s1,72(sp)
   166d0:	02012823          	sw	zero,48(sp)
   166d4:	04012023          	sw	zero,64(sp)
   166d8:	1740006f          	j	1684c <__gdtoa+0x4e8>
   166dc:	00400793          	li	a5,4
   166e0:	06fe1c63          	bne	t3,a5,16758 <__gdtoa+0x3f4>
   166e4:	00012703          	lw	a4,0(sp)
   166e8:	00412603          	lw	a2,4(sp)
   166ec:	1e012b03          	lw	s6,480(sp)
   166f0:	1cc12d83          	lw	s11,460(sp)
   166f4:	1fc12083          	lw	ra,508(sp)
   166f8:	1d012d03          	lw	s10,464(sp)
   166fc:	ffff87b7          	lui	a5,0xffff8
   16700:	000225b7          	lui	a1,0x22
   16704:	00f72023          	sw	a5,0(a4)
   16708:	000e8693          	mv	a3,t4
   1670c:	48858593          	addi	a1,a1,1160 # 22488 <__clzsi2+0xe8>
   16710:	20010113          	addi	sp,sp,512
   16714:	3ad0106f          	j	182c0 <__nrv_alloc_D2A>
   16718:	000b8593          	mv	a1,s7
   1671c:	00040513          	mv	a0,s0
   16720:	01f12423          	sw	t6,8(sp)
   16724:	221020ef          	jal	19144 <__lshift>
   16728:	00812f83          	lw	t6,8(sp)
   1672c:	00050b93          	mv	s7,a0
   16730:	0a051ae3          	bnez	a0,16fe4 <__gdtoa+0xc80>
   16734:	1f812403          	lw	s0,504(sp)
   16738:	1f412483          	lw	s1,500(sp)
   1673c:	1f012903          	lw	s2,496(sp)
   16740:	1ec12983          	lw	s3,492(sp)
   16744:	1e812a03          	lw	s4,488(sp)
   16748:	1e412a83          	lw	s5,484(sp)
   1674c:	1dc12b83          	lw	s7,476(sp)
   16750:	1d812c03          	lw	s8,472(sp)
   16754:	1d412c83          	lw	s9,468(sp)
   16758:	00000d93          	li	s11,0
   1675c:	1fc12083          	lw	ra,508(sp)
   16760:	1e012b03          	lw	s6,480(sp)
   16764:	1d012d03          	lw	s10,464(sp)
   16768:	000d8513          	mv	a0,s11
   1676c:	1cc12d83          	lw	s11,460(sp)
   16770:	20010113          	addi	sp,sp,512
   16774:	00008067          	ret
   16778:	00078593          	mv	a1,a5
   1677c:	00040513          	mv	a0,s0
   16780:	084020ef          	jal	18804 <_Bfree>
   16784:	1ec12983          	lw	s3,492(sp)
   16788:	1e812a03          	lw	s4,488(sp)
   1678c:	1e412a83          	lw	s5,484(sp)
   16790:	1dc12b83          	lw	s7,476(sp)
   16794:	1d812c03          	lw	s8,472(sp)
   16798:	00012783          	lw	a5,0(sp)
   1679c:	00412603          	lw	a2,4(sp)
   167a0:	00100693          	li	a3,1
   167a4:	000225b7          	lui	a1,0x22
   167a8:	00040513          	mv	a0,s0
   167ac:	00d7a023          	sw	a3,0(a5) # ffff8000 <__BSS_END__+0xfffd45ac>
   167b0:	47858593          	addi	a1,a1,1144 # 22478 <__clzsi2+0xd8>
   167b4:	30d010ef          	jal	182c0 <__nrv_alloc_D2A>
   167b8:	1fc12083          	lw	ra,508(sp)
   167bc:	1f812403          	lw	s0,504(sp)
   167c0:	00050d93          	mv	s11,a0
   167c4:	1e012b03          	lw	s6,480(sp)
   167c8:	1d012d03          	lw	s10,464(sp)
   167cc:	000d8513          	mv	a0,s11
   167d0:	1cc12d83          	lw	s11,460(sp)
   167d4:	20010113          	addi	sp,sp,512
   167d8:	00008067          	ret
   167dc:	00012703          	lw	a4,0(sp)
   167e0:	00412603          	lw	a2,4(sp)
   167e4:	1fc12083          	lw	ra,508(sp)
   167e8:	1d012d03          	lw	s10,464(sp)
   167ec:	ffff87b7          	lui	a5,0xffff8
   167f0:	000225b7          	lui	a1,0x22
   167f4:	00f72023          	sw	a5,0(a4)
   167f8:	47c58593          	addi	a1,a1,1148 # 2247c <__clzsi2+0xdc>
   167fc:	00800693          	li	a3,8
   16800:	20010113          	addi	sp,sp,512
   16804:	2bd0106f          	j	182c0 <__nrv_alloc_D2A>
   16808:	01012783          	lw	a5,16(sp)
   1680c:	0007a823          	sw	zero,16(a5) # ffff8010 <__BSS_END__+0xfffd45bc>
   16810:	c99ff06f          	j	164a8 <__gdtoa+0x144>
   16814:	00100793          	li	a5,1
   16818:	06f12223          	sw	a5,100(sp)
   1681c:	02012783          	lw	a5,32(sp)
   16820:	02012823          	sw	zero,48(sp)
   16824:	4a07ce63          	bltz	a5,16ce0 <__gdtoa+0x97c>
   16828:	01c12783          	lw	a5,28(sp)
   1682c:	4807d463          	bgez	a5,16cb4 <__gdtoa+0x950>
   16830:	03012703          	lw	a4,48(sp)
   16834:	01c12783          	lw	a5,28(sp)
   16838:	04012423          	sw	zero,72(sp)
   1683c:	40f70733          	sub	a4,a4,a5
   16840:	40f007b3          	neg	a5,a5
   16844:	02e12823          	sw	a4,48(sp)
   16848:	04f12023          	sw	a5,64(sp)
   1684c:	00900693          	li	a3,9
   16850:	1d36eee3          	bltu	a3,s3,1722c <__gdtoa+0xec8>
   16854:	00500613          	li	a2,5
   16858:	353658e3          	bge	a2,s3,173a8 <__gdtoa+0x1044>
   1685c:	ffc98993          	addi	s3,s3,-4
   16860:	00400693          	li	a3,4
   16864:	20d98ee3          	beq	s3,a3,17280 <__gdtoa+0xf1c>
   16868:	68c98ee3          	beq	s3,a2,17704 <__gdtoa+0x13a0>
   1686c:	00200693          	li	a3,2
   16870:	04012c23          	sw	zero,88(sp)
   16874:	00000493          	li	s1,0
   16878:	20d98ae3          	beq	s3,a3,1728c <__gdtoa+0xf28>
   1687c:	00300993          	li	s3,3
   16880:	01412783          	lw	a5,20(sp)
   16884:	01c12703          	lw	a4,28(sp)
   16888:	00e787b3          	add	a5,a5,a4
   1688c:	08f12c23          	sw	a5,152(sp)
   16890:	00178793          	addi	a5,a5,1
   16894:	02f12423          	sw	a5,40(sp)
   16898:	58f052e3          	blez	a5,1761c <__gdtoa+0x12b8>
   1689c:	00078693          	mv	a3,a5
   168a0:	00078593          	mv	a1,a5
   168a4:	00040513          	mv	a0,s0
   168a8:	05f12a23          	sw	t6,84(sp)
   168ac:	1ad12e23          	sw	a3,444(sp)
   168b0:	1a5010ef          	jal	18254 <__rv_alloc_D2A>
   168b4:	00050d93          	mv	s11,a0
   168b8:	e6050ee3          	beqz	a0,16734 <__gdtoa+0x3d0>
   168bc:	01812783          	lw	a5,24(sp)
   168c0:	05412f83          	lw	t6,84(sp)
   168c4:	00c7a783          	lw	a5,12(a5)
   168c8:	fff78793          	addi	a5,a5,-1
   168cc:	02f12c23          	sw	a5,56(sp)
   168d0:	02078463          	beqz	a5,168f8 <__gdtoa+0x594>
   168d4:	0007d663          	bgez	a5,168e0 <__gdtoa+0x57c>
   168d8:	00200793          	li	a5,2
   168dc:	02f12c23          	sw	a5,56(sp)
   168e0:	100d7313          	andi	t1,s10,256
   168e4:	42030263          	beqz	t1,16d08 <__gdtoa+0x9a4>
   168e8:	03812783          	lw	a5,56(sp)
   168ec:	00300693          	li	a3,3
   168f0:	40f687b3          	sub	a5,a3,a5
   168f4:	02f12c23          	sw	a5,56(sp)
   168f8:	02812903          	lw	s2,40(sp)
   168fc:	00e00693          	li	a3,14
   16900:	4126e463          	bltu	a3,s2,16d08 <__gdtoa+0x9a4>
   16904:	40048263          	beqz	s1,16d08 <__gdtoa+0x9a4>
   16908:	03812783          	lw	a5,56(sp)
   1690c:	01c12703          	lw	a4,28(sp)
   16910:	00e7e6b3          	or	a3,a5,a4
   16914:	3e069a63          	bnez	a3,16d08 <__gdtoa+0x9a4>
   16918:	06412783          	lw	a5,100(sp)
   1691c:	1a012e23          	sw	zero,444(sp)
   16920:	09812e23          	sw	s8,156(sp)
   16924:	06012483          	lw	s1,96(sp)
   16928:	02078863          	beqz	a5,16958 <__gdtoa+0x5f4>
   1692c:	0c912023          	sw	s1,192(sp)
   16930:	0d812223          	sw	s8,196(sp)
   16934:	ed81a603          	lw	a2,-296(gp) # 236e8 <__SDATA_BEGIN__+0x30>
   16938:	0c012503          	lw	a0,192(sp)
   1693c:	0c412583          	lw	a1,196(sp)
   16940:	edc1a683          	lw	a3,-292(gp) # 236ec <__SDATA_BEGIN__+0x34>
   16944:	03f12c23          	sw	t6,56(sp)
   16948:	1c9070ef          	jal	1e310 <__ledf2>
   1694c:	03812f83          	lw	t6,56(sp)
   16950:	00055463          	bgez	a0,16958 <__gdtoa+0x5f4>
   16954:	5540106f          	j	17ea8 <__gdtoa+0x1b44>
   16958:	06012783          	lw	a5,96(sp)
   1695c:	03f12c23          	sw	t6,56(sp)
   16960:	0af12023          	sw	a5,160(sp)
   16964:	0af12423          	sw	a5,168(sp)
   16968:	09c12783          	lw	a5,156(sp)
   1696c:	0a012603          	lw	a2,160(sp)
   16970:	0a812503          	lw	a0,168(sp)
   16974:	0af12223          	sw	a5,164(sp)
   16978:	0af12623          	sw	a5,172(sp)
   1697c:	0a412683          	lw	a3,164(sp)
   16980:	0ac12583          	lw	a1,172(sp)
   16984:	0ed060ef          	jal	1d270 <__adddf3>
   16988:	ef01a603          	lw	a2,-272(gp) # 23700 <__SDATA_BEGIN__+0x48>
   1698c:	ef41a683          	lw	a3,-268(gp) # 23704 <__SDATA_BEGIN__+0x4c>
   16990:	0e1060ef          	jal	1d270 <__adddf3>
   16994:	02812783          	lw	a5,40(sp)
   16998:	fcc006b7          	lui	a3,0xfcc00
   1699c:	03812f83          	lw	t6,56(sp)
   169a0:	00050913          	mv	s2,a0
   169a4:	00b68cb3          	add	s9,a3,a1
   169a8:	00079463          	bnez	a5,169b0 <__gdtoa+0x64c>
   169ac:	0180106f          	j	179c4 <__gdtoa+0x1660>
   169b0:	02812783          	lw	a5,40(sp)
   169b4:	06012703          	lw	a4,96(sp)
   169b8:	09c12f03          	lw	t5,156(sp)
   169bc:	0a012023          	sw	zero,160(sp)
   169c0:	04f12a23          	sw	a5,84(sp)
   169c4:	05412783          	lw	a5,84(sp)
   169c8:	00023e37          	lui	t3,0x23
   169cc:	828e0613          	addi	a2,t3,-2008 # 22828 <__mprec_tens>
   169d0:	00379693          	slli	a3,a5,0x3
   169d4:	05812783          	lw	a5,88(sp)
   169d8:	00c686b3          	add	a3,a3,a2
   169dc:	0be12423          	sw	t5,168(sp)
   169e0:	02e12c23          	sw	a4,56(sp)
   169e4:	ff86a603          	lw	a2,-8(a3) # fcbffff8 <__BSS_END__+0xfcbdc5a4>
   169e8:	ffc6a683          	lw	a3,-4(a3)
   169ec:	00079463          	bnez	a5,169f4 <__gdtoa+0x690>
   169f0:	2b00106f          	j	17ca0 <__gdtoa+0x193c>
   169f4:	f001a503          	lw	a0,-256(gp) # 23710 <__SDATA_BEGIN__+0x58>
   169f8:	f041a583          	lw	a1,-252(gp) # 23714 <__SDATA_BEGIN__+0x5c>
   169fc:	0df12423          	sw	t6,200(sp)
   16a00:	13c12823          	sw	t3,304(sp)
   16a04:	7ed060ef          	jal	1d9f0 <__divdf3>
   16a08:	11212023          	sw	s2,256(sp)
   16a0c:	11912223          	sw	s9,260(sp)
   16a10:	10012603          	lw	a2,256(sp)
   16a14:	10412683          	lw	a3,260(sp)
   16a18:	001d8d13          	addi	s10,s11,1
   16a1c:	078080ef          	jal	1ea94 <__subdf3>
   16a20:	03812703          	lw	a4,56(sp)
   16a24:	0a812f03          	lw	t5,168(sp)
   16a28:	00050c93          	mv	s9,a0
   16a2c:	10e12423          	sw	a4,264(sp)
   16a30:	11e12623          	sw	t5,268(sp)
   16a34:	00058c13          	mv	s8,a1
   16a38:	10812503          	lw	a0,264(sp)
   16a3c:	10c12583          	lw	a1,268(sp)
   16a40:	0ce12023          	sw	a4,192(sp)
   16a44:	07e12423          	sw	t5,104(sp)
   16a48:	7dc080ef          	jal	1f224 <__fixdfsi>
   16a4c:	02a12c23          	sw	a0,56(sp)
   16a50:	055080ef          	jal	1f2a4 <__floatsidf>
   16a54:	0c012703          	lw	a4,192(sp)
   16a58:	06812f03          	lw	t5,104(sp)
   16a5c:	00050613          	mv	a2,a0
   16a60:	10e12823          	sw	a4,272(sp)
   16a64:	11e12a23          	sw	t5,276(sp)
   16a68:	00058693          	mv	a3,a1
   16a6c:	11012503          	lw	a0,272(sp)
   16a70:	11412583          	lw	a1,276(sp)
   16a74:	020080ef          	jal	1ea94 <__subdf3>
   16a78:	03812e83          	lw	t4,56(sp)
   16a7c:	10a12c23          	sw	a0,280(sp)
   16a80:	10b12e23          	sw	a1,284(sp)
   16a84:	13912023          	sw	s9,288(sp)
   16a88:	13812223          	sw	s8,292(sp)
   16a8c:	11812603          	lw	a2,280(sp)
   16a90:	11c12683          	lw	a3,284(sp)
   16a94:	00050493          	mv	s1,a0
   16a98:	00058913          	mv	s2,a1
   16a9c:	12012503          	lw	a0,288(sp)
   16aa0:	12412583          	lw	a1,292(sp)
   16aa4:	030e8e93          	addi	t4,t4,48
   16aa8:	01dd8023          	sb	t4,0(s11)
   16aac:	794070ef          	jal	1e240 <__gedf2>
   16ab0:	0c812f83          	lw	t6,200(sp)
   16ab4:	00a05463          	blez	a0,16abc <__gdtoa+0x758>
   16ab8:	52c0106f          	j	17fe4 <__gdtoa+0x1c80>
   16abc:	ed81a783          	lw	a5,-296(gp) # 236e8 <__SDATA_BEGIN__+0x30>
   16ac0:	edc1a803          	lw	a6,-292(gp) # 236ec <__SDATA_BEGIN__+0x34>
   16ac4:	13012e03          	lw	t3,304(sp)
   16ac8:	06f12423          	sw	a5,104(sp)
   16acc:	07012623          	sw	a6,108(sp)
   16ad0:	ee01a783          	lw	a5,-288(gp) # 236f0 <__SDATA_BEGIN__+0x38>
   16ad4:	ee41a803          	lw	a6,-284(gp) # 236f4 <__SDATA_BEGIN__+0x3c>
   16ad8:	11312023          	sw	s3,256(sp)
   16adc:	02f12c23          	sw	a5,56(sp)
   16ae0:	03012e23          	sw	a6,60(sp)
   16ae4:	0d712823          	sw	s7,208(sp)
   16ae8:	0d512c23          	sw	s5,216(sp)
   16aec:	0f612023          	sw	s6,224(sp)
   16af0:	0bb12423          	sw	s11,168(sp)
   16af4:	0c812023          	sw	s0,192(sp)
   16af8:	0f412c23          	sw	s4,248(sp)
   16afc:	11c12423          	sw	t3,264(sp)
   16b00:	00048993          	mv	s3,s1
   16b04:	0a40006f          	j	16ba8 <__gdtoa+0x844>
   16b08:	1bc12783          	lw	a5,444(sp)
   16b0c:	05412703          	lw	a4,84(sp)
   16b10:	00178793          	addi	a5,a5,1
   16b14:	1af12e23          	sw	a5,444(sp)
   16b18:	00e7c463          	blt	a5,a4,16b20 <__gdtoa+0x7bc>
   16b1c:	5280106f          	j	18044 <__gdtoa+0x1ce0>
   16b20:	0c1070ef          	jal	1e3e0 <__muldf3>
   16b24:	07312823          	sw	s3,112(sp)
   16b28:	07212a23          	sw	s2,116(sp)
   16b2c:	03812603          	lw	a2,56(sp)
   16b30:	03c12683          	lw	a3,60(sp)
   16b34:	00050c93          	mv	s9,a0
   16b38:	00058c13          	mv	s8,a1
   16b3c:	07012503          	lw	a0,112(sp)
   16b40:	07412583          	lw	a1,116(sp)
   16b44:	001d0d13          	addi	s10,s10,1
   16b48:	099070ef          	jal	1e3e0 <__muldf3>
   16b4c:	00058993          	mv	s3,a1
   16b50:	00050d93          	mv	s11,a0
   16b54:	6d0080ef          	jal	1f224 <__fixdfsi>
   16b58:	00050913          	mv	s2,a0
   16b5c:	748080ef          	jal	1f2a4 <__floatsidf>
   16b60:	07312e23          	sw	s3,124(sp)
   16b64:	07b12c23          	sw	s11,120(sp)
   16b68:	00050613          	mv	a2,a0
   16b6c:	00058693          	mv	a3,a1
   16b70:	07812503          	lw	a0,120(sp)
   16b74:	07c12583          	lw	a1,124(sp)
   16b78:	71d070ef          	jal	1ea94 <__subdf3>
   16b7c:	09912023          	sw	s9,128(sp)
   16b80:	09812223          	sw	s8,132(sp)
   16b84:	08012603          	lw	a2,128(sp)
   16b88:	08412683          	lw	a3,132(sp)
   16b8c:	03090793          	addi	a5,s2,48
   16b90:	fefd0fa3          	sb	a5,-1(s10)
   16b94:	00050993          	mv	s3,a0
   16b98:	00058913          	mv	s2,a1
   16b9c:	774070ef          	jal	1e310 <__ledf2>
   16ba0:	00055463          	bgez	a0,16ba8 <__gdtoa+0x844>
   16ba4:	4300106f          	j	17fd4 <__gdtoa+0x1c70>
   16ba8:	06812503          	lw	a0,104(sp)
   16bac:	06c12583          	lw	a1,108(sp)
   16bb0:	00098613          	mv	a2,s3
   16bb4:	00090693          	mv	a3,s2
   16bb8:	6dd070ef          	jal	1ea94 <__subdf3>
   16bbc:	000c8613          	mv	a2,s9
   16bc0:	000c0693          	mv	a3,s8
   16bc4:	74c070ef          	jal	1e310 <__ledf2>
   16bc8:	00050793          	mv	a5,a0
   16bcc:	03812603          	lw	a2,56(sp)
   16bd0:	03c12683          	lw	a3,60(sp)
   16bd4:	000c8513          	mv	a0,s9
   16bd8:	000c0593          	mv	a1,s8
   16bdc:	f207d6e3          	bgez	a5,16b08 <__gdtoa+0x7a4>
   16be0:	0a012783          	lw	a5,160(sp)
   16be4:	0a812d83          	lw	s11,168(sp)
   16be8:	0c012403          	lw	s0,192(sp)
   16bec:	0c812f83          	lw	t6,200(sp)
   16bf0:	fffd4c03          	lbu	s8,-1(s10)
   16bf4:	00178b93          	addi	s7,a5,1
   16bf8:	03900693          	li	a3,57
   16bfc:	0140006f          	j	16c10 <__gdtoa+0x8ac>
   16c00:	00fd9463          	bne	s11,a5,16c08 <__gdtoa+0x8a4>
   16c04:	0040106f          	j	17c08 <__gdtoa+0x18a4>
   16c08:	fff7cc03          	lbu	s8,-1(a5)
   16c0c:	00078d13          	mv	s10,a5
   16c10:	fffd0793          	addi	a5,s10,-1
   16c14:	fedc06e3          	beq	s8,a3,16c00 <__gdtoa+0x89c>
   16c18:	001c0693          	addi	a3,s8,1
   16c1c:	0ff6f693          	zext.b	a3,a3
   16c20:	00d78023          	sb	a3,0(a5)
   16c24:	000b8493          	mv	s1,s7
   16c28:	02000b13          	li	s6,32
   16c2c:	01012583          	lw	a1,16(sp)
   16c30:	00040513          	mv	a0,s0
   16c34:	01f12423          	sw	t6,8(sp)
   16c38:	3cd010ef          	jal	18804 <_Bfree>
   16c3c:	00012783          	lw	a5,0(sp)
   16c40:	000d0023          	sb	zero,0(s10)
   16c44:	00812f83          	lw	t6,8(sp)
   16c48:	0097a023          	sw	s1,0(a5)
   16c4c:	00412783          	lw	a5,4(sp)
   16c50:	00078463          	beqz	a5,16c58 <__gdtoa+0x8f4>
   16c54:	01a7a023          	sw	s10,0(a5)
   16c58:	000fa783          	lw	a5,0(t6)
   16c5c:	1f812403          	lw	s0,504(sp)
   16c60:	1f412483          	lw	s1,500(sp)
   16c64:	0167e7b3          	or	a5,a5,s6
   16c68:	1f012903          	lw	s2,496(sp)
   16c6c:	1ec12983          	lw	s3,492(sp)
   16c70:	1e812a03          	lw	s4,488(sp)
   16c74:	1e412a83          	lw	s5,484(sp)
   16c78:	1dc12b83          	lw	s7,476(sp)
   16c7c:	1d812c03          	lw	s8,472(sp)
   16c80:	1d412c83          	lw	s9,468(sp)
   16c84:	00ffa023          	sw	a5,0(t6)
   16c88:	ad5ff06f          	j	1675c <__gdtoa+0x3f8>
   16c8c:	00050593          	mv	a1,a0
   16c90:	01012503          	lw	a0,16(sp)
   16c94:	179010ef          	jal	1860c <__rshift_D2A>
   16c98:	1bc12683          	lw	a3,444(sp)
   16c9c:	00812783          	lw	a5,8(sp)
   16ca0:	01c12f83          	lw	t6,28(sp)
   16ca4:	40da8ab3          	sub	s5,s5,a3
   16ca8:	00f687b3          	add	a5,a3,a5
   16cac:	04f12823          	sw	a5,80(sp)
   16cb0:	819ff06f          	j	164c8 <__gdtoa+0x164>
   16cb4:	02012703          	lw	a4,32(sp)
   16cb8:	04f12423          	sw	a5,72(sp)
   16cbc:	04012023          	sw	zero,64(sp)
   16cc0:	00f70733          	add	a4,a4,a5
   16cc4:	02e12023          	sw	a4,32(sp)
   16cc8:	b85ff06f          	j	1684c <__gdtoa+0x4e8>
   16ccc:	1f812403          	lw	s0,504(sp)
   16cd0:	1ec12983          	lw	s3,492(sp)
   16cd4:	1e812a03          	lw	s4,488(sp)
   16cd8:	1dc12b83          	lw	s7,476(sp)
   16cdc:	a7dff06f          	j	16758 <__gdtoa+0x3f4>
   16ce0:	00100693          	li	a3,1
   16ce4:	419687b3          	sub	a5,a3,s9
   16ce8:	02f12823          	sw	a5,48(sp)
   16cec:	02012023          	sw	zero,32(sp)
   16cf0:	b39ff06f          	j	16828 <__gdtoa+0x4c4>
   16cf4:	01c12783          	lw	a5,28(sp)
   16cf8:	06012223          	sw	zero,100(sp)
   16cfc:	fff78793          	addi	a5,a5,-1
   16d00:	00f12e23          	sw	a5,28(sp)
   16d04:	b19ff06f          	j	1681c <__gdtoa+0x4b8>
   16d08:	05012783          	lw	a5,80(sp)
   16d0c:	1a07cc63          	bltz	a5,16ec4 <__gdtoa+0xb60>
   16d10:	01c12783          	lw	a5,28(sp)
   16d14:	00e00693          	li	a3,14
   16d18:	1af6c663          	blt	a3,a5,16ec4 <__gdtoa+0xb60>
   16d1c:	000236b7          	lui	a3,0x23
   16d20:	82868693          	addi	a3,a3,-2008 # 22828 <__mprec_tens>
   16d24:	00379793          	slli	a5,a5,0x3
   16d28:	00d787b3          	add	a5,a5,a3
   16d2c:	0047a803          	lw	a6,4(a5)
   16d30:	0007a783          	lw	a5,0(a5)
   16d34:	01012623          	sw	a6,12(sp)
   16d38:	00f12423          	sw	a5,8(sp)
   16d3c:	01412783          	lw	a5,20(sp)
   16d40:	2007c8e3          	bltz	a5,17750 <__gdtoa+0x13ec>
   16d44:	06812a83          	lw	s5,104(sp)
   16d48:	00c12d03          	lw	s10,12(sp)
   16d4c:	00812c83          	lw	s9,8(sp)
   16d50:	09512423          	sw	s5,136(sp)
   16d54:	09812623          	sw	s8,140(sp)
   16d58:	08812503          	lw	a0,136(sp)
   16d5c:	08c12583          	lw	a1,140(sp)
   16d60:	00100793          	li	a5,1
   16d64:	000d0693          	mv	a3,s10
   16d68:	000c8613          	mv	a2,s9
   16d6c:	01f12a23          	sw	t6,20(sp)
   16d70:	1af12e23          	sw	a5,444(sp)
   16d74:	47d060ef          	jal	1d9f0 <__divdf3>
   16d78:	4ac080ef          	jal	1f224 <__fixdfsi>
   16d7c:	00050993          	mv	s3,a0
   16d80:	524080ef          	jal	1f2a4 <__floatsidf>
   16d84:	000d0693          	mv	a3,s10
   16d88:	000c8613          	mv	a2,s9
   16d8c:	654070ef          	jal	1e3e0 <__muldf3>
   16d90:	09512823          	sw	s5,144(sp)
   16d94:	09812a23          	sw	s8,148(sp)
   16d98:	00050613          	mv	a2,a0
   16d9c:	00058693          	mv	a3,a1
   16da0:	09012503          	lw	a0,144(sp)
   16da4:	09412583          	lw	a1,148(sp)
   16da8:	001d8d13          	addi	s10,s11,1
   16dac:	4e9070ef          	jal	1ea94 <__subdf3>
   16db0:	01c12703          	lw	a4,28(sp)
   16db4:	03098793          	addi	a5,s3,48
   16db8:	00000613          	li	a2,0
   16dbc:	00000693          	li	a3,0
   16dc0:	00fd8023          	sb	a5,0(s11)
   16dc4:	00170b93          	addi	s7,a4,1
   16dc8:	00050a93          	mv	s5,a0
   16dcc:	00058a13          	mv	s4,a1
   16dd0:	3e4070ef          	jal	1e1b4 <__eqdf2>
   16dd4:	01412f83          	lw	t6,20(sp)
   16dd8:	000b8493          	mv	s1,s7
   16ddc:	e40508e3          	beqz	a0,16c2c <__gdtoa+0x8c8>
   16de0:	02812903          	lw	s2,40(sp)
   16de4:	00812c23          	sw	s0,24(sp)
   16de8:	ee01ac03          	lw	s8,-288(gp) # 236f0 <__SDATA_BEGIN__+0x38>
   16dec:	ee41ac83          	lw	s9,-284(gp) # 236f4 <__SDATA_BEGIN__+0x3c>
   16df0:	03612423          	sw	s6,40(sp)
   16df4:	01712a23          	sw	s7,20(sp)
   16df8:	01f12e23          	sw	t6,28(sp)
   16dfc:	03712023          	sw	s7,32(sp)
   16e00:	000a8413          	mv	s0,s5
   16e04:	000a0493          	mv	s1,s4
   16e08:	0700006f          	j	16e78 <__gdtoa+0xb14>
   16e0c:	1bc12e23          	sw	t3,444(sp)
   16e10:	5d0070ef          	jal	1e3e0 <__muldf3>
   16e14:	00812603          	lw	a2,8(sp)
   16e18:	00c12683          	lw	a3,12(sp)
   16e1c:	00050493          	mv	s1,a0
   16e20:	00058413          	mv	s0,a1
   16e24:	3cd060ef          	jal	1d9f0 <__divdf3>
   16e28:	3fc080ef          	jal	1f224 <__fixdfsi>
   16e2c:	00050993          	mv	s3,a0
   16e30:	474080ef          	jal	1f2a4 <__floatsidf>
   16e34:	00812603          	lw	a2,8(sp)
   16e38:	00c12683          	lw	a3,12(sp)
   16e3c:	001d0d13          	addi	s10,s10,1
   16e40:	5a0070ef          	jal	1e3e0 <__muldf3>
   16e44:	00050613          	mv	a2,a0
   16e48:	00058693          	mv	a3,a1
   16e4c:	00048513          	mv	a0,s1
   16e50:	00040593          	mv	a1,s0
   16e54:	441070ef          	jal	1ea94 <__subdf3>
   16e58:	03098813          	addi	a6,s3,48
   16e5c:	00000613          	li	a2,0
   16e60:	00000693          	li	a3,0
   16e64:	ff0d0fa3          	sb	a6,-1(s10)
   16e68:	00050413          	mv	s0,a0
   16e6c:	00058493          	mv	s1,a1
   16e70:	344070ef          	jal	1e1b4 <__eqdf2>
   16e74:	0c0504e3          	beqz	a0,1773c <__gdtoa+0x13d8>
   16e78:	1bc12303          	lw	t1,444(sp)
   16e7c:	000c0613          	mv	a2,s8
   16e80:	000c8693          	mv	a3,s9
   16e84:	00040513          	mv	a0,s0
   16e88:	00048593          	mv	a1,s1
   16e8c:	00130e13          	addi	t3,t1,1
   16e90:	f7231ee3          	bne	t1,s2,16e0c <__gdtoa+0xaa8>
   16e94:	03812703          	lw	a4,56(sp)
   16e98:	01c12f83          	lw	t6,28(sp)
   16e9c:	02012b83          	lw	s7,32(sp)
   16ea0:	01812403          	lw	s0,24(sp)
   16ea4:	01412483          	lw	s1,20(sp)
   16ea8:	4c0700e3          	beqz	a4,17b68 <__gdtoa+0x1804>
   16eac:	00100793          	li	a5,1
   16eb0:	01000b13          	li	s6,16
   16eb4:	d6f71ce3          	bne	a4,a5,16c2c <__gdtoa+0x8c8>
   16eb8:	fffd4c03          	lbu	s8,-1(s10)
   16ebc:	d3dff06f          	j	16bf8 <__gdtoa+0x894>
   16ec0:	02012c23          	sw	zero,56(sp)
   16ec4:	05812783          	lw	a5,88(sp)
   16ec8:	48078e63          	beqz	a5,17364 <__gdtoa+0x1000>
   16ecc:	01812783          	lw	a5,24(sp)
   16ed0:	415b8833          	sub	a6,s7,s5
   16ed4:	00180c93          	addi	s9,a6,1
   16ed8:	0047a603          	lw	a2,4(a5)
   16edc:	05012783          	lw	a5,80(sp)
   16ee0:	1b912e23          	sw	s9,444(sp)
   16ee4:	41078833          	sub	a6,a5,a6
   16ee8:	78c85663          	bge	a6,a2,17674 <__gdtoa+0x1310>
   16eec:	ffd98693          	addi	a3,s3,-3
   16ef0:	ffd6f693          	andi	a3,a3,-3
   16ef4:	60068e63          	beqz	a3,17510 <__gdtoa+0x11ac>
   16ef8:	40c78633          	sub	a2,a5,a2
   16efc:	00160c93          	addi	s9,a2,1
   16f00:	1b912e23          	sw	s9,444(sp)
   16f04:	00100613          	li	a2,1
   16f08:	04012483          	lw	s1,64(sp)
   16f0c:	01365a63          	bge	a2,s3,16f20 <__gdtoa+0xbbc>
   16f10:	02812783          	lw	a5,40(sp)
   16f14:	00f05663          	blez	a5,16f20 <__gdtoa+0xbbc>
   16f18:	0197d463          	bge	a5,s9,16f20 <__gdtoa+0xbbc>
   16f1c:	10c0106f          	j	18028 <__gdtoa+0x1cc4>
   16f20:	02012783          	lw	a5,32(sp)
   16f24:	00100593          	li	a1,1
   16f28:	00040513          	mv	a0,s0
   16f2c:	019787b3          	add	a5,a5,s9
   16f30:	05f12823          	sw	t6,80(sp)
   16f34:	02f12023          	sw	a5,32(sp)
   16f38:	529010ef          	jal	18c60 <__i2b>
   16f3c:	00050c13          	mv	s8,a0
   16f40:	fe050a63          	beqz	a0,16734 <__gdtoa+0x3d0>
   16f44:	03012783          	lw	a5,48(sp)
   16f48:	05012f83          	lw	t6,80(sp)
   16f4c:	160798e3          	bnez	a5,178bc <__gdtoa+0x1558>
   16f50:	04012783          	lw	a5,64(sp)
   16f54:	03912823          	sw	s9,48(sp)
   16f58:	00000913          	li	s2,0
   16f5c:	02078463          	beqz	a5,16f84 <__gdtoa+0xc20>
   16f60:	080496e3          	bnez	s1,177ec <__gdtoa+0x1488>
   16f64:	04012603          	lw	a2,64(sp)
   16f68:	01012583          	lw	a1,16(sp)
   16f6c:	00040513          	mv	a0,s0
   16f70:	05f12823          	sw	t6,80(sp)
   16f74:	068020ef          	jal	18fdc <__pow5mult>
   16f78:	00a12823          	sw	a0,16(sp)
   16f7c:	05012f83          	lw	t6,80(sp)
   16f80:	fa050a63          	beqz	a0,16734 <__gdtoa+0x3d0>
   16f84:	00100593          	li	a1,1
   16f88:	00040513          	mv	a0,s0
   16f8c:	05f12823          	sw	t6,80(sp)
   16f90:	4d1010ef          	jal	18c60 <__i2b>
   16f94:	00050b93          	mv	s7,a0
   16f98:	f8050e63          	beqz	a0,16734 <__gdtoa+0x3d0>
   16f9c:	04812783          	lw	a5,72(sp)
   16fa0:	05012f83          	lw	t6,80(sp)
   16fa4:	68079263          	bnez	a5,17628 <__gdtoa+0x12c4>
   16fa8:	00100693          	li	a3,1
   16fac:	01f00513          	li	a0,31
   16fb0:	7136de63          	bge	a3,s3,176cc <__gdtoa+0x1368>
   16fb4:	02012783          	lw	a5,32(sp)
   16fb8:	40f50ab3          	sub	s5,a0,a5
   16fbc:	03012783          	lw	a5,48(sp)
   16fc0:	ffca8a93          	addi	s5,s5,-4
   16fc4:	01fafa93          	andi	s5,s5,31
   16fc8:	00fa8633          	add	a2,s5,a5
   16fcc:	1b512e23          	sw	s5,444(sp)
   16fd0:	000a8793          	mv	a5,s5
   16fd4:	40c04263          	bgtz	a2,173d8 <__gdtoa+0x1074>
   16fd8:	02012703          	lw	a4,32(sp)
   16fdc:	00e78633          	add	a2,a5,a4
   16fe0:	f2c04c63          	bgtz	a2,16718 <__gdtoa+0x3b4>
   16fe4:	06412783          	lw	a5,100(sp)
   16fe8:	40079a63          	bnez	a5,173fc <__gdtoa+0x1098>
   16fec:	02812783          	lw	a5,40(sp)
   16ff0:	5af05463          	blez	a5,17598 <__gdtoa+0x1234>
   16ff4:	05812783          	lw	a5,88(sp)
   16ff8:	46078263          	beqz	a5,1745c <__gdtoa+0x10f8>
   16ffc:	012a8633          	add	a2,s5,s2
   17000:	08c04ee3          	bgtz	a2,1789c <__gdtoa+0x1538>
   17004:	04812783          	lw	a5,72(sp)
   17008:	000c0e93          	mv	t4,s8
   1700c:	100796e3          	bnez	a5,17918 <__gdtoa+0x15b4>
   17010:	000d8c93          	mv	s9,s11
   17014:	01b12423          	sw	s11,8(sp)
   17018:	01012d03          	lw	s10,16(sp)
   1701c:	00100693          	li	a3,1
   17020:	00200493          	li	s1,2
   17024:	000e8d93          	mv	s11,t4
   17028:	01f12a23          	sw	t6,20(sp)
   1702c:	0a40006f          	j	170d0 <__gdtoa+0xd6c>
   17030:	00040513          	mv	a0,s0
   17034:	7d0010ef          	jal	18804 <_Bfree>
   17038:	3c0acee3          	bltz	s5,17c14 <__gdtoa+0x18b0>
   1703c:	013aeab3          	or	s5,s5,s3
   17040:	000a9863          	bnez	s5,17050 <__gdtoa+0xcec>
   17044:	000a2783          	lw	a5,0(s4)
   17048:	0017f793          	andi	a5,a5,1
   1704c:	3c0784e3          	beqz	a5,17c14 <__gdtoa+0x18b0>
   17050:	03812783          	lw	a5,56(sp)
   17054:	00978463          	beq	a5,s1,1705c <__gdtoa+0xcf8>
   17058:	6f90006f          	j	17f50 <__gdtoa+0x1bec>
   1705c:	016c8023          	sb	s6,0(s9)
   17060:	1bc12783          	lw	a5,444(sp)
   17064:	02812703          	lw	a4,40(sp)
   17068:	001c8c93          	addi	s9,s9,1
   1706c:	60e78ee3          	beq	a5,a4,17e88 <__gdtoa+0x1b24>
   17070:	000d0593          	mv	a1,s10
   17074:	00000693          	li	a3,0
   17078:	00a00613          	li	a2,10
   1707c:	00040513          	mv	a0,s0
   17080:	7a8010ef          	jal	18828 <__multadd>
   17084:	00050d13          	mv	s10,a0
   17088:	ea050663          	beqz	a0,16734 <__gdtoa+0x3d0>
   1708c:	000c0593          	mv	a1,s8
   17090:	00000693          	li	a3,0
   17094:	00a00613          	li	a2,10
   17098:	00040513          	mv	a0,s0
   1709c:	21bc0863          	beq	s8,s11,172ac <__gdtoa+0xf48>
   170a0:	788010ef          	jal	18828 <__multadd>
   170a4:	00050c13          	mv	s8,a0
   170a8:	e8050663          	beqz	a0,16734 <__gdtoa+0x3d0>
   170ac:	000d8593          	mv	a1,s11
   170b0:	00000693          	li	a3,0
   170b4:	00a00613          	li	a2,10
   170b8:	00040513          	mv	a0,s0
   170bc:	76c010ef          	jal	18828 <__multadd>
   170c0:	00050d93          	mv	s11,a0
   170c4:	e6050863          	beqz	a0,16734 <__gdtoa+0x3d0>
   170c8:	1bc12683          	lw	a3,444(sp)
   170cc:	00168693          	addi	a3,a3,1
   170d0:	000b8593          	mv	a1,s7
   170d4:	000d0513          	mv	a0,s10
   170d8:	1ad12e23          	sw	a3,444(sp)
   170dc:	2b4010ef          	jal	18390 <__quorem_D2A>
   170e0:	00050913          	mv	s2,a0
   170e4:	000c0593          	mv	a1,s8
   170e8:	000d0513          	mv	a0,s10
   170ec:	1e4020ef          	jal	192d0 <__mcmp>
   170f0:	000b8593          	mv	a1,s7
   170f4:	00050a93          	mv	s5,a0
   170f8:	000d8613          	mv	a2,s11
   170fc:	00040513          	mv	a0,s0
   17100:	228020ef          	jal	19328 <__mdiff>
   17104:	03090b13          	addi	s6,s2,48
   17108:	00050593          	mv	a1,a0
   1710c:	e2050463          	beqz	a0,16734 <__gdtoa+0x3d0>
   17110:	00c52783          	lw	a5,12(a0)
   17114:	f0079ee3          	bnez	a5,17030 <__gdtoa+0xccc>
   17118:	00a12823          	sw	a0,16(sp)
   1711c:	000d0513          	mv	a0,s10
   17120:	1b0020ef          	jal	192d0 <__mcmp>
   17124:	01012583          	lw	a1,16(sp)
   17128:	00050693          	mv	a3,a0
   1712c:	00040513          	mv	a0,s0
   17130:	00d12823          	sw	a3,16(sp)
   17134:	6d0010ef          	jal	18804 <_Bfree>
   17138:	01012683          	lw	a3,16(sp)
   1713c:	0136e733          	or	a4,a3,s3
   17140:	00070463          	beqz	a4,17148 <__gdtoa+0xde4>
   17144:	0400106f          	j	18184 <__gdtoa+0x1e20>
   17148:	000a2783          	lw	a5,0(s4)
   1714c:	0017f793          	andi	a5,a5,1
   17150:	16079863          	bnez	a5,172c0 <__gdtoa+0xf5c>
   17154:	03812783          	lw	a5,56(sp)
   17158:	00079463          	bnez	a5,17160 <__gdtoa+0xdfc>
   1715c:	7290006f          	j	18084 <__gdtoa+0x1d20>
   17160:	ef504ee3          	bgtz	s5,1705c <__gdtoa+0xcf8>
   17164:	010d2603          	lw	a2,16(s10)
   17168:	01a12823          	sw	s10,16(sp)
   1716c:	00100693          	li	a3,1
   17170:	000b0813          	mv	a6,s6
   17174:	000d8e93          	mv	t4,s11
   17178:	01412f83          	lw	t6,20(sp)
   1717c:	00812d83          	lw	s11,8(sp)
   17180:	00070b13          	mv	s6,a4
   17184:	000d0793          	mv	a5,s10
   17188:	00c6c463          	blt	a3,a2,17190 <__gdtoa+0xe2c>
   1718c:	0540106f          	j	181e0 <__gdtoa+0x1e7c>
   17190:	03812783          	lw	a5,56(sp)
   17194:	00200693          	li	a3,2
   17198:	00d79463          	bne	a5,a3,171a0 <__gdtoa+0xe3c>
   1719c:	7a90006f          	j	18144 <__gdtoa+0x1de0>
   171a0:	01012903          	lw	s2,16(sp)
   171a4:	00080493          	mv	s1,a6
   171a8:	000e8a13          	mv	s4,t4
   171ac:	000f8a93          	mv	s5,t6
   171b0:	0240006f          	j	171d4 <__gdtoa+0xe70>
   171b4:	674010ef          	jal	18828 <__multadd>
   171b8:	000b8593          	mv	a1,s7
   171bc:	00050913          	mv	s2,a0
   171c0:	d6050a63          	beqz	a0,16734 <__gdtoa+0x3d0>
   171c4:	1cc010ef          	jal	18390 <__quorem_D2A>
   171c8:	00048a13          	mv	s4,s1
   171cc:	00098c93          	mv	s9,s3
   171d0:	03050493          	addi	s1,a0,48
   171d4:	000a0593          	mv	a1,s4
   171d8:	000b8513          	mv	a0,s7
   171dc:	0f4020ef          	jal	192d0 <__mcmp>
   171e0:	00050793          	mv	a5,a0
   171e4:	00000693          	li	a3,0
   171e8:	00a00613          	li	a2,10
   171ec:	000a0593          	mv	a1,s4
   171f0:	00040513          	mv	a0,s0
   171f4:	001c8993          	addi	s3,s9,1
   171f8:	00f04463          	bgtz	a5,17200 <__gdtoa+0xe9c>
   171fc:	7290006f          	j	18124 <__gdtoa+0x1dc0>
   17200:	fe998fa3          	sb	s1,-1(s3)
   17204:	624010ef          	jal	18828 <__multadd>
   17208:	00050493          	mv	s1,a0
   1720c:	00000693          	li	a3,0
   17210:	00a00613          	li	a2,10
   17214:	00090593          	mv	a1,s2
   17218:	00040513          	mv	a0,s0
   1721c:	d0048c63          	beqz	s1,16734 <__gdtoa+0x3d0>
   17220:	f94c1ae3          	bne	s8,s4,171b4 <__gdtoa+0xe50>
   17224:	00048c13          	mv	s8,s1
   17228:	f8dff06f          	j	171b4 <__gdtoa+0xe50>
   1722c:	05412783          	lw	a5,84(sp)
   17230:	00000993          	li	s3,0
   17234:	3fd78693          	addi	a3,a5,1021
   17238:	7f86b493          	sltiu	s1,a3,2040
   1723c:	000b8513          	mv	a0,s7
   17240:	03f12c23          	sw	t6,56(sp)
   17244:	060080ef          	jal	1f2a4 <__floatsidf>
   17248:	ed01a603          	lw	a2,-304(gp) # 236e0 <__SDATA_BEGIN__+0x28>
   1724c:	ed41a683          	lw	a3,-300(gp) # 236e4 <__SDATA_BEGIN__+0x2c>
   17250:	190070ef          	jal	1e3e0 <__muldf3>
   17254:	7d1070ef          	jal	1f224 <__fixdfsi>
   17258:	fff00793          	li	a5,-1
   1725c:	00350593          	addi	a1,a0,3
   17260:	08f12c23          	sw	a5,152(sp)
   17264:	02f12423          	sw	a5,40(sp)
   17268:	00100793          	li	a5,1
   1726c:	03812f83          	lw	t6,56(sp)
   17270:	00058693          	mv	a3,a1
   17274:	00012a23          	sw	zero,20(sp)
   17278:	04f12c23          	sw	a5,88(sp)
   1727c:	e28ff06f          	j	168a4 <__gdtoa+0x540>
   17280:	00100793          	li	a5,1
   17284:	00000493          	li	s1,0
   17288:	04f12c23          	sw	a5,88(sp)
   1728c:	01412583          	lw	a1,20(sp)
   17290:	00b04463          	bgtz	a1,17298 <__gdtoa+0xf34>
   17294:	00100593          	li	a1,1
   17298:	00058693          	mv	a3,a1
   1729c:	08b12c23          	sw	a1,152(sp)
   172a0:	02b12423          	sw	a1,40(sp)
   172a4:	00b12a23          	sw	a1,20(sp)
   172a8:	dfcff06f          	j	168a4 <__gdtoa+0x540>
   172ac:	57c010ef          	jal	18828 <__multadd>
   172b0:	00050c13          	mv	s8,a0
   172b4:	c8050063          	beqz	a0,16734 <__gdtoa+0x3d0>
   172b8:	00050d93          	mv	s11,a0
   172bc:	e0dff06f          	j	170c8 <__gdtoa+0xd64>
   172c0:	d80adee3          	bgez	s5,1705c <__gdtoa+0xcf8>
   172c4:	03812783          	lw	a5,56(sp)
   172c8:	01a12823          	sw	s10,16(sp)
   172cc:	000b0813          	mv	a6,s6
   172d0:	000d8e93          	mv	t4,s11
   172d4:	01412f83          	lw	t6,20(sp)
   172d8:	00812d83          	lw	s11,8(sp)
   172dc:	00070b13          	mv	s6,a4
   172e0:	6e0796e3          	bnez	a5,181cc <__gdtoa+0x1e68>
   172e4:	01012783          	lw	a5,16(sp)
   172e8:	00100693          	li	a3,1
   172ec:	01000b13          	li	s6,16
   172f0:	0107a603          	lw	a2,16(a5)
   172f4:	00dc89b3          	add	s3,s9,a3
   172f8:	60c6dee3          	bge	a3,a2,18114 <__gdtoa+0x1db0>
   172fc:	000c0a13          	mv	s4,s8
   17300:	00098d13          	mv	s10,s3
   17304:	010c8023          	sb	a6,0(s9)
   17308:	000e8c13          	mv	s8,t4
   1730c:	000b8593          	mv	a1,s7
   17310:	00040513          	mv	a0,s0
   17314:	01f12423          	sw	t6,8(sp)
   17318:	4ec010ef          	jal	18804 <_Bfree>
   1731c:	00812f83          	lw	t6,8(sp)
   17320:	760c0263          	beqz	s8,17a84 <__gdtoa+0x1720>
   17324:	000a0e63          	beqz	s4,17340 <__gdtoa+0xfdc>
   17328:	018a0c63          	beq	s4,s8,17340 <__gdtoa+0xfdc>
   1732c:	000a0593          	mv	a1,s4
   17330:	00040513          	mv	a0,s0
   17334:	01f12423          	sw	t6,8(sp)
   17338:	4cc010ef          	jal	18804 <_Bfree>
   1733c:	00812f83          	lw	t6,8(sp)
   17340:	000c0593          	mv	a1,s8
   17344:	00040513          	mv	a0,s0
   17348:	01f12423          	sw	t6,8(sp)
   1734c:	4b8010ef          	jal	18804 <_Bfree>
   17350:	01c12783          	lw	a5,28(sp)
   17354:	00812f83          	lw	t6,8(sp)
   17358:	00178493          	addi	s1,a5,1
   1735c:	8d1ff06f          	j	16c2c <__gdtoa+0x8c8>
   17360:	02012c23          	sw	zero,56(sp)
   17364:	03012783          	lw	a5,48(sp)
   17368:	30079e63          	bnez	a5,17684 <__gdtoa+0x1320>
   1736c:	04012783          	lw	a5,64(sp)
   17370:	00000913          	li	s2,0
   17374:	00000c13          	li	s8,0
   17378:	c00786e3          	beqz	a5,16f84 <__gdtoa+0xc20>
   1737c:	04012603          	lw	a2,64(sp)
   17380:	01012583          	lw	a1,16(sp)
   17384:	00040513          	mv	a0,s0
   17388:	05f12823          	sw	t6,80(sp)
   1738c:	451010ef          	jal	18fdc <__pow5mult>
   17390:	00a12823          	sw	a0,16(sp)
   17394:	ba050063          	beqz	a0,16734 <__gdtoa+0x3d0>
   17398:	03012903          	lw	s2,48(sp)
   1739c:	05012f83          	lw	t6,80(sp)
   173a0:	00000c13          	li	s8,0
   173a4:	be1ff06f          	j	16f84 <__gdtoa+0xc20>
   173a8:	05412783          	lw	a5,84(sp)
   173ac:	00400593          	li	a1,4
   173b0:	3fd78693          	addi	a3,a5,1021
   173b4:	7f86b493          	sltiu	s1,a3,2040
   173b8:	50b98a63          	beq	s3,a1,178cc <__gdtoa+0x1568>
   173bc:	34c98663          	beq	s3,a2,17708 <__gdtoa+0x13a4>
   173c0:	00200693          	li	a3,2
   173c4:	50d98a63          	beq	s3,a3,178d8 <__gdtoa+0x1574>
   173c8:	00300693          	li	a3,3
   173cc:	04012c23          	sw	zero,88(sp)
   173d0:	cad98863          	beq	s3,a3,16880 <__gdtoa+0x51c>
   173d4:	e69ff06f          	j	1723c <__gdtoa+0xed8>
   173d8:	01012583          	lw	a1,16(sp)
   173dc:	00040513          	mv	a0,s0
   173e0:	01f12423          	sw	t6,8(sp)
   173e4:	561010ef          	jal	19144 <__lshift>
   173e8:	00a12823          	sw	a0,16(sp)
   173ec:	b4050463          	beqz	a0,16734 <__gdtoa+0x3d0>
   173f0:	1bc12783          	lw	a5,444(sp)
   173f4:	00812f83          	lw	t6,8(sp)
   173f8:	be1ff06f          	j	16fd8 <__gdtoa+0xc74>
   173fc:	01012503          	lw	a0,16(sp)
   17400:	000b8593          	mv	a1,s7
   17404:	01f12423          	sw	t6,8(sp)
   17408:	6c9010ef          	jal	192d0 <__mcmp>
   1740c:	00812f83          	lw	t6,8(sp)
   17410:	bc055ee3          	bgez	a0,16fec <__gdtoa+0xc88>
   17414:	01c12783          	lw	a5,28(sp)
   17418:	01012583          	lw	a1,16(sp)
   1741c:	00000693          	li	a3,0
   17420:	fff78793          	addi	a5,a5,-1
   17424:	00a00613          	li	a2,10
   17428:	00040513          	mv	a0,s0
   1742c:	00f12e23          	sw	a5,28(sp)
   17430:	3f8010ef          	jal	18828 <__multadd>
   17434:	00a12823          	sw	a0,16(sp)
   17438:	ae050e63          	beqz	a0,16734 <__gdtoa+0x3d0>
   1743c:	05812783          	lw	a5,88(sp)
   17440:	00812f83          	lw	t6,8(sp)
   17444:	340796e3          	bnez	a5,17f90 <__gdtoa+0x1c2c>
   17448:	09812783          	lw	a5,152(sp)
   1744c:	02f12423          	sw	a5,40(sp)
   17450:	00f04663          	bgtz	a5,1745c <__gdtoa+0x10f8>
   17454:	00200793          	li	a5,2
   17458:	1537c463          	blt	a5,s3,175a0 <__gdtoa+0x123c>
   1745c:	02812903          	lw	s2,40(sp)
   17460:	01012483          	lw	s1,16(sp)
   17464:	000d8c93          	mv	s9,s11
   17468:	00100693          	li	a3,1
   1746c:	000f8993          	mv	s3,t6
   17470:	0180006f          	j	17488 <__gdtoa+0x1124>
   17474:	3b4010ef          	jal	18828 <__multadd>
   17478:	00050493          	mv	s1,a0
   1747c:	aa050c63          	beqz	a0,16734 <__gdtoa+0x3d0>
   17480:	1bc12683          	lw	a3,444(sp)
   17484:	00168693          	addi	a3,a3,1
   17488:	000b8593          	mv	a1,s7
   1748c:	00048513          	mv	a0,s1
   17490:	1ad12e23          	sw	a3,444(sp)
   17494:	6fd000ef          	jal	18390 <__quorem_D2A>
   17498:	03050813          	addi	a6,a0,48
   1749c:	010c8023          	sb	a6,0(s9)
   174a0:	1bc12783          	lw	a5,444(sp)
   174a4:	001c8c93          	addi	s9,s9,1
   174a8:	00000693          	li	a3,0
   174ac:	00a00613          	li	a2,10
   174b0:	00048593          	mv	a1,s1
   174b4:	00040513          	mv	a0,s0
   174b8:	fb27cee3          	blt	a5,s2,17474 <__gdtoa+0x1110>
   174bc:	00912823          	sw	s1,16(sp)
   174c0:	00098f93          	mv	t6,s3
   174c4:	00000a13          	li	s4,0
   174c8:	03812783          	lw	a5,56(sp)
   174cc:	5e078663          	beqz	a5,17ab8 <__gdtoa+0x1754>
   174d0:	00200693          	li	a3,2
   174d4:	62d78463          	beq	a5,a3,17afc <__gdtoa+0x1798>
   174d8:	01012783          	lw	a5,16(sp)
   174dc:	00100693          	li	a3,1
   174e0:	0107a603          	lw	a2,16(a5)
   174e4:	38c6c663          	blt	a3,a2,17870 <__gdtoa+0x150c>
   174e8:	0147a683          	lw	a3,20(a5)
   174ec:	38069263          	bnez	a3,17870 <__gdtoa+0x150c>
   174f0:	00d036b3          	snez	a3,a3
   174f4:	00469b13          	slli	s6,a3,0x4
   174f8:	03000613          	li	a2,48
   174fc:	000c8d13          	mv	s10,s9
   17500:	fffcc783          	lbu	a5,-1(s9)
   17504:	fffc8c93          	addi	s9,s9,-1
   17508:	fec78ae3          	beq	a5,a2,174fc <__gdtoa+0x1198>
   1750c:	e01ff06f          	j	1730c <__gdtoa+0xfa8>
   17510:	02812703          	lw	a4,40(sp)
   17514:	04012683          	lw	a3,64(sp)
   17518:	fff70793          	addi	a5,a4,-1
   1751c:	2af6c463          	blt	a3,a5,177c4 <__gdtoa+0x1460>
   17520:	40f684b3          	sub	s1,a3,a5
   17524:	260750e3          	bgez	a4,17f84 <__gdtoa+0x1c20>
   17528:	03012783          	lw	a5,48(sp)
   1752c:	02812703          	lw	a4,40(sp)
   17530:	00100593          	li	a1,1
   17534:	00040513          	mv	a0,s0
   17538:	05f12823          	sw	t6,80(sp)
   1753c:	1a012e23          	sw	zero,444(sp)
   17540:	40e78933          	sub	s2,a5,a4
   17544:	71c010ef          	jal	18c60 <__i2b>
   17548:	05012f83          	lw	t6,80(sp)
   1754c:	00050c13          	mv	s8,a0
   17550:	9e050263          	beqz	a0,16734 <__gdtoa+0x3d0>
   17554:	02012783          	lw	a5,32(sp)
   17558:	02f05a63          	blez	a5,1758c <__gdtoa+0x1228>
   1755c:	02012783          	lw	a5,32(sp)
   17560:	00090693          	mv	a3,s2
   17564:	0127d463          	bge	a5,s2,1756c <__gdtoa+0x1208>
   17568:	00078693          	mv	a3,a5
   1756c:	03012783          	lw	a5,48(sp)
   17570:	1ad12e23          	sw	a3,444(sp)
   17574:	40d90933          	sub	s2,s2,a3
   17578:	40d787b3          	sub	a5,a5,a3
   1757c:	02f12823          	sw	a5,48(sp)
   17580:	02012783          	lw	a5,32(sp)
   17584:	40d787b3          	sub	a5,a5,a3
   17588:	02f12023          	sw	a5,32(sp)
   1758c:	04012783          	lw	a5,64(sp)
   17590:	9c0798e3          	bnez	a5,16f60 <__gdtoa+0xbfc>
   17594:	9f1ff06f          	j	16f84 <__gdtoa+0xc20>
   17598:	00200793          	li	a5,2
   1759c:	a537dce3          	bge	a5,s3,16ff4 <__gdtoa+0xc90>
   175a0:	000b8593          	mv	a1,s7
   175a4:	00000693          	li	a3,0
   175a8:	00500613          	li	a2,5
   175ac:	00040513          	mv	a0,s0
   175b0:	01f12423          	sw	t6,8(sp)
   175b4:	274010ef          	jal	18828 <__multadd>
   175b8:	00050593          	mv	a1,a0
   175bc:	96050c63          	beqz	a0,16734 <__gdtoa+0x3d0>
   175c0:	02812783          	lw	a5,40(sp)
   175c4:	00812f83          	lw	t6,8(sp)
   175c8:	56079663          	bnez	a5,17b34 <__gdtoa+0x17d0>
   175cc:	00a12423          	sw	a0,8(sp)
   175d0:	01012503          	lw	a0,16(sp)
   175d4:	01f12c23          	sw	t6,24(sp)
   175d8:	4f9010ef          	jal	192d0 <__mcmp>
   175dc:	00812583          	lw	a1,8(sp)
   175e0:	01812f83          	lw	t6,24(sp)
   175e4:	54a05863          	blez	a0,17b34 <__gdtoa+0x17d0>
   175e8:	03100793          	li	a5,49
   175ec:	00fd8023          	sb	a5,0(s11)
   175f0:	01c12783          	lw	a5,28(sp)
   175f4:	00040513          	mv	a0,s0
   175f8:	01f12423          	sw	t6,8(sp)
   175fc:	00178993          	addi	s3,a5,1
   17600:	204010ef          	jal	18804 <_Bfree>
   17604:	00812f83          	lw	t6,8(sp)
   17608:	001d8d13          	addi	s10,s11,1
   1760c:	400c0ae3          	beqz	s8,18220 <__gdtoa+0x1ebc>
   17610:	01312e23          	sw	s3,28(sp)
   17614:	02000b13          	li	s6,32
   17618:	d29ff06f          	j	17340 <__gdtoa+0xfdc>
   1761c:	00100693          	li	a3,1
   17620:	00068593          	mv	a1,a3
   17624:	a80ff06f          	j	168a4 <__gdtoa+0x540>
   17628:	00050593          	mv	a1,a0
   1762c:	00078613          	mv	a2,a5
   17630:	00040513          	mv	a0,s0
   17634:	1a9010ef          	jal	18fdc <__pow5mult>
   17638:	00050b93          	mv	s7,a0
   1763c:	00051463          	bnez	a0,17644 <__gdtoa+0x12e0>
   17640:	8f4ff06f          	j	16734 <__gdtoa+0x3d0>
   17644:	00100693          	li	a3,1
   17648:	05012f83          	lw	t6,80(sp)
   1764c:	2936da63          	bge	a3,s3,178e0 <__gdtoa+0x157c>
   17650:	010ba783          	lw	a5,16(s7)
   17654:	01f12423          	sw	t6,8(sp)
   17658:	00279793          	slli	a5,a5,0x2
   1765c:	00fb87b3          	add	a5,s7,a5
   17660:	0107a503          	lw	a0,16(a5)
   17664:	46c010ef          	jal	18ad0 <__hi0bits>
   17668:	00812f83          	lw	t6,8(sp)
   1766c:	05612423          	sw	s6,72(sp)
   17670:	945ff06f          	j	16fb4 <__gdtoa+0xc50>
   17674:	00100613          	li	a2,1
   17678:	e9364ce3          	blt	a2,s3,17510 <__gdtoa+0x11ac>
   1767c:	04012483          	lw	s1,64(sp)
   17680:	8a1ff06f          	j	16f20 <__gdtoa+0xbbc>
   17684:	02012783          	lw	a5,32(sp)
   17688:	2e078263          	beqz	a5,1796c <__gdtoa+0x1608>
   1768c:	03012783          	lw	a5,48(sp)
   17690:	02012703          	lw	a4,32(sp)
   17694:	00078693          	mv	a3,a5
   17698:	00f75463          	bge	a4,a5,176a0 <__gdtoa+0x133c>
   1769c:	00070693          	mv	a3,a4
   176a0:	03012783          	lw	a5,48(sp)
   176a4:	1ad12e23          	sw	a3,444(sp)
   176a8:	40d78933          	sub	s2,a5,a3
   176ac:	02012783          	lw	a5,32(sp)
   176b0:	03212823          	sw	s2,48(sp)
   176b4:	40d787b3          	sub	a5,a5,a3
   176b8:	02f12023          	sw	a5,32(sp)
   176bc:	04012783          	lw	a5,64(sp)
   176c0:	ca079ee3          	bnez	a5,1737c <__gdtoa+0x1018>
   176c4:	00000c13          	li	s8,0
   176c8:	8bdff06f          	j	16f84 <__gdtoa+0xc20>
   176cc:	8eda94e3          	bne	s5,a3,16fb4 <__gdtoa+0xc50>
   176d0:	01812783          	lw	a5,24(sp)
   176d4:	0047a683          	lw	a3,4(a5)
   176d8:	00812783          	lw	a5,8(sp)
   176dc:	00168693          	addi	a3,a3,1
   176e0:	8cf6dae3          	bge	a3,a5,16fb4 <__gdtoa+0xc50>
   176e4:	03012783          	lw	a5,48(sp)
   176e8:	05512423          	sw	s5,72(sp)
   176ec:	00178793          	addi	a5,a5,1
   176f0:	02f12823          	sw	a5,48(sp)
   176f4:	02012783          	lw	a5,32(sp)
   176f8:	00178793          	addi	a5,a5,1
   176fc:	02f12023          	sw	a5,32(sp)
   17700:	8b5ff06f          	j	16fb4 <__gdtoa+0xc50>
   17704:	00000493          	li	s1,0
   17708:	00100793          	li	a5,1
   1770c:	00500993          	li	s3,5
   17710:	04f12c23          	sw	a5,88(sp)
   17714:	96cff06f          	j	16880 <__gdtoa+0x51c>
   17718:	00100693          	li	a3,1
   1771c:	419687b3          	sub	a5,a3,s9
   17720:	02f12823          	sw	a5,48(sp)
   17724:	01c12783          	lw	a5,28(sp)
   17728:	06012223          	sw	zero,100(sp)
   1772c:	04012023          	sw	zero,64(sp)
   17730:	02f12023          	sw	a5,32(sp)
   17734:	04f12423          	sw	a5,72(sp)
   17738:	914ff06f          	j	1684c <__gdtoa+0x4e8>
   1773c:	02812b03          	lw	s6,40(sp)
   17740:	01412483          	lw	s1,20(sp)
   17744:	01812403          	lw	s0,24(sp)
   17748:	01c12f83          	lw	t6,28(sp)
   1774c:	ce0ff06f          	j	16c2c <__gdtoa+0x8c8>
   17750:	02812783          	lw	a5,40(sp)
   17754:	def04863          	bgtz	a5,16d44 <__gdtoa+0x9e0>
   17758:	32079c63          	bnez	a5,17a90 <__gdtoa+0x172c>
   1775c:	ef81a603          	lw	a2,-264(gp) # 23708 <__SDATA_BEGIN__+0x50>
   17760:	efc1a683          	lw	a3,-260(gp) # 2370c <__SDATA_BEGIN__+0x54>
   17764:	00812503          	lw	a0,8(sp)
   17768:	00c12583          	lw	a1,12(sp)
   1776c:	01f12c23          	sw	t6,24(sp)
   17770:	471060ef          	jal	1e3e0 <__muldf3>
   17774:	06812783          	lw	a5,104(sp)
   17778:	17812223          	sw	s8,356(sp)
   1777c:	16412683          	lw	a3,356(sp)
   17780:	16f12023          	sw	a5,352(sp)
   17784:	16012603          	lw	a2,352(sp)
   17788:	2b9060ef          	jal	1e240 <__gedf2>
   1778c:	01812f83          	lw	t6,24(sp)
   17790:	01f12423          	sw	t6,8(sp)
   17794:	30055063          	bgez	a0,17a94 <__gdtoa+0x1730>
   17798:	03100793          	li	a5,49
   1779c:	00fd8023          	sb	a5,0(s11)
   177a0:	00000593          	li	a1,0
   177a4:	00040513          	mv	a0,s0
   177a8:	05c010ef          	jal	18804 <_Bfree>
   177ac:	01c12783          	lw	a5,28(sp)
   177b0:	00812f83          	lw	t6,8(sp)
   177b4:	001d8d13          	addi	s10,s11,1
   177b8:	00278493          	addi	s1,a5,2
   177bc:	02000b13          	li	s6,32
   177c0:	c6cff06f          	j	16c2c <__gdtoa+0x8c8>
   177c4:	04012703          	lw	a4,64(sp)
   177c8:	02812c83          	lw	s9,40(sp)
   177cc:	04f12023          	sw	a5,64(sp)
   177d0:	40e786b3          	sub	a3,a5,a4
   177d4:	04812703          	lw	a4,72(sp)
   177d8:	1b912e23          	sw	s9,444(sp)
   177dc:	00000493          	li	s1,0
   177e0:	00d70733          	add	a4,a4,a3
   177e4:	04e12423          	sw	a4,72(sp)
   177e8:	f38ff06f          	j	16f20 <__gdtoa+0xbbc>
   177ec:	000c0593          	mv	a1,s8
   177f0:	00048613          	mv	a2,s1
   177f4:	00040513          	mv	a0,s0
   177f8:	05f12823          	sw	t6,80(sp)
   177fc:	7e0010ef          	jal	18fdc <__pow5mult>
   17800:	00050c13          	mv	s8,a0
   17804:	00051463          	bnez	a0,1780c <__gdtoa+0x14a8>
   17808:	f2dfe06f          	j	16734 <__gdtoa+0x3d0>
   1780c:	01012b83          	lw	s7,16(sp)
   17810:	00050593          	mv	a1,a0
   17814:	00040513          	mv	a0,s0
   17818:	000b8613          	mv	a2,s7
   1781c:	4f4010ef          	jal	18d10 <__multiply>
   17820:	00050c93          	mv	s9,a0
   17824:	00051463          	bnez	a0,1782c <__gdtoa+0x14c8>
   17828:	f0dfe06f          	j	16734 <__gdtoa+0x3d0>
   1782c:	000b8593          	mv	a1,s7
   17830:	00040513          	mv	a0,s0
   17834:	7d1000ef          	jal	18804 <_Bfree>
   17838:	04012783          	lw	a5,64(sp)
   1783c:	01912823          	sw	s9,16(sp)
   17840:	05012f83          	lw	t6,80(sp)
   17844:	409787b3          	sub	a5,a5,s1
   17848:	04f12023          	sw	a5,64(sp)
   1784c:	f2078c63          	beqz	a5,16f84 <__gdtoa+0xc20>
   17850:	f14ff06f          	j	16f64 <__gdtoa+0xc00>
   17854:	000c0a13          	mv	s4,s8
   17858:	000c8693          	mv	a3,s9
   1785c:	001c8993          	addi	s3,s9,1
   17860:	000e8c13          	mv	s8,t4
   17864:	03900613          	li	a2,57
   17868:	00098c93          	mv	s9,s3
   1786c:	00c68023          	sb	a2,0(a3)
   17870:	03900613          	li	a2,57
   17874:	0080006f          	j	1787c <__gdtoa+0x1518>
   17878:	2b9d8063          	beq	s11,s9,17b18 <__gdtoa+0x17b4>
   1787c:	fffcc683          	lbu	a3,-1(s9)
   17880:	000c8d13          	mv	s10,s9
   17884:	fffc8c93          	addi	s9,s9,-1
   17888:	fec688e3          	beq	a3,a2,17878 <__gdtoa+0x1514>
   1788c:	00168693          	addi	a3,a3,1
   17890:	00dc8023          	sb	a3,0(s9)
   17894:	02000b13          	li	s6,32
   17898:	a75ff06f          	j	1730c <__gdtoa+0xfa8>
   1789c:	000c0593          	mv	a1,s8
   178a0:	00040513          	mv	a0,s0
   178a4:	01f12423          	sw	t6,8(sp)
   178a8:	09d010ef          	jal	19144 <__lshift>
   178ac:	00812f83          	lw	t6,8(sp)
   178b0:	00050c13          	mv	s8,a0
   178b4:	f4051863          	bnez	a0,17004 <__gdtoa+0xca0>
   178b8:	e7dfe06f          	j	16734 <__gdtoa+0x3d0>
   178bc:	00078913          	mv	s2,a5
   178c0:	019787b3          	add	a5,a5,s9
   178c4:	02f12823          	sw	a5,48(sp)
   178c8:	c8dff06f          	j	17554 <__gdtoa+0x11f0>
   178cc:	00100793          	li	a5,1
   178d0:	04f12c23          	sw	a5,88(sp)
   178d4:	9b9ff06f          	j	1728c <__gdtoa+0xf28>
   178d8:	04012c23          	sw	zero,88(sp)
   178dc:	9b1ff06f          	j	1728c <__gdtoa+0xf28>
   178e0:	d6da98e3          	bne	s5,a3,17650 <__gdtoa+0x12ec>
   178e4:	01812783          	lw	a5,24(sp)
   178e8:	0047a683          	lw	a3,4(a5)
   178ec:	00812783          	lw	a5,8(sp)
   178f0:	00168693          	addi	a3,a3,1
   178f4:	d4f6dee3          	bge	a3,a5,17650 <__gdtoa+0x12ec>
   178f8:	03012783          	lw	a5,48(sp)
   178fc:	000a8b13          	mv	s6,s5
   17900:	00178793          	addi	a5,a5,1
   17904:	02f12823          	sw	a5,48(sp)
   17908:	02012783          	lw	a5,32(sp)
   1790c:	00178793          	addi	a5,a5,1
   17910:	02f12023          	sw	a5,32(sp)
   17914:	d3dff06f          	j	17650 <__gdtoa+0x12ec>
   17918:	004c2583          	lw	a1,4(s8)
   1791c:	00040513          	mv	a0,s0
   17920:	01f12423          	sw	t6,8(sp)
   17924:	631000ef          	jal	18754 <_Balloc>
   17928:	00050a93          	mv	s5,a0
   1792c:	00051463          	bnez	a0,17934 <__gdtoa+0x15d0>
   17930:	e05fe06f          	j	16734 <__gdtoa+0x3d0>
   17934:	010c2603          	lw	a2,16(s8)
   17938:	00cc0593          	addi	a1,s8,12
   1793c:	00c50513          	addi	a0,a0,12
   17940:	00260613          	addi	a2,a2,2
   17944:	00261613          	slli	a2,a2,0x2
   17948:	aa0fe0ef          	jal	15be8 <memcpy>
   1794c:	000a8593          	mv	a1,s5
   17950:	00040513          	mv	a0,s0
   17954:	00100613          	li	a2,1
   17958:	7ec010ef          	jal	19144 <__lshift>
   1795c:	00812f83          	lw	t6,8(sp)
   17960:	00050e93          	mv	t4,a0
   17964:	ea051663          	bnez	a0,17010 <__gdtoa+0xcac>
   17968:	dcdfe06f          	j	16734 <__gdtoa+0x3d0>
   1796c:	04012783          	lw	a5,64(sp)
   17970:	a00796e3          	bnez	a5,1737c <__gdtoa+0x1018>
   17974:	03012903          	lw	s2,48(sp)
   17978:	00000c13          	li	s8,0
   1797c:	e08ff06f          	j	16f84 <__gdtoa+0xc20>
   17980:	16912823          	sw	s1,368(sp)
   17984:	16912c23          	sw	s1,376(sp)
   17988:	17812a23          	sw	s8,372(sp)
   1798c:	17812e23          	sw	s8,380(sp)
   17990:	17012603          	lw	a2,368(sp)
   17994:	17412683          	lw	a3,372(sp)
   17998:	17812503          	lw	a0,376(sp)
   1799c:	17c12583          	lw	a1,380(sp)
   179a0:	03f12c23          	sw	t6,56(sp)
   179a4:	0cd050ef          	jal	1d270 <__adddf3>
   179a8:	ef01a603          	lw	a2,-272(gp) # 23700 <__SDATA_BEGIN__+0x48>
   179ac:	ef41a683          	lw	a3,-268(gp) # 23704 <__SDATA_BEGIN__+0x4c>
   179b0:	0c1050ef          	jal	1d270 <__adddf3>
   179b4:	03812f83          	lw	t6,56(sp)
   179b8:	fcc006b7          	lui	a3,0xfcc00
   179bc:	00050913          	mv	s2,a0
   179c0:	00b68cb3          	add	s9,a3,a1
   179c4:	06012783          	lw	a5,96(sp)
   179c8:	ef81a603          	lw	a2,-264(gp) # 23708 <__SDATA_BEGIN__+0x50>
   179cc:	0cf12423          	sw	a5,200(sp)
   179d0:	09c12783          	lw	a5,156(sp)
   179d4:	efc1a683          	lw	a3,-260(gp) # 2370c <__SDATA_BEGIN__+0x54>
   179d8:	0c812503          	lw	a0,200(sp)
   179dc:	0cf12623          	sw	a5,204(sp)
   179e0:	0cc12583          	lw	a1,204(sp)
   179e4:	03f12c23          	sw	t6,56(sp)
   179e8:	0ac070ef          	jal	1ea94 <__subdf3>
   179ec:	0d212823          	sw	s2,208(sp)
   179f0:	0d912a23          	sw	s9,212(sp)
   179f4:	0d012603          	lw	a2,208(sp)
   179f8:	0d412683          	lw	a3,212(sp)
   179fc:	00050c13          	mv	s8,a0
   17a00:	00058493          	mv	s1,a1
   17a04:	03d060ef          	jal	1e240 <__gedf2>
   17a08:	03812f83          	lw	t6,56(sp)
   17a0c:	50a04c63          	bgtz	a0,17f24 <__gdtoa+0x1bc0>
   17a10:	800006b7          	lui	a3,0x80000
   17a14:	00dcc6b3          	xor	a3,s9,a3
   17a18:	0d212c23          	sw	s2,216(sp)
   17a1c:	0f812023          	sw	s8,224(sp)
   17a20:	0e912223          	sw	s1,228(sp)
   17a24:	0cd12e23          	sw	a3,220(sp)
   17a28:	0e012503          	lw	a0,224(sp)
   17a2c:	0e412583          	lw	a1,228(sp)
   17a30:	0d812603          	lw	a2,216(sp)
   17a34:	0dc12683          	lw	a3,220(sp)
   17a38:	0d9060ef          	jal	1e310 <__ledf2>
   17a3c:	03812f83          	lw	t6,56(sp)
   17a40:	04054863          	bltz	a0,17a90 <__gdtoa+0x172c>
   17a44:	06012783          	lw	a5,96(sp)
   17a48:	09c12c03          	lw	s8,156(sp)
   17a4c:	00023e37          	lui	t3,0x23
   17a50:	06f12423          	sw	a5,104(sp)
   17a54:	05012783          	lw	a5,80(sp)
   17a58:	c607c463          	bltz	a5,16ec0 <__gdtoa+0xb5c>
   17a5c:	828e2783          	lw	a5,-2008(t3) # 22828 <__mprec_tens>
   17a60:	82ce2803          	lw	a6,-2004(t3)
   17a64:	02012c23          	sw	zero,56(sp)
   17a68:	00f12423          	sw	a5,8(sp)
   17a6c:	01412783          	lw	a5,20(sp)
   17a70:	01012623          	sw	a6,12(sp)
   17a74:	ac07d863          	bgez	a5,16d44 <__gdtoa+0x9e0>
   17a78:	02812783          	lw	a5,40(sp)
   17a7c:	ac079463          	bnez	a5,16d44 <__gdtoa+0x9e0>
   17a80:	cddff06f          	j	1775c <__gdtoa+0x13f8>
   17a84:	01c12783          	lw	a5,28(sp)
   17a88:	00178493          	addi	s1,a5,1
   17a8c:	9a0ff06f          	j	16c2c <__gdtoa+0x8c8>
   17a90:	01f12423          	sw	t6,8(sp)
   17a94:	00000593          	li	a1,0
   17a98:	00040513          	mv	a0,s0
   17a9c:	569000ef          	jal	18804 <_Bfree>
   17aa0:	01412783          	lw	a5,20(sp)
   17aa4:	00812f83          	lw	t6,8(sp)
   17aa8:	000d8d13          	mv	s10,s11
   17aac:	40f004b3          	neg	s1,a5
   17ab0:	01000b13          	li	s6,16
   17ab4:	978ff06f          	j	16c2c <__gdtoa+0x8c8>
   17ab8:	01012583          	lw	a1,16(sp)
   17abc:	00100613          	li	a2,1
   17ac0:	00040513          	mv	a0,s0
   17ac4:	01f12423          	sw	t6,8(sp)
   17ac8:	01012a23          	sw	a6,20(sp)
   17acc:	678010ef          	jal	19144 <__lshift>
   17ad0:	00a12823          	sw	a0,16(sp)
   17ad4:	00051463          	bnez	a0,17adc <__gdtoa+0x1778>
   17ad8:	c5dfe06f          	j	16734 <__gdtoa+0x3d0>
   17adc:	000b8593          	mv	a1,s7
   17ae0:	7f0010ef          	jal	192d0 <__mcmp>
   17ae4:	00812f83          	lw	t6,8(sp)
   17ae8:	d8a044e3          	bgtz	a0,17870 <__gdtoa+0x150c>
   17aec:	00051863          	bnez	a0,17afc <__gdtoa+0x1798>
   17af0:	01412803          	lw	a6,20(sp)
   17af4:	00187813          	andi	a6,a6,1
   17af8:	d6081ce3          	bnez	a6,17870 <__gdtoa+0x150c>
   17afc:	01012783          	lw	a5,16(sp)
   17b00:	00100693          	li	a3,1
   17b04:	01000b13          	li	s6,16
   17b08:	0107a603          	lw	a2,16(a5)
   17b0c:	9ec6c6e3          	blt	a3,a2,174f8 <__gdtoa+0x1194>
   17b10:	0147a683          	lw	a3,20(a5)
   17b14:	9ddff06f          	j	174f0 <__gdtoa+0x118c>
   17b18:	01c12703          	lw	a4,28(sp)
   17b1c:	03100793          	li	a5,49
   17b20:	00fd8023          	sb	a5,0(s11)
   17b24:	00170713          	addi	a4,a4,1
   17b28:	00e12e23          	sw	a4,28(sp)
   17b2c:	02000b13          	li	s6,32
   17b30:	fdcff06f          	j	1730c <__gdtoa+0xfa8>
   17b34:	01412783          	lw	a5,20(sp)
   17b38:	00040513          	mv	a0,s0
   17b3c:	01f12423          	sw	t6,8(sp)
   17b40:	fff7c793          	not	a5,a5
   17b44:	00f12e23          	sw	a5,28(sp)
   17b48:	4bd000ef          	jal	18804 <_Bfree>
   17b4c:	00812f83          	lw	t6,8(sp)
   17b50:	000d8d13          	mv	s10,s11
   17b54:	01000b13          	li	s6,16
   17b58:	fe0c1463          	bnez	s8,17340 <__gdtoa+0xfdc>
   17b5c:	01412783          	lw	a5,20(sp)
   17b60:	40f004b3          	neg	s1,a5
   17b64:	8c8ff06f          	j	16c2c <__gdtoa+0x8c8>
   17b68:	0ea12423          	sw	a0,232(sp)
   17b6c:	0eb12623          	sw	a1,236(sp)
   17b70:	0ea12823          	sw	a0,240(sp)
   17b74:	0eb12a23          	sw	a1,244(sp)
   17b78:	0e812603          	lw	a2,232(sp)
   17b7c:	0ec12683          	lw	a3,236(sp)
   17b80:	0f012503          	lw	a0,240(sp)
   17b84:	0f412583          	lw	a1,244(sp)
   17b88:	01f12a23          	sw	t6,20(sp)
   17b8c:	6e4050ef          	jal	1d270 <__adddf3>
   17b90:	00812603          	lw	a2,8(sp)
   17b94:	00c12683          	lw	a3,12(sp)
   17b98:	00050a93          	mv	s5,a0
   17b9c:	00058a13          	mv	s4,a1
   17ba0:	6a0060ef          	jal	1e240 <__gedf2>
   17ba4:	fffd4c03          	lbu	s8,-1(s10)
   17ba8:	01412f83          	lw	t6,20(sp)
   17bac:	00a05463          	blez	a0,17bb4 <__gdtoa+0x1850>
   17bb0:	848ff06f          	j	16bf8 <__gdtoa+0x894>
   17bb4:	17512423          	sw	s5,360(sp)
   17bb8:	17412623          	sw	s4,364(sp)
   17bbc:	16812503          	lw	a0,360(sp)
   17bc0:	16c12583          	lw	a1,364(sp)
   17bc4:	00812603          	lw	a2,8(sp)
   17bc8:	00c12683          	lw	a3,12(sp)
   17bcc:	5e8060ef          	jal	1e1b4 <__eqdf2>
   17bd0:	01412f83          	lw	t6,20(sp)
   17bd4:	00051863          	bnez	a0,17be4 <__gdtoa+0x1880>
   17bd8:	0019f993          	andi	s3,s3,1
   17bdc:	00098463          	beqz	s3,17be4 <__gdtoa+0x1880>
   17be0:	818ff06f          	j	16bf8 <__gdtoa+0x894>
   17be4:	000d0793          	mv	a5,s10
   17be8:	01000b13          	li	s6,16
   17bec:	03000613          	li	a2,48
   17bf0:	fff7c703          	lbu	a4,-1(a5)
   17bf4:	00078d13          	mv	s10,a5
   17bf8:	fff78793          	addi	a5,a5,-1
   17bfc:	fec70ae3          	beq	a4,a2,17bf0 <__gdtoa+0x188c>
   17c00:	000b8493          	mv	s1,s7
   17c04:	828ff06f          	j	16c2c <__gdtoa+0x8c8>
   17c08:	001b8b93          	addi	s7,s7,1
   17c0c:	03100693          	li	a3,49
   17c10:	810ff06f          	j	16c20 <__gdtoa+0x8bc>
   17c14:	03812783          	lw	a5,56(sp)
   17c18:	01a12823          	sw	s10,16(sp)
   17c1c:	000d8e93          	mv	t4,s11
   17c20:	01412f83          	lw	t6,20(sp)
   17c24:	00812d83          	lw	s11,8(sp)
   17c28:	000b0813          	mv	a6,s6
   17c2c:	00078e63          	beqz	a5,17c48 <__gdtoa+0x18e4>
   17c30:	01012783          	lw	a5,16(sp)
   17c34:	00100693          	li	a3,1
   17c38:	0107a603          	lw	a2,16(a5)
   17c3c:	d4c6ca63          	blt	a3,a2,17190 <__gdtoa+0xe2c>
   17c40:	0147a683          	lw	a3,20(a5)
   17c44:	d4069663          	bnez	a3,17190 <__gdtoa+0xe2c>
   17c48:	01012583          	lw	a1,16(sp)
   17c4c:	00100613          	li	a2,1
   17c50:	00040513          	mv	a0,s0
   17c54:	01f12c23          	sw	t6,24(sp)
   17c58:	01d12a23          	sw	t4,20(sp)
   17c5c:	01012423          	sw	a6,8(sp)
   17c60:	4e4010ef          	jal	19144 <__lshift>
   17c64:	00a12823          	sw	a0,16(sp)
   17c68:	00051463          	bnez	a0,17c70 <__gdtoa+0x190c>
   17c6c:	ac9fe06f          	j	16734 <__gdtoa+0x3d0>
   17c70:	000b8593          	mv	a1,s7
   17c74:	65c010ef          	jal	192d0 <__mcmp>
   17c78:	00812803          	lw	a6,8(sp)
   17c7c:	01412e83          	lw	t4,20(sp)
   17c80:	01812f83          	lw	t6,24(sp)
   17c84:	46a05c63          	blez	a0,180fc <__gdtoa+0x1d98>
   17c88:	03900693          	li	a3,57
   17c8c:	bcd804e3          	beq	a6,a3,17854 <__gdtoa+0x14f0>
   17c90:	02000793          	li	a5,32
   17c94:	03190813          	addi	a6,s2,49
   17c98:	02f12c23          	sw	a5,56(sp)
   17c9c:	e48ff06f          	j	172e4 <__gdtoa+0xf80>
   17ca0:	13212823          	sw	s2,304(sp)
   17ca4:	13912a23          	sw	s9,308(sp)
   17ca8:	13012503          	lw	a0,304(sp)
   17cac:	13412583          	lw	a1,308(sp)
   17cb0:	0fc12023          	sw	t3,224(sp)
   17cb4:	0df12823          	sw	t6,208(sp)
   17cb8:	728060ef          	jal	1e3e0 <__muldf3>
   17cbc:	ee01a783          	lw	a5,-288(gp) # 236f0 <__SDATA_BEGIN__+0x38>
   17cc0:	ee41a803          	lw	a6,-284(gp) # 236f4 <__SDATA_BEGIN__+0x3c>
   17cc4:	06812683          	lw	a3,104(sp)
   17cc8:	00100613          	li	a2,1
   17ccc:	000d8d13          	mv	s10,s11
   17cd0:	00068913          	mv	s2,a3
   17cd4:	00068b93          	mv	s7,a3
   17cd8:	00000693          	li	a3,0
   17cdc:	0bb12423          	sw	s11,168(sp)
   17ce0:	0d312c23          	sw	s3,216(sp)
   17ce4:	0f212c23          	sw	s2,248(sp)
   17ce8:	02f12c23          	sw	a5,56(sp)
   17cec:	05412903          	lw	s2,84(sp)
   17cf0:	03012e23          	sw	a6,60(sp)
   17cf4:	06a12823          	sw	a0,112(sp)
   17cf8:	06b12423          	sw	a1,104(sp)
   17cfc:	1ac12e23          	sw	a2,444(sp)
   17d00:	07512c23          	sw	s5,120(sp)
   17d04:	09612023          	sw	s6,128(sp)
   17d08:	00068d93          	mv	s11,a3
   17d0c:	0c812023          	sw	s0,192(sp)
   17d10:	0d412423          	sw	s4,200(sp)
   17d14:	05812a23          	sw	s8,84(sp)
   17d18:	000b8993          	mv	s3,s7
   17d1c:	0180006f          	j	17d34 <__gdtoa+0x19d0>
   17d20:	1a612e23          	sw	t1,444(sp)
   17d24:	6bc060ef          	jal	1e3e0 <__muldf3>
   17d28:	00050993          	mv	s3,a0
   17d2c:	00058c13          	mv	s8,a1
   17d30:	00100d93          	li	s11,1
   17d34:	00098513          	mv	a0,s3
   17d38:	000c0593          	mv	a1,s8
   17d3c:	4e8070ef          	jal	1f224 <__fixdfsi>
   17d40:	00050c93          	mv	s9,a0
   17d44:	02050463          	beqz	a0,17d6c <__gdtoa+0x1a08>
   17d48:	55c070ef          	jal	1f2a4 <__floatsidf>
   17d4c:	00050613          	mv	a2,a0
   17d50:	00058693          	mv	a3,a1
   17d54:	00098513          	mv	a0,s3
   17d58:	000c0593          	mv	a1,s8
   17d5c:	539060ef          	jal	1ea94 <__subdf3>
   17d60:	00050993          	mv	s3,a0
   17d64:	00058c13          	mv	s8,a1
   17d68:	00100d93          	li	s11,1
   17d6c:	030c8793          	addi	a5,s9,48
   17d70:	0ff7f793          	zext.b	a5,a5
   17d74:	00fd0023          	sb	a5,0(s10)
   17d78:	1bc12883          	lw	a7,444(sp)
   17d7c:	001d0d13          	addi	s10,s10,1
   17d80:	03812603          	lw	a2,56(sp)
   17d84:	03c12683          	lw	a3,60(sp)
   17d88:	00098513          	mv	a0,s3
   17d8c:	000c0593          	mv	a1,s8
   17d90:	00188313          	addi	t1,a7,1
   17d94:	f92896e3          	bne	a7,s2,17d20 <__gdtoa+0x19bc>
   17d98:	000d8693          	mv	a3,s11
   17d9c:	07812a83          	lw	s5,120(sp)
   17da0:	08012b03          	lw	s6,128(sp)
   17da4:	0a812d83          	lw	s11,168(sp)
   17da8:	0c012403          	lw	s0,192(sp)
   17dac:	0c812a03          	lw	s4,200(sp)
   17db0:	0d012f83          	lw	t6,208(sp)
   17db4:	0e012e03          	lw	t3,224(sp)
   17db8:	0f812903          	lw	s2,248(sp)
   17dbc:	05412483          	lw	s1,84(sp)
   17dc0:	0d812983          	lw	s3,216(sp)
   17dc4:	00078c13          	mv	s8,a5
   17dc8:	00068663          	beqz	a3,17dd4 <__gdtoa+0x1a70>
   17dcc:	00050913          	mv	s2,a0
   17dd0:	00058493          	mv	s1,a1
   17dd4:	06812783          	lw	a5,104(sp)
   17dd8:	07012b83          	lw	s7,112(sp)
   17ddc:	12f12e23          	sw	a5,316(sp)
   17de0:	13712c23          	sw	s7,312(sp)
   17de4:	f001a603          	lw	a2,-256(gp) # 23710 <__SDATA_BEGIN__+0x58>
   17de8:	f041a683          	lw	a3,-252(gp) # 23714 <__SDATA_BEGIN__+0x5c>
   17dec:	13812503          	lw	a0,312(sp)
   17df0:	13c12583          	lw	a1,316(sp)
   17df4:	03f12c23          	sw	t6,56(sp)
   17df8:	05c12a23          	sw	t3,84(sp)
   17dfc:	474050ef          	jal	1d270 <__adddf3>
   17e00:	15212023          	sw	s2,320(sp)
   17e04:	14912223          	sw	s1,324(sp)
   17e08:	14012603          	lw	a2,320(sp)
   17e0c:	14412683          	lw	a3,324(sp)
   17e10:	500060ef          	jal	1e310 <__ledf2>
   17e14:	03812f83          	lw	t6,56(sp)
   17e18:	20054263          	bltz	a0,1801c <__gdtoa+0x1cb8>
   17e1c:	06812783          	lw	a5,104(sp)
   17e20:	15712423          	sw	s7,328(sp)
   17e24:	14812603          	lw	a2,328(sp)
   17e28:	14f12623          	sw	a5,332(sp)
   17e2c:	14c12683          	lw	a3,332(sp)
   17e30:	f001a503          	lw	a0,-256(gp) # 23710 <__SDATA_BEGIN__+0x58>
   17e34:	f041a583          	lw	a1,-252(gp) # 23714 <__SDATA_BEGIN__+0x5c>
   17e38:	45d060ef          	jal	1ea94 <__subdf3>
   17e3c:	15212823          	sw	s2,336(sp)
   17e40:	14912a23          	sw	s1,340(sp)
   17e44:	15012603          	lw	a2,336(sp)
   17e48:	15412683          	lw	a3,340(sp)
   17e4c:	3f4060ef          	jal	1e240 <__gedf2>
   17e50:	03812f83          	lw	t6,56(sp)
   17e54:	05412e03          	lw	t3,84(sp)
   17e58:	26a04463          	bgtz	a0,180c0 <__gdtoa+0x1d5c>
   17e5c:	06012783          	lw	a5,96(sp)
   17e60:	09c12c03          	lw	s8,156(sp)
   17e64:	06f12423          	sw	a5,104(sp)
   17e68:	05012783          	lw	a5,80(sp)
   17e6c:	ce07ca63          	bltz	a5,17360 <__gdtoa+0xffc>
   17e70:	828e2783          	lw	a5,-2008(t3)
   17e74:	82ce2803          	lw	a6,-2004(t3)
   17e78:	02012c23          	sw	zero,56(sp)
   17e7c:	00f12423          	sw	a5,8(sp)
   17e80:	01012623          	sw	a6,12(sp)
   17e84:	ec1fe06f          	j	16d44 <__gdtoa+0x9e0>
   17e88:	000d8e93          	mv	t4,s11
   17e8c:	000c0a13          	mv	s4,s8
   17e90:	00812d83          	lw	s11,8(sp)
   17e94:	01412f83          	lw	t6,20(sp)
   17e98:	000b0813          	mv	a6,s6
   17e9c:	01a12823          	sw	s10,16(sp)
   17ea0:	000e8c13          	mv	s8,t4
   17ea4:	e24ff06f          	j	174c8 <__gdtoa+0x1164>
   17ea8:	ac090ce3          	beqz	s2,17980 <__gdtoa+0x161c>
   17eac:	09812d03          	lw	s10,152(sp)
   17eb0:	b9a05ae3          	blez	s10,17a44 <__gdtoa+0x16e0>
   17eb4:	0f812e23          	sw	s8,252(sp)
   17eb8:	0e912c23          	sw	s1,248(sp)
   17ebc:	ee01a603          	lw	a2,-288(gp) # 236f0 <__SDATA_BEGIN__+0x38>
   17ec0:	0f812503          	lw	a0,248(sp)
   17ec4:	ee41a683          	lw	a3,-284(gp) # 236f4 <__SDATA_BEGIN__+0x3c>
   17ec8:	0fc12583          	lw	a1,252(sp)
   17ecc:	0df12023          	sw	t6,192(sp)
   17ed0:	510060ef          	jal	1e3e0 <__muldf3>
   17ed4:	ee81a603          	lw	a2,-280(gp) # 236f8 <__SDATA_BEGIN__+0x40>
   17ed8:	eec1a683          	lw	a3,-276(gp) # 236fc <__SDATA_BEGIN__+0x44>
   17edc:	00058c13          	mv	s8,a1
   17ee0:	06a12423          	sw	a0,104(sp)
   17ee4:	0aa12423          	sw	a0,168(sp)
   17ee8:	02b12c23          	sw	a1,56(sp)
   17eec:	4f4060ef          	jal	1e3e0 <__muldf3>
   17ef0:	ef01a603          	lw	a2,-272(gp) # 23700 <__SDATA_BEGIN__+0x48>
   17ef4:	ef41a683          	lw	a3,-268(gp) # 23704 <__SDATA_BEGIN__+0x4c>
   17ef8:	378050ef          	jal	1d270 <__adddf3>
   17efc:	fcc006b7          	lui	a3,0xfcc00
   17f00:	fff00793          	li	a5,-1
   17f04:	0a812703          	lw	a4,168(sp)
   17f08:	0c012f83          	lw	t6,192(sp)
   17f0c:	00050913          	mv	s2,a0
   17f10:	00b68cb3          	add	s9,a3,a1
   17f14:	05a12a23          	sw	s10,84(sp)
   17f18:	0af12023          	sw	a5,160(sp)
   17f1c:	000c0f13          	mv	t5,s8
   17f20:	aa5fe06f          	j	169c4 <__gdtoa+0x660>
   17f24:	03100793          	li	a5,49
   17f28:	00fd8023          	sb	a5,0(s11)
   17f2c:	00000593          	li	a1,0
   17f30:	00040513          	mv	a0,s0
   17f34:	01f12423          	sw	t6,8(sp)
   17f38:	0cd000ef          	jal	18804 <_Bfree>
   17f3c:	00812f83          	lw	t6,8(sp)
   17f40:	001d8d13          	addi	s10,s11,1
   17f44:	00200493          	li	s1,2
   17f48:	02000b13          	li	s6,32
   17f4c:	ce1fe06f          	j	16c2c <__gdtoa+0x8c8>
   17f50:	01a12823          	sw	s10,16(sp)
   17f54:	03900693          	li	a3,57
   17f58:	000d8e93          	mv	t4,s11
   17f5c:	01412f83          	lw	t6,20(sp)
   17f60:	00812d83          	lw	s11,8(sp)
   17f64:	8edb08e3          	beq	s6,a3,17854 <__gdtoa+0x14f0>
   17f68:	001b0813          	addi	a6,s6,1
   17f6c:	000c0a13          	mv	s4,s8
   17f70:	010c8023          	sb	a6,0(s9)
   17f74:	001c8d13          	addi	s10,s9,1
   17f78:	000e8c13          	mv	s8,t4
   17f7c:	02000b13          	li	s6,32
   17f80:	b8cff06f          	j	1730c <__gdtoa+0xfa8>
   17f84:	1ae12e23          	sw	a4,444(sp)
   17f88:	00070c93          	mv	s9,a4
   17f8c:	f95fe06f          	j	16f20 <__gdtoa+0xbbc>
   17f90:	000c0593          	mv	a1,s8
   17f94:	00000693          	li	a3,0
   17f98:	00a00613          	li	a2,10
   17f9c:	00040513          	mv	a0,s0
   17fa0:	089000ef          	jal	18828 <__multadd>
   17fa4:	00050c13          	mv	s8,a0
   17fa8:	00051463          	bnez	a0,17fb0 <__gdtoa+0x1c4c>
   17fac:	f88fe06f          	j	16734 <__gdtoa+0x3d0>
   17fb0:	09812783          	lw	a5,152(sp)
   17fb4:	00812f83          	lw	t6,8(sp)
   17fb8:	02f12423          	sw	a5,40(sp)
   17fbc:	00f05463          	blez	a5,17fc4 <__gdtoa+0x1c60>
   17fc0:	83cff06f          	j	16ffc <__gdtoa+0xc98>
   17fc4:	00200793          	li	a5,2
   17fc8:	0137c463          	blt	a5,s3,17fd0 <__gdtoa+0x1c6c>
   17fcc:	830ff06f          	j	16ffc <__gdtoa+0xc98>
   17fd0:	dd0ff06f          	j	175a0 <__gdtoa+0x123c>
   17fd4:	0a812d83          	lw	s11,168(sp)
   17fd8:	0c012403          	lw	s0,192(sp)
   17fdc:	0c812f83          	lw	t6,200(sp)
   17fe0:	00098493          	mv	s1,s3
   17fe4:	12912423          	sw	s1,296(sp)
   17fe8:	13212623          	sw	s2,300(sp)
   17fec:	12812503          	lw	a0,296(sp)
   17ff0:	12c12583          	lw	a1,300(sp)
   17ff4:	00000613          	li	a2,0
   17ff8:	00000693          	li	a3,0
   17ffc:	01f12423          	sw	t6,8(sp)
   18000:	1b4060ef          	jal	1e1b4 <__eqdf2>
   18004:	0a012783          	lw	a5,160(sp)
   18008:	00a03b33          	snez	s6,a0
   1800c:	00812f83          	lw	t6,8(sp)
   18010:	00178493          	addi	s1,a5,1
   18014:	004b1b13          	slli	s6,s6,0x4
   18018:	c15fe06f          	j	16c2c <__gdtoa+0x8c8>
   1801c:	0a012783          	lw	a5,160(sp)
   18020:	00178b93          	addi	s7,a5,1
   18024:	bd5fe06f          	j	16bf8 <__gdtoa+0x894>
   18028:	00078713          	mv	a4,a5
   1802c:	fff78793          	addi	a5,a5,-1
   18030:	f8f4ca63          	blt	s1,a5,177c4 <__gdtoa+0x1460>
   18034:	40f484b3          	sub	s1,s1,a5
   18038:	1ae12e23          	sw	a4,444(sp)
   1803c:	00070c93          	mv	s9,a4
   18040:	ee1fe06f          	j	16f20 <__gdtoa+0xbbc>
   18044:	06012783          	lw	a5,96(sp)
   18048:	0d012b83          	lw	s7,208(sp)
   1804c:	0d812a83          	lw	s5,216(sp)
   18050:	06f12423          	sw	a5,104(sp)
   18054:	05012783          	lw	a5,80(sp)
   18058:	0e012b03          	lw	s6,224(sp)
   1805c:	0a812d83          	lw	s11,168(sp)
   18060:	0c012403          	lw	s0,192(sp)
   18064:	0f812a03          	lw	s4,248(sp)
   18068:	0c812f83          	lw	t6,200(sp)
   1806c:	10012983          	lw	s3,256(sp)
   18070:	10812e03          	lw	t3,264(sp)
   18074:	09c12c03          	lw	s8,156(sp)
   18078:	9e07d2e3          	bgez	a5,17a5c <__gdtoa+0x16f8>
   1807c:	02012c23          	sw	zero,56(sp)
   18080:	e4dfe06f          	j	16ecc <__gdtoa+0xb68>
   18084:	01a12823          	sw	s10,16(sp)
   18088:	03900693          	li	a3,57
   1808c:	000d8e93          	mv	t4,s11
   18090:	01412f83          	lw	t6,20(sp)
   18094:	00812d83          	lw	s11,8(sp)
   18098:	000b0813          	mv	a6,s6
   1809c:	fadb0c63          	beq	s6,a3,17854 <__gdtoa+0x14f0>
   180a0:	0b505863          	blez	s5,18150 <__gdtoa+0x1dec>
   180a4:	03190813          	addi	a6,s2,49
   180a8:	02000b13          	li	s6,32
   180ac:	000c0a13          	mv	s4,s8
   180b0:	010c8023          	sb	a6,0(s9)
   180b4:	001c8d13          	addi	s10,s9,1
   180b8:	000e8c13          	mv	s8,t4
   180bc:	a50ff06f          	j	1730c <__gdtoa+0xfa8>
   180c0:	15212c23          	sw	s2,344(sp)
   180c4:	14912e23          	sw	s1,348(sp)
   180c8:	15812503          	lw	a0,344(sp)
   180cc:	15c12583          	lw	a1,348(sp)
   180d0:	00000613          	li	a2,0
   180d4:	00000693          	li	a3,0
   180d8:	01f12423          	sw	t6,8(sp)
   180dc:	0d8060ef          	jal	1e1b4 <__eqdf2>
   180e0:	0a012703          	lw	a4,160(sp)
   180e4:	00a03b33          	snez	s6,a0
   180e8:	00812f83          	lw	t6,8(sp)
   180ec:	000d0793          	mv	a5,s10
   180f0:	00170b93          	addi	s7,a4,1
   180f4:	004b1b13          	slli	s6,s6,0x4
   180f8:	af5ff06f          	j	17bec <__gdtoa+0x1888>
   180fc:	00051663          	bnez	a0,18108 <__gdtoa+0x1da4>
   18100:	00187693          	andi	a3,a6,1
   18104:	b80692e3          	bnez	a3,17c88 <__gdtoa+0x1924>
   18108:	02000793          	li	a5,32
   1810c:	02f12c23          	sw	a5,56(sp)
   18110:	9d4ff06f          	j	172e4 <__gdtoa+0xf80>
   18114:	0147a683          	lw	a3,20(a5)
   18118:	9e069263          	bnez	a3,172fc <__gdtoa+0xf98>
   1811c:	03812b03          	lw	s6,56(sp)
   18120:	9dcff06f          	j	172fc <__gdtoa+0xf98>
   18124:	01212823          	sw	s2,16(sp)
   18128:	03900693          	li	a3,57
   1812c:	000a0e93          	mv	t4,s4
   18130:	000a8f93          	mv	t6,s5
   18134:	04d48063          	beq	s1,a3,18174 <__gdtoa+0x1e10>
   18138:	00148813          	addi	a6,s1,1
   1813c:	02000b13          	li	s6,32
   18140:	9bcff06f          	j	172fc <__gdtoa+0xf98>
   18144:	01000b13          	li	s6,16
   18148:	001c8993          	addi	s3,s9,1
   1814c:	9b0ff06f          	j	172fc <__gdtoa+0xf98>
   18150:	01012783          	lw	a5,16(sp)
   18154:	00100693          	li	a3,1
   18158:	01000b13          	li	s6,16
   1815c:	0107a603          	lw	a2,16(a5)
   18160:	f4c6c6e3          	blt	a3,a2,180ac <__gdtoa+0x1d48>
   18164:	0147ab03          	lw	s6,20(a5)
   18168:	01603b33          	snez	s6,s6
   1816c:	004b1b13          	slli	s6,s6,0x4
   18170:	f3dff06f          	j	180ac <__gdtoa+0x1d48>
   18174:	000c0a13          	mv	s4,s8
   18178:	000c8693          	mv	a3,s9
   1817c:	00058c13          	mv	s8,a1
   18180:	ee4ff06f          	j	17864 <__gdtoa+0x1500>
   18184:	020ac263          	bltz	s5,181a8 <__gdtoa+0x1e44>
   18188:	013aeab3          	or	s5,s5,s3
   1818c:	000a9863          	bnez	s5,1819c <__gdtoa+0x1e38>
   18190:	000a2783          	lw	a5,0(s4)
   18194:	0017f793          	andi	a5,a5,1
   18198:	00078863          	beqz	a5,181a8 <__gdtoa+0x1e44>
   1819c:	00d04463          	bgtz	a3,181a4 <__gdtoa+0x1e40>
   181a0:	ebdfe06f          	j	1705c <__gdtoa+0xcf8>
   181a4:	eadfe06f          	j	17050 <__gdtoa+0xcec>
   181a8:	03812703          	lw	a4,56(sp)
   181ac:	01a12823          	sw	s10,16(sp)
   181b0:	000d8e93          	mv	t4,s11
   181b4:	01412f83          	lw	t6,20(sp)
   181b8:	00812d83          	lw	s11,8(sp)
   181bc:	000b0813          	mv	a6,s6
   181c0:	02071a63          	bnez	a4,181f4 <__gdtoa+0x1e90>
   181c4:	92d05063          	blez	a3,172e4 <__gdtoa+0xf80>
   181c8:	a81ff06f          	j	17c48 <__gdtoa+0x18e4>
   181cc:	010d2603          	lw	a2,16(s10)
   181d0:	00100693          	li	a3,1
   181d4:	000d0793          	mv	a5,s10
   181d8:	00c6d463          	bge	a3,a2,181e0 <__gdtoa+0x1e7c>
   181dc:	fb5fe06f          	j	17190 <__gdtoa+0xe2c>
   181e0:	0147a683          	lw	a3,20(a5)
   181e4:	00068463          	beqz	a3,181ec <__gdtoa+0x1e88>
   181e8:	fa9fe06f          	j	17190 <__gdtoa+0xe2c>
   181ec:	001c8993          	addi	s3,s9,1
   181f0:	90cff06f          	j	172fc <__gdtoa+0xf98>
   181f4:	010d2583          	lw	a1,16(s10)
   181f8:	00100613          	li	a2,1
   181fc:	00b65463          	bge	a2,a1,18204 <__gdtoa+0x1ea0>
   18200:	f91fe06f          	j	17190 <__gdtoa+0xe2c>
   18204:	014d2603          	lw	a2,20(s10)
   18208:	00060463          	beqz	a2,18210 <__gdtoa+0x1eac>
   1820c:	f85fe06f          	j	17190 <__gdtoa+0xe2c>
   18210:	a2d04ce3          	bgtz	a3,17c48 <__gdtoa+0x18e4>
   18214:	00000b13          	li	s6,0
   18218:	001c8993          	addi	s3,s9,1
   1821c:	8e0ff06f          	j	172fc <__gdtoa+0xf98>
   18220:	01c12783          	lw	a5,28(sp)
   18224:	02000b13          	li	s6,32
   18228:	00278493          	addi	s1,a5,2
   1822c:	a01fe06f          	j	16c2c <__gdtoa+0x8c8>

00018230 <__rv_alloc_D2A.part.0>:
   18230:	000226b7          	lui	a3,0x22
   18234:	00022537          	lui	a0,0x22
   18238:	ff010113          	addi	sp,sp,-16
   1823c:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   18240:	4a050513          	addi	a0,a0,1184 # 224a0 <__clzsi2+0x100>
   18244:	00000613          	li	a2,0
   18248:	03900593          	li	a1,57
   1824c:	00112623          	sw	ra,12(sp)
   18250:	388020ef          	jal	1a5d8 <__assert_func>

00018254 <__rv_alloc_D2A>:
   18254:	ff010113          	addi	sp,sp,-16
   18258:	00812423          	sw	s0,8(sp)
   1825c:	00112623          	sw	ra,12(sp)
   18260:	01700693          	li	a3,23
   18264:	00050413          	mv	s0,a0
   18268:	00100713          	li	a4,1
   1826c:	00400793          	li	a5,4
   18270:	04b6f063          	bgeu	a3,a1,182b0 <__rv_alloc_D2A+0x5c>
   18274:	00179793          	slli	a5,a5,0x1
   18278:	01478693          	addi	a3,a5,20
   1827c:	00070613          	mv	a2,a4
   18280:	00170713          	addi	a4,a4,1
   18284:	fed5f8e3          	bgeu	a1,a3,18274 <__rv_alloc_D2A+0x20>
   18288:	00060593          	mv	a1,a2
   1828c:	02c42e23          	sw	a2,60(s0)
   18290:	00040513          	mv	a0,s0
   18294:	4c0000ef          	jal	18754 <_Balloc>
   18298:	02050263          	beqz	a0,182bc <__rv_alloc_D2A+0x68>
   1829c:	00c12083          	lw	ra,12(sp)
   182a0:	02a42c23          	sw	a0,56(s0)
   182a4:	00812403          	lw	s0,8(sp)
   182a8:	01010113          	addi	sp,sp,16
   182ac:	00008067          	ret
   182b0:	02052e23          	sw	zero,60(a0)
   182b4:	00000593          	li	a1,0
   182b8:	fd9ff06f          	j	18290 <__rv_alloc_D2A+0x3c>
   182bc:	f75ff0ef          	jal	18230 <__rv_alloc_D2A.part.0>

000182c0 <__nrv_alloc_D2A>:
   182c0:	ff010113          	addi	sp,sp,-16
   182c4:	00812423          	sw	s0,8(sp)
   182c8:	00912223          	sw	s1,4(sp)
   182cc:	01212023          	sw	s2,0(sp)
   182d0:	00112623          	sw	ra,12(sp)
   182d4:	01700813          	li	a6,23
   182d8:	00050493          	mv	s1,a0
   182dc:	00058413          	mv	s0,a1
   182e0:	00060913          	mv	s2,a2
   182e4:	00100713          	li	a4,1
   182e8:	00400793          	li	a5,4
   182ec:	06d87a63          	bgeu	a6,a3,18360 <__nrv_alloc_D2A+0xa0>
   182f0:	00179793          	slli	a5,a5,0x1
   182f4:	01478813          	addi	a6,a5,20
   182f8:	00070593          	mv	a1,a4
   182fc:	00170713          	addi	a4,a4,1
   18300:	ff06f8e3          	bgeu	a3,a6,182f0 <__nrv_alloc_D2A+0x30>
   18304:	02b4ae23          	sw	a1,60(s1)
   18308:	00048513          	mv	a0,s1
   1830c:	448000ef          	jal	18754 <_Balloc>
   18310:	06050263          	beqz	a0,18374 <__nrv_alloc_D2A+0xb4>
   18314:	02a4ac23          	sw	a0,56(s1)
   18318:	00044783          	lbu	a5,0(s0)
   1831c:	00140593          	addi	a1,s0,1
   18320:	00f50023          	sb	a5,0(a0)
   18324:	04078463          	beqz	a5,1836c <__nrv_alloc_D2A+0xac>
   18328:	00050793          	mv	a5,a0
   1832c:	0005c703          	lbu	a4,0(a1)
   18330:	00158593          	addi	a1,a1,1
   18334:	00178793          	addi	a5,a5,1
   18338:	00e78023          	sb	a4,0(a5)
   1833c:	fe0718e3          	bnez	a4,1832c <__nrv_alloc_D2A+0x6c>
   18340:	00090463          	beqz	s2,18348 <__nrv_alloc_D2A+0x88>
   18344:	00f92023          	sw	a5,0(s2)
   18348:	00c12083          	lw	ra,12(sp)
   1834c:	00812403          	lw	s0,8(sp)
   18350:	00412483          	lw	s1,4(sp)
   18354:	00012903          	lw	s2,0(sp)
   18358:	01010113          	addi	sp,sp,16
   1835c:	00008067          	ret
   18360:	02052e23          	sw	zero,60(a0)
   18364:	00000593          	li	a1,0
   18368:	fa1ff06f          	j	18308 <__nrv_alloc_D2A+0x48>
   1836c:	00050793          	mv	a5,a0
   18370:	fd1ff06f          	j	18340 <__nrv_alloc_D2A+0x80>
   18374:	ebdff0ef          	jal	18230 <__rv_alloc_D2A.part.0>

00018378 <__freedtoa>:
   18378:	03c52683          	lw	a3,60(a0)
   1837c:	00100713          	li	a4,1
   18380:	00d71733          	sll	a4,a4,a3
   18384:	00e5a423          	sw	a4,8(a1)
   18388:	00d5a223          	sw	a3,4(a1)
   1838c:	4780006f          	j	18804 <_Bfree>

00018390 <__quorem_D2A>:
   18390:	fb010113          	addi	sp,sp,-80
   18394:	04912223          	sw	s1,68(sp)
   18398:	01052783          	lw	a5,16(a0)
   1839c:	0105a483          	lw	s1,16(a1)
   183a0:	04112623          	sw	ra,76(sp)
   183a4:	2297cc63          	blt	a5,s1,185dc <__quorem_D2A+0x24c>
   183a8:	fff48493          	addi	s1,s1,-1
   183ac:	03512a23          	sw	s5,52(sp)
   183b0:	03712623          	sw	s7,44(sp)
   183b4:	00249a93          	slli	s5,s1,0x2
   183b8:	01458b93          	addi	s7,a1,20
   183bc:	05212023          	sw	s2,64(sp)
   183c0:	03312e23          	sw	s3,60(sp)
   183c4:	015b8933          	add	s2,s7,s5
   183c8:	01450993          	addi	s3,a0,20
   183cc:	015987b3          	add	a5,s3,s5
   183d0:	03812423          	sw	s8,40(sp)
   183d4:	00092c03          	lw	s8,0(s2)
   183d8:	03912223          	sw	s9,36(sp)
   183dc:	0007ac83          	lw	s9,0(a5)
   183e0:	001c0c13          	addi	s8,s8,1
   183e4:	03412c23          	sw	s4,56(sp)
   183e8:	03612823          	sw	s6,48(sp)
   183ec:	00050a13          	mv	s4,a0
   183f0:	00058b13          	mv	s6,a1
   183f4:	000c8513          	mv	a0,s9
   183f8:	000c0593          	mv	a1,s8
   183fc:	04812423          	sw	s0,72(sp)
   18400:	00f12623          	sw	a5,12(sp)
   18404:	6f1090ef          	jal	222f4 <__hidden___udivsi3>
   18408:	00050413          	mv	s0,a0
   1840c:	0f8ce463          	bltu	s9,s8,184f4 <__quorem_D2A+0x164>
   18410:	03a12023          	sw	s10,32(sp)
   18414:	01b12e23          	sw	s11,28(sp)
   18418:	000b8d13          	mv	s10,s7
   1841c:	00098c93          	mv	s9,s3
   18420:	00000c13          	li	s8,0
   18424:	00000a93          	li	s5,0
   18428:	000d2d83          	lw	s11,0(s10)
   1842c:	00040593          	mv	a1,s0
   18430:	004c8c93          	addi	s9,s9,4
   18434:	010d9513          	slli	a0,s11,0x10
   18438:	01055513          	srli	a0,a0,0x10
   1843c:	68d090ef          	jal	222c8 <__mulsi3>
   18440:	00050793          	mv	a5,a0
   18444:	00040593          	mv	a1,s0
   18448:	010dd513          	srli	a0,s11,0x10
   1844c:	01878c33          	add	s8,a5,s8
   18450:	679090ef          	jal	222c8 <__mulsi3>
   18454:	ffcca783          	lw	a5,-4(s9)
   18458:	010c1593          	slli	a1,s8,0x10
   1845c:	0105d593          	srli	a1,a1,0x10
   18460:	01079713          	slli	a4,a5,0x10
   18464:	01075713          	srli	a4,a4,0x10
   18468:	010c5c13          	srli	s8,s8,0x10
   1846c:	40b70733          	sub	a4,a4,a1
   18470:	41570733          	sub	a4,a4,s5
   18474:	01850533          	add	a0,a0,s8
   18478:	01075693          	srli	a3,a4,0x10
   1847c:	01051613          	slli	a2,a0,0x10
   18480:	01065613          	srli	a2,a2,0x10
   18484:	0016f693          	andi	a3,a3,1
   18488:	00c686b3          	add	a3,a3,a2
   1848c:	0107d793          	srli	a5,a5,0x10
   18490:	40d787b3          	sub	a5,a5,a3
   18494:	01071713          	slli	a4,a4,0x10
   18498:	01079693          	slli	a3,a5,0x10
   1849c:	01075713          	srli	a4,a4,0x10
   184a0:	00e6e733          	or	a4,a3,a4
   184a4:	004d0d13          	addi	s10,s10,4
   184a8:	0107d793          	srli	a5,a5,0x10
   184ac:	feecae23          	sw	a4,-4(s9)
   184b0:	01055c13          	srli	s8,a0,0x10
   184b4:	0017fa93          	andi	s5,a5,1
   184b8:	f7a978e3          	bgeu	s2,s10,18428 <__quorem_D2A+0x98>
   184bc:	00c12703          	lw	a4,12(sp)
   184c0:	00072783          	lw	a5,0(a4)
   184c4:	12079663          	bnez	a5,185f0 <__quorem_D2A+0x260>
   184c8:	ffc70a93          	addi	s5,a4,-4
   184cc:	0159e863          	bltu	s3,s5,184dc <__quorem_D2A+0x14c>
   184d0:	0180006f          	j	184e8 <__quorem_D2A+0x158>
   184d4:	fff48493          	addi	s1,s1,-1
   184d8:	0159f863          	bgeu	s3,s5,184e8 <__quorem_D2A+0x158>
   184dc:	000aa783          	lw	a5,0(s5)
   184e0:	ffca8a93          	addi	s5,s5,-4
   184e4:	fe0788e3          	beqz	a5,184d4 <__quorem_D2A+0x144>
   184e8:	02012d03          	lw	s10,32(sp)
   184ec:	01c12d83          	lw	s11,28(sp)
   184f0:	009a2823          	sw	s1,16(s4)
   184f4:	000b0593          	mv	a1,s6
   184f8:	000a0513          	mv	a0,s4
   184fc:	5d5000ef          	jal	192d0 <__mcmp>
   18500:	0a054263          	bltz	a0,185a4 <__quorem_D2A+0x214>
   18504:	00098593          	mv	a1,s3
   18508:	00000513          	li	a0,0
   1850c:	0005a783          	lw	a5,0(a1)
   18510:	000ba683          	lw	a3,0(s7)
   18514:	00458593          	addi	a1,a1,4
   18518:	01079713          	slli	a4,a5,0x10
   1851c:	01069813          	slli	a6,a3,0x10
   18520:	01085813          	srli	a6,a6,0x10
   18524:	01075713          	srli	a4,a4,0x10
   18528:	41070733          	sub	a4,a4,a6
   1852c:	40a70733          	sub	a4,a4,a0
   18530:	0106d613          	srli	a2,a3,0x10
   18534:	01075693          	srli	a3,a4,0x10
   18538:	0016f693          	andi	a3,a3,1
   1853c:	00c686b3          	add	a3,a3,a2
   18540:	0107d793          	srli	a5,a5,0x10
   18544:	40d787b3          	sub	a5,a5,a3
   18548:	01071713          	slli	a4,a4,0x10
   1854c:	01079693          	slli	a3,a5,0x10
   18550:	01075713          	srli	a4,a4,0x10
   18554:	00e6e733          	or	a4,a3,a4
   18558:	004b8b93          	addi	s7,s7,4
   1855c:	0107d793          	srli	a5,a5,0x10
   18560:	fee5ae23          	sw	a4,-4(a1)
   18564:	0017f513          	andi	a0,a5,1
   18568:	fb7972e3          	bgeu	s2,s7,1850c <__quorem_D2A+0x17c>
   1856c:	00249793          	slli	a5,s1,0x2
   18570:	00f987b3          	add	a5,s3,a5
   18574:	0007a703          	lw	a4,0(a5)
   18578:	02071463          	bnez	a4,185a0 <__quorem_D2A+0x210>
   1857c:	ffc78793          	addi	a5,a5,-4
   18580:	00f9e863          	bltu	s3,a5,18590 <__quorem_D2A+0x200>
   18584:	0180006f          	j	1859c <__quorem_D2A+0x20c>
   18588:	fff48493          	addi	s1,s1,-1
   1858c:	00f9f863          	bgeu	s3,a5,1859c <__quorem_D2A+0x20c>
   18590:	0007a703          	lw	a4,0(a5)
   18594:	ffc78793          	addi	a5,a5,-4
   18598:	fe0708e3          	beqz	a4,18588 <__quorem_D2A+0x1f8>
   1859c:	009a2823          	sw	s1,16(s4)
   185a0:	00140413          	addi	s0,s0,1
   185a4:	04c12083          	lw	ra,76(sp)
   185a8:	00040513          	mv	a0,s0
   185ac:	04812403          	lw	s0,72(sp)
   185b0:	04012903          	lw	s2,64(sp)
   185b4:	03c12983          	lw	s3,60(sp)
   185b8:	03812a03          	lw	s4,56(sp)
   185bc:	03412a83          	lw	s5,52(sp)
   185c0:	03012b03          	lw	s6,48(sp)
   185c4:	02c12b83          	lw	s7,44(sp)
   185c8:	02812c03          	lw	s8,40(sp)
   185cc:	02412c83          	lw	s9,36(sp)
   185d0:	04412483          	lw	s1,68(sp)
   185d4:	05010113          	addi	sp,sp,80
   185d8:	00008067          	ret
   185dc:	04c12083          	lw	ra,76(sp)
   185e0:	04412483          	lw	s1,68(sp)
   185e4:	00000513          	li	a0,0
   185e8:	05010113          	addi	sp,sp,80
   185ec:	00008067          	ret
   185f0:	000b0593          	mv	a1,s6
   185f4:	000a0513          	mv	a0,s4
   185f8:	02012d03          	lw	s10,32(sp)
   185fc:	01c12d83          	lw	s11,28(sp)
   18600:	4d1000ef          	jal	192d0 <__mcmp>
   18604:	f00550e3          	bgez	a0,18504 <__quorem_D2A+0x174>
   18608:	f9dff06f          	j	185a4 <__quorem_D2A+0x214>

0001860c <__rshift_D2A>:
   1860c:	01052803          	lw	a6,16(a0)
   18610:	4055de13          	srai	t3,a1,0x5
   18614:	010e4863          	blt	t3,a6,18624 <__rshift_D2A+0x18>
   18618:	00052823          	sw	zero,16(a0)
   1861c:	00052a23          	sw	zero,20(a0)
   18620:	00008067          	ret
   18624:	01450313          	addi	t1,a0,20
   18628:	00281613          	slli	a2,a6,0x2
   1862c:	002e1793          	slli	a5,t3,0x2
   18630:	01f5f593          	andi	a1,a1,31
   18634:	00c30633          	add	a2,t1,a2
   18638:	00f307b3          	add	a5,t1,a5
   1863c:	06058263          	beqz	a1,186a0 <__rshift_D2A+0x94>
   18640:	0007a683          	lw	a3,0(a5)
   18644:	02000e93          	li	t4,32
   18648:	00478793          	addi	a5,a5,4
   1864c:	00b6d6b3          	srl	a3,a3,a1
   18650:	40be8eb3          	sub	t4,t4,a1
   18654:	08c7f463          	bgeu	a5,a2,186dc <__rshift_D2A+0xd0>
   18658:	00030893          	mv	a7,t1
   1865c:	0007a703          	lw	a4,0(a5)
   18660:	00488893          	addi	a7,a7,4
   18664:	00478793          	addi	a5,a5,4
   18668:	01d71733          	sll	a4,a4,t4
   1866c:	00d76733          	or	a4,a4,a3
   18670:	fee8ae23          	sw	a4,-4(a7)
   18674:	ffc7a683          	lw	a3,-4(a5)
   18678:	00b6d6b3          	srl	a3,a3,a1
   1867c:	fec7e0e3          	bltu	a5,a2,1865c <__rshift_D2A+0x50>
   18680:	41c80833          	sub	a6,a6,t3
   18684:	00281813          	slli	a6,a6,0x2
   18688:	01030833          	add	a6,t1,a6
   1868c:	fed82e23          	sw	a3,-4(a6)
   18690:	ffc80813          	addi	a6,a6,-4
   18694:	02068a63          	beqz	a3,186c8 <__rshift_D2A+0xbc>
   18698:	00480813          	addi	a6,a6,4
   1869c:	02c0006f          	j	186c8 <__rshift_D2A+0xbc>
   186a0:	00030713          	mv	a4,t1
   186a4:	f6c7fae3          	bgeu	a5,a2,18618 <__rshift_D2A+0xc>
   186a8:	0007a683          	lw	a3,0(a5)
   186ac:	00478793          	addi	a5,a5,4
   186b0:	00470713          	addi	a4,a4,4
   186b4:	fed72e23          	sw	a3,-4(a4)
   186b8:	fec7e8e3          	bltu	a5,a2,186a8 <__rshift_D2A+0x9c>
   186bc:	41c80833          	sub	a6,a6,t3
   186c0:	00281813          	slli	a6,a6,0x2
   186c4:	01030833          	add	a6,t1,a6
   186c8:	406807b3          	sub	a5,a6,t1
   186cc:	4027d793          	srai	a5,a5,0x2
   186d0:	00f52823          	sw	a5,16(a0)
   186d4:	f46804e3          	beq	a6,t1,1861c <__rshift_D2A+0x10>
   186d8:	00008067          	ret
   186dc:	00d52a23          	sw	a3,20(a0)
   186e0:	f2068ce3          	beqz	a3,18618 <__rshift_D2A+0xc>
   186e4:	00030813          	mv	a6,t1
   186e8:	00480813          	addi	a6,a6,4
   186ec:	fddff06f          	j	186c8 <__rshift_D2A+0xbc>

000186f0 <__trailz_D2A>:
   186f0:	01052703          	lw	a4,16(a0)
   186f4:	fe010113          	addi	sp,sp,-32
   186f8:	01450513          	addi	a0,a0,20
   186fc:	00271713          	slli	a4,a4,0x2
   18700:	00812c23          	sw	s0,24(sp)
   18704:	00112e23          	sw	ra,28(sp)
   18708:	00e50733          	add	a4,a0,a4
   1870c:	00000413          	li	s0,0
   18710:	00e56a63          	bltu	a0,a4,18724 <__trailz_D2A+0x34>
   18714:	02c0006f          	j	18740 <__trailz_D2A+0x50>
   18718:	00450513          	addi	a0,a0,4
   1871c:	02040413          	addi	s0,s0,32
   18720:	02e57063          	bgeu	a0,a4,18740 <__trailz_D2A+0x50>
   18724:	00052783          	lw	a5,0(a0)
   18728:	fe0788e3          	beqz	a5,18718 <__trailz_D2A+0x28>
   1872c:	00e57a63          	bgeu	a0,a4,18740 <__trailz_D2A+0x50>
   18730:	00c10513          	addi	a0,sp,12
   18734:	00f12623          	sw	a5,12(sp)
   18738:	424000ef          	jal	18b5c <__lo0bits>
   1873c:	00a40433          	add	s0,s0,a0
   18740:	01c12083          	lw	ra,28(sp)
   18744:	00040513          	mv	a0,s0
   18748:	01812403          	lw	s0,24(sp)
   1874c:	02010113          	addi	sp,sp,32
   18750:	00008067          	ret

00018754 <_Balloc>:
   18754:	04452783          	lw	a5,68(a0)
   18758:	ff010113          	addi	sp,sp,-16
   1875c:	00812423          	sw	s0,8(sp)
   18760:	00912223          	sw	s1,4(sp)
   18764:	00112623          	sw	ra,12(sp)
   18768:	00050413          	mv	s0,a0
   1876c:	00058493          	mv	s1,a1
   18770:	02078c63          	beqz	a5,187a8 <_Balloc+0x54>
   18774:	00249713          	slli	a4,s1,0x2
   18778:	00e787b3          	add	a5,a5,a4
   1877c:	0007a503          	lw	a0,0(a5)
   18780:	04050463          	beqz	a0,187c8 <_Balloc+0x74>
   18784:	00052703          	lw	a4,0(a0)
   18788:	00e7a023          	sw	a4,0(a5)
   1878c:	00052823          	sw	zero,16(a0)
   18790:	00052623          	sw	zero,12(a0)
   18794:	00c12083          	lw	ra,12(sp)
   18798:	00812403          	lw	s0,8(sp)
   1879c:	00412483          	lw	s1,4(sp)
   187a0:	01010113          	addi	sp,sp,16
   187a4:	00008067          	ret
   187a8:	02100613          	li	a2,33
   187ac:	00400593          	li	a1,4
   187b0:	689010ef          	jal	1a638 <_calloc_r>
   187b4:	04a42223          	sw	a0,68(s0)
   187b8:	00050793          	mv	a5,a0
   187bc:	fa051ce3          	bnez	a0,18774 <_Balloc+0x20>
   187c0:	00000513          	li	a0,0
   187c4:	fd1ff06f          	j	18794 <_Balloc+0x40>
   187c8:	00100593          	li	a1,1
   187cc:	01212023          	sw	s2,0(sp)
   187d0:	00959933          	sll	s2,a1,s1
   187d4:	00590613          	addi	a2,s2,5
   187d8:	00040513          	mv	a0,s0
   187dc:	00261613          	slli	a2,a2,0x2
   187e0:	659010ef          	jal	1a638 <_calloc_r>
   187e4:	00050a63          	beqz	a0,187f8 <_Balloc+0xa4>
   187e8:	01252423          	sw	s2,8(a0)
   187ec:	00952223          	sw	s1,4(a0)
   187f0:	00012903          	lw	s2,0(sp)
   187f4:	f99ff06f          	j	1878c <_Balloc+0x38>
   187f8:	00012903          	lw	s2,0(sp)
   187fc:	00000513          	li	a0,0
   18800:	f95ff06f          	j	18794 <_Balloc+0x40>

00018804 <_Bfree>:
   18804:	02058063          	beqz	a1,18824 <_Bfree+0x20>
   18808:	0045a703          	lw	a4,4(a1)
   1880c:	04452783          	lw	a5,68(a0)
   18810:	00271713          	slli	a4,a4,0x2
   18814:	00e787b3          	add	a5,a5,a4
   18818:	0007a703          	lw	a4,0(a5)
   1881c:	00e5a023          	sw	a4,0(a1)
   18820:	00b7a023          	sw	a1,0(a5)
   18824:	00008067          	ret

00018828 <__multadd>:
   18828:	fd010113          	addi	sp,sp,-48
   1882c:	01312e23          	sw	s3,28(sp)
   18830:	0105a983          	lw	s3,16(a1)
   18834:	02812423          	sw	s0,40(sp)
   18838:	02912223          	sw	s1,36(sp)
   1883c:	03212023          	sw	s2,32(sp)
   18840:	01412c23          	sw	s4,24(sp)
   18844:	01512a23          	sw	s5,20(sp)
   18848:	01612823          	sw	s6,16(sp)
   1884c:	02112623          	sw	ra,44(sp)
   18850:	01712623          	sw	s7,12(sp)
   18854:	00058a13          	mv	s4,a1
   18858:	00050a93          	mv	s5,a0
   1885c:	00060913          	mv	s2,a2
   18860:	00068413          	mv	s0,a3
   18864:	01458493          	addi	s1,a1,20
   18868:	00000b13          	li	s6,0
   1886c:	0004ab83          	lw	s7,0(s1)
   18870:	00090593          	mv	a1,s2
   18874:	00448493          	addi	s1,s1,4
   18878:	010b9513          	slli	a0,s7,0x10
   1887c:	01055513          	srli	a0,a0,0x10
   18880:	249090ef          	jal	222c8 <__mulsi3>
   18884:	00050793          	mv	a5,a0
   18888:	00090593          	mv	a1,s2
   1888c:	010bd513          	srli	a0,s7,0x10
   18890:	00878433          	add	s0,a5,s0
   18894:	235090ef          	jal	222c8 <__mulsi3>
   18898:	01045793          	srli	a5,s0,0x10
   1889c:	00f50533          	add	a0,a0,a5
   188a0:	01041413          	slli	s0,s0,0x10
   188a4:	01045413          	srli	s0,s0,0x10
   188a8:	01051793          	slli	a5,a0,0x10
   188ac:	008787b3          	add	a5,a5,s0
   188b0:	001b0b13          	addi	s6,s6,1
   188b4:	fef4ae23          	sw	a5,-4(s1)
   188b8:	01055413          	srli	s0,a0,0x10
   188bc:	fb3b48e3          	blt	s6,s3,1886c <__multadd+0x44>
   188c0:	02040063          	beqz	s0,188e0 <__multadd+0xb8>
   188c4:	008a2783          	lw	a5,8(s4)
   188c8:	04f9d463          	bge	s3,a5,18910 <__multadd+0xe8>
   188cc:	00299793          	slli	a5,s3,0x2
   188d0:	00fa07b3          	add	a5,s4,a5
   188d4:	0087aa23          	sw	s0,20(a5)
   188d8:	00198993          	addi	s3,s3,1
   188dc:	013a2823          	sw	s3,16(s4)
   188e0:	02c12083          	lw	ra,44(sp)
   188e4:	02812403          	lw	s0,40(sp)
   188e8:	02412483          	lw	s1,36(sp)
   188ec:	02012903          	lw	s2,32(sp)
   188f0:	01c12983          	lw	s3,28(sp)
   188f4:	01412a83          	lw	s5,20(sp)
   188f8:	01012b03          	lw	s6,16(sp)
   188fc:	00c12b83          	lw	s7,12(sp)
   18900:	000a0513          	mv	a0,s4
   18904:	01812a03          	lw	s4,24(sp)
   18908:	03010113          	addi	sp,sp,48
   1890c:	00008067          	ret
   18910:	004a2583          	lw	a1,4(s4)
   18914:	000a8513          	mv	a0,s5
   18918:	00158593          	addi	a1,a1,1
   1891c:	e39ff0ef          	jal	18754 <_Balloc>
   18920:	00050493          	mv	s1,a0
   18924:	04050a63          	beqz	a0,18978 <__multadd+0x150>
   18928:	010a2603          	lw	a2,16(s4)
   1892c:	00ca0593          	addi	a1,s4,12
   18930:	00c50513          	addi	a0,a0,12
   18934:	00260613          	addi	a2,a2,2
   18938:	00261613          	slli	a2,a2,0x2
   1893c:	aacfd0ef          	jal	15be8 <memcpy>
   18940:	004a2703          	lw	a4,4(s4)
   18944:	044aa783          	lw	a5,68(s5)
   18948:	00271713          	slli	a4,a4,0x2
   1894c:	00e787b3          	add	a5,a5,a4
   18950:	0007a703          	lw	a4,0(a5)
   18954:	00ea2023          	sw	a4,0(s4)
   18958:	0147a023          	sw	s4,0(a5)
   1895c:	00048a13          	mv	s4,s1
   18960:	00299793          	slli	a5,s3,0x2
   18964:	00fa07b3          	add	a5,s4,a5
   18968:	0087aa23          	sw	s0,20(a5)
   1896c:	00198993          	addi	s3,s3,1
   18970:	013a2823          	sw	s3,16(s4)
   18974:	f6dff06f          	j	188e0 <__multadd+0xb8>
   18978:	000226b7          	lui	a3,0x22
   1897c:	00022537          	lui	a0,0x22
   18980:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   18984:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   18988:	00000613          	li	a2,0
   1898c:	0ba00593          	li	a1,186
   18990:	449010ef          	jal	1a5d8 <__assert_func>

00018994 <__s2b>:
   18994:	fe010113          	addi	sp,sp,-32
   18998:	00812c23          	sw	s0,24(sp)
   1899c:	01212823          	sw	s2,16(sp)
   189a0:	00058413          	mv	s0,a1
   189a4:	00050913          	mv	s2,a0
   189a8:	00900593          	li	a1,9
   189ac:	00868513          	addi	a0,a3,8
   189b0:	00912a23          	sw	s1,20(sp)
   189b4:	01312623          	sw	s3,12(sp)
   189b8:	01412423          	sw	s4,8(sp)
   189bc:	00112e23          	sw	ra,28(sp)
   189c0:	00068493          	mv	s1,a3
   189c4:	00060993          	mv	s3,a2
   189c8:	00070a13          	mv	s4,a4
   189cc:	121090ef          	jal	222ec <__divsi3>
   189d0:	00900793          	li	a5,9
   189d4:	0c97da63          	bge	a5,s1,18aa8 <__s2b+0x114>
   189d8:	00100793          	li	a5,1
   189dc:	00000593          	li	a1,0
   189e0:	00179793          	slli	a5,a5,0x1
   189e4:	00158593          	addi	a1,a1,1
   189e8:	fea7cce3          	blt	a5,a0,189e0 <__s2b+0x4c>
   189ec:	00090513          	mv	a0,s2
   189f0:	d65ff0ef          	jal	18754 <_Balloc>
   189f4:	00050593          	mv	a1,a0
   189f8:	0a050c63          	beqz	a0,18ab0 <__s2b+0x11c>
   189fc:	00100793          	li	a5,1
   18a00:	00f52823          	sw	a5,16(a0)
   18a04:	01452a23          	sw	s4,20(a0)
   18a08:	00900793          	li	a5,9
   18a0c:	0937d863          	bge	a5,s3,18a9c <__s2b+0x108>
   18a10:	01512223          	sw	s5,4(sp)
   18a14:	00f40ab3          	add	s5,s0,a5
   18a18:	01340a33          	add	s4,s0,s3
   18a1c:	000a8413          	mv	s0,s5
   18a20:	00044683          	lbu	a3,0(s0)
   18a24:	00a00613          	li	a2,10
   18a28:	00090513          	mv	a0,s2
   18a2c:	fd068693          	addi	a3,a3,-48
   18a30:	00140413          	addi	s0,s0,1
   18a34:	df5ff0ef          	jal	18828 <__multadd>
   18a38:	00050593          	mv	a1,a0
   18a3c:	ff4412e3          	bne	s0,s4,18a20 <__s2b+0x8c>
   18a40:	013a8ab3          	add	s5,s5,s3
   18a44:	ff8a8413          	addi	s0,s5,-8
   18a48:	00412a83          	lw	s5,4(sp)
   18a4c:	0299d663          	bge	s3,s1,18a78 <__s2b+0xe4>
   18a50:	413484b3          	sub	s1,s1,s3
   18a54:	009404b3          	add	s1,s0,s1
   18a58:	00044683          	lbu	a3,0(s0)
   18a5c:	00a00613          	li	a2,10
   18a60:	00090513          	mv	a0,s2
   18a64:	fd068693          	addi	a3,a3,-48
   18a68:	00140413          	addi	s0,s0,1
   18a6c:	dbdff0ef          	jal	18828 <__multadd>
   18a70:	00050593          	mv	a1,a0
   18a74:	fe9412e3          	bne	s0,s1,18a58 <__s2b+0xc4>
   18a78:	01c12083          	lw	ra,28(sp)
   18a7c:	01812403          	lw	s0,24(sp)
   18a80:	01412483          	lw	s1,20(sp)
   18a84:	01012903          	lw	s2,16(sp)
   18a88:	00c12983          	lw	s3,12(sp)
   18a8c:	00812a03          	lw	s4,8(sp)
   18a90:	00058513          	mv	a0,a1
   18a94:	02010113          	addi	sp,sp,32
   18a98:	00008067          	ret
   18a9c:	00a40413          	addi	s0,s0,10
   18aa0:	00078993          	mv	s3,a5
   18aa4:	fa9ff06f          	j	18a4c <__s2b+0xb8>
   18aa8:	00000593          	li	a1,0
   18aac:	f41ff06f          	j	189ec <__s2b+0x58>
   18ab0:	000226b7          	lui	a3,0x22
   18ab4:	00022537          	lui	a0,0x22
   18ab8:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   18abc:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   18ac0:	00000613          	li	a2,0
   18ac4:	0d300593          	li	a1,211
   18ac8:	01512223          	sw	s5,4(sp)
   18acc:	30d010ef          	jal	1a5d8 <__assert_func>

00018ad0 <__hi0bits>:
   18ad0:	00050793          	mv	a5,a0
   18ad4:	00010737          	lui	a4,0x10
   18ad8:	00000513          	li	a0,0
   18adc:	00e7f663          	bgeu	a5,a4,18ae8 <__hi0bits+0x18>
   18ae0:	01079793          	slli	a5,a5,0x10
   18ae4:	01000513          	li	a0,16
   18ae8:	01000737          	lui	a4,0x1000
   18aec:	00e7f663          	bgeu	a5,a4,18af8 <__hi0bits+0x28>
   18af0:	00850513          	addi	a0,a0,8
   18af4:	00879793          	slli	a5,a5,0x8
   18af8:	10000737          	lui	a4,0x10000
   18afc:	00e7ee63          	bltu	a5,a4,18b18 <__hi0bits+0x48>
   18b00:	40000737          	lui	a4,0x40000
   18b04:	02e7fe63          	bgeu	a5,a4,18b40 <__hi0bits+0x70>
   18b08:	00279713          	slli	a4,a5,0x2
   18b0c:	04074463          	bltz	a4,18b54 <__hi0bits+0x84>
   18b10:	00350513          	addi	a0,a0,3
   18b14:	00008067          	ret
   18b18:	00479713          	slli	a4,a5,0x4
   18b1c:	400006b7          	lui	a3,0x40000
   18b20:	00450513          	addi	a0,a0,4
   18b24:	02d77063          	bgeu	a4,a3,18b44 <__hi0bits+0x74>
   18b28:	00679793          	slli	a5,a5,0x6
   18b2c:	0207c463          	bltz	a5,18b54 <__hi0bits+0x84>
   18b30:	00179713          	slli	a4,a5,0x1
   18b34:	fc074ee3          	bltz	a4,18b10 <__hi0bits+0x40>
   18b38:	02000513          	li	a0,32
   18b3c:	00008067          	ret
   18b40:	00078713          	mv	a4,a5
   18b44:	fff74713          	not	a4,a4
   18b48:	01f75713          	srli	a4,a4,0x1f
   18b4c:	00e50533          	add	a0,a0,a4
   18b50:	00008067          	ret
   18b54:	00250513          	addi	a0,a0,2
   18b58:	00008067          	ret

00018b5c <__lo0bits>:
   18b5c:	00052783          	lw	a5,0(a0)
   18b60:	00050713          	mv	a4,a0
   18b64:	0077f693          	andi	a3,a5,7
   18b68:	02068c63          	beqz	a3,18ba0 <__lo0bits+0x44>
   18b6c:	0017f693          	andi	a3,a5,1
   18b70:	00000513          	li	a0,0
   18b74:	02069463          	bnez	a3,18b9c <__lo0bits+0x40>
   18b78:	0027f693          	andi	a3,a5,2
   18b7c:	0c068063          	beqz	a3,18c3c <__lo0bits+0xe0>
   18b80:	0017d793          	srli	a5,a5,0x1
   18b84:	00f72023          	sw	a5,0(a4) # 40000000 <__BSS_END__+0x3ffdc5ac>
   18b88:	00100513          	li	a0,1
   18b8c:	00008067          	ret
   18b90:	0037d793          	srli	a5,a5,0x3
   18b94:	0c079263          	bnez	a5,18c58 <__lo0bits+0xfc>
   18b98:	02000513          	li	a0,32
   18b9c:	00008067          	ret
   18ba0:	01079693          	slli	a3,a5,0x10
   18ba4:	0106d693          	srli	a3,a3,0x10
   18ba8:	04069263          	bnez	a3,18bec <__lo0bits+0x90>
   18bac:	0107d793          	srli	a5,a5,0x10
   18bb0:	0ff7f693          	zext.b	a3,a5
   18bb4:	01000513          	li	a0,16
   18bb8:	00069663          	bnez	a3,18bc4 <__lo0bits+0x68>
   18bbc:	01800513          	li	a0,24
   18bc0:	0087d793          	srli	a5,a5,0x8
   18bc4:	00f7f693          	andi	a3,a5,15
   18bc8:	04068e63          	beqz	a3,18c24 <__lo0bits+0xc8>
   18bcc:	0037f693          	andi	a3,a5,3
   18bd0:	02068e63          	beqz	a3,18c0c <__lo0bits+0xb0>
   18bd4:	0017f693          	andi	a3,a5,1
   18bd8:	00069663          	bnez	a3,18be4 <__lo0bits+0x88>
   18bdc:	00150513          	addi	a0,a0,1
   18be0:	0017d793          	srli	a5,a5,0x1
   18be4:	00f72023          	sw	a5,0(a4)
   18be8:	00008067          	ret
   18bec:	0ff7f693          	zext.b	a3,a5
   18bf0:	04068063          	beqz	a3,18c30 <__lo0bits+0xd4>
   18bf4:	00f7f693          	andi	a3,a5,15
   18bf8:	04069a63          	bnez	a3,18c4c <__lo0bits+0xf0>
   18bfc:	00400513          	li	a0,4
   18c00:	0047d793          	srli	a5,a5,0x4
   18c04:	0037f693          	andi	a3,a5,3
   18c08:	fc0696e3          	bnez	a3,18bd4 <__lo0bits+0x78>
   18c0c:	0027d693          	srli	a3,a5,0x2
   18c10:	0016f613          	andi	a2,a3,1
   18c14:	f6060ee3          	beqz	a2,18b90 <__lo0bits+0x34>
   18c18:	00250513          	addi	a0,a0,2
   18c1c:	00068793          	mv	a5,a3
   18c20:	fc5ff06f          	j	18be4 <__lo0bits+0x88>
   18c24:	00450513          	addi	a0,a0,4
   18c28:	0047d793          	srli	a5,a5,0x4
   18c2c:	fd9ff06f          	j	18c04 <__lo0bits+0xa8>
   18c30:	00800513          	li	a0,8
   18c34:	0087d793          	srli	a5,a5,0x8
   18c38:	f8dff06f          	j	18bc4 <__lo0bits+0x68>
   18c3c:	0027d793          	srli	a5,a5,0x2
   18c40:	00f72023          	sw	a5,0(a4)
   18c44:	00200513          	li	a0,2
   18c48:	00008067          	ret
   18c4c:	0037d793          	srli	a5,a5,0x3
   18c50:	00300513          	li	a0,3
   18c54:	f91ff06f          	j	18be4 <__lo0bits+0x88>
   18c58:	00350513          	addi	a0,a0,3
   18c5c:	f89ff06f          	j	18be4 <__lo0bits+0x88>

00018c60 <__i2b>:
   18c60:	04452783          	lw	a5,68(a0)
   18c64:	ff010113          	addi	sp,sp,-16
   18c68:	00812423          	sw	s0,8(sp)
   18c6c:	00912223          	sw	s1,4(sp)
   18c70:	00112623          	sw	ra,12(sp)
   18c74:	00050413          	mv	s0,a0
   18c78:	00058493          	mv	s1,a1
   18c7c:	02078c63          	beqz	a5,18cb4 <__i2b+0x54>
   18c80:	0047a503          	lw	a0,4(a5)
   18c84:	06050263          	beqz	a0,18ce8 <__i2b+0x88>
   18c88:	00052703          	lw	a4,0(a0)
   18c8c:	00e7a223          	sw	a4,4(a5)
   18c90:	00c12083          	lw	ra,12(sp)
   18c94:	00812403          	lw	s0,8(sp)
   18c98:	00100793          	li	a5,1
   18c9c:	00952a23          	sw	s1,20(a0)
   18ca0:	00052623          	sw	zero,12(a0)
   18ca4:	00f52823          	sw	a5,16(a0)
   18ca8:	00412483          	lw	s1,4(sp)
   18cac:	01010113          	addi	sp,sp,16
   18cb0:	00008067          	ret
   18cb4:	02100613          	li	a2,33
   18cb8:	00400593          	li	a1,4
   18cbc:	17d010ef          	jal	1a638 <_calloc_r>
   18cc0:	04a42223          	sw	a0,68(s0)
   18cc4:	00050793          	mv	a5,a0
   18cc8:	fa051ce3          	bnez	a0,18c80 <__i2b+0x20>
   18ccc:	000226b7          	lui	a3,0x22
   18cd0:	00022537          	lui	a0,0x22
   18cd4:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   18cd8:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   18cdc:	00000613          	li	a2,0
   18ce0:	14500593          	li	a1,325
   18ce4:	0f5010ef          	jal	1a5d8 <__assert_func>
   18ce8:	00040513          	mv	a0,s0
   18cec:	01c00613          	li	a2,28
   18cf0:	00100593          	li	a1,1
   18cf4:	145010ef          	jal	1a638 <_calloc_r>
   18cf8:	fc050ae3          	beqz	a0,18ccc <__i2b+0x6c>
   18cfc:	00100713          	li	a4,1
   18d00:	00200793          	li	a5,2
   18d04:	00e52223          	sw	a4,4(a0)
   18d08:	00f52423          	sw	a5,8(a0)
   18d0c:	f85ff06f          	j	18c90 <__i2b+0x30>

00018d10 <__multiply>:
   18d10:	fb010113          	addi	sp,sp,-80
   18d14:	03312e23          	sw	s3,60(sp)
   18d18:	03812423          	sw	s8,40(sp)
   18d1c:	01062983          	lw	s3,16(a2)
   18d20:	0105ac03          	lw	s8,16(a1)
   18d24:	04812423          	sw	s0,72(sp)
   18d28:	03412c23          	sw	s4,56(sp)
   18d2c:	04112623          	sw	ra,76(sp)
   18d30:	03712623          	sw	s7,44(sp)
   18d34:	00058a13          	mv	s4,a1
   18d38:	00060413          	mv	s0,a2
   18d3c:	013c4c63          	blt	s8,s3,18d54 <__multiply+0x44>
   18d40:	00098713          	mv	a4,s3
   18d44:	00058413          	mv	s0,a1
   18d48:	000c0993          	mv	s3,s8
   18d4c:	00060a13          	mv	s4,a2
   18d50:	00070c13          	mv	s8,a4
   18d54:	00842783          	lw	a5,8(s0)
   18d58:	00442583          	lw	a1,4(s0)
   18d5c:	01898bb3          	add	s7,s3,s8
   18d60:	0177a7b3          	slt	a5,a5,s7
   18d64:	00f585b3          	add	a1,a1,a5
   18d68:	9edff0ef          	jal	18754 <_Balloc>
   18d6c:	00a12623          	sw	a0,12(sp)
   18d70:	22050a63          	beqz	a0,18fa4 <__multiply+0x294>
   18d74:	00c12783          	lw	a5,12(sp)
   18d78:	03512a23          	sw	s5,52(sp)
   18d7c:	03612823          	sw	s6,48(sp)
   18d80:	002b9a93          	slli	s5,s7,0x2
   18d84:	01478b13          	addi	s6,a5,20
   18d88:	015b0ab3          	add	s5,s6,s5
   18d8c:	000b0793          	mv	a5,s6
   18d90:	015b7863          	bgeu	s6,s5,18da0 <__multiply+0x90>
   18d94:	0007a023          	sw	zero,0(a5)
   18d98:	00478793          	addi	a5,a5,4
   18d9c:	ff57ece3          	bltu	a5,s5,18d94 <__multiply+0x84>
   18da0:	01440793          	addi	a5,s0,20
   18da4:	014a0a13          	addi	s4,s4,20
   18da8:	002c1c13          	slli	s8,s8,0x2
   18dac:	00299993          	slli	s3,s3,0x2
   18db0:	018a0c33          	add	s8,s4,s8
   18db4:	00f12423          	sw	a5,8(sp)
   18db8:	013789b3          	add	s3,a5,s3
   18dbc:	198a7c63          	bgeu	s4,s8,18f54 <__multiply+0x244>
   18dc0:	04912223          	sw	s1,68(sp)
   18dc4:	05212023          	sw	s2,64(sp)
   18dc8:	03912223          	sw	s9,36(sp)
   18dcc:	03a12023          	sw	s10,32(sp)
   18dd0:	01b12e23          	sw	s11,28(sp)
   18dd4:	01540793          	addi	a5,s0,21
   18dd8:	00012223          	sw	zero,4(sp)
   18ddc:	02f9ec63          	bltu	s3,a5,18e14 <__multiply+0x104>
   18de0:	000a2903          	lw	s2,0(s4)
   18de4:	40898433          	sub	s0,s3,s0
   18de8:	feb40413          	addi	s0,s0,-21
   18dec:	ffc47793          	andi	a5,s0,-4
   18df0:	01091493          	slli	s1,s2,0x10
   18df4:	00f12223          	sw	a5,4(sp)
   18df8:	0104d493          	srli	s1,s1,0x10
   18dfc:	02049463          	bnez	s1,18e24 <__multiply+0x114>
   18e00:	01095913          	srli	s2,s2,0x10
   18e04:	0a091863          	bnez	s2,18eb4 <__multiply+0x1a4>
   18e08:	004a0a13          	addi	s4,s4,4
   18e0c:	004b0b13          	addi	s6,s6,4
   18e10:	138a7863          	bgeu	s4,s8,18f40 <__multiply+0x230>
   18e14:	000a2903          	lw	s2,0(s4)
   18e18:	01091493          	slli	s1,s2,0x10
   18e1c:	0104d493          	srli	s1,s1,0x10
   18e20:	fe0480e3          	beqz	s1,18e00 <__multiply+0xf0>
   18e24:	00812c83          	lw	s9,8(sp)
   18e28:	000b0d13          	mv	s10,s6
   18e2c:	00000413          	li	s0,0
   18e30:	000cad83          	lw	s11,0(s9)
   18e34:	000d2903          	lw	s2,0(s10)
   18e38:	00048593          	mv	a1,s1
   18e3c:	010d9513          	slli	a0,s11,0x10
   18e40:	01055513          	srli	a0,a0,0x10
   18e44:	484090ef          	jal	222c8 <__mulsi3>
   18e48:	01091813          	slli	a6,s2,0x10
   18e4c:	00050793          	mv	a5,a0
   18e50:	01085813          	srli	a6,a6,0x10
   18e54:	010787b3          	add	a5,a5,a6
   18e58:	010dd513          	srli	a0,s11,0x10
   18e5c:	00048593          	mv	a1,s1
   18e60:	00878433          	add	s0,a5,s0
   18e64:	01095913          	srli	s2,s2,0x10
   18e68:	460090ef          	jal	222c8 <__mulsi3>
   18e6c:	01045793          	srli	a5,s0,0x10
   18e70:	01250533          	add	a0,a0,s2
   18e74:	00f50533          	add	a0,a0,a5
   18e78:	01041413          	slli	s0,s0,0x10
   18e7c:	01045413          	srli	s0,s0,0x10
   18e80:	01051793          	slli	a5,a0,0x10
   18e84:	0087e7b3          	or	a5,a5,s0
   18e88:	004c8c93          	addi	s9,s9,4
   18e8c:	00fd2023          	sw	a5,0(s10)
   18e90:	004d0d13          	addi	s10,s10,4
   18e94:	01055413          	srli	s0,a0,0x10
   18e98:	f93cece3          	bltu	s9,s3,18e30 <__multiply+0x120>
   18e9c:	00412783          	lw	a5,4(sp)
   18ea0:	00fb07b3          	add	a5,s6,a5
   18ea4:	0087a223          	sw	s0,4(a5)
   18ea8:	000a2903          	lw	s2,0(s4)
   18eac:	01095913          	srli	s2,s2,0x10
   18eb0:	f4090ce3          	beqz	s2,18e08 <__multiply+0xf8>
   18eb4:	000b2403          	lw	s0,0(s6)
   18eb8:	00812d83          	lw	s11,8(sp)
   18ebc:	000b0d13          	mv	s10,s6
   18ec0:	00040493          	mv	s1,s0
   18ec4:	00000c93          	li	s9,0
   18ec8:	000dd503          	lhu	a0,0(s11)
   18ecc:	00090593          	mv	a1,s2
   18ed0:	0104d493          	srli	s1,s1,0x10
   18ed4:	3f4090ef          	jal	222c8 <__mulsi3>
   18ed8:	019507b3          	add	a5,a0,s9
   18edc:	00978cb3          	add	s9,a5,s1
   18ee0:	01041413          	slli	s0,s0,0x10
   18ee4:	01045413          	srli	s0,s0,0x10
   18ee8:	010c9613          	slli	a2,s9,0x10
   18eec:	00866633          	or	a2,a2,s0
   18ef0:	00cd2023          	sw	a2,0(s10)
   18ef4:	002dd503          	lhu	a0,2(s11)
   18ef8:	004d2483          	lw	s1,4(s10)
   18efc:	00090593          	mv	a1,s2
   18f00:	3c8090ef          	jal	222c8 <__mulsi3>
   18f04:	01049613          	slli	a2,s1,0x10
   18f08:	01065613          	srli	a2,a2,0x10
   18f0c:	010cd793          	srli	a5,s9,0x10
   18f10:	00c50433          	add	s0,a0,a2
   18f14:	004d8d93          	addi	s11,s11,4
   18f18:	00f40433          	add	s0,s0,a5
   18f1c:	004d0d13          	addi	s10,s10,4
   18f20:	01045c93          	srli	s9,s0,0x10
   18f24:	fb3de2e3          	bltu	s11,s3,18ec8 <__multiply+0x1b8>
   18f28:	00412783          	lw	a5,4(sp)
   18f2c:	004a0a13          	addi	s4,s4,4
   18f30:	00fb07b3          	add	a5,s6,a5
   18f34:	0087a223          	sw	s0,4(a5)
   18f38:	004b0b13          	addi	s6,s6,4
   18f3c:	ed8a6ce3          	bltu	s4,s8,18e14 <__multiply+0x104>
   18f40:	04412483          	lw	s1,68(sp)
   18f44:	04012903          	lw	s2,64(sp)
   18f48:	02412c83          	lw	s9,36(sp)
   18f4c:	02012d03          	lw	s10,32(sp)
   18f50:	01c12d83          	lw	s11,28(sp)
   18f54:	01704863          	bgtz	s7,18f64 <__multiply+0x254>
   18f58:	0180006f          	j	18f70 <__multiply+0x260>
   18f5c:	fffb8b93          	addi	s7,s7,-1
   18f60:	000b8863          	beqz	s7,18f70 <__multiply+0x260>
   18f64:	ffcaa783          	lw	a5,-4(s5)
   18f68:	ffca8a93          	addi	s5,s5,-4
   18f6c:	fe0788e3          	beqz	a5,18f5c <__multiply+0x24c>
   18f70:	00c12783          	lw	a5,12(sp)
   18f74:	04c12083          	lw	ra,76(sp)
   18f78:	04812403          	lw	s0,72(sp)
   18f7c:	0177a823          	sw	s7,16(a5)
   18f80:	03412a83          	lw	s5,52(sp)
   18f84:	03012b03          	lw	s6,48(sp)
   18f88:	03c12983          	lw	s3,60(sp)
   18f8c:	03812a03          	lw	s4,56(sp)
   18f90:	02c12b83          	lw	s7,44(sp)
   18f94:	02812c03          	lw	s8,40(sp)
   18f98:	00078513          	mv	a0,a5
   18f9c:	05010113          	addi	sp,sp,80
   18fa0:	00008067          	ret
   18fa4:	000226b7          	lui	a3,0x22
   18fa8:	00022537          	lui	a0,0x22
   18fac:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   18fb0:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   18fb4:	00000613          	li	a2,0
   18fb8:	16200593          	li	a1,354
   18fbc:	04912223          	sw	s1,68(sp)
   18fc0:	05212023          	sw	s2,64(sp)
   18fc4:	03512a23          	sw	s5,52(sp)
   18fc8:	03612823          	sw	s6,48(sp)
   18fcc:	03912223          	sw	s9,36(sp)
   18fd0:	03a12023          	sw	s10,32(sp)
   18fd4:	01b12e23          	sw	s11,28(sp)
   18fd8:	600010ef          	jal	1a5d8 <__assert_func>

00018fdc <__pow5mult>:
   18fdc:	fe010113          	addi	sp,sp,-32
   18fe0:	00812c23          	sw	s0,24(sp)
   18fe4:	01212823          	sw	s2,16(sp)
   18fe8:	01312623          	sw	s3,12(sp)
   18fec:	00112e23          	sw	ra,28(sp)
   18ff0:	00367793          	andi	a5,a2,3
   18ff4:	00060413          	mv	s0,a2
   18ff8:	00050993          	mv	s3,a0
   18ffc:	00058913          	mv	s2,a1
   19000:	0c079a63          	bnez	a5,190d4 <__pow5mult+0xf8>
   19004:	40245413          	srai	s0,s0,0x2
   19008:	0a040863          	beqz	s0,190b8 <__pow5mult+0xdc>
   1900c:	00912a23          	sw	s1,20(sp)
   19010:	0409a483          	lw	s1,64(s3)
   19014:	0e048263          	beqz	s1,190f8 <__pow5mult+0x11c>
   19018:	00147793          	andi	a5,s0,1
   1901c:	40145413          	srai	s0,s0,0x1
   19020:	00079e63          	bnez	a5,1903c <__pow5mult+0x60>
   19024:	0004a503          	lw	a0,0(s1)
   19028:	04050a63          	beqz	a0,1907c <__pow5mult+0xa0>
   1902c:	00050493          	mv	s1,a0
   19030:	00147793          	andi	a5,s0,1
   19034:	40145413          	srai	s0,s0,0x1
   19038:	fe0786e3          	beqz	a5,19024 <__pow5mult+0x48>
   1903c:	00048613          	mv	a2,s1
   19040:	00090593          	mv	a1,s2
   19044:	00098513          	mv	a0,s3
   19048:	cc9ff0ef          	jal	18d10 <__multiply>
   1904c:	02090063          	beqz	s2,1906c <__pow5mult+0x90>
   19050:	00492703          	lw	a4,4(s2)
   19054:	0449a783          	lw	a5,68(s3)
   19058:	00271713          	slli	a4,a4,0x2
   1905c:	00e787b3          	add	a5,a5,a4
   19060:	0007a703          	lw	a4,0(a5)
   19064:	00e92023          	sw	a4,0(s2)
   19068:	0127a023          	sw	s2,0(a5)
   1906c:	02040863          	beqz	s0,1909c <__pow5mult+0xc0>
   19070:	00050913          	mv	s2,a0
   19074:	0004a503          	lw	a0,0(s1)
   19078:	fa051ae3          	bnez	a0,1902c <__pow5mult+0x50>
   1907c:	00048613          	mv	a2,s1
   19080:	00048593          	mv	a1,s1
   19084:	00098513          	mv	a0,s3
   19088:	c89ff0ef          	jal	18d10 <__multiply>
   1908c:	00a4a023          	sw	a0,0(s1)
   19090:	00052023          	sw	zero,0(a0)
   19094:	00050493          	mv	s1,a0
   19098:	f99ff06f          	j	19030 <__pow5mult+0x54>
   1909c:	01c12083          	lw	ra,28(sp)
   190a0:	01812403          	lw	s0,24(sp)
   190a4:	01412483          	lw	s1,20(sp)
   190a8:	01012903          	lw	s2,16(sp)
   190ac:	00c12983          	lw	s3,12(sp)
   190b0:	02010113          	addi	sp,sp,32
   190b4:	00008067          	ret
   190b8:	01c12083          	lw	ra,28(sp)
   190bc:	01812403          	lw	s0,24(sp)
   190c0:	00c12983          	lw	s3,12(sp)
   190c4:	00090513          	mv	a0,s2
   190c8:	01012903          	lw	s2,16(sp)
   190cc:	02010113          	addi	sp,sp,32
   190d0:	00008067          	ret
   190d4:	00022737          	lui	a4,0x22
   190d8:	7cc70713          	addi	a4,a4,1996 # 227cc <p05.0>
   190dc:	00279793          	slli	a5,a5,0x2
   190e0:	00f707b3          	add	a5,a4,a5
   190e4:	ffc7a603          	lw	a2,-4(a5)
   190e8:	00000693          	li	a3,0
   190ec:	f3cff0ef          	jal	18828 <__multadd>
   190f0:	00050913          	mv	s2,a0
   190f4:	f11ff06f          	j	19004 <__pow5mult+0x28>
   190f8:	00100593          	li	a1,1
   190fc:	00098513          	mv	a0,s3
   19100:	e54ff0ef          	jal	18754 <_Balloc>
   19104:	00050493          	mv	s1,a0
   19108:	02050063          	beqz	a0,19128 <__pow5mult+0x14c>
   1910c:	27100713          	li	a4,625
   19110:	00100793          	li	a5,1
   19114:	00e52a23          	sw	a4,20(a0)
   19118:	00f52823          	sw	a5,16(a0)
   1911c:	04a9a023          	sw	a0,64(s3)
   19120:	00052023          	sw	zero,0(a0)
   19124:	ef5ff06f          	j	19018 <__pow5mult+0x3c>
   19128:	000226b7          	lui	a3,0x22
   1912c:	00022537          	lui	a0,0x22
   19130:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   19134:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   19138:	00000613          	li	a2,0
   1913c:	14500593          	li	a1,325
   19140:	498010ef          	jal	1a5d8 <__assert_func>

00019144 <__lshift>:
   19144:	fe010113          	addi	sp,sp,-32
   19148:	01312623          	sw	s3,12(sp)
   1914c:	0105a983          	lw	s3,16(a1)
   19150:	0085a783          	lw	a5,8(a1)
   19154:	01512223          	sw	s5,4(sp)
   19158:	40565a93          	srai	s5,a2,0x5
   1915c:	013a89b3          	add	s3,s5,s3
   19160:	00812c23          	sw	s0,24(sp)
   19164:	00912a23          	sw	s1,20(sp)
   19168:	01212823          	sw	s2,16(sp)
   1916c:	01412423          	sw	s4,8(sp)
   19170:	00112e23          	sw	ra,28(sp)
   19174:	00198493          	addi	s1,s3,1
   19178:	00058413          	mv	s0,a1
   1917c:	00060a13          	mv	s4,a2
   19180:	0045a583          	lw	a1,4(a1)
   19184:	00050913          	mv	s2,a0
   19188:	0097d863          	bge	a5,s1,19198 <__lshift+0x54>
   1918c:	00179793          	slli	a5,a5,0x1
   19190:	00158593          	addi	a1,a1,1
   19194:	fe97cce3          	blt	a5,s1,1918c <__lshift+0x48>
   19198:	00090513          	mv	a0,s2
   1919c:	db8ff0ef          	jal	18754 <_Balloc>
   191a0:	10050a63          	beqz	a0,192b4 <__lshift+0x170>
   191a4:	01450813          	addi	a6,a0,20
   191a8:	03505463          	blez	s5,191d0 <__lshift+0x8c>
   191ac:	005a8713          	addi	a4,s5,5
   191b0:	00271713          	slli	a4,a4,0x2
   191b4:	00e50733          	add	a4,a0,a4
   191b8:	00080793          	mv	a5,a6
   191bc:	00478793          	addi	a5,a5,4
   191c0:	fe07ae23          	sw	zero,-4(a5)
   191c4:	fee79ce3          	bne	a5,a4,191bc <__lshift+0x78>
   191c8:	002a9a93          	slli	s5,s5,0x2
   191cc:	01580833          	add	a6,a6,s5
   191d0:	01042883          	lw	a7,16(s0)
   191d4:	01440793          	addi	a5,s0,20
   191d8:	01fa7613          	andi	a2,s4,31
   191dc:	00289893          	slli	a7,a7,0x2
   191e0:	011788b3          	add	a7,a5,a7
   191e4:	0a060263          	beqz	a2,19288 <__lshift+0x144>
   191e8:	02000593          	li	a1,32
   191ec:	40c585b3          	sub	a1,a1,a2
   191f0:	00080313          	mv	t1,a6
   191f4:	00000693          	li	a3,0
   191f8:	0007a703          	lw	a4,0(a5)
   191fc:	00430313          	addi	t1,t1,4
   19200:	00478793          	addi	a5,a5,4
   19204:	00c71733          	sll	a4,a4,a2
   19208:	00d76733          	or	a4,a4,a3
   1920c:	fee32e23          	sw	a4,-4(t1)
   19210:	ffc7a683          	lw	a3,-4(a5)
   19214:	00b6d6b3          	srl	a3,a3,a1
   19218:	ff17e0e3          	bltu	a5,a7,191f8 <__lshift+0xb4>
   1921c:	01540793          	addi	a5,s0,21
   19220:	00000713          	li	a4,0
   19224:	00f8e863          	bltu	a7,a5,19234 <__lshift+0xf0>
   19228:	408888b3          	sub	a7,a7,s0
   1922c:	feb88893          	addi	a7,a7,-21
   19230:	ffc8f713          	andi	a4,a7,-4
   19234:	00e80833          	add	a6,a6,a4
   19238:	00d82223          	sw	a3,4(a6)
   1923c:	00069463          	bnez	a3,19244 <__lshift+0x100>
   19240:	00098493          	mv	s1,s3
   19244:	00442703          	lw	a4,4(s0)
   19248:	04492783          	lw	a5,68(s2)
   1924c:	00952823          	sw	s1,16(a0)
   19250:	00271713          	slli	a4,a4,0x2
   19254:	00e787b3          	add	a5,a5,a4
   19258:	0007a703          	lw	a4,0(a5)
   1925c:	01c12083          	lw	ra,28(sp)
   19260:	01412483          	lw	s1,20(sp)
   19264:	00e42023          	sw	a4,0(s0)
   19268:	0087a023          	sw	s0,0(a5)
   1926c:	01812403          	lw	s0,24(sp)
   19270:	01012903          	lw	s2,16(sp)
   19274:	00c12983          	lw	s3,12(sp)
   19278:	00812a03          	lw	s4,8(sp)
   1927c:	00412a83          	lw	s5,4(sp)
   19280:	02010113          	addi	sp,sp,32
   19284:	00008067          	ret
   19288:	0007a703          	lw	a4,0(a5)
   1928c:	00478793          	addi	a5,a5,4
   19290:	00480813          	addi	a6,a6,4
   19294:	fee82e23          	sw	a4,-4(a6)
   19298:	fb17f4e3          	bgeu	a5,a7,19240 <__lshift+0xfc>
   1929c:	0007a703          	lw	a4,0(a5)
   192a0:	00478793          	addi	a5,a5,4
   192a4:	00480813          	addi	a6,a6,4
   192a8:	fee82e23          	sw	a4,-4(a6)
   192ac:	fd17eee3          	bltu	a5,a7,19288 <__lshift+0x144>
   192b0:	f91ff06f          	j	19240 <__lshift+0xfc>
   192b4:	000226b7          	lui	a3,0x22
   192b8:	00022537          	lui	a0,0x22
   192bc:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   192c0:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   192c4:	00000613          	li	a2,0
   192c8:	1de00593          	li	a1,478
   192cc:	30c010ef          	jal	1a5d8 <__assert_func>

000192d0 <__mcmp>:
   192d0:	01052703          	lw	a4,16(a0)
   192d4:	0105a783          	lw	a5,16(a1)
   192d8:	00050813          	mv	a6,a0
   192dc:	40f70533          	sub	a0,a4,a5
   192e0:	04f71263          	bne	a4,a5,19324 <__mcmp+0x54>
   192e4:	00279793          	slli	a5,a5,0x2
   192e8:	01480813          	addi	a6,a6,20
   192ec:	01458593          	addi	a1,a1,20
   192f0:	00f58733          	add	a4,a1,a5
   192f4:	00f807b3          	add	a5,a6,a5
   192f8:	0080006f          	j	19300 <__mcmp+0x30>
   192fc:	02f87463          	bgeu	a6,a5,19324 <__mcmp+0x54>
   19300:	ffc7a603          	lw	a2,-4(a5)
   19304:	ffc72683          	lw	a3,-4(a4)
   19308:	ffc78793          	addi	a5,a5,-4
   1930c:	ffc70713          	addi	a4,a4,-4
   19310:	fed606e3          	beq	a2,a3,192fc <__mcmp+0x2c>
   19314:	00100513          	li	a0,1
   19318:	00d67663          	bgeu	a2,a3,19324 <__mcmp+0x54>
   1931c:	fff00513          	li	a0,-1
   19320:	00008067          	ret
   19324:	00008067          	ret

00019328 <__mdiff>:
   19328:	0105a703          	lw	a4,16(a1)
   1932c:	01062783          	lw	a5,16(a2)
   19330:	ff010113          	addi	sp,sp,-16
   19334:	00812423          	sw	s0,8(sp)
   19338:	00912223          	sw	s1,4(sp)
   1933c:	01212023          	sw	s2,0(sp)
   19340:	00112623          	sw	ra,12(sp)
   19344:	00058413          	mv	s0,a1
   19348:	00060493          	mv	s1,a2
   1934c:	40f70933          	sub	s2,a4,a5
   19350:	04f71063          	bne	a4,a5,19390 <__mdiff+0x68>
   19354:	00279693          	slli	a3,a5,0x2
   19358:	01458613          	addi	a2,a1,20
   1935c:	01448713          	addi	a4,s1,20
   19360:	00d607b3          	add	a5,a2,a3
   19364:	00d70733          	add	a4,a4,a3
   19368:	0080006f          	j	19370 <__mdiff+0x48>
   1936c:	18f67463          	bgeu	a2,a5,194f4 <__mdiff+0x1cc>
   19370:	ffc7a803          	lw	a6,-4(a5)
   19374:	ffc72683          	lw	a3,-4(a4)
   19378:	ffc78793          	addi	a5,a5,-4
   1937c:	ffc70713          	addi	a4,a4,-4
   19380:	fed806e3          	beq	a6,a3,1936c <__mdiff+0x44>
   19384:	1ad87063          	bgeu	a6,a3,19524 <__mdiff+0x1fc>
   19388:	00100913          	li	s2,1
   1938c:	0140006f          	j	193a0 <__mdiff+0x78>
   19390:	fe094ce3          	bltz	s2,19388 <__mdiff+0x60>
   19394:	00000913          	li	s2,0
   19398:	00058493          	mv	s1,a1
   1939c:	00060413          	mv	s0,a2
   193a0:	0044a583          	lw	a1,4(s1)
   193a4:	bb0ff0ef          	jal	18754 <_Balloc>
   193a8:	1a050463          	beqz	a0,19550 <__mdiff+0x228>
   193ac:	0104a803          	lw	a6,16(s1)
   193b0:	01042f03          	lw	t5,16(s0)
   193b4:	01448493          	addi	s1,s1,20
   193b8:	00281713          	slli	a4,a6,0x2
   193bc:	002f1f13          	slli	t5,t5,0x2
   193c0:	01440613          	addi	a2,s0,20
   193c4:	01450f93          	addi	t6,a0,20
   193c8:	01252623          	sw	s2,12(a0)
   193cc:	00e48333          	add	t1,s1,a4
   193d0:	01e60f33          	add	t5,a2,t5
   193d4:	00048e93          	mv	t4,s1
   193d8:	000f8e13          	mv	t3,t6
   193dc:	00000893          	li	a7,0
   193e0:	000ea703          	lw	a4,0(t4)
   193e4:	00062683          	lw	a3,0(a2)
   193e8:	004e0e13          	addi	t3,t3,4
   193ec:	01071793          	slli	a5,a4,0x10
   193f0:	01069593          	slli	a1,a3,0x10
   193f4:	0107d793          	srli	a5,a5,0x10
   193f8:	0105d593          	srli	a1,a1,0x10
   193fc:	40b787b3          	sub	a5,a5,a1
   19400:	011787b3          	add	a5,a5,a7
   19404:	0106d693          	srli	a3,a3,0x10
   19408:	01075713          	srli	a4,a4,0x10
   1940c:	40d70733          	sub	a4,a4,a3
   19410:	4107d693          	srai	a3,a5,0x10
   19414:	00d70733          	add	a4,a4,a3
   19418:	01079793          	slli	a5,a5,0x10
   1941c:	0107d793          	srli	a5,a5,0x10
   19420:	01071693          	slli	a3,a4,0x10
   19424:	00d7e7b3          	or	a5,a5,a3
   19428:	00460613          	addi	a2,a2,4
   1942c:	fefe2e23          	sw	a5,-4(t3)
   19430:	004e8e93          	addi	t4,t4,4
   19434:	41075893          	srai	a7,a4,0x10
   19438:	fbe664e3          	bltu	a2,t5,193e0 <__mdiff+0xb8>
   1943c:	01540693          	addi	a3,s0,21
   19440:	00000713          	li	a4,0
   19444:	00df6863          	bltu	t5,a3,19454 <__mdiff+0x12c>
   19448:	408f0f33          	sub	t5,t5,s0
   1944c:	febf0f13          	addi	t5,t5,-21
   19450:	ffcf7713          	andi	a4,t5,-4
   19454:	00e48eb3          	add	t4,s1,a4
   19458:	004e8e93          	addi	t4,t4,4
   1945c:	01f70733          	add	a4,a4,t6
   19460:	409f8e33          	sub	t3,t6,s1
   19464:	000e8613          	mv	a2,t4
   19468:	00470f13          	addi	t5,a4,4
   1946c:	046efc63          	bgeu	t4,t1,194c4 <__mdiff+0x19c>
   19470:	00062683          	lw	a3,0(a2)
   19474:	01c605b3          	add	a1,a2,t3
   19478:	00460613          	addi	a2,a2,4
   1947c:	01069713          	slli	a4,a3,0x10
   19480:	01075713          	srli	a4,a4,0x10
   19484:	01170733          	add	a4,a4,a7
   19488:	011687b3          	add	a5,a3,a7
   1948c:	41075713          	srai	a4,a4,0x10
   19490:	0106d693          	srli	a3,a3,0x10
   19494:	00d70733          	add	a4,a4,a3
   19498:	01079793          	slli	a5,a5,0x10
   1949c:	0107d793          	srli	a5,a5,0x10
   194a0:	01071693          	slli	a3,a4,0x10
   194a4:	00d7e7b3          	or	a5,a5,a3
   194a8:	00f5a023          	sw	a5,0(a1)
   194ac:	41075893          	srai	a7,a4,0x10
   194b0:	fc6660e3          	bltu	a2,t1,19470 <__mdiff+0x148>
   194b4:	fff30713          	addi	a4,t1,-1
   194b8:	41d70733          	sub	a4,a4,t4
   194bc:	ffc77713          	andi	a4,a4,-4
   194c0:	01e70733          	add	a4,a4,t5
   194c4:	00079a63          	bnez	a5,194d8 <__mdiff+0x1b0>
   194c8:	ffc72783          	lw	a5,-4(a4)
   194cc:	ffc70713          	addi	a4,a4,-4
   194d0:	fff80813          	addi	a6,a6,-1
   194d4:	fe078ae3          	beqz	a5,194c8 <__mdiff+0x1a0>
   194d8:	00c12083          	lw	ra,12(sp)
   194dc:	00812403          	lw	s0,8(sp)
   194e0:	01052823          	sw	a6,16(a0)
   194e4:	00412483          	lw	s1,4(sp)
   194e8:	00012903          	lw	s2,0(sp)
   194ec:	01010113          	addi	sp,sp,16
   194f0:	00008067          	ret
   194f4:	00000593          	li	a1,0
   194f8:	a5cff0ef          	jal	18754 <_Balloc>
   194fc:	02050c63          	beqz	a0,19534 <__mdiff+0x20c>
   19500:	00c12083          	lw	ra,12(sp)
   19504:	00812403          	lw	s0,8(sp)
   19508:	00100793          	li	a5,1
   1950c:	00052a23          	sw	zero,20(a0)
   19510:	00f52823          	sw	a5,16(a0)
   19514:	00412483          	lw	s1,4(sp)
   19518:	00012903          	lw	s2,0(sp)
   1951c:	01010113          	addi	sp,sp,16
   19520:	00008067          	ret
   19524:	00048793          	mv	a5,s1
   19528:	00040493          	mv	s1,s0
   1952c:	00078413          	mv	s0,a5
   19530:	e71ff06f          	j	193a0 <__mdiff+0x78>
   19534:	000226b7          	lui	a3,0x22
   19538:	00022537          	lui	a0,0x22
   1953c:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   19540:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   19544:	00000613          	li	a2,0
   19548:	23700593          	li	a1,567
   1954c:	08c010ef          	jal	1a5d8 <__assert_func>
   19550:	000226b7          	lui	a3,0x22
   19554:	00022537          	lui	a0,0x22
   19558:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   1955c:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   19560:	00000613          	li	a2,0
   19564:	24500593          	li	a1,581
   19568:	070010ef          	jal	1a5d8 <__assert_func>

0001956c <__ulp>:
   1956c:	7ff007b7          	lui	a5,0x7ff00
   19570:	00b7f5b3          	and	a1,a5,a1
   19574:	fcc007b7          	lui	a5,0xfcc00
   19578:	00f585b3          	add	a1,a1,a5
   1957c:	00000793          	li	a5,0
   19580:	00b05663          	blez	a1,1958c <__ulp+0x20>
   19584:	00078513          	mv	a0,a5
   19588:	00008067          	ret
   1958c:	40b005b3          	neg	a1,a1
   19590:	4145d593          	srai	a1,a1,0x14
   19594:	01300793          	li	a5,19
   19598:	00b7cc63          	blt	a5,a1,195b0 <__ulp+0x44>
   1959c:	000807b7          	lui	a5,0x80
   195a0:	40b7d5b3          	sra	a1,a5,a1
   195a4:	00000793          	li	a5,0
   195a8:	00078513          	mv	a0,a5
   195ac:	00008067          	ret
   195b0:	fec58593          	addi	a1,a1,-20
   195b4:	01e00713          	li	a4,30
   195b8:	00100793          	li	a5,1
   195bc:	00b74663          	blt	a4,a1,195c8 <__ulp+0x5c>
   195c0:	800007b7          	lui	a5,0x80000
   195c4:	00b7d7b3          	srl	a5,a5,a1
   195c8:	00000593          	li	a1,0
   195cc:	00078513          	mv	a0,a5
   195d0:	00008067          	ret

000195d4 <__b2d>:
   195d4:	fe010113          	addi	sp,sp,-32
   195d8:	00912a23          	sw	s1,20(sp)
   195dc:	01052483          	lw	s1,16(a0)
   195e0:	00812c23          	sw	s0,24(sp)
   195e4:	01450413          	addi	s0,a0,20
   195e8:	00249493          	slli	s1,s1,0x2
   195ec:	009404b3          	add	s1,s0,s1
   195f0:	01412423          	sw	s4,8(sp)
   195f4:	ffc4aa03          	lw	s4,-4(s1)
   195f8:	01512223          	sw	s5,4(sp)
   195fc:	01612023          	sw	s6,0(sp)
   19600:	000a0513          	mv	a0,s4
   19604:	00058a93          	mv	s5,a1
   19608:	00112e23          	sw	ra,28(sp)
   1960c:	01212823          	sw	s2,16(sp)
   19610:	01312623          	sw	s3,12(sp)
   19614:	cbcff0ef          	jal	18ad0 <__hi0bits>
   19618:	02000713          	li	a4,32
   1961c:	40a707b3          	sub	a5,a4,a0
   19620:	00faa023          	sw	a5,0(s5)
   19624:	00a00793          	li	a5,10
   19628:	ffc48b13          	addi	s6,s1,-4
   1962c:	0aa7d063          	bge	a5,a0,196cc <__b2d+0xf8>
   19630:	ff550613          	addi	a2,a0,-11
   19634:	05647063          	bgeu	s0,s6,19674 <__b2d+0xa0>
   19638:	ff84a783          	lw	a5,-8(s1)
   1963c:	04060c63          	beqz	a2,19694 <__b2d+0xc0>
   19640:	40c706b3          	sub	a3,a4,a2
   19644:	00d7d733          	srl	a4,a5,a3
   19648:	00ca1a33          	sll	s4,s4,a2
   1964c:	00ea6a33          	or	s4,s4,a4
   19650:	ff848593          	addi	a1,s1,-8
   19654:	3ff00737          	lui	a4,0x3ff00
   19658:	00c797b3          	sll	a5,a5,a2
   1965c:	00ea6733          	or	a4,s4,a4
   19660:	02b47e63          	bgeu	s0,a1,1969c <__b2d+0xc8>
   19664:	ff44a603          	lw	a2,-12(s1)
   19668:	00d656b3          	srl	a3,a2,a3
   1966c:	00d7e7b3          	or	a5,a5,a3
   19670:	02c0006f          	j	1969c <__b2d+0xc8>
   19674:	00b00793          	li	a5,11
   19678:	00f50c63          	beq	a0,a5,19690 <__b2d+0xbc>
   1967c:	00ca1a33          	sll	s4,s4,a2
   19680:	3ff00737          	lui	a4,0x3ff00
   19684:	00ea6733          	or	a4,s4,a4
   19688:	00000793          	li	a5,0
   1968c:	0100006f          	j	1969c <__b2d+0xc8>
   19690:	00000793          	li	a5,0
   19694:	3ff00737          	lui	a4,0x3ff00
   19698:	00ea6733          	or	a4,s4,a4
   1969c:	01c12083          	lw	ra,28(sp)
   196a0:	01812403          	lw	s0,24(sp)
   196a4:	01412483          	lw	s1,20(sp)
   196a8:	01012903          	lw	s2,16(sp)
   196ac:	00c12983          	lw	s3,12(sp)
   196b0:	00812a03          	lw	s4,8(sp)
   196b4:	00412a83          	lw	s5,4(sp)
   196b8:	00012b03          	lw	s6,0(sp)
   196bc:	00078513          	mv	a0,a5
   196c0:	00070593          	mv	a1,a4
   196c4:	02010113          	addi	sp,sp,32
   196c8:	00008067          	ret
   196cc:	00b00693          	li	a3,11
   196d0:	40a686b3          	sub	a3,a3,a0
   196d4:	3ff007b7          	lui	a5,0x3ff00
   196d8:	00da5733          	srl	a4,s4,a3
   196dc:	00f76733          	or	a4,a4,a5
   196e0:	00000793          	li	a5,0
   196e4:	01647663          	bgeu	s0,s6,196f0 <__b2d+0x11c>
   196e8:	ff84a783          	lw	a5,-8(s1)
   196ec:	00d7d7b3          	srl	a5,a5,a3
   196f0:	01550513          	addi	a0,a0,21
   196f4:	00aa1a33          	sll	s4,s4,a0
   196f8:	00fa67b3          	or	a5,s4,a5
   196fc:	fa1ff06f          	j	1969c <__b2d+0xc8>

00019700 <__d2b>:
   19700:	fd010113          	addi	sp,sp,-48
   19704:	01512a23          	sw	s5,20(sp)
   19708:	00058a93          	mv	s5,a1
   1970c:	00100593          	li	a1,1
   19710:	02912223          	sw	s1,36(sp)
   19714:	01312e23          	sw	s3,28(sp)
   19718:	01412c23          	sw	s4,24(sp)
   1971c:	02112623          	sw	ra,44(sp)
   19720:	02812423          	sw	s0,40(sp)
   19724:	03212023          	sw	s2,32(sp)
   19728:	00060493          	mv	s1,a2
   1972c:	00068a13          	mv	s4,a3
   19730:	00070993          	mv	s3,a4
   19734:	820ff0ef          	jal	18754 <_Balloc>
   19738:	0e050e63          	beqz	a0,19834 <__d2b+0x134>
   1973c:	00100737          	lui	a4,0x100
   19740:	0144d913          	srli	s2,s1,0x14
   19744:	fff70793          	addi	a5,a4,-1 # fffff <__BSS_END__+0xdc5ab>
   19748:	7ff97913          	andi	s2,s2,2047
   1974c:	00050413          	mv	s0,a0
   19750:	0097f7b3          	and	a5,a5,s1
   19754:	00090463          	beqz	s2,1975c <__d2b+0x5c>
   19758:	00e7e7b3          	or	a5,a5,a4
   1975c:	00f12623          	sw	a5,12(sp)
   19760:	060a9263          	bnez	s5,197c4 <__d2b+0xc4>
   19764:	00c10513          	addi	a0,sp,12
   19768:	bf4ff0ef          	jal	18b5c <__lo0bits>
   1976c:	00c12703          	lw	a4,12(sp)
   19770:	00100493          	li	s1,1
   19774:	00942823          	sw	s1,16(s0)
   19778:	00e42a23          	sw	a4,20(s0)
   1977c:	02050793          	addi	a5,a0,32
   19780:	08090863          	beqz	s2,19810 <__d2b+0x110>
   19784:	bcd90913          	addi	s2,s2,-1075
   19788:	00f90933          	add	s2,s2,a5
   1978c:	03500493          	li	s1,53
   19790:	012a2023          	sw	s2,0(s4)
   19794:	40f48533          	sub	a0,s1,a5
   19798:	00a9a023          	sw	a0,0(s3)
   1979c:	02c12083          	lw	ra,44(sp)
   197a0:	00040513          	mv	a0,s0
   197a4:	02812403          	lw	s0,40(sp)
   197a8:	02412483          	lw	s1,36(sp)
   197ac:	02012903          	lw	s2,32(sp)
   197b0:	01c12983          	lw	s3,28(sp)
   197b4:	01812a03          	lw	s4,24(sp)
   197b8:	01412a83          	lw	s5,20(sp)
   197bc:	03010113          	addi	sp,sp,48
   197c0:	00008067          	ret
   197c4:	00810513          	addi	a0,sp,8
   197c8:	01512423          	sw	s5,8(sp)
   197cc:	b90ff0ef          	jal	18b5c <__lo0bits>
   197d0:	00c12703          	lw	a4,12(sp)
   197d4:	00812683          	lw	a3,8(sp)
   197d8:	00050793          	mv	a5,a0
   197dc:	00050e63          	beqz	a0,197f8 <__d2b+0xf8>
   197e0:	02000613          	li	a2,32
   197e4:	40a60633          	sub	a2,a2,a0
   197e8:	00c71633          	sll	a2,a4,a2
   197ec:	00a75733          	srl	a4,a4,a0
   197f0:	00c6e6b3          	or	a3,a3,a2
   197f4:	00e12623          	sw	a4,12(sp)
   197f8:	00e034b3          	snez	s1,a4
   197fc:	00148493          	addi	s1,s1,1
   19800:	00d42a23          	sw	a3,20(s0)
   19804:	00e42c23          	sw	a4,24(s0)
   19808:	00942823          	sw	s1,16(s0)
   1980c:	f6091ce3          	bnez	s2,19784 <__d2b+0x84>
   19810:	00249713          	slli	a4,s1,0x2
   19814:	00e40733          	add	a4,s0,a4
   19818:	01072503          	lw	a0,16(a4)
   1981c:	bce78793          	addi	a5,a5,-1074 # 3feffbce <__BSS_END__+0x3fedc17a>
   19820:	00fa2023          	sw	a5,0(s4)
   19824:	aacff0ef          	jal	18ad0 <__hi0bits>
   19828:	00549493          	slli	s1,s1,0x5
   1982c:	40a48533          	sub	a0,s1,a0
   19830:	f69ff06f          	j	19798 <__d2b+0x98>
   19834:	000226b7          	lui	a3,0x22
   19838:	00022537          	lui	a0,0x22
   1983c:	48c68693          	addi	a3,a3,1164 # 2248c <__clzsi2+0xec>
   19840:	4f450513          	addi	a0,a0,1268 # 224f4 <__clzsi2+0x154>
   19844:	00000613          	li	a2,0
   19848:	30f00593          	li	a1,783
   1984c:	58d000ef          	jal	1a5d8 <__assert_func>

00019850 <__ratio>:
   19850:	fc010113          	addi	sp,sp,-64
   19854:	03612023          	sw	s6,32(sp)
   19858:	00058b13          	mv	s6,a1
   1985c:	00810593          	addi	a1,sp,8
   19860:	02112e23          	sw	ra,60(sp)
   19864:	02812c23          	sw	s0,56(sp)
   19868:	02912a23          	sw	s1,52(sp)
   1986c:	01712e23          	sw	s7,28(sp)
   19870:	03212823          	sw	s2,48(sp)
   19874:	00050b93          	mv	s7,a0
   19878:	03312623          	sw	s3,44(sp)
   1987c:	03412423          	sw	s4,40(sp)
   19880:	03512223          	sw	s5,36(sp)
   19884:	d51ff0ef          	jal	195d4 <__b2d>
   19888:	00050493          	mv	s1,a0
   1988c:	00058413          	mv	s0,a1
   19890:	000b0513          	mv	a0,s6
   19894:	00c10593          	addi	a1,sp,12
   19898:	d3dff0ef          	jal	195d4 <__b2d>
   1989c:	010ba783          	lw	a5,16(s7)
   198a0:	010b2603          	lw	a2,16(s6)
   198a4:	00812703          	lw	a4,8(sp)
   198a8:	00c12683          	lw	a3,12(sp)
   198ac:	40c787b3          	sub	a5,a5,a2
   198b0:	00579793          	slli	a5,a5,0x5
   198b4:	40d70733          	sub	a4,a4,a3
   198b8:	00e787b3          	add	a5,a5,a4
   198bc:	04f05663          	blez	a5,19908 <__ratio+0xb8>
   198c0:	01479793          	slli	a5,a5,0x14
   198c4:	00878433          	add	s0,a5,s0
   198c8:	00050613          	mv	a2,a0
   198cc:	00058693          	mv	a3,a1
   198d0:	00048513          	mv	a0,s1
   198d4:	00040593          	mv	a1,s0
   198d8:	118040ef          	jal	1d9f0 <__divdf3>
   198dc:	03c12083          	lw	ra,60(sp)
   198e0:	03812403          	lw	s0,56(sp)
   198e4:	03412483          	lw	s1,52(sp)
   198e8:	03012903          	lw	s2,48(sp)
   198ec:	02c12983          	lw	s3,44(sp)
   198f0:	02812a03          	lw	s4,40(sp)
   198f4:	02412a83          	lw	s5,36(sp)
   198f8:	02012b03          	lw	s6,32(sp)
   198fc:	01c12b83          	lw	s7,28(sp)
   19900:	04010113          	addi	sp,sp,64
   19904:	00008067          	ret
   19908:	01479793          	slli	a5,a5,0x14
   1990c:	40f585b3          	sub	a1,a1,a5
   19910:	fb9ff06f          	j	198c8 <__ratio+0x78>

00019914 <_mprec_log10>:
   19914:	fe010113          	addi	sp,sp,-32
   19918:	01412423          	sw	s4,8(sp)
   1991c:	00112e23          	sw	ra,28(sp)
   19920:	01212823          	sw	s2,16(sp)
   19924:	01312623          	sw	s3,12(sp)
   19928:	01700793          	li	a5,23
   1992c:	00050a13          	mv	s4,a0
   19930:	06a7d063          	bge	a5,a0,19990 <_mprec_log10+0x7c>
   19934:	00812c23          	sw	s0,24(sp)
   19938:	00912a23          	sw	s1,20(sp)
   1993c:	ed81a503          	lw	a0,-296(gp) # 236e8 <__SDATA_BEGIN__+0x30>
   19940:	edc1a583          	lw	a1,-292(gp) # 236ec <__SDATA_BEGIN__+0x34>
   19944:	ee01a403          	lw	s0,-288(gp) # 236f0 <__SDATA_BEGIN__+0x38>
   19948:	ee41a483          	lw	s1,-284(gp) # 236f4 <__SDATA_BEGIN__+0x3c>
   1994c:	01612223          	sw	s6,4(sp)
   19950:	01712023          	sw	s7,0(sp)
   19954:	00040613          	mv	a2,s0
   19958:	00048693          	mv	a3,s1
   1995c:	fffa0a13          	addi	s4,s4,-1
   19960:	281040ef          	jal	1e3e0 <__muldf3>
   19964:	fe0a18e3          	bnez	s4,19954 <_mprec_log10+0x40>
   19968:	01812403          	lw	s0,24(sp)
   1996c:	01c12083          	lw	ra,28(sp)
   19970:	01412483          	lw	s1,20(sp)
   19974:	00412b03          	lw	s6,4(sp)
   19978:	00012b83          	lw	s7,0(sp)
   1997c:	01012903          	lw	s2,16(sp)
   19980:	00c12983          	lw	s3,12(sp)
   19984:	00812a03          	lw	s4,8(sp)
   19988:	02010113          	addi	sp,sp,32
   1998c:	00008067          	ret
   19990:	01c12083          	lw	ra,28(sp)
   19994:	000237b7          	lui	a5,0x23
   19998:	00351a13          	slli	s4,a0,0x3
   1999c:	82878793          	addi	a5,a5,-2008 # 22828 <__mprec_tens>
   199a0:	014787b3          	add	a5,a5,s4
   199a4:	0007a503          	lw	a0,0(a5)
   199a8:	0047a583          	lw	a1,4(a5)
   199ac:	01012903          	lw	s2,16(sp)
   199b0:	00c12983          	lw	s3,12(sp)
   199b4:	00812a03          	lw	s4,8(sp)
   199b8:	02010113          	addi	sp,sp,32
   199bc:	00008067          	ret

000199c0 <__copybits>:
   199c0:	01062683          	lw	a3,16(a2)
   199c4:	fff58593          	addi	a1,a1,-1
   199c8:	4055d593          	srai	a1,a1,0x5
   199cc:	00158593          	addi	a1,a1,1
   199d0:	00269693          	slli	a3,a3,0x2
   199d4:	01460793          	addi	a5,a2,20
   199d8:	00259593          	slli	a1,a1,0x2
   199dc:	00d786b3          	add	a3,a5,a3
   199e0:	00b505b3          	add	a1,a0,a1
   199e4:	02d7f863          	bgeu	a5,a3,19a14 <__copybits+0x54>
   199e8:	00050713          	mv	a4,a0
   199ec:	0007a803          	lw	a6,0(a5)
   199f0:	00478793          	addi	a5,a5,4
   199f4:	00470713          	addi	a4,a4,4
   199f8:	ff072e23          	sw	a6,-4(a4)
   199fc:	fed7e8e3          	bltu	a5,a3,199ec <__copybits+0x2c>
   19a00:	40c686b3          	sub	a3,a3,a2
   19a04:	feb68693          	addi	a3,a3,-21
   19a08:	ffc6f693          	andi	a3,a3,-4
   19a0c:	00450513          	addi	a0,a0,4
   19a10:	00a68533          	add	a0,a3,a0
   19a14:	00b57863          	bgeu	a0,a1,19a24 <__copybits+0x64>
   19a18:	00450513          	addi	a0,a0,4
   19a1c:	fe052e23          	sw	zero,-4(a0)
   19a20:	feb56ce3          	bltu	a0,a1,19a18 <__copybits+0x58>
   19a24:	00008067          	ret

00019a28 <__any_on>:
   19a28:	01052703          	lw	a4,16(a0)
   19a2c:	4055d613          	srai	a2,a1,0x5
   19a30:	01450693          	addi	a3,a0,20
   19a34:	02c75263          	bge	a4,a2,19a58 <__any_on+0x30>
   19a38:	00271713          	slli	a4,a4,0x2
   19a3c:	00e687b3          	add	a5,a3,a4
   19a40:	04f6f263          	bgeu	a3,a5,19a84 <__any_on+0x5c>
   19a44:	ffc7a703          	lw	a4,-4(a5)
   19a48:	ffc78793          	addi	a5,a5,-4
   19a4c:	fe070ae3          	beqz	a4,19a40 <__any_on+0x18>
   19a50:	00100513          	li	a0,1
   19a54:	00008067          	ret
   19a58:	00261793          	slli	a5,a2,0x2
   19a5c:	00f687b3          	add	a5,a3,a5
   19a60:	fee650e3          	bge	a2,a4,19a40 <__any_on+0x18>
   19a64:	01f5f593          	andi	a1,a1,31
   19a68:	fc058ce3          	beqz	a1,19a40 <__any_on+0x18>
   19a6c:	0007a603          	lw	a2,0(a5)
   19a70:	00100513          	li	a0,1
   19a74:	00b65733          	srl	a4,a2,a1
   19a78:	00b71733          	sll	a4,a4,a1
   19a7c:	fce602e3          	beq	a2,a4,19a40 <__any_on+0x18>
   19a80:	00008067          	ret
   19a84:	00000513          	li	a0,0
   19a88:	00008067          	ret

00019a8c <_realloc_r>:
   19a8c:	fd010113          	addi	sp,sp,-48
   19a90:	02912223          	sw	s1,36(sp)
   19a94:	02112623          	sw	ra,44(sp)
   19a98:	00060493          	mv	s1,a2
   19a9c:	1e058863          	beqz	a1,19c8c <_realloc_r+0x200>
   19aa0:	02812423          	sw	s0,40(sp)
   19aa4:	03212023          	sw	s2,32(sp)
   19aa8:	00058413          	mv	s0,a1
   19aac:	01312e23          	sw	s3,28(sp)
   19ab0:	01512a23          	sw	s5,20(sp)
   19ab4:	01412c23          	sw	s4,24(sp)
   19ab8:	00050913          	mv	s2,a0
   19abc:	ef5f70ef          	jal	119b0 <__malloc_lock>
   19ac0:	ffc42703          	lw	a4,-4(s0)
   19ac4:	00b48793          	addi	a5,s1,11
   19ac8:	01600693          	li	a3,22
   19acc:	ffc77993          	andi	s3,a4,-4
   19ad0:	ff840a93          	addi	s5,s0,-8
   19ad4:	10f6f263          	bgeu	a3,a5,19bd8 <_realloc_r+0x14c>
   19ad8:	ff87fa13          	andi	s4,a5,-8
   19adc:	1007c263          	bltz	a5,19be0 <_realloc_r+0x154>
   19ae0:	109a6063          	bltu	s4,s1,19be0 <_realloc_r+0x154>
   19ae4:	1349d263          	bge	s3,s4,19c08 <_realloc_r+0x17c>
   19ae8:	000237b7          	lui	a5,0x23
   19aec:	01812423          	sw	s8,8(sp)
   19af0:	14078c13          	addi	s8,a5,320 # 23140 <__malloc_av_>
   19af4:	008c2603          	lw	a2,8(s8)
   19af8:	013a86b3          	add	a3,s5,s3
   19afc:	0046a783          	lw	a5,4(a3)
   19b00:	1cd60863          	beq	a2,a3,19cd0 <_realloc_r+0x244>
   19b04:	ffe7f613          	andi	a2,a5,-2
   19b08:	00c68633          	add	a2,a3,a2
   19b0c:	00462603          	lw	a2,4(a2)
   19b10:	00167613          	andi	a2,a2,1
   19b14:	14061a63          	bnez	a2,19c68 <_realloc_r+0x1dc>
   19b18:	ffc7f793          	andi	a5,a5,-4
   19b1c:	00f98633          	add	a2,s3,a5
   19b20:	0d465863          	bge	a2,s4,19bf0 <_realloc_r+0x164>
   19b24:	00177713          	andi	a4,a4,1
   19b28:	02071c63          	bnez	a4,19b60 <_realloc_r+0xd4>
   19b2c:	01712623          	sw	s7,12(sp)
   19b30:	ff842b83          	lw	s7,-8(s0)
   19b34:	01612823          	sw	s6,16(sp)
   19b38:	417a8bb3          	sub	s7,s5,s7
   19b3c:	004ba703          	lw	a4,4(s7)
   19b40:	ffc77713          	andi	a4,a4,-4
   19b44:	00e787b3          	add	a5,a5,a4
   19b48:	01378b33          	add	s6,a5,s3
   19b4c:	334b5263          	bge	s6,s4,19e70 <_realloc_r+0x3e4>
   19b50:	00e98b33          	add	s6,s3,a4
   19b54:	294b5863          	bge	s6,s4,19de4 <_realloc_r+0x358>
   19b58:	01012b03          	lw	s6,16(sp)
   19b5c:	00c12b83          	lw	s7,12(sp)
   19b60:	00048593          	mv	a1,s1
   19b64:	00090513          	mv	a0,s2
   19b68:	e40f70ef          	jal	111a8 <_malloc_r>
   19b6c:	00050493          	mv	s1,a0
   19b70:	40050063          	beqz	a0,19f70 <_realloc_r+0x4e4>
   19b74:	ffc42783          	lw	a5,-4(s0)
   19b78:	ff850713          	addi	a4,a0,-8
   19b7c:	ffe7f793          	andi	a5,a5,-2
   19b80:	00fa87b3          	add	a5,s5,a5
   19b84:	24e78663          	beq	a5,a4,19dd0 <_realloc_r+0x344>
   19b88:	ffc98613          	addi	a2,s3,-4
   19b8c:	02400793          	li	a5,36
   19b90:	2cc7ea63          	bltu	a5,a2,19e64 <_realloc_r+0x3d8>
   19b94:	01300713          	li	a4,19
   19b98:	20c76a63          	bltu	a4,a2,19dac <_realloc_r+0x320>
   19b9c:	00050793          	mv	a5,a0
   19ba0:	00040713          	mv	a4,s0
   19ba4:	00072683          	lw	a3,0(a4)
   19ba8:	00d7a023          	sw	a3,0(a5)
   19bac:	00472683          	lw	a3,4(a4)
   19bb0:	00d7a223          	sw	a3,4(a5)
   19bb4:	00872703          	lw	a4,8(a4)
   19bb8:	00e7a423          	sw	a4,8(a5)
   19bbc:	00040593          	mv	a1,s0
   19bc0:	00090513          	mv	a0,s2
   19bc4:	af4f70ef          	jal	10eb8 <_free_r>
   19bc8:	00090513          	mv	a0,s2
   19bcc:	de9f70ef          	jal	119b4 <__malloc_unlock>
   19bd0:	00812c03          	lw	s8,8(sp)
   19bd4:	06c0006f          	j	19c40 <_realloc_r+0x1b4>
   19bd8:	01000a13          	li	s4,16
   19bdc:	f09a74e3          	bgeu	s4,s1,19ae4 <_realloc_r+0x58>
   19be0:	00c00793          	li	a5,12
   19be4:	00f92023          	sw	a5,0(s2)
   19be8:	00000493          	li	s1,0
   19bec:	0540006f          	j	19c40 <_realloc_r+0x1b4>
   19bf0:	00c6a783          	lw	a5,12(a3)
   19bf4:	0086a703          	lw	a4,8(a3)
   19bf8:	00812c03          	lw	s8,8(sp)
   19bfc:	00060993          	mv	s3,a2
   19c00:	00f72623          	sw	a5,12(a4)
   19c04:	00e7a423          	sw	a4,8(a5)
   19c08:	004aa783          	lw	a5,4(s5)
   19c0c:	414986b3          	sub	a3,s3,s4
   19c10:	00f00613          	li	a2,15
   19c14:	0017f793          	andi	a5,a5,1
   19c18:	013a8733          	add	a4,s5,s3
   19c1c:	08d66263          	bltu	a2,a3,19ca0 <_realloc_r+0x214>
   19c20:	0137e7b3          	or	a5,a5,s3
   19c24:	00faa223          	sw	a5,4(s5)
   19c28:	00472783          	lw	a5,4(a4)
   19c2c:	0017e793          	ori	a5,a5,1
   19c30:	00f72223          	sw	a5,4(a4)
   19c34:	00090513          	mv	a0,s2
   19c38:	d7df70ef          	jal	119b4 <__malloc_unlock>
   19c3c:	00040493          	mv	s1,s0
   19c40:	02812403          	lw	s0,40(sp)
   19c44:	02c12083          	lw	ra,44(sp)
   19c48:	02012903          	lw	s2,32(sp)
   19c4c:	01c12983          	lw	s3,28(sp)
   19c50:	01812a03          	lw	s4,24(sp)
   19c54:	01412a83          	lw	s5,20(sp)
   19c58:	00048513          	mv	a0,s1
   19c5c:	02412483          	lw	s1,36(sp)
   19c60:	03010113          	addi	sp,sp,48
   19c64:	00008067          	ret
   19c68:	00177713          	andi	a4,a4,1
   19c6c:	ee071ae3          	bnez	a4,19b60 <_realloc_r+0xd4>
   19c70:	01712623          	sw	s7,12(sp)
   19c74:	ff842b83          	lw	s7,-8(s0)
   19c78:	01612823          	sw	s6,16(sp)
   19c7c:	417a8bb3          	sub	s7,s5,s7
   19c80:	004ba703          	lw	a4,4(s7)
   19c84:	ffc77713          	andi	a4,a4,-4
   19c88:	ec9ff06f          	j	19b50 <_realloc_r+0xc4>
   19c8c:	02c12083          	lw	ra,44(sp)
   19c90:	02412483          	lw	s1,36(sp)
   19c94:	00060593          	mv	a1,a2
   19c98:	03010113          	addi	sp,sp,48
   19c9c:	d0cf706f          	j	111a8 <_malloc_r>
   19ca0:	0147e7b3          	or	a5,a5,s4
   19ca4:	00faa223          	sw	a5,4(s5)
   19ca8:	014a85b3          	add	a1,s5,s4
   19cac:	0016e693          	ori	a3,a3,1
   19cb0:	00d5a223          	sw	a3,4(a1)
   19cb4:	00472783          	lw	a5,4(a4)
   19cb8:	00858593          	addi	a1,a1,8
   19cbc:	00090513          	mv	a0,s2
   19cc0:	0017e793          	ori	a5,a5,1
   19cc4:	00f72223          	sw	a5,4(a4)
   19cc8:	9f0f70ef          	jal	10eb8 <_free_r>
   19ccc:	f69ff06f          	j	19c34 <_realloc_r+0x1a8>
   19cd0:	ffc7f793          	andi	a5,a5,-4
   19cd4:	013786b3          	add	a3,a5,s3
   19cd8:	010a0613          	addi	a2,s4,16
   19cdc:	22c6de63          	bge	a3,a2,19f18 <_realloc_r+0x48c>
   19ce0:	00177713          	andi	a4,a4,1
   19ce4:	e6071ee3          	bnez	a4,19b60 <_realloc_r+0xd4>
   19ce8:	01712623          	sw	s7,12(sp)
   19cec:	ff842b83          	lw	s7,-8(s0)
   19cf0:	01612823          	sw	s6,16(sp)
   19cf4:	417a8bb3          	sub	s7,s5,s7
   19cf8:	004ba703          	lw	a4,4(s7)
   19cfc:	ffc77713          	andi	a4,a4,-4
   19d00:	00e787b3          	add	a5,a5,a4
   19d04:	01378b33          	add	s6,a5,s3
   19d08:	e4cb44e3          	blt	s6,a2,19b50 <_realloc_r+0xc4>
   19d0c:	00cba783          	lw	a5,12(s7)
   19d10:	008ba703          	lw	a4,8(s7)
   19d14:	ffc98613          	addi	a2,s3,-4
   19d18:	02400693          	li	a3,36
   19d1c:	00f72623          	sw	a5,12(a4)
   19d20:	00e7a423          	sw	a4,8(a5)
   19d24:	008b8493          	addi	s1,s7,8
   19d28:	28c6ee63          	bltu	a3,a2,19fc4 <_realloc_r+0x538>
   19d2c:	01300713          	li	a4,19
   19d30:	00048793          	mv	a5,s1
   19d34:	02c77263          	bgeu	a4,a2,19d58 <_realloc_r+0x2cc>
   19d38:	00042703          	lw	a4,0(s0)
   19d3c:	01b00793          	li	a5,27
   19d40:	00eba423          	sw	a4,8(s7)
   19d44:	00442703          	lw	a4,4(s0)
   19d48:	00eba623          	sw	a4,12(s7)
   19d4c:	2ac7e263          	bltu	a5,a2,19ff0 <_realloc_r+0x564>
   19d50:	00840413          	addi	s0,s0,8
   19d54:	010b8793          	addi	a5,s7,16
   19d58:	00042703          	lw	a4,0(s0)
   19d5c:	00e7a023          	sw	a4,0(a5)
   19d60:	00442703          	lw	a4,4(s0)
   19d64:	00e7a223          	sw	a4,4(a5)
   19d68:	00842703          	lw	a4,8(s0)
   19d6c:	00e7a423          	sw	a4,8(a5)
   19d70:	014b87b3          	add	a5,s7,s4
   19d74:	414b0733          	sub	a4,s6,s4
   19d78:	00fc2423          	sw	a5,8(s8)
   19d7c:	00176713          	ori	a4,a4,1
   19d80:	00e7a223          	sw	a4,4(a5)
   19d84:	004ba783          	lw	a5,4(s7)
   19d88:	00090513          	mv	a0,s2
   19d8c:	0017f793          	andi	a5,a5,1
   19d90:	0147e7b3          	or	a5,a5,s4
   19d94:	00fba223          	sw	a5,4(s7)
   19d98:	c1df70ef          	jal	119b4 <__malloc_unlock>
   19d9c:	01012b03          	lw	s6,16(sp)
   19da0:	00c12b83          	lw	s7,12(sp)
   19da4:	00812c03          	lw	s8,8(sp)
   19da8:	e99ff06f          	j	19c40 <_realloc_r+0x1b4>
   19dac:	00042683          	lw	a3,0(s0)
   19db0:	01b00713          	li	a4,27
   19db4:	00d52023          	sw	a3,0(a0)
   19db8:	00442683          	lw	a3,4(s0)
   19dbc:	00d52223          	sw	a3,4(a0)
   19dc0:	12c76c63          	bltu	a4,a2,19ef8 <_realloc_r+0x46c>
   19dc4:	00840713          	addi	a4,s0,8
   19dc8:	00850793          	addi	a5,a0,8
   19dcc:	dd9ff06f          	j	19ba4 <_realloc_r+0x118>
   19dd0:	ffc52783          	lw	a5,-4(a0)
   19dd4:	00812c03          	lw	s8,8(sp)
   19dd8:	ffc7f793          	andi	a5,a5,-4
   19ddc:	00f989b3          	add	s3,s3,a5
   19de0:	e29ff06f          	j	19c08 <_realloc_r+0x17c>
   19de4:	00cba783          	lw	a5,12(s7)
   19de8:	008ba683          	lw	a3,8(s7)
   19dec:	ffc98613          	addi	a2,s3,-4
   19df0:	02400593          	li	a1,36
   19df4:	00f6a623          	sw	a5,12(a3)
   19df8:	00d7a423          	sw	a3,8(a5)
   19dfc:	008b8493          	addi	s1,s7,8
   19e00:	0ec5e463          	bltu	a1,a2,19ee8 <_realloc_r+0x45c>
   19e04:	01300693          	li	a3,19
   19e08:	00048793          	mv	a5,s1
   19e0c:	02c6f263          	bgeu	a3,a2,19e30 <_realloc_r+0x3a4>
   19e10:	00042703          	lw	a4,0(s0)
   19e14:	01b00793          	li	a5,27
   19e18:	00eba423          	sw	a4,8(s7)
   19e1c:	00442703          	lw	a4,4(s0)
   19e20:	00eba623          	sw	a4,12(s7)
   19e24:	12c7e663          	bltu	a5,a2,19f50 <_realloc_r+0x4c4>
   19e28:	00840413          	addi	s0,s0,8
   19e2c:	010b8793          	addi	a5,s7,16
   19e30:	00042683          	lw	a3,0(s0)
   19e34:	00d7a023          	sw	a3,0(a5)
   19e38:	00442683          	lw	a3,4(s0)
   19e3c:	00d7a223          	sw	a3,4(a5)
   19e40:	00842683          	lw	a3,8(s0)
   19e44:	00d7a423          	sw	a3,8(a5)
   19e48:	000b0993          	mv	s3,s6
   19e4c:	000b8a93          	mv	s5,s7
   19e50:	01012b03          	lw	s6,16(sp)
   19e54:	00c12b83          	lw	s7,12(sp)
   19e58:	00812c03          	lw	s8,8(sp)
   19e5c:	00048413          	mv	s0,s1
   19e60:	da9ff06f          	j	19c08 <_realloc_r+0x17c>
   19e64:	00040593          	mv	a1,s0
   19e68:	c59fb0ef          	jal	15ac0 <memmove>
   19e6c:	d51ff06f          	j	19bbc <_realloc_r+0x130>
   19e70:	00c6a783          	lw	a5,12(a3)
   19e74:	0086a703          	lw	a4,8(a3)
   19e78:	ffc98613          	addi	a2,s3,-4
   19e7c:	02400693          	li	a3,36
   19e80:	00f72623          	sw	a5,12(a4)
   19e84:	00e7a423          	sw	a4,8(a5)
   19e88:	008ba703          	lw	a4,8(s7)
   19e8c:	00cba783          	lw	a5,12(s7)
   19e90:	008b8493          	addi	s1,s7,8
   19e94:	00f72623          	sw	a5,12(a4)
   19e98:	00e7a423          	sw	a4,8(a5)
   19e9c:	04c6e663          	bltu	a3,a2,19ee8 <_realloc_r+0x45c>
   19ea0:	01300713          	li	a4,19
   19ea4:	00048793          	mv	a5,s1
   19ea8:	02c77263          	bgeu	a4,a2,19ecc <_realloc_r+0x440>
   19eac:	00042703          	lw	a4,0(s0)
   19eb0:	01b00793          	li	a5,27
   19eb4:	00eba423          	sw	a4,8(s7)
   19eb8:	00442703          	lw	a4,4(s0)
   19ebc:	00eba623          	sw	a4,12(s7)
   19ec0:	0ec7e063          	bltu	a5,a2,19fa0 <_realloc_r+0x514>
   19ec4:	00840413          	addi	s0,s0,8
   19ec8:	010b8793          	addi	a5,s7,16
   19ecc:	00042703          	lw	a4,0(s0)
   19ed0:	00e7a023          	sw	a4,0(a5)
   19ed4:	00442703          	lw	a4,4(s0)
   19ed8:	00e7a223          	sw	a4,4(a5)
   19edc:	00842703          	lw	a4,8(s0)
   19ee0:	00e7a423          	sw	a4,8(a5)
   19ee4:	f65ff06f          	j	19e48 <_realloc_r+0x3bc>
   19ee8:	00040593          	mv	a1,s0
   19eec:	00048513          	mv	a0,s1
   19ef0:	bd1fb0ef          	jal	15ac0 <memmove>
   19ef4:	f55ff06f          	j	19e48 <_realloc_r+0x3bc>
   19ef8:	00842703          	lw	a4,8(s0)
   19efc:	00e52423          	sw	a4,8(a0)
   19f00:	00c42703          	lw	a4,12(s0)
   19f04:	00e52623          	sw	a4,12(a0)
   19f08:	06f60e63          	beq	a2,a5,19f84 <_realloc_r+0x4f8>
   19f0c:	01040713          	addi	a4,s0,16
   19f10:	01050793          	addi	a5,a0,16
   19f14:	c91ff06f          	j	19ba4 <_realloc_r+0x118>
   19f18:	014a8ab3          	add	s5,s5,s4
   19f1c:	414686b3          	sub	a3,a3,s4
   19f20:	015c2423          	sw	s5,8(s8)
   19f24:	0016e793          	ori	a5,a3,1
   19f28:	00faa223          	sw	a5,4(s5)
   19f2c:	ffc42783          	lw	a5,-4(s0)
   19f30:	00090513          	mv	a0,s2
   19f34:	00040493          	mv	s1,s0
   19f38:	0017f793          	andi	a5,a5,1
   19f3c:	0147e7b3          	or	a5,a5,s4
   19f40:	fef42e23          	sw	a5,-4(s0)
   19f44:	a71f70ef          	jal	119b4 <__malloc_unlock>
   19f48:	00812c03          	lw	s8,8(sp)
   19f4c:	cf5ff06f          	j	19c40 <_realloc_r+0x1b4>
   19f50:	00842783          	lw	a5,8(s0)
   19f54:	00fba823          	sw	a5,16(s7)
   19f58:	00c42783          	lw	a5,12(s0)
   19f5c:	00fbaa23          	sw	a5,20(s7)
   19f60:	06b60a63          	beq	a2,a1,19fd4 <_realloc_r+0x548>
   19f64:	01040413          	addi	s0,s0,16
   19f68:	018b8793          	addi	a5,s7,24
   19f6c:	ec5ff06f          	j	19e30 <_realloc_r+0x3a4>
   19f70:	00090513          	mv	a0,s2
   19f74:	a41f70ef          	jal	119b4 <__malloc_unlock>
   19f78:	00000493          	li	s1,0
   19f7c:	00812c03          	lw	s8,8(sp)
   19f80:	cc1ff06f          	j	19c40 <_realloc_r+0x1b4>
   19f84:	01042683          	lw	a3,16(s0)
   19f88:	01840713          	addi	a4,s0,24
   19f8c:	01850793          	addi	a5,a0,24
   19f90:	00d52823          	sw	a3,16(a0)
   19f94:	01442683          	lw	a3,20(s0)
   19f98:	00d52a23          	sw	a3,20(a0)
   19f9c:	c09ff06f          	j	19ba4 <_realloc_r+0x118>
   19fa0:	00842703          	lw	a4,8(s0)
   19fa4:	02400793          	li	a5,36
   19fa8:	00eba823          	sw	a4,16(s7)
   19fac:	00c42703          	lw	a4,12(s0)
   19fb0:	00ebaa23          	sw	a4,20(s7)
   19fb4:	04f60e63          	beq	a2,a5,1a010 <_realloc_r+0x584>
   19fb8:	01040413          	addi	s0,s0,16
   19fbc:	018b8793          	addi	a5,s7,24
   19fc0:	f0dff06f          	j	19ecc <_realloc_r+0x440>
   19fc4:	00040593          	mv	a1,s0
   19fc8:	00048513          	mv	a0,s1
   19fcc:	af5fb0ef          	jal	15ac0 <memmove>
   19fd0:	da1ff06f          	j	19d70 <_realloc_r+0x2e4>
   19fd4:	01042703          	lw	a4,16(s0)
   19fd8:	020b8793          	addi	a5,s7,32
   19fdc:	01840413          	addi	s0,s0,24
   19fe0:	00ebac23          	sw	a4,24(s7)
   19fe4:	ffc42703          	lw	a4,-4(s0)
   19fe8:	00ebae23          	sw	a4,28(s7)
   19fec:	e45ff06f          	j	19e30 <_realloc_r+0x3a4>
   19ff0:	00842783          	lw	a5,8(s0)
   19ff4:	00fba823          	sw	a5,16(s7)
   19ff8:	00c42783          	lw	a5,12(s0)
   19ffc:	00fbaa23          	sw	a5,20(s7)
   1a000:	02d60663          	beq	a2,a3,1a02c <_realloc_r+0x5a0>
   1a004:	01040413          	addi	s0,s0,16
   1a008:	018b8793          	addi	a5,s7,24
   1a00c:	d4dff06f          	j	19d58 <_realloc_r+0x2cc>
   1a010:	01042703          	lw	a4,16(s0)
   1a014:	020b8793          	addi	a5,s7,32
   1a018:	01840413          	addi	s0,s0,24
   1a01c:	00ebac23          	sw	a4,24(s7)
   1a020:	ffc42703          	lw	a4,-4(s0)
   1a024:	00ebae23          	sw	a4,28(s7)
   1a028:	ea5ff06f          	j	19ecc <_realloc_r+0x440>
   1a02c:	01042703          	lw	a4,16(s0)
   1a030:	020b8793          	addi	a5,s7,32
   1a034:	01840413          	addi	s0,s0,24
   1a038:	00ebac23          	sw	a4,24(s7)
   1a03c:	ffc42703          	lw	a4,-4(s0)
   1a040:	00ebae23          	sw	a4,28(s7)
   1a044:	d15ff06f          	j	19d58 <_realloc_r+0x2cc>

0001a048 <__smakebuf_r>:
   1a048:	00c59783          	lh	a5,12(a1)
   1a04c:	f9010113          	addi	sp,sp,-112
   1a050:	06812423          	sw	s0,104(sp)
   1a054:	06112623          	sw	ra,108(sp)
   1a058:	0027f713          	andi	a4,a5,2
   1a05c:	00058413          	mv	s0,a1
   1a060:	02070463          	beqz	a4,1a088 <__smakebuf_r+0x40>
   1a064:	04358793          	addi	a5,a1,67
   1a068:	00100713          	li	a4,1
   1a06c:	00f5a023          	sw	a5,0(a1)
   1a070:	00f5a823          	sw	a5,16(a1)
   1a074:	00e5aa23          	sw	a4,20(a1)
   1a078:	06c12083          	lw	ra,108(sp)
   1a07c:	06812403          	lw	s0,104(sp)
   1a080:	07010113          	addi	sp,sp,112
   1a084:	00008067          	ret
   1a088:	00e59583          	lh	a1,14(a1)
   1a08c:	07212023          	sw	s2,96(sp)
   1a090:	06912223          	sw	s1,100(sp)
   1a094:	00050913          	mv	s2,a0
   1a098:	0605ce63          	bltz	a1,1a114 <__smakebuf_r+0xcc>
   1a09c:	00810613          	addi	a2,sp,8
   1a0a0:	2fc000ef          	jal	1a39c <_fstat_r>
   1a0a4:	06054663          	bltz	a0,1a110 <__smakebuf_r+0xc8>
   1a0a8:	40000593          	li	a1,1024
   1a0ac:	00090513          	mv	a0,s2
   1a0b0:	00c12483          	lw	s1,12(sp)
   1a0b4:	8f4f70ef          	jal	111a8 <_malloc_r>
   1a0b8:	00c41783          	lh	a5,12(s0)
   1a0bc:	0a050a63          	beqz	a0,1a170 <__smakebuf_r+0x128>
   1a0c0:	0000f737          	lui	a4,0xf
   1a0c4:	0807e793          	ori	a5,a5,128
   1a0c8:	40000693          	li	a3,1024
   1a0cc:	00e4f4b3          	and	s1,s1,a4
   1a0d0:	00f41623          	sh	a5,12(s0)
   1a0d4:	00a42023          	sw	a0,0(s0)
   1a0d8:	00a42823          	sw	a0,16(s0)
   1a0dc:	00d42a23          	sw	a3,20(s0)
   1a0e0:	00002737          	lui	a4,0x2
   1a0e4:	0ce49663          	bne	s1,a4,1a1b0 <__smakebuf_r+0x168>
   1a0e8:	00e41583          	lh	a1,14(s0)
   1a0ec:	00090513          	mv	a0,s2
   1a0f0:	310000ef          	jal	1a400 <_isatty_r>
   1a0f4:	00001737          	lui	a4,0x1
   1a0f8:	00c41783          	lh	a5,12(s0)
   1a0fc:	80070713          	addi	a4,a4,-2048 # 800 <exit-0xf8b4>
   1a100:	04050863          	beqz	a0,1a150 <__smakebuf_r+0x108>
   1a104:	ffc7f793          	andi	a5,a5,-4
   1a108:	0017e793          	ori	a5,a5,1
   1a10c:	0440006f          	j	1a150 <__smakebuf_r+0x108>
   1a110:	00c41783          	lh	a5,12(s0)
   1a114:	0807f493          	andi	s1,a5,128
   1a118:	0014b493          	seqz	s1,s1
   1a11c:	409004b3          	neg	s1,s1
   1a120:	3c04f493          	andi	s1,s1,960
   1a124:	04048493          	addi	s1,s1,64
   1a128:	00090513          	mv	a0,s2
   1a12c:	00048593          	mv	a1,s1
   1a130:	878f70ef          	jal	111a8 <_malloc_r>
   1a134:	00c41783          	lh	a5,12(s0)
   1a138:	02050c63          	beqz	a0,1a170 <__smakebuf_r+0x128>
   1a13c:	0807e793          	ori	a5,a5,128
   1a140:	00a42023          	sw	a0,0(s0)
   1a144:	00a42823          	sw	a0,16(s0)
   1a148:	00942a23          	sw	s1,20(s0)
   1a14c:	00000713          	li	a4,0
   1a150:	00e7e7b3          	or	a5,a5,a4
   1a154:	06c12083          	lw	ra,108(sp)
   1a158:	00f41623          	sh	a5,12(s0)
   1a15c:	06812403          	lw	s0,104(sp)
   1a160:	06412483          	lw	s1,100(sp)
   1a164:	06012903          	lw	s2,96(sp)
   1a168:	07010113          	addi	sp,sp,112
   1a16c:	00008067          	ret
   1a170:	2007f713          	andi	a4,a5,512
   1a174:	02071863          	bnez	a4,1a1a4 <__smakebuf_r+0x15c>
   1a178:	ffc7f793          	andi	a5,a5,-4
   1a17c:	04340713          	addi	a4,s0,67
   1a180:	0027e793          	ori	a5,a5,2
   1a184:	00100693          	li	a3,1
   1a188:	06412483          	lw	s1,100(sp)
   1a18c:	06012903          	lw	s2,96(sp)
   1a190:	00f41623          	sh	a5,12(s0)
   1a194:	00e42023          	sw	a4,0(s0)
   1a198:	00e42823          	sw	a4,16(s0)
   1a19c:	00d42a23          	sw	a3,20(s0)
   1a1a0:	ed9ff06f          	j	1a078 <__smakebuf_r+0x30>
   1a1a4:	06412483          	lw	s1,100(sp)
   1a1a8:	06012903          	lw	s2,96(sp)
   1a1ac:	ecdff06f          	j	1a078 <__smakebuf_r+0x30>
   1a1b0:	00001737          	lui	a4,0x1
   1a1b4:	80070713          	addi	a4,a4,-2048 # 800 <exit-0xf8b4>
   1a1b8:	f99ff06f          	j	1a150 <__smakebuf_r+0x108>

0001a1bc <__swhatbuf_r>:
   1a1bc:	f9010113          	addi	sp,sp,-112
   1a1c0:	06812423          	sw	s0,104(sp)
   1a1c4:	00058413          	mv	s0,a1
   1a1c8:	00e59583          	lh	a1,14(a1)
   1a1cc:	06912223          	sw	s1,100(sp)
   1a1d0:	07212023          	sw	s2,96(sp)
   1a1d4:	06112623          	sw	ra,108(sp)
   1a1d8:	00060493          	mv	s1,a2
   1a1dc:	00068913          	mv	s2,a3
   1a1e0:	0405ca63          	bltz	a1,1a234 <__swhatbuf_r+0x78>
   1a1e4:	00810613          	addi	a2,sp,8
   1a1e8:	1b4000ef          	jal	1a39c <_fstat_r>
   1a1ec:	04054463          	bltz	a0,1a234 <__swhatbuf_r+0x78>
   1a1f0:	00c12783          	lw	a5,12(sp)
   1a1f4:	0000f6b7          	lui	a3,0xf
   1a1f8:	ffffe737          	lui	a4,0xffffe
   1a1fc:	00d7f7b3          	and	a5,a5,a3
   1a200:	00e787b3          	add	a5,a5,a4
   1a204:	06c12083          	lw	ra,108(sp)
   1a208:	06812403          	lw	s0,104(sp)
   1a20c:	0017b793          	seqz	a5,a5
   1a210:	00f92023          	sw	a5,0(s2)
   1a214:	40000713          	li	a4,1024
   1a218:	00e4a023          	sw	a4,0(s1)
   1a21c:	00001537          	lui	a0,0x1
   1a220:	06412483          	lw	s1,100(sp)
   1a224:	06012903          	lw	s2,96(sp)
   1a228:	80050513          	addi	a0,a0,-2048 # 800 <exit-0xf8b4>
   1a22c:	07010113          	addi	sp,sp,112
   1a230:	00008067          	ret
   1a234:	00c45783          	lhu	a5,12(s0)
   1a238:	0807f793          	andi	a5,a5,128
   1a23c:	02078863          	beqz	a5,1a26c <__swhatbuf_r+0xb0>
   1a240:	06c12083          	lw	ra,108(sp)
   1a244:	06812403          	lw	s0,104(sp)
   1a248:	00000793          	li	a5,0
   1a24c:	00f92023          	sw	a5,0(s2)
   1a250:	04000713          	li	a4,64
   1a254:	00e4a023          	sw	a4,0(s1)
   1a258:	06012903          	lw	s2,96(sp)
   1a25c:	06412483          	lw	s1,100(sp)
   1a260:	00000513          	li	a0,0
   1a264:	07010113          	addi	sp,sp,112
   1a268:	00008067          	ret
   1a26c:	06c12083          	lw	ra,108(sp)
   1a270:	06812403          	lw	s0,104(sp)
   1a274:	00f92023          	sw	a5,0(s2)
   1a278:	40000713          	li	a4,1024
   1a27c:	00e4a023          	sw	a4,0(s1)
   1a280:	06012903          	lw	s2,96(sp)
   1a284:	06412483          	lw	s1,100(sp)
   1a288:	00000513          	li	a0,0
   1a28c:	07010113          	addi	sp,sp,112
   1a290:	00008067          	ret

0001a294 <_setlocale_r>:
   1a294:	ff010113          	addi	sp,sp,-16
   1a298:	00112623          	sw	ra,12(sp)
   1a29c:	00912223          	sw	s1,4(sp)
   1a2a0:	02060e63          	beqz	a2,1a2dc <_setlocale_r+0x48>
   1a2a4:	000225b7          	lui	a1,0x22
   1a2a8:	54858593          	addi	a1,a1,1352 # 22548 <__clzsi2+0x1a8>
   1a2ac:	00060513          	mv	a0,a2
   1a2b0:	00812423          	sw	s0,8(sp)
   1a2b4:	00060413          	mv	s0,a2
   1a2b8:	1a4000ef          	jal	1a45c <strcmp>
   1a2bc:	000224b7          	lui	s1,0x22
   1a2c0:	02051263          	bnez	a0,1a2e4 <_setlocale_r+0x50>
   1a2c4:	00812403          	lw	s0,8(sp)
   1a2c8:	54448513          	addi	a0,s1,1348 # 22544 <__clzsi2+0x1a4>
   1a2cc:	00c12083          	lw	ra,12(sp)
   1a2d0:	00412483          	lw	s1,4(sp)
   1a2d4:	01010113          	addi	sp,sp,16
   1a2d8:	00008067          	ret
   1a2dc:	000224b7          	lui	s1,0x22
   1a2e0:	fe9ff06f          	j	1a2c8 <_setlocale_r+0x34>
   1a2e4:	54448593          	addi	a1,s1,1348 # 22544 <__clzsi2+0x1a4>
   1a2e8:	00040513          	mv	a0,s0
   1a2ec:	170000ef          	jal	1a45c <strcmp>
   1a2f0:	fc050ae3          	beqz	a0,1a2c4 <_setlocale_r+0x30>
   1a2f4:	000225b7          	lui	a1,0x22
   1a2f8:	00040513          	mv	a0,s0
   1a2fc:	43458593          	addi	a1,a1,1076 # 22434 <__clzsi2+0x94>
   1a300:	15c000ef          	jal	1a45c <strcmp>
   1a304:	fc0500e3          	beqz	a0,1a2c4 <_setlocale_r+0x30>
   1a308:	00812403          	lw	s0,8(sp)
   1a30c:	00000513          	li	a0,0
   1a310:	fbdff06f          	j	1a2cc <_setlocale_r+0x38>

0001a314 <__locale_mb_cur_max>:
   1a314:	e601c503          	lbu	a0,-416(gp) # 23670 <__global_locale+0x128>
   1a318:	00008067          	ret

0001a31c <setlocale>:
   1a31c:	ff010113          	addi	sp,sp,-16
   1a320:	00112623          	sw	ra,12(sp)
   1a324:	00912223          	sw	s1,4(sp)
   1a328:	02058e63          	beqz	a1,1a364 <setlocale+0x48>
   1a32c:	00812423          	sw	s0,8(sp)
   1a330:	00058413          	mv	s0,a1
   1a334:	000225b7          	lui	a1,0x22
   1a338:	54858593          	addi	a1,a1,1352 # 22548 <__clzsi2+0x1a8>
   1a33c:	00040513          	mv	a0,s0
   1a340:	11c000ef          	jal	1a45c <strcmp>
   1a344:	000224b7          	lui	s1,0x22
   1a348:	02051263          	bnez	a0,1a36c <setlocale+0x50>
   1a34c:	00812403          	lw	s0,8(sp)
   1a350:	54448513          	addi	a0,s1,1348 # 22544 <__clzsi2+0x1a4>
   1a354:	00c12083          	lw	ra,12(sp)
   1a358:	00412483          	lw	s1,4(sp)
   1a35c:	01010113          	addi	sp,sp,16
   1a360:	00008067          	ret
   1a364:	000224b7          	lui	s1,0x22
   1a368:	fe9ff06f          	j	1a350 <setlocale+0x34>
   1a36c:	54448593          	addi	a1,s1,1348 # 22544 <__clzsi2+0x1a4>
   1a370:	00040513          	mv	a0,s0
   1a374:	0e8000ef          	jal	1a45c <strcmp>
   1a378:	fc050ae3          	beqz	a0,1a34c <setlocale+0x30>
   1a37c:	000225b7          	lui	a1,0x22
   1a380:	00040513          	mv	a0,s0
   1a384:	43458593          	addi	a1,a1,1076 # 22434 <__clzsi2+0x94>
   1a388:	0d4000ef          	jal	1a45c <strcmp>
   1a38c:	fc0500e3          	beqz	a0,1a34c <setlocale+0x30>
   1a390:	00812403          	lw	s0,8(sp)
   1a394:	00000513          	li	a0,0
   1a398:	fbdff06f          	j	1a354 <setlocale+0x38>

0001a39c <_fstat_r>:
   1a39c:	ff010113          	addi	sp,sp,-16
   1a3a0:	00058713          	mv	a4,a1
   1a3a4:	00812423          	sw	s0,8(sp)
   1a3a8:	00912223          	sw	s1,4(sp)
   1a3ac:	00060593          	mv	a1,a2
   1a3b0:	00050413          	mv	s0,a0
   1a3b4:	00070513          	mv	a0,a4
   1a3b8:	00112623          	sw	ra,12(sp)
   1a3bc:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   1a3c0:	0f4020ef          	jal	1c4b4 <_fstat>
   1a3c4:	fff00793          	li	a5,-1
   1a3c8:	00f50c63          	beq	a0,a5,1a3e0 <_fstat_r+0x44>
   1a3cc:	00c12083          	lw	ra,12(sp)
   1a3d0:	00812403          	lw	s0,8(sp)
   1a3d4:	00412483          	lw	s1,4(sp)
   1a3d8:	01010113          	addi	sp,sp,16
   1a3dc:	00008067          	ret
   1a3e0:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   1a3e4:	fe0784e3          	beqz	a5,1a3cc <_fstat_r+0x30>
   1a3e8:	00c12083          	lw	ra,12(sp)
   1a3ec:	00f42023          	sw	a5,0(s0)
   1a3f0:	00812403          	lw	s0,8(sp)
   1a3f4:	00412483          	lw	s1,4(sp)
   1a3f8:	01010113          	addi	sp,sp,16
   1a3fc:	00008067          	ret

0001a400 <_isatty_r>:
   1a400:	ff010113          	addi	sp,sp,-16
   1a404:	00812423          	sw	s0,8(sp)
   1a408:	00912223          	sw	s1,4(sp)
   1a40c:	00050413          	mv	s0,a0
   1a410:	00058513          	mv	a0,a1
   1a414:	00112623          	sw	ra,12(sp)
   1a418:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   1a41c:	178020ef          	jal	1c594 <_isatty>
   1a420:	fff00793          	li	a5,-1
   1a424:	00f50c63          	beq	a0,a5,1a43c <_isatty_r+0x3c>
   1a428:	00c12083          	lw	ra,12(sp)
   1a42c:	00812403          	lw	s0,8(sp)
   1a430:	00412483          	lw	s1,4(sp)
   1a434:	01010113          	addi	sp,sp,16
   1a438:	00008067          	ret
   1a43c:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   1a440:	fe0784e3          	beqz	a5,1a428 <_isatty_r+0x28>
   1a444:	00c12083          	lw	ra,12(sp)
   1a448:	00f42023          	sw	a5,0(s0)
   1a44c:	00812403          	lw	s0,8(sp)
   1a450:	00412483          	lw	s1,4(sp)
   1a454:	01010113          	addi	sp,sp,16
   1a458:	00008067          	ret

0001a45c <strcmp>:
   1a45c:	00b56733          	or	a4,a0,a1
   1a460:	fff00393          	li	t2,-1
   1a464:	00377713          	andi	a4,a4,3
   1a468:	10071063          	bnez	a4,1a568 <strcmp+0x10c>
   1a46c:	7f7f87b7          	lui	a5,0x7f7f8
   1a470:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <__BSS_END__+0x7f7d452b>
   1a474:	00052603          	lw	a2,0(a0)
   1a478:	0005a683          	lw	a3,0(a1)
   1a47c:	00f672b3          	and	t0,a2,a5
   1a480:	00f66333          	or	t1,a2,a5
   1a484:	00f282b3          	add	t0,t0,a5
   1a488:	0062e2b3          	or	t0,t0,t1
   1a48c:	10729263          	bne	t0,t2,1a590 <strcmp+0x134>
   1a490:	08d61663          	bne	a2,a3,1a51c <strcmp+0xc0>
   1a494:	00452603          	lw	a2,4(a0)
   1a498:	0045a683          	lw	a3,4(a1)
   1a49c:	00f672b3          	and	t0,a2,a5
   1a4a0:	00f66333          	or	t1,a2,a5
   1a4a4:	00f282b3          	add	t0,t0,a5
   1a4a8:	0062e2b3          	or	t0,t0,t1
   1a4ac:	0c729e63          	bne	t0,t2,1a588 <strcmp+0x12c>
   1a4b0:	06d61663          	bne	a2,a3,1a51c <strcmp+0xc0>
   1a4b4:	00852603          	lw	a2,8(a0)
   1a4b8:	0085a683          	lw	a3,8(a1)
   1a4bc:	00f672b3          	and	t0,a2,a5
   1a4c0:	00f66333          	or	t1,a2,a5
   1a4c4:	00f282b3          	add	t0,t0,a5
   1a4c8:	0062e2b3          	or	t0,t0,t1
   1a4cc:	0c729863          	bne	t0,t2,1a59c <strcmp+0x140>
   1a4d0:	04d61663          	bne	a2,a3,1a51c <strcmp+0xc0>
   1a4d4:	00c52603          	lw	a2,12(a0)
   1a4d8:	00c5a683          	lw	a3,12(a1)
   1a4dc:	00f672b3          	and	t0,a2,a5
   1a4e0:	00f66333          	or	t1,a2,a5
   1a4e4:	00f282b3          	add	t0,t0,a5
   1a4e8:	0062e2b3          	or	t0,t0,t1
   1a4ec:	0c729263          	bne	t0,t2,1a5b0 <strcmp+0x154>
   1a4f0:	02d61663          	bne	a2,a3,1a51c <strcmp+0xc0>
   1a4f4:	01052603          	lw	a2,16(a0)
   1a4f8:	0105a683          	lw	a3,16(a1)
   1a4fc:	00f672b3          	and	t0,a2,a5
   1a500:	00f66333          	or	t1,a2,a5
   1a504:	00f282b3          	add	t0,t0,a5
   1a508:	0062e2b3          	or	t0,t0,t1
   1a50c:	0a729c63          	bne	t0,t2,1a5c4 <strcmp+0x168>
   1a510:	01450513          	addi	a0,a0,20
   1a514:	01458593          	addi	a1,a1,20
   1a518:	f4d60ee3          	beq	a2,a3,1a474 <strcmp+0x18>
   1a51c:	01061713          	slli	a4,a2,0x10
   1a520:	01069793          	slli	a5,a3,0x10
   1a524:	00f71e63          	bne	a4,a5,1a540 <strcmp+0xe4>
   1a528:	01065713          	srli	a4,a2,0x10
   1a52c:	0106d793          	srli	a5,a3,0x10
   1a530:	40f70533          	sub	a0,a4,a5
   1a534:	0ff57593          	zext.b	a1,a0
   1a538:	02059063          	bnez	a1,1a558 <strcmp+0xfc>
   1a53c:	00008067          	ret
   1a540:	01075713          	srli	a4,a4,0x10
   1a544:	0107d793          	srli	a5,a5,0x10
   1a548:	40f70533          	sub	a0,a4,a5
   1a54c:	0ff57593          	zext.b	a1,a0
   1a550:	00059463          	bnez	a1,1a558 <strcmp+0xfc>
   1a554:	00008067          	ret
   1a558:	0ff77713          	zext.b	a4,a4
   1a55c:	0ff7f793          	zext.b	a5,a5
   1a560:	40f70533          	sub	a0,a4,a5
   1a564:	00008067          	ret
   1a568:	00054603          	lbu	a2,0(a0)
   1a56c:	0005c683          	lbu	a3,0(a1)
   1a570:	00150513          	addi	a0,a0,1
   1a574:	00158593          	addi	a1,a1,1
   1a578:	00d61463          	bne	a2,a3,1a580 <strcmp+0x124>
   1a57c:	fe0616e3          	bnez	a2,1a568 <strcmp+0x10c>
   1a580:	40d60533          	sub	a0,a2,a3
   1a584:	00008067          	ret
   1a588:	00450513          	addi	a0,a0,4
   1a58c:	00458593          	addi	a1,a1,4
   1a590:	fcd61ce3          	bne	a2,a3,1a568 <strcmp+0x10c>
   1a594:	00000513          	li	a0,0
   1a598:	00008067          	ret
   1a59c:	00850513          	addi	a0,a0,8
   1a5a0:	00858593          	addi	a1,a1,8
   1a5a4:	fcd612e3          	bne	a2,a3,1a568 <strcmp+0x10c>
   1a5a8:	00000513          	li	a0,0
   1a5ac:	00008067          	ret
   1a5b0:	00c50513          	addi	a0,a0,12
   1a5b4:	00c58593          	addi	a1,a1,12
   1a5b8:	fad618e3          	bne	a2,a3,1a568 <strcmp+0x10c>
   1a5bc:	00000513          	li	a0,0
   1a5c0:	00008067          	ret
   1a5c4:	01050513          	addi	a0,a0,16
   1a5c8:	01058593          	addi	a1,a1,16
   1a5cc:	f8d61ee3          	bne	a2,a3,1a568 <strcmp+0x10c>
   1a5d0:	00000513          	li	a0,0
   1a5d4:	00008067          	ret

0001a5d8 <__assert_func>:
   1a5d8:	f0c1a783          	lw	a5,-244(gp) # 2371c <_impure_ptr>
   1a5dc:	ff010113          	addi	sp,sp,-16
   1a5e0:	00060813          	mv	a6,a2
   1a5e4:	00112623          	sw	ra,12(sp)
   1a5e8:	00068613          	mv	a2,a3
   1a5ec:	00058713          	mv	a4,a1
   1a5f0:	00050693          	mv	a3,a0
   1a5f4:	00c7a503          	lw	a0,12(a5)
   1a5f8:	00080e63          	beqz	a6,1a614 <__assert_func+0x3c>
   1a5fc:	000227b7          	lui	a5,0x22
   1a600:	55478793          	addi	a5,a5,1364 # 22554 <__clzsi2+0x1b4>
   1a604:	000225b7          	lui	a1,0x22
   1a608:	56458593          	addi	a1,a1,1380 # 22564 <__clzsi2+0x1c4>
   1a60c:	2bc000ef          	jal	1a8c8 <fiprintf>
   1a610:	05d010ef          	jal	1be6c <abort>
   1a614:	00022837          	lui	a6,0x22
   1a618:	43480793          	addi	a5,a6,1076 # 22434 <__clzsi2+0x94>
   1a61c:	43480813          	addi	a6,a6,1076
   1a620:	fe5ff06f          	j	1a604 <__assert_func+0x2c>

0001a624 <__assert>:
   1a624:	ff010113          	addi	sp,sp,-16
   1a628:	00060693          	mv	a3,a2
   1a62c:	00000613          	li	a2,0
   1a630:	00112623          	sw	ra,12(sp)
   1a634:	fa5ff0ef          	jal	1a5d8 <__assert_func>

0001a638 <_calloc_r>:
   1a638:	ff010113          	addi	sp,sp,-16
   1a63c:	00812423          	sw	s0,8(sp)
   1a640:	00112623          	sw	ra,12(sp)
   1a644:	0105d713          	srli	a4,a1,0x10
   1a648:	00058793          	mv	a5,a1
   1a64c:	00050413          	mv	s0,a0
   1a650:	01065693          	srli	a3,a2,0x10
   1a654:	0c071063          	bnez	a4,1a714 <_calloc_r+0xdc>
   1a658:	14069863          	bnez	a3,1a7a8 <_calloc_r+0x170>
   1a65c:	01061593          	slli	a1,a2,0x10
   1a660:	01079513          	slli	a0,a5,0x10
   1a664:	0105d593          	srli	a1,a1,0x10
   1a668:	01055513          	srli	a0,a0,0x10
   1a66c:	45d070ef          	jal	222c8 <__mulsi3>
   1a670:	00050593          	mv	a1,a0
   1a674:	00040513          	mv	a0,s0
   1a678:	b31f60ef          	jal	111a8 <_malloc_r>
   1a67c:	00050413          	mv	s0,a0
   1a680:	10050863          	beqz	a0,1a790 <_calloc_r+0x158>
   1a684:	ffc52603          	lw	a2,-4(a0)
   1a688:	02400713          	li	a4,36
   1a68c:	ffc67613          	andi	a2,a2,-4
   1a690:	ffc60613          	addi	a2,a2,-4
   1a694:	04c76863          	bltu	a4,a2,1a6e4 <_calloc_r+0xac>
   1a698:	01300693          	li	a3,19
   1a69c:	00050793          	mv	a5,a0
   1a6a0:	02c6f263          	bgeu	a3,a2,1a6c4 <_calloc_r+0x8c>
   1a6a4:	00052023          	sw	zero,0(a0)
   1a6a8:	00052223          	sw	zero,4(a0)
   1a6ac:	01b00793          	li	a5,27
   1a6b0:	04c7f863          	bgeu	a5,a2,1a700 <_calloc_r+0xc8>
   1a6b4:	00052423          	sw	zero,8(a0)
   1a6b8:	00052623          	sw	zero,12(a0)
   1a6bc:	01050793          	addi	a5,a0,16
   1a6c0:	0ee60e63          	beq	a2,a4,1a7bc <_calloc_r+0x184>
   1a6c4:	0007a023          	sw	zero,0(a5)
   1a6c8:	0007a223          	sw	zero,4(a5)
   1a6cc:	0007a423          	sw	zero,8(a5)
   1a6d0:	00c12083          	lw	ra,12(sp)
   1a6d4:	00040513          	mv	a0,s0
   1a6d8:	00812403          	lw	s0,8(sp)
   1a6dc:	01010113          	addi	sp,sp,16
   1a6e0:	00008067          	ret
   1a6e4:	00000593          	li	a1,0
   1a6e8:	c74f60ef          	jal	10b5c <memset>
   1a6ec:	00c12083          	lw	ra,12(sp)
   1a6f0:	00040513          	mv	a0,s0
   1a6f4:	00812403          	lw	s0,8(sp)
   1a6f8:	01010113          	addi	sp,sp,16
   1a6fc:	00008067          	ret
   1a700:	00850793          	addi	a5,a0,8
   1a704:	0007a023          	sw	zero,0(a5)
   1a708:	0007a223          	sw	zero,4(a5)
   1a70c:	0007a423          	sw	zero,8(a5)
   1a710:	fc1ff06f          	j	1a6d0 <_calloc_r+0x98>
   1a714:	0c069063          	bnez	a3,1a7d4 <_calloc_r+0x19c>
   1a718:	00912223          	sw	s1,4(sp)
   1a71c:	01212023          	sw	s2,0(sp)
   1a720:	00070493          	mv	s1,a4
   1a724:	00060913          	mv	s2,a2
   1a728:	01061593          	slli	a1,a2,0x10
   1a72c:	01079513          	slli	a0,a5,0x10
   1a730:	0105d593          	srli	a1,a1,0x10
   1a734:	01055513          	srli	a0,a0,0x10
   1a738:	391070ef          	jal	222c8 <__mulsi3>
   1a73c:	00050793          	mv	a5,a0
   1a740:	01049593          	slli	a1,s1,0x10
   1a744:	01091513          	slli	a0,s2,0x10
   1a748:	0105d593          	srli	a1,a1,0x10
   1a74c:	01055513          	srli	a0,a0,0x10
   1a750:	00078493          	mv	s1,a5
   1a754:	375070ef          	jal	222c8 <__mulsi3>
   1a758:	0104d793          	srli	a5,s1,0x10
   1a75c:	00f505b3          	add	a1,a0,a5
   1a760:	0105d793          	srli	a5,a1,0x10
   1a764:	06079463          	bnez	a5,1a7cc <_calloc_r+0x194>
   1a768:	01049493          	slli	s1,s1,0x10
   1a76c:	0104d493          	srli	s1,s1,0x10
   1a770:	01059593          	slli	a1,a1,0x10
   1a774:	0095e5b3          	or	a1,a1,s1
   1a778:	00040513          	mv	a0,s0
   1a77c:	00412483          	lw	s1,4(sp)
   1a780:	00012903          	lw	s2,0(sp)
   1a784:	a25f60ef          	jal	111a8 <_malloc_r>
   1a788:	00050413          	mv	s0,a0
   1a78c:	ee051ce3          	bnez	a0,1a684 <_calloc_r+0x4c>
   1a790:	00000413          	li	s0,0
   1a794:	00c12083          	lw	ra,12(sp)
   1a798:	00040513          	mv	a0,s0
   1a79c:	00812403          	lw	s0,8(sp)
   1a7a0:	01010113          	addi	sp,sp,16
   1a7a4:	00008067          	ret
   1a7a8:	00912223          	sw	s1,4(sp)
   1a7ac:	01212023          	sw	s2,0(sp)
   1a7b0:	00068493          	mv	s1,a3
   1a7b4:	00058913          	mv	s2,a1
   1a7b8:	f71ff06f          	j	1a728 <_calloc_r+0xf0>
   1a7bc:	00052823          	sw	zero,16(a0)
   1a7c0:	00052a23          	sw	zero,20(a0)
   1a7c4:	01850793          	addi	a5,a0,24
   1a7c8:	efdff06f          	j	1a6c4 <_calloc_r+0x8c>
   1a7cc:	00412483          	lw	s1,4(sp)
   1a7d0:	00012903          	lw	s2,0(sp)
   1a7d4:	690010ef          	jal	1be64 <__errno>
   1a7d8:	00c00793          	li	a5,12
   1a7dc:	00f52023          	sw	a5,0(a0)
   1a7e0:	00000413          	li	s0,0
   1a7e4:	fb1ff06f          	j	1a794 <_calloc_r+0x15c>

0001a7e8 <_mbtowc_r>:
   1a7e8:	e1c1a783          	lw	a5,-484(gp) # 2362c <__global_locale+0xe4>
   1a7ec:	00078067          	jr	a5

0001a7f0 <__ascii_mbtowc>:
   1a7f0:	02058063          	beqz	a1,1a810 <__ascii_mbtowc+0x20>
   1a7f4:	04060263          	beqz	a2,1a838 <__ascii_mbtowc+0x48>
   1a7f8:	04068863          	beqz	a3,1a848 <__ascii_mbtowc+0x58>
   1a7fc:	00064783          	lbu	a5,0(a2)
   1a800:	00f5a023          	sw	a5,0(a1)
   1a804:	00064503          	lbu	a0,0(a2)
   1a808:	00a03533          	snez	a0,a0
   1a80c:	00008067          	ret
   1a810:	ff010113          	addi	sp,sp,-16
   1a814:	00c10593          	addi	a1,sp,12
   1a818:	02060463          	beqz	a2,1a840 <__ascii_mbtowc+0x50>
   1a81c:	02068a63          	beqz	a3,1a850 <__ascii_mbtowc+0x60>
   1a820:	00064783          	lbu	a5,0(a2)
   1a824:	00f5a023          	sw	a5,0(a1)
   1a828:	00064503          	lbu	a0,0(a2)
   1a82c:	00a03533          	snez	a0,a0
   1a830:	01010113          	addi	sp,sp,16
   1a834:	00008067          	ret
   1a838:	00000513          	li	a0,0
   1a83c:	00008067          	ret
   1a840:	00000513          	li	a0,0
   1a844:	fedff06f          	j	1a830 <__ascii_mbtowc+0x40>
   1a848:	ffe00513          	li	a0,-2
   1a84c:	00008067          	ret
   1a850:	ffe00513          	li	a0,-2
   1a854:	fddff06f          	j	1a830 <__ascii_mbtowc+0x40>

0001a858 <_wctomb_r>:
   1a858:	e181a783          	lw	a5,-488(gp) # 23628 <__global_locale+0xe0>
   1a85c:	00078067          	jr	a5

0001a860 <__ascii_wctomb>:
   1a860:	02058463          	beqz	a1,1a888 <__ascii_wctomb+0x28>
   1a864:	0ff00793          	li	a5,255
   1a868:	00c7e863          	bltu	a5,a2,1a878 <__ascii_wctomb+0x18>
   1a86c:	00c58023          	sb	a2,0(a1)
   1a870:	00100513          	li	a0,1
   1a874:	00008067          	ret
   1a878:	08a00793          	li	a5,138
   1a87c:	00f52023          	sw	a5,0(a0)
   1a880:	fff00513          	li	a0,-1
   1a884:	00008067          	ret
   1a888:	00000513          	li	a0,0
   1a88c:	00008067          	ret

0001a890 <_fiprintf_r>:
   1a890:	fc010113          	addi	sp,sp,-64
   1a894:	02c10313          	addi	t1,sp,44
   1a898:	02d12623          	sw	a3,44(sp)
   1a89c:	00030693          	mv	a3,t1
   1a8a0:	00112e23          	sw	ra,28(sp)
   1a8a4:	02e12823          	sw	a4,48(sp)
   1a8a8:	02f12a23          	sw	a5,52(sp)
   1a8ac:	03012c23          	sw	a6,56(sp)
   1a8b0:	03112e23          	sw	a7,60(sp)
   1a8b4:	00612623          	sw	t1,12(sp)
   1a8b8:	060000ef          	jal	1a918 <_vfiprintf_r>
   1a8bc:	01c12083          	lw	ra,28(sp)
   1a8c0:	04010113          	addi	sp,sp,64
   1a8c4:	00008067          	ret

0001a8c8 <fiprintf>:
   1a8c8:	fc010113          	addi	sp,sp,-64
   1a8cc:	00050e93          	mv	t4,a0
   1a8d0:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   1a8d4:	00058e13          	mv	t3,a1
   1a8d8:	02810313          	addi	t1,sp,40
   1a8dc:	02c12423          	sw	a2,40(sp)
   1a8e0:	02d12623          	sw	a3,44(sp)
   1a8e4:	000e8593          	mv	a1,t4
   1a8e8:	000e0613          	mv	a2,t3
   1a8ec:	00030693          	mv	a3,t1
   1a8f0:	00112e23          	sw	ra,28(sp)
   1a8f4:	02e12823          	sw	a4,48(sp)
   1a8f8:	02f12a23          	sw	a5,52(sp)
   1a8fc:	03012c23          	sw	a6,56(sp)
   1a900:	03112e23          	sw	a7,60(sp)
   1a904:	00612623          	sw	t1,12(sp)
   1a908:	010000ef          	jal	1a918 <_vfiprintf_r>
   1a90c:	01c12083          	lw	ra,28(sp)
   1a910:	04010113          	addi	sp,sp,64
   1a914:	00008067          	ret

0001a918 <_vfiprintf_r>:
   1a918:	ed010113          	addi	sp,sp,-304
   1a91c:	11412c23          	sw	s4,280(sp)
   1a920:	11812423          	sw	s8,264(sp)
   1a924:	11a12023          	sw	s10,256(sp)
   1a928:	12112623          	sw	ra,300(sp)
   1a92c:	11312e23          	sw	s3,284(sp)
   1a930:	00b12023          	sw	a1,0(sp)
   1a934:	00050a13          	mv	s4,a0
   1a938:	00060c13          	mv	s8,a2
   1a93c:	00068d13          	mv	s10,a3
   1a940:	00050863          	beqz	a0,1a950 <_vfiprintf_r+0x38>
   1a944:	03452783          	lw	a5,52(a0)
   1a948:	00079463          	bnez	a5,1a950 <_vfiprintf_r+0x38>
   1a94c:	1b00106f          	j	1bafc <_vfiprintf_r+0x11e4>
   1a950:	00012583          	lw	a1,0(sp)
   1a954:	00002637          	lui	a2,0x2
   1a958:	00c59783          	lh	a5,12(a1)
   1a95c:	0645a703          	lw	a4,100(a1)
   1a960:	01279693          	slli	a3,a5,0x12
   1a964:	5a06cee3          	bltz	a3,1b720 <_vfiprintf_r+0xe08>
   1a968:	ffffe6b7          	lui	a3,0xffffe
   1a96c:	12812423          	sw	s0,296(sp)
   1a970:	00c7e7b3          	or	a5,a5,a2
   1a974:	fff68693          	addi	a3,a3,-1 # ffffdfff <__BSS_END__+0xfffda5ab>
   1a978:	00d77733          	and	a4,a4,a3
   1a97c:	00f59623          	sh	a5,12(a1)
   1a980:	01079793          	slli	a5,a5,0x10
   1a984:	4107d793          	srai	a5,a5,0x10
   1a988:	06e5a223          	sw	a4,100(a1)
   1a98c:	0087f713          	andi	a4,a5,8
   1a990:	2c070263          	beqz	a4,1ac54 <_vfiprintf_r+0x33c>
   1a994:	00012703          	lw	a4,0(sp)
   1a998:	01072703          	lw	a4,16(a4) # ffffe010 <__BSS_END__+0xfffda5bc>
   1a99c:	2a070c63          	beqz	a4,1ac54 <_vfiprintf_r+0x33c>
   1a9a0:	01a7f793          	andi	a5,a5,26
   1a9a4:	00a00713          	li	a4,10
   1a9a8:	2ce78a63          	beq	a5,a4,1ac7c <_vfiprintf_r+0x364>
   1a9ac:	11512a23          	sw	s5,276(sp)
   1a9b0:	04c10a93          	addi	s5,sp,76
   1a9b4:	12912223          	sw	s1,292(sp)
   1a9b8:	13212023          	sw	s2,288(sp)
   1a9bc:	11612823          	sw	s6,272(sp)
   1a9c0:	11712623          	sw	s7,268(sp)
   1a9c4:	11912223          	sw	s9,260(sp)
   1a9c8:	0fb12e23          	sw	s11,252(sp)
   1a9cc:	04012423          	sw	zero,72(sp)
   1a9d0:	04012223          	sw	zero,68(sp)
   1a9d4:	05512023          	sw	s5,64(sp)
   1a9d8:	000a8793          	mv	a5,s5
   1a9dc:	00012223          	sw	zero,4(sp)
   1a9e0:	00012a23          	sw	zero,20(sp)
   1a9e4:	00012c23          	sw	zero,24(sp)
   1a9e8:	00000993          	li	s3,0
   1a9ec:	02500413          	li	s0,37
   1a9f0:	00700913          	li	s2,7
   1a9f4:	01000493          	li	s1,16
   1a9f8:	000c4703          	lbu	a4,0(s8)
   1a9fc:	1c070c63          	beqz	a4,1abd4 <_vfiprintf_r+0x2bc>
   1aa00:	000c0b13          	mv	s6,s8
   1aa04:	2a870a63          	beq	a4,s0,1acb8 <_vfiprintf_r+0x3a0>
   1aa08:	001b4703          	lbu	a4,1(s6)
   1aa0c:	001b0b13          	addi	s6,s6,1
   1aa10:	fe071ae3          	bnez	a4,1aa04 <_vfiprintf_r+0xec>
   1aa14:	418b0bb3          	sub	s7,s6,s8
   1aa18:	1b8b0e63          	beq	s6,s8,1abd4 <_vfiprintf_r+0x2bc>
   1aa1c:	04812683          	lw	a3,72(sp)
   1aa20:	04412703          	lw	a4,68(sp)
   1aa24:	0187a023          	sw	s8,0(a5)
   1aa28:	017686b3          	add	a3,a3,s7
   1aa2c:	00170713          	addi	a4,a4,1
   1aa30:	0177a223          	sw	s7,4(a5)
   1aa34:	04d12423          	sw	a3,72(sp)
   1aa38:	04e12223          	sw	a4,68(sp)
   1aa3c:	00878793          	addi	a5,a5,8
   1aa40:	28e94463          	blt	s2,a4,1acc8 <_vfiprintf_r+0x3b0>
   1aa44:	000b4703          	lbu	a4,0(s6)
   1aa48:	017989b3          	add	s3,s3,s7
   1aa4c:	18070463          	beqz	a4,1abd4 <_vfiprintf_r+0x2bc>
   1aa50:	00000313          	li	t1,0
   1aa54:	001b4683          	lbu	a3,1(s6)
   1aa58:	001b0c13          	addi	s8,s6,1
   1aa5c:	02010da3          	sb	zero,59(sp)
   1aa60:	fff00c93          	li	s9,-1
   1aa64:	00000e13          	li	t3,0
   1aa68:	05a00b93          	li	s7,90
   1aa6c:	00030b13          	mv	s6,t1
   1aa70:	00078d93          	mv	s11,a5
   1aa74:	001c0c13          	addi	s8,s8,1
   1aa78:	fe068713          	addi	a4,a3,-32
   1aa7c:	04ebe863          	bltu	s7,a4,1aacc <_vfiprintf_r+0x1b4>
   1aa80:	000237b7          	lui	a5,0x23
   1aa84:	00271713          	slli	a4,a4,0x2
   1aa88:	9f478613          	addi	a2,a5,-1548 # 229f4 <_ctype_+0x104>
   1aa8c:	00c70733          	add	a4,a4,a2
   1aa90:	00072703          	lw	a4,0(a4)
   1aa94:	00070067          	jr	a4
   1aa98:	fd068713          	addi	a4,a3,-48
   1aa9c:	00000b13          	li	s6,0
   1aaa0:	00900593          	li	a1,9
   1aaa4:	002b1613          	slli	a2,s6,0x2
   1aaa8:	000c4683          	lbu	a3,0(s8)
   1aaac:	01660333          	add	t1,a2,s6
   1aab0:	00131313          	slli	t1,t1,0x1
   1aab4:	00670b33          	add	s6,a4,t1
   1aab8:	fd068713          	addi	a4,a3,-48
   1aabc:	001c0c13          	addi	s8,s8,1
   1aac0:	fee5f2e3          	bgeu	a1,a4,1aaa4 <_vfiprintf_r+0x18c>
   1aac4:	fe068713          	addi	a4,a3,-32
   1aac8:	faebfce3          	bgeu	s7,a4,1aa80 <_vfiprintf_r+0x168>
   1aacc:	000b0313          	mv	t1,s6
   1aad0:	000d8793          	mv	a5,s11
   1aad4:	10068063          	beqz	a3,1abd4 <_vfiprintf_r+0x2bc>
   1aad8:	00100d93          	li	s11,1
   1aadc:	08d10623          	sb	a3,140(sp)
   1aae0:	02010da3          	sb	zero,59(sp)
   1aae4:	000d8b93          	mv	s7,s11
   1aae8:	00000c93          	li	s9,0
   1aaec:	08c10813          	addi	a6,sp,140
   1aaf0:	04812583          	lw	a1,72(sp)
   1aaf4:	04412603          	lw	a2,68(sp)
   1aaf8:	084e7f13          	andi	t5,t3,132
   1aafc:	00058693          	mv	a3,a1
   1ab00:	00060713          	mv	a4,a2
   1ab04:	060f1863          	bnez	t5,1ab74 <_vfiprintf_r+0x25c>
   1ab08:	41730b33          	sub	s6,t1,s7
   1ab0c:	43604ee3          	bgtz	s6,1b748 <_vfiprintf_r+0xe30>
   1ab10:	03b14603          	lbu	a2,59(sp)
   1ab14:	06060463          	beqz	a2,1ab7c <_vfiprintf_r+0x264>
   1ab18:	00000f13          	li	t5,0
   1ab1c:	00000e93          	li	t4,0
   1ab20:	00168693          	addi	a3,a3,1
   1ab24:	00170713          	addi	a4,a4,1
   1ab28:	03b10593          	addi	a1,sp,59
   1ab2c:	00100613          	li	a2,1
   1ab30:	00b7a023          	sw	a1,0(a5)
   1ab34:	00c7a223          	sw	a2,4(a5)
   1ab38:	04d12423          	sw	a3,72(sp)
   1ab3c:	04e12223          	sw	a4,68(sp)
   1ab40:	00878793          	addi	a5,a5,8
   1ab44:	1ae94063          	blt	s2,a4,1ace4 <_vfiprintf_r+0x3cc>
   1ab48:	020e8663          	beqz	t4,1ab74 <_vfiprintf_r+0x25c>
   1ab4c:	00268693          	addi	a3,a3,2
   1ab50:	00170713          	addi	a4,a4,1
   1ab54:	03c10593          	addi	a1,sp,60
   1ab58:	00200613          	li	a2,2
   1ab5c:	00b7a023          	sw	a1,0(a5)
   1ab60:	00c7a223          	sw	a2,4(a5)
   1ab64:	04d12423          	sw	a3,72(sp)
   1ab68:	04e12223          	sw	a4,68(sp)
   1ab6c:	00878793          	addi	a5,a5,8
   1ab70:	36e946e3          	blt	s2,a4,1b6dc <_vfiprintf_r+0xdc4>
   1ab74:	08000613          	li	a2,128
   1ab78:	10cf00e3          	beq	t5,a2,1b478 <_vfiprintf_r+0xb60>
   1ab7c:	41bc8cb3          	sub	s9,s9,s11
   1ab80:	219042e3          	bgtz	s9,1b584 <_vfiprintf_r+0xc6c>
   1ab84:	00dd86b3          	add	a3,s11,a3
   1ab88:	00170713          	addi	a4,a4,1
   1ab8c:	0107a023          	sw	a6,0(a5)
   1ab90:	01b7a223          	sw	s11,4(a5)
   1ab94:	04d12423          	sw	a3,72(sp)
   1ab98:	04e12223          	sw	a4,68(sp)
   1ab9c:	00878793          	addi	a5,a5,8
   1aba0:	2ee94ae3          	blt	s2,a4,1b694 <_vfiprintf_r+0xd7c>
   1aba4:	004e7e13          	andi	t3,t3,4
   1aba8:	000e0663          	beqz	t3,1abb4 <_vfiprintf_r+0x29c>
   1abac:	41730b33          	sub	s6,t1,s7
   1abb0:	19604063          	bgtz	s6,1ad30 <_vfiprintf_r+0x418>
   1abb4:	01735463          	bge	t1,s7,1abbc <_vfiprintf_r+0x2a4>
   1abb8:	000b8313          	mv	t1,s7
   1abbc:	006989b3          	add	s3,s3,t1
   1abc0:	300692e3          	bnez	a3,1b6c4 <_vfiprintf_r+0xdac>
   1abc4:	000c4703          	lbu	a4,0(s8)
   1abc8:	04012223          	sw	zero,68(sp)
   1abcc:	000a8793          	mv	a5,s5
   1abd0:	e20718e3          	bnez	a4,1aa00 <_vfiprintf_r+0xe8>
   1abd4:	04812783          	lw	a5,72(sp)
   1abd8:	00078463          	beqz	a5,1abe0 <_vfiprintf_r+0x2c8>
   1abdc:	1280106f          	j	1bd04 <_vfiprintf_r+0x13ec>
   1abe0:	00012783          	lw	a5,0(sp)
   1abe4:	12812403          	lw	s0,296(sp)
   1abe8:	12412483          	lw	s1,292(sp)
   1abec:	00c7d783          	lhu	a5,12(a5)
   1abf0:	12012903          	lw	s2,288(sp)
   1abf4:	11412a83          	lw	s5,276(sp)
   1abf8:	0407f793          	andi	a5,a5,64
   1abfc:	11012b03          	lw	s6,272(sp)
   1ac00:	10c12b83          	lw	s7,268(sp)
   1ac04:	10412c83          	lw	s9,260(sp)
   1ac08:	0fc12d83          	lw	s11,252(sp)
   1ac0c:	00078463          	beqz	a5,1ac14 <_vfiprintf_r+0x2fc>
   1ac10:	1200106f          	j	1bd30 <_vfiprintf_r+0x1418>
   1ac14:	12c12083          	lw	ra,300(sp)
   1ac18:	11812a03          	lw	s4,280(sp)
   1ac1c:	10812c03          	lw	s8,264(sp)
   1ac20:	10012d03          	lw	s10,256(sp)
   1ac24:	00098513          	mv	a0,s3
   1ac28:	11c12983          	lw	s3,284(sp)
   1ac2c:	13010113          	addi	sp,sp,304
   1ac30:	00008067          	ret
   1ac34:	000d2b03          	lw	s6,0(s10)
   1ac38:	004d0d13          	addi	s10,s10,4
   1ac3c:	460b4463          	bltz	s6,1b0a4 <_vfiprintf_r+0x78c>
   1ac40:	000c4683          	lbu	a3,0(s8)
   1ac44:	e31ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1ac48:	000c4683          	lbu	a3,0(s8)
   1ac4c:	020e6e13          	ori	t3,t3,32
   1ac50:	e25ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1ac54:	00012403          	lw	s0,0(sp)
   1ac58:	000a0513          	mv	a0,s4
   1ac5c:	00040593          	mv	a1,s0
   1ac60:	a19fa0ef          	jal	15678 <__swsetup_r>
   1ac64:	00050463          	beqz	a0,1ac6c <_vfiprintf_r+0x354>
   1ac68:	0c40106f          	j	1bd2c <_vfiprintf_r+0x1414>
   1ac6c:	00c41783          	lh	a5,12(s0)
   1ac70:	00a00713          	li	a4,10
   1ac74:	01a7f793          	andi	a5,a5,26
   1ac78:	d2e79ae3          	bne	a5,a4,1a9ac <_vfiprintf_r+0x94>
   1ac7c:	00012783          	lw	a5,0(sp)
   1ac80:	00e79783          	lh	a5,14(a5)
   1ac84:	d207c4e3          	bltz	a5,1a9ac <_vfiprintf_r+0x94>
   1ac88:	12812403          	lw	s0,296(sp)
   1ac8c:	00012583          	lw	a1,0(sp)
   1ac90:	12c12083          	lw	ra,300(sp)
   1ac94:	11c12983          	lw	s3,284(sp)
   1ac98:	000d0693          	mv	a3,s10
   1ac9c:	000c0613          	mv	a2,s8
   1aca0:	10012d03          	lw	s10,256(sp)
   1aca4:	10812c03          	lw	s8,264(sp)
   1aca8:	000a0513          	mv	a0,s4
   1acac:	11812a03          	lw	s4,280(sp)
   1acb0:	13010113          	addi	sp,sp,304
   1acb4:	0f00106f          	j	1bda4 <__sbprintf>
   1acb8:	418b0bb3          	sub	s7,s6,s8
   1acbc:	d78b10e3          	bne	s6,s8,1aa1c <_vfiprintf_r+0x104>
   1acc0:	000b4703          	lbu	a4,0(s6)
   1acc4:	d89ff06f          	j	1aa4c <_vfiprintf_r+0x134>
   1acc8:	00012583          	lw	a1,0(sp)
   1accc:	04010613          	addi	a2,sp,64
   1acd0:	000a0513          	mv	a0,s4
   1acd4:	820fa0ef          	jal	14cf4 <__sprint_r>
   1acd8:	f00514e3          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1acdc:	000a8793          	mv	a5,s5
   1ace0:	d65ff06f          	j	1aa44 <_vfiprintf_r+0x12c>
   1ace4:	00012583          	lw	a1,0(sp)
   1ace8:	04010613          	addi	a2,sp,64
   1acec:	000a0513          	mv	a0,s4
   1acf0:	03c12023          	sw	t3,32(sp)
   1acf4:	01012e23          	sw	a6,28(sp)
   1acf8:	01e12823          	sw	t5,16(sp)
   1acfc:	01d12623          	sw	t4,12(sp)
   1ad00:	00612423          	sw	t1,8(sp)
   1ad04:	ff1f90ef          	jal	14cf4 <__sprint_r>
   1ad08:	ec051ce3          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1ad0c:	04812683          	lw	a3,72(sp)
   1ad10:	04412703          	lw	a4,68(sp)
   1ad14:	02012e03          	lw	t3,32(sp)
   1ad18:	01c12803          	lw	a6,28(sp)
   1ad1c:	01012f03          	lw	t5,16(sp)
   1ad20:	00c12e83          	lw	t4,12(sp)
   1ad24:	00812303          	lw	t1,8(sp)
   1ad28:	000a8793          	mv	a5,s5
   1ad2c:	e1dff06f          	j	1ab48 <_vfiprintf_r+0x230>
   1ad30:	00023f37          	lui	t5,0x23
   1ad34:	01000c93          	li	s9,16
   1ad38:	04412703          	lw	a4,68(sp)
   1ad3c:	b70f0f13          	addi	t5,t5,-1168 # 22b70 <blanks.1>
   1ad40:	076cde63          	bge	s9,s6,1adbc <_vfiprintf_r+0x4a4>
   1ad44:	01712623          	sw	s7,12(sp)
   1ad48:	000c8813          	mv	a6,s9
   1ad4c:	00700d93          	li	s11,7
   1ad50:	00612423          	sw	t1,8(sp)
   1ad54:	000f0b93          	mv	s7,t5
   1ad58:	00c0006f          	j	1ad64 <_vfiprintf_r+0x44c>
   1ad5c:	ff0b0b13          	addi	s6,s6,-16
   1ad60:	05685863          	bge	a6,s6,1adb0 <_vfiprintf_r+0x498>
   1ad64:	01068693          	addi	a3,a3,16
   1ad68:	00170713          	addi	a4,a4,1
   1ad6c:	0177a023          	sw	s7,0(a5)
   1ad70:	0197a223          	sw	s9,4(a5)
   1ad74:	04d12423          	sw	a3,72(sp)
   1ad78:	04e12223          	sw	a4,68(sp)
   1ad7c:	00878793          	addi	a5,a5,8
   1ad80:	fceddee3          	bge	s11,a4,1ad5c <_vfiprintf_r+0x444>
   1ad84:	00012583          	lw	a1,0(sp)
   1ad88:	04010613          	addi	a2,sp,64
   1ad8c:	000a0513          	mv	a0,s4
   1ad90:	f65f90ef          	jal	14cf4 <__sprint_r>
   1ad94:	e40516e3          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1ad98:	01000813          	li	a6,16
   1ad9c:	ff0b0b13          	addi	s6,s6,-16
   1ada0:	04812683          	lw	a3,72(sp)
   1ada4:	04412703          	lw	a4,68(sp)
   1ada8:	000a8793          	mv	a5,s5
   1adac:	fb684ce3          	blt	a6,s6,1ad64 <_vfiprintf_r+0x44c>
   1adb0:	000b8f13          	mv	t5,s7
   1adb4:	00812303          	lw	t1,8(sp)
   1adb8:	00c12b83          	lw	s7,12(sp)
   1adbc:	016686b3          	add	a3,a3,s6
   1adc0:	00170713          	addi	a4,a4,1
   1adc4:	01e7a023          	sw	t5,0(a5)
   1adc8:	0167a223          	sw	s6,4(a5)
   1adcc:	04d12423          	sw	a3,72(sp)
   1add0:	04e12223          	sw	a4,68(sp)
   1add4:	00700793          	li	a5,7
   1add8:	dce7dee3          	bge	a5,a4,1abb4 <_vfiprintf_r+0x29c>
   1addc:	00012583          	lw	a1,0(sp)
   1ade0:	04010613          	addi	a2,sp,64
   1ade4:	000a0513          	mv	a0,s4
   1ade8:	00612423          	sw	t1,8(sp)
   1adec:	f09f90ef          	jal	14cf4 <__sprint_r>
   1adf0:	de0518e3          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1adf4:	04812683          	lw	a3,72(sp)
   1adf8:	00812303          	lw	t1,8(sp)
   1adfc:	db9ff06f          	j	1abb4 <_vfiprintf_r+0x29c>
   1ae00:	020e7713          	andi	a4,t3,32
   1ae04:	000b0313          	mv	t1,s6
   1ae08:	000d8793          	mv	a5,s11
   1ae0c:	14071a63          	bnez	a4,1af60 <_vfiprintf_r+0x648>
   1ae10:	010e7693          	andi	a3,t3,16
   1ae14:	000d2703          	lw	a4,0(s10)
   1ae18:	004d0613          	addi	a2,s10,4
   1ae1c:	240696e3          	bnez	a3,1b868 <_vfiprintf_r+0xf50>
   1ae20:	040e7693          	andi	a3,t3,64
   1ae24:	56068ae3          	beqz	a3,1bb98 <_vfiprintf_r+0x1280>
   1ae28:	01071d93          	slli	s11,a4,0x10
   1ae2c:	410ddd93          	srai	s11,s11,0x10
   1ae30:	41fdde93          	srai	t4,s11,0x1f
   1ae34:	00060d13          	mv	s10,a2
   1ae38:	000e8693          	mv	a3,t4
   1ae3c:	1406c063          	bltz	a3,1af7c <_vfiprintf_r+0x664>
   1ae40:	000cc863          	bltz	s9,1ae50 <_vfiprintf_r+0x538>
   1ae44:	01dde6b3          	or	a3,s11,t4
   1ae48:	f7fe7e13          	andi	t3,t3,-129
   1ae4c:	2c068ce3          	beqz	a3,1b924 <_vfiprintf_r+0x100c>
   1ae50:	140e9863          	bnez	t4,1afa0 <_vfiprintf_r+0x688>
   1ae54:	00900693          	li	a3,9
   1ae58:	15b6e463          	bltu	a3,s11,1afa0 <_vfiprintf_r+0x688>
   1ae5c:	030d8713          	addi	a4,s11,48
   1ae60:	0ff77713          	zext.b	a4,a4
   1ae64:	0ee107a3          	sb	a4,239(sp)
   1ae68:	000c8b93          	mv	s7,s9
   1ae6c:	01904463          	bgtz	s9,1ae74 <_vfiprintf_r+0x55c>
   1ae70:	00100b93          	li	s7,1
   1ae74:	03b14703          	lbu	a4,59(sp)
   1ae78:	1a070ee3          	beqz	a4,1b834 <_vfiprintf_r+0xf1c>
   1ae7c:	001b8b93          	addi	s7,s7,1
   1ae80:	00100d93          	li	s11,1
   1ae84:	0ef10813          	addi	a6,sp,239
   1ae88:	04812683          	lw	a3,72(sp)
   1ae8c:	04412703          	lw	a4,68(sp)
   1ae90:	084e7f13          	andi	t5,t3,132
   1ae94:	00068593          	mv	a1,a3
   1ae98:	00070613          	mv	a2,a4
   1ae9c:	00000e93          	li	t4,0
   1aea0:	c80f10e3          	bnez	t5,1ab20 <_vfiprintf_r+0x208>
   1aea4:	c65ff06f          	j	1ab08 <_vfiprintf_r+0x1f0>
   1aea8:	000d2803          	lw	a6,0(s10)
   1aeac:	02010da3          	sb	zero,59(sp)
   1aeb0:	000b0313          	mv	t1,s6
   1aeb4:	000d8793          	mv	a5,s11
   1aeb8:	004d0d13          	addi	s10,s10,4
   1aebc:	46080ce3          	beqz	a6,1bb34 <_vfiprintf_r+0x121c>
   1aec0:	01b12e23          	sw	s11,28(sp)
   1aec4:	01c12823          	sw	t3,16(sp)
   1aec8:	01612623          	sw	s6,12(sp)
   1aecc:	300cc4e3          	bltz	s9,1b9d4 <_vfiprintf_r+0x10bc>
   1aed0:	00080513          	mv	a0,a6
   1aed4:	000c8613          	mv	a2,s9
   1aed8:	00000593          	li	a1,0
   1aedc:	01012423          	sw	a6,8(sp)
   1aee0:	93dfa0ef          	jal	1581c <memchr>
   1aee4:	03b14703          	lbu	a4,59(sp)
   1aee8:	00812803          	lw	a6,8(sp)
   1aeec:	00c12303          	lw	t1,12(sp)
   1aef0:	01012e03          	lw	t3,16(sp)
   1aef4:	01c12783          	lw	a5,28(sp)
   1aef8:	620500e3          	beqz	a0,1bd18 <_vfiprintf_r+0x1400>
   1aefc:	41050db3          	sub	s11,a0,a6
   1af00:	fffdcb93          	not	s7,s11
   1af04:	41fbdb93          	srai	s7,s7,0x1f
   1af08:	017dfbb3          	and	s7,s11,s7
   1af0c:	2e070ee3          	beqz	a4,1ba08 <_vfiprintf_r+0x10f0>
   1af10:	001b8b93          	addi	s7,s7,1
   1af14:	00000c93          	li	s9,0
   1af18:	f71ff06f          	j	1ae88 <_vfiprintf_r+0x570>
   1af1c:	000d2703          	lw	a4,0(s10)
   1af20:	000d8793          	mv	a5,s11
   1af24:	00100d93          	li	s11,1
   1af28:	000b0313          	mv	t1,s6
   1af2c:	02010da3          	sb	zero,59(sp)
   1af30:	08e10623          	sb	a4,140(sp)
   1af34:	004d0d13          	addi	s10,s10,4
   1af38:	000d8b93          	mv	s7,s11
   1af3c:	00000c93          	li	s9,0
   1af40:	08c10813          	addi	a6,sp,140
   1af44:	badff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1af48:	020e7713          	andi	a4,t3,32
   1af4c:	000b0313          	mv	t1,s6
   1af50:	000d8793          	mv	a5,s11
   1af54:	010e6e13          	ori	t3,t3,16
   1af58:	004d0613          	addi	a2,s10,4
   1af5c:	100706e3          	beqz	a4,1b868 <_vfiprintf_r+0xf50>
   1af60:	007d0713          	addi	a4,s10,7
   1af64:	ff877713          	andi	a4,a4,-8
   1af68:	00472683          	lw	a3,4(a4)
   1af6c:	00072d83          	lw	s11,0(a4)
   1af70:	00870d13          	addi	s10,a4,8
   1af74:	00068e93          	mv	t4,a3
   1af78:	ec06d4e3          	bgez	a3,1ae40 <_vfiprintf_r+0x528>
   1af7c:	02d00613          	li	a2,45
   1af80:	01b036b3          	snez	a3,s11
   1af84:	41d00eb3          	neg	t4,t4
   1af88:	02c10da3          	sb	a2,59(sp)
   1af8c:	40de8eb3          	sub	t4,t4,a3
   1af90:	41b00db3          	neg	s11,s11
   1af94:	ea0ccee3          	bltz	s9,1ae50 <_vfiprintf_r+0x538>
   1af98:	f7fe7e13          	andi	t3,t3,-129
   1af9c:	ea0e8ce3          	beqz	t4,1ae54 <_vfiprintf_r+0x53c>
   1afa0:	400e7713          	andi	a4,t3,1024
   1afa4:	0f010b13          	addi	s6,sp,240
   1afa8:	02f12023          	sw	a5,32(sp)
   1afac:	000d8793          	mv	a5,s11
   1afb0:	01912e23          	sw	s9,28(sp)
   1afb4:	03412623          	sw	s4,44(sp)
   1afb8:	000d0d93          	mv	s11,s10
   1afbc:	00e12423          	sw	a4,8(sp)
   1afc0:	000c0d13          	mv	s10,s8
   1afc4:	00000b93          	li	s7,0
   1afc8:	00612823          	sw	t1,16(sp)
   1afcc:	03c12223          	sw	t3,36(sp)
   1afd0:	03312423          	sw	s3,40(sp)
   1afd4:	000b0a13          	mv	s4,s6
   1afd8:	000e8c93          	mv	s9,t4
   1afdc:	00078c13          	mv	s8,a5
   1afe0:	0300006f          	j	1b010 <_vfiprintf_r+0x6f8>
   1afe4:	000c0513          	mv	a0,s8
   1afe8:	000c8593          	mv	a1,s9
   1afec:	00a00613          	li	a2,10
   1aff0:	00000693          	li	a3,0
   1aff4:	01812623          	sw	s8,12(sp)
   1aff8:	000c8993          	mv	s3,s9
   1affc:	7dc010ef          	jal	1c7d8 <__udivdi3>
   1b000:	000b0a13          	mv	s4,s6
   1b004:	00050c13          	mv	s8,a0
   1b008:	00058c93          	mv	s9,a1
   1b00c:	460980e3          	beqz	s3,1bc6c <_vfiprintf_r+0x1354>
   1b010:	00a00613          	li	a2,10
   1b014:	00000693          	li	a3,0
   1b018:	000c0513          	mv	a0,s8
   1b01c:	000c8593          	mv	a1,s9
   1b020:	581010ef          	jal	1cda0 <__umoddi3>
   1b024:	00812783          	lw	a5,8(sp)
   1b028:	03050513          	addi	a0,a0,48
   1b02c:	feaa0fa3          	sb	a0,-1(s4)
   1b030:	fffa0b13          	addi	s6,s4,-1
   1b034:	001b8b93          	addi	s7,s7,1
   1b038:	fa0786e3          	beqz	a5,1afe4 <_vfiprintf_r+0x6cc>
   1b03c:	00412783          	lw	a5,4(sp)
   1b040:	0007c783          	lbu	a5,0(a5)
   1b044:	fb7790e3          	bne	a5,s7,1afe4 <_vfiprintf_r+0x6cc>
   1b048:	0ff00793          	li	a5,255
   1b04c:	f8fb8ce3          	beq	s7,a5,1afe4 <_vfiprintf_r+0x6cc>
   1b050:	380c9ae3          	bnez	s9,1bbe4 <_vfiprintf_r+0x12cc>
   1b054:	00900793          	li	a5,9
   1b058:	3987e6e3          	bltu	a5,s8,1bbe4 <_vfiprintf_r+0x12cc>
   1b05c:	01c12c83          	lw	s9,28(sp)
   1b060:	0f010713          	addi	a4,sp,240
   1b064:	000d0c13          	mv	s8,s10
   1b068:	000d8d13          	mv	s10,s11
   1b06c:	41670db3          	sub	s11,a4,s6
   1b070:	01012303          	lw	t1,16(sp)
   1b074:	02012783          	lw	a5,32(sp)
   1b078:	02412e03          	lw	t3,36(sp)
   1b07c:	02812983          	lw	s3,40(sp)
   1b080:	02c12a03          	lw	s4,44(sp)
   1b084:	000b0813          	mv	a6,s6
   1b088:	000c8b93          	mv	s7,s9
   1b08c:	01bcd463          	bge	s9,s11,1b094 <_vfiprintf_r+0x77c>
   1b090:	000d8b93          	mv	s7,s11
   1b094:	03b14703          	lbu	a4,59(sp)
   1b098:	a4070ce3          	beqz	a4,1aaf0 <_vfiprintf_r+0x1d8>
   1b09c:	001b8b93          	addi	s7,s7,1
   1b0a0:	de9ff06f          	j	1ae88 <_vfiprintf_r+0x570>
   1b0a4:	41600b33          	neg	s6,s6
   1b0a8:	000c4683          	lbu	a3,0(s8)
   1b0ac:	004e6e13          	ori	t3,t3,4
   1b0b0:	9c5ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b0b4:	020e7713          	andi	a4,t3,32
   1b0b8:	000b0313          	mv	t1,s6
   1b0bc:	000d8793          	mv	a5,s11
   1b0c0:	010e6b93          	ori	s7,t3,16
   1b0c4:	004d0613          	addi	a2,s10,4
   1b0c8:	7c070c63          	beqz	a4,1b8a0 <_vfiprintf_r+0xf88>
   1b0cc:	007d0693          	addi	a3,s10,7
   1b0d0:	ff86f693          	andi	a3,a3,-8
   1b0d4:	0006a703          	lw	a4,0(a3)
   1b0d8:	00868d13          	addi	s10,a3,8
   1b0dc:	0046a683          	lw	a3,4(a3)
   1b0e0:	02010da3          	sb	zero,59(sp)
   1b0e4:	bffbfe13          	andi	t3,s7,-1025
   1b0e8:	000cc863          	bltz	s9,1b0f8 <_vfiprintf_r+0x7e0>
   1b0ec:	00d76633          	or	a2,a4,a3
   1b0f0:	b7fbfe13          	andi	t3,s7,-1153
   1b0f4:	74060663          	beqz	a2,1b840 <_vfiprintf_r+0xf28>
   1b0f8:	0f010813          	addi	a6,sp,240
   1b0fc:	01d69593          	slli	a1,a3,0x1d
   1b100:	00777613          	andi	a2,a4,7
   1b104:	00375713          	srli	a4,a4,0x3
   1b108:	00080513          	mv	a0,a6
   1b10c:	03060613          	addi	a2,a2,48 # 2030 <exit-0xe084>
   1b110:	00e5e733          	or	a4,a1,a4
   1b114:	0036d693          	srli	a3,a3,0x3
   1b118:	00d765b3          	or	a1,a4,a3
   1b11c:	fec80fa3          	sb	a2,-1(a6)
   1b120:	fff80813          	addi	a6,a6,-1
   1b124:	fc059ce3          	bnez	a1,1b0fc <_vfiprintf_r+0x7e4>
   1b128:	001e7713          	andi	a4,t3,1
   1b12c:	60070263          	beqz	a4,1b730 <_vfiprintf_r+0xe18>
   1b130:	03000713          	li	a4,48
   1b134:	5ee60e63          	beq	a2,a4,1b730 <_vfiprintf_r+0xe18>
   1b138:	ffe50513          	addi	a0,a0,-2
   1b13c:	fee80fa3          	sb	a4,-1(a6)
   1b140:	0f010713          	addi	a4,sp,240
   1b144:	40a70db3          	sub	s11,a4,a0
   1b148:	000c8b93          	mv	s7,s9
   1b14c:	7dbcc263          	blt	s9,s11,1b910 <_vfiprintf_r+0xff8>
   1b150:	00050813          	mv	a6,a0
   1b154:	04812683          	lw	a3,72(sp)
   1b158:	04412703          	lw	a4,68(sp)
   1b15c:	084e7f13          	andi	t5,t3,132
   1b160:	00068593          	mv	a1,a3
   1b164:	00070613          	mv	a2,a4
   1b168:	9a0f00e3          	beqz	t5,1ab08 <_vfiprintf_r+0x1f0>
   1b16c:	03b14603          	lbu	a2,59(sp)
   1b170:	00000e93          	li	t4,0
   1b174:	9a0616e3          	bnez	a2,1ab20 <_vfiprintf_r+0x208>
   1b178:	9fdff06f          	j	1ab74 <_vfiprintf_r+0x25c>
   1b17c:	020e7713          	andi	a4,t3,32
   1b180:	000b0313          	mv	t1,s6
   1b184:	000d8793          	mv	a5,s11
   1b188:	04071863          	bnez	a4,1b1d8 <_vfiprintf_r+0x8c0>
   1b18c:	010e7713          	andi	a4,t3,16
   1b190:	000d2683          	lw	a3,0(s10)
   1b194:	004d0613          	addi	a2,s10,4
   1b198:	70071c63          	bnez	a4,1b8b0 <_vfiprintf_r+0xf98>
   1b19c:	040e7713          	andi	a4,t3,64
   1b1a0:	20070ce3          	beqz	a4,1bbb8 <_vfiprintf_r+0x12a0>
   1b1a4:	01069d93          	slli	s11,a3,0x10
   1b1a8:	02010da3          	sb	zero,59(sp)
   1b1ac:	010ddd93          	srli	s11,s11,0x10
   1b1b0:	00000e93          	li	t4,0
   1b1b4:	700cd663          	bgez	s9,1b8c0 <_vfiprintf_r+0xfa8>
   1b1b8:	00060d13          	mv	s10,a2
   1b1bc:	c99ff06f          	j	1ae54 <_vfiprintf_r+0x53c>
   1b1c0:	020e7713          	andi	a4,t3,32
   1b1c4:	000b0313          	mv	t1,s6
   1b1c8:	000d8793          	mv	a5,s11
   1b1cc:	010e6e13          	ori	t3,t3,16
   1b1d0:	004d0613          	addi	a2,s10,4
   1b1d4:	6c070e63          	beqz	a4,1b8b0 <_vfiprintf_r+0xf98>
   1b1d8:	007d0693          	addi	a3,s10,7
   1b1dc:	ff86f693          	andi	a3,a3,-8
   1b1e0:	02010da3          	sb	zero,59(sp)
   1b1e4:	0006ad83          	lw	s11,0(a3)
   1b1e8:	0046ae83          	lw	t4,4(a3)
   1b1ec:	00868d13          	addi	s10,a3,8
   1b1f0:	c60cc0e3          	bltz	s9,1ae50 <_vfiprintf_r+0x538>
   1b1f4:	01dde6b3          	or	a3,s11,t4
   1b1f8:	f7fe7e13          	andi	t3,t3,-129
   1b1fc:	c4069ae3          	bnez	a3,1ae50 <_vfiprintf_r+0x538>
   1b200:	6c0c9863          	bnez	s9,1b8d0 <_vfiprintf_r+0xfb8>
   1b204:	00000d93          	li	s11,0
   1b208:	00000b93          	li	s7,0
   1b20c:	0f010813          	addi	a6,sp,240
   1b210:	8e1ff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1b214:	000c4683          	lbu	a3,0(s8)
   1b218:	06800713          	li	a4,104
   1b21c:	0ee684e3          	beq	a3,a4,1bb04 <_vfiprintf_r+0x11ec>
   1b220:	040e6e13          	ori	t3,t3,64
   1b224:	851ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b228:	000a0513          	mv	a0,s4
   1b22c:	01c12423          	sw	t3,8(sp)
   1b230:	f64fa0ef          	jal	15994 <_localeconv_r>
   1b234:	00452783          	lw	a5,4(a0)
   1b238:	00078513          	mv	a0,a5
   1b23c:	00f12c23          	sw	a5,24(sp)
   1b240:	ad1fa0ef          	jal	15d10 <strlen>
   1b244:	00050713          	mv	a4,a0
   1b248:	000a0513          	mv	a0,s4
   1b24c:	00e12a23          	sw	a4,20(sp)
   1b250:	f44fa0ef          	jal	15994 <_localeconv_r>
   1b254:	00852603          	lw	a2,8(a0)
   1b258:	01412783          	lw	a5,20(sp)
   1b25c:	000c4683          	lbu	a3,0(s8)
   1b260:	00c12223          	sw	a2,4(sp)
   1b264:	00812e03          	lw	t3,8(sp)
   1b268:	800786e3          	beqz	a5,1aa74 <_vfiprintf_r+0x15c>
   1b26c:	800604e3          	beqz	a2,1aa74 <_vfiprintf_r+0x15c>
   1b270:	00064703          	lbu	a4,0(a2)
   1b274:	800700e3          	beqz	a4,1aa74 <_vfiprintf_r+0x15c>
   1b278:	400e6e13          	ori	t3,t3,1024
   1b27c:	ff8ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b280:	000c4683          	lbu	a3,0(s8)
   1b284:	001e6e13          	ori	t3,t3,1
   1b288:	fecff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b28c:	03b14703          	lbu	a4,59(sp)
   1b290:	000c4683          	lbu	a3,0(s8)
   1b294:	fe071063          	bnez	a4,1aa74 <_vfiprintf_r+0x15c>
   1b298:	02000713          	li	a4,32
   1b29c:	02e10da3          	sb	a4,59(sp)
   1b2a0:	fd4ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b2a4:	000c4683          	lbu	a3,0(s8)
   1b2a8:	080e6e13          	ori	t3,t3,128
   1b2ac:	fc8ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b2b0:	000c4683          	lbu	a3,0(s8)
   1b2b4:	02a00713          	li	a4,42
   1b2b8:	001c0593          	addi	a1,s8,1
   1b2bc:	28e686e3          	beq	a3,a4,1bd48 <_vfiprintf_r+0x1430>
   1b2c0:	00900513          	li	a0,9
   1b2c4:	fd068713          	addi	a4,a3,-48
   1b2c8:	00000c93          	li	s9,0
   1b2cc:	02e56463          	bltu	a0,a4,1b2f4 <_vfiprintf_r+0x9dc>
   1b2d0:	002c9613          	slli	a2,s9,0x2
   1b2d4:	0005c683          	lbu	a3,0(a1)
   1b2d8:	01960cb3          	add	s9,a2,s9
   1b2dc:	001c9c93          	slli	s9,s9,0x1
   1b2e0:	00ec8cb3          	add	s9,s9,a4
   1b2e4:	fd068713          	addi	a4,a3,-48
   1b2e8:	00158593          	addi	a1,a1,1
   1b2ec:	fee572e3          	bgeu	a0,a4,1b2d0 <_vfiprintf_r+0x9b8>
   1b2f0:	620cc463          	bltz	s9,1b918 <_vfiprintf_r+0x1000>
   1b2f4:	00058c13          	mv	s8,a1
   1b2f8:	f80ff06f          	j	1aa78 <_vfiprintf_r+0x160>
   1b2fc:	02b00713          	li	a4,43
   1b300:	000c4683          	lbu	a3,0(s8)
   1b304:	02e10da3          	sb	a4,59(sp)
   1b308:	f6cff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b30c:	00008737          	lui	a4,0x8
   1b310:	83070713          	addi	a4,a4,-2000 # 7830 <exit-0x8884>
   1b314:	02e11e23          	sh	a4,60(sp)
   1b318:	02010da3          	sb	zero,59(sp)
   1b31c:	000d2703          	lw	a4,0(s10)
   1b320:	000b0313          	mv	t1,s6
   1b324:	000d8793          	mv	a5,s11
   1b328:	004d0693          	addi	a3,s10,4
   1b32c:	00000613          	li	a2,0
   1b330:	5a0cc463          	bltz	s9,1b8d8 <_vfiprintf_r+0xfc0>
   1b334:	f7fe7e13          	andi	t3,t3,-129
   1b338:	002e6e13          	ori	t3,t3,2
   1b33c:	00070ce3          	beqz	a4,1bb54 <_vfiprintf_r+0x123c>
   1b340:	00022537          	lui	a0,0x22
   1b344:	44850813          	addi	a6,a0,1096 # 22448 <__clzsi2+0xa8>
   1b348:	00f77593          	andi	a1,a4,15
   1b34c:	010585b3          	add	a1,a1,a6
   1b350:	00068d13          	mv	s10,a3
   1b354:	0005c683          	lbu	a3,0(a1)
   1b358:	44850513          	addi	a0,a0,1096
   1b35c:	00200b93          	li	s7,2
   1b360:	01c61593          	slli	a1,a2,0x1c
   1b364:	00475713          	srli	a4,a4,0x4
   1b368:	00e5e733          	or	a4,a1,a4
   1b36c:	00465613          	srli	a2,a2,0x4
   1b370:	0ed107a3          	sb	a3,239(sp)
   1b374:	00c766b3          	or	a3,a4,a2
   1b378:	1e0686e3          	beqz	a3,1bd64 <_vfiprintf_r+0x144c>
   1b37c:	0ef10813          	addi	a6,sp,239
   1b380:	00f77693          	andi	a3,a4,15
   1b384:	00d506b3          	add	a3,a0,a3
   1b388:	0006c683          	lbu	a3,0(a3)
   1b38c:	01c61593          	slli	a1,a2,0x1c
   1b390:	00475713          	srli	a4,a4,0x4
   1b394:	00e5e733          	or	a4,a1,a4
   1b398:	00465613          	srli	a2,a2,0x4
   1b39c:	fed80fa3          	sb	a3,-1(a6)
   1b3a0:	00c766b3          	or	a3,a4,a2
   1b3a4:	fff80813          	addi	a6,a6,-1
   1b3a8:	fc069ce3          	bnez	a3,1b380 <_vfiprintf_r+0xa68>
   1b3ac:	0f010713          	addi	a4,sp,240
   1b3b0:	41070db3          	sub	s11,a4,a6
   1b3b4:	000c8713          	mv	a4,s9
   1b3b8:	01bcd463          	bge	s9,s11,1b3c0 <_vfiprintf_r+0xaa8>
   1b3bc:	000d8713          	mv	a4,s11
   1b3c0:	1a0b86e3          	beqz	s7,1bd6c <_vfiprintf_r+0x1454>
   1b3c4:	04812583          	lw	a1,72(sp)
   1b3c8:	04412603          	lw	a2,68(sp)
   1b3cc:	084e7f13          	andi	t5,t3,132
   1b3d0:	00270b93          	addi	s7,a4,2
   1b3d4:	00058693          	mv	a3,a1
   1b3d8:	00060713          	mv	a4,a2
   1b3dc:	f60f1863          	bnez	t5,1ab4c <_vfiprintf_r+0x234>
   1b3e0:	41730b33          	sub	s6,t1,s7
   1b3e4:	f7605463          	blez	s6,1ab4c <_vfiprintf_r+0x234>
   1b3e8:	00200e93          	li	t4,2
   1b3ec:	3600006f          	j	1b74c <_vfiprintf_r+0xe34>
   1b3f0:	020e7713          	andi	a4,t3,32
   1b3f4:	000b0313          	mv	t1,s6
   1b3f8:	000d8793          	mv	a5,s11
   1b3fc:	48071c63          	bnez	a4,1b894 <_vfiprintf_r+0xf7c>
   1b400:	010e7693          	andi	a3,t3,16
   1b404:	000d2703          	lw	a4,0(s10)
   1b408:	004d0613          	addi	a2,s10,4
   1b40c:	48069863          	bnez	a3,1b89c <_vfiprintf_r+0xf84>
   1b410:	040e7693          	andi	a3,t3,64
   1b414:	76068463          	beqz	a3,1bb7c <_vfiprintf_r+0x1264>
   1b418:	01071713          	slli	a4,a4,0x10
   1b41c:	01075713          	srli	a4,a4,0x10
   1b420:	00060d13          	mv	s10,a2
   1b424:	000e0b93          	mv	s7,t3
   1b428:	00000693          	li	a3,0
   1b42c:	cb5ff06f          	j	1b0e0 <_vfiprintf_r+0x7c8>
   1b430:	020e7713          	andi	a4,t3,32
   1b434:	000d8793          	mv	a5,s11
   1b438:	44071263          	bnez	a4,1b87c <_vfiprintf_r+0xf64>
   1b43c:	010e7713          	andi	a4,t3,16
   1b440:	6e071263          	bnez	a4,1bb24 <_vfiprintf_r+0x120c>
   1b444:	040e7713          	andi	a4,t3,64
   1b448:	0a0710e3          	bnez	a4,1bce8 <_vfiprintf_r+0x13d0>
   1b44c:	200e7e13          	andi	t3,t3,512
   1b450:	6c0e0a63          	beqz	t3,1bb24 <_vfiprintf_r+0x120c>
   1b454:	000d2703          	lw	a4,0(s10)
   1b458:	004d0d13          	addi	s10,s10,4
   1b45c:	01370023          	sb	s3,0(a4)
   1b460:	d98ff06f          	j	1a9f8 <_vfiprintf_r+0xe0>
   1b464:	000c4683          	lbu	a3,0(s8)
   1b468:	06c00713          	li	a4,108
   1b46c:	6ae68463          	beq	a3,a4,1bb14 <_vfiprintf_r+0x11fc>
   1b470:	010e6e13          	ori	t3,t3,16
   1b474:	e00ff06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1b478:	41730b33          	sub	s6,t1,s7
   1b47c:	f1605063          	blez	s6,1ab7c <_vfiprintf_r+0x264>
   1b480:	00023eb7          	lui	t4,0x23
   1b484:	01000f13          	li	t5,16
   1b488:	b60e8e93          	addi	t4,t4,-1184 # 22b60 <zeroes.0>
   1b48c:	096f5a63          	bge	t5,s6,1b520 <_vfiprintf_r+0xc08>
   1b490:	01712623          	sw	s7,12(sp)
   1b494:	000f0293          	mv	t0,t5
   1b498:	00700f93          	li	t6,7
   1b49c:	00612423          	sw	t1,8(sp)
   1b4a0:	01012823          	sw	a6,16(sp)
   1b4a4:	01c12e23          	sw	t3,28(sp)
   1b4a8:	000e8b93          	mv	s7,t4
   1b4ac:	00c0006f          	j	1b4b8 <_vfiprintf_r+0xba0>
   1b4b0:	ff0b0b13          	addi	s6,s6,-16
   1b4b4:	0562dc63          	bge	t0,s6,1b50c <_vfiprintf_r+0xbf4>
   1b4b8:	01068693          	addi	a3,a3,16
   1b4bc:	00170713          	addi	a4,a4,1
   1b4c0:	0177a023          	sw	s7,0(a5)
   1b4c4:	01e7a223          	sw	t5,4(a5)
   1b4c8:	04d12423          	sw	a3,72(sp)
   1b4cc:	04e12223          	sw	a4,68(sp)
   1b4d0:	00878793          	addi	a5,a5,8
   1b4d4:	fcefdee3          	bge	t6,a4,1b4b0 <_vfiprintf_r+0xb98>
   1b4d8:	00012583          	lw	a1,0(sp)
   1b4dc:	04010613          	addi	a2,sp,64
   1b4e0:	000a0513          	mv	a0,s4
   1b4e4:	811f90ef          	jal	14cf4 <__sprint_r>
   1b4e8:	ee051c63          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b4ec:	01000293          	li	t0,16
   1b4f0:	ff0b0b13          	addi	s6,s6,-16
   1b4f4:	04812683          	lw	a3,72(sp)
   1b4f8:	04412703          	lw	a4,68(sp)
   1b4fc:	000a8793          	mv	a5,s5
   1b500:	00700f93          	li	t6,7
   1b504:	00028f13          	mv	t5,t0
   1b508:	fb62c8e3          	blt	t0,s6,1b4b8 <_vfiprintf_r+0xba0>
   1b50c:	000b8e93          	mv	t4,s7
   1b510:	00812303          	lw	t1,8(sp)
   1b514:	01012803          	lw	a6,16(sp)
   1b518:	01c12e03          	lw	t3,28(sp)
   1b51c:	00c12b83          	lw	s7,12(sp)
   1b520:	016686b3          	add	a3,a3,s6
   1b524:	00170713          	addi	a4,a4,1
   1b528:	01d7a023          	sw	t4,0(a5)
   1b52c:	0167a223          	sw	s6,4(a5)
   1b530:	04d12423          	sw	a3,72(sp)
   1b534:	04e12223          	sw	a4,68(sp)
   1b538:	00700613          	li	a2,7
   1b53c:	00878793          	addi	a5,a5,8
   1b540:	e2e65e63          	bge	a2,a4,1ab7c <_vfiprintf_r+0x264>
   1b544:	00012583          	lw	a1,0(sp)
   1b548:	04010613          	addi	a2,sp,64
   1b54c:	000a0513          	mv	a0,s4
   1b550:	01c12823          	sw	t3,16(sp)
   1b554:	01012623          	sw	a6,12(sp)
   1b558:	00612423          	sw	t1,8(sp)
   1b55c:	f98f90ef          	jal	14cf4 <__sprint_r>
   1b560:	e8051063          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b564:	41bc8cb3          	sub	s9,s9,s11
   1b568:	04812683          	lw	a3,72(sp)
   1b56c:	04412703          	lw	a4,68(sp)
   1b570:	01012e03          	lw	t3,16(sp)
   1b574:	00c12803          	lw	a6,12(sp)
   1b578:	00812303          	lw	t1,8(sp)
   1b57c:	000a8793          	mv	a5,s5
   1b580:	e1905263          	blez	s9,1ab84 <_vfiprintf_r+0x26c>
   1b584:	00023eb7          	lui	t4,0x23
   1b588:	b60e8e93          	addi	t4,t4,-1184 # 22b60 <zeroes.0>
   1b58c:	0994d863          	bge	s1,s9,1b61c <_vfiprintf_r+0xd04>
   1b590:	01712623          	sw	s7,12(sp)
   1b594:	000c8b13          	mv	s6,s9
   1b598:	00612423          	sw	t1,8(sp)
   1b59c:	000c0c93          	mv	s9,s8
   1b5a0:	01012823          	sw	a6,16(sp)
   1b5a4:	000e0c13          	mv	s8,t3
   1b5a8:	000e8b93          	mv	s7,t4
   1b5ac:	00c0006f          	j	1b5b8 <_vfiprintf_r+0xca0>
   1b5b0:	ff0b0b13          	addi	s6,s6,-16
   1b5b4:	0564d663          	bge	s1,s6,1b600 <_vfiprintf_r+0xce8>
   1b5b8:	01068693          	addi	a3,a3,16
   1b5bc:	00170713          	addi	a4,a4,1
   1b5c0:	0177a023          	sw	s7,0(a5)
   1b5c4:	0097a223          	sw	s1,4(a5)
   1b5c8:	04d12423          	sw	a3,72(sp)
   1b5cc:	04e12223          	sw	a4,68(sp)
   1b5d0:	00878793          	addi	a5,a5,8
   1b5d4:	fce95ee3          	bge	s2,a4,1b5b0 <_vfiprintf_r+0xc98>
   1b5d8:	00012583          	lw	a1,0(sp)
   1b5dc:	04010613          	addi	a2,sp,64
   1b5e0:	000a0513          	mv	a0,s4
   1b5e4:	f10f90ef          	jal	14cf4 <__sprint_r>
   1b5e8:	de051c63          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b5ec:	ff0b0b13          	addi	s6,s6,-16
   1b5f0:	04812683          	lw	a3,72(sp)
   1b5f4:	04412703          	lw	a4,68(sp)
   1b5f8:	000a8793          	mv	a5,s5
   1b5fc:	fb64cee3          	blt	s1,s6,1b5b8 <_vfiprintf_r+0xca0>
   1b600:	000b8e93          	mv	t4,s7
   1b604:	00812303          	lw	t1,8(sp)
   1b608:	01012803          	lw	a6,16(sp)
   1b60c:	00c12b83          	lw	s7,12(sp)
   1b610:	000c0e13          	mv	t3,s8
   1b614:	000c8c13          	mv	s8,s9
   1b618:	000b0c93          	mv	s9,s6
   1b61c:	019686b3          	add	a3,a3,s9
   1b620:	00170713          	addi	a4,a4,1
   1b624:	01d7a023          	sw	t4,0(a5)
   1b628:	0197a223          	sw	s9,4(a5)
   1b62c:	04d12423          	sw	a3,72(sp)
   1b630:	04e12223          	sw	a4,68(sp)
   1b634:	00878793          	addi	a5,a5,8
   1b638:	d4e95663          	bge	s2,a4,1ab84 <_vfiprintf_r+0x26c>
   1b63c:	00012583          	lw	a1,0(sp)
   1b640:	04010613          	addi	a2,sp,64
   1b644:	000a0513          	mv	a0,s4
   1b648:	01c12823          	sw	t3,16(sp)
   1b64c:	01012623          	sw	a6,12(sp)
   1b650:	00612423          	sw	t1,8(sp)
   1b654:	ea0f90ef          	jal	14cf4 <__sprint_r>
   1b658:	d8051463          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b65c:	04812683          	lw	a3,72(sp)
   1b660:	04412703          	lw	a4,68(sp)
   1b664:	00c12803          	lw	a6,12(sp)
   1b668:	000a8793          	mv	a5,s5
   1b66c:	00dd86b3          	add	a3,s11,a3
   1b670:	00170713          	addi	a4,a4,1
   1b674:	0107a023          	sw	a6,0(a5)
   1b678:	01b7a223          	sw	s11,4(a5)
   1b67c:	04d12423          	sw	a3,72(sp)
   1b680:	04e12223          	sw	a4,68(sp)
   1b684:	01012e03          	lw	t3,16(sp)
   1b688:	00812303          	lw	t1,8(sp)
   1b68c:	00878793          	addi	a5,a5,8
   1b690:	d0e95a63          	bge	s2,a4,1aba4 <_vfiprintf_r+0x28c>
   1b694:	00012583          	lw	a1,0(sp)
   1b698:	04010613          	addi	a2,sp,64
   1b69c:	000a0513          	mv	a0,s4
   1b6a0:	01c12623          	sw	t3,12(sp)
   1b6a4:	00612423          	sw	t1,8(sp)
   1b6a8:	e4cf90ef          	jal	14cf4 <__sprint_r>
   1b6ac:	d2051a63          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b6b0:	04812683          	lw	a3,72(sp)
   1b6b4:	00c12e03          	lw	t3,12(sp)
   1b6b8:	00812303          	lw	t1,8(sp)
   1b6bc:	000a8793          	mv	a5,s5
   1b6c0:	ce4ff06f          	j	1aba4 <_vfiprintf_r+0x28c>
   1b6c4:	00012583          	lw	a1,0(sp)
   1b6c8:	04010613          	addi	a2,sp,64
   1b6cc:	000a0513          	mv	a0,s4
   1b6d0:	e24f90ef          	jal	14cf4 <__sprint_r>
   1b6d4:	ce050863          	beqz	a0,1abc4 <_vfiprintf_r+0x2ac>
   1b6d8:	d08ff06f          	j	1abe0 <_vfiprintf_r+0x2c8>
   1b6dc:	00012583          	lw	a1,0(sp)
   1b6e0:	04010613          	addi	a2,sp,64
   1b6e4:	000a0513          	mv	a0,s4
   1b6e8:	01c12e23          	sw	t3,28(sp)
   1b6ec:	01012823          	sw	a6,16(sp)
   1b6f0:	01e12623          	sw	t5,12(sp)
   1b6f4:	00612423          	sw	t1,8(sp)
   1b6f8:	dfcf90ef          	jal	14cf4 <__sprint_r>
   1b6fc:	ce051263          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b700:	04812683          	lw	a3,72(sp)
   1b704:	04412703          	lw	a4,68(sp)
   1b708:	01c12e03          	lw	t3,28(sp)
   1b70c:	01012803          	lw	a6,16(sp)
   1b710:	00c12f03          	lw	t5,12(sp)
   1b714:	00812303          	lw	t1,8(sp)
   1b718:	000a8793          	mv	a5,s5
   1b71c:	c58ff06f          	j	1ab74 <_vfiprintf_r+0x25c>
   1b720:	01271693          	slli	a3,a4,0x12
   1b724:	6006c663          	bltz	a3,1bd30 <_vfiprintf_r+0x1418>
   1b728:	12812423          	sw	s0,296(sp)
   1b72c:	a60ff06f          	j	1a98c <_vfiprintf_r+0x74>
   1b730:	0f010713          	addi	a4,sp,240
   1b734:	41070db3          	sub	s11,a4,a6
   1b738:	000c8b93          	mv	s7,s9
   1b73c:	bbbcda63          	bge	s9,s11,1aaf0 <_vfiprintf_r+0x1d8>
   1b740:	000d8b93          	mv	s7,s11
   1b744:	bacff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1b748:	00000e93          	li	t4,0
   1b74c:	00023f37          	lui	t5,0x23
   1b750:	01000f93          	li	t6,16
   1b754:	00058693          	mv	a3,a1
   1b758:	00060713          	mv	a4,a2
   1b75c:	b70f0f13          	addi	t5,t5,-1168 # 22b70 <blanks.1>
   1b760:	096fde63          	bge	t6,s6,1b7fc <_vfiprintf_r+0xee4>
   1b764:	01712623          	sw	s7,12(sp)
   1b768:	000f8393          	mv	t2,t6
   1b76c:	00700293          	li	t0,7
   1b770:	00612423          	sw	t1,8(sp)
   1b774:	01d12823          	sw	t4,16(sp)
   1b778:	01012e23          	sw	a6,28(sp)
   1b77c:	03c12023          	sw	t3,32(sp)
   1b780:	000f0b93          	mv	s7,t5
   1b784:	00c0006f          	j	1b790 <_vfiprintf_r+0xe78>
   1b788:	ff0b0b13          	addi	s6,s6,-16
   1b78c:	0563dc63          	bge	t2,s6,1b7e4 <_vfiprintf_r+0xecc>
   1b790:	01068693          	addi	a3,a3,16
   1b794:	00170713          	addi	a4,a4,1
   1b798:	0177a023          	sw	s7,0(a5)
   1b79c:	01f7a223          	sw	t6,4(a5)
   1b7a0:	04d12423          	sw	a3,72(sp)
   1b7a4:	04e12223          	sw	a4,68(sp)
   1b7a8:	00878793          	addi	a5,a5,8
   1b7ac:	fce2dee3          	bge	t0,a4,1b788 <_vfiprintf_r+0xe70>
   1b7b0:	00012583          	lw	a1,0(sp)
   1b7b4:	04010613          	addi	a2,sp,64
   1b7b8:	000a0513          	mv	a0,s4
   1b7bc:	d38f90ef          	jal	14cf4 <__sprint_r>
   1b7c0:	c2051063          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1b7c4:	01000393          	li	t2,16
   1b7c8:	ff0b0b13          	addi	s6,s6,-16
   1b7cc:	04812683          	lw	a3,72(sp)
   1b7d0:	04412703          	lw	a4,68(sp)
   1b7d4:	000a8793          	mv	a5,s5
   1b7d8:	00700293          	li	t0,7
   1b7dc:	00038f93          	mv	t6,t2
   1b7e0:	fb63c8e3          	blt	t2,s6,1b790 <_vfiprintf_r+0xe78>
   1b7e4:	000b8f13          	mv	t5,s7
   1b7e8:	00812303          	lw	t1,8(sp)
   1b7ec:	01012e83          	lw	t4,16(sp)
   1b7f0:	01c12803          	lw	a6,28(sp)
   1b7f4:	02012e03          	lw	t3,32(sp)
   1b7f8:	00c12b83          	lw	s7,12(sp)
   1b7fc:	00db06b3          	add	a3,s6,a3
   1b800:	00170713          	addi	a4,a4,1
   1b804:	04d12423          	sw	a3,72(sp)
   1b808:	04e12223          	sw	a4,68(sp)
   1b80c:	01e7a023          	sw	t5,0(a5)
   1b810:	0167a223          	sw	s6,4(a5)
   1b814:	00700613          	li	a2,7
   1b818:	26e64063          	blt	a2,a4,1ba78 <_vfiprintf_r+0x1160>
   1b81c:	03b14603          	lbu	a2,59(sp)
   1b820:	00878793          	addi	a5,a5,8
   1b824:	02061e63          	bnez	a2,1b860 <_vfiprintf_r+0xf48>
   1b828:	b40e8a63          	beqz	t4,1ab7c <_vfiprintf_r+0x264>
   1b82c:	00000f13          	li	t5,0
   1b830:	b1cff06f          	j	1ab4c <_vfiprintf_r+0x234>
   1b834:	00100d93          	li	s11,1
   1b838:	0ef10813          	addi	a6,sp,239
   1b83c:	ab4ff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1b840:	8a0c9ce3          	bnez	s9,1b0f8 <_vfiprintf_r+0x7e0>
   1b844:	001bfb93          	andi	s7,s7,1
   1b848:	220b8263          	beqz	s7,1ba6c <_vfiprintf_r+0x1154>
   1b84c:	03000713          	li	a4,48
   1b850:	0ee107a3          	sb	a4,239(sp)
   1b854:	000b8d93          	mv	s11,s7
   1b858:	0ef10813          	addi	a6,sp,239
   1b85c:	a94ff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1b860:	00000f13          	li	t5,0
   1b864:	abcff06f          	j	1ab20 <_vfiprintf_r+0x208>
   1b868:	000d2d83          	lw	s11,0(s10)
   1b86c:	00060d13          	mv	s10,a2
   1b870:	41fdde93          	srai	t4,s11,0x1f
   1b874:	000e8693          	mv	a3,t4
   1b878:	dc4ff06f          	j	1ae3c <_vfiprintf_r+0x524>
   1b87c:	000d2703          	lw	a4,0(s10)
   1b880:	41f9d693          	srai	a3,s3,0x1f
   1b884:	004d0d13          	addi	s10,s10,4
   1b888:	01372023          	sw	s3,0(a4)
   1b88c:	00d72223          	sw	a3,4(a4)
   1b890:	968ff06f          	j	1a9f8 <_vfiprintf_r+0xe0>
   1b894:	000e0b93          	mv	s7,t3
   1b898:	835ff06f          	j	1b0cc <_vfiprintf_r+0x7b4>
   1b89c:	000e0b93          	mv	s7,t3
   1b8a0:	000d2703          	lw	a4,0(s10)
   1b8a4:	00000693          	li	a3,0
   1b8a8:	00060d13          	mv	s10,a2
   1b8ac:	835ff06f          	j	1b0e0 <_vfiprintf_r+0x7c8>
   1b8b0:	02010da3          	sb	zero,59(sp)
   1b8b4:	000d2d83          	lw	s11,0(s10)
   1b8b8:	00000e93          	li	t4,0
   1b8bc:	8e0ccee3          	bltz	s9,1b1b8 <_vfiprintf_r+0x8a0>
   1b8c0:	f7fe7e13          	andi	t3,t3,-129
   1b8c4:	00060d13          	mv	s10,a2
   1b8c8:	d80d9663          	bnez	s11,1ae54 <_vfiprintf_r+0x53c>
   1b8cc:	920c8ee3          	beqz	s9,1b208 <_vfiprintf_r+0x8f0>
   1b8d0:	00000d93          	li	s11,0
   1b8d4:	d88ff06f          	j	1ae5c <_vfiprintf_r+0x544>
   1b8d8:	00022537          	lui	a0,0x22
   1b8dc:	00f77593          	andi	a1,a4,15
   1b8e0:	44850613          	addi	a2,a0,1096 # 22448 <__clzsi2+0xa8>
   1b8e4:	00b60633          	add	a2,a2,a1
   1b8e8:	00064603          	lbu	a2,0(a2)
   1b8ec:	00475713          	srli	a4,a4,0x4
   1b8f0:	002e6e13          	ori	t3,t3,2
   1b8f4:	0ec107a3          	sb	a2,239(sp)
   1b8f8:	00000613          	li	a2,0
   1b8fc:	46070c63          	beqz	a4,1bd74 <_vfiprintf_r+0x145c>
   1b900:	00068d13          	mv	s10,a3
   1b904:	44850513          	addi	a0,a0,1096
   1b908:	00200b93          	li	s7,2
   1b90c:	a71ff06f          	j	1b37c <_vfiprintf_r+0xa64>
   1b910:	000d8b93          	mv	s7,s11
   1b914:	83dff06f          	j	1b150 <_vfiprintf_r+0x838>
   1b918:	fff00c93          	li	s9,-1
   1b91c:	00058c13          	mv	s8,a1
   1b920:	958ff06f          	j	1aa78 <_vfiprintf_r+0x160>
   1b924:	340c8c63          	beqz	s9,1bc7c <_vfiprintf_r+0x1364>
   1b928:	03000713          	li	a4,48
   1b92c:	d38ff06f          	j	1ae64 <_vfiprintf_r+0x54c>
   1b930:	00022537          	lui	a0,0x22
   1b934:	020e7713          	andi	a4,t3,32
   1b938:	000b0313          	mv	t1,s6
   1b93c:	000d8793          	mv	a5,s11
   1b940:	45c50513          	addi	a0,a0,1116 # 2245c <__clzsi2+0xbc>
   1b944:	06070463          	beqz	a4,1b9ac <_vfiprintf_r+0x1094>
   1b948:	007d0613          	addi	a2,s10,7
   1b94c:	ff867613          	andi	a2,a2,-8
   1b950:	00062703          	lw	a4,0(a2)
   1b954:	00860d13          	addi	s10,a2,8
   1b958:	00462603          	lw	a2,4(a2)
   1b95c:	001e7b93          	andi	s7,t3,1
   1b960:	0a0b8863          	beqz	s7,1ba10 <_vfiprintf_r+0x10f8>
   1b964:	00c765b3          	or	a1,a4,a2
   1b968:	16059263          	bnez	a1,1bacc <_vfiprintf_r+0x11b4>
   1b96c:	02010da3          	sb	zero,59(sp)
   1b970:	2e0cc263          	bltz	s9,1bc54 <_vfiprintf_r+0x133c>
   1b974:	b7fe7e13          	andi	t3,t3,-1153
   1b978:	880c86e3          	beqz	s9,1b204 <_vfiprintf_r+0x8ec>
   1b97c:	00054703          	lbu	a4,0(a0)
   1b980:	000b8d93          	mv	s11,s7
   1b984:	0ef10813          	addi	a6,sp,239
   1b988:	0ee107a3          	sb	a4,239(sp)
   1b98c:	000c8b93          	mv	s7,s9
   1b990:	fc4ff06f          	j	1b154 <_vfiprintf_r+0x83c>
   1b994:	00022537          	lui	a0,0x22
   1b998:	020e7713          	andi	a4,t3,32
   1b99c:	000b0313          	mv	t1,s6
   1b9a0:	000d8793          	mv	a5,s11
   1b9a4:	44850513          	addi	a0,a0,1096 # 22448 <__clzsi2+0xa8>
   1b9a8:	fa0710e3          	bnez	a4,1b948 <_vfiprintf_r+0x1030>
   1b9ac:	010e7613          	andi	a2,t3,16
   1b9b0:	000d2703          	lw	a4,0(s10)
   1b9b4:	004d0d13          	addi	s10,s10,4
   1b9b8:	08061863          	bnez	a2,1ba48 <_vfiprintf_r+0x1130>
   1b9bc:	040e7613          	andi	a2,t3,64
   1b9c0:	08060063          	beqz	a2,1ba40 <_vfiprintf_r+0x1128>
   1b9c4:	01071713          	slli	a4,a4,0x10
   1b9c8:	01075713          	srli	a4,a4,0x10
   1b9cc:	00000613          	li	a2,0
   1b9d0:	f8dff06f          	j	1b95c <_vfiprintf_r+0x1044>
   1b9d4:	00080513          	mv	a0,a6
   1b9d8:	01012423          	sw	a6,8(sp)
   1b9dc:	b34fa0ef          	jal	15d10 <strlen>
   1b9e0:	03b14703          	lbu	a4,59(sp)
   1b9e4:	fff54b93          	not	s7,a0
   1b9e8:	41fbdb93          	srai	s7,s7,0x1f
   1b9ec:	00812803          	lw	a6,8(sp)
   1b9f0:	00c12303          	lw	t1,12(sp)
   1b9f4:	01012e03          	lw	t3,16(sp)
   1b9f8:	01c12783          	lw	a5,28(sp)
   1b9fc:	00050d93          	mv	s11,a0
   1ba00:	01757bb3          	and	s7,a0,s7
   1ba04:	d0071663          	bnez	a4,1af10 <_vfiprintf_r+0x5f8>
   1ba08:	00000c93          	li	s9,0
   1ba0c:	8e4ff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1ba10:	02010da3          	sb	zero,59(sp)
   1ba14:	040cc063          	bltz	s9,1ba54 <_vfiprintf_r+0x113c>
   1ba18:	00c766b3          	or	a3,a4,a2
   1ba1c:	b7fe7e13          	andi	t3,t3,-1153
   1ba20:	0c069663          	bnez	a3,1baec <_vfiprintf_r+0x11d4>
   1ba24:	220c8263          	beqz	s9,1bc48 <_vfiprintf_r+0x1330>
   1ba28:	00054703          	lbu	a4,0(a0)
   1ba2c:	000c8b93          	mv	s7,s9
   1ba30:	00100d93          	li	s11,1
   1ba34:	0ee107a3          	sb	a4,239(sp)
   1ba38:	0ef10813          	addi	a6,sp,239
   1ba3c:	f18ff06f          	j	1b154 <_vfiprintf_r+0x83c>
   1ba40:	200e7613          	andi	a2,t3,512
   1ba44:	2a061a63          	bnez	a2,1bcf8 <_vfiprintf_r+0x13e0>
   1ba48:	00000613          	li	a2,0
   1ba4c:	f11ff06f          	j	1b95c <_vfiprintf_r+0x1044>
   1ba50:	002e6e13          	ori	t3,t3,2
   1ba54:	00f77693          	andi	a3,a4,15
   1ba58:	00d506b3          	add	a3,a0,a3
   1ba5c:	002e7b93          	andi	s7,t3,2
   1ba60:	0006c683          	lbu	a3,0(a3)
   1ba64:	bffe7e13          	andi	t3,t3,-1025
   1ba68:	8f9ff06f          	j	1b360 <_vfiprintf_r+0xa48>
   1ba6c:	00000d93          	li	s11,0
   1ba70:	0f010813          	addi	a6,sp,240
   1ba74:	87cff06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1ba78:	00012583          	lw	a1,0(sp)
   1ba7c:	04010613          	addi	a2,sp,64
   1ba80:	000a0513          	mv	a0,s4
   1ba84:	01c12e23          	sw	t3,28(sp)
   1ba88:	01012823          	sw	a6,16(sp)
   1ba8c:	01d12623          	sw	t4,12(sp)
   1ba90:	00612423          	sw	t1,8(sp)
   1ba94:	a60f90ef          	jal	14cf4 <__sprint_r>
   1ba98:	00050f13          	mv	t5,a0
   1ba9c:	94051263          	bnez	a0,1abe0 <_vfiprintf_r+0x2c8>
   1baa0:	03b14783          	lbu	a5,59(sp)
   1baa4:	04812683          	lw	a3,72(sp)
   1baa8:	04412703          	lw	a4,68(sp)
   1baac:	00812303          	lw	t1,8(sp)
   1bab0:	00c12e83          	lw	t4,12(sp)
   1bab4:	01012803          	lw	a6,16(sp)
   1bab8:	01c12e03          	lw	t3,28(sp)
   1babc:	0a079c63          	bnez	a5,1bb74 <_vfiprintf_r+0x125c>
   1bac0:	000a8793          	mv	a5,s5
   1bac4:	880e9463          	bnez	t4,1ab4c <_vfiprintf_r+0x234>
   1bac8:	8b4ff06f          	j	1ab7c <_vfiprintf_r+0x264>
   1bacc:	03000593          	li	a1,48
   1bad0:	02d10ea3          	sb	a3,61(sp)
   1bad4:	02010da3          	sb	zero,59(sp)
   1bad8:	02b10e23          	sb	a1,60(sp)
   1badc:	f60ccae3          	bltz	s9,1ba50 <_vfiprintf_r+0x1138>
   1bae0:	b7fe7e13          	andi	t3,t3,-1153
   1bae4:	002e6e13          	ori	t3,t3,2
   1bae8:	00200b93          	li	s7,2
   1baec:	00f77693          	andi	a3,a4,15
   1baf0:	00d506b3          	add	a3,a0,a3
   1baf4:	0006c683          	lbu	a3,0(a3)
   1baf8:	869ff06f          	j	1b360 <_vfiprintf_r+0xa48>
   1bafc:	a3df40ef          	jal	10538 <__sinit>
   1bb00:	e51fe06f          	j	1a950 <_vfiprintf_r+0x38>
   1bb04:	001c4683          	lbu	a3,1(s8)
   1bb08:	200e6e13          	ori	t3,t3,512
   1bb0c:	001c0c13          	addi	s8,s8,1
   1bb10:	f65fe06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1bb14:	001c4683          	lbu	a3,1(s8)
   1bb18:	020e6e13          	ori	t3,t3,32
   1bb1c:	001c0c13          	addi	s8,s8,1
   1bb20:	f55fe06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1bb24:	000d2703          	lw	a4,0(s10)
   1bb28:	004d0d13          	addi	s10,s10,4
   1bb2c:	01372023          	sw	s3,0(a4)
   1bb30:	ec9fe06f          	j	1a9f8 <_vfiprintf_r+0xe0>
   1bb34:	00600713          	li	a4,6
   1bb38:	000c8b93          	mv	s7,s9
   1bb3c:	15976c63          	bltu	a4,s9,1bc94 <_vfiprintf_r+0x137c>
   1bb40:	00022837          	lui	a6,0x22
   1bb44:	47080813          	addi	a6,a6,1136 # 22470 <__clzsi2+0xd0>
   1bb48:	000b8d93          	mv	s11,s7
   1bb4c:	00000c93          	li	s9,0
   1bb50:	fa1fe06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1bb54:	140c8463          	beqz	s9,1bc9c <_vfiprintf_r+0x1384>
   1bb58:	03000713          	li	a4,48
   1bb5c:	0ee107a3          	sb	a4,239(sp)
   1bb60:	00068d13          	mv	s10,a3
   1bb64:	000c8713          	mv	a4,s9
   1bb68:	0ef10813          	addi	a6,sp,239
   1bb6c:	00100d93          	li	s11,1
   1bb70:	855ff06f          	j	1b3c4 <_vfiprintf_r+0xaac>
   1bb74:	000a8793          	mv	a5,s5
   1bb78:	fa9fe06f          	j	1ab20 <_vfiprintf_r+0x208>
   1bb7c:	200e7693          	andi	a3,t3,512
   1bb80:	14068c63          	beqz	a3,1bcd8 <_vfiprintf_r+0x13c0>
   1bb84:	0ff77713          	zext.b	a4,a4
   1bb88:	00060d13          	mv	s10,a2
   1bb8c:	000e0b93          	mv	s7,t3
   1bb90:	00000693          	li	a3,0
   1bb94:	d4cff06f          	j	1b0e0 <_vfiprintf_r+0x7c8>
   1bb98:	200e7693          	andi	a3,t3,512
   1bb9c:	12068463          	beqz	a3,1bcc4 <_vfiprintf_r+0x13ac>
   1bba0:	01871d93          	slli	s11,a4,0x18
   1bba4:	418ddd93          	srai	s11,s11,0x18
   1bba8:	41fdde93          	srai	t4,s11,0x1f
   1bbac:	00060d13          	mv	s10,a2
   1bbb0:	000e8693          	mv	a3,t4
   1bbb4:	a88ff06f          	j	1ae3c <_vfiprintf_r+0x524>
   1bbb8:	200e7713          	andi	a4,t3,512
   1bbbc:	02010da3          	sb	zero,59(sp)
   1bbc0:	0e071863          	bnez	a4,1bcb0 <_vfiprintf_r+0x1398>
   1bbc4:	00068d93          	mv	s11,a3
   1bbc8:	00000e93          	li	t4,0
   1bbcc:	de0cc663          	bltz	s9,1b1b8 <_vfiprintf_r+0x8a0>
   1bbd0:	f7fe7e13          	andi	t3,t3,-129
   1bbd4:	00060d13          	mv	s10,a2
   1bbd8:	a6069e63          	bnez	a3,1ae54 <_vfiprintf_r+0x53c>
   1bbdc:	ce0c9ae3          	bnez	s9,1b8d0 <_vfiprintf_r+0xfb8>
   1bbe0:	e24ff06f          	j	1b204 <_vfiprintf_r+0x8ec>
   1bbe4:	01412603          	lw	a2,20(sp)
   1bbe8:	01812583          	lw	a1,24(sp)
   1bbec:	00100b93          	li	s7,1
   1bbf0:	40cb09b3          	sub	s3,s6,a2
   1bbf4:	00098513          	mv	a0,s3
   1bbf8:	cf1f90ef          	jal	158e8 <strncpy>
   1bbfc:	00412703          	lw	a4,4(sp)
   1bc00:	000c0513          	mv	a0,s8
   1bc04:	000c8593          	mv	a1,s9
   1bc08:	00174783          	lbu	a5,1(a4)
   1bc0c:	00a00613          	li	a2,10
   1bc10:	00000693          	li	a3,0
   1bc14:	00f037b3          	snez	a5,a5
   1bc18:	00f707b3          	add	a5,a4,a5
   1bc1c:	00f12223          	sw	a5,4(sp)
   1bc20:	3b9000ef          	jal	1c7d8 <__udivdi3>
   1bc24:	00a00613          	li	a2,10
   1bc28:	00000693          	li	a3,0
   1bc2c:	00050c13          	mv	s8,a0
   1bc30:	00058c93          	mv	s9,a1
   1bc34:	16c010ef          	jal	1cda0 <__umoddi3>
   1bc38:	03050793          	addi	a5,a0,48
   1bc3c:	fff98b13          	addi	s6,s3,-1
   1bc40:	fef98fa3          	sb	a5,-1(s3)
   1bc44:	bf8ff06f          	j	1b03c <_vfiprintf_r+0x724>
   1bc48:	00000d93          	li	s11,0
   1bc4c:	0f010813          	addi	a6,sp,240
   1bc50:	d04ff06f          	j	1b154 <_vfiprintf_r+0x83c>
   1bc54:	00054703          	lbu	a4,0(a0)
   1bc58:	bffe7e13          	andi	t3,t3,-1025
   1bc5c:	000b8d93          	mv	s11,s7
   1bc60:	0ee107a3          	sb	a4,239(sp)
   1bc64:	0ef10813          	addi	a6,sp,239
   1bc68:	cecff06f          	j	1b154 <_vfiprintf_r+0x83c>
   1bc6c:	00c12783          	lw	a5,12(sp)
   1bc70:	00900693          	li	a3,9
   1bc74:	b8f6ee63          	bltu	a3,a5,1b010 <_vfiprintf_r+0x6f8>
   1bc78:	be4ff06f          	j	1b05c <_vfiprintf_r+0x744>
   1bc7c:	03b14703          	lbu	a4,59(sp)
   1bc80:	00000d93          	li	s11,0
   1bc84:	0f010813          	addi	a6,sp,240
   1bc88:	00100b93          	li	s7,1
   1bc8c:	9e071e63          	bnez	a4,1ae88 <_vfiprintf_r+0x570>
   1bc90:	d78ff06f          	j	1b208 <_vfiprintf_r+0x8f0>
   1bc94:	00070b93          	mv	s7,a4
   1bc98:	ea9ff06f          	j	1bb40 <_vfiprintf_r+0x1228>
   1bc9c:	00068d13          	mv	s10,a3
   1bca0:	00000d93          	li	s11,0
   1bca4:	00000713          	li	a4,0
   1bca8:	0f010813          	addi	a6,sp,240
   1bcac:	f18ff06f          	j	1b3c4 <_vfiprintf_r+0xaac>
   1bcb0:	0ff6fd93          	zext.b	s11,a3
   1bcb4:	00000e93          	li	t4,0
   1bcb8:	c00cd4e3          	bgez	s9,1b8c0 <_vfiprintf_r+0xfa8>
   1bcbc:	00060d13          	mv	s10,a2
   1bcc0:	994ff06f          	j	1ae54 <_vfiprintf_r+0x53c>
   1bcc4:	41f75e93          	srai	t4,a4,0x1f
   1bcc8:	00070d93          	mv	s11,a4
   1bccc:	00060d13          	mv	s10,a2
   1bcd0:	000e8693          	mv	a3,t4
   1bcd4:	968ff06f          	j	1ae3c <_vfiprintf_r+0x524>
   1bcd8:	00060d13          	mv	s10,a2
   1bcdc:	000e0b93          	mv	s7,t3
   1bce0:	00000693          	li	a3,0
   1bce4:	bfcff06f          	j	1b0e0 <_vfiprintf_r+0x7c8>
   1bce8:	000d2703          	lw	a4,0(s10)
   1bcec:	004d0d13          	addi	s10,s10,4
   1bcf0:	01371023          	sh	s3,0(a4)
   1bcf4:	d05fe06f          	j	1a9f8 <_vfiprintf_r+0xe0>
   1bcf8:	0ff77713          	zext.b	a4,a4
   1bcfc:	00000613          	li	a2,0
   1bd00:	c5dff06f          	j	1b95c <_vfiprintf_r+0x1044>
   1bd04:	00012583          	lw	a1,0(sp)
   1bd08:	000a0513          	mv	a0,s4
   1bd0c:	04010613          	addi	a2,sp,64
   1bd10:	fe5f80ef          	jal	14cf4 <__sprint_r>
   1bd14:	ecdfe06f          	j	1abe0 <_vfiprintf_r+0x2c8>
   1bd18:	02070063          	beqz	a4,1bd38 <_vfiprintf_r+0x1420>
   1bd1c:	001c8b93          	addi	s7,s9,1
   1bd20:	000c8d93          	mv	s11,s9
   1bd24:	00000c93          	li	s9,0
   1bd28:	960ff06f          	j	1ae88 <_vfiprintf_r+0x570>
   1bd2c:	12812403          	lw	s0,296(sp)
   1bd30:	fff00993          	li	s3,-1
   1bd34:	ee1fe06f          	j	1ac14 <_vfiprintf_r+0x2fc>
   1bd38:	000c8d93          	mv	s11,s9
   1bd3c:	000c8b93          	mv	s7,s9
   1bd40:	00000c93          	li	s9,0
   1bd44:	dadfe06f          	j	1aaf0 <_vfiprintf_r+0x1d8>
   1bd48:	000d2c83          	lw	s9,0(s10)
   1bd4c:	004d0d13          	addi	s10,s10,4
   1bd50:	000cd463          	bgez	s9,1bd58 <_vfiprintf_r+0x1440>
   1bd54:	fff00c93          	li	s9,-1
   1bd58:	001c4683          	lbu	a3,1(s8)
   1bd5c:	00058c13          	mv	s8,a1
   1bd60:	d15fe06f          	j	1aa74 <_vfiprintf_r+0x15c>
   1bd64:	0ef10813          	addi	a6,sp,239
   1bd68:	e44ff06f          	j	1b3ac <_vfiprintf_r+0xa94>
   1bd6c:	00070b93          	mv	s7,a4
   1bd70:	be4ff06f          	j	1b154 <_vfiprintf_r+0x83c>
   1bd74:	00100713          	li	a4,1
   1bd78:	00068d13          	mv	s10,a3
   1bd7c:	00070d93          	mv	s11,a4
   1bd80:	0ef10813          	addi	a6,sp,239
   1bd84:	e40ff06f          	j	1b3c4 <_vfiprintf_r+0xaac>

0001bd88 <vfiprintf>:
   1bd88:	00050713          	mv	a4,a0
   1bd8c:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   1bd90:	00058793          	mv	a5,a1
   1bd94:	00060693          	mv	a3,a2
   1bd98:	00070593          	mv	a1,a4
   1bd9c:	00078613          	mv	a2,a5
   1bda0:	b79fe06f          	j	1a918 <_vfiprintf_r>

0001bda4 <__sbprintf>:
   1bda4:	00c5d783          	lhu	a5,12(a1)
   1bda8:	0645ae83          	lw	t4,100(a1)
   1bdac:	00e5de03          	lhu	t3,14(a1)
   1bdb0:	01c5a303          	lw	t1,28(a1)
   1bdb4:	0245a883          	lw	a7,36(a1)
   1bdb8:	b8010113          	addi	sp,sp,-1152
   1bdbc:	07010813          	addi	a6,sp,112
   1bdc0:	40000713          	li	a4,1024
   1bdc4:	46812c23          	sw	s0,1144(sp)
   1bdc8:	ffd7f793          	andi	a5,a5,-3
   1bdcc:	00058413          	mv	s0,a1
   1bdd0:	00810593          	addi	a1,sp,8
   1bdd4:	46912a23          	sw	s1,1140(sp)
   1bdd8:	47212823          	sw	s2,1136(sp)
   1bddc:	46112e23          	sw	ra,1148(sp)
   1bde0:	02012023          	sw	zero,32(sp)
   1bde4:	00f11a23          	sh	a5,20(sp)
   1bde8:	07d12623          	sw	t4,108(sp)
   1bdec:	01c11b23          	sh	t3,22(sp)
   1bdf0:	02612223          	sw	t1,36(sp)
   1bdf4:	03112623          	sw	a7,44(sp)
   1bdf8:	00050913          	mv	s2,a0
   1bdfc:	01012423          	sw	a6,8(sp)
   1be00:	01012c23          	sw	a6,24(sp)
   1be04:	00e12823          	sw	a4,16(sp)
   1be08:	00e12e23          	sw	a4,28(sp)
   1be0c:	b0dfe0ef          	jal	1a918 <_vfiprintf_r>
   1be10:	00050493          	mv	s1,a0
   1be14:	02055c63          	bgez	a0,1be4c <__sbprintf+0xa8>
   1be18:	01415783          	lhu	a5,20(sp)
   1be1c:	0407f793          	andi	a5,a5,64
   1be20:	00078863          	beqz	a5,1be30 <__sbprintf+0x8c>
   1be24:	00c45783          	lhu	a5,12(s0)
   1be28:	0407e793          	ori	a5,a5,64
   1be2c:	00f41623          	sh	a5,12(s0)
   1be30:	47c12083          	lw	ra,1148(sp)
   1be34:	47812403          	lw	s0,1144(sp)
   1be38:	47012903          	lw	s2,1136(sp)
   1be3c:	00048513          	mv	a0,s1
   1be40:	47412483          	lw	s1,1140(sp)
   1be44:	48010113          	addi	sp,sp,1152
   1be48:	00008067          	ret
   1be4c:	00810593          	addi	a1,sp,8
   1be50:	00090513          	mv	a0,s2
   1be54:	a58f90ef          	jal	150ac <_fflush_r>
   1be58:	fc0500e3          	beqz	a0,1be18 <__sbprintf+0x74>
   1be5c:	fff00493          	li	s1,-1
   1be60:	fb9ff06f          	j	1be18 <__sbprintf+0x74>

0001be64 <__errno>:
   1be64:	f0c1a503          	lw	a0,-244(gp) # 2371c <_impure_ptr>
   1be68:	00008067          	ret

0001be6c <abort>:
   1be6c:	ff010113          	addi	sp,sp,-16
   1be70:	00600513          	li	a0,6
   1be74:	00112623          	sw	ra,12(sp)
   1be78:	2b0000ef          	jal	1c128 <raise>
   1be7c:	00100513          	li	a0,1
   1be80:	604000ef          	jal	1c484 <_exit>

0001be84 <_init_signal_r>:
   1be84:	11852783          	lw	a5,280(a0)
   1be88:	00078663          	beqz	a5,1be94 <_init_signal_r+0x10>
   1be8c:	00000513          	li	a0,0
   1be90:	00008067          	ret
   1be94:	ff010113          	addi	sp,sp,-16
   1be98:	08000593          	li	a1,128
   1be9c:	00812423          	sw	s0,8(sp)
   1bea0:	00112623          	sw	ra,12(sp)
   1bea4:	00050413          	mv	s0,a0
   1bea8:	b00f50ef          	jal	111a8 <_malloc_r>
   1beac:	10a42c23          	sw	a0,280(s0)
   1beb0:	02050463          	beqz	a0,1bed8 <_init_signal_r+0x54>
   1beb4:	08050793          	addi	a5,a0,128
   1beb8:	00052023          	sw	zero,0(a0)
   1bebc:	00450513          	addi	a0,a0,4
   1bec0:	fef51ce3          	bne	a0,a5,1beb8 <_init_signal_r+0x34>
   1bec4:	00000513          	li	a0,0
   1bec8:	00c12083          	lw	ra,12(sp)
   1becc:	00812403          	lw	s0,8(sp)
   1bed0:	01010113          	addi	sp,sp,16
   1bed4:	00008067          	ret
   1bed8:	fff00513          	li	a0,-1
   1bedc:	fedff06f          	j	1bec8 <_init_signal_r+0x44>

0001bee0 <_signal_r>:
   1bee0:	fe010113          	addi	sp,sp,-32
   1bee4:	00912a23          	sw	s1,20(sp)
   1bee8:	00112e23          	sw	ra,28(sp)
   1beec:	01f00793          	li	a5,31
   1bef0:	00050493          	mv	s1,a0
   1bef4:	02b7ec63          	bltu	a5,a1,1bf2c <_signal_r+0x4c>
   1bef8:	11852783          	lw	a5,280(a0)
   1befc:	00812c23          	sw	s0,24(sp)
   1bf00:	00058413          	mv	s0,a1
   1bf04:	04078263          	beqz	a5,1bf48 <_signal_r+0x68>
   1bf08:	00241413          	slli	s0,s0,0x2
   1bf0c:	008787b3          	add	a5,a5,s0
   1bf10:	01c12083          	lw	ra,28(sp)
   1bf14:	01812403          	lw	s0,24(sp)
   1bf18:	0007a503          	lw	a0,0(a5)
   1bf1c:	00c7a023          	sw	a2,0(a5)
   1bf20:	01412483          	lw	s1,20(sp)
   1bf24:	02010113          	addi	sp,sp,32
   1bf28:	00008067          	ret
   1bf2c:	01600793          	li	a5,22
   1bf30:	00f52023          	sw	a5,0(a0)
   1bf34:	fff00513          	li	a0,-1
   1bf38:	01c12083          	lw	ra,28(sp)
   1bf3c:	01412483          	lw	s1,20(sp)
   1bf40:	02010113          	addi	sp,sp,32
   1bf44:	00008067          	ret
   1bf48:	08000593          	li	a1,128
   1bf4c:	00c12623          	sw	a2,12(sp)
   1bf50:	a58f50ef          	jal	111a8 <_malloc_r>
   1bf54:	10a4ac23          	sw	a0,280(s1)
   1bf58:	00c12603          	lw	a2,12(sp)
   1bf5c:	00050793          	mv	a5,a0
   1bf60:	00050713          	mv	a4,a0
   1bf64:	08050693          	addi	a3,a0,128
   1bf68:	00050a63          	beqz	a0,1bf7c <_signal_r+0x9c>
   1bf6c:	00072023          	sw	zero,0(a4)
   1bf70:	00470713          	addi	a4,a4,4
   1bf74:	fed71ce3          	bne	a4,a3,1bf6c <_signal_r+0x8c>
   1bf78:	f91ff06f          	j	1bf08 <_signal_r+0x28>
   1bf7c:	01812403          	lw	s0,24(sp)
   1bf80:	fff00513          	li	a0,-1
   1bf84:	fb5ff06f          	j	1bf38 <_signal_r+0x58>

0001bf88 <_raise_r>:
   1bf88:	ff010113          	addi	sp,sp,-16
   1bf8c:	00912223          	sw	s1,4(sp)
   1bf90:	00112623          	sw	ra,12(sp)
   1bf94:	01f00793          	li	a5,31
   1bf98:	00050493          	mv	s1,a0
   1bf9c:	08b7ee63          	bltu	a5,a1,1c038 <_raise_r+0xb0>
   1bfa0:	11852783          	lw	a5,280(a0)
   1bfa4:	00812423          	sw	s0,8(sp)
   1bfa8:	00058413          	mv	s0,a1
   1bfac:	04078463          	beqz	a5,1bff4 <_raise_r+0x6c>
   1bfb0:	00259713          	slli	a4,a1,0x2
   1bfb4:	00e787b3          	add	a5,a5,a4
   1bfb8:	0007a703          	lw	a4,0(a5)
   1bfbc:	02070c63          	beqz	a4,1bff4 <_raise_r+0x6c>
   1bfc0:	00100513          	li	a0,1
   1bfc4:	00a70c63          	beq	a4,a0,1bfdc <_raise_r+0x54>
   1bfc8:	fff00693          	li	a3,-1
   1bfcc:	04d70863          	beq	a4,a3,1c01c <_raise_r+0x94>
   1bfd0:	0007a023          	sw	zero,0(a5)
   1bfd4:	00058513          	mv	a0,a1
   1bfd8:	000700e7          	jalr	a4
   1bfdc:	00812403          	lw	s0,8(sp)
   1bfe0:	00000513          	li	a0,0
   1bfe4:	00c12083          	lw	ra,12(sp)
   1bfe8:	00412483          	lw	s1,4(sp)
   1bfec:	01010113          	addi	sp,sp,16
   1bff0:	00008067          	ret
   1bff4:	00048513          	mv	a0,s1
   1bff8:	444000ef          	jal	1c43c <_getpid_r>
   1bffc:	00040613          	mv	a2,s0
   1c000:	00812403          	lw	s0,8(sp)
   1c004:	00c12083          	lw	ra,12(sp)
   1c008:	00050593          	mv	a1,a0
   1c00c:	00048513          	mv	a0,s1
   1c010:	00412483          	lw	s1,4(sp)
   1c014:	01010113          	addi	sp,sp,16
   1c018:	3c00006f          	j	1c3d8 <_kill_r>
   1c01c:	00812403          	lw	s0,8(sp)
   1c020:	00c12083          	lw	ra,12(sp)
   1c024:	01600793          	li	a5,22
   1c028:	00f4a023          	sw	a5,0(s1)
   1c02c:	00412483          	lw	s1,4(sp)
   1c030:	01010113          	addi	sp,sp,16
   1c034:	00008067          	ret
   1c038:	01600793          	li	a5,22
   1c03c:	00f52023          	sw	a5,0(a0)
   1c040:	fff00513          	li	a0,-1
   1c044:	fa1ff06f          	j	1bfe4 <_raise_r+0x5c>

0001c048 <__sigtramp_r>:
   1c048:	01f00793          	li	a5,31
   1c04c:	0cb7ea63          	bltu	a5,a1,1c120 <__sigtramp_r+0xd8>
   1c050:	11852783          	lw	a5,280(a0)
   1c054:	ff010113          	addi	sp,sp,-16
   1c058:	00812423          	sw	s0,8(sp)
   1c05c:	00912223          	sw	s1,4(sp)
   1c060:	00112623          	sw	ra,12(sp)
   1c064:	00058413          	mv	s0,a1
   1c068:	00050493          	mv	s1,a0
   1c06c:	08078063          	beqz	a5,1c0ec <__sigtramp_r+0xa4>
   1c070:	00241713          	slli	a4,s0,0x2
   1c074:	00e787b3          	add	a5,a5,a4
   1c078:	0007a703          	lw	a4,0(a5)
   1c07c:	02070c63          	beqz	a4,1c0b4 <__sigtramp_r+0x6c>
   1c080:	fff00693          	li	a3,-1
   1c084:	06d70063          	beq	a4,a3,1c0e4 <__sigtramp_r+0x9c>
   1c088:	00100693          	li	a3,1
   1c08c:	04d70063          	beq	a4,a3,1c0cc <__sigtramp_r+0x84>
   1c090:	00040513          	mv	a0,s0
   1c094:	0007a023          	sw	zero,0(a5)
   1c098:	000700e7          	jalr	a4
   1c09c:	00000513          	li	a0,0
   1c0a0:	00c12083          	lw	ra,12(sp)
   1c0a4:	00812403          	lw	s0,8(sp)
   1c0a8:	00412483          	lw	s1,4(sp)
   1c0ac:	01010113          	addi	sp,sp,16
   1c0b0:	00008067          	ret
   1c0b4:	00c12083          	lw	ra,12(sp)
   1c0b8:	00812403          	lw	s0,8(sp)
   1c0bc:	00412483          	lw	s1,4(sp)
   1c0c0:	00100513          	li	a0,1
   1c0c4:	01010113          	addi	sp,sp,16
   1c0c8:	00008067          	ret
   1c0cc:	00c12083          	lw	ra,12(sp)
   1c0d0:	00812403          	lw	s0,8(sp)
   1c0d4:	00412483          	lw	s1,4(sp)
   1c0d8:	00300513          	li	a0,3
   1c0dc:	01010113          	addi	sp,sp,16
   1c0e0:	00008067          	ret
   1c0e4:	00200513          	li	a0,2
   1c0e8:	fb9ff06f          	j	1c0a0 <__sigtramp_r+0x58>
   1c0ec:	08000593          	li	a1,128
   1c0f0:	8b8f50ef          	jal	111a8 <_malloc_r>
   1c0f4:	10a4ac23          	sw	a0,280(s1)
   1c0f8:	00050793          	mv	a5,a0
   1c0fc:	00050e63          	beqz	a0,1c118 <__sigtramp_r+0xd0>
   1c100:	00050713          	mv	a4,a0
   1c104:	08050693          	addi	a3,a0,128
   1c108:	00072023          	sw	zero,0(a4)
   1c10c:	00470713          	addi	a4,a4,4
   1c110:	fed71ce3          	bne	a4,a3,1c108 <__sigtramp_r+0xc0>
   1c114:	f5dff06f          	j	1c070 <__sigtramp_r+0x28>
   1c118:	fff00513          	li	a0,-1
   1c11c:	f85ff06f          	j	1c0a0 <__sigtramp_r+0x58>
   1c120:	fff00513          	li	a0,-1
   1c124:	00008067          	ret

0001c128 <raise>:
   1c128:	ff010113          	addi	sp,sp,-16
   1c12c:	00912223          	sw	s1,4(sp)
   1c130:	00112623          	sw	ra,12(sp)
   1c134:	01f00793          	li	a5,31
   1c138:	f0c1a483          	lw	s1,-244(gp) # 2371c <_impure_ptr>
   1c13c:	08a7ee63          	bltu	a5,a0,1c1d8 <raise+0xb0>
   1c140:	1184a783          	lw	a5,280(s1)
   1c144:	00812423          	sw	s0,8(sp)
   1c148:	00050413          	mv	s0,a0
   1c14c:	04078263          	beqz	a5,1c190 <raise+0x68>
   1c150:	00251713          	slli	a4,a0,0x2
   1c154:	00e787b3          	add	a5,a5,a4
   1c158:	0007a703          	lw	a4,0(a5)
   1c15c:	02070a63          	beqz	a4,1c190 <raise+0x68>
   1c160:	00100693          	li	a3,1
   1c164:	00d70a63          	beq	a4,a3,1c178 <raise+0x50>
   1c168:	fff00613          	li	a2,-1
   1c16c:	04c70663          	beq	a4,a2,1c1b8 <raise+0x90>
   1c170:	0007a023          	sw	zero,0(a5)
   1c174:	000700e7          	jalr	a4
   1c178:	00812403          	lw	s0,8(sp)
   1c17c:	00000513          	li	a0,0
   1c180:	00c12083          	lw	ra,12(sp)
   1c184:	00412483          	lw	s1,4(sp)
   1c188:	01010113          	addi	sp,sp,16
   1c18c:	00008067          	ret
   1c190:	00048513          	mv	a0,s1
   1c194:	2a8000ef          	jal	1c43c <_getpid_r>
   1c198:	00040613          	mv	a2,s0
   1c19c:	00812403          	lw	s0,8(sp)
   1c1a0:	00c12083          	lw	ra,12(sp)
   1c1a4:	00050593          	mv	a1,a0
   1c1a8:	00048513          	mv	a0,s1
   1c1ac:	00412483          	lw	s1,4(sp)
   1c1b0:	01010113          	addi	sp,sp,16
   1c1b4:	2240006f          	j	1c3d8 <_kill_r>
   1c1b8:	00812403          	lw	s0,8(sp)
   1c1bc:	00c12083          	lw	ra,12(sp)
   1c1c0:	01600793          	li	a5,22
   1c1c4:	00f4a023          	sw	a5,0(s1)
   1c1c8:	00068513          	mv	a0,a3
   1c1cc:	00412483          	lw	s1,4(sp)
   1c1d0:	01010113          	addi	sp,sp,16
   1c1d4:	00008067          	ret
   1c1d8:	01600793          	li	a5,22
   1c1dc:	00f4a023          	sw	a5,0(s1)
   1c1e0:	fff00513          	li	a0,-1
   1c1e4:	f9dff06f          	j	1c180 <raise+0x58>

0001c1e8 <signal>:
   1c1e8:	ff010113          	addi	sp,sp,-16
   1c1ec:	01212023          	sw	s2,0(sp)
   1c1f0:	00112623          	sw	ra,12(sp)
   1c1f4:	01f00793          	li	a5,31
   1c1f8:	f0c1a903          	lw	s2,-244(gp) # 2371c <_impure_ptr>
   1c1fc:	04a7e263          	bltu	a5,a0,1c240 <signal+0x58>
   1c200:	00812423          	sw	s0,8(sp)
   1c204:	00050413          	mv	s0,a0
   1c208:	11892503          	lw	a0,280(s2)
   1c20c:	00912223          	sw	s1,4(sp)
   1c210:	00058493          	mv	s1,a1
   1c214:	04050463          	beqz	a0,1c25c <signal+0x74>
   1c218:	00241413          	slli	s0,s0,0x2
   1c21c:	008507b3          	add	a5,a0,s0
   1c220:	00c12083          	lw	ra,12(sp)
   1c224:	00812403          	lw	s0,8(sp)
   1c228:	0007a503          	lw	a0,0(a5)
   1c22c:	0097a023          	sw	s1,0(a5)
   1c230:	00012903          	lw	s2,0(sp)
   1c234:	00412483          	lw	s1,4(sp)
   1c238:	01010113          	addi	sp,sp,16
   1c23c:	00008067          	ret
   1c240:	01600793          	li	a5,22
   1c244:	00f92023          	sw	a5,0(s2)
   1c248:	fff00513          	li	a0,-1
   1c24c:	00c12083          	lw	ra,12(sp)
   1c250:	00012903          	lw	s2,0(sp)
   1c254:	01010113          	addi	sp,sp,16
   1c258:	00008067          	ret
   1c25c:	08000593          	li	a1,128
   1c260:	00090513          	mv	a0,s2
   1c264:	f45f40ef          	jal	111a8 <_malloc_r>
   1c268:	10a92c23          	sw	a0,280(s2)
   1c26c:	00050793          	mv	a5,a0
   1c270:	08050713          	addi	a4,a0,128
   1c274:	00050a63          	beqz	a0,1c288 <signal+0xa0>
   1c278:	0007a023          	sw	zero,0(a5)
   1c27c:	00478793          	addi	a5,a5,4
   1c280:	fef71ce3          	bne	a4,a5,1c278 <signal+0x90>
   1c284:	f95ff06f          	j	1c218 <signal+0x30>
   1c288:	00812403          	lw	s0,8(sp)
   1c28c:	00412483          	lw	s1,4(sp)
   1c290:	fff00513          	li	a0,-1
   1c294:	fb9ff06f          	j	1c24c <signal+0x64>

0001c298 <_init_signal>:
   1c298:	ff010113          	addi	sp,sp,-16
   1c29c:	00812423          	sw	s0,8(sp)
   1c2a0:	f0c1a403          	lw	s0,-244(gp) # 2371c <_impure_ptr>
   1c2a4:	00112623          	sw	ra,12(sp)
   1c2a8:	11842783          	lw	a5,280(s0)
   1c2ac:	00078c63          	beqz	a5,1c2c4 <_init_signal+0x2c>
   1c2b0:	00000513          	li	a0,0
   1c2b4:	00c12083          	lw	ra,12(sp)
   1c2b8:	00812403          	lw	s0,8(sp)
   1c2bc:	01010113          	addi	sp,sp,16
   1c2c0:	00008067          	ret
   1c2c4:	08000593          	li	a1,128
   1c2c8:	00040513          	mv	a0,s0
   1c2cc:	eddf40ef          	jal	111a8 <_malloc_r>
   1c2d0:	10a42c23          	sw	a0,280(s0)
   1c2d4:	00050c63          	beqz	a0,1c2ec <_init_signal+0x54>
   1c2d8:	08050793          	addi	a5,a0,128
   1c2dc:	00052023          	sw	zero,0(a0)
   1c2e0:	00450513          	addi	a0,a0,4
   1c2e4:	fef51ce3          	bne	a0,a5,1c2dc <_init_signal+0x44>
   1c2e8:	fc9ff06f          	j	1c2b0 <_init_signal+0x18>
   1c2ec:	fff00513          	li	a0,-1
   1c2f0:	fc5ff06f          	j	1c2b4 <_init_signal+0x1c>

0001c2f4 <__sigtramp>:
   1c2f4:	ff010113          	addi	sp,sp,-16
   1c2f8:	00912223          	sw	s1,4(sp)
   1c2fc:	00112623          	sw	ra,12(sp)
   1c300:	01f00793          	li	a5,31
   1c304:	f0c1a483          	lw	s1,-244(gp) # 2371c <_impure_ptr>
   1c308:	0ca7e463          	bltu	a5,a0,1c3d0 <__sigtramp+0xdc>
   1c30c:	1184a783          	lw	a5,280(s1)
   1c310:	00812423          	sw	s0,8(sp)
   1c314:	00050413          	mv	s0,a0
   1c318:	08078263          	beqz	a5,1c39c <__sigtramp+0xa8>
   1c31c:	00241713          	slli	a4,s0,0x2
   1c320:	00e787b3          	add	a5,a5,a4
   1c324:	0007a703          	lw	a4,0(a5)
   1c328:	02070c63          	beqz	a4,1c360 <__sigtramp+0x6c>
   1c32c:	fff00693          	li	a3,-1
   1c330:	06d70063          	beq	a4,a3,1c390 <__sigtramp+0x9c>
   1c334:	00100693          	li	a3,1
   1c338:	04d70063          	beq	a4,a3,1c378 <__sigtramp+0x84>
   1c33c:	00040513          	mv	a0,s0
   1c340:	0007a023          	sw	zero,0(a5)
   1c344:	000700e7          	jalr	a4
   1c348:	00812403          	lw	s0,8(sp)
   1c34c:	00000513          	li	a0,0
   1c350:	00c12083          	lw	ra,12(sp)
   1c354:	00412483          	lw	s1,4(sp)
   1c358:	01010113          	addi	sp,sp,16
   1c35c:	00008067          	ret
   1c360:	00812403          	lw	s0,8(sp)
   1c364:	00c12083          	lw	ra,12(sp)
   1c368:	00412483          	lw	s1,4(sp)
   1c36c:	00100513          	li	a0,1
   1c370:	01010113          	addi	sp,sp,16
   1c374:	00008067          	ret
   1c378:	00812403          	lw	s0,8(sp)
   1c37c:	00c12083          	lw	ra,12(sp)
   1c380:	00412483          	lw	s1,4(sp)
   1c384:	00300513          	li	a0,3
   1c388:	01010113          	addi	sp,sp,16
   1c38c:	00008067          	ret
   1c390:	00812403          	lw	s0,8(sp)
   1c394:	00200513          	li	a0,2
   1c398:	fb9ff06f          	j	1c350 <__sigtramp+0x5c>
   1c39c:	08000593          	li	a1,128
   1c3a0:	00048513          	mv	a0,s1
   1c3a4:	e05f40ef          	jal	111a8 <_malloc_r>
   1c3a8:	10a4ac23          	sw	a0,280(s1)
   1c3ac:	00050793          	mv	a5,a0
   1c3b0:	00050e63          	beqz	a0,1c3cc <__sigtramp+0xd8>
   1c3b4:	00050713          	mv	a4,a0
   1c3b8:	08050693          	addi	a3,a0,128
   1c3bc:	00072023          	sw	zero,0(a4)
   1c3c0:	00470713          	addi	a4,a4,4
   1c3c4:	fee69ce3          	bne	a3,a4,1c3bc <__sigtramp+0xc8>
   1c3c8:	f55ff06f          	j	1c31c <__sigtramp+0x28>
   1c3cc:	00812403          	lw	s0,8(sp)
   1c3d0:	fff00513          	li	a0,-1
   1c3d4:	f7dff06f          	j	1c350 <__sigtramp+0x5c>

0001c3d8 <_kill_r>:
   1c3d8:	ff010113          	addi	sp,sp,-16
   1c3dc:	00058713          	mv	a4,a1
   1c3e0:	00812423          	sw	s0,8(sp)
   1c3e4:	00912223          	sw	s1,4(sp)
   1c3e8:	00060593          	mv	a1,a2
   1c3ec:	00050413          	mv	s0,a0
   1c3f0:	00070513          	mv	a0,a4
   1c3f4:	00112623          	sw	ra,12(sp)
   1c3f8:	f001ae23          	sw	zero,-228(gp) # 2372c <errno>
   1c3fc:	1d8000ef          	jal	1c5d4 <_kill>
   1c400:	fff00793          	li	a5,-1
   1c404:	00f50c63          	beq	a0,a5,1c41c <_kill_r+0x44>
   1c408:	00c12083          	lw	ra,12(sp)
   1c40c:	00812403          	lw	s0,8(sp)
   1c410:	00412483          	lw	s1,4(sp)
   1c414:	01010113          	addi	sp,sp,16
   1c418:	00008067          	ret
   1c41c:	f1c1a783          	lw	a5,-228(gp) # 2372c <errno>
   1c420:	fe0784e3          	beqz	a5,1c408 <_kill_r+0x30>
   1c424:	00c12083          	lw	ra,12(sp)
   1c428:	00f42023          	sw	a5,0(s0)
   1c42c:	00812403          	lw	s0,8(sp)
   1c430:	00412483          	lw	s1,4(sp)
   1c434:	01010113          	addi	sp,sp,16
   1c438:	00008067          	ret

0001c43c <_getpid_r>:
   1c43c:	0d80006f          	j	1c514 <_getpid>

0001c440 <_close>:
   1c440:	ff010113          	addi	sp,sp,-16
   1c444:	00112623          	sw	ra,12(sp)
   1c448:	00812423          	sw	s0,8(sp)
   1c44c:	03900893          	li	a7,57
   1c450:	00000073          	ecall
   1c454:	00050413          	mv	s0,a0
   1c458:	00054c63          	bltz	a0,1c470 <_close+0x30>
   1c45c:	00c12083          	lw	ra,12(sp)
   1c460:	00040513          	mv	a0,s0
   1c464:	00812403          	lw	s0,8(sp)
   1c468:	01010113          	addi	sp,sp,16
   1c46c:	00008067          	ret
   1c470:	40800433          	neg	s0,s0
   1c474:	9f1ff0ef          	jal	1be64 <__errno>
   1c478:	00852023          	sw	s0,0(a0)
   1c47c:	fff00413          	li	s0,-1
   1c480:	fddff06f          	j	1c45c <_close+0x1c>

0001c484 <_exit>:
   1c484:	05d00893          	li	a7,93
   1c488:	00000073          	ecall
   1c48c:	00054463          	bltz	a0,1c494 <_exit+0x10>
   1c490:	0000006f          	j	1c490 <_exit+0xc>
   1c494:	ff010113          	addi	sp,sp,-16
   1c498:	00812423          	sw	s0,8(sp)
   1c49c:	00050413          	mv	s0,a0
   1c4a0:	00112623          	sw	ra,12(sp)
   1c4a4:	40800433          	neg	s0,s0
   1c4a8:	9bdff0ef          	jal	1be64 <__errno>
   1c4ac:	00852023          	sw	s0,0(a0)
   1c4b0:	0000006f          	j	1c4b0 <_exit+0x2c>

0001c4b4 <_fstat>:
   1c4b4:	f7010113          	addi	sp,sp,-144
   1c4b8:	08912223          	sw	s1,132(sp)
   1c4bc:	08112623          	sw	ra,140(sp)
   1c4c0:	00058493          	mv	s1,a1
   1c4c4:	08812423          	sw	s0,136(sp)
   1c4c8:	00010593          	mv	a1,sp
   1c4cc:	05000893          	li	a7,80
   1c4d0:	00000073          	ecall
   1c4d4:	00050413          	mv	s0,a0
   1c4d8:	02054463          	bltz	a0,1c500 <_fstat+0x4c>
   1c4dc:	00048513          	mv	a0,s1
   1c4e0:	00010593          	mv	a1,sp
   1c4e4:	258000ef          	jal	1c73c <_conv_stat>
   1c4e8:	08c12083          	lw	ra,140(sp)
   1c4ec:	00040513          	mv	a0,s0
   1c4f0:	08812403          	lw	s0,136(sp)
   1c4f4:	08412483          	lw	s1,132(sp)
   1c4f8:	09010113          	addi	sp,sp,144
   1c4fc:	00008067          	ret
   1c500:	40800433          	neg	s0,s0
   1c504:	961ff0ef          	jal	1be64 <__errno>
   1c508:	00852023          	sw	s0,0(a0)
   1c50c:	fff00413          	li	s0,-1
   1c510:	fcdff06f          	j	1c4dc <_fstat+0x28>

0001c514 <_getpid>:
   1c514:	00100513          	li	a0,1
   1c518:	00008067          	ret

0001c51c <_gettimeofday>:
   1c51c:	fe010113          	addi	sp,sp,-32
   1c520:	00912a23          	sw	s1,20(sp)
   1c524:	00112e23          	sw	ra,28(sp)
   1c528:	00050493          	mv	s1,a0
   1c52c:	00812c23          	sw	s0,24(sp)
   1c530:	19300893          	li	a7,403
   1c534:	00000513          	li	a0,0
   1c538:	00010593          	mv	a1,sp
   1c53c:	00000073          	ecall
   1c540:	00050413          	mv	s0,a0
   1c544:	02054e63          	bltz	a0,1c580 <_gettimeofday+0x64>
   1c548:	00012703          	lw	a4,0(sp)
   1c54c:	00412783          	lw	a5,4(sp)
   1c550:	00812503          	lw	a0,8(sp)
   1c554:	00e4a023          	sw	a4,0(s1)
   1c558:	00f4a223          	sw	a5,4(s1)
   1c55c:	3e800593          	li	a1,1000
   1c560:	58d050ef          	jal	222ec <__divsi3>
   1c564:	00a4a423          	sw	a0,8(s1)
   1c568:	01c12083          	lw	ra,28(sp)
   1c56c:	00040513          	mv	a0,s0
   1c570:	01812403          	lw	s0,24(sp)
   1c574:	01412483          	lw	s1,20(sp)
   1c578:	02010113          	addi	sp,sp,32
   1c57c:	00008067          	ret
   1c580:	40800433          	neg	s0,s0
   1c584:	8e1ff0ef          	jal	1be64 <__errno>
   1c588:	00852023          	sw	s0,0(a0)
   1c58c:	fff00413          	li	s0,-1
   1c590:	fb9ff06f          	j	1c548 <_gettimeofday+0x2c>

0001c594 <_isatty>:
   1c594:	f9010113          	addi	sp,sp,-112
   1c598:	00810593          	addi	a1,sp,8
   1c59c:	06112623          	sw	ra,108(sp)
   1c5a0:	f15ff0ef          	jal	1c4b4 <_fstat>
   1c5a4:	fff00793          	li	a5,-1
   1c5a8:	00f50e63          	beq	a0,a5,1c5c4 <_isatty+0x30>
   1c5ac:	00c12503          	lw	a0,12(sp)
   1c5b0:	06c12083          	lw	ra,108(sp)
   1c5b4:	00d55513          	srli	a0,a0,0xd
   1c5b8:	00157513          	andi	a0,a0,1
   1c5bc:	07010113          	addi	sp,sp,112
   1c5c0:	00008067          	ret
   1c5c4:	06c12083          	lw	ra,108(sp)
   1c5c8:	00000513          	li	a0,0
   1c5cc:	07010113          	addi	sp,sp,112
   1c5d0:	00008067          	ret

0001c5d4 <_kill>:
   1c5d4:	ff010113          	addi	sp,sp,-16
   1c5d8:	00112623          	sw	ra,12(sp)
   1c5dc:	889ff0ef          	jal	1be64 <__errno>
   1c5e0:	00c12083          	lw	ra,12(sp)
   1c5e4:	01600793          	li	a5,22
   1c5e8:	00f52023          	sw	a5,0(a0)
   1c5ec:	fff00513          	li	a0,-1
   1c5f0:	01010113          	addi	sp,sp,16
   1c5f4:	00008067          	ret

0001c5f8 <_lseek>:
   1c5f8:	ff010113          	addi	sp,sp,-16
   1c5fc:	00112623          	sw	ra,12(sp)
   1c600:	00812423          	sw	s0,8(sp)
   1c604:	03e00893          	li	a7,62
   1c608:	00000073          	ecall
   1c60c:	00050413          	mv	s0,a0
   1c610:	00054c63          	bltz	a0,1c628 <_lseek+0x30>
   1c614:	00c12083          	lw	ra,12(sp)
   1c618:	00040513          	mv	a0,s0
   1c61c:	00812403          	lw	s0,8(sp)
   1c620:	01010113          	addi	sp,sp,16
   1c624:	00008067          	ret
   1c628:	40800433          	neg	s0,s0
   1c62c:	839ff0ef          	jal	1be64 <__errno>
   1c630:	00852023          	sw	s0,0(a0)
   1c634:	fff00413          	li	s0,-1
   1c638:	fddff06f          	j	1c614 <_lseek+0x1c>

0001c63c <_read>:
   1c63c:	ff010113          	addi	sp,sp,-16
   1c640:	00112623          	sw	ra,12(sp)
   1c644:	00812423          	sw	s0,8(sp)
   1c648:	03f00893          	li	a7,63
   1c64c:	00000073          	ecall
   1c650:	00050413          	mv	s0,a0
   1c654:	00054c63          	bltz	a0,1c66c <_read+0x30>
   1c658:	00c12083          	lw	ra,12(sp)
   1c65c:	00040513          	mv	a0,s0
   1c660:	00812403          	lw	s0,8(sp)
   1c664:	01010113          	addi	sp,sp,16
   1c668:	00008067          	ret
   1c66c:	40800433          	neg	s0,s0
   1c670:	ff4ff0ef          	jal	1be64 <__errno>
   1c674:	00852023          	sw	s0,0(a0)
   1c678:	fff00413          	li	s0,-1
   1c67c:	fddff06f          	j	1c658 <_read+0x1c>

0001c680 <_sbrk>:
   1c680:	f341a703          	lw	a4,-204(gp) # 23744 <heap_end.0>
   1c684:	ff010113          	addi	sp,sp,-16
   1c688:	00112623          	sw	ra,12(sp)
   1c68c:	00050793          	mv	a5,a0
   1c690:	02071063          	bnez	a4,1c6b0 <_sbrk+0x30>
   1c694:	0d600893          	li	a7,214
   1c698:	00000513          	li	a0,0
   1c69c:	00000073          	ecall
   1c6a0:	fff00613          	li	a2,-1
   1c6a4:	00050713          	mv	a4,a0
   1c6a8:	02c50a63          	beq	a0,a2,1c6dc <_sbrk+0x5c>
   1c6ac:	f2a1aa23          	sw	a0,-204(gp) # 23744 <heap_end.0>
   1c6b0:	00e78533          	add	a0,a5,a4
   1c6b4:	0d600893          	li	a7,214
   1c6b8:	00000073          	ecall
   1c6bc:	f341a703          	lw	a4,-204(gp) # 23744 <heap_end.0>
   1c6c0:	00e787b3          	add	a5,a5,a4
   1c6c4:	00f51c63          	bne	a0,a5,1c6dc <_sbrk+0x5c>
   1c6c8:	00c12083          	lw	ra,12(sp)
   1c6cc:	f2a1aa23          	sw	a0,-204(gp) # 23744 <heap_end.0>
   1c6d0:	00070513          	mv	a0,a4
   1c6d4:	01010113          	addi	sp,sp,16
   1c6d8:	00008067          	ret
   1c6dc:	f88ff0ef          	jal	1be64 <__errno>
   1c6e0:	00c12083          	lw	ra,12(sp)
   1c6e4:	00c00793          	li	a5,12
   1c6e8:	00f52023          	sw	a5,0(a0)
   1c6ec:	fff00513          	li	a0,-1
   1c6f0:	01010113          	addi	sp,sp,16
   1c6f4:	00008067          	ret

0001c6f8 <_write>:
   1c6f8:	ff010113          	addi	sp,sp,-16
   1c6fc:	00112623          	sw	ra,12(sp)
   1c700:	00812423          	sw	s0,8(sp)
   1c704:	04000893          	li	a7,64
   1c708:	00000073          	ecall
   1c70c:	00050413          	mv	s0,a0
   1c710:	00054c63          	bltz	a0,1c728 <_write+0x30>
   1c714:	00c12083          	lw	ra,12(sp)
   1c718:	00040513          	mv	a0,s0
   1c71c:	00812403          	lw	s0,8(sp)
   1c720:	01010113          	addi	sp,sp,16
   1c724:	00008067          	ret
   1c728:	40800433          	neg	s0,s0
   1c72c:	f38ff0ef          	jal	1be64 <__errno>
   1c730:	00852023          	sw	s0,0(a0)
   1c734:	fff00413          	li	s0,-1
   1c738:	fddff06f          	j	1c714 <_write+0x1c>

0001c73c <_conv_stat>:
   1c73c:	ff010113          	addi	sp,sp,-16
   1c740:	0005a783          	lw	a5,0(a1)
   1c744:	0145a383          	lw	t2,20(a1)
   1c748:	0185a283          	lw	t0,24(a1)
   1c74c:	01c5af83          	lw	t6,28(a1)
   1c750:	0205af03          	lw	t5,32(a1)
   1c754:	0305ae83          	lw	t4,48(a1)
   1c758:	0405ae03          	lw	t3,64(a1)
   1c75c:	0385a303          	lw	t1,56(a1)
   1c760:	0485a803          	lw	a6,72(a1)
   1c764:	04c5a883          	lw	a7,76(a1)
   1c768:	0585a603          	lw	a2,88(a1)
   1c76c:	00812623          	sw	s0,12(sp)
   1c770:	00912423          	sw	s1,8(sp)
   1c774:	0105a403          	lw	s0,16(a1)
   1c778:	0085a483          	lw	s1,8(a1)
   1c77c:	05c5a683          	lw	a3,92(a1)
   1c780:	0685a703          	lw	a4,104(a1)
   1c784:	00f51023          	sh	a5,0(a0)
   1c788:	06c5a783          	lw	a5,108(a1)
   1c78c:	00951123          	sh	s1,2(a0)
   1c790:	00852223          	sw	s0,4(a0)
   1c794:	00751423          	sh	t2,8(a0)
   1c798:	00551523          	sh	t0,10(a0)
   1c79c:	01f51623          	sh	t6,12(a0)
   1c7a0:	01e51723          	sh	t5,14(a0)
   1c7a4:	01d52823          	sw	t4,16(a0)
   1c7a8:	05c52623          	sw	t3,76(a0)
   1c7ac:	04652423          	sw	t1,72(a0)
   1c7b0:	01052c23          	sw	a6,24(a0)
   1c7b4:	01152e23          	sw	a7,28(a0)
   1c7b8:	02c52423          	sw	a2,40(a0)
   1c7bc:	02d52623          	sw	a3,44(a0)
   1c7c0:	00c12403          	lw	s0,12(sp)
   1c7c4:	02e52c23          	sw	a4,56(a0)
   1c7c8:	02f52e23          	sw	a5,60(a0)
   1c7cc:	00812483          	lw	s1,8(sp)
   1c7d0:	01010113          	addi	sp,sp,16
   1c7d4:	00008067          	ret

0001c7d8 <__udivdi3>:
   1c7d8:	fd010113          	addi	sp,sp,-48
   1c7dc:	01412c23          	sw	s4,24(sp)
   1c7e0:	02112623          	sw	ra,44(sp)
   1c7e4:	02812423          	sw	s0,40(sp)
   1c7e8:	02912223          	sw	s1,36(sp)
   1c7ec:	03212023          	sw	s2,32(sp)
   1c7f0:	01312e23          	sw	s3,28(sp)
   1c7f4:	01512a23          	sw	s5,20(sp)
   1c7f8:	01612823          	sw	s6,16(sp)
   1c7fc:	01712623          	sw	s7,12(sp)
   1c800:	01812423          	sw	s8,8(sp)
   1c804:	01912223          	sw	s9,4(sp)
   1c808:	01a12023          	sw	s10,0(sp)
   1c80c:	00050a13          	mv	s4,a0
   1c810:	38069663          	bnez	a3,1cb9c <__udivdi3+0x3c4>
   1c814:	000237b7          	lui	a5,0x23
   1c818:	00060993          	mv	s3,a2
   1c81c:	00050493          	mv	s1,a0
   1c820:	bbc78793          	addi	a5,a5,-1092 # 22bbc <__clz_tab>
   1c824:	12c5f863          	bgeu	a1,a2,1c954 <__udivdi3+0x17c>
   1c828:	00010737          	lui	a4,0x10
   1c82c:	00058913          	mv	s2,a1
   1c830:	10e67863          	bgeu	a2,a4,1c940 <__udivdi3+0x168>
   1c834:	10063713          	sltiu	a4,a2,256
   1c838:	00173713          	seqz	a4,a4
   1c83c:	00371713          	slli	a4,a4,0x3
   1c840:	00e656b3          	srl	a3,a2,a4
   1c844:	00d787b3          	add	a5,a5,a3
   1c848:	0007c783          	lbu	a5,0(a5)
   1c84c:	02000693          	li	a3,32
   1c850:	00e787b3          	add	a5,a5,a4
   1c854:	40f68733          	sub	a4,a3,a5
   1c858:	00f68c63          	beq	a3,a5,1c870 <__udivdi3+0x98>
   1c85c:	00e59933          	sll	s2,a1,a4
   1c860:	00fa57b3          	srl	a5,s4,a5
   1c864:	00e619b3          	sll	s3,a2,a4
   1c868:	0127e933          	or	s2,a5,s2
   1c86c:	00ea14b3          	sll	s1,s4,a4
   1c870:	0109da93          	srli	s5,s3,0x10
   1c874:	000a8593          	mv	a1,s5
   1c878:	00090513          	mv	a0,s2
   1c87c:	01099b13          	slli	s6,s3,0x10
   1c880:	275050ef          	jal	222f4 <__hidden___udivsi3>
   1c884:	010b5b13          	srli	s6,s6,0x10
   1c888:	00050593          	mv	a1,a0
   1c88c:	00050a13          	mv	s4,a0
   1c890:	000b0513          	mv	a0,s6
   1c894:	235050ef          	jal	222c8 <__mulsi3>
   1c898:	00050413          	mv	s0,a0
   1c89c:	000a8593          	mv	a1,s5
   1c8a0:	00090513          	mv	a0,s2
   1c8a4:	299050ef          	jal	2233c <__umodsi3>
   1c8a8:	01051513          	slli	a0,a0,0x10
   1c8ac:	0104d713          	srli	a4,s1,0x10
   1c8b0:	00a76733          	or	a4,a4,a0
   1c8b4:	000a0913          	mv	s2,s4
   1c8b8:	00877e63          	bgeu	a4,s0,1c8d4 <__udivdi3+0xfc>
   1c8bc:	00e98733          	add	a4,s3,a4
   1c8c0:	fffa0913          	addi	s2,s4,-1
   1c8c4:	01376863          	bltu	a4,s3,1c8d4 <__udivdi3+0xfc>
   1c8c8:	00877663          	bgeu	a4,s0,1c8d4 <__udivdi3+0xfc>
   1c8cc:	ffea0913          	addi	s2,s4,-2
   1c8d0:	01370733          	add	a4,a4,s3
   1c8d4:	40870433          	sub	s0,a4,s0
   1c8d8:	000a8593          	mv	a1,s5
   1c8dc:	00040513          	mv	a0,s0
   1c8e0:	215050ef          	jal	222f4 <__hidden___udivsi3>
   1c8e4:	00050593          	mv	a1,a0
   1c8e8:	00050a13          	mv	s4,a0
   1c8ec:	000b0513          	mv	a0,s6
   1c8f0:	1d9050ef          	jal	222c8 <__mulsi3>
   1c8f4:	00050b13          	mv	s6,a0
   1c8f8:	000a8593          	mv	a1,s5
   1c8fc:	00040513          	mv	a0,s0
   1c900:	23d050ef          	jal	2233c <__umodsi3>
   1c904:	01049493          	slli	s1,s1,0x10
   1c908:	01051513          	slli	a0,a0,0x10
   1c90c:	0104d493          	srli	s1,s1,0x10
   1c910:	00a4e4b3          	or	s1,s1,a0
   1c914:	000a0713          	mv	a4,s4
   1c918:	0164fc63          	bgeu	s1,s6,1c930 <__udivdi3+0x158>
   1c91c:	009984b3          	add	s1,s3,s1
   1c920:	fffa0713          	addi	a4,s4,-1
   1c924:	0134e663          	bltu	s1,s3,1c930 <__udivdi3+0x158>
   1c928:	0164f463          	bgeu	s1,s6,1c930 <__udivdi3+0x158>
   1c92c:	ffea0713          	addi	a4,s4,-2
   1c930:	01091793          	slli	a5,s2,0x10
   1c934:	00e7e7b3          	or	a5,a5,a4
   1c938:	00000913          	li	s2,0
   1c93c:	1200006f          	j	1ca5c <__udivdi3+0x284>
   1c940:	010006b7          	lui	a3,0x1000
   1c944:	01800713          	li	a4,24
   1c948:	eed67ce3          	bgeu	a2,a3,1c840 <__udivdi3+0x68>
   1c94c:	01000713          	li	a4,16
   1c950:	ef1ff06f          	j	1c840 <__udivdi3+0x68>
   1c954:	00000713          	li	a4,0
   1c958:	00060c63          	beqz	a2,1c970 <__udivdi3+0x198>
   1c95c:	00010737          	lui	a4,0x10
   1c960:	12e67e63          	bgeu	a2,a4,1ca9c <__udivdi3+0x2c4>
   1c964:	10063713          	sltiu	a4,a2,256
   1c968:	00173713          	seqz	a4,a4
   1c96c:	00371713          	slli	a4,a4,0x3
   1c970:	00e656b3          	srl	a3,a2,a4
   1c974:	00d787b3          	add	a5,a5,a3
   1c978:	0007c783          	lbu	a5,0(a5)
   1c97c:	02000693          	li	a3,32
   1c980:	00e787b3          	add	a5,a5,a4
   1c984:	40f68733          	sub	a4,a3,a5
   1c988:	12f69463          	bne	a3,a5,1cab0 <__udivdi3+0x2d8>
   1c98c:	40c58a33          	sub	s4,a1,a2
   1c990:	00100913          	li	s2,1
   1c994:	0109db13          	srli	s6,s3,0x10
   1c998:	000b0593          	mv	a1,s6
   1c99c:	000a0513          	mv	a0,s4
   1c9a0:	01099b93          	slli	s7,s3,0x10
   1c9a4:	151050ef          	jal	222f4 <__hidden___udivsi3>
   1c9a8:	010bdb93          	srli	s7,s7,0x10
   1c9ac:	00050593          	mv	a1,a0
   1c9b0:	00050c13          	mv	s8,a0
   1c9b4:	000b8513          	mv	a0,s7
   1c9b8:	111050ef          	jal	222c8 <__mulsi3>
   1c9bc:	00050a93          	mv	s5,a0
   1c9c0:	000b0593          	mv	a1,s6
   1c9c4:	000a0513          	mv	a0,s4
   1c9c8:	175050ef          	jal	2233c <__umodsi3>
   1c9cc:	01051513          	slli	a0,a0,0x10
   1c9d0:	0104d713          	srli	a4,s1,0x10
   1c9d4:	00a76733          	or	a4,a4,a0
   1c9d8:	000c0a13          	mv	s4,s8
   1c9dc:	01577e63          	bgeu	a4,s5,1c9f8 <__udivdi3+0x220>
   1c9e0:	00e98733          	add	a4,s3,a4
   1c9e4:	fffc0a13          	addi	s4,s8,-1
   1c9e8:	01376863          	bltu	a4,s3,1c9f8 <__udivdi3+0x220>
   1c9ec:	01577663          	bgeu	a4,s5,1c9f8 <__udivdi3+0x220>
   1c9f0:	ffec0a13          	addi	s4,s8,-2
   1c9f4:	01370733          	add	a4,a4,s3
   1c9f8:	41570433          	sub	s0,a4,s5
   1c9fc:	000b0593          	mv	a1,s6
   1ca00:	00040513          	mv	a0,s0
   1ca04:	0f1050ef          	jal	222f4 <__hidden___udivsi3>
   1ca08:	00050593          	mv	a1,a0
   1ca0c:	00050a93          	mv	s5,a0
   1ca10:	000b8513          	mv	a0,s7
   1ca14:	0b5050ef          	jal	222c8 <__mulsi3>
   1ca18:	00050b93          	mv	s7,a0
   1ca1c:	000b0593          	mv	a1,s6
   1ca20:	00040513          	mv	a0,s0
   1ca24:	119050ef          	jal	2233c <__umodsi3>
   1ca28:	01049493          	slli	s1,s1,0x10
   1ca2c:	01051513          	slli	a0,a0,0x10
   1ca30:	0104d493          	srli	s1,s1,0x10
   1ca34:	00a4e4b3          	or	s1,s1,a0
   1ca38:	000a8713          	mv	a4,s5
   1ca3c:	0174fc63          	bgeu	s1,s7,1ca54 <__udivdi3+0x27c>
   1ca40:	009984b3          	add	s1,s3,s1
   1ca44:	fffa8713          	addi	a4,s5,-1
   1ca48:	0134e663          	bltu	s1,s3,1ca54 <__udivdi3+0x27c>
   1ca4c:	0174f463          	bgeu	s1,s7,1ca54 <__udivdi3+0x27c>
   1ca50:	ffea8713          	addi	a4,s5,-2
   1ca54:	010a1793          	slli	a5,s4,0x10
   1ca58:	00e7e7b3          	or	a5,a5,a4
   1ca5c:	02c12083          	lw	ra,44(sp)
   1ca60:	02812403          	lw	s0,40(sp)
   1ca64:	02412483          	lw	s1,36(sp)
   1ca68:	01c12983          	lw	s3,28(sp)
   1ca6c:	01812a03          	lw	s4,24(sp)
   1ca70:	01412a83          	lw	s5,20(sp)
   1ca74:	01012b03          	lw	s6,16(sp)
   1ca78:	00c12b83          	lw	s7,12(sp)
   1ca7c:	00812c03          	lw	s8,8(sp)
   1ca80:	00412c83          	lw	s9,4(sp)
   1ca84:	00012d03          	lw	s10,0(sp)
   1ca88:	00090593          	mv	a1,s2
   1ca8c:	00078513          	mv	a0,a5
   1ca90:	02012903          	lw	s2,32(sp)
   1ca94:	03010113          	addi	sp,sp,48
   1ca98:	00008067          	ret
   1ca9c:	010006b7          	lui	a3,0x1000
   1caa0:	01800713          	li	a4,24
   1caa4:	ecd676e3          	bgeu	a2,a3,1c970 <__udivdi3+0x198>
   1caa8:	01000713          	li	a4,16
   1caac:	ec5ff06f          	j	1c970 <__udivdi3+0x198>
   1cab0:	00e619b3          	sll	s3,a2,a4
   1cab4:	00f5d933          	srl	s2,a1,a5
   1cab8:	0109db93          	srli	s7,s3,0x10
   1cabc:	00e595b3          	sll	a1,a1,a4
   1cac0:	00fa57b3          	srl	a5,s4,a5
   1cac4:	00b7eab3          	or	s5,a5,a1
   1cac8:	00ea14b3          	sll	s1,s4,a4
   1cacc:	000b8593          	mv	a1,s7
   1cad0:	00090513          	mv	a0,s2
   1cad4:	01099a13          	slli	s4,s3,0x10
   1cad8:	01d050ef          	jal	222f4 <__hidden___udivsi3>
   1cadc:	010a5a13          	srli	s4,s4,0x10
   1cae0:	00050593          	mv	a1,a0
   1cae4:	00050b13          	mv	s6,a0
   1cae8:	000a0513          	mv	a0,s4
   1caec:	7dc050ef          	jal	222c8 <__mulsi3>
   1caf0:	00050413          	mv	s0,a0
   1caf4:	000b8593          	mv	a1,s7
   1caf8:	00090513          	mv	a0,s2
   1cafc:	041050ef          	jal	2233c <__umodsi3>
   1cb00:	01051513          	slli	a0,a0,0x10
   1cb04:	010ad713          	srli	a4,s5,0x10
   1cb08:	00a76733          	or	a4,a4,a0
   1cb0c:	000b0913          	mv	s2,s6
   1cb10:	00877e63          	bgeu	a4,s0,1cb2c <__udivdi3+0x354>
   1cb14:	00e98733          	add	a4,s3,a4
   1cb18:	fffb0913          	addi	s2,s6,-1
   1cb1c:	01376863          	bltu	a4,s3,1cb2c <__udivdi3+0x354>
   1cb20:	00877663          	bgeu	a4,s0,1cb2c <__udivdi3+0x354>
   1cb24:	ffeb0913          	addi	s2,s6,-2
   1cb28:	01370733          	add	a4,a4,s3
   1cb2c:	40870433          	sub	s0,a4,s0
   1cb30:	000b8593          	mv	a1,s7
   1cb34:	00040513          	mv	a0,s0
   1cb38:	7bc050ef          	jal	222f4 <__hidden___udivsi3>
   1cb3c:	00050593          	mv	a1,a0
   1cb40:	00050b13          	mv	s6,a0
   1cb44:	000a0513          	mv	a0,s4
   1cb48:	780050ef          	jal	222c8 <__mulsi3>
   1cb4c:	00050a13          	mv	s4,a0
   1cb50:	000b8593          	mv	a1,s7
   1cb54:	00040513          	mv	a0,s0
   1cb58:	7e4050ef          	jal	2233c <__umodsi3>
   1cb5c:	010a9793          	slli	a5,s5,0x10
   1cb60:	01051513          	slli	a0,a0,0x10
   1cb64:	0107d793          	srli	a5,a5,0x10
   1cb68:	00a7e7b3          	or	a5,a5,a0
   1cb6c:	000b0713          	mv	a4,s6
   1cb70:	0147fe63          	bgeu	a5,s4,1cb8c <__udivdi3+0x3b4>
   1cb74:	00f987b3          	add	a5,s3,a5
   1cb78:	fffb0713          	addi	a4,s6,-1
   1cb7c:	0137e863          	bltu	a5,s3,1cb8c <__udivdi3+0x3b4>
   1cb80:	0147f663          	bgeu	a5,s4,1cb8c <__udivdi3+0x3b4>
   1cb84:	ffeb0713          	addi	a4,s6,-2
   1cb88:	013787b3          	add	a5,a5,s3
   1cb8c:	01091913          	slli	s2,s2,0x10
   1cb90:	41478a33          	sub	s4,a5,s4
   1cb94:	00e96933          	or	s2,s2,a4
   1cb98:	dfdff06f          	j	1c994 <__udivdi3+0x1bc>
   1cb9c:	1ed5ec63          	bltu	a1,a3,1cd94 <__udivdi3+0x5bc>
   1cba0:	000107b7          	lui	a5,0x10
   1cba4:	04f6f463          	bgeu	a3,a5,1cbec <__udivdi3+0x414>
   1cba8:	1006b713          	sltiu	a4,a3,256
   1cbac:	00173713          	seqz	a4,a4
   1cbb0:	00371713          	slli	a4,a4,0x3
   1cbb4:	000237b7          	lui	a5,0x23
   1cbb8:	00e6d533          	srl	a0,a3,a4
   1cbbc:	bbc78793          	addi	a5,a5,-1092 # 22bbc <__clz_tab>
   1cbc0:	00a787b3          	add	a5,a5,a0
   1cbc4:	0007c803          	lbu	a6,0(a5)
   1cbc8:	02000793          	li	a5,32
   1cbcc:	00e80833          	add	a6,a6,a4
   1cbd0:	41078933          	sub	s2,a5,a6
   1cbd4:	03079663          	bne	a5,a6,1cc00 <__udivdi3+0x428>
   1cbd8:	00100793          	li	a5,1
   1cbdc:	e8b6e0e3          	bltu	a3,a1,1ca5c <__udivdi3+0x284>
   1cbe0:	00ca37b3          	sltu	a5,s4,a2
   1cbe4:	0017b793          	seqz	a5,a5
   1cbe8:	e75ff06f          	j	1ca5c <__udivdi3+0x284>
   1cbec:	010007b7          	lui	a5,0x1000
   1cbf0:	01800713          	li	a4,24
   1cbf4:	fcf6f0e3          	bgeu	a3,a5,1cbb4 <__udivdi3+0x3dc>
   1cbf8:	01000713          	li	a4,16
   1cbfc:	fb9ff06f          	j	1cbb4 <__udivdi3+0x3dc>
   1cc00:	012696b3          	sll	a3,a3,s2
   1cc04:	01065ab3          	srl	s5,a2,a6
   1cc08:	00daeab3          	or	s5,s5,a3
   1cc0c:	0105d9b3          	srl	s3,a1,a6
   1cc10:	010adc13          	srli	s8,s5,0x10
   1cc14:	010a5833          	srl	a6,s4,a6
   1cc18:	012595b3          	sll	a1,a1,s2
   1cc1c:	00b864b3          	or	s1,a6,a1
   1cc20:	010a9b93          	slli	s7,s5,0x10
   1cc24:	000c0593          	mv	a1,s8
   1cc28:	00098513          	mv	a0,s3
   1cc2c:	01261433          	sll	s0,a2,s2
   1cc30:	010bdb93          	srli	s7,s7,0x10
   1cc34:	6c0050ef          	jal	222f4 <__hidden___udivsi3>
   1cc38:	00050593          	mv	a1,a0
   1cc3c:	00050d13          	mv	s10,a0
   1cc40:	000b8513          	mv	a0,s7
   1cc44:	684050ef          	jal	222c8 <__mulsi3>
   1cc48:	00050c93          	mv	s9,a0
   1cc4c:	000c0593          	mv	a1,s8
   1cc50:	00098513          	mv	a0,s3
   1cc54:	6e8050ef          	jal	2233c <__umodsi3>
   1cc58:	01051513          	slli	a0,a0,0x10
   1cc5c:	0104d693          	srli	a3,s1,0x10
   1cc60:	00a6e6b3          	or	a3,a3,a0
   1cc64:	000d0b13          	mv	s6,s10
   1cc68:	0196fe63          	bgeu	a3,s9,1cc84 <__udivdi3+0x4ac>
   1cc6c:	00da86b3          	add	a3,s5,a3
   1cc70:	fffd0b13          	addi	s6,s10,-1
   1cc74:	0156e863          	bltu	a3,s5,1cc84 <__udivdi3+0x4ac>
   1cc78:	0196f663          	bgeu	a3,s9,1cc84 <__udivdi3+0x4ac>
   1cc7c:	ffed0b13          	addi	s6,s10,-2
   1cc80:	015686b3          	add	a3,a3,s5
   1cc84:	419689b3          	sub	s3,a3,s9
   1cc88:	000c0593          	mv	a1,s8
   1cc8c:	00098513          	mv	a0,s3
   1cc90:	664050ef          	jal	222f4 <__hidden___udivsi3>
   1cc94:	00050593          	mv	a1,a0
   1cc98:	00050c93          	mv	s9,a0
   1cc9c:	000b8513          	mv	a0,s7
   1cca0:	628050ef          	jal	222c8 <__mulsi3>
   1cca4:	00050b93          	mv	s7,a0
   1cca8:	000c0593          	mv	a1,s8
   1ccac:	00098513          	mv	a0,s3
   1ccb0:	68c050ef          	jal	2233c <__umodsi3>
   1ccb4:	01049713          	slli	a4,s1,0x10
   1ccb8:	01051513          	slli	a0,a0,0x10
   1ccbc:	01075713          	srli	a4,a4,0x10
   1ccc0:	00a76733          	or	a4,a4,a0
   1ccc4:	000c8693          	mv	a3,s9
   1ccc8:	01777e63          	bgeu	a4,s7,1cce4 <__udivdi3+0x50c>
   1cccc:	00ea8733          	add	a4,s5,a4
   1ccd0:	fffc8693          	addi	a3,s9,-1
   1ccd4:	01576863          	bltu	a4,s5,1cce4 <__udivdi3+0x50c>
   1ccd8:	01777663          	bgeu	a4,s7,1cce4 <__udivdi3+0x50c>
   1ccdc:	ffec8693          	addi	a3,s9,-2
   1cce0:	01570733          	add	a4,a4,s5
   1cce4:	010b1793          	slli	a5,s6,0x10
   1cce8:	01069813          	slli	a6,a3,0x10
   1ccec:	01041313          	slli	t1,s0,0x10
   1ccf0:	00d7e7b3          	or	a5,a5,a3
   1ccf4:	01085813          	srli	a6,a6,0x10
   1ccf8:	01035313          	srli	t1,t1,0x10
   1ccfc:	41770733          	sub	a4,a4,s7
   1cd00:	0107de13          	srli	t3,a5,0x10
   1cd04:	01045413          	srli	s0,s0,0x10
   1cd08:	00080513          	mv	a0,a6
   1cd0c:	00030593          	mv	a1,t1
   1cd10:	5b8050ef          	jal	222c8 <__mulsi3>
   1cd14:	00050893          	mv	a7,a0
   1cd18:	00040593          	mv	a1,s0
   1cd1c:	00080513          	mv	a0,a6
   1cd20:	5a8050ef          	jal	222c8 <__mulsi3>
   1cd24:	00050813          	mv	a6,a0
   1cd28:	00030593          	mv	a1,t1
   1cd2c:	000e0513          	mv	a0,t3
   1cd30:	598050ef          	jal	222c8 <__mulsi3>
   1cd34:	00050313          	mv	t1,a0
   1cd38:	00040593          	mv	a1,s0
   1cd3c:	000e0513          	mv	a0,t3
   1cd40:	588050ef          	jal	222c8 <__mulsi3>
   1cd44:	0108d693          	srli	a3,a7,0x10
   1cd48:	00680833          	add	a6,a6,t1
   1cd4c:	010686b3          	add	a3,a3,a6
   1cd50:	00050613          	mv	a2,a0
   1cd54:	0066f663          	bgeu	a3,t1,1cd60 <__udivdi3+0x588>
   1cd58:	000105b7          	lui	a1,0x10
   1cd5c:	00b50633          	add	a2,a0,a1
   1cd60:	0106d593          	srli	a1,a3,0x10
   1cd64:	00c58633          	add	a2,a1,a2
   1cd68:	02c76263          	bltu	a4,a2,1cd8c <__udivdi3+0x5b4>
   1cd6c:	bcc716e3          	bne	a4,a2,1c938 <__udivdi3+0x160>
   1cd70:	01089893          	slli	a7,a7,0x10
   1cd74:	01069693          	slli	a3,a3,0x10
   1cd78:	0108d893          	srli	a7,a7,0x10
   1cd7c:	012a1733          	sll	a4,s4,s2
   1cd80:	011686b3          	add	a3,a3,a7
   1cd84:	00000913          	li	s2,0
   1cd88:	ccd77ae3          	bgeu	a4,a3,1ca5c <__udivdi3+0x284>
   1cd8c:	fff78793          	addi	a5,a5,-1 # ffffff <__BSS_END__+0xfdc5ab>
   1cd90:	ba9ff06f          	j	1c938 <__udivdi3+0x160>
   1cd94:	00000913          	li	s2,0
   1cd98:	00000793          	li	a5,0
   1cd9c:	cc1ff06f          	j	1ca5c <__udivdi3+0x284>

0001cda0 <__umoddi3>:
   1cda0:	fd010113          	addi	sp,sp,-48
   1cda4:	02812423          	sw	s0,40(sp)
   1cda8:	02912223          	sw	s1,36(sp)
   1cdac:	02112623          	sw	ra,44(sp)
   1cdb0:	03212023          	sw	s2,32(sp)
   1cdb4:	01312e23          	sw	s3,28(sp)
   1cdb8:	01412c23          	sw	s4,24(sp)
   1cdbc:	01512a23          	sw	s5,20(sp)
   1cdc0:	01612823          	sw	s6,16(sp)
   1cdc4:	01712623          	sw	s7,12(sp)
   1cdc8:	01812423          	sw	s8,8(sp)
   1cdcc:	01912223          	sw	s9,4(sp)
   1cdd0:	01a12023          	sw	s10,0(sp)
   1cdd4:	00050413          	mv	s0,a0
   1cdd8:	00058493          	mv	s1,a1
   1cddc:	24069c63          	bnez	a3,1d034 <__umoddi3+0x294>
   1cde0:	000237b7          	lui	a5,0x23
   1cde4:	00060993          	mv	s3,a2
   1cde8:	bbc78793          	addi	a5,a5,-1092 # 22bbc <__clz_tab>
   1cdec:	12c5fe63          	bgeu	a1,a2,1cf28 <__umoddi3+0x188>
   1cdf0:	00010737          	lui	a4,0x10
   1cdf4:	12e67063          	bgeu	a2,a4,1cf14 <__umoddi3+0x174>
   1cdf8:	10063713          	sltiu	a4,a2,256
   1cdfc:	00173713          	seqz	a4,a4
   1ce00:	00371713          	slli	a4,a4,0x3
   1ce04:	00e656b3          	srl	a3,a2,a4
   1ce08:	00d787b3          	add	a5,a5,a3
   1ce0c:	0007c783          	lbu	a5,0(a5)
   1ce10:	00e787b3          	add	a5,a5,a4
   1ce14:	02000713          	li	a4,32
   1ce18:	40f70933          	sub	s2,a4,a5
   1ce1c:	00f70c63          	beq	a4,a5,1ce34 <__umoddi3+0x94>
   1ce20:	012594b3          	sll	s1,a1,s2
   1ce24:	00f557b3          	srl	a5,a0,a5
   1ce28:	012619b3          	sll	s3,a2,s2
   1ce2c:	0097e4b3          	or	s1,a5,s1
   1ce30:	01251433          	sll	s0,a0,s2
   1ce34:	0109da93          	srli	s5,s3,0x10
   1ce38:	000a8593          	mv	a1,s5
   1ce3c:	01099b13          	slli	s6,s3,0x10
   1ce40:	00048513          	mv	a0,s1
   1ce44:	4b0050ef          	jal	222f4 <__hidden___udivsi3>
   1ce48:	010b5b13          	srli	s6,s6,0x10
   1ce4c:	000b0593          	mv	a1,s6
   1ce50:	478050ef          	jal	222c8 <__mulsi3>
   1ce54:	00050a13          	mv	s4,a0
   1ce58:	000a8593          	mv	a1,s5
   1ce5c:	00048513          	mv	a0,s1
   1ce60:	4dc050ef          	jal	2233c <__umodsi3>
   1ce64:	01051513          	slli	a0,a0,0x10
   1ce68:	01045793          	srli	a5,s0,0x10
   1ce6c:	00a7e7b3          	or	a5,a5,a0
   1ce70:	0147fa63          	bgeu	a5,s4,1ce84 <__umoddi3+0xe4>
   1ce74:	00f987b3          	add	a5,s3,a5
   1ce78:	0137e663          	bltu	a5,s3,1ce84 <__umoddi3+0xe4>
   1ce7c:	0147f463          	bgeu	a5,s4,1ce84 <__umoddi3+0xe4>
   1ce80:	013787b3          	add	a5,a5,s3
   1ce84:	414784b3          	sub	s1,a5,s4
   1ce88:	000a8593          	mv	a1,s5
   1ce8c:	00048513          	mv	a0,s1
   1ce90:	464050ef          	jal	222f4 <__hidden___udivsi3>
   1ce94:	000b0593          	mv	a1,s6
   1ce98:	430050ef          	jal	222c8 <__mulsi3>
   1ce9c:	00050a13          	mv	s4,a0
   1cea0:	000a8593          	mv	a1,s5
   1cea4:	00048513          	mv	a0,s1
   1cea8:	494050ef          	jal	2233c <__umodsi3>
   1ceac:	01041413          	slli	s0,s0,0x10
   1ceb0:	01051513          	slli	a0,a0,0x10
   1ceb4:	01045413          	srli	s0,s0,0x10
   1ceb8:	00a46433          	or	s0,s0,a0
   1cebc:	01447a63          	bgeu	s0,s4,1ced0 <__umoddi3+0x130>
   1cec0:	00898433          	add	s0,s3,s0
   1cec4:	01346663          	bltu	s0,s3,1ced0 <__umoddi3+0x130>
   1cec8:	01447463          	bgeu	s0,s4,1ced0 <__umoddi3+0x130>
   1cecc:	01340433          	add	s0,s0,s3
   1ced0:	41440433          	sub	s0,s0,s4
   1ced4:	01245533          	srl	a0,s0,s2
   1ced8:	00000593          	li	a1,0
   1cedc:	02c12083          	lw	ra,44(sp)
   1cee0:	02812403          	lw	s0,40(sp)
   1cee4:	02412483          	lw	s1,36(sp)
   1cee8:	02012903          	lw	s2,32(sp)
   1ceec:	01c12983          	lw	s3,28(sp)
   1cef0:	01812a03          	lw	s4,24(sp)
   1cef4:	01412a83          	lw	s5,20(sp)
   1cef8:	01012b03          	lw	s6,16(sp)
   1cefc:	00c12b83          	lw	s7,12(sp)
   1cf00:	00812c03          	lw	s8,8(sp)
   1cf04:	00412c83          	lw	s9,4(sp)
   1cf08:	00012d03          	lw	s10,0(sp)
   1cf0c:	03010113          	addi	sp,sp,48
   1cf10:	00008067          	ret
   1cf14:	010006b7          	lui	a3,0x1000
   1cf18:	01800713          	li	a4,24
   1cf1c:	eed674e3          	bgeu	a2,a3,1ce04 <__umoddi3+0x64>
   1cf20:	01000713          	li	a4,16
   1cf24:	ee1ff06f          	j	1ce04 <__umoddi3+0x64>
   1cf28:	00000713          	li	a4,0
   1cf2c:	00060c63          	beqz	a2,1cf44 <__umoddi3+0x1a4>
   1cf30:	00010737          	lui	a4,0x10
   1cf34:	0ee67663          	bgeu	a2,a4,1d020 <__umoddi3+0x280>
   1cf38:	10063713          	sltiu	a4,a2,256
   1cf3c:	00173713          	seqz	a4,a4
   1cf40:	00371713          	slli	a4,a4,0x3
   1cf44:	00e656b3          	srl	a3,a2,a4
   1cf48:	00d787b3          	add	a5,a5,a3
   1cf4c:	0007c783          	lbu	a5,0(a5)
   1cf50:	40c584b3          	sub	s1,a1,a2
   1cf54:	00e787b3          	add	a5,a5,a4
   1cf58:	02000713          	li	a4,32
   1cf5c:	40f70933          	sub	s2,a4,a5
   1cf60:	ecf70ae3          	beq	a4,a5,1ce34 <__umoddi3+0x94>
   1cf64:	012619b3          	sll	s3,a2,s2
   1cf68:	00f5dbb3          	srl	s7,a1,a5
   1cf6c:	0109db13          	srli	s6,s3,0x10
   1cf70:	00f557b3          	srl	a5,a0,a5
   1cf74:	012595b3          	sll	a1,a1,s2
   1cf78:	00b7ea33          	or	s4,a5,a1
   1cf7c:	01251433          	sll	s0,a0,s2
   1cf80:	000b0593          	mv	a1,s6
   1cf84:	01099a93          	slli	s5,s3,0x10
   1cf88:	000b8513          	mv	a0,s7
   1cf8c:	368050ef          	jal	222f4 <__hidden___udivsi3>
   1cf90:	010ada93          	srli	s5,s5,0x10
   1cf94:	000a8593          	mv	a1,s5
   1cf98:	330050ef          	jal	222c8 <__mulsi3>
   1cf9c:	00050493          	mv	s1,a0
   1cfa0:	000b0593          	mv	a1,s6
   1cfa4:	000b8513          	mv	a0,s7
   1cfa8:	394050ef          	jal	2233c <__umodsi3>
   1cfac:	01051513          	slli	a0,a0,0x10
   1cfb0:	010a5713          	srli	a4,s4,0x10
   1cfb4:	00a76733          	or	a4,a4,a0
   1cfb8:	00977a63          	bgeu	a4,s1,1cfcc <__umoddi3+0x22c>
   1cfbc:	00e98733          	add	a4,s3,a4
   1cfc0:	01376663          	bltu	a4,s3,1cfcc <__umoddi3+0x22c>
   1cfc4:	00977463          	bgeu	a4,s1,1cfcc <__umoddi3+0x22c>
   1cfc8:	01370733          	add	a4,a4,s3
   1cfcc:	409704b3          	sub	s1,a4,s1
   1cfd0:	000b0593          	mv	a1,s6
   1cfd4:	00048513          	mv	a0,s1
   1cfd8:	31c050ef          	jal	222f4 <__hidden___udivsi3>
   1cfdc:	000a8593          	mv	a1,s5
   1cfe0:	2e8050ef          	jal	222c8 <__mulsi3>
   1cfe4:	00050a93          	mv	s5,a0
   1cfe8:	000b0593          	mv	a1,s6
   1cfec:	00048513          	mv	a0,s1
   1cff0:	34c050ef          	jal	2233c <__umodsi3>
   1cff4:	010a1793          	slli	a5,s4,0x10
   1cff8:	01051513          	slli	a0,a0,0x10
   1cffc:	0107d793          	srli	a5,a5,0x10
   1d000:	00a7e7b3          	or	a5,a5,a0
   1d004:	0157fa63          	bgeu	a5,s5,1d018 <__umoddi3+0x278>
   1d008:	00f987b3          	add	a5,s3,a5
   1d00c:	0137e663          	bltu	a5,s3,1d018 <__umoddi3+0x278>
   1d010:	0157f463          	bgeu	a5,s5,1d018 <__umoddi3+0x278>
   1d014:	013787b3          	add	a5,a5,s3
   1d018:	415784b3          	sub	s1,a5,s5
   1d01c:	e19ff06f          	j	1ce34 <__umoddi3+0x94>
   1d020:	010006b7          	lui	a3,0x1000
   1d024:	01800713          	li	a4,24
   1d028:	f0d67ee3          	bgeu	a2,a3,1cf44 <__umoddi3+0x1a4>
   1d02c:	01000713          	li	a4,16
   1d030:	f15ff06f          	j	1cf44 <__umoddi3+0x1a4>
   1d034:	ead5e4e3          	bltu	a1,a3,1cedc <__umoddi3+0x13c>
   1d038:	000107b7          	lui	a5,0x10
   1d03c:	04f6fe63          	bgeu	a3,a5,1d098 <__umoddi3+0x2f8>
   1d040:	1006b793          	sltiu	a5,a3,256
   1d044:	0017b793          	seqz	a5,a5
   1d048:	00379793          	slli	a5,a5,0x3
   1d04c:	00023737          	lui	a4,0x23
   1d050:	00f6d833          	srl	a6,a3,a5
   1d054:	bbc70713          	addi	a4,a4,-1092 # 22bbc <__clz_tab>
   1d058:	01070733          	add	a4,a4,a6
   1d05c:	00074a83          	lbu	s5,0(a4)
   1d060:	00fa8ab3          	add	s5,s5,a5
   1d064:	02000793          	li	a5,32
   1d068:	41578a33          	sub	s4,a5,s5
   1d06c:	05579063          	bne	a5,s5,1d0ac <__umoddi3+0x30c>
   1d070:	00b6e463          	bltu	a3,a1,1d078 <__umoddi3+0x2d8>
   1d074:	00c56c63          	bltu	a0,a2,1d08c <__umoddi3+0x2ec>
   1d078:	40c50933          	sub	s2,a0,a2
   1d07c:	40d586b3          	sub	a3,a1,a3
   1d080:	012534b3          	sltu	s1,a0,s2
   1d084:	00090413          	mv	s0,s2
   1d088:	409684b3          	sub	s1,a3,s1
   1d08c:	00040513          	mv	a0,s0
   1d090:	00048593          	mv	a1,s1
   1d094:	e49ff06f          	j	1cedc <__umoddi3+0x13c>
   1d098:	01000737          	lui	a4,0x1000
   1d09c:	01800793          	li	a5,24
   1d0a0:	fae6f6e3          	bgeu	a3,a4,1d04c <__umoddi3+0x2ac>
   1d0a4:	01000793          	li	a5,16
   1d0a8:	fa5ff06f          	j	1d04c <__umoddi3+0x2ac>
   1d0ac:	014696b3          	sll	a3,a3,s4
   1d0b0:	01565b33          	srl	s6,a2,s5
   1d0b4:	00db6b33          	or	s6,s6,a3
   1d0b8:	0155dbb3          	srl	s7,a1,s5
   1d0bc:	01555433          	srl	s0,a0,s5
   1d0c0:	014595b3          	sll	a1,a1,s4
   1d0c4:	010b5493          	srli	s1,s6,0x10
   1d0c8:	00b46433          	or	s0,s0,a1
   1d0cc:	014519b3          	sll	s3,a0,s4
   1d0d0:	00048593          	mv	a1,s1
   1d0d4:	000b8513          	mv	a0,s7
   1d0d8:	010b1c13          	slli	s8,s6,0x10
   1d0dc:	01461933          	sll	s2,a2,s4
   1d0e0:	010c5c13          	srli	s8,s8,0x10
   1d0e4:	210050ef          	jal	222f4 <__hidden___udivsi3>
   1d0e8:	00050593          	mv	a1,a0
   1d0ec:	00050d13          	mv	s10,a0
   1d0f0:	000c0513          	mv	a0,s8
   1d0f4:	1d4050ef          	jal	222c8 <__mulsi3>
   1d0f8:	00050c93          	mv	s9,a0
   1d0fc:	00048593          	mv	a1,s1
   1d100:	000b8513          	mv	a0,s7
   1d104:	238050ef          	jal	2233c <__umodsi3>
   1d108:	01051513          	slli	a0,a0,0x10
   1d10c:	01045793          	srli	a5,s0,0x10
   1d110:	00a7e7b3          	or	a5,a5,a0
   1d114:	000d0b93          	mv	s7,s10
   1d118:	0197fe63          	bgeu	a5,s9,1d134 <__umoddi3+0x394>
   1d11c:	00fb07b3          	add	a5,s6,a5
   1d120:	fffd0b93          	addi	s7,s10,-1
   1d124:	0167e863          	bltu	a5,s6,1d134 <__umoddi3+0x394>
   1d128:	0197f663          	bgeu	a5,s9,1d134 <__umoddi3+0x394>
   1d12c:	ffed0b93          	addi	s7,s10,-2
   1d130:	016787b3          	add	a5,a5,s6
   1d134:	41978cb3          	sub	s9,a5,s9
   1d138:	00048593          	mv	a1,s1
   1d13c:	000c8513          	mv	a0,s9
   1d140:	1b4050ef          	jal	222f4 <__hidden___udivsi3>
   1d144:	00050593          	mv	a1,a0
   1d148:	00050d13          	mv	s10,a0
   1d14c:	000c0513          	mv	a0,s8
   1d150:	178050ef          	jal	222c8 <__mulsi3>
   1d154:	00048593          	mv	a1,s1
   1d158:	00050c13          	mv	s8,a0
   1d15c:	000c8513          	mv	a0,s9
   1d160:	1dc050ef          	jal	2233c <__umodsi3>
   1d164:	01041593          	slli	a1,s0,0x10
   1d168:	01051513          	slli	a0,a0,0x10
   1d16c:	0105d593          	srli	a1,a1,0x10
   1d170:	00a5e5b3          	or	a1,a1,a0
   1d174:	000d0793          	mv	a5,s10
   1d178:	0185fe63          	bgeu	a1,s8,1d194 <__umoddi3+0x3f4>
   1d17c:	00bb05b3          	add	a1,s6,a1
   1d180:	fffd0793          	addi	a5,s10,-1
   1d184:	0165e863          	bltu	a1,s6,1d194 <__umoddi3+0x3f4>
   1d188:	0185f663          	bgeu	a1,s8,1d194 <__umoddi3+0x3f4>
   1d18c:	ffed0793          	addi	a5,s10,-2
   1d190:	016585b3          	add	a1,a1,s6
   1d194:	010b9b93          	slli	s7,s7,0x10
   1d198:	00fbebb3          	or	s7,s7,a5
   1d19c:	01091893          	slli	a7,s2,0x10
   1d1a0:	01079793          	slli	a5,a5,0x10
   1d1a4:	0107d793          	srli	a5,a5,0x10
   1d1a8:	0108d893          	srli	a7,a7,0x10
   1d1ac:	418584b3          	sub	s1,a1,s8
   1d1b0:	010bdb93          	srli	s7,s7,0x10
   1d1b4:	01095713          	srli	a4,s2,0x10
   1d1b8:	00078513          	mv	a0,a5
   1d1bc:	00088593          	mv	a1,a7
   1d1c0:	108050ef          	jal	222c8 <__mulsi3>
   1d1c4:	00050813          	mv	a6,a0
   1d1c8:	00070593          	mv	a1,a4
   1d1cc:	00078513          	mv	a0,a5
   1d1d0:	00070793          	mv	a5,a4
   1d1d4:	0f4050ef          	jal	222c8 <__mulsi3>
   1d1d8:	00050713          	mv	a4,a0
   1d1dc:	00088593          	mv	a1,a7
   1d1e0:	000b8513          	mv	a0,s7
   1d1e4:	0e4050ef          	jal	222c8 <__mulsi3>
   1d1e8:	00050893          	mv	a7,a0
   1d1ec:	00078593          	mv	a1,a5
   1d1f0:	000b8513          	mv	a0,s7
   1d1f4:	0d4050ef          	jal	222c8 <__mulsi3>
   1d1f8:	01085793          	srli	a5,a6,0x10
   1d1fc:	01170733          	add	a4,a4,a7
   1d200:	00e787b3          	add	a5,a5,a4
   1d204:	00050693          	mv	a3,a0
   1d208:	0117f663          	bgeu	a5,a7,1d214 <__umoddi3+0x474>
   1d20c:	00010737          	lui	a4,0x10
   1d210:	00e506b3          	add	a3,a0,a4
   1d214:	0107d713          	srli	a4,a5,0x10
   1d218:	01081813          	slli	a6,a6,0x10
   1d21c:	01079793          	slli	a5,a5,0x10
   1d220:	01085813          	srli	a6,a6,0x10
   1d224:	00d70733          	add	a4,a4,a3
   1d228:	010787b3          	add	a5,a5,a6
   1d22c:	00e4e663          	bltu	s1,a4,1d238 <__umoddi3+0x498>
   1d230:	00e49e63          	bne	s1,a4,1d24c <__umoddi3+0x4ac>
   1d234:	00f9fc63          	bgeu	s3,a5,1d24c <__umoddi3+0x4ac>
   1d238:	41278933          	sub	s2,a5,s2
   1d23c:	0127b6b3          	sltu	a3,a5,s2
   1d240:	016686b3          	add	a3,a3,s6
   1d244:	00090793          	mv	a5,s2
   1d248:	40d70733          	sub	a4,a4,a3
   1d24c:	40f987b3          	sub	a5,s3,a5
   1d250:	00f9b9b3          	sltu	s3,s3,a5
   1d254:	40e485b3          	sub	a1,s1,a4
   1d258:	413585b3          	sub	a1,a1,s3
   1d25c:	01559ab3          	sll	s5,a1,s5
   1d260:	0147d7b3          	srl	a5,a5,s4
   1d264:	00fae533          	or	a0,s5,a5
   1d268:	0145d5b3          	srl	a1,a1,s4
   1d26c:	c71ff06f          	j	1cedc <__umoddi3+0x13c>

0001d270 <__adddf3>:
   1d270:	00100837          	lui	a6,0x100
   1d274:	fff80813          	addi	a6,a6,-1 # fffff <__BSS_END__+0xdc5ab>
   1d278:	fe010113          	addi	sp,sp,-32
   1d27c:	00b878b3          	and	a7,a6,a1
   1d280:	0145d713          	srli	a4,a1,0x14
   1d284:	00d87833          	and	a6,a6,a3
   1d288:	01412423          	sw	s4,8(sp)
   1d28c:	7ff77a13          	andi	s4,a4,2047
   1d290:	00389713          	slli	a4,a7,0x3
   1d294:	0146d893          	srli	a7,a3,0x14
   1d298:	01d55793          	srli	a5,a0,0x1d
   1d29c:	00381813          	slli	a6,a6,0x3
   1d2a0:	01312623          	sw	s3,12(sp)
   1d2a4:	7ff8f893          	andi	a7,a7,2047
   1d2a8:	01f5d993          	srli	s3,a1,0x1f
   1d2ac:	00112e23          	sw	ra,28(sp)
   1d2b0:	01d65593          	srli	a1,a2,0x1d
   1d2b4:	00812c23          	sw	s0,24(sp)
   1d2b8:	00912a23          	sw	s1,20(sp)
   1d2bc:	01212823          	sw	s2,16(sp)
   1d2c0:	01512223          	sw	s5,4(sp)
   1d2c4:	01f6d693          	srli	a3,a3,0x1f
   1d2c8:	0105e5b3          	or	a1,a1,a6
   1d2cc:	00e7e7b3          	or	a5,a5,a4
   1d2d0:	00351513          	slli	a0,a0,0x3
   1d2d4:	00361613          	slli	a2,a2,0x3
   1d2d8:	411a0833          	sub	a6,s4,a7
   1d2dc:	7ff00313          	li	t1,2047
   1d2e0:	32d99863          	bne	s3,a3,1d610 <__adddf3+0x3a0>
   1d2e4:	17005e63          	blez	a6,1d460 <__adddf3+0x1f0>
   1d2e8:	0a089863          	bnez	a7,1d398 <__adddf3+0x128>
   1d2ec:	00c5e733          	or	a4,a1,a2
   1d2f0:	02070663          	beqz	a4,1d31c <__adddf3+0xac>
   1d2f4:	fffa0813          	addi	a6,s4,-1
   1d2f8:	02081063          	bnez	a6,1d318 <__adddf3+0xa8>
   1d2fc:	00c50633          	add	a2,a0,a2
   1d300:	00a63733          	sltu	a4,a2,a0
   1d304:	00b785b3          	add	a1,a5,a1
   1d308:	00060513          	mv	a0,a2
   1d30c:	00e587b3          	add	a5,a1,a4
   1d310:	00100a13          	li	s4,1
   1d314:	0d40006f          	j	1d3e8 <__adddf3+0x178>
   1d318:	086a1663          	bne	s4,t1,1d3a4 <__adddf3+0x134>
   1d31c:	01d79693          	slli	a3,a5,0x1d
   1d320:	00355513          	srli	a0,a0,0x3
   1d324:	7ff00713          	li	a4,2047
   1d328:	00a6e6b3          	or	a3,a3,a0
   1d32c:	0037d793          	srli	a5,a5,0x3
   1d330:	00ea1e63          	bne	s4,a4,1d34c <__adddf3+0xdc>
   1d334:	00f6e6b3          	or	a3,a3,a5
   1d338:	00000793          	li	a5,0
   1d33c:	00068863          	beqz	a3,1d34c <__adddf3+0xdc>
   1d340:	000807b7          	lui	a5,0x80
   1d344:	00000693          	li	a3,0
   1d348:	00000993          	li	s3,0
   1d34c:	014a1713          	slli	a4,s4,0x14
   1d350:	7ff00637          	lui	a2,0x7ff00
   1d354:	00c79793          	slli	a5,a5,0xc
   1d358:	00c77733          	and	a4,a4,a2
   1d35c:	01c12083          	lw	ra,28(sp)
   1d360:	01812403          	lw	s0,24(sp)
   1d364:	00c7d793          	srli	a5,a5,0xc
   1d368:	00f767b3          	or	a5,a4,a5
   1d36c:	01f99713          	slli	a4,s3,0x1f
   1d370:	00e7e633          	or	a2,a5,a4
   1d374:	01412483          	lw	s1,20(sp)
   1d378:	01012903          	lw	s2,16(sp)
   1d37c:	00c12983          	lw	s3,12(sp)
   1d380:	00812a03          	lw	s4,8(sp)
   1d384:	00412a83          	lw	s5,4(sp)
   1d388:	00068513          	mv	a0,a3
   1d38c:	00060593          	mv	a1,a2
   1d390:	02010113          	addi	sp,sp,32
   1d394:	00008067          	ret
   1d398:	f86a02e3          	beq	s4,t1,1d31c <__adddf3+0xac>
   1d39c:	00800737          	lui	a4,0x800
   1d3a0:	00e5e5b3          	or	a1,a1,a4
   1d3a4:	03800713          	li	a4,56
   1d3a8:	0b074663          	blt	a4,a6,1d454 <__adddf3+0x1e4>
   1d3ac:	01f00713          	li	a4,31
   1d3b0:	02000893          	li	a7,32
   1d3b4:	07074863          	blt	a4,a6,1d424 <__adddf3+0x1b4>
   1d3b8:	410888b3          	sub	a7,a7,a6
   1d3bc:	01159733          	sll	a4,a1,a7
   1d3c0:	010656b3          	srl	a3,a2,a6
   1d3c4:	011618b3          	sll	a7,a2,a7
   1d3c8:	00d76733          	or	a4,a4,a3
   1d3cc:	011038b3          	snez	a7,a7
   1d3d0:	01176733          	or	a4,a4,a7
   1d3d4:	0105d833          	srl	a6,a1,a6
   1d3d8:	00a70533          	add	a0,a4,a0
   1d3dc:	00f80833          	add	a6,a6,a5
   1d3e0:	00e53733          	sltu	a4,a0,a4
   1d3e4:	00e807b3          	add	a5,a6,a4
   1d3e8:	00879713          	slli	a4,a5,0x8
   1d3ec:	1c075e63          	bgez	a4,1d5c8 <__adddf3+0x358>
   1d3f0:	001a0a13          	addi	s4,s4,1
   1d3f4:	7ff00713          	li	a4,2047
   1d3f8:	5cea0863          	beq	s4,a4,1d9c8 <__adddf3+0x758>
   1d3fc:	ff800737          	lui	a4,0xff800
   1d400:	fff70713          	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1d404:	00e7f7b3          	and	a5,a5,a4
   1d408:	00155713          	srli	a4,a0,0x1
   1d40c:	00157513          	andi	a0,a0,1
   1d410:	00a76733          	or	a4,a4,a0
   1d414:	01f79513          	slli	a0,a5,0x1f
   1d418:	00e56533          	or	a0,a0,a4
   1d41c:	0017d793          	srli	a5,a5,0x1
   1d420:	1a80006f          	j	1d5c8 <__adddf3+0x358>
   1d424:	fe080713          	addi	a4,a6,-32
   1d428:	00e5d733          	srl	a4,a1,a4
   1d42c:	00000693          	li	a3,0
   1d430:	01180863          	beq	a6,a7,1d440 <__adddf3+0x1d0>
   1d434:	04000693          	li	a3,64
   1d438:	410686b3          	sub	a3,a3,a6
   1d43c:	00d596b3          	sll	a3,a1,a3
   1d440:	00c6e6b3          	or	a3,a3,a2
   1d444:	00d036b3          	snez	a3,a3
   1d448:	00d76733          	or	a4,a4,a3
   1d44c:	00000813          	li	a6,0
   1d450:	f89ff06f          	j	1d3d8 <__adddf3+0x168>
   1d454:	00c5e733          	or	a4,a1,a2
   1d458:	00e03733          	snez	a4,a4
   1d45c:	ff1ff06f          	j	1d44c <__adddf3+0x1dc>
   1d460:	0c080663          	beqz	a6,1d52c <__adddf3+0x2bc>
   1d464:	41488733          	sub	a4,a7,s4
   1d468:	020a1463          	bnez	s4,1d490 <__adddf3+0x220>
   1d46c:	00a7e6b3          	or	a3,a5,a0
   1d470:	00068863          	beqz	a3,1d480 <__adddf3+0x210>
   1d474:	fff70693          	addi	a3,a4,-1
   1d478:	e80682e3          	beqz	a3,1d2fc <__adddf3+0x8c>
   1d47c:	02671263          	bne	a4,t1,1d4a0 <__adddf3+0x230>
   1d480:	00058793          	mv	a5,a1
   1d484:	00060513          	mv	a0,a2
   1d488:	00070a13          	mv	s4,a4
   1d48c:	e91ff06f          	j	1d31c <__adddf3+0xac>
   1d490:	54688263          	beq	a7,t1,1d9d4 <__adddf3+0x764>
   1d494:	008006b7          	lui	a3,0x800
   1d498:	00d7e7b3          	or	a5,a5,a3
   1d49c:	00070693          	mv	a3,a4
   1d4a0:	03800713          	li	a4,56
   1d4a4:	06d74e63          	blt	a4,a3,1d520 <__adddf3+0x2b0>
   1d4a8:	01f00713          	li	a4,31
   1d4ac:	02000313          	li	t1,32
   1d4b0:	04d74063          	blt	a4,a3,1d4f0 <__adddf3+0x280>
   1d4b4:	40d30333          	sub	t1,t1,a3
   1d4b8:	00679733          	sll	a4,a5,t1
   1d4bc:	00d55833          	srl	a6,a0,a3
   1d4c0:	00651333          	sll	t1,a0,t1
   1d4c4:	01076733          	or	a4,a4,a6
   1d4c8:	00603333          	snez	t1,t1
   1d4cc:	00676733          	or	a4,a4,t1
   1d4d0:	00d7d6b3          	srl	a3,a5,a3
   1d4d4:	00c70633          	add	a2,a4,a2
   1d4d8:	00b686b3          	add	a3,a3,a1
   1d4dc:	00e63733          	sltu	a4,a2,a4
   1d4e0:	00060513          	mv	a0,a2
   1d4e4:	00e687b3          	add	a5,a3,a4
   1d4e8:	00088a13          	mv	s4,a7
   1d4ec:	efdff06f          	j	1d3e8 <__adddf3+0x178>
   1d4f0:	fe068713          	addi	a4,a3,-32 # 7fffe0 <__BSS_END__+0x7dc58c>
   1d4f4:	00e7d733          	srl	a4,a5,a4
   1d4f8:	00000813          	li	a6,0
   1d4fc:	00668863          	beq	a3,t1,1d50c <__adddf3+0x29c>
   1d500:	04000813          	li	a6,64
   1d504:	40d80833          	sub	a6,a6,a3
   1d508:	01079833          	sll	a6,a5,a6
   1d50c:	00a86833          	or	a6,a6,a0
   1d510:	01003833          	snez	a6,a6
   1d514:	01076733          	or	a4,a4,a6
   1d518:	00000693          	li	a3,0
   1d51c:	fb9ff06f          	j	1d4d4 <__adddf3+0x264>
   1d520:	00a7e733          	or	a4,a5,a0
   1d524:	00e03733          	snez	a4,a4
   1d528:	ff1ff06f          	j	1d518 <__adddf3+0x2a8>
   1d52c:	001a0713          	addi	a4,s4,1
   1d530:	7fe77693          	andi	a3,a4,2046
   1d534:	06069663          	bnez	a3,1d5a0 <__adddf3+0x330>
   1d538:	00a7e733          	or	a4,a5,a0
   1d53c:	040a1263          	bnez	s4,1d580 <__adddf3+0x310>
   1d540:	46070263          	beqz	a4,1d9a4 <__adddf3+0x734>
   1d544:	00c5e733          	or	a4,a1,a2
   1d548:	46070263          	beqz	a4,1d9ac <__adddf3+0x73c>
   1d54c:	00c50733          	add	a4,a0,a2
   1d550:	00b785b3          	add	a1,a5,a1
   1d554:	00a737b3          	sltu	a5,a4,a0
   1d558:	00f587b3          	add	a5,a1,a5
   1d55c:	00879693          	slli	a3,a5,0x8
   1d560:	00070613          	mv	a2,a4
   1d564:	2c06de63          	bgez	a3,1d840 <__adddf3+0x5d0>
   1d568:	ff8006b7          	lui	a3,0xff800
   1d56c:	fff68693          	addi	a3,a3,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1d570:	00d7f7b3          	and	a5,a5,a3
   1d574:	00070513          	mv	a0,a4
   1d578:	00100a13          	li	s4,1
   1d57c:	da1ff06f          	j	1d31c <__adddf3+0xac>
   1d580:	42070a63          	beqz	a4,1d9b4 <__adddf3+0x744>
   1d584:	00c5e633          	or	a2,a1,a2
   1d588:	00030a13          	mv	s4,t1
   1d58c:	d80608e3          	beqz	a2,1d31c <__adddf3+0xac>
   1d590:	00000993          	li	s3,0
   1d594:	004007b7          	lui	a5,0x400
   1d598:	00000513          	li	a0,0
   1d59c:	d81ff06f          	j	1d31c <__adddf3+0xac>
   1d5a0:	42670263          	beq	a4,t1,1d9c4 <__adddf3+0x754>
   1d5a4:	00c50633          	add	a2,a0,a2
   1d5a8:	00a63533          	sltu	a0,a2,a0
   1d5ac:	00b785b3          	add	a1,a5,a1
   1d5b0:	00a585b3          	add	a1,a1,a0
   1d5b4:	01f59513          	slli	a0,a1,0x1f
   1d5b8:	00165613          	srli	a2,a2,0x1
   1d5bc:	00c56533          	or	a0,a0,a2
   1d5c0:	0015d793          	srli	a5,a1,0x1
   1d5c4:	00070a13          	mv	s4,a4
   1d5c8:	00757713          	andi	a4,a0,7
   1d5cc:	02070063          	beqz	a4,1d5ec <__adddf3+0x37c>
   1d5d0:	00f57713          	andi	a4,a0,15
   1d5d4:	00400693          	li	a3,4
   1d5d8:	00d70a63          	beq	a4,a3,1d5ec <__adddf3+0x37c>
   1d5dc:	00d50733          	add	a4,a0,a3
   1d5e0:	00a736b3          	sltu	a3,a4,a0
   1d5e4:	00d787b3          	add	a5,a5,a3
   1d5e8:	00070513          	mv	a0,a4
   1d5ec:	00879713          	slli	a4,a5,0x8
   1d5f0:	d20756e3          	bgez	a4,1d31c <__adddf3+0xac>
   1d5f4:	001a0a13          	addi	s4,s4,1
   1d5f8:	7ff00713          	li	a4,2047
   1d5fc:	3cea0663          	beq	s4,a4,1d9c8 <__adddf3+0x758>
   1d600:	ff800737          	lui	a4,0xff800
   1d604:	fff70713          	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1d608:	00e7f7b3          	and	a5,a5,a4
   1d60c:	d11ff06f          	j	1d31c <__adddf3+0xac>
   1d610:	0f005463          	blez	a6,1d6f8 <__adddf3+0x488>
   1d614:	08089c63          	bnez	a7,1d6ac <__adddf3+0x43c>
   1d618:	00c5e733          	or	a4,a1,a2
   1d61c:	d00700e3          	beqz	a4,1d31c <__adddf3+0xac>
   1d620:	fffa0813          	addi	a6,s4,-1
   1d624:	02081063          	bnez	a6,1d644 <__adddf3+0x3d4>
   1d628:	40c50633          	sub	a2,a0,a2
   1d62c:	00c53733          	sltu	a4,a0,a2
   1d630:	40b785b3          	sub	a1,a5,a1
   1d634:	00060513          	mv	a0,a2
   1d638:	40e587b3          	sub	a5,a1,a4
   1d63c:	00100a13          	li	s4,1
   1d640:	0500006f          	j	1d690 <__adddf3+0x420>
   1d644:	cc6a0ce3          	beq	s4,t1,1d31c <__adddf3+0xac>
   1d648:	03800713          	li	a4,56
   1d64c:	0b074063          	blt	a4,a6,1d6ec <__adddf3+0x47c>
   1d650:	01f00713          	li	a4,31
   1d654:	02000893          	li	a7,32
   1d658:	07074263          	blt	a4,a6,1d6bc <__adddf3+0x44c>
   1d65c:	410888b3          	sub	a7,a7,a6
   1d660:	01159733          	sll	a4,a1,a7
   1d664:	010656b3          	srl	a3,a2,a6
   1d668:	011618b3          	sll	a7,a2,a7
   1d66c:	00d76733          	or	a4,a4,a3
   1d670:	011038b3          	snez	a7,a7
   1d674:	01176733          	or	a4,a4,a7
   1d678:	0105d833          	srl	a6,a1,a6
   1d67c:	40e50733          	sub	a4,a0,a4
   1d680:	00e536b3          	sltu	a3,a0,a4
   1d684:	41078833          	sub	a6,a5,a6
   1d688:	00070513          	mv	a0,a4
   1d68c:	40d807b3          	sub	a5,a6,a3
   1d690:	00879713          	slli	a4,a5,0x8
   1d694:	f2075ae3          	bgez	a4,1d5c8 <__adddf3+0x358>
   1d698:	00800937          	lui	s2,0x800
   1d69c:	fff90913          	addi	s2,s2,-1 # 7fffff <__BSS_END__+0x7dc5ab>
   1d6a0:	0127f933          	and	s2,a5,s2
   1d6a4:	00050a93          	mv	s5,a0
   1d6a8:	2180006f          	j	1d8c0 <__adddf3+0x650>
   1d6ac:	c66a08e3          	beq	s4,t1,1d31c <__adddf3+0xac>
   1d6b0:	00800737          	lui	a4,0x800
   1d6b4:	00e5e5b3          	or	a1,a1,a4
   1d6b8:	f91ff06f          	j	1d648 <__adddf3+0x3d8>
   1d6bc:	fe080713          	addi	a4,a6,-32
   1d6c0:	00e5d733          	srl	a4,a1,a4
   1d6c4:	00000693          	li	a3,0
   1d6c8:	01180863          	beq	a6,a7,1d6d8 <__adddf3+0x468>
   1d6cc:	04000693          	li	a3,64
   1d6d0:	410686b3          	sub	a3,a3,a6
   1d6d4:	00d596b3          	sll	a3,a1,a3
   1d6d8:	00c6e6b3          	or	a3,a3,a2
   1d6dc:	00d036b3          	snez	a3,a3
   1d6e0:	00d76733          	or	a4,a4,a3
   1d6e4:	00000813          	li	a6,0
   1d6e8:	f95ff06f          	j	1d67c <__adddf3+0x40c>
   1d6ec:	00c5e733          	or	a4,a1,a2
   1d6f0:	00e03733          	snez	a4,a4
   1d6f4:	ff1ff06f          	j	1d6e4 <__adddf3+0x474>
   1d6f8:	0e080463          	beqz	a6,1d7e0 <__adddf3+0x570>
   1d6fc:	41488833          	sub	a6,a7,s4
   1d700:	040a1263          	bnez	s4,1d744 <__adddf3+0x4d4>
   1d704:	00a7e733          	or	a4,a5,a0
   1d708:	02070463          	beqz	a4,1d730 <__adddf3+0x4c0>
   1d70c:	fff80713          	addi	a4,a6,-1
   1d710:	00071e63          	bnez	a4,1d72c <__adddf3+0x4bc>
   1d714:	40a60533          	sub	a0,a2,a0
   1d718:	40f585b3          	sub	a1,a1,a5
   1d71c:	00a63633          	sltu	a2,a2,a0
   1d720:	40c587b3          	sub	a5,a1,a2
   1d724:	00068993          	mv	s3,a3
   1d728:	f15ff06f          	j	1d63c <__adddf3+0x3cc>
   1d72c:	02681463          	bne	a6,t1,1d754 <__adddf3+0x4e4>
   1d730:	00068993          	mv	s3,a3
   1d734:	00058793          	mv	a5,a1
   1d738:	00060513          	mv	a0,a2
   1d73c:	00080a13          	mv	s4,a6
   1d740:	bddff06f          	j	1d31c <__adddf3+0xac>
   1d744:	28688663          	beq	a7,t1,1d9d0 <__adddf3+0x760>
   1d748:	00800737          	lui	a4,0x800
   1d74c:	00e7e7b3          	or	a5,a5,a4
   1d750:	00080713          	mv	a4,a6
   1d754:	03800813          	li	a6,56
   1d758:	06e84e63          	blt	a6,a4,1d7d4 <__adddf3+0x564>
   1d75c:	01f00813          	li	a6,31
   1d760:	02000e13          	li	t3,32
   1d764:	04e84063          	blt	a6,a4,1d7a4 <__adddf3+0x534>
   1d768:	40ee0e33          	sub	t3,t3,a4
   1d76c:	00e55333          	srl	t1,a0,a4
   1d770:	01c79833          	sll	a6,a5,t3
   1d774:	01c51e33          	sll	t3,a0,t3
   1d778:	00686833          	or	a6,a6,t1
   1d77c:	01c03e33          	snez	t3,t3
   1d780:	01c86533          	or	a0,a6,t3
   1d784:	00e7d733          	srl	a4,a5,a4
   1d788:	40a60533          	sub	a0,a2,a0
   1d78c:	40e58733          	sub	a4,a1,a4
   1d790:	00a63633          	sltu	a2,a2,a0
   1d794:	40c707b3          	sub	a5,a4,a2
   1d798:	00088a13          	mv	s4,a7
   1d79c:	00068993          	mv	s3,a3
   1d7a0:	ef1ff06f          	j	1d690 <__adddf3+0x420>
   1d7a4:	fe070813          	addi	a6,a4,-32 # 7fffe0 <__BSS_END__+0x7dc58c>
   1d7a8:	0107d833          	srl	a6,a5,a6
   1d7ac:	00000313          	li	t1,0
   1d7b0:	01c70863          	beq	a4,t3,1d7c0 <__adddf3+0x550>
   1d7b4:	04000313          	li	t1,64
   1d7b8:	40e30333          	sub	t1,t1,a4
   1d7bc:	00679333          	sll	t1,a5,t1
   1d7c0:	00a36333          	or	t1,t1,a0
   1d7c4:	00603333          	snez	t1,t1
   1d7c8:	00686533          	or	a0,a6,t1
   1d7cc:	00000713          	li	a4,0
   1d7d0:	fb9ff06f          	j	1d788 <__adddf3+0x518>
   1d7d4:	00a7e533          	or	a0,a5,a0
   1d7d8:	00a03533          	snez	a0,a0
   1d7dc:	ff1ff06f          	j	1d7cc <__adddf3+0x55c>
   1d7e0:	001a0713          	addi	a4,s4,1
   1d7e4:	7fe77713          	andi	a4,a4,2046
   1d7e8:	0a071463          	bnez	a4,1d890 <__adddf3+0x620>
   1d7ec:	00a7e833          	or	a6,a5,a0
   1d7f0:	00c5e733          	or	a4,a1,a2
   1d7f4:	060a1a63          	bnez	s4,1d868 <__adddf3+0x5f8>
   1d7f8:	00081a63          	bnez	a6,1d80c <__adddf3+0x59c>
   1d7fc:	00058793          	mv	a5,a1
   1d800:	02071e63          	bnez	a4,1d83c <__adddf3+0x5cc>
   1d804:	00000993          	li	s3,0
   1d808:	1c00006f          	j	1d9c8 <__adddf3+0x758>
   1d80c:	1a070063          	beqz	a4,1d9ac <__adddf3+0x73c>
   1d810:	40c50833          	sub	a6,a0,a2
   1d814:	010538b3          	sltu	a7,a0,a6
   1d818:	40b78733          	sub	a4,a5,a1
   1d81c:	41170733          	sub	a4,a4,a7
   1d820:	00871893          	slli	a7,a4,0x8
   1d824:	0208d863          	bgez	a7,1d854 <__adddf3+0x5e4>
   1d828:	40a60533          	sub	a0,a2,a0
   1d82c:	00a63733          	sltu	a4,a2,a0
   1d830:	40f585b3          	sub	a1,a1,a5
   1d834:	00050613          	mv	a2,a0
   1d838:	40e587b3          	sub	a5,a1,a4
   1d83c:	00068993          	mv	s3,a3
   1d840:	00c7e533          	or	a0,a5,a2
   1d844:	0e050663          	beqz	a0,1d930 <__adddf3+0x6c0>
   1d848:	00060513          	mv	a0,a2
   1d84c:	00000a13          	li	s4,0
   1d850:	d79ff06f          	j	1d5c8 <__adddf3+0x358>
   1d854:	00e86533          	or	a0,a6,a4
   1d858:	18050663          	beqz	a0,1d9e4 <__adddf3+0x774>
   1d85c:	00070793          	mv	a5,a4
   1d860:	00080613          	mv	a2,a6
   1d864:	fddff06f          	j	1d840 <__adddf3+0x5d0>
   1d868:	00081e63          	bnez	a6,1d884 <__adddf3+0x614>
   1d86c:	00068993          	mv	s3,a3
   1d870:	14071263          	bnez	a4,1d9b4 <__adddf3+0x744>
   1d874:	00000993          	li	s3,0
   1d878:	004007b7          	lui	a5,0x400
   1d87c:	00000513          	li	a0,0
   1d880:	13c0006f          	j	1d9bc <__adddf3+0x74c>
   1d884:	00030a13          	mv	s4,t1
   1d888:	a8070ae3          	beqz	a4,1d31c <__adddf3+0xac>
   1d88c:	d05ff06f          	j	1d590 <__adddf3+0x320>
   1d890:	40c50733          	sub	a4,a0,a2
   1d894:	00e53833          	sltu	a6,a0,a4
   1d898:	40b78933          	sub	s2,a5,a1
   1d89c:	41090933          	sub	s2,s2,a6
   1d8a0:	00891813          	slli	a6,s2,0x8
   1d8a4:	00070a93          	mv	s5,a4
   1d8a8:	06085e63          	bgez	a6,1d924 <__adddf3+0x6b4>
   1d8ac:	40a60ab3          	sub	s5,a2,a0
   1d8b0:	40f58933          	sub	s2,a1,a5
   1d8b4:	01563633          	sltu	a2,a2,s5
   1d8b8:	40c90933          	sub	s2,s2,a2
   1d8bc:	00068993          	mv	s3,a3
   1d8c0:	06090e63          	beqz	s2,1d93c <__adddf3+0x6cc>
   1d8c4:	00090513          	mv	a0,s2
   1d8c8:	2d9040ef          	jal	223a0 <__clzsi2>
   1d8cc:	ff850613          	addi	a2,a0,-8
   1d8d0:	02000793          	li	a5,32
   1d8d4:	40c787b3          	sub	a5,a5,a2
   1d8d8:	00c91933          	sll	s2,s2,a2
   1d8dc:	00fad7b3          	srl	a5,s5,a5
   1d8e0:	0127e7b3          	or	a5,a5,s2
   1d8e4:	00ca9933          	sll	s2,s5,a2
   1d8e8:	0b464263          	blt	a2,s4,1d98c <__adddf3+0x71c>
   1d8ec:	41460633          	sub	a2,a2,s4
   1d8f0:	00160593          	addi	a1,a2,1 # 7ff00001 <__BSS_END__+0x7fedc5ad>
   1d8f4:	01f00713          	li	a4,31
   1d8f8:	02000693          	li	a3,32
   1d8fc:	06b74063          	blt	a4,a1,1d95c <__adddf3+0x6ec>
   1d900:	40b686b3          	sub	a3,a3,a1
   1d904:	00d79633          	sll	a2,a5,a3
   1d908:	00b95733          	srl	a4,s2,a1
   1d90c:	00d916b3          	sll	a3,s2,a3
   1d910:	00e66633          	or	a2,a2,a4
   1d914:	00d036b3          	snez	a3,a3
   1d918:	00d66633          	or	a2,a2,a3
   1d91c:	00b7d7b3          	srl	a5,a5,a1
   1d920:	f21ff06f          	j	1d840 <__adddf3+0x5d0>
   1d924:	01276533          	or	a0,a4,s2
   1d928:	f8051ce3          	bnez	a0,1d8c0 <__adddf3+0x650>
   1d92c:	00000993          	li	s3,0
   1d930:	00000793          	li	a5,0
   1d934:	00000a13          	li	s4,0
   1d938:	9e5ff06f          	j	1d31c <__adddf3+0xac>
   1d93c:	000a8513          	mv	a0,s5
   1d940:	261040ef          	jal	223a0 <__clzsi2>
   1d944:	01850613          	addi	a2,a0,24
   1d948:	01f00793          	li	a5,31
   1d94c:	f8c7d2e3          	bge	a5,a2,1d8d0 <__adddf3+0x660>
   1d950:	ff850793          	addi	a5,a0,-8
   1d954:	00fa97b3          	sll	a5,s5,a5
   1d958:	f91ff06f          	j	1d8e8 <__adddf3+0x678>
   1d95c:	fe160613          	addi	a2,a2,-31
   1d960:	00c7d633          	srl	a2,a5,a2
   1d964:	00000713          	li	a4,0
   1d968:	00d58863          	beq	a1,a3,1d978 <__adddf3+0x708>
   1d96c:	04000713          	li	a4,64
   1d970:	40b70733          	sub	a4,a4,a1
   1d974:	00e79733          	sll	a4,a5,a4
   1d978:	00e96733          	or	a4,s2,a4
   1d97c:	00e03733          	snez	a4,a4
   1d980:	00e66633          	or	a2,a2,a4
   1d984:	00000793          	li	a5,0
   1d988:	eb9ff06f          	j	1d840 <__adddf3+0x5d0>
   1d98c:	ff800737          	lui	a4,0xff800
   1d990:	fff70713          	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1d994:	40ca0a33          	sub	s4,s4,a2
   1d998:	00e7f7b3          	and	a5,a5,a4
   1d99c:	00090513          	mv	a0,s2
   1d9a0:	c29ff06f          	j	1d5c8 <__adddf3+0x358>
   1d9a4:	00058793          	mv	a5,a1
   1d9a8:	e99ff06f          	j	1d840 <__adddf3+0x5d0>
   1d9ac:	00050613          	mv	a2,a0
   1d9b0:	e91ff06f          	j	1d840 <__adddf3+0x5d0>
   1d9b4:	00058793          	mv	a5,a1
   1d9b8:	00060513          	mv	a0,a2
   1d9bc:	00030a13          	mv	s4,t1
   1d9c0:	95dff06f          	j	1d31c <__adddf3+0xac>
   1d9c4:	00070a13          	mv	s4,a4
   1d9c8:	00000793          	li	a5,0
   1d9cc:	bcdff06f          	j	1d598 <__adddf3+0x328>
   1d9d0:	00068993          	mv	s3,a3
   1d9d4:	00058793          	mv	a5,a1
   1d9d8:	00060513          	mv	a0,a2
   1d9dc:	00088a13          	mv	s4,a7
   1d9e0:	93dff06f          	j	1d31c <__adddf3+0xac>
   1d9e4:	00000993          	li	s3,0
   1d9e8:	00000793          	li	a5,0
   1d9ec:	931ff06f          	j	1d31c <__adddf3+0xac>

0001d9f0 <__divdf3>:
   1d9f0:	fb010113          	addi	sp,sp,-80
   1d9f4:	03512a23          	sw	s5,52(sp)
   1d9f8:	0145da93          	srli	s5,a1,0x14
   1d9fc:	04812423          	sw	s0,72(sp)
   1da00:	03412c23          	sw	s4,56(sp)
   1da04:	03612823          	sw	s6,48(sp)
   1da08:	03812423          	sw	s8,40(sp)
   1da0c:	03a12023          	sw	s10,32(sp)
   1da10:	00c59413          	slli	s0,a1,0xc
   1da14:	04112623          	sw	ra,76(sp)
   1da18:	04912223          	sw	s1,68(sp)
   1da1c:	05212023          	sw	s2,64(sp)
   1da20:	03312e23          	sw	s3,60(sp)
   1da24:	03712623          	sw	s7,44(sp)
   1da28:	03912223          	sw	s9,36(sp)
   1da2c:	01b12e23          	sw	s11,28(sp)
   1da30:	7ffafa93          	andi	s5,s5,2047
   1da34:	00050a13          	mv	s4,a0
   1da38:	00060d13          	mv	s10,a2
   1da3c:	00068c13          	mv	s8,a3
   1da40:	00c45413          	srli	s0,s0,0xc
   1da44:	01f5db13          	srli	s6,a1,0x1f
   1da48:	0a0a8063          	beqz	s5,1dae8 <__divdf3+0xf8>
   1da4c:	7ff00793          	li	a5,2047
   1da50:	10fa8063          	beq	s5,a5,1db50 <__divdf3+0x160>
   1da54:	01d55b93          	srli	s7,a0,0x1d
   1da58:	00341413          	slli	s0,s0,0x3
   1da5c:	008bebb3          	or	s7,s7,s0
   1da60:	008007b7          	lui	a5,0x800
   1da64:	00fbebb3          	or	s7,s7,a5
   1da68:	00351493          	slli	s1,a0,0x3
   1da6c:	c01a8a93          	addi	s5,s5,-1023
   1da70:	00000c93          	li	s9,0
   1da74:	014c5713          	srli	a4,s8,0x14
   1da78:	00cc1413          	slli	s0,s8,0xc
   1da7c:	7ff77713          	andi	a4,a4,2047
   1da80:	00c45413          	srli	s0,s0,0xc
   1da84:	01fc5c13          	srli	s8,s8,0x1f
   1da88:	0e070e63          	beqz	a4,1db84 <__divdf3+0x194>
   1da8c:	7ff00793          	li	a5,2047
   1da90:	16f70263          	beq	a4,a5,1dbf4 <__divdf3+0x204>
   1da94:	00341413          	slli	s0,s0,0x3
   1da98:	01dd5793          	srli	a5,s10,0x1d
   1da9c:	0087e7b3          	or	a5,a5,s0
   1daa0:	00800437          	lui	s0,0x800
   1daa4:	0087e433          	or	s0,a5,s0
   1daa8:	003d1813          	slli	a6,s10,0x3
   1daac:	c0170713          	addi	a4,a4,-1023
   1dab0:	00000693          	li	a3,0
   1dab4:	002c9793          	slli	a5,s9,0x2
   1dab8:	00d7e7b3          	or	a5,a5,a3
   1dabc:	40ea8ab3          	sub	s5,s5,a4
   1dac0:	fff78793          	addi	a5,a5,-1 # 7fffff <__BSS_END__+0x7dc5ab>
   1dac4:	00e00713          	li	a4,14
   1dac8:	018b4a33          	xor	s4,s6,s8
   1dacc:	14f76c63          	bltu	a4,a5,1dc24 <__divdf3+0x234>
   1dad0:	00023737          	lui	a4,0x23
   1dad4:	00279793          	slli	a5,a5,0x2
   1dad8:	b8070713          	addi	a4,a4,-1152 # 22b80 <blanks.1+0x10>
   1dadc:	00e787b3          	add	a5,a5,a4
   1dae0:	0007a783          	lw	a5,0(a5)
   1dae4:	00078067          	jr	a5
   1dae8:	00a46bb3          	or	s7,s0,a0
   1daec:	060b8c63          	beqz	s7,1db64 <__divdf3+0x174>
   1daf0:	02040e63          	beqz	s0,1db2c <__divdf3+0x13c>
   1daf4:	00040513          	mv	a0,s0
   1daf8:	0a9040ef          	jal	223a0 <__clzsi2>
   1dafc:	ff550793          	addi	a5,a0,-11
   1db00:	01d00b93          	li	s7,29
   1db04:	ff850713          	addi	a4,a0,-8
   1db08:	40fb8bb3          	sub	s7,s7,a5
   1db0c:	00e41433          	sll	s0,s0,a4
   1db10:	017a5bb3          	srl	s7,s4,s7
   1db14:	008bebb3          	or	s7,s7,s0
   1db18:	00ea1433          	sll	s0,s4,a4
   1db1c:	c0d00a93          	li	s5,-1011
   1db20:	40aa8ab3          	sub	s5,s5,a0
   1db24:	00040493          	mv	s1,s0
   1db28:	f49ff06f          	j	1da70 <__divdf3+0x80>
   1db2c:	075040ef          	jal	223a0 <__clzsi2>
   1db30:	00050b93          	mv	s7,a0
   1db34:	015b8793          	addi	a5,s7,21
   1db38:	01c00713          	li	a4,28
   1db3c:	02050513          	addi	a0,a0,32
   1db40:	fcf750e3          	bge	a4,a5,1db00 <__divdf3+0x110>
   1db44:	ff8b8b93          	addi	s7,s7,-8
   1db48:	017a1bb3          	sll	s7,s4,s7
   1db4c:	fd1ff06f          	j	1db1c <__divdf3+0x12c>
   1db50:	00a46bb3          	or	s7,s0,a0
   1db54:	020b9063          	bnez	s7,1db74 <__divdf3+0x184>
   1db58:	00000493          	li	s1,0
   1db5c:	00200c93          	li	s9,2
   1db60:	f15ff06f          	j	1da74 <__divdf3+0x84>
   1db64:	00000493          	li	s1,0
   1db68:	00000a93          	li	s5,0
   1db6c:	00100c93          	li	s9,1
   1db70:	f05ff06f          	j	1da74 <__divdf3+0x84>
   1db74:	00050493          	mv	s1,a0
   1db78:	00040b93          	mv	s7,s0
   1db7c:	00300c93          	li	s9,3
   1db80:	ef5ff06f          	j	1da74 <__divdf3+0x84>
   1db84:	01a46833          	or	a6,s0,s10
   1db88:	08080063          	beqz	a6,1dc08 <__divdf3+0x218>
   1db8c:	04040063          	beqz	s0,1dbcc <__divdf3+0x1dc>
   1db90:	00040513          	mv	a0,s0
   1db94:	00d040ef          	jal	223a0 <__clzsi2>
   1db98:	ff550713          	addi	a4,a0,-11
   1db9c:	01d00793          	li	a5,29
   1dba0:	ff850693          	addi	a3,a0,-8
   1dba4:	40e787b3          	sub	a5,a5,a4
   1dba8:	00d41433          	sll	s0,s0,a3
   1dbac:	00fd57b3          	srl	a5,s10,a5
   1dbb0:	0087e7b3          	or	a5,a5,s0
   1dbb4:	00dd1433          	sll	s0,s10,a3
   1dbb8:	c0d00713          	li	a4,-1011
   1dbbc:	00040813          	mv	a6,s0
   1dbc0:	40a70733          	sub	a4,a4,a0
   1dbc4:	00078413          	mv	s0,a5
   1dbc8:	ee9ff06f          	j	1dab0 <__divdf3+0xc0>
   1dbcc:	000d0513          	mv	a0,s10
   1dbd0:	7d0040ef          	jal	223a0 <__clzsi2>
   1dbd4:	00050793          	mv	a5,a0
   1dbd8:	01578713          	addi	a4,a5,21
   1dbdc:	01c00693          	li	a3,28
   1dbe0:	02050513          	addi	a0,a0,32
   1dbe4:	fae6dce3          	bge	a3,a4,1db9c <__divdf3+0x1ac>
   1dbe8:	ff878793          	addi	a5,a5,-8
   1dbec:	00fd17b3          	sll	a5,s10,a5
   1dbf0:	fc9ff06f          	j	1dbb8 <__divdf3+0x1c8>
   1dbf4:	01a46833          	or	a6,s0,s10
   1dbf8:	02081063          	bnez	a6,1dc18 <__divdf3+0x228>
   1dbfc:	00000413          	li	s0,0
   1dc00:	00200693          	li	a3,2
   1dc04:	eb1ff06f          	j	1dab4 <__divdf3+0xc4>
   1dc08:	00000413          	li	s0,0
   1dc0c:	00000713          	li	a4,0
   1dc10:	00100693          	li	a3,1
   1dc14:	ea1ff06f          	j	1dab4 <__divdf3+0xc4>
   1dc18:	000d0813          	mv	a6,s10
   1dc1c:	00300693          	li	a3,3
   1dc20:	e95ff06f          	j	1dab4 <__divdf3+0xc4>
   1dc24:	01746663          	bltu	s0,s7,1dc30 <__divdf3+0x240>
   1dc28:	448b9e63          	bne	s7,s0,1e084 <__divdf3+0x694>
   1dc2c:	4504ec63          	bltu	s1,a6,1e084 <__divdf3+0x694>
   1dc30:	01fb9713          	slli	a4,s7,0x1f
   1dc34:	0014d793          	srli	a5,s1,0x1
   1dc38:	01f49c93          	slli	s9,s1,0x1f
   1dc3c:	001bdb93          	srli	s7,s7,0x1
   1dc40:	00f764b3          	or	s1,a4,a5
   1dc44:	00841413          	slli	s0,s0,0x8
   1dc48:	01045793          	srli	a5,s0,0x10
   1dc4c:	01885d93          	srli	s11,a6,0x18
   1dc50:	00f12423          	sw	a5,8(sp)
   1dc54:	008dedb3          	or	s11,s11,s0
   1dc58:	00812583          	lw	a1,8(sp)
   1dc5c:	010d9793          	slli	a5,s11,0x10
   1dc60:	0107d793          	srli	a5,a5,0x10
   1dc64:	000b8513          	mv	a0,s7
   1dc68:	00f12623          	sw	a5,12(sp)
   1dc6c:	00881b13          	slli	s6,a6,0x8
   1dc70:	684040ef          	jal	222f4 <__hidden___udivsi3>
   1dc74:	00050593          	mv	a1,a0
   1dc78:	00050c13          	mv	s8,a0
   1dc7c:	010d9513          	slli	a0,s11,0x10
   1dc80:	01055513          	srli	a0,a0,0x10
   1dc84:	644040ef          	jal	222c8 <__mulsi3>
   1dc88:	00812583          	lw	a1,8(sp)
   1dc8c:	00050413          	mv	s0,a0
   1dc90:	000b8513          	mv	a0,s7
   1dc94:	6a8040ef          	jal	2233c <__umodsi3>
   1dc98:	01051513          	slli	a0,a0,0x10
   1dc9c:	0104d793          	srli	a5,s1,0x10
   1dca0:	00a7e7b3          	or	a5,a5,a0
   1dca4:	000c0b93          	mv	s7,s8
   1dca8:	0087fe63          	bgeu	a5,s0,1dcc4 <__divdf3+0x2d4>
   1dcac:	00fd87b3          	add	a5,s11,a5
   1dcb0:	fffc0b93          	addi	s7,s8,-1
   1dcb4:	01b7e863          	bltu	a5,s11,1dcc4 <__divdf3+0x2d4>
   1dcb8:	0087f663          	bgeu	a5,s0,1dcc4 <__divdf3+0x2d4>
   1dcbc:	ffec0b93          	addi	s7,s8,-2
   1dcc0:	01b787b3          	add	a5,a5,s11
   1dcc4:	00812583          	lw	a1,8(sp)
   1dcc8:	40878433          	sub	s0,a5,s0
   1dccc:	00040513          	mv	a0,s0
   1dcd0:	624040ef          	jal	222f4 <__hidden___udivsi3>
   1dcd4:	00050593          	mv	a1,a0
   1dcd8:	00050d13          	mv	s10,a0
   1dcdc:	010d9513          	slli	a0,s11,0x10
   1dce0:	01055513          	srli	a0,a0,0x10
   1dce4:	5e4040ef          	jal	222c8 <__mulsi3>
   1dce8:	00812583          	lw	a1,8(sp)
   1dcec:	00050c13          	mv	s8,a0
   1dcf0:	00040513          	mv	a0,s0
   1dcf4:	648040ef          	jal	2233c <__umodsi3>
   1dcf8:	01049493          	slli	s1,s1,0x10
   1dcfc:	01051513          	slli	a0,a0,0x10
   1dd00:	0104d493          	srli	s1,s1,0x10
   1dd04:	00a4e4b3          	or	s1,s1,a0
   1dd08:	000d0793          	mv	a5,s10
   1dd0c:	0184fe63          	bgeu	s1,s8,1dd28 <__divdf3+0x338>
   1dd10:	009d84b3          	add	s1,s11,s1
   1dd14:	fffd0793          	addi	a5,s10,-1
   1dd18:	01b4e863          	bltu	s1,s11,1dd28 <__divdf3+0x338>
   1dd1c:	0184f663          	bgeu	s1,s8,1dd28 <__divdf3+0x338>
   1dd20:	ffed0793          	addi	a5,s10,-2
   1dd24:	01b484b3          	add	s1,s1,s11
   1dd28:	010b9813          	slli	a6,s7,0x10
   1dd2c:	00f86833          	or	a6,a6,a5
   1dd30:	01081793          	slli	a5,a6,0x10
   1dd34:	010b1713          	slli	a4,s6,0x10
   1dd38:	01075713          	srli	a4,a4,0x10
   1dd3c:	0107d793          	srli	a5,a5,0x10
   1dd40:	418484b3          	sub	s1,s1,s8
   1dd44:	01085e93          	srli	t4,a6,0x10
   1dd48:	00078513          	mv	a0,a5
   1dd4c:	00e12623          	sw	a4,12(sp)
   1dd50:	00070593          	mv	a1,a4
   1dd54:	574040ef          	jal	222c8 <__mulsi3>
   1dd58:	00050313          	mv	t1,a0
   1dd5c:	010b5593          	srli	a1,s6,0x10
   1dd60:	00078513          	mv	a0,a5
   1dd64:	564040ef          	jal	222c8 <__mulsi3>
   1dd68:	00050793          	mv	a5,a0
   1dd6c:	00070593          	mv	a1,a4
   1dd70:	000e8513          	mv	a0,t4
   1dd74:	554040ef          	jal	222c8 <__mulsi3>
   1dd78:	00050e13          	mv	t3,a0
   1dd7c:	010b5593          	srli	a1,s6,0x10
   1dd80:	000e8513          	mv	a0,t4
   1dd84:	544040ef          	jal	222c8 <__mulsi3>
   1dd88:	01035d13          	srli	s10,t1,0x10
   1dd8c:	01c787b3          	add	a5,a5,t3
   1dd90:	00fd0d33          	add	s10,s10,a5
   1dd94:	00050693          	mv	a3,a0
   1dd98:	01cd7663          	bgeu	s10,t3,1dda4 <__divdf3+0x3b4>
   1dd9c:	000107b7          	lui	a5,0x10
   1dda0:	00f506b3          	add	a3,a0,a5
   1dda4:	010d5793          	srli	a5,s10,0x10
   1dda8:	01031313          	slli	t1,t1,0x10
   1ddac:	010d1d13          	slli	s10,s10,0x10
   1ddb0:	01035313          	srli	t1,t1,0x10
   1ddb4:	00d787b3          	add	a5,a5,a3
   1ddb8:	006d0d33          	add	s10,s10,t1
   1ddbc:	00f4e863          	bltu	s1,a5,1ddcc <__divdf3+0x3dc>
   1ddc0:	00080413          	mv	s0,a6
   1ddc4:	04f49863          	bne	s1,a5,1de14 <__divdf3+0x424>
   1ddc8:	05acf663          	bgeu	s9,s10,1de14 <__divdf3+0x424>
   1ddcc:	016c86b3          	add	a3,s9,s6
   1ddd0:	0196b633          	sltu	a2,a3,s9
   1ddd4:	01b605b3          	add	a1,a2,s11
   1ddd8:	00b484b3          	add	s1,s1,a1
   1dddc:	fff80413          	addi	s0,a6,-1
   1dde0:	00068c93          	mv	s9,a3
   1dde4:	009de663          	bltu	s11,s1,1ddf0 <__divdf3+0x400>
   1dde8:	029d9663          	bne	s11,s1,1de14 <__divdf3+0x424>
   1ddec:	02061463          	bnez	a2,1de14 <__divdf3+0x424>
   1ddf0:	00f4e663          	bltu	s1,a5,1ddfc <__divdf3+0x40c>
   1ddf4:	02979063          	bne	a5,s1,1de14 <__divdf3+0x424>
   1ddf8:	01a6fe63          	bgeu	a3,s10,1de14 <__divdf3+0x424>
   1ddfc:	00db06b3          	add	a3,s6,a3
   1de00:	00068c93          	mv	s9,a3
   1de04:	0166b6b3          	sltu	a3,a3,s6
   1de08:	01b686b3          	add	a3,a3,s11
   1de0c:	ffe80413          	addi	s0,a6,-2
   1de10:	00d484b3          	add	s1,s1,a3
   1de14:	41ac8d33          	sub	s10,s9,s10
   1de18:	40f484b3          	sub	s1,s1,a5
   1de1c:	01acb8b3          	sltu	a7,s9,s10
   1de20:	411484b3          	sub	s1,s1,a7
   1de24:	fff00813          	li	a6,-1
   1de28:	1a9d8263          	beq	s11,s1,1dfcc <__divdf3+0x5dc>
   1de2c:	00812583          	lw	a1,8(sp)
   1de30:	00048513          	mv	a0,s1
   1de34:	4c0040ef          	jal	222f4 <__hidden___udivsi3>
   1de38:	00050593          	mv	a1,a0
   1de3c:	00050c13          	mv	s8,a0
   1de40:	010d9513          	slli	a0,s11,0x10
   1de44:	01055513          	srli	a0,a0,0x10
   1de48:	480040ef          	jal	222c8 <__mulsi3>
   1de4c:	00812583          	lw	a1,8(sp)
   1de50:	00050b93          	mv	s7,a0
   1de54:	00048513          	mv	a0,s1
   1de58:	4e4040ef          	jal	2233c <__umodsi3>
   1de5c:	01051513          	slli	a0,a0,0x10
   1de60:	010d5793          	srli	a5,s10,0x10
   1de64:	00a7e7b3          	or	a5,a5,a0
   1de68:	000c0493          	mv	s1,s8
   1de6c:	0177fe63          	bgeu	a5,s7,1de88 <__divdf3+0x498>
   1de70:	00fd87b3          	add	a5,s11,a5
   1de74:	fffc0493          	addi	s1,s8,-1
   1de78:	01b7e863          	bltu	a5,s11,1de88 <__divdf3+0x498>
   1de7c:	0177f663          	bgeu	a5,s7,1de88 <__divdf3+0x498>
   1de80:	ffec0493          	addi	s1,s8,-2
   1de84:	01b787b3          	add	a5,a5,s11
   1de88:	00812583          	lw	a1,8(sp)
   1de8c:	41778c33          	sub	s8,a5,s7
   1de90:	000c0513          	mv	a0,s8
   1de94:	460040ef          	jal	222f4 <__hidden___udivsi3>
   1de98:	00050593          	mv	a1,a0
   1de9c:	00050b93          	mv	s7,a0
   1dea0:	010d9513          	slli	a0,s11,0x10
   1dea4:	01055513          	srli	a0,a0,0x10
   1dea8:	420040ef          	jal	222c8 <__mulsi3>
   1deac:	00812583          	lw	a1,8(sp)
   1deb0:	00050c93          	mv	s9,a0
   1deb4:	000c0513          	mv	a0,s8
   1deb8:	484040ef          	jal	2233c <__umodsi3>
   1debc:	010d1793          	slli	a5,s10,0x10
   1dec0:	01051513          	slli	a0,a0,0x10
   1dec4:	0107d793          	srli	a5,a5,0x10
   1dec8:	00a7e7b3          	or	a5,a5,a0
   1decc:	000b8613          	mv	a2,s7
   1ded0:	0197fe63          	bgeu	a5,s9,1deec <__divdf3+0x4fc>
   1ded4:	00fd87b3          	add	a5,s11,a5
   1ded8:	fffb8613          	addi	a2,s7,-1
   1dedc:	01b7e863          	bltu	a5,s11,1deec <__divdf3+0x4fc>
   1dee0:	0197f663          	bgeu	a5,s9,1deec <__divdf3+0x4fc>
   1dee4:	ffeb8613          	addi	a2,s7,-2
   1dee8:	01b787b3          	add	a5,a5,s11
   1deec:	01049893          	slli	a7,s1,0x10
   1def0:	00c8e8b3          	or	a7,a7,a2
   1def4:	01089313          	slli	t1,a7,0x10
   1def8:	01035313          	srli	t1,t1,0x10
   1defc:	010b1593          	slli	a1,s6,0x10
   1df00:	419787b3          	sub	a5,a5,s9
   1df04:	0108de93          	srli	t4,a7,0x10
   1df08:	00030513          	mv	a0,t1
   1df0c:	0105d593          	srli	a1,a1,0x10
   1df10:	3b8040ef          	jal	222c8 <__mulsi3>
   1df14:	00050813          	mv	a6,a0
   1df18:	010b5593          	srli	a1,s6,0x10
   1df1c:	00030513          	mv	a0,t1
   1df20:	3a8040ef          	jal	222c8 <__mulsi3>
   1df24:	010b1593          	slli	a1,s6,0x10
   1df28:	00050313          	mv	t1,a0
   1df2c:	0105d593          	srli	a1,a1,0x10
   1df30:	000e8513          	mv	a0,t4
   1df34:	394040ef          	jal	222c8 <__mulsi3>
   1df38:	00050e13          	mv	t3,a0
   1df3c:	010b5593          	srli	a1,s6,0x10
   1df40:	000e8513          	mv	a0,t4
   1df44:	384040ef          	jal	222c8 <__mulsi3>
   1df48:	01085693          	srli	a3,a6,0x10
   1df4c:	01c30333          	add	t1,t1,t3
   1df50:	006686b3          	add	a3,a3,t1
   1df54:	00050593          	mv	a1,a0
   1df58:	01c6f663          	bgeu	a3,t3,1df64 <__divdf3+0x574>
   1df5c:	00010637          	lui	a2,0x10
   1df60:	00c505b3          	add	a1,a0,a2
   1df64:	0106d613          	srli	a2,a3,0x10
   1df68:	01081813          	slli	a6,a6,0x10
   1df6c:	01069693          	slli	a3,a3,0x10
   1df70:	01085813          	srli	a6,a6,0x10
   1df74:	00b60633          	add	a2,a2,a1
   1df78:	010686b3          	add	a3,a3,a6
   1df7c:	00c7e863          	bltu	a5,a2,1df8c <__divdf3+0x59c>
   1df80:	00088813          	mv	a6,a7
   1df84:	04c79263          	bne	a5,a2,1dfc8 <__divdf3+0x5d8>
   1df88:	04068263          	beqz	a3,1dfcc <__divdf3+0x5dc>
   1df8c:	00fd87b3          	add	a5,s11,a5
   1df90:	fff88813          	addi	a6,a7,-1
   1df94:	00078593          	mv	a1,a5
   1df98:	03b7e463          	bltu	a5,s11,1dfc0 <__divdf3+0x5d0>
   1df9c:	00c7e663          	bltu	a5,a2,1dfa8 <__divdf3+0x5b8>
   1dfa0:	02c79463          	bne	a5,a2,1dfc8 <__divdf3+0x5d8>
   1dfa4:	02db7063          	bgeu	s6,a3,1dfc4 <__divdf3+0x5d4>
   1dfa8:	001b1513          	slli	a0,s6,0x1
   1dfac:	016535b3          	sltu	a1,a0,s6
   1dfb0:	01b585b3          	add	a1,a1,s11
   1dfb4:	ffe88813          	addi	a6,a7,-2
   1dfb8:	00b785b3          	add	a1,a5,a1
   1dfbc:	00050b13          	mv	s6,a0
   1dfc0:	00c59463          	bne	a1,a2,1dfc8 <__divdf3+0x5d8>
   1dfc4:	01668463          	beq	a3,s6,1dfcc <__divdf3+0x5dc>
   1dfc8:	00186813          	ori	a6,a6,1
   1dfcc:	3ffa8793          	addi	a5,s5,1023
   1dfd0:	0ef05e63          	blez	a5,1e0cc <__divdf3+0x6dc>
   1dfd4:	00787713          	andi	a4,a6,7
   1dfd8:	02070063          	beqz	a4,1dff8 <__divdf3+0x608>
   1dfdc:	00f87713          	andi	a4,a6,15
   1dfe0:	00400693          	li	a3,4
   1dfe4:	00d70a63          	beq	a4,a3,1dff8 <__divdf3+0x608>
   1dfe8:	00d80733          	add	a4,a6,a3
   1dfec:	010736b3          	sltu	a3,a4,a6
   1dff0:	00d40433          	add	s0,s0,a3
   1dff4:	00070813          	mv	a6,a4
   1dff8:	00741713          	slli	a4,s0,0x7
   1dffc:	00075a63          	bgez	a4,1e010 <__divdf3+0x620>
   1e000:	ff0007b7          	lui	a5,0xff000
   1e004:	fff78793          	addi	a5,a5,-1 # feffffff <__BSS_END__+0xfefdc5ab>
   1e008:	00f47433          	and	s0,s0,a5
   1e00c:	400a8793          	addi	a5,s5,1024
   1e010:	7fe00713          	li	a4,2046
   1e014:	18f74063          	blt	a4,a5,1e194 <__divdf3+0x7a4>
   1e018:	01d41713          	slli	a4,s0,0x1d
   1e01c:	00385813          	srli	a6,a6,0x3
   1e020:	01076833          	or	a6,a4,a6
   1e024:	00345413          	srli	s0,s0,0x3
   1e028:	00c41413          	slli	s0,s0,0xc
   1e02c:	00c45413          	srli	s0,s0,0xc
   1e030:	01479793          	slli	a5,a5,0x14
   1e034:	04c12083          	lw	ra,76(sp)
   1e038:	0087e7b3          	or	a5,a5,s0
   1e03c:	04812403          	lw	s0,72(sp)
   1e040:	01fa1a13          	slli	s4,s4,0x1f
   1e044:	0147e733          	or	a4,a5,s4
   1e048:	04412483          	lw	s1,68(sp)
   1e04c:	04012903          	lw	s2,64(sp)
   1e050:	03c12983          	lw	s3,60(sp)
   1e054:	03812a03          	lw	s4,56(sp)
   1e058:	03412a83          	lw	s5,52(sp)
   1e05c:	03012b03          	lw	s6,48(sp)
   1e060:	02c12b83          	lw	s7,44(sp)
   1e064:	02812c03          	lw	s8,40(sp)
   1e068:	02412c83          	lw	s9,36(sp)
   1e06c:	02012d03          	lw	s10,32(sp)
   1e070:	01c12d83          	lw	s11,28(sp)
   1e074:	00080513          	mv	a0,a6
   1e078:	00070593          	mv	a1,a4
   1e07c:	05010113          	addi	sp,sp,80
   1e080:	00008067          	ret
   1e084:	fffa8a93          	addi	s5,s5,-1
   1e088:	00000c93          	li	s9,0
   1e08c:	bb9ff06f          	j	1dc44 <__divdf3+0x254>
   1e090:	000c0a13          	mv	s4,s8
   1e094:	00068c93          	mv	s9,a3
   1e098:	00200793          	li	a5,2
   1e09c:	0efc8c63          	beq	s9,a5,1e194 <__divdf3+0x7a4>
   1e0a0:	00300793          	li	a5,3
   1e0a4:	0cfc8e63          	beq	s9,a5,1e180 <__divdf3+0x790>
   1e0a8:	00100793          	li	a5,1
   1e0ac:	f2fc90e3          	bne	s9,a5,1dfcc <__divdf3+0x5dc>
   1e0b0:	00000413          	li	s0,0
   1e0b4:	00000813          	li	a6,0
   1e0b8:	08c0006f          	j	1e144 <__divdf3+0x754>
   1e0bc:	000b0a13          	mv	s4,s6
   1e0c0:	000b8413          	mv	s0,s7
   1e0c4:	00048813          	mv	a6,s1
   1e0c8:	fd1ff06f          	j	1e098 <__divdf3+0x6a8>
   1e0cc:	00100693          	li	a3,1
   1e0d0:	00078c63          	beqz	a5,1e0e8 <__divdf3+0x6f8>
   1e0d4:	40f686b3          	sub	a3,a3,a5
   1e0d8:	03800713          	li	a4,56
   1e0dc:	fcd74ae3          	blt	a4,a3,1e0b0 <__divdf3+0x6c0>
   1e0e0:	01f00713          	li	a4,31
   1e0e4:	06d74463          	blt	a4,a3,1e14c <__divdf3+0x75c>
   1e0e8:	41ea8a93          	addi	s5,s5,1054
   1e0ec:	00d857b3          	srl	a5,a6,a3
   1e0f0:	01581833          	sll	a6,a6,s5
   1e0f4:	01003833          	snez	a6,a6
   1e0f8:	01541ab3          	sll	s5,s0,s5
   1e0fc:	01586833          	or	a6,a6,s5
   1e100:	0107e7b3          	or	a5,a5,a6
   1e104:	00d45433          	srl	s0,s0,a3
   1e108:	0077f713          	andi	a4,a5,7
   1e10c:	02070063          	beqz	a4,1e12c <__divdf3+0x73c>
   1e110:	00f7f713          	andi	a4,a5,15
   1e114:	00400693          	li	a3,4
   1e118:	00d70a63          	beq	a4,a3,1e12c <__divdf3+0x73c>
   1e11c:	00d78733          	add	a4,a5,a3
   1e120:	00f736b3          	sltu	a3,a4,a5
   1e124:	00d40433          	add	s0,s0,a3
   1e128:	00070793          	mv	a5,a4
   1e12c:	00841713          	slli	a4,s0,0x8
   1e130:	06074a63          	bltz	a4,1e1a4 <__divdf3+0x7b4>
   1e134:	01d41813          	slli	a6,s0,0x1d
   1e138:	0037d793          	srli	a5,a5,0x3
   1e13c:	00f86833          	or	a6,a6,a5
   1e140:	00345413          	srli	s0,s0,0x3
   1e144:	00000793          	li	a5,0
   1e148:	ee1ff06f          	j	1e028 <__divdf3+0x638>
   1e14c:	fe100713          	li	a4,-31
   1e150:	40f707b3          	sub	a5,a4,a5
   1e154:	02000613          	li	a2,32
   1e158:	00f457b3          	srl	a5,s0,a5
   1e15c:	00000713          	li	a4,0
   1e160:	00c68663          	beq	a3,a2,1e16c <__divdf3+0x77c>
   1e164:	43ea8a93          	addi	s5,s5,1086
   1e168:	01541733          	sll	a4,s0,s5
   1e16c:	01076733          	or	a4,a4,a6
   1e170:	00e03733          	snez	a4,a4
   1e174:	00e7e7b3          	or	a5,a5,a4
   1e178:	00000413          	li	s0,0
   1e17c:	f8dff06f          	j	1e108 <__divdf3+0x718>
   1e180:	00080437          	lui	s0,0x80
   1e184:	00000813          	li	a6,0
   1e188:	7ff00793          	li	a5,2047
   1e18c:	00000a13          	li	s4,0
   1e190:	e99ff06f          	j	1e028 <__divdf3+0x638>
   1e194:	00000413          	li	s0,0
   1e198:	00000813          	li	a6,0
   1e19c:	7ff00793          	li	a5,2047
   1e1a0:	e89ff06f          	j	1e028 <__divdf3+0x638>
   1e1a4:	00000413          	li	s0,0
   1e1a8:	00000813          	li	a6,0
   1e1ac:	00100793          	li	a5,1
   1e1b0:	e79ff06f          	j	1e028 <__divdf3+0x638>

0001e1b4 <__eqdf2>:
   1e1b4:	0145d713          	srli	a4,a1,0x14
   1e1b8:	001007b7          	lui	a5,0x100
   1e1bc:	fff78793          	addi	a5,a5,-1 # fffff <__BSS_END__+0xdc5ab>
   1e1c0:	0146d813          	srli	a6,a3,0x14
   1e1c4:	00050313          	mv	t1,a0
   1e1c8:	00050e93          	mv	t4,a0
   1e1cc:	7ff77713          	andi	a4,a4,2047
   1e1d0:	7ff00513          	li	a0,2047
   1e1d4:	00b7f8b3          	and	a7,a5,a1
   1e1d8:	00060f13          	mv	t5,a2
   1e1dc:	00d7f7b3          	and	a5,a5,a3
   1e1e0:	01f5d593          	srli	a1,a1,0x1f
   1e1e4:	7ff87813          	andi	a6,a6,2047
   1e1e8:	01f6d693          	srli	a3,a3,0x1f
   1e1ec:	00a71c63          	bne	a4,a0,1e204 <__eqdf2+0x50>
   1e1f0:	0068ee33          	or	t3,a7,t1
   1e1f4:	00100513          	li	a0,1
   1e1f8:	000e1463          	bnez	t3,1e200 <__eqdf2+0x4c>
   1e1fc:	00e80663          	beq	a6,a4,1e208 <__eqdf2+0x54>
   1e200:	00008067          	ret
   1e204:	00a81863          	bne	a6,a0,1e214 <__eqdf2+0x60>
   1e208:	00c7e633          	or	a2,a5,a2
   1e20c:	00100513          	li	a0,1
   1e210:	fe0618e3          	bnez	a2,1e200 <__eqdf2+0x4c>
   1e214:	00100513          	li	a0,1
   1e218:	ff0714e3          	bne	a4,a6,1e200 <__eqdf2+0x4c>
   1e21c:	fef892e3          	bne	a7,a5,1e200 <__eqdf2+0x4c>
   1e220:	ffee90e3          	bne	t4,t5,1e200 <__eqdf2+0x4c>
   1e224:	00d58a63          	beq	a1,a3,1e238 <__eqdf2+0x84>
   1e228:	fc071ce3          	bnez	a4,1e200 <__eqdf2+0x4c>
   1e22c:	0068e8b3          	or	a7,a7,t1
   1e230:	01103533          	snez	a0,a7
   1e234:	00008067          	ret
   1e238:	00000513          	li	a0,0
   1e23c:	00008067          	ret

0001e240 <__gedf2>:
   1e240:	0146d793          	srli	a5,a3,0x14
   1e244:	0145d893          	srli	a7,a1,0x14
   1e248:	00100737          	lui	a4,0x100
   1e24c:	fff70713          	addi	a4,a4,-1 # fffff <__BSS_END__+0xdc5ab>
   1e250:	00050813          	mv	a6,a0
   1e254:	00050e13          	mv	t3,a0
   1e258:	7ff8f893          	andi	a7,a7,2047
   1e25c:	7ff7f513          	andi	a0,a5,2047
   1e260:	7ff00793          	li	a5,2047
   1e264:	00b77333          	and	t1,a4,a1
   1e268:	00060e93          	mv	t4,a2
   1e26c:	00d77733          	and	a4,a4,a3
   1e270:	01f5d593          	srli	a1,a1,0x1f
   1e274:	01f6d693          	srli	a3,a3,0x1f
   1e278:	00f89663          	bne	a7,a5,1e284 <__gedf2+0x44>
   1e27c:	01036f33          	or	t5,t1,a6
   1e280:	060f1663          	bnez	t5,1e2ec <__gedf2+0xac>
   1e284:	00f51663          	bne	a0,a5,1e290 <__gedf2+0x50>
   1e288:	00c767b3          	or	a5,a4,a2
   1e28c:	06079063          	bnez	a5,1e2ec <__gedf2+0xac>
   1e290:	00000793          	li	a5,0
   1e294:	00089663          	bnez	a7,1e2a0 <__gedf2+0x60>
   1e298:	01036833          	or	a6,t1,a6
   1e29c:	00183793          	seqz	a5,a6
   1e2a0:	04051a63          	bnez	a0,1e2f4 <__gedf2+0xb4>
   1e2a4:	00c76633          	or	a2,a4,a2
   1e2a8:	00078a63          	beqz	a5,1e2bc <__gedf2+0x7c>
   1e2ac:	06060063          	beqz	a2,1e30c <__gedf2+0xcc>
   1e2b0:	00169513          	slli	a0,a3,0x1
   1e2b4:	fff50513          	addi	a0,a0,-1
   1e2b8:	00008067          	ret
   1e2bc:	02061e63          	bnez	a2,1e2f8 <__gedf2+0xb8>
   1e2c0:	40b005b3          	neg	a1,a1
   1e2c4:	0015e513          	ori	a0,a1,1
   1e2c8:	00008067          	ret
   1e2cc:	fea8c2e3          	blt	a7,a0,1e2b0 <__gedf2+0x70>
   1e2d0:	fe6768e3          	bltu	a4,t1,1e2c0 <__gedf2+0x80>
   1e2d4:	00e31863          	bne	t1,a4,1e2e4 <__gedf2+0xa4>
   1e2d8:	ffcee4e3          	bltu	t4,t3,1e2c0 <__gedf2+0x80>
   1e2dc:	00000513          	li	a0,0
   1e2e0:	03de7663          	bgeu	t3,t4,1e30c <__gedf2+0xcc>
   1e2e4:	00159513          	slli	a0,a1,0x1
   1e2e8:	fcdff06f          	j	1e2b4 <__gedf2+0x74>
   1e2ec:	ffe00513          	li	a0,-2
   1e2f0:	00008067          	ret
   1e2f4:	fa079ee3          	bnez	a5,1e2b0 <__gedf2+0x70>
   1e2f8:	fcb694e3          	bne	a3,a1,1e2c0 <__gedf2+0x80>
   1e2fc:	fd1558e3          	bge	a0,a7,1e2cc <__gedf2+0x8c>
   1e300:	40d006b3          	neg	a3,a3
   1e304:	0016e513          	ori	a0,a3,1
   1e308:	00008067          	ret
   1e30c:	00008067          	ret

0001e310 <__ledf2>:
   1e310:	0146d793          	srli	a5,a3,0x14
   1e314:	0145d893          	srli	a7,a1,0x14
   1e318:	00100737          	lui	a4,0x100
   1e31c:	fff70713          	addi	a4,a4,-1 # fffff <__BSS_END__+0xdc5ab>
   1e320:	00050813          	mv	a6,a0
   1e324:	00050e13          	mv	t3,a0
   1e328:	7ff8f893          	andi	a7,a7,2047
   1e32c:	7ff7f513          	andi	a0,a5,2047
   1e330:	7ff00793          	li	a5,2047
   1e334:	00b77333          	and	t1,a4,a1
   1e338:	00060e93          	mv	t4,a2
   1e33c:	00d77733          	and	a4,a4,a3
   1e340:	01f5d593          	srli	a1,a1,0x1f
   1e344:	01f6d693          	srli	a3,a3,0x1f
   1e348:	00f89663          	bne	a7,a5,1e354 <__ledf2+0x44>
   1e34c:	01036f33          	or	t5,t1,a6
   1e350:	060f1663          	bnez	t5,1e3bc <__ledf2+0xac>
   1e354:	00f51663          	bne	a0,a5,1e360 <__ledf2+0x50>
   1e358:	00c767b3          	or	a5,a4,a2
   1e35c:	06079063          	bnez	a5,1e3bc <__ledf2+0xac>
   1e360:	00000793          	li	a5,0
   1e364:	00089663          	bnez	a7,1e370 <__ledf2+0x60>
   1e368:	01036833          	or	a6,t1,a6
   1e36c:	00183793          	seqz	a5,a6
   1e370:	04051a63          	bnez	a0,1e3c4 <__ledf2+0xb4>
   1e374:	00c76633          	or	a2,a4,a2
   1e378:	00078a63          	beqz	a5,1e38c <__ledf2+0x7c>
   1e37c:	06060063          	beqz	a2,1e3dc <__ledf2+0xcc>
   1e380:	00169513          	slli	a0,a3,0x1
   1e384:	fff50513          	addi	a0,a0,-1
   1e388:	00008067          	ret
   1e38c:	02061e63          	bnez	a2,1e3c8 <__ledf2+0xb8>
   1e390:	40b005b3          	neg	a1,a1
   1e394:	0015e513          	ori	a0,a1,1
   1e398:	00008067          	ret
   1e39c:	fea8c2e3          	blt	a7,a0,1e380 <__ledf2+0x70>
   1e3a0:	fe6768e3          	bltu	a4,t1,1e390 <__ledf2+0x80>
   1e3a4:	00e31863          	bne	t1,a4,1e3b4 <__ledf2+0xa4>
   1e3a8:	ffcee4e3          	bltu	t4,t3,1e390 <__ledf2+0x80>
   1e3ac:	00000513          	li	a0,0
   1e3b0:	03de7663          	bgeu	t3,t4,1e3dc <__ledf2+0xcc>
   1e3b4:	00159513          	slli	a0,a1,0x1
   1e3b8:	fcdff06f          	j	1e384 <__ledf2+0x74>
   1e3bc:	00200513          	li	a0,2
   1e3c0:	00008067          	ret
   1e3c4:	fa079ee3          	bnez	a5,1e380 <__ledf2+0x70>
   1e3c8:	fcb694e3          	bne	a3,a1,1e390 <__ledf2+0x80>
   1e3cc:	fd1558e3          	bge	a0,a7,1e39c <__ledf2+0x8c>
   1e3d0:	40d006b3          	neg	a3,a3
   1e3d4:	0016e513          	ori	a0,a3,1
   1e3d8:	00008067          	ret
   1e3dc:	00008067          	ret

0001e3e0 <__muldf3>:
   1e3e0:	fd010113          	addi	sp,sp,-48
   1e3e4:	01612823          	sw	s6,16(sp)
   1e3e8:	0145db13          	srli	s6,a1,0x14
   1e3ec:	02812423          	sw	s0,40(sp)
   1e3f0:	02912223          	sw	s1,36(sp)
   1e3f4:	01412c23          	sw	s4,24(sp)
   1e3f8:	01512a23          	sw	s5,20(sp)
   1e3fc:	01812423          	sw	s8,8(sp)
   1e400:	00c59493          	slli	s1,a1,0xc
   1e404:	02112623          	sw	ra,44(sp)
   1e408:	03212023          	sw	s2,32(sp)
   1e40c:	01312e23          	sw	s3,28(sp)
   1e410:	01712623          	sw	s7,12(sp)
   1e414:	01912223          	sw	s9,4(sp)
   1e418:	7ffb7b13          	andi	s6,s6,2047
   1e41c:	00050413          	mv	s0,a0
   1e420:	00060c13          	mv	s8,a2
   1e424:	00068a13          	mv	s4,a3
   1e428:	00c4d493          	srli	s1,s1,0xc
   1e42c:	01f5da93          	srli	s5,a1,0x1f
   1e430:	0c0b0263          	beqz	s6,1e4f4 <__muldf3+0x114>
   1e434:	7ff00793          	li	a5,2047
   1e438:	12fb0463          	beq	s6,a5,1e560 <__muldf3+0x180>
   1e43c:	00349493          	slli	s1,s1,0x3
   1e440:	01d55793          	srli	a5,a0,0x1d
   1e444:	0097e7b3          	or	a5,a5,s1
   1e448:	008004b7          	lui	s1,0x800
   1e44c:	0097e4b3          	or	s1,a5,s1
   1e450:	00351b93          	slli	s7,a0,0x3
   1e454:	c01b0b13          	addi	s6,s6,-1023
   1e458:	00000c93          	li	s9,0
   1e45c:	014a5693          	srli	a3,s4,0x14
   1e460:	00ca1413          	slli	s0,s4,0xc
   1e464:	7ff6f693          	andi	a3,a3,2047
   1e468:	00c45413          	srli	s0,s0,0xc
   1e46c:	01fa5a13          	srli	s4,s4,0x1f
   1e470:	12068063          	beqz	a3,1e590 <__muldf3+0x1b0>
   1e474:	7ff00793          	li	a5,2047
   1e478:	18f68463          	beq	a3,a5,1e600 <__muldf3+0x220>
   1e47c:	00341413          	slli	s0,s0,0x3
   1e480:	01dc5793          	srli	a5,s8,0x1d
   1e484:	0087e7b3          	or	a5,a5,s0
   1e488:	00800437          	lui	s0,0x800
   1e48c:	0087e433          	or	s0,a5,s0
   1e490:	c0168693          	addi	a3,a3,-1023
   1e494:	003c1793          	slli	a5,s8,0x3
   1e498:	00000613          	li	a2,0
   1e49c:	002c9713          	slli	a4,s9,0x2
   1e4a0:	00db0b33          	add	s6,s6,a3
   1e4a4:	00c76733          	or	a4,a4,a2
   1e4a8:	00a00693          	li	a3,10
   1e4ac:	001b0893          	addi	a7,s6,1
   1e4b0:	1ae6c263          	blt	a3,a4,1e654 <__muldf3+0x274>
   1e4b4:	00200593          	li	a1,2
   1e4b8:	014ac833          	xor	a6,s5,s4
   1e4bc:	00100693          	li	a3,1
   1e4c0:	16e5c863          	blt	a1,a4,1e630 <__muldf3+0x250>
   1e4c4:	fff70713          	addi	a4,a4,-1
   1e4c8:	1ae6e663          	bltu	a3,a4,1e674 <__muldf3+0x294>
   1e4cc:	00060c93          	mv	s9,a2
   1e4d0:	00200713          	li	a4,2
   1e4d4:	5aec8063          	beq	s9,a4,1ea74 <__muldf3+0x694>
   1e4d8:	00300713          	li	a4,3
   1e4dc:	58ec8663          	beq	s9,a4,1ea68 <__muldf3+0x688>
   1e4e0:	00100713          	li	a4,1
   1e4e4:	40ec9463          	bne	s9,a4,1e8ec <__muldf3+0x50c>
   1e4e8:	00000413          	li	s0,0
   1e4ec:	00000693          	li	a3,0
   1e4f0:	52c0006f          	j	1ea1c <__muldf3+0x63c>
   1e4f4:	00a4ebb3          	or	s7,s1,a0
   1e4f8:	060b8e63          	beqz	s7,1e574 <__muldf3+0x194>
   1e4fc:	04048063          	beqz	s1,1e53c <__muldf3+0x15c>
   1e500:	00048513          	mv	a0,s1
   1e504:	69d030ef          	jal	223a0 <__clzsi2>
   1e508:	ff550713          	addi	a4,a0,-11
   1e50c:	01d00793          	li	a5,29
   1e510:	ff850693          	addi	a3,a0,-8
   1e514:	40e787b3          	sub	a5,a5,a4
   1e518:	00d494b3          	sll	s1,s1,a3
   1e51c:	00f457b3          	srl	a5,s0,a5
   1e520:	0097e7b3          	or	a5,a5,s1
   1e524:	00d414b3          	sll	s1,s0,a3
   1e528:	c0d00b13          	li	s6,-1011
   1e52c:	00048b93          	mv	s7,s1
   1e530:	40ab0b33          	sub	s6,s6,a0
   1e534:	00078493          	mv	s1,a5
   1e538:	f21ff06f          	j	1e458 <__muldf3+0x78>
   1e53c:	665030ef          	jal	223a0 <__clzsi2>
   1e540:	00050793          	mv	a5,a0
   1e544:	01578713          	addi	a4,a5,21
   1e548:	01c00693          	li	a3,28
   1e54c:	02050513          	addi	a0,a0,32
   1e550:	fae6dee3          	bge	a3,a4,1e50c <__muldf3+0x12c>
   1e554:	ff878793          	addi	a5,a5,-8
   1e558:	00f417b3          	sll	a5,s0,a5
   1e55c:	fcdff06f          	j	1e528 <__muldf3+0x148>
   1e560:	00a4ebb3          	or	s7,s1,a0
   1e564:	020b9063          	bnez	s7,1e584 <__muldf3+0x1a4>
   1e568:	00000493          	li	s1,0
   1e56c:	00200c93          	li	s9,2
   1e570:	eedff06f          	j	1e45c <__muldf3+0x7c>
   1e574:	00000493          	li	s1,0
   1e578:	00000b13          	li	s6,0
   1e57c:	00100c93          	li	s9,1
   1e580:	eddff06f          	j	1e45c <__muldf3+0x7c>
   1e584:	00050b93          	mv	s7,a0
   1e588:	00300c93          	li	s9,3
   1e58c:	ed1ff06f          	j	1e45c <__muldf3+0x7c>
   1e590:	018467b3          	or	a5,s0,s8
   1e594:	08078063          	beqz	a5,1e614 <__muldf3+0x234>
   1e598:	04040063          	beqz	s0,1e5d8 <__muldf3+0x1f8>
   1e59c:	00040513          	mv	a0,s0
   1e5a0:	601030ef          	jal	223a0 <__clzsi2>
   1e5a4:	ff550693          	addi	a3,a0,-11
   1e5a8:	01d00713          	li	a4,29
   1e5ac:	ff850793          	addi	a5,a0,-8
   1e5b0:	40d70733          	sub	a4,a4,a3
   1e5b4:	00f41433          	sll	s0,s0,a5
   1e5b8:	00ec5733          	srl	a4,s8,a4
   1e5bc:	00876733          	or	a4,a4,s0
   1e5c0:	00fc1433          	sll	s0,s8,a5
   1e5c4:	c0d00693          	li	a3,-1011
   1e5c8:	00040793          	mv	a5,s0
   1e5cc:	40a686b3          	sub	a3,a3,a0
   1e5d0:	00070413          	mv	s0,a4
   1e5d4:	ec5ff06f          	j	1e498 <__muldf3+0xb8>
   1e5d8:	000c0513          	mv	a0,s8
   1e5dc:	5c5030ef          	jal	223a0 <__clzsi2>
   1e5e0:	00050793          	mv	a5,a0
   1e5e4:	01578693          	addi	a3,a5,21
   1e5e8:	01c00713          	li	a4,28
   1e5ec:	02050513          	addi	a0,a0,32
   1e5f0:	fad75ce3          	bge	a4,a3,1e5a8 <__muldf3+0x1c8>
   1e5f4:	ff878793          	addi	a5,a5,-8
   1e5f8:	00fc1733          	sll	a4,s8,a5
   1e5fc:	fc9ff06f          	j	1e5c4 <__muldf3+0x1e4>
   1e600:	018467b3          	or	a5,s0,s8
   1e604:	02079063          	bnez	a5,1e624 <__muldf3+0x244>
   1e608:	00000413          	li	s0,0
   1e60c:	00200613          	li	a2,2
   1e610:	e8dff06f          	j	1e49c <__muldf3+0xbc>
   1e614:	00000413          	li	s0,0
   1e618:	00000693          	li	a3,0
   1e61c:	00100613          	li	a2,1
   1e620:	e7dff06f          	j	1e49c <__muldf3+0xbc>
   1e624:	000c0793          	mv	a5,s8
   1e628:	00300613          	li	a2,3
   1e62c:	e71ff06f          	j	1e49c <__muldf3+0xbc>
   1e630:	00e69733          	sll	a4,a3,a4
   1e634:	53077693          	andi	a3,a4,1328
   1e638:	02069863          	bnez	a3,1e668 <__muldf3+0x288>
   1e63c:	24077593          	andi	a1,a4,576
   1e640:	40059c63          	bnez	a1,1ea58 <__muldf3+0x678>
   1e644:	08877713          	andi	a4,a4,136
   1e648:	02070663          	beqz	a4,1e674 <__muldf3+0x294>
   1e64c:	000a0813          	mv	a6,s4
   1e650:	e7dff06f          	j	1e4cc <__muldf3+0xec>
   1e654:	00f00693          	li	a3,15
   1e658:	40d70863          	beq	a4,a3,1ea68 <__muldf3+0x688>
   1e65c:	00b00693          	li	a3,11
   1e660:	000a8813          	mv	a6,s5
   1e664:	fed704e3          	beq	a4,a3,1e64c <__muldf3+0x26c>
   1e668:	00048413          	mv	s0,s1
   1e66c:	000b8793          	mv	a5,s7
   1e670:	e61ff06f          	j	1e4d0 <__muldf3+0xf0>
   1e674:	010bd713          	srli	a4,s7,0x10
   1e678:	01079393          	slli	t2,a5,0x10
   1e67c:	010b9b93          	slli	s7,s7,0x10
   1e680:	010bdb93          	srli	s7,s7,0x10
   1e684:	0103d393          	srli	t2,t2,0x10
   1e688:	0107de13          	srli	t3,a5,0x10
   1e68c:	000b8513          	mv	a0,s7
   1e690:	00038593          	mv	a1,t2
   1e694:	435030ef          	jal	222c8 <__mulsi3>
   1e698:	00050793          	mv	a5,a0
   1e69c:	000e0593          	mv	a1,t3
   1e6a0:	000b8513          	mv	a0,s7
   1e6a4:	425030ef          	jal	222c8 <__mulsi3>
   1e6a8:	00050e93          	mv	t4,a0
   1e6ac:	00038593          	mv	a1,t2
   1e6b0:	00070513          	mv	a0,a4
   1e6b4:	415030ef          	jal	222c8 <__mulsi3>
   1e6b8:	00050f13          	mv	t5,a0
   1e6bc:	000e0593          	mv	a1,t3
   1e6c0:	00070513          	mv	a0,a4
   1e6c4:	405030ef          	jal	222c8 <__mulsi3>
   1e6c8:	0107d313          	srli	t1,a5,0x10
   1e6cc:	01ee8eb3          	add	t4,t4,t5
   1e6d0:	01d30333          	add	t1,t1,t4
   1e6d4:	00050293          	mv	t0,a0
   1e6d8:	01e37663          	bgeu	t1,t5,1e6e4 <__muldf3+0x304>
   1e6dc:	000106b7          	lui	a3,0x10
   1e6e0:	00d502b3          	add	t0,a0,a3
   1e6e4:	01045f13          	srli	t5,s0,0x10
   1e6e8:	01079793          	slli	a5,a5,0x10
   1e6ec:	01041413          	slli	s0,s0,0x10
   1e6f0:	01035a13          	srli	s4,t1,0x10
   1e6f4:	0107d793          	srli	a5,a5,0x10
   1e6f8:	01045413          	srli	s0,s0,0x10
   1e6fc:	01031313          	slli	t1,t1,0x10
   1e700:	00f30333          	add	t1,t1,a5
   1e704:	000b8513          	mv	a0,s7
   1e708:	00040593          	mv	a1,s0
   1e70c:	3bd030ef          	jal	222c8 <__mulsi3>
   1e710:	00050f93          	mv	t6,a0
   1e714:	000f0593          	mv	a1,t5
   1e718:	000b8513          	mv	a0,s7
   1e71c:	3ad030ef          	jal	222c8 <__mulsi3>
   1e720:	00050e93          	mv	t4,a0
   1e724:	00040593          	mv	a1,s0
   1e728:	00070513          	mv	a0,a4
   1e72c:	39d030ef          	jal	222c8 <__mulsi3>
   1e730:	00050a93          	mv	s5,a0
   1e734:	000f0593          	mv	a1,t5
   1e738:	00070513          	mv	a0,a4
   1e73c:	38d030ef          	jal	222c8 <__mulsi3>
   1e740:	010fd713          	srli	a4,t6,0x10
   1e744:	015e8eb3          	add	t4,t4,s5
   1e748:	01d70733          	add	a4,a4,t4
   1e74c:	00050793          	mv	a5,a0
   1e750:	01577663          	bgeu	a4,s5,1e75c <__muldf3+0x37c>
   1e754:	000106b7          	lui	a3,0x10
   1e758:	00d507b3          	add	a5,a0,a3
   1e75c:	01075e93          	srli	t4,a4,0x10
   1e760:	010f9f93          	slli	t6,t6,0x10
   1e764:	00fe8eb3          	add	t4,t4,a5
   1e768:	010fdf93          	srli	t6,t6,0x10
   1e76c:	01071793          	slli	a5,a4,0x10
   1e770:	01f787b3          	add	a5,a5,t6
   1e774:	00fa0733          	add	a4,s4,a5
   1e778:	0104da13          	srli	s4,s1,0x10
   1e77c:	01049493          	slli	s1,s1,0x10
   1e780:	0104d493          	srli	s1,s1,0x10
   1e784:	00048513          	mv	a0,s1
   1e788:	00038593          	mv	a1,t2
   1e78c:	33d030ef          	jal	222c8 <__mulsi3>
   1e790:	00050f93          	mv	t6,a0
   1e794:	000e0593          	mv	a1,t3
   1e798:	00048513          	mv	a0,s1
   1e79c:	32d030ef          	jal	222c8 <__mulsi3>
   1e7a0:	00050a93          	mv	s5,a0
   1e7a4:	00038593          	mv	a1,t2
   1e7a8:	000a0513          	mv	a0,s4
   1e7ac:	31d030ef          	jal	222c8 <__mulsi3>
   1e7b0:	00050393          	mv	t2,a0
   1e7b4:	000e0593          	mv	a1,t3
   1e7b8:	000a0513          	mv	a0,s4
   1e7bc:	30d030ef          	jal	222c8 <__mulsi3>
   1e7c0:	010fd593          	srli	a1,t6,0x10
   1e7c4:	007a8ab3          	add	s5,s5,t2
   1e7c8:	015585b3          	add	a1,a1,s5
   1e7cc:	00050693          	mv	a3,a0
   1e7d0:	0075f663          	bgeu	a1,t2,1e7dc <__muldf3+0x3fc>
   1e7d4:	00010637          	lui	a2,0x10
   1e7d8:	00c506b3          	add	a3,a0,a2
   1e7dc:	010f9f93          	slli	t6,t6,0x10
   1e7e0:	0105de13          	srli	t3,a1,0x10
   1e7e4:	010fdf93          	srli	t6,t6,0x10
   1e7e8:	01059593          	slli	a1,a1,0x10
   1e7ec:	01f58fb3          	add	t6,a1,t6
   1e7f0:	00de0e33          	add	t3,t3,a3
   1e7f4:	00048513          	mv	a0,s1
   1e7f8:	00040593          	mv	a1,s0
   1e7fc:	2cd030ef          	jal	222c8 <__mulsi3>
   1e800:	00050393          	mv	t2,a0
   1e804:	000f0593          	mv	a1,t5
   1e808:	00048513          	mv	a0,s1
   1e80c:	2bd030ef          	jal	222c8 <__mulsi3>
   1e810:	00050493          	mv	s1,a0
   1e814:	00040593          	mv	a1,s0
   1e818:	000a0513          	mv	a0,s4
   1e81c:	2ad030ef          	jal	222c8 <__mulsi3>
   1e820:	00050413          	mv	s0,a0
   1e824:	000f0593          	mv	a1,t5
   1e828:	000a0513          	mv	a0,s4
   1e82c:	29d030ef          	jal	222c8 <__mulsi3>
   1e830:	0103d593          	srli	a1,t2,0x10
   1e834:	008484b3          	add	s1,s1,s0
   1e838:	009585b3          	add	a1,a1,s1
   1e83c:	00050f13          	mv	t5,a0
   1e840:	0085f663          	bgeu	a1,s0,1e84c <__muldf3+0x46c>
   1e844:	000106b7          	lui	a3,0x10
   1e848:	00d50f33          	add	t5,a0,a3
   1e84c:	01039393          	slli	t2,t2,0x10
   1e850:	00e286b3          	add	a3,t0,a4
   1e854:	0103d393          	srli	t2,t2,0x10
   1e858:	01059713          	slli	a4,a1,0x10
   1e85c:	00770733          	add	a4,a4,t2
   1e860:	01d70eb3          	add	t4,a4,t4
   1e864:	00f6b7b3          	sltu	a5,a3,a5
   1e868:	00fe87b3          	add	a5,t4,a5
   1e86c:	00eeb633          	sltu	a2,t4,a4
   1e870:	01d7beb3          	sltu	t4,a5,t4
   1e874:	0105d593          	srli	a1,a1,0x10
   1e878:	01d66633          	or	a2,a2,t4
   1e87c:	00b60633          	add	a2,a2,a1
   1e880:	01f685b3          	add	a1,a3,t6
   1e884:	01c78e33          	add	t3,a5,t3
   1e888:	00d5b6b3          	sltu	a3,a1,a3
   1e88c:	00de06b3          	add	a3,t3,a3
   1e890:	00fe3733          	sltu	a4,t3,a5
   1e894:	01c6be33          	sltu	t3,a3,t3
   1e898:	00959793          	slli	a5,a1,0x9
   1e89c:	01c76733          	or	a4,a4,t3
   1e8a0:	00c70733          	add	a4,a4,a2
   1e8a4:	0067e7b3          	or	a5,a5,t1
   1e8a8:	01e70733          	add	a4,a4,t5
   1e8ac:	00f037b3          	snez	a5,a5
   1e8b0:	0175d593          	srli	a1,a1,0x17
   1e8b4:	00971713          	slli	a4,a4,0x9
   1e8b8:	0176d413          	srli	s0,a3,0x17
   1e8bc:	00b7e7b3          	or	a5,a5,a1
   1e8c0:	00969693          	slli	a3,a3,0x9
   1e8c4:	00d7e7b3          	or	a5,a5,a3
   1e8c8:	00771693          	slli	a3,a4,0x7
   1e8cc:	00876433          	or	s0,a4,s0
   1e8d0:	0c06d663          	bgez	a3,1e99c <__muldf3+0x5bc>
   1e8d4:	0017d713          	srli	a4,a5,0x1
   1e8d8:	0017f793          	andi	a5,a5,1
   1e8dc:	00f76733          	or	a4,a4,a5
   1e8e0:	01f41793          	slli	a5,s0,0x1f
   1e8e4:	00f767b3          	or	a5,a4,a5
   1e8e8:	00145413          	srli	s0,s0,0x1
   1e8ec:	3ff88713          	addi	a4,a7,1023
   1e8f0:	0ae05a63          	blez	a4,1e9a4 <__muldf3+0x5c4>
   1e8f4:	0077f693          	andi	a3,a5,7
   1e8f8:	02068063          	beqz	a3,1e918 <__muldf3+0x538>
   1e8fc:	00f7f693          	andi	a3,a5,15
   1e900:	00400613          	li	a2,4
   1e904:	00c68a63          	beq	a3,a2,1e918 <__muldf3+0x538>
   1e908:	00c786b3          	add	a3,a5,a2
   1e90c:	00f6b633          	sltu	a2,a3,a5
   1e910:	00c40433          	add	s0,s0,a2
   1e914:	00068793          	mv	a5,a3
   1e918:	00741693          	slli	a3,s0,0x7
   1e91c:	0006da63          	bgez	a3,1e930 <__muldf3+0x550>
   1e920:	ff000737          	lui	a4,0xff000
   1e924:	fff70713          	addi	a4,a4,-1 # feffffff <__BSS_END__+0xfefdc5ab>
   1e928:	00e47433          	and	s0,s0,a4
   1e92c:	40088713          	addi	a4,a7,1024
   1e930:	7fe00693          	li	a3,2046
   1e934:	14e6c063          	blt	a3,a4,1ea74 <__muldf3+0x694>
   1e938:	01d41693          	slli	a3,s0,0x1d
   1e93c:	0037d793          	srli	a5,a5,0x3
   1e940:	00f6e6b3          	or	a3,a3,a5
   1e944:	00345413          	srli	s0,s0,0x3
   1e948:	00c41413          	slli	s0,s0,0xc
   1e94c:	00c45413          	srli	s0,s0,0xc
   1e950:	01471713          	slli	a4,a4,0x14
   1e954:	02c12083          	lw	ra,44(sp)
   1e958:	00876733          	or	a4,a4,s0
   1e95c:	02812403          	lw	s0,40(sp)
   1e960:	01f81813          	slli	a6,a6,0x1f
   1e964:	010767b3          	or	a5,a4,a6
   1e968:	02412483          	lw	s1,36(sp)
   1e96c:	02012903          	lw	s2,32(sp)
   1e970:	01c12983          	lw	s3,28(sp)
   1e974:	01812a03          	lw	s4,24(sp)
   1e978:	01412a83          	lw	s5,20(sp)
   1e97c:	01012b03          	lw	s6,16(sp)
   1e980:	00c12b83          	lw	s7,12(sp)
   1e984:	00812c03          	lw	s8,8(sp)
   1e988:	00412c83          	lw	s9,4(sp)
   1e98c:	00068513          	mv	a0,a3
   1e990:	00078593          	mv	a1,a5
   1e994:	03010113          	addi	sp,sp,48
   1e998:	00008067          	ret
   1e99c:	000b0893          	mv	a7,s6
   1e9a0:	f4dff06f          	j	1e8ec <__muldf3+0x50c>
   1e9a4:	00100613          	li	a2,1
   1e9a8:	00070c63          	beqz	a4,1e9c0 <__muldf3+0x5e0>
   1e9ac:	40e60633          	sub	a2,a2,a4
   1e9b0:	03800693          	li	a3,56
   1e9b4:	b2c6cae3          	blt	a3,a2,1e4e8 <__muldf3+0x108>
   1e9b8:	01f00693          	li	a3,31
   1e9bc:	06c6c463          	blt	a3,a2,1ea24 <__muldf3+0x644>
   1e9c0:	41e88893          	addi	a7,a7,1054
   1e9c4:	00c7d733          	srl	a4,a5,a2
   1e9c8:	011797b3          	sll	a5,a5,a7
   1e9cc:	00f037b3          	snez	a5,a5
   1e9d0:	011418b3          	sll	a7,s0,a7
   1e9d4:	0117e7b3          	or	a5,a5,a7
   1e9d8:	00f767b3          	or	a5,a4,a5
   1e9dc:	00c45433          	srl	s0,s0,a2
   1e9e0:	0077f713          	andi	a4,a5,7
   1e9e4:	02070063          	beqz	a4,1ea04 <__muldf3+0x624>
   1e9e8:	00f7f713          	andi	a4,a5,15
   1e9ec:	00400693          	li	a3,4
   1e9f0:	00d70a63          	beq	a4,a3,1ea04 <__muldf3+0x624>
   1e9f4:	00d78733          	add	a4,a5,a3
   1e9f8:	00f736b3          	sltu	a3,a4,a5
   1e9fc:	00d40433          	add	s0,s0,a3
   1ea00:	00070793          	mv	a5,a4
   1ea04:	00841713          	slli	a4,s0,0x8
   1ea08:	06074e63          	bltz	a4,1ea84 <__muldf3+0x6a4>
   1ea0c:	01d41693          	slli	a3,s0,0x1d
   1ea10:	0037d793          	srli	a5,a5,0x3
   1ea14:	00f6e6b3          	or	a3,a3,a5
   1ea18:	00345413          	srli	s0,s0,0x3
   1ea1c:	00000713          	li	a4,0
   1ea20:	f29ff06f          	j	1e948 <__muldf3+0x568>
   1ea24:	fe100693          	li	a3,-31
   1ea28:	40e68733          	sub	a4,a3,a4
   1ea2c:	02000593          	li	a1,32
   1ea30:	00e45733          	srl	a4,s0,a4
   1ea34:	00000693          	li	a3,0
   1ea38:	00b60663          	beq	a2,a1,1ea44 <__muldf3+0x664>
   1ea3c:	43e88893          	addi	a7,a7,1086
   1ea40:	011416b3          	sll	a3,s0,a7
   1ea44:	00f6e6b3          	or	a3,a3,a5
   1ea48:	00d036b3          	snez	a3,a3
   1ea4c:	00d767b3          	or	a5,a4,a3
   1ea50:	00000413          	li	s0,0
   1ea54:	f8dff06f          	j	1e9e0 <__muldf3+0x600>
   1ea58:	00080437          	lui	s0,0x80
   1ea5c:	7ff00713          	li	a4,2047
   1ea60:	00000813          	li	a6,0
   1ea64:	ee5ff06f          	j	1e948 <__muldf3+0x568>
   1ea68:	00080437          	lui	s0,0x80
   1ea6c:	00000693          	li	a3,0
   1ea70:	fedff06f          	j	1ea5c <__muldf3+0x67c>
   1ea74:	00000413          	li	s0,0
   1ea78:	00000693          	li	a3,0
   1ea7c:	7ff00713          	li	a4,2047
   1ea80:	ec9ff06f          	j	1e948 <__muldf3+0x568>
   1ea84:	00000413          	li	s0,0
   1ea88:	00000693          	li	a3,0
   1ea8c:	00100713          	li	a4,1
   1ea90:	eb9ff06f          	j	1e948 <__muldf3+0x568>

0001ea94 <__subdf3>:
   1ea94:	00100837          	lui	a6,0x100
   1ea98:	fff80813          	addi	a6,a6,-1 # fffff <__BSS_END__+0xdc5ab>
   1ea9c:	fe010113          	addi	sp,sp,-32
   1eaa0:	00b878b3          	and	a7,a6,a1
   1eaa4:	0145d713          	srli	a4,a1,0x14
   1eaa8:	01d55793          	srli	a5,a0,0x1d
   1eaac:	00d87833          	and	a6,a6,a3
   1eab0:	01412423          	sw	s4,8(sp)
   1eab4:	7ff77a13          	andi	s4,a4,2047
   1eab8:	00389713          	slli	a4,a7,0x3
   1eabc:	0146d893          	srli	a7,a3,0x14
   1eac0:	01312623          	sw	s3,12(sp)
   1eac4:	00e7e7b3          	or	a5,a5,a4
   1eac8:	01f5d993          	srli	s3,a1,0x1f
   1eacc:	00381813          	slli	a6,a6,0x3
   1ead0:	01d65593          	srli	a1,a2,0x1d
   1ead4:	00112e23          	sw	ra,28(sp)
   1ead8:	00812c23          	sw	s0,24(sp)
   1eadc:	00912a23          	sw	s1,20(sp)
   1eae0:	01212823          	sw	s2,16(sp)
   1eae4:	01512223          	sw	s5,4(sp)
   1eae8:	7ff8f893          	andi	a7,a7,2047
   1eaec:	7ff00713          	li	a4,2047
   1eaf0:	00351513          	slli	a0,a0,0x3
   1eaf4:	01f6d693          	srli	a3,a3,0x1f
   1eaf8:	0105e5b3          	or	a1,a1,a6
   1eafc:	00361613          	slli	a2,a2,0x3
   1eb00:	00e89663          	bne	a7,a4,1eb0c <__subdf3+0x78>
   1eb04:	00c5e733          	or	a4,a1,a2
   1eb08:	00071463          	bnez	a4,1eb10 <__subdf3+0x7c>
   1eb0c:	0016c693          	xori	a3,a3,1
   1eb10:	411a0833          	sub	a6,s4,a7
   1eb14:	7ff00313          	li	t1,2047
   1eb18:	33369663          	bne	a3,s3,1ee44 <__subdf3+0x3b0>
   1eb1c:	17005e63          	blez	a6,1ec98 <__subdf3+0x204>
   1eb20:	0a089863          	bnez	a7,1ebd0 <__subdf3+0x13c>
   1eb24:	00c5e733          	or	a4,a1,a2
   1eb28:	02070663          	beqz	a4,1eb54 <__subdf3+0xc0>
   1eb2c:	fffa0813          	addi	a6,s4,-1
   1eb30:	02081063          	bnez	a6,1eb50 <__subdf3+0xbc>
   1eb34:	00c50633          	add	a2,a0,a2
   1eb38:	00a63733          	sltu	a4,a2,a0
   1eb3c:	00b786b3          	add	a3,a5,a1
   1eb40:	00060513          	mv	a0,a2
   1eb44:	00e687b3          	add	a5,a3,a4
   1eb48:	00100a13          	li	s4,1
   1eb4c:	0d40006f          	j	1ec20 <__subdf3+0x18c>
   1eb50:	086a1663          	bne	s4,t1,1ebdc <__subdf3+0x148>
   1eb54:	01d79693          	slli	a3,a5,0x1d
   1eb58:	00355513          	srli	a0,a0,0x3
   1eb5c:	7ff00713          	li	a4,2047
   1eb60:	00a6e6b3          	or	a3,a3,a0
   1eb64:	0037d793          	srli	a5,a5,0x3
   1eb68:	00ea1e63          	bne	s4,a4,1eb84 <__subdf3+0xf0>
   1eb6c:	00f6e6b3          	or	a3,a3,a5
   1eb70:	00000793          	li	a5,0
   1eb74:	00068863          	beqz	a3,1eb84 <__subdf3+0xf0>
   1eb78:	000807b7          	lui	a5,0x80
   1eb7c:	00000693          	li	a3,0
   1eb80:	00000993          	li	s3,0
   1eb84:	014a1713          	slli	a4,s4,0x14
   1eb88:	7ff00637          	lui	a2,0x7ff00
   1eb8c:	00c79793          	slli	a5,a5,0xc
   1eb90:	00c77733          	and	a4,a4,a2
   1eb94:	01c12083          	lw	ra,28(sp)
   1eb98:	01812403          	lw	s0,24(sp)
   1eb9c:	00c7d793          	srli	a5,a5,0xc
   1eba0:	00f767b3          	or	a5,a4,a5
   1eba4:	01f99713          	slli	a4,s3,0x1f
   1eba8:	00e7e633          	or	a2,a5,a4
   1ebac:	01412483          	lw	s1,20(sp)
   1ebb0:	01012903          	lw	s2,16(sp)
   1ebb4:	00c12983          	lw	s3,12(sp)
   1ebb8:	00812a03          	lw	s4,8(sp)
   1ebbc:	00412a83          	lw	s5,4(sp)
   1ebc0:	00068513          	mv	a0,a3
   1ebc4:	00060593          	mv	a1,a2
   1ebc8:	02010113          	addi	sp,sp,32
   1ebcc:	00008067          	ret
   1ebd0:	f86a02e3          	beq	s4,t1,1eb54 <__subdf3+0xc0>
   1ebd4:	00800737          	lui	a4,0x800
   1ebd8:	00e5e5b3          	or	a1,a1,a4
   1ebdc:	03800713          	li	a4,56
   1ebe0:	0b074663          	blt	a4,a6,1ec8c <__subdf3+0x1f8>
   1ebe4:	01f00713          	li	a4,31
   1ebe8:	02000893          	li	a7,32
   1ebec:	07074863          	blt	a4,a6,1ec5c <__subdf3+0x1c8>
   1ebf0:	410888b3          	sub	a7,a7,a6
   1ebf4:	01159733          	sll	a4,a1,a7
   1ebf8:	010656b3          	srl	a3,a2,a6
   1ebfc:	011618b3          	sll	a7,a2,a7
   1ec00:	00d76733          	or	a4,a4,a3
   1ec04:	011038b3          	snez	a7,a7
   1ec08:	01176733          	or	a4,a4,a7
   1ec0c:	0105d833          	srl	a6,a1,a6
   1ec10:	00a70533          	add	a0,a4,a0
   1ec14:	00f80833          	add	a6,a6,a5
   1ec18:	00e53733          	sltu	a4,a0,a4
   1ec1c:	00e807b3          	add	a5,a6,a4
   1ec20:	00879713          	slli	a4,a5,0x8
   1ec24:	1c075c63          	bgez	a4,1edfc <__subdf3+0x368>
   1ec28:	001a0a13          	addi	s4,s4,1
   1ec2c:	7ff00713          	li	a4,2047
   1ec30:	5cea0263          	beq	s4,a4,1f1f4 <__subdf3+0x760>
   1ec34:	ff800737          	lui	a4,0xff800
   1ec38:	fff70713          	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1ec3c:	00e7f7b3          	and	a5,a5,a4
   1ec40:	00155713          	srli	a4,a0,0x1
   1ec44:	00157513          	andi	a0,a0,1
   1ec48:	00a76733          	or	a4,a4,a0
   1ec4c:	01f79513          	slli	a0,a5,0x1f
   1ec50:	00e56533          	or	a0,a0,a4
   1ec54:	0017d793          	srli	a5,a5,0x1
   1ec58:	1a40006f          	j	1edfc <__subdf3+0x368>
   1ec5c:	fe080713          	addi	a4,a6,-32
   1ec60:	00e5d733          	srl	a4,a1,a4
   1ec64:	00000693          	li	a3,0
   1ec68:	01180863          	beq	a6,a7,1ec78 <__subdf3+0x1e4>
   1ec6c:	04000693          	li	a3,64
   1ec70:	410686b3          	sub	a3,a3,a6
   1ec74:	00d596b3          	sll	a3,a1,a3
   1ec78:	00c6e6b3          	or	a3,a3,a2
   1ec7c:	00d036b3          	snez	a3,a3
   1ec80:	00d76733          	or	a4,a4,a3
   1ec84:	00000813          	li	a6,0
   1ec88:	f89ff06f          	j	1ec10 <__subdf3+0x17c>
   1ec8c:	00c5e733          	or	a4,a1,a2
   1ec90:	00e03733          	snez	a4,a4
   1ec94:	ff1ff06f          	j	1ec84 <__subdf3+0x1f0>
   1ec98:	0c080663          	beqz	a6,1ed64 <__subdf3+0x2d0>
   1ec9c:	41488733          	sub	a4,a7,s4
   1eca0:	020a1463          	bnez	s4,1ecc8 <__subdf3+0x234>
   1eca4:	00a7e6b3          	or	a3,a5,a0
   1eca8:	00068863          	beqz	a3,1ecb8 <__subdf3+0x224>
   1ecac:	fff70693          	addi	a3,a4,-1
   1ecb0:	e80682e3          	beqz	a3,1eb34 <__subdf3+0xa0>
   1ecb4:	02671263          	bne	a4,t1,1ecd8 <__subdf3+0x244>
   1ecb8:	00058793          	mv	a5,a1
   1ecbc:	00060513          	mv	a0,a2
   1ecc0:	00070a13          	mv	s4,a4
   1ecc4:	e91ff06f          	j	1eb54 <__subdf3+0xc0>
   1ecc8:	52688c63          	beq	a7,t1,1f200 <__subdf3+0x76c>
   1eccc:	008006b7          	lui	a3,0x800
   1ecd0:	00d7e7b3          	or	a5,a5,a3
   1ecd4:	00070693          	mv	a3,a4
   1ecd8:	03800713          	li	a4,56
   1ecdc:	06d74e63          	blt	a4,a3,1ed58 <__subdf3+0x2c4>
   1ece0:	01f00713          	li	a4,31
   1ece4:	02000313          	li	t1,32
   1ece8:	04d74063          	blt	a4,a3,1ed28 <__subdf3+0x294>
   1ecec:	40d30333          	sub	t1,t1,a3
   1ecf0:	00679733          	sll	a4,a5,t1
   1ecf4:	00d55833          	srl	a6,a0,a3
   1ecf8:	00651333          	sll	t1,a0,t1
   1ecfc:	01076733          	or	a4,a4,a6
   1ed00:	00603333          	snez	t1,t1
   1ed04:	00676733          	or	a4,a4,t1
   1ed08:	00d7d6b3          	srl	a3,a5,a3
   1ed0c:	00c70633          	add	a2,a4,a2
   1ed10:	00b686b3          	add	a3,a3,a1
   1ed14:	00e63733          	sltu	a4,a2,a4
   1ed18:	00060513          	mv	a0,a2
   1ed1c:	00e687b3          	add	a5,a3,a4
   1ed20:	00088a13          	mv	s4,a7
   1ed24:	efdff06f          	j	1ec20 <__subdf3+0x18c>
   1ed28:	fe068713          	addi	a4,a3,-32 # 7fffe0 <__BSS_END__+0x7dc58c>
   1ed2c:	00e7d733          	srl	a4,a5,a4
   1ed30:	00000813          	li	a6,0
   1ed34:	00668863          	beq	a3,t1,1ed44 <__subdf3+0x2b0>
   1ed38:	04000813          	li	a6,64
   1ed3c:	40d80833          	sub	a6,a6,a3
   1ed40:	01079833          	sll	a6,a5,a6
   1ed44:	00a86833          	or	a6,a6,a0
   1ed48:	01003833          	snez	a6,a6
   1ed4c:	01076733          	or	a4,a4,a6
   1ed50:	00000693          	li	a3,0
   1ed54:	fb9ff06f          	j	1ed0c <__subdf3+0x278>
   1ed58:	00a7e733          	or	a4,a5,a0
   1ed5c:	00e03733          	snez	a4,a4
   1ed60:	ff1ff06f          	j	1ed50 <__subdf3+0x2bc>
   1ed64:	001a0713          	addi	a4,s4,1
   1ed68:	7fe77693          	andi	a3,a4,2046
   1ed6c:	06069463          	bnez	a3,1edd4 <__subdf3+0x340>
   1ed70:	00a7e733          	or	a4,a5,a0
   1ed74:	040a1063          	bnez	s4,1edb4 <__subdf3+0x320>
   1ed78:	2c070063          	beqz	a4,1f038 <__subdf3+0x5a4>
   1ed7c:	00c5e733          	or	a4,a1,a2
   1ed80:	44070a63          	beqz	a4,1f1d4 <__subdf3+0x740>
   1ed84:	00c50633          	add	a2,a0,a2
   1ed88:	00b786b3          	add	a3,a5,a1
   1ed8c:	00a63533          	sltu	a0,a2,a0
   1ed90:	00a685b3          	add	a1,a3,a0
   1ed94:	00859793          	slli	a5,a1,0x8
   1ed98:	2a07d063          	bgez	a5,1f038 <__subdf3+0x5a4>
   1ed9c:	ff8007b7          	lui	a5,0xff800
   1eda0:	fff78793          	addi	a5,a5,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1eda4:	00f5f7b3          	and	a5,a1,a5
   1eda8:	00060513          	mv	a0,a2
   1edac:	00100a13          	li	s4,1
   1edb0:	da5ff06f          	j	1eb54 <__subdf3+0xc0>
   1edb4:	42070663          	beqz	a4,1f1e0 <__subdf3+0x74c>
   1edb8:	00c5e633          	or	a2,a1,a2
   1edbc:	00030a13          	mv	s4,t1
   1edc0:	d8060ae3          	beqz	a2,1eb54 <__subdf3+0xc0>
   1edc4:	00000993          	li	s3,0
   1edc8:	004007b7          	lui	a5,0x400
   1edcc:	00000513          	li	a0,0
   1edd0:	d85ff06f          	j	1eb54 <__subdf3+0xc0>
   1edd4:	40670e63          	beq	a4,t1,1f1f0 <__subdf3+0x75c>
   1edd8:	00c50633          	add	a2,a0,a2
   1eddc:	00a63533          	sltu	a0,a2,a0
   1ede0:	00b786b3          	add	a3,a5,a1
   1ede4:	00a686b3          	add	a3,a3,a0
   1ede8:	01f69513          	slli	a0,a3,0x1f
   1edec:	00165613          	srli	a2,a2,0x1
   1edf0:	00c56533          	or	a0,a0,a2
   1edf4:	0016d793          	srli	a5,a3,0x1
   1edf8:	00070a13          	mv	s4,a4
   1edfc:	00757713          	andi	a4,a0,7
   1ee00:	02070063          	beqz	a4,1ee20 <__subdf3+0x38c>
   1ee04:	00f57713          	andi	a4,a0,15
   1ee08:	00400693          	li	a3,4
   1ee0c:	00d70a63          	beq	a4,a3,1ee20 <__subdf3+0x38c>
   1ee10:	00d50733          	add	a4,a0,a3
   1ee14:	00a736b3          	sltu	a3,a4,a0
   1ee18:	00d787b3          	add	a5,a5,a3
   1ee1c:	00070513          	mv	a0,a4
   1ee20:	00879713          	slli	a4,a5,0x8
   1ee24:	d20758e3          	bgez	a4,1eb54 <__subdf3+0xc0>
   1ee28:	001a0a13          	addi	s4,s4,1
   1ee2c:	7ff00713          	li	a4,2047
   1ee30:	3cea0263          	beq	s4,a4,1f1f4 <__subdf3+0x760>
   1ee34:	ff800737          	lui	a4,0xff800
   1ee38:	fff70713          	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1ee3c:	00e7f7b3          	and	a5,a5,a4
   1ee40:	d15ff06f          	j	1eb54 <__subdf3+0xc0>
   1ee44:	0f005463          	blez	a6,1ef2c <__subdf3+0x498>
   1ee48:	08089c63          	bnez	a7,1eee0 <__subdf3+0x44c>
   1ee4c:	00c5e733          	or	a4,a1,a2
   1ee50:	d00702e3          	beqz	a4,1eb54 <__subdf3+0xc0>
   1ee54:	fffa0813          	addi	a6,s4,-1
   1ee58:	02081063          	bnez	a6,1ee78 <__subdf3+0x3e4>
   1ee5c:	40c50633          	sub	a2,a0,a2
   1ee60:	00c53733          	sltu	a4,a0,a2
   1ee64:	40b786b3          	sub	a3,a5,a1
   1ee68:	00060513          	mv	a0,a2
   1ee6c:	40e687b3          	sub	a5,a3,a4
   1ee70:	00100a13          	li	s4,1
   1ee74:	0500006f          	j	1eec4 <__subdf3+0x430>
   1ee78:	cc6a0ee3          	beq	s4,t1,1eb54 <__subdf3+0xc0>
   1ee7c:	03800713          	li	a4,56
   1ee80:	0b074063          	blt	a4,a6,1ef20 <__subdf3+0x48c>
   1ee84:	01f00713          	li	a4,31
   1ee88:	02000893          	li	a7,32
   1ee8c:	07074263          	blt	a4,a6,1eef0 <__subdf3+0x45c>
   1ee90:	410888b3          	sub	a7,a7,a6
   1ee94:	01159733          	sll	a4,a1,a7
   1ee98:	010656b3          	srl	a3,a2,a6
   1ee9c:	011618b3          	sll	a7,a2,a7
   1eea0:	00d76733          	or	a4,a4,a3
   1eea4:	011038b3          	snez	a7,a7
   1eea8:	01176733          	or	a4,a4,a7
   1eeac:	0105d833          	srl	a6,a1,a6
   1eeb0:	40e50733          	sub	a4,a0,a4
   1eeb4:	00e536b3          	sltu	a3,a0,a4
   1eeb8:	41078833          	sub	a6,a5,a6
   1eebc:	00070513          	mv	a0,a4
   1eec0:	40d807b3          	sub	a5,a6,a3
   1eec4:	00879713          	slli	a4,a5,0x8
   1eec8:	f2075ae3          	bgez	a4,1edfc <__subdf3+0x368>
   1eecc:	00800937          	lui	s2,0x800
   1eed0:	fff90913          	addi	s2,s2,-1 # 7fffff <__BSS_END__+0x7dc5ab>
   1eed4:	0127f933          	and	s2,a5,s2
   1eed8:	00050a93          	mv	s5,a0
   1eedc:	2140006f          	j	1f0f0 <__subdf3+0x65c>
   1eee0:	c66a0ae3          	beq	s4,t1,1eb54 <__subdf3+0xc0>
   1eee4:	00800737          	lui	a4,0x800
   1eee8:	00e5e5b3          	or	a1,a1,a4
   1eeec:	f91ff06f          	j	1ee7c <__subdf3+0x3e8>
   1eef0:	fe080713          	addi	a4,a6,-32
   1eef4:	00e5d733          	srl	a4,a1,a4
   1eef8:	00000693          	li	a3,0
   1eefc:	01180863          	beq	a6,a7,1ef0c <__subdf3+0x478>
   1ef00:	04000693          	li	a3,64
   1ef04:	410686b3          	sub	a3,a3,a6
   1ef08:	00d596b3          	sll	a3,a1,a3
   1ef0c:	00c6e6b3          	or	a3,a3,a2
   1ef10:	00d036b3          	snez	a3,a3
   1ef14:	00d76733          	or	a4,a4,a3
   1ef18:	00000813          	li	a6,0
   1ef1c:	f95ff06f          	j	1eeb0 <__subdf3+0x41c>
   1ef20:	00c5e733          	or	a4,a1,a2
   1ef24:	00e03733          	snez	a4,a4
   1ef28:	ff1ff06f          	j	1ef18 <__subdf3+0x484>
   1ef2c:	0e080463          	beqz	a6,1f014 <__subdf3+0x580>
   1ef30:	41488833          	sub	a6,a7,s4
   1ef34:	040a1263          	bnez	s4,1ef78 <__subdf3+0x4e4>
   1ef38:	00a7e733          	or	a4,a5,a0
   1ef3c:	02070463          	beqz	a4,1ef64 <__subdf3+0x4d0>
   1ef40:	fff80713          	addi	a4,a6,-1
   1ef44:	00071e63          	bnez	a4,1ef60 <__subdf3+0x4cc>
   1ef48:	40a60533          	sub	a0,a2,a0
   1ef4c:	40f585b3          	sub	a1,a1,a5
   1ef50:	00a63633          	sltu	a2,a2,a0
   1ef54:	40c587b3          	sub	a5,a1,a2
   1ef58:	00068993          	mv	s3,a3
   1ef5c:	f15ff06f          	j	1ee70 <__subdf3+0x3dc>
   1ef60:	02681463          	bne	a6,t1,1ef88 <__subdf3+0x4f4>
   1ef64:	00068993          	mv	s3,a3
   1ef68:	00058793          	mv	a5,a1
   1ef6c:	00060513          	mv	a0,a2
   1ef70:	00080a13          	mv	s4,a6
   1ef74:	be1ff06f          	j	1eb54 <__subdf3+0xc0>
   1ef78:	28688263          	beq	a7,t1,1f1fc <__subdf3+0x768>
   1ef7c:	00800737          	lui	a4,0x800
   1ef80:	00e7e7b3          	or	a5,a5,a4
   1ef84:	00080713          	mv	a4,a6
   1ef88:	03800813          	li	a6,56
   1ef8c:	06e84e63          	blt	a6,a4,1f008 <__subdf3+0x574>
   1ef90:	01f00813          	li	a6,31
   1ef94:	02000e13          	li	t3,32
   1ef98:	04e84063          	blt	a6,a4,1efd8 <__subdf3+0x544>
   1ef9c:	40ee0e33          	sub	t3,t3,a4
   1efa0:	00e55333          	srl	t1,a0,a4
   1efa4:	01c79833          	sll	a6,a5,t3
   1efa8:	01c51e33          	sll	t3,a0,t3
   1efac:	00686833          	or	a6,a6,t1
   1efb0:	01c03e33          	snez	t3,t3
   1efb4:	01c86533          	or	a0,a6,t3
   1efb8:	00e7d733          	srl	a4,a5,a4
   1efbc:	40a60533          	sub	a0,a2,a0
   1efc0:	40e58733          	sub	a4,a1,a4
   1efc4:	00a63633          	sltu	a2,a2,a0
   1efc8:	40c707b3          	sub	a5,a4,a2
   1efcc:	00088a13          	mv	s4,a7
   1efd0:	00068993          	mv	s3,a3
   1efd4:	ef1ff06f          	j	1eec4 <__subdf3+0x430>
   1efd8:	fe070813          	addi	a6,a4,-32 # 7fffe0 <__BSS_END__+0x7dc58c>
   1efdc:	0107d833          	srl	a6,a5,a6
   1efe0:	00000313          	li	t1,0
   1efe4:	01c70863          	beq	a4,t3,1eff4 <__subdf3+0x560>
   1efe8:	04000313          	li	t1,64
   1efec:	40e30333          	sub	t1,t1,a4
   1eff0:	00679333          	sll	t1,a5,t1
   1eff4:	00a36333          	or	t1,t1,a0
   1eff8:	00603333          	snez	t1,t1
   1effc:	00686533          	or	a0,a6,t1
   1f000:	00000713          	li	a4,0
   1f004:	fb9ff06f          	j	1efbc <__subdf3+0x528>
   1f008:	00a7e533          	or	a0,a5,a0
   1f00c:	00a03533          	snez	a0,a0
   1f010:	ff1ff06f          	j	1f000 <__subdf3+0x56c>
   1f014:	001a0713          	addi	a4,s4,1
   1f018:	7fe77713          	andi	a4,a4,2046
   1f01c:	0a071263          	bnez	a4,1f0c0 <__subdf3+0x62c>
   1f020:	00c5e733          	or	a4,a1,a2
   1f024:	00a7e833          	or	a6,a5,a0
   1f028:	060a1863          	bnez	s4,1f098 <__subdf3+0x604>
   1f02c:	02081263          	bnez	a6,1f050 <__subdf3+0x5bc>
   1f030:	1e070063          	beqz	a4,1f210 <__subdf3+0x77c>
   1f034:	00068993          	mv	s3,a3
   1f038:	00b66533          	or	a0,a2,a1
   1f03c:	12050263          	beqz	a0,1f160 <__subdf3+0x6cc>
   1f040:	00058793          	mv	a5,a1
   1f044:	00060513          	mv	a0,a2
   1f048:	00000a13          	li	s4,0
   1f04c:	db1ff06f          	j	1edfc <__subdf3+0x368>
   1f050:	18070263          	beqz	a4,1f1d4 <__subdf3+0x740>
   1f054:	40c50833          	sub	a6,a0,a2
   1f058:	010538b3          	sltu	a7,a0,a6
   1f05c:	40b78733          	sub	a4,a5,a1
   1f060:	41170733          	sub	a4,a4,a7
   1f064:	00871893          	slli	a7,a4,0x8
   1f068:	0008de63          	bgez	a7,1f084 <__subdf3+0x5f0>
   1f06c:	40a60533          	sub	a0,a2,a0
   1f070:	00a63733          	sltu	a4,a2,a0
   1f074:	40f585b3          	sub	a1,a1,a5
   1f078:	00050613          	mv	a2,a0
   1f07c:	40e585b3          	sub	a1,a1,a4
   1f080:	fb5ff06f          	j	1f034 <__subdf3+0x5a0>
   1f084:	00e86533          	or	a0,a6,a4
   1f088:	18050863          	beqz	a0,1f218 <__subdf3+0x784>
   1f08c:	00070593          	mv	a1,a4
   1f090:	00080613          	mv	a2,a6
   1f094:	fa5ff06f          	j	1f038 <__subdf3+0x5a4>
   1f098:	00081e63          	bnez	a6,1f0b4 <__subdf3+0x620>
   1f09c:	00068993          	mv	s3,a3
   1f0a0:	14071063          	bnez	a4,1f1e0 <__subdf3+0x74c>
   1f0a4:	00000993          	li	s3,0
   1f0a8:	004007b7          	lui	a5,0x400
   1f0ac:	00000513          	li	a0,0
   1f0b0:	1380006f          	j	1f1e8 <__subdf3+0x754>
   1f0b4:	00030a13          	mv	s4,t1
   1f0b8:	a8070ee3          	beqz	a4,1eb54 <__subdf3+0xc0>
   1f0bc:	d09ff06f          	j	1edc4 <__subdf3+0x330>
   1f0c0:	40c50733          	sub	a4,a0,a2
   1f0c4:	00e53833          	sltu	a6,a0,a4
   1f0c8:	40b78933          	sub	s2,a5,a1
   1f0cc:	41090933          	sub	s2,s2,a6
   1f0d0:	00891813          	slli	a6,s2,0x8
   1f0d4:	00070a93          	mv	s5,a4
   1f0d8:	06085e63          	bgez	a6,1f154 <__subdf3+0x6c0>
   1f0dc:	40a60ab3          	sub	s5,a2,a0
   1f0e0:	40f58933          	sub	s2,a1,a5
   1f0e4:	01563633          	sltu	a2,a2,s5
   1f0e8:	40c90933          	sub	s2,s2,a2
   1f0ec:	00068993          	mv	s3,a3
   1f0f0:	06090e63          	beqz	s2,1f16c <__subdf3+0x6d8>
   1f0f4:	00090513          	mv	a0,s2
   1f0f8:	2a8030ef          	jal	223a0 <__clzsi2>
   1f0fc:	ff850613          	addi	a2,a0,-8
   1f100:	02000693          	li	a3,32
   1f104:	40c686b3          	sub	a3,a3,a2
   1f108:	00c91933          	sll	s2,s2,a2
   1f10c:	00dad6b3          	srl	a3,s5,a3
   1f110:	0126e6b3          	or	a3,a3,s2
   1f114:	00ca9933          	sll	s2,s5,a2
   1f118:	0b464263          	blt	a2,s4,1f1bc <__subdf3+0x728>
   1f11c:	41460633          	sub	a2,a2,s4
   1f120:	00160593          	addi	a1,a2,1 # 7ff00001 <__BSS_END__+0x7fedc5ad>
   1f124:	01f00793          	li	a5,31
   1f128:	02000713          	li	a4,32
   1f12c:	06b7c063          	blt	a5,a1,1f18c <__subdf3+0x6f8>
   1f130:	40b70733          	sub	a4,a4,a1
   1f134:	00e69633          	sll	a2,a3,a4
   1f138:	00b957b3          	srl	a5,s2,a1
   1f13c:	00e91733          	sll	a4,s2,a4
   1f140:	00f66633          	or	a2,a2,a5
   1f144:	00e03733          	snez	a4,a4
   1f148:	00e66633          	or	a2,a2,a4
   1f14c:	00b6d5b3          	srl	a1,a3,a1
   1f150:	ee9ff06f          	j	1f038 <__subdf3+0x5a4>
   1f154:	01276533          	or	a0,a4,s2
   1f158:	f8051ce3          	bnez	a0,1f0f0 <__subdf3+0x65c>
   1f15c:	00000993          	li	s3,0
   1f160:	00000793          	li	a5,0
   1f164:	00000a13          	li	s4,0
   1f168:	9edff06f          	j	1eb54 <__subdf3+0xc0>
   1f16c:	000a8513          	mv	a0,s5
   1f170:	230030ef          	jal	223a0 <__clzsi2>
   1f174:	01850613          	addi	a2,a0,24
   1f178:	01f00793          	li	a5,31
   1f17c:	f8c7d2e3          	bge	a5,a2,1f100 <__subdf3+0x66c>
   1f180:	ff850693          	addi	a3,a0,-8
   1f184:	00da96b3          	sll	a3,s5,a3
   1f188:	f91ff06f          	j	1f118 <__subdf3+0x684>
   1f18c:	fe160613          	addi	a2,a2,-31
   1f190:	00c6d633          	srl	a2,a3,a2
   1f194:	00000793          	li	a5,0
   1f198:	00e58863          	beq	a1,a4,1f1a8 <__subdf3+0x714>
   1f19c:	04000793          	li	a5,64
   1f1a0:	40b787b3          	sub	a5,a5,a1
   1f1a4:	00f697b3          	sll	a5,a3,a5
   1f1a8:	00f967b3          	or	a5,s2,a5
   1f1ac:	00f037b3          	snez	a5,a5
   1f1b0:	00f66633          	or	a2,a2,a5
   1f1b4:	00000593          	li	a1,0
   1f1b8:	e81ff06f          	j	1f038 <__subdf3+0x5a4>
   1f1bc:	ff8007b7          	lui	a5,0xff800
   1f1c0:	fff78793          	addi	a5,a5,-1 # ff7fffff <__BSS_END__+0xff7dc5ab>
   1f1c4:	40ca0a33          	sub	s4,s4,a2
   1f1c8:	00f6f7b3          	and	a5,a3,a5
   1f1cc:	00090513          	mv	a0,s2
   1f1d0:	c2dff06f          	j	1edfc <__subdf3+0x368>
   1f1d4:	00078593          	mv	a1,a5
   1f1d8:	00050613          	mv	a2,a0
   1f1dc:	e5dff06f          	j	1f038 <__subdf3+0x5a4>
   1f1e0:	00058793          	mv	a5,a1
   1f1e4:	00060513          	mv	a0,a2
   1f1e8:	00030a13          	mv	s4,t1
   1f1ec:	969ff06f          	j	1eb54 <__subdf3+0xc0>
   1f1f0:	00070a13          	mv	s4,a4
   1f1f4:	00000793          	li	a5,0
   1f1f8:	bd5ff06f          	j	1edcc <__subdf3+0x338>
   1f1fc:	00068993          	mv	s3,a3
   1f200:	00058793          	mv	a5,a1
   1f204:	00060513          	mv	a0,a2
   1f208:	00088a13          	mv	s4,a7
   1f20c:	949ff06f          	j	1eb54 <__subdf3+0xc0>
   1f210:	00000993          	li	s3,0
   1f214:	fe1ff06f          	j	1f1f4 <__subdf3+0x760>
   1f218:	00000993          	li	s3,0
   1f21c:	00000793          	li	a5,0
   1f220:	935ff06f          	j	1eb54 <__subdf3+0xc0>

0001f224 <__fixdfsi>:
   1f224:	0145d713          	srli	a4,a1,0x14
   1f228:	001006b7          	lui	a3,0x100
   1f22c:	fff68793          	addi	a5,a3,-1 # fffff <__BSS_END__+0xdc5ab>
   1f230:	7ff77713          	andi	a4,a4,2047
   1f234:	3fe00613          	li	a2,1022
   1f238:	00b7f7b3          	and	a5,a5,a1
   1f23c:	01f5d593          	srli	a1,a1,0x1f
   1f240:	04e65e63          	bge	a2,a4,1f29c <__fixdfsi+0x78>
   1f244:	41d00613          	li	a2,1053
   1f248:	00e65a63          	bge	a2,a4,1f25c <__fixdfsi+0x38>
   1f24c:	80000537          	lui	a0,0x80000
   1f250:	fff50513          	addi	a0,a0,-1 # 7fffffff <__BSS_END__+0x7ffdc5ab>
   1f254:	00a58533          	add	a0,a1,a0
   1f258:	00008067          	ret
   1f25c:	00d7e7b3          	or	a5,a5,a3
   1f260:	43300693          	li	a3,1075
   1f264:	40e686b3          	sub	a3,a3,a4
   1f268:	01f00613          	li	a2,31
   1f26c:	02d64063          	blt	a2,a3,1f28c <__fixdfsi+0x68>
   1f270:	bed70713          	addi	a4,a4,-1043
   1f274:	00e797b3          	sll	a5,a5,a4
   1f278:	00d55533          	srl	a0,a0,a3
   1f27c:	00a7e533          	or	a0,a5,a0
   1f280:	02058063          	beqz	a1,1f2a0 <__fixdfsi+0x7c>
   1f284:	40a00533          	neg	a0,a0
   1f288:	00008067          	ret
   1f28c:	41300693          	li	a3,1043
   1f290:	40e68733          	sub	a4,a3,a4
   1f294:	00e7d533          	srl	a0,a5,a4
   1f298:	fe9ff06f          	j	1f280 <__fixdfsi+0x5c>
   1f29c:	00000513          	li	a0,0
   1f2a0:	00008067          	ret

0001f2a4 <__floatsidf>:
   1f2a4:	fe010113          	addi	sp,sp,-32
   1f2a8:	00112e23          	sw	ra,28(sp)
   1f2ac:	00812c23          	sw	s0,24(sp)
   1f2b0:	00912a23          	sw	s1,20(sp)
   1f2b4:	01212823          	sw	s2,16(sp)
   1f2b8:	01312623          	sw	s3,12(sp)
   1f2bc:	00050793          	mv	a5,a0
   1f2c0:	08050663          	beqz	a0,1f34c <__floatsidf+0xa8>
   1f2c4:	41f55713          	srai	a4,a0,0x1f
   1f2c8:	00a74933          	xor	s2,a4,a0
   1f2cc:	40e90933          	sub	s2,s2,a4
   1f2d0:	01f55993          	srli	s3,a0,0x1f
   1f2d4:	00090513          	mv	a0,s2
   1f2d8:	0c8030ef          	jal	223a0 <__clzsi2>
   1f2dc:	41e00793          	li	a5,1054
   1f2e0:	00a00713          	li	a4,10
   1f2e4:	40a787b3          	sub	a5,a5,a0
   1f2e8:	04a74a63          	blt	a4,a0,1f33c <__floatsidf+0x98>
   1f2ec:	00b00713          	li	a4,11
   1f2f0:	40a70733          	sub	a4,a4,a0
   1f2f4:	01550513          	addi	a0,a0,21
   1f2f8:	00e95733          	srl	a4,s2,a4
   1f2fc:	00a91933          	sll	s2,s2,a0
   1f300:	00c71713          	slli	a4,a4,0xc
   1f304:	01c12083          	lw	ra,28(sp)
   1f308:	01812403          	lw	s0,24(sp)
   1f30c:	00c75713          	srli	a4,a4,0xc
   1f310:	01479793          	slli	a5,a5,0x14
   1f314:	01f99993          	slli	s3,s3,0x1f
   1f318:	00e7e7b3          	or	a5,a5,a4
   1f31c:	0137e733          	or	a4,a5,s3
   1f320:	01412483          	lw	s1,20(sp)
   1f324:	00c12983          	lw	s3,12(sp)
   1f328:	00090513          	mv	a0,s2
   1f32c:	00070593          	mv	a1,a4
   1f330:	01012903          	lw	s2,16(sp)
   1f334:	02010113          	addi	sp,sp,32
   1f338:	00008067          	ret
   1f33c:	ff550513          	addi	a0,a0,-11
   1f340:	00a91733          	sll	a4,s2,a0
   1f344:	00000913          	li	s2,0
   1f348:	fb9ff06f          	j	1f300 <__floatsidf+0x5c>
   1f34c:	00000993          	li	s3,0
   1f350:	00000713          	li	a4,0
   1f354:	ff1ff06f          	j	1f344 <__floatsidf+0xa0>

0001f358 <__eqtf2>:
   1f358:	00c52703          	lw	a4,12(a0)
   1f35c:	00052f03          	lw	t5,0(a0)
   1f360:	00452303          	lw	t1,4(a0)
   1f364:	00852e03          	lw	t3,8(a0)
   1f368:	00c5a503          	lw	a0,12(a1) # 1000c <exit-0xa8>
   1f36c:	000086b7          	lui	a3,0x8
   1f370:	01075613          	srli	a2,a4,0x10
   1f374:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   1f378:	01071893          	slli	a7,a4,0x10
   1f37c:	0005a783          	lw	a5,0(a1)
   1f380:	0045af83          	lw	t6,4(a1)
   1f384:	0085a283          	lw	t0,8(a1)
   1f388:	01051e93          	slli	t4,a0,0x10
   1f38c:	01f75593          	srli	a1,a4,0x1f
   1f390:	00d67633          	and	a2,a2,a3
   1f394:	01055713          	srli	a4,a0,0x10
   1f398:	ff010113          	addi	sp,sp,-16
   1f39c:	0108d893          	srli	a7,a7,0x10
   1f3a0:	010ede93          	srli	t4,t4,0x10
   1f3a4:	00d77733          	and	a4,a4,a3
   1f3a8:	01f55813          	srli	a6,a0,0x1f
   1f3ac:	02d61063          	bne	a2,a3,1f3cc <__eqtf2+0x74>
   1f3b0:	01e366b3          	or	a3,t1,t5
   1f3b4:	01c6e6b3          	or	a3,a3,t3
   1f3b8:	0116e6b3          	or	a3,a3,a7
   1f3bc:	00100513          	li	a0,1
   1f3c0:	04069a63          	bnez	a3,1f414 <__eqtf2+0xbc>
   1f3c4:	04c71863          	bne	a4,a2,1f414 <__eqtf2+0xbc>
   1f3c8:	0080006f          	j	1f3d0 <__eqtf2+0x78>
   1f3cc:	00d71c63          	bne	a4,a3,1f3e4 <__eqtf2+0x8c>
   1f3d0:	01f7e6b3          	or	a3,a5,t6
   1f3d4:	0056e6b3          	or	a3,a3,t0
   1f3d8:	01d6e6b3          	or	a3,a3,t4
   1f3dc:	00100513          	li	a0,1
   1f3e0:	02069a63          	bnez	a3,1f414 <__eqtf2+0xbc>
   1f3e4:	00100513          	li	a0,1
   1f3e8:	02c71663          	bne	a4,a2,1f414 <__eqtf2+0xbc>
   1f3ec:	03e79463          	bne	a5,t5,1f414 <__eqtf2+0xbc>
   1f3f0:	03f31263          	bne	t1,t6,1f414 <__eqtf2+0xbc>
   1f3f4:	025e1063          	bne	t3,t0,1f414 <__eqtf2+0xbc>
   1f3f8:	01d89e63          	bne	a7,t4,1f414 <__eqtf2+0xbc>
   1f3fc:	03058063          	beq	a1,a6,1f41c <__eqtf2+0xc4>
   1f400:	00071a63          	bnez	a4,1f414 <__eqtf2+0xbc>
   1f404:	00f36533          	or	a0,t1,a5
   1f408:	01c56533          	or	a0,a0,t3
   1f40c:	01156533          	or	a0,a0,a7
   1f410:	00a03533          	snez	a0,a0
   1f414:	01010113          	addi	sp,sp,16
   1f418:	00008067          	ret
   1f41c:	00000513          	li	a0,0
   1f420:	ff5ff06f          	j	1f414 <__eqtf2+0xbc>

0001f424 <__getf2>:
   1f424:	00c52783          	lw	a5,12(a0)
   1f428:	00c5a683          	lw	a3,12(a1)
   1f42c:	00008737          	lui	a4,0x8
   1f430:	0107d613          	srli	a2,a5,0x10
   1f434:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   1f438:	01079813          	slli	a6,a5,0x10
   1f43c:	01069293          	slli	t0,a3,0x10
   1f440:	00052883          	lw	a7,0(a0)
   1f444:	00452303          	lw	t1,4(a0)
   1f448:	00852e03          	lw	t3,8(a0)
   1f44c:	00e67633          	and	a2,a2,a4
   1f450:	0106d513          	srli	a0,a3,0x10
   1f454:	0005ae83          	lw	t4,0(a1)
   1f458:	0045af03          	lw	t5,4(a1)
   1f45c:	0085af83          	lw	t6,8(a1)
   1f460:	ff010113          	addi	sp,sp,-16
   1f464:	01085813          	srli	a6,a6,0x10
   1f468:	01f7d793          	srli	a5,a5,0x1f
   1f46c:	0102d293          	srli	t0,t0,0x10
   1f470:	00e57533          	and	a0,a0,a4
   1f474:	01f6d693          	srli	a3,a3,0x1f
   1f478:	00e61a63          	bne	a2,a4,1f48c <__getf2+0x68>
   1f47c:	0068e733          	or	a4,a7,t1
   1f480:	01c76733          	or	a4,a4,t3
   1f484:	01076733          	or	a4,a4,a6
   1f488:	08071c63          	bnez	a4,1f520 <__getf2+0xfc>
   1f48c:	00008737          	lui	a4,0x8
   1f490:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   1f494:	00e51a63          	bne	a0,a4,1f4a8 <__getf2+0x84>
   1f498:	01df6733          	or	a4,t5,t4
   1f49c:	01f76733          	or	a4,a4,t6
   1f4a0:	00576733          	or	a4,a4,t0
   1f4a4:	06071e63          	bnez	a4,1f520 <__getf2+0xfc>
   1f4a8:	00000713          	li	a4,0
   1f4ac:	00061a63          	bnez	a2,1f4c0 <__getf2+0x9c>
   1f4b0:	0068e733          	or	a4,a7,t1
   1f4b4:	01c76733          	or	a4,a4,t3
   1f4b8:	01076733          	or	a4,a4,a6
   1f4bc:	00173713          	seqz	a4,a4
   1f4c0:	06051463          	bnez	a0,1f528 <__getf2+0x104>
   1f4c4:	01df65b3          	or	a1,t5,t4
   1f4c8:	01f5e5b3          	or	a1,a1,t6
   1f4cc:	0055e5b3          	or	a1,a1,t0
   1f4d0:	00070a63          	beqz	a4,1f4e4 <__getf2+0xc0>
   1f4d4:	06058463          	beqz	a1,1f53c <__getf2+0x118>
   1f4d8:	00169513          	slli	a0,a3,0x1
   1f4dc:	fff50513          	addi	a0,a0,-1
   1f4e0:	05c0006f          	j	1f53c <__getf2+0x118>
   1f4e4:	04059463          	bnez	a1,1f52c <__getf2+0x108>
   1f4e8:	40f00533          	neg	a0,a5
   1f4ec:	04c0006f          	j	1f538 <__getf2+0x114>
   1f4f0:	fea644e3          	blt	a2,a0,1f4d8 <__getf2+0xb4>
   1f4f4:	ff02eae3          	bltu	t0,a6,1f4e8 <__getf2+0xc4>
   1f4f8:	02581063          	bne	a6,t0,1f518 <__getf2+0xf4>
   1f4fc:	ffcfe6e3          	bltu	t6,t3,1f4e8 <__getf2+0xc4>
   1f500:	01fe1c63          	bne	t3,t6,1f518 <__getf2+0xf4>
   1f504:	fe6f62e3          	bltu	t5,t1,1f4e8 <__getf2+0xc4>
   1f508:	006f1863          	bne	t5,t1,1f518 <__getf2+0xf4>
   1f50c:	fd1eeee3          	bltu	t4,a7,1f4e8 <__getf2+0xc4>
   1f510:	00000513          	li	a0,0
   1f514:	03d8f463          	bgeu	a7,t4,1f53c <__getf2+0x118>
   1f518:	00179513          	slli	a0,a5,0x1
   1f51c:	fc1ff06f          	j	1f4dc <__getf2+0xb8>
   1f520:	ffe00513          	li	a0,-2
   1f524:	0180006f          	j	1f53c <__getf2+0x118>
   1f528:	fa0718e3          	bnez	a4,1f4d8 <__getf2+0xb4>
   1f52c:	faf69ee3          	bne	a3,a5,1f4e8 <__getf2+0xc4>
   1f530:	fcc550e3          	bge	a0,a2,1f4f0 <__getf2+0xcc>
   1f534:	40d00533          	neg	a0,a3
   1f538:	00156513          	ori	a0,a0,1
   1f53c:	01010113          	addi	sp,sp,16
   1f540:	00008067          	ret

0001f544 <__letf2>:
   1f544:	00c52783          	lw	a5,12(a0)
   1f548:	00c5a683          	lw	a3,12(a1)
   1f54c:	00008737          	lui	a4,0x8
   1f550:	0107d613          	srli	a2,a5,0x10
   1f554:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   1f558:	01079813          	slli	a6,a5,0x10
   1f55c:	01069293          	slli	t0,a3,0x10
   1f560:	00052883          	lw	a7,0(a0)
   1f564:	00452303          	lw	t1,4(a0)
   1f568:	00852e03          	lw	t3,8(a0)
   1f56c:	00e67633          	and	a2,a2,a4
   1f570:	0106d513          	srli	a0,a3,0x10
   1f574:	0005ae83          	lw	t4,0(a1)
   1f578:	0045af03          	lw	t5,4(a1)
   1f57c:	0085af83          	lw	t6,8(a1)
   1f580:	ff010113          	addi	sp,sp,-16
   1f584:	01085813          	srli	a6,a6,0x10
   1f588:	01f7d793          	srli	a5,a5,0x1f
   1f58c:	0102d293          	srli	t0,t0,0x10
   1f590:	00e57533          	and	a0,a0,a4
   1f594:	01f6d693          	srli	a3,a3,0x1f
   1f598:	00e61a63          	bne	a2,a4,1f5ac <__letf2+0x68>
   1f59c:	0068e733          	or	a4,a7,t1
   1f5a0:	01c76733          	or	a4,a4,t3
   1f5a4:	01076733          	or	a4,a4,a6
   1f5a8:	08071c63          	bnez	a4,1f640 <__letf2+0xfc>
   1f5ac:	00008737          	lui	a4,0x8
   1f5b0:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   1f5b4:	00e51a63          	bne	a0,a4,1f5c8 <__letf2+0x84>
   1f5b8:	01df6733          	or	a4,t5,t4
   1f5bc:	01f76733          	or	a4,a4,t6
   1f5c0:	00576733          	or	a4,a4,t0
   1f5c4:	06071e63          	bnez	a4,1f640 <__letf2+0xfc>
   1f5c8:	00000713          	li	a4,0
   1f5cc:	00061a63          	bnez	a2,1f5e0 <__letf2+0x9c>
   1f5d0:	0068e733          	or	a4,a7,t1
   1f5d4:	01c76733          	or	a4,a4,t3
   1f5d8:	01076733          	or	a4,a4,a6
   1f5dc:	00173713          	seqz	a4,a4
   1f5e0:	06051463          	bnez	a0,1f648 <__letf2+0x104>
   1f5e4:	01df65b3          	or	a1,t5,t4
   1f5e8:	01f5e5b3          	or	a1,a1,t6
   1f5ec:	0055e5b3          	or	a1,a1,t0
   1f5f0:	00070a63          	beqz	a4,1f604 <__letf2+0xc0>
   1f5f4:	06058463          	beqz	a1,1f65c <__letf2+0x118>
   1f5f8:	00169513          	slli	a0,a3,0x1
   1f5fc:	fff50513          	addi	a0,a0,-1
   1f600:	05c0006f          	j	1f65c <__letf2+0x118>
   1f604:	04059463          	bnez	a1,1f64c <__letf2+0x108>
   1f608:	40f00533          	neg	a0,a5
   1f60c:	04c0006f          	j	1f658 <__letf2+0x114>
   1f610:	fea644e3          	blt	a2,a0,1f5f8 <__letf2+0xb4>
   1f614:	ff02eae3          	bltu	t0,a6,1f608 <__letf2+0xc4>
   1f618:	02581063          	bne	a6,t0,1f638 <__letf2+0xf4>
   1f61c:	ffcfe6e3          	bltu	t6,t3,1f608 <__letf2+0xc4>
   1f620:	01fe1c63          	bne	t3,t6,1f638 <__letf2+0xf4>
   1f624:	fe6f62e3          	bltu	t5,t1,1f608 <__letf2+0xc4>
   1f628:	006f1863          	bne	t5,t1,1f638 <__letf2+0xf4>
   1f62c:	fd1eeee3          	bltu	t4,a7,1f608 <__letf2+0xc4>
   1f630:	00000513          	li	a0,0
   1f634:	03d8f463          	bgeu	a7,t4,1f65c <__letf2+0x118>
   1f638:	00179513          	slli	a0,a5,0x1
   1f63c:	fc1ff06f          	j	1f5fc <__letf2+0xb8>
   1f640:	00200513          	li	a0,2
   1f644:	0180006f          	j	1f65c <__letf2+0x118>
   1f648:	fa0718e3          	bnez	a4,1f5f8 <__letf2+0xb4>
   1f64c:	faf69ee3          	bne	a3,a5,1f608 <__letf2+0xc4>
   1f650:	fcc550e3          	bge	a0,a2,1f610 <__letf2+0xcc>
   1f654:	40d00533          	neg	a0,a3
   1f658:	00156513          	ori	a0,a0,1
   1f65c:	01010113          	addi	sp,sp,16
   1f660:	00008067          	ret

0001f664 <__multf3>:
   1f664:	00c5a883          	lw	a7,12(a1)
   1f668:	f7010113          	addi	sp,sp,-144
   1f66c:	0045a783          	lw	a5,4(a1)
   1f670:	0085a683          	lw	a3,8(a1)
   1f674:	08812423          	sw	s0,136(sp)
   1f678:	00050413          	mv	s0,a0
   1f67c:	0005a503          	lw	a0,0(a1)
   1f680:	09212023          	sw	s2,128(sp)
   1f684:	07512a23          	sw	s5,116(sp)
   1f688:	00c62903          	lw	s2,12(a2)
   1f68c:	00462a83          	lw	s5,4(a2)
   1f690:	07612823          	sw	s6,112(sp)
   1f694:	07712623          	sw	s7,108(sp)
   1f698:	00862b03          	lw	s6,8(a2)
   1f69c:	00062b83          	lw	s7,0(a2)
   1f6a0:	01089713          	slli	a4,a7,0x10
   1f6a4:	00008637          	lui	a2,0x8
   1f6a8:	08912223          	sw	s1,132(sp)
   1f6ac:	01075713          	srli	a4,a4,0x10
   1f6b0:	0108d493          	srli	s1,a7,0x10
   1f6b4:	fff60613          	addi	a2,a2,-1 # 7fff <exit-0x80b5>
   1f6b8:	07412c23          	sw	s4,120(sp)
   1f6bc:	08112623          	sw	ra,140(sp)
   1f6c0:	07312e23          	sw	s3,124(sp)
   1f6c4:	07812423          	sw	s8,104(sp)
   1f6c8:	07912223          	sw	s9,100(sp)
   1f6cc:	07a12023          	sw	s10,96(sp)
   1f6d0:	05b12e23          	sw	s11,92(sp)
   1f6d4:	02a12823          	sw	a0,48(sp)
   1f6d8:	02f12a23          	sw	a5,52(sp)
   1f6dc:	02d12c23          	sw	a3,56(sp)
   1f6e0:	03112e23          	sw	a7,60(sp)
   1f6e4:	00a12023          	sw	a0,0(sp)
   1f6e8:	00f12223          	sw	a5,4(sp)
   1f6ec:	00d12423          	sw	a3,8(sp)
   1f6f0:	00e12623          	sw	a4,12(sp)
   1f6f4:	00c4f4b3          	and	s1,s1,a2
   1f6f8:	01f8da13          	srli	s4,a7,0x1f
   1f6fc:	5c0484e3          	beqz	s1,204c4 <__multf3+0xe60>
   1f700:	6ec480e3          	beq	s1,a2,205e0 <__multf3+0xf7c>
   1f704:	000107b7          	lui	a5,0x10
   1f708:	00f76733          	or	a4,a4,a5
   1f70c:	00e12623          	sw	a4,12(sp)
   1f710:	00010613          	mv	a2,sp
   1f714:	00c10793          	addi	a5,sp,12
   1f718:	0007a703          	lw	a4,0(a5) # 10000 <exit-0xb4>
   1f71c:	ffc7a683          	lw	a3,-4(a5)
   1f720:	ffc78793          	addi	a5,a5,-4
   1f724:	00371713          	slli	a4,a4,0x3
   1f728:	01d6d693          	srli	a3,a3,0x1d
   1f72c:	00d76733          	or	a4,a4,a3
   1f730:	00e7a223          	sw	a4,4(a5)
   1f734:	fef612e3          	bne	a2,a5,1f718 <__multf3+0xb4>
   1f738:	ffffc7b7          	lui	a5,0xffffc
   1f73c:	00351513          	slli	a0,a0,0x3
   1f740:	00178793          	addi	a5,a5,1 # ffffc001 <__BSS_END__+0xfffd85ad>
   1f744:	00a12023          	sw	a0,0(sp)
   1f748:	00f484b3          	add	s1,s1,a5
   1f74c:	00000993          	li	s3,0
   1f750:	01091513          	slli	a0,s2,0x10
   1f754:	000087b7          	lui	a5,0x8
   1f758:	01095813          	srli	a6,s2,0x10
   1f75c:	01055513          	srli	a0,a0,0x10
   1f760:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   1f764:	03212e23          	sw	s2,60(sp)
   1f768:	03712823          	sw	s7,48(sp)
   1f76c:	03512a23          	sw	s5,52(sp)
   1f770:	03612c23          	sw	s6,56(sp)
   1f774:	01712823          	sw	s7,16(sp)
   1f778:	01512a23          	sw	s5,20(sp)
   1f77c:	01612c23          	sw	s6,24(sp)
   1f780:	00a12e23          	sw	a0,28(sp)
   1f784:	00f87833          	and	a6,a6,a5
   1f788:	01f95913          	srli	s2,s2,0x1f
   1f78c:	66080ee3          	beqz	a6,20608 <__multf3+0xfa4>
   1f790:	00f81463          	bne	a6,a5,1f798 <__multf3+0x134>
   1f794:	7910006f          	j	20724 <__multf3+0x10c0>
   1f798:	000107b7          	lui	a5,0x10
   1f79c:	00f56533          	or	a0,a0,a5
   1f7a0:	00a12e23          	sw	a0,28(sp)
   1f7a4:	01010613          	addi	a2,sp,16
   1f7a8:	01c10793          	addi	a5,sp,28
   1f7ac:	0007a703          	lw	a4,0(a5) # 10000 <exit-0xb4>
   1f7b0:	ffc7a683          	lw	a3,-4(a5)
   1f7b4:	ffc78793          	addi	a5,a5,-4
   1f7b8:	00371713          	slli	a4,a4,0x3
   1f7bc:	01d6d693          	srli	a3,a3,0x1d
   1f7c0:	00d76733          	or	a4,a4,a3
   1f7c4:	00e7a223          	sw	a4,4(a5)
   1f7c8:	fef612e3          	bne	a2,a5,1f7ac <__multf3+0x148>
   1f7cc:	ffffc7b7          	lui	a5,0xffffc
   1f7d0:	003b9b93          	slli	s7,s7,0x3
   1f7d4:	00178793          	addi	a5,a5,1 # ffffc001 <__BSS_END__+0xfffd85ad>
   1f7d8:	01712823          	sw	s7,16(sp)
   1f7dc:	00f80833          	add	a6,a6,a5
   1f7e0:	00000713          	li	a4,0
   1f7e4:	00299793          	slli	a5,s3,0x2
   1f7e8:	00980833          	add	a6,a6,s1
   1f7ec:	00e7e7b3          	or	a5,a5,a4
   1f7f0:	00a00693          	li	a3,10
   1f7f4:	00180d13          	addi	s10,a6,1
   1f7f8:	00f6d463          	bge	a3,a5,1f800 <__multf3+0x19c>
   1f7fc:	7950006f          	j	20790 <__multf3+0x112c>
   1f800:	00200613          	li	a2,2
   1f804:	012a48b3          	xor	a7,s4,s2
   1f808:	00100693          	li	a3,1
   1f80c:	00f65463          	bge	a2,a5,1f814 <__multf3+0x1b0>
   1f810:	7410006f          	j	20750 <__multf3+0x10ec>
   1f814:	fff78793          	addi	a5,a5,-1
   1f818:	00f6e463          	bltu	a3,a5,1f820 <__multf3+0x1bc>
   1f81c:	78d0006f          	j	207a8 <__multf3+0x1144>
   1f820:	00012f03          	lw	t5,0(sp)
   1f824:	01012e83          	lw	t4,16(sp)
   1f828:	010f1313          	slli	t1,t5,0x10
   1f82c:	010e9e13          	slli	t3,t4,0x10
   1f830:	01035313          	srli	t1,t1,0x10
   1f834:	010e5e13          	srli	t3,t3,0x10
   1f838:	010f5f93          	srli	t6,t5,0x10
   1f83c:	010ed793          	srli	a5,t4,0x10
   1f840:	00030513          	mv	a0,t1
   1f844:	000e0593          	mv	a1,t3
   1f848:	281020ef          	jal	222c8 <__mulsi3>
   1f84c:	00050713          	mv	a4,a0
   1f850:	00078593          	mv	a1,a5
   1f854:	00030513          	mv	a0,t1
   1f858:	271020ef          	jal	222c8 <__mulsi3>
   1f85c:	00050313          	mv	t1,a0
   1f860:	000e0593          	mv	a1,t3
   1f864:	000f8513          	mv	a0,t6
   1f868:	261020ef          	jal	222c8 <__mulsi3>
   1f86c:	00050e13          	mv	t3,a0
   1f870:	00078593          	mv	a1,a5
   1f874:	000f8513          	mv	a0,t6
   1f878:	251020ef          	jal	222c8 <__mulsi3>
   1f87c:	01075793          	srli	a5,a4,0x10
   1f880:	01c30333          	add	t1,t1,t3
   1f884:	006787b3          	add	a5,a5,t1
   1f888:	00050693          	mv	a3,a0
   1f88c:	01c7f663          	bgeu	a5,t3,1f898 <__multf3+0x234>
   1f890:	00010637          	lui	a2,0x10
   1f894:	00c506b3          	add	a3,a0,a2
   1f898:	01412283          	lw	t0,20(sp)
   1f89c:	01071713          	slli	a4,a4,0x10
   1f8a0:	0107d613          	srli	a2,a5,0x10
   1f8a4:	01075713          	srli	a4,a4,0x10
   1f8a8:	01079793          	slli	a5,a5,0x10
   1f8ac:	00e787b3          	add	a5,a5,a4
   1f8b0:	01029313          	slli	t1,t0,0x10
   1f8b4:	010f1713          	slli	a4,t5,0x10
   1f8b8:	00d606b3          	add	a3,a2,a3
   1f8bc:	01075713          	srli	a4,a4,0x10
   1f8c0:	01035313          	srli	t1,t1,0x10
   1f8c4:	02d12a23          	sw	a3,52(sp)
   1f8c8:	02f12823          	sw	a5,48(sp)
   1f8cc:	010f5e13          	srli	t3,t5,0x10
   1f8d0:	0102df93          	srli	t6,t0,0x10
   1f8d4:	00070513          	mv	a0,a4
   1f8d8:	00030593          	mv	a1,t1
   1f8dc:	1ed020ef          	jal	222c8 <__mulsi3>
   1f8e0:	00050793          	mv	a5,a0
   1f8e4:	000f8593          	mv	a1,t6
   1f8e8:	00070513          	mv	a0,a4
   1f8ec:	1dd020ef          	jal	222c8 <__mulsi3>
   1f8f0:	00050713          	mv	a4,a0
   1f8f4:	00030593          	mv	a1,t1
   1f8f8:	000e0513          	mv	a0,t3
   1f8fc:	1cd020ef          	jal	222c8 <__mulsi3>
   1f900:	00050313          	mv	t1,a0
   1f904:	000f8593          	mv	a1,t6
   1f908:	000e0513          	mv	a0,t3
   1f90c:	1bd020ef          	jal	222c8 <__mulsi3>
   1f910:	0107de13          	srli	t3,a5,0x10
   1f914:	00670733          	add	a4,a4,t1
   1f918:	00ee0e33          	add	t3,t3,a4
   1f91c:	00050b13          	mv	s6,a0
   1f920:	006e7663          	bgeu	t3,t1,1f92c <__multf3+0x2c8>
   1f924:	00010737          	lui	a4,0x10
   1f928:	00e50b33          	add	s6,a0,a4
   1f92c:	00412383          	lw	t2,4(sp)
   1f930:	010e9493          	slli	s1,t4,0x10
   1f934:	01079793          	slli	a5,a5,0x10
   1f938:	01039313          	slli	t1,t2,0x10
   1f93c:	010e5913          	srli	s2,t3,0x10
   1f940:	0107d793          	srli	a5,a5,0x10
   1f944:	01035313          	srli	t1,t1,0x10
   1f948:	0104d493          	srli	s1,s1,0x10
   1f94c:	010e1e13          	slli	t3,t3,0x10
   1f950:	00fe0e33          	add	t3,t3,a5
   1f954:	0103d713          	srli	a4,t2,0x10
   1f958:	010ed793          	srli	a5,t4,0x10
   1f95c:	00030513          	mv	a0,t1
   1f960:	00048593          	mv	a1,s1
   1f964:	165020ef          	jal	222c8 <__mulsi3>
   1f968:	00050f93          	mv	t6,a0
   1f96c:	00078593          	mv	a1,a5
   1f970:	00030513          	mv	a0,t1
   1f974:	155020ef          	jal	222c8 <__mulsi3>
   1f978:	00050313          	mv	t1,a0
   1f97c:	00048593          	mv	a1,s1
   1f980:	00070513          	mv	a0,a4
   1f984:	145020ef          	jal	222c8 <__mulsi3>
   1f988:	00050493          	mv	s1,a0
   1f98c:	00078593          	mv	a1,a5
   1f990:	00070513          	mv	a0,a4
   1f994:	135020ef          	jal	222c8 <__mulsi3>
   1f998:	010fd793          	srli	a5,t6,0x10
   1f99c:	00930333          	add	t1,t1,s1
   1f9a0:	006787b3          	add	a5,a5,t1
   1f9a4:	00050713          	mv	a4,a0
   1f9a8:	0097f663          	bgeu	a5,s1,1f9b4 <__multf3+0x350>
   1f9ac:	000106b7          	lui	a3,0x10
   1f9b0:	00d50733          	add	a4,a0,a3
   1f9b4:	010f9f93          	slli	t6,t6,0x10
   1f9b8:	0107d993          	srli	s3,a5,0x10
   1f9bc:	010fdf93          	srli	t6,t6,0x10
   1f9c0:	01079793          	slli	a5,a5,0x10
   1f9c4:	01f787b3          	add	a5,a5,t6
   1f9c8:	01039a13          	slli	s4,t2,0x10
   1f9cc:	01029f93          	slli	t6,t0,0x10
   1f9d0:	010a5a13          	srli	s4,s4,0x10
   1f9d4:	010fdf93          	srli	t6,t6,0x10
   1f9d8:	00e989b3          	add	s3,s3,a4
   1f9dc:	0103d493          	srli	s1,t2,0x10
   1f9e0:	0102d713          	srli	a4,t0,0x10
   1f9e4:	000a0513          	mv	a0,s4
   1f9e8:	000f8593          	mv	a1,t6
   1f9ec:	0dd020ef          	jal	222c8 <__mulsi3>
   1f9f0:	00050313          	mv	t1,a0
   1f9f4:	00070593          	mv	a1,a4
   1f9f8:	000a0513          	mv	a0,s4
   1f9fc:	0cd020ef          	jal	222c8 <__mulsi3>
   1fa00:	00050a13          	mv	s4,a0
   1fa04:	000f8593          	mv	a1,t6
   1fa08:	00048513          	mv	a0,s1
   1fa0c:	0bd020ef          	jal	222c8 <__mulsi3>
   1fa10:	00050f93          	mv	t6,a0
   1fa14:	00070593          	mv	a1,a4
   1fa18:	00048513          	mv	a0,s1
   1fa1c:	0ad020ef          	jal	222c8 <__mulsi3>
   1fa20:	01035713          	srli	a4,t1,0x10
   1fa24:	01fa0a33          	add	s4,s4,t6
   1fa28:	01470733          	add	a4,a4,s4
   1fa2c:	00050693          	mv	a3,a0
   1fa30:	01f77663          	bgeu	a4,t6,1fa3c <__multf3+0x3d8>
   1fa34:	00010637          	lui	a2,0x10
   1fa38:	00c506b3          	add	a3,a0,a2
   1fa3c:	01812a03          	lw	s4,24(sp)
   1fa40:	010f1b93          	slli	s7,t5,0x10
   1fa44:	01031313          	slli	t1,t1,0x10
   1fa48:	010a1a93          	slli	s5,s4,0x10
   1fa4c:	01075493          	srli	s1,a4,0x10
   1fa50:	01035313          	srli	t1,t1,0x10
   1fa54:	010bdb93          	srli	s7,s7,0x10
   1fa58:	010ada93          	srli	s5,s5,0x10
   1fa5c:	01071713          	slli	a4,a4,0x10
   1fa60:	00670733          	add	a4,a4,t1
   1fa64:	00d484b3          	add	s1,s1,a3
   1fa68:	010f5313          	srli	t1,t5,0x10
   1fa6c:	010a5c13          	srli	s8,s4,0x10
   1fa70:	000b8513          	mv	a0,s7
   1fa74:	000a8593          	mv	a1,s5
   1fa78:	051020ef          	jal	222c8 <__mulsi3>
   1fa7c:	00050f93          	mv	t6,a0
   1fa80:	000c0593          	mv	a1,s8
   1fa84:	000b8513          	mv	a0,s7
   1fa88:	041020ef          	jal	222c8 <__mulsi3>
   1fa8c:	00050b93          	mv	s7,a0
   1fa90:	000a8593          	mv	a1,s5
   1fa94:	00030513          	mv	a0,t1
   1fa98:	031020ef          	jal	222c8 <__mulsi3>
   1fa9c:	00050a93          	mv	s5,a0
   1faa0:	000c0593          	mv	a1,s8
   1faa4:	00030513          	mv	a0,t1
   1faa8:	021020ef          	jal	222c8 <__mulsi3>
   1faac:	010fd313          	srli	t1,t6,0x10
   1fab0:	015b8bb3          	add	s7,s7,s5
   1fab4:	01730333          	add	t1,t1,s7
   1fab8:	00050693          	mv	a3,a0
   1fabc:	01537663          	bgeu	t1,s5,1fac8 <__multf3+0x464>
   1fac0:	00010637          	lui	a2,0x10
   1fac4:	00c506b3          	add	a3,a0,a2
   1fac8:	010f9f93          	slli	t6,t6,0x10
   1facc:	01035613          	srli	a2,t1,0x10
   1fad0:	010fdf93          	srli	t6,t6,0x10
   1fad4:	01031313          	slli	t1,t1,0x10
   1fad8:	01f30333          	add	t1,t1,t6
   1fadc:	00812f83          	lw	t6,8(sp)
   1fae0:	010e9c13          	slli	s8,t4,0x10
   1fae4:	010c5c13          	srli	s8,s8,0x10
   1fae8:	010f9b93          	slli	s7,t6,0x10
   1faec:	010bdb93          	srli	s7,s7,0x10
   1faf0:	00d60db3          	add	s11,a2,a3
   1faf4:	010edc93          	srli	s9,t4,0x10
   1faf8:	000b8513          	mv	a0,s7
   1fafc:	000c0593          	mv	a1,s8
   1fb00:	7c8020ef          	jal	222c8 <__mulsi3>
   1fb04:	00050a93          	mv	s5,a0
   1fb08:	000c8593          	mv	a1,s9
   1fb0c:	000b8513          	mv	a0,s7
   1fb10:	7b8020ef          	jal	222c8 <__mulsi3>
   1fb14:	00050b93          	mv	s7,a0
   1fb18:	000c0593          	mv	a1,s8
   1fb1c:	010fd513          	srli	a0,t6,0x10
   1fb20:	7a8020ef          	jal	222c8 <__mulsi3>
   1fb24:	00050c13          	mv	s8,a0
   1fb28:	000c8593          	mv	a1,s9
   1fb2c:	010fd513          	srli	a0,t6,0x10
   1fb30:	798020ef          	jal	222c8 <__mulsi3>
   1fb34:	010ad693          	srli	a3,s5,0x10
   1fb38:	018b8bb3          	add	s7,s7,s8
   1fb3c:	01768bb3          	add	s7,a3,s7
   1fb40:	018bf663          	bgeu	s7,s8,1fb4c <__multf3+0x4e8>
   1fb44:	000106b7          	lui	a3,0x10
   1fb48:	00d50533          	add	a0,a0,a3
   1fb4c:	03412603          	lw	a2,52(sp)
   1fb50:	010bd693          	srli	a3,s7,0x10
   1fb54:	00a68533          	add	a0,a3,a0
   1fb58:	01c60e33          	add	t3,a2,t3
   1fb5c:	00ce3633          	sltu	a2,t3,a2
   1fb60:	00c90933          	add	s2,s2,a2
   1fb64:	01690933          	add	s2,s2,s6
   1fb68:	00fe07b3          	add	a5,t3,a5
   1fb6c:	013909b3          	add	s3,s2,s3
   1fb70:	02f12a23          	sw	a5,52(sp)
   1fb74:	01c7b7b3          	sltu	a5,a5,t3
   1fb78:	00f987b3          	add	a5,s3,a5
   1fb7c:	0129b6b3          	sltu	a3,s3,s2
   1fb80:	0137b9b3          	sltu	s3,a5,s3
   1fb84:	00c93933          	sltu	s2,s2,a2
   1fb88:	0136e6b3          	or	a3,a3,s3
   1fb8c:	012686b3          	add	a3,a3,s2
   1fb90:	00e78733          	add	a4,a5,a4
   1fb94:	009684b3          	add	s1,a3,s1
   1fb98:	00f737b3          	sltu	a5,a4,a5
   1fb9c:	010a9a93          	slli	s5,s5,0x10
   1fba0:	00670333          	add	t1,a4,t1
   1fba4:	00f487b3          	add	a5,s1,a5
   1fba8:	010b9b93          	slli	s7,s7,0x10
   1fbac:	010ada93          	srli	s5,s5,0x10
   1fbb0:	01b78633          	add	a2,a5,s11
   1fbb4:	015b8ab3          	add	s5,s7,s5
   1fbb8:	00e33733          	sltu	a4,t1,a4
   1fbbc:	00e60733          	add	a4,a2,a4
   1fbc0:	01530ab3          	add	s5,t1,s5
   1fbc4:	00a70533          	add	a0,a4,a0
   1fbc8:	00d4b6b3          	sltu	a3,s1,a3
   1fbcc:	03512c23          	sw	s5,56(sp)
   1fbd0:	0097b4b3          	sltu	s1,a5,s1
   1fbd4:	006abab3          	sltu	s5,s5,t1
   1fbd8:	00f637b3          	sltu	a5,a2,a5
   1fbdc:	01c12303          	lw	t1,28(sp)
   1fbe0:	00c73633          	sltu	a2,a4,a2
   1fbe4:	00c7e7b3          	or	a5,a5,a2
   1fbe8:	01550ab3          	add	s5,a0,s5
   1fbec:	0096e6b3          	or	a3,a3,s1
   1fbf0:	00f686b3          	add	a3,a3,a5
   1fbf4:	03512e23          	sw	s5,60(sp)
   1fbf8:	00e537b3          	sltu	a5,a0,a4
   1fbfc:	00aabab3          	sltu	s5,s5,a0
   1fc00:	0157e7b3          	or	a5,a5,s5
   1fc04:	010f5713          	srli	a4,t5,0x10
   1fc08:	01031913          	slli	s2,t1,0x10
   1fc0c:	010f1f13          	slli	t5,t5,0x10
   1fc10:	00d787b3          	add	a5,a5,a3
   1fc14:	010f5f13          	srli	t5,t5,0x10
   1fc18:	01095913          	srli	s2,s2,0x10
   1fc1c:	04f12023          	sw	a5,64(sp)
   1fc20:	000f0513          	mv	a0,t5
   1fc24:	01035793          	srli	a5,t1,0x10
   1fc28:	00090593          	mv	a1,s2
   1fc2c:	69c020ef          	jal	222c8 <__mulsi3>
   1fc30:	00050493          	mv	s1,a0
   1fc34:	00078593          	mv	a1,a5
   1fc38:	000f0513          	mv	a0,t5
   1fc3c:	68c020ef          	jal	222c8 <__mulsi3>
   1fc40:	00050e13          	mv	t3,a0
   1fc44:	00090593          	mv	a1,s2
   1fc48:	00070513          	mv	a0,a4
   1fc4c:	67c020ef          	jal	222c8 <__mulsi3>
   1fc50:	00050f13          	mv	t5,a0
   1fc54:	00078593          	mv	a1,a5
   1fc58:	00070513          	mv	a0,a4
   1fc5c:	66c020ef          	jal	222c8 <__mulsi3>
   1fc60:	0104d793          	srli	a5,s1,0x10
   1fc64:	01ee0e33          	add	t3,t3,t5
   1fc68:	01c787b3          	add	a5,a5,t3
   1fc6c:	00050713          	mv	a4,a0
   1fc70:	01e7f663          	bgeu	a5,t5,1fc7c <__multf3+0x618>
   1fc74:	000106b7          	lui	a3,0x10
   1fc78:	00d50733          	add	a4,a0,a3
   1fc7c:	00c12f03          	lw	t5,12(sp)
   1fc80:	0107d913          	srli	s2,a5,0x10
   1fc84:	00e90933          	add	s2,s2,a4
   1fc88:	010f1e13          	slli	t3,t5,0x10
   1fc8c:	010ed713          	srli	a4,t4,0x10
   1fc90:	01049493          	slli	s1,s1,0x10
   1fc94:	010e9e93          	slli	t4,t4,0x10
   1fc98:	0104d493          	srli	s1,s1,0x10
   1fc9c:	010e5e13          	srli	t3,t3,0x10
   1fca0:	010ede93          	srli	t4,t4,0x10
   1fca4:	01079793          	slli	a5,a5,0x10
   1fca8:	009787b3          	add	a5,a5,s1
   1fcac:	000e0513          	mv	a0,t3
   1fcb0:	010f5493          	srli	s1,t5,0x10
   1fcb4:	000e8593          	mv	a1,t4
   1fcb8:	610020ef          	jal	222c8 <__mulsi3>
   1fcbc:	00050993          	mv	s3,a0
   1fcc0:	00070593          	mv	a1,a4
   1fcc4:	000e0513          	mv	a0,t3
   1fcc8:	600020ef          	jal	222c8 <__mulsi3>
   1fccc:	00050e13          	mv	t3,a0
   1fcd0:	000e8593          	mv	a1,t4
   1fcd4:	00048513          	mv	a0,s1
   1fcd8:	5f0020ef          	jal	222c8 <__mulsi3>
   1fcdc:	00050e93          	mv	t4,a0
   1fce0:	00070593          	mv	a1,a4
   1fce4:	00048513          	mv	a0,s1
   1fce8:	5e0020ef          	jal	222c8 <__mulsi3>
   1fcec:	0109d713          	srli	a4,s3,0x10
   1fcf0:	01de0e33          	add	t3,t3,t4
   1fcf4:	01c70733          	add	a4,a4,t3
   1fcf8:	00050693          	mv	a3,a0
   1fcfc:	01d77663          	bgeu	a4,t4,1fd08 <__multf3+0x6a4>
   1fd00:	00010637          	lui	a2,0x10
   1fd04:	00c506b3          	add	a3,a0,a2
   1fd08:	0103da93          	srli	s5,t2,0x10
   1fd0c:	010a5e13          	srli	t3,s4,0x10
   1fd10:	01099993          	slli	s3,s3,0x10
   1fd14:	01039393          	slli	t2,t2,0x10
   1fd18:	010a1a13          	slli	s4,s4,0x10
   1fd1c:	01075513          	srli	a0,a4,0x10
   1fd20:	0109d993          	srli	s3,s3,0x10
   1fd24:	0103d393          	srli	t2,t2,0x10
   1fd28:	010a5a13          	srli	s4,s4,0x10
   1fd2c:	01071713          	slli	a4,a4,0x10
   1fd30:	00d504b3          	add	s1,a0,a3
   1fd34:	01370733          	add	a4,a4,s3
   1fd38:	00038513          	mv	a0,t2
   1fd3c:	000a0593          	mv	a1,s4
   1fd40:	588020ef          	jal	222c8 <__mulsi3>
   1fd44:	00050993          	mv	s3,a0
   1fd48:	000e0593          	mv	a1,t3
   1fd4c:	00038513          	mv	a0,t2
   1fd50:	578020ef          	jal	222c8 <__mulsi3>
   1fd54:	00050e93          	mv	t4,a0
   1fd58:	000a0593          	mv	a1,s4
   1fd5c:	000a8513          	mv	a0,s5
   1fd60:	568020ef          	jal	222c8 <__mulsi3>
   1fd64:	00050393          	mv	t2,a0
   1fd68:	000e0593          	mv	a1,t3
   1fd6c:	000a8513          	mv	a0,s5
   1fd70:	558020ef          	jal	222c8 <__mulsi3>
   1fd74:	0109de13          	srli	t3,s3,0x10
   1fd78:	007e8eb3          	add	t4,t4,t2
   1fd7c:	01de0e33          	add	t3,t3,t4
   1fd80:	00050693          	mv	a3,a0
   1fd84:	007e7663          	bgeu	t3,t2,1fd90 <__multf3+0x72c>
   1fd88:	00010637          	lui	a2,0x10
   1fd8c:	00c506b3          	add	a3,a0,a2
   1fd90:	0102da93          	srli	s5,t0,0x10
   1fd94:	010f9a13          	slli	s4,t6,0x10
   1fd98:	01099993          	slli	s3,s3,0x10
   1fd9c:	01029293          	slli	t0,t0,0x10
   1fda0:	010e5e93          	srli	t4,t3,0x10
   1fda4:	0109d993          	srli	s3,s3,0x10
   1fda8:	010a5a13          	srli	s4,s4,0x10
   1fdac:	0102d293          	srli	t0,t0,0x10
   1fdb0:	010e1e13          	slli	t3,t3,0x10
   1fdb4:	013e0e33          	add	t3,t3,s3
   1fdb8:	00de8eb3          	add	t4,t4,a3
   1fdbc:	010fd993          	srli	s3,t6,0x10
   1fdc0:	000a0513          	mv	a0,s4
   1fdc4:	00028593          	mv	a1,t0
   1fdc8:	500020ef          	jal	222c8 <__mulsi3>
   1fdcc:	00050393          	mv	t2,a0
   1fdd0:	000a8593          	mv	a1,s5
   1fdd4:	000a0513          	mv	a0,s4
   1fdd8:	4f0020ef          	jal	222c8 <__mulsi3>
   1fddc:	00050a13          	mv	s4,a0
   1fde0:	00028593          	mv	a1,t0
   1fde4:	00098513          	mv	a0,s3
   1fde8:	4e0020ef          	jal	222c8 <__mulsi3>
   1fdec:	00050293          	mv	t0,a0
   1fdf0:	000a8593          	mv	a1,s5
   1fdf4:	00098513          	mv	a0,s3
   1fdf8:	4d0020ef          	jal	222c8 <__mulsi3>
   1fdfc:	0103d693          	srli	a3,t2,0x10
   1fe00:	005a0a33          	add	s4,s4,t0
   1fe04:	014686b3          	add	a3,a3,s4
   1fe08:	00050613          	mv	a2,a0
   1fe0c:	0056f663          	bgeu	a3,t0,1fe18 <__multf3+0x7b4>
   1fe10:	000105b7          	lui	a1,0x10
   1fe14:	00b50633          	add	a2,a0,a1
   1fe18:	01039393          	slli	t2,t2,0x10
   1fe1c:	0106d293          	srli	t0,a3,0x10
   1fe20:	0103d393          	srli	t2,t2,0x10
   1fe24:	01069693          	slli	a3,a3,0x10
   1fe28:	00c282b3          	add	t0,t0,a2
   1fe2c:	00768633          	add	a2,a3,t2
   1fe30:	03c12683          	lw	a3,60(sp)
   1fe34:	04012583          	lw	a1,64(sp)
   1fe38:	00f687b3          	add	a5,a3,a5
   1fe3c:	012583b3          	add	t2,a1,s2
   1fe40:	00d7b6b3          	sltu	a3,a5,a3
   1fe44:	00d386b3          	add	a3,t2,a3
   1fe48:	00e78733          	add	a4,a5,a4
   1fe4c:	00968533          	add	a0,a3,s1
   1fe50:	00f737b3          	sltu	a5,a4,a5
   1fe54:	00f507b3          	add	a5,a0,a5
   1fe58:	01c70e33          	add	t3,a4,t3
   1fe5c:	00b3b5b3          	sltu	a1,t2,a1
   1fe60:	0076b3b3          	sltu	t2,a3,t2
   1fe64:	00d536b3          	sltu	a3,a0,a3
   1fe68:	00a7b533          	sltu	a0,a5,a0
   1fe6c:	00a6e6b3          	or	a3,a3,a0
   1fe70:	01d78eb3          	add	t4,a5,t4
   1fe74:	0075e5b3          	or	a1,a1,t2
   1fe78:	00ee3733          	sltu	a4,t3,a4
   1fe7c:	00d585b3          	add	a1,a1,a3
   1fe80:	00ee8733          	add	a4,t4,a4
   1fe84:	00ce06b3          	add	a3,t3,a2
   1fe88:	005702b3          	add	t0,a4,t0
   1fe8c:	01812483          	lw	s1,24(sp)
   1fe90:	02d12e23          	sw	a3,60(sp)
   1fe94:	01c6b6b3          	sltu	a3,a3,t3
   1fe98:	00d286b3          	add	a3,t0,a3
   1fe9c:	00feb7b3          	sltu	a5,t4,a5
   1fea0:	01d73eb3          	sltu	t4,a4,t4
   1fea4:	01d7e7b3          	or	a5,a5,t4
   1fea8:	04d12023          	sw	a3,64(sp)
   1feac:	00e2b733          	sltu	a4,t0,a4
   1feb0:	0056b6b3          	sltu	a3,a3,t0
   1feb4:	00b787b3          	add	a5,a5,a1
   1feb8:	00d76733          	or	a4,a4,a3
   1febc:	010fd293          	srli	t0,t6,0x10
   1fec0:	01049e93          	slli	t4,s1,0x10
   1fec4:	010f9f93          	slli	t6,t6,0x10
   1fec8:	00f70733          	add	a4,a4,a5
   1fecc:	010fdf93          	srli	t6,t6,0x10
   1fed0:	010ede93          	srli	t4,t4,0x10
   1fed4:	04e12223          	sw	a4,68(sp)
   1fed8:	0104d793          	srli	a5,s1,0x10
   1fedc:	000f8513          	mv	a0,t6
   1fee0:	000e8593          	mv	a1,t4
   1fee4:	3e4020ef          	jal	222c8 <__mulsi3>
   1fee8:	00050713          	mv	a4,a0
   1feec:	00078593          	mv	a1,a5
   1fef0:	000f8513          	mv	a0,t6
   1fef4:	3d4020ef          	jal	222c8 <__mulsi3>
   1fef8:	00050e13          	mv	t3,a0
   1fefc:	000e8593          	mv	a1,t4
   1ff00:	00028513          	mv	a0,t0
   1ff04:	3c4020ef          	jal	222c8 <__mulsi3>
   1ff08:	00050e93          	mv	t4,a0
   1ff0c:	00078593          	mv	a1,a5
   1ff10:	00028513          	mv	a0,t0
   1ff14:	3b4020ef          	jal	222c8 <__mulsi3>
   1ff18:	01075793          	srli	a5,a4,0x10
   1ff1c:	01de0e33          	add	t3,t3,t4
   1ff20:	01c787b3          	add	a5,a5,t3
   1ff24:	00050693          	mv	a3,a0
   1ff28:	01d7f663          	bgeu	a5,t4,1ff34 <__multf3+0x8d0>
   1ff2c:	00010637          	lui	a2,0x10
   1ff30:	00c506b3          	add	a3,a0,a2
   1ff34:	00412e03          	lw	t3,4(sp)
   1ff38:	01031f93          	slli	t6,t1,0x10
   1ff3c:	01071713          	slli	a4,a4,0x10
   1ff40:	010e5293          	srli	t0,t3,0x10
   1ff44:	010e1e13          	slli	t3,t3,0x10
   1ff48:	0107d393          	srli	t2,a5,0x10
   1ff4c:	01075713          	srli	a4,a4,0x10
   1ff50:	010e5e13          	srli	t3,t3,0x10
   1ff54:	010fdf93          	srli	t6,t6,0x10
   1ff58:	01079793          	slli	a5,a5,0x10
   1ff5c:	00d383b3          	add	t2,t2,a3
   1ff60:	00e787b3          	add	a5,a5,a4
   1ff64:	01035e93          	srli	t4,t1,0x10
   1ff68:	000e0513          	mv	a0,t3
   1ff6c:	000f8593          	mv	a1,t6
   1ff70:	358020ef          	jal	222c8 <__mulsi3>
   1ff74:	00050713          	mv	a4,a0
   1ff78:	000e8593          	mv	a1,t4
   1ff7c:	000e0513          	mv	a0,t3
   1ff80:	000e8e13          	mv	t3,t4
   1ff84:	344020ef          	jal	222c8 <__mulsi3>
   1ff88:	00050e93          	mv	t4,a0
   1ff8c:	000f8593          	mv	a1,t6
   1ff90:	00028513          	mv	a0,t0
   1ff94:	334020ef          	jal	222c8 <__mulsi3>
   1ff98:	00050f93          	mv	t6,a0
   1ff9c:	000e0593          	mv	a1,t3
   1ffa0:	00028513          	mv	a0,t0
   1ffa4:	324020ef          	jal	222c8 <__mulsi3>
   1ffa8:	01075e13          	srli	t3,a4,0x10
   1ffac:	01fe8eb3          	add	t4,t4,t6
   1ffb0:	01de0e33          	add	t3,t3,t4
   1ffb4:	00050693          	mv	a3,a0
   1ffb8:	01fe7663          	bgeu	t3,t6,1ffc4 <__multf3+0x960>
   1ffbc:	00010637          	lui	a2,0x10
   1ffc0:	00c506b3          	add	a3,a0,a2
   1ffc4:	01071713          	slli	a4,a4,0x10
   1ffc8:	010e5293          	srli	t0,t3,0x10
   1ffcc:	01075713          	srli	a4,a4,0x10
   1ffd0:	010e1e13          	slli	t3,t3,0x10
   1ffd4:	00ee0e33          	add	t3,t3,a4
   1ffd8:	01412703          	lw	a4,20(sp)
   1ffdc:	010f1f93          	slli	t6,t5,0x10
   1ffe0:	010fdf93          	srli	t6,t6,0x10
   1ffe4:	01075a13          	srli	s4,a4,0x10
   1ffe8:	01071713          	slli	a4,a4,0x10
   1ffec:	01075713          	srli	a4,a4,0x10
   1fff0:	00d282b3          	add	t0,t0,a3
   1fff4:	010f5993          	srli	s3,t5,0x10
   1fff8:	000f8513          	mv	a0,t6
   1fffc:	00070593          	mv	a1,a4
   20000:	2c8020ef          	jal	222c8 <__mulsi3>
   20004:	00050e93          	mv	t4,a0
   20008:	000a0593          	mv	a1,s4
   2000c:	000f8513          	mv	a0,t6
   20010:	2b8020ef          	jal	222c8 <__mulsi3>
   20014:	00050f93          	mv	t6,a0
   20018:	00070593          	mv	a1,a4
   2001c:	00098513          	mv	a0,s3
   20020:	2a8020ef          	jal	222c8 <__mulsi3>
   20024:	00050913          	mv	s2,a0
   20028:	000a0593          	mv	a1,s4
   2002c:	00098513          	mv	a0,s3
   20030:	298020ef          	jal	222c8 <__mulsi3>
   20034:	010ed713          	srli	a4,t4,0x10
   20038:	012f8fb3          	add	t6,t6,s2
   2003c:	01f70733          	add	a4,a4,t6
   20040:	00050693          	mv	a3,a0
   20044:	01277663          	bgeu	a4,s2,20050 <__multf3+0x9ec>
   20048:	00010637          	lui	a2,0x10
   2004c:	00c506b3          	add	a3,a0,a2
   20050:	010e9e93          	slli	t4,t4,0x10
   20054:	01075f93          	srli	t6,a4,0x10
   20058:	010ede93          	srli	t4,t4,0x10
   2005c:	01071713          	slli	a4,a4,0x10
   20060:	01d70733          	add	a4,a4,t4
   20064:	00812e83          	lw	t4,8(sp)
   20068:	01035a13          	srli	s4,t1,0x10
   2006c:	01031313          	slli	t1,t1,0x10
   20070:	010eda93          	srli	s5,t4,0x10
   20074:	010e9e93          	slli	t4,t4,0x10
   20078:	010ede93          	srli	t4,t4,0x10
   2007c:	01035313          	srli	t1,t1,0x10
   20080:	00df8fb3          	add	t6,t6,a3
   20084:	000e8513          	mv	a0,t4
   20088:	00030593          	mv	a1,t1
   2008c:	23c020ef          	jal	222c8 <__mulsi3>
   20090:	00050913          	mv	s2,a0
   20094:	000a0593          	mv	a1,s4
   20098:	000e8513          	mv	a0,t4
   2009c:	22c020ef          	jal	222c8 <__mulsi3>
   200a0:	00050e93          	mv	t4,a0
   200a4:	00030593          	mv	a1,t1
   200a8:	000a8513          	mv	a0,s5
   200ac:	21c020ef          	jal	222c8 <__mulsi3>
   200b0:	00050993          	mv	s3,a0
   200b4:	000a0593          	mv	a1,s4
   200b8:	000a8513          	mv	a0,s5
   200bc:	20c020ef          	jal	222c8 <__mulsi3>
   200c0:	013e8333          	add	t1,t4,s3
   200c4:	01095693          	srli	a3,s2,0x10
   200c8:	00d30333          	add	t1,t1,a3
   200cc:	01337663          	bgeu	t1,s3,200d8 <__multf3+0xa74>
   200d0:	000106b7          	lui	a3,0x10
   200d4:	00d50533          	add	a0,a0,a3
   200d8:	010f5a13          	srli	s4,t5,0x10
   200dc:	0104d993          	srli	s3,s1,0x10
   200e0:	01091913          	slli	s2,s2,0x10
   200e4:	010f1f13          	slli	t5,t5,0x10
   200e8:	01049493          	slli	s1,s1,0x10
   200ec:	01035e93          	srli	t4,t1,0x10
   200f0:	01095913          	srli	s2,s2,0x10
   200f4:	010f5f13          	srli	t5,t5,0x10
   200f8:	0104d493          	srli	s1,s1,0x10
   200fc:	01031313          	slli	t1,t1,0x10
   20100:	00ae8eb3          	add	t4,t4,a0
   20104:	01230333          	add	t1,t1,s2
   20108:	000f0513          	mv	a0,t5
   2010c:	00048593          	mv	a1,s1
   20110:	1b8020ef          	jal	222c8 <__mulsi3>
   20114:	00050913          	mv	s2,a0
   20118:	00098593          	mv	a1,s3
   2011c:	000f0513          	mv	a0,t5
   20120:	1a8020ef          	jal	222c8 <__mulsi3>
   20124:	00050f13          	mv	t5,a0
   20128:	00048593          	mv	a1,s1
   2012c:	000a0513          	mv	a0,s4
   20130:	198020ef          	jal	222c8 <__mulsi3>
   20134:	00050493          	mv	s1,a0
   20138:	00098593          	mv	a1,s3
   2013c:	000a0513          	mv	a0,s4
   20140:	188020ef          	jal	222c8 <__mulsi3>
   20144:	009f06b3          	add	a3,t5,s1
   20148:	01095613          	srli	a2,s2,0x10
   2014c:	00c686b3          	add	a3,a3,a2
   20150:	0096f663          	bgeu	a3,s1,2015c <__multf3+0xaf8>
   20154:	00010637          	lui	a2,0x10
   20158:	00c50533          	add	a0,a0,a2
   2015c:	01091913          	slli	s2,s2,0x10
   20160:	0106d613          	srli	a2,a3,0x10
   20164:	01095913          	srli	s2,s2,0x10
   20168:	01069693          	slli	a3,a3,0x10
   2016c:	012685b3          	add	a1,a3,s2
   20170:	04012683          	lw	a3,64(sp)
   20174:	00a60633          	add	a2,a2,a0
   20178:	04412503          	lw	a0,68(sp)
   2017c:	00f687b3          	add	a5,a3,a5
   20180:	00d7b6b3          	sltu	a3,a5,a3
   20184:	007503b3          	add	t2,a0,t2
   20188:	01c78e33          	add	t3,a5,t3
   2018c:	00d386b3          	add	a3,t2,a3
   20190:	005682b3          	add	t0,a3,t0
   20194:	00fe37b3          	sltu	a5,t3,a5
   20198:	00f287b3          	add	a5,t0,a5
   2019c:	00ee0733          	add	a4,t3,a4
   201a0:	01f78fb3          	add	t6,a5,t6
   201a4:	04e12023          	sw	a4,64(sp)
   201a8:	01c73733          	sltu	a4,a4,t3
   201ac:	00ef8733          	add	a4,t6,a4
   201b0:	00a3b533          	sltu	a0,t2,a0
   201b4:	0076b3b3          	sltu	t2,a3,t2
   201b8:	00d2b6b3          	sltu	a3,t0,a3
   201bc:	0057b2b3          	sltu	t0,a5,t0
   201c0:	0056e6b3          	or	a3,a3,t0
   201c4:	00756533          	or	a0,a0,t2
   201c8:	00ffb7b3          	sltu	a5,t6,a5
   201cc:	01f73fb3          	sltu	t6,a4,t6
   201d0:	00d50533          	add	a0,a0,a3
   201d4:	01f7e7b3          	or	a5,a5,t6
   201d8:	00670333          	add	t1,a4,t1
   201dc:	00a787b3          	add	a5,a5,a0
   201e0:	01d78eb3          	add	t4,a5,t4
   201e4:	00e33733          	sltu	a4,t1,a4
   201e8:	00b306b3          	add	a3,t1,a1
   201ec:	00ee8733          	add	a4,t4,a4
   201f0:	00c70633          	add	a2,a4,a2
   201f4:	04d12223          	sw	a3,68(sp)
   201f8:	0066b6b3          	sltu	a3,a3,t1
   201fc:	00d606b3          	add	a3,a2,a3
   20200:	04d12423          	sw	a3,72(sp)
   20204:	00feb7b3          	sltu	a5,t4,a5
   20208:	00c6b6b3          	sltu	a3,a3,a2
   2020c:	01d73eb3          	sltu	t4,a4,t4
   20210:	00e63733          	sltu	a4,a2,a4
   20214:	00d76733          	or	a4,a4,a3
   20218:	01d7e7b3          	or	a5,a5,t4
   2021c:	00e787b3          	add	a5,a5,a4
   20220:	04f12623          	sw	a5,76(sp)
   20224:	00c12703          	lw	a4,12(sp)
   20228:	01c12783          	lw	a5,28(sp)
   2022c:	01075f13          	srli	t5,a4,0x10
   20230:	0107de93          	srli	t4,a5,0x10
   20234:	01071713          	slli	a4,a4,0x10
   20238:	01079793          	slli	a5,a5,0x10
   2023c:	01075713          	srli	a4,a4,0x10
   20240:	0107d793          	srli	a5,a5,0x10
   20244:	00070513          	mv	a0,a4
   20248:	00078593          	mv	a1,a5
   2024c:	07c020ef          	jal	222c8 <__mulsi3>
   20250:	00050313          	mv	t1,a0
   20254:	000e8593          	mv	a1,t4
   20258:	00070513          	mv	a0,a4
   2025c:	06c020ef          	jal	222c8 <__mulsi3>
   20260:	00050713          	mv	a4,a0
   20264:	00078593          	mv	a1,a5
   20268:	000f0513          	mv	a0,t5
   2026c:	05c020ef          	jal	222c8 <__mulsi3>
   20270:	00050e13          	mv	t3,a0
   20274:	000e8593          	mv	a1,t4
   20278:	000f0513          	mv	a0,t5
   2027c:	04c020ef          	jal	222c8 <__mulsi3>
   20280:	01035793          	srli	a5,t1,0x10
   20284:	01c70733          	add	a4,a4,t3
   20288:	00e787b3          	add	a5,a5,a4
   2028c:	00050693          	mv	a3,a0
   20290:	01c7f663          	bgeu	a5,t3,2029c <__multf3+0xc38>
   20294:	00010737          	lui	a4,0x10
   20298:	00e506b3          	add	a3,a0,a4
   2029c:	04812603          	lw	a2,72(sp)
   202a0:	01031313          	slli	t1,t1,0x10
   202a4:	04c12583          	lw	a1,76(sp)
   202a8:	01079713          	slli	a4,a5,0x10
   202ac:	01035313          	srli	t1,t1,0x10
   202b0:	00670733          	add	a4,a4,t1
   202b4:	00e60733          	add	a4,a2,a4
   202b8:	0107d793          	srli	a5,a5,0x10
   202bc:	00b787b3          	add	a5,a5,a1
   202c0:	00c73633          	sltu	a2,a4,a2
   202c4:	00c787b3          	add	a5,a5,a2
   202c8:	00d78533          	add	a0,a5,a3
   202cc:	04e12423          	sw	a4,72(sp)
   202d0:	03412783          	lw	a5,52(sp)
   202d4:	03012703          	lw	a4,48(sp)
   202d8:	04a12623          	sw	a0,76(sp)
   202dc:	04010593          	addi	a1,sp,64
   202e0:	00f76733          	or	a4,a4,a5
   202e4:	03812783          	lw	a5,56(sp)
   202e8:	00f76733          	or	a4,a4,a5
   202ec:	03c12783          	lw	a5,60(sp)
   202f0:	00d79793          	slli	a5,a5,0xd
   202f4:	00e7e7b3          	or	a5,a5,a4
   202f8:	03010713          	addi	a4,sp,48
   202fc:	00c72683          	lw	a3,12(a4) # 1000c <exit-0xa8>
   20300:	01072603          	lw	a2,16(a4)
   20304:	00470713          	addi	a4,a4,4
   20308:	0136d693          	srli	a3,a3,0x13
   2030c:	00d61613          	slli	a2,a2,0xd
   20310:	00c6e6b3          	or	a3,a3,a2
   20314:	fed72e23          	sw	a3,-4(a4)
   20318:	fee592e3          	bne	a1,a4,202fc <__multf3+0xc98>
   2031c:	03012703          	lw	a4,48(sp)
   20320:	00f037b3          	snez	a5,a5
   20324:	03c12683          	lw	a3,60(sp)
   20328:	00e7e7b3          	or	a5,a5,a4
   2032c:	03812703          	lw	a4,56(sp)
   20330:	02d12623          	sw	a3,44(sp)
   20334:	02f12023          	sw	a5,32(sp)
   20338:	02e12423          	sw	a4,40(sp)
   2033c:	03412703          	lw	a4,52(sp)
   20340:	02e12223          	sw	a4,36(sp)
   20344:	00b69713          	slli	a4,a3,0xb
   20348:	4c075863          	bgez	a4,20818 <__multf3+0x11b4>
   2034c:	01f79793          	slli	a5,a5,0x1f
   20350:	02010713          	addi	a4,sp,32
   20354:	02c10513          	addi	a0,sp,44
   20358:	00072603          	lw	a2,0(a4)
   2035c:	00472583          	lw	a1,4(a4)
   20360:	00470713          	addi	a4,a4,4
   20364:	00165613          	srli	a2,a2,0x1
   20368:	01f59593          	slli	a1,a1,0x1f
   2036c:	00b66633          	or	a2,a2,a1
   20370:	fec72e23          	sw	a2,-4(a4)
   20374:	fee512e3          	bne	a0,a4,20358 <__multf3+0xcf4>
   20378:	02012703          	lw	a4,32(sp)
   2037c:	01f7d793          	srli	a5,a5,0x1f
   20380:	0016d693          	srli	a3,a3,0x1
   20384:	00f767b3          	or	a5,a4,a5
   20388:	02d12623          	sw	a3,44(sp)
   2038c:	02f12023          	sw	a5,32(sp)
   20390:	000047b7          	lui	a5,0x4
   20394:	fff78793          	addi	a5,a5,-1 # 3fff <exit-0xc0b5>
   20398:	00fd07b3          	add	a5,s10,a5
   2039c:	48f05263          	blez	a5,20820 <__multf3+0x11bc>
   203a0:	02012703          	lw	a4,32(sp)
   203a4:	00777693          	andi	a3,a4,7
   203a8:	04068463          	beqz	a3,203f0 <__multf3+0xd8c>
   203ac:	00f77693          	andi	a3,a4,15
   203b0:	00400613          	li	a2,4
   203b4:	02c68e63          	beq	a3,a2,203f0 <__multf3+0xd8c>
   203b8:	00c70733          	add	a4,a4,a2
   203bc:	00473693          	sltiu	a3,a4,4
   203c0:	02e12023          	sw	a4,32(sp)
   203c4:	02412703          	lw	a4,36(sp)
   203c8:	00e68733          	add	a4,a3,a4
   203cc:	02e12223          	sw	a4,36(sp)
   203d0:	00d73733          	sltu	a4,a4,a3
   203d4:	02812683          	lw	a3,40(sp)
   203d8:	00e68733          	add	a4,a3,a4
   203dc:	02e12423          	sw	a4,40(sp)
   203e0:	00d73733          	sltu	a4,a4,a3
   203e4:	02c12683          	lw	a3,44(sp)
   203e8:	00d70733          	add	a4,a4,a3
   203ec:	02e12623          	sw	a4,44(sp)
   203f0:	02c12703          	lw	a4,44(sp)
   203f4:	00b71693          	slli	a3,a4,0xb
   203f8:	0006de63          	bgez	a3,20414 <__multf3+0xdb0>
   203fc:	fff007b7          	lui	a5,0xfff00
   20400:	fff78793          	addi	a5,a5,-1 # ffefffff <__BSS_END__+0xffedc5ab>
   20404:	00f77733          	and	a4,a4,a5
   20408:	000047b7          	lui	a5,0x4
   2040c:	02e12623          	sw	a4,44(sp)
   20410:	00fd07b3          	add	a5,s10,a5
   20414:	02010693          	addi	a3,sp,32
   20418:	02c10513          	addi	a0,sp,44
   2041c:	0006a603          	lw	a2,0(a3) # 10000 <exit-0xb4>
   20420:	0046a583          	lw	a1,4(a3)
   20424:	00468693          	addi	a3,a3,4
   20428:	00365613          	srli	a2,a2,0x3
   2042c:	01d59593          	slli	a1,a1,0x1d
   20430:	00b66633          	or	a2,a2,a1
   20434:	fec6ae23          	sw	a2,-4(a3)
   20438:	fed512e3          	bne	a0,a3,2041c <__multf3+0xdb8>
   2043c:	000086b7          	lui	a3,0x8
   20440:	ffe68693          	addi	a3,a3,-2 # 7ffe <exit-0x80b6>
   20444:	5af6c863          	blt	a3,a5,209f4 <__multf3+0x1390>
   20448:	00375713          	srli	a4,a4,0x3
   2044c:	02e12623          	sw	a4,44(sp)
   20450:	00f89893          	slli	a7,a7,0xf
   20454:	00f8e8b3          	or	a7,a7,a5
   20458:	02012783          	lw	a5,32(sp)
   2045c:	02c12703          	lw	a4,44(sp)
   20460:	03111f23          	sh	a7,62(sp)
   20464:	00f42023          	sw	a5,0(s0) # 80000 <__BSS_END__+0x5c5ac>
   20468:	02412783          	lw	a5,36(sp)
   2046c:	02e11e23          	sh	a4,60(sp)
   20470:	08c12083          	lw	ra,140(sp)
   20474:	00f42223          	sw	a5,4(s0)
   20478:	02812783          	lw	a5,40(sp)
   2047c:	00040513          	mv	a0,s0
   20480:	08412483          	lw	s1,132(sp)
   20484:	00f42423          	sw	a5,8(s0)
   20488:	03c12783          	lw	a5,60(sp)
   2048c:	08012903          	lw	s2,128(sp)
   20490:	07c12983          	lw	s3,124(sp)
   20494:	00f42623          	sw	a5,12(s0)
   20498:	08812403          	lw	s0,136(sp)
   2049c:	07812a03          	lw	s4,120(sp)
   204a0:	07412a83          	lw	s5,116(sp)
   204a4:	07012b03          	lw	s6,112(sp)
   204a8:	06c12b83          	lw	s7,108(sp)
   204ac:	06812c03          	lw	s8,104(sp)
   204b0:	06412c83          	lw	s9,100(sp)
   204b4:	06012d03          	lw	s10,96(sp)
   204b8:	05c12d83          	lw	s11,92(sp)
   204bc:	09010113          	addi	sp,sp,144
   204c0:	00008067          	ret
   204c4:	00a7e633          	or	a2,a5,a0
   204c8:	00d66633          	or	a2,a2,a3
   204cc:	00e66633          	or	a2,a2,a4
   204d0:	12060663          	beqz	a2,205fc <__multf3+0xf98>
   204d4:	06070263          	beqz	a4,20538 <__multf3+0xed4>
   204d8:	00070513          	mv	a0,a4
   204dc:	6c5010ef          	jal	223a0 <__clzsi2>
   204e0:	ff450613          	addi	a2,a0,-12
   204e4:	40565693          	srai	a3,a2,0x5
   204e8:	01f67613          	andi	a2,a2,31
   204ec:	40d007b3          	neg	a5,a3
   204f0:	06060e63          	beqz	a2,2056c <__multf3+0xf08>
   204f4:	00279793          	slli	a5,a5,0x2
   204f8:	00c78713          	addi	a4,a5,12 # 400c <exit-0xc0a8>
   204fc:	02000893          	li	a7,32
   20500:	40c888b3          	sub	a7,a7,a2
   20504:	00010593          	mv	a1,sp
   20508:	00e10733          	add	a4,sp,a4
   2050c:	40f007b3          	neg	a5,a5
   20510:	08e59463          	bne	a1,a4,20598 <__multf3+0xf34>
   20514:	00012703          	lw	a4,0(sp)
   20518:	fff68793          	addi	a5,a3,-1
   2051c:	00269693          	slli	a3,a3,0x2
   20520:	00d585b3          	add	a1,a1,a3
   20524:	00c71733          	sll	a4,a4,a2
   20528:	00e5a023          	sw	a4,0(a1) # 10000 <exit-0xb4>
   2052c:	fff00693          	li	a3,-1
   20530:	00010613          	mv	a2,sp
   20534:	0980006f          	j	205cc <__multf3+0xf68>
   20538:	00068a63          	beqz	a3,2054c <__multf3+0xee8>
   2053c:	00068513          	mv	a0,a3
   20540:	661010ef          	jal	223a0 <__clzsi2>
   20544:	02050513          	addi	a0,a0,32
   20548:	f99ff06f          	j	204e0 <__multf3+0xe7c>
   2054c:	00078a63          	beqz	a5,20560 <__multf3+0xefc>
   20550:	00078513          	mv	a0,a5
   20554:	64d010ef          	jal	223a0 <__clzsi2>
   20558:	04050513          	addi	a0,a0,64
   2055c:	f85ff06f          	j	204e0 <__multf3+0xe7c>
   20560:	641010ef          	jal	223a0 <__clzsi2>
   20564:	06050513          	addi	a0,a0,96
   20568:	f79ff06f          	j	204e0 <__multf3+0xe7c>
   2056c:	00c10713          	addi	a4,sp,12
   20570:	00279793          	slli	a5,a5,0x2
   20574:	00300613          	li	a2,3
   20578:	00f705b3          	add	a1,a4,a5
   2057c:	0005a583          	lw	a1,0(a1)
   20580:	fff60613          	addi	a2,a2,-1 # ffff <exit-0xb5>
   20584:	ffc70713          	addi	a4,a4,-4
   20588:	00b72223          	sw	a1,4(a4)
   2058c:	fed656e3          	bge	a2,a3,20578 <__multf3+0xf14>
   20590:	fff68793          	addi	a5,a3,-1
   20594:	f99ff06f          	j	2052c <__multf3+0xec8>
   20598:	00072803          	lw	a6,0(a4)
   2059c:	ffc72303          	lw	t1,-4(a4)
   205a0:	00f70e33          	add	t3,a4,a5
   205a4:	00c81833          	sll	a6,a6,a2
   205a8:	01135333          	srl	t1,t1,a7
   205ac:	00686833          	or	a6,a6,t1
   205b0:	010e2023          	sw	a6,0(t3)
   205b4:	ffc70713          	addi	a4,a4,-4
   205b8:	f59ff06f          	j	20510 <__multf3+0xeac>
   205bc:	00279713          	slli	a4,a5,0x2
   205c0:	00e60733          	add	a4,a2,a4
   205c4:	00072023          	sw	zero,0(a4)
   205c8:	fff78793          	addi	a5,a5,-1
   205cc:	fed798e3          	bne	a5,a3,205bc <__multf3+0xf58>
   205d0:	ffffc4b7          	lui	s1,0xffffc
   205d4:	01148493          	addi	s1,s1,17 # ffffc011 <__BSS_END__+0xfffd85bd>
   205d8:	40a484b3          	sub	s1,s1,a0
   205dc:	970ff06f          	j	1f74c <__multf3+0xe8>
   205e0:	00a7e7b3          	or	a5,a5,a0
   205e4:	00d7e7b3          	or	a5,a5,a3
   205e8:	00e7e7b3          	or	a5,a5,a4
   205ec:	00200993          	li	s3,2
   205f0:	96078063          	beqz	a5,1f750 <__multf3+0xec>
   205f4:	00300993          	li	s3,3
   205f8:	958ff06f          	j	1f750 <__multf3+0xec>
   205fc:	00000493          	li	s1,0
   20600:	00100993          	li	s3,1
   20604:	94cff06f          	j	1f750 <__multf3+0xec>
   20608:	017ae7b3          	or	a5,s5,s7
   2060c:	0167e7b3          	or	a5,a5,s6
   20610:	00a7e7b3          	or	a5,a5,a0
   20614:	12078863          	beqz	a5,20744 <__multf3+0x10e0>
   20618:	06050063          	beqz	a0,20678 <__multf3+0x1014>
   2061c:	585010ef          	jal	223a0 <__clzsi2>
   20620:	ff450613          	addi	a2,a0,-12
   20624:	40565693          	srai	a3,a2,0x5
   20628:	01f67613          	andi	a2,a2,31
   2062c:	40d007b3          	neg	a5,a3
   20630:	08060063          	beqz	a2,206b0 <__multf3+0x104c>
   20634:	00279793          	slli	a5,a5,0x2
   20638:	00c78713          	addi	a4,a5,12
   2063c:	02000893          	li	a7,32
   20640:	01010593          	addi	a1,sp,16
   20644:	40c888b3          	sub	a7,a7,a2
   20648:	00e58733          	add	a4,a1,a4
   2064c:	40f007b3          	neg	a5,a5
   20650:	08e59663          	bne	a1,a4,206dc <__multf3+0x1078>
   20654:	01012703          	lw	a4,16(sp)
   20658:	fff68793          	addi	a5,a3,-1
   2065c:	00269693          	slli	a3,a3,0x2
   20660:	00d585b3          	add	a1,a1,a3
   20664:	00c71733          	sll	a4,a4,a2
   20668:	00e5a023          	sw	a4,0(a1)
   2066c:	fff00693          	li	a3,-1
   20670:	01010613          	addi	a2,sp,16
   20674:	09c0006f          	j	20710 <__multf3+0x10ac>
   20678:	000b0a63          	beqz	s6,2068c <__multf3+0x1028>
   2067c:	000b0513          	mv	a0,s6
   20680:	521010ef          	jal	223a0 <__clzsi2>
   20684:	02050513          	addi	a0,a0,32
   20688:	f99ff06f          	j	20620 <__multf3+0xfbc>
   2068c:	000a8a63          	beqz	s5,206a0 <__multf3+0x103c>
   20690:	000a8513          	mv	a0,s5
   20694:	50d010ef          	jal	223a0 <__clzsi2>
   20698:	04050513          	addi	a0,a0,64
   2069c:	f85ff06f          	j	20620 <__multf3+0xfbc>
   206a0:	000b8513          	mv	a0,s7
   206a4:	4fd010ef          	jal	223a0 <__clzsi2>
   206a8:	06050513          	addi	a0,a0,96
   206ac:	f75ff06f          	j	20620 <__multf3+0xfbc>
   206b0:	01c10713          	addi	a4,sp,28
   206b4:	00279793          	slli	a5,a5,0x2
   206b8:	00300613          	li	a2,3
   206bc:	00f705b3          	add	a1,a4,a5
   206c0:	0005a583          	lw	a1,0(a1)
   206c4:	fff60613          	addi	a2,a2,-1
   206c8:	ffc70713          	addi	a4,a4,-4
   206cc:	00b72223          	sw	a1,4(a4)
   206d0:	fed656e3          	bge	a2,a3,206bc <__multf3+0x1058>
   206d4:	fff68793          	addi	a5,a3,-1
   206d8:	f95ff06f          	j	2066c <__multf3+0x1008>
   206dc:	00072803          	lw	a6,0(a4)
   206e0:	ffc72303          	lw	t1,-4(a4)
   206e4:	00f70e33          	add	t3,a4,a5
   206e8:	00c81833          	sll	a6,a6,a2
   206ec:	01135333          	srl	t1,t1,a7
   206f0:	00686833          	or	a6,a6,t1
   206f4:	010e2023          	sw	a6,0(t3)
   206f8:	ffc70713          	addi	a4,a4,-4
   206fc:	f55ff06f          	j	20650 <__multf3+0xfec>
   20700:	00279713          	slli	a4,a5,0x2
   20704:	00e60733          	add	a4,a2,a4
   20708:	00072023          	sw	zero,0(a4)
   2070c:	fff78793          	addi	a5,a5,-1
   20710:	fed798e3          	bne	a5,a3,20700 <__multf3+0x109c>
   20714:	ffffc837          	lui	a6,0xffffc
   20718:	01180813          	addi	a6,a6,17 # ffffc011 <__BSS_END__+0xfffd85bd>
   2071c:	40a80833          	sub	a6,a6,a0
   20720:	8c0ff06f          	j	1f7e0 <__multf3+0x17c>
   20724:	017aeab3          	or	s5,s5,s7
   20728:	016aeab3          	or	s5,s5,s6
   2072c:	00aaeab3          	or	s5,s5,a0
   20730:	00200713          	li	a4,2
   20734:	000a9463          	bnez	s5,2073c <__multf3+0x10d8>
   20738:	8acff06f          	j	1f7e4 <__multf3+0x180>
   2073c:	00300713          	li	a4,3
   20740:	8a4ff06f          	j	1f7e4 <__multf3+0x180>
   20744:	00000813          	li	a6,0
   20748:	00100713          	li	a4,1
   2074c:	898ff06f          	j	1f7e4 <__multf3+0x180>
   20750:	00f697b3          	sll	a5,a3,a5
   20754:	5307f693          	andi	a3,a5,1328
   20758:	06069863          	bnez	a3,207c8 <__multf3+0x1164>
   2075c:	0887f693          	andi	a3,a5,136
   20760:	04069263          	bnez	a3,207a4 <__multf3+0x1140>
   20764:	2407f793          	andi	a5,a5,576
   20768:	00079463          	bnez	a5,20770 <__multf3+0x110c>
   2076c:	8b4ff06f          	j	1f820 <__multf3+0x1bc>
   20770:	000087b7          	lui	a5,0x8
   20774:	02f12623          	sw	a5,44(sp)
   20778:	02012423          	sw	zero,40(sp)
   2077c:	02012223          	sw	zero,36(sp)
   20780:	02012023          	sw	zero,32(sp)
   20784:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   20788:	00000893          	li	a7,0
   2078c:	cc5ff06f          	j	20450 <__multf3+0xdec>
   20790:	00f00693          	li	a3,15
   20794:	fcd78ee3          	beq	a5,a3,20770 <__multf3+0x110c>
   20798:	00b00693          	li	a3,11
   2079c:	000a0893          	mv	a7,s4
   207a0:	02d79463          	bne	a5,a3,207c8 <__multf3+0x1164>
   207a4:	00090893          	mv	a7,s2
   207a8:	01012783          	lw	a5,16(sp)
   207ac:	02f12023          	sw	a5,32(sp)
   207b0:	01412783          	lw	a5,20(sp)
   207b4:	02f12223          	sw	a5,36(sp)
   207b8:	01812783          	lw	a5,24(sp)
   207bc:	02f12423          	sw	a5,40(sp)
   207c0:	01c12783          	lw	a5,28(sp)
   207c4:	0240006f          	j	207e8 <__multf3+0x1184>
   207c8:	00012783          	lw	a5,0(sp)
   207cc:	00098713          	mv	a4,s3
   207d0:	02f12023          	sw	a5,32(sp)
   207d4:	00412783          	lw	a5,4(sp)
   207d8:	02f12223          	sw	a5,36(sp)
   207dc:	00812783          	lw	a5,8(sp)
   207e0:	02f12423          	sw	a5,40(sp)
   207e4:	00c12783          	lw	a5,12(sp)
   207e8:	02f12623          	sw	a5,44(sp)
   207ec:	00200793          	li	a5,2
   207f0:	20f70263          	beq	a4,a5,209f4 <__multf3+0x1390>
   207f4:	00300793          	li	a5,3
   207f8:	f6f70ce3          	beq	a4,a5,20770 <__multf3+0x110c>
   207fc:	00100793          	li	a5,1
   20800:	b8f718e3          	bne	a4,a5,20390 <__multf3+0xd2c>
   20804:	02012623          	sw	zero,44(sp)
   20808:	02012423          	sw	zero,40(sp)
   2080c:	02012223          	sw	zero,36(sp)
   20810:	02012023          	sw	zero,32(sp)
   20814:	1b40006f          	j	209c8 <__multf3+0x1364>
   20818:	00080d13          	mv	s10,a6
   2081c:	b75ff06f          	j	20390 <__multf3+0xd2c>
   20820:	00100713          	li	a4,1
   20824:	00078863          	beqz	a5,20834 <__multf3+0x11d0>
   20828:	40f70733          	sub	a4,a4,a5
   2082c:	07400793          	li	a5,116
   20830:	1ae7c063          	blt	a5,a4,209d0 <__multf3+0x136c>
   20834:	02010513          	addi	a0,sp,32
   20838:	40575693          	srai	a3,a4,0x5
   2083c:	00050593          	mv	a1,a0
   20840:	01f77713          	andi	a4,a4,31
   20844:	00000793          	li	a5,0
   20848:	00000613          	li	a2,0
   2084c:	02d61e63          	bne	a2,a3,20888 <__multf3+0x1224>
   20850:	00300593          	li	a1,3
   20854:	40d585b3          	sub	a1,a1,a3
   20858:	00269613          	slli	a2,a3,0x2
   2085c:	04071063          	bnez	a4,2089c <__multf3+0x1238>
   20860:	00050813          	mv	a6,a0
   20864:	00c80333          	add	t1,a6,a2
   20868:	00032303          	lw	t1,0(t1)
   2086c:	00170713          	addi	a4,a4,1
   20870:	00480813          	addi	a6,a6,4
   20874:	fe682e23          	sw	t1,-4(a6)
   20878:	fee5d6e3          	bge	a1,a4,20864 <__multf3+0x1200>
   2087c:	00400713          	li	a4,4
   20880:	40d706b3          	sub	a3,a4,a3
   20884:	0580006f          	j	208dc <__multf3+0x1278>
   20888:	0005a803          	lw	a6,0(a1)
   2088c:	00160613          	addi	a2,a2,1
   20890:	00458593          	addi	a1,a1,4
   20894:	0107e7b3          	or	a5,a5,a6
   20898:	fb5ff06f          	j	2084c <__multf3+0x11e8>
   2089c:	00c50633          	add	a2,a0,a2
   208a0:	00062803          	lw	a6,0(a2)
   208a4:	02000313          	li	t1,32
   208a8:	40e30333          	sub	t1,t1,a4
   208ac:	00681833          	sll	a6,a6,t1
   208b0:	0107e7b3          	or	a5,a5,a6
   208b4:	00050e93          	mv	t4,a0
   208b8:	00000e13          	li	t3,0
   208bc:	02be4463          	blt	t3,a1,208e4 <__multf3+0x1280>
   208c0:	00400613          	li	a2,4
   208c4:	40d606b3          	sub	a3,a2,a3
   208c8:	02c12603          	lw	a2,44(sp)
   208cc:	00259593          	slli	a1,a1,0x2
   208d0:	00b505b3          	add	a1,a0,a1
   208d4:	00e65733          	srl	a4,a2,a4
   208d8:	00e5a023          	sw	a4,0(a1)
   208dc:	00400613          	li	a2,4
   208e0:	03c0006f          	j	2091c <__multf3+0x12b8>
   208e4:	00062803          	lw	a6,0(a2)
   208e8:	00462f03          	lw	t5,4(a2)
   208ec:	00460613          	addi	a2,a2,4
   208f0:	00e85833          	srl	a6,a6,a4
   208f4:	006f1f33          	sll	t5,t5,t1
   208f8:	01e86833          	or	a6,a6,t5
   208fc:	010ea023          	sw	a6,0(t4)
   20900:	001e0e13          	addi	t3,t3,1
   20904:	004e8e93          	addi	t4,t4,4
   20908:	fb5ff06f          	j	208bc <__multf3+0x1258>
   2090c:	00269713          	slli	a4,a3,0x2
   20910:	00e50733          	add	a4,a0,a4
   20914:	00072023          	sw	zero,0(a4)
   20918:	00168693          	addi	a3,a3,1
   2091c:	fec698e3          	bne	a3,a2,2090c <__multf3+0x12a8>
   20920:	02012703          	lw	a4,32(sp)
   20924:	00f037b3          	snez	a5,a5
   20928:	00e7e7b3          	or	a5,a5,a4
   2092c:	02f12023          	sw	a5,32(sp)
   20930:	0077f713          	andi	a4,a5,7
   20934:	04070263          	beqz	a4,20978 <__multf3+0x1314>
   20938:	00f7f713          	andi	a4,a5,15
   2093c:	02d70e63          	beq	a4,a3,20978 <__multf3+0x1314>
   20940:	02412703          	lw	a4,36(sp)
   20944:	00478793          	addi	a5,a5,4
   20948:	02f12023          	sw	a5,32(sp)
   2094c:	0047b793          	sltiu	a5,a5,4
   20950:	00f707b3          	add	a5,a4,a5
   20954:	02f12223          	sw	a5,36(sp)
   20958:	00e7b7b3          	sltu	a5,a5,a4
   2095c:	02812703          	lw	a4,40(sp)
   20960:	00f707b3          	add	a5,a4,a5
   20964:	02f12423          	sw	a5,40(sp)
   20968:	00e7b7b3          	sltu	a5,a5,a4
   2096c:	02c12703          	lw	a4,44(sp)
   20970:	00e787b3          	add	a5,a5,a4
   20974:	02f12623          	sw	a5,44(sp)
   20978:	02c12703          	lw	a4,44(sp)
   2097c:	00c71793          	slli	a5,a4,0xc
   20980:	0007de63          	bgez	a5,2099c <__multf3+0x1338>
   20984:	02012623          	sw	zero,44(sp)
   20988:	02012423          	sw	zero,40(sp)
   2098c:	02012223          	sw	zero,36(sp)
   20990:	02012023          	sw	zero,32(sp)
   20994:	00100793          	li	a5,1
   20998:	ab9ff06f          	j	20450 <__multf3+0xdec>
   2099c:	00c50613          	addi	a2,a0,12
   209a0:	00052783          	lw	a5,0(a0)
   209a4:	00452683          	lw	a3,4(a0)
   209a8:	00450513          	addi	a0,a0,4
   209ac:	0037d793          	srli	a5,a5,0x3
   209b0:	01d69693          	slli	a3,a3,0x1d
   209b4:	00d7e7b3          	or	a5,a5,a3
   209b8:	fef52e23          	sw	a5,-4(a0)
   209bc:	fea612e3          	bne	a2,a0,209a0 <__multf3+0x133c>
   209c0:	00375713          	srli	a4,a4,0x3
   209c4:	02e12623          	sw	a4,44(sp)
   209c8:	00000793          	li	a5,0
   209cc:	a85ff06f          	j	20450 <__multf3+0xdec>
   209d0:	02412703          	lw	a4,36(sp)
   209d4:	02012783          	lw	a5,32(sp)
   209d8:	00e7e7b3          	or	a5,a5,a4
   209dc:	02812703          	lw	a4,40(sp)
   209e0:	00e7e7b3          	or	a5,a5,a4
   209e4:	02c12703          	lw	a4,44(sp)
   209e8:	00e7e7b3          	or	a5,a5,a4
   209ec:	fc078ee3          	beqz	a5,209c8 <__multf3+0x1364>
   209f0:	e15ff06f          	j	20804 <__multf3+0x11a0>
   209f4:	000087b7          	lui	a5,0x8
   209f8:	02012623          	sw	zero,44(sp)
   209fc:	02012423          	sw	zero,40(sp)
   20a00:	02012223          	sw	zero,36(sp)
   20a04:	02012023          	sw	zero,32(sp)
   20a08:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   20a0c:	a45ff06f          	j	20450 <__multf3+0xdec>

00020a10 <__subtf3>:
   20a10:	fa010113          	addi	sp,sp,-96
   20a14:	0085a783          	lw	a5,8(a1)
   20a18:	04912a23          	sw	s1,84(sp)
   20a1c:	00050493          	mv	s1,a0
   20a20:	00c5a503          	lw	a0,12(a1)
   20a24:	0005a703          	lw	a4,0(a1)
   20a28:	0045a303          	lw	t1,4(a1)
   20a2c:	02f12c23          	sw	a5,56(sp)
   20a30:	00f12c23          	sw	a5,24(sp)
   20a34:	00062683          	lw	a3,0(a2)
   20a38:	01051793          	slli	a5,a0,0x10
   20a3c:	00462883          	lw	a7,4(a2)
   20a40:	00862583          	lw	a1,8(a2)
   20a44:	00c62803          	lw	a6,12(a2)
   20a48:	04812c23          	sw	s0,88(sp)
   20a4c:	02a12e23          	sw	a0,60(sp)
   20a50:	00151413          	slli	s0,a0,0x1
   20a54:	0107d793          	srli	a5,a5,0x10
   20a58:	01f55513          	srli	a0,a0,0x1f
   20a5c:	05212823          	sw	s2,80(sp)
   20a60:	04112e23          	sw	ra,92(sp)
   20a64:	05312623          	sw	s3,76(sp)
   20a68:	05412423          	sw	s4,72(sp)
   20a6c:	05512223          	sw	s5,68(sp)
   20a70:	02e12823          	sw	a4,48(sp)
   20a74:	02612a23          	sw	t1,52(sp)
   20a78:	00e12823          	sw	a4,16(sp)
   20a7c:	00612a23          	sw	t1,20(sp)
   20a80:	00f12e23          	sw	a5,28(sp)
   20a84:	01145413          	srli	s0,s0,0x11
   20a88:	00050913          	mv	s2,a0
   20a8c:	01010293          	addi	t0,sp,16
   20a90:	01c10e13          	addi	t3,sp,28
   20a94:	000e2783          	lw	a5,0(t3)
   20a98:	ffce2603          	lw	a2,-4(t3)
   20a9c:	ffce0e13          	addi	t3,t3,-4
   20aa0:	00379793          	slli	a5,a5,0x3
   20aa4:	01d65613          	srli	a2,a2,0x1d
   20aa8:	00c7e7b3          	or	a5,a5,a2
   20aac:	00fe2223          	sw	a5,4(t3)
   20ab0:	ffc292e3          	bne	t0,t3,20a94 <__subtf3+0x84>
   20ab4:	01081793          	slli	a5,a6,0x10
   20ab8:	00181313          	slli	t1,a6,0x1
   20abc:	00371713          	slli	a4,a4,0x3
   20ac0:	0107d793          	srli	a5,a5,0x10
   20ac4:	03012e23          	sw	a6,60(sp)
   20ac8:	00e12823          	sw	a4,16(sp)
   20acc:	02d12823          	sw	a3,48(sp)
   20ad0:	03112a23          	sw	a7,52(sp)
   20ad4:	02b12c23          	sw	a1,56(sp)
   20ad8:	02d12023          	sw	a3,32(sp)
   20adc:	03112223          	sw	a7,36(sp)
   20ae0:	02b12423          	sw	a1,40(sp)
   20ae4:	02f12623          	sw	a5,44(sp)
   20ae8:	01135313          	srli	t1,t1,0x11
   20aec:	01f85813          	srli	a6,a6,0x1f
   20af0:	02010e93          	addi	t4,sp,32
   20af4:	02c10f13          	addi	t5,sp,44
   20af8:	000f2783          	lw	a5,0(t5)
   20afc:	ffcf2603          	lw	a2,-4(t5)
   20b00:	ffcf0f13          	addi	t5,t5,-4
   20b04:	00379793          	slli	a5,a5,0x3
   20b08:	01d65613          	srli	a2,a2,0x1d
   20b0c:	00c7e7b3          	or	a5,a5,a2
   20b10:	00ff2223          	sw	a5,4(t5)
   20b14:	ffee92e3          	bne	t4,t5,20af8 <__subtf3+0xe8>
   20b18:	00369693          	slli	a3,a3,0x3
   20b1c:	000087b7          	lui	a5,0x8
   20b20:	02d12023          	sw	a3,32(sp)
   20b24:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   20b28:	02f31063          	bne	t1,a5,20b48 <__subtf3+0x138>
   20b2c:	02812603          	lw	a2,40(sp)
   20b30:	02412783          	lw	a5,36(sp)
   20b34:	00c7e7b3          	or	a5,a5,a2
   20b38:	02c12603          	lw	a2,44(sp)
   20b3c:	00c7e7b3          	or	a5,a5,a2
   20b40:	00d7e7b3          	or	a5,a5,a3
   20b44:	00079463          	bnez	a5,20b4c <__subtf3+0x13c>
   20b48:	00184813          	xori	a6,a6,1
   20b4c:	406403b3          	sub	t2,s0,t1
   20b50:	04a814e3          	bne	a6,a0,21398 <__subtf3+0x988>
   20b54:	38705263          	blez	t2,20ed8 <__subtf3+0x4c8>
   20b58:	01412783          	lw	a5,20(sp)
   20b5c:	01812603          	lw	a2,24(sp)
   20b60:	01c12883          	lw	a7,28(sp)
   20b64:	0a031263          	bnez	t1,20c08 <__subtf3+0x1f8>
   20b68:	02412503          	lw	a0,36(sp)
   20b6c:	02812803          	lw	a6,40(sp)
   20b70:	02c12303          	lw	t1,44(sp)
   20b74:	010565b3          	or	a1,a0,a6
   20b78:	0065e5b3          	or	a1,a1,t1
   20b7c:	00d5e5b3          	or	a1,a1,a3
   20b80:	00059e63          	bnez	a1,20b9c <__subtf3+0x18c>
   20b84:	02e12823          	sw	a4,48(sp)
   20b88:	02f12a23          	sw	a5,52(sp)
   20b8c:	02c12c23          	sw	a2,56(sp)
   20b90:	03112e23          	sw	a7,60(sp)
   20b94:	00038413          	mv	s0,t2
   20b98:	08c0006f          	j	20c24 <__subtf3+0x214>
   20b9c:	fff38593          	addi	a1,t2,-1
   20ba0:	04059863          	bnez	a1,20bf0 <__subtf3+0x1e0>
   20ba4:	00d705b3          	add	a1,a4,a3
   20ba8:	00f507b3          	add	a5,a0,a5
   20bac:	00e5b733          	sltu	a4,a1,a4
   20bb0:	00e78733          	add	a4,a5,a4
   20bb4:	00a7b533          	sltu	a0,a5,a0
   20bb8:	02e12a23          	sw	a4,52(sp)
   20bbc:	00f73733          	sltu	a4,a4,a5
   20bc0:	00c80633          	add	a2,a6,a2
   20bc4:	00e56533          	or	a0,a0,a4
   20bc8:	00a60533          	add	a0,a2,a0
   20bcc:	02a12c23          	sw	a0,56(sp)
   20bd0:	010637b3          	sltu	a5,a2,a6
   20bd4:	00c53533          	sltu	a0,a0,a2
   20bd8:	00a7e7b3          	or	a5,a5,a0
   20bdc:	01130333          	add	t1,t1,a7
   20be0:	02b12823          	sw	a1,48(sp)
   20be4:	006787b3          	add	a5,a5,t1
   20be8:	00100413          	li	s0,1
   20bec:	2dc0006f          	j	20ec8 <__subtf3+0x4b8>
   20bf0:	000086b7          	lui	a3,0x8
   20bf4:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   20bf8:	00d38463          	beq	t2,a3,20c00 <__subtf3+0x1f0>
   20bfc:	1ac0106f          	j	21da8 <__subtf3+0x1398>
   20c00:	02e12823          	sw	a4,48(sp)
   20c04:	3800006f          	j	20f84 <__subtf3+0x574>
   20c08:	000086b7          	lui	a3,0x8
   20c0c:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   20c10:	14d41e63          	bne	s0,a3,20d6c <__subtf3+0x35c>
   20c14:	02e12823          	sw	a4,48(sp)
   20c18:	02f12a23          	sw	a5,52(sp)
   20c1c:	02c12c23          	sw	a2,56(sp)
   20c20:	03112e23          	sw	a7,60(sp)
   20c24:	03012783          	lw	a5,48(sp)
   20c28:	0077f713          	andi	a4,a5,7
   20c2c:	04070463          	beqz	a4,20c74 <__subtf3+0x264>
   20c30:	00f7f713          	andi	a4,a5,15
   20c34:	00400693          	li	a3,4
   20c38:	02d70e63          	beq	a4,a3,20c74 <__subtf3+0x264>
   20c3c:	03412703          	lw	a4,52(sp)
   20c40:	00d787b3          	add	a5,a5,a3
   20c44:	02f12823          	sw	a5,48(sp)
   20c48:	0047b793          	sltiu	a5,a5,4
   20c4c:	00f707b3          	add	a5,a4,a5
   20c50:	02f12a23          	sw	a5,52(sp)
   20c54:	00e7b7b3          	sltu	a5,a5,a4
   20c58:	03812703          	lw	a4,56(sp)
   20c5c:	00f707b3          	add	a5,a4,a5
   20c60:	02f12c23          	sw	a5,56(sp)
   20c64:	00e7b7b3          	sltu	a5,a5,a4
   20c68:	03c12703          	lw	a4,60(sp)
   20c6c:	00e787b3          	add	a5,a5,a4
   20c70:	02f12e23          	sw	a5,60(sp)
   20c74:	03c12783          	lw	a5,60(sp)
   20c78:	00c79713          	slli	a4,a5,0xc
   20c7c:	02075463          	bgez	a4,20ca4 <__subtf3+0x294>
   20c80:	00008737          	lui	a4,0x8
   20c84:	00140413          	addi	s0,s0,1
   20c88:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   20c8c:	00e41463          	bne	s0,a4,20c94 <__subtf3+0x284>
   20c90:	1000106f          	j	21d90 <__subtf3+0x1380>
   20c94:	fff80737          	lui	a4,0xfff80
   20c98:	fff70713          	addi	a4,a4,-1 # fff7ffff <__BSS_END__+0xfff5c5ab>
   20c9c:	00e7f7b3          	and	a5,a5,a4
   20ca0:	02f12e23          	sw	a5,60(sp)
   20ca4:	03010713          	addi	a4,sp,48
   20ca8:	03c10593          	addi	a1,sp,60
   20cac:	00072683          	lw	a3,0(a4)
   20cb0:	00472603          	lw	a2,4(a4)
   20cb4:	00470713          	addi	a4,a4,4
   20cb8:	0036d693          	srli	a3,a3,0x3
   20cbc:	01d61613          	slli	a2,a2,0x1d
   20cc0:	00c6e6b3          	or	a3,a3,a2
   20cc4:	fed72e23          	sw	a3,-4(a4)
   20cc8:	fee592e3          	bne	a1,a4,20cac <__subtf3+0x29c>
   20ccc:	000086b7          	lui	a3,0x8
   20cd0:	fff68713          	addi	a4,a3,-1 # 7fff <exit-0x80b5>
   20cd4:	0037d793          	srli	a5,a5,0x3
   20cd8:	02e41a63          	bne	s0,a4,20d0c <__subtf3+0x2fc>
   20cdc:	03412603          	lw	a2,52(sp)
   20ce0:	03012703          	lw	a4,48(sp)
   20ce4:	00c76733          	or	a4,a4,a2
   20ce8:	03812603          	lw	a2,56(sp)
   20cec:	00c76733          	or	a4,a4,a2
   20cf0:	00e7e7b3          	or	a5,a5,a4
   20cf4:	00078c63          	beqz	a5,20d0c <__subtf3+0x2fc>
   20cf8:	02012c23          	sw	zero,56(sp)
   20cfc:	02012a23          	sw	zero,52(sp)
   20d00:	02012823          	sw	zero,48(sp)
   20d04:	00068793          	mv	a5,a3
   20d08:	00000913          	li	s2,0
   20d0c:	00f11623          	sh	a5,12(sp)
   20d10:	03012783          	lw	a5,48(sp)
   20d14:	01141413          	slli	s0,s0,0x11
   20d18:	01145413          	srli	s0,s0,0x11
   20d1c:	00f4a023          	sw	a5,0(s1)
   20d20:	03412783          	lw	a5,52(sp)
   20d24:	00f91913          	slli	s2,s2,0xf
   20d28:	00896933          	or	s2,s2,s0
   20d2c:	00f4a223          	sw	a5,4(s1)
   20d30:	03812783          	lw	a5,56(sp)
   20d34:	01211723          	sh	s2,14(sp)
   20d38:	05c12083          	lw	ra,92(sp)
   20d3c:	00f4a423          	sw	a5,8(s1)
   20d40:	00c12783          	lw	a5,12(sp)
   20d44:	05812403          	lw	s0,88(sp)
   20d48:	05012903          	lw	s2,80(sp)
   20d4c:	00f4a623          	sw	a5,12(s1)
   20d50:	04c12983          	lw	s3,76(sp)
   20d54:	04812a03          	lw	s4,72(sp)
   20d58:	04412a83          	lw	s5,68(sp)
   20d5c:	00048513          	mv	a0,s1
   20d60:	05412483          	lw	s1,84(sp)
   20d64:	06010113          	addi	sp,sp,96
   20d68:	00008067          	ret
   20d6c:	02c12683          	lw	a3,44(sp)
   20d70:	000805b7          	lui	a1,0x80
   20d74:	00b6e6b3          	or	a3,a3,a1
   20d78:	02d12623          	sw	a3,44(sp)
   20d7c:	07400693          	li	a3,116
   20d80:	0076d463          	bge	a3,t2,20d88 <__subtf3+0x378>
   20d84:	0300106f          	j	21db4 <__subtf3+0x13a4>
   20d88:	00038593          	mv	a1,t2
   20d8c:	4055d513          	srai	a0,a1,0x5
   20d90:	01f5f693          	andi	a3,a1,31
   20d94:	000f0313          	mv	t1,t5
   20d98:	00000593          	li	a1,0
   20d9c:	00000813          	li	a6,0
   20da0:	02a81c63          	bne	a6,a0,20dd8 <__subtf3+0x3c8>
   20da4:	00300313          	li	t1,3
   20da8:	40a30333          	sub	t1,t1,a0
   20dac:	00251813          	slli	a6,a0,0x2
   20db0:	02069e63          	bnez	a3,20dec <__subtf3+0x3dc>
   20db4:	010f0e33          	add	t3,t5,a6
   20db8:	000e2e03          	lw	t3,0(t3)
   20dbc:	00168693          	addi	a3,a3,1
   20dc0:	004f0f13          	addi	t5,t5,4
   20dc4:	ffcf2e23          	sw	t3,-4(t5)
   20dc8:	fed356e3          	bge	t1,a3,20db4 <__subtf3+0x3a4>
   20dcc:	00400693          	li	a3,4
   20dd0:	40a68533          	sub	a0,a3,a0
   20dd4:	0540006f          	j	20e28 <__subtf3+0x418>
   20dd8:	00032e03          	lw	t3,0(t1)
   20ddc:	00180813          	addi	a6,a6,1
   20de0:	00430313          	addi	t1,t1,4
   20de4:	01c5e5b3          	or	a1,a1,t3
   20de8:	fb9ff06f          	j	20da0 <__subtf3+0x390>
   20dec:	010e8833          	add	a6,t4,a6
   20df0:	00082e03          	lw	t3,0(a6)
   20df4:	02000f93          	li	t6,32
   20df8:	40df8fb3          	sub	t6,t6,a3
   20dfc:	01fe1e33          	sll	t3,t3,t6
   20e00:	01c5e5b3          	or	a1,a1,t3
   20e04:	00000293          	li	t0,0
   20e08:	0262c463          	blt	t0,t1,20e30 <__subtf3+0x420>
   20e0c:	00400813          	li	a6,4
   20e10:	40a80533          	sub	a0,a6,a0
   20e14:	02c12803          	lw	a6,44(sp)
   20e18:	00231313          	slli	t1,t1,0x2
   20e1c:	006e8333          	add	t1,t4,t1
   20e20:	00d856b3          	srl	a3,a6,a3
   20e24:	00d32023          	sw	a3,0(t1)
   20e28:	00400813          	li	a6,4
   20e2c:	03c0006f          	j	20e68 <__subtf3+0x458>
   20e30:	00082e03          	lw	t3,0(a6)
   20e34:	00482383          	lw	t2,4(a6)
   20e38:	00480813          	addi	a6,a6,4
   20e3c:	00de5e33          	srl	t3,t3,a3
   20e40:	01f393b3          	sll	t2,t2,t6
   20e44:	007e6e33          	or	t3,t3,t2
   20e48:	01cf2023          	sw	t3,0(t5)
   20e4c:	00128293          	addi	t0,t0,1 # 10c11 <memset+0xb5>
   20e50:	004f0f13          	addi	t5,t5,4
   20e54:	fb5ff06f          	j	20e08 <__subtf3+0x3f8>
   20e58:	00251693          	slli	a3,a0,0x2
   20e5c:	00de86b3          	add	a3,t4,a3
   20e60:	0006a023          	sw	zero,0(a3)
   20e64:	00150513          	addi	a0,a0,1
   20e68:	ff0518e3          	bne	a0,a6,20e58 <__subtf3+0x448>
   20e6c:	02012683          	lw	a3,32(sp)
   20e70:	00b035b3          	snez	a1,a1
   20e74:	00d5e5b3          	or	a1,a1,a3
   20e78:	02412503          	lw	a0,36(sp)
   20e7c:	00b705b3          	add	a1,a4,a1
   20e80:	02812683          	lw	a3,40(sp)
   20e84:	00f507b3          	add	a5,a0,a5
   20e88:	00e5b733          	sltu	a4,a1,a4
   20e8c:	00e78833          	add	a6,a5,a4
   20e90:	03012a23          	sw	a6,52(sp)
   20e94:	00a7b733          	sltu	a4,a5,a0
   20e98:	00f83833          	sltu	a6,a6,a5
   20e9c:	00c68633          	add	a2,a3,a2
   20ea0:	01076733          	or	a4,a4,a6
   20ea4:	00e60733          	add	a4,a2,a4
   20ea8:	02e12c23          	sw	a4,56(sp)
   20eac:	00d637b3          	sltu	a5,a2,a3
   20eb0:	00c73733          	sltu	a4,a4,a2
   20eb4:	00e7e7b3          	or	a5,a5,a4
   20eb8:	02c12703          	lw	a4,44(sp)
   20ebc:	02b12823          	sw	a1,48(sp)
   20ec0:	00e88733          	add	a4,a7,a4
   20ec4:	00e787b3          	add	a5,a5,a4
   20ec8:	00c79713          	slli	a4,a5,0xc
   20ecc:	44074a63          	bltz	a4,21320 <__subtf3+0x910>
   20ed0:	02f12e23          	sw	a5,60(sp)
   20ed4:	d51ff06f          	j	20c24 <__subtf3+0x214>
   20ed8:	02412783          	lw	a5,36(sp)
   20edc:	02812603          	lw	a2,40(sp)
   20ee0:	02c12883          	lw	a7,44(sp)
   20ee4:	26038063          	beqz	t2,21144 <__subtf3+0x734>
   20ee8:	408305b3          	sub	a1,t1,s0
   20eec:	0a041863          	bnez	s0,20f9c <__subtf3+0x58c>
   20ef0:	01412503          	lw	a0,20(sp)
   20ef4:	01812803          	lw	a6,24(sp)
   20ef8:	01c12f03          	lw	t5,28(sp)
   20efc:	01056eb3          	or	t4,a0,a6
   20f00:	01eeeeb3          	or	t4,t4,t5
   20f04:	00eeeeb3          	or	t4,t4,a4
   20f08:	000e9e63          	bnez	t4,20f24 <__subtf3+0x514>
   20f0c:	02d12823          	sw	a3,48(sp)
   20f10:	02f12a23          	sw	a5,52(sp)
   20f14:	02c12c23          	sw	a2,56(sp)
   20f18:	03112e23          	sw	a7,60(sp)
   20f1c:	00058413          	mv	s0,a1
   20f20:	d05ff06f          	j	20c24 <__subtf3+0x214>
   20f24:	fff58e93          	addi	t4,a1,-1 # 7ffff <__BSS_END__+0x5c5ab>
   20f28:	040e9663          	bnez	t4,20f74 <__subtf3+0x564>
   20f2c:	00d705b3          	add	a1,a4,a3
   20f30:	00f507b3          	add	a5,a0,a5
   20f34:	00e5b733          	sltu	a4,a1,a4
   20f38:	00e78733          	add	a4,a5,a4
   20f3c:	00a7b533          	sltu	a0,a5,a0
   20f40:	02e12a23          	sw	a4,52(sp)
   20f44:	00f73733          	sltu	a4,a4,a5
   20f48:	00c80633          	add	a2,a6,a2
   20f4c:	00e56533          	or	a0,a0,a4
   20f50:	00a60533          	add	a0,a2,a0
   20f54:	02a12c23          	sw	a0,56(sp)
   20f58:	010637b3          	sltu	a5,a2,a6
   20f5c:	00c53533          	sltu	a0,a0,a2
   20f60:	00a7e7b3          	or	a5,a5,a0
   20f64:	011f0f33          	add	t5,t5,a7
   20f68:	02b12823          	sw	a1,48(sp)
   20f6c:	01e787b3          	add	a5,a5,t5
   20f70:	c79ff06f          	j	20be8 <__subtf3+0x1d8>
   20f74:	00008737          	lui	a4,0x8
   20f78:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   20f7c:	64e596e3          	bne	a1,a4,21dc8 <__subtf3+0x13b8>
   20f80:	02d12823          	sw	a3,48(sp)
   20f84:	02f12a23          	sw	a5,52(sp)
   20f88:	02c12c23          	sw	a2,56(sp)
   20f8c:	03112e23          	sw	a7,60(sp)
   20f90:	28c0006f          	j	2121c <__subtf3+0x80c>
   20f94:	00070693          	mv	a3,a4
   20f98:	fe9ff06f          	j	20f80 <__subtf3+0x570>
   20f9c:	00008737          	lui	a4,0x8
   20fa0:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   20fa4:	fce30ee3          	beq	t1,a4,20f80 <__subtf3+0x570>
   20fa8:	01c12703          	lw	a4,28(sp)
   20fac:	00080537          	lui	a0,0x80
   20fb0:	00a76733          	or	a4,a4,a0
   20fb4:	00e12e23          	sw	a4,28(sp)
   20fb8:	07400713          	li	a4,116
   20fbc:	60b74ae3          	blt	a4,a1,21dd0 <__subtf3+0x13c0>
   20fc0:	00058e93          	mv	t4,a1
   20fc4:	41fed713          	srai	a4,t4,0x1f
   20fc8:	01f77713          	andi	a4,a4,31
   20fcc:	01d70733          	add	a4,a4,t4
   20fd0:	40575713          	srai	a4,a4,0x5
   20fd4:	000e0813          	mv	a6,t3
   20fd8:	00000593          	li	a1,0
   20fdc:	00000513          	li	a0,0
   20fe0:	02e54e63          	blt	a0,a4,2101c <__subtf3+0x60c>
   20fe4:	00300513          	li	a0,3
   20fe8:	01feff13          	andi	t5,t4,31
   20fec:	40e50fb3          	sub	t6,a0,a4
   20ff0:	00271813          	slli	a6,a4,0x2
   20ff4:	020f1e63          	bnez	t5,21030 <__subtf3+0x620>
   20ff8:	010e0533          	add	a0,t3,a6
   20ffc:	00052503          	lw	a0,0(a0) # 80000 <__BSS_END__+0x5c5ac>
   21000:	001f0f13          	addi	t5,t5,1
   21004:	004e0e13          	addi	t3,t3,4
   21008:	feae2e23          	sw	a0,-4(t3)
   2100c:	ffefd6e3          	bge	t6,t5,20ff8 <__subtf3+0x5e8>
   21010:	00400513          	li	a0,4
   21014:	40e50733          	sub	a4,a0,a4
   21018:	0880006f          	j	210a0 <__subtf3+0x690>
   2101c:	00082f03          	lw	t5,0(a6)
   21020:	00150513          	addi	a0,a0,1
   21024:	00480813          	addi	a6,a6,4
   21028:	01e5e5b3          	or	a1,a1,t5
   2102c:	fb5ff06f          	j	20fe0 <__subtf3+0x5d0>
   21030:	80000537          	lui	a0,0x80000
   21034:	01f50513          	addi	a0,a0,31 # 8000001f <__BSS_END__+0x7ffdc5cb>
   21038:	00aef533          	and	a0,t4,a0
   2103c:	00055863          	bgez	a0,2104c <__subtf3+0x63c>
   21040:	fff50513          	addi	a0,a0,-1
   21044:	fe056513          	ori	a0,a0,-32
   21048:	00150513          	addi	a0,a0,1
   2104c:	02000393          	li	t2,32
   21050:	40a383b3          	sub	t2,t2,a0
   21054:	fff74513          	not	a0,a4
   21058:	41f55513          	srai	a0,a0,0x1f
   2105c:	00a77533          	and	a0,a4,a0
   21060:	00251513          	slli	a0,a0,0x2
   21064:	00a28533          	add	a0,t0,a0
   21068:	00052503          	lw	a0,0(a0)
   2106c:	01028833          	add	a6,t0,a6
   21070:	00751533          	sll	a0,a0,t2
   21074:	00a5e5b3          	or	a1,a1,a0
   21078:	00000513          	li	a0,0
   2107c:	00480813          	addi	a6,a6,4
   21080:	03f54463          	blt	a0,t6,210a8 <__subtf3+0x698>
   21084:	01c12803          	lw	a6,28(sp)
   21088:	00400513          	li	a0,4
   2108c:	40e50733          	sub	a4,a0,a4
   21090:	002f9513          	slli	a0,t6,0x2
   21094:	00a28533          	add	a0,t0,a0
   21098:	01e85833          	srl	a6,a6,t5
   2109c:	01052023          	sw	a6,0(a0)
   210a0:	00300813          	li	a6,3
   210a4:	0380006f          	j	210dc <__subtf3+0x6cc>
   210a8:	ffc82e83          	lw	t4,-4(a6)
   210ac:	00082403          	lw	s0,0(a6)
   210b0:	00150513          	addi	a0,a0,1
   210b4:	01eedeb3          	srl	t4,t4,t5
   210b8:	00741433          	sll	s0,s0,t2
   210bc:	008eeeb3          	or	t4,t4,s0
   210c0:	01de2023          	sw	t4,0(t3)
   210c4:	004e0e13          	addi	t3,t3,4
   210c8:	fb5ff06f          	j	2107c <__subtf3+0x66c>
   210cc:	00271513          	slli	a0,a4,0x2
   210d0:	00a28533          	add	a0,t0,a0
   210d4:	00052023          	sw	zero,0(a0)
   210d8:	00170713          	addi	a4,a4,1
   210dc:	fee858e3          	bge	a6,a4,210cc <__subtf3+0x6bc>
   210e0:	01012703          	lw	a4,16(sp)
   210e4:	00b035b3          	snez	a1,a1
   210e8:	00e5e5b3          	or	a1,a1,a4
   210ec:	01412503          	lw	a0,20(sp)
   210f0:	01812703          	lw	a4,24(sp)
   210f4:	00b685b3          	add	a1,a3,a1
   210f8:	00f507b3          	add	a5,a0,a5
   210fc:	00d5b6b3          	sltu	a3,a1,a3
   21100:	00d78833          	add	a6,a5,a3
   21104:	00c70633          	add	a2,a4,a2
   21108:	00a7b6b3          	sltu	a3,a5,a0
   2110c:	03012a23          	sw	a6,52(sp)
   21110:	00f83833          	sltu	a6,a6,a5
   21114:	0106e6b3          	or	a3,a3,a6
   21118:	00e637b3          	sltu	a5,a2,a4
   2111c:	01c12703          	lw	a4,28(sp)
   21120:	00d606b3          	add	a3,a2,a3
   21124:	02d12c23          	sw	a3,56(sp)
   21128:	00c6b6b3          	sltu	a3,a3,a2
   2112c:	00d7e7b3          	or	a5,a5,a3
   21130:	00e88733          	add	a4,a7,a4
   21134:	02b12823          	sw	a1,48(sp)
   21138:	00e787b3          	add	a5,a5,a4
   2113c:	00030413          	mv	s0,t1
   21140:	d89ff06f          	j	20ec8 <__subtf3+0x4b8>
   21144:	00140e93          	addi	t4,s0,1
   21148:	011e9f13          	slli	t5,t4,0x11
   2114c:	012f5f13          	srli	t5,t5,0x12
   21150:	01412583          	lw	a1,20(sp)
   21154:	01812503          	lw	a0,24(sp)
   21158:	01c12803          	lw	a6,28(sp)
   2115c:	03010313          	addi	t1,sp,48
   21160:	03c10e13          	addi	t3,sp,60
   21164:	120f1063          	bnez	t5,21284 <__subtf3+0x874>
   21168:	00a5eeb3          	or	t4,a1,a0
   2116c:	010eeeb3          	or	t4,t4,a6
   21170:	00eeeeb3          	or	t4,t4,a4
   21174:	08041263          	bnez	s0,211f8 <__subtf3+0x7e8>
   21178:	780e8063          	beqz	t4,218f8 <__subtf3+0xee8>
   2117c:	00c7e333          	or	t1,a5,a2
   21180:	01136333          	or	t1,t1,a7
   21184:	00d36333          	or	t1,t1,a3
   21188:	76030c63          	beqz	t1,21900 <__subtf3+0xef0>
   2118c:	00d706b3          	add	a3,a4,a3
   21190:	00f587b3          	add	a5,a1,a5
   21194:	02d12823          	sw	a3,48(sp)
   21198:	00e6b6b3          	sltu	a3,a3,a4
   2119c:	00d786b3          	add	a3,a5,a3
   211a0:	00b7b5b3          	sltu	a1,a5,a1
   211a4:	02d12a23          	sw	a3,52(sp)
   211a8:	00f6b6b3          	sltu	a3,a3,a5
   211ac:	00c50633          	add	a2,a0,a2
   211b0:	00d5e5b3          	or	a1,a1,a3
   211b4:	00b605b3          	add	a1,a2,a1
   211b8:	02b12c23          	sw	a1,56(sp)
   211bc:	00a63533          	sltu	a0,a2,a0
   211c0:	00c5b5b3          	sltu	a1,a1,a2
   211c4:	00b56533          	or	a0,a0,a1
   211c8:	01180833          	add	a6,a6,a7
   211cc:	01050533          	add	a0,a0,a6
   211d0:	00c51793          	slli	a5,a0,0xc
   211d4:	0007c663          	bltz	a5,211e0 <__subtf3+0x7d0>
   211d8:	02a12e23          	sw	a0,60(sp)
   211dc:	a49ff06f          	j	20c24 <__subtf3+0x214>
   211e0:	fff807b7          	lui	a5,0xfff80
   211e4:	fff78793          	addi	a5,a5,-1 # fff7ffff <__BSS_END__+0xfff5c5ab>
   211e8:	00f57533          	and	a0,a0,a5
   211ec:	02a12e23          	sw	a0,60(sp)
   211f0:	00100413          	li	s0,1
   211f4:	a31ff06f          	j	20c24 <__subtf3+0x214>
   211f8:	020e8863          	beqz	t4,21228 <__subtf3+0x818>
   211fc:	00c7e7b3          	or	a5,a5,a2
   21200:	0117e7b3          	or	a5,a5,a7
   21204:	00d7e7b3          	or	a5,a5,a3
   21208:	02079a63          	bnez	a5,2123c <__subtf3+0x82c>
   2120c:	02e12823          	sw	a4,48(sp)
   21210:	02b12a23          	sw	a1,52(sp)
   21214:	02a12c23          	sw	a0,56(sp)
   21218:	03012e23          	sw	a6,60(sp)
   2121c:	00008437          	lui	s0,0x8
   21220:	fff40413          	addi	s0,s0,-1 # 7fff <exit-0x80b5>
   21224:	a01ff06f          	j	20c24 <__subtf3+0x214>
   21228:	00068713          	mv	a4,a3
   2122c:	00078593          	mv	a1,a5
   21230:	00060513          	mv	a0,a2
   21234:	00088813          	mv	a6,a7
   21238:	fd5ff06f          	j	2120c <__subtf3+0x7fc>
   2123c:	000087b7          	lui	a5,0x8
   21240:	02f12e23          	sw	a5,60(sp)
   21244:	02012c23          	sw	zero,56(sp)
   21248:	02012a23          	sw	zero,52(sp)
   2124c:	02012823          	sw	zero,48(sp)
   21250:	000e0793          	mv	a5,t3
   21254:	0007a703          	lw	a4,0(a5) # 8000 <exit-0x80b4>
   21258:	ffc7a683          	lw	a3,-4(a5)
   2125c:	ffc78793          	addi	a5,a5,-4
   21260:	00371713          	slli	a4,a4,0x3
   21264:	01d6d693          	srli	a3,a3,0x1d
   21268:	00d76733          	or	a4,a4,a3
   2126c:	00e7a223          	sw	a4,4(a5)
   21270:	fef312e3          	bne	t1,a5,21254 <__subtf3+0x844>
   21274:	00008437          	lui	s0,0x8
   21278:	fff40413          	addi	s0,s0,-1 # 7fff <exit-0x80b5>
   2127c:	00000913          	li	s2,0
   21280:	9a5ff06f          	j	20c24 <__subtf3+0x214>
   21284:	00d706b3          	add	a3,a4,a3
   21288:	00f587b3          	add	a5,a1,a5
   2128c:	02d12823          	sw	a3,48(sp)
   21290:	00e6b6b3          	sltu	a3,a3,a4
   21294:	00d786b3          	add	a3,a5,a3
   21298:	00b7b5b3          	sltu	a1,a5,a1
   2129c:	02d12a23          	sw	a3,52(sp)
   212a0:	00f6b6b3          	sltu	a3,a3,a5
   212a4:	00c50633          	add	a2,a0,a2
   212a8:	00d5e5b3          	or	a1,a1,a3
   212ac:	00b605b3          	add	a1,a2,a1
   212b0:	02b12c23          	sw	a1,56(sp)
   212b4:	00a63533          	sltu	a0,a2,a0
   212b8:	00c5b5b3          	sltu	a1,a1,a2
   212bc:	00b56533          	or	a0,a0,a1
   212c0:	01180833          	add	a6,a6,a7
   212c4:	01050533          	add	a0,a0,a6
   212c8:	02a12e23          	sw	a0,60(sp)
   212cc:	00030793          	mv	a5,t1
   212d0:	0007a703          	lw	a4,0(a5)
   212d4:	0047a683          	lw	a3,4(a5)
   212d8:	00478793          	addi	a5,a5,4
   212dc:	00175713          	srli	a4,a4,0x1
   212e0:	01f69693          	slli	a3,a3,0x1f
   212e4:	00d76733          	or	a4,a4,a3
   212e8:	fee7ae23          	sw	a4,-4(a5)
   212ec:	fefe12e3          	bne	t3,a5,212d0 <__subtf3+0x8c0>
   212f0:	000087b7          	lui	a5,0x8
   212f4:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   212f8:	00fe8a63          	beq	t4,a5,2130c <__subtf3+0x8fc>
   212fc:	00155513          	srli	a0,a0,0x1
   21300:	02a12e23          	sw	a0,60(sp)
   21304:	000e8413          	mv	s0,t4
   21308:	91dff06f          	j	20c24 <__subtf3+0x214>
   2130c:	02012e23          	sw	zero,60(sp)
   21310:	02012c23          	sw	zero,56(sp)
   21314:	02012a23          	sw	zero,52(sp)
   21318:	02012823          	sw	zero,48(sp)
   2131c:	f01ff06f          	j	2121c <__subtf3+0x80c>
   21320:	fff80737          	lui	a4,0xfff80
   21324:	fff70713          	addi	a4,a4,-1 # fff7ffff <__BSS_END__+0xfff5c5ab>
   21328:	00e7f7b3          	and	a5,a5,a4
   2132c:	02f12e23          	sw	a5,60(sp)
   21330:	00140413          	addi	s0,s0,1
   21334:	01f59593          	slli	a1,a1,0x1f
   21338:	03010713          	addi	a4,sp,48
   2133c:	03c10513          	addi	a0,sp,60
   21340:	00072683          	lw	a3,0(a4)
   21344:	00472603          	lw	a2,4(a4)
   21348:	00470713          	addi	a4,a4,4
   2134c:	0016d693          	srli	a3,a3,0x1
   21350:	01f61613          	slli	a2,a2,0x1f
   21354:	00c6e6b3          	or	a3,a3,a2
   21358:	fed72e23          	sw	a3,-4(a4)
   2135c:	fee512e3          	bne	a0,a4,21340 <__subtf3+0x930>
   21360:	0017d793          	srli	a5,a5,0x1
   21364:	02f12e23          	sw	a5,60(sp)
   21368:	03012783          	lw	a5,48(sp)
   2136c:	01f5d593          	srli	a1,a1,0x1f
   21370:	00b7e7b3          	or	a5,a5,a1
   21374:	02f12823          	sw	a5,48(sp)
   21378:	000087b7          	lui	a5,0x8
   2137c:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   21380:	8af412e3          	bne	s0,a5,20c24 <__subtf3+0x214>
   21384:	02012e23          	sw	zero,60(sp)
   21388:	02012c23          	sw	zero,56(sp)
   2138c:	02012a23          	sw	zero,52(sp)
   21390:	02012823          	sw	zero,48(sp)
   21394:	891ff06f          	j	20c24 <__subtf3+0x214>
   21398:	24705863          	blez	t2,215e8 <__subtf3+0xbd8>
   2139c:	01412783          	lw	a5,20(sp)
   213a0:	01812603          	lw	a2,24(sp)
   213a4:	01c12883          	lw	a7,28(sp)
   213a8:	0a031263          	bnez	t1,2144c <__subtf3+0xa3c>
   213ac:	02412f83          	lw	t6,36(sp)
   213b0:	02812303          	lw	t1,40(sp)
   213b4:	02c12503          	lw	a0,44(sp)
   213b8:	006fe5b3          	or	a1,t6,t1
   213bc:	00a5e5b3          	or	a1,a1,a0
   213c0:	00d5e5b3          	or	a1,a1,a3
   213c4:	fc058063          	beqz	a1,20b84 <__subtf3+0x174>
   213c8:	fff38813          	addi	a6,t2,-1
   213cc:	04081c63          	bnez	a6,21424 <__subtf3+0xa14>
   213d0:	40d705b3          	sub	a1,a4,a3
   213d4:	41f78e33          	sub	t3,a5,t6
   213d8:	00b736b3          	sltu	a3,a4,a1
   213dc:	01c7beb3          	sltu	t4,a5,t3
   213e0:	40de0e33          	sub	t3,t3,a3
   213e4:	00000693          	li	a3,0
   213e8:	00b77663          	bgeu	a4,a1,213f4 <__subtf3+0x9e4>
   213ec:	40ff8fb3          	sub	t6,t6,a5
   213f0:	001fb693          	seqz	a3,t6
   213f4:	01d6e7b3          	or	a5,a3,t4
   213f8:	40660733          	sub	a4,a2,t1
   213fc:	00e636b3          	sltu	a3,a2,a4
   21400:	40f70733          	sub	a4,a4,a5
   21404:	00078663          	beqz	a5,21410 <__subtf3+0xa00>
   21408:	40c30333          	sub	t1,t1,a2
   2140c:	00133813          	seqz	a6,t1
   21410:	40a88533          	sub	a0,a7,a0
   21414:	00d867b3          	or	a5,a6,a3
   21418:	40f50533          	sub	a0,a0,a5
   2141c:	00100413          	li	s0,1
   21420:	19c0006f          	j	215bc <__subtf3+0xbac>
   21424:	000086b7          	lui	a3,0x8
   21428:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   2142c:	fcd38a63          	beq	t2,a3,20c00 <__subtf3+0x1f0>
   21430:	07400693          	li	a3,116
   21434:	0506d063          	bge	a3,a6,21474 <__subtf3+0xa64>
   21438:	02012623          	sw	zero,44(sp)
   2143c:	02012423          	sw	zero,40(sp)
   21440:	02012223          	sw	zero,36(sp)
   21444:	00100593          	li	a1,1
   21448:	1180006f          	j	21560 <__subtf3+0xb50>
   2144c:	000086b7          	lui	a3,0x8
   21450:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   21454:	b4d400e3          	beq	s0,a3,20f94 <__subtf3+0x584>
   21458:	02c12683          	lw	a3,44(sp)
   2145c:	000805b7          	lui	a1,0x80
   21460:	00b6e6b3          	or	a3,a3,a1
   21464:	02d12623          	sw	a3,44(sp)
   21468:	07400693          	li	a3,116
   2146c:	fc76c6e3          	blt	a3,t2,21438 <__subtf3+0xa28>
   21470:	00038813          	mv	a6,t2
   21474:	40585693          	srai	a3,a6,0x5
   21478:	01f87313          	andi	t1,a6,31
   2147c:	00000593          	li	a1,0
   21480:	000f0813          	mv	a6,t5
   21484:	00000513          	li	a0,0
   21488:	02d51c63          	bne	a0,a3,214c0 <__subtf3+0xab0>
   2148c:	00300813          	li	a6,3
   21490:	40d80833          	sub	a6,a6,a3
   21494:	00269513          	slli	a0,a3,0x2
   21498:	02031e63          	bnez	t1,214d4 <__subtf3+0xac4>
   2149c:	00af0e33          	add	t3,t5,a0
   214a0:	000e2e03          	lw	t3,0(t3)
   214a4:	00130313          	addi	t1,t1,1
   214a8:	004f0f13          	addi	t5,t5,4
   214ac:	ffcf2e23          	sw	t3,-4(t5)
   214b0:	fe6856e3          	bge	a6,t1,2149c <__subtf3+0xa8c>
   214b4:	00400513          	li	a0,4
   214b8:	40d506b3          	sub	a3,a0,a3
   214bc:	0540006f          	j	21510 <__subtf3+0xb00>
   214c0:	00082e03          	lw	t3,0(a6)
   214c4:	00150513          	addi	a0,a0,1
   214c8:	00480813          	addi	a6,a6,4
   214cc:	01c5e5b3          	or	a1,a1,t3
   214d0:	fb9ff06f          	j	21488 <__subtf3+0xa78>
   214d4:	00ae8533          	add	a0,t4,a0
   214d8:	00052e03          	lw	t3,0(a0)
   214dc:	02000f93          	li	t6,32
   214e0:	406f8fb3          	sub	t6,t6,t1
   214e4:	01fe1e33          	sll	t3,t3,t6
   214e8:	01c5e5b3          	or	a1,a1,t3
   214ec:	00000293          	li	t0,0
   214f0:	0302c463          	blt	t0,a6,21518 <__subtf3+0xb08>
   214f4:	00400513          	li	a0,4
   214f8:	40d506b3          	sub	a3,a0,a3
   214fc:	02c12503          	lw	a0,44(sp)
   21500:	00281813          	slli	a6,a6,0x2
   21504:	010e8833          	add	a6,t4,a6
   21508:	00655533          	srl	a0,a0,t1
   2150c:	00a82023          	sw	a0,0(a6)
   21510:	00400813          	li	a6,4
   21514:	03c0006f          	j	21550 <__subtf3+0xb40>
   21518:	00052e03          	lw	t3,0(a0)
   2151c:	00452383          	lw	t2,4(a0)
   21520:	00450513          	addi	a0,a0,4
   21524:	006e5e33          	srl	t3,t3,t1
   21528:	01f393b3          	sll	t2,t2,t6
   2152c:	007e6e33          	or	t3,t3,t2
   21530:	01cf2023          	sw	t3,0(t5)
   21534:	00128293          	addi	t0,t0,1
   21538:	004f0f13          	addi	t5,t5,4
   2153c:	fb5ff06f          	j	214f0 <__subtf3+0xae0>
   21540:	00269513          	slli	a0,a3,0x2
   21544:	00ae8533          	add	a0,t4,a0
   21548:	00052023          	sw	zero,0(a0)
   2154c:	00168693          	addi	a3,a3,1
   21550:	ff0698e3          	bne	a3,a6,21540 <__subtf3+0xb30>
   21554:	02012683          	lw	a3,32(sp)
   21558:	00b035b3          	snez	a1,a1
   2155c:	00d5e5b3          	or	a1,a1,a3
   21560:	02412503          	lw	a0,36(sp)
   21564:	40b705b3          	sub	a1,a4,a1
   21568:	00b736b3          	sltu	a3,a4,a1
   2156c:	40a78e33          	sub	t3,a5,a0
   21570:	01c7b833          	sltu	a6,a5,t3
   21574:	40de0e33          	sub	t3,t3,a3
   21578:	00000693          	li	a3,0
   2157c:	00b77663          	bgeu	a4,a1,21588 <__subtf3+0xb78>
   21580:	40f50533          	sub	a0,a0,a5
   21584:	00153693          	seqz	a3,a0
   21588:	02812503          	lw	a0,40(sp)
   2158c:	0106e7b3          	or	a5,a3,a6
   21590:	00000693          	li	a3,0
   21594:	40a60733          	sub	a4,a2,a0
   21598:	00e63833          	sltu	a6,a2,a4
   2159c:	40f70733          	sub	a4,a4,a5
   215a0:	00078663          	beqz	a5,215ac <__subtf3+0xb9c>
   215a4:	40c50533          	sub	a0,a0,a2
   215a8:	00153693          	seqz	a3,a0
   215ac:	02c12503          	lw	a0,44(sp)
   215b0:	0106e6b3          	or	a3,a3,a6
   215b4:	40a88533          	sub	a0,a7,a0
   215b8:	40d50533          	sub	a0,a0,a3
   215bc:	02a12e23          	sw	a0,60(sp)
   215c0:	02e12c23          	sw	a4,56(sp)
   215c4:	03c12a23          	sw	t3,52(sp)
   215c8:	02b12823          	sw	a1,48(sp)
   215cc:	00c51793          	slli	a5,a0,0xc
   215d0:	e407da63          	bgez	a5,20c24 <__subtf3+0x214>
   215d4:	000807b7          	lui	a5,0x80
   215d8:	fff78793          	addi	a5,a5,-1 # 7ffff <__BSS_END__+0x5c5ab>
   215dc:	00f57533          	and	a0,a0,a5
   215e0:	02a12e23          	sw	a0,60(sp)
   215e4:	5540006f          	j	21b38 <__subtf3+0x1128>
   215e8:	02412e83          	lw	t4,36(sp)
   215ec:	02812f83          	lw	t6,40(sp)
   215f0:	02c12f03          	lw	t5,44(sp)
   215f4:	28038663          	beqz	t2,21880 <__subtf3+0xe70>
   215f8:	40830633          	sub	a2,t1,s0
   215fc:	0a041e63          	bnez	s0,216b8 <__subtf3+0xca8>
   21600:	01412383          	lw	t2,20(sp)
   21604:	01812883          	lw	a7,24(sp)
   21608:	01c12503          	lw	a0,28(sp)
   2160c:	0113e7b3          	or	a5,t2,a7
   21610:	00a7e7b3          	or	a5,a5,a0
   21614:	00e7e7b3          	or	a5,a5,a4
   21618:	02079063          	bnez	a5,21638 <__subtf3+0xc28>
   2161c:	02d12823          	sw	a3,48(sp)
   21620:	03d12a23          	sw	t4,52(sp)
   21624:	03f12c23          	sw	t6,56(sp)
   21628:	03e12e23          	sw	t5,60(sp)
   2162c:	00060413          	mv	s0,a2
   21630:	00080913          	mv	s2,a6
   21634:	df0ff06f          	j	20c24 <__subtf3+0x214>
   21638:	fff60793          	addi	a5,a2,-1
   2163c:	04079c63          	bnez	a5,21694 <__subtf3+0xc84>
   21640:	40e685b3          	sub	a1,a3,a4
   21644:	407e8e33          	sub	t3,t4,t2
   21648:	00b6b733          	sltu	a4,a3,a1
   2164c:	01ceb633          	sltu	a2,t4,t3
   21650:	40ee0e33          	sub	t3,t3,a4
   21654:	00000713          	li	a4,0
   21658:	00b6f663          	bgeu	a3,a1,21664 <__subtf3+0xc54>
   2165c:	41d383b3          	sub	t2,t2,t4
   21660:	0013b713          	seqz	a4,t2
   21664:	00c766b3          	or	a3,a4,a2
   21668:	411f8733          	sub	a4,t6,a7
   2166c:	00efb633          	sltu	a2,t6,a4
   21670:	40d70733          	sub	a4,a4,a3
   21674:	00068663          	beqz	a3,21680 <__subtf3+0xc70>
   21678:	41f888b3          	sub	a7,a7,t6
   2167c:	0018b793          	seqz	a5,a7
   21680:	40af0533          	sub	a0,t5,a0
   21684:	00c7e7b3          	or	a5,a5,a2
   21688:	40f50533          	sub	a0,a0,a5
   2168c:	00080913          	mv	s2,a6
   21690:	d8dff06f          	j	2141c <__subtf3+0xa0c>
   21694:	00008737          	lui	a4,0x8
   21698:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   2169c:	74e61463          	bne	a2,a4,21de4 <__subtf3+0x13d4>
   216a0:	02d12823          	sw	a3,48(sp)
   216a4:	03d12a23          	sw	t4,52(sp)
   216a8:	03f12c23          	sw	t6,56(sp)
   216ac:	03e12e23          	sw	t5,60(sp)
   216b0:	00080913          	mv	s2,a6
   216b4:	b69ff06f          	j	2121c <__subtf3+0x80c>
   216b8:	000087b7          	lui	a5,0x8
   216bc:	fff78793          	addi	a5,a5,-1 # 7fff <exit-0x80b5>
   216c0:	fef300e3          	beq	t1,a5,216a0 <__subtf3+0xc90>
   216c4:	01c12783          	lw	a5,28(sp)
   216c8:	00080737          	lui	a4,0x80
   216cc:	00e7e7b3          	or	a5,a5,a4
   216d0:	00f12e23          	sw	a5,28(sp)
   216d4:	07400793          	li	a5,116
   216d8:	18c7ca63          	blt	a5,a2,2186c <__subtf3+0xe5c>
   216dc:	41f65793          	srai	a5,a2,0x1f
   216e0:	01f7f793          	andi	a5,a5,31
   216e4:	00c787b3          	add	a5,a5,a2
   216e8:	4057d793          	srai	a5,a5,0x5
   216ec:	000e0513          	mv	a0,t3
   216f0:	00000593          	li	a1,0
   216f4:	00000713          	li	a4,0
   216f8:	02f74e63          	blt	a4,a5,21734 <__subtf3+0xd24>
   216fc:	00300713          	li	a4,3
   21700:	01f67893          	andi	a7,a2,31
   21704:	40f703b3          	sub	t2,a4,a5
   21708:	00279513          	slli	a0,a5,0x2
   2170c:	02089e63          	bnez	a7,21748 <__subtf3+0xd38>
   21710:	00ae0733          	add	a4,t3,a0
   21714:	00072703          	lw	a4,0(a4) # 80000 <__BSS_END__+0x5c5ac>
   21718:	00188893          	addi	a7,a7,1
   2171c:	004e0e13          	addi	t3,t3,4
   21720:	feee2e23          	sw	a4,-4(t3)
   21724:	ff13d6e3          	bge	t2,a7,21710 <__subtf3+0xd00>
   21728:	00400713          	li	a4,4
   2172c:	40f707b3          	sub	a5,a4,a5
   21730:	0880006f          	j	217b8 <__subtf3+0xda8>
   21734:	00052883          	lw	a7,0(a0)
   21738:	00170713          	addi	a4,a4,1
   2173c:	00450513          	addi	a0,a0,4
   21740:	0115e5b3          	or	a1,a1,a7
   21744:	fb5ff06f          	j	216f8 <__subtf3+0xce8>
   21748:	80000737          	lui	a4,0x80000
   2174c:	01f70713          	addi	a4,a4,31 # 8000001f <__BSS_END__+0x7ffdc5cb>
   21750:	00e67633          	and	a2,a2,a4
   21754:	00065863          	bgez	a2,21764 <__subtf3+0xd54>
   21758:	fff60613          	addi	a2,a2,-1
   2175c:	fe066613          	ori	a2,a2,-32
   21760:	00160613          	addi	a2,a2,1
   21764:	fff7c713          	not	a4,a5
   21768:	41f75713          	srai	a4,a4,0x1f
   2176c:	00e7f733          	and	a4,a5,a4
   21770:	00271713          	slli	a4,a4,0x2
   21774:	00e28733          	add	a4,t0,a4
   21778:	00072703          	lw	a4,0(a4)
   2177c:	02000413          	li	s0,32
   21780:	40c40433          	sub	s0,s0,a2
   21784:	00871733          	sll	a4,a4,s0
   21788:	00e5e5b3          	or	a1,a1,a4
   2178c:	00a28633          	add	a2,t0,a0
   21790:	00000713          	li	a4,0
   21794:	00460613          	addi	a2,a2,4
   21798:	02774463          	blt	a4,t2,217c0 <__subtf3+0xdb0>
   2179c:	01c12603          	lw	a2,28(sp)
   217a0:	00400713          	li	a4,4
   217a4:	40f707b3          	sub	a5,a4,a5
   217a8:	00239713          	slli	a4,t2,0x2
   217ac:	00e28733          	add	a4,t0,a4
   217b0:	01165633          	srl	a2,a2,a7
   217b4:	00c72023          	sw	a2,0(a4)
   217b8:	00300613          	li	a2,3
   217bc:	0380006f          	j	217f4 <__subtf3+0xde4>
   217c0:	ffc62503          	lw	a0,-4(a2)
   217c4:	00062903          	lw	s2,0(a2)
   217c8:	00170713          	addi	a4,a4,1
   217cc:	01155533          	srl	a0,a0,a7
   217d0:	00891933          	sll	s2,s2,s0
   217d4:	01256533          	or	a0,a0,s2
   217d8:	00ae2023          	sw	a0,0(t3)
   217dc:	004e0e13          	addi	t3,t3,4
   217e0:	fb5ff06f          	j	21794 <__subtf3+0xd84>
   217e4:	00279713          	slli	a4,a5,0x2
   217e8:	00e28733          	add	a4,t0,a4
   217ec:	00072023          	sw	zero,0(a4)
   217f0:	00178793          	addi	a5,a5,1
   217f4:	fef658e3          	bge	a2,a5,217e4 <__subtf3+0xdd4>
   217f8:	01012783          	lw	a5,16(sp)
   217fc:	00b035b3          	snez	a1,a1
   21800:	00f5e5b3          	or	a1,a1,a5
   21804:	01412703          	lw	a4,20(sp)
   21808:	40b685b3          	sub	a1,a3,a1
   2180c:	00b6b7b3          	sltu	a5,a3,a1
   21810:	40ee8e33          	sub	t3,t4,a4
   21814:	01ceb633          	sltu	a2,t4,t3
   21818:	40fe0e33          	sub	t3,t3,a5
   2181c:	00000793          	li	a5,0
   21820:	00b6f663          	bgeu	a3,a1,2182c <__subtf3+0xe1c>
   21824:	41d70733          	sub	a4,a4,t4
   21828:	00173793          	seqz	a5,a4
   2182c:	00c7e7b3          	or	a5,a5,a2
   21830:	01812603          	lw	a2,24(sp)
   21834:	00000693          	li	a3,0
   21838:	40cf8733          	sub	a4,t6,a2
   2183c:	00efb8b3          	sltu	a7,t6,a4
   21840:	40f70733          	sub	a4,a4,a5
   21844:	00078663          	beqz	a5,21850 <__subtf3+0xe40>
   21848:	41f60633          	sub	a2,a2,t6
   2184c:	00163693          	seqz	a3,a2
   21850:	01c12503          	lw	a0,28(sp)
   21854:	0116e6b3          	or	a3,a3,a7
   21858:	00030413          	mv	s0,t1
   2185c:	40af0533          	sub	a0,t5,a0
   21860:	40d50533          	sub	a0,a0,a3
   21864:	00080913          	mv	s2,a6
   21868:	d55ff06f          	j	215bc <__subtf3+0xbac>
   2186c:	00012e23          	sw	zero,28(sp)
   21870:	00012c23          	sw	zero,24(sp)
   21874:	00012a23          	sw	zero,20(sp)
   21878:	00100593          	li	a1,1
   2187c:	f89ff06f          	j	21804 <__subtf3+0xdf4>
   21880:	00140593          	addi	a1,s0,1
   21884:	01159313          	slli	t1,a1,0x11
   21888:	01235313          	srli	t1,t1,0x12
   2188c:	01412783          	lw	a5,20(sp)
   21890:	01812603          	lw	a2,24(sp)
   21894:	01c12883          	lw	a7,28(sp)
   21898:	00008e37          	lui	t3,0x8
   2189c:	1e031263          	bnez	t1,21a80 <__subtf3+0x1070>
   218a0:	01fee5b3          	or	a1,t4,t6
   218a4:	00c7e333          	or	t1,a5,a2
   218a8:	01e5e5b3          	or	a1,a1,t5
   218ac:	01136333          	or	t1,t1,a7
   218b0:	00d5e5b3          	or	a1,a1,a3
   218b4:	00e36333          	or	t1,t1,a4
   218b8:	12041663          	bnez	s0,219e4 <__subtf3+0xfd4>
   218bc:	02031063          	bnez	t1,218dc <__subtf3+0xecc>
   218c0:	00b035b3          	snez	a1,a1
   218c4:	02d12823          	sw	a3,48(sp)
   218c8:	03d12a23          	sw	t4,52(sp)
   218cc:	03f12c23          	sw	t6,56(sp)
   218d0:	03e12e23          	sw	t5,60(sp)
   218d4:	0105f933          	and	s2,a1,a6
   218d8:	b4cff06f          	j	20c24 <__subtf3+0x214>
   218dc:	02059a63          	bnez	a1,21910 <__subtf3+0xf00>
   218e0:	02e12823          	sw	a4,48(sp)
   218e4:	02f12a23          	sw	a5,52(sp)
   218e8:	02c12c23          	sw	a2,56(sp)
   218ec:	03112e23          	sw	a7,60(sp)
   218f0:	00000413          	li	s0,0
   218f4:	b30ff06f          	j	20c24 <__subtf3+0x214>
   218f8:	00068713          	mv	a4,a3
   218fc:	fe5ff06f          	j	218e0 <__subtf3+0xed0>
   21900:	00058793          	mv	a5,a1
   21904:	00050613          	mv	a2,a0
   21908:	00080893          	mv	a7,a6
   2190c:	fd5ff06f          	j	218e0 <__subtf3+0xed0>
   21910:	40d705b3          	sub	a1,a4,a3
   21914:	41d783b3          	sub	t2,a5,t4
   21918:	00b73e33          	sltu	t3,a4,a1
   2191c:	0077b2b3          	sltu	t0,a5,t2
   21920:	41c38e33          	sub	t3,t2,t3
   21924:	00000313          	li	t1,0
   21928:	00b77463          	bgeu	a4,a1,21930 <__subtf3+0xf20>
   2192c:	0013b313          	seqz	t1,t2
   21930:	00536333          	or	t1,t1,t0
   21934:	41f602b3          	sub	t0,a2,t6
   21938:	00563a33          	sltu	s4,a2,t0
   2193c:	406289b3          	sub	s3,t0,t1
   21940:	00000913          	li	s2,0
   21944:	00030463          	beqz	t1,2194c <__subtf3+0xf3c>
   21948:	0012b913          	seqz	s2,t0
   2194c:	01496933          	or	s2,s2,s4
   21950:	41e88333          	sub	t1,a7,t5
   21954:	41230333          	sub	t1,t1,s2
   21958:	02612e23          	sw	t1,60(sp)
   2195c:	03312c23          	sw	s3,56(sp)
   21960:	03c12a23          	sw	t3,52(sp)
   21964:	02b12823          	sw	a1,48(sp)
   21968:	00c31913          	slli	s2,t1,0xc
   2196c:	06095063          	bgez	s2,219cc <__subtf3+0xfbc>
   21970:	40e68733          	sub	a4,a3,a4
   21974:	40fe87b3          	sub	a5,t4,a5
   21978:	00e6b5b3          	sltu	a1,a3,a4
   2197c:	00febeb3          	sltu	t4,t4,a5
   21980:	40b787b3          	sub	a5,a5,a1
   21984:	00000593          	li	a1,0
   21988:	00e6f463          	bgeu	a3,a4,21990 <__subtf3+0xf80>
   2198c:	0013b593          	seqz	a1,t2
   21990:	40cf8633          	sub	a2,t6,a2
   21994:	01d5eeb3          	or	t4,a1,t4
   21998:	00cfbfb3          	sltu	t6,t6,a2
   2199c:	00000693          	li	a3,0
   219a0:	41d60633          	sub	a2,a2,t4
   219a4:	000e8463          	beqz	t4,219ac <__subtf3+0xf9c>
   219a8:	0012b693          	seqz	a3,t0
   219ac:	411f0f33          	sub	t5,t5,a7
   219b0:	01f6e6b3          	or	a3,a3,t6
   219b4:	40df0f33          	sub	t5,t5,a3
   219b8:	03e12e23          	sw	t5,60(sp)
   219bc:	02c12c23          	sw	a2,56(sp)
   219c0:	02f12a23          	sw	a5,52(sp)
   219c4:	02e12823          	sw	a4,48(sp)
   219c8:	c69ff06f          	j	21630 <__subtf3+0xc20>
   219cc:	01c5e933          	or	s2,a1,t3
   219d0:	01396933          	or	s2,s2,s3
   219d4:	00696933          	or	s2,s2,t1
   219d8:	01203933          	snez	s2,s2
   219dc:	01257933          	and	s2,a0,s2
   219e0:	a44ff06f          	j	20c24 <__subtf3+0x214>
   219e4:	03010513          	addi	a0,sp,48
   219e8:	04031e63          	bnez	t1,21a44 <__subtf3+0x1034>
   219ec:	02059e63          	bnez	a1,21a28 <__subtf3+0x1018>
   219f0:	03c12e23          	sw	t3,60(sp)
   219f4:	02012c23          	sw	zero,56(sp)
   219f8:	02012a23          	sw	zero,52(sp)
   219fc:	02012823          	sw	zero,48(sp)
   21a00:	03c10793          	addi	a5,sp,60
   21a04:	0007a703          	lw	a4,0(a5)
   21a08:	ffc7a683          	lw	a3,-4(a5)
   21a0c:	ffc78793          	addi	a5,a5,-4
   21a10:	00371713          	slli	a4,a4,0x3
   21a14:	01d6d693          	srli	a3,a3,0x1d
   21a18:	00d76733          	or	a4,a4,a3
   21a1c:	00e7a223          	sw	a4,4(a5)
   21a20:	fef512e3          	bne	a0,a5,21a04 <__subtf3+0xff4>
   21a24:	851ff06f          	j	21274 <__subtf3+0x864>
   21a28:	02d12823          	sw	a3,48(sp)
   21a2c:	03d12a23          	sw	t4,52(sp)
   21a30:	03f12c23          	sw	t6,56(sp)
   21a34:	03e12e23          	sw	t5,60(sp)
   21a38:	00080913          	mv	s2,a6
   21a3c:	fffe0413          	addi	s0,t3,-1 # 7fff <exit-0x80b5>
   21a40:	9e4ff06f          	j	20c24 <__subtf3+0x214>
   21a44:	9a058e63          	beqz	a1,20c00 <__subtf3+0x1f0>
   21a48:	03c12e23          	sw	t3,60(sp)
   21a4c:	02012c23          	sw	zero,56(sp)
   21a50:	02012a23          	sw	zero,52(sp)
   21a54:	02012823          	sw	zero,48(sp)
   21a58:	03c10793          	addi	a5,sp,60
   21a5c:	0007a703          	lw	a4,0(a5)
   21a60:	ffc7a683          	lw	a3,-4(a5)
   21a64:	ffc78793          	addi	a5,a5,-4
   21a68:	00371713          	slli	a4,a4,0x3
   21a6c:	01d6d693          	srli	a3,a3,0x1d
   21a70:	00d76733          	or	a4,a4,a3
   21a74:	00e7a223          	sw	a4,4(a5)
   21a78:	fef512e3          	bne	a0,a5,21a5c <__subtf3+0x104c>
   21a7c:	ff8ff06f          	j	21274 <__subtf3+0x864>
   21a80:	40d705b3          	sub	a1,a4,a3
   21a84:	41d782b3          	sub	t0,a5,t4
   21a88:	00b73333          	sltu	t1,a4,a1
   21a8c:	0057be33          	sltu	t3,a5,t0
   21a90:	40628333          	sub	t1,t0,t1
   21a94:	00000513          	li	a0,0
   21a98:	00b77463          	bgeu	a4,a1,21aa0 <__subtf3+0x1090>
   21a9c:	0012b513          	seqz	a0,t0
   21aa0:	01c56533          	or	a0,a0,t3
   21aa4:	41f60e33          	sub	t3,a2,t6
   21aa8:	01c63ab3          	sltu	s5,a2,t3
   21aac:	40ae0a33          	sub	s4,t3,a0
   21ab0:	00000993          	li	s3,0
   21ab4:	00050463          	beqz	a0,21abc <__subtf3+0x10ac>
   21ab8:	001e3993          	seqz	s3,t3
   21abc:	0159e9b3          	or	s3,s3,s5
   21ac0:	41e88533          	sub	a0,a7,t5
   21ac4:	41350533          	sub	a0,a0,s3
   21ac8:	02a12e23          	sw	a0,60(sp)
   21acc:	03412c23          	sw	s4,56(sp)
   21ad0:	02612a23          	sw	t1,52(sp)
   21ad4:	02b12823          	sw	a1,48(sp)
   21ad8:	00c51993          	slli	s3,a0,0xc
   21adc:	0e09d263          	bgez	s3,21bc0 <__subtf3+0x11b0>
   21ae0:	40e68733          	sub	a4,a3,a4
   21ae4:	40fe87b3          	sub	a5,t4,a5
   21ae8:	00e6b5b3          	sltu	a1,a3,a4
   21aec:	00febeb3          	sltu	t4,t4,a5
   21af0:	40b787b3          	sub	a5,a5,a1
   21af4:	00000593          	li	a1,0
   21af8:	00e6f463          	bgeu	a3,a4,21b00 <__subtf3+0x10f0>
   21afc:	0012b593          	seqz	a1,t0
   21b00:	40cf8633          	sub	a2,t6,a2
   21b04:	01d5eeb3          	or	t4,a1,t4
   21b08:	00cfbfb3          	sltu	t6,t6,a2
   21b0c:	41d60633          	sub	a2,a2,t4
   21b10:	000e8463          	beqz	t4,21b18 <__subtf3+0x1108>
   21b14:	001e3393          	seqz	t2,t3
   21b18:	411f0533          	sub	a0,t5,a7
   21b1c:	01f3e6b3          	or	a3,t2,t6
   21b20:	40d50533          	sub	a0,a0,a3
   21b24:	02a12e23          	sw	a0,60(sp)
   21b28:	02c12c23          	sw	a2,56(sp)
   21b2c:	02f12a23          	sw	a5,52(sp)
   21b30:	02e12823          	sw	a4,48(sp)
   21b34:	00080913          	mv	s2,a6
   21b38:	0a050063          	beqz	a0,21bd8 <__subtf3+0x11c8>
   21b3c:	065000ef          	jal	223a0 <__clzsi2>
   21b40:	ff450513          	addi	a0,a0,-12
   21b44:	41f55793          	srai	a5,a0,0x1f
   21b48:	01f7f793          	andi	a5,a5,31
   21b4c:	00a787b3          	add	a5,a5,a0
   21b50:	4057d793          	srai	a5,a5,0x5
   21b54:	01f57813          	andi	a6,a0,31
   21b58:	40f006b3          	neg	a3,a5
   21b5c:	0a080a63          	beqz	a6,21c10 <__subtf3+0x1200>
   21b60:	80000737          	lui	a4,0x80000
   21b64:	01f70713          	addi	a4,a4,31 # 8000001f <__BSS_END__+0x7ffdc5cb>
   21b68:	00e57733          	and	a4,a0,a4
   21b6c:	00075863          	bgez	a4,21b7c <__subtf3+0x116c>
   21b70:	fff70713          	addi	a4,a4,-1
   21b74:	fe076713          	ori	a4,a4,-32
   21b78:	00170713          	addi	a4,a4,1
   21b7c:	00269693          	slli	a3,a3,0x2
   21b80:	02000893          	li	a7,32
   21b84:	40e888b3          	sub	a7,a7,a4
   21b88:	03010613          	addi	a2,sp,48
   21b8c:	00c68713          	addi	a4,a3,12
   21b90:	00e60733          	add	a4,a2,a4
   21b94:	40d006b3          	neg	a3,a3
   21b98:	0ae61263          	bne	a2,a4,21c3c <__subtf3+0x122c>
   21b9c:	fff78713          	addi	a4,a5,-1
   21ba0:	00279793          	slli	a5,a5,0x2
   21ba4:	00f60633          	add	a2,a2,a5
   21ba8:	03012783          	lw	a5,48(sp)
   21bac:	010797b3          	sll	a5,a5,a6
   21bb0:	00f62023          	sw	a5,0(a2)
   21bb4:	fff00693          	li	a3,-1
   21bb8:	03010313          	addi	t1,sp,48
   21bbc:	0b40006f          	j	21c70 <__subtf3+0x1260>
   21bc0:	0065e5b3          	or	a1,a1,t1
   21bc4:	0145e5b3          	or	a1,a1,s4
   21bc8:	00a5e5b3          	or	a1,a1,a0
   21bcc:	f60596e3          	bnez	a1,21b38 <__subtf3+0x1128>
   21bd0:	00000413          	li	s0,0
   21bd4:	ea8ff06f          	j	2127c <__subtf3+0x86c>
   21bd8:	03812503          	lw	a0,56(sp)
   21bdc:	00050863          	beqz	a0,21bec <__subtf3+0x11dc>
   21be0:	7c0000ef          	jal	223a0 <__clzsi2>
   21be4:	02050513          	addi	a0,a0,32
   21be8:	f59ff06f          	j	21b40 <__subtf3+0x1130>
   21bec:	03412503          	lw	a0,52(sp)
   21bf0:	00050863          	beqz	a0,21c00 <__subtf3+0x11f0>
   21bf4:	7ac000ef          	jal	223a0 <__clzsi2>
   21bf8:	04050513          	addi	a0,a0,64
   21bfc:	f45ff06f          	j	21b40 <__subtf3+0x1130>
   21c00:	03012503          	lw	a0,48(sp)
   21c04:	79c000ef          	jal	223a0 <__clzsi2>
   21c08:	06050513          	addi	a0,a0,96
   21c0c:	f35ff06f          	j	21b40 <__subtf3+0x1130>
   21c10:	03c10713          	addi	a4,sp,60
   21c14:	00269693          	slli	a3,a3,0x2
   21c18:	00300613          	li	a2,3
   21c1c:	00d705b3          	add	a1,a4,a3
   21c20:	0005a583          	lw	a1,0(a1) # 80000 <__BSS_END__+0x5c5ac>
   21c24:	fff60613          	addi	a2,a2,-1
   21c28:	ffc70713          	addi	a4,a4,-4
   21c2c:	00b72223          	sw	a1,4(a4)
   21c30:	fef656e3          	bge	a2,a5,21c1c <__subtf3+0x120c>
   21c34:	fff78713          	addi	a4,a5,-1
   21c38:	f7dff06f          	j	21bb4 <__subtf3+0x11a4>
   21c3c:	00072583          	lw	a1,0(a4)
   21c40:	ffc72303          	lw	t1,-4(a4)
   21c44:	00d70e33          	add	t3,a4,a3
   21c48:	010595b3          	sll	a1,a1,a6
   21c4c:	01135333          	srl	t1,t1,a7
   21c50:	0065e5b3          	or	a1,a1,t1
   21c54:	00be2023          	sw	a1,0(t3)
   21c58:	ffc70713          	addi	a4,a4,-4
   21c5c:	f3dff06f          	j	21b98 <__subtf3+0x1188>
   21c60:	00271793          	slli	a5,a4,0x2
   21c64:	00f307b3          	add	a5,t1,a5
   21c68:	0007a023          	sw	zero,0(a5)
   21c6c:	fff70713          	addi	a4,a4,-1
   21c70:	fed718e3          	bne	a4,a3,21c60 <__subtf3+0x1250>
   21c74:	10854263          	blt	a0,s0,21d78 <__subtf3+0x1368>
   21c78:	40850533          	sub	a0,a0,s0
   21c7c:	00150513          	addi	a0,a0,1
   21c80:	40555793          	srai	a5,a0,0x5
   21c84:	00030613          	mv	a2,t1
   21c88:	01f57513          	andi	a0,a0,31
   21c8c:	00030693          	mv	a3,t1
   21c90:	00000893          	li	a7,0
   21c94:	00000713          	li	a4,0
   21c98:	02f71c63          	bne	a4,a5,21cd0 <__subtf3+0x12c0>
   21c9c:	00300693          	li	a3,3
   21ca0:	40f686b3          	sub	a3,a3,a5
   21ca4:	00279713          	slli	a4,a5,0x2
   21ca8:	02051e63          	bnez	a0,21ce4 <__subtf3+0x12d4>
   21cac:	00e605b3          	add	a1,a2,a4
   21cb0:	0005a583          	lw	a1,0(a1)
   21cb4:	00150513          	addi	a0,a0,1
   21cb8:	00460613          	addi	a2,a2,4
   21cbc:	feb62e23          	sw	a1,-4(a2)
   21cc0:	fea6d6e3          	bge	a3,a0,21cac <__subtf3+0x129c>
   21cc4:	00400713          	li	a4,4
   21cc8:	40f707b3          	sub	a5,a4,a5
   21ccc:	0580006f          	j	21d24 <__subtf3+0x1314>
   21cd0:	0006a583          	lw	a1,0(a3)
   21cd4:	00170713          	addi	a4,a4,1
   21cd8:	00468693          	addi	a3,a3,4
   21cdc:	00b8e8b3          	or	a7,a7,a1
   21ce0:	fb9ff06f          	j	21c98 <__subtf3+0x1288>
   21ce4:	00e30733          	add	a4,t1,a4
   21ce8:	00072583          	lw	a1,0(a4)
   21cec:	02000813          	li	a6,32
   21cf0:	40a80833          	sub	a6,a6,a0
   21cf4:	010595b3          	sll	a1,a1,a6
   21cf8:	00b8e8b3          	or	a7,a7,a1
   21cfc:	00000e13          	li	t3,0
   21d00:	00470713          	addi	a4,a4,4
   21d04:	02de4463          	blt	t3,a3,21d2c <__subtf3+0x131c>
   21d08:	00400713          	li	a4,4
   21d0c:	40f707b3          	sub	a5,a4,a5
   21d10:	03c12703          	lw	a4,60(sp)
   21d14:	00269693          	slli	a3,a3,0x2
   21d18:	00d306b3          	add	a3,t1,a3
   21d1c:	00a75733          	srl	a4,a4,a0
   21d20:	00e6a023          	sw	a4,0(a3)
   21d24:	00400693          	li	a3,4
   21d28:	0380006f          	j	21d60 <__subtf3+0x1350>
   21d2c:	ffc72583          	lw	a1,-4(a4)
   21d30:	00072e83          	lw	t4,0(a4)
   21d34:	001e0e13          	addi	t3,t3,1
   21d38:	00a5d5b3          	srl	a1,a1,a0
   21d3c:	010e9eb3          	sll	t4,t4,a6
   21d40:	01d5e5b3          	or	a1,a1,t4
   21d44:	00b62023          	sw	a1,0(a2)
   21d48:	00460613          	addi	a2,a2,4
   21d4c:	fb5ff06f          	j	21d00 <__subtf3+0x12f0>
   21d50:	00279713          	slli	a4,a5,0x2
   21d54:	00e30733          	add	a4,t1,a4
   21d58:	00072023          	sw	zero,0(a4)
   21d5c:	00178793          	addi	a5,a5,1
   21d60:	fed798e3          	bne	a5,a3,21d50 <__subtf3+0x1340>
   21d64:	03012703          	lw	a4,48(sp)
   21d68:	011037b3          	snez	a5,a7
   21d6c:	00f767b3          	or	a5,a4,a5
   21d70:	02f12823          	sw	a5,48(sp)
   21d74:	b7dff06f          	j	218f0 <__subtf3+0xee0>
   21d78:	03c12783          	lw	a5,60(sp)
   21d7c:	fff80737          	lui	a4,0xfff80
   21d80:	fff70713          	addi	a4,a4,-1 # fff7ffff <__BSS_END__+0xfff5c5ab>
   21d84:	40a40433          	sub	s0,s0,a0
   21d88:	00e7f7b3          	and	a5,a5,a4
   21d8c:	944ff06f          	j	20ed0 <__subtf3+0x4c0>
   21d90:	02012e23          	sw	zero,60(sp)
   21d94:	02012c23          	sw	zero,56(sp)
   21d98:	02012a23          	sw	zero,52(sp)
   21d9c:	02012823          	sw	zero,48(sp)
   21da0:	00000793          	li	a5,0
   21da4:	f01fe06f          	j	20ca4 <__subtf3+0x294>
   21da8:	07400693          	li	a3,116
   21dac:	00b6c463          	blt	a3,a1,21db4 <__subtf3+0x13a4>
   21db0:	fddfe06f          	j	20d8c <__subtf3+0x37c>
   21db4:	02012623          	sw	zero,44(sp)
   21db8:	02012423          	sw	zero,40(sp)
   21dbc:	02012223          	sw	zero,36(sp)
   21dc0:	00100593          	li	a1,1
   21dc4:	8b4ff06f          	j	20e78 <__subtf3+0x468>
   21dc8:	07400713          	li	a4,116
   21dcc:	9fd75c63          	bge	a4,t4,20fc4 <__subtf3+0x5b4>
   21dd0:	00012e23          	sw	zero,28(sp)
   21dd4:	00012c23          	sw	zero,24(sp)
   21dd8:	00012a23          	sw	zero,20(sp)
   21ddc:	00100593          	li	a1,1
   21de0:	b0cff06f          	j	210ec <__subtf3+0x6dc>
   21de4:	07400713          	li	a4,116
   21de8:	a8f742e3          	blt	a4,a5,2186c <__subtf3+0xe5c>
   21dec:	00078613          	mv	a2,a5
   21df0:	8edff06f          	j	216dc <__subtf3+0xccc>

00021df4 <__unordtf2>:
   21df4:	00052703          	lw	a4,0(a0)
   21df8:	00452e83          	lw	t4,4(a0)
   21dfc:	00852e03          	lw	t3,8(a0)
   21e00:	00c52503          	lw	a0,12(a0)
   21e04:	00c5a603          	lw	a2,12(a1)
   21e08:	000086b7          	lui	a3,0x8
   21e0c:	fff68693          	addi	a3,a3,-1 # 7fff <exit-0x80b5>
   21e10:	01055813          	srli	a6,a0,0x10
   21e14:	0005a783          	lw	a5,0(a1)
   21e18:	0045a303          	lw	t1,4(a1)
   21e1c:	0085a883          	lw	a7,8(a1)
   21e20:	00d87833          	and	a6,a6,a3
   21e24:	01065593          	srli	a1,a2,0x10
   21e28:	ff010113          	addi	sp,sp,-16
   21e2c:	00d5f5b3          	and	a1,a1,a3
   21e30:	02d81063          	bne	a6,a3,21e50 <__unordtf2+0x5c>
   21e34:	01d76733          	or	a4,a4,t4
   21e38:	01051513          	slli	a0,a0,0x10
   21e3c:	01055513          	srli	a0,a0,0x10
   21e40:	01c76733          	or	a4,a4,t3
   21e44:	00a76733          	or	a4,a4,a0
   21e48:	00100513          	li	a0,1
   21e4c:	02071663          	bnez	a4,21e78 <__unordtf2+0x84>
   21e50:	00008737          	lui	a4,0x8
   21e54:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   21e58:	00000513          	li	a0,0
   21e5c:	00e59e63          	bne	a1,a4,21e78 <__unordtf2+0x84>
   21e60:	0067e533          	or	a0,a5,t1
   21e64:	01061613          	slli	a2,a2,0x10
   21e68:	01156533          	or	a0,a0,a7
   21e6c:	01065613          	srli	a2,a2,0x10
   21e70:	00c56533          	or	a0,a0,a2
   21e74:	00a03533          	snez	a0,a0
   21e78:	01010113          	addi	sp,sp,16
   21e7c:	00008067          	ret

00021e80 <__fixtfsi>:
   21e80:	00052703          	lw	a4,0(a0)
   21e84:	00452603          	lw	a2,4(a0)
   21e88:	00c52783          	lw	a5,12(a0)
   21e8c:	00852683          	lw	a3,8(a0)
   21e90:	fe010113          	addi	sp,sp,-32
   21e94:	00e12023          	sw	a4,0(sp)
   21e98:	00c12223          	sw	a2,4(sp)
   21e9c:	00e12823          	sw	a4,16(sp)
   21ea0:	00179613          	slli	a2,a5,0x1
   21ea4:	00004737          	lui	a4,0x4
   21ea8:	00d12423          	sw	a3,8(sp)
   21eac:	00f12623          	sw	a5,12(sp)
   21eb0:	00d12c23          	sw	a3,24(sp)
   21eb4:	01165613          	srli	a2,a2,0x11
   21eb8:	ffe70713          	addi	a4,a4,-2 # 3ffe <exit-0xc0b6>
   21ebc:	00000513          	li	a0,0
   21ec0:	02c75063          	bge	a4,a2,21ee0 <__fixtfsi+0x60>
   21ec4:	00004737          	lui	a4,0x4
   21ec8:	01d70713          	addi	a4,a4,29 # 401d <exit-0xc097>
   21ecc:	01f7d813          	srli	a6,a5,0x1f
   21ed0:	00c75c63          	bge	a4,a2,21ee8 <__fixtfsi+0x68>
   21ed4:	80000537          	lui	a0,0x80000
   21ed8:	fff50513          	addi	a0,a0,-1 # 7fffffff <__BSS_END__+0x7ffdc5ab>
   21edc:	00a80533          	add	a0,a6,a0
   21ee0:	02010113          	addi	sp,sp,32
   21ee4:	00008067          	ret
   21ee8:	01079793          	slli	a5,a5,0x10
   21eec:	00010737          	lui	a4,0x10
   21ef0:	0107d793          	srli	a5,a5,0x10
   21ef4:	00e7e7b3          	or	a5,a5,a4
   21ef8:	00004737          	lui	a4,0x4
   21efc:	06f70713          	addi	a4,a4,111 # 406f <exit-0xc045>
   21f00:	40c70733          	sub	a4,a4,a2
   21f04:	40575513          	srai	a0,a4,0x5
   21f08:	02000593          	li	a1,32
   21f0c:	01f77713          	andi	a4,a4,31
   21f10:	00f12e23          	sw	a5,28(sp)
   21f14:	40e585b3          	sub	a1,a1,a4
   21f18:	01010613          	addi	a2,sp,16
   21f1c:	04071663          	bnez	a4,21f68 <__fixtfsi+0xe8>
   21f20:	00251513          	slli	a0,a0,0x2
   21f24:	00a60633          	add	a2,a2,a0
   21f28:	00062783          	lw	a5,0(a2)
   21f2c:	00f12823          	sw	a5,16(sp)
   21f30:	01012503          	lw	a0,16(sp)
   21f34:	fa0806e3          	beqz	a6,21ee0 <__fixtfsi+0x60>
   21f38:	40a00533          	neg	a0,a0
   21f3c:	fa5ff06f          	j	21ee0 <__fixtfsi+0x60>
   21f40:	00e6d6b3          	srl	a3,a3,a4
   21f44:	00b795b3          	sll	a1,a5,a1
   21f48:	00b6e6b3          	or	a3,a3,a1
   21f4c:	00d12823          	sw	a3,16(sp)
   21f50:	00100693          	li	a3,1
   21f54:	00269693          	slli	a3,a3,0x2
   21f58:	00d60633          	add	a2,a2,a3
   21f5c:	00e7d7b3          	srl	a5,a5,a4
   21f60:	00f62023          	sw	a5,0(a2)
   21f64:	fcdff06f          	j	21f30 <__fixtfsi+0xb0>
   21f68:	00200893          	li	a7,2
   21f6c:	fd150ae3          	beq	a0,a7,21f40 <__fixtfsi+0xc0>
   21f70:	00000693          	li	a3,0
   21f74:	fe1ff06f          	j	21f54 <__fixtfsi+0xd4>

00021f78 <__floatsitf>:
   21f78:	fd010113          	addi	sp,sp,-48
   21f7c:	02912223          	sw	s1,36(sp)
   21f80:	02112623          	sw	ra,44(sp)
   21f84:	02812423          	sw	s0,40(sp)
   21f88:	03212023          	sw	s2,32(sp)
   21f8c:	00050493          	mv	s1,a0
   21f90:	10058e63          	beqz	a1,220ac <__floatsitf+0x134>
   21f94:	41f5d793          	srai	a5,a1,0x1f
   21f98:	00b7c433          	xor	s0,a5,a1
   21f9c:	40f40433          	sub	s0,s0,a5
   21fa0:	00040513          	mv	a0,s0
   21fa4:	01f5d913          	srli	s2,a1,0x1f
   21fa8:	3f8000ef          	jal	223a0 <__clzsi2>
   21fac:	05150793          	addi	a5,a0,81
   21fb0:	000045b7          	lui	a1,0x4
   21fb4:	01e58593          	addi	a1,a1,30 # 401e <exit-0xc096>
   21fb8:	4057d713          	srai	a4,a5,0x5
   21fbc:	00812823          	sw	s0,16(sp)
   21fc0:	00012a23          	sw	zero,20(sp)
   21fc4:	00012c23          	sw	zero,24(sp)
   21fc8:	00012e23          	sw	zero,28(sp)
   21fcc:	01f7f793          	andi	a5,a5,31
   21fd0:	40a585b3          	sub	a1,a1,a0
   21fd4:	01010613          	addi	a2,sp,16
   21fd8:	02078a63          	beqz	a5,2200c <__floatsitf+0x94>
   21fdc:	00200693          	li	a3,2
   21fe0:	0cd71263          	bne	a4,a3,220a4 <__floatsitf+0x12c>
   21fe4:	02000693          	li	a3,32
   21fe8:	40f686b3          	sub	a3,a3,a5
   21fec:	00d456b3          	srl	a3,s0,a3
   21ff0:	00d12e23          	sw	a3,28(sp)
   21ff4:	fff70693          	addi	a3,a4,-1
   21ff8:	00271713          	slli	a4,a4,0x2
   21ffc:	00e60733          	add	a4,a2,a4
   22000:	00f41433          	sll	s0,s0,a5
   22004:	00872023          	sw	s0,0(a4)
   22008:	0300006f          	j	22038 <__floatsitf+0xc0>
   2200c:	00300793          	li	a5,3
   22010:	40e787b3          	sub	a5,a5,a4
   22014:	00279793          	slli	a5,a5,0x2
   22018:	00f607b3          	add	a5,a2,a5
   2201c:	0007a783          	lw	a5,0(a5)
   22020:	00f12e23          	sw	a5,28(sp)
   22024:	00200793          	li	a5,2
   22028:	00078693          	mv	a3,a5
   2202c:	00f71663          	bne	a4,a5,22038 <__floatsitf+0xc0>
   22030:	00812c23          	sw	s0,24(sp)
   22034:	00100693          	li	a3,1
   22038:	00269693          	slli	a3,a3,0x2
   2203c:	00012823          	sw	zero,16(sp)
   22040:	00062223          	sw	zero,4(a2)
   22044:	ffc68693          	addi	a3,a3,-4
   22048:	00400793          	li	a5,4
   2204c:	00f6e463          	bltu	a3,a5,22054 <__floatsitf+0xdc>
   22050:	00012c23          	sw	zero,24(sp)
   22054:	01c12783          	lw	a5,28(sp)
   22058:	02c12083          	lw	ra,44(sp)
   2205c:	02812403          	lw	s0,40(sp)
   22060:	00f11623          	sh	a5,12(sp)
   22064:	00f91793          	slli	a5,s2,0xf
   22068:	00b7e7b3          	or	a5,a5,a1
   2206c:	00f11723          	sh	a5,14(sp)
   22070:	01012783          	lw	a5,16(sp)
   22074:	02012903          	lw	s2,32(sp)
   22078:	00048513          	mv	a0,s1
   2207c:	00f4a023          	sw	a5,0(s1)
   22080:	01412783          	lw	a5,20(sp)
   22084:	00f4a223          	sw	a5,4(s1)
   22088:	01812783          	lw	a5,24(sp)
   2208c:	00f4a423          	sw	a5,8(s1)
   22090:	00c12783          	lw	a5,12(sp)
   22094:	00f4a623          	sw	a5,12(s1)
   22098:	02412483          	lw	s1,36(sp)
   2209c:	03010113          	addi	sp,sp,48
   220a0:	00008067          	ret
   220a4:	00300713          	li	a4,3
   220a8:	f4dff06f          	j	21ff4 <__floatsitf+0x7c>
   220ac:	00012e23          	sw	zero,28(sp)
   220b0:	00012c23          	sw	zero,24(sp)
   220b4:	00012a23          	sw	zero,20(sp)
   220b8:	00012823          	sw	zero,16(sp)
   220bc:	00000913          	li	s2,0
   220c0:	f95ff06f          	j	22054 <__floatsitf+0xdc>

000220c4 <__extenddftf2>:
   220c4:	01465713          	srli	a4,a2,0x14
   220c8:	00c61793          	slli	a5,a2,0xc
   220cc:	7ff77713          	andi	a4,a4,2047
   220d0:	fd010113          	addi	sp,sp,-48
   220d4:	00c7d793          	srli	a5,a5,0xc
   220d8:	00170693          	addi	a3,a4,1
   220dc:	02812423          	sw	s0,40(sp)
   220e0:	02912223          	sw	s1,36(sp)
   220e4:	03212023          	sw	s2,32(sp)
   220e8:	02112623          	sw	ra,44(sp)
   220ec:	00b12823          	sw	a1,16(sp)
   220f0:	00f12a23          	sw	a5,20(sp)
   220f4:	00012e23          	sw	zero,28(sp)
   220f8:	00012c23          	sw	zero,24(sp)
   220fc:	7fe6f693          	andi	a3,a3,2046
   22100:	00050913          	mv	s2,a0
   22104:	00058413          	mv	s0,a1
   22108:	01f65493          	srli	s1,a2,0x1f
   2210c:	08068263          	beqz	a3,22190 <__extenddftf2+0xcc>
   22110:	000046b7          	lui	a3,0x4
   22114:	c0068693          	addi	a3,a3,-1024 # 3c00 <exit-0xc4b4>
   22118:	00d70733          	add	a4,a4,a3
   2211c:	0047d693          	srli	a3,a5,0x4
   22120:	00d12e23          	sw	a3,28(sp)
   22124:	01c79793          	slli	a5,a5,0x1c
   22128:	0045d693          	srli	a3,a1,0x4
   2212c:	00d7e7b3          	or	a5,a5,a3
   22130:	01c59413          	slli	s0,a1,0x1c
   22134:	00f12c23          	sw	a5,24(sp)
   22138:	00812a23          	sw	s0,20(sp)
   2213c:	00012823          	sw	zero,16(sp)
   22140:	01c12783          	lw	a5,28(sp)
   22144:	00f49493          	slli	s1,s1,0xf
   22148:	00e4e4b3          	or	s1,s1,a4
   2214c:	00f11623          	sh	a5,12(sp)
   22150:	01012783          	lw	a5,16(sp)
   22154:	00911723          	sh	s1,14(sp)
   22158:	02c12083          	lw	ra,44(sp)
   2215c:	00f92023          	sw	a5,0(s2)
   22160:	01412783          	lw	a5,20(sp)
   22164:	02812403          	lw	s0,40(sp)
   22168:	02412483          	lw	s1,36(sp)
   2216c:	00f92223          	sw	a5,4(s2)
   22170:	01812783          	lw	a5,24(sp)
   22174:	00090513          	mv	a0,s2
   22178:	00f92423          	sw	a5,8(s2)
   2217c:	00c12783          	lw	a5,12(sp)
   22180:	00f92623          	sw	a5,12(s2)
   22184:	02012903          	lw	s2,32(sp)
   22188:	03010113          	addi	sp,sp,48
   2218c:	00008067          	ret
   22190:	00b7e533          	or	a0,a5,a1
   22194:	0e071c63          	bnez	a4,2228c <__extenddftf2+0x1c8>
   22198:	fa0504e3          	beqz	a0,22140 <__extenddftf2+0x7c>
   2219c:	04078c63          	beqz	a5,221f4 <__extenddftf2+0x130>
   221a0:	00078513          	mv	a0,a5
   221a4:	1fc000ef          	jal	223a0 <__clzsi2>
   221a8:	03150713          	addi	a4,a0,49
   221ac:	40575613          	srai	a2,a4,0x5
   221b0:	01f77713          	andi	a4,a4,31
   221b4:	40c007b3          	neg	a5,a2
   221b8:	04070463          	beqz	a4,22200 <__extenddftf2+0x13c>
   221bc:	00279793          	slli	a5,a5,0x2
   221c0:	00c78693          	addi	a3,a5,12
   221c4:	02000893          	li	a7,32
   221c8:	01010593          	addi	a1,sp,16
   221cc:	40e888b3          	sub	a7,a7,a4
   221d0:	00d586b3          	add	a3,a1,a3
   221d4:	40f007b3          	neg	a5,a5
   221d8:	08d59863          	bne	a1,a3,22268 <__extenddftf2+0x1a4>
   221dc:	fff60793          	addi	a5,a2,-1
   221e0:	00261613          	slli	a2,a2,0x2
   221e4:	00c585b3          	add	a1,a1,a2
   221e8:	00e41733          	sll	a4,s0,a4
   221ec:	00e5a023          	sw	a4,0(a1)
   221f0:	0380006f          	j	22228 <__extenddftf2+0x164>
   221f4:	1ac000ef          	jal	223a0 <__clzsi2>
   221f8:	02050513          	addi	a0,a0,32
   221fc:	fadff06f          	j	221a8 <__extenddftf2+0xe4>
   22200:	01c10713          	addi	a4,sp,28
   22204:	00279793          	slli	a5,a5,0x2
   22208:	00300693          	li	a3,3
   2220c:	00f705b3          	add	a1,a4,a5
   22210:	0005a583          	lw	a1,0(a1)
   22214:	fff68693          	addi	a3,a3,-1
   22218:	ffc70713          	addi	a4,a4,-4
   2221c:	00b72223          	sw	a1,4(a4)
   22220:	fec6d6e3          	bge	a3,a2,2220c <__extenddftf2+0x148>
   22224:	fff60793          	addi	a5,a2,-1
   22228:	00178793          	addi	a5,a5,1
   2222c:	00279793          	slli	a5,a5,0x2
   22230:	00800693          	li	a3,8
   22234:	01010713          	addi	a4,sp,16
   22238:	00d7ea63          	bltu	a5,a3,2224c <__extenddftf2+0x188>
   2223c:	00012823          	sw	zero,16(sp)
   22240:	00072223          	sw	zero,4(a4)
   22244:	ff878793          	addi	a5,a5,-8
   22248:	01810713          	addi	a4,sp,24
   2224c:	00400693          	li	a3,4
   22250:	00d7e463          	bltu	a5,a3,22258 <__extenddftf2+0x194>
   22254:	00072023          	sw	zero,0(a4)
   22258:	00004737          	lui	a4,0x4
   2225c:	c0c70713          	addi	a4,a4,-1012 # 3c0c <exit-0xc4a8>
   22260:	40a70733          	sub	a4,a4,a0
   22264:	eddff06f          	j	22140 <__extenddftf2+0x7c>
   22268:	0006a803          	lw	a6,0(a3)
   2226c:	ffc6a303          	lw	t1,-4(a3)
   22270:	00f68e33          	add	t3,a3,a5
   22274:	00e81833          	sll	a6,a6,a4
   22278:	01135333          	srl	t1,t1,a7
   2227c:	00686833          	or	a6,a6,t1
   22280:	010e2023          	sw	a6,0(t3)
   22284:	ffc68693          	addi	a3,a3,-4
   22288:	f51ff06f          	j	221d8 <__extenddftf2+0x114>
   2228c:	02050863          	beqz	a0,222bc <__extenddftf2+0x1f8>
   22290:	01c79713          	slli	a4,a5,0x1c
   22294:	0045d693          	srli	a3,a1,0x4
   22298:	00d76733          	or	a4,a4,a3
   2229c:	00e12c23          	sw	a4,24(sp)
   222a0:	0047d793          	srli	a5,a5,0x4
   222a4:	00008737          	lui	a4,0x8
   222a8:	01c59413          	slli	s0,a1,0x1c
   222ac:	00e7e7b3          	or	a5,a5,a4
   222b0:	00812a23          	sw	s0,20(sp)
   222b4:	00012823          	sw	zero,16(sp)
   222b8:	00f12e23          	sw	a5,28(sp)
   222bc:	00008737          	lui	a4,0x8
   222c0:	fff70713          	addi	a4,a4,-1 # 7fff <exit-0x80b5>
   222c4:	e7dff06f          	j	22140 <__extenddftf2+0x7c>

000222c8 <__mulsi3>:
   222c8:	00050613          	mv	a2,a0
   222cc:	00000513          	li	a0,0
   222d0:	0015f693          	andi	a3,a1,1
   222d4:	00068463          	beqz	a3,222dc <__mulsi3+0x14>
   222d8:	00c50533          	add	a0,a0,a2
   222dc:	0015d593          	srli	a1,a1,0x1
   222e0:	00161613          	slli	a2,a2,0x1
   222e4:	fe0596e3          	bnez	a1,222d0 <__mulsi3+0x8>
   222e8:	00008067          	ret

000222ec <__divsi3>:
   222ec:	06054063          	bltz	a0,2234c <__umodsi3+0x10>
   222f0:	0605c663          	bltz	a1,2235c <__umodsi3+0x20>

000222f4 <__hidden___udivsi3>:
   222f4:	00058613          	mv	a2,a1
   222f8:	00050593          	mv	a1,a0
   222fc:	fff00513          	li	a0,-1
   22300:	02060c63          	beqz	a2,22338 <__hidden___udivsi3+0x44>
   22304:	00100693          	li	a3,1
   22308:	00b67a63          	bgeu	a2,a1,2231c <__hidden___udivsi3+0x28>
   2230c:	00c05863          	blez	a2,2231c <__hidden___udivsi3+0x28>
   22310:	00161613          	slli	a2,a2,0x1
   22314:	00169693          	slli	a3,a3,0x1
   22318:	feb66ae3          	bltu	a2,a1,2230c <__hidden___udivsi3+0x18>
   2231c:	00000513          	li	a0,0
   22320:	00c5e663          	bltu	a1,a2,2232c <__hidden___udivsi3+0x38>
   22324:	40c585b3          	sub	a1,a1,a2
   22328:	00d56533          	or	a0,a0,a3
   2232c:	0016d693          	srli	a3,a3,0x1
   22330:	00165613          	srli	a2,a2,0x1
   22334:	fe0696e3          	bnez	a3,22320 <__hidden___udivsi3+0x2c>
   22338:	00008067          	ret

0002233c <__umodsi3>:
   2233c:	00008293          	mv	t0,ra
   22340:	fb5ff0ef          	jal	222f4 <__hidden___udivsi3>
   22344:	00058513          	mv	a0,a1
   22348:	00028067          	jr	t0
   2234c:	40a00533          	neg	a0,a0
   22350:	00b04863          	bgtz	a1,22360 <__umodsi3+0x24>
   22354:	40b005b3          	neg	a1,a1
   22358:	f9dff06f          	j	222f4 <__hidden___udivsi3>
   2235c:	40b005b3          	neg	a1,a1
   22360:	00008293          	mv	t0,ra
   22364:	f91ff0ef          	jal	222f4 <__hidden___udivsi3>
   22368:	40a00533          	neg	a0,a0
   2236c:	00028067          	jr	t0

00022370 <__modsi3>:
   22370:	00008293          	mv	t0,ra
   22374:	0005ca63          	bltz	a1,22388 <__modsi3+0x18>
   22378:	00054c63          	bltz	a0,22390 <__modsi3+0x20>
   2237c:	f79ff0ef          	jal	222f4 <__hidden___udivsi3>
   22380:	00058513          	mv	a0,a1
   22384:	00028067          	jr	t0
   22388:	40b005b3          	neg	a1,a1
   2238c:	fe0558e3          	bgez	a0,2237c <__modsi3+0xc>
   22390:	40a00533          	neg	a0,a0
   22394:	f61ff0ef          	jal	222f4 <__hidden___udivsi3>
   22398:	40b00533          	neg	a0,a1
   2239c:	00028067          	jr	t0

000223a0 <__clzsi2>:
   223a0:	000107b7          	lui	a5,0x10
   223a4:	02f57a63          	bgeu	a0,a5,223d8 <__clzsi2+0x38>
   223a8:	10053793          	sltiu	a5,a0,256
   223ac:	0017b793          	seqz	a5,a5
   223b0:	00379793          	slli	a5,a5,0x3
   223b4:	00023737          	lui	a4,0x23
   223b8:	02000693          	li	a3,32
   223bc:	40f686b3          	sub	a3,a3,a5
   223c0:	00f55533          	srl	a0,a0,a5
   223c4:	bbc70793          	addi	a5,a4,-1092 # 22bbc <__clz_tab>
   223c8:	00a787b3          	add	a5,a5,a0
   223cc:	0007c503          	lbu	a0,0(a5) # 10000 <exit-0xb4>
   223d0:	40a68533          	sub	a0,a3,a0
   223d4:	00008067          	ret
   223d8:	01000737          	lui	a4,0x1000
   223dc:	01800793          	li	a5,24
   223e0:	fce57ae3          	bgeu	a0,a4,223b4 <__clzsi2+0x14>
   223e4:	01000793          	li	a5,16
   223e8:	fcdff06f          	j	223b4 <__clzsi2+0x14>
