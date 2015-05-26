.model small
.stack 100h
.data
Hello DB 'Hello, world!$'
.code
start:
mov ax,@data
mov ds,ax
LEA DX,Hello
mov ah,09h
int 21h             
mov ax,4c00h
int 21h
end start
