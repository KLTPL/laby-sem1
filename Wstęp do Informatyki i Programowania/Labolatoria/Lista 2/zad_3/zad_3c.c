#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool read_int_custom(const char* text, int *num, const char* error_message) {
  printf("%s", text == NULL ? "Podaj liczbę: " : text);
  int amount = scanf("%d", num);
  bool is_read = amount == 1;
  if (!is_read) {
    const char* error = 
      error_message == NULL ? 
      "Nie udało się wczytać liczby\n" : 
      error_message;
    printf("%s", error);
  }
  return is_read;
}

bool read_int(int *num) {
  return read_int_custom(NULL, num, NULL);
}

void print_prime_factors(int num) {
  if (num <= 1) {
    printf("Brak czynników pierwszych\n");
    return;
  }
  printf("%d = ", num);

  int exp = 0; // expoment
  while (num % 2 == 0) {
    exp++;
    num = num / 2;
  }
  if (exp > 0) {
    printf("2");
    if (exp > 1) {
      printf("^%d", exp);
    }
    if (num > 1) {
      printf("*");
    }
  }

  int num_sqrt = sqrt(num);
  for (int curr = 3; curr <= num_sqrt; curr += 2) {
    exp = 0;
    while (num % curr == 0) {
      num /= curr;
      exp++;
    }
    if (exp > 0) {
      printf("%d", curr);
      if (exp > 1) {
        printf("^%d", exp);
      }
      if (num > 1) {
        printf("*");
      }
    }
  }
  if (num > 1) {
    printf("%d", num);
  }
  printf("\n");
}

int main() {
  int num;

  printf("Program wypisujący rozkład na czynniki pierwsze\n");
  if (read_int(&num)) {
    print_prime_factors(num);
  }
  return 0;
}