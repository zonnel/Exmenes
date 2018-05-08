 
SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

segment .data
	saludo db "ingrese un numero", 0xA,0xD
	tamaniosaludo equ $ - saludo
	texto db "numero par", 0xA,0xD
	tamaniotexto equ $ - texto
	
	texto2 db "numero impar", 0xA,0xD
	tamaniotexto2 equ $ - texto2
	
	msg4 db "<--",0xA,0xD
	len4 equ $ - msg4

segment .bss
	num1 resb 2
	num2 resb 2
	res resb 1


section  .text
	global _start  ;must be declared for using gcc
_start:  ;tell linker entry point
	;mov eax, SYS_WRITE
	;mov ebx, STDOUT
	;mov ecx, saludo
	;mov edx, tamaniosaludo
	;int 0x80

	;mov eax, SYS_READ
	;mov ebx, STDIN
	;mov ecx, num1
	;mov edx, 2
	;int 0x80


	
	;mov eax, 4
	;mov ebx, 1
	;mov ecx, num1
	;mov edx, 5
	;int 80h 
	
	;mov eax,[num1]
	;sub eax,'0'
	;mov [num1],eax

	;mov eax,48
	;add [num1],eax
	;mov eax, 4
	;mov ebx, 1
	;mov ecx, [num1]
	;mov edx, 5
	;int 80h 
	
	
	mov eax,6
	mov [num1],eax
	
	mov eax,48
	add [num1],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,msg4
	mov edx,len4
	int 80h
	mov eax,48
	sub [num1],eax
	
	
	ciclo:
	regresar:
	mov ax,[num1]
	cmp ax,1
	je salida
	
	mov ax,[num1]
	mov bx,2
	mov dx,0
	div bx
	
	cmp dx,0
	je par
	jmp impar
	
	par:
	mov ax,[num1]
	mov bx,2
	mov dx,0
	div bx
	mov [num1],ax
	
	mov ax,48
	add [num1],ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h 
	
	mov ax,48
	sub [num1],ax
	jmp regresar
	
	impar:
	mov ax,[num1]
	mov ebx,3
	mul ebx
	mov bx,1
	add ax,bx
	mov [num1],ax
	
	mov ax,48
	add [num1],ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h 
	
	mov ax,48
	sub [num1],ax
	jmp regresar
	

salida:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, len4
	int 80h 
	
	mov eax, SYS_EXIT
	xor ebx, ebx  ;EBX=0 INDICA EL CODIGO DE RETORNO (0=SIN ERRORES)
	int 0x80
