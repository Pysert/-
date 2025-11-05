; hello.asm - 第一个汇编程序 Hello World
; 编译方法: masm hello.asm; link hello.obj

data segment
    msg db 'Hello, World!', 0dh, 0ah, '$'  ; 字符串以$结束，0dh,0ah是回车换行
data ends

code segment
    assume cs:code, ds:data
start:
    ; 设置数据段寄存器
    mov ax, data
    mov ds, ax
    
    ; 显示字符串
    mov dx, offset msg    ; DX指向字符串地址
    mov ah, 09h           ; DOS功能调用09H - 显示字符串
    int 21h               ; 调用DOS中断
    
    ; 程序退出
    mov ah, 4ch           ; DOS功能调用4CH - 程序退出
    int 21h               ; 调用DOS中断
code ends
end start