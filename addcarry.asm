section .data

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

EXIT_SUCCESS equ 0
SYS_EXIT     equ 60

var1 ddq 0x1A000000000000000
var2 ddq 0x2C000000000000000
sum  ddq 0

section .text
global _start
_start:
    mov rax, qword [var1]
    mov rdx, qword [var1 + 8]

    add rax, qword [var2]
    adc rdx, qword [var2 + 8]

    mov qword [sum]    , rax
    mov qword 8[sum], rdx

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
