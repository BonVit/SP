.MODEL small
.STACK 256
.data
n db 3
TV struc
    brand db 30 dup (?)
    price db 0
    country db 30 dup (?)
TV ends
tvs TV <"Apple$", 30h, "USA$">
    TV <"HTC$", 43h, "Tay Van$">
    TV <"Sony$", 15h, "China$">
endl db 10, 13, "$"
strCountry db "Country: $"
strBrand db "Brand: $"
.code
main:
    mov ax, @data   
    mov ds, ax
    
    mov bx, type tvs  
    mov di, 0
    mov dl, [tvs[0]].price
    mov si, bx
    xor cx, cx
    mov cl, 1
    mov dh, n
    
    strucLoop:
        cmp cl, dh
        jge exitLoop
        
        cmp dl, [tvs[si]].price
        jge nextLoop
            
        mov dl, [tvs[si]].price
        mov di, si
        
        nextLoop:
        add si, bx
        inc cx
    jmp strucLoop
    exitLoop:
    
    mov ah, 09h
    lea dx, strBrand
    int 21h
    lea dx, tvs[di].brand
    int 21h
    lea dx, endl
    int 21h
    lea dx, strCountry
    int 21h
    lea dx, tvs[di].country
    int 21h
    
    
    mov ax,4c00h
    int 21h
end main