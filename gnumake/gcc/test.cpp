#include <stdio.h>

extern "C" void foo();

extern "C" void bar()
{
	printf("%s %s\n", __FILE__, __func__);
}

int main()
{
	foo();

	return 0;
}