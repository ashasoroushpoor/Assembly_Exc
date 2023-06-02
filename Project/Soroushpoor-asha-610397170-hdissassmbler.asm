%include "in_out.asm"
    EOF equ 0x05
section .data
    Msg	db	'Hello World',	0
    ;K is for keys and V is for values
    eightBit_coderegK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    eightBit_coderegV db 'al',0,'cl',0,'dl',0,'bl',0,'ah',0,'ch',0,'dh',0,'bh',0,'$'
    eightBit_codereg_newK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    eightBit_codereg_newV db 'r8b',0,'r9b',0,'r10b',0,'r11b',0,'r12b',0,'r13b',0,'r14b',0,'r15b',0,'$'
    sixteenBit_coderegK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    sixteenBit_coderegV db 'ax',0,'cx',0,'dx',0,'bx',0,'sp',0,'bp',0,'si',0,'di',0,'$'
    sixteenBit_codereg_newK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    sixteenBit_codereg_newV db 'r8w',0,'r9w',0,'r10w',0,'r11w',0,'r12w',0,'r13w',0,'r14w',0,'r15w',0,'$'
    thirtytwoBit_coderegK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    thirtytwoBit_coderegV db 'eax',0,'ecx',0,'edx',0,'ebx',0,'esp',0,'ebp',0,'esi',0,'edi',0,'$'
    thirtytwoBit_codereg_newK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    thirtytwoBit_codereg_newV db 'r8d',0,'r9d',0,'r10d',0,'r11d',0,'r12d',0,'r13d',0,'r14d',0,'r15d',0,'$'
    sixtyfourBit_coderegK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    sixtyfourBit_coderegV db 'rax',0,'rcx',0,'rdx',0,'rbx',0,'rsp',0,'rbp',0,'rsi',0,'rdi',0,'$'
    sixtyfourBit_codereg_newK db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    sixtyfourBit_codereg_newV db 'r8',0,'r9',0,'r10',0,'r11',0,'r12',0,'r13',0,'r14',0,'r15',0,'$'
    opcode_normalK db '100010',0,'000000',0,'000100',0,'001010',0,'000110',0,'001000',0,'000010',0,'001100',0,'001110',0,'$'
    opcode_normalV db 'mov',0,'add',0,'adc',0,'sub',0,'sbb',0,'and',0,'or',0,'xor',0,'cmp',0,'$'
    opcode_accK db '0010010',0,'0000110',0,'0011010',0,'1010100',0,'0011110',0,'$'
    opcode_accV db 'and',0,'or',0,'xor',0,'test',0,'cmp',0,'$'
    opcode_imm_100000K db '000',0,'001',0,'010',0,'011',0,'100',0,'101',0,'110',0,'111',0,'$'
    opcode_imm_100000V db 'add',0,'or',0,'adc',0,'sbb',0,'and',0,'sub',0,'xor',0,'cmp',0,'$'
    opcode_111111K db '000',0,'001',0,'$'
    opcode_111111V db 'inc',0,'dec',0,'$'
    opcode_111101K db '011',0,'010',0,'000',0,'111',0,'$'
    opcode_111101V db 'neg',0,'not',0,'test',0,'idiv',0,'$'
    opcode_constK db '11111001',0,'11111000',0,'11111101',0,'11111100',0,'11000010',0,'$'
    opcode_constV db 'stc',0,'clc',0,'std',0,'cld',0,'ret',0,'$'
    opcode_alternateK db '01011',0,'01010',0,'$'
    opcode_alternateV db 'pop',0,'push',0,'$'
    opcode_0fK db '10111100',0,'10111101',0,'10101111',0,'00000101',0,'10000000',0,'10000001',0,'10000010',0,'10000011',0,'10000100',0,'10000101',0,'10000110',0,'10000111',0,'10001000',0,'10001001',0,'10001010',0,'10001011',0,'10001100',0,'10001101',0,'10001110',0,'10001111',0,'$'
    opcode_0fV db 'bsf',0,'bsr',0,'imul',0,'syscall',0,'jo',0,'jno',0,'jb',0,'jnb',0,'jz',0,'jnz',0,'jbe',0,'jnbe',0,'js',0,'jns',0,'jp',0,'jnp',0,'jl',0,'jnl',0,'jle',0,'jnle',0,'$'

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
    ;11111111111111111111111111111111
    tst1 db '1010010111111111111111111111111111111111',0
    tst2 db '1111111011011100',0
    tst3 db '1010010111111111111111111111111111111111',0
    tst4 db '011001101111011111011011',0
section .bss
    temp1 resb 1000;temp buffer for SD function
    rexw resb 2
    rexr resb 2
    rexb resb 2
    rexx resb 2
    convssbuffer resb 1
    convssdispbuffer resb 100
    slicebuffer resb 100
    convertsibbuffer resb 100
    CHBbuffer resb 100
    sibrestempbuffer resb 100
    sibdissbuffer resb 100
    raarg1 resb 100
    raarg2 resb 100
    rabuffer resb 100
    modd resb 3
    paargopcode resb 100
    ratempbuffer resb 100;tempbuffer for RA function
    parserbuffer resb 100
    patempbuffer resb 100
    paoperation resb 100

    filename resb 100
    outputname resb 100
    inputbuffer resb 100
    codebuffer resb 100

    fileDescriptor resq 1
    fileDescriptorW resq 1
section .text
    global _start
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
    push rax

    mov rax, ratempbuffer
    push rax
    call ClearBuffer

    mov rax, convssdispbuffer
    push rax
    call ClearBuffer

    mov rax, convertsibbuffer
    push rax
    call ClearBuffer

    mov rax, sibrestempbuffer
    push rax
    call ClearBuffer

    mov rax, sibdissbuffer
    push rax
    call ClearBuffer

    mov rax, raarg1
    push rax
    call ClearBuffer

    mov rax, raarg2
    push rax
    call ClearBuffer

    mov rax, rabuffer
    push rax
    call ClearBuffer

    mov rax, paargopcode
    push rax
    call ClearBuffer

    mov rax, parserbuffer
    push rax
    call ClearBuffer

    mov rax, patempbuffer
    push rax
    call ClearBuffer

    mov rax, paoperation
    push rax
    call ClearBuffer
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
RexDissassemble:
    ;gets a pointer to rex part and values rexw, rexr, rexb, rexx
    Enter 0,0
    push rsi
    push rax

    mov word [rexw],0
    mov word [rexr],0
    mov word [rexb],0
    mov word [rexx],0
    mov rsi, [rbp+16]

    add rsi, 4
    mov al, [rsi]
    cmp al, '1'
    jne RD1
    mov word [rexw], 1
