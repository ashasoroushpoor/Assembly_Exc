extern printf
extern scanf
extern fflush
%include "in_out.asm"
section .data
    ErrAloc	db	'Error in allocation',0xA,	0
    ErrFree	db	'Error in freeing',0xA,	0
    Msg	db	'Hello World',	0

section .bss

section .text
    global main

memalloc:;size should be in rsi return address in rax
    mov	rax,	sys_mmap
    ;mov	rsi,	mem_size

    mov	rdx,	PROT_READ | PROT_WRITE
    mov	r10,	MAP_PRIVATE | MAP_ANONYMOUS
    syscall
    cmp	rax,	-1
    jg	memAlocEnd
    mov	rsi,	ErrAloc
    call	printString
memAlocEnd:
    ret

memfree:;address should be in r11 and size in rsi
    mov	rax,	sys_mumap
;	mov	rsi,	mem_size
    mov	rdi,	r11
    syscall
    cmp	rax,	-1
    jg	memFreeEnd
    mov	rsi,	ErrFree
    call	printString
memFreeEnd:
    ret

main:
    mov	rsi,	Msg
    call	printString

Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall