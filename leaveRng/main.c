#include <stdio.h>

int main(int argc, char* argv[]){
    if (argc < 4){
        printf("Arg missing\n");
    }
    f(argv[1], argv[2], argv[3]);
    printf("%s\n", argv[1]);
    return 0;
}