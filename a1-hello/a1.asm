


global _main
_main: jmp my_main
printf: jmp _printf
exit: jmp _exit


.text:


global my_main                         


my_main:
	mov eax, 4
    mov ebx, 1
    lea ecx, [message]
    lea edx, 12
    int 0x80    

.data:
_printf:
    message: db 'Hello World!', 0x4

_exit:
    mov eax, 1
    mov ebx, 0
    int 0x80