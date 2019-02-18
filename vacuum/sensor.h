#ifndef SENSOR_H
#define SENSOR_H

#include "config.h"

#define TRIG_TIME 0.00001

#define SONIC_SPEED 34300


enum POSITION_ENUM = {ECHO_FRONT,
		      ECHO_FRONT_LEFT, 
		      ECHO_FRONT_RIGHT, 
		      ECHO_REAR_LEFT,
		      ECHO_REAR_RIGHT};

int ECHO_PIN[5] = {PIN_ECHO_FRONT,
		   PIN_ECHO_FRONT_LEFT,
		   PIN_ECHO_FRONT_RIGHT,
		   PIN_ECHO_REAR_LEFT,
		   PIN_ECHO_REAR_RIGHT};


//------------------------------------------------------

int getDistance(int echo_id, int *distance);

int pinSensorSetup();


#endif

