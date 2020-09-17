#include <stdio.h>

int main()
{
#ifdef BUILD_COV_INSTRUMENT
	printf("defined\n");
#else
	printf("undefined\n");
#endif

	return 0;
}
