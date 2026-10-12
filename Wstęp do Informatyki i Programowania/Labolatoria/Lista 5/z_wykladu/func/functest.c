#include <stdio.h>
#include <math.h>
typedef double (*functype)(double);
void write(functype f, double x) {
  printf("%f\n", f(x));
}
double square1(double x) {
  return (x-1.0)*(x+2.0);
}
int main() {
  double x;
  scanf("%lf", &x);
  write(sin, x);
  write(cos, x);
  write(sqrt, x);
  write(square1, x);
  return 0;
}
