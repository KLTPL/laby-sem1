#include <stdio.h>

int main() {
  int a, b, c;

  printf("Podaj pierwszą liczbę: ");
  scanf("%d", &a);

  printf("Podaj drugą liczbę: ");
  scanf("%d", &b);

  while (b != 0) {
    if (a < b) {
      c = a;
      a = b;
      b = c;
    } else {
      a = a % b;
    }
  }

  printf("NWD = %d\n", a);
  return 0;
}