%include "in_out.asm"
section .data
    Msg	db	'NaN',	0

section .bss
    s resq 1;start of a
    sE resq 1;a End
    n resq 1
    x resq 1

section .text
    global _start


binarySearch:
    ;we have 2 passed variable L and R

    ;psuedo code
    ; function binary_search_leftmost(A, n, T):
    ; L := 0
    ; R := n
    ; while L < R:
    ;     m := floor((L + R) / 2)
    ;     if A[m] < T:
    ;         L := m + 1
    ;     else:
    ;         R := m
    ; return L
    ;because we are retarded we tend to do this recursively :)
    enter 0,0
    push rax;temp register
    push rbx;base ragister
    push rdx;data
    push rcx;index register
    ; push r8

    mov rax, [rbp+16];*a or L
    mov rcx, [rbp+24];*aEnd or R

    cmp rax,rcx
    JNL  binarySearchCaseEnd

    add rcx, rax
    shr rcx,1;   floor((L + R) / 2)

    
    mov rbx, [s]
    
    neg rcx
    mov rdx, [rbx + rcx*8]
    neg rcx

    mov rax, qword [x]
    cmp rdx, rax
    JL binarySearchCase1
    JMP binarySearchCase2

binarySearchCase1:
    mov rax, [rbp+24];R=R
    push rax
    inc rcx
    push rcx;m+1 = L
    ; mov rcx, [rbp+24]
    ; push rcx;R = R
    call binarySearch
    JMP binarySearchExit

binarySearchCase2:
    mov rax, [rbp+16]
    push rcx; R=M
    push rax; L = L


    call binarySearch
    JMP binarySearchExit
binarySearchCaseEnd:
    mov rbx, [s]
    mov rcx, rax
    neg rcx
    mov rdx, [rbx + rcx*8]
    ; neg rcx
    
    cmp rdx, [x]
    JE binarySearchCaseEndFound
    mov rsi, Msg
    call printString
    call newLine
    JMP binarySearchExit
binarySearchCaseEndFound:
    call writeNum
    call newLine
    JMP binarySearchExit
binarySearchExit:


    ; pop r8
    pop rcx
    pop rdx
    pop rbx
    pop rax
    leave
    ret 16


_start:
    mov rax, rsp
    sub rax, 8
    mov [s], rax; we store start of array

    call readNum; read n
    mov rcx, rax
    mov [n],rax
inputArray:

    call readNum
    push rax
    loop inputArray

    add rsp, 8
    mov [sE], rsp;store end of array
    sub rsp,8

    call readNum
    mov rcx, rax
queryLoop:
    call readNum
    mov [x], rax

    mov rax, [n]
    ; dec rax
    push rax;push R first
    xor rax,rax
    push rax;push L next
    
    call binarySearch

    loop queryLoop

Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80