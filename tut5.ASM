.model small
.stack 100h
.data
    Multiplier  dw 1234H
    Multiplicand dw 3456H
    Product     dw ?

.code
MULT proc
    MOV AX, @data
    MOV DS, AX
    MOV AX, Multiplier
    MUL Multiplicand
    MOV Product, AX
    MOV Product+2, DX
    MOV AH, 4CH
    INT 21H
MULT endp

end MULT
