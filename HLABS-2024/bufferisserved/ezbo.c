#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    int var = 45;
    char buf[15];

    puts("Enter a number between 0 and 9999999999");
    gets(buf);

    if (var > 45)
        system("awk 'BEGIN {print \"Well done you got the flag:\"} {print}' flag.txt");
    else
        puts("Thank you");
    return 0;
}


/*
solution :

gets() function has a vulnerabiliy. If i enter a string longer than 15, it got in the condition
*/