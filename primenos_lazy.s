	AREA mycode, CODE, READONLY
		ENTRY
		EXPORT __main
__main
	LDR R5, =mem	;store base memory address in R5
	MOV R0,#100;INPUT NUMBER
NX			;external loop where we decrement from 100 to 2
	CMP R0,#2 	;when r0 is 2 we add it the prime list
	BEQ STORENUM
	CMP R0,#3 	;when r0 is 3 we add it the prime list
	BEQ STORENUM
	MOV R1,#2	;divisor initial value
	MOV R2,#0
	MOV R3,#0
	MOV R4,#0
	MOV R6,#0
	SUB R7,R0,#1 	;decrement the max number for divisor
ST			;internal loop
	SDIV R2,R0,R1	
	MUL R3,R2,R1
	SUB R4,R0,R3	;get r4 as reminder
	CMP R4, #0	;compare divisor with zero check if equal or not
	BNE NEXDIV	;if not zero we go to the next divisor 
	B NEXNUM	;if yes we go to the next number 
NEXDIV
	ADD R1,#1	;divisor next value
	CMP R1,R7	;compare with divisor max value i.e until input_number - 1
	BNE ST		;if not equal goto internal loop and proceed 
STORENUM		;label if the number is prime
	ADD R8,#1	;counting for checking
	STR R0,[R5],#1	;Storing the current value in memory since it is prime
	CMP R0,#2	;checking for prime numbers till 2 from input_number
	BNE NEXNUM	;proceed to find the next number
	B STOP		;if it has reached end program
NEXNUM
	SUB R0,#1	;decrement R0 by 1 to get the next number  
	B NX		;proceed to outer loop and check for prime 
STOP
	B STOP		;infinite loop to end program
 
	AREA mydata, DATA, READWRITE
		EXPORT mem
mem 
	SPACE 40;40 bytes for storage increase if ur storing more than 40 or so prime numbers
	END
