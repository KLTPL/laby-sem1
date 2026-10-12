import math


def findZero(f, a, b, eps):
    while b - a > eps * 2:
        mid = (a + b) / 2.0

        if f(mid) == 0.0:
            return mid
        if f(a) * f(mid) < 0:
            b = mid
        else:
            a = mid
    return (a + b) / 2


def test_fun_cos(x):
    return math.cos(x / 2.0)
