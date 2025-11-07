_main:
    push    ebp
    mov     ebp, esp
    sub     esp, 16                 ; 为局部变量分配空间
    
    mov     BYTE PTR [ebp-1], 97    ; letter = 'a' (97是'a'的ASCII码)
    mov     DWORD PTR [ebp-8], 0    ; count = 0
    mov     DWORD PTR [ebp-12], 0   ; i = 0
    jmp     L2                      ; 跳转到循环条件检查

L3:
    movsx   eax, BYTE PTR [ebp-1]   ; 将letter符号扩展到eax
    mov     DWORD PTR [esp], eax    ; 参数压栈
    call    _putchar                ; 调用putchar(letter)
    
    mov     eax, OFFSET FLAT:LC0    ; 加载空格字符串地址
    mov     DWORD PTR [esp], eax
    call    _printf                 ; 调用printf(" ")
    
    inc     BYTE PTR [ebp-1]        ; letter++
    inc     DWORD PTR [ebp-8]       ; count++
    
    cmp     DWORD PTR [ebp-8], 13   ; 比较count和13
    jne     L4                      ; 如果不等于13，跳转到L4
    
    mov     DWORD PTR [esp], 10     ; 参数：换行符'\n'
    call    _putchar                ; 调用putchar('\n')
    mov     DWORD PTR [ebp-8], 0    ; count = 0

L4:
    inc     DWORD PTR [ebp-12]      ; i++

L2:
    cmp     DWORD PTR [ebp-12], 25  ; 比较i和25
    jle     L3                      ; 如果i <= 25，继续循环
    
    mov     eax, 0                  ; 返回值0
    leave
    ret

LC0:
    .ascii " \0"                    ; 空格字符串