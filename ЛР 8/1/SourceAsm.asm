.586
.MODEL FLAT, C
.DATA
.CODE
getMin PROC C a:dword, min:dword
	mov eax, a
	cmp eax, min
	jle exitMin

	mov eax, min

	exitMin:

	ret
getMin ENDP

getMax PROC C a:dword, max:dword
	mov eax, a
	cmp eax, max
	jge exitMax

	mov eax, max

	exitMax:

	ret
getMax ENDP

getM PROC C min:dword, max:dword
	mov eax, min
	add eax, max
	ret
getM ENDP

END