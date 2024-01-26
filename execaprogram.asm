section .data

NULL equ 0

newline db 10, NULL
newline_size equ $-newline

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

progName db "/bin/sh", NULL

section .text
global _start
_start:
    mov rax, 59
    mov rdi, progName
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
