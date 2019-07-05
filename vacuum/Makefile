CC := gcc
CFLAGS :=   -lncurses \
	    -lpthread \
#	    -lwiringPi \
#	    -lwiringPiDev

SRC :=  vacuum.c  \
	display.c \
#	motor.c   \
#	sensor.c  \

OBJ := vac

all:
	$(CC) $(CFLAGS) $(SRC) -o $(OBJ)

clean:
	$(RM) *.o vac
