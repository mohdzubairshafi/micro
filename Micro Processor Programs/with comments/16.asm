ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

DATA SEGMENT                ; Begins the data segment
    DIM EQU 09H             ; Defines a constant DIM with a value of 09H
    MAT1 DB 01,02,03,04,05,06,07,08,09 ; Defines a byte sequence MAT1
    MAT2 DB 01,02,03,04,05,06,07,08,09 ; Defines a byte sequence MAT2
    RMAT3 DW 09 DUP<?>      ; Defines a word-sized variable RMAT3 with a placeholder value
DATA ENDS                   ; Ends the data segment

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV CX, DIM         ; Moves the value of DIM to the CX register
        MOV SI, OFFSET MAT1 ; Moves the offset of MAT1 to the SI register
        MOV DI, OFFSET MAT2 ; Moves the offset of MAT2 to the DI register
        MOV BX, OFFSET RMAT3 ; Moves the offset of RMAT3 to the BX register
    NEXT:                   ; Label for the NEXT loop
        XOR AX, AX          ; Clears the AX register
        MOV AL, [SI]        ; Moves the byte value at [SI] to AL
        ADD AL, [DI]        ; Adds the byte value at [DI] to AL
        MOV WORD PTR [BX], AX ; Moves the result (AX) to the memory location of [BX] (word-sized)
        INC SI              ; Increments the SI register (moves to the next byte in MAT1)
        INC DI              ; Increments the DI register (moves to the next byte in MAT2)
        ADD BX, 02          ; Adds 2 to the BX register (moves to the next word-sized location in RMAT3)
        LOOP NEXT           ; Loops back to NEXT until CX becomes zero
    MOV AH, 4CH             ; Sets the value of AH to indicate program termination
    INT 21H                 ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
