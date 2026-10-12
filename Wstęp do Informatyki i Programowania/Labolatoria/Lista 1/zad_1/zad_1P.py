def main():
  a = int(input("Podaj pierwszą liczbę: "))
  b = int(input("Podaj drugą liczbę: "))

  while b != 0:
    if a < b:
      a, b = b, a
    else:
      a = a % b

  print(f"NWD = {a}")

if __name__ == "__main__":
  main()