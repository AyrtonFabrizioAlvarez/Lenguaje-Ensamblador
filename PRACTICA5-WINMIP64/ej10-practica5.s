.data

cadena: .asciiz "apAEIrtvb:ruebAeuioEIUtryvfg"			; 14 vocales
vocales: .asciiz "AEIOUaeiou"
res: .word 0

.code

daddi $sp, $0, 0x400			; inicio la pila
daddi $a1, $0, cadena			; $a1 = puntero a cadena
jal contar_voc
sd $v1, res($0)
halt


contar_voc: daddi $sp, $sp, -8		; "push" guardo primera direccion de retorno
sd $ra, 0($sp) 

daddi $v1, $0, 0					; inicio valor de retorno
daddi $t2, $0, 0					; inicio desplazamiento

loop2: lbu $a0, cadena($t2)
beqz $a0, fin2						; si $a0 = 0 salto (termino la cadena)
jal es_vocal
beqz $v0, no_es						; si $v0 = 0 salto
daddi $v1, $v1, 1					; si es vocal aumento en 1 el retorno
no_es: daddi $t2, $t2, 1			; aumento el desplazamiento
j loop2

fin2: ld $ra, 0($sp)
daddi $sp, $sp, 8					; "pop" tomo nuevamente direccion de retorno original

jr $ra


es_vocal: dadd $v0, $0, $0			; inicio valor de retorno
daddi $t0, $0, 0					; inicio desplazamiento

loop: lbu $t1, vocales($t0)			; $t1 = elem. de cad
beqz $t1, fin						; si $t1 = 0 salto
beq $a0, $t1, vocal					; si $t1 = $a0 salto
daddi $t0, $t0, 1					; aumento el desplazamiento
j loop							
vocal: daddi $v0, $0, 1				; si es vocal retorno 1

fin: jr $ra