# Lista 6

## Tasks

| Task     | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `zad_1*` | Eight queens (`N x N`) by generating and checking permutations |
| `zad_2*` | `N` queens (`hetmani`) with backtracking                     |
| `zad_3*` | Mastermind solver (4 positions, 6 colours)                   |

Directories are suffixed with the language: `a` (Ada), `c` (C), `p` (Python).
Library code lives in `src/`.

## Building and running

Run the commands from inside a task directory, e.g. `zad_1a`.

### Ada

```
gprbuild -P build.gpr
./main
```

### C

```
cmake -S . -B build
cmake --build build
./build/main
```

### Python

```
python3 main.py
```

## Usage

`zad_1` and `zad_2` take the board size `N`.

```
./main 8
```

`zad_3` is interactive: for every guess answer how many pegs are in the right place and how many are in the wrong place.
