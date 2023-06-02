extern printf
extern scanf
extern fflush
%include "in_out.asm"
%include "sys-equal.asm"


section .data
    ErrAloc	db	'Error in allocation',0xA,	0
    ErrFree	db	'Error in freeing',0xA,	0
    min dq 100000000.0
    inpfmt db	'%lf',0
    fmts db	'%lf',NL,0
    fmto db "%lf %lf", 0

section .bss
    len resq 1
    arr resq 1000
    first resq 1
    second resq 1
    temp resq 1

section .text
    global main

; memalloc:;size should be in rsi return address in rax
;     mov	rax,	sys_mmap
;     mov	rsi,	mem_size

;     mov	rdx,	PROT_READ | PROT_WRITE
;     mov	r10,	MAP_ANONYMOUS | MAP_PRIVATE
;     syscall
;     cmp	rax,	-1
;     jg	memAlocEnd
;     call writeNum
;     mov	rsi,	ErrAloc
;     call	printString
; memAlocEnd:
;     ret

; Pmalloc: ;(int64 size) -> int64 address
;     enter   0,  0
;     push    rsi
;     push    r10

;     mov     rax,    sys_mmap
;     mov     rsi,    [P_FUNC_PARAM_INDEX]
;     mov     rdx,    PROT_READ | PROT_WRITE
;     mov     r10,    MAP_ANONYMOUS | MAP_PRIVATE
;     syscall
;     cmp	rax,	-1
;     jg	PmallocEnd
;     mov	rsi,	ErrAloc
;     call	printString
    

; PmallocEnd:
;     pop     r10
;     pop     rsi
;     leave
;     ret 8

; memfree:;address should be in r11 and size in rsi
;     mov	rax,	sys_mumap
; 	; mov	rsi,	mem_size
;     mov	rdi,	r11
;     syscall
;     cmp	rax,	-1
;     jg	memFreeEnd
;     mov	rsi,	ErrFree
;     call	printString
; memFreeEnd:
;     ret

flush:
    push rdi
    xor rdi, rdi
    call fflush
    pop rdi
    ret

printt:
    ; fst qword[temp]
    push r9
    push r8
    push rbx
    push rax
    push rbp
    mov rdi,fmts
    movq xmm0,qword [min]
    mov rax,1
    call printf
    pop rbp
    pop rax
    pop rbx
    pop r8
    pop r9
    
    ret
updatemin:
    ;r8 is i
    ;r9 is j
    ;rbx is base
    fld qword[rbx+r8*8]
    ; call printt
    fld qword[rbx+r9*8]
    ; call printt

    fsubp
    ; call printt
    ftst
    fnstsw ax

    and ax,0100011100000000B
    cmp ax,0000000000000000B
    je updateminnochs
    fchs
updateminnochs:
    fstp qword[temp]
    fld qword[min]
    fld qword[temp]
    ; call printt
    fcompp
    fnstsw ax

    and ax, 0x4500
    ; call writeNum
    ; call newLine
    cmp ax, 0x0100
    je updatemindo
    jmp updateminExt
updatemindo:
    mov [first],r8
    mov [second],r9

    fld qword[temp]
    fstp qword [min]

updateminExt:
    ret
main:
    finit
    call readNum
    mov [len], rax


    mov rcx,[len]
    mov rbx,arr


inputLoop:
    push rcx;counter
    push rbx;address
    push rbp
    
    mov rdi, inpfmt;address of input format
    mov rsi, rbx;first argument pinter to location of float
    xor rax,rax
    call scanf

    pop rbp
    pop rbx
    pop rcx

    add rbx, 8;next address

    loop inputLoop
    ;initialize
    mov qword[first],0
    mov qword[second],1
    mov rbx,arr
    fld qword [rbx]
    fld qword [rbx+8]
    fsubp
    ftst
    fnstsw ax

    and ax,0100011100000000B
    cmp ax,0000000000000000B
    je aftersignchange
    fchs
aftersignchange:
    fst qword[min]

    mov r8,0
for1:
    mov r9,r8
    inc r9
    mov rax, [len]
    cmp r9, rax
    jge for2ext
for2:
    ; mov rax,r8
    ; call writeNum
    ; mov al,' '
    ; call putc
    ; mov rax, r9
    ; call writeNum
    ; call newLine


    mov rbx,arr
    call updatemin
    

    
    mov rax, [len]
    inc r9
    cmp r9, rax
    jl for2
for2ext:
    inc r8
    mov rax, [len]
    cmp r8, rax
    jl for1

    ; mov rax,[first]
    ; call writeNum
    ; call newLine
    ; mov rax,[second]
    ; call writeNum
    ; call newLine

    ; push rbp
    ; mov rdi,fmts
    ; movq xmm0,qword [min]
    ; mov rax,1
    ; call printf
    ; pop rbp

    mov r8,[first]
    mov r9,[second]
    mov rbx,arr
    push rbp
    mov rdi,fmto
    movq xmm0,qword [rbx+r8*8]
    movq xmm1,qword [rbx+r9*8]
    mov rax,2
    call printf
    pop rbp
    

    call flush
Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall