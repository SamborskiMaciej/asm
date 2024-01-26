section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

var db 1
res db 0

section .text
global _start
_start:
    mov eax, dword [var]
    cdq
    mov ebx, 17
    idiv ebx
    mov dword [res], eax
    add ebx, edx
    mov dword [rem], ebx

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

