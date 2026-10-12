from src import bisection
import math


def main():
    a = 2.0
    b = 4.0
    exact_root = math.pi
    print(f"expected result: {exact_root}")
    for k in range(1, 9):
        eps = 10 ** (-k)

        result = bisection.findZero(bisection.test_fun_cos, a, b, eps)

        error = abs(result - exact_root)

        print(f"esp: 10^(-{k}) = {eps:.13f}")
        print(f"res: {result:.13f}")
        print(f"err: {error:.13f}")


if __name__ == "__main__":
    main()
