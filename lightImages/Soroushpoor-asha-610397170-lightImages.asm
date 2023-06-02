;! gets a directory as input and a number n lighten every image in said directory by n
;! and saves them in another folder


%include "./in_out.asm"
; %include "./file-in-out.asm"
section .data
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

    Msg	db	'Hello World',NL,	0
    ErrAloc	db	'Error in allocation',0xA,	0
    ErrFree	db	'Error in freeing',0xA,	0
    isbmp db 'file is bmp',0xA,0
    msgoffset db "the offset of bitmap is at ",0
    msgheaderlen db "second header length is ",0
    msgwidth db "width of image is ",0
    msgheight db "height of image is ",0
    msgpadd db "padding is :",0
    name db '500p_333p(24bit_windows_version).bmp',0
    nametest db './before',0
    extension db 'pmb.',0;it stored reversed
    backdir db '..',0
    ; dirname db './before',0
    newdir db 'edited',0
    bufferlen dq 100000
    filebufferlen dq 50000
section .bss
    buffer resq 1;this is buffer for directory lists
    buffer1 resb 100000
    filebuffer resq 50000;buffer for loading files
    fileoutbuffer resq 50000
    dirname resb 100
    dir1 resq 1
    dir2 resq 1
    bpos resq 1
    nread resq 1
    brightness resb 1
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
; rdi: FD of the directory, rsi: pointer to the buffer
; rdx: length of the buffer
getdent64:
    mov rax, 0xd9
    syscall
    cmp rax, -1
    jle getdenterror
    mov rsi, suces_getdent
    call printString
    ret
getdenterror:
    mov rsi, error_getdent
    call printString
    ret
;----------------------------------------------------
; rdi : file name; rsi : file access mode 
; rdx: file permission, do not need
openFileRO:
    mov     rax, sys_open
    ; mov     rsi, O_RDWR
    mov     rsi, O_RDONLY      
    syscall
    cmp     rax, -1   ; file descriptor in rax
    jle     openFileROerror
    mov     rsi, suces_open_RO
    call    printString
    ret
openFileROerror:
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
; rdi : directory name , rsi : mode
mkdir:
    mov     rax, 0x53
    ; mov     rsi, sys_IRUSR | sys_IWUSR 
    mov rsi, 0q777
    syscall
    cmp     rax, -1   ; file descriptor in rax
    jle     mkdirerror
    mov     rsi, suces_mkdirat          
    call    printString
    ret
mkdirerror:
    mov rsi, error_mkdirat
    call    printString
    ret
;----------------------------------------------------

memalloc:;size should be in rsi return address in rax
    mov	rax,	sys_mmap
    ;mov	rsi,	mem_size

    mov	rdx,	PROT_READ | PROT_WRITE
    mov	r10,	MAP_PRIVATE | MAP_ANONYMOUS
    syscall
    cmp	rax,	-1
    jg	memAlocEnd
    mov	rsi,	ErrAloc
    call	printString
memAlocEnd:
    ret

memfree:;address should be in r11 and size in rsi
    mov	rax,	sys_mumap
;	mov	rsi,	mem_size
    mov	rdi,	r11
    syscall
    cmp	rax,	-1
    jg	memFreeEnd
    mov	rsi,	ErrFree
    call	printString
memFreeEnd:
    ret

resetfilebuffer:
    push rcx
    push rbx
    mov rcx, [filebufferlen]
    mov rbx, filebuffer
rsloop1:
    mov [rbx], BYTE 0
    inc rbx
    loop rsloop1

    pop rcx
    pop rbx
    ret

lightenBmp:;gets picture name string in rdi, lighten it and save the result
    ;psuedocode:
    enter 72,0
    ;local vars:
    ;[rbp-8]: old FD*
    ;[rbp-16]: new FD*
    ;[rbp-24]: bitmap starting position offset
    ;[rbp-32]: second header length
    ;[rbp-40]: width
    ;[rbp-48]: height
    ;[rbp-56]: padding
    ;[rbp-64]: filename*
    ;[rbp-72]: width*3
    push rax
    push rbx
    push rcx
    push rsi
    push rdi
    push rdx
    push r8
    push r9

    mov [rbp-64],rdi;storing filename*
