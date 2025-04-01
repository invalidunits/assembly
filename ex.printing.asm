; application which adds 2 to a number and shows that number
extern _printf
extern _scanf

section .text
    global _main
    _main:
        ; printf(NumberPrompt)
        mov rax, qword NumberPrompt 
        mov rdi, rax
        ; mov rax, 0

        push rbx
        call _printf
        pop rbx

        mov rax, qword NumberFormat 
        mov rdi, rax

        mov rax, qword value 
        mov rsi, rax

        push rbx
        call _scanf
        pop rbx

        mov rax, [qword value]
        add rax, 2
        mov [qword value], rax




        mov rax, qword NumberResultPrompt 
        mov rdi, rax

        mov rax, [qword value] 
        mov rsi, rax

        push rbx
        call _printf
        pop rbx








        

        ; return 0
        mov rax, 0
        ret    

section .data
    NumberPrompt db "Enter your number: ", 0
    NumberResultPrompt db "your number + 2: %d", 10, 0
    NumberFormat db "%d", 0


section .bss
    value resq 1