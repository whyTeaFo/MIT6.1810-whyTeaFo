
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <get_filename>:
#include "kernel/stat.h"
#include "kernel/param.h"

char*
get_filename(char* path)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	1000                	addi	s0,sp,32
   a:	84aa                	mv	s1,a0
    char* p;

    for(p=path+strlen(path); p>=path && *p!='/';p--);
   c:	362000ef          	jal	36e <strlen>
  10:	1502                	slli	a0,a0,0x20
  12:	9101                	srli	a0,a0,0x20
  14:	9526                	add	a0,a0,s1
  16:	02f00713          	li	a4,47
  1a:	00956963          	bltu	a0,s1,2c <get_filename+0x2c>
  1e:	00054783          	lbu	a5,0(a0)
  22:	00e78563          	beq	a5,a4,2c <get_filename+0x2c>
  26:	157d                	addi	a0,a0,-1
  28:	fe957be3          	bgeu	a0,s1,1e <get_filename+0x1e>
    ++p;

    return p;
}
  2c:	0505                	addi	a0,a0,1
  2e:	60e2                	ld	ra,24(sp)
  30:	6442                	ld	s0,16(sp)
  32:	64a2                	ld	s1,8(sp)
  34:	6105                	addi	sp,sp,32
  36:	8082                	ret

0000000000000038 <find>:

