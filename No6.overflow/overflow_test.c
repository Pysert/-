// overflow_test.c - 使用内联汇编测试溢出
#include <stdio.h>
#include <dos.h>

// 函数声明
void test_addition_overflow(void);
void test_subtraction_overflow(void);
void test_multiplication_overflow(void);

int main() {
    printf("Testing Overflow Interrupt Handler...\n\n");
    
    // 测试加法溢出
    printf("1. Testing Addition Overflow:\n");
    test_addition_overflow();
    
    // 测试减法溢出  
    printf("\n2. Testing Subtraction Overflow:\n");
    test_subtraction_overflow();
    
    // 测试乘法溢出
    printf("\n3. Testing Multiplication Overflow:\n");
    test_multiplication_overflow();
    
    printf("\nAll tests completed.\n");
    return 0;
}

// 测试加法溢出
void test_addition_overflow(void) {
    int result;
    
    // 情况1：正数相加导致溢出
    printf("   Positive overflow: 20000 + 20000 = ");
    
    // 使用内联汇编，不使用JO/JNO
    asm {
        mov ax, 20000      ; 加载第一个数
        add ax, 20000      ; 相加，应该产生溢出
        into               ; 检查溢出，如果OF=1则调用4号中断
        mov result, ax     ; 保存结果
    }
    
    printf("%d\n", result);
    
    // 情况2：负数相加导致溢出  
    printf("   Negative overflow: -20000 + -20000 = ");
    
    asm {
        mov ax, -20000     ; 加载第一个负数
        add ax, -20000     ; 相加，应该产生溢出
        into               ; 检查溢出
        mov result, ax     ; 保存结果
    }
    
    printf("%d\n", result);
}

// 测试减法溢出
void test_subtraction_overflow(void) {
    int result;
    
    // 情况：正数减负数导致溢出
    printf("   Positive minus negative: 30000 - (-1000) = ");
    
    asm {
        mov ax, 30000      ; 被减数
        mov bx, -1000      ; 减数
        sub ax, bx         ; 30000 - (-1000) = 31000，应该溢出
        into               ; 检查溢出
        mov result, ax     ; 保存结果
    }
    
    printf("%d\n", result);
}

// 测试乘法溢出
void test_multiplication_overflow(void) {
    int result_high, result_low;
    
    // 情况：大数相乘导致溢出
    printf("   Multiplication overflow: 200 * 200 = ");
    
    asm {
        mov ax, 200        ; 被乘数
        mov bx, 200        ; 乘数
        imul bx            ; 有符号乘法，AX=40000可能溢出
        into               ; 检查溢出
        mov result_low, ax ; 保存低16位结果
        mov result_high, dx; 保存高16位结果
    }
    
    printf("Low: %d, High: %d\n", result_low, result_high);
    
    // 另一种检测溢出的方法（不使用JO/JNO）
    printf("   Alternative overflow detection: ");
    
    asm {
        mov ax, 200
        mov bx, 200
        imul bx
        ; 通过检查DX寄存器来判断是否溢出
        ; 如果DX != AX的符号扩展，则发生溢出
        mov result_low, ax
        mov result_high, dx
    }
    
    if (result_high != 0 && result_high != -1) {
        printf("Overflow detected (DX = %d)\n", result_high);
    } else {
        printf("No overflow\n");
    }
}