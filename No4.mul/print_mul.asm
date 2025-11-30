data segment
    title_msg db 'The 9mul9 table:', 0dh, 0ah, '$'
    space db ' $'
    newline db 0dh, 0ah, '$'
    result db 4 dup('$')  ; 用于存储数字字符串
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    ; 显示标题
    mov dx, offset title_msg
    mov ah, 09h
    int 21h
    
    ; 外层循环：从9到1
    mov cx, 9           ; CX = 外层循环计数器
    
outer_loop:
    push cx             ; 保存外层循环计数器
    
    ; 内层循环：从1到当前外层值
    mov bx, 1           ; BX = 内层循环计数器
    mov di, 0           ; DI用于标记是否是第一个计算式
    
inner_loop:
    ; 如果不是第一个计算式，显示空格
    cmp di, 0
    je no_space
    mov dx, offset space
    mov ah, 09h
    int 21h
    
no_space:
    inc di              ; 标记已显示过计算式
    
    ; 保存寄存器
    push bx
    push cx
    push di
    
    ; 调用过程显示一个乘法项
    call display_multiplication
    
    ; 恢复寄存器
    pop di
    pop cx
    pop bx
    
    inc bx              ; 内层循环计数器加1
    cmp bx, cx
    jle inner_loop      ; 如果BX <= CX，继续内层循环
    
    ; 显示换行
    mov dx, offset newline
    mov ah, 09h
    int 21h
    
    pop cx              ; 恢复外层循环计数器
    loop outer_loop     ; CX--, 如果CX≠0则继续外层循环
    
    ; 程序退出
    mov ah, 4ch
    int 21h

; 过程：显示一个乘法项 (例如 "9*1=9")
; 输入：CX = 被乘数, BX = 乘数
display_multiplication proc
    ; 保存寄存器
    push ax
    push bx
    push cx
    push dx
    
    ; 显示被乘数
    mov dl, cl
    add dl, '0'         ; 数字转ASCII
    mov ah, 02h
    int 21h
    
    ; 显示乘号
    mov dl, '*'
    mov ah, 02h
    int 21h
    
    ; 显示乘数
    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ; 显示等号
    mov dl, '='
    mov ah, 02h
    int 21h
    
    ; 计算乘积
    mov al, cl          ; AL = 被乘数
    mul bl              ; AX = AL * BL
    
    ; 将乘积转换为字符串并显示
    call number_to_string
    
    ; 恢复寄存器
    pop dx
    pop cx
    pop bx
    pop ax
    ret
display_multiplication endp

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