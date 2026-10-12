#include <math.h>
#include <stdio.h>

int main() {
  int n, p, m, t;


  printf("Podaj liczbę n: ");
  scanf("%d", &n);

  printf("Podaj podstawę p: ");
  scanf("%d", &p);

  if (p <= 1) {
    printf("p musi spełniać warunek: p >= 2");
    return;
  }
  m = 0;
  t = n;

  while (t > 0) {
    m = p * m + (t % p);
    t = t / p;
  }
  
  if (n == m) {
    printf("Jest palindromem\n");
  } else {
    printf("Nie jest palindromem\n");
  }
  
  return 0;
}