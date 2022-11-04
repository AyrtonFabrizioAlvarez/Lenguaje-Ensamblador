.data
control: .word32 0x10000
data: .word32 0x10008
err: .asciiz "ERROR"
ok: .asciiz "Bienvenido hijo de puta"
clave: .asciiz "coco"
pass: .asciiz "...."

.code
lwu $s1, control($0)
lwu $s0, data($0)
daddi $t1, $0, 0		; $t1 = desplazamiento
daddi $t2, $0, 4		; $t2 = cant caracteres

leer: jal char

sb $v0, pass($t1)		; guardo $v0(retorno de char) en la cadena pass
daddi $t1, $t1, 1		; aumento el desplazamiento
daddi $t2, $t2, -1		; disminuyo el total de caracteres
bnez $t2, leer

daddi $a0, $0, 0		; "flag" de argumento para saber que imprimir

daddi $t1, $0, 0		; $t1 = desplazamiento
daddi $t2, $0, 4		; $t2 = cant caracteres

loop: lbu $t5, pass($t1)	; $t0 = elem de pass
lbu $t6, clave($t1)			; $t2 = elem de clave
bne $t5, $t6, noEs			; si no son iguales salto
daddi $t1, $t1, 1			; aumento el desplazamiento
daddi $t2, $t2, -1
beqz $t2, fin1
j loop

noEs: daddi $a0, $0, 1		; modifico el "flag"
fin1: jal respuesta
halt




char: daddi $t0, $0, 9		; $t0 = 9 (leer caracter)
sd $t0, 0($s1)
lbu $v0, 0($s0)

jr $ra

respuesta: daddi $t9, $0, 4		; $t9 = valor para imprimir asciiz
daddi $t0, $0, err				; $t0 = puntero a ERROR
daddi $t1, $0, ok				; $t1 = puntero a Bienvenido
beq $a0, $0, es					; si $a0 = 0 entonces imprimir bienvenido
sd $t0, 0($s0)
sd $t9, 0($s1)
j fin2

es: sd $t1, 0($s0)
sd $t9, 0($s1)

fin2: jr $ra
