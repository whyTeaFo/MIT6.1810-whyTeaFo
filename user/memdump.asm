
user/_memdump:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <memdump>:
void
memdump(char *fmt, char *data)
{
   int i=0;

   for(; fmt[i] != '\0'; i++){
   0:	00054783          	lbu	a5,0(a0)
   4:	cfe9                	beqz	a5,de <memdump+0xde>
{
   6:	715d                	addi	sp,sp,-80
   8:	e486                	sd	ra,72(sp)
   a:	e0a2                	sd	s0,64(sp)
   c:	fc26                	sd	s1,56(sp)
   e:	f84a                	sd	s2,48(sp)
  10:	f44e                	sd	s3,40(sp)
  12:	f052                	sd	s4,32(sp)
  14:	ec56                	sd	s5,24(sp)
  16:	e85a                	sd	s6,16(sp)
  18:	e45e                	sd	s7,8(sp)
  1a:	0880                	addi	s0,sp,80
  1c:	892e                	mv	s2,a1
  1e:	00150493          	addi	s1,a0,1
       char c = fmt[i];
       switch(c){
  22:	02000a13          	li	s4,32
  26:	00001997          	auipc	s3,0x1
  2a:	bd298993          	addi	s3,s3,-1070 # bf8 <malloc+0x1e6>
               data += 8;
               break;
           }
           case 'S':{
               int len = strlen(data);
               printf("%s\n", data);
  2e:	00001b17          	auipc	s6,0x1
  32:	afab0b13          	addi	s6,s6,-1286 # b28 <malloc+0x116>
               printf("%d\n", n);
  36:	00001a97          	auipc	s5,0x1
  3a:	adaa8a93          	addi	s5,s5,-1318 # b10 <malloc+0xfe>
  3e:	a819                	j	54 <memdump+0x54>
               printf("%d\n", n);
  40:	00092583          	lw	a1,0(s2)
  44:	8556                	mv	a0,s5
  46:	115000ef          	jal	95a <printf>
               data += 4;
  4a:	0911                	addi	s2,s2,4
   for(; fmt[i] != '\0'; i++){
  4c:	0485                	addi	s1,s1,1
  4e:	fff4c783          	lbu	a5,-1(s1)
  52:	cbbd                	beqz	a5,c8 <memdump+0xc8>
       switch(c){
  54:	fad7879b          	addiw	a5,a5,-83
  58:	0ff7f713          	zext.b	a4,a5
  5c:	feea68e3          	bltu	s4,a4,4c <memdump+0x4c>
  60:	00271793          	slli	a5,a4,0x2
  64:	97ce                	add	a5,a5,s3
  66:	439c                	lw	a5,0(a5)
  68:	97ce                	add	a5,a5,s3
  6a:	8782                	jr	a5
               printf("%lx\n", n);
  6c:	00093583          	ld	a1,0(s2)
  70:	00001517          	auipc	a0,0x1
  74:	aa850513          	addi	a0,a0,-1368 # b18 <malloc+0x106>
  78:	0e3000ef          	jal	95a <printf>
               data += 8;
  7c:	0921                	addi	s2,s2,8
               break;
  7e:	b7f9                	j	4c <memdump+0x4c>
               printf("%d\n", n);
  80:	00095583          	lhu	a1,0(s2)
  84:	8556                	mv	a0,s5
  86:	0d5000ef          	jal	95a <printf>
               data += 2;
  8a:	0909                	addi	s2,s2,2
               break;
  8c:	b7c1                	j	4c <memdump+0x4c>
               printf("%c\n", *data);
  8e:	00094583          	lbu	a1,0(s2)
  92:	00001517          	auipc	a0,0x1
  96:	a8e50513          	addi	a0,a0,-1394 # b20 <malloc+0x10e>
  9a:	0c1000ef          	jal	95a <printf>
               ++data;
  9e:	0905                	addi	s2,s2,1
               break;
  a0:	b775                	j	4c <memdump+0x4c>
               printf("%s\n", p);
  a2:	00093583          	ld	a1,0(s2)
  a6:	855a                	mv	a0,s6
  a8:	0b3000ef          	jal	95a <printf>
               data += 8;
  ac:	0921                	addi	s2,s2,8
               break;
  ae:	bf79                	j	4c <memdump+0x4c>
               int len = strlen(data);
  b0:	854a                	mv	a0,s2
  b2:	206000ef          	jal	2b8 <strlen>
  b6:	8baa                	mv	s7,a0
               printf("%s\n", data);
  b8:	85ca                	mv	a1,s2
  ba:	855a                	mv	a0,s6
  bc:	09f000ef          	jal	95a <printf>
               data += len + 1;
  c0:	001b8513          	addi	a0,s7,1
  c4:	992a                	add	s2,s2,a0
               break;
  c6:	b759                	j	4c <memdump+0x4c>
           }
       }
   }
}
  c8:	60a6                	ld	ra,72(sp)
  ca:	6406                	ld	s0,64(sp)
  cc:	74e2                	ld	s1,56(sp)
  ce:	7942                	ld	s2,48(sp)
  d0:	79a2                	ld	s3,40(sp)
  d2:	7a02                	ld	s4,32(sp)
  d4:	6ae2                	ld	s5,24(sp)
  d6:	6b42                	ld	s6,16(sp)
  d8:	6ba2                	ld	s7,8(sp)
  da:	6161                	addi	sp,sp,80
  dc:	8082                	ret
  de:	8082                	ret

00000000000000e0 <main>:
{
  e0:	db010113          	addi	sp,sp,-592
  e4:	24113423          	sd	ra,584(sp)
  e8:	24813023          	sd	s0,576(sp)
  ec:	22913c23          	sd	s1,568(sp)
  f0:	23213823          	sd	s2,560(sp)
  f4:	23313423          	sd	s3,552(sp)
  f8:	23413023          	sd	s4,544(sp)
  fc:	21513c23          	sd	s5,536(sp)
 100:	0c80                	addi	s0,sp,592
  if(argc == 1){
 102:	4785                	li	a5,1
 104:	00f50f63          	beq	a0,a5,122 <main+0x42>
 108:	8aae                	mv	s5,a1
  } else if(argc == 2){
 10a:	4789                	li	a5,2
 10c:	0ef50f63          	beq	a0,a5,20a <main+0x12a>
    printf("Usage: memdump [format]\n");
 110:	00001517          	auipc	a0,0x1
 114:	ac050513          	addi	a0,a0,-1344 # bd0 <malloc+0x1be>
 118:	043000ef          	jal	95a <printf>
    exit(1);
 11c:	4505                	li	a0,1
 11e:	3f0000ef          	jal	50e <exit>
    printf("Example 1:\n");
 122:	00001517          	auipc	a0,0x1
 126:	a0e50513          	addi	a0,a0,-1522 # b30 <malloc+0x11e>
 12a:	031000ef          	jal	95a <printf>
    int a[2] = { 61810, 2025 };
 12e:	67bd                	lui	a5,0xf
 130:	17278793          	addi	a5,a5,370 # f172 <base+0xd162>
 134:	daf42823          	sw	a5,-592(s0)
 138:	7e900793          	li	a5,2025
 13c:	daf42a23          	sw	a5,-588(s0)
    memdump("ii", (char*) a);
 140:	db040593          	addi	a1,s0,-592
 144:	00001517          	auipc	a0,0x1
 148:	9fc50513          	addi	a0,a0,-1540 # b40 <malloc+0x12e>
 14c:	eb5ff0ef          	jal	0 <memdump>
    printf("Example 2:\n");
 150:	00001517          	auipc	a0,0x1
 154:	9f850513          	addi	a0,a0,-1544 # b48 <malloc+0x136>
 158:	003000ef          	jal	95a <printf>
    memdump("S", "a string");
 15c:	00001597          	auipc	a1,0x1
 160:	9fc58593          	addi	a1,a1,-1540 # b58 <malloc+0x146>
 164:	00001517          	auipc	a0,0x1
 168:	a0450513          	addi	a0,a0,-1532 # b68 <malloc+0x156>
 16c:	e95ff0ef          	jal	0 <memdump>
    printf("Example 3:\n");
 170:	00001517          	auipc	a0,0x1
 174:	a0050513          	addi	a0,a0,-1536 # b70 <malloc+0x15e>
 178:	7e2000ef          	jal	95a <printf>
    char *s = "another";
 17c:	00001797          	auipc	a5,0x1
 180:	a0478793          	addi	a5,a5,-1532 # b80 <malloc+0x16e>
 184:	daf43c23          	sd	a5,-584(s0)
    memdump("s", (char *) &s);
 188:	db840593          	addi	a1,s0,-584
 18c:	00001517          	auipc	a0,0x1
 190:	9fc50513          	addi	a0,a0,-1540 # b88 <malloc+0x176>
 194:	e6dff0ef          	jal	0 <memdump>
    example.ptr = "hello";
 198:	00001797          	auipc	a5,0x1
 19c:	9f878793          	addi	a5,a5,-1544 # b90 <malloc+0x17e>
 1a0:	dcf43023          	sd	a5,-576(s0)
    example.num1 = 1819438967;
 1a4:	6c7277b7          	lui	a5,0x6c727
 1a8:	f7778793          	addi	a5,a5,-137 # 6c726f77 <base+0x6c724f67>
 1ac:	dcf42423          	sw	a5,-568(s0)
    example.num2 = 100;
 1b0:	06400793          	li	a5,100
 1b4:	dcf41623          	sh	a5,-564(s0)
    example.byte = 'z';
 1b8:	07a00793          	li	a5,122
 1bc:	dcf40723          	sb	a5,-562(s0)
    strcpy(example.bytes, "xyzzy");
 1c0:	dc040493          	addi	s1,s0,-576
 1c4:	00001597          	auipc	a1,0x1
 1c8:	9d458593          	addi	a1,a1,-1580 # b98 <malloc+0x186>
 1cc:	dcf40513          	addi	a0,s0,-561
 1d0:	098000ef          	jal	268 <strcpy>
    printf("Example 4:\n");
 1d4:	00001517          	auipc	a0,0x1
 1d8:	9cc50513          	addi	a0,a0,-1588 # ba0 <malloc+0x18e>
 1dc:	77e000ef          	jal	95a <printf>
    memdump("pihcS", (char*) &example);
 1e0:	85a6                	mv	a1,s1
 1e2:	00001517          	auipc	a0,0x1
 1e6:	9ce50513          	addi	a0,a0,-1586 # bb0 <malloc+0x19e>
 1ea:	e17ff0ef          	jal	0 <memdump>
    printf("Example 5:\n");
 1ee:	00001517          	auipc	a0,0x1
 1f2:	9ca50513          	addi	a0,a0,-1590 # bb8 <malloc+0x1a6>
 1f6:	764000ef          	jal	95a <printf>
    memdump("sccccc", (char*) &example);
 1fa:	85a6                	mv	a1,s1
 1fc:	00001517          	auipc	a0,0x1
 200:	9cc50513          	addi	a0,a0,-1588 # bc8 <malloc+0x1b6>
 204:	dfdff0ef          	jal	0 <memdump>
 208:	a0a1                	j	250 <main+0x170>
    memset(data, '\0', sizeof(data));
 20a:	20000613          	li	a2,512
 20e:	4581                	li	a1,0
 210:	dc040513          	addi	a0,s0,-576
 214:	0d0000ef          	jal	2e4 <memset>
    int n = 0;
 218:	4481                	li	s1,0
    while(n < sizeof(data)){
 21a:	4601                	li	a2,0
      int nn = read(0, data + n, sizeof(data) - n);
 21c:	20000993          	li	s3,512
 220:	dc040913          	addi	s2,s0,-576
    while(n < sizeof(data)){
 224:	1ff00a13          	li	s4,511
      int nn = read(0, data + n, sizeof(data) - n);
 228:	40c9863b          	subw	a2,s3,a2
 22c:	009905b3          	add	a1,s2,s1
 230:	4501                	li	a0,0
 232:	2f4000ef          	jal	526 <read>
      if(nn <= 0)
 236:	00a05763          	blez	a0,244 <main+0x164>
      n += nn;
 23a:	0095063b          	addw	a2,a0,s1
 23e:	84b2                	mv	s1,a2
    while(n < sizeof(data)){
 240:	feca74e3          	bgeu	s4,a2,228 <main+0x148>
    memdump(argv[1], data);
 244:	dc040593          	addi	a1,s0,-576
 248:	008ab503          	ld	a0,8(s5)
 24c:	db5ff0ef          	jal	0 <memdump>
  exit(0);
 250:	4501                	li	a0,0
 252:	2bc000ef          	jal	50e <exit>

0000000000000256 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 256:	1141                	addi	sp,sp,-16
 258:	e406                	sd	ra,8(sp)
 25a:	e022                	sd	s0,0(sp)
 25c:	0800                	addi	s0,sp,16
  extern int main();
  main();
 25e:	e83ff0ef          	jal	e0 <main>
  exit(0);
 262:	4501                	li	a0,0
 264:	2aa000ef          	jal	50e <exit>

0000000000000268 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 268:	1141                	addi	sp,sp,-16
 26a:	e406                	sd	ra,8(sp)
 26c:	e022                	sd	s0,0(sp)
 26e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 270:	87aa                	mv	a5,a0
 272:	0585                	addi	a1,a1,1
 274:	0785                	addi	a5,a5,1
 276:	fff5c703          	lbu	a4,-1(a1)
 27a:	fee78fa3          	sb	a4,-1(a5)
 27e:	fb75                	bnez	a4,272 <strcpy+0xa>
    ;
  return os;
}
 280:	60a2                	ld	ra,8(sp)
 282:	6402                	ld	s0,0(sp)
 284:	0141                	addi	sp,sp,16
 286:	8082                	ret

0000000000000288 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 288:	1141                	addi	sp,sp,-16
 28a:	e406                	sd	ra,8(sp)
 28c:	e022                	sd	s0,0(sp)
 28e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 290:	00054783          	lbu	a5,0(a0)
 294:	cb91                	beqz	a5,2a8 <strcmp+0x20>
 296:	0005c703          	lbu	a4,0(a1)
 29a:	00f71763          	bne	a4,a5,2a8 <strcmp+0x20>
    p++, q++;
 29e:	0505                	addi	a0,a0,1
 2a0:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2a2:	00054783          	lbu	a5,0(a0)
 2a6:	fbe5                	bnez	a5,296 <strcmp+0xe>
  return (uchar)*p - (uchar)*q;
 2a8:	0005c503          	lbu	a0,0(a1)
}
 2ac:	40a7853b          	subw	a0,a5,a0
 2b0:	60a2                	ld	ra,8(sp)
 2b2:	6402                	ld	s0,0(sp)
 2b4:	0141                	addi	sp,sp,16
 2b6:	8082                	ret

00000000000002b8 <strlen>:

uint
strlen(const char *s)
{
 2b8:	1141                	addi	sp,sp,-16
 2ba:	e406                	sd	ra,8(sp)
 2bc:	e022                	sd	s0,0(sp)
 2be:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2c0:	00054783          	lbu	a5,0(a0)
 2c4:	cf91                	beqz	a5,2e0 <strlen+0x28>
 2c6:	00150793          	addi	a5,a0,1
 2ca:	86be                	mv	a3,a5
 2cc:	0785                	addi	a5,a5,1
 2ce:	fff7c703          	lbu	a4,-1(a5)
 2d2:	ff65                	bnez	a4,2ca <strlen+0x12>
 2d4:	40a6853b          	subw	a0,a3,a0
    ;
  return n;
}
 2d8:	60a2                	ld	ra,8(sp)
 2da:	6402                	ld	s0,0(sp)
 2dc:	0141                	addi	sp,sp,16
 2de:	8082                	ret
  for(n = 0; s[n]; n++)
 2e0:	4501                	li	a0,0
 2e2:	bfdd                	j	2d8 <strlen+0x20>

00000000000002e4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e4:	1141                	addi	sp,sp,-16
 2e6:	e406                	sd	ra,8(sp)
 2e8:	e022                	sd	s0,0(sp)
 2ea:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2ec:	ca19                	beqz	a2,302 <memset+0x1e>
 2ee:	87aa                	mv	a5,a0
 2f0:	1602                	slli	a2,a2,0x20
 2f2:	9201                	srli	a2,a2,0x20
 2f4:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2f8:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2fc:	0785                	addi	a5,a5,1
 2fe:	fee79de3          	bne	a5,a4,2f8 <memset+0x14>
  }
  return dst;
}
 302:	60a2                	ld	ra,8(sp)
 304:	6402                	ld	s0,0(sp)
 306:	0141                	addi	sp,sp,16
 308:	8082                	ret

000000000000030a <strchr>:

char*
strchr(const char *s, char c)
{
 30a:	1141                	addi	sp,sp,-16
 30c:	e406                	sd	ra,8(sp)
 30e:	e022                	sd	s0,0(sp)
 310:	0800                	addi	s0,sp,16
  for(; *s; s++)
 312:	00054783          	lbu	a5,0(a0)
 316:	cf81                	beqz	a5,32e <strchr+0x24>
    if(*s == c)
 318:	00f58763          	beq	a1,a5,326 <strchr+0x1c>
  for(; *s; s++)
 31c:	0505                	addi	a0,a0,1
 31e:	00054783          	lbu	a5,0(a0)
 322:	fbfd                	bnez	a5,318 <strchr+0xe>
      return (char*)s;
  return 0;
 324:	4501                	li	a0,0
}
 326:	60a2                	ld	ra,8(sp)
 328:	6402                	ld	s0,0(sp)
 32a:	0141                	addi	sp,sp,16
 32c:	8082                	ret
  return 0;
 32e:	4501                	li	a0,0
 330:	bfdd                	j	326 <strchr+0x1c>

0000000000000332 <gets>:

char*
gets(char *buf, int max)
{
 332:	711d                	addi	sp,sp,-96
 334:	ec86                	sd	ra,88(sp)
 336:	e8a2                	sd	s0,80(sp)
 338:	e4a6                	sd	s1,72(sp)
 33a:	e0ca                	sd	s2,64(sp)
 33c:	fc4e                	sd	s3,56(sp)
 33e:	f852                	sd	s4,48(sp)
 340:	f456                	sd	s5,40(sp)
 342:	f05a                	sd	s6,32(sp)
 344:	ec5e                	sd	s7,24(sp)
 346:	e862                	sd	s8,16(sp)
 348:	1080                	addi	s0,sp,96
 34a:	8baa                	mv	s7,a0
 34c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 34e:	892a                	mv	s2,a0
 350:	4481                	li	s1,0
    cc = read(0, &c, 1);
 352:	faf40b13          	addi	s6,s0,-81
 356:	4a85                	li	s5,1
  for(i=0; i+1 < max; ){
 358:	8c26                	mv	s8,s1
 35a:	0014899b          	addiw	s3,s1,1
 35e:	84ce                	mv	s1,s3
 360:	0349d463          	bge	s3,s4,388 <gets+0x56>
    cc = read(0, &c, 1);
 364:	8656                	mv	a2,s5
 366:	85da                	mv	a1,s6
 368:	4501                	li	a0,0
 36a:	1bc000ef          	jal	526 <read>
    if(cc < 1)
 36e:	00a05d63          	blez	a0,388 <gets+0x56>
      break;
    buf[i++] = c;
 372:	faf44783          	lbu	a5,-81(s0)
 376:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 37a:	0905                	addi	s2,s2,1
 37c:	ff678713          	addi	a4,a5,-10
 380:	c319                	beqz	a4,386 <gets+0x54>
 382:	17cd                	addi	a5,a5,-13
 384:	fbf1                	bnez	a5,358 <gets+0x26>
    buf[i++] = c;
 386:	8c4e                	mv	s8,s3
      break;
  }
  buf[i] = '\0';
 388:	9c5e                	add	s8,s8,s7
 38a:	000c0023          	sb	zero,0(s8)
  return buf;
}
 38e:	855e                	mv	a0,s7
 390:	60e6                	ld	ra,88(sp)
 392:	6446                	ld	s0,80(sp)
 394:	64a6                	ld	s1,72(sp)
 396:	6906                	ld	s2,64(sp)
 398:	79e2                	ld	s3,56(sp)
 39a:	7a42                	ld	s4,48(sp)
 39c:	7aa2                	ld	s5,40(sp)
 39e:	7b02                	ld	s6,32(sp)
 3a0:	6be2                	ld	s7,24(sp)
 3a2:	6c42                	ld	s8,16(sp)
 3a4:	6125                	addi	sp,sp,96
 3a6:	8082                	ret

00000000000003a8 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a8:	1101                	addi	sp,sp,-32
 3aa:	ec06                	sd	ra,24(sp)
 3ac:	e822                	sd	s0,16(sp)
 3ae:	e04a                	sd	s2,0(sp)
 3b0:	1000                	addi	s0,sp,32
 3b2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b4:	4581                	li	a1,0
 3b6:	198000ef          	jal	54e <open>
  if(fd < 0)
 3ba:	02054263          	bltz	a0,3de <stat+0x36>
 3be:	e426                	sd	s1,8(sp)
 3c0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3c2:	85ca                	mv	a1,s2
 3c4:	1a2000ef          	jal	566 <fstat>
 3c8:	892a                	mv	s2,a0
  close(fd);
 3ca:	8526                	mv	a0,s1
 3cc:	16a000ef          	jal	536 <close>
  return r;
 3d0:	64a2                	ld	s1,8(sp)
}
 3d2:	854a                	mv	a0,s2
 3d4:	60e2                	ld	ra,24(sp)
 3d6:	6442                	ld	s0,16(sp)
 3d8:	6902                	ld	s2,0(sp)
 3da:	6105                	addi	sp,sp,32
 3dc:	8082                	ret
    return -1;
 3de:	57fd                	li	a5,-1
 3e0:	893e                	mv	s2,a5
 3e2:	bfc5                	j	3d2 <stat+0x2a>

00000000000003e4 <atoi>:

int
atoi(const char *s)
{
 3e4:	1141                	addi	sp,sp,-16
 3e6:	e406                	sd	ra,8(sp)
 3e8:	e022                	sd	s0,0(sp)
 3ea:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ec:	00054683          	lbu	a3,0(a0)
 3f0:	fd06879b          	addiw	a5,a3,-48
 3f4:	0ff7f793          	zext.b	a5,a5
 3f8:	4625                	li	a2,9
 3fa:	02f66963          	bltu	a2,a5,42c <atoi+0x48>
 3fe:	872a                	mv	a4,a0
  n = 0;
 400:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 402:	0705                	addi	a4,a4,1
 404:	0025179b          	slliw	a5,a0,0x2
 408:	9fa9                	addw	a5,a5,a0
 40a:	0017979b          	slliw	a5,a5,0x1
 40e:	9fb5                	addw	a5,a5,a3
 410:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 414:	00074683          	lbu	a3,0(a4)
 418:	fd06879b          	addiw	a5,a3,-48
 41c:	0ff7f793          	zext.b	a5,a5
 420:	fef671e3          	bgeu	a2,a5,402 <atoi+0x1e>
  return n;
}
 424:	60a2                	ld	ra,8(sp)
 426:	6402                	ld	s0,0(sp)
 428:	0141                	addi	sp,sp,16
 42a:	8082                	ret
  n = 0;
 42c:	4501                	li	a0,0
 42e:	bfdd                	j	424 <atoi+0x40>

0000000000000430 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 430:	1141                	addi	sp,sp,-16
 432:	e406                	sd	ra,8(sp)
 434:	e022                	sd	s0,0(sp)
 436:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 438:	02b57563          	bgeu	a0,a1,462 <memmove+0x32>
    while(n-- > 0)
 43c:	00c05f63          	blez	a2,45a <memmove+0x2a>
 440:	1602                	slli	a2,a2,0x20
 442:	9201                	srli	a2,a2,0x20
 444:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 448:	872a                	mv	a4,a0
      *dst++ = *src++;
 44a:	0585                	addi	a1,a1,1
 44c:	0705                	addi	a4,a4,1
 44e:	fff5c683          	lbu	a3,-1(a1)
 452:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 456:	fee79ae3          	bne	a5,a4,44a <memmove+0x1a>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 45a:	60a2                	ld	ra,8(sp)
 45c:	6402                	ld	s0,0(sp)
 45e:	0141                	addi	sp,sp,16
 460:	8082                	ret
    while(n-- > 0)
 462:	fec05ce3          	blez	a2,45a <memmove+0x2a>
    dst += n;
 466:	00c50733          	add	a4,a0,a2
    src += n;
 46a:	95b2                	add	a1,a1,a2
 46c:	fff6079b          	addiw	a5,a2,-1
 470:	1782                	slli	a5,a5,0x20
 472:	9381                	srli	a5,a5,0x20
 474:	fff7c793          	not	a5,a5
 478:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 47a:	15fd                	addi	a1,a1,-1
 47c:	177d                	addi	a4,a4,-1
 47e:	0005c683          	lbu	a3,0(a1)
 482:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 486:	fef71ae3          	bne	a4,a5,47a <memmove+0x4a>
 48a:	bfc1                	j	45a <memmove+0x2a>

000000000000048c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 48c:	1141                	addi	sp,sp,-16
 48e:	e406                	sd	ra,8(sp)
 490:	e022                	sd	s0,0(sp)
 492:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 494:	c61d                	beqz	a2,4c2 <memcmp+0x36>
 496:	1602                	slli	a2,a2,0x20
 498:	9201                	srli	a2,a2,0x20
 49a:	00c506b3          	add	a3,a0,a2
    if (*p1 != *p2) {
 49e:	00054783          	lbu	a5,0(a0)
 4a2:	0005c703          	lbu	a4,0(a1)
 4a6:	00e79863          	bne	a5,a4,4b6 <memcmp+0x2a>
      return *p1 - *p2;
    }
    p1++;
 4aa:	0505                	addi	a0,a0,1
    p2++;
 4ac:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4ae:	fed518e3          	bne	a0,a3,49e <memcmp+0x12>
  }
  return 0;
 4b2:	4501                	li	a0,0
 4b4:	a019                	j	4ba <memcmp+0x2e>
      return *p1 - *p2;
 4b6:	40e7853b          	subw	a0,a5,a4
}
 4ba:	60a2                	ld	ra,8(sp)
 4bc:	6402                	ld	s0,0(sp)
 4be:	0141                	addi	sp,sp,16
 4c0:	8082                	ret
  return 0;
 4c2:	4501                	li	a0,0
 4c4:	bfdd                	j	4ba <memcmp+0x2e>

