
#7
.data
    prompt1: .asciiz "please enter first float: "
    prompt2: .asciiz "please enter second float "
    prompt3: .asciiz "please enter third float "
    result:  .asciiz "The product of the three numbers is: "
    firstNum:  	.float 0
	secondNum: 	.float 0
	thirdNum:	.float 0
	resultNum: .float 0

    
    .text
    
main:

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
    	
    	
    	# input done
    	
    	# ccalculate outputs ////////////////////////////////////
	l.s    $f1, firstNum  	# loads first number into $f1
	l.s    $f2, secondNum  	# loads second number into $f2
	l.s    $f3, thirdNum  	# loads third number into $f3
	
	# Multiplucatio
	mul.s $f0 , $f1,$f2
	mul.s $f0 ,  $f0,$f3
	
	s.s   $f0, resultNum  # store the results
	
	# print the results ///////////////////////////////////////////
	li  $v0, 4		# Load syscall code to print string 4
    	la $a0, result 	# load adress result into $a0
    	syscall			# Make syscall to print the string
    	
    	l.s   $f12, resultNum    # Load singke ppoint persision firstNUm into $f12
    	li    $v0, 2          	# Load syscall code to print float 2
    	syscall               	# Make syscall to print
    	
	li $v0, 10               # Load exit syscall code
    	syscall                  # Exit the program
	
	