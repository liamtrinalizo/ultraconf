#ifndef DISPLAY_H
#define DISPLAY_H

//         +----------------+
//         |                |
//    PD   |1     10      10|  PD
//    PD   |2    2|¯|9     9|  PD
//    GND  |3*    1-      *8|  GND
//    PD   |4    4|_|7     7|  PD
//    PD   |5      5   o6  6|  PD
//         |                |
//         +----------------+

//
// #define PINB  _SFR_IO8(0x03)
// #define DDRB  _SFR_IO8(0x04)
// #define PORTB _SFR_IO8(0x05)
//
// #define PINC  _SFR_IO8(0x06)
// #define DDRC  _SFR_IO8(0x07)
// #define PORTC _SFR_IO8(0x08)
//
// #define PIND  _SFR_IO8(0x09)
// #define DDRD  _SFR_IO8(0x0A)
// #define PORTD _SFR_IO8(0x0B)

//
// (*(volatile uint8_t *)0x25)
//

#define SEG1_A   9
#define SEG1_B   11
#define SEG1_C   8
#define SEG1_D   4
#define SEG1_E   10
#define SEG1_F   6
#define SEG1_G   7

#define SEG10_A  5
#define SEG10_B  3
#define SEG10_C  2
#define SEG10_D  12
#define SEG10_E  14
#define SEG10_F  13
#define SEG10_G  1


#endif
