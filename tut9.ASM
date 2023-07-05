.model small
.stack 100h

.data
    String db "The quick brown fox jumped over lazy sleeping dog$"
    Len equ $-String
    Vowel db ?

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV SI, OFFSET String ; initialize p
    MOV CX, Len ; length in CX register
    MOV BL, 00 ; vowel count = 0

Back:
    MOV AL, [SI]
    CMP AL, "a"
    JB VOW
    CMP AL, "z" ; Convert the character to uppercase
    JA VOW
    SUB AL, 20H

VOW:
    CMP AL, "A"
    JNZ a3
    INC BL
    JMP a2

a3:
    CMP AL, "E"
    JNZ a4
    INC BL
    JMP a2

a4:
    CMP AL, "I"
    JNZ a5
    INC BL
    JMP a2

a5:
    CMP AL, "O"
    JNZ a6
    INC BL
    JMP a2

a6:
    CMP AL, "U"
    JNZ a2
    INC BL

a2:
    INC SI
    LOOP Back

MOV Vowel, BL
INT 3
MOV AH, 4CH
INT 21H

Main endp
End Main