void
find(char* dir, char* filename, int cmd_flag, char* cmd_argv[], int cmd_length)
{
  38:	d5010113          	addi	sp,sp,-688
  3c:	2a113423          	sd	ra,680(sp)
  40:	2a813023          	sd	s0,672(sp)
  44:	29213823          	sd	s2,656(sp)
  48:	27713423          	sd	s7,616(sp)
  4c:	25a13823          	sd	s10,592(sp)
  50:	25b13423          	sd	s11,584(sp)
  54:	1d00                	addi	s0,sp,688
  56:	892a                	mv	s2,a0
  58:	8d2e                	mv	s10,a1
  5a:	8db2                	mv	s11,a2
  5c:	d4d43c23          	sd	a3,-680(s0)
  60:	8bba                	mv	s7,a4
    int fd;
    struct stat st;
    char* p;
    struct dirent de;

    if((fd = open(dir, O_RDONLY)) < 0){
  62:	4581                	li	a1,0
  64:	5a0000ef          	jal	604 <open>
  68:	06054d63          	bltz	a0,e2 <find+0xaa>
  6c:	28913c23          	sd	s1,664(sp)
  70:	84aa                	mv	s1,a0
        fprintf(2, "find: cannot open %s\n", dir);
        return;
    }

    if(fstat(fd, &st) < 0){
  72:	d7840593          	addi	a1,s0,-648
  76:	5a6000ef          	jal	61c <fstat>
  7a:	06054d63          	bltz	a0,f4 <find+0xbc>
        fprintf(2, "find: cannot stat %s\n", dir);
        close(fd);
        return;
    }

    if(strlen(dir) + 1 + DIRSIZ + 1 > sizeof(buf)){
  7e:	854a                	mv	a0,s2
  80:	2ee000ef          	jal	36e <strlen>
  84:	2541                	addiw	a0,a0,16
  86:	20000793          	li	a5,512
  8a:	08a7e363          	bltu	a5,a0,110 <find+0xd8>
  8e:	29313423          	sd	s3,648(sp)
  92:	29413023          	sd	s4,640(sp)
  96:	27513c23          	sd	s5,632(sp)
  9a:	27613823          	sd	s6,624(sp)
  9e:	25913c23          	sd	s9,600(sp)
        printf("find: path too long\n");
        close(fd);
        return;
    }
    strcpy(buf, dir);
  a2:	d9040993          	addi	s3,s0,-624
  a6:	85ca                	mv	a1,s2
  a8:	854e                	mv	a0,s3
  aa:	274000ef          	jal	31e <strcpy>
    p = buf + strlen(buf);
  ae:	854e                	mv	a0,s3
  b0:	2be000ef          	jal	36e <strlen>
  b4:	1502                	slli	a0,a0,0x20
  b6:	9101                	srli	a0,a0,0x20
  b8:	00a98733          	add	a4,s3,a0
  bc:	d4e43823          	sd	a4,-688(s0)
    *p++ = '/';
  c0:	00170793          	addi	a5,a4,1
  c4:	8cbe                	mv	s9,a5
  c6:	02f00793          	li	a5,47
  ca:	00f70023          	sb	a5,0(a4)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
  ce:	d6840993          	addi	s3,s0,-664
  d2:	4941                	li	s2,16
        if(de.inum == 0){
            continue;
        }
        memmove(p, de.name, DIRSIZ);
  d4:	d6a40b13          	addi	s6,s0,-662
        p[DIRSIZ] = 0;
        if(stat(buf, &st) < 0){
  d8:	d7840a93          	addi	s5,s0,-648
  dc:	d9040a13          	addi	s4,s0,-624
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
  e0:	a09d                	j	146 <find+0x10e>
        fprintf(2, "find: cannot open %s\n", dir);
  e2:	864a                	mv	a2,s2
  e4:	00001597          	auipc	a1,0x1
  e8:	adc58593          	addi	a1,a1,-1316 # bc0 <malloc+0xf8>
  ec:	4509                	li	a0,2
  ee:	0f9000ef          	jal	9e6 <fprintf>
        return;
  f2:	aa89                	j	244 <find+0x20c>
        fprintf(2, "find: cannot stat %s\n", dir);
  f4:	864a                	mv	a2,s2
  f6:	00001597          	auipc	a1,0x1
  fa:	aea58593          	addi	a1,a1,-1302 # be0 <malloc+0x118>
  fe:	4509                	li	a0,2
 100:	0e7000ef          	jal	9e6 <fprintf>
        close(fd);
 104:	8526                	mv	a0,s1
 106:	4e6000ef          	jal	5ec <close>
        return;
 10a:	29813483          	ld	s1,664(sp)
 10e:	aa1d                	j	244 <find+0x20c>
        printf("find: path too long\n");
 110:	00001517          	auipc	a0,0x1
 114:	ae850513          	addi	a0,a0,-1304 # bf8 <malloc+0x130>
 118:	0f9000ef          	jal	a10 <printf>
        close(fd);
 11c:	8526                	mv	a0,s1
 11e:	4ce000ef          	jal	5ec <close>
        return;
 122:	29813483          	ld	s1,664(sp)
 126:	aa39                	j	244 <find+0x20c>
            fprintf(2, "find: cannot stat %s\n", buf);
 128:	d9040613          	addi	a2,s0,-624
 12c:	00001597          	auipc	a1,0x1
 130:	ab458593          	addi	a1,a1,-1356 # be0 <malloc+0x118>
 134:	4509                	li	a0,2
 136:	0b1000ef          	jal	9e6 <fprintf>
            continue;
 13a:	a031                	j	146 <find+0x10e>
        if(st.type == T_DIR){
            if(strcmp(p, ".") && strcmp(p, "..")){
                find(buf, filename, cmd_flag, cmd_argv, cmd_length);
            }
        }
        if(st.type == T_FILE && !strcmp(get_filename(buf), filename)){
 13c:	d8041703          	lh	a4,-640(s0)
 140:	4789                	li	a5,2
 142:	06f70a63          	beq	a4,a5,1b6 <find+0x17e>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 146:	864a                	mv	a2,s2
 148:	85ce                	mv	a1,s3
 14a:	8526                	mv	a0,s1
 14c:	490000ef          	jal	5dc <read>
 150:	0d251b63          	bne	a0,s2,226 <find+0x1ee>
        if(de.inum == 0){
 154:	d6845783          	lhu	a5,-664(s0)
 158:	d7fd                	beqz	a5,146 <find+0x10e>
        memmove(p, de.name, DIRSIZ);
 15a:	4639                	li	a2,14
 15c:	85da                	mv	a1,s6
 15e:	8566                	mv	a0,s9
 160:	386000ef          	jal	4e6 <memmove>
        p[DIRSIZ] = 0;
 164:	d5043783          	ld	a5,-688(s0)
 168:	000787a3          	sb	zero,15(a5)
        if(stat(buf, &st) < 0){
 16c:	85d6                	mv	a1,s5
 16e:	8552                	mv	a0,s4
 170:	2ee000ef          	jal	45e <stat>
 174:	fa054ae3          	bltz	a0,128 <find+0xf0>
        if(st.type == T_DIR){
 178:	d8041783          	lh	a5,-640(s0)
 17c:	4705                	li	a4,1
 17e:	fae79fe3          	bne	a5,a4,13c <find+0x104>
            if(strcmp(p, ".") && strcmp(p, "..")){
 182:	00001597          	auipc	a1,0x1
 186:	a8e58593          	addi	a1,a1,-1394 # c10 <malloc+0x148>
 18a:	8566                	mv	a0,s9
 18c:	1b2000ef          	jal	33e <strcmp>
 190:	d555                	beqz	a0,13c <find+0x104>
 192:	00001597          	auipc	a1,0x1
 196:	a8658593          	addi	a1,a1,-1402 # c18 <malloc+0x150>
 19a:	8566                	mv	a0,s9
 19c:	1a2000ef          	jal	33e <strcmp>
 1a0:	dd51                	beqz	a0,13c <find+0x104>
                find(buf, filename, cmd_flag, cmd_argv, cmd_length);
 1a2:	875e                	mv	a4,s7
 1a4:	d5843683          	ld	a3,-680(s0)
 1a8:	866e                	mv	a2,s11
 1aa:	85ea                	mv	a1,s10
 1ac:	d9040513          	addi	a0,s0,-624
 1b0:	e89ff0ef          	jal	38 <find>
 1b4:	b761                	j	13c <find+0x104>
        if(st.type == T_FILE && !strcmp(get_filename(buf), filename)){
 1b6:	d9040513          	addi	a0,s0,-624
 1ba:	e47ff0ef          	jal	0 <get_filename>
 1be:	85ea                	mv	a1,s10
 1c0:	17e000ef          	jal	33e <strcmp>
 1c4:	f149                	bnez	a0,146 <find+0x10e>
            if(!cmd_flag){
 1c6:	000d9b63          	bnez	s11,1dc <find+0x1a4>
                printf("%s\n", buf);
 1ca:	d9040593          	addi	a1,s0,-624
 1ce:	00001517          	auipc	a0,0x1
 1d2:	a5250513          	addi	a0,a0,-1454 # c20 <malloc+0x158>
 1d6:	03b000ef          	jal	a10 <printf>
 1da:	b7b5                	j	146 <find+0x10e>
 1dc:	27813023          	sd	s8,608(sp)
            }else{
                cmd_argv[cmd_length++] = buf;
 1e0:	001b8c1b          	addiw	s8,s7,1
 1e4:	003b9793          	slli	a5,s7,0x3
 1e8:	d5843b83          	ld	s7,-680(s0)
 1ec:	97de                	add	a5,a5,s7
 1ee:	d9040713          	addi	a4,s0,-624
 1f2:	e398                	sd	a4,0(a5)
                if(fork() == 0){
 1f4:	3c8000ef          	jal	5bc <fork>
 1f8:	e105                	bnez	a0,218 <find+0x1e0>
                    exec(cmd_argv[0], cmd_argv);
 1fa:	85de                	mv	a1,s7
 1fc:	000bb503          	ld	a0,0(s7)
 200:	3fc000ef          	jal	5fc <exec>
                    printf("exec error\n");
 204:	00001517          	auipc	a0,0x1
 208:	a2450513          	addi	a0,a0,-1500 # c28 <malloc+0x160>
 20c:	005000ef          	jal	a10 <printf>
                cmd_argv[cmd_length++] = buf;
 210:	8be2                	mv	s7,s8
 212:	26013c03          	ld	s8,608(sp)
 216:	bf05                	j	146 <find+0x10e>
                }else{
                    wait(0);
 218:	4501                	li	a0,0
 21a:	3b2000ef          	jal	5cc <wait>
                cmd_argv[cmd_length++] = buf;
 21e:	8be2                	mv	s7,s8
 220:	26013c03          	ld	s8,608(sp)
 224:	b70d                	j	146 <find+0x10e>
                }
            }
        }
    }
    close(fd);
 226:	8526                	mv	a0,s1
 228:	3c4000ef          	jal	5ec <close>
 22c:	29813483          	ld	s1,664(sp)
 230:	28813983          	ld	s3,648(sp)
 234:	28013a03          	ld	s4,640(sp)
 238:	27813a83          	ld	s5,632(sp)
 23c:	27013b03          	ld	s6,624(sp)
 240:	25813c83          	ld	s9,600(sp)
}
 244:	2a813083          	ld	ra,680(sp)
 248:	2a013403          	ld	s0,672(sp)
 24c:	29013903          	ld	s2,656(sp)
 250:	26813b83          	ld	s7,616(sp)
 254:	25013d03          	ld	s10,592(sp)
 258:	24813d83          	ld	s11,584(sp)
 25c:	2b010113          	addi	sp,sp,688
 260:	8082                	ret

0000000000000262 <main>:

int
main(int argc, char *argv[])
{
 262:	7169                	addi	sp,sp,-304
 264:	f606                	sd	ra,296(sp)
 266:	f222                	sd	s0,288(sp)
 268:	ee26                	sd	s1,280(sp)
 26a:	1a00                	addi	s0,sp,304
 26c:	84ae                	mv	s1,a1
    if(argc == 3){
 26e:	478d                	li	a5,3
 270:	06f50863          	beq	a0,a5,2e0 <main+0x7e>
 274:	ea4a                	sd	s2,272(sp)
 276:	e64e                	sd	s3,264(sp)
 278:	892a                	mv	s2,a0
        find(argv[1], argv[2], 0, 0, 0);
        exit(0);
    }else if(!strcmp(argv[3], "-exec")){
 27a:	00001597          	auipc	a1,0x1
 27e:	9be58593          	addi	a1,a1,-1602 # c38 <malloc+0x170>
 282:	6c88                	ld	a0,24(s1)
 284:	0ba000ef          	jal	33e <strcmp>
 288:	89aa                	mv	s3,a0
 28a:	e53d                	bnez	a0,2f8 <main+0x96>
        char* cmd_argv[MAXARG] = {0};
 28c:	10000613          	li	a2,256
 290:	4581                	li	a1,0
 292:	ed040513          	addi	a0,s0,-304
 296:	104000ef          	jal	39a <memset>
        int cmd_length = 0;
        for(int i = 4; i < argc; i++){
 29a:	4791                	li	a5,4
 29c:	0327d763          	bge	a5,s2,2ca <main+0x68>
 2a0:	02048713          	addi	a4,s1,32
 2a4:	ed040793          	addi	a5,s0,-304
 2a8:	ffb9061b          	addiw	a2,s2,-5
 2ac:	02061693          	slli	a3,a2,0x20
 2b0:	01d6d613          	srli	a2,a3,0x1d
 2b4:	ed840693          	addi	a3,s0,-296
 2b8:	9636                	add	a2,a2,a3
            cmd_argv[i-4] = argv[i];
 2ba:	6314                	ld	a3,0(a4)
 2bc:	e394                	sd	a3,0(a5)
        for(int i = 4; i < argc; i++){
 2be:	0721                	addi	a4,a4,8
 2c0:	07a1                	addi	a5,a5,8
 2c2:	fec79ce3          	bne	a5,a2,2ba <main+0x58>
 2c6:	ffc9099b          	addiw	s3,s2,-4
            cmd_length++;
        }
        find(argv[1], argv[2], 1, cmd_argv, cmd_length);
 2ca:	874e                	mv	a4,s3
 2cc:	ed040693          	addi	a3,s0,-304
 2d0:	4605                	li	a2,1
 2d2:	688c                	ld	a1,16(s1)
 2d4:	6488                	ld	a0,8(s1)
 2d6:	d63ff0ef          	jal	38 <find>
    }else{
        fprintf(2, "Usage: find [directory] [filename] (-exec [cmd])\n");
        exit(1);
    }
    exit(0);
 2da:	4501                	li	a0,0
 2dc:	2e8000ef          	jal	5c4 <exit>
 2e0:	ea4a                	sd	s2,272(sp)
 2e2:	e64e                	sd	s3,264(sp)
        find(argv[1], argv[2], 0, 0, 0);
 2e4:	4701                	li	a4,0
 2e6:	4681                	li	a3,0
 2e8:	4601                	li	a2,0
 2ea:	698c                	ld	a1,16(a1)
 2ec:	6488                	ld	a0,8(s1)
 2ee:	d4bff0ef          	jal	38 <find>
        exit(0);
 2f2:	4501                	li	a0,0
 2f4:	2d0000ef          	jal	5c4 <exit>
        fprintf(2, "Usage: find [directory] [filename] (-exec [cmd])\n");
 2f8:	00001597          	auipc	a1,0x1
 2fc:	94858593          	addi	a1,a1,-1720 # c40 <malloc+0x178>
 300:	4509                	li	a0,2
 302:	6e4000ef          	jal	9e6 <fprintf>
        exit(1);
 306:	4505                	li	a0,1
 308:	2bc000ef          	jal	5c4 <exit>

000000000000030c <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 30c:	1141                	addi	sp,sp,-16
 30e:	e406                	sd	ra,8(sp)
 310:	e022                	sd	s0,0(sp)
 312:	0800                	addi	s0,sp,16
  extern int main();
  main();
 314:	f4fff0ef          	jal	262 <main>
  exit(0);
 318:	4501                	li	a0,0
 31a:	2aa000ef          	jal	5c4 <exit>

000000000000031e <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 31e:	1141                	addi	sp,sp,-16
 320:	e406                	sd	ra,8(sp)
 322:	e022                	sd	s0,0(sp)
 324:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 326:	87aa                	mv	a5,a0
 328:	0585                	addi	a1,a1,1
 32a:	0785                	addi	a5,a5,1
 32c:	fff5c703          	lbu	a4,-1(a1)
 330:	fee78fa3          	sb	a4,-1(a5)
 334:	fb75                	bnez	a4,328 <strcpy+0xa>
    ;
  return os;
}
 336:	60a2                	ld	ra,8(sp)
 338:	6402                	ld	s0,0(sp)
 33a:	0141                	addi	sp,sp,16
 33c:	8082                	ret

000000000000033e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 33e:	1141                	addi	sp,sp,-16
 340:	e406                	sd	ra,8(sp)
 342:	e022                	sd	s0,0(sp)
 344:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 346:	00054783          	lbu	a5,0(a0)
 34a:	cb91                	beqz	a5,35e <strcmp+0x20>
 34c:	0005c703          	lbu	a4,0(a1)
 350:	00f71763          	bne	a4,a5,35e <strcmp+0x20>
    p++, q++;
 354:	0505                	addi	a0,a0,1
 356:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 358:	00054783          	lbu	a5,0(a0)
 35c:	fbe5                	bnez	a5,34c <strcmp+0xe>
  return (uchar)*p - (uchar)*q;
 35e:	0005c503          	lbu	a0,0(a1)
}
 362:	40a7853b          	subw	a0,a5,a0
 366:	60a2                	ld	ra,8(sp)
 368:	6402                	ld	s0,0(sp)
 36a:	0141                	addi	sp,sp,16
 36c:	8082                	ret

000000000000036e <strlen>:

uint
strlen(const char *s)
{
 36e:	1141                	addi	sp,sp,-16
 370:	e406                	sd	ra,8(sp)
 372:	e022                	sd	s0,0(sp)
 374:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 376:	00054783          	lbu	a5,0(a0)
 37a:	cf91                	beqz	a5,396 <strlen+0x28>
 37c:	00150793          	addi	a5,a0,1
 380:	86be                	mv	a3,a5
 382:	0785                	addi	a5,a5,1
 384:	fff7c703          	lbu	a4,-1(a5)
 388:	ff65                	bnez	a4,380 <strlen+0x12>
 38a:	40a6853b          	subw	a0,a3,a0
    ;
  return n;
}
 38e:	60a2                	ld	ra,8(sp)
 390:	6402                	ld	s0,0(sp)
 392:	0141                	addi	sp,sp,16
 394:	8082                	ret
  for(n = 0; s[n]; n++)
 396:	4501                	li	a0,0
 398:	bfdd                	j	38e <strlen+0x20>

000000000000039a <memset>:

void*
memset(void *dst, int c, uint n)
{
 39a:	1141                	addi	sp,sp,-16
 39c:	e406                	sd	ra,8(sp)
 39e:	e022                	sd	s0,0(sp)
 3a0:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 3a2:	ca19                	beqz	a2,3b8 <memset+0x1e>
 3a4:	87aa                	mv	a5,a0
 3a6:	1602                	slli	a2,a2,0x20
 3a8:	9201                	srli	a2,a2,0x20
 3aa:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 3ae:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 3b2:	0785                	addi	a5,a5,1
 3b4:	fee79de3          	bne	a5,a4,3ae <memset+0x14>
  }
  return dst;
}
 3b8:	60a2                	ld	ra,8(sp)
 3ba:	6402                	ld	s0,0(sp)
 3bc:	0141                	addi	sp,sp,16
 3be:	8082                	ret

00000000000003c0 <strchr>:

char*
strchr(const char *s, char c)
{
 3c0:	1141                	addi	sp,sp,-16
 3c2:	e406                	sd	ra,8(sp)
 3c4:	e022                	sd	s0,0(sp)
 3c6:	0800                	addi	s0,sp,16
  for(; *s; s++)
 3c8:	00054783          	lbu	a5,0(a0)
 3cc:	cf81                	beqz	a5,3e4 <strchr+0x24>
    if(*s == c)
 3ce:	00f58763          	beq	a1,a5,3dc <strchr+0x1c>
  for(; *s; s++)
 3d2:	0505                	addi	a0,a0,1
 3d4:	00054783          	lbu	a5,0(a0)
 3d8:	fbfd                	bnez	a5,3ce <strchr+0xe>
      return (char*)s;
  return 0;
 3da:	4501                	li	a0,0
}
 3dc:	60a2                	ld	ra,8(sp)
 3de:	6402                	ld	s0,0(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret
  return 0;
 3e4:	4501                	li	a0,0
 3e6:	bfdd                	j	3dc <strchr+0x1c>

00000000000003e8 <gets>:

char*
gets(char *buf, int max)
{
 3e8:	711d                	addi	sp,sp,-96
 3ea:	ec86                	sd	ra,88(sp)
 3ec:	e8a2                	sd	s0,80(sp)
 3ee:	e4a6                	sd	s1,72(sp)
 3f0:	e0ca                	sd	s2,64(sp)
 3f2:	fc4e                	sd	s3,56(sp)
 3f4:	f852                	sd	s4,48(sp)
 3f6:	f456                	sd	s5,40(sp)
 3f8:	f05a                	sd	s6,32(sp)
 3fa:	ec5e                	sd	s7,24(sp)
 3fc:	e862                	sd	s8,16(sp)
 3fe:	1080                	addi	s0,sp,96
 400:	8baa                	mv	s7,a0
 402:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 404:	892a                	mv	s2,a0
 406:	4481                	li	s1,0
    cc = read(0, &c, 1);
 408:	faf40b13          	addi	s6,s0,-81
 40c:	4a85                	li	s5,1
  for(i=0; i+1 < max; ){
 40e:	8c26                	mv	s8,s1
 410:	0014899b          	addiw	s3,s1,1
 414:	84ce                	mv	s1,s3
 416:	0349d463          	bge	s3,s4,43e <gets+0x56>
    cc = read(0, &c, 1);
 41a:	8656                	mv	a2,s5
 41c:	85da                	mv	a1,s6
 41e:	4501                	li	a0,0
 420:	1bc000ef          	jal	5dc <read>
    if(cc < 1)
 424:	00a05d63          	blez	a0,43e <gets+0x56>
      break;
    buf[i++] = c;
 428:	faf44783          	lbu	a5,-81(s0)
 42c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 430:	0905                	addi	s2,s2,1
 432:	ff678713          	addi	a4,a5,-10
 436:	c319                	beqz	a4,43c <gets+0x54>
 438:	17cd                	addi	a5,a5,-13
 43a:	fbf1                	bnez	a5,40e <gets+0x26>
    buf[i++] = c;
 43c:	8c4e                	mv	s8,s3
      break;
  }
  buf[i] = '\0';
 43e:	9c5e                	add	s8,s8,s7
 440:	000c0023          	sb	zero,0(s8)
  return buf;
}
 444:	855e                	mv	a0,s7
 446:	60e6                	ld	ra,88(sp)
 448:	6446                	ld	s0,80(sp)
 44a:	64a6                	ld	s1,72(sp)
 44c:	6906                	ld	s2,64(sp)
 44e:	79e2                	ld	s3,56(sp)
 450:	7a42                	ld	s4,48(sp)
 452:	7aa2                	ld	s5,40(sp)
 454:	7b02                	ld	s6,32(sp)
 456:	6be2                	ld	s7,24(sp)
 458:	6c42                	ld	s8,16(sp)
 45a:	6125                	addi	sp,sp,96
 45c:	8082                	ret

000000000000045e <stat>:

int
stat(const char *n, struct stat *st)
{
 45e:	1101                	addi	sp,sp,-32
 460:	ec06                	sd	ra,24(sp)
 462:	e822                	sd	s0,16(sp)
 464:	e04a                	sd	s2,0(sp)
 466:	1000                	addi	s0,sp,32
 468:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 46a:	4581                	li	a1,0
 46c:	198000ef          	jal	604 <open>
  if(fd < 0)
 470:	02054263          	bltz	a0,494 <stat+0x36>
 474:	e426                	sd	s1,8(sp)
 476:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 478:	85ca                	mv	a1,s2
 47a:	1a2000ef          	jal	61c <fstat>
 47e:	892a                	mv	s2,a0
  close(fd);
 480:	8526                	mv	a0,s1
 482:	16a000ef          	jal	5ec <close>
  return r;
 486:	64a2                	ld	s1,8(sp)
}
 488:	854a                	mv	a0,s2
 48a:	60e2                	ld	ra,24(sp)
 48c:	6442                	ld	s0,16(sp)
 48e:	6902                	ld	s2,0(sp)
 490:	6105                	addi	sp,sp,32
 492:	8082                	ret
    return -1;
 494:	57fd                	li	a5,-1
 496:	893e                	mv	s2,a5
 498:	bfc5                	j	488 <stat+0x2a>

000000000000049a <atoi>:

int
atoi(const char *s)
{
 49a:	1141                	addi	sp,sp,-16
 49c:	e406                	sd	ra,8(sp)
 49e:	e022                	sd	s0,0(sp)
 4a0:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a2:	00054683          	lbu	a3,0(a0)
 4a6:	fd06879b          	addiw	a5,a3,-48
 4aa:	0ff7f793          	zext.b	a5,a5
 4ae:	4625                	li	a2,9
 4b0:	02f66963          	bltu	a2,a5,4e2 <atoi+0x48>
 4b4:	872a                	mv	a4,a0
  n = 0;
 4b6:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 4b8:	0705                	addi	a4,a4,1
 4ba:	0025179b          	slliw	a5,a0,0x2
 4be:	9fa9                	addw	a5,a5,a0
 4c0:	0017979b          	slliw	a5,a5,0x1
 4c4:	9fb5                	addw	a5,a5,a3
 4c6:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 4ca:	00074683          	lbu	a3,0(a4)
 4ce:	fd06879b          	addiw	a5,a3,-48
 4d2:	0ff7f793          	zext.b	a5,a5
 4d6:	fef671e3          	bgeu	a2,a5,4b8 <atoi+0x1e>
  return n;
}
 4da:	60a2                	ld	ra,8(sp)
 4dc:	6402                	ld	s0,0(sp)
 4de:	0141                	addi	sp,sp,16
 4e0:	8082                	ret
  n = 0;
 4e2:	4501                	li	a0,0
 4e4:	bfdd                	j	4da <atoi+0x40>

00000000000004e6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e6:	1141                	addi	sp,sp,-16
 4e8:	e406                	sd	ra,8(sp)
 4ea:	e022                	sd	s0,0(sp)
 4ec:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4ee:	02b57563          	bgeu	a0,a1,518 <memmove+0x32>
    while(n-- > 0)
 4f2:	00c05f63          	blez	a2,510 <memmove+0x2a>
 4f6:	1602                	slli	a2,a2,0x20
 4f8:	9201                	srli	a2,a2,0x20
 4fa:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 4fe:	872a                	mv	a4,a0
      *dst++ = *src++;
 500:	0585                	addi	a1,a1,1
 502:	0705                	addi	a4,a4,1
 504:	fff5c683          	lbu	a3,-1(a1)
 508:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 50c:	fee79ae3          	bne	a5,a4,500 <memmove+0x1a>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 510:	60a2                	ld	ra,8(sp)
 512:	6402                	ld	s0,0(sp)
 514:	0141                	addi	sp,sp,16
 516:	8082                	ret
    while(n-- > 0)
 518:	fec05ce3          	blez	a2,510 <memmove+0x2a>
    dst += n;
 51c:	00c50733          	add	a4,a0,a2
    src += n;
 520:	95b2                	add	a1,a1,a2
 522:	fff6079b          	addiw	a5,a2,-1
 526:	1782                	slli	a5,a5,0x20
 528:	9381                	srli	a5,a5,0x20
 52a:	fff7c793          	not	a5,a5
 52e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 530:	15fd                	addi	a1,a1,-1
 532:	177d                	addi	a4,a4,-1
 534:	0005c683          	lbu	a3,0(a1)
 538:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 53c:	fef71ae3          	bne	a4,a5,530 <memmove+0x4a>
 540:	bfc1                	j	510 <memmove+0x2a>

0000000000000542 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 542:	1141                	addi	sp,sp,-16
 544:	e406                	sd	ra,8(sp)
 546:	e022                	sd	s0,0(sp)
 548:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 54a:	c61d                	beqz	a2,578 <memcmp+0x36>
 54c:	1602                	slli	a2,a2,0x20
 54e:	9201                	srli	a2,a2,0x20
 550:	00c506b3          	add	a3,a0,a2
    if (*p1 != *p2) {
 554:	00054783          	lbu	a5,0(a0)
 558:	0005c703          	lbu	a4,0(a1)
 55c:	00e79863          	bne	a5,a4,56c <memcmp+0x2a>
      return *p1 - *p2;
    }
    p1++;
 560:	0505                	addi	a0,a0,1
    p2++;
 562:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 564:	fed518e3          	bne	a0,a3,554 <memcmp+0x12>
  }
  return 0;
 568:	4501                	li	a0,0
 56a:	a019                	j	570 <memcmp+0x2e>
      return *p1 - *p2;
 56c:	40e7853b          	subw	a0,a5,a4
}
 570:	60a2                	ld	ra,8(sp)
 572:	6402                	ld	s0,0(sp)
 574:	0141                	addi	sp,sp,16
 576:	8082                	ret
  return 0;
 578:	4501                	li	a0,0
 57a:	bfdd                	j	570 <memcmp+0x2e>

000000000000057c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 57c:	1141                	addi	sp,sp,-16
 57e:	e406                	sd	ra,8(sp)
 580:	e022                	sd	s0,0(sp)
 582:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 584:	f63ff0ef          	jal	4e6 <memmove>
}
 588:	60a2                	ld	ra,8(sp)
 58a:	6402                	ld	s0,0(sp)
 58c:	0141                	addi	sp,sp,16
 58e:	8082                	ret

0000000000000590 <sbrk>:

char *
sbrk(int n) {
 590:	1141                	addi	sp,sp,-16
 592:	e406                	sd	ra,8(sp)
 594:	e022                	sd	s0,0(sp)
 596:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 598:	4585                	li	a1,1
 59a:	0b2000ef          	jal	64c <sys_sbrk>
}
 59e:	60a2                	ld	ra,8(sp)
 5a0:	6402                	ld	s0,0(sp)
 5a2:	0141                	addi	sp,sp,16
 5a4:	8082                	ret

00000000000005a6 <sbrklazy>:

char *
sbrklazy(int n) {
 5a6:	1141                	addi	sp,sp,-16
 5a8:	e406                	sd	ra,8(sp)
 5aa:	e022                	sd	s0,0(sp)
 5ac:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 5ae:	4589                	li	a1,2
 5b0:	09c000ef          	jal	64c <sys_sbrk>
}
 5b4:	60a2                	ld	ra,8(sp)
 5b6:	6402                	ld	s0,0(sp)
 5b8:	0141                	addi	sp,sp,16
 5ba:	8082                	ret

00000000000005bc <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5bc:	4885                	li	a7,1
 ecall
 5be:	00000073          	ecall
 ret
 5c2:	8082                	ret

00000000000005c4 <exit>:
.global exit
exit:
 li a7, SYS_exit
 5c4:	4889                	li	a7,2
 ecall
 5c6:	00000073          	ecall
 ret
 5ca:	8082                	ret

00000000000005cc <wait>:
.global wait
wait:
 li a7, SYS_wait
 5cc:	488d                	li	a7,3
 ecall
 5ce:	00000073          	ecall
 ret
 5d2:	8082                	ret

00000000000005d4 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5d4:	4891                	li	a7,4
 ecall
 5d6:	00000073          	ecall
 ret
 5da:	8082                	ret

00000000000005dc <read>:
.global read
read:
 li a7, SYS_read
 5dc:	4895                	li	a7,5
 ecall
 5de:	00000073          	ecall
 ret
 5e2:	8082                	ret

00000000000005e4 <write>:
.global write
write:
 li a7, SYS_write
 5e4:	48c1                	li	a7,16
 ecall
 5e6:	00000073          	ecall
 ret
 5ea:	8082                	ret

00000000000005ec <close>:
.global close
close:
 li a7, SYS_close
 5ec:	48d5                	li	a7,21
 ecall
 5ee:	00000073          	ecall
 ret
 5f2:	8082                	ret

00000000000005f4 <kill>:
.global kill
kill:
 li a7, SYS_kill
 5f4:	4899                	li	a7,6
 ecall
 5f6:	00000073          	ecall
 ret
 5fa:	8082                	ret

00000000000005fc <exec>:
.global exec
exec:
 li a7, SYS_exec
 5fc:	489d                	li	a7,7
 ecall
 5fe:	00000073          	ecall
 ret
 602:	8082                	ret

0000000000000604 <open>:
.global open
open:
 li a7, SYS_open
 604:	48bd                	li	a7,15
 ecall
 606:	00000073          	ecall
 ret
 60a:	8082                	ret

000000000000060c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 60c:	48c5                	li	a7,17
 ecall
 60e:	00000073          	ecall
 ret
 612:	8082                	ret

0000000000000614 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 614:	48c9                	li	a7,18
 ecall
 616:	00000073          	ecall
 ret
 61a:	8082                	ret

000000000000061c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 61c:	48a1                	li	a7,8
 ecall
 61e:	00000073          	ecall
 ret
 622:	8082                	ret

0000000000000624 <link>:
.global link
link:
 li a7, SYS_link
 624:	48cd                	li	a7,19
 ecall
 626:	00000073          	ecall
 ret
 62a:	8082                	ret

000000000000062c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 62c:	48d1                	li	a7,20
 ecall
 62e:	00000073          	ecall
 ret
 632:	8082                	ret

0000000000000634 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 634:	48a5                	li	a7,9
 ecall
 636:	00000073          	ecall
 ret
 63a:	8082                	ret

000000000000063c <dup>:
.global dup
dup:
 li a7, SYS_dup
 63c:	48a9                	li	a7,10
 ecall
 63e:	00000073          	ecall
 ret
 642:	8082                	ret

0000000000000644 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 644:	48ad                	li	a7,11
 ecall
 646:	00000073          	ecall
 ret
 64a:	8082                	ret

000000000000064c <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 64c:	48b1                	li	a7,12
 ecall
 64e:	00000073          	ecall
 ret
 652:	8082                	ret

0000000000000654 <pause>:
.global pause
pause:
 li a7, SYS_pause
 654:	48b5                	li	a7,13
 ecall
 656:	00000073          	ecall
 ret
 65a:	8082                	ret

000000000000065c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 65c:	48b9                	li	a7,14
 ecall
 65e:	00000073          	ecall
 ret
 662:	8082                	ret

0000000000000664 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 664:	1101                	addi	sp,sp,-32
 666:	ec06                	sd	ra,24(sp)
 668:	e822                	sd	s0,16(sp)
 66a:	1000                	addi	s0,sp,32
 66c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 670:	4605                	li	a2,1
 672:	fef40593          	addi	a1,s0,-17
 676:	f6fff0ef          	jal	5e4 <write>
}
 67a:	60e2                	ld	ra,24(sp)
 67c:	6442                	ld	s0,16(sp)
 67e:	6105                	addi	sp,sp,32
 680:	8082                	ret

0000000000000682 <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 682:	715d                	addi	sp,sp,-80
 684:	e486                	sd	ra,72(sp)
 686:	e0a2                	sd	s0,64(sp)
 688:	f84a                	sd	s2,48(sp)
 68a:	f44e                	sd	s3,40(sp)
 68c:	0880                	addi	s0,sp,80
 68e:	892a                	mv	s2,a0
  char buf[20];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 690:	cac1                	beqz	a3,720 <printint+0x9e>
 692:	0805d763          	bgez	a1,720 <printint+0x9e>
    neg = 1;
    x = -xx;
 696:	40b005bb          	negw	a1,a1
    neg = 1;
 69a:	4305                	li	t1,1
  } else {
    x = xx;
  }

  i = 0;
 69c:	fb840993          	addi	s3,s0,-72
  neg = 0;
 6a0:	86ce                	mv	a3,s3
  i = 0;
 6a2:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 6a4:	00000817          	auipc	a6,0x0
 6a8:	5dc80813          	addi	a6,a6,1500 # c80 <digits>
 6ac:	88ba                	mv	a7,a4
 6ae:	0017051b          	addiw	a0,a4,1
 6b2:	872a                	mv	a4,a0
 6b4:	02c5f7bb          	remuw	a5,a1,a2
 6b8:	1782                	slli	a5,a5,0x20
 6ba:	9381                	srli	a5,a5,0x20
 6bc:	97c2                	add	a5,a5,a6
 6be:	0007c783          	lbu	a5,0(a5)
 6c2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 6c6:	87ae                	mv	a5,a1
 6c8:	02c5d5bb          	divuw	a1,a1,a2
 6cc:	0685                	addi	a3,a3,1
 6ce:	fcc7ffe3          	bgeu	a5,a2,6ac <printint+0x2a>
  if(neg)
 6d2:	00030c63          	beqz	t1,6ea <printint+0x68>
    buf[i++] = '-';
 6d6:	fd050793          	addi	a5,a0,-48
 6da:	00878533          	add	a0,a5,s0
 6de:	02d00793          	li	a5,45
 6e2:	fef50423          	sb	a5,-24(a0)
 6e6:	0028871b          	addiw	a4,a7,2

  while(--i >= 0)
 6ea:	02e05563          	blez	a4,714 <printint+0x92>
 6ee:	fc26                	sd	s1,56(sp)
 6f0:	377d                	addiw	a4,a4,-1
 6f2:	00e984b3          	add	s1,s3,a4
 6f6:	19fd                	addi	s3,s3,-1
 6f8:	99ba                	add	s3,s3,a4
 6fa:	1702                	slli	a4,a4,0x20
 6fc:	9301                	srli	a4,a4,0x20
 6fe:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 702:	0004c583          	lbu	a1,0(s1)
 706:	854a                	mv	a0,s2
 708:	f5dff0ef          	jal	664 <putc>
  while(--i >= 0)
 70c:	14fd                	addi	s1,s1,-1
 70e:	ff349ae3          	bne	s1,s3,702 <printint+0x80>
 712:	74e2                	ld	s1,56(sp)
}
 714:	60a6                	ld	ra,72(sp)
 716:	6406                	ld	s0,64(sp)
 718:	7942                	ld	s2,48(sp)
 71a:	79a2                	ld	s3,40(sp)
 71c:	6161                	addi	sp,sp,80
 71e:	8082                	ret
    x = xx;
 720:	2581                	sext.w	a1,a1
  neg = 0;
 722:	4301                	li	t1,0
 724:	bfa5                	j	69c <printint+0x1a>

