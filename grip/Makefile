CC = avr-gcc
CFLAGS = -Os -DF_CPU=16000000UL
TARGET = -mmcu=atmega328p

SRC = grip.c

SIMLINK = /dev/ttyUSB0

all: $(SRC)
	$(CC) $(TARGET) $(CFLAGS) -c -o grip.o $^
	$(CC) $(TARGET) grip.o -o grip
	avr-objcopy -O ihex -R .eeprom grip grip.hex

flash:
	avrdude -F -V -c arduino -p ATmega328P -P $(SIMLINK) -b 57600 -U flash:w:grip.hex

clean:
	rm -f *.o *.hex 
