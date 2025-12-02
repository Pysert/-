;2354284胡永杰
data segment
    ;--------------------------------开始界面------------------------------------------------------
    menu00	db           "============================================================$"
    menu01	db 0ah, 0dh, "                                                            $"
    menu02	db 0ah, 0dh, "                                                            $"
    menu03	db 0ah, 0dh, "     _____ _____ _____ _____ _____ _____ _____              $"
    menu04	db 0ah, 0dh, "    |_   _|_   _|_   _|_   _|_   _|_   _|_   _|             $"
    menu05	db 0ah, 0dh, "      | |   | |   | |   | |   | |   | |   | |               $"
    menu06	db 0ah, 0dh, "      |_|   |_|   |_|   |_|   |_|   |_|   |_|               $"
    menu07	db 0ah, 0dh, "                                                            $"
    menu08	db 0ah, 0dh, "                                                            $"
    menu09	db 0ah, 0dh, "                    Classic Tetris Game                     $"
    menu10	db 0ah, 0dh, "                                                            $"
    menu11	db 0ah, 0dh, "                                                            $"
    menu12	db 0ah, 0dh, "                      [1] Normal Mode                       $"
    menu13	db 0ah, 0dh, "                                                            $"
    menu14	db 0ah, 0dh, "                      [2] Difficulty Mode                   $"
    menu15	db 0ah, 0dh, "                                                            $"
    menu16	db 0ah, 0dh, "                      [3] Exit                              $"
    menu17	db 0ah, 0dh, "                                                            $"
    menu18	db 0ah, 0dh, "                  Best Score (Difficulty):                  $"
    menu19   db 0ah, 0dh,"============================================================$"

    ;------------------------------游戏界面-----------------------------------------------------------
    figure00 db           "+==========================================================+$"
    figure01 db 0ah, 0dh, "|                                      |                   |$"
    figure02 db 0ah, 0dh, "|                                      |                   |$"
    figure03 db 0ah, 0dh, "|                                      |                   |$"
    figure04 db 0ah, 0dh, "|                                      |                   |$"
    figure05 db 0ah, 0dh, "|                                      |                   |$"
    figure06 db 0ah, 0dh, "|                                      +-------------------+$"
    figure07 db 0ah, 0dh, "|                                      |  level            |$"
    figure08 db 0ah, 0dh, "|                                      |                   |$"
    figure09 db 0ah, 0dh, "|                                      |  Time             |$"
    figure10 db 0ah, 0dh, "|                                      |                   |$"
    figure11 db 0ah, 0dh, "|                                      |  Score            |$"
    figure12 db 0ah, 0dh, "|                                      +-------------------+$"
    figure13 db 0ah, 0dh, "|                                      | operation:        |$"
    figure14 db 0ah, 0dh, "|                                      |   Left   - >      |$"
    figure15 db 0ah, 0dh, "|                                      |   Right  - <      |$"
    figure16 db 0ah, 0dh, "|                                      |   Fall   - v      |$"
    figure17 db 0ah, 0dh, "|                                      |   Rotate - ^      |$"
    figure18 db 0ah, 0dh, "|                                      | system:           |$"
    figure19 db 0ah, 0dh, "|                                      |   Start - Enter   |$"
    figure20 db 0ah, 0dh, "|                                      |   End   - Q key   |$"
    figure21 db 0ah, 0dh, "+==========================================================+$"

;-----------------------------------------------------------------------------------------------

	g_over01 db           "                                                            $"
	g_over02 db 0ah, 0dh, "                                                            $"
	g_over03 db 0ah, 0dh, "                                                            $"
    g_over04 db 0ah, 0dh, "                                                            $"
    g_over05 db 0ah, 0dh, "                                                            $"
    g_over06 db 0ah, 0dh, "                                                            $"
    g_over07 db 0ah, 0dh, "                                                            $"
    g_over08 db 0ah, 0dh, "                                                            $"
    g_over09 db 0ah, 0dh, "                                                            $"
    g_over10 db 0ah, 0dh, "                                                            $"
    g_over11 db 0ah, 0dh, "                                                            $"
    g_over12 db 0ah, 0dh, "                                                            $"
    g_over13 db 0ah, 0dh, "                                                            $"
    g_over14 db 0ah, 0dh, "                                                            $"
    g_over15 db 0ah, 0dh, "                                                            $"
    g_over16 db 0ah, 0dh, "                                                            $"
    g_over17 db 0ah, 0dh, "                                                            $"
    g_over18 db 0ah, 0dh, "                                                            $"
	g_over19 db 0ah, 0dh, "                                                            $"
	g_over20 db 0ah, 0dh, "                                                            $"
	g_over21 db 0ah, 0dh, "                                                            $"

;-------------------------------------------------------------------------------------------

    now_block       db 1,40;当前木块位置
    ;start_block     db 1,40;

    square_block    db 4,0,0,0,1,1,0,1,1,0;正方形
    last_choice     dw 0          ; 保存上一个方块定义的地址（16位）
    line_block      db 4,0,0,0,1,0,2,0,3,1;横条
    line_block2     db 4,0,1,1,1,2,1,3,1,2;竖条

    L_block         db 4,0,0,1,0,1,1,1,2,3;L形
    L_block2        db 4,0,2,1,0,1,1,1,2,4;

    T_block         db 4,0,1,1,0,1,1,2,1,5;T形
    T_block2        db 4,0,1,1,2,1,1,2,1,6

    Z_block         db 4,0,1,0,2,1,0,1,1,7;Z形第一种：011/110
    Z_block2        db 4,0,1,1,0,1,1,2,0,8;Z形第二种：01/11/10



    move_index      db 0,0
    choice_block    dw 0          ; 当前木块定义的地址（16位）
    what_block      db 0

    approve         db 0;当前位置
    first_move      db 0

    now_line        db 0

    who_block       db 0
    block_colar     db 0
    score           dw 0          ; 改为字类型，支持0-65535
    small_block		db 0;右上角木块
    game_start_time dw 0,0        ; 游戏开始时间（DX:CX格式）
    
    ; 难度系统变量
    difficulty_mode db 0          ; 0=普通模式, 1=难度模式
    level           db 0          ; 当前难度级别
    last_level_time dw 0          ; 上次升级的时间（秒）
    best_score_difficulty dw 0    ; 难度模式最好成绩

    msg_press_key   db 'Press any key to exit...$'
data ends

;-------------------------------------------------------------------------------------------
;定义栈信息
stack segment
db 800 dup(?)   ;stack 有200个内存单元
stack ends
;-------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------
;定义代码段，主要函数调用，函数的入口
code segment


