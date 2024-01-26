section .data

NULL equ 10
EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

num dd 1234567
num_len db 0

section .bss

string resb 255

section .text
global _start
_start:
    mov eax, dword [num]
    mov r10d, 10
    mov rbx, 0

iter0:
    mov rdx, 0
    div r10d
    inc byte [num_len]
    cmp ax, 0
    jne iter0

    mov rbx, 0
    mov rax, 0
    mov rsi, 0
    mov cl, [num_len]
    mov eax, dword [num]

iter1:
    mov rdx, 0
    div r10d
    add edx, 0x30
    push rdx
    inc rsi
    loop iter1

    mov cl, [num_len]
    mov bl, [num_len]
    inc bl
    mov rsi, 0

iter2:
    mov rdx, 0
    pop rdx
    mov byte [string + rsi], dl 
    inc rsi
    loop iter2

    mov byte [string + rsi], NULL

    mov rax, 1
    mov rdi, 1
    mov rsi, string
    movzx rdx, bl
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
