.MODEL small
.STACK 256
.data
n db 3
TV struc
    brand db 15 dup (?)
    price db ?
    country db 15 dup (?)
    resolution db 15 dup (?)
TV ends
tvs TV <"Apple$", 15h, "USA$", "800x600$">
    TV <"HTC$", 43h, "Tay Van$", "1366x768$">
    TV <"Sony$", 30h, "China$", "1920x1080$">
endl db 10, 13, "$"
strCountry db "Country: $"
strBrand db "Brand: $"
strResolution db "Resolution: $"
client db 16h
.code
main:
    mov ax, @data   
    mov ds, ax
    
    mov bx, type tvs  
    mov di, 0
    mov ah, [tvs[0]].price
    mov si, bx
    mov cx, 1
    xor dx, dx
    mov dl, n
    mov al, client
    
    strucLoop:
        cmp cx, dx
        jge exitLoop
        
        cmp al, [tvs[si]].price
        jl nextLoop
        
        cmp ah, [tvs[si]].price
        jge nextLoop
        
        mov ah, [tvs[si]].price
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
    lea dx, endl
    int 21h
    lea dx, strResolution
    int 21h
    lea dx, tvs[di].resolution
    int 21h
    
    
    mov ax,4c00h
    int 21h
end main