00000000000004c6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4c6:	1141                	addi	sp,sp,-16
 4c8:	e406                	sd	ra,8(sp)
 4ca:	e022                	sd	s0,0(sp)
 4cc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4ce:	f63ff0ef          	jal	430 <memmove>
}
 4d2:	60a2                	ld	ra,8(sp)
 4d4:	6402                	ld	s0,0(sp)
 4d6:	0141                	addi	sp,sp,16
 4d8:	8082                	ret

00000000000004da <sbrk>:

char *
sbrk(int n) {
 4da:	1141                	addi	sp,sp,-16
 4dc:	e406                	sd	ra,8(sp)
 4de:	e022                	sd	s0,0(sp)
 4e0:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 4e2:	4585                	li	a1,1
 4e4:	0b2000ef          	jal	596 <sys_sbrk>
}
 4e8:	60a2                	ld	ra,8(sp)
 4ea:	6402                	ld	s0,0(sp)
 4ec:	0141                	addi	sp,sp,16
 4ee:	8082                	ret

00000000000004f0 <sbrklazy>:

char *
sbrklazy(int n) {
 4f0:	1141                	addi	sp,sp,-16
 4f2:	e406                	sd	ra,8(sp)
 4f4:	e022                	sd	s0,0(sp)
 4f6:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 4f8:	4589                	li	a1,2
 4fa:	09c000ef          	jal	596 <sys_sbrk>
}
 4fe:	60a2                	ld	ra,8(sp)
 500:	6402                	ld	s0,0(sp)
 502:	0141                	addi	sp,sp,16
 504:	8082                	ret

