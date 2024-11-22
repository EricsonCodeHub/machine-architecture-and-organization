.data
prompt1:      .asciiz "\nEnter a 12-bit binary number: "
prompt2:      .asciiz "\nHere is the hamming code you entered: "
prompt3:		.asciiz "\nHere is the hamming recalculted using the bad data bits to get new parody bits: "
prompt4:		.asciiz "\nbad bit at position : "
prompt5:		.asciiz "\nHere is the correccted ham code: "
prompt6:		.asciiz "\nthe correct ham code in hex: "
buffer:      .space 13  # Buffer for 12 characters + null terminator

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

cp1: .word 0   # Parity bit 1
cp2: .word 0   # Parity bit 2
cp4: .word 0   # Parity bit 4
cp8: .word 0   # Parity bit 8
badBit: .word 0   # Parity bit 1


.text
.globl main

main:
    # Print prompt
    li   $v0, 4              # syscall for print_str
    la   $a0, prompt1         # Load address of prompt
    syscall

    # Read input string (up to 12 characters)
    li   $v0, 8              # syscall for reading string
    la   $a0, buffer         # Load address of buffer
    li   $a1, 13             # Max input length (12 chars + null terminator)
    syscall

    # Initialize loop counter (t0 = 0)
    li   $t0, 0              

    # Extract bits from buffer and store them in appropriate words //////////////////////////////////////////////////////////////
    lb   $t1, buffer($t0)    # Load byte from buffer at index t0
    andi $t2, $t1, 1       # Extract the least significant bit (P1)
    sw   $t2, p1             # Store in p1
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load next byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (P2)
    sw   $t2, p2             # Store in p2
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D1)
    sw   $t2, d1             # Store in d1
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (P4)
    sw   $t2, p4             # Store in p4
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D2)
    sw   $t2, d2             # Store in d2
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D3)
    sw   $t2, d3             # Store in d3
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D4)
    sw   $t2, d4             # Store in d4
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (P8)
    sw   $t2, p8             # Store in p8
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D5)
    sw   $t2, d5             # Store in d5
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D6)
    sw   $t2, d6             # Store in d6
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D7)
    sw   $t2, d7             # Store in d7
    addi $t0, $t0, 1         # Increment loop counter

    lb   $t1, buffer($t0)    # Load byte from buffer
    andi $t2, $t1, 1       # Extract the least significant bit (D8)
    sw   $t2, d8             # Store in d8
    addi $t0, $t0, 1         # Increment loop counter

    # Print prompt to check logic //////////////////////////////////////////////////////////////
    li   $v0, 4              # syscall for print_str
    la   $a0, prompt2         # Load address of prompt
    syscall

    # Print parity and data bits as individual bits (0 or 1)
    li $v0, 1                  # syscall for print_int (decimal)
    
    # Print P1
    lw $a0, p1                 # Load p1 into $a0
    syscall                    # Print p1

    # Print P2
    lw $a0, p2                 # Load p2 into $a0
    syscall                    # Print p2

    # Print D1
    lw $a0, d1                 # Load d1 into $a0
    syscall                    # Print d1

    # Print P4
    lw $a0, p4                 # Load p4 into $a0
    syscall                    # Print p4

    # Print D2
    lw $a0, d2                 # Load d2 into $a0
    syscall                    # Print d2

    # Print D3
    lw $a0, d3                 # Load d3 into $a0
    syscall                    # Print d3

    # Print D4
    lw $a0, d4                 # Load d4 into $a0
    syscall                    # Print d4
    
    # Print P8
    lw $a0, p8                 # Load p8 into $a0
    syscall                    # Print p8

    # Print D5
    lw $a0, d5                 # Load d5 into $a0
    syscall                    # Print d5

    # Print D6
    lw $a0, d6                 # Load d6 into $a0
    syscall                    # Print d6

    # Print D7
    lw $a0, d7                 # Load d7 into $a0
    syscall                    # Print d7

    # Print D8
    lw $a0, d8                 # Load d8 into $a0
    syscall                    # Print d8
    
    # at this point we have out hamming code input set up in in p and d .words
    
    
    # checking the hamming code 
    
    # Calculate parity bits cP1 cP2 cP4 cP8  the data could be bad we will see
    # after this step we will check comapre the parody bits from p1-8 and cp1-8
    
        # P1: checks d1 d2 d4 d5 d7
        # loads data to registers
        lw $t1, d1
        lw $t2, d2
        lw $t3, d4
        lw $t4, d5
        lw $t5, d7
        
        # the data can only be a 1 or 0 so we add them all up
        add $t0, $t1, $t2         
        add $t0, $t0, $t3          
        add $t0, $t0, $t4
        add $t0, $t0, $t5	
        # gets parody bit stores in $t0
        andi $t0, $t0, 1
        # store $t0 to word
        sw $t0, cp1

        # P2: checks d1 d3 d4 d6 d7
        #loads data to registers
        lw $t1, d1
        lw $t2, d3
        lw $t3, d4
        lw $t4, d6
        lw $t5, d7
        #adds the data registrs
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        add $t0, $t0, $t5
        # gets parody bit stores in $t0
        andi $t0, $t0, 1
        #stores $t0 to p2
        sw $t0, cp2

        # P4: checks d2 d3 d4 d8
        # loads data to the proper registers
        lw $t1, d2
        lw $t2, d3
        lw $t3, d4
        lw $t4, d8
        #adds the data from all loaded registers
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        # gets parody bit stores in $t0
        andi $t0, $t0, 1
        #stores $t0 p4
        sw $t0, cp4

        # P8: checks d5 d6 d7 d8
        #loads data to registers
        lw $t1, d5
        lw $t2, d6
        lw $t3, d7
        lw $t4, d8
        #adds data from registers
        add $t0, $t1, $t2
        add $t0, $t0, $t3
        add $t0, $t0, $t4
        # gets parody bit stores in $t0
        andi $t0, $t0, 1
        #stores $t0 to p8
        sw $t0, cp8
        
        
        
        # Print prints hamming code after looking at data bits //////////////////////////////////////////////////////////////
    li   $v0, 4              # syscall for print_str
    la   $a0, prompt3         # Load address of prompt
    syscall

    # Print parity and data bits as individual bits (0 or 1)
    li $v0, 1                  # syscall for print_int (decimal)
    
    # Print P1
    lw $a0, cp1                 # Load p1 into $a0
    syscall                    # Print p1

    # Print P2
    lw $a0, cp2                 # Load p2 into $a0
    syscall                    # Print p2

    # Print D1
    lw $a0, d1                 # Load d1 into $a0
    syscall                    # Print d1

    # Print P4
    lw $a0, cp4                 # Load p4 into $a0
    syscall                    # Print p4

    # Print D2
    lw $a0, d2                 # Load d2 into $a0
    syscall                    # Print d2

    # Print D3
    lw $a0, d3                 # Load d3 into $a0
    syscall                    # Print d3

    # Print D4
    lw $a0, d4                 # Load d4 into $a0
    syscall                    # Print d4
    
    # Print P8
    lw $a0, cp8                 # Load p8 into $a0
    syscall                    # Print p8

    # Print D5
    lw $a0, d5                 # Load d5 into $a0
    syscall                    # Print d5

    # Print D6
    lw $a0, d6                 # Load d6 into $a0
    syscall                    # Print d6

    # Print D7
    lw $a0, d7                 # Load d7 into $a0
    syscall                    # Print d7

    # Print D8
    lw $a0, d8                 # Load d8 into $a0
    syscall                    # Print d8
    
    ## from here we can compare parody bits to check for correctness
    # we use these later to fix users data pits 
    # we will use $04 as acumulater
    # the value at the end in t0 will be th ebit that wee need to fix
    
    li $t0, 0
    
    # check p1s for error
    lw $t1 , p1
    lw $t2 , cp1
    beq $t1, $t2, skipp1 
    add $t0, $t0, 1
    skipp1:
    
    # check p2s for error
    lw $t1 , p2
    lw $t2 , cp2
    beq $t1, $t2, skipp2 
    add $t0, $t0, 2
    skipp2:
    
    # check p4s for error
    lw $t1 , p4
    lw $t2 , cp4
    beq $t1, $t2, skipp4 
    add $t0, $t0, 4
    skipp4:
    
    # check p8s for error
    lw $t1 , p8
    lw $t2 , cp8
    beq $t1, $t2, skipp8 
    add $t0, $t0, 8
    skipp8:
    
    sw $t0, badBit # may be needed for later  // not curently used
    
    li   $v0, 4              # syscall for print_str
    la   $a0, prompt4         # Load address of prompt
    syscall
    
    li $v0, 1           # Load syscall code 1 for print integer
    move $a0, $t0       # Move the value of $t0 into $a0 (argument register)
    syscall             # Make the syscall
    
    #011100101010  correct
	#011100101110  10th position is bad
	
	
		#### we flip bits of the bad bit possition here
	 lw $t0, badBit
	 # bit 3
	 bne $t0, 3, skp3
	 lw $t1 d1
	 xor $t1, $t1, 1  # problem here
	 sw $t1, d1
	 skp3:
	 
	 # bit 5
	 bne $t0, 5, skp5
	 lw $t1 d2
	 xor $t1, $t1, 1# problem here
	 sw $t1, d2
	 skp5:
	 
	 # bit 6
	 bne $t0, 6, skp6
	 lw $t1 d3
	 xor $t1, $t1, 1# problem here
	 sw $t1, d3
	 skp6:
	 
	 # bit 7
	 bne $t0, 7, skp7
	 lw $t1 d4
	 xor $t1, $t1, 1# problem here
	 sw $t1, d4
	 skp7:
	 
		# bit 9
	 bne $t0, 9, skp9
	 lw $t1 d5
	 xor $t1, $t1, 1# problem here
	 sw $t1, d5
	 skp9:
	 
	 		# bit 10
	 bne $t0, 10, skp10
	 lw $t1 d6
	 xor $t1, $t1, 1# problem here
	 sw $t1, d6
	 skp10:
	 
	 	# bit 11
	 bne $t0, 11, skp11
	 lw $t1 d7
	 xor $t1, $t1, 1# problem here
	 sw $t1, d7
	 skp11:
	 
	 	# bit 12
	 bne $t0, 12, skp12
	 lw $t1 d8
	 xor $t1, $t1, 1# problem here
	 sw $t1, d8
	 skp12:

	# bits are fixed above
	  


	
	# bits are fixed above
	
	 
	
	# print corrected ham code in binary
	# Print prompt to check logic //////////////////////////////////////////////////////////////
    li   $v0, 4              # syscall for print_str
    la   $a0, prompt5         # Load address of prompt
    syscall

    # Print parity and data bits as individual bits (0 or 1)
    li $v0, 1                  # syscall for print_int (decimal)
    
    # Print P1
    lw $a0, p1                 # Load p1 into $a0
    syscall                    # Print p1

    # Print P2
    lw $a0, p2                 # Load p2 into $a0
    syscall                    # Print p2

    # Print D1
    lw $a0, d1                 # Load d1 into $a0
    syscall                    # Print d1

    # Print P4
    lw $a0, p4                 # Load p4 into $a0
    syscall                    # Print p4

    # Print D2
    lw $a0, d2                 # Load d2 into $a0
    syscall                    # Print d2

    # Print D3
    lw $a0, d3                 # Load d3 into $a0
    syscall                    # Print d3

    # Print D4
    lw $a0, d4                 # Load d4 into $a0
    syscall                    # Print d4
    
    # Print P8
    lw $a0, p8                 # Load p8 into $a0
    syscall                    # Print p8

    # Print D5
    lw $a0, d5                 # Load d5 into $a0
    syscall                    # Print d5

    # Print D6
    lw $a0, d6                 # Load d6 into $a0
    syscall                    # Print d6

    # Print D7
    lw $a0, d7                 # Load d7 into $a0
    syscall                    # Print d7

    # Print D8
    lw $a0, d8                 # Load d8 into $a0
    syscall                    # Print d8
    #011100101010  correct
	#011100101110  10th position is bad
	
	#011110101010  bad 5th
	
	### logic is good to here
	
	
	# print correction in hex
	
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

        # the code below manually takes takes teh bits and converts to an integer number
        # $t0 is used as the acumulator
        # the code below takes the bits from all .words to prodce a integer number
        # if the is a 0 in the register will skip to the next register else we add int value to the $t0
        
        beq $t1, $zero, label1
        add $t0, $t0, 2048
    label1:
        beq $t2, $zero, label2
        add $t0, $t0, 1024
    label2:
        beq $t3, $zero, label3
        add $t0, $t0, 512
    label3:
        beq $t4, $zero, label4
        add $t0, $t0, 256
    label4:
        beq $t5, $zero, label5
        add $t0, $t0, 128
    label5:
        beq $t6, $zero, label6
        add $t0, $t0, 64
    label6:
        beq $t7, $zero, label7
        add $t0, $t0, 32
    label7:
        beq $t8, $zero, label8
        add $t0, $t0, 16
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
        beq $t1, $zero, label9
        add $t0, $t0, 8
    label9:
        beq $t2, $zero, label10
        add $t0, $t0, 4
    label10:
        beq $t3, $zero, label11
        add $t0, $t0, 2
    label11:
        beq $t4, $zero, label12
        add $t0, $t0, 1
    label12:
        
        li $v0, 4                 # Syscall for print string
        la $a0, prompt6       # Load address of prompt message
        syscall                   # Print the message
        
        li $v0, 34                # Syscall for print hexadecimal
        move $a0, $t0             # Move the $t0 value to $a0
        syscall                   # Print the hexadecimal value
        
        
        
        # Exit the program
        li $v0, 10
        syscall
        
            #011100101010  correct
	#011100101110  10th position is bad
	
	#011110101010  bad 5th
	
	

    
    


