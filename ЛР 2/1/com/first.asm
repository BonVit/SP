.model small
.code
org 100h
start:
    mov al, 12h
    mov bl, 56h
    mov cx, 89h
    mov ah, 34h
    mov bh, 78h
    mov dx, 0ABCH
    XCHG ax, bx
    XCHG cx, dx
    mov si, ax
    mov di, bx
    mov bp, cx
    mov ax, 4c00h
    int 21h
end start
