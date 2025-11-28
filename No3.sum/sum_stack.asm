; sum_stack.asm - 结果放在栈中
code segment
    assume cs:code
start:
    mov ax, 0
    mov cx, 100
    
sum_loop:
    add ax, cx
    loop sum_loop
    
    push ax             ; 将结果压入栈中
    
    ; 从栈中取出结果并显示
    pop ax
    call print_number
    
    mov ah, 4ch
    int 21h

print_number proc
    mov bx, 10
    mov cx, 0
    
convert_loop:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop
    
display_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop display_loop
    ret
print_number endp

code ends
end start