0000000000000726 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 726:	711d                	addi	sp,sp,-96
 728:	ec86                	sd	ra,88(sp)
 72a:	e8a2                	sd	s0,80(sp)
 72c:	e4a6                	sd	s1,72(sp)
 72e:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 730:	0005c483          	lbu	s1,0(a1)
 734:	22048363          	beqz	s1,95a <vprintf+0x234>
 738:	e0ca                	sd	s2,64(sp)
 73a:	fc4e                	sd	s3,56(sp)
 73c:	f852                	sd	s4,48(sp)
 73e:	f456                	sd	s5,40(sp)
 740:	f05a                	sd	s6,32(sp)
 742:	ec5e                	sd	s7,24(sp)
 744:	e862                	sd	s8,16(sp)
 746:	8b2a                	mv	s6,a0
 748:	8a2e                	mv	s4,a1
 74a:	8bb2                	mv	s7,a2
  state = 0;
 74c:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 74e:	4901                	li	s2,0
 750:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 752:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 756:	06400c13          	li	s8,100
 75a:	a00d                	j	77c <vprintf+0x56>
        putc(fd, c0);
 75c:	85a6                	mv	a1,s1
 75e:	855a                	mv	a0,s6
 760:	f05ff0ef          	jal	664 <putc>
 764:	a019                	j	76a <vprintf+0x44>
    } else if(state == '%'){
 766:	03598363          	beq	s3,s5,78c <vprintf+0x66>
  for(i = 0; fmt[i]; i++){
 76a:	0019079b          	addiw	a5,s2,1
 76e:	893e                	mv	s2,a5
 770:	873e                	mv	a4,a5
 772:	97d2                	add	a5,a5,s4
 774:	0007c483          	lbu	s1,0(a5)
 778:	1c048a63          	beqz	s1,94c <vprintf+0x226>
    c0 = fmt[i] & 0xff;
 77c:	0004879b          	sext.w	a5,s1
    if(state == 0){
 780:	fe0993e3          	bnez	s3,766 <vprintf+0x40>
      if(c0 == '%'){
 784:	fd579ce3          	bne	a5,s5,75c <vprintf+0x36>
        state = '%';
 788:	89be                	mv	s3,a5
 78a:	b7c5                	j	76a <vprintf+0x44>
      if(c0) c1 = fmt[i+1] & 0xff;
 78c:	00ea06b3          	add	a3,s4,a4
 790:	0016c603          	lbu	a2,1(a3)
      if(c1) c2 = fmt[i+2] & 0xff;
 794:	1c060863          	beqz	a2,964 <vprintf+0x23e>
      if(c0 == 'd'){
 798:	03878763          	beq	a5,s8,7c6 <vprintf+0xa0>
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 79c:	f9478693          	addi	a3,a5,-108
 7a0:	0016b693          	seqz	a3,a3
 7a4:	f9c60593          	addi	a1,a2,-100
 7a8:	e99d                	bnez	a1,7de <vprintf+0xb8>
 7aa:	ca95                	beqz	a3,7de <vprintf+0xb8>
        printint(fd, va_arg(ap, uint64), 10, 1);
 7ac:	008b8493          	addi	s1,s7,8
 7b0:	4685                	li	a3,1
 7b2:	4629                	li	a2,10
 7b4:	000bb583          	ld	a1,0(s7)
 7b8:	855a                	mv	a0,s6
 7ba:	ec9ff0ef          	jal	682 <printint>
        i += 1;
 7be:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 7c0:	8ba6                	mv	s7,s1
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 7c2:	4981                	li	s3,0
 7c4:	b75d                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, int), 10, 1);
 7c6:	008b8493          	addi	s1,s7,8
 7ca:	4685                	li	a3,1
 7cc:	4629                	li	a2,10
 7ce:	000ba583          	lw	a1,0(s7)
 7d2:	855a                	mv	a0,s6
 7d4:	eafff0ef          	jal	682 <printint>
 7d8:	8ba6                	mv	s7,s1
      state = 0;
 7da:	4981                	li	s3,0
 7dc:	b779                	j	76a <vprintf+0x44>
      if(c1) c2 = fmt[i+2] & 0xff;
 7de:	9752                	add	a4,a4,s4
 7e0:	00274583          	lbu	a1,2(a4)
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 7e4:	f9460713          	addi	a4,a2,-108
 7e8:	00173713          	seqz	a4,a4
 7ec:	8f75                	and	a4,a4,a3
 7ee:	f9c58513          	addi	a0,a1,-100
 7f2:	18051363          	bnez	a0,978 <vprintf+0x252>
 7f6:	18070163          	beqz	a4,978 <vprintf+0x252>
        printint(fd, va_arg(ap, uint64), 10, 1);
 7fa:	008b8493          	addi	s1,s7,8
 7fe:	4685                	li	a3,1
 800:	4629                	li	a2,10
 802:	000bb583          	ld	a1,0(s7)
 806:	855a                	mv	a0,s6
 808:	e7bff0ef          	jal	682 <printint>
        i += 2;
 80c:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 80e:	8ba6                	mv	s7,s1
      state = 0;
 810:	4981                	li	s3,0
        i += 2;
 812:	bfa1                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 10, 0);
 814:	008b8493          	addi	s1,s7,8
 818:	4681                	li	a3,0
 81a:	4629                	li	a2,10
 81c:	000be583          	lwu	a1,0(s7)
 820:	855a                	mv	a0,s6
 822:	e61ff0ef          	jal	682 <printint>
 826:	8ba6                	mv	s7,s1
      state = 0;
 828:	4981                	li	s3,0
 82a:	b781                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 82c:	008b8493          	addi	s1,s7,8
 830:	4681                	li	a3,0
 832:	4629                	li	a2,10
 834:	000bb583          	ld	a1,0(s7)
 838:	855a                	mv	a0,s6
 83a:	e49ff0ef          	jal	682 <printint>
        i += 1;
 83e:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 840:	8ba6                	mv	s7,s1
      state = 0;
 842:	4981                	li	s3,0
 844:	b71d                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 846:	008b8493          	addi	s1,s7,8
 84a:	4681                	li	a3,0
 84c:	4629                	li	a2,10
 84e:	000bb583          	ld	a1,0(s7)
 852:	855a                	mv	a0,s6
 854:	e2fff0ef          	jal	682 <printint>
        i += 2;
 858:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 85a:	8ba6                	mv	s7,s1
      state = 0;
 85c:	4981                	li	s3,0
        i += 2;
 85e:	b731                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 16, 0);
 860:	008b8493          	addi	s1,s7,8
 864:	4681                	li	a3,0
 866:	4641                	li	a2,16
 868:	000be583          	lwu	a1,0(s7)
 86c:	855a                	mv	a0,s6
 86e:	e15ff0ef          	jal	682 <printint>
 872:	8ba6                	mv	s7,s1
      state = 0;
 874:	4981                	li	s3,0
 876:	bdd5                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 878:	008b8493          	addi	s1,s7,8
 87c:	4681                	li	a3,0
 87e:	4641                	li	a2,16
 880:	000bb583          	ld	a1,0(s7)
 884:	855a                	mv	a0,s6
 886:	dfdff0ef          	jal	682 <printint>
        i += 1;
 88a:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 88c:	8ba6                	mv	s7,s1
      state = 0;
 88e:	4981                	li	s3,0
 890:	bde9                	j	76a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 892:	008b8493          	addi	s1,s7,8
 896:	4681                	li	a3,0
 898:	4641                	li	a2,16
 89a:	000bb583          	ld	a1,0(s7)
 89e:	855a                	mv	a0,s6
 8a0:	de3ff0ef          	jal	682 <printint>
        i += 2;
 8a4:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 8a6:	8ba6                	mv	s7,s1
      state = 0;
 8a8:	4981                	li	s3,0
        i += 2;
 8aa:	b5c1                	j	76a <vprintf+0x44>
 8ac:	e466                	sd	s9,8(sp)
        printptr(fd, va_arg(ap, uint64));
 8ae:	008b8793          	addi	a5,s7,8
 8b2:	8cbe                	mv	s9,a5
 8b4:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 8b8:	03000593          	li	a1,48
 8bc:	855a                	mv	a0,s6
 8be:	da7ff0ef          	jal	664 <putc>
  putc(fd, 'x');
 8c2:	07800593          	li	a1,120
 8c6:	855a                	mv	a0,s6
 8c8:	d9dff0ef          	jal	664 <putc>
 8cc:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 8ce:	00000b97          	auipc	s7,0x0
 8d2:	3b2b8b93          	addi	s7,s7,946 # c80 <digits>
 8d6:	03c9d793          	srli	a5,s3,0x3c
 8da:	97de                	add	a5,a5,s7
 8dc:	0007c583          	lbu	a1,0(a5)
 8e0:	855a                	mv	a0,s6
 8e2:	d83ff0ef          	jal	664 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8e6:	0992                	slli	s3,s3,0x4
 8e8:	34fd                	addiw	s1,s1,-1
 8ea:	f4f5                	bnez	s1,8d6 <vprintf+0x1b0>
        printptr(fd, va_arg(ap, uint64));
 8ec:	8be6                	mv	s7,s9
      state = 0;
 8ee:	4981                	li	s3,0
 8f0:	6ca2                	ld	s9,8(sp)
 8f2:	bda5                	j	76a <vprintf+0x44>
        putc(fd, va_arg(ap, uint32));
 8f4:	008b8493          	addi	s1,s7,8
 8f8:	000bc583          	lbu	a1,0(s7)
 8fc:	855a                	mv	a0,s6
 8fe:	d67ff0ef          	jal	664 <putc>
 902:	8ba6                	mv	s7,s1
      state = 0;
 904:	4981                	li	s3,0
 906:	b595                	j	76a <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 908:	008b8993          	addi	s3,s7,8
 90c:	000bb483          	ld	s1,0(s7)
 910:	cc91                	beqz	s1,92c <vprintf+0x206>
        for(; *s; s++)
 912:	0004c583          	lbu	a1,0(s1)
 916:	c985                	beqz	a1,946 <vprintf+0x220>
          putc(fd, *s);
 918:	855a                	mv	a0,s6
 91a:	d4bff0ef          	jal	664 <putc>
        for(; *s; s++)
 91e:	0485                	addi	s1,s1,1
 920:	0004c583          	lbu	a1,0(s1)
 924:	f9f5                	bnez	a1,918 <vprintf+0x1f2>
        if((s = va_arg(ap, char*)) == 0)
 926:	8bce                	mv	s7,s3
      state = 0;
 928:	4981                	li	s3,0
 92a:	b581                	j	76a <vprintf+0x44>
          s = "(null)";
 92c:	00000497          	auipc	s1,0x0
 930:	34c48493          	addi	s1,s1,844 # c78 <malloc+0x1b0>
        for(; *s; s++)
 934:	02800593          	li	a1,40
 938:	b7c5                	j	918 <vprintf+0x1f2>
        putc(fd, '%');
 93a:	85be                	mv	a1,a5
 93c:	855a                	mv	a0,s6
 93e:	d27ff0ef          	jal	664 <putc>
      state = 0;
 942:	4981                	li	s3,0
 944:	b51d                	j	76a <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 946:	8bce                	mv	s7,s3
      state = 0;
 948:	4981                	li	s3,0
 94a:	b505                	j	76a <vprintf+0x44>
 94c:	6906                	ld	s2,64(sp)
 94e:	79e2                	ld	s3,56(sp)
 950:	7a42                	ld	s4,48(sp)
 952:	7aa2                	ld	s5,40(sp)
 954:	7b02                	ld	s6,32(sp)
 956:	6be2                	ld	s7,24(sp)
 958:	6c42                	ld	s8,16(sp)
    }
  }
}
 95a:	60e6                	ld	ra,88(sp)
 95c:	6446                	ld	s0,80(sp)
 95e:	64a6                	ld	s1,72(sp)
 960:	6125                	addi	sp,sp,96
 962:	8082                	ret
      if(c0 == 'd'){
 964:	06400713          	li	a4,100
 968:	e4e78fe3          	beq	a5,a4,7c6 <vprintf+0xa0>
      } else if(c0 == 'l' && c1 == 'd'){
 96c:	f9478693          	addi	a3,a5,-108
 970:	0016b693          	seqz	a3,a3
      c1 = c2 = 0;
 974:	85b2                	mv	a1,a2
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 976:	4701                	li	a4,0
      } else if(c0 == 'u'){
 978:	07500513          	li	a0,117
 97c:	e8a78ce3          	beq	a5,a0,814 <vprintf+0xee>
      } else if(c0 == 'l' && c1 == 'u'){
 980:	f8b60513          	addi	a0,a2,-117
 984:	e119                	bnez	a0,98a <vprintf+0x264>
 986:	ea0693e3          	bnez	a3,82c <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 98a:	f8b58513          	addi	a0,a1,-117
 98e:	e119                	bnez	a0,994 <vprintf+0x26e>
 990:	ea071be3          	bnez	a4,846 <vprintf+0x120>
      } else if(c0 == 'x'){
 994:	07800513          	li	a0,120
 998:	eca784e3          	beq	a5,a0,860 <vprintf+0x13a>
      } else if(c0 == 'l' && c1 == 'x'){
 99c:	f8860613          	addi	a2,a2,-120
 9a0:	e219                	bnez	a2,9a6 <vprintf+0x280>
 9a2:	ec069be3          	bnez	a3,878 <vprintf+0x152>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 9a6:	f8858593          	addi	a1,a1,-120
 9aa:	e199                	bnez	a1,9b0 <vprintf+0x28a>
 9ac:	ee0713e3          	bnez	a4,892 <vprintf+0x16c>
      } else if(c0 == 'p'){
 9b0:	07000713          	li	a4,112
 9b4:	eee78ce3          	beq	a5,a4,8ac <vprintf+0x186>
      } else if(c0 == 'c'){
 9b8:	06300713          	li	a4,99
 9bc:	f2e78ce3          	beq	a5,a4,8f4 <vprintf+0x1ce>
      } else if(c0 == 's'){
 9c0:	07300713          	li	a4,115
 9c4:	f4e782e3          	beq	a5,a4,908 <vprintf+0x1e2>
      } else if(c0 == '%'){
 9c8:	02500713          	li	a4,37
 9cc:	f6e787e3          	beq	a5,a4,93a <vprintf+0x214>
        putc(fd, '%');
 9d0:	02500593          	li	a1,37
 9d4:	855a                	mv	a0,s6
 9d6:	c8fff0ef          	jal	664 <putc>
        putc(fd, c0);
 9da:	85a6                	mv	a1,s1
 9dc:	855a                	mv	a0,s6
 9de:	c87ff0ef          	jal	664 <putc>
      state = 0;
 9e2:	4981                	li	s3,0
 9e4:	b359                	j	76a <vprintf+0x44>

00000000000009e6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9e6:	715d                	addi	sp,sp,-80
 9e8:	ec06                	sd	ra,24(sp)
 9ea:	e822                	sd	s0,16(sp)
 9ec:	1000                	addi	s0,sp,32
 9ee:	e010                	sd	a2,0(s0)
 9f0:	e414                	sd	a3,8(s0)
 9f2:	e818                	sd	a4,16(s0)
 9f4:	ec1c                	sd	a5,24(s0)
 9f6:	03043023          	sd	a6,32(s0)
 9fa:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 9fe:	8622                	mv	a2,s0
 a00:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 a04:	d23ff0ef          	jal	726 <vprintf>
}
 a08:	60e2                	ld	ra,24(sp)
 a0a:	6442                	ld	s0,16(sp)
 a0c:	6161                	addi	sp,sp,80
 a0e:	8082                	ret

