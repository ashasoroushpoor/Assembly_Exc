%include "in_out.asm"
    eightbit_reg db 'al',0,'cl',0,'dl',0,'bl',0,'ah',0,'ch',0,'dh',0,'bh',0,'$'
    sixteenbit_reg db 'ax',0,'cx',0,'dx',0,'bx',0,'sp',0,'bp',0,'si',0,'di',0,'$'
    thirtytwo_reg db 'eax',0,'ecx',0,'edx',0,'ebx',0,'esp',0,'ebp',0,'esi',0,'edi',0,'$'
    sixtyfour_reg db 'rax',0,'rcx',0,'rdx',0,'rbx',0,'rsp',0,'rbp',0,'rsi',0,'rdi',0,'$'
    neweight_reg db 'r8b',0,'r9b',0,'r10b',0,'r11b',0,'r12b',0,'r13b',0,'r14b',0,'r15b',0,'$'
    newsixteen_reg db 'r8w',0,'r9w',0,'r10w',0,'r11w',0,'r12w',0,'r13w',0,'r14w',0,'r15w',0,'$'
    newthirtytwo_reg db 'r8d',0,'r9d',0,'r10d',0,'r11d',0,'r12d',0,'r13d',0,'r14d',0,'r15d',0,'$'
    newsixtyfour_reg db 'r8',0,'r9',0,'r10',0,'r11',0,'r12',0,'r13',0,'r14',0,'r15',0,'$'
    new_registers db 'r8b',0,'r9b',0,'r10b',0,'r11b',0,'r12b',0,'r13b',0,'r14b',0,'r15b',0,'r8w',0,'r9w',0,'r10w',0,'r11w',0,'r12w',0,'r13w',0,'r14w',0,'r15w',0,'r8d',0,'r9d',0,'r10d',0,'r11d',0,'r12d',0,'r13d',0,'r14d',0,'r15d',0,'r8',0,'r9',0,'r10',0,'r11',0,'r12',0,'r13',0,'r14',0,'r15',0,'$'
    old_register_codesK db 'al',0,'ax',0,'eax',0,'rax',0,'cl',0,'cx',0,'ecx',0,'rcx',0,'dl',0,'dx',0,'edx',0,'rdx',0,'bl',0,'bx',0,'ebx',0,'rbx',0,'ah',0,'sp',0,'esp',0,'rsp',0,'ch',0,'bp',0,'ebp',0,'rbp',0,'dh',0,'si',0,'esi',0,'rsi',0,'bh',0,'di',0,'edi',0,'rdi',0,'$'
    old_register_codesV db '000',0,'000',0,'000',0,'000',0,'001',0,'001',0,'001',0,'001',0,'010',0,'010',0,'010',0,'010',0,'011',0,'011',0,'011',0,'011',0,'100',0,'100',0,'100',0,'100',0,'101',0,'101',0,'101',0,'101',0,'110',0,'110',0,'110',0,'110',0,'111',0,'111',0,'111',0,'111',0,'$'
    new_register_codesK db 'r8b',0,'r9b',0,'r10b',0,'r11b',0,'r12b',0,'r13b',0,'r14b',0,'r15b',0,'r8w',0,'r9w',0,'r10w',0,'r11w',0,'r12w',0,'r13w',0,'r14w',0,'r15w',0,'r8d',0,'r9d',0,'r10d',0,'r11d',0,'r12d',0,'r13d',0,'r14d',0,'r15d',0,'r8',0,'r9',0,'r10',0,'r11',0,'r12',0,'r13',0,'r14',0,'r15',0,'$'
    new_register_codesV db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    all_register_codesK db 'al',0,'ax',0,'eax',0,'rax',0,'cl',0,'cx',0,'ecx',0,'rcx',0,'dl',0,'dx',0,'edx',0,'rdx',0,'bl',0,'bx',0,'ebx',0,'rbx',0,'ah',0,'sp',0,'esp',0,'rsp',0,'ch',0,'bp',0,'ebp',0,'rbp',0,'dh',0,'si',0,'esi',0,'rsi',0,'bh',0,'di',0,'edi',0,'rdi',0,'r8b',0,'r9b',0,'r10b',0,'r11b',0,'r12b',0,'r13b',0,'r14b',0,'r15b',0,'r8w',0,'r9w',0,'r10w',0,'r11w',0,'r12w',0,'r13w',0,'r14w',0,'r15w',0,'r8d',0,'r9d',0,'r10d',0,'r11d',0,'r12d',0,'r13d',0,'r14d',0,'r15d',0,'r8',0,'r9',0,'r10',0,'r11',0,'r12',0,'r13',0,'r14',0,'r15',0,'$'
    all_register_codesV db '000',0,'000',0,'000',0,'000',0,'001',0,'001',0,'001',0,'001',0,'010',0,'010',0,'010',0,'010',0,'011',0,'011',0,'011',0,'011',0,'100',0,'100',0,'100',0,'100',0,'101',0,'101',0,'101',0,'101',0,'110',0,'110',0,'110',0,'110',0,'111',0,'111',0,'111',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    tttn_codesK db 'o',0,'no',0,'b',0,'nae',0,'nb',0,'ae',0,'e',0,'z',0,'ne',0,'nz',0,'be',0,'na',0,'a',0,'nbe',0,'s',0,'ns',0,'p',0,'pe',0,'np',0,'po',0,'l',0,'nge',0,'nl',0,'ge',0,'le',0,'ng',0,'nle',0,'g',0,'$'
    tttn_codesV db '0000',0,'0001',0,'0010',0,'0010',0,'0011',0,'0011',0,'0100',0,'0100',0,'0101',0,'0101',0,'0110',0,'0100',0,'0111',0,'0111',0,'1000',0,'1001',0,'1010',0,'1010',0,'1011',0,'1011',0,'1100',0,'1100',0,'1101',0,'1101',0,'1110',0,'1110',0,'1111',0,'1111',0,'$'


    error_create    db     "error in creating file       ", NL, 0
    error_close     db     "error in closing file        ", NL, 0
    error_write     db     "error in writing file        ", NL, 0
    error_open      db     "error in opening file        ", NL, 0
    error_append    db     "error in appending file      ", NL, 0
    error_delete    db     "error in deleting file       ", NL, 0
    error_read      db     "error in reading file        ", NL, 0
    error_print     db     "error in printing file       ", NL, 0
    error_seek      db     "error in seeking file        ", NL, 0
    error_getdent   db     "error in getting directory entries ", NL, 0
    error_chdir     db     "error in chdir", NL, 0
    error_mkdirat   db "error in creating directory", NL, 0

    suces_create   db      "file created and opened for R/W ", NL, 0
    suces_close    db      "file closed                     ", NL, 0
    suces_write    db      "written to file                 ", NL, 0
    suces_open     db      "file opend for R/W              ", NL, 0
    suces_open_RO     db      "file opend for ReadOnly              ", NL, 0
    suces_append   db      "file opened for appending       ", NL, 0
    suces_delete   db      "file deleted                    ", NL, 0
    suces_read     db      "reading file                    ", NL, 0
    suces_seek     db      "seeking file                    ", NL, 0
    suces_getdent  db      "directory entries have been read", NL, 0
    suces_chdir     db      "directory changed", NL, 0
    suces_mkdirat   db      "directory created", NL, 0

    bytestr db 'BYTE',0
    wordstr db 'WORD',0
    dwordstr db 'DWORD',0
    qwordstr db 'QWORD',0
    pt db 'PTR',0
    star db '*',0
    plus db '+',0
    bracko db '[',0
    brackc db ']',0
    ;11111111111111111111111111111111
    zero db '0',0
    one db '1', 0
    tst1 db '[ebx]',0
    tst2 db '1001001',0
    tst3 db '1',0
    tst4 db 'ab*cde+fgh',0
