ASSUME CS:CODE, DS:DATA
DATA SEGMENT
    LIST DW 1234H,2579H,0A500H,0C009H,0159H,0B900H
    COUNT EQU 06H
DATA ENDS

CODE SEGMENT
    START: XOR BX, BX
           XOR DX, DX
           MOV AX, DATA
           MOV DS, AX
           MOV CL, COUNT
           MOV SI, OFFSET LIST
    AGAIN: MOV AX, [SI]
           SHL AX, 01
           JC NEGA
           INC BX
           JMP NEXT
    NEGA:  INC DX
    NEXT:  ADD SI, 02
           DEC CL
           JNZ AGAIN
           MOV AH, 4CH
           INT 21H
CODE ENDS
    END START   