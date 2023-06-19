ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

DATA SEGMENT                ; Begins the data segment
    MESSAGE DB 0DH, 0AH, " THE STUDY OF MICROPROCESSORS IS INTERESTING. ", 0DH, 0AH, "$" ; Defines a string variable MESSAGE
DATA ENDS                   ; Ends the data segment

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV AH, 09H         ; Sets the value of AH to 09H (print string function)
        MOV DX, OFFSET MESSAGE ; Moves the offset of MESSAGE to the DX register
        INT 21H             ; Generates an interrupt to print the string
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
