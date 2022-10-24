.data
TABLA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
X: .word 5
CANT: .word 0
RES: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
TOTAL: .word 10

.code
ld r1, TABLA(r0)	; r1 = posicion al principio de TABLA
ld r2, X(r0)		; r2 = X
ld r3, CANT(r0)		; r3 = contador
dadd r4, r0, r0	; r4 = desplazamiento = 0
daddi r5, r0, 1		; r5 = para comparar luego de slt = 1
ld r6, TOTAL(r0)	; r6 = cant totales de elemtnos en la tabla


loop: slt r7, r1, r2		; si r1(tabla)<r2(x) entonces r7=1
nop
beq r7, r5, menor			; si r7=r5 (r5=1) entonces r1 es menor a X
beq r1, r2, menor




daddi r8, r0, 1				; r8 = 1
daddi r3, r3, 1				; sumo 1 al total de elementos mayores que x
sd r8, RES(r4)				; como es mayor a X, RES en esa posicion toma el valor 1


menor: daddi r4, r4, 8	 	; aumento el desplazamiento
daddi r6, r6, -1			; resto 1 al total de elementos para saber cuando llego al final
ld r1, TABLA(r4) 			; voy al proximo elemento de la tabla
bnez r6, loop 				; mientras no llegue al final vuelvo a LOOP

sb r3, CANT(r0)

halt
