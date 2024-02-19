#include <stdio.h>
#include "../static/example1/test.h"
#include "../shared/example1/shared1.h"

int main(void)
{
    do_thing();
    test_shared1();
    printf("Main\n");
    return 0;
}
