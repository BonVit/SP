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
    mov ABC, ah
    mov ABC + 1, bh
    mov ABC + 2, ch
    
    mov ah, SRC
    push ax
    mov ah, SRC + 1
    push ax
    mov ah, SRC + 2
    push ax
    mov ah, SRC + 3
    push ax
    mov ah, SRC + 4
    push ax
    mov ah, SRC + 5
    push ax
    mov ah, SRC + 6
    push ax
    mov ah, SRC + 7
    push ax
    
    
    xor dx, dx
    pop dx
    mov DST + 7, dh
    pop dx
    mov DST + 6, dh
    pop dx
    mov DST + 5, dh
    pop dx
    mov DST + 4, dh
    pop dx
    mov DST + 3, dh
    pop dx
    mov DST + 2, dh
    pop dx
    mov DST + 1, dh
    pop dx
    mov DST, dh
   
    mov ax, 4c00h
    int 21h
end start
