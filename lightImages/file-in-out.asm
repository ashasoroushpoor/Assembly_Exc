%include "sys-equal.asm"
;----------------------------------------------------
section     .data1

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

; createFile:
;     mov     rax, sys_create
;     mov     rsi, sys_IRUSR | sys_IWUSR 
;     syscall
;     cmp     rax, -1   ; file descriptor in rax
;     jle     createerror
;     mov     rdi, suces_create           
;     call    printString
;     ret
; createerror:
;     mov     rdi, error_create
;     call    printString
;     ret
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
;---------------------------------------------------
; rdi point to file name
appendFile:
    mov     rax, sys_open
    mov     rsi, O_RDWR | O_APPEND
    syscall
    cmp     rax, -1     ; file descriptor in rax
    jle     appenderror
    mov     rsi, suces_append
    call    printString
    ret
appenderror:
    mov     rsi, error_append
    call    printString
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
; rdi : file name
deleteFile:
    mov     rax, sys_unlink
    syscall
    cmp     rax, -1      ; 0 successful
    jle     deleterror
    mov     rsi, suces_delete
    call    printString
    ret
deleterror:
    mov     rsi, error_delete
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

