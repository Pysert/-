; test_overflow.asm - 直接测试溢出中断
code segment
    assume cs:code
start:
    ; 显示测试开始信息
    mov dx, offset test_msg
    mov ah, 09h
    int 21h
    
    ; 测试1：加法溢出
    mov dx, offset test1_msg
    mov ah, 09h
    int 21h
    
    mov ax, 32767      ; 最大有符号正数
    add ax, 1          ; 加1，应该溢出
    into               ; 触发溢出中断
    
    ; 测试2：减法溢出
    mov dx, offset test2_msg
    mov ah, 09h
    int 21h
    
    mov ax, -32768     ; 最小有符号负数
    sub ax, 1          ; 减1，应该溢出
    into               ; 触发溢出中断
    
    ; 测试3：乘法溢出
    mov dx, offset test3_msg
    mov ah, 09h
    int 21h
    
    mov ax, 200
    mov bx, 200
    imul bx            ; 40000 > 32767，应该溢出
    into               ; 触发溢出中断
    
    ; 程序退出
    mov ah, 4ch
    int 21h

test_msg db 'Testing Overflow Interrupt...', 0dh, 0ah, '$'
test1_msg db 'Test 1: Addition overflow - ', '$'
test2_msg db 'Test 2: Subtraction overflow - ', '$'
test3_msg db 'Test 3: Multiplication overflow - ', '$'

code ends
end start