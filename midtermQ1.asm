;! print all pairs a and b which a*b = x

%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0

section .bss

section .text
    global _start

writeDivs:
    push rcx
    push rdx
    push r9

    mov r9,rax
    mov rcx,1 

writeDivsLoop:
    cmp rcx,r9
    JAE writeDivsExt

    mov rax,r9
    xor rdx,rdx
    div rcx

    

    cmp rdx, 0
    JE  writeDivsloopPrint
    inc rcx
    JMP writeDivsLoop

writeDivsloopPrint:;print (rcx rax)

    cmp rcx, rax
    JA writeDivsExt

    mov rdx,rax
    mov rax, rcx
    call writeNum

    xor rax,rax
    mov al, ' '
    call putc

    mov rax, rdx
    call writeNum

    call newLine

    inc rcx
    JMP writeDivsLoop


writeDivsExt:
    pop r9
    pop rdx
    pop rcx
    ret
_start:
    call readNum
    call writeDivs

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80