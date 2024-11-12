# Ericson Demo 
# Assignment 5 

# this program prompts the user for a number and uses recursion to find the factorial
# an error message will be displayed if there is a none valid entery
# this took a long time probably like 8 hours


# notes for me
	# $v0: This register holds the return value of a function
	# $a0: As mentioned earlier, this register is used to pass the first argument to a function.
	# $t0: This is a temporary register used for intermediate calculations within a function.
	
.data

	promtMessage: .asciiz"\n Enter a number to find the factorial: "
	resultMessage: .asciiz "\n the factorail of the number is "
	errorMessage: .asciiz "\n N! undefined for values less than 0"
	theNumber: .word 0  # . word is like an int
	theAnswer: .word 0  # var for out put
	
.text # all code in program

	
	main:
	
	li $t0, -1          # $t1 will hold -1 for loop termination
	
	input_loop:
	
		
			
    		bgt $t0, $zero end_input  # If $t1 is greater than 0, jump to End
    		
    		# li stands for instruction”
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
		
							# this will skip almost all of the program if 0 is entered, this is pretty lazzy i will admit 
							beq $t0, $zero, zeroHandler
		
			ble $t0, $zero, error_block  # Branch to TrueBlock if $t0 <= 0
			
				#skip error block
				j skip_errorBlock
				# start of error_block
				error_block:
					# li stands for instruction”
					# This instruction loads the immediate value 4 into the register $v0.
					# The value 4 is the syscall code for printing a string.
					li $v0, 4
					# la stands for “load address.”
					# This instruction loads the address of the string promtMessage into the register $a0
					la $a0, errorMessage
					# This instruction makes a system call.
					# The syscall code in $v0 tells the system to print the string whose address is in $a0.
					syscall
				# End of true block code
				skip_errorBlock:
				
    		# Jump back to the beginning of the loop
    		j input_loop 
    	# when the loop is exited we now have a valid nmber in var theNumber            	
    	end_input:	
    	
#----------------------------------------------------------------------------------------------------------------------
    	
    	# loading theWord into register $a0
    	# we use $a0 becuase its and arguments for the function findFactorial
    	lw $a0, theNumber
    	
    	# notes for me
    	# the jal (Jump and Link) instruction in MIPS is used to call a function. It saves the return address (the address of the
    	# next instruction) in the $ra (return address) register before jumping to the function. This allows the program to return to 
    	# the point where the function was called after the function completes.
    	
    	# jal will reture the value to $v0
    	jal findFactorial
    	# value that was returned to $v0 from findFactorial
    	Sw $v0, theAnswer
    	
    	
#--------------------------------------------------------------------------------------------------------------------------------------------	

	printForZero:
    	# li stands for instruction”
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
    	
    	
    	li $v0, 10 # Load syscall code for exit into $v0
    	syscall # Make syscall to exit the program
    	
#///////////////////////////////////////////////////////////////////////////////////////////

	# see page 245 in text book
	findFactorial:
		#save return address and argument on the stack
		#Adjust stack pointer to reserve space
		subu $sp,$sp, 8         
		# Save return address
		sw $ra,4($sp)           
		# Save $a0 n
		sw $a0,0($sp)           

		# Basse case if n < 1rturn 1
		slti $t0,$a0, 1
		# Test ifn < 1
		beq  $t0,$zero,fact
		# If n >= 1 skip to fact

		# Base case met return 1
		#Load 1 into $v0 
		li   $v0,1
		#Deallocate stack space
		addu $sp,$sp,8         
		# Return to caller
		jr $ra                 

	fact:
		#Recursive case compute fact n-1
		#Decrement n -1
		addi $a0,$a0,-1        
		# Recursive call findFactorial:
		jal findFactorial        

		#Restore old argument and return address
		#Restore $a0 old n
		lw   $a0,0($sp)         
		# Restore return address
		lw   $ra, 4($sp)         

		# Multiply result by n fact(n) = n * fact(n-1)
		# Multiply $a0n by $v0 fact(n-1)
		mul  $v0,$a0,$v0       

		# restore stack and return
		#Deallocate stack space
		addu $sp,$sp,8         
		#Return to fuction call
		jr $ra                 
		
#//////////////////////////////////////////////////////////////////////////////////////////		
		
	# handeler
	zeroHandler:
	 	li $t0, 1       # Load immediate value 1 into register $t0
		sw $t0, theAnswer # stores $t1 in theAnswer
		j printForZero
	


