%include "in_out.asm"
section .data

section .bss

section .text
    global _start
printDigitBinary:; functionize for further use
    ;assume the number is in rax
    push rbx
    push rdx
    
    mov rdx, 0x8000000000000000
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
printBinary:

    ret

reverseBit:
;psudocode :
;count = bitcount(num)
;num >>= 1
;while (num) {
	; 	reverse_num <<= 1
	; 	reverse_num |= num & 1
	; 	num >>= 1
	; 	count--
	; }
    ;reverse_num <<= count
    push rcx
    push rdx
    push r9

    mov rcx, 63
    mov rdx, rax; it works same as rdi = rax & 1 in this case but because we shift all bits to the left this is faster
    shr rax, 1
reverseBitloop1:
    shl rdx, 1;reverse_num <<= 1
    
    mov r9, rax;reverse_num |= num & 1
    and r9, 1
    or rdx, r9

    shr rax, 1;num >>= 1
    dec rcx;count--
    cmp rax, 0
    JNE reverseBitloop1


reverseBitloop2:
    shl rdx, 1;reverse_num <<= count
    loop reverseBitloop2

    mov rax, rdx
    pop r9
    pop rdx
    pop rcx
    ret

_start:
    call readNum
    call reverseBit
    call printDigitBinary
    

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80