section .data
    Msg	db	'Hello World',	0

section .bss
    testbuffer resb 100
    slicebuffer resb 100
    CHBbuffer resb 100
    rexbuffer resb 100
    prefixbuffer resb 100
    scalerbuffer resb 100
    madbuffer resb 100
    madarg1 resb 100
    dispbuffer resb 100
    immbuffer resb 100
    splitbuffer1 resb 100
    splitbuffer2 resb 100
    madinxbuffer resb 100
    madbasebuffer resb 100
    madmodbuffer resb 3
    testbuffer1 resq 1
section .text
    global _start

;eq means notin and noteq means in
;a notin b(arr)
%macro notin 2
    mov rax, %1
    push rax
    mov rax, %2
    push rax
    call FindValueArr

    cmp rax, -1
%endmacro
;c[a,b]
%macro slice 3
    push rax

    mov rax, %1
    push rax
    mov rax, %2
    push rax
    mov rax, %3
    push rax
    call SliceString

    pop rax
%endmacro

%macro len 1
    push rdi

    mov rdi, %1
    call GetStrlen

    pop rdi
%endmacro
;movstring null terminated
%macro movsz 2
    push rdi
    push rsi

    mov rsi, %1
    mov rdi, %2
    call MoveString
    mov byte [rdi],0

    pop rsi
    pop rdi
%endmacro
%macro movs 2
    push rdi
    push rsi

    mov rsi, %1
    mov rdi, %2
    call MoveString

    pop rsi
    pop rdi
%endmacro
;if first string in second equal else not equal
%macro notinss 2
    push rax

    mov rax, %1
    push rax
    mov rax, %2
    push rax
    call SearchPattern

    cmp rax, -1
    pop rax
%endmacro
;dictfinc a(k),b(v),c = a[c]*
%macro dictfind 3
    mov rax, %3
    push rax
    mov rax, %2
    push rax
    mov rax, %1
    push rax

    call GetValue
%endmacro

%macro split 2
    push rdi
    push rsi
    push rdx

    mov rax, %1
    push rax
    mov rax, %2
    push rax
    call SearchPattern

    cmp rax, -1
    je %%splitend

    mov rdx, 0
    push rdx
    push rax
    mov rdx, %2
    push rdx
    call SliceString
    
    mov rsi, slicebuffer
    mov rdi, splitbuffer1
    call MoveString

    mov byte [rdi], 0

    len %2
    inc rax
    push rax
    push rdx
    mov rdx, %2
    push rdx
    call SliceString

    mov rsi, slicebuffer
    mov rdi, splitbuffer2
    call MoveString

    mov byte [rdi], 0
%%splitend:
    pop rdx
    pop rsi
    pop rdi
%endmacro
;forn 3, {add rax,2},nop
%macro forn 3
    push rcx
    mov rcx, %1
    %%fornj:
        cmp rcx, 0
        jle %%fornext
        %2
        %3
        dec rcx
        jmp %%fornj
    %%fornext:
    pop rcx
%endmacro
;count star, arg
%macro count 2
    push rsi
    push rbx

    mov bl, %1
    xor rcx, rcx
    mov rsi, %2

    %%countloop:
        cmp byte [rsi], 0
        je %%countloopend
        cmp [rsi], bl
        jne %%countloopexc
        inc rcx
        %%countloopexc:
        inc rsi
        jmp %%countloop
    %%countloopend:
    pop rbx
    pop rsi
%endmacro
;!---------------------------syscalls----------------------------------
;----------------------------------------------------
; rdi : file name; rsi : file permission
createFile:
    mov     rax, sys_create
    mov     rsi, sys_IRUSR | sys_IWUSR 
    syscall
    cmp     rax, -1   ; file descriptor in rax
    jle     createerror
    mov     rsi, suces_create           
    call    printString
    ret
createerror:
    mov     rsi, error_create
    call    printString
    ret
;----------------------------------------------------
; rdi : file name; rsi : file access mode 
; rdx: file permission, do not need
openFile:
    mov     rax, sys_open
    mov     rsi, O_RDWR
    ; mov     rsi, O_RDONLY      
    syscall
    cmp     rax, -1   ; file descriptor in rax
    jle     openerror
    mov     rsi, suces_open
    call    printString
    ret
openerror:
    call writeNum
    mov     rsi, error_open
    call    printString
    ret
;----------------------------------------------------

; rdi: point to directory name
changeDir:
    mov rax, 0x50
    syscall
    cmp rax, -1
    jle changeDirerror
    mov rsi,suces_chdir
    call printString
    ret
changeDirerror:
    mov rsi, error_chdir
    call printString
    ret
;----------------------------------------------------
; rdi : file descriptor ; rsi : buffer ; rdx : length
writeFile:
    mov     rax, sys_write
    syscall
    cmp     rax, -1         ; number of written byte
    jle     writeerror
    ; mov     rsi, suces_write
    ; call    printString
    ret
writeerror:
    mov     rsi, error_write
    call    printString
    ret
;----------------------------------------------------
; rdi : file descriptor ; rsi : buffer ; rdx : length
readFile:
    mov     rax, sys_read
    syscall
    cmp     rax, -1           ; number of read byte
    jle     readerror
    mov     byte [rsi+rax], 0 ; add a  zero
    ; mov     rsi, suces_read
    ; call    printString
    ret
readerror:
    mov     rsi, error_read
    call    printString
    ret
;----------------------------------------------------
; rdi : file descriptor
closeFile:
    mov     rax, sys_close
    syscall
    cmp     rax, -1      ; 0 successful
    jle     closeerror
    mov     rsi, suces_close
    call    printString
    ret
closeerror:
    call writeNum
    mov     rsi, error_close
    call    printString
    ret
;----------------------------------------------------
; rdi : file descriptor ; rsi: offset ; rdx : whence
seekFile:
    mov     rax, sys_lseek
    syscall
    cmp     rax, -1
    jle     seekerror
    mov     rsi, suces_seek
    call    printString
    ret
seekerror:
    mov     rsi, error_seek
    call    printString
    ret
;----------------------------------------------------

;!----------------------file manuplation-------------------!;
ReadLine:
    ;gets a buffer in stack and file descriptor in rdi and puts a line in buffer
    ;replace rdi with -1 if it reached EOF
    Enter 0,0
