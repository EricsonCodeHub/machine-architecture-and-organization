# Ericson Demo
# Assignment 9
# Date: November 25, 2024

# use 154 FOR TESTING
# ham code should be 011100101010 for 154 in binary
# The Hamming code (in hex) is: 0x0000072a
.data
prompt:      .asciiz "Enter an 8-bit number (0-255): "
int_prompt2:  .asciiz "\nThe Hamming code (in hex) is: "
p1: .word 0   # Parity bit 1
p2: .word 0   # Parity bit 2
p4: .word 0   # Parity bit 4
p8: .word 0   # Parity bit 8
d1: .word 0   # Data bit 1
d2: .word 0   # Data bit 2
d3: .word 0   # Data bit 3
d4: .word 0   # Data bit 4
d5: .word 0   # Data bit 5
d6: .word 0   # Data bit 6
d7: .word 0   # Data bit 7
d8: .word 0   # Data bit 8

.text

main:
        # Prompt user for an 8-bit number (0-255)
        li $v0, 4                  	# syscall for print string
        la $a0, prompt             	# load address of the prompt string
        syscall                    	# make syscall to print the prompt

        li $v0, 5                 	# syscall TO READ IN INT
        syscall                   	# make syscall to get input value
        move $t0, $v0             	# store input number in $t0
        bltz $t0, main      		# If t0 is less than 0 go to main
        bgt $t0, 255, main  		# If t0 is greater than 255 go to main

        # Extract data bits from $t0
        andi $t1, $t0, 1           	# Extract the least significant  bit
        sw $t1, d8                  # Stores to d8
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t2, $t0, 1           	# Extract the next least significant bit
        sw $t2, d7                  # Store d7
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t3, $t0, 1           	# Extract the next least significant bit 
        sw $t3, d6                  # Store d6
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t4, $t0, 1           	# Extract the next least significant bit 
        sw $t4, d5                  # Store D5
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t5, $t0, 1           	# Extract the next least significant bit
        sw $t5, d4                  # Store D4
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t6, $t0, 1           	# Extract the next least significant bit 
        sw $t6, d3                  # Store D3
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t7, $t0, 1           	# Extract the next least significant bit
        sw $t7, d2                  # Store D2
        srl $t0, $t0, 1             # Shift the contents of $t0 to the right by 1
        
        andi $t8, $t0, 1           	# Extract the next least significant bit 
        sw $t8, d1                  # Store D1
    
    #print test 

     

        # Calculate parity bits P1 P2 P4 P8
    
        # P1: checks d1 d2 d4 d5 d7
        # loads data to registers
        
        lw $t1, d1	# Load d1
        lw $t2, d2	# Load d2
        lw $t3, d4	# Load d4
        lw $t4, d5	# Load d5
        lw $t5, d7	# Load d7
        
        # the data can only be a 1 or 0 so we add them all up
        add $t0, $t1, $t2        
        add $t0, $t0, $t3        
        add $t0, $t0, $t4
        add $t0, $t0, $t5	
        # gets parody bit stores in $t0, this is the least 
        # significaly bit from the data added up so we dont 
        # need to worry about the even or odd this does it for us
        andi $t0, $t0, 1
        # store $t0 to word
        sw $t0, p1

        # P2: checks d1 d3 d4 d6 d7
        #loads data to registers
        
        lw $t1, d1	# Load d1
        lw $t2, d3	# Load d3
        lw $t3, d4	# Load d4
        lw $t4, d6	# Load d6
        lw $t5, d7	# Load d7
        
        #adds the data registrs
        
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        add $t0, $t0, $t5
        # gets parody bit stores in $t0, this is the least 
        # significaly bit from the data added up so we dont 
        # need to worry about the even or odd this does it for us
        andi $t0, $t0, 1
        #stores $t0 to p2
        sw $t0, p2

        # P4: checks d2 d3 d4 d8
        # loads data to the proper registers
        
        lw $t1, d2	# Load d2
        lw $t2, d3	# Load d3
        lw $t3, d4	# Load d4
        lw $t4, d8	# Load d8
        
        #adds the data from all loaded registers
        
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        # gets parody bit stores in $t0, this is the least 
        # significaly bit from the data added up so we dont 
        # need to worry about the even or odd this does it for us
        andi $t0, $t0, 1
        #stores $t0 p4
        sw $t0, p4

        # P8: checks d5 d6 d7 d8
        #loads data to registers
        
        lw $t1, d5	# Load d5
        lw $t2, d6	# Load d6
        lw $t3, d7	# Load d7
        lw $t4, d8	# Load d8
        
        #adds data from registers
        
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        # gets parody bit stores in $t0, this is the least 
        # significaly bit from the data added up so we dont 
        # need to worry about the even or odd this does it for us
        andi $t0, $t0, 1
        #stores $t0 to p8
        sw $t0, p8

        
        # program works correctly up to here !!!!!! check point
        
        
        # loads data to convert bits to an int to print later as hex
        # loads the 8 left most bits
        lw $t1, p1	# loads 1st bit
        lw $t2, p2	# loads 2nd bit
        lw $t3, d1	# loads 3rd bit
        lw $t4, p4	# loads 4th bit
        lw $t5, d2	# loads 5th bit
        lw $t6, d3	# loads 6th bit
        lw $t7, d4	# loads 7th bit
        lw $t8, p8	# loads 8th bit

        # Initialize $t0 to zero
        li $t0, 0

        # the code below manually takes takes the bits and converts to an integer number
        # $t0 is used as the acumulator
        # the code below takes the bits from all .words to prodce a integer number
        # if the is a 0 in the register will skip to the next register else we add int value to the $t0
        
        beq $t1, $zero, label1	# if register is = to 0 skip to lable
        add $t0, $t0, 2048		# add the apropraite value to resister
    label1:
        beq $t2, $zero, label2	# if register is = to 0 skip to lable
        add $t0, $t0, 1024		# add the apropraite value to resister
    label2:
        beq $t3, $zero, label3	# if register is = to 0 skip to lable
        add $t0, $t0, 512		# add the apropraite value to resister
    label3:
        beq $t4, $zero, label4	# if register is = to 0 skip to lable
        add $t0, $t0, 256		# add the apropraite value to resister
    label4:
        beq $t5, $zero, label5	# if register is = to 0 skip to lable
        add $t0, $t0, 128		# add the apropraite value to resister
    label5:
        beq $t6, $zero, label6	# if register is = to 0 skip to lable
        add $t0, $t0, 64		# add the apropraite value to resister
    label6:
        beq $t7, $zero, label7	# if register is = to 0 skip to lable
        add $t0, $t0, 32		# add the apropraite value to resister
    label7:
        beq $t8, $zero, label8	# if register is = to 0 skip to lable
        add $t0, $t0, 16		# add the apropraite value to resister
    label8:

        # Load 4 right most bits to the registers
        lw $t1, d5	# loads 9th bit
        lw $t2, d6	# loads 10th bit
        lw $t3, d7	# loads 11th bit
        lw $t4, d8	# loads 12th bit

        # the code below manually takes takes teh bits and converts to an integer number
        # $t0 is used as the acumulator
        # the code below takes the bits from all .words to prodce a integer number
        # if the is a 0 in the register will skip to the next register else we add int value to the $t0
        
        beq $t1, $zero, label9	# if register is = to 0 skip to lable
        add $t0, $t0, 8			# add the apropraite value to resister
    label9:
        beq $t2, $zero, label10	# if register is = to 0 skip to lable
        add $t0, $t0, 4			# add the apropraite value to resister
    label10:
        beq $t3, $zero, label11	# if register is = to 0 skip to lable
        add $t0, $t0, 2			# add the apropraite value to resister
    label11:
        beq $t4, $zero, label12	# if register is = to 0 skip to lable
        add $t0, $t0, 1			# add the apropraite value to resister
    label12:
        
        li $v0, 4                 # Syscall for print string
        la $a0, int_prompt2       # Load address of prompt message
        syscall                   # Print the message
        
        li $v0, 34                # Syscall for print hexadecimal
        move $a0, $t0             # Move the $t0 value to $a0
        syscall                   # Print the hexadecimal value
        
        
        
        # Exit the program
        li $v0, 10
        syscall

