#include <stdio.h>
#include "f.h"

int main(int argc, char* argv[]){
    if (argc < 3){
        printf("Args missing");
    }
    f(argv[1], ((int)*argv[2] - 48));
    printf("%s\n", argv[1]);
    return 0;
}
