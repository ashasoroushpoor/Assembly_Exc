%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0

section .bss
    s resq 1;start of a
    sE resq 1;a End
    n resq 1
section .text
    global _start
printArray:
;print array until number n defined in rcx and ponter defined in rsi
;!array is in stack so we have std otherwise use CLD
    push rax
    STD
    lodsq
    call writeNum
    dec rcx
printArrayLoop:
    mov al, ' '
    call putc
    STD
    lodsq
    call writeNum
    loop printArrayLoop
printArrayExit:
    pop rax
    ret 
swap:
    ;swaps index in rax and index in rcx
    ;data is in stack
    push r9
    push r8
    push rbx
    mov rbx, [s]

    neg rcx
    mov r8, [rbx+8*rcx]
    
    neg rax
    mov r9, [rbx+8*rax]

    mov [rbx+8*rax], r8
    mov [rbx+8*rcx], r9

    neg rax
    neg rcx
SwapExit:
    pop rbx
    pop r8
    pop r9
    ret
partition:
;psudocode
; partition (arr[], low, high)
; {
;     // pivot (Element to be placed at right position)
;     pivot = arr[high];  
 
;     i = (low - 1)  // Index of smaller element and indicates the 
;                    // right position of pivot found so far

;     for (j = low; j <= high- 1; j++)
;     {
;         // If current element is smaller than the pivot
;         if (arr[j] < pivot)
;         {
;             i++;    // increment index of smaller element
;             swap arr[i] and arr[j]
;         }
;     }
;     swap arr[i + 1] and arr[high])
;     return (i + 1)
; }
;return value in rax
    Enter 0,0
    push rdx
    push rbx
    push rcx
    push r8
    push r9

    mov r8, [rbp+16];high
    mov rcx, [rbp+24];low

    mov rbx, [s]

    neg r8
    mov rdx, [rbx+8*r8];     pivot = arr[high];  
    neg r8

    mov rax, rcx;j=low
    dec rcx;i = (low - 1)
partitionLoop1:
    cmp rax, r8;j<= high
    JGE partitionLoop1Exit

    neg rax
    mov r9, [rbx+8*rax];arr[j]
    neg rax

    cmp r9, rdx;if (arr[j] < pivot)
    JNL partitionLoop1Cond1

    inc rcx
    call swap
partitionLoop1Cond1:
    inc rax
    JMP partitionLoop1
partitionLoop1Exit:
    inc rcx
    mov rax, r8
    call swap
    mov rax, rcx;return i+1
    JMP partitionExit
partitionExit:
    pop r9
    pop r8
    pop rcx
    pop rbx
    pop rdx
    Leave
    ret 16

quickSort:
;psudocode
; /* low  --> Starting index,  high  --> Ending index */
; quickSort(arr[], low, high)
; {
;     if (low < high)
;     {
;         /* pi is partitioning index, arr[pi] is now
;            at right place */
;         pi = partition(arr, low, high);

;         quickSort(arr, low, pi - 1);  // Before pi
;         quickSort(arr, pi + 1, high); // After pi
;     }
; }
    Enter 0,0
    push rax
    push rbx
    push rcx
    mov rbx, [rbp+16];high
    mov rcx, [rbp+24];low

    cmp rcx, rbx
    JGE quickSortExit

    push rcx;low
    push rbx;high
    call partition;rax = pi

    push rcx;low
    dec rax
    push rax;high
    call quickSort

    add rax, 2
    push rax
    push rbx  
    call quickSort  
quickSortExit:

    pop rcx
    pop rbx
    pop rax
    Leave
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

    mov rax,0
    push rax;low
    mov rax, [n]
    dec rax
    push rax;high
    call quickSort

    mov rsi, [s]
    mov rcx, [n]
    call printArray
Exit:
    mov     rax,    1
    mov     rbx,    0
    int     0x80