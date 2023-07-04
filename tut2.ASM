.MODEL SMALL
.STACK 100H

.DATA
    BUFFER DB 2 DUP(?)

.CODE
MAIN PROC

    MOV BL, 08H        ; Initialize BL register with 08H
    MOV SI, 0E000H     ; Initialize CX register with E000H

Loopp:
    MOV DL, [SI]       ; Move the byte at the address pointed by CX to DL
    MOV DI, 0B001H     ; Load AX with the address of BUFFER
    MOV [DI], DL       ; Move the byte in DL to the address pointed by AX (BUFFER)
    DEC BL             ; Decrement BL by 1
    JNZ Loopp           ; Jump back to Loop if BL is not zero

    HLT                ; Halt the program

MAIN ENDP
END MAIN
