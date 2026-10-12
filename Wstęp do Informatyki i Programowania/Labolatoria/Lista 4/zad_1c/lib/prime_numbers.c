#include <math.h>
#include <stdbool.h>
#include <stdio.h>
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

unsigned prime_numbers(unsigned n) {
  bool *sieve = (bool *)malloc((n + 1) * sizeof(bool));

  if (sieve == NULL) {
    fprintf(stderr, "Błąd: Za mało pamięci n = %u\n", n);
    return 2;
  }

  compute_sieve(sieve, n);
  unsigned result = count_primes(sieve, n);
  return result;
}

unsigned prime(unsigned n) {
  if (n < 1)
    return 0;
  if (n == 1)
    return 2;

  unsigned *primes = (unsigned *)malloc(n * sizeof(unsigned));

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

bool is_prime(unsigned n) {
  if (n == 2) {
    return true;
  }
  if (n <= 1 || n % 2 == 0) {
    return false;
  }

  int num_sqrt = sqrt(n);
  for (int curr = 3; curr <= num_sqrt; curr += 2) {
    if (n % curr == 0) {
      return false;
    }
  }

  return true;
}

bool prime_numbers_check_args(int n) {
  bool res = n >= 2;
  if (!res) {
    printf("Błąd: n nie spełnia warunku n >= 2\n");
  }
  return res;
}
bool prime_check_args(int n) {
  bool res = n >= 1;
  if (!res) {
    printf("Błąd: n nie spełnia warunku n >= 1\n");
  }
  return n >= 0;
}
bool is_prime_check_args(int n) {
  bool res = n >= 0;
  if (!res) {
    printf("Błąd: n nie spełnia warunku n >= 0\n");
  }
  return n >= 0;
}
