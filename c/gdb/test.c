#include <stdio.h>
#include <stdlib.h>

int toutou(int x)
{
    printf("1 %d\n",x);
    printf("2 %d\n",x);
    printf("3 %d\n",x);
}

int main()
{
    printf("give me 0\n");
    int c = getchar();

    if (c == 48)
        toutou(1);
}
