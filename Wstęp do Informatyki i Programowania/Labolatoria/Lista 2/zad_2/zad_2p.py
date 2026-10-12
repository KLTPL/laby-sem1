import math

def is_prime(num):
  if num == 2:
    return True
  if num <= 1 or num % 2 == 0:
    return False

  for curr in range(3, int(math.sqrt(num)) + 1, 2):
    if num % curr == 0:
      return False

  return True

def main():
  print("Program sprawdzający czy liczba jest pierwsza")

  num = int(input("Podaj liczbę: "))
  if is_prime(num):
    print("Liczba jest pierwsza")
  else:
    print("Liczba NIE jest pierwsza")


if __name__ == "__main__":
  main()