section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

argc db 0, 0

section .text
global _start
_start:
    pop r8
    add r8, 0x30

    mov byte [argc], r8b 
    mov byte [argc + 1], 10

    mov rax, 1
    mov rdi, 1
    mov rsi, argc
    mov rdx, 2
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