0000000000000506 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 506:	4885                	li	a7,1
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <exit>:
.global exit
exit:
 li a7, SYS_exit
 50e:	4889                	li	a7,2
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <wait>:
.global wait
wait:
 li a7, SYS_wait
 516:	488d                	li	a7,3
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 51e:	4891                	li	a7,4
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <read>:
.global read
read:
 li a7, SYS_read
 526:	4895                	li	a7,5
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <write>:
.global write
write:
 li a7, SYS_write
 52e:	48c1                	li	a7,16
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <close>:
.global close
close:
 li a7, SYS_close
 536:	48d5                	li	a7,21
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <kill>:
.global kill
kill:
 li a7, SYS_kill
 53e:	4899                	li	a7,6
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <exec>:
.global exec
exec:
 li a7, SYS_exec
 546:	489d                	li	a7,7
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <open>:
.global open
open:
 li a7, SYS_open
 54e:	48bd                	li	a7,15
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 556:	48c5                	li	a7,17
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 55e:	48c9                	li	a7,18
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 566:	48a1                	li	a7,8
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <link>:
.global link
link:
 li a7, SYS_link
 56e:	48cd                	li	a7,19
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 576:	48d1                	li	a7,20
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 57e:	48a5                	li	a7,9
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <dup>:
.global dup
dup:
 li a7, SYS_dup
 586:	48a9                	li	a7,10
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 58e:	48ad                	li	a7,11
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 596:	48b1                	li	a7,12
 ecall
 598:	00000073          	ecall
 ret
 59c:	8082                	ret

