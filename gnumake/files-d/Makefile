sources:=$(wildcard *.c)
objects=$(sources:.c=.o)

all: main

%.d: %.c
	rm -f $@
	gcc -MM $< > tmp
	sed 's,\($*\)\.o,\1.o $@,g' < tmp > $@
	rm -f tmp

sinclude $(sources:.c=.d)

main: $(objects)
	gcc -o main $^

.PHONY: clean
clean:
	-rm -f main *.o *.d