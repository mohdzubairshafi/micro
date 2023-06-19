ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

DATA SEGMENT                ; Begins the data segment
    CODELIST DB 36,48,59,45,23,12,19,20,21,00 ; Defines a byte sequence CODELIST
    CHAR EQU 05             ; Defines a constant CHAR with a value of 05
    CODEC DB 01H DUP<?>     ; Defines a byte variable CODEC with a placeholder value
DATA ENDS                   ; Ends the data segment

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV BX, OFFSET CODELIST ; Moves the offset of CODELIST to the BX register
        MOV AL, CHAR        ; Moves the value of CHAR to the AL register
        XLAT                ; Uses AL as an index to look up a byte in CODELIST and replaces AL with the looked-up byte
        MOV BYTE PTR CODEC, AL ; Moves the value in AL to the memory location of CODEC
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
