#include "sensor.h" 

#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <ncurses.h>
#include <sys/time.h>

enum POSITION_ENUM {ECHO_FRONT,
    ECHO_FRONT_LEFT, 
    ECHO_FRONT_RIGHT, 
    ECHO_REAR_LEFT,
    ECHO_REAR_RIGHT};

int ECHO_PIN[5] = {PIN_ECHO_FRONT,
    PIN_ECHO_FRONT_LEFT,
    PIN_ECHO_FRONT_RIGHT,
    PIN_ECHO_REAR_LEFT,
    PIN_ECHO_REAR_RIGHT};

struct arg_struct {
    int echoId;
    double distance;
};

int sensorPinSetup()
{
    pinMode(PIN_TRIG, OUTPUT);

    for (int indexSensor = 0; indexSensor < 5; indexSensor++)
        pinMode(ECHO_PIN[indexSensor], INPUT);
}

void getOneDistance()
{
    struct arg_struct *args = malloc(sizeof(struct arg_struct));
    struct timeval startTime, stopTime;
    double timeElapsed;

    args->echoId = 0;

    while(1)
    {
        digitalWrite(PIN_TRIG, 1);
        sleep(0.00001);
        digitalWrite(PIN_TRIG, 0);
        
        while(digitalRead(ECHO_PIN[0]) == 0)
            gettimeofday(&startTime, NULL);	
        
        while(digitalRead(ECHO_PIN[0]) == 1)
            gettimeofday(&stopTime, NULL);

        timeElapsed = stopTime.tv_usec - startTime.tv_usec;

        args->distance = (timeElapsed * SONIC_SPEED) / (2E6); //diving by E6 because usec
        printf("Thread %d distance %f cm\n", 0, args->distance);
        sleep(1);
    }
}

int getAllDistance()
{
    int err;    
    float distances[5];
    pthread_t threadId;
    struct arg_struct args;

    for (int indexThread = 0; indexThread < 1; indexThread++)
    {
        printf("Creating thread %d\n", indexThread);
        args.echoId = indexThread;
        //if((err = pthread_create(&threadId, NULL, &getOneDistance, (void *)&args)))
            //mvprintw(LINES - 2, 0, "getAllDistance: pthread_create erro %d", err);
            printf("getAllDistance: pthread_create erro %d\n", err);
    }
}



