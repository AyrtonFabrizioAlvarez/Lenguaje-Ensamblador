.data
num1: .word 2.5
num2: .word 526


.code

ld r1, num2(r0)

mtc1 r1, f3
cvt.d.l f2, f3

;mfc1 r2, f1



;cvt.l.d f4, f1

halt