; Get an input of 1-9
; return the negative value of it

.ORIG x3000		;Initialize at x3000 
	
	LD R2, TOASCII	; Load variables
	LD R3, TODEC
	LD R4, NEG
	
	LEA R0, CIN	; Prompt for number between 1 and 9
	PUTS
	IN
		
	ADD R1, R0, #0	; Move number to R1 and Output the end string
	LEA R0, COUT
	PUTS

	ADD R0, R4, #0	; Print out "-" to console
	OUT
	
	ADD R0, R1, #0	; Print out the number
	OUT

HALT

; Variables

TOASCII .fill #48
TODEC .fill #-48
NEG .fill #45

CIN .STRINGZ "Please input a number from 1 - 9: "
COUT .STRINGZ "\nNegative value: "

.END