RD1:
    inc rsi
    mov al, [rsi]
    cmp al, '1'
    jne RD2
    mov word [rexr], 1
RD2:
    inc rsi
    mov al, [rsi]
    cmp al, '1'
    jne RD3
    mov word [rexx], 1
RD3:
    inc rsi
    mov al, [rsi]
    cmp al, '1'
    jne RD4
    mov word [rexb], 1
RD4:
RexDissassembleExit:
    pop rax
    pop rsi
    Leave
    ret 8

ConvertReg:
    ;convertReg(code, new, size):
    ;convert register code into binary represantation
    ;returns pointer to string in rax as getvalue
    ;* Order of args 16:null ended string of code, 24:new(word), 26:size(word)
    Enter 0,0
    push rsi
    ; push rax
    push rbx
    ; push rdx

    mov rsi, [rbp+16]
    mov ax, [rbp+24]
    mov bx, [rbp+26]
    cmp bx, 0
    je CRsize0
    cmp bx, 1
    je CRsize1
    cmp bx, 2
    je CRsize2
    cmp bx, 3
    je CRsize3
    jmp ConvertRegExit
CRsize0:;!important note we are done with rax now and we can call GV without worries
    cmp ax, 1
    je CRnew0
    push rsi
    mov rax,eightBit_coderegV
    push rax
    mov rax, eightBit_coderegK
    push rax
    call GetValue
    jmp CRendcond
CRnew0:
    push rsi
    mov rax,eightBit_codereg_newV
    push rax
    mov rax, eightBit_codereg_newK
    push rax
    call GetValue
    jmp CRendcond
CRsize1:
    cmp ax, 1
    je CRnew1
    push rsi
    mov rax, sixteenBit_coderegV
    push rax
    mov rax,sixteenBit_coderegK
    push rax
    call GetValue
    jmp CRendcond
CRnew1:
    push rsi
    mov rax, sixteenBit_codereg_newV
    push rax
    mov rax,sixteenBit_codereg_newK
    push rax
    call GetValue
    jmp CRendcond
CRsize2:
    cmp ax, 1
    je CRnew2
    push rsi
    mov rax, thirtytwoBit_coderegV
    push rax
    mov rax,thirtytwoBit_coderegK
    push rax
    call GetValue
    jmp CRendcond
CRnew2:
    push rsi
    mov rax, thirtytwoBit_codereg_newV
    push rax
    mov rax,thirtytwoBit_codereg_newK
    push rax
    call GetValue
    jmp CRendcond
CRsize3:
    cmp ax, 1
    je CRnew3
    push rsi
    mov rax, sixtyfourBit_coderegV
    push rax
    mov rax,sixtyfourBit_coderegK
    push rax
    call GetValue
    jmp CRendcond
CRnew3:
    push rsi
    mov rax, sixtyfourBit_codereg_newV
    push rax
    mov rax,sixtyfourBit_codereg_newK
    push rax
    call GetValue
    jmp CRendcond
CRendcond:
    
ConvertRegExit:
    pop rbx
    pop rsi
    Leave
    ret 12
;!not tested
ConvertOpsize:
    ;gets the size as 16bit register and returns it's memory
    ;returns prefix string as null ended (const)string address in rax
    ;* Order of args 16:opsize(16bit)
    Enter 0,0

    mov ax, [rbp+16]
    cmp ax, 0
    je CO0
    cmp ax, 1
    je CO1
    cmp ax, 2
    je CO2
    cmp ax, 3
    je CO3
CO0:
    mov rax ,bytestr
    jmp COcondend
CO1:
    mov rax ,wordstr
    jmp COcondend
CO2:
    mov rax ,dwordstr
    jmp COcondend
CO3:
    mov rax ,qwordstr
    jmp COcondend
COcondend:
ConvertOpsizeExit:
    Leave
    ret 2
;!not tested
GiveSize:
    ;returns addrsize in bx and opsize in ax
    ;* Order of args 16:rexw, 18:w, 20:prefix_66, 22:prefix_67 (all 16bits)
    Enter 0,0
    push r8
    push r9
    push r10
    push r11

    xor r8, r8
    xor r9, r9
    xor r10, r10
    xor r11, r11
    mov r8b, [rbp+16];rexw
    mov r9b, [rbp+18];w
    mov r10b, [rbp+20];66
    mov r11b, [rbp+22];67

    cmp r9b, 0
    je GSO1
    cmp r10b, 1
    je GSO2
    cmp r8b, 1
    je GSO3
    jmp GSO4
GSO1:
    mov ax, 0
    jmp GSOext
GSO2:
    mov ax, 1
    jmp GSOext
GSO3:
    mov ax, 3
    jmp GSOext
GSO4:
    mov ax, 2
    jmp GSOext
GSOext:
    cmp r11b, 1
    je GSA1
    jmp GSA2
GSA1:
    mov bx, 2
    jmp GSAext
GSA2:
    mov bx, 3
    jmp GSAext
GSAext:
GiveSizeExit:
    pop r11
    pop r10
    pop r9
    pop r8
    Leave
    ret 8
;!not tested
ConvSs:
    ;gets pointer to a length2 string
    ;sets the result in convssbuffer as onebyte string
    Enter 0,0
    ; if(ss == '00'):
    ;     return '1'
    ; elif(ss == '01'):
    ;     return '2'
    ; elif(ss == '10'):
    ;     return '4'
    ; elif(ss == '11'):
    ;     return '8'
    mov rsi, [rbp+16]
    mov al, [rsi]
    cmp al, '0'
    je CS1
    jmp CS3
CS1:
    inc rsi
    mov al, [rsi]
    cmp al, '1'
    je CS2

    mov byte [convssbuffer], '1'
    jmp CSext
CS2:
    mov byte [convssbuffer], '2'
    jmp CSext
CS3:
    inc rsi
    mov al, [rsi]
    cmp al, '1'
    je CS4

    mov byte [convssbuffer], '4'
    jmp CSext
CS4:
    mov byte [convssbuffer], '8'
    jmp CSext
