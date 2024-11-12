.data
    promptMessage: .asciiz
    userInput: .word 0

.text
.globl main

main:

    li $v0, 4 
    la $a0, promptMessage
    syscall

 
    li $v0, 5 
    syscall
    sw $v0, userInput
    bgtz $v0, end_program
    

    mul  $v0, $v0 ,-1
    
end_program:
    # Print the value in $v0
    li $v0, 1          # Syscall code for print integer
    move $a0, $v0      # Move the value in $v0 to $a0
    syscall

    # Exit the program
    li $v0, 10         # Syscall code for exit
    syscall

	