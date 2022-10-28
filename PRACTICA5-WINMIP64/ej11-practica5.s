.data
cadena: .word 1, 3, 5, 7, 0
res: .word 0


.code
daddi $sp, $0, 0x400			; inicializo la pila
daddi $a0, $0, cadena			; $a0 = puntero a cadena
jal contar_vocales
sd $v0, res($0)					; res = $v0 = valor de retorno (cantidad de digitos impares en la cadena)
halt


contar_vocales:
daddi $sp, $sp, -8				; PUSH $ra, guardo la direccion de $ra ya que voy a llamar a otra subrutina
sd $ra, 0($sp)


dadd $v0, $0, $0				; inicializo el valor de retorno
dadd $t0, $0, $0				; inicializo el contador
loop: ld $a1, 0($a0)			; $a1 = elem. de la cadena
beqz $a1, fin					; si $a1 = 0 termino la cadena
jal es_impar					
beqz $v1, par_prox				; si $v1 = 0 entonces el numero es par, salto

daddi $t0, $t0, 1

par_prox: daddi $a0, $a0, 8		; aumento el desplazamiento
j loop


fin: dadd $v0, $v0, $t0
ld $ra, 0($sp)					; POP $ra, recupero direccion de retorno
daddi $sp, $sp, 8

jr $ra


es_impar: 
dadd $v1, $0, $0				; inicializo valor de retorno
andi $t1, $a1, 1				; $t1 = and entre $a1, 1
beqz $t1, par_fin				; si es 0 es par

daddi $v1, $0, 1				; aumento contador si es impar

par_fin: jr $ra