$left   equ 75
$right  equ 77
$quit   equ 113
MOVE_TICKS equ 150        ; 每次下落间短轮询次数（增大可减慢速度）

assume cs:code,ds:data,ss:stack

main proc far
start:
    mov ax, data
    mov ds, ax
    mov es, ax


    call block_start ;调用第一个函数

exitq:
    ; 如果是难度模式，检查并更新最好成绩（统一调用update_best_score）
    call update_best_score
    call game_over
    ; 游戏结束后，返回开始界面
    jmp block_start

exit_program:
    ; 真正退出程序（用户选择退出时）
    mov ax, 4c00h
    int 21h
main endp
;--------------------------------------------------------------------------------------------------------------------------------------
block_start proc near
    mov ax, data
    mov ds, ax
    call clear_vga      ;清屏
    call display_menu   ;显示主菜单
    call show_best_score ;显示最好成绩
	call init_game      ;显示光标的位置

    call chose_mode     ;选择模式

	call display_figure ;显示游戏开始界面
    call cursor_init    ;设置光标位置
    call start_game     ;开始游戏

    mov ax, 4c00h
    int 21h

block_start endp
;------------------------------------------------------------------------------------------


;------------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------------
;清屏操作
clear_vga proc near
    push ds
    push ax
    push es
    mov ax, 0b800h
    mov es, ax
    mov bx, 0
    mov cx, 2000
blank:
    mov byte ptr es:[bx], ' '
    mov byte ptr es:[bx+1], 07h
    add bx, 2
   loop blank
    pop es
    pop ax
    pop ds

    ret
clear_vga endp
;------------------------------------------------------------------------------------------



;显示主菜单的程序
display_menu proc near
    mov ax, data
    mov ds, ax
    mov cx, 20          ; 更新为20行（menu00到menu19）
    mov ax, 0b81fh
    mov es, ax
    mov bx, offset menu00
row:
    push cx
    mov cx, 60
    mov si, 0h
coll:
    mov al, [bx]
    mov es:[si], al
    cmp al, 3Dh         ; 等号 '='
    je color11
    cmp al, '['
    je color12
    cmp al, ']'
    je color12
    jmp color13
color11:
    mov dl, 00001110b   ; 亮黄色边框
    jmp _color
color12:
    mov dl, 00001101b   ; 亮紫色选项标记
    jmp _color
color13:
    mov dl, 00001010b   ; 亮绿色文字
    jmp _color
color14:
    mov dl, 04h
_color:
    mov ah, dl
    mov es:[si+1], ah
    inc bx
    add si, 2
    loop coll
    pop cx

    mov ax, es
    add ax, 0ah
    mov es, ax          ; es+0a :跳下一行
    add bx, 3
    loop row

    ret
display_menu endp

;------------------------------------------------------------------------------------------
;显示难度模式最好成绩
show_best_score proc near
    push ax
    push bx
    push cx
    push dx
    push si
    push es
    
    ; 使用与菜单相同的显示方式：段地址方式
    ; menu18是第18行，ES = 0b81fh + 18*0ah
    mov ax, 0b81fh
    mov cx, 18
calc_menu18_seg:
    cmp cx, 0
    je menu18_seg_done
    add ax, 0ah
    dec cx
    jmp calc_menu18_seg
menu18_seg_done:
    mov es, ax
    
    ; "Best Score (Difficulty):" 文本位置计算
    ; 文本是："                  Best Score (Difficulty):                  $"
    ; 前面有18个空格，"Best Score (Difficulty):"是30个字符
    ; 所以数字应该从第48列开始（18+30=48）
    ; 每列2字节，所以si = 48 * 2 = 96
    mov si, 48 * 2
    
    ; 先清空旧的显示区域（最多显示6位数字，支持到999999）
    push si
    mov cx, 6
clear_old_best:
	mov byte ptr es:[si], ' '
	mov byte ptr es:[si+1], 00001010b
	add si, 2
	loop clear_old_best
	pop si
    
    ; 将最好成绩转换为字符串并显示
    mov ax, best_score_difficulty
    mov bx, 10
    mov cx, 0
    
    ; 如果最好成绩为0，显示"0"
    cmp ax, 0
    jne convert_best_loop
    
    ; 显示"0"
    mov byte ptr es:[si], '0'
    mov byte ptr es:[si+1], 00001010b  ; 亮绿色
    jmp best_score_done
    
    ; 先计算位数并压栈
convert_best_loop:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    cmp ax, 0
    jne convert_best_loop
    
    ; 显示所有位数（不限制位数，支持大数字）
display_best_loop:
    cmp cx, 0
    je best_score_done
    pop ax
    mov byte ptr es:[si], al
    mov byte ptr es:[si+1], 00001010b  ; 亮绿色
    add si, 2
    dec cx
    jmp display_best_loop
    
best_score_done:
    pop es
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

show_best_score endp

;------------------------------------------------------------------------------------------
;更新难度模式最好成绩
update_best_score proc near
    push ax
    
    ; 如果是难度模式，检查并更新最好成绩
    cmp difficulty_mode, 1
    jne update_done
    mov ax, score
    cmp ax, best_score_difficulty
    jbe update_done
    mov best_score_difficulty, ax  ; 更新最好成绩
    
update_done:
    pop ax
    ret

update_best_score endp

;-----------------------------------------------------------------------------------------------
;处理光标和输入任意键的问题
init_game proc near
    push es
    push ax
    push dx
    push bx
    mov ax, data
    mov ds, ax
    mov ah, 02h
    mov bh, 0
    mov dh, 15
    mov dl, 55
    int 10h

;'mov ah, 0
;    int 16h

    pop bx
    pop dx
    pop ax
    pop es

    ret
init_game endp
;-------------------------------------------------------------------------------------------

;-------------------------------------------------------------------------------------------
;显示游戏开始的界面
display_figure proc near
    push ax
    push cx
    push si
    push es
    push di
    mov ax, data
    mov ds, ax
    call clear_vga
    mov cx, 22          ; 22行
    mov ax, 0b81fh
    mov es, ax
    mov bx, offset figure00
row1:
    push cx
    mov cx, 60
    mov si, 0h
coll1:
    mov al, [bx]
    mov es:[si], al
    cmp al, '+'         ; 边框角
    je color21
    cmp al, '-'         ; 横线
    je color21
    cmp al, '|'         ; 竖线
    je color21
    cmp al, 40h
    je color22
    jmp color23
