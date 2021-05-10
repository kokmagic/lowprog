#include "pow2.h"
#include <stdio.h>

int pow2 ( int pow ) {
    int result = 1;
    for (int i = 0; i < pow; i++) {
        result *= 2;
    }

    return result;
}