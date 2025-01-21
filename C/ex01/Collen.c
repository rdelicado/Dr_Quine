#include <stdio.h>

void print(char *code)
{
    printf(code, 10, 34, code);
}

/*
    This program will print its own font when executed.
*/
int main() 
{
    /*
        Code string that holds the program's DNA
    */
    char *code = "#include <stdio.h>%1$c%1$cvoid print(char *code)%1$c{%1$c    printf(code, 10, 34, code);%1$c}%1$c%1$c/*%1$c    This program will print its own font when executed.%1$c*/%1$cint main() %1$c{%1$c    /*%1$c        Code string that holds the program's DNA%1$c    */%1$c    char *code = %2$c%3$s%2$c;%1$c%1$c    print(code);%1$c    return 0;%1$c}";

    print(code);
    return 0;
}