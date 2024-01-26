%macro printl 2
    push rax
    push rdi
    push rsi
    push rdx
    push r11

    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall

    pop r11
    pop rdx
    pop rsi
    pop rdi
    pop rax
%endmacro

global print
print:
    mov rsi, 0

iter:
    mov al, byte [rdi + rsi]
    inc rsi
    cmp al, 0
    jne iter
    
    dec rsi

    mov rdx, rsi
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 0

    ret

section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

newline db 10, 0
newline_size equ $-newline

msg db "TEST", 0
msg_len equ $-msg

msg2 db "LOLOLLMAOLLLL L L L MDR", 0
msg2_len equ $-msg2

section .bss

input_size equ 255
input resb input_size

section .text
global _start
_start:
    printl msg, msg_len

    printl newline, newline_size

    mov rdi, msg2
    call print

    mov rdi, newline
    call print

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
