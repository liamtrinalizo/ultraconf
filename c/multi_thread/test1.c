#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
 
// A normal C function that is executed as a thread 
// when its name is specified in pthread_create()
void *myThreadFun(void *vargp)
{
    sleep(1);
    printf("Printing GeeksQuiz from Thread \n");
    while (1==1) { 
	printf("thread\n");
	sleep(1);
    }
    return NULL;
}
  
int main()
{
    int n=0;
    pthread_t tid;
    printf("Before Thread\n");
    pthread_create(&tid, NULL, myThreadFun, NULL);
    printf("before join\n");
//    pthread_join(tid, NULL);
    printf("After Thread\n");
    while (n<8) {
	printf("main\n");
	sleep(1);
	n++;
    }
    pthread_exit(NULL);
    printf("bitch please\n");
    return 1;
}
