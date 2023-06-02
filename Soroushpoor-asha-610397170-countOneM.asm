%include "in_out.asm"
section .data


section .bss
    s resq 1
section .text
    global _start

countOne:;assume the number in rax
    push rbx
    push rdx
    push r9
    mov rdx, 0x80;we check bit by bit from
    xor rbx, rbx
countOnefor:
    cmp rdx, 0
    JE countOneExit

    mov r9, rax
    and r9, rdx; see if the bit is one

    shr rdx,1

    cmp r9,0
    JE countOnefor; if the bit is 0 we dont do addition

    inc rbx;the bit is 1
    JMP countOnefor
countOneExit:
    mov rax, rbx
    pop r9
    pop rdx
    pop rbx
    ret

countOneM:; we go character to character from rsi to rdi and run count one on them
    xor r9,r9
    STD
for: 
    
    lodsq
    ; call putc
    call countOne
    add r9, rax
    cmp rsi, rdi
    JGE for

    mov rax,r9
    ret


_start:
    mov rax, rsp
    sub rax, 8
    mov [s], rax ;saving top of stack to [s] we store our string in stack

    call readNum;we want ([s]-8*i)
    mov rsi, rax;rsi = i
    mov rax, -8
    mul rsi;rax = -8*i
    mov rsi, rax;rsi = -8*i
    add rsi, [s];rsi = [s] - 8*i


    call readNum
    mov rdi, rax
    mov rax, -8
    mul rdi
    mov rdi, rax
    add rdi, [s]

    xor rax, rax
getString:; gets an string and put it in stack
    call getc
    cmp al, 0xA
    JE getStringEnd
    push rax
    JMP getString
getStringEnd:

    call countOneM
    call writeNum


Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80