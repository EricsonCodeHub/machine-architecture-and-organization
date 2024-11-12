	# Ericson Demo
	# Assignment 4
	
	# This program prompts the user fro an input, checks if  the input is vadid, and will display an error message if not valid
	# once a valid input is enterd the programe will calculate the Factorial using a loop and will display the output to the user
	
	# this program tood like 6 hours to make but i also had to learn mips
	# The the comments for a line of code is either directly above the line or across from the line
	
	# notes for me
	# $v0: This register holds the return value of a function
	# $a0: this register is used to pass the first argument to a function.
	# $t0: This is a temporary register used for intermediate calculations within a function.
	
.data

	promtMessage: .asciiz"\n Enter a number to find the factorial: "
	resultMessage: .asciiz "\n the factorail of the number is "
	errorMessage: .asciiz "\n N! undefined for values less than 0"
	theNumber: .word 0  # . word is like an int
	theAnswer: .word 0  # var for out put
	
.text # all code in program

	
	li $t0, -1          # $t1 will hold -1 for loop termination
	
	input_loop:	
    		bgt $t0, $zero, end_input  # If $t1 is greater than 0, jump to end_input:
    		
    		# li stands for load instruction”
		# This instruction loads the immediate value 4 into the register $v0.
		# The value 4 is the syscall code for printing a string.
		li $v0, 4
		# la stands for “load address.”
		# This instruction loads the address of the string promtMessage into the register $a0
		la $a0, promtMessage
		# This instruction makes a system call.
		# The syscall code in $v0 tells the system to print the string whose address is in $a0.
		syscall
		
		# This instruction loads the immediate value 5 into the register $v0.
		# The value 5 is the syscall code for reading an integer from the user.
		li $v0, 5
		# This instruction makes a system call.
		# The syscall code in $v0 tells the system to read an integer from the user.
		# The integer input by the user is stored in the register $v0.
		syscall
		
		# stores value from $v0 to theNumber
		sw $v0, theNumber
		# $t0 will hold the current number
		lw $t0, theNumber  
		
			ble $t0, $zero, error_block  # Branch to TrueBlock if $t0 <= 0
			
				#skip error block
				j skip_errorBlock
				# start of error_block
				error_block:
					# li stands for load instruction”
					# This instruction loads the immediate value 4 into the register $v0.
					# The value 4 is the syscall code for printing a string.
					li $v0, 4
					# la stands for “load address.”
					# This instruction loads the address of the string promtMessage into the register $a0
					la $a0, errorMessage
					# This instruction makes a system call.
					# The syscall code in $v0 tells the system to print the string whose address is in $a0.
					syscall
				# Lable to skip error black
				skip_errorBlock:
				
    		# Jump back to the beginning of the loop
    		j input_loop 
    	# when the loop is exited we now have a valid nmber in word theNumber            	
    	end_input:	
    	
    	# $t0 will hold the current number to multiply rn it should just be theNumber
    	lw $t0, theNumber
    	# lods value 1 to $t1
    	li $t1, 1
    	
    	# start of fratorail loop 	      	
    	factorial_loop:
    		# if $to and constant $zero are ==  end loop
    		beq $t0, $zero, end_factorial  
    		# Multiply $t1 by $t0 stores in t1
    		mul $t1, $t1, $t0
    		# Decrement $t0 by 1 stores in t0
    		sub $t0, $t0, 1  
    		# Jump back to the beginning of the loop
    		j factorial_loop   	
    	# End of loop
    	end_factorial:
    	
    	# stores value from $t1 to theAnswer
    	sw $t1, theAnswer
    	# li stands for load instruction”
	# This instruction loads the immediate value 4 into the register $v0.
	# The value 4 is the syscall code for printing a string.
	li $v0, 4
	# la stands for “load address.”
	# This instruction loads the address of the string promtMessage into the register $a0
	la $a0, resultMessage
	# This instruction makes a system call.
	# The syscall code in $v0 tells the system to print the string whose address is in $a0.
	syscall 
	
	# This instruction loads the immediate value 1 into the register $v0.
	# The value 1 is the syscall code for printing a int.
    	li $v0, 1
    	# Load theAnswer into $a0
    	lw $a0, theAnswer
    	# Make syscall to print the integer
    	Syscall 
    	
    	# Load syscall code for exit into $v0
    	li $v0, 10 
    	# Make syscall to exit the program
    	syscall 
    	
    	
    	
    	

	
