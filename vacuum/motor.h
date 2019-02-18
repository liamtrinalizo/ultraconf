#ifndef MOTOR_H
#define MOTOR_H

void motorPinSetup();

int setMotorDirection(int right_forward, int right_back, int left_forward, int left_back);

int setDirection(int direction);

#endif
