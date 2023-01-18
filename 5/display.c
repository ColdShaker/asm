#include <stddef.h>
#include <stdio.h>

extern void display(double *array, size_t start, size_t len);

void display(double *array, size_t start, size_t len) {
  for (size_t i = start; i < start + len; i++) {
    printf("%lf\n", array[i]);
  }
}