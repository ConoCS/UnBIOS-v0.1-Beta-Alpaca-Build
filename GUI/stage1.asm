[BITS 16]
[ORG 0x7C00]

mov ax, 0x8000
mov ds, ax
jmp 0x8000:0000

times 510 - ($ - $$) db 0
dw 0xAA55