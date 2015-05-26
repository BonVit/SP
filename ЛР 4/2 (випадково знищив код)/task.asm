.model small
.stack 100h
.data
a db "aga maam$"
address db ?
.code
start:
    mov ax, @data
    mov ds, ax
    
    mov si, 0
    mov di, 0
   
    while_not_eol:
        define_word:
            mov dh, a + di
            cmp dh, ' '  
            je exit_word
            cmp dh, '$'
            je exit_word
            inc di
        jmp define_word
        exit_word:
                        
        
        mov dh, a + di 
        cmp dh, '$'
    jne while_not_eol
    
    mov ax, 4c00h
    int 21h
end start