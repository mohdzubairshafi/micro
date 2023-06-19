ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV ES, AX          ; Moves the value of AX to the extra segment register (ES)
        MOV CX, COUNT       ; Moves the value of COUNT to the CX register
        MOV DI, OFFSET STRING ; Moves the offset of STRING to the DI register
        MOV BL, 00H         ; Clears the BL register
        MOV AL, BYTE1       ; Moves the value of BYTE1 to the AL register
    SCAN1:                  ; Label for the SCAN1 loop
        NOP                 ; No operation (placeholder)
        SCASB               ; Compares AL with the byte at [ES:DI] and updates flags
        JZ XXX              ; Jumps to XXX if the comparison is equal (zero flag set)
        INC BL              ; Increments the BL register (counter for matches)
        LOOP SCAN1          ; Loops back to SCAN1 until CX becomes zero
    XXX:                    ; Label for XXX section
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

DATA SEGMENT                ; Begins the data segment
    BYTE1 EQU 25H           ; Defines a constant BYTE1 with a value of 25H
    COUNT EQU 06H           ; Defines a constant COUNT with a value of 06H
    STRING DB 12H, 13H, 20H, 20H, 25H, 21H ; Defines a byte sequence STRING
DATA ENDS                   ; Ends the data segment

END START                   ; End of the program