CSext:
ConvSsExit:
    Leave
    ret 8

ConvertDisp:;!convert binary to hex
    ;gets a pointer to null ended string and converts it 
    ;into 0x(hex) in convssdispbuffer
    ;* args 16: pointer to string
    Enter 0,0
    push rax
    push rdx
    push rcx
    push rbx
    push r9
    push rsi
    push rdi
    ;algorithm: converts each 4bits into a number and sets the value
    mov rdi, [rbp+16]
    call GetStrlen; len to rdx
    mov rbx, rdx
    ; mov rax, rdx
    ; xor rdx, rdx
    ; mov rcx, 4
    ; div rcx;len%4 in rdx

    mov rsi, [rbp+16]
    push rsi
    call EndOfString
    mov rsi, rax
    sub rsi, 8

    mov rdi, convssdispbuffer

    mov byte [rdi], '0'
    inc rdi
    mov byte [rdi], 'x'
    inc rdi

    ; mov rcx, rdx
    ; cmp rcx,0
    ; jne CDcc
    mov rcx, 4
    mov r9, 2
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
    dec rbx
    cmp rcx, 0
    jne CDloop2
CDloop2Ext:
    dec r9

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
    cmp r9, 0
    jne CDFF
    sub rsi, 16
    mov r9, 2 
CDFF:
    cmp rbx,0
    jne CDloop1
CDloop1Ext:
    mov byte [rdi], 0
ConvertDispExit:
    pop rdi
    pop rsi
    pop r9
    pop rbx
    pop rcx
    pop rdx
    pop rax
    Leave
    ret 8

SibDissassmble:
    ;ok let's hope this works
    ; we get a pointer to sib part of string hopefully we know what is in each position
    ;we also get a pointer to (mod) part of string
    ; then we also have opsize, addrsize, rexx and rexb as 16bit values
    ;we evaluate sibpart and put it as nullterminated string in [convertsibbuffer]
    ;* Order of args 16:code*, 24:mode*, 32:opsize(16bit), 34:addrsize(16bit), 36: rexx(16bit), 38:rexb(16bit)
    ; ss_code = code[0:2]
    ; inx_code = code[2:5]
    ; base_code = code[5:8]
    ;* r8 is temp register
    Enter 0,0

    push rsi
    push rdi
    push r8
    push rax

    mov byte [convssdispbuffer], 0
    ;if it still null means we didn't find displacement

    mov rsi, [rbp +24];mod*
    
    cmp word [rsi], '01'
    je SDA1
    cmp word [rsi], '10'
    je SDA2
    jmp SDAext
SDA1:
    ; disp = convertDisp(code[8:16])
    mov r8,8
    push r8
    mov r8, 16
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString
    
    mov r8, slicebuffer
    push r8
    call ConvertDisp
    jmp SDAext
SDA2:
    mov r8,8
    push r8
    mov r8, 40
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString
    
    mov r8, slicebuffer
    push r8
    call ConvertDisp
    jmp SDAext
SDAext:;!!!!!!!!!!!!!!!!!!!!!!!!!!
SDB1:
    ; if(mod == "00" and code[0:8] == '00100101'):
    mov rsi, [rbp +24];mod*
    cmp word [rsi], '00'
    jne SDB2
    mov rsi, [rbp +16];code*
    cmp dword [rsi], '0010'
    jne SDB2
    add rsi, 4
    cmp dword [rsi], '0101'
    jne SDB2

    mov r8,8
    push r8
    mov r8, 40
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString
    
    mov r8, slicebuffer
    push r8
    call ConvertDisp

    ;res = '['+disp+']'
    mov rdi, sibrestempbuffer
    mov byte [rdi], '['
    inc rdi
    ; mov rsi,slicebuffer
    mov rsi, convssdispbuffer
    call MoveString
    mov byte [rdi], ']'
    inc rdi
    mov byte [rdi], 0

    jmp SDBext
SDB2:
    ; elif(inx_code == "100" and base_code == "100"):
    ; translates to code[2:8] == 100100
    mov rsi, [rbp +16];code*
    add rsi, 2
    cmp dword [rsi], '1001'
    jne SDB3
    add rsi, 4
    cmp word [rsi], '00'
    jne SDB3

    mov rdi, sibrestempbuffer
    mov byte [rdi], '['
    ; base = convertReg('101', 0, addrsize)  # rbp
    
    mov r8w, [rbp+34];addrsize
    push r8w
    mov r8, 0
    push r8w
    mov r8, temp1
    mov word [r8], '10'
    mov byte [r8+2], '0'
    mov byte [r8+3], 0
    push r8
    call ConvertReg

    ; res = '[' + base + '+' + inx + '*' + ss + '+' + disp + ']'
    inc rdi
    mov rsi, rax;pointer to base
    call MoveString

    mov rsi, convssdispbuffer
    cmp byte [rsi], 0
    je SDB2if
    mov byte [rdi], '+'
    inc rdi
    call MoveString
SDB2if:
    mov byte [rdi], ']'
    inc rdi
    mov byte [rdi], 0
    jmp SDBext
SDB3:
    ; elif(base_code == '101'):
    mov rsi, [rbp +16];code*
    add rsi, 5
    cmp word [rsi], '10'
    jne SDB4
    add rsi, 2
    cmp byte [rsi], '1'
    jne SDB4
    ; ss_code = code[0:2]
    mov rdi, [rbp +16];code*
    push rdi
    call ConvSs;converted ss in convssbuffer as one byte

    ; inx_code = code[2:5]
    mov r8, 2
    push r8
    mov r8, 5
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString

    ; inx = convertReg(inx_code, rexx, addrsize)
    
    mov r8w, [rbp+34];addrsize
    push r8w
    mov r8w, [rbp+36];rexx
    push r8w
    mov r8, slicebuffer
    push r8
    call ConvertReg;inx* in rax

    mov rdi, [rbp+24];mod*
    cmp word [rdi] , '00'
    je SDB31
    jmp SDB32
    
