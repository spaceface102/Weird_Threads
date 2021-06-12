	.text
	.file	"countV2.c"
	.globl	SumBetween              # -- Begin function SumBetween
	.p2align	4, 0x90
	.type	SumBetween,@function
SumBetween:                             # @SumBetween
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	cmpq	8(%rcx), %rax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	addq	-16(%rbp), %rax
	movq	%rax, -16(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, 16(%rdx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	SumBetween, .Lfunc_end0-SumBetween
	.cfi_endproc
                                        # -- End function
	.globl	SumUpTo_WithThreads     # -- Begin function SumUpTo_WithThreads
	.p2align	4, 0x90
	.type	SumUpTo_WithThreads,@function
SumUpTo_WithThreads:                    # @SumUpTo_WithThreads
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$288, %rsp              # imm = 0x120
	movq	%rdi, -8(%rbp)
	movl	$5, -12(%rbp)
	movq	%rsp, %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	cqto
	movl	$5, %ecx
	idivq	%rcx
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -44(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$4, -44(%rbp)
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %esi
	movslq	-44(%rbp), %rcx
	imulq	$24, %rcx, %rcx
	leaq	-272(%rbp), %rdx
	movq	%rdx, %rdi
	addq	%rcx, %rdi
	movq	-32(%rbp), %rcx
	movslq	-44(%rbp), %r8
	imulq	%r8, %rcx
	movq	%rcx, -72(%rbp)
	movq	-32(%rbp), %rcx
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %r8
	imulq	%r8, %rcx
	movq	%rcx, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	-72(%rbp), %rcx
	movq	%rcx, (%rdi)
	movq	-64(%rbp), %rcx
	movq	%rcx, 8(%rdi)
	movq	-56(%rbp), %rcx
	movq	%rcx, 16(%rdi)
	movslq	-44(%rbp), %rcx
	shlq	$3, %rcx
	leaq	-144(%rbp), %rdi
	addq	%rcx, %rdi
	movslq	-44(%rbp), %rcx
	imulq	$24, %rcx, %rcx
	addq	%rcx, %rdx
	movabsq	$SumBetween, %rcx
	movq	%rdx, -280(%rbp)        # 8-byte Spill
	movq	%rcx, %rdx
	movq	-280(%rbp), %rcx        # 8-byte Reload
	callq	pthread_create
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-32(%rbp), %rcx
	shlq	$2, %rcx
	movq	%rcx, -96(%rbp)
	movq	-8(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	-96(%rbp), %rcx
	movq	%rcx, -176(%rbp)
	movq	-88(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	movq	-80(%rbp), %rcx
	movq	%rcx, -160(%rbp)
	leaq	-144(%rbp), %rcx
	addq	$32, %rcx
	leaq	-272(%rbp), %rdx
	addq	$96, %rdx
	movq	%rcx, %rdi
	movabsq	$SumBetween, %rcx
	movq	%rdx, -288(%rbp)        # 8-byte Spill
	movq	%rcx, %rdx
	movq	-288(%rbp), %rcx        # 8-byte Reload
	callq	pthread_create
	movl	$0, -100(%rbp)
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, -100(%rbp)
	jge	.LBB1_8
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	xorl	%eax, %eax
	movl	%eax, %esi
	movslq	-100(%rbp), %rcx
	movq	-144(%rbp,%rcx,8), %rdi
	callq	pthread_join
	movslq	-100(%rbp), %rcx
	imulq	$24, %rcx, %rcx
	leaq	-272(%rbp), %rdx
	addq	%rcx, %rdx
	movq	16(%rdx), %rcx
	addq	-40(%rbp), %rcx
	movq	%rcx, -40(%rbp)
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	movl	-100(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -100(%rbp)
	jmp	.LBB1_5
.LBB1_8:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsp
	addq	$288, %rsp              # imm = 0x120
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	SumUpTo_WithThreads, .Lfunc_end1-SumUpTo_WithThreads
	.cfi_endproc
                                        # -- End function
	.globl	SumUpTo                 # -- Begin function SumUpTo
	.p2align	4, 0x90
	.type	SumUpTo,@function
SumUpTo:                                # @SumUpTo
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	ja	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	addq	-16(%rbp), %rax
	movq	%rax, -16(%rbp)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	SumUpTo, .Lfunc_end2-SumUpTo
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$1000000000, %edi       # imm = 0x3B9ACA00
	callq	SumUpTo_WithThreads
	movabsq	$.L.str, %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	printf
	xorl	%ecx, %ecx
	movl	%eax, -8(%rbp)          # 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym SumBetween
	.addrsig_sym SumUpTo_WithThreads
	.addrsig_sym pthread_create
	.addrsig_sym pthread_join
	.addrsig_sym printf
