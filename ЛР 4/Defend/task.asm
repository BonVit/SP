.model small
.stack 100h
.data
a db "aga asd maam$"
address db ?
.code
start:
    mov ax, @data
    mov ds, ax
    
    mov si, 0
    mov di, 0
    mov cl, 0
   
    while_not_eol:
        define_word:
            mov dh, a + di + 1
            cmp dh, ' '  
            je exit_w
            cmp dh, '$'
            je exit_w
            inc di
        jmp define_word
        
        exit_w:
            mov ax, si
            mov bx, di
        
        exit_word:    
            
            
            mov dl, a + si
            mov dh, a + di   
            
            cmp si, di
            je found
            
            inc si
            cmp si, di
            je found

            dec di
            
            cmp dl, dh
            jne next_loop
            
            cmp dl, dh
        je exit_word
        
        found:
            inc cl
            
        
        next_loop:
        mov si, bx
        add si, 2
        mov di, bx
        inc di
        mov ch, a + di
        cmp ch, '$'
        je exit
        inc di
    jne while_not_eol
    exit:
    
    mov ax, 4c00h
    int 21h
end start