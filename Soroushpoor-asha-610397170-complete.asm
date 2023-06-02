;! prints if the number is Perfect or not

%include "in_out.asm"

section .data
    perfect db "Perfect",0xA,0
    nope db "Nope",0xA,0
    space db " ",0


section .bss
    a : resb 8

section .text
    global _start


_start:
    call readNum
    mov [a],rax;getting input
    xor r8,r8 ;r8 is our sum
    mov rcx,rax;rcx is our counter it is backwars wo we save our numbers in queue
    mov r9, rax; r9 is our number
    push r9; as indicator
loop1:
    dec rcx
    
    cmp rcx,0
    JE loop1Continue; if our counter reached our number we exit

    xor rdx,rdx
    mov rax, r9
    div rcx;divide our number by rcx
    cmp rdx, 0; see if our remainder is zero
    JNE loop1
    
isdivisor:

    add r8, rcx
    push rcx
    JMP loop1

loop1Continue:
    cmp r8, r9
    JNE printNope


printPerfect:
    mov rsi, perfect
    call printString
    JMP printDivisorsLoop
printNope:
    mov rsi, nope
    call printString
    
printDivisorsLoop:
    pop rax
    cmp rax,r9
    JE printDivisorsContinue
    
    cmp rax, 1
    JE dontprintspace
    ;print space
    mov rsi, space
    call printString
dontprintspace:   
    call writeNum
    JMP printDivisorsLoop
printDivisorsContinue:
Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
