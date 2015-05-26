.model small
.stack 100h
.data
SRC db 1, 2, 3, 4, 5, 6, 7, 8
DST db 8 DUP(?)
ABC db 3 DUP(?)
.code
start:
    mov ax, @data
    mov ds, ax
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
