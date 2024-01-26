section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

var1 dw 1200
var2 dw -2000
isum dw 0
vsum dd 0

section .text
global _start
_start:
    mov ax, word [var1]
    imul ax, -13
    mov word [isum], ax
    
    mov ax, word [var1]
    imul word [var2]
    mov word [vsum], ax
    mov word [vsum + 2], dx

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

