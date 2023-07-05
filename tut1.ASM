.MODEL SMALL
.STACK 100H

.DATA
    num DW 5        ; Number for which factorial is to be calculated
    fact DW 1       ; Variable to store the factorial result

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        MOV BX, num      ; Move the number to BX register
        MOV CX, BX       ; Initialize CX with the number

        MOV AX, 1        ; Initialize AX with 1 (used for multiplication)

    LOOP_START:
        CMP CX, 1        ; Compare CX with 1
        JE LOOP_END      ; Jump to LOOP_END if CX is equal to 1

        MUL CX           ; Multiply the factorial result with CX
        DEC CX           ; Decrement CX by 1
        JMP LOOP_START   ; Jump to LOOP_START

    LOOP_END:
        MOV fact, AX     ; Move the factorial result to the fact variable
        LEA BX,fact
        INT 3
        MOV AH, 4CH      ; Exit program
        INT 21H

    MAIN ENDP
END MAIN
