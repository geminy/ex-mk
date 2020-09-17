objects = main.o circle.o

main: $(objects)
	gcc -o main $(objects)

main.o: circle.h
circle.o: circle.h def.h

.PHONY: clean
clean:
	-rm main $(objects)