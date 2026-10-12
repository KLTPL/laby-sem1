#include <stddef.h> // do size_t
#include "c_vector.h"
#include "prime_factors.h"

unsigned totient(unsigned n) {
  IntVector factors = count_prime_factors(n);
    
    int result = n;
    int last_p = -1;

    for (size_t i = 0; i < factors.size; i++) {
      if (factors.data[i] != last_p) {
        result = result - (result / factors.data[i]);
        
        last_p = factors.data[i];
      }
    }

    free_vector(&factors);

    return result;
}

