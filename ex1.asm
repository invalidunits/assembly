bits 64
extern printf
extern scanf

global main

section .text
main:
; printf("Enter a number:")
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

    mov rdx, 0
    mov rax, [qword number]
    mov rcx, 2
    idiv rcx
    cmp rdx, 0
    mov rdi, qword numberOdd
    jnz main.after1

    mov rdi, qword numberEven
    .after1:
    mov rax, [qword number]
    mov rsi, rax
    mov rax, 0
    

    push rbx
    call printf
    pop rbx

    mov rax, 0 ; return 0
    ret 


section .data
    numberPrompt db "Enter a number: ", 0
    numberFormat db "%lld", 0

    numberEven db "The number %lld is an even number", 10, 0
    numberOdd db "The number %lld is an odd number", 10, 0

section .bss
    number resq 1