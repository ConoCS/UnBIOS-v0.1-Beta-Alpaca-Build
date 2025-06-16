[BITS 16]
[ORG 0x7C00]

setup: ; setup stack before we can run this
xor ax, ax
mov ds, ax
mov es, ax
mov cs, ax
mov di, ax
mov si, ax
mov sp, 0x07C0
mov cx, 2000

clearscreen: ; clear screen
mov al, 0x20
mov ah, 0x0E
int 10h
loop clearscreen

resetcursor: ; reset cursor to first position
mov ah, 0x02
mov bh, 0
mov dh, 0x00
mov dl, 0x00
int 10h
 ; set SI to info, msg, paso so we can load that intro
mov si, info
call lodprnt
mov ah, 0x02
mov bh, 0
mov dh, 0x02
mov dl, 0x00
int 10h
mov si, msg
call lodprnt
mov ah, 0x02
mov bh, 0
mov dh, 0x03
mov dl, 0x00
int 10h
mov si, paso
call lodprnt
mov ah, 0x02
mov bh, 0
mov dh, 0x04
mov dl, 0x00
int 10h
jmp typepassset

lodprnt: ; print character for intro
lodsb
cmp al, 0
je .ret
mov ah, 0x0E
int 10h
jmp lodprnt
    .ret:
    ret

typepassset:
mov ax, cs
mov es, ax
mov di, buffer
mov cx, 8

typepass: ; user input will converted to *. and user input data will placed on buffer with stosb
mov ah, 0x00
int 16h
stosb
mov al, 0x2A
mov ah, 0x0E
int 10h
loop typepass
 ; set the pointr for comparing the password
mov si, 0
mov di, 0
mov si, buffer
mov di, password

debugbuffer: ; debugging is to see if the buffer really works
lodsb
cmp al, 0
je compareset
mov ah, 0x0E
int 10h
jmp debugbuffer

compareset:
mov si, buffer
mov di, password

compare:
mov cx, 8
repe cmpsb
jz okayset
jmp errorset

okayset:
mov si, 0
mov si, ok
; set the cursor so the OK text will readable
mov ah, 0x02
mov bh, 0
mov dh, 0x06
mov dl, 0x00
int 10h

okay:
lodsb
cmp al, 0
je jumplod
mov ah, 0x0E
int 10h
jmp okay

jumplod:
call wait3sec
mov al, 'A'
mov ah, 0x0E
int 10h
jmp $

errorset:
mov si, 0
mov si, error
mov ah, 0x02
mov bh, 0
mov dh, 0x06
mov dl, 0x00
int 10h

errors:
lodsb
cmp al, 0
je wenter
mov ah, 0x0E
int 10h
jmp errors

wenter:
mov ah, 0x00
int 16h
cmp al, 0x0D
je setup ; restart POP
jmp wenter

wait3sec:
    mov ah, 0x00
    int 0x1A             

    mov bx, dx           
    add bx, 54           

.waitloop:
    mov ah, 0x00
    int 0x1A             
    cmp dx, bx           
    jb .waitloop         

    ret

halt:
jmp $

info db "! UnBIOS Power On Password Protection !", 0
msg db "POP Password Expected. Please enter the Password below", 0
paso db "Password at least more than 8 digit: ", 0
buffer times 9 db 0  
password db "12345678", 0
error db "Password Incorrect. Please try again. Press Enter to restart POP", 0
ok db "OK", 0


times 510 - ($ - $$) db 0
dw 0xAA55


