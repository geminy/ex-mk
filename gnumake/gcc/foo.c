#include <stdio.h>

void foo();
void bar();

void foo()
{
	printf("%s %s\n", __FILE__, __func__);
	bar();
}

void bar()
{
	printf("%s %s\n", __FILE__, __func__);
}