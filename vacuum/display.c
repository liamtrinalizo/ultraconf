#include <string.h>
#include <ncurses.h>


int display_init()
{
    char msg[]="The Vacuum Master";
    int row,col;

    initscr();
    getmaxyx(stdscr,row,col);
    
    printw(msg);
    mvprintw(row/2,col/2,"@");

    refresh();
    getch();

    return 0;
}
