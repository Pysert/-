; sum_data.asm - 结果放在数据段中
data segment
    result dw 0         ; 结果存放在数据段
    buffer db 10 dup('$') ; 缓冲区用于数字转换
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    mov ax, 0
    mov cx, 100
    
sum_loop:
    add ax, cx
    loop sum_loop
    
    mov result, ax      ; 将结果保存到数据段
    
    ; 显示结果
    mov ax, result
    call print_number
    
    mov ah, 4ch
    int 21h

print_number proc
    push si                   ; 保存SI寄存器
    mov bx, 10
    mov cx, 0
    mov si, offset buffer     ; SI指向缓冲区起始位置
    
convert_loop:
    mov dx, 0
    div bx
    add dl, '0'
    mov [si], dl              ; 存储到缓冲区（从前往后存储，数字是倒序的）
    inc si
    inc cx
    cmp ax, 0
    jne convert_loop
    
    ; 反向显示（因为数字是倒序存储的，需要从后往前显示）
    dec si                    ; SI现在指向最后一个字符之后，需要回退
display_loop:
    dec si                    ; 回退到上一个字符
    mov dl, [si]
    mov ah, 02h
    int 21h
    loop display_loop
    pop si                    ; 恢复SI寄存器
    ret
print_number endp

code ends
end start