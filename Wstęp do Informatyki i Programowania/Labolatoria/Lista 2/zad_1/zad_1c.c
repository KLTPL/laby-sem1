#include <stdio.h>
#include <stdbool.h>

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

bool read_int_text(const char* text, int *num) {
  return read_int_custom(text, num, NULL);
}

int GCD(int a, int b) {
  if (a < b) {
    int temp = a;
    a = b;
    b = temp;
  } 
  while (b != 0) {
    int temp = a % b;
    a = b;
    b = temp;
  }
  return a;
}

int main() {
  int a, b;

  if (
    read_int_text("Podaj pierwszą liczbę: ", &a) &&
    read_int_text("Podaj drugą liczbę: ", &b)
  ) {
    printf("NWD = %d\n", GCD(a, b));
  }
  return 0;
}