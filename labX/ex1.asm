## mergesort(lo, hi)
##return if lo == hi
## mid = (lo+hi)/2
##mergesort lo-->mid, and mid+1 --> to hi
##leftpos = lo, leftend = mid 
##rightpos = mid+1, rightend = hi
## numele = rightend-leftpos+1
##int tmpPos = leftpos


.data 0x0
	num: .space 4
	arr: .space 200
	tmp: .space 200
	newLine: .asciiz "\n"
.text 0x3000
.globl main
main:
	ori     $sp, $0, 0x2ffc     
	addi    $fp, $sp, -4        


	li $v0, 5
	syscall
	sw $v0, num($0)
	lw $t0, num($0)
	li $t1, 0
sw_loop:
	sll $t3, $t1, 2
	li $v0, 5
	syscall
	sw $v0, arr($t3)
	addi $t1, $t1, 1
	bne $t1, $t0, sw_loop
sw_loop_end:
	move $a0, $0
	lw $a1, num($0)
	addi $a1, $a1, -1
	#call merge-sort
	jal merge_Sort
	
	li $t1, 0
	lw $t0, num($0)
print_loop:
	sll $t3, $t1, 2
	li $v0, 1
	lw $a0, arr($t3)
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	addi $t1, $t1, 1
	bne $t1, $t0, print_loop

exit:
	ori $v0, $0, 10
	syscall
	
merge_Sort:
	addi    $sp, $sp, -8    # Make room on stack for saving $ra and $fp
        	sw      $ra, 4($sp)     # Save $ra
        	sw      $fp, 0($sp)     # Save $fp
	addiu   $fp, $sp, 4     # Set $fp to the start of proc1's stack frame
	beq $a0, $a1, merge_Sort_End
	move $t0, $a0
	move $t1, $a1
	add $t2, $t0, $t1
	srl $t2, $t2, 1
	
	addi $sp, $sp, -12
	sw $t0, 8($sp) # save lo
	sw $t1, 4($sp) # save hi
	sw $t2, 0($sp) #save mid
	move $a0, $t0 #lo
	move $a1, $t2 #mid
	
	jal merge_Sort
	
	lw $a0, 0($sp) 
	addi $a0, $a0, 1
	lw $a1, 4($sp)
	
	jal merge_Sort
	
	lw $t0, 8($sp) # leftPos
	lw $t1, 4($sp) # rightEnd
	lw $t2, 0($sp) # leftEnd
	addi $sp, $sp, 12
	addi $t3, $t2, 1 # rightPos
	add $t4, $t0, $0 # tmpPos
	sub $t5, $t1, $t0
	addi $t5,$t5, 1 # numElements
	
	
	while_loop:
		bgt $t0, $t2, while_left_loop
		bgt $t3, $t1, while_left_loop
		
		sll $t6, $t0, 2
		sll $t7, $t3, 2
		lw $t6, arr($t6)
		lw $t7 ,arr($t7)
		bgt $t6, $t7, else
		
		sll $t6, $t4, 2
		sll $t7, $t0, 2
		lw $t7, arr($t7)
		sw $t7, tmp($t6)
		
		addi $t4, $t4, 1
		addi $t0, $t0, 1
		j while_loop
		
		else:
		sll $t6, $t4, 2
		sll $t7, $t3, 2
		lw $t7, arr($t7)
		sw $t7, tmp($t6)
		addi $t4, $t4, 1
		addi $t3, $t3, 1
		j while_loop
		
	while_left_loop:
		bgt $t0, $t2, while_right_loop
		sll $t6, $t4, 2
		sll $t7, $t0, 2
		lw $t7, arr($t7)
		sw $t7, tmp($t6)
		
		addi $t4, $t4, 1
		addi $t0, $t0, 1
		j while_left_loop
	while_right_loop:
		bgt $t3, $t1, for_loop
		sll $t6, $t4, 2
		sll $t7, $t3, 2
		lw $t7, arr($t7)
		sw $t7, tmp($t6)
		addi $t4, $t4, 1
		addi $t3, $t3, 1
		j while_right_loop
	for_loop:
		move $t6, $0 #i = 0
		loop:
			beq $t5, $t6, merge_Sort_End
			sll $t7, $t1, 2
			lw $t8, tmp($t7)
			sw $t8, arr($t7)
			addi $t6, $t6, 1
			addi $t1, $t1, -1
			j loop
		
		
	merge_Sort_End:
	lw  $ra, 0($fp)     # restore $ra 
    	addi $sp, $fp, 4    # restore $sp
    	lw  $fp, -4($fp)    # restore $fp
    	jr $ra
