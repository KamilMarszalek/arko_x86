#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]){
    if (argc < 2){
        printf("Args missing");
    }
    f(argv[1]);
    printf("%s\n", argv[1]);
    return 0;
}