SDB31:
    mov r8,8
    push r8
    mov r8, 40
    push r8
    mov r8,[rbp+16];code*
    push r8
    call SliceString

    mov r8, slicebuffer
    push r8
    call ConvertDisp

    ;res = '[' + inx + '*' + ss + '+' + disp + ']'
    mov rdi, sibrestempbuffer
    mov byte [rdi], '['
    inc rdi
    mov rsi, rax;pointer to inx
    call MoveString

    mov byte [rdi], '*'

    inc rdi
    mov r8b, [convssbuffer]
    mov byte [rdi], r8b

    inc rdi
    mov byte [rdi], '+'

    inc rdi
    mov rsi, convssdispbuffer
    call MoveString
    
    mov byte [rdi], ']'
    inc rdi
    mov byte [rdi],0

    jmp SDBext;!assuming we are done
SDB32:
    push rax;push inx because we need to fill rax with base

    ; base = convertReg('101', 0, addrsize)  # rbp
    
    mov r8w, [rbp+34];addrsize
    push r8w
    mov r8, 0
    push r8w
    mov r8, temp1
    mov word [r8], '10'
    mov byte [r8+2], '1'
    mov byte [r8+3], 0
    push r8
    call ConvertReg

    ; res = '[' + base + '+' + inx + '*' + ss + '+' + disp + ']'
    mov rdi, sibrestempbuffer
    mov byte [rdi], '['
    inc rdi
    mov rsi, rax;pointer to base
    call MoveString

    mov byte [rdi], '+'

    inc rdi
    pop rsi;we pushed inx* and now we pop it
    call MoveString

    mov byte [rdi], '*'

    inc rdi
    mov r8b, [convssbuffer]
    mov byte [rdi], r8b

    inc rdi
    mov byte [rdi], '+'

    inc rdi
    mov rsi, convssdispbuffer
    call MoveString
    
    mov byte [rdi], ']'
    inc rdi
    mov byte [rdi],0

    jmp SDBext
SDB4:
    ; ss_code = code[0:2]
    mov rdi, [rbp +16];code*
    push rdi
    call ConvSs;converted ss in convssbuffer as one byte

    ; inx_code = code[2:5]
    mov r8, 2
    push r8
    mov r8, 5
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString

    ; inx = convertReg(inx_code, rexx, addrsize)
    mov r8w, [rbp+34];addrsize
    push r8w
    mov r8w, [rbp+36];rexx
    push r8w
    mov r8, slicebuffer
    push r8
    call ConvertReg;inx* in rax

    push rax; save inx* for later

    ; base_code = code[5:8]
    mov r8, 5
    push r8
    mov r8, 8
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString
; base = convertReg(base_code, rexb, addrsize)

    mov r8w, [rbp+34];addrsize
    push r8w
    mov r8w, [rbp+38];rexx
    push r8w
    mov r8, slicebuffer
    push r8
    call ConvertReg;base* in rax

; res = '['+base+'+'+inx+'*'+ss
    mov rdi, sibrestempbuffer

    mov byte [rdi], '['

    inc rdi
    mov rsi, rax
    call MoveString

    mov byte [rdi],'+'

    inc rdi
    pop rsi; last rax we poped now its inx*
    call MoveString

    mov byte [rdi], '*'

    inc rdi
    mov r8b, [convssbuffer]
    mov byte [rdi], r8b
    inc rdi
    ;if(disp != ''): res += '+'+disp+']'
    ;else:res += ']'
    cmp byte [convssdispbuffer], 0
    je SDB42
    ; jmp SDB41
SDB41:
    mov byte [rdi], '+'

    inc rdi
    mov rsi,convssdispbuffer
    call MoveString

SDB42:
    mov byte [rdi], ']'
    inc rdi
    mov byte [rdi], 0
SDBext:
    mov r8w, [rbp+32]
    push r8w
    call ConvertOpsize

    mov rdi, convertsibbuffer
    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '
    
    inc rdi
    mov rsi, pt
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov rsi, sibrestempbuffer
    call MoveString
SibDissassmbleExit:

    pop rax
    pop r8
    pop rdi
    pop rsi
    Leave
    ret 24

RegisterAddress:
    Enter 0,0
    ;gets the register/addres part of the code and disassemble it
    ;* Order of args 16:code*, 24: d(word), 26:opsize(word), 28: addrsize(word)
    ;* 30:rexr(word), 32:rexx(word), 34: rexb(word)
    ; mod = code[0:2]
    ; reg_code = code[2:5]
    ; rm = code[5:8]
    ;code = code[8:]
    push rsi
    push rdi
    push r8
    push rax
    ;we just mov mod cause we need to pass it as null terminated string
    mov r8, [rbp+16]
    mov ax, [r8]
    mov [modd], ax
    mov byte [modd+2], 0
    ; arg1 = convertReg(reg_code, rexr, opsize)
    mov r8,2
    push r8
    mov r8, 5
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice reg_code part

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put reg_code into tempbuffer

    mov byte [rdi],0;just for this

    mov r8w, [rbp+26];opsize
    push r8w
    mov r8w, [rbp+30];rexr
    push r8w
    mov r8, ratempbuffer
    push r8
    call ConvertReg;convert the damn register
    
    mov rsi, rax
    mov rdi, raarg1
    call MoveString;put it in arg1 buffer

    mov byte [rdi], 0
RAA1:
    ;if(rm == '100' and mod != '11'):
    mov r8, [rbp+16];!!!!!!!!!
    cmp word [r8+5], '10'
    jne RAA2
    cmp byte [r8+7], '0'
    jne RAA2
    cmp word [modd], '11'
    je RAA2

    ; arg2= sibDisassemble(
    ;         code, mod, opsize, addrsize, rexx, rexb)
    mov r8w, [rbp+34];rexb
    push r8w
    mov r8w, [rbp+32];rexx
    push r8w
    mov r8w, [rbp+28];addrsize
    push r8w
    mov r8w, [rbp+26];opsize
    push r8w
    mov r8, modd
    push r8
    mov r8, [rbp+16]
    add r8, 8;code = code[8:]
    push r8
    call SibDissassmble

    mov rsi, convertsibbuffer
    mov rdi, raarg2
    call MoveString

    mov byte [rdi], 0

    jmp RAAext
RAA2:
RAB1:
    ;if(mod == '11'):
    cmp word [modd], '11'
    jne RAB2
    ; arg2 = convertReg(rm, rexb, opsize)
    mov r8,5
    push r8
    mov r8, 8
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice rm part

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put rm into tempbuffer

    mov byte [rdi],0;just for this

    mov r8w, [rbp+26];opsize
    push r8w
    mov r8w, [rbp+34];rexb
    push r8w
    mov r8, ratempbuffer
    push r8
    call ConvertReg;convert the register

    mov rsi, rax
    mov rdi, raarg2
    call MoveString;put it in arg1 buffer

    jmp RABext
