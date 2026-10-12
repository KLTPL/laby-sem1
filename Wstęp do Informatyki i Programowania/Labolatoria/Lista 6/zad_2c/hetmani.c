#include "str_to_int.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int N;
  int count;
  int *position;
  bool *bije_wiersz;
  bool *bije_przek1;
  bool *bije_przek2;
} State;

void drukuj_rozwiazanie(State *s) {
  s->count++;
  for (int k = 0; k < s->N; k++) {
    printf("%3d", s->position[k]);
  }
  printf("\n");
}

void ustaw(State *s, int i) {
  for (int j = 0; j < s->N; j++) {
    int sum = i + j;
    int diff = i - j + (s->N - 1);

    if (!s->bije_wiersz[j] && !s->bije_przek1[sum] && !s->bije_przek2[diff]) {

      s->position[i] = j + 1;

      s->bije_wiersz[j] = true;
      s->bije_przek1[sum] = true;
      s->bije_przek2[diff] = true;

      if (i < s->N - 1) {
        ustaw(s, i + 1);
      } else {
        drukuj_rozwiazanie(s);
      }

      s->position[i] = 0;
      s->bije_wiersz[j] = false;
      s->bije_przek1[sum] = false;
      s->bije_przek2[diff] = false;
    }
  }
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Program przyjmuje jeden argument N - liczba całkowita, dodatnia "
           "oznaczająca wymiary szachownicy N x N\n");
    return 1;
  }
  int n = 0;
  bool is_converted = str_to_int(argv[1], &n);

  if (n <= 0) {
    printf("Plansza musi mieć dodatnie wymiary\n");
    return 1;
  }

  State state;
  state.N = n;
  state.count = 0;

  state.position = (int *)calloc(state.N, sizeof(int));
  state.bije_wiersz = (bool *)calloc(state.N, sizeof(bool));

  state.bije_przek1 = (bool *)calloc(2 * state.N - 1, sizeof(bool));
  state.bije_przek2 = (bool *)calloc(2 * state.N - 1, sizeof(bool));

  ustaw(&state, 0);

  printf("Ilość rozwiązań: %d\n", state.count);

  free(state.position);
  free(state.bije_wiersz);
  free(state.bije_przek1);
  free(state.bije_przek2);

  return 0;
}
