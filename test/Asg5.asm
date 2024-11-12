.data
mask: .word 0xF1DA          # Declare a word with the value 0xF1DA
newline: .asciiz "\n"       # String for newline

.text
main:
    li           $s1, 83                    # Load immediate value 83 into $s1
    li           $s4, 54                    # Load immediate value 54 into $s4
    sub          $s2, $s1, $s4              # Subtract $s4 from $s1, store result in $s2
    lw           $s3, mask                   # Load word from memory label 'mask' into $s3
    or           $s5, $s3, $s2               # Bitwise OR $s3 and $s2, store result in $s5
    addi         $s6, $s1, 4                 # Add 4 to $s1, store result in $s6

    # Print register values with line breaks
    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s1                  # Move value of $s1 to $a0
    syscall                       # Print $s1

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s2                  # Move value of $s2 to $a0
    syscall                       # Print $s2

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s3                  # Move value of $s3 to $a0
    syscall                       # Print $s3

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s4                  # Move value of $s4 to $a0
    syscall                       # Print $s4

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s5                  # Move value of $s5 to $a0
    syscall                       # Print $s5

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    li $v0, 1                      # Load syscall code for print integer
    move $a0, $s6                  # Move value of $s6 to $a0
    syscall                       # Print $s6

    li $v0, 4                      # Load syscall code for print string
    la $a0, newline                # Load address of newline string into $a0
    syscall                       # Print newline

    # Exit program
    li $v0, 10                     # Load syscall code for exit
    syscall                        # Exit program
