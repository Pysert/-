; ascii_jump.asm - 使用条件跳转指令打印小写字母表

data segment
    space db ' $'
    newline db 0dh, 0ah, '$'
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    mov bl, 'a'         ; 当前字母，从'a'开始
    mov bh, 0           ; 列计数器
    mov cl, 0           ; 总字符计数器
    
print_loop:
    ; 显示当前字母
    mov dl, bl
    mov ah, 02h
    int 21h
    
    ; 显示空格
    mov dx, offset space
    mov ah, 09h
    int 21h
    
    inc bl              ; 下一个字母
    inc bh              ; 列计数加1
    inc cl              ; 总计数加1
    
    ; 检查是否需要换行（每13个字符换行）
    cmp bh, 13
    jl no_newline       ; 如果小于13，不换行
    
    ; 换行处理
    mov dx, offset newline
    mov ah, 09h
    int 21h
    mov bh, 0           ; 重置列计数器
    
no_newline:
    ; 检查是否完成所有字母（26个）
    cmp cl, 26
    jl print_loop       ; 如果小于26，继续循环
    
    ; 程序退出
    mov ah, 4ch
    int 21h
code ends
end start