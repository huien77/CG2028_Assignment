	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	classification
 	.thumb_func

@ CG2028 Assignment, Sem 1, AY 2021/22
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@ student 1: Name: Tan Kah Heng, Matriculation No.: A0217641J
@ student 2: Name: Tan Hui En, Matriculation No.: A0221841N

@Register map
@R0 - N, returns class
@R1 - points
@R2 - label
@R3 - sample
@R4 - x coor of points
@R5 - y coor of points
@R6 - smalled d2
@R7 - label
@R8 - loop counter
@R9 - temp for label/xy coor

classification:
@ PUSH / save (only those) registers that are modified by your function
		PUSH {R1-R9,R14}
@ parameter registers need not be saved.

@ write asm function body here
		MOVW R6, #0xFFFF
		MOV R8, R0       	@ 0000 00 011010 0000 1000 0000000 0 0000
                           	@ 0x01A08000
	    LOOP:

		LDR R4, [R1], #4 	@ 0000 01 001001 0001 0100 0000 00000100
                           	@ 0x04914004
		LDR R5, [R1], #4 	@ 0000 01 001001 0001 0101 0000 00000100
                           	@ 0x04915004
		// calculating x^2
		LDR R9, [R3], #4 	@ 0000 01 001001 0011 1001 0000 00000100
                           	@ 0x04939004
		SUB R4, R9       	@ 0000 00 000100 1001 0100 0000000 0 0000
		                 	@ 0x00494000
        MUL R4, R4       	@ 0000 00 000000 0000 0100 0100 000 1 0100
                           	@ 0x00004414
		//calculating y^2
		LDR R9, [R3], #-4	@ 0000 01 000001 0011 1001 0000 00000100
                           	@ 0x04139004
		SUB R5, R9       	@ 0000 00 000100 1001 0101 0000000 0 0000
		                 	@ 0x00495999
		MUL R5, R5       	@ 0000 00 000000 0000 0101 0101 000 1 0101
             	            @ 0x00005515
		//calculating d^2
		ADD R5, R4       	@ 0000 00 001000 0101 0101 0000000 0 0100
       	  	            	@ 0x00855004
		//compare current d^2 with smallest d^2, update if needed
		LDR R9, [R2], #4 	@ 0000 01 001001 0010 1001 0000 00000100
			            	@ 0x04929004
		CMP R5, R6       	@ 0000 00 010100 0101 0000 0000000 0 0110
			            	@ 0x01450006
		ITT LO
		MOVLO R6, R5      	//update smallest d^2
		MOVLO R7, R9      	//update classific. group (1 or 0)

		SUBS R8, #1      	@ 0000 00 100101 1000 1000 0000 00000001
			            	@ 0x02588001
	    BGT LOOP         	@ 1100 10 000000 000000000000 01000000
			            	@ 0xC8000040
		MOV R0, R7       	@ 0000 00 011010 0000 0000 0000000 0 0111
			            	@ 0x01A00007

@ branch to SUBROUTINE for illustration only
@		BL SUBROUTINE

@ prepare value to return (class) to C program in R0
@ the #5 here is an arbitrary result
@		MOVW R0, #5

@ POP / restore original register values. DO NOT save or restore R0. Why?
		POP {R1-R9,R14}

@ return to C program
		BX	LR

@ you could write your code without SUBROUTINE
@SUBROUTINE:
@		BX LR

@label: .word value

@.lcomm label num_bytes
