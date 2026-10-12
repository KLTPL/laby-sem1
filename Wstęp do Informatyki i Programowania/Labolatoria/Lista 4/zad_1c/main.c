#include "lib/prime_numbers.h"
#include "lib/str_to_int.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Błędna ilośc argumentów\n");
    fprintf(stderr, "Sposób użycia: %s <funkcja> <n> \n", argv[0]);
    fprintf(stderr, "Przykład: %s pn 100\n", argv[0]);
    return 1;
  }

  int n_input;

  bool is_converted = str_to_int(argv[2], &n_input);

  if (!is_converted) {
    fprintf(stderr, "Nieprawidłowy format liczby n\n");
    return 1;
  }

  if (strcmp(argv[1], "pn") == 0) {
    printf("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]\n");
    if (!prime_numbers_check_args(n_input)) {
      return 1;
    }

    unsigned n = (unsigned)n_input;
    unsigned result = prime_numbers(n);
    printf("Wynik: %d\n", result);
  } else if (strcmp(argv[1], "pr") == 0) {
    printf("Program obliczający n-tą liczbę pierwszą\n");
    if (!prime_check_args(n_input)) {
      return 1;
    }

    unsigned n = (unsigned)n_input;
    unsigned result = prime(n);
    printf("Wynik: %d\n", result);
  } else if (strcmp(argv[1], "ip") == 0) {
    printf("Program sprawdzający czy liczba n jest pierwsza\n");
    if (!is_prime_check_args(n_input)) {
      return 1;
    }

    unsigned n = (unsigned)n_input;
    bool result = is_prime(n);
    printf("Wynik: %s\n", result ? "Jest pierwsza" : "NIE jest pierwsza");
  } else {
    printf("Błędna operacja: %s\n", argv[1]);
    return 1;
  }

  return 0;
}
