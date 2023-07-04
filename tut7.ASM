.model small
.stack 100h

.data
    List   db 80, 81, 78, 65, 23, 45, 89, 90, 10, 99
    Result db ?

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV SI, OFFSET List
    MOV AL, 00H
    MOV CX, 0AH

Back:
    CMP AL, [SI]
    JNC Ahead
    MOV AL, [SI]

Ahead:
    INC SI
    LOOP Back

MOV Result, AL

MOV AH, 4CH
INT 21H

Main endp
End Main
