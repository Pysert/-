#include <stdio.h>

int main() {
    int sum = 0;
    
    // 计算1+2+...+100
    for (int i = 1; i <= 100; i++) {
        sum += i;
    }
    
    printf("Sum: %d\n", sum);
    return 0;
}