RLA:
    push rdi
    mov rdx, 1;length
    mov rsi, [rbp+16];buffer
    call readFile
    pop rdi;FD

    mov rsi, [rbp+16]
    cmp byte [rsi], NL
    je RLnewline

    ; cmp byte [rsi], EOF
    cmp rax, 0
    je RLeof

    inc rsi
    mov [rbp+16], rsi

    jmp RLA
RLAext:

RLnewline:
    mov byte [rsi], 0
    jmp ReadLineExit
RLeof:
    mov byte [rsi],0
    mov rdi, -1
    jmp ReadLineExit
ReadLineExit:
    Leave
    ret 8

WriteBuffer:
    ;buffer in stack FD in rdi
    Enter 0,0
WBA:
    mov rsi, [rbp+16]
    cmp byte [rsi], 0
    je WBAext

    push rdi
    mov rdx, 1;length
    mov rsi, [rbp+16];buffer
    call writeFile
    pop rdi;FD

    mov rsi, [rbp+16]
    cmp byte [rsi], 0
    je WBAext


    inc rsi
    mov [rbp+16], rsi

    jmp WBA
WBAext:
WriteBufferExit:
    Leave
    ret 8

getdirname:
    Enter 0,0
    push rax
    push rbx
    push rsi
    mov rbx,[rbp+16]
    ; mov rbx, filename
getdirnameloop:
    call getc
    cmp al, NL
    je getdirnameloopExt
    mov [rbx], al
    inc rbx
    jmp getdirnameloop
getdirnameloopExt:
    mov [rbx],BYTE 0
    ; mov al, [dirname]
    ; call putc
    ; call newLine
getdirnameExt:
    pop rsi
    pop rbx
    pop rax
    leave
    ret 8
;!----------------------Dict and string manuplation--------!;
;lets make some terminology for ease of read and write
;functions are uppercamel case and jump points are defined by the uppercase at first for example
;GetValue is a function and jump points are GV*:
GetValue:
    ;function gets a dictionary keys and dictionary values and a key* and searches
    ;returns the value pointer (*) in rax
    ;* Order of args 16:keys, 24:vals, 32:key*
    Enter 8,0
    push rsi
    push rdi
    push rdx
    mov rsi, [rbp+16];keys
    mov rdi, [rbp+24];vals
    mov rdx, [rbp+32];key*

GVloop1:
    cmp byte [rsi], '$'
    je GVnotfound

    push rdx
    push rsi
    call MatchString

    cmp rax, 0
    je GVloop1Ext

    push rsi
    call EndOfString
    mov rsi, rax
    inc rsi

    push rdi
    call EndOfString
    mov rdi,rax
    inc rdi

    jmp GVloop1
GVloop1Ext:
    mov rax, rdi
    jmp GetValueExit
GVnotfound:
    mov rax, -1
    jmp GetValueExit

GetValueExit:
    pop rdx
    pop rdi
    pop rsi
    Leave
    ret 24
GetValueArr:
    ; returns index of start of variable in said index
    ; returns pointer in rax
    ;* Order of args 16: arr* pointer 24: index
    Enter 0,0

    push rsi
    ; push rax
    push rcx

    mov rsi, [rbp+16]
    mov rcx, [rbp+24]
GVAloop1:
    cmp rcx, 0
    je GVAloop1ext

    push rsi
    call EndOfString
    mov rsi, rax
    inc rsi

    dec rcx
    jmp GVAloop1
GVAloop1ext:
    mov rax, rsi
GetValueArrExit:

    pop rcx
    ; pop rax
    pop rsi
    Leave
    ret 16
CheckLength:
    ;check variables have same length or not
    ;in rax 0 if same 1 if rdi<rsi, -1 if rsi<rdi
    Enter 0,0

    push rsi
    push rdi

    mov rsi, [rbp+16]
    mov rdi, [rbp+24]

CLloop1:
    cmp byte [rdi], 0
    jne CL1
    cmp byte [rsi], 0
    jne CLrd;rdi<rsi
    jmp CLtrue
CL1:
    cmp byte [rsi], 0
    je CLrs;rsi<rdi

    inc rdi
    inc rsi
    jmp CLloop1
CLloop1ext:

CLrs:
    mov rax, -1
    jmp CheckLengthExit
CLrd:
    mov rax, 1
    jmp CheckLengthExit
CLtrue:
    mov rax, 0
    jmp CheckLengthExit
CheckLengthExit:
    pop rdi
    pop rsi
    Leave
    ret 16
FindValueArr:
    ; finds variable and returns index in case of not found returns -1
    ; returns index in rax
    ;* Order of args 16: arr* pointer 24: a* pointer
    Enter 0,0
    push rsi
    push rdi

    mov rsi, [rbp+16]
    mov rdi, [rbp+24]
    xor rax, rax
FVAloop1:
    cmp byte [rsi], '$'
    je FVAnotfound

    push rax;!

    push rdi
    push rsi
    call MatchString

    cmp rax, 0
    je FVAloop1ext
FVA1:
    push rsi
    call EndOfString
    mov rsi, rax
    inc rsi

    pop rax;!

    inc rax

    jmp FVAloop1
FVAloop1ext:
    push rsi
    push rdi
    call CheckLength
    cmp rax, 0
    jne FVA1

    pop rax
    jmp FindValueArrExit
FVAnotfound:
    mov rax, -1

    jmp FindValueArrExit

FindValueArrExit:
    pop rdi
    pop rsi
    Leave
    ret 16
ClearBuffer:
    ;gets a buffer and resets it's 100 bytes
    
    Enter 0,0
    push rcx
    push rsi

    mov rsi, [rbp+16]
    mov rcx, 25

CB1:
    mov dword [rsi], 0
    add rsi, 4
    dec rcx

    cmp rcx, 0
    jg CB1
ClearBufferExit:

    pop rsi
    pop rcx
    Leave
    ret 8

ResetBuffers:
    Enter 0,0
    ; push rax

    ; mov rax, ratempbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, convssdispbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, convertsibbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, sibrestempbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, sibdissbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, raarg1
    ; push rax
    ; call ClearBuffer

    ; mov rax, raarg2
    ; push rax
    ; call ClearBuffer

    ; mov rax, rabuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, paargopcode
    ; push rax
    ; call ClearBuffer

    ; mov rax, parserbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, patempbuffer
    ; push rax
    ; call ClearBuffer

    ; mov rax, paoperation
    ; push rax
    ; call ClearBuffer
ResetBuffersExit:
    pop rax
    Leave
    ret 0
EndOfString:
    ; gets string pointer and procedes it until it finds 0
    ; returns in rax
    Enter 0,0
    push rsi
    mov rsi,[rbp+16]
    inc rsi
EOSloop1:   
    cmp byte [rsi],0
    je EOSloop1Ext
    inc rsi
    jmp EOSloop1
EOSloop1Ext:
    mov rax, rsi
EndOfStringExit:
    pop rsi
    Leave
    ret 8

