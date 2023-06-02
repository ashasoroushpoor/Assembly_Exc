;! gets a binary representation of a number prints out hex representation

%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0

section .bss
    s resq 1
    sE resq 1
    shiftc resq 1
section .text
    global _start
convert:
    xor rdx,rdx
convertLoop:
    STD
    lodsw

    mov rbx, rax
    
    mov rcx, [shiftc]
shiftrdx:
    cmp rcx,0
    JE  shiftrdxExt
    shl rdx,1
    dec rcx
    JMP shiftrdx
shiftrdxExt:

    mov rcx, [shiftc]
shiftrax:
    cmp rcx,0
    JE  shiftraxExt
    shr rax,1
    dec rcx
    JMP shiftrax
shiftraxExt:

    and rdx, 0x0F
    add rax,rdx
    and ax, 0x0F
    mov rdx, rbx

    cmp al, 9
    JA convertLoopover10
    add rax,'0'
    call putc
    JMP convertLoopcheck


convertLoopover10:
    add rax, 55
    call putc
    JMP convertLoopcheck
convertLoopcheck:
    cmp rsi, rdi
    JGE convertLoop
convertExt:
    ret

_start:
    mov rax, rsp
    sub rax, 2
    mov [s], rax ;saving top of stack to [s] we store our string in stack


inputcloop1:
    call getc

    cmp al, 0xA
    JE inputcloopExt

    xor rbx,rbx
    sub rax, 0x30; ourchar - '0'
    add rbx,rax
    mov rcx,3
inputcloop2:
    call getc

    cmp al,0xA
    mov [shiftc],rcx
    JE inputcloopExt

    sub rax, 0x30; ourchar - '0'
    shl rbx, 1
    add rbx,rax
    loop inputcloop2

    mov [shiftc],rcx
    cmp bx,0
    JE inputcloop1
    push bx
    JMP inputloop1

inputcloopExt:
    mov rcx, [shiftc]
shiftrbbbbb:
    cmp rcx,0
    JE  shiftrbbbbbe
    shl rbx,1
    dec rcx
    JMP shiftrbbbbb
shiftrbbbbbe:
    push bx
    JMP inputloopExt

inputloop1:
    call getc

    cmp al, 0xA
    JE inputloopExt

    xor rbx,rbx
    sub rax, 0x30; ourchar - '0'
    add rbx,rax
    mov rcx,3
inputloop2:
    call getc

    cmp al,0xA
    mov [shiftc],rcx
    JE inputcloopExt

    sub rax, 0x30; ourchar - '0'
    shl rbx, 1
    add rbx,rax
    loop inputloop2

    mov [shiftc],rcx
    push bx
    JMP inputloop1
inputloopExt:

    ; mov rax, [shiftc]
    ; call writeNum
    
    mov rsi, [s];start of string
    mov [sE], rsp
    mov rdi, rsp;end of string

    call convert
Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80