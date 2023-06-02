;! gets n and n elements, returns unique items of that array

%include "in_out.asm"
section .data
    flg: times 65536 db 0

section .bss
    s resq 1
    sE resq 1
section .text
    global _start
writeWord:
    push rax
    push rbx

    xor rax,rax
    STD
    lodsw
    mov rbx,rax
    movsx rax, bx
    call writeNum

    pop rbx
    pop rax
    ret

printUniq:
    

    mov rbx, flg
    
    xor rax, rax
    xor rcx, rcx
    mov cx, word [rsi]
    mov al, byte [rbx+rcx]
    mov byte [rbx+rcx], 1
    call writeWord
printUniqloop1:
    cmp rsi, rdi
    JB printUniqExt; !!!
    xor rax, rax
    xor rcx, rcx
    mov cx, word [rsi]
    mov al, byte [rbx+rcx]
    ; call writeNum
    cmp al, 0
    JE  printUniqloop1first
    sub rsi,2
    JMP printUniqloop1
    ; call writeNum
printUniqloop1first:
    mov al,' '
    call putc
    mov byte [rbx+rcx], 1
    call writeWord
    JMP printUniqloop1
    ; sub rsi,2

printUniqExt:

    ret
_start:
    call readNum
    mov rcx, rax ;rcx is n
    
    mov rax, rsp
    sub rax, 2
    mov [s], rax ;saving top of stack to [s] we store our string in stack
inputloop:
    call readNum
    push ax
    loop inputloop

    mov rsi, [s];start of string
    mov [sE], rsp
    mov rdi, rsp;end of string

    ; mov ax, word [rsi]
    call printUniq

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80