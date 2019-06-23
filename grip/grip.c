#include <avr/io.h>
#include <util/delay.h>

#define DELAY_MS 10

int main (void)
{
    DDRB |=  _BV(DDB5);
    DDRD &= ~_BV(DDD2);

    while (1) 
    {
        if ((PIND >> 2) && 1)
            PORTB |=  _BV(PORTB5);
        else
            PORTB &= ~_BV(PORTB5);

        _delay_ms(DELAY_MS);
    }
}

