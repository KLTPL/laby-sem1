#include "list.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char command[20];
  bool cont = true;
  int r;
  list l = malloc(sizeof(list_t));
  l->first = l->last = NULL;
  l->length = 0;
  while (cont) {
    printf("Command: ");
    scanf("%s", command);
    if (!strcmp(command, "pop")) {
      if (!is_empty(l)) {
        r = pop(l);
        printf("Result: %d\n", r);
      } else {
        printf("Error - stack is empty!\n");
      }
    } else if (!strcmp(command, "push")) {
      printf("Value: ");
      scanf("%d", &r);
      push(l, r);
      printf("Result: OK\n");
    } else if (!strcmp(command, "append")) {
      printf("Value: ");
      scanf("%d", &r);
      append(l, r);
      printf("Result: OK\n");
    } else if (!strcmp(command, "get")) {
      printf("Index: ");
      scanf("%d", &r);
      if (r <= 0 || r > length(l)) {
        fprintf(stderr, "Error - bad index !\n");
      } else {
        r--;
        r = get(l, r);
        printf("Result: %d\n", r);
      }
    } else if (!strcmp(command, "put")) {
      printf("Index: ");
      scanf("%d", &r);
      int e;
      printf("Value: ");
      scanf("%d", &e);
      r--;
      if (r < 0 || r >= length(l)) {
        fprintf(stderr, "Error - bad index !\n");
      } else {

        put(l, r, e);
        printf("Result: OK\n");
      }
    } else if (!strcmp(command, "insert")) {
      printf("Index: ");
      scanf("%d", &r);
      int e;
      printf("Value: ");
      scanf("%d", &e);
      r--;
      if (r < 0 || r > length(l)) {
        fprintf(stderr, "Error - bad index !\n");
      } else {
        insert(l, r, e);
        printf("Result: OK\n");
      }
    } else if (!strcmp(command, "delete")) {
      printf("Index: ");
      scanf("%d", &r);
      r--;
      if (r < 0 || r >= length(l)) {
        fprintf(stderr, "Error - bad index !\n");
      } else {
        delete(l, r);
        printf("Result: OK\n");
      }
    } else if (!strcmp(command, "print")) {
      printf("Result: ");
      print(l);
    } else if (!strcmp(command, "length")) {
      r = length(l);
      printf("Result: %d\n", r);
    } else if (!strcmp(command, "clean")) {
      clean(l);
      printf("Result: OK\n");
    } else if (!strcmp(command, "exit")) {
      cont = false;
    } else
      printf("Unknown command!\n");
  }
  while (!is_empty(l))
    pop(l);
  free(l);

  return 0;
}
