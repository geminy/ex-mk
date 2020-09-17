#include <stdio.h>

extern void foo();

void bar()
{
	printf("%s %s\n", __FILE__, __func__);
}

int main()
{
	foo();

	return 0;
}