color21:
    mov dl, 00001110b   ; 亮黄色边框
    jmp _color1
color22:
    mov dl, 02h
    jmp _color1
color23:
    mov dl, 00001101b   ; 亮紫色文字
    jmp _color1
color24:
    mov dl, 00001101b
_color1:
    mov ah, dl
    mov es:[si+1], ah
    inc bx
    add si, 2
    loop coll1
    pop cx

    mov ax, es
    add ax, 0ah
    mov es, ax
    add bx, 3
loop row1

    pop di
    pop es
    pop si
    pop cx
    pop ax
    ret
display_figure endp
;-----------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------
;画出随机的方块
rand_block proc near

    mov ax, data
    mov ds, ax
    mov now_block[0],1
    mov now_block[1],44  ;初始位置

    xor ax,ax

    mov ax,0b81fh
    add ax,0ah;
    add ax,0ah
    add ax,0ah
    mov es,ax
    mov cx,36
    mov si,4
tops:
    mov bl,es:[si]
    cmp bl,' '
    je outs
    ; call game_over
	jmp exitq
outs:
    add si,2
    loop tops

    xor si,si
    xor ax,ax
    xor bx,bx

get_rand:

    mov al,0
    out 70h,al
    in  al,71h

    mov ah,al
    mov cl,4
    shr ah,cl
    and al,00001111b
    add ah,30h
    add al,30h
    mov bx,0b800h
    mov es,bx

    ;mov byte ptr es:[160*12+40*2],ah
    ;mov byte ptr es:[160*12+40*2+2],al

    and al,00000111b
    mov ah,0
    mov small_block[0],al
	;call remove_small
	;call show_small
    ;xor ax,ax;test line !!!
    ;mov ax,1

    cmp ax,0  ;比较随机值得出我们需要画的方块
    je  get_seq
    cmp ax,1  ;
    je  get_line;
    cmp ax,2  ;
    je  get_L;
    cmp ax,3
    je  get_L;
    cmp ax,4
    je  get_T
    cmp ax,5
    je  get_T
    cmp ax,6
    je  get_Z
    cmp ax,7
    je  get_seq


get_seq:

    ;mov ax,0b800h
    ;mov es,ax
    ;mov si,0
    ;mov ah,'#'
    ;mov es:[si],ah

    mov ax,offset square_block ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    xor si,si
    call draw_block
    jmp over

get_line:

    ;mov ax,0b800h
    ;mov es,ax
    ;mov si,0
    ;mov ah,'@'
    ;mov es:[si],ah

    mov ax,offset line_block ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    xor si,si
    call draw_block
    jmp over

get_L:

    ;mov ax,0b800h
    ;mov es,ax
    ;mov si,0
    ;mov ah,'!'
    ;mov es:[si],ah
    mov small_block[0],2
    mov ax,offset L_block ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    xor si,si
    call draw_block
    jmp over

get_T:

    ;mov ax,0b800h
    ;mov es,ax
    ;mov si,0
    ;mov ah,'%'
    ;mov es:[si],ah

    mov ax,offset T_block ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    xor si,si
    call draw_block
    jmp over

get_Z:

    ;mov ax,0b800h
    ;mov es,ax
    ;mov si,0
    ;mov ah,'%'
    ;mov es:[si],ah

    mov ax,offset Z_block ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    xor si,si
    call draw_block
    jmp over

over:


    ret

rand_block endp

;----------------------------------------------------------------------------------------

draw_block proc near ;我们将画图函数单独抽象出来


    mov ax,0b81fh  ;设置初始位置，游戏边框顶端

    mov es,ax

    xor ax,ax
    mov ax,data    ;设置数据段
    mov ds,ax


    xor cx,cx
    xor di,di
    ;mov di,offset now_block    ;设置应当开始画的位置，这里只获取行的位置
    mov cl,now_block[0]
    xor bx,bx
    mov bl,now_block[1]
    mov ax,es

add_row:
     add ax,0ah
     loop add_row

     mov es,ax

printf:
     xor cx,cx
     xor ax,ax
     xor di,di
     ;mov di,0
     mov si,offset choice_block
     mov di,ds:[si]
     mov cx,ds:[di]

     ;add di,9
	 ;mov who_block[0],ds:[di]
	 ;mov di,0

     add di,1
     mov si,0


;testu:
    ; mov ah,'@'
     ;mov es:[si],ah
     ;mov al,01h
     ;mov es:[si+1],al
     ;add si,2
     ;loop testu
     ;jmp done

	 in  al,40h              ;开始随机选择方块类型,al=时间随机值
     and al,0111b
 	 mov dl, al
     mov block_colar[0],dl

drawf:
    xor dx,dx
    xor ax,ax

    mov dl,ds:[di] ;row
    mov dh,ds:[di+1];col

    mov ax,160
    mul dl
    mov si,ax

    xor ax,ax
    mov ax,2
    mul dh
	add si,ax
    ;xor dx,dx



    mov ah,'@'
    mov byte ptr es:[bx + si],ah

	xor dx,dx
	mov dl,block_colar[0]
	cmp dx,0
	je  clor1
	cmp dx,1
	je  clor2
	cmp dx,2
	je  clor3
	cmp dx,3
	je  clor4
	cmp dx,4
	je  clor5
	cmp dx,5
	je  clor6
	cmp dx,6
	je  clor7
    cmp dx,7
    je  clor8
clor1:
     mov al,00001001b
	 jmp Zclor
clor2:
     mov al,00001010b
	 jmp Zclor
clor3:
     mov al,00001011b
	 jmp Zclor

clor4:
     mov al,00001100b
     jmp Zclor
clor5:
    mov al,00001101b
    jmp Zclor

clor6:
    mov al,00001110b
    jmp Zclor
clor7:
    mov al,00001111b
    jmp Zclor
clor8:
    mov al,00001101b
    jmp Zclor
Zclor:
	;mov al, 03h
    mov byte ptr es:[bx +  si + 1],al
    add di,2
    loop drawf





done:
    ret



draw_block endp

;-----------------------------------------------------------------------------------------
cursor_init proc near
    push es
    push ax
    push dx
    push bx

    mov ah, 02h
    mov bh, 0
    mov dh, 23
    mov dl, 62
    int 10h

    ; 清除键盘缓冲区中可能残留的按键
clear_buffer:
    mov ah, 01h
    int 16h
    jz buffer_cleared
    mov ah, 00h
    int 16h
    jmp clear_buffer
    
buffer_cleared:
    pop bx
    pop dx
    pop ax
    pop es

    ret

