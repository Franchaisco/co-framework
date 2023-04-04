# *********************************************************************************
# * Program name: fibonacci                                                       *
# * Description :                                                                 *
# *********************************************************************************

#ifndef MACOS
.ifndef CODEGRADE
    .global main
    main: jmp my_main
.endif
#else
    .global _main
    _main: jmp my_main
    printf: jmp _printf
    scanf: jmp _scanf
    malloc: jmp _malloc
    calloc: jmp _calloc
    realloc: jmp _realloc
    free: jmp _free
    exit: jmp _exit
#endif

.text
    input: .asciz "%ld"

.global my_main
.global fibonacci


my_main:
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax

        call inout


inout:
        pushq %rbp
        movq %rsp, %rbp

        subq $16, %rsp
        leaq -16(%rbp), %rsi
        leaq input(%rip), %rdi
        movq $0, %rax
        call scanf

        movq -16(%rbp), %rdi
        call    fibonacci

        movq %rbp, %rsp
        popq %rbp
        ret

fibonacci:
        pushq %rbp
        movq %rsp, %rbp
        movq %rdi, %rax
        movq $0, %rdx
        movq $1, %rcx
        
