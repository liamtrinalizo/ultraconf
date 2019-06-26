#include <avr/io.h>
#include <util/delay.h>

#include "display.h"

#define DELAY_MS 1000

int main (void)
{
    // 7-segments led
    DDRD =  0xFF;
    DDRB =  0xFF;
    DDRC =  0x03;

    displayUnit(0);
    displayTens(0);
    
    int count = 0;

    while (1)
    {
        if (PINC & 0x04)
        {
            count++;

            displayReset();
            displayUnit(count % 10);
            displayTens(count / 10);
            _delay_ms(DELAY_MS);
        }
    }
}