;-------------------1.extracting information from image --------------
    ; supposed we changed directory to desired
    call openFile
    mov [rbp-8], rax;storing file descriptor
    ;*bitmap offset
    ;offset to bitmap s at 0x0A offset
    call resetfilebuffer

    mov rdi, [rbp-8];FD
    mov rsi, 0x0A;offset
    mov rdx, 0;whence
    call seekFile
    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    mov rdx, 4;length
    call readFile

    mov rsi, msgoffset;offset
    call printString
    mov rax,[filebuffer]
    mov [rbp-24],rax;setting offset variable
    call writeNum
    call newLine
    ;!so here is the problem if the length of second header is 40 we
    ;!have to read 4 bytes for width and height otherwise 2bytes
    ;*header len
    ;offset to bitmap s at 0x0E offset
    call resetfilebuffer

    mov rdi, [rbp-8];FD
    mov rsi, 0x0E;offset
    mov rdx, 0;whence
    call seekFile
    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    mov rdx, 4;length
    call readFile

    mov rsi, msgheaderlen;header len
    call printString
    mov rax,[filebuffer]
    mov [rbp-32],rax;setting header length var
    call writeNum
    call newLine

    ;*width
    ;width of bitmap is at 0x12 offset
    call resetfilebuffer

    mov rdi, [rbp-8];FD
    mov rsi, 0x12;offset
    mov rdx, 0;whence
    call seekFile
    ;handling length
    mov rax,[rbp-32]
    cmp rax,12
    je conl1
    mov rdx,4
    jmp conl2
conl1:
    mov rdx, 2
    jmp conl2
conl2:
    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    ;rdx length
    call readFile

    mov rsi, msgwidth;offset
    call printString
    mov rax,[filebuffer]
    mov [rbp-40],rax;setting width var
    call writeNum
    call newLine

    ;*height*
    ;height is either at 0x14 for 12byte header
    ;or at 0x16 for 40byte header
    call resetfilebuffer

    mov rax,[rbp-32];header len
    cmp rax,12
    je conl3
    mov rsi, 0x16;offset
    jmp conl4
conl3:
    mov rsi, 0x14;offset
    jmp conl4
conl4:
    mov rdi, [rbp-8];FD
    ;rsi offset
    mov rdx, 0;whence
    call seekFile

    mov rax,[rbp-32];header len
    cmp rax,12
    je conl5
    mov rdx, 4
    jmp conl6
conl5:
    mov rdx,2
    jmp conl6
conl6:
    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    ;rdx length
    call readFile

    mov rsi, msgheight;header len
    call printString
    mov rax,[filebuffer]
    mov [rbp-48],rax;setting header length var
    call writeNum
    call newLine

    ;*calculating padding
    mov rax, [rbp-40];width to rax
    xor rdx,rdx
    mov rcx,4
    div rcx
    mov rax, rdx
    xor rdx,rdx
    mov rcx, 3
    mul rcx
    xor rdx, rdx
    mov rcx, 4
    div rcx
    mov rax, 4
    sub rax, rdx;rax is  (4-((width%4)*3)%4)
    cmp rax, 4;if 4 we should fix it
    jne conl7
    mov rax,0
conl7:
    mov rsi, msgpadd
    call printString
    mov [rbp-56], rax
    call writeNum
    call newLine

    ;------------------2.creating new file and filling headers------------------
    mov rdi, newdir
    call changeDir
    mov rdi, [rbp-64]
    call createFile
    mov [rbp-16], rax
    mov rdi, backdir
    call changeDir


    ;filling in headers
    
    mov rdi, [rbp-8];FD
    mov rsi, 0;offset
    mov rdx, 0;whence
    call seekFile

    mov rdi, [rbp-8]
    mov rsi, filebuffer
    mov rdx, [rbp-24] ;offset of bitmap is length
    call readFile

    mov rdi, [rbp-16]
    mov rsi, filebuffer
    mov rdx, [rbp-24];offset of bitmap is length
    call writeFile

    ;for height: read width add and save
    mov rax, [rbp-40];width to rax
    mov rcx,3
    mul rcx
    mov [rbp-72], rax


    mov r9, [rbp-48]
    push r9
lightenBmploop1:
    ;loop check
    pop r9
    cmp r9, 0
    jle lightenBmploop1Ext
    dec r9
    push r9

    ;! we need to read paddings too
    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    mov rdx, [rbp-72];length = width*3
    call readFile

    xor r8, r8
    
    mov r9, [rbp-72]
    ; push r9
lightenBmploop2:
    ; pop r9
    cmp r9, r8
    jle lightenBmploop2Ext
    ; push r9

    mov rbx, filebuffer
    movq xmm0, [rbx+r8*1]
    vpbroadcastb xmm1, [brightness]
    vpaddusb xmm2,xmm1,xmm0
    movq [rbx+r8], xmm2

    add r8,8

    jmp lightenBmploop2
