#include <alloca.h>
#include <stdio.h>

int myentrypoint(void) {
    int *p = alloca(1);
    printf("Address on stack: %p\n", p);
    return myentrypoint();
}