MoveString:;!same acronynm as MatchString
    ;gets two pointer in rsi and rdi where rsi is null terminated
    ; movs rsi into rdi
    ;!only rdi changes
    Enter 0,0
    push rax
    push rcx
    push rsi
    ; push rdi

    xor rax, rax
MoveStringloop:
    cmp byte [rsi], 0
    je MoveStringloopExt
    movsb
    jmp MoveStringloop

MoveStringloopExt:
MoveStringExit:
    ; pop rdi
    pop rsi
    pop rcx
    pop rax
    Leave
    ret 0
MatchString:
    ;gets point to two strings A* and B* returns 0 if A* was in begening of B* and returns -1 if at the end of string
    ;other wise returns next location in B* that has same characater as A* begening position
    ; we also return index in rcx 
    ;*order of args 16:B*, 24:A*
    Enter 8,0
    push rsi
    push rdi

    mov rsi,[rbp+16];B*
    mov rdi, [rbp+24];A*
    xor rcx,rcx


    mov al,[rdi]
    cmp al, [rsi]
    jne MSloop2
    inc rdi
    inc rsi
    inc rcx
MSloop1:;looking for the word while has'nt found starting position yet
    push rdi
    mov rdi,[rbp+24];A*
    ;!cmp [rdi], [rsi]
    mov al,[rdi]
    cmp al, [rsi]
    je MSloop1Ext;we found next starting position but haven't found a match
    pop rdi

    mov al,[rdi]
    cmp al, [rsi]
    je MSloop1eq
    jne MSloop1neq
MSloop1eq:
    cmp byte [rdi], 0
    je MSfound

    inc rsi
    inc rdi
    inc rcx
    jmp MSloop1
MSloop1neq:
    cmp BYTE [rdi], 0
    je MSfound
    cmp BYTE [rsi], 0
    je MSnotfoundend
    jmp MSloop2start
MSloop1Ext:
    ;we found next starting position
    pop rdi;we jumped and didn't pop
    mov [rbp-8], rsi
    jmp MSloop3

MSloop2start:;haven't found next starting position but there is no match
;we are looking for next starting position
    mov rdi,[rbp+24];A*[0]

MSloop2:
    ;! cmp [rsi],[rdi]
    mov al,[rdi]
    cmp al, [rsi]
    je MSloop2Ext
    cmp byte [rsi],0
    je MSnotfoundend
    inc rsi
    inc rcx
    jmp MSloop2
MSloop2Ext:
    mov [rbp-8], rsi
    jmp MSnotfound

MSloop3:
;we have found the starting position but we don't know yet if there is a match or not
    ;! cmp [rdi],[rsi]
    mov al,[rdi]
    cmp al, [rsi]
    je MSloop3eq
    jne MSloop3neq
MSloop3eq:
    cmp byte [rdi], 0
    je MSfound
    inc rdi
    inc rsi
    ; inc rcx 
    jmp MSloop3
MSloop3neq:
    cmp byte [rdi], 0
    je MSfound
    cmp byte [rsi], 0
    je MSnotfoundend
    jmp MSnotfound
MSloop3Ext:
MSfound:
    mov rax, 0
    jmp MatchStringExit
MSnotfound:
    mov rax, [rbp-8]
    jmp MatchStringExit
MSnotfoundend:
    mov rax, -1
    jmp MatchStringExit
MatchStringExit:
    pop rdi
    pop rsi
    Leave
    ret 16

SearchPattern:
    ;gets two string pointer searchs first occurence of 
    ;returns it's index in rax
    ;if there is no match return -1
    Enter 0,0
    push rdx
    push rsi
    push rdi

    mov rsi,[rbp+16];B*
    mov rdi, [rbp+24];A*

    xor rdx, rdx

SPloop1:;!rcx is return index
    push rdi
    push rsi
    call MatchString

    cmp rax,0
    je SPfound
    
    cmp rax, -1
    je SPnotfound

    add rdx, rcx
    add rsi, rcx
    jmp SPloop1
SPloop1Ext:

SPfound:
    mov rax, rdx
    jmp SearchPatternExit
SPnotfound:
    mov rax, -1
    jmp SearchPatternExit
SearchPatternExit:
    pop rdi
    pop rsi
    pop rdx
    Leave
    ret 16

StringInString:
    ;searchs if A* is in B*
    Enter 0,0

StringInStringExit:
    Leave
    ret 16
SliceString:
    ;ok here's the tricky part
    ;this function gets a s* pointer and 2 indexes and slice the string
    ;and puts it into slice buffer as a null ended string
    ;we use it for slice and compare
    ;* Order of args 16:S*, 24:j, 32:i
    Enter 0,0
    push rdi
    push rsi
    push rdx
    push rax

    mov byte [slicebuffer],0

    mov rdi, slicebuffer
    mov rsi, [rbp+16]
    mov rdx, [rbp+32]
    
    add rsi, rdx;mov string starting postition to i

    mov rdx, [rbp+24]
    sub rdx, [rbp+32]

    cmp rdx, 0
    jle SliceStringExit
SSloop1:
    ; mov byte [rdi], byte [rsi]
    mov al, [rsi]
    mov [rdi], al
    inc rdi
    inc rsi
    dec rdx
    cmp rdx, 0
    jne SSloop1
SSloop1Ext:
    mov byte [rdi],0

SliceStringExit:
    pop rax
    pop rdx
    pop rsi
    pop rdi
    Leave
    ret 24

ConveryHxtoBin:
    ;gets pointer to string and 
    ;puts result in CHBbuffer
    Enter 0,0
    push rax
    push rcx
    push rdx
    push rsi
    push rdi

    mov rsi, [rbp+16]
    mov rdi, CHBbuffer

CHBloop1:
    mov rcx, 3
    mov al, [rsi]
    cmp al, 'A'
    jge CHBloop1char
    jmp CHBloop1num
CHBloop1num:
    sub al, '0'
    jmp CHBloop2
CHBloop1char:
    sub al, 'A'
    add al, 10
    jmp CHBloop2
CHBloop2:
    mov dl, '0'
    BT rax, rcx
    jc CHBloop2one
    jmp CHBloop2zero
CHBloop2one:
    inc dl
CHBloop2zero:
    mov [rdi], dl
    inc rdi
    dec rcx
    cmp rcx, 0
    jge CHBloop2
CHBloop2Ext:
    inc rsi
    cmp byte [rsi], 0
    jne CHBloop1
CHBloop1Ext:
    mov byte [rdi],0
ConveryHxtoBinExit:
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rax
    Leave
    ret 8

ConvertImm:
    Enter 0,0
ConvertImmExit:
    Leave
    ret 8
;!-------------------------code----------------------------!;

;!not tested
SetW:
    ;gets a pointer to null ended string
    ;and return '0' or '1' as a pointer in rax
    ;* 16: pointer
    Enter 0,0
    push rsi
    
    mov rsi, [rbp+16]
;   if arg in eightbit_reg or arg in neweight_reg:
;         return '0'
;     else:
;         return '1'
    notin rsi, eightbit_reg
    je SW1;check other if
    jne SW2;if succ
SW1:
    notin rsi, neweight_reg
    je SW3; if fail
    jmp SW2; if succ
