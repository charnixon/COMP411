# Lab 8 : Ex1 - a to i/factorial

.data 0x0
	newLine: .asciiz "\n"
.text 0x3000
.globl main
main:
	ori     $sp, $0, 0x2ffc     # Initialize stack pointer to the top word below .text
               	             # The first value on stack will actually go at 0x2ff8
               	             #   because $sp is decremented first.
	addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame


	li $v0, 5
	syscall
	move $a0, $v0
	
	jal fibonacci
	move  $t1, $v0
	li    $v0, 1				
	move  $a0, $t1  	 		
	syscall
	ori   $v0, $0, 4				
	ori   $a0, $0, 0   	 		
	syscall
	bnez $t1, main
exit:
	ori $v0, $0, 10
	syscall





