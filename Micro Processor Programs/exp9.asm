ASSUME CS:CODE, DS:DATA
DATA SEGMENT
    SOURCESTRT EQU 2000H
    DESTSTRT EQU 3000H
    COUNT EQU 0FH
DATA ENDS

CODE SEGMENT
    START: MOV AX, DATA
           MOV DS, AX
           MOV ES, AX  
           MOV SI, SOURCESTRT
           MOV DI, DESTSTRT
           MOV CX, COUNT
           CLD
    REP    MOVSW
           MOV AH, 4CH
           INT 21H
CODE ENDS
    END START   