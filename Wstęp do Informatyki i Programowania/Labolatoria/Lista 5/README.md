# Lista 5

## Tasks

| Task        | Description                                                         |
| ----------- | ------------------------------------------------------------------- |
| `zad_1a/c`  | Linked list module with an interactive test program (`listtest`)    |
| `zad_2*`    | Bisection method for finding zeros of a function                    |
| `z_wykladu` | Lecture examples: list in Ada and function arguments in Ada, C, Python |

Directories are suffixed with the language: `a` (Ada), `c` (C), `p` (Python).
Library code lives in `src/`.

## Building and running

Run the commands from inside a task directory, e.g. `zad_1a`.

### Ada

```
gprbuild -P build.gpr
./listtest
```

### C

`zad_1c`:

```
gcc -Isrc listtest.c src/list.c -o listtest
./listtest
```

`zad_2c`:

```
gcc -Isrc calc_bisection.c src/bisection.c -o calc_bisection -lm
./calc_bisection
```

### Python

```
python3 calc_bisection.py
```

## Usage

`listtest` reads commands from standard input: `push`, `pop`, `append`, `get`, `put`, `insert`, `delete`, ...
