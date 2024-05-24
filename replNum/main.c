#include <stdio.h>
#include "f.h"

int main(int argc, char *argv[]){
    if (argc < 3){
        printf("Argument missing\n");
    }
    f(argv[1], *argv[2]);
    printf("%s\n", argv[1]);
}