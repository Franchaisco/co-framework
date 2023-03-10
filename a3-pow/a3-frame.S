# *********************************************************************************
# * Program name: pow                                                             *
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
    exit: jmp _exit
#endif

.text
formatstring: .asciz "%ld"

.global my_main
.global my_pow


my_main:
        # IMPLEMENT ME
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax

        subq $8, %rsp
        leaq -8(%rbp), %rsi

        leaq formatstring(%rip), %rdi
        call scanf

        subq $16, %rsp
        leaq -16(%rbp), %rsi

        leaq formatstring(%rip), %rdi
        call scanf

        movq -8(%rbp), %rdi
        movq -16(%rbp), %rsi
        movq $0, %rax
        movq $0, %rbx
        call my_pow
        movq %rax, %rsi
        leaq formatstring(%rip), %rdi
        call printf
        movq $0, %rax
        movq $0, %rbx
        movq %rbp, %rsp
        popq %rbp
        ret


my_pow:
    # IMPLEMENT ME
    pushq %rbp
    movq %rsp, %rbp
    movq $0, %rax
    movq $0, %rbx
    movq %rdi, %rax
    movq %rsi, %rbx
    addq %rbx, %rax

    movq %rbp, %rsp
    popq %rbp
    ret
