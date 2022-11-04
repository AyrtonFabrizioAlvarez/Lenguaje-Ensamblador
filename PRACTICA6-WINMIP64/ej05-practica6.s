.data
control: .word32 0x10000
data: .word32 0x10008

msj_exponente: .asciiz "Ingrese el exponente (entero sin signo)"
msj_base: .asciiz "Ingrese la base (punto flotante)"

uno: .double 1.0

.code
lwu $s0, data($0)
lwu $s1, control($0)

daddi $t0, $0, msj_base
sd $t0, 0($s0)
daddi $t1, $0, 4
sd $t1, 0($s1)

daddi $t0, $0, 8
sd $t0, 0($s1)
l.d f1, 0($s0)	; f1 = BASE

daddi $t0, $0, msj_exponente
sd $t0, 0($s0)
sd $t1, 0($s1)

daddi $t0, $0, 8
sd $t0, 0($s1)
ld $a0, 0($s0)	; a0 = exponente

jal potencia

halt

potencia: l.d f2, uno($0)
beqz $a0, imprimir

loop: mul.d f2, f2, f1
daddi $a0, $a0, -1
bnez $a0, loop

imprimir: s.d f2, 0($s0)
daddi $t0, $0, 3
sd $t0, 0($s1)

jr $ra

