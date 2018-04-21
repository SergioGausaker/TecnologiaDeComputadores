@paso por r0 el numero, en r4 voy a tratar el resultado y voy a devolverlo en r0


cuad:	push {r4,lr}		 @guardo r4 en pila para no pisarlo ya que es un registro preservado
		mov r4, #0			 @inicio r4 en 0
		cmp r0, #1           @comparo el r0 con #1
		movlt r0, #0         @si es menor que 1 muevo al resultado 1
		movlt pc, lr		 @si es menor que 1 acabo el programa
		bgt call			 @si llega aquí es porque es 1 o mayor entonces salta a call
		mov r4, r0			 @como r0 vale 1, lo muevo a r4, para que se haga posteriormente la suma
		b fin                @salto al fin

call:   mul r4, r0, r0		 @hago el cuadrado de r0 y lo meto en r4
		sub r0, r0, #1		 @bajo r0(el contador) uno
		bl cuad				 @vuelvo a cuad
		add r4, r4, r0       @sumo r4 cuando vuelvo

fin:    mov r0, r4			 @guardo el resultado el r0
		pop {r4,lr}			 @saco r4 original y lr
		bx lr				 @continuo el programa
	                         @si ha habido una llamada recursiva anterior
							 @vuelve a esa llamada recursiva con el resultado de esta
							 @para sumárselo posteriormente