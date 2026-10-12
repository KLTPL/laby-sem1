#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

unsigned long long binomial_coefficient(unsigned n, unsigned k) {
  if (k > n / 2) {
    k = n - k;
  }

  unsigned long long *C =
      (unsigned long long *)calloc(k + 1, sizeof(unsigned long long));

  if (C == NULL) {
    fprintf(stderr, "Blad: Nie udalo sie zaalokować pamieci!\n");
    exit(2);
  }

  C[0] = 1;

  for (unsigned i = 1; i <= n; i++) {
    unsigned limit = (i < k) ? i : k;

    for (unsigned j = limit; j > 0; j--) {
      C[j] = C[j] + C[j - 1];
    }
  }

  unsigned long long result = C[k];

  free(C);

  return result;
}

bool read_int_custom(const char *text, int *num, const char *error_message) {
  printf("%s", text == NULL ? "Podaj liczbę: " : text);
  int amount = scanf("%d", num);
  bool is_read = amount == 1;
  if (!is_read) {
    const char *error = error_message == NULL ? "Nie udało się wczytać liczby\n"
                                              : error_message;
    fprintf(stderr, "%s", error);
  }
  return is_read;
}

bool read_unsigned_custom(const char *text, unsigned *num,
                          const char *error_message) {
  int input_int;
  if (!read_int_custom(text, &input_int, error_message)) {
    return false;
  }

  if (input_int < 0) {
    fprintf(stderr, "Błąd: liczba musi być naturalna (czyli >=0)\n");
    return false;
  }

  *num = (unsigned)input_int;
  return true;
}

int main() {
  unsigned n, k;

  printf("Program obliczajacy dwumian newtona dla n, k\n");

  if (!read_unsigned_custom("Podaj n: ", &n, NULL)) {
    return 1;
  }

  if (!read_unsigned_custom("Podaj k: ", &k, NULL)) {
    return 1;
  }

  if (k > n) {
    fprintf(stderr, "Błąd: k > n\n");
    return 1;
  }

  unsigned long long result = binomial_coefficient(n, k);

  printf("Wynik: %llu\n", result);

  return 0;
}
