.MODEL SMALL
.STACK 100H
.DATA
    STRING1 DB "assemblylanguageprogram$"
    LEN DW $-STRING1-1
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV SI, OFFSET STRING1
    MOV CX, LEN
    ADD SI, CX

BACK:
    MOV DL, [SI-1]
    MOV AH, 02H
    INT 21H
    DEC SI
    LOOP BACK

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