RAB2:
    ; elif(mod == '00'):
    cmp word [modd], '00'
    jne RAB3
    ;arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+
    ;'['+convertReg(rm, rexb, addrsize)+']'
    mov rdi, raarg2

    mov r8w, [rbp+26]
    push r8w
    call ConvertOpsize

    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov rsi, pt
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov byte [rdi], '['

    inc rdi
    push rdi;save for later
    
    mov r8,5
    push r8
    mov r8, 8
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice rm part

    

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put rm into tempbuffer

    mov byte [rdi],0;just for this

    mov r8w, [rbp+28];addrsize
    push r8w
    mov r8w, [rbp+34];rexb
    push r8w
    mov r8, ratempbuffer
    push r8
    call ConvertReg;convert the register

    pop rdi
    mov rsi, rax
    call MoveString;put it in arg1 buffer

    mov byte [rdi], ']'

    inc rdi
    mov byte [rdi],0

    jmp RABext
RAB3:
    ; elif(mod == '01'):
    cmp word [modd], '01'
    jne RAB4

    mov r8,8
    push r8
    mov r8, 16
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice disp part

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put disp into tempbuffer

    mov r8,ratempbuffer
    push r8
    call ConvertDisp

    
    ;arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+
    ;'['+convertReg(rm, rexb, addrsize)+'+'+convertDisp(disp)+']'
    mov rdi, raarg2

    mov r8w, [rbp+26]
    push r8w
    call ConvertOpsize

    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov rsi, pt
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov byte [rdi], '['

    inc rdi
    push rdi;save for later
    
    mov r8,5
    push r8
    mov r8, 8
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice rm part

    

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put rm into tempbuffer

    mov byte [rdi],0;just for this

    mov r8w, [rbp+28];addrsize
    push r8w
    mov r8w, [rbp+34];rexb
    push r8w
    mov r8, ratempbuffer
    push r8
    call ConvertReg;convert the register

    pop rdi
    mov rsi, rax
    call MoveString;put it in arg1 buffer

    mov byte [rdi], '+'
    inc rdi

    mov rsi, convssdispbuffer
    call MoveString

    mov byte [rdi], ']'

    inc rdi
    mov byte [rdi],0
    jmp RABext
RAB4:
    ; elif(mod == '10'):
    cmp word [modd], '10'
    jne RABext

    mov r8,8
    push r8
    mov r8, 40
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice disp part

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put disp into tempbuffer

    mov r8,ratempbuffer
    push r8
    call ConvertDisp

    
    ;arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+
    ;'['+convertReg(rm, rexb, addrsize)+'+'+convertDisp(disp)+']'
    mov rdi, raarg2

    mov r8w, [rbp+26]
    push r8w
    call ConvertOpsize

    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov rsi, pt
    call MoveString

    mov byte [rdi], ' '

    inc rdi
    mov byte [rdi], '['

    inc rdi
    push rdi;save for later
    
    mov r8,5
    push r8
    mov r8, 8
    push r8
    mov r8, [rbp+16]
    push r8
    call SliceString;slice rm part

    

    mov rsi, slicebuffer
    mov rdi, ratempbuffer
    call MoveString;put rm into tempbuffer

    mov byte [rdi],0;just for this

    mov r8w, [rbp+28];addrsize
    push r8w
    mov r8w, [rbp+34];rexb
    push r8w
    mov r8, ratempbuffer
    push r8
    call ConvertReg;convert the register

    pop rdi
    mov rsi, rax
    call MoveString;put it in arg1 buffer

    mov byte [rdi], '+'
    inc rdi

    mov rsi, convssdispbuffer
    call MoveString

    mov byte [rdi], ']'

    inc rdi
    mov byte [rdi],0

    jmp RABext
RABext:
    jmp RAAext
RAAext:
    ; if(d):
    ;     res = arg1 + ','+arg2
    ; else:
    ;     res = arg2 + ','+arg1
    mov r8w, [rbp+24]
    cmp r8w, 0
    je RAC2
    jmp RAC1
    
RAC1:
    mov rdi, rabuffer
    mov rsi, raarg1
    call MoveString

    mov byte [rdi], ','
    inc rdi

    mov rsi, raarg2
    call MoveString

    mov byte [rdi], 0
    jmp RACext
RAC2:
    mov rdi, rabuffer
    mov rsi, raarg2
    call MoveString

    mov byte [rdi], ','
    inc rdi

    mov rsi, raarg1
    call MoveString

    mov byte [rdi], 0
    jmp RACext
RACext:
RegisterAddressExit:
    pop rax
    pop r8
    pop rdi
    pop rsi
    Leave
    ret 20
PArser:
    Enter 14,0
    ;gets a pointer to nullterminated string and returns the code
    ;* Order of args: 16: code*
    ;* Order of vars: 2:prefix66(word), 4:prefix67(word), 6:rex(word)
    ;*rex? are global
    ;*8:w(word),10:d(word),12:opsize(word),14:addrsize(word)
    ;reseting all local vars
    xor rax, rax
    mov [rbp-8], rax
    mov [rbp-12],eax
    mov [rbp-14],ax

    mov rsi, [rbp+16]
PAA:
    ; if(code[0:8] == '01100111')
    cmp dword [rsi], '0110'
    jne PAAext
    cmp dword [rsi+4], '0111'
    jne PAAext

    mov ax, 1
    mov [rbp-4], ax;67
; code = code[8:]
    add rsi, 8
    mov [rbp+16], rsi
    jmp PAAext
PAAext:

PAB:
    ; if(code[0:8] == '01100110'):
    cmp dword [rsi], '0110'
    jne PABext
    cmp dword [rsi+4], '0110'
    jne PABext

    mov ax, 1
    mov [rbp-2], ax;66
; code = code[8:]
    add rsi, 8
    mov [rbp+16], rsi
    jmp PABext
PABext:

    mov word [rexw],0
    mov word [rexr],0
    mov word [rexb],0
    mov word [rexx],0

