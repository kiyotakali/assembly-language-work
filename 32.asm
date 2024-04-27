func  macro
    if  len le 5
	    rept len
		    add ax,ax
		endm 
	else
	    rept 6
		    add ax,ax
	    endm 
	endif
	  endm
assume cs:code, ds:data
data segment
    id  db  '2223312154'
	X   db  '12154'
	;X   db  '2223312154'
	len equ ($-X)
data ends
code segment
    main    proc
        mov   ax, data
        mov   ds, ax
        mov ax,1
		func
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 