%include "in_out.asm"


section .data
    space db " ",0


section .text
    global _start

getCharacter:;puts the character in al (since we can read one byte)
    xor    r8,r8; result
    xor    r9, r9

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

    mov rcx, 2
    xor rdx, rdx
    push rax
    div rcx
    cmp rdx, 0
    JNE odd

even:
    pop    rax     
    add    r8,rax
    JMP    endloop1
odd:
    pop rax
    add r9,rax

endloop1:
    jmp loop1

return1:
    ; ret
    jmp why
_start:
    ;we get the number character by character and calculate the result


    jmp getCharacter
why:
    mov rax, r9
    call writeNum
    mov rsi, space
    call printString
    mov rax, r8
    call writeNum
Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
