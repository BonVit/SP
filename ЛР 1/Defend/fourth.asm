OutStack SEGMENT PARA STACK 'STACK'
    DB 64 DUP(?)
OutStack ends

OutData SEGMENT PARA PUBLIC 'DATA'
    first db "First line!", 10, 13, '$'
    second db "Second line!", 10, 13, '$'
OutData ends

DATA1 SEGMENT PARA PUBLIC 'DATA1'
    third db "Third line!", 10, 13, '$'
    fourth db "Fourth line!", 10, 13, '$'
    fifth db "Fifth line!", 10, 13, '$'
DATA1 ends

OutCode SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:OutCode, SS:OutStack
start:
    mov ax, OutData
    mov ds, ax
    ASSUME DS:OutData
    lea dx, first
    mov ah, 09h
    int 21h
    lea dx, second
    mov ah, 09h
    int 21h
    
    mov ax, DATA1
    mov es, ax
    push es
    pop ds
    ASSUME ES:DATA1
    lea dx, third
    mov ah, 09h
    int 21h
    lea dx, fourth
    mov ah, 09h
    int 21h
    lea dx, fifth
    mov ah, 09h
    int 21h
    
  
    
    mov ax, 4c00h
    int 21h
OutCode ends
end start