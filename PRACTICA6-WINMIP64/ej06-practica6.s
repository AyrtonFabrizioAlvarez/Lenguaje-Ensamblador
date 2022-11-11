.data
color: .byte 0, 0, 0, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000
DATA: .word32 0x10008
ingresoX: .asciiz "eje x"
ingresoY: .asciiz "eje y"
ingresoR: .asciiz "rojo"
ingresoG: .asciiz "verde"
ingresoB: .asciiz "azul"
ingresoO: .asciiz "opacidad"


.text
lwu $s6, CONTROL($zero) 	; $s6 = dirección de CONTROL
lwu $s7, DATA($zero) 		; $s7 = dirección de DATA

daddi $t0, $0, ingresoY		
sd $t0, 0($s7)				; cargo en DATA "ingresoY"
daddi $t0, $0, 4
sd $t0, 0($s6)				; cargo 4 en CONTROL para mostrar mensaje
daddi $t0, $0, 8
sd $t0, 0($s6)				; cargo 8 en CONTROL para leer
lbu $s0, 0($s7)				; $s0 = coordenada Y

daddi $t0, $0, ingresoX		
sd $t0, 0($s7)				; cargo en DATA "ingresoX"
daddi $t0, $0, 4
sd $t0, 0($s6)				; cargo 4 en CONTROL para mostrar mensaje
daddi $t0, $0, 8
sd $t0, 0($s6)				; cargo 8 en CONTROL para leer
lbu $s1, 0($s7)				; $s1 = coordenada X

dadd $t1, $0, $0				; $t1 desplazamiento mensaje
dadd $t2, $0, $0				; $t2 desplazamiento color
daddi $t8, $0, 4				; cant de datos

loop: daddi $t4, $t1, ingresoR	; cargo dir de mensaje
sd $t4, 0($s7)					; pongo dir en DATA
daddi $t1, $t1, 8				; aumento desplazamiento para el proximo mensaje

daddi $t0, $0, 4				
sd $t0, 0($s6)					; cargo 4 en CONTROL para imprmir

daddi $t0, $0, 8
sd $t0, 0($s6)					; cargo 8 en CONTROL para leer

lbu $t0, 0($s7)					; $t0 = dato leido
sb $t0, color($t2)				; cargo dato en color (vector)
daddi $t8, $t8, -1				; resto 1 a cant total de elementos que conforman el color
daddi $t2, $t2, 1				; aumento desplazamiento para guardar en vector color
bnez $t8, loop


daddi $t0, $0, 7
sd $t0, 0($s6)					; limpio pantalla grafica con uin 7 en CONTROL

lwu $s3, color($0)				; $s3 = direccion de color(vector)

sb $s1, 5($s7)					; cargo $s1(X) en DATA+5
sb $s0, 4($s7)					; cargo $s0(Y) en DATA+4
sw $s3, 0($s7)					; cargo $s3(color) en DATA

daddi $t0, $0, 5
sb $t0, 0($s6)					; cargo 5 en CONTROL para dibujar en pantalla grafica
halt 