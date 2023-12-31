ASSUME CS: CODE, DS: DATA, SS: STACK
DATA SEGMENT
    
    LIST DW 10H,11H,12H,13H,14H,15H,16H,17H,18H,19H     
    RESULT DW 10H,11H,12H,13H,14H,15H,16H,17H,18H,19H
    COUNT EQU AH
DATA ENDS 


STACK SEGMENT             
    STACKDATA DW 0AH DUP<?>    
STACK ENDS

CODE SEGMENT   
START:  MOV AX, DATA
        MOV DS, AX  
        MOV AX, STACK
        MOV SS, AX
        MOV SP, OFFSET LIST
        MOV CL, COUNT
        MOV BX, OFFSET RESULT + COUNT
NEXT:   POP AX
        MOV DX, SP
        MOV SP, BX
        PUSH AX
        MOV BX, SP
        MOV SP, DX
        DEC CL
        JNZ NEXT
        MOV AH, 4CH
        INT 21H
CODE ENDS

END START
