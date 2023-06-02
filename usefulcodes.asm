%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0

section .bss

section .text
    global _start

_start:
    mov	rsi,	Msg
    call	printString

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80