PAC:
; if(code[0:4] == '0100'):
    cmp dword [rsi], '0100'
    jne PACext

    mov word [rbp-6], 1

    push rsi
    call RexDissassemble

    add rsi, 8
    mov [rbp+16], rsi
    jmp PACext
PACext:

PAD1:
    cmp byte [rsi+6], '1'
    jne PADext

    mov word [rbp-10], 1;d 
PADext:

PAE1:
    cmp byte [rsi+7], '1'
    jne PAEext

    mov word [rbp-8], 1;w
PAEext:

    ; arg_opcode = code[10:13]
    mov rax, 10
    push rax
    mov rax, 13
    push rax
    push rsi
    call SliceString

    push rsi

    mov rdi, paargopcode
    mov rsi, slicebuffer
    call MoveString

    mov byte [rdi], 0

    pop rsi

    ; opsize, addrsize = giveSize(rexw, w, prefix_66, prefix_67)

    mov ax, [rbp-4];67
    push ax
    mov ax, [rbp-2];66
    push ax
    mov ax, [rbp-8];w
    push ax
    mov ax, [rexw]
    push ax
    call GiveSize

    mov [rbp-14],bx;addrsize
    mov [rbp-12],ax;opsize

PAF1:
    ;if(code in opcode_const.keys()):
    push rsi
    mov rax, opcode_constV 
    push rax
    mov rax, opcode_constK
    push rax
    call GetValue

    cmp rax, -1
    je PAF2

    mov rsi, rax
    mov rdi, parserbuffer
    call MoveString

    jmp PAFext
PAF2:
 ; elif(code[0:4] == '1011'):
    cmp dword [rsi], '1011'
    jne PAF3
PAF21:
    cmp byte [rsi+4], '1'
    jne PAF21ext

    mov word [rbp-8], 1;w
PAF21ext:
    mov ax, [rbp-4];67
    push ax
    mov ax, [rbp-2];66
    push ax
    mov ax, [rbp-8];w
    push ax
    mov ax, [rexw]
    push ax
    call GiveSize

    mov [rbp-14],bx;addrsize
    mov [rbp-12],ax;opsize

    ; res = 'mov' + ' ' + convertReg(code[5:8], rexb, opsize) + ',' 
    ;         convertImm(code[8:])

    
    mov rdi, parserbuffer
    mov dword [rdi], 'mov '
    add rdi, 4

    mov rax, 5
    push rax
    mov rax, 8
    push rax
    push rsi
    call SliceString
    
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rexb]
    push ax
    mov rax, slicebuffer
    push rax
    call ConvertReg

    push rsi
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ','
    inc rdi

    add rsi, 8
    push rsi
    call ConvertDisp

    push rsi
    mov rsi,convssdispbuffer
    call MoveString

    jmp PAFext
PAF3:
    ; elif(code[0:5] == "10010"):
    cmp dword [rsi], '1001'
    jne PAF4
    cmp byte [rsi+4], '0'
    jne PAF4


    ;  res = 'xhcg' + ' ' + convertReg(code[5:8], rexb, opsize) + ',' 
    ;         convertReg("000", False, opsize)

    mov rdi, parserbuffer
    mov dword [rdi], 'xchg'
    add rdi, 4
    mov byte [rdi], ' '
    inc rdi

    mov rax, 5
    push rax
    mov rax, 8
    push rax
    push rsi
    call SliceString
    
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rexb]
    push ax
    mov rax, slicebuffer
    push rax
    call ConvertReg

    push rsi
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ','
    inc rdi

    mov word [patempbuffer], '00'
    mov byte [patempbuffer+2],'0'
    mov byte [patempbuffer+3],0

    mov ax, [rbp-12];opsize
    push ax
    mov ax, 0
    push ax
    mov rax, patempbuffer
    push rax
    call ConvertReg

    push rsi
    mov rsi, rax
    call MoveString
    pop rsi
    jmp PAFext
PAF4:
    ; (code[0:7] == '1111011' and code[10:13] == '101'):
    cmp dword [rsi], '1111'
    jne PAF5
    cmp word [rsi+4], '01'
    jne PAF5
    cmp byte [rsi+6], '1'
    jne PAF5
    cmp word [rsi+10],'10'
    jne PAF5
    cmp byte [rsi+12], '1'
    jne PAF5
    
    ; memoryaddr, imm = registerAddress(
    ;         code[8:], d, opsize, addrsize, rexr, rexx, rexb)
    push rsi ;!

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rbp-10];d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    ; res = 'imul' + ' ' + memoryaddr.split(',')[1]
    ;fortunatley for us we have arg buffers and we know d==1

    mov rdi, parserbuffer
    mov dword [rdi], 'imul'
    add rdi, 4
    mov byte [rdi], ' '
    inc rdi

    mov rsi, raarg2
    call MoveString

    pop rsi ;!
    jmp PAFext
PAF5:
    ; elif(code[0:5] in opcode_alternate.keys())
    mov rax, 0
    push rax
    mov rax,5
    push rax
    push rsi
    call SliceString

    mov rax, slicebuffer
    push rax
    mov rax, opcode_alternateV 
    push rax
    mov rax, opcode_alternateK
    push rax
    call GetValue
    
    cmp rax, -1
    je PAF6

    ; if(prefix_66):
    ;         opsize = 1
    ;     else:
    ;         opsize = 3
    cmp word [rbp-2], 1
    je PAF51
    mov word [rbp-12], 3
    jmp PAF52
PAF51:
    mov word [rbp-12], 1
    jmp PAF52
PAF52:
    ; res = operation + ' ' + convertReg(code[5:8], rexb, opsize)
    push rsi;!
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '
    inc rdi

    pop rsi;!

    mov rax, 5
    push rax
    mov rax, 8
    push rax
    push rsi
    call SliceString
    
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rexb]
    push ax
    mov rax, slicebuffer
    push rax
    call ConvertReg

    push rsi;!
    mov rsi, rax
    call MoveString
    pop rsi;!


    jmp PAFext
