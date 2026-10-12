#include <stdbool.h>
#include <stdio.h>

#define CODE_LEN 4
#define NUM_COLORS 6
#define TOTAL_CODES 1296
#define MARKER -1

void get_feedback(int guess[], int secret[], int *res_correct, int *res_wrong) {
  int correct_place = 0;
  int wrong_place = 0;
  int g_temp[CODE_LEN];
  int s_temp[CODE_LEN];

  for (int i = 0; i < CODE_LEN; i++) {
    g_temp[i] = guess[i];
    s_temp[i] = secret[i];
  }

  for (int i = 0; i < CODE_LEN; i++) {
    if (g_temp[i] == s_temp[i]) {
      correct_place++;
      g_temp[i] = MARKER;
      s_temp[i] = MARKER;
    }
  }

  for (int i = 0; i < CODE_LEN; i++) {
    if (g_temp[i] != MARKER) {
      for (int j = 0; j < CODE_LEN; j++) {
        if (s_temp[j] != MARKER && s_temp[j] == g_temp[i]) {
          wrong_place++;
          s_temp[j] = MARKER;
          break;
        }
      }
    }
  }

  *res_correct = correct_place;
  *res_wrong = wrong_place;
}

int main() {
  int codes[TOTAL_CODES][CODE_LEN];
  bool is_possible[TOTAL_CODES];
  int idx = 0;

  for (int i = 1; i <= NUM_COLORS; i++) {
    for (int j = 1; j <= NUM_COLORS; j++) {
      for (int k = 1; k <= NUM_COLORS; k++) {
        for (int l = 1; l <= NUM_COLORS; l++) {
          codes[idx][0] = i;
          codes[idx][1] = j;
          codes[idx][2] = k;
          codes[idx][3] = l;
          is_possible[idx] = true;
          idx++;
        }
      }
    }
  }

  int attempt = 1;
  int correct_place, wrong_place;
  int sim_correct, sim_wrong;

  while (true) {
    int current_guess_idx = -1;
    for (int i = 0; i < TOTAL_CODES; i++) {
      if (is_possible[i]) {
        current_guess_idx = i;
        break;
      }
    }

    if (current_guess_idx == -1) {
      printf("Oszukujesz !\n");
      break;
    }

    printf("%d: %d %d %d %d ?\n", attempt, codes[current_guess_idx][0],
           codes[current_guess_idx][1], codes[current_guess_idx][2],
           codes[current_guess_idx][3]);

    printf("Na swoim miejscu : ");
    if (scanf("%d", &correct_place) != 1) {
      while (getchar() != '\n')
        ;
      continue;
    }

    if (correct_place == CODE_LEN) {
      printf("Wygrałem .\n");
      break;
    }

    printf("Nie na swoim miejscu : ");
    if (scanf("%d", &wrong_place) != 1) {
      while (getchar() != '\n')
        ;
      continue;
    }

    for (int i = 0; i < TOTAL_CODES; i++) {
      if (is_possible[i]) {
        get_feedback(codes[current_guess_idx], codes[i], &sim_correct,
                     &sim_wrong);

        if (sim_correct != correct_place || sim_wrong != wrong_place) {
          is_possible[i] = false;
        }
      }
    }

    attempt++;
  }

  return 0;
}
