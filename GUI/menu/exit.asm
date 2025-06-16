[BITS 16]
[ORG 0x7C00]

setup:
xor ax, ax
mov ds, ax
mov es, ax
mov si, ax
mov di, ax
mov cx, 2000

clearscreen:
mov al, 0x20
mov ah, 0x0E
int 10h
loop clearscreen

background:
mov ah, 0x02
mov bh, 0
mov dh, 0x00
mov dl, 0x00
int 10h
mov ah, 0x09
mov al, ' '         ; spasi
mov bh, 0           ; page 0
mov bl, 0x01F       ; warna biru terang (foreground = biru, background = hitam)
mov cx, 36           ; cetak 1 kali
int 10h

.setupmsg:
mov si, msg
call .msgshow
mov ah, 0x02
mov bh, 0
mov dh, 0x18
mov dl, 0x00
int 10h
mov si, prs1
call .msgshow
mov si, prs2
call .msgshow
jmp keyprs

.msgshow:
lodsb
cmp al, 0
je .ret
mov ah, 0x0E
int 10h
jmp .msgshow
.ret:
ret

keyprs:
mov ah, 0x00
int 16h
cmp al, 0x31
je exit
cmp al, 0x32
je clearscreen

exit:
mov ax, 0x40
mov ds, ax
mov word [0x72], 0x1234  ; magic number BIOS untuk warm reboot

jmp 0xFFFF:0x0000        ; Lompat ke POST BIOS


msg db "Changes has made. Exit without save?", 0
prs1 db "1: Yes          ", 0
prs2 db "2: No", 0

times 510 - ($ - $$) db 0
dw 0xAA55