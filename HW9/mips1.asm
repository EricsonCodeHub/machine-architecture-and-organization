.data
    prompt: .asciiz "Please enter integers to be averaged, enter 0 to stop: "
    result: .asciiz "The average of the numbers is: "
    remainderMessage:.asciiz ". "
    zeroValue: .asciiz " The average of the numbers is 0"
   
    quotient: .word 0      
    remainder: .word 0     
    
.text
.globl main

main:
    # Initialize sum and count to 0
    li $t0, 0          # Initialize sum to 0
    li $t1, 0          # Initialize count to 0

inputLoop:
    # Print prompt to user
    la $a0, prompt     # Load prompt message
    li $v0, 4          # Print string syscall
    syscall

    # Read an integer input
    li $v0, 5          # Syscall to read an integer
    syscall
    move $t2, $v0      # Store the input in $t2

    # Check if the input is 0 
    beq $t2, $zero, calculateOutput  # If input is 0 endProgram: calculate average

   
    add $t0, $t0, $t2  # Add input number to sum
    addi $t1, $t1, 1   # Increment the count
    j inputLoop

calculateOutput:
    beqz $t1, endProgram  # If count is zero go to 


    move $t3, $t0         # Move sum $t0 to $t3
    move $t4, $t1         # Move count $t1 to $t4
    li $t5, 0             # Initialize quotient to 0

divisionStart:
    # If $t3 is less than $t4 done
    bge $t3, $t4, continueDividing
    j divisionDone

continueDividing:
 
    sub $t3, $t3, $t4        # $t3 = $t3 - $t4
    addi $t5, $t5, 1         # $t5 = $t5 + 1

    j divisionStart

divisionDone:

    sw $t5, quotient         # Store t5 in quotient
    sw $t3, remainder 

    # Print results
    la   $a0, result         # Load result message
    li   $v0, 4              # Print string syscall
    syscall

    lw   $a0, quotient       # Load quotient 
    li   $v0, 1              # Print integer syscall
    syscall

    la   $a0, remainderMessage  # Load remainder message
    li   $v0, 4              # Print string syscall
    syscall
    
        lw   $a0, remainder        # Load quotient 
    li   $v0, 1              # Print integer syscall
    syscall


    li $v0, 10               # Load exit syscall code
    syscall                  # Exit the program

endProgram:

    la   $a0, zeroValue        
    li   $v0, 4              
    syscall
    
        li $v0, 10               # Load exit syscall code
    syscall                  # Exit the program
