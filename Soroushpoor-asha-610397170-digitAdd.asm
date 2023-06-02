%include "in_out.asm"



section .text
    global _start

getCharacter:;puts the character in al (since we can read one byte)
    xor    r8,r8; result

loop1:
    sub    rsp, 1
    mov    rsi, rsp
    mov    rdx, 1
    mov    rax, 0
    mov    rdi, 0
    syscall ;funny thing using int 80 here causes an error #TODO look at it later
    xor rax,rax
    mov    al, [rsi]
    add    rsp, 1


    cmp    al, 0xA;endl
    JE return1

    sub    rax, 0x30     
    add    r8,rax
    

    jmp loop1

return1:

    mov rax,r8
    call writeNum
    ret
_start:
    ;we get the number character by character and calculate the result


    jmp getCharacter

Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
