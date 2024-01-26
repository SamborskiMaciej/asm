section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

newline db 10
newline_sz equ $-newline

arge db "Not enough arguments!", 10
arge_size equ $-arge

section .text
global _start
_start:

    pop rax
    mov r8, rax
    mov r9, 0
    cmp rax, 2
    jb print_error

    pop rax
    dec r8

_loop0:
    pop rax
    mov rdx, 0

_loop1:
    mov bl, [rax + rdx]
    inc rdx
    cmp bl, 0
    jne _loop1

    mov r10, rax
    dec rdx

    mov rax, 1
    mov rdi, 1
    mov rsi, r10
    syscall

    mov rcx, 0
    mov rdx, 0
    mov r11, 0

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_sz
    syscall

    mov rdx, 0

    inc r9
    cmp r8, r9
    jne _loop0
    jmp exit

print_error:
    mov rax, 1
    mov rdi, 1
    mov rsi, arge
    mov rdx, arge_size
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
