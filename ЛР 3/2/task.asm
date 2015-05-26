.model small
.stack 100h
.data
D db 3h
A dw 13h
T db 4h
C dw 5h
B db 6h
F db 3h
.code
start:
    mov ax, @data
    mov ds, ax
    
    ;3T-C
    mov al, 3
    mul T
    sub ax, C
    
    ;2A*(3T-C)
    mov cx, ax
    mov al, 2
    mul A
    mul cx
    
    ;4D+2A*(3T-C)
    mov cx, ax
    mov al, 4
    mul D
    add cx, ax
    
    
    ;(A-B*D)/P
    mov al, B
    mul D
    mov dx, A
    sub dx, ax
    mov ax, dx
    div F
    
    ;4D+2A*(3T-C) + (A-B*D)/P
    add cl, al
    
    mov ax, 4c00h
    int 21h
end start