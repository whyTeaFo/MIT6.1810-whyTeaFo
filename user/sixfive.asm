
user/_sixfive:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <isSeparators>:
char buf[1];
const char* separators = " -\r\t\n./,";

int
isSeparators(char c)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
   8:	85aa                	mv	a1,a0
    return strchr(separators, c) != 0;
   a:	00002517          	auipc	a0,0x2
   e:	ff653503          	ld	a0,-10(a0) # 2000 <separators>
  12:	27c000ef          	jal	28e <strchr>
}
  16:	00a03533          	snez	a0,a0
  1a:	60a2                	ld	ra,8(sp)
  1c:	6402                	ld	s0,0(sp)
  1e:	0141                	addi	sp,sp,16
  20:	8082                	ret

0000000000000022 <isDivisibleBy5or6>:

int
isDivisibleBy5or6(int n)
{
  22:	1141                	addi	sp,sp,-16
  24:	e406                	sd	ra,8(sp)
  26:	e022                	sd	s0,0(sp)
  28:	0800                	addi	s0,sp,16
    return n % 5 == 0 || n % 6 == 0;
  2a:	666667b7          	lui	a5,0x66666
  2e:	66778793          	addi	a5,a5,1639 # 66666667 <base+0x66664647>
  32:	02f507b3          	mul	a5,a0,a5
  36:	9785                	srai	a5,a5,0x21
  38:	41f5571b          	sraiw	a4,a0,0x1f
  3c:	9f99                	subw	a5,a5,a4
  3e:	0027971b          	slliw	a4,a5,0x2
  42:	9fb9                	addw	a5,a5,a4
  44:	40f507bb          	subw	a5,a0,a5
  48:	c79d                	beqz	a5,76 <isDivisibleBy5or6+0x54>
  4a:	2aaab7b7          	lui	a5,0x2aaab
  4e:	aab78793          	addi	a5,a5,-1365 # 2aaaaaab <base+0x2aaa8a8b>
  52:	02f507b3          	mul	a5,a0,a5
  56:	9381                	srli	a5,a5,0x20
  58:	41f5571b          	sraiw	a4,a0,0x1f
  5c:	9f99                	subw	a5,a5,a4
  5e:	0017971b          	slliw	a4,a5,0x1
  62:	9fb9                	addw	a5,a5,a4
  64:	0017979b          	slliw	a5,a5,0x1
  68:	9d1d                	subw	a0,a0,a5
  6a:	00153513          	seqz	a0,a0
}
  6e:	60a2                	ld	ra,8(sp)
  70:	6402                	ld	s0,0(sp)
  72:	0141                	addi	sp,sp,16
  74:	8082                	ret
    return n % 5 == 0 || n % 6 == 0;
  76:	4505                	li	a0,1
  78:	bfdd                	j	6e <isDivisibleBy5or6+0x4c>

000000000000007a <sixfive>:

