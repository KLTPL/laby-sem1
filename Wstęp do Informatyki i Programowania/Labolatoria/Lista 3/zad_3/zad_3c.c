#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

unsigned find_nth_prime(unsigned n) {
  if (n < 1) return 0;
  if (n == 1) return 2;

  unsigned *primes = (unsigned*)malloc(n * sizeof(unsigned));

  if (primes == NULL) {
    fprintf(stderr, "Błąd: Za mało pamięci\n");
    exit(2);
  }

  primes[0] = 2;
  
  unsigned count = 1;
  unsigned candidate = 3;

  while (count < n) {
    bool is_prime = true;
    
    for (unsigned i = 0; count > i; i++) {
      unsigned long long p = primes[i];
      
      is_prime = candidate % p != 0;
      if (p * p > candidate || !is_prime) {
        break;
      }
    }

    if (is_prime) {
      primes[count] = candidate;
      count++;
    }

    candidate += 2;
  }

  unsigned result = primes[n - 1];

  free(primes);

  return result;
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

bool read_unsigned_custom(const char* text, unsigned *num, const char* error_message) {
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
  unsigned n;

  printf("Program obliczający n-tą liczbę pierwszą\n");

  if (
    !read_unsigned_custom(
      "Podaj n: ", 
      &n, 
      NULL
    )
  ) {
    return 1;
  }

  if (n == 0) {
    fprintf(stderr, "Błąd: n musi być liczbą naturalną > 0\n");
    return 1;
  } 

  unsigned result = find_nth_prime(n);

  printf("Wynik: %u\n", result);

  return 0;
}