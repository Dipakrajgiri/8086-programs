.model small
.stack 100h

.data
number dw 5

.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, number

    mov ax, 1

loop_start:
    mul bx
    dec bx
    cmp bx, 1
    jg loop_start

    mov di, 0f00h
    mov [di], ax

    mov ah, 4Ch
    int 21h

main endp

end main
