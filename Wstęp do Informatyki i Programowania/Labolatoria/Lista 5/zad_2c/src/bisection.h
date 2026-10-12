#pragma once

typedef double (*functype)(double);

double findzero(functype f, double a, double b, double eps);

double test_fun_cos(double x);
