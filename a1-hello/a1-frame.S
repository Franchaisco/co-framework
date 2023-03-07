# *********************************************************************************
# * Program name: Hello World                                                     *
# * Description :                                                                 *
# *********************************************************************************



    .global _main
    _main: jmp my_main
    printf: jmp _printf
    exit: jmp _exit


.text
# your strings here

.global my_main                         # make my_main accessible globally

my_main:
	# IMPLEMENT ME    
