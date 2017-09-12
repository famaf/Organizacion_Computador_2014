.data
FB: 	.space 262144 # 256*256*4

.text
main: 	la $t0, FB
	li $s0, 0x000000FF
	sw $s0, 0($t0)
	sll $s0, $s0, 8
	sw $s0, 4($t0)
	sll $s0, $s0, 8
	sw $s0, 8($t0)