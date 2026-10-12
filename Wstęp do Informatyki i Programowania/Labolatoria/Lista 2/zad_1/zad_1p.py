def GCD(a, b):
  if a < b:
      a, b = b, a
  while b != 0:
      a, b = b, a % b
  return a

def main():
  a = int(input("Podaj pierwszą liczbę: "))
  b = int(input("Podaj drugą liczbę: "))

  print(f"NWD = {GCD(a, b)}")

if __name__ == "__main__":
  main()