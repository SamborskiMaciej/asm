section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

result dw 0

section .text
global _start
_start:
    mov al, 0x05
    mov bl, 0x04
    imul bl
    mov word [result], ax

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

