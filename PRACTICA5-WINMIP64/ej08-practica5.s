.data
cad1: .asciiz "hola"
cad2: .asciiz "hosa"
res: .word 0

.code
daddi $sp, $sp, 0x400		; inicio el SP

daddi $a0, $0, cad1			; $s0 = puntero a cad1
daddi $a1, $0, cad2			; $s1 = puntero a cad2
jal subrutina				
sd $v0, res($0)
halt

subrutina:

dadd $v0, $v0, $0				; valor de retorno
daddi $t2, $0, 1				; posicion

loop: lbu $t0, 0($a0)			; $t0 = elem. de cad1
lbu $t1, 0($a1)					; $t1 = elem. de cad2

bnez $t0, sigue					; si $t0 != 0 salto a sigue
beq $t0, $t1, identicas			; si ($t0 = 0 && $t0 = $t1) salto a identicas
j distintos						; si uno es 0 y el otro no son distintos

sigue: bne $t0, $t1, distintos	; si $t0 != $t1 salto a "distintos"

daddi $a0, $a0, 1 				; aumento el desplazamiento
daddi $a1, $a1, 1				; aumento el desplazamiento
daddi $t2, $t2, 1				; aumento la posicion
j loop

identicas: daddi $v0, $v0, -1	; si son identicas retorno -1
j fin


distintos: dadd $v0, $v0, $t2 	; si son distintos retorno la posicion donde encontre la desigualdad


fin: jr $ra
