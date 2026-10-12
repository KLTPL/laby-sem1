import itertools


def get_feedback(guess, secret):
    correct_place = 0
    wrong_place = 0
    g_temp = list(guess)
    s_temp = list(secret)

    for i in range(4):
        if g_temp[i] == s_temp[i]:
            correct_place += 1
            g_temp[i] = -1
            s_temp[i] = -1

    for i in range(4):
        if g_temp[i] != -1:
            if g_temp[i] in s_temp:
                wrong_place += 1
                s_temp.remove(g_temp[i])

    return correct_place, wrong_place


def main():
    possible_codes = list(itertools.product(range(1, 7), repeat=4))
    attempt = 1

    while True:
        if not possible_codes:
            print("Oszukujesz !")
            break

        current_guess = possible_codes[0]
        guess_str = " ".join(map(str, current_guess))

        print(f"{attempt}: {guess_str} ?")

        try:
            correct_place = int(input("Na swoim miejscu : "))
            if correct_place == 4:
                print("Wygrałem .")
                break
            wrong_place = int(input("Nie na swoim miejscu : "))
        except ValueError:
            continue

        possible_codes = [
            code
            for code in possible_codes
            if get_feedback(current_guess, code) == (correct_place, wrong_place)
        ]

        attempt += 1


if __name__ == "__main__":
    main()
