ASSUME CS: CODE, DS: DATA   ; Specifies the segment assumptions for code and data

DATA SEGMENT                ; Begins the data segment
    NUM DD 335A379BH        ; Defines a double-word variable NUM with a hexadecimal value
    BYTE_COUNT EQU 04       ; Defines a constant BYTE_COUNT with a value of 04
DATA ENDS                   ; Ends the data segment

CODE SEGMENT                ; Begins the code segment
    START:                  ; Entry point of the program
        MOV AX, DATA        ; Moves the value of the data segment to the AX register
        MOV DS, AX          ; Moves the value of AX to the data segment register (DS)
        MOV DH, BYTE_COUNT  ; Moves the value of BYTE_COUNT to the DH register
        XOR AL, AL          ; Clears the AL register
        MOV CL, 00          ; Clears the CL register
        MOV SI, OFFSET NUM  ; Moves the offset of NUM to the SI register
    NEXT_BYTE:              ; Label for the NEXT_BYTE loop
        ADD AL, [SI]        ; Adds the byte value at [SI] to AL
        JP EVENP            ; Jumps to EVENP if the parity flag is set (odd number of 1s in AL)
        INC CL              ; Increments the CL register (counter for odd bytes)
    EVENP:                  ; Label for the EVENP section
        INC SI              ; Increments the SI register (moves to the next byte)
        MOV AL, 00          ; Clears the AL register
        DEC DH              ; Decrements the DH register (counter for remaining bytes)
        JNZ NEXT_BYTE       ; Jumps back to NEXT_BYTE if DH is not zero
        MOV DL, 00          ; Clears the DL register
        RCR CL, 1           ; Rotates the bits in CL to the right by 1, with the carry flag included
        JNC CLEAR           ; Jumps to CLEAR if the carry flag is not set (even number of odd bytes)
        INC DL              ; Increments the DL register (flag indicating odd number of odd bytes)
    CLEAR:                  ; Label for the CLEAR section
        MOV AH, 4CH         ; Sets the value of AH to indicate program termination
        INT 21H             ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
