 
section  .data ;Data segment
	userMsg db 'el resultado es : ' 
	lenUserMsg equ $-userMsg  ;longitud de userMsg
	
section .bss  ;dato en dondee almacenara los numero a ingresar
	
	primerresultado resb 5
	segundoresultado resb 5
	tercerresultado resb 5
	
	resfin1 resb 5
	resfin2 resb 5

section .text  ;Code Segment
	global _start

	
	_start:
	
	mov eax,2
	mov ebx,2
	mul ebx
	mov ebx,2
	mul ebx
	mov ebx,3
	mul ebx
	mov ebx,3
	
	div ebx
	mov [tercerresultado],eax
	
	;segundo resultado
	mov eax,2
	mov ebx,2
	mul ebx
	mov ebx,3
	mul ebx
	mov ebx,2
	div ebx
	mov [segundoresultado],eax
	
	;primer resultado
	mov eax,2
	mov ebx,4
	mul ebx
	mov [primerresultado],eax
	
	add eax,[segundoresultado]
	sub eax,[tercerresultado]
	mov [resfin1],eax
	
	;;segunda parte
;=======================================================SEGUNDA PARTE ============================================================
	
	;;segunda parte
	;tercerresultado segunda parte
	mov eax,0
	mov ebx,0
	mul ebx
	mov ebx,0
	mul ebx
	mov ebx,3
	mul ebx
	mov ebx,3
	div ebx
	
	mov [tercerresultado],eax


	;segundo resultado
	mov eax,0
	mov ebx,0
	mul ebx
	mov ebx,3
	mul ebx
	mov ebx,2
	div ebx
	mov [segundoresultado],eax
	
	;primer resultado
	mov eax,0
	;mov [primerresultado],eax
	
	add [segundoresultado],eax
	mov eax,[segundoresultado]
	sub eax,[tercerresultado]
	mov [resfin2],eax
	
	
	
	mov eax,[resfin2]
	sub [resfin1],eax
	
	

	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg   
	mov edx, lenUserMsg 
	int 80h    
	
	mov eax,48
	add [resfin1],eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resfin1
	mov edx, 5
	int 80h ;imprime el contenido de num en pantalla que es de tamañano 5


	; codigo de salida
	mov eax, 1
	mov ebx, 0
	int 80h