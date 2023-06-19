ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data
DATA SEGMENT                ; Begins the data segment
    OPR1 EQU 98H            ; Defines a constant OPR1 with a value of 98H
    OPR2 EQU 49H            ; Defines a constant OPR2 with a value of 49H
    SUM DW 01 DUP<00>       ; Defines a word-sized variable SUM and initializes it with zeros
    SUBT DW 01 DUP<00>      ; Defines a word-sized variable SUBT and initializes it with zeros
DATA ENDS                   ; Ends the data segment
CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV BL, OPR2        ; Moves the value of OPR2 to the BL register
        XOR AL, AL          ; Clears the AL register
        MOV AL, OPR1        ; Moves the value of OPR1 to the AL register
        ADD AL, BL          ; Adds the value of BL to AL
        DAA                 ; Adjusts the result in AL after addition
        MOV BYTE PTR SUM, AL ; Moves the result (AL) to the memory location of SUM
        JNC MSBO            ; Jumps to MSBO if no carry occurred during addition
        INC [SUM+1]         ; Increments the higher byte of SUM if a carry occurred
    MSBO:                   ; Label for the MSBO section
        XOR AL, AL          ; Clears the AL register
        MOV AL, OPR1        ; Moves the value of OPR1 to the AL register
        SUB AL, BL          ; Subtracts the value of BL from AL
        DAS                 ; Adjusts the result in AL after subtraction
        MOV BYTE PTR SUBT, AL ; Moves the result (AL) to the memory location of SUBT
        JNB MSB1            ; Jumps to MSB1 if no borrow occurred during subtraction
        INC [SUBT+1]        ; Increments the higher byte of SUBT if a borrow occurred
    MSB1:                   ; Label for the MSB1 section
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment
END START                   ; End of the program
