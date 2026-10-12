import math

def count_prime_factors(num):
  factors = []
  if num <= 1:
    return factors
  

  while num % 2 == 0:
    factors.append(2)
    num = num // 2
  

  
  for curr in range(3, int(math.sqrt(num)) + 1, 2):
    while num % curr == 0:
      num //= curr
      factors.append(curr)

  if num > 1:
    factors.append(num)

  return factors