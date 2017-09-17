     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9D92F                  jmp main
     5                                  
     6                                  ;-1 //  .ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13
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
   205                                  ;-54 char thechar=0;    int iscmp=0;      int nconst=0;
   206                                  
   207 00000021 00                      thechar db 0
   208 00000022 0000                    iscmp dw 0
   209 00000024 0000                    nconst dw 0
   210                                  
   211                                  ;-55 int nreturn=0;     int nlabel=0;    
   212                                  
   213 00000026 0000                    nreturn dw 0
   214 00000028 0000                    nlabel dw 0
   215                                  
   216                                  ;-56 int GTop=1;        int LTop=150;
   217                                  
   218 0000002A 0100                    GTop dw 1
   219 0000002C 9600                    LTop dw 150
   220                                  
   221                                  ;-57 unsigned int lexval=0;
   222                                  
   223 0000002E 0000                    lexval dw 0
   224                                  
   225                                  ;-58 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   226                                  
   227 00000030 0000                    typei dw 0
   228 00000032 00                      istype db 0
   229                                  section .bss
   230                                  absolute 33463
   231 000082B7 <res 0000012C>          GType resb 300
   232                                  section .text
   233                                  
   234                                  ;-59 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   235                                  
   236 00000033 0000                    signi dw 0
   237 00000035 00                      issign db 0
   238                                  section .bss
   239                                  absolute 33763
   240 000083E3 <res 0000012C>          GSign resb 300
   241                                  section .text
   242                                  
   243                                  ;-60 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   244                                  
   245 00000036 0000                    widthi dw 0
   246 00000038 00                      iswidth db 0
   247                                  section .bss
   248                                  absolute 34063
   249 0000850F <res 0000012C>          GWidth resb 300
   250                                  section .text
   251                                  
   252                                  ;-61              int GAdr[VARMAX]; int  GUsed [VARMAX];
   253                                  
   254                                  section .bss
   255                                  absolute 34363
   256 0000863B <res 00000258>          GAdr resw 300
   257                                  section .text
   258                                  section .bss
   259                                  absolute 34963
   260 00008893 <res 00000258>          GUsed resw 300
   261                                  section .text
   262                                  
   263                                  ;-62 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   264                                  
   265 00000039 0000                    wi dw 0
   266                                  section .bss
   267                                  absolute 35563
   268 00008AEB <res 00000258>          GData resw 300
   269                                  section .text
   270                                  section .bss
   271                                  absolute 36163
   272 00008D43 <res 000012C0>          GNameField resb 4800
   273                                  section .text
   274                                  
   275                                  ;-63 int  FTop=0;                 int  CTop=0;
   276                                  
   277 0000003B 0000                    FTop dw 0
   278 0000003D 0000                    CTop dw 0
   279                                  
   280                                  ;-64 char FType [FUNCMAX];        char CType[CALLMAX];
   281                                  
   282                                  section .bss
   283                                  absolute 40963
   284 0000A003 <res 0000012C>          FType resb 300
   285                                  section .text
   286                                  section .bss
   287                                  absolute 41263
   288 0000A12F <res 000007D0>          CType resb 2000
   289                                  section .text
   290                                  
   291                                  ;-65 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   292                                  
   293                                  section .bss
   294                                  absolute 43263
   295 0000A8FF <res 00000258>          FAdr resw 300
   296                                  section .text
   297                                  section .bss
   298                                  absolute 43863
   299 0000AB57 <res 00000FA0>          CAdr resw 2000
   300                                  section .text
   301                                  
   302                                  ;-66 int  FCalls[FUNCMAX];
   303                                  
   304                                  section .bss
   305                                  absolute 47863
   306 0000BAF7 <res 00000258>          FCalls resw 300
   307                                  section .text
   308                                  
   309                                  ;-67 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   310                                  
   311                                  section .bss
   312                                  absolute 48463
   313 0000BD4F <res 000012C0>          FNameField resb 4800
   314                                  section .text
   315                                  
   316                                  ;-68 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   317                                  
   318 0000003F 313233343536373839-     NameA db "12345678901234567890123456789012",0
   319 00000048 303132333435363738-
   320 00000051 393031323334353637-
   321 0000005A 383930313200       
   322                                  
   323                                  ;-69 char fgetsdest[128];         unsigned char *CNameTop=0;
   324                                  
   325                                  section .bss
   326                                  absolute 53263
   327 0000D00F <res 00000080>          fgetsdest resb 128
   328                                  section .text
   329 00000060 0000                    CNameTop dw 0
   330                                  
   331                                  ;-70 unsigned char *fgetsp=0;     unsigned int segE;
   332                                  
   333 00000062 0000                    fgetsp dw 0
   334 00000064 0000                    segE dw 0
   335                                  
   336                                  ;-71 unsigned int lineno=1;       unsigned int linenoinclude=1;
   337                                  
   338 00000066 0100                    lineno dw 1
   339 00000068 0100                    linenoinclude dw 1
   340                                  
   341                                  ;-72 unsigned char *pt=0;         unsigned char *p1=0;
   342                                  
   343 0000006A 0000                    pt dw 0
   344 0000006C 0000                    p1 dw 0
   345                                  
   346                                  ;-73 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   347                                  
   348 0000006E 0000                    DOS_ERR dw 0
   349 00000070 0000                    DOS_NoBytes dw 0
   350 00000072 00                      DOS_ByteRead db 0
   351                                  
   352                                  ;-74 
   353                                  
   354                                  
   355                                  ;-75 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 
   356                                  
   357                                  
   358                                  writetty: PROC
   359 00000073 B40E                     mov  ah, 14
   360 00000075 BB0000                   mov  bx, 0
   361 00000078 CD10                     db 205,16
   362                                  
   363                                  ;-76 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
   364                                  
   365 0000007A C3                       ret
   366                                  ENDP
   367                                  
   368                                  putch: PROC
   369                                  ;Function : putch, Number of local variables: 1
   370                                  ;   # type sign width addr used name   list of local variables
   371                                  ;  200 var sign byte    76 NULL c = bp+4;
   372 0000007B C8000000                 ENTER  0,0 ; constant expression
   373 0000007F 807E040A                cmp byte[bp+4], 10
   374 00000083 0F850500                 jne .putch1
   375 00000087 B00D                     mov  al, 13
   376 00000089 E8E7FF                   call writetty
   377                                  .putch1:
   378 0000008C 8A4604                   mov  al, [bp+4]
   379 0000008F E8E1FF                   call writetty
   380                                  
   381                                  ;-77 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   382 00000092 C9                       LEAVE
   383 00000093 C3                       ret
   384                                  ENDP
   385                                  
   386                                  cputs: PROC
   387                                  ;Function : cputs, Number of local variables: 2
   388                                  ;   # type sign width addr used name   list of local variables
   389                                  ;  200 ptr sign byte    77 NULL s = bp+4
   390                                  ;  201 var sign byte    77 NULL c = bp-2;
   391 00000094 C8020000                 ENTER  2,0
   392                                  .cputs2:
   393 00000098 8B5E04                   mov bx, [bp+4]
   394 0000009B 8A07                     mov al, [bx]
   395 0000009D B400                     mov ah, 0
   396 0000009F 08C0                     or  al, al
   397 000000A1 0F841B00                 je .cputs3
   398 000000A5 8B5E04                   mov bx, [bp+4]
   399 000000A8 8A07                     mov al, [bx]
   400 000000AA B400                     mov ah, 0
   401 000000AC 8846FE                   mov [bp-2], al
   402 000000AF 8A46FE                   mov al, byte [bp-2]
   403 000000B2 B400                     mov ah, 0
   404 000000B4 50                       push ax
   405 000000B5 E8C3FF                   call putch
   406 000000B8 83C402                   add  sp, 2
   407 000000BB FF4604                   inc  word[bp+4]
   408 000000BE EBD8                     jmp .cputs2
   409                                  .cputs3:
   410                                  
   411                                  ;-78 int mkneg(int n)   { n; __asm {neg ax} }
   412 000000C0 C9                       LEAVE
   413 000000C1 C3                       ret
   414                                  ENDP
   415                                  
   416                                  mkneg: PROC
   417                                  ;Function : mkneg, Number of local variables: 1
   418                                  ;   # type sign width addr used name   list of local variables
   419                                  ;  200 var sign word    78 NULL n = bp+4;
   420 000000C2 C8000000                 ENTER  0,0
   421 000000C6 8B4604                   mov ax, [bp+4]
   422 000000C9 F7D8                    neg ax
   423                                  
   424                                  ;-79 
   425                                  
   426                                  
   427                                  ;-80 int DosInt() { 
   428 000000CB C9                       LEAVE
   429 000000CC C3                       ret
   430                                  ENDP
   431                                  
   432                                  DosInt: PROC
   433                                  
   434                                  ;-81     __emit__(0xCD,0x21);//inth 0x21; 
   435                                  
   436 000000CD CD21                     db 205,33
   437                                  
   438                                  ;-82     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   439                                  
   440 000000CF 7304                     db 115,4
   441                                  
   442                                  ;-83     DOS_ERR++;
   443                                  
   444 000000D1 FF06[6E00]               inc  word[DOS_ERR]
   445                                  
   446                                  ;-84 }
   447                                  
   448                                  
   449                                  ;-85 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   450                                  
   451 000000D5 C3                       ret
   452                                  ENDP
   453                                  
   454                                  openR: PROC
   455                                  ;Function : openR, Number of local variables: 1
   456                                  ;   # type sign width addr used name   list of local variables
   457                                  ;  200 ptr sign byte    85 NULL s = bp+4;
   458 000000D6 C8000000                 ENTER  0,0
   459 000000DA 8B5604                   mov  dx, [bp+4]
   460 000000DD B8023D                   mov  ax, 15618
   461 000000E0 E8EAFF                   call DosInt
   462                                  
   463                                  ;-86 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   464 000000E3 C9                       LEAVE
   465 000000E4 C3                       ret
   466                                  ENDP
   467                                  
   468                                  creatR: PROC
   469                                  ;Function : creatR, Number of local variables: 1
   470                                  ;   # type sign width addr used name   list of local variables
   471                                  ;  200 ptr sign byte    86 NULL s = bp+4;
   472 000000E5 C8000000                 ENTER  0,0
   473 000000E9 8B5604                   mov  dx, [bp+4]
   474 000000EC B90000                   mov  cx, 0
   475 000000EF B8003C                   mov  ax, 15360
   476 000000F2 E8D8FF                   call DosInt
   477                                  
   478                                  ;-87 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   479 000000F5 C9                       LEAVE
   480 000000F6 C3                       ret
   481                                  ENDP
   482                                  
   483                                  fcloseR: PROC
   484                                  ;Function : fcloseR, Number of local variables: 1
   485                                  ;   # type sign width addr used name   list of local variables
   486                                  ;  200 var sign word    87 NULL fd = bp+4;
   487 000000F7 C8000000                 ENTER  0,0
   488 000000FB 8B5E04                   mov  bx, [bp+4]
   489 000000FE B8003E                   mov  ax, 15872
   490 00000101 E8C9FF                   call DosInt
   491                                  
   492                                  ;-88 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   493 00000104 C9                       LEAVE
   494 00000105 C3                       ret
   495                                  ENDP
   496                                  
   497                                  exitR: PROC
   498                                  ;Function : exitR, Number of local variables: 1
   499                                  ;   # type sign width addr used name   list of local variables
   500                                  ;  200 var sign byte    88 NULL c = bp+4;
   501 00000106 C8000000                 ENTER  0,0
   502 0000010A B44C                     mov  ah, 76
   503 0000010C 8A4604                   mov  al, [bp+4]
   504 0000010F E8BBFF                   call DosInt
   505                                  
   506                                  ;-89 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   507 00000112 C9                       LEAVE
   508 00000113 C3                       ret
   509                                  ENDP
   510                                  
   511                                  readRL: PROC
   512                                  ;Function : readRL, Number of local variables: 3
   513                                  ;   # type sign width addr used name   list of local variables
   514                                  ;  200 ptr sign byte    89 NULL s = bp+4
   515                                  ;  201 var sign word    89 NULL fd = bp+6
   516                                  ;  202 var sign word    89 NULL len = bp+8;
   517 00000114 C8000000                 ENTER  0,0
   518 00000118 8B5604                   mov  dx, [bp+4]
   519 0000011B 8B4E08                   mov  cx, [bp+8]
   520 0000011E 8B5E06                   mov  bx, [bp+6]
   521 00000121 B8003F                   mov  ax, 16128
   522 00000124 E8A6FF                   call DosInt
   523                                  
   524                                  ;-90 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   525 00000127 C9                       LEAVE
   526 00000128 C3                       ret
   527                                  ENDP
   528                                  
   529                                  fputcR: PROC
   530                                  ;Function : fputcR, Number of local variables: 2
   531                                  ;   # type sign width addr used name   list of local variables
   532                                  ;  200 ptr sign byte    90 NULL n = bp+4
   533                                  ;  201 var sign word    90 NULL fd = bp+6;
   534 00000129 C8000000                 ENTER  0,0
   535 0000012D 8D5604                  lea dx, [bp+4]
   536                                  
   537                                  ;-91   cx=1; bx=fd; ax=0x4000; DosInt(); }
   538                                  
   539 00000130 B90100                   mov  cx, 1
   540 00000133 8B5E06                   mov  bx, [bp+6]
   541 00000136 B80040                   mov  ax, 16384
   542 00000139 E891FF                   call DosInt
   543                                  
   544                                  ;-92 
   545                                  
   546                                  
   547                                  ;-93 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   548 0000013C C9                       LEAVE
   549 0000013D C3                       ret
   550                                  ENDP
   551                                  
   552                                  strlen: PROC
   553                                  ;Function : strlen, Number of local variables: 2
   554                                  ;   # type sign width addr used name   list of local variables
   555                                  ;  200 ptr sign byte    93 NULL s = bp+4
   556                                  ;  201 var sign word    93 NULL c = bp-2;
   557 0000013E C8020000                 ENTER  2,0
   558 00000142 B80000                   mov ax, 0
   559 00000145 8946FE                   mov [bp-2], ax
   560                                  .strlen4:
   561 00000148 8B5E04                   mov bx, [bp+4]
   562 0000014B 8A07                     mov al, [bx]
   563 0000014D B400                     mov ah, 0
   564 0000014F 83F800                   cmp ax, 0
   565 00000152 0F840800                 je  .strlen5
   566 00000156 FF4604                   inc  word[bp+4]
   567 00000159 FF46FE                   inc  word[bp-2]
   568 0000015C EBEA                     jmp .strlen4
   569                                  .strlen5:
   570 0000015E 8B46FE                   mov ax, [bp-2]
   571 00000161 E90000                   jmp .retnstrlen
   572                                  
   573                                  ;-94 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   574                                  
   575 00000164 C9                       .retnstrlen: LEAVE
   576 00000165 C3                       ret
   577                                  ENDP
   578                                  
   579                                  strcpy: PROC
   580                                  ;Function : strcpy, Number of local variables: 2
   581                                  ;   # type sign width addr used name   list of local variables
   582                                  ;  200 ptr sign byte    94 NULL s = bp+4
   583                                  ;  201 ptr sign byte    94 NULL t = bp+6;
   584 00000166 C8000000                 ENTER  0,0
   585                                  .strcpy6:
   586 0000016A 8B5E06                   mov bx, [bp+6]
   587 0000016D 8A07                     mov al, [bx]
   588 0000016F B400                     mov ah, 0
   589 00000171 8B5E04                   mov  bx, [bp+4]
   590 00000174 8807                     mov  [bx], al
   591 00000176 FF4604                   inc  word[bp+4]
   592 00000179 FF4606                   inc  word[bp+6]
   593 0000017C 8B5E06                   mov bx, [bp+6]
   594 0000017F 8A07                     mov al, [bx]
   595 00000181 B400                     mov ah, 0
   596 00000183 83F800                   cmp ax, 0
   597 00000186 0F840200                 je  .strcpy7
   598 0000018A EBDE                     jmp .strcpy6
   599                                  .strcpy7:
   600 0000018C B80000                   mov ax, 0
   601 0000018F 8B5E04                   mov  bx, [bp+4]
   602 00000192 8807                     mov  [bx], al
   603                                  
   604                                  ;-95 int eqstr(char *p, char *q) { while(*p) {
   605 00000194 C9                       LEAVE
   606 00000195 C3                       ret
   607                                  ENDP
   608                                  
   609                                  eqstr: PROC
   610                                  ;Function : eqstr, Number of local variables: 2
   611                                  ;   # type sign width addr used name   list of local variables
   612                                  ;  200 ptr sign byte    95 NULL p = bp+4
   613                                  ;  201 ptr sign byte    95 NULL q = bp+6;
   614 00000196 C8000000                 ENTER  0,0
   615                                  .eqstr8:
   616 0000019A 8B5E04                   mov bx, [bp+4]
   617 0000019D 8A07                     mov al, [bx]
   618 0000019F B400                     mov ah, 0
   619 000001A1 08C0                     or  al, al
   620 000001A3 0F842000                 je .eqstr9
   621                                  
   622                                  ;-96     if (*p != *q) return 0; p++; q++; }
   623                                  
   624 000001A7 8B5E04                   mov bx, [bp+4]
   625 000001AA 8A07                     mov al, [bx]
   626 000001AC B400                     mov ah, 0
   627 000001AE 8B5E06                   mov bx, [bp+6]
   628 000001B1 3A07                     cmp al, [bx]
   629 000001B3 B400                     mov ah, 0
   630 000001B5 0F840600                 je  .eqstr10
   631 000001B9 B80000                   mov ax, 0
   632 000001BC E92100                   jmp .retneqstr
   633                                  .eqstr10:
   634 000001BF FF4604                   inc  word[bp+4]
   635 000001C2 FF4606                   inc  word[bp+6]
   636                                  
   637                                  ;-97     if(*q) return 0; return 1; }
   638                                  
   639 000001C5 EBD3                     jmp .eqstr8
   640                                  .eqstr9:
   641 000001C7 8B5E06                   mov bx, [bp+6]
   642 000001CA 8A07                     mov al, [bx]
   643 000001CC B400                     mov ah, 0
   644 000001CE 08C0                     or  al, al
   645 000001D0 0F840600                 je .eqstr11
   646 000001D4 B80000                   mov ax, 0
   647 000001D7 E90600                   jmp .retneqstr
   648                                  .eqstr11:
   649 000001DA B80100                   mov ax, 1
   650 000001DD E90000                   jmp .retneqstr
   651                                  
   652                                  ;-98 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   653                                  
   654 000001E0 C9                       .retneqstr: LEAVE
   655 000001E1 C3                       ret
   656                                  ENDP
   657                                  
   658                                  instr1: PROC
   659                                  ;Function : instr1, Number of local variables: 2
   660                                  ;   # type sign width addr used name   list of local variables
   661                                  ;  200 ptr sign byte    98 NULL s = bp+4
   662                                  ;  201 var sign byte    98 NULL c = bp+6;
   663 000001E2 C8000000                 ENTER  0,0
   664                                  .instr112:
   665 000001E6 8B5E04                   mov bx, [bp+4]
   666 000001E9 8A07                     mov al, [bx]
   667 000001EB B400                     mov ah, 0
   668 000001ED 08C0                     or  al, al
   669 000001EF 0F841900                 je .instr113
   670 000001F3 8B5E04                   mov bx, [bp+4]
   671 000001F6 8A07                     mov al, [bx]
   672 000001F8 B400                     mov ah, 0
   673 000001FA 3A4606                   cmp al, [bp+6]
   674 000001FD 0F850600                 jne .instr114
   675 00000201 B80100                   mov ax, 1
   676 00000204 E90B00                   jmp .retninstr1
   677                                  .instr114:
   678 00000207 FF4604                   inc  word[bp+4]
   679 0000020A EBDA                     jmp .instr112
   680                                  .instr113:
   681 0000020C B80000                   mov ax, 0
   682 0000020F E90000                   jmp .retninstr1
   683                                  
   684                                  ;-99 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   685                                  
   686 00000212 C9                       .retninstr1: LEAVE
   687 00000213 C3                       ret
   688                                  ENDP
   689                                  
   690                                  strcat1: PROC
   691                                  ;Function : strcat1, Number of local variables: 2
   692                                  ;   # type sign width addr used name   list of local variables
   693                                  ;  200 ptr sign byte    99 NULL s = bp+4
   694                                  ;  201 ptr sign byte    99 NULL t = bp+6;
   695 00000214 C8000000                 ENTER  0,0
   696                                  .strcat115:
   697 00000218 8B5E04                   mov bx, [bp+4]
   698 0000021B 8A07                     mov al, [bx]
   699 0000021D B400                     mov ah, 0
   700 0000021F 83F800                   cmp ax, 0
   701 00000222 0F840500                 je  .strcat116
   702 00000226 FF4604                   inc  word[bp+4]
   703 00000229 EBED                     jmp .strcat115
   704                                  .strcat116:
   705 0000022B FF7606                   push word [bp+6]
   706 0000022E FF7604                   push word [bp+4]
   707 00000231 E832FF                   call strcpy
   708 00000234 83C404                   add  sp, 4
   709                                  
   710                                  ;-100 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   711 00000237 C9                       LEAVE
   712 00000238 C3                       ret
   713                                  ENDP
   714                                  
   715                                  toupper: PROC
   716                                  ;Function : toupper, Number of local variables: 1
   717                                  ;   # type sign width addr used name   list of local variables
   718                                  ;  200 ptr sign byte   100 NULL s = bp+4;
   719 00000239 C8000000                 ENTER  0,0
   720                                  .toupper17:
   721 0000023D 8B5E04                   mov bx, [bp+4]
   722 00000240 8A07                     mov al, [bx]
   723 00000242 B400                     mov ah, 0
   724 00000244 08C0                     or  al, al
   725 00000246 0F843000                 je .toupper18
   726 0000024A 8B5E04                   mov bx, [bp+4]
   727 0000024D 8A07                     mov al, [bx]
   728 0000024F B400                     mov ah, 0
   729 00000251 83F861                   cmp ax, 97 ;unsigned : 1
   730 00000254 0F8C1D00                 jl  .toupper19
   731 00000258 8B5E04                   mov bx, [bp+4]
   732 0000025B 8A07                     mov al, [bx]
   733 0000025D B400                     mov ah, 0
   734 0000025F 83F87A                   cmp ax, 122
   735 00000262 0F8F0F00                 jg  .toupper20
   736 00000266 8B5E04                   mov bx, [bp+4]
   737 00000269 8A07                     mov al, [bx]
   738 0000026B B400                     mov ah, 0
   739 0000026D 83E820                   sub ax, 32
   740 00000270 8B5E04                   mov  bx, [bp+4]
   741 00000273 8807                     mov  [bx], al
   742                                  .toupper20:
   743                                  .toupper19:
   744 00000275 FF4604                   inc  word[bp+4]
   745 00000278 EBC3                     jmp .toupper17
   746                                  .toupper18:
   747                                  
   748                                  ;-101 
   749                                  
   750                                  
   751                                  ;-102 int digit(char c){ 
   752 0000027A C9                       LEAVE
   753 0000027B C3                       ret
   754                                  ENDP
   755                                  
   756                                  digit: PROC
   757                                  
   758                                  ;-103     if(c<'0') return 0; 
   759                                  
   760                                  ;Function : digit, Number of local variables: 1
   761                                  ;   # type sign width addr used name   list of local variables
   762                                  ;  200 var sign byte   102 NULL c = bp+4;
   763 0000027C C8000000                 ENTER  0,0
   764 00000280 8A4604                   mov al, [bp+4]
   765 00000283 3C30                     cmp al, 48
   766 00000285 0F8D0600                 jge .digit21
   767 00000289 B80000                   mov ax, 0
   768 0000028C E91500                   jmp .retndigit
   769                                  
   770                                  ;-104     if(c>'9') return 0; 
   771                                  
   772                                  .digit21:
   773 0000028F 8A4604                   mov al, [bp+4]
   774 00000292 3C39                     cmp al, 57
   775 00000294 0F8E0600                 jle .digit22
   776 00000298 B80000                   mov ax, 0
   777 0000029B E90600                   jmp .retndigit
   778                                  
   779                                  ;-105     return 1; 
   780                                  
   781                                  .digit22:
   782 0000029E B80100                   mov ax, 1
   783 000002A1 E90000                   jmp .retndigit
   784                                  
   785                                  ;-106 }
   786                                  
   787                                  
   788                                  ;-107 int letter(char c) { 
   789                                  
   790 000002A4 C9                       .retndigit: LEAVE
   791 000002A5 C3                       ret
   792                                  ENDP
   793                                  
   794                                  letter: PROC
   795                                  
   796                                  ;-108     if (c=='_') return 1;
   797                                  
   798                                  ;Function : letter, Number of local variables: 1
   799                                  ;   # type sign width addr used name   list of local variables
   800                                  ;  200 var sign byte   107 NULL c = bp+4;
   801 000002A6 C8000000                 ENTER  0,0
   802 000002AA 8A4604                   mov al, [bp+4]
   803 000002AD 3C5F                     cmp al, 95
   804 000002AF 0F850600                 jne .letter23
   805 000002B3 B80100                   mov ax, 1
   806 000002B6 E96900                   jmp .retnletter
   807                                  
   808                                  ;-109     if (c=='.') return 1;
   809                                  
   810                                  .letter23:
   811 000002B9 8A4604                   mov al, [bp+4]
   812 000002BC 3C2E                     cmp al, 46
   813 000002BE 0F850600                 jne .letter24
   814 000002C2 B80100                   mov ax, 1
   815 000002C5 E95A00                   jmp .retnletter
   816                                  
   817                                  ;-110     if (c=='?') return 1;
   818                                  
   819                                  .letter24:
   820 000002C8 8A4604                   mov al, [bp+4]
   821 000002CB 3C3F                     cmp al, 63
   822 000002CD 0F850600                 jne .letter25
   823 000002D1 B80100                   mov ax, 1
   824 000002D4 E94B00                   jmp .retnletter
   825                                  
   826                                  ;-111     if (c=='$') return 1;
   827                                  
   828                                  .letter25:
   829 000002D7 8A4604                   mov al, [bp+4]
   830 000002DA 3C24                     cmp al, 36
   831 000002DC 0F850600                 jne .letter26
   832 000002E0 B80100                   mov ax, 1
   833 000002E3 E93C00                   jmp .retnletter
   834                                  
   835                                  ;-112     if (c> 'z') return 0; 
   836                                  
   837                                  .letter26:
   838 000002E6 8A4604                   mov al, [bp+4]
   839 000002E9 3C7A                     cmp al, 122
   840 000002EB 0F8E0600                 jle .letter27
   841 000002EF B80000                   mov ax, 0
   842 000002F2 E92D00                   jmp .retnletter
   843                                  
   844                                  ;-113     if (c< '@') return 0;// at included
   845                                  
   846                                  .letter27:
   847 000002F5 8A4604                   mov al, [bp+4]
   848 000002F8 3C40                     cmp al, 64
   849 000002FA 0F8D0600                 jge .letter28
   850 000002FE B80000                   mov ax, 0
   851 00000301 E91E00                   jmp .retnletter
   852                                  
   853                                  ;-114     if (c> 'Z') { if (c< 'a') return 0; }  
   854                                  
   855                                  .letter28:
   856 00000304 8A4604                   mov al, [bp+4]
   857 00000307 3C5A                     cmp al, 90
   858 00000309 0F8E0F00                 jle .letter29
   859 0000030D 8A4604                   mov al, [bp+4]
   860 00000310 3C61                     cmp al, 97
   861 00000312 0F8D0600                 jge .letter30
   862 00000316 B80000                   mov ax, 0
   863 00000319 E90600                   jmp .retnletter
   864                                  .letter30:
   865                                  
   866                                  ;-115     return 1; 
   867                                  
   868                                  .letter29:
   869 0000031C B80100                   mov ax, 1
   870 0000031F E90000                   jmp .retnletter
   871                                  
   872                                  ;-116 }    
   873                                  
   874                                  
   875                                  ;-117 int alnum(char c) {
   876                                  
   877 00000322 C9                       .retnletter: LEAVE
   878 00000323 C3                       ret
   879                                  ENDP
   880                                  
   881                                  alnum: PROC
   882                                  
   883                                  ;-118   if (digit (c)) return 1;
   884                                  
   885                                  ;Function : alnum, Number of local variables: 1
   886                                  ;   # type sign width addr used name   list of local variables
   887                                  ;  200 var sign byte   117 NULL c = bp+4;
   888 00000324 C8000000                 ENTER  0,0
   889 00000328 8A4604                   mov al, byte [bp+4]
   890 0000032B B400                     mov ah, 0
   891 0000032D 50                       push ax
   892 0000032E E84BFF                   call digit
   893 00000331 83C402                   add  sp, 2
   894 00000334 08C0                     or  al, al
   895 00000336 0F840600                 je .alnum31
   896 0000033A B80100                   mov ax, 1
   897 0000033D E91E00                   jmp .retnalnum
   898                                  
   899                                  ;-119   if (letter(c)) return 1;
   900                                  
   901                                  .alnum31:
   902 00000340 8A4604                   mov al, byte [bp+4]
   903 00000343 B400                     mov ah, 0
   904 00000345 50                       push ax
   905 00000346 E85DFF                   call letter
   906 00000349 83C402                   add  sp, 2
   907 0000034C 08C0                     or  al, al
   908 0000034E 0F840600                 je .alnum32
   909 00000352 B80100                   mov ax, 1
   910 00000355 E90600                   jmp .retnalnum
   911                                  
   912                                  ;-120   return 0;
   913                                  
   914                                  .alnum32:
   915 00000358 B80000                   mov ax, 0
   916 0000035B E90000                   jmp .retnalnum
   917                                  
   918                                  ;-121 }       
   919                                  
   920                                  
   921                                  ;-122 int a(unsigned int i) {  printName(i);}//address
   922                                  
   923 0000035E C9                       .retnalnum: LEAVE
   924 0000035F C3                       ret
   925                                  ENDP
   926                                  
   927                                  a: PROC
   928                                  ;Function : a, Number of local variables: 1
   929                                  ;   # type sign width addr used name   list of local variables
   930                                  ;  200 var unsg word   122 NULL i = bp+4;
   931 00000360 C8000000                 ENTER  0,0
   932 00000364 FF7604                   push word [bp+4]
   933 00000367 E88D05                   call printName
   934 0000036A 83C402                   add  sp, 2
   935                                  
   936                                  ;-123 int v(unsigned int i) {//value 
   937 0000036D C9                       LEAVE
   938 0000036E C3                       ret
   939                                  ENDP
   940                                  
   941                                  v: PROC
   942                                  
   943                                  ;-124     if (i < LSTART) prc('['); 
   944                                  
   945                                  ;Function : v, Number of local variables: 1
   946                                  ;   # type sign width addr used name   list of local variables
   947                                  ;  200 var unsg word   123 NULL i = bp+4;
   948 0000036F C8000000                 ENTER  0,0
   949 00000373 8B4604                   mov ax, [bp+4]
   950 00000376 3DC800                   cmp ax, 200
   951 00000379 0F8D0800                 jge .v33
   952 0000037D 6A5B                     push 91
   953 0000037F E8F340                   call prc
   954 00000382 83C402                   add  sp, 2
   955                                  
   956                                  ;-125     printName(i);
   957                                  
   958                                  .v33:
   959 00000385 FF7604                   push word [bp+4]
   960 00000388 E86C05                   call printName
   961 0000038B 83C402                   add  sp, 2
   962                                  
   963                                  ;-126     if (i < LSTART) prc(']');   
   964                                  
   965 0000038E 8B4604                   mov ax, [bp+4]
   966 00000391 3DC800                   cmp ax, 200
   967 00000394 0F8D0800                 jge .v34
   968 00000398 6A5D                     push 93
   969 0000039A E8D840                   call prc
   970 0000039D 83C402                   add  sp, 2
   971                                  
   972                                  ;-127 }
   973                                  
   974                                  .v34:
   975                                  
   976                                  ;-128 int checknamelen() { int i;    i=strlen(symbol);
   977 000003A0 C9                       LEAVE
   978 000003A1 C3                       ret
   979                                  ENDP
   980                                  
   981                                  checknamelen: PROC
   982                                  ;Function : checknamelen, Number of local variables: 1
   983                                  ;   # type sign width addr used name   list of local variables
   984                                  ;  200 var sign word   128 NULL i = bp-2;
   985 000003A2 C8020000                 ENTER  2,0
   986 000003A6 8D062B81                 lea  ax, [symbol]
   987 000003AA 50                       push ax
   988 000003AB E890FD                   call strlen
   989 000003AE 83C402                   add  sp, 2
   990 000003B1 8946FE                   mov [bp-2], ax
   991                                  
   992                                  ;-129   if (i > IDLENMAX) error1("Item name is too long in characters)");
   993                                  
   994 000003B4 8B46FE                   mov ax, [bp-2]
   995 000003B7 83F80F                   cmp ax, 15
   996 000003BA 0F8E0900                 jle .checknamelen35
   997 000003BE 68[C903]                 push checknamelen_0
   998 000003C1 E8FE43                   call error1
   999 000003C4 83C402                   add  sp, 2
  1000                                  
  1001                                  ;-130 }
  1002                                  
  1003                                  .checknamelen35:
  1004                                  
  1005                                  ;-131 char doglobName[IDLENMAX];
  1006 000003C7 C9                       LEAVE
  1007 000003C8 C3                       ret
  1008 000003C9 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1009 000003D2 20697320746F6F206C-
  1010 000003DB 6F6E6720696E206368-
  1011 000003E4 617261637465727329-
  1012 000003ED 00                 
  1013                                  ENDP
  1014                                  section .bss
  1015                                  absolute 53391
  1016 0000D08F <res 0000000F>          doglobName resb 15
  1017                                  section .text
  1018                                  
  1019                                  ;-132 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1020                                  
  1021                                  
  1022                                  doglob: PROC
  1023                                  ;Function : doglob, Number of local variables: 3
  1024                                  ;   # type sign width addr used name   list of local variables
  1025                                  ;  200 var sign word   132 NULL i = bp-2
  1026                                  ;  201 var sign word   132 NULL j = bp-4
  1027                                  ;  202 var sign word   132 NULL isstrarr = bp-6;
  1028 000003EE C8060000                 ENTER  6,0
  1029 000003F2 B80000                   mov ax, 0
  1030 000003F5 8946FA                   mov [bp-6], ax
  1031                                  
  1032                                  ;-133   if (GTop >= LSTART) error1("Global table full");
  1033                                  
  1034 000003F8 A1[2A00]                 mov ax, [GTop]
  1035 000003FB 3DC800                   cmp ax, 200 ;unsigned : 1
  1036 000003FE 0F8C0900                 jl  .doglob36
  1037 00000402 68[4307]                 push doglob_0
  1038 00000405 E8BA43                   call error1
  1039 00000408 83C402                   add  sp, 2
  1040                                  
  1041                                  ;-134   if (iswidth == 0) error1("no VOID as var type");
  1042                                  
  1043                                  .doglob36:
  1044 0000040B A0[3800]                 mov al, [iswidth]
  1045 0000040E 3C00                     cmp al, 0
  1046 00000410 0F850900                 jne .doglob37
  1047 00000414 68[5507]                 push doglob_1
  1048 00000417 E8A843                   call error1
  1049 0000041A 83C402                   add  sp, 2
  1050                                  
  1051                                  ;-135   checknamelen();
  1052                                  
  1053                                  .doglob37:
  1054 0000041D E882FF                   call checknamelen
  1055                                  
  1056                                  ;-136   if (checkName() != 0) error1("Variable already defined");
  1057                                  
  1058 00000420 E88305                   call checkName
  1059 00000423 3C00                     cmp al, 0
  1060 00000425 0F840900                 je  .doglob38
  1061 00000429 68[6907]                 push doglob_2
  1062 0000042C E89343                   call error1
  1063 0000042F 83C402                   add  sp, 2
  1064                                  
  1065                                  ;-137   if (istoken('[')) { istype='&';
  1066                                  
  1067                                  .doglob38:
  1068 00000432 6A5B                     push 91
  1069 00000434 E8703F                   call istoken
  1070 00000437 83C402                   add  sp, 2
  1071 0000043A 08C0                     or  al, al
  1072 0000043C 0F84E201                 je .doglob39
  1073 00000440 B82600                   mov ax, 38
  1074 00000443 A2[3200]                 mov byte [istype], al
  1075                                  
  1076                                  ;-138     if (istoken(T_CONST)) {
  1077                                  
  1078 00000446 680101                   push 257
  1079 00000449 E85B3F                   call istoken
  1080 0000044C 83C402                   add  sp, 2
  1081 0000044F 08C0                     or  al, al
  1082 00000451 0F84C200                 je .doglob40
  1083                                  
  1084                                  ;-139       prs("\nsection .bss\nabsolute ");
  1085                                  
  1086 00000455 68[8207]                 push doglob_3
  1087 00000458 E88140                   call prs
  1088 0000045B 83C402                   add  sp, 2
  1089                                  
  1090                                  ;-140       prunsign1(orgData);
  1091                                  
  1092 0000045E FF36[1000]               push word [orgData]
  1093 00000462 E8CC41                   call prunsign1
  1094 00000465 83C402                   add  sp, 2
  1095                                  
  1096                                  ;-141       prs("\n"); prs(symbol); 
  1097                                  
  1098 00000468 68[9C07]                 push doglob_4
  1099 0000046B E86E40                   call prs
  1100 0000046E 83C402                   add  sp, 2
  1101 00000471 8D062B81                 lea  ax, [symbol]
  1102 00000475 50                       push ax
  1103 00000476 E86340                   call prs
  1104 00000479 83C402                   add  sp, 2
  1105                                  
  1106                                  ;-142       if (iswidth==1) prs(" resb "); 
  1107                                  
  1108 0000047C A0[3800]                 mov al, [iswidth]
  1109 0000047F 3C01                     cmp al, 1
  1110 00000481 0F850900                 jne .doglob41
  1111 00000485 68[9F07]                 push doglob_5
  1112 00000488 E85140                   call prs
  1113 0000048B 83C402                   add  sp, 2
  1114                                  
  1115                                  ;-143       if (iswidth==2) prs(" resw ");
  1116                                  
  1117                                  .doglob41:
  1118 0000048E A0[3800]                 mov al, [iswidth]
  1119 00000491 3C02                     cmp al, 2
  1120 00000493 0F850900                 jne .doglob42
  1121 00000497 68[A607]                 push doglob_6
  1122 0000049A E83F40                   call prs
  1123 0000049D 83C402                   add  sp, 2
  1124                                  
  1125                                  ;-144       if (iswidth==4) prs(" resd ");
  1126                                  
  1127                                  .doglob42:
  1128 000004A0 A0[3800]                 mov al, [iswidth]
  1129 000004A3 3C04                     cmp al, 4
  1130 000004A5 0F850900                 jne .doglob43
  1131 000004A9 68[AD07]                 push doglob_7
  1132 000004AC E82D40                   call prs
  1133 000004AF 83C402                   add  sp, 2
  1134                                  
  1135                                  ;-145       prunsign1(lexval); 
  1136                                  
  1137                                  .doglob43:
  1138 000004B2 FF36[2E00]               push word [lexval]
  1139 000004B6 E87841                   call prunsign1
  1140 000004B9 83C402                   add  sp, 2
  1141                                  
  1142                                  ;-146       prs("\nsection .text");
  1143                                  
  1144 000004BC 68[B407]                 push doglob_8
  1145 000004BF E81A40                   call prs
  1146 000004C2 83C402                   add  sp, 2
  1147                                  
  1148                                  ;-147       orgData=orgData+lexval;
  1149                                  
  1150 000004C5 A1[1000]                 mov ax, [orgData]
  1151 000004C8 0306[2E00]               add ax, [lexval]
  1152 000004CC A3[1000]                 mov word [orgData], ax
  1153                                  
  1154                                  ;-148       if (iswidth==2) orgData=orgData+lexval;
  1155                                  
  1156 000004CF A0[3800]                 mov al, [iswidth]
  1157 000004D2 3C02                     cmp al, 2
  1158 000004D4 0F850A00                 jne .doglob44
  1159 000004D8 A1[1000]                 mov ax, [orgData]
  1160 000004DB 0306[2E00]               add ax, [lexval]
  1161 000004DF A3[1000]                 mov word [orgData], ax
  1162                                  
  1163                                  ;-149       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1164                                  
  1165                                  .doglob44:
  1166 000004E2 A0[3800]                 mov al, [iswidth]
  1167 000004E5 3C04                     cmp al, 4
  1168 000004E7 0F851400                 jne .doglob45
  1169 000004EB A1[2E00]                 mov ax, [lexval]
  1170 000004EE BB0300                   mov bx, 3
  1171 000004F1 F7E3                     mul bx
  1172 000004F3 8946FE                   mov [bp-2], ax
  1173 000004F6 A1[1000]                 mov ax, [orgData]
  1174 000004F9 0346FE                   add ax, [bp-2]
  1175 000004FC A3[1000]                 mov word [orgData], ax
  1176                                  
  1177                                  ;-150       GData[GTop]=lexval; expect(']');
  1178                                  
  1179                                  .doglob45:
  1180 000004FF A1[2E00]                 mov ax, [lexval]
  1181 00000502 8B1E[2A00]               mov bx, [GTop]
  1182 00000506 D1E3                     shl bx, 1
  1183 00000508 8987EB8A                 mov [GData+bx], ax
  1184 0000050C 6A5D                     push 93
  1185 0000050E E8B83E                   call expect
  1186 00000511 83C402                   add  sp, 2
  1187                                  
  1188                                  ;-151     }else { expect(']');
  1189                                  
  1190 00000514 E90801                   jmp .doglob46
  1191                                  .doglob40:
  1192 00000517 6A5D                     push 93
  1193 00000519 E8AD3E                   call expect
  1194 0000051C 83C402                   add  sp, 2
  1195                                  
  1196                                  ;-152       if (iswidth != 1) error1("Only ByteArray allowed");
  1197                                  
  1198 0000051F A0[3800]                 mov al, [iswidth]
  1199 00000522 3C01                     cmp al, 1
  1200 00000524 0F840900                 je  .doglob47
  1201 00000528 68[C407]                 push doglob_9
  1202 0000052B E89442                   call error1
  1203 0000052E 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-153       prs("\n"); prs(symbol); prs(" db "); 
  1206                                  
  1207                                  .doglob47:
  1208 00000531 68[DB07]                 push doglob_10
  1209 00000534 E8A53F                   call prs
  1210 00000537 83C402                   add  sp, 2
  1211 0000053A 8D062B81                 lea  ax, [symbol]
  1212 0000053E 50                       push ax
  1213 0000053F E89A3F                   call prs
  1214 00000542 83C402                   add  sp, 2
  1215 00000545 68[DE07]                 push doglob_11
  1216 00000548 E8913F                   call prs
  1217 0000054B 83C402                   add  sp, 2
  1218                                  
  1219                                  ;-154       isstrarr=1; strcpy(doglobName, symbol);
  1220                                  
  1221 0000054E B80100                   mov ax, 1
  1222 00000551 8946FA                   mov [bp-6], ax
  1223 00000554 8D062B81                 lea  ax, [symbol]
  1224 00000558 50                       push ax
  1225 00000559 8D068FD0                 lea  ax, [doglobName]
  1226 0000055D 50                       push ax
  1227 0000055E E805FC                   call strcpy
  1228 00000561 83C404                   add  sp, 4
  1229                                  
  1230                                  ;-155       expect('='); 
  1231                                  
  1232 00000564 6A3D                     push 61
  1233 00000566 E8603E                   call expect
  1234 00000569 83C402                   add  sp, 2
  1235                                  
  1236                                  ;-156       if (istoken(T_STRING)) { 
  1237                                  
  1238 0000056C 680201                   push 258
  1239 0000056F E8353E                   call istoken
  1240 00000572 83C402                   add  sp, 2
  1241 00000575 08C0                     or  al, al
  1242 00000577 0F844200                 je .doglob48
  1243                                  
  1244                                  ;-157         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1245                                  
  1246 0000057B 6A22                     push 34
  1247 0000057D E8F53E                   call prc
  1248 00000580 83C402                   add  sp, 2
  1249 00000583 8D062B81                 lea  ax, [symbol]
  1250 00000587 50                       push ax
  1251 00000588 E8153F                   call prscomment
  1252 0000058B 83C402                   add  sp, 2
  1253 0000058E 6A22                     push 34
  1254 00000590 E8E23E                   call prc
  1255 00000593 83C402                   add  sp, 2
  1256 00000596 68[E307]                 push doglob_12
  1257 00000599 E8403F                   call prs
  1258 0000059C 83C402                   add  sp, 2
  1259                                  
  1260                                  ;-158         i=strlen(symbol); GData[GTop]=i; }
  1261                                  
  1262 0000059F 8D062B81                 lea  ax, [symbol]
  1263 000005A3 50                       push ax
  1264 000005A4 E897FB                   call strlen
  1265 000005A7 83C402                   add  sp, 2
  1266 000005AA 8946FE                   mov [bp-2], ax
  1267 000005AD 8B46FE                   mov ax, [bp-2]
  1268 000005B0 8B1E[2A00]               mov bx, [GTop]
  1269 000005B4 D1E3                     shl bx, 1
  1270 000005B6 8987EB8A                 mov [GData+bx], ax
  1271                                  
  1272                                  ;-159       else if (istoken('{' )) { i=0;
  1273                                  
  1274 000005BA E96200                   jmp .doglob49
  1275                                  .doglob48:
  1276 000005BD 6A7B                     push 123
  1277 000005BF E8E53D                   call istoken
  1278 000005C2 83C402                   add  sp, 2
  1279 000005C5 08C0                     or  al, al
  1280 000005C7 0F844B00                 je .doglob50
  1281 000005CB B80000                   mov ax, 0
  1282 000005CE 8946FE                   mov [bp-2], ax
  1283                                  
  1284                                  ;-160         do { if(i) prc(','); 
  1285                                  
  1286                                  .doglob51:
  1287 000005D1 8B46FE                   mov ax, [bp-2]
  1288 000005D4 08C0                     or  al, al
  1289 000005D6 0F840800                 je .doglob52
  1290 000005DA 6A2C                     push 44
  1291 000005DC E8963E                   call prc
  1292 000005DF 83C402                   add  sp, 2
  1293                                  
  1294                                  ;-161           expect(T_CONST); prunsign1(lexval); i=1; }
  1295                                  
  1296                                  .doglob52:
  1297 000005E2 680101                   push 257
  1298 000005E5 E8E13D                   call expect
  1299 000005E8 83C402                   add  sp, 2
  1300 000005EB FF36[2E00]               push word [lexval]
  1301 000005EF E83F40                   call prunsign1
  1302 000005F2 83C402                   add  sp, 2
  1303 000005F5 B80100                   mov ax, 1
  1304 000005F8 8946FE                   mov [bp-2], ax
  1305                                  
  1306                                  ;-162         while (istoken(',')); expect('}'); }  
  1307                                  
  1308 000005FB 6A2C                     push 44
  1309 000005FD E8A73D                   call istoken
  1310 00000600 83C402                   add  sp, 2
  1311 00000603 08C0                     or  al, al
  1312 00000605 0F840200                 je .doglob53
  1313 00000609 EBC6                     jmp .doglob51
  1314                                  .doglob53:
  1315 0000060B 6A7D                     push 125
  1316 0000060D E8B93D                   call expect
  1317 00000610 83C402                   add  sp, 2
  1318                                  
  1319                                  ;-163       else error1("String or number array expected");
  1320                                  
  1321 00000613 E90900                   jmp .doglob54
  1322                                  .doglob50:
  1323 00000616 68[E607]                 push doglob_13
  1324 00000619 E8A641                   call error1
  1325 0000061C 83C402                   add  sp, 2
  1326                                  
  1327                                  ;-164       }; 
  1328                                  
  1329                                  .doglob54:
  1330                                  .doglob49:
  1331                                  .doglob46:
  1332                                  
  1333                                  ;-165   }else { //expect('=');
  1334                                  
  1335 0000061F E99E00                   jmp .doglob55
  1336                                  .doglob39:
  1337                                  
  1338                                  ;-166     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1339                                  
  1340 00000622 68[0608]                 push doglob_14
  1341 00000625 E8B43E                   call prs
  1342 00000628 83C402                   add  sp, 2
  1343 0000062B 8D062B81                 lea  ax, [symbol]
  1344 0000062F 50                       push ax
  1345 00000630 E8A93E                   call prs
  1346 00000633 83C402                   add  sp, 2
  1347 00000636 A0[3200]                 mov al, [istype]
  1348 00000639 3C2A                     cmp al, 42
  1349 0000063B 0F850C00                 jne .doglob56
  1350 0000063F 68[0908]                 push doglob_15
  1351 00000642 E8973E                   call prs
  1352 00000645 83C402                   add  sp, 2
  1353                                  
  1354                                  ;-167     else {
  1355                                  
  1356 00000648 E93300                   jmp .doglob57
  1357                                  .doglob56:
  1358                                  
  1359                                  ;-168       if      (iswidth==1) prs(" db ");
  1360                                  
  1361 0000064B A0[3800]                 mov al, [iswidth]
  1362 0000064E 3C01                     cmp al, 1
  1363 00000650 0F850C00                 jne .doglob58
  1364 00000654 68[0E08]                 push doglob_16
  1365 00000657 E8823E                   call prs
  1366 0000065A 83C402                   add  sp, 2
  1367                                  
  1368                                  ;-169       else if (iswidth==2) prs(" dw ");
  1369                                  
  1370 0000065D E91E00                   jmp .doglob59
  1371                                  .doglob58:
  1372 00000660 A0[3800]                 mov al, [iswidth]
  1373 00000663 3C02                     cmp al, 2
  1374 00000665 0F850C00                 jne .doglob60
  1375 00000669 68[1308]                 push doglob_17
  1376 0000066C E86D3E                   call prs
  1377 0000066F 83C402                   add  sp, 2
  1378                                  
  1379                                  ;-170       else                 prs(" dd ");
  1380                                  
  1381 00000672 E90900                   jmp .doglob61
  1382                                  .doglob60:
  1383 00000675 68[1808]                 push doglob_18
  1384 00000678 E8613E                   call prs
  1385 0000067B 83C402                   add  sp, 2
  1386                                  
  1387                                  ;-171     }
  1388                                  
  1389                                  .doglob61:
  1390                                  .doglob59:
  1391                                  
  1392                                  ;-172     if(istoken('-')) prc('-');
  1393                                  
  1394                                  .doglob57:
  1395 0000067E 6A2D                     push 45
  1396 00000680 E8243D                   call istoken
  1397 00000683 83C402                   add  sp, 2
  1398 00000686 08C0                     or  al, al
  1399 00000688 0F840800                 je .doglob62
  1400 0000068C 6A2D                     push 45
  1401 0000068E E8E43D                   call prc
  1402 00000691 83C402                   add  sp, 2
  1403                                  
  1404                                  ;-173     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1405                                  
  1406                                  .doglob62:
  1407 00000694 6A3D                     push 61
  1408 00000696 E80E3D                   call istoken
  1409 00000699 83C402                   add  sp, 2
  1410 0000069C 08C0                     or  al, al
  1411 0000069E 0F841600                 je .doglob63
  1412 000006A2 680101                   push 257
  1413 000006A5 E8213D                   call expect
  1414 000006A8 83C402                   add  sp, 2
  1415 000006AB FF36[2E00]               push word [lexval]
  1416 000006AF E87F3F                   call prunsign1
  1417 000006B2 83C402                   add  sp, 2
  1418                                  
  1419                                  ;-174     else prunsign1(0); }
  1420                                  
  1421 000006B5 E90800                   jmp .doglob64
  1422                                  .doglob63:
  1423 000006B8 6A00                     push 0
  1424 000006BA E8743F                   call prunsign1
  1425 000006BD 83C402                   add  sp, 2
  1426                                  .doglob64:
  1427                                  
  1428                                  ;-175   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1429                                  
  1430                                  .doglob55:
  1431 000006C0 A0[3500]                 mov al, [issign]
  1432 000006C3 8B1E[2A00]               mov bx, [GTop]
  1433 000006C7 8887E383                 mov [GSign+bx], al
  1434 000006CB A0[3800]                 mov al, [iswidth]
  1435 000006CE 8B1E[2A00]               mov bx, [GTop]
  1436 000006D2 88870F85                 mov [GWidth+bx], al
  1437 000006D6 A0[3200]                 mov al, [istype]
  1438 000006D9 8B1E[2A00]               mov bx, [GTop]
  1439 000006DD 8887B782                 mov [GType+bx], al
  1440                                  
  1441                                  ;-176   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1442                                  
  1443 000006E1 A1[6600]                 mov ax, [lineno]
  1444 000006E4 83E801                   sub ax, 1
  1445 000006E7 8B1E[2A00]               mov bx, [GTop]
  1446 000006EB D1E3                     shl bx, 1
  1447 000006ED 89873B86                 mov [GAdr+bx], ax
  1448 000006F1 B80000                   mov ax, 0
  1449 000006F4 8B1E[2A00]               mov bx, [GTop]
  1450 000006F8 D1E3                     shl bx, 1
  1451 000006FA 89879388                 mov [GUsed+bx], ax
  1452                                  
  1453                                  ;-177   pt=adrofname(GTop);
  1454                                  
  1455 000006FE FF36[2A00]               push word [GTop]
  1456 00000702 E8CF01                   call adrofname
  1457 00000705 83C402                   add  sp, 2
  1458 00000708 A3[6A00]                 mov word [pt], ax
  1459                                  
  1460                                  ;-178   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1461                                  
  1462 0000070B 8B46FA                   mov ax, [bp-6]
  1463 0000070E 08C0                     or  al, al
  1464 00000710 0F841200                 je .doglob65
  1465 00000714 8D068FD0                 lea  ax, [doglobName]
  1466 00000718 50                       push ax
  1467 00000719 FF36[6A00]               push word [pt]
  1468 0000071D E846FA                   call strcpy
  1469 00000720 83C404                   add  sp, 4
  1470 00000723 E90F00                   jmp .doglob66
  1471                                  .doglob65:
  1472 00000726 8D062B81                 lea  ax, [symbol]
  1473 0000072A 50                       push ax
  1474 0000072B FF36[6A00]               push word [pt]
  1475 0000072F E834FA                   call strcpy
  1476 00000732 83C404                   add  sp, 4
  1477                                  
  1478                                  ;-179   GTop++; expect(';'); }
  1479                                  
  1480                                  .doglob66:
  1481 00000735 FF06[2A00]               inc  word[GTop]
  1482 00000739 6A3B                     push 59
  1483 0000073B E88B3C                   call expect
  1484 0000073E 83C402                   add  sp, 2
  1485                                  
  1486                                  ;-180 
  1487                                  
  1488                                  
  1489                                  ;-181 int gettypes(int i) {int j; char c;
  1490 00000741 C9                       LEAVE
  1491 00000742 C3                       ret
  1492 00000743 476C6F62616C207461-     doglob_0 db "Global table full",0
  1493 0000074C 626C652066756C6C00 
  1494 00000755 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1495 0000075E 732076617220747970-
  1496 00000767 6500               
  1497 00000769 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1498 00000772 616C72656164792064-
  1499 0000077B 6566696E656400     
  1500 00000782 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1501 0000078B 202E6273735C6E6162-
  1502 00000794 736F6C7574652000   
  1503 0000079C 5C6E00                  doglob_4 db "\n",0
  1504 0000079F 20726573622000          doglob_5 db " resb ",0
  1505 000007A6 20726573772000          doglob_6 db " resw ",0
  1506 000007AD 20726573642000          doglob_7 db " resd ",0
  1507 000007B4 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1508 000007BD 202E7465787400     
  1509 000007C4 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1510 000007CD 417272617920616C6C-
  1511 000007D6 6F77656400         
  1512 000007DB 5C6E00                  doglob_10 db "\n",0
  1513 000007DE 2064622000              doglob_11 db " db ",0
  1514 000007E3 2C3000                  doglob_12 db ",0",0
  1515 000007E6 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1516 000007EF 206E756D6265722061-
  1517 000007F8 727261792065787065-
  1518 00000801 6374656400         
  1519 00000806 5C6E00                  doglob_14 db "\n",0
  1520 00000809 2064772000              doglob_15 db " dw ",0
  1521 0000080E 2064622000              doglob_16 db " db ",0
  1522 00000813 2064772000              doglob_17 db " dw ",0
  1523 00000818 2064642000              doglob_18 db " dd ",0
  1524                                  ENDP
  1525                                  
  1526                                  gettypes: PROC
  1527                                  
  1528                                  ;-182   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1529                                  
  1530                                  ;Function : gettypes, Number of local variables: 3
  1531                                  ;   # type sign width addr used name   list of local variables
  1532                                  ;  200 var sign word   181 NULL i = bp+4
  1533                                  ;  201 var sign word   181 NULL j = bp-2
  1534                                  ;  202 var sign byte   181 NULL c = bp-4;
  1535 0000081D C8040000                 ENTER  4,0
  1536 00000821 8B5E04                   mov bx, [bp+4]
  1537 00000824 8A87E383                 mov al, [GSign + bx]
  1538 00000828 8846FC                   mov [bp-4], al
  1539 0000082B 8A46FC                   mov al, [bp-4]
  1540 0000082E 3C53                     cmp al, 83
  1541 00000830 0F850900                 jne .gettypes67
  1542 00000834 B80100                   mov ax, 1
  1543 00000837 A3[3300]                 mov word [signi], ax
  1544 0000083A E90600                   jmp .gettypes68
  1545                                  .gettypes67:
  1546 0000083D B80000                   mov ax, 0
  1547 00000840 A3[3300]                 mov word [signi], ax
  1548                                  
  1549                                  ;-183   c=GWidth[i]; widthi=0;wi=0;
  1550                                  
  1551                                  .gettypes68:
  1552 00000843 8B5E04                   mov bx, [bp+4]
  1553 00000846 8A870F85                 mov al, [GWidth + bx]
  1554 0000084A 8846FC                   mov [bp-4], al
  1555 0000084D B80000                   mov ax, 0
  1556 00000850 A3[3600]                 mov word [widthi], ax
  1557 00000853 B80000                   mov ax, 0
  1558 00000856 A3[3900]                 mov word [wi], ax
  1559                                  
  1560                                  ;-184   if (c==1) {widthi=1;wi=1;}
  1561                                  
  1562 00000859 8A46FC                   mov al, [bp-4]
  1563 0000085C 3C01                     cmp al, 1
  1564 0000085E 0F850C00                 jne .gettypes69
  1565 00000862 B80100                   mov ax, 1
  1566 00000865 A3[3600]                 mov word [widthi], ax
  1567 00000868 B80100                   mov ax, 1
  1568 0000086B A3[3900]                 mov word [wi], ax
  1569                                  
  1570                                  ;-185   if (c==2) {widthi=2;wi=2;}
  1571                                  
  1572                                  .gettypes69:
  1573 0000086E 8A46FC                   mov al, [bp-4]
  1574 00000871 3C02                     cmp al, 2
  1575 00000873 0F850C00                 jne .gettypes70
  1576 00000877 B80200                   mov ax, 2
  1577 0000087A A3[3600]                 mov word [widthi], ax
  1578 0000087D B80200                   mov ax, 2
  1579 00000880 A3[3900]                 mov word [wi], ax
  1580                                  
  1581                                  ;-186   if (c==4) {widthi=4;wi=4;}
  1582                                  
  1583                                  .gettypes70:
  1584 00000883 8A46FC                   mov al, [bp-4]
  1585 00000886 3C04                     cmp al, 4
  1586 00000888 0F850C00                 jne .gettypes71
  1587 0000088C B80400                   mov ax, 4
  1588 0000088F A3[3600]                 mov word [widthi], ax
  1589 00000892 B80400                   mov ax, 4
  1590 00000895 A3[3900]                 mov word [wi], ax
  1591                                  
  1592                                  ;-187   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1593                                  
  1594                                  .gettypes71:
  1595 00000898 8B5E04                   mov bx, [bp+4]
  1596 0000089B 8A87B782                 mov al, [GType + bx]
  1597 0000089F 8846FC                   mov [bp-4], al
  1598 000008A2 B80000                   mov ax, 0
  1599 000008A5 A3[3000]                 mov word [typei], ax
  1600 000008A8 8A46FC                   mov al, [bp-4]
  1601 000008AB 3C2A                     cmp al, 42
  1602 000008AD 0F850C00                 jne .gettypes72
  1603 000008B1 B80100                   mov ax, 1
  1604 000008B4 A3[3000]                 mov word [typei], ax
  1605 000008B7 B80200                   mov ax, 2
  1606 000008BA A3[3900]                 mov word [wi], ax
  1607                                  
  1608                                  ;-188   if (c=='&')  typei=2;  
  1609                                  
  1610                                  .gettypes72:
  1611 000008BD 8A46FC                   mov al, [bp-4]
  1612 000008C0 3C26                     cmp al, 38
  1613 000008C2 0F850600                 jne .gettypes73
  1614 000008C6 B80200                   mov ax, 2
  1615 000008C9 A3[3000]                 mov word [typei], ax
  1616                                  
  1617                                  ;-189   return i; }  
  1618                                  
  1619                                  .gettypes73:
  1620 000008CC 8B4604                   mov ax, [bp+4]
  1621 000008CF E90000                   jmp .retngettypes
  1622                                  
  1623                                  ;-190 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1624                                  
  1625 000008D2 C9                       .retngettypes: LEAVE
  1626 000008D3 C3                       ret
  1627                                  ENDP
  1628                                  
  1629                                  adrofname: PROC
  1630                                  ;Function : adrofname, Number of local variables: 1
  1631                                  ;   # type sign width addr used name   list of local variables
  1632                                  ;  200 var unsg word   190 NULL i = bp+4;
  1633 000008D4 C8000000                 ENTER  0,0
  1634 000008D8 FF7604                   push word [bp+4]
  1635 000008DB 8D06438D                 lea  ax, [GNameField]
  1636 000008DF 50                       push ax
  1637 000008E0 E80500                   call adrF
  1638 000008E3 83C404                   add  sp, 4
  1639                                  
  1640                                  ;-191 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1641 000008E6 C9                       LEAVE
  1642 000008E7 C3                       ret
  1643                                  ENDP
  1644                                  
  1645                                  adrF: PROC
  1646                                  ;Function : adrF, Number of local variables: 2
  1647                                  ;   # type sign width addr used name   list of local variables
  1648                                  ;  200 ptr sign byte   191 NULL s = bp+4
  1649                                  ;  201 var unsg word   191 NULL i = bp+6;
  1650 000008E8 C8000000                 ENTER  0,0
  1651 000008EC 8B4606                   mov ax, [bp+6]
  1652 000008EF C1E004                   shl ax, 4
  1653                                  
  1654                                  ;-192   __asm{ add ax, [bp+4]  ; offset s } }
  1655                                  
  1656 000008F2 034604                   add ax, [bp+4]  ; offset s 
  1657                                  
  1658                                  ;-193 int printName(unsigned int i) {int j;
  1659 000008F5 C9                       LEAVE
  1660 000008F6 C3                       ret
  1661                                  ENDP
  1662                                  
  1663                                  printName: PROC
  1664                                  
  1665                                  ;-194   if (i < LSTART) { i=adrofname(i); prs(i); }
  1666                                  
  1667                                  ;Function : printName, Number of local variables: 2
  1668                                  ;   # type sign width addr used name   list of local variables
  1669                                  ;  200 var unsg word   193 NULL i = bp+4
  1670                                  ;  201 var sign word   193 NULL j = bp-2;
  1671 000008F7 C8020000                 ENTER  2,0
  1672 000008FB 8B4604                   mov ax, [bp+4]
  1673 000008FE 3DC800                   cmp ax, 200
  1674 00000901 0F8D1800                 jge .printName74
  1675 00000905 FF7604                   push word [bp+4]
  1676 00000908 E8C9FF                   call adrofname
  1677 0000090B 83C402                   add  sp, 2
  1678 0000090E 894604                   mov [bp+4], ax
  1679 00000911 FF7604                   push word [bp+4]
  1680 00000914 E8C53B                   call prs
  1681 00000917 83C402                   add  sp, 2
  1682                                  
  1683                                  ;-195   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1684                                  
  1685 0000091A E93800                   jmp .printName75
  1686                                  .printName74:
  1687 0000091D 68[5709]                 push printName_0
  1688 00000920 E8B93B                   call prs
  1689 00000923 83C402                   add  sp, 2
  1690 00000926 8B5E04                   mov bx, [bp+4]
  1691 00000929 D1E3                     shl bx, 1
  1692 0000092B 8B87EB8A                 mov ax, [GData + bx]
  1693 0000092F 8946FE                   mov [bp-2], ax
  1694 00000932 8B46FE                   mov ax, [bp-2]
  1695 00000935 83F800                   cmp ax, 0
  1696 00000938 0F8E0800                 jle .printName76
  1697 0000093C 6A2B                     push 43
  1698 0000093E E8343B                   call prc
  1699 00000941 83C402                   add  sp, 2
  1700                                  .printName76:
  1701 00000944 FF76FE                   push word [bp-2]
  1702 00000947 E8893C                   call pint1
  1703 0000094A 83C402                   add  sp, 2
  1704 0000094D 6A5D                     push 93
  1705 0000094F E8233B                   call prc
  1706 00000952 83C402                   add  sp, 2
  1707                                  
  1708                                  ;-196 }
  1709                                  
  1710                                  .printName75:
  1711                                  
  1712                                  ;-197 int searchname() { unsigned int i;
  1713 00000955 C9                       LEAVE
  1714 00000956 C3                       ret
  1715 00000957 5B627000                printName_0 db "[bp",0
  1716                                  ENDP
  1717                                  
  1718                                  searchname: PROC
  1719                                  
  1720                                  ;-198   i=checkName(); if (i == 0) error1("Variable unknown");
  1721                                  
  1722                                  ;Function : searchname, Number of local variables: 1
  1723                                  ;   # type sign width addr used name   list of local variables
  1724                                  ;  200 var unsg word   197 NULL i = bp-2;
  1725 0000095B C8020000                 ENTER  2,0
  1726 0000095F E84400                   call checkName
  1727 00000962 8946FE                   mov [bp-2], ax
  1728 00000965 8B46FE                   mov ax, [bp-2]
  1729 00000968 83F800                   cmp ax, 0
  1730 0000096B 0F850900                 jne .searchname77
  1731 0000096F 68[9509]                 push searchname_0
  1732 00000972 E84D3E                   call error1
  1733 00000975 83C402                   add  sp, 2
  1734                                  
  1735                                  ;-199   GUsed[i]=GUsed[i] + 1; return i;
  1736                                  
  1737                                  .searchname77:
  1738 00000978 8B5EFE                   mov bx, [bp-2]
  1739 0000097B D1E3                     shl bx, 1
  1740 0000097D 8B879388                 mov ax, [GUsed + bx]
  1741 00000981 83C001                   add ax, 1
  1742 00000984 8B5EFE                   mov bx, [bp-2]
  1743 00000987 D1E3                     shl bx, 1
  1744 00000989 89879388                 mov [GUsed+bx], ax
  1745 0000098D 8B46FE                   mov ax, [bp-2]
  1746 00000990 E90000                   jmp .retnsearchname
  1747                                  
  1748                                  ;-200 }
  1749                                  
  1750                                  
  1751                                  ;-201 int checkName() { unsigned int i; unsigned int j;
  1752                                  
  1753 00000993 C9                       .retnsearchname: LEAVE
  1754 00000994 C3                       ret
  1755 00000995 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1756 0000099E 756E6B6E6F776E00   
  1757                                  ENDP
  1758                                  
  1759                                  checkName: PROC
  1760                                  
  1761                                  ;-202   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1762                                  
  1763                                  ;Function : checkName, Number of local variables: 2
  1764                                  ;   # type sign width addr used name   list of local variables
  1765                                  ;  200 var unsg word   201 NULL i = bp-2
  1766                                  ;  201 var unsg word   201 NULL j = bp-4;
  1767 000009A6 C8040000                 ENTER  4,0
  1768 000009AA B8C800                   mov ax, 200
  1769 000009AD 8946FE                   mov [bp-2], ax
  1770                                  .checkName78:
  1771 000009B0 8B46FE                   mov ax, [bp-2]
  1772 000009B3 3B06[2C00]               cmp ax, [LTop]
  1773 000009B7 0F8D2B00                 jge .checkName79
  1774 000009BB FF76FE                   push word [bp-2]
  1775 000009BE E813FF                   call adrofname
  1776 000009C1 83C402                   add  sp, 2
  1777 000009C4 8946FC                   mov [bp-4], ax
  1778 000009C7 FF76FC                   push word [bp-4]
  1779 000009CA 8D062B81                 lea  ax, [symbol]
  1780 000009CE 50                       push ax
  1781 000009CF E8C4F7                   call eqstr
  1782 000009D2 83C404                   add  sp, 4
  1783 000009D5 08C0                     or  al, al
  1784 000009D7 0F840600                 je .checkName80
  1785 000009DB 8B46FE                   mov ax, [bp-2]
  1786 000009DE E94700                   jmp .retncheckName
  1787                                  .checkName80:
  1788 000009E1 FF46FE                   inc  word[bp-2]
  1789                                  
  1790                                  ;-203   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1791                                  
  1792 000009E4 EBCA                     jmp .checkName78
  1793                                  .checkName79:
  1794 000009E6 B80100                   mov ax, 1
  1795 000009E9 8946FE                   mov [bp-2], ax
  1796                                  .checkName81:
  1797 000009EC 8B46FE                   mov ax, [bp-2]
  1798 000009EF 3B06[2A00]               cmp ax, [GTop]
  1799 000009F3 0F8D2B00                 jge .checkName82
  1800 000009F7 FF76FE                   push word [bp-2]
  1801 000009FA E8D7FE                   call adrofname
  1802 000009FD 83C402                   add  sp, 2
  1803 00000A00 8946FC                   mov [bp-4], ax
  1804 00000A03 FF76FC                   push word [bp-4]
  1805 00000A06 8D062B81                 lea  ax, [symbol]
  1806 00000A0A 50                       push ax
  1807 00000A0B E888F7                   call eqstr
  1808 00000A0E 83C404                   add  sp, 4
  1809 00000A11 08C0                     or  al, al
  1810 00000A13 0F840600                 je .checkName83
  1811 00000A17 8B46FE                   mov ax, [bp-2]
  1812 00000A1A E90B00                   jmp .retncheckName
  1813                                  .checkName83:
  1814 00000A1D FF46FE                   inc  word[bp-2]
  1815                                  
  1816                                  ;-204   return 0;
  1817                                  
  1818 00000A20 EBCA                     jmp .checkName81
  1819                                  .checkName82:
  1820 00000A22 B80000                   mov ax, 0
  1821 00000A25 E90000                   jmp .retncheckName
  1822                                  
  1823                                  ;-205 }    
  1824                                  
  1825                                  
  1826                                  ;-206 int typeName() { int m; //0=V,1=*,2=&
  1827                                  
  1828 00000A28 C9                       .retncheckName: LEAVE
  1829 00000A29 C3                       ret
  1830                                  ENDP
  1831                                  
  1832                                  typeName: PROC
  1833                                  
  1834                                  ;-207     issign='S';
  1835                                  
  1836                                  ;Function : typeName, Number of local variables: 1
  1837                                  ;   # type sign width addr used name   list of local variables
  1838                                  ;  200 var sign word   206 NULL m = bp-2;
  1839 00000A2A C8020000                 ENTER  2,0
  1840 00000A2E B85300                   mov ax, 83
  1841 00000A31 A2[3500]                 mov byte [issign], al
  1842                                  
  1843                                  ;-208     if(istoken(T_SIGNED))   issign='S';  
  1844                                  
  1845 00000A34 681302                   push 531
  1846 00000A37 E86D39                   call istoken
  1847 00000A3A 83C402                   add  sp, 2
  1848 00000A3D 08C0                     or  al, al
  1849 00000A3F 0F840600                 je .typeName84
  1850 00000A43 B85300                   mov ax, 83
  1851 00000A46 A2[3500]                 mov byte [issign], al
  1852                                  
  1853                                  ;-209     if(istoken(T_UNSIGNED)) issign='U';
  1854                                  
  1855                                  .typeName84:
  1856 00000A49 681402                   push 532
  1857 00000A4C E85839                   call istoken
  1858 00000A4F 83C402                   add  sp, 2
  1859 00000A52 08C0                     or  al, al
  1860 00000A54 0F840600                 je .typeName85
  1861 00000A58 B85500                   mov ax, 85
  1862 00000A5B A2[3500]                 mov byte [issign], al
  1863                                  
  1864                                  ;-210     iswidth=2;                           
  1865                                  
  1866                                  .typeName85:
  1867 00000A5E B80200                   mov ax, 2
  1868 00000A61 A2[3800]                 mov byte [iswidth], al
  1869                                  
  1870                                  ;-211     if(istoken(T_VOID))     iswidth=0;
  1871                                  
  1872 00000A64 681102                   push 529
  1873 00000A67 E83D39                   call istoken
  1874 00000A6A 83C402                   add  sp, 2
  1875 00000A6D 08C0                     or  al, al
  1876 00000A6F 0F840600                 je .typeName86
  1877 00000A73 B80000                   mov ax, 0
  1878 00000A76 A2[3800]                 mov byte [iswidth], al
  1879                                  
  1880                                  ;-212     if(istoken(T_CHAR))     iswidth=1;   
  1881                                  
  1882                                  .typeName86:
  1883 00000A79 681202                   push 530
  1884 00000A7C E82839                   call istoken
  1885 00000A7F 83C402                   add  sp, 2
  1886 00000A82 08C0                     or  al, al
  1887 00000A84 0F840600                 je .typeName87
  1888 00000A88 B80100                   mov ax, 1
  1889 00000A8B A2[3800]                 mov byte [iswidth], al
  1890                                  
  1891                                  ;-213     if(istoken(T_INT))      iswidth=2;
  1892                                  
  1893                                  .typeName87:
  1894 00000A8E 680502                   push 517
  1895 00000A91 E81339                   call istoken
  1896 00000A94 83C402                   add  sp, 2
  1897 00000A97 08C0                     or  al, al
  1898 00000A99 0F840600                 je .typeName88
  1899 00000A9D B80200                   mov ax, 2
  1900 00000AA0 A2[3800]                 mov byte [iswidth], al
  1901                                  
  1902                                  ;-214     if(istoken(T_LONG))     iswidth=4;
  1903                                  
  1904                                  .typeName88:
  1905 00000AA3 681502                   push 533
  1906 00000AA6 E8FE38                   call istoken
  1907 00000AA9 83C402                   add  sp, 2
  1908 00000AAC 08C0                     or  al, al
  1909 00000AAE 0F840600                 je .typeName89
  1910 00000AB2 B80400                   mov ax, 4
  1911 00000AB5 A2[3800]                 mov byte [iswidth], al
  1912                                  
  1913                                  ;-215     istype='V'; 
  1914                                  
  1915                                  .typeName89:
  1916 00000AB8 B85600                   mov ax, 86
  1917 00000ABB A2[3200]                 mov byte [istype], al
  1918                                  
  1919                                  ;-216     m=0;
  1920                                  
  1921 00000ABE B80000                   mov ax, 0
  1922 00000AC1 8946FE                   mov [bp-2], ax
  1923                                  
  1924                                  ;-217     if(istoken('*'))  {istype='*'; m=1;} 
  1925                                  
  1926 00000AC4 6A2A                     push 42
  1927 00000AC6 E8DE38                   call istoken
  1928 00000AC9 83C402                   add  sp, 2
  1929 00000ACC 08C0                     or  al, al
  1930 00000ACE 0F840C00                 je .typeName90
  1931 00000AD2 B82A00                   mov ax, 42
  1932 00000AD5 A2[3200]                 mov byte [istype], al
  1933 00000AD8 B80100                   mov ax, 1
  1934 00000ADB 8946FE                   mov [bp-2], ax
  1935                                  
  1936                                  ;-218     if(istoken('&'))  {istype='&'; m=2;}
  1937                                  
  1938                                  .typeName90:
  1939 00000ADE 6A26                     push 38
  1940 00000AE0 E8C438                   call istoken
  1941 00000AE3 83C402                   add  sp, 2
  1942 00000AE6 08C0                     or  al, al
  1943 00000AE8 0F840C00                 je .typeName91
  1944 00000AEC B82600                   mov ax, 38
  1945 00000AEF A2[3200]                 mov byte [istype], al
  1946 00000AF2 B80200                   mov ax, 2
  1947 00000AF5 8946FE                   mov [bp-2], ax
  1948                                  
  1949                                  ;-219     name1(); 
  1950                                  
  1951                                  .typeName91:
  1952 00000AF8 E80800                   call name1
  1953                                  
  1954                                  ;-220     return m; 
  1955                                  
  1956 00000AFB 8B46FE                   mov ax, [bp-2]
  1957 00000AFE E90000                   jmp .retntypeName
  1958                                  
  1959                                  ;-221 }
  1960                                  
  1961                                  
  1962                                  ;-222 int name1() {
  1963                                  
  1964 00000B01 C9                       .retntypeName: LEAVE
  1965 00000B02 C3                       ret
  1966                                  ENDP
  1967                                  
  1968                                  name1: PROC
  1969                                  
  1970                                  ;-223     if (token!=T_NAME) error1("Name expected"); 
  1971                                  
  1972 00000B03 A1[1C00]                 mov ax, [token]
  1973 00000B06 3D0001                   cmp ax, 256
  1974 00000B09 0F840900                 je  .name192
  1975 00000B0D 68[1D0B]                 push name1_0
  1976 00000B10 E8AF3C                   call error1
  1977 00000B13 83C402                   add  sp, 2
  1978                                  
  1979                                  ;-224     token=getlex(); 
  1980                                  
  1981                                  .name192:
  1982 00000B16 E86A31                   call getlex
  1983 00000B19 A3[1C00]                 mov word [token], ax
  1984                                  
  1985                                  ;-225 }
  1986                                  
  1987                                  
  1988                                  ;-226 
  1989                                  
  1990                                  
  1991                                  ;-227 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1992                                  
  1993 00000B1C C3                       ret
  1994 00000B1D 4E616D652065787065-     name1_0 db "Name expected",0
  1995 00000B26 6374656400         
  1996                                  ENDP
  1997                                  
  1998                                  storecall: PROC
  1999                                  ;Function : storecall, Number of local variables: 1
  2000                                  ;   # type sign width addr used name   list of local variables
  2001                                  ;  200 var sign word   227 NULL i = bp-2;
  2002 00000B2B C8020000                 ENTER  2,0
  2003 00000B2F A1[3D00]                 mov ax, [CTop]
  2004 00000B32 3DD007                   cmp ax, 2000 ;unsigned : 1
  2005 00000B35 0F8C0900                 jl  .storecall93
  2006 00000B39 68[9D0B]                 push storecall_0
  2007 00000B3C E8833C                   call error1
  2008 00000B3F 83C402                   add  sp, 2
  2009                                  
  2010                                  ;-228   if (CNameTop >= 65468) error1("Call name table fuill");
  2011                                  
  2012                                  .storecall93:
  2013 00000B42 A1[6000]                 mov ax, [CNameTop]
  2014 00000B45 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2015 00000B48 0F820900                 jb  .storecall94
  2016 00000B4C 68[AD0B]                 push storecall_1
  2017 00000B4F E8703C                   call error1
  2018 00000B52 83C402                   add  sp, 2
  2019                                  
  2020                                  ;-229     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2021                                  
  2022                                  .storecall94:
  2023 00000B55 B80000                   mov ax, 0
  2024 00000B58 8B1E[3D00]               mov bx, [CTop]
  2025 00000B5C 88872FA1                 mov [CType+bx], al
  2026 00000B60 A1[6000]                 mov ax, [CNameTop]
  2027 00000B63 8B1E[3D00]               mov bx, [CTop]
  2028 00000B67 D1E3                     shl bx, 1
  2029 00000B69 898757AB                 mov [CAdr+bx], ax
  2030 00000B6D 8D062B81                 lea  ax, [symbol]
  2031 00000B71 50                       push ax
  2032 00000B72 E8C9F5                   call strlen
  2033 00000B75 83C402                   add  sp, 2
  2034 00000B78 8946FE                   mov [bp-2], ax
  2035                                  
  2036                                  ;-230     to_far(CNameTop, symbol);
  2037                                  
  2038 00000B7B 8D062B81                 lea  ax, [symbol]
  2039 00000B7F 50                       push ax
  2040 00000B80 FF36[6000]               push word [CNameTop]
  2041 00000B84 E89547                   call to_far
  2042 00000B87 83C404                   add  sp, 4
  2043                                  
  2044                                  ;-231     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2045                                  
  2046 00000B8A A1[6000]                 mov ax, [CNameTop]
  2047 00000B8D 0346FE                   add ax, [bp-2]
  2048 00000B90 A3[6000]                 mov word [CNameTop], ax
  2049 00000B93 FF06[6000]               inc  word[CNameTop]
  2050 00000B97 FF06[3D00]               inc  word[CTop]
  2051                                  
  2052                                  ;-232 }
  2053                                  
  2054                                  
  2055                                  ;-233 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2056 00000B9B C9                       LEAVE
  2057 00000B9C C3                       ret
  2058 00000B9D 43616C6C207461626C-     storecall_0 db "Call table full",0
  2059 00000BA6 652066756C6C00     
  2060 00000BAD 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2061 00000BB6 207461626C65206675-
  2062 00000BBF 696C6C00           
  2063                                  ENDP
  2064                                  
  2065                                  storefunc: PROC
  2066 00000BC3 A1[3B00]                 mov ax, [FTop]
  2067 00000BC6 3D2C01                   cmp ax, 300 ;unsigned : 1
  2068 00000BC9 0F8C0900                 jl  .storefunc95
  2069 00000BCD 68[240C]                 push storefunc_0
  2070 00000BD0 E8EF3B                   call error1
  2071 00000BD3 83C402                   add  sp, 2
  2072                                  
  2073                                  ;-234     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2074                                  
  2075                                  .storefunc95:
  2076 00000BD6 A1[6600]                 mov ax, [lineno]
  2077 00000BD9 83E801                   sub ax, 1
  2078 00000BDC 8B1E[3B00]               mov bx, [FTop]
  2079 00000BE0 D1E3                     shl bx, 1
  2080 00000BE2 8987FFA8                 mov [FAdr+bx], ax
  2081 00000BE6 B80000                   mov ax, 0
  2082 00000BE9 8B1E[3B00]               mov bx, [FTop]
  2083 00000BED D1E3                     shl bx, 1
  2084 00000BEF 8987F7BA                 mov [FCalls+bx], ax
  2085 00000BF3 A0[3800]                 mov al, [iswidth]
  2086 00000BF6 8B1E[3B00]               mov bx, [FTop]
  2087 00000BFA 888703A0                 mov [FType+bx], al
  2088                                  
  2089                                  ;-235     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2090                                  
  2091 00000BFE FF36[3B00]               push word [FTop]
  2092 00000C02 8D064FBD                 lea  ax, [FNameField]
  2093 00000C06 50                       push ax
  2094 00000C07 E8DEFC                   call adrF
  2095 00000C0A 83C404                   add  sp, 4
  2096 00000C0D A3[6A00]                 mov word [pt], ax
  2097 00000C10 8D062B81                 lea  ax, [symbol]
  2098 00000C14 50                       push ax
  2099 00000C15 FF36[6A00]               push word [pt]
  2100 00000C19 E84AF5                   call strcpy
  2101 00000C1C 83C404                   add  sp, 4
  2102 00000C1F FF06[3B00]               inc  word[FTop]
  2103                                  
  2104                                  ;-236 }
  2105                                  
  2106                                  
  2107                                  ;-237 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2108                                  
  2109 00000C23 C3                       ret
  2110 00000C24 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2111 00000C2D 7461626C652066756C-
  2112 00000C36 6C00               
  2113                                  ENDP
  2114                                  
  2115                                  addlocal: PROC
  2116 00000C38 A1[2C00]                 mov ax, [LTop]
  2117 00000C3B 3D2C01                   cmp ax, 300 ;unsigned : 1
  2118 00000C3E 0F8C0900                 jl  .addlocal96
  2119 00000C42 68[BE0C]                 push addlocal_0
  2120 00000C45 E87A3B                   call error1
  2121 00000C48 83C402                   add  sp, 2
  2122                                  
  2123                                  ;-238   if (checkName() != 0) error1("Variable already defined");
  2124                                  
  2125                                  .addlocal96:
  2126 00000C4B E858FD                   call checkName
  2127 00000C4E 83F800                   cmp ax, 0
  2128 00000C51 0F840900                 je  .addlocal97
  2129 00000C55 68[D80C]                 push addlocal_1
  2130 00000C58 E8673B                   call error1
  2131 00000C5B 83C402                   add  sp, 2
  2132                                  
  2133                                  ;-239   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2134                                  
  2135                                  .addlocal97:
  2136 00000C5E A0[3500]                 mov al, [issign]
  2137 00000C61 8B1E[2C00]               mov bx, [LTop]
  2138 00000C65 8887E383                 mov [GSign+bx], al
  2139 00000C69 A0[3800]                 mov al, [iswidth]
  2140 00000C6C 8B1E[2C00]               mov bx, [LTop]
  2141 00000C70 88870F85                 mov [GWidth+bx], al
  2142 00000C74 A0[3200]                 mov al, [istype]
  2143 00000C77 8B1E[2C00]               mov bx, [LTop]
  2144 00000C7B 8887B782                 mov [GType+bx], al
  2145                                  
  2146                                  ;-240   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2147                                  
  2148 00000C7F A1[6600]                 mov ax, [lineno]
  2149 00000C82 83E801                   sub ax, 1
  2150 00000C85 8B1E[2C00]               mov bx, [LTop]
  2151 00000C89 D1E3                     shl bx, 1
  2152 00000C8B 89873B86                 mov [GAdr+bx], ax
  2153 00000C8F B80000                   mov ax, 0
  2154 00000C92 8B1E[2C00]               mov bx, [LTop]
  2155 00000C96 D1E3                     shl bx, 1
  2156 00000C98 89879388                 mov [GUsed+bx], ax
  2157                                  
  2158                                  ;-241   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2159                                  
  2160 00000C9C FF36[2C00]               push word [LTop]
  2161 00000CA0 8D06438D                 lea  ax, [GNameField]
  2162 00000CA4 50                       push ax
  2163 00000CA5 E840FC                   call adrF
  2164 00000CA8 83C404                   add  sp, 4
  2165 00000CAB A3[6A00]                 mov word [pt], ax
  2166 00000CAE 8D062B81                 lea  ax, [symbol]
  2167 00000CB2 50                       push ax
  2168 00000CB3 FF36[6A00]               push word [pt]
  2169 00000CB7 E8ACF4                   call strcpy
  2170 00000CBA 83C404                   add  sp, 4
  2171                                  
  2172                                  ;-242 }
  2173                                  
  2174                                  
  2175                                  ;-243 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2176                                  
  2177 00000CBD C3                       ret
  2178 00000CBE 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2179 00000CC7 6961626C6520746162-
  2180 00000CD0 6C652066756C6C00   
  2181 00000CD8 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2182 00000CE1 616C72656164792064-
  2183 00000CEA 6566696E656400     
  2184                                  ENDP
  2185                                  
  2186                                  checkFunction: PROC
  2187                                  ;Function : checkFunction, Number of local variables: 2
  2188                                  ;   # type sign width addr used name   list of local variables
  2189                                  ;  200 var unsg word   243 NULL i = bp-2
  2190                                  ;  201 var unsg word   243 NULL j = bp-4;
  2191 00000CF1 C8040000                 ENTER  4,0
  2192 00000CF5 B80000                   mov ax, 0
  2193 00000CF8 8946FE                   mov [bp-2], ax
  2194                                  
  2195                                  ;-244   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2196                                  
  2197                                  .checkFunction98:
  2198 00000CFB 8B46FE                   mov ax, [bp-2]
  2199 00000CFE 3B06[3B00]               cmp ax, [FTop]
  2200 00000D02 0F8D3000                 jge .checkFunction99
  2201 00000D06 FF76FE                   push word [bp-2]
  2202 00000D09 8D064FBD                 lea  ax, [FNameField]
  2203 00000D0D 50                       push ax
  2204 00000D0E E8D7FB                   call adrF
  2205 00000D11 83C404                   add  sp, 4
  2206 00000D14 8946FC                   mov [bp-4], ax
  2207 00000D17 FF76FC                   push word [bp-4]
  2208 00000D1A 8D062B81                 lea  ax, [symbol]
  2209 00000D1E 50                       push ax
  2210 00000D1F E874F4                   call eqstr
  2211 00000D22 83C404                   add  sp, 4
  2212 00000D25 08C0                     or  al, al
  2213 00000D27 0F840600                 je .checkFunction100
  2214 00000D2B 8B46FE                   mov ax, [bp-2]
  2215 00000D2E E90B00                   jmp .retncheckFunction
  2216                                  .checkFunction100:
  2217 00000D31 FF46FE                   inc  word[bp-2]
  2218                                  
  2219                                  ;-245   return 0; }
  2220                                  
  2221 00000D34 EBC5                     jmp .checkFunction98
  2222                                  .checkFunction99:
  2223 00000D36 B80000                   mov ax, 0
  2224 00000D39 E90000                   jmp .retncheckFunction
  2225                                  
  2226                                  ;-246 int dofunc() { int nloc; int i; int narg;  
  2227                                  
  2228 00000D3C C9                       .retncheckFunction: LEAVE
  2229 00000D3D C3                       ret
  2230                                  ENDP
  2231                                  
  2232                                  dofunc: PROC
  2233                                  
  2234                                  ;-247   cloc=&co; 
  2235                                  
  2236                                  ;Function : dofunc, Number of local variables: 3
  2237                                  ;   # type sign width addr used name   list of local variables
  2238                                  ;  200 var sign word   246 NULL nloc = bp-2
  2239                                  ;  201 var sign word   246 NULL i = bp-4
  2240                                  ;  202 var sign word   246 NULL narg = bp-6;
  2241 00000D3E C8060000                 ENTER  6,0
  2242 00000D42 B83075                   mov ax, co
  2243 00000D45 A3[1600]                 mov word [cloc], ax
  2244                                  
  2245                                  ;-248   checknamelen();
  2246                                  
  2247 00000D48 E857F6                   call checknamelen
  2248                                  
  2249                                  ;-249   strcpy(fname, symbol);
  2250                                  
  2251 00000D4B 8D062B81                 lea  ax, [symbol]
  2252 00000D4F 50                       push ax
  2253 00000D50 8D06AB81                 lea  ax, [fname]
  2254 00000D54 50                       push ax
  2255 00000D55 E80EF4                   call strcpy
  2256 00000D58 83C404                   add  sp, 4
  2257                                  
  2258                                  ;-250   if (checkFunction() ) error1("Function already defined");
  2259                                  
  2260 00000D5B E893FF                   call checkFunction
  2261 00000D5E 08C0                     or  al, al
  2262 00000D60 0F840900                 je .dofunc101
  2263 00000D64 68[880F]                 push dofunc_0
  2264 00000D67 E8583A                   call error1
  2265 00000D6A 83C402                   add  sp, 2
  2266                                  
  2267                                  ;-251   storefunc();
  2268                                  
  2269                                  .dofunc101:
  2270 00000D6D E853FE                   call storefunc
  2271                                  
  2272                                  ;-252   prs("\n\n"); prs(symbol); prs(": PROC");
  2273                                  
  2274 00000D70 68[A10F]                 push dofunc_1
  2275 00000D73 E86637                   call prs
  2276 00000D76 83C402                   add  sp, 2
  2277 00000D79 8D062B81                 lea  ax, [symbol]
  2278 00000D7D 50                       push ax
  2279 00000D7E E85B37                   call prs
  2280 00000D81 83C402                   add  sp, 2
  2281 00000D84 68[A60F]                 push dofunc_2
  2282 00000D87 E85237                   call prs
  2283 00000D8A 83C402                   add  sp, 2
  2284                                  
  2285                                  ;-253   expect('('); LTop=LSTART;  i=0;
  2286                                  
  2287 00000D8D 6A28                     push 40
  2288 00000D8F E83736                   call expect
  2289 00000D92 83C402                   add  sp, 2
  2290 00000D95 B8C800                   mov ax, 200
  2291 00000D98 A3[2C00]                 mov word [LTop], ax
  2292 00000D9B B80000                   mov ax, 0
  2293 00000D9E 8946FC                   mov [bp-4], ax
  2294                                  
  2295                                  ;-254   if (istoken(')')==0) { narg=2; 
  2296                                  
  2297 00000DA1 6A29                     push 41
  2298 00000DA3 E80136                   call istoken
  2299 00000DA6 83C402                   add  sp, 2
  2300 00000DA9 83F800                   cmp ax, 0
  2301 00000DAC 0F854600                 jne .dofunc102
  2302 00000DB0 B80200                   mov ax, 2
  2303 00000DB3 8946FA                   mov [bp-6], ax
  2304                                  
  2305                                  ;-255     do { typeName();  addlocal(); narg+=2;
  2306                                  
  2307                                  .dofunc103:
  2308 00000DB6 E871FC                   call typeName
  2309 00000DB9 E87CFE                   call addlocal
  2310 00000DBC 8346FA02                 add  word[bp-6], 2
  2311                                  
  2312                                  ;-256          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2313                                  
  2314 00000DC0 8B46FA                   mov ax, [bp-6]
  2315 00000DC3 8B1E[2C00]               mov bx, [LTop]
  2316 00000DC7 D1E3                     shl bx, 1
  2317 00000DC9 8987EB8A                 mov [GData+bx], ax
  2318 00000DCD A0[3800]                 mov al, [iswidth]
  2319 00000DD0 3C04                     cmp al, 4
  2320 00000DD2 0F850400                 jne .dofunc104
  2321 00000DD6 8346FA02                 add  word[bp-6], 2
  2322                                  .dofunc104:
  2323 00000DDA FF06[2C00]               inc  word[LTop]
  2324                                  
  2325                                  ;-257     while (istoken(','));  expect(')'); }
  2326                                  
  2327 00000DDE 6A2C                     push 44
  2328 00000DE0 E8C435                   call istoken
  2329 00000DE3 83C402                   add  sp, 2
  2330 00000DE6 08C0                     or  al, al
  2331 00000DE8 0F840200                 je .dofunc105
  2332 00000DEC EBC8                     jmp .dofunc103
  2333                                  .dofunc105:
  2334 00000DEE 6A29                     push 41
  2335 00000DF0 E8D635                   call expect
  2336 00000DF3 83C402                   add  sp, 2
  2337                                  
  2338                                  ;-258     
  2339                                  
  2340                                  
  2341                                  ;-259   expect('{'); /*body*/
  2342                                  
  2343                                  .dofunc102:
  2344 00000DF6 6A7B                     push 123
  2345 00000DF8 E8CE35                   call expect
  2346 00000DFB 83C402                   add  sp, 2
  2347                                  
  2348                                  ;-260   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2349                                  
  2350 00000DFE B80000                   mov ax, 0
  2351 00000E01 8946FE                   mov [bp-2], ax
  2352 00000E04 B80000                   mov ax, 0
  2353 00000E07 A3[2600]                 mov word [nreturn], ax
  2354 00000E0A B80000                   mov ax, 0
  2355 00000E0D A3[2400]                 mov word [nconst], ax
  2356 00000E10 B80000                   mov ax, 0
  2357 00000E13 8946FC                   mov [bp-4], ax
  2358                                  
  2359                                  ;-261   while(isvariable()) {
  2360                                  
  2361                                  .dofunc106:
  2362 00000E16 E8C101                   call isvariable
  2363 00000E19 08C0                     or  al, al
  2364 00000E1B 0F849200                 je .dofunc107
  2365                                  
  2366                                  ;-262     do {typeName();
  2367                                  
  2368                                  .dofunc108:
  2369 00000E1F E808FC                   call typeName
  2370                                  
  2371                                  ;-263         checknamelen();
  2372                                  
  2373 00000E22 E87DF5                   call checknamelen
  2374                                  
  2375                                  ;-264         addlocal(); nloc-=2;
  2376                                  
  2377 00000E25 E810FE                   call addlocal
  2378 00000E28 836EFE02                 sub  word[bp-2], 2
  2379                                  
  2380                                  ;-265         if (iswidth == 4) nloc-=2;
  2381                                  
  2382 00000E2C A0[3800]                 mov al, [iswidth]
  2383 00000E2F 3C04                     cmp al, 4
  2384 00000E31 0F850400                 jne .dofunc109
  2385 00000E35 836EFE02                 sub  word[bp-2], 2
  2386                                  
  2387                                  ;-266         GData[LTop]=nloc;
  2388                                  
  2389                                  .dofunc109:
  2390 00000E39 8B46FE                   mov ax, [bp-2]
  2391 00000E3C 8B1E[2C00]               mov bx, [LTop]
  2392 00000E40 D1E3                     shl bx, 1
  2393 00000E42 8987EB8A                 mov [GData+bx], ax
  2394                                  
  2395                                  ;-267         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2396                                  
  2397 00000E46 6A5B                     push 91
  2398 00000E48 E85C35                   call istoken
  2399 00000E4B 83C402                   add  sp, 2
  2400 00000E4E 08C0                     or  al, al
  2401 00000E50 0F843D00                 je .dofunc110
  2402 00000E54 B82600                   mov ax, 38
  2403 00000E57 A2[3200]                 mov byte [istype], al
  2404 00000E5A B82600                   mov ax, 38
  2405 00000E5D 8B1E[2C00]               mov bx, [LTop]
  2406 00000E61 8887B782                 mov [GType+bx], al
  2407 00000E65 680101                   push 257
  2408 00000E68 E85E35                   call expect
  2409 00000E6B 83C402                   add  sp, 2
  2410 00000E6E 6A5D                     push 93
  2411 00000E70 E85635                   call expect
  2412 00000E73 83C402                   add  sp, 2
  2413                                  
  2414                                  ;-268             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2415                                  
  2416 00000E76 8B46FE                   mov ax, [bp-2]
  2417 00000E79 2B06[2E00]               sub ax, [lexval]
  2418 00000E7D 8946FE                   mov [bp-2], ax
  2419 00000E80 8346FE02                 add  word[bp-2], 2
  2420 00000E84 8B46FE                   mov ax, [bp-2]
  2421 00000E87 8B1E[2C00]               mov bx, [LTop]
  2422 00000E8B D1E3                     shl bx, 1
  2423 00000E8D 8987EB8A                 mov [GData+bx], ax
  2424                                  
  2425                                  ;-269         LTop++;
  2426                                  
  2427                                  .dofunc110:
  2428 00000E91 FF06[2C00]               inc  word[LTop]
  2429                                  
  2430                                  ;-270       } while (istoken(',')); expect(';'); }
  2431                                  
  2432 00000E95 6A2C                     push 44
  2433 00000E97 E80D35                   call istoken
  2434 00000E9A 83C402                   add  sp, 2
  2435 00000E9D 08C0                     or  al, al
  2436 00000E9F 0F840300                 je .dofunc111
  2437 00000EA3 E979FF                   jmp .dofunc108
  2438                                  .dofunc111:
  2439 00000EA6 6A3B                     push 59
  2440 00000EA8 E81E35                   call expect
  2441 00000EAB 83C402                   add  sp, 2
  2442                                  
  2443                                  ;-271   listproc(); 
  2444                                  
  2445 00000EAE E965FF                   jmp .dofunc106
  2446                                  .dofunc107:
  2447 00000EB1 E8103A                   call listproc
  2448                                  
  2449                                  ;-272   if (LTop>LSTART){prs(";\n ENTER  "); 
  2450                                  
  2451 00000EB4 A1[2C00]                 mov ax, [LTop]
  2452 00000EB7 3DC800                   cmp ax, 200
  2453 00000EBA 0F8E2700                 jle .dofunc112
  2454 00000EBE 68[AD0F]                 push dofunc_3
  2455 00000EC1 E81836                   call prs
  2456 00000EC4 83C402                   add  sp, 2
  2457                                  
  2458                                  ;-273     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  2459                                  
  2460 00000EC7 FF76FE                   push word [bp-2]
  2461 00000ECA E8F5F1                   call mkneg
  2462 00000ECD 83C402                   add  sp, 2
  2463 00000ED0 8946FE                   mov [bp-2], ax
  2464 00000ED3 FF76FE                   push word [bp-2]
  2465 00000ED6 E85837                   call prunsign1
  2466 00000ED9 83C402                   add  sp, 2
  2467 00000EDC 68[B90F]                 push dofunc_4
  2468 00000EDF E8FA35                   call prs
  2469 00000EE2 83C402                   add  sp, 2
  2470                                  
  2471                                  ;-274   while(istoken('}')==0)   stmt();
  2472                                  
  2473                                  .dofunc112:
  2474                                  .dofunc113:
  2475 00000EE5 6A7D                     push 125
  2476 00000EE7 E8BD34                   call istoken
  2477 00000EEA 83C402                   add  sp, 2
  2478 00000EED 83F800                   cmp ax, 0
  2479 00000EF0 0F850500                 jne .dofunc114
  2480 00000EF4 E81528                   call stmt
  2481                                  
  2482                                  ;-275   if (nreturn) { 
  2483                                  
  2484 00000EF7 EBEC                     jmp .dofunc113
  2485                                  .dofunc114:
  2486 00000EF9 A1[2600]                 mov ax, [nreturn]
  2487 00000EFC 08C0                     or  al, al
  2488 00000EFE 0F841C00                 je .dofunc115
  2489                                  
  2490                                  ;-276         prs("\n .retn");
  2491                                  
  2492 00000F02 68[BC0F]                 push dofunc_5
  2493 00000F05 E8D435                   call prs
  2494 00000F08 83C402                   add  sp, 2
  2495                                  
  2496                                  ;-277         prs(fname);
  2497                                  
  2498 00000F0B 8D06AB81                 lea  ax, [fname]
  2499 00000F0F 50                       push ax
  2500 00000F10 E8C935                   call prs
  2501 00000F13 83C402                   add  sp, 2
  2502                                  
  2503                                  ;-278         prc(':');
  2504                                  
  2505 00000F16 6A3A                     push 58
  2506 00000F18 E85A35                   call prc
  2507 00000F1B 83C402                   add  sp, 2
  2508                                  
  2509                                  ;-279         }
  2510                                  
  2511                                  
  2512                                  ;-280   if (LTop > LSTART) prs(" LEAVE");
  2513                                  
  2514                                  .dofunc115:
  2515 00000F1E A1[2C00]                 mov ax, [LTop]
  2516 00000F21 3DC800                   cmp ax, 200
  2517 00000F24 0F8E0900                 jle .dofunc116
  2518 00000F28 68[C50F]                 push dofunc_6
  2519 00000F2B E8AE35                   call prs
  2520 00000F2E 83C402                   add  sp, 2
  2521                                  
  2522                                  ;-281   prs("\n ret"); 
  2523                                  
  2524                                  .dofunc116:
  2525 00000F31 68[CC0F]                 push dofunc_7
  2526 00000F34 E8A535                   call prs
  2527 00000F37 83C402                   add  sp, 2
  2528                                  
  2529                                  ;-282   *cloc=0; prs(co); 
  2530                                  
  2531 00000F3A B80000                   mov ax, 0
  2532 00000F3D 8B1E[1600]               mov  bx, [cloc]
  2533 00000F41 8807                     mov  [bx], al
  2534 00000F43 8D063075                 lea  ax, [co]
  2535 00000F47 50                       push ax
  2536 00000F48 E89135                   call prs
  2537 00000F4B 83C402                   add  sp, 2
  2538                                  
  2539                                  ;-283   maxco1=strlen(co);
  2540                                  
  2541 00000F4E 8D063075                 lea  ax, [co]
  2542 00000F52 50                       push ax
  2543 00000F53 E8E8F1                   call strlen
  2544 00000F56 83C402                   add  sp, 2
  2545 00000F59 A3[1400]                 mov word [maxco1], ax
  2546                                  
  2547                                  ;-284   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2548                                  
  2549 00000F5C A1[1400]                 mov ax, [maxco1]
  2550 00000F5F 3B06[1200]               cmp ax, [maxco]
  2551 00000F63 0F8E1600                 jle .dofunc117
  2552 00000F67 A1[1400]                 mov ax, [maxco1]
  2553 00000F6A A3[1200]                 mov word [maxco], ax
  2554 00000F6D 8D06AB81                 lea  ax, [fname]
  2555 00000F71 50                       push ax
  2556 00000F72 8D06E880                 lea  ax, [coname]
  2557 00000F76 50                       push ax
  2558 00000F77 E8ECF1                   call strcpy
  2559 00000F7A 83C404                   add  sp, 4
  2560                                  
  2561                                  ;-285   prs("\nENDP"); 
  2562                                  
  2563                                  .dofunc117:
  2564 00000F7D 68[D30F]                 push dofunc_8
  2565 00000F80 E85935                   call prs
  2566 00000F83 83C402                   add  sp, 2
  2567                                  
  2568                                  ;-286 }
  2569                                  
  2570                                  
  2571                                  ;-287 int isvariable() {
  2572 00000F86 C9                       LEAVE
  2573 00000F87 C3                       ret
  2574 00000F88 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2575 00000F91 616C72656164792064-
  2576 00000F9A 6566696E656400     
  2577 00000FA1 5C6E5C6E00              dofunc_1 db "\n\n",0
  2578 00000FA6 3A2050524F4300          dofunc_2 db ": PROC",0
  2579 00000FAD 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2580 00000FB6 202000             
  2581 00000FB9 2C3000                  dofunc_4 db ",0",0
  2582 00000FBC 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  2583 00000FC5 204C4541564500          dofunc_6 db " LEAVE",0
  2584 00000FCC 5C6E2072657400          dofunc_7 db "\n ret",0
  2585 00000FD3 5C6E454E445000          dofunc_8 db "\nENDP",0
  2586                                  ENDP
  2587                                  
  2588                                  isvariable: PROC
  2589                                  
  2590                                  ;-288     if(token==T_SIGNED)   goto v1;   
  2591                                  
  2592 00000FDA A1[1C00]                 mov ax, [token]
  2593 00000FDD 3D1302                   cmp ax, 531
  2594 00000FE0 0F850300                 jne .isvariable118
  2595 00000FE4 E93A00                   jmp .v1
  2596                                  
  2597                                  ;-289     if(token==T_UNSIGNED) goto v1;
  2598                                  
  2599                                  .isvariable118:
  2600 00000FE7 A1[1C00]                 mov ax, [token]
  2601 00000FEA 3D1402                   cmp ax, 532
  2602 00000FED 0F850300                 jne .isvariable119
  2603 00000FF1 E92D00                   jmp .v1
  2604                                  
  2605                                  ;-290     if(token==T_CHAR)     goto v1;   
  2606                                  
  2607                                  .isvariable119:
  2608 00000FF4 A1[1C00]                 mov ax, [token]
  2609 00000FF7 3D1202                   cmp ax, 530
  2610 00000FFA 0F850300                 jne .isvariable120
  2611 00000FFE E92000                   jmp .v1
  2612                                  
  2613                                  ;-291     if(token==T_INT)      goto v1;
  2614                                  
  2615                                  .isvariable120:
  2616 00001001 A1[1C00]                 mov ax, [token]
  2617 00001004 3D0502                   cmp ax, 517
  2618 00001007 0F850300                 jne .isvariable121
  2619 0000100B E91300                   jmp .v1
  2620                                  
  2621                                  ;-292     if(token==T_LONG)     goto v1;
  2622                                  
  2623                                  .isvariable121:
  2624 0000100E A1[1C00]                 mov ax, [token]
  2625 00001011 3D1502                   cmp ax, 533
  2626 00001014 0F850300                 jne .isvariable122
  2627 00001018 E90600                   jmp .v1
  2628                                  
  2629                                  ;-293     return 0;  
  2630                                  
  2631                                  .isvariable122:
  2632 0000101B B80000                   mov ax, 0
  2633 0000101E E90600                   jmp .retnisvariable
  2634                                  
  2635                                  ;-294 v1: return 1;
  2636                                  
  2637                                  .v1:
  2638 00001021 B80100                   mov ax, 1
  2639 00001024 E90000                   jmp .retnisvariable
  2640                                  
  2641                                  ;-295 }
  2642                                  
  2643                                  
  2644                                  ;-296                   
  2645                                  
  2646                                  
  2647                                  ;-297 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2648                                  
  2649                                   .retnisvariable:
  2650 00001027 C3                       ret
  2651                                  ENDP
  2652 00001028 0000                    mod1 dw 0
  2653 0000102A 0000                    ireg1 dw 0
  2654 0000102C 0000                    idx1 dw 0
  2655 0000102E 0000                    ids1 dw 0
  2656 00001030 0000                    idw1 dw 0
  2657 00001032 0000                    idt1 dw 0
  2658 00001034 0000                    val1 dw 0
  2659                                  
  2660                                  ;-298 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2661                                  
  2662 00001036 0000                    mod2 dw 0
  2663 00001038 0000                    ireg2 dw 0
  2664 0000103A 0000                    idx2 dw 0
  2665 0000103C 0000                    ids2 dw 0
  2666 0000103E 0000                    idw2 dw 0
  2667 00001040 0000                    idt2 dw 0
  2668 00001042 0000                    val2 dw 0
  2669                                  
  2670                                  ;-299 
  2671                                  
  2672                                  
  2673                                  ;-300 int pexpr() {expect('('); iscmp=0; 
  2674                                  
  2675                                  
  2676                                  pexpr: PROC
  2677 00001044 6A28                     push 40
  2678 00001046 E88033                   call expect
  2679 00001049 83C402                   add  sp, 2
  2680 0000104C B80000                   mov ax, 0
  2681 0000104F A3[2200]                 mov word [iscmp], ax
  2682                                  
  2683                                  ;-301   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2684                                  
  2685 00001052 A1[1C00]                 mov ax, [token]
  2686 00001055 3D0001                   cmp ax, 256
  2687 00001058 0F853400                 jne .pexpr123
  2688 0000105C 68[BA10]                 push pexpr_0
  2689 0000105F 8D062B81                 lea  ax, [symbol]
  2690 00001063 50                       push ax
  2691 00001064 E82FF1                   call eqstr
  2692 00001067 83C404                   add  sp, 4
  2693 0000106A 08C0                     or  al, al
  2694 0000106C 0F840600                 je .pexpr124
  2695 00001070 E85E00                   call constantexpr
  2696 00001073 E94300                   jmp .retnpexpr
  2697                                  
  2698                                  ;-302     ireg1=checkreg();
  2699                                  
  2700                                  .pexpr124:
  2701 00001076 E89A07                   call checkreg
  2702 00001079 A3[2A10]                 mov word [ireg1], ax
  2703                                  
  2704                                  ;-303     if (ireg1) { doreg1(1); return; }  }
  2705                                  
  2706 0000107C A1[2A10]                 mov ax, [ireg1]
  2707 0000107F 08C0                     or  al, al
  2708 00001081 0F840B00                 je .pexpr125
  2709 00001085 6A01                     push 1
  2710 00001087 E89D05                   call doreg1
  2711 0000108A 83C402                   add  sp, 2
  2712 0000108D E92900                   jmp .retnpexpr
  2713                                  .pexpr125:
  2714                                  
  2715                                  ;-304   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2716                                  
  2717                                  .pexpr123:
  2718 00001090 E83D01                   call exprstart
  2719 00001093 A1[2200]                 mov ax, [iscmp]
  2720 00001096 83F800                   cmp ax, 0
  2721 00001099 0F850900                 jne .pexpr126
  2722 0000109D 68[BC10]                 push pexpr_1
  2723 000010A0 E83934                   call prs
  2724 000010A3 83C402                   add  sp, 2
  2725                                  .pexpr126:
  2726 000010A6 8D06AB81                 lea  ax, [fname]
  2727 000010AA 50                       push ax
  2728 000010AB E82E34                   call prs
  2729 000010AE 83C402                   add  sp, 2
  2730                                  
  2731                                  ;-305   expect(')'); }           /*error1("Vergleich fehlt");*/
  2732                                  
  2733 000010B1 6A29                     push 41
  2734 000010B3 E81333                   call expect
  2735 000010B6 83C402                   add  sp, 2
  2736                                  
  2737                                  ;-306 
  2738                                  
  2739                                  
  2740                                  ;-307 int constantexpr() { int mode; int id1;int ids;
  2741                                  
  2742                                   .retnpexpr:
  2743 000010B9 C3                       ret
  2744 000010BA 5F00                    pexpr_0 db "_",0
  2745 000010BC 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2746 000010C5 2C20616C5C6E206A65-
  2747 000010CE 202E00             
  2748                                  ENDP
  2749                                  
  2750                                  constantexpr: PROC
  2751                                  
  2752                                  ;-308   token=getlex();   mode=typeName();  
  2753                                  
  2754                                  ;Function : constantexpr, Number of local variables: 3
  2755                                  ;   # type sign width addr used name   list of local variables
  2756                                  ;  200 var sign word   307 NULL mode = bp-2
  2757                                  ;  201 var sign word   307 NULL id1 = bp-4
  2758                                  ;  202 var sign word   307 NULL ids = bp-6;
  2759 000010D1 C8060000                 ENTER  6,0
  2760 000010D5 E8AB2B                   call getlex
  2761 000010D8 A3[1C00]                 mov word [token], ax
  2762 000010DB E84CF9                   call typeName
  2763 000010DE 8946FE                   mov [bp-2], ax
  2764                                  
  2765                                  ;-309   id1=searchname(); gettypes(id1); ids=signi;
  2766                                  
  2767 000010E1 E877F8                   call searchname
  2768 000010E4 8946FC                   mov [bp-4], ax
  2769 000010E7 FF76FC                   push word [bp-4]
  2770 000010EA E830F7                   call gettypes
  2771 000010ED 83C402                   add  sp, 2
  2772 000010F0 A1[3300]                 mov ax, [signi]
  2773 000010F3 8946FA                   mov [bp-6], ax
  2774                                  
  2775                                  ;-310   if (isrelational() ==0) error1("Relational expression expected");
  2776                                  
  2777 000010F6 E8232B                   call isrelational
  2778 000010F9 83F800                   cmp ax, 0
  2779 000010FC 0F850900                 jne .constantexpr127
  2780 00001100 68[8611]                 push constantexpr_0
  2781 00001103 E8BC36                   call error1
  2782 00001106 83C402                   add  sp, 2
  2783                                  
  2784                                  ;-311   expect(T_CONST);  prs(" ; constant expression");
  2785                                  
  2786                                  .constantexpr127:
  2787 00001109 680101                   push 257
  2788 0000110C E8BA32                   call expect
  2789 0000110F 83C402                   add  sp, 2
  2790 00001112 68[A511]                 push constantexpr_1
  2791 00001115 E8C433                   call prs
  2792 00001118 83C402                   add  sp, 2
  2793                                  
  2794                                  ;-312   prs("\ncmp "); 
  2795                                  
  2796 0000111B 68[BC11]                 push constantexpr_2
  2797 0000111E E8BB33                   call prs
  2798 00001121 83C402                   add  sp, 2
  2799                                  
  2800                                  ;-313   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2801                                  
  2802 00001124 FF76FC                   push word [bp-4]
  2803 00001127 E8F3F6                   call gettypes
  2804 0000112A 83C402                   add  sp, 2
  2805 0000112D A1[3900]                 mov ax, [wi]
  2806 00001130 83F802                   cmp ax, 2
  2807 00001133 0F850C00                 jne .constantexpr128
  2808 00001137 68[C311]                 push constantexpr_3
  2809 0000113A E89F33                   call prs
  2810 0000113D 83C402                   add  sp, 2
  2811 00001140 E90900                   jmp .constantexpr129
  2812                                  .constantexpr128:
  2813 00001143 68[C811]                 push constantexpr_4
  2814 00001146 E89333                   call prs
  2815 00001149 83C402                   add  sp, 2
  2816                                  
  2817                                  ;-314   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2818                                  
  2819                                  .constantexpr129:
  2820 0000114C FF76FC                   push word [bp-4]
  2821 0000114F E81DF2                   call v
  2822 00001152 83C402                   add  sp, 2
  2823 00001155 68[CD11]                 push constantexpr_5
  2824 00001158 E88133                   call prs
  2825 0000115B 83C402                   add  sp, 2
  2826 0000115E FF36[2E00]               push word [lexval]
  2827 00001162 E8CC34                   call prunsign1
  2828 00001165 83C402                   add  sp, 2
  2829 00001168 FF76FA                   push word [bp-6]
  2830 0000116B E8F027                   call cmpneg
  2831 0000116E 83C402                   add  sp, 2
  2832 00001171 8D06AB81                 lea  ax, [fname]
  2833 00001175 50                       push ax
  2834 00001176 E86333                   call prs
  2835 00001179 83C402                   add  sp, 2
  2836                                  
  2837                                  ;-315   expect(')');
  2838                                  
  2839 0000117C 6A29                     push 41
  2840 0000117E E84832                   call expect
  2841 00001181 83C402                   add  sp, 2
  2842                                  
  2843                                  ;-316 }  
  2844                                  
  2845                                  
  2846                                  ;-317 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2847 00001184 C9                       LEAVE
  2848 00001185 C3                       ret
  2849 00001186 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2850 0000118F 6C2065787072657373-
  2851 00001198 696F6E206578706563-
  2852 000011A1 74656400           
  2853 000011A5 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2854 000011AE 6E7420657870726573-
  2855 000011B7 73696F6E00         
  2856 000011BC 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2857 000011C3 776F726400              constantexpr_3 db "word",0
  2858 000011C8 6279746500              constantexpr_4 db "byte",0
  2859 000011CD 2C2000                  constantexpr_5 db ", ",0
  2860                                  ENDP
  2861                                  
  2862                                  exprstart: PROC
  2863 000011D0 68[F811]                 push exprstart_0
  2864 000011D3 8D062B81                 lea  ax, [symbol]
  2865 000011D7 50                       push ax
  2866 000011D8 E8BBEF                   call eqstr
  2867 000011DB 83C404                   add  sp, 4
  2868 000011DE 08C0                     or  al, al
  2869 000011E0 0F840B00                 je .exprstart130
  2870 000011E4 6A00                     push 0
  2871 000011E6 E81100                   call expr2
  2872 000011E9 83C402                   add  sp, 2
  2873 000011EC E90800                   jmp .exprstart131
  2874                                  .exprstart130:
  2875 000011EF 6A00                     push 0
  2876 000011F1 E89E0A                   call expr
  2877 000011F4 83C402                   add  sp, 2
  2878                                  .exprstart131:
  2879                                  
  2880                                  ;-318 
  2881                                  
  2882                                  
  2883                                  ;-319 int expr2(int kind) {  int i;
  2884                                  
  2885 000011F7 C3                       ret
  2886 000011F8 5F00                    exprstart_0 db "_",0
  2887                                  ENDP
  2888                                  
  2889                                  expr2: PROC
  2890                                  
  2891                                  ;-320   if(kind != 1) token=getlex();
  2892                                  
  2893                                  ;Function : expr2, Number of local variables: 2
  2894                                  ;   # type sign width addr used name   list of local variables
  2895                                  ;  200 var sign word   319 NULL kind = bp+4
  2896                                  ;  201 var sign word   319 NULL i = bp-2;
  2897 000011FA C8020000                 ENTER  2,0
  2898 000011FE 8B4604                   mov ax, [bp+4]
  2899 00001201 83F801                   cmp ax, 1
  2900 00001204 0F840600                 je  .expr2132
  2901 00001208 E8782A                   call getlex
  2902 0000120B A3[1C00]                 mov word [token], ax
  2903                                  
  2904                                  ;-321   mod1=typeName();
  2905                                  
  2906                                  .expr2132:
  2907 0000120E E819F8                   call typeName
  2908 00001211 A3[2810]                 mov word [mod1], ax
  2909                                  
  2910                                  ;-322   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2911                                  
  2912 00001214 A1[2810]                 mov ax, [mod1]
  2913 00001217 08C0                     or  al, al
  2914 00001219 0F840900                 je .expr2133
  2915 0000121D 68[B214]                 push expr2_0
  2916 00001220 E89F35                   call error1
  2917 00001223 83C402                   add  sp, 2
  2918                                  
  2919                                  ;-323   ireg1=checkreg();
  2920                                  
  2921                                  .expr2133:
  2922 00001226 E8EA05                   call checkreg
  2923 00001229 A3[2A10]                 mov word [ireg1], ax
  2924                                  
  2925                                  ;-324   if (ireg1) { doreg1(0); return; }
  2926                                  
  2927 0000122C A1[2A10]                 mov ax, [ireg1]
  2928 0000122F 08C0                     or  al, al
  2929 00001231 0F840B00                 je .expr2134
  2930 00001235 6A00                     push 0
  2931 00001237 E8ED03                   call doreg1
  2932 0000123A 83C402                   add  sp, 2
  2933 0000123D E97002                   jmp .retnexpr2
  2934                                  
  2935                                  ;-325   if (ireg1 == 0) { idx1=searchname();
  2936                                  
  2937                                  .expr2134:
  2938 00001240 A1[2A10]                 mov ax, [ireg1]
  2939 00001243 83F800                   cmp ax, 0
  2940 00001246 0F853400                 jne .expr2135
  2941 0000124A E80EF7                   call searchname
  2942 0000124D A3[2C10]                 mov word [idx1], ax
  2943                                  
  2944                                  ;-326     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2945                                  
  2946 00001250 FF36[2C10]               push word [idx1]
  2947 00001254 E8C6F5                   call gettypes
  2948 00001257 83C402                   add  sp, 2
  2949 0000125A A1[3300]                 mov ax, [signi]
  2950 0000125D A3[2E10]                 mov word [ids1], ax
  2951 00001260 A1[3900]                 mov ax, [wi]
  2952 00001263 A3[3010]                 mov word [idw1], ax
  2953 00001266 A1[3000]                 mov ax, [typei]
  2954 00001269 A3[3210]                 mov word [idt1], ax
  2955                                  
  2956                                  ;-327     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2957                                  
  2958 0000126C A1[3210]                 mov ax, [idt1]
  2959 0000126F 08C0                     or  al, al
  2960 00001271 0F840900                 je .expr2136
  2961 00001275 68[E114]                 push expr2_1
  2962 00001278 E84735                   call error1
  2963 0000127B 83C402                   add  sp, 2
  2964                                  .expr2136:
  2965                                  
  2966                                  ;-328   
  2967                                  
  2968                                  
  2969                                  ;-329   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2970                                  
  2971                                  .expr2135:
  2972 0000127E E89B29                   call isrelational
  2973 00001281 08C0                     or  al, al
  2974 00001283 0F840900                 je .expr2137
  2975 00001287 68[0C15]                 push expr2_2
  2976 0000128A E83535                   call error1
  2977 0000128D 83C402                   add  sp, 2
  2978                                  
  2979                                  ;-330   }
  2980                                  
  2981                                  
  2982                                  ;-331   if (istoken('=') == 0) error1("Assign expected");
  2983                                  
  2984                                  .expr2137:
  2985 00001290 6A3D                     push 61
  2986 00001292 E81231                   call istoken
  2987 00001295 83C402                   add  sp, 2
  2988 00001298 83F800                   cmp ax, 0
  2989 0000129B 0F850900                 jne .expr2138
  2990 0000129F 68[2F15]                 push expr2_3
  2991 000012A2 E81D35                   call error1
  2992 000012A5 83C402                   add  sp, 2
  2993                                  
  2994                                  ;-332   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2995                                  
  2996                                  .expr2138:
  2997 000012A8 680101                   push 257
  2998 000012AB E8F930                   call istoken
  2999 000012AE 83C402                   add  sp, 2
  3000 000012B1 08C0                     or  al, al
  3001 000012B3 0F849A00                 je .expr2139
  3002 000012B7 A1[2E00]                 mov ax, [lexval]
  3003 000012BA A3[4210]                 mov word [val2], ax
  3004 000012BD 68[3F15]                 push expr2_4
  3005 000012C0 E81932                   call prs
  3006 000012C3 83C402                   add  sp, 2
  3007                                  
  3008                                  ;-333     prs("\nmov ");
  3009                                  
  3010 000012C6 68[5615]                 push expr2_5
  3011 000012C9 E81032                   call prs
  3012 000012CC 83C402                   add  sp, 2
  3013                                  
  3014                                  ;-334     if (idw1 == 1) prs("byte ");
  3015                                  
  3016 000012CF A1[3010]                 mov ax, [idw1]
  3017 000012D2 83F801                   cmp ax, 1
  3018 000012D5 0F850900                 jne .expr2140
  3019 000012D9 68[5D15]                 push expr2_6
  3020 000012DC E8FD31                   call prs
  3021 000012DF 83C402                   add  sp, 2
  3022                                  
  3023                                  ;-335     if (idw1 == 2) prs("word ");
  3024                                  
  3025                                  .expr2140:
  3026 000012E2 A1[3010]                 mov ax, [idw1]
  3027 000012E5 83F802                   cmp ax, 2
  3028 000012E8 0F850900                 jne .expr2141
  3029 000012EC 68[6315]                 push expr2_7
  3030 000012EF E8EA31                   call prs
  3031 000012F2 83C402                   add  sp, 2
  3032                                  
  3033                                  ;-336     if (idw1 == 4) prs("dword ");
  3034                                  
  3035                                  .expr2141:
  3036 000012F5 A1[3010]                 mov ax, [idw1]
  3037 000012F8 83F804                   cmp ax, 4
  3038 000012FB 0F850900                 jne .expr2142
  3039 000012FF 68[6915]                 push expr2_8
  3040 00001302 E8D731                   call prs
  3041 00001305 83C402                   add  sp, 2
  3042                                  
  3043                                  ;-337     v(idx1);
  3044                                  
  3045                                  .expr2142:
  3046 00001308 FF36[2C10]               push word [idx1]
  3047 0000130C E860F0                   call v
  3048 0000130F 83C402                   add  sp, 2
  3049                                  
  3050                                  ;-338     prs(", "); prunsign1(val2);
  3051                                  
  3052 00001312 68[7015]                 push expr2_9
  3053 00001315 E8C431                   call prs
  3054 00001318 83C402                   add  sp, 2
  3055 0000131B FF36[4210]               push word [val2]
  3056 0000131F E80F33                   call prunsign1
  3057 00001322 83C402                   add  sp, 2
  3058                                  
  3059                                  ;-339     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3060                                  
  3061 00001325 A1[2C10]                 mov ax, [idx1]
  3062 00001328 3DC800                   cmp ax, 200 ;unsigned : 1
  3063 0000132B 0F8C1F00                 jl  .expr2143
  3064 0000132F FF36[2C10]               push word [idx1]
  3065 00001333 E89EF5                   call adrofname
  3066 00001336 83C402                   add  sp, 2
  3067 00001339 8946FE                   mov [bp-2], ax
  3068 0000133C 68[7315]                 push expr2_10
  3069 0000133F E89A31                   call prs
  3070 00001342 83C402                   add  sp, 2
  3071 00001345 FF76FE                   push word [bp-2]
  3072 00001348 E89131                   call prs
  3073 0000134B 83C402                   add  sp, 2
  3074                                  .expr2143:
  3075 0000134E E95F01                   jmp .retnexpr2
  3076                                  
  3077                                  ;-340   
  3078                                  
  3079                                  
  3080                                  ;-341   mod1=typeName(); ireg2=checkreg();
  3081                                  
  3082                                  .expr2139:
  3083 00001351 E8D6F6                   call typeName
  3084 00001354 A3[2810]                 mov word [mod1], ax
  3085 00001357 E8B904                   call checkreg
  3086 0000135A A3[3810]                 mov word [ireg2], ax
  3087                                  
  3088                                  ;-342   if (ireg2) { prs("\nmov ");
  3089                                  
  3090 0000135D A1[3810]                 mov ax, [ireg2]
  3091 00001360 08C0                     or  al, al
  3092 00001362 0F844200                 je .expr2144
  3093 00001366 68[7615]                 push expr2_11
  3094 00001369 E87031                   call prs
  3095 0000136C 83C402                   add  sp, 2
  3096                                  
  3097                                  ;-343     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3098                                  
  3099 0000136F A1[2A10]                 mov ax, [ireg1]
  3100 00001372 08C0                     or  al, al
  3101 00001374 0F840D00                 je .expr2145
  3102 00001378 FF36[2A10]               push word [ireg1]
  3103 0000137C E8A208                   call printreg
  3104 0000137F 83C402                   add  sp, 2
  3105 00001382 E90A00                   jmp .expr2146
  3106                                  .expr2145:
  3107 00001385 FF36[2C10]               push word [idx1]
  3108 00001389 E8E3EF                   call v
  3109 0000138C 83C402                   add  sp, 2
  3110                                  .expr2146:
  3111 0000138F 68[7D15]                 push expr2_12
  3112 00001392 E84731                   call prs
  3113 00001395 83C402                   add  sp, 2
  3114 00001398 FF36[3810]               push word [ireg2]
  3115 0000139C E88208                   call printreg
  3116 0000139F 83C402                   add  sp, 2
  3117 000013A2 E90B01                   jmp .retnexpr2
  3118                                  
  3119                                  ;-344   else {
  3120                                  
  3121 000013A5 E9FF00                   jmp .expr2147
  3122                                  .expr2144:
  3123                                  
  3124                                  ;-345     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3125                                  
  3126 000013A8 A1[2810]                 mov ax, [mod1]
  3127 000013AB 83F801                   cmp ax, 1
  3128 000013AE 0F850900                 jne .expr2148
  3129 000013B2 68[8015]                 push expr2_13
  3130 000013B5 E80A34                   call error1
  3131 000013B8 83C402                   add  sp, 2
  3132                                  
  3133                                  ;-346     
  3134                                  
  3135                                  
  3136                                  ;-347     idx2=searchname();
  3137                                  
  3138                                  .expr2148:
  3139 000013BB E89DF5                   call searchname
  3140 000013BE A3[3A10]                 mov word [idx2], ax
  3141                                  
  3142                                  ;-348     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3143                                  
  3144 000013C1 FF36[3A10]               push word [idx2]
  3145 000013C5 E855F4                   call gettypes
  3146 000013C8 83C402                   add  sp, 2
  3147 000013CB A1[3300]                 mov ax, [signi]
  3148 000013CE A3[3C10]                 mov word [ids2], ax
  3149 000013D1 A1[3900]                 mov ax, [wi]
  3150 000013D4 A3[3E10]                 mov word [idw2], ax
  3151 000013D7 A1[3000]                 mov ax, [typei]
  3152 000013DA A3[4010]                 mov word [idt2], ax
  3153                                  
  3154                                  ;-349     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3155                                  
  3156 000013DD A1[4010]                 mov ax, [idt2]
  3157 000013E0 83F801                   cmp ax, 1
  3158 000013E3 0F850900                 jne .expr2149
  3159 000013E7 68[9C15]                 push expr2_14
  3160 000013EA E8D533                   call error1
  3161 000013ED 83C402                   add  sp, 2
  3162                                  
  3163                                  ;-350     prs("\nmov ");
  3164                                  
  3165                                  .expr2149:
  3166 000013F0 68[BB15]                 push expr2_15
  3167 000013F3 E8E630                   call prs
  3168 000013F6 83C402                   add  sp, 2
  3169                                  
  3170                                  ;-351     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3171                                  
  3172 000013F9 A1[2A10]                 mov ax, [ireg1]
  3173 000013FC 08C0                     or  al, al
  3174 000013FE 0F840D00                 je .expr2150
  3175 00001402 FF36[2A10]               push word [ireg1]
  3176 00001406 E81808                   call printreg
  3177 00001409 83C402                   add  sp, 2
  3178 0000140C E90900                   jmp .expr2151
  3179                                  .expr2150:
  3180 0000140F 68[C215]                 push expr2_16
  3181 00001412 E8AD33                   call error1
  3182 00001415 83C402                   add  sp, 2
  3183                                  
  3184                                  ;-352     prs(", ");
  3185                                  
  3186                                  .expr2151:
  3187 00001418 68[E415]                 push expr2_17
  3188 0000141B E8BE30                   call prs
  3189 0000141E 83C402                   add  sp, 2
  3190                                  
  3191                                  ;-353     if (mod1 == 2) a(idx2);
  3192                                  
  3193 00001421 A1[2810]                 mov ax, [mod1]
  3194 00001424 83F802                   cmp ax, 2
  3195 00001427 0F850D00                 jne .expr2152
  3196 0000142B FF36[3A10]               push word [idx2]
  3197 0000142F E82EEF                   call a
  3198 00001432 83C402                   add  sp, 2
  3199                                  
  3200                                  ;-354     else {
  3201                                  
  3202 00001435 E96C00                   jmp .expr2153
  3203                                  .expr2152:
  3204                                  
  3205                                  ;-355       if (idw2 == 1) prs("byte ");
  3206                                  
  3207 00001438 A1[3E10]                 mov ax, [idw2]
  3208 0000143B 83F801                   cmp ax, 1
  3209 0000143E 0F850900                 jne .expr2154
  3210 00001442 68[E715]                 push expr2_18
  3211 00001445 E89430                   call prs
  3212 00001448 83C402                   add  sp, 2
  3213                                  
  3214                                  ;-356       if (idw2 == 2) prs("word ");
  3215                                  
  3216                                  .expr2154:
  3217 0000144B A1[3E10]                 mov ax, [idw2]
  3218 0000144E 83F802                   cmp ax, 2
  3219 00001451 0F850900                 jne .expr2155
  3220 00001455 68[ED15]                 push expr2_19
  3221 00001458 E88130                   call prs
  3222 0000145B 83C402                   add  sp, 2
  3223                                  
  3224                                  ;-357       if (idw2 == 4) prs("dword ");
  3225                                  
  3226                                  .expr2155:
  3227 0000145E A1[3E10]                 mov ax, [idw2]
  3228 00001461 83F804                   cmp ax, 4
  3229 00001464 0F850900                 jne .expr2156
  3230 00001468 68[F315]                 push expr2_20
  3231 0000146B E86E30                   call prs
  3232 0000146E 83C402                   add  sp, 2
  3233                                  
  3234                                  ;-358       v(idx2);
  3235                                  
  3236                                  .expr2156:
  3237 00001471 FF36[3A10]               push word [idx2]
  3238 00001475 E8F7EE                   call v
  3239 00001478 83C402                   add  sp, 2
  3240                                  
  3241                                  ;-359       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3242                                  
  3243 0000147B A1[3A10]                 mov ax, [idx2]
  3244 0000147E 3DC800                   cmp ax, 200 ;unsigned : 1
  3245 00001481 0F8C1F00                 jl  .expr2157
  3246 00001485 FF36[3A10]               push word [idx2]
  3247 00001489 E848F4                   call adrofname
  3248 0000148C 83C402                   add  sp, 2
  3249 0000148F 8946FE                   mov [bp-2], ax
  3250 00001492 68[FA15]                 push expr2_21
  3251 00001495 E84430                   call prs
  3252 00001498 83C402                   add  sp, 2
  3253 0000149B FF76FE                   push word [bp-2]
  3254 0000149E E83B30                   call prs
  3255 000014A1 83C402                   add  sp, 2
  3256                                  .expr2157:
  3257                                  
  3258                                  ;-360     return;
  3259                                  
  3260                                  .expr2153:
  3261 000014A4 E90900                   jmp .retnexpr2
  3262                                  
  3263                                  ;-361   } error1("Internal error: only const or reg allowed");
  3264                                  
  3265                                  .expr2147:
  3266 000014A7 68[FD15]                 push expr2_22
  3267 000014AA E81533                   call error1
  3268 000014AD 83C402                   add  sp, 2
  3269                                  
  3270                                  ;-362 }
  3271                                  
  3272                                  
  3273                                  ;-363 char ops[5];
  3274                                  
  3275 000014B0 C9                       .retnexpr2: LEAVE
  3276 000014B1 C3                       ret
  3277 000014B2 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3278 000014BB 202620756E64202A20-
  3279 000014C4 696D20546578742028-
  3280 000014CD 4C696E6B652048616E-
  3281 000014D6 64292065726C617562-
  3282 000014DF 7400               
  3283 000014E1 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3284 000014EA 204172726179206F64-
  3285 000014F3 657220506F696E7465-
  3286 000014FC 72206C696E6B732065-
  3287 00001505 726C6175627400     
  3288 0000150C 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3289 00001515 206E6F6368206E6963-
  3290 0000151E 687420696D706C656D-
  3291 00001527 656E746965727400   
  3292 0000152F 41737369676E206578-     expr2_3 db "Assign expected",0
  3293 00001538 70656374656400     
  3294 0000153F 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3295 00001548 6E7420657870726573-
  3296 00001551 73696F6E00         
  3297 00001556 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3298 0000155D 627974652000            expr2_6 db "byte ",0
  3299 00001563 776F72642000            expr2_7 db "word ",0
  3300 00001569 64776F72642000          expr2_8 db "dword ",0
  3301 00001570 2C2000                  expr2_9 db ", ",0
  3302 00001573 3B2000                  expr2_10 db "; ",0
  3303 00001576 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3304 0000157D 2C2000                  expr2_12 db ", ",0
  3305 00001580 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3306 00001589 202A20696D20546578-
  3307 00001592 742065726C61756274-
  3308 0000159B 00                 
  3309 0000159C 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3310 000015A5 204172726179207265-
  3311 000015AE 636874732065726C61-
  3312 000015B7 75627400           
  3313 000015BB 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3314 000015C2 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3315 000015CB 6D206E6F7420616C6C-
  3316 000015D4 6F7765642062792078-
  3317 000015DD 38362D43505500     
  3318 000015E4 2C2000                  expr2_17 db ", ",0
  3319 000015E7 627974652000            expr2_18 db "byte ",0
  3320 000015ED 776F72642000            expr2_19 db "word ",0
  3321 000015F3 64776F72642000          expr2_20 db "dword ",0
  3322 000015FA 3B2000                  expr2_21 db "; ",0
  3323 000015FD 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3324 00001606 6572726F723A206F6E-
  3325 0000160F 6C7920636F6E737420-
  3326 00001618 6F722072656720616C-
  3327 00001621 6C6F77656400       
  3328                                  ENDP
  3329                                  section .bss
  3330                                  absolute 53406
  3331 0000D09E <res 00000005>          ops resb 5
  3332                                  section .text
  3333                                  
  3334                                  ;-364 int doreg1(int iscmp1) { int i;
  3335                                  
  3336                                  
  3337                                  doreg1: PROC
  3338                                  
  3339                                  ;-365   if (istoken('='))          strcpy(ops, "mov");
  3340                                  
  3341                                  ;Function : doreg1, Number of local variables: 2
  3342                                  ;   # type sign width addr used name   list of local variables
  3343                                  ;  200 var sign word   364 NULL iscmp1 = bp+4
  3344                                  ;  201 var sign word   364 NULL i = bp-2;
  3345 00001627 C8020000                 ENTER  2,0
  3346 0000162B 6A3D                     push 61
  3347 0000162D E8772D                   call istoken
  3348 00001630 83C402                   add  sp, 2
  3349 00001633 08C0                     or  al, al
  3350 00001635 0F840E00                 je .doreg1158
  3351 00001639 68[DA17]                 push doreg1_0
  3352 0000163C 8D069ED0                 lea  ax, [ops]
  3353 00001640 50                       push ax
  3354 00001641 E822EB                   call strcpy
  3355 00001644 83C404                   add  sp, 4
  3356                                  
  3357                                  ;-366   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3358                                  
  3359                                  .doreg1158:
  3360 00001647 68CE04                   push 1230
  3361 0000164A E85A2D                   call istoken
  3362 0000164D 83C402                   add  sp, 2
  3363 00001650 08C0                     or  al, al
  3364 00001652 0F840E00                 je .doreg1159
  3365 00001656 68[DE17]                 push doreg1_1
  3366 00001659 8D069ED0                 lea  ax, [ops]
  3367 0000165D 50                       push ax
  3368 0000165E E805EB                   call strcpy
  3369 00001661 83C404                   add  sp, 4
  3370                                  
  3371                                  ;-367   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3372                                  
  3373                                  .doreg1159:
  3374 00001664 68CF04                   push 1231
  3375 00001667 E83D2D                   call istoken
  3376 0000166A 83C402                   add  sp, 2
  3377 0000166D 08C0                     or  al, al
  3378 0000166F 0F840E00                 je .doreg1160
  3379 00001673 68[E217]                 push doreg1_2
  3380 00001676 8D069ED0                 lea  ax, [ops]
  3381 0000167A 50                       push ax
  3382 0000167B E8E8EA                   call strcpy
  3383 0000167E 83C404                   add  sp, 4
  3384                                  
  3385                                  ;-368   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3386                                  
  3387                                  .doreg1160:
  3388 00001681 68D204                   push 1234
  3389 00001684 E8202D                   call istoken
  3390 00001687 83C402                   add  sp, 2
  3391 0000168A 08C0                     or  al, al
  3392 0000168C 0F840E00                 je .doreg1161
  3393 00001690 68[E617]                 push doreg1_3
  3394 00001693 8D069ED0                 lea  ax, [ops]
  3395 00001697 50                       push ax
  3396 00001698 E8CBEA                   call strcpy
  3397 0000169B 83C404                   add  sp, 4
  3398                                  
  3399                                  ;-369   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3400                                  
  3401                                  .doreg1161:
  3402 0000169E 68D304                   push 1235
  3403 000016A1 E8032D                   call istoken
  3404 000016A4 83C402                   add  sp, 2
  3405 000016A7 08C0                     or  al, al
  3406 000016A9 0F840E00                 je .doreg1162
  3407 000016AD 68[EA17]                 push doreg1_4
  3408 000016B0 8D069ED0                 lea  ax, [ops]
  3409 000016B4 50                       push ax
  3410 000016B5 E8AEEA                   call strcpy
  3411 000016B8 83C404                   add  sp, 4
  3412                                  
  3413                                  ;-370   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3414                                  
  3415                                  .doreg1162:
  3416 000016BB 68D804                   push 1240
  3417 000016BE E8E62C                   call istoken
  3418 000016C1 83C402                   add  sp, 2
  3419 000016C4 08C0                     or  al, al
  3420 000016C6 0F840E00                 je .doreg1163
  3421 000016CA 68[ED17]                 push doreg1_5
  3422 000016CD 8D069ED0                 lea  ax, [ops]
  3423 000016D1 50                       push ax
  3424 000016D2 E891EA                   call strcpy
  3425 000016D5 83C404                   add  sp, 4
  3426                                  
  3427                                  ;-371   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3428                                  
  3429                                  .doreg1163:
  3430 000016D8 68D904                   push 1241
  3431 000016DB E8C92C                   call istoken
  3432 000016DE 83C402                   add  sp, 2
  3433 000016E1 08C0                     or  al, al
  3434 000016E3 0F840E00                 je .doreg1164
  3435 000016E7 68[F117]                 push doreg1_6
  3436 000016EA 8D069ED0                 lea  ax, [ops]
  3437 000016EE 50                       push ax
  3438 000016EF E874EA                   call strcpy
  3439 000016F2 83C404                   add  sp, 4
  3440                                  
  3441                                  ;-372   if (iscmp1 == 1) { token=getlex();
  3442                                  
  3443                                  .doreg1164:
  3444 000016F5 8B4604                   mov ax, [bp+4]
  3445 000016F8 83F801                   cmp ax, 1
  3446 000016FB 0F852700                 jne .doreg1165
  3447 000016FF E88125                   call getlex
  3448 00001702 A3[1C00]                 mov word [token], ax
  3449                                  
  3450                                  ;-373       if (isrelational() ==0) error1("Relational expected");
  3451                                  
  3452 00001705 E81425                   call isrelational
  3453 00001708 83F800                   cmp ax, 0
  3454 0000170B 0F850900                 jne .doreg1166
  3455 0000170F 68[F517]                 push doreg1_7
  3456 00001712 E8AD30                   call error1
  3457 00001715 83C402                   add  sp, 2
  3458                                  
  3459                                  ;-374       strcpy(ops, "cmp"); }
  3460                                  
  3461                                  .doreg1166:
  3462 00001718 68[0918]                 push doreg1_8
  3463 0000171B 8D069ED0                 lea  ax, [ops]
  3464 0000171F 50                       push ax
  3465 00001720 E843EA                   call strcpy
  3466 00001723 83C404                   add  sp, 4
  3467                                  
  3468                                  ;-375   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3469                                  
  3470                                  .doreg1165:
  3471 00001726 E8A52D                   call prnl
  3472 00001729 8D069ED0                 lea  ax, [ops]
  3473 0000172D 50                       push ax
  3474 0000172E E8AB2D                   call prs
  3475 00001731 83C402                   add  sp, 2
  3476 00001734 68[0D18]                 push doreg1_9
  3477 00001737 E8A22D                   call prs
  3478 0000173A 83C402                   add  sp, 2
  3479 0000173D FF36[2A10]               push word [ireg1]
  3480 00001741 E8DD04                   call printreg
  3481 00001744 83C402                   add  sp, 2
  3482 00001747 68[1018]                 push doreg1_10
  3483 0000174A E88F2D                   call prs
  3484 0000174D 83C402                   add  sp, 2
  3485                                  
  3486                                  ;-376 
  3487                                  
  3488                                  
  3489                                  ;-377   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3490                                  
  3491 00001750 680101                   push 257
  3492 00001753 E8512C                   call istoken
  3493 00001756 83C402                   add  sp, 2
  3494 00001759 08C0                     or  al, al
  3495 0000175B 0F840D00                 je .doreg1167
  3496 0000175F FF36[2E00]               push word [lexval]
  3497 00001763 E8CB2E                   call prunsign1
  3498 00001766 83C402                   add  sp, 2
  3499 00001769 E94700                   jmp .reg1
  3500                                  
  3501                                  ;-378   mod2=typeName(); ireg2=checkreg();
  3502                                  
  3503                                  .doreg1167:
  3504 0000176C E8BBF2                   call typeName
  3505 0000176F A3[3610]                 mov word [mod2], ax
  3506 00001772 E89E00                   call checkreg
  3507 00001775 A3[3810]                 mov word [ireg2], ax
  3508                                  
  3509                                  ;-379   if (ireg2) {printreg(ireg2); goto reg1;}
  3510                                  
  3511 00001778 A1[3810]                 mov ax, [ireg2]
  3512 0000177B 08C0                     or  al, al
  3513 0000177D 0F840D00                 je .doreg1168
  3514 00001781 FF36[3810]               push word [ireg2]
  3515 00001785 E89904                   call printreg
  3516 00001788 83C402                   add  sp, 2
  3517 0000178B E92500                   jmp .reg1
  3518                                  
  3519                                  ;-380   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3520                                  
  3521                                  .doreg1168:
  3522 0000178E E8CAF1                   call searchname
  3523 00001791 8946FE                   mov [bp-2], ax
  3524 00001794 A1[3610]                 mov ax, [mod2]
  3525 00001797 83F802                   cmp ax, 2
  3526 0000179A 0F850C00                 jne .doreg1169
  3527 0000179E FF76FE                   push word [bp-2]
  3528 000017A1 E8BCEB                   call a
  3529 000017A4 83C402                   add  sp, 2
  3530 000017A7 E90900                   jmp .doreg1170
  3531                                  .doreg1169:
  3532 000017AA FF76FE                   push word [bp-2]
  3533 000017AD E8BFEB                   call v
  3534 000017B0 83C402                   add  sp, 2
  3535                                  
  3536                                  ;-381   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3537                                  
  3538                                  .doreg1170:
  3539                                  .reg1:
  3540 000017B3 8B4604                   mov ax, [bp+4]
  3541 000017B6 83F801                   cmp ax, 1
  3542 000017B9 0F851B00                 jne .doreg1171
  3543 000017BD 6A00                     push 0
  3544 000017BF E89C21                   call cmpneg
  3545 000017C2 83C402                   add  sp, 2
  3546 000017C5 8D06AB81                 lea  ax, [fname]
  3547 000017C9 50                       push ax
  3548 000017CA E80F2D                   call prs
  3549 000017CD 83C402                   add  sp, 2
  3550 000017D0 6A29                     push 41
  3551 000017D2 E8F42B                   call expect
  3552 000017D5 83C402                   add  sp, 2
  3553                                  
  3554                                  ;-382 }
  3555                                  
  3556                                  .doreg1171:
  3557                                  
  3558                                  ;-383 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3559 000017D8 C9                       LEAVE
  3560 000017D9 C3                       ret
  3561 000017DA 6D6F7600                doreg1_0 db "mov",0
  3562 000017DE 61646400                doreg1_1 db "add",0
  3563 000017E2 73756200                doreg1_2 db "sub",0
  3564 000017E6 616E6400                doreg1_3 db "and",0
  3565 000017EA 6F7200                  doreg1_4 db "or",0
  3566 000017ED 73686C00                doreg1_5 db "shl",0
  3567 000017F1 73687200                doreg1_6 db "shr",0
  3568 000017F5 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3569 000017FE 6C2065787065637465-
  3570 00001807 6400               
  3571 00001809 636D7000                doreg1_8 db "cmp",0
  3572 0000180D 202000                  doreg1_9 db "  ",0
  3573 00001810 2C2000                  doreg1_10 db ", ",0
  3574                                  ENDP
  3575                                  
  3576                                  checkreg: PROC
  3577                                  
  3578                                  ;-384   if (strlen(symbol) <  2) return 0;
  3579                                  
  3580 00001813 8D062B81                 lea  ax, [symbol]
  3581 00001817 50                       push ax
  3582 00001818 E823E9                   call strlen
  3583 0000181B 83C402                   add  sp, 2
  3584 0000181E 83F802                   cmp ax, 2
  3585 00001821 0F8D0600                 jge .checkreg172
  3586 00001825 B80000                   mov ax, 0
  3587 00001828 E94403                   jmp .retncheckreg
  3588                                  
  3589                                  ;-385   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3590                                  
  3591                                  .checkreg172:
  3592 0000182B 68[701B]                 push checkreg_0
  3593 0000182E 8D062B81                 lea  ax, [symbol]
  3594 00001832 50                       push ax
  3595 00001833 E860E9                   call eqstr
  3596 00001836 83C404                   add  sp, 4
  3597 00001839 08C0                     or  al, al
  3598 0000183B 0F840600                 je .checkreg173
  3599 0000183F B80100                   mov ax, 1
  3600 00001842 E92A03                   jmp .retncheckreg
  3601                                  .checkreg173:
  3602 00001845 68[731B]                 push checkreg_1
  3603 00001848 8D062B81                 lea  ax, [symbol]
  3604 0000184C 50                       push ax
  3605 0000184D E846E9                   call eqstr
  3606 00001850 83C404                   add  sp, 4
  3607 00001853 08C0                     or  al, al
  3608 00001855 0F840600                 je .checkreg174
  3609 00001859 B80300                   mov ax, 3
  3610 0000185C E91003                   jmp .retncheckreg
  3611                                  
  3612                                  ;-386   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3613                                  
  3614                                  .checkreg174:
  3615 0000185F 68[761B]                 push checkreg_2
  3616 00001862 8D062B81                 lea  ax, [symbol]
  3617 00001866 50                       push ax
  3618 00001867 E82CE9                   call eqstr
  3619 0000186A 83C404                   add  sp, 4
  3620 0000186D 08C0                     or  al, al
  3621 0000186F 0F840600                 je .checkreg175
  3622 00001873 B80500                   mov ax, 5
  3623 00001876 E9F602                   jmp .retncheckreg
  3624                                  .checkreg175:
  3625 00001879 68[791B]                 push checkreg_3
  3626 0000187C 8D062B81                 lea  ax, [symbol]
  3627 00001880 50                       push ax
  3628 00001881 E812E9                   call eqstr
  3629 00001884 83C404                   add  sp, 4
  3630 00001887 08C0                     or  al, al
  3631 00001889 0F840600                 je .checkreg176
  3632 0000188D B80700                   mov ax, 7
  3633 00001890 E9DC02                   jmp .retncheckreg
  3634                                  
  3635                                  ;-387   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3636                                  
  3637                                  .checkreg176:
  3638 00001893 68[7C1B]                 push checkreg_4
  3639 00001896 8D062B81                 lea  ax, [symbol]
  3640 0000189A 50                       push ax
  3641 0000189B E8F8E8                   call eqstr
  3642 0000189E 83C404                   add  sp, 4
  3643 000018A1 08C0                     or  al, al
  3644 000018A3 0F840600                 je .checkreg177
  3645 000018A7 B80900                   mov ax, 9
  3646 000018AA E9C202                   jmp .retncheckreg
  3647                                  .checkreg177:
  3648 000018AD 68[7F1B]                 push checkreg_5
  3649 000018B0 8D062B81                 lea  ax, [symbol]
  3650 000018B4 50                       push ax
  3651 000018B5 E8DEE8                   call eqstr
  3652 000018B8 83C404                   add  sp, 4
  3653 000018BB 08C0                     or  al, al
  3654 000018BD 0F840600                 je .checkreg178
  3655 000018C1 B80B00                   mov ax, 11
  3656 000018C4 E9A802                   jmp .retncheckreg
  3657                                  
  3658                                  ;-388   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3659                                  
  3660                                  .checkreg178:
  3661 000018C7 68[821B]                 push checkreg_6
  3662 000018CA 8D062B81                 lea  ax, [symbol]
  3663 000018CE 50                       push ax
  3664 000018CF E8C4E8                   call eqstr
  3665 000018D2 83C404                   add  sp, 4
  3666 000018D5 08C0                     or  al, al
  3667 000018D7 0F840600                 je .checkreg179
  3668 000018DB B80D00                   mov ax, 13
  3669 000018DE E98E02                   jmp .retncheckreg
  3670                                  .checkreg179:
  3671 000018E1 68[851B]                 push checkreg_7
  3672 000018E4 8D062B81                 lea  ax, [symbol]
  3673 000018E8 50                       push ax
  3674 000018E9 E8AAE8                   call eqstr
  3675 000018EC 83C404                   add  sp, 4
  3676 000018EF 08C0                     or  al, al
  3677 000018F1 0F840600                 je .checkreg180
  3678 000018F5 B80F00                   mov ax, 15
  3679 000018F8 E97402                   jmp .retncheckreg
  3680                                  
  3681                                  ;-389   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3682                                  
  3683                                  .checkreg180:
  3684 000018FB 68[881B]                 push checkreg_8
  3685 000018FE 8D062B81                 lea  ax, [symbol]
  3686 00001902 50                       push ax
  3687 00001903 E890E8                   call eqstr
  3688 00001906 83C404                   add  sp, 4
  3689 00001909 08C0                     or  al, al
  3690 0000190B 0F840600                 je .checkreg181
  3691 0000190F B81100                   mov ax, 17
  3692 00001912 E95A02                   jmp .retncheckreg
  3693                                  .checkreg181:
  3694 00001915 68[8B1B]                 push checkreg_9
  3695 00001918 8D062B81                 lea  ax, [symbol]
  3696 0000191C 50                       push ax
  3697 0000191D E876E8                   call eqstr
  3698 00001920 83C404                   add  sp, 4
  3699 00001923 08C0                     or  al, al
  3700 00001925 0F840600                 je .checkreg182
  3701 00001929 B81300                   mov ax, 19
  3702 0000192C E94002                   jmp .retncheckreg
  3703                                  
  3704                                  ;-390   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3705                                  
  3706                                  .checkreg182:
  3707 0000192F 68[8E1B]                 push checkreg_10
  3708 00001932 8D062B81                 lea  ax, [symbol]
  3709 00001936 50                       push ax
  3710 00001937 E85CE8                   call eqstr
  3711 0000193A 83C404                   add  sp, 4
  3712 0000193D 08C0                     or  al, al
  3713 0000193F 0F840600                 je .checkreg183
  3714 00001943 B81500                   mov ax, 21
  3715 00001946 E92602                   jmp .retncheckreg
  3716                                  .checkreg183:
  3717 00001949 68[911B]                 push checkreg_11
  3718 0000194C 8D062B81                 lea  ax, [symbol]
  3719 00001950 50                       push ax
  3720 00001951 E842E8                   call eqstr
  3721 00001954 83C404                   add  sp, 4
  3722 00001957 08C0                     or  al, al
  3723 00001959 0F840600                 je .checkreg184
  3724 0000195D B81700                   mov ax, 23
  3725 00001960 E90C02                   jmp .retncheckreg
  3726                                  
  3727                                  ;-391   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3728                                  
  3729                                  .checkreg184:
  3730 00001963 68[941B]                 push checkreg_12
  3731 00001966 8D062B81                 lea  ax, [symbol]
  3732 0000196A 50                       push ax
  3733 0000196B E828E8                   call eqstr
  3734 0000196E 83C404                   add  sp, 4
  3735 00001971 08C0                     or  al, al
  3736 00001973 0F840600                 je .checkreg185
  3737 00001977 B81900                   mov ax, 25
  3738 0000197A E9F201                   jmp .retncheckreg
  3739                                  .checkreg185:
  3740 0000197D 68[971B]                 push checkreg_13
  3741 00001980 8D062B81                 lea  ax, [symbol]
  3742 00001984 50                       push ax
  3743 00001985 E80EE8                   call eqstr
  3744 00001988 83C404                   add  sp, 4
  3745 0000198B 08C0                     or  al, al
  3746 0000198D 0F840600                 je .checkreg186
  3747 00001991 B81B00                   mov ax, 27
  3748 00001994 E9D801                   jmp .retncheckreg
  3749                                  
  3750                                  ;-392   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3751                                  
  3752                                  .checkreg186:
  3753 00001997 68[9A1B]                 push checkreg_14
  3754 0000199A 8D062B81                 lea  ax, [symbol]
  3755 0000199E 50                       push ax
  3756 0000199F E8F4E7                   call eqstr
  3757 000019A2 83C404                   add  sp, 4
  3758 000019A5 08C0                     or  al, al
  3759 000019A7 0F840600                 je .checkreg187
  3760 000019AB B81D00                   mov ax, 29
  3761 000019AE E9BE01                   jmp .retncheckreg
  3762                                  .checkreg187:
  3763 000019B1 68[9D1B]                 push checkreg_15
  3764 000019B4 8D062B81                 lea  ax, [symbol]
  3765 000019B8 50                       push ax
  3766 000019B9 E8DAE7                   call eqstr
  3767 000019BC 83C404                   add  sp, 4
  3768 000019BF 08C0                     or  al, al
  3769 000019C1 0F840600                 je .checkreg188
  3770 000019C5 B81F00                   mov ax, 31
  3771 000019C8 E9A401                   jmp .retncheckreg
  3772                                  
  3773                                  ;-393   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3774                                  
  3775                                  .checkreg188:
  3776 000019CB 68[A01B]                 push checkreg_16
  3777 000019CE 8D062B81                 lea  ax, [symbol]
  3778 000019D2 50                       push ax
  3779 000019D3 E8C0E7                   call eqstr
  3780 000019D6 83C404                   add  sp, 4
  3781 000019D9 08C0                     or  al, al
  3782 000019DB 0F840600                 je .checkreg189
  3783 000019DF B82100                   mov ax, 33
  3784 000019E2 E98A01                   jmp .retncheckreg
  3785                                  .checkreg189:
  3786 000019E5 68[A31B]                 push checkreg_17
  3787 000019E8 8D062B81                 lea  ax, [symbol]
  3788 000019EC 50                       push ax
  3789 000019ED E8A6E7                   call eqstr
  3790 000019F0 83C404                   add  sp, 4
  3791 000019F3 08C0                     or  al, al
  3792 000019F5 0F840600                 je .checkreg190
  3793 000019F9 B82300                   mov ax, 35
  3794 000019FC E97001                   jmp .retncheckreg
  3795                                  
  3796                                  ;-394   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3797                                  
  3798                                  .checkreg190:
  3799 000019FF 68[A61B]                 push checkreg_18
  3800 00001A02 8D062B81                 lea  ax, [symbol]
  3801 00001A06 50                       push ax
  3802 00001A07 E88CE7                   call eqstr
  3803 00001A0A 83C404                   add  sp, 4
  3804 00001A0D 08C0                     or  al, al
  3805 00001A0F 0F840600                 je .checkreg191
  3806 00001A13 B82500                   mov ax, 37
  3807 00001A16 E95601                   jmp .retncheckreg
  3808                                  .checkreg191:
  3809 00001A19 68[A91B]                 push checkreg_19
  3810 00001A1C 8D062B81                 lea  ax, [symbol]
  3811 00001A20 50                       push ax
  3812 00001A21 E872E7                   call eqstr
  3813 00001A24 83C404                   add  sp, 4
  3814 00001A27 08C0                     or  al, al
  3815 00001A29 0F840600                 je .checkreg192
  3816 00001A2D B82700                   mov ax, 39
  3817 00001A30 E93C01                   jmp .retncheckreg
  3818                                  
  3819                                  ;-395   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3820                                  
  3821                                  .checkreg192:
  3822 00001A33 68[AC1B]                 push checkreg_20
  3823 00001A36 8D062B81                 lea  ax, [symbol]
  3824 00001A3A 50                       push ax
  3825 00001A3B E858E7                   call eqstr
  3826 00001A3E 83C404                   add  sp, 4
  3827 00001A41 08C0                     or  al, al
  3828 00001A43 0F840600                 je .checkreg193
  3829 00001A47 B82900                   mov ax, 41
  3830 00001A4A E92201                   jmp .retncheckreg
  3831                                  .checkreg193:
  3832 00001A4D 68[AF1B]                 push checkreg_21
  3833 00001A50 8D062B81                 lea  ax, [symbol]
  3834 00001A54 50                       push ax
  3835 00001A55 E83EE7                   call eqstr
  3836 00001A58 83C404                   add  sp, 4
  3837 00001A5B 08C0                     or  al, al
  3838 00001A5D 0F840600                 je .checkreg194
  3839 00001A61 B82B00                   mov ax, 43
  3840 00001A64 E90801                   jmp .retncheckreg
  3841                                  
  3842                                  ;-396   // (eqstr(symbol,"ip")) return 45;
  3843                                  
  3844                                  
  3845                                  ;-397   if (strlen(symbol) >   3) return 0;
  3846                                  
  3847                                  .checkreg194:
  3848 00001A67 8D062B81                 lea  ax, [symbol]
  3849 00001A6B 50                       push ax
  3850 00001A6C E8CFE6                   call strlen
  3851 00001A6F 83C402                   add  sp, 2
  3852 00001A72 83F803                   cmp ax, 3
  3853 00001A75 0F8E0600                 jle .checkreg195
  3854 00001A79 B80000                   mov ax, 0
  3855 00001A7C E9F000                   jmp .retncheckreg
  3856                                  
  3857                                  ;-398   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3858                                  
  3859                                  .checkreg195:
  3860 00001A7F 68[B21B]                 push checkreg_22
  3861 00001A82 8D062B81                 lea  ax, [symbol]
  3862 00001A86 50                       push ax
  3863 00001A87 E80CE7                   call eqstr
  3864 00001A8A 83C404                   add  sp, 4
  3865 00001A8D 08C0                     or  al, al
  3866 00001A8F 0F840600                 je .checkreg196
  3867 00001A93 B82F00                   mov ax, 47
  3868 00001A96 E9D600                   jmp .retncheckreg
  3869                                  .checkreg196:
  3870 00001A99 68[B61B]                 push checkreg_23
  3871 00001A9C 8D062B81                 lea  ax, [symbol]
  3872 00001AA0 50                       push ax
  3873 00001AA1 E8F2E6                   call eqstr
  3874 00001AA4 83C404                   add  sp, 4
  3875 00001AA7 08C0                     or  al, al
  3876 00001AA9 0F840600                 je .checkreg197
  3877 00001AAD B83200                   mov ax, 50
  3878 00001AB0 E9BC00                   jmp .retncheckreg
  3879                                  
  3880                                  ;-399   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3881                                  
  3882                                  .checkreg197:
  3883 00001AB3 68[BA1B]                 push checkreg_24
  3884 00001AB6 8D062B81                 lea  ax, [symbol]
  3885 00001ABA 50                       push ax
  3886 00001ABB E8D8E6                   call eqstr
  3887 00001ABE 83C404                   add  sp, 4
  3888 00001AC1 08C0                     or  al, al
  3889 00001AC3 0F840600                 je .checkreg198
  3890 00001AC7 B83500                   mov ax, 53
  3891 00001ACA E9A200                   jmp .retncheckreg
  3892                                  .checkreg198:
  3893 00001ACD 68[BE1B]                 push checkreg_25
  3894 00001AD0 8D062B81                 lea  ax, [symbol]
  3895 00001AD4 50                       push ax
  3896 00001AD5 E8BEE6                   call eqstr
  3897 00001AD8 83C404                   add  sp, 4
  3898 00001ADB 08C0                     or  al, al
  3899 00001ADD 0F840600                 je .checkreg199
  3900 00001AE1 B83800                   mov ax, 56
  3901 00001AE4 E98800                   jmp .retncheckreg
  3902                                  
  3903                                  ;-400   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3904                                  
  3905                                  .checkreg199:
  3906 00001AE7 68[C21B]                 push checkreg_26
  3907 00001AEA 8D062B81                 lea  ax, [symbol]
  3908 00001AEE 50                       push ax
  3909 00001AEF E8A4E6                   call eqstr
  3910 00001AF2 83C404                   add  sp, 4
  3911 00001AF5 08C0                     or  al, al
  3912 00001AF7 0F840600                 je .checkreg200
  3913 00001AFB B83B00                   mov ax, 59
  3914 00001AFE E96E00                   jmp .retncheckreg
  3915                                  .checkreg200:
  3916 00001B01 68[C61B]                 push checkreg_27
  3917 00001B04 8D062B81                 lea  ax, [symbol]
  3918 00001B08 50                       push ax
  3919 00001B09 E88AE6                   call eqstr
  3920 00001B0C 83C404                   add  sp, 4
  3921 00001B0F 08C0                     or  al, al
  3922 00001B11 0F840600                 je .checkreg201
  3923 00001B15 B83E00                   mov ax, 62
  3924 00001B18 E95400                   jmp .retncheckreg
  3925                                  
  3926                                  ;-401   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3927                                  
  3928                                  .checkreg201:
  3929 00001B1B 68[CA1B]                 push checkreg_28
  3930 00001B1E 8D062B81                 lea  ax, [symbol]
  3931 00001B22 50                       push ax
  3932 00001B23 E870E6                   call eqstr
  3933 00001B26 83C404                   add  sp, 4
  3934 00001B29 08C0                     or  al, al
  3935 00001B2B 0F840600                 je .checkreg202
  3936 00001B2F B84100                   mov ax, 65
  3937 00001B32 E93A00                   jmp .retncheckreg
  3938                                  .checkreg202:
  3939 00001B35 68[CE1B]                 push checkreg_29
  3940 00001B38 8D062B81                 lea  ax, [symbol]
  3941 00001B3C 50                       push ax
  3942 00001B3D E856E6                   call eqstr
  3943 00001B40 83C404                   add  sp, 4
  3944 00001B43 08C0                     or  al, al
  3945 00001B45 0F840600                 je .checkreg203
  3946 00001B49 B84400                   mov ax, 68
  3947 00001B4C E92000                   jmp .retncheckreg
  3948                                  
  3949                                  ;-402   if (eqstr(symbol,"cr0")) return 71;
  3950                                  
  3951                                  .checkreg203:
  3952 00001B4F 68[D21B]                 push checkreg_30
  3953 00001B52 8D062B81                 lea  ax, [symbol]
  3954 00001B56 50                       push ax
  3955 00001B57 E83CE6                   call eqstr
  3956 00001B5A 83C404                   add  sp, 4
  3957 00001B5D 08C0                     or  al, al
  3958 00001B5F 0F840600                 je .checkreg204
  3959 00001B63 B84700                   mov ax, 71
  3960 00001B66 E90600                   jmp .retncheckreg
  3961                                  
  3962                                  ;-403   return 0;   }
  3963                                  
  3964                                  .checkreg204:
  3965 00001B69 B80000                   mov ax, 0
  3966 00001B6C E90000                   jmp .retncheckreg
  3967                                  
  3968                                  ;-404 char printregstr[]
  3969                                  
  3970                                   .retncheckreg:
  3971 00001B6F C3                       ret
  3972 00001B70 616C00                  checkreg_0 db "al",0
  3973 00001B73 636C00                  checkreg_1 db "cl",0
  3974 00001B76 646C00                  checkreg_2 db "dl",0
  3975 00001B79 626C00                  checkreg_3 db "bl",0
  3976 00001B7C 616800                  checkreg_4 db "ah",0
  3977 00001B7F 636800                  checkreg_5 db "ch",0
  3978 00001B82 646800                  checkreg_6 db "dh",0
  3979 00001B85 626800                  checkreg_7 db "bh",0
  3980 00001B88 617800                  checkreg_8 db "ax",0
  3981 00001B8B 637800                  checkreg_9 db "cx",0
  3982 00001B8E 647800                  checkreg_10 db "dx",0
  3983 00001B91 627800                  checkreg_11 db "bx",0
  3984 00001B94 737000                  checkreg_12 db "sp",0
  3985 00001B97 627000                  checkreg_13 db "bp",0
  3986 00001B9A 736900                  checkreg_14 db "si",0
  3987 00001B9D 646900                  checkreg_15 db "di",0
  3988 00001BA0 657300                  checkreg_16 db "es",0
  3989 00001BA3 637300                  checkreg_17 db "cs",0
  3990 00001BA6 737300                  checkreg_18 db "ss",0
  3991 00001BA9 647300                  checkreg_19 db "ds",0
  3992 00001BAC 667300                  checkreg_20 db "fs",0
  3993 00001BAF 677300                  checkreg_21 db "gs",0
  3994 00001BB2 65617800                checkreg_22 db "eax",0
  3995 00001BB6 65637800                checkreg_23 db "ecx",0
  3996 00001BBA 65647800                checkreg_24 db "edx",0
  3997 00001BBE 65627800                checkreg_25 db "ebx",0
  3998 00001BC2 65737000                checkreg_26 db "esp",0
  3999 00001BC6 65627000                checkreg_27 db "ebp",0
  4000 00001BCA 65736900                checkreg_28 db "esi",0
  4001 00001BCE 65646900                checkreg_29 db "edi",0
  4002 00001BD2 63723000                checkreg_30 db "cr0",0
  4003                                  ENDP
  4004                                  
  4005                                  ;-405 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4006                                  
  4007 00001BD6 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4008 00001BDF 616863686468626861-
  4009 00001BE8 786378647862787370-
  4010 00001BF1 627073696469657363-
  4011 00001BFA 737373647366736773-
  4012 00001C03 697065617865637865-
  4013 00001C0C 647865627865737065-
  4014 00001C15 627065736965646963-
  4015 00001C1E 723000             
  4016                                  
  4017                                  ;-406 //          1         2         3         4         5         6         7
  4018                                  
  4019                                  
  4020                                  ;-407 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4021                                  
  4022                                  
  4023                                  ;-408 int printreg(int i) {  unsigned int k; unsigned char c;
  4024                                  
  4025                                  
  4026                                  printreg: PROC
  4027                                  
  4028                                  ;-409   k = &printregstr + i; c=*k; prc(c); i++;
  4029                                  
  4030                                  ;Function : printreg, Number of local variables: 3
  4031                                  ;   # type sign width addr used name   list of local variables
  4032                                  ;  200 var sign word   408 NULL i = bp+4
  4033                                  ;  201 var unsg word   408 NULL k = bp-2
  4034                                  ;  202 var unsg byte   408 NULL c = bp-4;
  4035 00001C21 C8040000                 ENTER  4,0
  4036 00001C25 B8[D61B]                 mov ax, printregstr
  4037 00001C28 034604                   add ax, [bp+4]
  4038 00001C2B 8946FE                   mov [bp-2], ax
  4039 00001C2E 8B5EFE                   mov bx, [bp-2]
  4040 00001C31 8B07                     mov ax, [bx]
  4041 00001C33 8846FC                   mov [bp-4], al
  4042 00001C36 8A46FC                   mov al, byte [bp-4]
  4043 00001C39 B400                     mov ah, 0
  4044 00001C3B 50                       push ax
  4045 00001C3C E83628                   call prc
  4046 00001C3F 83C402                   add  sp, 2
  4047 00001C42 FF4604                   inc  word[bp+4]
  4048                                  
  4049                                  ;-410   k = &printregstr + i; c=*k; prc(c);
  4050                                  
  4051 00001C45 B8[D61B]                 mov ax, printregstr
  4052 00001C48 034604                   add ax, [bp+4]
  4053 00001C4B 8946FE                   mov [bp-2], ax
  4054 00001C4E 8B5EFE                   mov bx, [bp-2]
  4055 00001C51 8B07                     mov ax, [bx]
  4056 00001C53 8846FC                   mov [bp-4], al
  4057 00001C56 8A46FC                   mov al, byte [bp-4]
  4058 00001C59 B400                     mov ah, 0
  4059 00001C5B 50                       push ax
  4060 00001C5C E81628                   call prc
  4061 00001C5F 83C402                   add  sp, 2
  4062                                  
  4063                                  ;-411   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4064                                  
  4065 00001C62 8B4604                   mov ax, [bp+4]
  4066 00001C65 83F82F                   cmp ax, 47
  4067 00001C68 0F8E2000                 jle .printreg205
  4068 00001C6C FF4604                   inc  word[bp+4]
  4069 00001C6F B8[D61B]                 mov ax, printregstr
  4070 00001C72 034604                   add ax, [bp+4]
  4071 00001C75 8946FE                   mov [bp-2], ax
  4072 00001C78 8B5EFE                   mov bx, [bp-2]
  4073 00001C7B 8B07                     mov ax, [bx]
  4074 00001C7D 8846FC                   mov [bp-4], al
  4075 00001C80 8A46FC                   mov al, byte [bp-4]
  4076 00001C83 B400                     mov ah, 0
  4077 00001C85 50                       push ax
  4078 00001C86 E8EC27                   call prc
  4079 00001C89 83C402                   add  sp, 2
  4080                                  
  4081                                  ;-412 }
  4082                                  
  4083                                  .printreg205:
  4084                                  
  4085                                  ;-413 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4086 00001C8C C9                       LEAVE
  4087 00001C8D C3                       ret
  4088                                  ENDP
  4089 00001C8E 0000                    evalue dw 0
  4090 00001C90 0A00                    exprtype dw 10
  4091                                  
  4092                                  ;-414 int expr(int isRight)
  4093                                  
  4094                                  
  4095                                  expr: PROC
  4096                                  
  4097                                  ;-415 { int mode; int id1;     int ixarr; int ixconst;
  4098                                  
  4099                                  
  4100                                  ;-416   int ids;  int isCONST; int i;     unsigned char *p;
  4101                                  
  4102                                  
  4103                                  ;-417   if (istoken(T_CONST)) { evalue=lexval;
  4104                                  
  4105                                  ;Function : expr, Number of local variables: 9
  4106                                  ;   # type sign width addr used name   list of local variables
  4107                                  ;  200 var sign word   414 NULL isRight = bp+4
  4108                                  ;  201 var sign word   415 NULL mode = bp-2
  4109                                  ;  202 var sign word   415 NULL id1 = bp-4
  4110                                  ;  203 var sign word   415 NULL ixarr = bp-6
  4111                                  ;  204 var sign word   415 NULL ixconst = bp-8
  4112                                  ;  205 var sign word   416 NULL ids = bp-10
  4113                                  ;  206 var sign word   416 NULL isCONST = bp-12
  4114                                  ;  207 var sign word   416 NULL i = bp-14
  4115                                  ;  208 ptr unsg byte   416 NULL p = bp-16;
  4116 00001C92 C8100000                 ENTER  16,0
  4117 00001C96 680101                   push 257
  4118 00001C99 E80B27                   call istoken
  4119 00001C9C 83C402                   add  sp, 2
  4120 00001C9F 08C0                     or  al, al
  4121 00001CA1 0F841F00                 je .expr206
  4122 00001CA5 A1[2E00]                 mov ax, [lexval]
  4123 00001CA8 A3[8E1C]                 mov word [evalue], ax
  4124                                  
  4125                                  ;-418     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4126                                  
  4127 00001CAB 68[3220]                 push expr_0
  4128 00001CAE E82B28                   call prs
  4129 00001CB1 83C402                   add  sp, 2
  4130 00001CB4 FF36[2E00]               push word [lexval]
  4131 00001CB8 E87629                   call prunsign1
  4132 00001CBB 83C402                   add  sp, 2
  4133 00001CBE B80400                   mov ax, 4
  4134 00001CC1 E96C03                   jmp .retnexpr
  4135                                  
  4136                                  ;-419   mode=typeName(); /*0=V,1=*,2=&*/
  4137                                  
  4138                                  .expr206:
  4139 00001CC4 E863ED                   call typeName
  4140 00001CC7 8946FE                   mov [bp-2], ax
  4141                                  
  4142                                  ;-420   ireg1=checkreg();
  4143                                  
  4144 00001CCA E846FB                   call checkreg
  4145 00001CCD A3[2A10]                 mov word [ireg1], ax
  4146                                  
  4147                                  ;-421   if (ireg1) { doreg1(0); return; }
  4148                                  
  4149 00001CD0 A1[2A10]                 mov ax, [ireg1]
  4150 00001CD3 08C0                     or  al, al
  4151 00001CD5 0F840B00                 je .expr207
  4152 00001CD9 6A00                     push 0
  4153 00001CDB E849F9                   call doreg1
  4154 00001CDE 83C402                   add  sp, 2
  4155 00001CE1 E94C03                   jmp .retnexpr
  4156                                  
  4157                                  ;-422   if (token=='(')  {docall1(); goto e1; }
  4158                                  
  4159                                  .expr207:
  4160 00001CE4 A1[1C00]                 mov ax, [token]
  4161 00001CE7 83F828                   cmp ax, 40
  4162 00001CEA 0F850600                 jne .expr208
  4163 00001CEE E82E0F                   call docall1
  4164 00001CF1 E93202                   jmp .e1
  4165                                  
  4166                                  ;-423   if (isreg()) goto e1;
  4167                                  
  4168                                  .expr208:
  4169 00001CF4 E88307                   call isreg
  4170 00001CF7 08C0                     or  al, al
  4171 00001CF9 0F840300                 je .expr209
  4172 00001CFD E92602                   jmp .e1
  4173                                  
  4174                                  ;-424 
  4175                                  
  4176                                  
  4177                                  ;-425   id1=searchname(); gettypes(id1); ids=signi;
  4178                                  
  4179                                  .expr209:
  4180 00001D00 E858EC                   call searchname
  4181 00001D03 8946FC                   mov [bp-4], ax
  4182 00001D06 FF76FC                   push word [bp-4]
  4183 00001D09 E811EB                   call gettypes
  4184 00001D0C 83C402                   add  sp, 2
  4185 00001D0F A1[3300]                 mov ax, [signi]
  4186 00001D12 8946F6                   mov [bp-10], ax
  4187                                  
  4188                                  ;-426   ixarr=0;  ixconst=0;
  4189                                  
  4190 00001D15 B80000                   mov ax, 0
  4191 00001D18 8946FA                   mov [bp-6], ax
  4192 00001D1B B80000                   mov ax, 0
  4193 00001D1E 8946F8                   mov [bp-8], ax
  4194                                  
  4195                                  ;-427     if (istoken('[')) { if (istoken(T_CONST)) {
  4196                                  
  4197 00001D21 6A5B                     push 91
  4198 00001D23 E88126                   call istoken
  4199 00001D26 83C402                   add  sp, 2
  4200 00001D29 08C0                     or  al, al
  4201 00001D2B 0F845900                 je .expr210
  4202 00001D2F 680101                   push 257
  4203 00001D32 E87226                   call istoken
  4204 00001D35 83C402                   add  sp, 2
  4205 00001D38 08C0                     or  al, al
  4206 00001D3A 0F841700                 je .expr211
  4207                                  
  4208                                  ;-428       ixconst=1; ixarr=lexval; expect(']');  }
  4209                                  
  4210 00001D3E B80100                   mov ax, 1
  4211 00001D41 8946F8                   mov [bp-8], ax
  4212 00001D44 A1[2E00]                 mov ax, [lexval]
  4213 00001D47 8946FA                   mov [bp-6], ax
  4214 00001D4A 6A5D                     push 93
  4215 00001D4C E87A26                   call expect
  4216 00001D4F 83C402                   add  sp, 2
  4217                                  
  4218                                  ;-429     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4219                                  
  4220 00001D52 E93300                   jmp .expr212
  4221                                  .expr211:
  4222 00001D55 E803EC                   call searchname
  4223 00001D58 8946FA                   mov [bp-6], ax
  4224 00001D5B 680001                   push 256
  4225 00001D5E E86826                   call expect
  4226 00001D61 83C402                   add  sp, 2
  4227 00001D64 6A5D                     push 93
  4228 00001D66 E86026                   call expect
  4229 00001D69 83C402                   add  sp, 2
  4230                                  
  4231                                  ;-430     gettypes(ixarr);
  4232                                  
  4233 00001D6C FF76FA                   push word [bp-6]
  4234 00001D6F E8ABEA                   call gettypes
  4235 00001D72 83C402                   add  sp, 2
  4236                                  
  4237                                  ;-431     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4238                                  
  4239 00001D75 A1[3600]                 mov ax, [widthi]
  4240 00001D78 83F802                   cmp ax, 2
  4241 00001D7B 0F840900                 je  .expr213
  4242 00001D7F 68[3E20]                 push expr_1
  4243 00001D82 E83D2A                   call error1
  4244 00001D85 83C402                   add  sp, 2
  4245                                  .expr213:
  4246                                  .expr212:
  4247                                  
  4248                                  ;-432   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4249                                  
  4250                                  .expr210:
  4251 00001D88 68C304                   push 1219
  4252 00001D8B E81926                   call istoken
  4253 00001D8E 83C402                   add  sp, 2
  4254 00001D91 08C0                     or  al, al
  4255 00001D93 0F844600                 je .expr214
  4256 00001D97 8B46FE                   mov ax, [bp-2]
  4257 00001D9A 08C0                     or  al, al
  4258 00001D9C 0F840900                 je .expr215
  4259 00001DA0 68[6120]                 push expr_2
  4260 00001DA3 E81C2A                   call error1
  4261 00001DA6 83C402                   add  sp, 2
  4262                                  
  4263                                  ;-433      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4264                                  
  4265                                  .expr215:
  4266 00001DA9 68[7120]                 push expr_3
  4267 00001DAC E82D27                   call prs
  4268 00001DAF 83C402                   add  sp, 2
  4269 00001DB2 A1[3900]                 mov ax, [wi]
  4270 00001DB5 83F802                   cmp ax, 2
  4271 00001DB8 0F850C00                 jne .expr216
  4272 00001DBC 68[7A20]                 push expr_4
  4273 00001DBF E81A27                   call prs
  4274 00001DC2 83C402                   add  sp, 2
  4275 00001DC5 E90900                   jmp .expr217
  4276                                  .expr216:
  4277 00001DC8 68[7F20]                 push expr_5
  4278 00001DCB E80E27                   call prs
  4279 00001DCE 83C402                   add  sp, 2
  4280                                  
  4281                                  ;-434      v(id1); goto e1;}
  4282                                  
  4283                                  .expr217:
  4284 00001DD1 FF76FC                   push word [bp-4]
  4285 00001DD4 E898E5                   call v
  4286 00001DD7 83C402                   add  sp, 2
  4287 00001DDA E94901                   jmp .e1
  4288                                  
  4289                                  ;-435   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4290                                  
  4291                                  .expr214:
  4292 00001DDD 68C904                   push 1225
  4293 00001DE0 E8C425                   call istoken
  4294 00001DE3 83C402                   add  sp, 2
  4295 00001DE6 08C0                     or  al, al
  4296 00001DE8 0F844600                 je .expr218
  4297 00001DEC 8B46FE                   mov ax, [bp-2]
  4298 00001DEF 08C0                     or  al, al
  4299 00001DF1 0F840900                 je .expr219
  4300 00001DF5 68[8420]                 push expr_6
  4301 00001DF8 E8C729                   call error1
  4302 00001DFB 83C402                   add  sp, 2
  4303                                  
  4304                                  ;-436      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4305                                  
  4306                                  .expr219:
  4307 00001DFE 68[9420]                 push expr_7
  4308 00001E01 E8D826                   call prs
  4309 00001E04 83C402                   add  sp, 2
  4310 00001E07 A1[3900]                 mov ax, [wi]
  4311 00001E0A 83F802                   cmp ax, 2
  4312 00001E0D 0F850C00                 jne .expr220
  4313 00001E11 68[9D20]                 push expr_8
  4314 00001E14 E8C526                   call prs
  4315 00001E17 83C402                   add  sp, 2
  4316 00001E1A E90900                   jmp .expr221
  4317                                  .expr220:
  4318 00001E1D 68[A220]                 push expr_9
  4319 00001E20 E8B926                   call prs
  4320 00001E23 83C402                   add  sp, 2
  4321                                  
  4322                                  ;-437      v(id1); goto e1;}
  4323                                  
  4324                                  .expr221:
  4325 00001E26 FF76FC                   push word [bp-4]
  4326 00001E29 E843E5                   call v
  4327 00001E2C 83C402                   add  sp, 2
  4328 00001E2F E9F400                   jmp .e1
  4329                                  
  4330                                  ;-438        
  4331                                  
  4332                                  
  4333                                  ;-439   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4334                                  
  4335                                  .expr218:
  4336 00001E32 68CE04                   push 1230
  4337 00001E35 E86F25                   call istoken
  4338 00001E38 83C402                   add  sp, 2
  4339 00001E3B 08C0                     or  al, al
  4340 00001E3D 0F841200                 je .expr222
  4341 00001E41 FF76FC                   push word [bp-4]
  4342 00001E44 FF76FE                   push word [bp-2]
  4343 00001E47 68[A720]                 push expr_10
  4344 00001E4A E8A802                   call compoundass
  4345 00001E4D 83C406                   add  sp, 6
  4346 00001E50 E9D300                   jmp .e1
  4347                                  
  4348                                  ;-440   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4349                                  
  4350                                  .expr222:
  4351 00001E53 68CF04                   push 1231
  4352 00001E56 E84E25                   call istoken
  4353 00001E59 83C402                   add  sp, 2
  4354 00001E5C 08C0                     or  al, al
  4355 00001E5E 0F841200                 je .expr223
  4356 00001E62 FF76FC                   push word [bp-4]
  4357 00001E65 FF76FE                   push word [bp-2]
  4358 00001E68 68[AB20]                 push expr_11
  4359 00001E6B E88702                   call compoundass
  4360 00001E6E 83C406                   add  sp, 6
  4361 00001E71 E9B200                   jmp .e1
  4362                                  
  4363                                  ;-441   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4364                                  
  4365                                  .expr223:
  4366 00001E74 68D204                   push 1234
  4367 00001E77 E82D25                   call istoken
  4368 00001E7A 83C402                   add  sp, 2
  4369 00001E7D 08C0                     or  al, al
  4370 00001E7F 0F841200                 je .expr224
  4371 00001E83 FF76FC                   push word [bp-4]
  4372 00001E86 FF76FE                   push word [bp-2]
  4373 00001E89 68[AF20]                 push expr_12
  4374 00001E8C E86602                   call compoundass
  4375 00001E8F 83C406                   add  sp, 6
  4376 00001E92 E99100                   jmp .e1
  4377                                  
  4378                                  ;-442   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4379                                  
  4380                                  .expr224:
  4381 00001E95 68D304                   push 1235
  4382 00001E98 E80C25                   call istoken
  4383 00001E9B 83C402                   add  sp, 2
  4384 00001E9E 08C0                     or  al, al
  4385 00001EA0 0F841200                 je .expr225
  4386 00001EA4 FF76FC                   push word [bp-4]
  4387 00001EA7 FF76FE                   push word [bp-2]
  4388 00001EAA 68[B320]                 push expr_13
  4389 00001EAD E84502                   call compoundass
  4390 00001EB0 83C406                   add  sp, 6
  4391 00001EB3 E97000                   jmp .e1
  4392                                  
  4393                                  ;-443   if (istoken(T_MULASS    )) {error1("not implemented");}
  4394                                  
  4395                                  .expr225:
  4396 00001EB6 68D004                   push 1232
  4397 00001EB9 E8EB24                   call istoken
  4398 00001EBC 83C402                   add  sp, 2
  4399 00001EBF 08C0                     or  al, al
  4400 00001EC1 0F840900                 je .expr226
  4401 00001EC5 68[B620]                 push expr_14
  4402 00001EC8 E8F728                   call error1
  4403 00001ECB 83C402                   add  sp, 2
  4404                                  
  4405                                  ;-444   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4406                                  
  4407                                  .expr226:
  4408 00001ECE 68D104                   push 1233
  4409 00001ED1 E8D324                   call istoken
  4410 00001ED4 83C402                   add  sp, 2
  4411 00001ED7 08C0                     or  al, al
  4412 00001ED9 0F840900                 je .expr227
  4413 00001EDD 68[C620]                 push expr_15
  4414 00001EE0 E8DF28                   call error1
  4415 00001EE3 83C402                   add  sp, 2
  4416                                  
  4417                                  ;-445 
  4418                                  
  4419                                  
  4420                                  ;-446   if (istoken('=')) { exprtype= expr(1); 
  4421                                  
  4422                                  .expr227:
  4423 00001EE6 6A3D                     push 61
  4424 00001EE8 E8BC24                   call istoken
  4425 00001EEB 83C402                   add  sp, 2
  4426 00001EEE 08C0                     or  al, al
  4427 00001EF0 0F842000                 je .expr228
  4428 00001EF4 6A01                     push 1
  4429 00001EF6 E899FD                   call expr
  4430 00001EF9 83C402                   add  sp, 2
  4431 00001EFC A3[901C]                 mov word [exprtype], ax
  4432                                  
  4433                                  ;-447   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4434                                  
  4435 00001EFF FF76F8                   push word [bp-8]
  4436 00001F02 FF76FA                   push word [bp-6]
  4437 00001F05 FF76FC                   push word [bp-4]
  4438 00001F08 FF76FE                   push word [bp-2]
  4439 00001F0B E85E08                   call doassign
  4440 00001F0E 83C408                   add  sp, 8
  4441 00001F11 E91200                   jmp .e1
  4442                                  
  4443                                  ;-448   dovar1(mode, "mov", ixarr, id1);
  4444                                  
  4445                                  .expr228:
  4446 00001F14 FF76FC                   push word [bp-4]
  4447 00001F17 FF76FA                   push word [bp-6]
  4448 00001F1A 68[D620]                 push expr_16
  4449 00001F1D FF76FE                   push word [bp-2]
  4450 00001F20 E87402                   call dovar1
  4451 00001F23 83C408                   add  sp, 8
  4452                                  
  4453                                  ;-449   
  4454                                  
  4455                                  
  4456                                  ;-450 e1:    if (istoken('+')) rterm("add");
  4457                                  
  4458                                  .e1:
  4459 00001F26 6A2B                     push 43
  4460 00001F28 E87C24                   call istoken
  4461 00001F2B 83C402                   add  sp, 2
  4462 00001F2E 08C0                     or  al, al
  4463 00001F30 0F840C00                 je .expr229
  4464 00001F34 68[DA20]                 push expr_17
  4465 00001F37 E82704                   call rterm
  4466 00001F3A 83C402                   add  sp, 2
  4467                                  
  4468                                  ;-451   else if (istoken('-')) rterm("sub" );
  4469                                  
  4470 00001F3D E9CF00                   jmp .expr230
  4471                                  .expr229:
  4472 00001F40 6A2D                     push 45
  4473 00001F42 E86224                   call istoken
  4474 00001F45 83C402                   add  sp, 2
  4475 00001F48 08C0                     or  al, al
  4476 00001F4A 0F840C00                 je .expr231
  4477 00001F4E 68[DE20]                 push expr_18
  4478 00001F51 E80D04                   call rterm
  4479 00001F54 83C402                   add  sp, 2
  4480                                  
  4481                                  ;-452   else if (istoken('&')) rterm("and" );
  4482                                  
  4483 00001F57 E9B500                   jmp .expr232
  4484                                  .expr231:
  4485 00001F5A 6A26                     push 38
  4486 00001F5C E84824                   call istoken
  4487 00001F5F 83C402                   add  sp, 2
  4488 00001F62 08C0                     or  al, al
  4489 00001F64 0F840C00                 je .expr233
  4490 00001F68 68[E220]                 push expr_19
  4491 00001F6B E8F303                   call rterm
  4492 00001F6E 83C402                   add  sp, 2
  4493                                  
  4494                                  ;-453   else if (istoken('|')) rterm("or" );  
  4495                                  
  4496 00001F71 E99B00                   jmp .expr234
  4497                                  .expr233:
  4498 00001F74 6A7C                     push 124
  4499 00001F76 E82E24                   call istoken
  4500 00001F79 83C402                   add  sp, 2
  4501 00001F7C 08C0                     or  al, al
  4502 00001F7E 0F840C00                 je .expr235
  4503 00001F82 68[E620]                 push expr_20
  4504 00001F85 E8D903                   call rterm
  4505 00001F88 83C402                   add  sp, 2
  4506                                  
  4507                                  ;-454   else if (istoken(T_LESSLESS)) rterm("shl");
  4508                                  
  4509 00001F8B E98100                   jmp .expr236
  4510                                  .expr235:
  4511 00001F8E 68D804                   push 1240
  4512 00001F91 E81324                   call istoken
  4513 00001F94 83C402                   add  sp, 2
  4514 00001F97 08C0                     or  al, al
  4515 00001F99 0F840C00                 je .expr237
  4516 00001F9D 68[E920]                 push expr_21
  4517 00001FA0 E8BE03                   call rterm
  4518 00001FA3 83C402                   add  sp, 2
  4519                                  
  4520                                  ;-455   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4521                                  
  4522 00001FA6 E96600                   jmp .expr238
  4523                                  .expr237:
  4524 00001FA9 68D904                   push 1241
  4525 00001FAC E8F823                   call istoken
  4526 00001FAF 83C402                   add  sp, 2
  4527 00001FB2 08C0                     or  al, al
  4528 00001FB4 0F840C00                 je .expr239
  4529 00001FB8 68[ED20]                 push expr_22
  4530 00001FBB E8A303                   call rterm
  4531 00001FBE 83C402                   add  sp, 2
  4532                                  
  4533                                  ;-456   else if (istoken('*')) domul (ids);
  4534                                  
  4535 00001FC1 E94B00                   jmp .expr240
  4536                                  .expr239:
  4537 00001FC4 6A2A                     push 42
  4538 00001FC6 E8DE23                   call istoken
  4539 00001FC9 83C402                   add  sp, 2
  4540 00001FCC 08C0                     or  al, al
  4541 00001FCE 0F840C00                 je .expr241
  4542 00001FD2 FF76F6                   push word [bp-10]
  4543 00001FD5 E8DD09                   call domul
  4544 00001FD8 83C402                   add  sp, 2
  4545                                  
  4546                                  ;-457   else if (istoken('/')) doidiv(ids);
  4547                                  
  4548 00001FDB E93100                   jmp .expr242
  4549                                  .expr241:
  4550 00001FDE 6A2F                     push 47
  4551 00001FE0 E8C423                   call istoken
  4552 00001FE3 83C402                   add  sp, 2
  4553 00001FE6 08C0                     or  al, al
  4554 00001FE8 0F840C00                 je .expr243
  4555 00001FEC FF76F6                   push word [bp-10]
  4556 00001FEF E8640A                   call doidiv
  4557 00001FF2 83C402                   add  sp, 2
  4558                                  
  4559                                  ;-458   else if (istoken('%')) domod (ids);
  4560                                  
  4561 00001FF5 E91700                   jmp .expr244
  4562                                  .expr243:
  4563 00001FF8 6A25                     push 37
  4564 00001FFA E8AA23                   call istoken
  4565 00001FFD 83C402                   add  sp, 2
  4566 00002000 08C0                     or  al, al
  4567 00002002 0F840900                 je .expr245
  4568 00002006 FF76F6                   push word [bp-10]
  4569 00002009 E8ED0B                   call domod
  4570 0000200C 83C402                   add  sp, 2
  4571                                  
  4572                                  ;-459   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4573                                  
  4574                                  .expr245:
  4575                                  .expr244:
  4576                                  .expr242:
  4577                                  .expr240:
  4578                                  .expr238:
  4579                                  .expr236:
  4580                                  .expr234:
  4581                                  .expr232:
  4582                                  .expr230:
  4583 0000200F E80A1C                   call isrelational
  4584 00002012 08C0                     or  al, al
  4585 00002014 0F841200                 je .expr246
  4586 00002018 68[F120]                 push expr_23
  4587 0000201B E84303                   call rterm
  4588 0000201E 83C402                   add  sp, 2
  4589 00002021 FF76F6                   push word [bp-10]
  4590 00002024 E83719                   call cmpneg
  4591 00002027 83C402                   add  sp, 2
  4592                                  
  4593                                  ;-460   return 0;
  4594                                  
  4595                                  .expr246:
  4596 0000202A B80000                   mov ax, 0
  4597 0000202D E90000                   jmp .retnexpr
  4598                                  
  4599                                  ;-461 }
  4600                                  
  4601                                  
  4602                                  ;-462 
  4603                                  
  4604                                  
  4605                                  ;-463 int compoundass(char *op, int mode, int id1) {
  4606                                  
  4607 00002030 C9                       .retnexpr: LEAVE
  4608 00002031 C3                       ret
  4609 00002032 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4610 0000203B 2C2000             
  4611 0000203E 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4612 00002047 78206D757373205A61-
  4613 00002050 686C206F6465722069-
  4614 00002059 6E74207365696E00   
  4615 00002061 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4616 0000206A 726C6175627400     
  4617 00002071 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4618 0000207A 776F726400              expr_4 db "word",0
  4619 0000207F 6279746500              expr_5 db "byte",0
  4620 00002084 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4621 0000208D 726C6175627400     
  4622 00002094 5C6E20646563202000      expr_7 db "\n dec  ",0
  4623 0000209D 776F726400              expr_8 db "word",0
  4624 000020A2 6279746500              expr_9 db "byte",0
  4625 000020A7 61646400                expr_10 db "add",0
  4626 000020AB 73756200                expr_11 db "sub",0
  4627 000020AF 616E6400                expr_12 db "and",0
  4628 000020B3 6F7200                  expr_13 db "or",0
  4629 000020B6 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4630 000020BF 6D656E74656400     
  4631 000020C6 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4632 000020CF 6D656E74656400     
  4633 000020D6 6D6F7600                expr_16 db "mov",0
  4634 000020DA 61646400                expr_17 db "add",0
  4635 000020DE 73756200                expr_18 db "sub",0
  4636 000020E2 616E6400                expr_19 db "and",0
  4637 000020E6 6F7200                  expr_20 db "or",0
  4638 000020E9 73686C00                expr_21 db "shl",0
  4639 000020ED 73687200                expr_22 db "shr",0
  4640 000020F1 636D7000                expr_23 db "cmp",0
  4641                                  ENDP
  4642                                  
  4643                                  compoundass: PROC
  4644                                  
  4645                                  ;-464   if(mode) error1("only scalar Var allowed");
  4646                                  
  4647                                  ;Function : compoundass, Number of local variables: 3
  4648                                  ;   # type sign width addr used name   list of local variables
  4649                                  ;  200 ptr sign byte   463 NULL op = bp+4
  4650                                  ;  201 var sign word   463 NULL mode = bp+6
  4651                                  ;  202 var sign word   463 NULL id1 = bp+8;
  4652 000020F5 C8000000                 ENTER  0,0
  4653 000020F9 8B4606                   mov ax, [bp+6]
  4654 000020FC 08C0                     or  al, al
  4655 000020FE 0F840900                 je .compoundass247
  4656 00002102 68[6F21]                 push compoundass_0
  4657 00002105 E8BA26                   call error1
  4658 00002108 83C402                   add  sp, 2
  4659                                  
  4660                                  ;-465   prnl(); prs(op); prs("  "); 
  4661                                  
  4662                                  .compoundass247:
  4663 0000210B E8C023                   call prnl
  4664 0000210E FF7604                   push word [bp+4]
  4665 00002111 E8C823                   call prs
  4666 00002114 83C402                   add  sp, 2
  4667 00002117 68[8721]                 push compoundass_1
  4668 0000211A E8BF23                   call prs
  4669 0000211D 83C402                   add  sp, 2
  4670                                  
  4671                                  ;-466   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4672                                  
  4673 00002120 FF7608                   push word [bp+8]
  4674 00002123 E8F7E6                   call gettypes
  4675 00002126 83C402                   add  sp, 2
  4676 00002129 A1[3900]                 mov ax, [wi]
  4677 0000212C 83F802                   cmp ax, 2
  4678 0000212F 0F850C00                 jne .compoundass248
  4679 00002133 68[8A21]                 push compoundass_2
  4680 00002136 E8A323                   call prs
  4681 00002139 83C402                   add  sp, 2
  4682 0000213C E90900                   jmp .compoundass249
  4683                                  .compoundass248:
  4684 0000213F 68[8F21]                 push compoundass_3
  4685 00002142 E89723                   call prs
  4686 00002145 83C402                   add  sp, 2
  4687                                  
  4688                                  ;-467   v(id1); prs(", ");
  4689                                  
  4690                                  .compoundass249:
  4691 00002148 FF7608                   push word [bp+8]
  4692 0000214B E821E2                   call v
  4693 0000214E 83C402                   add  sp, 2
  4694 00002151 68[9421]                 push compoundass_4
  4695 00002154 E88523                   call prs
  4696 00002157 83C402                   add  sp, 2
  4697                                  
  4698                                  ;-468   expect(T_CONST); prunsign1(lexval);
  4699                                  
  4700 0000215A 680101                   push 257
  4701 0000215D E86922                   call expect
  4702 00002160 83C402                   add  sp, 2
  4703 00002163 FF36[2E00]               push word [lexval]
  4704 00002167 E8C724                   call prunsign1
  4705 0000216A 83C402                   add  sp, 2
  4706                                  
  4707                                  ;-469 }
  4708                                  
  4709                                  
  4710                                  ;-470 int dovar1(int mode, int op, int ixarr, int id1) { 
  4711 0000216D C9                       LEAVE
  4712 0000216E C3                       ret
  4713 0000216F 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4714 00002178 61722056617220616C-
  4715 00002181 6C6F77656400       
  4716 00002187 202000                  compoundass_1 db "  ",0
  4717 0000218A 776F726400              compoundass_2 db "word",0
  4718 0000218F 6279746500              compoundass_3 db "byte",0
  4719 00002194 2C2000                  compoundass_4 db ", ",0
  4720                                  ENDP
  4721                                  
  4722                                  dovar1: PROC
  4723                                  
  4724                                  ;-471   gettypes(id1);
  4725                                  
  4726                                  ;Function : dovar1, Number of local variables: 4
  4727                                  ;   # type sign width addr used name   list of local variables
  4728                                  ;  200 var sign word   470 NULL mode = bp+4
  4729                                  ;  201 var sign word   470 NULL op = bp+6
  4730                                  ;  202 var sign word   470 NULL ixarr = bp+8
  4731                                  ;  203 var sign word   470 NULL id1 = bp+10;
  4732 00002197 C8000000                 ENTER  0,0
  4733 0000219B FF760A                   push word [bp+10]
  4734 0000219E E87CE6                   call gettypes
  4735 000021A1 83C402                   add  sp, 2
  4736                                  
  4737                                  ;-472   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4738                                  
  4739 000021A4 8B4604                   mov ax, [bp+4]
  4740 000021A7 83F801                   cmp ax, 1
  4741 000021AA 0F854700                 jne .dovar1250
  4742 000021AE 68[EC22]                 push dovar1_0
  4743 000021B1 E82823                   call prs
  4744 000021B4 83C402                   add  sp, 2
  4745 000021B7 FF760A                   push word [bp+10]
  4746 000021BA E8B2E1                   call v
  4747 000021BD 83C402                   add  sp, 2
  4748 000021C0 E80B23                   call prnl
  4749 000021C3 FF7606                   push word [bp+6]
  4750 000021C6 E81323                   call prs
  4751 000021C9 83C402                   add  sp, 2
  4752                                  
  4753                                  ;-473     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4754                                  
  4755 000021CC A1[3600]                 mov ax, [widthi]
  4756 000021CF 83F801                   cmp ax, 1
  4757 000021D2 0F850900                 jne .dovar1251
  4758 000021D6 68[F822]                 push dovar1_1
  4759 000021D9 E80023                   call prs
  4760 000021DC 83C402                   add  sp, 2
  4761                                  
  4762                                  ;-474     if(widthi == 2) prs(" ax, [bx]");
  4763                                  
  4764                                  .dovar1251:
  4765 000021DF A1[3600]                 mov ax, [widthi]
  4766 000021E2 83F802                   cmp ax, 2
  4767 000021E5 0F850900                 jne .dovar1252
  4768 000021E9 68[0E23]                 push dovar1_2
  4769 000021EC E8ED22                   call prs
  4770 000021EF 83C402                   add  sp, 2
  4771                                  
  4772                                  ;-475     return; }
  4773                                  
  4774                                  .dovar1252:
  4775 000021F2 E9F500                   jmp .retndovar1
  4776                                  
  4777                                  ;-476   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4778                                  
  4779                                  .dovar1250:
  4780 000021F5 8B4604                   mov ax, [bp+4]
  4781 000021F8 83F802                   cmp ax, 2
  4782 000021FB 0F852100                 jne .dovar1253
  4783 000021FF E8CC22                   call prnl
  4784 00002202 FF7606                   push word [bp+6]
  4785 00002205 E8D422                   call prs
  4786 00002208 83C402                   add  sp, 2
  4787 0000220B 68[1823]                 push dovar1_3
  4788 0000220E E8CB22                   call prs
  4789 00002211 83C402                   add  sp, 2
  4790 00002214 FF760A                   push word [bp+10]
  4791 00002217 E846E1                   call a
  4792 0000221A 83C402                   add  sp, 2
  4793 0000221D E9CA00                   jmp .retndovar1
  4794                                  
  4795                                  ;-477   if (ixarr) {
  4796                                  
  4797                                  .dovar1253:
  4798 00002220 8B4608                   mov ax, [bp+8]
  4799 00002223 08C0                     or  al, al
  4800 00002225 0F847300                 je .dovar1254
  4801                                  
  4802                                  ;-478     prs("\n mov bx, "); v(ixarr);
  4803                                  
  4804 00002229 68[1E23]                 push dovar1_4
  4805 0000222C E8AD22                   call prs
  4806 0000222F 83C402                   add  sp, 2
  4807 00002232 FF7608                   push word [bp+8]
  4808 00002235 E837E1                   call v
  4809 00002238 83C402                   add  sp, 2
  4810                                  
  4811                                  ;-479     if (wi==2) prs("\n shl bx, 1");
  4812                                  
  4813 0000223B A1[3900]                 mov ax, [wi]
  4814 0000223E 83F802                   cmp ax, 2
  4815 00002241 0F850900                 jne .dovar1255
  4816 00002245 68[2A23]                 push dovar1_5
  4817 00002248 E89122                   call prs
  4818 0000224B 83C402                   add  sp, 2
  4819                                  
  4820                                  ;-480     prs("\n "); prs(op);
  4821                                  
  4822                                  .dovar1255:
  4823 0000224E 68[3723]                 push dovar1_6
  4824 00002251 E88822                   call prs
  4825 00002254 83C402                   add  sp, 2
  4826 00002257 FF7606                   push word [bp+6]
  4827 0000225A E87F22                   call prs
  4828 0000225D 83C402                   add  sp, 2
  4829                                  
  4830                                  ;-481     if (wi==2) prs(" ax, "); else prs(" al, ");
  4831                                  
  4832 00002260 A1[3900]                 mov ax, [wi]
  4833 00002263 83F802                   cmp ax, 2
  4834 00002266 0F850C00                 jne .dovar1256
  4835 0000226A 68[3B23]                 push dovar1_7
  4836 0000226D E86C22                   call prs
  4837 00002270 83C402                   add  sp, 2
  4838 00002273 E90900                   jmp .dovar1257
  4839                                  .dovar1256:
  4840 00002276 68[4123]                 push dovar1_8
  4841 00002279 E86022                   call prs
  4842 0000227C 83C402                   add  sp, 2
  4843                                  
  4844                                  ;-482 // v(id1); prs(" [bx]");
  4845                                  
  4846                                  
  4847                                  ;-483     prc('['); printName(id1); prs(" + bx]"); 
  4848                                  
  4849                                  .dovar1257:
  4850 0000227F 6A5B                     push 91
  4851 00002281 E8F121                   call prc
  4852 00002284 83C402                   add  sp, 2
  4853 00002287 FF760A                   push word [bp+10]
  4854 0000228A E86AE6                   call printName
  4855 0000228D 83C402                   add  sp, 2
  4856 00002290 68[4723]                 push dovar1_9
  4857 00002293 E84622                   call prs
  4858 00002296 83C402                   add  sp, 2
  4859                                  
  4860                                  ;-484     return; }
  4861                                  
  4862 00002299 E94E00                   jmp .retndovar1
  4863                                  
  4864                                  ;-485   prnl();prs(op);
  4865                                  
  4866                                  .dovar1254:
  4867 0000229C E82F22                   call prnl
  4868 0000229F FF7606                   push word [bp+6]
  4869 000022A2 E83722                   call prs
  4870 000022A5 83C402                   add  sp, 2
  4871                                  
  4872                                  ;-486   if(wi==1) prs(" al, ");
  4873                                  
  4874 000022A8 A1[3900]                 mov ax, [wi]
  4875 000022AB 83F801                   cmp ax, 1
  4876 000022AE 0F850900                 jne .dovar1258
  4877 000022B2 68[4E23]                 push dovar1_10
  4878 000022B5 E82422                   call prs
  4879 000022B8 83C402                   add  sp, 2
  4880                                  
  4881                                  ;-487   if(wi==2) prs(" ax, ");
  4882                                  
  4883                                  .dovar1258:
  4884 000022BB A1[3900]                 mov ax, [wi]
  4885 000022BE 83F802                   cmp ax, 2
  4886 000022C1 0F850900                 jne .dovar1259
  4887 000022C5 68[5423]                 push dovar1_11
  4888 000022C8 E81122                   call prs
  4889 000022CB 83C402                   add  sp, 2
  4890                                  
  4891                                  ;-488   if(wi==4) prs(" eax, ");
  4892                                  
  4893                                  .dovar1259:
  4894 000022CE A1[3900]                 mov ax, [wi]
  4895 000022D1 83F804                   cmp ax, 4
  4896 000022D4 0F850900                 jne .dovar1260
  4897 000022D8 68[5A23]                 push dovar1_12
  4898 000022DB E8FE21                   call prs
  4899 000022DE 83C402                   add  sp, 2
  4900                                  
  4901                                  ;-489   v(id1);
  4902                                  
  4903                                  .dovar1260:
  4904 000022E1 FF760A                   push word [bp+10]
  4905 000022E4 E888E0                   call v
  4906 000022E7 83C402                   add  sp, 2
  4907                                  
  4908                                  ;-490 }
  4909                                  
  4910                                  
  4911                                  ;-491 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4912                                  
  4913 000022EA C9                       .retndovar1: LEAVE
  4914 000022EB C3                       ret
  4915 000022EC 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4916 000022F5 2C2000             
  4917 000022F8 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4918 00002301 5C6E206D6F76206168-
  4919 0000230A 2C203000           
  4920 0000230E 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4921 00002317 00                 
  4922 00002318 2061782C2000            dovar1_3 db " ax, ",0
  4923 0000231E 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4924 00002327 2C2000             
  4925 0000232A 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4926 00002333 2C203100           
  4927 00002337 5C6E2000                dovar1_6 db "\n ",0
  4928 0000233B 2061782C2000            dovar1_7 db " ax, ",0
  4929 00002341 20616C2C2000            dovar1_8 db " al, ",0
  4930 00002347 202B2062785D00          dovar1_9 db " + bx]",0
  4931 0000234E 20616C2C2000            dovar1_10 db " al, ",0
  4932 00002354 2061782C2000            dovar1_11 db " ax, ",0
  4933 0000235A 206561782C2000          dovar1_12 db " eax, ",0
  4934                                  ENDP
  4935                                  
  4936                                  rterm: PROC
  4937                                  
  4938                                  ;-492   if (istoken(T_CONST)) { prnl(); prs(op); 
  4939                                  
  4940                                  ;Function : rterm, Number of local variables: 5
  4941                                  ;   # type sign width addr used name   list of local variables
  4942                                  ;  200 ptr sign byte   491 NULL op = bp+4
  4943                                  ;  201 var sign word   491 NULL mode = bp-2
  4944                                  ;  202 var sign word   491 NULL opint = bp-4
  4945                                  ;  203 var sign word   491 NULL ixarr = bp-6
  4946                                  ;  204 var sign word   491 NULL id1 = bp-8;
  4947 00002361 C8080000                 ENTER  8,0
  4948 00002365 680101                   push 257
  4949 00002368 E83C20                   call istoken
  4950 0000236B 83C402                   add  sp, 2
  4951 0000236E 08C0                     or  al, al
  4952 00002370 0F845200                 je .rterm261
  4953 00002374 E85721                   call prnl
  4954 00002377 FF7604                   push word [bp+4]
  4955 0000237A E85F21                   call prs
  4956 0000237D 83C402                   add  sp, 2
  4957                                  
  4958                                  ;-493     if (wi==1) prs(" al, ");
  4959                                  
  4960 00002380 A1[3900]                 mov ax, [wi]
  4961 00002383 83F801                   cmp ax, 1
  4962 00002386 0F850900                 jne .rterm262
  4963 0000238A 68[4A24]                 push rterm_0
  4964 0000238D E84C21                   call prs
  4965 00002390 83C402                   add  sp, 2
  4966                                  
  4967                                  ;-494     if (wi==2) prs(" ax, ");
  4968                                  
  4969                                  .rterm262:
  4970 00002393 A1[3900]                 mov ax, [wi]
  4971 00002396 83F802                   cmp ax, 2
  4972 00002399 0F850900                 jne .rterm263
  4973 0000239D 68[5024]                 push rterm_1
  4974 000023A0 E83921                   call prs
  4975 000023A3 83C402                   add  sp, 2
  4976                                  
  4977                                  ;-495     if (wi==4) prs(" eax, ");
  4978                                  
  4979                                  .rterm263:
  4980 000023A6 A1[3900]                 mov ax, [wi]
  4981 000023A9 83F804                   cmp ax, 4
  4982 000023AC 0F850900                 jne .rterm264
  4983 000023B0 68[5624]                 push rterm_2
  4984 000023B3 E82621                   call prs
  4985 000023B6 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-496     prunsign1(lexval); return;}
  4988                                  
  4989                                  .rterm264:
  4990 000023B9 FF36[2E00]               push word [lexval]
  4991 000023BD E87122                   call prunsign1
  4992 000023C0 83C402                   add  sp, 2
  4993 000023C3 E98200                   jmp .retnrterm
  4994                                  
  4995                                  ;-497   mode=typeName(); id1=searchname(); ixarr=0;
  4996                                  
  4997                                  .rterm261:
  4998 000023C6 E861E6                   call typeName
  4999 000023C9 8946FE                   mov [bp-2], ax
  5000 000023CC E88CE5                   call searchname
  5001 000023CF 8946F8                   mov [bp-8], ax
  5002 000023D2 B80000                   mov ax, 0
  5003 000023D5 8946FA                   mov [bp-6], ax
  5004                                  
  5005                                  ;-498   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5006                                  
  5007 000023D8 6A5B                     push 91
  5008 000023DA E8CA1F                   call istoken
  5009 000023DD 83C402                   add  sp, 2
  5010 000023E0 08C0                     or  al, al
  5011 000023E2 0F843300                 je .rterm265
  5012 000023E6 E872E5                   call searchname
  5013 000023E9 8946FA                   mov [bp-6], ax
  5014 000023EC 680001                   push 256
  5015 000023EF E8D71F                   call expect
  5016 000023F2 83C402                   add  sp, 2
  5017 000023F5 6A5D                     push 93
  5018 000023F7 E8CF1F                   call expect
  5019 000023FA 83C402                   add  sp, 2
  5020                                  
  5021                                  ;-499     gettypes(ixarr);
  5022                                  
  5023 000023FD FF76FA                   push word [bp-6]
  5024 00002400 E81AE4                   call gettypes
  5025 00002403 83C402                   add  sp, 2
  5026                                  
  5027                                  ;-500     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5028                                  
  5029 00002406 A1[3600]                 mov ax, [widthi]
  5030 00002409 83F802                   cmp ax, 2
  5031 0000240C 0F840900                 je  .rterm266
  5032 00002410 68[5D24]                 push rterm_3
  5033 00002413 E8AC23                   call error1
  5034 00002416 83C402                   add  sp, 2
  5035                                  .rterm266:
  5036                                  
  5037                                  ;-501   if (eqstr(symbol,"_AX")) return;
  5038                                  
  5039                                  .rterm265:
  5040 00002419 68[7624]                 push rterm_4
  5041 0000241C 8D062B81                 lea  ax, [symbol]
  5042 00002420 50                       push ax
  5043 00002421 E872DD                   call eqstr
  5044 00002424 83C404                   add  sp, 4
  5045 00002427 08C0                     or  al, al
  5046 00002429 0F840300                 je .rterm267
  5047 0000242D E91800                   jmp .retnrterm
  5048                                  
  5049                                  ;-502   opint=op; dovar1(mode, opint, ixarr, id1);
  5050                                  
  5051                                  .rterm267:
  5052 00002430 8B4604                   mov ax, [bp+4]
  5053 00002433 8946FC                   mov [bp-4], ax
  5054 00002436 FF76F8                   push word [bp-8]
  5055 00002439 FF76FA                   push word [bp-6]
  5056 0000243C FF76FC                   push word [bp-4]
  5057 0000243F FF76FE                   push word [bp-2]
  5058 00002442 E852FD                   call dovar1
  5059 00002445 83C408                   add  sp, 8
  5060                                  
  5061                                  ;-503 }
  5062                                  
  5063                                  
  5064                                  ;-504 int isreg() {
  5065                                  
  5066 00002448 C9                       .retnrterm: LEAVE
  5067 00002449 C3                       ret
  5068 0000244A 20616C2C2000            rterm_0 db " al, ",0
  5069 00002450 2061782C2000            rterm_1 db " ax, ",0
  5070 00002456 206561782C2000          rterm_2 db " eax, ",0
  5071 0000245D 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5072 00002466 78206D75737320696E-
  5073 0000246F 74207365696E00     
  5074 00002476 5F415800                rterm_4 db "_AX",0
  5075                                  ENDP
  5076                                  
  5077                                  isreg: PROC
  5078                                  
  5079                                  ;-505   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5080                                  
  5081 0000247A 68[6726]                 push isreg_0
  5082 0000247D 8D062B81                 lea  ax, [symbol]
  5083 00002481 50                       push ax
  5084 00002482 E811DD                   call eqstr
  5085 00002485 83C404                   add  sp, 4
  5086 00002488 08C0                     or  al, al
  5087 0000248A 0F840C00                 je .isreg268
  5088 0000248E 68[6B26]                 push isreg_1
  5089 00002491 E84202                   call doreg
  5090 00002494 83C402                   add  sp, 2
  5091 00002497 E9C601                   jmp .r1
  5092                                  
  5093                                  ;-506   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5094                                  
  5095                                  .isreg268:
  5096 0000249A 68[6E26]                 push isreg_2
  5097 0000249D 8D062B81                 lea  ax, [symbol]
  5098 000024A1 50                       push ax
  5099 000024A2 E8F1DC                   call eqstr
  5100 000024A5 83C404                   add  sp, 4
  5101 000024A8 08C0                     or  al, al
  5102 000024AA 0F840C00                 je .isreg269
  5103 000024AE 68[7226]                 push isreg_3
  5104 000024B1 E82202                   call doreg
  5105 000024B4 83C402                   add  sp, 2
  5106 000024B7 E9A601                   jmp .r1
  5107                                  
  5108                                  ;-507   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5109                                  
  5110                                  .isreg269:
  5111 000024BA 68[7526]                 push isreg_4
  5112 000024BD 8D062B81                 lea  ax, [symbol]
  5113 000024C1 50                       push ax
  5114 000024C2 E8D1DC                   call eqstr
  5115 000024C5 83C404                   add  sp, 4
  5116 000024C8 08C0                     or  al, al
  5117 000024CA 0F840C00                 je .isreg270
  5118 000024CE 68[7926]                 push isreg_5
  5119 000024D1 E80202                   call doreg
  5120 000024D4 83C402                   add  sp, 2
  5121 000024D7 E98601                   jmp .r1
  5122                                  
  5123                                  ;-508   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5124                                  
  5125                                  .isreg270:
  5126 000024DA 68[7C26]                 push isreg_6
  5127 000024DD 8D062B81                 lea  ax, [symbol]
  5128 000024E1 50                       push ax
  5129 000024E2 E8B1DC                   call eqstr
  5130 000024E5 83C404                   add  sp, 4
  5131 000024E8 08C0                     or  al, al
  5132 000024EA 0F840C00                 je .isreg271
  5133 000024EE 68[8026]                 push isreg_7
  5134 000024F1 E8E201                   call doreg
  5135 000024F4 83C402                   add  sp, 2
  5136 000024F7 E96601                   jmp .r1
  5137                                  
  5138                                  ;-509   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5139                                  
  5140                                  .isreg271:
  5141 000024FA 68[8326]                 push isreg_8
  5142 000024FD 8D062B81                 lea  ax, [symbol]
  5143 00002501 50                       push ax
  5144 00002502 E891DC                   call eqstr
  5145 00002505 83C404                   add  sp, 4
  5146 00002508 08C0                     or  al, al
  5147 0000250A 0F840C00                 je .isreg272
  5148 0000250E 68[8726]                 push isreg_9
  5149 00002511 E8C201                   call doreg
  5150 00002514 83C402                   add  sp, 2
  5151 00002517 E94601                   jmp .r1
  5152                                  
  5153                                  ;-510   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5154                                  
  5155                                  .isreg272:
  5156 0000251A 68[8A26]                 push isreg_10
  5157 0000251D 8D062B81                 lea  ax, [symbol]
  5158 00002521 50                       push ax
  5159 00002522 E871DC                   call eqstr
  5160 00002525 83C404                   add  sp, 4
  5161 00002528 08C0                     or  al, al
  5162 0000252A 0F840C00                 je .isreg273
  5163 0000252E 68[8E26]                 push isreg_11
  5164 00002531 E8A201                   call doreg
  5165 00002534 83C402                   add  sp, 2
  5166 00002537 E92601                   jmp .r1
  5167                                  
  5168                                  ;-511   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5169                                  
  5170                                  .isreg273:
  5171 0000253A 68[9126]                 push isreg_12
  5172 0000253D 8D062B81                 lea  ax, [symbol]
  5173 00002541 50                       push ax
  5174 00002542 E851DC                   call eqstr
  5175 00002545 83C404                   add  sp, 4
  5176 00002548 08C0                     or  al, al
  5177 0000254A 0F840C00                 je .isreg274
  5178 0000254E 68[9526]                 push isreg_13
  5179 00002551 E88201                   call doreg
  5180 00002554 83C402                   add  sp, 2
  5181 00002557 E90601                   jmp .r1
  5182                                  
  5183                                  ;-512   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5184                                  
  5185                                  .isreg274:
  5186 0000255A 68[9826]                 push isreg_14
  5187 0000255D 8D062B81                 lea  ax, [symbol]
  5188 00002561 50                       push ax
  5189 00002562 E831DC                   call eqstr
  5190 00002565 83C404                   add  sp, 4
  5191 00002568 08C0                     or  al, al
  5192 0000256A 0F840C00                 je .isreg275
  5193 0000256E 68[9C26]                 push isreg_15
  5194 00002571 E86201                   call doreg
  5195 00002574 83C402                   add  sp, 2
  5196 00002577 E9E600                   jmp .r1
  5197                                  
  5198                                  ;-513   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5199                                  
  5200                                  .isreg275:
  5201 0000257A 68[9F26]                 push isreg_16
  5202 0000257D 8D062B81                 lea  ax, [symbol]
  5203 00002581 50                       push ax
  5204 00002582 E811DC                   call eqstr
  5205 00002585 83C404                   add  sp, 4
  5206 00002588 08C0                     or  al, al
  5207 0000258A 0F840C00                 je .isreg276
  5208 0000258E 68[A326]                 push isreg_17
  5209 00002591 E84201                   call doreg
  5210 00002594 83C402                   add  sp, 2
  5211 00002597 E9C600                   jmp .r1
  5212                                  
  5213                                  ;-514   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5214                                  
  5215                                  .isreg276:
  5216 0000259A 68[A626]                 push isreg_18
  5217 0000259D 8D062B81                 lea  ax, [symbol]
  5218 000025A1 50                       push ax
  5219 000025A2 E8F1DB                   call eqstr
  5220 000025A5 83C404                   add  sp, 4
  5221 000025A8 08C0                     or  al, al
  5222 000025AA 0F840C00                 je .isreg277
  5223 000025AE 68[AA26]                 push isreg_19
  5224 000025B1 E82201                   call doreg
  5225 000025B4 83C402                   add  sp, 2
  5226 000025B7 E9A600                   jmp .r1
  5227                                  
  5228                                  ;-515   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5229                                  
  5230                                  .isreg277:
  5231 000025BA 68[AD26]                 push isreg_20
  5232 000025BD 8D062B81                 lea  ax, [symbol]
  5233 000025C1 50                       push ax
  5234 000025C2 E8D1DB                   call eqstr
  5235 000025C5 83C404                   add  sp, 4
  5236 000025C8 08C0                     or  al, al
  5237 000025CA 0F840C00                 je .isreg278
  5238 000025CE 68[B126]                 push isreg_21
  5239 000025D1 E80201                   call doreg
  5240 000025D4 83C402                   add  sp, 2
  5241 000025D7 E98600                   jmp .r1
  5242                                  
  5243                                  ;-516   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5244                                  
  5245                                  .isreg278:
  5246 000025DA 68[B426]                 push isreg_22
  5247 000025DD 8D062B81                 lea  ax, [symbol]
  5248 000025E1 50                       push ax
  5249 000025E2 E8B1DB                   call eqstr
  5250 000025E5 83C404                   add  sp, 4
  5251 000025E8 08C0                     or  al, al
  5252 000025EA 0F840C00                 je .isreg279
  5253 000025EE 68[B826]                 push isreg_23
  5254 000025F1 E8E200                   call doreg
  5255 000025F4 83C402                   add  sp, 2
  5256 000025F7 E96600                   jmp .r1
  5257                                  
  5258                                  ;-517   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5259                                  
  5260                                  .isreg279:
  5261 000025FA 68[BB26]                 push isreg_24
  5262 000025FD 8D062B81                 lea  ax, [symbol]
  5263 00002601 50                       push ax
  5264 00002602 E891DB                   call eqstr
  5265 00002605 83C404                   add  sp, 4
  5266 00002608 08C0                     or  al, al
  5267 0000260A 0F840C00                 je .isreg280
  5268 0000260E 68[BF26]                 push isreg_25
  5269 00002611 E8C200                   call doreg
  5270 00002614 83C402                   add  sp, 2
  5271 00002617 E94600                   jmp .r1
  5272                                  
  5273                                  ;-518   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5274                                  
  5275                                  .isreg280:
  5276 0000261A 68[C226]                 push isreg_26
  5277 0000261D 8D062B81                 lea  ax, [symbol]
  5278 00002621 50                       push ax
  5279 00002622 E871DB                   call eqstr
  5280 00002625 83C404                   add  sp, 4
  5281 00002628 08C0                     or  al, al
  5282 0000262A 0F840C00                 je .isreg281
  5283 0000262E 68[C626]                 push isreg_27
  5284 00002631 E8A200                   call doreg
  5285 00002634 83C402                   add  sp, 2
  5286 00002637 E92600                   jmp .r1
  5287                                  
  5288                                  ;-519   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5289                                  
  5290                                  .isreg281:
  5291 0000263A 68[C926]                 push isreg_28
  5292 0000263D 8D062B81                 lea  ax, [symbol]
  5293 00002641 50                       push ax
  5294 00002642 E851DB                   call eqstr
  5295 00002645 83C404                   add  sp, 4
  5296 00002648 08C0                     or  al, al
  5297 0000264A 0F840C00                 je .isreg282
  5298 0000264E 68[D026]                 push isreg_29
  5299 00002651 E88200                   call doreg
  5300 00002654 83C402                   add  sp, 2
  5301 00002657 E90600                   jmp .r1
  5302                                  
  5303                                  ;-520   return 0;   r1: return 1; 
  5304                                  
  5305                                  .isreg282:
  5306 0000265A B80000                   mov ax, 0
  5307 0000265D E90600                   jmp .retnisreg
  5308                                  .r1:
  5309 00002660 B80100                   mov ax, 1
  5310 00002663 E90000                   jmp .retnisreg
  5311                                  
  5312                                  ;-521 }
  5313                                  
  5314                                  
  5315                                  ;-522 int doreg(char *dr) { int i; expect('=');
  5316                                  
  5317                                   .retnisreg:
  5318 00002666 C3                       ret
  5319 00002667 5F414800                isreg_0 db "_AH",0
  5320 0000266B 616800                  isreg_1 db "ah",0
  5321 0000266E 5F414C00                isreg_2 db "_AL",0
  5322 00002672 616C00                  isreg_3 db "al",0
  5323 00002675 5F415800                isreg_4 db "_AX",0
  5324 00002679 617800                  isreg_5 db "ax",0
  5325 0000267C 5F424800                isreg_6 db "_BH",0
  5326 00002680 626800                  isreg_7 db "bh",0
  5327 00002683 5F424C00                isreg_8 db "_BL",0
  5328 00002687 626C00                  isreg_9 db "bl",0
  5329 0000268A 5F425800                isreg_10 db "_BX",0
  5330 0000268E 627800                  isreg_11 db "bx",0
  5331 00002691 5F434800                isreg_12 db "_CH",0
  5332 00002695 636800                  isreg_13 db "ch",0
  5333 00002698 5F434C00                isreg_14 db "_CL",0
  5334 0000269C 636C00                  isreg_15 db "cl",0
  5335 0000269F 5F435800                isreg_16 db "_CX",0
  5336 000026A3 637800                  isreg_17 db "cx",0
  5337 000026A6 5F444800                isreg_18 db "_DH",0
  5338 000026AA 646800                  isreg_19 db "dh",0
  5339 000026AD 5F444C00                isreg_20 db "_DL",0
  5340 000026B1 646C00                  isreg_21 db "dl",0
  5341 000026B4 5F445800                isreg_22 db "_DX",0
  5342 000026B8 647800                  isreg_23 db "dx",0
  5343 000026BB 5F534900                isreg_24 db "_SI",0
  5344 000026BF 736900                  isreg_25 db "si",0
  5345 000026C2 5F444900                isreg_26 db "_DI",0
  5346 000026C6 646900                  isreg_27 db "di",0
  5347 000026C9 5F464C41475300          isreg_28 db "_FLAGS",0
  5348 000026D0 666C61677300            isreg_29 db "flags",0
  5349                                  ENDP
  5350                                  
  5351                                  doreg: PROC
  5352                                  ;Function : doreg, Number of local variables: 2
  5353                                  ;   # type sign width addr used name   list of local variables
  5354                                  ;  200 ptr sign byte   522 NULL dr = bp+4
  5355                                  ;  201 var sign word   522 NULL i = bp-2;
  5356 000026D6 C8020000                 ENTER  2,0
  5357 000026DA 6A3D                     push 61
  5358 000026DC E8EA1C                   call expect
  5359 000026DF 83C402                   add  sp, 2
  5360                                  
  5361                                  ;-523   prs("\n mov  "); prs(dr); prs(", ");
  5362                                  
  5363 000026E2 68[4527]                 push doreg_0
  5364 000026E5 E8F41D                   call prs
  5365 000026E8 83C402                   add  sp, 2
  5366 000026EB FF7604                   push word [bp+4]
  5367 000026EE E8EB1D                   call prs
  5368 000026F1 83C402                   add  sp, 2
  5369 000026F4 68[4E27]                 push doreg_1
  5370 000026F7 E8E21D                   call prs
  5371 000026FA 83C402                   add  sp, 2
  5372                                  
  5373                                  ;-524        if (istoken(T_CONST)) prunsign1(lexval);
  5374                                  
  5375 000026FD 680101                   push 257
  5376 00002700 E8A41C                   call istoken
  5377 00002703 83C402                   add  sp, 2
  5378 00002706 08C0                     or  al, al
  5379 00002708 0F840D00                 je .doreg283
  5380 0000270C FF36[2E00]               push word [lexval]
  5381 00002710 E81E1F                   call prunsign1
  5382 00002713 83C402                   add  sp, 2
  5383                                  
  5384                                  ;-525   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5385                                  
  5386 00002716 E92A00                   jmp .doreg284
  5387                                  .doreg283:
  5388 00002719 680001                   push 256
  5389 0000271C E8881C                   call istoken
  5390 0000271F 83C402                   add  sp, 2
  5391 00002722 08C0                     or  al, al
  5392 00002724 0F841200                 je .doreg285
  5393 00002728 E830E2                   call searchname
  5394 0000272B 8946FE                   mov [bp-2], ax
  5395 0000272E FF76FE                   push word [bp-2]
  5396 00002731 E83BDC                   call v
  5397 00002734 83C402                   add  sp, 2
  5398                                  
  5399                                  ;-526   else error1("only number or var allowed"); }
  5400                                  
  5401 00002737 E90900                   jmp .doreg286
  5402                                  .doreg285:
  5403 0000273A 68[5127]                 push doreg_2
  5404 0000273D E88220                   call error1
  5405 00002740 83C402                   add  sp, 2
  5406                                  .doreg286:
  5407                                  .doreg284:
  5408                                  
  5409                                  ;-527 
  5410                                  
  5411                                  
  5412                                  ;-528 int doassign(int mode, int i, int ixarr, int ixconst) {
  5413 00002743 C9                       LEAVE
  5414 00002744 C3                       ret
  5415 00002745 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5416 0000274E 2C2000                  doreg_1 db ", ",0
  5417 00002751 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5418 0000275A 6572206F7220766172-
  5419 00002763 20616C6C6F77656400 
  5420                                  ENDP
  5421                                  
  5422                                  doassign: PROC
  5423                                  
  5424                                  ;-529   gettypes(i);
  5425                                  
  5426                                  ;Function : doassign, Number of local variables: 4
  5427                                  ;   # type sign width addr used name   list of local variables
  5428                                  ;  200 var sign word   528 NULL mode = bp+4
  5429                                  ;  201 var sign word   528 NULL i = bp+6
  5430                                  ;  202 var sign word   528 NULL ixarr = bp+8
  5431                                  ;  203 var sign word   528 NULL ixconst = bp+10;
  5432 0000276C C8000000                 ENTER  0,0
  5433 00002770 FF7606                   push word [bp+6]
  5434 00002773 E8A7E0                   call gettypes
  5435 00002776 83C402                   add  sp, 2
  5436                                  
  5437                                  ;-530   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5438                                  
  5439 00002779 8B4604                   mov ax, [bp+4]
  5440 0000277C 83F801                   cmp ax, 1
  5441 0000277F 0F853400                 jne .doassign287
  5442 00002783 68[0929]                 push doassign_0
  5443 00002786 E8531D                   call prs
  5444 00002789 83C402                   add  sp, 2
  5445 0000278C FF7606                   push word [bp+6]
  5446 0000278F E8DDDB                   call v
  5447 00002792 83C402                   add  sp, 2
  5448                                  
  5449                                  ;-531     if (widthi == 2) prs("\n mov  [bx], ax");
  5450                                  
  5451 00002795 A1[3600]                 mov ax, [widthi]
  5452 00002798 83F802                   cmp ax, 2
  5453 0000279B 0F850C00                 jne .doassign288
  5454 0000279F 68[1629]                 push doassign_1
  5455 000027A2 E8371D                   call prs
  5456 000027A5 83C402                   add  sp, 2
  5457                                  
  5458                                  ;-532     else  prs("\n mov  [bx], al"); return;}
  5459                                  
  5460 000027A8 E90900                   jmp .doassign289
  5461                                  .doassign288:
  5462 000027AB 68[2729]                 push doassign_2
  5463 000027AE E82B1D                   call prs
  5464 000027B1 83C402                   add  sp, 2
  5465                                  .doassign289:
  5466 000027B4 E95001                   jmp .retndoassign
  5467                                  
  5468                                  ;-533   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5469                                  
  5470                                  .doassign287:
  5471 000027B7 8B4604                   mov ax, [bp+4]
  5472 000027BA 83F802                   cmp ax, 2
  5473 000027BD 0F851E00                 jne .doassign290
  5474 000027C1 68[3829]                 push doassign_3
  5475 000027C4 E8151D                   call prs
  5476 000027C7 83C402                   add  sp, 2
  5477 000027CA FF7606                   push word [bp+6]
  5478 000027CD E890DB                   call a
  5479 000027D0 83C402                   add  sp, 2
  5480 000027D3 68[4129]                 push doassign_4
  5481 000027D6 E8031D                   call prs
  5482 000027D9 83C402                   add  sp, 2
  5483 000027DC E92801                   jmp .retndoassign
  5484                                  
  5485                                  ;-534   if (ixarr) {  prs("\n mov bx, ");
  5486                                  
  5487                                  .doassign290:
  5488 000027DF 8B4608                   mov ax, [bp+8]
  5489 000027E2 08C0                     or  al, al
  5490 000027E4 0F846E00                 je .doassign291
  5491 000027E8 68[4629]                 push doassign_5
  5492 000027EB E8EE1C                   call prs
  5493 000027EE 83C402                   add  sp, 2
  5494                                  
  5495                                  ;-535     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5496                                  
  5497 000027F1 8B460A                   mov ax, [bp+10]
  5498 000027F4 08C0                     or  al, al
  5499 000027F6 0F840C00                 je .doassign292
  5500 000027FA FF7608                   push word [bp+8]
  5501 000027FD E8311E                   call prunsign1
  5502 00002800 83C402                   add  sp, 2
  5503 00002803 E90900                   jmp .doassign293
  5504                                  .doassign292:
  5505 00002806 FF7608                   push word [bp+8]
  5506 00002809 E863DB                   call v
  5507 0000280C 83C402                   add  sp, 2
  5508                                  
  5509                                  ;-536     if (wi==2) prs("\n shl bx, 1");
  5510                                  
  5511                                  .doassign293:
  5512 0000280F A1[3900]                 mov ax, [wi]
  5513 00002812 83F802                   cmp ax, 2
  5514 00002815 0F850900                 jne .doassign294
  5515 00002819 68[5229]                 push doassign_6
  5516 0000281C E8BD1C                   call prs
  5517 0000281F 83C402                   add  sp, 2
  5518                                  
  5519                                  ;-537     prs("\n mov ["); printName(i);
  5520                                  
  5521                                  .doassign294:
  5522 00002822 68[5F29]                 push doassign_7
  5523 00002825 E8B41C                   call prs
  5524 00002828 83C402                   add  sp, 2
  5525 0000282B FF7606                   push word [bp+6]
  5526 0000282E E8C6E0                   call printName
  5527 00002831 83C402                   add  sp, 2
  5528                                  
  5529                                  ;-538     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5530                                  
  5531 00002834 A1[3900]                 mov ax, [wi]
  5532 00002837 83F802                   cmp ax, 2
  5533 0000283A 0F850C00                 jne .doassign295
  5534 0000283E 68[6829]                 push doassign_8
  5535 00002841 E8981C                   call prs
  5536 00002844 83C402                   add  sp, 2
  5537 00002847 E90900                   jmp .doassign296
  5538                                  .doassign295:
  5539 0000284A 68[7129]                 push doassign_9
  5540 0000284D E88C1C                   call prs
  5541 00002850 83C402                   add  sp, 2
  5542                                  .doassign296:
  5543 00002853 E9B100                   jmp .retndoassign
  5544                                  
  5545                                  ;-539   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5546                                  
  5547                                  .doassign291:
  5548 00002856 A1[3900]                 mov ax, [wi]
  5549 00002859 83F801                   cmp ax, 1
  5550 0000285C 0F853100                 jne .doassign297
  5551 00002860 68[7A29]                 push doassign_10
  5552 00002863 E8761C                   call prs
  5553 00002866 83C402                   add  sp, 2
  5554 00002869 8B4606                   mov ax, [bp+6]
  5555 0000286C 3DC800                   cmp ax, 200
  5556 0000286F 0F8D0900                 jge .doassign298
  5557 00002873 68[8229]                 push doassign_11
  5558 00002876 E8631C                   call prs
  5559 00002879 83C402                   add  sp, 2
  5560                                  
  5561                                  ;-540     } v(i); prs(", al"); return; }
  5562                                  
  5563                                  .doassign298:
  5564 0000287C FF7606                   push word [bp+6]
  5565 0000287F E8EDDA                   call v
  5566 00002882 83C402                   add  sp, 2
  5567 00002885 68[8829]                 push doassign_12
  5568 00002888 E8511C                   call prs
  5569 0000288B 83C402                   add  sp, 2
  5570 0000288E E97600                   jmp .retndoassign
  5571                                  
  5572                                  ;-541   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5573                                  
  5574                                  .doassign297:
  5575 00002891 A1[3900]                 mov ax, [wi]
  5576 00002894 83F802                   cmp ax, 2
  5577 00002897 0F853100                 jne .doassign299
  5578 0000289B 68[8D29]                 push doassign_13
  5579 0000289E E83B1C                   call prs
  5580 000028A1 83C402                   add  sp, 2
  5581 000028A4 8B4606                   mov ax, [bp+6]
  5582 000028A7 3DC800                   cmp ax, 200
  5583 000028AA 0F8D0900                 jge .doassign300
  5584 000028AE 68[9529]                 push doassign_14
  5585 000028B1 E8281C                   call prs
  5586 000028B4 83C402                   add  sp, 2
  5587                                  
  5588                                  ;-542     } v(i); prs(", ax"); return; }
  5589                                  
  5590                                  .doassign300:
  5591 000028B7 FF7606                   push word [bp+6]
  5592 000028BA E8B2DA                   call v
  5593 000028BD 83C402                   add  sp, 2
  5594 000028C0 68[9B29]                 push doassign_15
  5595 000028C3 E8161C                   call prs
  5596 000028C6 83C402                   add  sp, 2
  5597 000028C9 E93B00                   jmp .retndoassign
  5598                                  
  5599                                  ;-543   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5600                                  
  5601                                  .doassign299:
  5602 000028CC A1[3900]                 mov ax, [wi]
  5603 000028CF 83F804                   cmp ax, 4
  5604 000028D2 0F853100                 jne .doassign301
  5605 000028D6 68[A029]                 push doassign_16
  5606 000028D9 E8001C                   call prs
  5607 000028DC 83C402                   add  sp, 2
  5608 000028DF 8B4606                   mov ax, [bp+6]
  5609 000028E2 3DC800                   cmp ax, 200
  5610 000028E5 0F8D0900                 jge .doassign302
  5611 000028E9 68[A829]                 push doassign_17
  5612 000028EC E8ED1B                   call prs
  5613 000028EF 83C402                   add  sp, 2
  5614                                  
  5615                                  ;-544     } v(i); prs(", eax"); return; }
  5616                                  
  5617                                  .doassign302:
  5618 000028F2 FF7606                   push word [bp+6]
  5619 000028F5 E877DA                   call v
  5620 000028F8 83C402                   add  sp, 2
  5621 000028FB 68[AF29]                 push doassign_18
  5622 000028FE E8DB1B                   call prs
  5623 00002901 83C402                   add  sp, 2
  5624 00002904 E90000                   jmp .retndoassign
  5625                                  
  5626                                  ;-545 }
  5627                                  
  5628                                  .doassign301:
  5629                                  
  5630                                  ;-546 int domul(int ids) {
  5631                                  
  5632 00002907 C9                       .retndoassign: LEAVE
  5633 00002908 C3                       ret
  5634 00002909 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5635 00002912 782C2000           
  5636 00002916 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5637 0000291F 62785D2C20617800   
  5638 00002927 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5639 00002930 62785D2C20616C00   
  5640 00002938 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5641 00002941 2C20617800              doassign_4 db ", ax",0
  5642 00002946 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5643 0000294F 2C2000             
  5644 00002952 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5645 0000295B 2C203100           
  5646 0000295F 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5647 00002968 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5648 00002971 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5649 0000297A 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5650 00002982 627974652000            doassign_11 db "byte ",0
  5651 00002988 2C20616C00              doassign_12 db ", al",0
  5652 0000298D 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5653 00002995 776F72642000            doassign_14 db "word ",0
  5654 0000299B 2C20617800              doassign_15 db ", ax",0
  5655 000029A0 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5656 000029A8 64776F72642000          doassign_17 db "dword ",0
  5657 000029AF 2C2065617800            doassign_18 db ", eax",0
  5658                                  ENDP
  5659                                  
  5660                                  domul: PROC
  5661                                  
  5662                                  ;-547   if (ids) rterm("imul"); else {
  5663                                  
  5664                                  ;Function : domul, Number of local variables: 1
  5665                                  ;   # type sign width addr used name   list of local variables
  5666                                  ;  200 var sign word   546 NULL ids = bp+4;
  5667 000029B5 C8000000                 ENTER  0,0
  5668 000029B9 8B4604                   mov ax, [bp+4]
  5669 000029BC 08C0                     or  al, al
  5670 000029BE 0F840C00                 je .domul303
  5671 000029C2 68[072A]                 push domul_0
  5672 000029C5 E899F9                   call rterm
  5673 000029C8 83C402                   add  sp, 2
  5674 000029CB E93700                   jmp .domul304
  5675                                  .domul303:
  5676                                  
  5677                                  ;-548   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5678                                  
  5679 000029CE 680101                   push 257
  5680 000029D1 E8D319                   call istoken
  5681 000029D4 83C402                   add  sp, 2
  5682 000029D7 08C0                     or  al, al
  5683 000029D9 0F841F00                 je .domul305
  5684 000029DD 68[0C2A]                 push domul_1
  5685 000029E0 E8F91A                   call prs
  5686 000029E3 83C402                   add  sp, 2
  5687 000029E6 FF36[2E00]               push word [lexval]
  5688 000029EA E8441C                   call prunsign1
  5689 000029ED 83C402                   add  sp, 2
  5690 000029F0 68[182A]                 push domul_2
  5691 000029F3 E8E61A                   call prs
  5692 000029F6 83C402                   add  sp, 2
  5693                                  
  5694                                  ;-549   else error1("with MUL only const number as multiplicator allowed"); } }
  5695                                  
  5696 000029F9 E90900                   jmp .domul306
  5697                                  .domul305:
  5698 000029FC 68[222A]                 push domul_3
  5699 000029FF E8C01D                   call error1
  5700 00002A02 83C402                   add  sp, 2
  5701                                  .domul306:
  5702                                  .domul304:
  5703                                  
  5704                                  ;-550 int doidiv(int ids) { int mode; int id1;
  5705 00002A05 C9                       LEAVE
  5706 00002A06 C3                       ret
  5707 00002A07 696D756C00              domul_0 db "imul",0
  5708 00002A0C 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5709 00002A15 2C2000             
  5710 00002A18 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5711 00002A21 00                 
  5712 00002A22 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5713 00002A2B 6F6E6C7920636F6E73-
  5714 00002A34 74206E756D62657220-
  5715 00002A3D 6173206D756C746970-
  5716 00002A46 6C696361746F722061-
  5717 00002A4F 6C6C6F77656400     
  5718                                  ENDP
  5719                                  
  5720                                  doidiv: PROC
  5721                                  
  5722                                  ;-551   if (istoken(T_CONST)) {
  5723                                  
  5724                                  ;Function : doidiv, Number of local variables: 3
  5725                                  ;   # type sign width addr used name   list of local variables
  5726                                  ;  200 var sign word   550 NULL ids = bp+4
  5727                                  ;  201 var sign word   550 NULL mode = bp-2
  5728                                  ;  202 var sign word   550 NULL id1 = bp-4;
  5729 00002A56 C8040000                 ENTER  4,0
  5730 00002A5A 680101                   push 257
  5731 00002A5D E84719                   call istoken
  5732 00002A60 83C402                   add  sp, 2
  5733 00002A63 08C0                     or  al, al
  5734 00002A65 0F843400                 je .doidiv307
  5735                                  
  5736                                  ;-552     prs("\n mov bx, "); prunsign1(lexval);
  5737                                  
  5738 00002A69 68[1B2B]                 push doidiv_0
  5739 00002A6C E86D1A                   call prs
  5740 00002A6F 83C402                   add  sp, 2
  5741 00002A72 FF36[2E00]               push word [lexval]
  5742 00002A76 E8B81B                   call prunsign1
  5743 00002A79 83C402                   add  sp, 2
  5744                                  
  5745                                  ;-553     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5746                                  
  5747 00002A7C 8B4604                   mov ax, [bp+4]
  5748 00002A7F 08C0                     or  al, al
  5749 00002A81 0F840C00                 je .doidiv308
  5750 00002A85 68[272B]                 push doidiv_1
  5751 00002A88 E8511A                   call prs
  5752 00002A8B 83C402                   add  sp, 2
  5753 00002A8E E90900                   jmp .doidiv309
  5754                                  .doidiv308:
  5755 00002A91 68[382B]                 push doidiv_2
  5756 00002A94 E8451A                   call prs
  5757 00002A97 83C402                   add  sp, 2
  5758                                  .doidiv309:
  5759                                  
  5760                                  ;-554   else {
  5761                                  
  5762 00002A9A E97C00                   jmp .doidiv310
  5763                                  .doidiv307:
  5764                                  
  5765                                  ;-555     mode=typeName(); id1=searchname();
  5766                                  
  5767 00002A9D E88ADF                   call typeName
  5768 00002AA0 8946FE                   mov [bp-2], ax
  5769 00002AA3 E8B5DE                   call searchname
  5770 00002AA6 8946FC                   mov [bp-4], ax
  5771                                  
  5772                                  ;-556     if (mode) error1("only const number or int as divisor allowed");
  5773                                  
  5774 00002AA9 8B46FE                   mov ax, [bp-2]
  5775 00002AAC 08C0                     or  al, al
  5776 00002AAE 0F840900                 je .doidiv311
  5777 00002AB2 68[4E2B]                 push doidiv_3
  5778 00002AB5 E80A1D                   call error1
  5779 00002AB8 83C402                   add  sp, 2
  5780                                  
  5781                                  ;-557     gettypes(id1);
  5782                                  
  5783                                  .doidiv311:
  5784 00002ABB FF76FC                   push word [bp-4]
  5785 00002ABE E85CDD                   call gettypes
  5786 00002AC1 83C402                   add  sp, 2
  5787                                  
  5788                                  ;-558     if (typei) error1("only int as simple var divisor allowed");
  5789                                  
  5790 00002AC4 A1[3000]                 mov ax, [typei]
  5791 00002AC7 08C0                     or  al, al
  5792 00002AC9 0F840900                 je .doidiv312
  5793 00002ACD 68[7A2B]                 push doidiv_4
  5794 00002AD0 E8EF1C                   call error1
  5795 00002AD3 83C402                   add  sp, 2
  5796                                  
  5797                                  ;-559     if (wi!=2) error1("only int, no byte as divisor allowed");
  5798                                  
  5799                                  .doidiv312:
  5800 00002AD6 A1[3900]                 mov ax, [wi]
  5801 00002AD9 83F802                   cmp ax, 2
  5802 00002ADC 0F840900                 je  .doidiv313
  5803 00002AE0 68[A12B]                 push doidiv_5
  5804 00002AE3 E8DC1C                   call error1
  5805 00002AE6 83C402                   add  sp, 2
  5806                                  
  5807                                  ;-560     prs("\n mov bx, "); v(id1);
  5808                                  
  5809                                  .doidiv313:
  5810 00002AE9 68[C62B]                 push doidiv_6
  5811 00002AEC E8ED19                   call prs
  5812 00002AEF 83C402                   add  sp, 2
  5813 00002AF2 FF76FC                   push word [bp-4]
  5814 00002AF5 E877D8                   call v
  5815 00002AF8 83C402                   add  sp, 2
  5816                                  
  5817                                  ;-561     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5818                                  
  5819 00002AFB 8B4604                   mov ax, [bp+4]
  5820 00002AFE 08C0                     or  al, al
  5821 00002B00 0F840C00                 je .doidiv314
  5822 00002B04 68[D22B]                 push doidiv_7
  5823 00002B07 E8D219                   call prs
  5824 00002B0A 83C402                   add  sp, 2
  5825 00002B0D E90900                   jmp .doidiv315
  5826                                  .doidiv314:
  5827 00002B10 68[E32B]                 push doidiv_8
  5828 00002B13 E8C619                   call prs
  5829 00002B16 83C402                   add  sp, 2
  5830                                  .doidiv315:
  5831                                  
  5832                                  ;-562 }
  5833                                  
  5834                                  .doidiv310:
  5835                                  
  5836                                  ;-563 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5837 00002B19 C9                       LEAVE
  5838 00002B1A C3                       ret
  5839 00002B1B 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5840 00002B24 2C2000             
  5841 00002B27 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5842 00002B30 6964697620627800   
  5843 00002B38 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5844 00002B41 2C20305C6E20646976-
  5845 00002B4A 20627800           
  5846 00002B4E 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5847 00002B57 74206E756D62657220-
  5848 00002B60 6F7220696E74206173-
  5849 00002B69 2064697669736F7220-
  5850 00002B72 616C6C6F77656400   
  5851 00002B7A 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5852 00002B83 61732073696D706C65-
  5853 00002B8C 207661722064697669-
  5854 00002B95 736F7220616C6C6F77-
  5855 00002B9E 656400             
  5856 00002BA1 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5857 00002BAA 206E6F206279746520-
  5858 00002BB3 61732064697669736F-
  5859 00002BBC 7220616C6C6F776564-
  5860 00002BC5 00                 
  5861 00002BC6 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5862 00002BCF 2C2000             
  5863 00002BD2 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5864 00002BDB 6964697620627800   
  5865 00002BE3 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5866 00002BEC 2C20305C6E20646976-
  5867 00002BF5 20627800           
  5868                                  ENDP
  5869                                  
  5870                                  domod: PROC
  5871                                  ;Function : domod, Number of local variables: 1
  5872                                  ;   # type sign width addr used name   list of local variables
  5873                                  ;  200 var sign word   563 NULL ids = bp+4;
  5874 00002BF9 C8000000                 ENTER  0,0
  5875 00002BFD FF7604                   push word [bp+4]
  5876 00002C00 E853FE                   call doidiv
  5877 00002C03 83C402                   add  sp, 2
  5878 00002C06 68[112C]                 push domod_0
  5879 00002C09 E8D018                   call prs
  5880 00002C0C 83C402                   add  sp, 2
  5881                                  
  5882                                  ;-564 
  5883                                  
  5884                                  
  5885                                  ;-565 int docalltype[10]; int docallvalue[10];
  5886 00002C0F C9                       LEAVE
  5887 00002C10 C3                       ret
  5888 00002C11 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5889 00002C1A 2C20647800         
  5890                                  ENDP
  5891                                  section .bss
  5892                                  absolute 53411
  5893 0000D0A3 <res 00000014>          docalltype resw 10
  5894                                  section .text
  5895                                  section .bss
  5896                                  absolute 53431
  5897 0000D0B7 <res 00000014>          docallvalue resw 10
  5898                                  section .text
  5899                                  
  5900                                  ;-566 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5901                                  
  5902                                  section .bss
  5903                                  absolute 53451
  5904 0000D0CB <res 00000011>          procname resb 17
  5905                                  section .text
  5906                                  
  5907                                  ;-567 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5908                                  
  5909                                  
  5910                                  docall1: PROC
  5911                                  
  5912                                  ;-568   narg=0;  sz32=0;
  5913                                  
  5914                                  ;Function : docall1, Number of local variables: 5
  5915                                  ;   # type sign width addr used name   list of local variables
  5916                                  ;  200 var sign word   567 NULL i = bp-2
  5917                                  ;  201 var sign word   567 NULL narg = bp-4
  5918                                  ;  202 var sign word   567 NULL t0 = bp-6
  5919                                  ;  203 var sign word   567 NULL n0 = bp-8
  5920                                  ;  204 var sign word   567 NULL sz32 = bp-10;
  5921 00002C1F C80A0000                 ENTER  10,0
  5922 00002C23 B80000                   mov ax, 0
  5923 00002C26 8946FC                   mov [bp-4], ax
  5924 00002C29 B80000                   mov ax, 0
  5925 00002C2C 8946F6                   mov [bp-10], ax
  5926                                  
  5927                                  ;-569   checknamelen();
  5928                                  
  5929 00002C2F E870D7                   call checknamelen
  5930                                  
  5931                                  ;-570   strcpy(&procname, symbol);
  5932                                  
  5933 00002C32 8D062B81                 lea  ax, [symbol]
  5934 00002C36 50                       push ax
  5935 00002C37 8D06CBD0                 lea  ax, [procname]
  5936 00002C3B 50                       push ax
  5937 00002C3C E827D5                   call strcpy
  5938 00002C3F 83C404                   add  sp, 4
  5939                                  
  5940                                  ;-571   storecall();
  5941                                  
  5942 00002C42 E8E6DE                   call storecall
  5943                                  
  5944                                  ;-572   expect('(');
  5945                                  
  5946 00002C45 6A28                     push 40
  5947 00002C47 E87F17                   call expect
  5948 00002C4A 83C402                   add  sp, 2
  5949                                  
  5950                                  ;-573 	if (istoken(')') ==0 ) {
  5951                                  
  5952 00002C4D 6A29                     push 41
  5953 00002C4F E85517                   call istoken
  5954 00002C52 83C402                   add  sp, 2
  5955 00002C55 83F800                   cmp ax, 0
  5956 00002C58 0F857802                 jne .docall1316
  5957                                  
  5958                                  ;-574 	  do { narg++;
  5959                                  
  5960                                  .docall1317:
  5961 00002C5C FF46FC                   inc  word[bp-4]
  5962                                  
  5963                                  ;-575 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5964                                  
  5965 00002C5F 8B46FC                   mov ax, [bp-4]
  5966 00002C62 83F809                   cmp ax, 9
  5967 00002C65 0F8E0900                 jle .docall1318
  5968 00002C69 68[182F]                 push docall1_0
  5969 00002C6C E8531B                   call error1
  5970 00002C6F 83C402                   add  sp, 2
  5971                                  .docall1318:
  5972 00002C72 B80000                   mov ax, 0
  5973 00002C75 8946FA                   mov [bp-6], ax
  5974                                  
  5975                                  ;-576       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5976                                  
  5977 00002C78 680101                   push 257
  5978 00002C7B E82917                   call istoken
  5979 00002C7E 83C402                   add  sp, 2
  5980 00002C81 08C0                     or  al, al
  5981 00002C83 0F840C00                 je .docall1319
  5982 00002C87 B80100                   mov ax, 1
  5983 00002C8A 8946FA                   mov [bp-6], ax
  5984 00002C8D A1[2E00]                 mov ax, [lexval]
  5985 00002C90 8946F8                   mov [bp-8], ax
  5986                                  
  5987                                  ;-577       if(istoken(T_STRING)){t0=2; n0=nconst;
  5988                                  
  5989                                  .docall1319:
  5990 00002C93 680201                   push 258
  5991 00002C96 E80E17                   call istoken
  5992 00002C99 83C402                   add  sp, 2
  5993 00002C9C 08C0                     or  al, al
  5994 00002C9E 0F846300                 je .docall1320
  5995 00002CA2 B80200                   mov ax, 2
  5996 00002CA5 8946FA                   mov [bp-6], ax
  5997 00002CA8 A1[2400]                 mov ax, [nconst]
  5998 00002CAB 8946F8                   mov [bp-8], ax
  5999                                  
  6000                                  ;-578         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6001                                  
  6002 00002CAE 68[2A2F]                 push docall1_1
  6003 00002CB1 E89317                   call eprs
  6004 00002CB4 83C402                   add  sp, 2
  6005 00002CB7 8D06AB81                 lea  ax, [fname]
  6006 00002CBB 50                       push ax
  6007 00002CBC E88817                   call eprs
  6008 00002CBF 83C402                   add  sp, 2
  6009 00002CC2 6A5F                     push 95
  6010 00002CC4 E86D17                   call eprc
  6011 00002CC7 83C402                   add  sp, 2
  6012 00002CCA FF36[2400]               push word [nconst]
  6013 00002CCE E89F18                   call eprnum
  6014 00002CD1 83C402                   add  sp, 2
  6015 00002CD4 68[2D2F]                 push docall1_2
  6016 00002CD7 E86D17                   call eprs
  6017 00002CDA 83C402                   add  sp, 2
  6018                                  
  6019                                  ;-579         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6020                                  
  6021 00002CDD 6A22                     push 34
  6022 00002CDF E85217                   call eprc
  6023 00002CE2 83C402                   add  sp, 2
  6024 00002CE5 8D062B81                 lea  ax, [symbol]
  6025 00002CE9 50                       push ax
  6026 00002CEA E85A17                   call eprs
  6027 00002CED 83C402                   add  sp, 2
  6028 00002CF0 6A22                     push 34
  6029 00002CF2 E83F17                   call eprc
  6030 00002CF5 83C402                   add  sp, 2
  6031 00002CF8 68[322F]                 push docall1_3
  6032 00002CFB E84917                   call eprs
  6033 00002CFE 83C402                   add  sp, 2
  6034 00002D01 FF06[2400]               inc  word[nconst]
  6035                                  
  6036                                  ;-580       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6037                                  
  6038                                  .docall1320:
  6039 00002D05 6A26                     push 38
  6040 00002D07 E89D16                   call istoken
  6041 00002D0A 83C402                   add  sp, 2
  6042 00002D0D 08C0                     or  al, al
  6043 00002D0F 0F840F00                 je .docall1321
  6044 00002D13 B80300                   mov ax, 3
  6045 00002D16 8946FA                   mov [bp-6], ax
  6046 00002D19 E8E7DD                   call name1
  6047 00002D1C E83CDC                   call searchname
  6048 00002D1F 8946F8                   mov [bp-8], ax
  6049                                  
  6050                                  ;-581       if(istoken(T_NAME))  { n0=checkreg();
  6051                                  
  6052                                  .docall1321:
  6053 00002D22 680001                   push 256
  6054 00002D25 E87F16                   call istoken
  6055 00002D28 83C402                   add  sp, 2
  6056 00002D2B 08C0                     or  al, al
  6057 00002D2D 0F844800                 je .docall1322
  6058 00002D31 E8DFEA                   call checkreg
  6059 00002D34 8946F8                   mov [bp-8], ax
  6060                                  
  6061                                  ;-582         if (n0) t0=5;
  6062                                  
  6063 00002D37 8B46F8                   mov ax, [bp-8]
  6064 00002D3A 08C0                     or  al, al
  6065 00002D3C 0F840900                 je .docall1323
  6066 00002D40 B80500                   mov ax, 5
  6067 00002D43 8946FA                   mov [bp-6], ax
  6068                                  
  6069                                  ;-583         else {t0=4; n0=searchname();
  6070                                  
  6071 00002D46 E93000                   jmp .docall1324
  6072                                  .docall1323:
  6073 00002D49 B80400                   mov ax, 4
  6074 00002D4C 8946FA                   mov [bp-6], ax
  6075 00002D4F E809DC                   call searchname
  6076 00002D52 8946F8                   mov [bp-8], ax
  6077                                  
  6078                                  ;-584           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6079                                  
  6080 00002D55 B8B782                   mov ax, GType
  6081 00002D58 A3[6C00]                 mov word [p1], ax
  6082 00002D5B A1[6C00]                 mov ax, [p1]
  6083 00002D5E 0346F8                   add ax, [bp-8]
  6084 00002D61 A3[6C00]                 mov word [p1], ax
  6085 00002D64 8B1E[6C00]               mov bx, [p1]
  6086 00002D68 8A07                     mov al, [bx]
  6087 00002D6A B400                     mov ah, 0
  6088 00002D6C 83F826                   cmp ax, 38
  6089 00002D6F 0F850600                 jne .docall1325
  6090 00002D73 B80300                   mov ax, 3
  6091 00002D76 8946FA                   mov [bp-6], ax
  6092                                  .docall1325:
  6093                                  .docall1324:
  6094                                  
  6095                                  ;-585       if (t0==0) error1("parameter not recognized (no * allowed)");
  6096                                  
  6097                                  .docall1322:
  6098 00002D79 8B46FA                   mov ax, [bp-6]
  6099 00002D7C 83F800                   cmp ax, 0
  6100 00002D7F 0F850900                 jne .docall1326
  6101 00002D83 68[352F]                 push docall1_4
  6102 00002D86 E8391A                   call error1
  6103 00002D89 83C402                   add  sp, 2
  6104                                  
  6105                                  ;-586       docalltype [narg] = t0;
  6106                                  
  6107                                  .docall1326:
  6108 00002D8C 8B46FA                   mov ax, [bp-6]
  6109 00002D8F 8B5EFC                   mov bx, [bp-4]
  6110 00002D92 D1E3                     shl bx, 1
  6111 00002D94 8987A3D0                 mov [docalltype+bx], ax
  6112                                  
  6113                                  ;-587       docallvalue[narg] = n0;
  6114                                  
  6115 00002D98 8B46F8                   mov ax, [bp-8]
  6116 00002D9B 8B5EFC                   mov bx, [bp-4]
  6117 00002D9E D1E3                     shl bx, 1
  6118 00002DA0 8987B7D0                 mov [docallvalue+bx], ax
  6119                                  
  6120                                  ;-588     } while (istoken(','));
  6121                                  
  6122 00002DA4 6A2C                     push 44
  6123 00002DA6 E8FE15                   call istoken
  6124 00002DA9 83C402                   add  sp, 2
  6125 00002DAC 08C0                     or  al, al
  6126 00002DAE 0F840300                 je .docall1327
  6127 00002DB2 E9A7FE                   jmp .docall1317
  6128                                  .docall1327:
  6129                                  
  6130                                  ;-589     
  6131                                  
  6132                                  
  6133                                  ;-590   	expect(')');  i=narg;
  6134                                  
  6135 00002DB5 6A29                     push 41
  6136 00002DB7 E80F16                   call expect
  6137 00002DBA 83C402                   add  sp, 2
  6138 00002DBD 8B46FC                   mov ax, [bp-4]
  6139 00002DC0 8946FE                   mov [bp-2], ax
  6140                                  
  6141                                  ;-591     do {
  6142                                  
  6143                                  .docall1328:
  6144                                  
  6145                                  ;-592       t0 = docalltype [i];
  6146                                  
  6147 00002DC3 8B5EFE                   mov bx, [bp-2]
  6148 00002DC6 D1E3                     shl bx, 1
  6149 00002DC8 8B87A3D0                 mov ax, [docalltype + bx]
  6150 00002DCC 8946FA                   mov [bp-6], ax
  6151                                  
  6152                                  ;-593       n0 = docallvalue[i];     
  6153                                  
  6154 00002DCF 8B5EFE                   mov bx, [bp-2]
  6155 00002DD2 D1E3                     shl bx, 1
  6156 00002DD4 8B87B7D0                 mov ax, [docallvalue + bx]
  6157 00002DD8 8946F8                   mov [bp-8], ax
  6158                                  
  6159                                  ;-594       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6160                                  
  6161 00002DDB 8B46FA                   mov ax, [bp-6]
  6162 00002DDE 83F801                   cmp ax, 1
  6163 00002DE1 0F851200                 jne .docall1329
  6164 00002DE5 68[5D2F]                 push docall1_5
  6165 00002DE8 E8F116                   call prs
  6166 00002DEB 83C402                   add  sp, 2
  6167 00002DEE FF76F8                   push word [bp-8]
  6168 00002DF1 E83D18                   call prunsign1
  6169 00002DF4 83C402                   add  sp, 2
  6170                                  
  6171                                  ;-595       if(t0==2){ prs("\n push "); 
  6172                                  
  6173                                  .docall1329:
  6174 00002DF7 8B46FA                   mov ax, [bp-6]
  6175 00002DFA 83F802                   cmp ax, 2
  6176 00002DFD 0F852500                 jne .docall1330
  6177 00002E01 68[662F]                 push docall1_6
  6178 00002E04 E8D516                   call prs
  6179 00002E07 83C402                   add  sp, 2
  6180                                  
  6181                                  ;-596         prs(fname);prc(95);prunsign1(n0);}
  6182                                  
  6183 00002E0A 8D06AB81                 lea  ax, [fname]
  6184 00002E0E 50                       push ax
  6185 00002E0F E8CA16                   call prs
  6186 00002E12 83C402                   add  sp, 2
  6187 00002E15 6A5F                     push 95
  6188 00002E17 E85B16                   call prc
  6189 00002E1A 83C402                   add  sp, 2
  6190 00002E1D FF76F8                   push word [bp-8]
  6191 00002E20 E80E18                   call prunsign1
  6192 00002E23 83C402                   add  sp, 2
  6193                                  
  6194                                  ;-597       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6195                                  
  6196                                  .docall1330:
  6197 00002E26 8B46FA                   mov ax, [bp-6]
  6198 00002E29 83F803                   cmp ax, 3
  6199 00002E2C 0F851B00                 jne .docall1331
  6200 00002E30 68[6F2F]                 push docall1_7
  6201 00002E33 E8A616                   call prs
  6202 00002E36 83C402                   add  sp, 2
  6203 00002E39 FF76F8                   push word [bp-8]
  6204 00002E3C E830D5                   call v
  6205 00002E3F 83C402                   add  sp, 2
  6206                                  
  6207                                  ;-598         prs("\n push ax");}
  6208                                  
  6209 00002E42 68[7C2F]                 push docall1_8
  6210 00002E45 E89416                   call prs
  6211 00002E48 83C402                   add  sp, 2
  6212                                  
  6213                                  ;-599       if(t0==4){ gettypes(n0); 
  6214                                  
  6215                                  .docall1331:
  6216 00002E4B 8B46FA                   mov ax, [bp-6]
  6217 00002E4E 83F804                   cmp ax, 4
  6218 00002E51 0F854300                 jne .docall1332
  6219 00002E55 FF76F8                   push word [bp-8]
  6220 00002E58 E8C2D9                   call gettypes
  6221 00002E5B 83C402                   add  sp, 2
  6222                                  
  6223                                  ;-600         if(wi==2) { prs("\n push word "); v(n0);}
  6224                                  
  6225 00002E5E A1[3900]                 mov ax, [wi]
  6226 00002E61 83F802                   cmp ax, 2
  6227 00002E64 0F851500                 jne .docall1333
  6228 00002E68 68[872F]                 push docall1_9
  6229 00002E6B E86E16                   call prs
  6230 00002E6E 83C402                   add  sp, 2
  6231 00002E71 FF76F8                   push word [bp-8]
  6232 00002E74 E8F8D4                   call v
  6233 00002E77 83C402                   add  sp, 2
  6234                                  
  6235                                  ;-601         else { prs("\n mov al, byte ");   v(n0);
  6236                                  
  6237 00002E7A E91B00                   jmp .docall1334
  6238                                  .docall1333:
  6239 00002E7D 68[952F]                 push docall1_10
  6240 00002E80 E85916                   call prs
  6241 00002E83 83C402                   add  sp, 2
  6242 00002E86 FF76F8                   push word [bp-8]
  6243 00002E89 E8E3D4                   call v
  6244 00002E8C 83C402                   add  sp, 2
  6245                                  
  6246                                  ;-602         prs("\n mov ah, 0\n push ax"); } }
  6247                                  
  6248 00002E8F 68[A62F]                 push docall1_11
  6249 00002E92 E84716                   call prs
  6250 00002E95 83C402                   add  sp, 2
  6251                                  .docall1334:
  6252                                  
  6253                                  ;-603       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6254                                  
  6255                                  .docall1332:
  6256 00002E98 8B46FA                   mov ax, [bp-6]
  6257 00002E9B 83F805                   cmp ax, 5
  6258 00002E9E 0F852200                 jne .docall1335
  6259 00002EA2 68[BD2F]                 push docall1_12
  6260 00002EA5 E83416                   call prs
  6261 00002EA8 83C402                   add  sp, 2
  6262 00002EAB FF76F8                   push word [bp-8]
  6263 00002EAE E870ED                   call printreg
  6264 00002EB1 83C402                   add  sp, 2
  6265 00002EB4 8B46F8                   mov ax, [bp-8]
  6266 00002EB7 83F82F                   cmp ax, 47 ;unsigned : 1
  6267 00002EBA 0F8C0600                 jl  .docall1336
  6268 00002EBE 8B46F6                   mov ax, [bp-10]
  6269 00002EC1 83C002                   add ax, 2
  6270                                  .docall1336:
  6271                                  
  6272                                  ;-604    i--; } while (i > 0);  }
  6273                                  
  6274                                  .docall1335:
  6275 00002EC4 FF4EFE                   dec  word[bp-2]
  6276 00002EC7 8B46FE                   mov ax, [bp-2]
  6277 00002ECA 83F800                   cmp ax, 0
  6278 00002ECD 0F8E0300                 jle .docall1337
  6279 00002ED1 E9EFFE                   jmp .docall1328
  6280                                  .docall1337:
  6281                                  
  6282                                  ;-605 	 prs("\n call "); prs(&procname);
  6283                                  
  6284                                  .docall1316:
  6285 00002ED4 68[C62F]                 push docall1_13
  6286 00002ED7 E80216                   call prs
  6287 00002EDA 83C402                   add  sp, 2
  6288 00002EDD 8D06CBD0                 lea  ax, [procname]
  6289 00002EE1 50                       push ax
  6290 00002EE2 E8F715                   call prs
  6291 00002EE5 83C402                   add  sp, 2
  6292                                  
  6293                                  ;-606 	 if (narg>0) {prs("\n add  sp, ");
  6294                                  
  6295 00002EE8 8B46FC                   mov ax, [bp-4]
  6296 00002EEB 83F800                   cmp ax, 0
  6297 00002EEE 0F8E2400                 jle .docall1338
  6298 00002EF2 68[CF2F]                 push docall1_14
  6299 00002EF5 E8E415                   call prs
  6300 00002EF8 83C402                   add  sp, 2
  6301                                  
  6302                                  ;-607      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6303                                  
  6304 00002EFB 8B46FC                   mov ax, [bp-4]
  6305 00002EFE 0346FC                   add ax, [bp-4]
  6306 00002F01 8946FC                   mov [bp-4], ax
  6307 00002F04 8B46FC                   mov ax, [bp-4]
  6308 00002F07 0346F6                   add ax, [bp-10]
  6309 00002F0A 8946FC                   mov [bp-4], ax
  6310 00002F0D FF76FC                   push word [bp-4]
  6311 00002F10 E81E17                   call prunsign1
  6312 00002F13 83C402                   add  sp, 2
  6313                                  .docall1338:
  6314                                  
  6315                                  ;-608 /****************************************************************************/
  6316                                  
  6317                                  
  6318                                  ;-609 int main() {
  6319 00002F16 C9                       LEAVE
  6320 00002F17 C3                       ret
  6321 00002F18 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6322 00002F21 72616D657465727300 
  6323 00002F2A 5C6E00                  docall1_1 db "\n",0
  6324 00002F2D 2064622000              docall1_2 db " db ",0
  6325 00002F32 2C3000                  docall1_3 db ",0",0
  6326 00002F35 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6327 00002F3E 206E6F74207265636F-
  6328 00002F47 676E697A656420286E-
  6329 00002F50 6F202A20616C6C6F77-
  6330 00002F59 65642900           
  6331 00002F5D 5C6E20707573682000      docall1_5 db "\n push ",0
  6332 00002F66 5C6E20707573682000      docall1_6 db "\n push ",0
  6333 00002F6F 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6334 00002F78 782C2000           
  6335 00002F7C 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6336 00002F85 7800               
  6337 00002F87 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6338 00002F90 6F72642000         
  6339 00002F95 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6340 00002F9E 2C20627974652000   
  6341 00002FA6 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6342 00002FAF 2C20305C6E20707573-
  6343 00002FB8 6820617800         
  6344 00002FBD 5C6E20707573682000      docall1_12 db "\n push ",0
  6345 00002FC6 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6346 00002FCF 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6347 00002FD8 702C2000           
  6348                                  ENDP
  6349                                  
  6350                                  main: PROC
  6351                                  
  6352                                  ;-610   getarg();
  6353                                  
  6354 00002FDC E88700                   call getarg
  6355                                  
  6356                                  ;-611   setblock(4096);
  6357                                  
  6358 00002FDF 680010                   push 4096
  6359 00002FE2 E8D322                   call setblock
  6360 00002FE5 83C402                   add  sp, 2
  6361                                  
  6362                                  ;-612   if (DOS_ERR) error1("SetBlock , AX=");
  6363                                  
  6364 00002FE8 A1[6E00]                 mov ax, [DOS_ERR]
  6365 00002FEB 08C0                     or  al, al
  6366 00002FED 0F840900                 je .main339
  6367 00002FF1 68[2B30]                 push main_0
  6368 00002FF4 E8CB17                   call error1
  6369 00002FF7 83C402                   add  sp, 2
  6370                                  
  6371                                  ;-613   segE=allocmem(4096);
  6372                                  
  6373                                  .main339:
  6374 00002FFA 680010                   push 4096
  6375 00002FFD E8D122                   call allocmem
  6376 00003000 83C402                   add  sp, 2
  6377 00003003 A3[6400]                 mov word [segE], ax
  6378                                  
  6379                                  ;-614   if (DOS_ERR)  error1("alloc memory, AX=");
  6380                                  
  6381 00003006 A1[6E00]                 mov ax, [DOS_ERR]
  6382 00003009 08C0                     or  al, al
  6383 0000300B 0F840900                 je .main340
  6384 0000300F 68[3A30]                 push main_1
  6385 00003012 E8AD17                   call error1
  6386 00003015 83C402                   add  sp, 2
  6387                                  
  6388                                  ;-615   CNameTop=0;
  6389                                  
  6390                                  .main340:
  6391 00003018 B80000                   mov ax, 0
  6392 0000301B A3[6000]                 mov word [CNameTop], ax
  6393                                  
  6394                                  ;-616   getfirstchar();
  6395                                  
  6396 0000301E E82B00                   call getfirstchar
  6397                                  
  6398                                  ;-617   parse();
  6399                                  
  6400 00003021 E84B02                   call parse
  6401                                  
  6402                                  ;-618   checkcalls(); epilog();
  6403                                  
  6404 00003024 E8DF02                   call checkcalls
  6405 00003027 E8731E                   call epilog
  6406                                  
  6407                                  ;-619 }
  6408                                  
  6409                                  
  6410                                  ;-620 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6411                                  
  6412 0000302A C3                       ret
  6413 0000302B 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6414 00003034 2C2041583D00       
  6415 0000303A 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6416 00003043 6F72792C2041583D00 
  6417                                  ENDP
  6418                                  
  6419                                  getfirstchar: PROC
  6420 0000304C B80FD0                   mov ax, fgetsdest
  6421 0000304F A3[6200]                 mov word [fgetsp], ax
  6422 00003052 B80000                   mov ax, 0
  6423 00003055 8B1E[6200]               mov  bx, [fgetsp]
  6424 00003059 8807                     mov  [bx], al
  6425 0000305B E86C16                   call fgets1
  6426 0000305E A2[2100]                 mov byte [thechar], al
  6427                                  
  6428                                  ;-621 char *arglen=0x80; char *argv=0x82;
  6429                                  
  6430 00003061 C3                       ret
  6431                                  ENDP
  6432 00003062 8000                    arglen dw 128
  6433 00003064 8200                    argv dw 130
  6434                                  
  6435                                  ;-622 int getarg() { int arglen1; int i; char *c;
  6436                                  
  6437                                  
  6438                                  getarg: PROC
  6439                                  
  6440                                  ;-623   arglen1=*arglen;
  6441                                  
  6442                                  ;Function : getarg, Number of local variables: 3
  6443                                  ;   # type sign width addr used name   list of local variables
  6444                                  ;  200 var sign word   622 NULL arglen1 = bp-2
  6445                                  ;  201 var sign word   622 NULL i = bp-4
  6446                                  ;  202 ptr sign byte   622 NULL c = bp-6;
  6447 00003066 C8060000                 ENTER  6,0
  6448 0000306A 8B1E[6230]               mov bx, [arglen]
  6449 0000306E 8A07                     mov al, [bx]
  6450 00003070 B400                     mov ah, 0
  6451 00003072 8946FE                   mov [bp-2], ax
  6452                                  
  6453                                  ;-624   if (arglen1) { i=arglen1+129; *i=0; }
  6454                                  
  6455 00003075 8B46FE                   mov ax, [bp-2]
  6456 00003078 08C0                     or  al, al
  6457 0000307A 0F841400                 je .getarg341
  6458 0000307E 8B46FE                   mov ax, [bp-2]
  6459 00003081 058100                   add ax, 129
  6460 00003084 8946FC                   mov [bp-4], ax
  6461 00003087 B80000                   mov ax, 0
  6462 0000308A 8B5EFC                   mov  bx, [bp-4]
  6463 0000308D 8907                     mov  [bx], ax
  6464                                  
  6465                                  ;-625   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6466                                  
  6467 0000308F E93900                   jmp .getarg342
  6468                                  .getarg341:
  6469 00003092 8D06[0300]               lea  ax, [Version1]
  6470 00003096 50                       push ax
  6471 00003097 E8FACF                   call cputs
  6472 0000309A 83C402                   add  sp, 2
  6473 0000309D 68[E631]                 push getarg_0
  6474 000030A0 E8F1CF                   call cputs
  6475 000030A3 83C402                   add  sp, 2
  6476                                  
  6477                                  ;-626     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6478                                  
  6479 000030A6 6A43                     push 67
  6480 000030A8 6A00                     push 0
  6481 000030AA FF36[6430]               push word [argv]
  6482 000030AE E863D0                   call readRL
  6483 000030B1 83C406                   add  sp, 6
  6484 000030B4 A3[7000]                 mov word [DOS_NoBytes], ax
  6485 000030B7 A1[7000]                 mov ax, [DOS_NoBytes]
  6486 000030BA 058000                   add ax, 128
  6487 000030BD 8946FA                   mov [bp-6], ax
  6488 000030C0 B80000                   mov ax, 0
  6489 000030C3 8B5EFA                   mov  bx, [bp-6]
  6490 000030C6 8807                     mov  [bx], al
  6491 000030C8 E80314                   call prnl
  6492                                  
  6493                                  ;-627   strcpy(namein, argv);
  6494                                  
  6495                                  .getarg342:
  6496 000030CB FF36[6430]               push word [argv]
  6497 000030CF 8D06EE81                 lea  ax, [namein]
  6498 000030D3 50                       push ax
  6499 000030D4 E88FD0                   call strcpy
  6500 000030D7 83C404                   add  sp, 4
  6501                                  
  6502                                  ;-628   if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  6503                                  
  6504 000030DA 6A2E                     push 46
  6505 000030DC 8D06EE81                 lea  ax, [namein]
  6506 000030E0 50                       push ax
  6507 000030E1 E8FED0                   call instr1
  6508 000030E4 83C404                   add  sp, 4
  6509 000030E7 83F800                   cmp ax, 0
  6510 000030EA 0F850E00                 jne .getarg343
  6511 000030EE 68[0232]                 push getarg_1
  6512 000030F1 8D06EE81                 lea  ax, [namein]
  6513 000030F5 50                       push ax
  6514 000030F6 E81BD1                   call strcat1
  6515 000030F9 83C404                   add  sp, 4
  6516                                  
  6517                                  ;-629   toupper(namein);
  6518                                  
  6519                                  .getarg343:
  6520 000030FC 8D06EE81                 lea  ax, [namein]
  6521 00003100 50                       push ax
  6522 00003101 E835D1                   call toupper
  6523 00003104 83C402                   add  sp, 2
  6524                                  
  6525                                  ;-630   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6526                                  
  6527 00003107 8D06EE81                 lea  ax, [namein]
  6528 0000310B 50                       push ax
  6529 0000310C 8D063182                 lea  ax, [namelst]
  6530 00003110 50                       push ax
  6531 00003111 E852D0                   call strcpy
  6532 00003114 83C404                   add  sp, 4
  6533 00003117 8D063182                 lea  ax, [namelst]
  6534 0000311B 50                       push ax
  6535 0000311C E81FD0                   call strlen
  6536 0000311F 83C402                   add  sp, 2
  6537 00003122 8946FC                   mov [bp-4], ax
  6538 00003125 FF4EFC                   dec  word[bp-4]
  6539 00003128 B83182                   mov ax, namelst
  6540 0000312B 0346FC                   add ax, [bp-4]
  6541 0000312E 8946FA                   mov [bp-6], ax
  6542 00003131 B85300                   mov ax, 83
  6543 00003134 8B5EFA                   mov  bx, [bp-6]
  6544 00003137 8807                     mov  [bx], al
  6545                                  
  6546                                  ;-631  
  6547                                  
  6548                                  
  6549                                  ;-632   fdin=openR (namein);
  6550                                  
  6551 00003139 8D06EE81                 lea  ax, [namein]
  6552 0000313D 50                       push ax
  6553 0000313E E895CF                   call openR
  6554 00003141 83C402                   add  sp, 2
  6555 00003144 A3[1800]                 mov word [fdin], ax
  6556                                  
  6557                                  ;-633   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6558                                  
  6559 00003147 A1[6E00]                 mov ax, [DOS_ERR]
  6560 0000314A 08C0                     or  al, al
  6561 0000314C 0F841C00                 je .getarg344
  6562 00003150 68[0532]                 push getarg_2
  6563 00003153 E83ECF                   call cputs
  6564 00003156 83C402                   add  sp, 2
  6565 00003159 8D06EE81                 lea  ax, [namein]
  6566 0000315D 50                       push ax
  6567 0000315E E833CF                   call cputs
  6568 00003161 83C402                   add  sp, 2
  6569 00003164 6A01                     push 1
  6570 00003166 E89DCF                   call exitR
  6571 00003169 83C402                   add  sp, 2
  6572                                  
  6573                                  ;-634   fdout=creatR(namelst);
  6574                                  
  6575                                  .getarg344:
  6576 0000316C 8D063182                 lea  ax, [namelst]
  6577 00003170 50                       push ax
  6578 00003171 E871CF                   call creatR
  6579 00003174 83C402                   add  sp, 2
  6580 00003177 A3[1A00]                 mov word [fdout], ax
  6581                                  
  6582                                  ;-635   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6583                                  
  6584 0000317A A1[6E00]                 mov ax, [DOS_ERR]
  6585 0000317D 08C0                     or  al, al
  6586 0000317F 0F841C00                 je .getarg345
  6587 00003183 68[2032]                 push getarg_3
  6588 00003186 E80BCF                   call cputs
  6589 00003189 83C402                   add  sp, 2
  6590 0000318C 8D063182                 lea  ax, [namelst]
  6591 00003190 50                       push ax
  6592 00003191 E800CF                   call cputs
  6593 00003194 83C402                   add  sp, 2
  6594 00003197 6A02                     push 2
  6595 00003199 E86ACF                   call exitR
  6596 0000319C 83C402                   add  sp, 2
  6597                                  
  6598                                  ;-636   prs("\n; ");prs(Version1);
  6599                                  
  6600                                  .getarg345:
  6601 0000319F 68[3A32]                 push getarg_4
  6602 000031A2 E83713                   call prs
  6603 000031A5 83C402                   add  sp, 2
  6604 000031A8 8D06[0300]               lea  ax, [Version1]
  6605 000031AC 50                       push ax
  6606 000031AD E82C13                   call prs
  6607 000031B0 83C402                   add  sp, 2
  6608                                  
  6609                                  ;-637   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6610                                  
  6611 000031B3 68[3F32]                 push getarg_5
  6612 000031B6 E82313                   call prs
  6613 000031B9 83C402                   add  sp, 2
  6614 000031BC 8D06EE81                 lea  ax, [namein]
  6615 000031C0 50                       push ax
  6616 000031C1 E81813                   call prs
  6617 000031C4 83C402                   add  sp, 2
  6618 000031C7 68[4A32]                 push getarg_6
  6619 000031CA E80F13                   call prs
  6620 000031CD 83C402                   add  sp, 2
  6621 000031D0 8D063182                 lea  ax, [namelst]
  6622 000031D4 50                       push ax
  6623 000031D5 E80413                   call prs
  6624 000031D8 83C402                   add  sp, 2
  6625                                  
  6626                                  ;-638   prs("\norg  256 \njmp main"); 
  6627                                  
  6628 000031DB 68[5932]                 push getarg_7
  6629 000031DE E8FB12                   call prs
  6630 000031E1 83C402                   add  sp, 2
  6631                                  
  6632                                  ;-639 }
  6633                                  
  6634                                  
  6635                                  ;-640 int parse() { token=getlex(); do {
  6636 000031E4 C9                       LEAVE
  6637 000031E5 C3                       ret
  6638 000031E6 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6639 000031EF 2E434F4D20696E5F66-
  6640 000031F8 696C655B2E435D3A20-
  6641 00003201 00                 
  6642 00003202 2E4300                  getarg_1 db ".C",0
  6643 00003205 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6644 0000320E 6C65206D697373696E-
  6645 00003217 6720282E43293A2000 
  6646 00003220 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6647 00003229 206E6F742063726561-
  6648 00003232 7461626C653A2000   
  6649 0000323A 5C6E3B2000              getarg_4 db "\n; ",0
  6650 0000323F 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6651 00003248 2000               
  6652 0000324A 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6653 00003253 61736D3A2000       
  6654 00003259 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6655 00003262 36205C6E6A6D70206D-
  6656 0000326B 61696E00           
  6657                                  ENDP
  6658                                  
  6659                                  parse: PROC
  6660 0000326F E8110A                   call getlex
  6661 00003272 A3[1C00]                 mov word [token], ax
  6662                                  .parse346:
  6663                                  
  6664                                  ;-641     if (token <= 0) return 1;
  6665                                  
  6666 00003275 A1[1C00]                 mov ax, [token]
  6667 00003278 83F800                   cmp ax, 0
  6668 0000327B 0F8F0600                 jg  .parse347
  6669 0000327F B80100                   mov ax, 1
  6670 00003282 E96500                   jmp .retnparse
  6671                                  
  6672                                  ;-642     if (istoken('#')) {
  6673                                  
  6674                                  .parse347:
  6675 00003285 6A23                     push 35
  6676 00003287 E81D11                   call istoken
  6677 0000328A 83C402                   add  sp, 2
  6678 0000328D 08C0                     or  al, al
  6679 0000328F 0F843600                 je .parse348
  6680                                  
  6681                                  ;-643       if (istoken(T_DEFINE)) dodefine();
  6682                                  
  6683 00003293 68FF01                   push 511
  6684 00003296 E80E11                   call istoken
  6685 00003299 83C402                   add  sp, 2
  6686 0000329C 08C0                     or  al, al
  6687 0000329E 0F840600                 je .parse349
  6688 000032A2 E8A702                   call dodefine
  6689                                  
  6690                                  ;-644       else if (istoken(T_INCLUDE)) doinclude();
  6691                                  
  6692 000032A5 E91E00                   jmp .parse350
  6693                                  .parse349:
  6694 000032A8 68FE01                   push 510
  6695 000032AB E8F910                   call istoken
  6696 000032AE 83C402                   add  sp, 2
  6697 000032B1 08C0                     or  al, al
  6698 000032B3 0F840600                 je .parse351
  6699 000032B7 E8AC01                   call doinclude
  6700                                  
  6701                                  ;-645       else error1("define or include expected");  }
  6702                                  
  6703 000032BA E90900                   jmp .parse352
  6704                                  .parse351:
  6705 000032BD 68[EB32]                 push parse_0
  6706 000032C0 E8FF14                   call error1
  6707 000032C3 83C402                   add  sp, 2
  6708                                  .parse352:
  6709                                  .parse350:
  6710                                  
  6711                                  ;-646     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6712                                  
  6713 000032C6 E91600                   jmp .parse353
  6714                                  .parse348:
  6715 000032C9 E85ED7                   call typeName
  6716 000032CC A1[1C00]                 mov ax, [token]
  6717 000032CF 83F828                   cmp ax, 40
  6718 000032D2 0F850600                 jne .parse354
  6719 000032D6 E865DA                   call dofunc
  6720 000032D9 E90300                   jmp .parse355
  6721                                  .parse354:
  6722 000032DC E80FD1                   call doglob
  6723                                  .parse355:
  6724                                  
  6725                                  ;-647   } while(1);
  6726                                  
  6727                                  .parse353:
  6728 000032DF B80100                   mov ax, 1
  6729 000032E2 08C0                     or  al, al
  6730 000032E4 0F840200                 je .parse356
  6731 000032E8 EB8B                     jmp .parse346
  6732                                  .parse356:
  6733                                  
  6734                                  ;-648 }
  6735                                  
  6736                                  
  6737                                  ;-649 int checkcalls() { int i; int j; int k;
  6738                                  
  6739                                   .retnparse:
  6740 000032EA C3                       ret
  6741 000032EB 646566696E65206F72-     parse_0 db "define or include expected",0
  6742 000032F4 20696E636C75646520-
  6743 000032FD 657870656374656400 
  6744                                  ENDP
  6745                                  
  6746                                  checkcalls: PROC
  6747                                  
  6748                                  ;-650   prs("\n \n; missing functions: ");
  6749                                  
  6750                                  ;Function : checkcalls, Number of local variables: 3
  6751                                  ;   # type sign width addr used name   list of local variables
  6752                                  ;  200 var sign word   649 NULL i = bp-2
  6753                                  ;  201 var sign word   649 NULL j = bp-4
  6754                                  ;  202 var sign word   649 NULL k = bp-6;
  6755 00003306 C8060000                 ENTER  6,0
  6756 0000330A 68[EC33]                 push checkcalls_0
  6757 0000330D E8CC11                   call prs
  6758 00003310 83C402                   add  sp, 2
  6759                                  
  6760                                  ;-651   i=0;  k=0;
  6761                                  
  6762 00003313 B80000                   mov ax, 0
  6763 00003316 8946FE                   mov [bp-2], ax
  6764 00003319 B80000                   mov ax, 0
  6765 0000331C 8946FA                   mov [bp-6], ax
  6766                                  
  6767                                  ;-652   while (i < CTop) {
  6768                                  
  6769                                  .checkcalls357:
  6770 0000331F 8B46FE                   mov ax, [bp-2]
  6771 00003322 3B06[3D00]               cmp ax, [CTop]
  6772 00003326 0F8D8F00                 jge .checkcalls358
  6773                                  
  6774                                  ;-653     pt=CAdr[i];
  6775                                  
  6776 0000332A 8B5EFE                   mov bx, [bp-2]
  6777 0000332D D1E3                     shl bx, 1
  6778 0000332F 8B8757AB                 mov ax, [CAdr + bx]
  6779 00003333 A3[6A00]                 mov word [pt], ax
  6780                                  
  6781                                  ;-654     from_far(NameA, pt);
  6782                                  
  6783 00003336 FF36[6A00]               push word [pt]
  6784 0000333A 8D06[3F00]               lea  ax, [NameA]
  6785 0000333E 50                       push ax
  6786 0000333F E8F61F                   call from_far
  6787 00003342 83C404                   add  sp, 4
  6788                                  
  6789                                  ;-655     j=0;
  6790                                  
  6791 00003345 B80000                   mov ax, 0
  6792 00003348 8946FC                   mov [bp-4], ax
  6793                                  
  6794                                  ;-656     do { p1=adrF(FNameField, j);
  6795                                  
  6796                                  .checkcalls359:
  6797 0000334B FF76FC                   push word [bp-4]
  6798 0000334E 8D064FBD                 lea  ax, [FNameField]
  6799 00003352 50                       push ax
  6800 00003353 E892D5                   call adrF
  6801 00003356 83C404                   add  sp, 4
  6802 00003359 A3[6C00]                 mov word [p1], ax
  6803                                  
  6804                                  ;-657       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6805                                  
  6806 0000335C FF36[6C00]               push word [p1]
  6807 00003360 8D06[3F00]               lea  ax, [NameA]
  6808 00003364 50                       push ax
  6809 00003365 E82ECE                   call eqstr
  6810 00003368 83C404                   add  sp, 4
  6811 0000336B 08C0                     or  al, al
  6812 0000336D 0F841000                 je .checkcalls360
  6813 00003371 B80100                   mov ax, 1
  6814 00003374 8B5EFE                   mov bx, [bp-2]
  6815 00003377 88872FA1                 mov [CType+bx], al
  6816 0000337B A1[3B00]                 mov ax, [FTop]
  6817 0000337E 8946FC                   mov [bp-4], ax
  6818                                  
  6819                                  ;-658       j++; } while (j < FTop);
  6820                                  
  6821                                  .checkcalls360:
  6822 00003381 FF46FC                   inc  word[bp-4]
  6823 00003384 8B46FC                   mov ax, [bp-4]
  6824 00003387 3B06[3B00]               cmp ax, [FTop]
  6825 0000338B 0F8D0200                 jge .checkcalls361
  6826 0000338F EBBA                     jmp .checkcalls359
  6827                                  .checkcalls361:
  6828                                  
  6829                                  ;-659     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6830                                  
  6831 00003391 8B46FC                   mov ax, [bp-4]
  6832 00003394 3B06[3B00]               cmp ax, [FTop]
  6833 00003398 0F851700                 jne .checkcalls362
  6834 0000339C FF46FA                   inc  word[bp-6]
  6835 0000339F 68[0734]                 push checkcalls_1
  6836 000033A2 E83711                   call prs
  6837 000033A5 83C402                   add  sp, 2
  6838 000033A8 8D06[3F00]               lea  ax, [NameA]
  6839 000033AC 50                       push ax
  6840 000033AD E82C11                   call prs
  6841 000033B0 83C402                   add  sp, 2
  6842                                  
  6843                                  ;-660     i++; }
  6844                                  
  6845                                  .checkcalls362:
  6846 000033B3 FF46FE                   inc  word[bp-2]
  6847                                  
  6848                                  ;-661   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6849                                  
  6850 000033B6 E966FF                   jmp .checkcalls357
  6851                                  .checkcalls358:
  6852 000033B9 68[0C34]                 push checkcalls_2
  6853 000033BC E81D11                   call prs
  6854 000033BF 83C402                   add  sp, 2
  6855 000033C2 FF76FA                   push word [bp-6]
  6856 000033C5 E8AB12                   call printint51
  6857 000033C8 83C402                   add  sp, 2
  6858                                  
  6859                                  ;-662   if (k!=0) error1("At least 1 function is missing! "); 
  6860                                  
  6861 000033CB 8B46FA                   mov ax, [bp-6]
  6862 000033CE 83F800                   cmp ax, 0
  6863 000033D1 0F840C00                 je  .checkcalls363
  6864 000033D5 68[2D34]                 push checkcalls_3
  6865 000033D8 E8E713                   call error1
  6866 000033DB 83C402                   add  sp, 2
  6867                                  
  6868                                  ;-663     else prs(" All FUNCTIONs in place");
  6869                                  
  6870 000033DE E90900                   jmp .checkcalls364
  6871                                  .checkcalls363:
  6872 000033E1 68[4E34]                 push checkcalls_4
  6873 000033E4 E8F510                   call prs
  6874 000033E7 83C402                   add  sp, 2
  6875                                  
  6876                                  ;-664 }
  6877                                  
  6878                                  .checkcalls364:
  6879                                  
  6880                                  ;-665 
  6881                                  
  6882                                  
  6883                                  ;-666 int doinclude() { int fdtemp;
  6884 000033EA C9                       LEAVE
  6885 000033EB C3                       ret
  6886 000033EC 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6887 000033F5 7373696E672066756E-
  6888 000033FE 6374696F6E733A2000 
  6889 00003407 5C6E3B2000              checkcalls_1 db "\n; ",0
  6890 0000340C 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6891 00003415 72206F6620756E7265-
  6892 0000341E 736F6C766564204341-
  6893 00003427 4C4C73203A00       
  6894 0000342D 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6895 00003436 312066756E6374696F-
  6896 0000343F 6E206973206D697373-
  6897 00003448 696E67212000       
  6898 0000344E 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6899 00003457 54494F4E7320696E20-
  6900 00003460 706C61636500       
  6901                                  ENDP
  6902                                  
  6903                                  doinclude: PROC
  6904                                  
  6905                                  ;-667   if (token==T_STRING) {  fdtemp=fdin;
  6906                                  
  6907                                  ;Function : doinclude, Number of local variables: 1
  6908                                  ;   # type sign width addr used name   list of local variables
  6909                                  ;  200 var sign word   666 NULL fdtemp = bp-2;
  6910 00003466 C8020000                 ENTER  2,0
  6911 0000346A A1[1C00]                 mov ax, [token]
  6912 0000346D 3D0201                   cmp ax, 258
  6913 00003470 0F858700                 jne .doinclude365
  6914 00003474 A1[1800]                 mov ax, [fdin]
  6915 00003477 8946FE                   mov [bp-2], ax
  6916                                  
  6917                                  ;-668   prs("\n;Use include file: "); prs(symbol);
  6918                                  
  6919 0000347A 68[FD34]                 push doinclude_0
  6920 0000347D E85C10                   call prs
  6921 00003480 83C402                   add  sp, 2
  6922 00003483 8D062B81                 lea  ax, [symbol]
  6923 00003487 50                       push ax
  6924 00003488 E85110                   call prs
  6925 0000348B 83C402                   add  sp, 2
  6926                                  
  6927                                  ;-669   fdin=openR(symbol);
  6928                                  
  6929 0000348E 8D062B81                 lea  ax, [symbol]
  6930 00003492 50                       push ax
  6931 00003493 E840CC                   call openR
  6932 00003496 83C402                   add  sp, 2
  6933 00003499 A3[1800]                 mov word [fdin], ax
  6934                                  
  6935                                  ;-670   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6936                                  
  6937 0000349C A1[6E00]                 mov ax, [DOS_ERR]
  6938 0000349F 83F800                   cmp ax, 0
  6939 000034A2 0F841D00                 je  .doinclude366
  6940 000034A6 68[1335]                 push doinclude_1
  6941 000034A9 E83010                   call prs
  6942 000034AC 83C402                   add  sp, 2
  6943 000034AF 8D062B81                 lea  ax, [symbol]
  6944 000034B3 50                       push ax
  6945 000034B4 E82510                   call prs
  6946 000034B7 83C402                   add  sp, 2
  6947                                  
  6948                                  ;-671     error1(" Stop!!"); }
  6949                                  
  6950 000034BA 68[2A35]                 push doinclude_2
  6951 000034BD E80213                   call error1
  6952 000034C0 83C402                   add  sp, 2
  6953                                  
  6954                                  ;-672   linenoinclude=lineno; lineno=1;
  6955                                  
  6956                                  .doinclude366:
  6957 000034C3 A1[6600]                 mov ax, [lineno]
  6958 000034C6 A3[6800]                 mov word [linenoinclude], ax
  6959 000034C9 B80100                   mov ax, 1
  6960 000034CC A3[6600]                 mov word [lineno], ax
  6961                                  
  6962                                  ;-673   parse(); lineno=linenoinclude;
  6963                                  
  6964 000034CF E89DFD                   call parse
  6965 000034D2 A1[6800]                 mov ax, [linenoinclude]
  6966 000034D5 A3[6600]                 mov word [lineno], ax
  6967                                  
  6968                                  ;-674   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6969                                  
  6970 000034D8 8B46FE                   mov ax, [bp-2]
  6971 000034DB A3[1800]                 mov word [fdin], ax
  6972 000034DE 68[3235]                 push doinclude_3
  6973 000034E1 E8F80F                   call prs
  6974 000034E4 83C402                   add  sp, 2
  6975 000034E7 8D06EE81                 lea  ax, [namein]
  6976 000034EB 50                       push ax
  6977 000034EC E8ED0F                   call prs
  6978 000034EF 83C402                   add  sp, 2
  6979                                  
  6980                                  ;-675   getfirstchar(); token=getlex(); }
  6981                                  
  6982 000034F2 E857FB                   call getfirstchar
  6983 000034F5 E88B07                   call getlex
  6984 000034F8 A3[1C00]                 mov word [token], ax
  6985                                  
  6986                                  ;-676 }
  6987                                  
  6988                                  .doinclude365:
  6989                                  
  6990                                  ;-677 int dodefine() { int i; int j; int fdtemp;
  6991 000034FB C9                       LEAVE
  6992 000034FC C3                       ret
  6993 000034FD 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  6994 00003506 636C7564652066696C-
  6995 0000350F 653A2000           
  6996 00003513 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  6997 0000351C 696C65206D69737369-
  6998 00003525 6E673A2000         
  6999 0000352A 2053746F70212100        doinclude_2 db " Stop!!",0
  7000 00003532 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7001 0000353B 6F206D61696E207072-
  7002 00003544 6F6772616D3A2000   
  7003                                  ENDP
  7004                                  
  7005                                  dodefine: PROC
  7006                                  
  7007                                  ;-678   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7008                                  
  7009                                  ;Function : dodefine, Number of local variables: 3
  7010                                  ;   # type sign width addr used name   list of local variables
  7011                                  ;  200 var sign word   677 NULL i = bp-2
  7012                                  ;  201 var sign word   677 NULL j = bp-4
  7013                                  ;  202 var sign word   677 NULL fdtemp = bp-6;
  7014 0000354C C8060000                 ENTER  6,0
  7015 00003550 68[9336]                 push dodefine_0
  7016 00003553 8D062B81                 lea  ax, [symbol]
  7017 00003557 50                       push ax
  7018 00003558 E83BCC                   call eqstr
  7019 0000355B 83C404                   add  sp, 4
  7020 0000355E 08C0                     or  al, al
  7021 00003560 0F841500                 je .dodefine367
  7022 00003564 E81C07                   call getlex
  7023 00003567 A3[1C00]                 mov word [token], ax
  7024                                  
  7025                                  ;-679     ORGDATAORIG=lexval; orgData=lexval; return; }
  7026                                  
  7027 0000356A A1[2E00]                 mov ax, [lexval]
  7028 0000356D A3[0E00]                 mov word [ORGDATAORIG], ax
  7029 00003570 A1[2E00]                 mov ax, [lexval]
  7030 00003573 A3[1000]                 mov word [orgData], ax
  7031 00003576 E91801                   jmp .retndodefine
  7032                                  
  7033                                  ;-680   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7034                                  
  7035                                  .dodefine367:
  7036 00003579 68[9B36]                 push dodefine_1
  7037 0000357C 8D062B81                 lea  ax, [symbol]
  7038 00003580 50                       push ax
  7039 00003581 E812CC                   call eqstr
  7040 00003584 83C404                   add  sp, 4
  7041 00003587 08C0                     or  al, al
  7042 00003589 0F844900                 je .dodefine368
  7043 0000358D E8F306                   call getlex
  7044 00003590 A3[1C00]                 mov word [token], ax
  7045 00003593 A1[1C00]                 mov ax, [token]
  7046 00003596 3D0201                   cmp ax, 258
  7047 00003599 0F852700                 jne .dodefine369
  7048                                  
  7049                                  ;-681     prs("\n;Use archive file: ");
  7050                                  
  7051 0000359D 68[A336]                 push dodefine_2
  7052 000035A0 E8390F                   call prs
  7053 000035A3 83C402                   add  sp, 2
  7054                                  
  7055                                  ;-682     strcpy(archivename, symbol); prs(archivename);
  7056                                  
  7057 000035A6 8D062B81                 lea  ax, [symbol]
  7058 000035AA 50                       push ax
  7059 000035AB 8D067482                 lea  ax, [archivename]
  7060 000035AF 50                       push ax
  7061 000035B0 E8B3CB                   call strcpy
  7062 000035B3 83C404                   add  sp, 4
  7063 000035B6 8D067482                 lea  ax, [archivename]
  7064 000035BA 50                       push ax
  7065 000035BB E81E0F                   call prs
  7066 000035BE 83C402                   add  sp, 2
  7067                                  
  7068                                  ;-683     } else error1("Name of archive file missing"); token=getlex(); return;}
  7069                                  
  7070 000035C1 E90900                   jmp .dodefine370
  7071                                  .dodefine369:
  7072 000035C4 68[B936]                 push dodefine_3
  7073 000035C7 E8F811                   call error1
  7074 000035CA 83C402                   add  sp, 2
  7075                                  .dodefine370:
  7076 000035CD E8B306                   call getlex
  7077 000035D0 A3[1C00]                 mov word [token], ax
  7078 000035D3 E9BB00                   jmp .retndodefine
  7079                                  
  7080                                  ;-684    expect(T_NAME);
  7081                                  
  7082                                  .dodefine368:
  7083 000035D6 680001                   push 256
  7084 000035D9 E8ED0D                   call expect
  7085 000035DC 83C402                   add  sp, 2
  7086                                  
  7087                                  ;-685   if (token==T_CONST) { 
  7088                                  
  7089 000035DF A1[1C00]                 mov ax, [token]
  7090 000035E2 3D0101                   cmp ax, 257
  7091 000035E5 0F85A800                 jne .dodefine371
  7092                                  
  7093                                  ;-686     if (GTop >= LSTART) error1("global table (define) full");
  7094                                  
  7095 000035E9 A1[2A00]                 mov ax, [GTop]
  7096 000035EC 3DC800                   cmp ax, 200 ;unsigned : 1
  7097 000035EF 0F8C0900                 jl  .dodefine372
  7098 000035F3 68[D636]                 push dodefine_4
  7099 000035F6 E8C911                   call error1
  7100 000035F9 83C402                   add  sp, 2
  7101                                  
  7102                                  ;-687     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7103                                  
  7104                                  .dodefine372:
  7105 000035FC 8D062B81                 lea  ax, [symbol]
  7106 00003600 50                       push ax
  7107 00003601 E83ACB                   call strlen
  7108 00003604 83C402                   add  sp, 2
  7109 00003607 8946FE                   mov [bp-2], ax
  7110 0000360A 8B46FE                   mov ax, [bp-2]
  7111 0000360D 83F80F                   cmp ax, 15
  7112 00003610 0F8E0900                 jle .dodefine373
  7113 00003614 68[F136]                 push dodefine_5
  7114 00003617 E8A811                   call error1
  7115 0000361A 83C402                   add  sp, 2
  7116                                  
  7117                                  ;-688     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7118                                  
  7119                                  .dodefine373:
  7120 0000361D B85500                   mov ax, 85
  7121 00003620 8B1E[2A00]               mov bx, [GTop]
  7122 00003624 8887E383                 mov [GSign+bx], al
  7123 00003628 B80100                   mov ax, 1
  7124 0000362B 8B1E[2A00]               mov bx, [GTop]
  7125 0000362F 88870F85                 mov [GWidth+bx], al
  7126 00003633 B82300                   mov ax, 35
  7127 00003636 8B1E[2A00]               mov bx, [GTop]
  7128 0000363A 8887B782                 mov [GType+bx], al
  7129                                  
  7130                                  ;-689     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7131                                  
  7132 0000363E A1[6600]                 mov ax, [lineno]
  7133 00003641 83E801                   sub ax, 1
  7134 00003644 8B1E[2A00]               mov bx, [GTop]
  7135 00003648 D1E3                     shl bx, 1
  7136 0000364A 89873B86                 mov [GAdr+bx], ax
  7137 0000364E B80000                   mov ax, 0
  7138 00003651 8B1E[2A00]               mov bx, [GTop]
  7139 00003655 D1E3                     shl bx, 1
  7140 00003657 89879388                 mov [GUsed+bx], ax
  7141                                  
  7142                                  ;-690     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7143                                  
  7144 0000365B FF36[2A00]               push word [GTop]
  7145 0000365F E872D2                   call adrofname
  7146 00003662 83C402                   add  sp, 2
  7147 00003665 A3[6A00]                 mov word [pt], ax
  7148 00003668 8D062B81                 lea  ax, [symbol]
  7149 0000366C 50                       push ax
  7150 0000366D FF36[6A00]               push word [pt]
  7151 00003671 E8F2CA                   call strcpy
  7152 00003674 83C404                   add  sp, 4
  7153 00003677 A1[2E00]                 mov ax, [lexval]
  7154 0000367A 8B1E[2A00]               mov bx, [GTop]
  7155 0000367E D1E3                     shl bx, 1
  7156 00003680 8987EB8A                 mov [GData+bx], ax
  7157                                  
  7158                                  ;-691     expect(T_CONST); GTop++;  } 
  7159                                  
  7160 00003684 680101                   push 257
  7161 00003687 E83F0D                   call expect
  7162 0000368A 83C402                   add  sp, 2
  7163 0000368D FF06[2A00]               inc  word[GTop]
  7164                                  
  7165                                  ;-692 }
  7166                                  
  7167                                  .dodefine371:
  7168                                  
  7169                                  ;-693 int stmt() { int c; char cha;
  7170                                  
  7171 00003691 C9                       .retndodefine: LEAVE
  7172 00003692 C3                       ret
  7173 00003693 4F52474441544100        dodefine_0 db "ORGDATA",0
  7174 0000369B 4152434849564500        dodefine_1 db "ARCHIVE",0
  7175 000036A3 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7176 000036AC 63686976652066696C-
  7177 000036B5 653A2000           
  7178 000036B9 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7179 000036C2 726368697665206669-
  7180 000036CB 6C65206D697373696E-
  7181 000036D4 6700               
  7182 000036D6 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7183 000036DF 626C65202864656669-
  7184 000036E8 6E65292066756C6C00 
  7185 000036F1 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7186 000036FA 6D65206C6F6E676572-
  7187 00003703 203135206368617200 
  7188                                  ENDP
  7189                                  
  7190                                  stmt: PROC
  7191                                  
  7192                                  ;-694        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7193                                  
  7194                                  ;Function : stmt, Number of local variables: 2
  7195                                  ;   # type sign width addr used name   list of local variables
  7196                                  ;  200 var sign word   693 NULL c = bp-2
  7197                                  ;  201 var sign byte   693 NULL cha = bp-4;
  7198 0000370C C8040000                 ENTER  4,0
  7199 00003710 6A7B                     push 123
  7200 00003712 E8920C                   call istoken
  7201 00003715 83C402                   add  sp, 2
  7202 00003718 08C0                     or  al, al
  7203 0000371A 0F841700                 je .stmt374
  7204                                  .stmt375:
  7205 0000371E 6A7D                     push 125
  7206 00003720 E8840C                   call istoken
  7207 00003723 83C402                   add  sp, 2
  7208 00003726 83F800                   cmp ax, 0
  7209 00003729 0F850500                 jne .stmt376
  7210 0000372D E8DCFF                   call stmt
  7211 00003730 EBEC                     jmp .stmt375
  7212                                  .stmt376:
  7213                                  
  7214                                  ;-695   else if(istoken(T_IF))    doif();
  7215                                  
  7216 00003732 E9B001                   jmp .stmt377
  7217                                  .stmt374:
  7218 00003735 680102                   push 513
  7219 00003738 E86C0C                   call istoken
  7220 0000373B 83C402                   add  sp, 2
  7221 0000373E 08C0                     or  al, al
  7222 00003740 0F840600                 je .stmt378
  7223 00003744 E8E203                   call doif
  7224                                  
  7225                                  ;-696   else if(istoken(T_DO))    dodo();
  7226                                  
  7227 00003747 E99B01                   jmp .stmt379
  7228                                  .stmt378:
  7229 0000374A 680402                   push 516
  7230 0000374D E8570C                   call istoken
  7231 00003750 83C402                   add  sp, 2
  7232 00003753 08C0                     or  al, al
  7233 00003755 0F840600                 je .stmt380
  7234 00003759 E82F04                   call dodo
  7235                                  
  7236                                  ;-697   else if(istoken(T_WHILE)) dowhile();
  7237                                  
  7238 0000375C E98601                   jmp .stmt381
  7239                                  .stmt380:
  7240 0000375F 680302                   push 515
  7241 00003762 E8420C                   call istoken
  7242 00003765 83C402                   add  sp, 2
  7243 00003768 08C0                     or  al, al
  7244 0000376A 0F840600                 je .stmt382
  7245 0000376E E86704                   call dowhile
  7246                                  
  7247                                  ;-698   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7248                                  
  7249 00003771 E97101                   jmp .stmt383
  7250                                  .stmt382:
  7251 00003774 680902                   push 521
  7252 00003777 E82D0C                   call istoken
  7253 0000377A 83C402                   add  sp, 2
  7254 0000377D 08C0                     or  al, al
  7255 0000377F 0F842200                 je .stmt384
  7256 00003783 68[E738]                 push stmt_0
  7257 00003786 E8530D                   call prs
  7258 00003789 83C402                   add  sp, 2
  7259 0000378C E874D3                   call name1
  7260 0000378F 8D062B81                 lea  ax, [symbol]
  7261 00003793 50                       push ax
  7262 00003794 E8450D                   call prs
  7263 00003797 83C402                   add  sp, 2
  7264 0000379A 6A3B                     push 59
  7265 0000379C E82A0C                   call expect
  7266 0000379F 83C402                   add  sp, 2
  7267                                  
  7268                                  ;-699   else if(token==T_ASM)     {prs("\n"); c=next();
  7269                                  
  7270 000037A2 E94001                   jmp .stmt385
  7271                                  .stmt384:
  7272 000037A5 A1[1C00]                 mov ax, [token]
  7273 000037A8 3D0602                   cmp ax, 518
  7274 000037AB 0F853300                 jne .stmt386
  7275 000037AF 68[F038]                 push stmt_1
  7276 000037B2 E8270D                   call prs
  7277 000037B5 83C402                   add  sp, 2
  7278 000037B8 E8CE0B                   call next
  7279 000037BB 8946FE                   mov [bp-2], ax
  7280                                  
  7281                                  ;-700         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7282                                  
  7283                                  .stmt387:
  7284 000037BE 8B46FE                   mov ax, [bp-2]
  7285 000037C1 83F80A                   cmp ax, 10
  7286 000037C4 0F841100                 je  .stmt388
  7287 000037C8 FF76FE                   push word [bp-2]
  7288 000037CB E8A70C                   call prc
  7289 000037CE 83C402                   add  sp, 2
  7290 000037D1 E8B50B                   call next
  7291 000037D4 8946FE                   mov [bp-2], ax
  7292 000037D7 EBE5                     jmp .stmt387
  7293                                  .stmt388:
  7294 000037D9 E8A704                   call getlex
  7295 000037DC A3[1C00]                 mov word [token], ax
  7296                                  
  7297                                  ;-701   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7298                                  
  7299 000037DF E90301                   jmp .stmt389
  7300                                  .stmt386:
  7301 000037E2 680702                   push 519
  7302 000037E5 E8BF0B                   call istoken
  7303 000037E8 83C402                   add  sp, 2
  7304 000037EB 08C0                     or  al, al
  7305 000037ED 0F844B00                 je .stmt390
  7306 000037F1 A1[1C00]                 mov ax, [token]
  7307 000037F4 83F87B                   cmp ax, 123
  7308 000037F7 0F853500                 jne .stmt391
  7309 000037FB 68[F338]                 push stmt_2
  7310 000037FE E8DB0C                   call prs
  7311 00003801 83C402                   add  sp, 2
  7312 00003804 E8820B                   call next
  7313 00003807 8846FC                   mov [bp-4], al
  7314                                  
  7315                                  ;-702         while(cha!= '}') { prc(cha); cha=next(); }
  7316                                  
  7317                                  .stmt392:
  7318 0000380A 8A46FC                   mov al, [bp-4]
  7319 0000380D 3C7D                     cmp al, 125
  7320 0000380F 0F841400                 je  .stmt393
  7321 00003813 8A46FC                   mov al, byte [bp-4]
  7322 00003816 B400                     mov ah, 0
  7323 00003818 50                       push ax
  7324 00003819 E8590C                   call prc
  7325 0000381C 83C402                   add  sp, 2
  7326 0000381F E8670B                   call next
  7327 00003822 8846FC                   mov [bp-4], al
  7328                                  
  7329                                  ;-703         token=getlex(); }
  7330                                  
  7331 00003825 EBE3                     jmp .stmt392
  7332                                  .stmt393:
  7333 00003827 E85904                   call getlex
  7334 0000382A A3[1C00]                 mov word [token], ax
  7335                                  
  7336                                  ;-704         else error1("Curly open expected"); 
  7337                                  
  7338 0000382D E90900                   jmp .stmt394
  7339                                  .stmt391:
  7340 00003830 68[F638]                 push stmt_3
  7341 00003833 E88C0F                   call error1
  7342 00003836 83C402                   add  sp, 2
  7343                                  
  7344                                  ;-705         }
  7345                                  
  7346                                  .stmt394:
  7347                                  
  7348                                  ;-706   else if(istoken(T_EMIT))   doemit();
  7349                                  
  7350 00003839 E9A900                   jmp .stmt395
  7351                                  .stmt390:
  7352 0000383C 680802                   push 520
  7353 0000383F E8650B                   call istoken
  7354 00003842 83C402                   add  sp, 2
  7355 00003845 08C0                     or  al, al
  7356 00003847 0F840600                 je .stmt396
  7357 0000384B E8CD00                   call doemit
  7358                                  
  7359                                  ;-707   else if(istoken(';'))      { }
  7360                                  
  7361 0000384E E99400                   jmp .stmt397
  7362                                  .stmt396:
  7363 00003851 6A3B                     push 59
  7364 00003853 E8510B                   call istoken
  7365 00003856 83C402                   add  sp, 2
  7366 00003859 08C0                     or  al, al
  7367 0000385B 0F840300                 je .stmt398
  7368                                  
  7369                                  ;-708   else if(istoken(T_RETURN)) {
  7370                                  
  7371 0000385F E98300                   jmp .stmt399
  7372                                  .stmt398:
  7373 00003862 680002                   push 512
  7374 00003865 E83F0B                   call istoken
  7375 00003868 83C402                   add  sp, 2
  7376 0000386B 08C0                     or  al, al
  7377 0000386D 0F843000                 je .stmt400
  7378                                  
  7379                                  ;-709         if (token!=';') exprstart();
  7380                                  
  7381 00003871 A1[1C00]                 mov ax, [token]
  7382 00003874 83F83B                   cmp ax, 59
  7383 00003877 0F840300                 je  .stmt401
  7384 0000387B E852D9                   call exprstart
  7385                                  
  7386                                  ;-710         prs("\n jmp .retn"); 
  7387                                  
  7388                                  .stmt401:
  7389 0000387E 68[0A39]                 push stmt_4
  7390 00003881 E8580C                   call prs
  7391 00003884 83C402                   add  sp, 2
  7392                                  
  7393                                  ;-711         prs(fname);
  7394                                  
  7395 00003887 8D06AB81                 lea  ax, [fname]
  7396 0000388B 50                       push ax
  7397 0000388C E84D0C                   call prs
  7398 0000388F 83C402                   add  sp, 2
  7399                                  
  7400                                  ;-712         nreturn++; 
  7401                                  
  7402 00003892 FF06[2600]               inc  word[nreturn]
  7403                                  
  7404                                  ;-713         expect(';');
  7405                                  
  7406 00003896 6A3B                     push 59
  7407 00003898 E82E0B                   call expect
  7408 0000389B 83C402                   add  sp, 2
  7409                                  
  7410                                  ;-714         }
  7411                                  
  7412                                  
  7413                                  ;-715   else if(thechar==':')      {
  7414                                  
  7415 0000389E E94400                   jmp .stmt402
  7416                                  .stmt400:
  7417 000038A1 A0[2100]                 mov al, [thechar]
  7418 000038A4 3C3A                     cmp al, 58
  7419 000038A6 0F853000                 jne .stmt403
  7420                                  
  7421                                  ;-716         prs("\n."); // Label
  7422                                  
  7423 000038AA 68[1739]                 push stmt_5
  7424 000038AD E82C0C                   call prs
  7425 000038B0 83C402                   add  sp, 2
  7426                                  
  7427                                  ;-717         prs(symbol); prc(':');  
  7428                                  
  7429 000038B3 8D062B81                 lea  ax, [symbol]
  7430 000038B7 50                       push ax
  7431 000038B8 E8210C                   call prs
  7432 000038BB 83C402                   add  sp, 2
  7433 000038BE 6A3A                     push 58
  7434 000038C0 E8B20B                   call prc
  7435 000038C3 83C402                   add  sp, 2
  7436                                  
  7437                                  ;-718         expect(T_NAME); 
  7438                                  
  7439 000038C6 680001                   push 256
  7440 000038C9 E8FD0A                   call expect
  7441 000038CC 83C402                   add  sp, 2
  7442                                  
  7443                                  ;-719         expect(':'); 
  7444                                  
  7445 000038CF 6A3A                     push 58
  7446 000038D1 E8F50A                   call expect
  7447 000038D4 83C402                   add  sp, 2
  7448                                  
  7449                                  ;-720         }
  7450                                  
  7451                                  
  7452                                  ;-721   else  {exprstart(); expect(';'); } 
  7453                                  
  7454 000038D7 E90B00                   jmp .stmt404
  7455                                  .stmt403:
  7456 000038DA E8F3D8                   call exprstart
  7457 000038DD 6A3B                     push 59
  7458 000038DF E8E70A                   call expect
  7459 000038E2 83C402                   add  sp, 2
  7460                                  
  7461                                  ;-722 }
  7462                                  
  7463                                  .stmt404:
  7464                                  .stmt402:
  7465                                  .stmt399:
  7466                                  .stmt397:
  7467                                  .stmt395:
  7468                                  .stmt389:
  7469                                  .stmt385:
  7470                                  .stmt383:
  7471                                  .stmt381:
  7472                                  .stmt379:
  7473                                  .stmt377:
  7474                                  
  7475                                  ;-723 
  7476                                  
  7477                                  
  7478                                  ;-724 int doemit() {prs("\n db ");
  7479 000038E5 C9                       LEAVE
  7480 000038E6 C3                       ret
  7481 000038E7 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7482 000038F0 5C6E00                  stmt_1 db "\n",0
  7483 000038F3 5C6E00                  stmt_2 db "\n",0
  7484 000038F6 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7485 000038FF 6E2065787065637465-
  7486 00003908 6400               
  7487 0000390A 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7488 00003913 65746E00           
  7489 00003917 5C6E2E00                stmt_5 db "\n.",0
  7490                                  ENDP
  7491                                  
  7492                                  doemit: PROC
  7493 0000391B 68[5739]                 push doemit_0
  7494 0000391E E8BB0B                   call prs
  7495 00003921 83C402                   add  sp, 2
  7496                                  
  7497                                  ;-725   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7498                                  
  7499                                  .L1:
  7500 00003924 E85C03                   call getlex
  7501 00003927 A3[1C00]                 mov word [token], ax
  7502 0000392A FF36[2E00]               push word [lexval]
  7503 0000392E E8000D                   call prunsign1
  7504 00003931 83C402                   add  sp, 2
  7505 00003934 E84C03                   call getlex
  7506 00003937 A3[1C00]                 mov word [token], ax
  7507                                  
  7508                                  ;-726     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7509                                  
  7510 0000393A A1[1C00]                 mov ax, [token]
  7511 0000393D 83F82C                   cmp ax, 44
  7512 00003940 0F850A00                 jne .doemit405
  7513 00003944 6A2C                     push 44
  7514 00003946 E82C0B                   call prc
  7515 00003949 83C402                   add  sp, 2
  7516 0000394C EBD6                     jmp .L1
  7517                                  .doemit405:
  7518 0000394E 6A29                     push 41
  7519 00003950 E8760A                   call expect
  7520 00003953 83C402                   add  sp, 2
  7521                                  
  7522                                  ;-727 
  7523                                  
  7524                                  
  7525                                  ;-728 int cmpneg(int ids) {
  7526                                  
  7527 00003956 C3                       ret
  7528 00003957 5C6E2064622000          doemit_0 db "\n db ",0
  7529                                  ENDP
  7530                                  
  7531                                  cmpneg: PROC
  7532                                  
  7533                                  ;-729        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7534                                  
  7535                                  ;Function : cmpneg, Number of local variables: 1
  7536                                  ;   # type sign width addr used name   list of local variables
  7537                                  ;  200 var sign word   728 NULL ids = bp+4;
  7538 0000395E C8000000                 ENTER  0,0
  7539 00003962 A1[2200]                 mov ax, [iscmp]
  7540 00003965 3D2603                   cmp ax, 806
  7541 00003968 0F850C00                 jne .cmpneg406
  7542 0000396C 68[3F3A]                 push cmpneg_0
  7543 0000396F E86A0B                   call prs
  7544 00003972 83C402                   add  sp, 2
  7545                                  
  7546                                  ;-730   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7547                                  
  7548 00003975 E9C500                   jmp .cmpneg407
  7549                                  .cmpneg406:
  7550 00003978 A1[2200]                 mov ax, [iscmp]
  7551 0000397B 3D2703                   cmp ax, 807
  7552 0000397E 0F850C00                 jne .cmpneg408
  7553 00003982 68[483A]                 push cmpneg_1
  7554 00003985 E8540B                   call prs
  7555 00003988 83C402                   add  sp, 2
  7556                                  
  7557                                  ;-731   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7558                                  
  7559 0000398B E9AF00                   jmp .cmpneg409
  7560                                  .cmpneg408:
  7561 0000398E A1[2200]                 mov ax, [iscmp]
  7562 00003991 3D3803                   cmp ax, 824
  7563 00003994 0F852100                 jne .cmpneg410
  7564 00003998 8B4604                   mov ax, [bp+4]
  7565 0000399B 08C0                     or  al, al
  7566 0000399D 0F840C00                 je .cmpneg411
  7567 000039A1 68[513A]                 push cmpneg_2
  7568 000039A4 E8350B                   call prs
  7569 000039A7 83C402                   add  sp, 2
  7570                                  
  7571                                  ;-732                            else prs("\n ja  .");//ZF=0 CF=0
  7572                                  
  7573 000039AA E90900                   jmp .cmpneg412
  7574                                  .cmpneg411:
  7575 000039AD 68[5A3A]                 push cmpneg_3
  7576 000039B0 E8290B                   call prs
  7577 000039B3 83C402                   add  sp, 2
  7578                                  
  7579                                  ;-733   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7580                                  
  7581                                  .cmpneg412:
  7582 000039B6 E98400                   jmp .cmpneg413
  7583                                  .cmpneg410:
  7584 000039B9 A1[2200]                 mov ax, [iscmp]
  7585 000039BC 3D2B03                   cmp ax, 811
  7586 000039BF 0F854500                 jne .cmpneg414
  7587 000039C3 8B4604                   mov ax, [bp+4]
  7588 000039C6 08C0                     or  al, al
  7589 000039C8 0F841E00                 je .cmpneg415
  7590 000039CC 68[633A]                 push cmpneg_4
  7591 000039CF E80A0B                   call prs
  7592 000039D2 83C402                   add  sp, 2
  7593 000039D5 FF7604                   push word [bp+4]
  7594 000039D8 E8560C                   call prunsign1
  7595 000039DB 83C402                   add  sp, 2
  7596                                  
  7597                                  ;-734                                prs("\n jl  .");}//          SF!=OF
  7598                                  
  7599 000039DE 68[713A]                 push cmpneg_5
  7600 000039E1 E8F80A                   call prs
  7601 000039E4 83C402                   add  sp, 2
  7602                                  
  7603                                  ;-735                            else{prs(" ;unsigned : "); prunsign1(ids);
  7604                                  
  7605 000039E7 E91B00                   jmp .cmpneg416
  7606                                  .cmpneg415:
  7607 000039EA 68[7A3A]                 push cmpneg_6
  7608 000039ED E8EC0A                   call prs
  7609 000039F0 83C402                   add  sp, 2
  7610 000039F3 FF7604                   push word [bp+4]
  7611 000039F6 E8380C                   call prunsign1
  7612 000039F9 83C402                   add  sp, 2
  7613                                  
  7614                                  ;-736                                prs("\n jb  .");}//jb=jc=CF=1
  7615                                  
  7616 000039FC 68[883A]                 push cmpneg_7
  7617 000039FF E8DA0A                   call prs
  7618 00003A02 83C402                   add  sp, 2
  7619                                  
  7620                                  ;-737   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7621                                  
  7622                                  .cmpneg416:
  7623 00003A05 E93500                   jmp .cmpneg417
  7624                                  .cmpneg414:
  7625 00003A08 A1[2200]                 mov ax, [iscmp]
  7626 00003A0B 83F83C                   cmp ax, 60
  7627 00003A0E 0F850C00                 jne .cmpneg418
  7628 00003A12 68[913A]                 push cmpneg_8
  7629 00003A15 E8C40A                   call prs
  7630 00003A18 83C402                   add  sp, 2
  7631                                  
  7632                                  ;-738   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7633                                  
  7634 00003A1B E91F00                   jmp .cmpneg419
  7635                                  .cmpneg418:
  7636 00003A1E A1[2200]                 mov ax, [iscmp]
  7637 00003A21 83F83E                   cmp ax, 62
  7638 00003A24 0F850C00                 jne .cmpneg420
  7639 00003A28 68[9A3A]                 push cmpneg_9
  7640 00003A2B E8AE0A                   call prs
  7641 00003A2E 83C402                   add  sp, 2
  7642                                  
  7643                                  ;-739   else error1("internal error compare unknown in CMPNEG()");  }
  7644                                  
  7645 00003A31 E90900                   jmp .cmpneg421
  7646                                  .cmpneg420:
  7647 00003A34 68[A33A]                 push cmpneg_10
  7648 00003A37 E8880D                   call error1
  7649 00003A3A 83C402                   add  sp, 2
  7650                                  .cmpneg421:
  7651                                  .cmpneg419:
  7652                                  .cmpneg417:
  7653                                  .cmpneg413:
  7654                                  .cmpneg409:
  7655                                  .cmpneg407:
  7656                                  
  7657                                  ;-740 
  7658                                  
  7659                                  
  7660                                  ;-741 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7661 00003A3D C9                       LEAVE
  7662 00003A3E C3                       ret
  7663 00003A3F 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7664 00003A48 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7665 00003A51 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7666 00003A5A 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7667 00003A63 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7668 00003A6C 64203A2000         
  7669 00003A71 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7670 00003A7A 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7671 00003A83 64203A2000         
  7672 00003A88 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7673 00003A91 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7674 00003A9A 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7675 00003AA3 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7676 00003AAC 6572726F7220636F6D-
  7677 00003AB5 7061726520756E6B6E-
  7678 00003ABE 6F776E20696E20434D-
  7679 00003AC7 504E4547282900     
  7680                                  ENDP
  7681                                  
  7682                                  prlabel: PROC
  7683                                  ;Function : prlabel, Number of local variables: 1
  7684                                  ;   # type sign width addr used name   list of local variables
  7685                                  ;  200 var sign word   741 NULL n = bp+4;
  7686 00003ACE C8000000                 ENTER  0,0
  7687 00003AD2 68[F93A]                 push prlabel_0
  7688 00003AD5 E8040A                   call prs
  7689 00003AD8 83C402                   add  sp, 2
  7690 00003ADB 8D06AB81                 lea  ax, [fname]
  7691 00003ADF 50                       push ax
  7692 00003AE0 E8F909                   call prs
  7693 00003AE3 83C402                   add  sp, 2
  7694 00003AE6 FF7604                   push word [bp+4]
  7695 00003AE9 E8450B                   call prunsign1
  7696 00003AEC 83C402                   add  sp, 2
  7697 00003AEF 6A3A                     push 58
  7698 00003AF1 E88109                   call prc
  7699 00003AF4 83C402                   add  sp, 2
  7700                                  
  7701                                  ;-742 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7702 00003AF7 C9                       LEAVE
  7703 00003AF8 C3                       ret
  7704 00003AF9 5C6E2E00                prlabel_0 db "\n.",0
  7705                                  ENDP
  7706                                  
  7707                                  prjump: PROC
  7708                                  ;Function : prjump, Number of local variables: 1
  7709                                  ;   # type sign width addr used name   list of local variables
  7710                                  ;  200 var sign word   742 NULL n = bp+4;
  7711 00003AFD C8000000                 ENTER  0,0
  7712 00003B01 68[203B]                 push prjump_0
  7713 00003B04 E8D509                   call prs
  7714 00003B07 83C402                   add  sp, 2
  7715 00003B0A 8D06AB81                 lea  ax, [fname]
  7716 00003B0E 50                       push ax
  7717 00003B0F E8CA09                   call prs
  7718 00003B12 83C402                   add  sp, 2
  7719 00003B15 FF7604                   push word [bp+4]
  7720 00003B18 E8160B                   call prunsign1
  7721 00003B1B 83C402                   add  sp, 2
  7722                                  
  7723                                  ;-743 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7724 00003B1E C9                       LEAVE
  7725 00003B1F C3                       ret
  7726 00003B20 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7727                                  ENDP
  7728                                  
  7729                                  doif: PROC
  7730                                  ;Function : doif, Number of local variables: 2
  7731                                  ;   # type sign width addr used name   list of local variables
  7732                                  ;  200 var sign word   743 NULL jdest = bp-2
  7733                                  ;  201 var sign word   743 NULL tst = bp-4;
  7734 00003B29 C8040000                 ENTER  4,0
  7735 00003B2D E814D5                   call pexpr
  7736 00003B30 FF06[2800]               inc  word[nlabel]
  7737 00003B34 A1[2800]                 mov ax, [nlabel]
  7738 00003B37 8946FE                   mov [bp-2], ax
  7739                                  
  7740                                  ;-744   pint1(jdest); stmt();
  7741                                  
  7742 00003B3A FF76FE                   push word [bp-2]
  7743 00003B3D E8930A                   call pint1
  7744 00003B40 83C402                   add  sp, 2
  7745 00003B43 E8C6FB                   call stmt
  7746                                  
  7747                                  ;-745   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7748                                  
  7749 00003B46 680202                   push 514
  7750 00003B49 E85B08                   call istoken
  7751 00003B4C 83C402                   add  sp, 2
  7752 00003B4F 08C0                     or  al, al
  7753 00003B51 0F842B00                 je .doif422
  7754 00003B55 FF06[2800]               inc  word[nlabel]
  7755 00003B59 A1[2800]                 mov ax, [nlabel]
  7756 00003B5C 8946FC                   mov [bp-4], ax
  7757                                  
  7758                                  ;-746     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7759                                  
  7760 00003B5F FF76FC                   push word [bp-4]
  7761 00003B62 E898FF                   call prjump
  7762 00003B65 83C402                   add  sp, 2
  7763 00003B68 FF76FE                   push word [bp-2]
  7764 00003B6B E860FF                   call prlabel
  7765 00003B6E 83C402                   add  sp, 2
  7766 00003B71 E898FB                   call stmt
  7767 00003B74 FF76FC                   push word [bp-4]
  7768 00003B77 E854FF                   call prlabel
  7769 00003B7A 83C402                   add  sp, 2
  7770                                  
  7771                                  ;-747   else prlabel(jdest); }
  7772                                  
  7773 00003B7D E90900                   jmp .doif423
  7774                                  .doif422:
  7775 00003B80 FF76FE                   push word [bp-2]
  7776 00003B83 E848FF                   call prlabel
  7777 00003B86 83C402                   add  sp, 2
  7778                                  .doif423:
  7779                                  
  7780                                  ;-748 
  7781                                  
  7782                                  
  7783                                  ;-749 int dodo() {int jdest; int jtemp;
  7784 00003B89 C9                       LEAVE
  7785 00003B8A C3                       ret
  7786                                  ENDP
  7787                                  
  7788                                  dodo: PROC
  7789                                  
  7790                                  ;-750   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7791                                  
  7792                                  ;Function : dodo, Number of local variables: 2
  7793                                  ;   # type sign width addr used name   list of local variables
  7794                                  ;  200 var sign word   749 NULL jdest = bp-2
  7795                                  ;  201 var sign word   749 NULL jtemp = bp-4;
  7796 00003B8B C8040000                 ENTER  4,0
  7797 00003B8F FF06[2800]               inc  word[nlabel]
  7798 00003B93 A1[2800]                 mov ax, [nlabel]
  7799 00003B96 8946FE                   mov [bp-2], ax
  7800 00003B99 FF76FE                   push word [bp-2]
  7801 00003B9C E82FFF                   call prlabel
  7802 00003B9F 83C402                   add  sp, 2
  7803 00003BA2 E867FB                   call stmt
  7804                                  
  7805                                  ;-751   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7806                                  
  7807 00003BA5 680302                   push 515
  7808 00003BA8 E81E08                   call expect
  7809 00003BAB 83C402                   add  sp, 2
  7810 00003BAE E893D4                   call pexpr
  7811 00003BB1 FF06[2800]               inc  word[nlabel]
  7812 00003BB5 A1[2800]                 mov ax, [nlabel]
  7813 00003BB8 8946FC                   mov [bp-4], ax
  7814 00003BBB FF76FC                   push word [bp-4]
  7815 00003BBE E8120A                   call pint1
  7816 00003BC1 83C402                   add  sp, 2
  7817                                  
  7818                                  ;-752   prjump(jdest); prlabel(jtemp); }
  7819                                  
  7820 00003BC4 FF76FE                   push word [bp-2]
  7821 00003BC7 E833FF                   call prjump
  7822 00003BCA 83C402                   add  sp, 2
  7823 00003BCD FF76FC                   push word [bp-4]
  7824 00003BD0 E8FBFE                   call prlabel
  7825 00003BD3 83C402                   add  sp, 2
  7826                                  
  7827                                  ;-753 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7828 00003BD6 C9                       LEAVE
  7829 00003BD7 C3                       ret
  7830                                  ENDP
  7831                                  
  7832                                  dowhile: PROC
  7833                                  ;Function : dowhile, Number of local variables: 2
  7834                                  ;   # type sign width addr used name   list of local variables
  7835                                  ;  200 var sign word   753 NULL jdest = bp-2
  7836                                  ;  201 var sign word   753 NULL tst = bp-4;
  7837 00003BD8 C8040000                 ENTER  4,0
  7838 00003BDC FF06[2800]               inc  word[nlabel]
  7839 00003BE0 A1[2800]                 mov ax, [nlabel]
  7840 00003BE3 8946FE                   mov [bp-2], ax
  7841                                  
  7842                                  ;-754   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7843                                  
  7844 00003BE6 FF76FE                   push word [bp-2]
  7845 00003BE9 E8E2FE                   call prlabel
  7846 00003BEC 83C402                   add  sp, 2
  7847 00003BEF E852D4                   call pexpr
  7848 00003BF2 FF06[2800]               inc  word[nlabel]
  7849 00003BF6 A1[2800]                 mov ax, [nlabel]
  7850 00003BF9 8946FC                   mov [bp-4], ax
  7851 00003BFC FF76FC                   push word [bp-4]
  7852 00003BFF E8D109                   call pint1
  7853 00003C02 83C402                   add  sp, 2
  7854                                  
  7855                                  ;-755   stmt(); prjump(jdest); prlabel(tst); }
  7856                                  
  7857 00003C05 E804FB                   call stmt
  7858 00003C08 FF76FE                   push word [bp-2]
  7859 00003C0B E8EFFE                   call prjump
  7860 00003C0E 83C402                   add  sp, 2
  7861 00003C11 FF76FC                   push word [bp-4]
  7862 00003C14 E8B7FE                   call prlabel
  7863 00003C17 83C402                   add  sp, 2
  7864                                  
  7865                                  ;-756 int isrelational() {
  7866 00003C1A C9                       LEAVE
  7867 00003C1B C3                       ret
  7868                                  ENDP
  7869                                  
  7870                                  isrelational: PROC
  7871                                  
  7872                                  ;-757   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7873                                  
  7874 00003C1C A1[1C00]                 mov ax, [token]
  7875 00003C1F 3D2603                   cmp ax, 806
  7876 00003C22 0F850300                 jne .isrelational424
  7877 00003C26 E94700                   jmp .w
  7878                                  .isrelational424:
  7879 00003C29 A1[1C00]                 mov ax, [token]
  7880 00003C2C 3D2703                   cmp ax, 807
  7881 00003C2F 0F850300                 jne .isrelational425
  7882 00003C33 E93A00                   jmp .w
  7883                                  
  7884                                  ;-758   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7885                                  
  7886                                  .isrelational425:
  7887 00003C36 A1[1C00]                 mov ax, [token]
  7888 00003C39 3D3803                   cmp ax, 824
  7889 00003C3C 0F850300                 jne .isrelational426
  7890 00003C40 E92D00                   jmp .w
  7891                                  .isrelational426:
  7892 00003C43 A1[1C00]                 mov ax, [token]
  7893 00003C46 3D2B03                   cmp ax, 811
  7894 00003C49 0F850300                 jne .isrelational427
  7895 00003C4D E92000                   jmp .w
  7896                                  
  7897                                  ;-759   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7898                                  
  7899                                  .isrelational427:
  7900 00003C50 A1[1C00]                 mov ax, [token]
  7901 00003C53 83F83C                   cmp ax, 60
  7902 00003C56 0F850300                 jne .isrelational428
  7903 00003C5A E91300                   jmp .w
  7904                                  .isrelational428:
  7905 00003C5D A1[1C00]                 mov ax, [token]
  7906 00003C60 83F83E                   cmp ax, 62
  7907 00003C63 0F850300                 jne .isrelational429
  7908 00003C67 E90600                   jmp .w
  7909                                  
  7910                                  ;-760   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7911                                  
  7912                                  .isrelational429:
  7913 00003C6A B80000                   mov ax, 0
  7914 00003C6D E91200                   jmp .retnisrelational
  7915                                  .w:
  7916 00003C70 A1[1C00]                 mov ax, [token]
  7917 00003C73 A3[2200]                 mov word [iscmp], ax
  7918 00003C76 E80A00                   call getlex
  7919 00003C79 A3[1C00]                 mov word [token], ax
  7920 00003C7C B80100                   mov ax, 1
  7921 00003C7F E90000                   jmp .retnisrelational
  7922                                  
  7923                                  ;-761  
  7924                                  
  7925                                  
  7926                                  ;-762 char symboltemp[80];    
  7927                                  
  7928                                   .retnisrelational:
  7929 00003C82 C3                       ret
  7930                                  ENDP
  7931                                  section .bss
  7932                                  absolute 53468
  7933 0000D0DC <res 00000050>          symboltemp resb 80
  7934                                  section .text
  7935                                  
  7936                                  ;-763 int getlex() { char c; char *p; 
  7937                                  
  7938                                  
  7939                                  getlex: PROC
  7940                                  
  7941                                  ;-764 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7942                                  
  7943                                  ;Function : getlex, Number of local variables: 2
  7944                                  ;   # type sign width addr used name   list of local variables
  7945                                  ;  200 var sign byte   763 NULL c = bp-2
  7946                                  ;  201 ptr sign byte   763 NULL p = bp-4;
  7947 00003C83 C8040000                 ENTER  4,0
  7948                                  .g1:
  7949 00003C87 E8FF06                   call next
  7950 00003C8A 8846FE                   mov [bp-2], al
  7951 00003C8D 8A46FE                   mov al, [bp-2]
  7952 00003C90 3C00                     cmp al, 0
  7953 00003C92 0F850600                 jne .getlex430
  7954 00003C96 B80000                   mov ax, 0
  7955 00003C99 E9EB04                   jmp .retngetlex
  7956                                  .getlex430:
  7957 00003C9C 8A46FE                   mov al, [bp-2]
  7958 00003C9F 3C20                     cmp al, 32
  7959 00003CA1 0F8F0200                 jg  .getlex431
  7960 00003CA5 EBE0                     jmp .g1
  7961                                  
  7962                                  ;-765   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7963                                  
  7964                                  .getlex431:
  7965 00003CA7 8A46FE                   mov al, [bp-2]
  7966 00003CAA 3C3D                     cmp al, 61
  7967 00003CAC 0F851200                 jne .getlex432
  7968 00003CB0 A0[2100]                 mov al, [thechar]
  7969 00003CB3 3C3D                     cmp al, 61
  7970 00003CB5 0F850900                 jne .getlex433
  7971 00003CB9 E8CD06                   call next
  7972 00003CBC B82603                   mov ax, 806
  7973 00003CBF E9C504                   jmp .retngetlex
  7974                                  .getlex433:
  7975                                  
  7976                                  ;-766   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7977                                  
  7978                                  .getlex432:
  7979 00003CC2 8A46FE                   mov al, [bp-2]
  7980 00003CC5 3C21                     cmp al, 33
  7981 00003CC7 0F851200                 jne .getlex434
  7982 00003CCB A0[2100]                 mov al, [thechar]
  7983 00003CCE 3C3D                     cmp al, 61
  7984 00003CD0 0F850900                 jne .getlex435
  7985 00003CD4 E8B206                   call next
  7986 00003CD7 B82703                   mov ax, 807
  7987 00003CDA E9AA04                   jmp .retngetlex
  7988                                  .getlex435:
  7989                                  
  7990                                  ;-767   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7991                                  
  7992                                  .getlex434:
  7993 00003CDD 8A46FE                   mov al, [bp-2]
  7994 00003CE0 3C3C                     cmp al, 60
  7995 00003CE2 0F851200                 jne .getlex436
  7996 00003CE6 A0[2100]                 mov al, [thechar]
  7997 00003CE9 3C3D                     cmp al, 61
  7998 00003CEB 0F850900                 jne .getlex437
  7999 00003CEF E89706                   call next
  8000 00003CF2 B83803                   mov ax, 824
  8001 00003CF5 E98F04                   jmp .retngetlex
  8002                                  .getlex437:
  8003                                  
  8004                                  ;-768   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8005                                  
  8006                                  .getlex436:
  8007 00003CF8 8A46FE                   mov al, [bp-2]
  8008 00003CFB 3C3E                     cmp al, 62
  8009 00003CFD 0F851200                 jne .getlex438
  8010 00003D01 A0[2100]                 mov al, [thechar]
  8011 00003D04 3C3D                     cmp al, 61
  8012 00003D06 0F850900                 jne .getlex439
  8013 00003D0A E87C06                   call next
  8014 00003D0D B82B03                   mov ax, 811
  8015 00003D10 E97404                   jmp .retngetlex
  8016                                  .getlex439:
  8017                                  
  8018                                  ;-769   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8019                                  
  8020                                  .getlex438:
  8021 00003D13 8A46FE                   mov al, [bp-2]
  8022 00003D16 3C3C                     cmp al, 60
  8023 00003D18 0F851200                 jne .getlex440
  8024 00003D1C A0[2100]                 mov al, [thechar]
  8025 00003D1F 3C3C                     cmp al, 60
  8026 00003D21 0F850900                 jne .getlex441
  8027 00003D25 E86106                   call next
  8028 00003D28 B8D804                   mov ax, 1240
  8029 00003D2B E95904                   jmp .retngetlex
  8030                                  .getlex441:
  8031                                  
  8032                                  ;-770   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8033                                  
  8034                                  .getlex440:
  8035 00003D2E 8A46FE                   mov al, [bp-2]
  8036 00003D31 3C3E                     cmp al, 62
  8037 00003D33 0F851200                 jne .getlex442
  8038 00003D37 A0[2100]                 mov al, [thechar]
  8039 00003D3A 3C3E                     cmp al, 62
  8040 00003D3C 0F850900                 jne .getlex443
  8041 00003D40 E84606                   call next
  8042 00003D43 B8D904                   mov ax, 1241
  8043 00003D46 E93E04                   jmp .retngetlex
  8044                                  .getlex443:
  8045                                  
  8046                                  ;-771   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8047                                  
  8048                                  .getlex442:
  8049 00003D49 8A46FE                   mov al, [bp-2]
  8050 00003D4C 3C2B                     cmp al, 43
  8051 00003D4E 0F851200                 jne .getlex444
  8052 00003D52 A0[2100]                 mov al, [thechar]
  8053 00003D55 3C2B                     cmp al, 43
  8054 00003D57 0F850900                 jne .getlex445
  8055 00003D5B E82B06                   call next
  8056 00003D5E B8C304                   mov ax, 1219
  8057 00003D61 E92304                   jmp .retngetlex
  8058                                  .getlex445:
  8059                                  
  8060                                  ;-772   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8061                                  
  8062                                  .getlex444:
  8063 00003D64 8A46FE                   mov al, [bp-2]
  8064 00003D67 3C2D                     cmp al, 45
  8065 00003D69 0F851200                 jne .getlex446
  8066 00003D6D A0[2100]                 mov al, [thechar]
  8067 00003D70 3C2D                     cmp al, 45
  8068 00003D72 0F850900                 jne .getlex447
  8069 00003D76 E81006                   call next
  8070 00003D79 B8C904                   mov ax, 1225
  8071 00003D7C E90804                   jmp .retngetlex
  8072                                  .getlex447:
  8073                                  
  8074                                  ;-773   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8075                                  
  8076                                  .getlex446:
  8077 00003D7F 8A46FE                   mov al, [bp-2]
  8078 00003D82 3C2B                     cmp al, 43
  8079 00003D84 0F851200                 jne .getlex448
  8080 00003D88 A0[2100]                 mov al, [thechar]
  8081 00003D8B 3C3D                     cmp al, 61
  8082 00003D8D 0F850900                 jne .getlex449
  8083 00003D91 E8F505                   call next
  8084 00003D94 B8CE04                   mov ax, 1230
  8085 00003D97 E9ED03                   jmp .retngetlex
  8086                                  .getlex449:
  8087                                  
  8088                                  ;-774   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8089                                  
  8090                                  .getlex448:
  8091 00003D9A 8A46FE                   mov al, [bp-2]
  8092 00003D9D 3C2D                     cmp al, 45
  8093 00003D9F 0F851200                 jne .getlex450
  8094 00003DA3 A0[2100]                 mov al, [thechar]
  8095 00003DA6 3C3D                     cmp al, 61
  8096 00003DA8 0F850900                 jne .getlex451
  8097 00003DAC E8DA05                   call next
  8098 00003DAF B8CF04                   mov ax, 1231
  8099 00003DB2 E9D203                   jmp .retngetlex
  8100                                  .getlex451:
  8101                                  
  8102                                  ;-775   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8103                                  
  8104                                  .getlex450:
  8105 00003DB5 8A46FE                   mov al, [bp-2]
  8106 00003DB8 3C26                     cmp al, 38
  8107 00003DBA 0F851200                 jne .getlex452
  8108 00003DBE A0[2100]                 mov al, [thechar]
  8109 00003DC1 3C3D                     cmp al, 61
  8110 00003DC3 0F850900                 jne .getlex453
  8111 00003DC7 E8BF05                   call next
  8112 00003DCA B8D204                   mov ax, 1234
  8113 00003DCD E9B703                   jmp .retngetlex
  8114                                  .getlex453:
  8115                                  
  8116                                  ;-776   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8117                                  
  8118                                  .getlex452:
  8119 00003DD0 8A46FE                   mov al, [bp-2]
  8120 00003DD3 3C7C                     cmp al, 124
  8121 00003DD5 0F851200                 jne .getlex454
  8122 00003DD9 A0[2100]                 mov al, [thechar]
  8123 00003DDC 3C3D                     cmp al, 61
  8124 00003DDE 0F850900                 jne .getlex455
  8125 00003DE2 E8A405                   call next
  8126 00003DE5 B8D304                   mov ax, 1235
  8127 00003DE8 E99C03                   jmp .retngetlex
  8128                                  .getlex455:
  8129                                  
  8130                                  ;-777   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8131                                  
  8132                                  .getlex454:
  8133 00003DEB 8A46FE                   mov al, [bp-2]
  8134 00003DEE 3C2A                     cmp al, 42
  8135 00003DF0 0F851200                 jne .getlex456
  8136 00003DF4 A0[2100]                 mov al, [thechar]
  8137 00003DF7 3C3D                     cmp al, 61
  8138 00003DF9 0F850900                 jne .getlex457
  8139 00003DFD E88905                   call next
  8140 00003E00 B8D004                   mov ax, 1232
  8141 00003E03 E98103                   jmp .retngetlex
  8142                                  .getlex457:
  8143                                  
  8144                                  ;-778   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8145                                  
  8146                                  .getlex456:
  8147 00003E06 8A46FE                   mov al, [bp-2]
  8148 00003E09 3C2F                     cmp al, 47
  8149 00003E0B 0F851200                 jne .getlex458
  8150 00003E0F A0[2100]                 mov al, [thechar]
  8151 00003E12 3C3D                     cmp al, 61
  8152 00003E14 0F850900                 jne .getlex459
  8153 00003E18 E86E05                   call next
  8154 00003E1B B8D104                   mov ax, 1233
  8155 00003E1E E96603                   jmp .retngetlex
  8156                                  .getlex459:
  8157                                  
  8158                                  ;-779   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8159                                  
  8160                                  .getlex458:
  8161 00003E21 8A46FE                   mov al, byte [bp-2]
  8162 00003E24 B400                     mov ah, 0
  8163 00003E26 50                       push ax
  8164 00003E27 68[8941]                 push getlex_0
  8165 00003E2A E8B5C3                   call instr1
  8166 00003E2D 83C404                   add  sp, 4
  8167 00003E30 08C0                     or  al, al
  8168 00003E32 0F840600                 je .getlex460
  8169 00003E36 8A46FE                   mov al, [bp-2]
  8170 00003E39 E94B03                   jmp .retngetlex
  8171                                  
  8172                                  ;-780   if (c == '/') { if (thechar == '/') {
  8173                                  
  8174                                  .getlex460:
  8175 00003E3C 8A46FE                   mov al, [bp-2]
  8176 00003E3F 3C2F                     cmp al, 47
  8177 00003E41 0F852000                 jne .getlex461
  8178 00003E45 A0[2100]                 mov al, [thechar]
  8179 00003E48 3C2F                     cmp al, 47
  8180 00003E4A 0F851700                 jne .getlex462
  8181                                  
  8182                                  ;-781       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8183                                  
  8184                                  .getlex463:
  8185 00003E4E E83805                   call next
  8186 00003E51 8846FE                   mov [bp-2], al
  8187 00003E54 8A46FE                   mov al, [bp-2]
  8188 00003E57 3C0D                     cmp al, 13
  8189 00003E59 0F840200                 je  .getlex464
  8190 00003E5D EBEF                     jmp .getlex463
  8191                                  .getlex464:
  8192 00003E5F E821FE                   call getlex
  8193 00003E62 E92203                   jmp .retngetlex
  8194                                  .getlex462:
  8195                                  
  8196                                  ;-782   if (c == '/') { if (thechar == '*') {
  8197                                  
  8198                                  .getlex461:
  8199 00003E65 8A46FE                   mov al, [bp-2]
  8200 00003E68 3C2F                     cmp al, 47
  8201 00003E6A 0F853A00                 jne .getlex465
  8202 00003E6E A0[2100]                 mov al, [thechar]
  8203 00003E71 3C2A                     cmp al, 42
  8204 00003E73 0F852B00                 jne .getlex466
  8205                                  
  8206                                  ;-783       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8207                                  
  8208                                  .g2:
  8209 00003E77 E80F05                   call next
  8210 00003E7A 8846FE                   mov [bp-2], al
  8211 00003E7D 8A46FE                   mov al, [bp-2]
  8212 00003E80 3C2A                     cmp al, 42
  8213 00003E82 0F840200                 je  .getlex467
  8214 00003E86 EBEF                     jmp .g2
  8215                                  .getlex467:
  8216 00003E88 A0[2100]                 mov al, [thechar]
  8217 00003E8B 3C2F                     cmp al, 47
  8218 00003E8D 0F840200                 je  .getlex468
  8219 00003E91 EBE4                     jmp .g2
  8220                                  
  8221                                  ;-784       c=next(); return getlex(); } else  return '/'; }
  8222                                  
  8223                                  .getlex468:
  8224 00003E93 E8F304                   call next
  8225 00003E96 8846FE                   mov [bp-2], al
  8226 00003E99 E8E7FD                   call getlex
  8227 00003E9C E9E802                   jmp .retngetlex
  8228 00003E9F E90600                   jmp .getlex469
  8229                                  .getlex466:
  8230 00003EA2 B82F00                   mov ax, 47
  8231 00003EA5 E9DF02                   jmp .retngetlex
  8232                                  .getlex469:
  8233                                  
  8234                                  ;-785   if (c == '"') {getstring(c); return T_STRING;}
  8235                                  
  8236                                  .getlex465:
  8237 00003EA8 8A46FE                   mov al, [bp-2]
  8238 00003EAB 3C22                     cmp al, 34
  8239 00003EAD 0F851200                 jne .getlex470
  8240 00003EB1 8A46FE                   mov al, byte [bp-2]
  8241 00003EB4 B400                     mov ah, 0
  8242 00003EB6 50                       push ax
  8243 00003EB7 E89804                   call getstring
  8244 00003EBA 83C402                   add  sp, 2
  8245 00003EBD B80201                   mov ax, 258
  8246 00003EC0 E9C402                   jmp .retngetlex
  8247                                  
  8248                                  ;-786   if (digit(c)) { getdigit(c); return T_CONST; }
  8249                                  
  8250                                  .getlex470:
  8251 00003EC3 8A46FE                   mov al, byte [bp-2]
  8252 00003EC6 B400                     mov ah, 0
  8253 00003EC8 50                       push ax
  8254 00003EC9 E8B0C3                   call digit
  8255 00003ECC 83C402                   add  sp, 2
  8256 00003ECF 08C0                     or  al, al
  8257 00003ED1 0F841200                 je .getlex471
  8258 00003ED5 8A46FE                   mov al, byte [bp-2]
  8259 00003ED8 B400                     mov ah, 0
  8260 00003EDA 50                       push ax
  8261 00003EDB E89E03                   call getdigit
  8262 00003EDE 83C402                   add  sp, 2
  8263 00003EE1 B80101                   mov ax, 257
  8264 00003EE4 E9A002                   jmp .retngetlex
  8265                                  
  8266                                  ;-787   if (c==39) { lexval=next();
  8267                                  
  8268                                  .getlex471:
  8269 00003EE7 8A46FE                   mov al, [bp-2]
  8270 00003EEA 3C27                     cmp al, 39
  8271 00003EEC 0F854F00                 jne .getlex472
  8272 00003EF0 E89604                   call next
  8273 00003EF3 A3[2E00]                 mov word [lexval], ax
  8274                                  
  8275                                  ;-788     if (lexval==92) {lexval=next();
  8276                                  
  8277 00003EF6 A1[2E00]                 mov ax, [lexval]
  8278 00003EF9 83F85C                   cmp ax, 92
  8279 00003EFC 0F853600                 jne .getlex473
  8280 00003F00 E88604                   call next
  8281 00003F03 A3[2E00]                 mov word [lexval], ax
  8282                                  
  8283                                  ;-789       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8284                                  
  8285 00003F06 A1[2E00]                 mov ax, [lexval]
  8286 00003F09 83F86E                   cmp ax, 110
  8287 00003F0C 0F850600                 jne .getlex474
  8288 00003F10 B80A00                   mov ax, 10
  8289 00003F13 A3[2E00]                 mov word [lexval], ax
  8290                                  .getlex474:
  8291 00003F16 A1[2E00]                 mov ax, [lexval]
  8292 00003F19 83F874                   cmp ax, 116
  8293 00003F1C 0F850600                 jne .getlex475
  8294 00003F20 B80900                   mov ax, 9
  8295 00003F23 A3[2E00]                 mov word [lexval], ax
  8296                                  
  8297                                  ;-790       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8298                                  
  8299                                  .getlex475:
  8300 00003F26 A1[2E00]                 mov ax, [lexval]
  8301 00003F29 83F830                   cmp ax, 48
  8302 00003F2C 0F850600                 jne .getlex476
  8303 00003F30 B80000                   mov ax, 0
  8304 00003F33 A3[2E00]                 mov word [lexval], ax
  8305                                  .getlex476:
  8306                                  .getlex473:
  8307 00003F36 E85004                   call next
  8308 00003F39 B80101                   mov ax, 257
  8309 00003F3C E94802                   jmp .retngetlex
  8310                                  
  8311                                  ;-791   if (alnum(c)) { 
  8312                                  
  8313                                  .getlex472:
  8314 00003F3F 8A46FE                   mov al, byte [bp-2]
  8315 00003F42 B400                     mov ah, 0
  8316 00003F44 50                       push ax
  8317 00003F45 E8DCC3                   call alnum
  8318 00003F48 83C402                   add  sp, 2
  8319 00003F4B 08C0                     or  al, al
  8320 00003F4D 0F842D02                 je .getlex477
  8321                                  
  8322                                  ;-792     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8323                                  
  8324 00003F51 8D062B81                 lea  ax, [symbol]
  8325 00003F55 50                       push ax
  8326 00003F56 8D06DCD0                 lea  ax, [symboltemp]
  8327 00003F5A 50                       push ax
  8328 00003F5B E808C2                   call strcpy
  8329 00003F5E 83C404                   add  sp, 4
  8330 00003F61 B82B81                   mov ax, symbol
  8331 00003F64 8946FC                   mov [bp-4], ax
  8332 00003F67 8A46FE                   mov al, [bp-2]
  8333 00003F6A 8B5EFC                   mov  bx, [bp-4]
  8334 00003F6D 8807                     mov  [bx], al
  8335 00003F6F FF46FC                   inc  word[bp-4]
  8336                                  
  8337                                  ;-793     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8338                                  
  8339                                  .getlex478:
  8340 00003F72 A0[2100]                 mov al, byte [thechar]
  8341 00003F75 B400                     mov ah, 0
  8342 00003F77 50                       push ax
  8343 00003F78 E8A9C3                   call alnum
  8344 00003F7B 83C402                   add  sp, 2
  8345 00003F7E 08C0                     or  al, al
  8346 00003F80 0F841300                 je .getlex479
  8347 00003F84 E80204                   call next
  8348 00003F87 8846FE                   mov [bp-2], al
  8349 00003F8A 8A46FE                   mov al, [bp-2]
  8350 00003F8D 8B5EFC                   mov  bx, [bp-4]
  8351 00003F90 8807                     mov  [bx], al
  8352 00003F92 FF46FC                   inc  word[bp-4]
  8353                                  
  8354                                  ;-794       *p=0;
  8355                                  
  8356 00003F95 EBDB                     jmp .getlex478
  8357                                  .getlex479:
  8358 00003F97 B80000                   mov ax, 0
  8359 00003F9A 8B5EFC                   mov  bx, [bp-4]
  8360 00003F9D 8807                     mov  [bx], al
  8361                                  
  8362                                  ;-795     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8363                                  
  8364 00003F9F 68[9F41]                 push getlex_1
  8365 00003FA2 8D062B81                 lea  ax, [symbol]
  8366 00003FA6 50                       push ax
  8367 00003FA7 E8ECC1                   call eqstr
  8368 00003FAA 83C404                   add  sp, 4
  8369 00003FAD 08C0                     or  al, al
  8370 00003FAF 0F840600                 je .getlex480
  8371 00003FB3 B81302                   mov ax, 531
  8372 00003FB6 E9CE01                   jmp .retngetlex
  8373                                  
  8374                                  ;-796     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8375                                  
  8376                                  .getlex480:
  8377 00003FB9 68[A641]                 push getlex_2
  8378 00003FBC 8D062B81                 lea  ax, [symbol]
  8379 00003FC0 50                       push ax
  8380 00003FC1 E8D2C1                   call eqstr
  8381 00003FC4 83C404                   add  sp, 4
  8382 00003FC7 08C0                     or  al, al
  8383 00003FC9 0F840600                 je .getlex481
  8384 00003FCD B81402                   mov ax, 532
  8385 00003FD0 E9B401                   jmp .retngetlex
  8386                                  
  8387                                  ;-797     if (eqstr(symbol,"void"    )) return T_VOID;
  8388                                  
  8389                                  .getlex481:
  8390 00003FD3 68[AF41]                 push getlex_3
  8391 00003FD6 8D062B81                 lea  ax, [symbol]
  8392 00003FDA 50                       push ax
  8393 00003FDB E8B8C1                   call eqstr
  8394 00003FDE 83C404                   add  sp, 4
  8395 00003FE1 08C0                     or  al, al
  8396 00003FE3 0F840600                 je .getlex482
  8397 00003FE7 B81102                   mov ax, 529
  8398 00003FEA E99A01                   jmp .retngetlex
  8399                                  
  8400                                  ;-798     if (eqstr(symbol,"int"     )) return T_INT;
  8401                                  
  8402                                  .getlex482:
  8403 00003FED 68[B441]                 push getlex_4
  8404 00003FF0 8D062B81                 lea  ax, [symbol]
  8405 00003FF4 50                       push ax
  8406 00003FF5 E89EC1                   call eqstr
  8407 00003FF8 83C404                   add  sp, 4
  8408 00003FFB 08C0                     or  al, al
  8409 00003FFD 0F840600                 je .getlex483
  8410 00004001 B80502                   mov ax, 517
  8411 00004004 E98001                   jmp .retngetlex
  8412                                  
  8413                                  ;-799     if (eqstr(symbol,"long"    )) return T_LONG;
  8414                                  
  8415                                  .getlex483:
  8416 00004007 68[B841]                 push getlex_5
  8417 0000400A 8D062B81                 lea  ax, [symbol]
  8418 0000400E 50                       push ax
  8419 0000400F E884C1                   call eqstr
  8420 00004012 83C404                   add  sp, 4
  8421 00004015 08C0                     or  al, al
  8422 00004017 0F840600                 je .getlex484
  8423 0000401B B81502                   mov ax, 533
  8424 0000401E E96601                   jmp .retngetlex
  8425                                  
  8426                                  ;-800     if (eqstr(symbol,"char"    )) return T_CHAR;
  8427                                  
  8428                                  .getlex484:
  8429 00004021 68[BD41]                 push getlex_6
  8430 00004024 8D062B81                 lea  ax, [symbol]
  8431 00004028 50                       push ax
  8432 00004029 E86AC1                   call eqstr
  8433 0000402C 83C404                   add  sp, 4
  8434 0000402F 08C0                     or  al, al
  8435 00004031 0F840600                 je .getlex485
  8436 00004035 B81202                   mov ax, 530
  8437 00004038 E94C01                   jmp .retngetlex
  8438                                  
  8439                                  ;-801     if (eqstr(symbol,"asm"     )) return T_ASM;
  8440                                  
  8441                                  .getlex485:
  8442 0000403B 68[C241]                 push getlex_7
  8443 0000403E 8D062B81                 lea  ax, [symbol]
  8444 00004042 50                       push ax
  8445 00004043 E850C1                   call eqstr
  8446 00004046 83C404                   add  sp, 4
  8447 00004049 08C0                     or  al, al
  8448 0000404B 0F840600                 je .getlex486
  8449 0000404F B80602                   mov ax, 518
  8450 00004052 E93201                   jmp .retngetlex
  8451                                  
  8452                                  ;-802     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8453                                  
  8454                                  .getlex486:
  8455 00004055 68[C641]                 push getlex_8
  8456 00004058 8D062B81                 lea  ax, [symbol]
  8457 0000405C 50                       push ax
  8458 0000405D E836C1                   call eqstr
  8459 00004060 83C404                   add  sp, 4
  8460 00004063 08C0                     or  al, al
  8461 00004065 0F840600                 je .getlex487
  8462 00004069 B80702                   mov ax, 519
  8463 0000406C E91801                   jmp .retngetlex
  8464                                  
  8465                                  ;-803     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8466                                  
  8467                                  .getlex487:
  8468 0000406F 68[CC41]                 push getlex_9
  8469 00004072 8D062B81                 lea  ax, [symbol]
  8470 00004076 50                       push ax
  8471 00004077 E81CC1                   call eqstr
  8472 0000407A 83C404                   add  sp, 4
  8473 0000407D 08C0                     or  al, al
  8474 0000407F 0F840600                 je .getlex488
  8475 00004083 B80802                   mov ax, 520
  8476 00004086 E9FE00                   jmp .retngetlex
  8477                                  
  8478                                  ;-804     if (eqstr(symbol,"return"  )) return T_RETURN;
  8479                                  
  8480                                  .getlex488:
  8481 00004089 68[D541]                 push getlex_10
  8482 0000408C 8D062B81                 lea  ax, [symbol]
  8483 00004090 50                       push ax
  8484 00004091 E802C1                   call eqstr
  8485 00004094 83C404                   add  sp, 4
  8486 00004097 08C0                     or  al, al
  8487 00004099 0F840600                 je .getlex489
  8488 0000409D B80002                   mov ax, 512
  8489 000040A0 E9E400                   jmp .retngetlex
  8490                                  
  8491                                  ;-805     if (eqstr(symbol,"if"      )) return T_IF;
  8492                                  
  8493                                  .getlex489:
  8494 000040A3 68[DC41]                 push getlex_11
  8495 000040A6 8D062B81                 lea  ax, [symbol]
  8496 000040AA 50                       push ax
  8497 000040AB E8E8C0                   call eqstr
  8498 000040AE 83C404                   add  sp, 4
  8499 000040B1 08C0                     or  al, al
  8500 000040B3 0F840600                 je .getlex490
  8501 000040B7 B80102                   mov ax, 513
  8502 000040BA E9CA00                   jmp .retngetlex
  8503                                  
  8504                                  ;-806     if (eqstr(symbol,"else"    )) return T_ELSE;
  8505                                  
  8506                                  .getlex490:
  8507 000040BD 68[DF41]                 push getlex_12
  8508 000040C0 8D062B81                 lea  ax, [symbol]
  8509 000040C4 50                       push ax
  8510 000040C5 E8CEC0                   call eqstr
  8511 000040C8 83C404                   add  sp, 4
  8512 000040CB 08C0                     or  al, al
  8513 000040CD 0F840600                 je .getlex491
  8514 000040D1 B80202                   mov ax, 514
  8515 000040D4 E9B000                   jmp .retngetlex
  8516                                  
  8517                                  ;-807     if (eqstr(symbol,"while"   )) return T_WHILE;
  8518                                  
  8519                                  .getlex491:
  8520 000040D7 68[E441]                 push getlex_13
  8521 000040DA 8D062B81                 lea  ax, [symbol]
  8522 000040DE 50                       push ax
  8523 000040DF E8B4C0                   call eqstr
  8524 000040E2 83C404                   add  sp, 4
  8525 000040E5 08C0                     or  al, al
  8526 000040E7 0F840600                 je .getlex492
  8527 000040EB B80302                   mov ax, 515
  8528 000040EE E99600                   jmp .retngetlex
  8529                                  
  8530                                  ;-808     if (eqstr(symbol,"do"      )) return T_DO;
  8531                                  
  8532                                  .getlex492:
  8533 000040F1 68[EA41]                 push getlex_14
  8534 000040F4 8D062B81                 lea  ax, [symbol]
  8535 000040F8 50                       push ax
  8536 000040F9 E89AC0                   call eqstr
  8537 000040FC 83C404                   add  sp, 4
  8538 000040FF 08C0                     or  al, al
  8539 00004101 0F840600                 je .getlex493
  8540 00004105 B80402                   mov ax, 516
  8541 00004108 E97C00                   jmp .retngetlex
  8542                                  
  8543                                  ;-809     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8544                                  
  8545                                  .getlex493:
  8546 0000410B 68[ED41]                 push getlex_15
  8547 0000410E 8D062B81                 lea  ax, [symbol]
  8548 00004112 50                       push ax
  8549 00004113 E880C0                   call eqstr
  8550 00004116 83C404                   add  sp, 4
  8551 00004119 08C0                     or  al, al
  8552 0000411B 0F840600                 je .getlex494
  8553 0000411F B80902                   mov ax, 521
  8554 00004122 E96200                   jmp .retngetlex
  8555                                  
  8556                                  ;-810     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8557                                  
  8558                                  .getlex494:
  8559 00004125 68[F241]                 push getlex_16
  8560 00004128 8D062B81                 lea  ax, [symbol]
  8561 0000412C 50                       push ax
  8562 0000412D E866C0                   call eqstr
  8563 00004130 83C404                   add  sp, 4
  8564 00004133 08C0                     or  al, al
  8565 00004135 0F840600                 je .getlex495
  8566 00004139 B8FF01                   mov ax, 511
  8567 0000413C E94800                   jmp .retngetlex
  8568                                  
  8569                                  ;-811     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8570                                  
  8571                                  .getlex495:
  8572 0000413F 68[F941]                 push getlex_17
  8573 00004142 8D062B81                 lea  ax, [symbol]
  8574 00004146 50                       push ax
  8575 00004147 E84CC0                   call eqstr
  8576 0000414A 83C404                   add  sp, 4
  8577 0000414D 08C0                     or  al, al
  8578 0000414F 0F840600                 je .getlex496
  8579 00004153 B8FE01                   mov ax, 510
  8580 00004156 E92E00                   jmp .retngetlex
  8581                                  
  8582                                  ;-812     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8583                                  
  8584                                  .getlex496:
  8585 00004159 E8BF00                   call convertdefine
  8586 0000415C 08C0                     or  al, al
  8587 0000415E 0F841600                 je .getlex497
  8588 00004162 8D06DCD0                 lea  ax, [symboltemp]
  8589 00004166 50                       push ax
  8590 00004167 8D062B81                 lea  ax, [symbol]
  8591 0000416B 50                       push ax
  8592 0000416C E8F7BF                   call strcpy
  8593 0000416F 83C404                   add  sp, 4
  8594 00004172 B80101                   mov ax, 257
  8595 00004175 E90F00                   jmp .retngetlex
  8596                                  
  8597                                  ;-813     return T_NAME; } error1("Input item not recognized"); }
  8598                                  
  8599                                  .getlex497:
  8600 00004178 B80001                   mov ax, 256
  8601 0000417B E90900                   jmp .retngetlex
  8602                                  .getlex477:
  8603 0000417E 68[0142]                 push getlex_18
  8604 00004181 E83E06                   call error1
  8605 00004184 83C402                   add  sp, 2
  8606                                  
  8607                                  ;-814 
  8608                                  
  8609                                  
  8610                                  ;-815 int convertdefine() { int i; int j;   i=0;
  8611                                  
  8612 00004187 C9                       .retngetlex: LEAVE
  8613 00004188 C3                       ret
  8614 00004189 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8615 00004192 3A252D3E3C3D2B2126-
  8616 0000419B 7C233F00           
  8617 0000419F 7369676E656400          getlex_1 db "signed",0
  8618 000041A6 756E7369676E656400      getlex_2 db "unsigned",0
  8619 000041AF 766F696400              getlex_3 db "void",0
  8620 000041B4 696E7400                getlex_4 db "int",0
  8621 000041B8 6C6F6E6700              getlex_5 db "long",0
  8622 000041BD 6368617200              getlex_6 db "char",0
  8623 000041C2 61736D00                getlex_7 db "asm",0
  8624 000041C6 5F5F61736D00            getlex_8 db "__asm",0
  8625 000041CC 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8626 000041D5 72657475726E00          getlex_10 db "return",0
  8627 000041DC 696600                  getlex_11 db "if",0
  8628 000041DF 656C736500              getlex_12 db "else",0
  8629 000041E4 7768696C6500            getlex_13 db "while",0
  8630 000041EA 646F00                  getlex_14 db "do",0
  8631 000041ED 676F746F00              getlex_15 db "goto",0
  8632 000041F2 646566696E6500          getlex_16 db "define",0
  8633 000041F9 696E636C75646500        getlex_17 db "include",0
  8634 00004201 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8635 0000420A 6D206E6F7420726563-
  8636 00004213 6F676E697A656400   
  8637                                  ENDP
  8638                                  
  8639                                  convertdefine: PROC
  8640                                  ;Function : convertdefine, Number of local variables: 2
  8641                                  ;   # type sign width addr used name   list of local variables
  8642                                  ;  200 var sign word   815 NULL i = bp-2
  8643                                  ;  201 var sign word   815 NULL j = bp-4;
  8644 0000421B C8040000                 ENTER  4,0
  8645 0000421F B80000                   mov ax, 0
  8646 00004222 8946FE                   mov [bp-2], ax
  8647                                  
  8648                                  ;-816   while (i < GTop) {
  8649                                  
  8650                                  .convertdefine498:
  8651 00004225 8B46FE                   mov ax, [bp-2]
  8652 00004228 3B06[2A00]               cmp ax, [GTop]
  8653 0000422C 0F8D4400                 jge .convertdefine499
  8654                                  
  8655                                  ;-817    j=adrofname(i); 
  8656                                  
  8657 00004230 FF76FE                   push word [bp-2]
  8658 00004233 E89EC6                   call adrofname
  8659 00004236 83C402                   add  sp, 2
  8660 00004239 8946FC                   mov [bp-4], ax
  8661                                  
  8662                                  ;-818    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8663                                  
  8664 0000423C FF76FC                   push word [bp-4]
  8665 0000423F 8D062B81                 lea  ax, [symbol]
  8666 00004243 50                       push ax
  8667 00004244 E84FBF                   call eqstr
  8668 00004247 83C404                   add  sp, 4
  8669 0000424A 08C0                     or  al, al
  8670 0000424C 0F841F00                 je .convertdefine500
  8671 00004250 8B5EFE                   mov bx, [bp-2]
  8672 00004253 8A87B782                 mov al, [GType + bx]
  8673 00004257 3C23                     cmp al, 35
  8674 00004259 0F851200                 jne .convertdefine501
  8675 0000425D 8B5EFE                   mov bx, [bp-2]
  8676 00004260 D1E3                     shl bx, 1
  8677 00004262 8B87EB8A                 mov ax, [GData + bx]
  8678 00004266 A3[2E00]                 mov word [lexval], ax
  8679                                  
  8680                                  ;-819    return T_CONST; } }
  8681                                  
  8682 00004269 B80101                   mov ax, 257
  8683 0000426C E90B00                   jmp .retnconvertdefine
  8684                                  .convertdefine501:
  8685                                  
  8686                                  ;-820    i++; } 
  8687                                  
  8688                                  .convertdefine500:
  8689 0000426F FF46FE                   inc  word[bp-2]
  8690                                  
  8691                                  ;-821    return 0; }
  8692                                  
  8693 00004272 EBB1                     jmp .convertdefine498
  8694                                  .convertdefine499:
  8695 00004274 B80000                   mov ax, 0
  8696 00004277 E90000                   jmp .retnconvertdefine
  8697                                  
  8698                                  ;-822 int getdigit(char c) { int i;
  8699                                  
  8700 0000427A C9                       .retnconvertdefine: LEAVE
  8701 0000427B C3                       ret
  8702                                  ENDP
  8703                                  
  8704                                  getdigit: PROC
  8705                                  
  8706                                  ;-823     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8707                                  
  8708                                  ;Function : getdigit, Number of local variables: 2
  8709                                  ;   # type sign width addr used name   list of local variables
  8710                                  ;  200 var sign byte   822 NULL c = bp+4
  8711                                  ;  201 var sign word   822 NULL i = bp-2;
  8712 0000427C C8020000                 ENTER  2,0
  8713 00004280 B80000                   mov ax, 0
  8714 00004283 A3[2E00]                 mov word [lexval], ax
  8715 00004286 8A4604                   mov al, [bp+4]
  8716 00004289 2C30                     sub al, 48
  8717 0000428B A3[2E00]                 mov word [lexval], ax
  8718                                  
  8719                                  ;-824     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8720                                  
  8721 0000428E A0[2100]                 mov al, [thechar]
  8722 00004291 3C78                     cmp al, 120
  8723 00004293 0F850600                 jne .getdigit502
  8724 00004297 B85800                   mov ax, 88
  8725 0000429A A2[2100]                 mov byte [thechar], al
  8726                                  .getdigit502:
  8727 0000429D A0[2100]                 mov al, [thechar]
  8728 000042A0 3C58                     cmp al, 88
  8729 000042A2 0F856800                 jne .getdigit503
  8730 000042A6 E8E000                   call next
  8731                                  
  8732                                  ;-825       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8733                                  
  8734                                  .getdigit504:
  8735 000042A9 A0[2100]                 mov al, byte [thechar]
  8736 000042AC B400                     mov ah, 0
  8737 000042AE 50                       push ax
  8738 000042AF E872C0                   call alnum
  8739 000042B2 83C402                   add  sp, 2
  8740 000042B5 08C0                     or  al, al
  8741 000042B7 0F845000                 je .getdigit505
  8742 000042BB E8CB00                   call next
  8743 000042BE 884604                   mov [bp+4], al
  8744 000042C1 8A4604                   mov al, [bp+4]
  8745 000042C4 3C60                     cmp al, 96
  8746 000042C6 0F8E0800                 jle .getdigit506
  8747 000042CA 8A4604                   mov al, [bp+4]
  8748 000042CD 2C27                     sub al, 39
  8749 000042CF 884604                   mov [bp+4], al
  8750                                  
  8751                                  ;-826 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8752                                  
  8753                                  .getdigit506:
  8754 000042D2 8A4604                   mov al, [bp+4]
  8755 000042D5 3C40                     cmp al, 64
  8756 000042D7 0F8E0800                 jle .getdigit507
  8757 000042DB 8A4604                   mov al, [bp+4]
  8758 000042DE 2C07                     sub al, 7
  8759 000042E0 884604                   mov [bp+4], al
  8760                                  .getdigit507:
  8761 000042E3 8A4604                   mov al, [bp+4]
  8762 000042E6 2C30                     sub al, 48
  8763 000042E8 884604                   mov [bp+4], al
  8764 000042EB A1[2E00]                 mov ax, [lexval]
  8765 000042EE C1E004                   shl ax, 4
  8766 000042F1 A3[2E00]                 mov word [lexval], ax
  8767                                  
  8768                                  ;-827      i=0; i=c; lexval=lexval+i;}
  8769                                  
  8770 000042F4 B80000                   mov ax, 0
  8771 000042F7 8946FE                   mov [bp-2], ax
  8772 000042FA 8A4604                   mov al, [bp+4]
  8773 000042FD 8946FE                   mov [bp-2], ax
  8774 00004300 A1[2E00]                 mov ax, [lexval]
  8775 00004303 0346FE                   add ax, [bp-2]
  8776 00004306 A3[2E00]                 mov word [lexval], ax
  8777                                  
  8778                                  ;-828     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8779                                  
  8780 00004309 EB9E                     jmp .getdigit504
  8781                                  .getdigit505:
  8782 0000430B E94200                   jmp .getdigit508
  8783                                  .getdigit503:
  8784                                  .getdigit509:
  8785 0000430E A0[2100]                 mov al, byte [thechar]
  8786 00004311 B400                     mov ah, 0
  8787 00004313 50                       push ax
  8788 00004314 E865BF                   call digit
  8789 00004317 83C402                   add  sp, 2
  8790 0000431A 08C0                     or  al, al
  8791 0000431C 0F843000                 je .getdigit510
  8792 00004320 E86600                   call next
  8793 00004323 884604                   mov [bp+4], al
  8794 00004326 8A4604                   mov al, [bp+4]
  8795 00004329 2C30                     sub al, 48
  8796 0000432B 884604                   mov [bp+4], al
  8797 0000432E A1[2E00]                 mov ax, [lexval]
  8798 00004331 BB0A00                   mov bx, 10
  8799 00004334 F7E3                     mul bx
  8800 00004336 A3[2E00]                 mov word [lexval], ax
  8801                                  
  8802                                  ;-829      i=0; i=c; lexval=lexval+i; } } 
  8803                                  
  8804 00004339 B80000                   mov ax, 0
  8805 0000433C 8946FE                   mov [bp-2], ax
  8806 0000433F 8A4604                   mov al, [bp+4]
  8807 00004342 8946FE                   mov [bp-2], ax
  8808 00004345 A1[2E00]                 mov ax, [lexval]
  8809 00004348 0346FE                   add ax, [bp-2]
  8810 0000434B A3[2E00]                 mov word [lexval], ax
  8811 0000434E EBBE                     jmp .getdigit509
  8812                                  .getdigit510:
  8813                                  
  8814                                  ;-830 }
  8815                                  
  8816                                  .getdigit508:
  8817                                  
  8818                                  ;-831 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8819 00004350 C9                       LEAVE
  8820 00004351 C3                       ret
  8821                                  ENDP
  8822                                  
  8823                                  getstring: PROC
  8824                                  ;Function : getstring, Number of local variables: 3
  8825                                  ;   # type sign width addr used name   list of local variables
  8826                                  ;  200 var sign word   831 NULL delim = bp+4
  8827                                  ;  201 var sign word   831 NULL c = bp-2
  8828                                  ;  202 ptr sign byte   831 NULL p = bp-4;
  8829 00004352 C8040000                 ENTER  4,0
  8830 00004356 B82B81                   mov ax, symbol
  8831 00004359 8946FC                   mov [bp-4], ax
  8832 0000435C E82A00                   call next
  8833 0000435F 8946FE                   mov [bp-2], ax
  8834                                  
  8835                                  ;-832   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8836                                  
  8837                                  .getstring511:
  8838 00004362 8B46FE                   mov ax, [bp-2]
  8839 00004365 3B4604                   cmp ax, [bp+4]
  8840 00004368 0F841300                 je  .getstring512
  8841 0000436C 8B46FE                   mov ax, [bp-2]
  8842 0000436F 8B5EFC                   mov  bx, [bp-4]
  8843 00004372 8807                     mov  [bx], al
  8844 00004374 FF46FC                   inc  word[bp-4]
  8845 00004377 E80F00                   call next
  8846 0000437A 8946FE                   mov [bp-2], ax
  8847 0000437D EBE3                     jmp .getstring511
  8848                                  .getstring512:
  8849 0000437F B80000                   mov ax, 0
  8850 00004382 8B5EFC                   mov  bx, [bp-4]
  8851 00004385 8807                     mov  [bx], al
  8852                                  
  8853                                  ;-833 
  8854                                  
  8855                                  
  8856                                  ;-834 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8857 00004387 C9                       LEAVE
  8858 00004388 C3                       ret
  8859                                  ENDP
  8860                                  
  8861                                  next: PROC
  8862                                  ;Function : next, Number of local variables: 1
  8863                                  ;   # type sign width addr used name   list of local variables
  8864                                  ;  200 var sign byte   834 NULL r = bp-2;
  8865 00004389 C8020000                 ENTER  2,0
  8866 0000438D A0[2100]                 mov al, [thechar]
  8867 00004390 8846FE                   mov [bp-2], al
  8868 00004393 8A46FE                   mov al, [bp-2]
  8869 00004396 A2[1E00]                 mov byte [globC], al
  8870 00004399 E82E03                   call fgets1
  8871 0000439C A2[2100]                 mov byte [thechar], al
  8872 0000439F 8A46FE                   mov al, [bp-2]
  8873 000043A2 E90000                   jmp .retnnext
  8874                                  
  8875                                  ;-835 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8876                                  
  8877 000043A5 C9                       .retnnext: LEAVE
  8878 000043A6 C3                       ret
  8879                                  ENDP
  8880                                  
  8881                                  istoken: PROC
  8882                                  ;Function : istoken, Number of local variables: 1
  8883                                  ;   # type sign width addr used name   list of local variables
  8884                                  ;  200 var sign word   835 NULL t = bp+4;
  8885 000043A7 C8000000                 ENTER  0,0
  8886 000043AB A1[1C00]                 mov ax, [token]
  8887 000043AE 3B4604                   cmp ax, [bp+4]
  8888 000043B1 0F850C00                 jne .istoken513
  8889 000043B5 E8CBF8                   call getlex
  8890 000043B8 A3[1C00]                 mov word [token], ax
  8891 000043BB B80100                   mov ax, 1
  8892 000043BE E90600                   jmp .retnistoken
  8893                                  .istoken513:
  8894 000043C1 B80000                   mov ax, 0
  8895 000043C4 E90000                   jmp .retnistoken
  8896                                  
  8897                                  ;-836 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8898                                  
  8899 000043C7 C9                       .retnistoken: LEAVE
  8900 000043C8 C3                       ret
  8901                                  ENDP
  8902                                  
  8903                                  expect: PROC
  8904                                  ;Function : expect, Number of local variables: 1
  8905                                  ;   # type sign width addr used name   list of local variables
  8906                                  ;  200 var sign word   836 NULL t = bp+4;
  8907 000043C9 C8000000                 ENTER  0,0
  8908 000043CD FF7604                   push word [bp+4]
  8909 000043D0 E8D4FF                   call istoken
  8910 000043D3 83C402                   add  sp, 2
  8911 000043D6 83F800                   cmp ax, 0
  8912 000043D9 0F853200                 jne .expect514
  8913 000043DD B80000                   mov ax, 0
  8914 000043E0 8B1E[1600]               mov  bx, [cloc]
  8915 000043E4 8807                     mov  [bx], al
  8916 000043E6 8D063075                 lea  ax, [co]
  8917 000043EA 50                       push ax
  8918 000043EB E8EE00                   call prs
  8919 000043EE 83C402                   add  sp, 2
  8920 000043F1 E8D004                   call listproc
  8921                                  
  8922                                  ;-837   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8923                                  
  8924 000043F4 68[1144]                 push expect_0
  8925 000043F7 E8E200                   call prs
  8926 000043FA 83C402                   add  sp, 2
  8927 000043FD FF7604                   push word [bp+4]
  8928 00004400 E8D001                   call pint1
  8929 00004403 83C402                   add  sp, 2
  8930 00004406 68[2944]                 push expect_1
  8931 00004409 E8B603                   call error1
  8932 0000440C 83C402                   add  sp, 2
  8933                                  .expect514:
  8934                                  
  8935                                  ;-838 
  8936                                  
  8937                                  
  8938                                  ;-839 int eprc(char c)  {*cloc=c; cloc++; }
  8939 0000440F C9                       LEAVE
  8940 00004410 C3                       ret
  8941 00004411 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8942 0000441A 642041534349492864-
  8943 00004423 657A293A2000       
  8944 00004429 206E6F7420666F756E-     expect_1 db " not found",0
  8945 00004432 6400               
  8946                                  ENDP
  8947                                  
  8948                                  eprc: PROC
  8949                                  ;Function : eprc, Number of local variables: 1
  8950                                  ;   # type sign width addr used name   list of local variables
  8951                                  ;  200 var sign byte   839 NULL c = bp+4;
  8952 00004434 C8000000                 ENTER  0,0
  8953 00004438 8A4604                   mov al, [bp+4]
  8954 0000443B 8B1E[1600]               mov  bx, [cloc]
  8955 0000443F 8807                     mov  [bx], al
  8956 00004441 FF06[1600]               inc  word[cloc]
  8957                                  
  8958                                  ;-840 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8959 00004445 C9                       LEAVE
  8960 00004446 C3                       ret
  8961                                  ENDP
  8962                                  
  8963                                  eprs: PROC
  8964                                  ;Function : eprs, Number of local variables: 2
  8965                                  ;   # type sign width addr used name   list of local variables
  8966                                  ;  200 ptr sign byte   840 NULL s = bp+4
  8967                                  ;  201 var sign byte   840 NULL c = bp-2;
  8968 00004447 C8020000                 ENTER  2,0
  8969                                  .eprs515:
  8970 0000444B 8B5E04                   mov bx, [bp+4]
  8971 0000444E 8A07                     mov al, [bx]
  8972 00004450 B400                     mov ah, 0
  8973 00004452 08C0                     or  al, al
  8974 00004454 0F841B00                 je .eprs516
  8975 00004458 8B5E04                   mov bx, [bp+4]
  8976 0000445B 8A07                     mov al, [bx]
  8977 0000445D B400                     mov ah, 0
  8978 0000445F 8846FE                   mov [bp-2], al
  8979 00004462 8A46FE                   mov al, byte [bp-2]
  8980 00004465 B400                     mov ah, 0
  8981 00004467 50                       push ax
  8982 00004468 E8C9FF                   call eprc
  8983 0000446B 83C402                   add  sp, 2
  8984 0000446E FF4604                   inc  word[bp+4]
  8985 00004471 EBD8                     jmp .eprs515
  8986                                  .eprs516:
  8987                                  
  8988                                  ;-841 int prc(unsigned char c) { 
  8989 00004473 C9                       LEAVE
  8990 00004474 C3                       ret
  8991                                  ENDP
  8992                                  
  8993                                  prc: PROC
  8994                                  
  8995                                  ;-842   if (c==10) {_AX=13; writetty(); }
  8996                                  
  8997                                  ;Function : prc, Number of local variables: 1
  8998                                  ;   # type sign width addr used name   list of local variables
  8999                                  ;  200 var unsg byte   841 NULL c = bp+4;
  9000 00004475 C8000000                 ENTER  0,0
  9001 00004479 8A4604                   mov al, [bp+4]
  9002 0000447C 3C0A                     cmp al, 10
  9003 0000447E 0F850600                 jne .prc517
  9004 00004482 B80D00                   mov  ax, 13
  9005 00004485 E8EBBB                   call writetty
  9006                                  
  9007                                  ;-843   _AL=c; writetty(); 
  9008                                  
  9009                                  .prc517:
  9010 00004488 8A4604                   mov  al, [bp+4]
  9011 0000448B E8E5BB                   call writetty
  9012                                  
  9013                                  ;-844   fputcR(c, fdout); 
  9014                                  
  9015 0000448E FF36[1A00]               push word [fdout]
  9016 00004492 8A4604                   mov al, byte [bp+4]
  9017 00004495 B400                     mov ah, 0
  9018 00004497 50                       push ax
  9019 00004498 E88EBC                   call fputcR
  9020 0000449B 83C404                   add  sp, 4
  9021                                  
  9022                                  ;-845   }
  9023                                  
  9024                                  
  9025                                  ;-846 int prscomment(unsigned char *s) {unsigned char c;
  9026 0000449E C9                       LEAVE
  9027 0000449F C3                       ret
  9028                                  ENDP
  9029                                  
  9030                                  prscomment: PROC
  9031                                  
  9032                                  ;-847   while(*s){c=*s;prc(c);s++;} }
  9033                                  
  9034                                  ;Function : prscomment, Number of local variables: 2
  9035                                  ;   # type sign width addr used name   list of local variables
  9036                                  ;  200 ptr unsg byte   846 NULL s = bp+4
  9037                                  ;  201 var unsg byte   846 NULL c = bp-2;
  9038 000044A0 C8020000                 ENTER  2,0
  9039                                  .prscomment518:
  9040 000044A4 8B5E04                   mov bx, [bp+4]
  9041 000044A7 8A07                     mov al, [bx]
  9042 000044A9 B400                     mov ah, 0
  9043 000044AB 08C0                     or  al, al
  9044 000044AD 0F841B00                 je .prscomment519
  9045 000044B1 8B5E04                   mov bx, [bp+4]
  9046 000044B4 8A07                     mov al, [bx]
  9047 000044B6 B400                     mov ah, 0
  9048 000044B8 8846FE                   mov [bp-2], al
  9049 000044BB 8A46FE                   mov al, byte [bp-2]
  9050 000044BE B400                     mov ah, 0
  9051 000044C0 50                       push ax
  9052 000044C1 E8B1FF                   call prc
  9053 000044C4 83C402                   add  sp, 2
  9054 000044C7 FF4604                   inc  word[bp+4]
  9055 000044CA EBD8                     jmp .prscomment518
  9056                                  .prscomment519:
  9057                                  
  9058                                  ;-848 int prnl() { prs("\n ");}
  9059 000044CC C9                       LEAVE
  9060 000044CD C3                       ret
  9061                                  ENDP
  9062                                  
  9063                                  prnl: PROC
  9064 000044CE 68[D844]                 push prnl_0
  9065 000044D1 E80800                   call prs
  9066 000044D4 83C402                   add  sp, 2
  9067                                  
  9068                                  ;-849 
  9069                                  
  9070                                  
  9071                                  ;-850 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9072                                  
  9073 000044D7 C3                       ret
  9074 000044D8 5C6E2000                prnl_0 db "\n ",0
  9075                                  ENDP
  9076                                  
  9077                                  prs: PROC
  9078                                  ;Function : prs, Number of local variables: 3
  9079                                  ;   # type sign width addr used name   list of local variables
  9080                                  ;  200 ptr unsg byte   850 NULL s = bp+4
  9081                                  ;  201 var unsg byte   850 NULL c = bp-2
  9082                                  ;  202 var sign word   850 NULL com = bp-4;
  9083 000044DC C8040000                 ENTER  4,0
  9084 000044E0 B80000                   mov ax, 0
  9085 000044E3 8946FC                   mov [bp-4], ax
  9086                                  
  9087                                  ;-851   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9088                                  
  9089                                  .prs520:
  9090 000044E6 8B5E04                   mov bx, [bp+4]
  9091 000044E9 8A07                     mov al, [bx]
  9092 000044EB B400                     mov ah, 0
  9093 000044ED 08C0                     or  al, al
  9094 000044EF 0F847B00                 je .prs521
  9095 000044F3 8B5E04                   mov bx, [bp+4]
  9096 000044F6 8A07                     mov al, [bx]
  9097 000044F8 B400                     mov ah, 0
  9098 000044FA 8846FE                   mov [bp-2], al
  9099 000044FD 8A46FE                   mov al, [bp-2]
  9100 00004500 3C22                     cmp al, 34
  9101 00004502 0F851800                 jne .prs522
  9102 00004506 8B46FC                   mov ax, [bp-4]
  9103 00004509 08C0                     or  al, al
  9104 0000450B 0F840900                 je .prs523
  9105 0000450F B80000                   mov ax, 0
  9106 00004512 8946FC                   mov [bp-4], ax
  9107 00004515 E90600                   jmp .prs524
  9108                                  .prs523:
  9109 00004518 B80100                   mov ax, 1
  9110 0000451B 8946FC                   mov [bp-4], ax
  9111                                  
  9112                                  ;-852     if (c==92) { if (com==0) { s++; c=*s;
  9113                                  
  9114                                  .prs524:
  9115                                  .prs522:
  9116 0000451E 8A46FE                   mov al, [bp-2]
  9117 00004521 3C5C                     cmp al, 92
  9118 00004523 0F853500                 jne .prs525
  9119 00004527 8B46FC                   mov ax, [bp-4]
  9120 0000452A 83F800                   cmp ax, 0
  9121 0000452D 0F852B00                 jne .prs526
  9122 00004531 FF4604                   inc  word[bp+4]
  9123 00004534 8B5E04                   mov bx, [bp+4]
  9124 00004537 8A07                     mov al, [bx]
  9125 00004539 B400                     mov ah, 0
  9126 0000453B 8846FE                   mov [bp-2], al
  9127                                  
  9128                                  ;-853           if (c=='n') c=10; if (c=='t') c= 9;
  9129                                  
  9130 0000453E 8A46FE                   mov al, [bp-2]
  9131 00004541 3C6E                     cmp al, 110
  9132 00004543 0F850600                 jne .prs527
  9133 00004547 B80A00                   mov ax, 10
  9134 0000454A 8846FE                   mov [bp-2], al
  9135                                  .prs527:
  9136 0000454D 8A46FE                   mov al, [bp-2]
  9137 00004550 3C74                     cmp al, 116
  9138 00004552 0F850600                 jne .prs528
  9139 00004556 B80900                   mov ax, 9
  9140 00004559 8846FE                   mov [bp-2], al
  9141                                  
  9142                                  ;-854     } } prc(c); s++;  } }
  9143                                  
  9144                                  .prs528:
  9145                                  .prs526:
  9146                                  .prs525:
  9147 0000455C 8A46FE                   mov al, byte [bp-2]
  9148 0000455F B400                     mov ah, 0
  9149 00004561 50                       push ax
  9150 00004562 E810FF                   call prc
  9151 00004565 83C402                   add  sp, 2
  9152 00004568 FF4604                   inc  word[bp+4]
  9153 0000456B E978FF                   jmp .prs520
  9154                                  .prs521:
  9155                                  
  9156                                  ;-855 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9157 0000456E C9                       LEAVE
  9158 0000456F C3                       ret
  9159                                  ENDP
  9160                                  
  9161                                  eprnum: PROC
  9162                                  ;Function : eprnum, Number of local variables: 2
  9163                                  ;   # type sign width addr used name   list of local variables
  9164                                  ;  200 var sign word   855 NULL n = bp+4
  9165                                  ;  201 var sign word   855 NULL e = bp-2;
  9166 00004570 C8020000                 ENTER  2,0
  9167 00004574 8B4604                   mov ax, [bp+4]
  9168 00004577 83F800                   cmp ax, 0
  9169 0000457A 0F8D1400                 jge .eprnum529
  9170 0000457E 6A2D                     push 45
  9171 00004580 E8B1FE                   call eprc
  9172 00004583 83C402                   add  sp, 2
  9173 00004586 FF7604                   push word [bp+4]
  9174 00004589 E836BB                   call mkneg
  9175 0000458C 83C402                   add  sp, 2
  9176 0000458F 894604                   mov [bp+4], ax
  9177                                  
  9178                                  ;-856   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9179                                  
  9180                                  .eprnum529:
  9181 00004592 8B4604                   mov ax, [bp+4]
  9182 00004595 83F80A                   cmp ax, 10 ;unsigned : 1
  9183 00004598 0F8C1500                 jl  .eprnum530
  9184 0000459C 8B4604                   mov ax, [bp+4]
  9185 0000459F BB0A00                   mov bx, 10
  9186 000045A2 99                       cwd
  9187 000045A3 F7FB                     idiv bx
  9188 000045A5 8946FE                   mov [bp-2], ax
  9189 000045A8 FF76FE                   push word [bp-2]
  9190 000045AB E8C2FF                   call eprnum
  9191 000045AE 83C402                   add  sp, 2
  9192                                  .eprnum530:
  9193 000045B1 8B4604                   mov ax, [bp+4]
  9194 000045B4 BB0A00                   mov bx, 10
  9195 000045B7 99                       cwd
  9196 000045B8 F7FB                     idiv bx
  9197 000045BA 89D0                     mov ax, dx
  9198 000045BC 894604                   mov [bp+4], ax
  9199 000045BF 8B4604                   mov ax, [bp+4]
  9200 000045C2 83C030                   add ax, 48
  9201 000045C5 894604                   mov [bp+4], ax
  9202 000045C8 FF7604                   push word [bp+4]
  9203 000045CB E866FE                   call eprc
  9204 000045CE 83C402                   add  sp, 2
  9205                                  
  9206                                  ;-857 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9207 000045D1 C9                       LEAVE
  9208 000045D2 C3                       ret
  9209                                  ENDP
  9210                                  
  9211                                  pint1: PROC
  9212                                  ;Function : pint1, Number of local variables: 2
  9213                                  ;   # type sign width addr used name   list of local variables
  9214                                  ;  200 var sign word   857 NULL n = bp+4
  9215                                  ;  201 var sign word   857 NULL e = bp-2;
  9216 000045D3 C8020000                 ENTER  2,0
  9217 000045D7 8B4604                   mov ax, [bp+4]
  9218 000045DA 83F800                   cmp ax, 0
  9219 000045DD 0F8D1400                 jge .pint1531
  9220 000045E1 6A2D                     push 45
  9221 000045E3 E88FFE                   call prc
  9222 000045E6 83C402                   add  sp, 2
  9223 000045E9 FF7604                   push word [bp+4]
  9224 000045EC E8D3BA                   call mkneg
  9225 000045EF 83C402                   add  sp, 2
  9226 000045F2 894604                   mov [bp+4], ax
  9227                                  
  9228                                  ;-858   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }  
  9229                                  
  9230                                  .pint1531:
  9231 000045F5 8B4604                   mov ax, [bp+4]
  9232 000045F8 83F80A                   cmp ax, 10 ;unsigned : 1
  9233 000045FB 0F8C1500                 jl  .pint1532
  9234 000045FF 8B4604                   mov ax, [bp+4]
  9235 00004602 BB0A00                   mov bx, 10
  9236 00004605 99                       cwd
  9237 00004606 F7FB                     idiv bx
  9238 00004608 8946FE                   mov [bp-2], ax
  9239 0000460B FF76FE                   push word [bp-2]
  9240 0000460E E8C2FF                   call pint1
  9241 00004611 83C402                   add  sp, 2
  9242                                  .pint1532:
  9243 00004614 8B4604                   mov ax, [bp+4]
  9244 00004617 BB0A00                   mov bx, 10
  9245 0000461A 99                       cwd
  9246 0000461B F7FB                     idiv bx
  9247 0000461D 89D0                     mov ax, dx
  9248 0000461F 894604                   mov [bp+4], ax
  9249 00004622 83460430                 add  word[bp+4], 48
  9250 00004626 FF7604                   push word [bp+4]
  9251 00004629 E849FE                   call prc
  9252 0000462C 83C402                   add  sp, 2
  9253                                  
  9254                                  ;-859 int prunsign1(unsigned int n) { unsigned int e;
  9255 0000462F C9                       LEAVE
  9256 00004630 C3                       ret
  9257                                  ENDP
  9258                                  
  9259                                  prunsign1: PROC
  9260                                  
  9261                                  ;-860   if ( _ n >= 10) {  e=n/10; prunsign1(e); }
  9262                                  
  9263                                  ;Function : prunsign1, Number of local variables: 2
  9264                                  ;   # type sign width addr used name   list of local variables
  9265                                  ;  200 var unsg word   859 NULL n = bp+4
  9266                                  ;  201 var unsg word   859 NULL e = bp-2;
  9267 00004631 C8020000                 ENTER  2,0 ; constant expression
  9268 00004635 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9269 00004639 0F821700                 jb  .prunsign1533
  9270 0000463D 8B4604                   mov ax, [bp+4]
  9271 00004640 BB0A00                   mov bx, 10
  9272 00004643 BA0000                   mov dx, 0
  9273 00004646 F7F3                     div bx
  9274 00004648 8946FE                   mov [bp-2], ax
  9275 0000464B FF76FE                   push word [bp-2]
  9276 0000464E E8E0FF                   call prunsign1
  9277 00004651 83C402                   add  sp, 2
  9278                                  
  9279                                  ;-861     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }  
  9280                                  
  9281                                  .prunsign1533:
  9282 00004654 8B4604                   mov ax, [bp+4]
  9283 00004657 BB0A00                   mov bx, 10
  9284 0000465A BA0000                   mov dx, 0
  9285 0000465D F7F3                     div bx
  9286 0000465F 89D0                     mov ax, dx
  9287 00004661 894604                   mov [bp+4], ax
  9288 00004664 83460430                 add  word[bp+4], 48
  9289 00004668 FF7604                   push word [bp+4]
  9290 0000466B E807FE                   call prc
  9291 0000466E 83C402                   add  sp, 2
  9292                                  
  9293                                  ;-862 int printint51(unsigned int j)  {
  9294 00004671 C9                       LEAVE
  9295 00004672 C3                       ret
  9296                                  ENDP
  9297                                  
  9298                                  printint51: PROC
  9299                                  
  9300                                  ;-863   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9301                                  
  9302                                  ;Function : printint51, Number of local variables: 1
  9303                                  ;   # type sign width addr used name   list of local variables
  9304                                  ;  200 var unsg word   862 NULL j = bp+4;
  9305 00004673 C8000000                 ENTER  0,0
  9306 00004677 8B4604                   mov ax, [bp+4]
  9307 0000467A 3D1027                   cmp ax, 10000
  9308 0000467D 0F8D0800                 jge .printint51534
  9309 00004681 6A20                     push 32
  9310 00004683 E8EFFD                   call prc
  9311 00004686 83C402                   add  sp, 2
  9312                                  .printint51534:
  9313 00004689 8B4604                   mov ax, [bp+4]
  9314 0000468C 3DE803                   cmp ax, 1000
  9315 0000468F 0F8D0800                 jge .printint51535
  9316 00004693 6A20                     push 32
  9317 00004695 E8DDFD                   call prc
  9318 00004698 83C402                   add  sp, 2
  9319                                  .printint51535:
  9320 0000469B 8B4604                   mov ax, [bp+4]
  9321 0000469E 83F864                   cmp ax, 100
  9322 000046A1 0F8D0800                 jge .printint51536
  9323 000046A5 6A20                     push 32
  9324 000046A7 E8CBFD                   call prc
  9325 000046AA 83C402                   add  sp, 2
  9326                                  
  9327                                  ;-864    if (j<10) prc(32);  prunsign1(j); }
  9328                                  
  9329                                  .printint51536:
  9330 000046AD 8B4604                   mov ax, [bp+4]
  9331 000046B0 83F80A                   cmp ax, 10
  9332 000046B3 0F8D0800                 jge .printint51537
  9333 000046B7 6A20                     push 32
  9334 000046B9 E8B9FD                   call prc
  9335 000046BC 83C402                   add  sp, 2
  9336                                  .printint51537:
  9337 000046BF FF7604                   push word [bp+4]
  9338 000046C2 E86CFF                   call prunsign1
  9339 000046C5 83C402                   add  sp, 2
  9340                                  
  9341                                  ;-865 
  9342                                  
  9343                                  
  9344                                  ;-866 int fgets1() { char c; c=*fgetsp;
  9345 000046C8 C9                       LEAVE
  9346 000046C9 C3                       ret
  9347                                  ENDP
  9348                                  
  9349                                  fgets1: PROC
  9350                                  ;Function : fgets1, Number of local variables: 1
  9351                                  ;   # type sign width addr used name   list of local variables
  9352                                  ;  200 var sign byte   866 NULL c = bp-2;
  9353 000046CA C8020000                 ENTER  2,0
  9354 000046CE 8B1E[6200]               mov bx, [fgetsp]
  9355 000046D2 8A07                     mov al, [bx]
  9356 000046D4 B400                     mov ah, 0
  9357 000046D6 8846FE                   mov [bp-2], al
  9358                                  
  9359                                  ;-867   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9360                                  
  9361 000046D9 8A46FE                   mov al, [bp-2]
  9362 000046DC 3C00                     cmp al, 0
  9363 000046DE 0F852A00                 jne .fgets1538
  9364 000046E2 E83700                   call printinputline
  9365 000046E5 A1[7000]                 mov ax, [DOS_NoBytes]
  9366 000046E8 83F800                   cmp ax, 0
  9367 000046EB 0F850600                 jne .fgets1539
  9368 000046EF B80000                   mov ax, 0
  9369 000046F2 E92500                   jmp .retnfgets1
  9370                                  
  9371                                  ;-868     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9372                                  
  9373                                  .fgets1539:
  9374 000046F5 B80FD0                   mov ax, fgetsdest
  9375 000046F8 A3[6200]                 mov word [fgetsp], ax
  9376 000046FB 8B1E[6200]               mov bx, [fgetsp]
  9377 000046FF 8A07                     mov al, [bx]
  9378 00004701 B400                     mov ah, 0
  9379 00004703 8846FE                   mov [bp-2], al
  9380 00004706 B80000                   mov ax, 0
  9381 00004709 A3[1F00]                 mov word [spalte], ax
  9382                                  
  9383                                  ;-869   fgetsp++; spalte++;  return c; }
  9384                                  
  9385                                  .fgets1538:
  9386 0000470C FF06[6200]               inc  word[fgetsp]
  9387 00004710 FF06[1F00]               inc  word[spalte]
  9388 00004714 8A46FE                   mov al, [bp-2]
  9389 00004717 E90000                   jmp .retnfgets1
  9390                                  
  9391                                  ;-870 int printinputline() { fgetsp=&fgetsdest;
  9392                                  
  9393 0000471A C9                       .retnfgets1: LEAVE
  9394 0000471B C3                       ret
  9395                                  ENDP
  9396                                  
  9397                                  printinputline: PROC
  9398 0000471C B80FD0                   mov ax, fgetsdest
  9399 0000471F A3[6200]                 mov word [fgetsp], ax
  9400                                  
  9401                                  ;-871   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9402                                  
  9403                                  .printinputline540:
  9404 00004722 6A01                     push 1
  9405 00004724 FF36[1800]               push word [fdin]
  9406 00004728 8D06[7200]               lea  ax, [DOS_ByteRead]
  9407 0000472C 50                       push ax
  9408 0000472D E8E4B9                   call readRL
  9409 00004730 83C406                   add  sp, 6
  9410 00004733 A3[7000]                 mov word [DOS_NoBytes], ax
  9411                                  
  9412                                  ;-872   if (DOS_NoBytes == 0) return; 
  9413                                  
  9414 00004736 A1[7000]                 mov ax, [DOS_NoBytes]
  9415 00004739 83F800                   cmp ax, 0
  9416 0000473C 0F850300                 jne .printinputline541
  9417 00004740 E95400                   jmp .retnprintinputline
  9418                                  
  9419                                  ;-873     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9420                                  
  9421                                  .printinputline541:
  9422 00004743 A0[7200]                 mov al, [DOS_ByteRead]
  9423 00004746 8B1E[6200]               mov  bx, [fgetsp]
  9424 0000474A 8807                     mov  [bx], al
  9425 0000474C FF06[6200]               inc  word[fgetsp]
  9426                                  
  9427                                  ;-874   while (DOS_ByteRead != 10); *fgetsp=0;
  9428                                  
  9429 00004750 A0[7200]                 mov al, [DOS_ByteRead]
  9430 00004753 3C0A                     cmp al, 10
  9431 00004755 0F840200                 je  .printinputline542
  9432 00004759 EBC7                     jmp .printinputline540
  9433                                  .printinputline542:
  9434 0000475B B80000                   mov ax, 0
  9435 0000475E 8B1E[6200]               mov  bx, [fgetsp]
  9436 00004762 8807                     mov  [bx], al
  9437                                  
  9438                                  ;-875     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9439                                  
  9440 00004764 A1[1A00]                 mov ax, [fdout]
  9441 00004767 08C0                     or  al, al
  9442 00004769 0F842A00                 je .printinputline543
  9443 0000476D 68[9847]                 push printinputline_0
  9444 00004770 E869FD                   call prs
  9445 00004773 83C402                   add  sp, 2
  9446 00004776 FF36[6600]               push word [lineno]
  9447 0000477A E8B4FE                   call prunsign1
  9448 0000477D 83C402                   add  sp, 2
  9449 00004780 6A20                     push 32
  9450 00004782 E8F0FC                   call prc
  9451 00004785 83C402                   add  sp, 2
  9452 00004788 FF06[6600]               inc  word[lineno]
  9453                                  
  9454                                  ;-876       prscomment(&fgetsdest);}
  9455                                  
  9456 0000478C 8D060FD0                 lea  ax, [fgetsdest]
  9457 00004790 50                       push ax
  9458 00004791 E80CFD                   call prscomment
  9459 00004794 83C402                   add  sp, 2
  9460                                  
  9461                                  ;-877 }
  9462                                  
  9463                                  .printinputline543:
  9464                                  
  9465                                  ;-878 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9466                                  
  9467                                   .retnprintinputline:
  9468 00004797 C3                       ret
  9469 00004798 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9470                                  ENDP
  9471                                  
  9472                                  end1: PROC
  9473                                  ;Function : end1, Number of local variables: 1
  9474                                  ;   # type sign width addr used name   list of local variables
  9475                                  ;  200 var sign word   878 NULL n = bp+4;
  9476 0000479F C8000000                 ENTER  0,0
  9477 000047A3 FF36[1800]               push word [fdin]
  9478 000047A7 E84DB9                   call fcloseR
  9479 000047AA 83C402                   add  sp, 2
  9480 000047AD FF36[1A00]               push word [fdout]
  9481 000047B1 E843B9                   call fcloseR
  9482 000047B4 83C402                   add  sp, 2
  9483 000047B7 FF7604                   push word [bp+4]
  9484 000047BA E849B9                   call exitR
  9485 000047BD 83C402                   add  sp, 2
  9486                                  
  9487                                  ;-879 int error1(char *s) { 
  9488 000047C0 C9                       LEAVE
  9489 000047C1 C3                       ret
  9490                                  ENDP
  9491                                  
  9492                                  error1: PROC
  9493                                  
  9494                                  ;-880   lineno--;
  9495                                  
  9496                                  ;Function : error1, Number of local variables: 1
  9497                                  ;   # type sign width addr used name   list of local variables
  9498                                  ;  200 ptr sign byte   879 NULL s = bp+4;
  9499 000047C2 C8000000                 ENTER  0,0
  9500 000047C6 FF0E[6600]               dec  word[lineno]
  9501                                  
  9502                                  ;-881   prnl(); prscomment(&fgetsdest);
  9503                                  
  9504 000047CA E801FD                   call prnl
  9505 000047CD 8D060FD0                 lea  ax, [fgetsdest]
  9506 000047D1 50                       push ax
  9507 000047D2 E8CBFC                   call prscomment
  9508 000047D5 83C402                   add  sp, 2
  9509                                  
  9510                                  ;-882   prs(";Line: "); prunsign1(lineno);
  9511                                  
  9512 000047D8 68[6B48]                 push error1_0
  9513 000047DB E8FEFC                   call prs
  9514 000047DE 83C402                   add  sp, 2
  9515 000047E1 FF36[6600]               push word [lineno]
  9516 000047E5 E849FE                   call prunsign1
  9517 000047E8 83C402                   add  sp, 2
  9518                                  
  9519                                  ;-883   prs(" ************** ERROR: "); prs(s);
  9520                                  
  9521 000047EB 68[7348]                 push error1_1
  9522 000047EE E8EBFC                   call prs
  9523 000047F1 83C402                   add  sp, 2
  9524 000047F4 FF7604                   push word [bp+4]
  9525 000047F7 E8E2FC                   call prs
  9526 000047FA 83C402                   add  sp, 2
  9527                                  
  9528                                  ;-884   prs("  in column: "); prunsign1(spalte);
  9529                                  
  9530 000047FD 68[8B48]                 push error1_2
  9531 00004800 E8D9FC                   call prs
  9532 00004803 83C402                   add  sp, 2
  9533 00004806 FF36[1F00]               push word [spalte]
  9534 0000480A E824FE                   call prunsign1
  9535 0000480D 83C402                   add  sp, 2
  9536                                  
  9537                                  ;-885   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9538                                  
  9539 00004810 68[9948]                 push error1_3
  9540 00004813 E8C6FC                   call prs
  9541 00004816 83C402                   add  sp, 2
  9542 00004819 FF36[1C00]               push word [token]
  9543 0000481D E811FE                   call prunsign1
  9544 00004820 83C402                   add  sp, 2
  9545 00004823 68[A348]                 push error1_4
  9546 00004826 E8B3FC                   call prs
  9547 00004829 83C402                   add  sp, 2
  9548 0000482C A0[1E00]                 mov al, byte [globC]
  9549 0000482F B400                     mov ah, 0
  9550 00004831 50                       push ax
  9551 00004832 E840FC                   call prc
  9552 00004835 83C402                   add  sp, 2
  9553                                  
  9554                                  ;-886   prs(", thechar: "); prunsign1(thechar); prs(", symbol: "); prs(symbol);
  9555                                  
  9556 00004838 68[AD48]                 push error1_5
  9557 0000483B E89EFC                   call prs
  9558 0000483E 83C402                   add  sp, 2
  9559 00004841 A0[2100]                 mov al, byte [thechar]
  9560 00004844 B400                     mov ah, 0
  9561 00004846 50                       push ax
  9562 00004847 E8E7FD                   call prunsign1
  9563 0000484A 83C402                   add  sp, 2
  9564 0000484D 68[B948]                 push error1_6
  9565 00004850 E889FC                   call prs
  9566 00004853 83C402                   add  sp, 2
  9567 00004856 8D062B81                 lea  ax, [symbol]
  9568 0000485A 50                       push ax
  9569 0000485B E87EFC                   call prs
  9570 0000485E 83C402                   add  sp, 2
  9571                                  
  9572                                  ;-887   end1(1); }
  9573                                  
  9574 00004861 6A01                     push 1
  9575 00004863 E839FF                   call end1
  9576 00004866 83C402                   add  sp, 2
  9577                                  
  9578                                  ;-888 int listproc() {int i; 
  9579 00004869 C9                       LEAVE
  9580 0000486A C3                       ret
  9581 0000486B 3B4C696E653A2000        error1_0 db ";Line: ",0
  9582 00004873 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9583 0000487C 2A2A2A2A2A2A204552-
  9584 00004885 524F523A2000       
  9585 0000488B 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9586 00004894 6D6E3A2000         
  9587 00004899 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9588 000048A2 00                 
  9589 000048A3 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9590 000048AC 00                 
  9591 000048AD 2C2074686563686172-     error1_5 db ", thechar: ",0
  9592 000048B6 3A2000             
  9593 000048B9 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9594 000048C2 2000               
  9595                                  ENDP
  9596                                  
  9597                                  listproc: PROC
  9598                                  
  9599                                  ;-889   if (LTop > LSTART) {
  9600                                  
  9601                                  ;Function : listproc, Number of local variables: 1
  9602                                  ;   # type sign width addr used name   list of local variables
  9603                                  ;  200 var sign word   888 NULL i = bp-2;
  9604 000048C4 C8020000                 ENTER  2,0
  9605 000048C8 A1[2C00]                 mov ax, [LTop]
  9606 000048CB 3DC800                   cmp ax, 200
  9607 000048CE 0F8E5700                 jle .listproc544
  9608                                  
  9609                                  ;-890   prs("\n;Function : "); prs(fname);
  9610                                  
  9611 000048D2 68[2B49]                 push listproc_0
  9612 000048D5 E804FC                   call prs
  9613 000048D8 83C402                   add  sp, 2
  9614 000048DB 8D06AB81                 lea  ax, [fname]
  9615 000048DF 50                       push ax
  9616 000048E0 E8F9FB                   call prs
  9617 000048E3 83C402                   add  sp, 2
  9618                                  
  9619                                  ;-891   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9620                                  
  9621 000048E6 68[3A49]                 push listproc_1
  9622 000048E9 E8F0FB                   call prs
  9623 000048EC 83C402                   add  sp, 2
  9624 000048EF A1[2C00]                 mov ax, [LTop]
  9625 000048F2 2DC800                   sub ax, 200
  9626 000048F5 8946FE                   mov [bp-2], ax
  9627 000048F8 FF76FE                   push word [bp-2]
  9628 000048FB E833FD                   call prunsign1
  9629 000048FE 83C402                   add  sp, 2
  9630                                  
  9631                                  ;-892   prs("\n;   # type sign width addr used name   list of local variables");
  9632                                  
  9633 00004901 68[5849]                 push listproc_2
  9634 00004904 E8D5FB                   call prs
  9635 00004907 83C402                   add  sp, 2
  9636                                  
  9637                                  ;-893     i=LSTART; 
  9638                                  
  9639 0000490A B8C800                   mov ax, 200
  9640 0000490D 8946FE                   mov [bp-2], ax
  9641                                  
  9642                                  ;-894     while (i < LTop) { listvar(i); i++; } } 
  9643                                  
  9644                                  .listproc545:
  9645 00004910 8B46FE                   mov ax, [bp-2]
  9646 00004913 3B06[2C00]               cmp ax, [LTop]
  9647 00004917 0F8D0E00                 jge .listproc546
  9648 0000491B FF76FE                   push word [bp-2]
  9649 0000491E E87800                   call listvar
  9650 00004921 83C402                   add  sp, 2
  9651 00004924 FF46FE                   inc  word[bp-2]
  9652 00004927 EBE7                     jmp .listproc545
  9653                                  .listproc546:
  9654                                  
  9655                                  ;-895 }
  9656                                  
  9657                                  .listproc544:
  9658                                  
  9659                                  ;-896 int listvar(unsigned int i) {unsigned int j; char c;
  9660 00004929 C9                       LEAVE
  9661 0000492A C3                       ret
  9662 0000492B 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9663 00004934 6F6E203A2000       
  9664 0000493A 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9665 00004943 6F66206C6F63616C20-
  9666 0000494C 7661726961626C6573-
  9667 00004955 3A2000             
  9668 00004958 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9669 00004961 797065207369676E20-
  9670 0000496A 776964746820616464-
  9671 00004973 722075736564206E61-
  9672 0000497C 6D652020206C697374-
  9673 00004985 206F66206C6F63616C-
  9674 0000498E 207661726961626C65-
  9675 00004997 7300               
  9676                                  ENDP
  9677                                  
  9678                                  listvar: PROC
  9679                                  
  9680                                  ;-897   prs("\n;"); printint51(i); prc(32);
  9681                                  
  9682                                  ;Function : listvar, Number of local variables: 3
  9683                                  ;   # type sign width addr used name   list of local variables
  9684                                  ;  200 var unsg word   896 NULL i = bp+4
  9685                                  ;  201 var unsg word   896 NULL j = bp-2
  9686                                  ;  202 var sign byte   896 NULL c = bp-4;
  9687 00004999 C8040000                 ENTER  4,0
  9688 0000499D 68[854B]                 push listvar_0
  9689 000049A0 E839FB                   call prs
  9690 000049A3 83C402                   add  sp, 2
  9691 000049A6 FF7604                   push word [bp+4]
  9692 000049A9 E8C7FC                   call printint51
  9693 000049AC 83C402                   add  sp, 2
  9694 000049AF 6A20                     push 32
  9695 000049B1 E8C1FA                   call prc
  9696 000049B4 83C402                   add  sp, 2
  9697                                  
  9698                                  ;-898   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9699                                  
  9700 000049B7 8B5E04                   mov bx, [bp+4]
  9701 000049BA 8A87B782                 mov al, [GType + bx]
  9702 000049BE 8846FC                   mov [bp-4], al
  9703 000049C1 8A46FC                   mov al, [bp-4]
  9704 000049C4 3C56                     cmp al, 86
  9705 000049C6 0F850900                 jne .listvar547
  9706 000049CA 68[894B]                 push listvar_1
  9707 000049CD E80CFB                   call prs
  9708 000049D0 83C402                   add  sp, 2
  9709                                  .listvar547:
  9710 000049D3 8A46FC                   mov al, [bp-4]
  9711 000049D6 3C2A                     cmp al, 42
  9712 000049D8 0F850900                 jne .listvar548
  9713 000049DC 68[8E4B]                 push listvar_2
  9714 000049DF E8FAFA                   call prs
  9715 000049E2 83C402                   add  sp, 2
  9716                                  
  9717                                  ;-899                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9718                                  
  9719                                  .listvar548:
  9720 000049E5 8A46FC                   mov al, [bp-4]
  9721 000049E8 3C26                     cmp al, 38
  9722 000049EA 0F850900                 jne .listvar549
  9723 000049EE 68[934B]                 push listvar_3
  9724 000049F1 E8E8FA                   call prs
  9725 000049F4 83C402                   add  sp, 2
  9726                                  .listvar549:
  9727 000049F7 8A46FC                   mov al, [bp-4]
  9728 000049FA 3C23                     cmp al, 35
  9729 000049FC 0F850900                 jne .listvar550
  9730 00004A00 68[984B]                 push listvar_4
  9731 00004A03 E8D6FA                   call prs
  9732 00004A06 83C402                   add  sp, 2
  9733                                  
  9734                                  ;-900   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9735                                  
  9736                                  .listvar550:
  9737 00004A09 8B5E04                   mov bx, [bp+4]
  9738 00004A0C 8A87E383                 mov al, [GSign + bx]
  9739 00004A10 8846FC                   mov [bp-4], al
  9740 00004A13 8A46FC                   mov al, [bp-4]
  9741 00004A16 3C53                     cmp al, 83
  9742 00004A18 0F850900                 jne .listvar551
  9743 00004A1C 68[9D4B]                 push listvar_5
  9744 00004A1F E8BAFA                   call prs
  9745 00004A22 83C402                   add  sp, 2
  9746                                  .listvar551:
  9747 00004A25 8A46FC                   mov al, [bp-4]
  9748 00004A28 3C55                     cmp al, 85
  9749 00004A2A 0F850900                 jne .listvar552
  9750 00004A2E 68[A34B]                 push listvar_6
  9751 00004A31 E8A8FA                   call prs
  9752 00004A34 83C402                   add  sp, 2
  9753                                  
  9754                                  ;-901   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9755                                  
  9756                                  .listvar552:
  9757 00004A37 8B5E04                   mov bx, [bp+4]
  9758 00004A3A 8A870F85                 mov al, [GWidth + bx]
  9759 00004A3E 8846FC                   mov [bp-4], al
  9760 00004A41 8A46FC                   mov al, [bp-4]
  9761 00004A44 3C01                     cmp al, 1
  9762 00004A46 0F850900                 jne .listvar553
  9763 00004A4A 68[A94B]                 push listvar_7
  9764 00004A4D E88CFA                   call prs
  9765 00004A50 83C402                   add  sp, 2
  9766                                  .listvar553:
  9767 00004A53 8A46FC                   mov al, [bp-4]
  9768 00004A56 3C02                     cmp al, 2
  9769 00004A58 0F850900                 jne .listvar554
  9770 00004A5C 68[AF4B]                 push listvar_8
  9771 00004A5F E87AFA                   call prs
  9772 00004A62 83C402                   add  sp, 2
  9773                                  
  9774                                  ;-902                if(c==  4)prs("dwrd " );
  9775                                  
  9776                                  .listvar554:
  9777 00004A65 8A46FC                   mov al, [bp-4]
  9778 00004A68 3C04                     cmp al, 4
  9779 00004A6A 0F850900                 jne .listvar555
  9780 00004A6E 68[B54B]                 push listvar_9
  9781 00004A71 E868FA                   call prs
  9782 00004A74 83C402                   add  sp, 2
  9783                                  
  9784                                  ;-903   j=GAdr[i]; printint51(j);
  9785                                  
  9786                                  .listvar555:
  9787 00004A77 8B5E04                   mov bx, [bp+4]
  9788 00004A7A D1E3                     shl bx, 1
  9789 00004A7C 8B873B86                 mov ax, [GAdr + bx]
  9790 00004A80 8946FE                   mov [bp-2], ax
  9791 00004A83 FF76FE                   push word [bp-2]
  9792 00004A86 E8EAFB                   call printint51
  9793 00004A89 83C402                   add  sp, 2
  9794                                  
  9795                                  ;-904   j=GUsed[i]; if (j) printint51(j);
  9796                                  
  9797 00004A8C 8B5E04                   mov bx, [bp+4]
  9798 00004A8F D1E3                     shl bx, 1
  9799 00004A91 8B879388                 mov ax, [GUsed + bx]
  9800 00004A95 8946FE                   mov [bp-2], ax
  9801 00004A98 8B46FE                   mov ax, [bp-2]
  9802 00004A9B 08C0                     or  al, al
  9803 00004A9D 0F840C00                 je .listvar556
  9804 00004AA1 FF76FE                   push word [bp-2]
  9805 00004AA4 E8CCFB                   call printint51
  9806 00004AA7 83C402                   add  sp, 2
  9807                                  
  9808                                  ;-905   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9809                                  
  9810 00004AAA E92200                   jmp .listvar557
  9811                                  .listvar556:
  9812 00004AAD 8B5E04                   mov bx, [bp+4]
  9813 00004AB0 8A87B782                 mov al, [GType + bx]
  9814 00004AB4 3C23                     cmp al, 35
  9815 00004AB6 0F850C00                 jne .listvar558
  9816 00004ABA 68[BB4B]                 push listvar_10
  9817 00004ABD E81CFA                   call prs
  9818 00004AC0 83C402                   add  sp, 2
  9819 00004AC3 E90900                   jmp .listvar559
  9820                                  .listvar558:
  9821 00004AC6 68[C14B]                 push listvar_11
  9822 00004AC9 E810FA                   call prs
  9823 00004ACC 83C402                   add  sp, 2
  9824                                  .listvar559:
  9825                                  
  9826                                  ;-906   prc(32);  pt=adrofname(i); prs(pt);
  9827                                  
  9828                                  .listvar557:
  9829 00004ACF 6A20                     push 32
  9830 00004AD1 E8A1F9                   call prc
  9831 00004AD4 83C402                   add  sp, 2
  9832 00004AD7 FF7604                   push word [bp+4]
  9833 00004ADA E8F7BD                   call adrofname
  9834 00004ADD 83C402                   add  sp, 2
  9835 00004AE0 A3[6A00]                 mov word [pt], ax
  9836 00004AE3 FF36[6A00]               push word [pt]
  9837 00004AE7 E8F2F9                   call prs
  9838 00004AEA 83C402                   add  sp, 2
  9839                                  
  9840                                  ;-907   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9841                                  
  9842 00004AED 8B5E04                   mov bx, [bp+4]
  9843 00004AF0 8A87B782                 mov al, [GType + bx]
  9844 00004AF4 3C23                     cmp al, 35
  9845 00004AF6 0F851D00                 jne .listvar560
  9846 00004AFA 6A3D                     push 61
  9847 00004AFC E876F9                   call prc
  9848 00004AFF 83C402                   add  sp, 2
  9849 00004B02 8B5E04                   mov bx, [bp+4]
  9850 00004B05 D1E3                     shl bx, 1
  9851 00004B07 8B87EB8A                 mov ax, [GData + bx]
  9852 00004B0B 8946FE                   mov [bp-2], ax
  9853 00004B0E FF76FE                   push word [bp-2]
  9854 00004B11 E81DFB                   call prunsign1
  9855 00004B14 83C402                   add  sp, 2
  9856                                  
  9857                                  ;-908   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9858                                  
  9859                                  .listvar560:
  9860 00004B17 8B5E04                   mov bx, [bp+4]
  9861 00004B1A 8A87B782                 mov al, [GType + bx]
  9862 00004B1E 3C26                     cmp al, 38
  9863 00004B20 0F852500                 jne .listvar561
  9864 00004B24 6A5B                     push 91
  9865 00004B26 E84CF9                   call prc
  9866 00004B29 83C402                   add  sp, 2
  9867 00004B2C 8B5E04                   mov bx, [bp+4]
  9868 00004B2F D1E3                     shl bx, 1
  9869 00004B31 8B87EB8A                 mov ax, [GData + bx]
  9870 00004B35 8946FE                   mov [bp-2], ax
  9871 00004B38 FF76FE                   push word [bp-2]
  9872 00004B3B E8F3FA                   call prunsign1
  9873 00004B3E 83C402                   add  sp, 2
  9874 00004B41 6A5D                     push 93
  9875 00004B43 E82FF9                   call prc
  9876 00004B46 83C402                   add  sp, 2
  9877                                  
  9878                                  ;-909   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9879                                  
  9880                                  .listvar561:
  9881 00004B49 8B4604                   mov ax, [bp+4]
  9882 00004B4C 3DC800                   cmp ax, 200 ;unsigned : 0
  9883 00004B4F 0F823000                 jb  .listvar562
  9884 00004B53 68[C74B]                 push listvar_12
  9885 00004B56 E883F9                   call prs
  9886 00004B59 83C402                   add  sp, 2
  9887 00004B5C 8B5E04                   mov bx, [bp+4]
  9888 00004B5F D1E3                     shl bx, 1
  9889 00004B61 8B87EB8A                 mov ax, [GData + bx]
  9890 00004B65 8946FE                   mov [bp-2], ax
  9891                                  
  9892                                  ;-910     if (j > 0) prc('+'); pint1(j);  }
  9893                                  
  9894 00004B68 8B46FE                   mov ax, [bp-2]
  9895 00004B6B 83F800                   cmp ax, 0
  9896 00004B6E 0F8E0800                 jle .listvar563
  9897 00004B72 6A2B                     push 43
  9898 00004B74 E8FEF8                   call prc
  9899 00004B77 83C402                   add  sp, 2
  9900                                  .listvar563:
  9901 00004B7A FF76FE                   push word [bp-2]
  9902 00004B7D E853FA                   call pint1
  9903 00004B80 83C402                   add  sp, 2
  9904                                  
  9905                                  ;-911 }
  9906                                  
  9907                                  .listvar562:
  9908                                  
  9909                                  ;-912 int listcall() { int i;
  9910 00004B83 C9                       LEAVE
  9911 00004B84 C3                       ret
  9912 00004B85 5C6E3B00                listvar_0 db "\n;",0
  9913 00004B89 7661722000              listvar_1 db "var ",0
  9914 00004B8E 7074722000              listvar_2 db "ptr ",0
  9915 00004B93 6172722000              listvar_3 db "arr ",0
  9916 00004B98 6465662000              listvar_4 db "def ",0
  9917 00004B9D 7369676E2000            listvar_5 db "sign ",0
  9918 00004BA3 756E73672000            listvar_6 db "unsg ",0
  9919 00004BA9 627974652000            listvar_7 db "byte ",0
  9920 00004BAF 776F72642000            listvar_8 db "word ",0
  9921 00004BB5 647772642000            listvar_9 db "dwrd ",0
  9922 00004BBB 202020202D00            listvar_10 db "    -",0
  9923 00004BC1 204E554C4C00            listvar_11 db " NULL",0
  9924 00004BC7 203D20627000            listvar_12 db " = bp",0
  9925                                  ENDP
  9926                                  
  9927                                  listcall: PROC
  9928                                  
  9929                                  ;-913   prs("\n\n;    #  addr name   list of CALLs\n");
  9930                                  
  9931                                  ;Function : listcall, Number of local variables: 1
  9932                                  ;   # type sign width addr used name   list of local variables
  9933                                  ;  200 var sign word   912 NULL i = bp-2;
  9934 00004BCD C8020000                 ENTER  2,0
  9935 00004BD1 68[FB4B]                 push listcall_0
  9936 00004BD4 E805F9                   call prs
  9937 00004BD7 83C402                   add  sp, 2
  9938                                  
  9939                                  ;-914   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9940                                  
  9941 00004BDA B80000                   mov ax, 0
  9942 00004BDD 8946FE                   mov [bp-2], ax
  9943                                  .listcall564:
  9944 00004BE0 8B46FE                   mov ax, [bp-2]
  9945 00004BE3 3B06[3D00]               cmp ax, [CTop]
  9946 00004BE7 0F8D0E00                 jge .listcall565
  9947 00004BEB FF76FE                   push word [bp-2]
  9948 00004BEE E83200                   call calllisting
  9949 00004BF1 83C402                   add  sp, 2
  9950 00004BF4 FF46FE                   inc  word[bp-2]
  9951 00004BF7 EBE7                     jmp .listcall564
  9952                                  .listcall565:
  9953                                  
  9954                                  ;-915 int calllisting(int i) {char c; int j;
  9955 00004BF9 C9                       LEAVE
  9956 00004BFA C3                       ret
  9957 00004BFB 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9958 00004C04 23202061646472206E-
  9959 00004C0D 616D652020206C6973-
  9960 00004C16 74206F662043414C4C-
  9961 00004C1F 735C6E00           
  9962                                  ENDP
  9963                                  
  9964                                  calllisting: PROC
  9965                                  
  9966                                  ;-916   prs("\n;"); printint51(i); prc(32);
  9967                                  
  9968                                  ;Function : calllisting, Number of local variables: 3
  9969                                  ;   # type sign width addr used name   list of local variables
  9970                                  ;  200 var sign word   915 NULL i = bp+4
  9971                                  ;  201 var sign byte   915 NULL c = bp-2
  9972                                  ;  202 var sign word   915 NULL j = bp-4;
  9973 00004C23 C8040000                 ENTER  4,0
  9974 00004C27 68[954C]                 push calllisting_0
  9975 00004C2A E8AFF8                   call prs
  9976 00004C2D 83C402                   add  sp, 2
  9977 00004C30 FF7604                   push word [bp+4]
  9978 00004C33 E83DFA                   call printint51
  9979 00004C36 83C402                   add  sp, 2
  9980 00004C39 6A20                     push 32
  9981 00004C3B E837F8                   call prc
  9982 00004C3E 83C402                   add  sp, 2
  9983                                  
  9984                                  ;-917   c=CType [i]; if(c==0)prs("unresolved ");
  9985                                  
  9986 00004C41 8B5E04                   mov bx, [bp+4]
  9987 00004C44 8A872FA1                 mov al, [CType + bx]
  9988 00004C48 8846FE                   mov [bp-2], al
  9989 00004C4B 8A46FE                   mov al, [bp-2]
  9990 00004C4E 3C00                     cmp al, 0
  9991 00004C50 0F850900                 jne .calllisting566
  9992 00004C54 68[994C]                 push calllisting_1
  9993 00004C57 E882F8                   call prs
  9994 00004C5A 83C402                   add  sp, 2
  9995                                  
  9996                                  ;-918   j=CAdr[i];            printint51(j); prc(32);
  9997                                  
  9998                                  .calllisting566:
  9999 00004C5D 8B5E04                   mov bx, [bp+4]
 10000 00004C60 D1E3                     shl bx, 1
 10001 00004C62 8B8757AB                 mov ax, [CAdr + bx]
 10002 00004C66 8946FC                   mov [bp-4], ax
 10003 00004C69 FF76FC                   push word [bp-4]
 10004 00004C6C E804FA                   call printint51
 10005 00004C6F 83C402                   add  sp, 2
 10006 00004C72 6A20                     push 32
 10007 00004C74 E8FEF7                   call prc
 10008 00004C77 83C402                   add  sp, 2
 10009                                  
 10010                                  ;-919   from_far(NameA, j);   prs(NameA);
 10011                                  
 10012 00004C7A FF76FC                   push word [bp-4]
 10013 00004C7D 8D06[3F00]               lea  ax, [NameA]
 10014 00004C81 50                       push ax
 10015 00004C82 E8B306                   call from_far
 10016 00004C85 83C404                   add  sp, 4
 10017 00004C88 8D06[3F00]               lea  ax, [NameA]
 10018 00004C8C 50                       push ax
 10019 00004C8D E84CF8                   call prs
 10020 00004C90 83C402                   add  sp, 2
 10021                                  
 10022                                  ;-920 }
 10023                                  
 10024                                  
 10025                                  ;-921 int countcalls(int f) { unsigned int i;
 10026 00004C93 C9                       LEAVE
 10027 00004C94 C3                       ret
 10028 00004C95 5C6E3B00                calllisting_0 db "\n;",0
 10029 00004C99 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10030 00004CA2 642000             
 10031                                  ENDP
 10032                                  
 10033                                  countcalls: PROC
 10034                                  
 10035                                  ;-922   pt=adrF(FNameField, f);
 10036                                  
 10037                                  ;Function : countcalls, Number of local variables: 2
 10038                                  ;   # type sign width addr used name   list of local variables
 10039                                  ;  200 var sign word   921 NULL f = bp+4
 10040                                  ;  201 var unsg word   921 NULL i = bp-2;
 10041 00004CA5 C8020000                 ENTER  2,0
 10042 00004CA9 FF7604                   push word [bp+4]
 10043 00004CAC 8D064FBD                 lea  ax, [FNameField]
 10044 00004CB0 50                       push ax
 10045 00004CB1 E834BC                   call adrF
 10046 00004CB4 83C404                   add  sp, 4
 10047 00004CB7 A3[6A00]                 mov word [pt], ax
 10048                                  
 10049                                  ;-923   i=0;  while (i < CTop) {
 10050                                  
 10051 00004CBA B80000                   mov ax, 0
 10052 00004CBD 8946FE                   mov [bp-2], ax
 10053                                  .countcalls567:
 10054 00004CC0 8B46FE                   mov ax, [bp-2]
 10055 00004CC3 3B06[3D00]               cmp ax, [CTop]
 10056 00004CC7 0F8D4A00                 jge .countcalls568
 10057                                  
 10058                                  ;-924     p1=CAdr[i];
 10059                                  
 10060 00004CCB 8B5EFE                   mov bx, [bp-2]
 10061 00004CCE D1E3                     shl bx, 1
 10062 00004CD0 8B8757AB                 mov ax, [CAdr + bx]
 10063 00004CD4 A3[6C00]                 mov word [p1], ax
 10064                                  
 10065                                  ;-925     from_far(NameA, p1);
 10066                                  
 10067 00004CD7 FF36[6C00]               push word [p1]
 10068 00004CDB 8D06[3F00]               lea  ax, [NameA]
 10069 00004CDF 50                       push ax
 10070 00004CE0 E85506                   call from_far
 10071 00004CE3 83C404                   add  sp, 4
 10072                                  
 10073                                  ;-926     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10074                                  
 10075 00004CE6 8D06[3F00]               lea  ax, [NameA]
 10076 00004CEA 50                       push ax
 10077 00004CEB FF36[6A00]               push word [pt]
 10078 00004CEF E8A4B4                   call eqstr
 10079 00004CF2 83C404                   add  sp, 4
 10080 00004CF5 08C0                     or  al, al
 10081 00004CF7 0F841500                 je .countcalls569
 10082 00004CFB 8B5E04                   mov bx, [bp+4]
 10083 00004CFE D1E3                     shl bx, 1
 10084 00004D00 8B87F7BA                 mov ax, [FCalls + bx]
 10085 00004D04 83C001                   add ax, 1
 10086 00004D07 8B5E04                   mov bx, [bp+4]
 10087 00004D0A D1E3                     shl bx, 1
 10088 00004D0C 8987F7BA                 mov [FCalls+bx], ax
 10089                                  
 10090                                  ;-927     i++; }
 10091                                  
 10092                                  .countcalls569:
 10093 00004D10 FF46FE                   inc  word[bp-2]
 10094                                  
 10095                                  ;-928 }
 10096                                  
 10097 00004D13 EBAB                     jmp .countcalls567
 10098                                  .countcalls568:
 10099                                  
 10100                                  ;-929 int listfunc() { int i;
 10101 00004D15 C9                       LEAVE
 10102 00004D16 C3                       ret
 10103                                  ENDP
 10104                                  
 10105                                  listfunc: PROC
 10106                                  
 10107                                  ;-930   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10108                                  
 10109                                  ;Function : listfunc, Number of local variables: 1
 10110                                  ;   # type sign width addr used name   list of local variables
 10111                                  ;  200 var sign word   929 NULL i = bp-2;
 10112 00004D17 C8020000                 ENTER  2,0
 10113 00004D1B 68[644D]                 push listfunc_0
 10114 00004D1E E8BBF7                   call prs
 10115 00004D21 83C402                   add  sp, 2
 10116                                  
 10117                                  ;-931   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10118                                  
 10119 00004D24 B80000                   mov ax, 0
 10120 00004D27 8946FE                   mov [bp-2], ax
 10121                                  .listfunc570:
 10122 00004D2A 8B46FE                   mov ax, [bp-2]
 10123 00004D2D 3B06[3B00]               cmp ax, [FTop]
 10124 00004D31 0F8D0E00                 jge .listfunc571
 10125 00004D35 FF76FE                   push word [bp-2]
 10126 00004D38 E86AFF                   call countcalls
 10127 00004D3B 83C402                   add  sp, 2
 10128 00004D3E FF46FE                   inc  word[bp-2]
 10129                                  
 10130                                  ;-932   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10131                                  
 10132 00004D41 EBE7                     jmp .listfunc570
 10133                                  .listfunc571:
 10134 00004D43 B80000                   mov ax, 0
 10135 00004D46 8946FE                   mov [bp-2], ax
 10136                                  .listfunc572:
 10137 00004D49 8B46FE                   mov ax, [bp-2]
 10138 00004D4C 3B06[3B00]               cmp ax, [FTop]
 10139 00004D50 0F8D0E00                 jge .listfunc573
 10140 00004D54 FF76FE                   push word [bp-2]
 10141 00004D57 E84300                   call funclisting
 10142 00004D5A 83C402                   add  sp, 2
 10143 00004D5D FF46FE                   inc  word[bp-2]
 10144 00004D60 EBE7                     jmp .listfunc572
 10145                                  .listfunc573:
 10146                                  
 10147                                  ;-933 int funclisting(int i) {int j;  char c;
 10148 00004D62 C9                       LEAVE
 10149 00004D63 C3                       ret
 10150 00004D64 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10151 00004D6D 20232043616C6C7320-
 10152 00004D76 4C696E652057696474-
 10153 00004D7F 6820204E616D652020-
 10154 00004D88 206C697374206F6620-
 10155 00004D91 66756E6374696F6E73-
 10156 00004D9A 5C6E00             
 10157                                  ENDP
 10158                                  
 10159                                  funclisting: PROC
 10160                                  
 10161                                  ;-934   prs("\n;");    printint51(i);
 10162                                  
 10163                                  ;Function : funclisting, Number of local variables: 3
 10164                                  ;   # type sign width addr used name   list of local variables
 10165                                  ;  200 var sign word   933 NULL i = bp+4
 10166                                  ;  201 var sign word   933 NULL j = bp-2
 10167                                  ;  202 var sign byte   933 NULL c = bp-4;
 10168 00004D9D C8040000                 ENTER  4,0
 10169 00004DA1 68[794E]                 push funclisting_0
 10170 00004DA4 E835F7                   call prs
 10171 00004DA7 83C402                   add  sp, 2
 10172 00004DAA FF7604                   push word [bp+4]
 10173 00004DAD E8C3F8                   call printint51
 10174 00004DB0 83C402                   add  sp, 2
 10175                                  
 10176                                  ;-935   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10177                                  
 10178 00004DB3 8B5E04                   mov bx, [bp+4]
 10179 00004DB6 D1E3                     shl bx, 1
 10180 00004DB8 8B87F7BA                 mov ax, [FCalls + bx]
 10181 00004DBC 8946FE                   mov [bp-2], ax
 10182 00004DBF 8B46FE                   mov ax, [bp-2]
 10183 00004DC2 08C0                     or  al, al
 10184 00004DC4 0F840C00                 je .funclisting574
 10185 00004DC8 FF76FE                   push word [bp-2]
 10186 00004DCB E8A5F8                   call printint51
 10187 00004DCE 83C402                   add  sp, 2
 10188 00004DD1 E90900                   jmp .funclisting575
 10189                                  .funclisting574:
 10190 00004DD4 68[7D4E]                 push funclisting_1
 10191 00004DD7 E802F7                   call prs
 10192 00004DDA 83C402                   add  sp, 2
 10193                                  
 10194                                  ;-936   j = FAdr[i];   printint51(j); prc(32);
 10195                                  
 10196                                  .funclisting575:
 10197 00004DDD 8B5E04                   mov bx, [bp+4]
 10198 00004DE0 D1E3                     shl bx, 1
 10199 00004DE2 8B87FFA8                 mov ax, [FAdr + bx]
 10200 00004DE6 8946FE                   mov [bp-2], ax
 10201 00004DE9 FF76FE                   push word [bp-2]
 10202 00004DEC E884F8                   call printint51
 10203 00004DEF 83C402                   add  sp, 2
 10204 00004DF2 6A20                     push 32
 10205 00004DF4 E87EF6                   call prc
 10206 00004DF7 83C402                   add  sp, 2
 10207                                  
 10208                                  ;-937   c=FType[i];
 10209                                  
 10210 00004DFA 8B5E04                   mov bx, [bp+4]
 10211 00004DFD 8A8703A0                 mov al, [FType + bx]
 10212 00004E01 8846FC                   mov [bp-4], al
 10213                                  
 10214                                  ;-938   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10215                                  
 10216 00004E04 8A46FC                   mov al, [bp-4]
 10217 00004E07 3C56                     cmp al, 86
 10218 00004E09 0F850900                 jne .funclisting576
 10219 00004E0D 68[834E]                 push funclisting_2
 10220 00004E10 E8C9F6                   call prs
 10221 00004E13 83C402                   add  sp, 2
 10222                                  .funclisting576:
 10223 00004E16 8A46FC                   mov al, [bp-4]
 10224 00004E19 3C42                     cmp al, 66
 10225 00004E1B 0F850900                 jne .funclisting577
 10226 00004E1F 68[894E]                 push funclisting_3
 10227 00004E22 E8B7F6                   call prs
 10228 00004E25 83C402                   add  sp, 2
 10229                                  
 10230                                  ;-939   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10231                                  
 10232                                  .funclisting577:
 10233 00004E28 8A46FC                   mov al, [bp-4]
 10234 00004E2B 3C57                     cmp al, 87
 10235 00004E2D 0F850900                 jne .funclisting578
 10236 00004E31 68[8F4E]                 push funclisting_4
 10237 00004E34 E8A5F6                   call prs
 10238 00004E37 83C402                   add  sp, 2
 10239                                  .funclisting578:
 10240 00004E3A 8A46FC                   mov al, [bp-4]
 10241 00004E3D 3C44                     cmp al, 68
 10242 00004E3F 0F850900                 jne .funclisting579
 10243 00004E43 68[954E]                 push funclisting_5
 10244 00004E46 E893F6                   call prs
 10245 00004E49 83C402                   add  sp, 2
 10246                                  
 10247                                  ;-940   prc(32); prc(32);
 10248                                  
 10249                                  .funclisting579:
 10250 00004E4C 6A20                     push 32
 10251 00004E4E E824F6                   call prc
 10252 00004E51 83C402                   add  sp, 2
 10253 00004E54 6A20                     push 32
 10254 00004E56 E81CF6                   call prc
 10255 00004E59 83C402                   add  sp, 2
 10256                                  
 10257                                  ;-941   pt=adrF(FNameField, i); prs(pt);
 10258                                  
 10259 00004E5C FF7604                   push word [bp+4]
 10260 00004E5F 8D064FBD                 lea  ax, [FNameField]
 10261 00004E63 50                       push ax
 10262 00004E64 E881BA                   call adrF
 10263 00004E67 83C404                   add  sp, 4
 10264 00004E6A A3[6A00]                 mov word [pt], ax
 10265 00004E6D FF36[6A00]               push word [pt]
 10266 00004E71 E868F6                   call prs
 10267 00004E74 83C402                   add  sp, 2
 10268                                  
 10269                                  ;-942 }
 10270                                  
 10271                                  
 10272                                  ;-943 unsigned int MAXUI=65535;
 10273 00004E77 C9                       LEAVE
 10274 00004E78 C3                       ret
 10275 00004E79 5C6E3B00                funclisting_0 db "\n;",0
 10276 00004E7D 204E554C4C00            funclisting_1 db " NULL",0
 10277 00004E83 766F69642000            funclisting_2 db "void ",0
 10278 00004E89 627974652000            funclisting_3 db "byte ",0
 10279 00004E8F 776F72642000            funclisting_4 db "word ",0
 10280 00004E95 647772642000            funclisting_5 db "dwrd ",0
 10281                                  ENDP
 10282 00004E9B FFFF                    MAXUI dw 65535
 10283                                  
 10284                                  ;-944 int epilog() {unsigned int i; 
 10285                                  
 10286                                  
 10287                                  epilog: PROC
 10288                                  
 10289                                  ;-945   strcpy(symbol, "LastFunctionByt");  storefunc();
 10290                                  
 10291                                  ;Function : epilog, Number of local variables: 1
 10292                                  ;   # type sign width addr used name   list of local variables
 10293                                  ;  200 var unsg word   944 NULL i = bp-2;
 10294 00004E9D C8020000                 ENTER  2,0
 10295 00004EA1 68[CF50]                 push epilog_0
 10296 00004EA4 8D062B81                 lea  ax, [symbol]
 10297 00004EA8 50                       push ax
 10298 00004EA9 E8BAB2                   call strcpy
 10299 00004EAC 83C404                   add  sp, 4
 10300 00004EAF E811BD                   call storefunc
 10301                                  
 10302                                  ;-946   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10303                                  
 10304 00004EB2 68[DF50]                 push epilog_1
 10305 00004EB5 E824F6                   call prs
 10306 00004EB8 83C402                   add  sp, 2
 10307                                  
 10308                                  ;-947   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10309                                  
 10310 00004EBB 68[0C51]                 push epilog_2
 10311 00004EBE E81BF6                   call prs
 10312 00004EC1 83C402                   add  sp, 2
 10313                                  
 10314                                  ;-948   i=1;
 10315                                  
 10316 00004EC4 B80100                   mov ax, 1
 10317 00004EC7 8946FE                   mov [bp-2], ax
 10318                                  
 10319                                  ;-949   while (i< GTop) { listvar(i); i++; }
 10320                                  
 10321                                  .epilog580:
 10322 00004ECA 8B46FE                   mov ax, [bp-2]
 10323 00004ECD 3B06[2A00]               cmp ax, [GTop]
 10324 00004ED1 0F8D0E00                 jge .epilog581
 10325 00004ED5 FF76FE                   push word [bp-2]
 10326 00004ED8 E8BEFA                   call listvar
 10327 00004EDB 83C402                   add  sp, 2
 10328 00004EDE FF46FE                   inc  word[bp-2]
 10329                                  
 10330                                  ;-950   listfunc();   listcall();
 10331                                  
 10332 00004EE1 EBE7                     jmp .epilog580
 10333                                  .epilog581:
 10334 00004EE3 E831FE                   call listfunc
 10335 00004EE6 E8E4FC                   call listcall
 10336                                  
 10337                                  ;-951 
 10338                                  
 10339                                  
 10340                                  ;-952   prs("\n;Input: "); prs(&namein);
 10341                                  
 10342 00004EE9 68[5351]                 push epilog_3
 10343 00004EEC E8EDF5                   call prs
 10344 00004EEF 83C402                   add  sp, 2
 10345 00004EF2 8D06EE81                 lea  ax, [namein]
 10346 00004EF6 50                       push ax
 10347 00004EF7 E8E2F5                   call prs
 10348 00004EFA 83C402                   add  sp, 2
 10349                                  
 10350                                  ;-953   prs(", List: ");   prs(&namelst);
 10351                                  
 10352 00004EFD 68[5E51]                 push epilog_4
 10353 00004F00 E8D9F5                   call prs
 10354 00004F03 83C402                   add  sp, 2
 10355 00004F06 8D063182                 lea  ax, [namelst]
 10356 00004F0A 50                       push ax
 10357 00004F0B E8CEF5                   call prs
 10358 00004F0E 83C402                   add  sp, 2
 10359                                  
 10360                                  ;-954   prs(",  Lines:"); printint51(lineno);
 10361                                  
 10362 00004F11 68[6751]                 push epilog_5
 10363 00004F14 E8C5F5                   call prs
 10364 00004F17 83C402                   add  sp, 2
 10365 00004F1A FF36[6600]               push word [lineno]
 10366 00004F1E E852F7                   call printint51
 10367 00004F21 83C402                   add  sp, 2
 10368                                  
 10369                                  ;-955   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10370                                  
 10371 00004F24 68[7151]                 push epilog_6
 10372 00004F27 E8B2F5                   call prs
 10373 00004F2A 83C402                   add  sp, 2
 10374 00004F2D FF0E[2A00]               dec  word[GTop]
 10375 00004F31 FF36[2A00]               push word [GTop]
 10376 00004F35 E83BF7                   call printint51
 10377 00004F38 83C402                   add  sp, 2
 10378                                  
 10379                                  ;-956   prs(" max.:"); printint51(LSTART);
 10380                                  
 10381 00004F3B 68[8551]                 push epilog_7
 10382 00004F3E E89BF5                   call prs
 10383 00004F41 83C402                   add  sp, 2
 10384 00004F44 68C800                   push 200
 10385 00004F47 E829F7                   call printint51
 10386 00004F4A 83C402                   add  sp, 2
 10387                                  
 10388                                  ;-957   prs("\n;Functions      :"); printint51(FTop);
 10389                                  
 10390 00004F4D 68[8C51]                 push epilog_8
 10391 00004F50 E889F5                   call prs
 10392 00004F53 83C402                   add  sp, 2
 10393 00004F56 FF36[3B00]               push word [FTop]
 10394 00004F5A E816F7                   call printint51
 10395 00004F5D 83C402                   add  sp, 2
 10396                                  
 10397                                  ;-958   prs(" max.:"); printint51(FUNCMAX);
 10398                                  
 10399 00004F60 68[A051]                 push epilog_9
 10400 00004F63 E876F5                   call prs
 10401 00004F66 83C402                   add  sp, 2
 10402 00004F69 682C01                   push 300
 10403 00004F6C E804F7                   call printint51
 10404 00004F6F 83C402                   add  sp, 2
 10405                                  
 10406                                  ;-959   prs("\n;Calls          :"); printint51(CTop);
 10407                                  
 10408 00004F72 68[A751]                 push epilog_10
 10409 00004F75 E864F5                   call prs
 10410 00004F78 83C402                   add  sp, 2
 10411 00004F7B FF36[3D00]               push word [CTop]
 10412 00004F7F E8F1F6                   call printint51
 10413 00004F82 83C402                   add  sp, 2
 10414                                  
 10415                                  ;-960   prs(" max.:"); printint51(CALLMAX);
 10416                                  
 10417 00004F85 68[BB51]                 push epilog_11
 10418 00004F88 E851F5                   call prs
 10419 00004F8B 83C402                   add  sp, 2
 10420 00004F8E 68D007                   push 2000
 10421 00004F91 E8DFF6                   call printint51
 10422 00004F94 83C402                   add  sp, 2
 10423                                  
 10424                                  ;-961   prs(", NameField:"); printint51(CNameTop);
 10425                                  
 10426 00004F97 68[C251]                 push epilog_12
 10427 00004F9A E83FF5                   call prs
 10428 00004F9D 83C402                   add  sp, 2
 10429 00004FA0 FF36[6000]               push word [CNameTop]
 10430 00004FA4 E8CCF6                   call printint51
 10431 00004FA7 83C402                   add  sp, 2
 10432                                  
 10433                                  ;-962   prs(" max.:"); printint51(65535);
 10434                                  
 10435 00004FAA 68[CF51]                 push epilog_13
 10436 00004FAD E82CF5                   call prs
 10437 00004FB0 83C402                   add  sp, 2
 10438 00004FB3 68FFFF                   push 65535
 10439 00004FB6 E8BAF6                   call printint51
 10440 00004FB9 83C402                   add  sp, 2
 10441                                  
 10442                                  ;-963 //  prs(", segE:"); printint51(segE);
 10443                                  
 10444                                  
 10445                                  ;-964   __asm{call LastFunctionByt}  _ i=ax;
 10446                                  
 10447 00004FBC E89903                  call LastFunctionByt
 10448 00004FBF 8946FE                  mov [bp-2], ax
 10449                                  
 10450                                  ;-965   prs("\n;Code until     :"); printint51(i);
 10451                                  
 10452 00004FC2 68[D651]                 push epilog_14
 10453 00004FC5 E814F5                   call prs
 10454 00004FC8 83C402                   add  sp, 2
 10455 00004FCB FF76FE                   push word [bp-2]
 10456 00004FCE E8A2F6                   call printint51
 10457 00004FD1 83C402                   add  sp, 2
 10458                                  
 10459                                  ;-966   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10460                                  
 10461 00004FD4 68[EA51]                 push epilog_15
 10462 00004FD7 E802F5                   call prs
 10463 00004FDA 83C402                   add  sp, 2
 10464 00004FDD FF36[0E00]               push word [ORGDATAORIG]
 10465 00004FE1 E88FF6                   call printint51
 10466 00004FE4 83C402                   add  sp, 2
 10467 00004FE7 A1[0E00]                 mov ax, [ORGDATAORIG]
 10468 00004FEA 2B46FE                   sub ax, [bp-2]
 10469 00004FED 8946FE                   mov [bp-2], ax
 10470 00004FF0 68[F251]                 push epilog_16
 10471 00004FF3 E8E6F4                   call prs
 10472 00004FF6 83C402                   add  sp, 2
 10473                                  
 10474                                  ;-967   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10475                                  
 10476 00004FF9 FF76FE                   push word [bp-2]
 10477 00004FFC E874F6                   call printint51
 10478 00004FFF 83C402                   add  sp, 2
 10479 00005002 8B46FE                   mov ax, [bp-2]
 10480 00005005 3DE803                   cmp ax, 1000
 10481 00005008 0F870900                 ja  .epilog582
 10482 0000500C 68[FA51]                 push epilog_17
 10483 0000500F E8CAF4                   call prs
 10484 00005012 83C402                   add  sp, 2
 10485                                  
 10486                                  ;-968   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10487                                  
 10488                                  .epilog582:
 10489 00005015 68[1F52]                 push epilog_18
 10490 00005018 E8C1F4                   call prs
 10491 0000501B 83C402                   add  sp, 2
 10492 0000501E FF36[1000]               push word [orgData]
 10493 00005022 E80CF6                   call prunsign1
 10494 00005025 83C402                   add  sp, 2
 10495 00005028 A1[9B4E]                 mov ax, [MAXUI]
 10496 0000502B 2B06[1000]               sub ax, [orgData]
 10497 0000502F 8946FE                   mov [bp-2], ax
 10498                                  
 10499                                  ;-969   prs(", resting stacksize: ");printint51(i);
 10500                                  
 10501 00005032 68[3352]                 push epilog_19
 10502 00005035 E8A4F4                   call prs
 10503 00005038 83C402                   add  sp, 2
 10504 0000503B FF76FE                   push word [bp-2]
 10505 0000503E E832F6                   call printint51
 10506 00005041 83C402                   add  sp, 2
 10507                                  
 10508                                  ;-970   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10509                                  
 10510 00005044 8B46FE                   mov ax, [bp-2]
 10511 00005047 3D8813                   cmp ax, 5000
 10512 0000504A 0F870900                 ja  .epilog583
 10513 0000504E 68[4952]                 push epilog_20
 10514 00005051 E888F4                   call prs
 10515 00005054 83C402                   add  sp, 2
 10516                                  
 10517                                  ;-971   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10518                                  
 10519                                  .epilog583:
 10520 00005057 68[6A52]                 push epilog_21
 10521 0000505A E87FF4                   call prs
 10522 0000505D 83C402                   add  sp, 2
 10523 00005060 8D06E880                 lea  ax, [coname]
 10524 00005064 50                       push ax
 10525 00005065 E874F4                   call prs
 10526 00005068 83C402                   add  sp, 2
 10527 0000506B 68[7D52]                 push epilog_22
 10528 0000506E E86BF4                   call prs
 10529 00005071 83C402                   add  sp, 2
 10530 00005074 FF36[1200]               push word [maxco]
 10531 00005078 E8F8F5                   call printint51
 10532 0000507B 83C402                   add  sp, 2
 10533                                  
 10534                                  ;-972   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10535                                  
 10536 0000507E 68[8152]                 push epilog_23
 10537 00005081 E858F4                   call prs
 10538 00005084 83C402                   add  sp, 2
 10539 00005087 68B80B                   push 3000
 10540 0000508A E8E6F5                   call printint51
 10541 0000508D 83C402                   add  sp, 2
 10542 00005090 B8B80B                   mov ax, 3000
 10543 00005093 8946FE                   mov [bp-2], ax
 10544 00005096 8B46FE                   mov ax, [bp-2]
 10545 00005099 2B06[1200]               sub ax, [maxco]
 10546 0000509D 8946FE                   mov [bp-2], ax
 10547 000050A0 68[8752]                 push epilog_24
 10548 000050A3 E836F4                   call prs
 10549 000050A6 83C402                   add  sp, 2
 10550                                  
 10551                                  ;-973   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10552                                  
 10553 000050A9 FF76FE                   push word [bp-2]
 10554 000050AC E8C4F5                   call printint51
 10555 000050AF 83C402                   add  sp, 2
 10556 000050B2 8B46FE                   mov ax, [bp-2]
 10557 000050B5 3DE803                   cmp ax, 1000
 10558 000050B8 0F870900                 ja  .epilog584
 10559 000050BC 68[8F52]                 push epilog_25
 10560 000050BF E81AF4                   call prs
 10561 000050C2 83C402                   add  sp, 2
 10562                                  
 10563                                  ;-974   end1(0);}
 10564                                  
 10565                                  .epilog584:
 10566 000050C5 6A00                     push 0
 10567 000050C7 E8D5F6                   call end1
 10568 000050CA 83C402                   add  sp, 2
 10569                                  
 10570                                  ;-975 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10571                                  
 10572                                  
 10573                                  ;-976 int setblock(unsigned int i) {
 10574 000050CD C9                       LEAVE
 10575 000050CE C3                       ret
 10576 000050CF 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10577 000050D8 696F6E42797400     
 10578 000050DF 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10579 000050E8 6374696F6E4279743A-
 10580 000050F1 646220304538682C20-
 10581 000050FA 302C20305C6E706F70-
 10582 00005103 2061785C6E72657400 
 10583 0000510C 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10584 00005115 232074797065207369-
 10585 0000511E 676E20776964746820-
 10586 00005127 206164722075736564-
 10587 00005130 206E616D652020206C-
 10588 00005139 697374206F6620676C-
 10589 00005142 6F62616C2076617269-
 10590 0000514B 61626C65735C6E00   
 10591 00005153 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10592 0000515C 2000               
 10593 0000515E 2C204C6973743A2000      epilog_4 db ", List: ",0
 10594 00005167 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10595 00005170 00                 
 10596 00005171 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10597 0000517A 7661726961626C6573-
 10598 00005183 3A00               
 10599 00005185 206D61782E3A00          epilog_7 db " max.:",0
 10600 0000518C 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10601 00005195 6F6E73202020202020-
 10602 0000519E 3A00               
 10603 000051A0 206D61782E3A00          epilog_9 db " max.:",0
 10604 000051A7 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10605 000051B0 202020202020202020-
 10606 000051B9 3A00               
 10607 000051BB 206D61782E3A00          epilog_11 db " max.:",0
 10608 000051C2 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10609 000051CB 6C643A00           
 10610 000051CF 206D61782E3A00          epilog_13 db " max.:",0
 10611 000051D6 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10612 000051DF 6E74696C2020202020-
 10613 000051E8 3A00               
 10614 000051EA 206D61782E3A2000        epilog_15 db " max.: ",0
 10615 000051F2 2C20667265653A00        epilog_16 db ", free:",0
 10616 000051FA 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10617 00005203 696E67202A2A2A2043-
 10618 0000520C 6F6465206172656120-
 10619 00005215 746F6F20736D616C6C-
 10620 0000521E 00                 
 10621 0000521F 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10622 00005228 48656170456E642920-
 10623 00005231 3A00               
 10624 00005233 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10625 0000523C 20737461636B73697A-
 10626 00005245 653A2000           
 10627 00005249 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10628 00005252 696E67202A2A2A2053-
 10629 0000525B 7461636B20746F6F20-
 10630 00005264 736D616C6C00       
 10631 0000526A 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10632 00005273 6F6E737420696E2027-
 10633 0000527C 00                 
 10634 0000527D 27203A00                epilog_22 db "' :",0
 10635 00005281 206D61782E00            epilog_23 db " max.",0
 10636 00005287 2C20667265653A00        epilog_24 db ", free:",0
 10637 0000528F 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10638 00005298 696E67202A2A2A2063-
 10639 000052A1 6F6E7374616E742061-
 10640 000052AA 72656120746F6F2073-
 10641 000052B3 6D616C6C00         
 10642                                  ENDP
 10643                                  
 10644                                  setblock: PROC
 10645                                  
 10646                                  ;-977   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10647                                  
 10648                                  ;Function : setblock, Number of local variables: 1
 10649                                  ;   # type sign width addr used name   list of local variables
 10650                                  ;  200 var unsg word   976 NULL i = bp+4;
 10651 000052B8 C8000000                 ENTER  0,0
 10652 000052BC B80000                   mov ax, 0
 10653 000052BF A3[6E00]                 mov word [DOS_ERR], ax
 10654 000052C2 8B5E04                   mov  bx, [bp+4]
 10655 000052C5 8CC8                     mov  ax, cs
 10656 000052C7 8EC0                     mov  es, ax
 10657 000052C9 B8004A                   mov  ax, 18944
 10658 000052CC E8FEAD                   call DosInt
 10659                                  
 10660                                  ;-978 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10661 000052CF C9                       LEAVE
 10662 000052D0 C3                       ret
 10663                                  ENDP
 10664                                  
 10665                                  allocmem: PROC
 10666                                  
 10667                                  ;-979   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10668                                  
 10669                                  ;Function : allocmem, Number of local variables: 3
 10670                                  ;   # type sign width addr used name   list of local variables
 10671                                  ;  200 var unsg word   978 NULL i = bp+4
 10672                                  ;  201 var unsg word   978 NULL vAX = bp-2
 10673                                  ;  202 var unsg word   978 NULL vBX = bp-4;
 10674 000052D1 C8040000                 ENTER  4,0
 10675 000052D5 B80000                   mov ax, 0
 10676 000052D8 A3[6E00]                 mov word [DOS_ERR], ax
 10677 000052DB 8B5E04                   mov  bx, [bp+4]
 10678 000052DE B80048                   mov  ax, 18432
 10679 000052E1 E8E9AD                   call DosInt
 10680 000052E4 8946FE                  mov [bp-2], ax
 10681 000052E7 895EFC                  mov [bp-4], bx
 10682                                  
 10683                                  ;-980   if(DOS_ERR) return vBX;   return vAX;
 10684                                  
 10685 000052EA A1[6E00]                 mov ax, [DOS_ERR]
 10686 000052ED 08C0                     or  al, al
 10687 000052EF 0F840600                 je .allocmem585
 10688 000052F3 8B46FC                   mov ax, [bp-4]
 10689 000052F6 E90600                   jmp .retnallocmem
 10690                                  .allocmem585:
 10691 000052F9 8B46FE                   mov ax, [bp-2]
 10692 000052FC E90000                   jmp .retnallocmem
 10693                                  
 10694                                  ;-981 }
 10695                                  
 10696                                  
 10697                                  ;-982 int copyF(char *dest, char *src, unsigned int sz) {
 10698                                  
 10699 000052FF C9                       .retnallocmem: LEAVE
 10700 00005300 C3                       ret
 10701                                  ENDP
 10702                                  
 10703                                  copyF: PROC
 10704                                  
 10705                                  ;-983   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10706                                  
 10707                                  ;Function : copyF, Number of local variables: 3
 10708                                  ;   # type sign width addr used name   list of local variables
 10709                                  ;  200 ptr sign byte   982 NULL dest = bp+4
 10710                                  ;  201 ptr sign byte   982 NULL src = bp+6
 10711                                  ;  202 var unsg word   982 NULL sz = bp+8;
 10712 00005301 C8000000                 ENTER  0,0
 10713 00005305 A1[6400]                 mov ax, [segE]
 10714 00005308 8EC0                     mov  es, ax
 10715 0000530A 8B7606                   mov  si, [bp+6]
 10716 0000530D 8B7E04                   mov  di, [bp+4]
 10717 00005310 8B4E08                   mov  cx, [bp+8]
 10718                                  
 10719                                  ;-984   asm cld
 10720                                  
 10721 00005313 FC                       cld
 10722                                  
 10723                                  ;-985   asm rep movsb
 10724                                  
 10725 00005314 F3A4                     rep movsb
 10726                                  
 10727                                  ;-986   asm mov byte [es:di], 0
 10728                                  
 10729 00005316 26C60500                 mov byte [es:di], 0
 10730                                  
 10731                                  ;-987 }
 10732                                  
 10733                                  
 10734                                  ;-988 int to_far(char *dest, char *src) {
 10735 0000531A C9                       LEAVE
 10736 0000531B C3                       ret
 10737                                  ENDP
 10738                                  
 10739                                  to_far: PROC
 10740                                  
 10741                                  ;-989   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10742                                  
 10743                                  ;Function : to_far, Number of local variables: 2
 10744                                  ;   # type sign width addr used name   list of local variables
 10745                                  ;  200 ptr sign byte   988 NULL dest = bp+4
 10746                                  ;  201 ptr sign byte   988 NULL src = bp+6;
 10747 0000531C C8000000                 ENTER  0,0
 10748 00005320 A1[6400]                 mov ax, [segE]
 10749 00005323 8EC0                     mov  es, ax
 10750 00005325 8B7606                   mov  si, [bp+6]
 10751 00005328 8B7E04                   mov  di, [bp+4]
 10752                                  
 10753                                  ;-990   asm cld
 10754                                  
 10755 0000532B FC                       cld
 10756                                  
 10757                                  ;-991   do{
 10758                                  
 10759                                  .to_far586:
 10760                                  
 10761                                  ;-992   asm lodsb  ; inc si
 10762                                  
 10763 0000532C AC                       lodsb  ; inc si
 10764                                  
 10765                                  ;-993   asm stosb  ; inc di
 10766                                  
 10767 0000532D AA                       stosb  ; inc di
 10768                                  
 10769                                  ;-994   } while (al != 0);
 10770                                  
 10771 0000532E 3C00                     cmp  al, 0
 10772 00005330 0F840200                 je  .to_far587
 10773 00005334 EBF6                     jmp .to_far586
 10774                                  .to_far587:
 10775                                  
 10776                                  ;-995 }
 10777                                  
 10778                                  
 10779                                  ;-996 int from_far(char *dest, char *src) {
 10780 00005336 C9                       LEAVE
 10781 00005337 C3                       ret
 10782                                  ENDP
 10783                                  
 10784                                  from_far: PROC
 10785                                  
 10786                                  ;-997   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10787                                  
 10788                                  ;Function : from_far, Number of local variables: 2
 10789                                  ;   # type sign width addr used name   list of local variables
 10790                                  ;  200 ptr sign byte   996 NULL dest = bp+4
 10791                                  ;  201 ptr sign byte   996 NULL src = bp+6;
 10792 00005338 C8000000                 ENTER  0,0
 10793 0000533C A1[6400]                 mov ax, [segE]
 10794 0000533F 8EC0                     mov  es, ax
 10795 00005341 8B7606                   mov  si, [bp+6]
 10796 00005344 8B7E04                   mov  di, [bp+4]
 10797                                  
 10798                                  ;-998   do{
 10799                                  
 10800                                  .from_far588:
 10801                                  
 10802                                  ;-999   asm mov al, [es:si]
 10803                                  
 10804 00005347 268A04                   mov al, [es:si]
 10805                                  
 10806                                  ;-1000   asm inc si
 10807                                  
 10808 0000534A 46                       inc si
 10809                                  
 10810                                  ;-1001   asm mov [di], al
 10811                                  
 10812 0000534B 8805                     mov [di], al
 10813                                  
 10814                                  ;-1002   asm inc di
 10815                                  
 10816 0000534D 47                       inc di
 10817                                  
 10818                                  ;-1003   } while (al != 0);
 10819                                  
 10820 0000534E 3C00                     cmp  al, 0
 10821 00005350 0F840200                 je  .from_far589
 10822 00005354 EBF1                     jmp .from_far588
 10823                                  .from_far589:
 10824                                  
 10825                                  ;-1004 }
 10826 00005356 C9                       LEAVE
 10827 00005357 C3                       ret
 10828                                  ENDP
 10829                                   
 10830                                  ; missing functions: 
 10831                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10832 00005358 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10833 0000535B 58                      pop ax
 10834 0000535C C3                      ret
 10835                                   
 10836                                  ;   # type sign width  adr used name   list of global variables
 10837                                  
 10838                                  ;    1 arr sign byte     2    2 Version1[10]
 10839                                  ;    2 def unsg byte     3    - LSTART=200
 10840                                  ;    3 def unsg byte     4    - VARMAX=300
 10841                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10842                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10843                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10844                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10845                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10846                                  ;    9 def unsg byte    11    - T_NAME=256
 10847                                  ;   10 def unsg byte    12    - T_CONST=257
 10848                                  ;   11 def unsg byte    13    - T_STRING=258
 10849                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10850                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10851                                  ;   14 def unsg byte    16    - T_RETURN=512
 10852                                  ;   15 def unsg byte    17    - T_IF=513
 10853                                  ;   16 def unsg byte    18    - T_ELSE=514
 10854                                  ;   17 def unsg byte    19    - T_WHILE=515
 10855                                  ;   18 def unsg byte    20    - T_DO=516
 10856                                  ;   19 def unsg byte    21    - T_INT=517
 10857                                  ;   20 def unsg byte    22    - T_ASM=518
 10858                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10859                                  ;   22 def unsg byte    24    - T_EMIT=520
 10860                                  ;   23 def unsg byte    25    - T_GOTO=521
 10861                                  ;   24 def unsg byte    26    - T_VOID=529
 10862                                  ;   25 def unsg byte    27    - T_CHAR=530
 10863                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10864                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10865                                  ;   28 def unsg byte    30    - T_LONG=533
 10866                                  ;   29 def unsg byte    31    - T_EQ=806
 10867                                  ;   30 def unsg byte    32    - T_NE=807
 10868                                  ;   31 def unsg byte    33    - T_GE=811
 10869                                  ;   32 def unsg byte    34    - T_LE=824
 10870                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10871                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10872                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10873                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10874                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10875                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10876                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10877                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10878                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10879                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10880                                  ;   43 def unsg byte    45    - COMAX=3000
 10881                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10882                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10883                                  ;   46 var unsg word    47   10 orgData
 10884                                  ;   47 arr sign byte    48    4 co[3000]
 10885                                  ;   48 var sign word    48    4 maxco
 10886                                  ;   49 var sign word    48    3 maxco1
 10887                                  ;   50 arr sign byte    49    2 coname[67]
 10888                                  ;   51 ptr sign byte    49    5 cloc
 10889                                  ;   52 var sign word    50    6 fdin
 10890                                  ;   53 var sign word    50    4 fdout
 10891                                  ;   54 arr sign byte    50  104 symbol[128]
 10892                                  ;   55 arr sign byte    51   12 fname[67]
 10893                                  ;   56 arr sign byte    51   10 namein[67]
 10894                                  ;   57 arr sign byte    52    7 namelst[67]
 10895                                  ;   58 arr sign byte    52    2 archivename[67]
 10896                                  ;   59 var sign word    53   41 token
 10897                                  ;   60 var sign byte    53    2 globC
 10898                                  ;   61 var sign word    53    3 spalte
 10899                                  ;   62 var sign byte    54   28 thechar
 10900                                  ;   63 var sign word    54    9 iscmp
 10901                                  ;   64 var sign word    54    4 nconst
 10902                                  ;   65 var sign word    55    3 nreturn
 10903                                  ;   66 var sign word    55   12 nlabel
 10904                                  ;   67 var sign word    56   24 GTop
 10905                                  ;   68 var sign word    56   20 LTop
 10906                                  ;   69 var unsg word    57   44 lexval
 10907                                  ;   70 var sign word    58    6 typei
 10908                                  ;   71 var sign byte    58    8 istype
 10909                                  ;   72 arr sign byte    58   11 GType[300]
 10910                                  ;   73 var sign word    59    6 signi
 10911                                  ;   74 var sign byte    59    5 issign
 10912                                  ;   75 arr sign byte    59    5 GSign[300]
 10913                                  ;   76 var sign word    60    9 widthi
 10914                                  ;   77 var sign byte    60   19 iswidth
 10915                                  ;   78 arr sign byte    60    5 GWidth[300]
 10916                                  ;   79 arr sign word    61    4 GAdr[300]
 10917                                  ;   80 arr sign word    61    6 GUsed[300]
 10918                                  ;   81 var sign word    62   26 wi
 10919                                  ;   82 arr sign word    62   11 GData[300]
 10920                                  ;   83 arr sign byte    62    2 GNameField[4800]
 10921                                  ;   84 var sign word    63   13 FTop
 10922                                  ;   85 var sign word    63    8 CTop
 10923                                  ;   86 arr sign byte    64    2 FType[300]
 10924                                  ;   87 arr sign byte    64    3 CType[2000]
 10925                                  ;   88 arr sign word    65    2 FAdr[300]
 10926                                  ;   89 arr sign word    65    4 CAdr[2000]
 10927                                  ;   90 arr sign word    66    4 FCalls[300]
 10928                                  ;   91 arr sign byte    67    5 FNameField[4800]
 10929                                  ;   92 arr sign byte    68    7 NameA[32]
 10930                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 10931                                  ;   94 ptr unsg byte    69    8 CNameTop
 10932                                  ;   95 ptr unsg byte    70   10 fgetsp
 10933                                  ;   96 var unsg word    70    4 segE
 10934                                  ;   97 var unsg word    71   12 lineno
 10935                                  ;   98 var unsg word    71    2 linenoinclude
 10936                                  ;   99 ptr unsg byte    72   17 pt
 10937                                  ;  100 ptr unsg byte    72    8 p1
 10938                                  ;  101 var sign word    73    9 DOS_ERR
 10939                                  ;  102 var sign word    73    5 DOS_NoBytes
 10940                                  ;  103 var sign byte    73    3 DOS_ByteRead
 10941                                  ;  104 arr sign byte   131    2 doglobName[15]
 10942                                  ;  105 var sign word   297    5 mod1
 10943                                  ;  106 var sign word   297   12 ireg1
 10944                                  ;  107 var sign word   297    6 idx1
 10945                                  ;  108 var sign word   297    1 ids1
 10946                                  ;  109 var sign word   297    4 idw1
 10947                                  ;  110 var sign word   297    2 idt1
 10948                                  ;  111 var sign word   297 NULL val1
 10949                                  ;  112 var sign word   298    2 mod2
 10950                                  ;  113 var sign word   298    6 ireg2
 10951                                  ;  114 var sign word   298    6 idx2
 10952                                  ;  115 var sign word   298    1 ids2
 10953                                  ;  116 var sign word   298    4 idw2
 10954                                  ;  117 var sign word   298    2 idt2
 10955                                  ;  118 var sign word   298    2 val2
 10956                                  ;  119 arr sign byte   363    9 ops[5]
 10957                                  ;  120 arr sign byte   405    3 printregstr[74]
 10958                                  ;  121 var sign word   413    1 evalue
 10959                                  ;  122 var sign word   413    1 exprtype
 10960                                  ;  123 arr sign word   565    2 docalltype[10]
 10961                                  ;  124 arr sign word   565    2 docallvalue[10]
 10962                                  ;  125 arr sign byte   566    2 procname[17]
 10963                                  ;  126 ptr sign byte   621    1 arglen
 10964                                  ;  127 ptr sign byte   621    2 argv
 10965                                  ;  128 arr sign byte   762    2 symboltemp[80]
 10966                                  ;  129 var unsg word   943    1 MAXUI
 10967                                  
 10968                                  
 10969                                  ;   # Calls Line Width  Name   list of functions
 10970                                  
 10971                                  ;    0    4   75   writetty
 10972                                  ;    1    1   76   putch
 10973                                  ;    2    6   77   cputs
 10974                                  ;    3    3   78   mkneg
 10975                                  ;    4    8   80   DosInt
 10976                                  ;    5    2   85   openR
 10977                                  ;    6    1   86   creatR
 10978                                  ;    7    2   87   fcloseR
 10979                                  ;    8    3   88   exitR
 10980                                  ;    9    2   89   readRL
 10981                                  ;   10    1   90   fputcR
 10982                                  ;   11    8   93   strlen
 10983                                  ;   12   24   94   strcpy
 10984                                  ;   13   74   95   eqstr
 10985                                  ;   14    2   98   instr1
 10986                                  ;   15    1   99   strcat1
 10987                                  ;   16    1  100   toupper
 10988                                  ;   17    3  102   digit
 10989                                  ;   18    1  107   letter
 10990                                  ;   19    3  117   alnum
 10991                                  ;   20    4  122   a
 10992                                  ;   21   21  123   v
 10993                                  ;   22    4  128   checknamelen
 10994                                  ;   23    1  132   doglob
 10995                                  ;   24   12  181   gettypes
 10996                                  ;   25    9  190   adrofname
 10997                                  ;   26    7  191   adrF
 10998                                  ;   27    4  193   printName
 10999                                  ;   28   12  197   searchname
 11000                                  ;   29    3  201   checkName
 11001                                  ;   30   10  206   typeName
 11002                                  ;   31    3  222   name1
 11003                                  ;   32    1  227   storecall
 11004                                  ;   33    2  233   storefunc
 11005                                  ;   34    2  237   addlocal
 11006                                  ;   35    1  243   checkFunction
 11007                                  ;   36    1  246   dofunc
 11008                                  ;   37    1  287   isvariable
 11009                                  ;   38    3  300   pexpr
 11010                                  ;   39    1  307   constantexpr
 11011                                  ;   40    3  317   exprstart
 11012                                  ;   41    1  319   expr2
 11013                                  ;   42    3  364   doreg1
 11014                                  ;   43    6  383   checkreg
 11015                                  ;   44    6  408   printreg
 11016                                  ;   45    2  414   expr
 11017                                  ;   46    4  463   compoundass
 11018                                  ;   47    2  470   dovar1
 11019                                  ;   48    8  491   rterm
 11020                                  ;   49    1  504   isreg
 11021                                  ;   50   15  522   doreg
 11022                                  ;   51    1  528   doassign
 11023                                  ;   52    1  546   domul
 11024                                  ;   53    2  550   doidiv
 11025                                  ;   54    1  563   domod
 11026                                  ;   55    1  567   docall1
 11027                                  ;   56 NULL  609   main
 11028                                  ;   57    2  620   getfirstchar
 11029                                  ;   58    1  622   getarg
 11030                                  ;   59    2  640   parse
 11031                                  ;   60    1  649   checkcalls
 11032                                  ;   61    1  666   doinclude
 11033                                  ;   62    1  677   dodefine
 11034                                  ;   63    6  693   stmt
 11035                                  ;   64    1  724   doemit
 11036                                  ;   65    3  728   cmpneg
 11037                                  ;   66    7  741   prlabel
 11038                                  ;   67    3  742   prjump
 11039                                  ;   68    1  743   doif
 11040                                  ;   69    1  749   dodo
 11041                                  ;   70    1  753   dowhile
 11042                                  ;   71    4  756   isrelational
 11043                                  ;   72   17  763   getlex
 11044                                  ;   73    1  815   convertdefine
 11045                                  ;   74    1  822   getdigit
 11046                                  ;   75    1  831   getstring
 11047                                  ;   76   31  834   next
 11048                                  ;   77   78  835   istoken
 11049                                  ;   78   36  836   expect
 11050                                  ;   79    6  839   eprc
 11051                                  ;   80    5  840   eprs
 11052                                  ;   81   41  841   prc
 11053                                  ;   82    3  846   prscomment
 11054                                  ;   83    8  848   prnl
 11055                                  ;   84  249  850   prs
 11056                                  ;   85    2  855   eprnum
 11057                                  ;   86    7  857   pint1
 11058                                  ;   87   35  859   prunsign1
 11059                                  ;   88   25  862   printint51
 11060                                  ;   89    2  866   fgets1
 11061                                  ;   90    1  870   printinputline
 11062                                  ;   91    2  878   end1
 11063                                  ;   92   50  879   error1
 11064                                  ;   93    2  888   listproc
 11065                                  ;   94    2  896   listvar
 11066                                  ;   95    1  912   listcall
 11067                                  ;   96    1  915   calllisting
 11068                                  ;   97    1  921   countcalls
 11069                                  ;   98    1  929   listfunc
 11070                                  ;   99    1  933   funclisting
 11071                                  ;  100    1  944   epilog
 11072                                  ;  101    1  976   setblock
 11073                                  ;  102    1  978   allocmem
 11074                                  ;  103 NULL  982   copyF
 11075                                  ;  104    1  988   to_far
 11076                                  ;  105    3  996   from_far
 11077                                  ;  106 NULL 1004   LastFunctionByt
 11078                                  
 11079                                  ;    #  addr name   list of CALLs
 11080                                  
 11081                                  ;    0     0 writetty
 11082                                  ;    1     9 writetty
 11083                                  ;    2    18 putch
 11084                                  ;    3    24 DosInt
 11085                                  ;    4    31 DosInt
 11086                                  ;    5    38 DosInt
 11087                                  ;    6    45 DosInt
 11088                                  ;    7    52 DosInt
 11089                                  ;    8    59 DosInt
 11090                                  ;    9    66 strcpy
 11091                                  ;   10    73 digit
 11092                                  ;   11    79 letter
 11093                                  ;   12    86 printName
 11094                                  ;   13    96 prc
 11095                                  ;   14   100 printName
 11096                                  ;   15   110 prc
 11097                                  ;   16   114 strlen
 11098                                  ;   17   121 error1
 11099                                  ;   18   128 error1
 11100                                  ;   19   135 error1
 11101                                  ;   20   142 checknamelen
 11102                                  ;   21   155 checkName
 11103                                  ;   22   165 error1
 11104                                  ;   23   172 istoken
 11105                                  ;   24   180 istoken
 11106                                  ;   25   188 prs
 11107                                  ;   26   192 prunsign1
 11108                                  ;   27   202 prs
 11109                                  ;   28   206 prs
 11110                                  ;   29   210 prs
 11111                                  ;   30   214 prs
 11112                                  ;   31   218 prs
 11113                                  ;   32   222 prunsign1
 11114                                  ;   33   232 prs
 11115                                  ;   34   236 expect
 11116                                  ;   35   243 expect
 11117                                  ;   36   250 error1
 11118                                  ;   37   257 prs
 11119                                  ;   38   261 prs
 11120                                  ;   39   265 prs
 11121                                  ;   40   269 strcpy
 11122                                  ;   41   276 expect
 11123                                  ;   42   283 istoken
 11124                                  ;   43   291 prc
 11125                                  ;   44   295 prscomment
 11126                                  ;   45   306 prc
 11127                                  ;   46   310 prs
 11128                                  ;   47   314 strlen
 11129                                  ;   48   321 istoken
 11130                                  ;   49   329 prc
 11131                                  ;   50   333 expect
 11132                                  ;   51   340 prunsign1
 11133                                  ;   52   350 istoken
 11134                                  ;   53   358 expect
 11135                                  ;   54   365 error1
 11136                                  ;   55   372 prs
 11137                                  ;   56   376 prs
 11138                                  ;   57   380 prs
 11139                                  ;   58   384 prs
 11140                                  ;   59   388 prs
 11141                                  ;   60   392 prs
 11142                                  ;   61   396 istoken
 11143                                  ;   62   404 prc
 11144                                  ;   63   408 istoken
 11145                                  ;   64   416 expect
 11146                                  ;   65   423 prunsign1
 11147                                  ;   66   433 prunsign1
 11148                                  ;   67   443 adrofname
 11149                                  ;   68   453 strcpy
 11150                                  ;   69   460 strcpy
 11151                                  ;   70   467 expect
 11152                                  ;   71   474 adrF
 11153                                  ;   72   479 adrofname
 11154                                  ;   73   489 prs
 11155                                  ;   74   493 prs
 11156                                  ;   75   497 prc
 11157                                  ;   76   501 pint1
 11158                                  ;   77   507 prc
 11159                                  ;   78   511 checkName
 11160                                  ;   79   521 error1
 11161                                  ;   80   528 adrofname
 11162                                  ;   81   538 eqstr
 11163                                  ;   82   544 adrofname
 11164                                  ;   83   554 eqstr
 11165                                  ;   84   560 istoken
 11166                                  ;   85   568 istoken
 11167                                  ;   86   576 istoken
 11168                                  ;   87   584 istoken
 11169                                  ;   88   592 istoken
 11170                                  ;   89   600 istoken
 11171                                  ;   90   608 istoken
 11172                                  ;   91   616 istoken
 11173                                  ;   92   624 name1
 11174                                  ;   93   630 error1
 11175                                  ;   94   637 getlex
 11176                                  ;   95   644 error1
 11177                                  ;   96   651 error1
 11178                                  ;   97   658 strlen
 11179                                  ;   98   665 to_far
 11180                                  ;   99   672 error1
 11181                                  ;  100   679 adrF
 11182                                  ;  101   684 strcpy
 11183                                  ;  102   691 error1
 11184                                  ;  103   698 checkName
 11185                                  ;  104   708 error1
 11186                                  ;  105   715 adrF
 11187                                  ;  106   720 strcpy
 11188                                  ;  107   727 adrF
 11189                                  ;  108   732 eqstr
 11190                                  ;  109   738 checknamelen
 11191                                  ;  110   751 strcpy
 11192                                  ;  111   758 checkFunction
 11193                                  ;  112   772 error1
 11194                                  ;  113   779 storefunc
 11195                                  ;  114   789 prs
 11196                                  ;  115   793 prs
 11197                                  ;  116   797 prs
 11198                                  ;  117   801 expect
 11199                                  ;  118   808 istoken
 11200                                  ;  119   816 typeName
 11201                                  ;  120   825 addlocal
 11202                                  ;  121   834 istoken
 11203                                  ;  122   842 expect
 11204                                  ;  123   849 expect
 11205                                  ;  124   856 isvariable
 11206                                  ;  125   867 typeName
 11207                                  ;  126   876 checknamelen
 11208                                  ;  127   889 addlocal
 11209                                  ;  128   898 istoken
 11210                                  ;  129   906 expect
 11211                                  ;  130   913 expect
 11212                                  ;  131   920 istoken
 11213                                  ;  132   928 expect
 11214                                  ;  133   935 listproc
 11215                                  ;  134   944 prs
 11216                                  ;  135   948 mkneg
 11217                                  ;  136   954 prunsign1
 11218                                  ;  137   964 prs
 11219                                  ;  138   968 istoken
 11220                                  ;  139   976 stmt
 11221                                  ;  140   981 prs
 11222                                  ;  141   985 prs
 11223                                  ;  142   989 prc
 11224                                  ;  143   993 prs
 11225                                  ;  144   997 prs
 11226                                  ;  145  1001 prs
 11227                                  ;  146  1005 strlen
 11228                                  ;  147  1012 strcpy
 11229                                  ;  148  1019 prs
 11230                                  ;  149  1023 expect
 11231                                  ;  150  1030 eqstr
 11232                                  ;  151  1036 constantexpr
 11233                                  ;  152  1049 checkreg
 11234                                  ;  153  1058 doreg1
 11235                                  ;  154  1065 exprstart
 11236                                  ;  155  1075 prs
 11237                                  ;  156  1079 prs
 11238                                  ;  157  1083 expect
 11239                                  ;  158  1090 getlex
 11240                                  ;  159  1097 typeName
 11241                                  ;  160  1106 searchname
 11242                                  ;  161  1117 gettypes
 11243                                  ;  162  1126 isrelational
 11244                                  ;  163  1139 error1
 11245                                  ;  164  1146 expect
 11246                                  ;  165  1153 prs
 11247                                  ;  166  1157 prs
 11248                                  ;  167  1161 gettypes
 11249                                  ;  168  1170 prs
 11250                                  ;  169  1174 prs
 11251                                  ;  170  1178 v
 11252                                  ;  171  1180 prs
 11253                                  ;  172  1184 prunsign1
 11254                                  ;  173  1194 cmpneg
 11255                                  ;  174  1201 prs
 11256                                  ;  175  1205 expect
 11257                                  ;  176  1212 eqstr
 11258                                  ;  177  1218 expr2
 11259                                  ;  178  1224 expr
 11260                                  ;  179  1229 getlex
 11261                                  ;  180  1236 typeName
 11262                                  ;  181  1245 error1
 11263                                  ;  182  1252 checkreg
 11264                                  ;  183  1261 doreg1
 11265                                  ;  184  1268 searchname
 11266                                  ;  185  1279 gettypes
 11267                                  ;  186  1288 error1
 11268                                  ;  187  1295 isrelational
 11269                                  ;  188  1308 error1
 11270                                  ;  189  1315 istoken
 11271                                  ;  190  1323 error1
 11272                                  ;  191  1330 istoken
 11273                                  ;  192  1338 prs
 11274                                  ;  193  1342 prs
 11275                                  ;  194  1346 prs
 11276                                  ;  195  1350 prs
 11277                                  ;  196  1354 prs
 11278                                  ;  197  1358 v
 11279                                  ;  198  1360 prs
 11280                                  ;  199  1364 prunsign1
 11281                                  ;  200  1374 adrofname
 11282                                  ;  201  1384 prs
 11283                                  ;  202  1388 prs
 11284                                  ;  203  1392 typeName
 11285                                  ;  204  1401 checkreg
 11286                                  ;  205  1410 prs
 11287                                  ;  206  1414 printreg
 11288                                  ;  207  1423 v
 11289                                  ;  208  1425 prs
 11290                                  ;  209  1429 printreg
 11291                                  ;  210  1438 error1
 11292                                  ;  211  1445 searchname
 11293                                  ;  212  1456 gettypes
 11294                                  ;  213  1465 error1
 11295                                  ;  214  1472 prs
 11296                                  ;  215  1476 printreg
 11297                                  ;  216  1485 error1
 11298                                  ;  217  1492 prs
 11299                                  ;  218  1496 a
 11300                                  ;  219  1498 prs
 11301                                  ;  220  1502 prs
 11302                                  ;  221  1506 prs
 11303                                  ;  222  1510 v
 11304                                  ;  223  1512 adrofname
 11305                                  ;  224  1522 prs
 11306                                  ;  225  1526 prs
 11307                                  ;  226  1530 error1
 11308                                  ;  227  1537 istoken
 11309                                  ;  228  1545 strcpy
 11310                                  ;  229  1552 istoken
 11311                                  ;  230  1560 strcpy
 11312                                  ;  231  1567 istoken
 11313                                  ;  232  1575 strcpy
 11314                                  ;  233  1582 istoken
 11315                                  ;  234  1590 strcpy
 11316                                  ;  235  1597 istoken
 11317                                  ;  236  1605 strcpy
 11318                                  ;  237  1612 istoken
 11319                                  ;  238  1620 strcpy
 11320                                  ;  239  1627 istoken
 11321                                  ;  240  1635 strcpy
 11322                                  ;  241  1642 getlex
 11323                                  ;  242  1649 isrelational
 11324                                  ;  243  1662 error1
 11325                                  ;  244  1669 strcpy
 11326                                  ;  245  1676 prnl
 11327                                  ;  246  1681 prs
 11328                                  ;  247  1685 prs
 11329                                  ;  248  1689 printreg
 11330                                  ;  249  1698 prs
 11331                                  ;  250  1702 istoken
 11332                                  ;  251  1710 prunsign1
 11333                                  ;  252  1720 typeName
 11334                                  ;  253  1729 checkreg
 11335                                  ;  254  1738 printreg
 11336                                  ;  255  1747 searchname
 11337                                  ;  256  1758 a
 11338                                  ;  257  1760 v
 11339                                  ;  258  1762 cmpneg
 11340                                  ;  259  1769 prs
 11341                                  ;  260  1773 expect
 11342                                  ;  261  1780 strlen
 11343                                  ;  262  1787 eqstr
 11344                                  ;  263  1793 eqstr
 11345                                  ;  264  1799 eqstr
 11346                                  ;  265  1805 eqstr
 11347                                  ;  266  1811 eqstr
 11348                                  ;  267  1817 eqstr
 11349                                  ;  268  1823 eqstr
 11350                                  ;  269  1829 eqstr
 11351                                  ;  270  1835 eqstr
 11352                                  ;  271  1841 eqstr
 11353                                  ;  272  1847 eqstr
 11354                                  ;  273  1853 eqstr
 11355                                  ;  274  1859 eqstr
 11356                                  ;  275  1865 eqstr
 11357                                  ;  276  1871 eqstr
 11358                                  ;  277  1877 eqstr
 11359                                  ;  278  1883 eqstr
 11360                                  ;  279  1889 eqstr
 11361                                  ;  280  1895 eqstr
 11362                                  ;  281  1901 eqstr
 11363                                  ;  282  1907 eqstr
 11364                                  ;  283  1913 eqstr
 11365                                  ;  284  1919 strlen
 11366                                  ;  285  1926 eqstr
 11367                                  ;  286  1932 eqstr
 11368                                  ;  287  1938 eqstr
 11369                                  ;  288  1944 eqstr
 11370                                  ;  289  1950 eqstr
 11371                                  ;  290  1956 eqstr
 11372                                  ;  291  1962 eqstr
 11373                                  ;  292  1968 eqstr
 11374                                  ;  293  1974 eqstr
 11375                                  ;  294  1980 prc
 11376                                  ;  295  1984 prc
 11377                                  ;  296  1988 prc
 11378                                  ;  297  1992 istoken
 11379                                  ;  298  2000 prs
 11380                                  ;  299  2004 prunsign1
 11381                                  ;  300  2014 typeName
 11382                                  ;  301  2023 checkreg
 11383                                  ;  302  2032 doreg1
 11384                                  ;  303  2039 docall1
 11385                                  ;  304  2047 isreg
 11386                                  ;  305  2053 searchname
 11387                                  ;  306  2064 gettypes
 11388                                  ;  307  2073 istoken
 11389                                  ;  308  2081 istoken
 11390                                  ;  309  2089 expect
 11391                                  ;  310  2096 searchname
 11392                                  ;  311  2107 expect
 11393                                  ;  312  2114 expect
 11394                                  ;  313  2121 gettypes
 11395                                  ;  314  2130 error1
 11396                                  ;  315  2137 istoken
 11397                                  ;  316  2145 error1
 11398                                  ;  317  2152 prs
 11399                                  ;  318  2156 prs
 11400                                  ;  319  2160 prs
 11401                                  ;  320  2164 v
 11402                                  ;  321  2166 istoken
 11403                                  ;  322  2174 error1
 11404                                  ;  323  2181 prs
 11405                                  ;  324  2185 prs
 11406                                  ;  325  2189 prs
 11407                                  ;  326  2193 v
 11408                                  ;  327  2195 istoken
 11409                                  ;  328  2203 compoundass
 11410                                  ;  329  2215 istoken
 11411                                  ;  330  2223 compoundass
 11412                                  ;  331  2235 istoken
 11413                                  ;  332  2243 compoundass
 11414                                  ;  333  2255 istoken
 11415                                  ;  334  2263 compoundass
 11416                                  ;  335  2275 istoken
 11417                                  ;  336  2283 error1
 11418                                  ;  337  2290 istoken
 11419                                  ;  338  2298 error1
 11420                                  ;  339  2305 istoken
 11421                                  ;  340  2313 expr
 11422                                  ;  341  2318 doassign
 11423                                  ;  342  2327 dovar1
 11424                                  ;  343  2334 istoken
 11425                                  ;  344  2342 rterm
 11426                                  ;  345  2348 istoken
 11427                                  ;  346  2356 rterm
 11428                                  ;  347  2362 istoken
 11429                                  ;  348  2370 rterm
 11430                                  ;  349  2376 istoken
 11431                                  ;  350  2384 rterm
 11432                                  ;  351  2390 istoken
 11433                                  ;  352  2398 rterm
 11434                                  ;  353  2404 istoken
 11435                                  ;  354  2412 rterm
 11436                                  ;  355  2418 istoken
 11437                                  ;  356  2426 domul
 11438                                  ;  357  2432 istoken
 11439                                  ;  358  2440 doidiv
 11440                                  ;  359  2447 istoken
 11441                                  ;  360  2455 domod
 11442                                  ;  361  2461 isrelational
 11443                                  ;  362  2474 rterm
 11444                                  ;  363  2480 cmpneg
 11445                                  ;  364  2487 error1
 11446                                  ;  365  2494 prnl
 11447                                  ;  366  2499 prs
 11448                                  ;  367  2503 prs
 11449                                  ;  368  2507 gettypes
 11450                                  ;  369  2516 prs
 11451                                  ;  370  2520 prs
 11452                                  ;  371  2524 v
 11453                                  ;  372  2526 prs
 11454                                  ;  373  2530 expect
 11455                                  ;  374  2537 prunsign1
 11456                                  ;  375  2547 gettypes
 11457                                  ;  376  2556 prs
 11458                                  ;  377  2560 v
 11459                                  ;  378  2562 prnl
 11460                                  ;  379  2567 prs
 11461                                  ;  380  2571 prs
 11462                                  ;  381  2575 prs
 11463                                  ;  382  2579 prnl
 11464                                  ;  383  2584 prs
 11465                                  ;  384  2588 prs
 11466                                  ;  385  2592 a
 11467                                  ;  386  2594 prs
 11468                                  ;  387  2598 v
 11469                                  ;  388  2600 prs
 11470                                  ;  389  2604 prs
 11471                                  ;  390  2608 prs
 11472                                  ;  391  2612 prs
 11473                                  ;  392  2616 prs
 11474                                  ;  393  2620 prc
 11475                                  ;  394  2624 printName
 11476                                  ;  395  2634 prs
 11477                                  ;  396  2638 prnl
 11478                                  ;  397  2643 prs
 11479                                  ;  398  2647 prs
 11480                                  ;  399  2651 prs
 11481                                  ;  400  2655 prs
 11482                                  ;  401  2659 v
 11483                                  ;  402  2661 istoken
 11484                                  ;  403  2669 prnl
 11485                                  ;  404  2674 prs
 11486                                  ;  405  2678 prs
 11487                                  ;  406  2682 prs
 11488                                  ;  407  2686 prs
 11489                                  ;  408  2690 prunsign1
 11490                                  ;  409  2700 typeName
 11491                                  ;  410  2709 searchname
 11492                                  ;  411  2720 istoken
 11493                                  ;  412  2728 searchname
 11494                                  ;  413  2739 expect
 11495                                  ;  414  2746 expect
 11496                                  ;  415  2753 gettypes
 11497                                  ;  416  2762 error1
 11498                                  ;  417  2769 eqstr
 11499                                  ;  418  2775 dovar1
 11500                                  ;  419  2782 eqstr
 11501                                  ;  420  2788 doreg
 11502                                  ;  421  2794 eqstr
 11503                                  ;  422  2800 doreg
 11504                                  ;  423  2806 eqstr
 11505                                  ;  424  2812 doreg
 11506                                  ;  425  2818 eqstr
 11507                                  ;  426  2824 doreg
 11508                                  ;  427  2830 eqstr
 11509                                  ;  428  2836 doreg
 11510                                  ;  429  2842 eqstr
 11511                                  ;  430  2848 doreg
 11512                                  ;  431  2854 eqstr
 11513                                  ;  432  2860 doreg
 11514                                  ;  433  2866 eqstr
 11515                                  ;  434  2872 doreg
 11516                                  ;  435  2878 eqstr
 11517                                  ;  436  2884 doreg
 11518                                  ;  437  2890 eqstr
 11519                                  ;  438  2896 doreg
 11520                                  ;  439  2902 eqstr
 11521                                  ;  440  2908 doreg
 11522                                  ;  441  2914 eqstr
 11523                                  ;  442  2920 doreg
 11524                                  ;  443  2926 eqstr
 11525                                  ;  444  2932 doreg
 11526                                  ;  445  2938 eqstr
 11527                                  ;  446  2944 doreg
 11528                                  ;  447  2950 eqstr
 11529                                  ;  448  2956 doreg
 11530                                  ;  449  2962 expect
 11531                                  ;  450  2969 prs
 11532                                  ;  451  2973 prs
 11533                                  ;  452  2977 prs
 11534                                  ;  453  2981 istoken
 11535                                  ;  454  2989 prunsign1
 11536                                  ;  455  2999 istoken
 11537                                  ;  456  3007 searchname
 11538                                  ;  457  3018 v
 11539                                  ;  458  3020 error1
 11540                                  ;  459  3027 gettypes
 11541                                  ;  460  3036 prs
 11542                                  ;  461  3040 v
 11543                                  ;  462  3042 prs
 11544                                  ;  463  3046 prs
 11545                                  ;  464  3050 prs
 11546                                  ;  465  3054 a
 11547                                  ;  466  3056 prs
 11548                                  ;  467  3060 prs
 11549                                  ;  468  3064 prunsign1
 11550                                  ;  469  3074 v
 11551                                  ;  470  3076 prs
 11552                                  ;  471  3080 prs
 11553                                  ;  472  3084 printName
 11554                                  ;  473  3094 prs
 11555                                  ;  474  3098 prs
 11556                                  ;  475  3102 prs
 11557                                  ;  476  3106 prs
 11558                                  ;  477  3110 v
 11559                                  ;  478  3112 prs
 11560                                  ;  479  3116 prs
 11561                                  ;  480  3120 prs
 11562                                  ;  481  3124 v
 11563                                  ;  482  3126 prs
 11564                                  ;  483  3130 prs
 11565                                  ;  484  3134 prs
 11566                                  ;  485  3138 v
 11567                                  ;  486  3140 prs
 11568                                  ;  487  3144 rterm
 11569                                  ;  488  3150 istoken
 11570                                  ;  489  3158 prs
 11571                                  ;  490  3162 prunsign1
 11572                                  ;  491  3172 prs
 11573                                  ;  492  3176 error1
 11574                                  ;  493  3183 istoken
 11575                                  ;  494  3191 prs
 11576                                  ;  495  3195 prunsign1
 11577                                  ;  496  3205 prs
 11578                                  ;  497  3209 prs
 11579                                  ;  498  3213 typeName
 11580                                  ;  499  3222 searchname
 11581                                  ;  500  3233 error1
 11582                                  ;  501  3240 gettypes
 11583                                  ;  502  3249 error1
 11584                                  ;  503  3256 error1
 11585                                  ;  504  3263 prs
 11586                                  ;  505  3267 v
 11587                                  ;  506  3269 prs
 11588                                  ;  507  3273 prs
 11589                                  ;  508  3277 doidiv
 11590                                  ;  509  3284 prs
 11591                                  ;  510  3288 checknamelen
 11592                                  ;  511  3301 strcpy
 11593                                  ;  512  3308 storecall
 11594                                  ;  513  3318 expect
 11595                                  ;  514  3325 istoken
 11596                                  ;  515  3333 error1
 11597                                  ;  516  3340 istoken
 11598                                  ;  517  3348 istoken
 11599                                  ;  518  3356 eprs
 11600                                  ;  519  3361 eprs
 11601                                  ;  520  3366 eprc
 11602                                  ;  521  3371 eprnum
 11603                                  ;  522  3378 eprs
 11604                                  ;  523  3383 eprc
 11605                                  ;  524  3388 eprs
 11606                                  ;  525  3393 eprc
 11607                                  ;  526  3398 eprs
 11608                                  ;  527  3403 istoken
 11609                                  ;  528  3411 name1
 11610                                  ;  529  3417 searchname
 11611                                  ;  530  3428 istoken
 11612                                  ;  531  3436 checkreg
 11613                                  ;  532  3445 searchname
 11614                                  ;  533  3456 error1
 11615                                  ;  534  3463 istoken
 11616                                  ;  535  3471 expect
 11617                                  ;  536  3478 prs
 11618                                  ;  537  3482 prunsign1
 11619                                  ;  538  3492 prs
 11620                                  ;  539  3496 prs
 11621                                  ;  540  3500 prc
 11622                                  ;  541  3504 prunsign1
 11623                                  ;  542  3514 prs
 11624                                  ;  543  3518 v
 11625                                  ;  544  3520 prs
 11626                                  ;  545  3524 gettypes
 11627                                  ;  546  3533 prs
 11628                                  ;  547  3537 v
 11629                                  ;  548  3539 prs
 11630                                  ;  549  3543 v
 11631                                  ;  550  3545 prs
 11632                                  ;  551  3549 prs
 11633                                  ;  552  3553 printreg
 11634                                  ;  553  3562 prs
 11635                                  ;  554  3566 prs
 11636                                  ;  555  3570 prs
 11637                                  ;  556  3574 prunsign1
 11638                                  ;  557  3584 getarg
 11639                                  ;  558  3591 setblock
 11640                                  ;  559  3600 error1
 11641                                  ;  560  3607 allocmem
 11642                                  ;  561  3616 error1
 11643                                  ;  562  3623 getfirstchar
 11644                                  ;  563  3636 parse
 11645                                  ;  564  3642 checkcalls
 11646                                  ;  565  3653 epilog
 11647                                  ;  566  3660 fgets1
 11648                                  ;  567  3667 cputs
 11649                                  ;  568  3673 cputs
 11650                                  ;  569  3679 readRL
 11651                                  ;  570  3686 prnl
 11652                                  ;  571  3691 strcpy
 11653                                  ;  572  3698 instr1
 11654                                  ;  573  3705 strcat1
 11655                                  ;  574  3713 toupper
 11656                                  ;  575  3721 strcpy
 11657                                  ;  576  3728 strlen
 11658                                  ;  577  3735 openR
 11659                                  ;  578  3741 cputs
 11660                                  ;  579  3747 cputs
 11661                                  ;  580  3753 exitR
 11662                                  ;  581  3759 creatR
 11663                                  ;  582  3766 cputs
 11664                                  ;  583  3772 cputs
 11665                                  ;  584  3778 exitR
 11666                                  ;  585  3784 prs
 11667                                  ;  586  3788 prs
 11668                                  ;  587  3792 prs
 11669                                  ;  588  3796 prs
 11670                                  ;  589  3800 prs
 11671                                  ;  590  3804 prs
 11672                                  ;  591  3808 prs
 11673                                  ;  592  3812 getlex
 11674                                  ;  593  3819 istoken
 11675                                  ;  594  3827 istoken
 11676                                  ;  595  3835 dodefine
 11677                                  ;  596  3844 istoken
 11678                                  ;  597  3852 doinclude
 11679                                  ;  598  3862 error1
 11680                                  ;  599  3869 typeName
 11681                                  ;  600  3878 dofunc
 11682                                  ;  601  3885 doglob
 11683                                  ;  602  3892 prs
 11684                                  ;  603  3896 from_far
 11685                                  ;  604  3905 adrF
 11686                                  ;  605  3910 eqstr
 11687                                  ;  606  3916 prs
 11688                                  ;  607  3920 prs
 11689                                  ;  608  3924 prs
 11690                                  ;  609  3928 printint51
 11691                                  ;  610  3939 error1
 11692                                  ;  611  3946 prs
 11693                                  ;  612  3950 prs
 11694                                  ;  613  3954 prs
 11695                                  ;  614  3958 openR
 11696                                  ;  615  3964 prs
 11697                                  ;  616  3968 prs
 11698                                  ;  617  3972 error1
 11699                                  ;  618  3979 parse
 11700                                  ;  619  3985 prs
 11701                                  ;  620  3989 prs
 11702                                  ;  621  3993 getfirstchar
 11703                                  ;  622  4006 getlex
 11704                                  ;  623  4013 eqstr
 11705                                  ;  624  4019 getlex
 11706                                  ;  625  4026 eqstr
 11707                                  ;  626  4032 getlex
 11708                                  ;  627  4039 prs
 11709                                  ;  628  4043 strcpy
 11710                                  ;  629  4050 prs
 11711                                  ;  630  4054 error1
 11712                                  ;  631  4061 getlex
 11713                                  ;  632  4068 expect
 11714                                  ;  633  4075 error1
 11715                                  ;  634  4082 strlen
 11716                                  ;  635  4089 error1
 11717                                  ;  636  4096 adrofname
 11718                                  ;  637  4106 strcpy
 11719                                  ;  638  4113 expect
 11720                                  ;  639  4120 istoken
 11721                                  ;  640  4128 istoken
 11722                                  ;  641  4136 stmt
 11723                                  ;  642  4141 istoken
 11724                                  ;  643  4149 doif
 11725                                  ;  644  4154 istoken
 11726                                  ;  645  4162 dodo
 11727                                  ;  646  4167 istoken
 11728                                  ;  647  4175 dowhile
 11729                                  ;  648  4183 istoken
 11730                                  ;  649  4191 prs
 11731                                  ;  650  4195 name1
 11732                                  ;  651  4201 prs
 11733                                  ;  652  4205 expect
 11734                                  ;  653  4212 prs
 11735                                  ;  654  4216 next
 11736                                  ;  655  4221 prc
 11737                                  ;  656  4225 next
 11738                                  ;  657  4230 getlex
 11739                                  ;  658  4237 istoken
 11740                                  ;  659  4245 prs
 11741                                  ;  660  4249 next
 11742                                  ;  661  4254 prc
 11743                                  ;  662  4258 next
 11744                                  ;  663  4263 getlex
 11745                                  ;  664  4270 error1
 11746                                  ;  665  4277 istoken
 11747                                  ;  666  4285 doemit
 11748                                  ;  667  4292 istoken
 11749                                  ;  668  4300 istoken
 11750                                  ;  669  4308 exprstart
 11751                                  ;  670  4318 prs
 11752                                  ;  671  4322 prs
 11753                                  ;  672  4326 expect
 11754                                  ;  673  4333 prs
 11755                                  ;  674  4337 prs
 11756                                  ;  675  4341 prc
 11757                                  ;  676  4345 expect
 11758                                  ;  677  4352 expect
 11759                                  ;  678  4359 exprstart
 11760                                  ;  679  4369 expect
 11761                                  ;  680  4376 prs
 11762                                  ;  681  4380 getlex
 11763                                  ;  682  4387 prunsign1
 11764                                  ;  683  4397 getlex
 11765                                  ;  684  4404 prc
 11766                                  ;  685  4408 expect
 11767                                  ;  686  4415 prs
 11768                                  ;  687  4419 prs
 11769                                  ;  688  4423 prs
 11770                                  ;  689  4427 prs
 11771                                  ;  690  4431 prs
 11772                                  ;  691  4435 prunsign1
 11773                                  ;  692  4445 prs
 11774                                  ;  693  4449 prs
 11775                                  ;  694  4453 prunsign1
 11776                                  ;  695  4463 prs
 11777                                  ;  696  4467 prs
 11778                                  ;  697  4471 prs
 11779                                  ;  698  4475 error1
 11780                                  ;  699  4482 prs
 11781                                  ;  700  4486 prs
 11782                                  ;  701  4490 prunsign1
 11783                                  ;  702  4500 prc
 11784                                  ;  703  4504 prs
 11785                                  ;  704  4508 prs
 11786                                  ;  705  4512 prunsign1
 11787                                  ;  706  4522 pexpr
 11788                                  ;  707  4528 pint1
 11789                                  ;  708  4534 stmt
 11790                                  ;  709  4539 istoken
 11791                                  ;  710  4547 prjump
 11792                                  ;  711  4554 prlabel
 11793                                  ;  712  4562 stmt
 11794                                  ;  713  4567 prlabel
 11795                                  ;  714  4575 prlabel
 11796                                  ;  715  4583 prlabel
 11797                                  ;  716  4591 stmt
 11798                                  ;  717  4596 expect
 11799                                  ;  718  4603 pexpr
 11800                                  ;  719  4609 pint1
 11801                                  ;  720  4615 prjump
 11802                                  ;  721  4622 prlabel
 11803                                  ;  722  4630 prlabel
 11804                                  ;  723  4638 pexpr
 11805                                  ;  724  4644 pint1
 11806                                  ;  725  4650 stmt
 11807                                  ;  726  4655 prjump
 11808                                  ;  727  4662 prlabel
 11809                                  ;  728  4670 getlex
 11810                                  ;  729  4677 next
 11811                                  ;  730  4682 next
 11812                                  ;  731  4687 next
 11813                                  ;  732  4692 next
 11814                                  ;  733  4697 next
 11815                                  ;  734  4702 next
 11816                                  ;  735  4707 next
 11817                                  ;  736  4712 next
 11818                                  ;  737  4717 next
 11819                                  ;  738  4722 next
 11820                                  ;  739  4727 next
 11821                                  ;  740  4732 next
 11822                                  ;  741  4737 next
 11823                                  ;  742  4742 next
 11824                                  ;  743  4747 next
 11825                                  ;  744  4752 instr1
 11826                                  ;  745  4759 next
 11827                                  ;  746  4764 getlex
 11828                                  ;  747  4771 next
 11829                                  ;  748  4776 next
 11830                                  ;  749  4781 getlex
 11831                                  ;  750  4788 getstring
 11832                                  ;  751  4798 digit
 11833                                  ;  752  4804 getdigit
 11834                                  ;  753  4813 next
 11835                                  ;  754  4818 next
 11836                                  ;  755  4823 next
 11837                                  ;  756  4828 alnum
 11838                                  ;  757  4834 strcpy
 11839                                  ;  758  4841 alnum
 11840                                  ;  759  4847 next
 11841                                  ;  760  4852 eqstr
 11842                                  ;  761  4858 eqstr
 11843                                  ;  762  4864 eqstr
 11844                                  ;  763  4870 eqstr
 11845                                  ;  764  4876 eqstr
 11846                                  ;  765  4882 eqstr
 11847                                  ;  766  4888 eqstr
 11848                                  ;  767  4894 eqstr
 11849                                  ;  768  4900 eqstr
 11850                                  ;  769  4906 eqstr
 11851                                  ;  770  4912 eqstr
 11852                                  ;  771  4918 eqstr
 11853                                  ;  772  4924 eqstr
 11854                                  ;  773  4930 eqstr
 11855                                  ;  774  4936 eqstr
 11856                                  ;  775  4942 eqstr
 11857                                  ;  776  4948 eqstr
 11858                                  ;  777  4954 convertdefine
 11859                                  ;  778  4968 strcpy
 11860                                  ;  779  4975 error1
 11861                                  ;  780  4982 adrofname
 11862                                  ;  781  4992 eqstr
 11863                                  ;  782  4998 next
 11864                                  ;  783  5003 alnum
 11865                                  ;  784  5009 next
 11866                                  ;  785  5014 digit
 11867                                  ;  786  5020 next
 11868                                  ;  787  5025 next
 11869                                  ;  788  5030 next
 11870                                  ;  789  5035 fgets1
 11871                                  ;  790  5042 getlex
 11872                                  ;  791  5049 istoken
 11873                                  ;  792  5057 prs
 11874                                  ;  793  5061 listproc
 11875                                  ;  794  5070 prs
 11876                                  ;  795  5074 pint1
 11877                                  ;  796  5080 error1
 11878                                  ;  797  5087 eprc
 11879                                  ;  798  5092 writetty
 11880                                  ;  799  5101 writetty
 11881                                  ;  800  5110 fputcR
 11882                                  ;  801  5117 prc
 11883                                  ;  802  5121 prs
 11884                                  ;  803  5125 prc
 11885                                  ;  804  5129 eprc
 11886                                  ;  805  5134 mkneg
 11887                                  ;  806  5140 eprnum
 11888                                  ;  807  5147 eprc
 11889                                  ;  808  5152 prc
 11890                                  ;  809  5156 mkneg
 11891                                  ;  810  5162 pint1
 11892                                  ;  811  5168 prc
 11893                                  ;  812  5172 prunsign1
 11894                                  ;  813  5182 prc
 11895                                  ;  814  5186 prc
 11896                                  ;  815  5190 prc
 11897                                  ;  816  5194 prc
 11898                                  ;  817  5198 prc
 11899                                  ;  818  5202 prunsign1
 11900                                  ;  819  5212 printinputline
 11901                                  ;  820  5227 readRL
 11902                                  ;  821  5234 prs
 11903                                  ;  822  5238 prunsign1
 11904                                  ;  823  5248 prc
 11905                                  ;  824  5252 prscomment
 11906                                  ;  825  5263 fcloseR
 11907                                  ;  826  5271 fcloseR
 11908                                  ;  827  5279 exitR
 11909                                  ;  828  5285 prnl
 11910                                  ;  829  5290 prscomment
 11911                                  ;  830  5301 prs
 11912                                  ;  831  5305 prunsign1
 11913                                  ;  832  5315 prs
 11914                                  ;  833  5319 prs
 11915                                  ;  834  5323 prs
 11916                                  ;  835  5327 prunsign1
 11917                                  ;  836  5337 prs
 11918                                  ;  837  5341 prunsign1
 11919                                  ;  838  5351 prs
 11920                                  ;  839  5355 prc
 11921                                  ;  840  5359 prs
 11922                                  ;  841  5363 prunsign1
 11923                                  ;  842  5373 prs
 11924                                  ;  843  5377 prs
 11925                                  ;  844  5381 end1
 11926                                  ;  845  5386 prs
 11927                                  ;  846  5390 prs
 11928                                  ;  847  5394 prs
 11929                                  ;  848  5398 prunsign1
 11930                                  ;  849  5408 prs
 11931                                  ;  850  5412 listvar
 11932                                  ;  851  5420 prs
 11933                                  ;  852  5424 printint51
 11934                                  ;  853  5435 prc
 11935                                  ;  854  5439 prs
 11936                                  ;  855  5443 prs
 11937                                  ;  856  5447 prs
 11938                                  ;  857  5451 prs
 11939                                  ;  858  5455 prs
 11940                                  ;  859  5459 prs
 11941                                  ;  860  5463 prs
 11942                                  ;  861  5467 prs
 11943                                  ;  862  5471 prs
 11944                                  ;  863  5475 printint51
 11945                                  ;  864  5486 printint51
 11946                                  ;  865  5497 prs
 11947                                  ;  866  5501 prs
 11948                                  ;  867  5505 prc
 11949                                  ;  868  5509 adrofname
 11950                                  ;  869  5519 prs
 11951                                  ;  870  5523 prc
 11952                                  ;  871  5527 prunsign1
 11953                                  ;  872  5537 prc
 11954                                  ;  873  5541 prunsign1
 11955                                  ;  874  5551 prc
 11956                                  ;  875  5555 prs
 11957                                  ;  876  5559 prc
 11958                                  ;  877  5563 pint1
 11959                                  ;  878  5569 prs
 11960                                  ;  879  5573 calllisting
 11961                                  ;  880  5585 prs
 11962                                  ;  881  5589 printint51
 11963                                  ;  882  5600 prc
 11964                                  ;  883  5604 prs
 11965                                  ;  884  5608 printint51
 11966                                  ;  885  5619 prc
 11967                                  ;  886  5623 from_far
 11968                                  ;  887  5632 prs
 11969                                  ;  888  5636 adrF
 11970                                  ;  889  5641 from_far
 11971                                  ;  890  5650 eqstr
 11972                                  ;  891  5656 prs
 11973                                  ;  892  5660 countcalls
 11974                                  ;  893  5671 funclisting
 11975                                  ;  894  5683 prs
 11976                                  ;  895  5687 printint51
 11977                                  ;  896  5698 printint51
 11978                                  ;  897  5709 prs
 11979                                  ;  898  5713 printint51
 11980                                  ;  899  5724 prc
 11981                                  ;  900  5728 prs
 11982                                  ;  901  5732 prs
 11983                                  ;  902  5736 prs
 11984                                  ;  903  5740 prs
 11985                                  ;  904  5744 prc
 11986                                  ;  905  5748 prc
 11987                                  ;  906  5752 adrF
 11988                                  ;  907  5757 prs
 11989                                  ;  908  5761 strcpy
 11990                                  ;  909  5768 storefunc
 11991                                  ;  910  5778 prs
 11992                                  ;  911  5782 prs
 11993                                  ;  912  5786 listvar
 11994                                  ;  913  5794 listfunc
 11995                                  ;  914  5803 listcall
 11996                                  ;  915  5812 prs
 11997                                  ;  916  5816 prs
 11998                                  ;  917  5820 prs
 11999                                  ;  918  5824 prs
 12000                                  ;  919  5828 prs
 12001                                  ;  920  5832 printint51
 12002                                  ;  921  5843 prs
 12003                                  ;  922  5847 printint51
 12004                                  ;  923  5858 prs
 12005                                  ;  924  5862 printint51
 12006                                  ;  925  5873 prs
 12007                                  ;  926  5877 printint51
 12008                                  ;  927  5888 prs
 12009                                  ;  928  5892 printint51
 12010                                  ;  929  5903 prs
 12011                                  ;  930  5907 printint51
 12012                                  ;  931  5918 prs
 12013                                  ;  932  5922 printint51
 12014                                  ;  933  5933 prs
 12015                                  ;  934  5937 printint51
 12016                                  ;  935  5948 prs
 12017                                  ;  936  5952 printint51
 12018                                  ;  937  5963 prs
 12019                                  ;  938  5967 printint51
 12020                                  ;  939  5978 prs
 12021                                  ;  940  5982 printint51
 12022                                  ;  941  5993 prs
 12023                                  ;  942  5997 printint51
 12024                                  ;  943  6008 prs
 12025                                  ;  944  6012 prs
 12026                                  ;  945  6016 prunsign1
 12027                                  ;  946  6026 prs
 12028                                  ;  947  6030 printint51
 12029                                  ;  948  6041 prs
 12030                                  ;  949  6045 prs
 12031                                  ;  950  6049 prs
 12032                                  ;  951  6053 prs
 12033                                  ;  952  6057 printint51
 12034                                  ;  953  6068 prs
 12035                                  ;  954  6072 printint51
 12036                                  ;  955  6083 prs
 12037                                  ;  956  6087 printint51
 12038                                  ;  957  6098 prs
 12039                                  ;  958  6102 end1
 12040                                  ;  959  6107 DosInt
 12041                                  ;  960  6114 DosInt
 12042                                  ;Input: A.C, List: A.S,  Lines: 1005
 12043                                  ;Glob. variables:  129 max.:  200
 12044                                  ;Functions      :  107 max.:  300
 12045                                  ;Calls          :  961 max.: 2000, NameField: 6121 max.:    65535
 12046                                  ;Code until     :21595 max.: 30000, free: 8405
 12047                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12048                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
