def read_int_custom(text = "Podaj liczbę: ", error_message = "Nie udało się wczytać liczby\n"):
  try:
    raw_input = input(text)
    if not raw_input: return False, 0
    
    val = int(raw_input)
    return True, val
  except ValueError:
    print(error_message, end="", file=sys.stderr)
    return False, 0

def read_unsigned_custom(text = "Podaj liczbę: ", error_message  = "Nie udało się wczytać liczby\n"):
  is_read, input_int = read_int_custom(text, error_message)
  
  if not is_read:
    return False, 0

  if input_int < 0:
    print("Błąd: liczba musi być naturalna (czyli >=0)", file=sys.stderr)
    return False, 0

  return True, input_int


def find_nth_prime(n: int) -> int:
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

def main():
  print("Program obliczający n-tą liczbę pierwszą")
  
  is_read, n = read_unsigned_custom("Podaj n: ")

  if not is_read:
    return 1
  result = find_nth_prime(n)
    
  print(f"Wynik: {result}")
  return 0

import sys
if __name__ == "__main__":
  sys.exit(main())