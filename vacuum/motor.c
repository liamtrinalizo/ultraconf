#include "config.h"
#include "motor.h"

#include <wiringPi.h>

void motorPinSetup()
{
        wiringPiSetup();
        for(int i=0; i < 4; i++)
                pinMode(i, OUTPUT);
}

int setMotorDirection(int right_forward, int right_back, int left_forward, int left_back)
{
        digitalWrite(PIN_MOTOR_FOR_RIGHT, right_forward);
        digitalWrite(PIN_MOTOR_BAC_RIGHT, right_back);
        digitalWrite(PIN_MOTOR_FOR_LEFT,  left_forward);
        digitalWrite(PIN_MOTOR_BAC_LEFT,  left_back);
}

int setDirection(int direction)
{
        switch(direction)
        {
                case 'a':
                        mvprintw(LINES - 2, 0, "You Entered: Forward ");
                        setMotorDirection(1, 0, 1, 0)
                                break;
                case 'w':
                        mvprintw(LINES - 2, 0, "You Entered: Left    ");
                        setMotorDirection(1, 0, 0, 1)
                                break;
                case 's':
                        mvprintw(LINES - 2, 0, "You Entered: Right   ");
                        setMotorDirection(0, 1, 1, 0);
                        break;
                case 'd':
                        mvprintw(LINES - 2, 0, "You Entered: Backward");
                        setMotorDirection(0, 1, 0, 1);
                        break;
                case 'p':
                        mvprintw(LINES - 2, 0, "You Entered: Stop    ");
                        setMotorDirection(0, 0, 0, 0);
                        break;
                default:
                        mvprintw(LINES - 2, 0, "Wrong command        ");
        }
        return 0;
}
