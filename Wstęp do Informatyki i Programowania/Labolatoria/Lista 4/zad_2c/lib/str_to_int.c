#include <stdbool.h>
#include <limits.h>
#include <stdlib.h> // strol

bool str_to_int(const char *str, int *result) {
    char *endptr;
    
    long val = strtol(str, &endptr, 10);

    if (str == endptr) {
        return false; // input empty 
    }

    if (*endptr != '\0') {
        
        return false; // chars after nums
    }

    if (val > INT_MAX || val < INT_MIN) {
        return false;
    }

    *result = (int)val;
    return true;
}