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
    
    call sort
    call print
    
    
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

sort PROC NEAR
    
    mov bx, 0
    
    floop:
        mov di, 0
        
        sloop:
            mov dl, A[di]
            mov dh, A[di + 1]
        
            
            cmp dl, dh
            jle next
            mov A[di], dh
            mov A[di + 1], dl
            
            next:
            
            inc di
            mov cx, di
            inc cx
            cmp cl, siz
        jl sloop
        
        inc bx
        cmp bl, siz
    jl floop
    
    ret
sort ENDP

end start