void
sixfive(int fd)
{
  7a:	715d                	addi	sp,sp,-80
  7c:	e486                	sd	ra,72(sp)
  7e:	e0a2                	sd	s0,64(sp)
  80:	fc26                	sd	s1,56(sp)
  82:	f84a                	sd	s2,48(sp)
  84:	f44e                	sd	s3,40(sp)
  86:	f052                	sd	s4,32(sp)
  88:	ec56                	sd	s5,24(sp)
  8a:	e85a                	sd	s6,16(sp)
  8c:	e45e                	sd	s7,8(sp)
  8e:	0880                	addi	s0,sp,80
  90:	8aaa                	mv	s5,a0
    int flag = 1;   //no characters other than numbers in string
    int is_number = 0;
    int n = 0;      //number
  92:	4b01                	li	s6,0
    int is_number = 0;
  94:	4901                	li	s2,0
    int flag = 1;   //no characters other than numbers in string
  96:	4485                	li	s1,1

    while(read(fd, buf, 1) > 0){
  98:	8a26                	mv	s4,s1
  9a:	00002997          	auipc	s3,0x2
  9e:	f7698993          	addi	s3,s3,-138 # 2010 <buf>
  a2:	a089                	j	e4 <sixfive+0x6a>
        char c = buf[0];
        if(flag && c >= '0' && c <= '9'){
            n = n*10 + c - '0';
            is_number = 1;
        }else if(isSeparators(c)){
  a4:	f5dff0ef          	jal	0 <isSeparators>
  a8:	84aa                	mv	s1,a0
  aa:	cd0d                	beqz	a0,e4 <sixfive+0x6a>
            if(is_number && flag){
  ac:	00197913          	andi	s2,s2,1
  b0:	02090763          	beqz	s2,de <sixfive+0x64>
  b4:	020b8563          	beqz	s7,de <sixfive+0x64>
                if(isDivisibleBy5or6(n)){
  b8:	855a                	mv	a0,s6
  ba:	f69ff0ef          	jal	22 <isDivisibleBy5or6>
  be:	892a                	mv	s2,a0
  c0:	e501                	bnez	a0,c8 <sixfive+0x4e>
                    printf("%d\n", n);
                }
            }
            n = 0;
  c2:	8b2a                	mv	s6,a0
            is_number = 0;
            flag = 1;
  c4:	4485                	li	s1,1
  c6:	a839                	j	e4 <sixfive+0x6a>
                    printf("%d\n", n);
  c8:	85da                	mv	a1,s6
  ca:	00001517          	auipc	a0,0x1
  ce:	9c650513          	addi	a0,a0,-1594 # a90 <malloc+0xfa>
  d2:	00d000ef          	jal	8de <printf>
            n = 0;
  d6:	4b01                	li	s6,0
            is_number = 0;
  d8:	4901                	li	s2,0
            flag = 1;
  da:	4485                	li	s1,1
  dc:	a021                	j	e4 <sixfive+0x6a>
            n = 0;
  de:	4b01                	li	s6,0
            is_number = 0;
  e0:	4901                	li	s2,0
            flag = 1;
  e2:	84d2                	mv	s1,s4
    while(read(fd, buf, 1) > 0){
  e4:	8652                	mv	a2,s4
  e6:	85ce                	mv	a1,s3
  e8:	8556                	mv	a0,s5
  ea:	3c0000ef          	jal	4aa <read>
  ee:	02a05a63          	blez	a0,122 <sixfive+0xa8>
        char c = buf[0];
  f2:	0009c503          	lbu	a0,0(s3)
        if(flag && c >= '0' && c <= '9'){
  f6:	0014fb93          	andi	s7,s1,1
  fa:	fd05079b          	addiw	a5,a0,-48
  fe:	0ff7f793          	zext.b	a5,a5
 102:	00a7b793          	sltiu	a5,a5,10
 106:	dfd9                	beqz	a5,a4 <sixfive+0x2a>
 108:	f80b8ee3          	beqz	s7,a4 <sixfive+0x2a>
            n = n*10 + c - '0';
 10c:	002b179b          	slliw	a5,s6,0x2
 110:	016787bb          	addw	a5,a5,s6
 114:	0017979b          	slliw	a5,a5,0x1
 118:	9fa9                	addw	a5,a5,a0
 11a:	fd078b1b          	addiw	s6,a5,-48
            is_number = 1;
 11e:	8952                	mv	s2,s4
 120:	b7d1                	j	e4 <sixfive+0x6a>
        }else{
            flag = 0;
        }
    }
    if(is_number && flag){
 122:	00197913          	andi	s2,s2,1
 126:	00090863          	beqz	s2,136 <sixfive+0xbc>
 12a:	8885                	andi	s1,s1,1
 12c:	c489                	beqz	s1,136 <sixfive+0xbc>
        if(isDivisibleBy5or6(n)){
 12e:	855a                	mv	a0,s6
 130:	ef3ff0ef          	jal	22 <isDivisibleBy5or6>
 134:	ed01                	bnez	a0,14c <sixfive+0xd2>
            printf("%d\n", n);
        }
    }
}
 136:	60a6                	ld	ra,72(sp)
 138:	6406                	ld	s0,64(sp)
 13a:	74e2                	ld	s1,56(sp)
 13c:	7942                	ld	s2,48(sp)
 13e:	79a2                	ld	s3,40(sp)
 140:	7a02                	ld	s4,32(sp)
 142:	6ae2                	ld	s5,24(sp)
 144:	6b42                	ld	s6,16(sp)
 146:	6ba2                	ld	s7,8(sp)
 148:	6161                	addi	sp,sp,80
 14a:	8082                	ret
            printf("%d\n", n);
 14c:	85da                	mv	a1,s6
 14e:	00001517          	auipc	a0,0x1
 152:	94250513          	addi	a0,a0,-1726 # a90 <malloc+0xfa>
 156:	788000ef          	jal	8de <printf>
}
 15a:	bff1                	j	136 <sixfive+0xbc>

000000000000015c <main>:

int
main(int argc, char *argv[])
{
 15c:	7179                	addi	sp,sp,-48
 15e:	f406                	sd	ra,40(sp)
 160:	f022                	sd	s0,32(sp)
 162:	1800                	addi	s0,sp,48
    int fd, i;

    if(argc <= 1){
 164:	4785                	li	a5,1
 166:	04a7d263          	bge	a5,a0,1aa <main+0x4e>
 16a:	ec26                	sd	s1,24(sp)
 16c:	e84a                	sd	s2,16(sp)
 16e:	e44e                	sd	s3,8(sp)
 170:	00858913          	addi	s2,a1,8
 174:	ffe5099b          	addiw	s3,a0,-2
 178:	02099793          	slli	a5,s3,0x20
 17c:	01d7d993          	srli	s3,a5,0x1d
 180:	05c1                	addi	a1,a1,16
 182:	99ae                	add	s3,s3,a1
        fprintf(2, "Usage: sixfive [file ...]\n");
        exit(1);
    }

    for(i = 1; i < argc; i++){
        if((fd = open(argv[i], O_RDONLY)) < 0){
 184:	4581                	li	a1,0
 186:	00093503          	ld	a0,0(s2)
 18a:	348000ef          	jal	4d2 <open>
 18e:	84aa                	mv	s1,a0
 190:	02054a63          	bltz	a0,1c4 <main+0x68>
            printf("sixfive: cannot open %s\n", argv[i]);
            exit(1);
        }
        sixfive(fd);
 194:	ee7ff0ef          	jal	7a <sixfive>
        close(fd);
 198:	8526                	mv	a0,s1
 19a:	320000ef          	jal	4ba <close>
    for(i = 1; i < argc; i++){
 19e:	0921                	addi	s2,s2,8
 1a0:	ff3912e3          	bne	s2,s3,184 <main+0x28>
    }
    exit(0);
 1a4:	4501                	li	a0,0
 1a6:	2ec000ef          	jal	492 <exit>
 1aa:	ec26                	sd	s1,24(sp)
 1ac:	e84a                	sd	s2,16(sp)
 1ae:	e44e                	sd	s3,8(sp)
        fprintf(2, "Usage: sixfive [file ...]\n");
 1b0:	00001597          	auipc	a1,0x1
 1b4:	8e858593          	addi	a1,a1,-1816 # a98 <malloc+0x102>
 1b8:	4509                	li	a0,2
 1ba:	6fa000ef          	jal	8b4 <fprintf>
        exit(1);
 1be:	4505                	li	a0,1
 1c0:	2d2000ef          	jal	492 <exit>
            printf("sixfive: cannot open %s\n", argv[i]);
 1c4:	00093583          	ld	a1,0(s2)
 1c8:	00001517          	auipc	a0,0x1
 1cc:	8f050513          	addi	a0,a0,-1808 # ab8 <malloc+0x122>
 1d0:	70e000ef          	jal	8de <printf>
            exit(1);
 1d4:	4505                	li	a0,1
 1d6:	2bc000ef          	jal	492 <exit>

00000000000001da <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 1da:	1141                	addi	sp,sp,-16
 1dc:	e406                	sd	ra,8(sp)
 1de:	e022                	sd	s0,0(sp)
 1e0:	0800                	addi	s0,sp,16
  extern int main();
  main();
 1e2:	f7bff0ef          	jal	15c <main>
  exit(0);
 1e6:	4501                	li	a0,0
 1e8:	2aa000ef          	jal	492 <exit>

00000000000001ec <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 1ec:	1141                	addi	sp,sp,-16
 1ee:	e406                	sd	ra,8(sp)
 1f0:	e022                	sd	s0,0(sp)
 1f2:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f4:	87aa                	mv	a5,a0
 1f6:	0585                	addi	a1,a1,1
 1f8:	0785                	addi	a5,a5,1
 1fa:	fff5c703          	lbu	a4,-1(a1)
 1fe:	fee78fa3          	sb	a4,-1(a5)
 202:	fb75                	bnez	a4,1f6 <strcpy+0xa>
    ;
  return os;
}
 204:	60a2                	ld	ra,8(sp)
 206:	6402                	ld	s0,0(sp)
 208:	0141                	addi	sp,sp,16
 20a:	8082                	ret

000000000000020c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20c:	1141                	addi	sp,sp,-16
 20e:	e406                	sd	ra,8(sp)
 210:	e022                	sd	s0,0(sp)
 212:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 214:	00054783          	lbu	a5,0(a0)
 218:	cb91                	beqz	a5,22c <strcmp+0x20>
 21a:	0005c703          	lbu	a4,0(a1)
 21e:	00f71763          	bne	a4,a5,22c <strcmp+0x20>
    p++, q++;
 222:	0505                	addi	a0,a0,1
 224:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 226:	00054783          	lbu	a5,0(a0)
 22a:	fbe5                	bnez	a5,21a <strcmp+0xe>
  return (uchar)*p - (uchar)*q;
 22c:	0005c503          	lbu	a0,0(a1)
}
 230:	40a7853b          	subw	a0,a5,a0
 234:	60a2                	ld	ra,8(sp)
 236:	6402                	ld	s0,0(sp)
 238:	0141                	addi	sp,sp,16
 23a:	8082                	ret

000000000000023c <strlen>:

uint
strlen(const char *s)
{
 23c:	1141                	addi	sp,sp,-16
 23e:	e406                	sd	ra,8(sp)
 240:	e022                	sd	s0,0(sp)
 242:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 244:	00054783          	lbu	a5,0(a0)
 248:	cf91                	beqz	a5,264 <strlen+0x28>
 24a:	00150793          	addi	a5,a0,1
 24e:	86be                	mv	a3,a5
 250:	0785                	addi	a5,a5,1
 252:	fff7c703          	lbu	a4,-1(a5)
 256:	ff65                	bnez	a4,24e <strlen+0x12>
 258:	40a6853b          	subw	a0,a3,a0
    ;
  return n;
}
 25c:	60a2                	ld	ra,8(sp)
 25e:	6402                	ld	s0,0(sp)
 260:	0141                	addi	sp,sp,16
 262:	8082                	ret
  for(n = 0; s[n]; n++)
 264:	4501                	li	a0,0
 266:	bfdd                	j	25c <strlen+0x20>

0000000000000268 <memset>:

void*
memset(void *dst, int c, uint n)
{
 268:	1141                	addi	sp,sp,-16
 26a:	e406                	sd	ra,8(sp)
 26c:	e022                	sd	s0,0(sp)
 26e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 270:	ca19                	beqz	a2,286 <memset+0x1e>
 272:	87aa                	mv	a5,a0
 274:	1602                	slli	a2,a2,0x20
 276:	9201                	srli	a2,a2,0x20
 278:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 27c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 280:	0785                	addi	a5,a5,1
 282:	fee79de3          	bne	a5,a4,27c <memset+0x14>
  }
  return dst;
}
 286:	60a2                	ld	ra,8(sp)
 288:	6402                	ld	s0,0(sp)
 28a:	0141                	addi	sp,sp,16
 28c:	8082                	ret