SW2:
    mov rax, zero
    jmp SetWExit
SW3:
    mov rax, one
    jmp SetWExit
SetWExit:
    pop rsi
    Leave
    ret 8

SetWbySize:
    Enter 0,0
    ;* argsize: 16
    ; if argsize == 0:
    ;     return '0'
    ; else:
    ;     return '1'

    
    cmp word [rbp+16], 0
    je SWS1
    jmp SWS2
SWS1:
    mov rax, zero
    jmp SetWbySizeExit
SWS2:
    mov rax, one
    jmp SetWbySizeExit
SetWbySizeExit:
    Leave
    ret 2
;!not tested
SetS:
    Enter 0,0
    ;* 16: immsize(word), 18:destsize(word)
    ; if(immdeiate_size == 0 and dest_size != 0):
    ;     return "1"
    ; else:
    ;     return "0"
    cmp word [rbp+16], 0
    jne SS2
    cmp word [rbp+18], 0
    jne SS2
    jmp SS1
SS1:
    mov rax, one
    jmp SetSExit
SS2:
    mov rax, zero
    jmp SetSExit
SetSExit:
    Leave
    ret 4
;!not tested
RexGeneratorTwo:
    Enter 0,0
    ;sets rexbuffer
    ;*Order of args, 16:arg1*, 24:arg2*, 32:operand size(word), 34: x*
    push rax
    push rsi
    ; x* == 0 then uses default '0'
    mov rax, [rbp+34]
    cmp rax, 0
    jne RGT1
    mov rax, zero
    mov [rbp+34], rax
RGT1:
    ; res = '0100'

    mov dword [rexbuffer], '0100'
    lea rsi, [rexbuffer+4]

    ; if operand_size == 3:  # w
    ;     res += '1'
    ; else:
    ;     res += '0'
RGTA1:
    mov ax, [rbp+32]
    cmp ax, 3
    jne RGTA2

    mov byte [rsi], '1'
    inc rsi

    jmp RGTAext
RGTA2:

    mov byte [rsi], '0'
    inc rsi

    jmp RGTAext
RGTAext:

    ; if arg2 in new_registers:  # R
    ;     res += '1'
    ; else:
    ;     res += '0'
RGTB1:
    mov rax, [rbp+24]
    notin rax, new_registers
    je RGTB2

    mov byte [rsi], '1'
    inc rsi
    jmp RGTBext
RGTB2:
    mov byte [rsi], '0'
    inc rsi
    jmp RGTBext
RGTBext:
    ; res += x
    mov rax, [rbp+34]
    mov al, [rax]
    mov byte [rsi], al
    inc rsi
    ; if arg1 in new_registers:  # B
    ;     res += '1'
    ; else:
    ;     res += '0'
RGTC1:
    mov rax, [rbp+16]
    notin rax, new_registers
    je RGTC2

    mov byte [rsi], '1'
    inc rsi
    jmp RGTCext
RGTC2:
    mov byte [rsi], '0'
    inc rsi
    jmp RGTCext
RGTCext:
    mov byte [rsi],0
RexGeneratorTwoExit:
    pop rsi
    pop rax
    Leave
    ret 26
;!not tested
ReXGeneratorThree:
    Enter 0,0
    ;*args: 16:arg1, 24:rexxb, 32:operand size(word)
    ;rexxb is pointer to one or zero
    push rax
    push rsi
    ; res = '0100'
    mov dword [rexbuffer], '0100'
    lea rsi, [rexbuffer+4]
    ; if operand_size == 3:
    ;     res += '1'
    ; else:
    ;     res += '0'
RXGTA1:
    cmp word [rbp+32], 3
    jne RXGTA2

    mov byte [rsi], '1'
    inc rsi
    jmp RXGTAext
RXGTA2:
    mov byte [rsi], '0'
    inc rsi
    jmp RXGTAext
RXGTAext:

;    if arg1 in new_registers:
;         res += '1'
;     else:
;         res += '0'
RXGTB1:
    mov rax, [rbp+16]
    notin rax, new_registers
    je RXGTB2

    mov byte [rsi], '1'
    inc rsi
    jmp RXGTBext
RXGTB2:
    mov byte [rsi], '0'
    inc rsi
    jmp RXGTBext
RXGTBext:

    mov rax, [rbp+24]
    mov al, [rax]
    mov [rsi], al

    inc rsi
    mov byte [rsi],0
RexGeneratorThreeExit:
    pop rsi
    pop rax
    Leave
    ret 18

IsAcc:
    ;if the arg is accumulator returns 0 in rax 1 otherwise
    ;* 16: arg*
    Enter 0,0
    push rsi
    ; if arg == "rax" or arg == "eax" or arg == "ax" or arg == "al":
    ;     return True
    ; else:
    ;     return False
    mov rsi, [rbp+16]
    cmp word [rsi], 'al'
    je IATrue
    cmp word [rsi], 'ax'
    je IATrue
    cmp word [rsi+1], 'ax'
    je IATrue
    jmp IAfalse

IATrue:
    mov rax, 1
    jmp IsAccExit
IAfalse:
    mov rax, 0
    jmp IsAccExit
IsAccExit:
    pop rsi
    Leave
    ret 8
IsBP:
    ;if the arg is accumulator returns 0 in rax 1 otherwise
    ;* 16: arg*
    Enter 0,0
    push rsi
    ;if(arg1 == "rbp" or arg1 == "ebp" or arg1 == "bp" or arg1 == "bh"):
    ;     return True
    ; else:
    ;     return False
    mov rsi, [rbp+16]
    cmp word [rsi], 'bh'
    je IBPTrue
    cmp word [rsi], 'bp'
    je IBPTrue
    cmp word [rsi+1], 'bp'
    je IBPTrue
    jmp IBPfalse

IBPTrue:
    mov rax, 1
    jmp IsBPExit
IBPfalse:
    mov rax, 0
    jmp IsBPExit
IsBPExit:
    pop rsi
    Leave
    ret 8
IsSP:
    ;if the arg is accumulator returns 0 in rax 1 otherwise
    ;* 16: arg*
    Enter 0,0
    push rsi
    ;if(arg1 == "rsp" or arg1 == "esp" or arg1 == "sp" or arg1 == "ah"):
    ;     return True
    ; else:
    ;     return False
    mov rsi, [rbp+16]
    cmp word [rsi], 'ah'
    je ISPTrue
    cmp word [rsi], 'sp'
    je ISPTrue
    cmp word [rsi+1], 'sp'
    je ISPTrue
    jmp ISPfalse

ISPTrue:
    mov rax, 1
    jmp IsSPExit
ISPfalse:
    mov rax, 0
    jmp IsSPExit
IsSPExit:
    pop rsi
    Leave
    ret 8

ArgumentType:
    Enter 0,0
    ;returns argument type in ax
    ;return argument size bx
    ;* 16:arg*
    push rsi
    push rdx

    mov rsi, [rbp+16]
ATA1:
    ; if arg in sixtyfour_reg:
    notin rsi,sixtyfour_reg
    je ATA2

    mov ax, 0
    mov bx, 3
    jmp ATAext
