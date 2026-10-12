#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

void compute_sieve(bool s[], unsigned n) {
  for (unsigned i = 2; i <= n; i++) {
    s[i] = true;
  }

  for (unsigned i = 2; i * i <= n; i++) {
    if (s[i]) {
      for (unsigned j = i * i; j <= n; j += i) {
        s[j] = false;
      }
    }
  }
}

unsigned count_primes(bool s[], unsigned n) {
  unsigned count = 0;
  for (unsigned i = 2; i <= n; i++) {
    if (s[i]) {
      count++;
    }
  }
  return count;
}

bool read_int_custom(const char* text, int *num, const char* error_message) {
  printf("%s", text == NULL ? "Podaj liczbę: " : text);
  int amount = scanf("%d", num);
  bool is_read = amount == 1;
  if (!is_read) {
    const char* error = 
      error_message == NULL ? 
      "Nie udało się wczytać liczby\n" : 
      error_message;
    fprintf(stderr, "%s", error);
  }
  return is_read;
}

int main() {
  int n_input;
  unsigned n;

  printf("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]\n");

  if (
    !read_int_custom(
      "Podaj liczbe naturalna n: ", 
      &n_input, 
      "Błąd: podano niepoprawną liczbę\n"
    )
  ) {
    return 1;
  }

  if (n_input < 2) {
    printf("n musi być >= 2 żeby tworzyło poprawny zakres [2, n]\n");
    return 0;
  }

  n = (unsigned)n_input;

  bool *sieve = (bool*)malloc((n + 1) * sizeof(bool));

  if (sieve == NULL) {
    fprintf(stderr, "Błąd: Za mało pamięci n = %u\n", n);
    return 2;
  }

  compute_sieve(sieve, n);
  unsigned result = count_primes(sieve, n);

  printf("Liczba liczb pierwszych w zakresie [2, %u] wynosi: %u\n", n, result);

  free(sieve);

  return 0;
}