000000000000028e <strchr>:

char*
strchr(const char *s, char c)
{
 28e:	1141                	addi	sp,sp,-16
 290:	e406                	sd	ra,8(sp)
 292:	e022                	sd	s0,0(sp)
 294:	0800                	addi	s0,sp,16
  for(; *s; s++)
 296:	00054783          	lbu	a5,0(a0)
 29a:	cf81                	beqz	a5,2b2 <strchr+0x24>
    if(*s == c)
 29c:	00f58763          	beq	a1,a5,2aa <strchr+0x1c>
  for(; *s; s++)
 2a0:	0505                	addi	a0,a0,1
 2a2:	00054783          	lbu	a5,0(a0)
 2a6:	fbfd                	bnez	a5,29c <strchr+0xe>
      return (char*)s;
  return 0;
 2a8:	4501                	li	a0,0
}
 2aa:	60a2                	ld	ra,8(sp)
 2ac:	6402                	ld	s0,0(sp)
 2ae:	0141                	addi	sp,sp,16
 2b0:	8082                	ret
  return 0;
 2b2:	4501                	li	a0,0
 2b4:	bfdd                	j	2aa <strchr+0x1c>

00000000000002b6 <gets>:

char*
gets(char *buf, int max)
{
 2b6:	711d                	addi	sp,sp,-96
 2b8:	ec86                	sd	ra,88(sp)
 2ba:	e8a2                	sd	s0,80(sp)
 2bc:	e4a6                	sd	s1,72(sp)
 2be:	e0ca                	sd	s2,64(sp)
 2c0:	fc4e                	sd	s3,56(sp)
 2c2:	f852                	sd	s4,48(sp)
 2c4:	f456                	sd	s5,40(sp)
 2c6:	f05a                	sd	s6,32(sp)
 2c8:	ec5e                	sd	s7,24(sp)
 2ca:	e862                	sd	s8,16(sp)
 2cc:	1080                	addi	s0,sp,96
 2ce:	8baa                	mv	s7,a0
 2d0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d2:	892a                	mv	s2,a0
 2d4:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2d6:	faf40b13          	addi	s6,s0,-81
 2da:	4a85                	li	s5,1
  for(i=0; i+1 < max; ){
 2dc:	8c26                	mv	s8,s1
 2de:	0014899b          	addiw	s3,s1,1
 2e2:	84ce                	mv	s1,s3
 2e4:	0349d463          	bge	s3,s4,30c <gets+0x56>
    cc = read(0, &c, 1);
 2e8:	8656                	mv	a2,s5
 2ea:	85da                	mv	a1,s6
 2ec:	4501                	li	a0,0
 2ee:	1bc000ef          	jal	4aa <read>
    if(cc < 1)
 2f2:	00a05d63          	blez	a0,30c <gets+0x56>
      break;
    buf[i++] = c;
 2f6:	faf44783          	lbu	a5,-81(s0)
 2fa:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2fe:	0905                	addi	s2,s2,1
 300:	ff678713          	addi	a4,a5,-10
 304:	c319                	beqz	a4,30a <gets+0x54>
 306:	17cd                	addi	a5,a5,-13
 308:	fbf1                	bnez	a5,2dc <gets+0x26>
    buf[i++] = c;
 30a:	8c4e                	mv	s8,s3
      break;
  }
  buf[i] = '\0';
 30c:	9c5e                	add	s8,s8,s7
 30e:	000c0023          	sb	zero,0(s8)
  return buf;
}
 312:	855e                	mv	a0,s7
 314:	60e6                	ld	ra,88(sp)
 316:	6446                	ld	s0,80(sp)
 318:	64a6                	ld	s1,72(sp)
 31a:	6906                	ld	s2,64(sp)
 31c:	79e2                	ld	s3,56(sp)
 31e:	7a42                	ld	s4,48(sp)
 320:	7aa2                	ld	s5,40(sp)
 322:	7b02                	ld	s6,32(sp)
 324:	6be2                	ld	s7,24(sp)
 326:	6c42                	ld	s8,16(sp)
 328:	6125                	addi	sp,sp,96
 32a:	8082                	ret

000000000000032c <stat>:

int
stat(const char *n, struct stat *st)
{
 32c:	1101                	addi	sp,sp,-32
 32e:	ec06                	sd	ra,24(sp)
 330:	e822                	sd	s0,16(sp)
 332:	e04a                	sd	s2,0(sp)
 334:	1000                	addi	s0,sp,32
 336:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 338:	4581                	li	a1,0
 33a:	198000ef          	jal	4d2 <open>
  if(fd < 0)
 33e:	02054263          	bltz	a0,362 <stat+0x36>
 342:	e426                	sd	s1,8(sp)
 344:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 346:	85ca                	mv	a1,s2
 348:	1a2000ef          	jal	4ea <fstat>
 34c:	892a                	mv	s2,a0
  close(fd);
 34e:	8526                	mv	a0,s1
 350:	16a000ef          	jal	4ba <close>
  return r;
 354:	64a2                	ld	s1,8(sp)
}
 356:	854a                	mv	a0,s2
 358:	60e2                	ld	ra,24(sp)
 35a:	6442                	ld	s0,16(sp)
 35c:	6902                	ld	s2,0(sp)
 35e:	6105                	addi	sp,sp,32
 360:	8082                	ret
    return -1;
 362:	57fd                	li	a5,-1
 364:	893e                	mv	s2,a5
 366:	bfc5                	j	356 <stat+0x2a>

0000000000000368 <atoi>:

