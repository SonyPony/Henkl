MAIN:
	MOV A, #1B
	MOV P1, A
	
	MOV R6, #23D
INN2:	RL A
	CALL DEL470MS
	MOV P1, A
	DJNZ R6, INN2

	MOV R6, #24D
INN3:	RR A
	CALL DEL470MS
	MOV P1, A
	DJNZ R6, INN3

	MOV A, #0FH
	MOV R6, #4D
	MOV P1, A

INN4:	SWAP A
	MOV P1, A
	CALL DEL470MS
	DJNZ R6, INN4
JMP MAIN

DEL470MS:
	MOV R2, #10D
INN1:	MOV R1, #48D
	MOV R0, #114D
	CALL DELVAR
	DJNZ R2, INN1
	RET
	
DELVAR:
	MOV TMOD, #1B
	MOV TH0, R1
	MOV TL0, R0
	CLR TF0
	
	SETB TR0

	JNB TF0, $
	
	RET
END
