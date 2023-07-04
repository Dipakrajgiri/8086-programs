.model small
.stack 100h

.data
    List  db 12, 34, 56, 78, 98, 01, 13, 78, 18, 36
    Total dw ?

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV AX, 0000H
    MOV CX, 0AH ; counter
    MOV BL, 00H ; to count carry
    MOV SI, OFFSET List

Back:
    ADD AL, [SI]
    JC Label
Back1:
    INC SI
    LOOP Back

MOV Total, AX
MOV Total+2, BL

MOV AH, 4CH
INT 21H

Label:
INC BL
JMP Back1

Main endp
End Main