int
atoi(const char *s)
{
 368:	1141                	addi	sp,sp,-16
 36a:	e406                	sd	ra,8(sp)
 36c:	e022                	sd	s0,0(sp)
 36e:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 370:	00054683          	lbu	a3,0(a0)
 374:	fd06879b          	addiw	a5,a3,-48
 378:	0ff7f793          	zext.b	a5,a5
 37c:	4625                	li	a2,9
 37e:	02f66963          	bltu	a2,a5,3b0 <atoi+0x48>
 382:	872a                	mv	a4,a0
  n = 0;
 384:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 386:	0705                	addi	a4,a4,1
 388:	0025179b          	slliw	a5,a0,0x2
 38c:	9fa9                	addw	a5,a5,a0
 38e:	0017979b          	slliw	a5,a5,0x1
 392:	9fb5                	addw	a5,a5,a3
 394:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 398:	00074683          	lbu	a3,0(a4)
 39c:	fd06879b          	addiw	a5,a3,-48
 3a0:	0ff7f793          	zext.b	a5,a5
 3a4:	fef671e3          	bgeu	a2,a5,386 <atoi+0x1e>
  return n;
}
 3a8:	60a2                	ld	ra,8(sp)
 3aa:	6402                	ld	s0,0(sp)
 3ac:	0141                	addi	sp,sp,16
 3ae:	8082                	ret
  n = 0;
 3b0:	4501                	li	a0,0
 3b2:	bfdd                	j	3a8 <atoi+0x40>

00000000000003b4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b4:	1141                	addi	sp,sp,-16
 3b6:	e406                	sd	ra,8(sp)
 3b8:	e022                	sd	s0,0(sp)
 3ba:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3bc:	02b57563          	bgeu	a0,a1,3e6 <memmove+0x32>
    while(n-- > 0)
 3c0:	00c05f63          	blez	a2,3de <memmove+0x2a>
 3c4:	1602                	slli	a2,a2,0x20
 3c6:	9201                	srli	a2,a2,0x20
 3c8:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 3cc:	872a                	mv	a4,a0
      *dst++ = *src++;
 3ce:	0585                	addi	a1,a1,1
 3d0:	0705                	addi	a4,a4,1
 3d2:	fff5c683          	lbu	a3,-1(a1)
 3d6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3da:	fee79ae3          	bne	a5,a4,3ce <memmove+0x1a>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3de:	60a2                	ld	ra,8(sp)
 3e0:	6402                	ld	s0,0(sp)
 3e2:	0141                	addi	sp,sp,16
 3e4:	8082                	ret
    while(n-- > 0)
 3e6:	fec05ce3          	blez	a2,3de <memmove+0x2a>
    dst += n;
 3ea:	00c50733          	add	a4,a0,a2
    src += n;
 3ee:	95b2                	add	a1,a1,a2
 3f0:	fff6079b          	addiw	a5,a2,-1
 3f4:	1782                	slli	a5,a5,0x20
 3f6:	9381                	srli	a5,a5,0x20
 3f8:	fff7c793          	not	a5,a5
 3fc:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3fe:	15fd                	addi	a1,a1,-1
 400:	177d                	addi	a4,a4,-1
 402:	0005c683          	lbu	a3,0(a1)
 406:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 40a:	fef71ae3          	bne	a4,a5,3fe <memmove+0x4a>
 40e:	bfc1                	j	3de <memmove+0x2a>

0000000000000410 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 410:	1141                	addi	sp,sp,-16
 412:	e406                	sd	ra,8(sp)
 414:	e022                	sd	s0,0(sp)
 416:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 418:	c61d                	beqz	a2,446 <memcmp+0x36>
 41a:	1602                	slli	a2,a2,0x20
 41c:	9201                	srli	a2,a2,0x20
 41e:	00c506b3          	add	a3,a0,a2
    if (*p1 != *p2) {
 422:	00054783          	lbu	a5,0(a0)
 426:	0005c703          	lbu	a4,0(a1)
 42a:	00e79863          	bne	a5,a4,43a <memcmp+0x2a>
      return *p1 - *p2;
    }
    p1++;
 42e:	0505                	addi	a0,a0,1
    p2++;
 430:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 432:	fed518e3          	bne	a0,a3,422 <memcmp+0x12>
  }
  return 0;
 436:	4501                	li	a0,0
 438:	a019                	j	43e <memcmp+0x2e>
      return *p1 - *p2;
 43a:	40e7853b          	subw	a0,a5,a4
}
 43e:	60a2                	ld	ra,8(sp)
 440:	6402                	ld	s0,0(sp)
 442:	0141                	addi	sp,sp,16
 444:	8082                	ret
  return 0;
 446:	4501                	li	a0,0
 448:	bfdd                	j	43e <memcmp+0x2e>

000000000000044a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 44a:	1141                	addi	sp,sp,-16
 44c:	e406                	sd	ra,8(sp)
 44e:	e022                	sd	s0,0(sp)
 450:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 452:	f63ff0ef          	jal	3b4 <memmove>
}
 456:	60a2                	ld	ra,8(sp)
 458:	6402                	ld	s0,0(sp)
 45a:	0141                	addi	sp,sp,16
 45c:	8082                	ret

000000000000045e <sbrk>:

char *
sbrk(int n) {
 45e:	1141                	addi	sp,sp,-16
 460:	e406                	sd	ra,8(sp)
 462:	e022                	sd	s0,0(sp)
 464:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 466:	4585                	li	a1,1
 468:	0b2000ef          	jal	51a <sys_sbrk>
}
 46c:	60a2                	ld	ra,8(sp)
 46e:	6402                	ld	s0,0(sp)
 470:	0141                	addi	sp,sp,16
 472:	8082                	ret

0000000000000474 <sbrklazy>:

char *
sbrklazy(int n) {
 474:	1141                	addi	sp,sp,-16
 476:	e406                	sd	ra,8(sp)
 478:	e022                	sd	s0,0(sp)
 47a:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 47c:	4589                	li	a1,2
 47e:	09c000ef          	jal	51a <sys_sbrk>
}
 482:	60a2                	ld	ra,8(sp)
 484:	6402                	ld	s0,0(sp)
 486:	0141                	addi	sp,sp,16
 488:	8082                	ret

000000000000048a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 48a:	4885                	li	a7,1
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <exit>:
.global exit
exit:
 li a7, SYS_exit
 492:	4889                	li	a7,2
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <wait>:
.global wait
wait:
 li a7, SYS_wait
 49a:	488d                	li	a7,3
 ecall
 49c:	00000073          	ecall
 ret
 4a0:	8082                	ret

00000000000004a2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4a2:	4891                	li	a7,4
 ecall
 4a4:	00000073          	ecall
 ret
 4a8:	8082                	ret

00000000000004aa <read>:
.global read
read:
 li a7, SYS_read
 4aa:	4895                	li	a7,5
 ecall
 4ac:	00000073          	ecall
 ret
 4b0:	8082                	ret

