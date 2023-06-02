;!counts number of 1 in binary representation of the given number

%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0

section .bss

section .text
    global _start
countOne:;assume the number in rax
    push rbx
    push rdx
    push r9
    mov rdx, 0x8000000000000000
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
_start:
    call readNum
    call countOne
    call writeNum

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80