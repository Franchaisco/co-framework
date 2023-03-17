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

        movq %rax, %rdi
        call factorial

        movq %rax, %rsi
        leaq input(%rip), %rdi
        call printf

        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret

        



inout:
        pushq %rbp
        movq %rsp, %rbp

        subq $16, %rsp
        leaq -16(%rbp), %rsi
        leaq input(%rip), %rdi
        movq $0, %rax
        call scanf

        movq -16(%rbp), %rax

        movq %rbp, %rsp
        popq %rbp
        ret

factorial:
        # IMPLEMENT ME
        pushq %rbp
        movq %rsp, %rbp

        cmpq $1, %rdi
        jle end

        pushq %rdi
        subq $1, %rdi

        call factorial

        popq %rdi
        imulq %rdi, %rax

        movq %rbp, %rsp
        popq %rbp
        ret




end:
        movq $1, %rax

        movq %rbp, %rsp
        popq %rbp
        ret
