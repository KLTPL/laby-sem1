def is_permutation_correct_solution(perm):
    diag_sums = set()
    diag_diffs = set()

    for c in range(len(perm)):
        r = perm[c] - 1

        sum = r + c
        diff = r - c

        if sum in diag_sums or diff in diag_diffs:
            return False

        diag_sums.add(sum)
        diag_diffs.add(diff)
    return True
