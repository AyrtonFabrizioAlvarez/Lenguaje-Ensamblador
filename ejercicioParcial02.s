.data
data: .word32 0x10008
control: .word32 0x10000
tabla: .word 4, 11, 18, 6, 17, 28, 9, 0, 11, 23, 15, 6, 37, 29, 14
menor: .word 20
mayor: .word 10
cantidad: .word 15
total: .word 0
nuevo: .word 0



.code
lwu $s6, data($0)
lwu $s7, control($0)
daddi $s0, $0, tabla
daddi $s1, $0, nuevo
ld $t0, mayor($0)
ld $t1, cantidad($0)
ld $t2, total($0)
 
loop: ld $t3, 0($s0)		; $t3 = elemento de "tabla"
slt $t4, $t3, $t0
bnez $t4, noEs				; si es menor a "mayor" salto
beq $t3, $t0, noEs			; si es igual a "mayor" salto

sd $t3, 0($s1)			; guardo $t3 en "nuevo"
daddi $t2, $t2, 1		; $t2 = cant de elementos que cumplen
daddi $s1, $s1, 8		; aumento $s1 para tener dir para guardar proximo caracter en "nuevo"

noEs: daddi $s0, $s0, 8	; aumento $s0 para tener proximo elemento de "tabla"
daddi $t1, $t1, -1		; decremento $t1 para terminar de recorrer
beqz $t1, imprimir
j loop
 
 
 
imprimir: dadd $t9, $t2, $0	; $t9 = $t2(cant de elementos que cumplen)
daddi $s0, $0, nuevo
daddi $t1, $0, 1

loop2: ld $t0, 0($s0)
sd $t0, 0($s6)
sd $t1, 0($s7)
daddi $s0, $s0, 8
daddi $t9, $t9, -1
bnez $t9, loop2

halt


