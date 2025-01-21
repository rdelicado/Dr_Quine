#include <stdio.h>
#include <stdlib.h>

#define CODE "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$c/* this program runs itself until num = 0 */%1$cint main()%1$c{%1$c    char filename[20];%1$c    char cmd[100];%1$c    int num = %4$d;%1$c    if (num <= 0) return (0);%1$c    num--;%1$c    snprintf(filename, sizeof(filename), %2$cSully_%%d.c%2$c, num);%1$c    FILE *f = fopen(filename, %2$cw%2$c);%1$c    fprintf(f, CODE, 10, 34, CODE, num);%1$c    fclose(f);%1$c    snprintf(cmd, sizeof(cmd), %2$cgcc -Wall -Wextra -Werror -o Sully_%%d %%s%2$c, num, filename);%1$c    system(cmd);%1$c    snprintf(cmd, sizeof(cmd), %2$c./Sully_%%d%2$c, num);%1$c    system(cmd);%1$c    return (0);%1$c}"

/* this program runs itself until num = 0 */
int main()
{
    char filename[20];
    char cmd[100];
    int num = 5;
    if (num <= 0) return (0);
    num--;
    snprintf(filename, sizeof(filename), "Sully_%d.c", num);
    FILE *f = fopen(filename, "w");
    fprintf(f, CODE, 10, 34, CODE, num);
    fclose(f);
    snprintf(cmd, sizeof(cmd), "gcc -Wall -Wextra -Werror -o Sully_%d %s", num, filename);
    system(cmd);
    snprintf(cmd, sizeof(cmd), "./Sully_%d", num);
    system(cmd);
    return (0);
}