PAF6:
    ; elif(code[0:7] in opcode_acc.keys()):
    mov rax, 0
    push rax
    mov rax,7
    push rax
    push rsi
    call SliceString

    mov rax, slicebuffer
    push rax
    mov rax, opcode_accV 
    push rax
    mov rax, opcode_accK
    push rax
    call GetValue

    cmp rax, -1
    je PAF7

    ; res = operation + ' ' + 
    ; convertReg('000', rexb, opsize) + ',' + convertImm(code[8:])

    push rsi;!
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString

    mov byte [rdi], ' '
    inc rdi

    mov word [patempbuffer], '00'
    mov byte [patempbuffer+2],'0'
    mov byte [patempbuffer+3],0

    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rexb]
    push ax
    mov rax, patempbuffer
    push rax
    call ConvertReg

    mov rsi, rax
    call MoveString
    pop rsi;!

    mov byte [rdi], ','
    inc rdi

    add rsi, 8
    push rsi
    call ConvertDisp

    push rsi
    mov rsi,convssdispbuffer
    call MoveString

    jmp PAFext
PAF7:
    ; elif(code[0:8] == '00001111'):
    cmp dword [rsi], '0000'
    jne PAF8
    cmp dword [rsi+4], '1111'
    jne PAF8

    add rsi, 8
    mov [rbp+16], rsi;code = code[8:]
    ;ok this is a hard one
    ; operation = opcode_0f[code[0:8]]
    mov rax, 0
    push rax
    mov rax,8
    push rax
    push rsi
    call SliceString

    mov rax, slicebuffer
    push rax
    mov rax, opcode_0fV 
    push rax
    mov rax, opcode_0fK
    push rax
    call GetValue

    cmp rax, -1
    je PAF71;if we don't have it we don't need it

    push rdi
    push rsi
    mov rdi, paoperation
    mov rsi, rax
    call MoveString
    mov byte [rdi], 0
    pop rsi
    pop rdi
PAF71:;!this is risky hopefully we dont have 71 ifs

PAF7A1:
    ; if(operation == 'bsf' or operation == 'bsr' or operation == 'imul'):
    mov rdi, paoperation
PAF7A11:
    cmp word [rdi], 'bs'
    jne PAF7A12;next or
    cmp byte [rdi+2], 'f'
    jne PAF7A12
    jmp PAF7A14;condition met
PAF7A12:
    cmp word [rdi], 'bs'
    jne PAF7A13;next or
    cmp byte [rdi+2], 'r'
    jne PAF7A13
    jmp PAF7A14
PAF7A13:
    cmp dword [rdi], 'imul'
    jne PAF7A2;condition failed
    jmp PAF7A14
PAF7A14:
    ; memoryaddr, imm = registerAddress(
    ; code[8:], d, opsize, addrsize, rexr, rexx, rexb)
    ;res = operation+' '+memoryaddr
    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rbp-10];d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    
    mov rdi, parserbuffer
    mov rsi, paoperation
    call MoveString

    mov byte [rdi], ' '
    inc rdi

    mov rsi, rabuffer
    call MoveString
    jmp PAF7Aext
PAF7A2:
    ;elif(code[0:7] == "1100000"):
    cmp dword [rsi], '1100'
    jne PAF7A3
    cmp word [rsi+4], '00'
    jne PAF7A3
    cmp byte [rsi+6], '0'
    jne PAF7A3

    ; memoryaddr, imm = registerAddress(
    ;             code[8:], False, opsize, addrsize, rexr, rexx, rexb)
    ;         res = 'xadd'+' '+memoryaddr

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 0;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    mov rdi, parserbuffer
    mov dword [rdi], 'xadd'
    add rdi, 4

    mov byte [rdi], ' '
    inc rdi

    mov rsi, rabuffer
    call MoveString
    jmp PAF7Aext
PAF7A3:
    ; elif(operation == 'syscall'):
    mov rsi, paoperation
    cmp dword [rsi], 'sysc'
    jne PAF7A4
    cmp word [rsi+4], 'al'
    jne PAF7A4
    cmp byte [rsi+6], 'l'
    jne PAF7A4

    mov rdi, parserbuffer
    call MoveString

    jmp PAF7Aext
PAF7A4:
    ; else:

    ;res = operation+' '+convertDisp(code[8:])

    mov rdi, parserbuffer
    mov rsi, paoperation
    call MoveString

    mov byte [rdi], ' '
    inc rdi
    
    mov rsi, [rbp+16]
    add rsi, 8
    push rsi
    call ConvertDisp

    mov rsi, convssdispbuffer
    call MoveString
    jmp PAF7Aext
PAF7Aext:
    jmp PAFext
PAF8:
    ; elif(code[0:6] == '100000'):
    cmp dword [rsi], '1000'
    jne PAF9
    cmp word [rsi+4], '00'
    jne PAF9

    mov rax, paargopcode
    push rax
    mov rax, opcode_imm_100000V
    push rax
    mov rax, opcode_imm_100000K
    push rax
    call GetValue
    ;operation = opcode_imm_100000[arg_opcode]
    ; res = operation + ' ' + memoryaddr.split(',')[1]
    ; +',' + convertImm(imm)

    push rsi
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ' '
    inc rdi

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 0;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, raarg2
    call MoveString
    pop rsi

    mov byte [rdi], ','
    inc rdi

    add rsi, 8
    push rsi
    call ConvertDisp

    mov rsi,convssdispbuffer
    call MoveString 


    jmp PAFext
PAF9:
    ; elif(code[0:6] == '111111'):
    cmp dword [rsi], '1111'
    jne PAF10
    cmp word [rsi+4], '11'
    jne PAF10

    ; operation = opcode_111111[arg_opcode]
    ;     d = True
    ; res = operation + ' ' + memoryaddr.split(',')[1]

    mov rax, paargopcode
    push rax
    mov rax, opcode_111111V
    push rax
    mov rax, opcode_111111K
    push rax
    call GetValue

    push rsi
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ' '
    inc rdi

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 1;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, raarg2
    call MoveString
    pop rsi

    jmp PAFext
PAF10:
    ; elif(code[0:6] == '111101'):

    cmp dword [rsi], '1111'
    jne PAF11
    cmp word [rsi+4], '01'
    jne PAF11

    ; operation = opcode_111101[arg_opcode]
    ;     d = True
    ; res = operation + ' ' + memoryaddr.split(',')[1]
    
    mov rax, paargopcode
    push rax
    mov rax, opcode_111101V
    push rax
    mov rax, opcode_111101K
    push rax
    call GetValue

    push rsi
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ' '
    inc rdi

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 1;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, raarg2
    call MoveString
    pop rsi
    jmp PAFext