cursor_init endp

;--------------------------------------------------------------------------------------
start_game proc near
    mov ax, data
    mov ds, ax
    mov first_move[0],0
    ; 初始化方块位置
    mov now_block[0], 1
    mov now_block[1], 40
    ; 只有当游戏时间还未初始化时，才重置分数和初始化难度（避免方块落底后重置）
    cmp game_start_time[0], 0
    jne skip_init
    cmp game_start_time[2], 0
    jne skip_init
    ; 只在游戏真正开始时重置分数
    mov score, 0
    ; 初始化难度（只在游戏开始时执行）
    cmp difficulty_mode, 1
    je init_diff_mode
    mov level, 0
    jmp init_done
init_diff_mode:
    mov level, 1
    mov last_level_time, 0
init_done:
    call show_level     ; 显示初始难度
    call show_score_display  ; 显示初始分数（0）
skip_init:
    ; 继续游戏时不需要重新初始化难度
    ; 注意：游戏时间初始化由 show_time 函数在第一次调用时完成，这里不重置
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx

    call show_time

	call remove_small

    call rand_block ;获得一个随机的方块
	call remove_small
	call show_small

    call move_block
 ;   mov cx,17
;l0:
 ;   push cx
 ;   mov cx,0ah
;l1:
  ;  push cx
  ;  mov cx,0ffffh
;l2:
   ; mov ax,0
   ; loop l2
  ;  pop cx
 ;   loop l1
  ;  call move_block
  ;  pop cx
  ;  loop l0



    call get_score
    jmp start_game ;jmp才行，call不行
    ret
start_game endp

;---------------------------------------------------------------------------------------
move_block proc near

    mov cx,20
l1:
    push cx
    ;cmp approve[0],0
    ;jne dback

    call  remove_block;
    add now_block[0],1

    call redraw_block;
    call HandleInputLoop

    pop cx

    loop l1


dback:
    ret
exitbq:
    ; 主动退出时，先更新最好成绩
    call update_best_score
    jmp exitq
    mov ax, 4c00h
	int 21h

move_block endp


; ------------------------------------------------------------
; 连续轮询键盘，实现平滑左右/下移动
; ------------------------------------------------------------
HandleInputLoop proc near
    push dx
    mov dx, MOVE_TICKS

input_cycle:
    push dx

    mov ah, 01h
    int 16h
    jnz has_key
    jmp no_key

has_key:
    mov ah, 00h
    int 16h
    mov bh, ah          ; 扫描码
    mov bl, al          ; ASCII

    cmp bl, $quit
    jne check_left_lower
    jmp handle_quit

check_left_lower:
    cmp bl, 'a'
    jne check_left_upper
    jmp handle_left

check_left_upper:
    cmp bl, 'A'
    jne check_left_arrow
    jmp handle_left

check_left_arrow:
    cmp bh, $left
    jne check_right_lower
    jmp handle_left

check_right_lower:
    cmp bl, 'd'
    jne check_right_upper
    jmp handle_right

check_right_upper:
    cmp bl, 'D'
    jne check_right_arrow
    jmp handle_right

check_right_arrow:
    cmp bh, $right
    jne check_down_lower
    jmp handle_right

check_down_lower:
    cmp bl, 's'
    jne check_down_upper
    jmp handle_down

check_down_upper:
    cmp bl, 'S'
    jne check_down_arrow
    jmp handle_down

check_down_arrow:
    cmp bh, 80          ; 下箭头
    jne check_rotate_up
    jmp handle_down

check_rotate_up:
    cmp bh, 72          ; 上箭头扫描码
    jne post_key
    jmp handle_rotate

handle_rotate:
    call remove_block2
    call block_change
    call redraw_block
    jmp post_key

handle_left:
    call remove_block2
    sub now_block[1],2
    call judge_block
    cmp approve[0],0
    je redraw_after_move
    add now_block[1],2
    jmp redraw_after_move

handle_right:
    call remove_block2
    add now_block[1],2
    call judge_block
    cmp approve[0],0
    je redraw_after_move
    sub now_block[1],2
    jmp redraw_after_move

handle_down:
    call remove_block2
    add now_block[0],1
    call judge_block
    cmp approve[0],0
    je redraw_after_move
    sub now_block[0],1

redraw_after_move:
    call redraw_block
    jmp post_key

handle_quit:
    pop dx              ; 弹出本次循环计数
    pop dx              ; 弹出过程保存的 dx
    jmp exitbq

no_key:
    call ShortPause

post_key:
    call ShortPause
    pop dx
    dec dx
    jz loop_done
    jmp input_cycle

loop_done:
    pop dx
    ret
HandleInputLoop endp

; ------------------------------------------------------------
; 短延时，控制按键采样节奏
; ------------------------------------------------------------
ShortPause proc near
    push ax
    push bx
    push cx
    
    ; 根据难度调整延时
    ; 基础延时3000，每级减少150
    mov cx, 3000
    cmp level, 0
    je pause_loop
    
    ; 计算：3000 - level * 150
    mov al, level
    mov bl, 150
    mul bl              ; AX = level * 150
    sub cx, ax
    
    ; 最小延时500
    cmp cx, 500
    jae pause_loop
    mov cx, 500

pause_loop:
    loop pause_loop
    pop cx
    pop bx
    pop ax
    ret
ShortPause endp


;--------------------------------------------------------------------------------------
redraw_block proc near



    call draw_block;

    ret

redraw_block endp
;-------------------------------------------------------------------------------------

judge_block proc near

    mov ax,0b81fh  ;设置初始位置，游戏边框顶端
    mov es,ax

    xor ax,ax
    mov ax,data    ;设置数据段
    mov ds,ax

    xor cx,cx
    xor di,di
    ;mov di,offset now_block    ;设置应当开始画的位置，这里只获取行的位置
    mov cl,now_block[0]
    xor bx,bx
    mov bl,now_block[1]
    mov ax,es

add_r:
     add ax,0ah
     loop add_r

     mov es,ax


     xor cx,cx
     xor ax,ax
     xor di,di

     mov si,offset choice_block
     mov di,ds:[si]
     mov cx,ds:[di]

     add di,1
     mov si,0


dra:
    xor dx,dx
    xor ax,ax

    mov dl,ds:[di] ;row
    mov dh,ds:[di+1];col

    mov ax,160
    mul dl
    mov si,ax

    xor ax,ax
    mov ax,2
    mul dh

    add si,ax
    xor ax,ax

    mov ax,es:[bx + si]

    cmp al,' '
    jne  set_right

    add di,2
    loop dra
    mov approve[0],0
    jmp gone



