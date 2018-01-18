
.globl fibonacci
        fibonacci:
	#make room on the stack for ra and fp
	addi    $sp, $sp, -8    # Make room on stack for saving $ra and $fp
        	sw      $ra, 4($sp)     # Save $ra
        	sw      $fp, 0($sp)     # Save $fp
	addiu   $fp, $sp, 4     # Set $fp to the start of proc1's stack frame
	beqz    $a0, zero_or_one_fibonacci
	beq     $a0, 1, zero_or_one_fibonacci
	addi    $sp, $sp, -4
	sub     $a0, $a0, 1
	sw      $a0, 0($sp)
	jal     fibonacci
	lw      $s0,  -8($fp)           # Restore $n-1
	sub     $s0, $s0, 1
	addi    $a0, $s0, 0
	sw      $v0, 0($sp)
	jal     fibonacci
	lw      $s0,  -8($fp)           # Restore $fib(n-1)
	add     $v0, $v0, $s0
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure 
	
	
zero_or_one_fibonacci:
	addi     $v0, $a0, 0
	addi    $sp, $fp, 4     # Restore $sp
        	lw      $ra, 0($fp)     # Restore $ra
        	lw      $fp, -4($fp)    # Restore $fp
        	jr      $ra             # Return from procedure 