#include <stdio.h>

int main() {
    char letter = 'a';
    int count = 0;
    
    for (int i = 0; i < 26; i++) {
        printf("%c ", letter);
        letter++;
        count++;
        
        if (count == 13) {
            printf("\n");
            count = 0;
        }
    }
    
    return 0;
}