00000000000004b2 <write>:
.global write
write:
 li a7, SYS_write
 4b2:	48c1                	li	a7,16
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <close>:
.global close
close:
 li a7, SYS_close
 4ba:	48d5                	li	a7,21
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4c2:	4899                	li	a7,6
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <exec>:
.global exec
exec:
 li a7, SYS_exec
 4ca:	489d                	li	a7,7
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <open>:
.global open
open:
 li a7, SYS_open
 4d2:	48bd                	li	a7,15
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 4da:	48c5                	li	a7,17
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 4e2:	48c9                	li	a7,18
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4ea:	48a1                	li	a7,8
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <link>:
.global link
link:
 li a7, SYS_link
 4f2:	48cd                	li	a7,19
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4fa:	48d1                	li	a7,20
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 502:	48a5                	li	a7,9
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <dup>:
.global dup
dup:
 li a7, SYS_dup
 50a:	48a9                	li	a7,10
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 512:	48ad                	li	a7,11
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 51a:	48b1                	li	a7,12
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <pause>:
.global pause
pause:
 li a7, SYS_pause
 522:	48b5                	li	a7,13
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 52a:	48b9                	li	a7,14
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 532:	1101                	addi	sp,sp,-32
 534:	ec06                	sd	ra,24(sp)
 536:	e822                	sd	s0,16(sp)
 538:	1000                	addi	s0,sp,32
 53a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 53e:	4605                	li	a2,1
 540:	fef40593          	addi	a1,s0,-17
 544:	f6fff0ef          	jal	4b2 <write>
}
 548:	60e2                	ld	ra,24(sp)
 54a:	6442                	ld	s0,16(sp)
 54c:	6105                	addi	sp,sp,32
 54e:	8082                	ret

0000000000000550 <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 550:	715d                	addi	sp,sp,-80
 552:	e486                	sd	ra,72(sp)
 554:	e0a2                	sd	s0,64(sp)
 556:	f84a                	sd	s2,48(sp)
 558:	f44e                	sd	s3,40(sp)
 55a:	0880                	addi	s0,sp,80
 55c:	892a                	mv	s2,a0
  char buf[20];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 55e:	cac1                	beqz	a3,5ee <printint+0x9e>
 560:	0805d763          	bgez	a1,5ee <printint+0x9e>
    neg = 1;
    x = -xx;
 564:	40b005bb          	negw	a1,a1
    neg = 1;
 568:	4305                	li	t1,1
  } else {
    x = xx;
  }

  i = 0;
 56a:	fb840993          	addi	s3,s0,-72
  neg = 0;
 56e:	86ce                	mv	a3,s3
  i = 0;
 570:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 572:	00000817          	auipc	a6,0x0
 576:	57e80813          	addi	a6,a6,1406 # af0 <digits>
 57a:	88ba                	mv	a7,a4
 57c:	0017051b          	addiw	a0,a4,1
 580:	872a                	mv	a4,a0
 582:	02c5f7bb          	remuw	a5,a1,a2
 586:	1782                	slli	a5,a5,0x20
 588:	9381                	srli	a5,a5,0x20
 58a:	97c2                	add	a5,a5,a6
 58c:	0007c783          	lbu	a5,0(a5)
 590:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 594:	87ae                	mv	a5,a1
 596:	02c5d5bb          	divuw	a1,a1,a2
 59a:	0685                	addi	a3,a3,1
 59c:	fcc7ffe3          	bgeu	a5,a2,57a <printint+0x2a>
  if(neg)
 5a0:	00030c63          	beqz	t1,5b8 <printint+0x68>
    buf[i++] = '-';
 5a4:	fd050793          	addi	a5,a0,-48
 5a8:	00878533          	add	a0,a5,s0
 5ac:	02d00793          	li	a5,45
 5b0:	fef50423          	sb	a5,-24(a0)
 5b4:	0028871b          	addiw	a4,a7,2

  while(--i >= 0)
 5b8:	02e05563          	blez	a4,5e2 <printint+0x92>
 5bc:	fc26                	sd	s1,56(sp)
 5be:	377d                	addiw	a4,a4,-1
 5c0:	00e984b3          	add	s1,s3,a4
 5c4:	19fd                	addi	s3,s3,-1
 5c6:	99ba                	add	s3,s3,a4
 5c8:	1702                	slli	a4,a4,0x20
 5ca:	9301                	srli	a4,a4,0x20
 5cc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5d0:	0004c583          	lbu	a1,0(s1)
 5d4:	854a                	mv	a0,s2
 5d6:	f5dff0ef          	jal	532 <putc>
  while(--i >= 0)
 5da:	14fd                	addi	s1,s1,-1
 5dc:	ff349ae3          	bne	s1,s3,5d0 <printint+0x80>
 5e0:	74e2                	ld	s1,56(sp)
}
 5e2:	60a6                	ld	ra,72(sp)
 5e4:	6406                	ld	s0,64(sp)
 5e6:	7942                	ld	s2,48(sp)
 5e8:	79a2                	ld	s3,40(sp)
 5ea:	6161                	addi	sp,sp,80
 5ec:	8082                	ret
    x = xx;
 5ee:	2581                	sext.w	a1,a1
  neg = 0;
 5f0:	4301                	li	t1,0
 5f2:	bfa5                	j	56a <printint+0x1a>

