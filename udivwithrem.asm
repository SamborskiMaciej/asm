section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

var db 70
divisor db 3
res db 0
rem db 0

section .text
global _start
_start:
    mov ax, 0
    mov al, byte [var]
    div byte [divisor]
    mov byte [res], al
    mov byte [rem], ah

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

