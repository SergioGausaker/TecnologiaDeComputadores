.data
tam:	.word 8
datos:	.word 2, 4, 6, 8, -2, -4, -6, -7
res:	.word 0

.text
.global main
main:	ldr r0, =tam @guarda en el registro r0 la dirección en memoria del "tamaño del vector"
		ldr r1, [r0] @asigna el tamaño del array en r1
		ldr r2, =datos @guarda en el registro r2 la dirección de memoria de "los valores del vector"
		mov r3, #0 @asigna a un registro r3 el valor 0
loop:	cmp r1, #0 @resta 0 a r1 para catualizar los flags de estado
		beq salir @si la condicion de igualdad se cumple (r1 == 0), salta a la instrucción salir
		ldr r4, [r2], #4 @ en el registro r4, se almacena el valor de guardado en la posición de memoria que indica el registro r2. Luego, se incrementa en 4 el valor de r2
		add r3, r3, r4 @ en el registro r3 se guarda el resultado de sumar los valores de los registros r3 y r4
		sub r1, #1 @al valor del registro r1,se le resta 1.
		b loop @vuelve a saltar a la instrucción loop, ejecutandose en bucle.
salir:	ldr r0, =res @asigna a res la dirección de memoria de r0.
		str r3, [r0] @almacena el resultado.
		bx lr @ es igual a mov pc lr. El "return" del programa.

