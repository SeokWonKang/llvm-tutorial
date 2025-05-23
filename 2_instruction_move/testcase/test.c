#include <stdio.h>

int foo(void);

int foo2(int a, int b, int *c, int *d, int count) {
    int addtmp = a * b + a % b;
    if (a < b) {
	addtmp += a;
	*c = c[d[0] + a];
    } else {
	addtmp += b;
	d[0]++;
    }
    addtmp += *(c + count);
    return addtmp;
}

int main(void) { return 0; }
