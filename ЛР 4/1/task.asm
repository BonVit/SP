.model small
.stack 100h
.data
endl db 10, 13, '$'
a db 10 DUP(?)
.code
start:
    mov ax, @data
    mov ds, ax
    
    mov ah, 0ah
    lea dx, a
    int 21h
    
    mov ah, 09h
    lea dx, endl
    int 21h
    
    lea dx, a + 2
    int 21h
    
    mov dx, 378h
    lea di, a + 2
    rep outsb
    
    
    
    mov ax, 4c00h
    int 21h
end start