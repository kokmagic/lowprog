#include "grayCode.h"
#include <stddef.h>

int main( int n ) {
    int m = 1;
    for (int i = 0; i < n; i++) {
        m *= 2;
    }

    unsigned grayCode[m][n];
    grayCode[0][n - 1] = 0;
    grayCode[1][n - 1] = 1;
    int p = 2;
    for (int i = 1; i < n; i++) {
        int t = p - 1;
        int k = p;
        p *= 2;
        for (; k < p; k++) {
            for (int row = 0; row < n; row++) {
                grayCode[k][row] = grayCode[t][row];
            }

            grayCode[t][n - i - 1] = 0;
            grayCode[k][n - i - 1] = 1;
            t--;
        }
    }
    return 0;
}