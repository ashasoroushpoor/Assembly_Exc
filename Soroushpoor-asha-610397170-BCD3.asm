;! gets bcd representation of a 3-digit number in binary prints binary representarion

%include "in_out.asm"

section .data
    Msg db "Hello World!",0


section .bss
    a : resb 8
    b : resb 8

section .text
    global _start

printDigitBinary:; functionize for further use
    ;assume the number is in rax
    push rbx
    push rdx
    
    mov rdx, 0x8000
printDigitBinaryloop1:
    cmp rdx, 0
    JE printDigitBinaryloop2continue;our number is 0

    mov rbx, rdx;mov our bit counter to rbx
    and rbx, rax;see if that bit is zero
    cmp rbx, 0
    JNE printDigitBinaryloop1Continue;that bit is not zero
    shr rdx, 1
    JMP printDigitBinaryloop1
    ;until we find our first True bit
printDigitBinaryloop1Continue:

    push rax
    mov rax, 0x31
    call putc
    pop rax
    shr rdx, 1
    ;print one 1
printDigitBinaryloop2:
    cmp rdx, 0
    JE printDigitBinaryloop2continue
    mov rbx, rdx;mov our bit counter to rbx
    and rbx, rax
    cmp rbx, 0
    
    JE printDigitBinaryloop2printzero ;it is zero
    
    push rax
    mov rax, 0x31;print 1
    call putc
    pop rax
    
    shr rdx, 1
    JMP printDigitBinaryloop2
printDigitBinaryloop2printzero:
    push rax
    mov rax, 0x30
    call putc
    pop rax

    shr rdx, 1
    JMP printDigitBinaryloop2

printDigitBinaryloop2continue:
    pop rdx
    pop rbx
    ret
_start:
    ;we store the number as 3, 4bit section then we can eaily move it around and work with it
    ;first we need to read the number bit by bit
    xor r8,r8;this is where the number is stored
gettingInput:
    xor rax,rax
    call getc;we get a character and we put it in al
    
    cmp al, 0xA
    JE ConvertThirdDigit

    shl r8, 1
    sub rax, 0x30; ourchar - '0'
    add r8,rax
    JMP gettingInput

ConvertThirdDigit:
    xor rax,rax;we stor result in rax
    ;here we have in r8 : 0,d3,d2,d1
    mov rbx, r8
    xor bl,bl
    ;we have in rbx, 0,d3,0,0
    ;we need to convert 256x to 100x we do that by 64x (/2^2) + 32x (/2^3) + 4x (/2^6) each shr is /2 so
    shr rbx, 2;2^2
    add rax, rbx

    shr rbx, 1;2^3
    add rax, rbx

    shr rbx, 3;2^6
    add rax, rbx

convertSecondDigit:
    xor rbx,rbx
    mov bl,r8b
    and bl, 0xF0
    ;now we have 0,0,d2,0
    ;converting 16x to 10x we need 8x(/2) + 2x(/2^3)
    shr bl, 1
    add rax, rbx
    shr bl, 2
    add rax, rbx
convertFirtDigit:
    xor rbx, rbx
    mov bl, r8b
    and bl, 0x0F
    ;we have now 0,0,0,d1
    add rax, rbx
    ; call writeNum
    call printDigitBinary


Exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
