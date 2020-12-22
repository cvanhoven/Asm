; Factorial Sequence Project

.ORIG x3000

;Reset all register values
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
;
LD R5, TODEC
LD R6, DECREMENT

LEA R0, START
PUTS
GETC

ADD R0, R0, R5
BRnz NOTCORRECT			; Check if correct value
ADD R1, R1, #1
;
FACTORIAL	
	ADD R2, R4, #0		; Branch sandwich in order to multiply multiple times.
	ADD R2, R2, R0
	ADD R3, R4, #0
	
MULTIPLY	
		ADD R3, R3, R1	; Loop addition in order to seem like multiplication
		ADD R2, R2, R6
		BRp MULTIPLY
	
	ADD R1, R4, #0
	ADD R1, R1, R3
	BRn NOTCORRECT		; Check if correct value
	ADD R0, R0, R6
	BRp FACTORIAL
;

LEA R0, FINISH
PUTS

JSR PRINT	; Print factorial number

NOTCORRECT
	LEA R0, ERROR
	PUTS

HALT	; Halt the program after error is thrown

;Variables
DECREMENT .FILL #-1
TOASCII .FILL #48
TODEC .FILL #-48
THOUSAND .FILL #-1000
HUNDRED .FILL #-100
UPTHOUS .FILL #1000
UPHUND .FILL #100


START .STRINGZ "\n\nThis program will take an input number between 1 and 7, and retrun the factorial value of that number.\nPlease input a number between 1 and 7: "
FINISH .STRINGZ "\n\nYour factorial number is: "
ERROR .STRINGZ "\nYour input was not between 1 and 7.\n\nPlease try again."

PRINT	LD R1, UPTHOUS
	LD R2, UPHUND
	LD R5, THOUSAND
	LD R6, HUNDRED
	LD R4, TOASCII
	AND R0, R0, #0
	
THS	ADD R3, R3, R5	; Branch to output thousandth digit
	BRn ENDTHS
	ADD R0, R0, #1
	BRnzp THS
ENDTHS	ADD R0, R0, R4	; Convert to ASCII
	OUT
	LD R7, TOASCII
	AND R0, R0, #0	; Reset Incrementor
	ADD R3, R3, R1	; Add 1000 to help find hundredth
HUND	ADD R3, R3, R6	; Branch to output hundredth digit
	Brn ENDHUND
	ADD R0, R0, #1
	BRnzp HUND
ENDHUND ADD R0, R0, R4	; Convert to ASCII
	OUT
	AND R0, R0, #0	; Reset Incrementor
	ADD R3, R3, R2	; Add 100 to find tenth
TEN	ADD R3, R3, #-10	; Branch to output tenth digit
	BRn ENDTEN
	ADD R0, R0, #1
	BRnzp TEN
ENDTEN	ADD R0, R0, R4	; Convert to ASCII
	OUT
ZERO3	AND R0, R0, #0	; Reset Incrementor
	ADD R3, R3, #10
ONE	ADD R3, R3, #-1	; Branch to output tenth digit
	BRn ENDONE
	ADD R0, R0, #1
	BRnzp ONE
ENDONE	ADD R0, R0, R4	; Convert to ASCII
	OUT
	HALT	; Halt to end program in order to not output for error
	RET
	
	
	
.END