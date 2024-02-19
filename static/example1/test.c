#include <stdio.h>
#include "test.h"

int addi(int a, int b)
{
    return a + b;
}
void do_thing()
{
    printf("Does thing, static: %d\n", addi(1,2));
}
