.data
car: .asciiz "a"
data: .word32 0x10008
control: .word32 0x10000

.code
lwu $s0, data($0)
lwu $s1, control($0)

daddi $t0, $0, car	; $t0 = puntero a car

sd $t0, 0($s0)
daddi $t1, $0, 4
sd $t1, 0($s1)


sb $t2, 0($s0)
daddi $t3, $0, 4
sd $t3, 0($s1)

halt