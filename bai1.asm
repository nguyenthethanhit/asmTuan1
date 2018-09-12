.model small
.stack 100h
.data
tb1 db 'nhap so nhi phan 1:$'
tb2 db 'nhap so nhi phan 2:$' 
tb3 db 'tong cua 2 so la:$' 
i db 0
cr db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    start:
    mov ah,9
    lea dx,tb1
    int 21h 
    
    mov ah,9
    lea dx,cr
    int 21h
    
    xor bx,bx
    
    nhap1:
    mov ah,1
    int 21h
    
    cmp al,13
    je nhap2
    and al,0fh
    shl bx,1 
    or bl,al
    jmp nhap1
    
    
   nhap2:
   xor al,al
   mov ah,9
   lea dx,cr
   int 21h 
   xor dx,dx
   nhap21:
   mov ah,1
   int 21h
    
   cmp al,13
   je hienthi
   and al,0fh 
   shl dx,1
   or dl,al
   jmp nhap21
   
     
    hienthi: 
    
    add bx,dx
    mov cx,16 
    mov ah,9
    lea dx,tb3
    int 21h
    
    mov ah,9
    lea dx,cr
    int 21h
    
    mov ah,2
    hien: 
    xor dl,dl
    rol bx,1
    adc dl,30h 
    int 21h
    loop hien
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    