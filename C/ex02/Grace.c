#include <stdio.h>

#define CODE "#include <stdio.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$c#define GRACE FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); fprintf(f, CODE, 10, 34, CODE); fclose(f); return (0);%1$c%1$c#define RUN /* This macro runs the program */ int main() { GRACE }%1$c%1$cRUN"

#define GRACE FILE *f = fopen("Grace_kid.c", "w"); fprintf(f, CODE, 10, 34, CODE); fclose(f); return (0);

#define RUN /* This macro runs the program */ int main() { GRACE }

RUN