00000000000005f4 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 5f4:	711d                	addi	sp,sp,-96
 5f6:	ec86                	sd	ra,88(sp)
 5f8:	e8a2                	sd	s0,80(sp)
 5fa:	e4a6                	sd	s1,72(sp)
 5fc:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5fe:	0005c483          	lbu	s1,0(a1)
 602:	22048363          	beqz	s1,828 <vprintf+0x234>
 606:	e0ca                	sd	s2,64(sp)
 608:	fc4e                	sd	s3,56(sp)
 60a:	f852                	sd	s4,48(sp)
 60c:	f456                	sd	s5,40(sp)
 60e:	f05a                	sd	s6,32(sp)
 610:	ec5e                	sd	s7,24(sp)
 612:	e862                	sd	s8,16(sp)
 614:	8b2a                	mv	s6,a0
 616:	8a2e                	mv	s4,a1
 618:	8bb2                	mv	s7,a2
  state = 0;
 61a:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 61c:	4901                	li	s2,0
 61e:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 620:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 624:	06400c13          	li	s8,100
 628:	a00d                	j	64a <vprintf+0x56>
        putc(fd, c0);
 62a:	85a6                	mv	a1,s1
 62c:	855a                	mv	a0,s6
 62e:	f05ff0ef          	jal	532 <putc>
 632:	a019                	j	638 <vprintf+0x44>
    } else if(state == '%'){
 634:	03598363          	beq	s3,s5,65a <vprintf+0x66>
  for(i = 0; fmt[i]; i++){
 638:	0019079b          	addiw	a5,s2,1
 63c:	893e                	mv	s2,a5
 63e:	873e                	mv	a4,a5
 640:	97d2                	add	a5,a5,s4
 642:	0007c483          	lbu	s1,0(a5)
 646:	1c048a63          	beqz	s1,81a <vprintf+0x226>
    c0 = fmt[i] & 0xff;
 64a:	0004879b          	sext.w	a5,s1
    if(state == 0){
 64e:	fe0993e3          	bnez	s3,634 <vprintf+0x40>
      if(c0 == '%'){
 652:	fd579ce3          	bne	a5,s5,62a <vprintf+0x36>
        state = '%';
 656:	89be                	mv	s3,a5
 658:	b7c5                	j	638 <vprintf+0x44>
      if(c0) c1 = fmt[i+1] & 0xff;
 65a:	00ea06b3          	add	a3,s4,a4
 65e:	0016c603          	lbu	a2,1(a3)
      if(c1) c2 = fmt[i+2] & 0xff;
 662:	1c060863          	beqz	a2,832 <vprintf+0x23e>
      if(c0 == 'd'){
 666:	03878763          	beq	a5,s8,694 <vprintf+0xa0>
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 66a:	f9478693          	addi	a3,a5,-108
 66e:	0016b693          	seqz	a3,a3
 672:	f9c60593          	addi	a1,a2,-100
 676:	e99d                	bnez	a1,6ac <vprintf+0xb8>
 678:	ca95                	beqz	a3,6ac <vprintf+0xb8>
        printint(fd, va_arg(ap, uint64), 10, 1);
 67a:	008b8493          	addi	s1,s7,8
 67e:	4685                	li	a3,1
 680:	4629                	li	a2,10
 682:	000bb583          	ld	a1,0(s7)
 686:	855a                	mv	a0,s6
 688:	ec9ff0ef          	jal	550 <printint>
        i += 1;
 68c:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 68e:	8ba6                	mv	s7,s1
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 690:	4981                	li	s3,0
 692:	b75d                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, int), 10, 1);
 694:	008b8493          	addi	s1,s7,8
 698:	4685                	li	a3,1
 69a:	4629                	li	a2,10
 69c:	000ba583          	lw	a1,0(s7)
 6a0:	855a                	mv	a0,s6
 6a2:	eafff0ef          	jal	550 <printint>
 6a6:	8ba6                	mv	s7,s1
      state = 0;
 6a8:	4981                	li	s3,0
 6aa:	b779                	j	638 <vprintf+0x44>
      if(c1) c2 = fmt[i+2] & 0xff;
 6ac:	9752                	add	a4,a4,s4
 6ae:	00274583          	lbu	a1,2(a4)
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 6b2:	f9460713          	addi	a4,a2,-108
 6b6:	00173713          	seqz	a4,a4
 6ba:	8f75                	and	a4,a4,a3
 6bc:	f9c58513          	addi	a0,a1,-100
 6c0:	18051363          	bnez	a0,846 <vprintf+0x252>
 6c4:	18070163          	beqz	a4,846 <vprintf+0x252>
        printint(fd, va_arg(ap, uint64), 10, 1);
 6c8:	008b8493          	addi	s1,s7,8
 6cc:	4685                	li	a3,1
 6ce:	4629                	li	a2,10
 6d0:	000bb583          	ld	a1,0(s7)
 6d4:	855a                	mv	a0,s6
 6d6:	e7bff0ef          	jal	550 <printint>
        i += 2;
 6da:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 6dc:	8ba6                	mv	s7,s1
      state = 0;
 6de:	4981                	li	s3,0
        i += 2;
 6e0:	bfa1                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 10, 0);
 6e2:	008b8493          	addi	s1,s7,8
 6e6:	4681                	li	a3,0
 6e8:	4629                	li	a2,10
 6ea:	000be583          	lwu	a1,0(s7)
 6ee:	855a                	mv	a0,s6
 6f0:	e61ff0ef          	jal	550 <printint>
 6f4:	8ba6                	mv	s7,s1
      state = 0;
 6f6:	4981                	li	s3,0
 6f8:	b781                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6fa:	008b8493          	addi	s1,s7,8
 6fe:	4681                	li	a3,0
 700:	4629                	li	a2,10
 702:	000bb583          	ld	a1,0(s7)
 706:	855a                	mv	a0,s6
 708:	e49ff0ef          	jal	550 <printint>
        i += 1;
 70c:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 70e:	8ba6                	mv	s7,s1
      state = 0;
 710:	4981                	li	s3,0
 712:	b71d                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 714:	008b8493          	addi	s1,s7,8
 718:	4681                	li	a3,0
 71a:	4629                	li	a2,10
 71c:	000bb583          	ld	a1,0(s7)
 720:	855a                	mv	a0,s6
 722:	e2fff0ef          	jal	550 <printint>
        i += 2;
 726:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 728:	8ba6                	mv	s7,s1
      state = 0;
 72a:	4981                	li	s3,0
        i += 2;
 72c:	b731                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 16, 0);
 72e:	008b8493          	addi	s1,s7,8
 732:	4681                	li	a3,0
 734:	4641                	li	a2,16
 736:	000be583          	lwu	a1,0(s7)
 73a:	855a                	mv	a0,s6
 73c:	e15ff0ef          	jal	550 <printint>
 740:	8ba6                	mv	s7,s1
      state = 0;
 742:	4981                	li	s3,0
 744:	bdd5                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 746:	008b8493          	addi	s1,s7,8
 74a:	4681                	li	a3,0
 74c:	4641                	li	a2,16
 74e:	000bb583          	ld	a1,0(s7)
 752:	855a                	mv	a0,s6
 754:	dfdff0ef          	jal	550 <printint>
        i += 1;
 758:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 75a:	8ba6                	mv	s7,s1
      state = 0;
 75c:	4981                	li	s3,0
 75e:	bde9                	j	638 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 760:	008b8493          	addi	s1,s7,8
 764:	4681                	li	a3,0
 766:	4641                	li	a2,16
 768:	000bb583          	ld	a1,0(s7)
 76c:	855a                	mv	a0,s6
 76e:	de3ff0ef          	jal	550 <printint>
        i += 2;
 772:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 774:	8ba6                	mv	s7,s1
      state = 0;
 776:	4981                	li	s3,0
        i += 2;
 778:	b5c1                	j	638 <vprintf+0x44>
 77a:	e466                	sd	s9,8(sp)
        printptr(fd, va_arg(ap, uint64));
 77c:	008b8793          	addi	a5,s7,8
 780:	8cbe                	mv	s9,a5
 782:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 786:	03000593          	li	a1,48
 78a:	855a                	mv	a0,s6
 78c:	da7ff0ef          	jal	532 <putc>
  putc(fd, 'x');
 790:	07800593          	li	a1,120
 794:	855a                	mv	a0,s6
 796:	d9dff0ef          	jal	532 <putc>
 79a:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 79c:	00000b97          	auipc	s7,0x0
 7a0:	354b8b93          	addi	s7,s7,852 # af0 <digits>
 7a4:	03c9d793          	srli	a5,s3,0x3c
 7a8:	97de                	add	a5,a5,s7
 7aa:	0007c583          	lbu	a1,0(a5)
 7ae:	855a                	mv	a0,s6
 7b0:	d83ff0ef          	jal	532 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7b4:	0992                	slli	s3,s3,0x4
 7b6:	34fd                	addiw	s1,s1,-1
 7b8:	f4f5                	bnez	s1,7a4 <vprintf+0x1b0>
        printptr(fd, va_arg(ap, uint64));
 7ba:	8be6                	mv	s7,s9
      state = 0;
 7bc:	4981                	li	s3,0
 7be:	6ca2                	ld	s9,8(sp)
 7c0:	bda5                	j	638 <vprintf+0x44>
        putc(fd, va_arg(ap, uint32));
 7c2:	008b8493          	addi	s1,s7,8
 7c6:	000bc583          	lbu	a1,0(s7)
 7ca:	855a                	mv	a0,s6
 7cc:	d67ff0ef          	jal	532 <putc>
 7d0:	8ba6                	mv	s7,s1
      state = 0;
 7d2:	4981                	li	s3,0
 7d4:	b595                	j	638 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 7d6:	008b8993          	addi	s3,s7,8
 7da:	000bb483          	ld	s1,0(s7)
 7de:	cc91                	beqz	s1,7fa <vprintf+0x206>
        for(; *s; s++)
 7e0:	0004c583          	lbu	a1,0(s1)
 7e4:	c985                	beqz	a1,814 <vprintf+0x220>
          putc(fd, *s);
 7e6:	855a                	mv	a0,s6
 7e8:	d4bff0ef          	jal	532 <putc>
        for(; *s; s++)
 7ec:	0485                	addi	s1,s1,1
 7ee:	0004c583          	lbu	a1,0(s1)
 7f2:	f9f5                	bnez	a1,7e6 <vprintf+0x1f2>
        if((s = va_arg(ap, char*)) == 0)
 7f4:	8bce                	mv	s7,s3
      state = 0;
 7f6:	4981                	li	s3,0
 7f8:	b581                	j	638 <vprintf+0x44>
          s = "(null)";
 7fa:	00000497          	auipc	s1,0x0
 7fe:	2ee48493          	addi	s1,s1,750 # ae8 <malloc+0x152>
        for(; *s; s++)
 802:	02800593          	li	a1,40
 806:	b7c5                	j	7e6 <vprintf+0x1f2>
        putc(fd, '%');
 808:	85be                	mv	a1,a5
 80a:	855a                	mv	a0,s6
 80c:	d27ff0ef          	jal	532 <putc>
      state = 0;
 810:	4981                	li	s3,0
 812:	b51d                	j	638 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 814:	8bce                	mv	s7,s3
      state = 0;
 816:	4981                	li	s3,0
 818:	b505                	j	638 <vprintf+0x44>
 81a:	6906                	ld	s2,64(sp)
 81c:	79e2                	ld	s3,56(sp)
 81e:	7a42                	ld	s4,48(sp)
 820:	7aa2                	ld	s5,40(sp)
 822:	7b02                	ld	s6,32(sp)
 824:	6be2                	ld	s7,24(sp)
 826:	6c42                	ld	s8,16(sp)
    }
  }
}
 828:	60e6                	ld	ra,88(sp)
 82a:	6446                	ld	s0,80(sp)
 82c:	64a6                	ld	s1,72(sp)
 82e:	6125                	addi	sp,sp,96
 830:	8082                	ret
      if(c0 == 'd'){
 832:	06400713          	li	a4,100
 836:	e4e78fe3          	beq	a5,a4,694 <vprintf+0xa0>
      } else if(c0 == 'l' && c1 == 'd'){
 83a:	f9478693          	addi	a3,a5,-108
 83e:	0016b693          	seqz	a3,a3
      c1 = c2 = 0;
 842:	85b2                	mv	a1,a2
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 844:	4701                	li	a4,0
      } else if(c0 == 'u'){
 846:	07500513          	li	a0,117
 84a:	e8a78ce3          	beq	a5,a0,6e2 <vprintf+0xee>
      } else if(c0 == 'l' && c1 == 'u'){
 84e:	f8b60513          	addi	a0,a2,-117
 852:	e119                	bnez	a0,858 <vprintf+0x264>
 854:	ea0693e3          	bnez	a3,6fa <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 858:	f8b58513          	addi	a0,a1,-117
 85c:	e119                	bnez	a0,862 <vprintf+0x26e>
 85e:	ea071be3          	bnez	a4,714 <vprintf+0x120>
      } else if(c0 == 'x'){
 862:	07800513          	li	a0,120
 866:	eca784e3          	beq	a5,a0,72e <vprintf+0x13a>
      } else if(c0 == 'l' && c1 == 'x'){
 86a:	f8860613          	addi	a2,a2,-120
 86e:	e219                	bnez	a2,874 <vprintf+0x280>
 870:	ec069be3          	bnez	a3,746 <vprintf+0x152>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 874:	f8858593          	addi	a1,a1,-120
 878:	e199                	bnez	a1,87e <vprintf+0x28a>
 87a:	ee0713e3          	bnez	a4,760 <vprintf+0x16c>
      } else if(c0 == 'p'){
 87e:	07000713          	li	a4,112
 882:	eee78ce3          	beq	a5,a4,77a <vprintf+0x186>
      } else if(c0 == 'c'){
 886:	06300713          	li	a4,99
 88a:	f2e78ce3          	beq	a5,a4,7c2 <vprintf+0x1ce>
      } else if(c0 == 's'){
 88e:	07300713          	li	a4,115
 892:	f4e782e3          	beq	a5,a4,7d6 <vprintf+0x1e2>
      } else if(c0 == '%'){
 896:	02500713          	li	a4,37
 89a:	f6e787e3          	beq	a5,a4,808 <vprintf+0x214>
        putc(fd, '%');
 89e:	02500593          	li	a1,37
 8a2:	855a                	mv	a0,s6
 8a4:	c8fff0ef          	jal	532 <putc>
        putc(fd, c0);
 8a8:	85a6                	mv	a1,s1
 8aa:	855a                	mv	a0,s6
 8ac:	c87ff0ef          	jal	532 <putc>
      state = 0;
 8b0:	4981                	li	s3,0
 8b2:	b359                	j	638 <vprintf+0x44>

00000000000008b4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8b4:	715d                	addi	sp,sp,-80
 8b6:	ec06                	sd	ra,24(sp)
 8b8:	e822                	sd	s0,16(sp)
 8ba:	1000                	addi	s0,sp,32
 8bc:	e010                	sd	a2,0(s0)
 8be:	e414                	sd	a3,8(s0)
 8c0:	e818                	sd	a4,16(s0)
 8c2:	ec1c                	sd	a5,24(s0)
 8c4:	03043023          	sd	a6,32(s0)
 8c8:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8cc:	8622                	mv	a2,s0
 8ce:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8d2:	d23ff0ef          	jal	5f4 <vprintf>
}
 8d6:	60e2                	ld	ra,24(sp)
 8d8:	6442                	ld	s0,16(sp)
 8da:	6161                	addi	sp,sp,80
 8dc:	8082                	ret

