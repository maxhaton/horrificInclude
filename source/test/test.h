//Here is a header file
#define TEST
#include <second.h>
#ifdef TEST
char y[] = "The te\
sest\n";

#endif

int* getMeAPointer();
/*
    Big comment that should be ignored;
 */

struct test {
    int x;
    long y;
    double g;
};

#include <second.h>