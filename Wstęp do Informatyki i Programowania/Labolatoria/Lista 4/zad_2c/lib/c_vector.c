#include <stdio.h>
#include <stdlib.h>
#include "c_vector.h"

void init_vector(IntVector *v) {
  v->data = NULL;
  v->size = 0;
  v->capacity = 0;
}

void append_vector(IntVector *v, int value) {
  if (v->size == v->capacity) {
    v->capacity = (v->capacity == 0) ? 4 : v->capacity * 2;
    
    int *new_data = realloc(v->data, v->capacity * sizeof(int));
    if (!new_data) {
      fprintf(stderr, "Błąd alokacji pamięci!\n");
      exit(1);
    }
    v->data = new_data;
  }
  v->data[v->size++] = value;
}

void free_vector(IntVector *v) {
  free(v->data);
  v->data = NULL;
  v->size = 0;
  v->capacity = 0;
}