PAF11:
    ; elif(code[0:6] == "110100"):
    cmp dword [rsi], '1101'
    jne PAF12
    cmp word [rsi+4], '00'
    jne PAF12

    ;ok this is the hardest one lets go
    mov rdi, parserbuffer

    mov dword [rdi], 'shl '
    add rdi, 4

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 1;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, raarg2
    call MoveString
    pop rsi

    mov byte [rdi], ','
    inc rdi
PAF11A1:
    ; if(arg_opcode == '100'):
    cmp word [paargopcode], '10'
    jne PAF11A2
    cmp byte [paargopcode+2], '0'
    jne PAF11A2

    
PAF11B1:
    ; if(d == True):
    cmp word [rbp-10], 0
    je PAF11B2
    
    mov word [rdi], 'cl'
    add rdi, 2
    mov byte [rdi], 0
    jmp PAF11Bext
PAF11B2:
    ;else
    mov byte [rdi], '1'
    inc rdi
    mov byte [rdi], 0
    jmp PAF11Bext
PAF11Bext:
    jmp PAF11Aext
PAF11A2:
    ; elif(arg_opcode == '101'):
    cmp word [paargopcode], '10'
    jne PAF11Aext
    cmp byte [paargopcode+2], '1'
    jne PAF11Aext

    mov byte [parserbuffer+2], 'r';changing to shr
PAF11C1:
    ; if(d == True):
    cmp word [rbp-10], 0
    je PAF11C2

    mov word [rdi], 'cl'
    add rdi, 2
    mov byte [rdi], 0
    jmp PAF11Cext
PAF11C2:
    ;else
    mov byte [rdi], '1'
    inc rdi
    mov byte [rdi], 0
    jmp PAF11Cext
PAF11Cext:
    jmp PAF11Aext
PAF11Aext:
    jmp PAFext
PAF12:
    ; elif(code[0:6] == "110000"):
    ; elif(code[0:6] == "110100"):
    cmp dword [rsi], '1100'
    jne PAF13
    cmp word [rsi+4], '00'
    jne PAF13

    cmp word [paargopcode], '10'
    jne PAFext

    mov rdi, parserbuffer

    mov dword [rdi], 'shl '
    add rdi, 4

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 1;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, raarg2
    call MoveString
    pop rsi

    mov byte [rdi], ','
    inc rdi

    add rsi, 8
    push rsi
    call ConvertDisp

    mov rsi,convssdispbuffer
    call MoveString 

    cmp byte [paargopcode+2], '0'
    je PAFext

    mov byte [parserbuffer+2], 'r';changing to shr

    jmp PAFext
PAF13:
    ; elif(code[0:6] == "100001"):
    cmp dword [rsi], '1000'
    jne PAF14
    cmp word [rsi+4], '01'
    jne PAF14

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, 1;d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    mov rdi, parserbuffer
    ; if(d):
    ;         res = 'xchg'+ ' '+ memoryaddr
    ;     else:
    ;         res = 'test'+ ' '+ memoryaddr
    cmp word [rbp-10], 0
    je PAF131
    mov dword [rdi], 'xchg'
    add rdi, 4
    mov byte [rdi], ' '
    inc rdi

    jmp PAF132
PAF131:
    mov dword [rdi], 'test'
    add rdi, 4
    mov byte [rdi], ' '
    inc rdi

    jmp PAF132
PAF132:
    push rsi
    mov rsi, rabuffer
    call MoveString
    pop rsi
    jmp PAFext
PAF14:
    ; else
    ;default case

    mov rax, 0
    push rax
    mov rax, 6
    push rax
    push rsi
    call SliceString

    mov rax, slicebuffer
    push rax
    mov rax, opcode_normalV 
    push rax
    mov rax, opcode_normalK
    push rax
    call GetValue

    push rsi
    mov rdi, parserbuffer
    mov rsi, rax
    call MoveString
    pop rsi

    mov byte [rdi], ' '
    inc rdi

    mov ax, [rexb]
    push ax
    mov ax, [rexx]
    push ax
    mov ax, [rexr]
    push ax
    mov ax, [rbp-14]; addrsize
    push ax
    mov ax, [rbp-12];opsize
    push ax
    mov ax, [rbp-10];d
    push ax
    add rsi, 8
    push rsi
    call RegisterAddress

    push rsi
    mov rsi, rabuffer
    call MoveString
    pop rsi
    jmp PAFext
PAFext:
    mov byte [rdi], 0
PArserExit:
    Leave
    ret 8

; test1:
;     Enter 0,0
;     xor rax, rax
;     mov ax, [rbp+16]
;     mov bx, [rbp+18]
;     add ax, bx
; test1Exit:
;     Leave
;     ret 4
_start:
    mov	rsi,	Msg
    call	printString
    call newLine

    mov rax, filename
    push rax
    call getdirname

    mov rax, outputname
    push rax
    call getdirname

    mov rdi, filename
    call openFile

    mov [fileDescriptor], rax

    mov rdi, outputname
    call createFile

    mov rdi, outputname
    call openFile

    mov [fileDescriptorW], rax
loop1:
    call ResetBuffers

    ; mov rdi, [fileDescriptor]
    ; mov rax, inputbuffer
    ; push rax
    ; call ReadLine

    mov rdi, [fileDescriptor]
    mov rax, codebuffer
    push rax
    call ReadLine

    ; call writeNum
    ; mov rsi, inputbuffer
    ; call printString
    ; call newLine

    ; push rdi;!

    ; mov rax, inputbuffer
    ; push rax
    ; call ConveryHxtoBin

    ; mov rsi, CHBbuffer
    ; call printString
    ; call newLine

    ; mov rsi, CHBbuffer
    ; mov rdi,  codebuffer
    ; call MoveString

    ; mov byte [rdi], 0

    mov rax, codebuffer
    push rax
    call PArser

    mov rsi, parserbuffer
    call printString
    call newLine
    ;replace end with NL
    mov rax, parserbuffer
    push rax
    call EndOfString

    mov byte [rax], NL
    mov byte [rax+1],0

    mov rax, parserbuffer
    push rax
    mov rdi, [fileDescriptorW]
    call WriteBuffer

    pop rdi;!

    cmp rdi, -1
    jne loop1
;!
loop1ext:
    ; mov rdi, temp1
    ; mov rsi, tst3
    ; call MoveString
    ; call writeNum

Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall