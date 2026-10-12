#include "list.h"
#include <stdio.h>
#include <stdlib.h>

bool is_empty(list l) { return l->first == NULL; }
int pop(list l) {
  node_ptr n = l->first;
  int e = n->elem;
  l->first = l->first->next;
  if (l->first == NULL) // last element
    l->last = NULL;
  free(n);
  l->length--;
  return e;
}
void push(list l, int e) {
  node_ptr n = malloc(sizeof(node));
  n->elem = e;
  n->next = l->first;
  l->first = n;
  if (l->last == NULL) // first element
    l->last = n;
  l->length++;
}
void append(list l, int e) {
  node_ptr n = malloc(sizeof(node));
  n->elem = e;
  n->next = NULL;
  if (l->first == NULL) // first element
    l->first = n;
  else
    l->last->next = n;
  l->last = n;
  l->length++;
}
int get(list l, int i) {
  node_ptr n = l->first;

  int j = 0;
  while (j < i) {
    n = n->next;
    j++;
  }

  return n->elem;
}
void put(list l, int i, int e) {
  node_ptr n = l->first;

  int j = 0;
  while (j < i) {
    n = n->next;
    j++;
  }

  n->elem = e;
}
void insert(list l, int i, int e) {
  node_ptr n = l->first;
  node_ptr new_node = malloc(sizeof(node));
  new_node->elem = e;
  new_node->next = NULL;
  if (i == 0) {
    new_node->next = l->first;
    if (l->first == NULL) {
      l->last = new_node;
    }
    l->first = new_node;
  } else {
    int j = 0;
    while (j < i - 1) {
      n = n->next;
      j++;
    }
    if (n->next == NULL) {
      l->last = new_node;
    } else {
      new_node->next = n->next;
    }
    n->next = new_node;
  }
  l->length++;
}
void delete(list l, int i) {
  node_ptr n = l->first;
  if (i == 0) {
    if (l->first == l->last) {
      free(l->first);
      l->last = NULL;
      l->first = NULL;
    } else {
      l->first = l->first->next;
      free(n);
    }
  } else {
    int j = 0;
    while (j < i - 1) {
      n = n->next;
      j++;
    }
    if (n->next->next == NULL) {
      l->last = n;
      free(n->next);
      n->next = NULL;
    } else {
      node_ptr temp = n->next;
      n->next = temp->next;
      free(temp);
    }
  }
  l->length--;
}
void print(list l) {
  node_ptr n = l->first;
  while (n != NULL) {
    printf(" %d", n->elem);
    n = n->next;
  }
  printf(" ( %d )\n", length(l));
}
int length(list l) { return l->length; }

void clean(list l) {
  while (!is_empty(l)) {
    pop(l);
  }
}
