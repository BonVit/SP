.model small
.stack 100h
.data
a db (?)
b db (?)
.code
start:
    mov ax, @data
    mov ds, ax
    
    ;first num 
    mov ah, 01h
    int 21h
    shl ax, 4
    mov dl, al
    mov ah, 01h
    int 21h
    shl ax, 12
    shr ax, 12
    add dl, al
    mov a, dl
    
    ;second num
    mov ah, 01h
    int 21h
    shl ax, 4
    mov dl, al
    mov ah, 01h
    int 21h
    shl ax, 12
    shr ax, 12
    add dl, al
    mov b, dl
    
    xor ax, ax
    mov al, a
    shr ax, 4
    shl ax, 8
    mov cl, a
    shl cx, 4
    xor ch, ch
    shr cx, 4
    add ax, cx
    
    xor cx, cx
    mov cl, b
    shr cx, 4
    shl cx, 8
    mov dl, b
    shl dx, 4
    xor dh, dh
    shr dx, 4
    add cx, dx
    
    mul cx
    aam
    
    mov cx, ax
    shr cx, 4
    xor dx, dx
    mov dl, cl
    add dl, al
    
    
    mov ax, 4c00h
    int 21h
end start