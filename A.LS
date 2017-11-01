     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9264B                  jmp main
     5                                  
     6                                  ;-1 char Version1[]="A.COM V0.9.2";//todo: 2. op=reg not recognized
     7                                  
     8 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9.2",0
     9 0000000C 392E3200           
    10                                  
    11                                  ;-2 #define LSTART        200//max global var
    12                                  
    13                                  
    14                                  ;-3 #define VARMAX        300//max global and local var
    15                                  
    16                                  
    17                                  ;-4 #define GNAMEMAX     4800// 16*VARMAX
    18                                  
    19                                  
    20                                  ;-5 #define FUNCMAX       300//max functions
    21                                  
    22                                  
    23                                  ;-6 #define FNAMEMAX     4800// 16*FUNCMAX
    24                                  
    25                                  
    26                                  ;-7 #define CALLMAX      2000//max call
    27                                  
    28                                  
    29                                  ;-8 #define IDLENMAX       15//max length of names
    30                                  
    31                                  
    32                                  ;-9 #define COLUMNMAX     128
    33                                  
    34                                  
    35                                  ;-10 #define T_NAME        256//the following defines for better clearity
    36                                  
    37                                  
    38                                  ;-11 #define T_CONST       257
    39                                  
    40                                  
    41                                  ;-12 #define T_STRING      258
    42                                  
    43                                  
    44                                  ;-13 #define T_DEFINE      511
    45                                  
    46                                  
    47                                  ;-14 #define T_RETURN      512
    48                                  
    49                                  
    50                                  ;-15 #define T_IF          513
    51                                  
    52                                  
    53                                  ;-16 #define T_ELSE        514
    54                                  
    55                                  
    56                                  ;-17 #define T_WHILE       515
    57                                  
    58                                  
    59                                  ;-18 #define T_DO          516
    60                                  
    61                                  
    62                                  ;-19 #define T_INT         517
    63                                  
    64                                  
    65                                  ;-20 #define T_ASM         518
    66                                  
    67                                  
    68                                  ;-21 #define T_ASMBLOCK    519
    69                                  
    70                                  
    71                                  ;-22 #define T_EMIT        520
    72                                  
    73                                  
    74                                  ;-23 #define T_GOTO        521
    75                                  
    76                                  
    77                                  ;-24 #define T_VOID        529
    78                                  
    79                                  
    80                                  ;-25 #define T_CHAR        530
    81                                  
    82                                  
    83                                  ;-26 #define T_SIGNED      531
    84                                  
    85                                  
    86                                  ;-27 #define T_UNSIGNED    532
    87                                  
    88                                  
    89                                  ;-28 #define T_LONG        533
    90                                  
    91                                  
    92                                  ;-29 #define T_EQ          806
    93                                  
    94                                  
    95                                  ;-30 #define T_NE          807
    96                                  
    97                                  
    98                                  ;-31 #define T_GE          811
    99                                  
   100                                  
   101                                  ;-32 #define T_LE          824
   102                                  
   103                                  
   104                                  ;-33 #define T_PLUSPLUS   1219
   105                                  
   106                                  
   107                                  ;-34 #define T_MINUSMINUS 1225
   108                                  
   109                                  
   110                                  ;-35 #define T_PLUSASS    1230
   111                                  
   112                                  
   113                                  ;-36 #define T_MINUSASS   1231
   114                                  
   115                                  
   116                                  ;-37 #define T_MULASS     1232
   117                                  
   118                                  
   119                                  ;-38 #define T_DIVASS     1233
   120                                  
   121                                  
   122                                  ;-39 #define T_ANDASS     1234
   123                                  
   124                                  
   125                                  ;-40 #define T_ORASS      1235
   126                                  
   127                                  
   128                                  ;-41 #define T_LESSLESS   1240
   129                                  
   130                                  
   131                                  ;-42 #define T_GREATGREAT 1241
   132                                  
   133                                  
   134                                  ;-43 
   135                                  
   136                                  
   137                                  ;-44 unsigned int ORGDATAORIG=25000;//start of arrays
   138                                  
   139 00000010 A861                    ORGDATAORIG dw 25000
   140                                  
   141                                  ;-45 unsigned int orgData;//actual max of array, must be less than stack
   142                                  
   143 00000012 0000                    orgData dw 0
   144                                  
   145                                  ;-46 #define COMAX        2000
   146                                  
   147                                  
   148                                  ;-47 char co[COMAX];//constant storage
   149                                  
   150                                  section .bss
   151                                  absolute 25000
   152 000061A8 <res 000007D0>          co resb 2000
   153                                  section .text
   154                                  
   155                                  ;-48 int maxco=0;
   156                                  
   157 00000014 0000                    maxco dw 0
   158                                  
   159                                  ;-49 int maxco1=0;
   160                                  
   161 00000016 0000                    maxco1 dw 0
   162                                  
   163                                  ;-50 #define CMDLENMAX      67
   164                                  
   165                                  
   166                                  ;-51 char coname[CMDLENMAX];
   167                                  
   168                                  section .bss
   169                                  absolute 27000
   170 00006978 <res 00000043>          coname resb 67
   171                                  section .text
   172                                  
   173                                  ;-52 char symbol[COLUMNMAX];
   174                                  
   175                                  section .bss
   176                                  absolute 27067
   177 000069BB <res 00000080>          symbol resb 128
   178                                  section .text
   179                                  
   180                                  ;-53 char fname[CMDLENMAX];
   181                                  
   182                                  section .bss
   183                                  absolute 27195
   184 00006A3B <res 00000043>          fname resb 67
   185                                  section .text
   186                                  
   187                                  ;-54 char namein[CMDLENMAX];
   188                                  
   189                                  section .bss
   190                                  absolute 27262
   191 00006A7E <res 00000043>          namein resb 67
   192                                  section .text
   193                                  
   194                                  ;-55 char namelst[CMDLENMAX];
   195                                  
   196                                  section .bss
   197                                  absolute 27329
   198 00006AC1 <res 00000043>          namelst resb 67
   199                                  section .text
   200                                  
   201                                  ;-56 char archivename[CMDLENMAX];
   202                                  
   203                                  section .bss
   204                                  absolute 27396
   205 00006B04 <res 00000043>          archivename resb 67
   206                                  section .text
   207                                  
   208                                  ;-57 char *cloc=0;
   209                                  
   210 00000018 0000                    cloc dw 0
   211                                  
   212                                  ;-58 int fdin=0;
   213                                  
   214 0000001A 0000                    fdin dw 0
   215                                  
   216                                  ;-59 int fdout=0;
   217                                  
   218 0000001C 0000                    fdout dw 0
   219                                  
   220                                  ;-60 int token=0;
   221                                  
   222 0000001E 0000                    token dw 0
   223                                  
   224                                  ;-61 char globC=0;
   225                                  
   226 00000020 00                      globC db 0
   227                                  
   228                                  ;-62 int column=0;
   229                                  
   230 00000021 0000                    column dw 0
   231                                  
   232                                  ;-63 char thechar=0;   //reads one char forward
   233                                  
   234 00000023 00                      thechar db 0
   235                                  
   236                                  ;-64 int iscmp=0;
   237                                  
   238 00000024 0000                    iscmp dw 0
   239                                  
   240                                  ;-65 int nconst=0;
   241                                  
   242 00000026 0000                    nconst dw 0
   243                                  
   244                                  ;-66 int nreturn=0;
   245                                  
   246 00000028 0000                    nreturn dw 0
   247                                  
   248                                  ;-67 int nlabel=0;
   249                                  
   250 0000002A 0000                    nlabel dw 0
   251                                  
   252                                  ;-68 int GTop=1;
   253                                  
   254 0000002C 0100                    GTop dw 1
   255                                  
   256                                  ;-69 int LTop=LSTART;
   257                                  
   258 0000002E C800                    LTop dw 200
   259                                  
   260                                  ;-70 unsigned int lexval=0;
   261                                  
   262 00000030 0000                    lexval dw 0
   263                                  
   264                                  ;-71 int typei;       char istype;
   265                                  
   266 00000032 0000                    typei dw 0
   267 00000034 00                      istype db 0
   268                                  
   269                                  ;-72 int signi;       char issign;
   270                                  
   271 00000035 0000                    signi dw 0
   272 00000037 00                      issign db 0
   273                                  
   274                                  ;-73 int widthi;      char iswidth;
   275                                  
   276 00000038 0000                    widthi dw 0
   277 0000003A 00                      iswidth db 0
   278                                  
   279                                  ;-74 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   280                                  
   281                                  section .bss
   282                                  absolute 27463
   283 00006B47 <res 0000012C>          GType resb 300
   284                                  section .text
   285                                  
   286                                  ;-75 char GSign [VARMAX]; // 0=U, 1=S
   287                                  
   288                                  section .bss
   289                                  absolute 27763
   290 00006C73 <res 0000012C>          GSign resb 300
   291                                  section .text
   292                                  
   293                                  ;-76 char GWidth[VARMAX]; // 0, 1, 2, 4
   294                                  
   295                                  section .bss
   296                                  absolute 28063
   297 00006D9F <res 0000012C>          GWidth resb 300
   298                                  section .text
   299                                  
   300                                  ;-77 int GAdr [VARMAX];
   301                                  
   302                                  section .bss
   303                                  absolute 28363
   304 00006ECB <res 00000258>          GAdr resw 300
   305                                  section .text
   306                                  
   307                                  ;-78 int GUsed[VARMAX];
   308                                  
   309                                  section .bss
   310                                  absolute 28963
   311 00007123 <res 00000258>          GUsed resw 300
   312                                  section .text
   313                                  
   314                                  ;-79 int GData[VARMAX];
   315                                  
   316                                  section .bss
   317                                  absolute 29563
   318 0000737B <res 00000258>          GData resw 300
   319                                  section .text
   320                                  
   321                                  ;-80 char GNameField[GNAMEMAX];
   322                                  
   323                                  section .bss
   324                                  absolute 30163
   325 000075D3 <res 000012C0>          GNameField resb 4800
   326                                  section .text
   327                                  
   328                                  ;-81 int wi=0;
   329                                  
   330 0000003B 0000                    wi dw 0
   331                                  
   332                                  ;-82 int  FTop=0;
   333                                  
   334 0000003D 0000                    FTop dw 0
   335                                  
   336                                  ;-83 int  CTop=0;
   337                                  
   338 0000003F 0000                    CTop dw 0
   339                                  
   340                                  ;-84 char FType [FUNCMAX];
   341                                  
   342                                  section .bss
   343                                  absolute 34963
   344 00008893 <res 0000012C>          FType resb 300
   345                                  section .text
   346                                  
   347                                  ;-85 char CType[CALLMAX];
   348                                  
   349                                  section .bss
   350                                  absolute 35263
   351 000089BF <res 000007D0>          CType resb 2000
   352                                  section .text
   353                                  
   354                                  ;-86 int  FAdr  [FUNCMAX];
   355                                  
   356                                  section .bss
   357                                  absolute 37263
   358 0000918F <res 00000258>          FAdr resw 300
   359                                  section .text
   360                                  
   361                                  ;-87 int  CAdr [CALLMAX];
   362                                  
   363                                  section .bss
   364                                  absolute 37863
   365 000093E7 <res 00000FA0>          CAdr resw 2000
   366                                  section .text
   367                                  
   368                                  ;-88 int  FCalls[FUNCMAX];
   369                                  
   370                                  section .bss
   371                                  absolute 41863
   372 0000A387 <res 00000258>          FCalls resw 300
   373                                  section .text
   374                                  
   375                                  ;-89 char FNameField[FNAMEMAX];
   376                                  
   377                                  section .bss
   378                                  absolute 42463
   379 0000A5DF <res 000012C0>          FNameField resb 4800
   380                                  section .text
   381                                  
   382                                  ;-90 //char CNameField[CNAMEMAX];
   383                                  
   384                                  
   385                                  ;-91 
   386                                  
   387                                  
   388                                  ;-92 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   389                                  
   390 00000041 313233343536373839-     NameA db "12345678901234567890123456789012",0
   391 0000004A 303132333435363738-
   392 00000053 393031323334353637-
   393 0000005C 383930313200       
   394                                  
   395                                  ;-93 char fgetsdest[COLUMNMAX];
   396                                  
   397                                  section .bss
   398                                  absolute 47263
   399 0000B89F <res 00000080>          fgetsdest resb 128
   400                                  section .text
   401                                  
   402                                  ;-94 unsigned char *CNameTop=0;
   403                                  
   404 00000062 0000                    CNameTop dw 0
   405                                  
   406                                  ;-95 unsigned char *fgetsp=0;
   407                                  
   408 00000064 0000                    fgetsp dw 0
   409                                  
   410                                  ;-96 unsigned int segE;
   411                                  
   412 00000066 0000                    segE dw 0
   413                                  
   414                                  ;-97 unsigned int lineno=1;
   415                                  
   416 00000068 0100                    lineno dw 1
   417                                  
   418                                  ;-98 unsigned int linenoinclude=1;
   419                                  
   420 0000006A 0100                    linenoinclude dw 1
   421                                  
   422                                  ;-99 unsigned char *pt=0;
   423                                  
   424 0000006C 0000                    pt dw 0
   425                                  
   426                                  ;-100 unsigned char *p1=0;
   427                                  
   428 0000006E 0000                    p1 dw 0
   429                                  
   430                                  ;-101 int DOS_ERR=0;
   431                                  
   432 00000070 0000                    DOS_ERR dw 0
   433                                  
   434                                  ;-102 int DOS_NoBytes=0;
   435                                  
   436 00000072 0000                    DOS_NoBytes dw 0
   437                                  
   438                                  ;-103 char DOS_ByteRead=0;
   439                                  
   440 00000074 00                      DOS_ByteRead db 0
   441                                  
   442                                  ;-104 
   443                                  
   444                                  
   445                                  ;-105 
   446                                  
   447                                  
   448                                  ;-106 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   449                                  
   450                                  
   451                                  writetty: PROC
   452 00000075 B40E                     mov  ah, 14
   453 00000077 BB0000                   mov  bx, 0
   454 0000007A CD10                     db 205,16
   455                                  
   456                                  ;-107 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   457                                  
   458 0000007C C3                       ret
   459                                  ENDP
   460                                  
   461                                  putch: PROC
   462                                  ;Function : putch, Number of local variables: 1
   463                                  ;   # type sign width addr used name   list of local variables
   464                                  ;  200 var sign byte   107 NULL c = bp+4;
   465 0000007D C8000000                 ENTER  0,0
   466 00000081 8A4604                   mov al, [bp+4]
   467 00000084 3C0A                     cmp al, 10
   468 00000086 0F850500                 jne .putch1
   469 0000008A B00D                     mov  al, 13
   470 0000008C E8E6FF                   call writetty
   471                                  .putch1:
   472 0000008F 8A4604                   mov  al, [bp+4]
   473 00000092 E8E0FF                   call writetty
   474                                  
   475                                  ;-108 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   476 00000095 C9                       LEAVE
   477 00000096 C3                       ret
   478                                  ENDP
   479                                  
   480                                  cputs: PROC
   481                                  ;Function : cputs, Number of local variables: 2
   482                                  ;   # type sign width addr used name   list of local variables
   483                                  ;  200 ptr sign byte   108 NULL s = bp+4
   484                                  ;  201 var sign byte   108 NULL c = bp-2;
   485 00000097 C8020000                 ENTER  2,0
   486                                  .cputs2:
   487 0000009B 8B5E04                   mov bx, [bp+4]
   488 0000009E 8A07                     mov al, [bx]
   489 000000A0 B400                     mov ah, 0
   490 000000A2 08C0                     or  al, al
   491 000000A4 0F841B00                 je .cputs3
   492 000000A8 8B5E04                   mov bx, [bp+4]
   493 000000AB 8A07                     mov al, [bx]
   494 000000AD B400                     mov ah, 0
   495 000000AF 8846FE                   mov [bp-2], al
   496 000000B2 8A46FE                   mov al, byte [bp-2]
   497 000000B5 B400                     mov ah, 0
   498 000000B7 50                       push ax
   499 000000B8 E8C2FF                   call putch
   500 000000BB 83C402                   add  sp, 2
   501 000000BE FF4604                   inc  word[bp+4]
   502 000000C1 EBD8                     jmp .cputs2
   503                                  .cputs3:
   504                                  
   505                                  ;-109 int mkneg(int n)   { n; __asm {neg ax} }
   506 000000C3 C9                       LEAVE
   507 000000C4 C3                       ret
   508                                  ENDP
   509                                  
   510                                  mkneg: PROC
   511                                  ;Function : mkneg, Number of local variables: 1
   512                                  ;   # type sign width addr used name   list of local variables
   513                                  ;  200 var sign word   109 NULL n = bp+4;
   514 000000C5 C8000000                 ENTER  0,0
   515 000000C9 8B4604                   mov ax, [bp+4]
   516 000000CC F7D8                    neg ax
   517                                  
   518                                  ;-110 
   519                                  
   520                                  
   521                                  ;-111 int DosInt() {
   522 000000CE C9                       LEAVE
   523 000000CF C3                       ret
   524                                  ENDP
   525                                  
   526                                  DosInt: PROC
   527                                  
   528                                  ;-112     __emit__(0xCD,0x21);//inth 0x21;
   529                                  
   530 000000D0 CD21                     db 205,33
   531                                  
   532                                  ;-113     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   533                                  
   534 000000D2 7304                     db 115,4
   535                                  
   536                                  ;-114     DOS_ERR++;
   537                                  
   538 000000D4 FF06[7000]               inc  word[DOS_ERR]
   539                                  
   540                                  ;-115 }
   541                                  
   542                                  
   543                                  ;-116 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   544                                  
   545 000000D8 C3                       ret
   546                                  ENDP
   547                                  
   548                                  openR: PROC
   549                                  ;Function : openR, Number of local variables: 1
   550                                  ;   # type sign width addr used name   list of local variables
   551                                  ;  200 ptr sign byte   116 NULL s = bp+4;
   552 000000D9 C8000000                 ENTER  0,0
   553 000000DD 8B5604                   mov  dx, [bp+4]
   554 000000E0 B8023D                   mov  ax, 15618
   555 000000E3 E8EAFF                   call DosInt
   556                                  
   557                                  ;-117 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   558 000000E6 C9                       LEAVE
   559 000000E7 C3                       ret
   560                                  ENDP
   561                                  
   562                                  creatR: PROC
   563                                  ;Function : creatR, Number of local variables: 1
   564                                  ;   # type sign width addr used name   list of local variables
   565                                  ;  200 ptr sign byte   117 NULL s = bp+4;
   566 000000E8 C8000000                 ENTER  0,0
   567 000000EC 8B5604                   mov  dx, [bp+4]
   568 000000EF B90000                   mov  cx, 0
   569 000000F2 B8003C                   mov  ax, 15360
   570 000000F5 E8D8FF                   call DosInt
   571                                  
   572                                  ;-118 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   573 000000F8 C9                       LEAVE
   574 000000F9 C3                       ret
   575                                  ENDP
   576                                  
   577                                  fcloseR: PROC
   578                                  ;Function : fcloseR, Number of local variables: 1
   579                                  ;   # type sign width addr used name   list of local variables
   580                                  ;  200 var sign word   118 NULL fd = bp+4;
   581 000000FA C8000000                 ENTER  0,0
   582 000000FE 8B5E04                   mov  bx, [bp+4]
   583 00000101 B8003E                   mov  ax, 15872
   584 00000104 E8C9FF                   call DosInt
   585                                  
   586                                  ;-119 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   587 00000107 C9                       LEAVE
   588 00000108 C3                       ret
   589                                  ENDP
   590                                  
   591                                  exitR: PROC
   592                                  ;Function : exitR, Number of local variables: 1
   593                                  ;   # type sign width addr used name   list of local variables
   594                                  ;  200 var sign byte   119 NULL c = bp+4;
   595 00000109 C8000000                 ENTER  0,0
   596 0000010D B44C                     mov  ah, 76
   597 0000010F 8A4604                   mov  al, [bp+4]
   598 00000112 E8BBFF                   call DosInt
   599                                  
   600                                  ;-120 int readRL(char *s, int fd, int len){
   601 00000115 C9                       LEAVE
   602 00000116 C3                       ret
   603                                  ENDP
   604                                  
   605                                  readRL: PROC
   606                                  
   607                                  ;-121     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   608                                  
   609                                  ;Function : readRL, Number of local variables: 3
   610                                  ;   # type sign width addr used name   list of local variables
   611                                  ;  200 ptr sign byte   120 NULL s = bp+4
   612                                  ;  201 var sign word   120 NULL fd = bp+6
   613                                  ;  202 var sign word   120 NULL len = bp+8;
   614 00000117 C8000000                 ENTER  0,0
   615 0000011B 8B5604                   mov  dx, [bp+4]
   616 0000011E 8B4E08                   mov  cx, [bp+8]
   617 00000121 8B5E06                   mov  bx, [bp+6]
   618 00000124 B8003F                   mov  ax, 16128
   619 00000127 E8A6FF                   call DosInt
   620                                  
   621                                  ;-122 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   622 0000012A C9                       LEAVE
   623 0000012B C3                       ret
   624                                  ENDP
   625                                  
   626                                  fputcR: PROC
   627                                  ;Function : fputcR, Number of local variables: 2
   628                                  ;   # type sign width addr used name   list of local variables
   629                                  ;  200 ptr sign byte   122 NULL n = bp+4
   630                                  ;  201 var sign word   122 NULL fd = bp+6;
   631 0000012C C8000000                 ENTER  0,0
   632 00000130 8D5604                  lea dx, [bp+4]
   633                                  
   634                                  ;-123   cx=1; bx=fd; ax=0x4000; DosInt(); }
   635                                  
   636 00000133 B90100                   mov  cx, 1
   637 00000136 8B5E06                   mov  bx, [bp+6]
   638 00000139 B80040                   mov  ax, 16384
   639 0000013C E891FF                   call DosInt
   640                                  
   641                                  ;-124 
   642                                  
   643                                  
   644                                  ;-125   int letter(char c) {
   645 0000013F C9                       LEAVE
   646 00000140 C3                       ret
   647                                  ENDP
   648                                  
   649                                  letter: PROC
   650                                  
   651                                  ;-126       if (c=='_') return 1;
   652                                  
   653                                  ;Function : letter, Number of local variables: 1
   654                                  ;   # type sign width addr used name   list of local variables
   655                                  ;  200 var sign byte   125 NULL c = bp+4;
   656 00000141 C8000000                 ENTER  0,0
   657 00000145 8A4604                   mov al, [bp+4]
   658 00000148 3C5F                     cmp al, 95
   659 0000014A 0F850600                 jne .letter4
   660 0000014E B80100                   mov ax, 1
   661 00000151 E96900                   jmp .retnletter
   662                                  
   663                                  ;-127       if (c=='.') return 1;
   664                                  
   665                                  .letter4:
   666 00000154 8A4604                   mov al, [bp+4]
   667 00000157 3C2E                     cmp al, 46
   668 00000159 0F850600                 jne .letter5
   669 0000015D B80100                   mov ax, 1
   670 00000160 E95A00                   jmp .retnletter
   671                                  
   672                                  ;-128       if (c=='?') return 1;
   673                                  
   674                                  .letter5:
   675 00000163 8A4604                   mov al, [bp+4]
   676 00000166 3C3F                     cmp al, 63
   677 00000168 0F850600                 jne .letter6
   678 0000016C B80100                   mov ax, 1
   679 0000016F E94B00                   jmp .retnletter
   680                                  
   681                                  ;-129       if (c=='$') return 1;
   682                                  
   683                                  .letter6:
   684 00000172 8A4604                   mov al, [bp+4]
   685 00000175 3C24                     cmp al, 36
   686 00000177 0F850600                 jne .letter7
   687 0000017B B80100                   mov ax, 1
   688 0000017E E93C00                   jmp .retnletter
   689                                  
   690                                  ;-130       if (c> 'z') return 0;
   691                                  
   692                                  .letter7:
   693 00000181 8A4604                   mov al, [bp+4]
   694 00000184 3C7A                     cmp al, 122
   695 00000186 0F8E0600                 jle .letter8
   696 0000018A B80000                   mov ax, 0
   697 0000018D E92D00                   jmp .retnletter
   698                                  
   699                                  ;-131       if (c< '@') return 0;// at included
   700                                  
   701                                  .letter8:
   702 00000190 8A4604                   mov al, [bp+4]
   703 00000193 3C40                     cmp al, 64
   704 00000195 0F8D0600                 jge .letter9
   705 00000199 B80000                   mov ax, 0
   706 0000019C E91E00                   jmp .retnletter
   707                                  
   708                                  ;-132       if (c> 'Z') { if (c< 'a') return 0; }
   709                                  
   710                                  .letter9:
   711 0000019F 8A4604                   mov al, [bp+4]
   712 000001A2 3C5A                     cmp al, 90
   713 000001A4 0F8E0F00                 jle .letter10
   714 000001A8 8A4604                   mov al, [bp+4]
   715 000001AB 3C61                     cmp al, 97
   716 000001AD 0F8D0600                 jge .letter11
   717 000001B1 B80000                   mov ax, 0
   718 000001B4 E90600                   jmp .retnletter
   719                                  .letter11:
   720                                  
   721                                  ;-133       return 1;
   722                                  
   723                                  .letter10:
   724 000001B7 B80100                   mov ax, 1
   725 000001BA E90000                   jmp .retnletter
   726                                  
   727                                  ;-134   }
   728                                  
   729                                  
   730                                  ;-135   int digit(char c){
   731                                  
   732 000001BD C9                       .retnletter: LEAVE
   733 000001BE C3                       ret
   734                                  ENDP
   735                                  
   736                                  digit: PROC
   737                                  
   738                                  ;-136       if(c<'0') return 0;
   739                                  
   740                                  ;Function : digit, Number of local variables: 1
   741                                  ;   # type sign width addr used name   list of local variables
   742                                  ;  200 var sign byte   135 NULL c = bp+4;
   743 000001BF C8000000                 ENTER  0,0
   744 000001C3 8A4604                   mov al, [bp+4]
   745 000001C6 3C30                     cmp al, 48
   746 000001C8 0F8D0600                 jge .digit12
   747 000001CC B80000                   mov ax, 0
   748 000001CF E91500                   jmp .retndigit
   749                                  
   750                                  ;-137       if(c>'9') return 0;
   751                                  
   752                                  .digit12:
   753 000001D2 8A4604                   mov al, [bp+4]
   754 000001D5 3C39                     cmp al, 57
   755 000001D7 0F8E0600                 jle .digit13
   756 000001DB B80000                   mov ax, 0
   757 000001DE E90600                   jmp .retndigit
   758                                  
   759                                  ;-138       return 1;
   760                                  
   761                                  .digit13:
   762 000001E1 B80100                   mov ax, 1
   763 000001E4 E90000                   jmp .retndigit
   764                                  
   765                                  ;-139   }
   766                                  
   767                                  
   768                                  ;-140   int alnum(char c) {
   769                                  
   770 000001E7 C9                       .retndigit: LEAVE
   771 000001E8 C3                       ret
   772                                  ENDP
   773                                  
   774                                  alnum: PROC
   775                                  
   776                                  ;-141     if (digit (c)) return 1;
   777                                  
   778                                  ;Function : alnum, Number of local variables: 1
   779                                  ;   # type sign width addr used name   list of local variables
   780                                  ;  200 var sign byte   140 NULL c = bp+4;
   781 000001E9 C8000000                 ENTER  0,0
   782 000001ED 8A4604                   mov al, byte [bp+4]
   783 000001F0 B400                     mov ah, 0
   784 000001F2 50                       push ax
   785 000001F3 E8C9FF                   call digit
   786 000001F6 83C402                   add  sp, 2
   787 000001F9 08C0                     or  al, al
   788 000001FB 0F840600                 je .alnum14
   789 000001FF B80100                   mov ax, 1
   790 00000202 E91E00                   jmp .retnalnum
   791                                  
   792                                  ;-142     if (letter(c)) return 1;
   793                                  
   794                                  .alnum14:
   795 00000205 8A4604                   mov al, byte [bp+4]
   796 00000208 B400                     mov ah, 0
   797 0000020A 50                       push ax
   798 0000020B E833FF                   call letter
   799 0000020E 83C402                   add  sp, 2
   800 00000211 08C0                     or  al, al
   801 00000213 0F840600                 je .alnum15
   802 00000217 B80100                   mov ax, 1
   803 0000021A E90600                   jmp .retnalnum
   804                                  
   805                                  ;-143     return 0;
   806                                  
   807                                  .alnum15:
   808 0000021D B80000                   mov ax, 0
   809 00000220 E90000                   jmp .retnalnum
   810                                  
   811                                  ;-144   }
   812                                  
   813                                  
   814                                  ;-145 
   815                                  
   816                                  
   817                                  ;-146 int strlen(char *s) { int c;
   818                                  
   819 00000223 C9                       .retnalnum: LEAVE
   820 00000224 C3                       ret
   821                                  ENDP
   822                                  
   823                                  strlen: PROC
   824                                  
   825                                  ;-147     c=0;
   826                                  
   827                                  ;Function : strlen, Number of local variables: 2
   828                                  ;   # type sign width addr used name   list of local variables
   829                                  ;  200 ptr sign byte   146 NULL s = bp+4
   830                                  ;  201 var sign word   146 NULL c = bp-2;
   831 00000225 C8020000                 ENTER  2,0
   832 00000229 B80000                   mov ax, 0
   833 0000022C 8946FE                   mov [bp-2], ax
   834                                  
   835                                  ;-148     while (*s!=0) {s++; c++;}
   836                                  
   837                                  .strlen16:
   838 0000022F 8B5E04                   mov bx, [bp+4]
   839 00000232 8A07                     mov al, [bx]
   840 00000234 B400                     mov ah, 0
   841 00000236 83F800                   cmp ax, 0
   842 00000239 0F840800                 je  .strlen17
   843 0000023D FF4604                   inc  word[bp+4]
   844 00000240 FF46FE                   inc  word[bp-2]
   845                                  
   846                                  ;-149     return c;
   847                                  
   848 00000243 EBEA                     jmp .strlen16
   849                                  .strlen17:
   850 00000245 8B46FE                   mov ax, [bp-2]
   851 00000248 E90000                   jmp .retnstrlen
   852                                  
   853                                  ;-150 }
   854                                  
   855                                  
   856                                  ;-151 int strcpy(char *s, char *t) {
   857                                  
   858 0000024B C9                       .retnstrlen: LEAVE
   859 0000024C C3                       ret
   860                                  ENDP
   861                                  
   862                                  strcpy: PROC
   863                                  
   864                                  ;-152     do { *s=*t; s++; t++; }
   865                                  
   866                                  ;Function : strcpy, Number of local variables: 2
   867                                  ;   # type sign width addr used name   list of local variables
   868                                  ;  200 ptr sign byte   151 NULL s = bp+4
   869                                  ;  201 ptr sign byte   151 NULL t = bp+6;
   870 0000024D C8000000                 ENTER  0,0
   871                                  .strcpy18:
   872 00000251 8B5E06                   mov bx, [bp+6]
   873 00000254 8A07                     mov al, [bx]
   874 00000256 B400                     mov ah, 0
   875 00000258 8B5E04                   mov  bx, [bp+4]
   876 0000025B 8807                     mov  [bx], al
   877 0000025D FF4604                   inc  word[bp+4]
   878 00000260 FF4606                   inc  word[bp+6]
   879                                  
   880                                  ;-153     while (*t!=0);
   881                                  
   882 00000263 8B5E06                   mov bx, [bp+6]
   883 00000266 8A07                     mov al, [bx]
   884 00000268 B400                     mov ah, 0
   885 0000026A 83F800                   cmp ax, 0
   886 0000026D 0F840200                 je  .strcpy19
   887 00000271 EBDE                     jmp .strcpy18
   888                                  .strcpy19:
   889                                  
   890                                  ;-154     *s=0;
   891                                  
   892 00000273 B80000                   mov ax, 0
   893 00000276 8B5E04                   mov  bx, [bp+4]
   894 00000279 8807                     mov  [bx], al
   895                                  
   896                                  ;-155     return s;
   897                                  
   898 0000027B 8B4604                   mov ax, [bp+4]
   899 0000027E E90000                   jmp .retnstrcpy
   900                                  
   901                                  ;-156 }
   902                                  
   903                                  
   904                                  ;-157 int eqstr(char *p, char *q) {
   905                                  
   906 00000281 C9                       .retnstrcpy: LEAVE
   907 00000282 C3                       ret
   908                                  ENDP
   909                                  
   910                                  eqstr: PROC
   911                                  
   912                                  ;-158     while(*p) {
   913                                  
   914                                  ;Function : eqstr, Number of local variables: 2
   915                                  ;   # type sign width addr used name   list of local variables
   916                                  ;  200 ptr sign byte   157 NULL p = bp+4
   917                                  ;  201 ptr sign byte   157 NULL q = bp+6;
   918 00000283 C8000000                 ENTER  0,0
   919                                  .eqstr20:
   920 00000287 8B5E04                   mov bx, [bp+4]
   921 0000028A 8A07                     mov al, [bx]
   922 0000028C B400                     mov ah, 0
   923 0000028E 08C0                     or  al, al
   924 00000290 0F842000                 je .eqstr21
   925                                  
   926                                  ;-159         if (*p != *q) return 0;
   927                                  
   928 00000294 8B5E04                   mov bx, [bp+4]
   929 00000297 8A07                     mov al, [bx]
   930 00000299 B400                     mov ah, 0
   931 0000029B 8B5E06                   mov bx, [bp+6]
   932 0000029E 3A07                     cmp al, [bx]
   933 000002A0 B400                     mov ah, 0
   934 000002A2 0F840600                 je  .eqstr22
   935 000002A6 B80000                   mov ax, 0
   936 000002A9 E92100                   jmp .retneqstr
   937                                  
   938                                  ;-160         p++;
   939                                  
   940                                  .eqstr22:
   941 000002AC FF4604                   inc  word[bp+4]
   942                                  
   943                                  ;-161         q++;
   944                                  
   945 000002AF FF4606                   inc  word[bp+6]
   946                                  
   947                                  ;-162     }
   948                                  
   949                                  
   950                                  ;-163     if(*q) return 0;
   951                                  
   952 000002B2 EBD3                     jmp .eqstr20
   953                                  .eqstr21:
   954 000002B4 8B5E06                   mov bx, [bp+6]
   955 000002B7 8A07                     mov al, [bx]
   956 000002B9 B400                     mov ah, 0
   957 000002BB 08C0                     or  al, al
   958 000002BD 0F840600                 je .eqstr23
   959 000002C1 B80000                   mov ax, 0
   960 000002C4 E90600                   jmp .retneqstr
   961                                  
   962                                  ;-164     return 1; }
   963                                  
   964                                  .eqstr23:
   965 000002C7 B80100                   mov ax, 1
   966 000002CA E90000                   jmp .retneqstr
   967                                  
   968                                  ;-165 int strcat1(char *s, char *t) {
   969                                  
   970 000002CD C9                       .retneqstr: LEAVE
   971 000002CE C3                       ret
   972                                  ENDP
   973                                  
   974                                  strcat1: PROC
   975                                  
   976                                  ;-166     while (*s != 0) s++;
   977                                  
   978                                  ;Function : strcat1, Number of local variables: 2
   979                                  ;   # type sign width addr used name   list of local variables
   980                                  ;  200 ptr sign byte   165 NULL s = bp+4
   981                                  ;  201 ptr sign byte   165 NULL t = bp+6;
   982 000002CF C8000000                 ENTER  0,0
   983                                  .strcat124:
   984 000002D3 8B5E04                   mov bx, [bp+4]
   985 000002D6 8A07                     mov al, [bx]
   986 000002D8 B400                     mov ah, 0
   987 000002DA 83F800                   cmp ax, 0
   988 000002DD 0F840500                 je  .strcat125
   989 000002E1 FF4604                   inc  word[bp+4]
   990                                  
   991                                  ;-167     strcpy(s, t);
   992                                  
   993 000002E4 EBED                     jmp .strcat124
   994                                  .strcat125:
   995 000002E6 FF7606                   push word [bp+6]
   996 000002E9 FF7604                   push word [bp+4]
   997 000002EC E85EFF                   call strcpy
   998 000002EF 83C404                   add  sp, 4
   999                                  
  1000                                  ;-168 }
  1001                                  
  1002                                  
  1003                                  ;-169 int toupper(char *s) {
  1004 000002F2 C9                       LEAVE
  1005 000002F3 C3                       ret
  1006                                  ENDP
  1007                                  
  1008                                  toupper: PROC
  1009                                  
  1010                                  ;-170     while(*s) {
  1011                                  
  1012                                  ;Function : toupper, Number of local variables: 1
  1013                                  ;   # type sign width addr used name   list of local variables
  1014                                  ;  200 ptr sign byte   169 NULL s = bp+4;
  1015 000002F4 C8000000                 ENTER  0,0
  1016                                  .toupper26:
  1017 000002F8 8B5E04                   mov bx, [bp+4]
  1018 000002FB 8A07                     mov al, [bx]
  1019 000002FD B400                     mov ah, 0
  1020 000002FF 08C0                     or  al, al
  1021 00000301 0F843000                 je .toupper27
  1022                                  
  1023                                  ;-171         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
  1024                                  
  1025 00000305 8B5E04                   mov bx, [bp+4]
  1026 00000308 8A07                     mov al, [bx]
  1027 0000030A B400                     mov ah, 0
  1028 0000030C 83F861                   cmp ax, 97 ;unsigned : 1
  1029 0000030F 0F8C1D00                 jl  .toupper28
  1030 00000313 8B5E04                   mov bx, [bp+4]
  1031 00000316 8A07                     mov al, [bx]
  1032 00000318 B400                     mov ah, 0
  1033 0000031A 83F87A                   cmp ax, 122
  1034 0000031D 0F8F0F00                 jg  .toupper29
  1035 00000321 8B5E04                   mov bx, [bp+4]
  1036 00000324 8A07                     mov al, [bx]
  1037 00000326 B400                     mov ah, 0
  1038 00000328 83E820                   sub ax, 32
  1039 0000032B 8B5E04                   mov  bx, [bp+4]
  1040 0000032E 8807                     mov  [bx], al
  1041                                  
  1042                                  ;-172         s++;
  1043                                  
  1044                                  .toupper29:
  1045                                  .toupper28:
  1046 00000330 FF4604                   inc  word[bp+4]
  1047                                  
  1048                                  ;-173     }
  1049                                  
  1050                                  
  1051                                  ;-174 }
  1052                                  
  1053 00000333 EBC3                     jmp .toupper26
  1054                                  .toupper27:
  1055                                  
  1056                                  ;-175 int instr1(char *s, char c) {
  1057 00000335 C9                       LEAVE
  1058 00000336 C3                       ret
  1059                                  ENDP
  1060                                  
  1061                                  instr1: PROC
  1062                                  
  1063                                  ;-176     while(*s) {
  1064                                  
  1065                                  ;Function : instr1, Number of local variables: 2
  1066                                  ;   # type sign width addr used name   list of local variables
  1067                                  ;  200 ptr sign byte   175 NULL s = bp+4
  1068                                  ;  201 var sign byte   175 NULL c = bp+6;
  1069 00000337 C8000000                 ENTER  0,0
  1070                                  .instr130:
  1071 0000033B 8B5E04                   mov bx, [bp+4]
  1072 0000033E 8A07                     mov al, [bx]
  1073 00000340 B400                     mov ah, 0
  1074 00000342 08C0                     or  al, al
  1075 00000344 0F841900                 je .instr131
  1076                                  
  1077                                  ;-177         if (*s==c) return 1;
  1078                                  
  1079 00000348 8B5E04                   mov bx, [bp+4]
  1080 0000034B 8A07                     mov al, [bx]
  1081 0000034D B400                     mov ah, 0
  1082 0000034F 3A4606                   cmp al, [bp+6]
  1083 00000352 0F850600                 jne .instr132
  1084 00000356 B80100                   mov ax, 1
  1085 00000359 E90B00                   jmp .retninstr1
  1086                                  
  1087                                  ;-178         s++;
  1088                                  
  1089                                  .instr132:
  1090 0000035C FF4604                   inc  word[bp+4]
  1091                                  
  1092                                  ;-179     }
  1093                                  
  1094                                  
  1095                                  ;-180     return 0;
  1096                                  
  1097 0000035F EBDA                     jmp .instr130
  1098                                  .instr131:
  1099 00000361 B80000                   mov ax, 0
  1100 00000364 E90000                   jmp .retninstr1
  1101                                  
  1102                                  ;-181 }
  1103                                  
  1104                                  
  1105                                  ;-182 
  1106                                  
  1107                                  
  1108                                  ;-183 
  1109                                  
  1110                                  
  1111                                  ;-184 int a(unsigned int i) { printName(i);//address
  1112                                  
  1113 00000367 C9                       .retninstr1: LEAVE
  1114 00000368 C3                       ret
  1115                                  ENDP
  1116                                  
  1117                                  a: PROC
  1118                                  ;Function : a, Number of local variables: 1
  1119                                  ;   # type sign width addr used name   list of local variables
  1120                                  ;  200 var unsg word   184 NULL i = bp+4;
  1121 00000369 C8000000                 ENTER  0,0
  1122 0000036D FF7604                   push word [bp+4]
  1123 00000370 E8D008                   call printName
  1124 00000373 83C402                   add  sp, 2
  1125                                  
  1126                                  ;-185 }
  1127                                  
  1128                                  
  1129                                  ;-186 int v(unsigned int i) {//value
  1130 00000376 C9                       LEAVE
  1131 00000377 C3                       ret
  1132                                  ENDP
  1133                                  
  1134                                  v: PROC
  1135                                  
  1136                                  ;-187     if (i < LSTART) prc('[');
  1137                                  
  1138                                  ;Function : v, Number of local variables: 1
  1139                                  ;   # type sign width addr used name   list of local variables
  1140                                  ;  200 var unsg word   186 NULL i = bp+4;
  1141 00000378 C8000000                 ENTER  0,0
  1142 0000037C 8B4604                   mov ax, [bp+4]
  1143 0000037F 3DC800                   cmp ax, 200
  1144 00000382 0F8D0800                 jge .v33
  1145 00000386 6A5B                     push 91
  1146 00000388 E85801                   call prc
  1147 0000038B 83C402                   add  sp, 2
  1148                                  
  1149                                  ;-188     printName(i);
  1150                                  
  1151                                  .v33:
  1152 0000038E FF7604                   push word [bp+4]
  1153 00000391 E8AF08                   call printName
  1154 00000394 83C402                   add  sp, 2
  1155                                  
  1156                                  ;-189     if (i < LSTART) prc(']');
  1157                                  
  1158 00000397 8B4604                   mov ax, [bp+4]
  1159 0000039A 3DC800                   cmp ax, 200
  1160 0000039D 0F8D0800                 jge .v34
  1161 000003A1 6A5D                     push 93
  1162 000003A3 E83D01                   call prc
  1163 000003A6 83C402                   add  sp, 2
  1164                                  
  1165                                  ;-190 }
  1166                                  
  1167                                  .v34:
  1168                                  
  1169                                  ;-191 int checknamelen() {
  1170 000003A9 C9                       LEAVE
  1171 000003AA C3                       ret
  1172                                  ENDP
  1173                                  
  1174                                  checknamelen: PROC
  1175                                  
  1176                                  ;-192     int i;
  1177                                  
  1178                                  
  1179                                  ;-193     i=strlen(symbol);
  1180                                  
  1181                                  ;Function : checknamelen, Number of local variables: 1
  1182                                  ;   # type sign width addr used name   list of local variables
  1183                                  ;  200 var sign word   192 NULL i = bp-2;
  1184 000003AB C8020000                 ENTER  2,0
  1185 000003AF 8D06BB69                 lea  ax, [symbol]
  1186 000003B3 50                       push ax
  1187 000003B4 E86EFE                   call strlen
  1188 000003B7 83C402                   add  sp, 2
  1189 000003BA 8946FE                   mov [bp-2], ax
  1190                                  
  1191                                  ;-194     if (i > IDLENMAX) error1("Item name is too long in characters)");
  1192                                  
  1193 000003BD 8B46FE                   mov ax, [bp-2]
  1194 000003C0 83F80F                   cmp ax, 15
  1195 000003C3 0F8E0900                 jle .checknamelen35
  1196 000003C7 68[D203]                 push checknamelen_0
  1197 000003CA E8D338                   call error1
  1198 000003CD 83C402                   add  sp, 2
  1199                                  
  1200                                  ;-195 }
  1201                                  
  1202                                  .checknamelen35:
  1203                                  
  1204                                  ;-196 
  1205                                  
  1206                                  
  1207                                  ;-197 int next() {
  1208 000003D0 C9                       LEAVE
  1209 000003D1 C3                       ret
  1210 000003D2 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1211 000003DB 20697320746F6F206C-
  1212 000003E4 6F6E6720696E206368-
  1213 000003ED 617261637465727329-
  1214 000003F6 00                 
  1215                                  ENDP
  1216                                  
  1217                                  next: PROC
  1218                                  
  1219                                  ;-198     char r;
  1220                                  
  1221                                  
  1222                                  ;-199     r = thechar;
  1223                                  
  1224                                  ;Function : next, Number of local variables: 1
  1225                                  ;   # type sign width addr used name   list of local variables
  1226                                  ;  200 var sign byte   198 NULL r = bp-2;
  1227 000003F7 C8020000                 ENTER  2,0
  1228 000003FB A0[2300]                 mov al, [thechar]
  1229 000003FE 8846FE                   mov [bp-2], al
  1230                                  
  1231                                  ;-200     globC=r;
  1232                                  
  1233 00000401 8A46FE                   mov al, [bp-2]
  1234 00000404 A2[2000]                 mov byte [globC], al
  1235                                  
  1236                                  ;-201     thechar = fgets1();
  1237                                  
  1238 00000407 E82537                   call fgets1
  1239 0000040A A2[2300]                 mov byte [thechar], al
  1240                                  
  1241                                  ;-202     return r;
  1242                                  
  1243 0000040D 8A46FE                   mov al, [bp-2]
  1244 00000410 E90000                   jmp .retnnext
  1245                                  
  1246                                  ;-203 }
  1247                                  
  1248                                  
  1249                                  ;-204 int istoken(int t) {
  1250                                  
  1251 00000413 C9                       .retnnext: LEAVE
  1252 00000414 C3                       ret
  1253                                  ENDP
  1254                                  
  1255                                  istoken: PROC
  1256                                  
  1257                                  ;-205     if (token == t) {
  1258                                  
  1259                                  ;Function : istoken, Number of local variables: 1
  1260                                  ;   # type sign width addr used name   list of local variables
  1261                                  ;  200 var sign word   204 NULL t = bp+4;
  1262 00000415 C8000000                 ENTER  0,0
  1263 00000419 A1[1E00]                 mov ax, [token]
  1264 0000041C 3B4604                   cmp ax, [bp+4]
  1265 0000041F 0F850C00                 jne .istoken36
  1266                                  
  1267                                  ;-206         token=getlex();
  1268                                  
  1269 00000423 E8032E                   call getlex
  1270 00000426 A3[1E00]                 mov word [token], ax
  1271                                  
  1272                                  ;-207         return 1;
  1273                                  
  1274 00000429 B80100                   mov ax, 1
  1275 0000042C E90600                   jmp .retnistoken
  1276                                  
  1277                                  ;-208     }
  1278                                  
  1279                                  
  1280                                  ;-209     return 0;
  1281                                  
  1282                                  .istoken36:
  1283 0000042F B80000                   mov ax, 0
  1284 00000432 E90000                   jmp .retnistoken
  1285                                  
  1286                                  ;-210 }
  1287                                  
  1288                                  
  1289                                  ;-211 int expect(int t) {
  1290                                  
  1291 00000435 C9                       .retnistoken: LEAVE
  1292 00000436 C3                       ret
  1293                                  ENDP
  1294                                  
  1295                                  expect: PROC
  1296                                  
  1297                                  ;-212     if (istoken(t)==0) {
  1298                                  
  1299                                  ;Function : expect, Number of local variables: 1
  1300                                  ;   # type sign width addr used name   list of local variables
  1301                                  ;  200 var sign word   211 NULL t = bp+4;
  1302 00000437 C8000000                 ENTER  0,0
  1303 0000043B FF7604                   push word [bp+4]
  1304 0000043E E8D4FF                   call istoken
  1305 00000441 83C402                   add  sp, 2
  1306 00000444 83F800                   cmp ax, 0
  1307 00000447 0F853200                 jne .expect37
  1308                                  
  1309                                  ;-213         *cloc=0;
  1310                                  
  1311 0000044B B80000                   mov ax, 0
  1312 0000044E 8B1E[1800]               mov  bx, [cloc]
  1313 00000452 8807                     mov  [bx], al
  1314                                  
  1315                                  ;-214         prs(co);
  1316                                  
  1317 00000454 8D06A861                 lea  ax, [co]
  1318 00000458 50                       push ax
  1319 00000459 E8EE00                   call prs
  1320 0000045C 83C402                   add  sp, 2
  1321                                  
  1322                                  ;-215         listproc();
  1323                                  
  1324 0000045F E80039                   call listproc
  1325                                  
  1326                                  ;-216         prs("\nExpected ASCII(dez): ");
  1327                                  
  1328 00000462 68[7F04]                 push expect_0
  1329 00000465 E8E200                   call prs
  1330 00000468 83C402                   add  sp, 2
  1331                                  
  1332                                  ;-217         pint1(t);
  1333                                  
  1334 0000046B FF7604                   push word [bp+4]
  1335 0000046E E8D001                   call pint1
  1336 00000471 83C402                   add  sp, 2
  1337                                  
  1338                                  ;-218         error1(" not found");
  1339                                  
  1340 00000474 68[9704]                 push expect_1
  1341 00000477 E82638                   call error1
  1342 0000047A 83C402                   add  sp, 2
  1343                                  
  1344                                  ;-219     }
  1345                                  
  1346                                  
  1347                                  ;-220 }
  1348                                  
  1349                                  .expect37:
  1350                                  
  1351                                  ;-221 
  1352                                  
  1353                                  
  1354                                  ;-222 int eprc(char c)  {
  1355 0000047D C9                       LEAVE
  1356 0000047E C3                       ret
  1357 0000047F 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  1358 00000488 642041534349492864-
  1359 00000491 657A293A2000       
  1360 00000497 206E6F7420666F756E-     expect_1 db " not found",0
  1361 000004A0 6400               
  1362                                  ENDP
  1363                                  
  1364                                  eprc: PROC
  1365                                  
  1366                                  ;-223     *cloc=c;
  1367                                  
  1368                                  ;Function : eprc, Number of local variables: 1
  1369                                  ;   # type sign width addr used name   list of local variables
  1370                                  ;  200 var sign byte   222 NULL c = bp+4;
  1371 000004A2 C8000000                 ENTER  0,0
  1372 000004A6 8A4604                   mov al, [bp+4]
  1373 000004A9 8B1E[1800]               mov  bx, [cloc]
  1374 000004AD 8807                     mov  [bx], al
  1375                                  
  1376                                  ;-224     cloc++;
  1377                                  
  1378 000004AF FF06[1800]               inc  word[cloc]
  1379                                  
  1380                                  ;-225 }
  1381                                  
  1382                                  
  1383                                  ;-226 int eprs(char *s) {
  1384 000004B3 C9                       LEAVE
  1385 000004B4 C3                       ret
  1386                                  ENDP
  1387                                  
  1388                                  eprs: PROC
  1389                                  
  1390                                  ;-227     char c;
  1391                                  
  1392                                  
  1393                                  ;-228     while(*s) {
  1394                                  
  1395                                  ;Function : eprs, Number of local variables: 2
  1396                                  ;   # type sign width addr used name   list of local variables
  1397                                  ;  200 ptr sign byte   226 NULL s = bp+4
  1398                                  ;  201 var sign byte   227 NULL c = bp-2;
  1399 000004B5 C8020000                 ENTER  2,0
  1400                                  .eprs38:
  1401 000004B9 8B5E04                   mov bx, [bp+4]
  1402 000004BC 8A07                     mov al, [bx]
  1403 000004BE B400                     mov ah, 0
  1404 000004C0 08C0                     or  al, al
  1405 000004C2 0F841B00                 je .eprs39
  1406                                  
  1407                                  ;-229         c=*s;
  1408                                  
  1409 000004C6 8B5E04                   mov bx, [bp+4]
  1410 000004C9 8A07                     mov al, [bx]
  1411 000004CB B400                     mov ah, 0
  1412 000004CD 8846FE                   mov [bp-2], al
  1413                                  
  1414                                  ;-230         eprc(c);
  1415                                  
  1416 000004D0 8A46FE                   mov al, byte [bp-2]
  1417 000004D3 B400                     mov ah, 0
  1418 000004D5 50                       push ax
  1419 000004D6 E8C9FF                   call eprc
  1420 000004D9 83C402                   add  sp, 2
  1421                                  
  1422                                  ;-231         s++;
  1423                                  
  1424 000004DC FF4604                   inc  word[bp+4]
  1425                                  
  1426                                  ;-232     }
  1427                                  
  1428                                  
  1429                                  ;-233 }
  1430                                  
  1431 000004DF EBD8                     jmp .eprs38
  1432                                  .eprs39:
  1433                                  
  1434                                  ;-234 int prc(unsigned char c) {
  1435 000004E1 C9                       LEAVE
  1436 000004E2 C3                       ret
  1437                                  ENDP
  1438                                  
  1439                                  prc: PROC
  1440                                  
  1441                                  ;-235     if (c==10) {
  1442                                  
  1443                                  ;Function : prc, Number of local variables: 1
  1444                                  ;   # type sign width addr used name   list of local variables
  1445                                  ;  200 var unsg byte   234 NULL c = bp+4;
  1446 000004E3 C8000000                 ENTER  0,0
  1447 000004E7 8A4604                   mov al, [bp+4]
  1448 000004EA 3C0A                     cmp al, 10
  1449 000004EC 0F850600                 jne .prc40
  1450                                  
  1451                                  ;-236         _AX=13;
  1452                                  
  1453 000004F0 B80D00                   mov  ax, 13
  1454                                  
  1455                                  ;-237         writetty();
  1456                                  
  1457 000004F3 E87FFB                   call writetty
  1458                                  
  1459                                  ;-238     }
  1460                                  
  1461                                  
  1462                                  ;-239     _AL=c;
  1463                                  
  1464                                  .prc40:
  1465 000004F6 8A4604                   mov  al, [bp+4]
  1466                                  
  1467                                  ;-240     writetty();
  1468                                  
  1469 000004F9 E879FB                   call writetty
  1470                                  
  1471                                  ;-241     fputcR(c, fdout);
  1472                                  
  1473 000004FC FF36[1C00]               push word [fdout]
  1474 00000500 8A4604                   mov al, byte [bp+4]
  1475 00000503 B400                     mov ah, 0
  1476 00000505 50                       push ax
  1477 00000506 E823FC                   call fputcR
  1478 00000509 83C404                   add  sp, 4
  1479                                  
  1480                                  ;-242 }
  1481                                  
  1482                                  
  1483                                  ;-243 int prscomment(unsigned char *s) {
  1484 0000050C C9                       LEAVE
  1485 0000050D C3                       ret
  1486                                  ENDP
  1487                                  
  1488                                  prscomment: PROC
  1489                                  
  1490                                  ;-244     unsigned char c;
  1491                                  
  1492                                  
  1493                                  ;-245     while(*s){
  1494                                  
  1495                                  ;Function : prscomment, Number of local variables: 2
  1496                                  ;   # type sign width addr used name   list of local variables
  1497                                  ;  200 ptr unsg byte   243 NULL s = bp+4
  1498                                  ;  201 var unsg byte   244 NULL c = bp-2;
  1499 0000050E C8020000                 ENTER  2,0
  1500                                  .prscomment41:
  1501 00000512 8B5E04                   mov bx, [bp+4]
  1502 00000515 8A07                     mov al, [bx]
  1503 00000517 B400                     mov ah, 0
  1504 00000519 08C0                     or  al, al
  1505 0000051B 0F841B00                 je .prscomment42
  1506                                  
  1507                                  ;-246         c=*s;
  1508                                  
  1509 0000051F 8B5E04                   mov bx, [bp+4]
  1510 00000522 8A07                     mov al, [bx]
  1511 00000524 B400                     mov ah, 0
  1512 00000526 8846FE                   mov [bp-2], al
  1513                                  
  1514                                  ;-247         prc(c);
  1515                                  
  1516 00000529 8A46FE                   mov al, byte [bp-2]
  1517 0000052C B400                     mov ah, 0
  1518 0000052E 50                       push ax
  1519 0000052F E8B1FF                   call prc
  1520 00000532 83C402                   add  sp, 2
  1521                                  
  1522                                  ;-248         s++;
  1523                                  
  1524 00000535 FF4604                   inc  word[bp+4]
  1525                                  
  1526                                  ;-249     }
  1527                                  
  1528                                  
  1529                                  ;-250 }
  1530                                  
  1531 00000538 EBD8                     jmp .prscomment41
  1532                                  .prscomment42:
  1533                                  
  1534                                  ;-251 int prnl() {
  1535 0000053A C9                       LEAVE
  1536 0000053B C3                       ret
  1537                                  ENDP
  1538                                  
  1539                                  prnl: PROC
  1540                                  
  1541                                  ;-252     prs("\n ");
  1542                                  
  1543 0000053C 68[4605]                 push prnl_0
  1544 0000053F E80800                   call prs
  1545 00000542 83C402                   add  sp, 2
  1546                                  
  1547                                  ;-253 }
  1548                                  
  1549                                  
  1550                                  ;-254 
  1551                                  
  1552                                  
  1553                                  ;-255 int prs(unsigned char *s) {
  1554                                  
  1555 00000545 C3                       ret
  1556 00000546 5C6E2000                prnl_0 db "\n ",0
  1557                                  ENDP
  1558                                  
  1559                                  prs: PROC
  1560                                  
  1561                                  ;-256     unsigned char c; int com;
  1562                                  
  1563                                  
  1564                                  ;-257     com=0;
  1565                                  
  1566                                  ;Function : prs, Number of local variables: 3
  1567                                  ;   # type sign width addr used name   list of local variables
  1568                                  ;  200 ptr unsg byte   255 NULL s = bp+4
  1569                                  ;  201 var unsg byte   256 NULL c = bp-2
  1570                                  ;  202 var sign word   256 NULL com = bp-4;
  1571 0000054A C8040000                 ENTER  4,0
  1572 0000054E B80000                   mov ax, 0
  1573 00000551 8946FC                   mov [bp-4], ax
  1574                                  
  1575                                  ;-258     while(*s) {
  1576                                  
  1577                                  .prs43:
  1578 00000554 8B5E04                   mov bx, [bp+4]
  1579 00000557 8A07                     mov al, [bx]
  1580 00000559 B400                     mov ah, 0
  1581 0000055B 08C0                     or  al, al
  1582 0000055D 0F847B00                 je .prs44
  1583                                  
  1584                                  ;-259         c=*s;
  1585                                  
  1586 00000561 8B5E04                   mov bx, [bp+4]
  1587 00000564 8A07                     mov al, [bx]
  1588 00000566 B400                     mov ah, 0
  1589 00000568 8846FE                   mov [bp-2], al
  1590                                  
  1591                                  ;-260         if (c==34) if (com) com=0;
  1592                                  
  1593 0000056B 8A46FE                   mov al, [bp-2]
  1594 0000056E 3C22                     cmp al, 34
  1595 00000570 0F851800                 jne .prs45
  1596 00000574 8B46FC                   mov ax, [bp-4]
  1597 00000577 08C0                     or  al, al
  1598 00000579 0F840900                 je .prs46
  1599 0000057D B80000                   mov ax, 0
  1600 00000580 8946FC                   mov [bp-4], ax
  1601                                  
  1602                                  ;-261                    else com=1;
  1603                                  
  1604 00000583 E90600                   jmp .prs47
  1605                                  .prs46:
  1606 00000586 B80100                   mov ax, 1
  1607 00000589 8946FC                   mov [bp-4], ax
  1608                                  
  1609                                  ;-262         if (c==92) {
  1610                                  
  1611                                  .prs47:
  1612                                  .prs45:
  1613 0000058C 8A46FE                   mov al, [bp-2]
  1614 0000058F 3C5C                     cmp al, 92
  1615 00000591 0F853500                 jne .prs48
  1616                                  
  1617                                  ;-263             if (com==0) {
  1618                                  
  1619 00000595 8B46FC                   mov ax, [bp-4]
  1620 00000598 83F800                   cmp ax, 0
  1621 0000059B 0F852B00                 jne .prs49
  1622                                  
  1623                                  ;-264                 s++;
  1624                                  
  1625 0000059F FF4604                   inc  word[bp+4]
  1626                                  
  1627                                  ;-265                 c=*s;
  1628                                  
  1629 000005A2 8B5E04                   mov bx, [bp+4]
  1630 000005A5 8A07                     mov al, [bx]
  1631 000005A7 B400                     mov ah, 0
  1632 000005A9 8846FE                   mov [bp-2], al
  1633                                  
  1634                                  ;-266                 if (c=='n') c=10;
  1635                                  
  1636 000005AC 8A46FE                   mov al, [bp-2]
  1637 000005AF 3C6E                     cmp al, 110
  1638 000005B1 0F850600                 jne .prs50
  1639 000005B5 B80A00                   mov ax, 10
  1640 000005B8 8846FE                   mov [bp-2], al
  1641                                  
  1642                                  ;-267                 if (c=='t') c= 9;
  1643                                  
  1644                                  .prs50:
  1645 000005BB 8A46FE                   mov al, [bp-2]
  1646 000005BE 3C74                     cmp al, 116
  1647 000005C0 0F850600                 jne .prs51
  1648 000005C4 B80900                   mov ax, 9
  1649 000005C7 8846FE                   mov [bp-2], al
  1650                                  
  1651                                  ;-268             }
  1652                                  
  1653                                  .prs51:
  1654                                  
  1655                                  ;-269         }
  1656                                  
  1657                                  .prs49:
  1658                                  
  1659                                  ;-270         prc(c);
  1660                                  
  1661                                  .prs48:
  1662 000005CA 8A46FE                   mov al, byte [bp-2]
  1663 000005CD B400                     mov ah, 0
  1664 000005CF 50                       push ax
  1665 000005D0 E810FF                   call prc
  1666 000005D3 83C402                   add  sp, 2
  1667                                  
  1668                                  ;-271         s++;
  1669                                  
  1670 000005D6 FF4604                   inc  word[bp+4]
  1671                                  
  1672                                  ;-272     }
  1673                                  
  1674                                  
  1675                                  ;-273 }
  1676                                  
  1677 000005D9 E978FF                   jmp .prs43
  1678                                  .prs44:
  1679                                  
  1680                                  ;-274 int eprnum(int n){//for docall1 procedure
  1681 000005DC C9                       LEAVE
  1682 000005DD C3                       ret
  1683                                  ENDP
  1684                                  
  1685                                  eprnum: PROC
  1686                                  
  1687                                  ;-275     int e;
  1688                                  
  1689                                  
  1690                                  ;-276     if(n<0) {
  1691                                  
  1692                                  ;Function : eprnum, Number of local variables: 2
  1693                                  ;   # type sign width addr used name   list of local variables
  1694                                  ;  200 var sign word   274 NULL n = bp+4
  1695                                  ;  201 var sign word   275 NULL e = bp-2;
  1696 000005DE C8020000                 ENTER  2,0
  1697 000005E2 8B4604                   mov ax, [bp+4]
  1698 000005E5 83F800                   cmp ax, 0
  1699 000005E8 0F8D1400                 jge .eprnum52
  1700                                  
  1701                                  ;-277         eprc('-');
  1702                                  
  1703 000005EC 6A2D                     push 45
  1704 000005EE E8B1FE                   call eprc
  1705 000005F1 83C402                   add  sp, 2
  1706                                  
  1707                                  ;-278         n=mkneg(n);
  1708                                  
  1709 000005F4 FF7604                   push word [bp+4]
  1710 000005F7 E8CBFA                   call mkneg
  1711 000005FA 83C402                   add  sp, 2
  1712 000005FD 894604                   mov [bp+4], ax
  1713                                  
  1714                                  ;-279     }
  1715                                  
  1716                                  
  1717                                  ;-280     if (n >= 10) {
  1718                                  
  1719                                  .eprnum52:
  1720 00000600 8B4604                   mov ax, [bp+4]
  1721 00000603 83F80A                   cmp ax, 10 ;unsigned : 1
  1722 00000606 0F8C1500                 jl  .eprnum53
  1723                                  
  1724                                  ;-281         e=n/10;
  1725                                  
  1726 0000060A 8B4604                   mov ax, [bp+4]
  1727 0000060D BB0A00                   mov bx, 10
  1728 00000610 99                       cwd
  1729 00000611 F7FB                     idiv bx
  1730 00000613 8946FE                   mov [bp-2], ax
  1731                                  
  1732                                  ;-282         eprnum(e);
  1733                                  
  1734 00000616 FF76FE                   push word [bp-2]
  1735 00000619 E8C2FF                   call eprnum
  1736 0000061C 83C402                   add  sp, 2
  1737                                  
  1738                                  ;-283     }
  1739                                  
  1740                                  
  1741                                  ;-284     n=n%10;
  1742                                  
  1743                                  .eprnum53:
  1744 0000061F 8B4604                   mov ax, [bp+4]
  1745 00000622 BB0A00                   mov bx, 10
  1746 00000625 99                       cwd
  1747 00000626 F7FB                     idiv bx
  1748 00000628 89D0                     mov ax, dx
  1749 0000062A 894604                   mov [bp+4], ax
  1750                                  
  1751                                  ;-285     n=n+'0';
  1752                                  
  1753 0000062D 8B4604                   mov ax, [bp+4]
  1754 00000630 83C030                   add ax, 48
  1755 00000633 894604                   mov [bp+4], ax
  1756                                  
  1757                                  ;-286     eprc(n);
  1758                                  
  1759 00000636 FF7604                   push word [bp+4]
  1760 00000639 E866FE                   call eprc
  1761 0000063C 83C402                   add  sp, 2
  1762                                  
  1763                                  ;-287 }
  1764                                  
  1765                                  
  1766                                  ;-288 int pint1 (int n){
  1767 0000063F C9                       LEAVE
  1768 00000640 C3                       ret
  1769                                  ENDP
  1770                                  
  1771                                  pint1: PROC
  1772                                  
  1773                                  ;-289     int e;
  1774                                  
  1775                                  
  1776                                  ;-290     if(n<0) {  prc('-');  n=mkneg(n); }
  1777                                  
  1778                                  ;Function : pint1, Number of local variables: 2
  1779                                  ;   # type sign width addr used name   list of local variables
  1780                                  ;  200 var sign word   288 NULL n = bp+4
  1781                                  ;  201 var sign word   289 NULL e = bp-2;
  1782 00000641 C8020000                 ENTER  2,0
  1783 00000645 8B4604                   mov ax, [bp+4]
  1784 00000648 83F800                   cmp ax, 0
  1785 0000064B 0F8D1400                 jge .pint154
  1786 0000064F 6A2D                     push 45
  1787 00000651 E88FFE                   call prc
  1788 00000654 83C402                   add  sp, 2
  1789 00000657 FF7604                   push word [bp+4]
  1790 0000065A E868FA                   call mkneg
  1791 0000065D 83C402                   add  sp, 2
  1792 00000660 894604                   mov [bp+4], ax
  1793                                  
  1794                                  ;-291     if (n >= 10) {
  1795                                  
  1796                                  .pint154:
  1797 00000663 8B4604                   mov ax, [bp+4]
  1798 00000666 83F80A                   cmp ax, 10 ;unsigned : 1
  1799 00000669 0F8C1500                 jl  .pint155
  1800                                  
  1801                                  ;-292         e=n/10;
  1802                                  
  1803 0000066D 8B4604                   mov ax, [bp+4]
  1804 00000670 BB0A00                   mov bx, 10
  1805 00000673 99                       cwd
  1806 00000674 F7FB                     idiv bx
  1807 00000676 8946FE                   mov [bp-2], ax
  1808                                  
  1809                                  ;-293         pint1(e);
  1810                                  
  1811 00000679 FF76FE                   push word [bp-2]
  1812 0000067C E8C2FF                   call pint1
  1813 0000067F 83C402                   add  sp, 2
  1814                                  
  1815                                  ;-294     }
  1816                                  
  1817                                  
  1818                                  ;-295     n=n%10;
  1819                                  
  1820                                  .pint155:
  1821 00000682 8B4604                   mov ax, [bp+4]
  1822 00000685 BB0A00                   mov bx, 10
  1823 00000688 99                       cwd
  1824 00000689 F7FB                     idiv bx
  1825 0000068B 89D0                     mov ax, dx
  1826 0000068D 894604                   mov [bp+4], ax
  1827                                  
  1828                                  ;-296     n += '0';
  1829                                  
  1830 00000690 83460430                 add  word[bp+4], 48
  1831                                  
  1832                                  ;-297     prc(n);
  1833                                  
  1834 00000694 FF7604                   push word [bp+4]
  1835 00000697 E849FE                   call prc
  1836 0000069A 83C402                   add  sp, 2
  1837                                  
  1838                                  ;-298 }
  1839                                  
  1840                                  
  1841                                  ;-299 int prunsign1(unsigned int n) {
  1842 0000069D C9                       LEAVE
  1843 0000069E C3                       ret
  1844                                  ENDP
  1845                                  
  1846                                  prunsign1: PROC
  1847                                  
  1848                                  ;-300     unsigned int e;
  1849                                  
  1850                                  
  1851                                  ;-301     if (n >= 10) {
  1852                                  
  1853                                  ;Function : prunsign1, Number of local variables: 2
  1854                                  ;   # type sign width addr used name   list of local variables
  1855                                  ;  200 var unsg word   299 NULL n = bp+4
  1856                                  ;  201 var unsg word   300 NULL e = bp-2;
  1857 0000069F C8020000                 ENTER  2,0
  1858 000006A3 8B4604                   mov ax, [bp+4]
  1859 000006A6 83F80A                   cmp ax, 10 ;unsigned : 0
  1860 000006A9 0F821700                 jb  .prunsign156
  1861                                  
  1862                                  ;-302         e=n/10;
  1863                                  
  1864 000006AD 8B4604                   mov ax, [bp+4]
  1865 000006B0 BB0A00                   mov bx, 10
  1866 000006B3 BA0000                   mov dx, 0
  1867 000006B6 F7F3                     div bx
  1868 000006B8 8946FE                   mov [bp-2], ax
  1869                                  
  1870                                  ;-303         prunsign1(e);
  1871                                  
  1872 000006BB FF76FE                   push word [bp-2]
  1873 000006BE E8DEFF                   call prunsign1
  1874 000006C1 83C402                   add  sp, 2
  1875                                  
  1876                                  ;-304     }
  1877                                  
  1878                                  
  1879                                  ;-305     n = n % 10; /*unsigned mod*/
  1880                                  
  1881                                  .prunsign156:
  1882 000006C4 8B4604                   mov ax, [bp+4]
  1883 000006C7 BB0A00                   mov bx, 10
  1884 000006CA BA0000                   mov dx, 0
  1885 000006CD F7F3                     div bx
  1886 000006CF 89D0                     mov ax, dx
  1887 000006D1 894604                   mov [bp+4], ax
  1888                                  
  1889                                  ;-306     n += '0';
  1890                                  
  1891 000006D4 83460430                 add  word[bp+4], 48
  1892                                  
  1893                                  ;-307     prc(n);
  1894                                  
  1895 000006D8 FF7604                   push word [bp+4]
  1896 000006DB E805FE                   call prc
  1897 000006DE 83C402                   add  sp, 2
  1898                                  
  1899                                  ;-308 }
  1900                                  
  1901                                  
  1902                                  ;-309 int printint51(unsigned int j)  {
  1903 000006E1 C9                       LEAVE
  1904 000006E2 C3                       ret
  1905                                  ENDP
  1906                                  
  1907                                  printint51: PROC
  1908                                  
  1909                                  ;-310     if (j<10000) prc(32);
  1910                                  
  1911                                  ;Function : printint51, Number of local variables: 1
  1912                                  ;   # type sign width addr used name   list of local variables
  1913                                  ;  200 var unsg word   309 NULL j = bp+4;
  1914 000006E3 C8000000                 ENTER  0,0
  1915 000006E7 8B4604                   mov ax, [bp+4]
  1916 000006EA 3D1027                   cmp ax, 10000
  1917 000006ED 0F8D0800                 jge .printint5157
  1918 000006F1 6A20                     push 32
  1919 000006F3 E8EDFD                   call prc
  1920 000006F6 83C402                   add  sp, 2
  1921                                  
  1922                                  ;-311     if (j<1000) prc(32);
  1923                                  
  1924                                  .printint5157:
  1925 000006F9 8B4604                   mov ax, [bp+4]
  1926 000006FC 3DE803                   cmp ax, 1000
  1927 000006FF 0F8D0800                 jge .printint5158
  1928 00000703 6A20                     push 32
  1929 00000705 E8DBFD                   call prc
  1930 00000708 83C402                   add  sp, 2
  1931                                  
  1932                                  ;-312     if (j<100) prc(32);
  1933                                  
  1934                                  .printint5158:
  1935 0000070B 8B4604                   mov ax, [bp+4]
  1936 0000070E 83F864                   cmp ax, 100
  1937 00000711 0F8D0800                 jge .printint5159
  1938 00000715 6A20                     push 32
  1939 00000717 E8C9FD                   call prc
  1940 0000071A 83C402                   add  sp, 2
  1941                                  
  1942                                  ;-313     if (j<10) prc(32);
  1943                                  
  1944                                  .printint5159:
  1945 0000071D 8B4604                   mov ax, [bp+4]
  1946 00000720 83F80A                   cmp ax, 10
  1947 00000723 0F8D0800                 jge .printint5160
  1948 00000727 6A20                     push 32
  1949 00000729 E8B7FD                   call prc
  1950 0000072C 83C402                   add  sp, 2
  1951                                  
  1952                                  ;-314     prunsign1(j);
  1953                                  
  1954                                  .printint5160:
  1955 0000072F FF7604                   push word [bp+4]
  1956 00000732 E86AFF                   call prunsign1
  1957 00000735 83C402                   add  sp, 2
  1958                                  
  1959                                  ;-315 }
  1960                                  
  1961                                  
  1962                                  ;-316 
  1963                                  
  1964                                  
  1965                                  ;-317 
  1966                                  
  1967                                  
  1968                                  ;-318 char doglobName[IDLENMAX];
  1969 00000738 C9                       LEAVE
  1970 00000739 C3                       ret
  1971                                  ENDP
  1972                                  section .bss
  1973                                  absolute 47391
  1974 0000B91F <res 0000000F>          doglobName resb 15
  1975                                  section .text
  1976                                  
  1977                                  ;-319 int doglob() {
  1978                                  
  1979                                  
  1980                                  doglob: PROC
  1981                                  
  1982                                  ;-320     int i; int j; int isstrarr; isstrarr=0;
  1983                                  
  1984                                  ;Function : doglob, Number of local variables: 3
  1985                                  ;   # type sign width addr used name   list of local variables
  1986                                  ;  200 var sign word   320 NULL i = bp-2
  1987                                  ;  201 var sign word   320 NULL j = bp-4
  1988                                  ;  202 var sign word   320 NULL isstrarr = bp-6;
  1989 0000073A C8060000                 ENTER  6,0
  1990 0000073E B80000                   mov ax, 0
  1991 00000741 8946FA                   mov [bp-6], ax
  1992                                  
  1993                                  ;-321   if (GTop >= LSTART) error1("Global table full");
  1994                                  
  1995 00000744 A1[2C00]                 mov ax, [GTop]
  1996 00000747 3DC800                   cmp ax, 200 ;unsigned : 1
  1997 0000074A 0F8C0900                 jl  .doglob61
  1998 0000074E 68[8F0A]                 push doglob_0
  1999 00000751 E84C35                   call error1
  2000 00000754 83C402                   add  sp, 2
  2001                                  
  2002                                  ;-322   if (iswidth == 0) error1("no VOID as var type");
  2003                                  
  2004                                  .doglob61:
  2005 00000757 A0[3A00]                 mov al, [iswidth]
  2006 0000075A 3C00                     cmp al, 0
  2007 0000075C 0F850900                 jne .doglob62
  2008 00000760 68[A10A]                 push doglob_1
  2009 00000763 E83A35                   call error1
  2010 00000766 83C402                   add  sp, 2
  2011                                  
  2012                                  ;-323   checknamelen();
  2013                                  
  2014                                  .doglob62:
  2015 00000769 E83FFC                   call checknamelen
  2016                                  
  2017                                  ;-324   if (checkName() != 0) error1("Variable already defined");
  2018                                  
  2019 0000076C E88305                   call checkName
  2020 0000076F 3C00                     cmp al, 0
  2021 00000771 0F840900                 je  .doglob63
  2022 00000775 68[B50A]                 push doglob_2
  2023 00000778 E82535                   call error1
  2024 0000077B 83C402                   add  sp, 2
  2025                                  
  2026                                  ;-325   if (istoken('[')) { istype='&';
  2027                                  
  2028                                  .doglob63:
  2029 0000077E 6A5B                     push 91
  2030 00000780 E892FC                   call istoken
  2031 00000783 83C402                   add  sp, 2
  2032 00000786 08C0                     or  al, al
  2033 00000788 0F84E201                 je .doglob64
  2034 0000078C B82600                   mov ax, 38
  2035 0000078F A2[3400]                 mov byte [istype], al
  2036                                  
  2037                                  ;-326     if (istoken(T_CONST)) {
  2038                                  
  2039 00000792 680101                   push 257
  2040 00000795 E87DFC                   call istoken
  2041 00000798 83C402                   add  sp, 2
  2042 0000079B 08C0                     or  al, al
  2043 0000079D 0F84C200                 je .doglob65
  2044                                  
  2045                                  ;-327       prs("\nsection .bss\nabsolute ");
  2046                                  
  2047 000007A1 68[CE0A]                 push doglob_3
  2048 000007A4 E8A3FD                   call prs
  2049 000007A7 83C402                   add  sp, 2
  2050                                  
  2051                                  ;-328       prunsign1(orgData);
  2052                                  
  2053 000007AA FF36[1200]               push word [orgData]
  2054 000007AE E8EEFE                   call prunsign1
  2055 000007B1 83C402                   add  sp, 2
  2056                                  
  2057                                  ;-329       prs("\n"); prs(symbol);
  2058                                  
  2059 000007B4 68[E80A]                 push doglob_4
  2060 000007B7 E890FD                   call prs
  2061 000007BA 83C402                   add  sp, 2
  2062 000007BD 8D06BB69                 lea  ax, [symbol]
  2063 000007C1 50                       push ax
  2064 000007C2 E885FD                   call prs
  2065 000007C5 83C402                   add  sp, 2
  2066                                  
  2067                                  ;-330       if (iswidth==1) prs(" resb ");
  2068                                  
  2069 000007C8 A0[3A00]                 mov al, [iswidth]
  2070 000007CB 3C01                     cmp al, 1
  2071 000007CD 0F850900                 jne .doglob66
  2072 000007D1 68[EB0A]                 push doglob_5
  2073 000007D4 E873FD                   call prs
  2074 000007D7 83C402                   add  sp, 2
  2075                                  
  2076                                  ;-331       if (iswidth==2) prs(" resw ");
  2077                                  
  2078                                  .doglob66:
  2079 000007DA A0[3A00]                 mov al, [iswidth]
  2080 000007DD 3C02                     cmp al, 2
  2081 000007DF 0F850900                 jne .doglob67
  2082 000007E3 68[F20A]                 push doglob_6
  2083 000007E6 E861FD                   call prs
  2084 000007E9 83C402                   add  sp, 2
  2085                                  
  2086                                  ;-332       if (iswidth==4) prs(" resd ");
  2087                                  
  2088                                  .doglob67:
  2089 000007EC A0[3A00]                 mov al, [iswidth]
  2090 000007EF 3C04                     cmp al, 4
  2091 000007F1 0F850900                 jne .doglob68
  2092 000007F5 68[F90A]                 push doglob_7
  2093 000007F8 E84FFD                   call prs
  2094 000007FB 83C402                   add  sp, 2
  2095                                  
  2096                                  ;-333       prunsign1(lexval);
  2097                                  
  2098                                  .doglob68:
  2099 000007FE FF36[3000]               push word [lexval]
  2100 00000802 E89AFE                   call prunsign1
  2101 00000805 83C402                   add  sp, 2
  2102                                  
  2103                                  ;-334       prs("\nsection .text");
  2104                                  
  2105 00000808 68[000B]                 push doglob_8
  2106 0000080B E83CFD                   call prs
  2107 0000080E 83C402                   add  sp, 2
  2108                                  
  2109                                  ;-335       orgData=orgData+lexval;
  2110                                  
  2111 00000811 A1[1200]                 mov ax, [orgData]
  2112 00000814 0306[3000]               add ax, [lexval]
  2113 00000818 A3[1200]                 mov word [orgData], ax
  2114                                  
  2115                                  ;-336       if (iswidth==2) orgData=orgData+lexval;
  2116                                  
  2117 0000081B A0[3A00]                 mov al, [iswidth]
  2118 0000081E 3C02                     cmp al, 2
  2119 00000820 0F850A00                 jne .doglob69
  2120 00000824 A1[1200]                 mov ax, [orgData]
  2121 00000827 0306[3000]               add ax, [lexval]
  2122 0000082B A3[1200]                 mov word [orgData], ax
  2123                                  
  2124                                  ;-337       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  2125                                  
  2126                                  .doglob69:
  2127 0000082E A0[3A00]                 mov al, [iswidth]
  2128 00000831 3C04                     cmp al, 4
  2129 00000833 0F851400                 jne .doglob70
  2130 00000837 A1[3000]                 mov ax, [lexval]
  2131 0000083A BB0300                   mov bx, 3
  2132 0000083D F7E3                     mul bx
  2133 0000083F 8946FE                   mov [bp-2], ax
  2134 00000842 A1[1200]                 mov ax, [orgData]
  2135 00000845 0346FE                   add ax, [bp-2]
  2136 00000848 A3[1200]                 mov word [orgData], ax
  2137                                  
  2138                                  ;-338       GData[GTop]=lexval; expect(']');
  2139                                  
  2140                                  .doglob70:
  2141 0000084B A1[3000]                 mov ax, [lexval]
  2142 0000084E 8B1E[2C00]               mov bx, [GTop]
  2143 00000852 D1E3                     shl bx, 1
  2144 00000854 89877B73                 mov [GData+bx], ax
  2145 00000858 6A5D                     push 93
  2146 0000085A E8DAFB                   call expect
  2147 0000085D 83C402                   add  sp, 2
  2148                                  
  2149                                  ;-339     }else { expect(']');
  2150                                  
  2151 00000860 E90801                   jmp .doglob71
  2152                                  .doglob65:
  2153 00000863 6A5D                     push 93
  2154 00000865 E8CFFB                   call expect
  2155 00000868 83C402                   add  sp, 2
  2156                                  
  2157                                  ;-340       if (iswidth != 1) error1("Only ByteArray allowed");
  2158                                  
  2159 0000086B A0[3A00]                 mov al, [iswidth]
  2160 0000086E 3C01                     cmp al, 1
  2161 00000870 0F840900                 je  .doglob72
  2162 00000874 68[100B]                 push doglob_9
  2163 00000877 E82634                   call error1
  2164 0000087A 83C402                   add  sp, 2
  2165                                  
  2166                                  ;-341       prs("\n"); prs(symbol); prs(" db ");
  2167                                  
  2168                                  .doglob72:
  2169 0000087D 68[270B]                 push doglob_10
  2170 00000880 E8C7FC                   call prs
  2171 00000883 83C402                   add  sp, 2
  2172 00000886 8D06BB69                 lea  ax, [symbol]
  2173 0000088A 50                       push ax
  2174 0000088B E8BCFC                   call prs
  2175 0000088E 83C402                   add  sp, 2
  2176 00000891 68[2A0B]                 push doglob_11
  2177 00000894 E8B3FC                   call prs
  2178 00000897 83C402                   add  sp, 2
  2179                                  
  2180                                  ;-342       isstrarr=1; strcpy(doglobName, symbol);
  2181                                  
  2182 0000089A B80100                   mov ax, 1
  2183 0000089D 8946FA                   mov [bp-6], ax
  2184 000008A0 8D06BB69                 lea  ax, [symbol]
  2185 000008A4 50                       push ax
  2186 000008A5 8D061FB9                 lea  ax, [doglobName]
  2187 000008A9 50                       push ax
  2188 000008AA E8A0F9                   call strcpy
  2189 000008AD 83C404                   add  sp, 4
  2190                                  
  2191                                  ;-343       expect('=');
  2192                                  
  2193 000008B0 6A3D                     push 61
  2194 000008B2 E882FB                   call expect
  2195 000008B5 83C402                   add  sp, 2
  2196                                  
  2197                                  ;-344       if (istoken(T_STRING)) {
  2198                                  
  2199 000008B8 680201                   push 258
  2200 000008BB E857FB                   call istoken
  2201 000008BE 83C402                   add  sp, 2
  2202 000008C1 08C0                     or  al, al
  2203 000008C3 0F844200                 je .doglob73
  2204                                  
  2205                                  ;-345         prc(34); prscomment(symbol); prc(34); prs(",0");
  2206                                  
  2207 000008C7 6A22                     push 34
  2208 000008C9 E817FC                   call prc
  2209 000008CC 83C402                   add  sp, 2
  2210 000008CF 8D06BB69                 lea  ax, [symbol]
  2211 000008D3 50                       push ax
  2212 000008D4 E837FC                   call prscomment
  2213 000008D7 83C402                   add  sp, 2
  2214 000008DA 6A22                     push 34
  2215 000008DC E804FC                   call prc
  2216 000008DF 83C402                   add  sp, 2
  2217 000008E2 68[2F0B]                 push doglob_12
  2218 000008E5 E862FC                   call prs
  2219 000008E8 83C402                   add  sp, 2
  2220                                  
  2221                                  ;-346         i=strlen(symbol); GData[GTop]=i; }
  2222                                  
  2223 000008EB 8D06BB69                 lea  ax, [symbol]
  2224 000008EF 50                       push ax
  2225 000008F0 E832F9                   call strlen
  2226 000008F3 83C402                   add  sp, 2
  2227 000008F6 8946FE                   mov [bp-2], ax
  2228 000008F9 8B46FE                   mov ax, [bp-2]
  2229 000008FC 8B1E[2C00]               mov bx, [GTop]
  2230 00000900 D1E3                     shl bx, 1
  2231 00000902 89877B73                 mov [GData+bx], ax
  2232                                  
  2233                                  ;-347       else if (istoken('{' )) { i=0;
  2234                                  
  2235 00000906 E96200                   jmp .doglob74
  2236                                  .doglob73:
  2237 00000909 6A7B                     push 123
  2238 0000090B E807FB                   call istoken
  2239 0000090E 83C402                   add  sp, 2
  2240 00000911 08C0                     or  al, al
  2241 00000913 0F844B00                 je .doglob75
  2242 00000917 B80000                   mov ax, 0
  2243 0000091A 8946FE                   mov [bp-2], ax
  2244                                  
  2245                                  ;-348         do { if(i) prc(',');
  2246                                  
  2247                                  .doglob76:
  2248 0000091D 8B46FE                   mov ax, [bp-2]
  2249 00000920 08C0                     or  al, al
  2250 00000922 0F840800                 je .doglob77
  2251 00000926 6A2C                     push 44
  2252 00000928 E8B8FB                   call prc
  2253 0000092B 83C402                   add  sp, 2
  2254                                  
  2255                                  ;-349           expect(T_CONST); prunsign1(lexval); i=1; }
  2256                                  
  2257                                  .doglob77:
  2258 0000092E 680101                   push 257
  2259 00000931 E803FB                   call expect
  2260 00000934 83C402                   add  sp, 2
  2261 00000937 FF36[3000]               push word [lexval]
  2262 0000093B E861FD                   call prunsign1
  2263 0000093E 83C402                   add  sp, 2
  2264 00000941 B80100                   mov ax, 1
  2265 00000944 8946FE                   mov [bp-2], ax
  2266                                  
  2267                                  ;-350         while (istoken(',')); expect('}'); }
  2268                                  
  2269 00000947 6A2C                     push 44
  2270 00000949 E8C9FA                   call istoken
  2271 0000094C 83C402                   add  sp, 2
  2272 0000094F 08C0                     or  al, al
  2273 00000951 0F840200                 je .doglob78
  2274 00000955 EBC6                     jmp .doglob76
  2275                                  .doglob78:
  2276 00000957 6A7D                     push 125
  2277 00000959 E8DBFA                   call expect
  2278 0000095C 83C402                   add  sp, 2
  2279                                  
  2280                                  ;-351       else error1("String or number array expected");
  2281                                  
  2282 0000095F E90900                   jmp .doglob79
  2283                                  .doglob75:
  2284 00000962 68[320B]                 push doglob_13
  2285 00000965 E83833                   call error1
  2286 00000968 83C402                   add  sp, 2
  2287                                  
  2288                                  ;-352       };
  2289                                  
  2290                                  .doglob79:
  2291                                  .doglob74:
  2292                                  .doglob71:
  2293                                  
  2294                                  ;-353   }else { //expect('=');
  2295                                  
  2296 0000096B E99E00                   jmp .doglob80
  2297                                  .doglob64:
  2298                                  
  2299                                  ;-354     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  2300                                  
  2301 0000096E 68[520B]                 push doglob_14
  2302 00000971 E8D6FB                   call prs
  2303 00000974 83C402                   add  sp, 2
  2304 00000977 8D06BB69                 lea  ax, [symbol]
  2305 0000097B 50                       push ax
  2306 0000097C E8CBFB                   call prs
  2307 0000097F 83C402                   add  sp, 2
  2308 00000982 A0[3400]                 mov al, [istype]
  2309 00000985 3C2A                     cmp al, 42
  2310 00000987 0F850C00                 jne .doglob81
  2311 0000098B 68[550B]                 push doglob_15
  2312 0000098E E8B9FB                   call prs
  2313 00000991 83C402                   add  sp, 2
  2314                                  
  2315                                  ;-355     else {
  2316                                  
  2317 00000994 E93300                   jmp .doglob82
  2318                                  .doglob81:
  2319                                  
  2320                                  ;-356       if      (iswidth==1) prs(" db ");
  2321                                  
  2322 00000997 A0[3A00]                 mov al, [iswidth]
  2323 0000099A 3C01                     cmp al, 1
  2324 0000099C 0F850C00                 jne .doglob83
  2325 000009A0 68[5A0B]                 push doglob_16
  2326 000009A3 E8A4FB                   call prs
  2327 000009A6 83C402                   add  sp, 2
  2328                                  
  2329                                  ;-357       else if (iswidth==2) prs(" dw ");
  2330                                  
  2331 000009A9 E91E00                   jmp .doglob84
  2332                                  .doglob83:
  2333 000009AC A0[3A00]                 mov al, [iswidth]
  2334 000009AF 3C02                     cmp al, 2
  2335 000009B1 0F850C00                 jne .doglob85
  2336 000009B5 68[5F0B]                 push doglob_17
  2337 000009B8 E88FFB                   call prs
  2338 000009BB 83C402                   add  sp, 2
  2339                                  
  2340                                  ;-358       else                 prs(" dd ");
  2341                                  
  2342 000009BE E90900                   jmp .doglob86
  2343                                  .doglob85:
  2344 000009C1 68[640B]                 push doglob_18
  2345 000009C4 E883FB                   call prs
  2346 000009C7 83C402                   add  sp, 2
  2347                                  
  2348                                  ;-359     }
  2349                                  
  2350                                  .doglob86:
  2351                                  .doglob84:
  2352                                  
  2353                                  ;-360     if(istoken('-')) prc('-');
  2354                                  
  2355                                  .doglob82:
  2356 000009CA 6A2D                     push 45
  2357 000009CC E846FA                   call istoken
  2358 000009CF 83C402                   add  sp, 2
  2359 000009D2 08C0                     or  al, al
  2360 000009D4 0F840800                 je .doglob87
  2361 000009D8 6A2D                     push 45
  2362 000009DA E806FB                   call prc
  2363 000009DD 83C402                   add  sp, 2
  2364                                  
  2365                                  ;-361     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  2366                                  
  2367                                  .doglob87:
  2368 000009E0 6A3D                     push 61
  2369 000009E2 E830FA                   call istoken
  2370 000009E5 83C402                   add  sp, 2
  2371 000009E8 08C0                     or  al, al
  2372 000009EA 0F841600                 je .doglob88
  2373 000009EE 680101                   push 257
  2374 000009F1 E843FA                   call expect
  2375 000009F4 83C402                   add  sp, 2
  2376 000009F7 FF36[3000]               push word [lexval]
  2377 000009FB E8A1FC                   call prunsign1
  2378 000009FE 83C402                   add  sp, 2
  2379                                  
  2380                                  ;-362     else prunsign1(0); }
  2381                                  
  2382 00000A01 E90800                   jmp .doglob89
  2383                                  .doglob88:
  2384 00000A04 6A00                     push 0
  2385 00000A06 E896FC                   call prunsign1
  2386 00000A09 83C402                   add  sp, 2
  2387                                  .doglob89:
  2388                                  
  2389                                  ;-363   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  2390                                  
  2391                                  .doglob80:
  2392 00000A0C A0[3700]                 mov al, [issign]
  2393 00000A0F 8B1E[2C00]               mov bx, [GTop]
  2394 00000A13 8887736C                 mov [GSign+bx], al
  2395 00000A17 A0[3A00]                 mov al, [iswidth]
  2396 00000A1A 8B1E[2C00]               mov bx, [GTop]
  2397 00000A1E 88879F6D                 mov [GWidth+bx], al
  2398 00000A22 A0[3400]                 mov al, [istype]
  2399 00000A25 8B1E[2C00]               mov bx, [GTop]
  2400 00000A29 8887476B                 mov [GType+bx], al
  2401                                  
  2402                                  ;-364   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  2403                                  
  2404 00000A2D A1[6800]                 mov ax, [lineno]
  2405 00000A30 83E801                   sub ax, 1
  2406 00000A33 8B1E[2C00]               mov bx, [GTop]
  2407 00000A37 D1E3                     shl bx, 1
  2408 00000A39 8987CB6E                 mov [GAdr+bx], ax
  2409 00000A3D B80000                   mov ax, 0
  2410 00000A40 8B1E[2C00]               mov bx, [GTop]
  2411 00000A44 D1E3                     shl bx, 1
  2412 00000A46 89872371                 mov [GUsed+bx], ax
  2413                                  
  2414                                  ;-365   pt=adrofname(GTop);
  2415                                  
  2416 00000A4A FF36[2C00]               push word [GTop]
  2417 00000A4E E8CF01                   call adrofname
  2418 00000A51 83C402                   add  sp, 2
  2419 00000A54 A3[6C00]                 mov word [pt], ax
  2420                                  
  2421                                  ;-366   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  2422                                  
  2423 00000A57 8B46FA                   mov ax, [bp-6]
  2424 00000A5A 08C0                     or  al, al
  2425 00000A5C 0F841200                 je .doglob90
  2426 00000A60 8D061FB9                 lea  ax, [doglobName]
  2427 00000A64 50                       push ax
  2428 00000A65 FF36[6C00]               push word [pt]
  2429 00000A69 E8E1F7                   call strcpy
  2430 00000A6C 83C404                   add  sp, 4
  2431 00000A6F E90F00                   jmp .doglob91
  2432                                  .doglob90:
  2433 00000A72 8D06BB69                 lea  ax, [symbol]
  2434 00000A76 50                       push ax
  2435 00000A77 FF36[6C00]               push word [pt]
  2436 00000A7B E8CFF7                   call strcpy
  2437 00000A7E 83C404                   add  sp, 4
  2438                                  
  2439                                  ;-367   GTop++; expect(';'); }
  2440                                  
  2441                                  .doglob91:
  2442 00000A81 FF06[2C00]               inc  word[GTop]
  2443 00000A85 6A3B                     push 59
  2444 00000A87 E8ADF9                   call expect
  2445 00000A8A 83C402                   add  sp, 2
  2446                                  
  2447                                  ;-368 
  2448                                  
  2449                                  
  2450                                  ;-369 int gettypes(int i) {int j; char c;
  2451 00000A8D C9                       LEAVE
  2452 00000A8E C3                       ret
  2453 00000A8F 476C6F62616C207461-     doglob_0 db "Global table full",0
  2454 00000A98 626C652066756C6C00 
  2455 00000AA1 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  2456 00000AAA 732076617220747970-
  2457 00000AB3 6500               
  2458 00000AB5 5661726961626C6520-     doglob_2 db "Variable already defined",0
  2459 00000ABE 616C72656164792064-
  2460 00000AC7 6566696E656400     
  2461 00000ACE 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  2462 00000AD7 202E6273735C6E6162-
  2463 00000AE0 736F6C7574652000   
  2464 00000AE8 5C6E00                  doglob_4 db "\n",0
  2465 00000AEB 20726573622000          doglob_5 db " resb ",0
  2466 00000AF2 20726573772000          doglob_6 db " resw ",0
  2467 00000AF9 20726573642000          doglob_7 db " resd ",0
  2468 00000B00 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  2469 00000B09 202E7465787400     
  2470 00000B10 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  2471 00000B19 417272617920616C6C-
  2472 00000B22 6F77656400         
  2473 00000B27 5C6E00                  doglob_10 db "\n",0
  2474 00000B2A 2064622000              doglob_11 db " db ",0
  2475 00000B2F 2C3000                  doglob_12 db ",0",0
  2476 00000B32 537472696E67206F72-     doglob_13 db "String or number array expected",0
  2477 00000B3B 206E756D6265722061-
  2478 00000B44 727261792065787065-
  2479 00000B4D 6374656400         
  2480 00000B52 5C6E00                  doglob_14 db "\n",0
  2481 00000B55 2064772000              doglob_15 db " dw ",0
  2482 00000B5A 2064622000              doglob_16 db " db ",0
  2483 00000B5F 2064772000              doglob_17 db " dw ",0
  2484 00000B64 2064642000              doglob_18 db " dd ",0
  2485                                  ENDP
  2486                                  
  2487                                  gettypes: PROC
  2488                                  
  2489                                  ;-370   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  2490                                  
  2491                                  ;Function : gettypes, Number of local variables: 3
  2492                                  ;   # type sign width addr used name   list of local variables
  2493                                  ;  200 var sign word   369 NULL i = bp+4
  2494                                  ;  201 var sign word   369 NULL j = bp-2
  2495                                  ;  202 var sign byte   369 NULL c = bp-4;
  2496 00000B69 C8040000                 ENTER  4,0
  2497 00000B6D 8B5E04                   mov bx, [bp+4]
  2498 00000B70 8A87736C                 mov al, [GSign + bx]
  2499 00000B74 8846FC                   mov [bp-4], al
  2500 00000B77 8A46FC                   mov al, [bp-4]
  2501 00000B7A 3C53                     cmp al, 83
  2502 00000B7C 0F850900                 jne .gettypes92
  2503 00000B80 B80100                   mov ax, 1
  2504 00000B83 A3[3500]                 mov word [signi], ax
  2505 00000B86 E90600                   jmp .gettypes93
  2506                                  .gettypes92:
  2507 00000B89 B80000                   mov ax, 0
  2508 00000B8C A3[3500]                 mov word [signi], ax
  2509                                  
  2510                                  ;-371   c=GWidth[i]; widthi=0;wi=0;
  2511                                  
  2512                                  .gettypes93:
  2513 00000B8F 8B5E04                   mov bx, [bp+4]
  2514 00000B92 8A879F6D                 mov al, [GWidth + bx]
  2515 00000B96 8846FC                   mov [bp-4], al
  2516 00000B99 B80000                   mov ax, 0
  2517 00000B9C A3[3800]                 mov word [widthi], ax
  2518 00000B9F B80000                   mov ax, 0
  2519 00000BA2 A3[3B00]                 mov word [wi], ax
  2520                                  
  2521                                  ;-372   if (c==1) {widthi=1;wi=1;}
  2522                                  
  2523 00000BA5 8A46FC                   mov al, [bp-4]
  2524 00000BA8 3C01                     cmp al, 1
  2525 00000BAA 0F850C00                 jne .gettypes94
  2526 00000BAE B80100                   mov ax, 1
  2527 00000BB1 A3[3800]                 mov word [widthi], ax
  2528 00000BB4 B80100                   mov ax, 1
  2529 00000BB7 A3[3B00]                 mov word [wi], ax
  2530                                  
  2531                                  ;-373   if (c==2) {widthi=2;wi=2;}
  2532                                  
  2533                                  .gettypes94:
  2534 00000BBA 8A46FC                   mov al, [bp-4]
  2535 00000BBD 3C02                     cmp al, 2
  2536 00000BBF 0F850C00                 jne .gettypes95
  2537 00000BC3 B80200                   mov ax, 2
  2538 00000BC6 A3[3800]                 mov word [widthi], ax
  2539 00000BC9 B80200                   mov ax, 2
  2540 00000BCC A3[3B00]                 mov word [wi], ax
  2541                                  
  2542                                  ;-374   if (c==4) {widthi=4;wi=4;}
  2543                                  
  2544                                  .gettypes95:
  2545 00000BCF 8A46FC                   mov al, [bp-4]
  2546 00000BD2 3C04                     cmp al, 4
  2547 00000BD4 0F850C00                 jne .gettypes96
  2548 00000BD8 B80400                   mov ax, 4
  2549 00000BDB A3[3800]                 mov word [widthi], ax
  2550 00000BDE B80400                   mov ax, 4
  2551 00000BE1 A3[3B00]                 mov word [wi], ax
  2552                                  
  2553                                  ;-375   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  2554                                  
  2555                                  .gettypes96:
  2556 00000BE4 8B5E04                   mov bx, [bp+4]
  2557 00000BE7 8A87476B                 mov al, [GType + bx]
  2558 00000BEB 8846FC                   mov [bp-4], al
  2559 00000BEE B80000                   mov ax, 0
  2560 00000BF1 A3[3200]                 mov word [typei], ax
  2561 00000BF4 8A46FC                   mov al, [bp-4]
  2562 00000BF7 3C2A                     cmp al, 42
  2563 00000BF9 0F850C00                 jne .gettypes97
  2564 00000BFD B80100                   mov ax, 1
  2565 00000C00 A3[3200]                 mov word [typei], ax
  2566 00000C03 B80200                   mov ax, 2
  2567 00000C06 A3[3B00]                 mov word [wi], ax
  2568                                  
  2569                                  ;-376   if (c=='&')  typei=2;
  2570                                  
  2571                                  .gettypes97:
  2572 00000C09 8A46FC                   mov al, [bp-4]
  2573 00000C0C 3C26                     cmp al, 38
  2574 00000C0E 0F850600                 jne .gettypes98
  2575 00000C12 B80200                   mov ax, 2
  2576 00000C15 A3[3200]                 mov word [typei], ax
  2577                                  
  2578                                  ;-377   return i; }
  2579                                  
  2580                                  .gettypes98:
  2581 00000C18 8B4604                   mov ax, [bp+4]
  2582 00000C1B E90000                   jmp .retngettypes
  2583                                  
  2584                                  ;-378 int adrofname(unsigned int i) { adrF(GNameField, i); }
  2585                                  
  2586 00000C1E C9                       .retngettypes: LEAVE
  2587 00000C1F C3                       ret
  2588                                  ENDP
  2589                                  
  2590                                  adrofname: PROC
  2591                                  ;Function : adrofname, Number of local variables: 1
  2592                                  ;   # type sign width addr used name   list of local variables
  2593                                  ;  200 var unsg word   378 NULL i = bp+4;
  2594 00000C20 C8000000                 ENTER  0,0
  2595 00000C24 FF7604                   push word [bp+4]
  2596 00000C27 8D06D375                 lea  ax, [GNameField]
  2597 00000C2B 50                       push ax
  2598 00000C2C E80500                   call adrF
  2599 00000C2F 83C404                   add  sp, 4
  2600                                  
  2601                                  ;-379 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  2602 00000C32 C9                       LEAVE
  2603 00000C33 C3                       ret
  2604                                  ENDP
  2605                                  
  2606                                  adrF: PROC
  2607                                  ;Function : adrF, Number of local variables: 2
  2608                                  ;   # type sign width addr used name   list of local variables
  2609                                  ;  200 ptr sign byte   379 NULL s = bp+4
  2610                                  ;  201 var unsg word   379 NULL i = bp+6;
  2611 00000C34 C8000000                 ENTER  0,0
  2612 00000C38 8B4606                   mov ax, [bp+6]
  2613 00000C3B C1E004                   shl ax, 4
  2614                                  
  2615                                  ;-380   __asm{ add ax, [bp+4]  ; offset s } }
  2616                                  
  2617 00000C3E 034604                   add ax, [bp+4]  ; offset s 
  2618                                  
  2619                                  ;-381 int printName(unsigned int i) {int j;
  2620 00000C41 C9                       LEAVE
  2621 00000C42 C3                       ret
  2622                                  ENDP
  2623                                  
  2624                                  printName: PROC
  2625                                  
  2626                                  ;-382   if (i < LSTART) { i=adrofname(i); prs(i); }
  2627                                  
  2628                                  ;Function : printName, Number of local variables: 2
  2629                                  ;   # type sign width addr used name   list of local variables
  2630                                  ;  200 var unsg word   381 NULL i = bp+4
  2631                                  ;  201 var sign word   381 NULL j = bp-2;
  2632 00000C43 C8020000                 ENTER  2,0
  2633 00000C47 8B4604                   mov ax, [bp+4]
  2634 00000C4A 3DC800                   cmp ax, 200
  2635 00000C4D 0F8D1800                 jge .printName99
  2636 00000C51 FF7604                   push word [bp+4]
  2637 00000C54 E8C9FF                   call adrofname
  2638 00000C57 83C402                   add  sp, 2
  2639 00000C5A 894604                   mov [bp+4], ax
  2640 00000C5D FF7604                   push word [bp+4]
  2641 00000C60 E8E7F8                   call prs
  2642 00000C63 83C402                   add  sp, 2
  2643                                  
  2644                                  ;-383   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  2645                                  
  2646 00000C66 E93800                   jmp .printName100
  2647                                  .printName99:
  2648 00000C69 68[A30C]                 push printName_0
  2649 00000C6C E8DBF8                   call prs
  2650 00000C6F 83C402                   add  sp, 2
  2651 00000C72 8B5E04                   mov bx, [bp+4]
  2652 00000C75 D1E3                     shl bx, 1
  2653 00000C77 8B877B73                 mov ax, [GData + bx]
  2654 00000C7B 8946FE                   mov [bp-2], ax
  2655 00000C7E 8B46FE                   mov ax, [bp-2]
  2656 00000C81 83F800                   cmp ax, 0
  2657 00000C84 0F8E0800                 jle .printName101
  2658 00000C88 6A2B                     push 43
  2659 00000C8A E856F8                   call prc
  2660 00000C8D 83C402                   add  sp, 2
  2661                                  .printName101:
  2662 00000C90 FF76FE                   push word [bp-2]
  2663 00000C93 E8ABF9                   call pint1
  2664 00000C96 83C402                   add  sp, 2
  2665 00000C99 6A5D                     push 93
  2666 00000C9B E845F8                   call prc
  2667 00000C9E 83C402                   add  sp, 2
  2668                                  
  2669                                  ;-384 }
  2670                                  
  2671                                  .printName100:
  2672                                  
  2673                                  ;-385 int searchname() { unsigned int i;
  2674 00000CA1 C9                       LEAVE
  2675 00000CA2 C3                       ret
  2676 00000CA3 5B627000                printName_0 db "[bp",0
  2677                                  ENDP
  2678                                  
  2679                                  searchname: PROC
  2680                                  
  2681                                  ;-386   i=checkName(); if (i == 0) error1("Variable unknown");
  2682                                  
  2683                                  ;Function : searchname, Number of local variables: 1
  2684                                  ;   # type sign width addr used name   list of local variables
  2685                                  ;  200 var unsg word   385 NULL i = bp-2;
  2686 00000CA7 C8020000                 ENTER  2,0
  2687 00000CAB E84400                   call checkName
  2688 00000CAE 8946FE                   mov [bp-2], ax
  2689 00000CB1 8B46FE                   mov ax, [bp-2]
  2690 00000CB4 83F800                   cmp ax, 0
  2691 00000CB7 0F850900                 jne .searchname102
  2692 00000CBB 68[E10C]                 push searchname_0
  2693 00000CBE E8DF2F                   call error1
  2694 00000CC1 83C402                   add  sp, 2
  2695                                  
  2696                                  ;-387   GUsed[i]=GUsed[i] + 1; return i;
  2697                                  
  2698                                  .searchname102:
  2699 00000CC4 8B5EFE                   mov bx, [bp-2]
  2700 00000CC7 D1E3                     shl bx, 1
  2701 00000CC9 8B872371                 mov ax, [GUsed + bx]
  2702 00000CCD 83C001                   add ax, 1
  2703 00000CD0 8B5EFE                   mov bx, [bp-2]
  2704 00000CD3 D1E3                     shl bx, 1
  2705 00000CD5 89872371                 mov [GUsed+bx], ax
  2706 00000CD9 8B46FE                   mov ax, [bp-2]
  2707 00000CDC E90000                   jmp .retnsearchname
  2708                                  
  2709                                  ;-388 }
  2710                                  
  2711                                  
  2712                                  ;-389 int checkName() { unsigned int i; unsigned int j;
  2713                                  
  2714 00000CDF C9                       .retnsearchname: LEAVE
  2715 00000CE0 C3                       ret
  2716 00000CE1 5661726961626C6520-     searchname_0 db "Variable unknown",0
  2717 00000CEA 756E6B6E6F776E00   
  2718                                  ENDP
  2719                                  
  2720                                  checkName: PROC
  2721                                  
  2722                                  ;-390   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2723                                  
  2724                                  ;Function : checkName, Number of local variables: 2
  2725                                  ;   # type sign width addr used name   list of local variables
  2726                                  ;  200 var unsg word   389 NULL i = bp-2
  2727                                  ;  201 var unsg word   389 NULL j = bp-4;
  2728 00000CF2 C8040000                 ENTER  4,0
  2729 00000CF6 B8C800                   mov ax, 200
  2730 00000CF9 8946FE                   mov [bp-2], ax
  2731                                  .checkName103:
  2732 00000CFC 8B46FE                   mov ax, [bp-2]
  2733 00000CFF 3B06[2E00]               cmp ax, [LTop]
  2734 00000D03 0F8D2B00                 jge .checkName104
  2735 00000D07 FF76FE                   push word [bp-2]
  2736 00000D0A E813FF                   call adrofname
  2737 00000D0D 83C402                   add  sp, 2
  2738 00000D10 8946FC                   mov [bp-4], ax
  2739 00000D13 FF76FC                   push word [bp-4]
  2740 00000D16 8D06BB69                 lea  ax, [symbol]
  2741 00000D1A 50                       push ax
  2742 00000D1B E865F5                   call eqstr
  2743 00000D1E 83C404                   add  sp, 4
  2744 00000D21 08C0                     or  al, al
  2745 00000D23 0F840600                 je .checkName105
  2746 00000D27 8B46FE                   mov ax, [bp-2]
  2747 00000D2A E94700                   jmp .retncheckName
  2748                                  .checkName105:
  2749 00000D2D FF46FE                   inc  word[bp-2]
  2750                                  
  2751                                  ;-391   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2752                                  
  2753 00000D30 EBCA                     jmp .checkName103
  2754                                  .checkName104:
  2755 00000D32 B80100                   mov ax, 1
  2756 00000D35 8946FE                   mov [bp-2], ax
  2757                                  .checkName106:
  2758 00000D38 8B46FE                   mov ax, [bp-2]
  2759 00000D3B 3B06[2C00]               cmp ax, [GTop]
  2760 00000D3F 0F8D2B00                 jge .checkName107
  2761 00000D43 FF76FE                   push word [bp-2]
  2762 00000D46 E8D7FE                   call adrofname
  2763 00000D49 83C402                   add  sp, 2
  2764 00000D4C 8946FC                   mov [bp-4], ax
  2765 00000D4F FF76FC                   push word [bp-4]
  2766 00000D52 8D06BB69                 lea  ax, [symbol]
  2767 00000D56 50                       push ax
  2768 00000D57 E829F5                   call eqstr
  2769 00000D5A 83C404                   add  sp, 4
  2770 00000D5D 08C0                     or  al, al
  2771 00000D5F 0F840600                 je .checkName108
  2772 00000D63 8B46FE                   mov ax, [bp-2]
  2773 00000D66 E90B00                   jmp .retncheckName
  2774                                  .checkName108:
  2775 00000D69 FF46FE                   inc  word[bp-2]
  2776                                  
  2777                                  ;-392   return 0;
  2778                                  
  2779 00000D6C EBCA                     jmp .checkName106
  2780                                  .checkName107:
  2781 00000D6E B80000                   mov ax, 0
  2782 00000D71 E90000                   jmp .retncheckName
  2783                                  
  2784                                  ;-393 }
  2785                                  
  2786                                  
  2787                                  ;-394 int typeName() { int m; //0=V,1=*,2=&
  2788                                  
  2789 00000D74 C9                       .retncheckName: LEAVE
  2790 00000D75 C3                       ret
  2791                                  ENDP
  2792                                  
  2793                                  typeName: PROC
  2794                                  
  2795                                  ;-395     issign='S';
  2796                                  
  2797                                  ;Function : typeName, Number of local variables: 1
  2798                                  ;   # type sign width addr used name   list of local variables
  2799                                  ;  200 var sign word   394 NULL m = bp-2;
  2800 00000D76 C8020000                 ENTER  2,0
  2801 00000D7A B85300                   mov ax, 83
  2802 00000D7D A2[3700]                 mov byte [issign], al
  2803                                  
  2804                                  ;-396     if(istoken(T_SIGNED))   issign='S';
  2805                                  
  2806 00000D80 681302                   push 531
  2807 00000D83 E88FF6                   call istoken
  2808 00000D86 83C402                   add  sp, 2
  2809 00000D89 08C0                     or  al, al
  2810 00000D8B 0F840600                 je .typeName109
  2811 00000D8F B85300                   mov ax, 83
  2812 00000D92 A2[3700]                 mov byte [issign], al
  2813                                  
  2814                                  ;-397     if(istoken(T_UNSIGNED)) issign='U';
  2815                                  
  2816                                  .typeName109:
  2817 00000D95 681402                   push 532
  2818 00000D98 E87AF6                   call istoken
  2819 00000D9B 83C402                   add  sp, 2
  2820 00000D9E 08C0                     or  al, al
  2821 00000DA0 0F840600                 je .typeName110
  2822 00000DA4 B85500                   mov ax, 85
  2823 00000DA7 A2[3700]                 mov byte [issign], al
  2824                                  
  2825                                  ;-398     iswidth=2;
  2826                                  
  2827                                  .typeName110:
  2828 00000DAA B80200                   mov ax, 2
  2829 00000DAD A2[3A00]                 mov byte [iswidth], al
  2830                                  
  2831                                  ;-399     if(istoken(T_VOID))     iswidth=0;
  2832                                  
  2833 00000DB0 681102                   push 529
  2834 00000DB3 E85FF6                   call istoken
  2835 00000DB6 83C402                   add  sp, 2
  2836 00000DB9 08C0                     or  al, al
  2837 00000DBB 0F840600                 je .typeName111
  2838 00000DBF B80000                   mov ax, 0
  2839 00000DC2 A2[3A00]                 mov byte [iswidth], al
  2840                                  
  2841                                  ;-400     if(istoken(T_CHAR))     iswidth=1;
  2842                                  
  2843                                  .typeName111:
  2844 00000DC5 681202                   push 530
  2845 00000DC8 E84AF6                   call istoken
  2846 00000DCB 83C402                   add  sp, 2
  2847 00000DCE 08C0                     or  al, al
  2848 00000DD0 0F840600                 je .typeName112
  2849 00000DD4 B80100                   mov ax, 1
  2850 00000DD7 A2[3A00]                 mov byte [iswidth], al
  2851                                  
  2852                                  ;-401     if(istoken(T_INT))      iswidth=2;
  2853                                  
  2854                                  .typeName112:
  2855 00000DDA 680502                   push 517
  2856 00000DDD E835F6                   call istoken
  2857 00000DE0 83C402                   add  sp, 2
  2858 00000DE3 08C0                     or  al, al
  2859 00000DE5 0F840600                 je .typeName113
  2860 00000DE9 B80200                   mov ax, 2
  2861 00000DEC A2[3A00]                 mov byte [iswidth], al
  2862                                  
  2863                                  ;-402     if(istoken(T_LONG))     iswidth=4;
  2864                                  
  2865                                  .typeName113:
  2866 00000DEF 681502                   push 533
  2867 00000DF2 E820F6                   call istoken
  2868 00000DF5 83C402                   add  sp, 2
  2869 00000DF8 08C0                     or  al, al
  2870 00000DFA 0F840600                 je .typeName114
  2871 00000DFE B80400                   mov ax, 4
  2872 00000E01 A2[3A00]                 mov byte [iswidth], al
  2873                                  
  2874                                  ;-403     istype='V';
  2875                                  
  2876                                  .typeName114:
  2877 00000E04 B85600                   mov ax, 86
  2878 00000E07 A2[3400]                 mov byte [istype], al
  2879                                  
  2880                                  ;-404     m=0;
  2881                                  
  2882 00000E0A B80000                   mov ax, 0
  2883 00000E0D 8946FE                   mov [bp-2], ax
  2884                                  
  2885                                  ;-405     if(istoken('*'))  {istype='*'; m=1;}
  2886                                  
  2887 00000E10 6A2A                     push 42
  2888 00000E12 E800F6                   call istoken
  2889 00000E15 83C402                   add  sp, 2
  2890 00000E18 08C0                     or  al, al
  2891 00000E1A 0F840C00                 je .typeName115
  2892 00000E1E B82A00                   mov ax, 42
  2893 00000E21 A2[3400]                 mov byte [istype], al
  2894 00000E24 B80100                   mov ax, 1
  2895 00000E27 8946FE                   mov [bp-2], ax
  2896                                  
  2897                                  ;-406     if(istoken('&'))  {istype='&'; m=2;}
  2898                                  
  2899                                  .typeName115:
  2900 00000E2A 6A26                     push 38
  2901 00000E2C E8E6F5                   call istoken
  2902 00000E2F 83C402                   add  sp, 2
  2903 00000E32 08C0                     or  al, al
  2904 00000E34 0F840C00                 je .typeName116
  2905 00000E38 B82600                   mov ax, 38
  2906 00000E3B A2[3400]                 mov byte [istype], al
  2907 00000E3E B80200                   mov ax, 2
  2908 00000E41 8946FE                   mov [bp-2], ax
  2909                                  
  2910                                  ;-407     name1();
  2911                                  
  2912                                  .typeName116:
  2913 00000E44 E80800                   call name1
  2914                                  
  2915                                  ;-408     return m;
  2916                                  
  2917 00000E47 8B46FE                   mov ax, [bp-2]
  2918 00000E4A E90000                   jmp .retntypeName
  2919                                  
  2920                                  ;-409 }
  2921                                  
  2922                                  
  2923                                  ;-410 int name1() {
  2924                                  
  2925 00000E4D C9                       .retntypeName: LEAVE
  2926 00000E4E C3                       ret
  2927                                  ENDP
  2928                                  
  2929                                  name1: PROC
  2930                                  
  2931                                  ;-411     if (token!=T_NAME) error1("Name expected");
  2932                                  
  2933 00000E4F A1[1E00]                 mov ax, [token]
  2934 00000E52 3D0001                   cmp ax, 256
  2935 00000E55 0F840900                 je  .name1117
  2936 00000E59 68[690E]                 push name1_0
  2937 00000E5C E8412E                   call error1
  2938 00000E5F 83C402                   add  sp, 2
  2939                                  
  2940                                  ;-412     token=getlex();
  2941                                  
  2942                                  .name1117:
  2943 00000E62 E8C423                   call getlex
  2944 00000E65 A3[1E00]                 mov word [token], ax
  2945                                  
  2946                                  ;-413 }
  2947                                  
  2948                                  
  2949                                  ;-414 
  2950                                  
  2951                                  
  2952                                  ;-415 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2953                                  
  2954 00000E68 C3                       ret
  2955 00000E69 4E616D652065787065-     name1_0 db "Name expected",0
  2956 00000E72 6374656400         
  2957                                  ENDP
  2958                                  
  2959                                  storecall: PROC
  2960                                  ;Function : storecall, Number of local variables: 1
  2961                                  ;   # type sign width addr used name   list of local variables
  2962                                  ;  200 var sign word   415 NULL i = bp-2;
  2963 00000E77 C8020000                 ENTER  2,0
  2964 00000E7B A1[3F00]                 mov ax, [CTop]
  2965 00000E7E 3DD007                   cmp ax, 2000 ;unsigned : 1
  2966 00000E81 0F8C0900                 jl  .storecall118
  2967 00000E85 68[E90E]                 push storecall_0
  2968 00000E88 E8152E                   call error1
  2969 00000E8B 83C402                   add  sp, 2
  2970                                  
  2971                                  ;-416   if (CNameTop >= 65468) error1("Call name table fuill");
  2972                                  
  2973                                  .storecall118:
  2974 00000E8E A1[6200]                 mov ax, [CNameTop]
  2975 00000E91 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2976 00000E94 0F820900                 jb  .storecall119
  2977 00000E98 68[F90E]                 push storecall_1
  2978 00000E9B E8022E                   call error1
  2979 00000E9E 83C402                   add  sp, 2
  2980                                  
  2981                                  ;-417     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2982                                  
  2983                                  .storecall119:
  2984 00000EA1 B80000                   mov ax, 0
  2985 00000EA4 8B1E[3F00]               mov bx, [CTop]
  2986 00000EA8 8887BF89                 mov [CType+bx], al
  2987 00000EAC A1[6200]                 mov ax, [CNameTop]
  2988 00000EAF 8B1E[3F00]               mov bx, [CTop]
  2989 00000EB3 D1E3                     shl bx, 1
  2990 00000EB5 8987E793                 mov [CAdr+bx], ax
  2991 00000EB9 8D06BB69                 lea  ax, [symbol]
  2992 00000EBD 50                       push ax
  2993 00000EBE E864F3                   call strlen
  2994 00000EC1 83C402                   add  sp, 2
  2995 00000EC4 8946FE                   mov [bp-2], ax
  2996                                  
  2997                                  ;-418     to_far(CNameTop, symbol);
  2998                                  
  2999 00000EC7 8D06BB69                 lea  ax, [symbol]
  3000 00000ECB 50                       push ax
  3001 00000ECC FF36[6200]               push word [CNameTop]
  3002 00000ED0 E8023D                   call to_far
  3003 00000ED3 83C404                   add  sp, 4
  3004                                  
  3005                                  ;-419     CNameTop=CNameTop+i; CNameTop++; CTop++;
  3006                                  
  3007 00000ED6 A1[6200]                 mov ax, [CNameTop]
  3008 00000ED9 0346FE                   add ax, [bp-2]
  3009 00000EDC A3[6200]                 mov word [CNameTop], ax
  3010 00000EDF FF06[6200]               inc  word[CNameTop]
  3011 00000EE3 FF06[3F00]               inc  word[CTop]
  3012                                  
  3013                                  ;-420 }
  3014                                  
  3015                                  
  3016                                  ;-421 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  3017 00000EE7 C9                       LEAVE
  3018 00000EE8 C3                       ret
  3019 00000EE9 43616C6C207461626C-     storecall_0 db "Call table full",0
  3020 00000EF2 652066756C6C00     
  3021 00000EF9 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  3022 00000F02 207461626C65206675-
  3023 00000F0B 696C6C00           
  3024                                  ENDP
  3025                                  
  3026                                  storefunc: PROC
  3027 00000F0F A1[3D00]                 mov ax, [FTop]
  3028 00000F12 3D2C01                   cmp ax, 300 ;unsigned : 1
  3029 00000F15 0F8C0900                 jl  .storefunc120
  3030 00000F19 68[700F]                 push storefunc_0
  3031 00000F1C E8812D                   call error1
  3032 00000F1F 83C402                   add  sp, 2
  3033                                  
  3034                                  ;-422     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3035                                  
  3036                                  .storefunc120:
  3037 00000F22 A1[6800]                 mov ax, [lineno]
  3038 00000F25 83E801                   sub ax, 1
  3039 00000F28 8B1E[3D00]               mov bx, [FTop]
  3040 00000F2C D1E3                     shl bx, 1
  3041 00000F2E 89878F91                 mov [FAdr+bx], ax
  3042 00000F32 B80000                   mov ax, 0
  3043 00000F35 8B1E[3D00]               mov bx, [FTop]
  3044 00000F39 D1E3                     shl bx, 1
  3045 00000F3B 898787A3                 mov [FCalls+bx], ax
  3046 00000F3F A0[3A00]                 mov al, [iswidth]
  3047 00000F42 8B1E[3D00]               mov bx, [FTop]
  3048 00000F46 88879388                 mov [FType+bx], al
  3049                                  
  3050                                  ;-423     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3051                                  
  3052 00000F4A FF36[3D00]               push word [FTop]
  3053 00000F4E 8D06DFA5                 lea  ax, [FNameField]
  3054 00000F52 50                       push ax
  3055 00000F53 E8DEFC                   call adrF
  3056 00000F56 83C404                   add  sp, 4
  3057 00000F59 A3[6C00]                 mov word [pt], ax
  3058 00000F5C 8D06BB69                 lea  ax, [symbol]
  3059 00000F60 50                       push ax
  3060 00000F61 FF36[6C00]               push word [pt]
  3061 00000F65 E8E5F2                   call strcpy
  3062 00000F68 83C404                   add  sp, 4
  3063 00000F6B FF06[3D00]               inc  word[FTop]
  3064                                  
  3065                                  ;-424 }
  3066                                  
  3067                                  
  3068                                  ;-425 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3069                                  
  3070 00000F6F C3                       ret
  3071 00000F70 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  3072 00000F79 7461626C652066756C-
  3073 00000F82 6C00               
  3074                                  ENDP
  3075                                  
  3076                                  addlocal: PROC
  3077 00000F84 A1[2E00]                 mov ax, [LTop]
  3078 00000F87 3D2C01                   cmp ax, 300 ;unsigned : 1
  3079 00000F8A 0F8C0900                 jl  .addlocal121
  3080 00000F8E 68[0A10]                 push addlocal_0
  3081 00000F91 E80C2D                   call error1
  3082 00000F94 83C402                   add  sp, 2
  3083                                  
  3084                                  ;-426   if (checkName() != 0) error1("Variable already defined");
  3085                                  
  3086                                  .addlocal121:
  3087 00000F97 E858FD                   call checkName
  3088 00000F9A 83F800                   cmp ax, 0
  3089 00000F9D 0F840900                 je  .addlocal122
  3090 00000FA1 68[2410]                 push addlocal_1
  3091 00000FA4 E8F92C                   call error1
  3092 00000FA7 83C402                   add  sp, 2
  3093                                  
  3094                                  ;-427   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3095                                  
  3096                                  .addlocal122:
  3097 00000FAA A0[3700]                 mov al, [issign]
  3098 00000FAD 8B1E[2E00]               mov bx, [LTop]
  3099 00000FB1 8887736C                 mov [GSign+bx], al
  3100 00000FB5 A0[3A00]                 mov al, [iswidth]
  3101 00000FB8 8B1E[2E00]               mov bx, [LTop]
  3102 00000FBC 88879F6D                 mov [GWidth+bx], al
  3103 00000FC0 A0[3400]                 mov al, [istype]
  3104 00000FC3 8B1E[2E00]               mov bx, [LTop]
  3105 00000FC7 8887476B                 mov [GType+bx], al
  3106                                  
  3107                                  ;-428   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3108                                  
  3109 00000FCB A1[6800]                 mov ax, [lineno]
  3110 00000FCE 83E801                   sub ax, 1
  3111 00000FD1 8B1E[2E00]               mov bx, [LTop]
  3112 00000FD5 D1E3                     shl bx, 1
  3113 00000FD7 8987CB6E                 mov [GAdr+bx], ax
  3114 00000FDB B80000                   mov ax, 0
  3115 00000FDE 8B1E[2E00]               mov bx, [LTop]
  3116 00000FE2 D1E3                     shl bx, 1
  3117 00000FE4 89872371                 mov [GUsed+bx], ax
  3118                                  
  3119                                  ;-429   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3120                                  
  3121 00000FE8 FF36[2E00]               push word [LTop]
  3122 00000FEC 8D06D375                 lea  ax, [GNameField]
  3123 00000FF0 50                       push ax
  3124 00000FF1 E840FC                   call adrF
  3125 00000FF4 83C404                   add  sp, 4
  3126 00000FF7 A3[6C00]                 mov word [pt], ax
  3127 00000FFA 8D06BB69                 lea  ax, [symbol]
  3128 00000FFE 50                       push ax
  3129 00000FFF FF36[6C00]               push word [pt]
  3130 00001003 E847F2                   call strcpy
  3131 00001006 83C404                   add  sp, 4
  3132                                  
  3133                                  ;-430 }
  3134                                  
  3135                                  
  3136                                  ;-431 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3137                                  
  3138 00001009 C3                       ret
  3139 0000100A 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3140 00001013 6961626C6520746162-
  3141 0000101C 6C652066756C6C00   
  3142 00001024 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3143 0000102D 616C72656164792064-
  3144 00001036 6566696E656400     
  3145                                  ENDP
  3146                                  
  3147                                  checkFunction: PROC
  3148                                  ;Function : checkFunction, Number of local variables: 2
  3149                                  ;   # type sign width addr used name   list of local variables
  3150                                  ;  200 var unsg word   431 NULL i = bp-2
  3151                                  ;  201 var unsg word   431 NULL j = bp-4;
  3152 0000103D C8040000                 ENTER  4,0
  3153 00001041 B80000                   mov ax, 0
  3154 00001044 8946FE                   mov [bp-2], ax
  3155                                  
  3156                                  ;-432   while (i < FTop) {
  3157                                  
  3158                                  .checkFunction123:
  3159 00001047 8B46FE                   mov ax, [bp-2]
  3160 0000104A 3B06[3D00]               cmp ax, [FTop]
  3161 0000104E 0F8D3000                 jge .checkFunction124
  3162                                  
  3163                                  ;-433     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3164                                  
  3165 00001052 FF76FE                   push word [bp-2]
  3166 00001055 8D06DFA5                 lea  ax, [FNameField]
  3167 00001059 50                       push ax
  3168 0000105A E8D7FB                   call adrF
  3169 0000105D 83C404                   add  sp, 4
  3170 00001060 8946FC                   mov [bp-4], ax
  3171 00001063 FF76FC                   push word [bp-4]
  3172 00001066 8D06BB69                 lea  ax, [symbol]
  3173 0000106A 50                       push ax
  3174 0000106B E815F2                   call eqstr
  3175 0000106E 83C404                   add  sp, 4
  3176 00001071 08C0                     or  al, al
  3177 00001073 0F840600                 je .checkFunction125
  3178 00001077 8B46FE                   mov ax, [bp-2]
  3179 0000107A E90B00                   jmp .retncheckFunction
  3180                                  .checkFunction125:
  3181 0000107D FF46FE                   inc  word[bp-2]
  3182                                  
  3183                                  ;-434   return 0; }
  3184                                  
  3185 00001080 EBC5                     jmp .checkFunction123
  3186                                  .checkFunction124:
  3187 00001082 B80000                   mov ax, 0
  3188 00001085 E90000                   jmp .retncheckFunction
  3189                                  
  3190                                  ;-435 int dofunc() { int nloc; int i; int narg;
  3191                                  
  3192 00001088 C9                       .retncheckFunction: LEAVE
  3193 00001089 C3                       ret
  3194                                  ENDP
  3195                                  
  3196                                  dofunc: PROC
  3197                                  
  3198                                  ;-436   cloc=&co;
  3199                                  
  3200                                  ;Function : dofunc, Number of local variables: 3
  3201                                  ;   # type sign width addr used name   list of local variables
  3202                                  ;  200 var sign word   435 NULL nloc = bp-2
  3203                                  ;  201 var sign word   435 NULL i = bp-4
  3204                                  ;  202 var sign word   435 NULL narg = bp-6;
  3205 0000108A C8060000                 ENTER  6,0
  3206 0000108E B8A861                   mov ax, co
  3207 00001091 A3[1800]                 mov word [cloc], ax
  3208                                  
  3209                                  ;-437   checknamelen();
  3210                                  
  3211 00001094 E814F3                   call checknamelen
  3212                                  
  3213                                  ;-438   strcpy(fname, symbol);
  3214                                  
  3215 00001097 8D06BB69                 lea  ax, [symbol]
  3216 0000109B 50                       push ax
  3217 0000109C 8D063B6A                 lea  ax, [fname]
  3218 000010A0 50                       push ax
  3219 000010A1 E8A9F1                   call strcpy
  3220 000010A4 83C404                   add  sp, 4
  3221                                  
  3222                                  ;-439   if (checkFunction() ) error1("Function already defined");
  3223                                  
  3224 000010A7 E893FF                   call checkFunction
  3225 000010AA 08C0                     or  al, al
  3226 000010AC 0F840900                 je .dofunc126
  3227 000010B0 68[D412]                 push dofunc_0
  3228 000010B3 E8EA2B                   call error1
  3229 000010B6 83C402                   add  sp, 2
  3230                                  
  3231                                  ;-440   storefunc();
  3232                                  
  3233                                  .dofunc126:
  3234 000010B9 E853FE                   call storefunc
  3235                                  
  3236                                  ;-441   prs("\n\n"); prs(symbol); prs(": PROC");
  3237                                  
  3238 000010BC 68[ED12]                 push dofunc_1
  3239 000010BF E888F4                   call prs
  3240 000010C2 83C402                   add  sp, 2
  3241 000010C5 8D06BB69                 lea  ax, [symbol]
  3242 000010C9 50                       push ax
  3243 000010CA E87DF4                   call prs
  3244 000010CD 83C402                   add  sp, 2
  3245 000010D0 68[F212]                 push dofunc_2
  3246 000010D3 E874F4                   call prs
  3247 000010D6 83C402                   add  sp, 2
  3248                                  
  3249                                  ;-442   expect('('); LTop=LSTART;  i=0;
  3250                                  
  3251 000010D9 6A28                     push 40
  3252 000010DB E859F3                   call expect
  3253 000010DE 83C402                   add  sp, 2
  3254 000010E1 B8C800                   mov ax, 200
  3255 000010E4 A3[2E00]                 mov word [LTop], ax
  3256 000010E7 B80000                   mov ax, 0
  3257 000010EA 8946FC                   mov [bp-4], ax
  3258                                  
  3259                                  ;-443   if (istoken(')')==0) { narg=2;
  3260                                  
  3261 000010ED 6A29                     push 41
  3262 000010EF E823F3                   call istoken
  3263 000010F2 83C402                   add  sp, 2
  3264 000010F5 83F800                   cmp ax, 0
  3265 000010F8 0F854600                 jne .dofunc127
  3266 000010FC B80200                   mov ax, 2
  3267 000010FF 8946FA                   mov [bp-6], ax
  3268                                  
  3269                                  ;-444     do { typeName();  addlocal(); narg+=2;
  3270                                  
  3271                                  .dofunc128:
  3272 00001102 E871FC                   call typeName
  3273 00001105 E87CFE                   call addlocal
  3274 00001108 8346FA02                 add  word[bp-6], 2
  3275                                  
  3276                                  ;-445          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  3277                                  
  3278 0000110C 8B46FA                   mov ax, [bp-6]
  3279 0000110F 8B1E[2E00]               mov bx, [LTop]
  3280 00001113 D1E3                     shl bx, 1
  3281 00001115 89877B73                 mov [GData+bx], ax
  3282 00001119 A0[3A00]                 mov al, [iswidth]
  3283 0000111C 3C04                     cmp al, 4
  3284 0000111E 0F850400                 jne .dofunc129
  3285 00001122 8346FA02                 add  word[bp-6], 2
  3286                                  .dofunc129:
  3287 00001126 FF06[2E00]               inc  word[LTop]
  3288                                  
  3289                                  ;-446     while (istoken(','));  expect(')'); }
  3290                                  
  3291 0000112A 6A2C                     push 44
  3292 0000112C E8E6F2                   call istoken
  3293 0000112F 83C402                   add  sp, 2
  3294 00001132 08C0                     or  al, al
  3295 00001134 0F840200                 je .dofunc130
  3296 00001138 EBC8                     jmp .dofunc128
  3297                                  .dofunc130:
  3298 0000113A 6A29                     push 41
  3299 0000113C E8F8F2                   call expect
  3300 0000113F 83C402                   add  sp, 2
  3301                                  
  3302                                  ;-447 
  3303                                  
  3304                                  
  3305                                  ;-448   expect('{'); /*body*/
  3306                                  
  3307                                  .dofunc127:
  3308 00001142 6A7B                     push 123
  3309 00001144 E8F0F2                   call expect
  3310 00001147 83C402                   add  sp, 2
  3311                                  
  3312                                  ;-449   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  3313                                  
  3314 0000114A B80000                   mov ax, 0
  3315 0000114D 8946FE                   mov [bp-2], ax
  3316 00001150 B80000                   mov ax, 0
  3317 00001153 A3[2800]                 mov word [nreturn], ax
  3318 00001156 B80000                   mov ax, 0
  3319 00001159 A3[2600]                 mov word [nconst], ax
  3320 0000115C B80000                   mov ax, 0
  3321 0000115F 8946FC                   mov [bp-4], ax
  3322                                  
  3323                                  ;-450   while(isvariable()) {
  3324                                  
  3325                                  .dofunc131:
  3326 00001162 E8C101                   call isvariable
  3327 00001165 08C0                     or  al, al
  3328 00001167 0F849200                 je .dofunc132
  3329                                  
  3330                                  ;-451     do {typeName();
  3331                                  
  3332                                  .dofunc133:
  3333 0000116B E808FC                   call typeName
  3334                                  
  3335                                  ;-452         checknamelen();
  3336                                  
  3337 0000116E E83AF2                   call checknamelen
  3338                                  
  3339                                  ;-453         addlocal(); nloc-=2;
  3340                                  
  3341 00001171 E810FE                   call addlocal
  3342 00001174 836EFE02                 sub  word[bp-2], 2
  3343                                  
  3344                                  ;-454         if (iswidth == 4) nloc-=2;
  3345                                  
  3346 00001178 A0[3A00]                 mov al, [iswidth]
  3347 0000117B 3C04                     cmp al, 4
  3348 0000117D 0F850400                 jne .dofunc134
  3349 00001181 836EFE02                 sub  word[bp-2], 2
  3350                                  
  3351                                  ;-455         GData[LTop]=nloc;
  3352                                  
  3353                                  .dofunc134:
  3354 00001185 8B46FE                   mov ax, [bp-2]
  3355 00001188 8B1E[2E00]               mov bx, [LTop]
  3356 0000118C D1E3                     shl bx, 1
  3357 0000118E 89877B73                 mov [GData+bx], ax
  3358                                  
  3359                                  ;-456         if (istoken('[')){
  3360                                  
  3361 00001192 6A5B                     push 91
  3362 00001194 E87EF2                   call istoken
  3363 00001197 83C402                   add  sp, 2
  3364 0000119A 08C0                     or  al, al
  3365 0000119C 0F843D00                 je .dofunc135
  3366                                  
  3367                                  ;-457             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  3368                                  
  3369 000011A0 B82600                   mov ax, 38
  3370 000011A3 A2[3400]                 mov byte [istype], al
  3371 000011A6 B82600                   mov ax, 38
  3372 000011A9 8B1E[2E00]               mov bx, [LTop]
  3373 000011AD 8887476B                 mov [GType+bx], al
  3374 000011B1 680101                   push 257
  3375 000011B4 E880F2                   call expect
  3376 000011B7 83C402                   add  sp, 2
  3377 000011BA 6A5D                     push 93
  3378 000011BC E878F2                   call expect
  3379 000011BF 83C402                   add  sp, 2
  3380                                  
  3381                                  ;-458             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  3382                                  
  3383 000011C2 8B46FE                   mov ax, [bp-2]
  3384 000011C5 2B06[3000]               sub ax, [lexval]
  3385 000011C9 8946FE                   mov [bp-2], ax
  3386 000011CC 8346FE02                 add  word[bp-2], 2
  3387 000011D0 8B46FE                   mov ax, [bp-2]
  3388 000011D3 8B1E[2E00]               mov bx, [LTop]
  3389 000011D7 D1E3                     shl bx, 1
  3390 000011D9 89877B73                 mov [GData+bx], ax
  3391                                  
  3392                                  ;-459             }
  3393                                  
  3394                                  
  3395                                  ;-460         LTop++;
  3396                                  
  3397                                  .dofunc135:
  3398 000011DD FF06[2E00]               inc  word[LTop]
  3399                                  
  3400                                  ;-461       } while (istoken(',')); expect(';'); }
  3401                                  
  3402 000011E1 6A2C                     push 44
  3403 000011E3 E82FF2                   call istoken
  3404 000011E6 83C402                   add  sp, 2
  3405 000011E9 08C0                     or  al, al
  3406 000011EB 0F840300                 je .dofunc136
  3407 000011EF E979FF                   jmp .dofunc133
  3408                                  .dofunc136:
  3409 000011F2 6A3B                     push 59
  3410 000011F4 E840F2                   call expect
  3411 000011F7 83C402                   add  sp, 2
  3412                                  
  3413                                  ;-462   listproc();
  3414                                  
  3415 000011FA E965FF                   jmp .dofunc131
  3416                                  .dofunc132:
  3417 000011FD E8622B                   call listproc
  3418                                  
  3419                                  ;-463   if (LTop>LSTART){prs(";\n ENTER  ");
  3420                                  
  3421 00001200 A1[2E00]                 mov ax, [LTop]
  3422 00001203 3DC800                   cmp ax, 200
  3423 00001206 0F8E2700                 jle .dofunc137
  3424 0000120A 68[F912]                 push dofunc_3
  3425 0000120D E83AF3                   call prs
  3426 00001210 83C402                   add  sp, 2
  3427                                  
  3428                                  ;-464     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  3429                                  
  3430 00001213 FF76FE                   push word [bp-2]
  3431 00001216 E8ACEE                   call mkneg
  3432 00001219 83C402                   add  sp, 2
  3433 0000121C 8946FE                   mov [bp-2], ax
  3434 0000121F FF76FE                   push word [bp-2]
  3435 00001222 E87AF4                   call prunsign1
  3436 00001225 83C402                   add  sp, 2
  3437 00001228 68[0513]                 push dofunc_4
  3438 0000122B E81CF3                   call prs
  3439 0000122E 83C402                   add  sp, 2
  3440                                  
  3441                                  ;-465   while(istoken('}')==0)   stmt();
  3442                                  
  3443                                  .dofunc137:
  3444                                  .dofunc138:
  3445 00001231 6A7D                     push 125
  3446 00001233 E8DFF1                   call istoken
  3447 00001236 83C402                   add  sp, 2
  3448 00001239 83F800                   cmp ax, 0
  3449 0000123C 0F850500                 jne .dofunc139
  3450 00001240 E89C26                   call stmt
  3451                                  
  3452                                  ;-466   if (nreturn) {
  3453                                  
  3454 00001243 EBEC                     jmp .dofunc138
  3455                                  .dofunc139:
  3456 00001245 A1[2800]                 mov ax, [nreturn]
  3457 00001248 08C0                     or  al, al
  3458 0000124A 0F841C00                 je .dofunc140
  3459                                  
  3460                                  ;-467         prs("\n .retn");
  3461                                  
  3462 0000124E 68[0813]                 push dofunc_5
  3463 00001251 E8F6F2                   call prs
  3464 00001254 83C402                   add  sp, 2
  3465                                  
  3466                                  ;-468         prs(fname);
  3467                                  
  3468 00001257 8D063B6A                 lea  ax, [fname]
  3469 0000125B 50                       push ax
  3470 0000125C E8EBF2                   call prs
  3471 0000125F 83C402                   add  sp, 2
  3472                                  
  3473                                  ;-469         prc(':');
  3474                                  
  3475 00001262 6A3A                     push 58
  3476 00001264 E87CF2                   call prc
  3477 00001267 83C402                   add  sp, 2
  3478                                  
  3479                                  ;-470         }
  3480                                  
  3481                                  
  3482                                  ;-471   if (LTop > LSTART) prs(" LEAVE");
  3483                                  
  3484                                  .dofunc140:
  3485 0000126A A1[2E00]                 mov ax, [LTop]
  3486 0000126D 3DC800                   cmp ax, 200
  3487 00001270 0F8E0900                 jle .dofunc141
  3488 00001274 68[1113]                 push dofunc_6
  3489 00001277 E8D0F2                   call prs
  3490 0000127A 83C402                   add  sp, 2
  3491                                  
  3492                                  ;-472   prs("\n ret");
  3493                                  
  3494                                  .dofunc141:
  3495 0000127D 68[1813]                 push dofunc_7
  3496 00001280 E8C7F2                   call prs
  3497 00001283 83C402                   add  sp, 2
  3498                                  
  3499                                  ;-473   *cloc=0; prs(co);
  3500                                  
  3501 00001286 B80000                   mov ax, 0
  3502 00001289 8B1E[1800]               mov  bx, [cloc]
  3503 0000128D 8807                     mov  [bx], al
  3504 0000128F 8D06A861                 lea  ax, [co]
  3505 00001293 50                       push ax
  3506 00001294 E8B3F2                   call prs
  3507 00001297 83C402                   add  sp, 2
  3508                                  
  3509                                  ;-474   maxco1=strlen(co);
  3510                                  
  3511 0000129A 8D06A861                 lea  ax, [co]
  3512 0000129E 50                       push ax
  3513 0000129F E883EF                   call strlen
  3514 000012A2 83C402                   add  sp, 2
  3515 000012A5 A3[1600]                 mov word [maxco1], ax
  3516                                  
  3517                                  ;-475   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  3518                                  
  3519 000012A8 A1[1600]                 mov ax, [maxco1]
  3520 000012AB 3B06[1400]               cmp ax, [maxco]
  3521 000012AF 0F8E1600                 jle .dofunc142
  3522 000012B3 A1[1600]                 mov ax, [maxco1]
  3523 000012B6 A3[1400]                 mov word [maxco], ax
  3524 000012B9 8D063B6A                 lea  ax, [fname]
  3525 000012BD 50                       push ax
  3526 000012BE 8D067869                 lea  ax, [coname]
  3527 000012C2 50                       push ax
  3528 000012C3 E887EF                   call strcpy
  3529 000012C6 83C404                   add  sp, 4
  3530                                  
  3531                                  ;-476   prs("\nENDP");
  3532                                  
  3533                                  .dofunc142:
  3534 000012C9 68[1F13]                 push dofunc_8
  3535 000012CC E87BF2                   call prs
  3536 000012CF 83C402                   add  sp, 2
  3537                                  
  3538                                  ;-477 }
  3539                                  
  3540                                  
  3541                                  ;-478 int isvariable() {
  3542 000012D2 C9                       LEAVE
  3543 000012D3 C3                       ret
  3544 000012D4 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  3545 000012DD 616C72656164792064-
  3546 000012E6 6566696E656400     
  3547 000012ED 5C6E5C6E00              dofunc_1 db "\n\n",0
  3548 000012F2 3A2050524F4300          dofunc_2 db ": PROC",0
  3549 000012F9 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  3550 00001302 202000             
  3551 00001305 2C3000                  dofunc_4 db ",0",0
  3552 00001308 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  3553 00001311 204C4541564500          dofunc_6 db " LEAVE",0
  3554 00001318 5C6E2072657400          dofunc_7 db "\n ret",0
  3555 0000131F 5C6E454E445000          dofunc_8 db "\nENDP",0
  3556                                  ENDP
  3557                                  
  3558                                  isvariable: PROC
  3559                                  
  3560                                  ;-479     if(token==T_SIGNED)   goto v1;
  3561                                  
  3562 00001326 A1[1E00]                 mov ax, [token]
  3563 00001329 3D1302                   cmp ax, 531
  3564 0000132C 0F850300                 jne .isvariable143
  3565 00001330 E93A00                   jmp .v1
  3566                                  
  3567                                  ;-480     if(token==T_UNSIGNED) goto v1;
  3568                                  
  3569                                  .isvariable143:
  3570 00001333 A1[1E00]                 mov ax, [token]
  3571 00001336 3D1402                   cmp ax, 532
  3572 00001339 0F850300                 jne .isvariable144
  3573 0000133D E92D00                   jmp .v1
  3574                                  
  3575                                  ;-481     if(token==T_CHAR)     goto v1;
  3576                                  
  3577                                  .isvariable144:
  3578 00001340 A1[1E00]                 mov ax, [token]
  3579 00001343 3D1202                   cmp ax, 530
  3580 00001346 0F850300                 jne .isvariable145
  3581 0000134A E92000                   jmp .v1
  3582                                  
  3583                                  ;-482     if(token==T_INT)      goto v1;
  3584                                  
  3585                                  .isvariable145:
  3586 0000134D A1[1E00]                 mov ax, [token]
  3587 00001350 3D0502                   cmp ax, 517
  3588 00001353 0F850300                 jne .isvariable146
  3589 00001357 E91300                   jmp .v1
  3590                                  
  3591                                  ;-483     if(token==T_LONG)     goto v1;
  3592                                  
  3593                                  .isvariable146:
  3594 0000135A A1[1E00]                 mov ax, [token]
  3595 0000135D 3D1502                   cmp ax, 533
  3596 00001360 0F850300                 jne .isvariable147
  3597 00001364 E90600                   jmp .v1
  3598                                  
  3599                                  ;-484     return 0;
  3600                                  
  3601                                  .isvariable147:
  3602 00001367 B80000                   mov ax, 0
  3603 0000136A E90600                   jmp .retnisvariable
  3604                                  
  3605                                  ;-485 v1: return 1;
  3606                                  
  3607                                  .v1:
  3608 0000136D B80100                   mov ax, 1
  3609 00001370 E90000                   jmp .retnisvariable
  3610                                  
  3611                                  ;-486 }
  3612                                  
  3613                                  
  3614                                  ;-487 
  3615                                  
  3616                                  
  3617                                  ;-488 int ireg1;
  3618                                  
  3619                                   .retnisvariable:
  3620 00001373 C3                       ret
  3621                                  ENDP
  3622 00001374 0000                    ireg1 dw 0
  3623                                  
  3624                                  ;-489 int mod2; int ireg2;
  3625                                  
  3626 00001376 0000                    mod2 dw 0
  3627 00001378 0000                    ireg2 dw 0
  3628                                  
  3629                                  ;-490 
  3630                                  
  3631                                  
  3632                                  ;-491 int pexpr() {expect('('); iscmp=0;
  3633                                  
  3634                                  
  3635                                  pexpr: PROC
  3636 0000137A 6A28                     push 40
  3637 0000137C E8B8F0                   call expect
  3638 0000137F 83C402                   add  sp, 2
  3639 00001382 B80000                   mov ax, 0
  3640 00001385 A3[2400]                 mov word [iscmp], ax
  3641                                  
  3642                                  ;-492   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  3643                                  
  3644 00001388 A1[1E00]                 mov ax, [token]
  3645 0000138B 3D0001                   cmp ax, 256
  3646 0000138E 0F853400                 jne .pexpr148
  3647 00001392 68[F513]                 push pexpr_0
  3648 00001395 8D06BB69                 lea  ax, [symbol]
  3649 00001399 50                       push ax
  3650 0000139A E8E6EE                   call eqstr
  3651 0000139D 83C404                   add  sp, 4
  3652 000013A0 08C0                     or  al, al
  3653 000013A2 0F840600                 je .pexpr149
  3654 000013A6 E86300                   call constantexpr
  3655 000013A9 E94800                   jmp .retnpexpr
  3656                                  
  3657                                  ;-493     ireg1=checkreg();
  3658                                  
  3659                                  .pexpr149:
  3660 000013AC E84803                   call checkreg
  3661 000013AF A3[7413]                 mov word [ireg1], ax
  3662                                  
  3663                                  ;-494     if (ireg1) { doreg1(1); return; }  }
  3664                                  
  3665 000013B2 A1[7413]                 mov ax, [ireg1]
  3666 000013B5 08C0                     or  al, al
  3667 000013B7 0F840B00                 je .pexpr150
  3668 000013BB 6A01                     push 1
  3669 000013BD E84B01                   call doreg1
  3670 000013C0 83C402                   add  sp, 2
  3671 000013C3 E92E00                   jmp .retnpexpr
  3672                                  .pexpr150:
  3673                                  
  3674                                  ;-495   expr(0);
  3675                                  
  3676                                  .pexpr148:
  3677 000013C6 6A00                     push 0
  3678 000013C8 E8AB07                   call expr
  3679 000013CB 83C402                   add  sp, 2
  3680                                  
  3681                                  ;-496   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  3682                                  
  3683 000013CE A1[2400]                 mov ax, [iscmp]
  3684 000013D1 83F800                   cmp ax, 0
  3685 000013D4 0F850900                 jne .pexpr151
  3686 000013D8 68[F713]                 push pexpr_1
  3687 000013DB E86CF1                   call prs
  3688 000013DE 83C402                   add  sp, 2
  3689                                  .pexpr151:
  3690 000013E1 8D063B6A                 lea  ax, [fname]
  3691 000013E5 50                       push ax
  3692 000013E6 E861F1                   call prs
  3693 000013E9 83C402                   add  sp, 2
  3694                                  
  3695                                  ;-497   expect(')'); }
  3696                                  
  3697 000013EC 6A29                     push 41
  3698 000013EE E846F0                   call expect
  3699 000013F1 83C402                   add  sp, 2
  3700                                  
  3701                                  ;-498 
  3702                                  
  3703                                  
  3704                                  ;-499 int constantexpr() { int mode; int id1;int ids;
  3705                                  
  3706                                   .retnpexpr:
  3707 000013F4 C3                       ret
  3708 000013F5 5F00                    pexpr_0 db "_",0
  3709 000013F7 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  3710 00001400 2C20616C5C6E206A65-
  3711 00001409 202E00             
  3712                                  ENDP
  3713                                  
  3714                                  constantexpr: PROC
  3715                                  
  3716                                  ;-500   token=getlex();   mode=typeName();
  3717                                  
  3718                                  ;Function : constantexpr, Number of local variables: 3
  3719                                  ;   # type sign width addr used name   list of local variables
  3720                                  ;  200 var sign word   499 NULL mode = bp-2
  3721                                  ;  201 var sign word   499 NULL id1 = bp-4
  3722                                  ;  202 var sign word   499 NULL ids = bp-6;
  3723 0000140C C8060000                 ENTER  6,0
  3724 00001410 E8161E                   call getlex
  3725 00001413 A3[1E00]                 mov word [token], ax
  3726 00001416 E85DF9                   call typeName
  3727 00001419 8946FE                   mov [bp-2], ax
  3728                                  
  3729                                  ;-501   id1=searchname(); gettypes(id1); ids=signi;
  3730                                  
  3731 0000141C E888F8                   call searchname
  3732 0000141F 8946FC                   mov [bp-4], ax
  3733 00001422 FF76FC                   push word [bp-4]
  3734 00001425 E841F7                   call gettypes
  3735 00001428 83C402                   add  sp, 2
  3736 0000142B A1[3500]                 mov ax, [signi]
  3737 0000142E 8946FA                   mov [bp-6], ax
  3738                                  
  3739                                  ;-502   if (isrelational() ==0) error1("Relational expression expected");
  3740                                  
  3741 00001431 E88E1D                   call isrelational
  3742 00001434 83F800                   cmp ax, 0
  3743 00001437 0F850900                 jne .constantexpr152
  3744 0000143B 68[C114]                 push constantexpr_0
  3745 0000143E E85F28                   call error1
  3746 00001441 83C402                   add  sp, 2
  3747                                  
  3748                                  ;-503   expect(T_CONST);  prs(" ; constant expression");
  3749                                  
  3750                                  .constantexpr152:
  3751 00001444 680101                   push 257
  3752 00001447 E8EDEF                   call expect
  3753 0000144A 83C402                   add  sp, 2
  3754 0000144D 68[E014]                 push constantexpr_1
  3755 00001450 E8F7F0                   call prs
  3756 00001453 83C402                   add  sp, 2
  3757                                  
  3758                                  ;-504   prs("\ncmp ");
  3759                                  
  3760 00001456 68[F714]                 push constantexpr_2
  3761 00001459 E8EEF0                   call prs
  3762 0000145C 83C402                   add  sp, 2
  3763                                  
  3764                                  ;-505   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  3765                                  
  3766 0000145F FF76FC                   push word [bp-4]
  3767 00001462 E804F7                   call gettypes
  3768 00001465 83C402                   add  sp, 2
  3769 00001468 A1[3B00]                 mov ax, [wi]
  3770 0000146B 83F802                   cmp ax, 2
  3771 0000146E 0F850C00                 jne .constantexpr153
  3772 00001472 68[FE14]                 push constantexpr_3
  3773 00001475 E8D2F0                   call prs
  3774 00001478 83C402                   add  sp, 2
  3775 0000147B E90900                   jmp .constantexpr154
  3776                                  .constantexpr153:
  3777 0000147E 68[0315]                 push constantexpr_4
  3778 00001481 E8C6F0                   call prs
  3779 00001484 83C402                   add  sp, 2
  3780                                  
  3781                                  ;-506   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  3782                                  
  3783                                  .constantexpr154:
  3784 00001487 FF76FC                   push word [bp-4]
  3785 0000148A E8EBEE                   call v
  3786 0000148D 83C402                   add  sp, 2
  3787 00001490 68[0815]                 push constantexpr_5
  3788 00001493 E8B4F0                   call prs
  3789 00001496 83C402                   add  sp, 2
  3790 00001499 FF36[3000]               push word [lexval]
  3791 0000149D E8FFF1                   call prunsign1
  3792 000014A0 83C402                   add  sp, 2
  3793 000014A3 FF76FA                   push word [bp-6]
  3794 000014A6 E85B1A                   call cmpneg
  3795 000014A9 83C402                   add  sp, 2
  3796 000014AC 8D063B6A                 lea  ax, [fname]
  3797 000014B0 50                       push ax
  3798 000014B1 E896F0                   call prs
  3799 000014B4 83C402                   add  sp, 2
  3800                                  
  3801                                  ;-507   expect(')');
  3802                                  
  3803 000014B7 6A29                     push 41
  3804 000014B9 E87BEF                   call expect
  3805 000014BC 83C402                   add  sp, 2
  3806                                  
  3807                                  ;-508 }
  3808                                  
  3809                                  
  3810                                  ;-509 
  3811                                  
  3812                                  
  3813                                  ;-510 char ops[5];
  3814 000014BF C9                       LEAVE
  3815 000014C0 C3                       ret
  3816 000014C1 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  3817 000014CA 6C2065787072657373-
  3818 000014D3 696F6E206578706563-
  3819 000014DC 74656400           
  3820 000014E0 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  3821 000014E9 6E7420657870726573-
  3822 000014F2 73696F6E00         
  3823 000014F7 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  3824 000014FE 776F726400              constantexpr_3 db "word",0
  3825 00001503 6279746500              constantexpr_4 db "byte",0
  3826 00001508 2C2000                  constantexpr_5 db ", ",0
  3827                                  ENDP
  3828                                  section .bss
  3829                                  absolute 47406
  3830 0000B92E <res 00000005>          ops resb 5
  3831                                  section .text
  3832                                  
  3833                                  ;-511 int doreg1(int iscmp1) { int i;
  3834                                  
  3835                                  
  3836                                  doreg1: PROC
  3837                                  
  3838                                  ;-512   if (istoken('='))          strcpy(ops, "mov");
  3839                                  
  3840                                  ;Function : doreg1, Number of local variables: 2
  3841                                  ;   # type sign width addr used name   list of local variables
  3842                                  ;  200 var sign word   511 NULL iscmp1 = bp+4
  3843                                  ;  201 var sign word   511 NULL i = bp-2;
  3844 0000150B C8020000                 ENTER  2,0
  3845 0000150F 6A3D                     push 61
  3846 00001511 E801EF                   call istoken
  3847 00001514 83C402                   add  sp, 2
  3848 00001517 08C0                     or  al, al
  3849 00001519 0F840E00                 je .doreg1155
  3850 0000151D 68[BE16]                 push doreg1_0
  3851 00001520 8D062EB9                 lea  ax, [ops]
  3852 00001524 50                       push ax
  3853 00001525 E825ED                   call strcpy
  3854 00001528 83C404                   add  sp, 4
  3855                                  
  3856                                  ;-513   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3857                                  
  3858                                  .doreg1155:
  3859 0000152B 68CE04                   push 1230
  3860 0000152E E8E4EE                   call istoken
  3861 00001531 83C402                   add  sp, 2
  3862 00001534 08C0                     or  al, al
  3863 00001536 0F840E00                 je .doreg1156
  3864 0000153A 68[C216]                 push doreg1_1
  3865 0000153D 8D062EB9                 lea  ax, [ops]
  3866 00001541 50                       push ax
  3867 00001542 E808ED                   call strcpy
  3868 00001545 83C404                   add  sp, 4
  3869                                  
  3870                                  ;-514   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3871                                  
  3872                                  .doreg1156:
  3873 00001548 68CF04                   push 1231
  3874 0000154B E8C7EE                   call istoken
  3875 0000154E 83C402                   add  sp, 2
  3876 00001551 08C0                     or  al, al
  3877 00001553 0F840E00                 je .doreg1157
  3878 00001557 68[C616]                 push doreg1_2
  3879 0000155A 8D062EB9                 lea  ax, [ops]
  3880 0000155E 50                       push ax
  3881 0000155F E8EBEC                   call strcpy
  3882 00001562 83C404                   add  sp, 4
  3883                                  
  3884                                  ;-515   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3885                                  
  3886                                  .doreg1157:
  3887 00001565 68D204                   push 1234
  3888 00001568 E8AAEE                   call istoken
  3889 0000156B 83C402                   add  sp, 2
  3890 0000156E 08C0                     or  al, al
  3891 00001570 0F840E00                 je .doreg1158
  3892 00001574 68[CA16]                 push doreg1_3
  3893 00001577 8D062EB9                 lea  ax, [ops]
  3894 0000157B 50                       push ax
  3895 0000157C E8CEEC                   call strcpy
  3896 0000157F 83C404                   add  sp, 4
  3897                                  
  3898                                  ;-516   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3899                                  
  3900                                  .doreg1158:
  3901 00001582 68D304                   push 1235
  3902 00001585 E88DEE                   call istoken
  3903 00001588 83C402                   add  sp, 2
  3904 0000158B 08C0                     or  al, al
  3905 0000158D 0F840E00                 je .doreg1159
  3906 00001591 68[CE16]                 push doreg1_4
  3907 00001594 8D062EB9                 lea  ax, [ops]
  3908 00001598 50                       push ax
  3909 00001599 E8B1EC                   call strcpy
  3910 0000159C 83C404                   add  sp, 4
  3911                                  
  3912                                  ;-517   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3913                                  
  3914                                  .doreg1159:
  3915 0000159F 68D804                   push 1240
  3916 000015A2 E870EE                   call istoken
  3917 000015A5 83C402                   add  sp, 2
  3918 000015A8 08C0                     or  al, al
  3919 000015AA 0F840E00                 je .doreg1160
  3920 000015AE 68[D116]                 push doreg1_5
  3921 000015B1 8D062EB9                 lea  ax, [ops]
  3922 000015B5 50                       push ax
  3923 000015B6 E894EC                   call strcpy
  3924 000015B9 83C404                   add  sp, 4
  3925                                  
  3926                                  ;-518   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3927                                  
  3928                                  .doreg1160:
  3929 000015BC 68D904                   push 1241
  3930 000015BF E853EE                   call istoken
  3931 000015C2 83C402                   add  sp, 2
  3932 000015C5 08C0                     or  al, al
  3933 000015C7 0F840E00                 je .doreg1161
  3934 000015CB 68[D516]                 push doreg1_6
  3935 000015CE 8D062EB9                 lea  ax, [ops]
  3936 000015D2 50                       push ax
  3937 000015D3 E877EC                   call strcpy
  3938 000015D6 83C404                   add  sp, 4
  3939                                  
  3940                                  ;-519   if (iscmp1 == 1) { token=getlex();
  3941                                  
  3942                                  .doreg1161:
  3943 000015D9 8B4604                   mov ax, [bp+4]
  3944 000015DC 83F801                   cmp ax, 1
  3945 000015DF 0F852700                 jne .doreg1162
  3946 000015E3 E8431C                   call getlex
  3947 000015E6 A3[1E00]                 mov word [token], ax
  3948                                  
  3949                                  ;-520       if (isrelational() ==0) error1("Relational expected");
  3950                                  
  3951 000015E9 E8D61B                   call isrelational
  3952 000015EC 83F800                   cmp ax, 0
  3953 000015EF 0F850900                 jne .doreg1163
  3954 000015F3 68[D916]                 push doreg1_7
  3955 000015F6 E8A726                   call error1
  3956 000015F9 83C402                   add  sp, 2
  3957                                  
  3958                                  ;-521       strcpy(ops, "cmp"); }
  3959                                  
  3960                                  .doreg1163:
  3961 000015FC 68[ED16]                 push doreg1_8
  3962 000015FF 8D062EB9                 lea  ax, [ops]
  3963 00001603 50                       push ax
  3964 00001604 E846EC                   call strcpy
  3965 00001607 83C404                   add  sp, 4
  3966                                  
  3967                                  ;-522   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3968                                  
  3969                                  .doreg1162:
  3970 0000160A E82FEF                   call prnl
  3971 0000160D 8D062EB9                 lea  ax, [ops]
  3972 00001611 50                       push ax
  3973 00001612 E835EF                   call prs
  3974 00001615 83C402                   add  sp, 2
  3975 00001618 68[F116]                 push doreg1_9
  3976 0000161B E82CEF                   call prs
  3977 0000161E 83C402                   add  sp, 2
  3978 00001621 FF36[7413]               push word [ireg1]
  3979 00001625 E8DD04                   call printreg
  3980 00001628 83C402                   add  sp, 2
  3981 0000162B 68[F416]                 push doreg1_10
  3982 0000162E E819EF                   call prs
  3983 00001631 83C402                   add  sp, 2
  3984                                  
  3985                                  ;-523 
  3986                                  
  3987                                  
  3988                                  ;-524   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3989                                  
  3990 00001634 680101                   push 257
  3991 00001637 E8DBED                   call istoken
  3992 0000163A 83C402                   add  sp, 2
  3993 0000163D 08C0                     or  al, al
  3994 0000163F 0F840D00                 je .doreg1164
  3995 00001643 FF36[3000]               push word [lexval]
  3996 00001647 E855F0                   call prunsign1
  3997 0000164A 83C402                   add  sp, 2
  3998 0000164D E94700                   jmp .reg1
  3999                                  
  4000                                  ;-525   mod2=typeName(); ireg2=checkreg();
  4001                                  
  4002                                  .doreg1164:
  4003 00001650 E823F7                   call typeName
  4004 00001653 A3[7613]                 mov word [mod2], ax
  4005 00001656 E89E00                   call checkreg
  4006 00001659 A3[7813]                 mov word [ireg2], ax
  4007                                  
  4008                                  ;-526   if (ireg2) {printreg(ireg2); goto reg1;}
  4009                                  
  4010 0000165C A1[7813]                 mov ax, [ireg2]
  4011 0000165F 08C0                     or  al, al
  4012 00001661 0F840D00                 je .doreg1165
  4013 00001665 FF36[7813]               push word [ireg2]
  4014 00001669 E89904                   call printreg
  4015 0000166C 83C402                   add  sp, 2
  4016 0000166F E92500                   jmp .reg1
  4017                                  
  4018                                  ;-527   i=searchname();  if (mod2 == 2) a(i); else v(i);
  4019                                  
  4020                                  .doreg1165:
  4021 00001672 E832F6                   call searchname
  4022 00001675 8946FE                   mov [bp-2], ax
  4023 00001678 A1[7613]                 mov ax, [mod2]
  4024 0000167B 83F802                   cmp ax, 2
  4025 0000167E 0F850C00                 jne .doreg1166
  4026 00001682 FF76FE                   push word [bp-2]
  4027 00001685 E8E1EC                   call a
  4028 00001688 83C402                   add  sp, 2
  4029 0000168B E90900                   jmp .doreg1167
  4030                                  .doreg1166:
  4031 0000168E FF76FE                   push word [bp-2]
  4032 00001691 E8E4EC                   call v
  4033 00001694 83C402                   add  sp, 2
  4034                                  
  4035                                  ;-528   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4036                                  
  4037                                  .doreg1167:
  4038                                  .reg1:
  4039 00001697 8B4604                   mov ax, [bp+4]
  4040 0000169A 83F801                   cmp ax, 1
  4041 0000169D 0F851B00                 jne .doreg1168
  4042 000016A1 6A00                     push 0
  4043 000016A3 E85E18                   call cmpneg
  4044 000016A6 83C402                   add  sp, 2
  4045 000016A9 8D063B6A                 lea  ax, [fname]
  4046 000016AD 50                       push ax
  4047 000016AE E899EE                   call prs
  4048 000016B1 83C402                   add  sp, 2
  4049 000016B4 6A29                     push 41
  4050 000016B6 E87EED                   call expect
  4051 000016B9 83C402                   add  sp, 2
  4052                                  
  4053                                  ;-529 }
  4054                                  
  4055                                  .doreg1168:
  4056                                  
  4057                                  ;-530 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4058 000016BC C9                       LEAVE
  4059 000016BD C3                       ret
  4060 000016BE 6D6F7600                doreg1_0 db "mov",0
  4061 000016C2 61646400                doreg1_1 db "add",0
  4062 000016C6 73756200                doreg1_2 db "sub",0
  4063 000016CA 616E6400                doreg1_3 db "and",0
  4064 000016CE 6F7200                  doreg1_4 db "or",0
  4065 000016D1 73686C00                doreg1_5 db "shl",0
  4066 000016D5 73687200                doreg1_6 db "shr",0
  4067 000016D9 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4068 000016E2 6C2065787065637465-
  4069 000016EB 6400               
  4070 000016ED 636D7000                doreg1_8 db "cmp",0
  4071 000016F1 202000                  doreg1_9 db "  ",0
  4072 000016F4 2C2000                  doreg1_10 db ", ",0
  4073                                  ENDP
  4074                                  
  4075                                  checkreg: PROC
  4076                                  
  4077                                  ;-531   if (strlen(symbol) <  2) return 0;
  4078                                  
  4079 000016F7 8D06BB69                 lea  ax, [symbol]
  4080 000016FB 50                       push ax
  4081 000016FC E826EB                   call strlen
  4082 000016FF 83C402                   add  sp, 2
  4083 00001702 83F802                   cmp ax, 2
  4084 00001705 0F8D0600                 jge .checkreg169
  4085 00001709 B80000                   mov ax, 0
  4086 0000170C E94403                   jmp .retncheckreg
  4087                                  
  4088                                  ;-532   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4089                                  
  4090                                  .checkreg169:
  4091 0000170F 68[541A]                 push checkreg_0
  4092 00001712 8D06BB69                 lea  ax, [symbol]
  4093 00001716 50                       push ax
  4094 00001717 E869EB                   call eqstr
  4095 0000171A 83C404                   add  sp, 4
  4096 0000171D 08C0                     or  al, al
  4097 0000171F 0F840600                 je .checkreg170
  4098 00001723 B80100                   mov ax, 1
  4099 00001726 E92A03                   jmp .retncheckreg
  4100                                  .checkreg170:
  4101 00001729 68[571A]                 push checkreg_1
  4102 0000172C 8D06BB69                 lea  ax, [symbol]
  4103 00001730 50                       push ax
  4104 00001731 E84FEB                   call eqstr
  4105 00001734 83C404                   add  sp, 4
  4106 00001737 08C0                     or  al, al
  4107 00001739 0F840600                 je .checkreg171
  4108 0000173D B80300                   mov ax, 3
  4109 00001740 E91003                   jmp .retncheckreg
  4110                                  
  4111                                  ;-533   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4112                                  
  4113                                  .checkreg171:
  4114 00001743 68[5A1A]                 push checkreg_2
  4115 00001746 8D06BB69                 lea  ax, [symbol]
  4116 0000174A 50                       push ax
  4117 0000174B E835EB                   call eqstr
  4118 0000174E 83C404                   add  sp, 4
  4119 00001751 08C0                     or  al, al
  4120 00001753 0F840600                 je .checkreg172
  4121 00001757 B80500                   mov ax, 5
  4122 0000175A E9F602                   jmp .retncheckreg
  4123                                  .checkreg172:
  4124 0000175D 68[5D1A]                 push checkreg_3
  4125 00001760 8D06BB69                 lea  ax, [symbol]
  4126 00001764 50                       push ax
  4127 00001765 E81BEB                   call eqstr
  4128 00001768 83C404                   add  sp, 4
  4129 0000176B 08C0                     or  al, al
  4130 0000176D 0F840600                 je .checkreg173
  4131 00001771 B80700                   mov ax, 7
  4132 00001774 E9DC02                   jmp .retncheckreg
  4133                                  
  4134                                  ;-534   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4135                                  
  4136                                  .checkreg173:
  4137 00001777 68[601A]                 push checkreg_4
  4138 0000177A 8D06BB69                 lea  ax, [symbol]
  4139 0000177E 50                       push ax
  4140 0000177F E801EB                   call eqstr
  4141 00001782 83C404                   add  sp, 4
  4142 00001785 08C0                     or  al, al
  4143 00001787 0F840600                 je .checkreg174
  4144 0000178B B80900                   mov ax, 9
  4145 0000178E E9C202                   jmp .retncheckreg
  4146                                  .checkreg174:
  4147 00001791 68[631A]                 push checkreg_5
  4148 00001794 8D06BB69                 lea  ax, [symbol]
  4149 00001798 50                       push ax
  4150 00001799 E8E7EA                   call eqstr
  4151 0000179C 83C404                   add  sp, 4
  4152 0000179F 08C0                     or  al, al
  4153 000017A1 0F840600                 je .checkreg175
  4154 000017A5 B80B00                   mov ax, 11
  4155 000017A8 E9A802                   jmp .retncheckreg
  4156                                  
  4157                                  ;-535   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4158                                  
  4159                                  .checkreg175:
  4160 000017AB 68[661A]                 push checkreg_6
  4161 000017AE 8D06BB69                 lea  ax, [symbol]
  4162 000017B2 50                       push ax
  4163 000017B3 E8CDEA                   call eqstr
  4164 000017B6 83C404                   add  sp, 4
  4165 000017B9 08C0                     or  al, al
  4166 000017BB 0F840600                 je .checkreg176
  4167 000017BF B80D00                   mov ax, 13
  4168 000017C2 E98E02                   jmp .retncheckreg
  4169                                  .checkreg176:
  4170 000017C5 68[691A]                 push checkreg_7
  4171 000017C8 8D06BB69                 lea  ax, [symbol]
  4172 000017CC 50                       push ax
  4173 000017CD E8B3EA                   call eqstr
  4174 000017D0 83C404                   add  sp, 4
  4175 000017D3 08C0                     or  al, al
  4176 000017D5 0F840600                 je .checkreg177
  4177 000017D9 B80F00                   mov ax, 15
  4178 000017DC E97402                   jmp .retncheckreg
  4179                                  
  4180                                  ;-536   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4181                                  
  4182                                  .checkreg177:
  4183 000017DF 68[6C1A]                 push checkreg_8
  4184 000017E2 8D06BB69                 lea  ax, [symbol]
  4185 000017E6 50                       push ax
  4186 000017E7 E899EA                   call eqstr
  4187 000017EA 83C404                   add  sp, 4
  4188 000017ED 08C0                     or  al, al
  4189 000017EF 0F840600                 je .checkreg178
  4190 000017F3 B81100                   mov ax, 17
  4191 000017F6 E95A02                   jmp .retncheckreg
  4192                                  .checkreg178:
  4193 000017F9 68[6F1A]                 push checkreg_9
  4194 000017FC 8D06BB69                 lea  ax, [symbol]
  4195 00001800 50                       push ax
  4196 00001801 E87FEA                   call eqstr
  4197 00001804 83C404                   add  sp, 4
  4198 00001807 08C0                     or  al, al
  4199 00001809 0F840600                 je .checkreg179
  4200 0000180D B81300                   mov ax, 19
  4201 00001810 E94002                   jmp .retncheckreg
  4202                                  
  4203                                  ;-537   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4204                                  
  4205                                  .checkreg179:
  4206 00001813 68[721A]                 push checkreg_10
  4207 00001816 8D06BB69                 lea  ax, [symbol]
  4208 0000181A 50                       push ax
  4209 0000181B E865EA                   call eqstr
  4210 0000181E 83C404                   add  sp, 4
  4211 00001821 08C0                     or  al, al
  4212 00001823 0F840600                 je .checkreg180
  4213 00001827 B81500                   mov ax, 21
  4214 0000182A E92602                   jmp .retncheckreg
  4215                                  .checkreg180:
  4216 0000182D 68[751A]                 push checkreg_11
  4217 00001830 8D06BB69                 lea  ax, [symbol]
  4218 00001834 50                       push ax
  4219 00001835 E84BEA                   call eqstr
  4220 00001838 83C404                   add  sp, 4
  4221 0000183B 08C0                     or  al, al
  4222 0000183D 0F840600                 je .checkreg181
  4223 00001841 B81700                   mov ax, 23
  4224 00001844 E90C02                   jmp .retncheckreg
  4225                                  
  4226                                  ;-538   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4227                                  
  4228                                  .checkreg181:
  4229 00001847 68[781A]                 push checkreg_12
  4230 0000184A 8D06BB69                 lea  ax, [symbol]
  4231 0000184E 50                       push ax
  4232 0000184F E831EA                   call eqstr
  4233 00001852 83C404                   add  sp, 4
  4234 00001855 08C0                     or  al, al
  4235 00001857 0F840600                 je .checkreg182
  4236 0000185B B81900                   mov ax, 25
  4237 0000185E E9F201                   jmp .retncheckreg
  4238                                  .checkreg182:
  4239 00001861 68[7B1A]                 push checkreg_13
  4240 00001864 8D06BB69                 lea  ax, [symbol]
  4241 00001868 50                       push ax
  4242 00001869 E817EA                   call eqstr
  4243 0000186C 83C404                   add  sp, 4
  4244 0000186F 08C0                     or  al, al
  4245 00001871 0F840600                 je .checkreg183
  4246 00001875 B81B00                   mov ax, 27
  4247 00001878 E9D801                   jmp .retncheckreg
  4248                                  
  4249                                  ;-539   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4250                                  
  4251                                  .checkreg183:
  4252 0000187B 68[7E1A]                 push checkreg_14
  4253 0000187E 8D06BB69                 lea  ax, [symbol]
  4254 00001882 50                       push ax
  4255 00001883 E8FDE9                   call eqstr
  4256 00001886 83C404                   add  sp, 4
  4257 00001889 08C0                     or  al, al
  4258 0000188B 0F840600                 je .checkreg184
  4259 0000188F B81D00                   mov ax, 29
  4260 00001892 E9BE01                   jmp .retncheckreg
  4261                                  .checkreg184:
  4262 00001895 68[811A]                 push checkreg_15
  4263 00001898 8D06BB69                 lea  ax, [symbol]
  4264 0000189C 50                       push ax
  4265 0000189D E8E3E9                   call eqstr
  4266 000018A0 83C404                   add  sp, 4
  4267 000018A3 08C0                     or  al, al
  4268 000018A5 0F840600                 je .checkreg185
  4269 000018A9 B81F00                   mov ax, 31
  4270 000018AC E9A401                   jmp .retncheckreg
  4271                                  
  4272                                  ;-540   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4273                                  
  4274                                  .checkreg185:
  4275 000018AF 68[841A]                 push checkreg_16
  4276 000018B2 8D06BB69                 lea  ax, [symbol]
  4277 000018B6 50                       push ax
  4278 000018B7 E8C9E9                   call eqstr
  4279 000018BA 83C404                   add  sp, 4
  4280 000018BD 08C0                     or  al, al
  4281 000018BF 0F840600                 je .checkreg186
  4282 000018C3 B82100                   mov ax, 33
  4283 000018C6 E98A01                   jmp .retncheckreg
  4284                                  .checkreg186:
  4285 000018C9 68[871A]                 push checkreg_17
  4286 000018CC 8D06BB69                 lea  ax, [symbol]
  4287 000018D0 50                       push ax
  4288 000018D1 E8AFE9                   call eqstr
  4289 000018D4 83C404                   add  sp, 4
  4290 000018D7 08C0                     or  al, al
  4291 000018D9 0F840600                 je .checkreg187
  4292 000018DD B82300                   mov ax, 35
  4293 000018E0 E97001                   jmp .retncheckreg
  4294                                  
  4295                                  ;-541   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4296                                  
  4297                                  .checkreg187:
  4298 000018E3 68[8A1A]                 push checkreg_18
  4299 000018E6 8D06BB69                 lea  ax, [symbol]
  4300 000018EA 50                       push ax
  4301 000018EB E895E9                   call eqstr
  4302 000018EE 83C404                   add  sp, 4
  4303 000018F1 08C0                     or  al, al
  4304 000018F3 0F840600                 je .checkreg188
  4305 000018F7 B82500                   mov ax, 37
  4306 000018FA E95601                   jmp .retncheckreg
  4307                                  .checkreg188:
  4308 000018FD 68[8D1A]                 push checkreg_19
  4309 00001900 8D06BB69                 lea  ax, [symbol]
  4310 00001904 50                       push ax
  4311 00001905 E87BE9                   call eqstr
  4312 00001908 83C404                   add  sp, 4
  4313 0000190B 08C0                     or  al, al
  4314 0000190D 0F840600                 je .checkreg189
  4315 00001911 B82700                   mov ax, 39
  4316 00001914 E93C01                   jmp .retncheckreg
  4317                                  
  4318                                  ;-542   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4319                                  
  4320                                  .checkreg189:
  4321 00001917 68[901A]                 push checkreg_20
  4322 0000191A 8D06BB69                 lea  ax, [symbol]
  4323 0000191E 50                       push ax
  4324 0000191F E861E9                   call eqstr
  4325 00001922 83C404                   add  sp, 4
  4326 00001925 08C0                     or  al, al
  4327 00001927 0F840600                 je .checkreg190
  4328 0000192B B82900                   mov ax, 41
  4329 0000192E E92201                   jmp .retncheckreg
  4330                                  .checkreg190:
  4331 00001931 68[931A]                 push checkreg_21
  4332 00001934 8D06BB69                 lea  ax, [symbol]
  4333 00001938 50                       push ax
  4334 00001939 E847E9                   call eqstr
  4335 0000193C 83C404                   add  sp, 4
  4336 0000193F 08C0                     or  al, al
  4337 00001941 0F840600                 je .checkreg191
  4338 00001945 B82B00                   mov ax, 43
  4339 00001948 E90801                   jmp .retncheckreg
  4340                                  
  4341                                  ;-543   // (eqstr(symbol,"ip")) return 45;
  4342                                  
  4343                                  
  4344                                  ;-544   if (strlen(symbol) >   3) return 0;
  4345                                  
  4346                                  .checkreg191:
  4347 0000194B 8D06BB69                 lea  ax, [symbol]
  4348 0000194F 50                       push ax
  4349 00001950 E8D2E8                   call strlen
  4350 00001953 83C402                   add  sp, 2
  4351 00001956 83F803                   cmp ax, 3
  4352 00001959 0F8E0600                 jle .checkreg192
  4353 0000195D B80000                   mov ax, 0
  4354 00001960 E9F000                   jmp .retncheckreg
  4355                                  
  4356                                  ;-545   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4357                                  
  4358                                  .checkreg192:
  4359 00001963 68[961A]                 push checkreg_22
  4360 00001966 8D06BB69                 lea  ax, [symbol]
  4361 0000196A 50                       push ax
  4362 0000196B E815E9                   call eqstr
  4363 0000196E 83C404                   add  sp, 4
  4364 00001971 08C0                     or  al, al
  4365 00001973 0F840600                 je .checkreg193
  4366 00001977 B82F00                   mov ax, 47
  4367 0000197A E9D600                   jmp .retncheckreg
  4368                                  .checkreg193:
  4369 0000197D 68[9A1A]                 push checkreg_23
  4370 00001980 8D06BB69                 lea  ax, [symbol]
  4371 00001984 50                       push ax
  4372 00001985 E8FBE8                   call eqstr
  4373 00001988 83C404                   add  sp, 4
  4374 0000198B 08C0                     or  al, al
  4375 0000198D 0F840600                 je .checkreg194
  4376 00001991 B83200                   mov ax, 50
  4377 00001994 E9BC00                   jmp .retncheckreg
  4378                                  
  4379                                  ;-546   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4380                                  
  4381                                  .checkreg194:
  4382 00001997 68[9E1A]                 push checkreg_24
  4383 0000199A 8D06BB69                 lea  ax, [symbol]
  4384 0000199E 50                       push ax
  4385 0000199F E8E1E8                   call eqstr
  4386 000019A2 83C404                   add  sp, 4
  4387 000019A5 08C0                     or  al, al
  4388 000019A7 0F840600                 je .checkreg195
  4389 000019AB B83500                   mov ax, 53
  4390 000019AE E9A200                   jmp .retncheckreg
  4391                                  .checkreg195:
  4392 000019B1 68[A21A]                 push checkreg_25
  4393 000019B4 8D06BB69                 lea  ax, [symbol]
  4394 000019B8 50                       push ax
  4395 000019B9 E8C7E8                   call eqstr
  4396 000019BC 83C404                   add  sp, 4
  4397 000019BF 08C0                     or  al, al
  4398 000019C1 0F840600                 je .checkreg196
  4399 000019C5 B83800                   mov ax, 56
  4400 000019C8 E98800                   jmp .retncheckreg
  4401                                  
  4402                                  ;-547   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4403                                  
  4404                                  .checkreg196:
  4405 000019CB 68[A61A]                 push checkreg_26
  4406 000019CE 8D06BB69                 lea  ax, [symbol]
  4407 000019D2 50                       push ax
  4408 000019D3 E8ADE8                   call eqstr
  4409 000019D6 83C404                   add  sp, 4
  4410 000019D9 08C0                     or  al, al
  4411 000019DB 0F840600                 je .checkreg197
  4412 000019DF B83B00                   mov ax, 59
  4413 000019E2 E96E00                   jmp .retncheckreg
  4414                                  .checkreg197:
  4415 000019E5 68[AA1A]                 push checkreg_27
  4416 000019E8 8D06BB69                 lea  ax, [symbol]
  4417 000019EC 50                       push ax
  4418 000019ED E893E8                   call eqstr
  4419 000019F0 83C404                   add  sp, 4
  4420 000019F3 08C0                     or  al, al
  4421 000019F5 0F840600                 je .checkreg198
  4422 000019F9 B83E00                   mov ax, 62
  4423 000019FC E95400                   jmp .retncheckreg
  4424                                  
  4425                                  ;-548   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4426                                  
  4427                                  .checkreg198:
  4428 000019FF 68[AE1A]                 push checkreg_28
  4429 00001A02 8D06BB69                 lea  ax, [symbol]
  4430 00001A06 50                       push ax
  4431 00001A07 E879E8                   call eqstr
  4432 00001A0A 83C404                   add  sp, 4
  4433 00001A0D 08C0                     or  al, al
  4434 00001A0F 0F840600                 je .checkreg199
  4435 00001A13 B84100                   mov ax, 65
  4436 00001A16 E93A00                   jmp .retncheckreg
  4437                                  .checkreg199:
  4438 00001A19 68[B21A]                 push checkreg_29
  4439 00001A1C 8D06BB69                 lea  ax, [symbol]
  4440 00001A20 50                       push ax
  4441 00001A21 E85FE8                   call eqstr
  4442 00001A24 83C404                   add  sp, 4
  4443 00001A27 08C0                     or  al, al
  4444 00001A29 0F840600                 je .checkreg200
  4445 00001A2D B84400                   mov ax, 68
  4446 00001A30 E92000                   jmp .retncheckreg
  4447                                  
  4448                                  ;-549   if (eqstr(symbol,"cr0")) return 71;
  4449                                  
  4450                                  .checkreg200:
  4451 00001A33 68[B61A]                 push checkreg_30
  4452 00001A36 8D06BB69                 lea  ax, [symbol]
  4453 00001A3A 50                       push ax
  4454 00001A3B E845E8                   call eqstr
  4455 00001A3E 83C404                   add  sp, 4
  4456 00001A41 08C0                     or  al, al
  4457 00001A43 0F840600                 je .checkreg201
  4458 00001A47 B84700                   mov ax, 71
  4459 00001A4A E90600                   jmp .retncheckreg
  4460                                  
  4461                                  ;-550   return 0;   }
  4462                                  
  4463                                  .checkreg201:
  4464 00001A4D B80000                   mov ax, 0
  4465 00001A50 E90000                   jmp .retncheckreg
  4466                                  
  4467                                  ;-551 
  4468                                  
  4469                                  
  4470                                  ;-552 char printregstr[]
  4471                                  
  4472                                   .retncheckreg:
  4473 00001A53 C3                       ret
  4474 00001A54 616C00                  checkreg_0 db "al",0
  4475 00001A57 636C00                  checkreg_1 db "cl",0
  4476 00001A5A 646C00                  checkreg_2 db "dl",0
  4477 00001A5D 626C00                  checkreg_3 db "bl",0
  4478 00001A60 616800                  checkreg_4 db "ah",0
  4479 00001A63 636800                  checkreg_5 db "ch",0
  4480 00001A66 646800                  checkreg_6 db "dh",0
  4481 00001A69 626800                  checkreg_7 db "bh",0
  4482 00001A6C 617800                  checkreg_8 db "ax",0
  4483 00001A6F 637800                  checkreg_9 db "cx",0
  4484 00001A72 647800                  checkreg_10 db "dx",0
  4485 00001A75 627800                  checkreg_11 db "bx",0
  4486 00001A78 737000                  checkreg_12 db "sp",0
  4487 00001A7B 627000                  checkreg_13 db "bp",0
  4488 00001A7E 736900                  checkreg_14 db "si",0
  4489 00001A81 646900                  checkreg_15 db "di",0
  4490 00001A84 657300                  checkreg_16 db "es",0
  4491 00001A87 637300                  checkreg_17 db "cs",0
  4492 00001A8A 737300                  checkreg_18 db "ss",0
  4493 00001A8D 647300                  checkreg_19 db "ds",0
  4494 00001A90 667300                  checkreg_20 db "fs",0
  4495 00001A93 677300                  checkreg_21 db "gs",0
  4496 00001A96 65617800                checkreg_22 db "eax",0
  4497 00001A9A 65637800                checkreg_23 db "ecx",0
  4498 00001A9E 65647800                checkreg_24 db "edx",0
  4499 00001AA2 65627800                checkreg_25 db "ebx",0
  4500 00001AA6 65737000                checkreg_26 db "esp",0
  4501 00001AAA 65627000                checkreg_27 db "ebp",0
  4502 00001AAE 65736900                checkreg_28 db "esi",0
  4503 00001AB2 65646900                checkreg_29 db "edi",0
  4504 00001AB6 63723000                checkreg_30 db "cr0",0
  4505                                  ENDP
  4506                                  
  4507                                  ;-553 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4508                                  
  4509 00001ABA 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4510 00001AC3 616863686468626861-
  4511 00001ACC 786378647862787370-
  4512 00001AD5 627073696469657363-
  4513 00001ADE 737373647366736773-
  4514 00001AE7 697065617865637865-
  4515 00001AF0 647865627865737065-
  4516 00001AF9 627065736965646963-
  4517 00001B02 723000             
  4518                                  
  4519                                  ;-554 
  4520                                  
  4521                                  
  4522                                  ;-555 int printreg(int i) {  unsigned int k; unsigned char c;
  4523                                  
  4524                                  
  4525                                  printreg: PROC
  4526                                  
  4527                                  ;-556   k = &printregstr + i; c=*k; prc(c); i++;
  4528                                  
  4529                                  ;Function : printreg, Number of local variables: 3
  4530                                  ;   # type sign width addr used name   list of local variables
  4531                                  ;  200 var sign word   555 NULL i = bp+4
  4532                                  ;  201 var unsg word   555 NULL k = bp-2
  4533                                  ;  202 var unsg byte   555 NULL c = bp-4;
  4534 00001B05 C8040000                 ENTER  4,0
  4535 00001B09 B8[BA1A]                 mov ax, printregstr
  4536 00001B0C 034604                   add ax, [bp+4]
  4537 00001B0F 8946FE                   mov [bp-2], ax
  4538 00001B12 8B5EFE                   mov bx, [bp-2]
  4539 00001B15 8B07                     mov ax, [bx]
  4540 00001B17 8846FC                   mov [bp-4], al
  4541 00001B1A 8A46FC                   mov al, byte [bp-4]
  4542 00001B1D B400                     mov ah, 0
  4543 00001B1F 50                       push ax
  4544 00001B20 E8C0E9                   call prc
  4545 00001B23 83C402                   add  sp, 2
  4546 00001B26 FF4604                   inc  word[bp+4]
  4547                                  
  4548                                  ;-557   k = &printregstr + i; c=*k; prc(c);
  4549                                  
  4550 00001B29 B8[BA1A]                 mov ax, printregstr
  4551 00001B2C 034604                   add ax, [bp+4]
  4552 00001B2F 8946FE                   mov [bp-2], ax
  4553 00001B32 8B5EFE                   mov bx, [bp-2]
  4554 00001B35 8B07                     mov ax, [bx]
  4555 00001B37 8846FC                   mov [bp-4], al
  4556 00001B3A 8A46FC                   mov al, byte [bp-4]
  4557 00001B3D B400                     mov ah, 0
  4558 00001B3F 50                       push ax
  4559 00001B40 E8A0E9                   call prc
  4560 00001B43 83C402                   add  sp, 2
  4561                                  
  4562                                  ;-558   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4563                                  
  4564 00001B46 8B4604                   mov ax, [bp+4]
  4565 00001B49 83F82F                   cmp ax, 47
  4566 00001B4C 0F8E2000                 jle .printreg202
  4567 00001B50 FF4604                   inc  word[bp+4]
  4568 00001B53 B8[BA1A]                 mov ax, printregstr
  4569 00001B56 034604                   add ax, [bp+4]
  4570 00001B59 8946FE                   mov [bp-2], ax
  4571 00001B5C 8B5EFE                   mov bx, [bp-2]
  4572 00001B5F 8B07                     mov ax, [bx]
  4573 00001B61 8846FC                   mov [bp-4], al
  4574 00001B64 8A46FC                   mov al, byte [bp-4]
  4575 00001B67 B400                     mov ah, 0
  4576 00001B69 50                       push ax
  4577 00001B6A E876E9                   call prc
  4578 00001B6D 83C402                   add  sp, 2
  4579                                  
  4580                                  ;-559 }
  4581                                  
  4582                                  .printreg202:
  4583                                  
  4584                                  ;-560 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4585 00001B70 C9                       LEAVE
  4586 00001B71 C3                       ret
  4587                                  ENDP
  4588 00001B72 0000                    evalue dw 0
  4589 00001B74 0A00                    exprtype dw 10
  4590                                  
  4591                                  ;-561 int expr(int isRight)
  4592                                  
  4593                                  
  4594                                  expr: PROC
  4595                                  
  4596                                  ;-562 { int mode; int id1;     int ixarr; int ixconst;
  4597                                  
  4598                                  
  4599                                  ;-563   int ids;  int isCONST; int i;     unsigned char *p;
  4600                                  
  4601                                  
  4602                                  ;-564   if (istoken(T_CONST)) { evalue=lexval;
  4603                                  
  4604                                  ;Function : expr, Number of local variables: 9
  4605                                  ;   # type sign width addr used name   list of local variables
  4606                                  ;  200 var sign word   561 NULL isRight = bp+4
  4607                                  ;  201 var sign word   562 NULL mode = bp-2
  4608                                  ;  202 var sign word   562 NULL id1 = bp-4
  4609                                  ;  203 var sign word   562 NULL ixarr = bp-6
  4610                                  ;  204 var sign word   562 NULL ixconst = bp-8
  4611                                  ;  205 var sign word   563 NULL ids = bp-10
  4612                                  ;  206 var sign word   563 NULL isCONST = bp-12
  4613                                  ;  207 var sign word   563 NULL i = bp-14
  4614                                  ;  208 ptr unsg byte   563 NULL p = bp-16;
  4615 00001B76 C8100000                 ENTER  16,0
  4616 00001B7A 680101                   push 257
  4617 00001B7D E895E8                   call istoken
  4618 00001B80 83C402                   add  sp, 2
  4619 00001B83 08C0                     or  al, al
  4620 00001B85 0F841F00                 je .expr203
  4621 00001B89 A1[3000]                 mov ax, [lexval]
  4622 00001B8C A3[721B]                 mov word [evalue], ax
  4623                                  
  4624                                  ;-565     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4625                                  
  4626 00001B8F 68[161F]                 push expr_0
  4627 00001B92 E8B5E9                   call prs
  4628 00001B95 83C402                   add  sp, 2
  4629 00001B98 FF36[3000]               push word [lexval]
  4630 00001B9C E800EB                   call prunsign1
  4631 00001B9F 83C402                   add  sp, 2
  4632 00001BA2 B80400                   mov ax, 4
  4633 00001BA5 E96C03                   jmp .retnexpr
  4634                                  
  4635                                  ;-566   mode=typeName(); /*0=V,1=*,2=&*/
  4636                                  
  4637                                  .expr203:
  4638 00001BA8 E8CBF1                   call typeName
  4639 00001BAB 8946FE                   mov [bp-2], ax
  4640                                  
  4641                                  ;-567   ireg1=checkreg();
  4642                                  
  4643 00001BAE E846FB                   call checkreg
  4644 00001BB1 A3[7413]                 mov word [ireg1], ax
  4645                                  
  4646                                  ;-568   if (ireg1) { doreg1(0); return; }
  4647                                  
  4648 00001BB4 A1[7413]                 mov ax, [ireg1]
  4649 00001BB7 08C0                     or  al, al
  4650 00001BB9 0F840B00                 je .expr204
  4651 00001BBD 6A00                     push 0
  4652 00001BBF E849F9                   call doreg1
  4653 00001BC2 83C402                   add  sp, 2
  4654 00001BC5 E94C03                   jmp .retnexpr
  4655                                  
  4656                                  ;-569   if (token=='(')  {docall1(); goto e1; }
  4657                                  
  4658                                  .expr204:
  4659 00001BC8 A1[1E00]                 mov ax, [token]
  4660 00001BCB 83F828                   cmp ax, 40
  4661 00001BCE 0F850600                 jne .expr205
  4662 00001BD2 E82F0F                   call docall1
  4663 00001BD5 E93202                   jmp .e1
  4664                                  
  4665                                  ;-570   if (isreg()) goto e1;
  4666                                  
  4667                                  .expr205:
  4668 00001BD8 E88407                   call isreg
  4669 00001BDB 08C0                     or  al, al
  4670 00001BDD 0F840300                 je .expr206
  4671 00001BE1 E92602                   jmp .e1
  4672                                  
  4673                                  ;-571 
  4674                                  
  4675                                  
  4676                                  ;-572   id1=searchname(); gettypes(id1); ids=signi;
  4677                                  
  4678                                  .expr206:
  4679 00001BE4 E8C0F0                   call searchname
  4680 00001BE7 8946FC                   mov [bp-4], ax
  4681 00001BEA FF76FC                   push word [bp-4]
  4682 00001BED E879EF                   call gettypes
  4683 00001BF0 83C402                   add  sp, 2
  4684 00001BF3 A1[3500]                 mov ax, [signi]
  4685 00001BF6 8946F6                   mov [bp-10], ax
  4686                                  
  4687                                  ;-573   ixarr=0;  ixconst=0;
  4688                                  
  4689 00001BF9 B80000                   mov ax, 0
  4690 00001BFC 8946FA                   mov [bp-6], ax
  4691 00001BFF B80000                   mov ax, 0
  4692 00001C02 8946F8                   mov [bp-8], ax
  4693                                  
  4694                                  ;-574     if (istoken('[')) { if (istoken(T_CONST)) {
  4695                                  
  4696 00001C05 6A5B                     push 91
  4697 00001C07 E80BE8                   call istoken
  4698 00001C0A 83C402                   add  sp, 2
  4699 00001C0D 08C0                     or  al, al
  4700 00001C0F 0F845900                 je .expr207
  4701 00001C13 680101                   push 257
  4702 00001C16 E8FCE7                   call istoken
  4703 00001C19 83C402                   add  sp, 2
  4704 00001C1C 08C0                     or  al, al
  4705 00001C1E 0F841700                 je .expr208
  4706                                  
  4707                                  ;-575       ixconst=1; ixarr=lexval; expect(']');  }
  4708                                  
  4709 00001C22 B80100                   mov ax, 1
  4710 00001C25 8946F8                   mov [bp-8], ax
  4711 00001C28 A1[3000]                 mov ax, [lexval]
  4712 00001C2B 8946FA                   mov [bp-6], ax
  4713 00001C2E 6A5D                     push 93
  4714 00001C30 E804E8                   call expect
  4715 00001C33 83C402                   add  sp, 2
  4716                                  
  4717                                  ;-576     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4718                                  
  4719 00001C36 E93300                   jmp .expr209
  4720                                  .expr208:
  4721 00001C39 E86BF0                   call searchname
  4722 00001C3C 8946FA                   mov [bp-6], ax
  4723 00001C3F 680001                   push 256
  4724 00001C42 E8F2E7                   call expect
  4725 00001C45 83C402                   add  sp, 2
  4726 00001C48 6A5D                     push 93
  4727 00001C4A E8EAE7                   call expect
  4728 00001C4D 83C402                   add  sp, 2
  4729                                  
  4730                                  ;-577     gettypes(ixarr);
  4731                                  
  4732 00001C50 FF76FA                   push word [bp-6]
  4733 00001C53 E813EF                   call gettypes
  4734 00001C56 83C402                   add  sp, 2
  4735                                  
  4736                                  ;-578     if (widthi != 2) error1("Array index must be number or int"); } }
  4737                                  
  4738 00001C59 A1[3800]                 mov ax, [widthi]
  4739 00001C5C 83F802                   cmp ax, 2
  4740 00001C5F 0F840900                 je  .expr210
  4741 00001C63 68[221F]                 push expr_1
  4742 00001C66 E83720                   call error1
  4743 00001C69 83C402                   add  sp, 2
  4744                                  .expr210:
  4745                                  .expr209:
  4746                                  
  4747                                  ;-579   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  4748                                  
  4749                                  .expr207:
  4750 00001C6C 68C304                   push 1219
  4751 00001C6F E8A3E7                   call istoken
  4752 00001C72 83C402                   add  sp, 2
  4753 00001C75 08C0                     or  al, al
  4754 00001C77 0F844600                 je .expr211
  4755 00001C7B 8B46FE                   mov ax, [bp-2]
  4756 00001C7E 08C0                     or  al, al
  4757 00001C80 0F840900                 je .expr212
  4758 00001C84 68[441F]                 push expr_2
  4759 00001C87 E81620                   call error1
  4760 00001C8A 83C402                   add  sp, 2
  4761                                  
  4762                                  ;-580      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4763                                  
  4764                                  .expr212:
  4765 00001C8D 68[551F]                 push expr_3
  4766 00001C90 E8B7E8                   call prs
  4767 00001C93 83C402                   add  sp, 2
  4768 00001C96 A1[3B00]                 mov ax, [wi]
  4769 00001C99 83F802                   cmp ax, 2
  4770 00001C9C 0F850C00                 jne .expr213
  4771 00001CA0 68[5E1F]                 push expr_4
  4772 00001CA3 E8A4E8                   call prs
  4773 00001CA6 83C402                   add  sp, 2
  4774 00001CA9 E90900                   jmp .expr214
  4775                                  .expr213:
  4776 00001CAC 68[631F]                 push expr_5
  4777 00001CAF E898E8                   call prs
  4778 00001CB2 83C402                   add  sp, 2
  4779                                  
  4780                                  ;-581      v(id1); goto e1;}
  4781                                  
  4782                                  .expr214:
  4783 00001CB5 FF76FC                   push word [bp-4]
  4784 00001CB8 E8BDE6                   call v
  4785 00001CBB 83C402                   add  sp, 2
  4786 00001CBE E94901                   jmp .e1
  4787                                  
  4788                                  ;-582   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  4789                                  
  4790                                  .expr211:
  4791 00001CC1 68C904                   push 1225
  4792 00001CC4 E84EE7                   call istoken
  4793 00001CC7 83C402                   add  sp, 2
  4794 00001CCA 08C0                     or  al, al
  4795 00001CCC 0F844600                 je .expr215
  4796 00001CD0 8B46FE                   mov ax, [bp-2]
  4797 00001CD3 08C0                     or  al, al
  4798 00001CD5 0F840900                 je .expr216
  4799 00001CD9 68[681F]                 push expr_6
  4800 00001CDC E8C11F                   call error1
  4801 00001CDF 83C402                   add  sp, 2
  4802                                  
  4803                                  ;-583      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4804                                  
  4805                                  .expr216:
  4806 00001CE2 68[791F]                 push expr_7
  4807 00001CE5 E862E8                   call prs
  4808 00001CE8 83C402                   add  sp, 2
  4809 00001CEB A1[3B00]                 mov ax, [wi]
  4810 00001CEE 83F802                   cmp ax, 2
  4811 00001CF1 0F850C00                 jne .expr217
  4812 00001CF5 68[821F]                 push expr_8
  4813 00001CF8 E84FE8                   call prs
  4814 00001CFB 83C402                   add  sp, 2
  4815 00001CFE E90900                   jmp .expr218
  4816                                  .expr217:
  4817 00001D01 68[871F]                 push expr_9
  4818 00001D04 E843E8                   call prs
  4819 00001D07 83C402                   add  sp, 2
  4820                                  
  4821                                  ;-584      v(id1); goto e1;}
  4822                                  
  4823                                  .expr218:
  4824 00001D0A FF76FC                   push word [bp-4]
  4825 00001D0D E868E6                   call v
  4826 00001D10 83C402                   add  sp, 2
  4827 00001D13 E9F400                   jmp .e1
  4828                                  
  4829                                  ;-585 
  4830                                  
  4831                                  
  4832                                  ;-586   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4833                                  
  4834                                  .expr215:
  4835 00001D16 68CE04                   push 1230
  4836 00001D19 E8F9E6                   call istoken
  4837 00001D1C 83C402                   add  sp, 2
  4838 00001D1F 08C0                     or  al, al
  4839 00001D21 0F841200                 je .expr219
  4840 00001D25 FF76FC                   push word [bp-4]
  4841 00001D28 FF76FE                   push word [bp-2]
  4842 00001D2B 68[8C1F]                 push expr_10
  4843 00001D2E E8A902                   call compoundass
  4844 00001D31 83C406                   add  sp, 6
  4845 00001D34 E9D300                   jmp .e1
  4846                                  
  4847                                  ;-587   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4848                                  
  4849                                  .expr219:
  4850 00001D37 68CF04                   push 1231
  4851 00001D3A E8D8E6                   call istoken
  4852 00001D3D 83C402                   add  sp, 2
  4853 00001D40 08C0                     or  al, al
  4854 00001D42 0F841200                 je .expr220
  4855 00001D46 FF76FC                   push word [bp-4]
  4856 00001D49 FF76FE                   push word [bp-2]
  4857 00001D4C 68[901F]                 push expr_11
  4858 00001D4F E88802                   call compoundass
  4859 00001D52 83C406                   add  sp, 6
  4860 00001D55 E9B200                   jmp .e1
  4861                                  
  4862                                  ;-588   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4863                                  
  4864                                  .expr220:
  4865 00001D58 68D204                   push 1234
  4866 00001D5B E8B7E6                   call istoken
  4867 00001D5E 83C402                   add  sp, 2
  4868 00001D61 08C0                     or  al, al
  4869 00001D63 0F841200                 je .expr221
  4870 00001D67 FF76FC                   push word [bp-4]
  4871 00001D6A FF76FE                   push word [bp-2]
  4872 00001D6D 68[941F]                 push expr_12
  4873 00001D70 E86702                   call compoundass
  4874 00001D73 83C406                   add  sp, 6
  4875 00001D76 E99100                   jmp .e1
  4876                                  
  4877                                  ;-589   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  4878                                  
  4879                                  .expr221:
  4880 00001D79 68D304                   push 1235
  4881 00001D7C E896E6                   call istoken
  4882 00001D7F 83C402                   add  sp, 2
  4883 00001D82 08C0                     or  al, al
  4884 00001D84 0F841200                 je .expr222
  4885 00001D88 FF76FC                   push word [bp-4]
  4886 00001D8B FF76FE                   push word [bp-2]
  4887 00001D8E 68[981F]                 push expr_13
  4888 00001D91 E84602                   call compoundass
  4889 00001D94 83C406                   add  sp, 6
  4890 00001D97 E97000                   jmp .e1
  4891                                  
  4892                                  ;-590   if (istoken(T_MULASS    )) {error1("not implemented");}
  4893                                  
  4894                                  .expr222:
  4895 00001D9A 68D004                   push 1232
  4896 00001D9D E875E6                   call istoken
  4897 00001DA0 83C402                   add  sp, 2
  4898 00001DA3 08C0                     or  al, al
  4899 00001DA5 0F840900                 je .expr223
  4900 00001DA9 68[9B1F]                 push expr_14
  4901 00001DAC E8F11E                   call error1
  4902 00001DAF 83C402                   add  sp, 2
  4903                                  
  4904                                  ;-591   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4905                                  
  4906                                  .expr223:
  4907 00001DB2 68D104                   push 1233
  4908 00001DB5 E85DE6                   call istoken
  4909 00001DB8 83C402                   add  sp, 2
  4910 00001DBB 08C0                     or  al, al
  4911 00001DBD 0F840900                 je .expr224
  4912 00001DC1 68[AB1F]                 push expr_15
  4913 00001DC4 E8D91E                   call error1
  4914 00001DC7 83C402                   add  sp, 2
  4915                                  
  4916                                  ;-592 
  4917                                  
  4918                                  
  4919                                  ;-593   if (istoken('=')) { exprtype= expr(1);
  4920                                  
  4921                                  .expr224:
  4922 00001DCA 6A3D                     push 61
  4923 00001DCC E846E6                   call istoken
  4924 00001DCF 83C402                   add  sp, 2
  4925 00001DD2 08C0                     or  al, al
  4926 00001DD4 0F842000                 je .expr225
  4927 00001DD8 6A01                     push 1
  4928 00001DDA E899FD                   call expr
  4929 00001DDD 83C402                   add  sp, 2
  4930 00001DE0 A3[741B]                 mov word [exprtype], ax
  4931                                  
  4932                                  ;-594   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4933                                  
  4934 00001DE3 FF76F8                   push word [bp-8]
  4935 00001DE6 FF76FA                   push word [bp-6]
  4936 00001DE9 FF76FC                   push word [bp-4]
  4937 00001DEC FF76FE                   push word [bp-2]
  4938 00001DEF E85F08                   call doassign
  4939 00001DF2 83C408                   add  sp, 8
  4940 00001DF5 E91200                   jmp .e1
  4941                                  
  4942                                  ;-595   dovar1(mode, "mov", ixarr, id1);
  4943                                  
  4944                                  .expr225:
  4945 00001DF8 FF76FC                   push word [bp-4]
  4946 00001DFB FF76FA                   push word [bp-6]
  4947 00001DFE 68[BB1F]                 push expr_16
  4948 00001E01 FF76FE                   push word [bp-2]
  4949 00001E04 E87502                   call dovar1
  4950 00001E07 83C408                   add  sp, 8
  4951                                  
  4952                                  ;-596 
  4953                                  
  4954                                  
  4955                                  ;-597 e1:    if (istoken('+')) rterm("add");
  4956                                  
  4957                                  .e1:
  4958 00001E0A 6A2B                     push 43
  4959 00001E0C E806E6                   call istoken
  4960 00001E0F 83C402                   add  sp, 2
  4961 00001E12 08C0                     or  al, al
  4962 00001E14 0F840C00                 je .expr226
  4963 00001E18 68[BF1F]                 push expr_17
  4964 00001E1B E82804                   call rterm
  4965 00001E1E 83C402                   add  sp, 2
  4966                                  
  4967                                  ;-598   else if (istoken('-')) rterm("sub" );
  4968                                  
  4969 00001E21 E9CF00                   jmp .expr227
  4970                                  .expr226:
  4971 00001E24 6A2D                     push 45
  4972 00001E26 E8ECE5                   call istoken
  4973 00001E29 83C402                   add  sp, 2
  4974 00001E2C 08C0                     or  al, al
  4975 00001E2E 0F840C00                 je .expr228
  4976 00001E32 68[C31F]                 push expr_18
  4977 00001E35 E80E04                   call rterm
  4978 00001E38 83C402                   add  sp, 2
  4979                                  
  4980                                  ;-599   else if (istoken('&')) rterm("and" );
  4981                                  
  4982 00001E3B E9B500                   jmp .expr229
  4983                                  .expr228:
  4984 00001E3E 6A26                     push 38
  4985 00001E40 E8D2E5                   call istoken
  4986 00001E43 83C402                   add  sp, 2
  4987 00001E46 08C0                     or  al, al
  4988 00001E48 0F840C00                 je .expr230
  4989 00001E4C 68[C71F]                 push expr_19
  4990 00001E4F E8F403                   call rterm
  4991 00001E52 83C402                   add  sp, 2
  4992                                  
  4993                                  ;-600   else if (istoken('|')) rterm("or" );
  4994                                  
  4995 00001E55 E99B00                   jmp .expr231
  4996                                  .expr230:
  4997 00001E58 6A7C                     push 124
  4998 00001E5A E8B8E5                   call istoken
  4999 00001E5D 83C402                   add  sp, 2
  5000 00001E60 08C0                     or  al, al
  5001 00001E62 0F840C00                 je .expr232
  5002 00001E66 68[CB1F]                 push expr_20
  5003 00001E69 E8DA03                   call rterm
  5004 00001E6C 83C402                   add  sp, 2
  5005                                  
  5006                                  ;-601   else if (istoken(T_LESSLESS)) rterm("shl");
  5007                                  
  5008 00001E6F E98100                   jmp .expr233
  5009                                  .expr232:
  5010 00001E72 68D804                   push 1240
  5011 00001E75 E89DE5                   call istoken
  5012 00001E78 83C402                   add  sp, 2
  5013 00001E7B 08C0                     or  al, al
  5014 00001E7D 0F840C00                 je .expr234
  5015 00001E81 68[CE1F]                 push expr_21
  5016 00001E84 E8BF03                   call rterm
  5017 00001E87 83C402                   add  sp, 2
  5018                                  
  5019                                  ;-602   else if (istoken(T_GREATGREAT)) rterm("shr");
  5020                                  
  5021 00001E8A E96600                   jmp .expr235
  5022                                  .expr234:
  5023 00001E8D 68D904                   push 1241
  5024 00001E90 E882E5                   call istoken
  5025 00001E93 83C402                   add  sp, 2
  5026 00001E96 08C0                     or  al, al
  5027 00001E98 0F840C00                 je .expr236
  5028 00001E9C 68[D21F]                 push expr_22
  5029 00001E9F E8A403                   call rterm
  5030 00001EA2 83C402                   add  sp, 2
  5031                                  
  5032                                  ;-603   else if (istoken('*')) domul (ids);
  5033                                  
  5034 00001EA5 E94B00                   jmp .expr237
  5035                                  .expr236:
  5036 00001EA8 6A2A                     push 42
  5037 00001EAA E868E5                   call istoken
  5038 00001EAD 83C402                   add  sp, 2
  5039 00001EB0 08C0                     or  al, al
  5040 00001EB2 0F840C00                 je .expr238
  5041 00001EB6 FF76F6                   push word [bp-10]
  5042 00001EB9 E8DE09                   call domul
  5043 00001EBC 83C402                   add  sp, 2
  5044                                  
  5045                                  ;-604   else if (istoken('/')) doidiv(ids);
  5046                                  
  5047 00001EBF E93100                   jmp .expr239
  5048                                  .expr238:
  5049 00001EC2 6A2F                     push 47
  5050 00001EC4 E84EE5                   call istoken
  5051 00001EC7 83C402                   add  sp, 2
  5052 00001ECA 08C0                     or  al, al
  5053 00001ECC 0F840C00                 je .expr240
  5054 00001ED0 FF76F6                   push word [bp-10]
  5055 00001ED3 E8650A                   call doidiv
  5056 00001ED6 83C402                   add  sp, 2
  5057                                  
  5058                                  ;-605   else if (istoken('%')) domod (ids);
  5059                                  
  5060 00001ED9 E91700                   jmp .expr241
  5061                                  .expr240:
  5062 00001EDC 6A25                     push 37
  5063 00001EDE E834E5                   call istoken
  5064 00001EE1 83C402                   add  sp, 2
  5065 00001EE4 08C0                     or  al, al
  5066 00001EE6 0F840900                 je .expr242
  5067 00001EEA FF76F6                   push word [bp-10]
  5068 00001EED E8EE0B                   call domod
  5069 00001EF0 83C402                   add  sp, 2
  5070                                  
  5071                                  ;-606   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  5072                                  
  5073                                  .expr242:
  5074                                  .expr241:
  5075                                  .expr239:
  5076                                  .expr237:
  5077                                  .expr235:
  5078                                  .expr233:
  5079                                  .expr231:
  5080                                  .expr229:
  5081                                  .expr227:
  5082 00001EF3 E8CC12                   call isrelational
  5083 00001EF6 08C0                     or  al, al
  5084 00001EF8 0F841200                 je .expr243
  5085 00001EFC 68[D61F]                 push expr_23
  5086 00001EFF E84403                   call rterm
  5087 00001F02 83C402                   add  sp, 2
  5088 00001F05 FF76F6                   push word [bp-10]
  5089 00001F08 E8F90F                   call cmpneg
  5090 00001F0B 83C402                   add  sp, 2
  5091                                  
  5092                                  ;-607   return 0;
  5093                                  
  5094                                  .expr243:
  5095 00001F0E B80000                   mov ax, 0
  5096 00001F11 E90000                   jmp .retnexpr
  5097                                  
  5098                                  ;-608 }
  5099                                  
  5100                                  
  5101                                  ;-609 
  5102                                  
  5103                                  
  5104                                  ;-610 int compoundass(char *op, int mode, int id1) {
  5105                                  
  5106 00001F14 C9                       .retnexpr: LEAVE
  5107 00001F15 C3                       ret
  5108 00001F16 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  5109 00001F1F 2C2000             
  5110 00001F22 417272617920696E64-     expr_1 db "Array index must be number or int",0
  5111 00001F2B 6578206D7573742062-
  5112 00001F34 65206E756D62657220-
  5113 00001F3D 6F7220696E7400     
  5114 00001F44 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  5115 00001F4D 616C6C6F77656400   
  5116 00001F55 5C6E20696E63202000      expr_3 db "\n inc  ",0
  5117 00001F5E 776F726400              expr_4 db "word",0
  5118 00001F63 6279746500              expr_5 db "byte",0
  5119 00001F68 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  5120 00001F71 616C6C6F77656400   
  5121 00001F79 5C6E20646563202000      expr_7 db "\n dec  ",0
  5122 00001F82 776F726400              expr_8 db "word",0
  5123 00001F87 6279746500              expr_9 db "byte",0
  5124 00001F8C 61646400                expr_10 db "add",0
  5125 00001F90 73756200                expr_11 db "sub",0
  5126 00001F94 616E6400                expr_12 db "and",0
  5127 00001F98 6F7200                  expr_13 db "or",0
  5128 00001F9B 6E6F7420696D706C65-     expr_14 db "not implemented",0
  5129 00001FA4 6D656E74656400     
  5130 00001FAB 6E6F7420696D706C65-     expr_15 db "not implemented",0
  5131 00001FB4 6D656E74656400     
  5132 00001FBB 6D6F7600                expr_16 db "mov",0
  5133 00001FBF 61646400                expr_17 db "add",0
  5134 00001FC3 73756200                expr_18 db "sub",0
  5135 00001FC7 616E6400                expr_19 db "and",0
  5136 00001FCB 6F7200                  expr_20 db "or",0
  5137 00001FCE 73686C00                expr_21 db "shl",0
  5138 00001FD2 73687200                expr_22 db "shr",0
  5139 00001FD6 636D7000                expr_23 db "cmp",0
  5140                                  ENDP
  5141                                  
  5142                                  compoundass: PROC
  5143                                  
  5144                                  ;-611   if(mode) error1("only scalar Var allowed");
  5145                                  
  5146                                  ;Function : compoundass, Number of local variables: 3
  5147                                  ;   # type sign width addr used name   list of local variables
  5148                                  ;  200 ptr sign byte   610 NULL op = bp+4
  5149                                  ;  201 var sign word   610 NULL mode = bp+6
  5150                                  ;  202 var sign word   610 NULL id1 = bp+8;
  5151 00001FDA C8000000                 ENTER  0,0
  5152 00001FDE 8B4606                   mov ax, [bp+6]
  5153 00001FE1 08C0                     or  al, al
  5154 00001FE3 0F840900                 je .compoundass244
  5155 00001FE7 68[5420]                 push compoundass_0
  5156 00001FEA E8B31C                   call error1
  5157 00001FED 83C402                   add  sp, 2
  5158                                  
  5159                                  ;-612   prnl(); prs(op); prs("  ");
  5160                                  
  5161                                  .compoundass244:
  5162 00001FF0 E849E5                   call prnl
  5163 00001FF3 FF7604                   push word [bp+4]
  5164 00001FF6 E851E5                   call prs
  5165 00001FF9 83C402                   add  sp, 2
  5166 00001FFC 68[6C20]                 push compoundass_1
  5167 00001FFF E848E5                   call prs
  5168 00002002 83C402                   add  sp, 2
  5169                                  
  5170                                  ;-613   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5171                                  
  5172 00002005 FF7608                   push word [bp+8]
  5173 00002008 E85EEB                   call gettypes
  5174 0000200B 83C402                   add  sp, 2
  5175 0000200E A1[3B00]                 mov ax, [wi]
  5176 00002011 83F802                   cmp ax, 2
  5177 00002014 0F850C00                 jne .compoundass245
  5178 00002018 68[6F20]                 push compoundass_2
  5179 0000201B E82CE5                   call prs
  5180 0000201E 83C402                   add  sp, 2
  5181 00002021 E90900                   jmp .compoundass246
  5182                                  .compoundass245:
  5183 00002024 68[7420]                 push compoundass_3
  5184 00002027 E820E5                   call prs
  5185 0000202A 83C402                   add  sp, 2
  5186                                  
  5187                                  ;-614   v(id1); prs(", ");
  5188                                  
  5189                                  .compoundass246:
  5190 0000202D FF7608                   push word [bp+8]
  5191 00002030 E845E3                   call v
  5192 00002033 83C402                   add  sp, 2
  5193 00002036 68[7920]                 push compoundass_4
  5194 00002039 E80EE5                   call prs
  5195 0000203C 83C402                   add  sp, 2
  5196                                  
  5197                                  ;-615   expect(T_CONST); prunsign1(lexval);
  5198                                  
  5199 0000203F 680101                   push 257
  5200 00002042 E8F2E3                   call expect
  5201 00002045 83C402                   add  sp, 2
  5202 00002048 FF36[3000]               push word [lexval]
  5203 0000204C E850E6                   call prunsign1
  5204 0000204F 83C402                   add  sp, 2
  5205                                  
  5206                                  ;-616 }
  5207                                  
  5208                                  
  5209                                  ;-617 int dovar1(int mode, int op, int ixarr, int id1) {
  5210 00002052 C9                       LEAVE
  5211 00002053 C3                       ret
  5212 00002054 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5213 0000205D 61722056617220616C-
  5214 00002066 6C6F77656400       
  5215 0000206C 202000                  compoundass_1 db "  ",0
  5216 0000206F 776F726400              compoundass_2 db "word",0
  5217 00002074 6279746500              compoundass_3 db "byte",0
  5218 00002079 2C2000                  compoundass_4 db ", ",0
  5219                                  ENDP
  5220                                  
  5221                                  dovar1: PROC
  5222                                  
  5223                                  ;-618   gettypes(id1);
  5224                                  
  5225                                  ;Function : dovar1, Number of local variables: 4
  5226                                  ;   # type sign width addr used name   list of local variables
  5227                                  ;  200 var sign word   617 NULL mode = bp+4
  5228                                  ;  201 var sign word   617 NULL op = bp+6
  5229                                  ;  202 var sign word   617 NULL ixarr = bp+8
  5230                                  ;  203 var sign word   617 NULL id1 = bp+10;
  5231 0000207C C8000000                 ENTER  0,0
  5232 00002080 FF760A                   push word [bp+10]
  5233 00002083 E8E3EA                   call gettypes
  5234 00002086 83C402                   add  sp, 2
  5235                                  
  5236                                  ;-619   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5237                                  
  5238 00002089 8B4604                   mov ax, [bp+4]
  5239 0000208C 83F801                   cmp ax, 1
  5240 0000208F 0F854700                 jne .dovar1247
  5241 00002093 68[D121]                 push dovar1_0
  5242 00002096 E8B1E4                   call prs
  5243 00002099 83C402                   add  sp, 2
  5244 0000209C FF760A                   push word [bp+10]
  5245 0000209F E8D6E2                   call v
  5246 000020A2 83C402                   add  sp, 2
  5247 000020A5 E894E4                   call prnl
  5248 000020A8 FF7606                   push word [bp+6]
  5249 000020AB E89CE4                   call prs
  5250 000020AE 83C402                   add  sp, 2
  5251                                  
  5252                                  ;-620     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5253                                  
  5254 000020B1 A1[3800]                 mov ax, [widthi]
  5255 000020B4 83F801                   cmp ax, 1
  5256 000020B7 0F850900                 jne .dovar1248
  5257 000020BB 68[DD21]                 push dovar1_1
  5258 000020BE E889E4                   call prs
  5259 000020C1 83C402                   add  sp, 2
  5260                                  
  5261                                  ;-621     if(widthi == 2) prs(" ax, [bx]");
  5262                                  
  5263                                  .dovar1248:
  5264 000020C4 A1[3800]                 mov ax, [widthi]
  5265 000020C7 83F802                   cmp ax, 2
  5266 000020CA 0F850900                 jne .dovar1249
  5267 000020CE 68[F321]                 push dovar1_2
  5268 000020D1 E876E4                   call prs
  5269 000020D4 83C402                   add  sp, 2
  5270                                  
  5271                                  ;-622     return; }
  5272                                  
  5273                                  .dovar1249:
  5274 000020D7 E9F500                   jmp .retndovar1
  5275                                  
  5276                                  ;-623   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5277                                  
  5278                                  .dovar1247:
  5279 000020DA 8B4604                   mov ax, [bp+4]
  5280 000020DD 83F802                   cmp ax, 2
  5281 000020E0 0F852100                 jne .dovar1250
  5282 000020E4 E855E4                   call prnl
  5283 000020E7 FF7606                   push word [bp+6]
  5284 000020EA E85DE4                   call prs
  5285 000020ED 83C402                   add  sp, 2
  5286 000020F0 68[FD21]                 push dovar1_3
  5287 000020F3 E854E4                   call prs
  5288 000020F6 83C402                   add  sp, 2
  5289 000020F9 FF760A                   push word [bp+10]
  5290 000020FC E86AE2                   call a
  5291 000020FF 83C402                   add  sp, 2
  5292 00002102 E9CA00                   jmp .retndovar1
  5293                                  
  5294                                  ;-624   if (ixarr) {
  5295                                  
  5296                                  .dovar1250:
  5297 00002105 8B4608                   mov ax, [bp+8]
  5298 00002108 08C0                     or  al, al
  5299 0000210A 0F847300                 je .dovar1251
  5300                                  
  5301                                  ;-625     prs("\n mov bx, "); v(ixarr);
  5302                                  
  5303 0000210E 68[0322]                 push dovar1_4
  5304 00002111 E836E4                   call prs
  5305 00002114 83C402                   add  sp, 2
  5306 00002117 FF7608                   push word [bp+8]
  5307 0000211A E85BE2                   call v
  5308 0000211D 83C402                   add  sp, 2
  5309                                  
  5310                                  ;-626     if (wi==2) prs("\n shl bx, 1");
  5311                                  
  5312 00002120 A1[3B00]                 mov ax, [wi]
  5313 00002123 83F802                   cmp ax, 2
  5314 00002126 0F850900                 jne .dovar1252
  5315 0000212A 68[0F22]                 push dovar1_5
  5316 0000212D E81AE4                   call prs
  5317 00002130 83C402                   add  sp, 2
  5318                                  
  5319                                  ;-627     prs("\n "); prs(op);
  5320                                  
  5321                                  .dovar1252:
  5322 00002133 68[1C22]                 push dovar1_6
  5323 00002136 E811E4                   call prs
  5324 00002139 83C402                   add  sp, 2
  5325 0000213C FF7606                   push word [bp+6]
  5326 0000213F E808E4                   call prs
  5327 00002142 83C402                   add  sp, 2
  5328                                  
  5329                                  ;-628     if (wi==2) prs(" ax, "); else prs(" al, ");
  5330                                  
  5331 00002145 A1[3B00]                 mov ax, [wi]
  5332 00002148 83F802                   cmp ax, 2
  5333 0000214B 0F850C00                 jne .dovar1253
  5334 0000214F 68[2022]                 push dovar1_7
  5335 00002152 E8F5E3                   call prs
  5336 00002155 83C402                   add  sp, 2
  5337 00002158 E90900                   jmp .dovar1254
  5338                                  .dovar1253:
  5339 0000215B 68[2622]                 push dovar1_8
  5340 0000215E E8E9E3                   call prs
  5341 00002161 83C402                   add  sp, 2
  5342                                  
  5343                                  ;-629 // v(id1); prs(" [bx]");
  5344                                  
  5345                                  
  5346                                  ;-630     prc('['); printName(id1); prs(" + bx]");
  5347                                  
  5348                                  .dovar1254:
  5349 00002164 6A5B                     push 91
  5350 00002166 E87AE3                   call prc
  5351 00002169 83C402                   add  sp, 2
  5352 0000216C FF760A                   push word [bp+10]
  5353 0000216F E8D1EA                   call printName
  5354 00002172 83C402                   add  sp, 2
  5355 00002175 68[2C22]                 push dovar1_9
  5356 00002178 E8CFE3                   call prs
  5357 0000217B 83C402                   add  sp, 2
  5358                                  
  5359                                  ;-631     return; }
  5360                                  
  5361 0000217E E94E00                   jmp .retndovar1
  5362                                  
  5363                                  ;-632   prnl();prs(op);
  5364                                  
  5365                                  .dovar1251:
  5366 00002181 E8B8E3                   call prnl
  5367 00002184 FF7606                   push word [bp+6]
  5368 00002187 E8C0E3                   call prs
  5369 0000218A 83C402                   add  sp, 2
  5370                                  
  5371                                  ;-633   if(wi==1) prs(" al, ");
  5372                                  
  5373 0000218D A1[3B00]                 mov ax, [wi]
  5374 00002190 83F801                   cmp ax, 1
  5375 00002193 0F850900                 jne .dovar1255
  5376 00002197 68[3322]                 push dovar1_10
  5377 0000219A E8ADE3                   call prs
  5378 0000219D 83C402                   add  sp, 2
  5379                                  
  5380                                  ;-634   if(wi==2) prs(" ax, ");
  5381                                  
  5382                                  .dovar1255:
  5383 000021A0 A1[3B00]                 mov ax, [wi]
  5384 000021A3 83F802                   cmp ax, 2
  5385 000021A6 0F850900                 jne .dovar1256
  5386 000021AA 68[3922]                 push dovar1_11
  5387 000021AD E89AE3                   call prs
  5388 000021B0 83C402                   add  sp, 2
  5389                                  
  5390                                  ;-635   if(wi==4) prs(" eax, ");
  5391                                  
  5392                                  .dovar1256:
  5393 000021B3 A1[3B00]                 mov ax, [wi]
  5394 000021B6 83F804                   cmp ax, 4
  5395 000021B9 0F850900                 jne .dovar1257
  5396 000021BD 68[3F22]                 push dovar1_12
  5397 000021C0 E887E3                   call prs
  5398 000021C3 83C402                   add  sp, 2
  5399                                  
  5400                                  ;-636   v(id1);
  5401                                  
  5402                                  .dovar1257:
  5403 000021C6 FF760A                   push word [bp+10]
  5404 000021C9 E8ACE1                   call v
  5405 000021CC 83C402                   add  sp, 2
  5406                                  
  5407                                  ;-637 }
  5408                                  
  5409                                  
  5410                                  ;-638 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5411                                  
  5412 000021CF C9                       .retndovar1: LEAVE
  5413 000021D0 C3                       ret
  5414 000021D1 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5415 000021DA 2C2000             
  5416 000021DD 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5417 000021E6 5C6E206D6F76206168-
  5418 000021EF 2C203000           
  5419 000021F3 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5420 000021FC 00                 
  5421 000021FD 2061782C2000            dovar1_3 db " ax, ",0
  5422 00002203 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5423 0000220C 2C2000             
  5424 0000220F 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5425 00002218 2C203100           
  5426 0000221C 5C6E2000                dovar1_6 db "\n ",0
  5427 00002220 2061782C2000            dovar1_7 db " ax, ",0
  5428 00002226 20616C2C2000            dovar1_8 db " al, ",0
  5429 0000222C 202B2062785D00          dovar1_9 db " + bx]",0
  5430 00002233 20616C2C2000            dovar1_10 db " al, ",0
  5431 00002239 2061782C2000            dovar1_11 db " ax, ",0
  5432 0000223F 206561782C2000          dovar1_12 db " eax, ",0
  5433                                  ENDP
  5434                                  
  5435                                  rterm: PROC
  5436                                  
  5437                                  ;-639   if (istoken(T_CONST)) { prnl(); prs(op);
  5438                                  
  5439                                  ;Function : rterm, Number of local variables: 5
  5440                                  ;   # type sign width addr used name   list of local variables
  5441                                  ;  200 ptr sign byte   638 NULL op = bp+4
  5442                                  ;  201 var sign word   638 NULL mode = bp-2
  5443                                  ;  202 var sign word   638 NULL opint = bp-4
  5444                                  ;  203 var sign word   638 NULL ixarr = bp-6
  5445                                  ;  204 var sign word   638 NULL id1 = bp-8;
  5446 00002246 C8080000                 ENTER  8,0
  5447 0000224A 680101                   push 257
  5448 0000224D E8C5E1                   call istoken
  5449 00002250 83C402                   add  sp, 2
  5450 00002253 08C0                     or  al, al
  5451 00002255 0F845200                 je .rterm258
  5452 00002259 E8E0E2                   call prnl
  5453 0000225C FF7604                   push word [bp+4]
  5454 0000225F E8E8E2                   call prs
  5455 00002262 83C402                   add  sp, 2
  5456                                  
  5457                                  ;-640     if (wi==1) prs(" al, ");
  5458                                  
  5459 00002265 A1[3B00]                 mov ax, [wi]
  5460 00002268 83F801                   cmp ax, 1
  5461 0000226B 0F850900                 jne .rterm259
  5462 0000226F 68[2F23]                 push rterm_0
  5463 00002272 E8D5E2                   call prs
  5464 00002275 83C402                   add  sp, 2
  5465                                  
  5466                                  ;-641     if (wi==2) prs(" ax, ");
  5467                                  
  5468                                  .rterm259:
  5469 00002278 A1[3B00]                 mov ax, [wi]
  5470 0000227B 83F802                   cmp ax, 2
  5471 0000227E 0F850900                 jne .rterm260
  5472 00002282 68[3523]                 push rterm_1
  5473 00002285 E8C2E2                   call prs
  5474 00002288 83C402                   add  sp, 2
  5475                                  
  5476                                  ;-642     if (wi==4) prs(" eax, ");
  5477                                  
  5478                                  .rterm260:
  5479 0000228B A1[3B00]                 mov ax, [wi]
  5480 0000228E 83F804                   cmp ax, 4
  5481 00002291 0F850900                 jne .rterm261
  5482 00002295 68[3B23]                 push rterm_2
  5483 00002298 E8AFE2                   call prs
  5484 0000229B 83C402                   add  sp, 2
  5485                                  
  5486                                  ;-643     prunsign1(lexval); return;}
  5487                                  
  5488                                  .rterm261:
  5489 0000229E FF36[3000]               push word [lexval]
  5490 000022A2 E8FAE3                   call prunsign1
  5491 000022A5 83C402                   add  sp, 2
  5492 000022A8 E98200                   jmp .retnrterm
  5493                                  
  5494                                  ;-644   mode=typeName(); id1=searchname(); ixarr=0;
  5495                                  
  5496                                  .rterm258:
  5497 000022AB E8C8EA                   call typeName
  5498 000022AE 8946FE                   mov [bp-2], ax
  5499 000022B1 E8F3E9                   call searchname
  5500 000022B4 8946F8                   mov [bp-8], ax
  5501 000022B7 B80000                   mov ax, 0
  5502 000022BA 8946FA                   mov [bp-6], ax
  5503                                  
  5504                                  ;-645   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5505                                  
  5506 000022BD 6A5B                     push 91
  5507 000022BF E853E1                   call istoken
  5508 000022C2 83C402                   add  sp, 2
  5509 000022C5 08C0                     or  al, al
  5510 000022C7 0F843300                 je .rterm262
  5511 000022CB E8D9E9                   call searchname
  5512 000022CE 8946FA                   mov [bp-6], ax
  5513 000022D1 680001                   push 256
  5514 000022D4 E860E1                   call expect
  5515 000022D7 83C402                   add  sp, 2
  5516 000022DA 6A5D                     push 93
  5517 000022DC E858E1                   call expect
  5518 000022DF 83C402                   add  sp, 2
  5519                                  
  5520                                  ;-646     gettypes(ixarr);
  5521                                  
  5522 000022E2 FF76FA                   push word [bp-6]
  5523 000022E5 E881E8                   call gettypes
  5524 000022E8 83C402                   add  sp, 2
  5525                                  
  5526                                  ;-647     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5527                                  
  5528 000022EB A1[3800]                 mov ax, [widthi]
  5529 000022EE 83F802                   cmp ax, 2
  5530 000022F1 0F840900                 je  .rterm263
  5531 000022F5 68[4223]                 push rterm_3
  5532 000022F8 E8A519                   call error1
  5533 000022FB 83C402                   add  sp, 2
  5534                                  .rterm263:
  5535                                  
  5536                                  ;-648   if (eqstr(symbol,"_AX")) return;
  5537                                  
  5538                                  .rterm262:
  5539 000022FE 68[5B23]                 push rterm_4
  5540 00002301 8D06BB69                 lea  ax, [symbol]
  5541 00002305 50                       push ax
  5542 00002306 E87ADF                   call eqstr
  5543 00002309 83C404                   add  sp, 4
  5544 0000230C 08C0                     or  al, al
  5545 0000230E 0F840300                 je .rterm264
  5546 00002312 E91800                   jmp .retnrterm
  5547                                  
  5548                                  ;-649   opint=op; dovar1(mode, opint, ixarr, id1);
  5549                                  
  5550                                  .rterm264:
  5551 00002315 8B4604                   mov ax, [bp+4]
  5552 00002318 8946FC                   mov [bp-4], ax
  5553 0000231B FF76F8                   push word [bp-8]
  5554 0000231E FF76FA                   push word [bp-6]
  5555 00002321 FF76FC                   push word [bp-4]
  5556 00002324 FF76FE                   push word [bp-2]
  5557 00002327 E852FD                   call dovar1
  5558 0000232A 83C408                   add  sp, 8
  5559                                  
  5560                                  ;-650 }
  5561                                  
  5562                                  
  5563                                  ;-651 int isreg() {
  5564                                  
  5565 0000232D C9                       .retnrterm: LEAVE
  5566 0000232E C3                       ret
  5567 0000232F 20616C2C2000            rterm_0 db " al, ",0
  5568 00002335 2061782C2000            rterm_1 db " ax, ",0
  5569 0000233B 206561782C2000          rterm_2 db " eax, ",0
  5570 00002342 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5571 0000234B 78206D75737320696E-
  5572 00002354 74207365696E00     
  5573 0000235B 5F415800                rterm_4 db "_AX",0
  5574                                  ENDP
  5575                                  
  5576                                  isreg: PROC
  5577                                  
  5578                                  ;-652   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5579                                  
  5580 0000235F 68[4C25]                 push isreg_0
  5581 00002362 8D06BB69                 lea  ax, [symbol]
  5582 00002366 50                       push ax
  5583 00002367 E819DF                   call eqstr
  5584 0000236A 83C404                   add  sp, 4
  5585 0000236D 08C0                     or  al, al
  5586 0000236F 0F840C00                 je .isreg265
  5587 00002373 68[5025]                 push isreg_1
  5588 00002376 E84202                   call doreg
  5589 00002379 83C402                   add  sp, 2
  5590 0000237C E9C601                   jmp .r1
  5591                                  
  5592                                  ;-653   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5593                                  
  5594                                  .isreg265:
  5595 0000237F 68[5325]                 push isreg_2
  5596 00002382 8D06BB69                 lea  ax, [symbol]
  5597 00002386 50                       push ax
  5598 00002387 E8F9DE                   call eqstr
  5599 0000238A 83C404                   add  sp, 4
  5600 0000238D 08C0                     or  al, al
  5601 0000238F 0F840C00                 je .isreg266
  5602 00002393 68[5725]                 push isreg_3
  5603 00002396 E82202                   call doreg
  5604 00002399 83C402                   add  sp, 2
  5605 0000239C E9A601                   jmp .r1
  5606                                  
  5607                                  ;-654   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5608                                  
  5609                                  .isreg266:
  5610 0000239F 68[5A25]                 push isreg_4
  5611 000023A2 8D06BB69                 lea  ax, [symbol]
  5612 000023A6 50                       push ax
  5613 000023A7 E8D9DE                   call eqstr
  5614 000023AA 83C404                   add  sp, 4
  5615 000023AD 08C0                     or  al, al
  5616 000023AF 0F840C00                 je .isreg267
  5617 000023B3 68[5E25]                 push isreg_5
  5618 000023B6 E80202                   call doreg
  5619 000023B9 83C402                   add  sp, 2
  5620 000023BC E98601                   jmp .r1
  5621                                  
  5622                                  ;-655   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5623                                  
  5624                                  .isreg267:
  5625 000023BF 68[6125]                 push isreg_6
  5626 000023C2 8D06BB69                 lea  ax, [symbol]
  5627 000023C6 50                       push ax
  5628 000023C7 E8B9DE                   call eqstr
  5629 000023CA 83C404                   add  sp, 4
  5630 000023CD 08C0                     or  al, al
  5631 000023CF 0F840C00                 je .isreg268
  5632 000023D3 68[6525]                 push isreg_7
  5633 000023D6 E8E201                   call doreg
  5634 000023D9 83C402                   add  sp, 2
  5635 000023DC E96601                   jmp .r1
  5636                                  
  5637                                  ;-656   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5638                                  
  5639                                  .isreg268:
  5640 000023DF 68[6825]                 push isreg_8
  5641 000023E2 8D06BB69                 lea  ax, [symbol]
  5642 000023E6 50                       push ax
  5643 000023E7 E899DE                   call eqstr
  5644 000023EA 83C404                   add  sp, 4
  5645 000023ED 08C0                     or  al, al
  5646 000023EF 0F840C00                 je .isreg269
  5647 000023F3 68[6C25]                 push isreg_9
  5648 000023F6 E8C201                   call doreg
  5649 000023F9 83C402                   add  sp, 2
  5650 000023FC E94601                   jmp .r1
  5651                                  
  5652                                  ;-657   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5653                                  
  5654                                  .isreg269:
  5655 000023FF 68[6F25]                 push isreg_10
  5656 00002402 8D06BB69                 lea  ax, [symbol]
  5657 00002406 50                       push ax
  5658 00002407 E879DE                   call eqstr
  5659 0000240A 83C404                   add  sp, 4
  5660 0000240D 08C0                     or  al, al
  5661 0000240F 0F840C00                 je .isreg270
  5662 00002413 68[7325]                 push isreg_11
  5663 00002416 E8A201                   call doreg
  5664 00002419 83C402                   add  sp, 2
  5665 0000241C E92601                   jmp .r1
  5666                                  
  5667                                  ;-658   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5668                                  
  5669                                  .isreg270:
  5670 0000241F 68[7625]                 push isreg_12
  5671 00002422 8D06BB69                 lea  ax, [symbol]
  5672 00002426 50                       push ax
  5673 00002427 E859DE                   call eqstr
  5674 0000242A 83C404                   add  sp, 4
  5675 0000242D 08C0                     or  al, al
  5676 0000242F 0F840C00                 je .isreg271
  5677 00002433 68[7A25]                 push isreg_13
  5678 00002436 E88201                   call doreg
  5679 00002439 83C402                   add  sp, 2
  5680 0000243C E90601                   jmp .r1
  5681                                  
  5682                                  ;-659   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5683                                  
  5684                                  .isreg271:
  5685 0000243F 68[7D25]                 push isreg_14
  5686 00002442 8D06BB69                 lea  ax, [symbol]
  5687 00002446 50                       push ax
  5688 00002447 E839DE                   call eqstr
  5689 0000244A 83C404                   add  sp, 4
  5690 0000244D 08C0                     or  al, al
  5691 0000244F 0F840C00                 je .isreg272
  5692 00002453 68[8125]                 push isreg_15
  5693 00002456 E86201                   call doreg
  5694 00002459 83C402                   add  sp, 2
  5695 0000245C E9E600                   jmp .r1
  5696                                  
  5697                                  ;-660   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5698                                  
  5699                                  .isreg272:
  5700 0000245F 68[8425]                 push isreg_16
  5701 00002462 8D06BB69                 lea  ax, [symbol]
  5702 00002466 50                       push ax
  5703 00002467 E819DE                   call eqstr
  5704 0000246A 83C404                   add  sp, 4
  5705 0000246D 08C0                     or  al, al
  5706 0000246F 0F840C00                 je .isreg273
  5707 00002473 68[8825]                 push isreg_17
  5708 00002476 E84201                   call doreg
  5709 00002479 83C402                   add  sp, 2
  5710 0000247C E9C600                   jmp .r1
  5711                                  
  5712                                  ;-661   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5713                                  
  5714                                  .isreg273:
  5715 0000247F 68[8B25]                 push isreg_18
  5716 00002482 8D06BB69                 lea  ax, [symbol]
  5717 00002486 50                       push ax
  5718 00002487 E8F9DD                   call eqstr
  5719 0000248A 83C404                   add  sp, 4
  5720 0000248D 08C0                     or  al, al
  5721 0000248F 0F840C00                 je .isreg274
  5722 00002493 68[8F25]                 push isreg_19
  5723 00002496 E82201                   call doreg
  5724 00002499 83C402                   add  sp, 2
  5725 0000249C E9A600                   jmp .r1
  5726                                  
  5727                                  ;-662   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5728                                  
  5729                                  .isreg274:
  5730 0000249F 68[9225]                 push isreg_20
  5731 000024A2 8D06BB69                 lea  ax, [symbol]
  5732 000024A6 50                       push ax
  5733 000024A7 E8D9DD                   call eqstr
  5734 000024AA 83C404                   add  sp, 4
  5735 000024AD 08C0                     or  al, al
  5736 000024AF 0F840C00                 je .isreg275
  5737 000024B3 68[9625]                 push isreg_21
  5738 000024B6 E80201                   call doreg
  5739 000024B9 83C402                   add  sp, 2
  5740 000024BC E98600                   jmp .r1
  5741                                  
  5742                                  ;-663   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5743                                  
  5744                                  .isreg275:
  5745 000024BF 68[9925]                 push isreg_22
  5746 000024C2 8D06BB69                 lea  ax, [symbol]
  5747 000024C6 50                       push ax
  5748 000024C7 E8B9DD                   call eqstr
  5749 000024CA 83C404                   add  sp, 4
  5750 000024CD 08C0                     or  al, al
  5751 000024CF 0F840C00                 je .isreg276
  5752 000024D3 68[9D25]                 push isreg_23
  5753 000024D6 E8E200                   call doreg
  5754 000024D9 83C402                   add  sp, 2
  5755 000024DC E96600                   jmp .r1
  5756                                  
  5757                                  ;-664   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5758                                  
  5759                                  .isreg276:
  5760 000024DF 68[A025]                 push isreg_24
  5761 000024E2 8D06BB69                 lea  ax, [symbol]
  5762 000024E6 50                       push ax
  5763 000024E7 E899DD                   call eqstr
  5764 000024EA 83C404                   add  sp, 4
  5765 000024ED 08C0                     or  al, al
  5766 000024EF 0F840C00                 je .isreg277
  5767 000024F3 68[A425]                 push isreg_25
  5768 000024F6 E8C200                   call doreg
  5769 000024F9 83C402                   add  sp, 2
  5770 000024FC E94600                   jmp .r1
  5771                                  
  5772                                  ;-665   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5773                                  
  5774                                  .isreg277:
  5775 000024FF 68[A725]                 push isreg_26
  5776 00002502 8D06BB69                 lea  ax, [symbol]
  5777 00002506 50                       push ax
  5778 00002507 E879DD                   call eqstr
  5779 0000250A 83C404                   add  sp, 4
  5780 0000250D 08C0                     or  al, al
  5781 0000250F 0F840C00                 je .isreg278
  5782 00002513 68[AB25]                 push isreg_27
  5783 00002516 E8A200                   call doreg
  5784 00002519 83C402                   add  sp, 2
  5785 0000251C E92600                   jmp .r1
  5786                                  
  5787                                  ;-666   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5788                                  
  5789                                  .isreg278:
  5790 0000251F 68[AE25]                 push isreg_28
  5791 00002522 8D06BB69                 lea  ax, [symbol]
  5792 00002526 50                       push ax
  5793 00002527 E859DD                   call eqstr
  5794 0000252A 83C404                   add  sp, 4
  5795 0000252D 08C0                     or  al, al
  5796 0000252F 0F840C00                 je .isreg279
  5797 00002533 68[B525]                 push isreg_29
  5798 00002536 E88200                   call doreg
  5799 00002539 83C402                   add  sp, 2
  5800 0000253C E90600                   jmp .r1
  5801                                  
  5802                                  ;-667   return 0;   r1: return 1;
  5803                                  
  5804                                  .isreg279:
  5805 0000253F B80000                   mov ax, 0
  5806 00002542 E90600                   jmp .retnisreg
  5807                                  .r1:
  5808 00002545 B80100                   mov ax, 1
  5809 00002548 E90000                   jmp .retnisreg
  5810                                  
  5811                                  ;-668 }
  5812                                  
  5813                                  
  5814                                  ;-669 int doreg(char *dr) { int i; expect('=');
  5815                                  
  5816                                   .retnisreg:
  5817 0000254B C3                       ret
  5818 0000254C 5F414800                isreg_0 db "_AH",0
  5819 00002550 616800                  isreg_1 db "ah",0
  5820 00002553 5F414C00                isreg_2 db "_AL",0
  5821 00002557 616C00                  isreg_3 db "al",0
  5822 0000255A 5F415800                isreg_4 db "_AX",0
  5823 0000255E 617800                  isreg_5 db "ax",0
  5824 00002561 5F424800                isreg_6 db "_BH",0
  5825 00002565 626800                  isreg_7 db "bh",0
  5826 00002568 5F424C00                isreg_8 db "_BL",0
  5827 0000256C 626C00                  isreg_9 db "bl",0
  5828 0000256F 5F425800                isreg_10 db "_BX",0
  5829 00002573 627800                  isreg_11 db "bx",0
  5830 00002576 5F434800                isreg_12 db "_CH",0
  5831 0000257A 636800                  isreg_13 db "ch",0
  5832 0000257D 5F434C00                isreg_14 db "_CL",0
  5833 00002581 636C00                  isreg_15 db "cl",0
  5834 00002584 5F435800                isreg_16 db "_CX",0
  5835 00002588 637800                  isreg_17 db "cx",0
  5836 0000258B 5F444800                isreg_18 db "_DH",0
  5837 0000258F 646800                  isreg_19 db "dh",0
  5838 00002592 5F444C00                isreg_20 db "_DL",0
  5839 00002596 646C00                  isreg_21 db "dl",0
  5840 00002599 5F445800                isreg_22 db "_DX",0
  5841 0000259D 647800                  isreg_23 db "dx",0
  5842 000025A0 5F534900                isreg_24 db "_SI",0
  5843 000025A4 736900                  isreg_25 db "si",0
  5844 000025A7 5F444900                isreg_26 db "_DI",0
  5845 000025AB 646900                  isreg_27 db "di",0
  5846 000025AE 5F464C41475300          isreg_28 db "_FLAGS",0
  5847 000025B5 666C61677300            isreg_29 db "flags",0
  5848                                  ENDP
  5849                                  
  5850                                  doreg: PROC
  5851                                  ;Function : doreg, Number of local variables: 2
  5852                                  ;   # type sign width addr used name   list of local variables
  5853                                  ;  200 ptr sign byte   669 NULL dr = bp+4
  5854                                  ;  201 var sign word   669 NULL i = bp-2;
  5855 000025BB C8020000                 ENTER  2,0
  5856 000025BF 6A3D                     push 61
  5857 000025C1 E873DE                   call expect
  5858 000025C4 83C402                   add  sp, 2
  5859                                  
  5860                                  ;-670   prs("\n mov  "); prs(dr); prs(", ");
  5861                                  
  5862 000025C7 68[2A26]                 push doreg_0
  5863 000025CA E87DDF                   call prs
  5864 000025CD 83C402                   add  sp, 2
  5865 000025D0 FF7604                   push word [bp+4]
  5866 000025D3 E874DF                   call prs
  5867 000025D6 83C402                   add  sp, 2
  5868 000025D9 68[3326]                 push doreg_1
  5869 000025DC E86BDF                   call prs
  5870 000025DF 83C402                   add  sp, 2
  5871                                  
  5872                                  ;-671        if (istoken(T_CONST)) prunsign1(lexval);
  5873                                  
  5874 000025E2 680101                   push 257
  5875 000025E5 E82DDE                   call istoken
  5876 000025E8 83C402                   add  sp, 2
  5877 000025EB 08C0                     or  al, al
  5878 000025ED 0F840D00                 je .doreg280
  5879 000025F1 FF36[3000]               push word [lexval]
  5880 000025F5 E8A7E0                   call prunsign1
  5881 000025F8 83C402                   add  sp, 2
  5882                                  
  5883                                  ;-672   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5884                                  
  5885 000025FB E92A00                   jmp .doreg281
  5886                                  .doreg280:
  5887 000025FE 680001                   push 256
  5888 00002601 E811DE                   call istoken
  5889 00002604 83C402                   add  sp, 2
  5890 00002607 08C0                     or  al, al
  5891 00002609 0F841200                 je .doreg282
  5892 0000260D E897E6                   call searchname
  5893 00002610 8946FE                   mov [bp-2], ax
  5894 00002613 FF76FE                   push word [bp-2]
  5895 00002616 E85FDD                   call v
  5896 00002619 83C402                   add  sp, 2
  5897                                  
  5898                                  ;-673   else error1("only number or var allowed"); }
  5899                                  
  5900 0000261C E90900                   jmp .doreg283
  5901                                  .doreg282:
  5902 0000261F 68[3626]                 push doreg_2
  5903 00002622 E87B16                   call error1
  5904 00002625 83C402                   add  sp, 2
  5905                                  .doreg283:
  5906                                  .doreg281:
  5907                                  
  5908                                  ;-674 
  5909                                  
  5910                                  
  5911                                  ;-675 int doassign(int mode, int i, int ixarr, int ixconst) {
  5912 00002628 C9                       LEAVE
  5913 00002629 C3                       ret
  5914 0000262A 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5915 00002633 2C2000                  doreg_1 db ", ",0
  5916 00002636 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5917 0000263F 6572206F7220766172-
  5918 00002648 20616C6C6F77656400 
  5919                                  ENDP
  5920                                  
  5921                                  doassign: PROC
  5922                                  
  5923                                  ;-676   gettypes(i);
  5924                                  
  5925                                  ;Function : doassign, Number of local variables: 4
  5926                                  ;   # type sign width addr used name   list of local variables
  5927                                  ;  200 var sign word   675 NULL mode = bp+4
  5928                                  ;  201 var sign word   675 NULL i = bp+6
  5929                                  ;  202 var sign word   675 NULL ixarr = bp+8
  5930                                  ;  203 var sign word   675 NULL ixconst = bp+10;
  5931 00002651 C8000000                 ENTER  0,0
  5932 00002655 FF7606                   push word [bp+6]
  5933 00002658 E80EE5                   call gettypes
  5934 0000265B 83C402                   add  sp, 2
  5935                                  
  5936                                  ;-677   if (mode==1) {prs("\n mov  bx, ");v(i);
  5937                                  
  5938 0000265E 8B4604                   mov ax, [bp+4]
  5939 00002661 83F801                   cmp ax, 1
  5940 00002664 0F853400                 jne .doassign284
  5941 00002668 68[EE27]                 push doassign_0
  5942 0000266B E8DCDE                   call prs
  5943 0000266E 83C402                   add  sp, 2
  5944 00002671 FF7606                   push word [bp+6]
  5945 00002674 E801DD                   call v
  5946 00002677 83C402                   add  sp, 2
  5947                                  
  5948                                  ;-678     if (widthi == 2) prs("\n mov  [bx], ax");
  5949                                  
  5950 0000267A A1[3800]                 mov ax, [widthi]
  5951 0000267D 83F802                   cmp ax, 2
  5952 00002680 0F850C00                 jne .doassign285
  5953 00002684 68[FB27]                 push doassign_1
  5954 00002687 E8C0DE                   call prs
  5955 0000268A 83C402                   add  sp, 2
  5956                                  
  5957                                  ;-679     else  prs("\n mov  [bx], al"); return;}
  5958                                  
  5959 0000268D E90900                   jmp .doassign286
  5960                                  .doassign285:
  5961 00002690 68[0C28]                 push doassign_2
  5962 00002693 E8B4DE                   call prs
  5963 00002696 83C402                   add  sp, 2
  5964                                  .doassign286:
  5965 00002699 E95001                   jmp .retndoassign
  5966                                  
  5967                                  ;-680   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5968                                  
  5969                                  .doassign284:
  5970 0000269C 8B4604                   mov ax, [bp+4]
  5971 0000269F 83F802                   cmp ax, 2
  5972 000026A2 0F851E00                 jne .doassign287
  5973 000026A6 68[1D28]                 push doassign_3
  5974 000026A9 E89EDE                   call prs
  5975 000026AC 83C402                   add  sp, 2
  5976 000026AF FF7606                   push word [bp+6]
  5977 000026B2 E8B4DC                   call a
  5978 000026B5 83C402                   add  sp, 2
  5979 000026B8 68[2628]                 push doassign_4
  5980 000026BB E88CDE                   call prs
  5981 000026BE 83C402                   add  sp, 2
  5982 000026C1 E92801                   jmp .retndoassign
  5983                                  
  5984                                  ;-681   if (ixarr) {  prs("\n mov bx, ");
  5985                                  
  5986                                  .doassign287:
  5987 000026C4 8B4608                   mov ax, [bp+8]
  5988 000026C7 08C0                     or  al, al
  5989 000026C9 0F846E00                 je .doassign288
  5990 000026CD 68[2B28]                 push doassign_5
  5991 000026D0 E877DE                   call prs
  5992 000026D3 83C402                   add  sp, 2
  5993                                  
  5994                                  ;-682     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5995                                  
  5996 000026D6 8B460A                   mov ax, [bp+10]
  5997 000026D9 08C0                     or  al, al
  5998 000026DB 0F840C00                 je .doassign289
  5999 000026DF FF7608                   push word [bp+8]
  6000 000026E2 E8BADF                   call prunsign1
  6001 000026E5 83C402                   add  sp, 2
  6002 000026E8 E90900                   jmp .doassign290
  6003                                  .doassign289:
  6004 000026EB FF7608                   push word [bp+8]
  6005 000026EE E887DC                   call v
  6006 000026F1 83C402                   add  sp, 2
  6007                                  
  6008                                  ;-683     if (wi==2) prs("\n shl bx, 1");
  6009                                  
  6010                                  .doassign290:
  6011 000026F4 A1[3B00]                 mov ax, [wi]
  6012 000026F7 83F802                   cmp ax, 2
  6013 000026FA 0F850900                 jne .doassign291
  6014 000026FE 68[3728]                 push doassign_6
  6015 00002701 E846DE                   call prs
  6016 00002704 83C402                   add  sp, 2
  6017                                  
  6018                                  ;-684     prs("\n mov ["); printName(i);
  6019                                  
  6020                                  .doassign291:
  6021 00002707 68[4428]                 push doassign_7
  6022 0000270A E83DDE                   call prs
  6023 0000270D 83C402                   add  sp, 2
  6024 00002710 FF7606                   push word [bp+6]
  6025 00002713 E82DE5                   call printName
  6026 00002716 83C402                   add  sp, 2
  6027                                  
  6028                                  ;-685     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  6029                                  
  6030 00002719 A1[3B00]                 mov ax, [wi]
  6031 0000271C 83F802                   cmp ax, 2
  6032 0000271F 0F850C00                 jne .doassign292
  6033 00002723 68[4D28]                 push doassign_8
  6034 00002726 E821DE                   call prs
  6035 00002729 83C402                   add  sp, 2
  6036 0000272C E90900                   jmp .doassign293
  6037                                  .doassign292:
  6038 0000272F 68[5628]                 push doassign_9
  6039 00002732 E815DE                   call prs
  6040 00002735 83C402                   add  sp, 2
  6041                                  .doassign293:
  6042 00002738 E9B100                   jmp .retndoassign
  6043                                  
  6044                                  ;-686   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  6045                                  
  6046                                  .doassign288:
  6047 0000273B A1[3B00]                 mov ax, [wi]
  6048 0000273E 83F801                   cmp ax, 1
  6049 00002741 0F853100                 jne .doassign294
  6050 00002745 68[5F28]                 push doassign_10
  6051 00002748 E8FFDD                   call prs
  6052 0000274B 83C402                   add  sp, 2
  6053 0000274E 8B4606                   mov ax, [bp+6]
  6054 00002751 3DC800                   cmp ax, 200
  6055 00002754 0F8D0900                 jge .doassign295
  6056 00002758 68[6728]                 push doassign_11
  6057 0000275B E8ECDD                   call prs
  6058 0000275E 83C402                   add  sp, 2
  6059                                  
  6060                                  ;-687     } v(i); prs(", al"); return; }
  6061                                  
  6062                                  .doassign295:
  6063 00002761 FF7606                   push word [bp+6]
  6064 00002764 E811DC                   call v
  6065 00002767 83C402                   add  sp, 2
  6066 0000276A 68[6D28]                 push doassign_12
  6067 0000276D E8DADD                   call prs
  6068 00002770 83C402                   add  sp, 2
  6069 00002773 E97600                   jmp .retndoassign
  6070                                  
  6071                                  ;-688   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  6072                                  
  6073                                  .doassign294:
  6074 00002776 A1[3B00]                 mov ax, [wi]
  6075 00002779 83F802                   cmp ax, 2
  6076 0000277C 0F853100                 jne .doassign296
  6077 00002780 68[7228]                 push doassign_13
  6078 00002783 E8C4DD                   call prs
  6079 00002786 83C402                   add  sp, 2
  6080 00002789 8B4606                   mov ax, [bp+6]
  6081 0000278C 3DC800                   cmp ax, 200
  6082 0000278F 0F8D0900                 jge .doassign297
  6083 00002793 68[7A28]                 push doassign_14
  6084 00002796 E8B1DD                   call prs
  6085 00002799 83C402                   add  sp, 2
  6086                                  
  6087                                  ;-689     } v(i); prs(", ax"); return; }
  6088                                  
  6089                                  .doassign297:
  6090 0000279C FF7606                   push word [bp+6]
  6091 0000279F E8D6DB                   call v
  6092 000027A2 83C402                   add  sp, 2
  6093 000027A5 68[8028]                 push doassign_15
  6094 000027A8 E89FDD                   call prs
  6095 000027AB 83C402                   add  sp, 2
  6096 000027AE E93B00                   jmp .retndoassign
  6097                                  
  6098                                  ;-690   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  6099                                  
  6100                                  .doassign296:
  6101 000027B1 A1[3B00]                 mov ax, [wi]
  6102 000027B4 83F804                   cmp ax, 4
  6103 000027B7 0F853100                 jne .doassign298
  6104 000027BB 68[8528]                 push doassign_16
  6105 000027BE E889DD                   call prs
  6106 000027C1 83C402                   add  sp, 2
  6107 000027C4 8B4606                   mov ax, [bp+6]
  6108 000027C7 3DC800                   cmp ax, 200
  6109 000027CA 0F8D0900                 jge .doassign299
  6110 000027CE 68[8D28]                 push doassign_17
  6111 000027D1 E876DD                   call prs
  6112 000027D4 83C402                   add  sp, 2
  6113                                  
  6114                                  ;-691     } v(i); prs(", eax"); return; }
  6115                                  
  6116                                  .doassign299:
  6117 000027D7 FF7606                   push word [bp+6]
  6118 000027DA E89BDB                   call v
  6119 000027DD 83C402                   add  sp, 2
  6120 000027E0 68[9428]                 push doassign_18
  6121 000027E3 E864DD                   call prs
  6122 000027E6 83C402                   add  sp, 2
  6123 000027E9 E90000                   jmp .retndoassign
  6124                                  
  6125                                  ;-692 }
  6126                                  
  6127                                  .doassign298:
  6128                                  
  6129                                  ;-693 int domul(int ids) {
  6130                                  
  6131 000027EC C9                       .retndoassign: LEAVE
  6132 000027ED C3                       ret
  6133 000027EE 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  6134 000027F7 782C2000           
  6135 000027FB 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  6136 00002804 62785D2C20617800   
  6137 0000280C 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  6138 00002815 62785D2C20616C00   
  6139 0000281D 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  6140 00002826 2C20617800              doassign_4 db ", ax",0
  6141 0000282B 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  6142 00002834 2C2000             
  6143 00002837 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  6144 00002840 2C203100           
  6145 00002844 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  6146 0000284D 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  6147 00002856 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  6148 0000285F 5C6E206D6F762000        doassign_10 db "\n mov ",0
  6149 00002867 627974652000            doassign_11 db "byte ",0
  6150 0000286D 2C20616C00              doassign_12 db ", al",0
  6151 00002872 5C6E206D6F762000        doassign_13 db "\n mov ",0
  6152 0000287A 776F72642000            doassign_14 db "word ",0
  6153 00002880 2C20617800              doassign_15 db ", ax",0
  6154 00002885 5C6E206D6F762000        doassign_16 db "\n mov ",0
  6155 0000288D 64776F72642000          doassign_17 db "dword ",0
  6156 00002894 2C2065617800            doassign_18 db ", eax",0
  6157                                  ENDP
  6158                                  
  6159                                  domul: PROC
  6160                                  
  6161                                  ;-694   if (ids) rterm("imul"); else {
  6162                                  
  6163                                  ;Function : domul, Number of local variables: 1
  6164                                  ;   # type sign width addr used name   list of local variables
  6165                                  ;  200 var sign word   693 NULL ids = bp+4;
  6166 0000289A C8000000                 ENTER  0,0
  6167 0000289E 8B4604                   mov ax, [bp+4]
  6168 000028A1 08C0                     or  al, al
  6169 000028A3 0F840C00                 je .domul300
  6170 000028A7 68[EC28]                 push domul_0
  6171 000028AA E899F9                   call rterm
  6172 000028AD 83C402                   add  sp, 2
  6173 000028B0 E93700                   jmp .domul301
  6174                                  .domul300:
  6175                                  
  6176                                  ;-695   if (istoken(T_CONST)) {
  6177                                  
  6178 000028B3 680101                   push 257
  6179 000028B6 E85CDB                   call istoken
  6180 000028B9 83C402                   add  sp, 2
  6181 000028BC 08C0                     or  al, al
  6182 000028BE 0F841F00                 je .domul302
  6183                                  
  6184                                  ;-696     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6185                                  
  6186 000028C2 68[F128]                 push domul_1
  6187 000028C5 E882DC                   call prs
  6188 000028C8 83C402                   add  sp, 2
  6189 000028CB FF36[3000]               push word [lexval]
  6190 000028CF E8CDDD                   call prunsign1
  6191 000028D2 83C402                   add  sp, 2
  6192 000028D5 68[FD28]                 push domul_2
  6193 000028D8 E86FDC                   call prs
  6194 000028DB 83C402                   add  sp, 2
  6195                                  
  6196                                  ;-697     }
  6197                                  
  6198                                  
  6199                                  ;-698   else error1("with MUL only const number as multiplicator allowed"); } }
  6200                                  
  6201 000028DE E90900                   jmp .domul303
  6202                                  .domul302:
  6203 000028E1 68[0729]                 push domul_3
  6204 000028E4 E8B913                   call error1
  6205 000028E7 83C402                   add  sp, 2
  6206                                  .domul303:
  6207                                  .domul301:
  6208                                  
  6209                                  ;-699 int doidiv(int ids) { int mode; int id1;
  6210 000028EA C9                       LEAVE
  6211 000028EB C3                       ret
  6212 000028EC 696D756C00              domul_0 db "imul",0
  6213 000028F1 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6214 000028FA 2C2000             
  6215 000028FD 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6216 00002906 00                 
  6217 00002907 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6218 00002910 6F6E6C7920636F6E73-
  6219 00002919 74206E756D62657220-
  6220 00002922 6173206D756C746970-
  6221 0000292B 6C696361746F722061-
  6222 00002934 6C6C6F77656400     
  6223                                  ENDP
  6224                                  
  6225                                  doidiv: PROC
  6226                                  
  6227                                  ;-700   if (istoken(T_CONST)) {
  6228                                  
  6229                                  ;Function : doidiv, Number of local variables: 3
  6230                                  ;   # type sign width addr used name   list of local variables
  6231                                  ;  200 var sign word   699 NULL ids = bp+4
  6232                                  ;  201 var sign word   699 NULL mode = bp-2
  6233                                  ;  202 var sign word   699 NULL id1 = bp-4;
  6234 0000293B C8040000                 ENTER  4,0
  6235 0000293F 680101                   push 257
  6236 00002942 E8D0DA                   call istoken
  6237 00002945 83C402                   add  sp, 2
  6238 00002948 08C0                     or  al, al
  6239 0000294A 0F843400                 je .doidiv304
  6240                                  
  6241                                  ;-701     prs("\n mov bx, "); prunsign1(lexval);
  6242                                  
  6243 0000294E 68[002A]                 push doidiv_0
  6244 00002951 E8F6DB                   call prs
  6245 00002954 83C402                   add  sp, 2
  6246 00002957 FF36[3000]               push word [lexval]
  6247 0000295B E841DD                   call prunsign1
  6248 0000295E 83C402                   add  sp, 2
  6249                                  
  6250                                  ;-702     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6251                                  
  6252 00002961 8B4604                   mov ax, [bp+4]
  6253 00002964 08C0                     or  al, al
  6254 00002966 0F840C00                 je .doidiv305
  6255 0000296A 68[0C2A]                 push doidiv_1
  6256 0000296D E8DADB                   call prs
  6257 00002970 83C402                   add  sp, 2
  6258 00002973 E90900                   jmp .doidiv306
  6259                                  .doidiv305:
  6260 00002976 68[1D2A]                 push doidiv_2
  6261 00002979 E8CEDB                   call prs
  6262 0000297C 83C402                   add  sp, 2
  6263                                  .doidiv306:
  6264                                  
  6265                                  ;-703   else {
  6266                                  
  6267 0000297F E97C00                   jmp .doidiv307
  6268                                  .doidiv304:
  6269                                  
  6270                                  ;-704     mode=typeName(); id1=searchname();
  6271                                  
  6272 00002982 E8F1E3                   call typeName
  6273 00002985 8946FE                   mov [bp-2], ax
  6274 00002988 E81CE3                   call searchname
  6275 0000298B 8946FC                   mov [bp-4], ax
  6276                                  
  6277                                  ;-705     if (mode) error1("only const number or int as divisor allowed");
  6278                                  
  6279 0000298E 8B46FE                   mov ax, [bp-2]
  6280 00002991 08C0                     or  al, al
  6281 00002993 0F840900                 je .doidiv308
  6282 00002997 68[332A]                 push doidiv_3
  6283 0000299A E80313                   call error1
  6284 0000299D 83C402                   add  sp, 2
  6285                                  
  6286                                  ;-706     gettypes(id1);
  6287                                  
  6288                                  .doidiv308:
  6289 000029A0 FF76FC                   push word [bp-4]
  6290 000029A3 E8C3E1                   call gettypes
  6291 000029A6 83C402                   add  sp, 2
  6292                                  
  6293                                  ;-707     if (typei) error1("only int as simple var divisor allowed");
  6294                                  
  6295 000029A9 A1[3200]                 mov ax, [typei]
  6296 000029AC 08C0                     or  al, al
  6297 000029AE 0F840900                 je .doidiv309
  6298 000029B2 68[5F2A]                 push doidiv_4
  6299 000029B5 E8E812                   call error1
  6300 000029B8 83C402                   add  sp, 2
  6301                                  
  6302                                  ;-708     if (wi!=2) error1("only int, no byte as divisor allowed");
  6303                                  
  6304                                  .doidiv309:
  6305 000029BB A1[3B00]                 mov ax, [wi]
  6306 000029BE 83F802                   cmp ax, 2
  6307 000029C1 0F840900                 je  .doidiv310
  6308 000029C5 68[862A]                 push doidiv_5
  6309 000029C8 E8D512                   call error1
  6310 000029CB 83C402                   add  sp, 2
  6311                                  
  6312                                  ;-709     prs("\n mov bx, "); v(id1);
  6313                                  
  6314                                  .doidiv310:
  6315 000029CE 68[AB2A]                 push doidiv_6
  6316 000029D1 E876DB                   call prs
  6317 000029D4 83C402                   add  sp, 2
  6318 000029D7 FF76FC                   push word [bp-4]
  6319 000029DA E89BD9                   call v
  6320 000029DD 83C402                   add  sp, 2
  6321                                  
  6322                                  ;-710     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6323                                  
  6324 000029E0 8B4604                   mov ax, [bp+4]
  6325 000029E3 08C0                     or  al, al
  6326 000029E5 0F840C00                 je .doidiv311
  6327 000029E9 68[B72A]                 push doidiv_7
  6328 000029EC E85BDB                   call prs
  6329 000029EF 83C402                   add  sp, 2
  6330 000029F2 E90900                   jmp .doidiv312
  6331                                  .doidiv311:
  6332 000029F5 68[C82A]                 push doidiv_8
  6333 000029F8 E84FDB                   call prs
  6334 000029FB 83C402                   add  sp, 2
  6335                                  .doidiv312:
  6336                                  
  6337                                  ;-711 }
  6338                                  
  6339                                  .doidiv307:
  6340                                  
  6341                                  ;-712 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6342 000029FE C9                       LEAVE
  6343 000029FF C3                       ret
  6344 00002A00 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6345 00002A09 2C2000             
  6346 00002A0C 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6347 00002A15 6964697620627800   
  6348 00002A1D 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6349 00002A26 2C20305C6E20646976-
  6350 00002A2F 20627800           
  6351 00002A33 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6352 00002A3C 74206E756D62657220-
  6353 00002A45 6F7220696E74206173-
  6354 00002A4E 2064697669736F7220-
  6355 00002A57 616C6C6F77656400   
  6356 00002A5F 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6357 00002A68 61732073696D706C65-
  6358 00002A71 207661722064697669-
  6359 00002A7A 736F7220616C6C6F77-
  6360 00002A83 656400             
  6361 00002A86 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6362 00002A8F 206E6F206279746520-
  6363 00002A98 61732064697669736F-
  6364 00002AA1 7220616C6C6F776564-
  6365 00002AAA 00                 
  6366 00002AAB 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6367 00002AB4 2C2000             
  6368 00002AB7 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6369 00002AC0 6964697620627800   
  6370 00002AC8 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6371 00002AD1 2C20305C6E20646976-
  6372 00002ADA 20627800           
  6373                                  ENDP
  6374                                  
  6375                                  domod: PROC
  6376                                  ;Function : domod, Number of local variables: 1
  6377                                  ;   # type sign width addr used name   list of local variables
  6378                                  ;  200 var sign word   712 NULL ids = bp+4;
  6379 00002ADE C8000000                 ENTER  0,0
  6380 00002AE2 FF7604                   push word [bp+4]
  6381 00002AE5 E853FE                   call doidiv
  6382 00002AE8 83C402                   add  sp, 2
  6383 00002AEB 68[F62A]                 push domod_0
  6384 00002AEE E859DA                   call prs
  6385 00002AF1 83C402                   add  sp, 2
  6386                                  
  6387                                  ;-713 
  6388                                  
  6389                                  
  6390                                  ;-714 int docalltype[10]; int docallvalue[10];
  6391 00002AF4 C9                       LEAVE
  6392 00002AF5 C3                       ret
  6393 00002AF6 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6394 00002AFF 2C20647800         
  6395                                  ENDP
  6396                                  section .bss
  6397                                  absolute 47411
  6398 0000B933 <res 00000014>          docalltype resw 10
  6399                                  section .text
  6400                                  section .bss
  6401                                  absolute 47431
  6402 0000B947 <res 00000014>          docallvalue resw 10
  6403                                  section .text
  6404                                  
  6405                                  ;-715 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6406                                  
  6407                                  section .bss
  6408                                  absolute 47451
  6409 0000B95B <res 00000011>          procname resb 17
  6410                                  section .text
  6411                                  
  6412                                  ;-716 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6413                                  
  6414                                  
  6415                                  docall1: PROC
  6416                                  
  6417                                  ;-717   narg=0;  sz32=0;
  6418                                  
  6419                                  ;Function : docall1, Number of local variables: 5
  6420                                  ;   # type sign width addr used name   list of local variables
  6421                                  ;  200 var sign word   716 NULL i = bp-2
  6422                                  ;  201 var sign word   716 NULL narg = bp-4
  6423                                  ;  202 var sign word   716 NULL t0 = bp-6
  6424                                  ;  203 var sign word   716 NULL n0 = bp-8
  6425                                  ;  204 var sign word   716 NULL sz32 = bp-10;
  6426 00002B04 C80A0000                 ENTER  10,0
  6427 00002B08 B80000                   mov ax, 0
  6428 00002B0B 8946FC                   mov [bp-4], ax
  6429 00002B0E B80000                   mov ax, 0
  6430 00002B11 8946F6                   mov [bp-10], ax
  6431                                  
  6432                                  ;-718   checknamelen();
  6433                                  
  6434 00002B14 E894D8                   call checknamelen
  6435                                  
  6436                                  ;-719   strcpy(&procname, symbol);
  6437                                  
  6438 00002B17 8D06BB69                 lea  ax, [symbol]
  6439 00002B1B 50                       push ax
  6440 00002B1C 8D065BB9                 lea  ax, [procname]
  6441 00002B20 50                       push ax
  6442 00002B21 E829D7                   call strcpy
  6443 00002B24 83C404                   add  sp, 4
  6444                                  
  6445                                  ;-720   storecall();
  6446                                  
  6447 00002B27 E84DE3                   call storecall
  6448                                  
  6449                                  ;-721   expect('(');
  6450                                  
  6451 00002B2A 6A28                     push 40
  6452 00002B2C E808D9                   call expect
  6453 00002B2F 83C402                   add  sp, 2
  6454                                  
  6455                                  ;-722 	if (istoken(')') ==0 ) {
  6456                                  
  6457 00002B32 6A29                     push 41
  6458 00002B34 E8DED8                   call istoken
  6459 00002B37 83C402                   add  sp, 2
  6460 00002B3A 83F800                   cmp ax, 0
  6461 00002B3D 0F857802                 jne .docall1313
  6462                                  
  6463                                  ;-723 	  do { narg++;
  6464                                  
  6465                                  .docall1314:
  6466 00002B41 FF46FC                   inc  word[bp-4]
  6467                                  
  6468                                  ;-724 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6469                                  
  6470 00002B44 8B46FC                   mov ax, [bp-4]
  6471 00002B47 83F809                   cmp ax, 9
  6472 00002B4A 0F8E0900                 jle .docall1315
  6473 00002B4E 68[FD2D]                 push docall1_0
  6474 00002B51 E84C11                   call error1
  6475 00002B54 83C402                   add  sp, 2
  6476                                  .docall1315:
  6477 00002B57 B80000                   mov ax, 0
  6478 00002B5A 8946FA                   mov [bp-6], ax
  6479                                  
  6480                                  ;-725       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6481                                  
  6482 00002B5D 680101                   push 257
  6483 00002B60 E8B2D8                   call istoken
  6484 00002B63 83C402                   add  sp, 2
  6485 00002B66 08C0                     or  al, al
  6486 00002B68 0F840C00                 je .docall1316
  6487 00002B6C B80100                   mov ax, 1
  6488 00002B6F 8946FA                   mov [bp-6], ax
  6489 00002B72 A1[3000]                 mov ax, [lexval]
  6490 00002B75 8946F8                   mov [bp-8], ax
  6491                                  
  6492                                  ;-726       if(istoken(T_STRING)){t0=2; n0=nconst;
  6493                                  
  6494                                  .docall1316:
  6495 00002B78 680201                   push 258
  6496 00002B7B E897D8                   call istoken
  6497 00002B7E 83C402                   add  sp, 2
  6498 00002B81 08C0                     or  al, al
  6499 00002B83 0F846300                 je .docall1317
  6500 00002B87 B80200                   mov ax, 2
  6501 00002B8A 8946FA                   mov [bp-6], ax
  6502 00002B8D A1[2600]                 mov ax, [nconst]
  6503 00002B90 8946F8                   mov [bp-8], ax
  6504                                  
  6505                                  ;-727         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6506                                  
  6507 00002B93 68[0F2E]                 push docall1_1
  6508 00002B96 E81CD9                   call eprs
  6509 00002B99 83C402                   add  sp, 2
  6510 00002B9C 8D063B6A                 lea  ax, [fname]
  6511 00002BA0 50                       push ax
  6512 00002BA1 E811D9                   call eprs
  6513 00002BA4 83C402                   add  sp, 2
  6514 00002BA7 6A5F                     push 95
  6515 00002BA9 E8F6D8                   call eprc
  6516 00002BAC 83C402                   add  sp, 2
  6517 00002BAF FF36[2600]               push word [nconst]
  6518 00002BB3 E828DA                   call eprnum
  6519 00002BB6 83C402                   add  sp, 2
  6520 00002BB9 68[122E]                 push docall1_2
  6521 00002BBC E8F6D8                   call eprs
  6522 00002BBF 83C402                   add  sp, 2
  6523                                  
  6524                                  ;-728         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6525                                  
  6526 00002BC2 6A22                     push 34
  6527 00002BC4 E8DBD8                   call eprc
  6528 00002BC7 83C402                   add  sp, 2
  6529 00002BCA 8D06BB69                 lea  ax, [symbol]
  6530 00002BCE 50                       push ax
  6531 00002BCF E8E3D8                   call eprs
  6532 00002BD2 83C402                   add  sp, 2
  6533 00002BD5 6A22                     push 34
  6534 00002BD7 E8C8D8                   call eprc
  6535 00002BDA 83C402                   add  sp, 2
  6536 00002BDD 68[172E]                 push docall1_3
  6537 00002BE0 E8D2D8                   call eprs
  6538 00002BE3 83C402                   add  sp, 2
  6539 00002BE6 FF06[2600]               inc  word[nconst]
  6540                                  
  6541                                  ;-729       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6542                                  
  6543                                  .docall1317:
  6544 00002BEA 6A26                     push 38
  6545 00002BEC E826D8                   call istoken
  6546 00002BEF 83C402                   add  sp, 2
  6547 00002BF2 08C0                     or  al, al
  6548 00002BF4 0F840F00                 je .docall1318
  6549 00002BF8 B80300                   mov ax, 3
  6550 00002BFB 8946FA                   mov [bp-6], ax
  6551 00002BFE E84EE2                   call name1
  6552 00002C01 E8A3E0                   call searchname
  6553 00002C04 8946F8                   mov [bp-8], ax
  6554                                  
  6555                                  ;-730       if(istoken(T_NAME))  { n0=checkreg();
  6556                                  
  6557                                  .docall1318:
  6558 00002C07 680001                   push 256
  6559 00002C0A E808D8                   call istoken
  6560 00002C0D 83C402                   add  sp, 2
  6561 00002C10 08C0                     or  al, al
  6562 00002C12 0F844800                 je .docall1319
  6563 00002C16 E8DEEA                   call checkreg
  6564 00002C19 8946F8                   mov [bp-8], ax
  6565                                  
  6566                                  ;-731         if (n0) t0=5;
  6567                                  
  6568 00002C1C 8B46F8                   mov ax, [bp-8]
  6569 00002C1F 08C0                     or  al, al
  6570 00002C21 0F840900                 je .docall1320
  6571 00002C25 B80500                   mov ax, 5
  6572 00002C28 8946FA                   mov [bp-6], ax
  6573                                  
  6574                                  ;-732         else {t0=4; n0=searchname();
  6575                                  
  6576 00002C2B E93000                   jmp .docall1321
  6577                                  .docall1320:
  6578 00002C2E B80400                   mov ax, 4
  6579 00002C31 8946FA                   mov [bp-6], ax
  6580 00002C34 E870E0                   call searchname
  6581 00002C37 8946F8                   mov [bp-8], ax
  6582                                  
  6583                                  ;-733           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6584                                  
  6585 00002C3A B8476B                   mov ax, GType
  6586 00002C3D A3[6E00]                 mov word [p1], ax
  6587 00002C40 A1[6E00]                 mov ax, [p1]
  6588 00002C43 0346F8                   add ax, [bp-8]
  6589 00002C46 A3[6E00]                 mov word [p1], ax
  6590 00002C49 8B1E[6E00]               mov bx, [p1]
  6591 00002C4D 8A07                     mov al, [bx]
  6592 00002C4F B400                     mov ah, 0
  6593 00002C51 83F826                   cmp ax, 38
  6594 00002C54 0F850600                 jne .docall1322
  6595 00002C58 B80300                   mov ax, 3
  6596 00002C5B 8946FA                   mov [bp-6], ax
  6597                                  .docall1322:
  6598                                  .docall1321:
  6599                                  
  6600                                  ;-734       if (t0==0) error1("parameter not recognized (no * allowed)");
  6601                                  
  6602                                  .docall1319:
  6603 00002C5E 8B46FA                   mov ax, [bp-6]
  6604 00002C61 83F800                   cmp ax, 0
  6605 00002C64 0F850900                 jne .docall1323
  6606 00002C68 68[1A2E]                 push docall1_4
  6607 00002C6B E83210                   call error1
  6608 00002C6E 83C402                   add  sp, 2
  6609                                  
  6610                                  ;-735       docalltype [narg] = t0;
  6611                                  
  6612                                  .docall1323:
  6613 00002C71 8B46FA                   mov ax, [bp-6]
  6614 00002C74 8B5EFC                   mov bx, [bp-4]
  6615 00002C77 D1E3                     shl bx, 1
  6616 00002C79 898733B9                 mov [docalltype+bx], ax
  6617                                  
  6618                                  ;-736       docallvalue[narg] = n0;
  6619                                  
  6620 00002C7D 8B46F8                   mov ax, [bp-8]
  6621 00002C80 8B5EFC                   mov bx, [bp-4]
  6622 00002C83 D1E3                     shl bx, 1
  6623 00002C85 898747B9                 mov [docallvalue+bx], ax
  6624                                  
  6625                                  ;-737     } while (istoken(','));
  6626                                  
  6627 00002C89 6A2C                     push 44
  6628 00002C8B E887D7                   call istoken
  6629 00002C8E 83C402                   add  sp, 2
  6630 00002C91 08C0                     or  al, al
  6631 00002C93 0F840300                 je .docall1324
  6632 00002C97 E9A7FE                   jmp .docall1314
  6633                                  .docall1324:
  6634                                  
  6635                                  ;-738 
  6636                                  
  6637                                  
  6638                                  ;-739   	expect(')');  i=narg;
  6639                                  
  6640 00002C9A 6A29                     push 41
  6641 00002C9C E898D7                   call expect
  6642 00002C9F 83C402                   add  sp, 2
  6643 00002CA2 8B46FC                   mov ax, [bp-4]
  6644 00002CA5 8946FE                   mov [bp-2], ax
  6645                                  
  6646                                  ;-740     do {
  6647                                  
  6648                                  .docall1325:
  6649                                  
  6650                                  ;-741       t0 = docalltype [i];
  6651                                  
  6652 00002CA8 8B5EFE                   mov bx, [bp-2]
  6653 00002CAB D1E3                     shl bx, 1
  6654 00002CAD 8B8733B9                 mov ax, [docalltype + bx]
  6655 00002CB1 8946FA                   mov [bp-6], ax
  6656                                  
  6657                                  ;-742       n0 = docallvalue[i];
  6658                                  
  6659 00002CB4 8B5EFE                   mov bx, [bp-2]
  6660 00002CB7 D1E3                     shl bx, 1
  6661 00002CB9 8B8747B9                 mov ax, [docallvalue + bx]
  6662 00002CBD 8946F8                   mov [bp-8], ax
  6663                                  
  6664                                  ;-743       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6665                                  
  6666 00002CC0 8B46FA                   mov ax, [bp-6]
  6667 00002CC3 83F801                   cmp ax, 1
  6668 00002CC6 0F851200                 jne .docall1326
  6669 00002CCA 68[422E]                 push docall1_5
  6670 00002CCD E87AD8                   call prs
  6671 00002CD0 83C402                   add  sp, 2
  6672 00002CD3 FF76F8                   push word [bp-8]
  6673 00002CD6 E8C6D9                   call prunsign1
  6674 00002CD9 83C402                   add  sp, 2
  6675                                  
  6676                                  ;-744       if(t0==2){ prs("\n push ");
  6677                                  
  6678                                  .docall1326:
  6679 00002CDC 8B46FA                   mov ax, [bp-6]
  6680 00002CDF 83F802                   cmp ax, 2
  6681 00002CE2 0F852500                 jne .docall1327
  6682 00002CE6 68[4B2E]                 push docall1_6
  6683 00002CE9 E85ED8                   call prs
  6684 00002CEC 83C402                   add  sp, 2
  6685                                  
  6686                                  ;-745         prs(fname);prc(95);prunsign1(n0);}
  6687                                  
  6688 00002CEF 8D063B6A                 lea  ax, [fname]
  6689 00002CF3 50                       push ax
  6690 00002CF4 E853D8                   call prs
  6691 00002CF7 83C402                   add  sp, 2
  6692 00002CFA 6A5F                     push 95
  6693 00002CFC E8E4D7                   call prc
  6694 00002CFF 83C402                   add  sp, 2
  6695 00002D02 FF76F8                   push word [bp-8]
  6696 00002D05 E897D9                   call prunsign1
  6697 00002D08 83C402                   add  sp, 2
  6698                                  
  6699                                  ;-746       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6700                                  
  6701                                  .docall1327:
  6702 00002D0B 8B46FA                   mov ax, [bp-6]
  6703 00002D0E 83F803                   cmp ax, 3
  6704 00002D11 0F851B00                 jne .docall1328
  6705 00002D15 68[542E]                 push docall1_7
  6706 00002D18 E82FD8                   call prs
  6707 00002D1B 83C402                   add  sp, 2
  6708 00002D1E FF76F8                   push word [bp-8]
  6709 00002D21 E854D6                   call v
  6710 00002D24 83C402                   add  sp, 2
  6711                                  
  6712                                  ;-747         prs("\n push ax");}
  6713                                  
  6714 00002D27 68[612E]                 push docall1_8
  6715 00002D2A E81DD8                   call prs
  6716 00002D2D 83C402                   add  sp, 2
  6717                                  
  6718                                  ;-748       if(t0==4){ gettypes(n0);
  6719                                  
  6720                                  .docall1328:
  6721 00002D30 8B46FA                   mov ax, [bp-6]
  6722 00002D33 83F804                   cmp ax, 4
  6723 00002D36 0F854300                 jne .docall1329
  6724 00002D3A FF76F8                   push word [bp-8]
  6725 00002D3D E829DE                   call gettypes
  6726 00002D40 83C402                   add  sp, 2
  6727                                  
  6728                                  ;-749         if(wi==2) { prs("\n push word "); v(n0);}
  6729                                  
  6730 00002D43 A1[3B00]                 mov ax, [wi]
  6731 00002D46 83F802                   cmp ax, 2
  6732 00002D49 0F851500                 jne .docall1330
  6733 00002D4D 68[6C2E]                 push docall1_9
  6734 00002D50 E8F7D7                   call prs
  6735 00002D53 83C402                   add  sp, 2
  6736 00002D56 FF76F8                   push word [bp-8]
  6737 00002D59 E81CD6                   call v
  6738 00002D5C 83C402                   add  sp, 2
  6739                                  
  6740                                  ;-750         else { prs("\n mov al, byte ");   v(n0);
  6741                                  
  6742 00002D5F E91B00                   jmp .docall1331
  6743                                  .docall1330:
  6744 00002D62 68[7A2E]                 push docall1_10
  6745 00002D65 E8E2D7                   call prs
  6746 00002D68 83C402                   add  sp, 2
  6747 00002D6B FF76F8                   push word [bp-8]
  6748 00002D6E E807D6                   call v
  6749 00002D71 83C402                   add  sp, 2
  6750                                  
  6751                                  ;-751         prs("\n mov ah, 0\n push ax"); } }
  6752                                  
  6753 00002D74 68[8B2E]                 push docall1_11
  6754 00002D77 E8D0D7                   call prs
  6755 00002D7A 83C402                   add  sp, 2
  6756                                  .docall1331:
  6757                                  
  6758                                  ;-752       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6759                                  
  6760                                  .docall1329:
  6761 00002D7D 8B46FA                   mov ax, [bp-6]
  6762 00002D80 83F805                   cmp ax, 5
  6763 00002D83 0F852200                 jne .docall1332
  6764 00002D87 68[A22E]                 push docall1_12
  6765 00002D8A E8BDD7                   call prs
  6766 00002D8D 83C402                   add  sp, 2
  6767 00002D90 FF76F8                   push word [bp-8]
  6768 00002D93 E86FED                   call printreg
  6769 00002D96 83C402                   add  sp, 2
  6770 00002D99 8B46F8                   mov ax, [bp-8]
  6771 00002D9C 83F82F                   cmp ax, 47 ;unsigned : 1
  6772 00002D9F 0F8C0600                 jl  .docall1333
  6773 00002DA3 8B46F6                   mov ax, [bp-10]
  6774 00002DA6 83C002                   add ax, 2
  6775                                  .docall1333:
  6776                                  
  6777                                  ;-753    i--; } while (i > 0);  }
  6778                                  
  6779                                  .docall1332:
  6780 00002DA9 FF4EFE                   dec  word[bp-2]
  6781 00002DAC 8B46FE                   mov ax, [bp-2]
  6782 00002DAF 83F800                   cmp ax, 0
  6783 00002DB2 0F8E0300                 jle .docall1334
  6784 00002DB6 E9EFFE                   jmp .docall1325
  6785                                  .docall1334:
  6786                                  
  6787                                  ;-754 	 prs("\n call "); prs(&procname);
  6788                                  
  6789                                  .docall1313:
  6790 00002DB9 68[AB2E]                 push docall1_13
  6791 00002DBC E88BD7                   call prs
  6792 00002DBF 83C402                   add  sp, 2
  6793 00002DC2 8D065BB9                 lea  ax, [procname]
  6794 00002DC6 50                       push ax
  6795 00002DC7 E880D7                   call prs
  6796 00002DCA 83C402                   add  sp, 2
  6797                                  
  6798                                  ;-755 	 if (narg>0) {prs("\n add  sp, ");
  6799                                  
  6800 00002DCD 8B46FC                   mov ax, [bp-4]
  6801 00002DD0 83F800                   cmp ax, 0
  6802 00002DD3 0F8E2400                 jle .docall1335
  6803 00002DD7 68[B42E]                 push docall1_14
  6804 00002DDA E86DD7                   call prs
  6805 00002DDD 83C402                   add  sp, 2
  6806                                  
  6807                                  ;-756      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6808                                  
  6809 00002DE0 8B46FC                   mov ax, [bp-4]
  6810 00002DE3 0346FC                   add ax, [bp-4]
  6811 00002DE6 8946FC                   mov [bp-4], ax
  6812 00002DE9 8B46FC                   mov ax, [bp-4]
  6813 00002DEC 0346F6                   add ax, [bp-10]
  6814 00002DEF 8946FC                   mov [bp-4], ax
  6815 00002DF2 FF76FC                   push word [bp-4]
  6816 00002DF5 E8A7D8                   call prunsign1
  6817 00002DF8 83C402                   add  sp, 2
  6818                                  .docall1335:
  6819                                  
  6820                                  ;-757 /***************************************************************/
  6821                                  
  6822                                  
  6823                                  ;-758 
  6824                                  
  6825                                  
  6826                                  ;-759 int doemit() {prs("\n db ");
  6827 00002DFB C9                       LEAVE
  6828 00002DFC C3                       ret
  6829 00002DFD 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6830 00002E06 72616D657465727300 
  6831 00002E0F 5C6E00                  docall1_1 db "\n",0
  6832 00002E12 2064622000              docall1_2 db " db ",0
  6833 00002E17 2C3000                  docall1_3 db ",0",0
  6834 00002E1A 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6835 00002E23 206E6F74207265636F-
  6836 00002E2C 676E697A656420286E-
  6837 00002E35 6F202A20616C6C6F77-
  6838 00002E3E 65642900           
  6839 00002E42 5C6E20707573682000      docall1_5 db "\n push ",0
  6840 00002E4B 5C6E20707573682000      docall1_6 db "\n push ",0
  6841 00002E54 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6842 00002E5D 782C2000           
  6843 00002E61 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6844 00002E6A 7800               
  6845 00002E6C 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6846 00002E75 6F72642000         
  6847 00002E7A 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6848 00002E83 2C20627974652000   
  6849 00002E8B 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6850 00002E94 2C20305C6E20707573-
  6851 00002E9D 6820617800         
  6852 00002EA2 5C6E20707573682000      docall1_12 db "\n push ",0
  6853 00002EAB 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6854 00002EB4 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6855 00002EBD 702C2000           
  6856                                  ENDP
  6857                                  
  6858                                  doemit: PROC
  6859 00002EC1 68[FD2E]                 push doemit_0
  6860 00002EC4 E883D6                   call prs
  6861 00002EC7 83C402                   add  sp, 2
  6862                                  
  6863                                  ;-760   L1: token=getlex(); prunsign1(lexval); token=getlex();
  6864                                  
  6865                                  .L1:
  6866 00002ECA E85C03                   call getlex
  6867 00002ECD A3[1E00]                 mov word [token], ax
  6868 00002ED0 FF36[3000]               push word [lexval]
  6869 00002ED4 E8C8D7                   call prunsign1
  6870 00002ED7 83C402                   add  sp, 2
  6871 00002EDA E84C03                   call getlex
  6872 00002EDD A3[1E00]                 mov word [token], ax
  6873                                  
  6874                                  ;-761     if (token== ',') {prc(','); goto L1;} expect(')'); }
  6875                                  
  6876 00002EE0 A1[1E00]                 mov ax, [token]
  6877 00002EE3 83F82C                   cmp ax, 44
  6878 00002EE6 0F850A00                 jne .doemit336
  6879 00002EEA 6A2C                     push 44
  6880 00002EEC E8F4D5                   call prc
  6881 00002EEF 83C402                   add  sp, 2
  6882 00002EF2 EBD6                     jmp .L1
  6883                                  .doemit336:
  6884 00002EF4 6A29                     push 41
  6885 00002EF6 E83ED5                   call expect
  6886 00002EF9 83C402                   add  sp, 2
  6887                                  
  6888                                  ;-762 
  6889                                  
  6890                                  
  6891                                  ;-763 int cmpneg(int ids) {
  6892                                  
  6893 00002EFC C3                       ret
  6894 00002EFD 5C6E2064622000          doemit_0 db "\n db ",0
  6895                                  ENDP
  6896                                  
  6897                                  cmpneg: PROC
  6898                                  
  6899                                  ;-764        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  6900                                  
  6901                                  ;Function : cmpneg, Number of local variables: 1
  6902                                  ;   # type sign width addr used name   list of local variables
  6903                                  ;  200 var sign word   763 NULL ids = bp+4;
  6904 00002F04 C8000000                 ENTER  0,0
  6905 00002F08 A1[2400]                 mov ax, [iscmp]
  6906 00002F0B 3D2603                   cmp ax, 806
  6907 00002F0E 0F850C00                 jne .cmpneg337
  6908 00002F12 68[E52F]                 push cmpneg_0
  6909 00002F15 E832D6                   call prs
  6910 00002F18 83C402                   add  sp, 2
  6911                                  
  6912                                  ;-765   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  6913                                  
  6914 00002F1B E9C500                   jmp .cmpneg338
  6915                                  .cmpneg337:
  6916 00002F1E A1[2400]                 mov ax, [iscmp]
  6917 00002F21 3D2703                   cmp ax, 807
  6918 00002F24 0F850C00                 jne .cmpneg339
  6919 00002F28 68[EE2F]                 push cmpneg_1
  6920 00002F2B E81CD6                   call prs
  6921 00002F2E 83C402                   add  sp, 2
  6922                                  
  6923                                  ;-766   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  6924                                  
  6925 00002F31 E9AF00                   jmp .cmpneg340
  6926                                  .cmpneg339:
  6927 00002F34 A1[2400]                 mov ax, [iscmp]
  6928 00002F37 3D3803                   cmp ax, 824
  6929 00002F3A 0F852100                 jne .cmpneg341
  6930 00002F3E 8B4604                   mov ax, [bp+4]
  6931 00002F41 08C0                     or  al, al
  6932 00002F43 0F840C00                 je .cmpneg342
  6933 00002F47 68[F72F]                 push cmpneg_2
  6934 00002F4A E8FDD5                   call prs
  6935 00002F4D 83C402                   add  sp, 2
  6936                                  
  6937                                  ;-767                            else prs("\n ja  .");//ZF=0 CF=0
  6938                                  
  6939 00002F50 E90900                   jmp .cmpneg343
  6940                                  .cmpneg342:
  6941 00002F53 68[0030]                 push cmpneg_3
  6942 00002F56 E8F1D5                   call prs
  6943 00002F59 83C402                   add  sp, 2
  6944                                  
  6945                                  ;-768   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  6946                                  
  6947                                  .cmpneg343:
  6948 00002F5C E98400                   jmp .cmpneg344
  6949                                  .cmpneg341:
  6950 00002F5F A1[2400]                 mov ax, [iscmp]
  6951 00002F62 3D2B03                   cmp ax, 811
  6952 00002F65 0F854500                 jne .cmpneg345
  6953 00002F69 8B4604                   mov ax, [bp+4]
  6954 00002F6C 08C0                     or  al, al
  6955 00002F6E 0F841E00                 je .cmpneg346
  6956 00002F72 68[0930]                 push cmpneg_4
  6957 00002F75 E8D2D5                   call prs
  6958 00002F78 83C402                   add  sp, 2
  6959 00002F7B FF7604                   push word [bp+4]
  6960 00002F7E E81ED7                   call prunsign1
  6961 00002F81 83C402                   add  sp, 2
  6962                                  
  6963                                  ;-769                                prs("\n jl  .");}//          SF!=OF
  6964                                  
  6965 00002F84 68[1730]                 push cmpneg_5
  6966 00002F87 E8C0D5                   call prs
  6967 00002F8A 83C402                   add  sp, 2
  6968                                  
  6969                                  ;-770                            else{prs(" ;unsigned : "); prunsign1(ids);
  6970                                  
  6971 00002F8D E91B00                   jmp .cmpneg347
  6972                                  .cmpneg346:
  6973 00002F90 68[2030]                 push cmpneg_6
  6974 00002F93 E8B4D5                   call prs
  6975 00002F96 83C402                   add  sp, 2
  6976 00002F99 FF7604                   push word [bp+4]
  6977 00002F9C E800D7                   call prunsign1
  6978 00002F9F 83C402                   add  sp, 2
  6979                                  
  6980                                  ;-771                                prs("\n jb  .");}//jb=jc=CF=1
  6981                                  
  6982 00002FA2 68[2E30]                 push cmpneg_7
  6983 00002FA5 E8A2D5                   call prs
  6984 00002FA8 83C402                   add  sp, 2
  6985                                  
  6986                                  ;-772   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  6987                                  
  6988                                  .cmpneg347:
  6989 00002FAB E93500                   jmp .cmpneg348
  6990                                  .cmpneg345:
  6991 00002FAE A1[2400]                 mov ax, [iscmp]
  6992 00002FB1 83F83C                   cmp ax, 60
  6993 00002FB4 0F850C00                 jne .cmpneg349
  6994 00002FB8 68[3730]                 push cmpneg_8
  6995 00002FBB E88CD5                   call prs
  6996 00002FBE 83C402                   add  sp, 2
  6997                                  
  6998                                  ;-773   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  6999                                  
  7000 00002FC1 E91F00                   jmp .cmpneg350
  7001                                  .cmpneg349:
  7002 00002FC4 A1[2400]                 mov ax, [iscmp]
  7003 00002FC7 83F83E                   cmp ax, 62
  7004 00002FCA 0F850C00                 jne .cmpneg351
  7005 00002FCE 68[4030]                 push cmpneg_9
  7006 00002FD1 E876D5                   call prs
  7007 00002FD4 83C402                   add  sp, 2
  7008                                  
  7009                                  ;-774   else error1("internal error compare unknown in CMPNEG()");  }
  7010                                  
  7011 00002FD7 E90900                   jmp .cmpneg352
  7012                                  .cmpneg351:
  7013 00002FDA 68[4930]                 push cmpneg_10
  7014 00002FDD E8C00C                   call error1
  7015 00002FE0 83C402                   add  sp, 2
  7016                                  .cmpneg352:
  7017                                  .cmpneg350:
  7018                                  .cmpneg348:
  7019                                  .cmpneg344:
  7020                                  .cmpneg340:
  7021                                  .cmpneg338:
  7022                                  
  7023                                  ;-775 
  7024                                  
  7025                                  
  7026                                  ;-776 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7027 00002FE3 C9                       LEAVE
  7028 00002FE4 C3                       ret
  7029 00002FE5 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7030 00002FEE 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7031 00002FF7 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7032 00003000 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7033 00003009 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7034 00003012 64203A2000         
  7035 00003017 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7036 00003020 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7037 00003029 64203A2000         
  7038 0000302E 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7039 00003037 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7040 00003040 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7041 00003049 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7042 00003052 6572726F7220636F6D-
  7043 0000305B 7061726520756E6B6E-
  7044 00003064 6F776E20696E20434D-
  7045 0000306D 504E4547282900     
  7046                                  ENDP
  7047                                  
  7048                                  prlabel: PROC
  7049                                  ;Function : prlabel, Number of local variables: 1
  7050                                  ;   # type sign width addr used name   list of local variables
  7051                                  ;  200 var sign word   776 NULL n = bp+4;
  7052 00003074 C8000000                 ENTER  0,0
  7053 00003078 68[9F30]                 push prlabel_0
  7054 0000307B E8CCD4                   call prs
  7055 0000307E 83C402                   add  sp, 2
  7056 00003081 8D063B6A                 lea  ax, [fname]
  7057 00003085 50                       push ax
  7058 00003086 E8C1D4                   call prs
  7059 00003089 83C402                   add  sp, 2
  7060 0000308C FF7604                   push word [bp+4]
  7061 0000308F E80DD6                   call prunsign1
  7062 00003092 83C402                   add  sp, 2
  7063 00003095 6A3A                     push 58
  7064 00003097 E849D4                   call prc
  7065 0000309A 83C402                   add  sp, 2
  7066                                  
  7067                                  ;-777 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7068 0000309D C9                       LEAVE
  7069 0000309E C3                       ret
  7070 0000309F 5C6E2E00                prlabel_0 db "\n.",0
  7071                                  ENDP
  7072                                  
  7073                                  prjump: PROC
  7074                                  ;Function : prjump, Number of local variables: 1
  7075                                  ;   # type sign width addr used name   list of local variables
  7076                                  ;  200 var sign word   777 NULL n = bp+4;
  7077 000030A3 C8000000                 ENTER  0,0
  7078 000030A7 68[C630]                 push prjump_0
  7079 000030AA E89DD4                   call prs
  7080 000030AD 83C402                   add  sp, 2
  7081 000030B0 8D063B6A                 lea  ax, [fname]
  7082 000030B4 50                       push ax
  7083 000030B5 E892D4                   call prs
  7084 000030B8 83C402                   add  sp, 2
  7085 000030BB FF7604                   push word [bp+4]
  7086 000030BE E8DED5                   call prunsign1
  7087 000030C1 83C402                   add  sp, 2
  7088                                  
  7089                                  ;-778 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7090 000030C4 C9                       LEAVE
  7091 000030C5 C3                       ret
  7092 000030C6 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7093                                  ENDP
  7094                                  
  7095                                  doif: PROC
  7096                                  ;Function : doif, Number of local variables: 2
  7097                                  ;   # type sign width addr used name   list of local variables
  7098                                  ;  200 var sign word   778 NULL jdest = bp-2
  7099                                  ;  201 var sign word   778 NULL tst = bp-4;
  7100 000030CF C8040000                 ENTER  4,0
  7101 000030D3 E8A4E2                   call pexpr
  7102 000030D6 FF06[2A00]               inc  word[nlabel]
  7103 000030DA A1[2A00]                 mov ax, [nlabel]
  7104 000030DD 8946FE                   mov [bp-2], ax
  7105                                  
  7106                                  ;-779   pint1(jdest); stmt();
  7107                                  
  7108 000030E0 FF76FE                   push word [bp-2]
  7109 000030E3 E85BD5                   call pint1
  7110 000030E6 83C402                   add  sp, 2
  7111 000030E9 E8F307                   call stmt
  7112                                  
  7113                                  ;-780   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7114                                  
  7115 000030EC 680202                   push 514
  7116 000030EF E823D3                   call istoken
  7117 000030F2 83C402                   add  sp, 2
  7118 000030F5 08C0                     or  al, al
  7119 000030F7 0F842B00                 je .doif353
  7120 000030FB FF06[2A00]               inc  word[nlabel]
  7121 000030FF A1[2A00]                 mov ax, [nlabel]
  7122 00003102 8946FC                   mov [bp-4], ax
  7123                                  
  7124                                  ;-781     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7125                                  
  7126 00003105 FF76FC                   push word [bp-4]
  7127 00003108 E898FF                   call prjump
  7128 0000310B 83C402                   add  sp, 2
  7129 0000310E FF76FE                   push word [bp-2]
  7130 00003111 E860FF                   call prlabel
  7131 00003114 83C402                   add  sp, 2
  7132 00003117 E8C507                   call stmt
  7133 0000311A FF76FC                   push word [bp-4]
  7134 0000311D E854FF                   call prlabel
  7135 00003120 83C402                   add  sp, 2
  7136                                  
  7137                                  ;-782   else prlabel(jdest); }
  7138                                  
  7139 00003123 E90900                   jmp .doif354
  7140                                  .doif353:
  7141 00003126 FF76FE                   push word [bp-2]
  7142 00003129 E848FF                   call prlabel
  7143 0000312C 83C402                   add  sp, 2
  7144                                  .doif354:
  7145                                  
  7146                                  ;-783 
  7147                                  
  7148                                  
  7149                                  ;-784 int dodo() {int jdest; int jtemp;
  7150 0000312F C9                       LEAVE
  7151 00003130 C3                       ret
  7152                                  ENDP
  7153                                  
  7154                                  dodo: PROC
  7155                                  
  7156                                  ;-785   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7157                                  
  7158                                  ;Function : dodo, Number of local variables: 2
  7159                                  ;   # type sign width addr used name   list of local variables
  7160                                  ;  200 var sign word   784 NULL jdest = bp-2
  7161                                  ;  201 var sign word   784 NULL jtemp = bp-4;
  7162 00003131 C8040000                 ENTER  4,0
  7163 00003135 FF06[2A00]               inc  word[nlabel]
  7164 00003139 A1[2A00]                 mov ax, [nlabel]
  7165 0000313C 8946FE                   mov [bp-2], ax
  7166 0000313F FF76FE                   push word [bp-2]
  7167 00003142 E82FFF                   call prlabel
  7168 00003145 83C402                   add  sp, 2
  7169 00003148 E89407                   call stmt
  7170                                  
  7171                                  ;-786   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7172                                  
  7173 0000314B 680302                   push 515
  7174 0000314E E8E6D2                   call expect
  7175 00003151 83C402                   add  sp, 2
  7176 00003154 E823E2                   call pexpr
  7177 00003157 FF06[2A00]               inc  word[nlabel]
  7178 0000315B A1[2A00]                 mov ax, [nlabel]
  7179 0000315E 8946FC                   mov [bp-4], ax
  7180 00003161 FF76FC                   push word [bp-4]
  7181 00003164 E8DAD4                   call pint1
  7182 00003167 83C402                   add  sp, 2
  7183                                  
  7184                                  ;-787   prjump(jdest); prlabel(jtemp); }
  7185                                  
  7186 0000316A FF76FE                   push word [bp-2]
  7187 0000316D E833FF                   call prjump
  7188 00003170 83C402                   add  sp, 2
  7189 00003173 FF76FC                   push word [bp-4]
  7190 00003176 E8FBFE                   call prlabel
  7191 00003179 83C402                   add  sp, 2
  7192                                  
  7193                                  ;-788 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7194 0000317C C9                       LEAVE
  7195 0000317D C3                       ret
  7196                                  ENDP
  7197                                  
  7198                                  dowhile: PROC
  7199                                  ;Function : dowhile, Number of local variables: 2
  7200                                  ;   # type sign width addr used name   list of local variables
  7201                                  ;  200 var sign word   788 NULL jdest = bp-2
  7202                                  ;  201 var sign word   788 NULL tst = bp-4;
  7203 0000317E C8040000                 ENTER  4,0
  7204 00003182 FF06[2A00]               inc  word[nlabel]
  7205 00003186 A1[2A00]                 mov ax, [nlabel]
  7206 00003189 8946FE                   mov [bp-2], ax
  7207                                  
  7208                                  ;-789   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7209                                  
  7210 0000318C FF76FE                   push word [bp-2]
  7211 0000318F E8E2FE                   call prlabel
  7212 00003192 83C402                   add  sp, 2
  7213 00003195 E8E2E1                   call pexpr
  7214 00003198 FF06[2A00]               inc  word[nlabel]
  7215 0000319C A1[2A00]                 mov ax, [nlabel]
  7216 0000319F 8946FC                   mov [bp-4], ax
  7217 000031A2 FF76FC                   push word [bp-4]
  7218 000031A5 E899D4                   call pint1
  7219 000031A8 83C402                   add  sp, 2
  7220                                  
  7221                                  ;-790   stmt(); prjump(jdest); prlabel(tst); }
  7222                                  
  7223 000031AB E83107                   call stmt
  7224 000031AE FF76FE                   push word [bp-2]
  7225 000031B1 E8EFFE                   call prjump
  7226 000031B4 83C402                   add  sp, 2
  7227 000031B7 FF76FC                   push word [bp-4]
  7228 000031BA E8B7FE                   call prlabel
  7229 000031BD 83C402                   add  sp, 2
  7230                                  
  7231                                  ;-791 int isrelational() {
  7232 000031C0 C9                       LEAVE
  7233 000031C1 C3                       ret
  7234                                  ENDP
  7235                                  
  7236                                  isrelational: PROC
  7237                                  
  7238                                  ;-792   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7239                                  
  7240 000031C2 A1[1E00]                 mov ax, [token]
  7241 000031C5 3D2603                   cmp ax, 806
  7242 000031C8 0F850300                 jne .isrelational355
  7243 000031CC E94700                   jmp .w
  7244                                  .isrelational355:
  7245 000031CF A1[1E00]                 mov ax, [token]
  7246 000031D2 3D2703                   cmp ax, 807
  7247 000031D5 0F850300                 jne .isrelational356
  7248 000031D9 E93A00                   jmp .w
  7249                                  
  7250                                  ;-793   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7251                                  
  7252                                  .isrelational356:
  7253 000031DC A1[1E00]                 mov ax, [token]
  7254 000031DF 3D3803                   cmp ax, 824
  7255 000031E2 0F850300                 jne .isrelational357
  7256 000031E6 E92D00                   jmp .w
  7257                                  .isrelational357:
  7258 000031E9 A1[1E00]                 mov ax, [token]
  7259 000031EC 3D2B03                   cmp ax, 811
  7260 000031EF 0F850300                 jne .isrelational358
  7261 000031F3 E92000                   jmp .w
  7262                                  
  7263                                  ;-794   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7264                                  
  7265                                  .isrelational358:
  7266 000031F6 A1[1E00]                 mov ax, [token]
  7267 000031F9 83F83C                   cmp ax, 60
  7268 000031FC 0F850300                 jne .isrelational359
  7269 00003200 E91300                   jmp .w
  7270                                  .isrelational359:
  7271 00003203 A1[1E00]                 mov ax, [token]
  7272 00003206 83F83E                   cmp ax, 62
  7273 00003209 0F850300                 jne .isrelational360
  7274 0000320D E90600                   jmp .w
  7275                                  
  7276                                  ;-795   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7277                                  
  7278                                  .isrelational360:
  7279 00003210 B80000                   mov ax, 0
  7280 00003213 E91200                   jmp .retnisrelational
  7281                                  .w:
  7282 00003216 A1[1E00]                 mov ax, [token]
  7283 00003219 A3[2400]                 mov word [iscmp], ax
  7284 0000321C E80A00                   call getlex
  7285 0000321F A3[1E00]                 mov word [token], ax
  7286 00003222 B80100                   mov ax, 1
  7287 00003225 E90000                   jmp .retnisrelational
  7288                                  
  7289                                  ;-796 
  7290                                  
  7291                                  
  7292                                  ;-797 char symboltemp[80];
  7293                                  
  7294                                   .retnisrelational:
  7295 00003228 C3                       ret
  7296                                  ENDP
  7297                                  section .bss
  7298                                  absolute 47468
  7299 0000B96C <res 00000050>          symboltemp resb 80
  7300                                  section .text
  7301                                  
  7302                                  ;-798 int getlex() { char c; char *p;
  7303                                  
  7304                                  
  7305                                  getlex: PROC
  7306                                  
  7307                                  ;-799 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7308                                  
  7309                                  ;Function : getlex, Number of local variables: 2
  7310                                  ;   # type sign width addr used name   list of local variables
  7311                                  ;  200 var sign byte   798 NULL c = bp-2
  7312                                  ;  201 ptr sign byte   798 NULL p = bp-4;
  7313 00003229 C8040000                 ENTER  4,0
  7314                                  .g1:
  7315 0000322D E8C7D1                   call next
  7316 00003230 8846FE                   mov [bp-2], al
  7317 00003233 8A46FE                   mov al, [bp-2]
  7318 00003236 3C00                     cmp al, 0
  7319 00003238 0F850600                 jne .getlex361
  7320 0000323C B80000                   mov ax, 0
  7321 0000323F E9DA04                   jmp .retngetlex
  7322                                  .getlex361:
  7323 00003242 8A46FE                   mov al, [bp-2]
  7324 00003245 3C20                     cmp al, 32
  7325 00003247 0F8F0200                 jg  .getlex362
  7326 0000324B EBE0                     jmp .g1
  7327                                  
  7328                                  ;-800   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7329                                  
  7330                                  .getlex362:
  7331 0000324D 8A46FE                   mov al, [bp-2]
  7332 00003250 3C3D                     cmp al, 61
  7333 00003252 0F851200                 jne .getlex363
  7334 00003256 A0[2300]                 mov al, [thechar]
  7335 00003259 3C3D                     cmp al, 61
  7336 0000325B 0F850900                 jne .getlex364
  7337 0000325F E895D1                   call next
  7338 00003262 B82603                   mov ax, 806
  7339 00003265 E9B404                   jmp .retngetlex
  7340                                  .getlex364:
  7341                                  
  7342                                  ;-801   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7343                                  
  7344                                  .getlex363:
  7345 00003268 8A46FE                   mov al, [bp-2]
  7346 0000326B 3C21                     cmp al, 33
  7347 0000326D 0F851200                 jne .getlex365
  7348 00003271 A0[2300]                 mov al, [thechar]
  7349 00003274 3C3D                     cmp al, 61
  7350 00003276 0F850900                 jne .getlex366
  7351 0000327A E87AD1                   call next
  7352 0000327D B82703                   mov ax, 807
  7353 00003280 E99904                   jmp .retngetlex
  7354                                  .getlex366:
  7355                                  
  7356                                  ;-802   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7357                                  
  7358                                  .getlex365:
  7359 00003283 8A46FE                   mov al, [bp-2]
  7360 00003286 3C3C                     cmp al, 60
  7361 00003288 0F851200                 jne .getlex367
  7362 0000328C A0[2300]                 mov al, [thechar]
  7363 0000328F 3C3D                     cmp al, 61
  7364 00003291 0F850900                 jne .getlex368
  7365 00003295 E85FD1                   call next
  7366 00003298 B83803                   mov ax, 824
  7367 0000329B E97E04                   jmp .retngetlex
  7368                                  .getlex368:
  7369                                  
  7370                                  ;-803   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  7371                                  
  7372                                  .getlex367:
  7373 0000329E 8A46FE                   mov al, [bp-2]
  7374 000032A1 3C3E                     cmp al, 62
  7375 000032A3 0F851200                 jne .getlex369
  7376 000032A7 A0[2300]                 mov al, [thechar]
  7377 000032AA 3C3D                     cmp al, 61
  7378 000032AC 0F850900                 jne .getlex370
  7379 000032B0 E844D1                   call next
  7380 000032B3 B82B03                   mov ax, 811
  7381 000032B6 E96304                   jmp .retngetlex
  7382                                  .getlex370:
  7383                                  
  7384                                  ;-804   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  7385                                  
  7386                                  .getlex369:
  7387 000032B9 8A46FE                   mov al, [bp-2]
  7388 000032BC 3C3C                     cmp al, 60
  7389 000032BE 0F851200                 jne .getlex371
  7390 000032C2 A0[2300]                 mov al, [thechar]
  7391 000032C5 3C3C                     cmp al, 60
  7392 000032C7 0F850900                 jne .getlex372
  7393 000032CB E829D1                   call next
  7394 000032CE B8D804                   mov ax, 1240
  7395 000032D1 E94804                   jmp .retngetlex
  7396                                  .getlex372:
  7397                                  
  7398                                  ;-805   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  7399                                  
  7400                                  .getlex371:
  7401 000032D4 8A46FE                   mov al, [bp-2]
  7402 000032D7 3C3E                     cmp al, 62
  7403 000032D9 0F851200                 jne .getlex373
  7404 000032DD A0[2300]                 mov al, [thechar]
  7405 000032E0 3C3E                     cmp al, 62
  7406 000032E2 0F850900                 jne .getlex374
  7407 000032E6 E80ED1                   call next
  7408 000032E9 B8D904                   mov ax, 1241
  7409 000032EC E92D04                   jmp .retngetlex
  7410                                  .getlex374:
  7411                                  
  7412                                  ;-806   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  7413                                  
  7414                                  .getlex373:
  7415 000032EF 8A46FE                   mov al, [bp-2]
  7416 000032F2 3C2B                     cmp al, 43
  7417 000032F4 0F851200                 jne .getlex375
  7418 000032F8 A0[2300]                 mov al, [thechar]
  7419 000032FB 3C2B                     cmp al, 43
  7420 000032FD 0F850900                 jne .getlex376
  7421 00003301 E8F3D0                   call next
  7422 00003304 B8C304                   mov ax, 1219
  7423 00003307 E91204                   jmp .retngetlex
  7424                                  .getlex376:
  7425                                  
  7426                                  ;-807   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  7427                                  
  7428                                  .getlex375:
  7429 0000330A 8A46FE                   mov al, [bp-2]
  7430 0000330D 3C2D                     cmp al, 45
  7431 0000330F 0F851200                 jne .getlex377
  7432 00003313 A0[2300]                 mov al, [thechar]
  7433 00003316 3C2D                     cmp al, 45
  7434 00003318 0F850900                 jne .getlex378
  7435 0000331C E8D8D0                   call next
  7436 0000331F B8C904                   mov ax, 1225
  7437 00003322 E9F703                   jmp .retngetlex
  7438                                  .getlex378:
  7439                                  
  7440                                  ;-808   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  7441                                  
  7442                                  .getlex377:
  7443 00003325 8A46FE                   mov al, [bp-2]
  7444 00003328 3C2B                     cmp al, 43
  7445 0000332A 0F851200                 jne .getlex379
  7446 0000332E A0[2300]                 mov al, [thechar]
  7447 00003331 3C3D                     cmp al, 61
  7448 00003333 0F850900                 jne .getlex380
  7449 00003337 E8BDD0                   call next
  7450 0000333A B8CE04                   mov ax, 1230
  7451 0000333D E9DC03                   jmp .retngetlex
  7452                                  .getlex380:
  7453                                  
  7454                                  ;-809   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  7455                                  
  7456                                  .getlex379:
  7457 00003340 8A46FE                   mov al, [bp-2]
  7458 00003343 3C2D                     cmp al, 45
  7459 00003345 0F851200                 jne .getlex381
  7460 00003349 A0[2300]                 mov al, [thechar]
  7461 0000334C 3C3D                     cmp al, 61
  7462 0000334E 0F850900                 jne .getlex382
  7463 00003352 E8A2D0                   call next
  7464 00003355 B8CF04                   mov ax, 1231
  7465 00003358 E9C103                   jmp .retngetlex
  7466                                  .getlex382:
  7467                                  
  7468                                  ;-810   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  7469                                  
  7470                                  .getlex381:
  7471 0000335B 8A46FE                   mov al, [bp-2]
  7472 0000335E 3C26                     cmp al, 38
  7473 00003360 0F851200                 jne .getlex383
  7474 00003364 A0[2300]                 mov al, [thechar]
  7475 00003367 3C3D                     cmp al, 61
  7476 00003369 0F850900                 jne .getlex384
  7477 0000336D E887D0                   call next
  7478 00003370 B8D204                   mov ax, 1234
  7479 00003373 E9A603                   jmp .retngetlex
  7480                                  .getlex384:
  7481                                  
  7482                                  ;-811   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  7483                                  
  7484                                  .getlex383:
  7485 00003376 8A46FE                   mov al, [bp-2]
  7486 00003379 3C7C                     cmp al, 124
  7487 0000337B 0F851200                 jne .getlex385
  7488 0000337F A0[2300]                 mov al, [thechar]
  7489 00003382 3C3D                     cmp al, 61
  7490 00003384 0F850900                 jne .getlex386
  7491 00003388 E86CD0                   call next
  7492 0000338B B8D304                   mov ax, 1235
  7493 0000338E E98B03                   jmp .retngetlex
  7494                                  .getlex386:
  7495                                  
  7496                                  ;-812   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  7497                                  
  7498                                  .getlex385:
  7499 00003391 8A46FE                   mov al, [bp-2]
  7500 00003394 3C2A                     cmp al, 42
  7501 00003396 0F851200                 jne .getlex387
  7502 0000339A A0[2300]                 mov al, [thechar]
  7503 0000339D 3C3D                     cmp al, 61
  7504 0000339F 0F850900                 jne .getlex388
  7505 000033A3 E851D0                   call next
  7506 000033A6 B8D004                   mov ax, 1232
  7507 000033A9 E97003                   jmp .retngetlex
  7508                                  .getlex388:
  7509                                  
  7510                                  ;-813   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  7511                                  
  7512                                  .getlex387:
  7513 000033AC 8A46FE                   mov al, [bp-2]
  7514 000033AF 3C2F                     cmp al, 47
  7515 000033B1 0F851200                 jne .getlex389
  7516 000033B5 A0[2300]                 mov al, [thechar]
  7517 000033B8 3C3D                     cmp al, 61
  7518 000033BA 0F850900                 jne .getlex390
  7519 000033BE E836D0                   call next
  7520 000033C1 B8D104                   mov ax, 1233
  7521 000033C4 E95503                   jmp .retngetlex
  7522                                  .getlex390:
  7523                                  
  7524                                  ;-814   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  7525                                  
  7526                                  .getlex389:
  7527 000033C7 8A46FE                   mov al, byte [bp-2]
  7528 000033CA B400                     mov ah, 0
  7529 000033CC 50                       push ax
  7530 000033CD 68[1E37]                 push getlex_0
  7531 000033D0 E864CF                   call instr1
  7532 000033D3 83C404                   add  sp, 4
  7533 000033D6 08C0                     or  al, al
  7534 000033D8 0F840600                 je .getlex391
  7535 000033DC 8A46FE                   mov al, [bp-2]
  7536 000033DF E93A03                   jmp .retngetlex
  7537                                  
  7538                                  ;-815   if (c == '/') { if (thechar == '/') {
  7539                                  
  7540                                  .getlex391:
  7541 000033E2 8A46FE                   mov al, [bp-2]
  7542 000033E5 3C2F                     cmp al, 47
  7543 000033E7 0F852900                 jne .getlex392
  7544 000033EB A0[2300]                 mov al, [thechar]
  7545 000033EE 3C2F                     cmp al, 47
  7546 000033F0 0F852000                 jne .getlex393
  7547                                  
  7548                                  ;-816       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  7549                                  
  7550                                  .getlex394:
  7551 000033F4 E800D0                   call next
  7552 000033F7 8846FE                   mov [bp-2], al
  7553 000033FA 8A46FE                   mov al, byte [bp-2]
  7554 000033FD B400                     mov ah, 0
  7555 000033FF 50                       push ax
  7556 00003400 E84108                   call ifEOL
  7557 00003403 83C402                   add  sp, 2
  7558 00003406 3C00                     cmp al, 0
  7559 00003408 0F850200                 jne .getlex395
  7560 0000340C EBE6                     jmp .getlex394
  7561                                  .getlex395:
  7562 0000340E E818FE                   call getlex
  7563 00003411 E90803                   jmp .retngetlex
  7564                                  .getlex393:
  7565                                  
  7566                                  ;-817   if (c == '/') { if (thechar == '*') {
  7567                                  
  7568                                  .getlex392:
  7569 00003414 8A46FE                   mov al, [bp-2]
  7570 00003417 3C2F                     cmp al, 47
  7571 00003419 0F853A00                 jne .getlex396
  7572 0000341D A0[2300]                 mov al, [thechar]
  7573 00003420 3C2A                     cmp al, 42
  7574 00003422 0F852B00                 jne .getlex397
  7575                                  
  7576                                  ;-818       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  7577                                  
  7578                                  .g2:
  7579 00003426 E8CECF                   call next
  7580 00003429 8846FE                   mov [bp-2], al
  7581 0000342C 8A46FE                   mov al, [bp-2]
  7582 0000342F 3C2A                     cmp al, 42
  7583 00003431 0F840200                 je  .getlex398
  7584 00003435 EBEF                     jmp .g2
  7585                                  .getlex398:
  7586 00003437 A0[2300]                 mov al, [thechar]
  7587 0000343A 3C2F                     cmp al, 47
  7588 0000343C 0F840200                 je  .getlex399
  7589 00003440 EBE4                     jmp .g2
  7590                                  
  7591                                  ;-819       c=next(); return getlex(); } else  return '/'; }
  7592                                  
  7593                                  .getlex399:
  7594 00003442 E8B2CF                   call next
  7595 00003445 8846FE                   mov [bp-2], al
  7596 00003448 E8DEFD                   call getlex
  7597 0000344B E9CE02                   jmp .retngetlex
  7598 0000344E E90600                   jmp .getlex400
  7599                                  .getlex397:
  7600 00003451 B82F00                   mov ax, 47
  7601 00003454 E9C502                   jmp .retngetlex
  7602                                  .getlex400:
  7603                                  
  7604                                  ;-820   if (c == '"') {getstring(c); return T_STRING;}
  7605                                  
  7606                                  .getlex396:
  7607 00003457 8A46FE                   mov al, [bp-2]
  7608 0000345A 3C22                     cmp al, 34
  7609 0000345C 0F851200                 jne .getlex401
  7610 00003460 8A46FE                   mov al, byte [bp-2]
  7611 00003463 B400                     mov ah, 0
  7612 00003465 50                       push ax
  7613 00003466 E88F06                   call getstring
  7614 00003469 83C402                   add  sp, 2
  7615 0000346C B80201                   mov ax, 258
  7616 0000346F E9AA02                   jmp .retngetlex
  7617                                  
  7618                                  ;-821   if (digit(c)) { getdigit(c); return T_CONST; }
  7619                                  
  7620                                  .getlex401:
  7621 00003472 8A46FE                   mov al, byte [bp-2]
  7622 00003475 B400                     mov ah, 0
  7623 00003477 50                       push ax
  7624 00003478 E844CD                   call digit
  7625 0000347B 83C402                   add  sp, 2
  7626 0000347E 08C0                     or  al, al
  7627 00003480 0F841200                 je .getlex402
  7628 00003484 8A46FE                   mov al, byte [bp-2]
  7629 00003487 B400                     mov ah, 0
  7630 00003489 50                       push ax
  7631 0000348A E87C03                   call getdigit
  7632 0000348D 83C402                   add  sp, 2
  7633 00003490 B80101                   mov ax, 257
  7634 00003493 E98602                   jmp .retngetlex
  7635                                  
  7636                                  ;-822   if (c==39) { lexval=next();
  7637                                  
  7638                                  .getlex402:
  7639 00003496 8A46FE                   mov al, [bp-2]
  7640 00003499 3C27                     cmp al, 39
  7641 0000349B 0F854F00                 jne .getlex403
  7642 0000349F E855CF                   call next
  7643 000034A2 A3[3000]                 mov word [lexval], ax
  7644                                  
  7645                                  ;-823     if (lexval==92) {lexval=next();
  7646                                  
  7647 000034A5 A1[3000]                 mov ax, [lexval]
  7648 000034A8 83F85C                   cmp ax, 92
  7649 000034AB 0F853600                 jne .getlex404
  7650 000034AF E845CF                   call next
  7651 000034B2 A3[3000]                 mov word [lexval], ax
  7652                                  
  7653                                  ;-824       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  7654                                  
  7655 000034B5 A1[3000]                 mov ax, [lexval]
  7656 000034B8 83F86E                   cmp ax, 110
  7657 000034BB 0F850600                 jne .getlex405
  7658 000034BF B80A00                   mov ax, 10
  7659 000034C2 A3[3000]                 mov word [lexval], ax
  7660                                  .getlex405:
  7661 000034C5 A1[3000]                 mov ax, [lexval]
  7662 000034C8 83F874                   cmp ax, 116
  7663 000034CB 0F850600                 jne .getlex406
  7664 000034CF B80900                   mov ax, 9
  7665 000034D2 A3[3000]                 mov word [lexval], ax
  7666                                  
  7667                                  ;-825       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  7668                                  
  7669                                  .getlex406:
  7670 000034D5 A1[3000]                 mov ax, [lexval]
  7671 000034D8 83F830                   cmp ax, 48
  7672 000034DB 0F850600                 jne .getlex407
  7673 000034DF B80000                   mov ax, 0
  7674 000034E2 A3[3000]                 mov word [lexval], ax
  7675                                  .getlex407:
  7676                                  .getlex404:
  7677 000034E5 E80FCF                   call next
  7678 000034E8 B80101                   mov ax, 257
  7679 000034EB E92E02                   jmp .retngetlex
  7680                                  
  7681                                  ;-826   if (alnum(c)) {
  7682                                  
  7683                                  .getlex403:
  7684 000034EE 8A46FE                   mov al, byte [bp-2]
  7685 000034F1 B400                     mov ah, 0
  7686 000034F3 50                       push ax
  7687 000034F4 E8F2CC                   call alnum
  7688 000034F7 83C402                   add  sp, 2
  7689 000034FA 08C0                     or  al, al
  7690 000034FC 0F841302                 je .getlex408
  7691                                  
  7692                                  ;-827     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  7693                                  
  7694 00003500 8D06BB69                 lea  ax, [symbol]
  7695 00003504 50                       push ax
  7696 00003505 8D066CB9                 lea  ax, [symboltemp]
  7697 00003509 50                       push ax
  7698 0000350A E840CD                   call strcpy
  7699 0000350D 83C404                   add  sp, 4
  7700 00003510 B8BB69                   mov ax, symbol
  7701 00003513 8946FC                   mov [bp-4], ax
  7702 00003516 8A46FE                   mov al, [bp-2]
  7703 00003519 8B5EFC                   mov  bx, [bp-4]
  7704 0000351C 8807                     mov  [bx], al
  7705 0000351E FF46FC                   inc  word[bp-4]
  7706                                  
  7707                                  ;-828     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  7708                                  
  7709                                  .getlex409:
  7710 00003521 A0[2300]                 mov al, byte [thechar]
  7711 00003524 B400                     mov ah, 0
  7712 00003526 50                       push ax
  7713 00003527 E8BFCC                   call alnum
  7714 0000352A 83C402                   add  sp, 2
  7715 0000352D 08C0                     or  al, al
  7716 0000352F 0F841300                 je .getlex410
  7717 00003533 E8C1CE                   call next
  7718 00003536 8846FE                   mov [bp-2], al
  7719 00003539 8A46FE                   mov al, [bp-2]
  7720 0000353C 8B5EFC                   mov  bx, [bp-4]
  7721 0000353F 8807                     mov  [bx], al
  7722 00003541 FF46FC                   inc  word[bp-4]
  7723                                  
  7724                                  ;-829       *p=0;
  7725                                  
  7726 00003544 EBDB                     jmp .getlex409
  7727                                  .getlex410:
  7728 00003546 B80000                   mov ax, 0
  7729 00003549 8B5EFC                   mov  bx, [bp-4]
  7730 0000354C 8807                     mov  [bx], al
  7731                                  
  7732                                  ;-830     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  7733                                  
  7734 0000354E 68[3437]                 push getlex_1
  7735 00003551 8D06BB69                 lea  ax, [symbol]
  7736 00003555 50                       push ax
  7737 00003556 E82ACD                   call eqstr
  7738 00003559 83C404                   add  sp, 4
  7739 0000355C 08C0                     or  al, al
  7740 0000355E 0F840600                 je .getlex411
  7741 00003562 B81302                   mov ax, 531
  7742 00003565 E9B401                   jmp .retngetlex
  7743                                  
  7744                                  ;-831     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  7745                                  
  7746                                  .getlex411:
  7747 00003568 68[3B37]                 push getlex_2
  7748 0000356B 8D06BB69                 lea  ax, [symbol]
  7749 0000356F 50                       push ax
  7750 00003570 E810CD                   call eqstr
  7751 00003573 83C404                   add  sp, 4
  7752 00003576 08C0                     or  al, al
  7753 00003578 0F840600                 je .getlex412
  7754 0000357C B81402                   mov ax, 532
  7755 0000357F E99A01                   jmp .retngetlex
  7756                                  
  7757                                  ;-832     if (eqstr(symbol,"void"    )) return T_VOID;
  7758                                  
  7759                                  .getlex412:
  7760 00003582 68[4437]                 push getlex_3
  7761 00003585 8D06BB69                 lea  ax, [symbol]
  7762 00003589 50                       push ax
  7763 0000358A E8F6CC                   call eqstr
  7764 0000358D 83C404                   add  sp, 4
  7765 00003590 08C0                     or  al, al
  7766 00003592 0F840600                 je .getlex413
  7767 00003596 B81102                   mov ax, 529
  7768 00003599 E98001                   jmp .retngetlex
  7769                                  
  7770                                  ;-833     if (eqstr(symbol,"int"     )) return T_INT;
  7771                                  
  7772                                  .getlex413:
  7773 0000359C 68[4937]                 push getlex_4
  7774 0000359F 8D06BB69                 lea  ax, [symbol]
  7775 000035A3 50                       push ax
  7776 000035A4 E8DCCC                   call eqstr
  7777 000035A7 83C404                   add  sp, 4
  7778 000035AA 08C0                     or  al, al
  7779 000035AC 0F840600                 je .getlex414
  7780 000035B0 B80502                   mov ax, 517
  7781 000035B3 E96601                   jmp .retngetlex
  7782                                  
  7783                                  ;-834     if (eqstr(symbol,"long"    )) return T_LONG;
  7784                                  
  7785                                  .getlex414:
  7786 000035B6 68[4D37]                 push getlex_5
  7787 000035B9 8D06BB69                 lea  ax, [symbol]
  7788 000035BD 50                       push ax
  7789 000035BE E8C2CC                   call eqstr
  7790 000035C1 83C404                   add  sp, 4
  7791 000035C4 08C0                     or  al, al
  7792 000035C6 0F840600                 je .getlex415
  7793 000035CA B81502                   mov ax, 533
  7794 000035CD E94C01                   jmp .retngetlex
  7795                                  
  7796                                  ;-835     if (eqstr(symbol,"char"    )) return T_CHAR;
  7797                                  
  7798                                  .getlex415:
  7799 000035D0 68[5237]                 push getlex_6
  7800 000035D3 8D06BB69                 lea  ax, [symbol]
  7801 000035D7 50                       push ax
  7802 000035D8 E8A8CC                   call eqstr
  7803 000035DB 83C404                   add  sp, 4
  7804 000035DE 08C0                     or  al, al
  7805 000035E0 0F840600                 je .getlex416
  7806 000035E4 B81202                   mov ax, 530
  7807 000035E7 E93201                   jmp .retngetlex
  7808                                  
  7809                                  ;-836     if (eqstr(symbol,"asm"     )) return T_ASM;
  7810                                  
  7811                                  .getlex416:
  7812 000035EA 68[5737]                 push getlex_7
  7813 000035ED 8D06BB69                 lea  ax, [symbol]
  7814 000035F1 50                       push ax
  7815 000035F2 E88ECC                   call eqstr
  7816 000035F5 83C404                   add  sp, 4
  7817 000035F8 08C0                     or  al, al
  7818 000035FA 0F840600                 je .getlex417
  7819 000035FE B80602                   mov ax, 518
  7820 00003601 E91801                   jmp .retngetlex
  7821                                  
  7822                                  ;-837     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  7823                                  
  7824                                  .getlex417:
  7825 00003604 68[5B37]                 push getlex_8
  7826 00003607 8D06BB69                 lea  ax, [symbol]
  7827 0000360B 50                       push ax
  7828 0000360C E874CC                   call eqstr
  7829 0000360F 83C404                   add  sp, 4
  7830 00003612 08C0                     or  al, al
  7831 00003614 0F840600                 je .getlex418
  7832 00003618 B80702                   mov ax, 519
  7833 0000361B E9FE00                   jmp .retngetlex
  7834                                  
  7835                                  ;-838     if (eqstr(symbol,"__emit__")) return T_EMIT;
  7836                                  
  7837                                  .getlex418:
  7838 0000361E 68[6137]                 push getlex_9
  7839 00003621 8D06BB69                 lea  ax, [symbol]
  7840 00003625 50                       push ax
  7841 00003626 E85ACC                   call eqstr
  7842 00003629 83C404                   add  sp, 4
  7843 0000362C 08C0                     or  al, al
  7844 0000362E 0F840600                 je .getlex419
  7845 00003632 B80802                   mov ax, 520
  7846 00003635 E9E400                   jmp .retngetlex
  7847                                  
  7848                                  ;-839     if (eqstr(symbol,"return"  )) return T_RETURN;
  7849                                  
  7850                                  .getlex419:
  7851 00003638 68[6A37]                 push getlex_10
  7852 0000363B 8D06BB69                 lea  ax, [symbol]
  7853 0000363F 50                       push ax
  7854 00003640 E840CC                   call eqstr
  7855 00003643 83C404                   add  sp, 4
  7856 00003646 08C0                     or  al, al
  7857 00003648 0F840600                 je .getlex420
  7858 0000364C B80002                   mov ax, 512
  7859 0000364F E9CA00                   jmp .retngetlex
  7860                                  
  7861                                  ;-840     if (eqstr(symbol,"if"      )) return T_IF;
  7862                                  
  7863                                  .getlex420:
  7864 00003652 68[7137]                 push getlex_11
  7865 00003655 8D06BB69                 lea  ax, [symbol]
  7866 00003659 50                       push ax
  7867 0000365A E826CC                   call eqstr
  7868 0000365D 83C404                   add  sp, 4
  7869 00003660 08C0                     or  al, al
  7870 00003662 0F840600                 je .getlex421
  7871 00003666 B80102                   mov ax, 513
  7872 00003669 E9B000                   jmp .retngetlex
  7873                                  
  7874                                  ;-841     if (eqstr(symbol,"else"    )) return T_ELSE;
  7875                                  
  7876                                  .getlex421:
  7877 0000366C 68[7437]                 push getlex_12
  7878 0000366F 8D06BB69                 lea  ax, [symbol]
  7879 00003673 50                       push ax
  7880 00003674 E80CCC                   call eqstr
  7881 00003677 83C404                   add  sp, 4
  7882 0000367A 08C0                     or  al, al
  7883 0000367C 0F840600                 je .getlex422
  7884 00003680 B80202                   mov ax, 514
  7885 00003683 E99600                   jmp .retngetlex
  7886                                  
  7887                                  ;-842     if (eqstr(symbol,"while"   )) return T_WHILE;
  7888                                  
  7889                                  .getlex422:
  7890 00003686 68[7937]                 push getlex_13
  7891 00003689 8D06BB69                 lea  ax, [symbol]
  7892 0000368D 50                       push ax
  7893 0000368E E8F2CB                   call eqstr
  7894 00003691 83C404                   add  sp, 4
  7895 00003694 08C0                     or  al, al
  7896 00003696 0F840600                 je .getlex423
  7897 0000369A B80302                   mov ax, 515
  7898 0000369D E97C00                   jmp .retngetlex
  7899                                  
  7900                                  ;-843     if (eqstr(symbol,"do"      )) return T_DO;
  7901                                  
  7902                                  .getlex423:
  7903 000036A0 68[7F37]                 push getlex_14
  7904 000036A3 8D06BB69                 lea  ax, [symbol]
  7905 000036A7 50                       push ax
  7906 000036A8 E8D8CB                   call eqstr
  7907 000036AB 83C404                   add  sp, 4
  7908 000036AE 08C0                     or  al, al
  7909 000036B0 0F840600                 je .getlex424
  7910 000036B4 B80402                   mov ax, 516
  7911 000036B7 E96200                   jmp .retngetlex
  7912                                  
  7913                                  ;-844     if (eqstr(symbol,"goto"    )) return T_GOTO;
  7914                                  
  7915                                  .getlex424:
  7916 000036BA 68[8237]                 push getlex_15
  7917 000036BD 8D06BB69                 lea  ax, [symbol]
  7918 000036C1 50                       push ax
  7919 000036C2 E8BECB                   call eqstr
  7920 000036C5 83C404                   add  sp, 4
  7921 000036C8 08C0                     or  al, al
  7922 000036CA 0F840600                 je .getlex425
  7923 000036CE B80902                   mov ax, 521
  7924 000036D1 E94800                   jmp .retngetlex
  7925                                  
  7926                                  ;-845     if (eqstr(symbol,"define"  )) return T_DEFINE;
  7927                                  
  7928                                  .getlex425:
  7929 000036D4 68[8737]                 push getlex_16
  7930 000036D7 8D06BB69                 lea  ax, [symbol]
  7931 000036DB 50                       push ax
  7932 000036DC E8A4CB                   call eqstr
  7933 000036DF 83C404                   add  sp, 4
  7934 000036E2 08C0                     or  al, al
  7935 000036E4 0F840600                 je .getlex426
  7936 000036E8 B8FF01                   mov ax, 511
  7937 000036EB E92E00                   jmp .retngetlex
  7938                                  
  7939                                  ;-846     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  7940                                  
  7941                                  .getlex426:
  7942 000036EE E8B700                   call convertdefine
  7943 000036F1 08C0                     or  al, al
  7944 000036F3 0F841600                 je .getlex427
  7945 000036F7 8D066CB9                 lea  ax, [symboltemp]
  7946 000036FB 50                       push ax
  7947 000036FC 8D06BB69                 lea  ax, [symbol]
  7948 00003700 50                       push ax
  7949 00003701 E849CB                   call strcpy
  7950 00003704 83C404                   add  sp, 4
  7951 00003707 B80101                   mov ax, 257
  7952 0000370A E90F00                   jmp .retngetlex
  7953                                  
  7954                                  ;-847     return T_NAME; } error1("Input item not recognized"); }
  7955                                  
  7956                                  .getlex427:
  7957 0000370D B80001                   mov ax, 256
  7958 00003710 E90900                   jmp .retngetlex
  7959                                  .getlex408:
  7960 00003713 68[8E37]                 push getlex_17
  7961 00003716 E88705                   call error1
  7962 00003719 83C402                   add  sp, 2
  7963                                  
  7964                                  ;-848 
  7965                                  
  7966                                  
  7967                                  ;-849 int convertdefine() { int i; int j;   i=0;
  7968                                  
  7969 0000371C C9                       .retngetlex: LEAVE
  7970 0000371D C3                       ret
  7971 0000371E 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  7972 00003727 3A252D3E3C3D2B2126-
  7973 00003730 7C233F00           
  7974 00003734 7369676E656400          getlex_1 db "signed",0
  7975 0000373B 756E7369676E656400      getlex_2 db "unsigned",0
  7976 00003744 766F696400              getlex_3 db "void",0
  7977 00003749 696E7400                getlex_4 db "int",0
  7978 0000374D 6C6F6E6700              getlex_5 db "long",0
  7979 00003752 6368617200              getlex_6 db "char",0
  7980 00003757 61736D00                getlex_7 db "asm",0
  7981 0000375B 5F5F61736D00            getlex_8 db "__asm",0
  7982 00003761 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  7983 0000376A 72657475726E00          getlex_10 db "return",0
  7984 00003771 696600                  getlex_11 db "if",0
  7985 00003774 656C736500              getlex_12 db "else",0
  7986 00003779 7768696C6500            getlex_13 db "while",0
  7987 0000377F 646F00                  getlex_14 db "do",0
  7988 00003782 676F746F00              getlex_15 db "goto",0
  7989 00003787 646566696E6500          getlex_16 db "define",0
  7990 0000378E 496E70757420697465-     getlex_17 db "Input item not recognized",0
  7991 00003797 6D206E6F7420726563-
  7992 000037A0 6F676E697A656400   
  7993                                  ENDP
  7994                                  
  7995                                  convertdefine: PROC
  7996                                  ;Function : convertdefine, Number of local variables: 2
  7997                                  ;   # type sign width addr used name   list of local variables
  7998                                  ;  200 var sign word   849 NULL i = bp-2
  7999                                  ;  201 var sign word   849 NULL j = bp-4;
  8000 000037A8 C8040000                 ENTER  4,0
  8001 000037AC B80000                   mov ax, 0
  8002 000037AF 8946FE                   mov [bp-2], ax
  8003                                  
  8004                                  ;-850   while (i < GTop) {
  8005                                  
  8006                                  .convertdefine428:
  8007 000037B2 8B46FE                   mov ax, [bp-2]
  8008 000037B5 3B06[2C00]               cmp ax, [GTop]
  8009 000037B9 0F8D4400                 jge .convertdefine429
  8010                                  
  8011                                  ;-851    j=adrofname(i);
  8012                                  
  8013 000037BD FF76FE                   push word [bp-2]
  8014 000037C0 E85DD4                   call adrofname
  8015 000037C3 83C402                   add  sp, 2
  8016 000037C6 8946FC                   mov [bp-4], ax
  8017                                  
  8018                                  ;-852    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8019                                  
  8020 000037C9 FF76FC                   push word [bp-4]
  8021 000037CC 8D06BB69                 lea  ax, [symbol]
  8022 000037D0 50                       push ax
  8023 000037D1 E8AFCA                   call eqstr
  8024 000037D4 83C404                   add  sp, 4
  8025 000037D7 08C0                     or  al, al
  8026 000037D9 0F841F00                 je .convertdefine430
  8027 000037DD 8B5EFE                   mov bx, [bp-2]
  8028 000037E0 8A87476B                 mov al, [GType + bx]
  8029 000037E4 3C23                     cmp al, 35
  8030 000037E6 0F851200                 jne .convertdefine431
  8031 000037EA 8B5EFE                   mov bx, [bp-2]
  8032 000037ED D1E3                     shl bx, 1
  8033 000037EF 8B877B73                 mov ax, [GData + bx]
  8034 000037F3 A3[3000]                 mov word [lexval], ax
  8035                                  
  8036                                  ;-853    return T_CONST; } }
  8037                                  
  8038 000037F6 B80101                   mov ax, 257
  8039 000037F9 E90B00                   jmp .retnconvertdefine
  8040                                  .convertdefine431:
  8041                                  
  8042                                  ;-854    i++; }
  8043                                  
  8044                                  .convertdefine430:
  8045 000037FC FF46FE                   inc  word[bp-2]
  8046                                  
  8047                                  ;-855    return 0; }
  8048                                  
  8049 000037FF EBB1                     jmp .convertdefine428
  8050                                  .convertdefine429:
  8051 00003801 B80000                   mov ax, 0
  8052 00003804 E90000                   jmp .retnconvertdefine
  8053                                  
  8054                                  ;-856 
  8055                                  
  8056                                  
  8057                                  ;-857 int getdigit(char c) { int i;
  8058                                  
  8059 00003807 C9                       .retnconvertdefine: LEAVE
  8060 00003808 C3                       ret
  8061                                  ENDP
  8062                                  
  8063                                  getdigit: PROC
  8064                                  
  8065                                  ;-858     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8066                                  
  8067                                  ;Function : getdigit, Number of local variables: 2
  8068                                  ;   # type sign width addr used name   list of local variables
  8069                                  ;  200 var sign byte   857 NULL c = bp+4
  8070                                  ;  201 var sign word   857 NULL i = bp-2;
  8071 00003809 C8020000                 ENTER  2,0
  8072 0000380D B80000                   mov ax, 0
  8073 00003810 A3[3000]                 mov word [lexval], ax
  8074 00003813 8A4604                   mov al, [bp+4]
  8075 00003816 2C30                     sub al, 48
  8076 00003818 A3[3000]                 mov word [lexval], ax
  8077                                  
  8078                                  ;-859     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8079                                  
  8080 0000381B A0[2300]                 mov al, [thechar]
  8081 0000381E 3C78                     cmp al, 120
  8082 00003820 0F850600                 jne .getdigit432
  8083 00003824 B85800                   mov ax, 88
  8084 00003827 A2[2300]                 mov byte [thechar], al
  8085                                  .getdigit432:
  8086 0000382A A0[2300]                 mov al, [thechar]
  8087 0000382D 3C58                     cmp al, 88
  8088 0000382F 0F856800                 jne .getdigit433
  8089 00003833 E8C1CB                   call next
  8090                                  
  8091                                  ;-860       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8092                                  
  8093                                  .getdigit434:
  8094 00003836 A0[2300]                 mov al, byte [thechar]
  8095 00003839 B400                     mov ah, 0
  8096 0000383B 50                       push ax
  8097 0000383C E8AAC9                   call alnum
  8098 0000383F 83C402                   add  sp, 2
  8099 00003842 08C0                     or  al, al
  8100 00003844 0F845000                 je .getdigit435
  8101 00003848 E8ACCB                   call next
  8102 0000384B 884604                   mov [bp+4], al
  8103 0000384E 8A4604                   mov al, [bp+4]
  8104 00003851 3C60                     cmp al, 96
  8105 00003853 0F8E0800                 jle .getdigit436
  8106 00003857 8A4604                   mov al, [bp+4]
  8107 0000385A 2C27                     sub al, 39
  8108 0000385C 884604                   mov [bp+4], al
  8109                                  
  8110                                  ;-861 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8111                                  
  8112                                  .getdigit436:
  8113 0000385F 8A4604                   mov al, [bp+4]
  8114 00003862 3C40                     cmp al, 64
  8115 00003864 0F8E0800                 jle .getdigit437
  8116 00003868 8A4604                   mov al, [bp+4]
  8117 0000386B 2C07                     sub al, 7
  8118 0000386D 884604                   mov [bp+4], al
  8119                                  .getdigit437:
  8120 00003870 8A4604                   mov al, [bp+4]
  8121 00003873 2C30                     sub al, 48
  8122 00003875 884604                   mov [bp+4], al
  8123 00003878 A1[3000]                 mov ax, [lexval]
  8124 0000387B C1E004                   shl ax, 4
  8125 0000387E A3[3000]                 mov word [lexval], ax
  8126                                  
  8127                                  ;-862      i=0; i=c; lexval=lexval+i;}
  8128                                  
  8129 00003881 B80000                   mov ax, 0
  8130 00003884 8946FE                   mov [bp-2], ax
  8131 00003887 8A4604                   mov al, [bp+4]
  8132 0000388A 8946FE                   mov [bp-2], ax
  8133 0000388D A1[3000]                 mov ax, [lexval]
  8134 00003890 0346FE                   add ax, [bp-2]
  8135 00003893 A3[3000]                 mov word [lexval], ax
  8136                                  
  8137                                  ;-863     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  8138                                  
  8139 00003896 EB9E                     jmp .getdigit434
  8140                                  .getdigit435:
  8141 00003898 E94200                   jmp .getdigit438
  8142                                  .getdigit433:
  8143                                  .getdigit439:
  8144 0000389B A0[2300]                 mov al, byte [thechar]
  8145 0000389E B400                     mov ah, 0
  8146 000038A0 50                       push ax
  8147 000038A1 E81BC9                   call digit
  8148 000038A4 83C402                   add  sp, 2
  8149 000038A7 08C0                     or  al, al
  8150 000038A9 0F843000                 je .getdigit440
  8151 000038AD E847CB                   call next
  8152 000038B0 884604                   mov [bp+4], al
  8153 000038B3 8A4604                   mov al, [bp+4]
  8154 000038B6 2C30                     sub al, 48
  8155 000038B8 884604                   mov [bp+4], al
  8156 000038BB A1[3000]                 mov ax, [lexval]
  8157 000038BE BB0A00                   mov bx, 10
  8158 000038C1 F7E3                     mul bx
  8159 000038C3 A3[3000]                 mov word [lexval], ax
  8160                                  
  8161                                  ;-864      i=0; i=c; lexval=lexval+i; } }
  8162                                  
  8163 000038C6 B80000                   mov ax, 0
  8164 000038C9 8946FE                   mov [bp-2], ax
  8165 000038CC 8A4604                   mov al, [bp+4]
  8166 000038CF 8946FE                   mov [bp-2], ax
  8167 000038D2 A1[3000]                 mov ax, [lexval]
  8168 000038D5 0346FE                   add ax, [bp-2]
  8169 000038D8 A3[3000]                 mov word [lexval], ax
  8170 000038DB EBBE                     jmp .getdigit439
  8171                                  .getdigit440:
  8172                                  
  8173                                  ;-865 }
  8174                                  
  8175                                  .getdigit438:
  8176                                  
  8177                                  ;-866 
  8178                                  
  8179                                  
  8180                                  ;-867 int stmt() { int c; char cha;
  8181 000038DD C9                       LEAVE
  8182 000038DE C3                       ret
  8183                                  ENDP
  8184                                  
  8185                                  stmt: PROC
  8186                                  
  8187                                  ;-868        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  8188                                  
  8189                                  ;Function : stmt, Number of local variables: 2
  8190                                  ;   # type sign width addr used name   list of local variables
  8191                                  ;  200 var sign word   867 NULL c = bp-2
  8192                                  ;  201 var sign byte   867 NULL cha = bp-4;
  8193 000038DF C8040000                 ENTER  4,0
  8194 000038E3 6A7B                     push 123
  8195 000038E5 E82DCB                   call istoken
  8196 000038E8 83C402                   add  sp, 2
  8197 000038EB 08C0                     or  al, al
  8198 000038ED 0F841700                 je .stmt441
  8199                                  .stmt442:
  8200 000038F1 6A7D                     push 125
  8201 000038F3 E81FCB                   call istoken
  8202 000038F6 83C402                   add  sp, 2
  8203 000038F9 83F800                   cmp ax, 0
  8204 000038FC 0F850500                 jne .stmt443
  8205 00003900 E8DCFF                   call stmt
  8206 00003903 EBEC                     jmp .stmt442
  8207                                  .stmt443:
  8208                                  
  8209                                  ;-869   else if(istoken(T_IF))    doif();
  8210                                  
  8211 00003905 E9BA01                   jmp .stmt444
  8212                                  .stmt441:
  8213 00003908 680102                   push 513
  8214 0000390B E807CB                   call istoken
  8215 0000390E 83C402                   add  sp, 2
  8216 00003911 08C0                     or  al, al
  8217 00003913 0F840600                 je .stmt445
  8218 00003917 E8B5F7                   call doif
  8219                                  
  8220                                  ;-870   else if(istoken(T_DO))    dodo();
  8221                                  
  8222 0000391A E9A501                   jmp .stmt446
  8223                                  .stmt445:
  8224 0000391D 680402                   push 516
  8225 00003920 E8F2CA                   call istoken
  8226 00003923 83C402                   add  sp, 2
  8227 00003926 08C0                     or  al, al
  8228 00003928 0F840600                 je .stmt447
  8229 0000392C E802F8                   call dodo
  8230                                  
  8231                                  ;-871   else if(istoken(T_WHILE)) dowhile();
  8232                                  
  8233 0000392F E99001                   jmp .stmt448
  8234                                  .stmt447:
  8235 00003932 680302                   push 515
  8236 00003935 E8DDCA                   call istoken
  8237 00003938 83C402                   add  sp, 2
  8238 0000393B 08C0                     or  al, al
  8239 0000393D 0F840600                 je .stmt449
  8240 00003941 E83AF8                   call dowhile
  8241                                  
  8242                                  ;-872   else if(istoken(T_GOTO))  {
  8243                                  
  8244 00003944 E97B01                   jmp .stmt450
  8245                                  .stmt449:
  8246 00003947 680902                   push 521
  8247 0000394A E8C8CA                   call istoken
  8248 0000394D 83C402                   add  sp, 2
  8249 00003950 08C0                     or  al, al
  8250 00003952 0F842200                 je .stmt451
  8251                                  
  8252                                  ;-873     prs("\n jmp .");name1();prs(symbol);expect(';');}
  8253                                  
  8254 00003956 68[C43A]                 push stmt_0
  8255 00003959 E8EECB                   call prs
  8256 0000395C 83C402                   add  sp, 2
  8257 0000395F E8EDD4                   call name1
  8258 00003962 8D06BB69                 lea  ax, [symbol]
  8259 00003966 50                       push ax
  8260 00003967 E8E0CB                   call prs
  8261 0000396A 83C402                   add  sp, 2
  8262 0000396D 6A3B                     push 59
  8263 0000396F E8C5CA                   call expect
  8264 00003972 83C402                   add  sp, 2
  8265                                  
  8266                                  ;-874   else if(token==T_ASM)     {prs("\n"); c=next();
  8267                                  
  8268 00003975 E94A01                   jmp .stmt452
  8269                                  .stmt451:
  8270 00003978 A1[1E00]                 mov ax, [token]
  8271 0000397B 3D0602                   cmp ax, 518
  8272 0000397E 0F853300                 jne .stmt453
  8273 00003982 68[CD3A]                 push stmt_1
  8274 00003985 E8C2CB                   call prs
  8275 00003988 83C402                   add  sp, 2
  8276 0000398B E869CA                   call next
  8277 0000398E 8946FE                   mov [bp-2], ax
  8278                                  
  8279                                  ;-875         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  8280                                  
  8281                                  .stmt454:
  8282 00003991 8B46FE                   mov ax, [bp-2]
  8283 00003994 83F80A                   cmp ax, 10
  8284 00003997 0F841100                 je  .stmt455
  8285 0000399B FF76FE                   push word [bp-2]
  8286 0000399E E842CB                   call prc
  8287 000039A1 83C402                   add  sp, 2
  8288 000039A4 E850CA                   call next
  8289 000039A7 8946FE                   mov [bp-2], ax
  8290 000039AA EBE5                     jmp .stmt454
  8291                                  .stmt455:
  8292 000039AC E87AF8                   call getlex
  8293 000039AF A3[1E00]                 mov word [token], ax
  8294                                  
  8295                                  ;-876   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  8296                                  
  8297 000039B2 E90D01                   jmp .stmt456
  8298                                  .stmt453:
  8299 000039B5 680702                   push 519
  8300 000039B8 E85ACA                   call istoken
  8301 000039BB 83C402                   add  sp, 2
  8302 000039BE 08C0                     or  al, al
  8303 000039C0 0F844B00                 je .stmt457
  8304 000039C4 A1[1E00]                 mov ax, [token]
  8305 000039C7 83F87B                   cmp ax, 123
  8306 000039CA 0F853500                 jne .stmt458
  8307 000039CE 68[D03A]                 push stmt_2
  8308 000039D1 E876CB                   call prs
  8309 000039D4 83C402                   add  sp, 2
  8310 000039D7 E81DCA                   call next
  8311 000039DA 8846FC                   mov [bp-4], al
  8312                                  
  8313                                  ;-877         while(cha!= '}') { prc(cha); cha=next(); }
  8314                                  
  8315                                  .stmt459:
  8316 000039DD 8A46FC                   mov al, [bp-4]
  8317 000039E0 3C7D                     cmp al, 125
  8318 000039E2 0F841400                 je  .stmt460
  8319 000039E6 8A46FC                   mov al, byte [bp-4]
  8320 000039E9 B400                     mov ah, 0
  8321 000039EB 50                       push ax
  8322 000039EC E8F4CA                   call prc
  8323 000039EF 83C402                   add  sp, 2
  8324 000039F2 E802CA                   call next
  8325 000039F5 8846FC                   mov [bp-4], al
  8326                                  
  8327                                  ;-878         token=getlex(); }
  8328                                  
  8329 000039F8 EBE3                     jmp .stmt459
  8330                                  .stmt460:
  8331 000039FA E82CF8                   call getlex
  8332 000039FD A3[1E00]                 mov word [token], ax
  8333                                  
  8334                                  ;-879         else error1("Curly open expected");
  8335                                  
  8336 00003A00 E90900                   jmp .stmt461
  8337                                  .stmt458:
  8338 00003A03 68[D33A]                 push stmt_3
  8339 00003A06 E89702                   call error1
  8340 00003A09 83C402                   add  sp, 2
  8341                                  
  8342                                  ;-880         }
  8343                                  
  8344                                  .stmt461:
  8345                                  
  8346                                  ;-881   else if(istoken(T_EMIT))   doemit();
  8347                                  
  8348 00003A0C E9B300                   jmp .stmt462
  8349                                  .stmt457:
  8350 00003A0F 680802                   push 520
  8351 00003A12 E800CA                   call istoken
  8352 00003A15 83C402                   add  sp, 2
  8353 00003A18 08C0                     or  al, al
  8354 00003A1A 0F840600                 je .stmt463
  8355 00003A1E E8A0F4                   call doemit
  8356                                  
  8357                                  ;-882   else if(istoken(';'))      { }
  8358                                  
  8359 00003A21 E99E00                   jmp .stmt464
  8360                                  .stmt463:
  8361 00003A24 6A3B                     push 59
  8362 00003A26 E8ECC9                   call istoken
  8363 00003A29 83C402                   add  sp, 2
  8364 00003A2C 08C0                     or  al, al
  8365 00003A2E 0F840300                 je .stmt465
  8366                                  
  8367                                  ;-883   else if(istoken(T_RETURN)) {
  8368                                  
  8369 00003A32 E98D00                   jmp .stmt466
  8370                                  .stmt465:
  8371 00003A35 680002                   push 512
  8372 00003A38 E8DAC9                   call istoken
  8373 00003A3B 83C402                   add  sp, 2
  8374 00003A3E 08C0                     or  al, al
  8375 00003A40 0F843500                 je .stmt467
  8376                                  
  8377                                  ;-884         if (token!=';') expr(0);
  8378                                  
  8379 00003A44 A1[1E00]                 mov ax, [token]
  8380 00003A47 83F83B                   cmp ax, 59
  8381 00003A4A 0F840800                 je  .stmt468
  8382 00003A4E 6A00                     push 0
  8383 00003A50 E823E1                   call expr
  8384 00003A53 83C402                   add  sp, 2
  8385                                  
  8386                                  ;-885         prs("\n jmp .retn");
  8387                                  
  8388                                  .stmt468:
  8389 00003A56 68[E73A]                 push stmt_4
  8390 00003A59 E8EECA                   call prs
  8391 00003A5C 83C402                   add  sp, 2
  8392                                  
  8393                                  ;-886         prs(fname);
  8394                                  
  8395 00003A5F 8D063B6A                 lea  ax, [fname]
  8396 00003A63 50                       push ax
  8397 00003A64 E8E3CA                   call prs
  8398 00003A67 83C402                   add  sp, 2
  8399                                  
  8400                                  ;-887         nreturn++;
  8401                                  
  8402 00003A6A FF06[2800]               inc  word[nreturn]
  8403                                  
  8404                                  ;-888         expect(';');
  8405                                  
  8406 00003A6E 6A3B                     push 59
  8407 00003A70 E8C4C9                   call expect
  8408 00003A73 83C402                   add  sp, 2
  8409                                  
  8410                                  ;-889         }
  8411                                  
  8412                                  
  8413                                  ;-890   else if(thechar==':')      {
  8414                                  
  8415 00003A76 E94900                   jmp .stmt469
  8416                                  .stmt467:
  8417 00003A79 A0[2300]                 mov al, [thechar]
  8418 00003A7C 3C3A                     cmp al, 58
  8419 00003A7E 0F853000                 jne .stmt470
  8420                                  
  8421                                  ;-891         prs("\n."); // Label
  8422                                  
  8423 00003A82 68[F43A]                 push stmt_5
  8424 00003A85 E8C2CA                   call prs
  8425 00003A88 83C402                   add  sp, 2
  8426                                  
  8427                                  ;-892         prs(symbol); prc(':');
  8428                                  
  8429 00003A8B 8D06BB69                 lea  ax, [symbol]
  8430 00003A8F 50                       push ax
  8431 00003A90 E8B7CA                   call prs
  8432 00003A93 83C402                   add  sp, 2
  8433 00003A96 6A3A                     push 58
  8434 00003A98 E848CA                   call prc
  8435 00003A9B 83C402                   add  sp, 2
  8436                                  
  8437                                  ;-893         expect(T_NAME);
  8438                                  
  8439 00003A9E 680001                   push 256
  8440 00003AA1 E893C9                   call expect
  8441 00003AA4 83C402                   add  sp, 2
  8442                                  
  8443                                  ;-894         expect(':');
  8444                                  
  8445 00003AA7 6A3A                     push 58
  8446 00003AA9 E88BC9                   call expect
  8447 00003AAC 83C402                   add  sp, 2
  8448                                  
  8449                                  ;-895         }
  8450                                  
  8451                                  
  8452                                  ;-896   else  {expr(0);; expect(';'); }
  8453                                  
  8454 00003AAF E91000                   jmp .stmt471
  8455                                  .stmt470:
  8456 00003AB2 6A00                     push 0
  8457 00003AB4 E8BFE0                   call expr
  8458 00003AB7 83C402                   add  sp, 2
  8459 00003ABA 6A3B                     push 59
  8460 00003ABC E878C9                   call expect
  8461 00003ABF 83C402                   add  sp, 2
  8462                                  
  8463                                  ;-897 }
  8464                                  
  8465                                  .stmt471:
  8466                                  .stmt469:
  8467                                  .stmt466:
  8468                                  .stmt464:
  8469                                  .stmt462:
  8470                                  .stmt456:
  8471                                  .stmt452:
  8472                                  .stmt450:
  8473                                  .stmt448:
  8474                                  .stmt446:
  8475                                  .stmt444:
  8476                                  
  8477                                  ;-898 
  8478                                  
  8479                                  
  8480                                  ;-899 int getstring(int delim) {
  8481 00003AC2 C9                       LEAVE
  8482 00003AC3 C3                       ret
  8483 00003AC4 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  8484 00003ACD 5C6E00                  stmt_1 db "\n",0
  8485 00003AD0 5C6E00                  stmt_2 db "\n",0
  8486 00003AD3 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  8487 00003ADC 6E2065787065637465-
  8488 00003AE5 6400               
  8489 00003AE7 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  8490 00003AF0 65746E00           
  8491 00003AF4 5C6E2E00                stmt_5 db "\n.",0
  8492                                  ENDP
  8493                                  
  8494                                  getstring: PROC
  8495                                  
  8496                                  ;-900     int c; char *p;
  8497                                  
  8498                                  
  8499                                  ;-901     p=&symbol;
  8500                                  
  8501                                  ;Function : getstring, Number of local variables: 3
  8502                                  ;   # type sign width addr used name   list of local variables
  8503                                  ;  200 var sign word   899 NULL delim = bp+4
  8504                                  ;  201 var sign word   900 NULL c = bp-2
  8505                                  ;  202 ptr sign byte   900 NULL p = bp-4;
  8506 00003AF8 C8040000                 ENTER  4,0
  8507 00003AFC B8BB69                   mov ax, symbol
  8508 00003AFF 8946FC                   mov [bp-4], ax
  8509                                  
  8510                                  ;-902     c=next();
  8511                                  
  8512 00003B02 E8F2C8                   call next
  8513 00003B05 8946FE                   mov [bp-2], ax
  8514                                  
  8515                                  ;-903     while (c != delim) {
  8516                                  
  8517                                  .getstring472:
  8518 00003B08 8B46FE                   mov ax, [bp-2]
  8519 00003B0B 3B4604                   cmp ax, [bp+4]
  8520 00003B0E 0F841300                 je  .getstring473
  8521                                  
  8522                                  ;-904         *p=c;
  8523                                  
  8524 00003B12 8B46FE                   mov ax, [bp-2]
  8525 00003B15 8B5EFC                   mov  bx, [bp-4]
  8526 00003B18 8807                     mov  [bx], al
  8527                                  
  8528                                  ;-905         p++;
  8529                                  
  8530 00003B1A FF46FC                   inc  word[bp-4]
  8531                                  
  8532                                  ;-906         c=next();
  8533                                  
  8534 00003B1D E8D7C8                   call next
  8535 00003B20 8946FE                   mov [bp-2], ax
  8536                                  
  8537                                  ;-907     }
  8538                                  
  8539                                  
  8540                                  ;-908     *p=0;
  8541                                  
  8542 00003B23 EBE3                     jmp .getstring472
  8543                                  .getstring473:
  8544 00003B25 B80000                   mov ax, 0
  8545 00003B28 8B5EFC                   mov  bx, [bp-4]
  8546 00003B2B 8807                     mov  [bx], al
  8547                                  
  8548                                  ;-909 }
  8549                                  
  8550                                  
  8551                                  ;-910 
  8552                                  
  8553                                  
  8554                                  ;-911 int fgets1() {
  8555 00003B2D C9                       LEAVE
  8556 00003B2E C3                       ret
  8557                                  ENDP
  8558                                  
  8559                                  fgets1: PROC
  8560                                  
  8561                                  ;-912     char c;
  8562                                  
  8563                                  
  8564                                  ;-913     c=*fgetsp;
  8565                                  
  8566                                  ;Function : fgets1, Number of local variables: 1
  8567                                  ;   # type sign width addr used name   list of local variables
  8568                                  ;  200 var sign byte   912 NULL c = bp-2;
  8569 00003B2F C8020000                 ENTER  2,0
  8570 00003B33 8B1E[6400]               mov bx, [fgetsp]
  8571 00003B37 8A07                     mov al, [bx]
  8572 00003B39 B400                     mov ah, 0
  8573 00003B3B 8846FE                   mov [bp-2], al
  8574                                  
  8575                                  ;-914     if (c==0) {
  8576                                  
  8577 00003B3E 8A46FE                   mov al, [bp-2]
  8578 00003B41 3C00                     cmp al, 0
  8579 00003B43 0F852A00                 jne .fgets1474
  8580                                  
  8581                                  ;-915         printinputline();
  8582                                  
  8583 00003B47 E83700                   call printinputline
  8584                                  
  8585                                  ;-916         if (DOS_NoBytes == 0) return 0;
  8586                                  
  8587 00003B4A A1[7200]                 mov ax, [DOS_NoBytes]
  8588 00003B4D 83F800                   cmp ax, 0
  8589 00003B50 0F850600                 jne .fgets1475
  8590 00003B54 B80000                   mov ax, 0
  8591 00003B57 E92500                   jmp .retnfgets1
  8592                                  
  8593                                  ;-917         fgetsp=&fgetsdest;
  8594                                  
  8595                                  .fgets1475:
  8596 00003B5A B89FB8                   mov ax, fgetsdest
  8597 00003B5D A3[6400]                 mov word [fgetsp], ax
  8598                                  
  8599                                  ;-918         c=*fgetsp;
  8600                                  
  8601 00003B60 8B1E[6400]               mov bx, [fgetsp]
  8602 00003B64 8A07                     mov al, [bx]
  8603 00003B66 B400                     mov ah, 0
  8604 00003B68 8846FE                   mov [bp-2], al
  8605                                  
  8606                                  ;-919         column=0;
  8607                                  
  8608 00003B6B B80000                   mov ax, 0
  8609 00003B6E A3[2100]                 mov word [column], ax
  8610                                  
  8611                                  ;-920     }
  8612                                  
  8613                                  
  8614                                  ;-921     fgetsp++;
  8615                                  
  8616                                  .fgets1474:
  8617 00003B71 FF06[6400]               inc  word[fgetsp]
  8618                                  
  8619                                  ;-922     column++;
  8620                                  
  8621 00003B75 FF06[2100]               inc  word[column]
  8622                                  
  8623                                  ;-923     return c;
  8624                                  
  8625 00003B79 8A46FE                   mov al, [bp-2]
  8626 00003B7C E90000                   jmp .retnfgets1
  8627                                  
  8628                                  ;-924 }
  8629                                  
  8630                                  
  8631                                  ;-925 int printinputline() {
  8632                                  
  8633 00003B7F C9                       .retnfgets1: LEAVE
  8634 00003B80 C3                       ret
  8635                                  ENDP
  8636                                  
  8637                                  printinputline: PROC
  8638                                  
  8639                                  ;-926     int col;
  8640                                  
  8641                                  
  8642                                  ;-927     col=0;
  8643                                  
  8644                                  ;Function : printinputline, Number of local variables: 1
  8645                                  ;   # type sign width addr used name   list of local variables
  8646                                  ;  200 var sign word   926 NULL col = bp-2;
  8647 00003B81 C8020000                 ENTER  2,0
  8648 00003B85 B80000                   mov ax, 0
  8649 00003B88 8946FE                   mov [bp-2], ax
  8650                                  
  8651                                  ;-928     fgetsp=&fgetsdest;
  8652                                  
  8653 00003B8B B89FB8                   mov ax, fgetsdest
  8654 00003B8E A3[6400]                 mov word [fgetsp], ax
  8655                                  
  8656                                  ;-929     do {
  8657                                  
  8658                                  .printinputline476:
  8659                                  
  8660                                  ;-930         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  8661                                  
  8662 00003B91 6A01                     push 1
  8663 00003B93 FF36[1A00]               push word [fdin]
  8664 00003B97 8D06[7400]               lea  ax, [DOS_ByteRead]
  8665 00003B9B 50                       push ax
  8666 00003B9C E878C5                   call readRL
  8667 00003B9F 83C406                   add  sp, 6
  8668 00003BA2 A3[7200]                 mov word [DOS_NoBytes], ax
  8669                                  
  8670                                  ;-931         if (DOS_NoBytes == 0) return;
  8671                                  
  8672 00003BA5 A1[7200]                 mov ax, [DOS_NoBytes]
  8673 00003BA8 83F800                   cmp ax, 0
  8674 00003BAB 0F850300                 jne .printinputline477
  8675 00003BAF E96A00                   jmp .retnprintinputline
  8676                                  
  8677                                  ;-932         *fgetsp=DOS_ByteRead;
  8678                                  
  8679                                  .printinputline477:
  8680 00003BB2 A0[7400]                 mov al, [DOS_ByteRead]
  8681 00003BB5 8B1E[6400]               mov  bx, [fgetsp]
  8682 00003BB9 8807                     mov  [bx], al
  8683                                  
  8684                                  ;-933         fgetsp++;
  8685                                  
  8686 00003BBB FF06[6400]               inc  word[fgetsp]
  8687                                  
  8688                                  ;-934         col++;
  8689                                  
  8690 00003BBF FF46FE                   inc  word[bp-2]
  8691                                  
  8692                                  ;-935         if (col >80) error1("input line longer than 80 char");
  8693                                  
  8694 00003BC2 8B46FE                   mov ax, [bp-2]
  8695 00003BC5 83F850                   cmp ax, 80
  8696 00003BC8 0F8E0900                 jle .printinputline478
  8697 00003BCC 68[1E3C]                 push printinputline_0
  8698 00003BCF E8CE00                   call error1
  8699 00003BD2 83C402                   add  sp, 2
  8700                                  
  8701                                  ;-936         }
  8702                                  
  8703                                  .printinputline478:
  8704                                  
  8705                                  ;-937         while (DOS_ByteRead != 10);
  8706                                  
  8707 00003BD5 A0[7400]                 mov al, [DOS_ByteRead]
  8708 00003BD8 3C0A                     cmp al, 10
  8709 00003BDA 0F840200                 je  .printinputline479
  8710 00003BDE EBB1                     jmp .printinputline476
  8711                                  .printinputline479:
  8712                                  
  8713                                  ;-938     *fgetsp=0;
  8714                                  
  8715 00003BE0 B80000                   mov ax, 0
  8716 00003BE3 8B1E[6400]               mov  bx, [fgetsp]
  8717 00003BE7 8807                     mov  [bx], al
  8718                                  
  8719                                  ;-939     if (fdout) {
  8720                                  
  8721 00003BE9 A1[1C00]                 mov ax, [fdout]
  8722 00003BEC 08C0                     or  al, al
  8723 00003BEE 0F842A00                 je .printinputline480
  8724                                  
  8725                                  ;-940         prs("\n\n;-");
  8726                                  
  8727 00003BF2 68[3D3C]                 push printinputline_1
  8728 00003BF5 E852C9                   call prs
  8729 00003BF8 83C402                   add  sp, 2
  8730                                  
  8731                                  ;-941         prunsign1(lineno);
  8732                                  
  8733 00003BFB FF36[6800]               push word [lineno]
  8734 00003BFF E89DCA                   call prunsign1
  8735 00003C02 83C402                   add  sp, 2
  8736                                  
  8737                                  ;-942         prc(' ');
  8738                                  
  8739 00003C05 6A20                     push 32
  8740 00003C07 E8D9C8                   call prc
  8741 00003C0A 83C402                   add  sp, 2
  8742                                  
  8743                                  ;-943         lineno++;
  8744                                  
  8745 00003C0D FF06[6800]               inc  word[lineno]
  8746                                  
  8747                                  ;-944         prscomment(&fgetsdest);
  8748                                  
  8749 00003C11 8D069FB8                 lea  ax, [fgetsdest]
  8750 00003C15 50                       push ax
  8751 00003C16 E8F5C8                   call prscomment
  8752 00003C19 83C402                   add  sp, 2
  8753                                  
  8754                                  ;-945         }
  8755                                  
  8756                                  
  8757                                  ;-946 }
  8758                                  
  8759                                  .printinputline480:
  8760                                  
  8761                                  ;-947 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  8762                                  
  8763 00003C1C C9                       .retnprintinputline: LEAVE
  8764 00003C1D C3                       ret
  8765 00003C1E 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  8766 00003C27 65206C6F6E67657220-
  8767 00003C30 7468616E2038302063-
  8768 00003C39 68617200           
  8769 00003C3D 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  8770                                  ENDP
  8771                                  
  8772                                  ifEOL: PROC
  8773                                  
  8774                                  ;-948     if (c == 10) return 1;//LF
  8775                                  
  8776                                  ;Function : ifEOL, Number of local variables: 1
  8777                                  ;   # type sign width addr used name   list of local variables
  8778                                  ;  200 var sign byte   947 NULL c = bp+4;
  8779 00003C44 C8000000                 ENTER  0,0
  8780 00003C48 8A4604                   mov al, [bp+4]
  8781 00003C4B 3C0A                     cmp al, 10
  8782 00003C4D 0F850600                 jne .ifEOL481
  8783 00003C51 B80100                   mov ax, 1
  8784 00003C54 E92400                   jmp .retnifEOL
  8785                                  
  8786                                  ;-949     if (c == 13) {//CR
  8787                                  
  8788                                  .ifEOL481:
  8789 00003C57 8A4604                   mov al, [bp+4]
  8790 00003C5A 3C0D                     cmp al, 13
  8791 00003C5C 0F851500                 jne .ifEOL482
  8792                                  
  8793                                  ;-950         if (thechar == 10) c=next();
  8794                                  
  8795 00003C60 A0[2300]                 mov al, [thechar]
  8796 00003C63 3C0A                     cmp al, 10
  8797 00003C65 0F850600                 jne .ifEOL483
  8798 00003C69 E88BC7                   call next
  8799 00003C6C 884604                   mov [bp+4], al
  8800                                  
  8801                                  ;-951         return 1;
  8802                                  
  8803                                  .ifEOL483:
  8804 00003C6F B80100                   mov ax, 1
  8805 00003C72 E90600                   jmp .retnifEOL
  8806                                  
  8807                                  ;-952     }
  8808                                  
  8809                                  
  8810                                  ;-953     return 0;
  8811                                  
  8812                                  .ifEOL482:
  8813 00003C75 B80000                   mov ax, 0
  8814 00003C78 E90000                   jmp .retnifEOL
  8815                                  
  8816                                  ;-954 }
  8817                                  
  8818                                  
  8819                                  ;-955 
  8820                                  
  8821                                  
  8822                                  ;-956 int end1(int n) {
  8823                                  
  8824 00003C7B C9                       .retnifEOL: LEAVE
  8825 00003C7C C3                       ret
  8826                                  ENDP
  8827                                  
  8828                                  end1: PROC
  8829                                  
  8830                                  ;-957     fcloseR(fdin);
  8831                                  
  8832                                  ;Function : end1, Number of local variables: 1
  8833                                  ;   # type sign width addr used name   list of local variables
  8834                                  ;  200 var sign word   956 NULL n = bp+4;
  8835 00003C7D C8000000                 ENTER  0,0
  8836 00003C81 FF36[1A00]               push word [fdin]
  8837 00003C85 E872C4                   call fcloseR
  8838 00003C88 83C402                   add  sp, 2
  8839                                  
  8840                                  ;-958     fcloseR(fdout);
  8841                                  
  8842 00003C8B FF36[1C00]               push word [fdout]
  8843 00003C8F E868C4                   call fcloseR
  8844 00003C92 83C402                   add  sp, 2
  8845                                  
  8846                                  ;-959     exitR(n);
  8847                                  
  8848 00003C95 FF7604                   push word [bp+4]
  8849 00003C98 E86EC4                   call exitR
  8850 00003C9B 83C402                   add  sp, 2
  8851                                  
  8852                                  ;-960 }
  8853                                  
  8854                                  
  8855                                  ;-961 int error1(char *s) {
  8856 00003C9E C9                       LEAVE
  8857 00003C9F C3                       ret
  8858                                  ENDP
  8859                                  
  8860                                  error1: PROC
  8861                                  
  8862                                  ;-962     lineno--;
  8863                                  
  8864                                  ;Function : error1, Number of local variables: 1
  8865                                  ;   # type sign width addr used name   list of local variables
  8866                                  ;  200 ptr sign byte   961 NULL s = bp+4;
  8867 00003CA0 C8000000                 ENTER  0,0
  8868 00003CA4 FF0E[6800]               dec  word[lineno]
  8869                                  
  8870                                  ;-963     prnl();
  8871                                  
  8872 00003CA8 E891C8                   call prnl
  8873                                  
  8874                                  ;-964     prscomment(&fgetsdest);
  8875                                  
  8876 00003CAB 8D069FB8                 lea  ax, [fgetsdest]
  8877 00003CAF 50                       push ax
  8878 00003CB0 E85BC8                   call prscomment
  8879 00003CB3 83C402                   add  sp, 2
  8880                                  
  8881                                  ;-965     prs(";Line: ");
  8882                                  
  8883 00003CB6 68[1F3D]                 push error1_0
  8884 00003CB9 E88EC8                   call prs
  8885 00003CBC 83C402                   add  sp, 2
  8886                                  
  8887                                  ;-966     prunsign1(lineno);
  8888                                  
  8889 00003CBF FF36[6800]               push word [lineno]
  8890 00003CC3 E8D9C9                   call prunsign1
  8891 00003CC6 83C402                   add  sp, 2
  8892                                  
  8893                                  ;-967     prs(" ************** ERROR: ");
  8894                                  
  8895 00003CC9 68[273D]                 push error1_1
  8896 00003CCC E87BC8                   call prs
  8897 00003CCF 83C402                   add  sp, 2
  8898                                  
  8899                                  ;-968     prs(s);
  8900                                  
  8901 00003CD2 FF7604                   push word [bp+4]
  8902 00003CD5 E872C8                   call prs
  8903 00003CD8 83C402                   add  sp, 2
  8904                                  
  8905                                  ;-969     prs("  in column: ");
  8906                                  
  8907 00003CDB 68[3F3D]                 push error1_2
  8908 00003CDE E869C8                   call prs
  8909 00003CE1 83C402                   add  sp, 2
  8910                                  
  8911                                  ;-970     prunsign1(column);
  8912                                  
  8913 00003CE4 FF36[2100]               push word [column]
  8914 00003CE8 E8B4C9                   call prunsign1
  8915 00003CEB 83C402                   add  sp, 2
  8916                                  
  8917                                  ;-971     prs("\nToken: ");
  8918                                  
  8919 00003CEE 68[4D3D]                 push error1_3
  8920 00003CF1 E856C8                   call prs
  8921 00003CF4 83C402                   add  sp, 2
  8922                                  
  8923                                  ;-972     prunsign1(token);
  8924                                  
  8925 00003CF7 FF36[1E00]               push word [token]
  8926 00003CFB E8A1C9                   call prunsign1
  8927 00003CFE 83C402                   add  sp, 2
  8928                                  
  8929                                  ;-973 //    prs(", globC: ");
  8930                                  
  8931                                  
  8932                                  ;-974 //    prc(globC);
  8933                                  
  8934                                  
  8935                                  ;-975 //    prs(", thechar: ");
  8936                                  
  8937                                  
  8938                                  ;-976 //    prunsign1(thechar);
  8939                                  
  8940                                  
  8941                                  ;-977     prs(", symbol: ");
  8942                                  
  8943 00003D01 68[573D]                 push error1_4
  8944 00003D04 E843C8                   call prs
  8945 00003D07 83C402                   add  sp, 2
  8946                                  
  8947                                  ;-978     prs(symbol);
  8948                                  
  8949 00003D0A 8D06BB69                 lea  ax, [symbol]
  8950 00003D0E 50                       push ax
  8951 00003D0F E838C8                   call prs
  8952 00003D12 83C402                   add  sp, 2
  8953                                  
  8954                                  ;-979     end1(1);
  8955                                  
  8956 00003D15 6A01                     push 1
  8957 00003D17 E863FF                   call end1
  8958 00003D1A 83C402                   add  sp, 2
  8959                                  
  8960                                  ;-980 }
  8961                                  
  8962                                  
  8963                                  ;-981 int listproc() {
  8964 00003D1D C9                       LEAVE
  8965 00003D1E C3                       ret
  8966 00003D1F 3B4C696E653A2000        error1_0 db ";Line: ",0
  8967 00003D27 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  8968 00003D30 2A2A2A2A2A2A204552-
  8969 00003D39 524F523A2000       
  8970 00003D3F 2020696E20636F6C75-     error1_2 db "  in column: ",0
  8971 00003D48 6D6E3A2000         
  8972 00003D4D 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  8973 00003D56 00                 
  8974 00003D57 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  8975 00003D60 2000               
  8976                                  ENDP
  8977                                  
  8978                                  listproc: PROC
  8979                                  
  8980                                  ;-982     int i;
  8981                                  
  8982                                  
  8983                                  ;-983     if (LTop > LSTART) {
  8984                                  
  8985                                  ;Function : listproc, Number of local variables: 1
  8986                                  ;   # type sign width addr used name   list of local variables
  8987                                  ;  200 var sign word   982 NULL i = bp-2;
  8988 00003D62 C8020000                 ENTER  2,0
  8989 00003D66 A1[2E00]                 mov ax, [LTop]
  8990 00003D69 3DC800                   cmp ax, 200
  8991 00003D6C 0F8E6000                 jle .listproc484
  8992                                  
  8993                                  ;-984         prs("\n;Function : "); prs(fname);
  8994                                  
  8995 00003D70 68[D23D]                 push listproc_0
  8996 00003D73 E8D4C7                   call prs
  8997 00003D76 83C402                   add  sp, 2
  8998 00003D79 8D063B6A                 lea  ax, [fname]
  8999 00003D7D 50                       push ax
  9000 00003D7E E8C9C7                   call prs
  9001 00003D81 83C402                   add  sp, 2
  9002                                  
  9003                                  ;-985         prs(", Number of local variables: ");
  9004                                  
  9005 00003D84 68[E13D]                 push listproc_1
  9006 00003D87 E8C0C7                   call prs
  9007 00003D8A 83C402                   add  sp, 2
  9008                                  
  9009                                  ;-986         i=LTop - LSTART;
  9010                                  
  9011 00003D8D A1[2E00]                 mov ax, [LTop]
  9012 00003D90 2DC800                   sub ax, 200
  9013 00003D93 8946FE                   mov [bp-2], ax
  9014                                  
  9015                                  ;-987         prunsign1(i);
  9016                                  
  9017 00003D96 FF76FE                   push word [bp-2]
  9018 00003D99 E803C9                   call prunsign1
  9019 00003D9C 83C402                   add  sp, 2
  9020                                  
  9021                                  ;-988         prs("\n;   # type sign width addr used name");
  9022                                  
  9023 00003D9F 68[FF3D]                 push listproc_2
  9024 00003DA2 E8A5C7                   call prs
  9025 00003DA5 83C402                   add  sp, 2
  9026                                  
  9027                                  ;-989         prs("   list of local variables");
  9028                                  
  9029 00003DA8 68[263E]                 push listproc_3
  9030 00003DAB E89CC7                   call prs
  9031 00003DAE 83C402                   add  sp, 2
  9032                                  
  9033                                  ;-990         i=LSTART;
  9034                                  
  9035 00003DB1 B8C800                   mov ax, 200
  9036 00003DB4 8946FE                   mov [bp-2], ax
  9037                                  
  9038                                  ;-991         while (i < LTop) {
  9039                                  
  9040                                  .listproc485:
  9041 00003DB7 8B46FE                   mov ax, [bp-2]
  9042 00003DBA 3B06[2E00]               cmp ax, [LTop]
  9043 00003DBE 0F8D0E00                 jge .listproc486
  9044                                  
  9045                                  ;-992             listvar(i);
  9046                                  
  9047 00003DC2 FF76FE                   push word [bp-2]
  9048 00003DC5 E84703                   call listvar
  9049 00003DC8 83C402                   add  sp, 2
  9050                                  
  9051                                  ;-993             i++;
  9052                                  
  9053 00003DCB FF46FE                   inc  word[bp-2]
  9054                                  
  9055                                  ;-994             }
  9056                                  
  9057                                  
  9058                                  ;-995         }
  9059                                  
  9060 00003DCE EBE7                     jmp .listproc485
  9061                                  .listproc486:
  9062                                  
  9063                                  ;-996 }
  9064                                  
  9065                                  .listproc484:
  9066                                  
  9067                                  ;-997 int listcall() {
  9068 00003DD0 C9                       LEAVE
  9069 00003DD1 C3                       ret
  9070 00003DD2 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9071 00003DDB 6F6E203A2000       
  9072 00003DE1 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9073 00003DEA 6F66206C6F63616C20-
  9074 00003DF3 7661726961626C6573-
  9075 00003DFC 3A2000             
  9076 00003DFF 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name",0
  9077 00003E08 797065207369676E20-
  9078 00003E11 776964746820616464-
  9079 00003E1A 722075736564206E61-
  9080 00003E23 6D6500             
  9081 00003E26 2020206C697374206F-     listproc_3 db "   list of local variables",0
  9082 00003E2F 66206C6F63616C2076-
  9083 00003E38 61726961626C657300 
  9084                                  ENDP
  9085                                  
  9086                                  listcall: PROC
  9087                                  
  9088                                  ;-998     int i;
  9089                                  
  9090                                  
  9091                                  ;-999     prs("\n\n;    #  addr name   list of CALLs\n");
  9092                                  
  9093                                  ;Function : listcall, Number of local variables: 1
  9094                                  ;   # type sign width addr used name   list of local variables
  9095                                  ;  200 var sign word   998 NULL i = bp-2;
  9096 00003E41 C8020000                 ENTER  2,0
  9097 00003E45 68[6F3E]                 push listcall_0
  9098 00003E48 E8FFC6                   call prs
  9099 00003E4B 83C402                   add  sp, 2
  9100                                  
  9101                                  ;-1000     i=0;
  9102                                  
  9103 00003E4E B80000                   mov ax, 0
  9104 00003E51 8946FE                   mov [bp-2], ax
  9105                                  
  9106                                  ;-1001     while (i< CTop) {
  9107                                  
  9108                                  .listcall487:
  9109 00003E54 8B46FE                   mov ax, [bp-2]
  9110 00003E57 3B06[3F00]               cmp ax, [CTop]
  9111 00003E5B 0F8D0E00                 jge .listcall488
  9112                                  
  9113                                  ;-1002         calllisting(i);
  9114                                  
  9115 00003E5F FF76FE                   push word [bp-2]
  9116 00003E62 E83200                   call calllisting
  9117 00003E65 83C402                   add  sp, 2
  9118                                  
  9119                                  ;-1003         i++;
  9120                                  
  9121 00003E68 FF46FE                   inc  word[bp-2]
  9122                                  
  9123                                  ;-1004         }
  9124                                  
  9125                                  
  9126                                  ;-1005 }
  9127                                  
  9128 00003E6B EBE7                     jmp .listcall487
  9129                                  .listcall488:
  9130                                  
  9131                                  ;-1006 int calllisting(int i) {
  9132 00003E6D C9                       LEAVE
  9133 00003E6E C3                       ret
  9134 00003E6F 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9135 00003E78 23202061646472206E-
  9136 00003E81 616D652020206C6973-
  9137 00003E8A 74206F662043414C4C-
  9138 00003E93 735C6E00           
  9139                                  ENDP
  9140                                  
  9141                                  calllisting: PROC
  9142                                  
  9143                                  ;-1007     char c; int j;
  9144                                  
  9145                                  
  9146                                  ;-1008     prs("\n;");
  9147                                  
  9148                                  ;Function : calllisting, Number of local variables: 3
  9149                                  ;   # type sign width addr used name   list of local variables
  9150                                  ;  200 var sign word  1006 NULL i = bp+4
  9151                                  ;  201 var sign byte  1007 NULL c = bp-2
  9152                                  ;  202 var sign word  1007 NULL j = bp-4;
  9153 00003E97 C8040000                 ENTER  4,0
  9154 00003E9B 68[093F]                 push calllisting_0
  9155 00003E9E E8A9C6                   call prs
  9156 00003EA1 83C402                   add  sp, 2
  9157                                  
  9158                                  ;-1009     printint51(i);
  9159                                  
  9160 00003EA4 FF7604                   push word [bp+4]
  9161 00003EA7 E839C8                   call printint51
  9162 00003EAA 83C402                   add  sp, 2
  9163                                  
  9164                                  ;-1010     prc(32);
  9165                                  
  9166 00003EAD 6A20                     push 32
  9167 00003EAF E831C6                   call prc
  9168 00003EB2 83C402                   add  sp, 2
  9169                                  
  9170                                  ;-1011     c=CType [i];
  9171                                  
  9172 00003EB5 8B5E04                   mov bx, [bp+4]
  9173 00003EB8 8A87BF89                 mov al, [CType + bx]
  9174 00003EBC 8846FE                   mov [bp-2], al
  9175                                  
  9176                                  ;-1012     if(c==0)prs("unresolved ");
  9177                                  
  9178 00003EBF 8A46FE                   mov al, [bp-2]
  9179 00003EC2 3C00                     cmp al, 0
  9180 00003EC4 0F850900                 jne .calllisting489
  9181 00003EC8 68[0D3F]                 push calllisting_1
  9182 00003ECB E87CC6                   call prs
  9183 00003ECE 83C402                   add  sp, 2
  9184                                  
  9185                                  ;-1013     j=CAdr[i];
  9186                                  
  9187                                  .calllisting489:
  9188 00003ED1 8B5E04                   mov bx, [bp+4]
  9189 00003ED4 D1E3                     shl bx, 1
  9190 00003ED6 8B87E793                 mov ax, [CAdr + bx]
  9191 00003EDA 8946FC                   mov [bp-4], ax
  9192                                  
  9193                                  ;-1014     printint51(j);
  9194                                  
  9195 00003EDD FF76FC                   push word [bp-4]
  9196 00003EE0 E800C8                   call printint51
  9197 00003EE3 83C402                   add  sp, 2
  9198                                  
  9199                                  ;-1015     prc(32);
  9200                                  
  9201 00003EE6 6A20                     push 32
  9202 00003EE8 E8F8C5                   call prc
  9203 00003EEB 83C402                   add  sp, 2
  9204                                  
  9205                                  ;-1016     from_far(NameA, j);
  9206                                  
  9207 00003EEE FF76FC                   push word [bp-4]
  9208 00003EF1 8D06[4100]               lea  ax, [NameA]
  9209 00003EF5 50                       push ax
  9210 00003EF6 E8F80C                   call from_far
  9211 00003EF9 83C404                   add  sp, 4
  9212                                  
  9213                                  ;-1017     prs(NameA);
  9214                                  
  9215 00003EFC 8D06[4100]               lea  ax, [NameA]
  9216 00003F00 50                       push ax
  9217 00003F01 E846C6                   call prs
  9218 00003F04 83C402                   add  sp, 2
  9219                                  
  9220                                  ;-1018 }
  9221                                  
  9222                                  
  9223                                  ;-1019 int countcalls(int f) {
  9224 00003F07 C9                       LEAVE
  9225 00003F08 C3                       ret
  9226 00003F09 5C6E3B00                calllisting_0 db "\n;",0
  9227 00003F0D 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
  9228 00003F16 642000             
  9229                                  ENDP
  9230                                  
  9231                                  countcalls: PROC
  9232                                  
  9233                                  ;-1020     unsigned int i;
  9234                                  
  9235                                  
  9236                                  ;-1021     pt=adrF(FNameField, f);
  9237                                  
  9238                                  ;Function : countcalls, Number of local variables: 2
  9239                                  ;   # type sign width addr used name   list of local variables
  9240                                  ;  200 var sign word  1019 NULL f = bp+4
  9241                                  ;  201 var unsg word  1020 NULL i = bp-2;
  9242 00003F19 C8020000                 ENTER  2,0
  9243 00003F1D FF7604                   push word [bp+4]
  9244 00003F20 8D06DFA5                 lea  ax, [FNameField]
  9245 00003F24 50                       push ax
  9246 00003F25 E80CCD                   call adrF
  9247 00003F28 83C404                   add  sp, 4
  9248 00003F2B A3[6C00]                 mov word [pt], ax
  9249                                  
  9250                                  ;-1022     i=0;
  9251                                  
  9252 00003F2E B80000                   mov ax, 0
  9253 00003F31 8946FE                   mov [bp-2], ax
  9254                                  
  9255                                  ;-1023     while (i < CTop) {
  9256                                  
  9257                                  .countcalls490:
  9258 00003F34 8B46FE                   mov ax, [bp-2]
  9259 00003F37 3B06[3F00]               cmp ax, [CTop]
  9260 00003F3B 0F8D4A00                 jge .countcalls491
  9261                                  
  9262                                  ;-1024         p1=CAdr[i];
  9263                                  
  9264 00003F3F 8B5EFE                   mov bx, [bp-2]
  9265 00003F42 D1E3                     shl bx, 1
  9266 00003F44 8B87E793                 mov ax, [CAdr + bx]
  9267 00003F48 A3[6E00]                 mov word [p1], ax
  9268                                  
  9269                                  ;-1025         from_far(NameA, p1);
  9270                                  
  9271 00003F4B FF36[6E00]               push word [p1]
  9272 00003F4F 8D06[4100]               lea  ax, [NameA]
  9273 00003F53 50                       push ax
  9274 00003F54 E89A0C                   call from_far
  9275 00003F57 83C404                   add  sp, 4
  9276                                  
  9277                                  ;-1026         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
  9278                                  
  9279 00003F5A 8D06[4100]               lea  ax, [NameA]
  9280 00003F5E 50                       push ax
  9281 00003F5F FF36[6C00]               push word [pt]
  9282 00003F63 E81DC3                   call eqstr
  9283 00003F66 83C404                   add  sp, 4
  9284 00003F69 08C0                     or  al, al
  9285 00003F6B 0F841500                 je .countcalls492
  9286 00003F6F 8B5E04                   mov bx, [bp+4]
  9287 00003F72 D1E3                     shl bx, 1
  9288 00003F74 8B8787A3                 mov ax, [FCalls + bx]
  9289 00003F78 83C001                   add ax, 1
  9290 00003F7B 8B5E04                   mov bx, [bp+4]
  9291 00003F7E D1E3                     shl bx, 1
  9292 00003F80 898787A3                 mov [FCalls+bx], ax
  9293                                  
  9294                                  ;-1027         i++;
  9295                                  
  9296                                  .countcalls492:
  9297 00003F84 FF46FE                   inc  word[bp-2]
  9298                                  
  9299                                  ;-1028         }
  9300                                  
  9301                                  
  9302                                  ;-1029 }
  9303                                  
  9304 00003F87 EBAB                     jmp .countcalls490
  9305                                  .countcalls491:
  9306                                  
  9307                                  ;-1030 int listfunc() {
  9308 00003F89 C9                       LEAVE
  9309 00003F8A C3                       ret
  9310                                  ENDP
  9311                                  
  9312                                  listfunc: PROC
  9313                                  
  9314                                  ;-1031     int i;
  9315                                  
  9316                                  
  9317                                  ;-1032     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
  9318                                  
  9319                                  ;Function : listfunc, Number of local variables: 1
  9320                                  ;   # type sign width addr used name   list of local variables
  9321                                  ;  200 var sign word  1031 NULL i = bp-2;
  9322 00003F8B C8020000                 ENTER  2,0
  9323 00003F8F 68[D83F]                 push listfunc_0
  9324 00003F92 E8B5C5                   call prs
  9325 00003F95 83C402                   add  sp, 2
  9326                                  
  9327                                  ;-1033     i=0;
  9328                                  
  9329 00003F98 B80000                   mov ax, 0
  9330 00003F9B 8946FE                   mov [bp-2], ax
  9331                                  
  9332                                  ;-1034     while (i < FTop) {
  9333                                  
  9334                                  .listfunc493:
  9335 00003F9E 8B46FE                   mov ax, [bp-2]
  9336 00003FA1 3B06[3D00]               cmp ax, [FTop]
  9337 00003FA5 0F8D0E00                 jge .listfunc494
  9338                                  
  9339                                  ;-1035         countcalls (i);
  9340                                  
  9341 00003FA9 FF76FE                   push word [bp-2]
  9342 00003FAC E86AFF                   call countcalls
  9343 00003FAF 83C402                   add  sp, 2
  9344                                  
  9345                                  ;-1036         i++;
  9346                                  
  9347 00003FB2 FF46FE                   inc  word[bp-2]
  9348                                  
  9349                                  ;-1037         }
  9350                                  
  9351                                  
  9352                                  ;-1038     i=0;
  9353                                  
  9354 00003FB5 EBE7                     jmp .listfunc493
  9355                                  .listfunc494:
  9356 00003FB7 B80000                   mov ax, 0
  9357 00003FBA 8946FE                   mov [bp-2], ax
  9358                                  
  9359                                  ;-1039     while (i < FTop) {
  9360                                  
  9361                                  .listfunc495:
  9362 00003FBD 8B46FE                   mov ax, [bp-2]
  9363 00003FC0 3B06[3D00]               cmp ax, [FTop]
  9364 00003FC4 0F8D0E00                 jge .listfunc496
  9365                                  
  9366                                  ;-1040         funclisting(i);
  9367                                  
  9368 00003FC8 FF76FE                   push word [bp-2]
  9369 00003FCB E84300                   call funclisting
  9370 00003FCE 83C402                   add  sp, 2
  9371                                  
  9372                                  ;-1041         i++;
  9373                                  
  9374 00003FD1 FF46FE                   inc  word[bp-2]
  9375                                  
  9376                                  ;-1042         }
  9377                                  
  9378                                  
  9379                                  ;-1043 }
  9380                                  
  9381 00003FD4 EBE7                     jmp .listfunc495
  9382                                  .listfunc496:
  9383                                  
  9384                                  ;-1044 int funclisting(int i) {
  9385 00003FD6 C9                       LEAVE
  9386 00003FD7 C3                       ret
  9387 00003FD8 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
  9388 00003FE1 20232043616C6C7320-
  9389 00003FEA 4C696E652057696474-
  9390 00003FF3 6820204E616D652020-
  9391 00003FFC 206C697374206F6620-
  9392 00004005 66756E6374696F6E73-
  9393 0000400E 5C6E00             
  9394                                  ENDP
  9395                                  
  9396                                  funclisting: PROC
  9397                                  
  9398                                  ;-1045     int j;  char c;
  9399                                  
  9400                                  
  9401                                  ;-1046     prs("\n;");    printint51(i);
  9402                                  
  9403                                  ;Function : funclisting, Number of local variables: 3
  9404                                  ;   # type sign width addr used name   list of local variables
  9405                                  ;  200 var sign word  1044 NULL i = bp+4
  9406                                  ;  201 var sign word  1045 NULL j = bp-2
  9407                                  ;  202 var sign byte  1045 NULL c = bp-4;
  9408 00004011 C8040000                 ENTER  4,0
  9409 00004015 68[ED40]                 push funclisting_0
  9410 00004018 E82FC5                   call prs
  9411 0000401B 83C402                   add  sp, 2
  9412 0000401E FF7604                   push word [bp+4]
  9413 00004021 E8BFC6                   call printint51
  9414 00004024 83C402                   add  sp, 2
  9415                                  
  9416                                  ;-1047     j = FCalls[i];
  9417                                  
  9418 00004027 8B5E04                   mov bx, [bp+4]
  9419 0000402A D1E3                     shl bx, 1
  9420 0000402C 8B8787A3                 mov ax, [FCalls + bx]
  9421 00004030 8946FE                   mov [bp-2], ax
  9422                                  
  9423                                  ;-1048     if (j) printint51(j);
  9424                                  
  9425 00004033 8B46FE                   mov ax, [bp-2]
  9426 00004036 08C0                     or  al, al
  9427 00004038 0F840C00                 je .funclisting497
  9428 0000403C FF76FE                   push word [bp-2]
  9429 0000403F E8A1C6                   call printint51
  9430 00004042 83C402                   add  sp, 2
  9431                                  
  9432                                  ;-1049         else prs(" NULL");
  9433                                  
  9434 00004045 E90900                   jmp .funclisting498
  9435                                  .funclisting497:
  9436 00004048 68[F140]                 push funclisting_1
  9437 0000404B E8FCC4                   call prs
  9438 0000404E 83C402                   add  sp, 2
  9439                                  
  9440                                  ;-1050     j = FAdr[i];
  9441                                  
  9442                                  .funclisting498:
  9443 00004051 8B5E04                   mov bx, [bp+4]
  9444 00004054 D1E3                     shl bx, 1
  9445 00004056 8B878F91                 mov ax, [FAdr + bx]
  9446 0000405A 8946FE                   mov [bp-2], ax
  9447                                  
  9448                                  ;-1051     printint51(j);
  9449                                  
  9450 0000405D FF76FE                   push word [bp-2]
  9451 00004060 E880C6                   call printint51
  9452 00004063 83C402                   add  sp, 2
  9453                                  
  9454                                  ;-1052     prc(32);
  9455                                  
  9456 00004066 6A20                     push 32
  9457 00004068 E878C4                   call prc
  9458 0000406B 83C402                   add  sp, 2
  9459                                  
  9460                                  ;-1053     c=FType[i];
  9461                                  
  9462 0000406E 8B5E04                   mov bx, [bp+4]
  9463 00004071 8A879388                 mov al, [FType + bx]
  9464 00004075 8846FC                   mov [bp-4], al
  9465                                  
  9466                                  ;-1054     if(c=='V')prs("void " );
  9467                                  
  9468 00004078 8A46FC                   mov al, [bp-4]
  9469 0000407B 3C56                     cmp al, 86
  9470 0000407D 0F850900                 jne .funclisting499
  9471 00004081 68[F740]                 push funclisting_2
  9472 00004084 E8C3C4                   call prs
  9473 00004087 83C402                   add  sp, 2
  9474                                  
  9475                                  ;-1055     if(c=='B')prs("byte " );
  9476                                  
  9477                                  .funclisting499:
  9478 0000408A 8A46FC                   mov al, [bp-4]
  9479 0000408D 3C42                     cmp al, 66
  9480 0000408F 0F850900                 jne .funclisting500
  9481 00004093 68[FD40]                 push funclisting_3
  9482 00004096 E8B1C4                   call prs
  9483 00004099 83C402                   add  sp, 2
  9484                                  
  9485                                  ;-1056     if(c=='W')prs("word " );
  9486                                  
  9487                                  .funclisting500:
  9488 0000409C 8A46FC                   mov al, [bp-4]
  9489 0000409F 3C57                     cmp al, 87
  9490 000040A1 0F850900                 jne .funclisting501
  9491 000040A5 68[0341]                 push funclisting_4
  9492 000040A8 E89FC4                   call prs
  9493 000040AB 83C402                   add  sp, 2
  9494                                  
  9495                                  ;-1057     if(c=='D')prs("dwrd " );
  9496                                  
  9497                                  .funclisting501:
  9498 000040AE 8A46FC                   mov al, [bp-4]
  9499 000040B1 3C44                     cmp al, 68
  9500 000040B3 0F850900                 jne .funclisting502
  9501 000040B7 68[0941]                 push funclisting_5
  9502 000040BA E88DC4                   call prs
  9503 000040BD 83C402                   add  sp, 2
  9504                                  
  9505                                  ;-1058     prc(32); prc(32);
  9506                                  
  9507                                  .funclisting502:
  9508 000040C0 6A20                     push 32
  9509 000040C2 E81EC4                   call prc
  9510 000040C5 83C402                   add  sp, 2
  9511 000040C8 6A20                     push 32
  9512 000040CA E816C4                   call prc
  9513 000040CD 83C402                   add  sp, 2
  9514                                  
  9515                                  ;-1059     pt=adrF(FNameField, i);
  9516                                  
  9517 000040D0 FF7604                   push word [bp+4]
  9518 000040D3 8D06DFA5                 lea  ax, [FNameField]
  9519 000040D7 50                       push ax
  9520 000040D8 E859CB                   call adrF
  9521 000040DB 83C404                   add  sp, 4
  9522 000040DE A3[6C00]                 mov word [pt], ax
  9523                                  
  9524                                  ;-1060     prs(pt);
  9525                                  
  9526 000040E1 FF36[6C00]               push word [pt]
  9527 000040E5 E862C4                   call prs
  9528 000040E8 83C402                   add  sp, 2
  9529                                  
  9530                                  ;-1061 }
  9531                                  
  9532                                  
  9533                                  ;-1062 
  9534                                  
  9535                                  
  9536                                  ;-1063 int listvar(unsigned int i) {
  9537 000040EB C9                       LEAVE
  9538 000040EC C3                       ret
  9539 000040ED 5C6E3B00                funclisting_0 db "\n;",0
  9540 000040F1 204E554C4C00            funclisting_1 db " NULL",0
  9541 000040F7 766F69642000            funclisting_2 db "void ",0
  9542 000040FD 627974652000            funclisting_3 db "byte ",0
  9543 00004103 776F72642000            funclisting_4 db "word ",0
  9544 00004109 647772642000            funclisting_5 db "dwrd ",0
  9545                                  ENDP
  9546                                  
  9547                                  listvar: PROC
  9548                                  
  9549                                  ;-1064     unsigned int j; char c;
  9550                                  
  9551                                  
  9552                                  ;-1065     prs("\n;"); printint51(i); prc(32);
  9553                                  
  9554                                  ;Function : listvar, Number of local variables: 3
  9555                                  ;   # type sign width addr used name   list of local variables
  9556                                  ;  200 var unsg word  1063 NULL i = bp+4
  9557                                  ;  201 var unsg word  1064 NULL j = bp-2
  9558                                  ;  202 var sign byte  1064 NULL c = bp-4;
  9559 0000410F C8040000                 ENTER  4,0
  9560 00004113 68[FB42]                 push listvar_0
  9561 00004116 E831C4                   call prs
  9562 00004119 83C402                   add  sp, 2
  9563 0000411C FF7604                   push word [bp+4]
  9564 0000411F E8C1C5                   call printint51
  9565 00004122 83C402                   add  sp, 2
  9566 00004125 6A20                     push 32
  9567 00004127 E8B9C3                   call prc
  9568 0000412A 83C402                   add  sp, 2
  9569                                  
  9570                                  ;-1066     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9571                                  
  9572 0000412D 8B5E04                   mov bx, [bp+4]
  9573 00004130 8A87476B                 mov al, [GType + bx]
  9574 00004134 8846FC                   mov [bp-4], al
  9575 00004137 8A46FC                   mov al, [bp-4]
  9576 0000413A 3C56                     cmp al, 86
  9577 0000413C 0F850900                 jne .listvar503
  9578 00004140 68[FF42]                 push listvar_1
  9579 00004143 E804C4                   call prs
  9580 00004146 83C402                   add  sp, 2
  9581                                  .listvar503:
  9582 00004149 8A46FC                   mov al, [bp-4]
  9583 0000414C 3C2A                     cmp al, 42
  9584 0000414E 0F850900                 jne .listvar504
  9585 00004152 68[0443]                 push listvar_2
  9586 00004155 E8F2C3                   call prs
  9587 00004158 83C402                   add  sp, 2
  9588                                  
  9589                                  ;-1067                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9590                                  
  9591                                  .listvar504:
  9592 0000415B 8A46FC                   mov al, [bp-4]
  9593 0000415E 3C26                     cmp al, 38
  9594 00004160 0F850900                 jne .listvar505
  9595 00004164 68[0943]                 push listvar_3
  9596 00004167 E8E0C3                   call prs
  9597 0000416A 83C402                   add  sp, 2
  9598                                  .listvar505:
  9599 0000416D 8A46FC                   mov al, [bp-4]
  9600 00004170 3C23                     cmp al, 35
  9601 00004172 0F850900                 jne .listvar506
  9602 00004176 68[0E43]                 push listvar_4
  9603 00004179 E8CEC3                   call prs
  9604 0000417C 83C402                   add  sp, 2
  9605                                  
  9606                                  ;-1068     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9607                                  
  9608                                  .listvar506:
  9609 0000417F 8B5E04                   mov bx, [bp+4]
  9610 00004182 8A87736C                 mov al, [GSign + bx]
  9611 00004186 8846FC                   mov [bp-4], al
  9612 00004189 8A46FC                   mov al, [bp-4]
  9613 0000418C 3C53                     cmp al, 83
  9614 0000418E 0F850900                 jne .listvar507
  9615 00004192 68[1343]                 push listvar_5
  9616 00004195 E8B2C3                   call prs
  9617 00004198 83C402                   add  sp, 2
  9618                                  .listvar507:
  9619 0000419B 8A46FC                   mov al, [bp-4]
  9620 0000419E 3C55                     cmp al, 85
  9621 000041A0 0F850900                 jne .listvar508
  9622 000041A4 68[1943]                 push listvar_6
  9623 000041A7 E8A0C3                   call prs
  9624 000041AA 83C402                   add  sp, 2
  9625                                  
  9626                                  ;-1069     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9627                                  
  9628                                  .listvar508:
  9629 000041AD 8B5E04                   mov bx, [bp+4]
  9630 000041B0 8A879F6D                 mov al, [GWidth + bx]
  9631 000041B4 8846FC                   mov [bp-4], al
  9632 000041B7 8A46FC                   mov al, [bp-4]
  9633 000041BA 3C01                     cmp al, 1
  9634 000041BC 0F850900                 jne .listvar509
  9635 000041C0 68[1F43]                 push listvar_7
  9636 000041C3 E884C3                   call prs
  9637 000041C6 83C402                   add  sp, 2
  9638                                  .listvar509:
  9639 000041C9 8A46FC                   mov al, [bp-4]
  9640 000041CC 3C02                     cmp al, 2
  9641 000041CE 0F850900                 jne .listvar510
  9642 000041D2 68[2543]                 push listvar_8
  9643 000041D5 E872C3                   call prs
  9644 000041D8 83C402                   add  sp, 2
  9645                                  
  9646                                  ;-1070                  if(c==  4)prs("dwrd " );
  9647                                  
  9648                                  .listvar510:
  9649 000041DB 8A46FC                   mov al, [bp-4]
  9650 000041DE 3C04                     cmp al, 4
  9651 000041E0 0F850900                 jne .listvar511
  9652 000041E4 68[2B43]                 push listvar_9
  9653 000041E7 E860C3                   call prs
  9654 000041EA 83C402                   add  sp, 2
  9655                                  
  9656                                  ;-1071     j=GAdr[i]; printint51(j);
  9657                                  
  9658                                  .listvar511:
  9659 000041ED 8B5E04                   mov bx, [bp+4]
  9660 000041F0 D1E3                     shl bx, 1
  9661 000041F2 8B87CB6E                 mov ax, [GAdr + bx]
  9662 000041F6 8946FE                   mov [bp-2], ax
  9663 000041F9 FF76FE                   push word [bp-2]
  9664 000041FC E8E4C4                   call printint51
  9665 000041FF 83C402                   add  sp, 2
  9666                                  
  9667                                  ;-1072     j=GUsed[i];
  9668                                  
  9669 00004202 8B5E04                   mov bx, [bp+4]
  9670 00004205 D1E3                     shl bx, 1
  9671 00004207 8B872371                 mov ax, [GUsed + bx]
  9672 0000420B 8946FE                   mov [bp-2], ax
  9673                                  
  9674                                  ;-1073     if (j) printint51(j);
  9675                                  
  9676 0000420E 8B46FE                   mov ax, [bp-2]
  9677 00004211 08C0                     or  al, al
  9678 00004213 0F840C00                 je .listvar512
  9679 00004217 FF76FE                   push word [bp-2]
  9680 0000421A E8C6C4                   call printint51
  9681 0000421D 83C402                   add  sp, 2
  9682                                  
  9683                                  ;-1074     else {
  9684                                  
  9685 00004220 E92200                   jmp .listvar513
  9686                                  .listvar512:
  9687                                  
  9688                                  ;-1075         if(GType[i]=='#') prs("    -");
  9689                                  
  9690 00004223 8B5E04                   mov bx, [bp+4]
  9691 00004226 8A87476B                 mov al, [GType + bx]
  9692 0000422A 3C23                     cmp al, 35
  9693 0000422C 0F850C00                 jne .listvar514
  9694 00004230 68[3143]                 push listvar_10
  9695 00004233 E814C3                   call prs
  9696 00004236 83C402                   add  sp, 2
  9697                                  
  9698                                  ;-1076         else prs(" NULL");
  9699                                  
  9700 00004239 E90900                   jmp .listvar515
  9701                                  .listvar514:
  9702 0000423C 68[3743]                 push listvar_11
  9703 0000423F E808C3                   call prs
  9704 00004242 83C402                   add  sp, 2
  9705                                  
  9706                                  ;-1077          }
  9707                                  
  9708                                  .listvar515:
  9709                                  
  9710                                  ;-1078     prc(32);
  9711                                  
  9712                                  .listvar513:
  9713 00004245 6A20                     push 32
  9714 00004247 E899C2                   call prc
  9715 0000424A 83C402                   add  sp, 2
  9716                                  
  9717                                  ;-1079     pt=adrofname(i); prs(pt);
  9718                                  
  9719 0000424D FF7604                   push word [bp+4]
  9720 00004250 E8CDC9                   call adrofname
  9721 00004253 83C402                   add  sp, 2
  9722 00004256 A3[6C00]                 mov word [pt], ax
  9723 00004259 FF36[6C00]               push word [pt]
  9724 0000425D E8EAC2                   call prs
  9725 00004260 83C402                   add  sp, 2
  9726                                  
  9727                                  ;-1080     if(GType[i]=='#') {
  9728                                  
  9729 00004263 8B5E04                   mov bx, [bp+4]
  9730 00004266 8A87476B                 mov al, [GType + bx]
  9731 0000426A 3C23                     cmp al, 35
  9732 0000426C 0F851D00                 jne .listvar516
  9733                                  
  9734                                  ;-1081         prc('=');
  9735                                  
  9736 00004270 6A3D                     push 61
  9737 00004272 E86EC2                   call prc
  9738 00004275 83C402                   add  sp, 2
  9739                                  
  9740                                  ;-1082         j=GData[i];
  9741                                  
  9742 00004278 8B5E04                   mov bx, [bp+4]
  9743 0000427B D1E3                     shl bx, 1
  9744 0000427D 8B877B73                 mov ax, [GData + bx]
  9745 00004281 8946FE                   mov [bp-2], ax
  9746                                  
  9747                                  ;-1083         prunsign1(j);
  9748                                  
  9749 00004284 FF76FE                   push word [bp-2]
  9750 00004287 E815C4                   call prunsign1
  9751 0000428A 83C402                   add  sp, 2
  9752                                  
  9753                                  ;-1084         }
  9754                                  
  9755                                  
  9756                                  ;-1085     if(GType[i]=='&') {
  9757                                  
  9758                                  .listvar516:
  9759 0000428D 8B5E04                   mov bx, [bp+4]
  9760 00004290 8A87476B                 mov al, [GType + bx]
  9761 00004294 3C26                     cmp al, 38
  9762 00004296 0F852500                 jne .listvar517
  9763                                  
  9764                                  ;-1086         prc('[');
  9765                                  
  9766 0000429A 6A5B                     push 91
  9767 0000429C E844C2                   call prc
  9768 0000429F 83C402                   add  sp, 2
  9769                                  
  9770                                  ;-1087         j=GData[i];
  9771                                  
  9772 000042A2 8B5E04                   mov bx, [bp+4]
  9773 000042A5 D1E3                     shl bx, 1
  9774 000042A7 8B877B73                 mov ax, [GData + bx]
  9775 000042AB 8946FE                   mov [bp-2], ax
  9776                                  
  9777                                  ;-1088         prunsign1(j);
  9778                                  
  9779 000042AE FF76FE                   push word [bp-2]
  9780 000042B1 E8EBC3                   call prunsign1
  9781 000042B4 83C402                   add  sp, 2
  9782                                  
  9783                                  ;-1089         prc(']');
  9784                                  
  9785 000042B7 6A5D                     push 93
  9786 000042B9 E827C2                   call prc
  9787 000042BC 83C402                   add  sp, 2
  9788                                  
  9789                                  ;-1090         }
  9790                                  
  9791                                  
  9792                                  ;-1091     if (i >= LSTART) {
  9793                                  
  9794                                  .listvar517:
  9795 000042BF 8B4604                   mov ax, [bp+4]
  9796 000042C2 3DC800                   cmp ax, 200 ;unsigned : 0
  9797 000042C5 0F823000                 jb  .listvar518
  9798                                  
  9799                                  ;-1092         prs(" = bp");
  9800                                  
  9801 000042C9 68[3D43]                 push listvar_12
  9802 000042CC E87BC2                   call prs
  9803 000042CF 83C402                   add  sp, 2
  9804                                  
  9805                                  ;-1093         j=GData[i];
  9806                                  
  9807 000042D2 8B5E04                   mov bx, [bp+4]
  9808 000042D5 D1E3                     shl bx, 1
  9809 000042D7 8B877B73                 mov ax, [GData + bx]
  9810 000042DB 8946FE                   mov [bp-2], ax
  9811                                  
  9812                                  ;-1094         if (j > 0) prc('+');
  9813                                  
  9814 000042DE 8B46FE                   mov ax, [bp-2]
  9815 000042E1 83F800                   cmp ax, 0
  9816 000042E4 0F8E0800                 jle .listvar519
  9817 000042E8 6A2B                     push 43
  9818 000042EA E8F6C1                   call prc
  9819 000042ED 83C402                   add  sp, 2
  9820                                  
  9821                                  ;-1095         pint1(j);
  9822                                  
  9823                                  .listvar519:
  9824 000042F0 FF76FE                   push word [bp-2]
  9825 000042F3 E84BC3                   call pint1
  9826 000042F6 83C402                   add  sp, 2
  9827                                  
  9828                                  ;-1096     }
  9829                                  
  9830                                  
  9831                                  ;-1097 }
  9832                                  
  9833                                  .listvar518:
  9834                                  
  9835                                  ;-1098 
  9836                                  
  9837                                  
  9838                                  ;-1099 unsigned int MAXUI=65535;
  9839 000042F9 C9                       LEAVE
  9840 000042FA C3                       ret
  9841 000042FB 5C6E3B00                listvar_0 db "\n;",0
  9842 000042FF 7661722000              listvar_1 db "var ",0
  9843 00004304 7074722000              listvar_2 db "ptr ",0
  9844 00004309 6172722000              listvar_3 db "arr ",0
  9845 0000430E 6465662000              listvar_4 db "def ",0
  9846 00004313 7369676E2000            listvar_5 db "sign ",0
  9847 00004319 756E73672000            listvar_6 db "unsg ",0
  9848 0000431F 627974652000            listvar_7 db "byte ",0
  9849 00004325 776F72642000            listvar_8 db "word ",0
  9850 0000432B 647772642000            listvar_9 db "dwrd ",0
  9851 00004331 202020202D00            listvar_10 db "    -",0
  9852 00004337 204E554C4C00            listvar_11 db " NULL",0
  9853 0000433D 203D20627000            listvar_12 db " = bp",0
  9854                                  ENDP
  9855 00004343 FFFF                    MAXUI dw 65535
  9856                                  
  9857                                  ;-1100 int epilog() {
  9858                                  
  9859                                  
  9860                                  epilog: PROC
  9861                                  
  9862                                  ;-1101     unsigned int i;
  9863                                  
  9864                                  
  9865                                  ;-1102     prs("\n \n;   # type sign width  adr used name");
  9866                                  
  9867                                  ;Function : epilog, Number of local variables: 1
  9868                                  ;   # type sign width addr used name   list of local variables
  9869                                  ;  200 var unsg word  1101 NULL i = bp-2;
  9870 00004345 C8020000                 ENTER  2,0
  9871 00004349 68[D644]                 push epilog_0
  9872 0000434C E8FBC1                   call prs
  9873 0000434F 83C402                   add  sp, 2
  9874                                  
  9875                                  ;-1103     prs("   list of global variables\n");
  9876                                  
  9877 00004352 68[0045]                 push epilog_1
  9878 00004355 E8F2C1                   call prs
  9879 00004358 83C402                   add  sp, 2
  9880                                  
  9881                                  ;-1104     i=1;
  9882                                  
  9883 0000435B B80100                   mov ax, 1
  9884 0000435E 8946FE                   mov [bp-2], ax
  9885                                  
  9886                                  ;-1105     while (i< GTop) {
  9887                                  
  9888                                  .epilog520:
  9889 00004361 8B46FE                   mov ax, [bp-2]
  9890 00004364 3B06[2C00]               cmp ax, [GTop]
  9891 00004368 0F8D0E00                 jge .epilog521
  9892                                  
  9893                                  ;-1106         listvar(i);
  9894                                  
  9895 0000436C FF76FE                   push word [bp-2]
  9896 0000436F E89DFD                   call listvar
  9897 00004372 83C402                   add  sp, 2
  9898                                  
  9899                                  ;-1107         i++;
  9900                                  
  9901 00004375 FF46FE                   inc  word[bp-2]
  9902                                  
  9903                                  ;-1108         }
  9904                                  
  9905                                  
  9906                                  ;-1109     listfunc();
  9907                                  
  9908 00004378 EBE7                     jmp .epilog520
  9909                                  .epilog521:
  9910 0000437A E80EFC                   call listfunc
  9911                                  
  9912                                  ;-1110     listcall();
  9913                                  
  9914 0000437D E8C1FA                   call listcall
  9915                                  
  9916                                  ;-1111     prs("\n;Input: "); prs(&namein);
  9917                                  
  9918 00004380 68[1E45]                 push epilog_2
  9919 00004383 E8C4C1                   call prs
  9920 00004386 83C402                   add  sp, 2
  9921 00004389 8D067E6A                 lea  ax, [namein]
  9922 0000438D 50                       push ax
  9923 0000438E E8B9C1                   call prs
  9924 00004391 83C402                   add  sp, 2
  9925                                  
  9926                                  ;-1112     prs(", List: ");   prs(&namelst);
  9927                                  
  9928 00004394 68[2945]                 push epilog_3
  9929 00004397 E8B0C1                   call prs
  9930 0000439A 83C402                   add  sp, 2
  9931 0000439D 8D06C16A                 lea  ax, [namelst]
  9932 000043A1 50                       push ax
  9933 000043A2 E8A5C1                   call prs
  9934 000043A5 83C402                   add  sp, 2
  9935                                  
  9936                                  ;-1113     prs(",  Lines:"); printint51(lineno);
  9937                                  
  9938 000043A8 68[3245]                 push epilog_4
  9939 000043AB E89CC1                   call prs
  9940 000043AE 83C402                   add  sp, 2
  9941 000043B1 FF36[6800]               push word [lineno]
  9942 000043B5 E82BC3                   call printint51
  9943 000043B8 83C402                   add  sp, 2
  9944                                  
  9945                                  ;-1114     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  9946                                  
  9947 000043BB 68[3C45]                 push epilog_5
  9948 000043BE E889C1                   call prs
  9949 000043C1 83C402                   add  sp, 2
  9950 000043C4 FF0E[2C00]               dec  word[GTop]
  9951 000043C8 FF36[2C00]               push word [GTop]
  9952 000043CC E814C3                   call printint51
  9953 000043CF 83C402                   add  sp, 2
  9954                                  
  9955                                  ;-1115     prs(" max.:"); printint51(LSTART);
  9956                                  
  9957 000043D2 68[5045]                 push epilog_6
  9958 000043D5 E872C1                   call prs
  9959 000043D8 83C402                   add  sp, 2
  9960 000043DB 68C800                   push 200
  9961 000043DE E802C3                   call printint51
  9962 000043E1 83C402                   add  sp, 2
  9963                                  
  9964                                  ;-1116     prs("\n;Functions      :"); printint51(FTop);
  9965                                  
  9966 000043E4 68[5745]                 push epilog_7
  9967 000043E7 E860C1                   call prs
  9968 000043EA 83C402                   add  sp, 2
  9969 000043ED FF36[3D00]               push word [FTop]
  9970 000043F1 E8EFC2                   call printint51
  9971 000043F4 83C402                   add  sp, 2
  9972                                  
  9973                                  ;-1117     prs(" max.:"); printint51(FUNCMAX);
  9974                                  
  9975 000043F7 68[6B45]                 push epilog_8
  9976 000043FA E84DC1                   call prs
  9977 000043FD 83C402                   add  sp, 2
  9978 00004400 682C01                   push 300
  9979 00004403 E8DDC2                   call printint51
  9980 00004406 83C402                   add  sp, 2
  9981                                  
  9982                                  ;-1118     prs("\n;Calls          :"); printint51(CTop);
  9983                                  
  9984 00004409 68[7245]                 push epilog_9
  9985 0000440C E83BC1                   call prs
  9986 0000440F 83C402                   add  sp, 2
  9987 00004412 FF36[3F00]               push word [CTop]
  9988 00004416 E8CAC2                   call printint51
  9989 00004419 83C402                   add  sp, 2
  9990                                  
  9991                                  ;-1119     prs(" max.:"); printint51(CALLMAX);
  9992                                  
  9993 0000441C 68[8645]                 push epilog_10
  9994 0000441F E828C1                   call prs
  9995 00004422 83C402                   add  sp, 2
  9996 00004425 68D007                   push 2000
  9997 00004428 E8B8C2                   call printint51
  9998 0000442B 83C402                   add  sp, 2
  9999                                  
 10000                                  ;-1120     prs(", NameField:"); printint51(CNameTop);
 10001                                  
 10002 0000442E 68[8D45]                 push epilog_11
 10003 00004431 E816C1                   call prs
 10004 00004434 83C402                   add  sp, 2
 10005 00004437 FF36[6200]               push word [CNameTop]
 10006 0000443B E8A5C2                   call printint51
 10007 0000443E 83C402                   add  sp, 2
 10008                                  
 10009                                  ;-1121 //    prs(" max.:");
 10010                                  
 10011                                  
 10012                                  ;-1122     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10013                                  
 10014 00004441 68[9A45]                 push epilog_12
 10015 00004444 E803C1                   call prs
 10016 00004447 83C402                   add  sp, 2
 10017 0000444A 8D067869                 lea  ax, [coname]
 10018 0000444E 50                       push ax
 10019 0000444F E8F8C0                   call prs
 10020 00004452 83C402                   add  sp, 2
 10021 00004455 68[A845]                 push epilog_13
 10022 00004458 E8EFC0                   call prs
 10023 0000445B 83C402                   add  sp, 2
 10024 0000445E FF36[1400]               push word [maxco]
 10025 00004462 E87EC2                   call printint51
 10026 00004465 83C402                   add  sp, 2
 10027                                  
 10028                                  ;-1123     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;
 10029                                  
 10030 00004468 68[AC45]                 push epilog_14
 10031 0000446B E8DCC0                   call prs
 10032 0000446E 83C402                   add  sp, 2
 10033 00004471 68D007                   push 2000
 10034 00004474 E86CC2                   call printint51
 10035 00004477 83C402                   add  sp, 2
 10036 0000447A B8D007                   mov ax, 2000
 10037 0000447D 8946FE                   mov [bp-2], ax
 10038 00004480 8B46FE                   mov ax, [bp-2]
 10039 00004483 2B06[1400]               sub ax, [maxco]
 10040 00004487 8946FE                   mov [bp-2], ax
 10041                                  
 10042                                  ;-1124     if (i <= 1000)prs(" *** Warning *** constant area too small");
 10043                                  
 10044 0000448A 8B46FE                   mov ax, [bp-2]
 10045 0000448D 3DE803                   cmp ax, 1000
 10046 00004490 0F870900                 ja  .epilog522
 10047 00004494 68[B345]                 push epilog_15
 10048 00004497 E8B0C0                   call prs
 10049 0000449A 83C402                   add  sp, 2
 10050                                  
 10051                                  ;-1125     prs(", stacksize: ");
 10052                                  
 10053                                  .epilog522:
 10054 0000449D 68[DC45]                 push epilog_16
 10055 000044A0 E8A7C0                   call prs
 10056 000044A3 83C402                   add  sp, 2
 10057                                  
 10058                                  ;-1126     i=MAXUI-orgData; printint51(i);
 10059                                  
 10060 000044A6 A1[4343]                 mov ax, [MAXUI]
 10061 000044A9 2B06[1200]               sub ax, [orgData]
 10062 000044AD 8946FE                   mov [bp-2], ax
 10063 000044B0 FF76FE                   push word [bp-2]
 10064 000044B3 E82DC2                   call printint51
 10065 000044B6 83C402                   add  sp, 2
 10066                                  
 10067                                  ;-1127     if (i <= 1000) prs(" *** Warning *** Stack too small");
 10068                                  
 10069 000044B9 8B46FE                   mov ax, [bp-2]
 10070 000044BC 3DE803                   cmp ax, 1000
 10071 000044BF 0F870900                 ja  .epilog523
 10072 000044C3 68[EA45]                 push epilog_17
 10073 000044C6 E881C0                   call prs
 10074 000044C9 83C402                   add  sp, 2
 10075                                  
 10076                                  ;-1128   end1(0);}
 10077                                  
 10078                                  .epilog523:
 10079 000044CC 6A00                     push 0
 10080 000044CE E8ACF7                   call end1
 10081 000044D1 83C402                   add  sp, 2
 10082                                  
 10083                                  ;-1129 
 10084                                  
 10085                                  
 10086                                  ;-1130 int checkcalls() {
 10087 000044D4 C9                       LEAVE
 10088 000044D5 C3                       ret
 10089 000044D6 5C6E205C6E3B202020-     epilog_0 db "\n \n;   # type sign width  adr used name",0
 10090 000044DF 232074797065207369-
 10091 000044E8 676E20776964746820-
 10092 000044F1 206164722075736564-
 10093 000044FA 206E616D6500       
 10094 00004500 2020206C697374206F-     epilog_1 db "   list of global variables\n",0
 10095 00004509 6620676C6F62616C20-
 10096 00004512 7661726961626C6573-
 10097 0000451B 5C6E00             
 10098 0000451E 5C6E3B496E7075743A-     epilog_2 db "\n;Input: ",0
 10099 00004527 2000               
 10100 00004529 2C204C6973743A2000      epilog_3 db ", List: ",0
 10101 00004532 2C20204C696E65733A-     epilog_4 db ",  Lines:",0
 10102 0000453B 00                 
 10103 0000453C 5C6E3B476C6F622E20-     epilog_5 db "\n;Glob. variables:",0
 10104 00004545 7661726961626C6573-
 10105 0000454E 3A00               
 10106 00004550 206D61782E3A00          epilog_6 db " max.:",0
 10107 00004557 5C6E3B46756E637469-     epilog_7 db "\n;Functions      :",0
 10108 00004560 6F6E73202020202020-
 10109 00004569 3A00               
 10110 0000456B 206D61782E3A00          epilog_8 db " max.:",0
 10111 00004572 5C6E3B43616C6C7320-     epilog_9 db "\n;Calls          :",0
 10112 0000457B 202020202020202020-
 10113 00004584 3A00               
 10114 00004586 206D61782E3A00          epilog_10 db " max.:",0
 10115 0000458D 2C204E616D65466965-     epilog_11 db ", NameField:",0
 10116 00004596 6C643A00           
 10117 0000459A 5C6E3B436F6E737420-     epilog_12 db "\n;Const in '",0
 10118 000045A3 696E202700         
 10119 000045A8 27203A00                epilog_13 db "' :",0
 10120 000045AC 206D61782E3A00          epilog_14 db " max.:",0
 10121 000045B3 202A2A2A205761726E-     epilog_15 db " *** Warning *** constant area too small",0
 10122 000045BC 696E67202A2A2A2063-
 10123 000045C5 6F6E7374616E742061-
 10124 000045CE 72656120746F6F2073-
 10125 000045D7 6D616C6C00         
 10126 000045DC 2C20737461636B7369-     epilog_16 db ", stacksize: ",0
 10127 000045E5 7A653A2000         
 10128 000045EA 202A2A2A205761726E-     epilog_17 db " *** Warning *** Stack too small",0
 10129 000045F3 696E67202A2A2A2053-
 10130 000045FC 7461636B20746F6F20-
 10131 00004605 736D616C6C00       
 10132                                  ENDP
 10133                                  
 10134                                  checkcalls: PROC
 10135                                  
 10136                                  ;-1131     int i; int j; int k;
 10137                                  
 10138                                  
 10139                                  ;-1132     prs("\n \n; missing functions: ");
 10140                                  
 10141                                  ;Function : checkcalls, Number of local variables: 3
 10142                                  ;   # type sign width addr used name   list of local variables
 10143                                  ;  200 var sign word  1131 NULL i = bp-2
 10144                                  ;  201 var sign word  1131 NULL j = bp-4
 10145                                  ;  202 var sign word  1131 NULL k = bp-6;
 10146 0000460B C8060000                 ENTER  6,0
 10147 0000460F 68[F146]                 push checkcalls_0
 10148 00004612 E835BF                   call prs
 10149 00004615 83C402                   add  sp, 2
 10150                                  
 10151                                  ;-1133     i=0;  k=0;
 10152                                  
 10153 00004618 B80000                   mov ax, 0
 10154 0000461B 8946FE                   mov [bp-2], ax
 10155 0000461E B80000                   mov ax, 0
 10156 00004621 8946FA                   mov [bp-6], ax
 10157                                  
 10158                                  ;-1134     while (i < CTop) {
 10159                                  
 10160                                  .checkcalls524:
 10161 00004624 8B46FE                   mov ax, [bp-2]
 10162 00004627 3B06[3F00]               cmp ax, [CTop]
 10163 0000462B 0F8D8F00                 jge .checkcalls525
 10164                                  
 10165                                  ;-1135         pt=CAdr[i];
 10166                                  
 10167 0000462F 8B5EFE                   mov bx, [bp-2]
 10168 00004632 D1E3                     shl bx, 1
 10169 00004634 8B87E793                 mov ax, [CAdr + bx]
 10170 00004638 A3[6C00]                 mov word [pt], ax
 10171                                  
 10172                                  ;-1136         from_far(NameA, pt);
 10173                                  
 10174 0000463B FF36[6C00]               push word [pt]
 10175 0000463F 8D06[4100]               lea  ax, [NameA]
 10176 00004643 50                       push ax
 10177 00004644 E8AA05                   call from_far
 10178 00004647 83C404                   add  sp, 4
 10179                                  
 10180                                  ;-1137         j=0;
 10181                                  
 10182 0000464A B80000                   mov ax, 0
 10183 0000464D 8946FC                   mov [bp-4], ax
 10184                                  
 10185                                  ;-1138         do {
 10186                                  
 10187                                  .checkcalls526:
 10188                                  
 10189                                  ;-1139             p1=adrF(FNameField, j);
 10190                                  
 10191 00004650 FF76FC                   push word [bp-4]
 10192 00004653 8D06DFA5                 lea  ax, [FNameField]
 10193 00004657 50                       push ax
 10194 00004658 E8D9C5                   call adrF
 10195 0000465B 83C404                   add  sp, 4
 10196 0000465E A3[6E00]                 mov word [p1], ax
 10197                                  
 10198                                  ;-1140             if (eqstr(NameA, p1)){
 10199                                  
 10200 00004661 FF36[6E00]               push word [p1]
 10201 00004665 8D06[4100]               lea  ax, [NameA]
 10202 00004669 50                       push ax
 10203 0000466A E816BC                   call eqstr
 10204 0000466D 83C404                   add  sp, 4
 10205 00004670 08C0                     or  al, al
 10206 00004672 0F841000                 je .checkcalls527
 10207                                  
 10208                                  ;-1141                 CType[i]=1;
 10209                                  
 10210 00004676 B80100                   mov ax, 1
 10211 00004679 8B5EFE                   mov bx, [bp-2]
 10212 0000467C 8887BF89                 mov [CType+bx], al
 10213                                  
 10214                                  ;-1142                 j=FTop;
 10215                                  
 10216 00004680 A1[3D00]                 mov ax, [FTop]
 10217 00004683 8946FC                   mov [bp-4], ax
 10218                                  
 10219                                  ;-1143                 }
 10220                                  
 10221                                  
 10222                                  ;-1144             j++;
 10223                                  
 10224                                  .checkcalls527:
 10225 00004686 FF46FC                   inc  word[bp-4]
 10226                                  
 10227                                  ;-1145             } while (j < FTop);
 10228                                  
 10229 00004689 8B46FC                   mov ax, [bp-4]
 10230 0000468C 3B06[3D00]               cmp ax, [FTop]
 10231 00004690 0F8D0200                 jge .checkcalls528
 10232 00004694 EBBA                     jmp .checkcalls526
 10233                                  .checkcalls528:
 10234                                  
 10235                                  ;-1146         if (j == FTop) {
 10236                                  
 10237 00004696 8B46FC                   mov ax, [bp-4]
 10238 00004699 3B06[3D00]               cmp ax, [FTop]
 10239 0000469D 0F851700                 jne .checkcalls529
 10240                                  
 10241                                  ;-1147             k++; prs("\n; ");
 10242                                  
 10243 000046A1 FF46FA                   inc  word[bp-6]
 10244 000046A4 68[0C47]                 push checkcalls_1
 10245 000046A7 E8A0BE                   call prs
 10246 000046AA 83C402                   add  sp, 2
 10247                                  
 10248                                  ;-1148             prs(NameA);
 10249                                  
 10250 000046AD 8D06[4100]               lea  ax, [NameA]
 10251 000046B1 50                       push ax
 10252 000046B2 E895BE                   call prs
 10253 000046B5 83C402                   add  sp, 2
 10254                                  
 10255                                  ;-1149         }
 10256                                  
 10257                                  
 10258                                  ;-1150         i++;
 10259                                  
 10260                                  .checkcalls529:
 10261 000046B8 FF46FE                   inc  word[bp-2]
 10262                                  
 10263                                  ;-1151     }
 10264                                  
 10265                                  
 10266                                  ;-1152     prs("\n; Number of unresolved CALLs :"); printint51(k);
 10267                                  
 10268 000046BB E966FF                   jmp .checkcalls524
 10269                                  .checkcalls525:
 10270 000046BE 68[1147]                 push checkcalls_2
 10271 000046C1 E886BE                   call prs
 10272 000046C4 83C402                   add  sp, 2
 10273 000046C7 FF76FA                   push word [bp-6]
 10274 000046CA E816C0                   call printint51
 10275 000046CD 83C402                   add  sp, 2
 10276                                  
 10277                                  ;-1153     if (k!=0) error1("At least 1 function is missing! ");
 10278                                  
 10279 000046D0 8B46FA                   mov ax, [bp-6]
 10280 000046D3 83F800                   cmp ax, 0
 10281 000046D6 0F840C00                 je  .checkcalls530
 10282 000046DA 68[3247]                 push checkcalls_3
 10283 000046DD E8C0F5                   call error1
 10284 000046E0 83C402                   add  sp, 2
 10285                                  
 10286                                  ;-1154     else prs(" All FUNCTIONs in place");
 10287                                  
 10288 000046E3 E90900                   jmp .checkcalls531
 10289                                  .checkcalls530:
 10290 000046E6 68[5347]                 push checkcalls_4
 10291 000046E9 E85EBE                   call prs
 10292 000046EC 83C402                   add  sp, 2
 10293                                  
 10294                                  ;-1155 }
 10295                                  
 10296                                  .checkcalls531:
 10297                                  
 10298                                  ;-1156 
 10299                                  
 10300                                  
 10301                                  ;-1157 int dodefine() {
 10302 000046EF C9                       LEAVE
 10303 000046F0 C3                       ret
 10304 000046F1 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
 10305 000046FA 7373696E672066756E-
 10306 00004703 6374696F6E733A2000 
 10307 0000470C 5C6E3B2000              checkcalls_1 db "\n; ",0
 10308 00004711 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
 10309 0000471A 72206F6620756E7265-
 10310 00004723 736F6C766564204341-
 10311 0000472C 4C4C73203A00       
 10312 00004732 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
 10313 0000473B 312066756E6374696F-
 10314 00004744 6E206973206D697373-
 10315 0000474D 696E67212000       
 10316 00004753 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
 10317 0000475C 54494F4E7320696E20-
 10318 00004765 706C61636500       
 10319                                  ENDP
 10320                                  
 10321                                  dodefine: PROC
 10322                                  
 10323                                  ;-1158     int i; int j; int fdtemp;
 10324                                  
 10325                                  
 10326                                  ;-1159     if (eqstr(symbol, "ORGDATA")) {
 10327                                  
 10328                                  ;Function : dodefine, Number of local variables: 3
 10329                                  ;   # type sign width addr used name   list of local variables
 10330                                  ;  200 var sign word  1158 NULL i = bp-2
 10331                                  ;  201 var sign word  1158 NULL j = bp-4
 10332                                  ;  202 var sign word  1158 NULL fdtemp = bp-6;
 10333 0000476B C8060000                 ENTER  6,0
 10334 0000476F 68[5548]                 push dodefine_0
 10335 00004772 8D06BB69                 lea  ax, [symbol]
 10336 00004776 50                       push ax
 10337 00004777 E809BB                   call eqstr
 10338 0000477A 83C404                   add  sp, 4
 10339 0000477D 08C0                     or  al, al
 10340 0000477F 0F841500                 je .dodefine532
 10341                                  
 10342                                  ;-1160         token=getlex();
 10343                                  
 10344 00004783 E8A3EA                   call getlex
 10345 00004786 A3[1E00]                 mov word [token], ax
 10346                                  
 10347                                  ;-1161         ORGDATAORIG=lexval;
 10348                                  
 10349 00004789 A1[3000]                 mov ax, [lexval]
 10350 0000478C A3[1000]                 mov word [ORGDATAORIG], ax
 10351                                  
 10352                                  ;-1162         orgData=lexval;
 10353                                  
 10354 0000478F A1[3000]                 mov ax, [lexval]
 10355 00004792 A3[1200]                 mov word [orgData], ax
 10356                                  
 10357                                  ;-1163         return;
 10358                                  
 10359 00004795 E9BB00                   jmp .retndodefine
 10360                                  
 10361                                  ;-1164     }
 10362                                  
 10363                                  
 10364                                  ;-1165     expect(T_NAME);
 10365                                  
 10366                                  .dodefine532:
 10367 00004798 680001                   push 256
 10368 0000479B E899BC                   call expect
 10369 0000479E 83C402                   add  sp, 2
 10370                                  
 10371                                  ;-1166     if (token==T_CONST) {
 10372                                  
 10373 000047A1 A1[1E00]                 mov ax, [token]
 10374 000047A4 3D0101                   cmp ax, 257
 10375 000047A7 0F85A800                 jne .dodefine533
 10376                                  
 10377                                  ;-1167         if (GTop >= LSTART) error1("global table (define) full");
 10378                                  
 10379 000047AB A1[2C00]                 mov ax, [GTop]
 10380 000047AE 3DC800                   cmp ax, 200 ;unsigned : 1
 10381 000047B1 0F8C0900                 jl  .dodefine534
 10382 000047B5 68[5D48]                 push dodefine_1
 10383 000047B8 E8E5F4                   call error1
 10384 000047BB 83C402                   add  sp, 2
 10385                                  
 10386                                  ;-1168         i=strlen(symbol);
 10387                                  
 10388                                  .dodefine534:
 10389 000047BE 8D06BB69                 lea  ax, [symbol]
 10390 000047C2 50                       push ax
 10391 000047C3 E85FBA                   call strlen
 10392 000047C6 83C402                   add  sp, 2
 10393 000047C9 8946FE                   mov [bp-2], ax
 10394                                  
 10395                                  ;-1169         if (i>15) error1("Define name longer 15 char");
 10396                                  
 10397 000047CC 8B46FE                   mov ax, [bp-2]
 10398 000047CF 83F80F                   cmp ax, 15
 10399 000047D2 0F8E0900                 jle .dodefine535
 10400 000047D6 68[7848]                 push dodefine_2
 10401 000047D9 E8C4F4                   call error1
 10402 000047DC 83C402                   add  sp, 2
 10403                                  
 10404                                  ;-1170         GSign [GTop]='U';
 10405                                  
 10406                                  .dodefine535:
 10407 000047DF B85500                   mov ax, 85
 10408 000047E2 8B1E[2C00]               mov bx, [GTop]
 10409 000047E6 8887736C                 mov [GSign+bx], al
 10410                                  
 10411                                  ;-1171         GWidth[GTop]=1;
 10412                                  
 10413 000047EA B80100                   mov ax, 1
 10414 000047ED 8B1E[2C00]               mov bx, [GTop]
 10415 000047F1 88879F6D                 mov [GWidth+bx], al
 10416                                  
 10417                                  ;-1172         GType [GTop]='#';
 10418                                  
 10419 000047F5 B82300                   mov ax, 35
 10420 000047F8 8B1E[2C00]               mov bx, [GTop]
 10421 000047FC 8887476B                 mov [GType+bx], al
 10422                                  
 10423                                  ;-1173         GAdr [GTop]=lineno-1;
 10424                                  
 10425 00004800 A1[6800]                 mov ax, [lineno]
 10426 00004803 83E801                   sub ax, 1
 10427 00004806 8B1E[2C00]               mov bx, [GTop]
 10428 0000480A D1E3                     shl bx, 1
 10429 0000480C 8987CB6E                 mov [GAdr+bx], ax
 10430                                  
 10431                                  ;-1174         GUsed [GTop]=0;
 10432                                  
 10433 00004810 B80000                   mov ax, 0
 10434 00004813 8B1E[2C00]               mov bx, [GTop]
 10435 00004817 D1E3                     shl bx, 1
 10436 00004819 89872371                 mov [GUsed+bx], ax
 10437                                  
 10438                                  ;-1175         pt=adrofname(GTop);
 10439                                  
 10440 0000481D FF36[2C00]               push word [GTop]
 10441 00004821 E8FCC3                   call adrofname
 10442 00004824 83C402                   add  sp, 2
 10443 00004827 A3[6C00]                 mov word [pt], ax
 10444                                  
 10445                                  ;-1176         strcpy(pt, symbol);
 10446                                  
 10447 0000482A 8D06BB69                 lea  ax, [symbol]
 10448 0000482E 50                       push ax
 10449 0000482F FF36[6C00]               push word [pt]
 10450 00004833 E817BA                   call strcpy
 10451 00004836 83C404                   add  sp, 4
 10452                                  
 10453                                  ;-1177         GData[GTop]=lexval;
 10454                                  
 10455 00004839 A1[3000]                 mov ax, [lexval]
 10456 0000483C 8B1E[2C00]               mov bx, [GTop]
 10457 00004840 D1E3                     shl bx, 1
 10458 00004842 89877B73                 mov [GData+bx], ax
 10459                                  
 10460                                  ;-1178         expect(T_CONST);
 10461                                  
 10462 00004846 680101                   push 257
 10463 00004849 E8EBBB                   call expect
 10464 0000484C 83C402                   add  sp, 2
 10465                                  
 10466                                  ;-1179         GTop++;
 10467                                  
 10468 0000484F FF06[2C00]               inc  word[GTop]
 10469                                  
 10470                                  ;-1180     }
 10471                                  
 10472                                  
 10473                                  ;-1181 }
 10474                                  
 10475                                  .dodefine533:
 10476                                  
 10477                                  ;-1182 
 10478                                  
 10479                                  
 10480                                  ;-1183 int parse() {
 10481                                  
 10482 00004853 C9                       .retndodefine: LEAVE
 10483 00004854 C3                       ret
 10484 00004855 4F52474441544100        dodefine_0 db "ORGDATA",0
 10485 0000485D 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
 10486 00004866 626C65202864656669-
 10487 0000486F 6E65292066756C6C00 
 10488 00004878 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
 10489 00004881 6D65206C6F6E676572-
 10490 0000488A 203135206368617200 
 10491                                  ENDP
 10492                                  
 10493                                  parse: PROC
 10494                                  
 10495                                  ;-1184     token=getlex();
 10496                                  
 10497 00004893 E893E9                   call getlex
 10498 00004896 A3[1E00]                 mov word [token], ax
 10499                                  
 10500                                  ;-1185     do {
 10501                                  
 10502                                  .parse536:
 10503                                  
 10504                                  ;-1186         if (token <= 0) return 1;
 10505                                  
 10506 00004899 A1[1E00]                 mov ax, [token]
 10507 0000489C 83F800                   cmp ax, 0
 10508 0000489F 0F8F0600                 jg  .parse537
 10509 000048A3 B80100                   mov ax, 1
 10510 000048A6 E95000                   jmp .retnparse
 10511                                  
 10512                                  ;-1187         if (istoken('#')) {
 10513                                  
 10514                                  .parse537:
 10515 000048A9 6A23                     push 35
 10516 000048AB E867BB                   call istoken
 10517 000048AE 83C402                   add  sp, 2
 10518 000048B1 08C0                     or  al, al
 10519 000048B3 0F842100                 je .parse538
 10520                                  
 10521                                  ;-1188              if (istoken(T_DEFINE))  dodefine();
 10522                                  
 10523 000048B7 68FF01                   push 511
 10524 000048BA E858BB                   call istoken
 10525 000048BD 83C402                   add  sp, 2
 10526 000048C0 08C0                     or  al, al
 10527 000048C2 0F840600                 je .parse539
 10528 000048C6 E8A2FE                   call dodefine
 10529                                  
 10530                                  ;-1189              else error1("define expected");
 10531                                  
 10532 000048C9 E90900                   jmp .parse540
 10533                                  .parse539:
 10534 000048CC 68[FA48]                 push parse_0
 10535 000048CF E8CEF3                   call error1
 10536 000048D2 83C402                   add  sp, 2
 10537                                  
 10538                                  ;-1190         }
 10539                                  
 10540                                  .parse540:
 10541                                  
 10542                                  ;-1191     else{
 10543                                  
 10544 000048D5 E91600                   jmp .parse541
 10545                                  .parse538:
 10546                                  
 10547                                  ;-1192         typeName();
 10548                                  
 10549 000048D8 E89BC4                   call typeName
 10550                                  
 10551                                  ;-1193         if (token=='(') dofunc();
 10552                                  
 10553 000048DB A1[1E00]                 mov ax, [token]
 10554 000048DE 83F828                   cmp ax, 40
 10555 000048E1 0F850600                 jne .parse542
 10556 000048E5 E8A2C7                   call dofunc
 10557                                  
 10558                                  ;-1194         else doglob(); }
 10559                                  
 10560 000048E8 E90300                   jmp .parse543
 10561                                  .parse542:
 10562 000048EB E84CBE                   call doglob
 10563                                  .parse543:
 10564                                  
 10565                                  ;-1195     } while(1);
 10566                                  
 10567                                  .parse541:
 10568 000048EE B80100                   mov ax, 1
 10569 000048F1 08C0                     or  al, al
 10570 000048F3 0F840200                 je .parse544
 10571 000048F7 EBA0                     jmp .parse536
 10572                                  .parse544:
 10573                                  
 10574                                  ;-1196 }
 10575                                  
 10576                                  
 10577                                  ;-1197 
 10578                                  
 10579                                  
 10580                                  ;-1198 int getfirstchar() {
 10581                                  
 10582                                   .retnparse:
 10583 000048F9 C3                       ret
 10584 000048FA 646566696E65206578-     parse_0 db "define expected",0
 10585 00004903 70656374656400     
 10586                                  ENDP
 10587                                  
 10588                                  getfirstchar: PROC
 10589                                  
 10590                                  ;-1199     fgetsp=&fgetsdest;
 10591                                  
 10592 0000490A B89FB8                   mov ax, fgetsdest
 10593 0000490D A3[6400]                 mov word [fgetsp], ax
 10594                                  
 10595                                  ;-1200     *fgetsp=0;
 10596                                  
 10597 00004910 B80000                   mov ax, 0
 10598 00004913 8B1E[6400]               mov  bx, [fgetsp]
 10599 00004917 8807                     mov  [bx], al
 10600                                  
 10601                                  ;-1201     thechar=fgets1();
 10602                                  
 10603 00004919 E813F2                   call fgets1
 10604 0000491C A2[2300]                 mov byte [thechar], al
 10605                                  
 10606                                  ;-1202     }
 10607                                  
 10608                                  
 10609                                  ;-1203 
 10610                                  
 10611                                  
 10612                                  ;-1204 char *arglen=0x80; char *argv=0x82;
 10613                                  
 10614 0000491F C3                       ret
 10615                                  ENDP
 10616 00004920 8000                    arglen dw 128
 10617 00004922 8200                    argv dw 130
 10618                                  
 10619                                  ;-1205 int getarg() {
 10620                                  
 10621                                  
 10622                                  getarg: PROC
 10623                                  
 10624                                  ;-1206     int arglen1; int i; char *c;
 10625                                  
 10626                                  
 10627                                  ;-1207     arglen1=*arglen;
 10628                                  
 10629                                  ;Function : getarg, Number of local variables: 3
 10630                                  ;   # type sign width addr used name   list of local variables
 10631                                  ;  200 var sign word  1206 NULL arglen1 = bp-2
 10632                                  ;  201 var sign word  1206 NULL i = bp-4
 10633                                  ;  202 ptr sign byte  1206 NULL c = bp-6;
 10634 00004924 C8060000                 ENTER  6,0
 10635 00004928 8B1E[2049]               mov bx, [arglen]
 10636 0000492C 8A07                     mov al, [bx]
 10637 0000492E B400                     mov ah, 0
 10638 00004930 8946FE                   mov [bp-2], ax
 10639                                  
 10640                                  ;-1208     if (arglen1 == 0) {
 10641                                  
 10642 00004933 8B46FE                   mov ax, [bp-2]
 10643 00004936 83F800                   cmp ax, 0
 10644 00004939 0F851C00                 jne .getarg545
 10645                                  
 10646                                  ;-1209         cputs(Version1);
 10647                                  
 10648 0000493D 8D06[0300]               lea  ax, [Version1]
 10649 00004941 50                       push ax
 10650 00004942 E852B7                   call cputs
 10651 00004945 83C402                   add  sp, 2
 10652                                  
 10653                                  ;-1210         cputs(" Usage: A.COM in_file[.C]: ");
 10654                                  
 10655 00004948 68[874A]                 push getarg_0
 10656 0000494B E849B7                   call cputs
 10657 0000494E 83C402                   add  sp, 2
 10658                                  
 10659                                  ;-1211         exitR(3);
 10660                                  
 10661 00004951 6A03                     push 3
 10662 00004953 E8B3B7                   call exitR
 10663 00004956 83C402                   add  sp, 2
 10664                                  
 10665                                  ;-1212         }
 10666                                  
 10667                                  
 10668                                  ;-1213     i=arglen1+129;
 10669                                  
 10670                                  .getarg545:
 10671 00004959 8B46FE                   mov ax, [bp-2]
 10672 0000495C 058100                   add ax, 129
 10673 0000495F 8946FC                   mov [bp-4], ax
 10674                                  
 10675                                  ;-1214     *i=0;
 10676                                  
 10677 00004962 B80000                   mov ax, 0
 10678 00004965 8B5EFC                   mov  bx, [bp-4]
 10679 00004968 8907                     mov  [bx], ax
 10680                                  
 10681                                  ;-1215     arglen1--;
 10682                                  
 10683 0000496A FF4EFE                   dec  word[bp-2]
 10684                                  
 10685                                  ;-1216     toupper(argv);
 10686                                  
 10687 0000496D FF36[2249]               push word [argv]
 10688 00004971 E880B9                   call toupper
 10689 00004974 83C402                   add  sp, 2
 10690                                  
 10691                                  ;-1217     strcpy(namein, argv);
 10692                                  
 10693 00004977 FF36[2249]               push word [argv]
 10694 0000497B 8D067E6A                 lea  ax, [namein]
 10695 0000497F 50                       push ax
 10696 00004980 E8CAB8                   call strcpy
 10697 00004983 83C404                   add  sp, 4
 10698                                  
 10699                                  ;-1218     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
 10700                                  
 10701 00004986 6A2E                     push 46
 10702 00004988 8D067E6A                 lea  ax, [namein]
 10703 0000498C 50                       push ax
 10704 0000498D E8A7B9                   call instr1
 10705 00004990 83C404                   add  sp, 4
 10706 00004993 83F800                   cmp ax, 0
 10707 00004996 0F850E00                 jne .getarg546
 10708 0000499A 68[A34A]                 push getarg_1
 10709 0000499D 8D067E6A                 lea  ax, [namein]
 10710 000049A1 50                       push ax
 10711 000049A2 E82AB9                   call strcat1
 10712 000049A5 83C404                   add  sp, 4
 10713                                  
 10714                                  ;-1219     strcpy(namelst, namein);
 10715                                  
 10716                                  .getarg546:
 10717 000049A8 8D067E6A                 lea  ax, [namein]
 10718 000049AC 50                       push ax
 10719 000049AD 8D06C16A                 lea  ax, [namelst]
 10720 000049B1 50                       push ax
 10721 000049B2 E898B8                   call strcpy
 10722 000049B5 83C404                   add  sp, 4
 10723                                  
 10724                                  ;-1220     i=strlen(namelst);
 10725                                  
 10726 000049B8 8D06C16A                 lea  ax, [namelst]
 10727 000049BC 50                       push ax
 10728 000049BD E865B8                   call strlen
 10729 000049C0 83C402                   add  sp, 2
 10730 000049C3 8946FC                   mov [bp-4], ax
 10731                                  
 10732                                  ;-1221     i--;
 10733                                  
 10734 000049C6 FF4EFC                   dec  word[bp-4]
 10735                                  
 10736                                  ;-1222     c=&namelst+i;
 10737                                  
 10738 000049C9 B8C16A                   mov ax, namelst
 10739 000049CC 0346FC                   add ax, [bp-4]
 10740 000049CF 8946FA                   mov [bp-6], ax
 10741                                  
 10742                                  ;-1223     *c='S';
 10743                                  
 10744 000049D2 B85300                   mov ax, 83
 10745 000049D5 8B5EFA                   mov  bx, [bp-6]
 10746 000049D8 8807                     mov  [bx], al
 10747                                  
 10748                                  ;-1224 
 10749                                  
 10750                                  
 10751                                  ;-1225     fdin=openR (namein);
 10752                                  
 10753 000049DA 8D067E6A                 lea  ax, [namein]
 10754 000049DE 50                       push ax
 10755 000049DF E8F7B6                   call openR
 10756 000049E2 83C402                   add  sp, 2
 10757 000049E5 A3[1A00]                 mov word [fdin], ax
 10758                                  
 10759                                  ;-1226     if(DOS_ERR){
 10760                                  
 10761 000049E8 A1[7000]                 mov ax, [DOS_ERR]
 10762 000049EB 08C0                     or  al, al
 10763 000049ED 0F841C00                 je .getarg547
 10764                                  
 10765                                  ;-1227         cputs("Source file missing (.C): ");
 10766                                  
 10767 000049F1 68[A64A]                 push getarg_2
 10768 000049F4 E8A0B6                   call cputs
 10769 000049F7 83C402                   add  sp, 2
 10770                                  
 10771                                  ;-1228         cputs(namein);
 10772                                  
 10773 000049FA 8D067E6A                 lea  ax, [namein]
 10774 000049FE 50                       push ax
 10775 000049FF E895B6                   call cputs
 10776 00004A02 83C402                   add  sp, 2
 10777                                  
 10778                                  ;-1229         exitR(1);
 10779                                  
 10780 00004A05 6A01                     push 1
 10781 00004A07 E8FFB6                   call exitR
 10782 00004A0A 83C402                   add  sp, 2
 10783                                  
 10784                                  ;-1230         }
 10785                                  
 10786                                  
 10787                                  ;-1231     fdout=creatR(namelst);
 10788                                  
 10789                                  .getarg547:
 10790 00004A0D 8D06C16A                 lea  ax, [namelst]
 10791 00004A11 50                       push ax
 10792 00004A12 E8D3B6                   call creatR
 10793 00004A15 83C402                   add  sp, 2
 10794 00004A18 A3[1C00]                 mov word [fdout], ax
 10795                                  
 10796                                  ;-1232     if(DOS_ERR){
 10797                                  
 10798 00004A1B A1[7000]                 mov ax, [DOS_ERR]
 10799 00004A1E 08C0                     or  al, al
 10800 00004A20 0F841C00                 je .getarg548
 10801                                  
 10802                                  ;-1233         cputs("list file not creatable: ");
 10803                                  
 10804 00004A24 68[C14A]                 push getarg_3
 10805 00004A27 E86DB6                   call cputs
 10806 00004A2A 83C402                   add  sp, 2
 10807                                  
 10808                                  ;-1234         cputs(namelst);
 10809                                  
 10810 00004A2D 8D06C16A                 lea  ax, [namelst]
 10811 00004A31 50                       push ax
 10812 00004A32 E862B6                   call cputs
 10813 00004A35 83C402                   add  sp, 2
 10814                                  
 10815                                  ;-1235         exitR(2);
 10816                                  
 10817 00004A38 6A02                     push 2
 10818 00004A3A E8CCB6                   call exitR
 10819 00004A3D 83C402                   add  sp, 2
 10820                                  
 10821                                  ;-1236         }
 10822                                  
 10823                                  
 10824                                  ;-1237     prs("\n; ");
 10825                                  
 10826                                  .getarg548:
 10827 00004A40 68[DB4A]                 push getarg_4
 10828 00004A43 E804BB                   call prs
 10829 00004A46 83C402                   add  sp, 2
 10830                                  
 10831                                  ;-1238     prs(Version1);
 10832                                  
 10833 00004A49 8D06[0300]               lea  ax, [Version1]
 10834 00004A4D 50                       push ax
 10835 00004A4E E8F9BA                   call prs
 10836 00004A51 83C402                   add  sp, 2
 10837                                  
 10838                                  ;-1239     prs(", Source: "); prs(namein);
 10839                                  
 10840 00004A54 68[E04A]                 push getarg_5
 10841 00004A57 E8F0BA                   call prs
 10842 00004A5A 83C402                   add  sp, 2
 10843 00004A5D 8D067E6A                 lea  ax, [namein]
 10844 00004A61 50                       push ax
 10845 00004A62 E8E5BA                   call prs
 10846 00004A65 83C402                   add  sp, 2
 10847                                  
 10848                                  ;-1240     prs(", Output asm: "); prs(namelst);
 10849                                  
 10850 00004A68 68[EB4A]                 push getarg_6
 10851 00004A6B E8DCBA                   call prs
 10852 00004A6E 83C402                   add  sp, 2
 10853 00004A71 8D06C16A                 lea  ax, [namelst]
 10854 00004A75 50                       push ax
 10855 00004A76 E8D1BA                   call prs
 10856 00004A79 83C402                   add  sp, 2
 10857                                  
 10858                                  ;-1241     prs("\norg  256 \njmp main");
 10859                                  
 10860 00004A7C 68[FA4A]                 push getarg_7
 10861 00004A7F E8C8BA                   call prs
 10862 00004A82 83C402                   add  sp, 2
 10863                                  
 10864                                  ;-1242 }
 10865                                  
 10866                                  
 10867                                  ;-1243 
 10868                                  
 10869                                  
 10870                                  ;-1244 int setblock(unsigned int i) {
 10871 00004A85 C9                       LEAVE
 10872 00004A86 C3                       ret
 10873 00004A87 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
 10874 00004A90 2E434F4D20696E5F66-
 10875 00004A99 696C655B2E435D3A20-
 10876 00004AA2 00                 
 10877 00004AA3 2E4300                  getarg_1 db ".C",0
 10878 00004AA6 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
 10879 00004AAF 6C65206D697373696E-
 10880 00004AB8 6720282E43293A2000 
 10881 00004AC1 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
 10882 00004ACA 206E6F742063726561-
 10883 00004AD3 7461626C653A2000   
 10884 00004ADB 5C6E3B2000              getarg_4 db "\n; ",0
 10885 00004AE0 2C20536F757263653A-     getarg_5 db ", Source: ",0
 10886 00004AE9 2000               
 10887 00004AEB 2C204F757470757420-     getarg_6 db ", Output asm: ",0
 10888 00004AF4 61736D3A2000       
 10889 00004AFA 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
 10890 00004B03 36205C6E6A6D70206D-
 10891 00004B0C 61696E00           
 10892                                  ENDP
 10893                                  
 10894                                  setblock: PROC
 10895                                  
 10896                                  ;-1245     DOS_ERR=0;
 10897                                  
 10898                                  ;Function : setblock, Number of local variables: 1
 10899                                  ;   # type sign width addr used name   list of local variables
 10900                                  ;  200 var unsg word  1244 NULL i = bp+4;
 10901 00004B10 C8000000                 ENTER  0,0
 10902 00004B14 B80000                   mov ax, 0
 10903 00004B17 A3[7000]                 mov word [DOS_ERR], ax
 10904                                  
 10905                                  ;-1246     bx=i;
 10906                                  
 10907 00004B1A 8B5E04                   mov  bx, [bp+4]
 10908                                  
 10909                                  ;-1247     ax=cs;
 10910                                  
 10911 00004B1D 8CC8                     mov  ax, cs
 10912                                  
 10913                                  ;-1248     es=ax;
 10914                                  
 10915 00004B1F 8EC0                     mov  es, ax
 10916                                  
 10917                                  ;-1249     ax=0x4A00;
 10918                                  
 10919 00004B21 B8004A                   mov  ax, 18944
 10920                                  
 10921                                  ;-1250     DosInt();
 10922                                  
 10923 00004B24 E8A9B5                   call DosInt
 10924                                  
 10925                                  ;-1251 }
 10926                                  
 10927                                  
 10928                                  ;-1252 int main() {
 10929 00004B27 C9                       LEAVE
 10930 00004B28 C3                       ret
 10931                                  ENDP
 10932                                  
 10933                                  main: PROC
 10934                                  
 10935                                  ;-1253     getarg();
 10936                                  
 10937 00004B29 E8F8FD                   call getarg
 10938                                  
 10939                                  ;-1254 setblock(4096);
 10940                                  
 10941 00004B2C 680010                   push 4096
 10942 00004B2F E8DEFF                   call setblock
 10943 00004B32 83C402                   add  sp, 2
 10944                                  
 10945                                  ;-1255 if (DOS_ERR) error1("SetBlock , AX=");
 10946                                  
 10947 00004B35 A1[7000]                 mov ax, [DOS_ERR]
 10948 00004B38 08C0                     or  al, al
 10949 00004B3A 0F840900                 je .main549
 10950 00004B3E 68[844B]                 push main_0
 10951 00004B41 E85CF1                   call error1
 10952 00004B44 83C402                   add  sp, 2
 10953                                  
 10954                                  ;-1256 segE=allocmem(4096);
 10955                                  
 10956                                  .main549:
 10957 00004B47 680010                   push 4096
 10958 00004B4A E85800                   call allocmem
 10959 00004B4D 83C402                   add  sp, 2
 10960 00004B50 A3[6600]                 mov word [segE], ax
 10961                                  
 10962                                  ;-1257 if (DOS_ERR)  error1("alloc memory, AX=");
 10963                                  
 10964 00004B53 A1[7000]                 mov ax, [DOS_ERR]
 10965 00004B56 08C0                     or  al, al
 10966 00004B58 0F840900                 je .main550
 10967 00004B5C 68[934B]                 push main_1
 10968 00004B5F E83EF1                   call error1
 10969 00004B62 83C402                   add  sp, 2
 10970                                  
 10971                                  ;-1258     CNameTop=0;
 10972                                  
 10973                                  .main550:
 10974 00004B65 B80000                   mov ax, 0
 10975 00004B68 A3[6200]                 mov word [CNameTop], ax
 10976                                  
 10977                                  ;-1259     coname=0;
 10978                                  
 10979 00004B6B B80000                   mov ax, 0
 10980 00004B6E A27869                   mov byte [coname], al
 10981                                  
 10982                                  ;-1260     orgData=ORGDATAORIG;
 10983                                  
 10984 00004B71 A1[1000]                 mov ax, [ORGDATAORIG]
 10985 00004B74 A3[1200]                 mov word [orgData], ax
 10986                                  
 10987                                  ;-1261     getfirstchar();
 10988                                  
 10989 00004B77 E890FD                   call getfirstchar
 10990                                  
 10991                                  ;-1262     parse();
 10992                                  
 10993 00004B7A E816FD                   call parse
 10994                                  
 10995                                  ;-1263   checkcalls();
 10996                                  
 10997 00004B7D E88BFA                   call checkcalls
 10998                                  
 10999                                  ;-1264   epilog();
 11000                                  
 11001 00004B80 E8C2F7                   call epilog
 11002                                  
 11003                                  ;-1265 }
 11004                                  
 11005                                  
 11006                                  ;-1266 
 11007                                  
 11008                                  
 11009                                  ;-1267 
 11010                                  
 11011                                  
 11012                                  ;-1268 
 11013                                  
 11014                                  
 11015                                  ;-1269 int allocmem(unsigned int i) {
 11016                                  
 11017 00004B83 C3                       ret
 11018 00004B84 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
 11019 00004B8D 2C2041583D00       
 11020 00004B93 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
 11021 00004B9C 6F72792C2041583D00 
 11022                                  ENDP
 11023                                  
 11024                                  allocmem: PROC
 11025                                  
 11026                                  ;-1270     unsigned int vAX; unsigned int vBX;
 11027                                  
 11028                                  
 11029                                  ;-1271     DOS_ERR=0;
 11030                                  
 11031                                  ;Function : allocmem, Number of local variables: 3
 11032                                  ;   # type sign width addr used name   list of local variables
 11033                                  ;  200 var unsg word  1269 NULL i = bp+4
 11034                                  ;  201 var unsg word  1270 NULL vAX = bp-2
 11035                                  ;  202 var unsg word  1270 NULL vBX = bp-4;
 11036 00004BA5 C8040000                 ENTER  4,0
 11037 00004BA9 B80000                   mov ax, 0
 11038 00004BAC A3[7000]                 mov word [DOS_ERR], ax
 11039                                  
 11040                                  ;-1272     bx=i;
 11041                                  
 11042 00004BAF 8B5E04                   mov  bx, [bp+4]
 11043                                  
 11044                                  ;-1273     ax=0x4800;
 11045                                  
 11046 00004BB2 B80048                   mov  ax, 18432
 11047                                  
 11048                                  ;-1274     DosInt();
 11049                                  
 11050 00004BB5 E818B5                   call DosInt
 11051                                  
 11052                                  ;-1275     asm mov [bp-2], ax; _ vAX=ax;
 11053                                  
 11054 00004BB8 8946FE                   mov [bp-2], ax; _ vAX=ax;
 11055                                  
 11056                                  ;-1276     asm mov [bp-4], bx; _ vBX=bx;
 11057                                  
 11058 00004BBB 895EFC                   mov [bp-4], bx; _ vBX=bx;
 11059                                  
 11060                                  ;-1277     if(DOS_ERR) return vBX;
 11061                                  
 11062 00004BBE A1[7000]                 mov ax, [DOS_ERR]
 11063 00004BC1 08C0                     or  al, al
 11064 00004BC3 0F840600                 je .allocmem551
 11065 00004BC7 8B46FC                   mov ax, [bp-4]
 11066 00004BCA E90600                   jmp .retnallocmem
 11067                                  
 11068                                  ;-1278     return vAX;
 11069                                  
 11070                                  .allocmem551:
 11071 00004BCD 8B46FE                   mov ax, [bp-2]
 11072 00004BD0 E90000                   jmp .retnallocmem
 11073                                  
 11074                                  ;-1279 }
 11075                                  
 11076                                  
 11077                                  ;-1280 int to_far(char *dest, char *src) {
 11078                                  
 11079 00004BD3 C9                       .retnallocmem: LEAVE
 11080 00004BD4 C3                       ret
 11081                                  ENDP
 11082                                  
 11083                                  to_far: PROC
 11084                                  
 11085                                  ;-1281   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di
 11086                                  
 11087                                  ;Function : to_far, Number of local variables: 2
 11088                                  ;   # type sign width addr used name   list of local variables
 11089                                  ;  200 ptr sign byte  1280 NULL dest = bp+4
 11090                                  ;  201 ptr sign byte  1280 NULL src = bp+6;
 11091 00004BD5 C8000000                 ENTER  0,0
 11092 00004BD9 A1[6600]                 mov ax, [segE]
 11093 00004BDC 8EC0                     mov  es, ax
 11094 00004BDE 8B7606                   mov  si, [bp+6]
 11095 00004BE1 8B7E04                   mov  di, [bp+4]
 11096                                  
 11097                                  ;-1282   asm cld
 11098                                  
 11099 00004BE4 FC                       cld
 11100                                  
 11101                                  ;-1283   do{
 11102                                  
 11103                                  .to_far552:
 11104                                  
 11105                                  ;-1284   asm lodsb  ; inc si
 11106                                  
 11107 00004BE5 AC                       lodsb  ; inc si
 11108                                  
 11109                                  ;-1285   asm stosb  ; inc di
 11110                                  
 11111 00004BE6 AA                       stosb  ; inc di
 11112                                  
 11113                                  ;-1286   } while (al != 0);
 11114                                  
 11115 00004BE7 3C00                     cmp  al, 0
 11116 00004BE9 0F840200                 je  .to_far553
 11117 00004BED EBF6                     jmp .to_far552
 11118                                  .to_far553:
 11119                                  
 11120                                  ;-1287 }
 11121                                  
 11122                                  
 11123                                  ;-1288 int from_far(char *dest, char *src) {
 11124 00004BEF C9                       LEAVE
 11125 00004BF0 C3                       ret
 11126                                  ENDP
 11127                                  
 11128                                  from_far: PROC
 11129                                  
 11130                                  ;-1289   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di
 11131                                  
 11132                                  ;Function : from_far, Number of local variables: 2
 11133                                  ;   # type sign width addr used name   list of local variables
 11134                                  ;  200 ptr sign byte  1288 NULL dest = bp+4
 11135                                  ;  201 ptr sign byte  1288 NULL src = bp+6;
 11136 00004BF1 C8000000                 ENTER  0,0
 11137 00004BF5 A1[6600]                 mov ax, [segE]
 11138 00004BF8 8EC0                     mov  es, ax
 11139 00004BFA 8B7606                   mov  si, [bp+6]
 11140 00004BFD 8B7E04                   mov  di, [bp+4]
 11141                                  
 11142                                  ;-1290   do{
 11143                                  
 11144                                  .from_far554:
 11145                                  
 11146                                  ;-1291   asm mov al, [es:si]
 11147                                  
 11148 00004C00 268A04                   mov al, [es:si]
 11149                                  
 11150                                  ;-1292   asm inc si
 11151                                  
 11152 00004C03 46                       inc si
 11153                                  
 11154                                  ;-1293   asm mov [di], al
 11155                                  
 11156 00004C04 8805                     mov [di], al
 11157                                  
 11158                                  ;-1294   asm inc di
 11159                                  
 11160 00004C06 47                       inc di
 11161                                  
 11162                                  ;-1295   } while (al != 0);
 11163                                  
 11164 00004C07 3C00                     cmp  al, 0
 11165 00004C09 0F840200                 je  .from_far555
 11166 00004C0D EBF1                     jmp .from_far554
 11167                                  .from_far555:
 11168                                  
 11169                                  ;-1296 }
 11170 00004C0F C9                       LEAVE
 11171 00004C10 C3                       ret
 11172                                  ENDP
 11173                                   
 11174                                  ; missing functions: 
 11175                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 11176                                   
 11177                                  ;   # type sign width  adr used name   list of global variables
 11178                                  
 11179                                  ;    1 arr sign byte     1    2 Version1[12]
 11180                                  ;    2 def unsg byte     2    - LSTART=200
 11181                                  ;    3 def unsg byte     3    - VARMAX=300
 11182                                  ;    4 def unsg byte     4    - GNAMEMAX=4800
 11183                                  ;    5 def unsg byte     5    - FUNCMAX=300
 11184                                  ;    6 def unsg byte     6    - FNAMEMAX=4800
 11185                                  ;    7 def unsg byte     7    - CALLMAX=2000
 11186                                  ;    8 def unsg byte     8    - IDLENMAX=15
 11187                                  ;    9 def unsg byte     9    - COLUMNMAX=128
 11188                                  ;   10 def unsg byte    10    - T_NAME=256
 11189                                  ;   11 def unsg byte    11    - T_CONST=257
 11190                                  ;   12 def unsg byte    12    - T_STRING=258
 11191                                  ;   13 def unsg byte    13    - T_DEFINE=511
 11192                                  ;   14 def unsg byte    14    - T_RETURN=512
 11193                                  ;   15 def unsg byte    15    - T_IF=513
 11194                                  ;   16 def unsg byte    16    - T_ELSE=514
 11195                                  ;   17 def unsg byte    17    - T_WHILE=515
 11196                                  ;   18 def unsg byte    18    - T_DO=516
 11197                                  ;   19 def unsg byte    19    - T_INT=517
 11198                                  ;   20 def unsg byte    20    - T_ASM=518
 11199                                  ;   21 def unsg byte    21    - T_ASMBLOCK=519
 11200                                  ;   22 def unsg byte    22    - T_EMIT=520
 11201                                  ;   23 def unsg byte    23    - T_GOTO=521
 11202                                  ;   24 def unsg byte    24    - T_VOID=529
 11203                                  ;   25 def unsg byte    25    - T_CHAR=530
 11204                                  ;   26 def unsg byte    26    - T_SIGNED=531
 11205                                  ;   27 def unsg byte    27    - T_UNSIGNED=532
 11206                                  ;   28 def unsg byte    28    - T_LONG=533
 11207                                  ;   29 def unsg byte    29    - T_EQ=806
 11208                                  ;   30 def unsg byte    30    - T_NE=807
 11209                                  ;   31 def unsg byte    31    - T_GE=811
 11210                                  ;   32 def unsg byte    32    - T_LE=824
 11211                                  ;   33 def unsg byte    33    - T_PLUSPLUS=1219
 11212                                  ;   34 def unsg byte    34    - T_MINUSMINUS=1225
 11213                                  ;   35 def unsg byte    35    - T_PLUSASS=1230
 11214                                  ;   36 def unsg byte    36    - T_MINUSASS=1231
 11215                                  ;   37 def unsg byte    37    - T_MULASS=1232
 11216                                  ;   38 def unsg byte    38    - T_DIVASS=1233
 11217                                  ;   39 def unsg byte    39    - T_ANDASS=1234
 11218                                  ;   40 def unsg byte    40    - T_ORASS=1235
 11219                                  ;   41 def unsg byte    41    - T_LESSLESS=1240
 11220                                  ;   42 def unsg byte    42    - T_GREATGREAT=1241
 11221                                  ;   43 var unsg word    44    2 ORGDATAORIG
 11222                                  ;   44 var unsg word    45   10 orgData
 11223                                  ;   45 def unsg byte    46    - COMAX=2000
 11224                                  ;   46 arr sign byte    47    4 co[2000]
 11225                                  ;   47 var sign word    48    4 maxco
 11226                                  ;   48 var sign word    49    3 maxco1
 11227                                  ;   49 def unsg byte    50    - CMDLENMAX=67
 11228                                  ;   50 arr sign byte    51    3 coname[67]
 11229                                  ;   51 arr sign byte    52   96 symbol[128]
 11230                                  ;   52 arr sign byte    53   12 fname[67]
 11231                                  ;   53 arr sign byte    54    8 namein[67]
 11232                                  ;   54 arr sign byte    55    7 namelst[67]
 11233                                  ;   55 arr sign byte    56 NULL archivename[67]
 11234                                  ;   56 ptr sign byte    57    5 cloc
 11235                                  ;   57 var sign word    58    3 fdin
 11236                                  ;   58 var sign word    59    4 fdout
 11237                                  ;   59 var sign word    60   35 token
 11238                                  ;   60 var sign byte    61    1 globC
 11239                                  ;   61 var sign word    62    3 column
 11240                                  ;   62 var sign byte    63   28 thechar
 11241                                  ;   63 var sign word    64    9 iscmp
 11242                                  ;   64 var sign word    65    4 nconst
 11243                                  ;   65 var sign word    66    3 nreturn
 11244                                  ;   66 var sign word    67   12 nlabel
 11245                                  ;   67 var sign word    68   24 GTop
 11246                                  ;   68 var sign word    69   20 LTop
 11247                                  ;   69 var unsg word    70   43 lexval
 11248                                  ;   70 var sign word    71    4 typei
 11249                                  ;   71 var sign byte    71    8 istype
 11250                                  ;   72 var sign word    72    4 signi
 11251                                  ;   73 var sign byte    72    5 issign
 11252                                  ;   74 var sign word    73    9 widthi
 11253                                  ;   75 var sign byte    73   19 iswidth
 11254                                  ;   76 arr sign byte    74   11 GType[300]
 11255                                  ;   77 arr sign byte    75    5 GSign[300]
 11256                                  ;   78 arr sign byte    76    5 GWidth[300]
 11257                                  ;   79 arr sign word    77    4 GAdr[300]
 11258                                  ;   80 arr sign word    78    6 GUsed[300]
 11259                                  ;   81 arr sign word    79   11 GData[300]
 11260                                  ;   82 arr sign byte    80    2 GNameField[4800]
 11261                                  ;   83 var sign word    81   24 wi
 11262                                  ;   84 var sign word    82   13 FTop
 11263                                  ;   85 var sign word    83    8 CTop
 11264                                  ;   86 arr sign byte    84    2 FType[300]
 11265                                  ;   87 arr sign byte    85    3 CType[2000]
 11266                                  ;   88 arr sign word    86    2 FAdr[300]
 11267                                  ;   89 arr sign word    87    4 CAdr[2000]
 11268                                  ;   90 arr sign word    88    4 FCalls[300]
 11269                                  ;   91 arr sign byte    89    5 FNameField[4800]
 11270                                  ;   92 arr sign byte    92    7 NameA[32]
 11271                                  ;   93 arr sign byte    93    5 fgetsdest[128]
 11272                                  ;   94 ptr unsg byte    94    8 CNameTop
 11273                                  ;   95 ptr unsg byte    95   10 fgetsp
 11274                                  ;   96 var unsg word    96    3 segE
 11275                                  ;   97 var unsg word    97    9 lineno
 11276                                  ;   98 var unsg word    98 NULL linenoinclude
 11277                                  ;   99 ptr unsg byte    99   17 pt
 11278                                  ;  100 ptr unsg byte   100    8 p1
 11279                                  ;  101 var sign word   101    8 DOS_ERR
 11280                                  ;  102 var sign word   102    3 DOS_NoBytes
 11281                                  ;  103 var sign byte   103    3 DOS_ByteRead
 11282                                  ;  104 arr sign byte   318    2 doglobName[15]
 11283                                  ;  105 var sign word   488    5 ireg1
 11284                                  ;  106 var sign word   489    2 mod2
 11285                                  ;  107 var sign word   489    3 ireg2
 11286                                  ;  108 arr sign byte   510    9 ops[5]
 11287                                  ;  109 arr sign byte   553    3 printregstr[74]
 11288                                  ;  110 var sign word   560    1 evalue
 11289                                  ;  111 var sign word   560    1 exprtype
 11290                                  ;  112 arr sign word   714    2 docalltype[10]
 11291                                  ;  113 arr sign word   714    2 docallvalue[10]
 11292                                  ;  114 arr sign byte   715    2 procname[17]
 11293                                  ;  115 arr sign byte   797    2 symboltemp[80]
 11294                                  ;  116 var unsg word  1099    1 MAXUI
 11295                                  ;  117 ptr sign byte  1204    1 arglen
 11296                                  ;  118 ptr sign byte  1204    2 argv
 11297                                  
 11298                                  
 11299                                  ;   # Calls Line Width  Name   list of functions
 11300                                  
 11301                                  ;    0    4  106   writetty
 11302                                  ;    1    1  107   putch
 11303                                  ;    2    6  108   cputs
 11304                                  ;    3    3  109   mkneg
 11305                                  ;    4    8  111   DosInt
 11306                                  ;    5    1  116   openR
 11307                                  ;    6    1  117   creatR
 11308                                  ;    7    2  118   fcloseR
 11309                                  ;    8    4  119   exitR
 11310                                  ;    9    1  120   readRL
 11311                                  ;   10    1  122   fputcR
 11312                                  ;   11    1  125   letter
 11313                                  ;   12    3  135   digit
 11314                                  ;   13    3  140   alnum
 11315                                  ;   14    8  146   strlen
 11316                                  ;   15   22  151   strcpy
 11317                                  ;   16   71  157   eqstr
 11318                                  ;   17    1  165   strcat1
 11319                                  ;   18    1  169   toupper
 11320                                  ;   19    2  175   instr1
 11321                                  ;   20    3  184   a
 11322                                  ;   21   18  186   v
 11323                                  ;   22    4  191   checknamelen
 11324                                  ;   23   32  197   next
 11325                                  ;   24   75  204   istoken
 11326                                  ;   25   36  211   expect
 11327                                  ;   26    6  222   eprc
 11328                                  ;   27    5  226   eprs
 11329                                  ;   28   40  234   prc
 11330                                  ;   29    3  243   prscomment
 11331                                  ;   30    7  251   prnl
 11332                                  ;   31  216  255   prs
 11333                                  ;   32    2  274   eprnum
 11334                                  ;   33    7  288   pint1
 11335                                  ;   34   32  299   prunsign1
 11336                                  ;   35   20  309   printint51
 11337                                  ;   36    1  319   doglob
 11338                                  ;   37   10  369   gettypes
 11339                                  ;   38    7  378   adrofname
 11340                                  ;   39    7  379   adrF
 11341                                  ;   40    4  381   printName
 11342                                  ;   41   10  385   searchname
 11343                                  ;   42    3  389   checkName
 11344                                  ;   43    8  394   typeName
 11345                                  ;   44    3  410   name1
 11346                                  ;   45    1  415   storecall
 11347                                  ;   46    1  421   storefunc
 11348                                  ;   47    2  425   addlocal
 11349                                  ;   48    1  431   checkFunction
 11350                                  ;   49    1  435   dofunc
 11351                                  ;   50    1  478   isvariable
 11352                                  ;   51    3  491   pexpr
 11353                                  ;   52    1  499   constantexpr
 11354                                  ;   53    2  511   doreg1
 11355                                  ;   54    4  530   checkreg
 11356                                  ;   55    3  555   printreg
 11357                                  ;   56    4  561   expr
 11358                                  ;   57    4  610   compoundass
 11359                                  ;   58    2  617   dovar1
 11360                                  ;   59    8  638   rterm
 11361                                  ;   60    1  651   isreg
 11362                                  ;   61   15  669   doreg
 11363                                  ;   62    1  675   doassign
 11364                                  ;   63    1  693   domul
 11365                                  ;   64    2  699   doidiv
 11366                                  ;   65    1  712   domod
 11367                                  ;   66    1  716   docall1
 11368                                  ;   67    1  759   doemit
 11369                                  ;   68    3  763   cmpneg
 11370                                  ;   69    7  776   prlabel
 11371                                  ;   70    3  777   prjump
 11372                                  ;   71    1  778   doif
 11373                                  ;   72    1  784   dodo
 11374                                  ;   73    1  788   dowhile
 11375                                  ;   74    3  791   isrelational
 11376                                  ;   75   13  798   getlex
 11377                                  ;   76    1  849   convertdefine
 11378                                  ;   77    1  857   getdigit
 11379                                  ;   78    6  867   stmt
 11380                                  ;   79    1  899   getstring
 11381                                  ;   80    2  911   fgets1
 11382                                  ;   81    1  925   printinputline
 11383                                  ;   82    1  947   ifEOL
 11384                                  ;   83    2  956   end1
 11385                                  ;   84   41  961   error1
 11386                                  ;   85    2  981   listproc
 11387                                  ;   86    1  997   listcall
 11388                                  ;   87    1 1006   calllisting
 11389                                  ;   88    1 1019   countcalls
 11390                                  ;   89    1 1030   listfunc
 11391                                  ;   90    1 1044   funclisting
 11392                                  ;   91    2 1063   listvar
 11393                                  ;   92    1 1100   epilog
 11394                                  ;   93    1 1130   checkcalls
 11395                                  ;   94    1 1157   dodefine
 11396                                  ;   95    1 1183   parse
 11397                                  ;   96    1 1198   getfirstchar
 11398                                  ;   97    1 1205   getarg
 11399                                  ;   98    1 1244   setblock
 11400                                  ;   99 NULL 1252   main
 11401                                  ;  100    1 1269   allocmem
 11402                                  ;  101    1 1280   to_far
 11403                                  ;  102    3 1288   from_far
 11404                                  
 11405                                  ;    #  addr name   list of CALLs
 11406                                  
 11407                                  ;    0     0 writetty
 11408                                  ;    1     9 writetty
 11409                                  ;    2    18 putch
 11410                                  ;    3    24 DosInt
 11411                                  ;    4    31 DosInt
 11412                                  ;    5    38 DosInt
 11413                                  ;    6    45 DosInt
 11414                                  ;    7    52 DosInt
 11415                                  ;    8    59 DosInt
 11416                                  ;    9    66 digit
 11417                                  ;   10    72 letter
 11418                                  ;   11    79 strcpy
 11419                                  ;   12    86 printName
 11420                                  ;   13    96 prc
 11421                                  ;   14   100 printName
 11422                                  ;   15   110 prc
 11423                                  ;   16   114 strlen
 11424                                  ;   17   121 error1
 11425                                  ;   18   128 fgets1
 11426                                  ;   19   135 getlex
 11427                                  ;   20   142 istoken
 11428                                  ;   21   150 prs
 11429                                  ;   22   154 listproc
 11430                                  ;   23   163 prs
 11431                                  ;   24   167 pint1
 11432                                  ;   25   173 error1
 11433                                  ;   26   180 eprc
 11434                                  ;   27   185 writetty
 11435                                  ;   28   194 writetty
 11436                                  ;   29   203 fputcR
 11437                                  ;   30   210 prc
 11438                                  ;   31   214 prs
 11439                                  ;   32   218 prc
 11440                                  ;   33   222 eprc
 11441                                  ;   34   227 mkneg
 11442                                  ;   35   233 eprnum
 11443                                  ;   36   240 eprc
 11444                                  ;   37   245 prc
 11445                                  ;   38   249 mkneg
 11446                                  ;   39   255 pint1
 11447                                  ;   40   261 prc
 11448                                  ;   41   265 prunsign1
 11449                                  ;   42   275 prc
 11450                                  ;   43   279 prc
 11451                                  ;   44   283 prc
 11452                                  ;   45   287 prc
 11453                                  ;   46   291 prc
 11454                                  ;   47   295 prunsign1
 11455                                  ;   48   305 error1
 11456                                  ;   49   312 error1
 11457                                  ;   50   319 checknamelen
 11458                                  ;   51   332 checkName
 11459                                  ;   52   342 error1
 11460                                  ;   53   349 istoken
 11461                                  ;   54   357 istoken
 11462                                  ;   55   365 prs
 11463                                  ;   56   369 prunsign1
 11464                                  ;   57   379 prs
 11465                                  ;   58   383 prs
 11466                                  ;   59   387 prs
 11467                                  ;   60   391 prs
 11468                                  ;   61   395 prs
 11469                                  ;   62   399 prunsign1
 11470                                  ;   63   409 prs
 11471                                  ;   64   413 expect
 11472                                  ;   65   420 expect
 11473                                  ;   66   427 error1
 11474                                  ;   67   434 prs
 11475                                  ;   68   438 prs
 11476                                  ;   69   442 prs
 11477                                  ;   70   446 strcpy
 11478                                  ;   71   453 expect
 11479                                  ;   72   460 istoken
 11480                                  ;   73   468 prc
 11481                                  ;   74   472 prscomment
 11482                                  ;   75   483 prc
 11483                                  ;   76   487 prs
 11484                                  ;   77   491 strlen
 11485                                  ;   78   498 istoken
 11486                                  ;   79   506 prc
 11487                                  ;   80   510 expect
 11488                                  ;   81   517 prunsign1
 11489                                  ;   82   527 istoken
 11490                                  ;   83   535 expect
 11491                                  ;   84   542 error1
 11492                                  ;   85   549 prs
 11493                                  ;   86   553 prs
 11494                                  ;   87   557 prs
 11495                                  ;   88   561 prs
 11496                                  ;   89   565 prs
 11497                                  ;   90   569 prs
 11498                                  ;   91   573 istoken
 11499                                  ;   92   581 prc
 11500                                  ;   93   585 istoken
 11501                                  ;   94   593 expect
 11502                                  ;   95   600 prunsign1
 11503                                  ;   96   610 prunsign1
 11504                                  ;   97   620 adrofname
 11505                                  ;   98   630 strcpy
 11506                                  ;   99   637 strcpy
 11507                                  ;  100   644 expect
 11508                                  ;  101   651 adrF
 11509                                  ;  102   656 adrofname
 11510                                  ;  103   666 prs
 11511                                  ;  104   670 prs
 11512                                  ;  105   674 prc
 11513                                  ;  106   678 pint1
 11514                                  ;  107   684 prc
 11515                                  ;  108   688 checkName
 11516                                  ;  109   698 error1
 11517                                  ;  110   705 adrofname
 11518                                  ;  111   715 eqstr
 11519                                  ;  112   721 adrofname
 11520                                  ;  113   731 eqstr
 11521                                  ;  114   737 istoken
 11522                                  ;  115   745 istoken
 11523                                  ;  116   753 istoken
 11524                                  ;  117   761 istoken
 11525                                  ;  118   769 istoken
 11526                                  ;  119   777 istoken
 11527                                  ;  120   785 istoken
 11528                                  ;  121   793 istoken
 11529                                  ;  122   801 name1
 11530                                  ;  123   807 error1
 11531                                  ;  124   814 getlex
 11532                                  ;  125   821 error1
 11533                                  ;  126   828 error1
 11534                                  ;  127   835 strlen
 11535                                  ;  128   842 to_far
 11536                                  ;  129   849 error1
 11537                                  ;  130   856 adrF
 11538                                  ;  131   861 strcpy
 11539                                  ;  132   868 error1
 11540                                  ;  133   875 checkName
 11541                                  ;  134   885 error1
 11542                                  ;  135   892 adrF
 11543                                  ;  136   897 strcpy
 11544                                  ;  137   904 adrF
 11545                                  ;  138   909 eqstr
 11546                                  ;  139   915 checknamelen
 11547                                  ;  140   928 strcpy
 11548                                  ;  141   935 checkFunction
 11549                                  ;  142   949 error1
 11550                                  ;  143   956 storefunc
 11551                                  ;  144   966 prs
 11552                                  ;  145   970 prs
 11553                                  ;  146   974 prs
 11554                                  ;  147   978 expect
 11555                                  ;  148   985 istoken
 11556                                  ;  149   993 typeName
 11557                                  ;  150  1002 addlocal
 11558                                  ;  151  1011 istoken
 11559                                  ;  152  1019 expect
 11560                                  ;  153  1026 expect
 11561                                  ;  154  1033 isvariable
 11562                                  ;  155  1044 typeName
 11563                                  ;  156  1053 checknamelen
 11564                                  ;  157  1066 addlocal
 11565                                  ;  158  1075 istoken
 11566                                  ;  159  1083 expect
 11567                                  ;  160  1090 expect
 11568                                  ;  161  1097 istoken
 11569                                  ;  162  1105 expect
 11570                                  ;  163  1112 listproc
 11571                                  ;  164  1121 prs
 11572                                  ;  165  1125 mkneg
 11573                                  ;  166  1131 prunsign1
 11574                                  ;  167  1141 prs
 11575                                  ;  168  1145 istoken
 11576                                  ;  169  1153 stmt
 11577                                  ;  170  1158 prs
 11578                                  ;  171  1162 prs
 11579                                  ;  172  1166 prc
 11580                                  ;  173  1170 prs
 11581                                  ;  174  1174 prs
 11582                                  ;  175  1178 prs
 11583                                  ;  176  1182 strlen
 11584                                  ;  177  1189 strcpy
 11585                                  ;  178  1196 prs
 11586                                  ;  179  1200 expect
 11587                                  ;  180  1207 eqstr
 11588                                  ;  181  1213 constantexpr
 11589                                  ;  182  1226 checkreg
 11590                                  ;  183  1235 doreg1
 11591                                  ;  184  1242 expr
 11592                                  ;  185  1247 prs
 11593                                  ;  186  1251 prs
 11594                                  ;  187  1255 expect
 11595                                  ;  188  1262 getlex
 11596                                  ;  189  1269 typeName
 11597                                  ;  190  1278 searchname
 11598                                  ;  191  1289 gettypes
 11599                                  ;  192  1298 isrelational
 11600                                  ;  193  1311 error1
 11601                                  ;  194  1318 expect
 11602                                  ;  195  1325 prs
 11603                                  ;  196  1329 prs
 11604                                  ;  197  1333 gettypes
 11605                                  ;  198  1342 prs
 11606                                  ;  199  1346 prs
 11607                                  ;  200  1350 v
 11608                                  ;  201  1352 prs
 11609                                  ;  202  1356 prunsign1
 11610                                  ;  203  1366 cmpneg
 11611                                  ;  204  1373 prs
 11612                                  ;  205  1377 expect
 11613                                  ;  206  1384 istoken
 11614                                  ;  207  1392 strcpy
 11615                                  ;  208  1399 istoken
 11616                                  ;  209  1407 strcpy
 11617                                  ;  210  1414 istoken
 11618                                  ;  211  1422 strcpy
 11619                                  ;  212  1429 istoken
 11620                                  ;  213  1437 strcpy
 11621                                  ;  214  1444 istoken
 11622                                  ;  215  1452 strcpy
 11623                                  ;  216  1459 istoken
 11624                                  ;  217  1467 strcpy
 11625                                  ;  218  1474 istoken
 11626                                  ;  219  1482 strcpy
 11627                                  ;  220  1489 getlex
 11628                                  ;  221  1496 isrelational
 11629                                  ;  222  1509 error1
 11630                                  ;  223  1516 strcpy
 11631                                  ;  224  1523 prnl
 11632                                  ;  225  1528 prs
 11633                                  ;  226  1532 prs
 11634                                  ;  227  1536 printreg
 11635                                  ;  228  1545 prs
 11636                                  ;  229  1549 istoken
 11637                                  ;  230  1557 prunsign1
 11638                                  ;  231  1567 typeName
 11639                                  ;  232  1576 checkreg
 11640                                  ;  233  1585 printreg
 11641                                  ;  234  1594 searchname
 11642                                  ;  235  1605 a
 11643                                  ;  236  1607 v
 11644                                  ;  237  1609 cmpneg
 11645                                  ;  238  1616 prs
 11646                                  ;  239  1620 expect
 11647                                  ;  240  1627 strlen
 11648                                  ;  241  1634 eqstr
 11649                                  ;  242  1640 eqstr
 11650                                  ;  243  1646 eqstr
 11651                                  ;  244  1652 eqstr
 11652                                  ;  245  1658 eqstr
 11653                                  ;  246  1664 eqstr
 11654                                  ;  247  1670 eqstr
 11655                                  ;  248  1676 eqstr
 11656                                  ;  249  1682 eqstr
 11657                                  ;  250  1688 eqstr
 11658                                  ;  251  1694 eqstr
 11659                                  ;  252  1700 eqstr
 11660                                  ;  253  1706 eqstr
 11661                                  ;  254  1712 eqstr
 11662                                  ;  255  1718 eqstr
 11663                                  ;  256  1724 eqstr
 11664                                  ;  257  1730 eqstr
 11665                                  ;  258  1736 eqstr
 11666                                  ;  259  1742 eqstr
 11667                                  ;  260  1748 eqstr
 11668                                  ;  261  1754 eqstr
 11669                                  ;  262  1760 eqstr
 11670                                  ;  263  1766 strlen
 11671                                  ;  264  1773 eqstr
 11672                                  ;  265  1779 eqstr
 11673                                  ;  266  1785 eqstr
 11674                                  ;  267  1791 eqstr
 11675                                  ;  268  1797 eqstr
 11676                                  ;  269  1803 eqstr
 11677                                  ;  270  1809 eqstr
 11678                                  ;  271  1815 eqstr
 11679                                  ;  272  1821 eqstr
 11680                                  ;  273  1827 prc
 11681                                  ;  274  1831 prc
 11682                                  ;  275  1835 prc
 11683                                  ;  276  1839 istoken
 11684                                  ;  277  1847 prs
 11685                                  ;  278  1851 prunsign1
 11686                                  ;  279  1861 typeName
 11687                                  ;  280  1870 checkreg
 11688                                  ;  281  1879 doreg1
 11689                                  ;  282  1886 docall1
 11690                                  ;  283  1894 isreg
 11691                                  ;  284  1900 searchname
 11692                                  ;  285  1911 gettypes
 11693                                  ;  286  1920 istoken
 11694                                  ;  287  1928 istoken
 11695                                  ;  288  1936 expect
 11696                                  ;  289  1943 searchname
 11697                                  ;  290  1954 expect
 11698                                  ;  291  1961 expect
 11699                                  ;  292  1968 gettypes
 11700                                  ;  293  1977 error1
 11701                                  ;  294  1984 istoken
 11702                                  ;  295  1992 error1
 11703                                  ;  296  1999 prs
 11704                                  ;  297  2003 prs
 11705                                  ;  298  2007 prs
 11706                                  ;  299  2011 v
 11707                                  ;  300  2013 istoken
 11708                                  ;  301  2021 error1
 11709                                  ;  302  2028 prs
 11710                                  ;  303  2032 prs
 11711                                  ;  304  2036 prs
 11712                                  ;  305  2040 v
 11713                                  ;  306  2042 istoken
 11714                                  ;  307  2050 compoundass
 11715                                  ;  308  2062 istoken
 11716                                  ;  309  2070 compoundass
 11717                                  ;  310  2082 istoken
 11718                                  ;  311  2090 compoundass
 11719                                  ;  312  2102 istoken
 11720                                  ;  313  2110 compoundass
 11721                                  ;  314  2122 istoken
 11722                                  ;  315  2130 error1
 11723                                  ;  316  2137 istoken
 11724                                  ;  317  2145 error1
 11725                                  ;  318  2152 istoken
 11726                                  ;  319  2160 expr
 11727                                  ;  320  2165 doassign
 11728                                  ;  321  2174 dovar1
 11729                                  ;  322  2181 istoken
 11730                                  ;  323  2189 rterm
 11731                                  ;  324  2195 istoken
 11732                                  ;  325  2203 rterm
 11733                                  ;  326  2209 istoken
 11734                                  ;  327  2217 rterm
 11735                                  ;  328  2223 istoken
 11736                                  ;  329  2231 rterm
 11737                                  ;  330  2237 istoken
 11738                                  ;  331  2245 rterm
 11739                                  ;  332  2251 istoken
 11740                                  ;  333  2259 rterm
 11741                                  ;  334  2265 istoken
 11742                                  ;  335  2273 domul
 11743                                  ;  336  2279 istoken
 11744                                  ;  337  2287 doidiv
 11745                                  ;  338  2294 istoken
 11746                                  ;  339  2302 domod
 11747                                  ;  340  2308 isrelational
 11748                                  ;  341  2321 rterm
 11749                                  ;  342  2327 cmpneg
 11750                                  ;  343  2334 error1
 11751                                  ;  344  2341 prnl
 11752                                  ;  345  2346 prs
 11753                                  ;  346  2350 prs
 11754                                  ;  347  2354 gettypes
 11755                                  ;  348  2363 prs
 11756                                  ;  349  2367 prs
 11757                                  ;  350  2371 v
 11758                                  ;  351  2373 prs
 11759                                  ;  352  2377 expect
 11760                                  ;  353  2384 prunsign1
 11761                                  ;  354  2394 gettypes
 11762                                  ;  355  2403 prs
 11763                                  ;  356  2407 v
 11764                                  ;  357  2409 prnl
 11765                                  ;  358  2414 prs
 11766                                  ;  359  2418 prs
 11767                                  ;  360  2422 prs
 11768                                  ;  361  2426 prnl
 11769                                  ;  362  2431 prs
 11770                                  ;  363  2435 prs
 11771                                  ;  364  2439 a
 11772                                  ;  365  2441 prs
 11773                                  ;  366  2445 v
 11774                                  ;  367  2447 prs
 11775                                  ;  368  2451 prs
 11776                                  ;  369  2455 prs
 11777                                  ;  370  2459 prs
 11778                                  ;  371  2463 prs
 11779                                  ;  372  2467 prc
 11780                                  ;  373  2471 printName
 11781                                  ;  374  2481 prs
 11782                                  ;  375  2485 prnl
 11783                                  ;  376  2490 prs
 11784                                  ;  377  2494 prs
 11785                                  ;  378  2498 prs
 11786                                  ;  379  2502 prs
 11787                                  ;  380  2506 v
 11788                                  ;  381  2508 istoken
 11789                                  ;  382  2516 prnl
 11790                                  ;  383  2521 prs
 11791                                  ;  384  2525 prs
 11792                                  ;  385  2529 prs
 11793                                  ;  386  2533 prs
 11794                                  ;  387  2537 prunsign1
 11795                                  ;  388  2547 typeName
 11796                                  ;  389  2556 searchname
 11797                                  ;  390  2567 istoken
 11798                                  ;  391  2575 searchname
 11799                                  ;  392  2586 expect
 11800                                  ;  393  2593 expect
 11801                                  ;  394  2600 gettypes
 11802                                  ;  395  2609 error1
 11803                                  ;  396  2616 eqstr
 11804                                  ;  397  2622 dovar1
 11805                                  ;  398  2629 eqstr
 11806                                  ;  399  2635 doreg
 11807                                  ;  400  2641 eqstr
 11808                                  ;  401  2647 doreg
 11809                                  ;  402  2653 eqstr
 11810                                  ;  403  2659 doreg
 11811                                  ;  404  2665 eqstr
 11812                                  ;  405  2671 doreg
 11813                                  ;  406  2677 eqstr
 11814                                  ;  407  2683 doreg
 11815                                  ;  408  2689 eqstr
 11816                                  ;  409  2695 doreg
 11817                                  ;  410  2701 eqstr
 11818                                  ;  411  2707 doreg
 11819                                  ;  412  2713 eqstr
 11820                                  ;  413  2719 doreg
 11821                                  ;  414  2725 eqstr
 11822                                  ;  415  2731 doreg
 11823                                  ;  416  2737 eqstr
 11824                                  ;  417  2743 doreg
 11825                                  ;  418  2749 eqstr
 11826                                  ;  419  2755 doreg
 11827                                  ;  420  2761 eqstr
 11828                                  ;  421  2767 doreg
 11829                                  ;  422  2773 eqstr
 11830                                  ;  423  2779 doreg
 11831                                  ;  424  2785 eqstr
 11832                                  ;  425  2791 doreg
 11833                                  ;  426  2797 eqstr
 11834                                  ;  427  2803 doreg
 11835                                  ;  428  2809 expect
 11836                                  ;  429  2816 prs
 11837                                  ;  430  2820 prs
 11838                                  ;  431  2824 prs
 11839                                  ;  432  2828 istoken
 11840                                  ;  433  2836 prunsign1
 11841                                  ;  434  2846 istoken
 11842                                  ;  435  2854 searchname
 11843                                  ;  436  2865 v
 11844                                  ;  437  2867 error1
 11845                                  ;  438  2874 gettypes
 11846                                  ;  439  2883 prs
 11847                                  ;  440  2887 v
 11848                                  ;  441  2889 prs
 11849                                  ;  442  2893 prs
 11850                                  ;  443  2897 prs
 11851                                  ;  444  2901 a
 11852                                  ;  445  2903 prs
 11853                                  ;  446  2907 prs
 11854                                  ;  447  2911 prunsign1
 11855                                  ;  448  2921 v
 11856                                  ;  449  2923 prs
 11857                                  ;  450  2927 prs
 11858                                  ;  451  2931 printName
 11859                                  ;  452  2941 prs
 11860                                  ;  453  2945 prs
 11861                                  ;  454  2949 prs
 11862                                  ;  455  2953 prs
 11863                                  ;  456  2957 v
 11864                                  ;  457  2959 prs
 11865                                  ;  458  2963 prs
 11866                                  ;  459  2967 prs
 11867                                  ;  460  2971 v
 11868                                  ;  461  2973 prs
 11869                                  ;  462  2977 prs
 11870                                  ;  463  2981 prs
 11871                                  ;  464  2985 v
 11872                                  ;  465  2987 prs
 11873                                  ;  466  2991 rterm
 11874                                  ;  467  2997 istoken
 11875                                  ;  468  3005 prs
 11876                                  ;  469  3009 prunsign1
 11877                                  ;  470  3019 prs
 11878                                  ;  471  3023 error1
 11879                                  ;  472  3030 istoken
 11880                                  ;  473  3038 prs
 11881                                  ;  474  3042 prunsign1
 11882                                  ;  475  3052 prs
 11883                                  ;  476  3056 prs
 11884                                  ;  477  3060 typeName
 11885                                  ;  478  3069 searchname
 11886                                  ;  479  3080 error1
 11887                                  ;  480  3087 gettypes
 11888                                  ;  481  3096 error1
 11889                                  ;  482  3103 error1
 11890                                  ;  483  3110 prs
 11891                                  ;  484  3114 v
 11892                                  ;  485  3116 prs
 11893                                  ;  486  3120 prs
 11894                                  ;  487  3124 doidiv
 11895                                  ;  488  3131 prs
 11896                                  ;  489  3135 checknamelen
 11897                                  ;  490  3148 strcpy
 11898                                  ;  491  3155 storecall
 11899                                  ;  492  3165 expect
 11900                                  ;  493  3172 istoken
 11901                                  ;  494  3180 error1
 11902                                  ;  495  3187 istoken
 11903                                  ;  496  3195 istoken
 11904                                  ;  497  3203 eprs
 11905                                  ;  498  3208 eprs
 11906                                  ;  499  3213 eprc
 11907                                  ;  500  3218 eprnum
 11908                                  ;  501  3225 eprs
 11909                                  ;  502  3230 eprc
 11910                                  ;  503  3235 eprs
 11911                                  ;  504  3240 eprc
 11912                                  ;  505  3245 eprs
 11913                                  ;  506  3250 istoken
 11914                                  ;  507  3258 name1
 11915                                  ;  508  3264 searchname
 11916                                  ;  509  3275 istoken
 11917                                  ;  510  3283 checkreg
 11918                                  ;  511  3292 searchname
 11919                                  ;  512  3303 error1
 11920                                  ;  513  3310 istoken
 11921                                  ;  514  3318 expect
 11922                                  ;  515  3325 prs
 11923                                  ;  516  3329 prunsign1
 11924                                  ;  517  3339 prs
 11925                                  ;  518  3343 prs
 11926                                  ;  519  3347 prc
 11927                                  ;  520  3351 prunsign1
 11928                                  ;  521  3361 prs
 11929                                  ;  522  3365 v
 11930                                  ;  523  3367 prs
 11931                                  ;  524  3371 gettypes
 11932                                  ;  525  3380 prs
 11933                                  ;  526  3384 v
 11934                                  ;  527  3386 prs
 11935                                  ;  528  3390 v
 11936                                  ;  529  3392 prs
 11937                                  ;  530  3396 prs
 11938                                  ;  531  3400 printreg
 11939                                  ;  532  3409 prs
 11940                                  ;  533  3413 prs
 11941                                  ;  534  3417 prs
 11942                                  ;  535  3421 prunsign1
 11943                                  ;  536  3431 prs
 11944                                  ;  537  3435 getlex
 11945                                  ;  538  3442 prunsign1
 11946                                  ;  539  3452 getlex
 11947                                  ;  540  3459 prc
 11948                                  ;  541  3463 expect
 11949                                  ;  542  3470 prs
 11950                                  ;  543  3474 prs
 11951                                  ;  544  3478 prs
 11952                                  ;  545  3482 prs
 11953                                  ;  546  3486 prs
 11954                                  ;  547  3490 prunsign1
 11955                                  ;  548  3500 prs
 11956                                  ;  549  3504 prs
 11957                                  ;  550  3508 prunsign1
 11958                                  ;  551  3518 prs
 11959                                  ;  552  3522 prs
 11960                                  ;  553  3526 prs
 11961                                  ;  554  3530 error1
 11962                                  ;  555  3537 prs
 11963                                  ;  556  3541 prs
 11964                                  ;  557  3545 prunsign1
 11965                                  ;  558  3555 prc
 11966                                  ;  559  3559 prs
 11967                                  ;  560  3563 prs
 11968                                  ;  561  3567 prunsign1
 11969                                  ;  562  3577 pexpr
 11970                                  ;  563  3583 pint1
 11971                                  ;  564  3589 stmt
 11972                                  ;  565  3594 istoken
 11973                                  ;  566  3602 prjump
 11974                                  ;  567  3609 prlabel
 11975                                  ;  568  3617 stmt
 11976                                  ;  569  3622 prlabel
 11977                                  ;  570  3630 prlabel
 11978                                  ;  571  3638 prlabel
 11979                                  ;  572  3646 stmt
 11980                                  ;  573  3651 expect
 11981                                  ;  574  3658 pexpr
 11982                                  ;  575  3664 pint1
 11983                                  ;  576  3670 prjump
 11984                                  ;  577  3677 prlabel
 11985                                  ;  578  3685 prlabel
 11986                                  ;  579  3693 pexpr
 11987                                  ;  580  3699 pint1
 11988                                  ;  581  3705 stmt
 11989                                  ;  582  3710 prjump
 11990                                  ;  583  3717 prlabel
 11991                                  ;  584  3725 getlex
 11992                                  ;  585  3732 next
 11993                                  ;  586  3737 next
 11994                                  ;  587  3742 next
 11995                                  ;  588  3747 next
 11996                                  ;  589  3752 next
 11997                                  ;  590  3757 next
 11998                                  ;  591  3762 next
 11999                                  ;  592  3767 next
 12000                                  ;  593  3772 next
 12001                                  ;  594  3777 next
 12002                                  ;  595  3782 next
 12003                                  ;  596  3787 next
 12004                                  ;  597  3792 next
 12005                                  ;  598  3797 next
 12006                                  ;  599  3802 next
 12007                                  ;  600  3807 instr1
 12008                                  ;  601  3814 next
 12009                                  ;  602  3819 ifEOL
 12010                                  ;  603  3825 getlex
 12011                                  ;  604  3832 next
 12012                                  ;  605  3837 next
 12013                                  ;  606  3842 getlex
 12014                                  ;  607  3849 getstring
 12015                                  ;  608  3859 digit
 12016                                  ;  609  3865 getdigit
 12017                                  ;  610  3874 next
 12018                                  ;  611  3879 next
 12019                                  ;  612  3884 next
 12020                                  ;  613  3889 alnum
 12021                                  ;  614  3895 strcpy
 12022                                  ;  615  3902 alnum
 12023                                  ;  616  3908 next
 12024                                  ;  617  3913 eqstr
 12025                                  ;  618  3919 eqstr
 12026                                  ;  619  3925 eqstr
 12027                                  ;  620  3931 eqstr
 12028                                  ;  621  3937 eqstr
 12029                                  ;  622  3943 eqstr
 12030                                  ;  623  3949 eqstr
 12031                                  ;  624  3955 eqstr
 12032                                  ;  625  3961 eqstr
 12033                                  ;  626  3967 eqstr
 12034                                  ;  627  3973 eqstr
 12035                                  ;  628  3979 eqstr
 12036                                  ;  629  3985 eqstr
 12037                                  ;  630  3991 eqstr
 12038                                  ;  631  3997 eqstr
 12039                                  ;  632  4003 eqstr
 12040                                  ;  633  4009 convertdefine
 12041                                  ;  634  4023 strcpy
 12042                                  ;  635  4030 error1
 12043                                  ;  636  4037 adrofname
 12044                                  ;  637  4047 eqstr
 12045                                  ;  638  4053 next
 12046                                  ;  639  4058 alnum
 12047                                  ;  640  4064 next
 12048                                  ;  641  4069 digit
 12049                                  ;  642  4075 next
 12050                                  ;  643  4080 istoken
 12051                                  ;  644  4088 istoken
 12052                                  ;  645  4096 stmt
 12053                                  ;  646  4101 istoken
 12054                                  ;  647  4109 doif
 12055                                  ;  648  4114 istoken
 12056                                  ;  649  4122 dodo
 12057                                  ;  650  4127 istoken
 12058                                  ;  651  4135 dowhile
 12059                                  ;  652  4143 istoken
 12060                                  ;  653  4151 prs
 12061                                  ;  654  4155 name1
 12062                                  ;  655  4161 prs
 12063                                  ;  656  4165 expect
 12064                                  ;  657  4172 prs
 12065                                  ;  658  4176 next
 12066                                  ;  659  4181 prc
 12067                                  ;  660  4185 next
 12068                                  ;  661  4190 getlex
 12069                                  ;  662  4197 istoken
 12070                                  ;  663  4205 prs
 12071                                  ;  664  4209 next
 12072                                  ;  665  4214 prc
 12073                                  ;  666  4218 next
 12074                                  ;  667  4223 getlex
 12075                                  ;  668  4230 error1
 12076                                  ;  669  4237 istoken
 12077                                  ;  670  4245 doemit
 12078                                  ;  671  4252 istoken
 12079                                  ;  672  4260 istoken
 12080                                  ;  673  4268 expr
 12081                                  ;  674  4273 prs
 12082                                  ;  675  4277 prs
 12083                                  ;  676  4281 expect
 12084                                  ;  677  4288 prs
 12085                                  ;  678  4292 prs
 12086                                  ;  679  4296 prc
 12087                                  ;  680  4300 expect
 12088                                  ;  681  4307 expect
 12089                                  ;  682  4314 expr
 12090                                  ;  683  4319 expect
 12091                                  ;  684  4326 next
 12092                                  ;  685  4331 next
 12093                                  ;  686  4336 printinputline
 12094                                  ;  687  4351 readRL
 12095                                  ;  688  4358 error1
 12096                                  ;  689  4365 prs
 12097                                  ;  690  4369 prunsign1
 12098                                  ;  691  4379 prc
 12099                                  ;  692  4383 prscomment
 12100                                  ;  693  4394 next
 12101                                  ;  694  4399 fcloseR
 12102                                  ;  695  4407 fcloseR
 12103                                  ;  696  4415 exitR
 12104                                  ;  697  4421 prnl
 12105                                  ;  698  4426 prscomment
 12106                                  ;  699  4437 prs
 12107                                  ;  700  4441 prunsign1
 12108                                  ;  701  4451 prs
 12109                                  ;  702  4455 prs
 12110                                  ;  703  4459 prs
 12111                                  ;  704  4463 prunsign1
 12112                                  ;  705  4473 prs
 12113                                  ;  706  4477 prunsign1
 12114                                  ;  707  4487 prs
 12115                                  ;  708  4491 prs
 12116                                  ;  709  4495 end1
 12117                                  ;  710  4500 prs
 12118                                  ;  711  4504 prs
 12119                                  ;  712  4508 prs
 12120                                  ;  713  4512 prunsign1
 12121                                  ;  714  4522 prs
 12122                                  ;  715  4526 prs
 12123                                  ;  716  4530 listvar
 12124                                  ;  717  4538 prs
 12125                                  ;  718  4542 calllisting
 12126                                  ;  719  4554 prs
 12127                                  ;  720  4558 printint51
 12128                                  ;  721  4569 prc
 12129                                  ;  722  4573 prs
 12130                                  ;  723  4577 printint51
 12131                                  ;  724  4588 prc
 12132                                  ;  725  4592 from_far
 12133                                  ;  726  4601 prs
 12134                                  ;  727  4605 adrF
 12135                                  ;  728  4610 from_far
 12136                                  ;  729  4619 eqstr
 12137                                  ;  730  4625 prs
 12138                                  ;  731  4629 countcalls
 12139                                  ;  732  4640 funclisting
 12140                                  ;  733  4652 prs
 12141                                  ;  734  4656 printint51
 12142                                  ;  735  4667 printint51
 12143                                  ;  736  4678 prs
 12144                                  ;  737  4682 printint51
 12145                                  ;  738  4693 prc
 12146                                  ;  739  4697 prs
 12147                                  ;  740  4701 prs
 12148                                  ;  741  4705 prs
 12149                                  ;  742  4709 prs
 12150                                  ;  743  4713 prc
 12151                                  ;  744  4717 prc
 12152                                  ;  745  4721 adrF
 12153                                  ;  746  4726 prs
 12154                                  ;  747  4730 prs
 12155                                  ;  748  4734 printint51
 12156                                  ;  749  4745 prc
 12157                                  ;  750  4749 prs
 12158                                  ;  751  4753 prs
 12159                                  ;  752  4757 prs
 12160                                  ;  753  4761 prs
 12161                                  ;  754  4765 prs
 12162                                  ;  755  4769 prs
 12163                                  ;  756  4773 prs
 12164                                  ;  757  4777 prs
 12165                                  ;  758  4781 prs
 12166                                  ;  759  4785 printint51
 12167                                  ;  760  4796 printint51
 12168                                  ;  761  4807 prs
 12169                                  ;  762  4811 prs
 12170                                  ;  763  4815 prc
 12171                                  ;  764  4819 adrofname
 12172                                  ;  765  4829 prs
 12173                                  ;  766  4833 prc
 12174                                  ;  767  4837 prunsign1
 12175                                  ;  768  4847 prc
 12176                                  ;  769  4851 prunsign1
 12177                                  ;  770  4861 prc
 12178                                  ;  771  4865 prs
 12179                                  ;  772  4869 prc
 12180                                  ;  773  4873 pint1
 12181                                  ;  774  4879 prs
 12182                                  ;  775  4883 prs
 12183                                  ;  776  4887 listvar
 12184                                  ;  777  4895 listfunc
 12185                                  ;  778  4904 listcall
 12186                                  ;  779  4913 prs
 12187                                  ;  780  4917 prs
 12188                                  ;  781  4921 prs
 12189                                  ;  782  4925 prs
 12190                                  ;  783  4929 prs
 12191                                  ;  784  4933 printint51
 12192                                  ;  785  4944 prs
 12193                                  ;  786  4948 printint51
 12194                                  ;  787  4959 prs
 12195                                  ;  788  4963 printint51
 12196                                  ;  789  4974 prs
 12197                                  ;  790  4978 printint51
 12198                                  ;  791  4989 prs
 12199                                  ;  792  4993 printint51
 12200                                  ;  793  5004 prs
 12201                                  ;  794  5008 printint51
 12202                                  ;  795  5019 prs
 12203                                  ;  796  5023 printint51
 12204                                  ;  797  5034 prs
 12205                                  ;  798  5038 printint51
 12206                                  ;  799  5049 prs
 12207                                  ;  800  5053 prs
 12208                                  ;  801  5057 prs
 12209                                  ;  802  5061 printint51
 12210                                  ;  803  5072 prs
 12211                                  ;  804  5076 printint51
 12212                                  ;  805  5087 prs
 12213                                  ;  806  5091 prs
 12214                                  ;  807  5095 printint51
 12215                                  ;  808  5106 prs
 12216                                  ;  809  5110 end1
 12217                                  ;  810  5115 prs
 12218                                  ;  811  5119 from_far
 12219                                  ;  812  5128 adrF
 12220                                  ;  813  5133 eqstr
 12221                                  ;  814  5139 prs
 12222                                  ;  815  5143 prs
 12223                                  ;  816  5147 prs
 12224                                  ;  817  5151 printint51
 12225                                  ;  818  5162 error1
 12226                                  ;  819  5169 prs
 12227                                  ;  820  5173 eqstr
 12228                                  ;  821  5179 getlex
 12229                                  ;  822  5186 expect
 12230                                  ;  823  5193 error1
 12231                                  ;  824  5200 strlen
 12232                                  ;  825  5207 error1
 12233                                  ;  826  5214 adrofname
 12234                                  ;  827  5224 strcpy
 12235                                  ;  828  5231 expect
 12236                                  ;  829  5238 getlex
 12237                                  ;  830  5245 istoken
 12238                                  ;  831  5253 istoken
 12239                                  ;  832  5261 dodefine
 12240                                  ;  833  5270 error1
 12241                                  ;  834  5277 typeName
 12242                                  ;  835  5286 dofunc
 12243                                  ;  836  5293 doglob
 12244                                  ;  837  5300 fgets1
 12245                                  ;  838  5307 cputs
 12246                                  ;  839  5313 cputs
 12247                                  ;  840  5319 exitR
 12248                                  ;  841  5325 toupper
 12249                                  ;  842  5333 strcpy
 12250                                  ;  843  5340 instr1
 12251                                  ;  844  5347 strcat1
 12252                                  ;  845  5355 strcpy
 12253                                  ;  846  5362 strlen
 12254                                  ;  847  5369 openR
 12255                                  ;  848  5375 cputs
 12256                                  ;  849  5381 cputs
 12257                                  ;  850  5387 exitR
 12258                                  ;  851  5393 creatR
 12259                                  ;  852  5400 cputs
 12260                                  ;  853  5406 cputs
 12261                                  ;  854  5412 exitR
 12262                                  ;  855  5418 prs
 12263                                  ;  856  5422 prs
 12264                                  ;  857  5426 prs
 12265                                  ;  858  5430 prs
 12266                                  ;  859  5434 prs
 12267                                  ;  860  5438 prs
 12268                                  ;  861  5442 prs
 12269                                  ;  862  5446 DosInt
 12270                                  ;  863  5453 getarg
 12271                                  ;  864  5460 setblock
 12272                                  ;  865  5469 error1
 12273                                  ;  866  5476 allocmem
 12274                                  ;  867  5485 error1
 12275                                  ;  868  5492 getfirstchar
 12276                                  ;  869  5505 parse
 12277                                  ;  870  5511 checkcalls
 12278                                  ;  871  5522 epilog
 12279                                  ;  872  5529 DosInt
 12280                                  ;Input: A.C, List: A.S,  Lines: 1297
 12281                                  ;Glob. variables:  118 max.:  200
 12282                                  ;Functions      :  103 max.:  300
 12283                                  ;Calls          :  873 max.: 2000, NameField: 5536
 12284                                  ;Const in 'checkreg' :  712 max.: 2000, stacksize: 17987
