import sys

def binomial_coefficient(n, k):
  if k > n // 2:
    k = n - k

  C = [0] * (k + 1)

  C[0] = 1

  for i in range(1, n + 1):
    limit = i if i < k else k
    
    for j in range(limit, 0, -1):
      C[j] = C[j] + C[j - 1]

  result = C[k]
  
  return result

def read_int_custom(text = "Podaj liczbę: ", error_message = "Nie udało się wczytać liczby\n"):
  try:
    raw_input = input(text)
    if not raw_input: return False, 0
    
    val = int(raw_input)
    return True, val
  except ValueError:
    print(error_message, end="", file=sys.stderr)
    return False, 0

def read_unsigned_custom(text, error_message):
  is_read, input_int = read_int_custom(text, error_message)
  
  if not is_read:
    return False, 0

  if input_int < 0:
    print("Błąd: liczba musi być naturalna (czyli >=0)", file=sys.stderr)
    return False, 0

  return True, input_int

def main():
  print("Program obliczajacy dwumian newtona dla n, k")

  is_n_read, n = read_unsigned_custom("Podaj n: ", None)
  if not is_n_read:
    sys.exit(1)

  is_k_read, k = read_unsigned_custom("Podaj k: ", None)
  if not is_k_read:
    sys.exit(1)

  if k > n:
    print("Błąd: k > n", file=sys.stderr)
    sys.exit(1)

  result = binomial_coefficient(n, k)

  print(f"Wynik: {result}")
  sys.exit(0)

if __name__ == "__main__":
  main()