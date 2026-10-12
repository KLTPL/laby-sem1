#include "permutations.h"
#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
  int temp = *x;
  *x = *y;
  *y = temp;
}

void print_arr(int a[], int n) {
  for (int i = 0; i < n; i++) {
    printf("%3d ", a[i]);
  }
  printf("\n");
}

int factorial(int n) {
  int f = 1;
  for (int i = 1; i <= n; i++)
    f *= i;
  return f;
}

int **create_permutations(int n) {
  int permutations_amount = factorial(n);
  int **res = (int **)(malloc(permutations_amount * sizeof(int *)));
  for (int i = 0; i < permutations_amount; i++) {
    res[i] = (int *)calloc(n, sizeof(int));
  }
  size_t res_size = 0;
  int *stack = (int *)calloc(n, sizeof(int));
  int *curr = (int *)calloc(n, sizeof(int));
  for (int i = 0; i < n; i++) {
    curr[i] = i + 1;
  }
  // printArr(curr, n);
  for (int i = 0; i < n; i++) {
    res[res_size][i] = curr[i];
  }
  res_size++;
  int i = 0;
  while (i < n) {
    if (stack[i] < i) {
      if (i % 2 == 0) {
        swap(&curr[0], &curr[i]);
      } else {
        swap(&curr[stack[i]], &curr[i]);
      }

      // printArr(curr, n);
      for (int j = 0; j < n; j++) {
        res[res_size][j] = curr[j];
      }
      // printf("1\n");
      res_size++;

      stack[i] += 1;

      i = 0;
    } else {
      stack[i] = 0;
      i += 1;
    }
  }

  free(stack);
  free(curr);

  return res;
}

int print_correct_permutations(int **perms, int n,
                               bool (*is_correct)(int *, int)) {
  int count = 0;
  for (int r = 0; r < factorial(n); r++) {
    if (is_correct(perms[r], n)) {
      count++;
      print_arr(perms[r], n);
    }
  }
  return count;
}

void free_permutations(int **perms, int n) {

  for (int i = 0; i < factorial(n); i++) {
    free(perms[i]);
  }
  free(perms);
}
