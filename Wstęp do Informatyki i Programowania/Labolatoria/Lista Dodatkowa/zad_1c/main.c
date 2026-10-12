#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

typedef struct {
    int *data;
    int size;
} IntArray;

int compare_ints(const void *a, const void *b) {
    int arg1 = *(const int *)a;
    int arg2 = *(const int *)b;
    if (arg1 < arg2) return -1;
    if (arg1 > arg2) return 1;
    return 0;
}
IntArray load_coins(const char *file_path) {
    FILE *f = fopen(file_path, "r");
    IntArray coins = {NULL, 0};
    
    if (!f) {
        printf("Nie mozna otworzyc pliku: %s\n", file_path);
        exit(1);
    }

    int n;

    if (fscanf(f, "%d", &n) != 1) {
        fclose(f);
        return coins; 
    }

    coins.size = n;
    coins.data = malloc(n * sizeof(int));

    if (coins.data == NULL && n > 0) {
        printf("Błąd alokacji pamięci\n");
        fclose(f);
        exit(1);
    }

    for (int i = 0; i < n; i++) {
        if (fscanf(f, "%d", &coins.data[i]) != 1) {
            printf("Za mało nominałów\n");
            free(coins.data);
            fclose(f);
            exit(1); // lepiej wyjść bo coins.data ma już określoną długość
        }
    }

    fclose(f);
    return coins;
}

IntArray count_change(IntArray C, int r) {
    const int INF = INT_MAX;
    
    int *dp = malloc((r + 1) * sizeof(int));
    int *last_coin = malloc((r + 1) * sizeof(int));
    
    for (int i = 0; i <= r; i++) {
        dp[i] = INF;
        last_coin[i] = -1;
    }
    dp[0] = 0;

    for (int j = 0; j < C.size; j++) {
        int coin = C.data[j];
        for (int i = coin; i <= r; i++) {
            if (dp[i - coin] != INF) {
                int coins_amount = dp[i - coin] + 1;
                if (coins_amount < dp[i]) {
                    dp[i] = coins_amount;
                    last_coin[i] = coin;
                }
            }
        }
    }

    IntArray result = {NULL, 0};

    if (dp[r] == INF) {
        free(dp);
        free(last_coin);
        result.size = -1;
        return result;
    }

    result.size = dp[r];
    result.data = malloc(result.size * sizeof(int));

    int curr = r;
    int idx = 0;
    while (curr > 0) {
        int coin = last_coin[curr];
        result.data[idx++] = coin;
        curr -= coin;
    }

    free(dp);
    free(last_coin);
    return result;
}

void print_used_coins(IntArray used_coins_sorted) {
    if (used_coins_sorted.size == 0) return;

    int curr_coin = used_coins_sorted.data[0];
    int count = 1;

    for (int i = 1; i < used_coins_sorted.size; i++) {
        if (used_coins_sorted.data[i] == curr_coin) {
            count++;
        } else {
            printf("   %d x %d\n", count, curr_coin);
            curr_coin = used_coins_sorted.data[i];
            count = 1;
        }
    }
    printf("   %d x %d\n", count, curr_coin);
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Przyklad: ./coins coins.txt 13 45 2 4 9 20\n");
        return 1;
    }

    char *file_path = argv[1];
    
    int num_tests = argc - 2;
    int *test_values = malloc(num_tests * sizeof(int));
    
    for (int i = 0; i < num_tests; i++) {
        char *endptr;
        test_values[i] = strtol(argv[i + 2], &endptr, 10);
        if (*endptr != '\0') {
            printf("Bledne liczby\n");
            free(test_values);
            return 1;
        }
    }

    IntArray coins = load_coins(file_path);

    for (int i = 0; i < num_tests; i++) {
        int val = test_values[i];
        IntArray used_coins = count_change(coins, val);

        if (used_coins.size == -1) {
            printf("%d ==> No solution!\n", val);
        } else {
            printf("%d ==> %d\n", val, used_coins.size);
            
            qsort(used_coins.data, used_coins.size, sizeof(int), compare_ints);
            
            print_used_coins(used_coins);
            
            free(used_coins.data);
        }
    }

    free(test_values);
    free(coins.data);

    return 0;
}