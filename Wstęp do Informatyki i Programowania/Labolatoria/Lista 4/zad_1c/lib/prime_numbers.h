#ifndef PRIME_NUMBERS
#define PRIME_NUMBERS

#include <stdbool.h>

unsigned prime_numbers(unsigned n); // returns primes smaller than n
unsigned prime(unsigned n); // returns the n-th prime
bool is_prime(unsigned n);

bool prime_numbers_check_args(int n);
bool prime_check_args(int n);
bool is_prime_check_args(int n);


#endif