000000000000059e <pause>:
.global pause
pause:
 li a7, SYS_pause
 59e:	48b5                	li	a7,13
 ecall
 5a0:	00000073          	ecall
 ret
 5a4:	8082                	ret

00000000000005a6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5a6:	48b9                	li	a7,14
 ecall
 5a8:	00000073          	ecall
 ret
 5ac:	8082                	ret

00000000000005ae <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5ae:	1101                	addi	sp,sp,-32
 5b0:	ec06                	sd	ra,24(sp)
 5b2:	e822                	sd	s0,16(sp)
 5b4:	1000                	addi	s0,sp,32
 5b6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5ba:	4605                	li	a2,1
 5bc:	fef40593          	addi	a1,s0,-17
 5c0:	f6fff0ef          	jal	52e <write>
}
 5c4:	60e2                	ld	ra,24(sp)
 5c6:	6442                	ld	s0,16(sp)
 5c8:	6105                	addi	sp,sp,32
 5ca:	8082                	ret

00000000000005cc <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 5cc:	715d                	addi	sp,sp,-80
 5ce:	e486                	sd	ra,72(sp)
 5d0:	e0a2                	sd	s0,64(sp)
 5d2:	f84a                	sd	s2,48(sp)
 5d4:	f44e                	sd	s3,40(sp)
 5d6:	0880                	addi	s0,sp,80
 5d8:	892a                	mv	s2,a0
  char buf[20];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5da:	cac1                	beqz	a3,66a <printint+0x9e>
 5dc:	0805d763          	bgez	a1,66a <printint+0x9e>
    neg = 1;
    x = -xx;
 5e0:	40b005bb          	negw	a1,a1
    neg = 1;
 5e4:	4305                	li	t1,1
  } else {
    x = xx;
  }

  i = 0;
 5e6:	fb840993          	addi	s3,s0,-72
  neg = 0;
 5ea:	86ce                	mv	a3,s3
  i = 0;
 5ec:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5ee:	00000817          	auipc	a6,0x0
 5f2:	69280813          	addi	a6,a6,1682 # c80 <digits>
 5f6:	88ba                	mv	a7,a4
 5f8:	0017051b          	addiw	a0,a4,1
 5fc:	872a                	mv	a4,a0
 5fe:	02c5f7bb          	remuw	a5,a1,a2
 602:	1782                	slli	a5,a5,0x20
 604:	9381                	srli	a5,a5,0x20
 606:	97c2                	add	a5,a5,a6
 608:	0007c783          	lbu	a5,0(a5)
 60c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 610:	87ae                	mv	a5,a1
 612:	02c5d5bb          	divuw	a1,a1,a2
 616:	0685                	addi	a3,a3,1
 618:	fcc7ffe3          	bgeu	a5,a2,5f6 <printint+0x2a>
  if(neg)
 61c:	00030c63          	beqz	t1,634 <printint+0x68>
    buf[i++] = '-';
 620:	fd050793          	addi	a5,a0,-48
 624:	00878533          	add	a0,a5,s0
 628:	02d00793          	li	a5,45
 62c:	fef50423          	sb	a5,-24(a0)
 630:	0028871b          	addiw	a4,a7,2

  while(--i >= 0)
 634:	02e05563          	blez	a4,65e <printint+0x92>
 638:	fc26                	sd	s1,56(sp)
 63a:	377d                	addiw	a4,a4,-1
 63c:	00e984b3          	add	s1,s3,a4
 640:	19fd                	addi	s3,s3,-1
 642:	99ba                	add	s3,s3,a4
 644:	1702                	slli	a4,a4,0x20
 646:	9301                	srli	a4,a4,0x20
 648:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 64c:	0004c583          	lbu	a1,0(s1)
 650:	854a                	mv	a0,s2
 652:	f5dff0ef          	jal	5ae <putc>
  while(--i >= 0)
 656:	14fd                	addi	s1,s1,-1
 658:	ff349ae3          	bne	s1,s3,64c <printint+0x80>
 65c:	74e2                	ld	s1,56(sp)
}
 65e:	60a6                	ld	ra,72(sp)
 660:	6406                	ld	s0,64(sp)
 662:	7942                	ld	s2,48(sp)
 664:	79a2                	ld	s3,40(sp)
 666:	6161                	addi	sp,sp,80
 668:	8082                	ret
    x = xx;
 66a:	2581                	sext.w	a1,a1
  neg = 0;
 66c:	4301                	li	t1,0
 66e:	bfa5                	j	5e6 <printint+0x1a>

