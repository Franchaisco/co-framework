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
# your strings here

.global my_main
.global factorial


my_main:
        # IMPLEMENT ME
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax

factorial:
        # IMPLEMENT ME

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


end:
        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret
