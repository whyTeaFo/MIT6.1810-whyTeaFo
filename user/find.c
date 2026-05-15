#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/fcntl.h"
#include "kernel/stat.h"
#include "kernel/param.h"

char*
get_filename(char* path)
{
    char* p;

    for(p=path+strlen(path); p>=path && *p!='/';p--);
    ++p;

    return p;
}

void
find(char* dir, char* filename, int cmd_flag, char* cmd_argv[], int cmd_length)
{
    char buf[512];
    int fd;
    struct stat st;
    char* p;
    struct dirent de;

    if((fd = open(dir, O_RDONLY)) < 0){
        fprintf(2, "find: cannot open %s\n", dir);
        return;
    }

    if(fstat(fd, &st) < 0){
        fprintf(2, "find: cannot stat %s\n", dir);
        close(fd);
        return;
    }

    if(strlen(dir) + 1 + DIRSIZ + 1 > sizeof(buf)){
        printf("find: path too long\n");
        close(fd);
        return;
    }
    strcpy(buf, dir);
    p = buf + strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
        if(de.inum == 0){
            continue;
        }
        memmove(p, de.name, DIRSIZ);
        p[DIRSIZ] = 0;
        if(stat(buf, &st) < 0){
            fprintf(2, "find: cannot stat %s\n", buf);
            continue;
        }
        if(st.type == T_DIR){
            if(strcmp(p, ".") && strcmp(p, "..")){
                find(buf, filename, cmd_flag, cmd_argv, cmd_length);
            }
        }
        if(st.type == T_FILE && !strcmp(get_filename(buf), filename)){
            if(!cmd_flag){
                printf("%s\n", buf);
            }else{
                cmd_argv[cmd_length++] = buf;
                if(fork() == 0){
                    exec(cmd_argv[0], cmd_argv);
                    printf("exec error\n");
                }else{
                    wait(0);
                }
            }
        }
    }
    close(fd);
}

int
main(int argc, char *argv[])
{
    if(argc == 3){
        find(argv[1], argv[2], 0, 0, 0);
        exit(0);
    }else if(!strcmp(argv[3], "-exec")){
        char* cmd_argv[MAXARG] = {0};
        int cmd_length = 0;
        for(int i = 4; i < argc; i++){
            cmd_argv[i-4] = argv[i];
            cmd_length++;
        }
        find(argv[1], argv[2], 1, cmd_argv, cmd_length);
    }else{
        fprintf(2, "Usage: find [directory] [filename] (-exec [cmd])\n");
        exit(1);
    }
    exit(0);
}