lightenBmploop2Ext:
    mov rdi, [rbp-16]
    mov rsi, filebuffer
    mov rdx, [rbp-72];length = width*3
    call writeFile

    
    ;handling padding
    mov rdx, [rbp-56]
    cmp rdx, 0
    je lightenBmploop1;if zero restart the loop

    mov rdi, [rbp-8];FD
    mov rsi, filebuffer;buffer
    mov rdx, [rbp-56]
    call readFile

    xor rax, rax
    mov [filebuffer],rax;padding is no more than 4 byte

    mov rdi, [rbp-16]
    mov rsi, filebuffer
    mov rdx, [rbp-56]
    call writeFile

    jmp lightenBmploop1

lightenBmploop1Ext:

lightenBmpExt:

    mov rdi, [rbp-8]
    call closeFile

    mov rdi, [rbp-16]
    call closeFile

    pop r9
    pop r8
    pop rdx
    pop rdi
    pop rsi
    pop rcx
    pop rbx
    pop rax
    leave
    ret

chck_ext:;check whether extension is at the end or not
;rsi: pointer to null ended string
;sets carry flag if string ends with extenstion resets it otherwise
    push rsi
    push rdi
    push rax
    push rdx
chck_extloop1:; goes to end of string
    lodsb
    cmp al,0
    jne chck_extloop1

    sub rsi, 2
    mov rdi, extension
chck_extloop2:
    mov bl, [rdi];extension char to bl
    inc rdi
    cmp bl, 0;we checked all
    je chck_ext_suc

    mov al, [rsi]; string char to al
    dec rsi

    cmp al,bl
    jne chck_ext_fail

    jmp chck_extloop2

chck_ext_suc:
    stc
    jmp chck_extExt
chck_ext_fail:
    clc
    jmp chck_extExt
chck_extExt:
    pop rdx
    pop rax
    pop rdi
    pop rsi
    ret

resolve_dirent:;process one dirent returns reclen in rax
    enter 16,0
    ;rbp-16: reclen
    lodsq
    call writeNum

    call newLine
    lodsq
    ; mov [rbp-8], rax
    call writeNum
    call newLine

    xor rax,rax
    lodsw
    mov [rbp-16], rax;stores reclen
    call writeNum
    call newLine

    call chck_ext

    jnc bmpchkf
    ; call newLine
    push rsi
    mov rsi, isbmp
    call printString
    ; call newLine
    pop rsi
    inc rsi
    ; mov rsi,name
    ; mov al, [rsi]
    ; call putc
    mov rdi,rsi

    call lightenBmp
    ; call openFile
    ; jmp process_direntsExt;!!!!!!!!!!!!!!!!!!!!!!!!
bmpchkf:;bmpcheck fail
    call printString;postision is in rsi
    call newLine

    mov rax, [rbp-16]
    leave
    ret

process_dirents:;process all dirents
    xor rsi,rsi
    mov [bpos],rsi
proc_dir_loop1:
    mov rax, [bpos]
    cmp rax, [nread]
    jge proc_dir_loop1Ext


    mov rsi, [buffer]
    ; mov rsi, buffer1
    add rsi, rax;add pointer + bpos(offset)
    call resolve_dirent

    add [bpos], rax;next offset

    jmp proc_dir_loop1
proc_dir_loop1Ext:
process_direntsExt:
    ret

getdirname:
    push rax
    push rbx
    push rsi
    mov rbx,dirname
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
    ret

_start:
    call getdirname

;     mov rcx, [bufferlen]
;     mov rbx, buffer
; loooooooooooop:
;     mov [rbx],BYTE 0
;     inc rbx
;     loop loooooooooooop
    call readNum
    mov [brightness],al
    ;TODO make it var
    mov rdi, dirname
    ; mov rdi, name
    ; call openFile
    call openFileRO
    mov [dir1],rax

    mov rsi, [bufferlen]
    call memalloc
    mov [buffer],rax

    mov rdi, [dir1]
    mov rsi, [buffer]
    ; mov rsi,buffer1
    mov rdx, [bufferlen]
    call getdent64
    mov [nread], rax
    call writeNum
    call newLine

    
    ; TODO make it var
    
    mov rdi, dirname
    call changeDir

    mov rdi, newdir
    call mkdir
    
    ; mov rdi, newdir
    ; call changeDir

    call process_dirents

    ; mov rdi, name
    ; call lightenBmp

    ; mov rdi,name
    ; call lightenBmp

    mov rdi, [dir1]
    call closeFile

    mov r11, [buffer]
    mov rsi, [bufferlen]
    call memfree

    mov	rsi,	Msg
    call	printString

Exit:
    mov     rax,    sys_exit
    xor     rdi,    rdi
    syscall