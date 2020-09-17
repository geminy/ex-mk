objects = dog.o cat.o

all: $(objects)

$(objects): %.o: %.c
	gcc -c $< -o $@

.PHONY: clean
clean:
	-rm *.o