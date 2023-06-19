ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data
DATA SEGMENT                ; Begins the data segment
    OPR1 EQU 98H            ; Defines a constant OPR1 with a value of 98H
    OPR2 EQU 49H            ; Defines a constant OPR2 with a value of 49H
    PROD DW 01 DUP<00>      ; Defines a word-sized variable PROD and initializes it with zeros
    DIVS DW 01 DUP<00>      ; Defines a word-sized variable DIVS and initializes it with zeros
DATA ENDS                   ; Ends the data segment
CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV BL, OPR2        ; Moves the value of OPR2 to the BL register
        XOR AL, AL          ; Clears the AL register
        MOV AL, OPR1        ; Moves the value of OPR1 to the AL register
        MUL BL              ; Multiplies AL by BL, the result is stored in AX
        MOV WORD PTR PROD, AX ; Moves the word-sized result (AX) to the memory location of PROD
        XOR AH, AH          ; Clears the AH register
        MOV AL, OPR1        ; Moves the value of OPR1 to the AL register
        DIV BL              ; Divides AL by BL, the quotient is stored in AL and the remainder in AH
        MOV WORD PTR DIVS, AX ; Moves the word-sized quotient (AX) to the memory location of DIVS
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment
END START                   ; End of the program
