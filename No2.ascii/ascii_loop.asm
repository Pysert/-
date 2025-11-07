; ascii_loop.asm - 使用LOOP指令打印小写字母表，每行13个字符

data segment
    space db ' $'       ; 空格字符，用于分隔字母
    newline db 0dh, 0ah, '$'  ; 回车换行
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    mov bl, 'a'         ; BL寄存器存放当前字母，从'a'开始
    mov cx, 2           ; 外层循环：2行（26个字母，每行13个）
    
outer_loop:
    push cx             ; 保存外层循环计数器
    mov cx, 13          ; 内层循环：每行13个字母
    
inner_loop:
    ; 显示当前字母
    mov dl, bl          ; 将字母放入DL寄存器
    mov ah, 02h         ; DOS功能调用02H - 显示字符
    int 21h
    
    ; 显示空格
    mov dx, offset space
    mov ah, 09h         ; DOS功能调用09H - 显示字符串
    int 21h
    
    inc bl              ; 指向下一个字母
    loop inner_loop     ; 内层循环
    
    ; 显示换行
    mov dx, offset newline
    mov ah, 09h
    int 21h
    
    pop cx              ; 恢复外层循环计数器
    loop outer_loop     ; 外层循环
    
    ; 程序退出
    mov ah, 4ch
    int 21h
code ends
end start