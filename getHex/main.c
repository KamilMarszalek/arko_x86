#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]){
    if (argc < 2){
        printf("Arg missing\n");
    }
    unsigned int answer = f(argv[1]);
    printf("%u\n", answer);
    return 0;
}