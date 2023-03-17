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

        subq $16, %rsp
        leaq -16(%rbp), %rsi
        leaq formatstring(%rip), %rdi
        movq $0, %rax
        call scanf

        subq $32, %rsp
        leaq -32(%rbp), %rsi
        leaq formatstring(%rip), %rdi
        movq $0, %rax
        call scanf

        movq -16(%rbp), %rdi
        movq -32(%rbp), %rsi
        call my_pow

        movq %rax, %rsi
        leaq formatstring(%rip), %rdi
        call printf

        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret


my_pow:
    # IMPLEMENT ME
    pushq %rbp
    movq %rsp, %rbp
    movq %rdi, %rdx
    movq %rsi, %rcx
    movq $1, %rax
    cmpq $0, %rcx
    je end

raise_number:
    imul %rdx, %rax
    dec %rcx
    cmpq $0, %rcx
    jg raise_number

end:
    movq %rbp, %rsp
    popq %rbp
    ret