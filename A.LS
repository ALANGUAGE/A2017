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
   953 0000037F E8FC40                   call prc
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
   969 0000039A E8E140                   call prc
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
   998 000003C1 E84044                   call error1
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
  1038 00000405 E8FC43                   call error1
  1039 00000408 83C402                   add  sp, 2
  1040                                  
  1041                                  ;-134   if (iswidth == 0) error1("no VOID as var type");
  1042                                  
  1043                                  .doglob36:
  1044 0000040B A0[3800]                 mov al, [iswidth]
  1045 0000040E 3C00                     cmp al, 0
  1046 00000410 0F850900                 jne .doglob37
  1047 00000414 68[5507]                 push doglob_1
  1048 00000417 E8EA43                   call error1
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
  1062 0000042C E8D543                   call error1
  1063 0000042F 83C402                   add  sp, 2
  1064                                  
  1065                                  ;-137   if (istoken('[')) { istype='&';
  1066                                  
  1067                                  .doglob38:
  1068 00000432 6A5B                     push 91
  1069 00000434 E8793F                   call istoken
  1070 00000437 83C402                   add  sp, 2
  1071 0000043A 08C0                     or  al, al
  1072 0000043C 0F84E201                 je .doglob39
  1073 00000440 B82600                   mov ax, 38
  1074 00000443 A2[3200]                 mov byte [istype], al
  1075                                  
  1076                                  ;-138     if (istoken(T_CONST)) {
  1077                                  
  1078 00000446 680101                   push 257
  1079 00000449 E8643F                   call istoken
  1080 0000044C 83C402                   add  sp, 2
  1081 0000044F 08C0                     or  al, al
  1082 00000451 0F84C200                 je .doglob40
  1083                                  
  1084                                  ;-139       prs("\nsection .bss\nabsolute ");
  1085                                  
  1086 00000455 68[8207]                 push doglob_3
  1087 00000458 E88A40                   call prs
  1088 0000045B 83C402                   add  sp, 2
  1089                                  
  1090                                  ;-140       prunsign1(orgData);
  1091                                  
  1092 0000045E FF36[1000]               push word [orgData]
  1093 00000462 E8D541                   call prunsign1
  1094 00000465 83C402                   add  sp, 2
  1095                                  
  1096                                  ;-141       prs("\n"); prs(symbol); 
  1097                                  
  1098 00000468 68[9C07]                 push doglob_4
  1099 0000046B E87740                   call prs
  1100 0000046E 83C402                   add  sp, 2
  1101 00000471 8D062B81                 lea  ax, [symbol]
  1102 00000475 50                       push ax
  1103 00000476 E86C40                   call prs
  1104 00000479 83C402                   add  sp, 2
  1105                                  
  1106                                  ;-142       if (iswidth==1) prs(" resb "); 
  1107                                  
  1108 0000047C A0[3800]                 mov al, [iswidth]
  1109 0000047F 3C01                     cmp al, 1
  1110 00000481 0F850900                 jne .doglob41
  1111 00000485 68[9F07]                 push doglob_5
  1112 00000488 E85A40                   call prs
  1113 0000048B 83C402                   add  sp, 2
  1114                                  
  1115                                  ;-143       if (iswidth==2) prs(" resw ");
  1116                                  
  1117                                  .doglob41:
  1118 0000048E A0[3800]                 mov al, [iswidth]
  1119 00000491 3C02                     cmp al, 2
  1120 00000493 0F850900                 jne .doglob42
  1121 00000497 68[A607]                 push doglob_6
  1122 0000049A E84840                   call prs
  1123 0000049D 83C402                   add  sp, 2
  1124                                  
  1125                                  ;-144       if (iswidth==4) prs(" resd ");
  1126                                  
  1127                                  .doglob42:
  1128 000004A0 A0[3800]                 mov al, [iswidth]
  1129 000004A3 3C04                     cmp al, 4
  1130 000004A5 0F850900                 jne .doglob43
  1131 000004A9 68[AD07]                 push doglob_7
  1132 000004AC E83640                   call prs
  1133 000004AF 83C402                   add  sp, 2
  1134                                  
  1135                                  ;-145       prunsign1(lexval); 
  1136                                  
  1137                                  .doglob43:
  1138 000004B2 FF36[2E00]               push word [lexval]
  1139 000004B6 E88141                   call prunsign1
  1140 000004B9 83C402                   add  sp, 2
  1141                                  
  1142                                  ;-146       prs("\nsection .text");
  1143                                  
  1144 000004BC 68[B407]                 push doglob_8
  1145 000004BF E82340                   call prs
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
  1185 0000050E E8C13E                   call expect
  1186 00000511 83C402                   add  sp, 2
  1187                                  
  1188                                  ;-151     }else { expect(']');
  1189                                  
  1190 00000514 E90801                   jmp .doglob46
  1191                                  .doglob40:
  1192 00000517 6A5D                     push 93
  1193 00000519 E8B63E                   call expect
  1194 0000051C 83C402                   add  sp, 2
  1195                                  
  1196                                  ;-152       if (iswidth != 1) error1("Only ByteArray allowed");
  1197                                  
  1198 0000051F A0[3800]                 mov al, [iswidth]
  1199 00000522 3C01                     cmp al, 1
  1200 00000524 0F840900                 je  .doglob47
  1201 00000528 68[C407]                 push doglob_9
  1202 0000052B E8D642                   call error1
  1203 0000052E 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-153       prs("\n"); prs(symbol); prs(" db "); 
  1206                                  
  1207                                  .doglob47:
  1208 00000531 68[DB07]                 push doglob_10
  1209 00000534 E8AE3F                   call prs
  1210 00000537 83C402                   add  sp, 2
  1211 0000053A 8D062B81                 lea  ax, [symbol]
  1212 0000053E 50                       push ax
  1213 0000053F E8A33F                   call prs
  1214 00000542 83C402                   add  sp, 2
  1215 00000545 68[DE07]                 push doglob_11
  1216 00000548 E89A3F                   call prs
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
  1233 00000566 E8693E                   call expect
  1234 00000569 83C402                   add  sp, 2
  1235                                  
  1236                                  ;-156       if (istoken(T_STRING)) { 
  1237                                  
  1238 0000056C 680201                   push 258
  1239 0000056F E83E3E                   call istoken
  1240 00000572 83C402                   add  sp, 2
  1241 00000575 08C0                     or  al, al
  1242 00000577 0F844200                 je .doglob48
  1243                                  
  1244                                  ;-157         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1245                                  
  1246 0000057B 6A22                     push 34
  1247 0000057D E8FE3E                   call prc
  1248 00000580 83C402                   add  sp, 2
  1249 00000583 8D062B81                 lea  ax, [symbol]
  1250 00000587 50                       push ax
  1251 00000588 E81E3F                   call prscomment
  1252 0000058B 83C402                   add  sp, 2
  1253 0000058E 6A22                     push 34
  1254 00000590 E8EB3E                   call prc
  1255 00000593 83C402                   add  sp, 2
  1256 00000596 68[E307]                 push doglob_12
  1257 00000599 E8493F                   call prs
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
  1277 000005BF E8EE3D                   call istoken
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
  1291 000005DC E89F3E                   call prc
  1292 000005DF 83C402                   add  sp, 2
  1293                                  
  1294                                  ;-161           expect(T_CONST); prunsign1(lexval); i=1; }
  1295                                  
  1296                                  .doglob52:
  1297 000005E2 680101                   push 257
  1298 000005E5 E8EA3D                   call expect
  1299 000005E8 83C402                   add  sp, 2
  1300 000005EB FF36[2E00]               push word [lexval]
  1301 000005EF E84840                   call prunsign1
  1302 000005F2 83C402                   add  sp, 2
  1303 000005F5 B80100                   mov ax, 1
  1304 000005F8 8946FE                   mov [bp-2], ax
  1305                                  
  1306                                  ;-162         while (istoken(',')); expect('}'); }  
  1307                                  
  1308 000005FB 6A2C                     push 44
  1309 000005FD E8B03D                   call istoken
  1310 00000600 83C402                   add  sp, 2
  1311 00000603 08C0                     or  al, al
  1312 00000605 0F840200                 je .doglob53
  1313 00000609 EBC6                     jmp .doglob51
  1314                                  .doglob53:
  1315 0000060B 6A7D                     push 125
  1316 0000060D E8C23D                   call expect
  1317 00000610 83C402                   add  sp, 2
  1318                                  
  1319                                  ;-163       else error1("String or number array expected");
  1320                                  
  1321 00000613 E90900                   jmp .doglob54
  1322                                  .doglob50:
  1323 00000616 68[E607]                 push doglob_13
  1324 00000619 E8E841                   call error1
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
  1341 00000625 E8BD3E                   call prs
  1342 00000628 83C402                   add  sp, 2
  1343 0000062B 8D062B81                 lea  ax, [symbol]
  1344 0000062F 50                       push ax
  1345 00000630 E8B23E                   call prs
  1346 00000633 83C402                   add  sp, 2
  1347 00000636 A0[3200]                 mov al, [istype]
  1348 00000639 3C2A                     cmp al, 42
  1349 0000063B 0F850C00                 jne .doglob56
  1350 0000063F 68[0908]                 push doglob_15
  1351 00000642 E8A03E                   call prs
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
  1365 00000657 E88B3E                   call prs
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
  1376 0000066C E8763E                   call prs
  1377 0000066F 83C402                   add  sp, 2
  1378                                  
  1379                                  ;-170       else                 prs(" dd ");
  1380                                  
  1381 00000672 E90900                   jmp .doglob61
  1382                                  .doglob60:
  1383 00000675 68[1808]                 push doglob_18
  1384 00000678 E86A3E                   call prs
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
  1396 00000680 E82D3D                   call istoken
  1397 00000683 83C402                   add  sp, 2
  1398 00000686 08C0                     or  al, al
  1399 00000688 0F840800                 je .doglob62
  1400 0000068C 6A2D                     push 45
  1401 0000068E E8ED3D                   call prc
  1402 00000691 83C402                   add  sp, 2
  1403                                  
  1404                                  ;-173     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1405                                  
  1406                                  .doglob62:
  1407 00000694 6A3D                     push 61
  1408 00000696 E8173D                   call istoken
  1409 00000699 83C402                   add  sp, 2
  1410 0000069C 08C0                     or  al, al
  1411 0000069E 0F841600                 je .doglob63
  1412 000006A2 680101                   push 257
  1413 000006A5 E82A3D                   call expect
  1414 000006A8 83C402                   add  sp, 2
  1415 000006AB FF36[2E00]               push word [lexval]
  1416 000006AF E8883F                   call prunsign1
  1417 000006B2 83C402                   add  sp, 2
  1418                                  
  1419                                  ;-174     else prunsign1(0); }
  1420                                  
  1421 000006B5 E90800                   jmp .doglob64
  1422                                  .doglob63:
  1423 000006B8 6A00                     push 0
  1424 000006BA E87D3F                   call prunsign1
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
  1483 0000073B E8943C                   call expect
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
  1680 00000914 E8CE3B                   call prs
  1681 00000917 83C402                   add  sp, 2
  1682                                  
  1683                                  ;-195   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1684                                  
  1685 0000091A E93800                   jmp .printName75
  1686                                  .printName74:
  1687 0000091D 68[5709]                 push printName_0
  1688 00000920 E8C23B                   call prs
  1689 00000923 83C402                   add  sp, 2
  1690 00000926 8B5E04                   mov bx, [bp+4]
  1691 00000929 D1E3                     shl bx, 1
  1692 0000092B 8B87EB8A                 mov ax, [GData + bx]
  1693 0000092F 8946FE                   mov [bp-2], ax
  1694 00000932 8B46FE                   mov ax, [bp-2]
  1695 00000935 83F800                   cmp ax, 0
  1696 00000938 0F8E0800                 jle .printName76
  1697 0000093C 6A2B                     push 43
  1698 0000093E E83D3B                   call prc
  1699 00000941 83C402                   add  sp, 2
  1700                                  .printName76:
  1701 00000944 FF76FE                   push word [bp-2]
  1702 00000947 E8923C                   call pint1
  1703 0000094A 83C402                   add  sp, 2
  1704 0000094D 6A5D                     push 93
  1705 0000094F E82C3B                   call prc
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
  1732 00000972 E88F3E                   call error1
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
  1846 00000A37 E87639                   call istoken
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
  1857 00000A4C E86139                   call istoken
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
  1873 00000A67 E84639                   call istoken
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
  1884 00000A7C E83139                   call istoken
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
  1895 00000A91 E81C39                   call istoken
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
  1906 00000AA6 E80739                   call istoken
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
  1927 00000AC6 E8E738                   call istoken
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
  1940 00000AE0 E8CD38                   call istoken
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
  1976 00000B10 E8F13C                   call error1
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
  2007 00000B3C E8C53C                   call error1
  2008 00000B3F 83C402                   add  sp, 2
  2009                                  
  2010                                  ;-228   if (CNameTop >= 65468) error1("Call name table fuill");
  2011                                  
  2012                                  .storecall93:
  2013 00000B42 A1[6000]                 mov ax, [CNameTop]
  2014 00000B45 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2015 00000B48 0F820900                 jb  .storecall94
  2016 00000B4C 68[AD0B]                 push storecall_1
  2017 00000B4F E8B23C                   call error1
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
  2041 00000B84 E8D747                   call to_far
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
  2070 00000BD0 E8313C                   call error1
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
  2120 00000C45 E8BC3B                   call error1
  2121 00000C48 83C402                   add  sp, 2
  2122                                  
  2123                                  ;-238   if (checkName() != 0) error1("Variable already defined");
  2124                                  
  2125                                  .addlocal96:
  2126 00000C4B E858FD                   call checkName
  2127 00000C4E 83F800                   cmp ax, 0
  2128 00000C51 0F840900                 je  .addlocal97
  2129 00000C55 68[D80C]                 push addlocal_1
  2130 00000C58 E8A93B                   call error1
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
  2264 00000D67 E89A3A                   call error1
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
  2275 00000D73 E86F37                   call prs
  2276 00000D76 83C402                   add  sp, 2
  2277 00000D79 8D062B81                 lea  ax, [symbol]
  2278 00000D7D 50                       push ax
  2279 00000D7E E86437                   call prs
  2280 00000D81 83C402                   add  sp, 2
  2281 00000D84 68[A60F]                 push dofunc_2
  2282 00000D87 E85B37                   call prs
  2283 00000D8A 83C402                   add  sp, 2
  2284                                  
  2285                                  ;-253   expect('('); LTop=LSTART;  i=0;
  2286                                  
  2287 00000D8D 6A28                     push 40
  2288 00000D8F E84036                   call expect
  2289 00000D92 83C402                   add  sp, 2
  2290 00000D95 B8C800                   mov ax, 200
  2291 00000D98 A3[2C00]                 mov word [LTop], ax
  2292 00000D9B B80000                   mov ax, 0
  2293 00000D9E 8946FC                   mov [bp-4], ax
  2294                                  
  2295                                  ;-254   if (istoken(')')==0) { narg=2; 
  2296                                  
  2297 00000DA1 6A29                     push 41
  2298 00000DA3 E80A36                   call istoken
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
  2328 00000DE0 E8CD35                   call istoken
  2329 00000DE3 83C402                   add  sp, 2
  2330 00000DE6 08C0                     or  al, al
  2331 00000DE8 0F840200                 je .dofunc105
  2332 00000DEC EBC8                     jmp .dofunc103
  2333                                  .dofunc105:
  2334 00000DEE 6A29                     push 41
  2335 00000DF0 E8DF35                   call expect
  2336 00000DF3 83C402                   add  sp, 2
  2337                                  
  2338                                  ;-258     
  2339                                  
  2340                                  
  2341                                  ;-259   expect('{'); /*body*/
  2342                                  
  2343                                  .dofunc102:
  2344 00000DF6 6A7B                     push 123
  2345 00000DF8 E8D735                   call expect
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
  2398 00000E48 E86535                   call istoken
  2399 00000E4B 83C402                   add  sp, 2
  2400 00000E4E 08C0                     or  al, al
  2401 00000E50 0F843D00                 je .dofunc110
  2402 00000E54 B82600                   mov ax, 38
  2403 00000E57 A2[3200]                 mov byte [istype], al
  2404 00000E5A B82600                   mov ax, 38
  2405 00000E5D 8B1E[2C00]               mov bx, [LTop]
  2406 00000E61 8887B782                 mov [GType+bx], al
  2407 00000E65 680101                   push 257
  2408 00000E68 E86735                   call expect
  2409 00000E6B 83C402                   add  sp, 2
  2410 00000E6E 6A5D                     push 93
  2411 00000E70 E85F35                   call expect
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
  2433 00000E97 E81635                   call istoken
  2434 00000E9A 83C402                   add  sp, 2
  2435 00000E9D 08C0                     or  al, al
  2436 00000E9F 0F840300                 je .dofunc111
  2437 00000EA3 E979FF                   jmp .dofunc108
  2438                                  .dofunc111:
  2439 00000EA6 6A3B                     push 59
  2440 00000EA8 E82735                   call expect
  2441 00000EAB 83C402                   add  sp, 2
  2442                                  
  2443                                  ;-271   listproc(); 
  2444                                  
  2445 00000EAE E965FF                   jmp .dofunc106
  2446                                  .dofunc107:
  2447 00000EB1 E8523A                   call listproc
  2448                                  
  2449                                  ;-272   if (LTop>LSTART){prs(";\n ENTER  "); 
  2450                                  
  2451 00000EB4 A1[2C00]                 mov ax, [LTop]
  2452 00000EB7 3DC800                   cmp ax, 200
  2453 00000EBA 0F8E2700                 jle .dofunc112
  2454 00000EBE 68[AD0F]                 push dofunc_3
  2455 00000EC1 E82136                   call prs
  2456 00000EC4 83C402                   add  sp, 2
  2457                                  
  2458                                  ;-273     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  2459                                  
  2460 00000EC7 FF76FE                   push word [bp-2]
  2461 00000ECA E8F5F1                   call mkneg
  2462 00000ECD 83C402                   add  sp, 2
  2463 00000ED0 8946FE                   mov [bp-2], ax
  2464 00000ED3 FF76FE                   push word [bp-2]
  2465 00000ED6 E86137                   call prunsign1
  2466 00000ED9 83C402                   add  sp, 2
  2467 00000EDC 68[B90F]                 push dofunc_4
  2468 00000EDF E80336                   call prs
  2469 00000EE2 83C402                   add  sp, 2
  2470                                  
  2471                                  ;-274   while(istoken('}')==0)   stmt();
  2472                                  
  2473                                  .dofunc112:
  2474                                  .dofunc113:
  2475 00000EE5 6A7D                     push 125
  2476 00000EE7 E8C634                   call istoken
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
  2493 00000F05 E8DD35                   call prs
  2494 00000F08 83C402                   add  sp, 2
  2495                                  
  2496                                  ;-277         prs(fname);
  2497                                  
  2498 00000F0B 8D06AB81                 lea  ax, [fname]
  2499 00000F0F 50                       push ax
  2500 00000F10 E8D235                   call prs
  2501 00000F13 83C402                   add  sp, 2
  2502                                  
  2503                                  ;-278         prc(':');
  2504                                  
  2505 00000F16 6A3A                     push 58
  2506 00000F18 E86335                   call prc
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
  2519 00000F2B E8B735                   call prs
  2520 00000F2E 83C402                   add  sp, 2
  2521                                  
  2522                                  ;-281   prs("\n ret"); 
  2523                                  
  2524                                  .dofunc116:
  2525 00000F31 68[CC0F]                 push dofunc_7
  2526 00000F34 E8AE35                   call prs
  2527 00000F37 83C402                   add  sp, 2
  2528                                  
  2529                                  ;-282   *cloc=0; prs(co); 
  2530                                  
  2531 00000F3A B80000                   mov ax, 0
  2532 00000F3D 8B1E[1600]               mov  bx, [cloc]
  2533 00000F41 8807                     mov  [bx], al
  2534 00000F43 8D063075                 lea  ax, [co]
  2535 00000F47 50                       push ax
  2536 00000F48 E89A35                   call prs
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
  2565 00000F80 E86235                   call prs
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
  2678 00001046 E88933                   call expect
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
  2723 000010A0 E84234                   call prs
  2724 000010A3 83C402                   add  sp, 2
  2725                                  .pexpr126:
  2726 000010A6 8D06AB81                 lea  ax, [fname]
  2727 000010AA 50                       push ax
  2728 000010AB E83734                   call prs
  2729 000010AE 83C402                   add  sp, 2
  2730                                  
  2731                                  ;-305   expect(')'); }           /*error1("Vergleich fehlt");*/
  2732                                  
  2733 000010B1 6A29                     push 41
  2734 000010B3 E81C33                   call expect
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
  2781 00001103 E8FE36                   call error1
  2782 00001106 83C402                   add  sp, 2
  2783                                  
  2784                                  ;-311   expect(T_CONST);  prs(" ; constant expression");
  2785                                  
  2786                                  .constantexpr127:
  2787 00001109 680101                   push 257
  2788 0000110C E8C332                   call expect
  2789 0000110F 83C402                   add  sp, 2
  2790 00001112 68[A511]                 push constantexpr_1
  2791 00001115 E8CD33                   call prs
  2792 00001118 83C402                   add  sp, 2
  2793                                  
  2794                                  ;-312   prs("\ncmp "); 
  2795                                  
  2796 0000111B 68[BC11]                 push constantexpr_2
  2797 0000111E E8C433                   call prs
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
  2809 0000113A E8A833                   call prs
  2810 0000113D 83C402                   add  sp, 2
  2811 00001140 E90900                   jmp .constantexpr129
  2812                                  .constantexpr128:
  2813 00001143 68[C811]                 push constantexpr_4
  2814 00001146 E89C33                   call prs
  2815 00001149 83C402                   add  sp, 2
  2816                                  
  2817                                  ;-314   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2818                                  
  2819                                  .constantexpr129:
  2820 0000114C FF76FC                   push word [bp-4]
  2821 0000114F E81DF2                   call v
  2822 00001152 83C402                   add  sp, 2
  2823 00001155 68[CD11]                 push constantexpr_5
  2824 00001158 E88A33                   call prs
  2825 0000115B 83C402                   add  sp, 2
  2826 0000115E FF36[2E00]               push word [lexval]
  2827 00001162 E8D534                   call prunsign1
  2828 00001165 83C402                   add  sp, 2
  2829 00001168 FF76FA                   push word [bp-6]
  2830 0000116B E8F027                   call cmpneg
  2831 0000116E 83C402                   add  sp, 2
  2832 00001171 8D06AB81                 lea  ax, [fname]
  2833 00001175 50                       push ax
  2834 00001176 E86C33                   call prs
  2835 00001179 83C402                   add  sp, 2
  2836                                  
  2837                                  ;-315   expect(')');
  2838                                  
  2839 0000117C 6A29                     push 41
  2840 0000117E E85132                   call expect
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
  2916 00001220 E8E135                   call error1
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
  2962 00001278 E88935                   call error1
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
  2976 0000128A E87735                   call error1
  2977 0000128D 83C402                   add  sp, 2
  2978                                  
  2979                                  ;-330   }
  2980                                  
  2981                                  
  2982                                  ;-331   if (istoken('=') == 0) error1("Assign expected");
  2983                                  
  2984                                  .expr2137:
  2985 00001290 6A3D                     push 61
  2986 00001292 E81B31                   call istoken
  2987 00001295 83C402                   add  sp, 2
  2988 00001298 83F800                   cmp ax, 0
  2989 0000129B 0F850900                 jne .expr2138
  2990 0000129F 68[2F15]                 push expr2_3
  2991 000012A2 E85F35                   call error1
  2992 000012A5 83C402                   add  sp, 2
  2993                                  
  2994                                  ;-332   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2995                                  
  2996                                  .expr2138:
  2997 000012A8 680101                   push 257
  2998 000012AB E80231                   call istoken
  2999 000012AE 83C402                   add  sp, 2
  3000 000012B1 08C0                     or  al, al
  3001 000012B3 0F849A00                 je .expr2139
  3002 000012B7 A1[2E00]                 mov ax, [lexval]
  3003 000012BA A3[4210]                 mov word [val2], ax
  3004 000012BD 68[3F15]                 push expr2_4
  3005 000012C0 E82232                   call prs
  3006 000012C3 83C402                   add  sp, 2
  3007                                  
  3008                                  ;-333     prs("\nmov ");
  3009                                  
  3010 000012C6 68[5615]                 push expr2_5
  3011 000012C9 E81932                   call prs
  3012 000012CC 83C402                   add  sp, 2
  3013                                  
  3014                                  ;-334     if (idw1 == 1) prs("byte ");
  3015                                  
  3016 000012CF A1[3010]                 mov ax, [idw1]
  3017 000012D2 83F801                   cmp ax, 1
  3018 000012D5 0F850900                 jne .expr2140
  3019 000012D9 68[5D15]                 push expr2_6
  3020 000012DC E80632                   call prs
  3021 000012DF 83C402                   add  sp, 2
  3022                                  
  3023                                  ;-335     if (idw1 == 2) prs("word ");
  3024                                  
  3025                                  .expr2140:
  3026 000012E2 A1[3010]                 mov ax, [idw1]
  3027 000012E5 83F802                   cmp ax, 2
  3028 000012E8 0F850900                 jne .expr2141
  3029 000012EC 68[6315]                 push expr2_7
  3030 000012EF E8F331                   call prs
  3031 000012F2 83C402                   add  sp, 2
  3032                                  
  3033                                  ;-336     if (idw1 == 4) prs("dword ");
  3034                                  
  3035                                  .expr2141:
  3036 000012F5 A1[3010]                 mov ax, [idw1]
  3037 000012F8 83F804                   cmp ax, 4
  3038 000012FB 0F850900                 jne .expr2142
  3039 000012FF 68[6915]                 push expr2_8
  3040 00001302 E8E031                   call prs
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
  3053 00001315 E8CD31                   call prs
  3054 00001318 83C402                   add  sp, 2
  3055 0000131B FF36[4210]               push word [val2]
  3056 0000131F E81833                   call prunsign1
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
  3069 0000133F E8A331                   call prs
  3070 00001342 83C402                   add  sp, 2
  3071 00001345 FF76FE                   push word [bp-2]
  3072 00001348 E89A31                   call prs
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
  3094 00001369 E87931                   call prs
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
  3112 00001392 E85031                   call prs
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
  3130 000013B5 E84C34                   call error1
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
  3160 000013EA E81734                   call error1
  3161 000013ED 83C402                   add  sp, 2
  3162                                  
  3163                                  ;-350     prs("\nmov ");
  3164                                  
  3165                                  .expr2149:
  3166 000013F0 68[BB15]                 push expr2_15
  3167 000013F3 E8EF30                   call prs
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
  3181 00001412 E8EF33                   call error1
  3182 00001415 83C402                   add  sp, 2
  3183                                  
  3184                                  ;-352     prs(", ");
  3185                                  
  3186                                  .expr2151:
  3187 00001418 68[E415]                 push expr2_17
  3188 0000141B E8C730                   call prs
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
  3211 00001445 E89D30                   call prs
  3212 00001448 83C402                   add  sp, 2
  3213                                  
  3214                                  ;-356       if (idw2 == 2) prs("word ");
  3215                                  
  3216                                  .expr2154:
  3217 0000144B A1[3E10]                 mov ax, [idw2]
  3218 0000144E 83F802                   cmp ax, 2
  3219 00001451 0F850900                 jne .expr2155
  3220 00001455 68[ED15]                 push expr2_19
  3221 00001458 E88A30                   call prs
  3222 0000145B 83C402                   add  sp, 2
  3223                                  
  3224                                  ;-357       if (idw2 == 4) prs("dword ");
  3225                                  
  3226                                  .expr2155:
  3227 0000145E A1[3E10]                 mov ax, [idw2]
  3228 00001461 83F804                   cmp ax, 4
  3229 00001464 0F850900                 jne .expr2156
  3230 00001468 68[F315]                 push expr2_20
  3231 0000146B E87730                   call prs
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
  3251 00001495 E84D30                   call prs
  3252 00001498 83C402                   add  sp, 2
  3253 0000149B FF76FE                   push word [bp-2]
  3254 0000149E E84430                   call prs
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
  3267 000014AA E85733                   call error1
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
  3347 0000162D E8802D                   call istoken
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
  3361 0000164A E8632D                   call istoken
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
  3375 00001667 E8462D                   call istoken
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
  3389 00001684 E8292D                   call istoken
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
  3403 000016A1 E80C2D                   call istoken
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
  3417 000016BE E8EF2C                   call istoken
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
  3431 000016DB E8D22C                   call istoken
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
  3456 00001712 E8EF30                   call error1
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
  3471 00001726 E8AE2D                   call prnl
  3472 00001729 8D069ED0                 lea  ax, [ops]
  3473 0000172D 50                       push ax
  3474 0000172E E8B42D                   call prs
  3475 00001731 83C402                   add  sp, 2
  3476 00001734 68[0D18]                 push doreg1_9
  3477 00001737 E8AB2D                   call prs
  3478 0000173A 83C402                   add  sp, 2
  3479 0000173D FF36[2A10]               push word [ireg1]
  3480 00001741 E8DD04                   call printreg
  3481 00001744 83C402                   add  sp, 2
  3482 00001747 68[1018]                 push doreg1_10
  3483 0000174A E8982D                   call prs
  3484 0000174D 83C402                   add  sp, 2
  3485                                  
  3486                                  ;-376 
  3487                                  
  3488                                  
  3489                                  ;-377   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3490                                  
  3491 00001750 680101                   push 257
  3492 00001753 E85A2C                   call istoken
  3493 00001756 83C402                   add  sp, 2
  3494 00001759 08C0                     or  al, al
  3495 0000175B 0F840D00                 je .doreg1167
  3496 0000175F FF36[2E00]               push word [lexval]
  3497 00001763 E8D42E                   call prunsign1
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
  3548 000017CA E8182D                   call prs
  3549 000017CD 83C402                   add  sp, 2
  3550 000017D0 6A29                     push 41
  3551 000017D2 E8FD2B                   call expect
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
  4045 00001C3C E83F28                   call prc
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
  4060 00001C5C E81F28                   call prc
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
  4078 00001C86 E8F527                   call prc
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
  4118 00001C99 E81427                   call istoken
  4119 00001C9C 83C402                   add  sp, 2
  4120 00001C9F 08C0                     or  al, al
  4121 00001CA1 0F841F00                 je .expr206
  4122 00001CA5 A1[2E00]                 mov ax, [lexval]
  4123 00001CA8 A3[8E1C]                 mov word [evalue], ax
  4124                                  
  4125                                  ;-418     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4126                                  
  4127 00001CAB 68[3220]                 push expr_0
  4128 00001CAE E83428                   call prs
  4129 00001CB1 83C402                   add  sp, 2
  4130 00001CB4 FF36[2E00]               push word [lexval]
  4131 00001CB8 E87F29                   call prunsign1
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
  4198 00001D23 E88A26                   call istoken
  4199 00001D26 83C402                   add  sp, 2
  4200 00001D29 08C0                     or  al, al
  4201 00001D2B 0F845900                 je .expr210
  4202 00001D2F 680101                   push 257
  4203 00001D32 E87B26                   call istoken
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
  4215 00001D4C E88326                   call expect
  4216 00001D4F 83C402                   add  sp, 2
  4217                                  
  4218                                  ;-429     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4219                                  
  4220 00001D52 E93300                   jmp .expr212
  4221                                  .expr211:
  4222 00001D55 E803EC                   call searchname
  4223 00001D58 8946FA                   mov [bp-6], ax
  4224 00001D5B 680001                   push 256
  4225 00001D5E E87126                   call expect
  4226 00001D61 83C402                   add  sp, 2
  4227 00001D64 6A5D                     push 93
  4228 00001D66 E86926                   call expect
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
  4243 00001D82 E87F2A                   call error1
  4244 00001D85 83C402                   add  sp, 2
  4245                                  .expr213:
  4246                                  .expr212:
  4247                                  
  4248                                  ;-432   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4249                                  
  4250                                  .expr210:
  4251 00001D88 68C304                   push 1219
  4252 00001D8B E82226                   call istoken
  4253 00001D8E 83C402                   add  sp, 2
  4254 00001D91 08C0                     or  al, al
  4255 00001D93 0F844600                 je .expr214
  4256 00001D97 8B46FE                   mov ax, [bp-2]
  4257 00001D9A 08C0                     or  al, al
  4258 00001D9C 0F840900                 je .expr215
  4259 00001DA0 68[6120]                 push expr_2
  4260 00001DA3 E85E2A                   call error1
  4261 00001DA6 83C402                   add  sp, 2
  4262                                  
  4263                                  ;-433      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4264                                  
  4265                                  .expr215:
  4266 00001DA9 68[7120]                 push expr_3
  4267 00001DAC E83627                   call prs
  4268 00001DAF 83C402                   add  sp, 2
  4269 00001DB2 A1[3900]                 mov ax, [wi]
  4270 00001DB5 83F802                   cmp ax, 2
  4271 00001DB8 0F850C00                 jne .expr216
  4272 00001DBC 68[7A20]                 push expr_4
  4273 00001DBF E82327                   call prs
  4274 00001DC2 83C402                   add  sp, 2
  4275 00001DC5 E90900                   jmp .expr217
  4276                                  .expr216:
  4277 00001DC8 68[7F20]                 push expr_5
  4278 00001DCB E81727                   call prs
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
  4293 00001DE0 E8CD25                   call istoken
  4294 00001DE3 83C402                   add  sp, 2
  4295 00001DE6 08C0                     or  al, al
  4296 00001DE8 0F844600                 je .expr218
  4297 00001DEC 8B46FE                   mov ax, [bp-2]
  4298 00001DEF 08C0                     or  al, al
  4299 00001DF1 0F840900                 je .expr219
  4300 00001DF5 68[8420]                 push expr_6
  4301 00001DF8 E8092A                   call error1
  4302 00001DFB 83C402                   add  sp, 2
  4303                                  
  4304                                  ;-436      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4305                                  
  4306                                  .expr219:
  4307 00001DFE 68[9420]                 push expr_7
  4308 00001E01 E8E126                   call prs
  4309 00001E04 83C402                   add  sp, 2
  4310 00001E07 A1[3900]                 mov ax, [wi]
  4311 00001E0A 83F802                   cmp ax, 2
  4312 00001E0D 0F850C00                 jne .expr220
  4313 00001E11 68[9D20]                 push expr_8
  4314 00001E14 E8CE26                   call prs
  4315 00001E17 83C402                   add  sp, 2
  4316 00001E1A E90900                   jmp .expr221
  4317                                  .expr220:
  4318 00001E1D 68[A220]                 push expr_9
  4319 00001E20 E8C226                   call prs
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
  4337 00001E35 E87825                   call istoken
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
  4352 00001E56 E85725                   call istoken
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
  4367 00001E77 E83625                   call istoken
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
  4382 00001E98 E81525                   call istoken
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
  4397 00001EB9 E8F424                   call istoken
  4398 00001EBC 83C402                   add  sp, 2
  4399 00001EBF 08C0                     or  al, al
  4400 00001EC1 0F840900                 je .expr226
  4401 00001EC5 68[B620]                 push expr_14
  4402 00001EC8 E83929                   call error1
  4403 00001ECB 83C402                   add  sp, 2
  4404                                  
  4405                                  ;-444   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4406                                  
  4407                                  .expr226:
  4408 00001ECE 68D104                   push 1233
  4409 00001ED1 E8DC24                   call istoken
  4410 00001ED4 83C402                   add  sp, 2
  4411 00001ED7 08C0                     or  al, al
  4412 00001ED9 0F840900                 je .expr227
  4413 00001EDD 68[C620]                 push expr_15
  4414 00001EE0 E82129                   call error1
  4415 00001EE3 83C402                   add  sp, 2
  4416                                  
  4417                                  ;-445 
  4418                                  
  4419                                  
  4420                                  ;-446   if (istoken('=')) { exprtype= expr(1); 
  4421                                  
  4422                                  .expr227:
  4423 00001EE6 6A3D                     push 61
  4424 00001EE8 E8C524                   call istoken
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
  4460 00001F28 E88524                   call istoken
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
  4473 00001F42 E86B24                   call istoken
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
  4486 00001F5C E85124                   call istoken
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
  4499 00001F76 E83724                   call istoken
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
  4512 00001F91 E81C24                   call istoken
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
  4525 00001FAC E80124                   call istoken
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
  4538 00001FC6 E8E723                   call istoken
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
  4551 00001FE0 E8CD23                   call istoken
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
  4564 00001FFA E8B323                   call istoken
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
  4657 00002105 E8FC26                   call error1
  4658 00002108 83C402                   add  sp, 2
  4659                                  
  4660                                  ;-465   prnl(); prs(op); prs("  "); 
  4661                                  
  4662                                  .compoundass247:
  4663 0000210B E8C923                   call prnl
  4664 0000210E FF7604                   push word [bp+4]
  4665 00002111 E8D123                   call prs
  4666 00002114 83C402                   add  sp, 2
  4667 00002117 68[8721]                 push compoundass_1
  4668 0000211A E8C823                   call prs
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
  4680 00002136 E8AC23                   call prs
  4681 00002139 83C402                   add  sp, 2
  4682 0000213C E90900                   jmp .compoundass249
  4683                                  .compoundass248:
  4684 0000213F 68[8F21]                 push compoundass_3
  4685 00002142 E8A023                   call prs
  4686 00002145 83C402                   add  sp, 2
  4687                                  
  4688                                  ;-467   v(id1); prs(", ");
  4689                                  
  4690                                  .compoundass249:
  4691 00002148 FF7608                   push word [bp+8]
  4692 0000214B E821E2                   call v
  4693 0000214E 83C402                   add  sp, 2
  4694 00002151 68[9421]                 push compoundass_4
  4695 00002154 E88E23                   call prs
  4696 00002157 83C402                   add  sp, 2
  4697                                  
  4698                                  ;-468   expect(T_CONST); prunsign1(lexval);
  4699                                  
  4700 0000215A 680101                   push 257
  4701 0000215D E87222                   call expect
  4702 00002160 83C402                   add  sp, 2
  4703 00002163 FF36[2E00]               push word [lexval]
  4704 00002167 E8D024                   call prunsign1
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
  4743 000021B1 E83123                   call prs
  4744 000021B4 83C402                   add  sp, 2
  4745 000021B7 FF760A                   push word [bp+10]
  4746 000021BA E8B2E1                   call v
  4747 000021BD 83C402                   add  sp, 2
  4748 000021C0 E81423                   call prnl
  4749 000021C3 FF7606                   push word [bp+6]
  4750 000021C6 E81C23                   call prs
  4751 000021C9 83C402                   add  sp, 2
  4752                                  
  4753                                  ;-473     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4754                                  
  4755 000021CC A1[3600]                 mov ax, [widthi]
  4756 000021CF 83F801                   cmp ax, 1
  4757 000021D2 0F850900                 jne .dovar1251
  4758 000021D6 68[F822]                 push dovar1_1
  4759 000021D9 E80923                   call prs
  4760 000021DC 83C402                   add  sp, 2
  4761                                  
  4762                                  ;-474     if(widthi == 2) prs(" ax, [bx]");
  4763                                  
  4764                                  .dovar1251:
  4765 000021DF A1[3600]                 mov ax, [widthi]
  4766 000021E2 83F802                   cmp ax, 2
  4767 000021E5 0F850900                 jne .dovar1252
  4768 000021E9 68[0E23]                 push dovar1_2
  4769 000021EC E8F622                   call prs
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
  4783 000021FF E8D522                   call prnl
  4784 00002202 FF7606                   push word [bp+6]
  4785 00002205 E8DD22                   call prs
  4786 00002208 83C402                   add  sp, 2
  4787 0000220B 68[1823]                 push dovar1_3
  4788 0000220E E8D422                   call prs
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
  4805 0000222C E8B622                   call prs
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
  4817 00002248 E89A22                   call prs
  4818 0000224B 83C402                   add  sp, 2
  4819                                  
  4820                                  ;-480     prs("\n "); prs(op);
  4821                                  
  4822                                  .dovar1255:
  4823 0000224E 68[3723]                 push dovar1_6
  4824 00002251 E89122                   call prs
  4825 00002254 83C402                   add  sp, 2
  4826 00002257 FF7606                   push word [bp+6]
  4827 0000225A E88822                   call prs
  4828 0000225D 83C402                   add  sp, 2
  4829                                  
  4830                                  ;-481     if (wi==2) prs(" ax, "); else prs(" al, ");
  4831                                  
  4832 00002260 A1[3900]                 mov ax, [wi]
  4833 00002263 83F802                   cmp ax, 2
  4834 00002266 0F850C00                 jne .dovar1256
  4835 0000226A 68[3B23]                 push dovar1_7
  4836 0000226D E87522                   call prs
  4837 00002270 83C402                   add  sp, 2
  4838 00002273 E90900                   jmp .dovar1257
  4839                                  .dovar1256:
  4840 00002276 68[4123]                 push dovar1_8
  4841 00002279 E86922                   call prs
  4842 0000227C 83C402                   add  sp, 2
  4843                                  
  4844                                  ;-482 // v(id1); prs(" [bx]");
  4845                                  
  4846                                  
  4847                                  ;-483     prc('['); printName(id1); prs(" + bx]"); 
  4848                                  
  4849                                  .dovar1257:
  4850 0000227F 6A5B                     push 91
  4851 00002281 E8FA21                   call prc
  4852 00002284 83C402                   add  sp, 2
  4853 00002287 FF760A                   push word [bp+10]
  4854 0000228A E86AE6                   call printName
  4855 0000228D 83C402                   add  sp, 2
  4856 00002290 68[4723]                 push dovar1_9
  4857 00002293 E84F22                   call prs
  4858 00002296 83C402                   add  sp, 2
  4859                                  
  4860                                  ;-484     return; }
  4861                                  
  4862 00002299 E94E00                   jmp .retndovar1
  4863                                  
  4864                                  ;-485   prnl();prs(op);
  4865                                  
  4866                                  .dovar1254:
  4867 0000229C E83822                   call prnl
  4868 0000229F FF7606                   push word [bp+6]
  4869 000022A2 E84022                   call prs
  4870 000022A5 83C402                   add  sp, 2
  4871                                  
  4872                                  ;-486   if(wi==1) prs(" al, ");
  4873                                  
  4874 000022A8 A1[3900]                 mov ax, [wi]
  4875 000022AB 83F801                   cmp ax, 1
  4876 000022AE 0F850900                 jne .dovar1258
  4877 000022B2 68[4E23]                 push dovar1_10
  4878 000022B5 E82D22                   call prs
  4879 000022B8 83C402                   add  sp, 2
  4880                                  
  4881                                  ;-487   if(wi==2) prs(" ax, ");
  4882                                  
  4883                                  .dovar1258:
  4884 000022BB A1[3900]                 mov ax, [wi]
  4885 000022BE 83F802                   cmp ax, 2
  4886 000022C1 0F850900                 jne .dovar1259
  4887 000022C5 68[5423]                 push dovar1_11
  4888 000022C8 E81A22                   call prs
  4889 000022CB 83C402                   add  sp, 2
  4890                                  
  4891                                  ;-488   if(wi==4) prs(" eax, ");
  4892                                  
  4893                                  .dovar1259:
  4894 000022CE A1[3900]                 mov ax, [wi]
  4895 000022D1 83F804                   cmp ax, 4
  4896 000022D4 0F850900                 jne .dovar1260
  4897 000022D8 68[5A23]                 push dovar1_12
  4898 000022DB E80722                   call prs
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
  4949 00002368 E84520                   call istoken
  4950 0000236B 83C402                   add  sp, 2
  4951 0000236E 08C0                     or  al, al
  4952 00002370 0F845200                 je .rterm261
  4953 00002374 E86021                   call prnl
  4954 00002377 FF7604                   push word [bp+4]
  4955 0000237A E86821                   call prs
  4956 0000237D 83C402                   add  sp, 2
  4957                                  
  4958                                  ;-493     if (wi==1) prs(" al, ");
  4959                                  
  4960 00002380 A1[3900]                 mov ax, [wi]
  4961 00002383 83F801                   cmp ax, 1
  4962 00002386 0F850900                 jne .rterm262
  4963 0000238A 68[4A24]                 push rterm_0
  4964 0000238D E85521                   call prs
  4965 00002390 83C402                   add  sp, 2
  4966                                  
  4967                                  ;-494     if (wi==2) prs(" ax, ");
  4968                                  
  4969                                  .rterm262:
  4970 00002393 A1[3900]                 mov ax, [wi]
  4971 00002396 83F802                   cmp ax, 2
  4972 00002399 0F850900                 jne .rterm263
  4973 0000239D 68[5024]                 push rterm_1
  4974 000023A0 E84221                   call prs
  4975 000023A3 83C402                   add  sp, 2
  4976                                  
  4977                                  ;-495     if (wi==4) prs(" eax, ");
  4978                                  
  4979                                  .rterm263:
  4980 000023A6 A1[3900]                 mov ax, [wi]
  4981 000023A9 83F804                   cmp ax, 4
  4982 000023AC 0F850900                 jne .rterm264
  4983 000023B0 68[5624]                 push rterm_2
  4984 000023B3 E82F21                   call prs
  4985 000023B6 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-496     prunsign1(lexval); return;}
  4988                                  
  4989                                  .rterm264:
  4990 000023B9 FF36[2E00]               push word [lexval]
  4991 000023BD E87A22                   call prunsign1
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
  5008 000023DA E8D31F                   call istoken
  5009 000023DD 83C402                   add  sp, 2
  5010 000023E0 08C0                     or  al, al
  5011 000023E2 0F843300                 je .rterm265
  5012 000023E6 E872E5                   call searchname
  5013 000023E9 8946FA                   mov [bp-6], ax
  5014 000023EC 680001                   push 256
  5015 000023EF E8E01F                   call expect
  5016 000023F2 83C402                   add  sp, 2
  5017 000023F5 6A5D                     push 93
  5018 000023F7 E8D81F                   call expect
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
  5033 00002413 E8EE23                   call error1
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
  5358 000026DC E8F31C                   call expect
  5359 000026DF 83C402                   add  sp, 2
  5360                                  
  5361                                  ;-523   prs("\n mov  "); prs(dr); prs(", ");
  5362                                  
  5363 000026E2 68[4527]                 push doreg_0
  5364 000026E5 E8FD1D                   call prs
  5365 000026E8 83C402                   add  sp, 2
  5366 000026EB FF7604                   push word [bp+4]
  5367 000026EE E8F41D                   call prs
  5368 000026F1 83C402                   add  sp, 2
  5369 000026F4 68[4E27]                 push doreg_1
  5370 000026F7 E8EB1D                   call prs
  5371 000026FA 83C402                   add  sp, 2
  5372                                  
  5373                                  ;-524        if (istoken(T_CONST)) prunsign1(lexval);
  5374                                  
  5375 000026FD 680101                   push 257
  5376 00002700 E8AD1C                   call istoken
  5377 00002703 83C402                   add  sp, 2
  5378 00002706 08C0                     or  al, al
  5379 00002708 0F840D00                 je .doreg283
  5380 0000270C FF36[2E00]               push word [lexval]
  5381 00002710 E8271F                   call prunsign1
  5382 00002713 83C402                   add  sp, 2
  5383                                  
  5384                                  ;-525   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5385                                  
  5386 00002716 E92A00                   jmp .doreg284
  5387                                  .doreg283:
  5388 00002719 680001                   push 256
  5389 0000271C E8911C                   call istoken
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
  5404 0000273D E8C420                   call error1
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
  5443 00002786 E85C1D                   call prs
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
  5455 000027A2 E8401D                   call prs
  5456 000027A5 83C402                   add  sp, 2
  5457                                  
  5458                                  ;-532     else  prs("\n mov  [bx], al"); return;}
  5459                                  
  5460 000027A8 E90900                   jmp .doassign289
  5461                                  .doassign288:
  5462 000027AB 68[2729]                 push doassign_2
  5463 000027AE E8341D                   call prs
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
  5475 000027C4 E81E1D                   call prs
  5476 000027C7 83C402                   add  sp, 2
  5477 000027CA FF7606                   push word [bp+6]
  5478 000027CD E890DB                   call a
  5479 000027D0 83C402                   add  sp, 2
  5480 000027D3 68[4129]                 push doassign_4
  5481 000027D6 E80C1D                   call prs
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
  5492 000027EB E8F71C                   call prs
  5493 000027EE 83C402                   add  sp, 2
  5494                                  
  5495                                  ;-535     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5496                                  
  5497 000027F1 8B460A                   mov ax, [bp+10]
  5498 000027F4 08C0                     or  al, al
  5499 000027F6 0F840C00                 je .doassign292
  5500 000027FA FF7608                   push word [bp+8]
  5501 000027FD E83A1E                   call prunsign1
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
  5516 0000281C E8C61C                   call prs
  5517 0000281F 83C402                   add  sp, 2
  5518                                  
  5519                                  ;-537     prs("\n mov ["); printName(i);
  5520                                  
  5521                                  .doassign294:
  5522 00002822 68[5F29]                 push doassign_7
  5523 00002825 E8BD1C                   call prs
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
  5535 00002841 E8A11C                   call prs
  5536 00002844 83C402                   add  sp, 2
  5537 00002847 E90900                   jmp .doassign296
  5538                                  .doassign295:
  5539 0000284A 68[7129]                 push doassign_9
  5540 0000284D E8951C                   call prs
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
  5552 00002863 E87F1C                   call prs
  5553 00002866 83C402                   add  sp, 2
  5554 00002869 8B4606                   mov ax, [bp+6]
  5555 0000286C 3DC800                   cmp ax, 200
  5556 0000286F 0F8D0900                 jge .doassign298
  5557 00002873 68[8229]                 push doassign_11
  5558 00002876 E86C1C                   call prs
  5559 00002879 83C402                   add  sp, 2
  5560                                  
  5561                                  ;-540     } v(i); prs(", al"); return; }
  5562                                  
  5563                                  .doassign298:
  5564 0000287C FF7606                   push word [bp+6]
  5565 0000287F E8EDDA                   call v
  5566 00002882 83C402                   add  sp, 2
  5567 00002885 68[8829]                 push doassign_12
  5568 00002888 E85A1C                   call prs
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
  5579 0000289E E8441C                   call prs
  5580 000028A1 83C402                   add  sp, 2
  5581 000028A4 8B4606                   mov ax, [bp+6]
  5582 000028A7 3DC800                   cmp ax, 200
  5583 000028AA 0F8D0900                 jge .doassign300
  5584 000028AE 68[9529]                 push doassign_14
  5585 000028B1 E8311C                   call prs
  5586 000028B4 83C402                   add  sp, 2
  5587                                  
  5588                                  ;-542     } v(i); prs(", ax"); return; }
  5589                                  
  5590                                  .doassign300:
  5591 000028B7 FF7606                   push word [bp+6]
  5592 000028BA E8B2DA                   call v
  5593 000028BD 83C402                   add  sp, 2
  5594 000028C0 68[9B29]                 push doassign_15
  5595 000028C3 E81F1C                   call prs
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
  5606 000028D9 E8091C                   call prs
  5607 000028DC 83C402                   add  sp, 2
  5608 000028DF 8B4606                   mov ax, [bp+6]
  5609 000028E2 3DC800                   cmp ax, 200
  5610 000028E5 0F8D0900                 jge .doassign302
  5611 000028E9 68[A829]                 push doassign_17
  5612 000028EC E8F61B                   call prs
  5613 000028EF 83C402                   add  sp, 2
  5614                                  
  5615                                  ;-544     } v(i); prs(", eax"); return; }
  5616                                  
  5617                                  .doassign302:
  5618 000028F2 FF7606                   push word [bp+6]
  5619 000028F5 E877DA                   call v
  5620 000028F8 83C402                   add  sp, 2
  5621 000028FB 68[AF29]                 push doassign_18
  5622 000028FE E8E41B                   call prs
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
  5680 000029D1 E8DC19                   call istoken
  5681 000029D4 83C402                   add  sp, 2
  5682 000029D7 08C0                     or  al, al
  5683 000029D9 0F841F00                 je .domul305
  5684 000029DD 68[0C2A]                 push domul_1
  5685 000029E0 E8021B                   call prs
  5686 000029E3 83C402                   add  sp, 2
  5687 000029E6 FF36[2E00]               push word [lexval]
  5688 000029EA E84D1C                   call prunsign1
  5689 000029ED 83C402                   add  sp, 2
  5690 000029F0 68[182A]                 push domul_2
  5691 000029F3 E8EF1A                   call prs
  5692 000029F6 83C402                   add  sp, 2
  5693                                  
  5694                                  ;-549   else error1("with MUL only const number as multiplicator allowed"); } }
  5695                                  
  5696 000029F9 E90900                   jmp .domul306
  5697                                  .domul305:
  5698 000029FC 68[222A]                 push domul_3
  5699 000029FF E8021E                   call error1
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
  5731 00002A5D E85019                   call istoken
  5732 00002A60 83C402                   add  sp, 2
  5733 00002A63 08C0                     or  al, al
  5734 00002A65 0F843400                 je .doidiv307
  5735                                  
  5736                                  ;-552     prs("\n mov bx, "); prunsign1(lexval);
  5737                                  
  5738 00002A69 68[1B2B]                 push doidiv_0
  5739 00002A6C E8761A                   call prs
  5740 00002A6F 83C402                   add  sp, 2
  5741 00002A72 FF36[2E00]               push word [lexval]
  5742 00002A76 E8C11B                   call prunsign1
  5743 00002A79 83C402                   add  sp, 2
  5744                                  
  5745                                  ;-553     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5746                                  
  5747 00002A7C 8B4604                   mov ax, [bp+4]
  5748 00002A7F 08C0                     or  al, al
  5749 00002A81 0F840C00                 je .doidiv308
  5750 00002A85 68[272B]                 push doidiv_1
  5751 00002A88 E85A1A                   call prs
  5752 00002A8B 83C402                   add  sp, 2
  5753 00002A8E E90900                   jmp .doidiv309
  5754                                  .doidiv308:
  5755 00002A91 68[382B]                 push doidiv_2
  5756 00002A94 E84E1A                   call prs
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
  5778 00002AB5 E84C1D                   call error1
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
  5794 00002AD0 E8311D                   call error1
  5795 00002AD3 83C402                   add  sp, 2
  5796                                  
  5797                                  ;-559     if (wi!=2) error1("only int, no byte as divisor allowed");
  5798                                  
  5799                                  .doidiv312:
  5800 00002AD6 A1[3900]                 mov ax, [wi]
  5801 00002AD9 83F802                   cmp ax, 2
  5802 00002ADC 0F840900                 je  .doidiv313
  5803 00002AE0 68[A12B]                 push doidiv_5
  5804 00002AE3 E81E1D                   call error1
  5805 00002AE6 83C402                   add  sp, 2
  5806                                  
  5807                                  ;-560     prs("\n mov bx, "); v(id1);
  5808                                  
  5809                                  .doidiv313:
  5810 00002AE9 68[C62B]                 push doidiv_6
  5811 00002AEC E8F619                   call prs
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
  5823 00002B07 E8DB19                   call prs
  5824 00002B0A 83C402                   add  sp, 2
  5825 00002B0D E90900                   jmp .doidiv315
  5826                                  .doidiv314:
  5827 00002B10 68[E32B]                 push doidiv_8
  5828 00002B13 E8CF19                   call prs
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
  5879 00002C09 E8D918                   call prs
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
  5947 00002C47 E88817                   call expect
  5948 00002C4A 83C402                   add  sp, 2
  5949                                  
  5950                                  ;-573 	if (istoken(')') ==0 ) {
  5951                                  
  5952 00002C4D 6A29                     push 41
  5953 00002C4F E85E17                   call istoken
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
  5969 00002C6C E8951B                   call error1
  5970 00002C6F 83C402                   add  sp, 2
  5971                                  .docall1318:
  5972 00002C72 B80000                   mov ax, 0
  5973 00002C75 8946FA                   mov [bp-6], ax
  5974                                  
  5975                                  ;-576       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5976                                  
  5977 00002C78 680101                   push 257
  5978 00002C7B E83217                   call istoken
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
  5991 00002C96 E81717                   call istoken
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
  6003 00002CB1 E89C17                   call eprs
  6004 00002CB4 83C402                   add  sp, 2
  6005 00002CB7 8D06AB81                 lea  ax, [fname]
  6006 00002CBB 50                       push ax
  6007 00002CBC E89117                   call eprs
  6008 00002CBF 83C402                   add  sp, 2
  6009 00002CC2 6A5F                     push 95
  6010 00002CC4 E87617                   call eprc
  6011 00002CC7 83C402                   add  sp, 2
  6012 00002CCA FF36[2400]               push word [nconst]
  6013 00002CCE E8A818                   call eprnum
  6014 00002CD1 83C402                   add  sp, 2
  6015 00002CD4 68[2D2F]                 push docall1_2
  6016 00002CD7 E87617                   call eprs
  6017 00002CDA 83C402                   add  sp, 2
  6018                                  
  6019                                  ;-579         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6020                                  
  6021 00002CDD 6A22                     push 34
  6022 00002CDF E85B17                   call eprc
  6023 00002CE2 83C402                   add  sp, 2
  6024 00002CE5 8D062B81                 lea  ax, [symbol]
  6025 00002CE9 50                       push ax
  6026 00002CEA E86317                   call eprs
  6027 00002CED 83C402                   add  sp, 2
  6028 00002CF0 6A22                     push 34
  6029 00002CF2 E84817                   call eprc
  6030 00002CF5 83C402                   add  sp, 2
  6031 00002CF8 68[322F]                 push docall1_3
  6032 00002CFB E85217                   call eprs
  6033 00002CFE 83C402                   add  sp, 2
  6034 00002D01 FF06[2400]               inc  word[nconst]
  6035                                  
  6036                                  ;-580       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6037                                  
  6038                                  .docall1320:
  6039 00002D05 6A26                     push 38
  6040 00002D07 E8A616                   call istoken
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
  6054 00002D25 E88816                   call istoken
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
  6102 00002D86 E87B1A                   call error1
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
  6123 00002DA6 E80716                   call istoken
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
  6136 00002DB7 E81816                   call expect
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
  6165 00002DE8 E8FA16                   call prs
  6166 00002DEB 83C402                   add  sp, 2
  6167 00002DEE FF76F8                   push word [bp-8]
  6168 00002DF1 E84618                   call prunsign1
  6169 00002DF4 83C402                   add  sp, 2
  6170                                  
  6171                                  ;-595       if(t0==2){ prs("\n push "); 
  6172                                  
  6173                                  .docall1329:
  6174 00002DF7 8B46FA                   mov ax, [bp-6]
  6175 00002DFA 83F802                   cmp ax, 2
  6176 00002DFD 0F852500                 jne .docall1330
  6177 00002E01 68[662F]                 push docall1_6
  6178 00002E04 E8DE16                   call prs
  6179 00002E07 83C402                   add  sp, 2
  6180                                  
  6181                                  ;-596         prs(fname);prc(95);prunsign1(n0);}
  6182                                  
  6183 00002E0A 8D06AB81                 lea  ax, [fname]
  6184 00002E0E 50                       push ax
  6185 00002E0F E8D316                   call prs
  6186 00002E12 83C402                   add  sp, 2
  6187 00002E15 6A5F                     push 95
  6188 00002E17 E86416                   call prc
  6189 00002E1A 83C402                   add  sp, 2
  6190 00002E1D FF76F8                   push word [bp-8]
  6191 00002E20 E81718                   call prunsign1
  6192 00002E23 83C402                   add  sp, 2
  6193                                  
  6194                                  ;-597       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6195                                  
  6196                                  .docall1330:
  6197 00002E26 8B46FA                   mov ax, [bp-6]
  6198 00002E29 83F803                   cmp ax, 3
  6199 00002E2C 0F851B00                 jne .docall1331
  6200 00002E30 68[6F2F]                 push docall1_7
  6201 00002E33 E8AF16                   call prs
  6202 00002E36 83C402                   add  sp, 2
  6203 00002E39 FF76F8                   push word [bp-8]
  6204 00002E3C E830D5                   call v
  6205 00002E3F 83C402                   add  sp, 2
  6206                                  
  6207                                  ;-598         prs("\n push ax");}
  6208                                  
  6209 00002E42 68[7C2F]                 push docall1_8
  6210 00002E45 E89D16                   call prs
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
  6229 00002E6B E87716                   call prs
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
  6240 00002E80 E86216                   call prs
  6241 00002E83 83C402                   add  sp, 2
  6242 00002E86 FF76F8                   push word [bp-8]
  6243 00002E89 E8E3D4                   call v
  6244 00002E8C 83C402                   add  sp, 2
  6245                                  
  6246                                  ;-602         prs("\n mov ah, 0\n push ax"); } }
  6247                                  
  6248 00002E8F 68[A62F]                 push docall1_11
  6249 00002E92 E85016                   call prs
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
  6260 00002EA5 E83D16                   call prs
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
  6286 00002ED7 E80B16                   call prs
  6287 00002EDA 83C402                   add  sp, 2
  6288 00002EDD 8D06CBD0                 lea  ax, [procname]
  6289 00002EE1 50                       push ax
  6290 00002EE2 E80016                   call prs
  6291 00002EE5 83C402                   add  sp, 2
  6292                                  
  6293                                  ;-606 	 if (narg>0) {prs("\n add  sp, ");
  6294                                  
  6295 00002EE8 8B46FC                   mov ax, [bp-4]
  6296 00002EEB 83F800                   cmp ax, 0
  6297 00002EEE 0F8E2400                 jle .docall1338
  6298 00002EF2 68[CF2F]                 push docall1_14
  6299 00002EF5 E8ED15                   call prs
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
  6311 00002F10 E82717                   call prunsign1
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
  6359 00002FE2 E81523                   call setblock
  6360 00002FE5 83C402                   add  sp, 2
  6361                                  
  6362                                  ;-612   if (DOS_ERR) error1("SetBlock , AX=");
  6363                                  
  6364 00002FE8 A1[6E00]                 mov ax, [DOS_ERR]
  6365 00002FEB 08C0                     or  al, al
  6366 00002FED 0F840900                 je .main339
  6367 00002FF1 68[2B30]                 push main_0
  6368 00002FF4 E80D18                   call error1
  6369 00002FF7 83C402                   add  sp, 2
  6370                                  
  6371                                  ;-613   segE=allocmem(4096);
  6372                                  
  6373                                  .main339:
  6374 00002FFA 680010                   push 4096
  6375 00002FFD E81323                   call allocmem
  6376 00003000 83C402                   add  sp, 2
  6377 00003003 A3[6400]                 mov word [segE], ax
  6378                                  
  6379                                  ;-614   if (DOS_ERR)  error1("alloc memory, AX=");
  6380                                  
  6381 00003006 A1[6E00]                 mov ax, [DOS_ERR]
  6382 00003009 08C0                     or  al, al
  6383 0000300B 0F840900                 je .main340
  6384 0000300F 68[3A30]                 push main_1
  6385 00003012 E8EF17                   call error1
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
  6405 00003027 E8B51E                   call epilog
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
  6425 0000305B E87516                   call fgets1
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
  6491 000030C8 E80C14                   call prnl
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
  6602 000031A2 E84013                   call prs
  6603 000031A5 83C402                   add  sp, 2
  6604 000031A8 8D06[0300]               lea  ax, [Version1]
  6605 000031AC 50                       push ax
  6606 000031AD E83513                   call prs
  6607 000031B0 83C402                   add  sp, 2
  6608                                  
  6609                                  ;-637   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6610                                  
  6611 000031B3 68[3F32]                 push getarg_5
  6612 000031B6 E82C13                   call prs
  6613 000031B9 83C402                   add  sp, 2
  6614 000031BC 8D06EE81                 lea  ax, [namein]
  6615 000031C0 50                       push ax
  6616 000031C1 E82113                   call prs
  6617 000031C4 83C402                   add  sp, 2
  6618 000031C7 68[4A32]                 push getarg_6
  6619 000031CA E81813                   call prs
  6620 000031CD 83C402                   add  sp, 2
  6621 000031D0 8D063182                 lea  ax, [namelst]
  6622 000031D4 50                       push ax
  6623 000031D5 E80D13                   call prs
  6624 000031D8 83C402                   add  sp, 2
  6625                                  
  6626                                  ;-638   prs("\norg  256 \njmp main"); 
  6627                                  
  6628 000031DB 68[5932]                 push getarg_7
  6629 000031DE E80413                   call prs
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
  6676 00003287 E82611                   call istoken
  6677 0000328A 83C402                   add  sp, 2
  6678 0000328D 08C0                     or  al, al
  6679 0000328F 0F843600                 je .parse348
  6680                                  
  6681                                  ;-643       if (istoken(T_DEFINE)) dodefine();
  6682                                  
  6683 00003293 68FF01                   push 511
  6684 00003296 E81711                   call istoken
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
  6695 000032AB E80211                   call istoken
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
  6706 000032C0 E84115                   call error1
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
  6757 0000330D E8D511                   call prs
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
  6786 0000333F E83820                   call from_far
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
  6836 000033A2 E84011                   call prs
  6837 000033A5 83C402                   add  sp, 2
  6838 000033A8 8D06[3F00]               lea  ax, [NameA]
  6839 000033AC 50                       push ax
  6840 000033AD E83511                   call prs
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
  6853 000033BC E82611                   call prs
  6854 000033BF 83C402                   add  sp, 2
  6855 000033C2 FF76FA                   push word [bp-6]
  6856 000033C5 E8B412                   call printint51
  6857 000033C8 83C402                   add  sp, 2
  6858                                  
  6859                                  ;-662   if (k!=0) error1("At least 1 function is missing! "); 
  6860                                  
  6861 000033CB 8B46FA                   mov ax, [bp-6]
  6862 000033CE 83F800                   cmp ax, 0
  6863 000033D1 0F840C00                 je  .checkcalls363
  6864 000033D5 68[2D34]                 push checkcalls_3
  6865 000033D8 E82914                   call error1
  6866 000033DB 83C402                   add  sp, 2
  6867                                  
  6868                                  ;-663     else prs(" All FUNCTIONs in place");
  6869                                  
  6870 000033DE E90900                   jmp .checkcalls364
  6871                                  .checkcalls363:
  6872 000033E1 68[4E34]                 push checkcalls_4
  6873 000033E4 E8FE10                   call prs
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
  6920 0000347D E86510                   call prs
  6921 00003480 83C402                   add  sp, 2
  6922 00003483 8D062B81                 lea  ax, [symbol]
  6923 00003487 50                       push ax
  6924 00003488 E85A10                   call prs
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
  6941 000034A9 E83910                   call prs
  6942 000034AC 83C402                   add  sp, 2
  6943 000034AF 8D062B81                 lea  ax, [symbol]
  6944 000034B3 50                       push ax
  6945 000034B4 E82E10                   call prs
  6946 000034B7 83C402                   add  sp, 2
  6947                                  
  6948                                  ;-671     error1(" Stop!!"); }
  6949                                  
  6950 000034BA 68[2A35]                 push doinclude_2
  6951 000034BD E84413                   call error1
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
  6973 000034E1 E80110                   call prs
  6974 000034E4 83C402                   add  sp, 2
  6975 000034E7 8D06EE81                 lea  ax, [namein]
  6976 000034EB 50                       push ax
  6977 000034EC E8F60F                   call prs
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
  7052 000035A0 E8420F                   call prs
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
  7065 000035BB E8270F                   call prs
  7066 000035BE 83C402                   add  sp, 2
  7067                                  
  7068                                  ;-683     } else error1("Name of archive file missing"); token=getlex(); return;}
  7069                                  
  7070 000035C1 E90900                   jmp .dodefine370
  7071                                  .dodefine369:
  7072 000035C4 68[B936]                 push dodefine_3
  7073 000035C7 E83A12                   call error1
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
  7084 000035D9 E8F60D                   call expect
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
  7099 000035F6 E80B12                   call error1
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
  7114 00003617 E8EA11                   call error1
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
  7161 00003687 E8480D                   call expect
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
  7200 00003712 E89B0C                   call istoken
  7201 00003715 83C402                   add  sp, 2
  7202 00003718 08C0                     or  al, al
  7203 0000371A 0F841700                 je .stmt374
  7204                                  .stmt375:
  7205 0000371E 6A7D                     push 125
  7206 00003720 E88D0C                   call istoken
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
  7219 00003738 E8750C                   call istoken
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
  7230 0000374D E8600C                   call istoken
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
  7241 00003762 E84B0C                   call istoken
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
  7252 00003777 E8360C                   call istoken
  7253 0000377A 83C402                   add  sp, 2
  7254 0000377D 08C0                     or  al, al
  7255 0000377F 0F842200                 je .stmt384
  7256 00003783 68[E738]                 push stmt_0
  7257 00003786 E85C0D                   call prs
  7258 00003789 83C402                   add  sp, 2
  7259 0000378C E874D3                   call name1
  7260 0000378F 8D062B81                 lea  ax, [symbol]
  7261 00003793 50                       push ax
  7262 00003794 E84E0D                   call prs
  7263 00003797 83C402                   add  sp, 2
  7264 0000379A 6A3B                     push 59
  7265 0000379C E8330C                   call expect
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
  7276 000037B2 E8300D                   call prs
  7277 000037B5 83C402                   add  sp, 2
  7278 000037B8 E8D70B                   call next
  7279 000037BB 8946FE                   mov [bp-2], ax
  7280                                  
  7281                                  ;-700         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7282                                  
  7283                                  .stmt387:
  7284 000037BE 8B46FE                   mov ax, [bp-2]
  7285 000037C1 83F80A                   cmp ax, 10
  7286 000037C4 0F841100                 je  .stmt388
  7287 000037C8 FF76FE                   push word [bp-2]
  7288 000037CB E8B00C                   call prc
  7289 000037CE 83C402                   add  sp, 2
  7290 000037D1 E8BE0B                   call next
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
  7302 000037E5 E8C80B                   call istoken
  7303 000037E8 83C402                   add  sp, 2
  7304 000037EB 08C0                     or  al, al
  7305 000037ED 0F844B00                 je .stmt390
  7306 000037F1 A1[1C00]                 mov ax, [token]
  7307 000037F4 83F87B                   cmp ax, 123
  7308 000037F7 0F853500                 jne .stmt391
  7309 000037FB 68[F338]                 push stmt_2
  7310 000037FE E8E40C                   call prs
  7311 00003801 83C402                   add  sp, 2
  7312 00003804 E88B0B                   call next
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
  7324 00003819 E8620C                   call prc
  7325 0000381C 83C402                   add  sp, 2
  7326 0000381F E8700B                   call next
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
  7341 00003833 E8CE0F                   call error1
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
  7353 0000383F E86E0B                   call istoken
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
  7364 00003853 E85A0B                   call istoken
  7365 00003856 83C402                   add  sp, 2
  7366 00003859 08C0                     or  al, al
  7367 0000385B 0F840300                 je .stmt398
  7368                                  
  7369                                  ;-708   else if(istoken(T_RETURN)) {
  7370                                  
  7371 0000385F E98300                   jmp .stmt399
  7372                                  .stmt398:
  7373 00003862 680002                   push 512
  7374 00003865 E8480B                   call istoken
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
  7390 00003881 E8610C                   call prs
  7391 00003884 83C402                   add  sp, 2
  7392                                  
  7393                                  ;-711         prs(fname);
  7394                                  
  7395 00003887 8D06AB81                 lea  ax, [fname]
  7396 0000388B 50                       push ax
  7397 0000388C E8560C                   call prs
  7398 0000388F 83C402                   add  sp, 2
  7399                                  
  7400                                  ;-712         nreturn++; 
  7401                                  
  7402 00003892 FF06[2600]               inc  word[nreturn]
  7403                                  
  7404                                  ;-713         expect(';');
  7405                                  
  7406 00003896 6A3B                     push 59
  7407 00003898 E8370B                   call expect
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
  7424 000038AD E8350C                   call prs
  7425 000038B0 83C402                   add  sp, 2
  7426                                  
  7427                                  ;-717         prs(symbol); prc(':');  
  7428                                  
  7429 000038B3 8D062B81                 lea  ax, [symbol]
  7430 000038B7 50                       push ax
  7431 000038B8 E82A0C                   call prs
  7432 000038BB 83C402                   add  sp, 2
  7433 000038BE 6A3A                     push 58
  7434 000038C0 E8BB0B                   call prc
  7435 000038C3 83C402                   add  sp, 2
  7436                                  
  7437                                  ;-718         expect(T_NAME); 
  7438                                  
  7439 000038C6 680001                   push 256
  7440 000038C9 E8060B                   call expect
  7441 000038CC 83C402                   add  sp, 2
  7442                                  
  7443                                  ;-719         expect(':'); 
  7444                                  
  7445 000038CF 6A3A                     push 58
  7446 000038D1 E8FE0A                   call expect
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
  7458 000038DF E8F00A                   call expect
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
  7494 0000391E E8C40B                   call prs
  7495 00003921 83C402                   add  sp, 2
  7496                                  
  7497                                  ;-725   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7498                                  
  7499                                  .L1:
  7500 00003924 E85C03                   call getlex
  7501 00003927 A3[1C00]                 mov word [token], ax
  7502 0000392A FF36[2E00]               push word [lexval]
  7503 0000392E E8090D                   call prunsign1
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
  7514 00003946 E8350B                   call prc
  7515 00003949 83C402                   add  sp, 2
  7516 0000394C EBD6                     jmp .L1
  7517                                  .doemit405:
  7518 0000394E 6A29                     push 41
  7519 00003950 E87F0A                   call expect
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
  7543 0000396F E8730B                   call prs
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
  7554 00003985 E85D0B                   call prs
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
  7568 000039A4 E83E0B                   call prs
  7569 000039A7 83C402                   add  sp, 2
  7570                                  
  7571                                  ;-732                            else prs("\n ja  .");//ZF=0 CF=0
  7572                                  
  7573 000039AA E90900                   jmp .cmpneg412
  7574                                  .cmpneg411:
  7575 000039AD 68[5A3A]                 push cmpneg_3
  7576 000039B0 E8320B                   call prs
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
  7591 000039CF E8130B                   call prs
  7592 000039D2 83C402                   add  sp, 2
  7593 000039D5 FF7604                   push word [bp+4]
  7594 000039D8 E85F0C                   call prunsign1
  7595 000039DB 83C402                   add  sp, 2
  7596                                  
  7597                                  ;-734                                prs("\n jl  .");}//          SF!=OF
  7598                                  
  7599 000039DE 68[713A]                 push cmpneg_5
  7600 000039E1 E8010B                   call prs
  7601 000039E4 83C402                   add  sp, 2
  7602                                  
  7603                                  ;-735                            else{prs(" ;unsigned : "); prunsign1(ids);
  7604                                  
  7605 000039E7 E91B00                   jmp .cmpneg416
  7606                                  .cmpneg415:
  7607 000039EA 68[7A3A]                 push cmpneg_6
  7608 000039ED E8F50A                   call prs
  7609 000039F0 83C402                   add  sp, 2
  7610 000039F3 FF7604                   push word [bp+4]
  7611 000039F6 E8410C                   call prunsign1
  7612 000039F9 83C402                   add  sp, 2
  7613                                  
  7614                                  ;-736                                prs("\n jb  .");}//jb=jc=CF=1
  7615                                  
  7616 000039FC 68[883A]                 push cmpneg_7
  7617 000039FF E8E30A                   call prs
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
  7629 00003A15 E8CD0A                   call prs
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
  7640 00003A2B E8B70A                   call prs
  7641 00003A2E 83C402                   add  sp, 2
  7642                                  
  7643                                  ;-739   else error1("internal error compare unknown in CMPNEG()");  }
  7644                                  
  7645 00003A31 E90900                   jmp .cmpneg421
  7646                                  .cmpneg420:
  7647 00003A34 68[A33A]                 push cmpneg_10
  7648 00003A37 E8CA0D                   call error1
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
  7688 00003AD5 E80D0A                   call prs
  7689 00003AD8 83C402                   add  sp, 2
  7690 00003ADB 8D06AB81                 lea  ax, [fname]
  7691 00003ADF 50                       push ax
  7692 00003AE0 E8020A                   call prs
  7693 00003AE3 83C402                   add  sp, 2
  7694 00003AE6 FF7604                   push word [bp+4]
  7695 00003AE9 E84E0B                   call prunsign1
  7696 00003AEC 83C402                   add  sp, 2
  7697 00003AEF 6A3A                     push 58
  7698 00003AF1 E88A09                   call prc
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
  7713 00003B04 E8DE09                   call prs
  7714 00003B07 83C402                   add  sp, 2
  7715 00003B0A 8D06AB81                 lea  ax, [fname]
  7716 00003B0E 50                       push ax
  7717 00003B0F E8D309                   call prs
  7718 00003B12 83C402                   add  sp, 2
  7719 00003B15 FF7604                   push word [bp+4]
  7720 00003B18 E81F0B                   call prunsign1
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
  7743 00003B3D E89C0A                   call pint1
  7744 00003B40 83C402                   add  sp, 2
  7745 00003B43 E8C6FB                   call stmt
  7746                                  
  7747                                  ;-745   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7748                                  
  7749 00003B46 680202                   push 514
  7750 00003B49 E86408                   call istoken
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
  7808 00003BA8 E82708                   call expect
  7809 00003BAB 83C402                   add  sp, 2
  7810 00003BAE E893D4                   call pexpr
  7811 00003BB1 FF06[2800]               inc  word[nlabel]
  7812 00003BB5 A1[2800]                 mov ax, [nlabel]
  7813 00003BB8 8946FC                   mov [bp-4], ax
  7814 00003BBB FF76FC                   push word [bp-4]
  7815 00003BBE E81B0A                   call pint1
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
  7852 00003BFF E8DA09                   call pint1
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
  7949 00003C87 E80807                   call next
  7950 00003C8A 8846FE                   mov [bp-2], al
  7951 00003C8D 8A46FE                   mov al, [bp-2]
  7952 00003C90 3C00                     cmp al, 0
  7953 00003C92 0F850600                 jne .getlex430
  7954 00003C96 B80000                   mov ax, 0
  7955 00003C99 E9F404                   jmp .retngetlex
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
  7971 00003CB9 E8D606                   call next
  7972 00003CBC B82603                   mov ax, 806
  7973 00003CBF E9CE04                   jmp .retngetlex
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
  7985 00003CD4 E8BB06                   call next
  7986 00003CD7 B82703                   mov ax, 807
  7987 00003CDA E9B304                   jmp .retngetlex
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
  7999 00003CEF E8A006                   call next
  8000 00003CF2 B83803                   mov ax, 824
  8001 00003CF5 E99804                   jmp .retngetlex
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
  8013 00003D0A E88506                   call next
  8014 00003D0D B82B03                   mov ax, 811
  8015 00003D10 E97D04                   jmp .retngetlex
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
  8027 00003D25 E86A06                   call next
  8028 00003D28 B8D804                   mov ax, 1240
  8029 00003D2B E96204                   jmp .retngetlex
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
  8041 00003D40 E84F06                   call next
  8042 00003D43 B8D904                   mov ax, 1241
  8043 00003D46 E94704                   jmp .retngetlex
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
  8055 00003D5B E83406                   call next
  8056 00003D5E B8C304                   mov ax, 1219
  8057 00003D61 E92C04                   jmp .retngetlex
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
  8069 00003D76 E81906                   call next
  8070 00003D79 B8C904                   mov ax, 1225
  8071 00003D7C E91104                   jmp .retngetlex
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
  8083 00003D91 E8FE05                   call next
  8084 00003D94 B8CE04                   mov ax, 1230
  8085 00003D97 E9F603                   jmp .retngetlex
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
  8097 00003DAC E8E305                   call next
  8098 00003DAF B8CF04                   mov ax, 1231
  8099 00003DB2 E9DB03                   jmp .retngetlex
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
  8111 00003DC7 E8C805                   call next
  8112 00003DCA B8D204                   mov ax, 1234
  8113 00003DCD E9C003                   jmp .retngetlex
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
  8125 00003DE2 E8AD05                   call next
  8126 00003DE5 B8D304                   mov ax, 1235
  8127 00003DE8 E9A503                   jmp .retngetlex
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
  8139 00003DFD E89205                   call next
  8140 00003E00 B8D004                   mov ax, 1232
  8141 00003E03 E98A03                   jmp .retngetlex
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
  8153 00003E18 E87705                   call next
  8154 00003E1B B8D104                   mov ax, 1233
  8155 00003E1E E96F03                   jmp .retngetlex
  8156                                  .getlex459:
  8157                                  
  8158                                  ;-779   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8159                                  
  8160                                  .getlex458:
  8161 00003E21 8A46FE                   mov al, byte [bp-2]
  8162 00003E24 B400                     mov ah, 0
  8163 00003E26 50                       push ax
  8164 00003E27 68[9241]                 push getlex_0
  8165 00003E2A E8B5C3                   call instr1
  8166 00003E2D 83C404                   add  sp, 4
  8167 00003E30 08C0                     or  al, al
  8168 00003E32 0F840600                 je .getlex460
  8169 00003E36 8A46FE                   mov al, [bp-2]
  8170 00003E39 E95403                   jmp .retngetlex
  8171                                  
  8172                                  ;-780   if (c == '/') { if (thechar == '/') {
  8173                                  
  8174                                  .getlex460:
  8175 00003E3C 8A46FE                   mov al, [bp-2]
  8176 00003E3F 3C2F                     cmp al, 47
  8177 00003E41 0F852900                 jne .getlex461
  8178 00003E45 A0[2100]                 mov al, [thechar]
  8179 00003E48 3C2F                     cmp al, 47
  8180 00003E4A 0F852000                 jne .getlex462
  8181                                  
  8182                                  ;-781       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  8183                                  
  8184                                  .getlex463:
  8185 00003E4E E84105                   call next
  8186 00003E51 8846FE                   mov [bp-2], al
  8187 00003E54 8A46FE                   mov al, byte [bp-2]
  8188 00003E57 B400                     mov ah, 0
  8189 00003E59 50                       push ax
  8190 00003E5A E84B09                   call ifEOL
  8191 00003E5D 83C402                   add  sp, 2
  8192 00003E60 3C00                     cmp al, 0
  8193 00003E62 0F850200                 jne .getlex464
  8194 00003E66 EBE6                     jmp .getlex463
  8195                                  .getlex464:
  8196 00003E68 E818FE                   call getlex
  8197 00003E6B E92203                   jmp .retngetlex
  8198                                  .getlex462:
  8199                                  
  8200                                  ;-782   if (c == '/') { if (thechar == '*') {
  8201                                  
  8202                                  .getlex461:
  8203 00003E6E 8A46FE                   mov al, [bp-2]
  8204 00003E71 3C2F                     cmp al, 47
  8205 00003E73 0F853A00                 jne .getlex465
  8206 00003E77 A0[2100]                 mov al, [thechar]
  8207 00003E7A 3C2A                     cmp al, 42
  8208 00003E7C 0F852B00                 jne .getlex466
  8209                                  
  8210                                  ;-783       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8211                                  
  8212                                  .g2:
  8213 00003E80 E80F05                   call next
  8214 00003E83 8846FE                   mov [bp-2], al
  8215 00003E86 8A46FE                   mov al, [bp-2]
  8216 00003E89 3C2A                     cmp al, 42
  8217 00003E8B 0F840200                 je  .getlex467
  8218 00003E8F EBEF                     jmp .g2
  8219                                  .getlex467:
  8220 00003E91 A0[2100]                 mov al, [thechar]
  8221 00003E94 3C2F                     cmp al, 47
  8222 00003E96 0F840200                 je  .getlex468
  8223 00003E9A EBE4                     jmp .g2
  8224                                  
  8225                                  ;-784       c=next(); return getlex(); } else  return '/'; }
  8226                                  
  8227                                  .getlex468:
  8228 00003E9C E8F304                   call next
  8229 00003E9F 8846FE                   mov [bp-2], al
  8230 00003EA2 E8DEFD                   call getlex
  8231 00003EA5 E9E802                   jmp .retngetlex
  8232 00003EA8 E90600                   jmp .getlex469
  8233                                  .getlex466:
  8234 00003EAB B82F00                   mov ax, 47
  8235 00003EAE E9DF02                   jmp .retngetlex
  8236                                  .getlex469:
  8237                                  
  8238                                  ;-785   if (c == '"') {getstring(c); return T_STRING;}
  8239                                  
  8240                                  .getlex465:
  8241 00003EB1 8A46FE                   mov al, [bp-2]
  8242 00003EB4 3C22                     cmp al, 34
  8243 00003EB6 0F851200                 jne .getlex470
  8244 00003EBA 8A46FE                   mov al, byte [bp-2]
  8245 00003EBD B400                     mov ah, 0
  8246 00003EBF 50                       push ax
  8247 00003EC0 E89804                   call getstring
  8248 00003EC3 83C402                   add  sp, 2
  8249 00003EC6 B80201                   mov ax, 258
  8250 00003EC9 E9C402                   jmp .retngetlex
  8251                                  
  8252                                  ;-786   if (digit(c)) { getdigit(c); return T_CONST; }
  8253                                  
  8254                                  .getlex470:
  8255 00003ECC 8A46FE                   mov al, byte [bp-2]
  8256 00003ECF B400                     mov ah, 0
  8257 00003ED1 50                       push ax
  8258 00003ED2 E8A7C3                   call digit
  8259 00003ED5 83C402                   add  sp, 2
  8260 00003ED8 08C0                     or  al, al
  8261 00003EDA 0F841200                 je .getlex471
  8262 00003EDE 8A46FE                   mov al, byte [bp-2]
  8263 00003EE1 B400                     mov ah, 0
  8264 00003EE3 50                       push ax
  8265 00003EE4 E89E03                   call getdigit
  8266 00003EE7 83C402                   add  sp, 2
  8267 00003EEA B80101                   mov ax, 257
  8268 00003EED E9A002                   jmp .retngetlex
  8269                                  
  8270                                  ;-787   if (c==39) { lexval=next();
  8271                                  
  8272                                  .getlex471:
  8273 00003EF0 8A46FE                   mov al, [bp-2]
  8274 00003EF3 3C27                     cmp al, 39
  8275 00003EF5 0F854F00                 jne .getlex472
  8276 00003EF9 E89604                   call next
  8277 00003EFC A3[2E00]                 mov word [lexval], ax
  8278                                  
  8279                                  ;-788     if (lexval==92) {lexval=next();
  8280                                  
  8281 00003EFF A1[2E00]                 mov ax, [lexval]
  8282 00003F02 83F85C                   cmp ax, 92
  8283 00003F05 0F853600                 jne .getlex473
  8284 00003F09 E88604                   call next
  8285 00003F0C A3[2E00]                 mov word [lexval], ax
  8286                                  
  8287                                  ;-789       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8288                                  
  8289 00003F0F A1[2E00]                 mov ax, [lexval]
  8290 00003F12 83F86E                   cmp ax, 110
  8291 00003F15 0F850600                 jne .getlex474
  8292 00003F19 B80A00                   mov ax, 10
  8293 00003F1C A3[2E00]                 mov word [lexval], ax
  8294                                  .getlex474:
  8295 00003F1F A1[2E00]                 mov ax, [lexval]
  8296 00003F22 83F874                   cmp ax, 116
  8297 00003F25 0F850600                 jne .getlex475
  8298 00003F29 B80900                   mov ax, 9
  8299 00003F2C A3[2E00]                 mov word [lexval], ax
  8300                                  
  8301                                  ;-790       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8302                                  
  8303                                  .getlex475:
  8304 00003F2F A1[2E00]                 mov ax, [lexval]
  8305 00003F32 83F830                   cmp ax, 48
  8306 00003F35 0F850600                 jne .getlex476
  8307 00003F39 B80000                   mov ax, 0
  8308 00003F3C A3[2E00]                 mov word [lexval], ax
  8309                                  .getlex476:
  8310                                  .getlex473:
  8311 00003F3F E85004                   call next
  8312 00003F42 B80101                   mov ax, 257
  8313 00003F45 E94802                   jmp .retngetlex
  8314                                  
  8315                                  ;-791   if (alnum(c)) { 
  8316                                  
  8317                                  .getlex472:
  8318 00003F48 8A46FE                   mov al, byte [bp-2]
  8319 00003F4B B400                     mov ah, 0
  8320 00003F4D 50                       push ax
  8321 00003F4E E8D3C3                   call alnum
  8322 00003F51 83C402                   add  sp, 2
  8323 00003F54 08C0                     or  al, al
  8324 00003F56 0F842D02                 je .getlex477
  8325                                  
  8326                                  ;-792     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8327                                  
  8328 00003F5A 8D062B81                 lea  ax, [symbol]
  8329 00003F5E 50                       push ax
  8330 00003F5F 8D06DCD0                 lea  ax, [symboltemp]
  8331 00003F63 50                       push ax
  8332 00003F64 E8FFC1                   call strcpy
  8333 00003F67 83C404                   add  sp, 4
  8334 00003F6A B82B81                   mov ax, symbol
  8335 00003F6D 8946FC                   mov [bp-4], ax
  8336 00003F70 8A46FE                   mov al, [bp-2]
  8337 00003F73 8B5EFC                   mov  bx, [bp-4]
  8338 00003F76 8807                     mov  [bx], al
  8339 00003F78 FF46FC                   inc  word[bp-4]
  8340                                  
  8341                                  ;-793     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8342                                  
  8343                                  .getlex478:
  8344 00003F7B A0[2100]                 mov al, byte [thechar]
  8345 00003F7E B400                     mov ah, 0
  8346 00003F80 50                       push ax
  8347 00003F81 E8A0C3                   call alnum
  8348 00003F84 83C402                   add  sp, 2
  8349 00003F87 08C0                     or  al, al
  8350 00003F89 0F841300                 je .getlex479
  8351 00003F8D E80204                   call next
  8352 00003F90 8846FE                   mov [bp-2], al
  8353 00003F93 8A46FE                   mov al, [bp-2]
  8354 00003F96 8B5EFC                   mov  bx, [bp-4]
  8355 00003F99 8807                     mov  [bx], al
  8356 00003F9B FF46FC                   inc  word[bp-4]
  8357                                  
  8358                                  ;-794       *p=0;
  8359                                  
  8360 00003F9E EBDB                     jmp .getlex478
  8361                                  .getlex479:
  8362 00003FA0 B80000                   mov ax, 0
  8363 00003FA3 8B5EFC                   mov  bx, [bp-4]
  8364 00003FA6 8807                     mov  [bx], al
  8365                                  
  8366                                  ;-795     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8367                                  
  8368 00003FA8 68[A841]                 push getlex_1
  8369 00003FAB 8D062B81                 lea  ax, [symbol]
  8370 00003FAF 50                       push ax
  8371 00003FB0 E8E3C1                   call eqstr
  8372 00003FB3 83C404                   add  sp, 4
  8373 00003FB6 08C0                     or  al, al
  8374 00003FB8 0F840600                 je .getlex480
  8375 00003FBC B81302                   mov ax, 531
  8376 00003FBF E9CE01                   jmp .retngetlex
  8377                                  
  8378                                  ;-796     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8379                                  
  8380                                  .getlex480:
  8381 00003FC2 68[AF41]                 push getlex_2
  8382 00003FC5 8D062B81                 lea  ax, [symbol]
  8383 00003FC9 50                       push ax
  8384 00003FCA E8C9C1                   call eqstr
  8385 00003FCD 83C404                   add  sp, 4
  8386 00003FD0 08C0                     or  al, al
  8387 00003FD2 0F840600                 je .getlex481
  8388 00003FD6 B81402                   mov ax, 532
  8389 00003FD9 E9B401                   jmp .retngetlex
  8390                                  
  8391                                  ;-797     if (eqstr(symbol,"void"    )) return T_VOID;
  8392                                  
  8393                                  .getlex481:
  8394 00003FDC 68[B841]                 push getlex_3
  8395 00003FDF 8D062B81                 lea  ax, [symbol]
  8396 00003FE3 50                       push ax
  8397 00003FE4 E8AFC1                   call eqstr
  8398 00003FE7 83C404                   add  sp, 4
  8399 00003FEA 08C0                     or  al, al
  8400 00003FEC 0F840600                 je .getlex482
  8401 00003FF0 B81102                   mov ax, 529
  8402 00003FF3 E99A01                   jmp .retngetlex
  8403                                  
  8404                                  ;-798     if (eqstr(symbol,"int"     )) return T_INT;
  8405                                  
  8406                                  .getlex482:
  8407 00003FF6 68[BD41]                 push getlex_4
  8408 00003FF9 8D062B81                 lea  ax, [symbol]
  8409 00003FFD 50                       push ax
  8410 00003FFE E895C1                   call eqstr
  8411 00004001 83C404                   add  sp, 4
  8412 00004004 08C0                     or  al, al
  8413 00004006 0F840600                 je .getlex483
  8414 0000400A B80502                   mov ax, 517
  8415 0000400D E98001                   jmp .retngetlex
  8416                                  
  8417                                  ;-799     if (eqstr(symbol,"long"    )) return T_LONG;
  8418                                  
  8419                                  .getlex483:
  8420 00004010 68[C141]                 push getlex_5
  8421 00004013 8D062B81                 lea  ax, [symbol]
  8422 00004017 50                       push ax
  8423 00004018 E87BC1                   call eqstr
  8424 0000401B 83C404                   add  sp, 4
  8425 0000401E 08C0                     or  al, al
  8426 00004020 0F840600                 je .getlex484
  8427 00004024 B81502                   mov ax, 533
  8428 00004027 E96601                   jmp .retngetlex
  8429                                  
  8430                                  ;-800     if (eqstr(symbol,"char"    )) return T_CHAR;
  8431                                  
  8432                                  .getlex484:
  8433 0000402A 68[C641]                 push getlex_6
  8434 0000402D 8D062B81                 lea  ax, [symbol]
  8435 00004031 50                       push ax
  8436 00004032 E861C1                   call eqstr
  8437 00004035 83C404                   add  sp, 4
  8438 00004038 08C0                     or  al, al
  8439 0000403A 0F840600                 je .getlex485
  8440 0000403E B81202                   mov ax, 530
  8441 00004041 E94C01                   jmp .retngetlex
  8442                                  
  8443                                  ;-801     if (eqstr(symbol,"asm"     )) return T_ASM;
  8444                                  
  8445                                  .getlex485:
  8446 00004044 68[CB41]                 push getlex_7
  8447 00004047 8D062B81                 lea  ax, [symbol]
  8448 0000404B 50                       push ax
  8449 0000404C E847C1                   call eqstr
  8450 0000404F 83C404                   add  sp, 4
  8451 00004052 08C0                     or  al, al
  8452 00004054 0F840600                 je .getlex486
  8453 00004058 B80602                   mov ax, 518
  8454 0000405B E93201                   jmp .retngetlex
  8455                                  
  8456                                  ;-802     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8457                                  
  8458                                  .getlex486:
  8459 0000405E 68[CF41]                 push getlex_8
  8460 00004061 8D062B81                 lea  ax, [symbol]
  8461 00004065 50                       push ax
  8462 00004066 E82DC1                   call eqstr
  8463 00004069 83C404                   add  sp, 4
  8464 0000406C 08C0                     or  al, al
  8465 0000406E 0F840600                 je .getlex487
  8466 00004072 B80702                   mov ax, 519
  8467 00004075 E91801                   jmp .retngetlex
  8468                                  
  8469                                  ;-803     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8470                                  
  8471                                  .getlex487:
  8472 00004078 68[D541]                 push getlex_9
  8473 0000407B 8D062B81                 lea  ax, [symbol]
  8474 0000407F 50                       push ax
  8475 00004080 E813C1                   call eqstr
  8476 00004083 83C404                   add  sp, 4
  8477 00004086 08C0                     or  al, al
  8478 00004088 0F840600                 je .getlex488
  8479 0000408C B80802                   mov ax, 520
  8480 0000408F E9FE00                   jmp .retngetlex
  8481                                  
  8482                                  ;-804     if (eqstr(symbol,"return"  )) return T_RETURN;
  8483                                  
  8484                                  .getlex488:
  8485 00004092 68[DE41]                 push getlex_10
  8486 00004095 8D062B81                 lea  ax, [symbol]
  8487 00004099 50                       push ax
  8488 0000409A E8F9C0                   call eqstr
  8489 0000409D 83C404                   add  sp, 4
  8490 000040A0 08C0                     or  al, al
  8491 000040A2 0F840600                 je .getlex489
  8492 000040A6 B80002                   mov ax, 512
  8493 000040A9 E9E400                   jmp .retngetlex
  8494                                  
  8495                                  ;-805     if (eqstr(symbol,"if"      )) return T_IF;
  8496                                  
  8497                                  .getlex489:
  8498 000040AC 68[E541]                 push getlex_11
  8499 000040AF 8D062B81                 lea  ax, [symbol]
  8500 000040B3 50                       push ax
  8501 000040B4 E8DFC0                   call eqstr
  8502 000040B7 83C404                   add  sp, 4
  8503 000040BA 08C0                     or  al, al
  8504 000040BC 0F840600                 je .getlex490
  8505 000040C0 B80102                   mov ax, 513
  8506 000040C3 E9CA00                   jmp .retngetlex
  8507                                  
  8508                                  ;-806     if (eqstr(symbol,"else"    )) return T_ELSE;
  8509                                  
  8510                                  .getlex490:
  8511 000040C6 68[E841]                 push getlex_12
  8512 000040C9 8D062B81                 lea  ax, [symbol]
  8513 000040CD 50                       push ax
  8514 000040CE E8C5C0                   call eqstr
  8515 000040D1 83C404                   add  sp, 4
  8516 000040D4 08C0                     or  al, al
  8517 000040D6 0F840600                 je .getlex491
  8518 000040DA B80202                   mov ax, 514
  8519 000040DD E9B000                   jmp .retngetlex
  8520                                  
  8521                                  ;-807     if (eqstr(symbol,"while"   )) return T_WHILE;
  8522                                  
  8523                                  .getlex491:
  8524 000040E0 68[ED41]                 push getlex_13
  8525 000040E3 8D062B81                 lea  ax, [symbol]
  8526 000040E7 50                       push ax
  8527 000040E8 E8ABC0                   call eqstr
  8528 000040EB 83C404                   add  sp, 4
  8529 000040EE 08C0                     or  al, al
  8530 000040F0 0F840600                 je .getlex492
  8531 000040F4 B80302                   mov ax, 515
  8532 000040F7 E99600                   jmp .retngetlex
  8533                                  
  8534                                  ;-808     if (eqstr(symbol,"do"      )) return T_DO;
  8535                                  
  8536                                  .getlex492:
  8537 000040FA 68[F341]                 push getlex_14
  8538 000040FD 8D062B81                 lea  ax, [symbol]
  8539 00004101 50                       push ax
  8540 00004102 E891C0                   call eqstr
  8541 00004105 83C404                   add  sp, 4
  8542 00004108 08C0                     or  al, al
  8543 0000410A 0F840600                 je .getlex493
  8544 0000410E B80402                   mov ax, 516
  8545 00004111 E97C00                   jmp .retngetlex
  8546                                  
  8547                                  ;-809     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8548                                  
  8549                                  .getlex493:
  8550 00004114 68[F641]                 push getlex_15
  8551 00004117 8D062B81                 lea  ax, [symbol]
  8552 0000411B 50                       push ax
  8553 0000411C E877C0                   call eqstr
  8554 0000411F 83C404                   add  sp, 4
  8555 00004122 08C0                     or  al, al
  8556 00004124 0F840600                 je .getlex494
  8557 00004128 B80902                   mov ax, 521
  8558 0000412B E96200                   jmp .retngetlex
  8559                                  
  8560                                  ;-810     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8561                                  
  8562                                  .getlex494:
  8563 0000412E 68[FB41]                 push getlex_16
  8564 00004131 8D062B81                 lea  ax, [symbol]
  8565 00004135 50                       push ax
  8566 00004136 E85DC0                   call eqstr
  8567 00004139 83C404                   add  sp, 4
  8568 0000413C 08C0                     or  al, al
  8569 0000413E 0F840600                 je .getlex495
  8570 00004142 B8FF01                   mov ax, 511
  8571 00004145 E94800                   jmp .retngetlex
  8572                                  
  8573                                  ;-811     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8574                                  
  8575                                  .getlex495:
  8576 00004148 68[0242]                 push getlex_17
  8577 0000414B 8D062B81                 lea  ax, [symbol]
  8578 0000414F 50                       push ax
  8579 00004150 E843C0                   call eqstr
  8580 00004153 83C404                   add  sp, 4
  8581 00004156 08C0                     or  al, al
  8582 00004158 0F840600                 je .getlex496
  8583 0000415C B8FE01                   mov ax, 510
  8584 0000415F E92E00                   jmp .retngetlex
  8585                                  
  8586                                  ;-812     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8587                                  
  8588                                  .getlex496:
  8589 00004162 E8BF00                   call convertdefine
  8590 00004165 08C0                     or  al, al
  8591 00004167 0F841600                 je .getlex497
  8592 0000416B 8D06DCD0                 lea  ax, [symboltemp]
  8593 0000416F 50                       push ax
  8594 00004170 8D062B81                 lea  ax, [symbol]
  8595 00004174 50                       push ax
  8596 00004175 E8EEBF                   call strcpy
  8597 00004178 83C404                   add  sp, 4
  8598 0000417B B80101                   mov ax, 257
  8599 0000417E E90F00                   jmp .retngetlex
  8600                                  
  8601                                  ;-813     return T_NAME; } error1("Input item not recognized"); }
  8602                                  
  8603                                  .getlex497:
  8604 00004181 B80001                   mov ax, 256
  8605 00004184 E90900                   jmp .retngetlex
  8606                                  .getlex477:
  8607 00004187 68[0A42]                 push getlex_18
  8608 0000418A E87706                   call error1
  8609 0000418D 83C402                   add  sp, 2
  8610                                  
  8611                                  ;-814 
  8612                                  
  8613                                  
  8614                                  ;-815 int convertdefine() { int i; int j;   i=0;
  8615                                  
  8616 00004190 C9                       .retngetlex: LEAVE
  8617 00004191 C3                       ret
  8618 00004192 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8619 0000419B 3A252D3E3C3D2B2126-
  8620 000041A4 7C233F00           
  8621 000041A8 7369676E656400          getlex_1 db "signed",0
  8622 000041AF 756E7369676E656400      getlex_2 db "unsigned",0
  8623 000041B8 766F696400              getlex_3 db "void",0
  8624 000041BD 696E7400                getlex_4 db "int",0
  8625 000041C1 6C6F6E6700              getlex_5 db "long",0
  8626 000041C6 6368617200              getlex_6 db "char",0
  8627 000041CB 61736D00                getlex_7 db "asm",0
  8628 000041CF 5F5F61736D00            getlex_8 db "__asm",0
  8629 000041D5 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8630 000041DE 72657475726E00          getlex_10 db "return",0
  8631 000041E5 696600                  getlex_11 db "if",0
  8632 000041E8 656C736500              getlex_12 db "else",0
  8633 000041ED 7768696C6500            getlex_13 db "while",0
  8634 000041F3 646F00                  getlex_14 db "do",0
  8635 000041F6 676F746F00              getlex_15 db "goto",0
  8636 000041FB 646566696E6500          getlex_16 db "define",0
  8637 00004202 696E636C75646500        getlex_17 db "include",0
  8638 0000420A 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8639 00004213 6D206E6F7420726563-
  8640 0000421C 6F676E697A656400   
  8641                                  ENDP
  8642                                  
  8643                                  convertdefine: PROC
  8644                                  ;Function : convertdefine, Number of local variables: 2
  8645                                  ;   # type sign width addr used name   list of local variables
  8646                                  ;  200 var sign word   815 NULL i = bp-2
  8647                                  ;  201 var sign word   815 NULL j = bp-4;
  8648 00004224 C8040000                 ENTER  4,0
  8649 00004228 B80000                   mov ax, 0
  8650 0000422B 8946FE                   mov [bp-2], ax
  8651                                  
  8652                                  ;-816   while (i < GTop) {
  8653                                  
  8654                                  .convertdefine498:
  8655 0000422E 8B46FE                   mov ax, [bp-2]
  8656 00004231 3B06[2A00]               cmp ax, [GTop]
  8657 00004235 0F8D4400                 jge .convertdefine499
  8658                                  
  8659                                  ;-817    j=adrofname(i); 
  8660                                  
  8661 00004239 FF76FE                   push word [bp-2]
  8662 0000423C E895C6                   call adrofname
  8663 0000423F 83C402                   add  sp, 2
  8664 00004242 8946FC                   mov [bp-4], ax
  8665                                  
  8666                                  ;-818    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8667                                  
  8668 00004245 FF76FC                   push word [bp-4]
  8669 00004248 8D062B81                 lea  ax, [symbol]
  8670 0000424C 50                       push ax
  8671 0000424D E846BF                   call eqstr
  8672 00004250 83C404                   add  sp, 4
  8673 00004253 08C0                     or  al, al
  8674 00004255 0F841F00                 je .convertdefine500
  8675 00004259 8B5EFE                   mov bx, [bp-2]
  8676 0000425C 8A87B782                 mov al, [GType + bx]
  8677 00004260 3C23                     cmp al, 35
  8678 00004262 0F851200                 jne .convertdefine501
  8679 00004266 8B5EFE                   mov bx, [bp-2]
  8680 00004269 D1E3                     shl bx, 1
  8681 0000426B 8B87EB8A                 mov ax, [GData + bx]
  8682 0000426F A3[2E00]                 mov word [lexval], ax
  8683                                  
  8684                                  ;-819    return T_CONST; } }
  8685                                  
  8686 00004272 B80101                   mov ax, 257
  8687 00004275 E90B00                   jmp .retnconvertdefine
  8688                                  .convertdefine501:
  8689                                  
  8690                                  ;-820    i++; } 
  8691                                  
  8692                                  .convertdefine500:
  8693 00004278 FF46FE                   inc  word[bp-2]
  8694                                  
  8695                                  ;-821    return 0; }
  8696                                  
  8697 0000427B EBB1                     jmp .convertdefine498
  8698                                  .convertdefine499:
  8699 0000427D B80000                   mov ax, 0
  8700 00004280 E90000                   jmp .retnconvertdefine
  8701                                  
  8702                                  ;-822 int getdigit(char c) { int i;
  8703                                  
  8704 00004283 C9                       .retnconvertdefine: LEAVE
  8705 00004284 C3                       ret
  8706                                  ENDP
  8707                                  
  8708                                  getdigit: PROC
  8709                                  
  8710                                  ;-823     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8711                                  
  8712                                  ;Function : getdigit, Number of local variables: 2
  8713                                  ;   # type sign width addr used name   list of local variables
  8714                                  ;  200 var sign byte   822 NULL c = bp+4
  8715                                  ;  201 var sign word   822 NULL i = bp-2;
  8716 00004285 C8020000                 ENTER  2,0
  8717 00004289 B80000                   mov ax, 0
  8718 0000428C A3[2E00]                 mov word [lexval], ax
  8719 0000428F 8A4604                   mov al, [bp+4]
  8720 00004292 2C30                     sub al, 48
  8721 00004294 A3[2E00]                 mov word [lexval], ax
  8722                                  
  8723                                  ;-824     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8724                                  
  8725 00004297 A0[2100]                 mov al, [thechar]
  8726 0000429A 3C78                     cmp al, 120
  8727 0000429C 0F850600                 jne .getdigit502
  8728 000042A0 B85800                   mov ax, 88
  8729 000042A3 A2[2100]                 mov byte [thechar], al
  8730                                  .getdigit502:
  8731 000042A6 A0[2100]                 mov al, [thechar]
  8732 000042A9 3C58                     cmp al, 88
  8733 000042AB 0F856800                 jne .getdigit503
  8734 000042AF E8E000                   call next
  8735                                  
  8736                                  ;-825       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8737                                  
  8738                                  .getdigit504:
  8739 000042B2 A0[2100]                 mov al, byte [thechar]
  8740 000042B5 B400                     mov ah, 0
  8741 000042B7 50                       push ax
  8742 000042B8 E869C0                   call alnum
  8743 000042BB 83C402                   add  sp, 2
  8744 000042BE 08C0                     or  al, al
  8745 000042C0 0F845000                 je .getdigit505
  8746 000042C4 E8CB00                   call next
  8747 000042C7 884604                   mov [bp+4], al
  8748 000042CA 8A4604                   mov al, [bp+4]
  8749 000042CD 3C60                     cmp al, 96
  8750 000042CF 0F8E0800                 jle .getdigit506
  8751 000042D3 8A4604                   mov al, [bp+4]
  8752 000042D6 2C27                     sub al, 39
  8753 000042D8 884604                   mov [bp+4], al
  8754                                  
  8755                                  ;-826 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8756                                  
  8757                                  .getdigit506:
  8758 000042DB 8A4604                   mov al, [bp+4]
  8759 000042DE 3C40                     cmp al, 64
  8760 000042E0 0F8E0800                 jle .getdigit507
  8761 000042E4 8A4604                   mov al, [bp+4]
  8762 000042E7 2C07                     sub al, 7
  8763 000042E9 884604                   mov [bp+4], al
  8764                                  .getdigit507:
  8765 000042EC 8A4604                   mov al, [bp+4]
  8766 000042EF 2C30                     sub al, 48
  8767 000042F1 884604                   mov [bp+4], al
  8768 000042F4 A1[2E00]                 mov ax, [lexval]
  8769 000042F7 C1E004                   shl ax, 4
  8770 000042FA A3[2E00]                 mov word [lexval], ax
  8771                                  
  8772                                  ;-827      i=0; i=c; lexval=lexval+i;}
  8773                                  
  8774 000042FD B80000                   mov ax, 0
  8775 00004300 8946FE                   mov [bp-2], ax
  8776 00004303 8A4604                   mov al, [bp+4]
  8777 00004306 8946FE                   mov [bp-2], ax
  8778 00004309 A1[2E00]                 mov ax, [lexval]
  8779 0000430C 0346FE                   add ax, [bp-2]
  8780 0000430F A3[2E00]                 mov word [lexval], ax
  8781                                  
  8782                                  ;-828     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8783                                  
  8784 00004312 EB9E                     jmp .getdigit504
  8785                                  .getdigit505:
  8786 00004314 E94200                   jmp .getdigit508
  8787                                  .getdigit503:
  8788                                  .getdigit509:
  8789 00004317 A0[2100]                 mov al, byte [thechar]
  8790 0000431A B400                     mov ah, 0
  8791 0000431C 50                       push ax
  8792 0000431D E85CBF                   call digit
  8793 00004320 83C402                   add  sp, 2
  8794 00004323 08C0                     or  al, al
  8795 00004325 0F843000                 je .getdigit510
  8796 00004329 E86600                   call next
  8797 0000432C 884604                   mov [bp+4], al
  8798 0000432F 8A4604                   mov al, [bp+4]
  8799 00004332 2C30                     sub al, 48
  8800 00004334 884604                   mov [bp+4], al
  8801 00004337 A1[2E00]                 mov ax, [lexval]
  8802 0000433A BB0A00                   mov bx, 10
  8803 0000433D F7E3                     mul bx
  8804 0000433F A3[2E00]                 mov word [lexval], ax
  8805                                  
  8806                                  ;-829      i=0; i=c; lexval=lexval+i; } } 
  8807                                  
  8808 00004342 B80000                   mov ax, 0
  8809 00004345 8946FE                   mov [bp-2], ax
  8810 00004348 8A4604                   mov al, [bp+4]
  8811 0000434B 8946FE                   mov [bp-2], ax
  8812 0000434E A1[2E00]                 mov ax, [lexval]
  8813 00004351 0346FE                   add ax, [bp-2]
  8814 00004354 A3[2E00]                 mov word [lexval], ax
  8815 00004357 EBBE                     jmp .getdigit509
  8816                                  .getdigit510:
  8817                                  
  8818                                  ;-830 }
  8819                                  
  8820                                  .getdigit508:
  8821                                  
  8822                                  ;-831 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8823 00004359 C9                       LEAVE
  8824 0000435A C3                       ret
  8825                                  ENDP
  8826                                  
  8827                                  getstring: PROC
  8828                                  ;Function : getstring, Number of local variables: 3
  8829                                  ;   # type sign width addr used name   list of local variables
  8830                                  ;  200 var sign word   831 NULL delim = bp+4
  8831                                  ;  201 var sign word   831 NULL c = bp-2
  8832                                  ;  202 ptr sign byte   831 NULL p = bp-4;
  8833 0000435B C8040000                 ENTER  4,0
  8834 0000435F B82B81                   mov ax, symbol
  8835 00004362 8946FC                   mov [bp-4], ax
  8836 00004365 E82A00                   call next
  8837 00004368 8946FE                   mov [bp-2], ax
  8838                                  
  8839                                  ;-832   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8840                                  
  8841                                  .getstring511:
  8842 0000436B 8B46FE                   mov ax, [bp-2]
  8843 0000436E 3B4604                   cmp ax, [bp+4]
  8844 00004371 0F841300                 je  .getstring512
  8845 00004375 8B46FE                   mov ax, [bp-2]
  8846 00004378 8B5EFC                   mov  bx, [bp-4]
  8847 0000437B 8807                     mov  [bx], al
  8848 0000437D FF46FC                   inc  word[bp-4]
  8849 00004380 E80F00                   call next
  8850 00004383 8946FE                   mov [bp-2], ax
  8851 00004386 EBE3                     jmp .getstring511
  8852                                  .getstring512:
  8853 00004388 B80000                   mov ax, 0
  8854 0000438B 8B5EFC                   mov  bx, [bp-4]
  8855 0000438E 8807                     mov  [bx], al
  8856                                  
  8857                                  ;-833 
  8858                                  
  8859                                  
  8860                                  ;-834 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8861 00004390 C9                       LEAVE
  8862 00004391 C3                       ret
  8863                                  ENDP
  8864                                  
  8865                                  next: PROC
  8866                                  ;Function : next, Number of local variables: 1
  8867                                  ;   # type sign width addr used name   list of local variables
  8868                                  ;  200 var sign byte   834 NULL r = bp-2;
  8869 00004392 C8020000                 ENTER  2,0
  8870 00004396 A0[2100]                 mov al, [thechar]
  8871 00004399 8846FE                   mov [bp-2], al
  8872 0000439C 8A46FE                   mov al, [bp-2]
  8873 0000439F A2[1E00]                 mov byte [globC], al
  8874 000043A2 E82E03                   call fgets1
  8875 000043A5 A2[2100]                 mov byte [thechar], al
  8876 000043A8 8A46FE                   mov al, [bp-2]
  8877 000043AB E90000                   jmp .retnnext
  8878                                  
  8879                                  ;-835 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8880                                  
  8881 000043AE C9                       .retnnext: LEAVE
  8882 000043AF C3                       ret
  8883                                  ENDP
  8884                                  
  8885                                  istoken: PROC
  8886                                  ;Function : istoken, Number of local variables: 1
  8887                                  ;   # type sign width addr used name   list of local variables
  8888                                  ;  200 var sign word   835 NULL t = bp+4;
  8889 000043B0 C8000000                 ENTER  0,0
  8890 000043B4 A1[1C00]                 mov ax, [token]
  8891 000043B7 3B4604                   cmp ax, [bp+4]
  8892 000043BA 0F850C00                 jne .istoken513
  8893 000043BE E8C2F8                   call getlex
  8894 000043C1 A3[1C00]                 mov word [token], ax
  8895 000043C4 B80100                   mov ax, 1
  8896 000043C7 E90600                   jmp .retnistoken
  8897                                  .istoken513:
  8898 000043CA B80000                   mov ax, 0
  8899 000043CD E90000                   jmp .retnistoken
  8900                                  
  8901                                  ;-836 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8902                                  
  8903 000043D0 C9                       .retnistoken: LEAVE
  8904 000043D1 C3                       ret
  8905                                  ENDP
  8906                                  
  8907                                  expect: PROC
  8908                                  ;Function : expect, Number of local variables: 1
  8909                                  ;   # type sign width addr used name   list of local variables
  8910                                  ;  200 var sign word   836 NULL t = bp+4;
  8911 000043D2 C8000000                 ENTER  0,0
  8912 000043D6 FF7604                   push word [bp+4]
  8913 000043D9 E8D4FF                   call istoken
  8914 000043DC 83C402                   add  sp, 2
  8915 000043DF 83F800                   cmp ax, 0
  8916 000043E2 0F853200                 jne .expect514
  8917 000043E6 B80000                   mov ax, 0
  8918 000043E9 8B1E[1600]               mov  bx, [cloc]
  8919 000043ED 8807                     mov  [bx], al
  8920 000043EF 8D063075                 lea  ax, [co]
  8921 000043F3 50                       push ax
  8922 000043F4 E8EE00                   call prs
  8923 000043F7 83C402                   add  sp, 2
  8924 000043FA E80905                   call listproc
  8925                                  
  8926                                  ;-837   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8927                                  
  8928 000043FD 68[1A44]                 push expect_0
  8929 00004400 E8E200                   call prs
  8930 00004403 83C402                   add  sp, 2
  8931 00004406 FF7604                   push word [bp+4]
  8932 00004409 E8D001                   call pint1
  8933 0000440C 83C402                   add  sp, 2
  8934 0000440F 68[3244]                 push expect_1
  8935 00004412 E8EF03                   call error1
  8936 00004415 83C402                   add  sp, 2
  8937                                  .expect514:
  8938                                  
  8939                                  ;-838 
  8940                                  
  8941                                  
  8942                                  ;-839 int eprc(char c)  {*cloc=c; cloc++; }
  8943 00004418 C9                       LEAVE
  8944 00004419 C3                       ret
  8945 0000441A 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8946 00004423 642041534349492864-
  8947 0000442C 657A293A2000       
  8948 00004432 206E6F7420666F756E-     expect_1 db " not found",0
  8949 0000443B 6400               
  8950                                  ENDP
  8951                                  
  8952                                  eprc: PROC
  8953                                  ;Function : eprc, Number of local variables: 1
  8954                                  ;   # type sign width addr used name   list of local variables
  8955                                  ;  200 var sign byte   839 NULL c = bp+4;
  8956 0000443D C8000000                 ENTER  0,0
  8957 00004441 8A4604                   mov al, [bp+4]
  8958 00004444 8B1E[1600]               mov  bx, [cloc]
  8959 00004448 8807                     mov  [bx], al
  8960 0000444A FF06[1600]               inc  word[cloc]
  8961                                  
  8962                                  ;-840 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8963 0000444E C9                       LEAVE
  8964 0000444F C3                       ret
  8965                                  ENDP
  8966                                  
  8967                                  eprs: PROC
  8968                                  ;Function : eprs, Number of local variables: 2
  8969                                  ;   # type sign width addr used name   list of local variables
  8970                                  ;  200 ptr sign byte   840 NULL s = bp+4
  8971                                  ;  201 var sign byte   840 NULL c = bp-2;
  8972 00004450 C8020000                 ENTER  2,0
  8973                                  .eprs515:
  8974 00004454 8B5E04                   mov bx, [bp+4]
  8975 00004457 8A07                     mov al, [bx]
  8976 00004459 B400                     mov ah, 0
  8977 0000445B 08C0                     or  al, al
  8978 0000445D 0F841B00                 je .eprs516
  8979 00004461 8B5E04                   mov bx, [bp+4]
  8980 00004464 8A07                     mov al, [bx]
  8981 00004466 B400                     mov ah, 0
  8982 00004468 8846FE                   mov [bp-2], al
  8983 0000446B 8A46FE                   mov al, byte [bp-2]
  8984 0000446E B400                     mov ah, 0
  8985 00004470 50                       push ax
  8986 00004471 E8C9FF                   call eprc
  8987 00004474 83C402                   add  sp, 2
  8988 00004477 FF4604                   inc  word[bp+4]
  8989 0000447A EBD8                     jmp .eprs515
  8990                                  .eprs516:
  8991                                  
  8992                                  ;-841 int prc(unsigned char c) { 
  8993 0000447C C9                       LEAVE
  8994 0000447D C3                       ret
  8995                                  ENDP
  8996                                  
  8997                                  prc: PROC
  8998                                  
  8999                                  ;-842   if (c==10) {_AX=13; writetty(); }
  9000                                  
  9001                                  ;Function : prc, Number of local variables: 1
  9002                                  ;   # type sign width addr used name   list of local variables
  9003                                  ;  200 var unsg byte   841 NULL c = bp+4;
  9004 0000447E C8000000                 ENTER  0,0
  9005 00004482 8A4604                   mov al, [bp+4]
  9006 00004485 3C0A                     cmp al, 10
  9007 00004487 0F850600                 jne .prc517
  9008 0000448B B80D00                   mov  ax, 13
  9009 0000448E E8E2BB                   call writetty
  9010                                  
  9011                                  ;-843   _AL=c; writetty(); 
  9012                                  
  9013                                  .prc517:
  9014 00004491 8A4604                   mov  al, [bp+4]
  9015 00004494 E8DCBB                   call writetty
  9016                                  
  9017                                  ;-844   fputcR(c, fdout); 
  9018                                  
  9019 00004497 FF36[1A00]               push word [fdout]
  9020 0000449B 8A4604                   mov al, byte [bp+4]
  9021 0000449E B400                     mov ah, 0
  9022 000044A0 50                       push ax
  9023 000044A1 E885BC                   call fputcR
  9024 000044A4 83C404                   add  sp, 4
  9025                                  
  9026                                  ;-845   }
  9027                                  
  9028                                  
  9029                                  ;-846 int prscomment(unsigned char *s) {unsigned char c;
  9030 000044A7 C9                       LEAVE
  9031 000044A8 C3                       ret
  9032                                  ENDP
  9033                                  
  9034                                  prscomment: PROC
  9035                                  
  9036                                  ;-847   while(*s){c=*s;prc(c);s++;} }
  9037                                  
  9038                                  ;Function : prscomment, Number of local variables: 2
  9039                                  ;   # type sign width addr used name   list of local variables
  9040                                  ;  200 ptr unsg byte   846 NULL s = bp+4
  9041                                  ;  201 var unsg byte   846 NULL c = bp-2;
  9042 000044A9 C8020000                 ENTER  2,0
  9043                                  .prscomment518:
  9044 000044AD 8B5E04                   mov bx, [bp+4]
  9045 000044B0 8A07                     mov al, [bx]
  9046 000044B2 B400                     mov ah, 0
  9047 000044B4 08C0                     or  al, al
  9048 000044B6 0F841B00                 je .prscomment519
  9049 000044BA 8B5E04                   mov bx, [bp+4]
  9050 000044BD 8A07                     mov al, [bx]
  9051 000044BF B400                     mov ah, 0
  9052 000044C1 8846FE                   mov [bp-2], al
  9053 000044C4 8A46FE                   mov al, byte [bp-2]
  9054 000044C7 B400                     mov ah, 0
  9055 000044C9 50                       push ax
  9056 000044CA E8B1FF                   call prc
  9057 000044CD 83C402                   add  sp, 2
  9058 000044D0 FF4604                   inc  word[bp+4]
  9059 000044D3 EBD8                     jmp .prscomment518
  9060                                  .prscomment519:
  9061                                  
  9062                                  ;-848 int prnl() { prs("\n ");}
  9063 000044D5 C9                       LEAVE
  9064 000044D6 C3                       ret
  9065                                  ENDP
  9066                                  
  9067                                  prnl: PROC
  9068 000044D7 68[E144]                 push prnl_0
  9069 000044DA E80800                   call prs
  9070 000044DD 83C402                   add  sp, 2
  9071                                  
  9072                                  ;-849 
  9073                                  
  9074                                  
  9075                                  ;-850 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9076                                  
  9077 000044E0 C3                       ret
  9078 000044E1 5C6E2000                prnl_0 db "\n ",0
  9079                                  ENDP
  9080                                  
  9081                                  prs: PROC
  9082                                  ;Function : prs, Number of local variables: 3
  9083                                  ;   # type sign width addr used name   list of local variables
  9084                                  ;  200 ptr unsg byte   850 NULL s = bp+4
  9085                                  ;  201 var unsg byte   850 NULL c = bp-2
  9086                                  ;  202 var sign word   850 NULL com = bp-4;
  9087 000044E5 C8040000                 ENTER  4,0
  9088 000044E9 B80000                   mov ax, 0
  9089 000044EC 8946FC                   mov [bp-4], ax
  9090                                  
  9091                                  ;-851   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9092                                  
  9093                                  .prs520:
  9094 000044EF 8B5E04                   mov bx, [bp+4]
  9095 000044F2 8A07                     mov al, [bx]
  9096 000044F4 B400                     mov ah, 0
  9097 000044F6 08C0                     or  al, al
  9098 000044F8 0F847B00                 je .prs521
  9099 000044FC 8B5E04                   mov bx, [bp+4]
  9100 000044FF 8A07                     mov al, [bx]
  9101 00004501 B400                     mov ah, 0
  9102 00004503 8846FE                   mov [bp-2], al
  9103 00004506 8A46FE                   mov al, [bp-2]
  9104 00004509 3C22                     cmp al, 34
  9105 0000450B 0F851800                 jne .prs522
  9106 0000450F 8B46FC                   mov ax, [bp-4]
  9107 00004512 08C0                     or  al, al
  9108 00004514 0F840900                 je .prs523
  9109 00004518 B80000                   mov ax, 0
  9110 0000451B 8946FC                   mov [bp-4], ax
  9111 0000451E E90600                   jmp .prs524
  9112                                  .prs523:
  9113 00004521 B80100                   mov ax, 1
  9114 00004524 8946FC                   mov [bp-4], ax
  9115                                  
  9116                                  ;-852     if (c==92) { if (com==0) { s++; c=*s;
  9117                                  
  9118                                  .prs524:
  9119                                  .prs522:
  9120 00004527 8A46FE                   mov al, [bp-2]
  9121 0000452A 3C5C                     cmp al, 92
  9122 0000452C 0F853500                 jne .prs525
  9123 00004530 8B46FC                   mov ax, [bp-4]
  9124 00004533 83F800                   cmp ax, 0
  9125 00004536 0F852B00                 jne .prs526
  9126 0000453A FF4604                   inc  word[bp+4]
  9127 0000453D 8B5E04                   mov bx, [bp+4]
  9128 00004540 8A07                     mov al, [bx]
  9129 00004542 B400                     mov ah, 0
  9130 00004544 8846FE                   mov [bp-2], al
  9131                                  
  9132                                  ;-853           if (c=='n') c=10; if (c=='t') c= 9;
  9133                                  
  9134 00004547 8A46FE                   mov al, [bp-2]
  9135 0000454A 3C6E                     cmp al, 110
  9136 0000454C 0F850600                 jne .prs527
  9137 00004550 B80A00                   mov ax, 10
  9138 00004553 8846FE                   mov [bp-2], al
  9139                                  .prs527:
  9140 00004556 8A46FE                   mov al, [bp-2]
  9141 00004559 3C74                     cmp al, 116
  9142 0000455B 0F850600                 jne .prs528
  9143 0000455F B80900                   mov ax, 9
  9144 00004562 8846FE                   mov [bp-2], al
  9145                                  
  9146                                  ;-854     } } prc(c); s++;  } }
  9147                                  
  9148                                  .prs528:
  9149                                  .prs526:
  9150                                  .prs525:
  9151 00004565 8A46FE                   mov al, byte [bp-2]
  9152 00004568 B400                     mov ah, 0
  9153 0000456A 50                       push ax
  9154 0000456B E810FF                   call prc
  9155 0000456E 83C402                   add  sp, 2
  9156 00004571 FF4604                   inc  word[bp+4]
  9157 00004574 E978FF                   jmp .prs520
  9158                                  .prs521:
  9159                                  
  9160                                  ;-855 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9161 00004577 C9                       LEAVE
  9162 00004578 C3                       ret
  9163                                  ENDP
  9164                                  
  9165                                  eprnum: PROC
  9166                                  ;Function : eprnum, Number of local variables: 2
  9167                                  ;   # type sign width addr used name   list of local variables
  9168                                  ;  200 var sign word   855 NULL n = bp+4
  9169                                  ;  201 var sign word   855 NULL e = bp-2;
  9170 00004579 C8020000                 ENTER  2,0
  9171 0000457D 8B4604                   mov ax, [bp+4]
  9172 00004580 83F800                   cmp ax, 0
  9173 00004583 0F8D1400                 jge .eprnum529
  9174 00004587 6A2D                     push 45
  9175 00004589 E8B1FE                   call eprc
  9176 0000458C 83C402                   add  sp, 2
  9177 0000458F FF7604                   push word [bp+4]
  9178 00004592 E82DBB                   call mkneg
  9179 00004595 83C402                   add  sp, 2
  9180 00004598 894604                   mov [bp+4], ax
  9181                                  
  9182                                  ;-856   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9183                                  
  9184                                  .eprnum529:
  9185 0000459B 8B4604                   mov ax, [bp+4]
  9186 0000459E 83F80A                   cmp ax, 10 ;unsigned : 1
  9187 000045A1 0F8C1500                 jl  .eprnum530
  9188 000045A5 8B4604                   mov ax, [bp+4]
  9189 000045A8 BB0A00                   mov bx, 10
  9190 000045AB 99                       cwd
  9191 000045AC F7FB                     idiv bx
  9192 000045AE 8946FE                   mov [bp-2], ax
  9193 000045B1 FF76FE                   push word [bp-2]
  9194 000045B4 E8C2FF                   call eprnum
  9195 000045B7 83C402                   add  sp, 2
  9196                                  .eprnum530:
  9197 000045BA 8B4604                   mov ax, [bp+4]
  9198 000045BD BB0A00                   mov bx, 10
  9199 000045C0 99                       cwd
  9200 000045C1 F7FB                     idiv bx
  9201 000045C3 89D0                     mov ax, dx
  9202 000045C5 894604                   mov [bp+4], ax
  9203 000045C8 8B4604                   mov ax, [bp+4]
  9204 000045CB 83C030                   add ax, 48
  9205 000045CE 894604                   mov [bp+4], ax
  9206 000045D1 FF7604                   push word [bp+4]
  9207 000045D4 E866FE                   call eprc
  9208 000045D7 83C402                   add  sp, 2
  9209                                  
  9210                                  ;-857 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9211 000045DA C9                       LEAVE
  9212 000045DB C3                       ret
  9213                                  ENDP
  9214                                  
  9215                                  pint1: PROC
  9216                                  ;Function : pint1, Number of local variables: 2
  9217                                  ;   # type sign width addr used name   list of local variables
  9218                                  ;  200 var sign word   857 NULL n = bp+4
  9219                                  ;  201 var sign word   857 NULL e = bp-2;
  9220 000045DC C8020000                 ENTER  2,0
  9221 000045E0 8B4604                   mov ax, [bp+4]
  9222 000045E3 83F800                   cmp ax, 0
  9223 000045E6 0F8D1400                 jge .pint1531
  9224 000045EA 6A2D                     push 45
  9225 000045EC E88FFE                   call prc
  9226 000045EF 83C402                   add  sp, 2
  9227 000045F2 FF7604                   push word [bp+4]
  9228 000045F5 E8CABA                   call mkneg
  9229 000045F8 83C402                   add  sp, 2
  9230 000045FB 894604                   mov [bp+4], ax
  9231                                  
  9232                                  ;-858   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }  
  9233                                  
  9234                                  .pint1531:
  9235 000045FE 8B4604                   mov ax, [bp+4]
  9236 00004601 83F80A                   cmp ax, 10 ;unsigned : 1
  9237 00004604 0F8C1500                 jl  .pint1532
  9238 00004608 8B4604                   mov ax, [bp+4]
  9239 0000460B BB0A00                   mov bx, 10
  9240 0000460E 99                       cwd
  9241 0000460F F7FB                     idiv bx
  9242 00004611 8946FE                   mov [bp-2], ax
  9243 00004614 FF76FE                   push word [bp-2]
  9244 00004617 E8C2FF                   call pint1
  9245 0000461A 83C402                   add  sp, 2
  9246                                  .pint1532:
  9247 0000461D 8B4604                   mov ax, [bp+4]
  9248 00004620 BB0A00                   mov bx, 10
  9249 00004623 99                       cwd
  9250 00004624 F7FB                     idiv bx
  9251 00004626 89D0                     mov ax, dx
  9252 00004628 894604                   mov [bp+4], ax
  9253 0000462B 83460430                 add  word[bp+4], 48
  9254 0000462F FF7604                   push word [bp+4]
  9255 00004632 E849FE                   call prc
  9256 00004635 83C402                   add  sp, 2
  9257                                  
  9258                                  ;-859 int prunsign1(unsigned int n) { unsigned int e;
  9259 00004638 C9                       LEAVE
  9260 00004639 C3                       ret
  9261                                  ENDP
  9262                                  
  9263                                  prunsign1: PROC
  9264                                  
  9265                                  ;-860   if ( _ n >= 10) {  e=n/10; prunsign1(e); }
  9266                                  
  9267                                  ;Function : prunsign1, Number of local variables: 2
  9268                                  ;   # type sign width addr used name   list of local variables
  9269                                  ;  200 var unsg word   859 NULL n = bp+4
  9270                                  ;  201 var unsg word   859 NULL e = bp-2;
  9271 0000463A C8020000                 ENTER  2,0 ; constant expression
  9272 0000463E 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9273 00004642 0F821700                 jb  .prunsign1533
  9274 00004646 8B4604                   mov ax, [bp+4]
  9275 00004649 BB0A00                   mov bx, 10
  9276 0000464C BA0000                   mov dx, 0
  9277 0000464F F7F3                     div bx
  9278 00004651 8946FE                   mov [bp-2], ax
  9279 00004654 FF76FE                   push word [bp-2]
  9280 00004657 E8E0FF                   call prunsign1
  9281 0000465A 83C402                   add  sp, 2
  9282                                  
  9283                                  ;-861     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }  
  9284                                  
  9285                                  .prunsign1533:
  9286 0000465D 8B4604                   mov ax, [bp+4]
  9287 00004660 BB0A00                   mov bx, 10
  9288 00004663 BA0000                   mov dx, 0
  9289 00004666 F7F3                     div bx
  9290 00004668 89D0                     mov ax, dx
  9291 0000466A 894604                   mov [bp+4], ax
  9292 0000466D 83460430                 add  word[bp+4], 48
  9293 00004671 FF7604                   push word [bp+4]
  9294 00004674 E807FE                   call prc
  9295 00004677 83C402                   add  sp, 2
  9296                                  
  9297                                  ;-862 int printint51(unsigned int j)  {
  9298 0000467A C9                       LEAVE
  9299 0000467B C3                       ret
  9300                                  ENDP
  9301                                  
  9302                                  printint51: PROC
  9303                                  
  9304                                  ;-863   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9305                                  
  9306                                  ;Function : printint51, Number of local variables: 1
  9307                                  ;   # type sign width addr used name   list of local variables
  9308                                  ;  200 var unsg word   862 NULL j = bp+4;
  9309 0000467C C8000000                 ENTER  0,0
  9310 00004680 8B4604                   mov ax, [bp+4]
  9311 00004683 3D1027                   cmp ax, 10000
  9312 00004686 0F8D0800                 jge .printint51534
  9313 0000468A 6A20                     push 32
  9314 0000468C E8EFFD                   call prc
  9315 0000468F 83C402                   add  sp, 2
  9316                                  .printint51534:
  9317 00004692 8B4604                   mov ax, [bp+4]
  9318 00004695 3DE803                   cmp ax, 1000
  9319 00004698 0F8D0800                 jge .printint51535
  9320 0000469C 6A20                     push 32
  9321 0000469E E8DDFD                   call prc
  9322 000046A1 83C402                   add  sp, 2
  9323                                  .printint51535:
  9324 000046A4 8B4604                   mov ax, [bp+4]
  9325 000046A7 83F864                   cmp ax, 100
  9326 000046AA 0F8D0800                 jge .printint51536
  9327 000046AE 6A20                     push 32
  9328 000046B0 E8CBFD                   call prc
  9329 000046B3 83C402                   add  sp, 2
  9330                                  
  9331                                  ;-864    if (j<10) prc(32);  prunsign1(j); }
  9332                                  
  9333                                  .printint51536:
  9334 000046B6 8B4604                   mov ax, [bp+4]
  9335 000046B9 83F80A                   cmp ax, 10
  9336 000046BC 0F8D0800                 jge .printint51537
  9337 000046C0 6A20                     push 32
  9338 000046C2 E8B9FD                   call prc
  9339 000046C5 83C402                   add  sp, 2
  9340                                  .printint51537:
  9341 000046C8 FF7604                   push word [bp+4]
  9342 000046CB E86CFF                   call prunsign1
  9343 000046CE 83C402                   add  sp, 2
  9344                                  
  9345                                  ;-865 
  9346                                  
  9347                                  
  9348                                  ;-866 int fgets1() { char c; c=*fgetsp;
  9349 000046D1 C9                       LEAVE
  9350 000046D2 C3                       ret
  9351                                  ENDP
  9352                                  
  9353                                  fgets1: PROC
  9354                                  ;Function : fgets1, Number of local variables: 1
  9355                                  ;   # type sign width addr used name   list of local variables
  9356                                  ;  200 var sign byte   866 NULL c = bp-2;
  9357 000046D3 C8020000                 ENTER  2,0
  9358 000046D7 8B1E[6200]               mov bx, [fgetsp]
  9359 000046DB 8A07                     mov al, [bx]
  9360 000046DD B400                     mov ah, 0
  9361 000046DF 8846FE                   mov [bp-2], al
  9362                                  
  9363                                  ;-867   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9364                                  
  9365 000046E2 8A46FE                   mov al, [bp-2]
  9366 000046E5 3C00                     cmp al, 0
  9367 000046E7 0F852A00                 jne .fgets1538
  9368 000046EB E83700                   call printinputline
  9369 000046EE A1[7000]                 mov ax, [DOS_NoBytes]
  9370 000046F1 83F800                   cmp ax, 0
  9371 000046F4 0F850600                 jne .fgets1539
  9372 000046F8 B80000                   mov ax, 0
  9373 000046FB E92500                   jmp .retnfgets1
  9374                                  
  9375                                  ;-868     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9376                                  
  9377                                  .fgets1539:
  9378 000046FE B80FD0                   mov ax, fgetsdest
  9379 00004701 A3[6200]                 mov word [fgetsp], ax
  9380 00004704 8B1E[6200]               mov bx, [fgetsp]
  9381 00004708 8A07                     mov al, [bx]
  9382 0000470A B400                     mov ah, 0
  9383 0000470C 8846FE                   mov [bp-2], al
  9384 0000470F B80000                   mov ax, 0
  9385 00004712 A3[1F00]                 mov word [spalte], ax
  9386                                  
  9387                                  ;-869   fgetsp++; spalte++;  return c; }
  9388                                  
  9389                                  .fgets1538:
  9390 00004715 FF06[6200]               inc  word[fgetsp]
  9391 00004719 FF06[1F00]               inc  word[spalte]
  9392 0000471D 8A46FE                   mov al, [bp-2]
  9393 00004720 E90000                   jmp .retnfgets1
  9394                                  
  9395                                  ;-870 int printinputline() { fgetsp=&fgetsdest;
  9396                                  
  9397 00004723 C9                       .retnfgets1: LEAVE
  9398 00004724 C3                       ret
  9399                                  ENDP
  9400                                  
  9401                                  printinputline: PROC
  9402 00004725 B80FD0                   mov ax, fgetsdest
  9403 00004728 A3[6200]                 mov word [fgetsp], ax
  9404                                  
  9405                                  ;-871   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9406                                  
  9407                                  .printinputline540:
  9408 0000472B 6A01                     push 1
  9409 0000472D FF36[1800]               push word [fdin]
  9410 00004731 8D06[7200]               lea  ax, [DOS_ByteRead]
  9411 00004735 50                       push ax
  9412 00004736 E8DBB9                   call readRL
  9413 00004739 83C406                   add  sp, 6
  9414 0000473C A3[7000]                 mov word [DOS_NoBytes], ax
  9415                                  
  9416                                  ;-872   if (DOS_NoBytes == 0) return; 
  9417                                  
  9418 0000473F A1[7000]                 mov ax, [DOS_NoBytes]
  9419 00004742 83F800                   cmp ax, 0
  9420 00004745 0F850300                 jne .printinputline541
  9421 00004749 E95400                   jmp .retnprintinputline
  9422                                  
  9423                                  ;-873     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9424                                  
  9425                                  .printinputline541:
  9426 0000474C A0[7200]                 mov al, [DOS_ByteRead]
  9427 0000474F 8B1E[6200]               mov  bx, [fgetsp]
  9428 00004753 8807                     mov  [bx], al
  9429 00004755 FF06[6200]               inc  word[fgetsp]
  9430                                  
  9431                                  ;-874   while (DOS_ByteRead != 10); *fgetsp=0;
  9432                                  
  9433 00004759 A0[7200]                 mov al, [DOS_ByteRead]
  9434 0000475C 3C0A                     cmp al, 10
  9435 0000475E 0F840200                 je  .printinputline542
  9436 00004762 EBC7                     jmp .printinputline540
  9437                                  .printinputline542:
  9438 00004764 B80000                   mov ax, 0
  9439 00004767 8B1E[6200]               mov  bx, [fgetsp]
  9440 0000476B 8807                     mov  [bx], al
  9441                                  
  9442                                  ;-875     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9443                                  
  9444 0000476D A1[1A00]                 mov ax, [fdout]
  9445 00004770 08C0                     or  al, al
  9446 00004772 0F842A00                 je .printinputline543
  9447 00004776 68[A147]                 push printinputline_0
  9448 00004779 E869FD                   call prs
  9449 0000477C 83C402                   add  sp, 2
  9450 0000477F FF36[6600]               push word [lineno]
  9451 00004783 E8B4FE                   call prunsign1
  9452 00004786 83C402                   add  sp, 2
  9453 00004789 6A20                     push 32
  9454 0000478B E8F0FC                   call prc
  9455 0000478E 83C402                   add  sp, 2
  9456 00004791 FF06[6600]               inc  word[lineno]
  9457                                  
  9458                                  ;-876       prscomment(&fgetsdest);}
  9459                                  
  9460 00004795 8D060FD0                 lea  ax, [fgetsdest]
  9461 00004799 50                       push ax
  9462 0000479A E80CFD                   call prscomment
  9463 0000479D 83C402                   add  sp, 2
  9464                                  
  9465                                  ;-877 }
  9466                                  
  9467                                  .printinputline543:
  9468                                  
  9469                                  ;-878 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  9470                                  
  9471                                   .retnprintinputline:
  9472 000047A0 C3                       ret
  9473 000047A1 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9474                                  ENDP
  9475                                  
  9476                                  ifEOL: PROC
  9477                                  
  9478                                  ;-879   if (c == 10) return 1;//LF
  9479                                  
  9480                                  ;Function : ifEOL, Number of local variables: 1
  9481                                  ;   # type sign width addr used name   list of local variables
  9482                                  ;  200 var sign byte   878 NULL c = bp+4;
  9483 000047A8 C8000000                 ENTER  0,0
  9484 000047AC 8A4604                   mov al, [bp+4]
  9485 000047AF 3C0A                     cmp al, 10
  9486 000047B1 0F850600                 jne .ifEOL544
  9487 000047B5 B80100                   mov ax, 1
  9488 000047B8 E92400                   jmp .retnifEOL
  9489                                  
  9490                                  ;-880   if (c == 13) {//CR
  9491                                  
  9492                                  .ifEOL544:
  9493 000047BB 8A4604                   mov al, [bp+4]
  9494 000047BE 3C0D                     cmp al, 13
  9495 000047C0 0F851500                 jne .ifEOL545
  9496                                  
  9497                                  ;-881     if (thechar == 10) c=next();
  9498                                  
  9499 000047C4 A0[2100]                 mov al, [thechar]
  9500 000047C7 3C0A                     cmp al, 10
  9501 000047C9 0F850600                 jne .ifEOL546
  9502 000047CD E8C2FB                   call next
  9503 000047D0 884604                   mov [bp+4], al
  9504                                  
  9505                                  ;-882     return 1;
  9506                                  
  9507                                  .ifEOL546:
  9508 000047D3 B80100                   mov ax, 1
  9509 000047D6 E90600                   jmp .retnifEOL
  9510                                  
  9511                                  ;-883   }
  9512                                  
  9513                                  
  9514                                  ;-884   return 0;
  9515                                  
  9516                                  .ifEOL545:
  9517 000047D9 B80000                   mov ax, 0
  9518 000047DC E90000                   jmp .retnifEOL
  9519                                  
  9520                                  ;-885 }
  9521                                  
  9522                                  
  9523                                  ;-886 
  9524                                  
  9525                                  
  9526                                  ;-887 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9527                                  
  9528 000047DF C9                       .retnifEOL: LEAVE
  9529 000047E0 C3                       ret
  9530                                  ENDP
  9531                                  
  9532                                  end1: PROC
  9533                                  ;Function : end1, Number of local variables: 1
  9534                                  ;   # type sign width addr used name   list of local variables
  9535                                  ;  200 var sign word   887 NULL n = bp+4;
  9536 000047E1 C8000000                 ENTER  0,0
  9537 000047E5 FF36[1800]               push word [fdin]
  9538 000047E9 E80BB9                   call fcloseR
  9539 000047EC 83C402                   add  sp, 2
  9540 000047EF FF36[1A00]               push word [fdout]
  9541 000047F3 E801B9                   call fcloseR
  9542 000047F6 83C402                   add  sp, 2
  9543 000047F9 FF7604                   push word [bp+4]
  9544 000047FC E807B9                   call exitR
  9545 000047FF 83C402                   add  sp, 2
  9546                                  
  9547                                  ;-888 int error1(char *s) { 
  9548 00004802 C9                       LEAVE
  9549 00004803 C3                       ret
  9550                                  ENDP
  9551                                  
  9552                                  error1: PROC
  9553                                  
  9554                                  ;-889   lineno--;
  9555                                  
  9556                                  ;Function : error1, Number of local variables: 1
  9557                                  ;   # type sign width addr used name   list of local variables
  9558                                  ;  200 ptr sign byte   888 NULL s = bp+4;
  9559 00004804 C8000000                 ENTER  0,0
  9560 00004808 FF0E[6600]               dec  word[lineno]
  9561                                  
  9562                                  ;-890   prnl(); prscomment(&fgetsdest);
  9563                                  
  9564 0000480C E8C8FC                   call prnl
  9565 0000480F 8D060FD0                 lea  ax, [fgetsdest]
  9566 00004813 50                       push ax
  9567 00004814 E892FC                   call prscomment
  9568 00004817 83C402                   add  sp, 2
  9569                                  
  9570                                  ;-891   prs(";Line: "); prunsign1(lineno);
  9571                                  
  9572 0000481A 68[AD48]                 push error1_0
  9573 0000481D E8C5FC                   call prs
  9574 00004820 83C402                   add  sp, 2
  9575 00004823 FF36[6600]               push word [lineno]
  9576 00004827 E810FE                   call prunsign1
  9577 0000482A 83C402                   add  sp, 2
  9578                                  
  9579                                  ;-892   prs(" ************** ERROR: "); prs(s);
  9580                                  
  9581 0000482D 68[B548]                 push error1_1
  9582 00004830 E8B2FC                   call prs
  9583 00004833 83C402                   add  sp, 2
  9584 00004836 FF7604                   push word [bp+4]
  9585 00004839 E8A9FC                   call prs
  9586 0000483C 83C402                   add  sp, 2
  9587                                  
  9588                                  ;-893   prs("  in column: "); prunsign1(spalte);
  9589                                  
  9590 0000483F 68[CD48]                 push error1_2
  9591 00004842 E8A0FC                   call prs
  9592 00004845 83C402                   add  sp, 2
  9593 00004848 FF36[1F00]               push word [spalte]
  9594 0000484C E8EBFD                   call prunsign1
  9595 0000484F 83C402                   add  sp, 2
  9596                                  
  9597                                  ;-894   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9598                                  
  9599 00004852 68[DB48]                 push error1_3
  9600 00004855 E88DFC                   call prs
  9601 00004858 83C402                   add  sp, 2
  9602 0000485B FF36[1C00]               push word [token]
  9603 0000485F E8D8FD                   call prunsign1
  9604 00004862 83C402                   add  sp, 2
  9605 00004865 68[E548]                 push error1_4
  9606 00004868 E87AFC                   call prs
  9607 0000486B 83C402                   add  sp, 2
  9608 0000486E A0[1E00]                 mov al, byte [globC]
  9609 00004871 B400                     mov ah, 0
  9610 00004873 50                       push ax
  9611 00004874 E807FC                   call prc
  9612 00004877 83C402                   add  sp, 2
  9613                                  
  9614                                  ;-895   prs(", thechar: "); prunsign1(thechar); prs(", symbol: "); prs(symbol);
  9615                                  
  9616 0000487A 68[EF48]                 push error1_5
  9617 0000487D E865FC                   call prs
  9618 00004880 83C402                   add  sp, 2
  9619 00004883 A0[2100]                 mov al, byte [thechar]
  9620 00004886 B400                     mov ah, 0
  9621 00004888 50                       push ax
  9622 00004889 E8AEFD                   call prunsign1
  9623 0000488C 83C402                   add  sp, 2
  9624 0000488F 68[FB48]                 push error1_6
  9625 00004892 E850FC                   call prs
  9626 00004895 83C402                   add  sp, 2
  9627 00004898 8D062B81                 lea  ax, [symbol]
  9628 0000489C 50                       push ax
  9629 0000489D E845FC                   call prs
  9630 000048A0 83C402                   add  sp, 2
  9631                                  
  9632                                  ;-896   end1(1); }
  9633                                  
  9634 000048A3 6A01                     push 1
  9635 000048A5 E839FF                   call end1
  9636 000048A8 83C402                   add  sp, 2
  9637                                  
  9638                                  ;-897 int listproc() {int i; 
  9639 000048AB C9                       LEAVE
  9640 000048AC C3                       ret
  9641 000048AD 3B4C696E653A2000        error1_0 db ";Line: ",0
  9642 000048B5 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9643 000048BE 2A2A2A2A2A2A204552-
  9644 000048C7 524F523A2000       
  9645 000048CD 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9646 000048D6 6D6E3A2000         
  9647 000048DB 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9648 000048E4 00                 
  9649 000048E5 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9650 000048EE 00                 
  9651 000048EF 2C2074686563686172-     error1_5 db ", thechar: ",0
  9652 000048F8 3A2000             
  9653 000048FB 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9654 00004904 2000               
  9655                                  ENDP
  9656                                  
  9657                                  listproc: PROC
  9658                                  
  9659                                  ;-898   if (LTop > LSTART) {
  9660                                  
  9661                                  ;Function : listproc, Number of local variables: 1
  9662                                  ;   # type sign width addr used name   list of local variables
  9663                                  ;  200 var sign word   897 NULL i = bp-2;
  9664 00004906 C8020000                 ENTER  2,0
  9665 0000490A A1[2C00]                 mov ax, [LTop]
  9666 0000490D 3DC800                   cmp ax, 200
  9667 00004910 0F8E5700                 jle .listproc547
  9668                                  
  9669                                  ;-899   prs("\n;Function : "); prs(fname);
  9670                                  
  9671 00004914 68[6D49]                 push listproc_0
  9672 00004917 E8CBFB                   call prs
  9673 0000491A 83C402                   add  sp, 2
  9674 0000491D 8D06AB81                 lea  ax, [fname]
  9675 00004921 50                       push ax
  9676 00004922 E8C0FB                   call prs
  9677 00004925 83C402                   add  sp, 2
  9678                                  
  9679                                  ;-900   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9680                                  
  9681 00004928 68[7C49]                 push listproc_1
  9682 0000492B E8B7FB                   call prs
  9683 0000492E 83C402                   add  sp, 2
  9684 00004931 A1[2C00]                 mov ax, [LTop]
  9685 00004934 2DC800                   sub ax, 200
  9686 00004937 8946FE                   mov [bp-2], ax
  9687 0000493A FF76FE                   push word [bp-2]
  9688 0000493D E8FAFC                   call prunsign1
  9689 00004940 83C402                   add  sp, 2
  9690                                  
  9691                                  ;-901   prs("\n;   # type sign width addr used name   list of local variables");
  9692                                  
  9693 00004943 68[9A49]                 push listproc_2
  9694 00004946 E89CFB                   call prs
  9695 00004949 83C402                   add  sp, 2
  9696                                  
  9697                                  ;-902     i=LSTART; 
  9698                                  
  9699 0000494C B8C800                   mov ax, 200
  9700 0000494F 8946FE                   mov [bp-2], ax
  9701                                  
  9702                                  ;-903     while (i < LTop) { listvar(i); i++; } } 
  9703                                  
  9704                                  .listproc548:
  9705 00004952 8B46FE                   mov ax, [bp-2]
  9706 00004955 3B06[2C00]               cmp ax, [LTop]
  9707 00004959 0F8D0E00                 jge .listproc549
  9708 0000495D FF76FE                   push word [bp-2]
  9709 00004960 E87800                   call listvar
  9710 00004963 83C402                   add  sp, 2
  9711 00004966 FF46FE                   inc  word[bp-2]
  9712 00004969 EBE7                     jmp .listproc548
  9713                                  .listproc549:
  9714                                  
  9715                                  ;-904 }
  9716                                  
  9717                                  .listproc547:
  9718                                  
  9719                                  ;-905 int listvar(unsigned int i) {unsigned int j; char c;
  9720 0000496B C9                       LEAVE
  9721 0000496C C3                       ret
  9722 0000496D 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9723 00004976 6F6E203A2000       
  9724 0000497C 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9725 00004985 6F66206C6F63616C20-
  9726 0000498E 7661726961626C6573-
  9727 00004997 3A2000             
  9728 0000499A 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9729 000049A3 797065207369676E20-
  9730 000049AC 776964746820616464-
  9731 000049B5 722075736564206E61-
  9732 000049BE 6D652020206C697374-
  9733 000049C7 206F66206C6F63616C-
  9734 000049D0 207661726961626C65-
  9735 000049D9 7300               
  9736                                  ENDP
  9737                                  
  9738                                  listvar: PROC
  9739                                  
  9740                                  ;-906   prs("\n;"); printint51(i); prc(32);
  9741                                  
  9742                                  ;Function : listvar, Number of local variables: 3
  9743                                  ;   # type sign width addr used name   list of local variables
  9744                                  ;  200 var unsg word   905 NULL i = bp+4
  9745                                  ;  201 var unsg word   905 NULL j = bp-2
  9746                                  ;  202 var sign byte   905 NULL c = bp-4;
  9747 000049DB C8040000                 ENTER  4,0
  9748 000049DF 68[C74B]                 push listvar_0
  9749 000049E2 E800FB                   call prs
  9750 000049E5 83C402                   add  sp, 2
  9751 000049E8 FF7604                   push word [bp+4]
  9752 000049EB E88EFC                   call printint51
  9753 000049EE 83C402                   add  sp, 2
  9754 000049F1 6A20                     push 32
  9755 000049F3 E888FA                   call prc
  9756 000049F6 83C402                   add  sp, 2
  9757                                  
  9758                                  ;-907   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9759                                  
  9760 000049F9 8B5E04                   mov bx, [bp+4]
  9761 000049FC 8A87B782                 mov al, [GType + bx]
  9762 00004A00 8846FC                   mov [bp-4], al
  9763 00004A03 8A46FC                   mov al, [bp-4]
  9764 00004A06 3C56                     cmp al, 86
  9765 00004A08 0F850900                 jne .listvar550
  9766 00004A0C 68[CB4B]                 push listvar_1
  9767 00004A0F E8D3FA                   call prs
  9768 00004A12 83C402                   add  sp, 2
  9769                                  .listvar550:
  9770 00004A15 8A46FC                   mov al, [bp-4]
  9771 00004A18 3C2A                     cmp al, 42
  9772 00004A1A 0F850900                 jne .listvar551
  9773 00004A1E 68[D04B]                 push listvar_2
  9774 00004A21 E8C1FA                   call prs
  9775 00004A24 83C402                   add  sp, 2
  9776                                  
  9777                                  ;-908                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9778                                  
  9779                                  .listvar551:
  9780 00004A27 8A46FC                   mov al, [bp-4]
  9781 00004A2A 3C26                     cmp al, 38
  9782 00004A2C 0F850900                 jne .listvar552
  9783 00004A30 68[D54B]                 push listvar_3
  9784 00004A33 E8AFFA                   call prs
  9785 00004A36 83C402                   add  sp, 2
  9786                                  .listvar552:
  9787 00004A39 8A46FC                   mov al, [bp-4]
  9788 00004A3C 3C23                     cmp al, 35
  9789 00004A3E 0F850900                 jne .listvar553
  9790 00004A42 68[DA4B]                 push listvar_4
  9791 00004A45 E89DFA                   call prs
  9792 00004A48 83C402                   add  sp, 2
  9793                                  
  9794                                  ;-909   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9795                                  
  9796                                  .listvar553:
  9797 00004A4B 8B5E04                   mov bx, [bp+4]
  9798 00004A4E 8A87E383                 mov al, [GSign + bx]
  9799 00004A52 8846FC                   mov [bp-4], al
  9800 00004A55 8A46FC                   mov al, [bp-4]
  9801 00004A58 3C53                     cmp al, 83
  9802 00004A5A 0F850900                 jne .listvar554
  9803 00004A5E 68[DF4B]                 push listvar_5
  9804 00004A61 E881FA                   call prs
  9805 00004A64 83C402                   add  sp, 2
  9806                                  .listvar554:
  9807 00004A67 8A46FC                   mov al, [bp-4]
  9808 00004A6A 3C55                     cmp al, 85
  9809 00004A6C 0F850900                 jne .listvar555
  9810 00004A70 68[E54B]                 push listvar_6
  9811 00004A73 E86FFA                   call prs
  9812 00004A76 83C402                   add  sp, 2
  9813                                  
  9814                                  ;-910   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9815                                  
  9816                                  .listvar555:
  9817 00004A79 8B5E04                   mov bx, [bp+4]
  9818 00004A7C 8A870F85                 mov al, [GWidth + bx]
  9819 00004A80 8846FC                   mov [bp-4], al
  9820 00004A83 8A46FC                   mov al, [bp-4]
  9821 00004A86 3C01                     cmp al, 1
  9822 00004A88 0F850900                 jne .listvar556
  9823 00004A8C 68[EB4B]                 push listvar_7
  9824 00004A8F E853FA                   call prs
  9825 00004A92 83C402                   add  sp, 2
  9826                                  .listvar556:
  9827 00004A95 8A46FC                   mov al, [bp-4]
  9828 00004A98 3C02                     cmp al, 2
  9829 00004A9A 0F850900                 jne .listvar557
  9830 00004A9E 68[F14B]                 push listvar_8
  9831 00004AA1 E841FA                   call prs
  9832 00004AA4 83C402                   add  sp, 2
  9833                                  
  9834                                  ;-911                if(c==  4)prs("dwrd " );
  9835                                  
  9836                                  .listvar557:
  9837 00004AA7 8A46FC                   mov al, [bp-4]
  9838 00004AAA 3C04                     cmp al, 4
  9839 00004AAC 0F850900                 jne .listvar558
  9840 00004AB0 68[F74B]                 push listvar_9
  9841 00004AB3 E82FFA                   call prs
  9842 00004AB6 83C402                   add  sp, 2
  9843                                  
  9844                                  ;-912   j=GAdr[i]; printint51(j);
  9845                                  
  9846                                  .listvar558:
  9847 00004AB9 8B5E04                   mov bx, [bp+4]
  9848 00004ABC D1E3                     shl bx, 1
  9849 00004ABE 8B873B86                 mov ax, [GAdr + bx]
  9850 00004AC2 8946FE                   mov [bp-2], ax
  9851 00004AC5 FF76FE                   push word [bp-2]
  9852 00004AC8 E8B1FB                   call printint51
  9853 00004ACB 83C402                   add  sp, 2
  9854                                  
  9855                                  ;-913   j=GUsed[i]; if (j) printint51(j);
  9856                                  
  9857 00004ACE 8B5E04                   mov bx, [bp+4]
  9858 00004AD1 D1E3                     shl bx, 1
  9859 00004AD3 8B879388                 mov ax, [GUsed + bx]
  9860 00004AD7 8946FE                   mov [bp-2], ax
  9861 00004ADA 8B46FE                   mov ax, [bp-2]
  9862 00004ADD 08C0                     or  al, al
  9863 00004ADF 0F840C00                 je .listvar559
  9864 00004AE3 FF76FE                   push word [bp-2]
  9865 00004AE6 E893FB                   call printint51
  9866 00004AE9 83C402                   add  sp, 2
  9867                                  
  9868                                  ;-914   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9869                                  
  9870 00004AEC E92200                   jmp .listvar560
  9871                                  .listvar559:
  9872 00004AEF 8B5E04                   mov bx, [bp+4]
  9873 00004AF2 8A87B782                 mov al, [GType + bx]
  9874 00004AF6 3C23                     cmp al, 35
  9875 00004AF8 0F850C00                 jne .listvar561
  9876 00004AFC 68[FD4B]                 push listvar_10
  9877 00004AFF E8E3F9                   call prs
  9878 00004B02 83C402                   add  sp, 2
  9879 00004B05 E90900                   jmp .listvar562
  9880                                  .listvar561:
  9881 00004B08 68[034C]                 push listvar_11
  9882 00004B0B E8D7F9                   call prs
  9883 00004B0E 83C402                   add  sp, 2
  9884                                  .listvar562:
  9885                                  
  9886                                  ;-915   prc(32);  pt=adrofname(i); prs(pt);
  9887                                  
  9888                                  .listvar560:
  9889 00004B11 6A20                     push 32
  9890 00004B13 E868F9                   call prc
  9891 00004B16 83C402                   add  sp, 2
  9892 00004B19 FF7604                   push word [bp+4]
  9893 00004B1C E8B5BD                   call adrofname
  9894 00004B1F 83C402                   add  sp, 2
  9895 00004B22 A3[6A00]                 mov word [pt], ax
  9896 00004B25 FF36[6A00]               push word [pt]
  9897 00004B29 E8B9F9                   call prs
  9898 00004B2C 83C402                   add  sp, 2
  9899                                  
  9900                                  ;-916   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9901                                  
  9902 00004B2F 8B5E04                   mov bx, [bp+4]
  9903 00004B32 8A87B782                 mov al, [GType + bx]
  9904 00004B36 3C23                     cmp al, 35
  9905 00004B38 0F851D00                 jne .listvar563
  9906 00004B3C 6A3D                     push 61
  9907 00004B3E E83DF9                   call prc
  9908 00004B41 83C402                   add  sp, 2
  9909 00004B44 8B5E04                   mov bx, [bp+4]
  9910 00004B47 D1E3                     shl bx, 1
  9911 00004B49 8B87EB8A                 mov ax, [GData + bx]
  9912 00004B4D 8946FE                   mov [bp-2], ax
  9913 00004B50 FF76FE                   push word [bp-2]
  9914 00004B53 E8E4FA                   call prunsign1
  9915 00004B56 83C402                   add  sp, 2
  9916                                  
  9917                                  ;-917   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9918                                  
  9919                                  .listvar563:
  9920 00004B59 8B5E04                   mov bx, [bp+4]
  9921 00004B5C 8A87B782                 mov al, [GType + bx]
  9922 00004B60 3C26                     cmp al, 38
  9923 00004B62 0F852500                 jne .listvar564
  9924 00004B66 6A5B                     push 91
  9925 00004B68 E813F9                   call prc
  9926 00004B6B 83C402                   add  sp, 2
  9927 00004B6E 8B5E04                   mov bx, [bp+4]
  9928 00004B71 D1E3                     shl bx, 1
  9929 00004B73 8B87EB8A                 mov ax, [GData + bx]
  9930 00004B77 8946FE                   mov [bp-2], ax
  9931 00004B7A FF76FE                   push word [bp-2]
  9932 00004B7D E8BAFA                   call prunsign1
  9933 00004B80 83C402                   add  sp, 2
  9934 00004B83 6A5D                     push 93
  9935 00004B85 E8F6F8                   call prc
  9936 00004B88 83C402                   add  sp, 2
  9937                                  
  9938                                  ;-918   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9939                                  
  9940                                  .listvar564:
  9941 00004B8B 8B4604                   mov ax, [bp+4]
  9942 00004B8E 3DC800                   cmp ax, 200 ;unsigned : 0
  9943 00004B91 0F823000                 jb  .listvar565
  9944 00004B95 68[094C]                 push listvar_12
  9945 00004B98 E84AF9                   call prs
  9946 00004B9B 83C402                   add  sp, 2
  9947 00004B9E 8B5E04                   mov bx, [bp+4]
  9948 00004BA1 D1E3                     shl bx, 1
  9949 00004BA3 8B87EB8A                 mov ax, [GData + bx]
  9950 00004BA7 8946FE                   mov [bp-2], ax
  9951                                  
  9952                                  ;-919     if (j > 0) prc('+'); pint1(j);  }
  9953                                  
  9954 00004BAA 8B46FE                   mov ax, [bp-2]
  9955 00004BAD 83F800                   cmp ax, 0
  9956 00004BB0 0F8E0800                 jle .listvar566
  9957 00004BB4 6A2B                     push 43
  9958 00004BB6 E8C5F8                   call prc
  9959 00004BB9 83C402                   add  sp, 2
  9960                                  .listvar566:
  9961 00004BBC FF76FE                   push word [bp-2]
  9962 00004BBF E81AFA                   call pint1
  9963 00004BC2 83C402                   add  sp, 2
  9964                                  
  9965                                  ;-920 }
  9966                                  
  9967                                  .listvar565:
  9968                                  
  9969                                  ;-921 int listcall() { int i;
  9970 00004BC5 C9                       LEAVE
  9971 00004BC6 C3                       ret
  9972 00004BC7 5C6E3B00                listvar_0 db "\n;",0
  9973 00004BCB 7661722000              listvar_1 db "var ",0
  9974 00004BD0 7074722000              listvar_2 db "ptr ",0
  9975 00004BD5 6172722000              listvar_3 db "arr ",0
  9976 00004BDA 6465662000              listvar_4 db "def ",0
  9977 00004BDF 7369676E2000            listvar_5 db "sign ",0
  9978 00004BE5 756E73672000            listvar_6 db "unsg ",0
  9979 00004BEB 627974652000            listvar_7 db "byte ",0
  9980 00004BF1 776F72642000            listvar_8 db "word ",0
  9981 00004BF7 647772642000            listvar_9 db "dwrd ",0
  9982 00004BFD 202020202D00            listvar_10 db "    -",0
  9983 00004C03 204E554C4C00            listvar_11 db " NULL",0
  9984 00004C09 203D20627000            listvar_12 db " = bp",0
  9985                                  ENDP
  9986                                  
  9987                                  listcall: PROC
  9988                                  
  9989                                  ;-922   prs("\n\n;    #  addr name   list of CALLs\n");
  9990                                  
  9991                                  ;Function : listcall, Number of local variables: 1
  9992                                  ;   # type sign width addr used name   list of local variables
  9993                                  ;  200 var sign word   921 NULL i = bp-2;
  9994 00004C0F C8020000                 ENTER  2,0
  9995 00004C13 68[3D4C]                 push listcall_0
  9996 00004C16 E8CCF8                   call prs
  9997 00004C19 83C402                   add  sp, 2
  9998                                  
  9999                                  ;-923   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10000                                  
 10001 00004C1C B80000                   mov ax, 0
 10002 00004C1F 8946FE                   mov [bp-2], ax
 10003                                  .listcall567:
 10004 00004C22 8B46FE                   mov ax, [bp-2]
 10005 00004C25 3B06[3D00]               cmp ax, [CTop]
 10006 00004C29 0F8D0E00                 jge .listcall568
 10007 00004C2D FF76FE                   push word [bp-2]
 10008 00004C30 E83200                   call calllisting
 10009 00004C33 83C402                   add  sp, 2
 10010 00004C36 FF46FE                   inc  word[bp-2]
 10011 00004C39 EBE7                     jmp .listcall567
 10012                                  .listcall568:
 10013                                  
 10014                                  ;-924 int calllisting(int i) {char c; int j;
 10015 00004C3B C9                       LEAVE
 10016 00004C3C C3                       ret
 10017 00004C3D 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10018 00004C46 23202061646472206E-
 10019 00004C4F 616D652020206C6973-
 10020 00004C58 74206F662043414C4C-
 10021 00004C61 735C6E00           
 10022                                  ENDP
 10023                                  
 10024                                  calllisting: PROC
 10025                                  
 10026                                  ;-925   prs("\n;"); printint51(i); prc(32);
 10027                                  
 10028                                  ;Function : calllisting, Number of local variables: 3
 10029                                  ;   # type sign width addr used name   list of local variables
 10030                                  ;  200 var sign word   924 NULL i = bp+4
 10031                                  ;  201 var sign byte   924 NULL c = bp-2
 10032                                  ;  202 var sign word   924 NULL j = bp-4;
 10033 00004C65 C8040000                 ENTER  4,0
 10034 00004C69 68[D74C]                 push calllisting_0
 10035 00004C6C E876F8                   call prs
 10036 00004C6F 83C402                   add  sp, 2
 10037 00004C72 FF7604                   push word [bp+4]
 10038 00004C75 E804FA                   call printint51
 10039 00004C78 83C402                   add  sp, 2
 10040 00004C7B 6A20                     push 32
 10041 00004C7D E8FEF7                   call prc
 10042 00004C80 83C402                   add  sp, 2
 10043                                  
 10044                                  ;-926   c=CType [i]; if(c==0)prs("unresolved ");
 10045                                  
 10046 00004C83 8B5E04                   mov bx, [bp+4]
 10047 00004C86 8A872FA1                 mov al, [CType + bx]
 10048 00004C8A 8846FE                   mov [bp-2], al
 10049 00004C8D 8A46FE                   mov al, [bp-2]
 10050 00004C90 3C00                     cmp al, 0
 10051 00004C92 0F850900                 jne .calllisting569
 10052 00004C96 68[DB4C]                 push calllisting_1
 10053 00004C99 E849F8                   call prs
 10054 00004C9C 83C402                   add  sp, 2
 10055                                  
 10056                                  ;-927   j=CAdr[i];            printint51(j); prc(32);
 10057                                  
 10058                                  .calllisting569:
 10059 00004C9F 8B5E04                   mov bx, [bp+4]
 10060 00004CA2 D1E3                     shl bx, 1
 10061 00004CA4 8B8757AB                 mov ax, [CAdr + bx]
 10062 00004CA8 8946FC                   mov [bp-4], ax
 10063 00004CAB FF76FC                   push word [bp-4]
 10064 00004CAE E8CBF9                   call printint51
 10065 00004CB1 83C402                   add  sp, 2
 10066 00004CB4 6A20                     push 32
 10067 00004CB6 E8C5F7                   call prc
 10068 00004CB9 83C402                   add  sp, 2
 10069                                  
 10070                                  ;-928   from_far(NameA, j);   prs(NameA);
 10071                                  
 10072 00004CBC FF76FC                   push word [bp-4]
 10073 00004CBF 8D06[3F00]               lea  ax, [NameA]
 10074 00004CC3 50                       push ax
 10075 00004CC4 E8B306                   call from_far
 10076 00004CC7 83C404                   add  sp, 4
 10077 00004CCA 8D06[3F00]               lea  ax, [NameA]
 10078 00004CCE 50                       push ax
 10079 00004CCF E813F8                   call prs
 10080 00004CD2 83C402                   add  sp, 2
 10081                                  
 10082                                  ;-929 }
 10083                                  
 10084                                  
 10085                                  ;-930 int countcalls(int f) { unsigned int i;
 10086 00004CD5 C9                       LEAVE
 10087 00004CD6 C3                       ret
 10088 00004CD7 5C6E3B00                calllisting_0 db "\n;",0
 10089 00004CDB 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10090 00004CE4 642000             
 10091                                  ENDP
 10092                                  
 10093                                  countcalls: PROC
 10094                                  
 10095                                  ;-931   pt=adrF(FNameField, f);
 10096                                  
 10097                                  ;Function : countcalls, Number of local variables: 2
 10098                                  ;   # type sign width addr used name   list of local variables
 10099                                  ;  200 var sign word   930 NULL f = bp+4
 10100                                  ;  201 var unsg word   930 NULL i = bp-2;
 10101 00004CE7 C8020000                 ENTER  2,0
 10102 00004CEB FF7604                   push word [bp+4]
 10103 00004CEE 8D064FBD                 lea  ax, [FNameField]
 10104 00004CF2 50                       push ax
 10105 00004CF3 E8F2BB                   call adrF
 10106 00004CF6 83C404                   add  sp, 4
 10107 00004CF9 A3[6A00]                 mov word [pt], ax
 10108                                  
 10109                                  ;-932   i=0;  while (i < CTop) {
 10110                                  
 10111 00004CFC B80000                   mov ax, 0
 10112 00004CFF 8946FE                   mov [bp-2], ax
 10113                                  .countcalls570:
 10114 00004D02 8B46FE                   mov ax, [bp-2]
 10115 00004D05 3B06[3D00]               cmp ax, [CTop]
 10116 00004D09 0F8D4A00                 jge .countcalls571
 10117                                  
 10118                                  ;-933     p1=CAdr[i];
 10119                                  
 10120 00004D0D 8B5EFE                   mov bx, [bp-2]
 10121 00004D10 D1E3                     shl bx, 1
 10122 00004D12 8B8757AB                 mov ax, [CAdr + bx]
 10123 00004D16 A3[6C00]                 mov word [p1], ax
 10124                                  
 10125                                  ;-934     from_far(NameA, p1);
 10126                                  
 10127 00004D19 FF36[6C00]               push word [p1]
 10128 00004D1D 8D06[3F00]               lea  ax, [NameA]
 10129 00004D21 50                       push ax
 10130 00004D22 E85506                   call from_far
 10131 00004D25 83C404                   add  sp, 4
 10132                                  
 10133                                  ;-935     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10134                                  
 10135 00004D28 8D06[3F00]               lea  ax, [NameA]
 10136 00004D2C 50                       push ax
 10137 00004D2D FF36[6A00]               push word [pt]
 10138 00004D31 E862B4                   call eqstr
 10139 00004D34 83C404                   add  sp, 4
 10140 00004D37 08C0                     or  al, al
 10141 00004D39 0F841500                 je .countcalls572
 10142 00004D3D 8B5E04                   mov bx, [bp+4]
 10143 00004D40 D1E3                     shl bx, 1
 10144 00004D42 8B87F7BA                 mov ax, [FCalls + bx]
 10145 00004D46 83C001                   add ax, 1
 10146 00004D49 8B5E04                   mov bx, [bp+4]
 10147 00004D4C D1E3                     shl bx, 1
 10148 00004D4E 8987F7BA                 mov [FCalls+bx], ax
 10149                                  
 10150                                  ;-936     i++; }
 10151                                  
 10152                                  .countcalls572:
 10153 00004D52 FF46FE                   inc  word[bp-2]
 10154                                  
 10155                                  ;-937 }
 10156                                  
 10157 00004D55 EBAB                     jmp .countcalls570
 10158                                  .countcalls571:
 10159                                  
 10160                                  ;-938 int listfunc() { int i;
 10161 00004D57 C9                       LEAVE
 10162 00004D58 C3                       ret
 10163                                  ENDP
 10164                                  
 10165                                  listfunc: PROC
 10166                                  
 10167                                  ;-939   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10168                                  
 10169                                  ;Function : listfunc, Number of local variables: 1
 10170                                  ;   # type sign width addr used name   list of local variables
 10171                                  ;  200 var sign word   938 NULL i = bp-2;
 10172 00004D59 C8020000                 ENTER  2,0
 10173 00004D5D 68[A64D]                 push listfunc_0
 10174 00004D60 E882F7                   call prs
 10175 00004D63 83C402                   add  sp, 2
 10176                                  
 10177                                  ;-940   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10178                                  
 10179 00004D66 B80000                   mov ax, 0
 10180 00004D69 8946FE                   mov [bp-2], ax
 10181                                  .listfunc573:
 10182 00004D6C 8B46FE                   mov ax, [bp-2]
 10183 00004D6F 3B06[3B00]               cmp ax, [FTop]
 10184 00004D73 0F8D0E00                 jge .listfunc574
 10185 00004D77 FF76FE                   push word [bp-2]
 10186 00004D7A E86AFF                   call countcalls
 10187 00004D7D 83C402                   add  sp, 2
 10188 00004D80 FF46FE                   inc  word[bp-2]
 10189                                  
 10190                                  ;-941   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10191                                  
 10192 00004D83 EBE7                     jmp .listfunc573
 10193                                  .listfunc574:
 10194 00004D85 B80000                   mov ax, 0
 10195 00004D88 8946FE                   mov [bp-2], ax
 10196                                  .listfunc575:
 10197 00004D8B 8B46FE                   mov ax, [bp-2]
 10198 00004D8E 3B06[3B00]               cmp ax, [FTop]
 10199 00004D92 0F8D0E00                 jge .listfunc576
 10200 00004D96 FF76FE                   push word [bp-2]
 10201 00004D99 E84300                   call funclisting
 10202 00004D9C 83C402                   add  sp, 2
 10203 00004D9F FF46FE                   inc  word[bp-2]
 10204 00004DA2 EBE7                     jmp .listfunc575
 10205                                  .listfunc576:
 10206                                  
 10207                                  ;-942 int funclisting(int i) {int j;  char c;
 10208 00004DA4 C9                       LEAVE
 10209 00004DA5 C3                       ret
 10210 00004DA6 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10211 00004DAF 20232043616C6C7320-
 10212 00004DB8 4C696E652057696474-
 10213 00004DC1 6820204E616D652020-
 10214 00004DCA 206C697374206F6620-
 10215 00004DD3 66756E6374696F6E73-
 10216 00004DDC 5C6E00             
 10217                                  ENDP
 10218                                  
 10219                                  funclisting: PROC
 10220                                  
 10221                                  ;-943   prs("\n;");    printint51(i);
 10222                                  
 10223                                  ;Function : funclisting, Number of local variables: 3
 10224                                  ;   # type sign width addr used name   list of local variables
 10225                                  ;  200 var sign word   942 NULL i = bp+4
 10226                                  ;  201 var sign word   942 NULL j = bp-2
 10227                                  ;  202 var sign byte   942 NULL c = bp-4;
 10228 00004DDF C8040000                 ENTER  4,0
 10229 00004DE3 68[BB4E]                 push funclisting_0
 10230 00004DE6 E8FCF6                   call prs
 10231 00004DE9 83C402                   add  sp, 2
 10232 00004DEC FF7604                   push word [bp+4]
 10233 00004DEF E88AF8                   call printint51
 10234 00004DF2 83C402                   add  sp, 2
 10235                                  
 10236                                  ;-944   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10237                                  
 10238 00004DF5 8B5E04                   mov bx, [bp+4]
 10239 00004DF8 D1E3                     shl bx, 1
 10240 00004DFA 8B87F7BA                 mov ax, [FCalls + bx]
 10241 00004DFE 8946FE                   mov [bp-2], ax
 10242 00004E01 8B46FE                   mov ax, [bp-2]
 10243 00004E04 08C0                     or  al, al
 10244 00004E06 0F840C00                 je .funclisting577
 10245 00004E0A FF76FE                   push word [bp-2]
 10246 00004E0D E86CF8                   call printint51
 10247 00004E10 83C402                   add  sp, 2
 10248 00004E13 E90900                   jmp .funclisting578
 10249                                  .funclisting577:
 10250 00004E16 68[BF4E]                 push funclisting_1
 10251 00004E19 E8C9F6                   call prs
 10252 00004E1C 83C402                   add  sp, 2
 10253                                  
 10254                                  ;-945   j = FAdr[i];   printint51(j); prc(32);
 10255                                  
 10256                                  .funclisting578:
 10257 00004E1F 8B5E04                   mov bx, [bp+4]
 10258 00004E22 D1E3                     shl bx, 1
 10259 00004E24 8B87FFA8                 mov ax, [FAdr + bx]
 10260 00004E28 8946FE                   mov [bp-2], ax
 10261 00004E2B FF76FE                   push word [bp-2]
 10262 00004E2E E84BF8                   call printint51
 10263 00004E31 83C402                   add  sp, 2
 10264 00004E34 6A20                     push 32
 10265 00004E36 E845F6                   call prc
 10266 00004E39 83C402                   add  sp, 2
 10267                                  
 10268                                  ;-946   c=FType[i];
 10269                                  
 10270 00004E3C 8B5E04                   mov bx, [bp+4]
 10271 00004E3F 8A8703A0                 mov al, [FType + bx]
 10272 00004E43 8846FC                   mov [bp-4], al
 10273                                  
 10274                                  ;-947   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10275                                  
 10276 00004E46 8A46FC                   mov al, [bp-4]
 10277 00004E49 3C56                     cmp al, 86
 10278 00004E4B 0F850900                 jne .funclisting579
 10279 00004E4F 68[C54E]                 push funclisting_2
 10280 00004E52 E890F6                   call prs
 10281 00004E55 83C402                   add  sp, 2
 10282                                  .funclisting579:
 10283 00004E58 8A46FC                   mov al, [bp-4]
 10284 00004E5B 3C42                     cmp al, 66
 10285 00004E5D 0F850900                 jne .funclisting580
 10286 00004E61 68[CB4E]                 push funclisting_3
 10287 00004E64 E87EF6                   call prs
 10288 00004E67 83C402                   add  sp, 2
 10289                                  
 10290                                  ;-948   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10291                                  
 10292                                  .funclisting580:
 10293 00004E6A 8A46FC                   mov al, [bp-4]
 10294 00004E6D 3C57                     cmp al, 87
 10295 00004E6F 0F850900                 jne .funclisting581
 10296 00004E73 68[D14E]                 push funclisting_4
 10297 00004E76 E86CF6                   call prs
 10298 00004E79 83C402                   add  sp, 2
 10299                                  .funclisting581:
 10300 00004E7C 8A46FC                   mov al, [bp-4]
 10301 00004E7F 3C44                     cmp al, 68
 10302 00004E81 0F850900                 jne .funclisting582
 10303 00004E85 68[D74E]                 push funclisting_5
 10304 00004E88 E85AF6                   call prs
 10305 00004E8B 83C402                   add  sp, 2
 10306                                  
 10307                                  ;-949   prc(32); prc(32);
 10308                                  
 10309                                  .funclisting582:
 10310 00004E8E 6A20                     push 32
 10311 00004E90 E8EBF5                   call prc
 10312 00004E93 83C402                   add  sp, 2
 10313 00004E96 6A20                     push 32
 10314 00004E98 E8E3F5                   call prc
 10315 00004E9B 83C402                   add  sp, 2
 10316                                  
 10317                                  ;-950   pt=adrF(FNameField, i); prs(pt);
 10318                                  
 10319 00004E9E FF7604                   push word [bp+4]
 10320 00004EA1 8D064FBD                 lea  ax, [FNameField]
 10321 00004EA5 50                       push ax
 10322 00004EA6 E83FBA                   call adrF
 10323 00004EA9 83C404                   add  sp, 4
 10324 00004EAC A3[6A00]                 mov word [pt], ax
 10325 00004EAF FF36[6A00]               push word [pt]
 10326 00004EB3 E82FF6                   call prs
 10327 00004EB6 83C402                   add  sp, 2
 10328                                  
 10329                                  ;-951 }
 10330                                  
 10331                                  
 10332                                  ;-952 unsigned int MAXUI=65535;
 10333 00004EB9 C9                       LEAVE
 10334 00004EBA C3                       ret
 10335 00004EBB 5C6E3B00                funclisting_0 db "\n;",0
 10336 00004EBF 204E554C4C00            funclisting_1 db " NULL",0
 10337 00004EC5 766F69642000            funclisting_2 db "void ",0
 10338 00004ECB 627974652000            funclisting_3 db "byte ",0
 10339 00004ED1 776F72642000            funclisting_4 db "word ",0
 10340 00004ED7 647772642000            funclisting_5 db "dwrd ",0
 10341                                  ENDP
 10342 00004EDD FFFF                    MAXUI dw 65535
 10343                                  
 10344                                  ;-953 int epilog() {unsigned int i; 
 10345                                  
 10346                                  
 10347                                  epilog: PROC
 10348                                  
 10349                                  ;-954   strcpy(symbol, "LastFunctionByt");  storefunc();
 10350                                  
 10351                                  ;Function : epilog, Number of local variables: 1
 10352                                  ;   # type sign width addr used name   list of local variables
 10353                                  ;  200 var unsg word   953 NULL i = bp-2;
 10354 00004EDF C8020000                 ENTER  2,0
 10355 00004EE3 68[1151]                 push epilog_0
 10356 00004EE6 8D062B81                 lea  ax, [symbol]
 10357 00004EEA 50                       push ax
 10358 00004EEB E878B2                   call strcpy
 10359 00004EEE 83C404                   add  sp, 4
 10360 00004EF1 E8CFBC                   call storefunc
 10361                                  
 10362                                  ;-955   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10363                                  
 10364 00004EF4 68[2151]                 push epilog_1
 10365 00004EF7 E8EBF5                   call prs
 10366 00004EFA 83C402                   add  sp, 2
 10367                                  
 10368                                  ;-956   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10369                                  
 10370 00004EFD 68[4E51]                 push epilog_2
 10371 00004F00 E8E2F5                   call prs
 10372 00004F03 83C402                   add  sp, 2
 10373                                  
 10374                                  ;-957   i=1;
 10375                                  
 10376 00004F06 B80100                   mov ax, 1
 10377 00004F09 8946FE                   mov [bp-2], ax
 10378                                  
 10379                                  ;-958   while (i< GTop) { listvar(i); i++; }
 10380                                  
 10381                                  .epilog583:
 10382 00004F0C 8B46FE                   mov ax, [bp-2]
 10383 00004F0F 3B06[2A00]               cmp ax, [GTop]
 10384 00004F13 0F8D0E00                 jge .epilog584
 10385 00004F17 FF76FE                   push word [bp-2]
 10386 00004F1A E8BEFA                   call listvar
 10387 00004F1D 83C402                   add  sp, 2
 10388 00004F20 FF46FE                   inc  word[bp-2]
 10389                                  
 10390                                  ;-959   listfunc();   listcall();
 10391                                  
 10392 00004F23 EBE7                     jmp .epilog583
 10393                                  .epilog584:
 10394 00004F25 E831FE                   call listfunc
 10395 00004F28 E8E4FC                   call listcall
 10396                                  
 10397                                  ;-960 
 10398                                  
 10399                                  
 10400                                  ;-961   prs("\n;Input: "); prs(&namein);
 10401                                  
 10402 00004F2B 68[9551]                 push epilog_3
 10403 00004F2E E8B4F5                   call prs
 10404 00004F31 83C402                   add  sp, 2
 10405 00004F34 8D06EE81                 lea  ax, [namein]
 10406 00004F38 50                       push ax
 10407 00004F39 E8A9F5                   call prs
 10408 00004F3C 83C402                   add  sp, 2
 10409                                  
 10410                                  ;-962   prs(", List: ");   prs(&namelst);
 10411                                  
 10412 00004F3F 68[A051]                 push epilog_4
 10413 00004F42 E8A0F5                   call prs
 10414 00004F45 83C402                   add  sp, 2
 10415 00004F48 8D063182                 lea  ax, [namelst]
 10416 00004F4C 50                       push ax
 10417 00004F4D E895F5                   call prs
 10418 00004F50 83C402                   add  sp, 2
 10419                                  
 10420                                  ;-963   prs(",  Lines:"); printint51(lineno);
 10421                                  
 10422 00004F53 68[A951]                 push epilog_5
 10423 00004F56 E88CF5                   call prs
 10424 00004F59 83C402                   add  sp, 2
 10425 00004F5C FF36[6600]               push word [lineno]
 10426 00004F60 E819F7                   call printint51
 10427 00004F63 83C402                   add  sp, 2
 10428                                  
 10429                                  ;-964   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10430                                  
 10431 00004F66 68[B351]                 push epilog_6
 10432 00004F69 E879F5                   call prs
 10433 00004F6C 83C402                   add  sp, 2
 10434 00004F6F FF0E[2A00]               dec  word[GTop]
 10435 00004F73 FF36[2A00]               push word [GTop]
 10436 00004F77 E802F7                   call printint51
 10437 00004F7A 83C402                   add  sp, 2
 10438                                  
 10439                                  ;-965   prs(" max.:"); printint51(LSTART);
 10440                                  
 10441 00004F7D 68[C751]                 push epilog_7
 10442 00004F80 E862F5                   call prs
 10443 00004F83 83C402                   add  sp, 2
 10444 00004F86 68C800                   push 200
 10445 00004F89 E8F0F6                   call printint51
 10446 00004F8C 83C402                   add  sp, 2
 10447                                  
 10448                                  ;-966   prs("\n;Functions      :"); printint51(FTop);
 10449                                  
 10450 00004F8F 68[CE51]                 push epilog_8
 10451 00004F92 E850F5                   call prs
 10452 00004F95 83C402                   add  sp, 2
 10453 00004F98 FF36[3B00]               push word [FTop]
 10454 00004F9C E8DDF6                   call printint51
 10455 00004F9F 83C402                   add  sp, 2
 10456                                  
 10457                                  ;-967   prs(" max.:"); printint51(FUNCMAX);
 10458                                  
 10459 00004FA2 68[E251]                 push epilog_9
 10460 00004FA5 E83DF5                   call prs
 10461 00004FA8 83C402                   add  sp, 2
 10462 00004FAB 682C01                   push 300
 10463 00004FAE E8CBF6                   call printint51
 10464 00004FB1 83C402                   add  sp, 2
 10465                                  
 10466                                  ;-968   prs("\n;Calls          :"); printint51(CTop);
 10467                                  
 10468 00004FB4 68[E951]                 push epilog_10
 10469 00004FB7 E82BF5                   call prs
 10470 00004FBA 83C402                   add  sp, 2
 10471 00004FBD FF36[3D00]               push word [CTop]
 10472 00004FC1 E8B8F6                   call printint51
 10473 00004FC4 83C402                   add  sp, 2
 10474                                  
 10475                                  ;-969   prs(" max.:"); printint51(CALLMAX);
 10476                                  
 10477 00004FC7 68[FD51]                 push epilog_11
 10478 00004FCA E818F5                   call prs
 10479 00004FCD 83C402                   add  sp, 2
 10480 00004FD0 68D007                   push 2000
 10481 00004FD3 E8A6F6                   call printint51
 10482 00004FD6 83C402                   add  sp, 2
 10483                                  
 10484                                  ;-970   prs(", NameField:"); printint51(CNameTop);
 10485                                  
 10486 00004FD9 68[0452]                 push epilog_12
 10487 00004FDC E806F5                   call prs
 10488 00004FDF 83C402                   add  sp, 2
 10489 00004FE2 FF36[6000]               push word [CNameTop]
 10490 00004FE6 E893F6                   call printint51
 10491 00004FE9 83C402                   add  sp, 2
 10492                                  
 10493                                  ;-971   prs(" max.:"); printint51(65535);
 10494                                  
 10495 00004FEC 68[1152]                 push epilog_13
 10496 00004FEF E8F3F4                   call prs
 10497 00004FF2 83C402                   add  sp, 2
 10498 00004FF5 68FFFF                   push 65535
 10499 00004FF8 E881F6                   call printint51
 10500 00004FFB 83C402                   add  sp, 2
 10501                                  
 10502                                  ;-972 //  prs(", segE:"); printint51(segE);
 10503                                  
 10504                                  
 10505                                  ;-973   __asm{call LastFunctionByt}  _ i=ax;
 10506                                  
 10507 00004FFE E89903                  call LastFunctionByt
 10508 00005001 8946FE                  mov [bp-2], ax
 10509                                  
 10510                                  ;-974   prs("\n;Code until     :"); printint51(i);
 10511                                  
 10512 00005004 68[1852]                 push epilog_14
 10513 00005007 E8DBF4                   call prs
 10514 0000500A 83C402                   add  sp, 2
 10515 0000500D FF76FE                   push word [bp-2]
 10516 00005010 E869F6                   call printint51
 10517 00005013 83C402                   add  sp, 2
 10518                                  
 10519                                  ;-975   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10520                                  
 10521 00005016 68[2C52]                 push epilog_15
 10522 00005019 E8C9F4                   call prs
 10523 0000501C 83C402                   add  sp, 2
 10524 0000501F FF36[0E00]               push word [ORGDATAORIG]
 10525 00005023 E856F6                   call printint51
 10526 00005026 83C402                   add  sp, 2
 10527 00005029 A1[0E00]                 mov ax, [ORGDATAORIG]
 10528 0000502C 2B46FE                   sub ax, [bp-2]
 10529 0000502F 8946FE                   mov [bp-2], ax
 10530 00005032 68[3452]                 push epilog_16
 10531 00005035 E8ADF4                   call prs
 10532 00005038 83C402                   add  sp, 2
 10533                                  
 10534                                  ;-976   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10535                                  
 10536 0000503B FF76FE                   push word [bp-2]
 10537 0000503E E83BF6                   call printint51
 10538 00005041 83C402                   add  sp, 2
 10539 00005044 8B46FE                   mov ax, [bp-2]
 10540 00005047 3DE803                   cmp ax, 1000
 10541 0000504A 0F870900                 ja  .epilog585
 10542 0000504E 68[3C52]                 push epilog_17
 10543 00005051 E891F4                   call prs
 10544 00005054 83C402                   add  sp, 2
 10545                                  
 10546                                  ;-977   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10547                                  
 10548                                  .epilog585:
 10549 00005057 68[6152]                 push epilog_18
 10550 0000505A E888F4                   call prs
 10551 0000505D 83C402                   add  sp, 2
 10552 00005060 FF36[1000]               push word [orgData]
 10553 00005064 E8D3F5                   call prunsign1
 10554 00005067 83C402                   add  sp, 2
 10555 0000506A A1[DD4E]                 mov ax, [MAXUI]
 10556 0000506D 2B06[1000]               sub ax, [orgData]
 10557 00005071 8946FE                   mov [bp-2], ax
 10558                                  
 10559                                  ;-978   prs(", resting stacksize: ");printint51(i);
 10560                                  
 10561 00005074 68[7552]                 push epilog_19
 10562 00005077 E86BF4                   call prs
 10563 0000507A 83C402                   add  sp, 2
 10564 0000507D FF76FE                   push word [bp-2]
 10565 00005080 E8F9F5                   call printint51
 10566 00005083 83C402                   add  sp, 2
 10567                                  
 10568                                  ;-979   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10569                                  
 10570 00005086 8B46FE                   mov ax, [bp-2]
 10571 00005089 3D8813                   cmp ax, 5000
 10572 0000508C 0F870900                 ja  .epilog586
 10573 00005090 68[8B52]                 push epilog_20
 10574 00005093 E84FF4                   call prs
 10575 00005096 83C402                   add  sp, 2
 10576                                  
 10577                                  ;-980   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10578                                  
 10579                                  .epilog586:
 10580 00005099 68[AC52]                 push epilog_21
 10581 0000509C E846F4                   call prs
 10582 0000509F 83C402                   add  sp, 2
 10583 000050A2 8D06E880                 lea  ax, [coname]
 10584 000050A6 50                       push ax
 10585 000050A7 E83BF4                   call prs
 10586 000050AA 83C402                   add  sp, 2
 10587 000050AD 68[BF52]                 push epilog_22
 10588 000050B0 E832F4                   call prs
 10589 000050B3 83C402                   add  sp, 2
 10590 000050B6 FF36[1200]               push word [maxco]
 10591 000050BA E8BFF5                   call printint51
 10592 000050BD 83C402                   add  sp, 2
 10593                                  
 10594                                  ;-981   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10595                                  
 10596 000050C0 68[C352]                 push epilog_23
 10597 000050C3 E81FF4                   call prs
 10598 000050C6 83C402                   add  sp, 2
 10599 000050C9 68B80B                   push 3000
 10600 000050CC E8ADF5                   call printint51
 10601 000050CF 83C402                   add  sp, 2
 10602 000050D2 B8B80B                   mov ax, 3000
 10603 000050D5 8946FE                   mov [bp-2], ax
 10604 000050D8 8B46FE                   mov ax, [bp-2]
 10605 000050DB 2B06[1200]               sub ax, [maxco]
 10606 000050DF 8946FE                   mov [bp-2], ax
 10607 000050E2 68[C952]                 push epilog_24
 10608 000050E5 E8FDF3                   call prs
 10609 000050E8 83C402                   add  sp, 2
 10610                                  
 10611                                  ;-982   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10612                                  
 10613 000050EB FF76FE                   push word [bp-2]
 10614 000050EE E88BF5                   call printint51
 10615 000050F1 83C402                   add  sp, 2
 10616 000050F4 8B46FE                   mov ax, [bp-2]
 10617 000050F7 3DE803                   cmp ax, 1000
 10618 000050FA 0F870900                 ja  .epilog587
 10619 000050FE 68[D152]                 push epilog_25
 10620 00005101 E8E1F3                   call prs
 10621 00005104 83C402                   add  sp, 2
 10622                                  
 10623                                  ;-983   end1(0);}
 10624                                  
 10625                                  .epilog587:
 10626 00005107 6A00                     push 0
 10627 00005109 E8D5F6                   call end1
 10628 0000510C 83C402                   add  sp, 2
 10629                                  
 10630                                  ;-984 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10631                                  
 10632                                  
 10633                                  ;-985 int setblock(unsigned int i) {
 10634 0000510F C9                       LEAVE
 10635 00005110 C3                       ret
 10636 00005111 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10637 0000511A 696F6E42797400     
 10638 00005121 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10639 0000512A 6374696F6E4279743A-
 10640 00005133 646220304538682C20-
 10641 0000513C 302C20305C6E706F70-
 10642 00005145 2061785C6E72657400 
 10643 0000514E 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10644 00005157 232074797065207369-
 10645 00005160 676E20776964746820-
 10646 00005169 206164722075736564-
 10647 00005172 206E616D652020206C-
 10648 0000517B 697374206F6620676C-
 10649 00005184 6F62616C2076617269-
 10650 0000518D 61626C65735C6E00   
 10651 00005195 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10652 0000519E 2000               
 10653 000051A0 2C204C6973743A2000      epilog_4 db ", List: ",0
 10654 000051A9 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10655 000051B2 00                 
 10656 000051B3 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10657 000051BC 7661726961626C6573-
 10658 000051C5 3A00               
 10659 000051C7 206D61782E3A00          epilog_7 db " max.:",0
 10660 000051CE 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10661 000051D7 6F6E73202020202020-
 10662 000051E0 3A00               
 10663 000051E2 206D61782E3A00          epilog_9 db " max.:",0
 10664 000051E9 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10665 000051F2 202020202020202020-
 10666 000051FB 3A00               
 10667 000051FD 206D61782E3A00          epilog_11 db " max.:",0
 10668 00005204 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10669 0000520D 6C643A00           
 10670 00005211 206D61782E3A00          epilog_13 db " max.:",0
 10671 00005218 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10672 00005221 6E74696C2020202020-
 10673 0000522A 3A00               
 10674 0000522C 206D61782E3A2000        epilog_15 db " max.: ",0
 10675 00005234 2C20667265653A00        epilog_16 db ", free:",0
 10676 0000523C 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10677 00005245 696E67202A2A2A2043-
 10678 0000524E 6F6465206172656120-
 10679 00005257 746F6F20736D616C6C-
 10680 00005260 00                 
 10681 00005261 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10682 0000526A 48656170456E642920-
 10683 00005273 3A00               
 10684 00005275 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10685 0000527E 20737461636B73697A-
 10686 00005287 653A2000           
 10687 0000528B 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10688 00005294 696E67202A2A2A2053-
 10689 0000529D 7461636B20746F6F20-
 10690 000052A6 736D616C6C00       
 10691 000052AC 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10692 000052B5 6F6E737420696E2027-
 10693 000052BE 00                 
 10694 000052BF 27203A00                epilog_22 db "' :",0
 10695 000052C3 206D61782E00            epilog_23 db " max.",0
 10696 000052C9 2C20667265653A00        epilog_24 db ", free:",0
 10697 000052D1 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10698 000052DA 696E67202A2A2A2063-
 10699 000052E3 6F6E7374616E742061-
 10700 000052EC 72656120746F6F2073-
 10701 000052F5 6D616C6C00         
 10702                                  ENDP
 10703                                  
 10704                                  setblock: PROC
 10705                                  
 10706                                  ;-986   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10707                                  
 10708                                  ;Function : setblock, Number of local variables: 1
 10709                                  ;   # type sign width addr used name   list of local variables
 10710                                  ;  200 var unsg word   985 NULL i = bp+4;
 10711 000052FA C8000000                 ENTER  0,0
 10712 000052FE B80000                   mov ax, 0
 10713 00005301 A3[6E00]                 mov word [DOS_ERR], ax
 10714 00005304 8B5E04                   mov  bx, [bp+4]
 10715 00005307 8CC8                     mov  ax, cs
 10716 00005309 8EC0                     mov  es, ax
 10717 0000530B B8004A                   mov  ax, 18944
 10718 0000530E E8BCAD                   call DosInt
 10719                                  
 10720                                  ;-987 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10721 00005311 C9                       LEAVE
 10722 00005312 C3                       ret
 10723                                  ENDP
 10724                                  
 10725                                  allocmem: PROC
 10726                                  
 10727                                  ;-988   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10728                                  
 10729                                  ;Function : allocmem, Number of local variables: 3
 10730                                  ;   # type sign width addr used name   list of local variables
 10731                                  ;  200 var unsg word   987 NULL i = bp+4
 10732                                  ;  201 var unsg word   987 NULL vAX = bp-2
 10733                                  ;  202 var unsg word   987 NULL vBX = bp-4;
 10734 00005313 C8040000                 ENTER  4,0
 10735 00005317 B80000                   mov ax, 0
 10736 0000531A A3[6E00]                 mov word [DOS_ERR], ax
 10737 0000531D 8B5E04                   mov  bx, [bp+4]
 10738 00005320 B80048                   mov  ax, 18432
 10739 00005323 E8A7AD                   call DosInt
 10740 00005326 8946FE                  mov [bp-2], ax
 10741 00005329 895EFC                  mov [bp-4], bx
 10742                                  
 10743                                  ;-989   if(DOS_ERR) return vBX;   return vAX;
 10744                                  
 10745 0000532C A1[6E00]                 mov ax, [DOS_ERR]
 10746 0000532F 08C0                     or  al, al
 10747 00005331 0F840600                 je .allocmem588
 10748 00005335 8B46FC                   mov ax, [bp-4]
 10749 00005338 E90600                   jmp .retnallocmem
 10750                                  .allocmem588:
 10751 0000533B 8B46FE                   mov ax, [bp-2]
 10752 0000533E E90000                   jmp .retnallocmem
 10753                                  
 10754                                  ;-990 }
 10755                                  
 10756                                  
 10757                                  ;-991 int copyF(char *dest, char *src, unsigned int sz) {
 10758                                  
 10759 00005341 C9                       .retnallocmem: LEAVE
 10760 00005342 C3                       ret
 10761                                  ENDP
 10762                                  
 10763                                  copyF: PROC
 10764                                  
 10765                                  ;-992   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10766                                  
 10767                                  ;Function : copyF, Number of local variables: 3
 10768                                  ;   # type sign width addr used name   list of local variables
 10769                                  ;  200 ptr sign byte   991 NULL dest = bp+4
 10770                                  ;  201 ptr sign byte   991 NULL src = bp+6
 10771                                  ;  202 var unsg word   991 NULL sz = bp+8;
 10772 00005343 C8000000                 ENTER  0,0
 10773 00005347 A1[6400]                 mov ax, [segE]
 10774 0000534A 8EC0                     mov  es, ax
 10775 0000534C 8B7606                   mov  si, [bp+6]
 10776 0000534F 8B7E04                   mov  di, [bp+4]
 10777 00005352 8B4E08                   mov  cx, [bp+8]
 10778                                  
 10779                                  ;-993   asm cld
 10780                                  
 10781 00005355 FC                       cld
 10782                                  
 10783                                  ;-994   asm rep movsb
 10784                                  
 10785 00005356 F3A4                     rep movsb
 10786                                  
 10787                                  ;-995   asm mov byte [es:di], 0
 10788                                  
 10789 00005358 26C60500                 mov byte [es:di], 0
 10790                                  
 10791                                  ;-996 }
 10792                                  
 10793                                  
 10794                                  ;-997 int to_far(char *dest, char *src) {
 10795 0000535C C9                       LEAVE
 10796 0000535D C3                       ret
 10797                                  ENDP
 10798                                  
 10799                                  to_far: PROC
 10800                                  
 10801                                  ;-998   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10802                                  
 10803                                  ;Function : to_far, Number of local variables: 2
 10804                                  ;   # type sign width addr used name   list of local variables
 10805                                  ;  200 ptr sign byte   997 NULL dest = bp+4
 10806                                  ;  201 ptr sign byte   997 NULL src = bp+6;
 10807 0000535E C8000000                 ENTER  0,0
 10808 00005362 A1[6400]                 mov ax, [segE]
 10809 00005365 8EC0                     mov  es, ax
 10810 00005367 8B7606                   mov  si, [bp+6]
 10811 0000536A 8B7E04                   mov  di, [bp+4]
 10812                                  
 10813                                  ;-999   asm cld
 10814                                  
 10815 0000536D FC                       cld
 10816                                  
 10817                                  ;-1000   do{
 10818                                  
 10819                                  .to_far589:
 10820                                  
 10821                                  ;-1001   asm lodsb  ; inc si
 10822                                  
 10823 0000536E AC                       lodsb  ; inc si
 10824                                  
 10825                                  ;-1002   asm stosb  ; inc di
 10826                                  
 10827 0000536F AA                       stosb  ; inc di
 10828                                  
 10829                                  ;-1003   } while (al != 0);
 10830                                  
 10831 00005370 3C00                     cmp  al, 0
 10832 00005372 0F840200                 je  .to_far590
 10833 00005376 EBF6                     jmp .to_far589
 10834                                  .to_far590:
 10835                                  
 10836                                  ;-1004 }
 10837                                  
 10838                                  
 10839                                  ;-1005 int from_far(char *dest, char *src) {
 10840 00005378 C9                       LEAVE
 10841 00005379 C3                       ret
 10842                                  ENDP
 10843                                  
 10844                                  from_far: PROC
 10845                                  
 10846                                  ;-1006   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10847                                  
 10848                                  ;Function : from_far, Number of local variables: 2
 10849                                  ;   # type sign width addr used name   list of local variables
 10850                                  ;  200 ptr sign byte  1005 NULL dest = bp+4
 10851                                  ;  201 ptr sign byte  1005 NULL src = bp+6;
 10852 0000537A C8000000                 ENTER  0,0
 10853 0000537E A1[6400]                 mov ax, [segE]
 10854 00005381 8EC0                     mov  es, ax
 10855 00005383 8B7606                   mov  si, [bp+6]
 10856 00005386 8B7E04                   mov  di, [bp+4]
 10857                                  
 10858                                  ;-1007   do{
 10859                                  
 10860                                  .from_far591:
 10861                                  
 10862                                  ;-1008   asm mov al, [es:si]
 10863                                  
 10864 00005389 268A04                   mov al, [es:si]
 10865                                  
 10866                                  ;-1009   asm inc si
 10867                                  
 10868 0000538C 46                       inc si
 10869                                  
 10870                                  ;-1010   asm mov [di], al
 10871                                  
 10872 0000538D 8805                     mov [di], al
 10873                                  
 10874                                  ;-1011   asm inc di
 10875                                  
 10876 0000538F 47                       inc di
 10877                                  
 10878                                  ;-1012   } while (al != 0);
 10879                                  
 10880 00005390 3C00                     cmp  al, 0
 10881 00005392 0F840200                 je  .from_far592
 10882 00005396 EBF1                     jmp .from_far591
 10883                                  .from_far592:
 10884                                  
 10885                                  ;-1013 }
 10886 00005398 C9                       LEAVE
 10887 00005399 C3                       ret
 10888                                  ENDP
 10889                                   
 10890                                  ; missing functions: 
 10891                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10892 0000539A E80000                  LastFunctionByt:db 0E8h, 0, 0
 10893 0000539D 58                      pop ax
 10894 0000539E C3                      ret
 10895                                   
 10896                                  ;   # type sign width  adr used name   list of global variables
 10897                                  
 10898                                  ;    1 arr sign byte     2    2 Version1[10]
 10899                                  ;    2 def unsg byte     3    - LSTART=200
 10900                                  ;    3 def unsg byte     4    - VARMAX=300
 10901                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10902                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10903                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10904                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10905                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10906                                  ;    9 def unsg byte    11    - T_NAME=256
 10907                                  ;   10 def unsg byte    12    - T_CONST=257
 10908                                  ;   11 def unsg byte    13    - T_STRING=258
 10909                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10910                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10911                                  ;   14 def unsg byte    16    - T_RETURN=512
 10912                                  ;   15 def unsg byte    17    - T_IF=513
 10913                                  ;   16 def unsg byte    18    - T_ELSE=514
 10914                                  ;   17 def unsg byte    19    - T_WHILE=515
 10915                                  ;   18 def unsg byte    20    - T_DO=516
 10916                                  ;   19 def unsg byte    21    - T_INT=517
 10917                                  ;   20 def unsg byte    22    - T_ASM=518
 10918                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10919                                  ;   22 def unsg byte    24    - T_EMIT=520
 10920                                  ;   23 def unsg byte    25    - T_GOTO=521
 10921                                  ;   24 def unsg byte    26    - T_VOID=529
 10922                                  ;   25 def unsg byte    27    - T_CHAR=530
 10923                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10924                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10925                                  ;   28 def unsg byte    30    - T_LONG=533
 10926                                  ;   29 def unsg byte    31    - T_EQ=806
 10927                                  ;   30 def unsg byte    32    - T_NE=807
 10928                                  ;   31 def unsg byte    33    - T_GE=811
 10929                                  ;   32 def unsg byte    34    - T_LE=824
 10930                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10931                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10932                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10933                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10934                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10935                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10936                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10937                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10938                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10939                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10940                                  ;   43 def unsg byte    45    - COMAX=3000
 10941                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10942                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10943                                  ;   46 var unsg word    47   10 orgData
 10944                                  ;   47 arr sign byte    48    4 co[3000]
 10945                                  ;   48 var sign word    48    4 maxco
 10946                                  ;   49 var sign word    48    3 maxco1
 10947                                  ;   50 arr sign byte    49    2 coname[67]
 10948                                  ;   51 ptr sign byte    49    5 cloc
 10949                                  ;   52 var sign word    50    6 fdin
 10950                                  ;   53 var sign word    50    4 fdout
 10951                                  ;   54 arr sign byte    50  104 symbol[128]
 10952                                  ;   55 arr sign byte    51   12 fname[67]
 10953                                  ;   56 arr sign byte    51   10 namein[67]
 10954                                  ;   57 arr sign byte    52    7 namelst[67]
 10955                                  ;   58 arr sign byte    52    2 archivename[67]
 10956                                  ;   59 var sign word    53   41 token
 10957                                  ;   60 var sign byte    53    2 globC
 10958                                  ;   61 var sign word    53    3 spalte
 10959                                  ;   62 var sign byte    54   29 thechar
 10960                                  ;   63 var sign word    54    9 iscmp
 10961                                  ;   64 var sign word    54    4 nconst
 10962                                  ;   65 var sign word    55    3 nreturn
 10963                                  ;   66 var sign word    55   12 nlabel
 10964                                  ;   67 var sign word    56   24 GTop
 10965                                  ;   68 var sign word    56   20 LTop
 10966                                  ;   69 var unsg word    57   44 lexval
 10967                                  ;   70 var sign word    58    6 typei
 10968                                  ;   71 var sign byte    58    8 istype
 10969                                  ;   72 arr sign byte    58   11 GType[300]
 10970                                  ;   73 var sign word    59    6 signi
 10971                                  ;   74 var sign byte    59    5 issign
 10972                                  ;   75 arr sign byte    59    5 GSign[300]
 10973                                  ;   76 var sign word    60    9 widthi
 10974                                  ;   77 var sign byte    60   19 iswidth
 10975                                  ;   78 arr sign byte    60    5 GWidth[300]
 10976                                  ;   79 arr sign word    61    4 GAdr[300]
 10977                                  ;   80 arr sign word    61    6 GUsed[300]
 10978                                  ;   81 var sign word    62   26 wi
 10979                                  ;   82 arr sign word    62   11 GData[300]
 10980                                  ;   83 arr sign byte    62    2 GNameField[4800]
 10981                                  ;   84 var sign word    63   13 FTop
 10982                                  ;   85 var sign word    63    8 CTop
 10983                                  ;   86 arr sign byte    64    2 FType[300]
 10984                                  ;   87 arr sign byte    64    3 CType[2000]
 10985                                  ;   88 arr sign word    65    2 FAdr[300]
 10986                                  ;   89 arr sign word    65    4 CAdr[2000]
 10987                                  ;   90 arr sign word    66    4 FCalls[300]
 10988                                  ;   91 arr sign byte    67    5 FNameField[4800]
 10989                                  ;   92 arr sign byte    68    7 NameA[32]
 10990                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 10991                                  ;   94 ptr unsg byte    69    8 CNameTop
 10992                                  ;   95 ptr unsg byte    70   10 fgetsp
 10993                                  ;   96 var unsg word    70    4 segE
 10994                                  ;   97 var unsg word    71   12 lineno
 10995                                  ;   98 var unsg word    71    2 linenoinclude
 10996                                  ;   99 ptr unsg byte    72   17 pt
 10997                                  ;  100 ptr unsg byte    72    8 p1
 10998                                  ;  101 var sign word    73    9 DOS_ERR
 10999                                  ;  102 var sign word    73    5 DOS_NoBytes
 11000                                  ;  103 var sign byte    73    3 DOS_ByteRead
 11001                                  ;  104 arr sign byte   131    2 doglobName[15]
 11002                                  ;  105 var sign word   297    5 mod1
 11003                                  ;  106 var sign word   297   12 ireg1
 11004                                  ;  107 var sign word   297    6 idx1
 11005                                  ;  108 var sign word   297    1 ids1
 11006                                  ;  109 var sign word   297    4 idw1
 11007                                  ;  110 var sign word   297    2 idt1
 11008                                  ;  111 var sign word   297 NULL val1
 11009                                  ;  112 var sign word   298    2 mod2
 11010                                  ;  113 var sign word   298    6 ireg2
 11011                                  ;  114 var sign word   298    6 idx2
 11012                                  ;  115 var sign word   298    1 ids2
 11013                                  ;  116 var sign word   298    4 idw2
 11014                                  ;  117 var sign word   298    2 idt2
 11015                                  ;  118 var sign word   298    2 val2
 11016                                  ;  119 arr sign byte   363    9 ops[5]
 11017                                  ;  120 arr sign byte   405    3 printregstr[74]
 11018                                  ;  121 var sign word   413    1 evalue
 11019                                  ;  122 var sign word   413    1 exprtype
 11020                                  ;  123 arr sign word   565    2 docalltype[10]
 11021                                  ;  124 arr sign word   565    2 docallvalue[10]
 11022                                  ;  125 arr sign byte   566    2 procname[17]
 11023                                  ;  126 ptr sign byte   621    1 arglen
 11024                                  ;  127 ptr sign byte   621    2 argv
 11025                                  ;  128 arr sign byte   762    2 symboltemp[80]
 11026                                  ;  129 var unsg word   952    1 MAXUI
 11027                                  
 11028                                  
 11029                                  ;   # Calls Line Width  Name   list of functions
 11030                                  
 11031                                  ;    0    4   75   writetty
 11032                                  ;    1    1   76   putch
 11033                                  ;    2    6   77   cputs
 11034                                  ;    3    3   78   mkneg
 11035                                  ;    4    8   80   DosInt
 11036                                  ;    5    2   85   openR
 11037                                  ;    6    1   86   creatR
 11038                                  ;    7    2   87   fcloseR
 11039                                  ;    8    3   88   exitR
 11040                                  ;    9    2   89   readRL
 11041                                  ;   10    1   90   fputcR
 11042                                  ;   11    8   93   strlen
 11043                                  ;   12   24   94   strcpy
 11044                                  ;   13   74   95   eqstr
 11045                                  ;   14    2   98   instr1
 11046                                  ;   15    1   99   strcat1
 11047                                  ;   16    1  100   toupper
 11048                                  ;   17    3  102   digit
 11049                                  ;   18    1  107   letter
 11050                                  ;   19    3  117   alnum
 11051                                  ;   20    4  122   a
 11052                                  ;   21   21  123   v
 11053                                  ;   22    4  128   checknamelen
 11054                                  ;   23    1  132   doglob
 11055                                  ;   24   12  181   gettypes
 11056                                  ;   25    9  190   adrofname
 11057                                  ;   26    7  191   adrF
 11058                                  ;   27    4  193   printName
 11059                                  ;   28   12  197   searchname
 11060                                  ;   29    3  201   checkName
 11061                                  ;   30   10  206   typeName
 11062                                  ;   31    3  222   name1
 11063                                  ;   32    1  227   storecall
 11064                                  ;   33    2  233   storefunc
 11065                                  ;   34    2  237   addlocal
 11066                                  ;   35    1  243   checkFunction
 11067                                  ;   36    1  246   dofunc
 11068                                  ;   37    1  287   isvariable
 11069                                  ;   38    3  300   pexpr
 11070                                  ;   39    1  307   constantexpr
 11071                                  ;   40    3  317   exprstart
 11072                                  ;   41    1  319   expr2
 11073                                  ;   42    3  364   doreg1
 11074                                  ;   43    6  383   checkreg
 11075                                  ;   44    6  408   printreg
 11076                                  ;   45    2  414   expr
 11077                                  ;   46    4  463   compoundass
 11078                                  ;   47    2  470   dovar1
 11079                                  ;   48    8  491   rterm
 11080                                  ;   49    1  504   isreg
 11081                                  ;   50   15  522   doreg
 11082                                  ;   51    1  528   doassign
 11083                                  ;   52    1  546   domul
 11084                                  ;   53    2  550   doidiv
 11085                                  ;   54    1  563   domod
 11086                                  ;   55    1  567   docall1
 11087                                  ;   56 NULL  609   main
 11088                                  ;   57    2  620   getfirstchar
 11089                                  ;   58    1  622   getarg
 11090                                  ;   59    2  640   parse
 11091                                  ;   60    1  649   checkcalls
 11092                                  ;   61    1  666   doinclude
 11093                                  ;   62    1  677   dodefine
 11094                                  ;   63    6  693   stmt
 11095                                  ;   64    1  724   doemit
 11096                                  ;   65    3  728   cmpneg
 11097                                  ;   66    7  741   prlabel
 11098                                  ;   67    3  742   prjump
 11099                                  ;   68    1  743   doif
 11100                                  ;   69    1  749   dodo
 11101                                  ;   70    1  753   dowhile
 11102                                  ;   71    4  756   isrelational
 11103                                  ;   72   17  763   getlex
 11104                                  ;   73    1  815   convertdefine
 11105                                  ;   74    1  822   getdigit
 11106                                  ;   75    1  831   getstring
 11107                                  ;   76   32  834   next
 11108                                  ;   77   78  835   istoken
 11109                                  ;   78   36  836   expect
 11110                                  ;   79    6  839   eprc
 11111                                  ;   80    5  840   eprs
 11112                                  ;   81   41  841   prc
 11113                                  ;   82    3  846   prscomment
 11114                                  ;   83    8  848   prnl
 11115                                  ;   84  249  850   prs
 11116                                  ;   85    2  855   eprnum
 11117                                  ;   86    7  857   pint1
 11118                                  ;   87   35  859   prunsign1
 11119                                  ;   88   25  862   printint51
 11120                                  ;   89    2  866   fgets1
 11121                                  ;   90    1  870   printinputline
 11122                                  ;   91    1  878   ifEOL
 11123                                  ;   92    2  887   end1
 11124                                  ;   93   50  888   error1
 11125                                  ;   94    2  897   listproc
 11126                                  ;   95    2  905   listvar
 11127                                  ;   96    1  921   listcall
 11128                                  ;   97    1  924   calllisting
 11129                                  ;   98    1  930   countcalls
 11130                                  ;   99    1  938   listfunc
 11131                                  ;  100    1  942   funclisting
 11132                                  ;  101    1  953   epilog
 11133                                  ;  102    1  985   setblock
 11134                                  ;  103    1  987   allocmem
 11135                                  ;  104 NULL  991   copyF
 11136                                  ;  105    1  997   to_far
 11137                                  ;  106    3 1005   from_far
 11138                                  ;  107 NULL 1013   LastFunctionByt
 11139                                  
 11140                                  ;    #  addr name   list of CALLs
 11141                                  
 11142                                  ;    0     0 writetty
 11143                                  ;    1     9 writetty
 11144                                  ;    2    18 putch
 11145                                  ;    3    24 DosInt
 11146                                  ;    4    31 DosInt
 11147                                  ;    5    38 DosInt
 11148                                  ;    6    45 DosInt
 11149                                  ;    7    52 DosInt
 11150                                  ;    8    59 DosInt
 11151                                  ;    9    66 strcpy
 11152                                  ;   10    73 digit
 11153                                  ;   11    79 letter
 11154                                  ;   12    86 printName
 11155                                  ;   13    96 prc
 11156                                  ;   14   100 printName
 11157                                  ;   15   110 prc
 11158                                  ;   16   114 strlen
 11159                                  ;   17   121 error1
 11160                                  ;   18   128 error1
 11161                                  ;   19   135 error1
 11162                                  ;   20   142 checknamelen
 11163                                  ;   21   155 checkName
 11164                                  ;   22   165 error1
 11165                                  ;   23   172 istoken
 11166                                  ;   24   180 istoken
 11167                                  ;   25   188 prs
 11168                                  ;   26   192 prunsign1
 11169                                  ;   27   202 prs
 11170                                  ;   28   206 prs
 11171                                  ;   29   210 prs
 11172                                  ;   30   214 prs
 11173                                  ;   31   218 prs
 11174                                  ;   32   222 prunsign1
 11175                                  ;   33   232 prs
 11176                                  ;   34   236 expect
 11177                                  ;   35   243 expect
 11178                                  ;   36   250 error1
 11179                                  ;   37   257 prs
 11180                                  ;   38   261 prs
 11181                                  ;   39   265 prs
 11182                                  ;   40   269 strcpy
 11183                                  ;   41   276 expect
 11184                                  ;   42   283 istoken
 11185                                  ;   43   291 prc
 11186                                  ;   44   295 prscomment
 11187                                  ;   45   306 prc
 11188                                  ;   46   310 prs
 11189                                  ;   47   314 strlen
 11190                                  ;   48   321 istoken
 11191                                  ;   49   329 prc
 11192                                  ;   50   333 expect
 11193                                  ;   51   340 prunsign1
 11194                                  ;   52   350 istoken
 11195                                  ;   53   358 expect
 11196                                  ;   54   365 error1
 11197                                  ;   55   372 prs
 11198                                  ;   56   376 prs
 11199                                  ;   57   380 prs
 11200                                  ;   58   384 prs
 11201                                  ;   59   388 prs
 11202                                  ;   60   392 prs
 11203                                  ;   61   396 istoken
 11204                                  ;   62   404 prc
 11205                                  ;   63   408 istoken
 11206                                  ;   64   416 expect
 11207                                  ;   65   423 prunsign1
 11208                                  ;   66   433 prunsign1
 11209                                  ;   67   443 adrofname
 11210                                  ;   68   453 strcpy
 11211                                  ;   69   460 strcpy
 11212                                  ;   70   467 expect
 11213                                  ;   71   474 adrF
 11214                                  ;   72   479 adrofname
 11215                                  ;   73   489 prs
 11216                                  ;   74   493 prs
 11217                                  ;   75   497 prc
 11218                                  ;   76   501 pint1
 11219                                  ;   77   507 prc
 11220                                  ;   78   511 checkName
 11221                                  ;   79   521 error1
 11222                                  ;   80   528 adrofname
 11223                                  ;   81   538 eqstr
 11224                                  ;   82   544 adrofname
 11225                                  ;   83   554 eqstr
 11226                                  ;   84   560 istoken
 11227                                  ;   85   568 istoken
 11228                                  ;   86   576 istoken
 11229                                  ;   87   584 istoken
 11230                                  ;   88   592 istoken
 11231                                  ;   89   600 istoken
 11232                                  ;   90   608 istoken
 11233                                  ;   91   616 istoken
 11234                                  ;   92   624 name1
 11235                                  ;   93   630 error1
 11236                                  ;   94   637 getlex
 11237                                  ;   95   644 error1
 11238                                  ;   96   651 error1
 11239                                  ;   97   658 strlen
 11240                                  ;   98   665 to_far
 11241                                  ;   99   672 error1
 11242                                  ;  100   679 adrF
 11243                                  ;  101   684 strcpy
 11244                                  ;  102   691 error1
 11245                                  ;  103   698 checkName
 11246                                  ;  104   708 error1
 11247                                  ;  105   715 adrF
 11248                                  ;  106   720 strcpy
 11249                                  ;  107   727 adrF
 11250                                  ;  108   732 eqstr
 11251                                  ;  109   738 checknamelen
 11252                                  ;  110   751 strcpy
 11253                                  ;  111   758 checkFunction
 11254                                  ;  112   772 error1
 11255                                  ;  113   779 storefunc
 11256                                  ;  114   789 prs
 11257                                  ;  115   793 prs
 11258                                  ;  116   797 prs
 11259                                  ;  117   801 expect
 11260                                  ;  118   808 istoken
 11261                                  ;  119   816 typeName
 11262                                  ;  120   825 addlocal
 11263                                  ;  121   834 istoken
 11264                                  ;  122   842 expect
 11265                                  ;  123   849 expect
 11266                                  ;  124   856 isvariable
 11267                                  ;  125   867 typeName
 11268                                  ;  126   876 checknamelen
 11269                                  ;  127   889 addlocal
 11270                                  ;  128   898 istoken
 11271                                  ;  129   906 expect
 11272                                  ;  130   913 expect
 11273                                  ;  131   920 istoken
 11274                                  ;  132   928 expect
 11275                                  ;  133   935 listproc
 11276                                  ;  134   944 prs
 11277                                  ;  135   948 mkneg
 11278                                  ;  136   954 prunsign1
 11279                                  ;  137   964 prs
 11280                                  ;  138   968 istoken
 11281                                  ;  139   976 stmt
 11282                                  ;  140   981 prs
 11283                                  ;  141   985 prs
 11284                                  ;  142   989 prc
 11285                                  ;  143   993 prs
 11286                                  ;  144   997 prs
 11287                                  ;  145  1001 prs
 11288                                  ;  146  1005 strlen
 11289                                  ;  147  1012 strcpy
 11290                                  ;  148  1019 prs
 11291                                  ;  149  1023 expect
 11292                                  ;  150  1030 eqstr
 11293                                  ;  151  1036 constantexpr
 11294                                  ;  152  1049 checkreg
 11295                                  ;  153  1058 doreg1
 11296                                  ;  154  1065 exprstart
 11297                                  ;  155  1075 prs
 11298                                  ;  156  1079 prs
 11299                                  ;  157  1083 expect
 11300                                  ;  158  1090 getlex
 11301                                  ;  159  1097 typeName
 11302                                  ;  160  1106 searchname
 11303                                  ;  161  1117 gettypes
 11304                                  ;  162  1126 isrelational
 11305                                  ;  163  1139 error1
 11306                                  ;  164  1146 expect
 11307                                  ;  165  1153 prs
 11308                                  ;  166  1157 prs
 11309                                  ;  167  1161 gettypes
 11310                                  ;  168  1170 prs
 11311                                  ;  169  1174 prs
 11312                                  ;  170  1178 v
 11313                                  ;  171  1180 prs
 11314                                  ;  172  1184 prunsign1
 11315                                  ;  173  1194 cmpneg
 11316                                  ;  174  1201 prs
 11317                                  ;  175  1205 expect
 11318                                  ;  176  1212 eqstr
 11319                                  ;  177  1218 expr2
 11320                                  ;  178  1224 expr
 11321                                  ;  179  1229 getlex
 11322                                  ;  180  1236 typeName
 11323                                  ;  181  1245 error1
 11324                                  ;  182  1252 checkreg
 11325                                  ;  183  1261 doreg1
 11326                                  ;  184  1268 searchname
 11327                                  ;  185  1279 gettypes
 11328                                  ;  186  1288 error1
 11329                                  ;  187  1295 isrelational
 11330                                  ;  188  1308 error1
 11331                                  ;  189  1315 istoken
 11332                                  ;  190  1323 error1
 11333                                  ;  191  1330 istoken
 11334                                  ;  192  1338 prs
 11335                                  ;  193  1342 prs
 11336                                  ;  194  1346 prs
 11337                                  ;  195  1350 prs
 11338                                  ;  196  1354 prs
 11339                                  ;  197  1358 v
 11340                                  ;  198  1360 prs
 11341                                  ;  199  1364 prunsign1
 11342                                  ;  200  1374 adrofname
 11343                                  ;  201  1384 prs
 11344                                  ;  202  1388 prs
 11345                                  ;  203  1392 typeName
 11346                                  ;  204  1401 checkreg
 11347                                  ;  205  1410 prs
 11348                                  ;  206  1414 printreg
 11349                                  ;  207  1423 v
 11350                                  ;  208  1425 prs
 11351                                  ;  209  1429 printreg
 11352                                  ;  210  1438 error1
 11353                                  ;  211  1445 searchname
 11354                                  ;  212  1456 gettypes
 11355                                  ;  213  1465 error1
 11356                                  ;  214  1472 prs
 11357                                  ;  215  1476 printreg
 11358                                  ;  216  1485 error1
 11359                                  ;  217  1492 prs
 11360                                  ;  218  1496 a
 11361                                  ;  219  1498 prs
 11362                                  ;  220  1502 prs
 11363                                  ;  221  1506 prs
 11364                                  ;  222  1510 v
 11365                                  ;  223  1512 adrofname
 11366                                  ;  224  1522 prs
 11367                                  ;  225  1526 prs
 11368                                  ;  226  1530 error1
 11369                                  ;  227  1537 istoken
 11370                                  ;  228  1545 strcpy
 11371                                  ;  229  1552 istoken
 11372                                  ;  230  1560 strcpy
 11373                                  ;  231  1567 istoken
 11374                                  ;  232  1575 strcpy
 11375                                  ;  233  1582 istoken
 11376                                  ;  234  1590 strcpy
 11377                                  ;  235  1597 istoken
 11378                                  ;  236  1605 strcpy
 11379                                  ;  237  1612 istoken
 11380                                  ;  238  1620 strcpy
 11381                                  ;  239  1627 istoken
 11382                                  ;  240  1635 strcpy
 11383                                  ;  241  1642 getlex
 11384                                  ;  242  1649 isrelational
 11385                                  ;  243  1662 error1
 11386                                  ;  244  1669 strcpy
 11387                                  ;  245  1676 prnl
 11388                                  ;  246  1681 prs
 11389                                  ;  247  1685 prs
 11390                                  ;  248  1689 printreg
 11391                                  ;  249  1698 prs
 11392                                  ;  250  1702 istoken
 11393                                  ;  251  1710 prunsign1
 11394                                  ;  252  1720 typeName
 11395                                  ;  253  1729 checkreg
 11396                                  ;  254  1738 printreg
 11397                                  ;  255  1747 searchname
 11398                                  ;  256  1758 a
 11399                                  ;  257  1760 v
 11400                                  ;  258  1762 cmpneg
 11401                                  ;  259  1769 prs
 11402                                  ;  260  1773 expect
 11403                                  ;  261  1780 strlen
 11404                                  ;  262  1787 eqstr
 11405                                  ;  263  1793 eqstr
 11406                                  ;  264  1799 eqstr
 11407                                  ;  265  1805 eqstr
 11408                                  ;  266  1811 eqstr
 11409                                  ;  267  1817 eqstr
 11410                                  ;  268  1823 eqstr
 11411                                  ;  269  1829 eqstr
 11412                                  ;  270  1835 eqstr
 11413                                  ;  271  1841 eqstr
 11414                                  ;  272  1847 eqstr
 11415                                  ;  273  1853 eqstr
 11416                                  ;  274  1859 eqstr
 11417                                  ;  275  1865 eqstr
 11418                                  ;  276  1871 eqstr
 11419                                  ;  277  1877 eqstr
 11420                                  ;  278  1883 eqstr
 11421                                  ;  279  1889 eqstr
 11422                                  ;  280  1895 eqstr
 11423                                  ;  281  1901 eqstr
 11424                                  ;  282  1907 eqstr
 11425                                  ;  283  1913 eqstr
 11426                                  ;  284  1919 strlen
 11427                                  ;  285  1926 eqstr
 11428                                  ;  286  1932 eqstr
 11429                                  ;  287  1938 eqstr
 11430                                  ;  288  1944 eqstr
 11431                                  ;  289  1950 eqstr
 11432                                  ;  290  1956 eqstr
 11433                                  ;  291  1962 eqstr
 11434                                  ;  292  1968 eqstr
 11435                                  ;  293  1974 eqstr
 11436                                  ;  294  1980 prc
 11437                                  ;  295  1984 prc
 11438                                  ;  296  1988 prc
 11439                                  ;  297  1992 istoken
 11440                                  ;  298  2000 prs
 11441                                  ;  299  2004 prunsign1
 11442                                  ;  300  2014 typeName
 11443                                  ;  301  2023 checkreg
 11444                                  ;  302  2032 doreg1
 11445                                  ;  303  2039 docall1
 11446                                  ;  304  2047 isreg
 11447                                  ;  305  2053 searchname
 11448                                  ;  306  2064 gettypes
 11449                                  ;  307  2073 istoken
 11450                                  ;  308  2081 istoken
 11451                                  ;  309  2089 expect
 11452                                  ;  310  2096 searchname
 11453                                  ;  311  2107 expect
 11454                                  ;  312  2114 expect
 11455                                  ;  313  2121 gettypes
 11456                                  ;  314  2130 error1
 11457                                  ;  315  2137 istoken
 11458                                  ;  316  2145 error1
 11459                                  ;  317  2152 prs
 11460                                  ;  318  2156 prs
 11461                                  ;  319  2160 prs
 11462                                  ;  320  2164 v
 11463                                  ;  321  2166 istoken
 11464                                  ;  322  2174 error1
 11465                                  ;  323  2181 prs
 11466                                  ;  324  2185 prs
 11467                                  ;  325  2189 prs
 11468                                  ;  326  2193 v
 11469                                  ;  327  2195 istoken
 11470                                  ;  328  2203 compoundass
 11471                                  ;  329  2215 istoken
 11472                                  ;  330  2223 compoundass
 11473                                  ;  331  2235 istoken
 11474                                  ;  332  2243 compoundass
 11475                                  ;  333  2255 istoken
 11476                                  ;  334  2263 compoundass
 11477                                  ;  335  2275 istoken
 11478                                  ;  336  2283 error1
 11479                                  ;  337  2290 istoken
 11480                                  ;  338  2298 error1
 11481                                  ;  339  2305 istoken
 11482                                  ;  340  2313 expr
 11483                                  ;  341  2318 doassign
 11484                                  ;  342  2327 dovar1
 11485                                  ;  343  2334 istoken
 11486                                  ;  344  2342 rterm
 11487                                  ;  345  2348 istoken
 11488                                  ;  346  2356 rterm
 11489                                  ;  347  2362 istoken
 11490                                  ;  348  2370 rterm
 11491                                  ;  349  2376 istoken
 11492                                  ;  350  2384 rterm
 11493                                  ;  351  2390 istoken
 11494                                  ;  352  2398 rterm
 11495                                  ;  353  2404 istoken
 11496                                  ;  354  2412 rterm
 11497                                  ;  355  2418 istoken
 11498                                  ;  356  2426 domul
 11499                                  ;  357  2432 istoken
 11500                                  ;  358  2440 doidiv
 11501                                  ;  359  2447 istoken
 11502                                  ;  360  2455 domod
 11503                                  ;  361  2461 isrelational
 11504                                  ;  362  2474 rterm
 11505                                  ;  363  2480 cmpneg
 11506                                  ;  364  2487 error1
 11507                                  ;  365  2494 prnl
 11508                                  ;  366  2499 prs
 11509                                  ;  367  2503 prs
 11510                                  ;  368  2507 gettypes
 11511                                  ;  369  2516 prs
 11512                                  ;  370  2520 prs
 11513                                  ;  371  2524 v
 11514                                  ;  372  2526 prs
 11515                                  ;  373  2530 expect
 11516                                  ;  374  2537 prunsign1
 11517                                  ;  375  2547 gettypes
 11518                                  ;  376  2556 prs
 11519                                  ;  377  2560 v
 11520                                  ;  378  2562 prnl
 11521                                  ;  379  2567 prs
 11522                                  ;  380  2571 prs
 11523                                  ;  381  2575 prs
 11524                                  ;  382  2579 prnl
 11525                                  ;  383  2584 prs
 11526                                  ;  384  2588 prs
 11527                                  ;  385  2592 a
 11528                                  ;  386  2594 prs
 11529                                  ;  387  2598 v
 11530                                  ;  388  2600 prs
 11531                                  ;  389  2604 prs
 11532                                  ;  390  2608 prs
 11533                                  ;  391  2612 prs
 11534                                  ;  392  2616 prs
 11535                                  ;  393  2620 prc
 11536                                  ;  394  2624 printName
 11537                                  ;  395  2634 prs
 11538                                  ;  396  2638 prnl
 11539                                  ;  397  2643 prs
 11540                                  ;  398  2647 prs
 11541                                  ;  399  2651 prs
 11542                                  ;  400  2655 prs
 11543                                  ;  401  2659 v
 11544                                  ;  402  2661 istoken
 11545                                  ;  403  2669 prnl
 11546                                  ;  404  2674 prs
 11547                                  ;  405  2678 prs
 11548                                  ;  406  2682 prs
 11549                                  ;  407  2686 prs
 11550                                  ;  408  2690 prunsign1
 11551                                  ;  409  2700 typeName
 11552                                  ;  410  2709 searchname
 11553                                  ;  411  2720 istoken
 11554                                  ;  412  2728 searchname
 11555                                  ;  413  2739 expect
 11556                                  ;  414  2746 expect
 11557                                  ;  415  2753 gettypes
 11558                                  ;  416  2762 error1
 11559                                  ;  417  2769 eqstr
 11560                                  ;  418  2775 dovar1
 11561                                  ;  419  2782 eqstr
 11562                                  ;  420  2788 doreg
 11563                                  ;  421  2794 eqstr
 11564                                  ;  422  2800 doreg
 11565                                  ;  423  2806 eqstr
 11566                                  ;  424  2812 doreg
 11567                                  ;  425  2818 eqstr
 11568                                  ;  426  2824 doreg
 11569                                  ;  427  2830 eqstr
 11570                                  ;  428  2836 doreg
 11571                                  ;  429  2842 eqstr
 11572                                  ;  430  2848 doreg
 11573                                  ;  431  2854 eqstr
 11574                                  ;  432  2860 doreg
 11575                                  ;  433  2866 eqstr
 11576                                  ;  434  2872 doreg
 11577                                  ;  435  2878 eqstr
 11578                                  ;  436  2884 doreg
 11579                                  ;  437  2890 eqstr
 11580                                  ;  438  2896 doreg
 11581                                  ;  439  2902 eqstr
 11582                                  ;  440  2908 doreg
 11583                                  ;  441  2914 eqstr
 11584                                  ;  442  2920 doreg
 11585                                  ;  443  2926 eqstr
 11586                                  ;  444  2932 doreg
 11587                                  ;  445  2938 eqstr
 11588                                  ;  446  2944 doreg
 11589                                  ;  447  2950 eqstr
 11590                                  ;  448  2956 doreg
 11591                                  ;  449  2962 expect
 11592                                  ;  450  2969 prs
 11593                                  ;  451  2973 prs
 11594                                  ;  452  2977 prs
 11595                                  ;  453  2981 istoken
 11596                                  ;  454  2989 prunsign1
 11597                                  ;  455  2999 istoken
 11598                                  ;  456  3007 searchname
 11599                                  ;  457  3018 v
 11600                                  ;  458  3020 error1
 11601                                  ;  459  3027 gettypes
 11602                                  ;  460  3036 prs
 11603                                  ;  461  3040 v
 11604                                  ;  462  3042 prs
 11605                                  ;  463  3046 prs
 11606                                  ;  464  3050 prs
 11607                                  ;  465  3054 a
 11608                                  ;  466  3056 prs
 11609                                  ;  467  3060 prs
 11610                                  ;  468  3064 prunsign1
 11611                                  ;  469  3074 v
 11612                                  ;  470  3076 prs
 11613                                  ;  471  3080 prs
 11614                                  ;  472  3084 printName
 11615                                  ;  473  3094 prs
 11616                                  ;  474  3098 prs
 11617                                  ;  475  3102 prs
 11618                                  ;  476  3106 prs
 11619                                  ;  477  3110 v
 11620                                  ;  478  3112 prs
 11621                                  ;  479  3116 prs
 11622                                  ;  480  3120 prs
 11623                                  ;  481  3124 v
 11624                                  ;  482  3126 prs
 11625                                  ;  483  3130 prs
 11626                                  ;  484  3134 prs
 11627                                  ;  485  3138 v
 11628                                  ;  486  3140 prs
 11629                                  ;  487  3144 rterm
 11630                                  ;  488  3150 istoken
 11631                                  ;  489  3158 prs
 11632                                  ;  490  3162 prunsign1
 11633                                  ;  491  3172 prs
 11634                                  ;  492  3176 error1
 11635                                  ;  493  3183 istoken
 11636                                  ;  494  3191 prs
 11637                                  ;  495  3195 prunsign1
 11638                                  ;  496  3205 prs
 11639                                  ;  497  3209 prs
 11640                                  ;  498  3213 typeName
 11641                                  ;  499  3222 searchname
 11642                                  ;  500  3233 error1
 11643                                  ;  501  3240 gettypes
 11644                                  ;  502  3249 error1
 11645                                  ;  503  3256 error1
 11646                                  ;  504  3263 prs
 11647                                  ;  505  3267 v
 11648                                  ;  506  3269 prs
 11649                                  ;  507  3273 prs
 11650                                  ;  508  3277 doidiv
 11651                                  ;  509  3284 prs
 11652                                  ;  510  3288 checknamelen
 11653                                  ;  511  3301 strcpy
 11654                                  ;  512  3308 storecall
 11655                                  ;  513  3318 expect
 11656                                  ;  514  3325 istoken
 11657                                  ;  515  3333 error1
 11658                                  ;  516  3340 istoken
 11659                                  ;  517  3348 istoken
 11660                                  ;  518  3356 eprs
 11661                                  ;  519  3361 eprs
 11662                                  ;  520  3366 eprc
 11663                                  ;  521  3371 eprnum
 11664                                  ;  522  3378 eprs
 11665                                  ;  523  3383 eprc
 11666                                  ;  524  3388 eprs
 11667                                  ;  525  3393 eprc
 11668                                  ;  526  3398 eprs
 11669                                  ;  527  3403 istoken
 11670                                  ;  528  3411 name1
 11671                                  ;  529  3417 searchname
 11672                                  ;  530  3428 istoken
 11673                                  ;  531  3436 checkreg
 11674                                  ;  532  3445 searchname
 11675                                  ;  533  3456 error1
 11676                                  ;  534  3463 istoken
 11677                                  ;  535  3471 expect
 11678                                  ;  536  3478 prs
 11679                                  ;  537  3482 prunsign1
 11680                                  ;  538  3492 prs
 11681                                  ;  539  3496 prs
 11682                                  ;  540  3500 prc
 11683                                  ;  541  3504 prunsign1
 11684                                  ;  542  3514 prs
 11685                                  ;  543  3518 v
 11686                                  ;  544  3520 prs
 11687                                  ;  545  3524 gettypes
 11688                                  ;  546  3533 prs
 11689                                  ;  547  3537 v
 11690                                  ;  548  3539 prs
 11691                                  ;  549  3543 v
 11692                                  ;  550  3545 prs
 11693                                  ;  551  3549 prs
 11694                                  ;  552  3553 printreg
 11695                                  ;  553  3562 prs
 11696                                  ;  554  3566 prs
 11697                                  ;  555  3570 prs
 11698                                  ;  556  3574 prunsign1
 11699                                  ;  557  3584 getarg
 11700                                  ;  558  3591 setblock
 11701                                  ;  559  3600 error1
 11702                                  ;  560  3607 allocmem
 11703                                  ;  561  3616 error1
 11704                                  ;  562  3623 getfirstchar
 11705                                  ;  563  3636 parse
 11706                                  ;  564  3642 checkcalls
 11707                                  ;  565  3653 epilog
 11708                                  ;  566  3660 fgets1
 11709                                  ;  567  3667 cputs
 11710                                  ;  568  3673 cputs
 11711                                  ;  569  3679 readRL
 11712                                  ;  570  3686 prnl
 11713                                  ;  571  3691 strcpy
 11714                                  ;  572  3698 instr1
 11715                                  ;  573  3705 strcat1
 11716                                  ;  574  3713 toupper
 11717                                  ;  575  3721 strcpy
 11718                                  ;  576  3728 strlen
 11719                                  ;  577  3735 openR
 11720                                  ;  578  3741 cputs
 11721                                  ;  579  3747 cputs
 11722                                  ;  580  3753 exitR
 11723                                  ;  581  3759 creatR
 11724                                  ;  582  3766 cputs
 11725                                  ;  583  3772 cputs
 11726                                  ;  584  3778 exitR
 11727                                  ;  585  3784 prs
 11728                                  ;  586  3788 prs
 11729                                  ;  587  3792 prs
 11730                                  ;  588  3796 prs
 11731                                  ;  589  3800 prs
 11732                                  ;  590  3804 prs
 11733                                  ;  591  3808 prs
 11734                                  ;  592  3812 getlex
 11735                                  ;  593  3819 istoken
 11736                                  ;  594  3827 istoken
 11737                                  ;  595  3835 dodefine
 11738                                  ;  596  3844 istoken
 11739                                  ;  597  3852 doinclude
 11740                                  ;  598  3862 error1
 11741                                  ;  599  3869 typeName
 11742                                  ;  600  3878 dofunc
 11743                                  ;  601  3885 doglob
 11744                                  ;  602  3892 prs
 11745                                  ;  603  3896 from_far
 11746                                  ;  604  3905 adrF
 11747                                  ;  605  3910 eqstr
 11748                                  ;  606  3916 prs
 11749                                  ;  607  3920 prs
 11750                                  ;  608  3924 prs
 11751                                  ;  609  3928 printint51
 11752                                  ;  610  3939 error1
 11753                                  ;  611  3946 prs
 11754                                  ;  612  3950 prs
 11755                                  ;  613  3954 prs
 11756                                  ;  614  3958 openR
 11757                                  ;  615  3964 prs
 11758                                  ;  616  3968 prs
 11759                                  ;  617  3972 error1
 11760                                  ;  618  3979 parse
 11761                                  ;  619  3985 prs
 11762                                  ;  620  3989 prs
 11763                                  ;  621  3993 getfirstchar
 11764                                  ;  622  4006 getlex
 11765                                  ;  623  4013 eqstr
 11766                                  ;  624  4019 getlex
 11767                                  ;  625  4026 eqstr
 11768                                  ;  626  4032 getlex
 11769                                  ;  627  4039 prs
 11770                                  ;  628  4043 strcpy
 11771                                  ;  629  4050 prs
 11772                                  ;  630  4054 error1
 11773                                  ;  631  4061 getlex
 11774                                  ;  632  4068 expect
 11775                                  ;  633  4075 error1
 11776                                  ;  634  4082 strlen
 11777                                  ;  635  4089 error1
 11778                                  ;  636  4096 adrofname
 11779                                  ;  637  4106 strcpy
 11780                                  ;  638  4113 expect
 11781                                  ;  639  4120 istoken
 11782                                  ;  640  4128 istoken
 11783                                  ;  641  4136 stmt
 11784                                  ;  642  4141 istoken
 11785                                  ;  643  4149 doif
 11786                                  ;  644  4154 istoken
 11787                                  ;  645  4162 dodo
 11788                                  ;  646  4167 istoken
 11789                                  ;  647  4175 dowhile
 11790                                  ;  648  4183 istoken
 11791                                  ;  649  4191 prs
 11792                                  ;  650  4195 name1
 11793                                  ;  651  4201 prs
 11794                                  ;  652  4205 expect
 11795                                  ;  653  4212 prs
 11796                                  ;  654  4216 next
 11797                                  ;  655  4221 prc
 11798                                  ;  656  4225 next
 11799                                  ;  657  4230 getlex
 11800                                  ;  658  4237 istoken
 11801                                  ;  659  4245 prs
 11802                                  ;  660  4249 next
 11803                                  ;  661  4254 prc
 11804                                  ;  662  4258 next
 11805                                  ;  663  4263 getlex
 11806                                  ;  664  4270 error1
 11807                                  ;  665  4277 istoken
 11808                                  ;  666  4285 doemit
 11809                                  ;  667  4292 istoken
 11810                                  ;  668  4300 istoken
 11811                                  ;  669  4308 exprstart
 11812                                  ;  670  4318 prs
 11813                                  ;  671  4322 prs
 11814                                  ;  672  4326 expect
 11815                                  ;  673  4333 prs
 11816                                  ;  674  4337 prs
 11817                                  ;  675  4341 prc
 11818                                  ;  676  4345 expect
 11819                                  ;  677  4352 expect
 11820                                  ;  678  4359 exprstart
 11821                                  ;  679  4369 expect
 11822                                  ;  680  4376 prs
 11823                                  ;  681  4380 getlex
 11824                                  ;  682  4387 prunsign1
 11825                                  ;  683  4397 getlex
 11826                                  ;  684  4404 prc
 11827                                  ;  685  4408 expect
 11828                                  ;  686  4415 prs
 11829                                  ;  687  4419 prs
 11830                                  ;  688  4423 prs
 11831                                  ;  689  4427 prs
 11832                                  ;  690  4431 prs
 11833                                  ;  691  4435 prunsign1
 11834                                  ;  692  4445 prs
 11835                                  ;  693  4449 prs
 11836                                  ;  694  4453 prunsign1
 11837                                  ;  695  4463 prs
 11838                                  ;  696  4467 prs
 11839                                  ;  697  4471 prs
 11840                                  ;  698  4475 error1
 11841                                  ;  699  4482 prs
 11842                                  ;  700  4486 prs
 11843                                  ;  701  4490 prunsign1
 11844                                  ;  702  4500 prc
 11845                                  ;  703  4504 prs
 11846                                  ;  704  4508 prs
 11847                                  ;  705  4512 prunsign1
 11848                                  ;  706  4522 pexpr
 11849                                  ;  707  4528 pint1
 11850                                  ;  708  4534 stmt
 11851                                  ;  709  4539 istoken
 11852                                  ;  710  4547 prjump
 11853                                  ;  711  4554 prlabel
 11854                                  ;  712  4562 stmt
 11855                                  ;  713  4567 prlabel
 11856                                  ;  714  4575 prlabel
 11857                                  ;  715  4583 prlabel
 11858                                  ;  716  4591 stmt
 11859                                  ;  717  4596 expect
 11860                                  ;  718  4603 pexpr
 11861                                  ;  719  4609 pint1
 11862                                  ;  720  4615 prjump
 11863                                  ;  721  4622 prlabel
 11864                                  ;  722  4630 prlabel
 11865                                  ;  723  4638 pexpr
 11866                                  ;  724  4644 pint1
 11867                                  ;  725  4650 stmt
 11868                                  ;  726  4655 prjump
 11869                                  ;  727  4662 prlabel
 11870                                  ;  728  4670 getlex
 11871                                  ;  729  4677 next
 11872                                  ;  730  4682 next
 11873                                  ;  731  4687 next
 11874                                  ;  732  4692 next
 11875                                  ;  733  4697 next
 11876                                  ;  734  4702 next
 11877                                  ;  735  4707 next
 11878                                  ;  736  4712 next
 11879                                  ;  737  4717 next
 11880                                  ;  738  4722 next
 11881                                  ;  739  4727 next
 11882                                  ;  740  4732 next
 11883                                  ;  741  4737 next
 11884                                  ;  742  4742 next
 11885                                  ;  743  4747 next
 11886                                  ;  744  4752 instr1
 11887                                  ;  745  4759 next
 11888                                  ;  746  4764 ifEOL
 11889                                  ;  747  4770 getlex
 11890                                  ;  748  4777 next
 11891                                  ;  749  4782 next
 11892                                  ;  750  4787 getlex
 11893                                  ;  751  4794 getstring
 11894                                  ;  752  4804 digit
 11895                                  ;  753  4810 getdigit
 11896                                  ;  754  4819 next
 11897                                  ;  755  4824 next
 11898                                  ;  756  4829 next
 11899                                  ;  757  4834 alnum
 11900                                  ;  758  4840 strcpy
 11901                                  ;  759  4847 alnum
 11902                                  ;  760  4853 next
 11903                                  ;  761  4858 eqstr
 11904                                  ;  762  4864 eqstr
 11905                                  ;  763  4870 eqstr
 11906                                  ;  764  4876 eqstr
 11907                                  ;  765  4882 eqstr
 11908                                  ;  766  4888 eqstr
 11909                                  ;  767  4894 eqstr
 11910                                  ;  768  4900 eqstr
 11911                                  ;  769  4906 eqstr
 11912                                  ;  770  4912 eqstr
 11913                                  ;  771  4918 eqstr
 11914                                  ;  772  4924 eqstr
 11915                                  ;  773  4930 eqstr
 11916                                  ;  774  4936 eqstr
 11917                                  ;  775  4942 eqstr
 11918                                  ;  776  4948 eqstr
 11919                                  ;  777  4954 eqstr
 11920                                  ;  778  4960 convertdefine
 11921                                  ;  779  4974 strcpy
 11922                                  ;  780  4981 error1
 11923                                  ;  781  4988 adrofname
 11924                                  ;  782  4998 eqstr
 11925                                  ;  783  5004 next
 11926                                  ;  784  5009 alnum
 11927                                  ;  785  5015 next
 11928                                  ;  786  5020 digit
 11929                                  ;  787  5026 next
 11930                                  ;  788  5031 next
 11931                                  ;  789  5036 next
 11932                                  ;  790  5041 fgets1
 11933                                  ;  791  5048 getlex
 11934                                  ;  792  5055 istoken
 11935                                  ;  793  5063 prs
 11936                                  ;  794  5067 listproc
 11937                                  ;  795  5076 prs
 11938                                  ;  796  5080 pint1
 11939                                  ;  797  5086 error1
 11940                                  ;  798  5093 eprc
 11941                                  ;  799  5098 writetty
 11942                                  ;  800  5107 writetty
 11943                                  ;  801  5116 fputcR
 11944                                  ;  802  5123 prc
 11945                                  ;  803  5127 prs
 11946                                  ;  804  5131 prc
 11947                                  ;  805  5135 eprc
 11948                                  ;  806  5140 mkneg
 11949                                  ;  807  5146 eprnum
 11950                                  ;  808  5153 eprc
 11951                                  ;  809  5158 prc
 11952                                  ;  810  5162 mkneg
 11953                                  ;  811  5168 pint1
 11954                                  ;  812  5174 prc
 11955                                  ;  813  5178 prunsign1
 11956                                  ;  814  5188 prc
 11957                                  ;  815  5192 prc
 11958                                  ;  816  5196 prc
 11959                                  ;  817  5200 prc
 11960                                  ;  818  5204 prc
 11961                                  ;  819  5208 prunsign1
 11962                                  ;  820  5218 printinputline
 11963                                  ;  821  5233 readRL
 11964                                  ;  822  5240 prs
 11965                                  ;  823  5244 prunsign1
 11966                                  ;  824  5254 prc
 11967                                  ;  825  5258 prscomment
 11968                                  ;  826  5269 next
 11969                                  ;  827  5274 fcloseR
 11970                                  ;  828  5282 fcloseR
 11971                                  ;  829  5290 exitR
 11972                                  ;  830  5296 prnl
 11973                                  ;  831  5301 prscomment
 11974                                  ;  832  5312 prs
 11975                                  ;  833  5316 prunsign1
 11976                                  ;  834  5326 prs
 11977                                  ;  835  5330 prs
 11978                                  ;  836  5334 prs
 11979                                  ;  837  5338 prunsign1
 11980                                  ;  838  5348 prs
 11981                                  ;  839  5352 prunsign1
 11982                                  ;  840  5362 prs
 11983                                  ;  841  5366 prc
 11984                                  ;  842  5370 prs
 11985                                  ;  843  5374 prunsign1
 11986                                  ;  844  5384 prs
 11987                                  ;  845  5388 prs
 11988                                  ;  846  5392 end1
 11989                                  ;  847  5397 prs
 11990                                  ;  848  5401 prs
 11991                                  ;  849  5405 prs
 11992                                  ;  850  5409 prunsign1
 11993                                  ;  851  5419 prs
 11994                                  ;  852  5423 listvar
 11995                                  ;  853  5431 prs
 11996                                  ;  854  5435 printint51
 11997                                  ;  855  5446 prc
 11998                                  ;  856  5450 prs
 11999                                  ;  857  5454 prs
 12000                                  ;  858  5458 prs
 12001                                  ;  859  5462 prs
 12002                                  ;  860  5466 prs
 12003                                  ;  861  5470 prs
 12004                                  ;  862  5474 prs
 12005                                  ;  863  5478 prs
 12006                                  ;  864  5482 prs
 12007                                  ;  865  5486 printint51
 12008                                  ;  866  5497 printint51
 12009                                  ;  867  5508 prs
 12010                                  ;  868  5512 prs
 12011                                  ;  869  5516 prc
 12012                                  ;  870  5520 adrofname
 12013                                  ;  871  5530 prs
 12014                                  ;  872  5534 prc
 12015                                  ;  873  5538 prunsign1
 12016                                  ;  874  5548 prc
 12017                                  ;  875  5552 prunsign1
 12018                                  ;  876  5562 prc
 12019                                  ;  877  5566 prs
 12020                                  ;  878  5570 prc
 12021                                  ;  879  5574 pint1
 12022                                  ;  880  5580 prs
 12023                                  ;  881  5584 calllisting
 12024                                  ;  882  5596 prs
 12025                                  ;  883  5600 printint51
 12026                                  ;  884  5611 prc
 12027                                  ;  885  5615 prs
 12028                                  ;  886  5619 printint51
 12029                                  ;  887  5630 prc
 12030                                  ;  888  5634 from_far
 12031                                  ;  889  5643 prs
 12032                                  ;  890  5647 adrF
 12033                                  ;  891  5652 from_far
 12034                                  ;  892  5661 eqstr
 12035                                  ;  893  5667 prs
 12036                                  ;  894  5671 countcalls
 12037                                  ;  895  5682 funclisting
 12038                                  ;  896  5694 prs
 12039                                  ;  897  5698 printint51
 12040                                  ;  898  5709 printint51
 12041                                  ;  899  5720 prs
 12042                                  ;  900  5724 printint51
 12043                                  ;  901  5735 prc
 12044                                  ;  902  5739 prs
 12045                                  ;  903  5743 prs
 12046                                  ;  904  5747 prs
 12047                                  ;  905  5751 prs
 12048                                  ;  906  5755 prc
 12049                                  ;  907  5759 prc
 12050                                  ;  908  5763 adrF
 12051                                  ;  909  5768 prs
 12052                                  ;  910  5772 strcpy
 12053                                  ;  911  5779 storefunc
 12054                                  ;  912  5789 prs
 12055                                  ;  913  5793 prs
 12056                                  ;  914  5797 listvar
 12057                                  ;  915  5805 listfunc
 12058                                  ;  916  5814 listcall
 12059                                  ;  917  5823 prs
 12060                                  ;  918  5827 prs
 12061                                  ;  919  5831 prs
 12062                                  ;  920  5835 prs
 12063                                  ;  921  5839 prs
 12064                                  ;  922  5843 printint51
 12065                                  ;  923  5854 prs
 12066                                  ;  924  5858 printint51
 12067                                  ;  925  5869 prs
 12068                                  ;  926  5873 printint51
 12069                                  ;  927  5884 prs
 12070                                  ;  928  5888 printint51
 12071                                  ;  929  5899 prs
 12072                                  ;  930  5903 printint51
 12073                                  ;  931  5914 prs
 12074                                  ;  932  5918 printint51
 12075                                  ;  933  5929 prs
 12076                                  ;  934  5933 printint51
 12077                                  ;  935  5944 prs
 12078                                  ;  936  5948 printint51
 12079                                  ;  937  5959 prs
 12080                                  ;  938  5963 printint51
 12081                                  ;  939  5974 prs
 12082                                  ;  940  5978 printint51
 12083                                  ;  941  5989 prs
 12084                                  ;  942  5993 printint51
 12085                                  ;  943  6004 prs
 12086                                  ;  944  6008 printint51
 12087                                  ;  945  6019 prs
 12088                                  ;  946  6023 prs
 12089                                  ;  947  6027 prunsign1
 12090                                  ;  948  6037 prs
 12091                                  ;  949  6041 printint51
 12092                                  ;  950  6052 prs
 12093                                  ;  951  6056 prs
 12094                                  ;  952  6060 prs
 12095                                  ;  953  6064 prs
 12096                                  ;  954  6068 printint51
 12097                                  ;  955  6079 prs
 12098                                  ;  956  6083 printint51
 12099                                  ;  957  6094 prs
 12100                                  ;  958  6098 printint51
 12101                                  ;  959  6109 prs
 12102                                  ;  960  6113 end1
 12103                                  ;  961  6118 DosInt
 12104                                  ;  962  6125 DosInt
 12105                                  ;Input: A.C, List: A.S,  Lines: 1014
 12106                                  ;Glob. variables:  129 max.:  200
 12107                                  ;Functions      :  108 max.:  300
 12108                                  ;Calls          :  963 max.: 2000, NameField: 6132 max.:    65535
 12109                                  ;Code until     :21661 max.: 30000, free: 8339
 12110                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12111                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
