.data
num1: .word 2
num2: .word 4
res: .word 0

.code
ld r1, num1(r0)
ld r2, num2(r0)


dadd r3, r0, r0
loop: daddi r1, r1, -1
dadd r3, r3, r2
bnez r1, loop



sd r3, res(r0)

halt
