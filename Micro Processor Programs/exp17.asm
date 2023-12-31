ASSUME CS: CODE, DS: DATA
DATA SEGMENT
    ROCOL EQU 03H
    MAT1 DB 05H,09H,0AH,03H,02H,07H,03H,00H,09H
    MAT2 DB 09H,07H,02H,01H,0H,0DH,7H,06H,02H
    PMAT3 DW 09H DUP<?>
DATA ENDS

CODE SEGMENT
    START: MOV AX, DATA
    MOV DS, AX
    MOV CH, ROCOL
    MOV BX, OFFSET PMAT3
    MOV SI, OFFSET MAT1
    NEXTROW: MOV DI, OFFSET MAT2    
    MOV CL, ROCOL
    NEXTCOL: MOV DL, ROCOL
    MOV BP, 0000H
    MOV AX, 0000H
    SAHF
    NEXT_ELE: MOV AL, [SI]    
    MUL BYTE PTR[DI]
    ADD BP, AX      
    INC SI
    ADD DI, 03
    DEC DL
    JNZ NEXT_ELE
    SUB DI, 08
    SUB SI, 03
    MOV [BX], BP
    ADD BX, 02
    DEC CL
    JNZ NEXTCOL
    ADD SI, 03
    DEC CH
    JNZ NEXTROW
    MOV AH, 4CH
    INT 21H
CODE ENDS

END START
    