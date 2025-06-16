[BITS 16]
[ORG 0x7C00] ; bukan alamat real. tapi nanti bisa diganti menyesuaikan BIOS

guistart:
nop

.setupstack:
xor ax, ax
mov ds, ax
mov si, ax
mov ss, ax
mov di, ax
mov es, ax

.clearscreen:
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x00        ; Row (Y)
mov dl, 0x00        ; Column (X)
int 0x10

.backgroundgui:
mov ah, 0x09      ; Tulis karakter + atribut
mov al, ' '       ; Karakter spasi
mov bh, 0x00      ; Page number
mov bl, 0x3F      ; Atribut warna: background cyan, foreground putih terang
mov cx, 5000         ; Jumlah pengulangan (1 kali)
int 0x10

.headersetup:
mov si, msgbios ; set the SI
mov di, 0
mov cx, 80
push cx

headersetup2:
mov ah, 0x09      ; Tulis karakter + atribut
mov al, ' '       ; Karakter spasi
mov bh, 0x00      ; Page number
mov bl, 0x0F      ; Atribut warna: background cyan, foreground putih terang
pop cx        ; Jumlah pengulangan (1 kali)
int 0x10
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x00       ; Row (Y)
mov dl, 0x15        ; Column (X)
int 0x10

.lodheader:
lodsb
cmp al, 0
je setwelcome
mov ah, 0x0E
int 10h
jmp .lodheader

setwelcome:
mov si, welcome
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x01       ; Row (Y)
mov dl, 0x08        ; Column (X)
int 0x10

.lodwelcome:
lodsb
cmp al, 0
je resetcursor
mov ah, 0x0E
int 10h
jmp .lodwelcome

resetcursor:
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x02       ; Row (Y)
mov dl, 0x00        ; Column (X)
int 0x10

uplftbox:
mov si, upleft
lodsb
mov ah, 0x0E
int 10h

boxsetup:
mov cx, 78
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x02       ; Row (Y)
mov dl, 0x01        ; Column (X)
int 0x10

box:
mov si, hz
lodsb
mov ah, 0x0E
int 10h
loop box

uprgtbox:
mov si, uprgt
lodsb
mov ah, 0x0E
int 10h

vzsetup:
mov cx, 19 ; line ke bawah digambar berapa kali?
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x03       ; Row (Y)
mov dl, 0x00        ; Column (X)
int 0x10

vzdown:
mov si, vz
lodsb
mov ah, 0x0E
int 10h
mov ah, 0x0E
mov al, 0x0D   ; Carriage return
int 0x10
mov al, 0x0A   ; Line feed
int 0x10
loop vzdown

dwnlfts:
mov si, dwnlft
lodsb
mov ah, 0x0E
int 10h
; setup garis bawah
mov ah, 0x02
mov bh, 0x00      ; Page number
mov dh, 0x02       ; Row (Y)
mov dl, 0x01        ; Column (X)
mov cx, 78

boxdwn:
mov si, hz
lodsb
mov ah, 0x0E
int 10h
loop boxdwn

dwnrgts:
mov si, dwnrgt
lodsb
mov ah, 0x0E
int 10h

setvzup:
xor ax, ax
xor bx, bx
xor dx, dx
mov ah, 0x02
mov bh, 0
mov dh, 0x15
mov dl, 0x46
add dl, 9
push dx
int 10h
pop dx
mov cx, 19 ; set the cx for loop vzup

vzup:
mov si, vz
lodsb
mov ah, 0x0E
int 10h
dec dh
mov ah, 0x02
int 10h
loop vzup

hlt:
jmp $

msgbios db "UnBIOS BETA v1.0 | Alpaca build", 0
welcome db "BIOS: Hey there Human. Wonderful weather we're having today", 0
upleft db 0xDA
uprgt db 0xBF
dwnlft db 0xC0
dwnrgt db 0xD9
hz db 0xC4
vz db 0xB3

times 510 - ($ - $$) db 0
dw 0xAA55