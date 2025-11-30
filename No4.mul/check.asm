data segment
    table db 7,2,3,4,5,6,7,8,9             ; 9*9表数据（包含错误）
          db 2,4,7,8,10,12,14,16,18
          db 3,6,9,12,15,18,21,24,27
          db 4,8,12,16,7,24,28,32,36
          db 5,10,15,20,25,30,35,40,45
          db 6,12,18,24,30,7,42,48,54
          db 7,14,21,28,35,42,49,56,63
          db 8,16,24,32,40,48,56,7,72
          db 9,18,27,36,45,54,63,72,81
    
    error_msg db ' error', 0dh, 0ah, '$'
    accomplish_msg db 'acconplish!', 0dh, 0ah, '$'
    space db ' $'
    newline db 0dh, 0ah, '$'
    result db 4 dup('$')  ; 用于存储数字字符串
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    ; 外层循环：行号 1-9
    mov cx, 1           ; CX = 行号（1-9）
    
row_loop:
    ; 内层循环：列号 1-9
    mov bx, 1           ; BX = 列号（1-9）
    
col_loop:
    ; 保存寄存器
    push bx
    push cx
    
    ; 调用过程检查当前位置的数据
    call check_cell
    
    ; 恢复寄存器
    pop cx
    pop bx
    
    inc bx              ; 列号加1
    cmp bx, 10
    jl col_loop         ; 如果列号 < 10，继续内层循环
    
    inc cx              ; 行号加1
    cmp cx, 10
    jl row_loop         ; 如果行号 < 10，继续外层循环
    
    ; 显示完成信息
    mov dx, offset accomplish_msg
    mov ah, 09h
    int 21h
    
    ; 程序退出
    mov ah, 4ch
    int 21h

; 过程：检查表格中指定位置的数据是否正确
; 输入：CX = 行号, BX = 列号
check_cell proc
    ; 保存寄存器
    push ax
    push bx
    push cx
    push dx
    push si
    
    ; 计算表格中的偏移地址 = (行号-1)*9 + (列号-1)
    mov ax, cx
    dec ax              ; 行号-1
    mov dl, 9
    mul dl              ; AX = (行号-1) * 9
    mov dx, bx
    dec dx              ; 列号-1
    add ax, dx          ; AX = 最终偏移量
    
    ; 获取表格中的数据
    mov si, offset table
    add si, ax          ; SI指向表格中的对应位置
    mov al, [si]        ; AL = 表格中的数据
    
    ; 计算正确的乘积 = 行号 * 列号
    mov dl, cl          ; DL = 行号
    mov ah, 0
    mov al, dl          ; AL = 行号
    mul bl              ; AX = 行号 * 列号
    
    ; 比较表格数据与正确乘积
    mov dl, [si]        ; DL = 表格中的数据
    cmp al, dl          ; 比较正确值(AL)和表格值(DL)
    je correct_value    ; 如果相等，跳过错误显示
    
    ; 显示错误位置信息
    call display_position
    
correct_value:
    ; 恢复寄存器
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
check_cell endp

; 过程：显示错误位置信息
; 输入：CX = 行号, BX = 列号
display_position proc
    ; 保存寄存器
    push ax
    push bx
    push cx
    push dx
    
    ; 显示行号
    mov ax, cx
    call number_to_string
    mov dx, offset space
    mov ah, 09h
    int 21h
    
    ; 显示列号
    mov ax, bx
    call number_to_string
    
    ; 显示错误信息
    mov dx, offset error_msg
    mov ah, 09h
    int 21h
    
    ; 恢复寄存器
    pop dx
    pop cx
    pop bx
    pop ax
    ret
display_position endp

; 过程：将数字转换为字符串并显示
; 输入：AX = 要显示的数字
number_to_string proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    mov si, offset result
    mov bx, 10
    mov cx, 0
    
    ; 处理AX=0的特殊情况
    cmp ax, 0
    jnz convert_loop
    mov byte ptr [si], '0'
    mov byte ptr [si+1], '$'
    jmp display_result
    
convert_loop:
    xor dx, dx          ; DX清零
    div bx              ; AX / 10, 商在AX, 余数在DX
    add dl, '0'         ; 数字转ASCII
    push dx             ; 保存数字字符
    inc cx              ; 数字位数加1
    cmp ax, 0
    jnz convert_loop    ; 如果商不为0，继续
    
    ; 将数字字符存入缓冲区
    mov di, si
store_loop:
    pop dx
    mov [di], dl
    inc di
    loop store_loop
    mov byte ptr [di], '$'  ; 字符串结束符
    
display_result:
    ; 显示结果字符串
    mov dx, si
    mov ah, 09h
    int 21h
    
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
number_to_string endp

code ends
end start