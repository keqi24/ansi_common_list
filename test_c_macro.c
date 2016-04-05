#include <stdio.h>

#define triple(x) 3 * x

int main() {
    int a = 10;
    int b = 0;
    b = triple(5 + 5);
    printf("Result: %d \n", b);
    return 0;
}
