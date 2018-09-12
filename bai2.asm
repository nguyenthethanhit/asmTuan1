.model small
.stack 100h
.data 
so1 db 0
so2 db 0  
count db 0 
xd db 10,13,'$'
tb1 db 'nhap so 1:$'
tb2 db 'nhap so 2:$'

.code
main proc 
    
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,tb1
    int 21h 
    
   
   
nhap1:
mov ah,1
int 21h
cmp al,13 ;so sanh al voi 13
je nhaptb2
add al,30h ; chuyen ky tu thanh so
mov dl,al ;cat al vao dl
mov al,so1 ; dua so vua nhap ve kieu byte
mov bl,10 ;gan bl =10
mul bl ;nhan al voi 10
add al,dl ;lay ket qua vua nhan cong voi so vua nhap
mov so1,al ;cat ket qua sau khi doi vao bien so1
jmp nhap1 ;nhay den nhan nhap 1 

 
mov ah,9
lea dx,xd
int 21h
mov ah,9
lea dx,tb2
int 21h 

 

nhaptb2: 
mov ah,9
lea dx,xd
int 21h

mov ah,9
lea dx,tb2
int 21h 

mov ah,9
lea dx,xd
int 21h

nhap2: 
mov ah,1
int 21h
cmp al,13 
je tinhtong
add al,30h 
mov dl,al 
mov al,so2 
mov bl,10 
mul bl 
add al,dl
mov so2,al 
jmp nhap2   

mov ah,9
lea dx,xd
int 21h

tinhtong: 
mov al,so1
mov bl,so2
add al,bl
mov cx,10 



again1:
    mov dx,0
    div cx
    add dl,30h
    push dx
    inc count 
    cmp ax,0
    jne again1 
    
    mov ah,9
    lea dx,xd
    int 21h
    
    again2:
    pop dx
    mov ah,2
    int 21h
    dec count
    cmp count,0
    jne again2
    
    mov ah,4ch
    int 21h 
    
    main endp
end main