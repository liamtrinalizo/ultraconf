#include <avr/io.h>
#include <util/delay.h>

#define DELAY_MS 1000

#define B

int main (void)
{
    // L led
    //DDRB |=  _BV(DDB5);

    // 7-segments led
    DDRD =  0xFF; 
    DDRB |= _BV(DDB0 |
                DDB1 |
                DDB2 |
                DDB3 |
                DDB4); 

    // button
    //DDRD &= ~_BV(DDD2);

    while (1) 
    {
        //if ((PIND >> 2) && 1)
        //    PORTB &=  _BV(PORTB5);
        //else
        //    PORTB |= ~_BV(PORTB5);

        PORTD |= ~_BV(PORTD3 |
                      PORTD3 |
                      PORTD4 |
                      PORTD5 |
                      PORTD6 |
                      PORTD7);
        PORTB |= ~_BV(PORTB0 |
                      PORTB1 |
                      PORTB2 |
                      PORTB3 |
                      PORTB4);
        _delay_ms(DELAY_MS);

        PORTD &=  _BV(PORTD3 |
                      PORTD3 |
                      PORTD4 |
                      PORTD5 |
                      PORTD6 |
                      PORTD7);
        PORTB &=  _BV(PORTB0 |
                      PORTB1 |
                      PORTB2 |
                      PORTB3 |
                      PORTB4);
        _delay_ms(DELAY_MS);
    }
}

