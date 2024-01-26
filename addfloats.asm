section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

x dd 3.4
y dd 3.5
var dd 0.0

section .text
global _start
_start:
    movss xmm0, dword [x]
    movss xmm1, dword [y]

    addss xmm0, xmm1

    movss dword [var], xmm0 

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