0000000000000670 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 670:	711d                	addi	sp,sp,-96
 672:	ec86                	sd	ra,88(sp)
 674:	e8a2                	sd	s0,80(sp)
 676:	e4a6                	sd	s1,72(sp)
 678:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 67a:	0005c483          	lbu	s1,0(a1)
 67e:	22048363          	beqz	s1,8a4 <vprintf+0x234>
 682:	e0ca                	sd	s2,64(sp)
 684:	fc4e                	sd	s3,56(sp)
 686:	f852                	sd	s4,48(sp)
 688:	f456                	sd	s5,40(sp)
 68a:	f05a                	sd	s6,32(sp)
 68c:	ec5e                	sd	s7,24(sp)
 68e:	e862                	sd	s8,16(sp)
 690:	8b2a                	mv	s6,a0
 692:	8a2e                	mv	s4,a1
 694:	8bb2                	mv	s7,a2
  state = 0;
 696:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 698:	4901                	li	s2,0
 69a:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 69c:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 6a0:	06400c13          	li	s8,100
 6a4:	a00d                	j	6c6 <vprintf+0x56>
        putc(fd, c0);
 6a6:	85a6                	mv	a1,s1
 6a8:	855a                	mv	a0,s6
 6aa:	f05ff0ef          	jal	5ae <putc>
 6ae:	a019                	j	6b4 <vprintf+0x44>
    } else if(state == '%'){
 6b0:	03598363          	beq	s3,s5,6d6 <vprintf+0x66>
  for(i = 0; fmt[i]; i++){
 6b4:	0019079b          	addiw	a5,s2,1
 6b8:	893e                	mv	s2,a5
 6ba:	873e                	mv	a4,a5
 6bc:	97d2                	add	a5,a5,s4
 6be:	0007c483          	lbu	s1,0(a5)
 6c2:	1c048a63          	beqz	s1,896 <vprintf+0x226>
    c0 = fmt[i] & 0xff;
 6c6:	0004879b          	sext.w	a5,s1
    if(state == 0){
 6ca:	fe0993e3          	bnez	s3,6b0 <vprintf+0x40>
      if(c0 == '%'){
 6ce:	fd579ce3          	bne	a5,s5,6a6 <vprintf+0x36>
        state = '%';
 6d2:	89be                	mv	s3,a5
 6d4:	b7c5                	j	6b4 <vprintf+0x44>
      if(c0) c1 = fmt[i+1] & 0xff;
 6d6:	00ea06b3          	add	a3,s4,a4
 6da:	0016c603          	lbu	a2,1(a3)
      if(c1) c2 = fmt[i+2] & 0xff;
 6de:	1c060863          	beqz	a2,8ae <vprintf+0x23e>
      if(c0 == 'd'){
 6e2:	03878763          	beq	a5,s8,710 <vprintf+0xa0>
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 6e6:	f9478693          	addi	a3,a5,-108
 6ea:	0016b693          	seqz	a3,a3
 6ee:	f9c60593          	addi	a1,a2,-100
 6f2:	e99d                	bnez	a1,728 <vprintf+0xb8>
 6f4:	ca95                	beqz	a3,728 <vprintf+0xb8>
        printint(fd, va_arg(ap, uint64), 10, 1);
 6f6:	008b8493          	addi	s1,s7,8
 6fa:	4685                	li	a3,1
 6fc:	4629                	li	a2,10
 6fe:	000bb583          	ld	a1,0(s7)
 702:	855a                	mv	a0,s6
 704:	ec9ff0ef          	jal	5cc <printint>
        i += 1;
 708:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 70a:	8ba6                	mv	s7,s1
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 70c:	4981                	li	s3,0
 70e:	b75d                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, int), 10, 1);
 710:	008b8493          	addi	s1,s7,8
 714:	4685                	li	a3,1
 716:	4629                	li	a2,10
 718:	000ba583          	lw	a1,0(s7)
 71c:	855a                	mv	a0,s6
 71e:	eafff0ef          	jal	5cc <printint>
 722:	8ba6                	mv	s7,s1
      state = 0;
 724:	4981                	li	s3,0
 726:	b779                	j	6b4 <vprintf+0x44>
      if(c1) c2 = fmt[i+2] & 0xff;
 728:	9752                	add	a4,a4,s4
 72a:	00274583          	lbu	a1,2(a4)
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 72e:	f9460713          	addi	a4,a2,-108
 732:	00173713          	seqz	a4,a4
 736:	8f75                	and	a4,a4,a3
 738:	f9c58513          	addi	a0,a1,-100
 73c:	18051363          	bnez	a0,8c2 <vprintf+0x252>
 740:	18070163          	beqz	a4,8c2 <vprintf+0x252>
        printint(fd, va_arg(ap, uint64), 10, 1);
 744:	008b8493          	addi	s1,s7,8
 748:	4685                	li	a3,1
 74a:	4629                	li	a2,10
 74c:	000bb583          	ld	a1,0(s7)
 750:	855a                	mv	a0,s6
 752:	e7bff0ef          	jal	5cc <printint>
        i += 2;
 756:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 758:	8ba6                	mv	s7,s1
      state = 0;
 75a:	4981                	li	s3,0
        i += 2;
 75c:	bfa1                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 10, 0);
 75e:	008b8493          	addi	s1,s7,8
 762:	4681                	li	a3,0
 764:	4629                	li	a2,10
 766:	000be583          	lwu	a1,0(s7)
 76a:	855a                	mv	a0,s6
 76c:	e61ff0ef          	jal	5cc <printint>
 770:	8ba6                	mv	s7,s1
      state = 0;
 772:	4981                	li	s3,0
 774:	b781                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 776:	008b8493          	addi	s1,s7,8
 77a:	4681                	li	a3,0
 77c:	4629                	li	a2,10
 77e:	000bb583          	ld	a1,0(s7)
 782:	855a                	mv	a0,s6
 784:	e49ff0ef          	jal	5cc <printint>
        i += 1;
 788:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 78a:	8ba6                	mv	s7,s1
      state = 0;
 78c:	4981                	li	s3,0
 78e:	b71d                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 790:	008b8493          	addi	s1,s7,8
 794:	4681                	li	a3,0
 796:	4629                	li	a2,10
 798:	000bb583          	ld	a1,0(s7)
 79c:	855a                	mv	a0,s6
 79e:	e2fff0ef          	jal	5cc <printint>
        i += 2;
 7a2:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 7a4:	8ba6                	mv	s7,s1
      state = 0;
 7a6:	4981                	li	s3,0
        i += 2;
 7a8:	b731                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 16, 0);
 7aa:	008b8493          	addi	s1,s7,8
 7ae:	4681                	li	a3,0
 7b0:	4641                	li	a2,16
 7b2:	000be583          	lwu	a1,0(s7)
 7b6:	855a                	mv	a0,s6
 7b8:	e15ff0ef          	jal	5cc <printint>
 7bc:	8ba6                	mv	s7,s1
      state = 0;
 7be:	4981                	li	s3,0
 7c0:	bdd5                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7c2:	008b8493          	addi	s1,s7,8
 7c6:	4681                	li	a3,0
 7c8:	4641                	li	a2,16
 7ca:	000bb583          	ld	a1,0(s7)
 7ce:	855a                	mv	a0,s6
 7d0:	dfdff0ef          	jal	5cc <printint>
        i += 1;
 7d4:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 7d6:	8ba6                	mv	s7,s1
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	bde9                	j	6b4 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7dc:	008b8493          	addi	s1,s7,8
 7e0:	4681                	li	a3,0
 7e2:	4641                	li	a2,16
 7e4:	000bb583          	ld	a1,0(s7)
 7e8:	855a                	mv	a0,s6
 7ea:	de3ff0ef          	jal	5cc <printint>
        i += 2;
 7ee:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 7f0:	8ba6                	mv	s7,s1
      state = 0;
 7f2:	4981                	li	s3,0
        i += 2;
 7f4:	b5c1                	j	6b4 <vprintf+0x44>
 7f6:	e466                	sd	s9,8(sp)
        printptr(fd, va_arg(ap, uint64));
 7f8:	008b8793          	addi	a5,s7,8
 7fc:	8cbe                	mv	s9,a5
 7fe:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 802:	03000593          	li	a1,48
 806:	855a                	mv	a0,s6
 808:	da7ff0ef          	jal	5ae <putc>
  putc(fd, 'x');
 80c:	07800593          	li	a1,120
 810:	855a                	mv	a0,s6
 812:	d9dff0ef          	jal	5ae <putc>
 816:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 818:	00000b97          	auipc	s7,0x0
 81c:	468b8b93          	addi	s7,s7,1128 # c80 <digits>
 820:	03c9d793          	srli	a5,s3,0x3c
 824:	97de                	add	a5,a5,s7
 826:	0007c583          	lbu	a1,0(a5)
 82a:	855a                	mv	a0,s6
 82c:	d83ff0ef          	jal	5ae <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 830:	0992                	slli	s3,s3,0x4
 832:	34fd                	addiw	s1,s1,-1
 834:	f4f5                	bnez	s1,820 <vprintf+0x1b0>
        printptr(fd, va_arg(ap, uint64));
 836:	8be6                	mv	s7,s9
      state = 0;
 838:	4981                	li	s3,0
 83a:	6ca2                	ld	s9,8(sp)
 83c:	bda5                	j	6b4 <vprintf+0x44>
        putc(fd, va_arg(ap, uint32));
 83e:	008b8493          	addi	s1,s7,8
 842:	000bc583          	lbu	a1,0(s7)
 846:	855a                	mv	a0,s6
 848:	d67ff0ef          	jal	5ae <putc>
 84c:	8ba6                	mv	s7,s1
      state = 0;
 84e:	4981                	li	s3,0
 850:	b595                	j	6b4 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 852:	008b8993          	addi	s3,s7,8
 856:	000bb483          	ld	s1,0(s7)
 85a:	cc91                	beqz	s1,876 <vprintf+0x206>
        for(; *s; s++)
 85c:	0004c583          	lbu	a1,0(s1)
 860:	c985                	beqz	a1,890 <vprintf+0x220>
          putc(fd, *s);
 862:	855a                	mv	a0,s6
 864:	d4bff0ef          	jal	5ae <putc>
        for(; *s; s++)
 868:	0485                	addi	s1,s1,1
 86a:	0004c583          	lbu	a1,0(s1)
 86e:	f9f5                	bnez	a1,862 <vprintf+0x1f2>
        if((s = va_arg(ap, char*)) == 0)
 870:	8bce                	mv	s7,s3
      state = 0;
 872:	4981                	li	s3,0
 874:	b581                	j	6b4 <vprintf+0x44>
          s = "(null)";
 876:	00000497          	auipc	s1,0x0
 87a:	37a48493          	addi	s1,s1,890 # bf0 <malloc+0x1de>
        for(; *s; s++)
 87e:	02800593          	li	a1,40
 882:	b7c5                	j	862 <vprintf+0x1f2>
        putc(fd, '%');
 884:	85be                	mv	a1,a5
 886:	855a                	mv	a0,s6
 888:	d27ff0ef          	jal	5ae <putc>
      state = 0;
 88c:	4981                	li	s3,0
 88e:	b51d                	j	6b4 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 890:	8bce                	mv	s7,s3
      state = 0;
 892:	4981                	li	s3,0
 894:	b505                	j	6b4 <vprintf+0x44>
 896:	6906                	ld	s2,64(sp)
 898:	79e2                	ld	s3,56(sp)
 89a:	7a42                	ld	s4,48(sp)
 89c:	7aa2                	ld	s5,40(sp)
 89e:	7b02                	ld	s6,32(sp)
 8a0:	6be2                	ld	s7,24(sp)
 8a2:	6c42                	ld	s8,16(sp)
    }
  }
}
 8a4:	60e6                	ld	ra,88(sp)
 8a6:	6446                	ld	s0,80(sp)
 8a8:	64a6                	ld	s1,72(sp)
 8aa:	6125                	addi	sp,sp,96
 8ac:	8082                	ret
      if(c0 == 'd'){
 8ae:	06400713          	li	a4,100
 8b2:	e4e78fe3          	beq	a5,a4,710 <vprintf+0xa0>
      } else if(c0 == 'l' && c1 == 'd'){
 8b6:	f9478693          	addi	a3,a5,-108
 8ba:	0016b693          	seqz	a3,a3
      c1 = c2 = 0;
 8be:	85b2                	mv	a1,a2
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 8c0:	4701                	li	a4,0
      } else if(c0 == 'u'){
 8c2:	07500513          	li	a0,117
 8c6:	e8a78ce3          	beq	a5,a0,75e <vprintf+0xee>
      } else if(c0 == 'l' && c1 == 'u'){
 8ca:	f8b60513          	addi	a0,a2,-117
 8ce:	e119                	bnez	a0,8d4 <vprintf+0x264>
 8d0:	ea0693e3          	bnez	a3,776 <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 8d4:	f8b58513          	addi	a0,a1,-117
 8d8:	e119                	bnez	a0,8de <vprintf+0x26e>
 8da:	ea071be3          	bnez	a4,790 <vprintf+0x120>
      } else if(c0 == 'x'){
 8de:	07800513          	li	a0,120
 8e2:	eca784e3          	beq	a5,a0,7aa <vprintf+0x13a>
      } else if(c0 == 'l' && c1 == 'x'){
 8e6:	f8860613          	addi	a2,a2,-120
 8ea:	e219                	bnez	a2,8f0 <vprintf+0x280>
 8ec:	ec069be3          	bnez	a3,7c2 <vprintf+0x152>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 8f0:	f8858593          	addi	a1,a1,-120
 8f4:	e199                	bnez	a1,8fa <vprintf+0x28a>
 8f6:	ee0713e3          	bnez	a4,7dc <vprintf+0x16c>
      } else if(c0 == 'p'){
 8fa:	07000713          	li	a4,112
 8fe:	eee78ce3          	beq	a5,a4,7f6 <vprintf+0x186>
      } else if(c0 == 'c'){
 902:	06300713          	li	a4,99
 906:	f2e78ce3          	beq	a5,a4,83e <vprintf+0x1ce>
      } else if(c0 == 's'){
 90a:	07300713          	li	a4,115
 90e:	f4e782e3          	beq	a5,a4,852 <vprintf+0x1e2>
      } else if(c0 == '%'){
 912:	02500713          	li	a4,37
 916:	f6e787e3          	beq	a5,a4,884 <vprintf+0x214>
        putc(fd, '%');
 91a:	02500593          	li	a1,37
 91e:	855a                	mv	a0,s6
 920:	c8fff0ef          	jal	5ae <putc>
        putc(fd, c0);
 924:	85a6                	mv	a1,s1
 926:	855a                	mv	a0,s6
 928:	c87ff0ef          	jal	5ae <putc>
      state = 0;
 92c:	4981                	li	s3,0
 92e:	b359                	j	6b4 <vprintf+0x44>

0000000000000930 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 930:	715d                	addi	sp,sp,-80
 932:	ec06                	sd	ra,24(sp)
 934:	e822                	sd	s0,16(sp)
 936:	1000                	addi	s0,sp,32
 938:	e010                	sd	a2,0(s0)
 93a:	e414                	sd	a3,8(s0)
 93c:	e818                	sd	a4,16(s0)
 93e:	ec1c                	sd	a5,24(s0)
 940:	03043023          	sd	a6,32(s0)
 944:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 948:	8622                	mv	a2,s0
 94a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 94e:	d23ff0ef          	jal	670 <vprintf>
}
 952:	60e2                	ld	ra,24(sp)
 954:	6442                	ld	s0,16(sp)
 956:	6161                	addi	sp,sp,80
 958:	8082                	ret

