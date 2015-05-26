.model small
.stack 100h
.data
msg1 db 'Used JBE$'
msg2 db 'Used JA$'
.code
start:
    mov ax, @data
    mov ds, ax
    
    mov dx, 'a' - 1
    mov ah, 02h
    mov cx, 5
    loop1:
        inc dx
        int 21h
    loop loop1
    
    mov bx, 0
    loop2:
        inc dx
        int 21h
        add cx, bx
        inc bx
    JCXZ loop2
    
    mov ah, 09h
    mov bx, '5'
    mov cx, '5'
    cmp bx, cx
    jbe lower
    jmp noth1
    lower:
        lea dx, msg1
        int 21h
    noth1:
    ja greater
    jmp noth2
    greater:
        lea dx, msg2
        int 21h
    noth2:
    
    mov ax, 4c00h
    int 21h
end start