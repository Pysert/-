#include <stdio.h>

// 全局数据
int table[9][9] = {
    {7,2,3,4,5,6,7,8,9},
    {2,4,7,8,10,12,14,16,18},
    {3,6,9,12,15,18,21,24,27},
    {4,8,12,16,7,24,28,32,36},
    {5,10,15,20,25,30,35,40,45},
    {6,12,18,24,30,7,42,48,54},
    {7,14,21,28,35,42,49,56,63},
    {8,16,24,32,40,48,56,7,72},
    {9,18,27,36,45,54,63,72,81}
};

// 过程：检查指定位置的数据
void check_cell(int row, int col) {
    int correct_value = (row + 1) * (col + 1);  // 正确值
    if (table[row][col] != correct_value) {
        printf("%d %d error\n", row + 1, col + 1);
    }
}

int main() {
    // 双循环检查每个位置
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            check_cell(i, j);  // 过程调用
        }
    }
    printf("acconplish!\n");
    return 0;
}