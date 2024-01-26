global print
print:
    push rax
    push rdi

    mov rax, 1
    mov rdi, 1
    syscall

    pop rdi
    pop rax
    ret

section .data

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

newline db 10
newline_size equ $-newline

msg db "TEST"
msg_len equ $-msg

section .text
global _start
_start:
    mov rsi, msg
    mov rdx, msg_len
    call print
    
    mov rsi, newline
    mov rdx, newline_size
    call print

exit:
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
