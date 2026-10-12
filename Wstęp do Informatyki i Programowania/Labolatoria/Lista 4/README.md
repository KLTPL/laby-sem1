# Lista 4

## Tasks

| Task     | Description                                                              |
| -------- | ------------------------------------------------------------------------ |
| `zad_1*` | Prime number library: count primes in `[2, n]`, `n`-th prime, primality test |
| `zad_2*` | Euler's totient function for a list of numbers, built on prime factorization |

Directories are suffixed with the language: `a` (Ada), `c` (C), `p` (Python).
Library code lives in `lib/`.

## Building and running

Run the commands from inside a task directory, e.g. `zad_1a`.

### Ada

```
gprbuild -P build.gpr
./main
```

### C

```
gcc main.c lib/*.c -o main -lm
./main
```

### Python

```
python3 main.py
```

## Usage

`zad_1`: the function is one of `pn` (count primes), `pr` (`n`-th prime), `ip` (is prime).

```
./main pn 100
```

`zad_2`: any number of positive integers.

```
./main 1 11 100 5000 12345678
```
