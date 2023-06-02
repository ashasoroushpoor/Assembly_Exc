%include "in_out.asm"

; section .data
;     Msg db "Hello World!",0


section .bss
    a : resb 8
    b : resb 8

section .text
    global _start
_start:
    call readNum
    mov [a],rax
    call readNum
    mov [b], rax;getting input

    mov rax, [a]
    mov rbx, [b]
    cmp rax, rbx
    JB Aissmaller
    Jmp gcd
Aissmaller:; switch rax, rbx
    mov rdx, rbx
    mov rbx, rax
    mov rbx,rdx 
    jmp gcd



beforegcd: 
    mov rax, r8
    mov rbx, r9; question reqirements

gcd:; smaller one is in rbx and bigger one is in rax
; pseudocode
; while b â‰  0
;         t := b
;         b := a mod b
;         a := t
;     return a

    xor rdx, rdx
    div rbx
    mov rax, rbx
    mov rbx, rdx
    cmp rbx, 0
    JE printResult
    Jmp gcd

printResult:
    call writeNum
Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
