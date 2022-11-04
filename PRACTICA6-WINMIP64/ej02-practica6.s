.data
data: .word32 0x10008
control: .word32 0x10000

cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"

.code
lwu $s0, data($0)
lwu $s1, control($0)
jal ingreso
jal mostrar
halt

ingreso: daddi $t0, $0, 8		; $t0 = 8
leer: sd $t0, 0($s1)			; control = 8 (recibe un numero que guarda en hexadecimal en data)
ld $v0, 0($s0)					; $v0 = elemento ingresado
slti $t1, $v0, 0				; si $v0 < 0  entonces $t1 = 1
bnez $t1, leer					; si $t1 <> 0 (entonces $t1 es menor a 0) vuelvo a leer
slti $t2, $v0, 10				; si $v0 < 10 entonces $t2 = 1
beqz $t2, leer					; si $t1 = 0 (entonces es mayor de 9) vuelvo a leer
jr $ra

mostrar: daddi $t0, $0, 0 		; $t0 = 0 (desplazamiento)
loop: beq $v0, $t0, imprimir
daddi $t0, $t0, 1				; aumento el desplazamiento
j loop

imprimir: daddi $t2, $0, 8
dmul $t0, $t0, $t2
daddi $t1, $0, 4
nop
daddi $v1, $t0, cero
sd $v1, 0($s0)
sd $t1, 0($s1)