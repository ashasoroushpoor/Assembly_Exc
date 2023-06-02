%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0
ConvertDisp:;!convert binary to hex
    ;gets a pointer to null ended string and converts it 
    ;into 0x(hex) in convssdispbuffer
    ;* args 16: pointer to string
    Enter 0,0
    push rax
    push rdx
    push rcx
    push rsi
    push rdi
    ;algorithm: converts each 4bits into a number and sets the value
    mov rdi, [rbp+16]
    call GetStrlen; len to rdx
    mov rax, rdx
    xor rdx, rdx
    mov rcx, 4
    div rcx;len%4 in rdx

    mov rsi, [rbp+16]
    mov rdi, convssdispbuffer

    mov byte [rdi], '0'
    inc rdi
    mov byte [rdi], 'x'
    inc rdi

    mov rcx, rdx
    cmp rcx,0
    jne CDcc
    mov rcx, 4
CDcc:
CDloop1:
    xor rax, rax
CDloop2:
    shl al,1
    mov dl, [rsi]
    cmp dl, '1'
    je CDC1
    jmp CDCext
CDC1:
    inc al
    jmp CDCext
CDCext:
    inc rsi
    dec rcx
    cmp rcx, 0
    jne CDloop2
CDloop2Ext:
    cmp al, 10
    jge CDF2
    jmp CDF1
CDF1:
    add al, '0'
    mov [rdi], al
    jmp CDFext
CDF2:
    sub al, 10
    add al, 'A'
    mov [rdi], al
    jmp CDFext
CDFext:
    mov rcx, 4
    inc rdi
    cmp byte [rsi],0
    jne CDloop1
CDloop1Ext:
    mov byte [rdi], 0
ConvertDispExit:
    pop rdi
    pop rsi
    pop rcx
    pop rdx
    pop rax
    Leave
    ret 8
section .bss

section .text
    global _start

_start:
    mov	rsi,	Msg
    call	printString

Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall