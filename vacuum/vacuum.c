#include "config.h"
#include "motor.h"
#include "sensor.h"

#include <ncurses.h>
#include <string.h> 
#include <unistd.h>



int main()
{
    char mesg[]="The Vacuum Master";
    int row,col;

    //initscr();                       /* start the curses mode */
    //getmaxyx(stdscr,row,col);        /* get the number of rows and columns */
    //mvprintw(row/2,(col-strlen(mesg))/2,"%s",mesg);

    motorPinSetup();
    sensorPinSetup();
    getOneDistance();

    // while(1)
    // {
    //     char direction = getch();
    //     setDirection(direction);
    //     sleep(0.1);
    // }
    // endwin();
    return 0;
} 
