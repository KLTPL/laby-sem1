# Lista Dodatkowa

## Tasks

| Task     | Description                                                     |
| -------- | --------------------------------------------------------------- |
| `zad_1*` | Coin change: minimal number of coins needed to pay each amount  |

Directories are suffixed with the language: `a` (Ada), `c` (C), `p` (Python).
Coin denominations are read from `coins.txt` (first number is the count, followed by the denominations).

## Building and running

Run the commands from inside a task directory, e.g. `zad_1a`.

### Ada

```
gprbuild -P build.gpr
./main ../coins.txt 13 45 2 4 9 20
```

### C

```
cmake -S . -B build
cmake --build build
./build/main ../coins.txt 13 45 2 4 9 20
```

### Python

```
python3 main.py ../coins.txt 13 45 2 4 9 20
```
