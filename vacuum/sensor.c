#include "sensor.h" 

#include <unistd.h>
#include <time.h>
#include <pthread.h>
#include <stdio.h>

int pinSensorSetup()
{
        pinMode(TRIG_PIN, OUTPUT);

        for (int indexSensor = 0; indexSensor < 5; indexSensor++)
        {
                pinMode(ECHO_PIN[indexSensor], INPUT);
        }
}

int getOneDistance(void *arguments)
{
        struct arg_struct *args = arguments;
        time_t startTime, stopTime, timeElapsed;

        void (1)
        {
                digitalWrite(TRIG_PIN, 1)
                        sleep(TRIG_TIME);
                digitalWrite(TRIG_PIN, 0);

                while(digitalRead(args->arg1) == 0)
                        startTime = time(NULL);	

                while(digitalRead(args->arg1) == 1)
                        stopTime = time(NULL);

                timeElapsed = stopTime - starting;

                args->arg2 = (timeElapsed * SONIC_SPEED) / 2;
                printf("Thread %d distance %f", args->arg1, args->arg2);
        }
        return 0;	
}

int getAlldistance()
{
        float distances[5];
        pthread_t threadId;
        struct arg_struct args;

        for (int indexThread = 0; indexThread < 5; indexThread++)
        {
                args.arg1 = indexThread;
                pthread_create(&threadId, NULL, getOneDistance, (void *)&args);
        }
}