000000000000095a <printf>:

void
printf(const char *fmt, ...)
{
 95a:	711d                	addi	sp,sp,-96
 95c:	ec06                	sd	ra,24(sp)
 95e:	e822                	sd	s0,16(sp)
 960:	1000                	addi	s0,sp,32
 962:	e40c                	sd	a1,8(s0)
 964:	e810                	sd	a2,16(s0)
 966:	ec14                	sd	a3,24(s0)
 968:	f018                	sd	a4,32(s0)
 96a:	f41c                	sd	a5,40(s0)
 96c:	03043823          	sd	a6,48(s0)
 970:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 974:	00840613          	addi	a2,s0,8
 978:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 97c:	85aa                	mv	a1,a0
 97e:	4505                	li	a0,1
 980:	cf1ff0ef          	jal	670 <vprintf>
}
 984:	60e2                	ld	ra,24(sp)
 986:	6442                	ld	s0,16(sp)
 988:	6125                	addi	sp,sp,96
 98a:	8082                	ret

000000000000098c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 98c:	1141                	addi	sp,sp,-16
 98e:	e406                	sd	ra,8(sp)
 990:	e022                	sd	s0,0(sp)
 992:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 994:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 998:	00001797          	auipc	a5,0x1
 99c:	6687b783          	ld	a5,1640(a5) # 2000 <freep>
 9a0:	a039                	j	9ae <free+0x22>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a2:	6398                	ld	a4,0(a5)
 9a4:	00e7e463          	bltu	a5,a4,9ac <free+0x20>
 9a8:	00e6ea63          	bltu	a3,a4,9bc <free+0x30>
{
 9ac:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ae:	fed7fae3          	bgeu	a5,a3,9a2 <free+0x16>
 9b2:	6398                	ld	a4,0(a5)
 9b4:	00e6e463          	bltu	a3,a4,9bc <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b8:	fee7eae3          	bltu	a5,a4,9ac <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9bc:	ff852583          	lw	a1,-8(a0)
 9c0:	6390                	ld	a2,0(a5)
 9c2:	02059813          	slli	a6,a1,0x20
 9c6:	01c85713          	srli	a4,a6,0x1c
 9ca:	9736                	add	a4,a4,a3
 9cc:	02e60563          	beq	a2,a4,9f6 <free+0x6a>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9d0:	fec53823          	sd	a2,-16(a0)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9d4:	4790                	lw	a2,8(a5)
 9d6:	02061593          	slli	a1,a2,0x20
 9da:	01c5d713          	srli	a4,a1,0x1c
 9de:	973e                	add	a4,a4,a5
 9e0:	02e68263          	beq	a3,a4,a04 <free+0x78>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9e4:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 9e6:	00001717          	auipc	a4,0x1
 9ea:	60f73d23          	sd	a5,1562(a4) # 2000 <freep>
}
 9ee:	60a2                	ld	ra,8(sp)
 9f0:	6402                	ld	s0,0(sp)
 9f2:	0141                	addi	sp,sp,16
 9f4:	8082                	ret
    bp->s.size += p->s.ptr->s.size;
 9f6:	4618                	lw	a4,8(a2)
 9f8:	9f2d                	addw	a4,a4,a1
 9fa:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9fe:	6398                	ld	a4,0(a5)
 a00:	6310                	ld	a2,0(a4)
 a02:	b7f9                	j	9d0 <free+0x44>
    p->s.size += bp->s.size;
 a04:	ff852703          	lw	a4,-8(a0)
 a08:	9f31                	addw	a4,a4,a2
 a0a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 a0c:	ff053683          	ld	a3,-16(a0)
 a10:	bfd1                	j	9e4 <free+0x58>

