ASSUME CS:CODE, DS:DATA
DATA SEGMENT
    OPR1 EQU 92H
    OPR2 EQU 52H
    RESULT DB 02 DUP <00>
DATA ENDS

CODE SEGMENT
    START: MOV AX, DATA
           MOV DS, AX
           MOV BL, OPR1
           XOR AL, AL
           MOV AL,OPR2
           ADD AL, BL
           DAA
           MOV RESULT, AL
           INC MSBO
           INC [RESULT+1]
    MSBO: MOV AH,4CH  
           INT 21H
CODE ENDS
    END START   