; salary_calc.asm - 工资计算程序（最终修正版）
data segment
    ; 21年的年份字符串
    years db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
          db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
          db '1993','1994','1995'
    
    ; 21年公司总收入（dword型）
    incomes dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
            dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    
    ; 21年公司雇员人数（word型）
    employees dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
              dw 11542,14430,15257,17800
              
    ; 用于计算的临时变量
    temp_income dd 0
    temp_employee dw 0
data ends

table segment
    db 21 dup('year summ ne ?? ')  ; 每个记录16字节：year(4) summ(4) ne(2) ??(2) 空格(4)
table ends

stack segment
    dw 128 dup(0)
stack ends

code segment
    assume cs:code, ds:data, es:table, ss:stack
start:
    mov ax, data
    mov ds, ax
    mov ax, table
    mov es, ax
    mov ax, stack
    mov ss, ax
    mov sp, 256
    
    ; 初始化指针
    mov si, 0          ; 年份索引（每个年份4字节）
    mov di, 0          ; table段索引
    mov cx, 21         ; 循环21次
    
process_loop:
    push cx            ; 保存循环计数器
    push si
    
    ; 1. 复制年份（4字节）
    mov ax, word ptr years[si]       ; 年份前2字节
    mov es:[di], ax
    mov ax, word ptr years[si+2]     ; 年份后2字节  
    mov es:[di+2], ax
    
    ; 2. 复制总收入（4字节）
    ; 计算收入数组的偏移量：当前记录索引 * 4
    mov ax, si
    mov bx, 4
    xor dx, dx
    div bx             ; AX = si / 4（当前记录索引）
    mov bx, 4
    mul bx             ; AX = 记录索引 * 4
    mov bx, ax         ; BX = 收入数组偏移量
    
    mov ax, word ptr incomes[bx]     ; 收入低16位
    mov es:[di+4], ax
    mov ax, word ptr incomes[bx+2]   ; 收入高16位
    mov es:[di+6], ax
    
    ; 保存收入到临时变量用于计算
    mov word ptr temp_income, ax     ; 高16位
    mov ax, word ptr incomes[bx]     ; 低16位
    mov word ptr temp_income+2, ax
    
    ; 3. 复制雇员人数（2字节）
    ; 计算雇员数组的偏移量：当前记录索引 * 2
    mov ax, si
    mov bx, 4
    xor dx, dx
    div bx             ; AX = si / 4（当前记录索引）
    mov bx, 2
    mul bx             ; AX = 记录索引 * 2
    mov bx, ax         ; BX = 雇员数组偏移量
    
    mov ax, word ptr employees[bx]
    mov es:[di+8], ax
    mov temp_employee, ax           ; 保存用于计算
    
    ; 4. 计算人均收入（总收入/雇员人数）
    mov dx, word ptr temp_income    ; 收入高16位
    mov ax, word ptr temp_income+2  ; 收入低16位
    div temp_employee               ; DX:AX / 雇员人数
    
    ; 5. 存储人均收入（2字节）
    mov es:[di+10], ax
    
    ; 移动到下一个记录
    add di, 16         ; 每个记录16字节
    pop si
    add si, 4          ; 每个年份4字节
    
    pop cx             ; 恢复循环计数器
    loop process_loop
    
    ; 打印表格
    call print_table
    
    ; 程序退出
    mov ah, 4ch
    int 21h

; 过程：打印表格
print_table proc
    mov cx, 21         ; 21条记录
    mov si, 0          ; table段索引
    
print_loop:
    push cx
    
    ; 打印年份（4字节）
    mov cx, 4
    mov bx, si
year_loop:
    mov dl, es:[bx]
    mov ah, 02h
    int 21h
    inc bx
    loop year_loop
    
    ; 打印制表符
    mov dl, 09h        ; TAB字符
    mov ah, 02h
    int 21h
    
    ; 打印总收入（4字节数字）
    mov ax, word ptr es:[si+4]  ; 收入低16位
    mov dx, word ptr es:[si+6]  ; 收入高16位
    call print_number
    
    ; 打印制表符
    mov dl, 09h
    mov ah, 02h
    int 21h
    
    ; 打印雇员人数（2字节数字）
    mov ax, word ptr es:[si+8]
    mov dx, 0
    call print_number
    
    ; 打印制表符
    mov dl, 09h
    mov ah, 02h
    int 21h
    
    ; 打印人均收入（2字节数字）
    mov ax, word ptr es:[si+10]
    mov dx, 0
    call print_number
    
    ; 换行
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    add si, 16         ; 下一个记录
    pop cx
    loop print_loop
    
    ret
print_table endp

; 过程：打印数字（DX:AX中的32位数）
print_number proc
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov bx, 10         ; 除数
    mov cx, 0          ; 数字位数
    
    ; 检查是否为0
    cmp dx, 0
    jnz convert_loop
    cmp ax, 0
    jnz convert_loop
    
    ; 如果是0，直接显示0
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp print_done
    
convert_loop:
    ; 32位除法：DX:AX / BX
    push ax
    mov ax, dx
    xor dx, dx
    div bx             ; AX = 高16位商, DX = 余数
    mov si, ax         ; 保存高16位商
    pop ax             ; 恢复低16位
    div bx             ; AX = 低16位商, DX = 余数
    push dx            ; 保存余数（数字）
    mov dx, si         ; 高16位商到DX
    inc cx             ; 数字位数加1
    
    ; 检查商是否为0
    cmp dx, 0
    jnz convert_loop
    cmp ax, 0
    jnz convert_loop
    
display_loop:
    pop dx
    add dl, '0'        ; 数字转ASCII
    mov ah, 02h
    int 21h
    loop display_loop
    
print_done:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

code ends
end start