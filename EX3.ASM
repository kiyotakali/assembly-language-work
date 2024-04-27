data segment
    x db 8H
    y db 2H
data ends

code segment
    assume cs:code,ds:data
    main proc
        mov ax,data
        mov ds,ax
        xor ax,ax
        mov bl, x
        mov al, bl;
        mov cl, y
        div cl
        mov dl, 2H
        mul dl
        mov dx, 0H
        mov dx, ax
        mov ax,4c00H
        int 21h
    main endp
code ends
end main