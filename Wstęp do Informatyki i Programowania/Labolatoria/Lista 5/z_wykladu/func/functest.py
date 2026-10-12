from math import *

def write(f, x) :
    print(f(x))

def square1(x) :
    return (x-1.0)*(x+2.0)

def main() :
    x=float(input(""))
    write(sin, x)
    write(cos, x)
    write(sqrt, x)
    write(square1, x)

if __name__ == "__main__":
    main()
