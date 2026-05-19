#include "kernel/types.h"
#include "kernel/fcntl.h"
#include "user/user.h"
#include "kernel/riscv.h"

char buf[32*4096];

int
main(int argc, char *argv[])
{
  if(argc != 1){
    printf("Usage: attack\n");
    exit(1);
  }else{
    // for(int i = 1; i < 3; i++){
    //   printf("%d ", i+1);
    //   for(int j = 0; j < 10; j++){
    //     if(!buf[9*4096+i*10+j]){
    //       printf("x");
    //     }else{
    //       printf("%c", buf[9*4096+i*10+j]);
    //     }
    //   }
    //   printf("\n");
    // }
    printf("%s\n", buf+9*4096+23);
    exit(0);
  }
}