0000000000000a12 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a12:	7139                	addi	sp,sp,-64
 a14:	fc06                	sd	ra,56(sp)
 a16:	f822                	sd	s0,48(sp)
 a18:	f04a                	sd	s2,32(sp)
 a1a:	ec4e                	sd	s3,24(sp)
 a1c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1e:	02051993          	slli	s3,a0,0x20
 a22:	0209d993          	srli	s3,s3,0x20
 a26:	09bd                	addi	s3,s3,15
 a28:	0049d993          	srli	s3,s3,0x4
 a2c:	2985                	addiw	s3,s3,1
 a2e:	894e                	mv	s2,s3
  if((prevp = freep) == 0){
 a30:	00001517          	auipc	a0,0x1
 a34:	5d053503          	ld	a0,1488(a0) # 2000 <freep>
 a38:	c905                	beqz	a0,a68 <malloc+0x56>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a3c:	4798                	lw	a4,8(a5)
 a3e:	09377663          	bgeu	a4,s3,aca <malloc+0xb8>
 a42:	f426                	sd	s1,40(sp)
 a44:	e852                	sd	s4,16(sp)
 a46:	e456                	sd	s5,8(sp)
 a48:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 a4a:	8a4e                	mv	s4,s3
 a4c:	6705                	lui	a4,0x1
 a4e:	00e9f363          	bgeu	s3,a4,a54 <malloc+0x42>
 a52:	6a05                	lui	s4,0x1
 a54:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a58:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a5c:	00001497          	auipc	s1,0x1
 a60:	5a448493          	addi	s1,s1,1444 # 2000 <freep>
  if(p == SBRK_ERROR)
 a64:	5afd                	li	s5,-1
 a66:	a83d                	j	aa4 <malloc+0x92>
 a68:	f426                	sd	s1,40(sp)
 a6a:	e852                	sd	s4,16(sp)
 a6c:	e456                	sd	s5,8(sp)
 a6e:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 a70:	00001797          	auipc	a5,0x1
 a74:	5a078793          	addi	a5,a5,1440 # 2010 <base>
 a78:	00001717          	auipc	a4,0x1
 a7c:	58f73423          	sd	a5,1416(a4) # 2000 <freep>
 a80:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a82:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a86:	b7d1                	j	a4a <malloc+0x38>
        prevp->s.ptr = p->s.ptr;
 a88:	6398                	ld	a4,0(a5)
 a8a:	e118                	sd	a4,0(a0)
 a8c:	a899                	j	ae2 <malloc+0xd0>
  hp->s.size = nu;
 a8e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a92:	0541                	addi	a0,a0,16
 a94:	ef9ff0ef          	jal	98c <free>
  return freep;
 a98:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 a9a:	c125                	beqz	a0,afa <malloc+0xe8>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a9e:	4798                	lw	a4,8(a5)
 aa0:	03277163          	bgeu	a4,s2,ac2 <malloc+0xb0>
    if(p == freep)
 aa4:	6098                	ld	a4,0(s1)
 aa6:	853e                	mv	a0,a5
 aa8:	fef71ae3          	bne	a4,a5,a9c <malloc+0x8a>
  p = sbrk(nu * sizeof(Header));
 aac:	8552                	mv	a0,s4
 aae:	a2dff0ef          	jal	4da <sbrk>
  if(p == SBRK_ERROR)
 ab2:	fd551ee3          	bne	a0,s5,a8e <malloc+0x7c>
        return 0;
 ab6:	4501                	li	a0,0
 ab8:	74a2                	ld	s1,40(sp)
 aba:	6a42                	ld	s4,16(sp)
 abc:	6aa2                	ld	s5,8(sp)
 abe:	6b02                	ld	s6,0(sp)
 ac0:	a03d                	j	aee <malloc+0xdc>
 ac2:	74a2                	ld	s1,40(sp)
 ac4:	6a42                	ld	s4,16(sp)
 ac6:	6aa2                	ld	s5,8(sp)
 ac8:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 aca:	fae90fe3          	beq	s2,a4,a88 <malloc+0x76>
        p->s.size -= nunits;
 ace:	4137073b          	subw	a4,a4,s3
 ad2:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ad4:	02071693          	slli	a3,a4,0x20
 ad8:	01c6d713          	srli	a4,a3,0x1c
 adc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 ade:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 ae2:	00001717          	auipc	a4,0x1
 ae6:	50a73f23          	sd	a0,1310(a4) # 2000 <freep>
      return (void*)(p + 1);
 aea:	01078513          	addi	a0,a5,16
  }
}
 aee:	70e2                	ld	ra,56(sp)
 af0:	7442                	ld	s0,48(sp)
 af2:	7902                	ld	s2,32(sp)
 af4:	69e2                	ld	s3,24(sp)
 af6:	6121                	addi	sp,sp,64
 af8:	8082                	ret
 afa:	74a2                	ld	s1,40(sp)
 afc:	6a42                	ld	s4,16(sp)
 afe:	6aa2                	ld	s5,8(sp)
 b00:	6b02                	ld	s6,0(sp)
 b02:	b7f5                	j	aee <malloc+0xdc>
