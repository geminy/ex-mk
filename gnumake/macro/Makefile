ifeq ($(BUILD_COV_INSTRUMENT), True)
	CFLAGS += -DBUILD_COV_INSTRUMENT
endif

.PHONY: obj
obj: test

test: test.o
	gcc -o $@ $^

%.o: %.c
	@echo $(BUILD_COV_INSTRUMENT)
	gcc $(CFLAGS) -c $<
	
clean:
	-rm -f *.o
	-rm -f test
