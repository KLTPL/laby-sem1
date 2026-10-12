n = int(input("Podaj liczbę n: "))
p = int(input("Podaj podstawę p: "))

m = 0
t = n

while t > 0:
  m = p * m + (t % p)
  t = t // p

if n == m:
  print("Jest palindromem")
else:
  print("Nie jest palindromem")
