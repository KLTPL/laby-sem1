#ifndef C_VECTOR
#define C_VECTOR

#include <stddef.h> // do size_t

typedef struct {
  int *data;
  size_t size;
  size_t capacity;
} IntVector;

void init_vector(IntVector *v);
void append_vector(IntVector *v, int value);
void free_vector(IntVector *v);

#endif
