;inc on 4 max elements in colomns and min in rows
.model small
.stack 100h
.data
  A db 3, 2
    db 4, 1
    db 2, 3
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
    
    call incColom
    call print
    lea dx, endl
    int 21h
    call incRow
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
    
incColom PROC NEAR
    mov bx, 0
    mov di, 0
    
   
    
    floop:
        mov si, 0
        mov dh, A[di]
        mov ax, di
        
        sloop:
            mov dl, A[di]
            
            cmp dl, dh
            jle next    
            mov dh, dl
            mov ax, di
            
            
            
            next:
            
            inc di
            inc si
            mov cx, si
            cmp cl, m
        jl sloop
        
        mov si, ax
        mov al, A[si]
        add al, 4
        mov A[si], al
        
        inc bx
        cmp bl, n
    jl floop

    ret
incColom ENDP

incRow PROC NEAR
    mov bx, 0
    mov di, 0
    
    loop1:
        mov si, 0
        mov di, bx
        
        mov dh, A[di]
        mov ax, di
        
        loop2:
            mov dl, A[di]
            
            cmp dl, dh
            jge nex
            mov dh, dl
            mov ax, di
            
            nex:
            
            xor cx, cx
            mov cl, m
            add di, cx
            inc si
            mov cx, si
            cmp cl, n
        jl loop2
        
        mov si, ax
        mov al, A[si]
        add al, 4
        mov A[si], al
    
        inc bx
        cmp bl, m
    jl loop1  
    ret
incRow ENDP


end start