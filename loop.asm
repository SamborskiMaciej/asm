section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

iter_cnt db 10
sum dw 0

section .text
global _start
_start:
    mov cl, byte [iter_cnt]
    mov ax, 2

iter:
    add word [sum], ax
    shl ax, 1
    dec cl
    cmp cl, 0
    jne iter
   
exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
