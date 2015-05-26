    .MODEL   small
    .code
    org   100h
    begin: jmp start
r   dw  34h
start:  
    mov ax, 65h
    mov [r], ax
    mov si, [r]
    mov bx, 70h
    mov [r], bx
    mov di, [r]
    mov cx, 40h
    mov [r], cx
    mov bp, [r]
exit:   mov al, 04ch
    int 21h
END begin