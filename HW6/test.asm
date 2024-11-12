# Ericson Demo 
# Assignment 6
# This program demonstrates how associative law fails in addition for floating-point numbers

.data 

firstNum:  	.float 0
secondNum: 	.float 0
thirdNum:	.float 0
outPut1:	.float 0
outPut2:	.float 0

message1:	.asciiz  "\nThis program demonstrates how associative law fails in addition for floating point numbers."

prompt1:   	.asciiz  "\nPlease enter number a: "
prompt2:   	.asciiz  "\nPlease enter number b: "
prompt3:   	.asciiz  "\nPlease enter number c: "

outPutString1: 	.asciiz "\nUsing a = "
outPutString2: 	.asciiz "\n, b = "
outPutString3: 	.asciiz "\n, c = "

formula1: 	.asciiz "\na + (b + c) = "
formula2: 	.asciiz "\n(a + b) + c = "

.text
	
main:
	# Display the program's purpose message
	li    $v0, 4                # syscall to display string
	la    $a0, message1         # load address of the message
	syscall                     # execute syscall

	# Get all inputs from the user
	li    $v0, 4                # syscall to display string
	la    $a0, prompt1          # load address of the first prompt
	syscall                     # execute syscall

	li    $v0, 6                # syscall to input floating-point number
	syscall                     # get input for a
	s.s   $f0, firstNum         # store the input in firstNum

	li    $v0, 4                # syscall to display string
	la    $a0, prompt2          # load address of the second prompt
	syscall                     # execute syscall

	li    $v0, 6                # syscall to input floating-point number
	syscall                     # get input for b
	s.s   $f0, secondNum        # store the input in secondNum

	li    $v0, 4                # syscall to display string
	la    $a0, prompt3          # load address of the third prompt
	syscall                     # execute syscall

	li    $v0, 6                # syscall to input floating-point number
	syscall                     # get input for c
	s.s   $f0, thirdNum         # store the input in thirdNum
	
	# Calculate a + (b + c)
	l.s    $f1, firstNum        # load a
	l.s    $f2, secondNum       # load b
	l.s    $f3, thirdNum        # load c

	add.s  $f4, $f2, $f3        # $f4 = b + c
	add.s  $f4, $f4, $f1        # $f4 = a + (b + c)
	s.s    $f4, outPut1         # store result in outPut1

	# Calculate (a + b) + c
	add.s  $f5, $f1, $f2        # $f5 = a + b
	add.s  $f5, $f5, $f3        # $f5 = (a + b) + c
	s.s    $f5, outPut2         # store result in outPut2

	# Display inputs a, b, c
	li    $v0, 4                # syscall to display string
	la    $a0, outPutString1    # load address of the output message
	syscall                     # execute syscall

	l.s   $f12, firstNum        # load a into $f12 for floating-point display
	li    $v0, 2                # syscall to display floating-point number
	syscall                     # display a

	li    $v0, 4                # syscall to display string
	la    $a0, outPutString2    # load address of the output message
	syscall                     # execute syscall

	l.s   $f12, secondNum       # load b into $f12 for floating-point display
	li    $v0, 2                # syscall to display floating-point number
	syscall                     # display b

	li    $v0, 4                # syscall to display string
	la    $a0, outPutString3    # load address of the output message
	syscall                     # execute syscall

	l.s   $f12, thirdNum        # load c into $f12 for floating-point display
	li    $v0, 2                # syscall to display floating-point number
	syscall                     # display c

	# Display the result of a + (b + c)
	li    $v0, 4                # syscall to display string
	la    $a0, formula1         # load address of the formula message
	syscall                     # execute syscall

	l.s   $f12, outPut1         # load result of a + (b + c)
	li    $v0, 2                # syscall to display floating-point number
	syscall                     # display result of a + (b + c)

	# Display the result of (a + b) + c
	li    $v0, 4                # syscall to display string
	la    $a0, formula2         # load address of the formula message
	syscall                     # execute syscall

	l.s   $f12, outPut2         # load result of (a + b) + c
	li    $v0, 2                # syscall to display floating-point number
	syscall                     # display result of (a + b) + c

	# Exit the program
	li    $v0, 10               # syscall to exit
	syscall                     # execute exit