0000000000000a10 <printf>:

void
printf(const char *fmt, ...)
{
 a10:	711d                	addi	sp,sp,-96
 a12:	ec06                	sd	ra,24(sp)
 a14:	e822                	sd	s0,16(sp)
 a16:	1000                	addi	s0,sp,32
 a18:	e40c                	sd	a1,8(s0)
 a1a:	e810                	sd	a2,16(s0)
 a1c:	ec14                	sd	a3,24(s0)
 a1e:	f018                	sd	a4,32(s0)
 a20:	f41c                	sd	a5,40(s0)
 a22:	03043823          	sd	a6,48(s0)
 a26:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a2a:	00840613          	addi	a2,s0,8
 a2e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 a32:	85aa                	mv	a1,a0
 a34:	4505                	li	a0,1
 a36:	cf1ff0ef          	jal	726 <vprintf>
}
 a3a:	60e2                	ld	ra,24(sp)
 a3c:	6442                	ld	s0,16(sp)
 a3e:	6125                	addi	sp,sp,96
 a40:	8082                	ret

0000000000000a42 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a42:	1141                	addi	sp,sp,-16
 a44:	e406                	sd	ra,8(sp)
 a46:	e022                	sd	s0,0(sp)
 a48:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a4a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4e:	00001797          	auipc	a5,0x1
 a52:	5b27b783          	ld	a5,1458(a5) # 2000 <freep>
 a56:	a039                	j	a64 <free+0x22>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a58:	6398                	ld	a4,0(a5)
 a5a:	00e7e463          	bltu	a5,a4,a62 <free+0x20>
 a5e:	00e6ea63          	bltu	a3,a4,a72 <free+0x30>
{
 a62:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a64:	fed7fae3          	bgeu	a5,a3,a58 <free+0x16>
 a68:	6398                	ld	a4,0(a5)
 a6a:	00e6e463          	bltu	a3,a4,a72 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a6e:	fee7eae3          	bltu	a5,a4,a62 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a72:	ff852583          	lw	a1,-8(a0)
 a76:	6390                	ld	a2,0(a5)
 a78:	02059813          	slli	a6,a1,0x20
 a7c:	01c85713          	srli	a4,a6,0x1c
 a80:	9736                	add	a4,a4,a3
 a82:	02e60563          	beq	a2,a4,aac <free+0x6a>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a86:	fec53823          	sd	a2,-16(a0)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a8a:	4790                	lw	a2,8(a5)
 a8c:	02061593          	slli	a1,a2,0x20
 a90:	01c5d713          	srli	a4,a1,0x1c
 a94:	973e                	add	a4,a4,a5
 a96:	02e68263          	beq	a3,a4,aba <free+0x78>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a9a:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 a9c:	00001717          	auipc	a4,0x1
 aa0:	56f73223          	sd	a5,1380(a4) # 2000 <freep>
}
 aa4:	60a2                	ld	ra,8(sp)
 aa6:	6402                	ld	s0,0(sp)
 aa8:	0141                	addi	sp,sp,16
 aaa:	8082                	ret
    bp->s.size += p->s.ptr->s.size;
 aac:	4618                	lw	a4,8(a2)
 aae:	9f2d                	addw	a4,a4,a1
 ab0:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 ab4:	6398                	ld	a4,0(a5)
 ab6:	6310                	ld	a2,0(a4)
 ab8:	b7f9                	j	a86 <free+0x44>
    p->s.size += bp->s.size;
 aba:	ff852703          	lw	a4,-8(a0)
 abe:	9f31                	addw	a4,a4,a2
 ac0:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 ac2:	ff053683          	ld	a3,-16(a0)
 ac6:	bfd1                	j	a9a <free+0x58>

