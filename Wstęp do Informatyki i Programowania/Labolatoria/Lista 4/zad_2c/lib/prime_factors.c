#include "c_vector.h"
#include <math.h>

IntVector count_prime_factors(unsigned num) {
  IntVector factors;
  init_vector(&factors);
  
  unsigned num_sqrt = (unsigned)floor(sqrt(num));
  int curr = 3;

  while (num % 2 == 0) {
    append_vector(&factors, 2);
    num /= 2;
  }

  while (curr <= num_sqrt) {
    if (num == 1) break;
    while (num % curr == 0) {
      num /= curr;
      append_vector(&factors, curr);
    }
    curr += 2;
  }

  if (num > 1) {
    append_vector(&factors, num);
  }

  return factors;
}