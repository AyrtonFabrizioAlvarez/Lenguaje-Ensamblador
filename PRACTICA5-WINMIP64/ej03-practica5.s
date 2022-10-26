.data
base: .double 5.85
altura: .double 13.47
div: .double 2.0
superficiePF: .double 0.0
superficieE: .word 0

.code
l.d f1, base(r0)
l.d f2, altura(r0)


mul.d f1, f1, f2 	; base * altura
l.d f3, div(r0) 	; cargo "div" es para dividir por 2.0
div.d f1, f1, f3 	; (base*altura) / 2.0

s.d f1, superficiePF(r0) ; cargo superficie

halt