set_right:

	mov approve[0],1


gone:

    ret


judge_block endp



;-------------------------------------------------------------------------------------



remove_block proc near

    call show_time

    call remove_block2
    cmp first_move[0],0
    je  there1
    add now_block[0],1
    call judge_block
    cmp approve[0],0
    je there
    sub now_block[0],1
    cmp choice_block[0],1
    jne  yue
    add now_block[0],1
yue:
    call redraw_block
    ; 方块落底后，先检查并清除满行
    call get_score
    jmp far ptr start_game
    ;mov approve[0],1
    ;jmp done2

there:
    sub now_block[0],1


there1:
    mov first_move[0],1

    mov ax,0b81fh  ;设置初始位置，游戏边框顶端
    mov es,ax

    xor ax,ax
    mov ax,data    ;设置数据段
    mov ds,ax

    xor cx,cx
    xor di,di
    mov cl,now_block[0]
    xor bx,bx
    mov bl,now_block[1]
    mov ax,es

add_row2:
     add ax,0ah
     loop add_row2

     mov es,ax

printR:
     xor cx,cx
     xor ax,ax
     xor di,di

     mov si,offset choice_block
     mov di,ds:[si]
     mov cx,ds:[di]

     add di,1
     mov si,0


movef:
    xor dx,dx
    xor ax,ax

    mov dl,ds:[di] ;row
    mov dh,ds:[di+1];col

    mov ax,160
    mul dl
    mov si,ax

    xor ax,ax
    mov ax,2
    mul dh

    add si,ax
    mov ah,' '
    mov byte ptr es:[bx + si],ah
    mov al,0h
    mov byte ptr es:[bx +  si + 1],al
    add di,2
    loop movef


done2:

    ret


remove_block endp

;---------------------------------------------------------------------------------------
remove_block2 proc near


    mov ax,0b81fh  ;设置初始位置，游戏边框顶端
    mov es,ax

    xor ax,ax
    mov ax,data    ;设置数据段
    mov ds,ax

    xor cx,cx
    xor di,di
    mov cl,now_block[0]
    xor bx,bx
    mov bl,now_block[1]
    mov ax,es

add_row3:
     add ax,0ah
     loop add_row3

     mov es,ax


     xor cx,cx
     xor ax,ax
     xor di,di

     mov si,offset choice_block
     mov di,ds:[si]
     mov cx,ds:[di]

     add di,1
     mov si,0


movefv:
    xor dx,dx
    xor ax,ax

    mov dl,ds:[di] ;row
    mov dh,ds:[di+1];col

    mov ax,160
    mul dl
    mov si,ax

    xor ax,ax
    mov ax,2
    mul dh

    add si,ax
    mov ah,' '
    mov byte ptr es:[bx + si],ah
    mov al,0h
    mov byte ptr es:[bx +  si + 1],al
    add di,2
    loop movefv


done3:

    ret


remove_block2 endp
;----------------------------------------------------------------------------------------

get_score proc near

    mov ax,0b800h
    mov es,ax
    mov ah,'@'
    mov es:[0],ah
    xor ax,ax
    mov ax,0b81fh


    mov es,ax

    mov cx,20
    mov di,0
frow:
    xor ax,ax

    push cx
    mov  bx,offset now_line
    mov  ax,data
    mov  ds,ax
    mov  ds:[bx],cx
    mov ax,0b81fh

colute:
     add ax,0ah
     loop colute
     mov es,ax
     ;mov ah,'!'   ;test
     ;mov si,0
     ;mov es:[si],ah
     xor cx,cx
     mov cx,32  ;36
     mov si,14  ;4
fcow:
     mov al,es:[si]      ; 获取当前字符
     cmp al,' '          ; 如果是空格，说明这一行不满
     je breakk
     cmp al,'|'          ; 忽略边框字符
     je skip_border
     cmp al,'+'          ; 忽略边框字符
     je skip_border
     cmp al,'-'          ; 忽略边框字符
     je skip_border
     ; 如果是方块字符或其他非空格字符，继续检查
skip_border:
     add si,2
     loop fcow
     ; 循环完成，说明这一行没有空格，是满行
     call clear_a
     ;call add_score


breakk:

     pop cx
     sub cx,1
     cmp cx,0
     jne frow
     ;loop frow

done5:
     ret


get_score endp


;-----------------------------------------------------------------------------------------
clear_a proc near

      xor ax,ax
      xor cx,cx
      mov bx,offset now_line
      mov ax,data
      mov ds,ax
      mov cx,ds:[bx]
      mov dx,cx
      mov ax,0b81fh
      mov es,ax
      mov si,0
tes:
      add ax,0ah
      loop tes

      mov es,ax

      mov ax,es
      mov ds,ax
      sub ax,0ah
      mov ds,ax

      mov si,14;4
      mov di,14;4
      mov cx,dx
      sub cx,5
clx:
      push cx
      mov cx,32; 36
cll:
      ; 跳过边框字符，直接复制内容
      mov al,'*'
      cmp byte ptr es:[si],al
      je skip_border_char
      mov al,'|'
      cmp byte ptr es:[si],al
      je skip_border_char
      mov al,'+'
      cmp byte ptr es:[si],al
      je skip_border_char
      mov al,'-'
      cmp byte ptr es:[si],al
      je skip_border_char
      ; 不是边框字符，复制内容
      mov bx,ds:[si]
      mov es:[di],bx
      jmp next_char
skip_border_char:
      ; 跳过边框字符，不复制
next_char:
      add di,2
      add si,2
      loop cll

      mov ax,es
      sub ax,0ah
      mov es,ax

      mov ax,ds
      sub ax,0ah
      mov ds,ax

      mov di,14
      mov si,14

      pop cx

      loop clx

      ; 所有行都清除完毕，增加分数
      mov ax,data
      mov ds,ax
      xor ax,ax

      call add_score
      ret

clear_a endp

;-----------------------------------------------------------------------------------------

