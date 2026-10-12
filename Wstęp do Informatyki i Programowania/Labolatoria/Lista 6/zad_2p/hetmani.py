import sys


def hetmani():
    if len(sys.argv) != 2:
        print(
            "Program przyjmuje jeden argument N - liczba całkowita, dodatnia oznaczająca wymiary szachownicy N x N"
        )
        return 1
    n = 0
    try:
        n = int(sys.argv[1])
    except ValueError:
        print("Błędnie podana liczba")
        return 1

    if n <= 0:
        print("Plansza musi mieć dodatnie wymiary")
        return 1

    position = [0] * (n + 1)
    bije_wiersz = [False] * (n + 1)
    bije_przek1 = [False] * (2 * n + 1)
    bije_przek2 = [False] * (2 * n - 1)

    count = 0

    def drukuj_rozwiazanie():
        print(*position)

    def ustaw(i):
        nonlocal count

        for j in range(1, n + 1):
            sum = i + j
            diff = i - j + (n - 1)

            if not (bije_wiersz[j] or bije_przek1[sum] or bije_przek2[diff]):
                position[i] = j
                bije_wiersz[j] = True
                bije_przek1[sum] = True
                bije_przek2[diff] = True

                if i < n:
                    ustaw(i + 1)
                else:
                    drukuj_rozwiazanie()
                    count += 1

                position[i] = 0
                bije_wiersz[j] = False
                bije_przek1[i + j] = False
                bije_przek2[diff] = False

    ustaw(1)
    print(f"Liczba rozwiązań: {count}")
    return 0


if __name__ == "__main__":
    sys.exit(hetmani())
