.data
car: .ascii "O"
cad: .asciiz "AEIOUaeiou"
res: .word 0

.code
lbu $a0, car($0)
jal es_vocal
sd $v0, res($0)
halt


es_vocal: dadd $v0, $0, $0	; inicio valor de retorno
daddi $t0, $0, 0			; inicio desplazamiento

loop: lbu $t1, cad($t0)		; $t1 = elem. de cad
beqz $t1, fin				; si $t1 = 0 salto
beq $a0, $t1, vocal			; si $t1 = $a0 salto
daddi $t0, $t0, 1			; aumento el desplazamiento
j loop							
vocal: daddi $v0, $0, 1		; si es vocal retorno 1

fin: jr $ra