CC = clang
CFLAGS = -ansi -std=c99 -Wall -O0
LIBFLAGS = -pthread
EXEC = run.exe

faster : countV2.c
	$(CC) $< $(CFLAGS) $(LIBFLAGS) -DTHREADS -DFASTER -o $@.exe
	$(CC) $< $(CFLAGS) $(LIBFLAGS) -DTHREADS -DFASTER -S -o $@.asm

slower : countV2.c
	$(CC) $< $(CFLAGS) $(LIBFLAGS) -DTHREADS -DSLOWER -o $@.exe
	$(CC) $< $(CFLAGS) $(LIBFLAGS) -DTHREADS -DSLOWER -S -o $@.asm

normal : countV2.c
	$(CC) $< $(CFLAGS) $(LIBFLAGS) -DNORMAL -o $@.exe

clean:
	rm -f *.o
	rm -f *.exe
	rm -f *.asm