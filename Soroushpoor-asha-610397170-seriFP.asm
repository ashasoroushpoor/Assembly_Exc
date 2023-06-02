extern printf
extern scanf
extern fflush
%include "in_out.asm"
section .data
    ErrAloc	db	'Error in allocation',0xA,	0
    ErrFree	db	'Error in freeing',0xA,	0
    fmts	db	"%lf",	0
    fmtp	db	"%lf",NL,	0

section .bss
    x resq 1
    k resq 1
    ans resq 1
    temp resq 1
    p resq 1
section .text
    global main

flush:
    push rdi
    xor rdi, rdi
    call fflush
    pop rdi
    ret
;psudocode
;for k 0 n
    ;rax = k!
    ;stpush = 1/k!
    ;stpush = x
    ;st0 = x^k
    ;st0 = x^k * st1
    ;st1 += st0
fact:
    push rcx
    ;takes a number in rax and returns factorial
    fld1
    cmp rcx,0
    je factExt
factloop:
    fld1
    mov [temp],rcx
    fild qword [temp]
    fdivp
    fmulp
    loop factloop
factExt:
    pop rcx
    ret

xpowk:;x pow (rcx)
    push rcx

    cmp rcx,0
    je xpowone

    fld qword [x]
    dec rcx

    cmp rcx,0
    je xpowkExt
xpowkloop:
    fmul qword [x]
    loop xpowkloop
    jmp xpowkExt
xpowone:
    fld1
    jmp xpowkExt
xpowkExt:
    pop rcx
    ret

print:
    push rbp
    push rdi
    push rax
    mov rdi,fmtp
    movq xmm0,qword [p]
    mov rax,1
    call printf
    pop rax
    pop rdi
    pop rbp
    ret
seri:
    fldz
    mov rcx,[k]
seriloop:
    call xpowk;st0 = xpowk

    call fact




    fmulp   ;st0 = seri_k

    ; call print
    faddp   ;sigma
    
    dec rcx
    cmp rcx,0
    jge seriloop

    

seriExt:
    fstp qword[ans]
    ret


main:
    finit

    call readNum
    mov [k],rax

    push rbp
    mov rdi, fmts;format
    mov rsi,x;address of float
    xor rax,rax
    call scanf
    pop rbp

    call seri

    push rbp
    mov rdi,fmts
    movq xmm0,qword [ans]
    mov rax,1
    call printf
    pop rbp
    

    call flush

Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall