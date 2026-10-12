import sys

def read_int_custom(text = "Podaj liczbę: ", error_message = "Nie udało się wczytać liczby\n"):
  try:
    raw_input = input(text)
    if not raw_input: return False, 0
    
    val = int(raw_input)
    return True, val
  except ValueError:
    print(error_message, end="", file=sys.stderr)
    return False, 0

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

def main():
  print("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]")

  is_read, n = read_int_custom("Podaj liczbe naturalna n: ", "Błąd: podano niepoprawną liczbę")

  if not is_read:
    sys.exit(1)

  if n < 2:
    print(f"n musi być >= 2 żeby tworzyło poprawny zakres [2, n]")
    sys.exit(0)

  try:
    sieve = [True] * (n + 1)
  except MemoryError:
    print(f"Błąd: Za mało pamięci n = {n}", file=sys.stderr)
    sys.exit(2)

  compute_sieve(sieve, n)
  result = count_primes(sieve, n)

  print(f"Liczba liczb pierwszych w zakresie [2, {n}] wynosi: {result}")

if __name__ == "__main__":
  main()