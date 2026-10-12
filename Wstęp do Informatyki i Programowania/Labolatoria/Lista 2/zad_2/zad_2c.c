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

bool is_prime(int num) {
  if (num == 2) {
    return true;
  }
  if (num <= 1 || num % 2 == 0) {
    return false;
  } 
  
  int num_sqrt = sqrt(num);
  for (int curr = 3; curr <= num_sqrt; curr += 2) {
    if (num % curr == 0) {
      return false;
    }
  }

  return true;
}

int main() {
  printf("Program sprawdzający czy liczba jest pierwsza\n");
  int num;
  
  if (read_int(&num)) {
    if (is_prime(num)) {
      printf("Liczba jest pierwsza\n");
    } else {
      printf("Liczba NIE jest pierwsza\n");
    }
  }

  
  return 0;
}