game_over proc near
	push ax
	push bx
	push cx
	push dx
	push si
	push es
	
	mov ax, data
	mov ds, ax
	call clear_vga
	
	; 设置显示位置（居中）
	mov ax, 0b800h
	mov es, ax
	
	; 绘制 GAME OVER 文字（第10行开始）
	mov si, 160 * 8 + 20 * 2  ; 第8行，第20列
	
	; G
	mov byte ptr es:[si], 'G'
	mov byte ptr es:[si+1], 00001100b  ; 亮红色
	add si, 2
	mov byte ptr es:[si], 'A'
	mov byte ptr es:[si+1], 00001100b
	add si, 2
	mov byte ptr es:[si], 'M'
	mov byte ptr es:[si+1], 00001100b
	add si, 2
	mov byte ptr es:[si], 'E'
	mov byte ptr es:[si+1], 00001100b
	add si, 4
	mov byte ptr es:[si], 'O'
	mov byte ptr es:[si+1], 00001100b
	add si, 2
	mov byte ptr es:[si], 'V'
	mov byte ptr es:[si+1], 00001100b
	add si, 2
	mov byte ptr es:[si], 'E'
	mov byte ptr es:[si+1], 00001100b
	add si, 2
	mov byte ptr es:[si], 'R'
	mov byte ptr es:[si+1], 00001100b
	
	; 绘制分隔线（第12行）
	mov si, 160 * 12 + 15 * 2
	mov cx, 50
draw_line:
	mov byte ptr es:[si], '-'
	mov byte ptr es:[si+1], 00001110b  ; 亮黄色
	add si, 2
	loop draw_line
	
	; 绘制提示文字（第15行）
	mov si, 160 * 15 + 18 * 2
	mov bx, offset msg_press_key
draw_msg:
	mov al, [bx]
	cmp al, '$'
	je msg_done
	mov byte ptr es:[si], al
	mov byte ptr es:[si+1], 00001010b  ; 亮绿色
	inc bx
	add si, 2
	jmp draw_msg
	
msg_done:
	; 等待按键
	mov ah, 0
	int 16h
	
	pop es
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	
	ret

game_over endp


;----------------------------------------------------------------------------------------
block_change proc near




	mov ax,data
	mov ds,ax
	mov si,offset choice_block
    mov di,ds:[si]
    xor ax,ax
    mov ax,di
    mov last_choice,ax            ; 保存完整的16位地址
    mov cx,ds:[di]
    mov si,0
    mov ax,0b800h
    mov es,ax
    add di,9
    xor cx,cx
    mov cl,ds:[di]

	cmp cl,1
	je  change_1
	cmp cl,2
	je  change_2
    cmp cl,3
    je  change_3
    cmp cl,4
    je  change_4
    cmp cl,5
    je  change_5
    cmp cl,6
    je  change_6
    cmp cl,7
    je change_7
    cmp cl,8
    je change_8

    cmp cl, 0
    je change_0

change_0:
    ; 正方形旋转后形状不变，不需要改变方块类型
    ; 直接返回，让handle_rotate中的redraw_block重新绘制
    ret

change_1:



    mov ax,offset line_block2 ;将方块的图像地址
    mov bx,offset choice_block
    ; mov cx,data
    ; mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex



change_2:
    ;
    ; xor ax,ax
    ; xor bx,bx
    ; xor cx,cx

    mov ax,offset line_block ;将方块的图像地址
    mov bx,offset choice_block
    ; mov cx,data
    ; mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex

change_3:

    ; xor ax,ax
    ; xor bx,bx
    ; xor cx,cx

    mov ax,offset L_block2 ;将方块的图像地址
    mov bx,offset choice_block
    ; mov cx,data
    ; mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex

change_4:

    ; xor ax,ax
    ; xor bx,bx
    ; xor cx,cx

    mov ax,offset L_block ;将方块的图像地址
    mov bx,offset choice_block
    ; mov cx,data
    ; mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex

change_5:

    ; xor ax,ax
    ; xor bx,bx
    ; xor cx,cx

    mov ax,offset T_block2 ;将方块的图像地址
    mov bx,offset choice_block
    mov cx,data
    mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex
change_6:

    ; xor ax,ax
    ; xor bx,bx
    ; xor cx,cx

    mov ax,offset T_block ;将方块的图像地址
    mov bx,offset choice_block
    ; mov cx,data
    ; mov ds,cx
    mov ds:[bx],ax
    ;call redraw_block;
    jmp donex

change_7:
    ; Z形第一种 -> Z形第二种
    mov ax,offset Z_block2 ;将方块的图像地址
    mov bx,offset choice_block
    mov ds:[bx],ax
    jmp donex


change_8:
    ; Z形第二种 -> Z形第一种
    mov ax,offset Z_block ;将方块的图像地址
    mov bx,offset choice_block
    mov ds:[bx],ax
    jmp donex

donex:
    xor ax,ax
    call judge_block
    cmp approve[0],0
    jne  okk

    call redraw_block
    ret
okk:
    xor si,si
    xor di,di
    xor ax,ax
    mov si,offset last_choice
    mov di,offset choice_block
    mov ax,ds:[si]                ; 读取完整的16位地址
    mov ds:[di],ax                ; 恢复完整的16位地址
	ret


block_change endp

;-------------------------------------------------------------------------------------------

chose_mode proc near   ;显示主菜单

wait_for_key:
    mov ah, 0
    int 16h
    mov bl, al
    mov al, ah
    
    ; 选择1：一般模式
    cmp bl, '1'
    je set_normal_mode
    
    ; 选择2：难度模式
    cmp bl, '2'
    je set_difficulty_mode
    
    ; 选择3：退出
    cmp bl, '3'
    je over_end
    
    ; 其他键，重新等待
    jmp wait_for_key

set_normal_mode:
    mov difficulty_mode, 0
    mov level, 0
    ; 重置游戏开始时间，确保新游戏能正确初始化
    mov game_start_time[0], 0
    mov game_start_time[2], 0
    mov last_level_time, 0
    ret

set_difficulty_mode:
    mov difficulty_mode, 1
    mov level, 1
    ; 重置游戏开始时间，确保新游戏能正确初始化
    mov game_start_time[0], 0
    mov game_start_time[2], 0
    mov last_level_time, 0
    ret

over_end:
    ; 用户选择退出，直接退出程序（不显示game_over）
    mov ax, 4c00h
    int 21h

chose_mode endp
;-------------------------------------------------------------------------------------------
show_time  proc near
    push ax
    push bx
    push cx
    push dx
    push es
    push si
    
    ; 获取当前时钟滴答数（int 1Ah, AH=00h）
    mov ah, 00h
    int 1Ah             ; CX:DX = 时钟滴答数（从午夜开始）
    
    ; 如果是第一次调用，记录开始时间
    cmp game_start_time[0], 0
    jne calc_elapsed
    cmp game_start_time[2], 0
    jne calc_elapsed
    
    ; 记录开始时间
    mov game_start_time[0], cx
    mov game_start_time[2], dx
    mov cx, 0
    mov dx, 0
    jmp display_time
    
