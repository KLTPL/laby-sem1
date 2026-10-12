import math

def print_prime_factors(num):
  if num <= 1:
    print("Brak czynników pierwszych", end="")
    return
  
  print(f"{num} = ", end="")

  exp = 0 # expoment
  while num % 2 == 0:
    exp += 1
    num = num // 2
  
  if exp > 0:
    print("2", end="")
    if exp > 1:
      print(f"^{exp}", end="")
    if num > 1:
      print("*", end="")
  
  for curr in range(3, int(math.sqrt(num)) + 1, 2):
    exp = 0
    while num % curr == 0:
      num //= curr
      exp += 1
    
    if exp > 0:
      print(f"{curr}", end="")
      if exp > 1:
        print(f"^{exp}", end="")
      if num > 1:
        print("*", end="")

  if num > 1:
    print(f"{num}", end="")
  
  print()

def main():
  print("Program wypisujący rozkład na czynniki pierwsze")
  num = int(input("Podaj liczbę: "))

  print_prime_factors(num)

if __name__ == "__main__":
  main()