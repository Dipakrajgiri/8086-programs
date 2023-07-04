.MODEL SMALL
.STACK 100h
.DATA
    String1 DB "Computer Engineering",'$'

.CODE
Main PROC
    MOV AX, @DATA     ; Load the data segment address into AX
    MOV DS, AX        ; Move the data segment address into DS

    MOV AH, 09h       ; Set AH to 09h for displaying string
    MOV DX, OFFSET String1  ; Load the offset of String1 into DX
    INT 21h           ; Call interrupt 21h to display the string

    MOV AH, 4Ch       ; Set AH to 4Ch for program termination
    INT 21h           ; Call interrupt 21h to terminate the program

Main ENDP
END Main
