	.file	"grayCode.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	mv	a4,a0
	ble	a0,zero,.L2
	li	a5,0
.L3:
	addiw	a5,a5,1
	bne	a4,a5,.L3
.L2:
	li	a5,1
	ble	a4,a5,.L4
	li	a2,2
	li	a0,1
	li	a1,0
.L8:
	mv	a3,a2
	slliw	a2,a2,1
	ble	a2,a3,.L6
.L5:
	mv	a5,a1
.L7:
	addiw	a5,a5,1
	bne	a4,a5,.L7
	addiw	a3,a3,1
	bne	a2,a3,.L5
.L6:
	addiw	a0,a0,1
	bne	a4,a0,.L8
.L4:
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
