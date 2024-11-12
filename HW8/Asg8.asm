	# Ericson Demo
	# assigment 8
	
	# This program prompts the use for 2 input numbers and the uses subtraction to do division amd displays the results to the user, it also handels errors
	
	# this took about 3 hours 
	# I coppied the Algorithm in the ASG8 Directions

.data

	message: .asciiz "\nThis is a program that does an integer divide using subtracts"
	prompt1: .asciiz "\nEnter an int dividend: "  	# this is the top of a fraction
	prompt2: .asciiz "\nEnter an int Divisor: "	# this is the bottom of a fraction
	error:   .asciiz "\nError!! Divisible by 0"
	quotientMessage: .asciiz "\nThe quotient is "
	remainderMessage: .asciiz " and remainder is "
	
	dividend:    	.word 0
	divisor:    	.word 0
	quotient:	.word 0
	remainder:	.word 0
	resultSign:	.word 0
	

	
.text
	zeroError:
		la   $a0, error	# loads prompt1 for print
		li   $v0, 4         	# Print string syscall code 4
		syscall			#makes call to print
	 
	main:
	# Prompt for input dividend
		la   $a0, prompt1	# loads prompt1 for print
		li   $v0, 4         	# Print string syscall code 4
		syscall			#makes call to print
		
		li   $v0, 5         	# Read integer syscall code
		syscall			#reads in integer
		
		move $t1, $v0       	# Store input in $t1 from $v0
		sw   $t1, dividend     	# Store the first number in memory at num1
		
		
		
	# Prompt for input divisor
		la   $a0, prompt2	# loads prompt1 for print
		li   $v0, 4         	# Print string syscall code 4
		syscall			#makes call to print
		
		li   $v0, 5         	# Read integer syscall code
		syscall			#reads in integer
		
		move $t1, $v0       	# Store input in $t1 from $v0
		sw   $t1, divisor     	# Store the first number in memory at num1
		
		
	#  handle divisibility by 0 check
		
		lw $t1, dividend      	# Load multiplicand into $t0
    		lw $t2, divisor      	# Load multiplier into $t1
    		mul $t0, $t1, $t2	# store product to $t0
    		beqz $t0 zeroError
    	
    	# store sign of the result
		
		bgtz  $t0 greaterThanZerro	# is $t0 greater that 0 go to greaterThanZerro:	
		
		li $t0,-1 			# load -1 to  $t0
		sw $t0,resultSign		# store $t0 $t0 to resultSign
		
		j signResultDone
		
	greaterThanZerro:	
		li $t0,1			# load 1 to  $t0
		sw $t0,resultSign		# store $t0 $t0 to resultSign
		
	signResultDone:
	
	# convert both dividend and divisor to positive
	
		lw $t1, dividend      	# Load multiplicand into $t1
    		lw $t2, divisor      	# Load multiplier into $t2
    		
    		bgtz $t1 dividendPositive # if dividend > 0 go to dividendPositive:
    		
    		mul $t0,$t1,-1 		# we fix dividend 
    		sw $t0,dividend		# we store dividend 
    		
    		dividendPositive:
    		
    		bgtz $t2 divisorPositive # if dividend > 0 go to dividendPositive:
    		
    		mul $t0,$t2,-1 		# we fix divisor 
    		sw $t0,divisor		# we store divisor
    		
    		divisorPositive: 
    		
    	# actual divide math
    	
    		lw $t1, dividend      	# Load multiplicand into $t1
    		lw $t2, divisor      	# Load multiplier into $t2
    		lw $t3, quotient	# # Load quotient into $t3
    		
    	divisionStart:
    	
    		bgt $t2, $t1, divisionDone  # Branch to  divisionDone if $t2 > $t1
    		sub $t1,$t1,$t2 	# dividend - divisor 
    		add $t3, $t3,1		# quotient = quotient + 1
    		j divisionStart		# continue loop
    		
    	divisionDone:
    		lw $t0, resultSign 	# loads result sign
    		mul $t3,$t3,$t0		# fixes sign of quotient
    		sw $t3, quotient 	# store quotient
    		sw $t1,remainder	# store remainder 
    		
    	# print results ////////////////////////////////////////////////////////
    		la   $a0, quotientMessage	# loads quotientMessage for print
		li   $v0, 4         		# Print string syscall code 4
		syscall				#makes call to print
		
		lw $a0, quotient		# loads quotient for print
		li $v0, 1			#syscall to print int
		syscall				#call to print
		
		
		la   $a0, remainderMessage	# loads remainderMessage for print
		li   $v0, 4         		# Print string syscall code 4
		syscall				#makes call to print
		
		lw $a0, remainder		# loads quotient for print
		li $v0, 1			#syscall to print int
		syscall				#call to print

							
	# end program////////////////////////////////////////////////////////////////
    		li $v0, 10           	# Load the syscall code for exit 10
    		syscall              	 # Exit the program
    		