ATA2:
    ; elif arg in thirtytwo_reg:
    notin rsi,thirtytwo_reg
    je ATA3

    mov ax, 0
    mov bx, 2
    jmp ATAext
ATA3:
    ; elif arg in sixteenbit_reg:
    notin rsi,sixteenbit_reg
    je ATA4

    mov ax, 0
    mov bx, 1
    jmp ATAext
ATA4:
    ; elif arg in eightbit_reg:
    notin rsi,eightbit_reg
    je ATA5

    mov ax, 0
    mov bx, 0
    jmp ATAext
ATA5:
    ; elif arg in newsixtyfour_reg:
    notin rsi,newsixtyfour_reg
    je ATA6

    mov ax, 1
    mov bx, 3
    jmp ATAext
ATA6:
    ; elif arg in newthirtytwo_reg:
    notin rsi,newthirtytwo_reg
    je ATA7

    mov ax, 1
    mov bx, 2
    jmp ATAext
ATA7:
    ; elif arg in newsixteen_reg:
    notin rsi,newsixteen_reg
    je ATA8

    mov ax, 1
    mov bx, 1
    jmp ATAext
ATA8:
    ; elif arg in neweight_reg:
    notin rsi,neweight_reg
    je ATA9
    
    mov ax, 1
    mov bx, 0
    jmp ATAext
ATA9:
    ; elif arg.startswith('QWORD'):
    cmp dword [rsi], 'QWOR'
    jne ATA10
    cmp byte [rsi+4], 'D'
    jne ATA10

    mov ax, 2
    mov bx, 3   
    jmp ATAext
ATA10:
    ; elif arg.startswith('DWORD'):
    cmp dword [rsi], 'DWOR'
    jne ATA11
    cmp byte [rsi+4], 'D'
    jne ATA11

    mov ax, 2
    mov bx, 2
    jmp ATAext
ATA11:
    ; elif arg.startswith('WORD'):
    cmp dword [rsi], 'WORD'
    jne ATA12

    mov ax, 2
    mov bx, 1
    jmp ATAext
ATA12:
    ; elif arg.startswith('BYTE'):
    cmp dword [rsi], 'BYTE'
    jne ATA13

    mov ax, 2
    mov bx, 0
    jmp ATAext
ATA13:
    ;else
    mov ax, 3
    cmp word [rsi], '0x'
    jne ATAext;!we don't handle decimals for now

    push rdi
    mov rdi, rsi
    add rdi, 2
    call GetStrlen
    pop rdi;length in rdx

ATB1:
    cmp rdx, 2
    jg ATB2

    mov bx, 0
    jmp ATBext
ATB2:
    cmp rdx, 4
    jg ATB3

    mov bx, 1
    jmp ATBext
ATB3:
    cmp rdx, 8
    jg ATB4

    mov bx, 2
    jmp ATBext
ATB4:

    mov bx,3
    jmp ATBext

ATBext:
ATAext:
ArgumentTypeExit:
    pop rdx
    pop rsi
    Leave
    ret 8
;!not tested
PRefix:
    ;sets prefix in prefixbuffer
    ;*args 16: operandsize(word), 18:operandsize
    Enter 0,0
    push rsi
    ; if(address_size == 2):  # addr size = 32: 67
    ;     res += '01100111'
    ; if(operand_size == 1):  # operand size 16:66
    ;     res += '01100110'
    mov rsi, prefixbuffer
    mov byte [rsi], 0

    cmp word [rbp+16], 2
    jne PR1

    mov dword [rsi], '0110'
    add rsi, 4
    mov dword [rsi], '0111'
    add rsi, 4
PR1:
    cmp word [rbp+18], 1
    jne PR2

    mov dword [rsi], '0110'
    add rsi, 4
    mov dword [rsi], '0110'
    add rsi, 4
PR2:
    mov byte [rsi], 0
PRefixExit:
    pop rsi
    Leave
    ret 4
;!not tested
SCaler:
    ;* Order of args 16:scale (word)(pointer to one char)
    ;sets scalerbuffer
    Enter 0,0
    push rsi
    ; code = '00'
    ; if scale == "8":
    ;     code = '11'
    ; elif scale == "4":
    ;     code = "10"
    ; elif scale == "2":
    ;     code = "01"
    ; elif scale == "1":
    ;     code = "00"
    mov byte [scalerbuffer+2], 0
    mov word [scalerbuffer], '00'

    mov rsi, [rbp+16]
SC1:
    cmp byte [rsi], '8'
    jne SC2

    mov word [scalerbuffer], '11'
SC2:
    cmp byte [rsi], '4'
    jne SC3

    mov word [scalerbuffer], '10'
SC3:
    cmp byte [rsi], '2'
    jne SC4

    mov word [scalerbuffer], '01'
SC4:
SCalerExit:
    pop rsi
    Leave
    ret 2
