#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char * argv[]) {

	char * point1 = argv[1];	
	printf("point1--> %s\n", point1);

	printf("malloc\n");
	char * point2 = malloc(sizeof(*point1) + 3*sizeof(char));
//= malloc(sizeof(point1) + sizeof(char));

	printf("first quotes\n");
	point2[0] = '"';
	//printf("point2--> %s\n", point2);
	
	printf("strcat\n");
	strcat(point2,point1);

	point2[sizeof(point1) + 1] = '"';

	printf("point2--> %s\n", point2);		

	printf("sizeof point2 %d\n", sizeof(*point2));
	return 0;
} 
