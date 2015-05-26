.model small
.stack 100h
.data
A dw 8h
B db 3h
D db 2h
P db 6h
.code
start:
    mov ax, @data
    mov ds, ax
    
    ;B*D
    mov al, B
    mul D
    
    ;A-B*D
    sub A, ax
    mov ax, A
    
    ;(A-B*D)/P
    div P
    
    mov ax, 4c00h
    int 21h
end start