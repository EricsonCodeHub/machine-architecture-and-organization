
	# Ericson Demo
	# assigment 7

.data

	prompt1: .asciiz "Enter the first positive integer (0-32767): "
	prompt2: .asciiz "Enter the second positive integer (0-32767): "
	error:   .asciiz "Invalid input! Please enter a number between 0 and 32767.\n"
	result:  .asciiz "The product is: "
	
	num1:    .word 0
	num2:    .word 0
	product: .word 0
	
.text
	
	invalidInput:
		la   $a0, error		#loads error message
		li   $v0, 4         	# Print string syscall
		syscall			#makjes call to print
 
	main:
	
	# Prompt for first number /////////////////////////////////////////////
		la   $a0, prompt1	# loads prompt1 for print
		li   $v0, 4         	# Print string syscall code
		syscall			#makes call to print
		
		li   $v0, 5         	# Read integer syscall code
		syscall			#reads in integer
		
		move $t0, $v0       	# Store input in $t1 from $v0
		sw   $t0, num1      	# Store the first number in memory at num1
		
	# Prompt for second number /////////////////////////////////////////////
		la   $a0, prompt2	# loads prompt1 for print2
		li   $v0, 4         	# Print string syscall code
		syscall			#makes call to print
		
		li   $v0, 5         	# Read integer syscall code
		syscall			# makes call to read integer
		
		move $t0, $v0       	# Store input in from $v0 to $t1
		sw   $t0, num2      	# Store the second number in memory at num2
		
	# Validate input
		li   $t1, 32767		# loads 32767 to $t1
		lw   $t2, num1     	# lodas num1 to $t2
		bltz $t2, invalidInput   	# If $t2 < 0 jump to invalidInput
		bgt  $t2, $t1, invalidInput  	# If $t2 > 32767 jump to invalidInput

		lw   $t2, num2		# load num2 to $t2
		bltz $t2, invalidInput  	# If $t2 < 0 jump to invalidInput
		bgt  $t2, $t1, invalidInput  	# If $t2 > 32767 jump to invalidInput
		
	# Load multiplicand and multiplier
    		lw $t0, num1      # Load multiplicand into $t0
    		lw $t1, num2      # Load multiplier into $t1
    		li $t2, 0         # Initialize result in $t2
	# start of Shift and Add algorithm
	mathLoop:
    		andi $t3, $t1, 1    		# Gets least significant bit of $t1 and store in $t3
    		beq  $t3, $zero, skipAdd	# is $t3 == 0 goto akipAdd
    
    		add $t2, $t2, $t0   # adds to the accumulator variable

	skipAdd:
    		sll $t0, $t0, 1     # Shift left $t0
    		srl $t1, $t1, 1     # Shift right $t1

    	# Check if multiplier is zero
    		bne  $t1, $zero, mathLoop 	# if $t1 != 0 go to mathLoop

    		sw $t2, product			# stoire $t2 to pruduct 

    	# Print the result
    		la   $a0, result     	# Load address of result message
    		li   $v0, 4         	# load syscall code 4
    		syscall			# Print string syscall
    
    		lw $a0, product      	# Load the product into $a0
    		li $v0, 1         	# load syscall code 1
    		syscall               	# Print the integer in $a0
    
    		li $v0, 10           	# Load the syscall code for exit 10
    		syscall              	 # Exit the program
    		
	
	
		
