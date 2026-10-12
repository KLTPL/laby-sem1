#include <math.h>
#include <stdio.h>

int main() {
  float a, b, c, delta;


  printf("Program liczący rówanie kwadratowe: a*x^2 + b*x + c = 0\n");
  printf("a = ");
  scanf("%f", &a);

  if (a == 0) {
    printf("To nie jest równanie kwadratowe (a = 0)\n");
    return 0;
  }

  printf("b = ");
  scanf("%f", &b);

  printf("c = ");
  scanf("%f", &c);

  delta = b * b - 4.0f * a * c;

  
  if (delta < 0) {
    printf("Brak rozwiązań rzeczywistych\n");
  } else if (delta == 0) {
    float x0 = -b / (2.0f * a);
    printf("Jedno rozwiązanie:\n");
    printf("x0 = %f\n", x0);
  } else {
    float sqrt_delta = sqrtf((double)delta);
    float x1 = (-b - sqrt_delta) / (2.0f * a);
    float x2 = (-b + sqrt_delta) / (2.0f * a);
    printf("Dwa rozwiązania:\n");
    printf("x1 = %f\n", x1);
    printf("x2 = %f\n", x2);
  }
  
  return 0;
}