#include <stdio.h>

#int main() {

#  int R, start, B;

#  scanf("%d", &start);
#  R = start;

#  do {
#    printf("%d\n", R);
#    B = ((R >> 4) & 0x01) ^ ((R >> 2) & 0x01);
#    R = ((R & 0x0F) << 1) | B;
#  } while(R != start);

#}

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
	move $t0, $v0 #initialize start
	add  $t1, $t0, $0 #R = start
		
PRNG_loop:
	li $v0, 1
	add $a0, $t1, $0
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	srl $t2, $t1, 4
	andi $t2, $t2, 0x01
	srl $t3, $t1, 2
	and $t3, $t3, 0x01
	xor $t2, $t2, $t3
	andi $t1, $t1, 0x0F
	sll $t1, $t1, 1
	or $t1, $t1, $t2
	bne $t0, $t1, PRNG_loop
exit:
	ori $v0, $0, 10
	syscall
	
