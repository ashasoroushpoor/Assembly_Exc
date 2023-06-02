%include "in_out.asm"

section .data
    yes db "Yes",0xA,0
    no db "No",0xA,0


section .bss
    a : resb 8

section .text
    global _start


_start:
    call readNum
    mov [a],rax;getting input
    
    cmp rax, 1
    JNG notprime

    mov rcx, rax; rcx is counter
    mov r8, rax; save our number in r8
loop1: 
    dec rcx

    cmp rcx, 1
    JE isprime

    xor rdx,rdx
    mov rax,r8
    div rcx

    cmp rdx, 0
    JE notprime

    JMP loop1

isprime:
    mov rsi, yes
    call printString
    JMP Exit
notprime: 
    mov rsi, no
    call printString
Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
