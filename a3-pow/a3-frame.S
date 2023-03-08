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
formatstring: asciz "%ld"

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
        call scanf
        movq %rdi, %rax


my_pow:
        # IMPLEMENT ME
