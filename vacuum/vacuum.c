#include "config.h"
#include "motor.h"
#include "sensor.h"
#include "display.h"

#include <string.h> 
#include <unistd.h>



int main()
{
    display_init();
    
    //motorPinSetup();
    //sensorPinSetup();
    //getOneDistance();

     while(1)
     {
    //     char direction = getch();
    //     setDirection(direction);
         sleep(0.1);
     }
    // endwin();
    return 0;
} 
