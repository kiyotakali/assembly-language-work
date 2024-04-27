data segment
    M dw 0022h, 0023h, 0031h, 0021h, 0054h, 0001h, 0002h, 0003h, 0004h, 0005h, 0006h, 0007h, 0008h, 0009h, 0010h, 0011h
    max dw ?
    max_offset dw ?
    n dw 16 
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    mov bx, 0 
    mov cx, [n] 
    mov si, cx
    shl si, 1 
    mov di, si
    mov ax, [M]  
    mov [di], ax  
    add si, 2  

find_max:
    mov ax, [M+bx]  
    cmp ax, 8000h  
    je is_min_negt
    or ax, ax  
    jns check_max  
    neg ax ; 
    jmp check_max  
is_min_negt:
    mov [di], ax  
    mov [di+2], bx  
    jmp next_val 
check_max:
    cmp ax, [di]
    jle next_val  
    mov [di], ax  
    mov [di+2], bx  
next_val:
    add bx, 2 
    loop find_max

    mov ax, 4c00h
    int 21h
code ends

end start
