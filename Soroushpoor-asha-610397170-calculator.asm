;! simple calculator with parser and everything :)
;! input & to exit

%include "in_out.asm"
section .data
    Msg	db	'Hello World',	0
    ans dq 0
    negone dq -1

section .bss
    s resq 1;start of s
    sE resq 1;s End
    neflg resb 1 ;just a negation flag
section .text
    global _start
;psuedocode
;eval(*s, *sEnd){
;   if s = number or s = ans: number
;   if s has (): eval(a)?evalb
;   if s has + or -: evala +- evalb
;   if s has * or /: evala */ evalb
atoi:;converts the string from rsi to rdi to a number and return it in rax
    enter 0,0
    push rsi
    push rdi
    push rdx
    push rbx; we use this as negation flag

    mov rsi, [rbp+16];*s
    mov rdi, [rbp+24];*send

    mov bl,0
    xor rdx,rdx
    xor rax,rax

    mov rax, [rsi]
    cmp al, '-'
    JE atoineg; in case that we have -int we don't jump and go one cell further
    cmp al, '+'
    JE atoipos
    JMP atoiloop1

atoineg:
    sub rsi, 8
    mov bl,1
    JMP atoiloop1
atoipos:
    sub rsi, 8
    JMP atoiloop1
    
atoiloop1:
    STD
    lodsq
    ; call putc
    sub     rax,0x30
    imul    rdx, 10
    add     rdx,  rax
    xor     rax, rax
    cmp rsi, rdi
    JGE atoiloop1

atoiendloop1:
    mov rax,rdx

    cmp bl,0
    JE atoiexit
    neg rax
atoiexit:
    pop rbx
    pop rdx
    pop rdi
    pop rsi
    leave
    ret 16


calculatesubfuncsubadd:;updates rbx based on flags and r9
    ;dh = 0 means + and dh = 1 means -
    push rdx
    push rax

    cmp dh,0
    JE calculatesubfuncsubadd1

    cmp dh, 1
    JE calculatesubfuncsubadd2

    JMP calculatesubfuncsubaddend
calculatesubfuncsubadd1:
    add rbx, r9
    mov r9,1
    JMP calculatesubfuncsubaddend
calculatesubfuncsubadd2:
    sub rbx, r9
    mov r9,1
    JMP calculatesubfuncsubaddend

calculatesubfuncsubaddend:
    pop rax
    pop rdx
    mov dl,0;reset mult to *
    ret

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
calculatesubfuncmuldiv:;updates r9 based on flags and rax
    ;dl = 0 means * and dl = 1 means /
    push rdx
    push rax

    cmp dl,0
    JE calculatesubfuncmuldiv1

    cmp dl,1
    JE calculatesubfuncmuldiv2

    JMP calculatesubfuncmuldivend
calculatesubfuncmuldiv1:;r9 = r9*rax
    imul r9
    mov r9,rax

    JMP calculatesubfuncmuldivend
calculatesubfuncmuldiv2:;t9 = r9/rax
    mov rdx, r9
    mov r9, rax
    mov rax, rdx
    xor rdx,rdx
    
    cmp rax,0
    cmovl rdx,[negone]

    idiv r9
    mov r9, rax

    JMP calculatesubfuncmuldivend
calculatesubfuncmuldivend:

    pop rax
    pop rdx
    ret

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
calculate:
;first version called eval was buggy and hard to use so here we are writing new one
;there are 2 passing variables *a and *aend calculates value from *a to *aend and returns it as int in rax
;rbx contains our result we call it res
;here is algorithm := calculated operation1 nexttoken operation2 therest
;operation2 = * or / r9 is calculated 
;next toke is ( we call calculate recursively
;otherwise we add or sub


;pseudocode
;while(i<j)
;x=i
;for s[i]!= op
;else tokenize(s[x>i])
;r9 * / token based on flag (part 1)
;if nextop = + or - or end of line:rbx +- r9, r9=1
    enter 8,0
    push rsi; we use this register as beginning pointer
    push rdi; we use this register as end pointer
    push rbx; temperory result holder
    push rdx; we use dh and dl as flags
    ;dl = 0 means * and dl = 1 means /
    ;dh = 0 means + and dh = 1 means -
    push r9;temperory holder
    push r8;counter for paranthesis

    xor rbx, rbx;default of result is 0
    xor rdx, rdx;default is + and *
    mov r9,1;default of multiplication is 1

    mov rsi, [rbp+16];*s
    mov rdi, [rbp+24];*send
    mov [rbp-8], rsi; we use local variable to store position of last parsed location

    mov rax, [rsi]
    cmp al, '-'
    je calculatefirstneg

    cmp al, '+'
    je calculatefirstplus

    JMP calculatewhile
calculatefirstneg:
    sub rsi, 8; we just skip first -
    mov [rbp-8], rsi
    mov r9,-1;and then we put -1 in r9
    JMP calculatewhile
calculatefirstplus:
    sub rsi, 8; we just skip first -
    mov [rbp-8], rsi
    JMP calculatewhile
calculatewhile:;eq while loop in pseudocode
    cmp rsi, rdi
    JB calculateend;exit if we reach the end
    ; mov [rbp-8], rsi; x=i
    ; push rsi
calculatefor:;eq for loop in pseudocode
    STD
    lodsq
    cmp al, '('
    JE calculateforendpara
    cmp al, '+'
    JE calculateforendadd
    cmp al, '-'
    JE calculateforendsub
    cmp al, '*'
    JE calculateforendmul
    cmp al, '/'
    JE calculateforenddiv
    cmp al,'a';a is only for ans
    JE calculateforendans
    cmp rsi, rdi
    JB calculateforend; we are at the end of line

    JMP calculatefor
calculateforend:

    add rsi, 8
    push rsi
    mov rsi,[rbp-8]

    ; push rdi
    push rsi
    call atoi;we have last result in rax

calculateforendend:
    call calculatesubfuncmuldiv

    call calculatesubfuncsubadd
    
    

    JMP calculateend
    

calculateforendmul:
    push rsi
    add rsi, 16
    push rsi;rsi is next rdi
    mov rsi,[rbp-8]

    push rsi
    call atoi;we have last result in rax

    call calculatesubfuncmuldiv
    
    pop rsi
    mov [rbp-8],rsi

    mov dl,0

    JMP calculatefor
calculateforenddiv:
    push rsi
    add rsi, 16
    push rsi;rsi is next rdi
    mov rsi,[rbp-8]

    push rsi
    call atoi;we have last result in rax

    call calculatesubfuncmuldiv
    
    pop rsi
    mov [rbp-8],rsi

    mov dl,1

    JMP calculatefor
calculateforendadd:
    push rsi
    add rsi, 16
    push rsi;rsi is next rdi
    mov rsi,[rbp-8]

    push rsi
    call atoi;we have last result in rax

    call calculatesubfuncmuldiv
    call calculatesubfuncsubadd
    
    pop rsi
    mov [rbp-8],rsi

    mov dh,0

    JMP calculatefor
calculateforendsub:
    push rsi
    add rsi, 16
    push rsi;rsi is next rdi
    mov rsi,[rbp-8]

    push rsi
    call atoi;we have last result in rax

    call calculatesubfuncmuldiv
    call calculatesubfuncsubadd
    
    pop rsi
    mov [rbp-8],rsi

    mov dh,1

    JMP calculatefor

calculateforendans:
    sub rsi,16
    push rsi
    mov rax,[ans]
    JMP calculatewithoutatioi

calculateforendpara:;we move until matched paranthesis and call the function recusrsively
    mov r8,1; r8 is our counter
    ; push rsi;we need to pop later
calculateforendparafor:
    cmp r8,0
    JE calculateforendparaforend
    STD
    lodsq
    cmp al, '('
    JE calculateforendparafor1
    cmp al, ')'
    JE calculateforendparafor2

    JMP calculateforendparafor
calculateforendparafor1:
    inc r8
    JMP calculateforendparafor
calculateforendparafor2:
    dec r8
    JMP calculateforendparafor
calculateforendparaforend:
    push rsi
    add rsi, 16
    push rsi;*aend for recurive
    mov rsi, [rbp-8]; int para case local var is start of expression
    ;*a
    sub rsi, 8; local var is at first par
    push rsi
    call calculate;we have result in paranthesis in rax
    
    ; call writeNum
    ; call newLine
calculatewithoutatioi:;i realized i can use the code from down here for ans
    pop rsi
    cmp rsi, rdi
    JB calculateforendend; we are at the end of line

    call calculatesubfuncmuldiv
    



    ; sub rsi,16
    STD 
    lodsq
    ;changing flags based on next sign
    mov dl,0
    cmp al, '*'
    ; cmove dl,0
    cmp al, '/'
    ; cmove dl,1
    sete dl

    cmp al, '+'
    JE calculateforendparaforendadd
    cmp al, '-'
    JE calculateforendparaforendsub
    JMP calculateforendparaforendend
calculateforendparaforendadd:
    call calculatesubfuncsubadd
    mov dh,0
    JMP calculateforendparaforendend
calculateforendparaforendsub:
    call calculatesubfuncsubadd
    mov dh,1
    JMP calculateforendparaforendend
calculateforendparaforendend:
    mov [rbp-8], rsi
    JMP calculatefor
calculatewhileend:
calculateend:
    mov rax,rbx
    pop r8
    pop r9
    pop rdx
    pop rbx
    pop rdi
    pop rsi
    leave 
    ret 16






_start:
    ; mov qword [ans],10
    mov rax, rsp
    sub rax, 8
    mov [s], rax ;saving top of stack to [s] we store our string in stack

mainwhile:
    mov rsp, [s]
    add rsp,8
getString:; gets an string and put it in stack
    call getc
    cmp al, 0xA
    JE getStringEnd
    cmp al, '&'
    JE Exit
    push rax
    JMP getString
getStringEnd:

    mov rsi, [s];start of string
    mov [sE], rsp
    mov rdi, rsp;end of string

    push rdi
    push rsi
    ; call atoi
    call calculate
    mov [ans],rax
    call writeNum
    call newLine
    JMP mainwhile
Exit:
    mov     rax,    1
    mov     rbx,    0
    ; push    rbx
    int     0x80