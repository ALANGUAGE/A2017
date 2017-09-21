     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9D92F                  jmp main
     5                                  
     6                                  ;-1 // 23.644 byte 21.407byte, Full  Working 2017.09.13
     7                                  
     8                                  
     9                                  ;-2 char Version1[]="A.COM V0.9";
    10                                  
    11 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9",0
    12 0000000C 3900               
    13                                  
    14                                  ;-3 #define LSTART        200
    15                                  
    16                                  
    17                                  ;-4 #define VARMAX        300
    18                                  
    19                                  
    20                                  ;-5 #define GNAMEMAX     4800 // 16*VARMAX
    21                                  
    22                                  
    23                                  ;-6 #define FUNCMAX       300
    24                                  
    25                                  
    26                                  ;-7 #define FNAMEMAX     4800 // 16*FUNCMAX
    27                                  
    28                                  
    29                                  ;-8 #define CALLMAX      2000
    30                                  
    31                                  
    32                                  ;-9 #define IDLENMAX       15
    33                                  
    34                                  
    35                                  ;-10 #define _                 // Konstantvergleich
    36                                  
    37                                  
    38                                  ;-11 #define T_NAME        256
    39                                  
    40                                  
    41                                  ;-12 #define T_CONST       257 
    42                                  
    43                                  
    44                                  ;-13 #define T_STRING      258     
    45                                  
    46                                  
    47                                  ;-14 #define T_INCLUDE     510     
    48                                  
    49                                  
    50                                  ;-15 #define T_DEFINE      511  
    51                                  
    52                                  
    53                                  ;-16 #define T_RETURN      512
    54                                  
    55                                  
    56                                  ;-17 #define T_IF          513      
    57                                  
    58                                  
    59                                  ;-18 #define T_ELSE        514  
    60                                  
    61                                  
    62                                  ;-19 #define T_WHILE       515      
    63                                  
    64                                  
    65                                  ;-20 #define T_DO          516
    66                                  
    67                                  
    68                                  ;-21 #define T_INT         517     
    69                                  
    70                                  
    71                                  ;-22 #define T_ASM         518   
    72                                  
    73                                  
    74                                  ;-23 #define T_ASMBLOCK    519   
    75                                  
    76                                  
    77                                  ;-24 #define T_EMIT        520
    78                                  
    79                                  
    80                                  ;-25 #define T_GOTO        521    
    81                                  
    82                                  
    83                                  ;-26 #define T_VOID        529  
    84                                  
    85                                  
    86                                  ;-27 #define T_CHAR        530       
    87                                  
    88                                  
    89                                  ;-28 #define T_SIGNED      531
    90                                  
    91                                  
    92                                  ;-29 #define T_UNSIGNED    532
    93                                  
    94                                  
    95                                  ;-30 #define T_LONG        533
    96                                  
    97                                  
    98                                  ;-31 #define T_EQ          806
    99                                  
   100                                  
   101                                  ;-32 #define T_NE          807
   102                                  
   103                                  
   104                                  ;-33 #define T_GE          811
   105                                  
   106                                  
   107                                  ;-34 #define T_LE          824
   108                                  
   109                                  
   110                                  ;-35 #define T_PLUSPLUS   1219
   111                                  
   112                                  
   113                                  ;-36 #define T_MINUSMINUS 1225
   114                                  
   115                                  
   116                                  ;-37 #define T_PLUSASS    1230
   117                                  
   118                                  
   119                                  ;-38 #define T_MINUSASS   1231
   120                                  
   121                                  
   122                                  ;-39 #define T_MULASS     1232
   123                                  
   124                                  
   125                                  ;-40 #define T_DIVASS     1233
   126                                  
   127                                  
   128                                  ;-41 #define T_ANDASS     1234
   129                                  
   130                                  
   131                                  ;-42 #define T_ORASS      1235
   132                                  
   133                                  
   134                                  ;-43 #define T_LESSLESS   1240
   135                                  
   136                                  
   137                                  ;-44 #define T_GREATGREAT 1241
   138                                  
   139                                  
   140                                  ;-45 #define COMAX        3000
   141                                  
   142                                  
   143                                  ;-46 #define CMDLENMAX      67
   144                                  
   145                                  
   146                                  ;-47 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   147                                  
   148 0000000E 3075                    ORGDATAORIG dw 30000
   149 00000010 3075                    orgData dw 30000
   150                                  
   151                                  ;-48 char co[COMAX];    int maxco=0;      int maxco1=0;
   152                                  
   153                                  section .bss
   154                                  absolute 30000
   155 00007530 <res 00000BB8>          co resb 3000
   156                                  section .text
   157 00000012 0000                    maxco dw 0
   158 00000014 0000                    maxco1 dw 0
   159                                  
   160                                  ;-49 char coname[CMDLENMAX];              char *cloc=0;
   161                                  
   162                                  section .bss
   163                                  absolute 33000
   164 000080E8 <res 00000043>          coname resb 67
   165                                  section .text
   166 00000016 0000                    cloc dw 0
   167                                  
   168                                  ;-50 int fdin=0;        int fdout=0;      char symbol[128];
   169                                  
   170 00000018 0000                    fdin dw 0
   171 0000001A 0000                    fdout dw 0
   172                                  section .bss
   173                                  absolute 33067
   174 0000812B <res 00000080>          symbol resb 128
   175                                  section .text
   176                                  
   177                                  ;-51 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   178                                  
   179                                  section .bss
   180                                  absolute 33195
   181 000081AB <res 00000043>          fname resb 67
   182                                  section .text
   183                                  section .bss
   184                                  absolute 33262
   185 000081EE <res 00000043>          namein resb 67
   186                                  section .text
   187                                  
   188                                  ;-52 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   189                                  
   190                                  section .bss
   191                                  absolute 33329
   192 00008231 <res 00000043>          namelst resb 67
   193                                  section .text
   194                                  section .bss
   195                                  absolute 33396
   196 00008274 <res 00000043>          archivename resb 67
   197                                  section .text
   198                                  
   199                                  ;-53 int token=0;       char globC=0;     int spalte=0;
   200                                  
   201 0000001C 0000                    token dw 0
   202 0000001E 00                      globC db 0
   203 0000001F 0000                    spalte dw 0
   204                                  
   205                                  ;-54 char thechar=0;   //reads one char forward 
   206                                  
   207 00000021 00                      thechar db 0
   208                                  
   209                                  ;-55 int iscmp=0;      int nconst=0;
   210                                  
   211 00000022 0000                    iscmp dw 0
   212 00000024 0000                    nconst dw 0
   213                                  
   214                                  ;-56 int nreturn=0;     int nlabel=0;    
   215                                  
   216 00000026 0000                    nreturn dw 0
   217 00000028 0000                    nlabel dw 0
   218                                  
   219                                  ;-57 int GTop=1;        int LTop=150;
   220                                  
   221 0000002A 0100                    GTop dw 1
   222 0000002C 9600                    LTop dw 150
   223                                  
   224                                  ;-58 unsigned int lexval=0;
   225                                  
   226 0000002E 0000                    lexval dw 0
   227                                  
   228                                  ;-59 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   229                                  
   230 00000030 0000                    typei dw 0
   231 00000032 00                      istype db 0
   232                                  section .bss
   233                                  absolute 33463
   234 000082B7 <res 0000012C>          GType resb 300
   235                                  section .text
   236                                  
   237                                  ;-60 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   238                                  
   239 00000033 0000                    signi dw 0
   240 00000035 00                      issign db 0
   241                                  section .bss
   242                                  absolute 33763
   243 000083E3 <res 0000012C>          GSign resb 300
   244                                  section .text
   245                                  
   246                                  ;-61 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   247                                  
   248 00000036 0000                    widthi dw 0
   249 00000038 00                      iswidth db 0
   250                                  section .bss
   251                                  absolute 34063
   252 0000850F <res 0000012C>          GWidth resb 300
   253                                  section .text
   254                                  
   255                                  ;-62              int GAdr[VARMAX]; int  GUsed [VARMAX];
   256                                  
   257                                  section .bss
   258                                  absolute 34363
   259 0000863B <res 00000258>          GAdr resw 300
   260                                  section .text
   261                                  section .bss
   262                                  absolute 34963
   263 00008893 <res 00000258>          GUsed resw 300
   264                                  section .text
   265                                  
   266                                  ;-63 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   267                                  
   268 00000039 0000                    wi dw 0
   269                                  section .bss
   270                                  absolute 35563
   271 00008AEB <res 00000258>          GData resw 300
   272                                  section .text
   273                                  section .bss
   274                                  absolute 36163
   275 00008D43 <res 000012C0>          GNameField resb 4800
   276                                  section .text
   277                                  
   278                                  ;-64 int  FTop=0;                 int  CTop=0;
   279                                  
   280 0000003B 0000                    FTop dw 0
   281 0000003D 0000                    CTop dw 0
   282                                  
   283                                  ;-65 char FType [FUNCMAX];        char CType[CALLMAX];
   284                                  
   285                                  section .bss
   286                                  absolute 40963
   287 0000A003 <res 0000012C>          FType resb 300
   288                                  section .text
   289                                  section .bss
   290                                  absolute 41263
   291 0000A12F <res 000007D0>          CType resb 2000
   292                                  section .text
   293                                  
   294                                  ;-66 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   295                                  
   296                                  section .bss
   297                                  absolute 43263
   298 0000A8FF <res 00000258>          FAdr resw 300
   299                                  section .text
   300                                  section .bss
   301                                  absolute 43863
   302 0000AB57 <res 00000FA0>          CAdr resw 2000
   303                                  section .text
   304                                  
   305                                  ;-67 int  FCalls[FUNCMAX];
   306                                  
   307                                  section .bss
   308                                  absolute 47863
   309 0000BAF7 <res 00000258>          FCalls resw 300
   310                                  section .text
   311                                  
   312                                  ;-68 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   313                                  
   314                                  section .bss
   315                                  absolute 48463
   316 0000BD4F <res 000012C0>          FNameField resb 4800
   317                                  section .text
   318                                  
   319                                  ;-69 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   320                                  
   321 0000003F 313233343536373839-     NameA db "12345678901234567890123456789012",0
   322 00000048 303132333435363738-
   323 00000051 393031323334353637-
   324 0000005A 383930313200       
   325                                  
   326                                  ;-70 char fgetsdest[128];         unsigned char *CNameTop=0;
   327                                  
   328                                  section .bss
   329                                  absolute 53263
   330 0000D00F <res 00000080>          fgetsdest resb 128
   331                                  section .text
   332 00000060 0000                    CNameTop dw 0
   333                                  
   334                                  ;-71 unsigned char *fgetsp=0;     unsigned int segE;
   335                                  
   336 00000062 0000                    fgetsp dw 0
   337 00000064 0000                    segE dw 0
   338                                  
   339                                  ;-72 unsigned int lineno=1;       unsigned int linenoinclude=1;
   340                                  
   341 00000066 0100                    lineno dw 1
   342 00000068 0100                    linenoinclude dw 1
   343                                  
   344                                  ;-73 unsigned char *pt=0;         unsigned char *p1=0;
   345                                  
   346 0000006A 0000                    pt dw 0
   347 0000006C 0000                    p1 dw 0
   348                                  
   349                                  ;-74 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   350                                  
   351 0000006E 0000                    DOS_ERR dw 0
   352 00000070 0000                    DOS_NoBytes dw 0
   353 00000072 00                      DOS_ByteRead db 0
   354                                  
   355                                  ;-75 
   356                                  
   357                                  
   358                                  ;-76 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 
   359                                  
   360                                  
   361                                  writetty: PROC
   362 00000073 B40E                     mov  ah, 14
   363 00000075 BB0000                   mov  bx, 0
   364 00000078 CD10                     db 205,16
   365                                  
   366                                  ;-77 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
   367                                  
   368 0000007A C3                       ret
   369                                  ENDP
   370                                  
   371                                  putch: PROC
   372                                  ;Function : putch, Number of local variables: 1
   373                                  ;   # type sign width addr used name   list of local variables
   374                                  ;  200 var sign byte    77 NULL c = bp+4;
   375 0000007B C8000000                 ENTER  0,0 ; constant expression
   376 0000007F 807E040A                cmp byte[bp+4], 10
   377 00000083 0F850500                 jne .putch1
   378 00000087 B00D                     mov  al, 13
   379 00000089 E8E7FF                   call writetty
   380                                  .putch1:
   381 0000008C 8A4604                   mov  al, [bp+4]
   382 0000008F E8E1FF                   call writetty
   383                                  
   384                                  ;-78 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   385 00000092 C9                       LEAVE
   386 00000093 C3                       ret
   387                                  ENDP
   388                                  
   389                                  cputs: PROC
   390                                  ;Function : cputs, Number of local variables: 2
   391                                  ;   # type sign width addr used name   list of local variables
   392                                  ;  200 ptr sign byte    78 NULL s = bp+4
   393                                  ;  201 var sign byte    78 NULL c = bp-2;
   394 00000094 C8020000                 ENTER  2,0
   395                                  .cputs2:
   396 00000098 8B5E04                   mov bx, [bp+4]
   397 0000009B 8A07                     mov al, [bx]
   398 0000009D B400                     mov ah, 0
   399 0000009F 08C0                     or  al, al
   400 000000A1 0F841B00                 je .cputs3
   401 000000A5 8B5E04                   mov bx, [bp+4]
   402 000000A8 8A07                     mov al, [bx]
   403 000000AA B400                     mov ah, 0
   404 000000AC 8846FE                   mov [bp-2], al
   405 000000AF 8A46FE                   mov al, byte [bp-2]
   406 000000B2 B400                     mov ah, 0
   407 000000B4 50                       push ax
   408 000000B5 E8C3FF                   call putch
   409 000000B8 83C402                   add  sp, 2
   410 000000BB FF4604                   inc  word[bp+4]
   411 000000BE EBD8                     jmp .cputs2
   412                                  .cputs3:
   413                                  
   414                                  ;-79 int mkneg(int n)   { n; __asm {neg ax} }
   415 000000C0 C9                       LEAVE
   416 000000C1 C3                       ret
   417                                  ENDP
   418                                  
   419                                  mkneg: PROC
   420                                  ;Function : mkneg, Number of local variables: 1
   421                                  ;   # type sign width addr used name   list of local variables
   422                                  ;  200 var sign word    79 NULL n = bp+4;
   423 000000C2 C8000000                 ENTER  0,0
   424 000000C6 8B4604                   mov ax, [bp+4]
   425 000000C9 F7D8                    neg ax
   426                                  
   427                                  ;-80 
   428                                  
   429                                  
   430                                  ;-81 int DosInt() { 
   431 000000CB C9                       LEAVE
   432 000000CC C3                       ret
   433                                  ENDP
   434                                  
   435                                  DosInt: PROC
   436                                  
   437                                  ;-82     __emit__(0xCD,0x21);//inth 0x21; 
   438                                  
   439 000000CD CD21                     db 205,33
   440                                  
   441                                  ;-83     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   442                                  
   443 000000CF 7304                     db 115,4
   444                                  
   445                                  ;-84     DOS_ERR++;
   446                                  
   447 000000D1 FF06[6E00]               inc  word[DOS_ERR]
   448                                  
   449                                  ;-85 }
   450                                  
   451                                  
   452                                  ;-86 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   453                                  
   454 000000D5 C3                       ret
   455                                  ENDP
   456                                  
   457                                  openR: PROC
   458                                  ;Function : openR, Number of local variables: 1
   459                                  ;   # type sign width addr used name   list of local variables
   460                                  ;  200 ptr sign byte    86 NULL s = bp+4;
   461 000000D6 C8000000                 ENTER  0,0
   462 000000DA 8B5604                   mov  dx, [bp+4]
   463 000000DD B8023D                   mov  ax, 15618
   464 000000E0 E8EAFF                   call DosInt
   465                                  
   466                                  ;-87 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   467 000000E3 C9                       LEAVE
   468 000000E4 C3                       ret
   469                                  ENDP
   470                                  
   471                                  creatR: PROC
   472                                  ;Function : creatR, Number of local variables: 1
   473                                  ;   # type sign width addr used name   list of local variables
   474                                  ;  200 ptr sign byte    87 NULL s = bp+4;
   475 000000E5 C8000000                 ENTER  0,0
   476 000000E9 8B5604                   mov  dx, [bp+4]
   477 000000EC B90000                   mov  cx, 0
   478 000000EF B8003C                   mov  ax, 15360
   479 000000F2 E8D8FF                   call DosInt
   480                                  
   481                                  ;-88 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   482 000000F5 C9                       LEAVE
   483 000000F6 C3                       ret
   484                                  ENDP
   485                                  
   486                                  fcloseR: PROC
   487                                  ;Function : fcloseR, Number of local variables: 1
   488                                  ;   # type sign width addr used name   list of local variables
   489                                  ;  200 var sign word    88 NULL fd = bp+4;
   490 000000F7 C8000000                 ENTER  0,0
   491 000000FB 8B5E04                   mov  bx, [bp+4]
   492 000000FE B8003E                   mov  ax, 15872
   493 00000101 E8C9FF                   call DosInt
   494                                  
   495                                  ;-89 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   496 00000104 C9                       LEAVE
   497 00000105 C3                       ret
   498                                  ENDP
   499                                  
   500                                  exitR: PROC
   501                                  ;Function : exitR, Number of local variables: 1
   502                                  ;   # type sign width addr used name   list of local variables
   503                                  ;  200 var sign byte    89 NULL c = bp+4;
   504 00000106 C8000000                 ENTER  0,0
   505 0000010A B44C                     mov  ah, 76
   506 0000010C 8A4604                   mov  al, [bp+4]
   507 0000010F E8BBFF                   call DosInt
   508                                  
   509                                  ;-90 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   510 00000112 C9                       LEAVE
   511 00000113 C3                       ret
   512                                  ENDP
   513                                  
   514                                  readRL: PROC
   515                                  ;Function : readRL, Number of local variables: 3
   516                                  ;   # type sign width addr used name   list of local variables
   517                                  ;  200 ptr sign byte    90 NULL s = bp+4
   518                                  ;  201 var sign word    90 NULL fd = bp+6
   519                                  ;  202 var sign word    90 NULL len = bp+8;
   520 00000114 C8000000                 ENTER  0,0
   521 00000118 8B5604                   mov  dx, [bp+4]
   522 0000011B 8B4E08                   mov  cx, [bp+8]
   523 0000011E 8B5E06                   mov  bx, [bp+6]
   524 00000121 B8003F                   mov  ax, 16128
   525 00000124 E8A6FF                   call DosInt
   526                                  
   527                                  ;-91 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   528 00000127 C9                       LEAVE
   529 00000128 C3                       ret
   530                                  ENDP
   531                                  
   532                                  fputcR: PROC
   533                                  ;Function : fputcR, Number of local variables: 2
   534                                  ;   # type sign width addr used name   list of local variables
   535                                  ;  200 ptr sign byte    91 NULL n = bp+4
   536                                  ;  201 var sign word    91 NULL fd = bp+6;
   537 00000129 C8000000                 ENTER  0,0
   538 0000012D 8D5604                  lea dx, [bp+4]
   539                                  
   540                                  ;-92   cx=1; bx=fd; ax=0x4000; DosInt(); }
   541                                  
   542 00000130 B90100                   mov  cx, 1
   543 00000133 8B5E06                   mov  bx, [bp+6]
   544 00000136 B80040                   mov  ax, 16384
   545 00000139 E891FF                   call DosInt
   546                                  
   547                                  ;-93 
   548                                  
   549                                  
   550                                  ;-94 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   551 0000013C C9                       LEAVE
   552 0000013D C3                       ret
   553                                  ENDP
   554                                  
   555                                  strlen: PROC
   556                                  ;Function : strlen, Number of local variables: 2
   557                                  ;   # type sign width addr used name   list of local variables
   558                                  ;  200 ptr sign byte    94 NULL s = bp+4
   559                                  ;  201 var sign word    94 NULL c = bp-2;
   560 0000013E C8020000                 ENTER  2,0
   561 00000142 B80000                   mov ax, 0
   562 00000145 8946FE                   mov [bp-2], ax
   563                                  .strlen4:
   564 00000148 8B5E04                   mov bx, [bp+4]
   565 0000014B 8A07                     mov al, [bx]
   566 0000014D B400                     mov ah, 0
   567 0000014F 83F800                   cmp ax, 0
   568 00000152 0F840800                 je  .strlen5
   569 00000156 FF4604                   inc  word[bp+4]
   570 00000159 FF46FE                   inc  word[bp-2]
   571 0000015C EBEA                     jmp .strlen4
   572                                  .strlen5:
   573 0000015E 8B46FE                   mov ax, [bp-2]
   574 00000161 E90000                   jmp .retnstrlen
   575                                  
   576                                  ;-95 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   577                                  
   578 00000164 C9                       .retnstrlen: LEAVE
   579 00000165 C3                       ret
   580                                  ENDP
   581                                  
   582                                  strcpy: PROC
   583                                  ;Function : strcpy, Number of local variables: 2
   584                                  ;   # type sign width addr used name   list of local variables
   585                                  ;  200 ptr sign byte    95 NULL s = bp+4
   586                                  ;  201 ptr sign byte    95 NULL t = bp+6;
   587 00000166 C8000000                 ENTER  0,0
   588                                  .strcpy6:
   589 0000016A 8B5E06                   mov bx, [bp+6]
   590 0000016D 8A07                     mov al, [bx]
   591 0000016F B400                     mov ah, 0
   592 00000171 8B5E04                   mov  bx, [bp+4]
   593 00000174 8807                     mov  [bx], al
   594 00000176 FF4604                   inc  word[bp+4]
   595 00000179 FF4606                   inc  word[bp+6]
   596 0000017C 8B5E06                   mov bx, [bp+6]
   597 0000017F 8A07                     mov al, [bx]
   598 00000181 B400                     mov ah, 0
   599 00000183 83F800                   cmp ax, 0
   600 00000186 0F840200                 je  .strcpy7
   601 0000018A EBDE                     jmp .strcpy6
   602                                  .strcpy7:
   603 0000018C B80000                   mov ax, 0
   604 0000018F 8B5E04                   mov  bx, [bp+4]
   605 00000192 8807                     mov  [bx], al
   606                                  
   607                                  ;-96 int eqstr(char *p, char *q) { while(*p) {
   608 00000194 C9                       LEAVE
   609 00000195 C3                       ret
   610                                  ENDP
   611                                  
   612                                  eqstr: PROC
   613                                  ;Function : eqstr, Number of local variables: 2
   614                                  ;   # type sign width addr used name   list of local variables
   615                                  ;  200 ptr sign byte    96 NULL p = bp+4
   616                                  ;  201 ptr sign byte    96 NULL q = bp+6;
   617 00000196 C8000000                 ENTER  0,0
   618                                  .eqstr8:
   619 0000019A 8B5E04                   mov bx, [bp+4]
   620 0000019D 8A07                     mov al, [bx]
   621 0000019F B400                     mov ah, 0
   622 000001A1 08C0                     or  al, al
   623 000001A3 0F842000                 je .eqstr9
   624                                  
   625                                  ;-97     if (*p != *q) return 0; p++; q++; }
   626                                  
   627 000001A7 8B5E04                   mov bx, [bp+4]
   628 000001AA 8A07                     mov al, [bx]
   629 000001AC B400                     mov ah, 0
   630 000001AE 8B5E06                   mov bx, [bp+6]
   631 000001B1 3A07                     cmp al, [bx]
   632 000001B3 B400                     mov ah, 0
   633 000001B5 0F840600                 je  .eqstr10
   634 000001B9 B80000                   mov ax, 0
   635 000001BC E92100                   jmp .retneqstr
   636                                  .eqstr10:
   637 000001BF FF4604                   inc  word[bp+4]
   638 000001C2 FF4606                   inc  word[bp+6]
   639                                  
   640                                  ;-98     if(*q) return 0; return 1; }
   641                                  
   642 000001C5 EBD3                     jmp .eqstr8
   643                                  .eqstr9:
   644 000001C7 8B5E06                   mov bx, [bp+6]
   645 000001CA 8A07                     mov al, [bx]
   646 000001CC B400                     mov ah, 0
   647 000001CE 08C0                     or  al, al
   648 000001D0 0F840600                 je .eqstr11
   649 000001D4 B80000                   mov ax, 0
   650 000001D7 E90600                   jmp .retneqstr
   651                                  .eqstr11:
   652 000001DA B80100                   mov ax, 1
   653 000001DD E90000                   jmp .retneqstr
   654                                  
   655                                  ;-99 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   656                                  
   657 000001E0 C9                       .retneqstr: LEAVE
   658 000001E1 C3                       ret
   659                                  ENDP
   660                                  
   661                                  instr1: PROC
   662                                  ;Function : instr1, Number of local variables: 2
   663                                  ;   # type sign width addr used name   list of local variables
   664                                  ;  200 ptr sign byte    99 NULL s = bp+4
   665                                  ;  201 var sign byte    99 NULL c = bp+6;
   666 000001E2 C8000000                 ENTER  0,0
   667                                  .instr112:
   668 000001E6 8B5E04                   mov bx, [bp+4]
   669 000001E9 8A07                     mov al, [bx]
   670 000001EB B400                     mov ah, 0
   671 000001ED 08C0                     or  al, al
   672 000001EF 0F841900                 je .instr113
   673 000001F3 8B5E04                   mov bx, [bp+4]
   674 000001F6 8A07                     mov al, [bx]
   675 000001F8 B400                     mov ah, 0
   676 000001FA 3A4606                   cmp al, [bp+6]
   677 000001FD 0F850600                 jne .instr114
   678 00000201 B80100                   mov ax, 1
   679 00000204 E90B00                   jmp .retninstr1
   680                                  .instr114:
   681 00000207 FF4604                   inc  word[bp+4]
   682 0000020A EBDA                     jmp .instr112
   683                                  .instr113:
   684 0000020C B80000                   mov ax, 0
   685 0000020F E90000                   jmp .retninstr1
   686                                  
   687                                  ;-100 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   688                                  
   689 00000212 C9                       .retninstr1: LEAVE
   690 00000213 C3                       ret
   691                                  ENDP
   692                                  
   693                                  strcat1: PROC
   694                                  ;Function : strcat1, Number of local variables: 2
   695                                  ;   # type sign width addr used name   list of local variables
   696                                  ;  200 ptr sign byte   100 NULL s = bp+4
   697                                  ;  201 ptr sign byte   100 NULL t = bp+6;
   698 00000214 C8000000                 ENTER  0,0
   699                                  .strcat115:
   700 00000218 8B5E04                   mov bx, [bp+4]
   701 0000021B 8A07                     mov al, [bx]
   702 0000021D B400                     mov ah, 0
   703 0000021F 83F800                   cmp ax, 0
   704 00000222 0F840500                 je  .strcat116
   705 00000226 FF4604                   inc  word[bp+4]
   706 00000229 EBED                     jmp .strcat115
   707                                  .strcat116:
   708 0000022B FF7606                   push word [bp+6]
   709 0000022E FF7604                   push word [bp+4]
   710 00000231 E832FF                   call strcpy
   711 00000234 83C404                   add  sp, 4
   712                                  
   713                                  ;-101 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   714 00000237 C9                       LEAVE
   715 00000238 C3                       ret
   716                                  ENDP
   717                                  
   718                                  toupper: PROC
   719                                  ;Function : toupper, Number of local variables: 1
   720                                  ;   # type sign width addr used name   list of local variables
   721                                  ;  200 ptr sign byte   101 NULL s = bp+4;
   722 00000239 C8000000                 ENTER  0,0
   723                                  .toupper17:
   724 0000023D 8B5E04                   mov bx, [bp+4]
   725 00000240 8A07                     mov al, [bx]
   726 00000242 B400                     mov ah, 0
   727 00000244 08C0                     or  al, al
   728 00000246 0F843000                 je .toupper18
   729 0000024A 8B5E04                   mov bx, [bp+4]
   730 0000024D 8A07                     mov al, [bx]
   731 0000024F B400                     mov ah, 0
   732 00000251 83F861                   cmp ax, 97 ;unsigned : 1
   733 00000254 0F8C1D00                 jl  .toupper19
   734 00000258 8B5E04                   mov bx, [bp+4]
   735 0000025B 8A07                     mov al, [bx]
   736 0000025D B400                     mov ah, 0
   737 0000025F 83F87A                   cmp ax, 122
   738 00000262 0F8F0F00                 jg  .toupper20
   739 00000266 8B5E04                   mov bx, [bp+4]
   740 00000269 8A07                     mov al, [bx]
   741 0000026B B400                     mov ah, 0
   742 0000026D 83E820                   sub ax, 32
   743 00000270 8B5E04                   mov  bx, [bp+4]
   744 00000273 8807                     mov  [bx], al
   745                                  .toupper20:
   746                                  .toupper19:
   747 00000275 FF4604                   inc  word[bp+4]
   748 00000278 EBC3                     jmp .toupper17
   749                                  .toupper18:
   750                                  
   751                                  ;-102 
   752                                  
   753                                  
   754                                  ;-103 int digit(char c){ 
   755 0000027A C9                       LEAVE
   756 0000027B C3                       ret
   757                                  ENDP
   758                                  
   759                                  digit: PROC
   760                                  
   761                                  ;-104     if(c<'0') return 0; 
   762                                  
   763                                  ;Function : digit, Number of local variables: 1
   764                                  ;   # type sign width addr used name   list of local variables
   765                                  ;  200 var sign byte   103 NULL c = bp+4;
   766 0000027C C8000000                 ENTER  0,0
   767 00000280 8A4604                   mov al, [bp+4]
   768 00000283 3C30                     cmp al, 48
   769 00000285 0F8D0600                 jge .digit21
   770 00000289 B80000                   mov ax, 0
   771 0000028C E91500                   jmp .retndigit
   772                                  
   773                                  ;-105     if(c>'9') return 0; 
   774                                  
   775                                  .digit21:
   776 0000028F 8A4604                   mov al, [bp+4]
   777 00000292 3C39                     cmp al, 57
   778 00000294 0F8E0600                 jle .digit22
   779 00000298 B80000                   mov ax, 0
   780 0000029B E90600                   jmp .retndigit
   781                                  
   782                                  ;-106     return 1; 
   783                                  
   784                                  .digit22:
   785 0000029E B80100                   mov ax, 1
   786 000002A1 E90000                   jmp .retndigit
   787                                  
   788                                  ;-107 }
   789                                  
   790                                  
   791                                  ;-108 int letter(char c) { 
   792                                  
   793 000002A4 C9                       .retndigit: LEAVE
   794 000002A5 C3                       ret
   795                                  ENDP
   796                                  
   797                                  letter: PROC
   798                                  
   799                                  ;-109     if (c=='_') return 1;
   800                                  
   801                                  ;Function : letter, Number of local variables: 1
   802                                  ;   # type sign width addr used name   list of local variables
   803                                  ;  200 var sign byte   108 NULL c = bp+4;
   804 000002A6 C8000000                 ENTER  0,0
   805 000002AA 8A4604                   mov al, [bp+4]
   806 000002AD 3C5F                     cmp al, 95
   807 000002AF 0F850600                 jne .letter23
   808 000002B3 B80100                   mov ax, 1
   809 000002B6 E96900                   jmp .retnletter
   810                                  
   811                                  ;-110     if (c=='.') return 1;
   812                                  
   813                                  .letter23:
   814 000002B9 8A4604                   mov al, [bp+4]
   815 000002BC 3C2E                     cmp al, 46
   816 000002BE 0F850600                 jne .letter24
   817 000002C2 B80100                   mov ax, 1
   818 000002C5 E95A00                   jmp .retnletter
   819                                  
   820                                  ;-111     if (c=='?') return 1;
   821                                  
   822                                  .letter24:
   823 000002C8 8A4604                   mov al, [bp+4]
   824 000002CB 3C3F                     cmp al, 63
   825 000002CD 0F850600                 jne .letter25
   826 000002D1 B80100                   mov ax, 1
   827 000002D4 E94B00                   jmp .retnletter
   828                                  
   829                                  ;-112     if (c=='$') return 1;
   830                                  
   831                                  .letter25:
   832 000002D7 8A4604                   mov al, [bp+4]
   833 000002DA 3C24                     cmp al, 36
   834 000002DC 0F850600                 jne .letter26
   835 000002E0 B80100                   mov ax, 1
   836 000002E3 E93C00                   jmp .retnletter
   837                                  
   838                                  ;-113     if (c> 'z') return 0; 
   839                                  
   840                                  .letter26:
   841 000002E6 8A4604                   mov al, [bp+4]
   842 000002E9 3C7A                     cmp al, 122
   843 000002EB 0F8E0600                 jle .letter27
   844 000002EF B80000                   mov ax, 0
   845 000002F2 E92D00                   jmp .retnletter
   846                                  
   847                                  ;-114     if (c< '@') return 0;// at included
   848                                  
   849                                  .letter27:
   850 000002F5 8A4604                   mov al, [bp+4]
   851 000002F8 3C40                     cmp al, 64
   852 000002FA 0F8D0600                 jge .letter28
   853 000002FE B80000                   mov ax, 0
   854 00000301 E91E00                   jmp .retnletter
   855                                  
   856                                  ;-115     if (c> 'Z') { if (c< 'a') return 0; }  
   857                                  
   858                                  .letter28:
   859 00000304 8A4604                   mov al, [bp+4]
   860 00000307 3C5A                     cmp al, 90
   861 00000309 0F8E0F00                 jle .letter29
   862 0000030D 8A4604                   mov al, [bp+4]
   863 00000310 3C61                     cmp al, 97
   864 00000312 0F8D0600                 jge .letter30
   865 00000316 B80000                   mov ax, 0
   866 00000319 E90600                   jmp .retnletter
   867                                  .letter30:
   868                                  
   869                                  ;-116     return 1; 
   870                                  
   871                                  .letter29:
   872 0000031C B80100                   mov ax, 1
   873 0000031F E90000                   jmp .retnletter
   874                                  
   875                                  ;-117 }    
   876                                  
   877                                  
   878                                  ;-118 int alnum(char c) {
   879                                  
   880 00000322 C9                       .retnletter: LEAVE
   881 00000323 C3                       ret
   882                                  ENDP
   883                                  
   884                                  alnum: PROC
   885                                  
   886                                  ;-119   if (digit (c)) return 1;
   887                                  
   888                                  ;Function : alnum, Number of local variables: 1
   889                                  ;   # type sign width addr used name   list of local variables
   890                                  ;  200 var sign byte   118 NULL c = bp+4;
   891 00000324 C8000000                 ENTER  0,0
   892 00000328 8A4604                   mov al, byte [bp+4]
   893 0000032B B400                     mov ah, 0
   894 0000032D 50                       push ax
   895 0000032E E84BFF                   call digit
   896 00000331 83C402                   add  sp, 2
   897 00000334 08C0                     or  al, al
   898 00000336 0F840600                 je .alnum31
   899 0000033A B80100                   mov ax, 1
   900 0000033D E91E00                   jmp .retnalnum
   901                                  
   902                                  ;-120   if (letter(c)) return 1;
   903                                  
   904                                  .alnum31:
   905 00000340 8A4604                   mov al, byte [bp+4]
   906 00000343 B400                     mov ah, 0
   907 00000345 50                       push ax
   908 00000346 E85DFF                   call letter
   909 00000349 83C402                   add  sp, 2
   910 0000034C 08C0                     or  al, al
   911 0000034E 0F840600                 je .alnum32
   912 00000352 B80100                   mov ax, 1
   913 00000355 E90600                   jmp .retnalnum
   914                                  
   915                                  ;-121   return 0;
   916                                  
   917                                  .alnum32:
   918 00000358 B80000                   mov ax, 0
   919 0000035B E90000                   jmp .retnalnum
   920                                  
   921                                  ;-122 }       
   922                                  
   923                                  
   924                                  ;-123 int a(unsigned int i) {  printName(i);}//address
   925                                  
   926 0000035E C9                       .retnalnum: LEAVE
   927 0000035F C3                       ret
   928                                  ENDP
   929                                  
   930                                  a: PROC
   931                                  ;Function : a, Number of local variables: 1
   932                                  ;   # type sign width addr used name   list of local variables
   933                                  ;  200 var unsg word   123 NULL i = bp+4;
   934 00000360 C8000000                 ENTER  0,0
   935 00000364 FF7604                   push word [bp+4]
   936 00000367 E88D05                   call printName
   937 0000036A 83C402                   add  sp, 2
   938                                  
   939                                  ;-124 int v(unsigned int i) {//value 
   940 0000036D C9                       LEAVE
   941 0000036E C3                       ret
   942                                  ENDP
   943                                  
   944                                  v: PROC
   945                                  
   946                                  ;-125     if (i < LSTART) prc('['); 
   947                                  
   948                                  ;Function : v, Number of local variables: 1
   949                                  ;   # type sign width addr used name   list of local variables
   950                                  ;  200 var unsg word   124 NULL i = bp+4;
   951 0000036F C8000000                 ENTER  0,0
   952 00000373 8B4604                   mov ax, [bp+4]
   953 00000376 3DC800                   cmp ax, 200
   954 00000379 0F8D0800                 jge .v33
   955 0000037D 6A5B                     push 91
   956 0000037F E80241                   call prc
   957 00000382 83C402                   add  sp, 2
   958                                  
   959                                  ;-126     printName(i);
   960                                  
   961                                  .v33:
   962 00000385 FF7604                   push word [bp+4]
   963 00000388 E86C05                   call printName
   964 0000038B 83C402                   add  sp, 2
   965                                  
   966                                  ;-127     if (i < LSTART) prc(']');   
   967                                  
   968 0000038E 8B4604                   mov ax, [bp+4]
   969 00000391 3DC800                   cmp ax, 200
   970 00000394 0F8D0800                 jge .v34
   971 00000398 6A5D                     push 93
   972 0000039A E8E740                   call prc
   973 0000039D 83C402                   add  sp, 2
   974                                  
   975                                  ;-128 }
   976                                  
   977                                  .v34:
   978                                  
   979                                  ;-129 int checknamelen() { int i;    i=strlen(symbol);
   980 000003A0 C9                       LEAVE
   981 000003A1 C3                       ret
   982                                  ENDP
   983                                  
   984                                  checknamelen: PROC
   985                                  ;Function : checknamelen, Number of local variables: 1
   986                                  ;   # type sign width addr used name   list of local variables
   987                                  ;  200 var sign word   129 NULL i = bp-2;
   988 000003A2 C8020000                 ENTER  2,0
   989 000003A6 8D062B81                 lea  ax, [symbol]
   990 000003AA 50                       push ax
   991 000003AB E890FD                   call strlen
   992 000003AE 83C402                   add  sp, 2
   993 000003B1 8946FE                   mov [bp-2], ax
   994                                  
   995                                  ;-130   if (i > IDLENMAX) error1("Item name is too long in characters)");
   996                                  
   997 000003B4 8B46FE                   mov ax, [bp-2]
   998 000003B7 83F80F                   cmp ax, 15
   999 000003BA 0F8E0900                 jle .checknamelen35
  1000 000003BE 68[C903]                 push checknamelen_0
  1001 000003C1 E84644                   call error1
  1002 000003C4 83C402                   add  sp, 2
  1003                                  
  1004                                  ;-131 }
  1005                                  
  1006                                  .checknamelen35:
  1007                                  
  1008                                  ;-132 char doglobName[IDLENMAX];
  1009 000003C7 C9                       LEAVE
  1010 000003C8 C3                       ret
  1011 000003C9 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1012 000003D2 20697320746F6F206C-
  1013 000003DB 6F6E6720696E206368-
  1014 000003E4 617261637465727329-
  1015 000003ED 00                 
  1016                                  ENDP
  1017                                  section .bss
  1018                                  absolute 53391
  1019 0000D08F <res 0000000F>          doglobName resb 15
  1020                                  section .text
  1021                                  
  1022                                  ;-133 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1023                                  
  1024                                  
  1025                                  doglob: PROC
  1026                                  ;Function : doglob, Number of local variables: 3
  1027                                  ;   # type sign width addr used name   list of local variables
  1028                                  ;  200 var sign word   133 NULL i = bp-2
  1029                                  ;  201 var sign word   133 NULL j = bp-4
  1030                                  ;  202 var sign word   133 NULL isstrarr = bp-6;
  1031 000003EE C8060000                 ENTER  6,0
  1032 000003F2 B80000                   mov ax, 0
  1033 000003F5 8946FA                   mov [bp-6], ax
  1034                                  
  1035                                  ;-134   if (GTop >= LSTART) error1("Global table full");
  1036                                  
  1037 000003F8 A1[2A00]                 mov ax, [GTop]
  1038 000003FB 3DC800                   cmp ax, 200 ;unsigned : 1
  1039 000003FE 0F8C0900                 jl  .doglob36
  1040 00000402 68[4307]                 push doglob_0
  1041 00000405 E80244                   call error1
  1042 00000408 83C402                   add  sp, 2
  1043                                  
  1044                                  ;-135   if (iswidth == 0) error1("no VOID as var type");
  1045                                  
  1046                                  .doglob36:
  1047 0000040B A0[3800]                 mov al, [iswidth]
  1048 0000040E 3C00                     cmp al, 0
  1049 00000410 0F850900                 jne .doglob37
  1050 00000414 68[5507]                 push doglob_1
  1051 00000417 E8F043                   call error1
  1052 0000041A 83C402                   add  sp, 2
  1053                                  
  1054                                  ;-136   checknamelen();
  1055                                  
  1056                                  .doglob37:
  1057 0000041D E882FF                   call checknamelen
  1058                                  
  1059                                  ;-137   if (checkName() != 0) error1("Variable already defined");
  1060                                  
  1061 00000420 E88305                   call checkName
  1062 00000423 3C00                     cmp al, 0
  1063 00000425 0F840900                 je  .doglob38
  1064 00000429 68[6907]                 push doglob_2
  1065 0000042C E8DB43                   call error1
  1066 0000042F 83C402                   add  sp, 2
  1067                                  
  1068                                  ;-138   if (istoken('[')) { istype='&';
  1069                                  
  1070                                  .doglob38:
  1071 00000432 6A5B                     push 91
  1072 00000434 E87F3F                   call istoken
  1073 00000437 83C402                   add  sp, 2
  1074 0000043A 08C0                     or  al, al
  1075 0000043C 0F84E201                 je .doglob39
  1076 00000440 B82600                   mov ax, 38
  1077 00000443 A2[3200]                 mov byte [istype], al
  1078                                  
  1079                                  ;-139     if (istoken(T_CONST)) {
  1080                                  
  1081 00000446 680101                   push 257
  1082 00000449 E86A3F                   call istoken
  1083 0000044C 83C402                   add  sp, 2
  1084 0000044F 08C0                     or  al, al
  1085 00000451 0F84C200                 je .doglob40
  1086                                  
  1087                                  ;-140       prs("\nsection .bss\nabsolute ");
  1088                                  
  1089 00000455 68[8207]                 push doglob_3
  1090 00000458 E89040                   call prs
  1091 0000045B 83C402                   add  sp, 2
  1092                                  
  1093                                  ;-141       prunsign1(orgData);
  1094                                  
  1095 0000045E FF36[1000]               push word [orgData]
  1096 00000462 E8DB41                   call prunsign1
  1097 00000465 83C402                   add  sp, 2
  1098                                  
  1099                                  ;-142       prs("\n"); prs(symbol); 
  1100                                  
  1101 00000468 68[9C07]                 push doglob_4
  1102 0000046B E87D40                   call prs
  1103 0000046E 83C402                   add  sp, 2
  1104 00000471 8D062B81                 lea  ax, [symbol]
  1105 00000475 50                       push ax
  1106 00000476 E87240                   call prs
  1107 00000479 83C402                   add  sp, 2
  1108                                  
  1109                                  ;-143       if (iswidth==1) prs(" resb "); 
  1110                                  
  1111 0000047C A0[3800]                 mov al, [iswidth]
  1112 0000047F 3C01                     cmp al, 1
  1113 00000481 0F850900                 jne .doglob41
  1114 00000485 68[9F07]                 push doglob_5
  1115 00000488 E86040                   call prs
  1116 0000048B 83C402                   add  sp, 2
  1117                                  
  1118                                  ;-144       if (iswidth==2) prs(" resw ");
  1119                                  
  1120                                  .doglob41:
  1121 0000048E A0[3800]                 mov al, [iswidth]
  1122 00000491 3C02                     cmp al, 2
  1123 00000493 0F850900                 jne .doglob42
  1124 00000497 68[A607]                 push doglob_6
  1125 0000049A E84E40                   call prs
  1126 0000049D 83C402                   add  sp, 2
  1127                                  
  1128                                  ;-145       if (iswidth==4) prs(" resd ");
  1129                                  
  1130                                  .doglob42:
  1131 000004A0 A0[3800]                 mov al, [iswidth]
  1132 000004A3 3C04                     cmp al, 4
  1133 000004A5 0F850900                 jne .doglob43
  1134 000004A9 68[AD07]                 push doglob_7
  1135 000004AC E83C40                   call prs
  1136 000004AF 83C402                   add  sp, 2
  1137                                  
  1138                                  ;-146       prunsign1(lexval); 
  1139                                  
  1140                                  .doglob43:
  1141 000004B2 FF36[2E00]               push word [lexval]
  1142 000004B6 E88741                   call prunsign1
  1143 000004B9 83C402                   add  sp, 2
  1144                                  
  1145                                  ;-147       prs("\nsection .text");
  1146                                  
  1147 000004BC 68[B407]                 push doglob_8
  1148 000004BF E82940                   call prs
  1149 000004C2 83C402                   add  sp, 2
  1150                                  
  1151                                  ;-148       orgData=orgData+lexval;
  1152                                  
  1153 000004C5 A1[1000]                 mov ax, [orgData]
  1154 000004C8 0306[2E00]               add ax, [lexval]
  1155 000004CC A3[1000]                 mov word [orgData], ax
  1156                                  
  1157                                  ;-149       if (iswidth==2) orgData=orgData+lexval;
  1158                                  
  1159 000004CF A0[3800]                 mov al, [iswidth]
  1160 000004D2 3C02                     cmp al, 2
  1161 000004D4 0F850A00                 jne .doglob44
  1162 000004D8 A1[1000]                 mov ax, [orgData]
  1163 000004DB 0306[2E00]               add ax, [lexval]
  1164 000004DF A3[1000]                 mov word [orgData], ax
  1165                                  
  1166                                  ;-150       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1167                                  
  1168                                  .doglob44:
  1169 000004E2 A0[3800]                 mov al, [iswidth]
  1170 000004E5 3C04                     cmp al, 4
  1171 000004E7 0F851400                 jne .doglob45
  1172 000004EB A1[2E00]                 mov ax, [lexval]
  1173 000004EE BB0300                   mov bx, 3
  1174 000004F1 F7E3                     mul bx
  1175 000004F3 8946FE                   mov [bp-2], ax
  1176 000004F6 A1[1000]                 mov ax, [orgData]
  1177 000004F9 0346FE                   add ax, [bp-2]
  1178 000004FC A3[1000]                 mov word [orgData], ax
  1179                                  
  1180                                  ;-151       GData[GTop]=lexval; expect(']');
  1181                                  
  1182                                  .doglob45:
  1183 000004FF A1[2E00]                 mov ax, [lexval]
  1184 00000502 8B1E[2A00]               mov bx, [GTop]
  1185 00000506 D1E3                     shl bx, 1
  1186 00000508 8987EB8A                 mov [GData+bx], ax
  1187 0000050C 6A5D                     push 93
  1188 0000050E E8C73E                   call expect
  1189 00000511 83C402                   add  sp, 2
  1190                                  
  1191                                  ;-152     }else { expect(']');
  1192                                  
  1193 00000514 E90801                   jmp .doglob46
  1194                                  .doglob40:
  1195 00000517 6A5D                     push 93
  1196 00000519 E8BC3E                   call expect
  1197 0000051C 83C402                   add  sp, 2
  1198                                  
  1199                                  ;-153       if (iswidth != 1) error1("Only ByteArray allowed");
  1200                                  
  1201 0000051F A0[3800]                 mov al, [iswidth]
  1202 00000522 3C01                     cmp al, 1
  1203 00000524 0F840900                 je  .doglob47
  1204 00000528 68[C407]                 push doglob_9
  1205 0000052B E8DC42                   call error1
  1206 0000052E 83C402                   add  sp, 2
  1207                                  
  1208                                  ;-154       prs("\n"); prs(symbol); prs(" db "); 
  1209                                  
  1210                                  .doglob47:
  1211 00000531 68[DB07]                 push doglob_10
  1212 00000534 E8B43F                   call prs
  1213 00000537 83C402                   add  sp, 2
  1214 0000053A 8D062B81                 lea  ax, [symbol]
  1215 0000053E 50                       push ax
  1216 0000053F E8A93F                   call prs
  1217 00000542 83C402                   add  sp, 2
  1218 00000545 68[DE07]                 push doglob_11
  1219 00000548 E8A03F                   call prs
  1220 0000054B 83C402                   add  sp, 2
  1221                                  
  1222                                  ;-155       isstrarr=1; strcpy(doglobName, symbol);
  1223                                  
  1224 0000054E B80100                   mov ax, 1
  1225 00000551 8946FA                   mov [bp-6], ax
  1226 00000554 8D062B81                 lea  ax, [symbol]
  1227 00000558 50                       push ax
  1228 00000559 8D068FD0                 lea  ax, [doglobName]
  1229 0000055D 50                       push ax
  1230 0000055E E805FC                   call strcpy
  1231 00000561 83C404                   add  sp, 4
  1232                                  
  1233                                  ;-156       expect('='); 
  1234                                  
  1235 00000564 6A3D                     push 61
  1236 00000566 E86F3E                   call expect
  1237 00000569 83C402                   add  sp, 2
  1238                                  
  1239                                  ;-157       if (istoken(T_STRING)) { 
  1240                                  
  1241 0000056C 680201                   push 258
  1242 0000056F E8443E                   call istoken
  1243 00000572 83C402                   add  sp, 2
  1244 00000575 08C0                     or  al, al
  1245 00000577 0F844200                 je .doglob48
  1246                                  
  1247                                  ;-158         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1248                                  
  1249 0000057B 6A22                     push 34
  1250 0000057D E8043F                   call prc
  1251 00000580 83C402                   add  sp, 2
  1252 00000583 8D062B81                 lea  ax, [symbol]
  1253 00000587 50                       push ax
  1254 00000588 E8243F                   call prscomment
  1255 0000058B 83C402                   add  sp, 2
  1256 0000058E 6A22                     push 34
  1257 00000590 E8F13E                   call prc
  1258 00000593 83C402                   add  sp, 2
  1259 00000596 68[E307]                 push doglob_12
  1260 00000599 E84F3F                   call prs
  1261 0000059C 83C402                   add  sp, 2
  1262                                  
  1263                                  ;-159         i=strlen(symbol); GData[GTop]=i; }
  1264                                  
  1265 0000059F 8D062B81                 lea  ax, [symbol]
  1266 000005A3 50                       push ax
  1267 000005A4 E897FB                   call strlen
  1268 000005A7 83C402                   add  sp, 2
  1269 000005AA 8946FE                   mov [bp-2], ax
  1270 000005AD 8B46FE                   mov ax, [bp-2]
  1271 000005B0 8B1E[2A00]               mov bx, [GTop]
  1272 000005B4 D1E3                     shl bx, 1
  1273 000005B6 8987EB8A                 mov [GData+bx], ax
  1274                                  
  1275                                  ;-160       else if (istoken('{' )) { i=0;
  1276                                  
  1277 000005BA E96200                   jmp .doglob49
  1278                                  .doglob48:
  1279 000005BD 6A7B                     push 123
  1280 000005BF E8F43D                   call istoken
  1281 000005C2 83C402                   add  sp, 2
  1282 000005C5 08C0                     or  al, al
  1283 000005C7 0F844B00                 je .doglob50
  1284 000005CB B80000                   mov ax, 0
  1285 000005CE 8946FE                   mov [bp-2], ax
  1286                                  
  1287                                  ;-161         do { if(i) prc(','); 
  1288                                  
  1289                                  .doglob51:
  1290 000005D1 8B46FE                   mov ax, [bp-2]
  1291 000005D4 08C0                     or  al, al
  1292 000005D6 0F840800                 je .doglob52
  1293 000005DA 6A2C                     push 44
  1294 000005DC E8A53E                   call prc
  1295 000005DF 83C402                   add  sp, 2
  1296                                  
  1297                                  ;-162           expect(T_CONST); prunsign1(lexval); i=1; }
  1298                                  
  1299                                  .doglob52:
  1300 000005E2 680101                   push 257
  1301 000005E5 E8F03D                   call expect
  1302 000005E8 83C402                   add  sp, 2
  1303 000005EB FF36[2E00]               push word [lexval]
  1304 000005EF E84E40                   call prunsign1
  1305 000005F2 83C402                   add  sp, 2
  1306 000005F5 B80100                   mov ax, 1
  1307 000005F8 8946FE                   mov [bp-2], ax
  1308                                  
  1309                                  ;-163         while (istoken(',')); expect('}'); }  
  1310                                  
  1311 000005FB 6A2C                     push 44
  1312 000005FD E8B63D                   call istoken
  1313 00000600 83C402                   add  sp, 2
  1314 00000603 08C0                     or  al, al
  1315 00000605 0F840200                 je .doglob53
  1316 00000609 EBC6                     jmp .doglob51
  1317                                  .doglob53:
  1318 0000060B 6A7D                     push 125
  1319 0000060D E8C83D                   call expect
  1320 00000610 83C402                   add  sp, 2
  1321                                  
  1322                                  ;-164       else error1("String or number array expected");
  1323                                  
  1324 00000613 E90900                   jmp .doglob54
  1325                                  .doglob50:
  1326 00000616 68[E607]                 push doglob_13
  1327 00000619 E8EE41                   call error1
  1328 0000061C 83C402                   add  sp, 2
  1329                                  
  1330                                  ;-165       }; 
  1331                                  
  1332                                  .doglob54:
  1333                                  .doglob49:
  1334                                  .doglob46:
  1335                                  
  1336                                  ;-166   }else { //expect('=');
  1337                                  
  1338 0000061F E99E00                   jmp .doglob55
  1339                                  .doglob39:
  1340                                  
  1341                                  ;-167     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1342                                  
  1343 00000622 68[0608]                 push doglob_14
  1344 00000625 E8C33E                   call prs
  1345 00000628 83C402                   add  sp, 2
  1346 0000062B 8D062B81                 lea  ax, [symbol]
  1347 0000062F 50                       push ax
  1348 00000630 E8B83E                   call prs
  1349 00000633 83C402                   add  sp, 2
  1350 00000636 A0[3200]                 mov al, [istype]
  1351 00000639 3C2A                     cmp al, 42
  1352 0000063B 0F850C00                 jne .doglob56
  1353 0000063F 68[0908]                 push doglob_15
  1354 00000642 E8A63E                   call prs
  1355 00000645 83C402                   add  sp, 2
  1356                                  
  1357                                  ;-168     else {
  1358                                  
  1359 00000648 E93300                   jmp .doglob57
  1360                                  .doglob56:
  1361                                  
  1362                                  ;-169       if      (iswidth==1) prs(" db ");
  1363                                  
  1364 0000064B A0[3800]                 mov al, [iswidth]
  1365 0000064E 3C01                     cmp al, 1
  1366 00000650 0F850C00                 jne .doglob58
  1367 00000654 68[0E08]                 push doglob_16
  1368 00000657 E8913E                   call prs
  1369 0000065A 83C402                   add  sp, 2
  1370                                  
  1371                                  ;-170       else if (iswidth==2) prs(" dw ");
  1372                                  
  1373 0000065D E91E00                   jmp .doglob59
  1374                                  .doglob58:
  1375 00000660 A0[3800]                 mov al, [iswidth]
  1376 00000663 3C02                     cmp al, 2
  1377 00000665 0F850C00                 jne .doglob60
  1378 00000669 68[1308]                 push doglob_17
  1379 0000066C E87C3E                   call prs
  1380 0000066F 83C402                   add  sp, 2
  1381                                  
  1382                                  ;-171       else                 prs(" dd ");
  1383                                  
  1384 00000672 E90900                   jmp .doglob61
  1385                                  .doglob60:
  1386 00000675 68[1808]                 push doglob_18
  1387 00000678 E8703E                   call prs
  1388 0000067B 83C402                   add  sp, 2
  1389                                  
  1390                                  ;-172     }
  1391                                  
  1392                                  .doglob61:
  1393                                  .doglob59:
  1394                                  
  1395                                  ;-173     if(istoken('-')) prc('-');
  1396                                  
  1397                                  .doglob57:
  1398 0000067E 6A2D                     push 45
  1399 00000680 E8333D                   call istoken
  1400 00000683 83C402                   add  sp, 2
  1401 00000686 08C0                     or  al, al
  1402 00000688 0F840800                 je .doglob62
  1403 0000068C 6A2D                     push 45
  1404 0000068E E8F33D                   call prc
  1405 00000691 83C402                   add  sp, 2
  1406                                  
  1407                                  ;-174     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1408                                  
  1409                                  .doglob62:
  1410 00000694 6A3D                     push 61
  1411 00000696 E81D3D                   call istoken
  1412 00000699 83C402                   add  sp, 2
  1413 0000069C 08C0                     or  al, al
  1414 0000069E 0F841600                 je .doglob63
  1415 000006A2 680101                   push 257
  1416 000006A5 E8303D                   call expect
  1417 000006A8 83C402                   add  sp, 2
  1418 000006AB FF36[2E00]               push word [lexval]
  1419 000006AF E88E3F                   call prunsign1
  1420 000006B2 83C402                   add  sp, 2
  1421                                  
  1422                                  ;-175     else prunsign1(0); }
  1423                                  
  1424 000006B5 E90800                   jmp .doglob64
  1425                                  .doglob63:
  1426 000006B8 6A00                     push 0
  1427 000006BA E8833F                   call prunsign1
  1428 000006BD 83C402                   add  sp, 2
  1429                                  .doglob64:
  1430                                  
  1431                                  ;-176   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1432                                  
  1433                                  .doglob55:
  1434 000006C0 A0[3500]                 mov al, [issign]
  1435 000006C3 8B1E[2A00]               mov bx, [GTop]
  1436 000006C7 8887E383                 mov [GSign+bx], al
  1437 000006CB A0[3800]                 mov al, [iswidth]
  1438 000006CE 8B1E[2A00]               mov bx, [GTop]
  1439 000006D2 88870F85                 mov [GWidth+bx], al
  1440 000006D6 A0[3200]                 mov al, [istype]
  1441 000006D9 8B1E[2A00]               mov bx, [GTop]
  1442 000006DD 8887B782                 mov [GType+bx], al
  1443                                  
  1444                                  ;-177   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1445                                  
  1446 000006E1 A1[6600]                 mov ax, [lineno]
  1447 000006E4 83E801                   sub ax, 1
  1448 000006E7 8B1E[2A00]               mov bx, [GTop]
  1449 000006EB D1E3                     shl bx, 1
  1450 000006ED 89873B86                 mov [GAdr+bx], ax
  1451 000006F1 B80000                   mov ax, 0
  1452 000006F4 8B1E[2A00]               mov bx, [GTop]
  1453 000006F8 D1E3                     shl bx, 1
  1454 000006FA 89879388                 mov [GUsed+bx], ax
  1455                                  
  1456                                  ;-178   pt=adrofname(GTop);
  1457                                  
  1458 000006FE FF36[2A00]               push word [GTop]
  1459 00000702 E8CF01                   call adrofname
  1460 00000705 83C402                   add  sp, 2
  1461 00000708 A3[6A00]                 mov word [pt], ax
  1462                                  
  1463                                  ;-179   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1464                                  
  1465 0000070B 8B46FA                   mov ax, [bp-6]
  1466 0000070E 08C0                     or  al, al
  1467 00000710 0F841200                 je .doglob65
  1468 00000714 8D068FD0                 lea  ax, [doglobName]
  1469 00000718 50                       push ax
  1470 00000719 FF36[6A00]               push word [pt]
  1471 0000071D E846FA                   call strcpy
  1472 00000720 83C404                   add  sp, 4
  1473 00000723 E90F00                   jmp .doglob66
  1474                                  .doglob65:
  1475 00000726 8D062B81                 lea  ax, [symbol]
  1476 0000072A 50                       push ax
  1477 0000072B FF36[6A00]               push word [pt]
  1478 0000072F E834FA                   call strcpy
  1479 00000732 83C404                   add  sp, 4
  1480                                  
  1481                                  ;-180   GTop++; expect(';'); }
  1482                                  
  1483                                  .doglob66:
  1484 00000735 FF06[2A00]               inc  word[GTop]
  1485 00000739 6A3B                     push 59
  1486 0000073B E89A3C                   call expect
  1487 0000073E 83C402                   add  sp, 2
  1488                                  
  1489                                  ;-181 
  1490                                  
  1491                                  
  1492                                  ;-182 int gettypes(int i) {int j; char c;
  1493 00000741 C9                       LEAVE
  1494 00000742 C3                       ret
  1495 00000743 476C6F62616C207461-     doglob_0 db "Global table full",0
  1496 0000074C 626C652066756C6C00 
  1497 00000755 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1498 0000075E 732076617220747970-
  1499 00000767 6500               
  1500 00000769 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1501 00000772 616C72656164792064-
  1502 0000077B 6566696E656400     
  1503 00000782 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1504 0000078B 202E6273735C6E6162-
  1505 00000794 736F6C7574652000   
  1506 0000079C 5C6E00                  doglob_4 db "\n",0
  1507 0000079F 20726573622000          doglob_5 db " resb ",0
  1508 000007A6 20726573772000          doglob_6 db " resw ",0
  1509 000007AD 20726573642000          doglob_7 db " resd ",0
  1510 000007B4 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1511 000007BD 202E7465787400     
  1512 000007C4 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1513 000007CD 417272617920616C6C-
  1514 000007D6 6F77656400         
  1515 000007DB 5C6E00                  doglob_10 db "\n",0
  1516 000007DE 2064622000              doglob_11 db " db ",0
  1517 000007E3 2C3000                  doglob_12 db ",0",0
  1518 000007E6 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1519 000007EF 206E756D6265722061-
  1520 000007F8 727261792065787065-
  1521 00000801 6374656400         
  1522 00000806 5C6E00                  doglob_14 db "\n",0
  1523 00000809 2064772000              doglob_15 db " dw ",0
  1524 0000080E 2064622000              doglob_16 db " db ",0
  1525 00000813 2064772000              doglob_17 db " dw ",0
  1526 00000818 2064642000              doglob_18 db " dd ",0
  1527                                  ENDP
  1528                                  
  1529                                  gettypes: PROC
  1530                                  
  1531                                  ;-183   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1532                                  
  1533                                  ;Function : gettypes, Number of local variables: 3
  1534                                  ;   # type sign width addr used name   list of local variables
  1535                                  ;  200 var sign word   182 NULL i = bp+4
  1536                                  ;  201 var sign word   182 NULL j = bp-2
  1537                                  ;  202 var sign byte   182 NULL c = bp-4;
  1538 0000081D C8040000                 ENTER  4,0
  1539 00000821 8B5E04                   mov bx, [bp+4]
  1540 00000824 8A87E383                 mov al, [GSign + bx]
  1541 00000828 8846FC                   mov [bp-4], al
  1542 0000082B 8A46FC                   mov al, [bp-4]
  1543 0000082E 3C53                     cmp al, 83
  1544 00000830 0F850900                 jne .gettypes67
  1545 00000834 B80100                   mov ax, 1
  1546 00000837 A3[3300]                 mov word [signi], ax
  1547 0000083A E90600                   jmp .gettypes68
  1548                                  .gettypes67:
  1549 0000083D B80000                   mov ax, 0
  1550 00000840 A3[3300]                 mov word [signi], ax
  1551                                  
  1552                                  ;-184   c=GWidth[i]; widthi=0;wi=0;
  1553                                  
  1554                                  .gettypes68:
  1555 00000843 8B5E04                   mov bx, [bp+4]
  1556 00000846 8A870F85                 mov al, [GWidth + bx]
  1557 0000084A 8846FC                   mov [bp-4], al
  1558 0000084D B80000                   mov ax, 0
  1559 00000850 A3[3600]                 mov word [widthi], ax
  1560 00000853 B80000                   mov ax, 0
  1561 00000856 A3[3900]                 mov word [wi], ax
  1562                                  
  1563                                  ;-185   if (c==1) {widthi=1;wi=1;}
  1564                                  
  1565 00000859 8A46FC                   mov al, [bp-4]
  1566 0000085C 3C01                     cmp al, 1
  1567 0000085E 0F850C00                 jne .gettypes69
  1568 00000862 B80100                   mov ax, 1
  1569 00000865 A3[3600]                 mov word [widthi], ax
  1570 00000868 B80100                   mov ax, 1
  1571 0000086B A3[3900]                 mov word [wi], ax
  1572                                  
  1573                                  ;-186   if (c==2) {widthi=2;wi=2;}
  1574                                  
  1575                                  .gettypes69:
  1576 0000086E 8A46FC                   mov al, [bp-4]
  1577 00000871 3C02                     cmp al, 2
  1578 00000873 0F850C00                 jne .gettypes70
  1579 00000877 B80200                   mov ax, 2
  1580 0000087A A3[3600]                 mov word [widthi], ax
  1581 0000087D B80200                   mov ax, 2
  1582 00000880 A3[3900]                 mov word [wi], ax
  1583                                  
  1584                                  ;-187   if (c==4) {widthi=4;wi=4;}
  1585                                  
  1586                                  .gettypes70:
  1587 00000883 8A46FC                   mov al, [bp-4]
  1588 00000886 3C04                     cmp al, 4
  1589 00000888 0F850C00                 jne .gettypes71
  1590 0000088C B80400                   mov ax, 4
  1591 0000088F A3[3600]                 mov word [widthi], ax
  1592 00000892 B80400                   mov ax, 4
  1593 00000895 A3[3900]                 mov word [wi], ax
  1594                                  
  1595                                  ;-188   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1596                                  
  1597                                  .gettypes71:
  1598 00000898 8B5E04                   mov bx, [bp+4]
  1599 0000089B 8A87B782                 mov al, [GType + bx]
  1600 0000089F 8846FC                   mov [bp-4], al
  1601 000008A2 B80000                   mov ax, 0
  1602 000008A5 A3[3000]                 mov word [typei], ax
  1603 000008A8 8A46FC                   mov al, [bp-4]
  1604 000008AB 3C2A                     cmp al, 42
  1605 000008AD 0F850C00                 jne .gettypes72
  1606 000008B1 B80100                   mov ax, 1
  1607 000008B4 A3[3000]                 mov word [typei], ax
  1608 000008B7 B80200                   mov ax, 2
  1609 000008BA A3[3900]                 mov word [wi], ax
  1610                                  
  1611                                  ;-189   if (c=='&')  typei=2;  
  1612                                  
  1613                                  .gettypes72:
  1614 000008BD 8A46FC                   mov al, [bp-4]
  1615 000008C0 3C26                     cmp al, 38
  1616 000008C2 0F850600                 jne .gettypes73
  1617 000008C6 B80200                   mov ax, 2
  1618 000008C9 A3[3000]                 mov word [typei], ax
  1619                                  
  1620                                  ;-190   return i; }  
  1621                                  
  1622                                  .gettypes73:
  1623 000008CC 8B4604                   mov ax, [bp+4]
  1624 000008CF E90000                   jmp .retngettypes
  1625                                  
  1626                                  ;-191 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1627                                  
  1628 000008D2 C9                       .retngettypes: LEAVE
  1629 000008D3 C3                       ret
  1630                                  ENDP
  1631                                  
  1632                                  adrofname: PROC
  1633                                  ;Function : adrofname, Number of local variables: 1
  1634                                  ;   # type sign width addr used name   list of local variables
  1635                                  ;  200 var unsg word   191 NULL i = bp+4;
  1636 000008D4 C8000000                 ENTER  0,0
  1637 000008D8 FF7604                   push word [bp+4]
  1638 000008DB 8D06438D                 lea  ax, [GNameField]
  1639 000008DF 50                       push ax
  1640 000008E0 E80500                   call adrF
  1641 000008E3 83C404                   add  sp, 4
  1642                                  
  1643                                  ;-192 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1644 000008E6 C9                       LEAVE
  1645 000008E7 C3                       ret
  1646                                  ENDP
  1647                                  
  1648                                  adrF: PROC
  1649                                  ;Function : adrF, Number of local variables: 2
  1650                                  ;   # type sign width addr used name   list of local variables
  1651                                  ;  200 ptr sign byte   192 NULL s = bp+4
  1652                                  ;  201 var unsg word   192 NULL i = bp+6;
  1653 000008E8 C8000000                 ENTER  0,0
  1654 000008EC 8B4606                   mov ax, [bp+6]
  1655 000008EF C1E004                   shl ax, 4
  1656                                  
  1657                                  ;-193   __asm{ add ax, [bp+4]  ; offset s } }
  1658                                  
  1659 000008F2 034604                   add ax, [bp+4]  ; offset s 
  1660                                  
  1661                                  ;-194 int printName(unsigned int i) {int j;
  1662 000008F5 C9                       LEAVE
  1663 000008F6 C3                       ret
  1664                                  ENDP
  1665                                  
  1666                                  printName: PROC
  1667                                  
  1668                                  ;-195   if (i < LSTART) { i=adrofname(i); prs(i); }
  1669                                  
  1670                                  ;Function : printName, Number of local variables: 2
  1671                                  ;   # type sign width addr used name   list of local variables
  1672                                  ;  200 var unsg word   194 NULL i = bp+4
  1673                                  ;  201 var sign word   194 NULL j = bp-2;
  1674 000008F7 C8020000                 ENTER  2,0
  1675 000008FB 8B4604                   mov ax, [bp+4]
  1676 000008FE 3DC800                   cmp ax, 200
  1677 00000901 0F8D1800                 jge .printName74
  1678 00000905 FF7604                   push word [bp+4]
  1679 00000908 E8C9FF                   call adrofname
  1680 0000090B 83C402                   add  sp, 2
  1681 0000090E 894604                   mov [bp+4], ax
  1682 00000911 FF7604                   push word [bp+4]
  1683 00000914 E8D43B                   call prs
  1684 00000917 83C402                   add  sp, 2
  1685                                  
  1686                                  ;-196   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1687                                  
  1688 0000091A E93800                   jmp .printName75
  1689                                  .printName74:
  1690 0000091D 68[5709]                 push printName_0
  1691 00000920 E8C83B                   call prs
  1692 00000923 83C402                   add  sp, 2
  1693 00000926 8B5E04                   mov bx, [bp+4]
  1694 00000929 D1E3                     shl bx, 1
  1695 0000092B 8B87EB8A                 mov ax, [GData + bx]
  1696 0000092F 8946FE                   mov [bp-2], ax
  1697 00000932 8B46FE                   mov ax, [bp-2]
  1698 00000935 83F800                   cmp ax, 0
  1699 00000938 0F8E0800                 jle .printName76
  1700 0000093C 6A2B                     push 43
  1701 0000093E E8433B                   call prc
  1702 00000941 83C402                   add  sp, 2
  1703                                  .printName76:
  1704 00000944 FF76FE                   push word [bp-2]
  1705 00000947 E8983C                   call pint1
  1706 0000094A 83C402                   add  sp, 2
  1707 0000094D 6A5D                     push 93
  1708 0000094F E8323B                   call prc
  1709 00000952 83C402                   add  sp, 2
  1710                                  
  1711                                  ;-197 }
  1712                                  
  1713                                  .printName75:
  1714                                  
  1715                                  ;-198 int searchname() { unsigned int i;
  1716 00000955 C9                       LEAVE
  1717 00000956 C3                       ret
  1718 00000957 5B627000                printName_0 db "[bp",0
  1719                                  ENDP
  1720                                  
  1721                                  searchname: PROC
  1722                                  
  1723                                  ;-199   i=checkName(); if (i == 0) error1("Variable unknown");
  1724                                  
  1725                                  ;Function : searchname, Number of local variables: 1
  1726                                  ;   # type sign width addr used name   list of local variables
  1727                                  ;  200 var unsg word   198 NULL i = bp-2;
  1728 0000095B C8020000                 ENTER  2,0
  1729 0000095F E84400                   call checkName
  1730 00000962 8946FE                   mov [bp-2], ax
  1731 00000965 8B46FE                   mov ax, [bp-2]
  1732 00000968 83F800                   cmp ax, 0
  1733 0000096B 0F850900                 jne .searchname77
  1734 0000096F 68[9509]                 push searchname_0
  1735 00000972 E8953E                   call error1
  1736 00000975 83C402                   add  sp, 2
  1737                                  
  1738                                  ;-200   GUsed[i]=GUsed[i] + 1; return i;
  1739                                  
  1740                                  .searchname77:
  1741 00000978 8B5EFE                   mov bx, [bp-2]
  1742 0000097B D1E3                     shl bx, 1
  1743 0000097D 8B879388                 mov ax, [GUsed + bx]
  1744 00000981 83C001                   add ax, 1
  1745 00000984 8B5EFE                   mov bx, [bp-2]
  1746 00000987 D1E3                     shl bx, 1
  1747 00000989 89879388                 mov [GUsed+bx], ax
  1748 0000098D 8B46FE                   mov ax, [bp-2]
  1749 00000990 E90000                   jmp .retnsearchname
  1750                                  
  1751                                  ;-201 }
  1752                                  
  1753                                  
  1754                                  ;-202 int checkName() { unsigned int i; unsigned int j;
  1755                                  
  1756 00000993 C9                       .retnsearchname: LEAVE
  1757 00000994 C3                       ret
  1758 00000995 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1759 0000099E 756E6B6E6F776E00   
  1760                                  ENDP
  1761                                  
  1762                                  checkName: PROC
  1763                                  
  1764                                  ;-203   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1765                                  
  1766                                  ;Function : checkName, Number of local variables: 2
  1767                                  ;   # type sign width addr used name   list of local variables
  1768                                  ;  200 var unsg word   202 NULL i = bp-2
  1769                                  ;  201 var unsg word   202 NULL j = bp-4;
  1770 000009A6 C8040000                 ENTER  4,0
  1771 000009AA B8C800                   mov ax, 200
  1772 000009AD 8946FE                   mov [bp-2], ax
  1773                                  .checkName78:
  1774 000009B0 8B46FE                   mov ax, [bp-2]
  1775 000009B3 3B06[2C00]               cmp ax, [LTop]
  1776 000009B7 0F8D2B00                 jge .checkName79
  1777 000009BB FF76FE                   push word [bp-2]
  1778 000009BE E813FF                   call adrofname
  1779 000009C1 83C402                   add  sp, 2
  1780 000009C4 8946FC                   mov [bp-4], ax
  1781 000009C7 FF76FC                   push word [bp-4]
  1782 000009CA 8D062B81                 lea  ax, [symbol]
  1783 000009CE 50                       push ax
  1784 000009CF E8C4F7                   call eqstr
  1785 000009D2 83C404                   add  sp, 4
  1786 000009D5 08C0                     or  al, al
  1787 000009D7 0F840600                 je .checkName80
  1788 000009DB 8B46FE                   mov ax, [bp-2]
  1789 000009DE E94700                   jmp .retncheckName
  1790                                  .checkName80:
  1791 000009E1 FF46FE                   inc  word[bp-2]
  1792                                  
  1793                                  ;-204   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1794                                  
  1795 000009E4 EBCA                     jmp .checkName78
  1796                                  .checkName79:
  1797 000009E6 B80100                   mov ax, 1
  1798 000009E9 8946FE                   mov [bp-2], ax
  1799                                  .checkName81:
  1800 000009EC 8B46FE                   mov ax, [bp-2]
  1801 000009EF 3B06[2A00]               cmp ax, [GTop]
  1802 000009F3 0F8D2B00                 jge .checkName82
  1803 000009F7 FF76FE                   push word [bp-2]
  1804 000009FA E8D7FE                   call adrofname
  1805 000009FD 83C402                   add  sp, 2
  1806 00000A00 8946FC                   mov [bp-4], ax
  1807 00000A03 FF76FC                   push word [bp-4]
  1808 00000A06 8D062B81                 lea  ax, [symbol]
  1809 00000A0A 50                       push ax
  1810 00000A0B E888F7                   call eqstr
  1811 00000A0E 83C404                   add  sp, 4
  1812 00000A11 08C0                     or  al, al
  1813 00000A13 0F840600                 je .checkName83
  1814 00000A17 8B46FE                   mov ax, [bp-2]
  1815 00000A1A E90B00                   jmp .retncheckName
  1816                                  .checkName83:
  1817 00000A1D FF46FE                   inc  word[bp-2]
  1818                                  
  1819                                  ;-205   return 0;
  1820                                  
  1821 00000A20 EBCA                     jmp .checkName81
  1822                                  .checkName82:
  1823 00000A22 B80000                   mov ax, 0
  1824 00000A25 E90000                   jmp .retncheckName
  1825                                  
  1826                                  ;-206 }    
  1827                                  
  1828                                  
  1829                                  ;-207 int typeName() { int m; //0=V,1=*,2=&
  1830                                  
  1831 00000A28 C9                       .retncheckName: LEAVE
  1832 00000A29 C3                       ret
  1833                                  ENDP
  1834                                  
  1835                                  typeName: PROC
  1836                                  
  1837                                  ;-208     issign='S';
  1838                                  
  1839                                  ;Function : typeName, Number of local variables: 1
  1840                                  ;   # type sign width addr used name   list of local variables
  1841                                  ;  200 var sign word   207 NULL m = bp-2;
  1842 00000A2A C8020000                 ENTER  2,0
  1843 00000A2E B85300                   mov ax, 83
  1844 00000A31 A2[3500]                 mov byte [issign], al
  1845                                  
  1846                                  ;-209     if(istoken(T_SIGNED))   issign='S';  
  1847                                  
  1848 00000A34 681302                   push 531
  1849 00000A37 E87C39                   call istoken
  1850 00000A3A 83C402                   add  sp, 2
  1851 00000A3D 08C0                     or  al, al
  1852 00000A3F 0F840600                 je .typeName84
  1853 00000A43 B85300                   mov ax, 83
  1854 00000A46 A2[3500]                 mov byte [issign], al
  1855                                  
  1856                                  ;-210     if(istoken(T_UNSIGNED)) issign='U';
  1857                                  
  1858                                  .typeName84:
  1859 00000A49 681402                   push 532
  1860 00000A4C E86739                   call istoken
  1861 00000A4F 83C402                   add  sp, 2
  1862 00000A52 08C0                     or  al, al
  1863 00000A54 0F840600                 je .typeName85
  1864 00000A58 B85500                   mov ax, 85
  1865 00000A5B A2[3500]                 mov byte [issign], al
  1866                                  
  1867                                  ;-211     iswidth=2;                           
  1868                                  
  1869                                  .typeName85:
  1870 00000A5E B80200                   mov ax, 2
  1871 00000A61 A2[3800]                 mov byte [iswidth], al
  1872                                  
  1873                                  ;-212     if(istoken(T_VOID))     iswidth=0;
  1874                                  
  1875 00000A64 681102                   push 529
  1876 00000A67 E84C39                   call istoken
  1877 00000A6A 83C402                   add  sp, 2
  1878 00000A6D 08C0                     or  al, al
  1879 00000A6F 0F840600                 je .typeName86
  1880 00000A73 B80000                   mov ax, 0
  1881 00000A76 A2[3800]                 mov byte [iswidth], al
  1882                                  
  1883                                  ;-213     if(istoken(T_CHAR))     iswidth=1;   
  1884                                  
  1885                                  .typeName86:
  1886 00000A79 681202                   push 530
  1887 00000A7C E83739                   call istoken
  1888 00000A7F 83C402                   add  sp, 2
  1889 00000A82 08C0                     or  al, al
  1890 00000A84 0F840600                 je .typeName87
  1891 00000A88 B80100                   mov ax, 1
  1892 00000A8B A2[3800]                 mov byte [iswidth], al
  1893                                  
  1894                                  ;-214     if(istoken(T_INT))      iswidth=2;
  1895                                  
  1896                                  .typeName87:
  1897 00000A8E 680502                   push 517
  1898 00000A91 E82239                   call istoken
  1899 00000A94 83C402                   add  sp, 2
  1900 00000A97 08C0                     or  al, al
  1901 00000A99 0F840600                 je .typeName88
  1902 00000A9D B80200                   mov ax, 2
  1903 00000AA0 A2[3800]                 mov byte [iswidth], al
  1904                                  
  1905                                  ;-215     if(istoken(T_LONG))     iswidth=4;
  1906                                  
  1907                                  .typeName88:
  1908 00000AA3 681502                   push 533
  1909 00000AA6 E80D39                   call istoken
  1910 00000AA9 83C402                   add  sp, 2
  1911 00000AAC 08C0                     or  al, al
  1912 00000AAE 0F840600                 je .typeName89
  1913 00000AB2 B80400                   mov ax, 4
  1914 00000AB5 A2[3800]                 mov byte [iswidth], al
  1915                                  
  1916                                  ;-216     istype='V'; 
  1917                                  
  1918                                  .typeName89:
  1919 00000AB8 B85600                   mov ax, 86
  1920 00000ABB A2[3200]                 mov byte [istype], al
  1921                                  
  1922                                  ;-217     m=0;
  1923                                  
  1924 00000ABE B80000                   mov ax, 0
  1925 00000AC1 8946FE                   mov [bp-2], ax
  1926                                  
  1927                                  ;-218     if(istoken('*'))  {istype='*'; m=1;} 
  1928                                  
  1929 00000AC4 6A2A                     push 42
  1930 00000AC6 E8ED38                   call istoken
  1931 00000AC9 83C402                   add  sp, 2
  1932 00000ACC 08C0                     or  al, al
  1933 00000ACE 0F840C00                 je .typeName90
  1934 00000AD2 B82A00                   mov ax, 42
  1935 00000AD5 A2[3200]                 mov byte [istype], al
  1936 00000AD8 B80100                   mov ax, 1
  1937 00000ADB 8946FE                   mov [bp-2], ax
  1938                                  
  1939                                  ;-219     if(istoken('&'))  {istype='&'; m=2;}
  1940                                  
  1941                                  .typeName90:
  1942 00000ADE 6A26                     push 38
  1943 00000AE0 E8D338                   call istoken
  1944 00000AE3 83C402                   add  sp, 2
  1945 00000AE6 08C0                     or  al, al
  1946 00000AE8 0F840C00                 je .typeName91
  1947 00000AEC B82600                   mov ax, 38
  1948 00000AEF A2[3200]                 mov byte [istype], al
  1949 00000AF2 B80200                   mov ax, 2
  1950 00000AF5 8946FE                   mov [bp-2], ax
  1951                                  
  1952                                  ;-220     name1(); 
  1953                                  
  1954                                  .typeName91:
  1955 00000AF8 E80800                   call name1
  1956                                  
  1957                                  ;-221     return m; 
  1958                                  
  1959 00000AFB 8B46FE                   mov ax, [bp-2]
  1960 00000AFE E90000                   jmp .retntypeName
  1961                                  
  1962                                  ;-222 }
  1963                                  
  1964                                  
  1965                                  ;-223 int name1() {
  1966                                  
  1967 00000B01 C9                       .retntypeName: LEAVE
  1968 00000B02 C3                       ret
  1969                                  ENDP
  1970                                  
  1971                                  name1: PROC
  1972                                  
  1973                                  ;-224     if (token!=T_NAME) error1("Name expected"); 
  1974                                  
  1975 00000B03 A1[1C00]                 mov ax, [token]
  1976 00000B06 3D0001                   cmp ax, 256
  1977 00000B09 0F840900                 je  .name192
  1978 00000B0D 68[1D0B]                 push name1_0
  1979 00000B10 E8F73C                   call error1
  1980 00000B13 83C402                   add  sp, 2
  1981                                  
  1982                                  ;-225     token=getlex(); 
  1983                                  
  1984                                  .name192:
  1985 00000B16 E87031                   call getlex
  1986 00000B19 A3[1C00]                 mov word [token], ax
  1987                                  
  1988                                  ;-226 }
  1989                                  
  1990                                  
  1991                                  ;-227 
  1992                                  
  1993                                  
  1994                                  ;-228 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1995                                  
  1996 00000B1C C3                       ret
  1997 00000B1D 4E616D652065787065-     name1_0 db "Name expected",0
  1998 00000B26 6374656400         
  1999                                  ENDP
  2000                                  
  2001                                  storecall: PROC
  2002                                  ;Function : storecall, Number of local variables: 1
  2003                                  ;   # type sign width addr used name   list of local variables
  2004                                  ;  200 var sign word   228 NULL i = bp-2;
  2005 00000B2B C8020000                 ENTER  2,0
  2006 00000B2F A1[3D00]                 mov ax, [CTop]
  2007 00000B32 3DD007                   cmp ax, 2000 ;unsigned : 1
  2008 00000B35 0F8C0900                 jl  .storecall93
  2009 00000B39 68[9D0B]                 push storecall_0
  2010 00000B3C E8CB3C                   call error1
  2011 00000B3F 83C402                   add  sp, 2
  2012                                  
  2013                                  ;-229   if (CNameTop >= 65468) error1("Call name table fuill");
  2014                                  
  2015                                  .storecall93:
  2016 00000B42 A1[6000]                 mov ax, [CNameTop]
  2017 00000B45 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2018 00000B48 0F820900                 jb  .storecall94
  2019 00000B4C 68[AD0B]                 push storecall_1
  2020 00000B4F E8B83C                   call error1
  2021 00000B52 83C402                   add  sp, 2
  2022                                  
  2023                                  ;-230     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2024                                  
  2025                                  .storecall94:
  2026 00000B55 B80000                   mov ax, 0
  2027 00000B58 8B1E[3D00]               mov bx, [CTop]
  2028 00000B5C 88872FA1                 mov [CType+bx], al
  2029 00000B60 A1[6000]                 mov ax, [CNameTop]
  2030 00000B63 8B1E[3D00]               mov bx, [CTop]
  2031 00000B67 D1E3                     shl bx, 1
  2032 00000B69 898757AB                 mov [CAdr+bx], ax
  2033 00000B6D 8D062B81                 lea  ax, [symbol]
  2034 00000B71 50                       push ax
  2035 00000B72 E8C9F5                   call strlen
  2036 00000B75 83C402                   add  sp, 2
  2037 00000B78 8946FE                   mov [bp-2], ax
  2038                                  
  2039                                  ;-231     to_far(CNameTop, symbol);
  2040                                  
  2041 00000B7B 8D062B81                 lea  ax, [symbol]
  2042 00000B7F 50                       push ax
  2043 00000B80 FF36[6000]               push word [CNameTop]
  2044 00000B84 E8DD47                   call to_far
  2045 00000B87 83C404                   add  sp, 4
  2046                                  
  2047                                  ;-232     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2048                                  
  2049 00000B8A A1[6000]                 mov ax, [CNameTop]
  2050 00000B8D 0346FE                   add ax, [bp-2]
  2051 00000B90 A3[6000]                 mov word [CNameTop], ax
  2052 00000B93 FF06[6000]               inc  word[CNameTop]
  2053 00000B97 FF06[3D00]               inc  word[CTop]
  2054                                  
  2055                                  ;-233 }
  2056                                  
  2057                                  
  2058                                  ;-234 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2059 00000B9B C9                       LEAVE
  2060 00000B9C C3                       ret
  2061 00000B9D 43616C6C207461626C-     storecall_0 db "Call table full",0
  2062 00000BA6 652066756C6C00     
  2063 00000BAD 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2064 00000BB6 207461626C65206675-
  2065 00000BBF 696C6C00           
  2066                                  ENDP
  2067                                  
  2068                                  storefunc: PROC
  2069 00000BC3 A1[3B00]                 mov ax, [FTop]
  2070 00000BC6 3D2C01                   cmp ax, 300 ;unsigned : 1
  2071 00000BC9 0F8C0900                 jl  .storefunc95
  2072 00000BCD 68[240C]                 push storefunc_0
  2073 00000BD0 E8373C                   call error1
  2074 00000BD3 83C402                   add  sp, 2
  2075                                  
  2076                                  ;-235     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2077                                  
  2078                                  .storefunc95:
  2079 00000BD6 A1[6600]                 mov ax, [lineno]
  2080 00000BD9 83E801                   sub ax, 1
  2081 00000BDC 8B1E[3B00]               mov bx, [FTop]
  2082 00000BE0 D1E3                     shl bx, 1
  2083 00000BE2 8987FFA8                 mov [FAdr+bx], ax
  2084 00000BE6 B80000                   mov ax, 0
  2085 00000BE9 8B1E[3B00]               mov bx, [FTop]
  2086 00000BED D1E3                     shl bx, 1
  2087 00000BEF 8987F7BA                 mov [FCalls+bx], ax
  2088 00000BF3 A0[3800]                 mov al, [iswidth]
  2089 00000BF6 8B1E[3B00]               mov bx, [FTop]
  2090 00000BFA 888703A0                 mov [FType+bx], al
  2091                                  
  2092                                  ;-236     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2093                                  
  2094 00000BFE FF36[3B00]               push word [FTop]
  2095 00000C02 8D064FBD                 lea  ax, [FNameField]
  2096 00000C06 50                       push ax
  2097 00000C07 E8DEFC                   call adrF
  2098 00000C0A 83C404                   add  sp, 4
  2099 00000C0D A3[6A00]                 mov word [pt], ax
  2100 00000C10 8D062B81                 lea  ax, [symbol]
  2101 00000C14 50                       push ax
  2102 00000C15 FF36[6A00]               push word [pt]
  2103 00000C19 E84AF5                   call strcpy
  2104 00000C1C 83C404                   add  sp, 4
  2105 00000C1F FF06[3B00]               inc  word[FTop]
  2106                                  
  2107                                  ;-237 }
  2108                                  
  2109                                  
  2110                                  ;-238 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2111                                  
  2112 00000C23 C3                       ret
  2113 00000C24 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2114 00000C2D 7461626C652066756C-
  2115 00000C36 6C00               
  2116                                  ENDP
  2117                                  
  2118                                  addlocal: PROC
  2119 00000C38 A1[2C00]                 mov ax, [LTop]
  2120 00000C3B 3D2C01                   cmp ax, 300 ;unsigned : 1
  2121 00000C3E 0F8C0900                 jl  .addlocal96
  2122 00000C42 68[BE0C]                 push addlocal_0
  2123 00000C45 E8C23B                   call error1
  2124 00000C48 83C402                   add  sp, 2
  2125                                  
  2126                                  ;-239   if (checkName() != 0) error1("Variable already defined");
  2127                                  
  2128                                  .addlocal96:
  2129 00000C4B E858FD                   call checkName
  2130 00000C4E 83F800                   cmp ax, 0
  2131 00000C51 0F840900                 je  .addlocal97
  2132 00000C55 68[D80C]                 push addlocal_1
  2133 00000C58 E8AF3B                   call error1
  2134 00000C5B 83C402                   add  sp, 2
  2135                                  
  2136                                  ;-240   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2137                                  
  2138                                  .addlocal97:
  2139 00000C5E A0[3500]                 mov al, [issign]
  2140 00000C61 8B1E[2C00]               mov bx, [LTop]
  2141 00000C65 8887E383                 mov [GSign+bx], al
  2142 00000C69 A0[3800]                 mov al, [iswidth]
  2143 00000C6C 8B1E[2C00]               mov bx, [LTop]
  2144 00000C70 88870F85                 mov [GWidth+bx], al
  2145 00000C74 A0[3200]                 mov al, [istype]
  2146 00000C77 8B1E[2C00]               mov bx, [LTop]
  2147 00000C7B 8887B782                 mov [GType+bx], al
  2148                                  
  2149                                  ;-241   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2150                                  
  2151 00000C7F A1[6600]                 mov ax, [lineno]
  2152 00000C82 83E801                   sub ax, 1
  2153 00000C85 8B1E[2C00]               mov bx, [LTop]
  2154 00000C89 D1E3                     shl bx, 1
  2155 00000C8B 89873B86                 mov [GAdr+bx], ax
  2156 00000C8F B80000                   mov ax, 0
  2157 00000C92 8B1E[2C00]               mov bx, [LTop]
  2158 00000C96 D1E3                     shl bx, 1
  2159 00000C98 89879388                 mov [GUsed+bx], ax
  2160                                  
  2161                                  ;-242   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2162                                  
  2163 00000C9C FF36[2C00]               push word [LTop]
  2164 00000CA0 8D06438D                 lea  ax, [GNameField]
  2165 00000CA4 50                       push ax
  2166 00000CA5 E840FC                   call adrF
  2167 00000CA8 83C404                   add  sp, 4
  2168 00000CAB A3[6A00]                 mov word [pt], ax
  2169 00000CAE 8D062B81                 lea  ax, [symbol]
  2170 00000CB2 50                       push ax
  2171 00000CB3 FF36[6A00]               push word [pt]
  2172 00000CB7 E8ACF4                   call strcpy
  2173 00000CBA 83C404                   add  sp, 4
  2174                                  
  2175                                  ;-243 }
  2176                                  
  2177                                  
  2178                                  ;-244 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2179                                  
  2180 00000CBD C3                       ret
  2181 00000CBE 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2182 00000CC7 6961626C6520746162-
  2183 00000CD0 6C652066756C6C00   
  2184 00000CD8 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2185 00000CE1 616C72656164792064-
  2186 00000CEA 6566696E656400     
  2187                                  ENDP
  2188                                  
  2189                                  checkFunction: PROC
  2190                                  ;Function : checkFunction, Number of local variables: 2
  2191                                  ;   # type sign width addr used name   list of local variables
  2192                                  ;  200 var unsg word   244 NULL i = bp-2
  2193                                  ;  201 var unsg word   244 NULL j = bp-4;
  2194 00000CF1 C8040000                 ENTER  4,0
  2195 00000CF5 B80000                   mov ax, 0
  2196 00000CF8 8946FE                   mov [bp-2], ax
  2197                                  
  2198                                  ;-245   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2199                                  
  2200                                  .checkFunction98:
  2201 00000CFB 8B46FE                   mov ax, [bp-2]
  2202 00000CFE 3B06[3B00]               cmp ax, [FTop]
  2203 00000D02 0F8D3000                 jge .checkFunction99
  2204 00000D06 FF76FE                   push word [bp-2]
  2205 00000D09 8D064FBD                 lea  ax, [FNameField]
  2206 00000D0D 50                       push ax
  2207 00000D0E E8D7FB                   call adrF
  2208 00000D11 83C404                   add  sp, 4
  2209 00000D14 8946FC                   mov [bp-4], ax
  2210 00000D17 FF76FC                   push word [bp-4]
  2211 00000D1A 8D062B81                 lea  ax, [symbol]
  2212 00000D1E 50                       push ax
  2213 00000D1F E874F4                   call eqstr
  2214 00000D22 83C404                   add  sp, 4
  2215 00000D25 08C0                     or  al, al
  2216 00000D27 0F840600                 je .checkFunction100
  2217 00000D2B 8B46FE                   mov ax, [bp-2]
  2218 00000D2E E90B00                   jmp .retncheckFunction
  2219                                  .checkFunction100:
  2220 00000D31 FF46FE                   inc  word[bp-2]
  2221                                  
  2222                                  ;-246   return 0; }
  2223                                  
  2224 00000D34 EBC5                     jmp .checkFunction98
  2225                                  .checkFunction99:
  2226 00000D36 B80000                   mov ax, 0
  2227 00000D39 E90000                   jmp .retncheckFunction
  2228                                  
  2229                                  ;-247 int dofunc() { int nloc; int i; int narg;  
  2230                                  
  2231 00000D3C C9                       .retncheckFunction: LEAVE
  2232 00000D3D C3                       ret
  2233                                  ENDP
  2234                                  
  2235                                  dofunc: PROC
  2236                                  
  2237                                  ;-248   cloc=&co; 
  2238                                  
  2239                                  ;Function : dofunc, Number of local variables: 3
  2240                                  ;   # type sign width addr used name   list of local variables
  2241                                  ;  200 var sign word   247 NULL nloc = bp-2
  2242                                  ;  201 var sign word   247 NULL i = bp-4
  2243                                  ;  202 var sign word   247 NULL narg = bp-6;
  2244 00000D3E C8060000                 ENTER  6,0
  2245 00000D42 B83075                   mov ax, co
  2246 00000D45 A3[1600]                 mov word [cloc], ax
  2247                                  
  2248                                  ;-249   checknamelen();
  2249                                  
  2250 00000D48 E857F6                   call checknamelen
  2251                                  
  2252                                  ;-250   strcpy(fname, symbol);
  2253                                  
  2254 00000D4B 8D062B81                 lea  ax, [symbol]
  2255 00000D4F 50                       push ax
  2256 00000D50 8D06AB81                 lea  ax, [fname]
  2257 00000D54 50                       push ax
  2258 00000D55 E80EF4                   call strcpy
  2259 00000D58 83C404                   add  sp, 4
  2260                                  
  2261                                  ;-251   if (checkFunction() ) error1("Function already defined");
  2262                                  
  2263 00000D5B E893FF                   call checkFunction
  2264 00000D5E 08C0                     or  al, al
  2265 00000D60 0F840900                 je .dofunc101
  2266 00000D64 68[880F]                 push dofunc_0
  2267 00000D67 E8A03A                   call error1
  2268 00000D6A 83C402                   add  sp, 2
  2269                                  
  2270                                  ;-252   storefunc();
  2271                                  
  2272                                  .dofunc101:
  2273 00000D6D E853FE                   call storefunc
  2274                                  
  2275                                  ;-253   prs("\n\n"); prs(symbol); prs(": PROC");
  2276                                  
  2277 00000D70 68[A10F]                 push dofunc_1
  2278 00000D73 E87537                   call prs
  2279 00000D76 83C402                   add  sp, 2
  2280 00000D79 8D062B81                 lea  ax, [symbol]
  2281 00000D7D 50                       push ax
  2282 00000D7E E86A37                   call prs
  2283 00000D81 83C402                   add  sp, 2
  2284 00000D84 68[A60F]                 push dofunc_2
  2285 00000D87 E86137                   call prs
  2286 00000D8A 83C402                   add  sp, 2
  2287                                  
  2288                                  ;-254   expect('('); LTop=LSTART;  i=0;
  2289                                  
  2290 00000D8D 6A28                     push 40
  2291 00000D8F E84636                   call expect
  2292 00000D92 83C402                   add  sp, 2
  2293 00000D95 B8C800                   mov ax, 200
  2294 00000D98 A3[2C00]                 mov word [LTop], ax
  2295 00000D9B B80000                   mov ax, 0
  2296 00000D9E 8946FC                   mov [bp-4], ax
  2297                                  
  2298                                  ;-255   if (istoken(')')==0) { narg=2; 
  2299                                  
  2300 00000DA1 6A29                     push 41
  2301 00000DA3 E81036                   call istoken
  2302 00000DA6 83C402                   add  sp, 2
  2303 00000DA9 83F800                   cmp ax, 0
  2304 00000DAC 0F854600                 jne .dofunc102
  2305 00000DB0 B80200                   mov ax, 2
  2306 00000DB3 8946FA                   mov [bp-6], ax
  2307                                  
  2308                                  ;-256     do { typeName();  addlocal(); narg+=2;
  2309                                  
  2310                                  .dofunc103:
  2311 00000DB6 E871FC                   call typeName
  2312 00000DB9 E87CFE                   call addlocal
  2313 00000DBC 8346FA02                 add  word[bp-6], 2
  2314                                  
  2315                                  ;-257          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2316                                  
  2317 00000DC0 8B46FA                   mov ax, [bp-6]
  2318 00000DC3 8B1E[2C00]               mov bx, [LTop]
  2319 00000DC7 D1E3                     shl bx, 1
  2320 00000DC9 8987EB8A                 mov [GData+bx], ax
  2321 00000DCD A0[3800]                 mov al, [iswidth]
  2322 00000DD0 3C04                     cmp al, 4
  2323 00000DD2 0F850400                 jne .dofunc104
  2324 00000DD6 8346FA02                 add  word[bp-6], 2
  2325                                  .dofunc104:
  2326 00000DDA FF06[2C00]               inc  word[LTop]
  2327                                  
  2328                                  ;-258     while (istoken(','));  expect(')'); }
  2329                                  
  2330 00000DDE 6A2C                     push 44
  2331 00000DE0 E8D335                   call istoken
  2332 00000DE3 83C402                   add  sp, 2
  2333 00000DE6 08C0                     or  al, al
  2334 00000DE8 0F840200                 je .dofunc105
  2335 00000DEC EBC8                     jmp .dofunc103
  2336                                  .dofunc105:
  2337 00000DEE 6A29                     push 41
  2338 00000DF0 E8E535                   call expect
  2339 00000DF3 83C402                   add  sp, 2
  2340                                  
  2341                                  ;-259     
  2342                                  
  2343                                  
  2344                                  ;-260   expect('{'); /*body*/
  2345                                  
  2346                                  .dofunc102:
  2347 00000DF6 6A7B                     push 123
  2348 00000DF8 E8DD35                   call expect
  2349 00000DFB 83C402                   add  sp, 2
  2350                                  
  2351                                  ;-261   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2352                                  
  2353 00000DFE B80000                   mov ax, 0
  2354 00000E01 8946FE                   mov [bp-2], ax
  2355 00000E04 B80000                   mov ax, 0
  2356 00000E07 A3[2600]                 mov word [nreturn], ax
  2357 00000E0A B80000                   mov ax, 0
  2358 00000E0D A3[2400]                 mov word [nconst], ax
  2359 00000E10 B80000                   mov ax, 0
  2360 00000E13 8946FC                   mov [bp-4], ax
  2361                                  
  2362                                  ;-262   while(isvariable()) {
  2363                                  
  2364                                  .dofunc106:
  2365 00000E16 E8C101                   call isvariable
  2366 00000E19 08C0                     or  al, al
  2367 00000E1B 0F849200                 je .dofunc107
  2368                                  
  2369                                  ;-263     do {typeName();
  2370                                  
  2371                                  .dofunc108:
  2372 00000E1F E808FC                   call typeName
  2373                                  
  2374                                  ;-264         checknamelen();
  2375                                  
  2376 00000E22 E87DF5                   call checknamelen
  2377                                  
  2378                                  ;-265         addlocal(); nloc-=2;
  2379                                  
  2380 00000E25 E810FE                   call addlocal
  2381 00000E28 836EFE02                 sub  word[bp-2], 2
  2382                                  
  2383                                  ;-266         if (iswidth == 4) nloc-=2;
  2384                                  
  2385 00000E2C A0[3800]                 mov al, [iswidth]
  2386 00000E2F 3C04                     cmp al, 4
  2387 00000E31 0F850400                 jne .dofunc109
  2388 00000E35 836EFE02                 sub  word[bp-2], 2
  2389                                  
  2390                                  ;-267         GData[LTop]=nloc;
  2391                                  
  2392                                  .dofunc109:
  2393 00000E39 8B46FE                   mov ax, [bp-2]
  2394 00000E3C 8B1E[2C00]               mov bx, [LTop]
  2395 00000E40 D1E3                     shl bx, 1
  2396 00000E42 8987EB8A                 mov [GData+bx], ax
  2397                                  
  2398                                  ;-268         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2399                                  
  2400 00000E46 6A5B                     push 91
  2401 00000E48 E86B35                   call istoken
  2402 00000E4B 83C402                   add  sp, 2
  2403 00000E4E 08C0                     or  al, al
  2404 00000E50 0F843D00                 je .dofunc110
  2405 00000E54 B82600                   mov ax, 38
  2406 00000E57 A2[3200]                 mov byte [istype], al
  2407 00000E5A B82600                   mov ax, 38
  2408 00000E5D 8B1E[2C00]               mov bx, [LTop]
  2409 00000E61 8887B782                 mov [GType+bx], al
  2410 00000E65 680101                   push 257
  2411 00000E68 E86D35                   call expect
  2412 00000E6B 83C402                   add  sp, 2
  2413 00000E6E 6A5D                     push 93
  2414 00000E70 E86535                   call expect
  2415 00000E73 83C402                   add  sp, 2
  2416                                  
  2417                                  ;-269             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2418                                  
  2419 00000E76 8B46FE                   mov ax, [bp-2]
  2420 00000E79 2B06[2E00]               sub ax, [lexval]
  2421 00000E7D 8946FE                   mov [bp-2], ax
  2422 00000E80 8346FE02                 add  word[bp-2], 2
  2423 00000E84 8B46FE                   mov ax, [bp-2]
  2424 00000E87 8B1E[2C00]               mov bx, [LTop]
  2425 00000E8B D1E3                     shl bx, 1
  2426 00000E8D 8987EB8A                 mov [GData+bx], ax
  2427                                  
  2428                                  ;-270         LTop++;
  2429                                  
  2430                                  .dofunc110:
  2431 00000E91 FF06[2C00]               inc  word[LTop]
  2432                                  
  2433                                  ;-271       } while (istoken(',')); expect(';'); }
  2434                                  
  2435 00000E95 6A2C                     push 44
  2436 00000E97 E81C35                   call istoken
  2437 00000E9A 83C402                   add  sp, 2
  2438 00000E9D 08C0                     or  al, al
  2439 00000E9F 0F840300                 je .dofunc111
  2440 00000EA3 E979FF                   jmp .dofunc108
  2441                                  .dofunc111:
  2442 00000EA6 6A3B                     push 59
  2443 00000EA8 E82D35                   call expect
  2444 00000EAB 83C402                   add  sp, 2
  2445                                  
  2446                                  ;-272   listproc(); 
  2447                                  
  2448 00000EAE E965FF                   jmp .dofunc106
  2449                                  .dofunc107:
  2450 00000EB1 E8583A                   call listproc
  2451                                  
  2452                                  ;-273   if (LTop>LSTART){prs(";\n ENTER  "); 
  2453                                  
  2454 00000EB4 A1[2C00]                 mov ax, [LTop]
  2455 00000EB7 3DC800                   cmp ax, 200
  2456 00000EBA 0F8E2700                 jle .dofunc112
  2457 00000EBE 68[AD0F]                 push dofunc_3
  2458 00000EC1 E82736                   call prs
  2459 00000EC4 83C402                   add  sp, 2
  2460                                  
  2461                                  ;-274     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  2462                                  
  2463 00000EC7 FF76FE                   push word [bp-2]
  2464 00000ECA E8F5F1                   call mkneg
  2465 00000ECD 83C402                   add  sp, 2
  2466 00000ED0 8946FE                   mov [bp-2], ax
  2467 00000ED3 FF76FE                   push word [bp-2]
  2468 00000ED6 E86737                   call prunsign1
  2469 00000ED9 83C402                   add  sp, 2
  2470 00000EDC 68[B90F]                 push dofunc_4
  2471 00000EDF E80936                   call prs
  2472 00000EE2 83C402                   add  sp, 2
  2473                                  
  2474                                  ;-275   while(istoken('}')==0)   stmt();
  2475                                  
  2476                                  .dofunc112:
  2477                                  .dofunc113:
  2478 00000EE5 6A7D                     push 125
  2479 00000EE7 E8CC34                   call istoken
  2480 00000EEA 83C402                   add  sp, 2
  2481 00000EED 83F800                   cmp ax, 0
  2482 00000EF0 0F850500                 jne .dofunc114
  2483 00000EF4 E81B28                   call stmt
  2484                                  
  2485                                  ;-276   if (nreturn) { 
  2486                                  
  2487 00000EF7 EBEC                     jmp .dofunc113
  2488                                  .dofunc114:
  2489 00000EF9 A1[2600]                 mov ax, [nreturn]
  2490 00000EFC 08C0                     or  al, al
  2491 00000EFE 0F841C00                 je .dofunc115
  2492                                  
  2493                                  ;-277         prs("\n .retn");
  2494                                  
  2495 00000F02 68[BC0F]                 push dofunc_5
  2496 00000F05 E8E335                   call prs
  2497 00000F08 83C402                   add  sp, 2
  2498                                  
  2499                                  ;-278         prs(fname);
  2500                                  
  2501 00000F0B 8D06AB81                 lea  ax, [fname]
  2502 00000F0F 50                       push ax
  2503 00000F10 E8D835                   call prs
  2504 00000F13 83C402                   add  sp, 2
  2505                                  
  2506                                  ;-279         prc(':');
  2507                                  
  2508 00000F16 6A3A                     push 58
  2509 00000F18 E86935                   call prc
  2510 00000F1B 83C402                   add  sp, 2
  2511                                  
  2512                                  ;-280         }
  2513                                  
  2514                                  
  2515                                  ;-281   if (LTop > LSTART) prs(" LEAVE");
  2516                                  
  2517                                  .dofunc115:
  2518 00000F1E A1[2C00]                 mov ax, [LTop]
  2519 00000F21 3DC800                   cmp ax, 200
  2520 00000F24 0F8E0900                 jle .dofunc116
  2521 00000F28 68[C50F]                 push dofunc_6
  2522 00000F2B E8BD35                   call prs
  2523 00000F2E 83C402                   add  sp, 2
  2524                                  
  2525                                  ;-282   prs("\n ret"); 
  2526                                  
  2527                                  .dofunc116:
  2528 00000F31 68[CC0F]                 push dofunc_7
  2529 00000F34 E8B435                   call prs
  2530 00000F37 83C402                   add  sp, 2
  2531                                  
  2532                                  ;-283   *cloc=0; prs(co); 
  2533                                  
  2534 00000F3A B80000                   mov ax, 0
  2535 00000F3D 8B1E[1600]               mov  bx, [cloc]
  2536 00000F41 8807                     mov  [bx], al
  2537 00000F43 8D063075                 lea  ax, [co]
  2538 00000F47 50                       push ax
  2539 00000F48 E8A035                   call prs
  2540 00000F4B 83C402                   add  sp, 2
  2541                                  
  2542                                  ;-284   maxco1=strlen(co);
  2543                                  
  2544 00000F4E 8D063075                 lea  ax, [co]
  2545 00000F52 50                       push ax
  2546 00000F53 E8E8F1                   call strlen
  2547 00000F56 83C402                   add  sp, 2
  2548 00000F59 A3[1400]                 mov word [maxco1], ax
  2549                                  
  2550                                  ;-285   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2551                                  
  2552 00000F5C A1[1400]                 mov ax, [maxco1]
  2553 00000F5F 3B06[1200]               cmp ax, [maxco]
  2554 00000F63 0F8E1600                 jle .dofunc117
  2555 00000F67 A1[1400]                 mov ax, [maxco1]
  2556 00000F6A A3[1200]                 mov word [maxco], ax
  2557 00000F6D 8D06AB81                 lea  ax, [fname]
  2558 00000F71 50                       push ax
  2559 00000F72 8D06E880                 lea  ax, [coname]
  2560 00000F76 50                       push ax
  2561 00000F77 E8ECF1                   call strcpy
  2562 00000F7A 83C404                   add  sp, 4
  2563                                  
  2564                                  ;-286   prs("\nENDP"); 
  2565                                  
  2566                                  .dofunc117:
  2567 00000F7D 68[D30F]                 push dofunc_8
  2568 00000F80 E86835                   call prs
  2569 00000F83 83C402                   add  sp, 2
  2570                                  
  2571                                  ;-287 }
  2572                                  
  2573                                  
  2574                                  ;-288 int isvariable() {
  2575 00000F86 C9                       LEAVE
  2576 00000F87 C3                       ret
  2577 00000F88 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2578 00000F91 616C72656164792064-
  2579 00000F9A 6566696E656400     
  2580 00000FA1 5C6E5C6E00              dofunc_1 db "\n\n",0
  2581 00000FA6 3A2050524F4300          dofunc_2 db ": PROC",0
  2582 00000FAD 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2583 00000FB6 202000             
  2584 00000FB9 2C3000                  dofunc_4 db ",0",0
  2585 00000FBC 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  2586 00000FC5 204C4541564500          dofunc_6 db " LEAVE",0
  2587 00000FCC 5C6E2072657400          dofunc_7 db "\n ret",0
  2588 00000FD3 5C6E454E445000          dofunc_8 db "\nENDP",0
  2589                                  ENDP
  2590                                  
  2591                                  isvariable: PROC
  2592                                  
  2593                                  ;-289     if(token==T_SIGNED)   goto v1;   
  2594                                  
  2595 00000FDA A1[1C00]                 mov ax, [token]
  2596 00000FDD 3D1302                   cmp ax, 531
  2597 00000FE0 0F850300                 jne .isvariable118
  2598 00000FE4 E93A00                   jmp .v1
  2599                                  
  2600                                  ;-290     if(token==T_UNSIGNED) goto v1;
  2601                                  
  2602                                  .isvariable118:
  2603 00000FE7 A1[1C00]                 mov ax, [token]
  2604 00000FEA 3D1402                   cmp ax, 532
  2605 00000FED 0F850300                 jne .isvariable119
  2606 00000FF1 E92D00                   jmp .v1
  2607                                  
  2608                                  ;-291     if(token==T_CHAR)     goto v1;   
  2609                                  
  2610                                  .isvariable119:
  2611 00000FF4 A1[1C00]                 mov ax, [token]
  2612 00000FF7 3D1202                   cmp ax, 530
  2613 00000FFA 0F850300                 jne .isvariable120
  2614 00000FFE E92000                   jmp .v1
  2615                                  
  2616                                  ;-292     if(token==T_INT)      goto v1;
  2617                                  
  2618                                  .isvariable120:
  2619 00001001 A1[1C00]                 mov ax, [token]
  2620 00001004 3D0502                   cmp ax, 517
  2621 00001007 0F850300                 jne .isvariable121
  2622 0000100B E91300                   jmp .v1
  2623                                  
  2624                                  ;-293     if(token==T_LONG)     goto v1;
  2625                                  
  2626                                  .isvariable121:
  2627 0000100E A1[1C00]                 mov ax, [token]
  2628 00001011 3D1502                   cmp ax, 533
  2629 00001014 0F850300                 jne .isvariable122
  2630 00001018 E90600                   jmp .v1
  2631                                  
  2632                                  ;-294     return 0;  
  2633                                  
  2634                                  .isvariable122:
  2635 0000101B B80000                   mov ax, 0
  2636 0000101E E90600                   jmp .retnisvariable
  2637                                  
  2638                                  ;-295 v1: return 1;
  2639                                  
  2640                                  .v1:
  2641 00001021 B80100                   mov ax, 1
  2642 00001024 E90000                   jmp .retnisvariable
  2643                                  
  2644                                  ;-296 }
  2645                                  
  2646                                  
  2647                                  ;-297                   
  2648                                  
  2649                                  
  2650                                  ;-298 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2651                                  
  2652                                   .retnisvariable:
  2653 00001027 C3                       ret
  2654                                  ENDP
  2655 00001028 0000                    mod1 dw 0
  2656 0000102A 0000                    ireg1 dw 0
  2657 0000102C 0000                    idx1 dw 0
  2658 0000102E 0000                    ids1 dw 0
  2659 00001030 0000                    idw1 dw 0
  2660 00001032 0000                    idt1 dw 0
  2661 00001034 0000                    val1 dw 0
  2662                                  
  2663                                  ;-299 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2664                                  
  2665 00001036 0000                    mod2 dw 0
  2666 00001038 0000                    ireg2 dw 0
  2667 0000103A 0000                    idx2 dw 0
  2668 0000103C 0000                    ids2 dw 0
  2669 0000103E 0000                    idw2 dw 0
  2670 00001040 0000                    idt2 dw 0
  2671 00001042 0000                    val2 dw 0
  2672                                  
  2673                                  ;-300 
  2674                                  
  2675                                  
  2676                                  ;-301 int pexpr() {expect('('); iscmp=0; 
  2677                                  
  2678                                  
  2679                                  pexpr: PROC
  2680 00001044 6A28                     push 40
  2681 00001046 E88F33                   call expect
  2682 00001049 83C402                   add  sp, 2
  2683 0000104C B80000                   mov ax, 0
  2684 0000104F A3[2200]                 mov word [iscmp], ax
  2685                                  
  2686                                  ;-302   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2687                                  
  2688 00001052 A1[1C00]                 mov ax, [token]
  2689 00001055 3D0001                   cmp ax, 256
  2690 00001058 0F853400                 jne .pexpr123
  2691 0000105C 68[BA10]                 push pexpr_0
  2692 0000105F 8D062B81                 lea  ax, [symbol]
  2693 00001063 50                       push ax
  2694 00001064 E82FF1                   call eqstr
  2695 00001067 83C404                   add  sp, 4
  2696 0000106A 08C0                     or  al, al
  2697 0000106C 0F840600                 je .pexpr124
  2698 00001070 E85E00                   call constantexpr
  2699 00001073 E94300                   jmp .retnpexpr
  2700                                  
  2701                                  ;-303     ireg1=checkreg();
  2702                                  
  2703                                  .pexpr124:
  2704 00001076 E89A07                   call checkreg
  2705 00001079 A3[2A10]                 mov word [ireg1], ax
  2706                                  
  2707                                  ;-304     if (ireg1) { doreg1(1); return; }  }
  2708                                  
  2709 0000107C A1[2A10]                 mov ax, [ireg1]
  2710 0000107F 08C0                     or  al, al
  2711 00001081 0F840B00                 je .pexpr125
  2712 00001085 6A01                     push 1
  2713 00001087 E89D05                   call doreg1
  2714 0000108A 83C402                   add  sp, 2
  2715 0000108D E92900                   jmp .retnpexpr
  2716                                  .pexpr125:
  2717                                  
  2718                                  ;-305   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2719                                  
  2720                                  .pexpr123:
  2721 00001090 E83D01                   call exprstart
  2722 00001093 A1[2200]                 mov ax, [iscmp]
  2723 00001096 83F800                   cmp ax, 0
  2724 00001099 0F850900                 jne .pexpr126
  2725 0000109D 68[BC10]                 push pexpr_1
  2726 000010A0 E84834                   call prs
  2727 000010A3 83C402                   add  sp, 2
  2728                                  .pexpr126:
  2729 000010A6 8D06AB81                 lea  ax, [fname]
  2730 000010AA 50                       push ax
  2731 000010AB E83D34                   call prs
  2732 000010AE 83C402                   add  sp, 2
  2733                                  
  2734                                  ;-306   expect(')'); }           /*error1("Vergleich fehlt");*/
  2735                                  
  2736 000010B1 6A29                     push 41
  2737 000010B3 E82233                   call expect
  2738 000010B6 83C402                   add  sp, 2
  2739                                  
  2740                                  ;-307 
  2741                                  
  2742                                  
  2743                                  ;-308 int constantexpr() { int mode; int id1;int ids;
  2744                                  
  2745                                   .retnpexpr:
  2746 000010B9 C3                       ret
  2747 000010BA 5F00                    pexpr_0 db "_",0
  2748 000010BC 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2749 000010C5 2C20616C5C6E206A65-
  2750 000010CE 202E00             
  2751                                  ENDP
  2752                                  
  2753                                  constantexpr: PROC
  2754                                  
  2755                                  ;-309   token=getlex();   mode=typeName();  
  2756                                  
  2757                                  ;Function : constantexpr, Number of local variables: 3
  2758                                  ;   # type sign width addr used name   list of local variables
  2759                                  ;  200 var sign word   308 NULL mode = bp-2
  2760                                  ;  201 var sign word   308 NULL id1 = bp-4
  2761                                  ;  202 var sign word   308 NULL ids = bp-6;
  2762 000010D1 C8060000                 ENTER  6,0
  2763 000010D5 E8B12B                   call getlex
  2764 000010D8 A3[1C00]                 mov word [token], ax
  2765 000010DB E84CF9                   call typeName
  2766 000010DE 8946FE                   mov [bp-2], ax
  2767                                  
  2768                                  ;-310   id1=searchname(); gettypes(id1); ids=signi;
  2769                                  
  2770 000010E1 E877F8                   call searchname
  2771 000010E4 8946FC                   mov [bp-4], ax
  2772 000010E7 FF76FC                   push word [bp-4]
  2773 000010EA E830F7                   call gettypes
  2774 000010ED 83C402                   add  sp, 2
  2775 000010F0 A1[3300]                 mov ax, [signi]
  2776 000010F3 8946FA                   mov [bp-6], ax
  2777                                  
  2778                                  ;-311   if (isrelational() ==0) error1("Relational expression expected");
  2779                                  
  2780 000010F6 E8292B                   call isrelational
  2781 000010F9 83F800                   cmp ax, 0
  2782 000010FC 0F850900                 jne .constantexpr127
  2783 00001100 68[8611]                 push constantexpr_0
  2784 00001103 E80437                   call error1
  2785 00001106 83C402                   add  sp, 2
  2786                                  
  2787                                  ;-312   expect(T_CONST);  prs(" ; constant expression");
  2788                                  
  2789                                  .constantexpr127:
  2790 00001109 680101                   push 257
  2791 0000110C E8C932                   call expect
  2792 0000110F 83C402                   add  sp, 2
  2793 00001112 68[A511]                 push constantexpr_1
  2794 00001115 E8D333                   call prs
  2795 00001118 83C402                   add  sp, 2
  2796                                  
  2797                                  ;-313   prs("\ncmp "); 
  2798                                  
  2799 0000111B 68[BC11]                 push constantexpr_2
  2800 0000111E E8CA33                   call prs
  2801 00001121 83C402                   add  sp, 2
  2802                                  
  2803                                  ;-314   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2804                                  
  2805 00001124 FF76FC                   push word [bp-4]
  2806 00001127 E8F3F6                   call gettypes
  2807 0000112A 83C402                   add  sp, 2
  2808 0000112D A1[3900]                 mov ax, [wi]
  2809 00001130 83F802                   cmp ax, 2
  2810 00001133 0F850C00                 jne .constantexpr128
  2811 00001137 68[C311]                 push constantexpr_3
  2812 0000113A E8AE33                   call prs
  2813 0000113D 83C402                   add  sp, 2
  2814 00001140 E90900                   jmp .constantexpr129
  2815                                  .constantexpr128:
  2816 00001143 68[C811]                 push constantexpr_4
  2817 00001146 E8A233                   call prs
  2818 00001149 83C402                   add  sp, 2
  2819                                  
  2820                                  ;-315   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2821                                  
  2822                                  .constantexpr129:
  2823 0000114C FF76FC                   push word [bp-4]
  2824 0000114F E81DF2                   call v
  2825 00001152 83C402                   add  sp, 2
  2826 00001155 68[CD11]                 push constantexpr_5
  2827 00001158 E89033                   call prs
  2828 0000115B 83C402                   add  sp, 2
  2829 0000115E FF36[2E00]               push word [lexval]
  2830 00001162 E8DB34                   call prunsign1
  2831 00001165 83C402                   add  sp, 2
  2832 00001168 FF76FA                   push word [bp-6]
  2833 0000116B E8F627                   call cmpneg
  2834 0000116E 83C402                   add  sp, 2
  2835 00001171 8D06AB81                 lea  ax, [fname]
  2836 00001175 50                       push ax
  2837 00001176 E87233                   call prs
  2838 00001179 83C402                   add  sp, 2
  2839                                  
  2840                                  ;-316   expect(')');
  2841                                  
  2842 0000117C 6A29                     push 41
  2843 0000117E E85732                   call expect
  2844 00001181 83C402                   add  sp, 2
  2845                                  
  2846                                  ;-317 }  
  2847                                  
  2848                                  
  2849                                  ;-318 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2850 00001184 C9                       LEAVE
  2851 00001185 C3                       ret
  2852 00001186 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2853 0000118F 6C2065787072657373-
  2854 00001198 696F6E206578706563-
  2855 000011A1 74656400           
  2856 000011A5 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2857 000011AE 6E7420657870726573-
  2858 000011B7 73696F6E00         
  2859 000011BC 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2860 000011C3 776F726400              constantexpr_3 db "word",0
  2861 000011C8 6279746500              constantexpr_4 db "byte",0
  2862 000011CD 2C2000                  constantexpr_5 db ", ",0
  2863                                  ENDP
  2864                                  
  2865                                  exprstart: PROC
  2866 000011D0 68[F811]                 push exprstart_0
  2867 000011D3 8D062B81                 lea  ax, [symbol]
  2868 000011D7 50                       push ax
  2869 000011D8 E8BBEF                   call eqstr
  2870 000011DB 83C404                   add  sp, 4
  2871 000011DE 08C0                     or  al, al
  2872 000011E0 0F840B00                 je .exprstart130
  2873 000011E4 6A00                     push 0
  2874 000011E6 E81100                   call expr2
  2875 000011E9 83C402                   add  sp, 2
  2876 000011EC E90800                   jmp .exprstart131
  2877                                  .exprstart130:
  2878 000011EF 6A00                     push 0
  2879 000011F1 E89E0A                   call expr
  2880 000011F4 83C402                   add  sp, 2
  2881                                  .exprstart131:
  2882                                  
  2883                                  ;-319 
  2884                                  
  2885                                  
  2886                                  ;-320 int expr2(int kind) {  int i;
  2887                                  
  2888 000011F7 C3                       ret
  2889 000011F8 5F00                    exprstart_0 db "_",0
  2890                                  ENDP
  2891                                  
  2892                                  expr2: PROC
  2893                                  
  2894                                  ;-321   if(kind != 1) token=getlex();
  2895                                  
  2896                                  ;Function : expr2, Number of local variables: 2
  2897                                  ;   # type sign width addr used name   list of local variables
  2898                                  ;  200 var sign word   320 NULL kind = bp+4
  2899                                  ;  201 var sign word   320 NULL i = bp-2;
  2900 000011FA C8020000                 ENTER  2,0
  2901 000011FE 8B4604                   mov ax, [bp+4]
  2902 00001201 83F801                   cmp ax, 1
  2903 00001204 0F840600                 je  .expr2132
  2904 00001208 E87E2A                   call getlex
  2905 0000120B A3[1C00]                 mov word [token], ax
  2906                                  
  2907                                  ;-322   mod1=typeName();
  2908                                  
  2909                                  .expr2132:
  2910 0000120E E819F8                   call typeName
  2911 00001211 A3[2810]                 mov word [mod1], ax
  2912                                  
  2913                                  ;-323   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2914                                  
  2915 00001214 A1[2810]                 mov ax, [mod1]
  2916 00001217 08C0                     or  al, al
  2917 00001219 0F840900                 je .expr2133
  2918 0000121D 68[B214]                 push expr2_0
  2919 00001220 E8E735                   call error1
  2920 00001223 83C402                   add  sp, 2
  2921                                  
  2922                                  ;-324   ireg1=checkreg();
  2923                                  
  2924                                  .expr2133:
  2925 00001226 E8EA05                   call checkreg
  2926 00001229 A3[2A10]                 mov word [ireg1], ax
  2927                                  
  2928                                  ;-325   if (ireg1) { doreg1(0); return; }
  2929                                  
  2930 0000122C A1[2A10]                 mov ax, [ireg1]
  2931 0000122F 08C0                     or  al, al
  2932 00001231 0F840B00                 je .expr2134
  2933 00001235 6A00                     push 0
  2934 00001237 E8ED03                   call doreg1
  2935 0000123A 83C402                   add  sp, 2
  2936 0000123D E97002                   jmp .retnexpr2
  2937                                  
  2938                                  ;-326   if (ireg1 == 0) { idx1=searchname();
  2939                                  
  2940                                  .expr2134:
  2941 00001240 A1[2A10]                 mov ax, [ireg1]
  2942 00001243 83F800                   cmp ax, 0
  2943 00001246 0F853400                 jne .expr2135
  2944 0000124A E80EF7                   call searchname
  2945 0000124D A3[2C10]                 mov word [idx1], ax
  2946                                  
  2947                                  ;-327     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2948                                  
  2949 00001250 FF36[2C10]               push word [idx1]
  2950 00001254 E8C6F5                   call gettypes
  2951 00001257 83C402                   add  sp, 2
  2952 0000125A A1[3300]                 mov ax, [signi]
  2953 0000125D A3[2E10]                 mov word [ids1], ax
  2954 00001260 A1[3900]                 mov ax, [wi]
  2955 00001263 A3[3010]                 mov word [idw1], ax
  2956 00001266 A1[3000]                 mov ax, [typei]
  2957 00001269 A3[3210]                 mov word [idt1], ax
  2958                                  
  2959                                  ;-328     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2960                                  
  2961 0000126C A1[3210]                 mov ax, [idt1]
  2962 0000126F 08C0                     or  al, al
  2963 00001271 0F840900                 je .expr2136
  2964 00001275 68[E114]                 push expr2_1
  2965 00001278 E88F35                   call error1
  2966 0000127B 83C402                   add  sp, 2
  2967                                  .expr2136:
  2968                                  
  2969                                  ;-329   
  2970                                  
  2971                                  
  2972                                  ;-330   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2973                                  
  2974                                  .expr2135:
  2975 0000127E E8A129                   call isrelational
  2976 00001281 08C0                     or  al, al
  2977 00001283 0F840900                 je .expr2137
  2978 00001287 68[0C15]                 push expr2_2
  2979 0000128A E87D35                   call error1
  2980 0000128D 83C402                   add  sp, 2
  2981                                  
  2982                                  ;-331   }
  2983                                  
  2984                                  
  2985                                  ;-332   if (istoken('=') == 0) error1("Assign expected");
  2986                                  
  2987                                  .expr2137:
  2988 00001290 6A3D                     push 61
  2989 00001292 E82131                   call istoken
  2990 00001295 83C402                   add  sp, 2
  2991 00001298 83F800                   cmp ax, 0
  2992 0000129B 0F850900                 jne .expr2138
  2993 0000129F 68[2F15]                 push expr2_3
  2994 000012A2 E86535                   call error1
  2995 000012A5 83C402                   add  sp, 2
  2996                                  
  2997                                  ;-333   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2998                                  
  2999                                  .expr2138:
  3000 000012A8 680101                   push 257
  3001 000012AB E80831                   call istoken
  3002 000012AE 83C402                   add  sp, 2
  3003 000012B1 08C0                     or  al, al
  3004 000012B3 0F849A00                 je .expr2139
  3005 000012B7 A1[2E00]                 mov ax, [lexval]
  3006 000012BA A3[4210]                 mov word [val2], ax
  3007 000012BD 68[3F15]                 push expr2_4
  3008 000012C0 E82832                   call prs
  3009 000012C3 83C402                   add  sp, 2
  3010                                  
  3011                                  ;-334     prs("\nmov ");
  3012                                  
  3013 000012C6 68[5615]                 push expr2_5
  3014 000012C9 E81F32                   call prs
  3015 000012CC 83C402                   add  sp, 2
  3016                                  
  3017                                  ;-335     if (idw1 == 1) prs("byte ");
  3018                                  
  3019 000012CF A1[3010]                 mov ax, [idw1]
  3020 000012D2 83F801                   cmp ax, 1
  3021 000012D5 0F850900                 jne .expr2140
  3022 000012D9 68[5D15]                 push expr2_6
  3023 000012DC E80C32                   call prs
  3024 000012DF 83C402                   add  sp, 2
  3025                                  
  3026                                  ;-336     if (idw1 == 2) prs("word ");
  3027                                  
  3028                                  .expr2140:
  3029 000012E2 A1[3010]                 mov ax, [idw1]
  3030 000012E5 83F802                   cmp ax, 2
  3031 000012E8 0F850900                 jne .expr2141
  3032 000012EC 68[6315]                 push expr2_7
  3033 000012EF E8F931                   call prs
  3034 000012F2 83C402                   add  sp, 2
  3035                                  
  3036                                  ;-337     if (idw1 == 4) prs("dword ");
  3037                                  
  3038                                  .expr2141:
  3039 000012F5 A1[3010]                 mov ax, [idw1]
  3040 000012F8 83F804                   cmp ax, 4
  3041 000012FB 0F850900                 jne .expr2142
  3042 000012FF 68[6915]                 push expr2_8
  3043 00001302 E8E631                   call prs
  3044 00001305 83C402                   add  sp, 2
  3045                                  
  3046                                  ;-338     v(idx1);
  3047                                  
  3048                                  .expr2142:
  3049 00001308 FF36[2C10]               push word [idx1]
  3050 0000130C E860F0                   call v
  3051 0000130F 83C402                   add  sp, 2
  3052                                  
  3053                                  ;-339     prs(", "); prunsign1(val2);
  3054                                  
  3055 00001312 68[7015]                 push expr2_9
  3056 00001315 E8D331                   call prs
  3057 00001318 83C402                   add  sp, 2
  3058 0000131B FF36[4210]               push word [val2]
  3059 0000131F E81E33                   call prunsign1
  3060 00001322 83C402                   add  sp, 2
  3061                                  
  3062                                  ;-340     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3063                                  
  3064 00001325 A1[2C10]                 mov ax, [idx1]
  3065 00001328 3DC800                   cmp ax, 200 ;unsigned : 1
  3066 0000132B 0F8C1F00                 jl  .expr2143
  3067 0000132F FF36[2C10]               push word [idx1]
  3068 00001333 E89EF5                   call adrofname
  3069 00001336 83C402                   add  sp, 2
  3070 00001339 8946FE                   mov [bp-2], ax
  3071 0000133C 68[7315]                 push expr2_10
  3072 0000133F E8A931                   call prs
  3073 00001342 83C402                   add  sp, 2
  3074 00001345 FF76FE                   push word [bp-2]
  3075 00001348 E8A031                   call prs
  3076 0000134B 83C402                   add  sp, 2
  3077                                  .expr2143:
  3078 0000134E E95F01                   jmp .retnexpr2
  3079                                  
  3080                                  ;-341   
  3081                                  
  3082                                  
  3083                                  ;-342   mod1=typeName(); ireg2=checkreg();
  3084                                  
  3085                                  .expr2139:
  3086 00001351 E8D6F6                   call typeName
  3087 00001354 A3[2810]                 mov word [mod1], ax
  3088 00001357 E8B904                   call checkreg
  3089 0000135A A3[3810]                 mov word [ireg2], ax
  3090                                  
  3091                                  ;-343   if (ireg2) { prs("\nmov ");
  3092                                  
  3093 0000135D A1[3810]                 mov ax, [ireg2]
  3094 00001360 08C0                     or  al, al
  3095 00001362 0F844200                 je .expr2144
  3096 00001366 68[7615]                 push expr2_11
  3097 00001369 E87F31                   call prs
  3098 0000136C 83C402                   add  sp, 2
  3099                                  
  3100                                  ;-344     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3101                                  
  3102 0000136F A1[2A10]                 mov ax, [ireg1]
  3103 00001372 08C0                     or  al, al
  3104 00001374 0F840D00                 je .expr2145
  3105 00001378 FF36[2A10]               push word [ireg1]
  3106 0000137C E8A208                   call printreg
  3107 0000137F 83C402                   add  sp, 2
  3108 00001382 E90A00                   jmp .expr2146
  3109                                  .expr2145:
  3110 00001385 FF36[2C10]               push word [idx1]
  3111 00001389 E8E3EF                   call v
  3112 0000138C 83C402                   add  sp, 2
  3113                                  .expr2146:
  3114 0000138F 68[7D15]                 push expr2_12
  3115 00001392 E85631                   call prs
  3116 00001395 83C402                   add  sp, 2
  3117 00001398 FF36[3810]               push word [ireg2]
  3118 0000139C E88208                   call printreg
  3119 0000139F 83C402                   add  sp, 2
  3120 000013A2 E90B01                   jmp .retnexpr2
  3121                                  
  3122                                  ;-345   else {
  3123                                  
  3124 000013A5 E9FF00                   jmp .expr2147
  3125                                  .expr2144:
  3126                                  
  3127                                  ;-346     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3128                                  
  3129 000013A8 A1[2810]                 mov ax, [mod1]
  3130 000013AB 83F801                   cmp ax, 1
  3131 000013AE 0F850900                 jne .expr2148
  3132 000013B2 68[8015]                 push expr2_13
  3133 000013B5 E85234                   call error1
  3134 000013B8 83C402                   add  sp, 2
  3135                                  
  3136                                  ;-347     
  3137                                  
  3138                                  
  3139                                  ;-348     idx2=searchname();
  3140                                  
  3141                                  .expr2148:
  3142 000013BB E89DF5                   call searchname
  3143 000013BE A3[3A10]                 mov word [idx2], ax
  3144                                  
  3145                                  ;-349     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3146                                  
  3147 000013C1 FF36[3A10]               push word [idx2]
  3148 000013C5 E855F4                   call gettypes
  3149 000013C8 83C402                   add  sp, 2
  3150 000013CB A1[3300]                 mov ax, [signi]
  3151 000013CE A3[3C10]                 mov word [ids2], ax
  3152 000013D1 A1[3900]                 mov ax, [wi]
  3153 000013D4 A3[3E10]                 mov word [idw2], ax
  3154 000013D7 A1[3000]                 mov ax, [typei]
  3155 000013DA A3[4010]                 mov word [idt2], ax
  3156                                  
  3157                                  ;-350     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3158                                  
  3159 000013DD A1[4010]                 mov ax, [idt2]
  3160 000013E0 83F801                   cmp ax, 1
  3161 000013E3 0F850900                 jne .expr2149
  3162 000013E7 68[9C15]                 push expr2_14
  3163 000013EA E81D34                   call error1
  3164 000013ED 83C402                   add  sp, 2
  3165                                  
  3166                                  ;-351     prs("\nmov ");
  3167                                  
  3168                                  .expr2149:
  3169 000013F0 68[BB15]                 push expr2_15
  3170 000013F3 E8F530                   call prs
  3171 000013F6 83C402                   add  sp, 2
  3172                                  
  3173                                  ;-352     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3174                                  
  3175 000013F9 A1[2A10]                 mov ax, [ireg1]
  3176 000013FC 08C0                     or  al, al
  3177 000013FE 0F840D00                 je .expr2150
  3178 00001402 FF36[2A10]               push word [ireg1]
  3179 00001406 E81808                   call printreg
  3180 00001409 83C402                   add  sp, 2
  3181 0000140C E90900                   jmp .expr2151
  3182                                  .expr2150:
  3183 0000140F 68[C215]                 push expr2_16
  3184 00001412 E8F533                   call error1
  3185 00001415 83C402                   add  sp, 2
  3186                                  
  3187                                  ;-353     prs(", ");
  3188                                  
  3189                                  .expr2151:
  3190 00001418 68[E415]                 push expr2_17
  3191 0000141B E8CD30                   call prs
  3192 0000141E 83C402                   add  sp, 2
  3193                                  
  3194                                  ;-354     if (mod1 == 2) a(idx2);
  3195                                  
  3196 00001421 A1[2810]                 mov ax, [mod1]
  3197 00001424 83F802                   cmp ax, 2
  3198 00001427 0F850D00                 jne .expr2152
  3199 0000142B FF36[3A10]               push word [idx2]
  3200 0000142F E82EEF                   call a
  3201 00001432 83C402                   add  sp, 2
  3202                                  
  3203                                  ;-355     else {
  3204                                  
  3205 00001435 E96C00                   jmp .expr2153
  3206                                  .expr2152:
  3207                                  
  3208                                  ;-356       if (idw2 == 1) prs("byte ");
  3209                                  
  3210 00001438 A1[3E10]                 mov ax, [idw2]
  3211 0000143B 83F801                   cmp ax, 1
  3212 0000143E 0F850900                 jne .expr2154
  3213 00001442 68[E715]                 push expr2_18
  3214 00001445 E8A330                   call prs
  3215 00001448 83C402                   add  sp, 2
  3216                                  
  3217                                  ;-357       if (idw2 == 2) prs("word ");
  3218                                  
  3219                                  .expr2154:
  3220 0000144B A1[3E10]                 mov ax, [idw2]
  3221 0000144E 83F802                   cmp ax, 2
  3222 00001451 0F850900                 jne .expr2155
  3223 00001455 68[ED15]                 push expr2_19
  3224 00001458 E89030                   call prs
  3225 0000145B 83C402                   add  sp, 2
  3226                                  
  3227                                  ;-358       if (idw2 == 4) prs("dword ");
  3228                                  
  3229                                  .expr2155:
  3230 0000145E A1[3E10]                 mov ax, [idw2]
  3231 00001461 83F804                   cmp ax, 4
  3232 00001464 0F850900                 jne .expr2156
  3233 00001468 68[F315]                 push expr2_20
  3234 0000146B E87D30                   call prs
  3235 0000146E 83C402                   add  sp, 2
  3236                                  
  3237                                  ;-359       v(idx2);
  3238                                  
  3239                                  .expr2156:
  3240 00001471 FF36[3A10]               push word [idx2]
  3241 00001475 E8F7EE                   call v
  3242 00001478 83C402                   add  sp, 2
  3243                                  
  3244                                  ;-360       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3245                                  
  3246 0000147B A1[3A10]                 mov ax, [idx2]
  3247 0000147E 3DC800                   cmp ax, 200 ;unsigned : 1
  3248 00001481 0F8C1F00                 jl  .expr2157
  3249 00001485 FF36[3A10]               push word [idx2]
  3250 00001489 E848F4                   call adrofname
  3251 0000148C 83C402                   add  sp, 2
  3252 0000148F 8946FE                   mov [bp-2], ax
  3253 00001492 68[FA15]                 push expr2_21
  3254 00001495 E85330                   call prs
  3255 00001498 83C402                   add  sp, 2
  3256 0000149B FF76FE                   push word [bp-2]
  3257 0000149E E84A30                   call prs
  3258 000014A1 83C402                   add  sp, 2
  3259                                  .expr2157:
  3260                                  
  3261                                  ;-361     return;
  3262                                  
  3263                                  .expr2153:
  3264 000014A4 E90900                   jmp .retnexpr2
  3265                                  
  3266                                  ;-362   } error1("Internal error: only const or reg allowed");
  3267                                  
  3268                                  .expr2147:
  3269 000014A7 68[FD15]                 push expr2_22
  3270 000014AA E85D33                   call error1
  3271 000014AD 83C402                   add  sp, 2
  3272                                  
  3273                                  ;-363 }
  3274                                  
  3275                                  
  3276                                  ;-364 char ops[5];
  3277                                  
  3278 000014B0 C9                       .retnexpr2: LEAVE
  3279 000014B1 C3                       ret
  3280 000014B2 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3281 000014BB 202620756E64202A20-
  3282 000014C4 696D20546578742028-
  3283 000014CD 4C696E6B652048616E-
  3284 000014D6 64292065726C617562-
  3285 000014DF 7400               
  3286 000014E1 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3287 000014EA 204172726179206F64-
  3288 000014F3 657220506F696E7465-
  3289 000014FC 72206C696E6B732065-
  3290 00001505 726C6175627400     
  3291 0000150C 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3292 00001515 206E6F6368206E6963-
  3293 0000151E 687420696D706C656D-
  3294 00001527 656E746965727400   
  3295 0000152F 41737369676E206578-     expr2_3 db "Assign expected",0
  3296 00001538 70656374656400     
  3297 0000153F 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3298 00001548 6E7420657870726573-
  3299 00001551 73696F6E00         
  3300 00001556 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3301 0000155D 627974652000            expr2_6 db "byte ",0
  3302 00001563 776F72642000            expr2_7 db "word ",0
  3303 00001569 64776F72642000          expr2_8 db "dword ",0
  3304 00001570 2C2000                  expr2_9 db ", ",0
  3305 00001573 3B2000                  expr2_10 db "; ",0
  3306 00001576 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3307 0000157D 2C2000                  expr2_12 db ", ",0
  3308 00001580 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3309 00001589 202A20696D20546578-
  3310 00001592 742065726C61756274-
  3311 0000159B 00                 
  3312 0000159C 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3313 000015A5 204172726179207265-
  3314 000015AE 636874732065726C61-
  3315 000015B7 75627400           
  3316 000015BB 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3317 000015C2 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3318 000015CB 6D206E6F7420616C6C-
  3319 000015D4 6F7765642062792078-
  3320 000015DD 38362D43505500     
  3321 000015E4 2C2000                  expr2_17 db ", ",0
  3322 000015E7 627974652000            expr2_18 db "byte ",0
  3323 000015ED 776F72642000            expr2_19 db "word ",0
  3324 000015F3 64776F72642000          expr2_20 db "dword ",0
  3325 000015FA 3B2000                  expr2_21 db "; ",0
  3326 000015FD 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3327 00001606 6572726F723A206F6E-
  3328 0000160F 6C7920636F6E737420-
  3329 00001618 6F722072656720616C-
  3330 00001621 6C6F77656400       
  3331                                  ENDP
  3332                                  section .bss
  3333                                  absolute 53406
  3334 0000D09E <res 00000005>          ops resb 5
  3335                                  section .text
  3336                                  
  3337                                  ;-365 int doreg1(int iscmp1) { int i;
  3338                                  
  3339                                  
  3340                                  doreg1: PROC
  3341                                  
  3342                                  ;-366   if (istoken('='))          strcpy(ops, "mov");
  3343                                  
  3344                                  ;Function : doreg1, Number of local variables: 2
  3345                                  ;   # type sign width addr used name   list of local variables
  3346                                  ;  200 var sign word   365 NULL iscmp1 = bp+4
  3347                                  ;  201 var sign word   365 NULL i = bp-2;
  3348 00001627 C8020000                 ENTER  2,0
  3349 0000162B 6A3D                     push 61
  3350 0000162D E8862D                   call istoken
  3351 00001630 83C402                   add  sp, 2
  3352 00001633 08C0                     or  al, al
  3353 00001635 0F840E00                 je .doreg1158
  3354 00001639 68[DA17]                 push doreg1_0
  3355 0000163C 8D069ED0                 lea  ax, [ops]
  3356 00001640 50                       push ax
  3357 00001641 E822EB                   call strcpy
  3358 00001644 83C404                   add  sp, 4
  3359                                  
  3360                                  ;-367   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3361                                  
  3362                                  .doreg1158:
  3363 00001647 68CE04                   push 1230
  3364 0000164A E8692D                   call istoken
  3365 0000164D 83C402                   add  sp, 2
  3366 00001650 08C0                     or  al, al
  3367 00001652 0F840E00                 je .doreg1159
  3368 00001656 68[DE17]                 push doreg1_1
  3369 00001659 8D069ED0                 lea  ax, [ops]
  3370 0000165D 50                       push ax
  3371 0000165E E805EB                   call strcpy
  3372 00001661 83C404                   add  sp, 4
  3373                                  
  3374                                  ;-368   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3375                                  
  3376                                  .doreg1159:
  3377 00001664 68CF04                   push 1231
  3378 00001667 E84C2D                   call istoken
  3379 0000166A 83C402                   add  sp, 2
  3380 0000166D 08C0                     or  al, al
  3381 0000166F 0F840E00                 je .doreg1160
  3382 00001673 68[E217]                 push doreg1_2
  3383 00001676 8D069ED0                 lea  ax, [ops]
  3384 0000167A 50                       push ax
  3385 0000167B E8E8EA                   call strcpy
  3386 0000167E 83C404                   add  sp, 4
  3387                                  
  3388                                  ;-369   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3389                                  
  3390                                  .doreg1160:
  3391 00001681 68D204                   push 1234
  3392 00001684 E82F2D                   call istoken
  3393 00001687 83C402                   add  sp, 2
  3394 0000168A 08C0                     or  al, al
  3395 0000168C 0F840E00                 je .doreg1161
  3396 00001690 68[E617]                 push doreg1_3
  3397 00001693 8D069ED0                 lea  ax, [ops]
  3398 00001697 50                       push ax
  3399 00001698 E8CBEA                   call strcpy
  3400 0000169B 83C404                   add  sp, 4
  3401                                  
  3402                                  ;-370   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3403                                  
  3404                                  .doreg1161:
  3405 0000169E 68D304                   push 1235
  3406 000016A1 E8122D                   call istoken
  3407 000016A4 83C402                   add  sp, 2
  3408 000016A7 08C0                     or  al, al
  3409 000016A9 0F840E00                 je .doreg1162
  3410 000016AD 68[EA17]                 push doreg1_4
  3411 000016B0 8D069ED0                 lea  ax, [ops]
  3412 000016B4 50                       push ax
  3413 000016B5 E8AEEA                   call strcpy
  3414 000016B8 83C404                   add  sp, 4
  3415                                  
  3416                                  ;-371   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3417                                  
  3418                                  .doreg1162:
  3419 000016BB 68D804                   push 1240
  3420 000016BE E8F52C                   call istoken
  3421 000016C1 83C402                   add  sp, 2
  3422 000016C4 08C0                     or  al, al
  3423 000016C6 0F840E00                 je .doreg1163
  3424 000016CA 68[ED17]                 push doreg1_5
  3425 000016CD 8D069ED0                 lea  ax, [ops]
  3426 000016D1 50                       push ax
  3427 000016D2 E891EA                   call strcpy
  3428 000016D5 83C404                   add  sp, 4
  3429                                  
  3430                                  ;-372   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3431                                  
  3432                                  .doreg1163:
  3433 000016D8 68D904                   push 1241
  3434 000016DB E8D82C                   call istoken
  3435 000016DE 83C402                   add  sp, 2
  3436 000016E1 08C0                     or  al, al
  3437 000016E3 0F840E00                 je .doreg1164
  3438 000016E7 68[F117]                 push doreg1_6
  3439 000016EA 8D069ED0                 lea  ax, [ops]
  3440 000016EE 50                       push ax
  3441 000016EF E874EA                   call strcpy
  3442 000016F2 83C404                   add  sp, 4
  3443                                  
  3444                                  ;-373   if (iscmp1 == 1) { token=getlex();
  3445                                  
  3446                                  .doreg1164:
  3447 000016F5 8B4604                   mov ax, [bp+4]
  3448 000016F8 83F801                   cmp ax, 1
  3449 000016FB 0F852700                 jne .doreg1165
  3450 000016FF E88725                   call getlex
  3451 00001702 A3[1C00]                 mov word [token], ax
  3452                                  
  3453                                  ;-374       if (isrelational() ==0) error1("Relational expected");
  3454                                  
  3455 00001705 E81A25                   call isrelational
  3456 00001708 83F800                   cmp ax, 0
  3457 0000170B 0F850900                 jne .doreg1166
  3458 0000170F 68[F517]                 push doreg1_7
  3459 00001712 E8F530                   call error1
  3460 00001715 83C402                   add  sp, 2
  3461                                  
  3462                                  ;-375       strcpy(ops, "cmp"); }
  3463                                  
  3464                                  .doreg1166:
  3465 00001718 68[0918]                 push doreg1_8
  3466 0000171B 8D069ED0                 lea  ax, [ops]
  3467 0000171F 50                       push ax
  3468 00001720 E843EA                   call strcpy
  3469 00001723 83C404                   add  sp, 4
  3470                                  
  3471                                  ;-376   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3472                                  
  3473                                  .doreg1165:
  3474 00001726 E8B42D                   call prnl
  3475 00001729 8D069ED0                 lea  ax, [ops]
  3476 0000172D 50                       push ax
  3477 0000172E E8BA2D                   call prs
  3478 00001731 83C402                   add  sp, 2
  3479 00001734 68[0D18]                 push doreg1_9
  3480 00001737 E8B12D                   call prs
  3481 0000173A 83C402                   add  sp, 2
  3482 0000173D FF36[2A10]               push word [ireg1]
  3483 00001741 E8DD04                   call printreg
  3484 00001744 83C402                   add  sp, 2
  3485 00001747 68[1018]                 push doreg1_10
  3486 0000174A E89E2D                   call prs
  3487 0000174D 83C402                   add  sp, 2
  3488                                  
  3489                                  ;-377 
  3490                                  
  3491                                  
  3492                                  ;-378   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3493                                  
  3494 00001750 680101                   push 257
  3495 00001753 E8602C                   call istoken
  3496 00001756 83C402                   add  sp, 2
  3497 00001759 08C0                     or  al, al
  3498 0000175B 0F840D00                 je .doreg1167
  3499 0000175F FF36[2E00]               push word [lexval]
  3500 00001763 E8DA2E                   call prunsign1
  3501 00001766 83C402                   add  sp, 2
  3502 00001769 E94700                   jmp .reg1
  3503                                  
  3504                                  ;-379   mod2=typeName(); ireg2=checkreg();
  3505                                  
  3506                                  .doreg1167:
  3507 0000176C E8BBF2                   call typeName
  3508 0000176F A3[3610]                 mov word [mod2], ax
  3509 00001772 E89E00                   call checkreg
  3510 00001775 A3[3810]                 mov word [ireg2], ax
  3511                                  
  3512                                  ;-380   if (ireg2) {printreg(ireg2); goto reg1;}
  3513                                  
  3514 00001778 A1[3810]                 mov ax, [ireg2]
  3515 0000177B 08C0                     or  al, al
  3516 0000177D 0F840D00                 je .doreg1168
  3517 00001781 FF36[3810]               push word [ireg2]
  3518 00001785 E89904                   call printreg
  3519 00001788 83C402                   add  sp, 2
  3520 0000178B E92500                   jmp .reg1
  3521                                  
  3522                                  ;-381   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3523                                  
  3524                                  .doreg1168:
  3525 0000178E E8CAF1                   call searchname
  3526 00001791 8946FE                   mov [bp-2], ax
  3527 00001794 A1[3610]                 mov ax, [mod2]
  3528 00001797 83F802                   cmp ax, 2
  3529 0000179A 0F850C00                 jne .doreg1169
  3530 0000179E FF76FE                   push word [bp-2]
  3531 000017A1 E8BCEB                   call a
  3532 000017A4 83C402                   add  sp, 2
  3533 000017A7 E90900                   jmp .doreg1170
  3534                                  .doreg1169:
  3535 000017AA FF76FE                   push word [bp-2]
  3536 000017AD E8BFEB                   call v
  3537 000017B0 83C402                   add  sp, 2
  3538                                  
  3539                                  ;-382   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3540                                  
  3541                                  .doreg1170:
  3542                                  .reg1:
  3543 000017B3 8B4604                   mov ax, [bp+4]
  3544 000017B6 83F801                   cmp ax, 1
  3545 000017B9 0F851B00                 jne .doreg1171
  3546 000017BD 6A00                     push 0
  3547 000017BF E8A221                   call cmpneg
  3548 000017C2 83C402                   add  sp, 2
  3549 000017C5 8D06AB81                 lea  ax, [fname]
  3550 000017C9 50                       push ax
  3551 000017CA E81E2D                   call prs
  3552 000017CD 83C402                   add  sp, 2
  3553 000017D0 6A29                     push 41
  3554 000017D2 E8032C                   call expect
  3555 000017D5 83C402                   add  sp, 2
  3556                                  
  3557                                  ;-383 }
  3558                                  
  3559                                  .doreg1171:
  3560                                  
  3561                                  ;-384 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3562 000017D8 C9                       LEAVE
  3563 000017D9 C3                       ret
  3564 000017DA 6D6F7600                doreg1_0 db "mov",0
  3565 000017DE 61646400                doreg1_1 db "add",0
  3566 000017E2 73756200                doreg1_2 db "sub",0
  3567 000017E6 616E6400                doreg1_3 db "and",0
  3568 000017EA 6F7200                  doreg1_4 db "or",0
  3569 000017ED 73686C00                doreg1_5 db "shl",0
  3570 000017F1 73687200                doreg1_6 db "shr",0
  3571 000017F5 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3572 000017FE 6C2065787065637465-
  3573 00001807 6400               
  3574 00001809 636D7000                doreg1_8 db "cmp",0
  3575 0000180D 202000                  doreg1_9 db "  ",0
  3576 00001810 2C2000                  doreg1_10 db ", ",0
  3577                                  ENDP
  3578                                  
  3579                                  checkreg: PROC
  3580                                  
  3581                                  ;-385   if (strlen(symbol) <  2) return 0;
  3582                                  
  3583 00001813 8D062B81                 lea  ax, [symbol]
  3584 00001817 50                       push ax
  3585 00001818 E823E9                   call strlen
  3586 0000181B 83C402                   add  sp, 2
  3587 0000181E 83F802                   cmp ax, 2
  3588 00001821 0F8D0600                 jge .checkreg172
  3589 00001825 B80000                   mov ax, 0
  3590 00001828 E94403                   jmp .retncheckreg
  3591                                  
  3592                                  ;-386   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3593                                  
  3594                                  .checkreg172:
  3595 0000182B 68[701B]                 push checkreg_0
  3596 0000182E 8D062B81                 lea  ax, [symbol]
  3597 00001832 50                       push ax
  3598 00001833 E860E9                   call eqstr
  3599 00001836 83C404                   add  sp, 4
  3600 00001839 08C0                     or  al, al
  3601 0000183B 0F840600                 je .checkreg173
  3602 0000183F B80100                   mov ax, 1
  3603 00001842 E92A03                   jmp .retncheckreg
  3604                                  .checkreg173:
  3605 00001845 68[731B]                 push checkreg_1
  3606 00001848 8D062B81                 lea  ax, [symbol]
  3607 0000184C 50                       push ax
  3608 0000184D E846E9                   call eqstr
  3609 00001850 83C404                   add  sp, 4
  3610 00001853 08C0                     or  al, al
  3611 00001855 0F840600                 je .checkreg174
  3612 00001859 B80300                   mov ax, 3
  3613 0000185C E91003                   jmp .retncheckreg
  3614                                  
  3615                                  ;-387   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3616                                  
  3617                                  .checkreg174:
  3618 0000185F 68[761B]                 push checkreg_2
  3619 00001862 8D062B81                 lea  ax, [symbol]
  3620 00001866 50                       push ax
  3621 00001867 E82CE9                   call eqstr
  3622 0000186A 83C404                   add  sp, 4
  3623 0000186D 08C0                     or  al, al
  3624 0000186F 0F840600                 je .checkreg175
  3625 00001873 B80500                   mov ax, 5
  3626 00001876 E9F602                   jmp .retncheckreg
  3627                                  .checkreg175:
  3628 00001879 68[791B]                 push checkreg_3
  3629 0000187C 8D062B81                 lea  ax, [symbol]
  3630 00001880 50                       push ax
  3631 00001881 E812E9                   call eqstr
  3632 00001884 83C404                   add  sp, 4
  3633 00001887 08C0                     or  al, al
  3634 00001889 0F840600                 je .checkreg176
  3635 0000188D B80700                   mov ax, 7
  3636 00001890 E9DC02                   jmp .retncheckreg
  3637                                  
  3638                                  ;-388   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3639                                  
  3640                                  .checkreg176:
  3641 00001893 68[7C1B]                 push checkreg_4
  3642 00001896 8D062B81                 lea  ax, [symbol]
  3643 0000189A 50                       push ax
  3644 0000189B E8F8E8                   call eqstr
  3645 0000189E 83C404                   add  sp, 4
  3646 000018A1 08C0                     or  al, al
  3647 000018A3 0F840600                 je .checkreg177
  3648 000018A7 B80900                   mov ax, 9
  3649 000018AA E9C202                   jmp .retncheckreg
  3650                                  .checkreg177:
  3651 000018AD 68[7F1B]                 push checkreg_5
  3652 000018B0 8D062B81                 lea  ax, [symbol]
  3653 000018B4 50                       push ax
  3654 000018B5 E8DEE8                   call eqstr
  3655 000018B8 83C404                   add  sp, 4
  3656 000018BB 08C0                     or  al, al
  3657 000018BD 0F840600                 je .checkreg178
  3658 000018C1 B80B00                   mov ax, 11
  3659 000018C4 E9A802                   jmp .retncheckreg
  3660                                  
  3661                                  ;-389   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3662                                  
  3663                                  .checkreg178:
  3664 000018C7 68[821B]                 push checkreg_6
  3665 000018CA 8D062B81                 lea  ax, [symbol]
  3666 000018CE 50                       push ax
  3667 000018CF E8C4E8                   call eqstr
  3668 000018D2 83C404                   add  sp, 4
  3669 000018D5 08C0                     or  al, al
  3670 000018D7 0F840600                 je .checkreg179
  3671 000018DB B80D00                   mov ax, 13
  3672 000018DE E98E02                   jmp .retncheckreg
  3673                                  .checkreg179:
  3674 000018E1 68[851B]                 push checkreg_7
  3675 000018E4 8D062B81                 lea  ax, [symbol]
  3676 000018E8 50                       push ax
  3677 000018E9 E8AAE8                   call eqstr
  3678 000018EC 83C404                   add  sp, 4
  3679 000018EF 08C0                     or  al, al
  3680 000018F1 0F840600                 je .checkreg180
  3681 000018F5 B80F00                   mov ax, 15
  3682 000018F8 E97402                   jmp .retncheckreg
  3683                                  
  3684                                  ;-390   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3685                                  
  3686                                  .checkreg180:
  3687 000018FB 68[881B]                 push checkreg_8
  3688 000018FE 8D062B81                 lea  ax, [symbol]
  3689 00001902 50                       push ax
  3690 00001903 E890E8                   call eqstr
  3691 00001906 83C404                   add  sp, 4
  3692 00001909 08C0                     or  al, al
  3693 0000190B 0F840600                 je .checkreg181
  3694 0000190F B81100                   mov ax, 17
  3695 00001912 E95A02                   jmp .retncheckreg
  3696                                  .checkreg181:
  3697 00001915 68[8B1B]                 push checkreg_9
  3698 00001918 8D062B81                 lea  ax, [symbol]
  3699 0000191C 50                       push ax
  3700 0000191D E876E8                   call eqstr
  3701 00001920 83C404                   add  sp, 4
  3702 00001923 08C0                     or  al, al
  3703 00001925 0F840600                 je .checkreg182
  3704 00001929 B81300                   mov ax, 19
  3705 0000192C E94002                   jmp .retncheckreg
  3706                                  
  3707                                  ;-391   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3708                                  
  3709                                  .checkreg182:
  3710 0000192F 68[8E1B]                 push checkreg_10
  3711 00001932 8D062B81                 lea  ax, [symbol]
  3712 00001936 50                       push ax
  3713 00001937 E85CE8                   call eqstr
  3714 0000193A 83C404                   add  sp, 4
  3715 0000193D 08C0                     or  al, al
  3716 0000193F 0F840600                 je .checkreg183
  3717 00001943 B81500                   mov ax, 21
  3718 00001946 E92602                   jmp .retncheckreg
  3719                                  .checkreg183:
  3720 00001949 68[911B]                 push checkreg_11
  3721 0000194C 8D062B81                 lea  ax, [symbol]
  3722 00001950 50                       push ax
  3723 00001951 E842E8                   call eqstr
  3724 00001954 83C404                   add  sp, 4
  3725 00001957 08C0                     or  al, al
  3726 00001959 0F840600                 je .checkreg184
  3727 0000195D B81700                   mov ax, 23
  3728 00001960 E90C02                   jmp .retncheckreg
  3729                                  
  3730                                  ;-392   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3731                                  
  3732                                  .checkreg184:
  3733 00001963 68[941B]                 push checkreg_12
  3734 00001966 8D062B81                 lea  ax, [symbol]
  3735 0000196A 50                       push ax
  3736 0000196B E828E8                   call eqstr
  3737 0000196E 83C404                   add  sp, 4
  3738 00001971 08C0                     or  al, al
  3739 00001973 0F840600                 je .checkreg185
  3740 00001977 B81900                   mov ax, 25
  3741 0000197A E9F201                   jmp .retncheckreg
  3742                                  .checkreg185:
  3743 0000197D 68[971B]                 push checkreg_13
  3744 00001980 8D062B81                 lea  ax, [symbol]
  3745 00001984 50                       push ax
  3746 00001985 E80EE8                   call eqstr
  3747 00001988 83C404                   add  sp, 4
  3748 0000198B 08C0                     or  al, al
  3749 0000198D 0F840600                 je .checkreg186
  3750 00001991 B81B00                   mov ax, 27
  3751 00001994 E9D801                   jmp .retncheckreg
  3752                                  
  3753                                  ;-393   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3754                                  
  3755                                  .checkreg186:
  3756 00001997 68[9A1B]                 push checkreg_14
  3757 0000199A 8D062B81                 lea  ax, [symbol]
  3758 0000199E 50                       push ax
  3759 0000199F E8F4E7                   call eqstr
  3760 000019A2 83C404                   add  sp, 4
  3761 000019A5 08C0                     or  al, al
  3762 000019A7 0F840600                 je .checkreg187
  3763 000019AB B81D00                   mov ax, 29
  3764 000019AE E9BE01                   jmp .retncheckreg
  3765                                  .checkreg187:
  3766 000019B1 68[9D1B]                 push checkreg_15
  3767 000019B4 8D062B81                 lea  ax, [symbol]
  3768 000019B8 50                       push ax
  3769 000019B9 E8DAE7                   call eqstr
  3770 000019BC 83C404                   add  sp, 4
  3771 000019BF 08C0                     or  al, al
  3772 000019C1 0F840600                 je .checkreg188
  3773 000019C5 B81F00                   mov ax, 31
  3774 000019C8 E9A401                   jmp .retncheckreg
  3775                                  
  3776                                  ;-394   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3777                                  
  3778                                  .checkreg188:
  3779 000019CB 68[A01B]                 push checkreg_16
  3780 000019CE 8D062B81                 lea  ax, [symbol]
  3781 000019D2 50                       push ax
  3782 000019D3 E8C0E7                   call eqstr
  3783 000019D6 83C404                   add  sp, 4
  3784 000019D9 08C0                     or  al, al
  3785 000019DB 0F840600                 je .checkreg189
  3786 000019DF B82100                   mov ax, 33
  3787 000019E2 E98A01                   jmp .retncheckreg
  3788                                  .checkreg189:
  3789 000019E5 68[A31B]                 push checkreg_17
  3790 000019E8 8D062B81                 lea  ax, [symbol]
  3791 000019EC 50                       push ax
  3792 000019ED E8A6E7                   call eqstr
  3793 000019F0 83C404                   add  sp, 4
  3794 000019F3 08C0                     or  al, al
  3795 000019F5 0F840600                 je .checkreg190
  3796 000019F9 B82300                   mov ax, 35
  3797 000019FC E97001                   jmp .retncheckreg
  3798                                  
  3799                                  ;-395   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3800                                  
  3801                                  .checkreg190:
  3802 000019FF 68[A61B]                 push checkreg_18
  3803 00001A02 8D062B81                 lea  ax, [symbol]
  3804 00001A06 50                       push ax
  3805 00001A07 E88CE7                   call eqstr
  3806 00001A0A 83C404                   add  sp, 4
  3807 00001A0D 08C0                     or  al, al
  3808 00001A0F 0F840600                 je .checkreg191
  3809 00001A13 B82500                   mov ax, 37
  3810 00001A16 E95601                   jmp .retncheckreg
  3811                                  .checkreg191:
  3812 00001A19 68[A91B]                 push checkreg_19
  3813 00001A1C 8D062B81                 lea  ax, [symbol]
  3814 00001A20 50                       push ax
  3815 00001A21 E872E7                   call eqstr
  3816 00001A24 83C404                   add  sp, 4
  3817 00001A27 08C0                     or  al, al
  3818 00001A29 0F840600                 je .checkreg192
  3819 00001A2D B82700                   mov ax, 39
  3820 00001A30 E93C01                   jmp .retncheckreg
  3821                                  
  3822                                  ;-396   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3823                                  
  3824                                  .checkreg192:
  3825 00001A33 68[AC1B]                 push checkreg_20
  3826 00001A36 8D062B81                 lea  ax, [symbol]
  3827 00001A3A 50                       push ax
  3828 00001A3B E858E7                   call eqstr
  3829 00001A3E 83C404                   add  sp, 4
  3830 00001A41 08C0                     or  al, al
  3831 00001A43 0F840600                 je .checkreg193
  3832 00001A47 B82900                   mov ax, 41
  3833 00001A4A E92201                   jmp .retncheckreg
  3834                                  .checkreg193:
  3835 00001A4D 68[AF1B]                 push checkreg_21
  3836 00001A50 8D062B81                 lea  ax, [symbol]
  3837 00001A54 50                       push ax
  3838 00001A55 E83EE7                   call eqstr
  3839 00001A58 83C404                   add  sp, 4
  3840 00001A5B 08C0                     or  al, al
  3841 00001A5D 0F840600                 je .checkreg194
  3842 00001A61 B82B00                   mov ax, 43
  3843 00001A64 E90801                   jmp .retncheckreg
  3844                                  
  3845                                  ;-397   // (eqstr(symbol,"ip")) return 45;
  3846                                  
  3847                                  
  3848                                  ;-398   if (strlen(symbol) >   3) return 0;
  3849                                  
  3850                                  .checkreg194:
  3851 00001A67 8D062B81                 lea  ax, [symbol]
  3852 00001A6B 50                       push ax
  3853 00001A6C E8CFE6                   call strlen
  3854 00001A6F 83C402                   add  sp, 2
  3855 00001A72 83F803                   cmp ax, 3
  3856 00001A75 0F8E0600                 jle .checkreg195
  3857 00001A79 B80000                   mov ax, 0
  3858 00001A7C E9F000                   jmp .retncheckreg
  3859                                  
  3860                                  ;-399   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3861                                  
  3862                                  .checkreg195:
  3863 00001A7F 68[B21B]                 push checkreg_22
  3864 00001A82 8D062B81                 lea  ax, [symbol]
  3865 00001A86 50                       push ax
  3866 00001A87 E80CE7                   call eqstr
  3867 00001A8A 83C404                   add  sp, 4
  3868 00001A8D 08C0                     or  al, al
  3869 00001A8F 0F840600                 je .checkreg196
  3870 00001A93 B82F00                   mov ax, 47
  3871 00001A96 E9D600                   jmp .retncheckreg
  3872                                  .checkreg196:
  3873 00001A99 68[B61B]                 push checkreg_23
  3874 00001A9C 8D062B81                 lea  ax, [symbol]
  3875 00001AA0 50                       push ax
  3876 00001AA1 E8F2E6                   call eqstr
  3877 00001AA4 83C404                   add  sp, 4
  3878 00001AA7 08C0                     or  al, al
  3879 00001AA9 0F840600                 je .checkreg197
  3880 00001AAD B83200                   mov ax, 50
  3881 00001AB0 E9BC00                   jmp .retncheckreg
  3882                                  
  3883                                  ;-400   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3884                                  
  3885                                  .checkreg197:
  3886 00001AB3 68[BA1B]                 push checkreg_24
  3887 00001AB6 8D062B81                 lea  ax, [symbol]
  3888 00001ABA 50                       push ax
  3889 00001ABB E8D8E6                   call eqstr
  3890 00001ABE 83C404                   add  sp, 4
  3891 00001AC1 08C0                     or  al, al
  3892 00001AC3 0F840600                 je .checkreg198
  3893 00001AC7 B83500                   mov ax, 53
  3894 00001ACA E9A200                   jmp .retncheckreg
  3895                                  .checkreg198:
  3896 00001ACD 68[BE1B]                 push checkreg_25
  3897 00001AD0 8D062B81                 lea  ax, [symbol]
  3898 00001AD4 50                       push ax
  3899 00001AD5 E8BEE6                   call eqstr
  3900 00001AD8 83C404                   add  sp, 4
  3901 00001ADB 08C0                     or  al, al
  3902 00001ADD 0F840600                 je .checkreg199
  3903 00001AE1 B83800                   mov ax, 56
  3904 00001AE4 E98800                   jmp .retncheckreg
  3905                                  
  3906                                  ;-401   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3907                                  
  3908                                  .checkreg199:
  3909 00001AE7 68[C21B]                 push checkreg_26
  3910 00001AEA 8D062B81                 lea  ax, [symbol]
  3911 00001AEE 50                       push ax
  3912 00001AEF E8A4E6                   call eqstr
  3913 00001AF2 83C404                   add  sp, 4
  3914 00001AF5 08C0                     or  al, al
  3915 00001AF7 0F840600                 je .checkreg200
  3916 00001AFB B83B00                   mov ax, 59
  3917 00001AFE E96E00                   jmp .retncheckreg
  3918                                  .checkreg200:
  3919 00001B01 68[C61B]                 push checkreg_27
  3920 00001B04 8D062B81                 lea  ax, [symbol]
  3921 00001B08 50                       push ax
  3922 00001B09 E88AE6                   call eqstr
  3923 00001B0C 83C404                   add  sp, 4
  3924 00001B0F 08C0                     or  al, al
  3925 00001B11 0F840600                 je .checkreg201
  3926 00001B15 B83E00                   mov ax, 62
  3927 00001B18 E95400                   jmp .retncheckreg
  3928                                  
  3929                                  ;-402   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3930                                  
  3931                                  .checkreg201:
  3932 00001B1B 68[CA1B]                 push checkreg_28
  3933 00001B1E 8D062B81                 lea  ax, [symbol]
  3934 00001B22 50                       push ax
  3935 00001B23 E870E6                   call eqstr
  3936 00001B26 83C404                   add  sp, 4
  3937 00001B29 08C0                     or  al, al
  3938 00001B2B 0F840600                 je .checkreg202
  3939 00001B2F B84100                   mov ax, 65
  3940 00001B32 E93A00                   jmp .retncheckreg
  3941                                  .checkreg202:
  3942 00001B35 68[CE1B]                 push checkreg_29
  3943 00001B38 8D062B81                 lea  ax, [symbol]
  3944 00001B3C 50                       push ax
  3945 00001B3D E856E6                   call eqstr
  3946 00001B40 83C404                   add  sp, 4
  3947 00001B43 08C0                     or  al, al
  3948 00001B45 0F840600                 je .checkreg203
  3949 00001B49 B84400                   mov ax, 68
  3950 00001B4C E92000                   jmp .retncheckreg
  3951                                  
  3952                                  ;-403   if (eqstr(symbol,"cr0")) return 71;
  3953                                  
  3954                                  .checkreg203:
  3955 00001B4F 68[D21B]                 push checkreg_30
  3956 00001B52 8D062B81                 lea  ax, [symbol]
  3957 00001B56 50                       push ax
  3958 00001B57 E83CE6                   call eqstr
  3959 00001B5A 83C404                   add  sp, 4
  3960 00001B5D 08C0                     or  al, al
  3961 00001B5F 0F840600                 je .checkreg204
  3962 00001B63 B84700                   mov ax, 71
  3963 00001B66 E90600                   jmp .retncheckreg
  3964                                  
  3965                                  ;-404   return 0;   }
  3966                                  
  3967                                  .checkreg204:
  3968 00001B69 B80000                   mov ax, 0
  3969 00001B6C E90000                   jmp .retncheckreg
  3970                                  
  3971                                  ;-405 char printregstr[]
  3972                                  
  3973                                   .retncheckreg:
  3974 00001B6F C3                       ret
  3975 00001B70 616C00                  checkreg_0 db "al",0
  3976 00001B73 636C00                  checkreg_1 db "cl",0
  3977 00001B76 646C00                  checkreg_2 db "dl",0
  3978 00001B79 626C00                  checkreg_3 db "bl",0
  3979 00001B7C 616800                  checkreg_4 db "ah",0
  3980 00001B7F 636800                  checkreg_5 db "ch",0
  3981 00001B82 646800                  checkreg_6 db "dh",0
  3982 00001B85 626800                  checkreg_7 db "bh",0
  3983 00001B88 617800                  checkreg_8 db "ax",0
  3984 00001B8B 637800                  checkreg_9 db "cx",0
  3985 00001B8E 647800                  checkreg_10 db "dx",0
  3986 00001B91 627800                  checkreg_11 db "bx",0
  3987 00001B94 737000                  checkreg_12 db "sp",0
  3988 00001B97 627000                  checkreg_13 db "bp",0
  3989 00001B9A 736900                  checkreg_14 db "si",0
  3990 00001B9D 646900                  checkreg_15 db "di",0
  3991 00001BA0 657300                  checkreg_16 db "es",0
  3992 00001BA3 637300                  checkreg_17 db "cs",0
  3993 00001BA6 737300                  checkreg_18 db "ss",0
  3994 00001BA9 647300                  checkreg_19 db "ds",0
  3995 00001BAC 667300                  checkreg_20 db "fs",0
  3996 00001BAF 677300                  checkreg_21 db "gs",0
  3997 00001BB2 65617800                checkreg_22 db "eax",0
  3998 00001BB6 65637800                checkreg_23 db "ecx",0
  3999 00001BBA 65647800                checkreg_24 db "edx",0
  4000 00001BBE 65627800                checkreg_25 db "ebx",0
  4001 00001BC2 65737000                checkreg_26 db "esp",0
  4002 00001BC6 65627000                checkreg_27 db "ebp",0
  4003 00001BCA 65736900                checkreg_28 db "esi",0
  4004 00001BCE 65646900                checkreg_29 db "edi",0
  4005 00001BD2 63723000                checkreg_30 db "cr0",0
  4006                                  ENDP
  4007                                  
  4008                                  ;-406 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4009                                  
  4010 00001BD6 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4011 00001BDF 616863686468626861-
  4012 00001BE8 786378647862787370-
  4013 00001BF1 627073696469657363-
  4014 00001BFA 737373647366736773-
  4015 00001C03 697065617865637865-
  4016 00001C0C 647865627865737065-
  4017 00001C15 627065736965646963-
  4018 00001C1E 723000             
  4019                                  
  4020                                  ;-407 //          1         2         3         4         5         6         7
  4021                                  
  4022                                  
  4023                                  ;-408 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4024                                  
  4025                                  
  4026                                  ;-409 int printreg(int i) {  unsigned int k; unsigned char c;
  4027                                  
  4028                                  
  4029                                  printreg: PROC
  4030                                  
  4031                                  ;-410   k = &printregstr + i; c=*k; prc(c); i++;
  4032                                  
  4033                                  ;Function : printreg, Number of local variables: 3
  4034                                  ;   # type sign width addr used name   list of local variables
  4035                                  ;  200 var sign word   409 NULL i = bp+4
  4036                                  ;  201 var unsg word   409 NULL k = bp-2
  4037                                  ;  202 var unsg byte   409 NULL c = bp-4;
  4038 00001C21 C8040000                 ENTER  4,0
  4039 00001C25 B8[D61B]                 mov ax, printregstr
  4040 00001C28 034604                   add ax, [bp+4]
  4041 00001C2B 8946FE                   mov [bp-2], ax
  4042 00001C2E 8B5EFE                   mov bx, [bp-2]
  4043 00001C31 8B07                     mov ax, [bx]
  4044 00001C33 8846FC                   mov [bp-4], al
  4045 00001C36 8A46FC                   mov al, byte [bp-4]
  4046 00001C39 B400                     mov ah, 0
  4047 00001C3B 50                       push ax
  4048 00001C3C E84528                   call prc
  4049 00001C3F 83C402                   add  sp, 2
  4050 00001C42 FF4604                   inc  word[bp+4]
  4051                                  
  4052                                  ;-411   k = &printregstr + i; c=*k; prc(c);
  4053                                  
  4054 00001C45 B8[D61B]                 mov ax, printregstr
  4055 00001C48 034604                   add ax, [bp+4]
  4056 00001C4B 8946FE                   mov [bp-2], ax
  4057 00001C4E 8B5EFE                   mov bx, [bp-2]
  4058 00001C51 8B07                     mov ax, [bx]
  4059 00001C53 8846FC                   mov [bp-4], al
  4060 00001C56 8A46FC                   mov al, byte [bp-4]
  4061 00001C59 B400                     mov ah, 0
  4062 00001C5B 50                       push ax
  4063 00001C5C E82528                   call prc
  4064 00001C5F 83C402                   add  sp, 2
  4065                                  
  4066                                  ;-412   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4067                                  
  4068 00001C62 8B4604                   mov ax, [bp+4]
  4069 00001C65 83F82F                   cmp ax, 47
  4070 00001C68 0F8E2000                 jle .printreg205
  4071 00001C6C FF4604                   inc  word[bp+4]
  4072 00001C6F B8[D61B]                 mov ax, printregstr
  4073 00001C72 034604                   add ax, [bp+4]
  4074 00001C75 8946FE                   mov [bp-2], ax
  4075 00001C78 8B5EFE                   mov bx, [bp-2]
  4076 00001C7B 8B07                     mov ax, [bx]
  4077 00001C7D 8846FC                   mov [bp-4], al
  4078 00001C80 8A46FC                   mov al, byte [bp-4]
  4079 00001C83 B400                     mov ah, 0
  4080 00001C85 50                       push ax
  4081 00001C86 E8FB27                   call prc
  4082 00001C89 83C402                   add  sp, 2
  4083                                  
  4084                                  ;-413 }
  4085                                  
  4086                                  .printreg205:
  4087                                  
  4088                                  ;-414 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4089 00001C8C C9                       LEAVE
  4090 00001C8D C3                       ret
  4091                                  ENDP
  4092 00001C8E 0000                    evalue dw 0
  4093 00001C90 0A00                    exprtype dw 10
  4094                                  
  4095                                  ;-415 int expr(int isRight)
  4096                                  
  4097                                  
  4098                                  expr: PROC
  4099                                  
  4100                                  ;-416 { int mode; int id1;     int ixarr; int ixconst;
  4101                                  
  4102                                  
  4103                                  ;-417   int ids;  int isCONST; int i;     unsigned char *p;
  4104                                  
  4105                                  
  4106                                  ;-418   if (istoken(T_CONST)) { evalue=lexval;
  4107                                  
  4108                                  ;Function : expr, Number of local variables: 9
  4109                                  ;   # type sign width addr used name   list of local variables
  4110                                  ;  200 var sign word   415 NULL isRight = bp+4
  4111                                  ;  201 var sign word   416 NULL mode = bp-2
  4112                                  ;  202 var sign word   416 NULL id1 = bp-4
  4113                                  ;  203 var sign word   416 NULL ixarr = bp-6
  4114                                  ;  204 var sign word   416 NULL ixconst = bp-8
  4115                                  ;  205 var sign word   417 NULL ids = bp-10
  4116                                  ;  206 var sign word   417 NULL isCONST = bp-12
  4117                                  ;  207 var sign word   417 NULL i = bp-14
  4118                                  ;  208 ptr unsg byte   417 NULL p = bp-16;
  4119 00001C92 C8100000                 ENTER  16,0
  4120 00001C96 680101                   push 257
  4121 00001C99 E81A27                   call istoken
  4122 00001C9C 83C402                   add  sp, 2
  4123 00001C9F 08C0                     or  al, al
  4124 00001CA1 0F841F00                 je .expr206
  4125 00001CA5 A1[2E00]                 mov ax, [lexval]
  4126 00001CA8 A3[8E1C]                 mov word [evalue], ax
  4127                                  
  4128                                  ;-419     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4129                                  
  4130 00001CAB 68[3220]                 push expr_0
  4131 00001CAE E83A28                   call prs
  4132 00001CB1 83C402                   add  sp, 2
  4133 00001CB4 FF36[2E00]               push word [lexval]
  4134 00001CB8 E88529                   call prunsign1
  4135 00001CBB 83C402                   add  sp, 2
  4136 00001CBE B80400                   mov ax, 4
  4137 00001CC1 E96C03                   jmp .retnexpr
  4138                                  
  4139                                  ;-420   mode=typeName(); /*0=V,1=*,2=&*/
  4140                                  
  4141                                  .expr206:
  4142 00001CC4 E863ED                   call typeName
  4143 00001CC7 8946FE                   mov [bp-2], ax
  4144                                  
  4145                                  ;-421   ireg1=checkreg();
  4146                                  
  4147 00001CCA E846FB                   call checkreg
  4148 00001CCD A3[2A10]                 mov word [ireg1], ax
  4149                                  
  4150                                  ;-422   if (ireg1) { doreg1(0); return; }
  4151                                  
  4152 00001CD0 A1[2A10]                 mov ax, [ireg1]
  4153 00001CD3 08C0                     or  al, al
  4154 00001CD5 0F840B00                 je .expr207
  4155 00001CD9 6A00                     push 0
  4156 00001CDB E849F9                   call doreg1
  4157 00001CDE 83C402                   add  sp, 2
  4158 00001CE1 E94C03                   jmp .retnexpr
  4159                                  
  4160                                  ;-423   if (token=='(')  {docall1(); goto e1; }
  4161                                  
  4162                                  .expr207:
  4163 00001CE4 A1[1C00]                 mov ax, [token]
  4164 00001CE7 83F828                   cmp ax, 40
  4165 00001CEA 0F850600                 jne .expr208
  4166 00001CEE E82E0F                   call docall1
  4167 00001CF1 E93202                   jmp .e1
  4168                                  
  4169                                  ;-424   if (isreg()) goto e1;
  4170                                  
  4171                                  .expr208:
  4172 00001CF4 E88307                   call isreg
  4173 00001CF7 08C0                     or  al, al
  4174 00001CF9 0F840300                 je .expr209
  4175 00001CFD E92602                   jmp .e1
  4176                                  
  4177                                  ;-425 
  4178                                  
  4179                                  
  4180                                  ;-426   id1=searchname(); gettypes(id1); ids=signi;
  4181                                  
  4182                                  .expr209:
  4183 00001D00 E858EC                   call searchname
  4184 00001D03 8946FC                   mov [bp-4], ax
  4185 00001D06 FF76FC                   push word [bp-4]
  4186 00001D09 E811EB                   call gettypes
  4187 00001D0C 83C402                   add  sp, 2
  4188 00001D0F A1[3300]                 mov ax, [signi]
  4189 00001D12 8946F6                   mov [bp-10], ax
  4190                                  
  4191                                  ;-427   ixarr=0;  ixconst=0;
  4192                                  
  4193 00001D15 B80000                   mov ax, 0
  4194 00001D18 8946FA                   mov [bp-6], ax
  4195 00001D1B B80000                   mov ax, 0
  4196 00001D1E 8946F8                   mov [bp-8], ax
  4197                                  
  4198                                  ;-428     if (istoken('[')) { if (istoken(T_CONST)) {
  4199                                  
  4200 00001D21 6A5B                     push 91
  4201 00001D23 E89026                   call istoken
  4202 00001D26 83C402                   add  sp, 2
  4203 00001D29 08C0                     or  al, al
  4204 00001D2B 0F845900                 je .expr210
  4205 00001D2F 680101                   push 257
  4206 00001D32 E88126                   call istoken
  4207 00001D35 83C402                   add  sp, 2
  4208 00001D38 08C0                     or  al, al
  4209 00001D3A 0F841700                 je .expr211
  4210                                  
  4211                                  ;-429       ixconst=1; ixarr=lexval; expect(']');  }
  4212                                  
  4213 00001D3E B80100                   mov ax, 1
  4214 00001D41 8946F8                   mov [bp-8], ax
  4215 00001D44 A1[2E00]                 mov ax, [lexval]
  4216 00001D47 8946FA                   mov [bp-6], ax
  4217 00001D4A 6A5D                     push 93
  4218 00001D4C E88926                   call expect
  4219 00001D4F 83C402                   add  sp, 2
  4220                                  
  4221                                  ;-430     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4222                                  
  4223 00001D52 E93300                   jmp .expr212
  4224                                  .expr211:
  4225 00001D55 E803EC                   call searchname
  4226 00001D58 8946FA                   mov [bp-6], ax
  4227 00001D5B 680001                   push 256
  4228 00001D5E E87726                   call expect
  4229 00001D61 83C402                   add  sp, 2
  4230 00001D64 6A5D                     push 93
  4231 00001D66 E86F26                   call expect
  4232 00001D69 83C402                   add  sp, 2
  4233                                  
  4234                                  ;-431     gettypes(ixarr);
  4235                                  
  4236 00001D6C FF76FA                   push word [bp-6]
  4237 00001D6F E8ABEA                   call gettypes
  4238 00001D72 83C402                   add  sp, 2
  4239                                  
  4240                                  ;-432     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4241                                  
  4242 00001D75 A1[3600]                 mov ax, [widthi]
  4243 00001D78 83F802                   cmp ax, 2
  4244 00001D7B 0F840900                 je  .expr213
  4245 00001D7F 68[3E20]                 push expr_1
  4246 00001D82 E8852A                   call error1
  4247 00001D85 83C402                   add  sp, 2
  4248                                  .expr213:
  4249                                  .expr212:
  4250                                  
  4251                                  ;-433   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4252                                  
  4253                                  .expr210:
  4254 00001D88 68C304                   push 1219
  4255 00001D8B E82826                   call istoken
  4256 00001D8E 83C402                   add  sp, 2
  4257 00001D91 08C0                     or  al, al
  4258 00001D93 0F844600                 je .expr214
  4259 00001D97 8B46FE                   mov ax, [bp-2]
  4260 00001D9A 08C0                     or  al, al
  4261 00001D9C 0F840900                 je .expr215
  4262 00001DA0 68[6120]                 push expr_2
  4263 00001DA3 E8642A                   call error1
  4264 00001DA6 83C402                   add  sp, 2
  4265                                  
  4266                                  ;-434      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4267                                  
  4268                                  .expr215:
  4269 00001DA9 68[7120]                 push expr_3
  4270 00001DAC E83C27                   call prs
  4271 00001DAF 83C402                   add  sp, 2
  4272 00001DB2 A1[3900]                 mov ax, [wi]
  4273 00001DB5 83F802                   cmp ax, 2
  4274 00001DB8 0F850C00                 jne .expr216
  4275 00001DBC 68[7A20]                 push expr_4
  4276 00001DBF E82927                   call prs
  4277 00001DC2 83C402                   add  sp, 2
  4278 00001DC5 E90900                   jmp .expr217
  4279                                  .expr216:
  4280 00001DC8 68[7F20]                 push expr_5
  4281 00001DCB E81D27                   call prs
  4282 00001DCE 83C402                   add  sp, 2
  4283                                  
  4284                                  ;-435      v(id1); goto e1;}
  4285                                  
  4286                                  .expr217:
  4287 00001DD1 FF76FC                   push word [bp-4]
  4288 00001DD4 E898E5                   call v
  4289 00001DD7 83C402                   add  sp, 2
  4290 00001DDA E94901                   jmp .e1
  4291                                  
  4292                                  ;-436   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4293                                  
  4294                                  .expr214:
  4295 00001DDD 68C904                   push 1225
  4296 00001DE0 E8D325                   call istoken
  4297 00001DE3 83C402                   add  sp, 2
  4298 00001DE6 08C0                     or  al, al
  4299 00001DE8 0F844600                 je .expr218
  4300 00001DEC 8B46FE                   mov ax, [bp-2]
  4301 00001DEF 08C0                     or  al, al
  4302 00001DF1 0F840900                 je .expr219
  4303 00001DF5 68[8420]                 push expr_6
  4304 00001DF8 E80F2A                   call error1
  4305 00001DFB 83C402                   add  sp, 2
  4306                                  
  4307                                  ;-437      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4308                                  
  4309                                  .expr219:
  4310 00001DFE 68[9420]                 push expr_7
  4311 00001E01 E8E726                   call prs
  4312 00001E04 83C402                   add  sp, 2
  4313 00001E07 A1[3900]                 mov ax, [wi]
  4314 00001E0A 83F802                   cmp ax, 2
  4315 00001E0D 0F850C00                 jne .expr220
  4316 00001E11 68[9D20]                 push expr_8
  4317 00001E14 E8D426                   call prs
  4318 00001E17 83C402                   add  sp, 2
  4319 00001E1A E90900                   jmp .expr221
  4320                                  .expr220:
  4321 00001E1D 68[A220]                 push expr_9
  4322 00001E20 E8C826                   call prs
  4323 00001E23 83C402                   add  sp, 2
  4324                                  
  4325                                  ;-438      v(id1); goto e1;}
  4326                                  
  4327                                  .expr221:
  4328 00001E26 FF76FC                   push word [bp-4]
  4329 00001E29 E843E5                   call v
  4330 00001E2C 83C402                   add  sp, 2
  4331 00001E2F E9F400                   jmp .e1
  4332                                  
  4333                                  ;-439        
  4334                                  
  4335                                  
  4336                                  ;-440   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4337                                  
  4338                                  .expr218:
  4339 00001E32 68CE04                   push 1230
  4340 00001E35 E87E25                   call istoken
  4341 00001E38 83C402                   add  sp, 2
  4342 00001E3B 08C0                     or  al, al
  4343 00001E3D 0F841200                 je .expr222
  4344 00001E41 FF76FC                   push word [bp-4]
  4345 00001E44 FF76FE                   push word [bp-2]
  4346 00001E47 68[A720]                 push expr_10
  4347 00001E4A E8A802                   call compoundass
  4348 00001E4D 83C406                   add  sp, 6
  4349 00001E50 E9D300                   jmp .e1
  4350                                  
  4351                                  ;-441   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4352                                  
  4353                                  .expr222:
  4354 00001E53 68CF04                   push 1231
  4355 00001E56 E85D25                   call istoken
  4356 00001E59 83C402                   add  sp, 2
  4357 00001E5C 08C0                     or  al, al
  4358 00001E5E 0F841200                 je .expr223
  4359 00001E62 FF76FC                   push word [bp-4]
  4360 00001E65 FF76FE                   push word [bp-2]
  4361 00001E68 68[AB20]                 push expr_11
  4362 00001E6B E88702                   call compoundass
  4363 00001E6E 83C406                   add  sp, 6
  4364 00001E71 E9B200                   jmp .e1
  4365                                  
  4366                                  ;-442   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4367                                  
  4368                                  .expr223:
  4369 00001E74 68D204                   push 1234
  4370 00001E77 E83C25                   call istoken
  4371 00001E7A 83C402                   add  sp, 2
  4372 00001E7D 08C0                     or  al, al
  4373 00001E7F 0F841200                 je .expr224
  4374 00001E83 FF76FC                   push word [bp-4]
  4375 00001E86 FF76FE                   push word [bp-2]
  4376 00001E89 68[AF20]                 push expr_12
  4377 00001E8C E86602                   call compoundass
  4378 00001E8F 83C406                   add  sp, 6
  4379 00001E92 E99100                   jmp .e1
  4380                                  
  4381                                  ;-443   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4382                                  
  4383                                  .expr224:
  4384 00001E95 68D304                   push 1235
  4385 00001E98 E81B25                   call istoken
  4386 00001E9B 83C402                   add  sp, 2
  4387 00001E9E 08C0                     or  al, al
  4388 00001EA0 0F841200                 je .expr225
  4389 00001EA4 FF76FC                   push word [bp-4]
  4390 00001EA7 FF76FE                   push word [bp-2]
  4391 00001EAA 68[B320]                 push expr_13
  4392 00001EAD E84502                   call compoundass
  4393 00001EB0 83C406                   add  sp, 6
  4394 00001EB3 E97000                   jmp .e1
  4395                                  
  4396                                  ;-444   if (istoken(T_MULASS    )) {error1("not implemented");}
  4397                                  
  4398                                  .expr225:
  4399 00001EB6 68D004                   push 1232
  4400 00001EB9 E8FA24                   call istoken
  4401 00001EBC 83C402                   add  sp, 2
  4402 00001EBF 08C0                     or  al, al
  4403 00001EC1 0F840900                 je .expr226
  4404 00001EC5 68[B620]                 push expr_14
  4405 00001EC8 E83F29                   call error1
  4406 00001ECB 83C402                   add  sp, 2
  4407                                  
  4408                                  ;-445   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4409                                  
  4410                                  .expr226:
  4411 00001ECE 68D104                   push 1233
  4412 00001ED1 E8E224                   call istoken
  4413 00001ED4 83C402                   add  sp, 2
  4414 00001ED7 08C0                     or  al, al
  4415 00001ED9 0F840900                 je .expr227
  4416 00001EDD 68[C620]                 push expr_15
  4417 00001EE0 E82729                   call error1
  4418 00001EE3 83C402                   add  sp, 2
  4419                                  
  4420                                  ;-446 
  4421                                  
  4422                                  
  4423                                  ;-447   if (istoken('=')) { exprtype= expr(1); 
  4424                                  
  4425                                  .expr227:
  4426 00001EE6 6A3D                     push 61
  4427 00001EE8 E8CB24                   call istoken
  4428 00001EEB 83C402                   add  sp, 2
  4429 00001EEE 08C0                     or  al, al
  4430 00001EF0 0F842000                 je .expr228
  4431 00001EF4 6A01                     push 1
  4432 00001EF6 E899FD                   call expr
  4433 00001EF9 83C402                   add  sp, 2
  4434 00001EFC A3[901C]                 mov word [exprtype], ax
  4435                                  
  4436                                  ;-448   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4437                                  
  4438 00001EFF FF76F8                   push word [bp-8]
  4439 00001F02 FF76FA                   push word [bp-6]
  4440 00001F05 FF76FC                   push word [bp-4]
  4441 00001F08 FF76FE                   push word [bp-2]
  4442 00001F0B E85E08                   call doassign
  4443 00001F0E 83C408                   add  sp, 8
  4444 00001F11 E91200                   jmp .e1
  4445                                  
  4446                                  ;-449   dovar1(mode, "mov", ixarr, id1);
  4447                                  
  4448                                  .expr228:
  4449 00001F14 FF76FC                   push word [bp-4]
  4450 00001F17 FF76FA                   push word [bp-6]
  4451 00001F1A 68[D620]                 push expr_16
  4452 00001F1D FF76FE                   push word [bp-2]
  4453 00001F20 E87402                   call dovar1
  4454 00001F23 83C408                   add  sp, 8
  4455                                  
  4456                                  ;-450   
  4457                                  
  4458                                  
  4459                                  ;-451 e1:    if (istoken('+')) rterm("add");
  4460                                  
  4461                                  .e1:
  4462 00001F26 6A2B                     push 43
  4463 00001F28 E88B24                   call istoken
  4464 00001F2B 83C402                   add  sp, 2
  4465 00001F2E 08C0                     or  al, al
  4466 00001F30 0F840C00                 je .expr229
  4467 00001F34 68[DA20]                 push expr_17
  4468 00001F37 E82704                   call rterm
  4469 00001F3A 83C402                   add  sp, 2
  4470                                  
  4471                                  ;-452   else if (istoken('-')) rterm("sub" );
  4472                                  
  4473 00001F3D E9CF00                   jmp .expr230
  4474                                  .expr229:
  4475 00001F40 6A2D                     push 45
  4476 00001F42 E87124                   call istoken
  4477 00001F45 83C402                   add  sp, 2
  4478 00001F48 08C0                     or  al, al
  4479 00001F4A 0F840C00                 je .expr231
  4480 00001F4E 68[DE20]                 push expr_18
  4481 00001F51 E80D04                   call rterm
  4482 00001F54 83C402                   add  sp, 2
  4483                                  
  4484                                  ;-453   else if (istoken('&')) rterm("and" );
  4485                                  
  4486 00001F57 E9B500                   jmp .expr232
  4487                                  .expr231:
  4488 00001F5A 6A26                     push 38
  4489 00001F5C E85724                   call istoken
  4490 00001F5F 83C402                   add  sp, 2
  4491 00001F62 08C0                     or  al, al
  4492 00001F64 0F840C00                 je .expr233
  4493 00001F68 68[E220]                 push expr_19
  4494 00001F6B E8F303                   call rterm
  4495 00001F6E 83C402                   add  sp, 2
  4496                                  
  4497                                  ;-454   else if (istoken('|')) rterm("or" );  
  4498                                  
  4499 00001F71 E99B00                   jmp .expr234
  4500                                  .expr233:
  4501 00001F74 6A7C                     push 124
  4502 00001F76 E83D24                   call istoken
  4503 00001F79 83C402                   add  sp, 2
  4504 00001F7C 08C0                     or  al, al
  4505 00001F7E 0F840C00                 je .expr235
  4506 00001F82 68[E620]                 push expr_20
  4507 00001F85 E8D903                   call rterm
  4508 00001F88 83C402                   add  sp, 2
  4509                                  
  4510                                  ;-455   else if (istoken(T_LESSLESS)) rterm("shl");
  4511                                  
  4512 00001F8B E98100                   jmp .expr236
  4513                                  .expr235:
  4514 00001F8E 68D804                   push 1240
  4515 00001F91 E82224                   call istoken
  4516 00001F94 83C402                   add  sp, 2
  4517 00001F97 08C0                     or  al, al
  4518 00001F99 0F840C00                 je .expr237
  4519 00001F9D 68[E920]                 push expr_21
  4520 00001FA0 E8BE03                   call rterm
  4521 00001FA3 83C402                   add  sp, 2
  4522                                  
  4523                                  ;-456   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4524                                  
  4525 00001FA6 E96600                   jmp .expr238
  4526                                  .expr237:
  4527 00001FA9 68D904                   push 1241
  4528 00001FAC E80724                   call istoken
  4529 00001FAF 83C402                   add  sp, 2
  4530 00001FB2 08C0                     or  al, al
  4531 00001FB4 0F840C00                 je .expr239
  4532 00001FB8 68[ED20]                 push expr_22
  4533 00001FBB E8A303                   call rterm
  4534 00001FBE 83C402                   add  sp, 2
  4535                                  
  4536                                  ;-457   else if (istoken('*')) domul (ids);
  4537                                  
  4538 00001FC1 E94B00                   jmp .expr240
  4539                                  .expr239:
  4540 00001FC4 6A2A                     push 42
  4541 00001FC6 E8ED23                   call istoken
  4542 00001FC9 83C402                   add  sp, 2
  4543 00001FCC 08C0                     or  al, al
  4544 00001FCE 0F840C00                 je .expr241
  4545 00001FD2 FF76F6                   push word [bp-10]
  4546 00001FD5 E8DD09                   call domul
  4547 00001FD8 83C402                   add  sp, 2
  4548                                  
  4549                                  ;-458   else if (istoken('/')) doidiv(ids);
  4550                                  
  4551 00001FDB E93100                   jmp .expr242
  4552                                  .expr241:
  4553 00001FDE 6A2F                     push 47
  4554 00001FE0 E8D323                   call istoken
  4555 00001FE3 83C402                   add  sp, 2
  4556 00001FE6 08C0                     or  al, al
  4557 00001FE8 0F840C00                 je .expr243
  4558 00001FEC FF76F6                   push word [bp-10]
  4559 00001FEF E8640A                   call doidiv
  4560 00001FF2 83C402                   add  sp, 2
  4561                                  
  4562                                  ;-459   else if (istoken('%')) domod (ids);
  4563                                  
  4564 00001FF5 E91700                   jmp .expr244
  4565                                  .expr243:
  4566 00001FF8 6A25                     push 37
  4567 00001FFA E8B923                   call istoken
  4568 00001FFD 83C402                   add  sp, 2
  4569 00002000 08C0                     or  al, al
  4570 00002002 0F840900                 je .expr245
  4571 00002006 FF76F6                   push word [bp-10]
  4572 00002009 E8ED0B                   call domod
  4573 0000200C 83C402                   add  sp, 2
  4574                                  
  4575                                  ;-460   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4576                                  
  4577                                  .expr245:
  4578                                  .expr244:
  4579                                  .expr242:
  4580                                  .expr240:
  4581                                  .expr238:
  4582                                  .expr236:
  4583                                  .expr234:
  4584                                  .expr232:
  4585                                  .expr230:
  4586 0000200F E8101C                   call isrelational
  4587 00002012 08C0                     or  al, al
  4588 00002014 0F841200                 je .expr246
  4589 00002018 68[F120]                 push expr_23
  4590 0000201B E84303                   call rterm
  4591 0000201E 83C402                   add  sp, 2
  4592 00002021 FF76F6                   push word [bp-10]
  4593 00002024 E83D19                   call cmpneg
  4594 00002027 83C402                   add  sp, 2
  4595                                  
  4596                                  ;-461   return 0;
  4597                                  
  4598                                  .expr246:
  4599 0000202A B80000                   mov ax, 0
  4600 0000202D E90000                   jmp .retnexpr
  4601                                  
  4602                                  ;-462 }
  4603                                  
  4604                                  
  4605                                  ;-463 
  4606                                  
  4607                                  
  4608                                  ;-464 int compoundass(char *op, int mode, int id1) {
  4609                                  
  4610 00002030 C9                       .retnexpr: LEAVE
  4611 00002031 C3                       ret
  4612 00002032 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4613 0000203B 2C2000             
  4614 0000203E 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4615 00002047 78206D757373205A61-
  4616 00002050 686C206F6465722069-
  4617 00002059 6E74207365696E00   
  4618 00002061 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4619 0000206A 726C6175627400     
  4620 00002071 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4621 0000207A 776F726400              expr_4 db "word",0
  4622 0000207F 6279746500              expr_5 db "byte",0
  4623 00002084 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4624 0000208D 726C6175627400     
  4625 00002094 5C6E20646563202000      expr_7 db "\n dec  ",0
  4626 0000209D 776F726400              expr_8 db "word",0
  4627 000020A2 6279746500              expr_9 db "byte",0
  4628 000020A7 61646400                expr_10 db "add",0
  4629 000020AB 73756200                expr_11 db "sub",0
  4630 000020AF 616E6400                expr_12 db "and",0
  4631 000020B3 6F7200                  expr_13 db "or",0
  4632 000020B6 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4633 000020BF 6D656E74656400     
  4634 000020C6 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4635 000020CF 6D656E74656400     
  4636 000020D6 6D6F7600                expr_16 db "mov",0
  4637 000020DA 61646400                expr_17 db "add",0
  4638 000020DE 73756200                expr_18 db "sub",0
  4639 000020E2 616E6400                expr_19 db "and",0
  4640 000020E6 6F7200                  expr_20 db "or",0
  4641 000020E9 73686C00                expr_21 db "shl",0
  4642 000020ED 73687200                expr_22 db "shr",0
  4643 000020F1 636D7000                expr_23 db "cmp",0
  4644                                  ENDP
  4645                                  
  4646                                  compoundass: PROC
  4647                                  
  4648                                  ;-465   if(mode) error1("only scalar Var allowed");
  4649                                  
  4650                                  ;Function : compoundass, Number of local variables: 3
  4651                                  ;   # type sign width addr used name   list of local variables
  4652                                  ;  200 ptr sign byte   464 NULL op = bp+4
  4653                                  ;  201 var sign word   464 NULL mode = bp+6
  4654                                  ;  202 var sign word   464 NULL id1 = bp+8;
  4655 000020F5 C8000000                 ENTER  0,0
  4656 000020F9 8B4606                   mov ax, [bp+6]
  4657 000020FC 08C0                     or  al, al
  4658 000020FE 0F840900                 je .compoundass247
  4659 00002102 68[6F21]                 push compoundass_0
  4660 00002105 E80227                   call error1
  4661 00002108 83C402                   add  sp, 2
  4662                                  
  4663                                  ;-466   prnl(); prs(op); prs("  "); 
  4664                                  
  4665                                  .compoundass247:
  4666 0000210B E8CF23                   call prnl
  4667 0000210E FF7604                   push word [bp+4]
  4668 00002111 E8D723                   call prs
  4669 00002114 83C402                   add  sp, 2
  4670 00002117 68[8721]                 push compoundass_1
  4671 0000211A E8CE23                   call prs
  4672 0000211D 83C402                   add  sp, 2
  4673                                  
  4674                                  ;-467   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4675                                  
  4676 00002120 FF7608                   push word [bp+8]
  4677 00002123 E8F7E6                   call gettypes
  4678 00002126 83C402                   add  sp, 2
  4679 00002129 A1[3900]                 mov ax, [wi]
  4680 0000212C 83F802                   cmp ax, 2
  4681 0000212F 0F850C00                 jne .compoundass248
  4682 00002133 68[8A21]                 push compoundass_2
  4683 00002136 E8B223                   call prs
  4684 00002139 83C402                   add  sp, 2
  4685 0000213C E90900                   jmp .compoundass249
  4686                                  .compoundass248:
  4687 0000213F 68[8F21]                 push compoundass_3
  4688 00002142 E8A623                   call prs
  4689 00002145 83C402                   add  sp, 2
  4690                                  
  4691                                  ;-468   v(id1); prs(", ");
  4692                                  
  4693                                  .compoundass249:
  4694 00002148 FF7608                   push word [bp+8]
  4695 0000214B E821E2                   call v
  4696 0000214E 83C402                   add  sp, 2
  4697 00002151 68[9421]                 push compoundass_4
  4698 00002154 E89423                   call prs
  4699 00002157 83C402                   add  sp, 2
  4700                                  
  4701                                  ;-469   expect(T_CONST); prunsign1(lexval);
  4702                                  
  4703 0000215A 680101                   push 257
  4704 0000215D E87822                   call expect
  4705 00002160 83C402                   add  sp, 2
  4706 00002163 FF36[2E00]               push word [lexval]
  4707 00002167 E8D624                   call prunsign1
  4708 0000216A 83C402                   add  sp, 2
  4709                                  
  4710                                  ;-470 }
  4711                                  
  4712                                  
  4713                                  ;-471 int dovar1(int mode, int op, int ixarr, int id1) { 
  4714 0000216D C9                       LEAVE
  4715 0000216E C3                       ret
  4716 0000216F 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4717 00002178 61722056617220616C-
  4718 00002181 6C6F77656400       
  4719 00002187 202000                  compoundass_1 db "  ",0
  4720 0000218A 776F726400              compoundass_2 db "word",0
  4721 0000218F 6279746500              compoundass_3 db "byte",0
  4722 00002194 2C2000                  compoundass_4 db ", ",0
  4723                                  ENDP
  4724                                  
  4725                                  dovar1: PROC
  4726                                  
  4727                                  ;-472   gettypes(id1);
  4728                                  
  4729                                  ;Function : dovar1, Number of local variables: 4
  4730                                  ;   # type sign width addr used name   list of local variables
  4731                                  ;  200 var sign word   471 NULL mode = bp+4
  4732                                  ;  201 var sign word   471 NULL op = bp+6
  4733                                  ;  202 var sign word   471 NULL ixarr = bp+8
  4734                                  ;  203 var sign word   471 NULL id1 = bp+10;
  4735 00002197 C8000000                 ENTER  0,0
  4736 0000219B FF760A                   push word [bp+10]
  4737 0000219E E87CE6                   call gettypes
  4738 000021A1 83C402                   add  sp, 2
  4739                                  
  4740                                  ;-473   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4741                                  
  4742 000021A4 8B4604                   mov ax, [bp+4]
  4743 000021A7 83F801                   cmp ax, 1
  4744 000021AA 0F854700                 jne .dovar1250
  4745 000021AE 68[EC22]                 push dovar1_0
  4746 000021B1 E83723                   call prs
  4747 000021B4 83C402                   add  sp, 2
  4748 000021B7 FF760A                   push word [bp+10]
  4749 000021BA E8B2E1                   call v
  4750 000021BD 83C402                   add  sp, 2
  4751 000021C0 E81A23                   call prnl
  4752 000021C3 FF7606                   push word [bp+6]
  4753 000021C6 E82223                   call prs
  4754 000021C9 83C402                   add  sp, 2
  4755                                  
  4756                                  ;-474     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4757                                  
  4758 000021CC A1[3600]                 mov ax, [widthi]
  4759 000021CF 83F801                   cmp ax, 1
  4760 000021D2 0F850900                 jne .dovar1251
  4761 000021D6 68[F822]                 push dovar1_1
  4762 000021D9 E80F23                   call prs
  4763 000021DC 83C402                   add  sp, 2
  4764                                  
  4765                                  ;-475     if(widthi == 2) prs(" ax, [bx]");
  4766                                  
  4767                                  .dovar1251:
  4768 000021DF A1[3600]                 mov ax, [widthi]
  4769 000021E2 83F802                   cmp ax, 2
  4770 000021E5 0F850900                 jne .dovar1252
  4771 000021E9 68[0E23]                 push dovar1_2
  4772 000021EC E8FC22                   call prs
  4773 000021EF 83C402                   add  sp, 2
  4774                                  
  4775                                  ;-476     return; }
  4776                                  
  4777                                  .dovar1252:
  4778 000021F2 E9F500                   jmp .retndovar1
  4779                                  
  4780                                  ;-477   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4781                                  
  4782                                  .dovar1250:
  4783 000021F5 8B4604                   mov ax, [bp+4]
  4784 000021F8 83F802                   cmp ax, 2
  4785 000021FB 0F852100                 jne .dovar1253
  4786 000021FF E8DB22                   call prnl
  4787 00002202 FF7606                   push word [bp+6]
  4788 00002205 E8E322                   call prs
  4789 00002208 83C402                   add  sp, 2
  4790 0000220B 68[1823]                 push dovar1_3
  4791 0000220E E8DA22                   call prs
  4792 00002211 83C402                   add  sp, 2
  4793 00002214 FF760A                   push word [bp+10]
  4794 00002217 E846E1                   call a
  4795 0000221A 83C402                   add  sp, 2
  4796 0000221D E9CA00                   jmp .retndovar1
  4797                                  
  4798                                  ;-478   if (ixarr) {
  4799                                  
  4800                                  .dovar1253:
  4801 00002220 8B4608                   mov ax, [bp+8]
  4802 00002223 08C0                     or  al, al
  4803 00002225 0F847300                 je .dovar1254
  4804                                  
  4805                                  ;-479     prs("\n mov bx, "); v(ixarr);
  4806                                  
  4807 00002229 68[1E23]                 push dovar1_4
  4808 0000222C E8BC22                   call prs
  4809 0000222F 83C402                   add  sp, 2
  4810 00002232 FF7608                   push word [bp+8]
  4811 00002235 E837E1                   call v
  4812 00002238 83C402                   add  sp, 2
  4813                                  
  4814                                  ;-480     if (wi==2) prs("\n shl bx, 1");
  4815                                  
  4816 0000223B A1[3900]                 mov ax, [wi]
  4817 0000223E 83F802                   cmp ax, 2
  4818 00002241 0F850900                 jne .dovar1255
  4819 00002245 68[2A23]                 push dovar1_5
  4820 00002248 E8A022                   call prs
  4821 0000224B 83C402                   add  sp, 2
  4822                                  
  4823                                  ;-481     prs("\n "); prs(op);
  4824                                  
  4825                                  .dovar1255:
  4826 0000224E 68[3723]                 push dovar1_6
  4827 00002251 E89722                   call prs
  4828 00002254 83C402                   add  sp, 2
  4829 00002257 FF7606                   push word [bp+6]
  4830 0000225A E88E22                   call prs
  4831 0000225D 83C402                   add  sp, 2
  4832                                  
  4833                                  ;-482     if (wi==2) prs(" ax, "); else prs(" al, ");
  4834                                  
  4835 00002260 A1[3900]                 mov ax, [wi]
  4836 00002263 83F802                   cmp ax, 2
  4837 00002266 0F850C00                 jne .dovar1256
  4838 0000226A 68[3B23]                 push dovar1_7
  4839 0000226D E87B22                   call prs
  4840 00002270 83C402                   add  sp, 2
  4841 00002273 E90900                   jmp .dovar1257
  4842                                  .dovar1256:
  4843 00002276 68[4123]                 push dovar1_8
  4844 00002279 E86F22                   call prs
  4845 0000227C 83C402                   add  sp, 2
  4846                                  
  4847                                  ;-483 // v(id1); prs(" [bx]");
  4848                                  
  4849                                  
  4850                                  ;-484     prc('['); printName(id1); prs(" + bx]"); 
  4851                                  
  4852                                  .dovar1257:
  4853 0000227F 6A5B                     push 91
  4854 00002281 E80022                   call prc
  4855 00002284 83C402                   add  sp, 2
  4856 00002287 FF760A                   push word [bp+10]
  4857 0000228A E86AE6                   call printName
  4858 0000228D 83C402                   add  sp, 2
  4859 00002290 68[4723]                 push dovar1_9
  4860 00002293 E85522                   call prs
  4861 00002296 83C402                   add  sp, 2
  4862                                  
  4863                                  ;-485     return; }
  4864                                  
  4865 00002299 E94E00                   jmp .retndovar1
  4866                                  
  4867                                  ;-486   prnl();prs(op);
  4868                                  
  4869                                  .dovar1254:
  4870 0000229C E83E22                   call prnl
  4871 0000229F FF7606                   push word [bp+6]
  4872 000022A2 E84622                   call prs
  4873 000022A5 83C402                   add  sp, 2
  4874                                  
  4875                                  ;-487   if(wi==1) prs(" al, ");
  4876                                  
  4877 000022A8 A1[3900]                 mov ax, [wi]
  4878 000022AB 83F801                   cmp ax, 1
  4879 000022AE 0F850900                 jne .dovar1258
  4880 000022B2 68[4E23]                 push dovar1_10
  4881 000022B5 E83322                   call prs
  4882 000022B8 83C402                   add  sp, 2
  4883                                  
  4884                                  ;-488   if(wi==2) prs(" ax, ");
  4885                                  
  4886                                  .dovar1258:
  4887 000022BB A1[3900]                 mov ax, [wi]
  4888 000022BE 83F802                   cmp ax, 2
  4889 000022C1 0F850900                 jne .dovar1259
  4890 000022C5 68[5423]                 push dovar1_11
  4891 000022C8 E82022                   call prs
  4892 000022CB 83C402                   add  sp, 2
  4893                                  
  4894                                  ;-489   if(wi==4) prs(" eax, ");
  4895                                  
  4896                                  .dovar1259:
  4897 000022CE A1[3900]                 mov ax, [wi]
  4898 000022D1 83F804                   cmp ax, 4
  4899 000022D4 0F850900                 jne .dovar1260
  4900 000022D8 68[5A23]                 push dovar1_12
  4901 000022DB E80D22                   call prs
  4902 000022DE 83C402                   add  sp, 2
  4903                                  
  4904                                  ;-490   v(id1);
  4905                                  
  4906                                  .dovar1260:
  4907 000022E1 FF760A                   push word [bp+10]
  4908 000022E4 E888E0                   call v
  4909 000022E7 83C402                   add  sp, 2
  4910                                  
  4911                                  ;-491 }
  4912                                  
  4913                                  
  4914                                  ;-492 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4915                                  
  4916 000022EA C9                       .retndovar1: LEAVE
  4917 000022EB C3                       ret
  4918 000022EC 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4919 000022F5 2C2000             
  4920 000022F8 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4921 00002301 5C6E206D6F76206168-
  4922 0000230A 2C203000           
  4923 0000230E 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4924 00002317 00                 
  4925 00002318 2061782C2000            dovar1_3 db " ax, ",0
  4926 0000231E 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4927 00002327 2C2000             
  4928 0000232A 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4929 00002333 2C203100           
  4930 00002337 5C6E2000                dovar1_6 db "\n ",0
  4931 0000233B 2061782C2000            dovar1_7 db " ax, ",0
  4932 00002341 20616C2C2000            dovar1_8 db " al, ",0
  4933 00002347 202B2062785D00          dovar1_9 db " + bx]",0
  4934 0000234E 20616C2C2000            dovar1_10 db " al, ",0
  4935 00002354 2061782C2000            dovar1_11 db " ax, ",0
  4936 0000235A 206561782C2000          dovar1_12 db " eax, ",0
  4937                                  ENDP
  4938                                  
  4939                                  rterm: PROC
  4940                                  
  4941                                  ;-493   if (istoken(T_CONST)) { prnl(); prs(op); 
  4942                                  
  4943                                  ;Function : rterm, Number of local variables: 5
  4944                                  ;   # type sign width addr used name   list of local variables
  4945                                  ;  200 ptr sign byte   492 NULL op = bp+4
  4946                                  ;  201 var sign word   492 NULL mode = bp-2
  4947                                  ;  202 var sign word   492 NULL opint = bp-4
  4948                                  ;  203 var sign word   492 NULL ixarr = bp-6
  4949                                  ;  204 var sign word   492 NULL id1 = bp-8;
  4950 00002361 C8080000                 ENTER  8,0
  4951 00002365 680101                   push 257
  4952 00002368 E84B20                   call istoken
  4953 0000236B 83C402                   add  sp, 2
  4954 0000236E 08C0                     or  al, al
  4955 00002370 0F845200                 je .rterm261
  4956 00002374 E86621                   call prnl
  4957 00002377 FF7604                   push word [bp+4]
  4958 0000237A E86E21                   call prs
  4959 0000237D 83C402                   add  sp, 2
  4960                                  
  4961                                  ;-494     if (wi==1) prs(" al, ");
  4962                                  
  4963 00002380 A1[3900]                 mov ax, [wi]
  4964 00002383 83F801                   cmp ax, 1
  4965 00002386 0F850900                 jne .rterm262
  4966 0000238A 68[4A24]                 push rterm_0
  4967 0000238D E85B21                   call prs
  4968 00002390 83C402                   add  sp, 2
  4969                                  
  4970                                  ;-495     if (wi==2) prs(" ax, ");
  4971                                  
  4972                                  .rterm262:
  4973 00002393 A1[3900]                 mov ax, [wi]
  4974 00002396 83F802                   cmp ax, 2
  4975 00002399 0F850900                 jne .rterm263
  4976 0000239D 68[5024]                 push rterm_1
  4977 000023A0 E84821                   call prs
  4978 000023A3 83C402                   add  sp, 2
  4979                                  
  4980                                  ;-496     if (wi==4) prs(" eax, ");
  4981                                  
  4982                                  .rterm263:
  4983 000023A6 A1[3900]                 mov ax, [wi]
  4984 000023A9 83F804                   cmp ax, 4
  4985 000023AC 0F850900                 jne .rterm264
  4986 000023B0 68[5624]                 push rterm_2
  4987 000023B3 E83521                   call prs
  4988 000023B6 83C402                   add  sp, 2
  4989                                  
  4990                                  ;-497     prunsign1(lexval); return;}
  4991                                  
  4992                                  .rterm264:
  4993 000023B9 FF36[2E00]               push word [lexval]
  4994 000023BD E88022                   call prunsign1
  4995 000023C0 83C402                   add  sp, 2
  4996 000023C3 E98200                   jmp .retnrterm
  4997                                  
  4998                                  ;-498   mode=typeName(); id1=searchname(); ixarr=0;
  4999                                  
  5000                                  .rterm261:
  5001 000023C6 E861E6                   call typeName
  5002 000023C9 8946FE                   mov [bp-2], ax
  5003 000023CC E88CE5                   call searchname
  5004 000023CF 8946F8                   mov [bp-8], ax
  5005 000023D2 B80000                   mov ax, 0
  5006 000023D5 8946FA                   mov [bp-6], ax
  5007                                  
  5008                                  ;-499   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5009                                  
  5010 000023D8 6A5B                     push 91
  5011 000023DA E8D91F                   call istoken
  5012 000023DD 83C402                   add  sp, 2
  5013 000023E0 08C0                     or  al, al
  5014 000023E2 0F843300                 je .rterm265
  5015 000023E6 E872E5                   call searchname
  5016 000023E9 8946FA                   mov [bp-6], ax
  5017 000023EC 680001                   push 256
  5018 000023EF E8E61F                   call expect
  5019 000023F2 83C402                   add  sp, 2
  5020 000023F5 6A5D                     push 93
  5021 000023F7 E8DE1F                   call expect
  5022 000023FA 83C402                   add  sp, 2
  5023                                  
  5024                                  ;-500     gettypes(ixarr);
  5025                                  
  5026 000023FD FF76FA                   push word [bp-6]
  5027 00002400 E81AE4                   call gettypes
  5028 00002403 83C402                   add  sp, 2
  5029                                  
  5030                                  ;-501     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5031                                  
  5032 00002406 A1[3600]                 mov ax, [widthi]
  5033 00002409 83F802                   cmp ax, 2
  5034 0000240C 0F840900                 je  .rterm266
  5035 00002410 68[5D24]                 push rterm_3
  5036 00002413 E8F423                   call error1
  5037 00002416 83C402                   add  sp, 2
  5038                                  .rterm266:
  5039                                  
  5040                                  ;-502   if (eqstr(symbol,"_AX")) return;
  5041                                  
  5042                                  .rterm265:
  5043 00002419 68[7624]                 push rterm_4
  5044 0000241C 8D062B81                 lea  ax, [symbol]
  5045 00002420 50                       push ax
  5046 00002421 E872DD                   call eqstr
  5047 00002424 83C404                   add  sp, 4
  5048 00002427 08C0                     or  al, al
  5049 00002429 0F840300                 je .rterm267
  5050 0000242D E91800                   jmp .retnrterm
  5051                                  
  5052                                  ;-503   opint=op; dovar1(mode, opint, ixarr, id1);
  5053                                  
  5054                                  .rterm267:
  5055 00002430 8B4604                   mov ax, [bp+4]
  5056 00002433 8946FC                   mov [bp-4], ax
  5057 00002436 FF76F8                   push word [bp-8]
  5058 00002439 FF76FA                   push word [bp-6]
  5059 0000243C FF76FC                   push word [bp-4]
  5060 0000243F FF76FE                   push word [bp-2]
  5061 00002442 E852FD                   call dovar1
  5062 00002445 83C408                   add  sp, 8
  5063                                  
  5064                                  ;-504 }
  5065                                  
  5066                                  
  5067                                  ;-505 int isreg() {
  5068                                  
  5069 00002448 C9                       .retnrterm: LEAVE
  5070 00002449 C3                       ret
  5071 0000244A 20616C2C2000            rterm_0 db " al, ",0
  5072 00002450 2061782C2000            rterm_1 db " ax, ",0
  5073 00002456 206561782C2000          rterm_2 db " eax, ",0
  5074 0000245D 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5075 00002466 78206D75737320696E-
  5076 0000246F 74207365696E00     
  5077 00002476 5F415800                rterm_4 db "_AX",0
  5078                                  ENDP
  5079                                  
  5080                                  isreg: PROC
  5081                                  
  5082                                  ;-506   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5083                                  
  5084 0000247A 68[6726]                 push isreg_0
  5085 0000247D 8D062B81                 lea  ax, [symbol]
  5086 00002481 50                       push ax
  5087 00002482 E811DD                   call eqstr
  5088 00002485 83C404                   add  sp, 4
  5089 00002488 08C0                     or  al, al
  5090 0000248A 0F840C00                 je .isreg268
  5091 0000248E 68[6B26]                 push isreg_1
  5092 00002491 E84202                   call doreg
  5093 00002494 83C402                   add  sp, 2
  5094 00002497 E9C601                   jmp .r1
  5095                                  
  5096                                  ;-507   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5097                                  
  5098                                  .isreg268:
  5099 0000249A 68[6E26]                 push isreg_2
  5100 0000249D 8D062B81                 lea  ax, [symbol]
  5101 000024A1 50                       push ax
  5102 000024A2 E8F1DC                   call eqstr
  5103 000024A5 83C404                   add  sp, 4
  5104 000024A8 08C0                     or  al, al
  5105 000024AA 0F840C00                 je .isreg269
  5106 000024AE 68[7226]                 push isreg_3
  5107 000024B1 E82202                   call doreg
  5108 000024B4 83C402                   add  sp, 2
  5109 000024B7 E9A601                   jmp .r1
  5110                                  
  5111                                  ;-508   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5112                                  
  5113                                  .isreg269:
  5114 000024BA 68[7526]                 push isreg_4
  5115 000024BD 8D062B81                 lea  ax, [symbol]
  5116 000024C1 50                       push ax
  5117 000024C2 E8D1DC                   call eqstr
  5118 000024C5 83C404                   add  sp, 4
  5119 000024C8 08C0                     or  al, al
  5120 000024CA 0F840C00                 je .isreg270
  5121 000024CE 68[7926]                 push isreg_5
  5122 000024D1 E80202                   call doreg
  5123 000024D4 83C402                   add  sp, 2
  5124 000024D7 E98601                   jmp .r1
  5125                                  
  5126                                  ;-509   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5127                                  
  5128                                  .isreg270:
  5129 000024DA 68[7C26]                 push isreg_6
  5130 000024DD 8D062B81                 lea  ax, [symbol]
  5131 000024E1 50                       push ax
  5132 000024E2 E8B1DC                   call eqstr
  5133 000024E5 83C404                   add  sp, 4
  5134 000024E8 08C0                     or  al, al
  5135 000024EA 0F840C00                 je .isreg271
  5136 000024EE 68[8026]                 push isreg_7
  5137 000024F1 E8E201                   call doreg
  5138 000024F4 83C402                   add  sp, 2
  5139 000024F7 E96601                   jmp .r1
  5140                                  
  5141                                  ;-510   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5142                                  
  5143                                  .isreg271:
  5144 000024FA 68[8326]                 push isreg_8
  5145 000024FD 8D062B81                 lea  ax, [symbol]
  5146 00002501 50                       push ax
  5147 00002502 E891DC                   call eqstr
  5148 00002505 83C404                   add  sp, 4
  5149 00002508 08C0                     or  al, al
  5150 0000250A 0F840C00                 je .isreg272
  5151 0000250E 68[8726]                 push isreg_9
  5152 00002511 E8C201                   call doreg
  5153 00002514 83C402                   add  sp, 2
  5154 00002517 E94601                   jmp .r1
  5155                                  
  5156                                  ;-511   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5157                                  
  5158                                  .isreg272:
  5159 0000251A 68[8A26]                 push isreg_10
  5160 0000251D 8D062B81                 lea  ax, [symbol]
  5161 00002521 50                       push ax
  5162 00002522 E871DC                   call eqstr
  5163 00002525 83C404                   add  sp, 4
  5164 00002528 08C0                     or  al, al
  5165 0000252A 0F840C00                 je .isreg273
  5166 0000252E 68[8E26]                 push isreg_11
  5167 00002531 E8A201                   call doreg
  5168 00002534 83C402                   add  sp, 2
  5169 00002537 E92601                   jmp .r1
  5170                                  
  5171                                  ;-512   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5172                                  
  5173                                  .isreg273:
  5174 0000253A 68[9126]                 push isreg_12
  5175 0000253D 8D062B81                 lea  ax, [symbol]
  5176 00002541 50                       push ax
  5177 00002542 E851DC                   call eqstr
  5178 00002545 83C404                   add  sp, 4
  5179 00002548 08C0                     or  al, al
  5180 0000254A 0F840C00                 je .isreg274
  5181 0000254E 68[9526]                 push isreg_13
  5182 00002551 E88201                   call doreg
  5183 00002554 83C402                   add  sp, 2
  5184 00002557 E90601                   jmp .r1
  5185                                  
  5186                                  ;-513   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5187                                  
  5188                                  .isreg274:
  5189 0000255A 68[9826]                 push isreg_14
  5190 0000255D 8D062B81                 lea  ax, [symbol]
  5191 00002561 50                       push ax
  5192 00002562 E831DC                   call eqstr
  5193 00002565 83C404                   add  sp, 4
  5194 00002568 08C0                     or  al, al
  5195 0000256A 0F840C00                 je .isreg275
  5196 0000256E 68[9C26]                 push isreg_15
  5197 00002571 E86201                   call doreg
  5198 00002574 83C402                   add  sp, 2
  5199 00002577 E9E600                   jmp .r1
  5200                                  
  5201                                  ;-514   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5202                                  
  5203                                  .isreg275:
  5204 0000257A 68[9F26]                 push isreg_16
  5205 0000257D 8D062B81                 lea  ax, [symbol]
  5206 00002581 50                       push ax
  5207 00002582 E811DC                   call eqstr
  5208 00002585 83C404                   add  sp, 4
  5209 00002588 08C0                     or  al, al
  5210 0000258A 0F840C00                 je .isreg276
  5211 0000258E 68[A326]                 push isreg_17
  5212 00002591 E84201                   call doreg
  5213 00002594 83C402                   add  sp, 2
  5214 00002597 E9C600                   jmp .r1
  5215                                  
  5216                                  ;-515   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5217                                  
  5218                                  .isreg276:
  5219 0000259A 68[A626]                 push isreg_18
  5220 0000259D 8D062B81                 lea  ax, [symbol]
  5221 000025A1 50                       push ax
  5222 000025A2 E8F1DB                   call eqstr
  5223 000025A5 83C404                   add  sp, 4
  5224 000025A8 08C0                     or  al, al
  5225 000025AA 0F840C00                 je .isreg277
  5226 000025AE 68[AA26]                 push isreg_19
  5227 000025B1 E82201                   call doreg
  5228 000025B4 83C402                   add  sp, 2
  5229 000025B7 E9A600                   jmp .r1
  5230                                  
  5231                                  ;-516   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5232                                  
  5233                                  .isreg277:
  5234 000025BA 68[AD26]                 push isreg_20
  5235 000025BD 8D062B81                 lea  ax, [symbol]
  5236 000025C1 50                       push ax
  5237 000025C2 E8D1DB                   call eqstr
  5238 000025C5 83C404                   add  sp, 4
  5239 000025C8 08C0                     or  al, al
  5240 000025CA 0F840C00                 je .isreg278
  5241 000025CE 68[B126]                 push isreg_21
  5242 000025D1 E80201                   call doreg
  5243 000025D4 83C402                   add  sp, 2
  5244 000025D7 E98600                   jmp .r1
  5245                                  
  5246                                  ;-517   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5247                                  
  5248                                  .isreg278:
  5249 000025DA 68[B426]                 push isreg_22
  5250 000025DD 8D062B81                 lea  ax, [symbol]
  5251 000025E1 50                       push ax
  5252 000025E2 E8B1DB                   call eqstr
  5253 000025E5 83C404                   add  sp, 4
  5254 000025E8 08C0                     or  al, al
  5255 000025EA 0F840C00                 je .isreg279
  5256 000025EE 68[B826]                 push isreg_23
  5257 000025F1 E8E200                   call doreg
  5258 000025F4 83C402                   add  sp, 2
  5259 000025F7 E96600                   jmp .r1
  5260                                  
  5261                                  ;-518   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5262                                  
  5263                                  .isreg279:
  5264 000025FA 68[BB26]                 push isreg_24
  5265 000025FD 8D062B81                 lea  ax, [symbol]
  5266 00002601 50                       push ax
  5267 00002602 E891DB                   call eqstr
  5268 00002605 83C404                   add  sp, 4
  5269 00002608 08C0                     or  al, al
  5270 0000260A 0F840C00                 je .isreg280
  5271 0000260E 68[BF26]                 push isreg_25
  5272 00002611 E8C200                   call doreg
  5273 00002614 83C402                   add  sp, 2
  5274 00002617 E94600                   jmp .r1
  5275                                  
  5276                                  ;-519   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5277                                  
  5278                                  .isreg280:
  5279 0000261A 68[C226]                 push isreg_26
  5280 0000261D 8D062B81                 lea  ax, [symbol]
  5281 00002621 50                       push ax
  5282 00002622 E871DB                   call eqstr
  5283 00002625 83C404                   add  sp, 4
  5284 00002628 08C0                     or  al, al
  5285 0000262A 0F840C00                 je .isreg281
  5286 0000262E 68[C626]                 push isreg_27
  5287 00002631 E8A200                   call doreg
  5288 00002634 83C402                   add  sp, 2
  5289 00002637 E92600                   jmp .r1
  5290                                  
  5291                                  ;-520   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5292                                  
  5293                                  .isreg281:
  5294 0000263A 68[C926]                 push isreg_28
  5295 0000263D 8D062B81                 lea  ax, [symbol]
  5296 00002641 50                       push ax
  5297 00002642 E851DB                   call eqstr
  5298 00002645 83C404                   add  sp, 4
  5299 00002648 08C0                     or  al, al
  5300 0000264A 0F840C00                 je .isreg282
  5301 0000264E 68[D026]                 push isreg_29
  5302 00002651 E88200                   call doreg
  5303 00002654 83C402                   add  sp, 2
  5304 00002657 E90600                   jmp .r1
  5305                                  
  5306                                  ;-521   return 0;   r1: return 1; 
  5307                                  
  5308                                  .isreg282:
  5309 0000265A B80000                   mov ax, 0
  5310 0000265D E90600                   jmp .retnisreg
  5311                                  .r1:
  5312 00002660 B80100                   mov ax, 1
  5313 00002663 E90000                   jmp .retnisreg
  5314                                  
  5315                                  ;-522 }
  5316                                  
  5317                                  
  5318                                  ;-523 int doreg(char *dr) { int i; expect('=');
  5319                                  
  5320                                   .retnisreg:
  5321 00002666 C3                       ret
  5322 00002667 5F414800                isreg_0 db "_AH",0
  5323 0000266B 616800                  isreg_1 db "ah",0
  5324 0000266E 5F414C00                isreg_2 db "_AL",0
  5325 00002672 616C00                  isreg_3 db "al",0
  5326 00002675 5F415800                isreg_4 db "_AX",0
  5327 00002679 617800                  isreg_5 db "ax",0
  5328 0000267C 5F424800                isreg_6 db "_BH",0
  5329 00002680 626800                  isreg_7 db "bh",0
  5330 00002683 5F424C00                isreg_8 db "_BL",0
  5331 00002687 626C00                  isreg_9 db "bl",0
  5332 0000268A 5F425800                isreg_10 db "_BX",0
  5333 0000268E 627800                  isreg_11 db "bx",0
  5334 00002691 5F434800                isreg_12 db "_CH",0
  5335 00002695 636800                  isreg_13 db "ch",0
  5336 00002698 5F434C00                isreg_14 db "_CL",0
  5337 0000269C 636C00                  isreg_15 db "cl",0
  5338 0000269F 5F435800                isreg_16 db "_CX",0
  5339 000026A3 637800                  isreg_17 db "cx",0
  5340 000026A6 5F444800                isreg_18 db "_DH",0
  5341 000026AA 646800                  isreg_19 db "dh",0
  5342 000026AD 5F444C00                isreg_20 db "_DL",0
  5343 000026B1 646C00                  isreg_21 db "dl",0
  5344 000026B4 5F445800                isreg_22 db "_DX",0
  5345 000026B8 647800                  isreg_23 db "dx",0
  5346 000026BB 5F534900                isreg_24 db "_SI",0
  5347 000026BF 736900                  isreg_25 db "si",0
  5348 000026C2 5F444900                isreg_26 db "_DI",0
  5349 000026C6 646900                  isreg_27 db "di",0
  5350 000026C9 5F464C41475300          isreg_28 db "_FLAGS",0
  5351 000026D0 666C61677300            isreg_29 db "flags",0
  5352                                  ENDP
  5353                                  
  5354                                  doreg: PROC
  5355                                  ;Function : doreg, Number of local variables: 2
  5356                                  ;   # type sign width addr used name   list of local variables
  5357                                  ;  200 ptr sign byte   523 NULL dr = bp+4
  5358                                  ;  201 var sign word   523 NULL i = bp-2;
  5359 000026D6 C8020000                 ENTER  2,0
  5360 000026DA 6A3D                     push 61
  5361 000026DC E8F91C                   call expect
  5362 000026DF 83C402                   add  sp, 2
  5363                                  
  5364                                  ;-524   prs("\n mov  "); prs(dr); prs(", ");
  5365                                  
  5366 000026E2 68[4527]                 push doreg_0
  5367 000026E5 E8031E                   call prs
  5368 000026E8 83C402                   add  sp, 2
  5369 000026EB FF7604                   push word [bp+4]
  5370 000026EE E8FA1D                   call prs
  5371 000026F1 83C402                   add  sp, 2
  5372 000026F4 68[4E27]                 push doreg_1
  5373 000026F7 E8F11D                   call prs
  5374 000026FA 83C402                   add  sp, 2
  5375                                  
  5376                                  ;-525        if (istoken(T_CONST)) prunsign1(lexval);
  5377                                  
  5378 000026FD 680101                   push 257
  5379 00002700 E8B31C                   call istoken
  5380 00002703 83C402                   add  sp, 2
  5381 00002706 08C0                     or  al, al
  5382 00002708 0F840D00                 je .doreg283
  5383 0000270C FF36[2E00]               push word [lexval]
  5384 00002710 E82D1F                   call prunsign1
  5385 00002713 83C402                   add  sp, 2
  5386                                  
  5387                                  ;-526   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5388                                  
  5389 00002716 E92A00                   jmp .doreg284
  5390                                  .doreg283:
  5391 00002719 680001                   push 256
  5392 0000271C E8971C                   call istoken
  5393 0000271F 83C402                   add  sp, 2
  5394 00002722 08C0                     or  al, al
  5395 00002724 0F841200                 je .doreg285
  5396 00002728 E830E2                   call searchname
  5397 0000272B 8946FE                   mov [bp-2], ax
  5398 0000272E FF76FE                   push word [bp-2]
  5399 00002731 E83BDC                   call v
  5400 00002734 83C402                   add  sp, 2
  5401                                  
  5402                                  ;-527   else error1("only number or var allowed"); }
  5403                                  
  5404 00002737 E90900                   jmp .doreg286
  5405                                  .doreg285:
  5406 0000273A 68[5127]                 push doreg_2
  5407 0000273D E8CA20                   call error1
  5408 00002740 83C402                   add  sp, 2
  5409                                  .doreg286:
  5410                                  .doreg284:
  5411                                  
  5412                                  ;-528 
  5413                                  
  5414                                  
  5415                                  ;-529 int doassign(int mode, int i, int ixarr, int ixconst) {
  5416 00002743 C9                       LEAVE
  5417 00002744 C3                       ret
  5418 00002745 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5419 0000274E 2C2000                  doreg_1 db ", ",0
  5420 00002751 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5421 0000275A 6572206F7220766172-
  5422 00002763 20616C6C6F77656400 
  5423                                  ENDP
  5424                                  
  5425                                  doassign: PROC
  5426                                  
  5427                                  ;-530   gettypes(i);
  5428                                  
  5429                                  ;Function : doassign, Number of local variables: 4
  5430                                  ;   # type sign width addr used name   list of local variables
  5431                                  ;  200 var sign word   529 NULL mode = bp+4
  5432                                  ;  201 var sign word   529 NULL i = bp+6
  5433                                  ;  202 var sign word   529 NULL ixarr = bp+8
  5434                                  ;  203 var sign word   529 NULL ixconst = bp+10;
  5435 0000276C C8000000                 ENTER  0,0
  5436 00002770 FF7606                   push word [bp+6]
  5437 00002773 E8A7E0                   call gettypes
  5438 00002776 83C402                   add  sp, 2
  5439                                  
  5440                                  ;-531   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5441                                  
  5442 00002779 8B4604                   mov ax, [bp+4]
  5443 0000277C 83F801                   cmp ax, 1
  5444 0000277F 0F853400                 jne .doassign287
  5445 00002783 68[0929]                 push doassign_0
  5446 00002786 E8621D                   call prs
  5447 00002789 83C402                   add  sp, 2
  5448 0000278C FF7606                   push word [bp+6]
  5449 0000278F E8DDDB                   call v
  5450 00002792 83C402                   add  sp, 2
  5451                                  
  5452                                  ;-532     if (widthi == 2) prs("\n mov  [bx], ax");
  5453                                  
  5454 00002795 A1[3600]                 mov ax, [widthi]
  5455 00002798 83F802                   cmp ax, 2
  5456 0000279B 0F850C00                 jne .doassign288
  5457 0000279F 68[1629]                 push doassign_1
  5458 000027A2 E8461D                   call prs
  5459 000027A5 83C402                   add  sp, 2
  5460                                  
  5461                                  ;-533     else  prs("\n mov  [bx], al"); return;}
  5462                                  
  5463 000027A8 E90900                   jmp .doassign289
  5464                                  .doassign288:
  5465 000027AB 68[2729]                 push doassign_2
  5466 000027AE E83A1D                   call prs
  5467 000027B1 83C402                   add  sp, 2
  5468                                  .doassign289:
  5469 000027B4 E95001                   jmp .retndoassign
  5470                                  
  5471                                  ;-534   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5472                                  
  5473                                  .doassign287:
  5474 000027B7 8B4604                   mov ax, [bp+4]
  5475 000027BA 83F802                   cmp ax, 2
  5476 000027BD 0F851E00                 jne .doassign290
  5477 000027C1 68[3829]                 push doassign_3
  5478 000027C4 E8241D                   call prs
  5479 000027C7 83C402                   add  sp, 2
  5480 000027CA FF7606                   push word [bp+6]
  5481 000027CD E890DB                   call a
  5482 000027D0 83C402                   add  sp, 2
  5483 000027D3 68[4129]                 push doassign_4
  5484 000027D6 E8121D                   call prs
  5485 000027D9 83C402                   add  sp, 2
  5486 000027DC E92801                   jmp .retndoassign
  5487                                  
  5488                                  ;-535   if (ixarr) {  prs("\n mov bx, ");
  5489                                  
  5490                                  .doassign290:
  5491 000027DF 8B4608                   mov ax, [bp+8]
  5492 000027E2 08C0                     or  al, al
  5493 000027E4 0F846E00                 je .doassign291
  5494 000027E8 68[4629]                 push doassign_5
  5495 000027EB E8FD1C                   call prs
  5496 000027EE 83C402                   add  sp, 2
  5497                                  
  5498                                  ;-536     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5499                                  
  5500 000027F1 8B460A                   mov ax, [bp+10]
  5501 000027F4 08C0                     or  al, al
  5502 000027F6 0F840C00                 je .doassign292
  5503 000027FA FF7608                   push word [bp+8]
  5504 000027FD E8401E                   call prunsign1
  5505 00002800 83C402                   add  sp, 2
  5506 00002803 E90900                   jmp .doassign293
  5507                                  .doassign292:
  5508 00002806 FF7608                   push word [bp+8]
  5509 00002809 E863DB                   call v
  5510 0000280C 83C402                   add  sp, 2
  5511                                  
  5512                                  ;-537     if (wi==2) prs("\n shl bx, 1");
  5513                                  
  5514                                  .doassign293:
  5515 0000280F A1[3900]                 mov ax, [wi]
  5516 00002812 83F802                   cmp ax, 2
  5517 00002815 0F850900                 jne .doassign294
  5518 00002819 68[5229]                 push doassign_6
  5519 0000281C E8CC1C                   call prs
  5520 0000281F 83C402                   add  sp, 2
  5521                                  
  5522                                  ;-538     prs("\n mov ["); printName(i);
  5523                                  
  5524                                  .doassign294:
  5525 00002822 68[5F29]                 push doassign_7
  5526 00002825 E8C31C                   call prs
  5527 00002828 83C402                   add  sp, 2
  5528 0000282B FF7606                   push word [bp+6]
  5529 0000282E E8C6E0                   call printName
  5530 00002831 83C402                   add  sp, 2
  5531                                  
  5532                                  ;-539     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5533                                  
  5534 00002834 A1[3900]                 mov ax, [wi]
  5535 00002837 83F802                   cmp ax, 2
  5536 0000283A 0F850C00                 jne .doassign295
  5537 0000283E 68[6829]                 push doassign_8
  5538 00002841 E8A71C                   call prs
  5539 00002844 83C402                   add  sp, 2
  5540 00002847 E90900                   jmp .doassign296
  5541                                  .doassign295:
  5542 0000284A 68[7129]                 push doassign_9
  5543 0000284D E89B1C                   call prs
  5544 00002850 83C402                   add  sp, 2
  5545                                  .doassign296:
  5546 00002853 E9B100                   jmp .retndoassign
  5547                                  
  5548                                  ;-540   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5549                                  
  5550                                  .doassign291:
  5551 00002856 A1[3900]                 mov ax, [wi]
  5552 00002859 83F801                   cmp ax, 1
  5553 0000285C 0F853100                 jne .doassign297
  5554 00002860 68[7A29]                 push doassign_10
  5555 00002863 E8851C                   call prs
  5556 00002866 83C402                   add  sp, 2
  5557 00002869 8B4606                   mov ax, [bp+6]
  5558 0000286C 3DC800                   cmp ax, 200
  5559 0000286F 0F8D0900                 jge .doassign298
  5560 00002873 68[8229]                 push doassign_11
  5561 00002876 E8721C                   call prs
  5562 00002879 83C402                   add  sp, 2
  5563                                  
  5564                                  ;-541     } v(i); prs(", al"); return; }
  5565                                  
  5566                                  .doassign298:
  5567 0000287C FF7606                   push word [bp+6]
  5568 0000287F E8EDDA                   call v
  5569 00002882 83C402                   add  sp, 2
  5570 00002885 68[8829]                 push doassign_12
  5571 00002888 E8601C                   call prs
  5572 0000288B 83C402                   add  sp, 2
  5573 0000288E E97600                   jmp .retndoassign
  5574                                  
  5575                                  ;-542   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5576                                  
  5577                                  .doassign297:
  5578 00002891 A1[3900]                 mov ax, [wi]
  5579 00002894 83F802                   cmp ax, 2
  5580 00002897 0F853100                 jne .doassign299
  5581 0000289B 68[8D29]                 push doassign_13
  5582 0000289E E84A1C                   call prs
  5583 000028A1 83C402                   add  sp, 2
  5584 000028A4 8B4606                   mov ax, [bp+6]
  5585 000028A7 3DC800                   cmp ax, 200
  5586 000028AA 0F8D0900                 jge .doassign300
  5587 000028AE 68[9529]                 push doassign_14
  5588 000028B1 E8371C                   call prs
  5589 000028B4 83C402                   add  sp, 2
  5590                                  
  5591                                  ;-543     } v(i); prs(", ax"); return; }
  5592                                  
  5593                                  .doassign300:
  5594 000028B7 FF7606                   push word [bp+6]
  5595 000028BA E8B2DA                   call v
  5596 000028BD 83C402                   add  sp, 2
  5597 000028C0 68[9B29]                 push doassign_15
  5598 000028C3 E8251C                   call prs
  5599 000028C6 83C402                   add  sp, 2
  5600 000028C9 E93B00                   jmp .retndoassign
  5601                                  
  5602                                  ;-544   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5603                                  
  5604                                  .doassign299:
  5605 000028CC A1[3900]                 mov ax, [wi]
  5606 000028CF 83F804                   cmp ax, 4
  5607 000028D2 0F853100                 jne .doassign301
  5608 000028D6 68[A029]                 push doassign_16
  5609 000028D9 E80F1C                   call prs
  5610 000028DC 83C402                   add  sp, 2
  5611 000028DF 8B4606                   mov ax, [bp+6]
  5612 000028E2 3DC800                   cmp ax, 200
  5613 000028E5 0F8D0900                 jge .doassign302
  5614 000028E9 68[A829]                 push doassign_17
  5615 000028EC E8FC1B                   call prs
  5616 000028EF 83C402                   add  sp, 2
  5617                                  
  5618                                  ;-545     } v(i); prs(", eax"); return; }
  5619                                  
  5620                                  .doassign302:
  5621 000028F2 FF7606                   push word [bp+6]
  5622 000028F5 E877DA                   call v
  5623 000028F8 83C402                   add  sp, 2
  5624 000028FB 68[AF29]                 push doassign_18
  5625 000028FE E8EA1B                   call prs
  5626 00002901 83C402                   add  sp, 2
  5627 00002904 E90000                   jmp .retndoassign
  5628                                  
  5629                                  ;-546 }
  5630                                  
  5631                                  .doassign301:
  5632                                  
  5633                                  ;-547 int domul(int ids) {
  5634                                  
  5635 00002907 C9                       .retndoassign: LEAVE
  5636 00002908 C3                       ret
  5637 00002909 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5638 00002912 782C2000           
  5639 00002916 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5640 0000291F 62785D2C20617800   
  5641 00002927 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5642 00002930 62785D2C20616C00   
  5643 00002938 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5644 00002941 2C20617800              doassign_4 db ", ax",0
  5645 00002946 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5646 0000294F 2C2000             
  5647 00002952 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5648 0000295B 2C203100           
  5649 0000295F 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5650 00002968 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5651 00002971 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5652 0000297A 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5653 00002982 627974652000            doassign_11 db "byte ",0
  5654 00002988 2C20616C00              doassign_12 db ", al",0
  5655 0000298D 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5656 00002995 776F72642000            doassign_14 db "word ",0
  5657 0000299B 2C20617800              doassign_15 db ", ax",0
  5658 000029A0 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5659 000029A8 64776F72642000          doassign_17 db "dword ",0
  5660 000029AF 2C2065617800            doassign_18 db ", eax",0
  5661                                  ENDP
  5662                                  
  5663                                  domul: PROC
  5664                                  
  5665                                  ;-548   if (ids) rterm("imul"); else {
  5666                                  
  5667                                  ;Function : domul, Number of local variables: 1
  5668                                  ;   # type sign width addr used name   list of local variables
  5669                                  ;  200 var sign word   547 NULL ids = bp+4;
  5670 000029B5 C8000000                 ENTER  0,0
  5671 000029B9 8B4604                   mov ax, [bp+4]
  5672 000029BC 08C0                     or  al, al
  5673 000029BE 0F840C00                 je .domul303
  5674 000029C2 68[072A]                 push domul_0
  5675 000029C5 E899F9                   call rterm
  5676 000029C8 83C402                   add  sp, 2
  5677 000029CB E93700                   jmp .domul304
  5678                                  .domul303:
  5679                                  
  5680                                  ;-549   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5681                                  
  5682 000029CE 680101                   push 257
  5683 000029D1 E8E219                   call istoken
  5684 000029D4 83C402                   add  sp, 2
  5685 000029D7 08C0                     or  al, al
  5686 000029D9 0F841F00                 je .domul305
  5687 000029DD 68[0C2A]                 push domul_1
  5688 000029E0 E8081B                   call prs
  5689 000029E3 83C402                   add  sp, 2
  5690 000029E6 FF36[2E00]               push word [lexval]
  5691 000029EA E8531C                   call prunsign1
  5692 000029ED 83C402                   add  sp, 2
  5693 000029F0 68[182A]                 push domul_2
  5694 000029F3 E8F51A                   call prs
  5695 000029F6 83C402                   add  sp, 2
  5696                                  
  5697                                  ;-550   else error1("with MUL only const number as multiplicator allowed"); } }
  5698                                  
  5699 000029F9 E90900                   jmp .domul306
  5700                                  .domul305:
  5701 000029FC 68[222A]                 push domul_3
  5702 000029FF E8081E                   call error1
  5703 00002A02 83C402                   add  sp, 2
  5704                                  .domul306:
  5705                                  .domul304:
  5706                                  
  5707                                  ;-551 int doidiv(int ids) { int mode; int id1;
  5708 00002A05 C9                       LEAVE
  5709 00002A06 C3                       ret
  5710 00002A07 696D756C00              domul_0 db "imul",0
  5711 00002A0C 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5712 00002A15 2C2000             
  5713 00002A18 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5714 00002A21 00                 
  5715 00002A22 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5716 00002A2B 6F6E6C7920636F6E73-
  5717 00002A34 74206E756D62657220-
  5718 00002A3D 6173206D756C746970-
  5719 00002A46 6C696361746F722061-
  5720 00002A4F 6C6C6F77656400     
  5721                                  ENDP
  5722                                  
  5723                                  doidiv: PROC
  5724                                  
  5725                                  ;-552   if (istoken(T_CONST)) {
  5726                                  
  5727                                  ;Function : doidiv, Number of local variables: 3
  5728                                  ;   # type sign width addr used name   list of local variables
  5729                                  ;  200 var sign word   551 NULL ids = bp+4
  5730                                  ;  201 var sign word   551 NULL mode = bp-2
  5731                                  ;  202 var sign word   551 NULL id1 = bp-4;
  5732 00002A56 C8040000                 ENTER  4,0
  5733 00002A5A 680101                   push 257
  5734 00002A5D E85619                   call istoken
  5735 00002A60 83C402                   add  sp, 2
  5736 00002A63 08C0                     or  al, al
  5737 00002A65 0F843400                 je .doidiv307
  5738                                  
  5739                                  ;-553     prs("\n mov bx, "); prunsign1(lexval);
  5740                                  
  5741 00002A69 68[1B2B]                 push doidiv_0
  5742 00002A6C E87C1A                   call prs
  5743 00002A6F 83C402                   add  sp, 2
  5744 00002A72 FF36[2E00]               push word [lexval]
  5745 00002A76 E8C71B                   call prunsign1
  5746 00002A79 83C402                   add  sp, 2
  5747                                  
  5748                                  ;-554     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5749                                  
  5750 00002A7C 8B4604                   mov ax, [bp+4]
  5751 00002A7F 08C0                     or  al, al
  5752 00002A81 0F840C00                 je .doidiv308
  5753 00002A85 68[272B]                 push doidiv_1
  5754 00002A88 E8601A                   call prs
  5755 00002A8B 83C402                   add  sp, 2
  5756 00002A8E E90900                   jmp .doidiv309
  5757                                  .doidiv308:
  5758 00002A91 68[382B]                 push doidiv_2
  5759 00002A94 E8541A                   call prs
  5760 00002A97 83C402                   add  sp, 2
  5761                                  .doidiv309:
  5762                                  
  5763                                  ;-555   else {
  5764                                  
  5765 00002A9A E97C00                   jmp .doidiv310
  5766                                  .doidiv307:
  5767                                  
  5768                                  ;-556     mode=typeName(); id1=searchname();
  5769                                  
  5770 00002A9D E88ADF                   call typeName
  5771 00002AA0 8946FE                   mov [bp-2], ax
  5772 00002AA3 E8B5DE                   call searchname
  5773 00002AA6 8946FC                   mov [bp-4], ax
  5774                                  
  5775                                  ;-557     if (mode) error1("only const number or int as divisor allowed");
  5776                                  
  5777 00002AA9 8B46FE                   mov ax, [bp-2]
  5778 00002AAC 08C0                     or  al, al
  5779 00002AAE 0F840900                 je .doidiv311
  5780 00002AB2 68[4E2B]                 push doidiv_3
  5781 00002AB5 E8521D                   call error1
  5782 00002AB8 83C402                   add  sp, 2
  5783                                  
  5784                                  ;-558     gettypes(id1);
  5785                                  
  5786                                  .doidiv311:
  5787 00002ABB FF76FC                   push word [bp-4]
  5788 00002ABE E85CDD                   call gettypes
  5789 00002AC1 83C402                   add  sp, 2
  5790                                  
  5791                                  ;-559     if (typei) error1("only int as simple var divisor allowed");
  5792                                  
  5793 00002AC4 A1[3000]                 mov ax, [typei]
  5794 00002AC7 08C0                     or  al, al
  5795 00002AC9 0F840900                 je .doidiv312
  5796 00002ACD 68[7A2B]                 push doidiv_4
  5797 00002AD0 E8371D                   call error1
  5798 00002AD3 83C402                   add  sp, 2
  5799                                  
  5800                                  ;-560     if (wi!=2) error1("only int, no byte as divisor allowed");
  5801                                  
  5802                                  .doidiv312:
  5803 00002AD6 A1[3900]                 mov ax, [wi]
  5804 00002AD9 83F802                   cmp ax, 2
  5805 00002ADC 0F840900                 je  .doidiv313
  5806 00002AE0 68[A12B]                 push doidiv_5
  5807 00002AE3 E8241D                   call error1
  5808 00002AE6 83C402                   add  sp, 2
  5809                                  
  5810                                  ;-561     prs("\n mov bx, "); v(id1);
  5811                                  
  5812                                  .doidiv313:
  5813 00002AE9 68[C62B]                 push doidiv_6
  5814 00002AEC E8FC19                   call prs
  5815 00002AEF 83C402                   add  sp, 2
  5816 00002AF2 FF76FC                   push word [bp-4]
  5817 00002AF5 E877D8                   call v
  5818 00002AF8 83C402                   add  sp, 2
  5819                                  
  5820                                  ;-562     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5821                                  
  5822 00002AFB 8B4604                   mov ax, [bp+4]
  5823 00002AFE 08C0                     or  al, al
  5824 00002B00 0F840C00                 je .doidiv314
  5825 00002B04 68[D22B]                 push doidiv_7
  5826 00002B07 E8E119                   call prs
  5827 00002B0A 83C402                   add  sp, 2
  5828 00002B0D E90900                   jmp .doidiv315
  5829                                  .doidiv314:
  5830 00002B10 68[E32B]                 push doidiv_8
  5831 00002B13 E8D519                   call prs
  5832 00002B16 83C402                   add  sp, 2
  5833                                  .doidiv315:
  5834                                  
  5835                                  ;-563 }
  5836                                  
  5837                                  .doidiv310:
  5838                                  
  5839                                  ;-564 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5840 00002B19 C9                       LEAVE
  5841 00002B1A C3                       ret
  5842 00002B1B 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5843 00002B24 2C2000             
  5844 00002B27 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5845 00002B30 6964697620627800   
  5846 00002B38 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5847 00002B41 2C20305C6E20646976-
  5848 00002B4A 20627800           
  5849 00002B4E 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5850 00002B57 74206E756D62657220-
  5851 00002B60 6F7220696E74206173-
  5852 00002B69 2064697669736F7220-
  5853 00002B72 616C6C6F77656400   
  5854 00002B7A 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5855 00002B83 61732073696D706C65-
  5856 00002B8C 207661722064697669-
  5857 00002B95 736F7220616C6C6F77-
  5858 00002B9E 656400             
  5859 00002BA1 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5860 00002BAA 206E6F206279746520-
  5861 00002BB3 61732064697669736F-
  5862 00002BBC 7220616C6C6F776564-
  5863 00002BC5 00                 
  5864 00002BC6 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5865 00002BCF 2C2000             
  5866 00002BD2 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5867 00002BDB 6964697620627800   
  5868 00002BE3 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5869 00002BEC 2C20305C6E20646976-
  5870 00002BF5 20627800           
  5871                                  ENDP
  5872                                  
  5873                                  domod: PROC
  5874                                  ;Function : domod, Number of local variables: 1
  5875                                  ;   # type sign width addr used name   list of local variables
  5876                                  ;  200 var sign word   564 NULL ids = bp+4;
  5877 00002BF9 C8000000                 ENTER  0,0
  5878 00002BFD FF7604                   push word [bp+4]
  5879 00002C00 E853FE                   call doidiv
  5880 00002C03 83C402                   add  sp, 2
  5881 00002C06 68[112C]                 push domod_0
  5882 00002C09 E8DF18                   call prs
  5883 00002C0C 83C402                   add  sp, 2
  5884                                  
  5885                                  ;-565 
  5886                                  
  5887                                  
  5888                                  ;-566 int docalltype[10]; int docallvalue[10];
  5889 00002C0F C9                       LEAVE
  5890 00002C10 C3                       ret
  5891 00002C11 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5892 00002C1A 2C20647800         
  5893                                  ENDP
  5894                                  section .bss
  5895                                  absolute 53411
  5896 0000D0A3 <res 00000014>          docalltype resw 10
  5897                                  section .text
  5898                                  section .bss
  5899                                  absolute 53431
  5900 0000D0B7 <res 00000014>          docallvalue resw 10
  5901                                  section .text
  5902                                  
  5903                                  ;-567 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5904                                  
  5905                                  section .bss
  5906                                  absolute 53451
  5907 0000D0CB <res 00000011>          procname resb 17
  5908                                  section .text
  5909                                  
  5910                                  ;-568 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5911                                  
  5912                                  
  5913                                  docall1: PROC
  5914                                  
  5915                                  ;-569   narg=0;  sz32=0;
  5916                                  
  5917                                  ;Function : docall1, Number of local variables: 5
  5918                                  ;   # type sign width addr used name   list of local variables
  5919                                  ;  200 var sign word   568 NULL i = bp-2
  5920                                  ;  201 var sign word   568 NULL narg = bp-4
  5921                                  ;  202 var sign word   568 NULL t0 = bp-6
  5922                                  ;  203 var sign word   568 NULL n0 = bp-8
  5923                                  ;  204 var sign word   568 NULL sz32 = bp-10;
  5924 00002C1F C80A0000                 ENTER  10,0
  5925 00002C23 B80000                   mov ax, 0
  5926 00002C26 8946FC                   mov [bp-4], ax
  5927 00002C29 B80000                   mov ax, 0
  5928 00002C2C 8946F6                   mov [bp-10], ax
  5929                                  
  5930                                  ;-570   checknamelen();
  5931                                  
  5932 00002C2F E870D7                   call checknamelen
  5933                                  
  5934                                  ;-571   strcpy(&procname, symbol);
  5935                                  
  5936 00002C32 8D062B81                 lea  ax, [symbol]
  5937 00002C36 50                       push ax
  5938 00002C37 8D06CBD0                 lea  ax, [procname]
  5939 00002C3B 50                       push ax
  5940 00002C3C E827D5                   call strcpy
  5941 00002C3F 83C404                   add  sp, 4
  5942                                  
  5943                                  ;-572   storecall();
  5944                                  
  5945 00002C42 E8E6DE                   call storecall
  5946                                  
  5947                                  ;-573   expect('(');
  5948                                  
  5949 00002C45 6A28                     push 40
  5950 00002C47 E88E17                   call expect
  5951 00002C4A 83C402                   add  sp, 2
  5952                                  
  5953                                  ;-574 	if (istoken(')') ==0 ) {
  5954                                  
  5955 00002C4D 6A29                     push 41
  5956 00002C4F E86417                   call istoken
  5957 00002C52 83C402                   add  sp, 2
  5958 00002C55 83F800                   cmp ax, 0
  5959 00002C58 0F857802                 jne .docall1316
  5960                                  
  5961                                  ;-575 	  do { narg++;
  5962                                  
  5963                                  .docall1317:
  5964 00002C5C FF46FC                   inc  word[bp-4]
  5965                                  
  5966                                  ;-576 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5967                                  
  5968 00002C5F 8B46FC                   mov ax, [bp-4]
  5969 00002C62 83F809                   cmp ax, 9
  5970 00002C65 0F8E0900                 jle .docall1318
  5971 00002C69 68[182F]                 push docall1_0
  5972 00002C6C E89B1B                   call error1
  5973 00002C6F 83C402                   add  sp, 2
  5974                                  .docall1318:
  5975 00002C72 B80000                   mov ax, 0
  5976 00002C75 8946FA                   mov [bp-6], ax
  5977                                  
  5978                                  ;-577       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5979                                  
  5980 00002C78 680101                   push 257
  5981 00002C7B E83817                   call istoken
  5982 00002C7E 83C402                   add  sp, 2
  5983 00002C81 08C0                     or  al, al
  5984 00002C83 0F840C00                 je .docall1319
  5985 00002C87 B80100                   mov ax, 1
  5986 00002C8A 8946FA                   mov [bp-6], ax
  5987 00002C8D A1[2E00]                 mov ax, [lexval]
  5988 00002C90 8946F8                   mov [bp-8], ax
  5989                                  
  5990                                  ;-578       if(istoken(T_STRING)){t0=2; n0=nconst;
  5991                                  
  5992                                  .docall1319:
  5993 00002C93 680201                   push 258
  5994 00002C96 E81D17                   call istoken
  5995 00002C99 83C402                   add  sp, 2
  5996 00002C9C 08C0                     or  al, al
  5997 00002C9E 0F846300                 je .docall1320
  5998 00002CA2 B80200                   mov ax, 2
  5999 00002CA5 8946FA                   mov [bp-6], ax
  6000 00002CA8 A1[2400]                 mov ax, [nconst]
  6001 00002CAB 8946F8                   mov [bp-8], ax
  6002                                  
  6003                                  ;-579         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6004                                  
  6005 00002CAE 68[2A2F]                 push docall1_1
  6006 00002CB1 E8A217                   call eprs
  6007 00002CB4 83C402                   add  sp, 2
  6008 00002CB7 8D06AB81                 lea  ax, [fname]
  6009 00002CBB 50                       push ax
  6010 00002CBC E89717                   call eprs
  6011 00002CBF 83C402                   add  sp, 2
  6012 00002CC2 6A5F                     push 95
  6013 00002CC4 E87C17                   call eprc
  6014 00002CC7 83C402                   add  sp, 2
  6015 00002CCA FF36[2400]               push word [nconst]
  6016 00002CCE E8AE18                   call eprnum
  6017 00002CD1 83C402                   add  sp, 2
  6018 00002CD4 68[2D2F]                 push docall1_2
  6019 00002CD7 E87C17                   call eprs
  6020 00002CDA 83C402                   add  sp, 2
  6021                                  
  6022                                  ;-580         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6023                                  
  6024 00002CDD 6A22                     push 34
  6025 00002CDF E86117                   call eprc
  6026 00002CE2 83C402                   add  sp, 2
  6027 00002CE5 8D062B81                 lea  ax, [symbol]
  6028 00002CE9 50                       push ax
  6029 00002CEA E86917                   call eprs
  6030 00002CED 83C402                   add  sp, 2
  6031 00002CF0 6A22                     push 34
  6032 00002CF2 E84E17                   call eprc
  6033 00002CF5 83C402                   add  sp, 2
  6034 00002CF8 68[322F]                 push docall1_3
  6035 00002CFB E85817                   call eprs
  6036 00002CFE 83C402                   add  sp, 2
  6037 00002D01 FF06[2400]               inc  word[nconst]
  6038                                  
  6039                                  ;-581       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6040                                  
  6041                                  .docall1320:
  6042 00002D05 6A26                     push 38
  6043 00002D07 E8AC16                   call istoken
  6044 00002D0A 83C402                   add  sp, 2
  6045 00002D0D 08C0                     or  al, al
  6046 00002D0F 0F840F00                 je .docall1321
  6047 00002D13 B80300                   mov ax, 3
  6048 00002D16 8946FA                   mov [bp-6], ax
  6049 00002D19 E8E7DD                   call name1
  6050 00002D1C E83CDC                   call searchname
  6051 00002D1F 8946F8                   mov [bp-8], ax
  6052                                  
  6053                                  ;-582       if(istoken(T_NAME))  { n0=checkreg();
  6054                                  
  6055                                  .docall1321:
  6056 00002D22 680001                   push 256
  6057 00002D25 E88E16                   call istoken
  6058 00002D28 83C402                   add  sp, 2
  6059 00002D2B 08C0                     or  al, al
  6060 00002D2D 0F844800                 je .docall1322
  6061 00002D31 E8DFEA                   call checkreg
  6062 00002D34 8946F8                   mov [bp-8], ax
  6063                                  
  6064                                  ;-583         if (n0) t0=5;
  6065                                  
  6066 00002D37 8B46F8                   mov ax, [bp-8]
  6067 00002D3A 08C0                     or  al, al
  6068 00002D3C 0F840900                 je .docall1323
  6069 00002D40 B80500                   mov ax, 5
  6070 00002D43 8946FA                   mov [bp-6], ax
  6071                                  
  6072                                  ;-584         else {t0=4; n0=searchname();
  6073                                  
  6074 00002D46 E93000                   jmp .docall1324
  6075                                  .docall1323:
  6076 00002D49 B80400                   mov ax, 4
  6077 00002D4C 8946FA                   mov [bp-6], ax
  6078 00002D4F E809DC                   call searchname
  6079 00002D52 8946F8                   mov [bp-8], ax
  6080                                  
  6081                                  ;-585           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6082                                  
  6083 00002D55 B8B782                   mov ax, GType
  6084 00002D58 A3[6C00]                 mov word [p1], ax
  6085 00002D5B A1[6C00]                 mov ax, [p1]
  6086 00002D5E 0346F8                   add ax, [bp-8]
  6087 00002D61 A3[6C00]                 mov word [p1], ax
  6088 00002D64 8B1E[6C00]               mov bx, [p1]
  6089 00002D68 8A07                     mov al, [bx]
  6090 00002D6A B400                     mov ah, 0
  6091 00002D6C 83F826                   cmp ax, 38
  6092 00002D6F 0F850600                 jne .docall1325
  6093 00002D73 B80300                   mov ax, 3
  6094 00002D76 8946FA                   mov [bp-6], ax
  6095                                  .docall1325:
  6096                                  .docall1324:
  6097                                  
  6098                                  ;-586       if (t0==0) error1("parameter not recognized (no * allowed)");
  6099                                  
  6100                                  .docall1322:
  6101 00002D79 8B46FA                   mov ax, [bp-6]
  6102 00002D7C 83F800                   cmp ax, 0
  6103 00002D7F 0F850900                 jne .docall1326
  6104 00002D83 68[352F]                 push docall1_4
  6105 00002D86 E8811A                   call error1
  6106 00002D89 83C402                   add  sp, 2
  6107                                  
  6108                                  ;-587       docalltype [narg] = t0;
  6109                                  
  6110                                  .docall1326:
  6111 00002D8C 8B46FA                   mov ax, [bp-6]
  6112 00002D8F 8B5EFC                   mov bx, [bp-4]
  6113 00002D92 D1E3                     shl bx, 1
  6114 00002D94 8987A3D0                 mov [docalltype+bx], ax
  6115                                  
  6116                                  ;-588       docallvalue[narg] = n0;
  6117                                  
  6118 00002D98 8B46F8                   mov ax, [bp-8]
  6119 00002D9B 8B5EFC                   mov bx, [bp-4]
  6120 00002D9E D1E3                     shl bx, 1
  6121 00002DA0 8987B7D0                 mov [docallvalue+bx], ax
  6122                                  
  6123                                  ;-589     } while (istoken(','));
  6124                                  
  6125 00002DA4 6A2C                     push 44
  6126 00002DA6 E80D16                   call istoken
  6127 00002DA9 83C402                   add  sp, 2
  6128 00002DAC 08C0                     or  al, al
  6129 00002DAE 0F840300                 je .docall1327
  6130 00002DB2 E9A7FE                   jmp .docall1317
  6131                                  .docall1327:
  6132                                  
  6133                                  ;-590     
  6134                                  
  6135                                  
  6136                                  ;-591   	expect(')');  i=narg;
  6137                                  
  6138 00002DB5 6A29                     push 41
  6139 00002DB7 E81E16                   call expect
  6140 00002DBA 83C402                   add  sp, 2
  6141 00002DBD 8B46FC                   mov ax, [bp-4]
  6142 00002DC0 8946FE                   mov [bp-2], ax
  6143                                  
  6144                                  ;-592     do {
  6145                                  
  6146                                  .docall1328:
  6147                                  
  6148                                  ;-593       t0 = docalltype [i];
  6149                                  
  6150 00002DC3 8B5EFE                   mov bx, [bp-2]
  6151 00002DC6 D1E3                     shl bx, 1
  6152 00002DC8 8B87A3D0                 mov ax, [docalltype + bx]
  6153 00002DCC 8946FA                   mov [bp-6], ax
  6154                                  
  6155                                  ;-594       n0 = docallvalue[i];     
  6156                                  
  6157 00002DCF 8B5EFE                   mov bx, [bp-2]
  6158 00002DD2 D1E3                     shl bx, 1
  6159 00002DD4 8B87B7D0                 mov ax, [docallvalue + bx]
  6160 00002DD8 8946F8                   mov [bp-8], ax
  6161                                  
  6162                                  ;-595       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6163                                  
  6164 00002DDB 8B46FA                   mov ax, [bp-6]
  6165 00002DDE 83F801                   cmp ax, 1
  6166 00002DE1 0F851200                 jne .docall1329
  6167 00002DE5 68[5D2F]                 push docall1_5
  6168 00002DE8 E80017                   call prs
  6169 00002DEB 83C402                   add  sp, 2
  6170 00002DEE FF76F8                   push word [bp-8]
  6171 00002DF1 E84C18                   call prunsign1
  6172 00002DF4 83C402                   add  sp, 2
  6173                                  
  6174                                  ;-596       if(t0==2){ prs("\n push "); 
  6175                                  
  6176                                  .docall1329:
  6177 00002DF7 8B46FA                   mov ax, [bp-6]
  6178 00002DFA 83F802                   cmp ax, 2
  6179 00002DFD 0F852500                 jne .docall1330
  6180 00002E01 68[662F]                 push docall1_6
  6181 00002E04 E8E416                   call prs
  6182 00002E07 83C402                   add  sp, 2
  6183                                  
  6184                                  ;-597         prs(fname);prc(95);prunsign1(n0);}
  6185                                  
  6186 00002E0A 8D06AB81                 lea  ax, [fname]
  6187 00002E0E 50                       push ax
  6188 00002E0F E8D916                   call prs
  6189 00002E12 83C402                   add  sp, 2
  6190 00002E15 6A5F                     push 95
  6191 00002E17 E86A16                   call prc
  6192 00002E1A 83C402                   add  sp, 2
  6193 00002E1D FF76F8                   push word [bp-8]
  6194 00002E20 E81D18                   call prunsign1
  6195 00002E23 83C402                   add  sp, 2
  6196                                  
  6197                                  ;-598       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6198                                  
  6199                                  .docall1330:
  6200 00002E26 8B46FA                   mov ax, [bp-6]
  6201 00002E29 83F803                   cmp ax, 3
  6202 00002E2C 0F851B00                 jne .docall1331
  6203 00002E30 68[6F2F]                 push docall1_7
  6204 00002E33 E8B516                   call prs
  6205 00002E36 83C402                   add  sp, 2
  6206 00002E39 FF76F8                   push word [bp-8]
  6207 00002E3C E830D5                   call v
  6208 00002E3F 83C402                   add  sp, 2
  6209                                  
  6210                                  ;-599         prs("\n push ax");}
  6211                                  
  6212 00002E42 68[7C2F]                 push docall1_8
  6213 00002E45 E8A316                   call prs
  6214 00002E48 83C402                   add  sp, 2
  6215                                  
  6216                                  ;-600       if(t0==4){ gettypes(n0); 
  6217                                  
  6218                                  .docall1331:
  6219 00002E4B 8B46FA                   mov ax, [bp-6]
  6220 00002E4E 83F804                   cmp ax, 4
  6221 00002E51 0F854300                 jne .docall1332
  6222 00002E55 FF76F8                   push word [bp-8]
  6223 00002E58 E8C2D9                   call gettypes
  6224 00002E5B 83C402                   add  sp, 2
  6225                                  
  6226                                  ;-601         if(wi==2) { prs("\n push word "); v(n0);}
  6227                                  
  6228 00002E5E A1[3900]                 mov ax, [wi]
  6229 00002E61 83F802                   cmp ax, 2
  6230 00002E64 0F851500                 jne .docall1333
  6231 00002E68 68[872F]                 push docall1_9
  6232 00002E6B E87D16                   call prs
  6233 00002E6E 83C402                   add  sp, 2
  6234 00002E71 FF76F8                   push word [bp-8]
  6235 00002E74 E8F8D4                   call v
  6236 00002E77 83C402                   add  sp, 2
  6237                                  
  6238                                  ;-602         else { prs("\n mov al, byte ");   v(n0);
  6239                                  
  6240 00002E7A E91B00                   jmp .docall1334
  6241                                  .docall1333:
  6242 00002E7D 68[952F]                 push docall1_10
  6243 00002E80 E86816                   call prs
  6244 00002E83 83C402                   add  sp, 2
  6245 00002E86 FF76F8                   push word [bp-8]
  6246 00002E89 E8E3D4                   call v
  6247 00002E8C 83C402                   add  sp, 2
  6248                                  
  6249                                  ;-603         prs("\n mov ah, 0\n push ax"); } }
  6250                                  
  6251 00002E8F 68[A62F]                 push docall1_11
  6252 00002E92 E85616                   call prs
  6253 00002E95 83C402                   add  sp, 2
  6254                                  .docall1334:
  6255                                  
  6256                                  ;-604       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6257                                  
  6258                                  .docall1332:
  6259 00002E98 8B46FA                   mov ax, [bp-6]
  6260 00002E9B 83F805                   cmp ax, 5
  6261 00002E9E 0F852200                 jne .docall1335
  6262 00002EA2 68[BD2F]                 push docall1_12
  6263 00002EA5 E84316                   call prs
  6264 00002EA8 83C402                   add  sp, 2
  6265 00002EAB FF76F8                   push word [bp-8]
  6266 00002EAE E870ED                   call printreg
  6267 00002EB1 83C402                   add  sp, 2
  6268 00002EB4 8B46F8                   mov ax, [bp-8]
  6269 00002EB7 83F82F                   cmp ax, 47 ;unsigned : 1
  6270 00002EBA 0F8C0600                 jl  .docall1336
  6271 00002EBE 8B46F6                   mov ax, [bp-10]
  6272 00002EC1 83C002                   add ax, 2
  6273                                  .docall1336:
  6274                                  
  6275                                  ;-605    i--; } while (i > 0);  }
  6276                                  
  6277                                  .docall1335:
  6278 00002EC4 FF4EFE                   dec  word[bp-2]
  6279 00002EC7 8B46FE                   mov ax, [bp-2]
  6280 00002ECA 83F800                   cmp ax, 0
  6281 00002ECD 0F8E0300                 jle .docall1337
  6282 00002ED1 E9EFFE                   jmp .docall1328
  6283                                  .docall1337:
  6284                                  
  6285                                  ;-606 	 prs("\n call "); prs(&procname);
  6286                                  
  6287                                  .docall1316:
  6288 00002ED4 68[C62F]                 push docall1_13
  6289 00002ED7 E81116                   call prs
  6290 00002EDA 83C402                   add  sp, 2
  6291 00002EDD 8D06CBD0                 lea  ax, [procname]
  6292 00002EE1 50                       push ax
  6293 00002EE2 E80616                   call prs
  6294 00002EE5 83C402                   add  sp, 2
  6295                                  
  6296                                  ;-607 	 if (narg>0) {prs("\n add  sp, ");
  6297                                  
  6298 00002EE8 8B46FC                   mov ax, [bp-4]
  6299 00002EEB 83F800                   cmp ax, 0
  6300 00002EEE 0F8E2400                 jle .docall1338
  6301 00002EF2 68[CF2F]                 push docall1_14
  6302 00002EF5 E8F315                   call prs
  6303 00002EF8 83C402                   add  sp, 2
  6304                                  
  6305                                  ;-608      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6306                                  
  6307 00002EFB 8B46FC                   mov ax, [bp-4]
  6308 00002EFE 0346FC                   add ax, [bp-4]
  6309 00002F01 8946FC                   mov [bp-4], ax
  6310 00002F04 8B46FC                   mov ax, [bp-4]
  6311 00002F07 0346F6                   add ax, [bp-10]
  6312 00002F0A 8946FC                   mov [bp-4], ax
  6313 00002F0D FF76FC                   push word [bp-4]
  6314 00002F10 E82D17                   call prunsign1
  6315 00002F13 83C402                   add  sp, 2
  6316                                  .docall1338:
  6317                                  
  6318                                  ;-609 /****************************************************************************/
  6319                                  
  6320                                  
  6321                                  ;-610 int main() {
  6322 00002F16 C9                       LEAVE
  6323 00002F17 C3                       ret
  6324 00002F18 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6325 00002F21 72616D657465727300 
  6326 00002F2A 5C6E00                  docall1_1 db "\n",0
  6327 00002F2D 2064622000              docall1_2 db " db ",0
  6328 00002F32 2C3000                  docall1_3 db ",0",0
  6329 00002F35 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6330 00002F3E 206E6F74207265636F-
  6331 00002F47 676E697A656420286E-
  6332 00002F50 6F202A20616C6C6F77-
  6333 00002F59 65642900           
  6334 00002F5D 5C6E20707573682000      docall1_5 db "\n push ",0
  6335 00002F66 5C6E20707573682000      docall1_6 db "\n push ",0
  6336 00002F6F 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6337 00002F78 782C2000           
  6338 00002F7C 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6339 00002F85 7800               
  6340 00002F87 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6341 00002F90 6F72642000         
  6342 00002F95 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6343 00002F9E 2C20627974652000   
  6344 00002FA6 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6345 00002FAF 2C20305C6E20707573-
  6346 00002FB8 6820617800         
  6347 00002FBD 5C6E20707573682000      docall1_12 db "\n push ",0
  6348 00002FC6 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6349 00002FCF 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6350 00002FD8 702C2000           
  6351                                  ENDP
  6352                                  
  6353                                  main: PROC
  6354                                  
  6355                                  ;-611   getarg();
  6356                                  
  6357 00002FDC E88D00                   call getarg
  6358                                  
  6359                                  ;-612   setblock(4096);
  6360                                  
  6361 00002FDF 680010                   push 4096
  6362 00002FE2 E81B23                   call setblock
  6363 00002FE5 83C402                   add  sp, 2
  6364                                  
  6365                                  ;-613   if (DOS_ERR) error1("SetBlock , AX=");
  6366                                  
  6367 00002FE8 A1[6E00]                 mov ax, [DOS_ERR]
  6368 00002FEB 08C0                     or  al, al
  6369 00002FED 0F840900                 je .main339
  6370 00002FF1 68[3130]                 push main_0
  6371 00002FF4 E81318                   call error1
  6372 00002FF7 83C402                   add  sp, 2
  6373                                  
  6374                                  ;-614   segE=allocmem(4096);
  6375                                  
  6376                                  .main339:
  6377 00002FFA 680010                   push 4096
  6378 00002FFD E81923                   call allocmem
  6379 00003000 83C402                   add  sp, 2
  6380 00003003 A3[6400]                 mov word [segE], ax
  6381                                  
  6382                                  ;-615   if (DOS_ERR)  error1("alloc memory, AX=");
  6383                                  
  6384 00003006 A1[6E00]                 mov ax, [DOS_ERR]
  6385 00003009 08C0                     or  al, al
  6386 0000300B 0F840900                 je .main340
  6387 0000300F 68[4030]                 push main_1
  6388 00003012 E8F517                   call error1
  6389 00003015 83C402                   add  sp, 2
  6390                                  
  6391                                  ;-616   CNameTop=0;  
  6392                                  
  6393                                  .main340:
  6394 00003018 B80000                   mov ax, 0
  6395 0000301B A3[6000]                 mov word [CNameTop], ax
  6396                                  
  6397                                  ;-617   coname=0;
  6398                                  
  6399 0000301E B80000                   mov ax, 0
  6400 00003021 A2E880                   mov byte [coname], al
  6401                                  
  6402                                  ;-618   getfirstchar();
  6403                                  
  6404 00003024 E82B00                   call getfirstchar
  6405                                  
  6406                                  ;-619   parse();
  6407                                  
  6408 00003027 E84B02                   call parse
  6409                                  
  6410                                  ;-620   checkcalls(); epilog();
  6411                                  
  6412 0000302A E8DF02                   call checkcalls
  6413 0000302D E8B51E                   call epilog
  6414                                  
  6415                                  ;-621 }
  6416                                  
  6417                                  
  6418                                  ;-622 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6419                                  
  6420 00003030 C3                       ret
  6421 00003031 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6422 0000303A 2C2041583D00       
  6423 00003040 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6424 00003049 6F72792C2041583D00 
  6425                                  ENDP
  6426                                  
  6427                                  getfirstchar: PROC
  6428 00003052 B80FD0                   mov ax, fgetsdest
  6429 00003055 A3[6200]                 mov word [fgetsp], ax
  6430 00003058 B80000                   mov ax, 0
  6431 0000305B 8B1E[6200]               mov  bx, [fgetsp]
  6432 0000305F 8807                     mov  [bx], al
  6433 00003061 E87516                   call fgets1
  6434 00003064 A2[2100]                 mov byte [thechar], al
  6435                                  
  6436                                  ;-623 char *arglen=0x80; char *argv=0x82;
  6437                                  
  6438 00003067 C3                       ret
  6439                                  ENDP
  6440 00003068 8000                    arglen dw 128
  6441 0000306A 8200                    argv dw 130
  6442                                  
  6443                                  ;-624 int getarg() { int arglen1; int i; char *c;
  6444                                  
  6445                                  
  6446                                  getarg: PROC
  6447                                  
  6448                                  ;-625   arglen1=*arglen;
  6449                                  
  6450                                  ;Function : getarg, Number of local variables: 3
  6451                                  ;   # type sign width addr used name   list of local variables
  6452                                  ;  200 var sign word   624 NULL arglen1 = bp-2
  6453                                  ;  201 var sign word   624 NULL i = bp-4
  6454                                  ;  202 ptr sign byte   624 NULL c = bp-6;
  6455 0000306C C8060000                 ENTER  6,0
  6456 00003070 8B1E[6830]               mov bx, [arglen]
  6457 00003074 8A07                     mov al, [bx]
  6458 00003076 B400                     mov ah, 0
  6459 00003078 8946FE                   mov [bp-2], ax
  6460                                  
  6461                                  ;-626   if (arglen1) { i=arglen1+129; *i=0; }
  6462                                  
  6463 0000307B 8B46FE                   mov ax, [bp-2]
  6464 0000307E 08C0                     or  al, al
  6465 00003080 0F841400                 je .getarg341
  6466 00003084 8B46FE                   mov ax, [bp-2]
  6467 00003087 058100                   add ax, 129
  6468 0000308A 8946FC                   mov [bp-4], ax
  6469 0000308D B80000                   mov ax, 0
  6470 00003090 8B5EFC                   mov  bx, [bp-4]
  6471 00003093 8907                     mov  [bx], ax
  6472                                  
  6473                                  ;-627   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6474                                  
  6475 00003095 E93900                   jmp .getarg342
  6476                                  .getarg341:
  6477 00003098 8D06[0300]               lea  ax, [Version1]
  6478 0000309C 50                       push ax
  6479 0000309D E8F4CF                   call cputs
  6480 000030A0 83C402                   add  sp, 2
  6481 000030A3 68[EC31]                 push getarg_0
  6482 000030A6 E8EBCF                   call cputs
  6483 000030A9 83C402                   add  sp, 2
  6484                                  
  6485                                  ;-628     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6486                                  
  6487 000030AC 6A43                     push 67
  6488 000030AE 6A00                     push 0
  6489 000030B0 FF36[6A30]               push word [argv]
  6490 000030B4 E85DD0                   call readRL
  6491 000030B7 83C406                   add  sp, 6
  6492 000030BA A3[7000]                 mov word [DOS_NoBytes], ax
  6493 000030BD A1[7000]                 mov ax, [DOS_NoBytes]
  6494 000030C0 058000                   add ax, 128
  6495 000030C3 8946FA                   mov [bp-6], ax
  6496 000030C6 B80000                   mov ax, 0
  6497 000030C9 8B5EFA                   mov  bx, [bp-6]
  6498 000030CC 8807                     mov  [bx], al
  6499 000030CE E80C14                   call prnl
  6500                                  
  6501                                  ;-629   strcpy(namein, argv);
  6502                                  
  6503                                  .getarg342:
  6504 000030D1 FF36[6A30]               push word [argv]
  6505 000030D5 8D06EE81                 lea  ax, [namein]
  6506 000030D9 50                       push ax
  6507 000030DA E889D0                   call strcpy
  6508 000030DD 83C404                   add  sp, 4
  6509                                  
  6510                                  ;-630   if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  6511                                  
  6512 000030E0 6A2E                     push 46
  6513 000030E2 8D06EE81                 lea  ax, [namein]
  6514 000030E6 50                       push ax
  6515 000030E7 E8F8D0                   call instr1
  6516 000030EA 83C404                   add  sp, 4
  6517 000030ED 83F800                   cmp ax, 0
  6518 000030F0 0F850E00                 jne .getarg343
  6519 000030F4 68[0832]                 push getarg_1
  6520 000030F7 8D06EE81                 lea  ax, [namein]
  6521 000030FB 50                       push ax
  6522 000030FC E815D1                   call strcat1
  6523 000030FF 83C404                   add  sp, 4
  6524                                  
  6525                                  ;-631   toupper(namein);
  6526                                  
  6527                                  .getarg343:
  6528 00003102 8D06EE81                 lea  ax, [namein]
  6529 00003106 50                       push ax
  6530 00003107 E82FD1                   call toupper
  6531 0000310A 83C402                   add  sp, 2
  6532                                  
  6533                                  ;-632   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6534                                  
  6535 0000310D 8D06EE81                 lea  ax, [namein]
  6536 00003111 50                       push ax
  6537 00003112 8D063182                 lea  ax, [namelst]
  6538 00003116 50                       push ax
  6539 00003117 E84CD0                   call strcpy
  6540 0000311A 83C404                   add  sp, 4
  6541 0000311D 8D063182                 lea  ax, [namelst]
  6542 00003121 50                       push ax
  6543 00003122 E819D0                   call strlen
  6544 00003125 83C402                   add  sp, 2
  6545 00003128 8946FC                   mov [bp-4], ax
  6546 0000312B FF4EFC                   dec  word[bp-4]
  6547 0000312E B83182                   mov ax, namelst
  6548 00003131 0346FC                   add ax, [bp-4]
  6549 00003134 8946FA                   mov [bp-6], ax
  6550 00003137 B85300                   mov ax, 83
  6551 0000313A 8B5EFA                   mov  bx, [bp-6]
  6552 0000313D 8807                     mov  [bx], al
  6553                                  
  6554                                  ;-633  
  6555                                  
  6556                                  
  6557                                  ;-634   fdin=openR (namein);
  6558                                  
  6559 0000313F 8D06EE81                 lea  ax, [namein]
  6560 00003143 50                       push ax
  6561 00003144 E88FCF                   call openR
  6562 00003147 83C402                   add  sp, 2
  6563 0000314A A3[1800]                 mov word [fdin], ax
  6564                                  
  6565                                  ;-635   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6566                                  
  6567 0000314D A1[6E00]                 mov ax, [DOS_ERR]
  6568 00003150 08C0                     or  al, al
  6569 00003152 0F841C00                 je .getarg344
  6570 00003156 68[0B32]                 push getarg_2
  6571 00003159 E838CF                   call cputs
  6572 0000315C 83C402                   add  sp, 2
  6573 0000315F 8D06EE81                 lea  ax, [namein]
  6574 00003163 50                       push ax
  6575 00003164 E82DCF                   call cputs
  6576 00003167 83C402                   add  sp, 2
  6577 0000316A 6A01                     push 1
  6578 0000316C E897CF                   call exitR
  6579 0000316F 83C402                   add  sp, 2
  6580                                  
  6581                                  ;-636   fdout=creatR(namelst);
  6582                                  
  6583                                  .getarg344:
  6584 00003172 8D063182                 lea  ax, [namelst]
  6585 00003176 50                       push ax
  6586 00003177 E86BCF                   call creatR
  6587 0000317A 83C402                   add  sp, 2
  6588 0000317D A3[1A00]                 mov word [fdout], ax
  6589                                  
  6590                                  ;-637   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6591                                  
  6592 00003180 A1[6E00]                 mov ax, [DOS_ERR]
  6593 00003183 08C0                     or  al, al
  6594 00003185 0F841C00                 je .getarg345
  6595 00003189 68[2632]                 push getarg_3
  6596 0000318C E805CF                   call cputs
  6597 0000318F 83C402                   add  sp, 2
  6598 00003192 8D063182                 lea  ax, [namelst]
  6599 00003196 50                       push ax
  6600 00003197 E8FACE                   call cputs
  6601 0000319A 83C402                   add  sp, 2
  6602 0000319D 6A02                     push 2
  6603 0000319F E864CF                   call exitR
  6604 000031A2 83C402                   add  sp, 2
  6605                                  
  6606                                  ;-638   prs("\n; ");prs(Version1);
  6607                                  
  6608                                  .getarg345:
  6609 000031A5 68[4032]                 push getarg_4
  6610 000031A8 E84013                   call prs
  6611 000031AB 83C402                   add  sp, 2
  6612 000031AE 8D06[0300]               lea  ax, [Version1]
  6613 000031B2 50                       push ax
  6614 000031B3 E83513                   call prs
  6615 000031B6 83C402                   add  sp, 2
  6616                                  
  6617                                  ;-639   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6618                                  
  6619 000031B9 68[4532]                 push getarg_5
  6620 000031BC E82C13                   call prs
  6621 000031BF 83C402                   add  sp, 2
  6622 000031C2 8D06EE81                 lea  ax, [namein]
  6623 000031C6 50                       push ax
  6624 000031C7 E82113                   call prs
  6625 000031CA 83C402                   add  sp, 2
  6626 000031CD 68[5032]                 push getarg_6
  6627 000031D0 E81813                   call prs
  6628 000031D3 83C402                   add  sp, 2
  6629 000031D6 8D063182                 lea  ax, [namelst]
  6630 000031DA 50                       push ax
  6631 000031DB E80D13                   call prs
  6632 000031DE 83C402                   add  sp, 2
  6633                                  
  6634                                  ;-640   prs("\norg  256 \njmp main"); 
  6635                                  
  6636 000031E1 68[5F32]                 push getarg_7
  6637 000031E4 E80413                   call prs
  6638 000031E7 83C402                   add  sp, 2
  6639                                  
  6640                                  ;-641 }
  6641                                  
  6642                                  
  6643                                  ;-642 int parse() { token=getlex(); do {
  6644 000031EA C9                       LEAVE
  6645 000031EB C3                       ret
  6646 000031EC 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6647 000031F5 2E434F4D20696E5F66-
  6648 000031FE 696C655B2E435D3A20-
  6649 00003207 00                 
  6650 00003208 2E4300                  getarg_1 db ".C",0
  6651 0000320B 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6652 00003214 6C65206D697373696E-
  6653 0000321D 6720282E43293A2000 
  6654 00003226 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6655 0000322F 206E6F742063726561-
  6656 00003238 7461626C653A2000   
  6657 00003240 5C6E3B2000              getarg_4 db "\n; ",0
  6658 00003245 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6659 0000324E 2000               
  6660 00003250 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6661 00003259 61736D3A2000       
  6662 0000325F 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6663 00003268 36205C6E6A6D70206D-
  6664 00003271 61696E00           
  6665                                  ENDP
  6666                                  
  6667                                  parse: PROC
  6668 00003275 E8110A                   call getlex
  6669 00003278 A3[1C00]                 mov word [token], ax
  6670                                  .parse346:
  6671                                  
  6672                                  ;-643     if (token <= 0) return 1;
  6673                                  
  6674 0000327B A1[1C00]                 mov ax, [token]
  6675 0000327E 83F800                   cmp ax, 0
  6676 00003281 0F8F0600                 jg  .parse347
  6677 00003285 B80100                   mov ax, 1
  6678 00003288 E96500                   jmp .retnparse
  6679                                  
  6680                                  ;-644     if (istoken('#')) {
  6681                                  
  6682                                  .parse347:
  6683 0000328B 6A23                     push 35
  6684 0000328D E82611                   call istoken
  6685 00003290 83C402                   add  sp, 2
  6686 00003293 08C0                     or  al, al
  6687 00003295 0F843600                 je .parse348
  6688                                  
  6689                                  ;-645       if (istoken(T_DEFINE)) dodefine();
  6690                                  
  6691 00003299 68FF01                   push 511
  6692 0000329C E81711                   call istoken
  6693 0000329F 83C402                   add  sp, 2
  6694 000032A2 08C0                     or  al, al
  6695 000032A4 0F840600                 je .parse349
  6696 000032A8 E8A702                   call dodefine
  6697                                  
  6698                                  ;-646       else if (istoken(T_INCLUDE)) doinclude();
  6699                                  
  6700 000032AB E91E00                   jmp .parse350
  6701                                  .parse349:
  6702 000032AE 68FE01                   push 510
  6703 000032B1 E80211                   call istoken
  6704 000032B4 83C402                   add  sp, 2
  6705 000032B7 08C0                     or  al, al
  6706 000032B9 0F840600                 je .parse351
  6707 000032BD E8AC01                   call doinclude
  6708                                  
  6709                                  ;-647       else error1("define or include expected");  }
  6710                                  
  6711 000032C0 E90900                   jmp .parse352
  6712                                  .parse351:
  6713 000032C3 68[F132]                 push parse_0
  6714 000032C6 E84115                   call error1
  6715 000032C9 83C402                   add  sp, 2
  6716                                  .parse352:
  6717                                  .parse350:
  6718                                  
  6719                                  ;-648     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6720                                  
  6721 000032CC E91600                   jmp .parse353
  6722                                  .parse348:
  6723 000032CF E858D7                   call typeName
  6724 000032D2 A1[1C00]                 mov ax, [token]
  6725 000032D5 83F828                   cmp ax, 40
  6726 000032D8 0F850600                 jne .parse354
  6727 000032DC E85FDA                   call dofunc
  6728 000032DF E90300                   jmp .parse355
  6729                                  .parse354:
  6730 000032E2 E809D1                   call doglob
  6731                                  .parse355:
  6732                                  
  6733                                  ;-649   } while(1);
  6734                                  
  6735                                  .parse353:
  6736 000032E5 B80100                   mov ax, 1
  6737 000032E8 08C0                     or  al, al
  6738 000032EA 0F840200                 je .parse356
  6739 000032EE EB8B                     jmp .parse346
  6740                                  .parse356:
  6741                                  
  6742                                  ;-650 }
  6743                                  
  6744                                  
  6745                                  ;-651 int checkcalls() { int i; int j; int k;
  6746                                  
  6747                                   .retnparse:
  6748 000032F0 C3                       ret
  6749 000032F1 646566696E65206F72-     parse_0 db "define or include expected",0
  6750 000032FA 20696E636C75646520-
  6751 00003303 657870656374656400 
  6752                                  ENDP
  6753                                  
  6754                                  checkcalls: PROC
  6755                                  
  6756                                  ;-652   prs("\n \n; missing functions: ");
  6757                                  
  6758                                  ;Function : checkcalls, Number of local variables: 3
  6759                                  ;   # type sign width addr used name   list of local variables
  6760                                  ;  200 var sign word   651 NULL i = bp-2
  6761                                  ;  201 var sign word   651 NULL j = bp-4
  6762                                  ;  202 var sign word   651 NULL k = bp-6;
  6763 0000330C C8060000                 ENTER  6,0
  6764 00003310 68[F233]                 push checkcalls_0
  6765 00003313 E8D511                   call prs
  6766 00003316 83C402                   add  sp, 2
  6767                                  
  6768                                  ;-653   i=0;  k=0;
  6769                                  
  6770 00003319 B80000                   mov ax, 0
  6771 0000331C 8946FE                   mov [bp-2], ax
  6772 0000331F B80000                   mov ax, 0
  6773 00003322 8946FA                   mov [bp-6], ax
  6774                                  
  6775                                  ;-654   while (i < CTop) {
  6776                                  
  6777                                  .checkcalls357:
  6778 00003325 8B46FE                   mov ax, [bp-2]
  6779 00003328 3B06[3D00]               cmp ax, [CTop]
  6780 0000332C 0F8D8F00                 jge .checkcalls358
  6781                                  
  6782                                  ;-655     pt=CAdr[i];
  6783                                  
  6784 00003330 8B5EFE                   mov bx, [bp-2]
  6785 00003333 D1E3                     shl bx, 1
  6786 00003335 8B8757AB                 mov ax, [CAdr + bx]
  6787 00003339 A3[6A00]                 mov word [pt], ax
  6788                                  
  6789                                  ;-656     from_far(NameA, pt);
  6790                                  
  6791 0000333C FF36[6A00]               push word [pt]
  6792 00003340 8D06[3F00]               lea  ax, [NameA]
  6793 00003344 50                       push ax
  6794 00003345 E83820                   call from_far
  6795 00003348 83C404                   add  sp, 4
  6796                                  
  6797                                  ;-657     j=0;
  6798                                  
  6799 0000334B B80000                   mov ax, 0
  6800 0000334E 8946FC                   mov [bp-4], ax
  6801                                  
  6802                                  ;-658     do { p1=adrF(FNameField, j);
  6803                                  
  6804                                  .checkcalls359:
  6805 00003351 FF76FC                   push word [bp-4]
  6806 00003354 8D064FBD                 lea  ax, [FNameField]
  6807 00003358 50                       push ax
  6808 00003359 E88CD5                   call adrF
  6809 0000335C 83C404                   add  sp, 4
  6810 0000335F A3[6C00]                 mov word [p1], ax
  6811                                  
  6812                                  ;-659       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6813                                  
  6814 00003362 FF36[6C00]               push word [p1]
  6815 00003366 8D06[3F00]               lea  ax, [NameA]
  6816 0000336A 50                       push ax
  6817 0000336B E828CE                   call eqstr
  6818 0000336E 83C404                   add  sp, 4
  6819 00003371 08C0                     or  al, al
  6820 00003373 0F841000                 je .checkcalls360
  6821 00003377 B80100                   mov ax, 1
  6822 0000337A 8B5EFE                   mov bx, [bp-2]
  6823 0000337D 88872FA1                 mov [CType+bx], al
  6824 00003381 A1[3B00]                 mov ax, [FTop]
  6825 00003384 8946FC                   mov [bp-4], ax
  6826                                  
  6827                                  ;-660       j++; } while (j < FTop);
  6828                                  
  6829                                  .checkcalls360:
  6830 00003387 FF46FC                   inc  word[bp-4]
  6831 0000338A 8B46FC                   mov ax, [bp-4]
  6832 0000338D 3B06[3B00]               cmp ax, [FTop]
  6833 00003391 0F8D0200                 jge .checkcalls361
  6834 00003395 EBBA                     jmp .checkcalls359
  6835                                  .checkcalls361:
  6836                                  
  6837                                  ;-661     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6838                                  
  6839 00003397 8B46FC                   mov ax, [bp-4]
  6840 0000339A 3B06[3B00]               cmp ax, [FTop]
  6841 0000339E 0F851700                 jne .checkcalls362
  6842 000033A2 FF46FA                   inc  word[bp-6]
  6843 000033A5 68[0D34]                 push checkcalls_1
  6844 000033A8 E84011                   call prs
  6845 000033AB 83C402                   add  sp, 2
  6846 000033AE 8D06[3F00]               lea  ax, [NameA]
  6847 000033B2 50                       push ax
  6848 000033B3 E83511                   call prs
  6849 000033B6 83C402                   add  sp, 2
  6850                                  
  6851                                  ;-662     i++; }
  6852                                  
  6853                                  .checkcalls362:
  6854 000033B9 FF46FE                   inc  word[bp-2]
  6855                                  
  6856                                  ;-663   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6857                                  
  6858 000033BC E966FF                   jmp .checkcalls357
  6859                                  .checkcalls358:
  6860 000033BF 68[1234]                 push checkcalls_2
  6861 000033C2 E82611                   call prs
  6862 000033C5 83C402                   add  sp, 2
  6863 000033C8 FF76FA                   push word [bp-6]
  6864 000033CB E8B412                   call printint51
  6865 000033CE 83C402                   add  sp, 2
  6866                                  
  6867                                  ;-664   if (k!=0) error1("At least 1 function is missing! "); 
  6868                                  
  6869 000033D1 8B46FA                   mov ax, [bp-6]
  6870 000033D4 83F800                   cmp ax, 0
  6871 000033D7 0F840C00                 je  .checkcalls363
  6872 000033DB 68[3334]                 push checkcalls_3
  6873 000033DE E82914                   call error1
  6874 000033E1 83C402                   add  sp, 2
  6875                                  
  6876                                  ;-665     else prs(" All FUNCTIONs in place");
  6877                                  
  6878 000033E4 E90900                   jmp .checkcalls364
  6879                                  .checkcalls363:
  6880 000033E7 68[5434]                 push checkcalls_4
  6881 000033EA E8FE10                   call prs
  6882 000033ED 83C402                   add  sp, 2
  6883                                  
  6884                                  ;-666 }
  6885                                  
  6886                                  .checkcalls364:
  6887                                  
  6888                                  ;-667 
  6889                                  
  6890                                  
  6891                                  ;-668 int doinclude() { int fdtemp;
  6892 000033F0 C9                       LEAVE
  6893 000033F1 C3                       ret
  6894 000033F2 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6895 000033FB 7373696E672066756E-
  6896 00003404 6374696F6E733A2000 
  6897 0000340D 5C6E3B2000              checkcalls_1 db "\n; ",0
  6898 00003412 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6899 0000341B 72206F6620756E7265-
  6900 00003424 736F6C766564204341-
  6901 0000342D 4C4C73203A00       
  6902 00003433 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6903 0000343C 312066756E6374696F-
  6904 00003445 6E206973206D697373-
  6905 0000344E 696E67212000       
  6906 00003454 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6907 0000345D 54494F4E7320696E20-
  6908 00003466 706C61636500       
  6909                                  ENDP
  6910                                  
  6911                                  doinclude: PROC
  6912                                  
  6913                                  ;-669   if (token==T_STRING) {  fdtemp=fdin;
  6914                                  
  6915                                  ;Function : doinclude, Number of local variables: 1
  6916                                  ;   # type sign width addr used name   list of local variables
  6917                                  ;  200 var sign word   668 NULL fdtemp = bp-2;
  6918 0000346C C8020000                 ENTER  2,0
  6919 00003470 A1[1C00]                 mov ax, [token]
  6920 00003473 3D0201                   cmp ax, 258
  6921 00003476 0F858700                 jne .doinclude365
  6922 0000347A A1[1800]                 mov ax, [fdin]
  6923 0000347D 8946FE                   mov [bp-2], ax
  6924                                  
  6925                                  ;-670   prs("\n;Use include file: "); prs(symbol);
  6926                                  
  6927 00003480 68[0335]                 push doinclude_0
  6928 00003483 E86510                   call prs
  6929 00003486 83C402                   add  sp, 2
  6930 00003489 8D062B81                 lea  ax, [symbol]
  6931 0000348D 50                       push ax
  6932 0000348E E85A10                   call prs
  6933 00003491 83C402                   add  sp, 2
  6934                                  
  6935                                  ;-671   fdin=openR(symbol);
  6936                                  
  6937 00003494 8D062B81                 lea  ax, [symbol]
  6938 00003498 50                       push ax
  6939 00003499 E83ACC                   call openR
  6940 0000349C 83C402                   add  sp, 2
  6941 0000349F A3[1800]                 mov word [fdin], ax
  6942                                  
  6943                                  ;-672   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6944                                  
  6945 000034A2 A1[6E00]                 mov ax, [DOS_ERR]
  6946 000034A5 83F800                   cmp ax, 0
  6947 000034A8 0F841D00                 je  .doinclude366
  6948 000034AC 68[1935]                 push doinclude_1
  6949 000034AF E83910                   call prs
  6950 000034B2 83C402                   add  sp, 2
  6951 000034B5 8D062B81                 lea  ax, [symbol]
  6952 000034B9 50                       push ax
  6953 000034BA E82E10                   call prs
  6954 000034BD 83C402                   add  sp, 2
  6955                                  
  6956                                  ;-673     error1(" Stop!!"); }
  6957                                  
  6958 000034C0 68[3035]                 push doinclude_2
  6959 000034C3 E84413                   call error1
  6960 000034C6 83C402                   add  sp, 2
  6961                                  
  6962                                  ;-674   linenoinclude=lineno; lineno=1;
  6963                                  
  6964                                  .doinclude366:
  6965 000034C9 A1[6600]                 mov ax, [lineno]
  6966 000034CC A3[6800]                 mov word [linenoinclude], ax
  6967 000034CF B80100                   mov ax, 1
  6968 000034D2 A3[6600]                 mov word [lineno], ax
  6969                                  
  6970                                  ;-675   parse(); lineno=linenoinclude;
  6971                                  
  6972 000034D5 E89DFD                   call parse
  6973 000034D8 A1[6800]                 mov ax, [linenoinclude]
  6974 000034DB A3[6600]                 mov word [lineno], ax
  6975                                  
  6976                                  ;-676   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6977                                  
  6978 000034DE 8B46FE                   mov ax, [bp-2]
  6979 000034E1 A3[1800]                 mov word [fdin], ax
  6980 000034E4 68[3835]                 push doinclude_3
  6981 000034E7 E80110                   call prs
  6982 000034EA 83C402                   add  sp, 2
  6983 000034ED 8D06EE81                 lea  ax, [namein]
  6984 000034F1 50                       push ax
  6985 000034F2 E8F60F                   call prs
  6986 000034F5 83C402                   add  sp, 2
  6987                                  
  6988                                  ;-677   getfirstchar(); token=getlex(); }
  6989                                  
  6990 000034F8 E857FB                   call getfirstchar
  6991 000034FB E88B07                   call getlex
  6992 000034FE A3[1C00]                 mov word [token], ax
  6993                                  
  6994                                  ;-678 }
  6995                                  
  6996                                  .doinclude365:
  6997                                  
  6998                                  ;-679 int dodefine() { int i; int j; int fdtemp;
  6999 00003501 C9                       LEAVE
  7000 00003502 C3                       ret
  7001 00003503 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7002 0000350C 636C7564652066696C-
  7003 00003515 653A2000           
  7004 00003519 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7005 00003522 696C65206D69737369-
  7006 0000352B 6E673A2000         
  7007 00003530 2053746F70212100        doinclude_2 db " Stop!!",0
  7008 00003538 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7009 00003541 6F206D61696E207072-
  7010 0000354A 6F6772616D3A2000   
  7011                                  ENDP
  7012                                  
  7013                                  dodefine: PROC
  7014                                  
  7015                                  ;-680   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7016                                  
  7017                                  ;Function : dodefine, Number of local variables: 3
  7018                                  ;   # type sign width addr used name   list of local variables
  7019                                  ;  200 var sign word   679 NULL i = bp-2
  7020                                  ;  201 var sign word   679 NULL j = bp-4
  7021                                  ;  202 var sign word   679 NULL fdtemp = bp-6;
  7022 00003552 C8060000                 ENTER  6,0
  7023 00003556 68[9936]                 push dodefine_0
  7024 00003559 8D062B81                 lea  ax, [symbol]
  7025 0000355D 50                       push ax
  7026 0000355E E835CC                   call eqstr
  7027 00003561 83C404                   add  sp, 4
  7028 00003564 08C0                     or  al, al
  7029 00003566 0F841500                 je .dodefine367
  7030 0000356A E81C07                   call getlex
  7031 0000356D A3[1C00]                 mov word [token], ax
  7032                                  
  7033                                  ;-681     ORGDATAORIG=lexval; orgData=lexval; return; }
  7034                                  
  7035 00003570 A1[2E00]                 mov ax, [lexval]
  7036 00003573 A3[0E00]                 mov word [ORGDATAORIG], ax
  7037 00003576 A1[2E00]                 mov ax, [lexval]
  7038 00003579 A3[1000]                 mov word [orgData], ax
  7039 0000357C E91801                   jmp .retndodefine
  7040                                  
  7041                                  ;-682   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7042                                  
  7043                                  .dodefine367:
  7044 0000357F 68[A136]                 push dodefine_1
  7045 00003582 8D062B81                 lea  ax, [symbol]
  7046 00003586 50                       push ax
  7047 00003587 E80CCC                   call eqstr
  7048 0000358A 83C404                   add  sp, 4
  7049 0000358D 08C0                     or  al, al
  7050 0000358F 0F844900                 je .dodefine368
  7051 00003593 E8F306                   call getlex
  7052 00003596 A3[1C00]                 mov word [token], ax
  7053 00003599 A1[1C00]                 mov ax, [token]
  7054 0000359C 3D0201                   cmp ax, 258
  7055 0000359F 0F852700                 jne .dodefine369
  7056                                  
  7057                                  ;-683     prs("\n;Use archive file: ");
  7058                                  
  7059 000035A3 68[A936]                 push dodefine_2
  7060 000035A6 E8420F                   call prs
  7061 000035A9 83C402                   add  sp, 2
  7062                                  
  7063                                  ;-684     strcpy(archivename, symbol); prs(archivename);
  7064                                  
  7065 000035AC 8D062B81                 lea  ax, [symbol]
  7066 000035B0 50                       push ax
  7067 000035B1 8D067482                 lea  ax, [archivename]
  7068 000035B5 50                       push ax
  7069 000035B6 E8ADCB                   call strcpy
  7070 000035B9 83C404                   add  sp, 4
  7071 000035BC 8D067482                 lea  ax, [archivename]
  7072 000035C0 50                       push ax
  7073 000035C1 E8270F                   call prs
  7074 000035C4 83C402                   add  sp, 2
  7075                                  
  7076                                  ;-685     } else error1("Name of archive file missing"); token=getlex(); return;}
  7077                                  
  7078 000035C7 E90900                   jmp .dodefine370
  7079                                  .dodefine369:
  7080 000035CA 68[BF36]                 push dodefine_3
  7081 000035CD E83A12                   call error1
  7082 000035D0 83C402                   add  sp, 2
  7083                                  .dodefine370:
  7084 000035D3 E8B306                   call getlex
  7085 000035D6 A3[1C00]                 mov word [token], ax
  7086 000035D9 E9BB00                   jmp .retndodefine
  7087                                  
  7088                                  ;-686    expect(T_NAME);
  7089                                  
  7090                                  .dodefine368:
  7091 000035DC 680001                   push 256
  7092 000035DF E8F60D                   call expect
  7093 000035E2 83C402                   add  sp, 2
  7094                                  
  7095                                  ;-687   if (token==T_CONST) { 
  7096                                  
  7097 000035E5 A1[1C00]                 mov ax, [token]
  7098 000035E8 3D0101                   cmp ax, 257
  7099 000035EB 0F85A800                 jne .dodefine371
  7100                                  
  7101                                  ;-688     if (GTop >= LSTART) error1("global table (define) full");
  7102                                  
  7103 000035EF A1[2A00]                 mov ax, [GTop]
  7104 000035F2 3DC800                   cmp ax, 200 ;unsigned : 1
  7105 000035F5 0F8C0900                 jl  .dodefine372
  7106 000035F9 68[DC36]                 push dodefine_4
  7107 000035FC E80B12                   call error1
  7108 000035FF 83C402                   add  sp, 2
  7109                                  
  7110                                  ;-689     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7111                                  
  7112                                  .dodefine372:
  7113 00003602 8D062B81                 lea  ax, [symbol]
  7114 00003606 50                       push ax
  7115 00003607 E834CB                   call strlen
  7116 0000360A 83C402                   add  sp, 2
  7117 0000360D 8946FE                   mov [bp-2], ax
  7118 00003610 8B46FE                   mov ax, [bp-2]
  7119 00003613 83F80F                   cmp ax, 15
  7120 00003616 0F8E0900                 jle .dodefine373
  7121 0000361A 68[F736]                 push dodefine_5
  7122 0000361D E8EA11                   call error1
  7123 00003620 83C402                   add  sp, 2
  7124                                  
  7125                                  ;-690     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7126                                  
  7127                                  .dodefine373:
  7128 00003623 B85500                   mov ax, 85
  7129 00003626 8B1E[2A00]               mov bx, [GTop]
  7130 0000362A 8887E383                 mov [GSign+bx], al
  7131 0000362E B80100                   mov ax, 1
  7132 00003631 8B1E[2A00]               mov bx, [GTop]
  7133 00003635 88870F85                 mov [GWidth+bx], al
  7134 00003639 B82300                   mov ax, 35
  7135 0000363C 8B1E[2A00]               mov bx, [GTop]
  7136 00003640 8887B782                 mov [GType+bx], al
  7137                                  
  7138                                  ;-691     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7139                                  
  7140 00003644 A1[6600]                 mov ax, [lineno]
  7141 00003647 83E801                   sub ax, 1
  7142 0000364A 8B1E[2A00]               mov bx, [GTop]
  7143 0000364E D1E3                     shl bx, 1
  7144 00003650 89873B86                 mov [GAdr+bx], ax
  7145 00003654 B80000                   mov ax, 0
  7146 00003657 8B1E[2A00]               mov bx, [GTop]
  7147 0000365B D1E3                     shl bx, 1
  7148 0000365D 89879388                 mov [GUsed+bx], ax
  7149                                  
  7150                                  ;-692     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7151                                  
  7152 00003661 FF36[2A00]               push word [GTop]
  7153 00003665 E86CD2                   call adrofname
  7154 00003668 83C402                   add  sp, 2
  7155 0000366B A3[6A00]                 mov word [pt], ax
  7156 0000366E 8D062B81                 lea  ax, [symbol]
  7157 00003672 50                       push ax
  7158 00003673 FF36[6A00]               push word [pt]
  7159 00003677 E8ECCA                   call strcpy
  7160 0000367A 83C404                   add  sp, 4
  7161 0000367D A1[2E00]                 mov ax, [lexval]
  7162 00003680 8B1E[2A00]               mov bx, [GTop]
  7163 00003684 D1E3                     shl bx, 1
  7164 00003686 8987EB8A                 mov [GData+bx], ax
  7165                                  
  7166                                  ;-693     expect(T_CONST); GTop++;  } 
  7167                                  
  7168 0000368A 680101                   push 257
  7169 0000368D E8480D                   call expect
  7170 00003690 83C402                   add  sp, 2
  7171 00003693 FF06[2A00]               inc  word[GTop]
  7172                                  
  7173                                  ;-694 }
  7174                                  
  7175                                  .dodefine371:
  7176                                  
  7177                                  ;-695 int stmt() { int c; char cha;
  7178                                  
  7179 00003697 C9                       .retndodefine: LEAVE
  7180 00003698 C3                       ret
  7181 00003699 4F52474441544100        dodefine_0 db "ORGDATA",0
  7182 000036A1 4152434849564500        dodefine_1 db "ARCHIVE",0
  7183 000036A9 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7184 000036B2 63686976652066696C-
  7185 000036BB 653A2000           
  7186 000036BF 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7187 000036C8 726368697665206669-
  7188 000036D1 6C65206D697373696E-
  7189 000036DA 6700               
  7190 000036DC 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7191 000036E5 626C65202864656669-
  7192 000036EE 6E65292066756C6C00 
  7193 000036F7 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7194 00003700 6D65206C6F6E676572-
  7195 00003709 203135206368617200 
  7196                                  ENDP
  7197                                  
  7198                                  stmt: PROC
  7199                                  
  7200                                  ;-696        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7201                                  
  7202                                  ;Function : stmt, Number of local variables: 2
  7203                                  ;   # type sign width addr used name   list of local variables
  7204                                  ;  200 var sign word   695 NULL c = bp-2
  7205                                  ;  201 var sign byte   695 NULL cha = bp-4;
  7206 00003712 C8040000                 ENTER  4,0
  7207 00003716 6A7B                     push 123
  7208 00003718 E89B0C                   call istoken
  7209 0000371B 83C402                   add  sp, 2
  7210 0000371E 08C0                     or  al, al
  7211 00003720 0F841700                 je .stmt374
  7212                                  .stmt375:
  7213 00003724 6A7D                     push 125
  7214 00003726 E88D0C                   call istoken
  7215 00003729 83C402                   add  sp, 2
  7216 0000372C 83F800                   cmp ax, 0
  7217 0000372F 0F850500                 jne .stmt376
  7218 00003733 E8DCFF                   call stmt
  7219 00003736 EBEC                     jmp .stmt375
  7220                                  .stmt376:
  7221                                  
  7222                                  ;-697   else if(istoken(T_IF))    doif();
  7223                                  
  7224 00003738 E9B001                   jmp .stmt377
  7225                                  .stmt374:
  7226 0000373B 680102                   push 513
  7227 0000373E E8750C                   call istoken
  7228 00003741 83C402                   add  sp, 2
  7229 00003744 08C0                     or  al, al
  7230 00003746 0F840600                 je .stmt378
  7231 0000374A E8E203                   call doif
  7232                                  
  7233                                  ;-698   else if(istoken(T_DO))    dodo();
  7234                                  
  7235 0000374D E99B01                   jmp .stmt379
  7236                                  .stmt378:
  7237 00003750 680402                   push 516
  7238 00003753 E8600C                   call istoken
  7239 00003756 83C402                   add  sp, 2
  7240 00003759 08C0                     or  al, al
  7241 0000375B 0F840600                 je .stmt380
  7242 0000375F E82F04                   call dodo
  7243                                  
  7244                                  ;-699   else if(istoken(T_WHILE)) dowhile();
  7245                                  
  7246 00003762 E98601                   jmp .stmt381
  7247                                  .stmt380:
  7248 00003765 680302                   push 515
  7249 00003768 E84B0C                   call istoken
  7250 0000376B 83C402                   add  sp, 2
  7251 0000376E 08C0                     or  al, al
  7252 00003770 0F840600                 je .stmt382
  7253 00003774 E86704                   call dowhile
  7254                                  
  7255                                  ;-700   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7256                                  
  7257 00003777 E97101                   jmp .stmt383
  7258                                  .stmt382:
  7259 0000377A 680902                   push 521
  7260 0000377D E8360C                   call istoken
  7261 00003780 83C402                   add  sp, 2
  7262 00003783 08C0                     or  al, al
  7263 00003785 0F842200                 je .stmt384
  7264 00003789 68[ED38]                 push stmt_0
  7265 0000378C E85C0D                   call prs
  7266 0000378F 83C402                   add  sp, 2
  7267 00003792 E86ED3                   call name1
  7268 00003795 8D062B81                 lea  ax, [symbol]
  7269 00003799 50                       push ax
  7270 0000379A E84E0D                   call prs
  7271 0000379D 83C402                   add  sp, 2
  7272 000037A0 6A3B                     push 59
  7273 000037A2 E8330C                   call expect
  7274 000037A5 83C402                   add  sp, 2
  7275                                  
  7276                                  ;-701   else if(token==T_ASM)     {prs("\n"); c=next();
  7277                                  
  7278 000037A8 E94001                   jmp .stmt385
  7279                                  .stmt384:
  7280 000037AB A1[1C00]                 mov ax, [token]
  7281 000037AE 3D0602                   cmp ax, 518
  7282 000037B1 0F853300                 jne .stmt386
  7283 000037B5 68[F638]                 push stmt_1
  7284 000037B8 E8300D                   call prs
  7285 000037BB 83C402                   add  sp, 2
  7286 000037BE E8D70B                   call next
  7287 000037C1 8946FE                   mov [bp-2], ax
  7288                                  
  7289                                  ;-702         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7290                                  
  7291                                  .stmt387:
  7292 000037C4 8B46FE                   mov ax, [bp-2]
  7293 000037C7 83F80A                   cmp ax, 10
  7294 000037CA 0F841100                 je  .stmt388
  7295 000037CE FF76FE                   push word [bp-2]
  7296 000037D1 E8B00C                   call prc
  7297 000037D4 83C402                   add  sp, 2
  7298 000037D7 E8BE0B                   call next
  7299 000037DA 8946FE                   mov [bp-2], ax
  7300 000037DD EBE5                     jmp .stmt387
  7301                                  .stmt388:
  7302 000037DF E8A704                   call getlex
  7303 000037E2 A3[1C00]                 mov word [token], ax
  7304                                  
  7305                                  ;-703   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7306                                  
  7307 000037E5 E90301                   jmp .stmt389
  7308                                  .stmt386:
  7309 000037E8 680702                   push 519
  7310 000037EB E8C80B                   call istoken
  7311 000037EE 83C402                   add  sp, 2
  7312 000037F1 08C0                     or  al, al
  7313 000037F3 0F844B00                 je .stmt390
  7314 000037F7 A1[1C00]                 mov ax, [token]
  7315 000037FA 83F87B                   cmp ax, 123
  7316 000037FD 0F853500                 jne .stmt391
  7317 00003801 68[F938]                 push stmt_2
  7318 00003804 E8E40C                   call prs
  7319 00003807 83C402                   add  sp, 2
  7320 0000380A E88B0B                   call next
  7321 0000380D 8846FC                   mov [bp-4], al
  7322                                  
  7323                                  ;-704         while(cha!= '}') { prc(cha); cha=next(); }
  7324                                  
  7325                                  .stmt392:
  7326 00003810 8A46FC                   mov al, [bp-4]
  7327 00003813 3C7D                     cmp al, 125
  7328 00003815 0F841400                 je  .stmt393
  7329 00003819 8A46FC                   mov al, byte [bp-4]
  7330 0000381C B400                     mov ah, 0
  7331 0000381E 50                       push ax
  7332 0000381F E8620C                   call prc
  7333 00003822 83C402                   add  sp, 2
  7334 00003825 E8700B                   call next
  7335 00003828 8846FC                   mov [bp-4], al
  7336                                  
  7337                                  ;-705         token=getlex(); }
  7338                                  
  7339 0000382B EBE3                     jmp .stmt392
  7340                                  .stmt393:
  7341 0000382D E85904                   call getlex
  7342 00003830 A3[1C00]                 mov word [token], ax
  7343                                  
  7344                                  ;-706         else error1("Curly open expected"); 
  7345                                  
  7346 00003833 E90900                   jmp .stmt394
  7347                                  .stmt391:
  7348 00003836 68[FC38]                 push stmt_3
  7349 00003839 E8CE0F                   call error1
  7350 0000383C 83C402                   add  sp, 2
  7351                                  
  7352                                  ;-707         }
  7353                                  
  7354                                  .stmt394:
  7355                                  
  7356                                  ;-708   else if(istoken(T_EMIT))   doemit();
  7357                                  
  7358 0000383F E9A900                   jmp .stmt395
  7359                                  .stmt390:
  7360 00003842 680802                   push 520
  7361 00003845 E86E0B                   call istoken
  7362 00003848 83C402                   add  sp, 2
  7363 0000384B 08C0                     or  al, al
  7364 0000384D 0F840600                 je .stmt396
  7365 00003851 E8CD00                   call doemit
  7366                                  
  7367                                  ;-709   else if(istoken(';'))      { }
  7368                                  
  7369 00003854 E99400                   jmp .stmt397
  7370                                  .stmt396:
  7371 00003857 6A3B                     push 59
  7372 00003859 E85A0B                   call istoken
  7373 0000385C 83C402                   add  sp, 2
  7374 0000385F 08C0                     or  al, al
  7375 00003861 0F840300                 je .stmt398
  7376                                  
  7377                                  ;-710   else if(istoken(T_RETURN)) {
  7378                                  
  7379 00003865 E98300                   jmp .stmt399
  7380                                  .stmt398:
  7381 00003868 680002                   push 512
  7382 0000386B E8480B                   call istoken
  7383 0000386E 83C402                   add  sp, 2
  7384 00003871 08C0                     or  al, al
  7385 00003873 0F843000                 je .stmt400
  7386                                  
  7387                                  ;-711         if (token!=';') exprstart();
  7388                                  
  7389 00003877 A1[1C00]                 mov ax, [token]
  7390 0000387A 83F83B                   cmp ax, 59
  7391 0000387D 0F840300                 je  .stmt401
  7392 00003881 E84CD9                   call exprstart
  7393                                  
  7394                                  ;-712         prs("\n jmp .retn"); 
  7395                                  
  7396                                  .stmt401:
  7397 00003884 68[1039]                 push stmt_4
  7398 00003887 E8610C                   call prs
  7399 0000388A 83C402                   add  sp, 2
  7400                                  
  7401                                  ;-713         prs(fname);
  7402                                  
  7403 0000388D 8D06AB81                 lea  ax, [fname]
  7404 00003891 50                       push ax
  7405 00003892 E8560C                   call prs
  7406 00003895 83C402                   add  sp, 2
  7407                                  
  7408                                  ;-714         nreturn++; 
  7409                                  
  7410 00003898 FF06[2600]               inc  word[nreturn]
  7411                                  
  7412                                  ;-715         expect(';');
  7413                                  
  7414 0000389C 6A3B                     push 59
  7415 0000389E E8370B                   call expect
  7416 000038A1 83C402                   add  sp, 2
  7417                                  
  7418                                  ;-716         }
  7419                                  
  7420                                  
  7421                                  ;-717   else if(thechar==':')      {
  7422                                  
  7423 000038A4 E94400                   jmp .stmt402
  7424                                  .stmt400:
  7425 000038A7 A0[2100]                 mov al, [thechar]
  7426 000038AA 3C3A                     cmp al, 58
  7427 000038AC 0F853000                 jne .stmt403
  7428                                  
  7429                                  ;-718         prs("\n."); // Label
  7430                                  
  7431 000038B0 68[1D39]                 push stmt_5
  7432 000038B3 E8350C                   call prs
  7433 000038B6 83C402                   add  sp, 2
  7434                                  
  7435                                  ;-719         prs(symbol); prc(':');  
  7436                                  
  7437 000038B9 8D062B81                 lea  ax, [symbol]
  7438 000038BD 50                       push ax
  7439 000038BE E82A0C                   call prs
  7440 000038C1 83C402                   add  sp, 2
  7441 000038C4 6A3A                     push 58
  7442 000038C6 E8BB0B                   call prc
  7443 000038C9 83C402                   add  sp, 2
  7444                                  
  7445                                  ;-720         expect(T_NAME); 
  7446                                  
  7447 000038CC 680001                   push 256
  7448 000038CF E8060B                   call expect
  7449 000038D2 83C402                   add  sp, 2
  7450                                  
  7451                                  ;-721         expect(':'); 
  7452                                  
  7453 000038D5 6A3A                     push 58
  7454 000038D7 E8FE0A                   call expect
  7455 000038DA 83C402                   add  sp, 2
  7456                                  
  7457                                  ;-722         }
  7458                                  
  7459                                  
  7460                                  ;-723   else  {exprstart(); expect(';'); } 
  7461                                  
  7462 000038DD E90B00                   jmp .stmt404
  7463                                  .stmt403:
  7464 000038E0 E8EDD8                   call exprstart
  7465 000038E3 6A3B                     push 59
  7466 000038E5 E8F00A                   call expect
  7467 000038E8 83C402                   add  sp, 2
  7468                                  
  7469                                  ;-724 }
  7470                                  
  7471                                  .stmt404:
  7472                                  .stmt402:
  7473                                  .stmt399:
  7474                                  .stmt397:
  7475                                  .stmt395:
  7476                                  .stmt389:
  7477                                  .stmt385:
  7478                                  .stmt383:
  7479                                  .stmt381:
  7480                                  .stmt379:
  7481                                  .stmt377:
  7482                                  
  7483                                  ;-725 
  7484                                  
  7485                                  
  7486                                  ;-726 int doemit() {prs("\n db ");
  7487 000038EB C9                       LEAVE
  7488 000038EC C3                       ret
  7489 000038ED 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7490 000038F6 5C6E00                  stmt_1 db "\n",0
  7491 000038F9 5C6E00                  stmt_2 db "\n",0
  7492 000038FC 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7493 00003905 6E2065787065637465-
  7494 0000390E 6400               
  7495 00003910 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7496 00003919 65746E00           
  7497 0000391D 5C6E2E00                stmt_5 db "\n.",0
  7498                                  ENDP
  7499                                  
  7500                                  doemit: PROC
  7501 00003921 68[5D39]                 push doemit_0
  7502 00003924 E8C40B                   call prs
  7503 00003927 83C402                   add  sp, 2
  7504                                  
  7505                                  ;-727   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7506                                  
  7507                                  .L1:
  7508 0000392A E85C03                   call getlex
  7509 0000392D A3[1C00]                 mov word [token], ax
  7510 00003930 FF36[2E00]               push word [lexval]
  7511 00003934 E8090D                   call prunsign1
  7512 00003937 83C402                   add  sp, 2
  7513 0000393A E84C03                   call getlex
  7514 0000393D A3[1C00]                 mov word [token], ax
  7515                                  
  7516                                  ;-728     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7517                                  
  7518 00003940 A1[1C00]                 mov ax, [token]
  7519 00003943 83F82C                   cmp ax, 44
  7520 00003946 0F850A00                 jne .doemit405
  7521 0000394A 6A2C                     push 44
  7522 0000394C E8350B                   call prc
  7523 0000394F 83C402                   add  sp, 2
  7524 00003952 EBD6                     jmp .L1
  7525                                  .doemit405:
  7526 00003954 6A29                     push 41
  7527 00003956 E87F0A                   call expect
  7528 00003959 83C402                   add  sp, 2
  7529                                  
  7530                                  ;-729 
  7531                                  
  7532                                  
  7533                                  ;-730 int cmpneg(int ids) {
  7534                                  
  7535 0000395C C3                       ret
  7536 0000395D 5C6E2064622000          doemit_0 db "\n db ",0
  7537                                  ENDP
  7538                                  
  7539                                  cmpneg: PROC
  7540                                  
  7541                                  ;-731        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7542                                  
  7543                                  ;Function : cmpneg, Number of local variables: 1
  7544                                  ;   # type sign width addr used name   list of local variables
  7545                                  ;  200 var sign word   730 NULL ids = bp+4;
  7546 00003964 C8000000                 ENTER  0,0
  7547 00003968 A1[2200]                 mov ax, [iscmp]
  7548 0000396B 3D2603                   cmp ax, 806
  7549 0000396E 0F850C00                 jne .cmpneg406
  7550 00003972 68[453A]                 push cmpneg_0
  7551 00003975 E8730B                   call prs
  7552 00003978 83C402                   add  sp, 2
  7553                                  
  7554                                  ;-732   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7555                                  
  7556 0000397B E9C500                   jmp .cmpneg407
  7557                                  .cmpneg406:
  7558 0000397E A1[2200]                 mov ax, [iscmp]
  7559 00003981 3D2703                   cmp ax, 807
  7560 00003984 0F850C00                 jne .cmpneg408
  7561 00003988 68[4E3A]                 push cmpneg_1
  7562 0000398B E85D0B                   call prs
  7563 0000398E 83C402                   add  sp, 2
  7564                                  
  7565                                  ;-733   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7566                                  
  7567 00003991 E9AF00                   jmp .cmpneg409
  7568                                  .cmpneg408:
  7569 00003994 A1[2200]                 mov ax, [iscmp]
  7570 00003997 3D3803                   cmp ax, 824
  7571 0000399A 0F852100                 jne .cmpneg410
  7572 0000399E 8B4604                   mov ax, [bp+4]
  7573 000039A1 08C0                     or  al, al
  7574 000039A3 0F840C00                 je .cmpneg411
  7575 000039A7 68[573A]                 push cmpneg_2
  7576 000039AA E83E0B                   call prs
  7577 000039AD 83C402                   add  sp, 2
  7578                                  
  7579                                  ;-734                            else prs("\n ja  .");//ZF=0 CF=0
  7580                                  
  7581 000039B0 E90900                   jmp .cmpneg412
  7582                                  .cmpneg411:
  7583 000039B3 68[603A]                 push cmpneg_3
  7584 000039B6 E8320B                   call prs
  7585 000039B9 83C402                   add  sp, 2
  7586                                  
  7587                                  ;-735   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7588                                  
  7589                                  .cmpneg412:
  7590 000039BC E98400                   jmp .cmpneg413
  7591                                  .cmpneg410:
  7592 000039BF A1[2200]                 mov ax, [iscmp]
  7593 000039C2 3D2B03                   cmp ax, 811
  7594 000039C5 0F854500                 jne .cmpneg414
  7595 000039C9 8B4604                   mov ax, [bp+4]
  7596 000039CC 08C0                     or  al, al
  7597 000039CE 0F841E00                 je .cmpneg415
  7598 000039D2 68[693A]                 push cmpneg_4
  7599 000039D5 E8130B                   call prs
  7600 000039D8 83C402                   add  sp, 2
  7601 000039DB FF7604                   push word [bp+4]
  7602 000039DE E85F0C                   call prunsign1
  7603 000039E1 83C402                   add  sp, 2
  7604                                  
  7605                                  ;-736                                prs("\n jl  .");}//          SF!=OF
  7606                                  
  7607 000039E4 68[773A]                 push cmpneg_5
  7608 000039E7 E8010B                   call prs
  7609 000039EA 83C402                   add  sp, 2
  7610                                  
  7611                                  ;-737                            else{prs(" ;unsigned : "); prunsign1(ids);
  7612                                  
  7613 000039ED E91B00                   jmp .cmpneg416
  7614                                  .cmpneg415:
  7615 000039F0 68[803A]                 push cmpneg_6
  7616 000039F3 E8F50A                   call prs
  7617 000039F6 83C402                   add  sp, 2
  7618 000039F9 FF7604                   push word [bp+4]
  7619 000039FC E8410C                   call prunsign1
  7620 000039FF 83C402                   add  sp, 2
  7621                                  
  7622                                  ;-738                                prs("\n jb  .");}//jb=jc=CF=1
  7623                                  
  7624 00003A02 68[8E3A]                 push cmpneg_7
  7625 00003A05 E8E30A                   call prs
  7626 00003A08 83C402                   add  sp, 2
  7627                                  
  7628                                  ;-739   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7629                                  
  7630                                  .cmpneg416:
  7631 00003A0B E93500                   jmp .cmpneg417
  7632                                  .cmpneg414:
  7633 00003A0E A1[2200]                 mov ax, [iscmp]
  7634 00003A11 83F83C                   cmp ax, 60
  7635 00003A14 0F850C00                 jne .cmpneg418
  7636 00003A18 68[973A]                 push cmpneg_8
  7637 00003A1B E8CD0A                   call prs
  7638 00003A1E 83C402                   add  sp, 2
  7639                                  
  7640                                  ;-740   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7641                                  
  7642 00003A21 E91F00                   jmp .cmpneg419
  7643                                  .cmpneg418:
  7644 00003A24 A1[2200]                 mov ax, [iscmp]
  7645 00003A27 83F83E                   cmp ax, 62
  7646 00003A2A 0F850C00                 jne .cmpneg420
  7647 00003A2E 68[A03A]                 push cmpneg_9
  7648 00003A31 E8B70A                   call prs
  7649 00003A34 83C402                   add  sp, 2
  7650                                  
  7651                                  ;-741   else error1("internal error compare unknown in CMPNEG()");  }
  7652                                  
  7653 00003A37 E90900                   jmp .cmpneg421
  7654                                  .cmpneg420:
  7655 00003A3A 68[A93A]                 push cmpneg_10
  7656 00003A3D E8CA0D                   call error1
  7657 00003A40 83C402                   add  sp, 2
  7658                                  .cmpneg421:
  7659                                  .cmpneg419:
  7660                                  .cmpneg417:
  7661                                  .cmpneg413:
  7662                                  .cmpneg409:
  7663                                  .cmpneg407:
  7664                                  
  7665                                  ;-742 
  7666                                  
  7667                                  
  7668                                  ;-743 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7669 00003A43 C9                       LEAVE
  7670 00003A44 C3                       ret
  7671 00003A45 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7672 00003A4E 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7673 00003A57 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7674 00003A60 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7675 00003A69 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7676 00003A72 64203A2000         
  7677 00003A77 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7678 00003A80 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7679 00003A89 64203A2000         
  7680 00003A8E 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7681 00003A97 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7682 00003AA0 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7683 00003AA9 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7684 00003AB2 6572726F7220636F6D-
  7685 00003ABB 7061726520756E6B6E-
  7686 00003AC4 6F776E20696E20434D-
  7687 00003ACD 504E4547282900     
  7688                                  ENDP
  7689                                  
  7690                                  prlabel: PROC
  7691                                  ;Function : prlabel, Number of local variables: 1
  7692                                  ;   # type sign width addr used name   list of local variables
  7693                                  ;  200 var sign word   743 NULL n = bp+4;
  7694 00003AD4 C8000000                 ENTER  0,0
  7695 00003AD8 68[FF3A]                 push prlabel_0
  7696 00003ADB E80D0A                   call prs
  7697 00003ADE 83C402                   add  sp, 2
  7698 00003AE1 8D06AB81                 lea  ax, [fname]
  7699 00003AE5 50                       push ax
  7700 00003AE6 E8020A                   call prs
  7701 00003AE9 83C402                   add  sp, 2
  7702 00003AEC FF7604                   push word [bp+4]
  7703 00003AEF E84E0B                   call prunsign1
  7704 00003AF2 83C402                   add  sp, 2
  7705 00003AF5 6A3A                     push 58
  7706 00003AF7 E88A09                   call prc
  7707 00003AFA 83C402                   add  sp, 2
  7708                                  
  7709                                  ;-744 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7710 00003AFD C9                       LEAVE
  7711 00003AFE C3                       ret
  7712 00003AFF 5C6E2E00                prlabel_0 db "\n.",0
  7713                                  ENDP
  7714                                  
  7715                                  prjump: PROC
  7716                                  ;Function : prjump, Number of local variables: 1
  7717                                  ;   # type sign width addr used name   list of local variables
  7718                                  ;  200 var sign word   744 NULL n = bp+4;
  7719 00003B03 C8000000                 ENTER  0,0
  7720 00003B07 68[263B]                 push prjump_0
  7721 00003B0A E8DE09                   call prs
  7722 00003B0D 83C402                   add  sp, 2
  7723 00003B10 8D06AB81                 lea  ax, [fname]
  7724 00003B14 50                       push ax
  7725 00003B15 E8D309                   call prs
  7726 00003B18 83C402                   add  sp, 2
  7727 00003B1B FF7604                   push word [bp+4]
  7728 00003B1E E81F0B                   call prunsign1
  7729 00003B21 83C402                   add  sp, 2
  7730                                  
  7731                                  ;-745 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7732 00003B24 C9                       LEAVE
  7733 00003B25 C3                       ret
  7734 00003B26 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7735                                  ENDP
  7736                                  
  7737                                  doif: PROC
  7738                                  ;Function : doif, Number of local variables: 2
  7739                                  ;   # type sign width addr used name   list of local variables
  7740                                  ;  200 var sign word   745 NULL jdest = bp-2
  7741                                  ;  201 var sign word   745 NULL tst = bp-4;
  7742 00003B2F C8040000                 ENTER  4,0
  7743 00003B33 E80ED5                   call pexpr
  7744 00003B36 FF06[2800]               inc  word[nlabel]
  7745 00003B3A A1[2800]                 mov ax, [nlabel]
  7746 00003B3D 8946FE                   mov [bp-2], ax
  7747                                  
  7748                                  ;-746   pint1(jdest); stmt();
  7749                                  
  7750 00003B40 FF76FE                   push word [bp-2]
  7751 00003B43 E89C0A                   call pint1
  7752 00003B46 83C402                   add  sp, 2
  7753 00003B49 E8C6FB                   call stmt
  7754                                  
  7755                                  ;-747   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7756                                  
  7757 00003B4C 680202                   push 514
  7758 00003B4F E86408                   call istoken
  7759 00003B52 83C402                   add  sp, 2
  7760 00003B55 08C0                     or  al, al
  7761 00003B57 0F842B00                 je .doif422
  7762 00003B5B FF06[2800]               inc  word[nlabel]
  7763 00003B5F A1[2800]                 mov ax, [nlabel]
  7764 00003B62 8946FC                   mov [bp-4], ax
  7765                                  
  7766                                  ;-748     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7767                                  
  7768 00003B65 FF76FC                   push word [bp-4]
  7769 00003B68 E898FF                   call prjump
  7770 00003B6B 83C402                   add  sp, 2
  7771 00003B6E FF76FE                   push word [bp-2]
  7772 00003B71 E860FF                   call prlabel
  7773 00003B74 83C402                   add  sp, 2
  7774 00003B77 E898FB                   call stmt
  7775 00003B7A FF76FC                   push word [bp-4]
  7776 00003B7D E854FF                   call prlabel
  7777 00003B80 83C402                   add  sp, 2
  7778                                  
  7779                                  ;-749   else prlabel(jdest); }
  7780                                  
  7781 00003B83 E90900                   jmp .doif423
  7782                                  .doif422:
  7783 00003B86 FF76FE                   push word [bp-2]
  7784 00003B89 E848FF                   call prlabel
  7785 00003B8C 83C402                   add  sp, 2
  7786                                  .doif423:
  7787                                  
  7788                                  ;-750 
  7789                                  
  7790                                  
  7791                                  ;-751 int dodo() {int jdest; int jtemp;
  7792 00003B8F C9                       LEAVE
  7793 00003B90 C3                       ret
  7794                                  ENDP
  7795                                  
  7796                                  dodo: PROC
  7797                                  
  7798                                  ;-752   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7799                                  
  7800                                  ;Function : dodo, Number of local variables: 2
  7801                                  ;   # type sign width addr used name   list of local variables
  7802                                  ;  200 var sign word   751 NULL jdest = bp-2
  7803                                  ;  201 var sign word   751 NULL jtemp = bp-4;
  7804 00003B91 C8040000                 ENTER  4,0
  7805 00003B95 FF06[2800]               inc  word[nlabel]
  7806 00003B99 A1[2800]                 mov ax, [nlabel]
  7807 00003B9C 8946FE                   mov [bp-2], ax
  7808 00003B9F FF76FE                   push word [bp-2]
  7809 00003BA2 E82FFF                   call prlabel
  7810 00003BA5 83C402                   add  sp, 2
  7811 00003BA8 E867FB                   call stmt
  7812                                  
  7813                                  ;-753   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7814                                  
  7815 00003BAB 680302                   push 515
  7816 00003BAE E82708                   call expect
  7817 00003BB1 83C402                   add  sp, 2
  7818 00003BB4 E88DD4                   call pexpr
  7819 00003BB7 FF06[2800]               inc  word[nlabel]
  7820 00003BBB A1[2800]                 mov ax, [nlabel]
  7821 00003BBE 8946FC                   mov [bp-4], ax
  7822 00003BC1 FF76FC                   push word [bp-4]
  7823 00003BC4 E81B0A                   call pint1
  7824 00003BC7 83C402                   add  sp, 2
  7825                                  
  7826                                  ;-754   prjump(jdest); prlabel(jtemp); }
  7827                                  
  7828 00003BCA FF76FE                   push word [bp-2]
  7829 00003BCD E833FF                   call prjump
  7830 00003BD0 83C402                   add  sp, 2
  7831 00003BD3 FF76FC                   push word [bp-4]
  7832 00003BD6 E8FBFE                   call prlabel
  7833 00003BD9 83C402                   add  sp, 2
  7834                                  
  7835                                  ;-755 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7836 00003BDC C9                       LEAVE
  7837 00003BDD C3                       ret
  7838                                  ENDP
  7839                                  
  7840                                  dowhile: PROC
  7841                                  ;Function : dowhile, Number of local variables: 2
  7842                                  ;   # type sign width addr used name   list of local variables
  7843                                  ;  200 var sign word   755 NULL jdest = bp-2
  7844                                  ;  201 var sign word   755 NULL tst = bp-4;
  7845 00003BDE C8040000                 ENTER  4,0
  7846 00003BE2 FF06[2800]               inc  word[nlabel]
  7847 00003BE6 A1[2800]                 mov ax, [nlabel]
  7848 00003BE9 8946FE                   mov [bp-2], ax
  7849                                  
  7850                                  ;-756   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7851                                  
  7852 00003BEC FF76FE                   push word [bp-2]
  7853 00003BEF E8E2FE                   call prlabel
  7854 00003BF2 83C402                   add  sp, 2
  7855 00003BF5 E84CD4                   call pexpr
  7856 00003BF8 FF06[2800]               inc  word[nlabel]
  7857 00003BFC A1[2800]                 mov ax, [nlabel]
  7858 00003BFF 8946FC                   mov [bp-4], ax
  7859 00003C02 FF76FC                   push word [bp-4]
  7860 00003C05 E8DA09                   call pint1
  7861 00003C08 83C402                   add  sp, 2
  7862                                  
  7863                                  ;-757   stmt(); prjump(jdest); prlabel(tst); }
  7864                                  
  7865 00003C0B E804FB                   call stmt
  7866 00003C0E FF76FE                   push word [bp-2]
  7867 00003C11 E8EFFE                   call prjump
  7868 00003C14 83C402                   add  sp, 2
  7869 00003C17 FF76FC                   push word [bp-4]
  7870 00003C1A E8B7FE                   call prlabel
  7871 00003C1D 83C402                   add  sp, 2
  7872                                  
  7873                                  ;-758 int isrelational() {
  7874 00003C20 C9                       LEAVE
  7875 00003C21 C3                       ret
  7876                                  ENDP
  7877                                  
  7878                                  isrelational: PROC
  7879                                  
  7880                                  ;-759   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7881                                  
  7882 00003C22 A1[1C00]                 mov ax, [token]
  7883 00003C25 3D2603                   cmp ax, 806
  7884 00003C28 0F850300                 jne .isrelational424
  7885 00003C2C E94700                   jmp .w
  7886                                  .isrelational424:
  7887 00003C2F A1[1C00]                 mov ax, [token]
  7888 00003C32 3D2703                   cmp ax, 807
  7889 00003C35 0F850300                 jne .isrelational425
  7890 00003C39 E93A00                   jmp .w
  7891                                  
  7892                                  ;-760   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7893                                  
  7894                                  .isrelational425:
  7895 00003C3C A1[1C00]                 mov ax, [token]
  7896 00003C3F 3D3803                   cmp ax, 824
  7897 00003C42 0F850300                 jne .isrelational426
  7898 00003C46 E92D00                   jmp .w
  7899                                  .isrelational426:
  7900 00003C49 A1[1C00]                 mov ax, [token]
  7901 00003C4C 3D2B03                   cmp ax, 811
  7902 00003C4F 0F850300                 jne .isrelational427
  7903 00003C53 E92000                   jmp .w
  7904                                  
  7905                                  ;-761   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7906                                  
  7907                                  .isrelational427:
  7908 00003C56 A1[1C00]                 mov ax, [token]
  7909 00003C59 83F83C                   cmp ax, 60
  7910 00003C5C 0F850300                 jne .isrelational428
  7911 00003C60 E91300                   jmp .w
  7912                                  .isrelational428:
  7913 00003C63 A1[1C00]                 mov ax, [token]
  7914 00003C66 83F83E                   cmp ax, 62
  7915 00003C69 0F850300                 jne .isrelational429
  7916 00003C6D E90600                   jmp .w
  7917                                  
  7918                                  ;-762   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7919                                  
  7920                                  .isrelational429:
  7921 00003C70 B80000                   mov ax, 0
  7922 00003C73 E91200                   jmp .retnisrelational
  7923                                  .w:
  7924 00003C76 A1[1C00]                 mov ax, [token]
  7925 00003C79 A3[2200]                 mov word [iscmp], ax
  7926 00003C7C E80A00                   call getlex
  7927 00003C7F A3[1C00]                 mov word [token], ax
  7928 00003C82 B80100                   mov ax, 1
  7929 00003C85 E90000                   jmp .retnisrelational
  7930                                  
  7931                                  ;-763  
  7932                                  
  7933                                  
  7934                                  ;-764 char symboltemp[80];    
  7935                                  
  7936                                   .retnisrelational:
  7937 00003C88 C3                       ret
  7938                                  ENDP
  7939                                  section .bss
  7940                                  absolute 53468
  7941 0000D0DC <res 00000050>          symboltemp resb 80
  7942                                  section .text
  7943                                  
  7944                                  ;-765 int getlex() { char c; char *p; 
  7945                                  
  7946                                  
  7947                                  getlex: PROC
  7948                                  
  7949                                  ;-766 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7950                                  
  7951                                  ;Function : getlex, Number of local variables: 2
  7952                                  ;   # type sign width addr used name   list of local variables
  7953                                  ;  200 var sign byte   765 NULL c = bp-2
  7954                                  ;  201 ptr sign byte   765 NULL p = bp-4;
  7955 00003C89 C8040000                 ENTER  4,0
  7956                                  .g1:
  7957 00003C8D E80807                   call next
  7958 00003C90 8846FE                   mov [bp-2], al
  7959 00003C93 8A46FE                   mov al, [bp-2]
  7960 00003C96 3C00                     cmp al, 0
  7961 00003C98 0F850600                 jne .getlex430
  7962 00003C9C B80000                   mov ax, 0
  7963 00003C9F E9F404                   jmp .retngetlex
  7964                                  .getlex430:
  7965 00003CA2 8A46FE                   mov al, [bp-2]
  7966 00003CA5 3C20                     cmp al, 32
  7967 00003CA7 0F8F0200                 jg  .getlex431
  7968 00003CAB EBE0                     jmp .g1
  7969                                  
  7970                                  ;-767   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7971                                  
  7972                                  .getlex431:
  7973 00003CAD 8A46FE                   mov al, [bp-2]
  7974 00003CB0 3C3D                     cmp al, 61
  7975 00003CB2 0F851200                 jne .getlex432
  7976 00003CB6 A0[2100]                 mov al, [thechar]
  7977 00003CB9 3C3D                     cmp al, 61
  7978 00003CBB 0F850900                 jne .getlex433
  7979 00003CBF E8D606                   call next
  7980 00003CC2 B82603                   mov ax, 806
  7981 00003CC5 E9CE04                   jmp .retngetlex
  7982                                  .getlex433:
  7983                                  
  7984                                  ;-768   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7985                                  
  7986                                  .getlex432:
  7987 00003CC8 8A46FE                   mov al, [bp-2]
  7988 00003CCB 3C21                     cmp al, 33
  7989 00003CCD 0F851200                 jne .getlex434
  7990 00003CD1 A0[2100]                 mov al, [thechar]
  7991 00003CD4 3C3D                     cmp al, 61
  7992 00003CD6 0F850900                 jne .getlex435
  7993 00003CDA E8BB06                   call next
  7994 00003CDD B82703                   mov ax, 807
  7995 00003CE0 E9B304                   jmp .retngetlex
  7996                                  .getlex435:
  7997                                  
  7998                                  ;-769   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7999                                  
  8000                                  .getlex434:
  8001 00003CE3 8A46FE                   mov al, [bp-2]
  8002 00003CE6 3C3C                     cmp al, 60
  8003 00003CE8 0F851200                 jne .getlex436
  8004 00003CEC A0[2100]                 mov al, [thechar]
  8005 00003CEF 3C3D                     cmp al, 61
  8006 00003CF1 0F850900                 jne .getlex437
  8007 00003CF5 E8A006                   call next
  8008 00003CF8 B83803                   mov ax, 824
  8009 00003CFB E99804                   jmp .retngetlex
  8010                                  .getlex437:
  8011                                  
  8012                                  ;-770   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8013                                  
  8014                                  .getlex436:
  8015 00003CFE 8A46FE                   mov al, [bp-2]
  8016 00003D01 3C3E                     cmp al, 62
  8017 00003D03 0F851200                 jne .getlex438
  8018 00003D07 A0[2100]                 mov al, [thechar]
  8019 00003D0A 3C3D                     cmp al, 61
  8020 00003D0C 0F850900                 jne .getlex439
  8021 00003D10 E88506                   call next
  8022 00003D13 B82B03                   mov ax, 811
  8023 00003D16 E97D04                   jmp .retngetlex
  8024                                  .getlex439:
  8025                                  
  8026                                  ;-771   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8027                                  
  8028                                  .getlex438:
  8029 00003D19 8A46FE                   mov al, [bp-2]
  8030 00003D1C 3C3C                     cmp al, 60
  8031 00003D1E 0F851200                 jne .getlex440
  8032 00003D22 A0[2100]                 mov al, [thechar]
  8033 00003D25 3C3C                     cmp al, 60
  8034 00003D27 0F850900                 jne .getlex441
  8035 00003D2B E86A06                   call next
  8036 00003D2E B8D804                   mov ax, 1240
  8037 00003D31 E96204                   jmp .retngetlex
  8038                                  .getlex441:
  8039                                  
  8040                                  ;-772   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8041                                  
  8042                                  .getlex440:
  8043 00003D34 8A46FE                   mov al, [bp-2]
  8044 00003D37 3C3E                     cmp al, 62
  8045 00003D39 0F851200                 jne .getlex442
  8046 00003D3D A0[2100]                 mov al, [thechar]
  8047 00003D40 3C3E                     cmp al, 62
  8048 00003D42 0F850900                 jne .getlex443
  8049 00003D46 E84F06                   call next
  8050 00003D49 B8D904                   mov ax, 1241
  8051 00003D4C E94704                   jmp .retngetlex
  8052                                  .getlex443:
  8053                                  
  8054                                  ;-773   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8055                                  
  8056                                  .getlex442:
  8057 00003D4F 8A46FE                   mov al, [bp-2]
  8058 00003D52 3C2B                     cmp al, 43
  8059 00003D54 0F851200                 jne .getlex444
  8060 00003D58 A0[2100]                 mov al, [thechar]
  8061 00003D5B 3C2B                     cmp al, 43
  8062 00003D5D 0F850900                 jne .getlex445
  8063 00003D61 E83406                   call next
  8064 00003D64 B8C304                   mov ax, 1219
  8065 00003D67 E92C04                   jmp .retngetlex
  8066                                  .getlex445:
  8067                                  
  8068                                  ;-774   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8069                                  
  8070                                  .getlex444:
  8071 00003D6A 8A46FE                   mov al, [bp-2]
  8072 00003D6D 3C2D                     cmp al, 45
  8073 00003D6F 0F851200                 jne .getlex446
  8074 00003D73 A0[2100]                 mov al, [thechar]
  8075 00003D76 3C2D                     cmp al, 45
  8076 00003D78 0F850900                 jne .getlex447
  8077 00003D7C E81906                   call next
  8078 00003D7F B8C904                   mov ax, 1225
  8079 00003D82 E91104                   jmp .retngetlex
  8080                                  .getlex447:
  8081                                  
  8082                                  ;-775   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8083                                  
  8084                                  .getlex446:
  8085 00003D85 8A46FE                   mov al, [bp-2]
  8086 00003D88 3C2B                     cmp al, 43
  8087 00003D8A 0F851200                 jne .getlex448
  8088 00003D8E A0[2100]                 mov al, [thechar]
  8089 00003D91 3C3D                     cmp al, 61
  8090 00003D93 0F850900                 jne .getlex449
  8091 00003D97 E8FE05                   call next
  8092 00003D9A B8CE04                   mov ax, 1230
  8093 00003D9D E9F603                   jmp .retngetlex
  8094                                  .getlex449:
  8095                                  
  8096                                  ;-776   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8097                                  
  8098                                  .getlex448:
  8099 00003DA0 8A46FE                   mov al, [bp-2]
  8100 00003DA3 3C2D                     cmp al, 45
  8101 00003DA5 0F851200                 jne .getlex450
  8102 00003DA9 A0[2100]                 mov al, [thechar]
  8103 00003DAC 3C3D                     cmp al, 61
  8104 00003DAE 0F850900                 jne .getlex451
  8105 00003DB2 E8E305                   call next
  8106 00003DB5 B8CF04                   mov ax, 1231
  8107 00003DB8 E9DB03                   jmp .retngetlex
  8108                                  .getlex451:
  8109                                  
  8110                                  ;-777   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8111                                  
  8112                                  .getlex450:
  8113 00003DBB 8A46FE                   mov al, [bp-2]
  8114 00003DBE 3C26                     cmp al, 38
  8115 00003DC0 0F851200                 jne .getlex452
  8116 00003DC4 A0[2100]                 mov al, [thechar]
  8117 00003DC7 3C3D                     cmp al, 61
  8118 00003DC9 0F850900                 jne .getlex453
  8119 00003DCD E8C805                   call next
  8120 00003DD0 B8D204                   mov ax, 1234
  8121 00003DD3 E9C003                   jmp .retngetlex
  8122                                  .getlex453:
  8123                                  
  8124                                  ;-778   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8125                                  
  8126                                  .getlex452:
  8127 00003DD6 8A46FE                   mov al, [bp-2]
  8128 00003DD9 3C7C                     cmp al, 124
  8129 00003DDB 0F851200                 jne .getlex454
  8130 00003DDF A0[2100]                 mov al, [thechar]
  8131 00003DE2 3C3D                     cmp al, 61
  8132 00003DE4 0F850900                 jne .getlex455
  8133 00003DE8 E8AD05                   call next
  8134 00003DEB B8D304                   mov ax, 1235
  8135 00003DEE E9A503                   jmp .retngetlex
  8136                                  .getlex455:
  8137                                  
  8138                                  ;-779   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8139                                  
  8140                                  .getlex454:
  8141 00003DF1 8A46FE                   mov al, [bp-2]
  8142 00003DF4 3C2A                     cmp al, 42
  8143 00003DF6 0F851200                 jne .getlex456
  8144 00003DFA A0[2100]                 mov al, [thechar]
  8145 00003DFD 3C3D                     cmp al, 61
  8146 00003DFF 0F850900                 jne .getlex457
  8147 00003E03 E89205                   call next
  8148 00003E06 B8D004                   mov ax, 1232
  8149 00003E09 E98A03                   jmp .retngetlex
  8150                                  .getlex457:
  8151                                  
  8152                                  ;-780   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8153                                  
  8154                                  .getlex456:
  8155 00003E0C 8A46FE                   mov al, [bp-2]
  8156 00003E0F 3C2F                     cmp al, 47
  8157 00003E11 0F851200                 jne .getlex458
  8158 00003E15 A0[2100]                 mov al, [thechar]
  8159 00003E18 3C3D                     cmp al, 61
  8160 00003E1A 0F850900                 jne .getlex459
  8161 00003E1E E87705                   call next
  8162 00003E21 B8D104                   mov ax, 1233
  8163 00003E24 E96F03                   jmp .retngetlex
  8164                                  .getlex459:
  8165                                  
  8166                                  ;-781   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8167                                  
  8168                                  .getlex458:
  8169 00003E27 8A46FE                   mov al, byte [bp-2]
  8170 00003E2A B400                     mov ah, 0
  8171 00003E2C 50                       push ax
  8172 00003E2D 68[9841]                 push getlex_0
  8173 00003E30 E8AFC3                   call instr1
  8174 00003E33 83C404                   add  sp, 4
  8175 00003E36 08C0                     or  al, al
  8176 00003E38 0F840600                 je .getlex460
  8177 00003E3C 8A46FE                   mov al, [bp-2]
  8178 00003E3F E95403                   jmp .retngetlex
  8179                                  
  8180                                  ;-782   if (c == '/') { if (thechar == '/') {
  8181                                  
  8182                                  .getlex460:
  8183 00003E42 8A46FE                   mov al, [bp-2]
  8184 00003E45 3C2F                     cmp al, 47
  8185 00003E47 0F852900                 jne .getlex461
  8186 00003E4B A0[2100]                 mov al, [thechar]
  8187 00003E4E 3C2F                     cmp al, 47
  8188 00003E50 0F852000                 jne .getlex462
  8189                                  
  8190                                  ;-783       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  8191                                  
  8192                                  .getlex463:
  8193 00003E54 E84105                   call next
  8194 00003E57 8846FE                   mov [bp-2], al
  8195 00003E5A 8A46FE                   mov al, byte [bp-2]
  8196 00003E5D B400                     mov ah, 0
  8197 00003E5F 50                       push ax
  8198 00003E60 E84B09                   call ifEOL
  8199 00003E63 83C402                   add  sp, 2
  8200 00003E66 3C00                     cmp al, 0
  8201 00003E68 0F850200                 jne .getlex464
  8202 00003E6C EBE6                     jmp .getlex463
  8203                                  .getlex464:
  8204 00003E6E E818FE                   call getlex
  8205 00003E71 E92203                   jmp .retngetlex
  8206                                  .getlex462:
  8207                                  
  8208                                  ;-784   if (c == '/') { if (thechar == '*') {
  8209                                  
  8210                                  .getlex461:
  8211 00003E74 8A46FE                   mov al, [bp-2]
  8212 00003E77 3C2F                     cmp al, 47
  8213 00003E79 0F853A00                 jne .getlex465
  8214 00003E7D A0[2100]                 mov al, [thechar]
  8215 00003E80 3C2A                     cmp al, 42
  8216 00003E82 0F852B00                 jne .getlex466
  8217                                  
  8218                                  ;-785       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8219                                  
  8220                                  .g2:
  8221 00003E86 E80F05                   call next
  8222 00003E89 8846FE                   mov [bp-2], al
  8223 00003E8C 8A46FE                   mov al, [bp-2]
  8224 00003E8F 3C2A                     cmp al, 42
  8225 00003E91 0F840200                 je  .getlex467
  8226 00003E95 EBEF                     jmp .g2
  8227                                  .getlex467:
  8228 00003E97 A0[2100]                 mov al, [thechar]
  8229 00003E9A 3C2F                     cmp al, 47
  8230 00003E9C 0F840200                 je  .getlex468
  8231 00003EA0 EBE4                     jmp .g2
  8232                                  
  8233                                  ;-786       c=next(); return getlex(); } else  return '/'; }
  8234                                  
  8235                                  .getlex468:
  8236 00003EA2 E8F304                   call next
  8237 00003EA5 8846FE                   mov [bp-2], al
  8238 00003EA8 E8DEFD                   call getlex
  8239 00003EAB E9E802                   jmp .retngetlex
  8240 00003EAE E90600                   jmp .getlex469
  8241                                  .getlex466:
  8242 00003EB1 B82F00                   mov ax, 47
  8243 00003EB4 E9DF02                   jmp .retngetlex
  8244                                  .getlex469:
  8245                                  
  8246                                  ;-787   if (c == '"') {getstring(c); return T_STRING;}
  8247                                  
  8248                                  .getlex465:
  8249 00003EB7 8A46FE                   mov al, [bp-2]
  8250 00003EBA 3C22                     cmp al, 34
  8251 00003EBC 0F851200                 jne .getlex470
  8252 00003EC0 8A46FE                   mov al, byte [bp-2]
  8253 00003EC3 B400                     mov ah, 0
  8254 00003EC5 50                       push ax
  8255 00003EC6 E89804                   call getstring
  8256 00003EC9 83C402                   add  sp, 2
  8257 00003ECC B80201                   mov ax, 258
  8258 00003ECF E9C402                   jmp .retngetlex
  8259                                  
  8260                                  ;-788   if (digit(c)) { getdigit(c); return T_CONST; }
  8261                                  
  8262                                  .getlex470:
  8263 00003ED2 8A46FE                   mov al, byte [bp-2]
  8264 00003ED5 B400                     mov ah, 0
  8265 00003ED7 50                       push ax
  8266 00003ED8 E8A1C3                   call digit
  8267 00003EDB 83C402                   add  sp, 2
  8268 00003EDE 08C0                     or  al, al
  8269 00003EE0 0F841200                 je .getlex471
  8270 00003EE4 8A46FE                   mov al, byte [bp-2]
  8271 00003EE7 B400                     mov ah, 0
  8272 00003EE9 50                       push ax
  8273 00003EEA E89E03                   call getdigit
  8274 00003EED 83C402                   add  sp, 2
  8275 00003EF0 B80101                   mov ax, 257
  8276 00003EF3 E9A002                   jmp .retngetlex
  8277                                  
  8278                                  ;-789   if (c==39) { lexval=next();
  8279                                  
  8280                                  .getlex471:
  8281 00003EF6 8A46FE                   mov al, [bp-2]
  8282 00003EF9 3C27                     cmp al, 39
  8283 00003EFB 0F854F00                 jne .getlex472
  8284 00003EFF E89604                   call next
  8285 00003F02 A3[2E00]                 mov word [lexval], ax
  8286                                  
  8287                                  ;-790     if (lexval==92) {lexval=next();
  8288                                  
  8289 00003F05 A1[2E00]                 mov ax, [lexval]
  8290 00003F08 83F85C                   cmp ax, 92
  8291 00003F0B 0F853600                 jne .getlex473
  8292 00003F0F E88604                   call next
  8293 00003F12 A3[2E00]                 mov word [lexval], ax
  8294                                  
  8295                                  ;-791       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8296                                  
  8297 00003F15 A1[2E00]                 mov ax, [lexval]
  8298 00003F18 83F86E                   cmp ax, 110
  8299 00003F1B 0F850600                 jne .getlex474
  8300 00003F1F B80A00                   mov ax, 10
  8301 00003F22 A3[2E00]                 mov word [lexval], ax
  8302                                  .getlex474:
  8303 00003F25 A1[2E00]                 mov ax, [lexval]
  8304 00003F28 83F874                   cmp ax, 116
  8305 00003F2B 0F850600                 jne .getlex475
  8306 00003F2F B80900                   mov ax, 9
  8307 00003F32 A3[2E00]                 mov word [lexval], ax
  8308                                  
  8309                                  ;-792       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8310                                  
  8311                                  .getlex475:
  8312 00003F35 A1[2E00]                 mov ax, [lexval]
  8313 00003F38 83F830                   cmp ax, 48
  8314 00003F3B 0F850600                 jne .getlex476
  8315 00003F3F B80000                   mov ax, 0
  8316 00003F42 A3[2E00]                 mov word [lexval], ax
  8317                                  .getlex476:
  8318                                  .getlex473:
  8319 00003F45 E85004                   call next
  8320 00003F48 B80101                   mov ax, 257
  8321 00003F4B E94802                   jmp .retngetlex
  8322                                  
  8323                                  ;-793   if (alnum(c)) { 
  8324                                  
  8325                                  .getlex472:
  8326 00003F4E 8A46FE                   mov al, byte [bp-2]
  8327 00003F51 B400                     mov ah, 0
  8328 00003F53 50                       push ax
  8329 00003F54 E8CDC3                   call alnum
  8330 00003F57 83C402                   add  sp, 2
  8331 00003F5A 08C0                     or  al, al
  8332 00003F5C 0F842D02                 je .getlex477
  8333                                  
  8334                                  ;-794     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8335                                  
  8336 00003F60 8D062B81                 lea  ax, [symbol]
  8337 00003F64 50                       push ax
  8338 00003F65 8D06DCD0                 lea  ax, [symboltemp]
  8339 00003F69 50                       push ax
  8340 00003F6A E8F9C1                   call strcpy
  8341 00003F6D 83C404                   add  sp, 4
  8342 00003F70 B82B81                   mov ax, symbol
  8343 00003F73 8946FC                   mov [bp-4], ax
  8344 00003F76 8A46FE                   mov al, [bp-2]
  8345 00003F79 8B5EFC                   mov  bx, [bp-4]
  8346 00003F7C 8807                     mov  [bx], al
  8347 00003F7E FF46FC                   inc  word[bp-4]
  8348                                  
  8349                                  ;-795     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8350                                  
  8351                                  .getlex478:
  8352 00003F81 A0[2100]                 mov al, byte [thechar]
  8353 00003F84 B400                     mov ah, 0
  8354 00003F86 50                       push ax
  8355 00003F87 E89AC3                   call alnum
  8356 00003F8A 83C402                   add  sp, 2
  8357 00003F8D 08C0                     or  al, al
  8358 00003F8F 0F841300                 je .getlex479
  8359 00003F93 E80204                   call next
  8360 00003F96 8846FE                   mov [bp-2], al
  8361 00003F99 8A46FE                   mov al, [bp-2]
  8362 00003F9C 8B5EFC                   mov  bx, [bp-4]
  8363 00003F9F 8807                     mov  [bx], al
  8364 00003FA1 FF46FC                   inc  word[bp-4]
  8365                                  
  8366                                  ;-796       *p=0;
  8367                                  
  8368 00003FA4 EBDB                     jmp .getlex478
  8369                                  .getlex479:
  8370 00003FA6 B80000                   mov ax, 0
  8371 00003FA9 8B5EFC                   mov  bx, [bp-4]
  8372 00003FAC 8807                     mov  [bx], al
  8373                                  
  8374                                  ;-797     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8375                                  
  8376 00003FAE 68[AE41]                 push getlex_1
  8377 00003FB1 8D062B81                 lea  ax, [symbol]
  8378 00003FB5 50                       push ax
  8379 00003FB6 E8DDC1                   call eqstr
  8380 00003FB9 83C404                   add  sp, 4
  8381 00003FBC 08C0                     or  al, al
  8382 00003FBE 0F840600                 je .getlex480
  8383 00003FC2 B81302                   mov ax, 531
  8384 00003FC5 E9CE01                   jmp .retngetlex
  8385                                  
  8386                                  ;-798     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8387                                  
  8388                                  .getlex480:
  8389 00003FC8 68[B541]                 push getlex_2
  8390 00003FCB 8D062B81                 lea  ax, [symbol]
  8391 00003FCF 50                       push ax
  8392 00003FD0 E8C3C1                   call eqstr
  8393 00003FD3 83C404                   add  sp, 4
  8394 00003FD6 08C0                     or  al, al
  8395 00003FD8 0F840600                 je .getlex481
  8396 00003FDC B81402                   mov ax, 532
  8397 00003FDF E9B401                   jmp .retngetlex
  8398                                  
  8399                                  ;-799     if (eqstr(symbol,"void"    )) return T_VOID;
  8400                                  
  8401                                  .getlex481:
  8402 00003FE2 68[BE41]                 push getlex_3
  8403 00003FE5 8D062B81                 lea  ax, [symbol]
  8404 00003FE9 50                       push ax
  8405 00003FEA E8A9C1                   call eqstr
  8406 00003FED 83C404                   add  sp, 4
  8407 00003FF0 08C0                     or  al, al
  8408 00003FF2 0F840600                 je .getlex482
  8409 00003FF6 B81102                   mov ax, 529
  8410 00003FF9 E99A01                   jmp .retngetlex
  8411                                  
  8412                                  ;-800     if (eqstr(symbol,"int"     )) return T_INT;
  8413                                  
  8414                                  .getlex482:
  8415 00003FFC 68[C341]                 push getlex_4
  8416 00003FFF 8D062B81                 lea  ax, [symbol]
  8417 00004003 50                       push ax
  8418 00004004 E88FC1                   call eqstr
  8419 00004007 83C404                   add  sp, 4
  8420 0000400A 08C0                     or  al, al
  8421 0000400C 0F840600                 je .getlex483
  8422 00004010 B80502                   mov ax, 517
  8423 00004013 E98001                   jmp .retngetlex
  8424                                  
  8425                                  ;-801     if (eqstr(symbol,"long"    )) return T_LONG;
  8426                                  
  8427                                  .getlex483:
  8428 00004016 68[C741]                 push getlex_5
  8429 00004019 8D062B81                 lea  ax, [symbol]
  8430 0000401D 50                       push ax
  8431 0000401E E875C1                   call eqstr
  8432 00004021 83C404                   add  sp, 4
  8433 00004024 08C0                     or  al, al
  8434 00004026 0F840600                 je .getlex484
  8435 0000402A B81502                   mov ax, 533
  8436 0000402D E96601                   jmp .retngetlex
  8437                                  
  8438                                  ;-802     if (eqstr(symbol,"char"    )) return T_CHAR;
  8439                                  
  8440                                  .getlex484:
  8441 00004030 68[CC41]                 push getlex_6
  8442 00004033 8D062B81                 lea  ax, [symbol]
  8443 00004037 50                       push ax
  8444 00004038 E85BC1                   call eqstr
  8445 0000403B 83C404                   add  sp, 4
  8446 0000403E 08C0                     or  al, al
  8447 00004040 0F840600                 je .getlex485
  8448 00004044 B81202                   mov ax, 530
  8449 00004047 E94C01                   jmp .retngetlex
  8450                                  
  8451                                  ;-803     if (eqstr(symbol,"asm"     )) return T_ASM;
  8452                                  
  8453                                  .getlex485:
  8454 0000404A 68[D141]                 push getlex_7
  8455 0000404D 8D062B81                 lea  ax, [symbol]
  8456 00004051 50                       push ax
  8457 00004052 E841C1                   call eqstr
  8458 00004055 83C404                   add  sp, 4
  8459 00004058 08C0                     or  al, al
  8460 0000405A 0F840600                 je .getlex486
  8461 0000405E B80602                   mov ax, 518
  8462 00004061 E93201                   jmp .retngetlex
  8463                                  
  8464                                  ;-804     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8465                                  
  8466                                  .getlex486:
  8467 00004064 68[D541]                 push getlex_8
  8468 00004067 8D062B81                 lea  ax, [symbol]
  8469 0000406B 50                       push ax
  8470 0000406C E827C1                   call eqstr
  8471 0000406F 83C404                   add  sp, 4
  8472 00004072 08C0                     or  al, al
  8473 00004074 0F840600                 je .getlex487
  8474 00004078 B80702                   mov ax, 519
  8475 0000407B E91801                   jmp .retngetlex
  8476                                  
  8477                                  ;-805     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8478                                  
  8479                                  .getlex487:
  8480 0000407E 68[DB41]                 push getlex_9
  8481 00004081 8D062B81                 lea  ax, [symbol]
  8482 00004085 50                       push ax
  8483 00004086 E80DC1                   call eqstr
  8484 00004089 83C404                   add  sp, 4
  8485 0000408C 08C0                     or  al, al
  8486 0000408E 0F840600                 je .getlex488
  8487 00004092 B80802                   mov ax, 520
  8488 00004095 E9FE00                   jmp .retngetlex
  8489                                  
  8490                                  ;-806     if (eqstr(symbol,"return"  )) return T_RETURN;
  8491                                  
  8492                                  .getlex488:
  8493 00004098 68[E441]                 push getlex_10
  8494 0000409B 8D062B81                 lea  ax, [symbol]
  8495 0000409F 50                       push ax
  8496 000040A0 E8F3C0                   call eqstr
  8497 000040A3 83C404                   add  sp, 4
  8498 000040A6 08C0                     or  al, al
  8499 000040A8 0F840600                 je .getlex489
  8500 000040AC B80002                   mov ax, 512
  8501 000040AF E9E400                   jmp .retngetlex
  8502                                  
  8503                                  ;-807     if (eqstr(symbol,"if"      )) return T_IF;
  8504                                  
  8505                                  .getlex489:
  8506 000040B2 68[EB41]                 push getlex_11
  8507 000040B5 8D062B81                 lea  ax, [symbol]
  8508 000040B9 50                       push ax
  8509 000040BA E8D9C0                   call eqstr
  8510 000040BD 83C404                   add  sp, 4
  8511 000040C0 08C0                     or  al, al
  8512 000040C2 0F840600                 je .getlex490
  8513 000040C6 B80102                   mov ax, 513
  8514 000040C9 E9CA00                   jmp .retngetlex
  8515                                  
  8516                                  ;-808     if (eqstr(symbol,"else"    )) return T_ELSE;
  8517                                  
  8518                                  .getlex490:
  8519 000040CC 68[EE41]                 push getlex_12
  8520 000040CF 8D062B81                 lea  ax, [symbol]
  8521 000040D3 50                       push ax
  8522 000040D4 E8BFC0                   call eqstr
  8523 000040D7 83C404                   add  sp, 4
  8524 000040DA 08C0                     or  al, al
  8525 000040DC 0F840600                 je .getlex491
  8526 000040E0 B80202                   mov ax, 514
  8527 000040E3 E9B000                   jmp .retngetlex
  8528                                  
  8529                                  ;-809     if (eqstr(symbol,"while"   )) return T_WHILE;
  8530                                  
  8531                                  .getlex491:
  8532 000040E6 68[F341]                 push getlex_13
  8533 000040E9 8D062B81                 lea  ax, [symbol]
  8534 000040ED 50                       push ax
  8535 000040EE E8A5C0                   call eqstr
  8536 000040F1 83C404                   add  sp, 4
  8537 000040F4 08C0                     or  al, al
  8538 000040F6 0F840600                 je .getlex492
  8539 000040FA B80302                   mov ax, 515
  8540 000040FD E99600                   jmp .retngetlex
  8541                                  
  8542                                  ;-810     if (eqstr(symbol,"do"      )) return T_DO;
  8543                                  
  8544                                  .getlex492:
  8545 00004100 68[F941]                 push getlex_14
  8546 00004103 8D062B81                 lea  ax, [symbol]
  8547 00004107 50                       push ax
  8548 00004108 E88BC0                   call eqstr
  8549 0000410B 83C404                   add  sp, 4
  8550 0000410E 08C0                     or  al, al
  8551 00004110 0F840600                 je .getlex493
  8552 00004114 B80402                   mov ax, 516
  8553 00004117 E97C00                   jmp .retngetlex
  8554                                  
  8555                                  ;-811     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8556                                  
  8557                                  .getlex493:
  8558 0000411A 68[FC41]                 push getlex_15
  8559 0000411D 8D062B81                 lea  ax, [symbol]
  8560 00004121 50                       push ax
  8561 00004122 E871C0                   call eqstr
  8562 00004125 83C404                   add  sp, 4
  8563 00004128 08C0                     or  al, al
  8564 0000412A 0F840600                 je .getlex494
  8565 0000412E B80902                   mov ax, 521
  8566 00004131 E96200                   jmp .retngetlex
  8567                                  
  8568                                  ;-812     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8569                                  
  8570                                  .getlex494:
  8571 00004134 68[0142]                 push getlex_16
  8572 00004137 8D062B81                 lea  ax, [symbol]
  8573 0000413B 50                       push ax
  8574 0000413C E857C0                   call eqstr
  8575 0000413F 83C404                   add  sp, 4
  8576 00004142 08C0                     or  al, al
  8577 00004144 0F840600                 je .getlex495
  8578 00004148 B8FF01                   mov ax, 511
  8579 0000414B E94800                   jmp .retngetlex
  8580                                  
  8581                                  ;-813     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8582                                  
  8583                                  .getlex495:
  8584 0000414E 68[0842]                 push getlex_17
  8585 00004151 8D062B81                 lea  ax, [symbol]
  8586 00004155 50                       push ax
  8587 00004156 E83DC0                   call eqstr
  8588 00004159 83C404                   add  sp, 4
  8589 0000415C 08C0                     or  al, al
  8590 0000415E 0F840600                 je .getlex496
  8591 00004162 B8FE01                   mov ax, 510
  8592 00004165 E92E00                   jmp .retngetlex
  8593                                  
  8594                                  ;-814     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8595                                  
  8596                                  .getlex496:
  8597 00004168 E8BF00                   call convertdefine
  8598 0000416B 08C0                     or  al, al
  8599 0000416D 0F841600                 je .getlex497
  8600 00004171 8D06DCD0                 lea  ax, [symboltemp]
  8601 00004175 50                       push ax
  8602 00004176 8D062B81                 lea  ax, [symbol]
  8603 0000417A 50                       push ax
  8604 0000417B E8E8BF                   call strcpy
  8605 0000417E 83C404                   add  sp, 4
  8606 00004181 B80101                   mov ax, 257
  8607 00004184 E90F00                   jmp .retngetlex
  8608                                  
  8609                                  ;-815     return T_NAME; } error1("Input item not recognized"); }
  8610                                  
  8611                                  .getlex497:
  8612 00004187 B80001                   mov ax, 256
  8613 0000418A E90900                   jmp .retngetlex
  8614                                  .getlex477:
  8615 0000418D 68[1042]                 push getlex_18
  8616 00004190 E87706                   call error1
  8617 00004193 83C402                   add  sp, 2
  8618                                  
  8619                                  ;-816 
  8620                                  
  8621                                  
  8622                                  ;-817 int convertdefine() { int i; int j;   i=0;
  8623                                  
  8624 00004196 C9                       .retngetlex: LEAVE
  8625 00004197 C3                       ret
  8626 00004198 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8627 000041A1 3A252D3E3C3D2B2126-
  8628 000041AA 7C233F00           
  8629 000041AE 7369676E656400          getlex_1 db "signed",0
  8630 000041B5 756E7369676E656400      getlex_2 db "unsigned",0
  8631 000041BE 766F696400              getlex_3 db "void",0
  8632 000041C3 696E7400                getlex_4 db "int",0
  8633 000041C7 6C6F6E6700              getlex_5 db "long",0
  8634 000041CC 6368617200              getlex_6 db "char",0
  8635 000041D1 61736D00                getlex_7 db "asm",0
  8636 000041D5 5F5F61736D00            getlex_8 db "__asm",0
  8637 000041DB 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8638 000041E4 72657475726E00          getlex_10 db "return",0
  8639 000041EB 696600                  getlex_11 db "if",0
  8640 000041EE 656C736500              getlex_12 db "else",0
  8641 000041F3 7768696C6500            getlex_13 db "while",0
  8642 000041F9 646F00                  getlex_14 db "do",0
  8643 000041FC 676F746F00              getlex_15 db "goto",0
  8644 00004201 646566696E6500          getlex_16 db "define",0
  8645 00004208 696E636C75646500        getlex_17 db "include",0
  8646 00004210 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8647 00004219 6D206E6F7420726563-
  8648 00004222 6F676E697A656400   
  8649                                  ENDP
  8650                                  
  8651                                  convertdefine: PROC
  8652                                  ;Function : convertdefine, Number of local variables: 2
  8653                                  ;   # type sign width addr used name   list of local variables
  8654                                  ;  200 var sign word   817 NULL i = bp-2
  8655                                  ;  201 var sign word   817 NULL j = bp-4;
  8656 0000422A C8040000                 ENTER  4,0
  8657 0000422E B80000                   mov ax, 0
  8658 00004231 8946FE                   mov [bp-2], ax
  8659                                  
  8660                                  ;-818   while (i < GTop) {
  8661                                  
  8662                                  .convertdefine498:
  8663 00004234 8B46FE                   mov ax, [bp-2]
  8664 00004237 3B06[2A00]               cmp ax, [GTop]
  8665 0000423B 0F8D4400                 jge .convertdefine499
  8666                                  
  8667                                  ;-819    j=adrofname(i); 
  8668                                  
  8669 0000423F FF76FE                   push word [bp-2]
  8670 00004242 E88FC6                   call adrofname
  8671 00004245 83C402                   add  sp, 2
  8672 00004248 8946FC                   mov [bp-4], ax
  8673                                  
  8674                                  ;-820    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8675                                  
  8676 0000424B FF76FC                   push word [bp-4]
  8677 0000424E 8D062B81                 lea  ax, [symbol]
  8678 00004252 50                       push ax
  8679 00004253 E840BF                   call eqstr
  8680 00004256 83C404                   add  sp, 4
  8681 00004259 08C0                     or  al, al
  8682 0000425B 0F841F00                 je .convertdefine500
  8683 0000425F 8B5EFE                   mov bx, [bp-2]
  8684 00004262 8A87B782                 mov al, [GType + bx]
  8685 00004266 3C23                     cmp al, 35
  8686 00004268 0F851200                 jne .convertdefine501
  8687 0000426C 8B5EFE                   mov bx, [bp-2]
  8688 0000426F D1E3                     shl bx, 1
  8689 00004271 8B87EB8A                 mov ax, [GData + bx]
  8690 00004275 A3[2E00]                 mov word [lexval], ax
  8691                                  
  8692                                  ;-821    return T_CONST; } }
  8693                                  
  8694 00004278 B80101                   mov ax, 257
  8695 0000427B E90B00                   jmp .retnconvertdefine
  8696                                  .convertdefine501:
  8697                                  
  8698                                  ;-822    i++; } 
  8699                                  
  8700                                  .convertdefine500:
  8701 0000427E FF46FE                   inc  word[bp-2]
  8702                                  
  8703                                  ;-823    return 0; }
  8704                                  
  8705 00004281 EBB1                     jmp .convertdefine498
  8706                                  .convertdefine499:
  8707 00004283 B80000                   mov ax, 0
  8708 00004286 E90000                   jmp .retnconvertdefine
  8709                                  
  8710                                  ;-824 int getdigit(char c) { int i;
  8711                                  
  8712 00004289 C9                       .retnconvertdefine: LEAVE
  8713 0000428A C3                       ret
  8714                                  ENDP
  8715                                  
  8716                                  getdigit: PROC
  8717                                  
  8718                                  ;-825     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8719                                  
  8720                                  ;Function : getdigit, Number of local variables: 2
  8721                                  ;   # type sign width addr used name   list of local variables
  8722                                  ;  200 var sign byte   824 NULL c = bp+4
  8723                                  ;  201 var sign word   824 NULL i = bp-2;
  8724 0000428B C8020000                 ENTER  2,0
  8725 0000428F B80000                   mov ax, 0
  8726 00004292 A3[2E00]                 mov word [lexval], ax
  8727 00004295 8A4604                   mov al, [bp+4]
  8728 00004298 2C30                     sub al, 48
  8729 0000429A A3[2E00]                 mov word [lexval], ax
  8730                                  
  8731                                  ;-826     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8732                                  
  8733 0000429D A0[2100]                 mov al, [thechar]
  8734 000042A0 3C78                     cmp al, 120
  8735 000042A2 0F850600                 jne .getdigit502
  8736 000042A6 B85800                   mov ax, 88
  8737 000042A9 A2[2100]                 mov byte [thechar], al
  8738                                  .getdigit502:
  8739 000042AC A0[2100]                 mov al, [thechar]
  8740 000042AF 3C58                     cmp al, 88
  8741 000042B1 0F856800                 jne .getdigit503
  8742 000042B5 E8E000                   call next
  8743                                  
  8744                                  ;-827       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8745                                  
  8746                                  .getdigit504:
  8747 000042B8 A0[2100]                 mov al, byte [thechar]
  8748 000042BB B400                     mov ah, 0
  8749 000042BD 50                       push ax
  8750 000042BE E863C0                   call alnum
  8751 000042C1 83C402                   add  sp, 2
  8752 000042C4 08C0                     or  al, al
  8753 000042C6 0F845000                 je .getdigit505
  8754 000042CA E8CB00                   call next
  8755 000042CD 884604                   mov [bp+4], al
  8756 000042D0 8A4604                   mov al, [bp+4]
  8757 000042D3 3C60                     cmp al, 96
  8758 000042D5 0F8E0800                 jle .getdigit506
  8759 000042D9 8A4604                   mov al, [bp+4]
  8760 000042DC 2C27                     sub al, 39
  8761 000042DE 884604                   mov [bp+4], al
  8762                                  
  8763                                  ;-828 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8764                                  
  8765                                  .getdigit506:
  8766 000042E1 8A4604                   mov al, [bp+4]
  8767 000042E4 3C40                     cmp al, 64
  8768 000042E6 0F8E0800                 jle .getdigit507
  8769 000042EA 8A4604                   mov al, [bp+4]
  8770 000042ED 2C07                     sub al, 7
  8771 000042EF 884604                   mov [bp+4], al
  8772                                  .getdigit507:
  8773 000042F2 8A4604                   mov al, [bp+4]
  8774 000042F5 2C30                     sub al, 48
  8775 000042F7 884604                   mov [bp+4], al
  8776 000042FA A1[2E00]                 mov ax, [lexval]
  8777 000042FD C1E004                   shl ax, 4
  8778 00004300 A3[2E00]                 mov word [lexval], ax
  8779                                  
  8780                                  ;-829      i=0; i=c; lexval=lexval+i;}
  8781                                  
  8782 00004303 B80000                   mov ax, 0
  8783 00004306 8946FE                   mov [bp-2], ax
  8784 00004309 8A4604                   mov al, [bp+4]
  8785 0000430C 8946FE                   mov [bp-2], ax
  8786 0000430F A1[2E00]                 mov ax, [lexval]
  8787 00004312 0346FE                   add ax, [bp-2]
  8788 00004315 A3[2E00]                 mov word [lexval], ax
  8789                                  
  8790                                  ;-830     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8791                                  
  8792 00004318 EB9E                     jmp .getdigit504
  8793                                  .getdigit505:
  8794 0000431A E94200                   jmp .getdigit508
  8795                                  .getdigit503:
  8796                                  .getdigit509:
  8797 0000431D A0[2100]                 mov al, byte [thechar]
  8798 00004320 B400                     mov ah, 0
  8799 00004322 50                       push ax
  8800 00004323 E856BF                   call digit
  8801 00004326 83C402                   add  sp, 2
  8802 00004329 08C0                     or  al, al
  8803 0000432B 0F843000                 je .getdigit510
  8804 0000432F E86600                   call next
  8805 00004332 884604                   mov [bp+4], al
  8806 00004335 8A4604                   mov al, [bp+4]
  8807 00004338 2C30                     sub al, 48
  8808 0000433A 884604                   mov [bp+4], al
  8809 0000433D A1[2E00]                 mov ax, [lexval]
  8810 00004340 BB0A00                   mov bx, 10
  8811 00004343 F7E3                     mul bx
  8812 00004345 A3[2E00]                 mov word [lexval], ax
  8813                                  
  8814                                  ;-831      i=0; i=c; lexval=lexval+i; } } 
  8815                                  
  8816 00004348 B80000                   mov ax, 0
  8817 0000434B 8946FE                   mov [bp-2], ax
  8818 0000434E 8A4604                   mov al, [bp+4]
  8819 00004351 8946FE                   mov [bp-2], ax
  8820 00004354 A1[2E00]                 mov ax, [lexval]
  8821 00004357 0346FE                   add ax, [bp-2]
  8822 0000435A A3[2E00]                 mov word [lexval], ax
  8823 0000435D EBBE                     jmp .getdigit509
  8824                                  .getdigit510:
  8825                                  
  8826                                  ;-832 }
  8827                                  
  8828                                  .getdigit508:
  8829                                  
  8830                                  ;-833 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8831 0000435F C9                       LEAVE
  8832 00004360 C3                       ret
  8833                                  ENDP
  8834                                  
  8835                                  getstring: PROC
  8836                                  ;Function : getstring, Number of local variables: 3
  8837                                  ;   # type sign width addr used name   list of local variables
  8838                                  ;  200 var sign word   833 NULL delim = bp+4
  8839                                  ;  201 var sign word   833 NULL c = bp-2
  8840                                  ;  202 ptr sign byte   833 NULL p = bp-4;
  8841 00004361 C8040000                 ENTER  4,0
  8842 00004365 B82B81                   mov ax, symbol
  8843 00004368 8946FC                   mov [bp-4], ax
  8844 0000436B E82A00                   call next
  8845 0000436E 8946FE                   mov [bp-2], ax
  8846                                  
  8847                                  ;-834   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8848                                  
  8849                                  .getstring511:
  8850 00004371 8B46FE                   mov ax, [bp-2]
  8851 00004374 3B4604                   cmp ax, [bp+4]
  8852 00004377 0F841300                 je  .getstring512
  8853 0000437B 8B46FE                   mov ax, [bp-2]
  8854 0000437E 8B5EFC                   mov  bx, [bp-4]
  8855 00004381 8807                     mov  [bx], al
  8856 00004383 FF46FC                   inc  word[bp-4]
  8857 00004386 E80F00                   call next
  8858 00004389 8946FE                   mov [bp-2], ax
  8859 0000438C EBE3                     jmp .getstring511
  8860                                  .getstring512:
  8861 0000438E B80000                   mov ax, 0
  8862 00004391 8B5EFC                   mov  bx, [bp-4]
  8863 00004394 8807                     mov  [bx], al
  8864                                  
  8865                                  ;-835 
  8866                                  
  8867                                  
  8868                                  ;-836 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8869 00004396 C9                       LEAVE
  8870 00004397 C3                       ret
  8871                                  ENDP
  8872                                  
  8873                                  next: PROC
  8874                                  ;Function : next, Number of local variables: 1
  8875                                  ;   # type sign width addr used name   list of local variables
  8876                                  ;  200 var sign byte   836 NULL r = bp-2;
  8877 00004398 C8020000                 ENTER  2,0
  8878 0000439C A0[2100]                 mov al, [thechar]
  8879 0000439F 8846FE                   mov [bp-2], al
  8880 000043A2 8A46FE                   mov al, [bp-2]
  8881 000043A5 A2[1E00]                 mov byte [globC], al
  8882 000043A8 E82E03                   call fgets1
  8883 000043AB A2[2100]                 mov byte [thechar], al
  8884 000043AE 8A46FE                   mov al, [bp-2]
  8885 000043B1 E90000                   jmp .retnnext
  8886                                  
  8887                                  ;-837 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8888                                  
  8889 000043B4 C9                       .retnnext: LEAVE
  8890 000043B5 C3                       ret
  8891                                  ENDP
  8892                                  
  8893                                  istoken: PROC
  8894                                  ;Function : istoken, Number of local variables: 1
  8895                                  ;   # type sign width addr used name   list of local variables
  8896                                  ;  200 var sign word   837 NULL t = bp+4;
  8897 000043B6 C8000000                 ENTER  0,0
  8898 000043BA A1[1C00]                 mov ax, [token]
  8899 000043BD 3B4604                   cmp ax, [bp+4]
  8900 000043C0 0F850C00                 jne .istoken513
  8901 000043C4 E8C2F8                   call getlex
  8902 000043C7 A3[1C00]                 mov word [token], ax
  8903 000043CA B80100                   mov ax, 1
  8904 000043CD E90600                   jmp .retnistoken
  8905                                  .istoken513:
  8906 000043D0 B80000                   mov ax, 0
  8907 000043D3 E90000                   jmp .retnistoken
  8908                                  
  8909                                  ;-838 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8910                                  
  8911 000043D6 C9                       .retnistoken: LEAVE
  8912 000043D7 C3                       ret
  8913                                  ENDP
  8914                                  
  8915                                  expect: PROC
  8916                                  ;Function : expect, Number of local variables: 1
  8917                                  ;   # type sign width addr used name   list of local variables
  8918                                  ;  200 var sign word   838 NULL t = bp+4;
  8919 000043D8 C8000000                 ENTER  0,0
  8920 000043DC FF7604                   push word [bp+4]
  8921 000043DF E8D4FF                   call istoken
  8922 000043E2 83C402                   add  sp, 2
  8923 000043E5 83F800                   cmp ax, 0
  8924 000043E8 0F853200                 jne .expect514
  8925 000043EC B80000                   mov ax, 0
  8926 000043EF 8B1E[1600]               mov  bx, [cloc]
  8927 000043F3 8807                     mov  [bx], al
  8928 000043F5 8D063075                 lea  ax, [co]
  8929 000043F9 50                       push ax
  8930 000043FA E8EE00                   call prs
  8931 000043FD 83C402                   add  sp, 2
  8932 00004400 E80905                   call listproc
  8933                                  
  8934                                  ;-839   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8935                                  
  8936 00004403 68[2044]                 push expect_0
  8937 00004406 E8E200                   call prs
  8938 00004409 83C402                   add  sp, 2
  8939 0000440C FF7604                   push word [bp+4]
  8940 0000440F E8D001                   call pint1
  8941 00004412 83C402                   add  sp, 2
  8942 00004415 68[3844]                 push expect_1
  8943 00004418 E8EF03                   call error1
  8944 0000441B 83C402                   add  sp, 2
  8945                                  .expect514:
  8946                                  
  8947                                  ;-840 
  8948                                  
  8949                                  
  8950                                  ;-841 int eprc(char c)  {*cloc=c; cloc++; }
  8951 0000441E C9                       LEAVE
  8952 0000441F C3                       ret
  8953 00004420 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8954 00004429 642041534349492864-
  8955 00004432 657A293A2000       
  8956 00004438 206E6F7420666F756E-     expect_1 db " not found",0
  8957 00004441 6400               
  8958                                  ENDP
  8959                                  
  8960                                  eprc: PROC
  8961                                  ;Function : eprc, Number of local variables: 1
  8962                                  ;   # type sign width addr used name   list of local variables
  8963                                  ;  200 var sign byte   841 NULL c = bp+4;
  8964 00004443 C8000000                 ENTER  0,0
  8965 00004447 8A4604                   mov al, [bp+4]
  8966 0000444A 8B1E[1600]               mov  bx, [cloc]
  8967 0000444E 8807                     mov  [bx], al
  8968 00004450 FF06[1600]               inc  word[cloc]
  8969                                  
  8970                                  ;-842 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8971 00004454 C9                       LEAVE
  8972 00004455 C3                       ret
  8973                                  ENDP
  8974                                  
  8975                                  eprs: PROC
  8976                                  ;Function : eprs, Number of local variables: 2
  8977                                  ;   # type sign width addr used name   list of local variables
  8978                                  ;  200 ptr sign byte   842 NULL s = bp+4
  8979                                  ;  201 var sign byte   842 NULL c = bp-2;
  8980 00004456 C8020000                 ENTER  2,0
  8981                                  .eprs515:
  8982 0000445A 8B5E04                   mov bx, [bp+4]
  8983 0000445D 8A07                     mov al, [bx]
  8984 0000445F B400                     mov ah, 0
  8985 00004461 08C0                     or  al, al
  8986 00004463 0F841B00                 je .eprs516
  8987 00004467 8B5E04                   mov bx, [bp+4]
  8988 0000446A 8A07                     mov al, [bx]
  8989 0000446C B400                     mov ah, 0
  8990 0000446E 8846FE                   mov [bp-2], al
  8991 00004471 8A46FE                   mov al, byte [bp-2]
  8992 00004474 B400                     mov ah, 0
  8993 00004476 50                       push ax
  8994 00004477 E8C9FF                   call eprc
  8995 0000447A 83C402                   add  sp, 2
  8996 0000447D FF4604                   inc  word[bp+4]
  8997 00004480 EBD8                     jmp .eprs515
  8998                                  .eprs516:
  8999                                  
  9000                                  ;-843 int prc(unsigned char c) { 
  9001 00004482 C9                       LEAVE
  9002 00004483 C3                       ret
  9003                                  ENDP
  9004                                  
  9005                                  prc: PROC
  9006                                  
  9007                                  ;-844   if (c==10) {_AX=13; writetty(); }
  9008                                  
  9009                                  ;Function : prc, Number of local variables: 1
  9010                                  ;   # type sign width addr used name   list of local variables
  9011                                  ;  200 var unsg byte   843 NULL c = bp+4;
  9012 00004484 C8000000                 ENTER  0,0
  9013 00004488 8A4604                   mov al, [bp+4]
  9014 0000448B 3C0A                     cmp al, 10
  9015 0000448D 0F850600                 jne .prc517
  9016 00004491 B80D00                   mov  ax, 13
  9017 00004494 E8DCBB                   call writetty
  9018                                  
  9019                                  ;-845   _AL=c; writetty(); 
  9020                                  
  9021                                  .prc517:
  9022 00004497 8A4604                   mov  al, [bp+4]
  9023 0000449A E8D6BB                   call writetty
  9024                                  
  9025                                  ;-846   fputcR(c, fdout); 
  9026                                  
  9027 0000449D FF36[1A00]               push word [fdout]
  9028 000044A1 8A4604                   mov al, byte [bp+4]
  9029 000044A4 B400                     mov ah, 0
  9030 000044A6 50                       push ax
  9031 000044A7 E87FBC                   call fputcR
  9032 000044AA 83C404                   add  sp, 4
  9033                                  
  9034                                  ;-847   }
  9035                                  
  9036                                  
  9037                                  ;-848 int prscomment(unsigned char *s) {unsigned char c;
  9038 000044AD C9                       LEAVE
  9039 000044AE C3                       ret
  9040                                  ENDP
  9041                                  
  9042                                  prscomment: PROC
  9043                                  
  9044                                  ;-849   while(*s){c=*s;prc(c);s++;} }
  9045                                  
  9046                                  ;Function : prscomment, Number of local variables: 2
  9047                                  ;   # type sign width addr used name   list of local variables
  9048                                  ;  200 ptr unsg byte   848 NULL s = bp+4
  9049                                  ;  201 var unsg byte   848 NULL c = bp-2;
  9050 000044AF C8020000                 ENTER  2,0
  9051                                  .prscomment518:
  9052 000044B3 8B5E04                   mov bx, [bp+4]
  9053 000044B6 8A07                     mov al, [bx]
  9054 000044B8 B400                     mov ah, 0
  9055 000044BA 08C0                     or  al, al
  9056 000044BC 0F841B00                 je .prscomment519
  9057 000044C0 8B5E04                   mov bx, [bp+4]
  9058 000044C3 8A07                     mov al, [bx]
  9059 000044C5 B400                     mov ah, 0
  9060 000044C7 8846FE                   mov [bp-2], al
  9061 000044CA 8A46FE                   mov al, byte [bp-2]
  9062 000044CD B400                     mov ah, 0
  9063 000044CF 50                       push ax
  9064 000044D0 E8B1FF                   call prc
  9065 000044D3 83C402                   add  sp, 2
  9066 000044D6 FF4604                   inc  word[bp+4]
  9067 000044D9 EBD8                     jmp .prscomment518
  9068                                  .prscomment519:
  9069                                  
  9070                                  ;-850 int prnl() { prs("\n ");}
  9071 000044DB C9                       LEAVE
  9072 000044DC C3                       ret
  9073                                  ENDP
  9074                                  
  9075                                  prnl: PROC
  9076 000044DD 68[E744]                 push prnl_0
  9077 000044E0 E80800                   call prs
  9078 000044E3 83C402                   add  sp, 2
  9079                                  
  9080                                  ;-851 
  9081                                  
  9082                                  
  9083                                  ;-852 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9084                                  
  9085 000044E6 C3                       ret
  9086 000044E7 5C6E2000                prnl_0 db "\n ",0
  9087                                  ENDP
  9088                                  
  9089                                  prs: PROC
  9090                                  ;Function : prs, Number of local variables: 3
  9091                                  ;   # type sign width addr used name   list of local variables
  9092                                  ;  200 ptr unsg byte   852 NULL s = bp+4
  9093                                  ;  201 var unsg byte   852 NULL c = bp-2
  9094                                  ;  202 var sign word   852 NULL com = bp-4;
  9095 000044EB C8040000                 ENTER  4,0
  9096 000044EF B80000                   mov ax, 0
  9097 000044F2 8946FC                   mov [bp-4], ax
  9098                                  
  9099                                  ;-853   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9100                                  
  9101                                  .prs520:
  9102 000044F5 8B5E04                   mov bx, [bp+4]
  9103 000044F8 8A07                     mov al, [bx]
  9104 000044FA B400                     mov ah, 0
  9105 000044FC 08C0                     or  al, al
  9106 000044FE 0F847B00                 je .prs521
  9107 00004502 8B5E04                   mov bx, [bp+4]
  9108 00004505 8A07                     mov al, [bx]
  9109 00004507 B400                     mov ah, 0
  9110 00004509 8846FE                   mov [bp-2], al
  9111 0000450C 8A46FE                   mov al, [bp-2]
  9112 0000450F 3C22                     cmp al, 34
  9113 00004511 0F851800                 jne .prs522
  9114 00004515 8B46FC                   mov ax, [bp-4]
  9115 00004518 08C0                     or  al, al
  9116 0000451A 0F840900                 je .prs523
  9117 0000451E B80000                   mov ax, 0
  9118 00004521 8946FC                   mov [bp-4], ax
  9119 00004524 E90600                   jmp .prs524
  9120                                  .prs523:
  9121 00004527 B80100                   mov ax, 1
  9122 0000452A 8946FC                   mov [bp-4], ax
  9123                                  
  9124                                  ;-854     if (c==92) { if (com==0) { s++; c=*s;
  9125                                  
  9126                                  .prs524:
  9127                                  .prs522:
  9128 0000452D 8A46FE                   mov al, [bp-2]
  9129 00004530 3C5C                     cmp al, 92
  9130 00004532 0F853500                 jne .prs525
  9131 00004536 8B46FC                   mov ax, [bp-4]
  9132 00004539 83F800                   cmp ax, 0
  9133 0000453C 0F852B00                 jne .prs526
  9134 00004540 FF4604                   inc  word[bp+4]
  9135 00004543 8B5E04                   mov bx, [bp+4]
  9136 00004546 8A07                     mov al, [bx]
  9137 00004548 B400                     mov ah, 0
  9138 0000454A 8846FE                   mov [bp-2], al
  9139                                  
  9140                                  ;-855           if (c=='n') c=10; if (c=='t') c= 9;
  9141                                  
  9142 0000454D 8A46FE                   mov al, [bp-2]
  9143 00004550 3C6E                     cmp al, 110
  9144 00004552 0F850600                 jne .prs527
  9145 00004556 B80A00                   mov ax, 10
  9146 00004559 8846FE                   mov [bp-2], al
  9147                                  .prs527:
  9148 0000455C 8A46FE                   mov al, [bp-2]
  9149 0000455F 3C74                     cmp al, 116
  9150 00004561 0F850600                 jne .prs528
  9151 00004565 B80900                   mov ax, 9
  9152 00004568 8846FE                   mov [bp-2], al
  9153                                  
  9154                                  ;-856     } } prc(c); s++;  } }
  9155                                  
  9156                                  .prs528:
  9157                                  .prs526:
  9158                                  .prs525:
  9159 0000456B 8A46FE                   mov al, byte [bp-2]
  9160 0000456E B400                     mov ah, 0
  9161 00004570 50                       push ax
  9162 00004571 E810FF                   call prc
  9163 00004574 83C402                   add  sp, 2
  9164 00004577 FF4604                   inc  word[bp+4]
  9165 0000457A E978FF                   jmp .prs520
  9166                                  .prs521:
  9167                                  
  9168                                  ;-857 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9169 0000457D C9                       LEAVE
  9170 0000457E C3                       ret
  9171                                  ENDP
  9172                                  
  9173                                  eprnum: PROC
  9174                                  ;Function : eprnum, Number of local variables: 2
  9175                                  ;   # type sign width addr used name   list of local variables
  9176                                  ;  200 var sign word   857 NULL n = bp+4
  9177                                  ;  201 var sign word   857 NULL e = bp-2;
  9178 0000457F C8020000                 ENTER  2,0
  9179 00004583 8B4604                   mov ax, [bp+4]
  9180 00004586 83F800                   cmp ax, 0
  9181 00004589 0F8D1400                 jge .eprnum529
  9182 0000458D 6A2D                     push 45
  9183 0000458F E8B1FE                   call eprc
  9184 00004592 83C402                   add  sp, 2
  9185 00004595 FF7604                   push word [bp+4]
  9186 00004598 E827BB                   call mkneg
  9187 0000459B 83C402                   add  sp, 2
  9188 0000459E 894604                   mov [bp+4], ax
  9189                                  
  9190                                  ;-858   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9191                                  
  9192                                  .eprnum529:
  9193 000045A1 8B4604                   mov ax, [bp+4]
  9194 000045A4 83F80A                   cmp ax, 10 ;unsigned : 1
  9195 000045A7 0F8C1500                 jl  .eprnum530
  9196 000045AB 8B4604                   mov ax, [bp+4]
  9197 000045AE BB0A00                   mov bx, 10
  9198 000045B1 99                       cwd
  9199 000045B2 F7FB                     idiv bx
  9200 000045B4 8946FE                   mov [bp-2], ax
  9201 000045B7 FF76FE                   push word [bp-2]
  9202 000045BA E8C2FF                   call eprnum
  9203 000045BD 83C402                   add  sp, 2
  9204                                  .eprnum530:
  9205 000045C0 8B4604                   mov ax, [bp+4]
  9206 000045C3 BB0A00                   mov bx, 10
  9207 000045C6 99                       cwd
  9208 000045C7 F7FB                     idiv bx
  9209 000045C9 89D0                     mov ax, dx
  9210 000045CB 894604                   mov [bp+4], ax
  9211 000045CE 8B4604                   mov ax, [bp+4]
  9212 000045D1 83C030                   add ax, 48
  9213 000045D4 894604                   mov [bp+4], ax
  9214 000045D7 FF7604                   push word [bp+4]
  9215 000045DA E866FE                   call eprc
  9216 000045DD 83C402                   add  sp, 2
  9217                                  
  9218                                  ;-859 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9219 000045E0 C9                       LEAVE
  9220 000045E1 C3                       ret
  9221                                  ENDP
  9222                                  
  9223                                  pint1: PROC
  9224                                  ;Function : pint1, Number of local variables: 2
  9225                                  ;   # type sign width addr used name   list of local variables
  9226                                  ;  200 var sign word   859 NULL n = bp+4
  9227                                  ;  201 var sign word   859 NULL e = bp-2;
  9228 000045E2 C8020000                 ENTER  2,0
  9229 000045E6 8B4604                   mov ax, [bp+4]
  9230 000045E9 83F800                   cmp ax, 0
  9231 000045EC 0F8D1400                 jge .pint1531
  9232 000045F0 6A2D                     push 45
  9233 000045F2 E88FFE                   call prc
  9234 000045F5 83C402                   add  sp, 2
  9235 000045F8 FF7604                   push word [bp+4]
  9236 000045FB E8C4BA                   call mkneg
  9237 000045FE 83C402                   add  sp, 2
  9238 00004601 894604                   mov [bp+4], ax
  9239                                  
  9240                                  ;-860   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }  
  9241                                  
  9242                                  .pint1531:
  9243 00004604 8B4604                   mov ax, [bp+4]
  9244 00004607 83F80A                   cmp ax, 10 ;unsigned : 1
  9245 0000460A 0F8C1500                 jl  .pint1532
  9246 0000460E 8B4604                   mov ax, [bp+4]
  9247 00004611 BB0A00                   mov bx, 10
  9248 00004614 99                       cwd
  9249 00004615 F7FB                     idiv bx
  9250 00004617 8946FE                   mov [bp-2], ax
  9251 0000461A FF76FE                   push word [bp-2]
  9252 0000461D E8C2FF                   call pint1
  9253 00004620 83C402                   add  sp, 2
  9254                                  .pint1532:
  9255 00004623 8B4604                   mov ax, [bp+4]
  9256 00004626 BB0A00                   mov bx, 10
  9257 00004629 99                       cwd
  9258 0000462A F7FB                     idiv bx
  9259 0000462C 89D0                     mov ax, dx
  9260 0000462E 894604                   mov [bp+4], ax
  9261 00004631 83460430                 add  word[bp+4], 48
  9262 00004635 FF7604                   push word [bp+4]
  9263 00004638 E849FE                   call prc
  9264 0000463B 83C402                   add  sp, 2
  9265                                  
  9266                                  ;-861 int prunsign1(unsigned int n) { unsigned int e;
  9267 0000463E C9                       LEAVE
  9268 0000463F C3                       ret
  9269                                  ENDP
  9270                                  
  9271                                  prunsign1: PROC
  9272                                  
  9273                                  ;-862   if ( _ n >= 10) {  e=n/10; prunsign1(e); }
  9274                                  
  9275                                  ;Function : prunsign1, Number of local variables: 2
  9276                                  ;   # type sign width addr used name   list of local variables
  9277                                  ;  200 var unsg word   861 NULL n = bp+4
  9278                                  ;  201 var unsg word   861 NULL e = bp-2;
  9279 00004640 C8020000                 ENTER  2,0 ; constant expression
  9280 00004644 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9281 00004648 0F821700                 jb  .prunsign1533
  9282 0000464C 8B4604                   mov ax, [bp+4]
  9283 0000464F BB0A00                   mov bx, 10
  9284 00004652 BA0000                   mov dx, 0
  9285 00004655 F7F3                     div bx
  9286 00004657 8946FE                   mov [bp-2], ax
  9287 0000465A FF76FE                   push word [bp-2]
  9288 0000465D E8E0FF                   call prunsign1
  9289 00004660 83C402                   add  sp, 2
  9290                                  
  9291                                  ;-863     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }  
  9292                                  
  9293                                  .prunsign1533:
  9294 00004663 8B4604                   mov ax, [bp+4]
  9295 00004666 BB0A00                   mov bx, 10
  9296 00004669 BA0000                   mov dx, 0
  9297 0000466C F7F3                     div bx
  9298 0000466E 89D0                     mov ax, dx
  9299 00004670 894604                   mov [bp+4], ax
  9300 00004673 83460430                 add  word[bp+4], 48
  9301 00004677 FF7604                   push word [bp+4]
  9302 0000467A E807FE                   call prc
  9303 0000467D 83C402                   add  sp, 2
  9304                                  
  9305                                  ;-864 int printint51(unsigned int j)  {
  9306 00004680 C9                       LEAVE
  9307 00004681 C3                       ret
  9308                                  ENDP
  9309                                  
  9310                                  printint51: PROC
  9311                                  
  9312                                  ;-865   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9313                                  
  9314                                  ;Function : printint51, Number of local variables: 1
  9315                                  ;   # type sign width addr used name   list of local variables
  9316                                  ;  200 var unsg word   864 NULL j = bp+4;
  9317 00004682 C8000000                 ENTER  0,0
  9318 00004686 8B4604                   mov ax, [bp+4]
  9319 00004689 3D1027                   cmp ax, 10000
  9320 0000468C 0F8D0800                 jge .printint51534
  9321 00004690 6A20                     push 32
  9322 00004692 E8EFFD                   call prc
  9323 00004695 83C402                   add  sp, 2
  9324                                  .printint51534:
  9325 00004698 8B4604                   mov ax, [bp+4]
  9326 0000469B 3DE803                   cmp ax, 1000
  9327 0000469E 0F8D0800                 jge .printint51535
  9328 000046A2 6A20                     push 32
  9329 000046A4 E8DDFD                   call prc
  9330 000046A7 83C402                   add  sp, 2
  9331                                  .printint51535:
  9332 000046AA 8B4604                   mov ax, [bp+4]
  9333 000046AD 83F864                   cmp ax, 100
  9334 000046B0 0F8D0800                 jge .printint51536
  9335 000046B4 6A20                     push 32
  9336 000046B6 E8CBFD                   call prc
  9337 000046B9 83C402                   add  sp, 2
  9338                                  
  9339                                  ;-866    if (j<10) prc(32);  prunsign1(j); }
  9340                                  
  9341                                  .printint51536:
  9342 000046BC 8B4604                   mov ax, [bp+4]
  9343 000046BF 83F80A                   cmp ax, 10
  9344 000046C2 0F8D0800                 jge .printint51537
  9345 000046C6 6A20                     push 32
  9346 000046C8 E8B9FD                   call prc
  9347 000046CB 83C402                   add  sp, 2
  9348                                  .printint51537:
  9349 000046CE FF7604                   push word [bp+4]
  9350 000046D1 E86CFF                   call prunsign1
  9351 000046D4 83C402                   add  sp, 2
  9352                                  
  9353                                  ;-867 
  9354                                  
  9355                                  
  9356                                  ;-868 int fgets1() { char c; c=*fgetsp;
  9357 000046D7 C9                       LEAVE
  9358 000046D8 C3                       ret
  9359                                  ENDP
  9360                                  
  9361                                  fgets1: PROC
  9362                                  ;Function : fgets1, Number of local variables: 1
  9363                                  ;   # type sign width addr used name   list of local variables
  9364                                  ;  200 var sign byte   868 NULL c = bp-2;
  9365 000046D9 C8020000                 ENTER  2,0
  9366 000046DD 8B1E[6200]               mov bx, [fgetsp]
  9367 000046E1 8A07                     mov al, [bx]
  9368 000046E3 B400                     mov ah, 0
  9369 000046E5 8846FE                   mov [bp-2], al
  9370                                  
  9371                                  ;-869   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9372                                  
  9373 000046E8 8A46FE                   mov al, [bp-2]
  9374 000046EB 3C00                     cmp al, 0
  9375 000046ED 0F852A00                 jne .fgets1538
  9376 000046F1 E83700                   call printinputline
  9377 000046F4 A1[7000]                 mov ax, [DOS_NoBytes]
  9378 000046F7 83F800                   cmp ax, 0
  9379 000046FA 0F850600                 jne .fgets1539
  9380 000046FE B80000                   mov ax, 0
  9381 00004701 E92500                   jmp .retnfgets1
  9382                                  
  9383                                  ;-870     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9384                                  
  9385                                  .fgets1539:
  9386 00004704 B80FD0                   mov ax, fgetsdest
  9387 00004707 A3[6200]                 mov word [fgetsp], ax
  9388 0000470A 8B1E[6200]               mov bx, [fgetsp]
  9389 0000470E 8A07                     mov al, [bx]
  9390 00004710 B400                     mov ah, 0
  9391 00004712 8846FE                   mov [bp-2], al
  9392 00004715 B80000                   mov ax, 0
  9393 00004718 A3[1F00]                 mov word [spalte], ax
  9394                                  
  9395                                  ;-871   fgetsp++; spalte++;  return c; }
  9396                                  
  9397                                  .fgets1538:
  9398 0000471B FF06[6200]               inc  word[fgetsp]
  9399 0000471F FF06[1F00]               inc  word[spalte]
  9400 00004723 8A46FE                   mov al, [bp-2]
  9401 00004726 E90000                   jmp .retnfgets1
  9402                                  
  9403                                  ;-872 int printinputline() { fgetsp=&fgetsdest;
  9404                                  
  9405 00004729 C9                       .retnfgets1: LEAVE
  9406 0000472A C3                       ret
  9407                                  ENDP
  9408                                  
  9409                                  printinputline: PROC
  9410 0000472B B80FD0                   mov ax, fgetsdest
  9411 0000472E A3[6200]                 mov word [fgetsp], ax
  9412                                  
  9413                                  ;-873   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9414                                  
  9415                                  .printinputline540:
  9416 00004731 6A01                     push 1
  9417 00004733 FF36[1800]               push word [fdin]
  9418 00004737 8D06[7200]               lea  ax, [DOS_ByteRead]
  9419 0000473B 50                       push ax
  9420 0000473C E8D5B9                   call readRL
  9421 0000473F 83C406                   add  sp, 6
  9422 00004742 A3[7000]                 mov word [DOS_NoBytes], ax
  9423                                  
  9424                                  ;-874   if (DOS_NoBytes == 0) return; 
  9425                                  
  9426 00004745 A1[7000]                 mov ax, [DOS_NoBytes]
  9427 00004748 83F800                   cmp ax, 0
  9428 0000474B 0F850300                 jne .printinputline541
  9429 0000474F E95400                   jmp .retnprintinputline
  9430                                  
  9431                                  ;-875     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9432                                  
  9433                                  .printinputline541:
  9434 00004752 A0[7200]                 mov al, [DOS_ByteRead]
  9435 00004755 8B1E[6200]               mov  bx, [fgetsp]
  9436 00004759 8807                     mov  [bx], al
  9437 0000475B FF06[6200]               inc  word[fgetsp]
  9438                                  
  9439                                  ;-876   while (DOS_ByteRead != 10); *fgetsp=0;
  9440                                  
  9441 0000475F A0[7200]                 mov al, [DOS_ByteRead]
  9442 00004762 3C0A                     cmp al, 10
  9443 00004764 0F840200                 je  .printinputline542
  9444 00004768 EBC7                     jmp .printinputline540
  9445                                  .printinputline542:
  9446 0000476A B80000                   mov ax, 0
  9447 0000476D 8B1E[6200]               mov  bx, [fgetsp]
  9448 00004771 8807                     mov  [bx], al
  9449                                  
  9450                                  ;-877     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9451                                  
  9452 00004773 A1[1A00]                 mov ax, [fdout]
  9453 00004776 08C0                     or  al, al
  9454 00004778 0F842A00                 je .printinputline543
  9455 0000477C 68[A747]                 push printinputline_0
  9456 0000477F E869FD                   call prs
  9457 00004782 83C402                   add  sp, 2
  9458 00004785 FF36[6600]               push word [lineno]
  9459 00004789 E8B4FE                   call prunsign1
  9460 0000478C 83C402                   add  sp, 2
  9461 0000478F 6A20                     push 32
  9462 00004791 E8F0FC                   call prc
  9463 00004794 83C402                   add  sp, 2
  9464 00004797 FF06[6600]               inc  word[lineno]
  9465                                  
  9466                                  ;-878       prscomment(&fgetsdest);}
  9467                                  
  9468 0000479B 8D060FD0                 lea  ax, [fgetsdest]
  9469 0000479F 50                       push ax
  9470 000047A0 E80CFD                   call prscomment
  9471 000047A3 83C402                   add  sp, 2
  9472                                  
  9473                                  ;-879 }
  9474                                  
  9475                                  .printinputline543:
  9476                                  
  9477                                  ;-880 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  9478                                  
  9479                                   .retnprintinputline:
  9480 000047A6 C3                       ret
  9481 000047A7 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9482                                  ENDP
  9483                                  
  9484                                  ifEOL: PROC
  9485                                  
  9486                                  ;-881   if (c == 10) return 1;//LF
  9487                                  
  9488                                  ;Function : ifEOL, Number of local variables: 1
  9489                                  ;   # type sign width addr used name   list of local variables
  9490                                  ;  200 var sign byte   880 NULL c = bp+4;
  9491 000047AE C8000000                 ENTER  0,0
  9492 000047B2 8A4604                   mov al, [bp+4]
  9493 000047B5 3C0A                     cmp al, 10
  9494 000047B7 0F850600                 jne .ifEOL544
  9495 000047BB B80100                   mov ax, 1
  9496 000047BE E92400                   jmp .retnifEOL
  9497                                  
  9498                                  ;-882   if (c == 13) {//CR
  9499                                  
  9500                                  .ifEOL544:
  9501 000047C1 8A4604                   mov al, [bp+4]
  9502 000047C4 3C0D                     cmp al, 13
  9503 000047C6 0F851500                 jne .ifEOL545
  9504                                  
  9505                                  ;-883     if (thechar == 10) c=next();
  9506                                  
  9507 000047CA A0[2100]                 mov al, [thechar]
  9508 000047CD 3C0A                     cmp al, 10
  9509 000047CF 0F850600                 jne .ifEOL546
  9510 000047D3 E8C2FB                   call next
  9511 000047D6 884604                   mov [bp+4], al
  9512                                  
  9513                                  ;-884     return 1;
  9514                                  
  9515                                  .ifEOL546:
  9516 000047D9 B80100                   mov ax, 1
  9517 000047DC E90600                   jmp .retnifEOL
  9518                                  
  9519                                  ;-885   }
  9520                                  
  9521                                  
  9522                                  ;-886   return 0;
  9523                                  
  9524                                  .ifEOL545:
  9525 000047DF B80000                   mov ax, 0
  9526 000047E2 E90000                   jmp .retnifEOL
  9527                                  
  9528                                  ;-887 }
  9529                                  
  9530                                  
  9531                                  ;-888 
  9532                                  
  9533                                  
  9534                                  ;-889 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9535                                  
  9536 000047E5 C9                       .retnifEOL: LEAVE
  9537 000047E6 C3                       ret
  9538                                  ENDP
  9539                                  
  9540                                  end1: PROC
  9541                                  ;Function : end1, Number of local variables: 1
  9542                                  ;   # type sign width addr used name   list of local variables
  9543                                  ;  200 var sign word   889 NULL n = bp+4;
  9544 000047E7 C8000000                 ENTER  0,0
  9545 000047EB FF36[1800]               push word [fdin]
  9546 000047EF E805B9                   call fcloseR
  9547 000047F2 83C402                   add  sp, 2
  9548 000047F5 FF36[1A00]               push word [fdout]
  9549 000047F9 E8FBB8                   call fcloseR
  9550 000047FC 83C402                   add  sp, 2
  9551 000047FF FF7604                   push word [bp+4]
  9552 00004802 E801B9                   call exitR
  9553 00004805 83C402                   add  sp, 2
  9554                                  
  9555                                  ;-890 int error1(char *s) { 
  9556 00004808 C9                       LEAVE
  9557 00004809 C3                       ret
  9558                                  ENDP
  9559                                  
  9560                                  error1: PROC
  9561                                  
  9562                                  ;-891   lineno--;
  9563                                  
  9564                                  ;Function : error1, Number of local variables: 1
  9565                                  ;   # type sign width addr used name   list of local variables
  9566                                  ;  200 ptr sign byte   890 NULL s = bp+4;
  9567 0000480A C8000000                 ENTER  0,0
  9568 0000480E FF0E[6600]               dec  word[lineno]
  9569                                  
  9570                                  ;-892   prnl(); prscomment(&fgetsdest);
  9571                                  
  9572 00004812 E8C8FC                   call prnl
  9573 00004815 8D060FD0                 lea  ax, [fgetsdest]
  9574 00004819 50                       push ax
  9575 0000481A E892FC                   call prscomment
  9576 0000481D 83C402                   add  sp, 2
  9577                                  
  9578                                  ;-893   prs(";Line: "); prunsign1(lineno);
  9579                                  
  9580 00004820 68[B348]                 push error1_0
  9581 00004823 E8C5FC                   call prs
  9582 00004826 83C402                   add  sp, 2
  9583 00004829 FF36[6600]               push word [lineno]
  9584 0000482D E810FE                   call prunsign1
  9585 00004830 83C402                   add  sp, 2
  9586                                  
  9587                                  ;-894   prs(" ************** ERROR: "); prs(s);
  9588                                  
  9589 00004833 68[BB48]                 push error1_1
  9590 00004836 E8B2FC                   call prs
  9591 00004839 83C402                   add  sp, 2
  9592 0000483C FF7604                   push word [bp+4]
  9593 0000483F E8A9FC                   call prs
  9594 00004842 83C402                   add  sp, 2
  9595                                  
  9596                                  ;-895   prs("  in column: "); prunsign1(spalte);
  9597                                  
  9598 00004845 68[D348]                 push error1_2
  9599 00004848 E8A0FC                   call prs
  9600 0000484B 83C402                   add  sp, 2
  9601 0000484E FF36[1F00]               push word [spalte]
  9602 00004852 E8EBFD                   call prunsign1
  9603 00004855 83C402                   add  sp, 2
  9604                                  
  9605                                  ;-896   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9606                                  
  9607 00004858 68[E148]                 push error1_3
  9608 0000485B E88DFC                   call prs
  9609 0000485E 83C402                   add  sp, 2
  9610 00004861 FF36[1C00]               push word [token]
  9611 00004865 E8D8FD                   call prunsign1
  9612 00004868 83C402                   add  sp, 2
  9613 0000486B 68[EB48]                 push error1_4
  9614 0000486E E87AFC                   call prs
  9615 00004871 83C402                   add  sp, 2
  9616 00004874 A0[1E00]                 mov al, byte [globC]
  9617 00004877 B400                     mov ah, 0
  9618 00004879 50                       push ax
  9619 0000487A E807FC                   call prc
  9620 0000487D 83C402                   add  sp, 2
  9621                                  
  9622                                  ;-897   prs(", thechar: "); prunsign1(thechar); prs(", symbol: "); prs(symbol);
  9623                                  
  9624 00004880 68[F548]                 push error1_5
  9625 00004883 E865FC                   call prs
  9626 00004886 83C402                   add  sp, 2
  9627 00004889 A0[2100]                 mov al, byte [thechar]
  9628 0000488C B400                     mov ah, 0
  9629 0000488E 50                       push ax
  9630 0000488F E8AEFD                   call prunsign1
  9631 00004892 83C402                   add  sp, 2
  9632 00004895 68[0149]                 push error1_6
  9633 00004898 E850FC                   call prs
  9634 0000489B 83C402                   add  sp, 2
  9635 0000489E 8D062B81                 lea  ax, [symbol]
  9636 000048A2 50                       push ax
  9637 000048A3 E845FC                   call prs
  9638 000048A6 83C402                   add  sp, 2
  9639                                  
  9640                                  ;-898   end1(1); }
  9641                                  
  9642 000048A9 6A01                     push 1
  9643 000048AB E839FF                   call end1
  9644 000048AE 83C402                   add  sp, 2
  9645                                  
  9646                                  ;-899 int listproc() {int i; 
  9647 000048B1 C9                       LEAVE
  9648 000048B2 C3                       ret
  9649 000048B3 3B4C696E653A2000        error1_0 db ";Line: ",0
  9650 000048BB 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9651 000048C4 2A2A2A2A2A2A204552-
  9652 000048CD 524F523A2000       
  9653 000048D3 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9654 000048DC 6D6E3A2000         
  9655 000048E1 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9656 000048EA 00                 
  9657 000048EB 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9658 000048F4 00                 
  9659 000048F5 2C2074686563686172-     error1_5 db ", thechar: ",0
  9660 000048FE 3A2000             
  9661 00004901 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9662 0000490A 2000               
  9663                                  ENDP
  9664                                  
  9665                                  listproc: PROC
  9666                                  
  9667                                  ;-900   if (LTop > LSTART) {
  9668                                  
  9669                                  ;Function : listproc, Number of local variables: 1
  9670                                  ;   # type sign width addr used name   list of local variables
  9671                                  ;  200 var sign word   899 NULL i = bp-2;
  9672 0000490C C8020000                 ENTER  2,0
  9673 00004910 A1[2C00]                 mov ax, [LTop]
  9674 00004913 3DC800                   cmp ax, 200
  9675 00004916 0F8E5700                 jle .listproc547
  9676                                  
  9677                                  ;-901   prs("\n;Function : "); prs(fname);
  9678                                  
  9679 0000491A 68[7349]                 push listproc_0
  9680 0000491D E8CBFB                   call prs
  9681 00004920 83C402                   add  sp, 2
  9682 00004923 8D06AB81                 lea  ax, [fname]
  9683 00004927 50                       push ax
  9684 00004928 E8C0FB                   call prs
  9685 0000492B 83C402                   add  sp, 2
  9686                                  
  9687                                  ;-902   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9688                                  
  9689 0000492E 68[8249]                 push listproc_1
  9690 00004931 E8B7FB                   call prs
  9691 00004934 83C402                   add  sp, 2
  9692 00004937 A1[2C00]                 mov ax, [LTop]
  9693 0000493A 2DC800                   sub ax, 200
  9694 0000493D 8946FE                   mov [bp-2], ax
  9695 00004940 FF76FE                   push word [bp-2]
  9696 00004943 E8FAFC                   call prunsign1
  9697 00004946 83C402                   add  sp, 2
  9698                                  
  9699                                  ;-903   prs("\n;   # type sign width addr used name   list of local variables");
  9700                                  
  9701 00004949 68[A049]                 push listproc_2
  9702 0000494C E89CFB                   call prs
  9703 0000494F 83C402                   add  sp, 2
  9704                                  
  9705                                  ;-904     i=LSTART; 
  9706                                  
  9707 00004952 B8C800                   mov ax, 200
  9708 00004955 8946FE                   mov [bp-2], ax
  9709                                  
  9710                                  ;-905     while (i < LTop) { listvar(i); i++; } } 
  9711                                  
  9712                                  .listproc548:
  9713 00004958 8B46FE                   mov ax, [bp-2]
  9714 0000495B 3B06[2C00]               cmp ax, [LTop]
  9715 0000495F 0F8D0E00                 jge .listproc549
  9716 00004963 FF76FE                   push word [bp-2]
  9717 00004966 E87800                   call listvar
  9718 00004969 83C402                   add  sp, 2
  9719 0000496C FF46FE                   inc  word[bp-2]
  9720 0000496F EBE7                     jmp .listproc548
  9721                                  .listproc549:
  9722                                  
  9723                                  ;-906 }
  9724                                  
  9725                                  .listproc547:
  9726                                  
  9727                                  ;-907 int listvar(unsigned int i) {unsigned int j; char c;
  9728 00004971 C9                       LEAVE
  9729 00004972 C3                       ret
  9730 00004973 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9731 0000497C 6F6E203A2000       
  9732 00004982 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9733 0000498B 6F66206C6F63616C20-
  9734 00004994 7661726961626C6573-
  9735 0000499D 3A2000             
  9736 000049A0 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9737 000049A9 797065207369676E20-
  9738 000049B2 776964746820616464-
  9739 000049BB 722075736564206E61-
  9740 000049C4 6D652020206C697374-
  9741 000049CD 206F66206C6F63616C-
  9742 000049D6 207661726961626C65-
  9743 000049DF 7300               
  9744                                  ENDP
  9745                                  
  9746                                  listvar: PROC
  9747                                  
  9748                                  ;-908   prs("\n;"); printint51(i); prc(32);
  9749                                  
  9750                                  ;Function : listvar, Number of local variables: 3
  9751                                  ;   # type sign width addr used name   list of local variables
  9752                                  ;  200 var unsg word   907 NULL i = bp+4
  9753                                  ;  201 var unsg word   907 NULL j = bp-2
  9754                                  ;  202 var sign byte   907 NULL c = bp-4;
  9755 000049E1 C8040000                 ENTER  4,0
  9756 000049E5 68[CD4B]                 push listvar_0
  9757 000049E8 E800FB                   call prs
  9758 000049EB 83C402                   add  sp, 2
  9759 000049EE FF7604                   push word [bp+4]
  9760 000049F1 E88EFC                   call printint51
  9761 000049F4 83C402                   add  sp, 2
  9762 000049F7 6A20                     push 32
  9763 000049F9 E888FA                   call prc
  9764 000049FC 83C402                   add  sp, 2
  9765                                  
  9766                                  ;-909   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9767                                  
  9768 000049FF 8B5E04                   mov bx, [bp+4]
  9769 00004A02 8A87B782                 mov al, [GType + bx]
  9770 00004A06 8846FC                   mov [bp-4], al
  9771 00004A09 8A46FC                   mov al, [bp-4]
  9772 00004A0C 3C56                     cmp al, 86
  9773 00004A0E 0F850900                 jne .listvar550
  9774 00004A12 68[D14B]                 push listvar_1
  9775 00004A15 E8D3FA                   call prs
  9776 00004A18 83C402                   add  sp, 2
  9777                                  .listvar550:
  9778 00004A1B 8A46FC                   mov al, [bp-4]
  9779 00004A1E 3C2A                     cmp al, 42
  9780 00004A20 0F850900                 jne .listvar551
  9781 00004A24 68[D64B]                 push listvar_2
  9782 00004A27 E8C1FA                   call prs
  9783 00004A2A 83C402                   add  sp, 2
  9784                                  
  9785                                  ;-910                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9786                                  
  9787                                  .listvar551:
  9788 00004A2D 8A46FC                   mov al, [bp-4]
  9789 00004A30 3C26                     cmp al, 38
  9790 00004A32 0F850900                 jne .listvar552
  9791 00004A36 68[DB4B]                 push listvar_3
  9792 00004A39 E8AFFA                   call prs
  9793 00004A3C 83C402                   add  sp, 2
  9794                                  .listvar552:
  9795 00004A3F 8A46FC                   mov al, [bp-4]
  9796 00004A42 3C23                     cmp al, 35
  9797 00004A44 0F850900                 jne .listvar553
  9798 00004A48 68[E04B]                 push listvar_4
  9799 00004A4B E89DFA                   call prs
  9800 00004A4E 83C402                   add  sp, 2
  9801                                  
  9802                                  ;-911   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9803                                  
  9804                                  .listvar553:
  9805 00004A51 8B5E04                   mov bx, [bp+4]
  9806 00004A54 8A87E383                 mov al, [GSign + bx]
  9807 00004A58 8846FC                   mov [bp-4], al
  9808 00004A5B 8A46FC                   mov al, [bp-4]
  9809 00004A5E 3C53                     cmp al, 83
  9810 00004A60 0F850900                 jne .listvar554
  9811 00004A64 68[E54B]                 push listvar_5
  9812 00004A67 E881FA                   call prs
  9813 00004A6A 83C402                   add  sp, 2
  9814                                  .listvar554:
  9815 00004A6D 8A46FC                   mov al, [bp-4]
  9816 00004A70 3C55                     cmp al, 85
  9817 00004A72 0F850900                 jne .listvar555
  9818 00004A76 68[EB4B]                 push listvar_6
  9819 00004A79 E86FFA                   call prs
  9820 00004A7C 83C402                   add  sp, 2
  9821                                  
  9822                                  ;-912   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9823                                  
  9824                                  .listvar555:
  9825 00004A7F 8B5E04                   mov bx, [bp+4]
  9826 00004A82 8A870F85                 mov al, [GWidth + bx]
  9827 00004A86 8846FC                   mov [bp-4], al
  9828 00004A89 8A46FC                   mov al, [bp-4]
  9829 00004A8C 3C01                     cmp al, 1
  9830 00004A8E 0F850900                 jne .listvar556
  9831 00004A92 68[F14B]                 push listvar_7
  9832 00004A95 E853FA                   call prs
  9833 00004A98 83C402                   add  sp, 2
  9834                                  .listvar556:
  9835 00004A9B 8A46FC                   mov al, [bp-4]
  9836 00004A9E 3C02                     cmp al, 2
  9837 00004AA0 0F850900                 jne .listvar557
  9838 00004AA4 68[F74B]                 push listvar_8
  9839 00004AA7 E841FA                   call prs
  9840 00004AAA 83C402                   add  sp, 2
  9841                                  
  9842                                  ;-913                if(c==  4)prs("dwrd " );
  9843                                  
  9844                                  .listvar557:
  9845 00004AAD 8A46FC                   mov al, [bp-4]
  9846 00004AB0 3C04                     cmp al, 4
  9847 00004AB2 0F850900                 jne .listvar558
  9848 00004AB6 68[FD4B]                 push listvar_9
  9849 00004AB9 E82FFA                   call prs
  9850 00004ABC 83C402                   add  sp, 2
  9851                                  
  9852                                  ;-914   j=GAdr[i]; printint51(j);
  9853                                  
  9854                                  .listvar558:
  9855 00004ABF 8B5E04                   mov bx, [bp+4]
  9856 00004AC2 D1E3                     shl bx, 1
  9857 00004AC4 8B873B86                 mov ax, [GAdr + bx]
  9858 00004AC8 8946FE                   mov [bp-2], ax
  9859 00004ACB FF76FE                   push word [bp-2]
  9860 00004ACE E8B1FB                   call printint51
  9861 00004AD1 83C402                   add  sp, 2
  9862                                  
  9863                                  ;-915   j=GUsed[i]; if (j) printint51(j);
  9864                                  
  9865 00004AD4 8B5E04                   mov bx, [bp+4]
  9866 00004AD7 D1E3                     shl bx, 1
  9867 00004AD9 8B879388                 mov ax, [GUsed + bx]
  9868 00004ADD 8946FE                   mov [bp-2], ax
  9869 00004AE0 8B46FE                   mov ax, [bp-2]
  9870 00004AE3 08C0                     or  al, al
  9871 00004AE5 0F840C00                 je .listvar559
  9872 00004AE9 FF76FE                   push word [bp-2]
  9873 00004AEC E893FB                   call printint51
  9874 00004AEF 83C402                   add  sp, 2
  9875                                  
  9876                                  ;-916   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9877                                  
  9878 00004AF2 E92200                   jmp .listvar560
  9879                                  .listvar559:
  9880 00004AF5 8B5E04                   mov bx, [bp+4]
  9881 00004AF8 8A87B782                 mov al, [GType + bx]
  9882 00004AFC 3C23                     cmp al, 35
  9883 00004AFE 0F850C00                 jne .listvar561
  9884 00004B02 68[034C]                 push listvar_10
  9885 00004B05 E8E3F9                   call prs
  9886 00004B08 83C402                   add  sp, 2
  9887 00004B0B E90900                   jmp .listvar562
  9888                                  .listvar561:
  9889 00004B0E 68[094C]                 push listvar_11
  9890 00004B11 E8D7F9                   call prs
  9891 00004B14 83C402                   add  sp, 2
  9892                                  .listvar562:
  9893                                  
  9894                                  ;-917   prc(32);  pt=adrofname(i); prs(pt);
  9895                                  
  9896                                  .listvar560:
  9897 00004B17 6A20                     push 32
  9898 00004B19 E868F9                   call prc
  9899 00004B1C 83C402                   add  sp, 2
  9900 00004B1F FF7604                   push word [bp+4]
  9901 00004B22 E8AFBD                   call adrofname
  9902 00004B25 83C402                   add  sp, 2
  9903 00004B28 A3[6A00]                 mov word [pt], ax
  9904 00004B2B FF36[6A00]               push word [pt]
  9905 00004B2F E8B9F9                   call prs
  9906 00004B32 83C402                   add  sp, 2
  9907                                  
  9908                                  ;-918   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9909                                  
  9910 00004B35 8B5E04                   mov bx, [bp+4]
  9911 00004B38 8A87B782                 mov al, [GType + bx]
  9912 00004B3C 3C23                     cmp al, 35
  9913 00004B3E 0F851D00                 jne .listvar563
  9914 00004B42 6A3D                     push 61
  9915 00004B44 E83DF9                   call prc
  9916 00004B47 83C402                   add  sp, 2
  9917 00004B4A 8B5E04                   mov bx, [bp+4]
  9918 00004B4D D1E3                     shl bx, 1
  9919 00004B4F 8B87EB8A                 mov ax, [GData + bx]
  9920 00004B53 8946FE                   mov [bp-2], ax
  9921 00004B56 FF76FE                   push word [bp-2]
  9922 00004B59 E8E4FA                   call prunsign1
  9923 00004B5C 83C402                   add  sp, 2
  9924                                  
  9925                                  ;-919   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9926                                  
  9927                                  .listvar563:
  9928 00004B5F 8B5E04                   mov bx, [bp+4]
  9929 00004B62 8A87B782                 mov al, [GType + bx]
  9930 00004B66 3C26                     cmp al, 38
  9931 00004B68 0F852500                 jne .listvar564
  9932 00004B6C 6A5B                     push 91
  9933 00004B6E E813F9                   call prc
  9934 00004B71 83C402                   add  sp, 2
  9935 00004B74 8B5E04                   mov bx, [bp+4]
  9936 00004B77 D1E3                     shl bx, 1
  9937 00004B79 8B87EB8A                 mov ax, [GData + bx]
  9938 00004B7D 8946FE                   mov [bp-2], ax
  9939 00004B80 FF76FE                   push word [bp-2]
  9940 00004B83 E8BAFA                   call prunsign1
  9941 00004B86 83C402                   add  sp, 2
  9942 00004B89 6A5D                     push 93
  9943 00004B8B E8F6F8                   call prc
  9944 00004B8E 83C402                   add  sp, 2
  9945                                  
  9946                                  ;-920   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9947                                  
  9948                                  .listvar564:
  9949 00004B91 8B4604                   mov ax, [bp+4]
  9950 00004B94 3DC800                   cmp ax, 200 ;unsigned : 0
  9951 00004B97 0F823000                 jb  .listvar565
  9952 00004B9B 68[0F4C]                 push listvar_12
  9953 00004B9E E84AF9                   call prs
  9954 00004BA1 83C402                   add  sp, 2
  9955 00004BA4 8B5E04                   mov bx, [bp+4]
  9956 00004BA7 D1E3                     shl bx, 1
  9957 00004BA9 8B87EB8A                 mov ax, [GData + bx]
  9958 00004BAD 8946FE                   mov [bp-2], ax
  9959                                  
  9960                                  ;-921     if (j > 0) prc('+'); pint1(j);  }
  9961                                  
  9962 00004BB0 8B46FE                   mov ax, [bp-2]
  9963 00004BB3 83F800                   cmp ax, 0
  9964 00004BB6 0F8E0800                 jle .listvar566
  9965 00004BBA 6A2B                     push 43
  9966 00004BBC E8C5F8                   call prc
  9967 00004BBF 83C402                   add  sp, 2
  9968                                  .listvar566:
  9969 00004BC2 FF76FE                   push word [bp-2]
  9970 00004BC5 E81AFA                   call pint1
  9971 00004BC8 83C402                   add  sp, 2
  9972                                  
  9973                                  ;-922 }
  9974                                  
  9975                                  .listvar565:
  9976                                  
  9977                                  ;-923 int listcall() { int i;
  9978 00004BCB C9                       LEAVE
  9979 00004BCC C3                       ret
  9980 00004BCD 5C6E3B00                listvar_0 db "\n;",0
  9981 00004BD1 7661722000              listvar_1 db "var ",0
  9982 00004BD6 7074722000              listvar_2 db "ptr ",0
  9983 00004BDB 6172722000              listvar_3 db "arr ",0
  9984 00004BE0 6465662000              listvar_4 db "def ",0
  9985 00004BE5 7369676E2000            listvar_5 db "sign ",0
  9986 00004BEB 756E73672000            listvar_6 db "unsg ",0
  9987 00004BF1 627974652000            listvar_7 db "byte ",0
  9988 00004BF7 776F72642000            listvar_8 db "word ",0
  9989 00004BFD 647772642000            listvar_9 db "dwrd ",0
  9990 00004C03 202020202D00            listvar_10 db "    -",0
  9991 00004C09 204E554C4C00            listvar_11 db " NULL",0
  9992 00004C0F 203D20627000            listvar_12 db " = bp",0
  9993                                  ENDP
  9994                                  
  9995                                  listcall: PROC
  9996                                  
  9997                                  ;-924   prs("\n\n;    #  addr name   list of CALLs\n");
  9998                                  
  9999                                  ;Function : listcall, Number of local variables: 1
 10000                                  ;   # type sign width addr used name   list of local variables
 10001                                  ;  200 var sign word   923 NULL i = bp-2;
 10002 00004C15 C8020000                 ENTER  2,0
 10003 00004C19 68[434C]                 push listcall_0
 10004 00004C1C E8CCF8                   call prs
 10005 00004C1F 83C402                   add  sp, 2
 10006                                  
 10007                                  ;-925   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10008                                  
 10009 00004C22 B80000                   mov ax, 0
 10010 00004C25 8946FE                   mov [bp-2], ax
 10011                                  .listcall567:
 10012 00004C28 8B46FE                   mov ax, [bp-2]
 10013 00004C2B 3B06[3D00]               cmp ax, [CTop]
 10014 00004C2F 0F8D0E00                 jge .listcall568
 10015 00004C33 FF76FE                   push word [bp-2]
 10016 00004C36 E83200                   call calllisting
 10017 00004C39 83C402                   add  sp, 2
 10018 00004C3C FF46FE                   inc  word[bp-2]
 10019 00004C3F EBE7                     jmp .listcall567
 10020                                  .listcall568:
 10021                                  
 10022                                  ;-926 int calllisting(int i) {char c; int j;
 10023 00004C41 C9                       LEAVE
 10024 00004C42 C3                       ret
 10025 00004C43 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10026 00004C4C 23202061646472206E-
 10027 00004C55 616D652020206C6973-
 10028 00004C5E 74206F662043414C4C-
 10029 00004C67 735C6E00           
 10030                                  ENDP
 10031                                  
 10032                                  calllisting: PROC
 10033                                  
 10034                                  ;-927   prs("\n;"); printint51(i); prc(32);
 10035                                  
 10036                                  ;Function : calllisting, Number of local variables: 3
 10037                                  ;   # type sign width addr used name   list of local variables
 10038                                  ;  200 var sign word   926 NULL i = bp+4
 10039                                  ;  201 var sign byte   926 NULL c = bp-2
 10040                                  ;  202 var sign word   926 NULL j = bp-4;
 10041 00004C6B C8040000                 ENTER  4,0
 10042 00004C6F 68[DD4C]                 push calllisting_0
 10043 00004C72 E876F8                   call prs
 10044 00004C75 83C402                   add  sp, 2
 10045 00004C78 FF7604                   push word [bp+4]
 10046 00004C7B E804FA                   call printint51
 10047 00004C7E 83C402                   add  sp, 2
 10048 00004C81 6A20                     push 32
 10049 00004C83 E8FEF7                   call prc
 10050 00004C86 83C402                   add  sp, 2
 10051                                  
 10052                                  ;-928   c=CType [i]; if(c==0)prs("unresolved ");
 10053                                  
 10054 00004C89 8B5E04                   mov bx, [bp+4]
 10055 00004C8C 8A872FA1                 mov al, [CType + bx]
 10056 00004C90 8846FE                   mov [bp-2], al
 10057 00004C93 8A46FE                   mov al, [bp-2]
 10058 00004C96 3C00                     cmp al, 0
 10059 00004C98 0F850900                 jne .calllisting569
 10060 00004C9C 68[E14C]                 push calllisting_1
 10061 00004C9F E849F8                   call prs
 10062 00004CA2 83C402                   add  sp, 2
 10063                                  
 10064                                  ;-929   j=CAdr[i];            printint51(j); prc(32);
 10065                                  
 10066                                  .calllisting569:
 10067 00004CA5 8B5E04                   mov bx, [bp+4]
 10068 00004CA8 D1E3                     shl bx, 1
 10069 00004CAA 8B8757AB                 mov ax, [CAdr + bx]
 10070 00004CAE 8946FC                   mov [bp-4], ax
 10071 00004CB1 FF76FC                   push word [bp-4]
 10072 00004CB4 E8CBF9                   call printint51
 10073 00004CB7 83C402                   add  sp, 2
 10074 00004CBA 6A20                     push 32
 10075 00004CBC E8C5F7                   call prc
 10076 00004CBF 83C402                   add  sp, 2
 10077                                  
 10078                                  ;-930   from_far(NameA, j);   prs(NameA);
 10079                                  
 10080 00004CC2 FF76FC                   push word [bp-4]
 10081 00004CC5 8D06[3F00]               lea  ax, [NameA]
 10082 00004CC9 50                       push ax
 10083 00004CCA E8B306                   call from_far
 10084 00004CCD 83C404                   add  sp, 4
 10085 00004CD0 8D06[3F00]               lea  ax, [NameA]
 10086 00004CD4 50                       push ax
 10087 00004CD5 E813F8                   call prs
 10088 00004CD8 83C402                   add  sp, 2
 10089                                  
 10090                                  ;-931 }
 10091                                  
 10092                                  
 10093                                  ;-932 int countcalls(int f) { unsigned int i;
 10094 00004CDB C9                       LEAVE
 10095 00004CDC C3                       ret
 10096 00004CDD 5C6E3B00                calllisting_0 db "\n;",0
 10097 00004CE1 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10098 00004CEA 642000             
 10099                                  ENDP
 10100                                  
 10101                                  countcalls: PROC
 10102                                  
 10103                                  ;-933   pt=adrF(FNameField, f);
 10104                                  
 10105                                  ;Function : countcalls, Number of local variables: 2
 10106                                  ;   # type sign width addr used name   list of local variables
 10107                                  ;  200 var sign word   932 NULL f = bp+4
 10108                                  ;  201 var unsg word   932 NULL i = bp-2;
 10109 00004CED C8020000                 ENTER  2,0
 10110 00004CF1 FF7604                   push word [bp+4]
 10111 00004CF4 8D064FBD                 lea  ax, [FNameField]
 10112 00004CF8 50                       push ax
 10113 00004CF9 E8ECBB                   call adrF
 10114 00004CFC 83C404                   add  sp, 4
 10115 00004CFF A3[6A00]                 mov word [pt], ax
 10116                                  
 10117                                  ;-934   i=0;  while (i < CTop) {
 10118                                  
 10119 00004D02 B80000                   mov ax, 0
 10120 00004D05 8946FE                   mov [bp-2], ax
 10121                                  .countcalls570:
 10122 00004D08 8B46FE                   mov ax, [bp-2]
 10123 00004D0B 3B06[3D00]               cmp ax, [CTop]
 10124 00004D0F 0F8D4A00                 jge .countcalls571
 10125                                  
 10126                                  ;-935     p1=CAdr[i];
 10127                                  
 10128 00004D13 8B5EFE                   mov bx, [bp-2]
 10129 00004D16 D1E3                     shl bx, 1
 10130 00004D18 8B8757AB                 mov ax, [CAdr + bx]
 10131 00004D1C A3[6C00]                 mov word [p1], ax
 10132                                  
 10133                                  ;-936     from_far(NameA, p1);
 10134                                  
 10135 00004D1F FF36[6C00]               push word [p1]
 10136 00004D23 8D06[3F00]               lea  ax, [NameA]
 10137 00004D27 50                       push ax
 10138 00004D28 E85506                   call from_far
 10139 00004D2B 83C404                   add  sp, 4
 10140                                  
 10141                                  ;-937     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10142                                  
 10143 00004D2E 8D06[3F00]               lea  ax, [NameA]
 10144 00004D32 50                       push ax
 10145 00004D33 FF36[6A00]               push word [pt]
 10146 00004D37 E85CB4                   call eqstr
 10147 00004D3A 83C404                   add  sp, 4
 10148 00004D3D 08C0                     or  al, al
 10149 00004D3F 0F841500                 je .countcalls572
 10150 00004D43 8B5E04                   mov bx, [bp+4]
 10151 00004D46 D1E3                     shl bx, 1
 10152 00004D48 8B87F7BA                 mov ax, [FCalls + bx]
 10153 00004D4C 83C001                   add ax, 1
 10154 00004D4F 8B5E04                   mov bx, [bp+4]
 10155 00004D52 D1E3                     shl bx, 1
 10156 00004D54 8987F7BA                 mov [FCalls+bx], ax
 10157                                  
 10158                                  ;-938     i++; }
 10159                                  
 10160                                  .countcalls572:
 10161 00004D58 FF46FE                   inc  word[bp-2]
 10162                                  
 10163                                  ;-939 }
 10164                                  
 10165 00004D5B EBAB                     jmp .countcalls570
 10166                                  .countcalls571:
 10167                                  
 10168                                  ;-940 int listfunc() { int i;
 10169 00004D5D C9                       LEAVE
 10170 00004D5E C3                       ret
 10171                                  ENDP
 10172                                  
 10173                                  listfunc: PROC
 10174                                  
 10175                                  ;-941   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10176                                  
 10177                                  ;Function : listfunc, Number of local variables: 1
 10178                                  ;   # type sign width addr used name   list of local variables
 10179                                  ;  200 var sign word   940 NULL i = bp-2;
 10180 00004D5F C8020000                 ENTER  2,0
 10181 00004D63 68[AC4D]                 push listfunc_0
 10182 00004D66 E882F7                   call prs
 10183 00004D69 83C402                   add  sp, 2
 10184                                  
 10185                                  ;-942   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10186                                  
 10187 00004D6C B80000                   mov ax, 0
 10188 00004D6F 8946FE                   mov [bp-2], ax
 10189                                  .listfunc573:
 10190 00004D72 8B46FE                   mov ax, [bp-2]
 10191 00004D75 3B06[3B00]               cmp ax, [FTop]
 10192 00004D79 0F8D0E00                 jge .listfunc574
 10193 00004D7D FF76FE                   push word [bp-2]
 10194 00004D80 E86AFF                   call countcalls
 10195 00004D83 83C402                   add  sp, 2
 10196 00004D86 FF46FE                   inc  word[bp-2]
 10197                                  
 10198                                  ;-943   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10199                                  
 10200 00004D89 EBE7                     jmp .listfunc573
 10201                                  .listfunc574:
 10202 00004D8B B80000                   mov ax, 0
 10203 00004D8E 8946FE                   mov [bp-2], ax
 10204                                  .listfunc575:
 10205 00004D91 8B46FE                   mov ax, [bp-2]
 10206 00004D94 3B06[3B00]               cmp ax, [FTop]
 10207 00004D98 0F8D0E00                 jge .listfunc576
 10208 00004D9C FF76FE                   push word [bp-2]
 10209 00004D9F E84300                   call funclisting
 10210 00004DA2 83C402                   add  sp, 2
 10211 00004DA5 FF46FE                   inc  word[bp-2]
 10212 00004DA8 EBE7                     jmp .listfunc575
 10213                                  .listfunc576:
 10214                                  
 10215                                  ;-944 int funclisting(int i) {int j;  char c;
 10216 00004DAA C9                       LEAVE
 10217 00004DAB C3                       ret
 10218 00004DAC 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10219 00004DB5 20232043616C6C7320-
 10220 00004DBE 4C696E652057696474-
 10221 00004DC7 6820204E616D652020-
 10222 00004DD0 206C697374206F6620-
 10223 00004DD9 66756E6374696F6E73-
 10224 00004DE2 5C6E00             
 10225                                  ENDP
 10226                                  
 10227                                  funclisting: PROC
 10228                                  
 10229                                  ;-945   prs("\n;");    printint51(i);
 10230                                  
 10231                                  ;Function : funclisting, Number of local variables: 3
 10232                                  ;   # type sign width addr used name   list of local variables
 10233                                  ;  200 var sign word   944 NULL i = bp+4
 10234                                  ;  201 var sign word   944 NULL j = bp-2
 10235                                  ;  202 var sign byte   944 NULL c = bp-4;
 10236 00004DE5 C8040000                 ENTER  4,0
 10237 00004DE9 68[C14E]                 push funclisting_0
 10238 00004DEC E8FCF6                   call prs
 10239 00004DEF 83C402                   add  sp, 2
 10240 00004DF2 FF7604                   push word [bp+4]
 10241 00004DF5 E88AF8                   call printint51
 10242 00004DF8 83C402                   add  sp, 2
 10243                                  
 10244                                  ;-946   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10245                                  
 10246 00004DFB 8B5E04                   mov bx, [bp+4]
 10247 00004DFE D1E3                     shl bx, 1
 10248 00004E00 8B87F7BA                 mov ax, [FCalls + bx]
 10249 00004E04 8946FE                   mov [bp-2], ax
 10250 00004E07 8B46FE                   mov ax, [bp-2]
 10251 00004E0A 08C0                     or  al, al
 10252 00004E0C 0F840C00                 je .funclisting577
 10253 00004E10 FF76FE                   push word [bp-2]
 10254 00004E13 E86CF8                   call printint51
 10255 00004E16 83C402                   add  sp, 2
 10256 00004E19 E90900                   jmp .funclisting578
 10257                                  .funclisting577:
 10258 00004E1C 68[C54E]                 push funclisting_1
 10259 00004E1F E8C9F6                   call prs
 10260 00004E22 83C402                   add  sp, 2
 10261                                  
 10262                                  ;-947   j = FAdr[i];   printint51(j); prc(32);
 10263                                  
 10264                                  .funclisting578:
 10265 00004E25 8B5E04                   mov bx, [bp+4]
 10266 00004E28 D1E3                     shl bx, 1
 10267 00004E2A 8B87FFA8                 mov ax, [FAdr + bx]
 10268 00004E2E 8946FE                   mov [bp-2], ax
 10269 00004E31 FF76FE                   push word [bp-2]
 10270 00004E34 E84BF8                   call printint51
 10271 00004E37 83C402                   add  sp, 2
 10272 00004E3A 6A20                     push 32
 10273 00004E3C E845F6                   call prc
 10274 00004E3F 83C402                   add  sp, 2
 10275                                  
 10276                                  ;-948   c=FType[i];
 10277                                  
 10278 00004E42 8B5E04                   mov bx, [bp+4]
 10279 00004E45 8A8703A0                 mov al, [FType + bx]
 10280 00004E49 8846FC                   mov [bp-4], al
 10281                                  
 10282                                  ;-949   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10283                                  
 10284 00004E4C 8A46FC                   mov al, [bp-4]
 10285 00004E4F 3C56                     cmp al, 86
 10286 00004E51 0F850900                 jne .funclisting579
 10287 00004E55 68[CB4E]                 push funclisting_2
 10288 00004E58 E890F6                   call prs
 10289 00004E5B 83C402                   add  sp, 2
 10290                                  .funclisting579:
 10291 00004E5E 8A46FC                   mov al, [bp-4]
 10292 00004E61 3C42                     cmp al, 66
 10293 00004E63 0F850900                 jne .funclisting580
 10294 00004E67 68[D14E]                 push funclisting_3
 10295 00004E6A E87EF6                   call prs
 10296 00004E6D 83C402                   add  sp, 2
 10297                                  
 10298                                  ;-950   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10299                                  
 10300                                  .funclisting580:
 10301 00004E70 8A46FC                   mov al, [bp-4]
 10302 00004E73 3C57                     cmp al, 87
 10303 00004E75 0F850900                 jne .funclisting581
 10304 00004E79 68[D74E]                 push funclisting_4
 10305 00004E7C E86CF6                   call prs
 10306 00004E7F 83C402                   add  sp, 2
 10307                                  .funclisting581:
 10308 00004E82 8A46FC                   mov al, [bp-4]
 10309 00004E85 3C44                     cmp al, 68
 10310 00004E87 0F850900                 jne .funclisting582
 10311 00004E8B 68[DD4E]                 push funclisting_5
 10312 00004E8E E85AF6                   call prs
 10313 00004E91 83C402                   add  sp, 2
 10314                                  
 10315                                  ;-951   prc(32); prc(32);
 10316                                  
 10317                                  .funclisting582:
 10318 00004E94 6A20                     push 32
 10319 00004E96 E8EBF5                   call prc
 10320 00004E99 83C402                   add  sp, 2
 10321 00004E9C 6A20                     push 32
 10322 00004E9E E8E3F5                   call prc
 10323 00004EA1 83C402                   add  sp, 2
 10324                                  
 10325                                  ;-952   pt=adrF(FNameField, i); prs(pt);
 10326                                  
 10327 00004EA4 FF7604                   push word [bp+4]
 10328 00004EA7 8D064FBD                 lea  ax, [FNameField]
 10329 00004EAB 50                       push ax
 10330 00004EAC E839BA                   call adrF
 10331 00004EAF 83C404                   add  sp, 4
 10332 00004EB2 A3[6A00]                 mov word [pt], ax
 10333 00004EB5 FF36[6A00]               push word [pt]
 10334 00004EB9 E82FF6                   call prs
 10335 00004EBC 83C402                   add  sp, 2
 10336                                  
 10337                                  ;-953 }
 10338                                  
 10339                                  
 10340                                  ;-954 unsigned int MAXUI=65535;
 10341 00004EBF C9                       LEAVE
 10342 00004EC0 C3                       ret
 10343 00004EC1 5C6E3B00                funclisting_0 db "\n;",0
 10344 00004EC5 204E554C4C00            funclisting_1 db " NULL",0
 10345 00004ECB 766F69642000            funclisting_2 db "void ",0
 10346 00004ED1 627974652000            funclisting_3 db "byte ",0
 10347 00004ED7 776F72642000            funclisting_4 db "word ",0
 10348 00004EDD 647772642000            funclisting_5 db "dwrd ",0
 10349                                  ENDP
 10350 00004EE3 FFFF                    MAXUI dw 65535
 10351                                  
 10352                                  ;-955 int epilog() {unsigned int i; 
 10353                                  
 10354                                  
 10355                                  epilog: PROC
 10356                                  
 10357                                  ;-956   strcpy(symbol, "LastFunctionByt");  storefunc();
 10358                                  
 10359                                  ;Function : epilog, Number of local variables: 1
 10360                                  ;   # type sign width addr used name   list of local variables
 10361                                  ;  200 var unsg word   955 NULL i = bp-2;
 10362 00004EE5 C8020000                 ENTER  2,0
 10363 00004EE9 68[1751]                 push epilog_0
 10364 00004EEC 8D062B81                 lea  ax, [symbol]
 10365 00004EF0 50                       push ax
 10366 00004EF1 E872B2                   call strcpy
 10367 00004EF4 83C404                   add  sp, 4
 10368 00004EF7 E8C9BC                   call storefunc
 10369                                  
 10370                                  ;-957   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10371                                  
 10372 00004EFA 68[2751]                 push epilog_1
 10373 00004EFD E8EBF5                   call prs
 10374 00004F00 83C402                   add  sp, 2
 10375                                  
 10376                                  ;-958   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10377                                  
 10378 00004F03 68[5451]                 push epilog_2
 10379 00004F06 E8E2F5                   call prs
 10380 00004F09 83C402                   add  sp, 2
 10381                                  
 10382                                  ;-959   i=1;
 10383                                  
 10384 00004F0C B80100                   mov ax, 1
 10385 00004F0F 8946FE                   mov [bp-2], ax
 10386                                  
 10387                                  ;-960   while (i< GTop) { listvar(i); i++; }
 10388                                  
 10389                                  .epilog583:
 10390 00004F12 8B46FE                   mov ax, [bp-2]
 10391 00004F15 3B06[2A00]               cmp ax, [GTop]
 10392 00004F19 0F8D0E00                 jge .epilog584
 10393 00004F1D FF76FE                   push word [bp-2]
 10394 00004F20 E8BEFA                   call listvar
 10395 00004F23 83C402                   add  sp, 2
 10396 00004F26 FF46FE                   inc  word[bp-2]
 10397                                  
 10398                                  ;-961   listfunc();   listcall();
 10399                                  
 10400 00004F29 EBE7                     jmp .epilog583
 10401                                  .epilog584:
 10402 00004F2B E831FE                   call listfunc
 10403 00004F2E E8E4FC                   call listcall
 10404                                  
 10405                                  ;-962 
 10406                                  
 10407                                  
 10408                                  ;-963   prs("\n;Input: "); prs(&namein);
 10409                                  
 10410 00004F31 68[9B51]                 push epilog_3
 10411 00004F34 E8B4F5                   call prs
 10412 00004F37 83C402                   add  sp, 2
 10413 00004F3A 8D06EE81                 lea  ax, [namein]
 10414 00004F3E 50                       push ax
 10415 00004F3F E8A9F5                   call prs
 10416 00004F42 83C402                   add  sp, 2
 10417                                  
 10418                                  ;-964   prs(", List: ");   prs(&namelst);
 10419                                  
 10420 00004F45 68[A651]                 push epilog_4
 10421 00004F48 E8A0F5                   call prs
 10422 00004F4B 83C402                   add  sp, 2
 10423 00004F4E 8D063182                 lea  ax, [namelst]
 10424 00004F52 50                       push ax
 10425 00004F53 E895F5                   call prs
 10426 00004F56 83C402                   add  sp, 2
 10427                                  
 10428                                  ;-965   prs(",  Lines:"); printint51(lineno);
 10429                                  
 10430 00004F59 68[AF51]                 push epilog_5
 10431 00004F5C E88CF5                   call prs
 10432 00004F5F 83C402                   add  sp, 2
 10433 00004F62 FF36[6600]               push word [lineno]
 10434 00004F66 E819F7                   call printint51
 10435 00004F69 83C402                   add  sp, 2
 10436                                  
 10437                                  ;-966   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10438                                  
 10439 00004F6C 68[B951]                 push epilog_6
 10440 00004F6F E879F5                   call prs
 10441 00004F72 83C402                   add  sp, 2
 10442 00004F75 FF0E[2A00]               dec  word[GTop]
 10443 00004F79 FF36[2A00]               push word [GTop]
 10444 00004F7D E802F7                   call printint51
 10445 00004F80 83C402                   add  sp, 2
 10446                                  
 10447                                  ;-967   prs(" max.:"); printint51(LSTART);
 10448                                  
 10449 00004F83 68[CD51]                 push epilog_7
 10450 00004F86 E862F5                   call prs
 10451 00004F89 83C402                   add  sp, 2
 10452 00004F8C 68C800                   push 200
 10453 00004F8F E8F0F6                   call printint51
 10454 00004F92 83C402                   add  sp, 2
 10455                                  
 10456                                  ;-968   prs("\n;Functions      :"); printint51(FTop);
 10457                                  
 10458 00004F95 68[D451]                 push epilog_8
 10459 00004F98 E850F5                   call prs
 10460 00004F9B 83C402                   add  sp, 2
 10461 00004F9E FF36[3B00]               push word [FTop]
 10462 00004FA2 E8DDF6                   call printint51
 10463 00004FA5 83C402                   add  sp, 2
 10464                                  
 10465                                  ;-969   prs(" max.:"); printint51(FUNCMAX);
 10466                                  
 10467 00004FA8 68[E851]                 push epilog_9
 10468 00004FAB E83DF5                   call prs
 10469 00004FAE 83C402                   add  sp, 2
 10470 00004FB1 682C01                   push 300
 10471 00004FB4 E8CBF6                   call printint51
 10472 00004FB7 83C402                   add  sp, 2
 10473                                  
 10474                                  ;-970   prs("\n;Calls          :"); printint51(CTop);
 10475                                  
 10476 00004FBA 68[EF51]                 push epilog_10
 10477 00004FBD E82BF5                   call prs
 10478 00004FC0 83C402                   add  sp, 2
 10479 00004FC3 FF36[3D00]               push word [CTop]
 10480 00004FC7 E8B8F6                   call printint51
 10481 00004FCA 83C402                   add  sp, 2
 10482                                  
 10483                                  ;-971   prs(" max.:"); printint51(CALLMAX);
 10484                                  
 10485 00004FCD 68[0352]                 push epilog_11
 10486 00004FD0 E818F5                   call prs
 10487 00004FD3 83C402                   add  sp, 2
 10488 00004FD6 68D007                   push 2000
 10489 00004FD9 E8A6F6                   call printint51
 10490 00004FDC 83C402                   add  sp, 2
 10491                                  
 10492                                  ;-972   prs(", NameField:"); printint51(CNameTop);
 10493                                  
 10494 00004FDF 68[0A52]                 push epilog_12
 10495 00004FE2 E806F5                   call prs
 10496 00004FE5 83C402                   add  sp, 2
 10497 00004FE8 FF36[6000]               push word [CNameTop]
 10498 00004FEC E893F6                   call printint51
 10499 00004FEF 83C402                   add  sp, 2
 10500                                  
 10501                                  ;-973   prs(" max.:"); printint51(65535);
 10502                                  
 10503 00004FF2 68[1752]                 push epilog_13
 10504 00004FF5 E8F3F4                   call prs
 10505 00004FF8 83C402                   add  sp, 2
 10506 00004FFB 68FFFF                   push 65535
 10507 00004FFE E881F6                   call printint51
 10508 00005001 83C402                   add  sp, 2
 10509                                  
 10510                                  ;-974 //  prs(", segE:"); printint51(segE);
 10511                                  
 10512                                  
 10513                                  ;-975   __asm{call LastFunctionByt}  _ i=ax;
 10514                                  
 10515 00005004 E89903                  call LastFunctionByt
 10516 00005007 8946FE                  mov [bp-2], ax
 10517                                  
 10518                                  ;-976   prs("\n;Code until     :"); printint51(i);
 10519                                  
 10520 0000500A 68[1E52]                 push epilog_14
 10521 0000500D E8DBF4                   call prs
 10522 00005010 83C402                   add  sp, 2
 10523 00005013 FF76FE                   push word [bp-2]
 10524 00005016 E869F6                   call printint51
 10525 00005019 83C402                   add  sp, 2
 10526                                  
 10527                                  ;-977   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10528                                  
 10529 0000501C 68[3252]                 push epilog_15
 10530 0000501F E8C9F4                   call prs
 10531 00005022 83C402                   add  sp, 2
 10532 00005025 FF36[0E00]               push word [ORGDATAORIG]
 10533 00005029 E856F6                   call printint51
 10534 0000502C 83C402                   add  sp, 2
 10535 0000502F A1[0E00]                 mov ax, [ORGDATAORIG]
 10536 00005032 2B46FE                   sub ax, [bp-2]
 10537 00005035 8946FE                   mov [bp-2], ax
 10538 00005038 68[3A52]                 push epilog_16
 10539 0000503B E8ADF4                   call prs
 10540 0000503E 83C402                   add  sp, 2
 10541                                  
 10542                                  ;-978   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10543                                  
 10544 00005041 FF76FE                   push word [bp-2]
 10545 00005044 E83BF6                   call printint51
 10546 00005047 83C402                   add  sp, 2
 10547 0000504A 8B46FE                   mov ax, [bp-2]
 10548 0000504D 3DE803                   cmp ax, 1000
 10549 00005050 0F870900                 ja  .epilog585
 10550 00005054 68[4252]                 push epilog_17
 10551 00005057 E891F4                   call prs
 10552 0000505A 83C402                   add  sp, 2
 10553                                  
 10554                                  ;-979   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10555                                  
 10556                                  .epilog585:
 10557 0000505D 68[6752]                 push epilog_18
 10558 00005060 E888F4                   call prs
 10559 00005063 83C402                   add  sp, 2
 10560 00005066 FF36[1000]               push word [orgData]
 10561 0000506A E8D3F5                   call prunsign1
 10562 0000506D 83C402                   add  sp, 2
 10563 00005070 A1[E34E]                 mov ax, [MAXUI]
 10564 00005073 2B06[1000]               sub ax, [orgData]
 10565 00005077 8946FE                   mov [bp-2], ax
 10566                                  
 10567                                  ;-980   prs(", resting stacksize: ");printint51(i);
 10568                                  
 10569 0000507A 68[7B52]                 push epilog_19
 10570 0000507D E86BF4                   call prs
 10571 00005080 83C402                   add  sp, 2
 10572 00005083 FF76FE                   push word [bp-2]
 10573 00005086 E8F9F5                   call printint51
 10574 00005089 83C402                   add  sp, 2
 10575                                  
 10576                                  ;-981   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10577                                  
 10578 0000508C 8B46FE                   mov ax, [bp-2]
 10579 0000508F 3D8813                   cmp ax, 5000
 10580 00005092 0F870900                 ja  .epilog586
 10581 00005096 68[9152]                 push epilog_20
 10582 00005099 E84FF4                   call prs
 10583 0000509C 83C402                   add  sp, 2
 10584                                  
 10585                                  ;-982   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10586                                  
 10587                                  .epilog586:
 10588 0000509F 68[B252]                 push epilog_21
 10589 000050A2 E846F4                   call prs
 10590 000050A5 83C402                   add  sp, 2
 10591 000050A8 8D06E880                 lea  ax, [coname]
 10592 000050AC 50                       push ax
 10593 000050AD E83BF4                   call prs
 10594 000050B0 83C402                   add  sp, 2
 10595 000050B3 68[C552]                 push epilog_22
 10596 000050B6 E832F4                   call prs
 10597 000050B9 83C402                   add  sp, 2
 10598 000050BC FF36[1200]               push word [maxco]
 10599 000050C0 E8BFF5                   call printint51
 10600 000050C3 83C402                   add  sp, 2
 10601                                  
 10602                                  ;-983   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10603                                  
 10604 000050C6 68[C952]                 push epilog_23
 10605 000050C9 E81FF4                   call prs
 10606 000050CC 83C402                   add  sp, 2
 10607 000050CF 68B80B                   push 3000
 10608 000050D2 E8ADF5                   call printint51
 10609 000050D5 83C402                   add  sp, 2
 10610 000050D8 B8B80B                   mov ax, 3000
 10611 000050DB 8946FE                   mov [bp-2], ax
 10612 000050DE 8B46FE                   mov ax, [bp-2]
 10613 000050E1 2B06[1200]               sub ax, [maxco]
 10614 000050E5 8946FE                   mov [bp-2], ax
 10615 000050E8 68[CF52]                 push epilog_24
 10616 000050EB E8FDF3                   call prs
 10617 000050EE 83C402                   add  sp, 2
 10618                                  
 10619                                  ;-984   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10620                                  
 10621 000050F1 FF76FE                   push word [bp-2]
 10622 000050F4 E88BF5                   call printint51
 10623 000050F7 83C402                   add  sp, 2
 10624 000050FA 8B46FE                   mov ax, [bp-2]
 10625 000050FD 3DE803                   cmp ax, 1000
 10626 00005100 0F870900                 ja  .epilog587
 10627 00005104 68[D752]                 push epilog_25
 10628 00005107 E8E1F3                   call prs
 10629 0000510A 83C402                   add  sp, 2
 10630                                  
 10631                                  ;-985   end1(0);}
 10632                                  
 10633                                  .epilog587:
 10634 0000510D 6A00                     push 0
 10635 0000510F E8D5F6                   call end1
 10636 00005112 83C402                   add  sp, 2
 10637                                  
 10638                                  ;-986 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10639                                  
 10640                                  
 10641                                  ;-987 int setblock(unsigned int i) {
 10642 00005115 C9                       LEAVE
 10643 00005116 C3                       ret
 10644 00005117 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10645 00005120 696F6E42797400     
 10646 00005127 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10647 00005130 6374696F6E4279743A-
 10648 00005139 646220304538682C20-
 10649 00005142 302C20305C6E706F70-
 10650 0000514B 2061785C6E72657400 
 10651 00005154 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10652 0000515D 232074797065207369-
 10653 00005166 676E20776964746820-
 10654 0000516F 206164722075736564-
 10655 00005178 206E616D652020206C-
 10656 00005181 697374206F6620676C-
 10657 0000518A 6F62616C2076617269-
 10658 00005193 61626C65735C6E00   
 10659 0000519B 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10660 000051A4 2000               
 10661 000051A6 2C204C6973743A2000      epilog_4 db ", List: ",0
 10662 000051AF 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10663 000051B8 00                 
 10664 000051B9 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10665 000051C2 7661726961626C6573-
 10666 000051CB 3A00               
 10667 000051CD 206D61782E3A00          epilog_7 db " max.:",0
 10668 000051D4 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10669 000051DD 6F6E73202020202020-
 10670 000051E6 3A00               
 10671 000051E8 206D61782E3A00          epilog_9 db " max.:",0
 10672 000051EF 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10673 000051F8 202020202020202020-
 10674 00005201 3A00               
 10675 00005203 206D61782E3A00          epilog_11 db " max.:",0
 10676 0000520A 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10677 00005213 6C643A00           
 10678 00005217 206D61782E3A00          epilog_13 db " max.:",0
 10679 0000521E 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10680 00005227 6E74696C2020202020-
 10681 00005230 3A00               
 10682 00005232 206D61782E3A2000        epilog_15 db " max.: ",0
 10683 0000523A 2C20667265653A00        epilog_16 db ", free:",0
 10684 00005242 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10685 0000524B 696E67202A2A2A2043-
 10686 00005254 6F6465206172656120-
 10687 0000525D 746F6F20736D616C6C-
 10688 00005266 00                 
 10689 00005267 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10690 00005270 48656170456E642920-
 10691 00005279 3A00               
 10692 0000527B 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10693 00005284 20737461636B73697A-
 10694 0000528D 653A2000           
 10695 00005291 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10696 0000529A 696E67202A2A2A2053-
 10697 000052A3 7461636B20746F6F20-
 10698 000052AC 736D616C6C00       
 10699 000052B2 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10700 000052BB 6F6E737420696E2027-
 10701 000052C4 00                 
 10702 000052C5 27203A00                epilog_22 db "' :",0
 10703 000052C9 206D61782E00            epilog_23 db " max.",0
 10704 000052CF 2C20667265653A00        epilog_24 db ", free:",0
 10705 000052D7 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10706 000052E0 696E67202A2A2A2063-
 10707 000052E9 6F6E7374616E742061-
 10708 000052F2 72656120746F6F2073-
 10709 000052FB 6D616C6C00         
 10710                                  ENDP
 10711                                  
 10712                                  setblock: PROC
 10713                                  
 10714                                  ;-988   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10715                                  
 10716                                  ;Function : setblock, Number of local variables: 1
 10717                                  ;   # type sign width addr used name   list of local variables
 10718                                  ;  200 var unsg word   987 NULL i = bp+4;
 10719 00005300 C8000000                 ENTER  0,0
 10720 00005304 B80000                   mov ax, 0
 10721 00005307 A3[6E00]                 mov word [DOS_ERR], ax
 10722 0000530A 8B5E04                   mov  bx, [bp+4]
 10723 0000530D 8CC8                     mov  ax, cs
 10724 0000530F 8EC0                     mov  es, ax
 10725 00005311 B8004A                   mov  ax, 18944
 10726 00005314 E8B6AD                   call DosInt
 10727                                  
 10728                                  ;-989 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10729 00005317 C9                       LEAVE
 10730 00005318 C3                       ret
 10731                                  ENDP
 10732                                  
 10733                                  allocmem: PROC
 10734                                  
 10735                                  ;-990   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10736                                  
 10737                                  ;Function : allocmem, Number of local variables: 3
 10738                                  ;   # type sign width addr used name   list of local variables
 10739                                  ;  200 var unsg word   989 NULL i = bp+4
 10740                                  ;  201 var unsg word   989 NULL vAX = bp-2
 10741                                  ;  202 var unsg word   989 NULL vBX = bp-4;
 10742 00005319 C8040000                 ENTER  4,0
 10743 0000531D B80000                   mov ax, 0
 10744 00005320 A3[6E00]                 mov word [DOS_ERR], ax
 10745 00005323 8B5E04                   mov  bx, [bp+4]
 10746 00005326 B80048                   mov  ax, 18432
 10747 00005329 E8A1AD                   call DosInt
 10748 0000532C 8946FE                  mov [bp-2], ax
 10749 0000532F 895EFC                  mov [bp-4], bx
 10750                                  
 10751                                  ;-991   if(DOS_ERR) return vBX;   return vAX;
 10752                                  
 10753 00005332 A1[6E00]                 mov ax, [DOS_ERR]
 10754 00005335 08C0                     or  al, al
 10755 00005337 0F840600                 je .allocmem588
 10756 0000533B 8B46FC                   mov ax, [bp-4]
 10757 0000533E E90600                   jmp .retnallocmem
 10758                                  .allocmem588:
 10759 00005341 8B46FE                   mov ax, [bp-2]
 10760 00005344 E90000                   jmp .retnallocmem
 10761                                  
 10762                                  ;-992 }
 10763                                  
 10764                                  
 10765                                  ;-993 int copyF(char *dest, char *src, unsigned int sz) {
 10766                                  
 10767 00005347 C9                       .retnallocmem: LEAVE
 10768 00005348 C3                       ret
 10769                                  ENDP
 10770                                  
 10771                                  copyF: PROC
 10772                                  
 10773                                  ;-994   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10774                                  
 10775                                  ;Function : copyF, Number of local variables: 3
 10776                                  ;   # type sign width addr used name   list of local variables
 10777                                  ;  200 ptr sign byte   993 NULL dest = bp+4
 10778                                  ;  201 ptr sign byte   993 NULL src = bp+6
 10779                                  ;  202 var unsg word   993 NULL sz = bp+8;
 10780 00005349 C8000000                 ENTER  0,0
 10781 0000534D A1[6400]                 mov ax, [segE]
 10782 00005350 8EC0                     mov  es, ax
 10783 00005352 8B7606                   mov  si, [bp+6]
 10784 00005355 8B7E04                   mov  di, [bp+4]
 10785 00005358 8B4E08                   mov  cx, [bp+8]
 10786                                  
 10787                                  ;-995   asm cld
 10788                                  
 10789 0000535B FC                       cld
 10790                                  
 10791                                  ;-996   asm rep movsb
 10792                                  
 10793 0000535C F3A4                     rep movsb
 10794                                  
 10795                                  ;-997   asm mov byte [es:di], 0
 10796                                  
 10797 0000535E 26C60500                 mov byte [es:di], 0
 10798                                  
 10799                                  ;-998 }
 10800                                  
 10801                                  
 10802                                  ;-999 int to_far(char *dest, char *src) {
 10803 00005362 C9                       LEAVE
 10804 00005363 C3                       ret
 10805                                  ENDP
 10806                                  
 10807                                  to_far: PROC
 10808                                  
 10809                                  ;-1000   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10810                                  
 10811                                  ;Function : to_far, Number of local variables: 2
 10812                                  ;   # type sign width addr used name   list of local variables
 10813                                  ;  200 ptr sign byte   999 NULL dest = bp+4
 10814                                  ;  201 ptr sign byte   999 NULL src = bp+6;
 10815 00005364 C8000000                 ENTER  0,0
 10816 00005368 A1[6400]                 mov ax, [segE]
 10817 0000536B 8EC0                     mov  es, ax
 10818 0000536D 8B7606                   mov  si, [bp+6]
 10819 00005370 8B7E04                   mov  di, [bp+4]
 10820                                  
 10821                                  ;-1001   asm cld
 10822                                  
 10823 00005373 FC                       cld
 10824                                  
 10825                                  ;-1002   do{
 10826                                  
 10827                                  .to_far589:
 10828                                  
 10829                                  ;-1003   asm lodsb  ; inc si
 10830                                  
 10831 00005374 AC                       lodsb  ; inc si
 10832                                  
 10833                                  ;-1004   asm stosb  ; inc di
 10834                                  
 10835 00005375 AA                       stosb  ; inc di
 10836                                  
 10837                                  ;-1005   } while (al != 0);
 10838                                  
 10839 00005376 3C00                     cmp  al, 0
 10840 00005378 0F840200                 je  .to_far590
 10841 0000537C EBF6                     jmp .to_far589
 10842                                  .to_far590:
 10843                                  
 10844                                  ;-1006 }
 10845                                  
 10846                                  
 10847                                  ;-1007 int from_far(char *dest, char *src) {
 10848 0000537E C9                       LEAVE
 10849 0000537F C3                       ret
 10850                                  ENDP
 10851                                  
 10852                                  from_far: PROC
 10853                                  
 10854                                  ;-1008   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10855                                  
 10856                                  ;Function : from_far, Number of local variables: 2
 10857                                  ;   # type sign width addr used name   list of local variables
 10858                                  ;  200 ptr sign byte  1007 NULL dest = bp+4
 10859                                  ;  201 ptr sign byte  1007 NULL src = bp+6;
 10860 00005380 C8000000                 ENTER  0,0
 10861 00005384 A1[6400]                 mov ax, [segE]
 10862 00005387 8EC0                     mov  es, ax
 10863 00005389 8B7606                   mov  si, [bp+6]
 10864 0000538C 8B7E04                   mov  di, [bp+4]
 10865                                  
 10866                                  ;-1009   do{
 10867                                  
 10868                                  .from_far591:
 10869                                  
 10870                                  ;-1010   asm mov al, [es:si]
 10871                                  
 10872 0000538F 268A04                   mov al, [es:si]
 10873                                  
 10874                                  ;-1011   asm inc si
 10875                                  
 10876 00005392 46                       inc si
 10877                                  
 10878                                  ;-1012   asm mov [di], al
 10879                                  
 10880 00005393 8805                     mov [di], al
 10881                                  
 10882                                  ;-1013   asm inc di
 10883                                  
 10884 00005395 47                       inc di
 10885                                  
 10886                                  ;-1014   } while (al != 0);
 10887                                  
 10888 00005396 3C00                     cmp  al, 0
 10889 00005398 0F840200                 je  .from_far592
 10890 0000539C EBF1                     jmp .from_far591
 10891                                  .from_far592:
 10892                                  
 10893                                  ;-1015 }
 10894 0000539E C9                       LEAVE
 10895 0000539F C3                       ret
 10896                                  ENDP
 10897                                   
 10898                                  ; missing functions: 
 10899                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10900 000053A0 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10901 000053A3 58                      pop ax
 10902 000053A4 C3                      ret
 10903                                   
 10904                                  ;   # type sign width  adr used name   list of global variables
 10905                                  
 10906                                  ;    1 arr sign byte     2    2 Version1[10]
 10907                                  ;    2 def unsg byte     3    - LSTART=200
 10908                                  ;    3 def unsg byte     4    - VARMAX=300
 10909                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10910                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10911                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10912                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10913                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10914                                  ;    9 def unsg byte    11    - T_NAME=256
 10915                                  ;   10 def unsg byte    12    - T_CONST=257
 10916                                  ;   11 def unsg byte    13    - T_STRING=258
 10917                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10918                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10919                                  ;   14 def unsg byte    16    - T_RETURN=512
 10920                                  ;   15 def unsg byte    17    - T_IF=513
 10921                                  ;   16 def unsg byte    18    - T_ELSE=514
 10922                                  ;   17 def unsg byte    19    - T_WHILE=515
 10923                                  ;   18 def unsg byte    20    - T_DO=516
 10924                                  ;   19 def unsg byte    21    - T_INT=517
 10925                                  ;   20 def unsg byte    22    - T_ASM=518
 10926                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10927                                  ;   22 def unsg byte    24    - T_EMIT=520
 10928                                  ;   23 def unsg byte    25    - T_GOTO=521
 10929                                  ;   24 def unsg byte    26    - T_VOID=529
 10930                                  ;   25 def unsg byte    27    - T_CHAR=530
 10931                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10932                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10933                                  ;   28 def unsg byte    30    - T_LONG=533
 10934                                  ;   29 def unsg byte    31    - T_EQ=806
 10935                                  ;   30 def unsg byte    32    - T_NE=807
 10936                                  ;   31 def unsg byte    33    - T_GE=811
 10937                                  ;   32 def unsg byte    34    - T_LE=824
 10938                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10939                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10940                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10941                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10942                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10943                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10944                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10945                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10946                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10947                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10948                                  ;   43 def unsg byte    45    - COMAX=3000
 10949                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10950                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10951                                  ;   46 var unsg word    47   10 orgData
 10952                                  ;   47 arr sign byte    48    4 co[3000]
 10953                                  ;   48 var sign word    48    4 maxco
 10954                                  ;   49 var sign word    48    3 maxco1
 10955                                  ;   50 arr sign byte    49    3 coname[67]
 10956                                  ;   51 ptr sign byte    49    5 cloc
 10957                                  ;   52 var sign word    50    6 fdin
 10958                                  ;   53 var sign word    50    4 fdout
 10959                                  ;   54 arr sign byte    50  104 symbol[128]
 10960                                  ;   55 arr sign byte    51   12 fname[67]
 10961                                  ;   56 arr sign byte    51   10 namein[67]
 10962                                  ;   57 arr sign byte    52    7 namelst[67]
 10963                                  ;   58 arr sign byte    52    2 archivename[67]
 10964                                  ;   59 var sign word    53   41 token
 10965                                  ;   60 var sign byte    53    2 globC
 10966                                  ;   61 var sign word    53    3 spalte
 10967                                  ;   62 var sign byte    54   29 thechar
 10968                                  ;   63 var sign word    55    9 iscmp
 10969                                  ;   64 var sign word    55    4 nconst
 10970                                  ;   65 var sign word    56    3 nreturn
 10971                                  ;   66 var sign word    56   12 nlabel
 10972                                  ;   67 var sign word    57   24 GTop
 10973                                  ;   68 var sign word    57   20 LTop
 10974                                  ;   69 var unsg word    58   44 lexval
 10975                                  ;   70 var sign word    59    6 typei
 10976                                  ;   71 var sign byte    59    8 istype
 10977                                  ;   72 arr sign byte    59   11 GType[300]
 10978                                  ;   73 var sign word    60    6 signi
 10979                                  ;   74 var sign byte    60    5 issign
 10980                                  ;   75 arr sign byte    60    5 GSign[300]
 10981                                  ;   76 var sign word    61    9 widthi
 10982                                  ;   77 var sign byte    61   19 iswidth
 10983                                  ;   78 arr sign byte    61    5 GWidth[300]
 10984                                  ;   79 arr sign word    62    4 GAdr[300]
 10985                                  ;   80 arr sign word    62    6 GUsed[300]
 10986                                  ;   81 var sign word    63   26 wi
 10987                                  ;   82 arr sign word    63   11 GData[300]
 10988                                  ;   83 arr sign byte    63    2 GNameField[4800]
 10989                                  ;   84 var sign word    64   13 FTop
 10990                                  ;   85 var sign word    64    8 CTop
 10991                                  ;   86 arr sign byte    65    2 FType[300]
 10992                                  ;   87 arr sign byte    65    3 CType[2000]
 10993                                  ;   88 arr sign word    66    2 FAdr[300]
 10994                                  ;   89 arr sign word    66    4 CAdr[2000]
 10995                                  ;   90 arr sign word    67    4 FCalls[300]
 10996                                  ;   91 arr sign byte    68    5 FNameField[4800]
 10997                                  ;   92 arr sign byte    69    7 NameA[32]
 10998                                  ;   93 arr sign byte    70    5 fgetsdest[128]
 10999                                  ;   94 ptr unsg byte    70    8 CNameTop
 11000                                  ;   95 ptr unsg byte    71   10 fgetsp
 11001                                  ;   96 var unsg word    71    4 segE
 11002                                  ;   97 var unsg word    72   12 lineno
 11003                                  ;   98 var unsg word    72    2 linenoinclude
 11004                                  ;   99 ptr unsg byte    73   17 pt
 11005                                  ;  100 ptr unsg byte    73    8 p1
 11006                                  ;  101 var sign word    74    9 DOS_ERR
 11007                                  ;  102 var sign word    74    5 DOS_NoBytes
 11008                                  ;  103 var sign byte    74    3 DOS_ByteRead
 11009                                  ;  104 arr sign byte   132    2 doglobName[15]
 11010                                  ;  105 var sign word   298    5 mod1
 11011                                  ;  106 var sign word   298   12 ireg1
 11012                                  ;  107 var sign word   298    6 idx1
 11013                                  ;  108 var sign word   298    1 ids1
 11014                                  ;  109 var sign word   298    4 idw1
 11015                                  ;  110 var sign word   298    2 idt1
 11016                                  ;  111 var sign word   298 NULL val1
 11017                                  ;  112 var sign word   299    2 mod2
 11018                                  ;  113 var sign word   299    6 ireg2
 11019                                  ;  114 var sign word   299    6 idx2
 11020                                  ;  115 var sign word   299    1 ids2
 11021                                  ;  116 var sign word   299    4 idw2
 11022                                  ;  117 var sign word   299    2 idt2
 11023                                  ;  118 var sign word   299    2 val2
 11024                                  ;  119 arr sign byte   364    9 ops[5]
 11025                                  ;  120 arr sign byte   406    3 printregstr[74]
 11026                                  ;  121 var sign word   414    1 evalue
 11027                                  ;  122 var sign word   414    1 exprtype
 11028                                  ;  123 arr sign word   566    2 docalltype[10]
 11029                                  ;  124 arr sign word   566    2 docallvalue[10]
 11030                                  ;  125 arr sign byte   567    2 procname[17]
 11031                                  ;  126 ptr sign byte   623    1 arglen
 11032                                  ;  127 ptr sign byte   623    2 argv
 11033                                  ;  128 arr sign byte   764    2 symboltemp[80]
 11034                                  ;  129 var unsg word   954    1 MAXUI
 11035                                  
 11036                                  
 11037                                  ;   # Calls Line Width  Name   list of functions
 11038                                  
 11039                                  ;    0    4   76   writetty
 11040                                  ;    1    1   77   putch
 11041                                  ;    2    6   78   cputs
 11042                                  ;    3    3   79   mkneg
 11043                                  ;    4    8   81   DosInt
 11044                                  ;    5    2   86   openR
 11045                                  ;    6    1   87   creatR
 11046                                  ;    7    2   88   fcloseR
 11047                                  ;    8    3   89   exitR
 11048                                  ;    9    2   90   readRL
 11049                                  ;   10    1   91   fputcR
 11050                                  ;   11    8   94   strlen
 11051                                  ;   12   24   95   strcpy
 11052                                  ;   13   74   96   eqstr
 11053                                  ;   14    2   99   instr1
 11054                                  ;   15    1  100   strcat1
 11055                                  ;   16    1  101   toupper
 11056                                  ;   17    3  103   digit
 11057                                  ;   18    1  108   letter
 11058                                  ;   19    3  118   alnum
 11059                                  ;   20    4  123   a
 11060                                  ;   21   21  124   v
 11061                                  ;   22    4  129   checknamelen
 11062                                  ;   23    1  133   doglob
 11063                                  ;   24   12  182   gettypes
 11064                                  ;   25    9  191   adrofname
 11065                                  ;   26    7  192   adrF
 11066                                  ;   27    4  194   printName
 11067                                  ;   28   12  198   searchname
 11068                                  ;   29    3  202   checkName
 11069                                  ;   30   10  207   typeName
 11070                                  ;   31    3  223   name1
 11071                                  ;   32    1  228   storecall
 11072                                  ;   33    2  234   storefunc
 11073                                  ;   34    2  238   addlocal
 11074                                  ;   35    1  244   checkFunction
 11075                                  ;   36    1  247   dofunc
 11076                                  ;   37    1  288   isvariable
 11077                                  ;   38    3  301   pexpr
 11078                                  ;   39    1  308   constantexpr
 11079                                  ;   40    3  318   exprstart
 11080                                  ;   41    1  320   expr2
 11081                                  ;   42    3  365   doreg1
 11082                                  ;   43    6  384   checkreg
 11083                                  ;   44    6  409   printreg
 11084                                  ;   45    2  415   expr
 11085                                  ;   46    4  464   compoundass
 11086                                  ;   47    2  471   dovar1
 11087                                  ;   48    8  492   rterm
 11088                                  ;   49    1  505   isreg
 11089                                  ;   50   15  523   doreg
 11090                                  ;   51    1  529   doassign
 11091                                  ;   52    1  547   domul
 11092                                  ;   53    2  551   doidiv
 11093                                  ;   54    1  564   domod
 11094                                  ;   55    1  568   docall1
 11095                                  ;   56 NULL  610   main
 11096                                  ;   57    2  622   getfirstchar
 11097                                  ;   58    1  624   getarg
 11098                                  ;   59    2  642   parse
 11099                                  ;   60    1  651   checkcalls
 11100                                  ;   61    1  668   doinclude
 11101                                  ;   62    1  679   dodefine
 11102                                  ;   63    6  695   stmt
 11103                                  ;   64    1  726   doemit
 11104                                  ;   65    3  730   cmpneg
 11105                                  ;   66    7  743   prlabel
 11106                                  ;   67    3  744   prjump
 11107                                  ;   68    1  745   doif
 11108                                  ;   69    1  751   dodo
 11109                                  ;   70    1  755   dowhile
 11110                                  ;   71    4  758   isrelational
 11111                                  ;   72   17  765   getlex
 11112                                  ;   73    1  817   convertdefine
 11113                                  ;   74    1  824   getdigit
 11114                                  ;   75    1  833   getstring
 11115                                  ;   76   32  836   next
 11116                                  ;   77   78  837   istoken
 11117                                  ;   78   36  838   expect
 11118                                  ;   79    6  841   eprc
 11119                                  ;   80    5  842   eprs
 11120                                  ;   81   41  843   prc
 11121                                  ;   82    3  848   prscomment
 11122                                  ;   83    8  850   prnl
 11123                                  ;   84  249  852   prs
 11124                                  ;   85    2  857   eprnum
 11125                                  ;   86    7  859   pint1
 11126                                  ;   87   35  861   prunsign1
 11127                                  ;   88   25  864   printint51
 11128                                  ;   89    2  868   fgets1
 11129                                  ;   90    1  872   printinputline
 11130                                  ;   91    1  880   ifEOL
 11131                                  ;   92    2  889   end1
 11132                                  ;   93   50  890   error1
 11133                                  ;   94    2  899   listproc
 11134                                  ;   95    2  907   listvar
 11135                                  ;   96    1  923   listcall
 11136                                  ;   97    1  926   calllisting
 11137                                  ;   98    1  932   countcalls
 11138                                  ;   99    1  940   listfunc
 11139                                  ;  100    1  944   funclisting
 11140                                  ;  101    1  955   epilog
 11141                                  ;  102    1  987   setblock
 11142                                  ;  103    1  989   allocmem
 11143                                  ;  104 NULL  993   copyF
 11144                                  ;  105    1  999   to_far
 11145                                  ;  106    3 1007   from_far
 11146                                  ;  107 NULL 1015   LastFunctionByt
 11147                                  
 11148                                  ;    #  addr name   list of CALLs
 11149                                  
 11150                                  ;    0     0 writetty
 11151                                  ;    1     9 writetty
 11152                                  ;    2    18 putch
 11153                                  ;    3    24 DosInt
 11154                                  ;    4    31 DosInt
 11155                                  ;    5    38 DosInt
 11156                                  ;    6    45 DosInt
 11157                                  ;    7    52 DosInt
 11158                                  ;    8    59 DosInt
 11159                                  ;    9    66 strcpy
 11160                                  ;   10    73 digit
 11161                                  ;   11    79 letter
 11162                                  ;   12    86 printName
 11163                                  ;   13    96 prc
 11164                                  ;   14   100 printName
 11165                                  ;   15   110 prc
 11166                                  ;   16   114 strlen
 11167                                  ;   17   121 error1
 11168                                  ;   18   128 error1
 11169                                  ;   19   135 error1
 11170                                  ;   20   142 checknamelen
 11171                                  ;   21   155 checkName
 11172                                  ;   22   165 error1
 11173                                  ;   23   172 istoken
 11174                                  ;   24   180 istoken
 11175                                  ;   25   188 prs
 11176                                  ;   26   192 prunsign1
 11177                                  ;   27   202 prs
 11178                                  ;   28   206 prs
 11179                                  ;   29   210 prs
 11180                                  ;   30   214 prs
 11181                                  ;   31   218 prs
 11182                                  ;   32   222 prunsign1
 11183                                  ;   33   232 prs
 11184                                  ;   34   236 expect
 11185                                  ;   35   243 expect
 11186                                  ;   36   250 error1
 11187                                  ;   37   257 prs
 11188                                  ;   38   261 prs
 11189                                  ;   39   265 prs
 11190                                  ;   40   269 strcpy
 11191                                  ;   41   276 expect
 11192                                  ;   42   283 istoken
 11193                                  ;   43   291 prc
 11194                                  ;   44   295 prscomment
 11195                                  ;   45   306 prc
 11196                                  ;   46   310 prs
 11197                                  ;   47   314 strlen
 11198                                  ;   48   321 istoken
 11199                                  ;   49   329 prc
 11200                                  ;   50   333 expect
 11201                                  ;   51   340 prunsign1
 11202                                  ;   52   350 istoken
 11203                                  ;   53   358 expect
 11204                                  ;   54   365 error1
 11205                                  ;   55   372 prs
 11206                                  ;   56   376 prs
 11207                                  ;   57   380 prs
 11208                                  ;   58   384 prs
 11209                                  ;   59   388 prs
 11210                                  ;   60   392 prs
 11211                                  ;   61   396 istoken
 11212                                  ;   62   404 prc
 11213                                  ;   63   408 istoken
 11214                                  ;   64   416 expect
 11215                                  ;   65   423 prunsign1
 11216                                  ;   66   433 prunsign1
 11217                                  ;   67   443 adrofname
 11218                                  ;   68   453 strcpy
 11219                                  ;   69   460 strcpy
 11220                                  ;   70   467 expect
 11221                                  ;   71   474 adrF
 11222                                  ;   72   479 adrofname
 11223                                  ;   73   489 prs
 11224                                  ;   74   493 prs
 11225                                  ;   75   497 prc
 11226                                  ;   76   501 pint1
 11227                                  ;   77   507 prc
 11228                                  ;   78   511 checkName
 11229                                  ;   79   521 error1
 11230                                  ;   80   528 adrofname
 11231                                  ;   81   538 eqstr
 11232                                  ;   82   544 adrofname
 11233                                  ;   83   554 eqstr
 11234                                  ;   84   560 istoken
 11235                                  ;   85   568 istoken
 11236                                  ;   86   576 istoken
 11237                                  ;   87   584 istoken
 11238                                  ;   88   592 istoken
 11239                                  ;   89   600 istoken
 11240                                  ;   90   608 istoken
 11241                                  ;   91   616 istoken
 11242                                  ;   92   624 name1
 11243                                  ;   93   630 error1
 11244                                  ;   94   637 getlex
 11245                                  ;   95   644 error1
 11246                                  ;   96   651 error1
 11247                                  ;   97   658 strlen
 11248                                  ;   98   665 to_far
 11249                                  ;   99   672 error1
 11250                                  ;  100   679 adrF
 11251                                  ;  101   684 strcpy
 11252                                  ;  102   691 error1
 11253                                  ;  103   698 checkName
 11254                                  ;  104   708 error1
 11255                                  ;  105   715 adrF
 11256                                  ;  106   720 strcpy
 11257                                  ;  107   727 adrF
 11258                                  ;  108   732 eqstr
 11259                                  ;  109   738 checknamelen
 11260                                  ;  110   751 strcpy
 11261                                  ;  111   758 checkFunction
 11262                                  ;  112   772 error1
 11263                                  ;  113   779 storefunc
 11264                                  ;  114   789 prs
 11265                                  ;  115   793 prs
 11266                                  ;  116   797 prs
 11267                                  ;  117   801 expect
 11268                                  ;  118   808 istoken
 11269                                  ;  119   816 typeName
 11270                                  ;  120   825 addlocal
 11271                                  ;  121   834 istoken
 11272                                  ;  122   842 expect
 11273                                  ;  123   849 expect
 11274                                  ;  124   856 isvariable
 11275                                  ;  125   867 typeName
 11276                                  ;  126   876 checknamelen
 11277                                  ;  127   889 addlocal
 11278                                  ;  128   898 istoken
 11279                                  ;  129   906 expect
 11280                                  ;  130   913 expect
 11281                                  ;  131   920 istoken
 11282                                  ;  132   928 expect
 11283                                  ;  133   935 listproc
 11284                                  ;  134   944 prs
 11285                                  ;  135   948 mkneg
 11286                                  ;  136   954 prunsign1
 11287                                  ;  137   964 prs
 11288                                  ;  138   968 istoken
 11289                                  ;  139   976 stmt
 11290                                  ;  140   981 prs
 11291                                  ;  141   985 prs
 11292                                  ;  142   989 prc
 11293                                  ;  143   993 prs
 11294                                  ;  144   997 prs
 11295                                  ;  145  1001 prs
 11296                                  ;  146  1005 strlen
 11297                                  ;  147  1012 strcpy
 11298                                  ;  148  1019 prs
 11299                                  ;  149  1023 expect
 11300                                  ;  150  1030 eqstr
 11301                                  ;  151  1036 constantexpr
 11302                                  ;  152  1049 checkreg
 11303                                  ;  153  1058 doreg1
 11304                                  ;  154  1065 exprstart
 11305                                  ;  155  1075 prs
 11306                                  ;  156  1079 prs
 11307                                  ;  157  1083 expect
 11308                                  ;  158  1090 getlex
 11309                                  ;  159  1097 typeName
 11310                                  ;  160  1106 searchname
 11311                                  ;  161  1117 gettypes
 11312                                  ;  162  1126 isrelational
 11313                                  ;  163  1139 error1
 11314                                  ;  164  1146 expect
 11315                                  ;  165  1153 prs
 11316                                  ;  166  1157 prs
 11317                                  ;  167  1161 gettypes
 11318                                  ;  168  1170 prs
 11319                                  ;  169  1174 prs
 11320                                  ;  170  1178 v
 11321                                  ;  171  1180 prs
 11322                                  ;  172  1184 prunsign1
 11323                                  ;  173  1194 cmpneg
 11324                                  ;  174  1201 prs
 11325                                  ;  175  1205 expect
 11326                                  ;  176  1212 eqstr
 11327                                  ;  177  1218 expr2
 11328                                  ;  178  1224 expr
 11329                                  ;  179  1229 getlex
 11330                                  ;  180  1236 typeName
 11331                                  ;  181  1245 error1
 11332                                  ;  182  1252 checkreg
 11333                                  ;  183  1261 doreg1
 11334                                  ;  184  1268 searchname
 11335                                  ;  185  1279 gettypes
 11336                                  ;  186  1288 error1
 11337                                  ;  187  1295 isrelational
 11338                                  ;  188  1308 error1
 11339                                  ;  189  1315 istoken
 11340                                  ;  190  1323 error1
 11341                                  ;  191  1330 istoken
 11342                                  ;  192  1338 prs
 11343                                  ;  193  1342 prs
 11344                                  ;  194  1346 prs
 11345                                  ;  195  1350 prs
 11346                                  ;  196  1354 prs
 11347                                  ;  197  1358 v
 11348                                  ;  198  1360 prs
 11349                                  ;  199  1364 prunsign1
 11350                                  ;  200  1374 adrofname
 11351                                  ;  201  1384 prs
 11352                                  ;  202  1388 prs
 11353                                  ;  203  1392 typeName
 11354                                  ;  204  1401 checkreg
 11355                                  ;  205  1410 prs
 11356                                  ;  206  1414 printreg
 11357                                  ;  207  1423 v
 11358                                  ;  208  1425 prs
 11359                                  ;  209  1429 printreg
 11360                                  ;  210  1438 error1
 11361                                  ;  211  1445 searchname
 11362                                  ;  212  1456 gettypes
 11363                                  ;  213  1465 error1
 11364                                  ;  214  1472 prs
 11365                                  ;  215  1476 printreg
 11366                                  ;  216  1485 error1
 11367                                  ;  217  1492 prs
 11368                                  ;  218  1496 a
 11369                                  ;  219  1498 prs
 11370                                  ;  220  1502 prs
 11371                                  ;  221  1506 prs
 11372                                  ;  222  1510 v
 11373                                  ;  223  1512 adrofname
 11374                                  ;  224  1522 prs
 11375                                  ;  225  1526 prs
 11376                                  ;  226  1530 error1
 11377                                  ;  227  1537 istoken
 11378                                  ;  228  1545 strcpy
 11379                                  ;  229  1552 istoken
 11380                                  ;  230  1560 strcpy
 11381                                  ;  231  1567 istoken
 11382                                  ;  232  1575 strcpy
 11383                                  ;  233  1582 istoken
 11384                                  ;  234  1590 strcpy
 11385                                  ;  235  1597 istoken
 11386                                  ;  236  1605 strcpy
 11387                                  ;  237  1612 istoken
 11388                                  ;  238  1620 strcpy
 11389                                  ;  239  1627 istoken
 11390                                  ;  240  1635 strcpy
 11391                                  ;  241  1642 getlex
 11392                                  ;  242  1649 isrelational
 11393                                  ;  243  1662 error1
 11394                                  ;  244  1669 strcpy
 11395                                  ;  245  1676 prnl
 11396                                  ;  246  1681 prs
 11397                                  ;  247  1685 prs
 11398                                  ;  248  1689 printreg
 11399                                  ;  249  1698 prs
 11400                                  ;  250  1702 istoken
 11401                                  ;  251  1710 prunsign1
 11402                                  ;  252  1720 typeName
 11403                                  ;  253  1729 checkreg
 11404                                  ;  254  1738 printreg
 11405                                  ;  255  1747 searchname
 11406                                  ;  256  1758 a
 11407                                  ;  257  1760 v
 11408                                  ;  258  1762 cmpneg
 11409                                  ;  259  1769 prs
 11410                                  ;  260  1773 expect
 11411                                  ;  261  1780 strlen
 11412                                  ;  262  1787 eqstr
 11413                                  ;  263  1793 eqstr
 11414                                  ;  264  1799 eqstr
 11415                                  ;  265  1805 eqstr
 11416                                  ;  266  1811 eqstr
 11417                                  ;  267  1817 eqstr
 11418                                  ;  268  1823 eqstr
 11419                                  ;  269  1829 eqstr
 11420                                  ;  270  1835 eqstr
 11421                                  ;  271  1841 eqstr
 11422                                  ;  272  1847 eqstr
 11423                                  ;  273  1853 eqstr
 11424                                  ;  274  1859 eqstr
 11425                                  ;  275  1865 eqstr
 11426                                  ;  276  1871 eqstr
 11427                                  ;  277  1877 eqstr
 11428                                  ;  278  1883 eqstr
 11429                                  ;  279  1889 eqstr
 11430                                  ;  280  1895 eqstr
 11431                                  ;  281  1901 eqstr
 11432                                  ;  282  1907 eqstr
 11433                                  ;  283  1913 eqstr
 11434                                  ;  284  1919 strlen
 11435                                  ;  285  1926 eqstr
 11436                                  ;  286  1932 eqstr
 11437                                  ;  287  1938 eqstr
 11438                                  ;  288  1944 eqstr
 11439                                  ;  289  1950 eqstr
 11440                                  ;  290  1956 eqstr
 11441                                  ;  291  1962 eqstr
 11442                                  ;  292  1968 eqstr
 11443                                  ;  293  1974 eqstr
 11444                                  ;  294  1980 prc
 11445                                  ;  295  1984 prc
 11446                                  ;  296  1988 prc
 11447                                  ;  297  1992 istoken
 11448                                  ;  298  2000 prs
 11449                                  ;  299  2004 prunsign1
 11450                                  ;  300  2014 typeName
 11451                                  ;  301  2023 checkreg
 11452                                  ;  302  2032 doreg1
 11453                                  ;  303  2039 docall1
 11454                                  ;  304  2047 isreg
 11455                                  ;  305  2053 searchname
 11456                                  ;  306  2064 gettypes
 11457                                  ;  307  2073 istoken
 11458                                  ;  308  2081 istoken
 11459                                  ;  309  2089 expect
 11460                                  ;  310  2096 searchname
 11461                                  ;  311  2107 expect
 11462                                  ;  312  2114 expect
 11463                                  ;  313  2121 gettypes
 11464                                  ;  314  2130 error1
 11465                                  ;  315  2137 istoken
 11466                                  ;  316  2145 error1
 11467                                  ;  317  2152 prs
 11468                                  ;  318  2156 prs
 11469                                  ;  319  2160 prs
 11470                                  ;  320  2164 v
 11471                                  ;  321  2166 istoken
 11472                                  ;  322  2174 error1
 11473                                  ;  323  2181 prs
 11474                                  ;  324  2185 prs
 11475                                  ;  325  2189 prs
 11476                                  ;  326  2193 v
 11477                                  ;  327  2195 istoken
 11478                                  ;  328  2203 compoundass
 11479                                  ;  329  2215 istoken
 11480                                  ;  330  2223 compoundass
 11481                                  ;  331  2235 istoken
 11482                                  ;  332  2243 compoundass
 11483                                  ;  333  2255 istoken
 11484                                  ;  334  2263 compoundass
 11485                                  ;  335  2275 istoken
 11486                                  ;  336  2283 error1
 11487                                  ;  337  2290 istoken
 11488                                  ;  338  2298 error1
 11489                                  ;  339  2305 istoken
 11490                                  ;  340  2313 expr
 11491                                  ;  341  2318 doassign
 11492                                  ;  342  2327 dovar1
 11493                                  ;  343  2334 istoken
 11494                                  ;  344  2342 rterm
 11495                                  ;  345  2348 istoken
 11496                                  ;  346  2356 rterm
 11497                                  ;  347  2362 istoken
 11498                                  ;  348  2370 rterm
 11499                                  ;  349  2376 istoken
 11500                                  ;  350  2384 rterm
 11501                                  ;  351  2390 istoken
 11502                                  ;  352  2398 rterm
 11503                                  ;  353  2404 istoken
 11504                                  ;  354  2412 rterm
 11505                                  ;  355  2418 istoken
 11506                                  ;  356  2426 domul
 11507                                  ;  357  2432 istoken
 11508                                  ;  358  2440 doidiv
 11509                                  ;  359  2447 istoken
 11510                                  ;  360  2455 domod
 11511                                  ;  361  2461 isrelational
 11512                                  ;  362  2474 rterm
 11513                                  ;  363  2480 cmpneg
 11514                                  ;  364  2487 error1
 11515                                  ;  365  2494 prnl
 11516                                  ;  366  2499 prs
 11517                                  ;  367  2503 prs
 11518                                  ;  368  2507 gettypes
 11519                                  ;  369  2516 prs
 11520                                  ;  370  2520 prs
 11521                                  ;  371  2524 v
 11522                                  ;  372  2526 prs
 11523                                  ;  373  2530 expect
 11524                                  ;  374  2537 prunsign1
 11525                                  ;  375  2547 gettypes
 11526                                  ;  376  2556 prs
 11527                                  ;  377  2560 v
 11528                                  ;  378  2562 prnl
 11529                                  ;  379  2567 prs
 11530                                  ;  380  2571 prs
 11531                                  ;  381  2575 prs
 11532                                  ;  382  2579 prnl
 11533                                  ;  383  2584 prs
 11534                                  ;  384  2588 prs
 11535                                  ;  385  2592 a
 11536                                  ;  386  2594 prs
 11537                                  ;  387  2598 v
 11538                                  ;  388  2600 prs
 11539                                  ;  389  2604 prs
 11540                                  ;  390  2608 prs
 11541                                  ;  391  2612 prs
 11542                                  ;  392  2616 prs
 11543                                  ;  393  2620 prc
 11544                                  ;  394  2624 printName
 11545                                  ;  395  2634 prs
 11546                                  ;  396  2638 prnl
 11547                                  ;  397  2643 prs
 11548                                  ;  398  2647 prs
 11549                                  ;  399  2651 prs
 11550                                  ;  400  2655 prs
 11551                                  ;  401  2659 v
 11552                                  ;  402  2661 istoken
 11553                                  ;  403  2669 prnl
 11554                                  ;  404  2674 prs
 11555                                  ;  405  2678 prs
 11556                                  ;  406  2682 prs
 11557                                  ;  407  2686 prs
 11558                                  ;  408  2690 prunsign1
 11559                                  ;  409  2700 typeName
 11560                                  ;  410  2709 searchname
 11561                                  ;  411  2720 istoken
 11562                                  ;  412  2728 searchname
 11563                                  ;  413  2739 expect
 11564                                  ;  414  2746 expect
 11565                                  ;  415  2753 gettypes
 11566                                  ;  416  2762 error1
 11567                                  ;  417  2769 eqstr
 11568                                  ;  418  2775 dovar1
 11569                                  ;  419  2782 eqstr
 11570                                  ;  420  2788 doreg
 11571                                  ;  421  2794 eqstr
 11572                                  ;  422  2800 doreg
 11573                                  ;  423  2806 eqstr
 11574                                  ;  424  2812 doreg
 11575                                  ;  425  2818 eqstr
 11576                                  ;  426  2824 doreg
 11577                                  ;  427  2830 eqstr
 11578                                  ;  428  2836 doreg
 11579                                  ;  429  2842 eqstr
 11580                                  ;  430  2848 doreg
 11581                                  ;  431  2854 eqstr
 11582                                  ;  432  2860 doreg
 11583                                  ;  433  2866 eqstr
 11584                                  ;  434  2872 doreg
 11585                                  ;  435  2878 eqstr
 11586                                  ;  436  2884 doreg
 11587                                  ;  437  2890 eqstr
 11588                                  ;  438  2896 doreg
 11589                                  ;  439  2902 eqstr
 11590                                  ;  440  2908 doreg
 11591                                  ;  441  2914 eqstr
 11592                                  ;  442  2920 doreg
 11593                                  ;  443  2926 eqstr
 11594                                  ;  444  2932 doreg
 11595                                  ;  445  2938 eqstr
 11596                                  ;  446  2944 doreg
 11597                                  ;  447  2950 eqstr
 11598                                  ;  448  2956 doreg
 11599                                  ;  449  2962 expect
 11600                                  ;  450  2969 prs
 11601                                  ;  451  2973 prs
 11602                                  ;  452  2977 prs
 11603                                  ;  453  2981 istoken
 11604                                  ;  454  2989 prunsign1
 11605                                  ;  455  2999 istoken
 11606                                  ;  456  3007 searchname
 11607                                  ;  457  3018 v
 11608                                  ;  458  3020 error1
 11609                                  ;  459  3027 gettypes
 11610                                  ;  460  3036 prs
 11611                                  ;  461  3040 v
 11612                                  ;  462  3042 prs
 11613                                  ;  463  3046 prs
 11614                                  ;  464  3050 prs
 11615                                  ;  465  3054 a
 11616                                  ;  466  3056 prs
 11617                                  ;  467  3060 prs
 11618                                  ;  468  3064 prunsign1
 11619                                  ;  469  3074 v
 11620                                  ;  470  3076 prs
 11621                                  ;  471  3080 prs
 11622                                  ;  472  3084 printName
 11623                                  ;  473  3094 prs
 11624                                  ;  474  3098 prs
 11625                                  ;  475  3102 prs
 11626                                  ;  476  3106 prs
 11627                                  ;  477  3110 v
 11628                                  ;  478  3112 prs
 11629                                  ;  479  3116 prs
 11630                                  ;  480  3120 prs
 11631                                  ;  481  3124 v
 11632                                  ;  482  3126 prs
 11633                                  ;  483  3130 prs
 11634                                  ;  484  3134 prs
 11635                                  ;  485  3138 v
 11636                                  ;  486  3140 prs
 11637                                  ;  487  3144 rterm
 11638                                  ;  488  3150 istoken
 11639                                  ;  489  3158 prs
 11640                                  ;  490  3162 prunsign1
 11641                                  ;  491  3172 prs
 11642                                  ;  492  3176 error1
 11643                                  ;  493  3183 istoken
 11644                                  ;  494  3191 prs
 11645                                  ;  495  3195 prunsign1
 11646                                  ;  496  3205 prs
 11647                                  ;  497  3209 prs
 11648                                  ;  498  3213 typeName
 11649                                  ;  499  3222 searchname
 11650                                  ;  500  3233 error1
 11651                                  ;  501  3240 gettypes
 11652                                  ;  502  3249 error1
 11653                                  ;  503  3256 error1
 11654                                  ;  504  3263 prs
 11655                                  ;  505  3267 v
 11656                                  ;  506  3269 prs
 11657                                  ;  507  3273 prs
 11658                                  ;  508  3277 doidiv
 11659                                  ;  509  3284 prs
 11660                                  ;  510  3288 checknamelen
 11661                                  ;  511  3301 strcpy
 11662                                  ;  512  3308 storecall
 11663                                  ;  513  3318 expect
 11664                                  ;  514  3325 istoken
 11665                                  ;  515  3333 error1
 11666                                  ;  516  3340 istoken
 11667                                  ;  517  3348 istoken
 11668                                  ;  518  3356 eprs
 11669                                  ;  519  3361 eprs
 11670                                  ;  520  3366 eprc
 11671                                  ;  521  3371 eprnum
 11672                                  ;  522  3378 eprs
 11673                                  ;  523  3383 eprc
 11674                                  ;  524  3388 eprs
 11675                                  ;  525  3393 eprc
 11676                                  ;  526  3398 eprs
 11677                                  ;  527  3403 istoken
 11678                                  ;  528  3411 name1
 11679                                  ;  529  3417 searchname
 11680                                  ;  530  3428 istoken
 11681                                  ;  531  3436 checkreg
 11682                                  ;  532  3445 searchname
 11683                                  ;  533  3456 error1
 11684                                  ;  534  3463 istoken
 11685                                  ;  535  3471 expect
 11686                                  ;  536  3478 prs
 11687                                  ;  537  3482 prunsign1
 11688                                  ;  538  3492 prs
 11689                                  ;  539  3496 prs
 11690                                  ;  540  3500 prc
 11691                                  ;  541  3504 prunsign1
 11692                                  ;  542  3514 prs
 11693                                  ;  543  3518 v
 11694                                  ;  544  3520 prs
 11695                                  ;  545  3524 gettypes
 11696                                  ;  546  3533 prs
 11697                                  ;  547  3537 v
 11698                                  ;  548  3539 prs
 11699                                  ;  549  3543 v
 11700                                  ;  550  3545 prs
 11701                                  ;  551  3549 prs
 11702                                  ;  552  3553 printreg
 11703                                  ;  553  3562 prs
 11704                                  ;  554  3566 prs
 11705                                  ;  555  3570 prs
 11706                                  ;  556  3574 prunsign1
 11707                                  ;  557  3584 getarg
 11708                                  ;  558  3591 setblock
 11709                                  ;  559  3600 error1
 11710                                  ;  560  3607 allocmem
 11711                                  ;  561  3616 error1
 11712                                  ;  562  3623 getfirstchar
 11713                                  ;  563  3636 parse
 11714                                  ;  564  3642 checkcalls
 11715                                  ;  565  3653 epilog
 11716                                  ;  566  3660 fgets1
 11717                                  ;  567  3667 cputs
 11718                                  ;  568  3673 cputs
 11719                                  ;  569  3679 readRL
 11720                                  ;  570  3686 prnl
 11721                                  ;  571  3691 strcpy
 11722                                  ;  572  3698 instr1
 11723                                  ;  573  3705 strcat1
 11724                                  ;  574  3713 toupper
 11725                                  ;  575  3721 strcpy
 11726                                  ;  576  3728 strlen
 11727                                  ;  577  3735 openR
 11728                                  ;  578  3741 cputs
 11729                                  ;  579  3747 cputs
 11730                                  ;  580  3753 exitR
 11731                                  ;  581  3759 creatR
 11732                                  ;  582  3766 cputs
 11733                                  ;  583  3772 cputs
 11734                                  ;  584  3778 exitR
 11735                                  ;  585  3784 prs
 11736                                  ;  586  3788 prs
 11737                                  ;  587  3792 prs
 11738                                  ;  588  3796 prs
 11739                                  ;  589  3800 prs
 11740                                  ;  590  3804 prs
 11741                                  ;  591  3808 prs
 11742                                  ;  592  3812 getlex
 11743                                  ;  593  3819 istoken
 11744                                  ;  594  3827 istoken
 11745                                  ;  595  3835 dodefine
 11746                                  ;  596  3844 istoken
 11747                                  ;  597  3852 doinclude
 11748                                  ;  598  3862 error1
 11749                                  ;  599  3869 typeName
 11750                                  ;  600  3878 dofunc
 11751                                  ;  601  3885 doglob
 11752                                  ;  602  3892 prs
 11753                                  ;  603  3896 from_far
 11754                                  ;  604  3905 adrF
 11755                                  ;  605  3910 eqstr
 11756                                  ;  606  3916 prs
 11757                                  ;  607  3920 prs
 11758                                  ;  608  3924 prs
 11759                                  ;  609  3928 printint51
 11760                                  ;  610  3939 error1
 11761                                  ;  611  3946 prs
 11762                                  ;  612  3950 prs
 11763                                  ;  613  3954 prs
 11764                                  ;  614  3958 openR
 11765                                  ;  615  3964 prs
 11766                                  ;  616  3968 prs
 11767                                  ;  617  3972 error1
 11768                                  ;  618  3979 parse
 11769                                  ;  619  3985 prs
 11770                                  ;  620  3989 prs
 11771                                  ;  621  3993 getfirstchar
 11772                                  ;  622  4006 getlex
 11773                                  ;  623  4013 eqstr
 11774                                  ;  624  4019 getlex
 11775                                  ;  625  4026 eqstr
 11776                                  ;  626  4032 getlex
 11777                                  ;  627  4039 prs
 11778                                  ;  628  4043 strcpy
 11779                                  ;  629  4050 prs
 11780                                  ;  630  4054 error1
 11781                                  ;  631  4061 getlex
 11782                                  ;  632  4068 expect
 11783                                  ;  633  4075 error1
 11784                                  ;  634  4082 strlen
 11785                                  ;  635  4089 error1
 11786                                  ;  636  4096 adrofname
 11787                                  ;  637  4106 strcpy
 11788                                  ;  638  4113 expect
 11789                                  ;  639  4120 istoken
 11790                                  ;  640  4128 istoken
 11791                                  ;  641  4136 stmt
 11792                                  ;  642  4141 istoken
 11793                                  ;  643  4149 doif
 11794                                  ;  644  4154 istoken
 11795                                  ;  645  4162 dodo
 11796                                  ;  646  4167 istoken
 11797                                  ;  647  4175 dowhile
 11798                                  ;  648  4183 istoken
 11799                                  ;  649  4191 prs
 11800                                  ;  650  4195 name1
 11801                                  ;  651  4201 prs
 11802                                  ;  652  4205 expect
 11803                                  ;  653  4212 prs
 11804                                  ;  654  4216 next
 11805                                  ;  655  4221 prc
 11806                                  ;  656  4225 next
 11807                                  ;  657  4230 getlex
 11808                                  ;  658  4237 istoken
 11809                                  ;  659  4245 prs
 11810                                  ;  660  4249 next
 11811                                  ;  661  4254 prc
 11812                                  ;  662  4258 next
 11813                                  ;  663  4263 getlex
 11814                                  ;  664  4270 error1
 11815                                  ;  665  4277 istoken
 11816                                  ;  666  4285 doemit
 11817                                  ;  667  4292 istoken
 11818                                  ;  668  4300 istoken
 11819                                  ;  669  4308 exprstart
 11820                                  ;  670  4318 prs
 11821                                  ;  671  4322 prs
 11822                                  ;  672  4326 expect
 11823                                  ;  673  4333 prs
 11824                                  ;  674  4337 prs
 11825                                  ;  675  4341 prc
 11826                                  ;  676  4345 expect
 11827                                  ;  677  4352 expect
 11828                                  ;  678  4359 exprstart
 11829                                  ;  679  4369 expect
 11830                                  ;  680  4376 prs
 11831                                  ;  681  4380 getlex
 11832                                  ;  682  4387 prunsign1
 11833                                  ;  683  4397 getlex
 11834                                  ;  684  4404 prc
 11835                                  ;  685  4408 expect
 11836                                  ;  686  4415 prs
 11837                                  ;  687  4419 prs
 11838                                  ;  688  4423 prs
 11839                                  ;  689  4427 prs
 11840                                  ;  690  4431 prs
 11841                                  ;  691  4435 prunsign1
 11842                                  ;  692  4445 prs
 11843                                  ;  693  4449 prs
 11844                                  ;  694  4453 prunsign1
 11845                                  ;  695  4463 prs
 11846                                  ;  696  4467 prs
 11847                                  ;  697  4471 prs
 11848                                  ;  698  4475 error1
 11849                                  ;  699  4482 prs
 11850                                  ;  700  4486 prs
 11851                                  ;  701  4490 prunsign1
 11852                                  ;  702  4500 prc
 11853                                  ;  703  4504 prs
 11854                                  ;  704  4508 prs
 11855                                  ;  705  4512 prunsign1
 11856                                  ;  706  4522 pexpr
 11857                                  ;  707  4528 pint1
 11858                                  ;  708  4534 stmt
 11859                                  ;  709  4539 istoken
 11860                                  ;  710  4547 prjump
 11861                                  ;  711  4554 prlabel
 11862                                  ;  712  4562 stmt
 11863                                  ;  713  4567 prlabel
 11864                                  ;  714  4575 prlabel
 11865                                  ;  715  4583 prlabel
 11866                                  ;  716  4591 stmt
 11867                                  ;  717  4596 expect
 11868                                  ;  718  4603 pexpr
 11869                                  ;  719  4609 pint1
 11870                                  ;  720  4615 prjump
 11871                                  ;  721  4622 prlabel
 11872                                  ;  722  4630 prlabel
 11873                                  ;  723  4638 pexpr
 11874                                  ;  724  4644 pint1
 11875                                  ;  725  4650 stmt
 11876                                  ;  726  4655 prjump
 11877                                  ;  727  4662 prlabel
 11878                                  ;  728  4670 getlex
 11879                                  ;  729  4677 next
 11880                                  ;  730  4682 next
 11881                                  ;  731  4687 next
 11882                                  ;  732  4692 next
 11883                                  ;  733  4697 next
 11884                                  ;  734  4702 next
 11885                                  ;  735  4707 next
 11886                                  ;  736  4712 next
 11887                                  ;  737  4717 next
 11888                                  ;  738  4722 next
 11889                                  ;  739  4727 next
 11890                                  ;  740  4732 next
 11891                                  ;  741  4737 next
 11892                                  ;  742  4742 next
 11893                                  ;  743  4747 next
 11894                                  ;  744  4752 instr1
 11895                                  ;  745  4759 next
 11896                                  ;  746  4764 ifEOL
 11897                                  ;  747  4770 getlex
 11898                                  ;  748  4777 next
 11899                                  ;  749  4782 next
 11900                                  ;  750  4787 getlex
 11901                                  ;  751  4794 getstring
 11902                                  ;  752  4804 digit
 11903                                  ;  753  4810 getdigit
 11904                                  ;  754  4819 next
 11905                                  ;  755  4824 next
 11906                                  ;  756  4829 next
 11907                                  ;  757  4834 alnum
 11908                                  ;  758  4840 strcpy
 11909                                  ;  759  4847 alnum
 11910                                  ;  760  4853 next
 11911                                  ;  761  4858 eqstr
 11912                                  ;  762  4864 eqstr
 11913                                  ;  763  4870 eqstr
 11914                                  ;  764  4876 eqstr
 11915                                  ;  765  4882 eqstr
 11916                                  ;  766  4888 eqstr
 11917                                  ;  767  4894 eqstr
 11918                                  ;  768  4900 eqstr
 11919                                  ;  769  4906 eqstr
 11920                                  ;  770  4912 eqstr
 11921                                  ;  771  4918 eqstr
 11922                                  ;  772  4924 eqstr
 11923                                  ;  773  4930 eqstr
 11924                                  ;  774  4936 eqstr
 11925                                  ;  775  4942 eqstr
 11926                                  ;  776  4948 eqstr
 11927                                  ;  777  4954 eqstr
 11928                                  ;  778  4960 convertdefine
 11929                                  ;  779  4974 strcpy
 11930                                  ;  780  4981 error1
 11931                                  ;  781  4988 adrofname
 11932                                  ;  782  4998 eqstr
 11933                                  ;  783  5004 next
 11934                                  ;  784  5009 alnum
 11935                                  ;  785  5015 next
 11936                                  ;  786  5020 digit
 11937                                  ;  787  5026 next
 11938                                  ;  788  5031 next
 11939                                  ;  789  5036 next
 11940                                  ;  790  5041 fgets1
 11941                                  ;  791  5048 getlex
 11942                                  ;  792  5055 istoken
 11943                                  ;  793  5063 prs
 11944                                  ;  794  5067 listproc
 11945                                  ;  795  5076 prs
 11946                                  ;  796  5080 pint1
 11947                                  ;  797  5086 error1
 11948                                  ;  798  5093 eprc
 11949                                  ;  799  5098 writetty
 11950                                  ;  800  5107 writetty
 11951                                  ;  801  5116 fputcR
 11952                                  ;  802  5123 prc
 11953                                  ;  803  5127 prs
 11954                                  ;  804  5131 prc
 11955                                  ;  805  5135 eprc
 11956                                  ;  806  5140 mkneg
 11957                                  ;  807  5146 eprnum
 11958                                  ;  808  5153 eprc
 11959                                  ;  809  5158 prc
 11960                                  ;  810  5162 mkneg
 11961                                  ;  811  5168 pint1
 11962                                  ;  812  5174 prc
 11963                                  ;  813  5178 prunsign1
 11964                                  ;  814  5188 prc
 11965                                  ;  815  5192 prc
 11966                                  ;  816  5196 prc
 11967                                  ;  817  5200 prc
 11968                                  ;  818  5204 prc
 11969                                  ;  819  5208 prunsign1
 11970                                  ;  820  5218 printinputline
 11971                                  ;  821  5233 readRL
 11972                                  ;  822  5240 prs
 11973                                  ;  823  5244 prunsign1
 11974                                  ;  824  5254 prc
 11975                                  ;  825  5258 prscomment
 11976                                  ;  826  5269 next
 11977                                  ;  827  5274 fcloseR
 11978                                  ;  828  5282 fcloseR
 11979                                  ;  829  5290 exitR
 11980                                  ;  830  5296 prnl
 11981                                  ;  831  5301 prscomment
 11982                                  ;  832  5312 prs
 11983                                  ;  833  5316 prunsign1
 11984                                  ;  834  5326 prs
 11985                                  ;  835  5330 prs
 11986                                  ;  836  5334 prs
 11987                                  ;  837  5338 prunsign1
 11988                                  ;  838  5348 prs
 11989                                  ;  839  5352 prunsign1
 11990                                  ;  840  5362 prs
 11991                                  ;  841  5366 prc
 11992                                  ;  842  5370 prs
 11993                                  ;  843  5374 prunsign1
 11994                                  ;  844  5384 prs
 11995                                  ;  845  5388 prs
 11996                                  ;  846  5392 end1
 11997                                  ;  847  5397 prs
 11998                                  ;  848  5401 prs
 11999                                  ;  849  5405 prs
 12000                                  ;  850  5409 prunsign1
 12001                                  ;  851  5419 prs
 12002                                  ;  852  5423 listvar
 12003                                  ;  853  5431 prs
 12004                                  ;  854  5435 printint51
 12005                                  ;  855  5446 prc
 12006                                  ;  856  5450 prs
 12007                                  ;  857  5454 prs
 12008                                  ;  858  5458 prs
 12009                                  ;  859  5462 prs
 12010                                  ;  860  5466 prs
 12011                                  ;  861  5470 prs
 12012                                  ;  862  5474 prs
 12013                                  ;  863  5478 prs
 12014                                  ;  864  5482 prs
 12015                                  ;  865  5486 printint51
 12016                                  ;  866  5497 printint51
 12017                                  ;  867  5508 prs
 12018                                  ;  868  5512 prs
 12019                                  ;  869  5516 prc
 12020                                  ;  870  5520 adrofname
 12021                                  ;  871  5530 prs
 12022                                  ;  872  5534 prc
 12023                                  ;  873  5538 prunsign1
 12024                                  ;  874  5548 prc
 12025                                  ;  875  5552 prunsign1
 12026                                  ;  876  5562 prc
 12027                                  ;  877  5566 prs
 12028                                  ;  878  5570 prc
 12029                                  ;  879  5574 pint1
 12030                                  ;  880  5580 prs
 12031                                  ;  881  5584 calllisting
 12032                                  ;  882  5596 prs
 12033                                  ;  883  5600 printint51
 12034                                  ;  884  5611 prc
 12035                                  ;  885  5615 prs
 12036                                  ;  886  5619 printint51
 12037                                  ;  887  5630 prc
 12038                                  ;  888  5634 from_far
 12039                                  ;  889  5643 prs
 12040                                  ;  890  5647 adrF
 12041                                  ;  891  5652 from_far
 12042                                  ;  892  5661 eqstr
 12043                                  ;  893  5667 prs
 12044                                  ;  894  5671 countcalls
 12045                                  ;  895  5682 funclisting
 12046                                  ;  896  5694 prs
 12047                                  ;  897  5698 printint51
 12048                                  ;  898  5709 printint51
 12049                                  ;  899  5720 prs
 12050                                  ;  900  5724 printint51
 12051                                  ;  901  5735 prc
 12052                                  ;  902  5739 prs
 12053                                  ;  903  5743 prs
 12054                                  ;  904  5747 prs
 12055                                  ;  905  5751 prs
 12056                                  ;  906  5755 prc
 12057                                  ;  907  5759 prc
 12058                                  ;  908  5763 adrF
 12059                                  ;  909  5768 prs
 12060                                  ;  910  5772 strcpy
 12061                                  ;  911  5779 storefunc
 12062                                  ;  912  5789 prs
 12063                                  ;  913  5793 prs
 12064                                  ;  914  5797 listvar
 12065                                  ;  915  5805 listfunc
 12066                                  ;  916  5814 listcall
 12067                                  ;  917  5823 prs
 12068                                  ;  918  5827 prs
 12069                                  ;  919  5831 prs
 12070                                  ;  920  5835 prs
 12071                                  ;  921  5839 prs
 12072                                  ;  922  5843 printint51
 12073                                  ;  923  5854 prs
 12074                                  ;  924  5858 printint51
 12075                                  ;  925  5869 prs
 12076                                  ;  926  5873 printint51
 12077                                  ;  927  5884 prs
 12078                                  ;  928  5888 printint51
 12079                                  ;  929  5899 prs
 12080                                  ;  930  5903 printint51
 12081                                  ;  931  5914 prs
 12082                                  ;  932  5918 printint51
 12083                                  ;  933  5929 prs
 12084                                  ;  934  5933 printint51
 12085                                  ;  935  5944 prs
 12086                                  ;  936  5948 printint51
 12087                                  ;  937  5959 prs
 12088                                  ;  938  5963 printint51
 12089                                  ;  939  5974 prs
 12090                                  ;  940  5978 printint51
 12091                                  ;  941  5989 prs
 12092                                  ;  942  5993 printint51
 12093                                  ;  943  6004 prs
 12094                                  ;  944  6008 printint51
 12095                                  ;  945  6019 prs
 12096                                  ;  946  6023 prs
 12097                                  ;  947  6027 prunsign1
 12098                                  ;  948  6037 prs
 12099                                  ;  949  6041 printint51
 12100                                  ;  950  6052 prs
 12101                                  ;  951  6056 prs
 12102                                  ;  952  6060 prs
 12103                                  ;  953  6064 prs
 12104                                  ;  954  6068 printint51
 12105                                  ;  955  6079 prs
 12106                                  ;  956  6083 printint51
 12107                                  ;  957  6094 prs
 12108                                  ;  958  6098 printint51
 12109                                  ;  959  6109 prs
 12110                                  ;  960  6113 end1
 12111                                  ;  961  6118 DosInt
 12112                                  ;  962  6125 DosInt
 12113                                  ;Input: A.C, List: A.S,  Lines: 1016
 12114                                  ;Glob. variables:  129 max.:  200
 12115                                  ;Functions      :  108 max.:  300
 12116                                  ;Calls          :  963 max.: 2000, NameField: 6132 max.:    65535
 12117                                  ;Code until     :21661 max.: 30000, free: 8339
 12118                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12119                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
