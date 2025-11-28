; sum_reg.asm - 结果放在寄存器中
code segment
    assume cs:code
start:
    mov ax, 0           ; 累加器，存放结果
    mov cx, 100         ; 循环计数器
    
sum_loop:
    add ax, cx          ; AX = AX + CX
    loop sum_loop       ; CX--, 如果CX≠0则循环
    
    ; 将结果5050转换为字符串并显示
    call print_number   ; 调用数字显示子程序
    
    mov ah, 4ch
    int 21h

; 子程序：将AX中的数字转换为字符串并显示
print_number proc
    mov bx, 10          ; 除数
    mov cx, 0           ; 数字位数计数器
    
convert_loop:
    mov dx, 0
    div bx              ; AX/BX, 商在AX, 余数在DX
    push dx             ; 保存余数（数字字符）
    inc cx
    cmp ax, 0
    jne convert_loop    ; 如果商不为0，继续
    
display_loop:
    pop dx              ; 弹出数字字符
    add dl, '0'         ; 转换为ASCII码
    mov ah, 02h         ; 显示字符
    int 21h
    loop display_loop
    ret
print_number endp

code ends
end start