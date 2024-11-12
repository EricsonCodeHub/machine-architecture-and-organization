# Ericson Demo 
# Assignment 6
# this program  demonstrates how associative law fails in addition for floating point numbers

# use the numbers listed below
#	1.0e20
#	-1.0e20
# 	1.0

.data 

firstNum:  	.float 0
secondNum: 	.float 0
thirdNum:	.float 0
outPut1:	.float 0
outPut2:	.float 0
message1:	.asciiz  "\n this program  demonstrates how associative law fails in addition for floating point numbers"
prompt1:   	.asciiz  "\n please enter number a "
prompt2:   	.asciiz  "\n please enter number b "
prompt3:   	.asciiz  "\n please enter number c "
outPutString1: 	.asciiz "\n Using a = "
outPutString2: 	.asciiz "\n , b = "
outPutString3: 	.asciiz "\n , c = "
formula1: 	.asciiz "\n a + (b + c) = "
formula2: 	.asciiz "\n (a + b) + c = "

.text
	
	# main is probably not actually needed 
	main:
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, message1 	# Load the address of the message into $a0
    	syscall               	# Make syscall to print String
	
	
	
	# get all inputs below ////////////////////////////////////////////
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, prompt1	# Load the address of prompt1 into $a0
    	syscall               	# Make syscall to print string
	li    $v0, 6          	# Load syscall code to input floating point number 6
    	syscall               	# Make syscall to input the number into $f0
    	s.s   $f0, firstNum   	# Store the input number from $f0 into firstNum
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, prompt2 	# Load the address of prompt2 into $a0
    	syscall               	# Make syscall to display the prompt
	li    $v0, 6          	# Load syscall code to input floating point number 6
    	syscall               	# Make syscall to input the number into $f0
    	s.s   $f0, secondNum  	# Store the input number from $f0 into secondNum
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, prompt3 	# Load the address of prompt3 into $a0
    	syscall               	# Make syscall to print string
	li    $v0, 6          	# Load syscall code to input floating point number 6
    	syscall               	# Make syscall to input the number into $f0
    	s.s   $f0, thirdNum   	# Store the input number from $f0 into thirdNum
	
	
	# a + (b + c) = 0
	# (a + b) + c = 1
	# ccalculate outputs ////////////////////////////////////
	l.s    $f1, firstNum  	# loads first number into $f1
	l.s    $f2, secondNum  	# loads second number into $f2
	l.s    $f3, thirdNum  	# loads third number into $f3
		
	#	a + (b + c) = 0
	add.s $f0, $f2, $f3  	# Add b and c $f0 = $f2 + $f3
	add.s $f0, $f0, $f1	# Add a to result $f0 = $f0 + a
	s.s   $f0, outPut1	# Store the result in outPut1
		
	l.s    $f1, firstNum  	# loads first number into $f1
	l.s    $f2, secondNum  	# loads second number into $f2
	l.s    $f3, thirdNum  	# loads third number into $f3
		
	#	(a + b) + c = 1
	add.s $f0, $f1, $f2 	# Add a and b $f0 = $f1 + $f2
	add.s $f0, $f0, $f3 	# Add c to result $f0 = $f0 + $f3
	s.s   $f0, outPut2	# Store the result in outPut2
		
	# print the results ///////////////////////////////////////////
	li  $v0, 4		# Load syscall code to print string 4
    	la $a0, outPutString1 	# load adress outPutString1 into $a0
    	syscall			# Make syscall to print the string
	l.s   $f12, firstNum    # Load singke ppoint persision firstNUm into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall               	# Make syscall to print
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la $a0, outPutString2 	# load adress outPutString2 into $a0
    	syscall			# syscall call to print string
	l.s   $f12, secondNum   # Load singke ppoint persision secondNum into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall               	# Syscall call to print float
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la  $a0, outPutString3 	# load adress outPutString3 into $a0
    	syscall			# syscall to print string
	l.s   $f12, thirdNum    # Load thirdNum sibgle point percision into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall               	# syscall to print float 
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, formula1 	# load adress formulal into $a0
    	syscall			# syscall to print string
	l.s   $f12, outPut1    	# Load output1 sibgle point percision into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall              	# system call to print float
	
	li    $v0, 4          	# Load syscall code to print string 4
    	la    $a0, formula2 	# load adress formula2 into $a0
    	syscall			# system call to print string
	l.s   $f12, outPut2    	# Load output2 sibgle point percision into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall               	# sysvcall to print float
	
	li $v0, 10 		# Load syscall code for exit into $v0
    	syscall 		# Make syscall to exit the program
		
		
		
	
	