0000000000000ac8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ac8:	7139                	addi	sp,sp,-64
 aca:	fc06                	sd	ra,56(sp)
 acc:	f822                	sd	s0,48(sp)
 ace:	f04a                	sd	s2,32(sp)
 ad0:	ec4e                	sd	s3,24(sp)
 ad2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad4:	02051993          	slli	s3,a0,0x20
 ad8:	0209d993          	srli	s3,s3,0x20
 adc:	09bd                	addi	s3,s3,15
 ade:	0049d993          	srli	s3,s3,0x4
 ae2:	2985                	addiw	s3,s3,1
 ae4:	894e                	mv	s2,s3
  if((prevp = freep) == 0){
 ae6:	00001517          	auipc	a0,0x1
 aea:	51a53503          	ld	a0,1306(a0) # 2000 <freep>
 aee:	c905                	beqz	a0,b1e <malloc+0x56>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 af2:	4798                	lw	a4,8(a5)
 af4:	09377663          	bgeu	a4,s3,b80 <malloc+0xb8>
 af8:	f426                	sd	s1,40(sp)
 afa:	e852                	sd	s4,16(sp)
 afc:	e456                	sd	s5,8(sp)
 afe:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 b00:	8a4e                	mv	s4,s3
 b02:	6705                	lui	a4,0x1
 b04:	00e9f363          	bgeu	s3,a4,b0a <malloc+0x42>
 b08:	6a05                	lui	s4,0x1
 b0a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 b0e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b12:	00001497          	auipc	s1,0x1
 b16:	4ee48493          	addi	s1,s1,1262 # 2000 <freep>
  if(p == SBRK_ERROR)
 b1a:	5afd                	li	s5,-1
 b1c:	a83d                	j	b5a <malloc+0x92>
 b1e:	f426                	sd	s1,40(sp)
 b20:	e852                	sd	s4,16(sp)
 b22:	e456                	sd	s5,8(sp)
 b24:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 b26:	00001797          	auipc	a5,0x1
 b2a:	4ea78793          	addi	a5,a5,1258 # 2010 <base>
 b2e:	00001717          	auipc	a4,0x1
 b32:	4cf73923          	sd	a5,1234(a4) # 2000 <freep>
 b36:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 b38:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 b3c:	b7d1                	j	b00 <malloc+0x38>
        prevp->s.ptr = p->s.ptr;
 b3e:	6398                	ld	a4,0(a5)
 b40:	e118                	sd	a4,0(a0)
 b42:	a899                	j	b98 <malloc+0xd0>
  hp->s.size = nu;
 b44:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 b48:	0541                	addi	a0,a0,16
 b4a:	ef9ff0ef          	jal	a42 <free>
  return freep;
 b4e:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 b50:	c125                	beqz	a0,bb0 <malloc+0xe8>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b52:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 b54:	4798                	lw	a4,8(a5)
 b56:	03277163          	bgeu	a4,s2,b78 <malloc+0xb0>
    if(p == freep)
 b5a:	6098                	ld	a4,0(s1)
 b5c:	853e                	mv	a0,a5
 b5e:	fef71ae3          	bne	a4,a5,b52 <malloc+0x8a>
  p = sbrk(nu * sizeof(Header));
 b62:	8552                	mv	a0,s4
 b64:	a2dff0ef          	jal	590 <sbrk>
  if(p == SBRK_ERROR)
 b68:	fd551ee3          	bne	a0,s5,b44 <malloc+0x7c>
        return 0;
 b6c:	4501                	li	a0,0
 b6e:	74a2                	ld	s1,40(sp)
 b70:	6a42                	ld	s4,16(sp)
 b72:	6aa2                	ld	s5,8(sp)
 b74:	6b02                	ld	s6,0(sp)
 b76:	a03d                	j	ba4 <malloc+0xdc>
 b78:	74a2                	ld	s1,40(sp)
 b7a:	6a42                	ld	s4,16(sp)
 b7c:	6aa2                	ld	s5,8(sp)
 b7e:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 b80:	fae90fe3          	beq	s2,a4,b3e <malloc+0x76>
        p->s.size -= nunits;
 b84:	4137073b          	subw	a4,a4,s3
 b88:	c798                	sw	a4,8(a5)
        p += p->s.size;
 b8a:	02071693          	slli	a3,a4,0x20
 b8e:	01c6d713          	srli	a4,a3,0x1c
 b92:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 b94:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 b98:	00001717          	auipc	a4,0x1
 b9c:	46a73423          	sd	a0,1128(a4) # 2000 <freep>
      return (void*)(p + 1);
 ba0:	01078513          	addi	a0,a5,16
  }
}
 ba4:	70e2                	ld	ra,56(sp)
 ba6:	7442                	ld	s0,48(sp)
 ba8:	7902                	ld	s2,32(sp)
 baa:	69e2                	ld	s3,24(sp)
 bac:	6121                	addi	sp,sp,64
 bae:	8082                	ret
 bb0:	74a2                	ld	s1,40(sp)
 bb2:	6a42                	ld	s4,16(sp)
 bb4:	6aa2                	ld	s5,8(sp)
 bb6:	6b02                	ld	s6,0(sp)
 bb8:	b7f5                	j	ba4 <malloc+0xdc>
