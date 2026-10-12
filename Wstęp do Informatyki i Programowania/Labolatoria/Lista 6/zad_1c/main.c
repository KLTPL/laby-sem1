#include "eightqueens.h"
#include "permutations.h"
#include "str_to_int.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc <= 1) {
    fprintf(stderr, "Program przyjmuje jeden argument N - liczba całkowita, "
                    "dodatnia oznaczająca wymiary szachownicy N x N\n");
    return 1;
  }
  int n;
  bool is_converted = str_to_int(argv[1], &n);
  if (!is_converted) {
    fprintf(stderr, "Błędnie podana liczba\n");
    return 1;
  }
  if (n <= 0) {
    fprintf(stderr, "Plansza musi mieć dodatnie wymiary\n");
    return 1;
  }
  int **perms = create_permutations(n);
  int count =
      print_correct_permutations(perms, n, is_permutation_correct_solution);
  printf("Liczba rozwiązań: %d\n", count);
  free_permutations(perms, n);
  return 0;
}
