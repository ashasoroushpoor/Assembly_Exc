;! Calculate least common multiple

section .data
	hello:     db 'Hello morld!',10    ; 'Hello world!' plus a linefeed character
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string
    NUM1 dq 2500
    NUM2 dq 10500
section .text
	global _start

_start:
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
    int 80h              ; Call the kernel
    mov rbx,0
    mov rax,0
    mov rax,[NUM1]
    mov rbx,[NUM2]
    cmp rax,rbx
    JAE .loop ;if rax < rbx we should swap em
    mov rdx,rax
    mov rax,rbx
    mov rbx,rdx
    .loop:
    mov rdx,0
    div rbx ;remainder to rdx
    mov rax,rbx
    mov rbx,rdx
    cmp rbx,0
    jne .loop ;find gcd
    mov r8,rax ; rax is gcd
    mov rdx,0
    mov rax,[NUM1]
    mov rbx,[NUM2]
    mul rbx ;lcm is a*b / gcd
    mov rdx,0
    div r8
    mov rdx,rax
    
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return "code" of 0 (no error)
	int 80h;