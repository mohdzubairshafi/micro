ASSUME CS: CODE, DS: DATA, SS: STACK   ; Specifies the segment assumptions for code, data, and stack

DATA SEGMENT                ; Begins the data segment
    LIST DW 10H,11H,12H,13H,14H,15H,16H,17H,18H,19H ; Defines an array LIST with 10 words
    RESULT DW 10H,11H,12H,13H,14H,15H,16H,17H,18H,19H ; Defines an array RESULT with 10 words
    COUNT EQU AH            ; Defines COUNT as an alias for AH
DATA ENDS                   ; Ends the data segment

STACK SEGMENT               ; Begins the stack segment
    STACKDATA DW 0AH DUP<?> ; Defines a stack segment with 10 words
STACK ENDS                  ; Ends the stack segment

CODE SEGMENT                ; Begins the code segment
START:                      ; Entry point of the program
    MOV AX, DATA            ; Moves the value of the data segment to the AX register
    MOV DS, AX              ; Moves the value of AX to the data segment register (DS)
    MOV AX, STACK           ; Moves the value of the stack segment to the AX register
    MOV SS, AX              ; Moves the value of AX to the stack segment register (SS)
    MOV SP, OFFSET LIST     ; Moves the offset of LIST to the stack pointer (SP)
    MOV CL, COUNT           ; Moves the value of COUNT (AH) to the CL register
    MOV BX, OFFSET RESULT + COUNT ; Moves the offset of RESULT + COUNT to the BX register
NEXT:                       ; Label for the NEXT loop
    POP AX                  ; Pops the top word from the stack and stores it in AX
    MOV DX, SP              ; Moves the current stack pointer (SP) to the DX register
    MOV SP, BX              ; Moves the value in BX to the stack pointer (SP)
    PUSH AX                 ; Pushes the word in AX onto the stack
    MOV BX, SP              ; Moves the current stack pointer (SP) to the BX register
    MOV SP, DX              ; Moves the value in DX back to the stack pointer (SP)
    DEC CL                  ; Decrements the value in CL (counter for remaining iterations)
    JNZ NEXT                ; Jumps back to NEXT if CL is not zero
    MOV AH, 4CH             ; Sets the value of AH to indicate program termination
    INT 21H                 ; Generates an interrupt to terminate the program
CODE ENDS                   ; Ends the code segment

END START                   ; End of the program
