.data
A: .word 5
B: .word 5
C: .word 5
D: .word 0


.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)

daddi r5, r0, 1

beq r1, r2, iguales
j pregunta

iguales: daddi r4, r4, 1

pregunta: beq r2, r3, iguales2	
j fin

iguales2: daddi r4, r4, 1

fin: dadd r4, r4, r5
sd r4, D(r0)
halt