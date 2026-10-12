import sys
import src.permutations as permutations
import src.eightqueens as eightqueens


def main():
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

    perms = permutations.create_permutations(n)
    count = permutations.print_correct_permutations(
        perms, eightqueens.is_permutation_correct_solution
    )

    print(f"Liczba rozwiązań: {count}")


if __name__ == "__main__":
    sys.exit(main())
