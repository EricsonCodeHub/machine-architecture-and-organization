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
	