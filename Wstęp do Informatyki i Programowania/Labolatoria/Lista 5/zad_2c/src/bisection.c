#include <math.h>

#include "bisection.h"

double findzero(functype f, double a, double b, double eps) {
  double mid;

  while (b - a > eps * 2.0) {
    mid = (b + a) / 2.0;

    if (f(mid) == 0.0) {
      return mid;
    }

    if (f(a) * f(mid) < 0.0) {
      b = mid;
    } else {
      a = mid;
    }
  }
  return (a + b) / 2.0;
}

double test_fun_cos(double x) { return cos(x / 2.0); }
