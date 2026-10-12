import math

print("Program liczący równanie kwadratowe: a*x^2 + b*x + c = 0")

# Pobranie współczynników od użytkownika
a = float(input("a = "))

if a == 0:
  print("To nie jest równanie kwadratowe (a = 0)")
else:
  b = float(input("b = "))
  c = float(input("c = "))

  delta = b ** 2 - 4.0 * a * c

  if delta < 0:
    print("Brak rozwiązań rzeczywistych")
  elif delta == 0:
    x0 = -b / (2.0 * a)
    print("Jedno rozwiązanie:")
    print(f"x0 = {x0:.6f}")
  else:
    sqrt_delta = math.sqrt(delta)
    x1 = (-b - sqrt_delta) / (2.0 * a)
    x2 = (-b + sqrt_delta) / (2.0 * a)
    print("Dwa rozwiązania:")
    print(f"x1 = {x1:.6f}")
    print(f"x2 = {x2:.6f}")
