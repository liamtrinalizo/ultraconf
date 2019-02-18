CC = gcc
CFLAGS = -W -Wall -lncurses
LDFLAGS = -lncurses

EXEC = vacuum

SOURCES = vacuum.c

vacuum:
	$(CC) $(CFLAGS) $(SOURCES) -o $@

clean:
	rm -f *.o
	rm -f $(EXEC)
