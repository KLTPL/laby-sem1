import sys
import math


def compute_sieve(s, n):
  i = 2
  while i * i <= n:
    if s[i]:
      for j in range(i * i, n + 1, i):
        s[j] = False
    i += 1

def count_primes(s, n):
  count = 0
  for i in range(2, n + 1):
    if s[i]:
      count += 1
  return count

def PrimeNumbers(n):

  try:
    sieve = [True] * (n + 1)
  except MemoryError:
    print(f"Błąd: Za mało pamięci n = {n}", file=sys.stderr)
    sys.exit(2)

  compute_sieve(sieve, n)
  result = count_primes(sieve, n)

  return result
def Prime(n):
  if n <= 0:
    raise ValueError("Błąd: n musi być liczbą naturalną > 0")
  
  if n == 1:
    return 2

  primes = [2]
  count = 1
  candidate = 3

  while count < n:
    is_prime = True
    
    for p in primes:
      is_prime = candidate % p != 0
      if p * p > candidate or not is_prime:
        break
    
    if is_prime:
      primes.append(candidate)
      count += 1
    
    candidate += 2

  return primes[n - 1]

def IsPrime(n):
  if n == 2:
    return True
  if n <= 1 or n % 2 == 0:
    return False

  for curr in range(3, int(math.sqrt(n)) + 1, 2):
    if n % curr == 0:
      return False

  return True

def PrimeNumbers_check_args(n):
  res = n >= 2
  if not res:
    print("Błąd: n nie spełnia warunku n >= 2")
  return res

def Prime_check_args(n):
  res = n >= 1
  if not res:
    print("Błąd: n nie spełnia warunku n >= 1")
  return res

def IsPrime_check_args(n):
  res = n >= 0
  if not res:
    print("Błąd: n nie spełnia warunku n >= 0")
  return res
