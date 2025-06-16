[BITS 16]
[ORG 0x7C00]

; -----------------------------------
; |          KEY,GUI,FNC            |
; -----------------------------------
; to show the function of the keyboard how it come, and function to call it
setup:
xor ax, ax
mov ds, ax
mov di, ax
mov si, ax
mov sp, ax


; set cursor position
mov ah, 0x02
mov bh, 0
mov dh, 0x17
mov dl, 0x00
int 10h
xor ax, ax
; set esc to si
mov ax, esc
mov [ds:0x0002], ax

;set f1 to si
mov ax, f1
mov [ds:0x0004], ax

; set f3 to si
mov ax, f3
mov [ds:0x0006], ax

; set f10 to si
mov ax, f10
mov [ds:0x0008], ax

; set updwn to si
mov ax, updwn
mov [ds:0x0010], ax

; set lftrgt to si
mov ax, lftrgt
mov [ds:0x0012], ax

escsetup:
mov ah, 0x02
mov bh, 0
mov dh, 0x17
mov dl, 0x00
mov si, [ds:0x0002]
int 10h
call print

f1set:
mov ah, 0x02
mov bh, 0
mov dh, 0x17
mov dl, 0x10
int 10h
mov si, [ds:0x0004]
call print

f3set:
mov ah, 0x02
mov bh, 0
mov dh, 0x17
mov dl, 0x20
int 10h
mov si, [ds:0x0006]
call print

f10set:
mov ah, 0x02
mov bh, 0
mov dh, 0x17
mov dl, 0x30
int 10h
mov si, [ds:0x0008]
call print

updwnset:
mov ah, 0x02
mov bh, 0
mov dh, 0x18
mov dl, 0x00
int 10h
xor ax, ax
mov si, [ds:0x0010]
call print

lftrgtset:
mov ah, 0x02
mov bh, 0
mov dh, 0x18
mov dl, 0x10
int 10h
mov si, [ds:0x0012]
call print
jmp halt

print:
lodsb
cmp al, 0
je return
mov ah, 0x0E
int 10h
jmp print

return:
ret

halt:
jmp $

esc db "ESC: Exit", 0
f1 db " F1: HELP!!", 0
f3 db " F3: Reset Stgs", 0
f10 db " F10: Save and Exit", 0
updwn db ' ', 0x18, 0x19, ": Up Down", 0
lftrgt db ' ', 0x1B, 0x1A, ": Left Right", 0

 times 510 - ($ - $$) db 0
 dw 0xAA55
