assume cs:code,ds:data 
data segment
    id  db  '2223312154'
    array  db  76,69,84,90,73,88,99,63,100,80
	s6  db  0
	s7  db  0
	s8  db  0
	s9  db  0
	s10  db  0
data ends

code segment
    main    proc  far
        mov   ax, data
        mov   ds, ax
		mov cx,10
		lea bx,array
    xunhuan:
	    mov al,[bx]
		call count
		inc  bx
		loop xunhuan
        mov   ax, 4c00h
        int   21h
    main    endp
	
	count  proc  near
		cmp  al,100
		jz   score_100
		cmp  al,60
		js   exit
		cmp  al,70
		js   score_60
		cmp  al,80
		js   score_70
		cmp  al,90
		js   score_80
		jmp  score_90
	    ret
	score_100:	
		inc  s10
		ret
	score_90:	
		inc  s9
		ret
	score_80:	
		inc  s8
		ret
	score_70:
		inc  s7
		ret
	score_60:
		inc  s6
		ret
	exit:
	    ret
	count  endp 
code ends
end main 