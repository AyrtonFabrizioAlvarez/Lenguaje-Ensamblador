.data
data: .word32 0x10008
control: .word32 0x10000
cadena1: .ascii "0000000000"
cadena2: .ascii "0000000000"


.code
lwu $s0, data($0)
lwu $s1, control($0)

daddi $a0, $0, cadena1
daddi $a1, $0, cadena2

daddi $t9, $0, 0	; desplazamiento cadena1
daddi $t8, $0, 0	; desplazamiento cadena2
daddi $t7, $0, 0x30	; para comparar caracter ascii leido

jal leerCadena
jal guardarCadena

daddi $a0, $0, cadena1
daddi $a1, $0, cadena2

sb $a0, 0($s0)
daddi $t0, $0, 4
sb $t0, 0($s1)

sb $a1, 0($s0)
sb $t0, 0 ($s1)


halt

guardarCadena: lbu $t0, 0($a0)
sb $t0, 0($a1)
daddi $a1, $a1, 1
daddi $a0, $a0, -1
daddi $t9, $t9, -1
bnez $t9, guardarCadena
daddi $t0, $0, 0
sb $t0, 0($a1)
jr $ra

leerCadena: daddi $t0, $0, 9
sd $t0, 0($s1)
lbu $t1, 0($s0)
beq $t1, $t7, corto
sb $t1, 0($a0)
daddi $a0, $a0, 1
daddi $t9, $t9, 1
j leerCadena
corto: daddi $t0, $0, 0
sb $t0, 0($a0)
daddi $a0, $a0, -1
jr $ra
