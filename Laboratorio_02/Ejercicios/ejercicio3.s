	# Constants
	.eqv WIDTH 256 # FrameBuffer Width
	.eqv FB_LENGTH 262144 # 256*256*4

	# Data Segment
	.data
FB: 	.space FB_LENGTH # Reserve FB_LENGTH Sapce in Data Segment in FB label
file: 	.asciiz "Lenna.rgba" # File name
	.word 0

	# Text Segment
	.text
	.globl main
main:
	# Open File
	li $v0, 13 # $v0 specifies the syscall type, where 13=open file
	la $a0, file # $a2 = address of the name of file to read
	add $a1, $0, $0 # $a1=flags, 0 is O_RDONLY
	add $a2, $0, $0 # $a2=mode, 0 is ignore
	syscall # Open File, $v0 stores file descriptor (fd)
	move $s0, $v0 # store fd in $s0

	# Read FB_LENGTH bytes from file, storing in framebuffer
	li $v0, 14 # $v0 specifies the syscall type, where 14=read from file
	move $a0, $s0 # $a0=file_descriptor
	la $a1, FB # $a1=address of input buffer (frame buffer)
	li $a2, FB_LENGTH # $a2=maximum numbers of characters to read
	syscall # Read From File, $v0 contains number of characters read or 0 if EOF

	# Workaround Bitmap Display Bug
	li $s5, 0 # i=0
	li $s7, FB_LENGTH # j=FB_LENGTH
	move $t0, $a1 # $t0 is FB base address
	srl $a2, $a2, 1	# FB_LENGTH = FB_LENGTH / 2
	addi $s1,$t0, 262144 # s1 = 262144 = FB_LENGTH
loop:   bge $s5, $a2, done # while i<FB_LENGHT/2
	lw $s6, ($t0) # load ith pixel in $s6

	andi $t2, $s6,0x000000ff # t2 = componente Azul del pixel
	andi $t3, $s6,0x00ff0000 # t2 = componente Rojo del pixel
	andi $t4, $s6,0xff00ff00 # t2 = color NA y Verde del pixel

	sll $t2, $t2, 16
	srl $t3, $t3, 16
	
	or $t2, $t2, $t3	
	or $t2, $t2, $t4 # restauracion de color	
	
	move $s6,$t2
	
	lw $s7, ($s1) # cargamos el ultimo pixel en $s7

	andi $t2, $s7,0x000000ff
	andi $t3, $s7,0x00ff0000
	andi $t4, $s7,0xff00ff00

	sll $t2, $t2, 16
	srl $t3, $t3, 16
	
	or $t2, $t2, $t3	
	or $t2, $t2, $t4 # restauracion de color
		
	move $s7,$t2
	
	sw $s7, ($t0) # intercambio de pixeles
	sw $s6, ($s1) # intercambio de pixeles
	
	addiu $t0, $t0, 4 # desplazo al pixel siguiente
	subi $s1,$s1,4 # desplazo al pixel anterior
	addiu $s5, $s5, 4 # i++

	j loop
	
done:
	# Close File
	li $v0, 16 # $v0 specifies the syscall type, where 16=close file
	move $a0, $s0 # $a0=file_descriptor
	syscall # Close File

	# Exit Gracefully
	li $v0, 10 # $v0 specifies the syscall type, where 10=exit
	syscall # Exit	
