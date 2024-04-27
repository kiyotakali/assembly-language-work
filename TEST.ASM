data segment
    x db 1H
    Y db 2H
    W db 10H
    Z db ?
    STU db '2223312154'
data ends

code segment
    assume cs:code,ds:data
    main proc
        mov ax,data
        mov ds,ax
        xor ax,ax
        mov al,W
        sub al,x
        mov bx,5H
        div bx
        mov cl,Y
        imul cl
        mov cx,2H
        div cl
        mov Z,al
        mov ax,4c00H
        int 21H
    main endp
code ends
end main