#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>

extern "C" double compare();

int main(int argc, char *argv[])
{
    printf("Welcome to Floating Points Numbers programmed by Michael Ball.\n");
    double answer = compare();
    std::cout << "Answer that was returned to driver " << answer << std::endl;
    return 0;
}