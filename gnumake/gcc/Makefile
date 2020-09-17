default: testc testcpp

libfoo:
	gcc -shared -fpic foo.c -o libfoo.so

testc: libfoo
	gcc test.c -L. -lfoo -o testc

testcpp: libfoo
	gcc test.cpp -L. -lfoo -o testcpp

clean:
	rm -f libfoo.so
	rm -f testc testcpp

run: test
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./testc
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./testcpp