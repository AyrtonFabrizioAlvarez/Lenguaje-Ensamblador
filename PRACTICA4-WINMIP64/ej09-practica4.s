.data
X: .word 0
Y: .word 2
A: .word 5

.code
ld r1, X(r0)
ld r2, Y(r0)
ld r3, A(r0)

loop: dadd r1, r1, r2
sd r1, X(r0) 

daddi r3, r3, -1
bnez r3, loop
sd r3, A(r0)

halt