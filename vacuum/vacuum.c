#include <ncurses.h>
#include <string.h> 
#include <unistd.h>

#define FOR_RIGHT 0
#define BAC_RIGHT 1
#define FOR_LEFT  2
#define BAC_LEFT  3


int main()
{
    char mesg[]="The Vacuum Master";
    int row,col;
    
    initscr();				                /* start the curses mode */
    getmaxyx(stdscr,row,col);		        /* get the number of rows and columns */
    mvprintw(row/2,(col-strlen(mesg))/2,"%s",mesg);
    //mvprintw(LINES - 2, 0, "Waiting direction (wasd) ...");
    wiringPiSetup();
    for(int i=0; i < 4; i++)
        pinMode(i, OUTPUT);

    while(1)
    {
        char direction = getch();
        switch(direction)
        {
        case 'w':
            mvprintw(LINES - 2, 0, "You Entered: Forward ");
            digitalWrite(FOR_RIGHT, 1);
            digitalWrite(BAC_RIGHT, 0);
            digitalWrite(FOR_LEFT,  1);
            digitalWrite(BAC_LEFT,  0);
            break;
        case 'a':
            mvprintw(LINES - 2, 0, "You Entered: Left    ");
            digitalWrite(FOR_RIGHT, 1);
            digitalWrite(BAC_RIGHT, 0);
            digitalWrite(FOR_LEFT,  0);
            digitalWrite(BAC_LEFT,  1);

            break;
        case 's':
            mvprintw(LINES - 2, 0, "You Entered: Right   ");
            digitalWrite(FOR_RIGHT, 0);
            digitalWrite(BAC_RIGHT, 1);
            digitalWrite(FOR_LEFT,  1);
            digitalWrite(BAC_LEFT,  0);
           break;
        case 'd':
            mvprintw(LINES - 2, 0, "You Entered: Backward");
            digitalWrite(FOR_RIGHT, 0);
            digitalWrite(BAC_RIGHT, 1);
            digitalWrite(FOR_LEFT,  0);
            digitalWrite(BAC_LEFT,  1);
           break;
        default:
            mvprintw(LINES - 2, 0, "Wrong command        ");
        }
        sleep(1);
    }
    endwin();
    return 0;
} 
