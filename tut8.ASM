.model small
.stack 100h

.data
    String db "exercise$"
    Ans db ?
    Len equ $-String

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV AL, 00H
    MOV SI, OFFSET String
    MOV CX, Len

Back:
    MOV BH, [SI]
    CMP BH, "e"
    JNZ Lab
    INC AL

Lab:
    INC SI
    LOOP Back

MOV Ans, AL
INT 3
MOV AH, 4CH
INT 21H

Main endp
End Main