00000000000008de <printf>:

void
printf(const char *fmt, ...)
{
 8de:	711d                	addi	sp,sp,-96
 8e0:	ec06                	sd	ra,24(sp)
 8e2:	e822                	sd	s0,16(sp)
 8e4:	1000                	addi	s0,sp,32
 8e6:	e40c                	sd	a1,8(s0)
 8e8:	e810                	sd	a2,16(s0)
 8ea:	ec14                	sd	a3,24(s0)
 8ec:	f018                	sd	a4,32(s0)
 8ee:	f41c                	sd	a5,40(s0)
 8f0:	03043823          	sd	a6,48(s0)
 8f4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 8f8:	00840613          	addi	a2,s0,8
 8fc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 900:	85aa                	mv	a1,a0
 902:	4505                	li	a0,1
 904:	cf1ff0ef          	jal	5f4 <vprintf>
}
 908:	60e2                	ld	ra,24(sp)
 90a:	6442                	ld	s0,16(sp)
 90c:	6125                	addi	sp,sp,96
 90e:	8082                	ret

0000000000000910 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 910:	1141                	addi	sp,sp,-16
 912:	e406                	sd	ra,8(sp)
 914:	e022                	sd	s0,0(sp)
 916:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 918:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91c:	00001797          	auipc	a5,0x1
 920:	6fc7b783          	ld	a5,1788(a5) # 2018 <freep>
 924:	a039                	j	932 <free+0x22>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 926:	6398                	ld	a4,0(a5)
 928:	00e7e463          	bltu	a5,a4,930 <free+0x20>
 92c:	00e6ea63          	bltu	a3,a4,940 <free+0x30>
{
 930:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 932:	fed7fae3          	bgeu	a5,a3,926 <free+0x16>
 936:	6398                	ld	a4,0(a5)
 938:	00e6e463          	bltu	a3,a4,940 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93c:	fee7eae3          	bltu	a5,a4,930 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 940:	ff852583          	lw	a1,-8(a0)
 944:	6390                	ld	a2,0(a5)
 946:	02059813          	slli	a6,a1,0x20
 94a:	01c85713          	srli	a4,a6,0x1c
 94e:	9736                	add	a4,a4,a3
 950:	02e60563          	beq	a2,a4,97a <free+0x6a>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 954:	fec53823          	sd	a2,-16(a0)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 958:	4790                	lw	a2,8(a5)
 95a:	02061593          	slli	a1,a2,0x20
 95e:	01c5d713          	srli	a4,a1,0x1c
 962:	973e                	add	a4,a4,a5
 964:	02e68263          	beq	a3,a4,988 <free+0x78>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 968:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 96a:	00001717          	auipc	a4,0x1
 96e:	6af73723          	sd	a5,1710(a4) # 2018 <freep>
}
 972:	60a2                	ld	ra,8(sp)
 974:	6402                	ld	s0,0(sp)
 976:	0141                	addi	sp,sp,16
 978:	8082                	ret
    bp->s.size += p->s.ptr->s.size;
 97a:	4618                	lw	a4,8(a2)
 97c:	9f2d                	addw	a4,a4,a1
 97e:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 982:	6398                	ld	a4,0(a5)
 984:	6310                	ld	a2,0(a4)
 986:	b7f9                	j	954 <free+0x44>
    p->s.size += bp->s.size;
 988:	ff852703          	lw	a4,-8(a0)
 98c:	9f31                	addw	a4,a4,a2
 98e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 990:	ff053683          	ld	a3,-16(a0)
 994:	bfd1                	j	968 <free+0x58>

