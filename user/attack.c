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
    // for(int i = 0; i < 32; i++){
    //   printf("no.%d ", i+1);
    //   for(int j = 0; j < 100; j++){
    //     if(!buf[i*4096+j]){
    //       printf(" ");
    //     }else{
    //       printf("%c", buf[i*4096+j]);
    //     }
    //   }
    //   printf("\n");
    // }
    printf("%s\n", buf+9*4096+23);
    exit(0);
  }
}
