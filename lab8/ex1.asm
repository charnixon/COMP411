# Lab 8 : Ex1 - a to i/factorial

.data 0x0
	String: .space 20
	newLine: .asciiz "\n"
.text 0x3000
.globl main
main:
	ori     $sp, $0, 0x2ffc     # Initialize stack pointer to the top word below .text
               	             # The first value on stack will actually go at 0x2ff8
               	             #   because $sp is decremented first.
	addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame

# =============================================================
	li      $v0, 8
    	la      $a0, String
    	li      $a1, 20
    	syscall

        	jal     a_to_i          # call a_to_i
                                # return values will be in $v0-$v1
        # =====================================================
        	addi $s0, $v0, 0
	addi $a0, $v0, 0
	addi $sp, $sp, -4
	sw  $s0, 0($sp)
	jal factorial
	lw  $s0, 0($sp)
	move  $t1, $v0
	li    $v0, 1				
	move  $a0, $t1  	 		
	syscall
	move $t0, $v0
	ori   $v0, $0, 4				
	ori   $a0, $0, 20   	 		
	syscall
	bnez $s0, main
exit:
	ori $v0, $0, 10
	syscall
a_to_i:
	addi    $sp, $sp, -8    # Make room on stack for saving $ra and $fp
        	sw      $ra, 4($sp)     # Save $ra
        	sw      $fp, 0($sp)     # Save $fp

        	addi    $fp, $sp, 4     # Set $fp to the start of proc1's stack frame
    	li $t0, 0
    	li $t1, 0
    	li $t2, 10
loop:
	#sll   $t4, $t0, 2	# i*4
	lb    $t3, String($t0)   	# load char[i]
	beq $t3, 10, a_to_i_end
	sub $t3, $t3, '0'
	mult $t1, $t2
	mflo $t1
	add $t1, $t1, $t3
	addi $t0, $t0, 1
	b loop

a_to_i_end:
	add $v0, $0, $t1
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure

factorial:
	#make room on the stack for ra and fp
	addi    $sp, $sp, -8    # Make room on stack for saving $ra and $fp
        	sw      $ra, 4($sp)     # Save $ra
        	sw      $fp, 0($sp)     # Save $fp
	addiu   $fp, $sp, 4     # Set $fp to the start of proc1's stack frame
	beqz    $a0, Zero_factorial
	addi    $sp, $sp, -4
	addi    $s0, $a0, 0
	sw      $s0, 0($sp)
	sub     $a0, $a0, 1
	jal     factorial
	lw      $s0,  -8($fp)           # Restore $s0
	mult    $s0, $v0
	mflo    $v0
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure 
	
	
Zero_factorial:
	add     $v0, $0, 1
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure 



