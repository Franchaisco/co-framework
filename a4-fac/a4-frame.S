# *********************************************************************************
# * Program name: factorial                                                       *
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
input: .asciz "%ld"

.global my_main
.global factorial


my_main:
        # IMPLEMENT ME
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax
        call inout
        jmp end


inout:
        pushq %rbp
        movq %rsp, %rbp

        subq $16, %rsp
        leaq -16(%rbp), %rsi
        leaq input(%rip), %rdi
        movq $0, %rax
        call scanf

        movq -16(%rbp), %rdi
        call factorial

        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret

factorial:
        # IMPLEMENT ME
        pushq %rbp
        movq %rsp, %rbp
        movq %rdi, %rdx
        movq $1, %rax
        imul %rdx, %rax
        decq %rdx
        cmpq $0, %rdx
        je end
        call factorial
        movq %rbp, %rsp
        popq %rbp
        ret




end:
        movq %rax, %rsi
        leaq input(%rip), %rdi
        call printf
        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret
