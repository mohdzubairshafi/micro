ASSUME CS:CODE, DS:DATA
DATA SEGMENT
    LIST DW 1000H,2000H,1545H,6548H,6547H
    COUNT EQU 05H
    DATA ENDS
CODE SEGMENT
    START: XOR BX, BX
           XOR DX, DX
           MOV AX, DATA
           MOV DS, AX
           MOV CL, COUNT
           MOV SI, OFFSET LIST
    AGAIN: MOV AX, [SI]
           ROR AX, 01
           JC ODD
           INC BX
           JMP NEXT
    ODD:   INC DX
    NEXT:  ADD SI, 02
           DEC CL
           JNZ AGAIN
           MOV AH, 4CH
           INT 21H
CODE ENDS
    END START  