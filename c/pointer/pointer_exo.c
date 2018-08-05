#include <stdio.h>
#include <stdint.h>

int main()
{
	//uint32_t x = 0x12345678;
	uint32_t x = 12345678; 
	uint8_t *y;
	int i;

	uint32_t *pointer = x;
	uint8_t *y = pointer
	//char *pt = pointer ++;
	
	//printf("test...\n");

	//for (i=0;i<8;i++) {
	//	pointer++;		
	//}
	//pointer--;
	//for (i=0;i<8;i--) {
	//	printf("%d",*pointer);
	//}
	
	//printf("%d\n%d\n%d\n%d\n",pointer, pt, x, *pointer);

	printf(*y);

	uint32_t ret;
	return ret; //0x78563412
}