ConvertAddressSize:
    Enter 0,0
    ;*args 16: name*(doesn't hav to be null terminated)
    ;returns in ax
    push rsi
    ; if(sizeName == 'BYTE'):
    ;     return 0
    ; elif(sizeName == 'WORD'):
    ;     return 1
    ; elif(sizeName == 'DWORD'):
    ;     return 2
    ; elif(sizeName == 'QWORD'):
    ;     return 3
    mov rsi, [rbp+16]
CAS1:
    cmp dword [rsi], 'BYTE'
    jne CAS2

    mov ax, 0
    jmp CASext
CAS2:
    cmp dword [rsi], 'WORD'
    jne CAS3

    mov ax, 1
    jmp CASext
CAS3:
    cmp dword [rsi], 'DWOR'
    jne CAS4
    cmp byte [rsi+4], 'D'
    jne CAS4

    mov ax, 2
    jmp CASext
CAS4:
    cmp dword [rsi], 'QWOR'
    jne CASext
    cmp byte [rsi+4], 'D'
    jne CASext

    mov ax, 3
    jmp CASext
CASext:
ConvertAddressSizeExit:
    pop rsi
    Leave
    ret 8

HexChartoBin:
    Enter 0,0
    ;gets in al a char returns the number
    cmp al, 'A'
    jge HCB2
    jmp HCB1
HCB1:
    sub al, '0'
    jmp HexChartoBinExit
HCB2:
    sub al, 'A'
    add al, 10
    jmp HexChartoBinExit
HexChartoBinExit:
    Leave
    ret 0

WriteBinaryRdi:
    Enter 0,0
    ;gets a binary in al write it into rdi without changing it
    push rbx
    mov dword [rdi], '0000'
    mov bl, al
    shr bl, 3
    and bl, 1
    add byte [rdi], bl
    mov bl, al
    shr bl, 2
    and bl, 1
    add byte [rdi+1], bl
    mov bl, al
    shr bl, 1
    and bl, 1
    add byte [rdi+2], bl
    mov bl, al
    and bl, 1
    add byte [rdi+3], bl
WriteBinaryRdiExit:
    pop rbx
    Leave
    ret 0
DIsplacement:
    Enter 0,0
    ;*order of args 16: hexnumber*, 24:ttbit(word)
    ;sets lowbyte representation in disp buffer
    push rsi
    push rdi
    push rax
    push rdx

    mov rsi, [rbp+16]
    mov rdi, dispbuffer

    ; if(len(disp) > 2):
    ;     ttbit = True
    len rsi
    cmp rdx, 4;0x counted
    jle DI1
    mov ax, 1
    mov [rbp-24], ax
    jmp DI2
DI1:
    ; elif(bin(int(disp, 16))[2:].zfill(8)[0] == "1"):  # the else is important
    ;     # print(bin(int(disp, 16)))
    ;     ttbit = True
    cmp rdx, 3;it has one char so the end is 0000
    je DI2
    mov al, [rsi+2]
    call HexChartoBin
    shr al, 3
    cmp al, 1
    jne DI2

    mov ax, 1
    mov word [rbp-24], ax
DI2:
    push rsi
    call EndOfString
    mov rsi, rax

    xor rdx, rdx
DIloop1:
    cmp word [rsi-2], '0x'
    je DIloop1ext;this is 0x(8*x) case

    cmp byte [rsi-2], 'x'
    je DIloop1exc;this is 0x(4bit)(8*x) case

    sub rsi,2
    mov al, [rsi]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    inc rdx

    mov al, [rsi+1]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    inc rdx

    jmp DIloop1
DIloop1exc:
    mov al, 0;zfill(8)
    call WriteBinaryRdi
    add rdi, 4
    inc rdx

    sub rsi,1
    mov al, [rsi]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    inc rdx

DIloop1ext:
    cmp word [rbp-24], 0
    je DI3
DIloop2:
    cmp rdx, 8
    jge DIloop2ext

    mov al, 0;zfill(8)
    call WriteBinaryRdi
    add rdi, 4
    inc rdx

    jmp DIloop2
DIloop2ext:
DI3:
    mov byte [rdi], 0
DIsplacementExit:
    pop rdx
    pop rax
    pop rdi
    pop rsi
    Leave
    ret 10

ConvertImmediate:
    ;* 16:imm*, 24:size(word)
    Enter 0,0
    push rsi
    push rdi
    push rax
    push rdx

    mov rsi, [rbp+16]

    len rsi
CIA1:
    ;if(len(imm) > 4 and size < 2):
    cmp rdx, 6
    jle CIA2
    cmp word [rbp+24], 2
    jge CIA2

    mov ax, 3
    mov [rbp+24], ax
    jmp CIAext
CIA2:
    ; elif(len(imm) > 2 and size < 1):
    cmp rdx, 4
    jle CIAext
    cmp word [rbp+24], 1
    jge CIA2

    mov ax, 2
    mov [rbp+24], ax
    jmp CIAext
CIAext:

CIB1:
    cmp word [rbp+24], 0
    jne CIB2

    mov rdx, 2 ;zfill 8
    jmp CIext
CIB2:
    cmp word [rbp+24], 1
    jne CIB3

    mov rdx, 4;zfill 16
    jmp CIext
CIB3:
    mov rdx, 8;zfill 32
    jmp CIext
CIext:

    mov rdi, immbuffer
    mov rsi, [rbp+16]

    push rsi
    call EndOfString
    mov rsi, rax
CIloop1:
    cmp word [rsi-2], '0x'
    je CIloop1ext;this is 0x(8*x) case

    cmp byte [rsi-2], 'x'
    je CIloop1ext;this is 0x(4bit)(8*x) case

    sub rsi,2
    mov al, [rsi]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    dec rdx

    mov al, [rsi+1]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    dec rdx

    jmp CIloop1
CIloop1exc:;!maybe bug
    mov al, 0;zfill(8)
    call WriteBinaryRdi
    add rdi, 4
    dec rdx

    sub rsi,1
    mov al, [rsi]
    call HexChartoBin
    call WriteBinaryRdi
    add rdi, 4
    dec rdx
CIloop1ext:

CIloop2:
    cmp rdx,0
    jle CIloop2ext

    mov al, 0;zfill(8)
    call WriteBinaryRdi
    add rdi, 4
    dec rdx

    jmp CIloop2
CIloop2ext:
    mov byte [rdi], 0
ConvertImmediateExit:

    pop rdx
    pop rax
    pop rdi
    pop rsi
    Leave
    ret 10

MemmoryADdress:
    Enter 18,0
    ;sets madbuffer
    ;*args 16:arg1(nullterminated), 24:arg2code(nullterminated)
    ;*vars 8:rexx*, 16:rexb*, 18:addrsize(word)
    push rsi
    push rdi
    push rax
    push rdx
    push rcx
    ; arg1 = arg1[1:-1]
    len [rbp+16]
    dec rdx
    slice 1,rdx,[rbp+16];arg1[1:-1]
    movsz slicebuffer, madarg1;mov the result into buffer

    ; rexx = '0'
    mov qword [rbp-8], zero
    ; rexb = '0'
    mov qword [rbp-16], zero
    ; addrSize = 0
    mov word [rbp-18], 0

MADA1:
    ; if('*' not in arg1 and '+' not in arg1 and arg1[0:2] == "0x"):
    notinss star, madarg1
    jne MADA2
    notinss plus, madarg1
    jne MADA2
    cmp word [madarg1], '0x'
    jne MADA2

    mov rdi, madbuffer
    mov word [rdi], '00'
    add rdi, 2

    mov rsi, [rbp+24];code += arg2code
    call MoveString

    mov dword [rdi], '1000'
    add rdi, 4
    mov dword [rdi], '0100'
    add rdi, 4
    mov word [rdi], '10'
    add rdi, 2
    mov byte [rdi], '1'
    inc rdi
    
    ;code += displacement(arg1, True)
    mov ax, 1
    push ax
    mov rax, madarg1
    push rax
    call DIsplacement

    movsz dispbuffer, rdi;!null terminated

    jmp MADAext
MADA2:
    ;elif('*' not in arg1 and '+' not in arg1):  # simple register case
    notinss star, madarg1
    jne MADA3
    notinss plus, madarg1
    jne MADA3

    
MADB1:
    ;if(arg1 == "rbp" or arg1 == "ebp" or arg1 == "bp" or arg1 == "bh"):

    mov rax, madarg1
    push rax
    call IsBP
    cmp rax, 0
    je MADB2

    ;code = "01" + arg2code + "101" + "0000" + "0000"

    mov rdi, madbuffer
    mov word [rdi], '01'
    add rdi, 2

    mov rsi, [rbp+24];code += arg2code
    call MoveString

    mov rdi, madbuffer
    mov word [rdi], '01'
    add rdi, 2
    mov rdi, madbuffer
    mov byte [rdi], '1'
    inc rdi

    mov dword [rdi], '0000'
    add rdi,4
    mov dword [rdi], '0000'
    add rdi,4

    jmp MADBext
MADB2:
    ;elif(arg1 == "rsp" or arg1 == "esp" or arg1 == "sp" or arg1 == "ah"):

    mov rax, madarg1
    push rax
    call IsSP
    cmp rax, 0
    je MADB3

    ;code = "00" + arg2code + "100" + "00" + "100" + "100"

    mov rdi, madbuffer
    mov word [rdi], '00'
    add rdi, 2

    mov rsi, [rbp+24];code += arg2code
    call MoveString

    mov rdi, madbuffer
    mov word [rdi], '10'
    add rdi, 2
    mov rdi, madbuffer
    mov byte [rdi], '0'
    inc rdi

    mov dword [rdi], '0010'
    add rdi,4
    mov dword [rdi], '0100'
    add rdi,4

    jmp MADBext
MADB3:

    ;code = "00" + arg2code + all_register_codes[arg1]

    mov rdi, madbuffer
    mov word [rdi], '00'
    add rdi, 2

    mov rsi, [rbp+24];code += arg2code
    call MoveString

    dictfind all_register_codesK,all_register_codesV,madarg1

    mov rsi, rax
    call MoveString

    ; if(arg1 in new_registers):
    ;             rexb = '1'
    notin madarg1, new_registers
    je MADB3_1
    ; rexx = '1'
    mov qword [rbp-16], one
MADB3_1:
    jmp MADBext
MADBext:

    ; addrSize = argument_type(arg1)[1]
    push rbx
    mov rsi, madarg1
    push rsi
    call ArgumentType
    ; addrSize
    mov word [rbp-18], bx
    pop rbx

    jmp MADAext
MADA3:
    ;elif('*' in arg1 and "+" not in arg1):  # [arg*scale] case

    notinss star, madarg1
    je MADA4
    notinss plus, madarg1
    jne MADA4
    ; inx, scale = arg1.split('*')
    split star, madarg1
    ; code = "00" + arg2code + "100" + \
    ; scaler(scale) + all_register_codes[inx] + "101" + "0000" + \
    ; "0000" + "0000" + "0000" + "0000" + "0000" + "0000" + "0000"
    mov rdi, madbuffer
    mov word [rdi], '00'
    add rdi, 2

    mov rsi, [rbp+24];code += arg2code
    call MoveString

    mov word [rdi], '10'
    mov byte [rdi+2], '0'
    add rdi, 3

    mov rax, splitbuffer2
    push rax
    call SCaler

    mov rsi, scalerbuffer
    call MoveString

    mov word [rdi], '10'
    mov byte [rdi+2], '1'
    add rdi, 3

    forn 8, {mov dword [rdi], '0000'}, {add rdi, 4}

    ; if(inx in new_registers):
    ;         rexx = '1'
    notin splitbuffer1, new_registers
    je MADA3_1
    ; rexx = '1'
    mov qword [rbp-16], one
MADA3_1:
    ; addrSize = argument_type(inx)[1]
    push rbx
    mov rsi, splitbuffer1
    push rsi
    call ArgumentType
    ; addrSize
    mov word [rbp-18], bx
    pop rbx

    jmp MADAext
MADA4:
    ;elif(arg1.count('+') == 2):
    count '+',madarg1
    cmp rcx, 2
    jne MADA5
    ; base, inx, disp = arg1.split('+')
 
    split plus, madarg1
    movsz splitbuffer1, madbasebuffer
    movsz splitbuffer2, madinxbuffer
    split plus, madinxbuffer
    movsz splitbuffer1, madinxbuffer;disp is in splitbuffer2

    mov ax, 0
    push ax
    mov rax, splitbuffer2
    push rax
    call DIsplacement

    mov byte [madmodbuffer+2], 0

    mov word [madmodbuffer], '00'
    ; mod = "00"
    ;     if(len(disp)-2 <= 2 and bin(int(disp, 16))[2:].zfill(8)[0] != "1"):
    ;         mod = "01"
    ;     else:
    ;         mod = "10"
    len splitbuffer2
    cmp rdx, 4
    jg MADA4_1

    cmp rdx, 3;it has one char so the end is 0000
    je MADA4_0
    mov al, [rsi+2]
    call HexChartoBin
    shr al, 3
    cmp al, 1
    jne MADA4_0
    jmp MADA4_1
MADA4_0:
    mov word [madmodbuffer], '01'
    jmp MADA4_2
MADA4_1:
    mov word [madmodbuffer], '10'
    jmp MADA4_2
MADA4_2:
    ; code = mod + arg2code + "100" + \
    ;         scaler(scale) + \
    ;         all_register_codes[inx] + \
    ;         all_register_codes[base] + displacement(disp)
    mov rdi, madbuffer
    movs madmodbuffer, rdi
    movs [rbp+24], rdi
    
    mov word[rdi], '10'
    mov byte[rdi+2],'0'
    add rdi,3

    ;     if("*" in inx):
    ;         inx, scale = inx.split('*')
    ;     else:
    ;         scale = "1"

    notinss star, madinxbuffer
    je MADA4_3
    split star, madinxbuffer
    movsz splitbuffer1, madinxbuffer
    jmp MADA4_4
MADA4_3:
    mov byte[splitbuffer2],'1'
    mov byte[splitbuffer2+1],0
MADA4_4:
    mov rax, splitbuffer2
    push rax
    call SCaler

    movs scalerbuffer, rdi

    dictfind all_register_codesK,all_register_codesV,madinxbuffer
    movs rax, rdi

    dictfind all_register_codesK,all_register_codesV,madbasebuffer
    movs rax, rdi

    movsz dispbuffer, rdi
    jmp MADAext
MADA5:
    ;elif('*' in arg1 and arg1.count('+') == 1):
    notinss star, madarg1
    je MADA6
    count '+',madarg1
    cmp rcx, 1
    jne MADA6

    jmp MADAext
MADA6:
    jmp MADAext
MADA7:
    jmp MADAext
MADAext:


MemmoryADdressExit:
    pop rcx
    pop rdx
    pop rax
    pop rdi
    pop rsi
    Leave
    ret 16

test:
    Enter 0,0

    len [rbp+16]
    dec rdx
    slice 1,rdx,[rbp+16]
testExit:
    Leave
    ret 8
_start:
    mov	rsi,	Msg
    call	printString
    call newLine

    ; notin tst1, tttn_codesV
    ; mov rax, tst1
    ; push rax
    ; mov rax, tttn_codesV
    ; push rax
    ; call FindValueArr

    ; slice 1,2,tst3
    ; mov rax, tst3
    ; push rax
    ; mov rax, tst1
    ; push rax
    ; call SearchPattern
    

    ; mov rax, tst2
    ; push rax
    ; mov rax, tst1
    ; push rax
    ; call MemmoryADdress
    ; mov rsi, madbuffer
    ; call printString
    
    ; split star,tst4

    ; mov rsi, splitbuffer1
    ; call printString
    ; call newLine
    ; mov rsi,splitbuffer2
    ; call printString

    ; mov rdi, testbuffer
    ; forn 8, {mov dword [rdi], '0dd0'}, {add rdi, 4}

    ; mov rsi,testbuffer
    ; call printString

    count '0',tst2
    mov rax, rcx
    call writeNum 
Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall