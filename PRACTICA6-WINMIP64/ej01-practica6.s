.data
data: .word32 0x10008
control: .word32 0x10000
texto: .asciiz ""



.code
dadd $t9, $0, $0
lwu $s0 , data($0)
lwu $s1, control($0)
daddi $t0, $0, 9
daddi $t1, $0, 0x30				; $t1 = 0 (para comparar y hacer condicion de corte)
loop: sd $t0, 0($s1)			; pongo un 9 en control($s1) para leer por pantalla
lbu $t2, 0($s0)					; $t2 = elem. leido
beq $t2, $t1, imprimir			; si $t2(elem. de cadena) = $t1 (0x30)
sb $t2, texto($t9)				; guardo el caracter en la cadena antes de volver al loop
daddi $t9, $t9, 1				; aumento el desplazamiento
j loop

imprimir: dadd $t3, $0, $0		; $t3 = 0
sd $t3, texto($t9)				; al final de la cadena pongo un 0 para que sea asciiz
daddi $t3, $0, 6				; $t3 = 6
sd $t3, 0($s1)					; control = 6 para limpiar pantalla
daddi $t4, $0, texto			; $t4 = puntero a cadena
sd $t4, 0($s0)					; data = puntero a cadena
daddi $t5, $0, 4				; $t5 = 4
sd $t5, 0($s1)					; control = 4 (imprime la cadena asciiz referenciada en data)
halt
