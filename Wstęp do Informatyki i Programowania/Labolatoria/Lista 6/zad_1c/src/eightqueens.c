#include "eightqueens.h"
#include <stdlib.h>

bool is_permutation_correct_solution(int *perm, int n) {
  int diag_amount = 2 * n - 2;
  bool *diag_sums = (bool *)calloc(diag_amount, sizeof(bool));
  bool *diag_diffs = (bool *)calloc(diag_amount, sizeof(bool));

  for (int c = 0; c < n; c++) {
    int r = perm[c] - 1;

    int sum = r + c;
    int diff = r - c + (n - 1); // (n - 1) - offset bc of negative values
    if (diag_sums[sum] || diag_diffs[diff]) {
      return false;
    }
    diag_sums[sum] = true;
    diag_diffs[diff] = true;
  }

  return true;
}
