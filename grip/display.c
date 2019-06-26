#include <avr/io.h>


void displayReset()
{
    PORTB = 0;
    PORTC = 0;
    PORTD = 0;
}

void displayUnit(int number)
{
    switch (number)
    {
        case 0:
            PORTB |= 0b00011110;
            PORTD |= 0b10100000;
            break;
        case 1:
            PORTB |= 0b00010010;
            break;
        case 2:
            PORTB |= 0b00011101;
            PORTD |= 0b00100000;
            break;
        case 3:
            PORTB |= 0b00010111;
            PORTD |= 0b00100000;
            break;
        case 4:
            PORTB |= 0b00010011;
            PORTD |= 0b10000000;
            break;
        case 5:
            PORTB |= 0b00000111;
            PORTD |= 0b10100000;
            break;
        case 6:
            PORTB |= 0b00001111;
            PORTD |= 0b10100000;
            break;
        case 7:
            PORTB |= 0b00010110;
            break;
        case 8:
            PORTB |= 0b00011111;
            PORTD |= 0b10100000;
            break;
        case 9:
            PORTB |= 0b00010111;
            PORTD |= 0b10100000;
            break;
    }
}

void displayTens(int number)
{
    switch (number)
    {
        case 0:
            PORTB |= 0b00100000;
            PORTC |= 0b00000011;
            PORTD |= 0b01011000;
            break;
        case 1:
            PORTD |= 0b00011000;
            break;
        case 2:
            PORTB |= 0b00100000;
            PORTC |= 0b00000010;
            PORTD |= 0b01010100;
            break;
        case 3:
            PORTB |= 0b00100000;
            PORTD |= 0b01011100;
            break;
        case 4:
            PORTC |= 0b00000001;
            PORTD |= 0b00011100;
            break;
        case 5:
            PORTB |= 0b00100000;
            PORTC |= 0b00000001;
            PORTD |= 0b01001100;
            break;
        case 6:
            PORTB |= 0b00100000;
            PORTC |= 0b00000011;
            PORTD |= 0b01001100;
            break;
        case 7:
            PORTD |= 0b01011000;
            break;
        case 8:
            PORTB |= 0b00100000;
            PORTC |= 0b00000011;
            PORTD |= 0b01011100;
            break;
        case 9:
            PORTB |= 0b00100000;
            PORTC |= 0b00000001;
            PORTD |= 0b01011100;
            break;
    }
}

void displaySuccess()
{


}
    

