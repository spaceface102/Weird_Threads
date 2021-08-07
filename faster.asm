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
	subq	$2592, %rsp             # imm = 0xA20
	movq	%rdi, -8(%rbp)
	movl	$32, -12(%rbp)
	movq	%rsp, %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	cqto
	movl	$32, %ecx
	idivq	%rcx
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -44(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$31, -44(%rbp)
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %esi
	xorl	%eax, %eax
	movslq	-44(%rbp), %rcx
	shlq	$6, %rcx
	leaq	-2496(%rbp), %rdx
	movq	%rdx, %rdi
	addq	%rcx, %rdi
	leaq	-112(%rbp), %rcx
	movq	%rcx, %r8
	movq	%rdi, -2504(%rbp)       # 8-byte Spill
	movq	%r8, %rdi
	movq	%rsi, -2512(%rbp)       # 8-byte Spill
	movl	%eax, %esi
	movl	$64, %r8d
	movq	%rdx, -2520(%rbp)       # 8-byte Spill
	movq	%r8, %rdx
	movq	%rcx, -2528(%rbp)       # 8-byte Spill
	movq	%r8, -2536(%rbp)        # 8-byte Spill
	callq	memset
	movq	-32(%rbp), %rcx
	movslq	-44(%rbp), %rdx
	imulq	%rdx, %rcx
	movq	%rcx, -112(%rbp)
	movq	-32(%rbp), %rcx
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	imulq	%rdx, %rcx
	movq	%rcx, -104(%rbp)
	movq	-2504(%rbp), %rcx       # 8-byte Reload
	movq	-2528(%rbp), %rdx       # 8-byte Reload
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	-2536(%rbp), %rdx       # 8-byte Reload
	callq	memcpy
	movslq	-44(%rbp), %rcx
	shlq	$3, %rcx
	leaq	-448(%rbp), %rdx
	addq	%rcx, %rdx
	movslq	-44(%rbp), %rcx
	shlq	$6, %rcx
	movq	-2520(%rbp), %rsi       # 8-byte Reload
	addq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	-2512(%rbp), %rcx       # 8-byte Reload
	movq	%rsi, -2544(%rbp)       # 8-byte Spill
	movq	%rcx, %rsi
	movabsq	$SumBetween, %rdx
	movq	-2544(%rbp), %rcx       # 8-byte Reload
	callq	pthread_create
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	xorl	%eax, %eax
	movl	%eax, %esi
	xorl	%eax, %eax
	leaq	-2496(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1984, %rdx             # imm = 0x7C0
	leaq	-176(%rbp), %rdi
	movq	%rdi, %r8
	movq	%rdi, -2552(%rbp)       # 8-byte Spill
	movq	%r8, %rdi
	movq	%rsi, -2560(%rbp)       # 8-byte Spill
	movl	%eax, %esi
	movl	$64, %r8d
	movq	%rdx, -2568(%rbp)       # 8-byte Spill
	movq	%r8, %rdx
	movq	%rcx, -2576(%rbp)       # 8-byte Spill
	movq	%r8, -2584(%rbp)        # 8-byte Spill
	callq	memset
	imulq	$31, -32(%rbp), %rcx
	movq	%rcx, -176(%rbp)
	movq	-8(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -168(%rbp)
	movq	-2568(%rbp), %rcx       # 8-byte Reload
	movq	-2552(%rbp), %rdx       # 8-byte Reload
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	-2584(%rbp), %rdx       # 8-byte Reload
	callq	memcpy
	leaq	-448(%rbp), %rcx
	addq	$248, %rcx
	movq	-2576(%rbp), %rdx       # 8-byte Reload
	addq	$1984, %rdx             # imm = 0x7C0
	movq	%rcx, %rdi
	movq	-2560(%rbp), %rsi       # 8-byte Reload
	movabsq	$SumBetween, %rcx
	movq	%rdx, -2592(%rbp)       # 8-byte Spill
	movq	%rcx, %rdx
	movq	-2592(%rbp), %rcx       # 8-byte Reload
	callq	pthread_create
	movl	$0, -180(%rbp)
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$32, -180(%rbp)
	jge	.LBB1_8
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	xorl	%eax, %eax
	movl	%eax, %esi
	movslq	-180(%rbp), %rcx
	movq	-448(%rbp,%rcx,8), %rdi
	callq	pthread_join
	movslq	-180(%rbp), %rcx
	shlq	$6, %rcx
	leaq	-2496(%rbp), %rdx
	addq	%rcx, %rdx
	movq	16(%rdx), %rcx
	addq	-40(%rbp), %rcx
	movq	%rcx, -40(%rbp)
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	movl	-180(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -180(%rbp)
	jmp	.LBB1_5
.LBB1_8:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsp
	addq	$2592, %rsp             # imm = 0xA20
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
