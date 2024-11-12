# MIPS Floating point examples
# by Philip Lamb
#
           li    $v0, 4          # Get display message code
           la    $a0, inputMesg1 # Get input message address
           syscall               # Display the message
           li    $v0, 6          # input floating point number code
           syscall               # Input the number
           s.s   $f0, firstNum   # Save the input number

           li    $v0, 4          # Get display message code
           la    $a0, inputMesg2 # Get input message address
           syscall               # Display the message
           li    $v0, 6          # input floating point number code
           syscall               # Input the number
           s.s   $f0, secondNum  # Save the input number
 
           l.s    $f2, firstNum  # Set up $f2 and $f4 with input numbers
           l.s    $f4, secondNum

# Add
           add.s $f6, $f2, $f4   # single precision add     
           s.s   $f6, FPSum      # Save sum 

           li    $v0, 4          # Get display message code
           la    $a0, sumMesg    # Get message address
           syscall               # Display the sum message
	   l.s   $f12, FPSum     # Get the sum
           li    $v0, 2          # Display floating point number code
           syscall               # Display the sum

# Subtract           
           sub.s $f8, $f2, $f4   # single precision sub
           s.s   $f8, FPDiff     # Save difference
           
           li    $v0, 4          # Get display message code
           la    $a0, diffMesg   # Get message address
           syscall               # Display the difference message
	   l.s   $f12, FPDiff    # Get the difference
           li    $v0, 2          # Display floating point number code
           syscall               # Display the sum

# Subtract the other way               
           sub.s $f10, $f4, $f2  # single precision sub
           s.s   $f10, FPDiff2   # Save difference
           li    $v0, 4          # Get display message code
           la    $a0, diffMesg   # Get message address
           syscall               # Display the difference message
	   l.s   $f12, FPDiff2   # Get the difference
           li    $v0, 2          # Display floating point number code
           syscall               # Display the sum

# Multiply           
           mul.s $f10, $f4, $f2  # single precision multiply
           s.s   $f10, FPProd    # Save difference
           li    $v0, 4          # Get display message code
           la    $a0, prodMesg   # Get message address
           syscall               # Display the difference message
	   l.s   $f12, FPProd    # Display floating point number code
	   li    $v0, 2          # Display floating point number code
           syscall               # Display the sum

# Divide           
           div.s $f10, $f4, $f2  # single precision divide
           s.s   $f10, FPQuot    # Save difference
           li    $v0, 4          # Get display message code
           la    $a0, quotMesg   # Get message address
           syscall               # Display the difference message
	   l.s   $f12, FPQuot    # Display floating point number code
	   li    $v0, 2          # Display floating point number code
           syscall               # Display the quotient

                        
.data 
firstNum:  .float 0
secondNum: .float 0
divResult: .float 0
FPSum:     .float 0
FPDiff:    .float 0
FPDiff2:   .float 0
FPProd:    .float 0
FPQuot:    .float 0

sumMesg:   .asciiz  "\nThe sum is "
diffMesg:  .asciiz  "\nThe difference is "
prodMesg:  .asciiz  "\nThe product is "
quotMesg:  .asciiz  "\nThe quotient is "
inputMesg1: .asciiz  "\nInput the first number "
inputMesg2: .asciiz  "Input the 2nd number "
