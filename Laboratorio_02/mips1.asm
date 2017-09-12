.data
FB: .space 262144 # 256*256*4

.text
main: la $t0, FB
	li $s0, 0x000000FF #trae esa dirreccion a s0 (color azul)
	sw $s0, 0($t0) #lo guarda en memoria (imprime azul)
	sll $s0, $s0, 8 #lo corre 8 bits a la izquierda
	sw $s0, 4($t0) #lo guarda en memoria (imprime verde)
	sll $s0, $s0, 8 #lo corre 8 bits a la izquierda
	sw $s0, 8($t0) #lo guarda en memoria (imprime rojo)
	sll $s0, $s0, 8 #lo corre 8 bits a la izquierda
	sw $s0, 12($t0)
	jr $ra
