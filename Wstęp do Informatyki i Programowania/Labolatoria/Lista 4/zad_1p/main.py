import lib.prime_numbers as prime_numbers;
import sys;

def main():
  if len(sys.argv) != 3:
    print("Błędna ilośc argumentów\n")
    print(f"Sposób użycia: ./{sys.argv[0]} <funkcja> <n> \n")
    print(f"Przykład: ./{sys.argv[0]} pn 100\n",)
    return 1

  try:
    n = int(sys.argv[2])
  except ValueError:
    print("Nieprawidłowy format liczby n", end="", file=sys.stderr)
    return 1

  if sys.argv[1] == "pn":
    print("Program obliczajacy ilosc liczb pierwszych w zakresie [2, n]")

    result = prime_numbers.PrimeNumbers(n)
    print(f"Wynik: {result}")
  elif sys.argv[1] == "pr":
    print("Program obliczający n-tą liczbę pierwszą")

    result = prime_numbers.Prime(n)
    print(f"Wynik: {result}")
  elif sys.argv[1] == "ip":
    print("Program sprawdzający czy liczba n jest pierwsza")

    result = prime_numbers.IsPrime(n)
    print(f"Wynik: {result}")
  else:
    print(f"Błędna operacja: {sys.argv[1]}")
    return 1

  return 0
  

if __name__ == "__main__":
  sys.exit(main())