CC = avr-gcc
CFLAGS = -Os -DF_CPU=16000000UL
TARGET = -mmcu=atmega328p

SRC = grip.c \
      display.c
OBJ=$(SRC:.c=.o)

EXE = grip

SIMLINK = /dev/ttyUSB0


all: $(OBJ)
	$(CC) $(TARGET) $^ -o $(EXE)
	avr-objcopy -O ihex -R .eeprom $(EXE) $(EXE).hex

$(OBJ): %.o: %.c
	$(CC) $(TARGET) $(CFLAGS) -c $< -o $@

flash:
	avrdude -F -V -c arduino -p ATmega328P -P $(SIMLINK) -b 57600 -U flash:w:grip.hex

clean:
	rm -f *.o *.hex 
