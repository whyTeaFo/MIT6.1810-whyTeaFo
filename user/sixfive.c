#include "kernel/types.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"
#include "user/user.h"

char buf[1];
const char* separators = " -\r\t\n./,";

int
isSeparators(char c)
{
    return strchr(separators, c) != 0;
}

int
isDivisibleBy5or6(int n)
{
    return n % 5 == 0 || n % 6 == 0;
}

void
sixfive(int fd)
{
    int flag = 1;   //no characters other than numbers in string
    int is_number = 0;
    int n = 0;      //number

    while(read(fd, buf, 1) > 0){
        char c = buf[0];
        if(flag && c >= '0' && c <= '9'){
            n = n*10 + c - '0';
            is_number = 1;
        }else if(isSeparators(c)){
            if(is_number && flag){
                if(isDivisibleBy5or6(n)){
                    printf("%d\n", n);
                }
            }
            n = 0;
            is_number = 0;
            flag = 1;
        }else{
            flag = 0;
        }
    }
    if(is_number && flag){
        if(isDivisibleBy5or6(n)){
            printf("%d\n", n);
        }
    }
}

int
main(int argc, char *argv[])
{
    int fd, i;

    if(argc <= 1){
        fprintf(2, "Usage: sixfive [file ...]\n");
        exit(1);
    }

    for(i = 1; i < argc; i++){
        if((fd = open(argv[i], O_RDONLY)) < 0){
            printf("sixfive: cannot open %s\n", argv[i]);
            exit(1);
        }
        sixfive(fd);
        close(fd);
    }
    exit(0);
}
        
