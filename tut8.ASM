.model small
.stack 100h

.data
    String db "exercise$"
    Ans db ?
    Length equ $-String

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV AL, 00H
    MOV SI, OFFSET String
    MOV CX, Length

Back:
    MOV BH, [SI]
    CMP BH, "e"
    JNZ Label
    INC AL

Label:
    INC SI
    LOOP Back

MOV Ans, AL

MOV AH, 4CH
INT 21H

Main endp
End Main
