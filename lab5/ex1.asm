#---------------------------------
# Lab 5: Pixel Conversion
#
# Name: Zsofia Voros
#
# --------------------------------
# Below is the expected output.
# 
# Converting pixels to grayscale:
# 0
# 1
# 2
# 34
# 5
# 67
# 89
# Finished.
# -- program is finished running --
#---------------------------------

.data 0x0
	startString:	.asciiz	"Converting pixels to grayscale:\n"
	finishString:	.asciiz	"Finished."
	newline:	.asciiz	"\n"
	pixels:		.word 	0x00010000,	0x010101,	0x6,	0x3333, 
				0x030c,	0x700853,	0x294999,	-1

.text 0x3000

main:
	ori $v0, $0, 4				#System call code 4 for printing a string
	ori $a0, $0, 0x0   	 		#address of startString is in $a0
	syscall						#print the string


#------- INSERT YOUR CODE HERE -------
	la    $9, pixels
	li    $11, 3
loop:
	li    $8, 0
	sll   $13, $14, 2	# i*4
	add   $15, $9, $13	# set $15 = i*4 + start of pixels
	lw    $10, 0($15)   	# load pixels[i]
	and   $12, $10, 0x000000ff
	add   $8, $8, $12   
	srl   $10, $10, 8
	and   $12, $10, 0x000000ff
	add   $8, $8, $12    
	srl   $10, $10, 8
	and   $12, $10, 0x000000ff
	add   $8, $8, $12    
	div   $8, $11 
	mflo  $13
	li    $v0, 1				
	move  $a0, $13  	 		
	syscall			#print number
	ori   $v0, $0, 4				
	ori   $a0, $0, 43   	 		
	syscall			#print newline			
	addi  $14, $14, 1	# i++
	blt   $14, 7, loop	# i<7

#------------ END CODE ---------------


exit:

	ori $v0, $0, 4				# System call code 4 for printing a string
	ori $a0, $0, 33  			# address of finishString is in $a0; we computed this
								# simply by counting the number of chars in startString,
								# including the \n and the terminating \0

	syscall						#print the string

	ori $v0, $0, 10				#System call code 10 for exit
	syscall						#exit the program
