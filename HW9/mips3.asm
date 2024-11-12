.data
    prompt:      .asciiz "\nEnter a 5 letter word: "
    result:      .asciiz "\nreversed word: "
    char1:  .byte 0
    char2:  .byte 0
    char3:  .byte 0
    char4:  .byte 0
    char5:  .byte 0

.text


main:
    # Print the prompt message
    li $v0, 4                # system call for printing string
    la $a0, prompt           # load address of the prompt message
    syscall

    # Read the input string
    li $v0, 8                # system call for reading string
    la $a0, char1            # load address of char1 to store input
    li $a1, 6                # max input 5
    syscall

# load chars
    	lb $t0, char1            # load char1 to $t0
    	lb $t1, char2            # load char2 to $t1
    	lb $t2, char3            # load char3 to $t2
    	lb $t3, char4            # load char4 to $t3
    	lb $t4, char5            # load char5 to $t4

# reverse
    sb $t0, char5            # store char1 to $t0
    sb $t1, char4            # store char2 to $t1
    sb $t2, char3            # store char3 to $t2
    sb $t3, char2            # store char4 to $t3
    sb $t4, char1            # store char5 to $t4

    li $v0, 4                # print call
    la $a0, result           # load resul
    syscall

    li $v0, 4                # print call
    la $a0, char1            # load char one
    syscall

    li $v0, 10               # system call for exit
    syscall
