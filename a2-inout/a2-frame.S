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

        movq $0, %rax
        movq %rbp, %rsp
        popq %rbp
        ret

inout:
        subq $8, %rsp
        leaq -8(%rbp), %rsi
        leaq formatstring(%rip), %rdi
        movq $0, %rax
        call scanf

        # call    my_increment

        call printf
        ret

my_increment:
        ret
