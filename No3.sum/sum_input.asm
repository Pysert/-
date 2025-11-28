; sum_input.asm - 用户输入1-100的数字，计算1到该数的和
data segment
    prompt db 'Enter a number (1-100): $'
    result_msg db 0dh, 0ah, 'The sum is: $'
    buffer db 6, ?, 6 dup(0)  ; 输入缓冲区（DOS 0AH格式）
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    ; 显示提示信息
    mov dx, offset prompt
    mov ah, 09h
    int 21h
    
    ; 读取用户输入（DOS 21H中断的0AH功能）
    mov dx, offset buffer
    mov ah, 0ah
    int 21h
    
    ; 将输入的字符串转换为数字
    call string_to_number
    ; 此时 AX = 转换后的数字
    
    ; 如果输入为0，直接显示0并退出
    cmp ax, 0
    je show_zero_result
    
    ; 计算1到n的和
    ; 方法：从1加到n
    mov cx, ax          ; CX = 输入的数字n
    mov ax, 0           ; AX = 累加器，初始化为0
    mov bx, 1           ; BX = 当前要加的数，从1开始
    
sum_loop:
    add ax, bx          ; AX = AX + BX
    inc bx              ; BX = BX + 1
    cmp bx, cx          ; 比较 BX 和 n
    jle sum_loop        ; 如果 BX <= n，继续循环
    
    ; 显示结果信息
    mov dx, offset result_msg
    mov ah, 09h
    int 21h
    
    ; 显示计算结果
    call print_number
    
    jmp program_end
    
show_zero_result:
    ; 如果输入为0，显示0
    mov dx, offset result_msg
    mov ah, 09h
    int 21h
    mov dl, '0'
    mov ah, 02h
    int 21h
    
program_end:
    mov ah, 4ch
    int 21h

; 子程序：将字符串转换为数字
; 输入：buffer 缓冲区（DOS 0AH格式）
;    buffer[0] = 最大长度
;    buffer[1] = 实际输入的字符数
;    buffer[2]开始 = 实际输入的字符（以0dh结尾）
; 输出：AX = 转换后的数字
string_to_number proc
    push bx
    push cx
    push dx
    push si
    
    ; 获取实际输入的字符数
    mov cl, [buffer + 1]       ; CL = 实际输入的字符数
    mov ch, 0                  ; 清除CH，CX = 字符数
    
    ; 检查是否有输入
    cmp cx, 0
    je convert_done_zero
    
    ; 初始化
    mov si, offset buffer + 2  ; SI指向实际输入的字符串
    mov ax, 0                  ; 结果寄存器，初始化为0
    
convert_loop:
    ; 读取一个字符
    mov bl, [si]
    
    ; 检查是否是回车符（0dh）
    cmp bl, 0dh
    je convert_done
    
    ; 检查是否是数字字符
    cmp bl, '0'
    jb convert_done           ; 如果 < '0'，结束
    cmp bl, '9'
    ja convert_done           ; 如果 > '9'，结束
    
    ; 转换为数字：BL = BL - '0'
    sub bl, '0'
    mov bh, 0                 ; 清除BH，BX = 数字值（0-9）
    
    ; 计算：AX = AX * 10 + BX
    push bx                   ; 保存当前数字
    mov bx, 10
    mul bx                    ; DX:AX = AX * 10
    ; 注意：这里结果不会超过16位，所以DX=0
    pop bx                    ; 恢复当前数字
    add ax, bx                ; AX = AX + 当前数字
    
    ; 移动到下一个字符
    inc si
    loop convert_loop         ; CX--，如果CX≠0则继续
    
convert_done:
    jmp convert_exit
    
convert_done_zero:
    mov ax, 0
    
convert_exit:
    pop si
    pop dx
    pop cx
    pop bx
    ret
string_to_number endp

; 子程序：将AX中的数字转换为字符串并显示
; 输入：AX = 要显示的数字
print_number proc
    push bx
    push cx
    push dx
    
    ; 特殊情况：如果数字为0，直接显示'0'
    cmp ax, 0
    jne not_zero
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp print_exit
    
not_zero:
    mov bx, 10                ; 除数
    mov cx, 0                 ; 数字位数计数器
    
    ; 将数字的每一位压入栈
digit_loop:
    mov dx, 0                 ; 清除DX（div使用DX:AX作为被除数）
    div bx                    ; DX:AX / BX，商在AX，余数在DX
    push dx                   ; 保存余数（数字的每一位）
    inc cx                    ; 位数加1
    cmp ax, 0                 ; 如果商为0，结束
    jne digit_loop
    
    ; 从栈中弹出每一位并显示
display_loop:
    pop dx                    ; 弹出数字
    add dl, '0'               ; 转换为ASCII码
    mov ah, 02h               ; DOS功能：显示字符
    int 21h
    loop display_loop
    
print_exit:
    pop dx
    pop cx
    pop bx
    ret
print_number endp

code ends
end start
