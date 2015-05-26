.model small
.stack 100h
.data
  A db 3, 2
    db 4, 1
    db 5, 6
  n db 3
  m db 2
  siz db 6
  endl db 10, 13, '$'
.code
start PROC NEAR
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    call print
    lea dx, endl
    int 21h
    
    
    
    
    mov ax, 4c00h
    int 21h
start ENDP

print PROC NEAR
    mov bx, 0
    mov di, 0
    
    firstloop:
        mov ah, 02h  
        mov si, 0
        
        secondloop:
            mov dl, A[di]
            inc di
            add dl, 30h
            int 21h
            mov dl, " "
            int 21h
            
            inc si
            mov cx, si
            cmp cl, m
        jl secondloop
        
        mov ah, 09h
        lea dx, endl
        int 21h
        
        inc bx
        cmp bl, n
    jl firstloop
    
    ret
print ENDP
    
incColom PROC NEAR
    mov bx, 0
    mov di, 0
    
    floop:
        mov si, 0
        
        sloop:
            mov dl, A[di]
            inc di
            
            
            
            inc si
            mov cx, si
            cmp cl, m
        jl sloop
        
        inc bx, cmp bl, n
    jl floop

    ret
incColom ENDP


end start