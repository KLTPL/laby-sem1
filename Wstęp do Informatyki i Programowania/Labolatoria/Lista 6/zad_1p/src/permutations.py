def create_permutations(n):
    stack = [0] * n
    curr = [i for i in range(1, n + 1)]
    res = []

    res.append([el for el in curr])

    i = 0
    while i < n:
        if stack[i] < i:
            if i % 2 == 0:
                curr[0], curr[i] = curr[i], curr[0]
            else:
                curr[stack[i]], curr[i] = curr[i], curr[stack[i]]

            res.append([el for el in curr])

            stack[i] += 1
            i = 0
        else:
            stack[i] = 0
            i += 1
    return res


def print_correct_permutations(perms, is_correct):
    count = 0
    for perm in perms:
        if is_correct(perm):
            print(*perm)
            count += 1
    return count
