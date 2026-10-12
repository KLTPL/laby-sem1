#include "bisection.h"
#include <math.h>
#include <stdio.h>

const double a = 2.0, b = 4.0, expected_res = M_PI;

int main() {
  printf("Expected result: %f\n", expected_res);
  for (int k = 1; k <= 8; k++) {
    double eps = pow(10, -k);
    double result = findzero(test_fun_cos, a, b, eps);
    double error = fabs(result - expected_res);

    printf("Eps = 10^(%d) = %f\n", -k, eps);
    printf("Res: %.13f\n", result);
    printf("Err: %.13f\n", error);
  }
  return 0;
}
