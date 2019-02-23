#ifndef SENSOR_H
#define SENSOR_H

#include "config.h"

#define TRIG_TIME 0.00001

#define SONIC_SPEED 34300

void *getOneDistance(void *arguments)

int getAllDistance();

int pinSensorSetup();


#endif

