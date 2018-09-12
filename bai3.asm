.model small
.stack 100h
.data 
tb1 db 'nhap xau:$'
xd db 10,13,'$'
count db 0

.code          
main proc
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    
    nhap:  
    mov ah,1
    int 21h
    
    cmp al,13
    je hienthi
    push ax
    inc count
    jmp nhap
    
    hienthi:
    mov ah,9
    lea dx,xd
    int 21h  
    hien:
    pop dx
    mov ah,2 
    int 21h
    dec count
    cmp count,0
    je thoat
    jmp hien
    
    thoat:
    mov ah,4ch
    int 21h  
    
    main endp
end main
    
    
