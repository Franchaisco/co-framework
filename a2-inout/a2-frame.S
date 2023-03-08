# *********************************************************************************
# * Program name: inout                                                           *
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

.global my_main                         # make my_main accessible globally
.global my_increment                    # make my_increment accessible globally

my_main:
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax

        call    inout  
        movq %rax, %rsi
        leaq formatstring(%rip), %rdi              
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
        leaq formatstring(%rip), %rdi
        movq $0, %rax
        call scanf

        movq -16(%rbp), %rdi
        call    my_increment

        movq %rbp, %rsp
        popq %rbp
        ret

my_increment:
        pushq %rbp
        movq %rsp, %rbp

        movq %rdi, %rax
        incq %rax

        movq %rbp, %rsp
        popq %rbp
        ret
