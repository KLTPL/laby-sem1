import sys


def load_coins(sciezka_pliku):
    try:
        with open(sciezka_pliku, "r") as f:
            lines = f.read().split()

            coins = [int(x) for x in lines[1:]]

            if (len(coins) < int(lines[0])):
                print("Za mało nominałów") # nie trzeba kończyć programu - działamy z mniejszą ilością nominałów

            return coins
    except FileNotFoundError:
        print(f"Nie mozna otworzyc pliku")
        sys.exit(1)


def count_change(C, r):
    INFINITY = float("inf")

    dp = [INFINITY] * (r + 1)
    dp[0] = 0

    last_coin = [-1] * (r + 1)

    for coin in C:
        for i in range(coin, r + 1):
            if dp[i - coin] != INFINITY:
                coins_amount = dp[i - coin] + 1

                if coins_amount < dp[i]:
                    dp[i] = coins_amount
                    last_coin[i] = coin

    if dp[r] == INFINITY:
        return None

    coins = []
    curr = r
    while curr > 0:
        coin = last_coin[curr]
        coins.append(coin)
        curr -= coin

    return coins


def print_used_coins(used_coins_sorted):
    curr_coin = used_coins_sorted[0]
    count = 1

    for i in range(1, len(used_coins_sorted)):
        if used_coins_sorted[i] == curr_coin:
            count += 1
        else:
            print(f"{' ' * 3}{count} x {curr_coin}")
            curr_coin = used_coins_sorted[i]
            count = 1

    print(f"{' ' * 3}{count} x {curr_coin}")


def main():
    if len(sys.argv) < 3:
        print("Przykład: python3 coins.py coins.txt 13 45 2 4 9 20")
        sys.exit(1)

    file_coins = sys.argv[1]
    try:
        test_values = [int(x) for x in sys.argv[2:]]
    except ValueError:
        print("Błędne liczby")
        sys.exit(1)

    coins = load_coins(file_coins)
    for val in test_values:
        used_coins = count_change(coins, val)
        if used_coins is None:
            print(f"{val} ==> No solution!")
        else:
            print(f"{val} ==> {len(used_coins)}")
            used_coins.sort()
            print_used_coins(used_coins)


if __name__ == "__main__":
    main()
