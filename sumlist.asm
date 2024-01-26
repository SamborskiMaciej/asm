section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

list dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
list_len equ $-list
sum dd 0
bsn db 10

section .text
global _start
_start:
    mov rsi, 0
    mov rbx, list_len
    shr rbx, 2
iter:
    mov eax, dword [list + (rsi * 4)]
    add dword [sum], eax
    inc rsi
    cmp rsi, rbx
    jne iter

    mov rax, 1
    mov rsi, sum
    mov rdx, 1
    syscall

    mov rax, 1
    mov rsi, bsn
    mov rdx, 1
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
