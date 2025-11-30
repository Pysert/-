#include <stdio.h>

// 过程：显示一个乘法项
void display_multiplication(int a, int b) {
    printf("%d*%d=%d", a, b, a * b);
}

int main() {
    printf("The 9mul9 table:\n");
    
    // 外层循环：从9到1
    for (int i = 9; i >= 1; i--) {
        // 内层循环：从1到i
        for (int j = 1; j <= i; j++) {
            display_multiplication(i, j);
            printf(" ");
        }
        printf("\n");
    }
    
    return 0;
}