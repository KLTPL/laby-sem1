#pragma once
#include <stdbool.h>

void swap(int *x, int *y);
void print_arr(int a[], int n);

int factorial(int n);
int **create_permutations(int n);

int print_correct_permutations(int **perms, int n,
                               bool (*is_correct)(int *, int));

void free_permutations(int **perms, int n);
