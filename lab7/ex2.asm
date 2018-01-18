# Lab 7 : Ex2 - factorial

.data 0x0
	newLine: .asciiz "\n"
.text 0x3000
.globl main
main:
	ori     $sp, $0, 0x2ffc     # Initialize stack pointer to the top word below .text
               	             # The first value on stack will actually go at 0x2ff8
               	             #   because $sp is decremented first.
	addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame
	addi    $sp, $sp, -4
# =============================================================
	li $v0, 5
    	syscall
    	move $t0, $v0

    	sw $t0, 0($fp)
    	or $a0, $0, $t0

        	jal     factorial          # call factorial
                                # return values will be in $v0-$v1
        # =====================================================
        	lw $t0, 0($fp)
	addi $t1, $v0, 0
	li    $v0, 1				
	move  $a0, $t1	 		
	syscall
	ori   $v0, $0, 4				
	ori   $a0, $0, 0x0   	 		
	syscall
	bnez $t0, main
exit:
	ori $v0, $0, 10
	syscall
factorial:
	addi    $sp, $sp, -8    # Make room on stack for saving $ra and $fp
        	sw      $ra, 4($sp)     # Save $ra
        	sw      $fp, 0($sp)     # Save $fp

        	addi    $fp, $sp, 4     # Set $fp to the start of proc1's stack frame
    	li $t1, 1
    	li $t2, 1
loop:
	mult $t1, $t2
	mflo $t2
	addi $t1, $t1, 1
	ble $t1, $t0, loop

factorial_end:
	add $v0, $0, $t2
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure

