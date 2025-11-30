; overflow_isr.asm - 重写4号溢出中断服务程序
code segment
    assume cs:code
    org 100h          ; COM程序起始地址

start:
    ; 设置新的4号中断向量
    mov ax, 0
    mov es, ax        ; ES指向中断向量表段(0000h)
    mov di, 4 * 4     ; 4号中断向量在0000:0010h (4×4=16=10h)
    
    ; 保存新的中断服务程序地址
    mov ax, offset overflow_handler
    mov es:[di], ax   ; 偏移地址
    mov ax, cs
    mov es:[di+2], ax ; 段地址
    
    ; 驻留程序并退出
    mov dx, offset start + 100h  ; 驻留大小
    mov ax, 3100h     ; DOS功能31h - 驻留退出
    int 21h

; 新的溢出中断服务程序
overflow_handler proc far
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push ds
    push es
    
    ; 设置数据段
    mov ax, cs
    mov ds, ax
    
    ; 显示溢出错误信息
    mov dx, offset overflow_msg
    mov ah, 09h
    int 21h
    
    ; 显示当前指令地址（用于调试）
    push bp
    mov bp, sp
    mov ax, [bp+20]   ; 获取返回地址的偏移
    call print_hex
    mov dl, ':'
    mov ah, 02h
    int 21h
    mov ax, [bp+22]   ; 获取返回地址的段值
    call print_hex
    pop bp
    
    ; 换行
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    ; 恢复寄存器
    pop es
    pop ds
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    
    iret              ; 中断返回

overflow_handler endp

; 辅助过程：以十六进制显示AX中的值
print_hex proc
    push ax
    push bx
    push cx
    push dx
    
    mov cx, 4         ; 4位十六进制数
hex_loop:
    rol ax, 4         ; 循环左移4位
    mov bx, ax
    and bx, 0fh       ; 取低4位
    mov dl, [hex_digits + bx]
    mov ah, 02h
    int 21h
    loop hex_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret

hex_digits db '0123456789ABCDEF'
overflow_msg db 'Overflow Error at address: $'

code ends
end start