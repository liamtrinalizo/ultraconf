#include "sensor.h" 

#include <wiringPi.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>
#include <stdio.h>
#include <ncurses.h>

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
    float distance;
};


int sensorPinSetup()
{
    pinMode(PIN_TRIG, OUTPUT);

    for (int indexSensor = 0; indexSensor < 5; indexSensor++)
    {
        pinMode(ECHO_PIN[indexSensor], INPUT);
    }
}

void  *getOneDistance(void *arguments)
{
    struct arg_struct *args = arguments;
    time_t startTime, stopTime, timeElapsed;

    while(1)
    {
        digitalWrite(PIN_TRIG, 1);
        sleep(TRIG_TIME);
        digitalWrite(PIN_TRIG, 0);

        while(digitalRead(args->echoId) == 0)
            startTime = time(NULL);	

        while(digitalRead(args->echoId) == 1)
            stopTime = time(NULL);

        timeElapsed = stopTime - startTime;

        args->distance= (timeElapsed * SONIC_SPEED) / 2;
        //mvprintw(LINES - 2, 0, "Thread %d distance %f", args->echoId, args->distance);
        printf("Thread %d distance %f\n", args->echoId, args->distance);
        sleep(1);
    }
    return 0;	
}

int getAllDistance()
{
    int err;    
    float distances[5];
    pthread_t threadId;
    struct arg_struct args;

    for (int indexThread = 0; indexThread < 5; indexThread++)
    {
        printf("Creating thread %d\n", indexThread);
        args.echoId = indexThread;
        if((err = pthread_create(&threadId, NULL, &getOneDistance, (void *)&args)))
            //mvprintw(LINES - 2, 0, "getAllDistance: pthread_create erro %d", err);
            printf("getAllDistance: pthread_create erro %d\n", err);
    }
}



