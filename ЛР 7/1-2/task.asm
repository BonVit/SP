.MODEL small
.STACK 256
.data
file1 db "in.txt", 0
;handle dw 1
buffer db 4 dup (' '), 10, 13, '$'
censored db '[CENSORED]', 10, 13, '$'
buff db ?
mat db "blin"
show macro
    mov ah, 09h
    int 21h
endm
compare macro
    lea dx, buffer
    mov si, 0
    strLoop:
        cmp buffer[si], '$'  
        je exitStrLoop
        mov ah, buffer[si]
        cmp ah, mat[si]
        jne exitStrLoop
        inc si
    jmp strLoop
    exitStrLoop:
        cmp si, 4
    jne exitCompare
    lea dx, censored
    exitCompare:
endm
.code
main:
    mov ax, @data   
    mov ds, ax
    
    mov ah, 3dh
    lea dx, file1
    xor cx, cx
    int 21h
    
    ;mov [handle], ax
    mov bx, ax
    
    mainLoop:
        mov si, 0
        read:
            mov ah, 3fh
            lea dx, buff
            mov cx, 1
            int 21h
            cmp buff, '$'
            je exit:
            cmp buff, ' '
            je exitRead
            mov al, buff
            mov buffer[si], al
            inc si
        jmp read
        exitRead:
        
        compare
        show
    jmp mainLoop
        
    exit:
    mov ax,4c00h
    int 21h
end main