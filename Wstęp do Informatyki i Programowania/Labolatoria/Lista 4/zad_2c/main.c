#include "lib/str_to_int.h"
#include "lib/totient.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Błędna ilośc argumentów\n");
    fprintf(stderr, "Sposób użycia: %s n1, n2, n3, ...\n", argv[0]);
    fprintf(stderr, "Przykład: %s 1 11 100 5000 12345678\n", argv[0]);
    return 1;
  }

  for (int i = 1; i < argc; i++) {
    int n;
    int is_converted = str_to_int(argv[i], &n);

    if (!is_converted) {
      fprintf(stderr, "Nieprawidłowy format liczby: %s\n", argv[i]);
    } else if (n <= 0) {
      fprintf(stderr, "Liczba %s nie spełnia warunku n > 0\n", argv[i]);
    } else {
      printf("totient(%d) = %d\n", n, totient(n));
    }
  }

  return 0;
}