0000000000000996 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 996:	7139                	addi	sp,sp,-64
 998:	fc06                	sd	ra,56(sp)
 99a:	f822                	sd	s0,48(sp)
 99c:	f04a                	sd	s2,32(sp)
 99e:	ec4e                	sd	s3,24(sp)
 9a0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	02051993          	slli	s3,a0,0x20
 9a6:	0209d993          	srli	s3,s3,0x20
 9aa:	09bd                	addi	s3,s3,15
 9ac:	0049d993          	srli	s3,s3,0x4
 9b0:	2985                	addiw	s3,s3,1
 9b2:	894e                	mv	s2,s3
  if((prevp = freep) == 0){
 9b4:	00001517          	auipc	a0,0x1
 9b8:	66453503          	ld	a0,1636(a0) # 2018 <freep>
 9bc:	c905                	beqz	a0,9ec <malloc+0x56>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9be:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9c0:	4798                	lw	a4,8(a5)
 9c2:	09377663          	bgeu	a4,s3,a4e <malloc+0xb8>
 9c6:	f426                	sd	s1,40(sp)
 9c8:	e852                	sd	s4,16(sp)
 9ca:	e456                	sd	s5,8(sp)
 9cc:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 9ce:	8a4e                	mv	s4,s3
 9d0:	6705                	lui	a4,0x1
 9d2:	00e9f363          	bgeu	s3,a4,9d8 <malloc+0x42>
 9d6:	6a05                	lui	s4,0x1
 9d8:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9dc:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9e0:	00001497          	auipc	s1,0x1
 9e4:	63848493          	addi	s1,s1,1592 # 2018 <freep>
  if(p == SBRK_ERROR)
 9e8:	5afd                	li	s5,-1
 9ea:	a83d                	j	a28 <malloc+0x92>
 9ec:	f426                	sd	s1,40(sp)
 9ee:	e852                	sd	s4,16(sp)
 9f0:	e456                	sd	s5,8(sp)
 9f2:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 9f4:	00001797          	auipc	a5,0x1
 9f8:	62c78793          	addi	a5,a5,1580 # 2020 <base>
 9fc:	00001717          	auipc	a4,0x1
 a00:	60f73e23          	sd	a5,1564(a4) # 2018 <freep>
 a04:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a06:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a0a:	b7d1                	j	9ce <malloc+0x38>
        prevp->s.ptr = p->s.ptr;
 a0c:	6398                	ld	a4,0(a5)
 a0e:	e118                	sd	a4,0(a0)
 a10:	a899                	j	a66 <malloc+0xd0>
  hp->s.size = nu;
 a12:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a16:	0541                	addi	a0,a0,16
 a18:	ef9ff0ef          	jal	910 <free>
  return freep;
 a1c:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 a1e:	c125                	beqz	a0,a7e <malloc+0xe8>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a20:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a22:	4798                	lw	a4,8(a5)
 a24:	03277163          	bgeu	a4,s2,a46 <malloc+0xb0>
    if(p == freep)
 a28:	6098                	ld	a4,0(s1)
 a2a:	853e                	mv	a0,a5
 a2c:	fef71ae3          	bne	a4,a5,a20 <malloc+0x8a>
  p = sbrk(nu * sizeof(Header));
 a30:	8552                	mv	a0,s4
 a32:	a2dff0ef          	jal	45e <sbrk>
  if(p == SBRK_ERROR)
 a36:	fd551ee3          	bne	a0,s5,a12 <malloc+0x7c>
        return 0;
 a3a:	4501                	li	a0,0
 a3c:	74a2                	ld	s1,40(sp)
 a3e:	6a42                	ld	s4,16(sp)
 a40:	6aa2                	ld	s5,8(sp)
 a42:	6b02                	ld	s6,0(sp)
 a44:	a03d                	j	a72 <malloc+0xdc>
 a46:	74a2                	ld	s1,40(sp)
 a48:	6a42                	ld	s4,16(sp)
 a4a:	6aa2                	ld	s5,8(sp)
 a4c:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 a4e:	fae90fe3          	beq	s2,a4,a0c <malloc+0x76>
        p->s.size -= nunits;
 a52:	4137073b          	subw	a4,a4,s3
 a56:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a58:	02071693          	slli	a3,a4,0x20
 a5c:	01c6d713          	srli	a4,a3,0x1c
 a60:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a62:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a66:	00001717          	auipc	a4,0x1
 a6a:	5aa73923          	sd	a0,1458(a4) # 2018 <freep>
      return (void*)(p + 1);
 a6e:	01078513          	addi	a0,a5,16
  }
}
 a72:	70e2                	ld	ra,56(sp)
 a74:	7442                	ld	s0,48(sp)
 a76:	7902                	ld	s2,32(sp)
 a78:	69e2                	ld	s3,24(sp)
 a7a:	6121                	addi	sp,sp,64
 a7c:	8082                	ret
 a7e:	74a2                	ld	s1,40(sp)
 a80:	6a42                	ld	s4,16(sp)
 a82:	6aa2                	ld	s5,8(sp)
 a84:	6b02                	ld	s6,0(sp)
 a86:	b7f5                	j	a72 <malloc+0xdc>
