.data
num: .word 4
tabla: .word 1, 2, 3, 4, 5
longitud: .word 5
resultado: .word 0

.code
ld $a0, num($0)			; $a0 = 2 
daddi $a1, $0, tabla	; $a1 = puntero a tabla
ld $a2, longitud($0)	; $a2 = 5 (longitud)
jal subrutina
sd $v0, resultado($0)
halt

subrutina:	dadd $v0, $0, $0	; inicio valor de retorno (contador)
dadd $t0, $0, $0				; $t0 = desplazamiento

loop: ld $t1, 0($a1)			; $t1 = elem. de la tabla
slt $t2, $t1, $a0				; si $t1 < $a0 entonces $t2 = 1
bnez $t2, menor					; si es menor salto
beq $t1, $a0, menor				; si es igual salto

daddi $v0, $v0, 1				; aumento valor de retorno (contador)

menor: daddi $a1, $a1, 8		; aumento el desplazamiento
daddi $a2, $a2, -1				; disminuyo la longitud
bnez $a2, loop

jr $ra