calc_elapsed:
    ; 计算经过的滴答数（32位减法）
    ; 当前时间：CX:DX
    ; 开始时间：game_start_time[0]:game_start_time[2]
    
    ; 先减低字
    sub dx, game_start_time[2]
    ; 如果借位，高字减1
    jnc no_borrow
    dec cx
no_borrow:
    sub cx, game_start_time[0]
    
    ; 将滴答数转换为秒（约18.2滴答/秒）
    ; 简化：主要使用低16位DX，如果CX很小可以忽略
    cmp cx, 0
    jne has_high
    ; 只用低16位
    mov ax, dx
    mov dx, 0
    mov bx, 18
    div bx              ; AX = 秒数
    jmp calc_level_and_display
    
has_high:
    ; 如果CX不为0，简化处理：主要用DX，加上CX的近似贡献
    mov ax, dx
    mov dx, 0
    mov bx, 18
    div bx              ; AX = 低16位的秒数
    ; CX的贡献简化：CX * 3640（约65536/18），但只取近似值
    push ax
    mov ax, cx
    ; 简化：CX * 3640，但只取低16位
    mov bx, 3640
    mul bx              ; DX:AX，但我们只用AX的近似
    mov bx, ax
    pop ax
    add ax, bx
    ; 限制最大值为3599秒（59分59秒）
    cmp ax, 3600
    jb calc_level_and_display
    mov ax, 3599
    
calc_level_and_display:
    ; AX = 总秒数
    ; 如果是难度模式，先计算并更新难度级别
    cmp difficulty_mode, 1
    jne display_time_only_skip_level
    
    ; 保存总秒数（用于后续显示）
    push ax
    
    ; 计算难度级别：level = 1 + (total_seconds / 20)
    mov bx, 20
    xor dx, dx
    div bx              ; AX = total_seconds / 20
    add ax, 1           ; level从1开始
    mov bl, level
    cmp al, bl
    jbe no_level_change
    
    ; 难度升级
    mov level, al
    pop ax               ; 恢复总秒数
    push ax              ; 再次保存，用于显示
    call show_level     ; 显示新难度
    jmp display_time_only
    
no_level_change:
    pop ax               ; 恢复总秒数
    
display_time_only_skip_level:
    push ax              ; 保存总秒数用于显示
    
display_time_only:
    ; 显示时间
    pop ax               ; 恢复总秒数
    
display_time:
    ; AX = 秒数
    mov dx, 0
    mov bx, 60
    div bx              ; AX = 分钟, DX = 秒
    
    ; 显示分钟（2位）
    push dx              ; 保存秒数
    mov dx, 0
    mov bx, 10
    div bx              ; AL = 十位, DL = 个位
    add al, '0'
    add dl, '0'
    
    mov si, 0b800h
    mov es, si
    ; 从第56列开始显示
    mov byte ptr es:[160*12 + 56*2], al
    mov byte ptr es:[160*12 + 56*2 + 1], 02h
    mov byte ptr es:[160*12 + 56*2 + 2], dl
    mov byte ptr es:[160*12 + 56*2 + 3], 02h
    
    ; 显示冒号
    mov byte ptr es:[160*12 + 58*2], ':'
    mov byte ptr es:[160*12 + 58*2 + 1], 02h
    
    ; 显示秒（2位）
    pop ax               ; 恢复秒数
    mov dx, 0
    mov bx, 10
    div bx              ; AL = 十位, DL = 个位
    add al, '0'
    add dl, '0'
    
    mov byte ptr es:[160*12 + 60*2], al
    mov byte ptr es:[160*12 + 60*2 + 1], 02h
    mov byte ptr es:[160*12 + 60*2 + 2], dl
    mov byte ptr es:[160*12 + 60*2 + 3], 02h
    
    pop si
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    ret

show_time endp

;-------------------------------------------------------------------------------------------
; 显示难度级别
show_level proc near
    push ax
    push bx
    push cx
    push dx
    push es
    push si
    
    mov ax, 0b800h
    mov es, ax
    
    ; 显示"Level: "（已在界面中）
    ; 显示数字部分（第10行，第56列开始）
    mov si, 160 * 10 + 56 * 2
    
    ; 将level转换为两位数字
    mov al, level
    mov ah, 0
    mov bl, 10
    div bl              ; AL = 十位, AH = 个位
    
    add al, '0'
    add ah, '0'
    
    ; 显示十位
    mov byte ptr es:[si], al
    mov byte ptr es:[si+1], 02h  ; 绿色
    add si, 2
    
    ; 显示个位
    mov byte ptr es:[si], ah
    mov byte ptr es:[si+1], 02h  ; 绿色
    
    pop si
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    ret

show_level endp

;------------------------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------------------------
;显示分数函数（独立函数，可以在任何地方调用）
show_score_display proc near
	push ax
	push bx
	push cx
	push dx
	push si
	push es
	
	; 显示分数（第14行，第56列开始）
	mov ax, 0b800h
	mov es, ax
	mov si, 160 * 14 + 56 * 2
	
	; 将分数转换为字符串并显示
	mov ax, score
	mov bx, 10
	mov cx, 0
	
	; 如果分数为0，直接显示"0"
	cmp ax, 0
	jne convert_loop
	
	; 先清空旧的显示区域
	push si
	mov cx, 6
clear_old_score_zero:
	mov byte ptr es:[si], ' '
	mov byte ptr es:[si+1], 02h
	add si, 2
	loop clear_old_score_zero
	pop si
	
	; 显示"0"
	mov byte ptr es:[si], '0'
	mov byte ptr es:[si+1], 02h  ; 绿色
	jmp done_display
	
	; 先计算位数并压栈
convert_loop:
	xor dx, dx
	div bx
	add dl, '0'
	push dx
	inc cx
	cmp ax, 0
	jne convert_loop
	
	; 先清空旧的显示区域（最多显示6位数字，支持到999999）
	push cx
	push si
	mov cx, 6
clear_old_score:
	mov byte ptr es:[si], ' '
	mov byte ptr es:[si+1], 02h
	add si, 2
	loop clear_old_score
	pop si
	pop cx
	
	; 显示所有位数（不限制位数，支持大数字）
display_loop:
	cmp cx, 0
	je done_display
	pop ax
	mov byte ptr es:[si], al
	mov byte ptr es:[si+1], 02h  ; 绿色
	add si, 2
	dec cx
	jmp display_loop
	
