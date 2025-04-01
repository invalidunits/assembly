bits 64
extern printf
extern scanf

global main

section .text
main:
    mov rdi, qword numberPrompt
    mov rax, 0
    push rbx
    call printf
    pop rbx

    mov rdi, qword numberFormat
    mov rsi, qword number
    mov rax, 0
    push rbx
    call scanf
    pop rbx


    mov rax, [qword number]
    mov rdi, rax
    call fib

    mov rsi, rax
    mov rdi, qword numberfib    
    mov rax, 1
    

    push rbx
    call printf
    pop rbx
    ret



fib:
    mov rax, [qword fibbasesize]
    cmp rdi, rax
    jb fib.fibbase

    push rdi
    sub rdi, 1
    call fib
    pop rdi
    push rax

    sub rdi, 2
    call fib
    pop rcx
    add rax, rcx
    ret

.fibbase:
    mov rax, rdi
    ret


section .data
    fibbasesize dq 2

    numberPrompt db "Enter a value for n: ", 0
    numberFormat db "%d", 0

    numberfib db "The nth fibbonacci number is %d", 10, 0

section .bss
    number resq 1