from .prime_factors import count_prime_factors

def totient(n):
  factors = count_prime_factors(n)
  result = n
  last_p = -1
  
  for p in factors:
    if p != last_p:
      result -= result // p
      last_p = p
          
  return result