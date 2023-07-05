.MODEL SMALL
.STACK 100H

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        MOV BL, 8               ; Number of bytes to transfer

        MOV SI, 0E000H   ; Start address of the source block
        MOV DI, 0B001H   ; Start address of the destination block

    LOOP_START:
        MOV AL, [SI]            ; Move the byte from the source to AL
        MOV [DI], AL            ; Move the byte from AL to the destination
        INC SI                  ; Increment the source address
        INC DI                  ; Increment the destination address
        DEC BL                  ; Decrement the count
        JNZ LOOP_START          ; Jump to LOOP_START if count is not zero
        INT 3
        MOV AH, 4CH             ; Exit program
        INT 21H

    MAIN ENDP

END MAIN