done_display:
	pop es
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret

show_score_display endp

;------------------------------------------------------------------------------------------------------

add_score proc near
	push ax
	push bx
	push cx
	push dx
	push si
	push es
	
	; 分数加10
	mov ax, score
	add ax, 10
	mov score, ax
	
	; 显示更新后的分数
	call show_score_display
	
	pop es
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret

add_score endp

;------------------------------------------------------------------------------------------------------

show_small	proc near
    mov ax,0b800h
    mov es,ax
    xor ax,ax
    mov al,'@'
    mov ah,02h
    mov bl,small_block[0]
    cmp bl,0
    jne  show0
    jmp show_0
show0:
   cmp bl,1
   jne  show1
   jmp show_1
show1:
   cmp bl,2
   jne  show2
   jmp show_2
show2:
   cmp bl,3
   jne  show3
   jmp show_3
show3:
   cmp bl,4
   jne  show4
   jmp show_4
show4:
   jmp show_1


   ;cmp ax,0  ;比较随机值得出我们需要画的方块
   ;je  get_seq
   ;cmp ax,1  ;
   ;je  get_line;
   ;cmp ax,2  ;
   ;je  get_L;
   ;cmp ax,3
   ;je  get_Z;
   ;cmp ax,4
   ;je  get_T
   ;jmp get_line;




show_1:
	mov es:[160*5 + 57*2],al
	mov es:[160*5 + 57*2 +1],ah
	mov es:[160*6 + 57*2],al
	mov es:[160*6 + 57*2 +1],ah
	mov es:[160*7 + 57*2],al
	mov es:[160*7 + 57*2 +1],ah
	mov es:[160*8 + 57*2],al
	mov es:[160*8 + 57*2 +1],ah
    jmp ok_s

show_2:
	mov es:[160*5 + 57*2],al
	mov es:[160*5 + 57*2 +1],ah
	mov es:[160*6 + 57*2],al
	mov es:[160*6 + 57*2 +1],ah
	mov es:[160*7 + 57*2],al
	mov es:[160*7 + 57*2 +1],ah
	mov es:[160*7 + 59*2],al
	mov es:[160*7 + 59*2 +1],ah
	jmp ok_s

show_3:
	mov es:[160*5 + 57*2],al
	mov es:[160*5 + 57*2 +1],ah
	mov es:[160*6 + 57*2],al
	mov es:[160*6 + 57*2 +1],ah
	mov es:[160*6 + 59*2],al
	mov es:[160*6 + 59*2 +1],ah
	mov es:[160*7 + 59*2],al
	mov es:[160*7 + 59*2 +1],ah
    jmp ok_s

show_4:
	mov es:[160*5 + 57*2],al
	mov es:[160*5 + 57*2 +1],ah
	mov es:[160*6 + 57*2],al
	mov es:[160*6 + 57*2 +1],ah
	mov es:[160*7 + 57*2],al
	mov es:[160*7 + 57*2 +1],ah
	mov es:[160*6 + 59*2],al
	mov es:[160*6 + 59*2 +1],ah
    jmp ok_s

show_0:
	mov es:[160*5 + 57*2],al
	mov es:[160*5 + 57*2 +1],ah
	mov es:[160*5 + 59*2],al
	mov es:[160*5 + 59*2 +1],ah
	mov es:[160*6 + 57*2],al
	mov es:[160*6 + 57*2 +1],ah
	mov es:[160*6 + 59*2],al
	mov es:[160*6 + 59*2 +1],ah
    jmp ok_s

ok_s:
    ret


show_small endp

;-----------------------------------------------------------------------------------------

remove_small proc near
	mov ax,0b800h
	mov es,ax
	xor ax,ax
	mov al,' '
	mov ah,0h

	xor bx,bx
	mov bl,small_block[0]
	; cmp bl,0
	; jne  show00
	; jmp show_00
	; show00:
	; cmp bl,1
	; jne  show11
	; jmp show_11
	; show11:
	; cmp bl,2
	; jne  show22
	; jmp show_22
	; show22:
	; cmp bl,3
	; jne  show33
	; jmp show_33
	; show33:
	; cmp bl,4
	; jne  show44
	; jmp show_44
	; show44:
	; jmp show_11

show_11:
     mov es:[160*5 + 57*2],al
     mov es:[160*5 + 57*2 +1],ah
     mov es:[160*6 + 57*2],al
     mov es:[160*6 + 57*2 +1],ah
     mov es:[160*7 + 57*2],al
     mov es:[160*7 + 57*2 +1],ah
     mov es:[160*8 + 57*2],al
     mov es:[160*8 + 57*2 +1],ah
 ;jmp ok_s2

show_22:
     mov es:[160*5 + 57*2],al
     mov es:[160*5 + 57*2 +1],ah
     mov es:[160*6 + 57*2],al
     mov es:[160*6 + 57*2 +1],ah
     mov es:[160*7 + 57*2],al
     mov es:[160*7 + 57*2 +1],ah
     mov es:[160*7 + 59*2],al
     mov es:[160*7 + 59*2 +1],ah
 ;jmp ok_s2

show_33:
     mov es:[160*5 + 57*2],al
     mov es:[160*5 + 57*2 +1],ah
     mov es:[160*6 + 57*2],al
     mov es:[160*6 + 57*2 +1],ah
     mov es:[160*6 + 59*2],al
     mov es:[160*6 + 59*2 +1],ah
     mov es:[160*7 + 59*2],al
     mov es:[160*7 + 59*2 +1],ah
     ; jmp ok_s2

show_44:
     mov es:[160*5 + 57*2],al
     mov es:[160*5 + 57*2 +1],ah
     mov es:[160*6 + 57*2],al
     mov es:[160*6 + 57*2 +1],ah
     mov es:[160*7 + 57*2],al
     mov es:[160*7 + 57*2 +1],ah
     mov es:[160*6 + 59*2],al
     mov es:[160*6 + 59*2 +1],ah
 ; jmp ok_s2

show_00:
    mov es:[160*5 + 57*2],al
    mov es:[160*5 + 57*2 +1],ah
    mov es:[160*5 + 59*2],al
    mov es:[160*5 + 59*2 +1],ah
    mov es:[160*6 + 57*2],al
    mov es:[160*6 + 57*2 +1],ah
    mov es:[160*6 + 59*2],al
    mov es:[160*6 + 59*2 +1],ah
 ; jmp ok_s2

ok_s2:
    ret

remove_small endp

;-----------------------------------------------------------------------------------------


code ends
end start
