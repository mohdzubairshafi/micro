ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

DATA SEGMENT                ; Begins the data segment
    ROCOL EQU 03H           ; Defines a constant ROCOL with a value of 03H
    MAT1 DB 05H,09H,0AH,03H,02H,07H,03H,00H,09H ; Defines a byte sequence MAT1
    MAT2 DB 09H,07H,02H,01H,00H,0DH,07H,06H,02H ; Defines a byte sequence MAT2
    PMAT3 DW 09H DUP<?>     ; Defines a word-sized variable PMAT3 with a placeholder value
DATA ENDS                   ; Ends the data segment

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV CH, ROCOL       ; Moves the value of ROCOL to the CH register
        MOV BX, OFFSET PMAT3 ; Moves the offset of PMAT3 to the BX register
        MOV SI, OFFSET MAT1 ; Moves the offset of MAT1 to the SI register
    NEXTROW:                ; Label for the NEXTROW loop
        MOV DI, OFFSET MAT2 ; Moves the offset of MAT2 to the DI register
        MOV CL, ROCOL       ; Moves the value of ROCOL to the CL register
    NEXTCOL:                ; Label for the NEXTCOL loop
        MOV DL, ROCOL       ; Moves the value of ROCOL to the DL register
        MOV BP, 0000H       ; Initializes BP register to zero
        MOV AX, 0000H       ; Initializes AX register to zero
        SAHF                ; Stores flags in AH from the last instruction
    NEXT_ELE:               ; Label for the NEXT_ELE loop
        MOV AL, [SI]        ; Moves the byte value at [SI] to AL
        MUL BYTE PTR[DI]    ; Multiplies AL with the byte value at [DI]
        ADD BP, AX          ; Adds the result in AX to BP
        INC SI              ; Increments the SI register (moves to the next byte in MAT1)
        ADD DI, 03          ; Adds 3 to the DI register (moves to the next element in MAT2)
        DEC DL              ; Decrements the DL register (counter for remaining columns)
        JNZ NEXT_ELE        ; Jumps back to NEXT_ELE if DL is not zero
        SUB DI, 08          ; Subtracts 8 from the DI register (moves back to the first element in MAT2)
        SUB SI, 03          ; Subtracts 3 from the SI register (moves back to the first byte in MAT1)
        MOV [BX], BP        ; Moves the value in BP to the memory location of [BX] (word-sized)
        ADD BX, 02          ; Adds 2 to the BX register (moves to the next word-sized location in PMAT3)
        DEC CL              ; Decrements the CL register (counter for remaining columns)
        JNZ NEXTCOL         ; Jumps back to NEXTCOL if CL is not zero
        ADD SI, 03          ; Adds 3 to the SI register (moves to the next row in MAT1)
        DEC CH              ; Decrements the CH register (counter for remaining rows)
        JNZ NEXTROW         ; Jumps back to NEXTROW if CH is not zero
    MOV AH, 4CH             ; Sets the value of AH to indicate program termination
    INT 21H                 ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
