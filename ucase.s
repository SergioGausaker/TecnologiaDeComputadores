.data
cadena: .asciz "Esto es una prueba"

.text 
main:   ldr r0, =cadena 
        bl ucase
ucase:  ldrb r1, [r0], #1
		cmp r1, #0
		beq salirprog
		cmp r1, #97
		blt salir
		cmp r1, #122
		bgt salir
		sub r1, r1, #32
		sub r0, r0, #1
		strb r1, [r0]
salir:	b ucase
  


salirprog:	mov pc, lr