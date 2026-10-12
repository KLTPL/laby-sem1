import sys
import lib.totient as totient;

def main():
  # sys.argv[0] to nazwa skryptu, argumenty zaczynają się od indeksu 1
  args = sys.argv[1:]
  
  if len(args) < 1:
    print("Błąd: Brak argumentów.", file=sys.stderr)
    print(f"Sposób użycia: python {sys.argv[0]} n1 n2 ...", file=sys.stderr)
    print(f"Przykład: python {sys.argv[0]} 1 10 12345678", file=sys.stderr)
    sys.exit(1)
      
  for arg in args:
    try:
      n = int(arg)
      if n <= 0:
        print(f"Liczba {arg} nie spełnia warunku n > 0", file=sys.stderr)
        continue
          
      result = totient.totient(n)
      print(f"totient({n}) = {result}")
        
    except ValueError:
      print(f"Nieprawidłowy format liczby: {arg}", file=sys.stderr)

if __name__ == "__main__":
    main()