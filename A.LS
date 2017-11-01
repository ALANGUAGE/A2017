     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E94351                  jmp main
     5                                  
     6                                  ;-1 char Version1[]="A.COM V0.9.2";
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
    35                                  ;-10 #define _                // compare constants
    36                                  
    37                                  
    38                                  ;-11 #define T_NAME        256//the following defines for better clearity
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
   140                                  ;-45 
   141                                  
   142                                  
   143                                  ;-46 unsigned int ORGDATAORIG=25000;//start of arrays
   144                                  
   145 00000010 A861                    ORGDATAORIG dw 25000
   146                                  
   147                                  ;-47 unsigned int orgData;//actual max of array, must be less than stack
   148                                  
   149 00000012 0000                    orgData dw 0
   150                                  
   151                                  ;-48 #define COMAX        3000
   152                                  
   153                                  
   154                                  ;-49 char co[COMAX];//constant storage
   155                                  
   156                                  section .bss
   157                                  absolute 25000
   158 000061A8 <res 00000BB8>          co resb 3000
   159                                  section .text
   160                                  
   161                                  ;-50 int maxco=0;
   162                                  
   163 00000014 0000                    maxco dw 0
   164                                  
   165                                  ;-51 int maxco1=0;
   166                                  
   167 00000016 0000                    maxco1 dw 0
   168                                  
   169                                  ;-52 #define CMDLENMAX      67
   170                                  
   171                                  
   172                                  ;-53 char coname[CMDLENMAX];
   173                                  
   174                                  section .bss
   175                                  absolute 28000
   176 00006D60 <res 00000043>          coname resb 67
   177                                  section .text
   178                                  
   179                                  ;-54 char symbol[COLUMNMAX];
   180                                  
   181                                  section .bss
   182                                  absolute 28067
   183 00006DA3 <res 00000080>          symbol resb 128
   184                                  section .text
   185                                  
   186                                  ;-55 char fname[CMDLENMAX];
   187                                  
   188                                  section .bss
   189                                  absolute 28195
   190 00006E23 <res 00000043>          fname resb 67
   191                                  section .text
   192                                  
   193                                  ;-56 char namein[CMDLENMAX];
   194                                  
   195                                  section .bss
   196                                  absolute 28262
   197 00006E66 <res 00000043>          namein resb 67
   198                                  section .text
   199                                  
   200                                  ;-57 char namelst[CMDLENMAX];
   201                                  
   202                                  section .bss
   203                                  absolute 28329
   204 00006EA9 <res 00000043>          namelst resb 67
   205                                  section .text
   206                                  
   207                                  ;-58 char archivename[CMDLENMAX];
   208                                  
   209                                  section .bss
   210                                  absolute 28396
   211 00006EEC <res 00000043>          archivename resb 67
   212                                  section .text
   213                                  
   214                                  ;-59 char *cloc=0;
   215                                  
   216 00000018 0000                    cloc dw 0
   217                                  
   218                                  ;-60 int fdin=0;
   219                                  
   220 0000001A 0000                    fdin dw 0
   221                                  
   222                                  ;-61 int fdout=0;
   223                                  
   224 0000001C 0000                    fdout dw 0
   225                                  
   226                                  ;-62 int token=0;
   227                                  
   228 0000001E 0000                    token dw 0
   229                                  
   230                                  ;-63 char globC=0;
   231                                  
   232 00000020 00                      globC db 0
   233                                  
   234                                  ;-64 int column=0;
   235                                  
   236 00000021 0000                    column dw 0
   237                                  
   238                                  ;-65 char thechar=0;   //reads one char forward
   239                                  
   240 00000023 00                      thechar db 0
   241                                  
   242                                  ;-66 int iscmp=0;
   243                                  
   244 00000024 0000                    iscmp dw 0
   245                                  
   246                                  ;-67 int nconst=0;
   247                                  
   248 00000026 0000                    nconst dw 0
   249                                  
   250                                  ;-68 int nreturn=0;
   251                                  
   252 00000028 0000                    nreturn dw 0
   253                                  
   254                                  ;-69 int nlabel=0;
   255                                  
   256 0000002A 0000                    nlabel dw 0
   257                                  
   258                                  ;-70 int GTop=1;
   259                                  
   260 0000002C 0100                    GTop dw 1
   261                                  
   262                                  ;-71 int LTop=LSTART;
   263                                  
   264 0000002E C800                    LTop dw 200
   265                                  
   266                                  ;-72 unsigned int lexval=0;
   267                                  
   268 00000030 0000                    lexval dw 0
   269                                  
   270                                  ;-73 int typei;       char istype;
   271                                  
   272 00000032 0000                    typei dw 0
   273 00000034 00                      istype db 0
   274                                  
   275                                  ;-74 int signi;       char issign;
   276                                  
   277 00000035 0000                    signi dw 0
   278 00000037 00                      issign db 0
   279                                  
   280                                  ;-75 int widthi;      char iswidth;
   281                                  
   282 00000038 0000                    widthi dw 0
   283 0000003A 00                      iswidth db 0
   284                                  
   285                                  ;-76 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   286                                  
   287                                  section .bss
   288                                  absolute 28463
   289 00006F2F <res 0000012C>          GType resb 300
   290                                  section .text
   291                                  
   292                                  ;-77 char GSign [VARMAX]; // 0=U, 1=S
   293                                  
   294                                  section .bss
   295                                  absolute 28763
   296 0000705B <res 0000012C>          GSign resb 300
   297                                  section .text
   298                                  
   299                                  ;-78 char GWidth[VARMAX]; // 0, 1, 2, 4
   300                                  
   301                                  section .bss
   302                                  absolute 29063
   303 00007187 <res 0000012C>          GWidth resb 300
   304                                  section .text
   305                                  
   306                                  ;-79 int GAdr [VARMAX];
   307                                  
   308                                  section .bss
   309                                  absolute 29363
   310 000072B3 <res 00000258>          GAdr resw 300
   311                                  section .text
   312                                  
   313                                  ;-80 int GUsed[VARMAX];
   314                                  
   315                                  section .bss
   316                                  absolute 29963
   317 0000750B <res 00000258>          GUsed resw 300
   318                                  section .text
   319                                  
   320                                  ;-81 int GData[VARMAX];
   321                                  
   322                                  section .bss
   323                                  absolute 30563
   324 00007763 <res 00000258>          GData resw 300
   325                                  section .text
   326                                  
   327                                  ;-82 char GNameField[GNAMEMAX];
   328                                  
   329                                  section .bss
   330                                  absolute 31163
   331 000079BB <res 000012C0>          GNameField resb 4800
   332                                  section .text
   333                                  
   334                                  ;-83 int wi=0;
   335                                  
   336 0000003B 0000                    wi dw 0
   337                                  
   338                                  ;-84 int  FTop=0;
   339                                  
   340 0000003D 0000                    FTop dw 0
   341                                  
   342                                  ;-85 int  CTop=0;
   343                                  
   344 0000003F 0000                    CTop dw 0
   345                                  
   346                                  ;-86 char FType [FUNCMAX];
   347                                  
   348                                  section .bss
   349                                  absolute 35963
   350 00008C7B <res 0000012C>          FType resb 300
   351                                  section .text
   352                                  
   353                                  ;-87 char CType[CALLMAX];
   354                                  
   355                                  section .bss
   356                                  absolute 36263
   357 00008DA7 <res 000007D0>          CType resb 2000
   358                                  section .text
   359                                  
   360                                  ;-88 int  FAdr  [FUNCMAX];
   361                                  
   362                                  section .bss
   363                                  absolute 38263
   364 00009577 <res 00000258>          FAdr resw 300
   365                                  section .text
   366                                  
   367                                  ;-89 int  CAdr [CALLMAX];
   368                                  
   369                                  section .bss
   370                                  absolute 38863
   371 000097CF <res 00000FA0>          CAdr resw 2000
   372                                  section .text
   373                                  
   374                                  ;-90 int  FCalls[FUNCMAX];
   375                                  
   376                                  section .bss
   377                                  absolute 42863
   378 0000A76F <res 00000258>          FCalls resw 300
   379                                  section .text
   380                                  
   381                                  ;-91 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   382                                  
   383                                  section .bss
   384                                  absolute 43463
   385 0000A9C7 <res 000012C0>          FNameField resb 4800
   386                                  section .text
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
   398                                  absolute 48263
   399 0000BC87 <res 00000080>          fgetsdest resb 128
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
  1185 000003AF 8D06A36D                 lea  ax, [symbol]
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
  1197 000003CA E8F83F                   call error1
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
  1238 00000407 E84A3E                   call fgets1
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
  1269 00000423 E81F37                   call getlex
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
  1324 0000045F E82540                   call listproc
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
  1341 00000477 E84B3F                   call error1
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
  1973                                  absolute 48391
  1974 0000BD07 <res 0000000F>          doglobName resb 15
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
  1999 00000751 E8713C                   call error1
  2000 00000754 83C402                   add  sp, 2
  2001                                  
  2002                                  ;-322   if (iswidth == 0) error1("no VOID as var type");
  2003                                  
  2004                                  .doglob61:
  2005 00000757 A0[3A00]                 mov al, [iswidth]
  2006 0000075A 3C00                     cmp al, 0
  2007 0000075C 0F850900                 jne .doglob62
  2008 00000760 68[A10A]                 push doglob_1
  2009 00000763 E85F3C                   call error1
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
  2023 00000778 E84A3C                   call error1
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
  2062 000007BD 8D06A36D                 lea  ax, [symbol]
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
  2144 00000854 89876377                 mov [GData+bx], ax
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
  2163 00000877 E84B3B                   call error1
  2164 0000087A 83C402                   add  sp, 2
  2165                                  
  2166                                  ;-341       prs("\n"); prs(symbol); prs(" db ");
  2167                                  
  2168                                  .doglob72:
  2169 0000087D 68[270B]                 push doglob_10
  2170 00000880 E8C7FC                   call prs
  2171 00000883 83C402                   add  sp, 2
  2172 00000886 8D06A36D                 lea  ax, [symbol]
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
  2184 000008A0 8D06A36D                 lea  ax, [symbol]
  2185 000008A4 50                       push ax
  2186 000008A5 8D0607BD                 lea  ax, [doglobName]
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
  2210 000008CF 8D06A36D                 lea  ax, [symbol]
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
  2223 000008EB 8D06A36D                 lea  ax, [symbol]
  2224 000008EF 50                       push ax
  2225 000008F0 E832F9                   call strlen
  2226 000008F3 83C402                   add  sp, 2
  2227 000008F6 8946FE                   mov [bp-2], ax
  2228 000008F9 8B46FE                   mov ax, [bp-2]
  2229 000008FC 8B1E[2C00]               mov bx, [GTop]
  2230 00000900 D1E3                     shl bx, 1
  2231 00000902 89876377                 mov [GData+bx], ax
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
  2285 00000965 E85D3A                   call error1
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
  2304 00000977 8D06A36D                 lea  ax, [symbol]
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
  2394 00000A13 88875B70                 mov [GSign+bx], al
  2395 00000A17 A0[3A00]                 mov al, [iswidth]
  2396 00000A1A 8B1E[2C00]               mov bx, [GTop]
  2397 00000A1E 88878771                 mov [GWidth+bx], al
  2398 00000A22 A0[3400]                 mov al, [istype]
  2399 00000A25 8B1E[2C00]               mov bx, [GTop]
  2400 00000A29 88872F6F                 mov [GType+bx], al
  2401                                  
  2402                                  ;-364   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  2403                                  
  2404 00000A2D A1[6800]                 mov ax, [lineno]
  2405 00000A30 83E801                   sub ax, 1
  2406 00000A33 8B1E[2C00]               mov bx, [GTop]
  2407 00000A37 D1E3                     shl bx, 1
  2408 00000A39 8987B372                 mov [GAdr+bx], ax
  2409 00000A3D B80000                   mov ax, 0
  2410 00000A40 8B1E[2C00]               mov bx, [GTop]
  2411 00000A44 D1E3                     shl bx, 1
  2412 00000A46 89870B75                 mov [GUsed+bx], ax
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
  2426 00000A60 8D0607BD                 lea  ax, [doglobName]
  2427 00000A64 50                       push ax
  2428 00000A65 FF36[6C00]               push word [pt]
  2429 00000A69 E8E1F7                   call strcpy
  2430 00000A6C 83C404                   add  sp, 4
  2431 00000A6F E90F00                   jmp .doglob91
  2432                                  .doglob90:
  2433 00000A72 8D06A36D                 lea  ax, [symbol]
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
  2498 00000B70 8A875B70                 mov al, [GSign + bx]
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
  2514 00000B92 8A878771                 mov al, [GWidth + bx]
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
  2557 00000BE7 8A872F6F                 mov al, [GType + bx]
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
  2596 00000C27 8D06BB79                 lea  ax, [GNameField]
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
  2653 00000C77 8B876377                 mov ax, [GData + bx]
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
  2693 00000CBE E80437                   call error1
  2694 00000CC1 83C402                   add  sp, 2
  2695                                  
  2696                                  ;-387   GUsed[i]=GUsed[i] + 1; return i;
  2697                                  
  2698                                  .searchname102:
  2699 00000CC4 8B5EFE                   mov bx, [bp-2]
  2700 00000CC7 D1E3                     shl bx, 1
  2701 00000CC9 8B870B75                 mov ax, [GUsed + bx]
  2702 00000CCD 83C001                   add ax, 1
  2703 00000CD0 8B5EFE                   mov bx, [bp-2]
  2704 00000CD3 D1E3                     shl bx, 1
  2705 00000CD5 89870B75                 mov [GUsed+bx], ax
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
  2740 00000D16 8D06A36D                 lea  ax, [symbol]
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
  2766 00000D52 8D06A36D                 lea  ax, [symbol]
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
  2937 00000E5C E86635                   call error1
  2938 00000E5F 83C402                   add  sp, 2
  2939                                  
  2940                                  ;-412     token=getlex();
  2941                                  
  2942                                  .name1117:
  2943 00000E62 E8E02C                   call getlex
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
  2968 00000E88 E83A35                   call error1
  2969 00000E8B 83C402                   add  sp, 2
  2970                                  
  2971                                  ;-416   if (CNameTop >= 65468) error1("Call name table fuill");
  2972                                  
  2973                                  .storecall118:
  2974 00000E8E A1[6200]                 mov ax, [CNameTop]
  2975 00000E91 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2976 00000E94 0F820900                 jb  .storecall119
  2977 00000E98 68[F90E]                 push storecall_1
  2978 00000E9B E82735                   call error1
  2979 00000E9E 83C402                   add  sp, 2
  2980                                  
  2981                                  ;-417     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2982                                  
  2983                                  .storecall119:
  2984 00000EA1 B80000                   mov ax, 0
  2985 00000EA4 8B1E[3F00]               mov bx, [CTop]
  2986 00000EA8 8887A78D                 mov [CType+bx], al
  2987 00000EAC A1[6200]                 mov ax, [CNameTop]
  2988 00000EAF 8B1E[3F00]               mov bx, [CTop]
  2989 00000EB3 D1E3                     shl bx, 1
  2990 00000EB5 8987CF97                 mov [CAdr+bx], ax
  2991 00000EB9 8D06A36D                 lea  ax, [symbol]
  2992 00000EBD 50                       push ax
  2993 00000EBE E864F3                   call strlen
  2994 00000EC1 83C402                   add  sp, 2
  2995 00000EC4 8946FE                   mov [bp-2], ax
  2996                                  
  2997                                  ;-418     to_far(CNameTop, symbol);
  2998                                  
  2999 00000EC7 8D06A36D                 lea  ax, [symbol]
  3000 00000ECB 50                       push ax
  3001 00000ECC FF36[6200]               push word [CNameTop]
  3002 00000ED0 E81F43                   call to_far
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
  3031 00000F1C E8A634                   call error1
  3032 00000F1F 83C402                   add  sp, 2
  3033                                  
  3034                                  ;-422     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3035                                  
  3036                                  .storefunc120:
  3037 00000F22 A1[6800]                 mov ax, [lineno]
  3038 00000F25 83E801                   sub ax, 1
  3039 00000F28 8B1E[3D00]               mov bx, [FTop]
  3040 00000F2C D1E3                     shl bx, 1
  3041 00000F2E 89877795                 mov [FAdr+bx], ax
  3042 00000F32 B80000                   mov ax, 0
  3043 00000F35 8B1E[3D00]               mov bx, [FTop]
  3044 00000F39 D1E3                     shl bx, 1
  3045 00000F3B 89876FA7                 mov [FCalls+bx], ax
  3046 00000F3F A0[3A00]                 mov al, [iswidth]
  3047 00000F42 8B1E[3D00]               mov bx, [FTop]
  3048 00000F46 88877B8C                 mov [FType+bx], al
  3049                                  
  3050                                  ;-423     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3051                                  
  3052 00000F4A FF36[3D00]               push word [FTop]
  3053 00000F4E 8D06C7A9                 lea  ax, [FNameField]
  3054 00000F52 50                       push ax
  3055 00000F53 E8DEFC                   call adrF
  3056 00000F56 83C404                   add  sp, 4
  3057 00000F59 A3[6C00]                 mov word [pt], ax
  3058 00000F5C 8D06A36D                 lea  ax, [symbol]
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
  3081 00000F91 E83134                   call error1
  3082 00000F94 83C402                   add  sp, 2
  3083                                  
  3084                                  ;-426   if (checkName() != 0) error1("Variable already defined");
  3085                                  
  3086                                  .addlocal121:
  3087 00000F97 E858FD                   call checkName
  3088 00000F9A 83F800                   cmp ax, 0
  3089 00000F9D 0F840900                 je  .addlocal122
  3090 00000FA1 68[2410]                 push addlocal_1
  3091 00000FA4 E81E34                   call error1
  3092 00000FA7 83C402                   add  sp, 2
  3093                                  
  3094                                  ;-427   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3095                                  
  3096                                  .addlocal122:
  3097 00000FAA A0[3700]                 mov al, [issign]
  3098 00000FAD 8B1E[2E00]               mov bx, [LTop]
  3099 00000FB1 88875B70                 mov [GSign+bx], al
  3100 00000FB5 A0[3A00]                 mov al, [iswidth]
  3101 00000FB8 8B1E[2E00]               mov bx, [LTop]
  3102 00000FBC 88878771                 mov [GWidth+bx], al
  3103 00000FC0 A0[3400]                 mov al, [istype]
  3104 00000FC3 8B1E[2E00]               mov bx, [LTop]
  3105 00000FC7 88872F6F                 mov [GType+bx], al
  3106                                  
  3107                                  ;-428   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3108                                  
  3109 00000FCB A1[6800]                 mov ax, [lineno]
  3110 00000FCE 83E801                   sub ax, 1
  3111 00000FD1 8B1E[2E00]               mov bx, [LTop]
  3112 00000FD5 D1E3                     shl bx, 1
  3113 00000FD7 8987B372                 mov [GAdr+bx], ax
  3114 00000FDB B80000                   mov ax, 0
  3115 00000FDE 8B1E[2E00]               mov bx, [LTop]
  3116 00000FE2 D1E3                     shl bx, 1
  3117 00000FE4 89870B75                 mov [GUsed+bx], ax
  3118                                  
  3119                                  ;-429   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3120                                  
  3121 00000FE8 FF36[2E00]               push word [LTop]
  3122 00000FEC 8D06BB79                 lea  ax, [GNameField]
  3123 00000FF0 50                       push ax
  3124 00000FF1 E840FC                   call adrF
  3125 00000FF4 83C404                   add  sp, 4
  3126 00000FF7 A3[6C00]                 mov word [pt], ax
  3127 00000FFA 8D06A36D                 lea  ax, [symbol]
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
  3166 00001055 8D06C7A9                 lea  ax, [FNameField]
  3167 00001059 50                       push ax
  3168 0000105A E8D7FB                   call adrF
  3169 0000105D 83C404                   add  sp, 4
  3170 00001060 8946FC                   mov [bp-4], ax
  3171 00001063 FF76FC                   push word [bp-4]
  3172 00001066 8D06A36D                 lea  ax, [symbol]
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
  3215 00001097 8D06A36D                 lea  ax, [symbol]
  3216 0000109B 50                       push ax
  3217 0000109C 8D06236E                 lea  ax, [fname]
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
  3228 000010B3 E80F33                   call error1
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
  3241 000010C5 8D06A36D                 lea  ax, [symbol]
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
  3281 00001115 89876377                 mov [GData+bx], ax
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
  3357 0000118E 89876377                 mov [GData+bx], ax
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
  3373 000011AD 88872F6F                 mov [GType+bx], al
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
  3390 000011D9 89876377                 mov [GData+bx], ax
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
  3417 000011FD E88732                   call listproc
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
  3450 00001240 E88B23                   call stmt
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
  3468 00001257 8D06236E                 lea  ax, [fname]
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
  3524 000012B9 8D06236E                 lea  ax, [fname]
  3525 000012BD 50                       push ax
  3526 000012BE 8D06606D                 lea  ax, [coname]
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
  3617                                  ;-488 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  3618                                  
  3619                                   .retnisvariable:
  3620 00001373 C3                       ret
  3621                                  ENDP
  3622 00001374 0000                    mod1 dw 0
  3623 00001376 0000                    ireg1 dw 0
  3624 00001378 0000                    idx1 dw 0
  3625 0000137A 0000                    ids1 dw 0
  3626 0000137C 0000                    idw1 dw 0
  3627 0000137E 0000                    idt1 dw 0
  3628 00001380 0000                    val1 dw 0
  3629                                  
  3630                                  ;-489 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  3631                                  
  3632 00001382 0000                    mod2 dw 0
  3633 00001384 0000                    ireg2 dw 0
  3634 00001386 0000                    idx2 dw 0
  3635 00001388 0000                    ids2 dw 0
  3636 0000138A 0000                    idw2 dw 0
  3637 0000138C 0000                    idt2 dw 0
  3638 0000138E 0000                    val2 dw 0
  3639                                  
  3640                                  ;-490 
  3641                                  
  3642                                  
  3643                                  ;-491 int pexpr() {expect('('); iscmp=0;
  3644                                  
  3645                                  
  3646                                  pexpr: PROC
  3647 00001390 6A28                     push 40
  3648 00001392 E8A2F0                   call expect
  3649 00001395 83C402                   add  sp, 2
  3650 00001398 B80000                   mov ax, 0
  3651 0000139B A3[2400]                 mov word [iscmp], ax
  3652                                  
  3653                                  ;-492   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  3654                                  
  3655 0000139E A1[1E00]                 mov ax, [token]
  3656 000013A1 3D0001                   cmp ax, 256
  3657 000013A4 0F853400                 jne .pexpr148
  3658 000013A8 68[0614]                 push pexpr_0
  3659 000013AB 8D06A36D                 lea  ax, [symbol]
  3660 000013AF 50                       push ax
  3661 000013B0 E8D0EE                   call eqstr
  3662 000013B3 83C404                   add  sp, 4
  3663 000013B6 08C0                     or  al, al
  3664 000013B8 0F840600                 je .pexpr149
  3665 000013BC E85E00                   call constantexpr
  3666 000013BF E94300                   jmp .retnpexpr
  3667                                  
  3668                                  ;-493     ireg1=checkreg();
  3669                                  
  3670                                  .pexpr149:
  3671 000013C2 E89A07                   call checkreg
  3672 000013C5 A3[7613]                 mov word [ireg1], ax
  3673                                  
  3674                                  ;-494     if (ireg1) { doreg1(1); return; }  }
  3675                                  
  3676 000013C8 A1[7613]                 mov ax, [ireg1]
  3677 000013CB 08C0                     or  al, al
  3678 000013CD 0F840B00                 je .pexpr150
  3679 000013D1 6A01                     push 1
  3680 000013D3 E89D05                   call doreg1
  3681 000013D6 83C402                   add  sp, 2
  3682 000013D9 E92900                   jmp .retnpexpr
  3683                                  .pexpr150:
  3684                                  
  3685                                  ;-495   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  3686                                  
  3687                                  .pexpr148:
  3688 000013DC E83D01                   call exprstart
  3689 000013DF A1[2400]                 mov ax, [iscmp]
  3690 000013E2 83F800                   cmp ax, 0
  3691 000013E5 0F850900                 jne .pexpr151
  3692 000013E9 68[0814]                 push pexpr_1
  3693 000013EC E85BF1                   call prs
  3694 000013EF 83C402                   add  sp, 2
  3695                                  .pexpr151:
  3696 000013F2 8D06236E                 lea  ax, [fname]
  3697 000013F6 50                       push ax
  3698 000013F7 E850F1                   call prs
  3699 000013FA 83C402                   add  sp, 2
  3700                                  
  3701                                  ;-496   expect(')'); }           /*error1("Vergleich fehlt");*/
  3702                                  
  3703 000013FD 6A29                     push 41
  3704 000013FF E835F0                   call expect
  3705 00001402 83C402                   add  sp, 2
  3706                                  
  3707                                  ;-497 
  3708                                  
  3709                                  
  3710                                  ;-498 int constantexpr() { int mode; int id1;int ids;
  3711                                  
  3712                                   .retnpexpr:
  3713 00001405 C3                       ret
  3714 00001406 5F00                    pexpr_0 db "_",0
  3715 00001408 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  3716 00001411 2C20616C5C6E206A65-
  3717 0000141A 202E00             
  3718                                  ENDP
  3719                                  
  3720                                  constantexpr: PROC
  3721                                  
  3722                                  ;-499   token=getlex();   mode=typeName();
  3723                                  
  3724                                  ;Function : constantexpr, Number of local variables: 3
  3725                                  ;   # type sign width addr used name   list of local variables
  3726                                  ;  200 var sign word   498 NULL mode = bp-2
  3727                                  ;  201 var sign word   498 NULL id1 = bp-4
  3728                                  ;  202 var sign word   498 NULL ids = bp-6;
  3729 0000141D C8060000                 ENTER  6,0
  3730 00001421 E82127                   call getlex
  3731 00001424 A3[1E00]                 mov word [token], ax
  3732 00001427 E84CF9                   call typeName
  3733 0000142A 8946FE                   mov [bp-2], ax
  3734                                  
  3735                                  ;-500   id1=searchname(); gettypes(id1); ids=signi;
  3736                                  
  3737 0000142D E877F8                   call searchname
  3738 00001430 8946FC                   mov [bp-4], ax
  3739 00001433 FF76FC                   push word [bp-4]
  3740 00001436 E830F7                   call gettypes
  3741 00001439 83C402                   add  sp, 2
  3742 0000143C A1[3500]                 mov ax, [signi]
  3743 0000143F 8946FA                   mov [bp-6], ax
  3744                                  
  3745                                  ;-501   if (isrelational() ==0) error1("Relational expression expected");
  3746                                  
  3747 00001442 E89926                   call isrelational
  3748 00001445 83F800                   cmp ax, 0
  3749 00001448 0F850900                 jne .constantexpr152
  3750 0000144C 68[D214]                 push constantexpr_0
  3751 0000144F E8732F                   call error1
  3752 00001452 83C402                   add  sp, 2
  3753                                  
  3754                                  ;-502   expect(T_CONST);  prs(" ; constant expression");
  3755                                  
  3756                                  .constantexpr152:
  3757 00001455 680101                   push 257
  3758 00001458 E8DCEF                   call expect
  3759 0000145B 83C402                   add  sp, 2
  3760 0000145E 68[F114]                 push constantexpr_1
  3761 00001461 E8E6F0                   call prs
  3762 00001464 83C402                   add  sp, 2
  3763                                  
  3764                                  ;-503   prs("\ncmp ");
  3765                                  
  3766 00001467 68[0815]                 push constantexpr_2
  3767 0000146A E8DDF0                   call prs
  3768 0000146D 83C402                   add  sp, 2
  3769                                  
  3770                                  ;-504   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  3771                                  
  3772 00001470 FF76FC                   push word [bp-4]
  3773 00001473 E8F3F6                   call gettypes
  3774 00001476 83C402                   add  sp, 2
  3775 00001479 A1[3B00]                 mov ax, [wi]
  3776 0000147C 83F802                   cmp ax, 2
  3777 0000147F 0F850C00                 jne .constantexpr153
  3778 00001483 68[0F15]                 push constantexpr_3
  3779 00001486 E8C1F0                   call prs
  3780 00001489 83C402                   add  sp, 2
  3781 0000148C E90900                   jmp .constantexpr154
  3782                                  .constantexpr153:
  3783 0000148F 68[1415]                 push constantexpr_4
  3784 00001492 E8B5F0                   call prs
  3785 00001495 83C402                   add  sp, 2
  3786                                  
  3787                                  ;-505   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  3788                                  
  3789                                  .constantexpr154:
  3790 00001498 FF76FC                   push word [bp-4]
  3791 0000149B E8DAEE                   call v
  3792 0000149E 83C402                   add  sp, 2
  3793 000014A1 68[1915]                 push constantexpr_5
  3794 000014A4 E8A3F0                   call prs
  3795 000014A7 83C402                   add  sp, 2
  3796 000014AA FF36[3000]               push word [lexval]
  3797 000014AE E8EEF1                   call prunsign1
  3798 000014B1 83C402                   add  sp, 2
  3799 000014B4 FF76FA                   push word [bp-6]
  3800 000014B7 E86623                   call cmpneg
  3801 000014BA 83C402                   add  sp, 2
  3802 000014BD 8D06236E                 lea  ax, [fname]
  3803 000014C1 50                       push ax
  3804 000014C2 E885F0                   call prs
  3805 000014C5 83C402                   add  sp, 2
  3806                                  
  3807                                  ;-506   expect(')');
  3808                                  
  3809 000014C8 6A29                     push 41
  3810 000014CA E86AEF                   call expect
  3811 000014CD 83C402                   add  sp, 2
  3812                                  
  3813                                  ;-507 }
  3814                                  
  3815                                  
  3816                                  ;-508 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  3817 000014D0 C9                       LEAVE
  3818 000014D1 C3                       ret
  3819 000014D2 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  3820 000014DB 6C2065787072657373-
  3821 000014E4 696F6E206578706563-
  3822 000014ED 74656400           
  3823 000014F1 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  3824 000014FA 6E7420657870726573-
  3825 00001503 73696F6E00         
  3826 00001508 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  3827 0000150F 776F726400              constantexpr_3 db "word",0
  3828 00001514 6279746500              constantexpr_4 db "byte",0
  3829 00001519 2C2000                  constantexpr_5 db ", ",0
  3830                                  ENDP
  3831                                  
  3832                                  exprstart: PROC
  3833 0000151C 68[4415]                 push exprstart_0
  3834 0000151F 8D06A36D                 lea  ax, [symbol]
  3835 00001523 50                       push ax
  3836 00001524 E85CED                   call eqstr
  3837 00001527 83C404                   add  sp, 4
  3838 0000152A 08C0                     or  al, al
  3839 0000152C 0F840B00                 je .exprstart155
  3840 00001530 6A00                     push 0
  3841 00001532 E81100                   call expr2
  3842 00001535 83C402                   add  sp, 2
  3843 00001538 E90800                   jmp .exprstart156
  3844                                  .exprstart155:
  3845 0000153B 6A00                     push 0
  3846 0000153D E89E0A                   call expr
  3847 00001540 83C402                   add  sp, 2
  3848                                  .exprstart156:
  3849                                  
  3850                                  ;-509 
  3851                                  
  3852                                  
  3853                                  ;-510 int expr2(int kind) {  int i;
  3854                                  
  3855 00001543 C3                       ret
  3856 00001544 5F00                    exprstart_0 db "_",0
  3857                                  ENDP
  3858                                  
  3859                                  expr2: PROC
  3860                                  
  3861                                  ;-511   if(kind != 1) token=getlex();
  3862                                  
  3863                                  ;Function : expr2, Number of local variables: 2
  3864                                  ;   # type sign width addr used name   list of local variables
  3865                                  ;  200 var sign word   510 NULL kind = bp+4
  3866                                  ;  201 var sign word   510 NULL i = bp-2;
  3867 00001546 C8020000                 ENTER  2,0
  3868 0000154A 8B4604                   mov ax, [bp+4]
  3869 0000154D 83F801                   cmp ax, 1
  3870 00001550 0F840600                 je  .expr2157
  3871 00001554 E8EE25                   call getlex
  3872 00001557 A3[1E00]                 mov word [token], ax
  3873                                  
  3874                                  ;-512   mod1=typeName();
  3875                                  
  3876                                  .expr2157:
  3877 0000155A E819F8                   call typeName
  3878 0000155D A3[7413]                 mov word [mod1], ax
  3879                                  
  3880                                  ;-513   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  3881                                  
  3882 00001560 A1[7413]                 mov ax, [mod1]
  3883 00001563 08C0                     or  al, al
  3884 00001565 0F840900                 je .expr2158
  3885 00001569 68[FE17]                 push expr2_0
  3886 0000156C E8562E                   call error1
  3887 0000156F 83C402                   add  sp, 2
  3888                                  
  3889                                  ;-514   ireg1=checkreg();
  3890                                  
  3891                                  .expr2158:
  3892 00001572 E8EA05                   call checkreg
  3893 00001575 A3[7613]                 mov word [ireg1], ax
  3894                                  
  3895                                  ;-515   if (ireg1) { doreg1(0); return; }
  3896                                  
  3897 00001578 A1[7613]                 mov ax, [ireg1]
  3898 0000157B 08C0                     or  al, al
  3899 0000157D 0F840B00                 je .expr2159
  3900 00001581 6A00                     push 0
  3901 00001583 E8ED03                   call doreg1
  3902 00001586 83C402                   add  sp, 2
  3903 00001589 E97002                   jmp .retnexpr2
  3904                                  
  3905                                  ;-516   if (ireg1 == 0) { idx1=searchname();
  3906                                  
  3907                                  .expr2159:
  3908 0000158C A1[7613]                 mov ax, [ireg1]
  3909 0000158F 83F800                   cmp ax, 0
  3910 00001592 0F853400                 jne .expr2160
  3911 00001596 E80EF7                   call searchname
  3912 00001599 A3[7813]                 mov word [idx1], ax
  3913                                  
  3914                                  ;-517     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3915                                  
  3916 0000159C FF36[7813]               push word [idx1]
  3917 000015A0 E8C6F5                   call gettypes
  3918 000015A3 83C402                   add  sp, 2
  3919 000015A6 A1[3500]                 mov ax, [signi]
  3920 000015A9 A3[7A13]                 mov word [ids1], ax
  3921 000015AC A1[3B00]                 mov ax, [wi]
  3922 000015AF A3[7C13]                 mov word [idw1], ax
  3923 000015B2 A1[3200]                 mov ax, [typei]
  3924 000015B5 A3[7E13]                 mov word [idt1], ax
  3925                                  
  3926                                  ;-518     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3927                                  
  3928 000015B8 A1[7E13]                 mov ax, [idt1]
  3929 000015BB 08C0                     or  al, al
  3930 000015BD 0F840900                 je .expr2161
  3931 000015C1 68[2D18]                 push expr2_1
  3932 000015C4 E8FE2D                   call error1
  3933 000015C7 83C402                   add  sp, 2
  3934                                  .expr2161:
  3935                                  
  3936                                  ;-519 
  3937                                  
  3938                                  
  3939                                  ;-520   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3940                                  
  3941                                  .expr2160:
  3942 000015CA E81125                   call isrelational
  3943 000015CD 08C0                     or  al, al
  3944 000015CF 0F840900                 je .expr2162
  3945 000015D3 68[5818]                 push expr2_2
  3946 000015D6 E8EC2D                   call error1
  3947 000015D9 83C402                   add  sp, 2
  3948                                  
  3949                                  ;-521   }
  3950                                  
  3951                                  
  3952                                  ;-522   if (istoken('=') == 0) error1("Assign expected");
  3953                                  
  3954                                  .expr2162:
  3955 000015DC 6A3D                     push 61
  3956 000015DE E834EE                   call istoken
  3957 000015E1 83C402                   add  sp, 2
  3958 000015E4 83F800                   cmp ax, 0
  3959 000015E7 0F850900                 jne .expr2163
  3960 000015EB 68[7B18]                 push expr2_3
  3961 000015EE E8D42D                   call error1
  3962 000015F1 83C402                   add  sp, 2
  3963                                  
  3964                                  ;-523   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3965                                  
  3966                                  .expr2163:
  3967 000015F4 680101                   push 257
  3968 000015F7 E81BEE                   call istoken
  3969 000015FA 83C402                   add  sp, 2
  3970 000015FD 08C0                     or  al, al
  3971 000015FF 0F849A00                 je .expr2164
  3972 00001603 A1[3000]                 mov ax, [lexval]
  3973 00001606 A3[8E13]                 mov word [val2], ax
  3974 00001609 68[8B18]                 push expr2_4
  3975 0000160C E83BEF                   call prs
  3976 0000160F 83C402                   add  sp, 2
  3977                                  
  3978                                  ;-524     prs("\nmov ");
  3979                                  
  3980 00001612 68[A218]                 push expr2_5
  3981 00001615 E832EF                   call prs
  3982 00001618 83C402                   add  sp, 2
  3983                                  
  3984                                  ;-525     if (idw1 == 1) prs("byte ");
  3985                                  
  3986 0000161B A1[7C13]                 mov ax, [idw1]
  3987 0000161E 83F801                   cmp ax, 1
  3988 00001621 0F850900                 jne .expr2165
  3989 00001625 68[A918]                 push expr2_6
  3990 00001628 E81FEF                   call prs
  3991 0000162B 83C402                   add  sp, 2
  3992                                  
  3993                                  ;-526     if (idw1 == 2) prs("word ");
  3994                                  
  3995                                  .expr2165:
  3996 0000162E A1[7C13]                 mov ax, [idw1]
  3997 00001631 83F802                   cmp ax, 2
  3998 00001634 0F850900                 jne .expr2166
  3999 00001638 68[AF18]                 push expr2_7
  4000 0000163B E80CEF                   call prs
  4001 0000163E 83C402                   add  sp, 2
  4002                                  
  4003                                  ;-527     if (idw1 == 4) prs("dword ");
  4004                                  
  4005                                  .expr2166:
  4006 00001641 A1[7C13]                 mov ax, [idw1]
  4007 00001644 83F804                   cmp ax, 4
  4008 00001647 0F850900                 jne .expr2167
  4009 0000164B 68[B518]                 push expr2_8
  4010 0000164E E8F9EE                   call prs
  4011 00001651 83C402                   add  sp, 2
  4012                                  
  4013                                  ;-528     v(idx1);
  4014                                  
  4015                                  .expr2167:
  4016 00001654 FF36[7813]               push word [idx1]
  4017 00001658 E81DED                   call v
  4018 0000165B 83C402                   add  sp, 2
  4019                                  
  4020                                  ;-529     prs(", "); prunsign1(val2);
  4021                                  
  4022 0000165E 68[BC18]                 push expr2_9
  4023 00001661 E8E6EE                   call prs
  4024 00001664 83C402                   add  sp, 2
  4025 00001667 FF36[8E13]               push word [val2]
  4026 0000166B E831F0                   call prunsign1
  4027 0000166E 83C402                   add  sp, 2
  4028                                  
  4029                                  ;-530     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  4030                                  
  4031 00001671 A1[7813]                 mov ax, [idx1]
  4032 00001674 3DC800                   cmp ax, 200 ;unsigned : 1
  4033 00001677 0F8C1F00                 jl  .expr2168
  4034 0000167B FF36[7813]               push word [idx1]
  4035 0000167F E89EF5                   call adrofname
  4036 00001682 83C402                   add  sp, 2
  4037 00001685 8946FE                   mov [bp-2], ax
  4038 00001688 68[BF18]                 push expr2_10
  4039 0000168B E8BCEE                   call prs
  4040 0000168E 83C402                   add  sp, 2
  4041 00001691 FF76FE                   push word [bp-2]
  4042 00001694 E8B3EE                   call prs
  4043 00001697 83C402                   add  sp, 2
  4044                                  .expr2168:
  4045 0000169A E95F01                   jmp .retnexpr2
  4046                                  
  4047                                  ;-531 
  4048                                  
  4049                                  
  4050                                  ;-532   mod1=typeName(); ireg2=checkreg();
  4051                                  
  4052                                  .expr2164:
  4053 0000169D E8D6F6                   call typeName
  4054 000016A0 A3[7413]                 mov word [mod1], ax
  4055 000016A3 E8B904                   call checkreg
  4056 000016A6 A3[8413]                 mov word [ireg2], ax
  4057                                  
  4058                                  ;-533   if (ireg2) { prs("\nmov ");
  4059                                  
  4060 000016A9 A1[8413]                 mov ax, [ireg2]
  4061 000016AC 08C0                     or  al, al
  4062 000016AE 0F844200                 je .expr2169
  4063 000016B2 68[C218]                 push expr2_11
  4064 000016B5 E892EE                   call prs
  4065 000016B8 83C402                   add  sp, 2
  4066                                  
  4067                                  ;-534     if (ireg1) printreg(ireg1);
  4068                                  
  4069 000016BB A1[7613]                 mov ax, [ireg1]
  4070 000016BE 08C0                     or  al, al
  4071 000016C0 0F840D00                 je .expr2170
  4072 000016C4 FF36[7613]               push word [ireg1]
  4073 000016C8 E8A208                   call printreg
  4074 000016CB 83C402                   add  sp, 2
  4075                                  
  4076                                  ;-535         else v(idx1);
  4077                                  
  4078 000016CE E90A00                   jmp .expr2171
  4079                                  .expr2170:
  4080 000016D1 FF36[7813]               push word [idx1]
  4081 000016D5 E8A0EC                   call v
  4082 000016D8 83C402                   add  sp, 2
  4083                                  
  4084                                  ;-536             prs(", "); printreg(ireg2);return;
  4085                                  
  4086                                  .expr2171:
  4087 000016DB 68[C918]                 push expr2_12
  4088 000016DE E869EE                   call prs
  4089 000016E1 83C402                   add  sp, 2
  4090 000016E4 FF36[8413]               push word [ireg2]
  4091 000016E8 E88208                   call printreg
  4092 000016EB 83C402                   add  sp, 2
  4093 000016EE E90B01                   jmp .retnexpr2
  4094                                  
  4095                                  ;-537             }
  4096                                  
  4097                                  
  4098                                  ;-538   else {
  4099                                  
  4100 000016F1 E9FF00                   jmp .expr2172
  4101                                  .expr2169:
  4102                                  
  4103                                  ;-539     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  4104                                  
  4105 000016F4 A1[7413]                 mov ax, [mod1]
  4106 000016F7 83F801                   cmp ax, 1
  4107 000016FA 0F850900                 jne .expr2173
  4108 000016FE 68[CC18]                 push expr2_13
  4109 00001701 E8C12C                   call error1
  4110 00001704 83C402                   add  sp, 2
  4111                                  
  4112                                  ;-540 
  4113                                  
  4114                                  
  4115                                  ;-541     idx2=searchname();
  4116                                  
  4117                                  .expr2173:
  4118 00001707 E89DF5                   call searchname
  4119 0000170A A3[8613]                 mov word [idx2], ax
  4120                                  
  4121                                  ;-542     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  4122                                  
  4123 0000170D FF36[8613]               push word [idx2]
  4124 00001711 E855F4                   call gettypes
  4125 00001714 83C402                   add  sp, 2
  4126 00001717 A1[3500]                 mov ax, [signi]
  4127 0000171A A3[8813]                 mov word [ids2], ax
  4128 0000171D A1[3B00]                 mov ax, [wi]
  4129 00001720 A3[8A13]                 mov word [idw2], ax
  4130 00001723 A1[3200]                 mov ax, [typei]
  4131 00001726 A3[8C13]                 mov word [idt2], ax
  4132                                  
  4133                                  ;-543     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  4134                                  
  4135 00001729 A1[8C13]                 mov ax, [idt2]
  4136 0000172C 83F801                   cmp ax, 1
  4137 0000172F 0F850900                 jne .expr2174
  4138 00001733 68[E818]                 push expr2_14
  4139 00001736 E88C2C                   call error1
  4140 00001739 83C402                   add  sp, 2
  4141                                  
  4142                                  ;-544     prs("\nmov ");
  4143                                  
  4144                                  .expr2174:
  4145 0000173C 68[0719]                 push expr2_15
  4146 0000173F E808EE                   call prs
  4147 00001742 83C402                   add  sp, 2
  4148                                  
  4149                                  ;-545     if (ireg1) printreg(ireg1);
  4150                                  
  4151 00001745 A1[7613]                 mov ax, [ireg1]
  4152 00001748 08C0                     or  al, al
  4153 0000174A 0F840D00                 je .expr2175
  4154 0000174E FF36[7613]               push word [ireg1]
  4155 00001752 E81808                   call printreg
  4156 00001755 83C402                   add  sp, 2
  4157                                  
  4158                                  ;-546         else error1("Mem to Mem not allowed by x86-CPU");
  4159                                  
  4160 00001758 E90900                   jmp .expr2176
  4161                                  .expr2175:
  4162 0000175B 68[0E19]                 push expr2_16
  4163 0000175E E8642C                   call error1
  4164 00001761 83C402                   add  sp, 2
  4165                                  
  4166                                  ;-547     prs(", ");
  4167                                  
  4168                                  .expr2176:
  4169 00001764 68[3019]                 push expr2_17
  4170 00001767 E8E0ED                   call prs
  4171 0000176A 83C402                   add  sp, 2
  4172                                  
  4173                                  ;-548     if (mod1 == 2) a(idx2);
  4174                                  
  4175 0000176D A1[7413]                 mov ax, [mod1]
  4176 00001770 83F802                   cmp ax, 2
  4177 00001773 0F850D00                 jne .expr2177
  4178 00001777 FF36[8613]               push word [idx2]
  4179 0000177B E8EBEB                   call a
  4180 0000177E 83C402                   add  sp, 2
  4181                                  
  4182                                  ;-549     else {
  4183                                  
  4184 00001781 E96C00                   jmp .expr2178
  4185                                  .expr2177:
  4186                                  
  4187                                  ;-550       if (idw2 == 1) prs("byte ");
  4188                                  
  4189 00001784 A1[8A13]                 mov ax, [idw2]
  4190 00001787 83F801                   cmp ax, 1
  4191 0000178A 0F850900                 jne .expr2179
  4192 0000178E 68[3319]                 push expr2_18
  4193 00001791 E8B6ED                   call prs
  4194 00001794 83C402                   add  sp, 2
  4195                                  
  4196                                  ;-551       if (idw2 == 2) prs("word ");
  4197                                  
  4198                                  .expr2179:
  4199 00001797 A1[8A13]                 mov ax, [idw2]
  4200 0000179A 83F802                   cmp ax, 2
  4201 0000179D 0F850900                 jne .expr2180
  4202 000017A1 68[3919]                 push expr2_19
  4203 000017A4 E8A3ED                   call prs
  4204 000017A7 83C402                   add  sp, 2
  4205                                  
  4206                                  ;-552       if (idw2 == 4) prs("dword ");
  4207                                  
  4208                                  .expr2180:
  4209 000017AA A1[8A13]                 mov ax, [idw2]
  4210 000017AD 83F804                   cmp ax, 4
  4211 000017B0 0F850900                 jne .expr2181
  4212 000017B4 68[3F19]                 push expr2_20
  4213 000017B7 E890ED                   call prs
  4214 000017BA 83C402                   add  sp, 2
  4215                                  
  4216                                  ;-553       v(idx2);
  4217                                  
  4218                                  .expr2181:
  4219 000017BD FF36[8613]               push word [idx2]
  4220 000017C1 E8B4EB                   call v
  4221 000017C4 83C402                   add  sp, 2
  4222                                  
  4223                                  ;-554       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  4224                                  
  4225 000017C7 A1[8613]                 mov ax, [idx2]
  4226 000017CA 3DC800                   cmp ax, 200 ;unsigned : 1
  4227 000017CD 0F8C1F00                 jl  .expr2182
  4228 000017D1 FF36[8613]               push word [idx2]
  4229 000017D5 E848F4                   call adrofname
  4230 000017D8 83C402                   add  sp, 2
  4231 000017DB 8946FE                   mov [bp-2], ax
  4232 000017DE 68[4619]                 push expr2_21
  4233 000017E1 E866ED                   call prs
  4234 000017E4 83C402                   add  sp, 2
  4235 000017E7 FF76FE                   push word [bp-2]
  4236 000017EA E85DED                   call prs
  4237 000017ED 83C402                   add  sp, 2
  4238                                  .expr2182:
  4239                                  
  4240                                  ;-555     return;
  4241                                  
  4242                                  .expr2178:
  4243 000017F0 E90900                   jmp .retnexpr2
  4244                                  
  4245                                  ;-556   } error1("Internal error: only const or reg allowed");
  4246                                  
  4247                                  .expr2172:
  4248 000017F3 68[4919]                 push expr2_22
  4249 000017F6 E8CC2B                   call error1
  4250 000017F9 83C402                   add  sp, 2
  4251                                  
  4252                                  ;-557 }
  4253                                  
  4254                                  
  4255                                  ;-558 char ops[5];
  4256                                  
  4257 000017FC C9                       .retnexpr2: LEAVE
  4258 000017FD C3                       ret
  4259 000017FE 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  4260 00001807 202620756E64202A20-
  4261 00001810 696D20546578742028-
  4262 00001819 4C696E6B652048616E-
  4263 00001822 64292065726C617562-
  4264 0000182B 7400               
  4265 0000182D 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  4266 00001836 204172726179206F64-
  4267 0000183F 657220506F696E7465-
  4268 00001848 72206C696E6B732065-
  4269 00001851 726C6175627400     
  4270 00001858 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  4271 00001861 206E6F6368206E6963-
  4272 0000186A 687420696D706C656D-
  4273 00001873 656E746965727400   
  4274 0000187B 41737369676E206578-     expr2_3 db "Assign expected",0
  4275 00001884 70656374656400     
  4276 0000188B 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  4277 00001894 6E7420657870726573-
  4278 0000189D 73696F6E00         
  4279 000018A2 5C6E6D6F762000          expr2_5 db "\nmov ",0
  4280 000018A9 627974652000            expr2_6 db "byte ",0
  4281 000018AF 776F72642000            expr2_7 db "word ",0
  4282 000018B5 64776F72642000          expr2_8 db "dword ",0
  4283 000018BC 2C2000                  expr2_9 db ", ",0
  4284 000018BF 3B2000                  expr2_10 db "; ",0
  4285 000018C2 5C6E6D6F762000          expr2_11 db "\nmov ",0
  4286 000018C9 2C2000                  expr2_12 db ", ",0
  4287 000018CC 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  4288 000018D5 202A20696D20546578-
  4289 000018DE 742065726C61756274-
  4290 000018E7 00                 
  4291 000018E8 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  4292 000018F1 204172726179207265-
  4293 000018FA 636874732065726C61-
  4294 00001903 75627400           
  4295 00001907 5C6E6D6F762000          expr2_15 db "\nmov ",0
  4296 0000190E 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  4297 00001917 6D206E6F7420616C6C-
  4298 00001920 6F7765642062792078-
  4299 00001929 38362D43505500     
  4300 00001930 2C2000                  expr2_17 db ", ",0
  4301 00001933 627974652000            expr2_18 db "byte ",0
  4302 00001939 776F72642000            expr2_19 db "word ",0
  4303 0000193F 64776F72642000          expr2_20 db "dword ",0
  4304 00001946 3B2000                  expr2_21 db "; ",0
  4305 00001949 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  4306 00001952 6572726F723A206F6E-
  4307 0000195B 6C7920636F6E737420-
  4308 00001964 6F722072656720616C-
  4309 0000196D 6C6F77656400       
  4310                                  ENDP
  4311                                  section .bss
  4312                                  absolute 48406
  4313 0000BD16 <res 00000005>          ops resb 5
  4314                                  section .text
  4315                                  
  4316                                  ;-559 int doreg1(int iscmp1) { int i;
  4317                                  
  4318                                  
  4319                                  doreg1: PROC
  4320                                  
  4321                                  ;-560   if (istoken('='))          strcpy(ops, "mov");
  4322                                  
  4323                                  ;Function : doreg1, Number of local variables: 2
  4324                                  ;   # type sign width addr used name   list of local variables
  4325                                  ;  200 var sign word   559 NULL iscmp1 = bp+4
  4326                                  ;  201 var sign word   559 NULL i = bp-2;
  4327 00001973 C8020000                 ENTER  2,0
  4328 00001977 6A3D                     push 61
  4329 00001979 E899EA                   call istoken
  4330 0000197C 83C402                   add  sp, 2
  4331 0000197F 08C0                     or  al, al
  4332 00001981 0F840E00                 je .doreg1183
  4333 00001985 68[261B]                 push doreg1_0
  4334 00001988 8D0616BD                 lea  ax, [ops]
  4335 0000198C 50                       push ax
  4336 0000198D E8BDE8                   call strcpy
  4337 00001990 83C404                   add  sp, 4
  4338                                  
  4339                                  ;-561   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4340                                  
  4341                                  .doreg1183:
  4342 00001993 68CE04                   push 1230
  4343 00001996 E87CEA                   call istoken
  4344 00001999 83C402                   add  sp, 2
  4345 0000199C 08C0                     or  al, al
  4346 0000199E 0F840E00                 je .doreg1184
  4347 000019A2 68[2A1B]                 push doreg1_1
  4348 000019A5 8D0616BD                 lea  ax, [ops]
  4349 000019A9 50                       push ax
  4350 000019AA E8A0E8                   call strcpy
  4351 000019AD 83C404                   add  sp, 4
  4352                                  
  4353                                  ;-562   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4354                                  
  4355                                  .doreg1184:
  4356 000019B0 68CF04                   push 1231
  4357 000019B3 E85FEA                   call istoken
  4358 000019B6 83C402                   add  sp, 2
  4359 000019B9 08C0                     or  al, al
  4360 000019BB 0F840E00                 je .doreg1185
  4361 000019BF 68[2E1B]                 push doreg1_2
  4362 000019C2 8D0616BD                 lea  ax, [ops]
  4363 000019C6 50                       push ax
  4364 000019C7 E883E8                   call strcpy
  4365 000019CA 83C404                   add  sp, 4
  4366                                  
  4367                                  ;-563   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4368                                  
  4369                                  .doreg1185:
  4370 000019CD 68D204                   push 1234
  4371 000019D0 E842EA                   call istoken
  4372 000019D3 83C402                   add  sp, 2
  4373 000019D6 08C0                     or  al, al
  4374 000019D8 0F840E00                 je .doreg1186
  4375 000019DC 68[321B]                 push doreg1_3
  4376 000019DF 8D0616BD                 lea  ax, [ops]
  4377 000019E3 50                       push ax
  4378 000019E4 E866E8                   call strcpy
  4379 000019E7 83C404                   add  sp, 4
  4380                                  
  4381                                  ;-564   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4382                                  
  4383                                  .doreg1186:
  4384 000019EA 68D304                   push 1235
  4385 000019ED E825EA                   call istoken
  4386 000019F0 83C402                   add  sp, 2
  4387 000019F3 08C0                     or  al, al
  4388 000019F5 0F840E00                 je .doreg1187
  4389 000019F9 68[361B]                 push doreg1_4
  4390 000019FC 8D0616BD                 lea  ax, [ops]
  4391 00001A00 50                       push ax
  4392 00001A01 E849E8                   call strcpy
  4393 00001A04 83C404                   add  sp, 4
  4394                                  
  4395                                  ;-565   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4396                                  
  4397                                  .doreg1187:
  4398 00001A07 68D804                   push 1240
  4399 00001A0A E808EA                   call istoken
  4400 00001A0D 83C402                   add  sp, 2
  4401 00001A10 08C0                     or  al, al
  4402 00001A12 0F840E00                 je .doreg1188
  4403 00001A16 68[391B]                 push doreg1_5
  4404 00001A19 8D0616BD                 lea  ax, [ops]
  4405 00001A1D 50                       push ax
  4406 00001A1E E82CE8                   call strcpy
  4407 00001A21 83C404                   add  sp, 4
  4408                                  
  4409                                  ;-566   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4410                                  
  4411                                  .doreg1188:
  4412 00001A24 68D904                   push 1241
  4413 00001A27 E8EBE9                   call istoken
  4414 00001A2A 83C402                   add  sp, 2
  4415 00001A2D 08C0                     or  al, al
  4416 00001A2F 0F840E00                 je .doreg1189
  4417 00001A33 68[3D1B]                 push doreg1_6
  4418 00001A36 8D0616BD                 lea  ax, [ops]
  4419 00001A3A 50                       push ax
  4420 00001A3B E80FE8                   call strcpy
  4421 00001A3E 83C404                   add  sp, 4
  4422                                  
  4423                                  ;-567   if (iscmp1 == 1) { token=getlex();
  4424                                  
  4425                                  .doreg1189:
  4426 00001A41 8B4604                   mov ax, [bp+4]
  4427 00001A44 83F801                   cmp ax, 1
  4428 00001A47 0F852700                 jne .doreg1190
  4429 00001A4B E8F720                   call getlex
  4430 00001A4E A3[1E00]                 mov word [token], ax
  4431                                  
  4432                                  ;-568       if (isrelational() ==0) error1("Relational expected");
  4433                                  
  4434 00001A51 E88A20                   call isrelational
  4435 00001A54 83F800                   cmp ax, 0
  4436 00001A57 0F850900                 jne .doreg1191
  4437 00001A5B 68[411B]                 push doreg1_7
  4438 00001A5E E86429                   call error1
  4439 00001A61 83C402                   add  sp, 2
  4440                                  
  4441                                  ;-569       strcpy(ops, "cmp"); }
  4442                                  
  4443                                  .doreg1191:
  4444 00001A64 68[551B]                 push doreg1_8
  4445 00001A67 8D0616BD                 lea  ax, [ops]
  4446 00001A6B 50                       push ax
  4447 00001A6C E8DEE7                   call strcpy
  4448 00001A6F 83C404                   add  sp, 4
  4449                                  
  4450                                  ;-570   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4451                                  
  4452                                  .doreg1190:
  4453 00001A72 E8C7EA                   call prnl
  4454 00001A75 8D0616BD                 lea  ax, [ops]
  4455 00001A79 50                       push ax
  4456 00001A7A E8CDEA                   call prs
  4457 00001A7D 83C402                   add  sp, 2
  4458 00001A80 68[591B]                 push doreg1_9
  4459 00001A83 E8C4EA                   call prs
  4460 00001A86 83C402                   add  sp, 2
  4461 00001A89 FF36[7613]               push word [ireg1]
  4462 00001A8D E8DD04                   call printreg
  4463 00001A90 83C402                   add  sp, 2
  4464 00001A93 68[5C1B]                 push doreg1_10
  4465 00001A96 E8B1EA                   call prs
  4466 00001A99 83C402                   add  sp, 2
  4467                                  
  4468                                  ;-571 
  4469                                  
  4470                                  
  4471                                  ;-572   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4472                                  
  4473 00001A9C 680101                   push 257
  4474 00001A9F E873E9                   call istoken
  4475 00001AA2 83C402                   add  sp, 2
  4476 00001AA5 08C0                     or  al, al
  4477 00001AA7 0F840D00                 je .doreg1192
  4478 00001AAB FF36[3000]               push word [lexval]
  4479 00001AAF E8EDEB                   call prunsign1
  4480 00001AB2 83C402                   add  sp, 2
  4481 00001AB5 E94700                   jmp .reg1
  4482                                  
  4483                                  ;-573   mod2=typeName(); ireg2=checkreg();
  4484                                  
  4485                                  .doreg1192:
  4486 00001AB8 E8BBF2                   call typeName
  4487 00001ABB A3[8213]                 mov word [mod2], ax
  4488 00001ABE E89E00                   call checkreg
  4489 00001AC1 A3[8413]                 mov word [ireg2], ax
  4490                                  
  4491                                  ;-574   if (ireg2) {printreg(ireg2); goto reg1;}
  4492                                  
  4493 00001AC4 A1[8413]                 mov ax, [ireg2]
  4494 00001AC7 08C0                     or  al, al
  4495 00001AC9 0F840D00                 je .doreg1193
  4496 00001ACD FF36[8413]               push word [ireg2]
  4497 00001AD1 E89904                   call printreg
  4498 00001AD4 83C402                   add  sp, 2
  4499 00001AD7 E92500                   jmp .reg1
  4500                                  
  4501                                  ;-575   i=searchname();  if (mod2 == 2) a(i); else v(i);
  4502                                  
  4503                                  .doreg1193:
  4504 00001ADA E8CAF1                   call searchname
  4505 00001ADD 8946FE                   mov [bp-2], ax
  4506 00001AE0 A1[8213]                 mov ax, [mod2]
  4507 00001AE3 83F802                   cmp ax, 2
  4508 00001AE6 0F850C00                 jne .doreg1194
  4509 00001AEA FF76FE                   push word [bp-2]
  4510 00001AED E879E8                   call a
  4511 00001AF0 83C402                   add  sp, 2
  4512 00001AF3 E90900                   jmp .doreg1195
  4513                                  .doreg1194:
  4514 00001AF6 FF76FE                   push word [bp-2]
  4515 00001AF9 E87CE8                   call v
  4516 00001AFC 83C402                   add  sp, 2
  4517                                  
  4518                                  ;-576   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4519                                  
  4520                                  .doreg1195:
  4521                                  .reg1:
  4522 00001AFF 8B4604                   mov ax, [bp+4]
  4523 00001B02 83F801                   cmp ax, 1
  4524 00001B05 0F851B00                 jne .doreg1196
  4525 00001B09 6A00                     push 0
  4526 00001B0B E8121D                   call cmpneg
  4527 00001B0E 83C402                   add  sp, 2
  4528 00001B11 8D06236E                 lea  ax, [fname]
  4529 00001B15 50                       push ax
  4530 00001B16 E831EA                   call prs
  4531 00001B19 83C402                   add  sp, 2
  4532 00001B1C 6A29                     push 41
  4533 00001B1E E816E9                   call expect
  4534 00001B21 83C402                   add  sp, 2
  4535                                  
  4536                                  ;-577 }
  4537                                  
  4538                                  .doreg1196:
  4539                                  
  4540                                  ;-578 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4541 00001B24 C9                       LEAVE
  4542 00001B25 C3                       ret
  4543 00001B26 6D6F7600                doreg1_0 db "mov",0
  4544 00001B2A 61646400                doreg1_1 db "add",0
  4545 00001B2E 73756200                doreg1_2 db "sub",0
  4546 00001B32 616E6400                doreg1_3 db "and",0
  4547 00001B36 6F7200                  doreg1_4 db "or",0
  4548 00001B39 73686C00                doreg1_5 db "shl",0
  4549 00001B3D 73687200                doreg1_6 db "shr",0
  4550 00001B41 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4551 00001B4A 6C2065787065637465-
  4552 00001B53 6400               
  4553 00001B55 636D7000                doreg1_8 db "cmp",0
  4554 00001B59 202000                  doreg1_9 db "  ",0
  4555 00001B5C 2C2000                  doreg1_10 db ", ",0
  4556                                  ENDP
  4557                                  
  4558                                  checkreg: PROC
  4559                                  
  4560                                  ;-579   if (strlen(symbol) <  2) return 0;
  4561                                  
  4562 00001B5F 8D06A36D                 lea  ax, [symbol]
  4563 00001B63 50                       push ax
  4564 00001B64 E8BEE6                   call strlen
  4565 00001B67 83C402                   add  sp, 2
  4566 00001B6A 83F802                   cmp ax, 2
  4567 00001B6D 0F8D0600                 jge .checkreg197
  4568 00001B71 B80000                   mov ax, 0
  4569 00001B74 E94403                   jmp .retncheckreg
  4570                                  
  4571                                  ;-580   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4572                                  
  4573                                  .checkreg197:
  4574 00001B77 68[BC1E]                 push checkreg_0
  4575 00001B7A 8D06A36D                 lea  ax, [symbol]
  4576 00001B7E 50                       push ax
  4577 00001B7F E801E7                   call eqstr
  4578 00001B82 83C404                   add  sp, 4
  4579 00001B85 08C0                     or  al, al
  4580 00001B87 0F840600                 je .checkreg198
  4581 00001B8B B80100                   mov ax, 1
  4582 00001B8E E92A03                   jmp .retncheckreg
  4583                                  .checkreg198:
  4584 00001B91 68[BF1E]                 push checkreg_1
  4585 00001B94 8D06A36D                 lea  ax, [symbol]
  4586 00001B98 50                       push ax
  4587 00001B99 E8E7E6                   call eqstr
  4588 00001B9C 83C404                   add  sp, 4
  4589 00001B9F 08C0                     or  al, al
  4590 00001BA1 0F840600                 je .checkreg199
  4591 00001BA5 B80300                   mov ax, 3
  4592 00001BA8 E91003                   jmp .retncheckreg
  4593                                  
  4594                                  ;-581   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4595                                  
  4596                                  .checkreg199:
  4597 00001BAB 68[C21E]                 push checkreg_2
  4598 00001BAE 8D06A36D                 lea  ax, [symbol]
  4599 00001BB2 50                       push ax
  4600 00001BB3 E8CDE6                   call eqstr
  4601 00001BB6 83C404                   add  sp, 4
  4602 00001BB9 08C0                     or  al, al
  4603 00001BBB 0F840600                 je .checkreg200
  4604 00001BBF B80500                   mov ax, 5
  4605 00001BC2 E9F602                   jmp .retncheckreg
  4606                                  .checkreg200:
  4607 00001BC5 68[C51E]                 push checkreg_3
  4608 00001BC8 8D06A36D                 lea  ax, [symbol]
  4609 00001BCC 50                       push ax
  4610 00001BCD E8B3E6                   call eqstr
  4611 00001BD0 83C404                   add  sp, 4
  4612 00001BD3 08C0                     or  al, al
  4613 00001BD5 0F840600                 je .checkreg201
  4614 00001BD9 B80700                   mov ax, 7
  4615 00001BDC E9DC02                   jmp .retncheckreg
  4616                                  
  4617                                  ;-582   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4618                                  
  4619                                  .checkreg201:
  4620 00001BDF 68[C81E]                 push checkreg_4
  4621 00001BE2 8D06A36D                 lea  ax, [symbol]
  4622 00001BE6 50                       push ax
  4623 00001BE7 E899E6                   call eqstr
  4624 00001BEA 83C404                   add  sp, 4
  4625 00001BED 08C0                     or  al, al
  4626 00001BEF 0F840600                 je .checkreg202
  4627 00001BF3 B80900                   mov ax, 9
  4628 00001BF6 E9C202                   jmp .retncheckreg
  4629                                  .checkreg202:
  4630 00001BF9 68[CB1E]                 push checkreg_5
  4631 00001BFC 8D06A36D                 lea  ax, [symbol]
  4632 00001C00 50                       push ax
  4633 00001C01 E87FE6                   call eqstr
  4634 00001C04 83C404                   add  sp, 4
  4635 00001C07 08C0                     or  al, al
  4636 00001C09 0F840600                 je .checkreg203
  4637 00001C0D B80B00                   mov ax, 11
  4638 00001C10 E9A802                   jmp .retncheckreg
  4639                                  
  4640                                  ;-583   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4641                                  
  4642                                  .checkreg203:
  4643 00001C13 68[CE1E]                 push checkreg_6
  4644 00001C16 8D06A36D                 lea  ax, [symbol]
  4645 00001C1A 50                       push ax
  4646 00001C1B E865E6                   call eqstr
  4647 00001C1E 83C404                   add  sp, 4
  4648 00001C21 08C0                     or  al, al
  4649 00001C23 0F840600                 je .checkreg204
  4650 00001C27 B80D00                   mov ax, 13
  4651 00001C2A E98E02                   jmp .retncheckreg
  4652                                  .checkreg204:
  4653 00001C2D 68[D11E]                 push checkreg_7
  4654 00001C30 8D06A36D                 lea  ax, [symbol]
  4655 00001C34 50                       push ax
  4656 00001C35 E84BE6                   call eqstr
  4657 00001C38 83C404                   add  sp, 4
  4658 00001C3B 08C0                     or  al, al
  4659 00001C3D 0F840600                 je .checkreg205
  4660 00001C41 B80F00                   mov ax, 15
  4661 00001C44 E97402                   jmp .retncheckreg
  4662                                  
  4663                                  ;-584   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4664                                  
  4665                                  .checkreg205:
  4666 00001C47 68[D41E]                 push checkreg_8
  4667 00001C4A 8D06A36D                 lea  ax, [symbol]
  4668 00001C4E 50                       push ax
  4669 00001C4F E831E6                   call eqstr
  4670 00001C52 83C404                   add  sp, 4
  4671 00001C55 08C0                     or  al, al
  4672 00001C57 0F840600                 je .checkreg206
  4673 00001C5B B81100                   mov ax, 17
  4674 00001C5E E95A02                   jmp .retncheckreg
  4675                                  .checkreg206:
  4676 00001C61 68[D71E]                 push checkreg_9
  4677 00001C64 8D06A36D                 lea  ax, [symbol]
  4678 00001C68 50                       push ax
  4679 00001C69 E817E6                   call eqstr
  4680 00001C6C 83C404                   add  sp, 4
  4681 00001C6F 08C0                     or  al, al
  4682 00001C71 0F840600                 je .checkreg207
  4683 00001C75 B81300                   mov ax, 19
  4684 00001C78 E94002                   jmp .retncheckreg
  4685                                  
  4686                                  ;-585   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4687                                  
  4688                                  .checkreg207:
  4689 00001C7B 68[DA1E]                 push checkreg_10
  4690 00001C7E 8D06A36D                 lea  ax, [symbol]
  4691 00001C82 50                       push ax
  4692 00001C83 E8FDE5                   call eqstr
  4693 00001C86 83C404                   add  sp, 4
  4694 00001C89 08C0                     or  al, al
  4695 00001C8B 0F840600                 je .checkreg208
  4696 00001C8F B81500                   mov ax, 21
  4697 00001C92 E92602                   jmp .retncheckreg
  4698                                  .checkreg208:
  4699 00001C95 68[DD1E]                 push checkreg_11
  4700 00001C98 8D06A36D                 lea  ax, [symbol]
  4701 00001C9C 50                       push ax
  4702 00001C9D E8E3E5                   call eqstr
  4703 00001CA0 83C404                   add  sp, 4
  4704 00001CA3 08C0                     or  al, al
  4705 00001CA5 0F840600                 je .checkreg209
  4706 00001CA9 B81700                   mov ax, 23
  4707 00001CAC E90C02                   jmp .retncheckreg
  4708                                  
  4709                                  ;-586   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4710                                  
  4711                                  .checkreg209:
  4712 00001CAF 68[E01E]                 push checkreg_12
  4713 00001CB2 8D06A36D                 lea  ax, [symbol]
  4714 00001CB6 50                       push ax
  4715 00001CB7 E8C9E5                   call eqstr
  4716 00001CBA 83C404                   add  sp, 4
  4717 00001CBD 08C0                     or  al, al
  4718 00001CBF 0F840600                 je .checkreg210
  4719 00001CC3 B81900                   mov ax, 25
  4720 00001CC6 E9F201                   jmp .retncheckreg
  4721                                  .checkreg210:
  4722 00001CC9 68[E31E]                 push checkreg_13
  4723 00001CCC 8D06A36D                 lea  ax, [symbol]
  4724 00001CD0 50                       push ax
  4725 00001CD1 E8AFE5                   call eqstr
  4726 00001CD4 83C404                   add  sp, 4
  4727 00001CD7 08C0                     or  al, al
  4728 00001CD9 0F840600                 je .checkreg211
  4729 00001CDD B81B00                   mov ax, 27
  4730 00001CE0 E9D801                   jmp .retncheckreg
  4731                                  
  4732                                  ;-587   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4733                                  
  4734                                  .checkreg211:
  4735 00001CE3 68[E61E]                 push checkreg_14
  4736 00001CE6 8D06A36D                 lea  ax, [symbol]
  4737 00001CEA 50                       push ax
  4738 00001CEB E895E5                   call eqstr
  4739 00001CEE 83C404                   add  sp, 4
  4740 00001CF1 08C0                     or  al, al
  4741 00001CF3 0F840600                 je .checkreg212
  4742 00001CF7 B81D00                   mov ax, 29
  4743 00001CFA E9BE01                   jmp .retncheckreg
  4744                                  .checkreg212:
  4745 00001CFD 68[E91E]                 push checkreg_15
  4746 00001D00 8D06A36D                 lea  ax, [symbol]
  4747 00001D04 50                       push ax
  4748 00001D05 E87BE5                   call eqstr
  4749 00001D08 83C404                   add  sp, 4
  4750 00001D0B 08C0                     or  al, al
  4751 00001D0D 0F840600                 je .checkreg213
  4752 00001D11 B81F00                   mov ax, 31
  4753 00001D14 E9A401                   jmp .retncheckreg
  4754                                  
  4755                                  ;-588   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4756                                  
  4757                                  .checkreg213:
  4758 00001D17 68[EC1E]                 push checkreg_16
  4759 00001D1A 8D06A36D                 lea  ax, [symbol]
  4760 00001D1E 50                       push ax
  4761 00001D1F E861E5                   call eqstr
  4762 00001D22 83C404                   add  sp, 4
  4763 00001D25 08C0                     or  al, al
  4764 00001D27 0F840600                 je .checkreg214
  4765 00001D2B B82100                   mov ax, 33
  4766 00001D2E E98A01                   jmp .retncheckreg
  4767                                  .checkreg214:
  4768 00001D31 68[EF1E]                 push checkreg_17
  4769 00001D34 8D06A36D                 lea  ax, [symbol]
  4770 00001D38 50                       push ax
  4771 00001D39 E847E5                   call eqstr
  4772 00001D3C 83C404                   add  sp, 4
  4773 00001D3F 08C0                     or  al, al
  4774 00001D41 0F840600                 je .checkreg215
  4775 00001D45 B82300                   mov ax, 35
  4776 00001D48 E97001                   jmp .retncheckreg
  4777                                  
  4778                                  ;-589   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4779                                  
  4780                                  .checkreg215:
  4781 00001D4B 68[F21E]                 push checkreg_18
  4782 00001D4E 8D06A36D                 lea  ax, [symbol]
  4783 00001D52 50                       push ax
  4784 00001D53 E82DE5                   call eqstr
  4785 00001D56 83C404                   add  sp, 4
  4786 00001D59 08C0                     or  al, al
  4787 00001D5B 0F840600                 je .checkreg216
  4788 00001D5F B82500                   mov ax, 37
  4789 00001D62 E95601                   jmp .retncheckreg
  4790                                  .checkreg216:
  4791 00001D65 68[F51E]                 push checkreg_19
  4792 00001D68 8D06A36D                 lea  ax, [symbol]
  4793 00001D6C 50                       push ax
  4794 00001D6D E813E5                   call eqstr
  4795 00001D70 83C404                   add  sp, 4
  4796 00001D73 08C0                     or  al, al
  4797 00001D75 0F840600                 je .checkreg217
  4798 00001D79 B82700                   mov ax, 39
  4799 00001D7C E93C01                   jmp .retncheckreg
  4800                                  
  4801                                  ;-590   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4802                                  
  4803                                  .checkreg217:
  4804 00001D7F 68[F81E]                 push checkreg_20
  4805 00001D82 8D06A36D                 lea  ax, [symbol]
  4806 00001D86 50                       push ax
  4807 00001D87 E8F9E4                   call eqstr
  4808 00001D8A 83C404                   add  sp, 4
  4809 00001D8D 08C0                     or  al, al
  4810 00001D8F 0F840600                 je .checkreg218
  4811 00001D93 B82900                   mov ax, 41
  4812 00001D96 E92201                   jmp .retncheckreg
  4813                                  .checkreg218:
  4814 00001D99 68[FB1E]                 push checkreg_21
  4815 00001D9C 8D06A36D                 lea  ax, [symbol]
  4816 00001DA0 50                       push ax
  4817 00001DA1 E8DFE4                   call eqstr
  4818 00001DA4 83C404                   add  sp, 4
  4819 00001DA7 08C0                     or  al, al
  4820 00001DA9 0F840600                 je .checkreg219
  4821 00001DAD B82B00                   mov ax, 43
  4822 00001DB0 E90801                   jmp .retncheckreg
  4823                                  
  4824                                  ;-591   // (eqstr(symbol,"ip")) return 45;
  4825                                  
  4826                                  
  4827                                  ;-592   if (strlen(symbol) >   3) return 0;
  4828                                  
  4829                                  .checkreg219:
  4830 00001DB3 8D06A36D                 lea  ax, [symbol]
  4831 00001DB7 50                       push ax
  4832 00001DB8 E86AE4                   call strlen
  4833 00001DBB 83C402                   add  sp, 2
  4834 00001DBE 83F803                   cmp ax, 3
  4835 00001DC1 0F8E0600                 jle .checkreg220
  4836 00001DC5 B80000                   mov ax, 0
  4837 00001DC8 E9F000                   jmp .retncheckreg
  4838                                  
  4839                                  ;-593   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4840                                  
  4841                                  .checkreg220:
  4842 00001DCB 68[FE1E]                 push checkreg_22
  4843 00001DCE 8D06A36D                 lea  ax, [symbol]
  4844 00001DD2 50                       push ax
  4845 00001DD3 E8ADE4                   call eqstr
  4846 00001DD6 83C404                   add  sp, 4
  4847 00001DD9 08C0                     or  al, al
  4848 00001DDB 0F840600                 je .checkreg221
  4849 00001DDF B82F00                   mov ax, 47
  4850 00001DE2 E9D600                   jmp .retncheckreg
  4851                                  .checkreg221:
  4852 00001DE5 68[021F]                 push checkreg_23
  4853 00001DE8 8D06A36D                 lea  ax, [symbol]
  4854 00001DEC 50                       push ax
  4855 00001DED E893E4                   call eqstr
  4856 00001DF0 83C404                   add  sp, 4
  4857 00001DF3 08C0                     or  al, al
  4858 00001DF5 0F840600                 je .checkreg222
  4859 00001DF9 B83200                   mov ax, 50
  4860 00001DFC E9BC00                   jmp .retncheckreg
  4861                                  
  4862                                  ;-594   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4863                                  
  4864                                  .checkreg222:
  4865 00001DFF 68[061F]                 push checkreg_24
  4866 00001E02 8D06A36D                 lea  ax, [symbol]
  4867 00001E06 50                       push ax
  4868 00001E07 E879E4                   call eqstr
  4869 00001E0A 83C404                   add  sp, 4
  4870 00001E0D 08C0                     or  al, al
  4871 00001E0F 0F840600                 je .checkreg223
  4872 00001E13 B83500                   mov ax, 53
  4873 00001E16 E9A200                   jmp .retncheckreg
  4874                                  .checkreg223:
  4875 00001E19 68[0A1F]                 push checkreg_25
  4876 00001E1C 8D06A36D                 lea  ax, [symbol]
  4877 00001E20 50                       push ax
  4878 00001E21 E85FE4                   call eqstr
  4879 00001E24 83C404                   add  sp, 4
  4880 00001E27 08C0                     or  al, al
  4881 00001E29 0F840600                 je .checkreg224
  4882 00001E2D B83800                   mov ax, 56
  4883 00001E30 E98800                   jmp .retncheckreg
  4884                                  
  4885                                  ;-595   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4886                                  
  4887                                  .checkreg224:
  4888 00001E33 68[0E1F]                 push checkreg_26
  4889 00001E36 8D06A36D                 lea  ax, [symbol]
  4890 00001E3A 50                       push ax
  4891 00001E3B E845E4                   call eqstr
  4892 00001E3E 83C404                   add  sp, 4
  4893 00001E41 08C0                     or  al, al
  4894 00001E43 0F840600                 je .checkreg225
  4895 00001E47 B83B00                   mov ax, 59
  4896 00001E4A E96E00                   jmp .retncheckreg
  4897                                  .checkreg225:
  4898 00001E4D 68[121F]                 push checkreg_27
  4899 00001E50 8D06A36D                 lea  ax, [symbol]
  4900 00001E54 50                       push ax
  4901 00001E55 E82BE4                   call eqstr
  4902 00001E58 83C404                   add  sp, 4
  4903 00001E5B 08C0                     or  al, al
  4904 00001E5D 0F840600                 je .checkreg226
  4905 00001E61 B83E00                   mov ax, 62
  4906 00001E64 E95400                   jmp .retncheckreg
  4907                                  
  4908                                  ;-596   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4909                                  
  4910                                  .checkreg226:
  4911 00001E67 68[161F]                 push checkreg_28
  4912 00001E6A 8D06A36D                 lea  ax, [symbol]
  4913 00001E6E 50                       push ax
  4914 00001E6F E811E4                   call eqstr
  4915 00001E72 83C404                   add  sp, 4
  4916 00001E75 08C0                     or  al, al
  4917 00001E77 0F840600                 je .checkreg227
  4918 00001E7B B84100                   mov ax, 65
  4919 00001E7E E93A00                   jmp .retncheckreg
  4920                                  .checkreg227:
  4921 00001E81 68[1A1F]                 push checkreg_29
  4922 00001E84 8D06A36D                 lea  ax, [symbol]
  4923 00001E88 50                       push ax
  4924 00001E89 E8F7E3                   call eqstr
  4925 00001E8C 83C404                   add  sp, 4
  4926 00001E8F 08C0                     or  al, al
  4927 00001E91 0F840600                 je .checkreg228
  4928 00001E95 B84400                   mov ax, 68
  4929 00001E98 E92000                   jmp .retncheckreg
  4930                                  
  4931                                  ;-597   if (eqstr(symbol,"cr0")) return 71;
  4932                                  
  4933                                  .checkreg228:
  4934 00001E9B 68[1E1F]                 push checkreg_30
  4935 00001E9E 8D06A36D                 lea  ax, [symbol]
  4936 00001EA2 50                       push ax
  4937 00001EA3 E8DDE3                   call eqstr
  4938 00001EA6 83C404                   add  sp, 4
  4939 00001EA9 08C0                     or  al, al
  4940 00001EAB 0F840600                 je .checkreg229
  4941 00001EAF B84700                   mov ax, 71
  4942 00001EB2 E90600                   jmp .retncheckreg
  4943                                  
  4944                                  ;-598   return 0;   }
  4945                                  
  4946                                  .checkreg229:
  4947 00001EB5 B80000                   mov ax, 0
  4948 00001EB8 E90000                   jmp .retncheckreg
  4949                                  
  4950                                  ;-599 char printregstr[]
  4951                                  
  4952                                   .retncheckreg:
  4953 00001EBB C3                       ret
  4954 00001EBC 616C00                  checkreg_0 db "al",0
  4955 00001EBF 636C00                  checkreg_1 db "cl",0
  4956 00001EC2 646C00                  checkreg_2 db "dl",0
  4957 00001EC5 626C00                  checkreg_3 db "bl",0
  4958 00001EC8 616800                  checkreg_4 db "ah",0
  4959 00001ECB 636800                  checkreg_5 db "ch",0
  4960 00001ECE 646800                  checkreg_6 db "dh",0
  4961 00001ED1 626800                  checkreg_7 db "bh",0
  4962 00001ED4 617800                  checkreg_8 db "ax",0
  4963 00001ED7 637800                  checkreg_9 db "cx",0
  4964 00001EDA 647800                  checkreg_10 db "dx",0
  4965 00001EDD 627800                  checkreg_11 db "bx",0
  4966 00001EE0 737000                  checkreg_12 db "sp",0
  4967 00001EE3 627000                  checkreg_13 db "bp",0
  4968 00001EE6 736900                  checkreg_14 db "si",0
  4969 00001EE9 646900                  checkreg_15 db "di",0
  4970 00001EEC 657300                  checkreg_16 db "es",0
  4971 00001EEF 637300                  checkreg_17 db "cs",0
  4972 00001EF2 737300                  checkreg_18 db "ss",0
  4973 00001EF5 647300                  checkreg_19 db "ds",0
  4974 00001EF8 667300                  checkreg_20 db "fs",0
  4975 00001EFB 677300                  checkreg_21 db "gs",0
  4976 00001EFE 65617800                checkreg_22 db "eax",0
  4977 00001F02 65637800                checkreg_23 db "ecx",0
  4978 00001F06 65647800                checkreg_24 db "edx",0
  4979 00001F0A 65627800                checkreg_25 db "ebx",0
  4980 00001F0E 65737000                checkreg_26 db "esp",0
  4981 00001F12 65627000                checkreg_27 db "ebp",0
  4982 00001F16 65736900                checkreg_28 db "esi",0
  4983 00001F1A 65646900                checkreg_29 db "edi",0
  4984 00001F1E 63723000                checkreg_30 db "cr0",0
  4985                                  ENDP
  4986                                  
  4987                                  ;-600 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4988                                  
  4989 00001F22 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4990 00001F2B 616863686468626861-
  4991 00001F34 786378647862787370-
  4992 00001F3D 627073696469657363-
  4993 00001F46 737373647366736773-
  4994 00001F4F 697065617865637865-
  4995 00001F58 647865627865737065-
  4996 00001F61 627065736965646963-
  4997 00001F6A 723000             
  4998                                  
  4999                                  ;-601 //          1         2         3         4         5         6         7
  5000                                  
  5001                                  
  5002                                  ;-602 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  5003                                  
  5004                                  
  5005                                  ;-603 int printreg(int i) {  unsigned int k; unsigned char c;
  5006                                  
  5007                                  
  5008                                  printreg: PROC
  5009                                  
  5010                                  ;-604   k = &printregstr + i; c=*k; prc(c); i++;
  5011                                  
  5012                                  ;Function : printreg, Number of local variables: 3
  5013                                  ;   # type sign width addr used name   list of local variables
  5014                                  ;  200 var sign word   603 NULL i = bp+4
  5015                                  ;  201 var unsg word   603 NULL k = bp-2
  5016                                  ;  202 var unsg byte   603 NULL c = bp-4;
  5017 00001F6D C8040000                 ENTER  4,0
  5018 00001F71 B8[221F]                 mov ax, printregstr
  5019 00001F74 034604                   add ax, [bp+4]
  5020 00001F77 8946FE                   mov [bp-2], ax
  5021 00001F7A 8B5EFE                   mov bx, [bp-2]
  5022 00001F7D 8B07                     mov ax, [bx]
  5023 00001F7F 8846FC                   mov [bp-4], al
  5024 00001F82 8A46FC                   mov al, byte [bp-4]
  5025 00001F85 B400                     mov ah, 0
  5026 00001F87 50                       push ax
  5027 00001F88 E858E5                   call prc
  5028 00001F8B 83C402                   add  sp, 2
  5029 00001F8E FF4604                   inc  word[bp+4]
  5030                                  
  5031                                  ;-605   k = &printregstr + i; c=*k; prc(c);
  5032                                  
  5033 00001F91 B8[221F]                 mov ax, printregstr
  5034 00001F94 034604                   add ax, [bp+4]
  5035 00001F97 8946FE                   mov [bp-2], ax
  5036 00001F9A 8B5EFE                   mov bx, [bp-2]
  5037 00001F9D 8B07                     mov ax, [bx]
  5038 00001F9F 8846FC                   mov [bp-4], al
  5039 00001FA2 8A46FC                   mov al, byte [bp-4]
  5040 00001FA5 B400                     mov ah, 0
  5041 00001FA7 50                       push ax
  5042 00001FA8 E838E5                   call prc
  5043 00001FAB 83C402                   add  sp, 2
  5044                                  
  5045                                  ;-606   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  5046                                  
  5047 00001FAE 8B4604                   mov ax, [bp+4]
  5048 00001FB1 83F82F                   cmp ax, 47
  5049 00001FB4 0F8E2000                 jle .printreg230
  5050 00001FB8 FF4604                   inc  word[bp+4]
  5051 00001FBB B8[221F]                 mov ax, printregstr
  5052 00001FBE 034604                   add ax, [bp+4]
  5053 00001FC1 8946FE                   mov [bp-2], ax
  5054 00001FC4 8B5EFE                   mov bx, [bp-2]
  5055 00001FC7 8B07                     mov ax, [bx]
  5056 00001FC9 8846FC                   mov [bp-4], al
  5057 00001FCC 8A46FC                   mov al, byte [bp-4]
  5058 00001FCF B400                     mov ah, 0
  5059 00001FD1 50                       push ax
  5060 00001FD2 E80EE5                   call prc
  5061 00001FD5 83C402                   add  sp, 2
  5062                                  
  5063                                  ;-607 }
  5064                                  
  5065                                  .printreg230:
  5066                                  
  5067                                  ;-608 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  5068 00001FD8 C9                       LEAVE
  5069 00001FD9 C3                       ret
  5070                                  ENDP
  5071 00001FDA 0000                    evalue dw 0
  5072 00001FDC 0A00                    exprtype dw 10
  5073                                  
  5074                                  ;-609 int expr(int isRight)
  5075                                  
  5076                                  
  5077                                  expr: PROC
  5078                                  
  5079                                  ;-610 { int mode; int id1;     int ixarr; int ixconst;
  5080                                  
  5081                                  
  5082                                  ;-611   int ids;  int isCONST; int i;     unsigned char *p;
  5083                                  
  5084                                  
  5085                                  ;-612   if (istoken(T_CONST)) { evalue=lexval;
  5086                                  
  5087                                  ;Function : expr, Number of local variables: 9
  5088                                  ;   # type sign width addr used name   list of local variables
  5089                                  ;  200 var sign word   609 NULL isRight = bp+4
  5090                                  ;  201 var sign word   610 NULL mode = bp-2
  5091                                  ;  202 var sign word   610 NULL id1 = bp-4
  5092                                  ;  203 var sign word   610 NULL ixarr = bp-6
  5093                                  ;  204 var sign word   610 NULL ixconst = bp-8
  5094                                  ;  205 var sign word   611 NULL ids = bp-10
  5095                                  ;  206 var sign word   611 NULL isCONST = bp-12
  5096                                  ;  207 var sign word   611 NULL i = bp-14
  5097                                  ;  208 ptr unsg byte   611 NULL p = bp-16;
  5098 00001FDE C8100000                 ENTER  16,0
  5099 00001FE2 680101                   push 257
  5100 00001FE5 E82DE4                   call istoken
  5101 00001FE8 83C402                   add  sp, 2
  5102 00001FEB 08C0                     or  al, al
  5103 00001FED 0F841F00                 je .expr231
  5104 00001FF1 A1[3000]                 mov ax, [lexval]
  5105 00001FF4 A3[DA1F]                 mov word [evalue], ax
  5106                                  
  5107                                  ;-613     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  5108                                  
  5109 00001FF7 68[7E23]                 push expr_0
  5110 00001FFA E84DE5                   call prs
  5111 00001FFD 83C402                   add  sp, 2
  5112 00002000 FF36[3000]               push word [lexval]
  5113 00002004 E898E6                   call prunsign1
  5114 00002007 83C402                   add  sp, 2
  5115 0000200A B80400                   mov ax, 4
  5116 0000200D E96C03                   jmp .retnexpr
  5117                                  
  5118                                  ;-614   mode=typeName(); /*0=V,1=*,2=&*/
  5119                                  
  5120                                  .expr231:
  5121 00002010 E863ED                   call typeName
  5122 00002013 8946FE                   mov [bp-2], ax
  5123                                  
  5124                                  ;-615   ireg1=checkreg();
  5125                                  
  5126 00002016 E846FB                   call checkreg
  5127 00002019 A3[7613]                 mov word [ireg1], ax
  5128                                  
  5129                                  ;-616   if (ireg1) { doreg1(0); return; }
  5130                                  
  5131 0000201C A1[7613]                 mov ax, [ireg1]
  5132 0000201F 08C0                     or  al, al
  5133 00002021 0F840B00                 je .expr232
  5134 00002025 6A00                     push 0
  5135 00002027 E849F9                   call doreg1
  5136 0000202A 83C402                   add  sp, 2
  5137 0000202D E94C03                   jmp .retnexpr
  5138                                  
  5139                                  ;-617   if (token=='(')  {docall1(); goto e1; }
  5140                                  
  5141                                  .expr232:
  5142 00002030 A1[1E00]                 mov ax, [token]
  5143 00002033 83F828                   cmp ax, 40
  5144 00002036 0F850600                 jne .expr233
  5145 0000203A E82E0F                   call docall1
  5146 0000203D E93202                   jmp .e1
  5147                                  
  5148                                  ;-618   if (isreg()) goto e1;
  5149                                  
  5150                                  .expr233:
  5151 00002040 E88307                   call isreg
  5152 00002043 08C0                     or  al, al
  5153 00002045 0F840300                 je .expr234
  5154 00002049 E92602                   jmp .e1
  5155                                  
  5156                                  ;-619 
  5157                                  
  5158                                  
  5159                                  ;-620   id1=searchname(); gettypes(id1); ids=signi;
  5160                                  
  5161                                  .expr234:
  5162 0000204C E858EC                   call searchname
  5163 0000204F 8946FC                   mov [bp-4], ax
  5164 00002052 FF76FC                   push word [bp-4]
  5165 00002055 E811EB                   call gettypes
  5166 00002058 83C402                   add  sp, 2
  5167 0000205B A1[3500]                 mov ax, [signi]
  5168 0000205E 8946F6                   mov [bp-10], ax
  5169                                  
  5170                                  ;-621   ixarr=0;  ixconst=0;
  5171                                  
  5172 00002061 B80000                   mov ax, 0
  5173 00002064 8946FA                   mov [bp-6], ax
  5174 00002067 B80000                   mov ax, 0
  5175 0000206A 8946F8                   mov [bp-8], ax
  5176                                  
  5177                                  ;-622     if (istoken('[')) { if (istoken(T_CONST)) {
  5178                                  
  5179 0000206D 6A5B                     push 91
  5180 0000206F E8A3E3                   call istoken
  5181 00002072 83C402                   add  sp, 2
  5182 00002075 08C0                     or  al, al
  5183 00002077 0F845900                 je .expr235
  5184 0000207B 680101                   push 257
  5185 0000207E E894E3                   call istoken
  5186 00002081 83C402                   add  sp, 2
  5187 00002084 08C0                     or  al, al
  5188 00002086 0F841700                 je .expr236
  5189                                  
  5190                                  ;-623       ixconst=1; ixarr=lexval; expect(']');  }
  5191                                  
  5192 0000208A B80100                   mov ax, 1
  5193 0000208D 8946F8                   mov [bp-8], ax
  5194 00002090 A1[3000]                 mov ax, [lexval]
  5195 00002093 8946FA                   mov [bp-6], ax
  5196 00002096 6A5D                     push 93
  5197 00002098 E89CE3                   call expect
  5198 0000209B 83C402                   add  sp, 2
  5199                                  
  5200                                  ;-624     else {ixarr=searchname(); expect(T_NAME); expect(']');
  5201                                  
  5202 0000209E E93300                   jmp .expr237
  5203                                  .expr236:
  5204 000020A1 E803EC                   call searchname
  5205 000020A4 8946FA                   mov [bp-6], ax
  5206 000020A7 680001                   push 256
  5207 000020AA E88AE3                   call expect
  5208 000020AD 83C402                   add  sp, 2
  5209 000020B0 6A5D                     push 93
  5210 000020B2 E882E3                   call expect
  5211 000020B5 83C402                   add  sp, 2
  5212                                  
  5213                                  ;-625     gettypes(ixarr);
  5214                                  
  5215 000020B8 FF76FA                   push word [bp-6]
  5216 000020BB E8ABEA                   call gettypes
  5217 000020BE 83C402                   add  sp, 2
  5218                                  
  5219                                  ;-626     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  5220                                  
  5221 000020C1 A1[3800]                 mov ax, [widthi]
  5222 000020C4 83F802                   cmp ax, 2
  5223 000020C7 0F840900                 je  .expr238
  5224 000020CB 68[8A23]                 push expr_1
  5225 000020CE E8F422                   call error1
  5226 000020D1 83C402                   add  sp, 2
  5227                                  .expr238:
  5228                                  .expr237:
  5229                                  
  5230                                  ;-627   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  5231                                  
  5232                                  .expr235:
  5233 000020D4 68C304                   push 1219
  5234 000020D7 E83BE3                   call istoken
  5235 000020DA 83C402                   add  sp, 2
  5236 000020DD 08C0                     or  al, al
  5237 000020DF 0F844600                 je .expr239
  5238 000020E3 8B46FE                   mov ax, [bp-2]
  5239 000020E6 08C0                     or  al, al
  5240 000020E8 0F840900                 je .expr240
  5241 000020EC 68[AD23]                 push expr_2
  5242 000020EF E8D322                   call error1
  5243 000020F2 83C402                   add  sp, 2
  5244                                  
  5245                                  ;-628      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  5246                                  
  5247                                  .expr240:
  5248 000020F5 68[BD23]                 push expr_3
  5249 000020F8 E84FE4                   call prs
  5250 000020FB 83C402                   add  sp, 2
  5251 000020FE A1[3B00]                 mov ax, [wi]
  5252 00002101 83F802                   cmp ax, 2
  5253 00002104 0F850C00                 jne .expr241
  5254 00002108 68[C623]                 push expr_4
  5255 0000210B E83CE4                   call prs
  5256 0000210E 83C402                   add  sp, 2
  5257 00002111 E90900                   jmp .expr242
  5258                                  .expr241:
  5259 00002114 68[CB23]                 push expr_5
  5260 00002117 E830E4                   call prs
  5261 0000211A 83C402                   add  sp, 2
  5262                                  
  5263                                  ;-629      v(id1); goto e1;}
  5264                                  
  5265                                  .expr242:
  5266 0000211D FF76FC                   push word [bp-4]
  5267 00002120 E855E2                   call v
  5268 00002123 83C402                   add  sp, 2
  5269 00002126 E94901                   jmp .e1
  5270                                  
  5271                                  ;-630   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  5272                                  
  5273                                  .expr239:
  5274 00002129 68C904                   push 1225
  5275 0000212C E8E6E2                   call istoken
  5276 0000212F 83C402                   add  sp, 2
  5277 00002132 08C0                     or  al, al
  5278 00002134 0F844600                 je .expr243
  5279 00002138 8B46FE                   mov ax, [bp-2]
  5280 0000213B 08C0                     or  al, al
  5281 0000213D 0F840900                 je .expr244
  5282 00002141 68[D023]                 push expr_6
  5283 00002144 E87E22                   call error1
  5284 00002147 83C402                   add  sp, 2
  5285                                  
  5286                                  ;-631      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  5287                                  
  5288                                  .expr244:
  5289 0000214A 68[E023]                 push expr_7
  5290 0000214D E8FAE3                   call prs
  5291 00002150 83C402                   add  sp, 2
  5292 00002153 A1[3B00]                 mov ax, [wi]
  5293 00002156 83F802                   cmp ax, 2
  5294 00002159 0F850C00                 jne .expr245
  5295 0000215D 68[E923]                 push expr_8
  5296 00002160 E8E7E3                   call prs
  5297 00002163 83C402                   add  sp, 2
  5298 00002166 E90900                   jmp .expr246
  5299                                  .expr245:
  5300 00002169 68[EE23]                 push expr_9
  5301 0000216C E8DBE3                   call prs
  5302 0000216F 83C402                   add  sp, 2
  5303                                  
  5304                                  ;-632      v(id1); goto e1;}
  5305                                  
  5306                                  .expr246:
  5307 00002172 FF76FC                   push word [bp-4]
  5308 00002175 E800E2                   call v
  5309 00002178 83C402                   add  sp, 2
  5310 0000217B E9F400                   jmp .e1
  5311                                  
  5312                                  ;-633 
  5313                                  
  5314                                  
  5315                                  ;-634   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  5316                                  
  5317                                  .expr243:
  5318 0000217E 68CE04                   push 1230
  5319 00002181 E891E2                   call istoken
  5320 00002184 83C402                   add  sp, 2
  5321 00002187 08C0                     or  al, al
  5322 00002189 0F841200                 je .expr247
  5323 0000218D FF76FC                   push word [bp-4]
  5324 00002190 FF76FE                   push word [bp-2]
  5325 00002193 68[F323]                 push expr_10
  5326 00002196 E8A802                   call compoundass
  5327 00002199 83C406                   add  sp, 6
  5328 0000219C E9D300                   jmp .e1
  5329                                  
  5330                                  ;-635   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  5331                                  
  5332                                  .expr247:
  5333 0000219F 68CF04                   push 1231
  5334 000021A2 E870E2                   call istoken
  5335 000021A5 83C402                   add  sp, 2
  5336 000021A8 08C0                     or  al, al
  5337 000021AA 0F841200                 je .expr248
  5338 000021AE FF76FC                   push word [bp-4]
  5339 000021B1 FF76FE                   push word [bp-2]
  5340 000021B4 68[F723]                 push expr_11
  5341 000021B7 E88702                   call compoundass
  5342 000021BA 83C406                   add  sp, 6
  5343 000021BD E9B200                   jmp .e1
  5344                                  
  5345                                  ;-636   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  5346                                  
  5347                                  .expr248:
  5348 000021C0 68D204                   push 1234
  5349 000021C3 E84FE2                   call istoken
  5350 000021C6 83C402                   add  sp, 2
  5351 000021C9 08C0                     or  al, al
  5352 000021CB 0F841200                 je .expr249
  5353 000021CF FF76FC                   push word [bp-4]
  5354 000021D2 FF76FE                   push word [bp-2]
  5355 000021D5 68[FB23]                 push expr_12
  5356 000021D8 E86602                   call compoundass
  5357 000021DB 83C406                   add  sp, 6
  5358 000021DE E99100                   jmp .e1
  5359                                  
  5360                                  ;-637   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  5361                                  
  5362                                  .expr249:
  5363 000021E1 68D304                   push 1235
  5364 000021E4 E82EE2                   call istoken
  5365 000021E7 83C402                   add  sp, 2
  5366 000021EA 08C0                     or  al, al
  5367 000021EC 0F841200                 je .expr250
  5368 000021F0 FF76FC                   push word [bp-4]
  5369 000021F3 FF76FE                   push word [bp-2]
  5370 000021F6 68[FF23]                 push expr_13
  5371 000021F9 E84502                   call compoundass
  5372 000021FC 83C406                   add  sp, 6
  5373 000021FF E97000                   jmp .e1
  5374                                  
  5375                                  ;-638   if (istoken(T_MULASS    )) {error1("not implemented");}
  5376                                  
  5377                                  .expr250:
  5378 00002202 68D004                   push 1232
  5379 00002205 E80DE2                   call istoken
  5380 00002208 83C402                   add  sp, 2
  5381 0000220B 08C0                     or  al, al
  5382 0000220D 0F840900                 je .expr251
  5383 00002211 68[0224]                 push expr_14
  5384 00002214 E8AE21                   call error1
  5385 00002217 83C402                   add  sp, 2
  5386                                  
  5387                                  ;-639   if (istoken(T_DIVASS    )) {error1("not implemented");}
  5388                                  
  5389                                  .expr251:
  5390 0000221A 68D104                   push 1233
  5391 0000221D E8F5E1                   call istoken
  5392 00002220 83C402                   add  sp, 2
  5393 00002223 08C0                     or  al, al
  5394 00002225 0F840900                 je .expr252
  5395 00002229 68[1224]                 push expr_15
  5396 0000222C E89621                   call error1
  5397 0000222F 83C402                   add  sp, 2
  5398                                  
  5399                                  ;-640 
  5400                                  
  5401                                  
  5402                                  ;-641   if (istoken('=')) { exprtype= expr(1);
  5403                                  
  5404                                  .expr252:
  5405 00002232 6A3D                     push 61
  5406 00002234 E8DEE1                   call istoken
  5407 00002237 83C402                   add  sp, 2
  5408 0000223A 08C0                     or  al, al
  5409 0000223C 0F842000                 je .expr253
  5410 00002240 6A01                     push 1
  5411 00002242 E899FD                   call expr
  5412 00002245 83C402                   add  sp, 2
  5413 00002248 A3[DC1F]                 mov word [exprtype], ax
  5414                                  
  5415                                  ;-642   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  5416                                  
  5417 0000224B FF76F8                   push word [bp-8]
  5418 0000224E FF76FA                   push word [bp-6]
  5419 00002251 FF76FC                   push word [bp-4]
  5420 00002254 FF76FE                   push word [bp-2]
  5421 00002257 E85E08                   call doassign
  5422 0000225A 83C408                   add  sp, 8
  5423 0000225D E91200                   jmp .e1
  5424                                  
  5425                                  ;-643   dovar1(mode, "mov", ixarr, id1);
  5426                                  
  5427                                  .expr253:
  5428 00002260 FF76FC                   push word [bp-4]
  5429 00002263 FF76FA                   push word [bp-6]
  5430 00002266 68[2224]                 push expr_16
  5431 00002269 FF76FE                   push word [bp-2]
  5432 0000226C E87402                   call dovar1
  5433 0000226F 83C408                   add  sp, 8
  5434                                  
  5435                                  ;-644 
  5436                                  
  5437                                  
  5438                                  ;-645 e1:    if (istoken('+')) rterm("add");
  5439                                  
  5440                                  .e1:
  5441 00002272 6A2B                     push 43
  5442 00002274 E89EE1                   call istoken
  5443 00002277 83C402                   add  sp, 2
  5444 0000227A 08C0                     or  al, al
  5445 0000227C 0F840C00                 je .expr254
  5446 00002280 68[2624]                 push expr_17
  5447 00002283 E82704                   call rterm
  5448 00002286 83C402                   add  sp, 2
  5449                                  
  5450                                  ;-646   else if (istoken('-')) rterm("sub" );
  5451                                  
  5452 00002289 E9CF00                   jmp .expr255
  5453                                  .expr254:
  5454 0000228C 6A2D                     push 45
  5455 0000228E E884E1                   call istoken
  5456 00002291 83C402                   add  sp, 2
  5457 00002294 08C0                     or  al, al
  5458 00002296 0F840C00                 je .expr256
  5459 0000229A 68[2A24]                 push expr_18
  5460 0000229D E80D04                   call rterm
  5461 000022A0 83C402                   add  sp, 2
  5462                                  
  5463                                  ;-647   else if (istoken('&')) rterm("and" );
  5464                                  
  5465 000022A3 E9B500                   jmp .expr257
  5466                                  .expr256:
  5467 000022A6 6A26                     push 38
  5468 000022A8 E86AE1                   call istoken
  5469 000022AB 83C402                   add  sp, 2
  5470 000022AE 08C0                     or  al, al
  5471 000022B0 0F840C00                 je .expr258
  5472 000022B4 68[2E24]                 push expr_19
  5473 000022B7 E8F303                   call rterm
  5474 000022BA 83C402                   add  sp, 2
  5475                                  
  5476                                  ;-648   else if (istoken('|')) rterm("or" );
  5477                                  
  5478 000022BD E99B00                   jmp .expr259
  5479                                  .expr258:
  5480 000022C0 6A7C                     push 124
  5481 000022C2 E850E1                   call istoken
  5482 000022C5 83C402                   add  sp, 2
  5483 000022C8 08C0                     or  al, al
  5484 000022CA 0F840C00                 je .expr260
  5485 000022CE 68[3224]                 push expr_20
  5486 000022D1 E8D903                   call rterm
  5487 000022D4 83C402                   add  sp, 2
  5488                                  
  5489                                  ;-649   else if (istoken(T_LESSLESS)) rterm("shl");
  5490                                  
  5491 000022D7 E98100                   jmp .expr261
  5492                                  .expr260:
  5493 000022DA 68D804                   push 1240
  5494 000022DD E835E1                   call istoken
  5495 000022E0 83C402                   add  sp, 2
  5496 000022E3 08C0                     or  al, al
  5497 000022E5 0F840C00                 je .expr262
  5498 000022E9 68[3524]                 push expr_21
  5499 000022EC E8BE03                   call rterm
  5500 000022EF 83C402                   add  sp, 2
  5501                                  
  5502                                  ;-650   else if (istoken(T_GREATGREAT)) rterm("shr");
  5503                                  
  5504 000022F2 E96600                   jmp .expr263
  5505                                  .expr262:
  5506 000022F5 68D904                   push 1241
  5507 000022F8 E81AE1                   call istoken
  5508 000022FB 83C402                   add  sp, 2
  5509 000022FE 08C0                     or  al, al
  5510 00002300 0F840C00                 je .expr264
  5511 00002304 68[3924]                 push expr_22
  5512 00002307 E8A303                   call rterm
  5513 0000230A 83C402                   add  sp, 2
  5514                                  
  5515                                  ;-651   else if (istoken('*')) domul (ids);
  5516                                  
  5517 0000230D E94B00                   jmp .expr265
  5518                                  .expr264:
  5519 00002310 6A2A                     push 42
  5520 00002312 E800E1                   call istoken
  5521 00002315 83C402                   add  sp, 2
  5522 00002318 08C0                     or  al, al
  5523 0000231A 0F840C00                 je .expr266
  5524 0000231E FF76F6                   push word [bp-10]
  5525 00002321 E8DD09                   call domul
  5526 00002324 83C402                   add  sp, 2
  5527                                  
  5528                                  ;-652   else if (istoken('/')) doidiv(ids);
  5529                                  
  5530 00002327 E93100                   jmp .expr267
  5531                                  .expr266:
  5532 0000232A 6A2F                     push 47
  5533 0000232C E8E6E0                   call istoken
  5534 0000232F 83C402                   add  sp, 2
  5535 00002332 08C0                     or  al, al
  5536 00002334 0F840C00                 je .expr268
  5537 00002338 FF76F6                   push word [bp-10]
  5538 0000233B E8640A                   call doidiv
  5539 0000233E 83C402                   add  sp, 2
  5540                                  
  5541                                  ;-653   else if (istoken('%')) domod (ids);
  5542                                  
  5543 00002341 E91700                   jmp .expr269
  5544                                  .expr268:
  5545 00002344 6A25                     push 37
  5546 00002346 E8CCE0                   call istoken
  5547 00002349 83C402                   add  sp, 2
  5548 0000234C 08C0                     or  al, al
  5549 0000234E 0F840900                 je .expr270
  5550 00002352 FF76F6                   push word [bp-10]
  5551 00002355 E8ED0B                   call domod
  5552 00002358 83C402                   add  sp, 2
  5553                                  
  5554                                  ;-654   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  5555                                  
  5556                                  .expr270:
  5557                                  .expr269:
  5558                                  .expr267:
  5559                                  .expr265:
  5560                                  .expr263:
  5561                                  .expr261:
  5562                                  .expr259:
  5563                                  .expr257:
  5564                                  .expr255:
  5565 0000235B E88017                   call isrelational
  5566 0000235E 08C0                     or  al, al
  5567 00002360 0F841200                 je .expr271
  5568 00002364 68[3D24]                 push expr_23
  5569 00002367 E84303                   call rterm
  5570 0000236A 83C402                   add  sp, 2
  5571 0000236D FF76F6                   push word [bp-10]
  5572 00002370 E8AD14                   call cmpneg
  5573 00002373 83C402                   add  sp, 2
  5574                                  
  5575                                  ;-655   return 0;
  5576                                  
  5577                                  .expr271:
  5578 00002376 B80000                   mov ax, 0
  5579 00002379 E90000                   jmp .retnexpr
  5580                                  
  5581                                  ;-656 }
  5582                                  
  5583                                  
  5584                                  ;-657 
  5585                                  
  5586                                  
  5587                                  ;-658 int compoundass(char *op, int mode, int id1) {
  5588                                  
  5589 0000237C C9                       .retnexpr: LEAVE
  5590 0000237D C3                       ret
  5591 0000237E 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  5592 00002387 2C2000             
  5593 0000238A 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  5594 00002393 78206D757373205A61-
  5595 0000239C 686C206F6465722069-
  5596 000023A5 6E74207365696E00   
  5597 000023AD 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  5598 000023B6 726C6175627400     
  5599 000023BD 5C6E20696E63202000      expr_3 db "\n inc  ",0
  5600 000023C6 776F726400              expr_4 db "word",0
  5601 000023CB 6279746500              expr_5 db "byte",0
  5602 000023D0 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  5603 000023D9 726C6175627400     
  5604 000023E0 5C6E20646563202000      expr_7 db "\n dec  ",0
  5605 000023E9 776F726400              expr_8 db "word",0
  5606 000023EE 6279746500              expr_9 db "byte",0
  5607 000023F3 61646400                expr_10 db "add",0
  5608 000023F7 73756200                expr_11 db "sub",0
  5609 000023FB 616E6400                expr_12 db "and",0
  5610 000023FF 6F7200                  expr_13 db "or",0
  5611 00002402 6E6F7420696D706C65-     expr_14 db "not implemented",0
  5612 0000240B 6D656E74656400     
  5613 00002412 6E6F7420696D706C65-     expr_15 db "not implemented",0
  5614 0000241B 6D656E74656400     
  5615 00002422 6D6F7600                expr_16 db "mov",0
  5616 00002426 61646400                expr_17 db "add",0
  5617 0000242A 73756200                expr_18 db "sub",0
  5618 0000242E 616E6400                expr_19 db "and",0
  5619 00002432 6F7200                  expr_20 db "or",0
  5620 00002435 73686C00                expr_21 db "shl",0
  5621 00002439 73687200                expr_22 db "shr",0
  5622 0000243D 636D7000                expr_23 db "cmp",0
  5623                                  ENDP
  5624                                  
  5625                                  compoundass: PROC
  5626                                  
  5627                                  ;-659   if(mode) error1("only scalar Var allowed");
  5628                                  
  5629                                  ;Function : compoundass, Number of local variables: 3
  5630                                  ;   # type sign width addr used name   list of local variables
  5631                                  ;  200 ptr sign byte   658 NULL op = bp+4
  5632                                  ;  201 var sign word   658 NULL mode = bp+6
  5633                                  ;  202 var sign word   658 NULL id1 = bp+8;
  5634 00002441 C8000000                 ENTER  0,0
  5635 00002445 8B4606                   mov ax, [bp+6]
  5636 00002448 08C0                     or  al, al
  5637 0000244A 0F840900                 je .compoundass272
  5638 0000244E 68[BB24]                 push compoundass_0
  5639 00002451 E8711F                   call error1
  5640 00002454 83C402                   add  sp, 2
  5641                                  
  5642                                  ;-660   prnl(); prs(op); prs("  ");
  5643                                  
  5644                                  .compoundass272:
  5645 00002457 E8E2E0                   call prnl
  5646 0000245A FF7604                   push word [bp+4]
  5647 0000245D E8EAE0                   call prs
  5648 00002460 83C402                   add  sp, 2
  5649 00002463 68[D324]                 push compoundass_1
  5650 00002466 E8E1E0                   call prs
  5651 00002469 83C402                   add  sp, 2
  5652                                  
  5653                                  ;-661   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5654                                  
  5655 0000246C FF7608                   push word [bp+8]
  5656 0000246F E8F7E6                   call gettypes
  5657 00002472 83C402                   add  sp, 2
  5658 00002475 A1[3B00]                 mov ax, [wi]
  5659 00002478 83F802                   cmp ax, 2
  5660 0000247B 0F850C00                 jne .compoundass273
  5661 0000247F 68[D624]                 push compoundass_2
  5662 00002482 E8C5E0                   call prs
  5663 00002485 83C402                   add  sp, 2
  5664 00002488 E90900                   jmp .compoundass274
  5665                                  .compoundass273:
  5666 0000248B 68[DB24]                 push compoundass_3
  5667 0000248E E8B9E0                   call prs
  5668 00002491 83C402                   add  sp, 2
  5669                                  
  5670                                  ;-662   v(id1); prs(", ");
  5671                                  
  5672                                  .compoundass274:
  5673 00002494 FF7608                   push word [bp+8]
  5674 00002497 E8DEDE                   call v
  5675 0000249A 83C402                   add  sp, 2
  5676 0000249D 68[E024]                 push compoundass_4
  5677 000024A0 E8A7E0                   call prs
  5678 000024A3 83C402                   add  sp, 2
  5679                                  
  5680                                  ;-663   expect(T_CONST); prunsign1(lexval);
  5681                                  
  5682 000024A6 680101                   push 257
  5683 000024A9 E88BDF                   call expect
  5684 000024AC 83C402                   add  sp, 2
  5685 000024AF FF36[3000]               push word [lexval]
  5686 000024B3 E8E9E1                   call prunsign1
  5687 000024B6 83C402                   add  sp, 2
  5688                                  
  5689                                  ;-664 }
  5690                                  
  5691                                  
  5692                                  ;-665 int dovar1(int mode, int op, int ixarr, int id1) {
  5693 000024B9 C9                       LEAVE
  5694 000024BA C3                       ret
  5695 000024BB 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5696 000024C4 61722056617220616C-
  5697 000024CD 6C6F77656400       
  5698 000024D3 202000                  compoundass_1 db "  ",0
  5699 000024D6 776F726400              compoundass_2 db "word",0
  5700 000024DB 6279746500              compoundass_3 db "byte",0
  5701 000024E0 2C2000                  compoundass_4 db ", ",0
  5702                                  ENDP
  5703                                  
  5704                                  dovar1: PROC
  5705                                  
  5706                                  ;-666   gettypes(id1);
  5707                                  
  5708                                  ;Function : dovar1, Number of local variables: 4
  5709                                  ;   # type sign width addr used name   list of local variables
  5710                                  ;  200 var sign word   665 NULL mode = bp+4
  5711                                  ;  201 var sign word   665 NULL op = bp+6
  5712                                  ;  202 var sign word   665 NULL ixarr = bp+8
  5713                                  ;  203 var sign word   665 NULL id1 = bp+10;
  5714 000024E3 C8000000                 ENTER  0,0
  5715 000024E7 FF760A                   push word [bp+10]
  5716 000024EA E87CE6                   call gettypes
  5717 000024ED 83C402                   add  sp, 2
  5718                                  
  5719                                  ;-667   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5720                                  
  5721 000024F0 8B4604                   mov ax, [bp+4]
  5722 000024F3 83F801                   cmp ax, 1
  5723 000024F6 0F854700                 jne .dovar1275
  5724 000024FA 68[3826]                 push dovar1_0
  5725 000024FD E84AE0                   call prs
  5726 00002500 83C402                   add  sp, 2
  5727 00002503 FF760A                   push word [bp+10]
  5728 00002506 E86FDE                   call v
  5729 00002509 83C402                   add  sp, 2
  5730 0000250C E82DE0                   call prnl
  5731 0000250F FF7606                   push word [bp+6]
  5732 00002512 E835E0                   call prs
  5733 00002515 83C402                   add  sp, 2
  5734                                  
  5735                                  ;-668     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5736                                  
  5737 00002518 A1[3800]                 mov ax, [widthi]
  5738 0000251B 83F801                   cmp ax, 1
  5739 0000251E 0F850900                 jne .dovar1276
  5740 00002522 68[4426]                 push dovar1_1
  5741 00002525 E822E0                   call prs
  5742 00002528 83C402                   add  sp, 2
  5743                                  
  5744                                  ;-669     if(widthi == 2) prs(" ax, [bx]");
  5745                                  
  5746                                  .dovar1276:
  5747 0000252B A1[3800]                 mov ax, [widthi]
  5748 0000252E 83F802                   cmp ax, 2
  5749 00002531 0F850900                 jne .dovar1277
  5750 00002535 68[5A26]                 push dovar1_2
  5751 00002538 E80FE0                   call prs
  5752 0000253B 83C402                   add  sp, 2
  5753                                  
  5754                                  ;-670     return; }
  5755                                  
  5756                                  .dovar1277:
  5757 0000253E E9F500                   jmp .retndovar1
  5758                                  
  5759                                  ;-671   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5760                                  
  5761                                  .dovar1275:
  5762 00002541 8B4604                   mov ax, [bp+4]
  5763 00002544 83F802                   cmp ax, 2
  5764 00002547 0F852100                 jne .dovar1278
  5765 0000254B E8EEDF                   call prnl
  5766 0000254E FF7606                   push word [bp+6]
  5767 00002551 E8F6DF                   call prs
  5768 00002554 83C402                   add  sp, 2
  5769 00002557 68[6426]                 push dovar1_3
  5770 0000255A E8EDDF                   call prs
  5771 0000255D 83C402                   add  sp, 2
  5772 00002560 FF760A                   push word [bp+10]
  5773 00002563 E803DE                   call a
  5774 00002566 83C402                   add  sp, 2
  5775 00002569 E9CA00                   jmp .retndovar1
  5776                                  
  5777                                  ;-672   if (ixarr) {
  5778                                  
  5779                                  .dovar1278:
  5780 0000256C 8B4608                   mov ax, [bp+8]
  5781 0000256F 08C0                     or  al, al
  5782 00002571 0F847300                 je .dovar1279
  5783                                  
  5784                                  ;-673     prs("\n mov bx, "); v(ixarr);
  5785                                  
  5786 00002575 68[6A26]                 push dovar1_4
  5787 00002578 E8CFDF                   call prs
  5788 0000257B 83C402                   add  sp, 2
  5789 0000257E FF7608                   push word [bp+8]
  5790 00002581 E8F4DD                   call v
  5791 00002584 83C402                   add  sp, 2
  5792                                  
  5793                                  ;-674     if (wi==2) prs("\n shl bx, 1");
  5794                                  
  5795 00002587 A1[3B00]                 mov ax, [wi]
  5796 0000258A 83F802                   cmp ax, 2
  5797 0000258D 0F850900                 jne .dovar1280
  5798 00002591 68[7626]                 push dovar1_5
  5799 00002594 E8B3DF                   call prs
  5800 00002597 83C402                   add  sp, 2
  5801                                  
  5802                                  ;-675     prs("\n "); prs(op);
  5803                                  
  5804                                  .dovar1280:
  5805 0000259A 68[8326]                 push dovar1_6
  5806 0000259D E8AADF                   call prs
  5807 000025A0 83C402                   add  sp, 2
  5808 000025A3 FF7606                   push word [bp+6]
  5809 000025A6 E8A1DF                   call prs
  5810 000025A9 83C402                   add  sp, 2
  5811                                  
  5812                                  ;-676     if (wi==2) prs(" ax, "); else prs(" al, ");
  5813                                  
  5814 000025AC A1[3B00]                 mov ax, [wi]
  5815 000025AF 83F802                   cmp ax, 2
  5816 000025B2 0F850C00                 jne .dovar1281
  5817 000025B6 68[8726]                 push dovar1_7
  5818 000025B9 E88EDF                   call prs
  5819 000025BC 83C402                   add  sp, 2
  5820 000025BF E90900                   jmp .dovar1282
  5821                                  .dovar1281:
  5822 000025C2 68[8D26]                 push dovar1_8
  5823 000025C5 E882DF                   call prs
  5824 000025C8 83C402                   add  sp, 2
  5825                                  
  5826                                  ;-677 // v(id1); prs(" [bx]");
  5827                                  
  5828                                  
  5829                                  ;-678     prc('['); printName(id1); prs(" + bx]");
  5830                                  
  5831                                  .dovar1282:
  5832 000025CB 6A5B                     push 91
  5833 000025CD E813DF                   call prc
  5834 000025D0 83C402                   add  sp, 2
  5835 000025D3 FF760A                   push word [bp+10]
  5836 000025D6 E86AE6                   call printName
  5837 000025D9 83C402                   add  sp, 2
  5838 000025DC 68[9326]                 push dovar1_9
  5839 000025DF E868DF                   call prs
  5840 000025E2 83C402                   add  sp, 2
  5841                                  
  5842                                  ;-679     return; }
  5843                                  
  5844 000025E5 E94E00                   jmp .retndovar1
  5845                                  
  5846                                  ;-680   prnl();prs(op);
  5847                                  
  5848                                  .dovar1279:
  5849 000025E8 E851DF                   call prnl
  5850 000025EB FF7606                   push word [bp+6]
  5851 000025EE E859DF                   call prs
  5852 000025F1 83C402                   add  sp, 2
  5853                                  
  5854                                  ;-681   if(wi==1) prs(" al, ");
  5855                                  
  5856 000025F4 A1[3B00]                 mov ax, [wi]
  5857 000025F7 83F801                   cmp ax, 1
  5858 000025FA 0F850900                 jne .dovar1283
  5859 000025FE 68[9A26]                 push dovar1_10
  5860 00002601 E846DF                   call prs
  5861 00002604 83C402                   add  sp, 2
  5862                                  
  5863                                  ;-682   if(wi==2) prs(" ax, ");
  5864                                  
  5865                                  .dovar1283:
  5866 00002607 A1[3B00]                 mov ax, [wi]
  5867 0000260A 83F802                   cmp ax, 2
  5868 0000260D 0F850900                 jne .dovar1284
  5869 00002611 68[A026]                 push dovar1_11
  5870 00002614 E833DF                   call prs
  5871 00002617 83C402                   add  sp, 2
  5872                                  
  5873                                  ;-683   if(wi==4) prs(" eax, ");
  5874                                  
  5875                                  .dovar1284:
  5876 0000261A A1[3B00]                 mov ax, [wi]
  5877 0000261D 83F804                   cmp ax, 4
  5878 00002620 0F850900                 jne .dovar1285
  5879 00002624 68[A626]                 push dovar1_12
  5880 00002627 E820DF                   call prs
  5881 0000262A 83C402                   add  sp, 2
  5882                                  
  5883                                  ;-684   v(id1);
  5884                                  
  5885                                  .dovar1285:
  5886 0000262D FF760A                   push word [bp+10]
  5887 00002630 E845DD                   call v
  5888 00002633 83C402                   add  sp, 2
  5889                                  
  5890                                  ;-685 }
  5891                                  
  5892                                  
  5893                                  ;-686 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5894                                  
  5895 00002636 C9                       .retndovar1: LEAVE
  5896 00002637 C3                       ret
  5897 00002638 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5898 00002641 2C2000             
  5899 00002644 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5900 0000264D 5C6E206D6F76206168-
  5901 00002656 2C203000           
  5902 0000265A 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5903 00002663 00                 
  5904 00002664 2061782C2000            dovar1_3 db " ax, ",0
  5905 0000266A 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5906 00002673 2C2000             
  5907 00002676 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5908 0000267F 2C203100           
  5909 00002683 5C6E2000                dovar1_6 db "\n ",0
  5910 00002687 2061782C2000            dovar1_7 db " ax, ",0
  5911 0000268D 20616C2C2000            dovar1_8 db " al, ",0
  5912 00002693 202B2062785D00          dovar1_9 db " + bx]",0
  5913 0000269A 20616C2C2000            dovar1_10 db " al, ",0
  5914 000026A0 2061782C2000            dovar1_11 db " ax, ",0
  5915 000026A6 206561782C2000          dovar1_12 db " eax, ",0
  5916                                  ENDP
  5917                                  
  5918                                  rterm: PROC
  5919                                  
  5920                                  ;-687   if (istoken(T_CONST)) { prnl(); prs(op);
  5921                                  
  5922                                  ;Function : rterm, Number of local variables: 5
  5923                                  ;   # type sign width addr used name   list of local variables
  5924                                  ;  200 ptr sign byte   686 NULL op = bp+4
  5925                                  ;  201 var sign word   686 NULL mode = bp-2
  5926                                  ;  202 var sign word   686 NULL opint = bp-4
  5927                                  ;  203 var sign word   686 NULL ixarr = bp-6
  5928                                  ;  204 var sign word   686 NULL id1 = bp-8;
  5929 000026AD C8080000                 ENTER  8,0
  5930 000026B1 680101                   push 257
  5931 000026B4 E85EDD                   call istoken
  5932 000026B7 83C402                   add  sp, 2
  5933 000026BA 08C0                     or  al, al
  5934 000026BC 0F845200                 je .rterm286
  5935 000026C0 E879DE                   call prnl
  5936 000026C3 FF7604                   push word [bp+4]
  5937 000026C6 E881DE                   call prs
  5938 000026C9 83C402                   add  sp, 2
  5939                                  
  5940                                  ;-688     if (wi==1) prs(" al, ");
  5941                                  
  5942 000026CC A1[3B00]                 mov ax, [wi]
  5943 000026CF 83F801                   cmp ax, 1
  5944 000026D2 0F850900                 jne .rterm287
  5945 000026D6 68[9627]                 push rterm_0
  5946 000026D9 E86EDE                   call prs
  5947 000026DC 83C402                   add  sp, 2
  5948                                  
  5949                                  ;-689     if (wi==2) prs(" ax, ");
  5950                                  
  5951                                  .rterm287:
  5952 000026DF A1[3B00]                 mov ax, [wi]
  5953 000026E2 83F802                   cmp ax, 2
  5954 000026E5 0F850900                 jne .rterm288
  5955 000026E9 68[9C27]                 push rterm_1
  5956 000026EC E85BDE                   call prs
  5957 000026EF 83C402                   add  sp, 2
  5958                                  
  5959                                  ;-690     if (wi==4) prs(" eax, ");
  5960                                  
  5961                                  .rterm288:
  5962 000026F2 A1[3B00]                 mov ax, [wi]
  5963 000026F5 83F804                   cmp ax, 4
  5964 000026F8 0F850900                 jne .rterm289
  5965 000026FC 68[A227]                 push rterm_2
  5966 000026FF E848DE                   call prs
  5967 00002702 83C402                   add  sp, 2
  5968                                  
  5969                                  ;-691     prunsign1(lexval); return;}
  5970                                  
  5971                                  .rterm289:
  5972 00002705 FF36[3000]               push word [lexval]
  5973 00002709 E893DF                   call prunsign1
  5974 0000270C 83C402                   add  sp, 2
  5975 0000270F E98200                   jmp .retnrterm
  5976                                  
  5977                                  ;-692   mode=typeName(); id1=searchname(); ixarr=0;
  5978                                  
  5979                                  .rterm286:
  5980 00002712 E861E6                   call typeName
  5981 00002715 8946FE                   mov [bp-2], ax
  5982 00002718 E88CE5                   call searchname
  5983 0000271B 8946F8                   mov [bp-8], ax
  5984 0000271E B80000                   mov ax, 0
  5985 00002721 8946FA                   mov [bp-6], ax
  5986                                  
  5987                                  ;-693   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5988                                  
  5989 00002724 6A5B                     push 91
  5990 00002726 E8ECDC                   call istoken
  5991 00002729 83C402                   add  sp, 2
  5992 0000272C 08C0                     or  al, al
  5993 0000272E 0F843300                 je .rterm290
  5994 00002732 E872E5                   call searchname
  5995 00002735 8946FA                   mov [bp-6], ax
  5996 00002738 680001                   push 256
  5997 0000273B E8F9DC                   call expect
  5998 0000273E 83C402                   add  sp, 2
  5999 00002741 6A5D                     push 93
  6000 00002743 E8F1DC                   call expect
  6001 00002746 83C402                   add  sp, 2
  6002                                  
  6003                                  ;-694     gettypes(ixarr);
  6004                                  
  6005 00002749 FF76FA                   push word [bp-6]
  6006 0000274C E81AE4                   call gettypes
  6007 0000274F 83C402                   add  sp, 2
  6008                                  
  6009                                  ;-695     if (widthi != 2) error1("Arrayindex muss int sein"); }
  6010                                  
  6011 00002752 A1[3800]                 mov ax, [widthi]
  6012 00002755 83F802                   cmp ax, 2
  6013 00002758 0F840900                 je  .rterm291
  6014 0000275C 68[A927]                 push rterm_3
  6015 0000275F E8631C                   call error1
  6016 00002762 83C402                   add  sp, 2
  6017                                  .rterm291:
  6018                                  
  6019                                  ;-696   if (eqstr(symbol,"_AX")) return;
  6020                                  
  6021                                  .rterm290:
  6022 00002765 68[C227]                 push rterm_4
  6023 00002768 8D06A36D                 lea  ax, [symbol]
  6024 0000276C 50                       push ax
  6025 0000276D E813DB                   call eqstr
  6026 00002770 83C404                   add  sp, 4
  6027 00002773 08C0                     or  al, al
  6028 00002775 0F840300                 je .rterm292
  6029 00002779 E91800                   jmp .retnrterm
  6030                                  
  6031                                  ;-697   opint=op; dovar1(mode, opint, ixarr, id1);
  6032                                  
  6033                                  .rterm292:
  6034 0000277C 8B4604                   mov ax, [bp+4]
  6035 0000277F 8946FC                   mov [bp-4], ax
  6036 00002782 FF76F8                   push word [bp-8]
  6037 00002785 FF76FA                   push word [bp-6]
  6038 00002788 FF76FC                   push word [bp-4]
  6039 0000278B FF76FE                   push word [bp-2]
  6040 0000278E E852FD                   call dovar1
  6041 00002791 83C408                   add  sp, 8
  6042                                  
  6043                                  ;-698 }
  6044                                  
  6045                                  
  6046                                  ;-699 int isreg() {
  6047                                  
  6048 00002794 C9                       .retnrterm: LEAVE
  6049 00002795 C3                       ret
  6050 00002796 20616C2C2000            rterm_0 db " al, ",0
  6051 0000279C 2061782C2000            rterm_1 db " ax, ",0
  6052 000027A2 206561782C2000          rterm_2 db " eax, ",0
  6053 000027A9 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  6054 000027B2 78206D75737320696E-
  6055 000027BB 74207365696E00     
  6056 000027C2 5F415800                rterm_4 db "_AX",0
  6057                                  ENDP
  6058                                  
  6059                                  isreg: PROC
  6060                                  
  6061                                  ;-700   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  6062                                  
  6063 000027C6 68[B329]                 push isreg_0
  6064 000027C9 8D06A36D                 lea  ax, [symbol]
  6065 000027CD 50                       push ax
  6066 000027CE E8B2DA                   call eqstr
  6067 000027D1 83C404                   add  sp, 4
  6068 000027D4 08C0                     or  al, al
  6069 000027D6 0F840C00                 je .isreg293
  6070 000027DA 68[B729]                 push isreg_1
  6071 000027DD E84202                   call doreg
  6072 000027E0 83C402                   add  sp, 2
  6073 000027E3 E9C601                   jmp .r1
  6074                                  
  6075                                  ;-701   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  6076                                  
  6077                                  .isreg293:
  6078 000027E6 68[BA29]                 push isreg_2
  6079 000027E9 8D06A36D                 lea  ax, [symbol]
  6080 000027ED 50                       push ax
  6081 000027EE E892DA                   call eqstr
  6082 000027F1 83C404                   add  sp, 4
  6083 000027F4 08C0                     or  al, al
  6084 000027F6 0F840C00                 je .isreg294
  6085 000027FA 68[BE29]                 push isreg_3
  6086 000027FD E82202                   call doreg
  6087 00002800 83C402                   add  sp, 2
  6088 00002803 E9A601                   jmp .r1
  6089                                  
  6090                                  ;-702   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  6091                                  
  6092                                  .isreg294:
  6093 00002806 68[C129]                 push isreg_4
  6094 00002809 8D06A36D                 lea  ax, [symbol]
  6095 0000280D 50                       push ax
  6096 0000280E E872DA                   call eqstr
  6097 00002811 83C404                   add  sp, 4
  6098 00002814 08C0                     or  al, al
  6099 00002816 0F840C00                 je .isreg295
  6100 0000281A 68[C529]                 push isreg_5
  6101 0000281D E80202                   call doreg
  6102 00002820 83C402                   add  sp, 2
  6103 00002823 E98601                   jmp .r1
  6104                                  
  6105                                  ;-703   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  6106                                  
  6107                                  .isreg295:
  6108 00002826 68[C829]                 push isreg_6
  6109 00002829 8D06A36D                 lea  ax, [symbol]
  6110 0000282D 50                       push ax
  6111 0000282E E852DA                   call eqstr
  6112 00002831 83C404                   add  sp, 4
  6113 00002834 08C0                     or  al, al
  6114 00002836 0F840C00                 je .isreg296
  6115 0000283A 68[CC29]                 push isreg_7
  6116 0000283D E8E201                   call doreg
  6117 00002840 83C402                   add  sp, 2
  6118 00002843 E96601                   jmp .r1
  6119                                  
  6120                                  ;-704   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  6121                                  
  6122                                  .isreg296:
  6123 00002846 68[CF29]                 push isreg_8
  6124 00002849 8D06A36D                 lea  ax, [symbol]
  6125 0000284D 50                       push ax
  6126 0000284E E832DA                   call eqstr
  6127 00002851 83C404                   add  sp, 4
  6128 00002854 08C0                     or  al, al
  6129 00002856 0F840C00                 je .isreg297
  6130 0000285A 68[D329]                 push isreg_9
  6131 0000285D E8C201                   call doreg
  6132 00002860 83C402                   add  sp, 2
  6133 00002863 E94601                   jmp .r1
  6134                                  
  6135                                  ;-705   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  6136                                  
  6137                                  .isreg297:
  6138 00002866 68[D629]                 push isreg_10
  6139 00002869 8D06A36D                 lea  ax, [symbol]
  6140 0000286D 50                       push ax
  6141 0000286E E812DA                   call eqstr
  6142 00002871 83C404                   add  sp, 4
  6143 00002874 08C0                     or  al, al
  6144 00002876 0F840C00                 je .isreg298
  6145 0000287A 68[DA29]                 push isreg_11
  6146 0000287D E8A201                   call doreg
  6147 00002880 83C402                   add  sp, 2
  6148 00002883 E92601                   jmp .r1
  6149                                  
  6150                                  ;-706   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  6151                                  
  6152                                  .isreg298:
  6153 00002886 68[DD29]                 push isreg_12
  6154 00002889 8D06A36D                 lea  ax, [symbol]
  6155 0000288D 50                       push ax
  6156 0000288E E8F2D9                   call eqstr
  6157 00002891 83C404                   add  sp, 4
  6158 00002894 08C0                     or  al, al
  6159 00002896 0F840C00                 je .isreg299
  6160 0000289A 68[E129]                 push isreg_13
  6161 0000289D E88201                   call doreg
  6162 000028A0 83C402                   add  sp, 2
  6163 000028A3 E90601                   jmp .r1
  6164                                  
  6165                                  ;-707   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  6166                                  
  6167                                  .isreg299:
  6168 000028A6 68[E429]                 push isreg_14
  6169 000028A9 8D06A36D                 lea  ax, [symbol]
  6170 000028AD 50                       push ax
  6171 000028AE E8D2D9                   call eqstr
  6172 000028B1 83C404                   add  sp, 4
  6173 000028B4 08C0                     or  al, al
  6174 000028B6 0F840C00                 je .isreg300
  6175 000028BA 68[E829]                 push isreg_15
  6176 000028BD E86201                   call doreg
  6177 000028C0 83C402                   add  sp, 2
  6178 000028C3 E9E600                   jmp .r1
  6179                                  
  6180                                  ;-708   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  6181                                  
  6182                                  .isreg300:
  6183 000028C6 68[EB29]                 push isreg_16
  6184 000028C9 8D06A36D                 lea  ax, [symbol]
  6185 000028CD 50                       push ax
  6186 000028CE E8B2D9                   call eqstr
  6187 000028D1 83C404                   add  sp, 4
  6188 000028D4 08C0                     or  al, al
  6189 000028D6 0F840C00                 je .isreg301
  6190 000028DA 68[EF29]                 push isreg_17
  6191 000028DD E84201                   call doreg
  6192 000028E0 83C402                   add  sp, 2
  6193 000028E3 E9C600                   jmp .r1
  6194                                  
  6195                                  ;-709   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  6196                                  
  6197                                  .isreg301:
  6198 000028E6 68[F229]                 push isreg_18
  6199 000028E9 8D06A36D                 lea  ax, [symbol]
  6200 000028ED 50                       push ax
  6201 000028EE E892D9                   call eqstr
  6202 000028F1 83C404                   add  sp, 4
  6203 000028F4 08C0                     or  al, al
  6204 000028F6 0F840C00                 je .isreg302
  6205 000028FA 68[F629]                 push isreg_19
  6206 000028FD E82201                   call doreg
  6207 00002900 83C402                   add  sp, 2
  6208 00002903 E9A600                   jmp .r1
  6209                                  
  6210                                  ;-710   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  6211                                  
  6212                                  .isreg302:
  6213 00002906 68[F929]                 push isreg_20
  6214 00002909 8D06A36D                 lea  ax, [symbol]
  6215 0000290D 50                       push ax
  6216 0000290E E872D9                   call eqstr
  6217 00002911 83C404                   add  sp, 4
  6218 00002914 08C0                     or  al, al
  6219 00002916 0F840C00                 je .isreg303
  6220 0000291A 68[FD29]                 push isreg_21
  6221 0000291D E80201                   call doreg
  6222 00002920 83C402                   add  sp, 2
  6223 00002923 E98600                   jmp .r1
  6224                                  
  6225                                  ;-711   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  6226                                  
  6227                                  .isreg303:
  6228 00002926 68[002A]                 push isreg_22
  6229 00002929 8D06A36D                 lea  ax, [symbol]
  6230 0000292D 50                       push ax
  6231 0000292E E852D9                   call eqstr
  6232 00002931 83C404                   add  sp, 4
  6233 00002934 08C0                     or  al, al
  6234 00002936 0F840C00                 je .isreg304
  6235 0000293A 68[042A]                 push isreg_23
  6236 0000293D E8E200                   call doreg
  6237 00002940 83C402                   add  sp, 2
  6238 00002943 E96600                   jmp .r1
  6239                                  
  6240                                  ;-712   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  6241                                  
  6242                                  .isreg304:
  6243 00002946 68[072A]                 push isreg_24
  6244 00002949 8D06A36D                 lea  ax, [symbol]
  6245 0000294D 50                       push ax
  6246 0000294E E832D9                   call eqstr
  6247 00002951 83C404                   add  sp, 4
  6248 00002954 08C0                     or  al, al
  6249 00002956 0F840C00                 je .isreg305
  6250 0000295A 68[0B2A]                 push isreg_25
  6251 0000295D E8C200                   call doreg
  6252 00002960 83C402                   add  sp, 2
  6253 00002963 E94600                   jmp .r1
  6254                                  
  6255                                  ;-713   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  6256                                  
  6257                                  .isreg305:
  6258 00002966 68[0E2A]                 push isreg_26
  6259 00002969 8D06A36D                 lea  ax, [symbol]
  6260 0000296D 50                       push ax
  6261 0000296E E812D9                   call eqstr
  6262 00002971 83C404                   add  sp, 4
  6263 00002974 08C0                     or  al, al
  6264 00002976 0F840C00                 je .isreg306
  6265 0000297A 68[122A]                 push isreg_27
  6266 0000297D E8A200                   call doreg
  6267 00002980 83C402                   add  sp, 2
  6268 00002983 E92600                   jmp .r1
  6269                                  
  6270                                  ;-714   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  6271                                  
  6272                                  .isreg306:
  6273 00002986 68[152A]                 push isreg_28
  6274 00002989 8D06A36D                 lea  ax, [symbol]
  6275 0000298D 50                       push ax
  6276 0000298E E8F2D8                   call eqstr
  6277 00002991 83C404                   add  sp, 4
  6278 00002994 08C0                     or  al, al
  6279 00002996 0F840C00                 je .isreg307
  6280 0000299A 68[1C2A]                 push isreg_29
  6281 0000299D E88200                   call doreg
  6282 000029A0 83C402                   add  sp, 2
  6283 000029A3 E90600                   jmp .r1
  6284                                  
  6285                                  ;-715   return 0;   r1: return 1;
  6286                                  
  6287                                  .isreg307:
  6288 000029A6 B80000                   mov ax, 0
  6289 000029A9 E90600                   jmp .retnisreg
  6290                                  .r1:
  6291 000029AC B80100                   mov ax, 1
  6292 000029AF E90000                   jmp .retnisreg
  6293                                  
  6294                                  ;-716 }
  6295                                  
  6296                                  
  6297                                  ;-717 int doreg(char *dr) { int i; expect('=');
  6298                                  
  6299                                   .retnisreg:
  6300 000029B2 C3                       ret
  6301 000029B3 5F414800                isreg_0 db "_AH",0
  6302 000029B7 616800                  isreg_1 db "ah",0
  6303 000029BA 5F414C00                isreg_2 db "_AL",0
  6304 000029BE 616C00                  isreg_3 db "al",0
  6305 000029C1 5F415800                isreg_4 db "_AX",0
  6306 000029C5 617800                  isreg_5 db "ax",0
  6307 000029C8 5F424800                isreg_6 db "_BH",0
  6308 000029CC 626800                  isreg_7 db "bh",0
  6309 000029CF 5F424C00                isreg_8 db "_BL",0
  6310 000029D3 626C00                  isreg_9 db "bl",0
  6311 000029D6 5F425800                isreg_10 db "_BX",0
  6312 000029DA 627800                  isreg_11 db "bx",0
  6313 000029DD 5F434800                isreg_12 db "_CH",0
  6314 000029E1 636800                  isreg_13 db "ch",0
  6315 000029E4 5F434C00                isreg_14 db "_CL",0
  6316 000029E8 636C00                  isreg_15 db "cl",0
  6317 000029EB 5F435800                isreg_16 db "_CX",0
  6318 000029EF 637800                  isreg_17 db "cx",0
  6319 000029F2 5F444800                isreg_18 db "_DH",0
  6320 000029F6 646800                  isreg_19 db "dh",0
  6321 000029F9 5F444C00                isreg_20 db "_DL",0
  6322 000029FD 646C00                  isreg_21 db "dl",0
  6323 00002A00 5F445800                isreg_22 db "_DX",0
  6324 00002A04 647800                  isreg_23 db "dx",0
  6325 00002A07 5F534900                isreg_24 db "_SI",0
  6326 00002A0B 736900                  isreg_25 db "si",0
  6327 00002A0E 5F444900                isreg_26 db "_DI",0
  6328 00002A12 646900                  isreg_27 db "di",0
  6329 00002A15 5F464C41475300          isreg_28 db "_FLAGS",0
  6330 00002A1C 666C61677300            isreg_29 db "flags",0
  6331                                  ENDP
  6332                                  
  6333                                  doreg: PROC
  6334                                  ;Function : doreg, Number of local variables: 2
  6335                                  ;   # type sign width addr used name   list of local variables
  6336                                  ;  200 ptr sign byte   717 NULL dr = bp+4
  6337                                  ;  201 var sign word   717 NULL i = bp-2;
  6338 00002A22 C8020000                 ENTER  2,0
  6339 00002A26 6A3D                     push 61
  6340 00002A28 E80CDA                   call expect
  6341 00002A2B 83C402                   add  sp, 2
  6342                                  
  6343                                  ;-718   prs("\n mov  "); prs(dr); prs(", ");
  6344                                  
  6345 00002A2E 68[912A]                 push doreg_0
  6346 00002A31 E816DB                   call prs
  6347 00002A34 83C402                   add  sp, 2
  6348 00002A37 FF7604                   push word [bp+4]
  6349 00002A3A E80DDB                   call prs
  6350 00002A3D 83C402                   add  sp, 2
  6351 00002A40 68[9A2A]                 push doreg_1
  6352 00002A43 E804DB                   call prs
  6353 00002A46 83C402                   add  sp, 2
  6354                                  
  6355                                  ;-719        if (istoken(T_CONST)) prunsign1(lexval);
  6356                                  
  6357 00002A49 680101                   push 257
  6358 00002A4C E8C6D9                   call istoken
  6359 00002A4F 83C402                   add  sp, 2
  6360 00002A52 08C0                     or  al, al
  6361 00002A54 0F840D00                 je .doreg308
  6362 00002A58 FF36[3000]               push word [lexval]
  6363 00002A5C E840DC                   call prunsign1
  6364 00002A5F 83C402                   add  sp, 2
  6365                                  
  6366                                  ;-720   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  6367                                  
  6368 00002A62 E92A00                   jmp .doreg309
  6369                                  .doreg308:
  6370 00002A65 680001                   push 256
  6371 00002A68 E8AAD9                   call istoken
  6372 00002A6B 83C402                   add  sp, 2
  6373 00002A6E 08C0                     or  al, al
  6374 00002A70 0F841200                 je .doreg310
  6375 00002A74 E830E2                   call searchname
  6376 00002A77 8946FE                   mov [bp-2], ax
  6377 00002A7A FF76FE                   push word [bp-2]
  6378 00002A7D E8F8D8                   call v
  6379 00002A80 83C402                   add  sp, 2
  6380                                  
  6381                                  ;-721   else error1("only number or var allowed"); }
  6382                                  
  6383 00002A83 E90900                   jmp .doreg311
  6384                                  .doreg310:
  6385 00002A86 68[9D2A]                 push doreg_2
  6386 00002A89 E83919                   call error1
  6387 00002A8C 83C402                   add  sp, 2
  6388                                  .doreg311:
  6389                                  .doreg309:
  6390                                  
  6391                                  ;-722 
  6392                                  
  6393                                  
  6394                                  ;-723 int doassign(int mode, int i, int ixarr, int ixconst) {
  6395 00002A8F C9                       LEAVE
  6396 00002A90 C3                       ret
  6397 00002A91 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  6398 00002A9A 2C2000                  doreg_1 db ", ",0
  6399 00002A9D 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  6400 00002AA6 6572206F7220766172-
  6401 00002AAF 20616C6C6F77656400 
  6402                                  ENDP
  6403                                  
  6404                                  doassign: PROC
  6405                                  
  6406                                  ;-724   gettypes(i);
  6407                                  
  6408                                  ;Function : doassign, Number of local variables: 4
  6409                                  ;   # type sign width addr used name   list of local variables
  6410                                  ;  200 var sign word   723 NULL mode = bp+4
  6411                                  ;  201 var sign word   723 NULL i = bp+6
  6412                                  ;  202 var sign word   723 NULL ixarr = bp+8
  6413                                  ;  203 var sign word   723 NULL ixconst = bp+10;
  6414 00002AB8 C8000000                 ENTER  0,0
  6415 00002ABC FF7606                   push word [bp+6]
  6416 00002ABF E8A7E0                   call gettypes
  6417 00002AC2 83C402                   add  sp, 2
  6418                                  
  6419                                  ;-725   if (mode==1) {prs("\n mov  bx, ");v(i);
  6420                                  
  6421 00002AC5 8B4604                   mov ax, [bp+4]
  6422 00002AC8 83F801                   cmp ax, 1
  6423 00002ACB 0F853400                 jne .doassign312
  6424 00002ACF 68[552C]                 push doassign_0
  6425 00002AD2 E875DA                   call prs
  6426 00002AD5 83C402                   add  sp, 2
  6427 00002AD8 FF7606                   push word [bp+6]
  6428 00002ADB E89AD8                   call v
  6429 00002ADE 83C402                   add  sp, 2
  6430                                  
  6431                                  ;-726     if (widthi == 2) prs("\n mov  [bx], ax");
  6432                                  
  6433 00002AE1 A1[3800]                 mov ax, [widthi]
  6434 00002AE4 83F802                   cmp ax, 2
  6435 00002AE7 0F850C00                 jne .doassign313
  6436 00002AEB 68[622C]                 push doassign_1
  6437 00002AEE E859DA                   call prs
  6438 00002AF1 83C402                   add  sp, 2
  6439                                  
  6440                                  ;-727     else  prs("\n mov  [bx], al"); return;}
  6441                                  
  6442 00002AF4 E90900                   jmp .doassign314
  6443                                  .doassign313:
  6444 00002AF7 68[732C]                 push doassign_2
  6445 00002AFA E84DDA                   call prs
  6446 00002AFD 83C402                   add  sp, 2
  6447                                  .doassign314:
  6448 00002B00 E95001                   jmp .retndoassign
  6449                                  
  6450                                  ;-728   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  6451                                  
  6452                                  .doassign312:
  6453 00002B03 8B4604                   mov ax, [bp+4]
  6454 00002B06 83F802                   cmp ax, 2
  6455 00002B09 0F851E00                 jne .doassign315
  6456 00002B0D 68[842C]                 push doassign_3
  6457 00002B10 E837DA                   call prs
  6458 00002B13 83C402                   add  sp, 2
  6459 00002B16 FF7606                   push word [bp+6]
  6460 00002B19 E84DD8                   call a
  6461 00002B1C 83C402                   add  sp, 2
  6462 00002B1F 68[8D2C]                 push doassign_4
  6463 00002B22 E825DA                   call prs
  6464 00002B25 83C402                   add  sp, 2
  6465 00002B28 E92801                   jmp .retndoassign
  6466                                  
  6467                                  ;-729   if (ixarr) {  prs("\n mov bx, ");
  6468                                  
  6469                                  .doassign315:
  6470 00002B2B 8B4608                   mov ax, [bp+8]
  6471 00002B2E 08C0                     or  al, al
  6472 00002B30 0F846E00                 je .doassign316
  6473 00002B34 68[922C]                 push doassign_5
  6474 00002B37 E810DA                   call prs
  6475 00002B3A 83C402                   add  sp, 2
  6476                                  
  6477                                  ;-730     if(ixconst) prunsign1(ixarr); else v(ixarr);
  6478                                  
  6479 00002B3D 8B460A                   mov ax, [bp+10]
  6480 00002B40 08C0                     or  al, al
  6481 00002B42 0F840C00                 je .doassign317
  6482 00002B46 FF7608                   push word [bp+8]
  6483 00002B49 E853DB                   call prunsign1
  6484 00002B4C 83C402                   add  sp, 2
  6485 00002B4F E90900                   jmp .doassign318
  6486                                  .doassign317:
  6487 00002B52 FF7608                   push word [bp+8]
  6488 00002B55 E820D8                   call v
  6489 00002B58 83C402                   add  sp, 2
  6490                                  
  6491                                  ;-731     if (wi==2) prs("\n shl bx, 1");
  6492                                  
  6493                                  .doassign318:
  6494 00002B5B A1[3B00]                 mov ax, [wi]
  6495 00002B5E 83F802                   cmp ax, 2
  6496 00002B61 0F850900                 jne .doassign319
  6497 00002B65 68[9E2C]                 push doassign_6
  6498 00002B68 E8DFD9                   call prs
  6499 00002B6B 83C402                   add  sp, 2
  6500                                  
  6501                                  ;-732     prs("\n mov ["); printName(i);
  6502                                  
  6503                                  .doassign319:
  6504 00002B6E 68[AB2C]                 push doassign_7
  6505 00002B71 E8D6D9                   call prs
  6506 00002B74 83C402                   add  sp, 2
  6507 00002B77 FF7606                   push word [bp+6]
  6508 00002B7A E8C6E0                   call printName
  6509 00002B7D 83C402                   add  sp, 2
  6510                                  
  6511                                  ;-733     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  6512                                  
  6513 00002B80 A1[3B00]                 mov ax, [wi]
  6514 00002B83 83F802                   cmp ax, 2
  6515 00002B86 0F850C00                 jne .doassign320
  6516 00002B8A 68[B42C]                 push doassign_8
  6517 00002B8D E8BAD9                   call prs
  6518 00002B90 83C402                   add  sp, 2
  6519 00002B93 E90900                   jmp .doassign321
  6520                                  .doassign320:
  6521 00002B96 68[BD2C]                 push doassign_9
  6522 00002B99 E8AED9                   call prs
  6523 00002B9C 83C402                   add  sp, 2
  6524                                  .doassign321:
  6525 00002B9F E9B100                   jmp .retndoassign
  6526                                  
  6527                                  ;-734   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  6528                                  
  6529                                  .doassign316:
  6530 00002BA2 A1[3B00]                 mov ax, [wi]
  6531 00002BA5 83F801                   cmp ax, 1
  6532 00002BA8 0F853100                 jne .doassign322
  6533 00002BAC 68[C62C]                 push doassign_10
  6534 00002BAF E898D9                   call prs
  6535 00002BB2 83C402                   add  sp, 2
  6536 00002BB5 8B4606                   mov ax, [bp+6]
  6537 00002BB8 3DC800                   cmp ax, 200
  6538 00002BBB 0F8D0900                 jge .doassign323
  6539 00002BBF 68[CE2C]                 push doassign_11
  6540 00002BC2 E885D9                   call prs
  6541 00002BC5 83C402                   add  sp, 2
  6542                                  
  6543                                  ;-735     } v(i); prs(", al"); return; }
  6544                                  
  6545                                  .doassign323:
  6546 00002BC8 FF7606                   push word [bp+6]
  6547 00002BCB E8AAD7                   call v
  6548 00002BCE 83C402                   add  sp, 2
  6549 00002BD1 68[D42C]                 push doassign_12
  6550 00002BD4 E873D9                   call prs
  6551 00002BD7 83C402                   add  sp, 2
  6552 00002BDA E97600                   jmp .retndoassign
  6553                                  
  6554                                  ;-736   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  6555                                  
  6556                                  .doassign322:
  6557 00002BDD A1[3B00]                 mov ax, [wi]
  6558 00002BE0 83F802                   cmp ax, 2
  6559 00002BE3 0F853100                 jne .doassign324
  6560 00002BE7 68[D92C]                 push doassign_13
  6561 00002BEA E85DD9                   call prs
  6562 00002BED 83C402                   add  sp, 2
  6563 00002BF0 8B4606                   mov ax, [bp+6]
  6564 00002BF3 3DC800                   cmp ax, 200
  6565 00002BF6 0F8D0900                 jge .doassign325
  6566 00002BFA 68[E12C]                 push doassign_14
  6567 00002BFD E84AD9                   call prs
  6568 00002C00 83C402                   add  sp, 2
  6569                                  
  6570                                  ;-737     } v(i); prs(", ax"); return; }
  6571                                  
  6572                                  .doassign325:
  6573 00002C03 FF7606                   push word [bp+6]
  6574 00002C06 E86FD7                   call v
  6575 00002C09 83C402                   add  sp, 2
  6576 00002C0C 68[E72C]                 push doassign_15
  6577 00002C0F E838D9                   call prs
  6578 00002C12 83C402                   add  sp, 2
  6579 00002C15 E93B00                   jmp .retndoassign
  6580                                  
  6581                                  ;-738   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  6582                                  
  6583                                  .doassign324:
  6584 00002C18 A1[3B00]                 mov ax, [wi]
  6585 00002C1B 83F804                   cmp ax, 4
  6586 00002C1E 0F853100                 jne .doassign326
  6587 00002C22 68[EC2C]                 push doassign_16
  6588 00002C25 E822D9                   call prs
  6589 00002C28 83C402                   add  sp, 2
  6590 00002C2B 8B4606                   mov ax, [bp+6]
  6591 00002C2E 3DC800                   cmp ax, 200
  6592 00002C31 0F8D0900                 jge .doassign327
  6593 00002C35 68[F42C]                 push doassign_17
  6594 00002C38 E80FD9                   call prs
  6595 00002C3B 83C402                   add  sp, 2
  6596                                  
  6597                                  ;-739     } v(i); prs(", eax"); return; }
  6598                                  
  6599                                  .doassign327:
  6600 00002C3E FF7606                   push word [bp+6]
  6601 00002C41 E834D7                   call v
  6602 00002C44 83C402                   add  sp, 2
  6603 00002C47 68[FB2C]                 push doassign_18
  6604 00002C4A E8FDD8                   call prs
  6605 00002C4D 83C402                   add  sp, 2
  6606 00002C50 E90000                   jmp .retndoassign
  6607                                  
  6608                                  ;-740 }
  6609                                  
  6610                                  .doassign326:
  6611                                  
  6612                                  ;-741 int domul(int ids) {
  6613                                  
  6614 00002C53 C9                       .retndoassign: LEAVE
  6615 00002C54 C3                       ret
  6616 00002C55 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  6617 00002C5E 782C2000           
  6618 00002C62 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  6619 00002C6B 62785D2C20617800   
  6620 00002C73 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  6621 00002C7C 62785D2C20616C00   
  6622 00002C84 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  6623 00002C8D 2C20617800              doassign_4 db ", ax",0
  6624 00002C92 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  6625 00002C9B 2C2000             
  6626 00002C9E 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  6627 00002CA7 2C203100           
  6628 00002CAB 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  6629 00002CB4 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  6630 00002CBD 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  6631 00002CC6 5C6E206D6F762000        doassign_10 db "\n mov ",0
  6632 00002CCE 627974652000            doassign_11 db "byte ",0
  6633 00002CD4 2C20616C00              doassign_12 db ", al",0
  6634 00002CD9 5C6E206D6F762000        doassign_13 db "\n mov ",0
  6635 00002CE1 776F72642000            doassign_14 db "word ",0
  6636 00002CE7 2C20617800              doassign_15 db ", ax",0
  6637 00002CEC 5C6E206D6F762000        doassign_16 db "\n mov ",0
  6638 00002CF4 64776F72642000          doassign_17 db "dword ",0
  6639 00002CFB 2C2065617800            doassign_18 db ", eax",0
  6640                                  ENDP
  6641                                  
  6642                                  domul: PROC
  6643                                  
  6644                                  ;-742   if (ids) rterm("imul"); else {
  6645                                  
  6646                                  ;Function : domul, Number of local variables: 1
  6647                                  ;   # type sign width addr used name   list of local variables
  6648                                  ;  200 var sign word   741 NULL ids = bp+4;
  6649 00002D01 C8000000                 ENTER  0,0
  6650 00002D05 8B4604                   mov ax, [bp+4]
  6651 00002D08 08C0                     or  al, al
  6652 00002D0A 0F840C00                 je .domul328
  6653 00002D0E 68[532D]                 push domul_0
  6654 00002D11 E899F9                   call rterm
  6655 00002D14 83C402                   add  sp, 2
  6656 00002D17 E93700                   jmp .domul329
  6657                                  .domul328:
  6658                                  
  6659                                  ;-743   if (istoken(T_CONST)) {
  6660                                  
  6661 00002D1A 680101                   push 257
  6662 00002D1D E8F5D6                   call istoken
  6663 00002D20 83C402                   add  sp, 2
  6664 00002D23 08C0                     or  al, al
  6665 00002D25 0F841F00                 je .domul330
  6666                                  
  6667                                  ;-744     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6668                                  
  6669 00002D29 68[582D]                 push domul_1
  6670 00002D2C E81BD8                   call prs
  6671 00002D2F 83C402                   add  sp, 2
  6672 00002D32 FF36[3000]               push word [lexval]
  6673 00002D36 E866D9                   call prunsign1
  6674 00002D39 83C402                   add  sp, 2
  6675 00002D3C 68[642D]                 push domul_2
  6676 00002D3F E808D8                   call prs
  6677 00002D42 83C402                   add  sp, 2
  6678                                  
  6679                                  ;-745     }
  6680                                  
  6681                                  
  6682                                  ;-746   else error1("with MUL only const number as multiplicator allowed"); } }
  6683                                  
  6684 00002D45 E90900                   jmp .domul331
  6685                                  .domul330:
  6686 00002D48 68[6E2D]                 push domul_3
  6687 00002D4B E87716                   call error1
  6688 00002D4E 83C402                   add  sp, 2
  6689                                  .domul331:
  6690                                  .domul329:
  6691                                  
  6692                                  ;-747 int doidiv(int ids) { int mode; int id1;
  6693 00002D51 C9                       LEAVE
  6694 00002D52 C3                       ret
  6695 00002D53 696D756C00              domul_0 db "imul",0
  6696 00002D58 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6697 00002D61 2C2000             
  6698 00002D64 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6699 00002D6D 00                 
  6700 00002D6E 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6701 00002D77 6F6E6C7920636F6E73-
  6702 00002D80 74206E756D62657220-
  6703 00002D89 6173206D756C746970-
  6704 00002D92 6C696361746F722061-
  6705 00002D9B 6C6C6F77656400     
  6706                                  ENDP
  6707                                  
  6708                                  doidiv: PROC
  6709                                  
  6710                                  ;-748   if (istoken(T_CONST)) {
  6711                                  
  6712                                  ;Function : doidiv, Number of local variables: 3
  6713                                  ;   # type sign width addr used name   list of local variables
  6714                                  ;  200 var sign word   747 NULL ids = bp+4
  6715                                  ;  201 var sign word   747 NULL mode = bp-2
  6716                                  ;  202 var sign word   747 NULL id1 = bp-4;
  6717 00002DA2 C8040000                 ENTER  4,0
  6718 00002DA6 680101                   push 257
  6719 00002DA9 E869D6                   call istoken
  6720 00002DAC 83C402                   add  sp, 2
  6721 00002DAF 08C0                     or  al, al
  6722 00002DB1 0F843400                 je .doidiv332
  6723                                  
  6724                                  ;-749     prs("\n mov bx, "); prunsign1(lexval);
  6725                                  
  6726 00002DB5 68[672E]                 push doidiv_0
  6727 00002DB8 E88FD7                   call prs
  6728 00002DBB 83C402                   add  sp, 2
  6729 00002DBE FF36[3000]               push word [lexval]
  6730 00002DC2 E8DAD8                   call prunsign1
  6731 00002DC5 83C402                   add  sp, 2
  6732                                  
  6733                                  ;-750     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6734                                  
  6735 00002DC8 8B4604                   mov ax, [bp+4]
  6736 00002DCB 08C0                     or  al, al
  6737 00002DCD 0F840C00                 je .doidiv333
  6738 00002DD1 68[732E]                 push doidiv_1
  6739 00002DD4 E873D7                   call prs
  6740 00002DD7 83C402                   add  sp, 2
  6741 00002DDA E90900                   jmp .doidiv334
  6742                                  .doidiv333:
  6743 00002DDD 68[842E]                 push doidiv_2
  6744 00002DE0 E867D7                   call prs
  6745 00002DE3 83C402                   add  sp, 2
  6746                                  .doidiv334:
  6747                                  
  6748                                  ;-751   else {
  6749                                  
  6750 00002DE6 E97C00                   jmp .doidiv335
  6751                                  .doidiv332:
  6752                                  
  6753                                  ;-752     mode=typeName(); id1=searchname();
  6754                                  
  6755 00002DE9 E88ADF                   call typeName
  6756 00002DEC 8946FE                   mov [bp-2], ax
  6757 00002DEF E8B5DE                   call searchname
  6758 00002DF2 8946FC                   mov [bp-4], ax
  6759                                  
  6760                                  ;-753     if (mode) error1("only const number or int as divisor allowed");
  6761                                  
  6762 00002DF5 8B46FE                   mov ax, [bp-2]
  6763 00002DF8 08C0                     or  al, al
  6764 00002DFA 0F840900                 je .doidiv336
  6765 00002DFE 68[9A2E]                 push doidiv_3
  6766 00002E01 E8C115                   call error1
  6767 00002E04 83C402                   add  sp, 2
  6768                                  
  6769                                  ;-754     gettypes(id1);
  6770                                  
  6771                                  .doidiv336:
  6772 00002E07 FF76FC                   push word [bp-4]
  6773 00002E0A E85CDD                   call gettypes
  6774 00002E0D 83C402                   add  sp, 2
  6775                                  
  6776                                  ;-755     if (typei) error1("only int as simple var divisor allowed");
  6777                                  
  6778 00002E10 A1[3200]                 mov ax, [typei]
  6779 00002E13 08C0                     or  al, al
  6780 00002E15 0F840900                 je .doidiv337
  6781 00002E19 68[C62E]                 push doidiv_4
  6782 00002E1C E8A615                   call error1
  6783 00002E1F 83C402                   add  sp, 2
  6784                                  
  6785                                  ;-756     if (wi!=2) error1("only int, no byte as divisor allowed");
  6786                                  
  6787                                  .doidiv337:
  6788 00002E22 A1[3B00]                 mov ax, [wi]
  6789 00002E25 83F802                   cmp ax, 2
  6790 00002E28 0F840900                 je  .doidiv338
  6791 00002E2C 68[ED2E]                 push doidiv_5
  6792 00002E2F E89315                   call error1
  6793 00002E32 83C402                   add  sp, 2
  6794                                  
  6795                                  ;-757     prs("\n mov bx, "); v(id1);
  6796                                  
  6797                                  .doidiv338:
  6798 00002E35 68[122F]                 push doidiv_6
  6799 00002E38 E80FD7                   call prs
  6800 00002E3B 83C402                   add  sp, 2
  6801 00002E3E FF76FC                   push word [bp-4]
  6802 00002E41 E834D5                   call v
  6803 00002E44 83C402                   add  sp, 2
  6804                                  
  6805                                  ;-758     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6806                                  
  6807 00002E47 8B4604                   mov ax, [bp+4]
  6808 00002E4A 08C0                     or  al, al
  6809 00002E4C 0F840C00                 je .doidiv339
  6810 00002E50 68[1E2F]                 push doidiv_7
  6811 00002E53 E8F4D6                   call prs
  6812 00002E56 83C402                   add  sp, 2
  6813 00002E59 E90900                   jmp .doidiv340
  6814                                  .doidiv339:
  6815 00002E5C 68[2F2F]                 push doidiv_8
  6816 00002E5F E8E8D6                   call prs
  6817 00002E62 83C402                   add  sp, 2
  6818                                  .doidiv340:
  6819                                  
  6820                                  ;-759 }
  6821                                  
  6822                                  .doidiv335:
  6823                                  
  6824                                  ;-760 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6825 00002E65 C9                       LEAVE
  6826 00002E66 C3                       ret
  6827 00002E67 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6828 00002E70 2C2000             
  6829 00002E73 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6830 00002E7C 6964697620627800   
  6831 00002E84 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6832 00002E8D 2C20305C6E20646976-
  6833 00002E96 20627800           
  6834 00002E9A 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6835 00002EA3 74206E756D62657220-
  6836 00002EAC 6F7220696E74206173-
  6837 00002EB5 2064697669736F7220-
  6838 00002EBE 616C6C6F77656400   
  6839 00002EC6 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6840 00002ECF 61732073696D706C65-
  6841 00002ED8 207661722064697669-
  6842 00002EE1 736F7220616C6C6F77-
  6843 00002EEA 656400             
  6844 00002EED 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6845 00002EF6 206E6F206279746520-
  6846 00002EFF 61732064697669736F-
  6847 00002F08 7220616C6C6F776564-
  6848 00002F11 00                 
  6849 00002F12 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6850 00002F1B 2C2000             
  6851 00002F1E 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6852 00002F27 6964697620627800   
  6853 00002F2F 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6854 00002F38 2C20305C6E20646976-
  6855 00002F41 20627800           
  6856                                  ENDP
  6857                                  
  6858                                  domod: PROC
  6859                                  ;Function : domod, Number of local variables: 1
  6860                                  ;   # type sign width addr used name   list of local variables
  6861                                  ;  200 var sign word   760 NULL ids = bp+4;
  6862 00002F45 C8000000                 ENTER  0,0
  6863 00002F49 FF7604                   push word [bp+4]
  6864 00002F4C E853FE                   call doidiv
  6865 00002F4F 83C402                   add  sp, 2
  6866 00002F52 68[5D2F]                 push domod_0
  6867 00002F55 E8F2D5                   call prs
  6868 00002F58 83C402                   add  sp, 2
  6869                                  
  6870                                  ;-761 
  6871                                  
  6872                                  
  6873                                  ;-762 int docalltype[10]; int docallvalue[10];
  6874 00002F5B C9                       LEAVE
  6875 00002F5C C3                       ret
  6876 00002F5D 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6877 00002F66 2C20647800         
  6878                                  ENDP
  6879                                  section .bss
  6880                                  absolute 48411
  6881 0000BD1B <res 00000014>          docalltype resw 10
  6882                                  section .text
  6883                                  section .bss
  6884                                  absolute 48431
  6885 0000BD2F <res 00000014>          docallvalue resw 10
  6886                                  section .text
  6887                                  
  6888                                  ;-763 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6889                                  
  6890                                  section .bss
  6891                                  absolute 48451
  6892 0000BD43 <res 00000011>          procname resb 17
  6893                                  section .text
  6894                                  
  6895                                  ;-764 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6896                                  
  6897                                  
  6898                                  docall1: PROC
  6899                                  
  6900                                  ;-765   narg=0;  sz32=0;
  6901                                  
  6902                                  ;Function : docall1, Number of local variables: 5
  6903                                  ;   # type sign width addr used name   list of local variables
  6904                                  ;  200 var sign word   764 NULL i = bp-2
  6905                                  ;  201 var sign word   764 NULL narg = bp-4
  6906                                  ;  202 var sign word   764 NULL t0 = bp-6
  6907                                  ;  203 var sign word   764 NULL n0 = bp-8
  6908                                  ;  204 var sign word   764 NULL sz32 = bp-10;
  6909 00002F6B C80A0000                 ENTER  10,0
  6910 00002F6F B80000                   mov ax, 0
  6911 00002F72 8946FC                   mov [bp-4], ax
  6912 00002F75 B80000                   mov ax, 0
  6913 00002F78 8946F6                   mov [bp-10], ax
  6914                                  
  6915                                  ;-766   checknamelen();
  6916                                  
  6917 00002F7B E82DD4                   call checknamelen
  6918                                  
  6919                                  ;-767   strcpy(&procname, symbol);
  6920                                  
  6921 00002F7E 8D06A36D                 lea  ax, [symbol]
  6922 00002F82 50                       push ax
  6923 00002F83 8D0643BD                 lea  ax, [procname]
  6924 00002F87 50                       push ax
  6925 00002F88 E8C2D2                   call strcpy
  6926 00002F8B 83C404                   add  sp, 4
  6927                                  
  6928                                  ;-768   storecall();
  6929                                  
  6930 00002F8E E8E6DE                   call storecall
  6931                                  
  6932                                  ;-769   expect('(');
  6933                                  
  6934 00002F91 6A28                     push 40
  6935 00002F93 E8A1D4                   call expect
  6936 00002F96 83C402                   add  sp, 2
  6937                                  
  6938                                  ;-770 	if (istoken(')') ==0 ) {
  6939                                  
  6940 00002F99 6A29                     push 41
  6941 00002F9B E877D4                   call istoken
  6942 00002F9E 83C402                   add  sp, 2
  6943 00002FA1 83F800                   cmp ax, 0
  6944 00002FA4 0F857802                 jne .docall1341
  6945                                  
  6946                                  ;-771 	  do { narg++;
  6947                                  
  6948                                  .docall1342:
  6949 00002FA8 FF46FC                   inc  word[bp-4]
  6950                                  
  6951                                  ;-772 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6952                                  
  6953 00002FAB 8B46FC                   mov ax, [bp-4]
  6954 00002FAE 83F809                   cmp ax, 9
  6955 00002FB1 0F8E0900                 jle .docall1343
  6956 00002FB5 68[6432]                 push docall1_0
  6957 00002FB8 E80A14                   call error1
  6958 00002FBB 83C402                   add  sp, 2
  6959                                  .docall1343:
  6960 00002FBE B80000                   mov ax, 0
  6961 00002FC1 8946FA                   mov [bp-6], ax
  6962                                  
  6963                                  ;-773       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6964                                  
  6965 00002FC4 680101                   push 257
  6966 00002FC7 E84BD4                   call istoken
  6967 00002FCA 83C402                   add  sp, 2
  6968 00002FCD 08C0                     or  al, al
  6969 00002FCF 0F840C00                 je .docall1344
  6970 00002FD3 B80100                   mov ax, 1
  6971 00002FD6 8946FA                   mov [bp-6], ax
  6972 00002FD9 A1[3000]                 mov ax, [lexval]
  6973 00002FDC 8946F8                   mov [bp-8], ax
  6974                                  
  6975                                  ;-774       if(istoken(T_STRING)){t0=2; n0=nconst;
  6976                                  
  6977                                  .docall1344:
  6978 00002FDF 680201                   push 258
  6979 00002FE2 E830D4                   call istoken
  6980 00002FE5 83C402                   add  sp, 2
  6981 00002FE8 08C0                     or  al, al
  6982 00002FEA 0F846300                 je .docall1345
  6983 00002FEE B80200                   mov ax, 2
  6984 00002FF1 8946FA                   mov [bp-6], ax
  6985 00002FF4 A1[2600]                 mov ax, [nconst]
  6986 00002FF7 8946F8                   mov [bp-8], ax
  6987                                  
  6988                                  ;-775         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6989                                  
  6990 00002FFA 68[7632]                 push docall1_1
  6991 00002FFD E8B5D4                   call eprs
  6992 00003000 83C402                   add  sp, 2
  6993 00003003 8D06236E                 lea  ax, [fname]
  6994 00003007 50                       push ax
  6995 00003008 E8AAD4                   call eprs
  6996 0000300B 83C402                   add  sp, 2
  6997 0000300E 6A5F                     push 95
  6998 00003010 E88FD4                   call eprc
  6999 00003013 83C402                   add  sp, 2
  7000 00003016 FF36[2600]               push word [nconst]
  7001 0000301A E8C1D5                   call eprnum
  7002 0000301D 83C402                   add  sp, 2
  7003 00003020 68[7932]                 push docall1_2
  7004 00003023 E88FD4                   call eprs
  7005 00003026 83C402                   add  sp, 2
  7006                                  
  7007                                  ;-776         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  7008                                  
  7009 00003029 6A22                     push 34
  7010 0000302B E874D4                   call eprc
  7011 0000302E 83C402                   add  sp, 2
  7012 00003031 8D06A36D                 lea  ax, [symbol]
  7013 00003035 50                       push ax
  7014 00003036 E87CD4                   call eprs
  7015 00003039 83C402                   add  sp, 2
  7016 0000303C 6A22                     push 34
  7017 0000303E E861D4                   call eprc
  7018 00003041 83C402                   add  sp, 2
  7019 00003044 68[7E32]                 push docall1_3
  7020 00003047 E86BD4                   call eprs
  7021 0000304A 83C402                   add  sp, 2
  7022 0000304D FF06[2600]               inc  word[nconst]
  7023                                  
  7024                                  ;-777       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  7025                                  
  7026                                  .docall1345:
  7027 00003051 6A26                     push 38
  7028 00003053 E8BFD3                   call istoken
  7029 00003056 83C402                   add  sp, 2
  7030 00003059 08C0                     or  al, al
  7031 0000305B 0F840F00                 je .docall1346
  7032 0000305F B80300                   mov ax, 3
  7033 00003062 8946FA                   mov [bp-6], ax
  7034 00003065 E8E7DD                   call name1
  7035 00003068 E83CDC                   call searchname
  7036 0000306B 8946F8                   mov [bp-8], ax
  7037                                  
  7038                                  ;-778       if(istoken(T_NAME))  { n0=checkreg();
  7039                                  
  7040                                  .docall1346:
  7041 0000306E 680001                   push 256
  7042 00003071 E8A1D3                   call istoken
  7043 00003074 83C402                   add  sp, 2
  7044 00003077 08C0                     or  al, al
  7045 00003079 0F844800                 je .docall1347
  7046 0000307D E8DFEA                   call checkreg
  7047 00003080 8946F8                   mov [bp-8], ax
  7048                                  
  7049                                  ;-779         if (n0) t0=5;
  7050                                  
  7051 00003083 8B46F8                   mov ax, [bp-8]
  7052 00003086 08C0                     or  al, al
  7053 00003088 0F840900                 je .docall1348
  7054 0000308C B80500                   mov ax, 5
  7055 0000308F 8946FA                   mov [bp-6], ax
  7056                                  
  7057                                  ;-780         else {t0=4; n0=searchname();
  7058                                  
  7059 00003092 E93000                   jmp .docall1349
  7060                                  .docall1348:
  7061 00003095 B80400                   mov ax, 4
  7062 00003098 8946FA                   mov [bp-6], ax
  7063 0000309B E809DC                   call searchname
  7064 0000309E 8946F8                   mov [bp-8], ax
  7065                                  
  7066                                  ;-781           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  7067                                  
  7068 000030A1 B82F6F                   mov ax, GType
  7069 000030A4 A3[6E00]                 mov word [p1], ax
  7070 000030A7 A1[6E00]                 mov ax, [p1]
  7071 000030AA 0346F8                   add ax, [bp-8]
  7072 000030AD A3[6E00]                 mov word [p1], ax
  7073 000030B0 8B1E[6E00]               mov bx, [p1]
  7074 000030B4 8A07                     mov al, [bx]
  7075 000030B6 B400                     mov ah, 0
  7076 000030B8 83F826                   cmp ax, 38
  7077 000030BB 0F850600                 jne .docall1350
  7078 000030BF B80300                   mov ax, 3
  7079 000030C2 8946FA                   mov [bp-6], ax
  7080                                  .docall1350:
  7081                                  .docall1349:
  7082                                  
  7083                                  ;-782       if (t0==0) error1("parameter not recognized (no * allowed)");
  7084                                  
  7085                                  .docall1347:
  7086 000030C5 8B46FA                   mov ax, [bp-6]
  7087 000030C8 83F800                   cmp ax, 0
  7088 000030CB 0F850900                 jne .docall1351
  7089 000030CF 68[8132]                 push docall1_4
  7090 000030D2 E8F012                   call error1
  7091 000030D5 83C402                   add  sp, 2
  7092                                  
  7093                                  ;-783       docalltype [narg] = t0;
  7094                                  
  7095                                  .docall1351:
  7096 000030D8 8B46FA                   mov ax, [bp-6]
  7097 000030DB 8B5EFC                   mov bx, [bp-4]
  7098 000030DE D1E3                     shl bx, 1
  7099 000030E0 89871BBD                 mov [docalltype+bx], ax
  7100                                  
  7101                                  ;-784       docallvalue[narg] = n0;
  7102                                  
  7103 000030E4 8B46F8                   mov ax, [bp-8]
  7104 000030E7 8B5EFC                   mov bx, [bp-4]
  7105 000030EA D1E3                     shl bx, 1
  7106 000030EC 89872FBD                 mov [docallvalue+bx], ax
  7107                                  
  7108                                  ;-785     } while (istoken(','));
  7109                                  
  7110 000030F0 6A2C                     push 44
  7111 000030F2 E820D3                   call istoken
  7112 000030F5 83C402                   add  sp, 2
  7113 000030F8 08C0                     or  al, al
  7114 000030FA 0F840300                 je .docall1352
  7115 000030FE E9A7FE                   jmp .docall1342
  7116                                  .docall1352:
  7117                                  
  7118                                  ;-786 
  7119                                  
  7120                                  
  7121                                  ;-787   	expect(')');  i=narg;
  7122                                  
  7123 00003101 6A29                     push 41
  7124 00003103 E831D3                   call expect
  7125 00003106 83C402                   add  sp, 2
  7126 00003109 8B46FC                   mov ax, [bp-4]
  7127 0000310C 8946FE                   mov [bp-2], ax
  7128                                  
  7129                                  ;-788     do {
  7130                                  
  7131                                  .docall1353:
  7132                                  
  7133                                  ;-789       t0 = docalltype [i];
  7134                                  
  7135 0000310F 8B5EFE                   mov bx, [bp-2]
  7136 00003112 D1E3                     shl bx, 1
  7137 00003114 8B871BBD                 mov ax, [docalltype + bx]
  7138 00003118 8946FA                   mov [bp-6], ax
  7139                                  
  7140                                  ;-790       n0 = docallvalue[i];
  7141                                  
  7142 0000311B 8B5EFE                   mov bx, [bp-2]
  7143 0000311E D1E3                     shl bx, 1
  7144 00003120 8B872FBD                 mov ax, [docallvalue + bx]
  7145 00003124 8946F8                   mov [bp-8], ax
  7146                                  
  7147                                  ;-791       if(t0==1){ prs("\n push "); prunsign1(n0);}
  7148                                  
  7149 00003127 8B46FA                   mov ax, [bp-6]
  7150 0000312A 83F801                   cmp ax, 1
  7151 0000312D 0F851200                 jne .docall1354
  7152 00003131 68[A932]                 push docall1_5
  7153 00003134 E813D4                   call prs
  7154 00003137 83C402                   add  sp, 2
  7155 0000313A FF76F8                   push word [bp-8]
  7156 0000313D E85FD5                   call prunsign1
  7157 00003140 83C402                   add  sp, 2
  7158                                  
  7159                                  ;-792       if(t0==2){ prs("\n push ");
  7160                                  
  7161                                  .docall1354:
  7162 00003143 8B46FA                   mov ax, [bp-6]
  7163 00003146 83F802                   cmp ax, 2
  7164 00003149 0F852500                 jne .docall1355
  7165 0000314D 68[B232]                 push docall1_6
  7166 00003150 E8F7D3                   call prs
  7167 00003153 83C402                   add  sp, 2
  7168                                  
  7169                                  ;-793         prs(fname);prc(95);prunsign1(n0);}
  7170                                  
  7171 00003156 8D06236E                 lea  ax, [fname]
  7172 0000315A 50                       push ax
  7173 0000315B E8ECD3                   call prs
  7174 0000315E 83C402                   add  sp, 2
  7175 00003161 6A5F                     push 95
  7176 00003163 E87DD3                   call prc
  7177 00003166 83C402                   add  sp, 2
  7178 00003169 FF76F8                   push word [bp-8]
  7179 0000316C E830D5                   call prunsign1
  7180 0000316F 83C402                   add  sp, 2
  7181                                  
  7182                                  ;-794       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  7183                                  
  7184                                  .docall1355:
  7185 00003172 8B46FA                   mov ax, [bp-6]
  7186 00003175 83F803                   cmp ax, 3
  7187 00003178 0F851B00                 jne .docall1356
  7188 0000317C 68[BB32]                 push docall1_7
  7189 0000317F E8C8D3                   call prs
  7190 00003182 83C402                   add  sp, 2
  7191 00003185 FF76F8                   push word [bp-8]
  7192 00003188 E8EDD1                   call v
  7193 0000318B 83C402                   add  sp, 2
  7194                                  
  7195                                  ;-795         prs("\n push ax");}
  7196                                  
  7197 0000318E 68[C832]                 push docall1_8
  7198 00003191 E8B6D3                   call prs
  7199 00003194 83C402                   add  sp, 2
  7200                                  
  7201                                  ;-796       if(t0==4){ gettypes(n0);
  7202                                  
  7203                                  .docall1356:
  7204 00003197 8B46FA                   mov ax, [bp-6]
  7205 0000319A 83F804                   cmp ax, 4
  7206 0000319D 0F854300                 jne .docall1357
  7207 000031A1 FF76F8                   push word [bp-8]
  7208 000031A4 E8C2D9                   call gettypes
  7209 000031A7 83C402                   add  sp, 2
  7210                                  
  7211                                  ;-797         if(wi==2) { prs("\n push word "); v(n0);}
  7212                                  
  7213 000031AA A1[3B00]                 mov ax, [wi]
  7214 000031AD 83F802                   cmp ax, 2
  7215 000031B0 0F851500                 jne .docall1358
  7216 000031B4 68[D332]                 push docall1_9
  7217 000031B7 E890D3                   call prs
  7218 000031BA 83C402                   add  sp, 2
  7219 000031BD FF76F8                   push word [bp-8]
  7220 000031C0 E8B5D1                   call v
  7221 000031C3 83C402                   add  sp, 2
  7222                                  
  7223                                  ;-798         else { prs("\n mov al, byte ");   v(n0);
  7224                                  
  7225 000031C6 E91B00                   jmp .docall1359
  7226                                  .docall1358:
  7227 000031C9 68[E132]                 push docall1_10
  7228 000031CC E87BD3                   call prs
  7229 000031CF 83C402                   add  sp, 2
  7230 000031D2 FF76F8                   push word [bp-8]
  7231 000031D5 E8A0D1                   call v
  7232 000031D8 83C402                   add  sp, 2
  7233                                  
  7234                                  ;-799         prs("\n mov ah, 0\n push ax"); } }
  7235                                  
  7236 000031DB 68[F232]                 push docall1_11
  7237 000031DE E869D3                   call prs
  7238 000031E1 83C402                   add  sp, 2
  7239                                  .docall1359:
  7240                                  
  7241                                  ;-800       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  7242                                  
  7243                                  .docall1357:
  7244 000031E4 8B46FA                   mov ax, [bp-6]
  7245 000031E7 83F805                   cmp ax, 5
  7246 000031EA 0F852200                 jne .docall1360
  7247 000031EE 68[0933]                 push docall1_12
  7248 000031F1 E856D3                   call prs
  7249 000031F4 83C402                   add  sp, 2
  7250 000031F7 FF76F8                   push word [bp-8]
  7251 000031FA E870ED                   call printreg
  7252 000031FD 83C402                   add  sp, 2
  7253 00003200 8B46F8                   mov ax, [bp-8]
  7254 00003203 83F82F                   cmp ax, 47 ;unsigned : 1
  7255 00003206 0F8C0600                 jl  .docall1361
  7256 0000320A 8B46F6                   mov ax, [bp-10]
  7257 0000320D 83C002                   add ax, 2
  7258                                  .docall1361:
  7259                                  
  7260                                  ;-801    i--; } while (i > 0);  }
  7261                                  
  7262                                  .docall1360:
  7263 00003210 FF4EFE                   dec  word[bp-2]
  7264 00003213 8B46FE                   mov ax, [bp-2]
  7265 00003216 83F800                   cmp ax, 0
  7266 00003219 0F8E0300                 jle .docall1362
  7267 0000321D E9EFFE                   jmp .docall1353
  7268                                  .docall1362:
  7269                                  
  7270                                  ;-802 	 prs("\n call "); prs(&procname);
  7271                                  
  7272                                  .docall1341:
  7273 00003220 68[1233]                 push docall1_13
  7274 00003223 E824D3                   call prs
  7275 00003226 83C402                   add  sp, 2
  7276 00003229 8D0643BD                 lea  ax, [procname]
  7277 0000322D 50                       push ax
  7278 0000322E E819D3                   call prs
  7279 00003231 83C402                   add  sp, 2
  7280                                  
  7281                                  ;-803 	 if (narg>0) {prs("\n add  sp, ");
  7282                                  
  7283 00003234 8B46FC                   mov ax, [bp-4]
  7284 00003237 83F800                   cmp ax, 0
  7285 0000323A 0F8E2400                 jle .docall1363
  7286 0000323E 68[1B33]                 push docall1_14
  7287 00003241 E806D3                   call prs
  7288 00003244 83C402                   add  sp, 2
  7289                                  
  7290                                  ;-804      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  7291                                  
  7292 00003247 8B46FC                   mov ax, [bp-4]
  7293 0000324A 0346FC                   add ax, [bp-4]
  7294 0000324D 8946FC                   mov [bp-4], ax
  7295 00003250 8B46FC                   mov ax, [bp-4]
  7296 00003253 0346F6                   add ax, [bp-10]
  7297 00003256 8946FC                   mov [bp-4], ax
  7298 00003259 FF76FC                   push word [bp-4]
  7299 0000325C E840D4                   call prunsign1
  7300 0000325F 83C402                   add  sp, 2
  7301                                  .docall1363:
  7302                                  
  7303                                  ;-805 /***************************************************************/
  7304                                  
  7305                                  
  7306                                  ;-806 
  7307                                  
  7308                                  
  7309                                  ;-807 int doinclude() { int fdtemp;
  7310 00003262 C9                       LEAVE
  7311 00003263 C3                       ret
  7312 00003264 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  7313 0000326D 72616D657465727300 
  7314 00003276 5C6E00                  docall1_1 db "\n",0
  7315 00003279 2064622000              docall1_2 db " db ",0
  7316 0000327E 2C3000                  docall1_3 db ",0",0
  7317 00003281 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  7318 0000328A 206E6F74207265636F-
  7319 00003293 676E697A656420286E-
  7320 0000329C 6F202A20616C6C6F77-
  7321 000032A5 65642900           
  7322 000032A9 5C6E20707573682000      docall1_5 db "\n push ",0
  7323 000032B2 5C6E20707573682000      docall1_6 db "\n push ",0
  7324 000032BB 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  7325 000032C4 782C2000           
  7326 000032C8 5C6E20707573682061-     docall1_8 db "\n push ax",0
  7327 000032D1 7800               
  7328 000032D3 5C6E20707573682077-     docall1_9 db "\n push word ",0
  7329 000032DC 6F72642000         
  7330 000032E1 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  7331 000032EA 2C20627974652000   
  7332 000032F2 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  7333 000032FB 2C20305C6E20707573-
  7334 00003304 6820617800         
  7335 00003309 5C6E20707573682000      docall1_12 db "\n push ",0
  7336 00003312 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  7337 0000331B 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  7338 00003324 702C2000           
  7339                                  ENDP
  7340                                  
  7341                                  doinclude: PROC
  7342                                  
  7343                                  ;-808   if (token==T_STRING) {  fdtemp=fdin;
  7344                                  
  7345                                  ;Function : doinclude, Number of local variables: 1
  7346                                  ;   # type sign width addr used name   list of local variables
  7347                                  ;  200 var sign word   807 NULL fdtemp = bp-2;
  7348 00003328 C8020000                 ENTER  2,0
  7349 0000332C A1[1E00]                 mov ax, [token]
  7350 0000332F 3D0201                   cmp ax, 258
  7351 00003332 0F858700                 jne .doinclude364
  7352 00003336 A1[1A00]                 mov ax, [fdin]
  7353 00003339 8946FE                   mov [bp-2], ax
  7354                                  
  7355                                  ;-809   prs("\n;Use include file: "); prs(symbol);
  7356                                  
  7357 0000333C 68[BF33]                 push doinclude_0
  7358 0000333F E808D2                   call prs
  7359 00003342 83C402                   add  sp, 2
  7360 00003345 8D06A36D                 lea  ax, [symbol]
  7361 00003349 50                       push ax
  7362 0000334A E8FDD1                   call prs
  7363 0000334D 83C402                   add  sp, 2
  7364                                  
  7365                                  ;-810   fdin=openR(symbol);
  7366                                  
  7367 00003350 8D06A36D                 lea  ax, [symbol]
  7368 00003354 50                       push ax
  7369 00003355 E881CD                   call openR
  7370 00003358 83C402                   add  sp, 2
  7371 0000335B A3[1A00]                 mov word [fdin], ax
  7372                                  
  7373                                  ;-811   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7374                                  
  7375 0000335E A1[7000]                 mov ax, [DOS_ERR]
  7376 00003361 83F800                   cmp ax, 0
  7377 00003364 0F841D00                 je  .doinclude365
  7378 00003368 68[D533]                 push doinclude_1
  7379 0000336B E8DCD1                   call prs
  7380 0000336E 83C402                   add  sp, 2
  7381 00003371 8D06A36D                 lea  ax, [symbol]
  7382 00003375 50                       push ax
  7383 00003376 E8D1D1                   call prs
  7384 00003379 83C402                   add  sp, 2
  7385                                  
  7386                                  ;-812     error1(" Stop!!"); }
  7387                                  
  7388 0000337C 68[EC33]                 push doinclude_2
  7389 0000337F E84310                   call error1
  7390 00003382 83C402                   add  sp, 2
  7391                                  
  7392                                  ;-813   linenoinclude=lineno; lineno=1;
  7393                                  
  7394                                  .doinclude365:
  7395 00003385 A1[6800]                 mov ax, [lineno]
  7396 00003388 A3[6A00]                 mov word [linenoinclude], ax
  7397 0000338B B80100                   mov ax, 1
  7398 0000338E A3[6800]                 mov word [lineno], ax
  7399                                  
  7400                                  ;-814   parse(); lineno=linenoinclude;
  7401                                  
  7402 00003391 E8FC1A                   call parse
  7403 00003394 A1[6A00]                 mov ax, [linenoinclude]
  7404 00003397 A3[6800]                 mov word [lineno], ax
  7405                                  
  7406                                  ;-815   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7407                                  
  7408 0000339A 8B46FE                   mov ax, [bp-2]
  7409 0000339D A3[1A00]                 mov word [fdin], ax
  7410 000033A0 68[F433]                 push doinclude_3
  7411 000033A3 E8A4D1                   call prs
  7412 000033A6 83C402                   add  sp, 2
  7413 000033A9 8D06666E                 lea  ax, [namein]
  7414 000033AD 50                       push ax
  7415 000033AE E899D1                   call prs
  7416 000033B1 83C402                   add  sp, 2
  7417                                  
  7418                                  ;-816   getfirstchar(); token=getlex(); }
  7419                                  
  7420 000033B4 E8701B                   call getfirstchar
  7421 000033B7 E88B07                   call getlex
  7422 000033BA A3[1E00]                 mov word [token], ax
  7423                                  
  7424                                  ;-817 }
  7425                                  
  7426                                  .doinclude364:
  7427                                  
  7428                                  ;-818 int dodefine() { int i; int j; int fdtemp;
  7429 000033BD C9                       LEAVE
  7430 000033BE C3                       ret
  7431 000033BF 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7432 000033C8 636C7564652066696C-
  7433 000033D1 653A2000           
  7434 000033D5 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7435 000033DE 696C65206D69737369-
  7436 000033E7 6E673A2000         
  7437 000033EC 2053746F70212100        doinclude_2 db " Stop!!",0
  7438 000033F4 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7439 000033FD 6F206D61696E207072-
  7440 00003406 6F6772616D3A2000   
  7441                                  ENDP
  7442                                  
  7443                                  dodefine: PROC
  7444                                  
  7445                                  ;-819   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7446                                  
  7447                                  ;Function : dodefine, Number of local variables: 3
  7448                                  ;   # type sign width addr used name   list of local variables
  7449                                  ;  200 var sign word   818 NULL i = bp-2
  7450                                  ;  201 var sign word   818 NULL j = bp-4
  7451                                  ;  202 var sign word   818 NULL fdtemp = bp-6;
  7452 0000340E C8060000                 ENTER  6,0
  7453 00003412 68[5535]                 push dodefine_0
  7454 00003415 8D06A36D                 lea  ax, [symbol]
  7455 00003419 50                       push ax
  7456 0000341A E866CE                   call eqstr
  7457 0000341D 83C404                   add  sp, 4
  7458 00003420 08C0                     or  al, al
  7459 00003422 0F841500                 je .dodefine366
  7460 00003426 E81C07                   call getlex
  7461 00003429 A3[1E00]                 mov word [token], ax
  7462                                  
  7463                                  ;-820     ORGDATAORIG=lexval; orgData=lexval; return; }
  7464                                  
  7465 0000342C A1[3000]                 mov ax, [lexval]
  7466 0000342F A3[1000]                 mov word [ORGDATAORIG], ax
  7467 00003432 A1[3000]                 mov ax, [lexval]
  7468 00003435 A3[1200]                 mov word [orgData], ax
  7469 00003438 E91801                   jmp .retndodefine
  7470                                  
  7471                                  ;-821   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7472                                  
  7473                                  .dodefine366:
  7474 0000343B 68[5D35]                 push dodefine_1
  7475 0000343E 8D06A36D                 lea  ax, [symbol]
  7476 00003442 50                       push ax
  7477 00003443 E83DCE                   call eqstr
  7478 00003446 83C404                   add  sp, 4
  7479 00003449 08C0                     or  al, al
  7480 0000344B 0F844900                 je .dodefine367
  7481 0000344F E8F306                   call getlex
  7482 00003452 A3[1E00]                 mov word [token], ax
  7483 00003455 A1[1E00]                 mov ax, [token]
  7484 00003458 3D0201                   cmp ax, 258
  7485 0000345B 0F852700                 jne .dodefine368
  7486                                  
  7487                                  ;-822     prs("\n;Use archive file: ");
  7488                                  
  7489 0000345F 68[6535]                 push dodefine_2
  7490 00003462 E8E5D0                   call prs
  7491 00003465 83C402                   add  sp, 2
  7492                                  
  7493                                  ;-823     strcpy(archivename, symbol); prs(archivename);
  7494                                  
  7495 00003468 8D06A36D                 lea  ax, [symbol]
  7496 0000346C 50                       push ax
  7497 0000346D 8D06EC6E                 lea  ax, [archivename]
  7498 00003471 50                       push ax
  7499 00003472 E8D8CD                   call strcpy
  7500 00003475 83C404                   add  sp, 4
  7501 00003478 8D06EC6E                 lea  ax, [archivename]
  7502 0000347C 50                       push ax
  7503 0000347D E8CAD0                   call prs
  7504 00003480 83C402                   add  sp, 2
  7505                                  
  7506                                  ;-824     } else error1("Name of archive file missing"); token=getlex(); return;}
  7507                                  
  7508 00003483 E90900                   jmp .dodefine369
  7509                                  .dodefine368:
  7510 00003486 68[7B35]                 push dodefine_3
  7511 00003489 E8390F                   call error1
  7512 0000348C 83C402                   add  sp, 2
  7513                                  .dodefine369:
  7514 0000348F E8B306                   call getlex
  7515 00003492 A3[1E00]                 mov word [token], ax
  7516 00003495 E9BB00                   jmp .retndodefine
  7517                                  
  7518                                  ;-825    expect(T_NAME);
  7519                                  
  7520                                  .dodefine367:
  7521 00003498 680001                   push 256
  7522 0000349B E899CF                   call expect
  7523 0000349E 83C402                   add  sp, 2
  7524                                  
  7525                                  ;-826   if (token==T_CONST) {
  7526                                  
  7527 000034A1 A1[1E00]                 mov ax, [token]
  7528 000034A4 3D0101                   cmp ax, 257
  7529 000034A7 0F85A800                 jne .dodefine370
  7530                                  
  7531                                  ;-827     if (GTop >= LSTART) error1("global table (define) full");
  7532                                  
  7533 000034AB A1[2C00]                 mov ax, [GTop]
  7534 000034AE 3DC800                   cmp ax, 200 ;unsigned : 1
  7535 000034B1 0F8C0900                 jl  .dodefine371
  7536 000034B5 68[9835]                 push dodefine_4
  7537 000034B8 E80A0F                   call error1
  7538 000034BB 83C402                   add  sp, 2
  7539                                  
  7540                                  ;-828     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7541                                  
  7542                                  .dodefine371:
  7543 000034BE 8D06A36D                 lea  ax, [symbol]
  7544 000034C2 50                       push ax
  7545 000034C3 E85FCD                   call strlen
  7546 000034C6 83C402                   add  sp, 2
  7547 000034C9 8946FE                   mov [bp-2], ax
  7548 000034CC 8B46FE                   mov ax, [bp-2]
  7549 000034CF 83F80F                   cmp ax, 15
  7550 000034D2 0F8E0900                 jle .dodefine372
  7551 000034D6 68[B335]                 push dodefine_5
  7552 000034D9 E8E90E                   call error1
  7553 000034DC 83C402                   add  sp, 2
  7554                                  
  7555                                  ;-829     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7556                                  
  7557                                  .dodefine372:
  7558 000034DF B85500                   mov ax, 85
  7559 000034E2 8B1E[2C00]               mov bx, [GTop]
  7560 000034E6 88875B70                 mov [GSign+bx], al
  7561 000034EA B80100                   mov ax, 1
  7562 000034ED 8B1E[2C00]               mov bx, [GTop]
  7563 000034F1 88878771                 mov [GWidth+bx], al
  7564 000034F5 B82300                   mov ax, 35
  7565 000034F8 8B1E[2C00]               mov bx, [GTop]
  7566 000034FC 88872F6F                 mov [GType+bx], al
  7567                                  
  7568                                  ;-830     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7569                                  
  7570 00003500 A1[6800]                 mov ax, [lineno]
  7571 00003503 83E801                   sub ax, 1
  7572 00003506 8B1E[2C00]               mov bx, [GTop]
  7573 0000350A D1E3                     shl bx, 1
  7574 0000350C 8987B372                 mov [GAdr+bx], ax
  7575 00003510 B80000                   mov ax, 0
  7576 00003513 8B1E[2C00]               mov bx, [GTop]
  7577 00003517 D1E3                     shl bx, 1
  7578 00003519 89870B75                 mov [GUsed+bx], ax
  7579                                  
  7580                                  ;-831     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7581                                  
  7582 0000351D FF36[2C00]               push word [GTop]
  7583 00003521 E8FCD6                   call adrofname
  7584 00003524 83C402                   add  sp, 2
  7585 00003527 A3[6C00]                 mov word [pt], ax
  7586 0000352A 8D06A36D                 lea  ax, [symbol]
  7587 0000352E 50                       push ax
  7588 0000352F FF36[6C00]               push word [pt]
  7589 00003533 E817CD                   call strcpy
  7590 00003536 83C404                   add  sp, 4
  7591 00003539 A1[3000]                 mov ax, [lexval]
  7592 0000353C 8B1E[2C00]               mov bx, [GTop]
  7593 00003540 D1E3                     shl bx, 1
  7594 00003542 89876377                 mov [GData+bx], ax
  7595                                  
  7596                                  ;-832     expect(T_CONST); GTop++;  }
  7597                                  
  7598 00003546 680101                   push 257
  7599 00003549 E8EBCE                   call expect
  7600 0000354C 83C402                   add  sp, 2
  7601 0000354F FF06[2C00]               inc  word[GTop]
  7602                                  
  7603                                  ;-833 }
  7604                                  
  7605                                  .dodefine370:
  7606                                  
  7607                                  ;-834 int stmt() { int c; char cha;
  7608                                  
  7609 00003553 C9                       .retndodefine: LEAVE
  7610 00003554 C3                       ret
  7611 00003555 4F52474441544100        dodefine_0 db "ORGDATA",0
  7612 0000355D 4152434849564500        dodefine_1 db "ARCHIVE",0
  7613 00003565 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7614 0000356E 63686976652066696C-
  7615 00003577 653A2000           
  7616 0000357B 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7617 00003584 726368697665206669-
  7618 0000358D 6C65206D697373696E-
  7619 00003596 6700               
  7620 00003598 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7621 000035A1 626C65202864656669-
  7622 000035AA 6E65292066756C6C00 
  7623 000035B3 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7624 000035BC 6D65206C6F6E676572-
  7625 000035C5 203135206368617200 
  7626                                  ENDP
  7627                                  
  7628                                  stmt: PROC
  7629                                  
  7630                                  ;-835        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7631                                  
  7632                                  ;Function : stmt, Number of local variables: 2
  7633                                  ;   # type sign width addr used name   list of local variables
  7634                                  ;  200 var sign word   834 NULL c = bp-2
  7635                                  ;  201 var sign byte   834 NULL cha = bp-4;
  7636 000035CE C8040000                 ENTER  4,0
  7637 000035D2 6A7B                     push 123
  7638 000035D4 E83ECE                   call istoken
  7639 000035D7 83C402                   add  sp, 2
  7640 000035DA 08C0                     or  al, al
  7641 000035DC 0F841700                 je .stmt373
  7642                                  .stmt374:
  7643 000035E0 6A7D                     push 125
  7644 000035E2 E830CE                   call istoken
  7645 000035E5 83C402                   add  sp, 2
  7646 000035E8 83F800                   cmp ax, 0
  7647 000035EB 0F850500                 jne .stmt375
  7648 000035EF E8DCFF                   call stmt
  7649 000035F2 EBEC                     jmp .stmt374
  7650                                  .stmt375:
  7651                                  
  7652                                  ;-836   else if(istoken(T_IF))    doif();
  7653                                  
  7654 000035F4 E9B001                   jmp .stmt376
  7655                                  .stmt373:
  7656 000035F7 680102                   push 513
  7657 000035FA E818CE                   call istoken
  7658 000035FD 83C402                   add  sp, 2
  7659 00003600 08C0                     or  al, al
  7660 00003602 0F840600                 je .stmt377
  7661 00003606 E8E203                   call doif
  7662                                  
  7663                                  ;-837   else if(istoken(T_DO))    dodo();
  7664                                  
  7665 00003609 E99B01                   jmp .stmt378
  7666                                  .stmt377:
  7667 0000360C 680402                   push 516
  7668 0000360F E803CE                   call istoken
  7669 00003612 83C402                   add  sp, 2
  7670 00003615 08C0                     or  al, al
  7671 00003617 0F840600                 je .stmt379
  7672 0000361B E82F04                   call dodo
  7673                                  
  7674                                  ;-838   else if(istoken(T_WHILE)) dowhile();
  7675                                  
  7676 0000361E E98601                   jmp .stmt380
  7677                                  .stmt379:
  7678 00003621 680302                   push 515
  7679 00003624 E8EECD                   call istoken
  7680 00003627 83C402                   add  sp, 2
  7681 0000362A 08C0                     or  al, al
  7682 0000362C 0F840600                 je .stmt381
  7683 00003630 E86704                   call dowhile
  7684                                  
  7685                                  ;-839   else if(istoken(T_GOTO))  {
  7686                                  
  7687 00003633 E97101                   jmp .stmt382
  7688                                  .stmt381:
  7689 00003636 680902                   push 521
  7690 00003639 E8D9CD                   call istoken
  7691 0000363C 83C402                   add  sp, 2
  7692 0000363F 08C0                     or  al, al
  7693 00003641 0F842200                 je .stmt383
  7694                                  
  7695                                  ;-840     prs("\n jmp .");name1();prs(symbol);expect(';');}
  7696                                  
  7697 00003645 68[A937]                 push stmt_0
  7698 00003648 E8FFCE                   call prs
  7699 0000364B 83C402                   add  sp, 2
  7700 0000364E E8FED7                   call name1
  7701 00003651 8D06A36D                 lea  ax, [symbol]
  7702 00003655 50                       push ax
  7703 00003656 E8F1CE                   call prs
  7704 00003659 83C402                   add  sp, 2
  7705 0000365C 6A3B                     push 59
  7706 0000365E E8D6CD                   call expect
  7707 00003661 83C402                   add  sp, 2
  7708                                  
  7709                                  ;-841   else if(token==T_ASM)     {prs("\n"); c=next();
  7710                                  
  7711 00003664 E94001                   jmp .stmt384
  7712                                  .stmt383:
  7713 00003667 A1[1E00]                 mov ax, [token]
  7714 0000366A 3D0602                   cmp ax, 518
  7715 0000366D 0F853300                 jne .stmt385
  7716 00003671 68[B237]                 push stmt_1
  7717 00003674 E8D3CE                   call prs
  7718 00003677 83C402                   add  sp, 2
  7719 0000367A E87ACD                   call next
  7720 0000367D 8946FE                   mov [bp-2], ax
  7721                                  
  7722                                  ;-842         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7723                                  
  7724                                  .stmt386:
  7725 00003680 8B46FE                   mov ax, [bp-2]
  7726 00003683 83F80A                   cmp ax, 10
  7727 00003686 0F841100                 je  .stmt387
  7728 0000368A FF76FE                   push word [bp-2]
  7729 0000368D E853CE                   call prc
  7730 00003690 83C402                   add  sp, 2
  7731 00003693 E861CD                   call next
  7732 00003696 8946FE                   mov [bp-2], ax
  7733 00003699 EBE5                     jmp .stmt386
  7734                                  .stmt387:
  7735 0000369B E8A704                   call getlex
  7736 0000369E A3[1E00]                 mov word [token], ax
  7737                                  
  7738                                  ;-843   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  7739                                  
  7740 000036A1 E90301                   jmp .stmt388
  7741                                  .stmt385:
  7742 000036A4 680702                   push 519
  7743 000036A7 E86BCD                   call istoken
  7744 000036AA 83C402                   add  sp, 2
  7745 000036AD 08C0                     or  al, al
  7746 000036AF 0F844B00                 je .stmt389
  7747 000036B3 A1[1E00]                 mov ax, [token]
  7748 000036B6 83F87B                   cmp ax, 123
  7749 000036B9 0F853500                 jne .stmt390
  7750 000036BD 68[B537]                 push stmt_2
  7751 000036C0 E887CE                   call prs
  7752 000036C3 83C402                   add  sp, 2
  7753 000036C6 E82ECD                   call next
  7754 000036C9 8846FC                   mov [bp-4], al
  7755                                  
  7756                                  ;-844         while(cha!= '}') { prc(cha); cha=next(); }
  7757                                  
  7758                                  .stmt391:
  7759 000036CC 8A46FC                   mov al, [bp-4]
  7760 000036CF 3C7D                     cmp al, 125
  7761 000036D1 0F841400                 je  .stmt392
  7762 000036D5 8A46FC                   mov al, byte [bp-4]
  7763 000036D8 B400                     mov ah, 0
  7764 000036DA 50                       push ax
  7765 000036DB E805CE                   call prc
  7766 000036DE 83C402                   add  sp, 2
  7767 000036E1 E813CD                   call next
  7768 000036E4 8846FC                   mov [bp-4], al
  7769                                  
  7770                                  ;-845         token=getlex(); }
  7771                                  
  7772 000036E7 EBE3                     jmp .stmt391
  7773                                  .stmt392:
  7774 000036E9 E85904                   call getlex
  7775 000036EC A3[1E00]                 mov word [token], ax
  7776                                  
  7777                                  ;-846         else error1("Curly open expected");
  7778                                  
  7779 000036EF E90900                   jmp .stmt393
  7780                                  .stmt390:
  7781 000036F2 68[B837]                 push stmt_3
  7782 000036F5 E8CD0C                   call error1
  7783 000036F8 83C402                   add  sp, 2
  7784                                  
  7785                                  ;-847         }
  7786                                  
  7787                                  .stmt393:
  7788                                  
  7789                                  ;-848   else if(istoken(T_EMIT))   doemit();
  7790                                  
  7791 000036FB E9A900                   jmp .stmt394
  7792                                  .stmt389:
  7793 000036FE 680802                   push 520
  7794 00003701 E811CD                   call istoken
  7795 00003704 83C402                   add  sp, 2
  7796 00003707 08C0                     or  al, al
  7797 00003709 0F840600                 je .stmt395
  7798 0000370D E8CD00                   call doemit
  7799                                  
  7800                                  ;-849   else if(istoken(';'))      { }
  7801                                  
  7802 00003710 E99400                   jmp .stmt396
  7803                                  .stmt395:
  7804 00003713 6A3B                     push 59
  7805 00003715 E8FDCC                   call istoken
  7806 00003718 83C402                   add  sp, 2
  7807 0000371B 08C0                     or  al, al
  7808 0000371D 0F840300                 je .stmt397
  7809                                  
  7810                                  ;-850   else if(istoken(T_RETURN)) {
  7811                                  
  7812 00003721 E98300                   jmp .stmt398
  7813                                  .stmt397:
  7814 00003724 680002                   push 512
  7815 00003727 E8EBCC                   call istoken
  7816 0000372A 83C402                   add  sp, 2
  7817 0000372D 08C0                     or  al, al
  7818 0000372F 0F843000                 je .stmt399
  7819                                  
  7820                                  ;-851         if (token!=';') exprstart();
  7821                                  
  7822 00003733 A1[1E00]                 mov ax, [token]
  7823 00003736 83F83B                   cmp ax, 59
  7824 00003739 0F840300                 je  .stmt400
  7825 0000373D E8DCDD                   call exprstart
  7826                                  
  7827                                  ;-852         prs("\n jmp .retn");
  7828                                  
  7829                                  .stmt400:
  7830 00003740 68[CC37]                 push stmt_4
  7831 00003743 E804CE                   call prs
  7832 00003746 83C402                   add  sp, 2
  7833                                  
  7834                                  ;-853         prs(fname);
  7835                                  
  7836 00003749 8D06236E                 lea  ax, [fname]
  7837 0000374D 50                       push ax
  7838 0000374E E8F9CD                   call prs
  7839 00003751 83C402                   add  sp, 2
  7840                                  
  7841                                  ;-854         nreturn++;
  7842                                  
  7843 00003754 FF06[2800]               inc  word[nreturn]
  7844                                  
  7845                                  ;-855         expect(';');
  7846                                  
  7847 00003758 6A3B                     push 59
  7848 0000375A E8DACC                   call expect
  7849 0000375D 83C402                   add  sp, 2
  7850                                  
  7851                                  ;-856         }
  7852                                  
  7853                                  
  7854                                  ;-857   else if(thechar==':')      {
  7855                                  
  7856 00003760 E94400                   jmp .stmt401
  7857                                  .stmt399:
  7858 00003763 A0[2300]                 mov al, [thechar]
  7859 00003766 3C3A                     cmp al, 58
  7860 00003768 0F853000                 jne .stmt402
  7861                                  
  7862                                  ;-858         prs("\n."); // Label
  7863                                  
  7864 0000376C 68[D937]                 push stmt_5
  7865 0000376F E8D8CD                   call prs
  7866 00003772 83C402                   add  sp, 2
  7867                                  
  7868                                  ;-859         prs(symbol); prc(':');
  7869                                  
  7870 00003775 8D06A36D                 lea  ax, [symbol]
  7871 00003779 50                       push ax
  7872 0000377A E8CDCD                   call prs
  7873 0000377D 83C402                   add  sp, 2
  7874 00003780 6A3A                     push 58
  7875 00003782 E85ECD                   call prc
  7876 00003785 83C402                   add  sp, 2
  7877                                  
  7878                                  ;-860         expect(T_NAME);
  7879                                  
  7880 00003788 680001                   push 256
  7881 0000378B E8A9CC                   call expect
  7882 0000378E 83C402                   add  sp, 2
  7883                                  
  7884                                  ;-861         expect(':');
  7885                                  
  7886 00003791 6A3A                     push 58
  7887 00003793 E8A1CC                   call expect
  7888 00003796 83C402                   add  sp, 2
  7889                                  
  7890                                  ;-862         }
  7891                                  
  7892                                  
  7893                                  ;-863   else  {exprstart(); expect(';'); }
  7894                                  
  7895 00003799 E90B00                   jmp .stmt403
  7896                                  .stmt402:
  7897 0000379C E87DDD                   call exprstart
  7898 0000379F 6A3B                     push 59
  7899 000037A1 E893CC                   call expect
  7900 000037A4 83C402                   add  sp, 2
  7901                                  
  7902                                  ;-864 }
  7903                                  
  7904                                  .stmt403:
  7905                                  .stmt401:
  7906                                  .stmt398:
  7907                                  .stmt396:
  7908                                  .stmt394:
  7909                                  .stmt388:
  7910                                  .stmt384:
  7911                                  .stmt382:
  7912                                  .stmt380:
  7913                                  .stmt378:
  7914                                  .stmt376:
  7915                                  
  7916                                  ;-865 
  7917                                  
  7918                                  
  7919                                  ;-866 int doemit() {prs("\n db ");
  7920 000037A7 C9                       LEAVE
  7921 000037A8 C3                       ret
  7922 000037A9 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7923 000037B2 5C6E00                  stmt_1 db "\n",0
  7924 000037B5 5C6E00                  stmt_2 db "\n",0
  7925 000037B8 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7926 000037C1 6E2065787065637465-
  7927 000037CA 6400               
  7928 000037CC 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7929 000037D5 65746E00           
  7930 000037D9 5C6E2E00                stmt_5 db "\n.",0
  7931                                  ENDP
  7932                                  
  7933                                  doemit: PROC
  7934 000037DD 68[1938]                 push doemit_0
  7935 000037E0 E867CD                   call prs
  7936 000037E3 83C402                   add  sp, 2
  7937                                  
  7938                                  ;-867   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7939                                  
  7940                                  .L1:
  7941 000037E6 E85C03                   call getlex
  7942 000037E9 A3[1E00]                 mov word [token], ax
  7943 000037EC FF36[3000]               push word [lexval]
  7944 000037F0 E8ACCE                   call prunsign1
  7945 000037F3 83C402                   add  sp, 2
  7946 000037F6 E84C03                   call getlex
  7947 000037F9 A3[1E00]                 mov word [token], ax
  7948                                  
  7949                                  ;-868     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7950                                  
  7951 000037FC A1[1E00]                 mov ax, [token]
  7952 000037FF 83F82C                   cmp ax, 44
  7953 00003802 0F850A00                 jne .doemit404
  7954 00003806 6A2C                     push 44
  7955 00003808 E8D8CC                   call prc
  7956 0000380B 83C402                   add  sp, 2
  7957 0000380E EBD6                     jmp .L1
  7958                                  .doemit404:
  7959 00003810 6A29                     push 41
  7960 00003812 E822CC                   call expect
  7961 00003815 83C402                   add  sp, 2
  7962                                  
  7963                                  ;-869 
  7964                                  
  7965                                  
  7966                                  ;-870 int cmpneg(int ids) {
  7967                                  
  7968 00003818 C3                       ret
  7969 00003819 5C6E2064622000          doemit_0 db "\n db ",0
  7970                                  ENDP
  7971                                  
  7972                                  cmpneg: PROC
  7973                                  
  7974                                  ;-871        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7975                                  
  7976                                  ;Function : cmpneg, Number of local variables: 1
  7977                                  ;   # type sign width addr used name   list of local variables
  7978                                  ;  200 var sign word   870 NULL ids = bp+4;
  7979 00003820 C8000000                 ENTER  0,0
  7980 00003824 A1[2400]                 mov ax, [iscmp]
  7981 00003827 3D2603                   cmp ax, 806
  7982 0000382A 0F850C00                 jne .cmpneg405
  7983 0000382E 68[0139]                 push cmpneg_0
  7984 00003831 E816CD                   call prs
  7985 00003834 83C402                   add  sp, 2
  7986                                  
  7987                                  ;-872   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7988                                  
  7989 00003837 E9C500                   jmp .cmpneg406
  7990                                  .cmpneg405:
  7991 0000383A A1[2400]                 mov ax, [iscmp]
  7992 0000383D 3D2703                   cmp ax, 807
  7993 00003840 0F850C00                 jne .cmpneg407
  7994 00003844 68[0A39]                 push cmpneg_1
  7995 00003847 E800CD                   call prs
  7996 0000384A 83C402                   add  sp, 2
  7997                                  
  7998                                  ;-873   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7999                                  
  8000 0000384D E9AF00                   jmp .cmpneg408
  8001                                  .cmpneg407:
  8002 00003850 A1[2400]                 mov ax, [iscmp]
  8003 00003853 3D3803                   cmp ax, 824
  8004 00003856 0F852100                 jne .cmpneg409
  8005 0000385A 8B4604                   mov ax, [bp+4]
  8006 0000385D 08C0                     or  al, al
  8007 0000385F 0F840C00                 je .cmpneg410
  8008 00003863 68[1339]                 push cmpneg_2
  8009 00003866 E8E1CC                   call prs
  8010 00003869 83C402                   add  sp, 2
  8011                                  
  8012                                  ;-874                            else prs("\n ja  .");//ZF=0 CF=0
  8013                                  
  8014 0000386C E90900                   jmp .cmpneg411
  8015                                  .cmpneg410:
  8016 0000386F 68[1C39]                 push cmpneg_3
  8017 00003872 E8D5CC                   call prs
  8018 00003875 83C402                   add  sp, 2
  8019                                  
  8020                                  ;-875   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  8021                                  
  8022                                  .cmpneg411:
  8023 00003878 E98400                   jmp .cmpneg412
  8024                                  .cmpneg409:
  8025 0000387B A1[2400]                 mov ax, [iscmp]
  8026 0000387E 3D2B03                   cmp ax, 811
  8027 00003881 0F854500                 jne .cmpneg413
  8028 00003885 8B4604                   mov ax, [bp+4]
  8029 00003888 08C0                     or  al, al
  8030 0000388A 0F841E00                 je .cmpneg414
  8031 0000388E 68[2539]                 push cmpneg_4
  8032 00003891 E8B6CC                   call prs
  8033 00003894 83C402                   add  sp, 2
  8034 00003897 FF7604                   push word [bp+4]
  8035 0000389A E802CE                   call prunsign1
  8036 0000389D 83C402                   add  sp, 2
  8037                                  
  8038                                  ;-876                                prs("\n jl  .");}//          SF!=OF
  8039                                  
  8040 000038A0 68[3339]                 push cmpneg_5
  8041 000038A3 E8A4CC                   call prs
  8042 000038A6 83C402                   add  sp, 2
  8043                                  
  8044                                  ;-877                            else{prs(" ;unsigned : "); prunsign1(ids);
  8045                                  
  8046 000038A9 E91B00                   jmp .cmpneg415
  8047                                  .cmpneg414:
  8048 000038AC 68[3C39]                 push cmpneg_6
  8049 000038AF E898CC                   call prs
  8050 000038B2 83C402                   add  sp, 2
  8051 000038B5 FF7604                   push word [bp+4]
  8052 000038B8 E8E4CD                   call prunsign1
  8053 000038BB 83C402                   add  sp, 2
  8054                                  
  8055                                  ;-878                                prs("\n jb  .");}//jb=jc=CF=1
  8056                                  
  8057 000038BE 68[4A39]                 push cmpneg_7
  8058 000038C1 E886CC                   call prs
  8059 000038C4 83C402                   add  sp, 2
  8060                                  
  8061                                  ;-879   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  8062                                  
  8063                                  .cmpneg415:
  8064 000038C7 E93500                   jmp .cmpneg416
  8065                                  .cmpneg413:
  8066 000038CA A1[2400]                 mov ax, [iscmp]
  8067 000038CD 83F83C                   cmp ax, 60
  8068 000038D0 0F850C00                 jne .cmpneg417
  8069 000038D4 68[5339]                 push cmpneg_8
  8070 000038D7 E870CC                   call prs
  8071 000038DA 83C402                   add  sp, 2
  8072                                  
  8073                                  ;-880   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  8074                                  
  8075 000038DD E91F00                   jmp .cmpneg418
  8076                                  .cmpneg417:
  8077 000038E0 A1[2400]                 mov ax, [iscmp]
  8078 000038E3 83F83E                   cmp ax, 62
  8079 000038E6 0F850C00                 jne .cmpneg419
  8080 000038EA 68[5C39]                 push cmpneg_9
  8081 000038ED E85ACC                   call prs
  8082 000038F0 83C402                   add  sp, 2
  8083                                  
  8084                                  ;-881   else error1("internal error compare unknown in CMPNEG()");  }
  8085                                  
  8086 000038F3 E90900                   jmp .cmpneg420
  8087                                  .cmpneg419:
  8088 000038F6 68[6539]                 push cmpneg_10
  8089 000038F9 E8C90A                   call error1
  8090 000038FC 83C402                   add  sp, 2
  8091                                  .cmpneg420:
  8092                                  .cmpneg418:
  8093                                  .cmpneg416:
  8094                                  .cmpneg412:
  8095                                  .cmpneg408:
  8096                                  .cmpneg406:
  8097                                  
  8098                                  ;-882 
  8099                                  
  8100                                  
  8101                                  ;-883 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  8102 000038FF C9                       LEAVE
  8103 00003900 C3                       ret
  8104 00003901 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  8105 0000390A 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  8106 00003913 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  8107 0000391C 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  8108 00003925 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  8109 0000392E 64203A2000         
  8110 00003933 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  8111 0000393C 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  8112 00003945 64203A2000         
  8113 0000394A 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  8114 00003953 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  8115 0000395C 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  8116 00003965 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  8117 0000396E 6572726F7220636F6D-
  8118 00003977 7061726520756E6B6E-
  8119 00003980 6F776E20696E20434D-
  8120 00003989 504E4547282900     
  8121                                  ENDP
  8122                                  
  8123                                  prlabel: PROC
  8124                                  ;Function : prlabel, Number of local variables: 1
  8125                                  ;   # type sign width addr used name   list of local variables
  8126                                  ;  200 var sign word   883 NULL n = bp+4;
  8127 00003990 C8000000                 ENTER  0,0
  8128 00003994 68[BB39]                 push prlabel_0
  8129 00003997 E8B0CB                   call prs
  8130 0000399A 83C402                   add  sp, 2
  8131 0000399D 8D06236E                 lea  ax, [fname]
  8132 000039A1 50                       push ax
  8133 000039A2 E8A5CB                   call prs
  8134 000039A5 83C402                   add  sp, 2
  8135 000039A8 FF7604                   push word [bp+4]
  8136 000039AB E8F1CC                   call prunsign1
  8137 000039AE 83C402                   add  sp, 2
  8138 000039B1 6A3A                     push 58
  8139 000039B3 E82DCB                   call prc
  8140 000039B6 83C402                   add  sp, 2
  8141                                  
  8142                                  ;-884 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  8143 000039B9 C9                       LEAVE
  8144 000039BA C3                       ret
  8145 000039BB 5C6E2E00                prlabel_0 db "\n.",0
  8146                                  ENDP
  8147                                  
  8148                                  prjump: PROC
  8149                                  ;Function : prjump, Number of local variables: 1
  8150                                  ;   # type sign width addr used name   list of local variables
  8151                                  ;  200 var sign word   884 NULL n = bp+4;
  8152 000039BF C8000000                 ENTER  0,0
  8153 000039C3 68[E239]                 push prjump_0
  8154 000039C6 E881CB                   call prs
  8155 000039C9 83C402                   add  sp, 2
  8156 000039CC 8D06236E                 lea  ax, [fname]
  8157 000039D0 50                       push ax
  8158 000039D1 E876CB                   call prs
  8159 000039D4 83C402                   add  sp, 2
  8160 000039D7 FF7604                   push word [bp+4]
  8161 000039DA E8C2CC                   call prunsign1
  8162 000039DD 83C402                   add  sp, 2
  8163                                  
  8164                                  ;-885 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  8165 000039E0 C9                       LEAVE
  8166 000039E1 C3                       ret
  8167 000039E2 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  8168                                  ENDP
  8169                                  
  8170                                  doif: PROC
  8171                                  ;Function : doif, Number of local variables: 2
  8172                                  ;   # type sign width addr used name   list of local variables
  8173                                  ;  200 var sign word   885 NULL jdest = bp-2
  8174                                  ;  201 var sign word   885 NULL tst = bp-4;
  8175 000039EB C8040000                 ENTER  4,0
  8176 000039EF E89ED9                   call pexpr
  8177 000039F2 FF06[2A00]               inc  word[nlabel]
  8178 000039F6 A1[2A00]                 mov ax, [nlabel]
  8179 000039F9 8946FE                   mov [bp-2], ax
  8180                                  
  8181                                  ;-886   pint1(jdest); stmt();
  8182                                  
  8183 000039FC FF76FE                   push word [bp-2]
  8184 000039FF E83FCC                   call pint1
  8185 00003A02 83C402                   add  sp, 2
  8186 00003A05 E8C6FB                   call stmt
  8187                                  
  8188                                  ;-887   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  8189                                  
  8190 00003A08 680202                   push 514
  8191 00003A0B E807CA                   call istoken
  8192 00003A0E 83C402                   add  sp, 2
  8193 00003A11 08C0                     or  al, al
  8194 00003A13 0F842B00                 je .doif421
  8195 00003A17 FF06[2A00]               inc  word[nlabel]
  8196 00003A1B A1[2A00]                 mov ax, [nlabel]
  8197 00003A1E 8946FC                   mov [bp-4], ax
  8198                                  
  8199                                  ;-888     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  8200                                  
  8201 00003A21 FF76FC                   push word [bp-4]
  8202 00003A24 E898FF                   call prjump
  8203 00003A27 83C402                   add  sp, 2
  8204 00003A2A FF76FE                   push word [bp-2]
  8205 00003A2D E860FF                   call prlabel
  8206 00003A30 83C402                   add  sp, 2
  8207 00003A33 E898FB                   call stmt
  8208 00003A36 FF76FC                   push word [bp-4]
  8209 00003A39 E854FF                   call prlabel
  8210 00003A3C 83C402                   add  sp, 2
  8211                                  
  8212                                  ;-889   else prlabel(jdest); }
  8213                                  
  8214 00003A3F E90900                   jmp .doif422
  8215                                  .doif421:
  8216 00003A42 FF76FE                   push word [bp-2]
  8217 00003A45 E848FF                   call prlabel
  8218 00003A48 83C402                   add  sp, 2
  8219                                  .doif422:
  8220                                  
  8221                                  ;-890 
  8222                                  
  8223                                  
  8224                                  ;-891 int dodo() {int jdest; int jtemp;
  8225 00003A4B C9                       LEAVE
  8226 00003A4C C3                       ret
  8227                                  ENDP
  8228                                  
  8229                                  dodo: PROC
  8230                                  
  8231                                  ;-892   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  8232                                  
  8233                                  ;Function : dodo, Number of local variables: 2
  8234                                  ;   # type sign width addr used name   list of local variables
  8235                                  ;  200 var sign word   891 NULL jdest = bp-2
  8236                                  ;  201 var sign word   891 NULL jtemp = bp-4;
  8237 00003A4D C8040000                 ENTER  4,0
  8238 00003A51 FF06[2A00]               inc  word[nlabel]
  8239 00003A55 A1[2A00]                 mov ax, [nlabel]
  8240 00003A58 8946FE                   mov [bp-2], ax
  8241 00003A5B FF76FE                   push word [bp-2]
  8242 00003A5E E82FFF                   call prlabel
  8243 00003A61 83C402                   add  sp, 2
  8244 00003A64 E867FB                   call stmt
  8245                                  
  8246                                  ;-893   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  8247                                  
  8248 00003A67 680302                   push 515
  8249 00003A6A E8CAC9                   call expect
  8250 00003A6D 83C402                   add  sp, 2
  8251 00003A70 E81DD9                   call pexpr
  8252 00003A73 FF06[2A00]               inc  word[nlabel]
  8253 00003A77 A1[2A00]                 mov ax, [nlabel]
  8254 00003A7A 8946FC                   mov [bp-4], ax
  8255 00003A7D FF76FC                   push word [bp-4]
  8256 00003A80 E8BECB                   call pint1
  8257 00003A83 83C402                   add  sp, 2
  8258                                  
  8259                                  ;-894   prjump(jdest); prlabel(jtemp); }
  8260                                  
  8261 00003A86 FF76FE                   push word [bp-2]
  8262 00003A89 E833FF                   call prjump
  8263 00003A8C 83C402                   add  sp, 2
  8264 00003A8F FF76FC                   push word [bp-4]
  8265 00003A92 E8FBFE                   call prlabel
  8266 00003A95 83C402                   add  sp, 2
  8267                                  
  8268                                  ;-895 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  8269 00003A98 C9                       LEAVE
  8270 00003A99 C3                       ret
  8271                                  ENDP
  8272                                  
  8273                                  dowhile: PROC
  8274                                  ;Function : dowhile, Number of local variables: 2
  8275                                  ;   # type sign width addr used name   list of local variables
  8276                                  ;  200 var sign word   895 NULL jdest = bp-2
  8277                                  ;  201 var sign word   895 NULL tst = bp-4;
  8278 00003A9A C8040000                 ENTER  4,0
  8279 00003A9E FF06[2A00]               inc  word[nlabel]
  8280 00003AA2 A1[2A00]                 mov ax, [nlabel]
  8281 00003AA5 8946FE                   mov [bp-2], ax
  8282                                  
  8283                                  ;-896   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  8284                                  
  8285 00003AA8 FF76FE                   push word [bp-2]
  8286 00003AAB E8E2FE                   call prlabel
  8287 00003AAE 83C402                   add  sp, 2
  8288 00003AB1 E8DCD8                   call pexpr
  8289 00003AB4 FF06[2A00]               inc  word[nlabel]
  8290 00003AB8 A1[2A00]                 mov ax, [nlabel]
  8291 00003ABB 8946FC                   mov [bp-4], ax
  8292 00003ABE FF76FC                   push word [bp-4]
  8293 00003AC1 E87DCB                   call pint1
  8294 00003AC4 83C402                   add  sp, 2
  8295                                  
  8296                                  ;-897   stmt(); prjump(jdest); prlabel(tst); }
  8297                                  
  8298 00003AC7 E804FB                   call stmt
  8299 00003ACA FF76FE                   push word [bp-2]
  8300 00003ACD E8EFFE                   call prjump
  8301 00003AD0 83C402                   add  sp, 2
  8302 00003AD3 FF76FC                   push word [bp-4]
  8303 00003AD6 E8B7FE                   call prlabel
  8304 00003AD9 83C402                   add  sp, 2
  8305                                  
  8306                                  ;-898 int isrelational() {
  8307 00003ADC C9                       LEAVE
  8308 00003ADD C3                       ret
  8309                                  ENDP
  8310                                  
  8311                                  isrelational: PROC
  8312                                  
  8313                                  ;-899   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  8314                                  
  8315 00003ADE A1[1E00]                 mov ax, [token]
  8316 00003AE1 3D2603                   cmp ax, 806
  8317 00003AE4 0F850300                 jne .isrelational423
  8318 00003AE8 E94700                   jmp .w
  8319                                  .isrelational423:
  8320 00003AEB A1[1E00]                 mov ax, [token]
  8321 00003AEE 3D2703                   cmp ax, 807
  8322 00003AF1 0F850300                 jne .isrelational424
  8323 00003AF5 E93A00                   jmp .w
  8324                                  
  8325                                  ;-900   if (token==T_LE) goto w; if (token==T_GE) goto w;
  8326                                  
  8327                                  .isrelational424:
  8328 00003AF8 A1[1E00]                 mov ax, [token]
  8329 00003AFB 3D3803                   cmp ax, 824
  8330 00003AFE 0F850300                 jne .isrelational425
  8331 00003B02 E92D00                   jmp .w
  8332                                  .isrelational425:
  8333 00003B05 A1[1E00]                 mov ax, [token]
  8334 00003B08 3D2B03                   cmp ax, 811
  8335 00003B0B 0F850300                 jne .isrelational426
  8336 00003B0F E92000                   jmp .w
  8337                                  
  8338                                  ;-901   if (token=='<' ) goto w; if (token=='>' ) goto w;
  8339                                  
  8340                                  .isrelational426:
  8341 00003B12 A1[1E00]                 mov ax, [token]
  8342 00003B15 83F83C                   cmp ax, 60
  8343 00003B18 0F850300                 jne .isrelational427
  8344 00003B1C E91300                   jmp .w
  8345                                  .isrelational427:
  8346 00003B1F A1[1E00]                 mov ax, [token]
  8347 00003B22 83F83E                   cmp ax, 62
  8348 00003B25 0F850300                 jne .isrelational428
  8349 00003B29 E90600                   jmp .w
  8350                                  
  8351                                  ;-902   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8352                                  
  8353                                  .isrelational428:
  8354 00003B2C B80000                   mov ax, 0
  8355 00003B2F E91200                   jmp .retnisrelational
  8356                                  .w:
  8357 00003B32 A1[1E00]                 mov ax, [token]
  8358 00003B35 A3[2400]                 mov word [iscmp], ax
  8359 00003B38 E80A00                   call getlex
  8360 00003B3B A3[1E00]                 mov word [token], ax
  8361 00003B3E B80100                   mov ax, 1
  8362 00003B41 E90000                   jmp .retnisrelational
  8363                                  
  8364                                  ;-903 
  8365                                  
  8366                                  
  8367                                  ;-904 char symboltemp[80];
  8368                                  
  8369                                   .retnisrelational:
  8370 00003B44 C3                       ret
  8371                                  ENDP
  8372                                  section .bss
  8373                                  absolute 48468
  8374 0000BD54 <res 00000050>          symboltemp resb 80
  8375                                  section .text
  8376                                  
  8377                                  ;-905 int getlex() { char c; char *p;
  8378                                  
  8379                                  
  8380                                  getlex: PROC
  8381                                  
  8382                                  ;-906 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8383                                  
  8384                                  ;Function : getlex, Number of local variables: 2
  8385                                  ;   # type sign width addr used name   list of local variables
  8386                                  ;  200 var sign byte   905 NULL c = bp-2
  8387                                  ;  201 ptr sign byte   905 NULL p = bp-4;
  8388 00003B45 C8040000                 ENTER  4,0
  8389                                  .g1:
  8390 00003B49 E8ABC8                   call next
  8391 00003B4C 8846FE                   mov [bp-2], al
  8392 00003B4F 8A46FE                   mov al, [bp-2]
  8393 00003B52 3C00                     cmp al, 0
  8394 00003B54 0F850600                 jne .getlex429
  8395 00003B58 B80000                   mov ax, 0
  8396 00003B5B E9F404                   jmp .retngetlex
  8397                                  .getlex429:
  8398 00003B5E 8A46FE                   mov al, [bp-2]
  8399 00003B61 3C20                     cmp al, 32
  8400 00003B63 0F8F0200                 jg  .getlex430
  8401 00003B67 EBE0                     jmp .g1
  8402                                  
  8403                                  ;-907   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8404                                  
  8405                                  .getlex430:
  8406 00003B69 8A46FE                   mov al, [bp-2]
  8407 00003B6C 3C3D                     cmp al, 61
  8408 00003B6E 0F851200                 jne .getlex431
  8409 00003B72 A0[2300]                 mov al, [thechar]
  8410 00003B75 3C3D                     cmp al, 61
  8411 00003B77 0F850900                 jne .getlex432
  8412 00003B7B E879C8                   call next
  8413 00003B7E B82603                   mov ax, 806
  8414 00003B81 E9CE04                   jmp .retngetlex
  8415                                  .getlex432:
  8416                                  
  8417                                  ;-908   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8418                                  
  8419                                  .getlex431:
  8420 00003B84 8A46FE                   mov al, [bp-2]
  8421 00003B87 3C21                     cmp al, 33
  8422 00003B89 0F851200                 jne .getlex433
  8423 00003B8D A0[2300]                 mov al, [thechar]
  8424 00003B90 3C3D                     cmp al, 61
  8425 00003B92 0F850900                 jne .getlex434
  8426 00003B96 E85EC8                   call next
  8427 00003B99 B82703                   mov ax, 807
  8428 00003B9C E9B304                   jmp .retngetlex
  8429                                  .getlex434:
  8430                                  
  8431                                  ;-909   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8432                                  
  8433                                  .getlex433:
  8434 00003B9F 8A46FE                   mov al, [bp-2]
  8435 00003BA2 3C3C                     cmp al, 60
  8436 00003BA4 0F851200                 jne .getlex435
  8437 00003BA8 A0[2300]                 mov al, [thechar]
  8438 00003BAB 3C3D                     cmp al, 61
  8439 00003BAD 0F850900                 jne .getlex436
  8440 00003BB1 E843C8                   call next
  8441 00003BB4 B83803                   mov ax, 824
  8442 00003BB7 E99804                   jmp .retngetlex
  8443                                  .getlex436:
  8444                                  
  8445                                  ;-910   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8446                                  
  8447                                  .getlex435:
  8448 00003BBA 8A46FE                   mov al, [bp-2]
  8449 00003BBD 3C3E                     cmp al, 62
  8450 00003BBF 0F851200                 jne .getlex437
  8451 00003BC3 A0[2300]                 mov al, [thechar]
  8452 00003BC6 3C3D                     cmp al, 61
  8453 00003BC8 0F850900                 jne .getlex438
  8454 00003BCC E828C8                   call next
  8455 00003BCF B82B03                   mov ax, 811
  8456 00003BD2 E97D04                   jmp .retngetlex
  8457                                  .getlex438:
  8458                                  
  8459                                  ;-911   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8460                                  
  8461                                  .getlex437:
  8462 00003BD5 8A46FE                   mov al, [bp-2]
  8463 00003BD8 3C3C                     cmp al, 60
  8464 00003BDA 0F851200                 jne .getlex439
  8465 00003BDE A0[2300]                 mov al, [thechar]
  8466 00003BE1 3C3C                     cmp al, 60
  8467 00003BE3 0F850900                 jne .getlex440
  8468 00003BE7 E80DC8                   call next
  8469 00003BEA B8D804                   mov ax, 1240
  8470 00003BED E96204                   jmp .retngetlex
  8471                                  .getlex440:
  8472                                  
  8473                                  ;-912   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8474                                  
  8475                                  .getlex439:
  8476 00003BF0 8A46FE                   mov al, [bp-2]
  8477 00003BF3 3C3E                     cmp al, 62
  8478 00003BF5 0F851200                 jne .getlex441
  8479 00003BF9 A0[2300]                 mov al, [thechar]
  8480 00003BFC 3C3E                     cmp al, 62
  8481 00003BFE 0F850900                 jne .getlex442
  8482 00003C02 E8F2C7                   call next
  8483 00003C05 B8D904                   mov ax, 1241
  8484 00003C08 E94704                   jmp .retngetlex
  8485                                  .getlex442:
  8486                                  
  8487                                  ;-913   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8488                                  
  8489                                  .getlex441:
  8490 00003C0B 8A46FE                   mov al, [bp-2]
  8491 00003C0E 3C2B                     cmp al, 43
  8492 00003C10 0F851200                 jne .getlex443
  8493 00003C14 A0[2300]                 mov al, [thechar]
  8494 00003C17 3C2B                     cmp al, 43
  8495 00003C19 0F850900                 jne .getlex444
  8496 00003C1D E8D7C7                   call next
  8497 00003C20 B8C304                   mov ax, 1219
  8498 00003C23 E92C04                   jmp .retngetlex
  8499                                  .getlex444:
  8500                                  
  8501                                  ;-914   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8502                                  
  8503                                  .getlex443:
  8504 00003C26 8A46FE                   mov al, [bp-2]
  8505 00003C29 3C2D                     cmp al, 45
  8506 00003C2B 0F851200                 jne .getlex445
  8507 00003C2F A0[2300]                 mov al, [thechar]
  8508 00003C32 3C2D                     cmp al, 45
  8509 00003C34 0F850900                 jne .getlex446
  8510 00003C38 E8BCC7                   call next
  8511 00003C3B B8C904                   mov ax, 1225
  8512 00003C3E E91104                   jmp .retngetlex
  8513                                  .getlex446:
  8514                                  
  8515                                  ;-915   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8516                                  
  8517                                  .getlex445:
  8518 00003C41 8A46FE                   mov al, [bp-2]
  8519 00003C44 3C2B                     cmp al, 43
  8520 00003C46 0F851200                 jne .getlex447
  8521 00003C4A A0[2300]                 mov al, [thechar]
  8522 00003C4D 3C3D                     cmp al, 61
  8523 00003C4F 0F850900                 jne .getlex448
  8524 00003C53 E8A1C7                   call next
  8525 00003C56 B8CE04                   mov ax, 1230
  8526 00003C59 E9F603                   jmp .retngetlex
  8527                                  .getlex448:
  8528                                  
  8529                                  ;-916   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8530                                  
  8531                                  .getlex447:
  8532 00003C5C 8A46FE                   mov al, [bp-2]
  8533 00003C5F 3C2D                     cmp al, 45
  8534 00003C61 0F851200                 jne .getlex449
  8535 00003C65 A0[2300]                 mov al, [thechar]
  8536 00003C68 3C3D                     cmp al, 61
  8537 00003C6A 0F850900                 jne .getlex450
  8538 00003C6E E886C7                   call next
  8539 00003C71 B8CF04                   mov ax, 1231
  8540 00003C74 E9DB03                   jmp .retngetlex
  8541                                  .getlex450:
  8542                                  
  8543                                  ;-917   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8544                                  
  8545                                  .getlex449:
  8546 00003C77 8A46FE                   mov al, [bp-2]
  8547 00003C7A 3C26                     cmp al, 38
  8548 00003C7C 0F851200                 jne .getlex451
  8549 00003C80 A0[2300]                 mov al, [thechar]
  8550 00003C83 3C3D                     cmp al, 61
  8551 00003C85 0F850900                 jne .getlex452
  8552 00003C89 E86BC7                   call next
  8553 00003C8C B8D204                   mov ax, 1234
  8554 00003C8F E9C003                   jmp .retngetlex
  8555                                  .getlex452:
  8556                                  
  8557                                  ;-918   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  8558                                  
  8559                                  .getlex451:
  8560 00003C92 8A46FE                   mov al, [bp-2]
  8561 00003C95 3C7C                     cmp al, 124
  8562 00003C97 0F851200                 jne .getlex453
  8563 00003C9B A0[2300]                 mov al, [thechar]
  8564 00003C9E 3C3D                     cmp al, 61
  8565 00003CA0 0F850900                 jne .getlex454
  8566 00003CA4 E850C7                   call next
  8567 00003CA7 B8D304                   mov ax, 1235
  8568 00003CAA E9A503                   jmp .retngetlex
  8569                                  .getlex454:
  8570                                  
  8571                                  ;-919   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8572                                  
  8573                                  .getlex453:
  8574 00003CAD 8A46FE                   mov al, [bp-2]
  8575 00003CB0 3C2A                     cmp al, 42
  8576 00003CB2 0F851200                 jne .getlex455
  8577 00003CB6 A0[2300]                 mov al, [thechar]
  8578 00003CB9 3C3D                     cmp al, 61
  8579 00003CBB 0F850900                 jne .getlex456
  8580 00003CBF E835C7                   call next
  8581 00003CC2 B8D004                   mov ax, 1232
  8582 00003CC5 E98A03                   jmp .retngetlex
  8583                                  .getlex456:
  8584                                  
  8585                                  ;-920   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  8586                                  
  8587                                  .getlex455:
  8588 00003CC8 8A46FE                   mov al, [bp-2]
  8589 00003CCB 3C2F                     cmp al, 47
  8590 00003CCD 0F851200                 jne .getlex457
  8591 00003CD1 A0[2300]                 mov al, [thechar]
  8592 00003CD4 3C3D                     cmp al, 61
  8593 00003CD6 0F850900                 jne .getlex458
  8594 00003CDA E81AC7                   call next
  8595 00003CDD B8D104                   mov ax, 1233
  8596 00003CE0 E96F03                   jmp .retngetlex
  8597                                  .getlex458:
  8598                                  
  8599                                  ;-921   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8600                                  
  8601                                  .getlex457:
  8602 00003CE3 8A46FE                   mov al, byte [bp-2]
  8603 00003CE6 B400                     mov ah, 0
  8604 00003CE8 50                       push ax
  8605 00003CE9 68[5440]                 push getlex_0
  8606 00003CEC E848C6                   call instr1
  8607 00003CEF 83C404                   add  sp, 4
  8608 00003CF2 08C0                     or  al, al
  8609 00003CF4 0F840600                 je .getlex459
  8610 00003CF8 8A46FE                   mov al, [bp-2]
  8611 00003CFB E95403                   jmp .retngetlex
  8612                                  
  8613                                  ;-922   if (c == '/') { if (thechar == '/') {
  8614                                  
  8615                                  .getlex459:
  8616 00003CFE 8A46FE                   mov al, [bp-2]
  8617 00003D01 3C2F                     cmp al, 47
  8618 00003D03 0F852900                 jne .getlex460
  8619 00003D07 A0[2300]                 mov al, [thechar]
  8620 00003D0A 3C2F                     cmp al, 47
  8621 00003D0C 0F852000                 jne .getlex461
  8622                                  
  8623                                  ;-923       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  8624                                  
  8625                                  .getlex462:
  8626 00003D10 E8E4C6                   call next
  8627 00003D13 8846FE                   mov [bp-2], al
  8628 00003D16 8A46FE                   mov al, byte [bp-2]
  8629 00003D19 B400                     mov ah, 0
  8630 00003D1B 50                       push ax
  8631 00003D1C E84A06                   call ifEOL
  8632 00003D1F 83C402                   add  sp, 2
  8633 00003D22 3C00                     cmp al, 0
  8634 00003D24 0F850200                 jne .getlex463
  8635 00003D28 EBE6                     jmp .getlex462
  8636                                  .getlex463:
  8637 00003D2A E818FE                   call getlex
  8638 00003D2D E92203                   jmp .retngetlex
  8639                                  .getlex461:
  8640                                  
  8641                                  ;-924   if (c == '/') { if (thechar == '*') {
  8642                                  
  8643                                  .getlex460:
  8644 00003D30 8A46FE                   mov al, [bp-2]
  8645 00003D33 3C2F                     cmp al, 47
  8646 00003D35 0F853A00                 jne .getlex464
  8647 00003D39 A0[2300]                 mov al, [thechar]
  8648 00003D3C 3C2A                     cmp al, 42
  8649 00003D3E 0F852B00                 jne .getlex465
  8650                                  
  8651                                  ;-925       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8652                                  
  8653                                  .g2:
  8654 00003D42 E8B2C6                   call next
  8655 00003D45 8846FE                   mov [bp-2], al
  8656 00003D48 8A46FE                   mov al, [bp-2]
  8657 00003D4B 3C2A                     cmp al, 42
  8658 00003D4D 0F840200                 je  .getlex466
  8659 00003D51 EBEF                     jmp .g2
  8660                                  .getlex466:
  8661 00003D53 A0[2300]                 mov al, [thechar]
  8662 00003D56 3C2F                     cmp al, 47
  8663 00003D58 0F840200                 je  .getlex467
  8664 00003D5C EBE4                     jmp .g2
  8665                                  
  8666                                  ;-926       c=next(); return getlex(); } else  return '/'; }
  8667                                  
  8668                                  .getlex467:
  8669 00003D5E E896C6                   call next
  8670 00003D61 8846FE                   mov [bp-2], al
  8671 00003D64 E8DEFD                   call getlex
  8672 00003D67 E9E802                   jmp .retngetlex
  8673 00003D6A E90600                   jmp .getlex468
  8674                                  .getlex465:
  8675 00003D6D B82F00                   mov ax, 47
  8676 00003D70 E9DF02                   jmp .retngetlex
  8677                                  .getlex468:
  8678                                  
  8679                                  ;-927   if (c == '"') {getstring(c); return T_STRING;}
  8680                                  
  8681                                  .getlex464:
  8682 00003D73 8A46FE                   mov al, [bp-2]
  8683 00003D76 3C22                     cmp al, 34
  8684 00003D78 0F851200                 jne .getlex469
  8685 00003D7C 8A46FE                   mov al, byte [bp-2]
  8686 00003D7F B400                     mov ah, 0
  8687 00003D81 50                       push ax
  8688 00003D82 E89804                   call getstring
  8689 00003D85 83C402                   add  sp, 2
  8690 00003D88 B80201                   mov ax, 258
  8691 00003D8B E9C402                   jmp .retngetlex
  8692                                  
  8693                                  ;-928   if (digit(c)) { getdigit(c); return T_CONST; }
  8694                                  
  8695                                  .getlex469:
  8696 00003D8E 8A46FE                   mov al, byte [bp-2]
  8697 00003D91 B400                     mov ah, 0
  8698 00003D93 50                       push ax
  8699 00003D94 E828C4                   call digit
  8700 00003D97 83C402                   add  sp, 2
  8701 00003D9A 08C0                     or  al, al
  8702 00003D9C 0F841200                 je .getlex470
  8703 00003DA0 8A46FE                   mov al, byte [bp-2]
  8704 00003DA3 B400                     mov ah, 0
  8705 00003DA5 50                       push ax
  8706 00003DA6 E89E03                   call getdigit
  8707 00003DA9 83C402                   add  sp, 2
  8708 00003DAC B80101                   mov ax, 257
  8709 00003DAF E9A002                   jmp .retngetlex
  8710                                  
  8711                                  ;-929   if (c==39) { lexval=next();
  8712                                  
  8713                                  .getlex470:
  8714 00003DB2 8A46FE                   mov al, [bp-2]
  8715 00003DB5 3C27                     cmp al, 39
  8716 00003DB7 0F854F00                 jne .getlex471
  8717 00003DBB E839C6                   call next
  8718 00003DBE A3[3000]                 mov word [lexval], ax
  8719                                  
  8720                                  ;-930     if (lexval==92) {lexval=next();
  8721                                  
  8722 00003DC1 A1[3000]                 mov ax, [lexval]
  8723 00003DC4 83F85C                   cmp ax, 92
  8724 00003DC7 0F853600                 jne .getlex472
  8725 00003DCB E829C6                   call next
  8726 00003DCE A3[3000]                 mov word [lexval], ax
  8727                                  
  8728                                  ;-931       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8729                                  
  8730 00003DD1 A1[3000]                 mov ax, [lexval]
  8731 00003DD4 83F86E                   cmp ax, 110
  8732 00003DD7 0F850600                 jne .getlex473
  8733 00003DDB B80A00                   mov ax, 10
  8734 00003DDE A3[3000]                 mov word [lexval], ax
  8735                                  .getlex473:
  8736 00003DE1 A1[3000]                 mov ax, [lexval]
  8737 00003DE4 83F874                   cmp ax, 116
  8738 00003DE7 0F850600                 jne .getlex474
  8739 00003DEB B80900                   mov ax, 9
  8740 00003DEE A3[3000]                 mov word [lexval], ax
  8741                                  
  8742                                  ;-932       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8743                                  
  8744                                  .getlex474:
  8745 00003DF1 A1[3000]                 mov ax, [lexval]
  8746 00003DF4 83F830                   cmp ax, 48
  8747 00003DF7 0F850600                 jne .getlex475
  8748 00003DFB B80000                   mov ax, 0
  8749 00003DFE A3[3000]                 mov word [lexval], ax
  8750                                  .getlex475:
  8751                                  .getlex472:
  8752 00003E01 E8F3C5                   call next
  8753 00003E04 B80101                   mov ax, 257
  8754 00003E07 E94802                   jmp .retngetlex
  8755                                  
  8756                                  ;-933   if (alnum(c)) {
  8757                                  
  8758                                  .getlex471:
  8759 00003E0A 8A46FE                   mov al, byte [bp-2]
  8760 00003E0D B400                     mov ah, 0
  8761 00003E0F 50                       push ax
  8762 00003E10 E8D6C3                   call alnum
  8763 00003E13 83C402                   add  sp, 2
  8764 00003E16 08C0                     or  al, al
  8765 00003E18 0F842D02                 je .getlex476
  8766                                  
  8767                                  ;-934     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8768                                  
  8769 00003E1C 8D06A36D                 lea  ax, [symbol]
  8770 00003E20 50                       push ax
  8771 00003E21 8D0654BD                 lea  ax, [symboltemp]
  8772 00003E25 50                       push ax
  8773 00003E26 E824C4                   call strcpy
  8774 00003E29 83C404                   add  sp, 4
  8775 00003E2C B8A36D                   mov ax, symbol
  8776 00003E2F 8946FC                   mov [bp-4], ax
  8777 00003E32 8A46FE                   mov al, [bp-2]
  8778 00003E35 8B5EFC                   mov  bx, [bp-4]
  8779 00003E38 8807                     mov  [bx], al
  8780 00003E3A FF46FC                   inc  word[bp-4]
  8781                                  
  8782                                  ;-935     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  8783                                  
  8784                                  .getlex477:
  8785 00003E3D A0[2300]                 mov al, byte [thechar]
  8786 00003E40 B400                     mov ah, 0
  8787 00003E42 50                       push ax
  8788 00003E43 E8A3C3                   call alnum
  8789 00003E46 83C402                   add  sp, 2
  8790 00003E49 08C0                     or  al, al
  8791 00003E4B 0F841300                 je .getlex478
  8792 00003E4F E8A5C5                   call next
  8793 00003E52 8846FE                   mov [bp-2], al
  8794 00003E55 8A46FE                   mov al, [bp-2]
  8795 00003E58 8B5EFC                   mov  bx, [bp-4]
  8796 00003E5B 8807                     mov  [bx], al
  8797 00003E5D FF46FC                   inc  word[bp-4]
  8798                                  
  8799                                  ;-936       *p=0;
  8800                                  
  8801 00003E60 EBDB                     jmp .getlex477
  8802                                  .getlex478:
  8803 00003E62 B80000                   mov ax, 0
  8804 00003E65 8B5EFC                   mov  bx, [bp-4]
  8805 00003E68 8807                     mov  [bx], al
  8806                                  
  8807                                  ;-937     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8808                                  
  8809 00003E6A 68[6A40]                 push getlex_1
  8810 00003E6D 8D06A36D                 lea  ax, [symbol]
  8811 00003E71 50                       push ax
  8812 00003E72 E80EC4                   call eqstr
  8813 00003E75 83C404                   add  sp, 4
  8814 00003E78 08C0                     or  al, al
  8815 00003E7A 0F840600                 je .getlex479
  8816 00003E7E B81302                   mov ax, 531
  8817 00003E81 E9CE01                   jmp .retngetlex
  8818                                  
  8819                                  ;-938     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8820                                  
  8821                                  .getlex479:
  8822 00003E84 68[7140]                 push getlex_2
  8823 00003E87 8D06A36D                 lea  ax, [symbol]
  8824 00003E8B 50                       push ax
  8825 00003E8C E8F4C3                   call eqstr
  8826 00003E8F 83C404                   add  sp, 4
  8827 00003E92 08C0                     or  al, al
  8828 00003E94 0F840600                 je .getlex480
  8829 00003E98 B81402                   mov ax, 532
  8830 00003E9B E9B401                   jmp .retngetlex
  8831                                  
  8832                                  ;-939     if (eqstr(symbol,"void"    )) return T_VOID;
  8833                                  
  8834                                  .getlex480:
  8835 00003E9E 68[7A40]                 push getlex_3
  8836 00003EA1 8D06A36D                 lea  ax, [symbol]
  8837 00003EA5 50                       push ax
  8838 00003EA6 E8DAC3                   call eqstr
  8839 00003EA9 83C404                   add  sp, 4
  8840 00003EAC 08C0                     or  al, al
  8841 00003EAE 0F840600                 je .getlex481
  8842 00003EB2 B81102                   mov ax, 529
  8843 00003EB5 E99A01                   jmp .retngetlex
  8844                                  
  8845                                  ;-940     if (eqstr(symbol,"int"     )) return T_INT;
  8846                                  
  8847                                  .getlex481:
  8848 00003EB8 68[7F40]                 push getlex_4
  8849 00003EBB 8D06A36D                 lea  ax, [symbol]
  8850 00003EBF 50                       push ax
  8851 00003EC0 E8C0C3                   call eqstr
  8852 00003EC3 83C404                   add  sp, 4
  8853 00003EC6 08C0                     or  al, al
  8854 00003EC8 0F840600                 je .getlex482
  8855 00003ECC B80502                   mov ax, 517
  8856 00003ECF E98001                   jmp .retngetlex
  8857                                  
  8858                                  ;-941     if (eqstr(symbol,"long"    )) return T_LONG;
  8859                                  
  8860                                  .getlex482:
  8861 00003ED2 68[8340]                 push getlex_5
  8862 00003ED5 8D06A36D                 lea  ax, [symbol]
  8863 00003ED9 50                       push ax
  8864 00003EDA E8A6C3                   call eqstr
  8865 00003EDD 83C404                   add  sp, 4
  8866 00003EE0 08C0                     or  al, al
  8867 00003EE2 0F840600                 je .getlex483
  8868 00003EE6 B81502                   mov ax, 533
  8869 00003EE9 E96601                   jmp .retngetlex
  8870                                  
  8871                                  ;-942     if (eqstr(symbol,"char"    )) return T_CHAR;
  8872                                  
  8873                                  .getlex483:
  8874 00003EEC 68[8840]                 push getlex_6
  8875 00003EEF 8D06A36D                 lea  ax, [symbol]
  8876 00003EF3 50                       push ax
  8877 00003EF4 E88CC3                   call eqstr
  8878 00003EF7 83C404                   add  sp, 4
  8879 00003EFA 08C0                     or  al, al
  8880 00003EFC 0F840600                 je .getlex484
  8881 00003F00 B81202                   mov ax, 530
  8882 00003F03 E94C01                   jmp .retngetlex
  8883                                  
  8884                                  ;-943     if (eqstr(symbol,"asm"     )) return T_ASM;
  8885                                  
  8886                                  .getlex484:
  8887 00003F06 68[8D40]                 push getlex_7
  8888 00003F09 8D06A36D                 lea  ax, [symbol]
  8889 00003F0D 50                       push ax
  8890 00003F0E E872C3                   call eqstr
  8891 00003F11 83C404                   add  sp, 4
  8892 00003F14 08C0                     or  al, al
  8893 00003F16 0F840600                 je .getlex485
  8894 00003F1A B80602                   mov ax, 518
  8895 00003F1D E93201                   jmp .retngetlex
  8896                                  
  8897                                  ;-944     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8898                                  
  8899                                  .getlex485:
  8900 00003F20 68[9140]                 push getlex_8
  8901 00003F23 8D06A36D                 lea  ax, [symbol]
  8902 00003F27 50                       push ax
  8903 00003F28 E858C3                   call eqstr
  8904 00003F2B 83C404                   add  sp, 4
  8905 00003F2E 08C0                     or  al, al
  8906 00003F30 0F840600                 je .getlex486
  8907 00003F34 B80702                   mov ax, 519
  8908 00003F37 E91801                   jmp .retngetlex
  8909                                  
  8910                                  ;-945     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8911                                  
  8912                                  .getlex486:
  8913 00003F3A 68[9740]                 push getlex_9
  8914 00003F3D 8D06A36D                 lea  ax, [symbol]
  8915 00003F41 50                       push ax
  8916 00003F42 E83EC3                   call eqstr
  8917 00003F45 83C404                   add  sp, 4
  8918 00003F48 08C0                     or  al, al
  8919 00003F4A 0F840600                 je .getlex487
  8920 00003F4E B80802                   mov ax, 520
  8921 00003F51 E9FE00                   jmp .retngetlex
  8922                                  
  8923                                  ;-946     if (eqstr(symbol,"return"  )) return T_RETURN;
  8924                                  
  8925                                  .getlex487:
  8926 00003F54 68[A040]                 push getlex_10
  8927 00003F57 8D06A36D                 lea  ax, [symbol]
  8928 00003F5B 50                       push ax
  8929 00003F5C E824C3                   call eqstr
  8930 00003F5F 83C404                   add  sp, 4
  8931 00003F62 08C0                     or  al, al
  8932 00003F64 0F840600                 je .getlex488
  8933 00003F68 B80002                   mov ax, 512
  8934 00003F6B E9E400                   jmp .retngetlex
  8935                                  
  8936                                  ;-947     if (eqstr(symbol,"if"      )) return T_IF;
  8937                                  
  8938                                  .getlex488:
  8939 00003F6E 68[A740]                 push getlex_11
  8940 00003F71 8D06A36D                 lea  ax, [symbol]
  8941 00003F75 50                       push ax
  8942 00003F76 E80AC3                   call eqstr
  8943 00003F79 83C404                   add  sp, 4
  8944 00003F7C 08C0                     or  al, al
  8945 00003F7E 0F840600                 je .getlex489
  8946 00003F82 B80102                   mov ax, 513
  8947 00003F85 E9CA00                   jmp .retngetlex
  8948                                  
  8949                                  ;-948     if (eqstr(symbol,"else"    )) return T_ELSE;
  8950                                  
  8951                                  .getlex489:
  8952 00003F88 68[AA40]                 push getlex_12
  8953 00003F8B 8D06A36D                 lea  ax, [symbol]
  8954 00003F8F 50                       push ax
  8955 00003F90 E8F0C2                   call eqstr
  8956 00003F93 83C404                   add  sp, 4
  8957 00003F96 08C0                     or  al, al
  8958 00003F98 0F840600                 je .getlex490
  8959 00003F9C B80202                   mov ax, 514
  8960 00003F9F E9B000                   jmp .retngetlex
  8961                                  
  8962                                  ;-949     if (eqstr(symbol,"while"   )) return T_WHILE;
  8963                                  
  8964                                  .getlex490:
  8965 00003FA2 68[AF40]                 push getlex_13
  8966 00003FA5 8D06A36D                 lea  ax, [symbol]
  8967 00003FA9 50                       push ax
  8968 00003FAA E8D6C2                   call eqstr
  8969 00003FAD 83C404                   add  sp, 4
  8970 00003FB0 08C0                     or  al, al
  8971 00003FB2 0F840600                 je .getlex491
  8972 00003FB6 B80302                   mov ax, 515
  8973 00003FB9 E99600                   jmp .retngetlex
  8974                                  
  8975                                  ;-950     if (eqstr(symbol,"do"      )) return T_DO;
  8976                                  
  8977                                  .getlex491:
  8978 00003FBC 68[B540]                 push getlex_14
  8979 00003FBF 8D06A36D                 lea  ax, [symbol]
  8980 00003FC3 50                       push ax
  8981 00003FC4 E8BCC2                   call eqstr
  8982 00003FC7 83C404                   add  sp, 4
  8983 00003FCA 08C0                     or  al, al
  8984 00003FCC 0F840600                 je .getlex492
  8985 00003FD0 B80402                   mov ax, 516
  8986 00003FD3 E97C00                   jmp .retngetlex
  8987                                  
  8988                                  ;-951     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8989                                  
  8990                                  .getlex492:
  8991 00003FD6 68[B840]                 push getlex_15
  8992 00003FD9 8D06A36D                 lea  ax, [symbol]
  8993 00003FDD 50                       push ax
  8994 00003FDE E8A2C2                   call eqstr
  8995 00003FE1 83C404                   add  sp, 4
  8996 00003FE4 08C0                     or  al, al
  8997 00003FE6 0F840600                 je .getlex493
  8998 00003FEA B80902                   mov ax, 521
  8999 00003FED E96200                   jmp .retngetlex
  9000                                  
  9001                                  ;-952     if (eqstr(symbol,"define"  )) return T_DEFINE;
  9002                                  
  9003                                  .getlex493:
  9004 00003FF0 68[BD40]                 push getlex_16
  9005 00003FF3 8D06A36D                 lea  ax, [symbol]
  9006 00003FF7 50                       push ax
  9007 00003FF8 E888C2                   call eqstr
  9008 00003FFB 83C404                   add  sp, 4
  9009 00003FFE 08C0                     or  al, al
  9010 00004000 0F840600                 je .getlex494
  9011 00004004 B8FF01                   mov ax, 511
  9012 00004007 E94800                   jmp .retngetlex
  9013                                  
  9014                                  ;-953     if (eqstr(symbol,"include" )) return T_INCLUDE;
  9015                                  
  9016                                  .getlex494:
  9017 0000400A 68[C440]                 push getlex_17
  9018 0000400D 8D06A36D                 lea  ax, [symbol]
  9019 00004011 50                       push ax
  9020 00004012 E86EC2                   call eqstr
  9021 00004015 83C404                   add  sp, 4
  9022 00004018 08C0                     or  al, al
  9023 0000401A 0F840600                 je .getlex495
  9024 0000401E B8FE01                   mov ax, 510
  9025 00004021 E92E00                   jmp .retngetlex
  9026                                  
  9027                                  ;-954     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  9028                                  
  9029                                  .getlex495:
  9030 00004024 E8BF00                   call convertdefine
  9031 00004027 08C0                     or  al, al
  9032 00004029 0F841600                 je .getlex496
  9033 0000402D 8D0654BD                 lea  ax, [symboltemp]
  9034 00004031 50                       push ax
  9035 00004032 8D06A36D                 lea  ax, [symbol]
  9036 00004036 50                       push ax
  9037 00004037 E813C2                   call strcpy
  9038 0000403A 83C404                   add  sp, 4
  9039 0000403D B80101                   mov ax, 257
  9040 00004040 E90F00                   jmp .retngetlex
  9041                                  
  9042                                  ;-955     return T_NAME; } error1("Input item not recognized"); }
  9043                                  
  9044                                  .getlex496:
  9045 00004043 B80001                   mov ax, 256
  9046 00004046 E90900                   jmp .retngetlex
  9047                                  .getlex476:
  9048 00004049 68[CC40]                 push getlex_18
  9049 0000404C E87603                   call error1
  9050 0000404F 83C402                   add  sp, 2
  9051                                  
  9052                                  ;-956 
  9053                                  
  9054                                  
  9055                                  ;-957 int convertdefine() { int i; int j;   i=0;
  9056                                  
  9057 00004052 C9                       .retngetlex: LEAVE
  9058 00004053 C3                       ret
  9059 00004054 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  9060 0000405D 3A252D3E3C3D2B2126-
  9061 00004066 7C233F00           
  9062 0000406A 7369676E656400          getlex_1 db "signed",0
  9063 00004071 756E7369676E656400      getlex_2 db "unsigned",0
  9064 0000407A 766F696400              getlex_3 db "void",0
  9065 0000407F 696E7400                getlex_4 db "int",0
  9066 00004083 6C6F6E6700              getlex_5 db "long",0
  9067 00004088 6368617200              getlex_6 db "char",0
  9068 0000408D 61736D00                getlex_7 db "asm",0
  9069 00004091 5F5F61736D00            getlex_8 db "__asm",0
  9070 00004097 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  9071 000040A0 72657475726E00          getlex_10 db "return",0
  9072 000040A7 696600                  getlex_11 db "if",0
  9073 000040AA 656C736500              getlex_12 db "else",0
  9074 000040AF 7768696C6500            getlex_13 db "while",0
  9075 000040B5 646F00                  getlex_14 db "do",0
  9076 000040B8 676F746F00              getlex_15 db "goto",0
  9077 000040BD 646566696E6500          getlex_16 db "define",0
  9078 000040C4 696E636C75646500        getlex_17 db "include",0
  9079 000040CC 496E70757420697465-     getlex_18 db "Input item not recognized",0
  9080 000040D5 6D206E6F7420726563-
  9081 000040DE 6F676E697A656400   
  9082                                  ENDP
  9083                                  
  9084                                  convertdefine: PROC
  9085                                  ;Function : convertdefine, Number of local variables: 2
  9086                                  ;   # type sign width addr used name   list of local variables
  9087                                  ;  200 var sign word   957 NULL i = bp-2
  9088                                  ;  201 var sign word   957 NULL j = bp-4;
  9089 000040E6 C8040000                 ENTER  4,0
  9090 000040EA B80000                   mov ax, 0
  9091 000040ED 8946FE                   mov [bp-2], ax
  9092                                  
  9093                                  ;-958   while (i < GTop) {
  9094                                  
  9095                                  .convertdefine497:
  9096 000040F0 8B46FE                   mov ax, [bp-2]
  9097 000040F3 3B06[2C00]               cmp ax, [GTop]
  9098 000040F7 0F8D4400                 jge .convertdefine498
  9099                                  
  9100                                  ;-959    j=adrofname(i);
  9101                                  
  9102 000040FB FF76FE                   push word [bp-2]
  9103 000040FE E81FCB                   call adrofname
  9104 00004101 83C402                   add  sp, 2
  9105 00004104 8946FC                   mov [bp-4], ax
  9106                                  
  9107                                  ;-960    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  9108                                  
  9109 00004107 FF76FC                   push word [bp-4]
  9110 0000410A 8D06A36D                 lea  ax, [symbol]
  9111 0000410E 50                       push ax
  9112 0000410F E871C1                   call eqstr
  9113 00004112 83C404                   add  sp, 4
  9114 00004115 08C0                     or  al, al
  9115 00004117 0F841F00                 je .convertdefine499
  9116 0000411B 8B5EFE                   mov bx, [bp-2]
  9117 0000411E 8A872F6F                 mov al, [GType + bx]
  9118 00004122 3C23                     cmp al, 35
  9119 00004124 0F851200                 jne .convertdefine500
  9120 00004128 8B5EFE                   mov bx, [bp-2]
  9121 0000412B D1E3                     shl bx, 1
  9122 0000412D 8B876377                 mov ax, [GData + bx]
  9123 00004131 A3[3000]                 mov word [lexval], ax
  9124                                  
  9125                                  ;-961    return T_CONST; } }
  9126                                  
  9127 00004134 B80101                   mov ax, 257
  9128 00004137 E90B00                   jmp .retnconvertdefine
  9129                                  .convertdefine500:
  9130                                  
  9131                                  ;-962    i++; }
  9132                                  
  9133                                  .convertdefine499:
  9134 0000413A FF46FE                   inc  word[bp-2]
  9135                                  
  9136                                  ;-963    return 0; }
  9137                                  
  9138 0000413D EBB1                     jmp .convertdefine497
  9139                                  .convertdefine498:
  9140 0000413F B80000                   mov ax, 0
  9141 00004142 E90000                   jmp .retnconvertdefine
  9142                                  
  9143                                  ;-964 int getdigit(char c) { int i;
  9144                                  
  9145 00004145 C9                       .retnconvertdefine: LEAVE
  9146 00004146 C3                       ret
  9147                                  ENDP
  9148                                  
  9149                                  getdigit: PROC
  9150                                  
  9151                                  ;-965     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  9152                                  
  9153                                  ;Function : getdigit, Number of local variables: 2
  9154                                  ;   # type sign width addr used name   list of local variables
  9155                                  ;  200 var sign byte   964 NULL c = bp+4
  9156                                  ;  201 var sign word   964 NULL i = bp-2;
  9157 00004147 C8020000                 ENTER  2,0
  9158 0000414B B80000                   mov ax, 0
  9159 0000414E A3[3000]                 mov word [lexval], ax
  9160 00004151 8A4604                   mov al, [bp+4]
  9161 00004154 2C30                     sub al, 48
  9162 00004156 A3[3000]                 mov word [lexval], ax
  9163                                  
  9164                                  ;-966     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  9165                                  
  9166 00004159 A0[2300]                 mov al, [thechar]
  9167 0000415C 3C78                     cmp al, 120
  9168 0000415E 0F850600                 jne .getdigit501
  9169 00004162 B85800                   mov ax, 88
  9170 00004165 A2[2300]                 mov byte [thechar], al
  9171                                  .getdigit501:
  9172 00004168 A0[2300]                 mov al, [thechar]
  9173 0000416B 3C58                     cmp al, 88
  9174 0000416D 0F856800                 jne .getdigit502
  9175 00004171 E883C2                   call next
  9176                                  
  9177                                  ;-967       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  9178                                  
  9179                                  .getdigit503:
  9180 00004174 A0[2300]                 mov al, byte [thechar]
  9181 00004177 B400                     mov ah, 0
  9182 00004179 50                       push ax
  9183 0000417A E86CC0                   call alnum
  9184 0000417D 83C402                   add  sp, 2
  9185 00004180 08C0                     or  al, al
  9186 00004182 0F845000                 je .getdigit504
  9187 00004186 E86EC2                   call next
  9188 00004189 884604                   mov [bp+4], al
  9189 0000418C 8A4604                   mov al, [bp+4]
  9190 0000418F 3C60                     cmp al, 96
  9191 00004191 0F8E0800                 jle .getdigit505
  9192 00004195 8A4604                   mov al, [bp+4]
  9193 00004198 2C27                     sub al, 39
  9194 0000419A 884604                   mov [bp+4], al
  9195                                  
  9196                                  ;-968 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  9197                                  
  9198                                  .getdigit505:
  9199 0000419D 8A4604                   mov al, [bp+4]
  9200 000041A0 3C40                     cmp al, 64
  9201 000041A2 0F8E0800                 jle .getdigit506
  9202 000041A6 8A4604                   mov al, [bp+4]
  9203 000041A9 2C07                     sub al, 7
  9204 000041AB 884604                   mov [bp+4], al
  9205                                  .getdigit506:
  9206 000041AE 8A4604                   mov al, [bp+4]
  9207 000041B1 2C30                     sub al, 48
  9208 000041B3 884604                   mov [bp+4], al
  9209 000041B6 A1[3000]                 mov ax, [lexval]
  9210 000041B9 C1E004                   shl ax, 4
  9211 000041BC A3[3000]                 mov word [lexval], ax
  9212                                  
  9213                                  ;-969      i=0; i=c; lexval=lexval+i;}
  9214                                  
  9215 000041BF B80000                   mov ax, 0
  9216 000041C2 8946FE                   mov [bp-2], ax
  9217 000041C5 8A4604                   mov al, [bp+4]
  9218 000041C8 8946FE                   mov [bp-2], ax
  9219 000041CB A1[3000]                 mov ax, [lexval]
  9220 000041CE 0346FE                   add ax, [bp-2]
  9221 000041D1 A3[3000]                 mov word [lexval], ax
  9222                                  
  9223                                  ;-970     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  9224                                  
  9225 000041D4 EB9E                     jmp .getdigit503
  9226                                  .getdigit504:
  9227 000041D6 E94200                   jmp .getdigit507
  9228                                  .getdigit502:
  9229                                  .getdigit508:
  9230 000041D9 A0[2300]                 mov al, byte [thechar]
  9231 000041DC B400                     mov ah, 0
  9232 000041DE 50                       push ax
  9233 000041DF E8DDBF                   call digit
  9234 000041E2 83C402                   add  sp, 2
  9235 000041E5 08C0                     or  al, al
  9236 000041E7 0F843000                 je .getdigit509
  9237 000041EB E809C2                   call next
  9238 000041EE 884604                   mov [bp+4], al
  9239 000041F1 8A4604                   mov al, [bp+4]
  9240 000041F4 2C30                     sub al, 48
  9241 000041F6 884604                   mov [bp+4], al
  9242 000041F9 A1[3000]                 mov ax, [lexval]
  9243 000041FC BB0A00                   mov bx, 10
  9244 000041FF F7E3                     mul bx
  9245 00004201 A3[3000]                 mov word [lexval], ax
  9246                                  
  9247                                  ;-971      i=0; i=c; lexval=lexval+i; } }
  9248                                  
  9249 00004204 B80000                   mov ax, 0
  9250 00004207 8946FE                   mov [bp-2], ax
  9251 0000420A 8A4604                   mov al, [bp+4]
  9252 0000420D 8946FE                   mov [bp-2], ax
  9253 00004210 A1[3000]                 mov ax, [lexval]
  9254 00004213 0346FE                   add ax, [bp-2]
  9255 00004216 A3[3000]                 mov word [lexval], ax
  9256 00004219 EBBE                     jmp .getdigit508
  9257                                  .getdigit509:
  9258                                  
  9259                                  ;-972 }
  9260                                  
  9261                                  .getdigit507:
  9262                                  
  9263                                  ;-973 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  9264 0000421B C9                       LEAVE
  9265 0000421C C3                       ret
  9266                                  ENDP
  9267                                  
  9268                                  getstring: PROC
  9269                                  ;Function : getstring, Number of local variables: 3
  9270                                  ;   # type sign width addr used name   list of local variables
  9271                                  ;  200 var sign word   973 NULL delim = bp+4
  9272                                  ;  201 var sign word   973 NULL c = bp-2
  9273                                  ;  202 ptr sign byte   973 NULL p = bp-4;
  9274 0000421D C8040000                 ENTER  4,0
  9275 00004221 B8A36D                   mov ax, symbol
  9276 00004224 8946FC                   mov [bp-4], ax
  9277 00004227 E8CDC1                   call next
  9278 0000422A 8946FE                   mov [bp-2], ax
  9279                                  
  9280                                  ;-974   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  9281                                  
  9282                                  .getstring510:
  9283 0000422D 8B46FE                   mov ax, [bp-2]
  9284 00004230 3B4604                   cmp ax, [bp+4]
  9285 00004233 0F841300                 je  .getstring511
  9286 00004237 8B46FE                   mov ax, [bp-2]
  9287 0000423A 8B5EFC                   mov  bx, [bp-4]
  9288 0000423D 8807                     mov  [bx], al
  9289 0000423F FF46FC                   inc  word[bp-4]
  9290 00004242 E8B2C1                   call next
  9291 00004245 8946FE                   mov [bp-2], ax
  9292 00004248 EBE3                     jmp .getstring510
  9293                                  .getstring511:
  9294 0000424A B80000                   mov ax, 0
  9295 0000424D 8B5EFC                   mov  bx, [bp-4]
  9296 00004250 8807                     mov  [bx], al
  9297                                  
  9298                                  ;-975 
  9299                                  
  9300                                  
  9301                                  ;-976 
  9302                                  
  9303                                  
  9304                                  ;-977 int fgets1() {
  9305 00004252 C9                       LEAVE
  9306 00004253 C3                       ret
  9307                                  ENDP
  9308                                  
  9309                                  fgets1: PROC
  9310                                  
  9311                                  ;-978     char c;
  9312                                  
  9313                                  
  9314                                  ;-979     c=*fgetsp;
  9315                                  
  9316                                  ;Function : fgets1, Number of local variables: 1
  9317                                  ;   # type sign width addr used name   list of local variables
  9318                                  ;  200 var sign byte   978 NULL c = bp-2;
  9319 00004254 C8020000                 ENTER  2,0
  9320 00004258 8B1E[6400]               mov bx, [fgetsp]
  9321 0000425C 8A07                     mov al, [bx]
  9322 0000425E B400                     mov ah, 0
  9323 00004260 8846FE                   mov [bp-2], al
  9324                                  
  9325                                  ;-980     if (c==0) {
  9326                                  
  9327 00004263 8A46FE                   mov al, [bp-2]
  9328 00004266 3C00                     cmp al, 0
  9329 00004268 0F852A00                 jne .fgets1512
  9330                                  
  9331                                  ;-981         printinputline();
  9332                                  
  9333 0000426C E83700                   call printinputline
  9334                                  
  9335                                  ;-982         if (DOS_NoBytes == 0) return 0;
  9336                                  
  9337 0000426F A1[7200]                 mov ax, [DOS_NoBytes]
  9338 00004272 83F800                   cmp ax, 0
  9339 00004275 0F850600                 jne .fgets1513
  9340 00004279 B80000                   mov ax, 0
  9341 0000427C E92500                   jmp .retnfgets1
  9342                                  
  9343                                  ;-983         fgetsp=&fgetsdest;
  9344                                  
  9345                                  .fgets1513:
  9346 0000427F B887BC                   mov ax, fgetsdest
  9347 00004282 A3[6400]                 mov word [fgetsp], ax
  9348                                  
  9349                                  ;-984         c=*fgetsp;
  9350                                  
  9351 00004285 8B1E[6400]               mov bx, [fgetsp]
  9352 00004289 8A07                     mov al, [bx]
  9353 0000428B B400                     mov ah, 0
  9354 0000428D 8846FE                   mov [bp-2], al
  9355                                  
  9356                                  ;-985         column=0;
  9357                                  
  9358 00004290 B80000                   mov ax, 0
  9359 00004293 A3[2100]                 mov word [column], ax
  9360                                  
  9361                                  ;-986     }
  9362                                  
  9363                                  
  9364                                  ;-987     fgetsp++;
  9365                                  
  9366                                  .fgets1512:
  9367 00004296 FF06[6400]               inc  word[fgetsp]
  9368                                  
  9369                                  ;-988     column++;
  9370                                  
  9371 0000429A FF06[2100]               inc  word[column]
  9372                                  
  9373                                  ;-989     return c;
  9374                                  
  9375 0000429E 8A46FE                   mov al, [bp-2]
  9376 000042A1 E90000                   jmp .retnfgets1
  9377                                  
  9378                                  ;-990 }
  9379                                  
  9380                                  
  9381                                  ;-991 int printinputline() {
  9382                                  
  9383 000042A4 C9                       .retnfgets1: LEAVE
  9384 000042A5 C3                       ret
  9385                                  ENDP
  9386                                  
  9387                                  printinputline: PROC
  9388                                  
  9389                                  ;-992     int col;
  9390                                  
  9391                                  
  9392                                  ;-993     col=0;
  9393                                  
  9394                                  ;Function : printinputline, Number of local variables: 1
  9395                                  ;   # type sign width addr used name   list of local variables
  9396                                  ;  200 var sign word   992 NULL col = bp-2;
  9397 000042A6 C8020000                 ENTER  2,0
  9398 000042AA B80000                   mov ax, 0
  9399 000042AD 8946FE                   mov [bp-2], ax
  9400                                  
  9401                                  ;-994     fgetsp=&fgetsdest;
  9402                                  
  9403 000042B0 B887BC                   mov ax, fgetsdest
  9404 000042B3 A3[6400]                 mov word [fgetsp], ax
  9405                                  
  9406                                  ;-995     do {
  9407                                  
  9408                                  .printinputline514:
  9409                                  
  9410                                  ;-996         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9411                                  
  9412 000042B6 6A01                     push 1
  9413 000042B8 FF36[1A00]               push word [fdin]
  9414 000042BC 8D06[7400]               lea  ax, [DOS_ByteRead]
  9415 000042C0 50                       push ax
  9416 000042C1 E853BE                   call readRL
  9417 000042C4 83C406                   add  sp, 6
  9418 000042C7 A3[7200]                 mov word [DOS_NoBytes], ax
  9419                                  
  9420                                  ;-997         if (DOS_NoBytes == 0) return;
  9421                                  
  9422 000042CA A1[7200]                 mov ax, [DOS_NoBytes]
  9423 000042CD 83F800                   cmp ax, 0
  9424 000042D0 0F850300                 jne .printinputline515
  9425 000042D4 E96A00                   jmp .retnprintinputline
  9426                                  
  9427                                  ;-998         *fgetsp=DOS_ByteRead;
  9428                                  
  9429                                  .printinputline515:
  9430 000042D7 A0[7400]                 mov al, [DOS_ByteRead]
  9431 000042DA 8B1E[6400]               mov  bx, [fgetsp]
  9432 000042DE 8807                     mov  [bx], al
  9433                                  
  9434                                  ;-999         fgetsp++;
  9435                                  
  9436 000042E0 FF06[6400]               inc  word[fgetsp]
  9437                                  
  9438                                  ;-1000         col++;
  9439                                  
  9440 000042E4 FF46FE                   inc  word[bp-2]
  9441                                  
  9442                                  ;-1001         if (col >80) error1("input line longer than 80 char");
  9443                                  
  9444 000042E7 8B46FE                   mov ax, [bp-2]
  9445 000042EA 83F850                   cmp ax, 80
  9446 000042ED 0F8E0900                 jle .printinputline516
  9447 000042F1 68[4343]                 push printinputline_0
  9448 000042F4 E8CE00                   call error1
  9449 000042F7 83C402                   add  sp, 2
  9450                                  
  9451                                  ;-1002         }
  9452                                  
  9453                                  .printinputline516:
  9454                                  
  9455                                  ;-1003         while (DOS_ByteRead != 10);
  9456                                  
  9457 000042FA A0[7400]                 mov al, [DOS_ByteRead]
  9458 000042FD 3C0A                     cmp al, 10
  9459 000042FF 0F840200                 je  .printinputline517
  9460 00004303 EBB1                     jmp .printinputline514
  9461                                  .printinputline517:
  9462                                  
  9463                                  ;-1004     *fgetsp=0;
  9464                                  
  9465 00004305 B80000                   mov ax, 0
  9466 00004308 8B1E[6400]               mov  bx, [fgetsp]
  9467 0000430C 8807                     mov  [bx], al
  9468                                  
  9469                                  ;-1005     if (fdout) {
  9470                                  
  9471 0000430E A1[1C00]                 mov ax, [fdout]
  9472 00004311 08C0                     or  al, al
  9473 00004313 0F842A00                 je .printinputline518
  9474                                  
  9475                                  ;-1006         prs("\n\n;-");
  9476                                  
  9477 00004317 68[6243]                 push printinputline_1
  9478 0000431A E82DC2                   call prs
  9479 0000431D 83C402                   add  sp, 2
  9480                                  
  9481                                  ;-1007         prunsign1(lineno);
  9482                                  
  9483 00004320 FF36[6800]               push word [lineno]
  9484 00004324 E878C3                   call prunsign1
  9485 00004327 83C402                   add  sp, 2
  9486                                  
  9487                                  ;-1008         prc(' ');
  9488                                  
  9489 0000432A 6A20                     push 32
  9490 0000432C E8B4C1                   call prc
  9491 0000432F 83C402                   add  sp, 2
  9492                                  
  9493                                  ;-1009         lineno++;
  9494                                  
  9495 00004332 FF06[6800]               inc  word[lineno]
  9496                                  
  9497                                  ;-1010         prscomment(&fgetsdest);
  9498                                  
  9499 00004336 8D0687BC                 lea  ax, [fgetsdest]
  9500 0000433A 50                       push ax
  9501 0000433B E8D0C1                   call prscomment
  9502 0000433E 83C402                   add  sp, 2
  9503                                  
  9504                                  ;-1011         }
  9505                                  
  9506                                  
  9507                                  ;-1012 }
  9508                                  
  9509                                  .printinputline518:
  9510                                  
  9511                                  ;-1013 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  9512                                  
  9513 00004341 C9                       .retnprintinputline: LEAVE
  9514 00004342 C3                       ret
  9515 00004343 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  9516 0000434C 65206C6F6E67657220-
  9517 00004355 7468616E2038302063-
  9518 0000435E 68617200           
  9519 00004362 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  9520                                  ENDP
  9521                                  
  9522                                  ifEOL: PROC
  9523                                  
  9524                                  ;-1014     if (c == 10) return 1;//LF
  9525                                  
  9526                                  ;Function : ifEOL, Number of local variables: 1
  9527                                  ;   # type sign width addr used name   list of local variables
  9528                                  ;  200 var sign byte  1013 NULL c = bp+4;
  9529 00004369 C8000000                 ENTER  0,0
  9530 0000436D 8A4604                   mov al, [bp+4]
  9531 00004370 3C0A                     cmp al, 10
  9532 00004372 0F850600                 jne .ifEOL519
  9533 00004376 B80100                   mov ax, 1
  9534 00004379 E92400                   jmp .retnifEOL
  9535                                  
  9536                                  ;-1015     if (c == 13) {//CR
  9537                                  
  9538                                  .ifEOL519:
  9539 0000437C 8A4604                   mov al, [bp+4]
  9540 0000437F 3C0D                     cmp al, 13
  9541 00004381 0F851500                 jne .ifEOL520
  9542                                  
  9543                                  ;-1016         if (thechar == 10) c=next();
  9544                                  
  9545 00004385 A0[2300]                 mov al, [thechar]
  9546 00004388 3C0A                     cmp al, 10
  9547 0000438A 0F850600                 jne .ifEOL521
  9548 0000438E E866C0                   call next
  9549 00004391 884604                   mov [bp+4], al
  9550                                  
  9551                                  ;-1017         return 1;
  9552                                  
  9553                                  .ifEOL521:
  9554 00004394 B80100                   mov ax, 1
  9555 00004397 E90600                   jmp .retnifEOL
  9556                                  
  9557                                  ;-1018     }
  9558                                  
  9559                                  
  9560                                  ;-1019     return 0;
  9561                                  
  9562                                  .ifEOL520:
  9563 0000439A B80000                   mov ax, 0
  9564 0000439D E90000                   jmp .retnifEOL
  9565                                  
  9566                                  ;-1020 }
  9567                                  
  9568                                  
  9569                                  ;-1021 
  9570                                  
  9571                                  
  9572                                  ;-1022 
  9573                                  
  9574                                  
  9575                                  ;-1023 
  9576                                  
  9577                                  
  9578                                  ;-1024 int end1(int n) {
  9579                                  
  9580 000043A0 C9                       .retnifEOL: LEAVE
  9581 000043A1 C3                       ret
  9582                                  ENDP
  9583                                  
  9584                                  end1: PROC
  9585                                  
  9586                                  ;-1025     fcloseR(fdin);
  9587                                  
  9588                                  ;Function : end1, Number of local variables: 1
  9589                                  ;   # type sign width addr used name   list of local variables
  9590                                  ;  200 var sign word  1024 NULL n = bp+4;
  9591 000043A2 C8000000                 ENTER  0,0
  9592 000043A6 FF36[1A00]               push word [fdin]
  9593 000043AA E84DBD                   call fcloseR
  9594 000043AD 83C402                   add  sp, 2
  9595                                  
  9596                                  ;-1026     fcloseR(fdout);
  9597                                  
  9598 000043B0 FF36[1C00]               push word [fdout]
  9599 000043B4 E843BD                   call fcloseR
  9600 000043B7 83C402                   add  sp, 2
  9601                                  
  9602                                  ;-1027     exitR(n);
  9603                                  
  9604 000043BA FF7604                   push word [bp+4]
  9605 000043BD E849BD                   call exitR
  9606 000043C0 83C402                   add  sp, 2
  9607                                  
  9608                                  ;-1028 }
  9609                                  
  9610                                  
  9611                                  ;-1029 int error1(char *s) {
  9612 000043C3 C9                       LEAVE
  9613 000043C4 C3                       ret
  9614                                  ENDP
  9615                                  
  9616                                  error1: PROC
  9617                                  
  9618                                  ;-1030     lineno--;
  9619                                  
  9620                                  ;Function : error1, Number of local variables: 1
  9621                                  ;   # type sign width addr used name   list of local variables
  9622                                  ;  200 ptr sign byte  1029 NULL s = bp+4;
  9623 000043C5 C8000000                 ENTER  0,0
  9624 000043C9 FF0E[6800]               dec  word[lineno]
  9625                                  
  9626                                  ;-1031     prnl();
  9627                                  
  9628 000043CD E86CC1                   call prnl
  9629                                  
  9630                                  ;-1032     prscomment(&fgetsdest);
  9631                                  
  9632 000043D0 8D0687BC                 lea  ax, [fgetsdest]
  9633 000043D4 50                       push ax
  9634 000043D5 E836C1                   call prscomment
  9635 000043D8 83C402                   add  sp, 2
  9636                                  
  9637                                  ;-1033     prs(";Line: ");
  9638                                  
  9639 000043DB 68[4444]                 push error1_0
  9640 000043DE E869C1                   call prs
  9641 000043E1 83C402                   add  sp, 2
  9642                                  
  9643                                  ;-1034     prunsign1(lineno);
  9644                                  
  9645 000043E4 FF36[6800]               push word [lineno]
  9646 000043E8 E8B4C2                   call prunsign1
  9647 000043EB 83C402                   add  sp, 2
  9648                                  
  9649                                  ;-1035     prs(" ************** ERROR: ");
  9650                                  
  9651 000043EE 68[4C44]                 push error1_1
  9652 000043F1 E856C1                   call prs
  9653 000043F4 83C402                   add  sp, 2
  9654                                  
  9655                                  ;-1036     prs(s);
  9656                                  
  9657 000043F7 FF7604                   push word [bp+4]
  9658 000043FA E84DC1                   call prs
  9659 000043FD 83C402                   add  sp, 2
  9660                                  
  9661                                  ;-1037     prs("  in column: ");
  9662                                  
  9663 00004400 68[6444]                 push error1_2
  9664 00004403 E844C1                   call prs
  9665 00004406 83C402                   add  sp, 2
  9666                                  
  9667                                  ;-1038     prunsign1(column);
  9668                                  
  9669 00004409 FF36[2100]               push word [column]
  9670 0000440D E88FC2                   call prunsign1
  9671 00004410 83C402                   add  sp, 2
  9672                                  
  9673                                  ;-1039     prs("\nToken: ");
  9674                                  
  9675 00004413 68[7244]                 push error1_3
  9676 00004416 E831C1                   call prs
  9677 00004419 83C402                   add  sp, 2
  9678                                  
  9679                                  ;-1040     prunsign1(token);
  9680                                  
  9681 0000441C FF36[1E00]               push word [token]
  9682 00004420 E87CC2                   call prunsign1
  9683 00004423 83C402                   add  sp, 2
  9684                                  
  9685                                  ;-1041 //    prs(", globC: ");
  9686                                  
  9687                                  
  9688                                  ;-1042 //    prc(globC);
  9689                                  
  9690                                  
  9691                                  ;-1043 //    prs(", thechar: ");
  9692                                  
  9693                                  
  9694                                  ;-1044 //    prunsign1(thechar);
  9695                                  
  9696                                  
  9697                                  ;-1045     prs(", symbol: ");
  9698                                  
  9699 00004426 68[7C44]                 push error1_4
  9700 00004429 E81EC1                   call prs
  9701 0000442C 83C402                   add  sp, 2
  9702                                  
  9703                                  ;-1046     prs(symbol);
  9704                                  
  9705 0000442F 8D06A36D                 lea  ax, [symbol]
  9706 00004433 50                       push ax
  9707 00004434 E813C1                   call prs
  9708 00004437 83C402                   add  sp, 2
  9709                                  
  9710                                  ;-1047     end1(1);
  9711                                  
  9712 0000443A 6A01                     push 1
  9713 0000443C E863FF                   call end1
  9714 0000443F 83C402                   add  sp, 2
  9715                                  
  9716                                  ;-1048 }
  9717                                  
  9718                                  
  9719                                  ;-1049 int listproc() {
  9720 00004442 C9                       LEAVE
  9721 00004443 C3                       ret
  9722 00004444 3B4C696E653A2000        error1_0 db ";Line: ",0
  9723 0000444C 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9724 00004455 2A2A2A2A2A2A204552-
  9725 0000445E 524F523A2000       
  9726 00004464 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9727 0000446D 6D6E3A2000         
  9728 00004472 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9729 0000447B 00                 
  9730 0000447C 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  9731 00004485 2000               
  9732                                  ENDP
  9733                                  
  9734                                  listproc: PROC
  9735                                  
  9736                                  ;-1050     int i;
  9737                                  
  9738                                  
  9739                                  ;-1051     if (LTop > LSTART) {
  9740                                  
  9741                                  ;Function : listproc, Number of local variables: 1
  9742                                  ;   # type sign width addr used name   list of local variables
  9743                                  ;  200 var sign word  1050 NULL i = bp-2;
  9744 00004487 C8020000                 ENTER  2,0
  9745 0000448B A1[2E00]                 mov ax, [LTop]
  9746 0000448E 3DC800                   cmp ax, 200
  9747 00004491 0F8E6000                 jle .listproc522
  9748                                  
  9749                                  ;-1052         prs("\n;Function : "); prs(fname);
  9750                                  
  9751 00004495 68[F744]                 push listproc_0
  9752 00004498 E8AFC0                   call prs
  9753 0000449B 83C402                   add  sp, 2
  9754 0000449E 8D06236E                 lea  ax, [fname]
  9755 000044A2 50                       push ax
  9756 000044A3 E8A4C0                   call prs
  9757 000044A6 83C402                   add  sp, 2
  9758                                  
  9759                                  ;-1053         prs(", Number of local variables: ");
  9760                                  
  9761 000044A9 68[0645]                 push listproc_1
  9762 000044AC E89BC0                   call prs
  9763 000044AF 83C402                   add  sp, 2
  9764                                  
  9765                                  ;-1054         i=LTop - LSTART;
  9766                                  
  9767 000044B2 A1[2E00]                 mov ax, [LTop]
  9768 000044B5 2DC800                   sub ax, 200
  9769 000044B8 8946FE                   mov [bp-2], ax
  9770                                  
  9771                                  ;-1055         prunsign1(i);
  9772                                  
  9773 000044BB FF76FE                   push word [bp-2]
  9774 000044BE E8DEC1                   call prunsign1
  9775 000044C1 83C402                   add  sp, 2
  9776                                  
  9777                                  ;-1056         prs("\n;   # type sign width addr used name");
  9778                                  
  9779 000044C4 68[2445]                 push listproc_2
  9780 000044C7 E880C0                   call prs
  9781 000044CA 83C402                   add  sp, 2
  9782                                  
  9783                                  ;-1057         prs("   list of local variables");
  9784                                  
  9785 000044CD 68[4B45]                 push listproc_3
  9786 000044D0 E877C0                   call prs
  9787 000044D3 83C402                   add  sp, 2
  9788                                  
  9789                                  ;-1058         i=LSTART;
  9790                                  
  9791 000044D6 B8C800                   mov ax, 200
  9792 000044D9 8946FE                   mov [bp-2], ax
  9793                                  
  9794                                  ;-1059         while (i < LTop) {
  9795                                  
  9796                                  .listproc523:
  9797 000044DC 8B46FE                   mov ax, [bp-2]
  9798 000044DF 3B06[2E00]               cmp ax, [LTop]
  9799 000044E3 0F8D0E00                 jge .listproc524
  9800                                  
  9801                                  ;-1060             listvar(i);
  9802                                  
  9803 000044E7 FF76FE                   push word [bp-2]
  9804 000044EA E84703                   call listvar
  9805 000044ED 83C402                   add  sp, 2
  9806                                  
  9807                                  ;-1061             i++;
  9808                                  
  9809 000044F0 FF46FE                   inc  word[bp-2]
  9810                                  
  9811                                  ;-1062             }
  9812                                  
  9813                                  
  9814                                  ;-1063         }
  9815                                  
  9816 000044F3 EBE7                     jmp .listproc523
  9817                                  .listproc524:
  9818                                  
  9819                                  ;-1064 }
  9820                                  
  9821                                  .listproc522:
  9822                                  
  9823                                  ;-1065 int listcall() {
  9824 000044F5 C9                       LEAVE
  9825 000044F6 C3                       ret
  9826 000044F7 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9827 00004500 6F6E203A2000       
  9828 00004506 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9829 0000450F 6F66206C6F63616C20-
  9830 00004518 7661726961626C6573-
  9831 00004521 3A2000             
  9832 00004524 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name",0
  9833 0000452D 797065207369676E20-
  9834 00004536 776964746820616464-
  9835 0000453F 722075736564206E61-
  9836 00004548 6D6500             
  9837 0000454B 2020206C697374206F-     listproc_3 db "   list of local variables",0
  9838 00004554 66206C6F63616C2076-
  9839 0000455D 61726961626C657300 
  9840                                  ENDP
  9841                                  
  9842                                  listcall: PROC
  9843                                  
  9844                                  ;-1066     int i;
  9845                                  
  9846                                  
  9847                                  ;-1067     prs("\n\n;    #  addr name   list of CALLs\n");
  9848                                  
  9849                                  ;Function : listcall, Number of local variables: 1
  9850                                  ;   # type sign width addr used name   list of local variables
  9851                                  ;  200 var sign word  1066 NULL i = bp-2;
  9852 00004566 C8020000                 ENTER  2,0
  9853 0000456A 68[9445]                 push listcall_0
  9854 0000456D E8DABF                   call prs
  9855 00004570 83C402                   add  sp, 2
  9856                                  
  9857                                  ;-1068     i=0;
  9858                                  
  9859 00004573 B80000                   mov ax, 0
  9860 00004576 8946FE                   mov [bp-2], ax
  9861                                  
  9862                                  ;-1069     while (i< CTop) {
  9863                                  
  9864                                  .listcall525:
  9865 00004579 8B46FE                   mov ax, [bp-2]
  9866 0000457C 3B06[3F00]               cmp ax, [CTop]
  9867 00004580 0F8D0E00                 jge .listcall526
  9868                                  
  9869                                  ;-1070         calllisting(i);
  9870                                  
  9871 00004584 FF76FE                   push word [bp-2]
  9872 00004587 E83200                   call calllisting
  9873 0000458A 83C402                   add  sp, 2
  9874                                  
  9875                                  ;-1071         i++;
  9876                                  
  9877 0000458D FF46FE                   inc  word[bp-2]
  9878                                  
  9879                                  ;-1072         }
  9880                                  
  9881                                  
  9882                                  ;-1073 }
  9883                                  
  9884 00004590 EBE7                     jmp .listcall525
  9885                                  .listcall526:
  9886                                  
  9887                                  ;-1074 int calllisting(int i) {
  9888 00004592 C9                       LEAVE
  9889 00004593 C3                       ret
  9890 00004594 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9891 0000459D 23202061646472206E-
  9892 000045A6 616D652020206C6973-
  9893 000045AF 74206F662043414C4C-
  9894 000045B8 735C6E00           
  9895                                  ENDP
  9896                                  
  9897                                  calllisting: PROC
  9898                                  
  9899                                  ;-1075     char c; int j;
  9900                                  
  9901                                  
  9902                                  ;-1076     prs("\n;");
  9903                                  
  9904                                  ;Function : calllisting, Number of local variables: 3
  9905                                  ;   # type sign width addr used name   list of local variables
  9906                                  ;  200 var sign word  1074 NULL i = bp+4
  9907                                  ;  201 var sign byte  1075 NULL c = bp-2
  9908                                  ;  202 var sign word  1075 NULL j = bp-4;
  9909 000045BC C8040000                 ENTER  4,0
  9910 000045C0 68[2E46]                 push calllisting_0
  9911 000045C3 E884BF                   call prs
  9912 000045C6 83C402                   add  sp, 2
  9913                                  
  9914                                  ;-1077     printint51(i);
  9915                                  
  9916 000045C9 FF7604                   push word [bp+4]
  9917 000045CC E814C1                   call printint51
  9918 000045CF 83C402                   add  sp, 2
  9919                                  
  9920                                  ;-1078     prc(32);
  9921                                  
  9922 000045D2 6A20                     push 32
  9923 000045D4 E80CBF                   call prc
  9924 000045D7 83C402                   add  sp, 2
  9925                                  
  9926                                  ;-1079     c=CType [i];
  9927                                  
  9928 000045DA 8B5E04                   mov bx, [bp+4]
  9929 000045DD 8A87A78D                 mov al, [CType + bx]
  9930 000045E1 8846FE                   mov [bp-2], al
  9931                                  
  9932                                  ;-1080     if(c==0)prs("unresolved ");
  9933                                  
  9934 000045E4 8A46FE                   mov al, [bp-2]
  9935 000045E7 3C00                     cmp al, 0
  9936 000045E9 0F850900                 jne .calllisting527
  9937 000045ED 68[3246]                 push calllisting_1
  9938 000045F0 E857BF                   call prs
  9939 000045F3 83C402                   add  sp, 2
  9940                                  
  9941                                  ;-1081     j=CAdr[i];
  9942                                  
  9943                                  .calllisting527:
  9944 000045F6 8B5E04                   mov bx, [bp+4]
  9945 000045F9 D1E3                     shl bx, 1
  9946 000045FB 8B87CF97                 mov ax, [CAdr + bx]
  9947 000045FF 8946FC                   mov [bp-4], ax
  9948                                  
  9949                                  ;-1082     printint51(j);
  9950                                  
  9951 00004602 FF76FC                   push word [bp-4]
  9952 00004605 E8DBC0                   call printint51
  9953 00004608 83C402                   add  sp, 2
  9954                                  
  9955                                  ;-1083     prc(32);
  9956                                  
  9957 0000460B 6A20                     push 32
  9958 0000460D E8D3BE                   call prc
  9959 00004610 83C402                   add  sp, 2
  9960                                  
  9961                                  ;-1084     from_far(NameA, j);
  9962                                  
  9963 00004613 FF76FC                   push word [bp-4]
  9964 00004616 8D06[4100]               lea  ax, [NameA]
  9965 0000461A 50                       push ax
  9966 0000461B E8F00B                   call from_far
  9967 0000461E 83C404                   add  sp, 4
  9968                                  
  9969                                  ;-1085     prs(NameA);
  9970                                  
  9971 00004621 8D06[4100]               lea  ax, [NameA]
  9972 00004625 50                       push ax
  9973 00004626 E821BF                   call prs
  9974 00004629 83C402                   add  sp, 2
  9975                                  
  9976                                  ;-1086 }
  9977                                  
  9978                                  
  9979                                  ;-1087 int countcalls(int f) {
  9980 0000462C C9                       LEAVE
  9981 0000462D C3                       ret
  9982 0000462E 5C6E3B00                calllisting_0 db "\n;",0
  9983 00004632 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
  9984 0000463B 642000             
  9985                                  ENDP
  9986                                  
  9987                                  countcalls: PROC
  9988                                  
  9989                                  ;-1088     unsigned int i;
  9990                                  
  9991                                  
  9992                                  ;-1089     pt=adrF(FNameField, f);
  9993                                  
  9994                                  ;Function : countcalls, Number of local variables: 2
  9995                                  ;   # type sign width addr used name   list of local variables
  9996                                  ;  200 var sign word  1087 NULL f = bp+4
  9997                                  ;  201 var unsg word  1088 NULL i = bp-2;
  9998 0000463E C8020000                 ENTER  2,0
  9999 00004642 FF7604                   push word [bp+4]
 10000 00004645 8D06C7A9                 lea  ax, [FNameField]
 10001 00004649 50                       push ax
 10002 0000464A E8E7C5                   call adrF
 10003 0000464D 83C404                   add  sp, 4
 10004 00004650 A3[6C00]                 mov word [pt], ax
 10005                                  
 10006                                  ;-1090     i=0;
 10007                                  
 10008 00004653 B80000                   mov ax, 0
 10009 00004656 8946FE                   mov [bp-2], ax
 10010                                  
 10011                                  ;-1091     while (i < CTop) {
 10012                                  
 10013                                  .countcalls528:
 10014 00004659 8B46FE                   mov ax, [bp-2]
 10015 0000465C 3B06[3F00]               cmp ax, [CTop]
 10016 00004660 0F8D4A00                 jge .countcalls529
 10017                                  
 10018                                  ;-1092         p1=CAdr[i];
 10019                                  
 10020 00004664 8B5EFE                   mov bx, [bp-2]
 10021 00004667 D1E3                     shl bx, 1
 10022 00004669 8B87CF97                 mov ax, [CAdr + bx]
 10023 0000466D A3[6E00]                 mov word [p1], ax
 10024                                  
 10025                                  ;-1093         from_far(NameA, p1);
 10026                                  
 10027 00004670 FF36[6E00]               push word [p1]
 10028 00004674 8D06[4100]               lea  ax, [NameA]
 10029 00004678 50                       push ax
 10030 00004679 E8920B                   call from_far
 10031 0000467C 83C404                   add  sp, 4
 10032                                  
 10033                                  ;-1094         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10034                                  
 10035 0000467F 8D06[4100]               lea  ax, [NameA]
 10036 00004683 50                       push ax
 10037 00004684 FF36[6C00]               push word [pt]
 10038 00004688 E8F8BB                   call eqstr
 10039 0000468B 83C404                   add  sp, 4
 10040 0000468E 08C0                     or  al, al
 10041 00004690 0F841500                 je .countcalls530
 10042 00004694 8B5E04                   mov bx, [bp+4]
 10043 00004697 D1E3                     shl bx, 1
 10044 00004699 8B876FA7                 mov ax, [FCalls + bx]
 10045 0000469D 83C001                   add ax, 1
 10046 000046A0 8B5E04                   mov bx, [bp+4]
 10047 000046A3 D1E3                     shl bx, 1
 10048 000046A5 89876FA7                 mov [FCalls+bx], ax
 10049                                  
 10050                                  ;-1095         i++;
 10051                                  
 10052                                  .countcalls530:
 10053 000046A9 FF46FE                   inc  word[bp-2]
 10054                                  
 10055                                  ;-1096         }
 10056                                  
 10057                                  
 10058                                  ;-1097 }
 10059                                  
 10060 000046AC EBAB                     jmp .countcalls528
 10061                                  .countcalls529:
 10062                                  
 10063                                  ;-1098 int listfunc() {
 10064 000046AE C9                       LEAVE
 10065 000046AF C3                       ret
 10066                                  ENDP
 10067                                  
 10068                                  listfunc: PROC
 10069                                  
 10070                                  ;-1099     int i;
 10071                                  
 10072                                  
 10073                                  ;-1100     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10074                                  
 10075                                  ;Function : listfunc, Number of local variables: 1
 10076                                  ;   # type sign width addr used name   list of local variables
 10077                                  ;  200 var sign word  1099 NULL i = bp-2;
 10078 000046B0 C8020000                 ENTER  2,0
 10079 000046B4 68[FD46]                 push listfunc_0
 10080 000046B7 E890BE                   call prs
 10081 000046BA 83C402                   add  sp, 2
 10082                                  
 10083                                  ;-1101     i=0;
 10084                                  
 10085 000046BD B80000                   mov ax, 0
 10086 000046C0 8946FE                   mov [bp-2], ax
 10087                                  
 10088                                  ;-1102     while (i < FTop) {
 10089                                  
 10090                                  .listfunc531:
 10091 000046C3 8B46FE                   mov ax, [bp-2]
 10092 000046C6 3B06[3D00]               cmp ax, [FTop]
 10093 000046CA 0F8D0E00                 jge .listfunc532
 10094                                  
 10095                                  ;-1103         countcalls (i);
 10096                                  
 10097 000046CE FF76FE                   push word [bp-2]
 10098 000046D1 E86AFF                   call countcalls
 10099 000046D4 83C402                   add  sp, 2
 10100                                  
 10101                                  ;-1104         i++;
 10102                                  
 10103 000046D7 FF46FE                   inc  word[bp-2]
 10104                                  
 10105                                  ;-1105         }
 10106                                  
 10107                                  
 10108                                  ;-1106     i=0;
 10109                                  
 10110 000046DA EBE7                     jmp .listfunc531
 10111                                  .listfunc532:
 10112 000046DC B80000                   mov ax, 0
 10113 000046DF 8946FE                   mov [bp-2], ax
 10114                                  
 10115                                  ;-1107     while (i < FTop) {
 10116                                  
 10117                                  .listfunc533:
 10118 000046E2 8B46FE                   mov ax, [bp-2]
 10119 000046E5 3B06[3D00]               cmp ax, [FTop]
 10120 000046E9 0F8D0E00                 jge .listfunc534
 10121                                  
 10122                                  ;-1108         funclisting(i);
 10123                                  
 10124 000046ED FF76FE                   push word [bp-2]
 10125 000046F0 E84300                   call funclisting
 10126 000046F3 83C402                   add  sp, 2
 10127                                  
 10128                                  ;-1109         i++;
 10129                                  
 10130 000046F6 FF46FE                   inc  word[bp-2]
 10131                                  
 10132                                  ;-1110         }
 10133                                  
 10134                                  
 10135                                  ;-1111 }
 10136                                  
 10137 000046F9 EBE7                     jmp .listfunc533
 10138                                  .listfunc534:
 10139                                  
 10140                                  ;-1112 int funclisting(int i) {
 10141 000046FB C9                       LEAVE
 10142 000046FC C3                       ret
 10143 000046FD 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10144 00004706 20232043616C6C7320-
 10145 0000470F 4C696E652057696474-
 10146 00004718 6820204E616D652020-
 10147 00004721 206C697374206F6620-
 10148 0000472A 66756E6374696F6E73-
 10149 00004733 5C6E00             
 10150                                  ENDP
 10151                                  
 10152                                  funclisting: PROC
 10153                                  
 10154                                  ;-1113     int j;  char c;
 10155                                  
 10156                                  
 10157                                  ;-1114     prs("\n;");    printint51(i);
 10158                                  
 10159                                  ;Function : funclisting, Number of local variables: 3
 10160                                  ;   # type sign width addr used name   list of local variables
 10161                                  ;  200 var sign word  1112 NULL i = bp+4
 10162                                  ;  201 var sign word  1113 NULL j = bp-2
 10163                                  ;  202 var sign byte  1113 NULL c = bp-4;
 10164 00004736 C8040000                 ENTER  4,0
 10165 0000473A 68[1248]                 push funclisting_0
 10166 0000473D E80ABE                   call prs
 10167 00004740 83C402                   add  sp, 2
 10168 00004743 FF7604                   push word [bp+4]
 10169 00004746 E89ABF                   call printint51
 10170 00004749 83C402                   add  sp, 2
 10171                                  
 10172                                  ;-1115     j = FCalls[i];
 10173                                  
 10174 0000474C 8B5E04                   mov bx, [bp+4]
 10175 0000474F D1E3                     shl bx, 1
 10176 00004751 8B876FA7                 mov ax, [FCalls + bx]
 10177 00004755 8946FE                   mov [bp-2], ax
 10178                                  
 10179                                  ;-1116     if (j) printint51(j);
 10180                                  
 10181 00004758 8B46FE                   mov ax, [bp-2]
 10182 0000475B 08C0                     or  al, al
 10183 0000475D 0F840C00                 je .funclisting535
 10184 00004761 FF76FE                   push word [bp-2]
 10185 00004764 E87CBF                   call printint51
 10186 00004767 83C402                   add  sp, 2
 10187                                  
 10188                                  ;-1117         else prs(" NULL");
 10189                                  
 10190 0000476A E90900                   jmp .funclisting536
 10191                                  .funclisting535:
 10192 0000476D 68[1648]                 push funclisting_1
 10193 00004770 E8D7BD                   call prs
 10194 00004773 83C402                   add  sp, 2
 10195                                  
 10196                                  ;-1118     j = FAdr[i];
 10197                                  
 10198                                  .funclisting536:
 10199 00004776 8B5E04                   mov bx, [bp+4]
 10200 00004779 D1E3                     shl bx, 1
 10201 0000477B 8B877795                 mov ax, [FAdr + bx]
 10202 0000477F 8946FE                   mov [bp-2], ax
 10203                                  
 10204                                  ;-1119     printint51(j);
 10205                                  
 10206 00004782 FF76FE                   push word [bp-2]
 10207 00004785 E85BBF                   call printint51
 10208 00004788 83C402                   add  sp, 2
 10209                                  
 10210                                  ;-1120     prc(32);
 10211                                  
 10212 0000478B 6A20                     push 32
 10213 0000478D E853BD                   call prc
 10214 00004790 83C402                   add  sp, 2
 10215                                  
 10216                                  ;-1121     c=FType[i];
 10217                                  
 10218 00004793 8B5E04                   mov bx, [bp+4]
 10219 00004796 8A877B8C                 mov al, [FType + bx]
 10220 0000479A 8846FC                   mov [bp-4], al
 10221                                  
 10222                                  ;-1122     if(c=='V')prs("void " );
 10223                                  
 10224 0000479D 8A46FC                   mov al, [bp-4]
 10225 000047A0 3C56                     cmp al, 86
 10226 000047A2 0F850900                 jne .funclisting537
 10227 000047A6 68[1C48]                 push funclisting_2
 10228 000047A9 E89EBD                   call prs
 10229 000047AC 83C402                   add  sp, 2
 10230                                  
 10231                                  ;-1123     if(c=='B')prs("byte " );
 10232                                  
 10233                                  .funclisting537:
 10234 000047AF 8A46FC                   mov al, [bp-4]
 10235 000047B2 3C42                     cmp al, 66
 10236 000047B4 0F850900                 jne .funclisting538
 10237 000047B8 68[2248]                 push funclisting_3
 10238 000047BB E88CBD                   call prs
 10239 000047BE 83C402                   add  sp, 2
 10240                                  
 10241                                  ;-1124     if(c=='W')prs("word " );
 10242                                  
 10243                                  .funclisting538:
 10244 000047C1 8A46FC                   mov al, [bp-4]
 10245 000047C4 3C57                     cmp al, 87
 10246 000047C6 0F850900                 jne .funclisting539
 10247 000047CA 68[2848]                 push funclisting_4
 10248 000047CD E87ABD                   call prs
 10249 000047D0 83C402                   add  sp, 2
 10250                                  
 10251                                  ;-1125     if(c=='D')prs("dwrd " );
 10252                                  
 10253                                  .funclisting539:
 10254 000047D3 8A46FC                   mov al, [bp-4]
 10255 000047D6 3C44                     cmp al, 68
 10256 000047D8 0F850900                 jne .funclisting540
 10257 000047DC 68[2E48]                 push funclisting_5
 10258 000047DF E868BD                   call prs
 10259 000047E2 83C402                   add  sp, 2
 10260                                  
 10261                                  ;-1126     prc(32); prc(32);
 10262                                  
 10263                                  .funclisting540:
 10264 000047E5 6A20                     push 32
 10265 000047E7 E8F9BC                   call prc
 10266 000047EA 83C402                   add  sp, 2
 10267 000047ED 6A20                     push 32
 10268 000047EF E8F1BC                   call prc
 10269 000047F2 83C402                   add  sp, 2
 10270                                  
 10271                                  ;-1127     pt=adrF(FNameField, i);
 10272                                  
 10273 000047F5 FF7604                   push word [bp+4]
 10274 000047F8 8D06C7A9                 lea  ax, [FNameField]
 10275 000047FC 50                       push ax
 10276 000047FD E834C4                   call adrF
 10277 00004800 83C404                   add  sp, 4
 10278 00004803 A3[6C00]                 mov word [pt], ax
 10279                                  
 10280                                  ;-1128     prs(pt);
 10281                                  
 10282 00004806 FF36[6C00]               push word [pt]
 10283 0000480A E83DBD                   call prs
 10284 0000480D 83C402                   add  sp, 2
 10285                                  
 10286                                  ;-1129 }
 10287                                  
 10288                                  
 10289                                  ;-1130 
 10290                                  
 10291                                  
 10292                                  ;-1131 int listvar(unsigned int i) {
 10293 00004810 C9                       LEAVE
 10294 00004811 C3                       ret
 10295 00004812 5C6E3B00                funclisting_0 db "\n;",0
 10296 00004816 204E554C4C00            funclisting_1 db " NULL",0
 10297 0000481C 766F69642000            funclisting_2 db "void ",0
 10298 00004822 627974652000            funclisting_3 db "byte ",0
 10299 00004828 776F72642000            funclisting_4 db "word ",0
 10300 0000482E 647772642000            funclisting_5 db "dwrd ",0
 10301                                  ENDP
 10302                                  
 10303                                  listvar: PROC
 10304                                  
 10305                                  ;-1132     unsigned int j; char c;
 10306                                  
 10307                                  
 10308                                  ;-1133     prs("\n;"); printint51(i); prc(32);
 10309                                  
 10310                                  ;Function : listvar, Number of local variables: 3
 10311                                  ;   # type sign width addr used name   list of local variables
 10312                                  ;  200 var unsg word  1131 NULL i = bp+4
 10313                                  ;  201 var unsg word  1132 NULL j = bp-2
 10314                                  ;  202 var sign byte  1132 NULL c = bp-4;
 10315 00004834 C8040000                 ENTER  4,0
 10316 00004838 68[204A]                 push listvar_0
 10317 0000483B E80CBD                   call prs
 10318 0000483E 83C402                   add  sp, 2
 10319 00004841 FF7604                   push word [bp+4]
 10320 00004844 E89CBE                   call printint51
 10321 00004847 83C402                   add  sp, 2
 10322 0000484A 6A20                     push 32
 10323 0000484C E894BC                   call prc
 10324 0000484F 83C402                   add  sp, 2
 10325                                  
 10326                                  ;-1134     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
 10327                                  
 10328 00004852 8B5E04                   mov bx, [bp+4]
 10329 00004855 8A872F6F                 mov al, [GType + bx]
 10330 00004859 8846FC                   mov [bp-4], al
 10331 0000485C 8A46FC                   mov al, [bp-4]
 10332 0000485F 3C56                     cmp al, 86
 10333 00004861 0F850900                 jne .listvar541
 10334 00004865 68[244A]                 push listvar_1
 10335 00004868 E8DFBC                   call prs
 10336 0000486B 83C402                   add  sp, 2
 10337                                  .listvar541:
 10338 0000486E 8A46FC                   mov al, [bp-4]
 10339 00004871 3C2A                     cmp al, 42
 10340 00004873 0F850900                 jne .listvar542
 10341 00004877 68[294A]                 push listvar_2
 10342 0000487A E8CDBC                   call prs
 10343 0000487D 83C402                   add  sp, 2
 10344                                  
 10345                                  ;-1135                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");
 10346                                  
 10347                                  .listvar542:
 10348 00004880 8A46FC                   mov al, [bp-4]
 10349 00004883 3C26                     cmp al, 38
 10350 00004885 0F850900                 jne .listvar543
 10351 00004889 68[2E4A]                 push listvar_3
 10352 0000488C E8BBBC                   call prs
 10353 0000488F 83C402                   add  sp, 2
 10354                                  .listvar543:
 10355 00004892 8A46FC                   mov al, [bp-4]
 10356 00004895 3C23                     cmp al, 35
 10357 00004897 0F850900                 jne .listvar544
 10358 0000489B 68[334A]                 push listvar_4
 10359 0000489E E8A9BC                   call prs
 10360 000048A1 83C402                   add  sp, 2
 10361                                  
 10362                                  ;-1136     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
 10363                                  
 10364                                  .listvar544:
 10365 000048A4 8B5E04                   mov bx, [bp+4]
 10366 000048A7 8A875B70                 mov al, [GSign + bx]
 10367 000048AB 8846FC                   mov [bp-4], al
 10368 000048AE 8A46FC                   mov al, [bp-4]
 10369 000048B1 3C53                     cmp al, 83
 10370 000048B3 0F850900                 jne .listvar545
 10371 000048B7 68[384A]                 push listvar_5
 10372 000048BA E88DBC                   call prs
 10373 000048BD 83C402                   add  sp, 2
 10374                                  .listvar545:
 10375 000048C0 8A46FC                   mov al, [bp-4]
 10376 000048C3 3C55                     cmp al, 85
 10377 000048C5 0F850900                 jne .listvar546
 10378 000048C9 68[3E4A]                 push listvar_6
 10379 000048CC E87BBC                   call prs
 10380 000048CF 83C402                   add  sp, 2
 10381                                  
 10382                                  ;-1137     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
 10383                                  
 10384                                  .listvar546:
 10385 000048D2 8B5E04                   mov bx, [bp+4]
 10386 000048D5 8A878771                 mov al, [GWidth + bx]
 10387 000048D9 8846FC                   mov [bp-4], al
 10388 000048DC 8A46FC                   mov al, [bp-4]
 10389 000048DF 3C01                     cmp al, 1
 10390 000048E1 0F850900                 jne .listvar547
 10391 000048E5 68[444A]                 push listvar_7
 10392 000048E8 E85FBC                   call prs
 10393 000048EB 83C402                   add  sp, 2
 10394                                  .listvar547:
 10395 000048EE 8A46FC                   mov al, [bp-4]
 10396 000048F1 3C02                     cmp al, 2
 10397 000048F3 0F850900                 jne .listvar548
 10398 000048F7 68[4A4A]                 push listvar_8
 10399 000048FA E84DBC                   call prs
 10400 000048FD 83C402                   add  sp, 2
 10401                                  
 10402                                  ;-1138                  if(c==  4)prs("dwrd " );
 10403                                  
 10404                                  .listvar548:
 10405 00004900 8A46FC                   mov al, [bp-4]
 10406 00004903 3C04                     cmp al, 4
 10407 00004905 0F850900                 jne .listvar549
 10408 00004909 68[504A]                 push listvar_9
 10409 0000490C E83BBC                   call prs
 10410 0000490F 83C402                   add  sp, 2
 10411                                  
 10412                                  ;-1139     j=GAdr[i]; printint51(j);
 10413                                  
 10414                                  .listvar549:
 10415 00004912 8B5E04                   mov bx, [bp+4]
 10416 00004915 D1E3                     shl bx, 1
 10417 00004917 8B87B372                 mov ax, [GAdr + bx]
 10418 0000491B 8946FE                   mov [bp-2], ax
 10419 0000491E FF76FE                   push word [bp-2]
 10420 00004921 E8BFBD                   call printint51
 10421 00004924 83C402                   add  sp, 2
 10422                                  
 10423                                  ;-1140     j=GUsed[i];
 10424                                  
 10425 00004927 8B5E04                   mov bx, [bp+4]
 10426 0000492A D1E3                     shl bx, 1
 10427 0000492C 8B870B75                 mov ax, [GUsed + bx]
 10428 00004930 8946FE                   mov [bp-2], ax
 10429                                  
 10430                                  ;-1141     if (j) printint51(j);
 10431                                  
 10432 00004933 8B46FE                   mov ax, [bp-2]
 10433 00004936 08C0                     or  al, al
 10434 00004938 0F840C00                 je .listvar550
 10435 0000493C FF76FE                   push word [bp-2]
 10436 0000493F E8A1BD                   call printint51
 10437 00004942 83C402                   add  sp, 2
 10438                                  
 10439                                  ;-1142     else {
 10440                                  
 10441 00004945 E92200                   jmp .listvar551
 10442                                  .listvar550:
 10443                                  
 10444                                  ;-1143         if(GType[i]=='#') prs("    -");
 10445                                  
 10446 00004948 8B5E04                   mov bx, [bp+4]
 10447 0000494B 8A872F6F                 mov al, [GType + bx]
 10448 0000494F 3C23                     cmp al, 35
 10449 00004951 0F850C00                 jne .listvar552
 10450 00004955 68[564A]                 push listvar_10
 10451 00004958 E8EFBB                   call prs
 10452 0000495B 83C402                   add  sp, 2
 10453                                  
 10454                                  ;-1144         else prs(" NULL");
 10455                                  
 10456 0000495E E90900                   jmp .listvar553
 10457                                  .listvar552:
 10458 00004961 68[5C4A]                 push listvar_11
 10459 00004964 E8E3BB                   call prs
 10460 00004967 83C402                   add  sp, 2
 10461                                  
 10462                                  ;-1145          }
 10463                                  
 10464                                  .listvar553:
 10465                                  
 10466                                  ;-1146     prc(32);
 10467                                  
 10468                                  .listvar551:
 10469 0000496A 6A20                     push 32
 10470 0000496C E874BB                   call prc
 10471 0000496F 83C402                   add  sp, 2
 10472                                  
 10473                                  ;-1147     pt=adrofname(i); prs(pt);
 10474                                  
 10475 00004972 FF7604                   push word [bp+4]
 10476 00004975 E8A8C2                   call adrofname
 10477 00004978 83C402                   add  sp, 2
 10478 0000497B A3[6C00]                 mov word [pt], ax
 10479 0000497E FF36[6C00]               push word [pt]
 10480 00004982 E8C5BB                   call prs
 10481 00004985 83C402                   add  sp, 2
 10482                                  
 10483                                  ;-1148     if(GType[i]=='#') {
 10484                                  
 10485 00004988 8B5E04                   mov bx, [bp+4]
 10486 0000498B 8A872F6F                 mov al, [GType + bx]
 10487 0000498F 3C23                     cmp al, 35
 10488 00004991 0F851D00                 jne .listvar554
 10489                                  
 10490                                  ;-1149         prc('=');
 10491                                  
 10492 00004995 6A3D                     push 61
 10493 00004997 E849BB                   call prc
 10494 0000499A 83C402                   add  sp, 2
 10495                                  
 10496                                  ;-1150         j=GData[i];
 10497                                  
 10498 0000499D 8B5E04                   mov bx, [bp+4]
 10499 000049A0 D1E3                     shl bx, 1
 10500 000049A2 8B876377                 mov ax, [GData + bx]
 10501 000049A6 8946FE                   mov [bp-2], ax
 10502                                  
 10503                                  ;-1151         prunsign1(j);
 10504                                  
 10505 000049A9 FF76FE                   push word [bp-2]
 10506 000049AC E8F0BC                   call prunsign1
 10507 000049AF 83C402                   add  sp, 2
 10508                                  
 10509                                  ;-1152         }
 10510                                  
 10511                                  
 10512                                  ;-1153     if(GType[i]=='&') {
 10513                                  
 10514                                  .listvar554:
 10515 000049B2 8B5E04                   mov bx, [bp+4]
 10516 000049B5 8A872F6F                 mov al, [GType + bx]
 10517 000049B9 3C26                     cmp al, 38
 10518 000049BB 0F852500                 jne .listvar555
 10519                                  
 10520                                  ;-1154         prc('[');
 10521                                  
 10522 000049BF 6A5B                     push 91
 10523 000049C1 E81FBB                   call prc
 10524 000049C4 83C402                   add  sp, 2
 10525                                  
 10526                                  ;-1155         j=GData[i];
 10527                                  
 10528 000049C7 8B5E04                   mov bx, [bp+4]
 10529 000049CA D1E3                     shl bx, 1
 10530 000049CC 8B876377                 mov ax, [GData + bx]
 10531 000049D0 8946FE                   mov [bp-2], ax
 10532                                  
 10533                                  ;-1156         prunsign1(j);
 10534                                  
 10535 000049D3 FF76FE                   push word [bp-2]
 10536 000049D6 E8C6BC                   call prunsign1
 10537 000049D9 83C402                   add  sp, 2
 10538                                  
 10539                                  ;-1157         prc(']');
 10540                                  
 10541 000049DC 6A5D                     push 93
 10542 000049DE E802BB                   call prc
 10543 000049E1 83C402                   add  sp, 2
 10544                                  
 10545                                  ;-1158         }
 10546                                  
 10547                                  
 10548                                  ;-1159     if (i >= LSTART) {
 10549                                  
 10550                                  .listvar555:
 10551 000049E4 8B4604                   mov ax, [bp+4]
 10552 000049E7 3DC800                   cmp ax, 200 ;unsigned : 0
 10553 000049EA 0F823000                 jb  .listvar556
 10554                                  
 10555                                  ;-1160         prs(" = bp");
 10556                                  
 10557 000049EE 68[624A]                 push listvar_12
 10558 000049F1 E856BB                   call prs
 10559 000049F4 83C402                   add  sp, 2
 10560                                  
 10561                                  ;-1161         j=GData[i];
 10562                                  
 10563 000049F7 8B5E04                   mov bx, [bp+4]
 10564 000049FA D1E3                     shl bx, 1
 10565 000049FC 8B876377                 mov ax, [GData + bx]
 10566 00004A00 8946FE                   mov [bp-2], ax
 10567                                  
 10568                                  ;-1162         if (j > 0) prc('+');
 10569                                  
 10570 00004A03 8B46FE                   mov ax, [bp-2]
 10571 00004A06 83F800                   cmp ax, 0
 10572 00004A09 0F8E0800                 jle .listvar557
 10573 00004A0D 6A2B                     push 43
 10574 00004A0F E8D1BA                   call prc
 10575 00004A12 83C402                   add  sp, 2
 10576                                  
 10577                                  ;-1163         pint1(j);
 10578                                  
 10579                                  .listvar557:
 10580 00004A15 FF76FE                   push word [bp-2]
 10581 00004A18 E826BC                   call pint1
 10582 00004A1B 83C402                   add  sp, 2
 10583                                  
 10584                                  ;-1164     }
 10585                                  
 10586                                  
 10587                                  ;-1165 }
 10588                                  
 10589                                  .listvar556:
 10590                                  
 10591                                  ;-1166 
 10592                                  
 10593                                  
 10594                                  ;-1167 unsigned int MAXUI=65535;
 10595 00004A1E C9                       LEAVE
 10596 00004A1F C3                       ret
 10597 00004A20 5C6E3B00                listvar_0 db "\n;",0
 10598 00004A24 7661722000              listvar_1 db "var ",0
 10599 00004A29 7074722000              listvar_2 db "ptr ",0
 10600 00004A2E 6172722000              listvar_3 db "arr ",0
 10601 00004A33 6465662000              listvar_4 db "def ",0
 10602 00004A38 7369676E2000            listvar_5 db "sign ",0
 10603 00004A3E 756E73672000            listvar_6 db "unsg ",0
 10604 00004A44 627974652000            listvar_7 db "byte ",0
 10605 00004A4A 776F72642000            listvar_8 db "word ",0
 10606 00004A50 647772642000            listvar_9 db "dwrd ",0
 10607 00004A56 202020202D00            listvar_10 db "    -",0
 10608 00004A5C 204E554C4C00            listvar_11 db " NULL",0
 10609 00004A62 203D20627000            listvar_12 db " = bp",0
 10610                                  ENDP
 10611 00004A68 FFFF                    MAXUI dw 65535
 10612                                  
 10613                                  ;-1168 int epilog() {
 10614                                  
 10615                                  
 10616                                  epilog: PROC
 10617                                  
 10618                                  ;-1169     unsigned int i;
 10619                                  
 10620                                  
 10621                                  ;-1170     prs("\n \n;   # type sign width  adr used name");
 10622                                  
 10623                                  ;Function : epilog, Number of local variables: 1
 10624                                  ;   # type sign width addr used name   list of local variables
 10625                                  ;  200 var unsg word  1169 NULL i = bp-2;
 10626 00004A6A C8020000                 ENTER  2,0
 10627 00004A6E 68[FB4B]                 push epilog_0
 10628 00004A71 E8D6BA                   call prs
 10629 00004A74 83C402                   add  sp, 2
 10630                                  
 10631                                  ;-1171     prs("   list of global variables\n");
 10632                                  
 10633 00004A77 68[254C]                 push epilog_1
 10634 00004A7A E8CDBA                   call prs
 10635 00004A7D 83C402                   add  sp, 2
 10636                                  
 10637                                  ;-1172     i=1;
 10638                                  
 10639 00004A80 B80100                   mov ax, 1
 10640 00004A83 8946FE                   mov [bp-2], ax
 10641                                  
 10642                                  ;-1173     while (i< GTop) {
 10643                                  
 10644                                  .epilog558:
 10645 00004A86 8B46FE                   mov ax, [bp-2]
 10646 00004A89 3B06[2C00]               cmp ax, [GTop]
 10647 00004A8D 0F8D0E00                 jge .epilog559
 10648                                  
 10649                                  ;-1174         listvar(i);
 10650                                  
 10651 00004A91 FF76FE                   push word [bp-2]
 10652 00004A94 E89DFD                   call listvar
 10653 00004A97 83C402                   add  sp, 2
 10654                                  
 10655                                  ;-1175         i++;
 10656                                  
 10657 00004A9A FF46FE                   inc  word[bp-2]
 10658                                  
 10659                                  ;-1176         }
 10660                                  
 10661                                  
 10662                                  ;-1177     listfunc();
 10663                                  
 10664 00004A9D EBE7                     jmp .epilog558
 10665                                  .epilog559:
 10666 00004A9F E80EFC                   call listfunc
 10667                                  
 10668                                  ;-1178     listcall();
 10669                                  
 10670 00004AA2 E8C1FA                   call listcall
 10671                                  
 10672                                  ;-1179     prs("\n;Input: "); prs(&namein);
 10673                                  
 10674 00004AA5 68[434C]                 push epilog_2
 10675 00004AA8 E89FBA                   call prs
 10676 00004AAB 83C402                   add  sp, 2
 10677 00004AAE 8D06666E                 lea  ax, [namein]
 10678 00004AB2 50                       push ax
 10679 00004AB3 E894BA                   call prs
 10680 00004AB6 83C402                   add  sp, 2
 10681                                  
 10682                                  ;-1180     prs(", List: ");   prs(&namelst);
 10683                                  
 10684 00004AB9 68[4E4C]                 push epilog_3
 10685 00004ABC E88BBA                   call prs
 10686 00004ABF 83C402                   add  sp, 2
 10687 00004AC2 8D06A96E                 lea  ax, [namelst]
 10688 00004AC6 50                       push ax
 10689 00004AC7 E880BA                   call prs
 10690 00004ACA 83C402                   add  sp, 2
 10691                                  
 10692                                  ;-1181     prs(",  Lines:"); printint51(lineno);
 10693                                  
 10694 00004ACD 68[574C]                 push epilog_4
 10695 00004AD0 E877BA                   call prs
 10696 00004AD3 83C402                   add  sp, 2
 10697 00004AD6 FF36[6800]               push word [lineno]
 10698 00004ADA E806BC                   call printint51
 10699 00004ADD 83C402                   add  sp, 2
 10700                                  
 10701                                  ;-1182     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10702                                  
 10703 00004AE0 68[614C]                 push epilog_5
 10704 00004AE3 E864BA                   call prs
 10705 00004AE6 83C402                   add  sp, 2
 10706 00004AE9 FF0E[2C00]               dec  word[GTop]
 10707 00004AED FF36[2C00]               push word [GTop]
 10708 00004AF1 E8EFBB                   call printint51
 10709 00004AF4 83C402                   add  sp, 2
 10710                                  
 10711                                  ;-1183     prs(" max.:"); printint51(LSTART);
 10712                                  
 10713 00004AF7 68[754C]                 push epilog_6
 10714 00004AFA E84DBA                   call prs
 10715 00004AFD 83C402                   add  sp, 2
 10716 00004B00 68C800                   push 200
 10717 00004B03 E8DDBB                   call printint51
 10718 00004B06 83C402                   add  sp, 2
 10719                                  
 10720                                  ;-1184     prs("\n;Functions      :"); printint51(FTop);
 10721                                  
 10722 00004B09 68[7C4C]                 push epilog_7
 10723 00004B0C E83BBA                   call prs
 10724 00004B0F 83C402                   add  sp, 2
 10725 00004B12 FF36[3D00]               push word [FTop]
 10726 00004B16 E8CABB                   call printint51
 10727 00004B19 83C402                   add  sp, 2
 10728                                  
 10729                                  ;-1185     prs(" max.:"); printint51(FUNCMAX);
 10730                                  
 10731 00004B1C 68[904C]                 push epilog_8
 10732 00004B1F E828BA                   call prs
 10733 00004B22 83C402                   add  sp, 2
 10734 00004B25 682C01                   push 300
 10735 00004B28 E8B8BB                   call printint51
 10736 00004B2B 83C402                   add  sp, 2
 10737                                  
 10738                                  ;-1186     prs("\n;Calls          :"); printint51(CTop);
 10739                                  
 10740 00004B2E 68[974C]                 push epilog_9
 10741 00004B31 E816BA                   call prs
 10742 00004B34 83C402                   add  sp, 2
 10743 00004B37 FF36[3F00]               push word [CTop]
 10744 00004B3B E8A5BB                   call printint51
 10745 00004B3E 83C402                   add  sp, 2
 10746                                  
 10747                                  ;-1187     prs(" max.:"); printint51(CALLMAX);
 10748                                  
 10749 00004B41 68[AB4C]                 push epilog_10
 10750 00004B44 E803BA                   call prs
 10751 00004B47 83C402                   add  sp, 2
 10752 00004B4A 68D007                   push 2000
 10753 00004B4D E893BB                   call printint51
 10754 00004B50 83C402                   add  sp, 2
 10755                                  
 10756                                  ;-1188     prs(", NameField:"); printint51(CNameTop);
 10757                                  
 10758 00004B53 68[B24C]                 push epilog_11
 10759 00004B56 E8F1B9                   call prs
 10760 00004B59 83C402                   add  sp, 2
 10761 00004B5C FF36[6200]               push word [CNameTop]
 10762 00004B60 E880BB                   call printint51
 10763 00004B63 83C402                   add  sp, 2
 10764                                  
 10765                                  ;-1189 //    prs(" max.:");
 10766                                  
 10767                                  
 10768                                  ;-1190     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10769                                  
 10770 00004B66 68[BF4C]                 push epilog_12
 10771 00004B69 E8DEB9                   call prs
 10772 00004B6C 83C402                   add  sp, 2
 10773 00004B6F 8D06606D                 lea  ax, [coname]
 10774 00004B73 50                       push ax
 10775 00004B74 E8D3B9                   call prs
 10776 00004B77 83C402                   add  sp, 2
 10777 00004B7A 68[CD4C]                 push epilog_13
 10778 00004B7D E8CAB9                   call prs
 10779 00004B80 83C402                   add  sp, 2
 10780 00004B83 FF36[1400]               push word [maxco]
 10781 00004B87 E859BB                   call printint51
 10782 00004B8A 83C402                   add  sp, 2
 10783                                  
 10784                                  ;-1191     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;
 10785                                  
 10786 00004B8D 68[D14C]                 push epilog_14
 10787 00004B90 E8B7B9                   call prs
 10788 00004B93 83C402                   add  sp, 2
 10789 00004B96 68B80B                   push 3000
 10790 00004B99 E847BB                   call printint51
 10791 00004B9C 83C402                   add  sp, 2
 10792 00004B9F B8B80B                   mov ax, 3000
 10793 00004BA2 8946FE                   mov [bp-2], ax
 10794 00004BA5 8B46FE                   mov ax, [bp-2]
 10795 00004BA8 2B06[1400]               sub ax, [maxco]
 10796 00004BAC 8946FE                   mov [bp-2], ax
 10797                                  
 10798                                  ;-1192     if (i <= 1000)prs(" *** Warning *** constant area too small");
 10799                                  
 10800 00004BAF 8B46FE                   mov ax, [bp-2]
 10801 00004BB2 3DE803                   cmp ax, 1000
 10802 00004BB5 0F870900                 ja  .epilog560
 10803 00004BB9 68[D84C]                 push epilog_15
 10804 00004BBC E88BB9                   call prs
 10805 00004BBF 83C402                   add  sp, 2
 10806                                  
 10807                                  ;-1193     prs(", stacksize: ");
 10808                                  
 10809                                  .epilog560:
 10810 00004BC2 68[014D]                 push epilog_16
 10811 00004BC5 E882B9                   call prs
 10812 00004BC8 83C402                   add  sp, 2
 10813                                  
 10814                                  ;-1194     i=MAXUI-orgData; printint51(i);
 10815                                  
 10816 00004BCB A1[684A]                 mov ax, [MAXUI]
 10817 00004BCE 2B06[1200]               sub ax, [orgData]
 10818 00004BD2 8946FE                   mov [bp-2], ax
 10819 00004BD5 FF76FE                   push word [bp-2]
 10820 00004BD8 E808BB                   call printint51
 10821 00004BDB 83C402                   add  sp, 2
 10822                                  
 10823                                  ;-1195     if (i <= 1000) prs(" *** Warning *** Stack too small");
 10824                                  
 10825 00004BDE 8B46FE                   mov ax, [bp-2]
 10826 00004BE1 3DE803                   cmp ax, 1000
 10827 00004BE4 0F870900                 ja  .epilog561
 10828 00004BE8 68[0F4D]                 push epilog_17
 10829 00004BEB E85CB9                   call prs
 10830 00004BEE 83C402                   add  sp, 2
 10831                                  
 10832                                  ;-1196   end1(0);}
 10833                                  
 10834                                  .epilog561:
 10835 00004BF1 6A00                     push 0
 10836 00004BF3 E8ACF7                   call end1
 10837 00004BF6 83C402                   add  sp, 2
 10838                                  
 10839                                  ;-1197 
 10840                                  
 10841                                  
 10842                                  ;-1198 int checkcalls() {
 10843 00004BF9 C9                       LEAVE
 10844 00004BFA C3                       ret
 10845 00004BFB 5C6E205C6E3B202020-     epilog_0 db "\n \n;   # type sign width  adr used name",0
 10846 00004C04 232074797065207369-
 10847 00004C0D 676E20776964746820-
 10848 00004C16 206164722075736564-
 10849 00004C1F 206E616D6500       
 10850 00004C25 2020206C697374206F-     epilog_1 db "   list of global variables\n",0
 10851 00004C2E 6620676C6F62616C20-
 10852 00004C37 7661726961626C6573-
 10853 00004C40 5C6E00             
 10854 00004C43 5C6E3B496E7075743A-     epilog_2 db "\n;Input: ",0
 10855 00004C4C 2000               
 10856 00004C4E 2C204C6973743A2000      epilog_3 db ", List: ",0
 10857 00004C57 2C20204C696E65733A-     epilog_4 db ",  Lines:",0
 10858 00004C60 00                 
 10859 00004C61 5C6E3B476C6F622E20-     epilog_5 db "\n;Glob. variables:",0
 10860 00004C6A 7661726961626C6573-
 10861 00004C73 3A00               
 10862 00004C75 206D61782E3A00          epilog_6 db " max.:",0
 10863 00004C7C 5C6E3B46756E637469-     epilog_7 db "\n;Functions      :",0
 10864 00004C85 6F6E73202020202020-
 10865 00004C8E 3A00               
 10866 00004C90 206D61782E3A00          epilog_8 db " max.:",0
 10867 00004C97 5C6E3B43616C6C7320-     epilog_9 db "\n;Calls          :",0
 10868 00004CA0 202020202020202020-
 10869 00004CA9 3A00               
 10870 00004CAB 206D61782E3A00          epilog_10 db " max.:",0
 10871 00004CB2 2C204E616D65466965-     epilog_11 db ", NameField:",0
 10872 00004CBB 6C643A00           
 10873 00004CBF 5C6E3B436F6E737420-     epilog_12 db "\n;Const in '",0
 10874 00004CC8 696E202700         
 10875 00004CCD 27203A00                epilog_13 db "' :",0
 10876 00004CD1 206D61782E3A00          epilog_14 db " max.:",0
 10877 00004CD8 202A2A2A205761726E-     epilog_15 db " *** Warning *** constant area too small",0
 10878 00004CE1 696E67202A2A2A2063-
 10879 00004CEA 6F6E7374616E742061-
 10880 00004CF3 72656120746F6F2073-
 10881 00004CFC 6D616C6C00         
 10882 00004D01 2C20737461636B7369-     epilog_16 db ", stacksize: ",0
 10883 00004D0A 7A653A2000         
 10884 00004D0F 202A2A2A205761726E-     epilog_17 db " *** Warning *** Stack too small",0
 10885 00004D18 696E67202A2A2A2053-
 10886 00004D21 7461636B20746F6F20-
 10887 00004D2A 736D616C6C00       
 10888                                  ENDP
 10889                                  
 10890                                  checkcalls: PROC
 10891                                  
 10892                                  ;-1199     int i; int j; int k;
 10893                                  
 10894                                  
 10895                                  ;-1200     prs("\n \n; missing functions: ");
 10896                                  
 10897                                  ;Function : checkcalls, Number of local variables: 3
 10898                                  ;   # type sign width addr used name   list of local variables
 10899                                  ;  200 var sign word  1199 NULL i = bp-2
 10900                                  ;  201 var sign word  1199 NULL j = bp-4
 10901                                  ;  202 var sign word  1199 NULL k = bp-6;
 10902 00004D30 C8060000                 ENTER  6,0
 10903 00004D34 68[164E]                 push checkcalls_0
 10904 00004D37 E810B8                   call prs
 10905 00004D3A 83C402                   add  sp, 2
 10906                                  
 10907                                  ;-1201     i=0;  k=0;
 10908                                  
 10909 00004D3D B80000                   mov ax, 0
 10910 00004D40 8946FE                   mov [bp-2], ax
 10911 00004D43 B80000                   mov ax, 0
 10912 00004D46 8946FA                   mov [bp-6], ax
 10913                                  
 10914                                  ;-1202     while (i < CTop) {
 10915                                  
 10916                                  .checkcalls562:
 10917 00004D49 8B46FE                   mov ax, [bp-2]
 10918 00004D4C 3B06[3F00]               cmp ax, [CTop]
 10919 00004D50 0F8D8F00                 jge .checkcalls563
 10920                                  
 10921                                  ;-1203         pt=CAdr[i];
 10922                                  
 10923 00004D54 8B5EFE                   mov bx, [bp-2]
 10924 00004D57 D1E3                     shl bx, 1
 10925 00004D59 8B87CF97                 mov ax, [CAdr + bx]
 10926 00004D5D A3[6C00]                 mov word [pt], ax
 10927                                  
 10928                                  ;-1204         from_far(NameA, pt);
 10929                                  
 10930 00004D60 FF36[6C00]               push word [pt]
 10931 00004D64 8D06[4100]               lea  ax, [NameA]
 10932 00004D68 50                       push ax
 10933 00004D69 E8A204                   call from_far
 10934 00004D6C 83C404                   add  sp, 4
 10935                                  
 10936                                  ;-1205         j=0;
 10937                                  
 10938 00004D6F B80000                   mov ax, 0
 10939 00004D72 8946FC                   mov [bp-4], ax
 10940                                  
 10941                                  ;-1206         do {
 10942                                  
 10943                                  .checkcalls564:
 10944                                  
 10945                                  ;-1207             p1=adrF(FNameField, j);
 10946                                  
 10947 00004D75 FF76FC                   push word [bp-4]
 10948 00004D78 8D06C7A9                 lea  ax, [FNameField]
 10949 00004D7C 50                       push ax
 10950 00004D7D E8B4BE                   call adrF
 10951 00004D80 83C404                   add  sp, 4
 10952 00004D83 A3[6E00]                 mov word [p1], ax
 10953                                  
 10954                                  ;-1208             if (eqstr(NameA, p1)){
 10955                                  
 10956 00004D86 FF36[6E00]               push word [p1]
 10957 00004D8A 8D06[4100]               lea  ax, [NameA]
 10958 00004D8E 50                       push ax
 10959 00004D8F E8F1B4                   call eqstr
 10960 00004D92 83C404                   add  sp, 4
 10961 00004D95 08C0                     or  al, al
 10962 00004D97 0F841000                 je .checkcalls565
 10963                                  
 10964                                  ;-1209                 CType[i]=1;
 10965                                  
 10966 00004D9B B80100                   mov ax, 1
 10967 00004D9E 8B5EFE                   mov bx, [bp-2]
 10968 00004DA1 8887A78D                 mov [CType+bx], al
 10969                                  
 10970                                  ;-1210                 j=FTop;
 10971                                  
 10972 00004DA5 A1[3D00]                 mov ax, [FTop]
 10973 00004DA8 8946FC                   mov [bp-4], ax
 10974                                  
 10975                                  ;-1211                 }
 10976                                  
 10977                                  
 10978                                  ;-1212             j++;
 10979                                  
 10980                                  .checkcalls565:
 10981 00004DAB FF46FC                   inc  word[bp-4]
 10982                                  
 10983                                  ;-1213             } while (j < FTop);
 10984                                  
 10985 00004DAE 8B46FC                   mov ax, [bp-4]
 10986 00004DB1 3B06[3D00]               cmp ax, [FTop]
 10987 00004DB5 0F8D0200                 jge .checkcalls566
 10988 00004DB9 EBBA                     jmp .checkcalls564
 10989                                  .checkcalls566:
 10990                                  
 10991                                  ;-1214         if (j == FTop) {
 10992                                  
 10993 00004DBB 8B46FC                   mov ax, [bp-4]
 10994 00004DBE 3B06[3D00]               cmp ax, [FTop]
 10995 00004DC2 0F851700                 jne .checkcalls567
 10996                                  
 10997                                  ;-1215             k++; prs("\n; ");
 10998                                  
 10999 00004DC6 FF46FA                   inc  word[bp-6]
 11000 00004DC9 68[314E]                 push checkcalls_1
 11001 00004DCC E87BB7                   call prs
 11002 00004DCF 83C402                   add  sp, 2
 11003                                  
 11004                                  ;-1216             prs(NameA);
 11005                                  
 11006 00004DD2 8D06[4100]               lea  ax, [NameA]
 11007 00004DD6 50                       push ax
 11008 00004DD7 E870B7                   call prs
 11009 00004DDA 83C402                   add  sp, 2
 11010                                  
 11011                                  ;-1217         }
 11012                                  
 11013                                  
 11014                                  ;-1218         i++;
 11015                                  
 11016                                  .checkcalls567:
 11017 00004DDD FF46FE                   inc  word[bp-2]
 11018                                  
 11019                                  ;-1219     }
 11020                                  
 11021                                  
 11022                                  ;-1220     prs("\n; Number of unresolved CALLs :"); printint51(k);
 11023                                  
 11024 00004DE0 E966FF                   jmp .checkcalls562
 11025                                  .checkcalls563:
 11026 00004DE3 68[364E]                 push checkcalls_2
 11027 00004DE6 E861B7                   call prs
 11028 00004DE9 83C402                   add  sp, 2
 11029 00004DEC FF76FA                   push word [bp-6]
 11030 00004DEF E8F1B8                   call printint51
 11031 00004DF2 83C402                   add  sp, 2
 11032                                  
 11033                                  ;-1221     if (k!=0) error1("At least 1 function is missing! ");
 11034                                  
 11035 00004DF5 8B46FA                   mov ax, [bp-6]
 11036 00004DF8 83F800                   cmp ax, 0
 11037 00004DFB 0F840C00                 je  .checkcalls568
 11038 00004DFF 68[574E]                 push checkcalls_3
 11039 00004E02 E8C0F5                   call error1
 11040 00004E05 83C402                   add  sp, 2
 11041                                  
 11042                                  ;-1222     else prs(" All FUNCTIONs in place");
 11043                                  
 11044 00004E08 E90900                   jmp .checkcalls569
 11045                                  .checkcalls568:
 11046 00004E0B 68[784E]                 push checkcalls_4
 11047 00004E0E E839B7                   call prs
 11048 00004E11 83C402                   add  sp, 2
 11049                                  
 11050                                  ;-1223 }
 11051                                  
 11052                                  .checkcalls569:
 11053                                  
 11054                                  ;-1224 
 11055                                  
 11056                                  
 11057                                  ;-1225 int parse() {
 11058 00004E14 C9                       LEAVE
 11059 00004E15 C3                       ret
 11060 00004E16 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
 11061 00004E1F 7373696E672066756E-
 11062 00004E28 6374696F6E733A2000 
 11063 00004E31 5C6E3B2000              checkcalls_1 db "\n; ",0
 11064 00004E36 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
 11065 00004E3F 72206F6620756E7265-
 11066 00004E48 736F6C766564204341-
 11067 00004E51 4C4C73203A00       
 11068 00004E57 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
 11069 00004E60 312066756E6374696F-
 11070 00004E69 6E206973206D697373-
 11071 00004E72 696E67212000       
 11072 00004E78 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
 11073 00004E81 54494F4E7320696E20-
 11074 00004E8A 706C61636500       
 11075                                  ENDP
 11076                                  
 11077                                  parse: PROC
 11078                                  
 11079                                  ;-1226     token=getlex();
 11080                                  
 11081 00004E90 E8B2EC                   call getlex
 11082 00004E93 A3[1E00]                 mov word [token], ax
 11083                                  
 11084                                  ;-1227     do {
 11085                                  
 11086                                  .parse570:
 11087                                  
 11088                                  ;-1228         if (token <= 0) return 1;
 11089                                  
 11090 00004E96 A1[1E00]                 mov ax, [token]
 11091 00004E99 83F800                   cmp ax, 0
 11092 00004E9C 0F8F0600                 jg  .parse571
 11093 00004EA0 B80100                   mov ax, 1
 11094 00004EA3 E96500                   jmp .retnparse
 11095                                  
 11096                                  ;-1229         if (istoken('#')) {
 11097                                  
 11098                                  .parse571:
 11099 00004EA6 6A23                     push 35
 11100 00004EA8 E86AB5                   call istoken
 11101 00004EAB 83C402                   add  sp, 2
 11102 00004EAE 08C0                     or  al, al
 11103 00004EB0 0F843600                 je .parse572
 11104                                  
 11105                                  ;-1230              if (istoken(T_DEFINE))  dodefine();
 11106                                  
 11107 00004EB4 68FF01                   push 511
 11108 00004EB7 E85BB5                   call istoken
 11109 00004EBA 83C402                   add  sp, 2
 11110 00004EBD 08C0                     or  al, al
 11111 00004EBF 0F840600                 je .parse573
 11112 00004EC3 E848E5                   call dodefine
 11113                                  
 11114                                  ;-1231         else if (istoken(T_INCLUDE)) doinclude();
 11115                                  
 11116 00004EC6 E91E00                   jmp .parse574
 11117                                  .parse573:
 11118 00004EC9 68FE01                   push 510
 11119 00004ECC E846B5                   call istoken
 11120 00004ECF 83C402                   add  sp, 2
 11121 00004ED2 08C0                     or  al, al
 11122 00004ED4 0F840600                 je .parse575
 11123 00004ED8 E84DE4                   call doinclude
 11124                                  
 11125                                  ;-1232         else error1("define or include expected");
 11126                                  
 11127 00004EDB E90900                   jmp .parse576
 11128                                  .parse575:
 11129 00004EDE 68[0C4F]                 push parse_0
 11130 00004EE1 E8E1F4                   call error1
 11131 00004EE4 83C402                   add  sp, 2
 11132                                  
 11133                                  ;-1233         }
 11134                                  
 11135                                  .parse576:
 11136                                  .parse574:
 11137                                  
 11138                                  ;-1234     else{
 11139                                  
 11140 00004EE7 E91600                   jmp .parse577
 11141                                  .parse572:
 11142                                  
 11143                                  ;-1235         typeName();
 11144                                  
 11145 00004EEA E889BE                   call typeName
 11146                                  
 11147                                  ;-1236         if (token=='(') dofunc();
 11148                                  
 11149 00004EED A1[1E00]                 mov ax, [token]
 11150 00004EF0 83F828                   cmp ax, 40
 11151 00004EF3 0F850600                 jne .parse578
 11152 00004EF7 E890C1                   call dofunc
 11153                                  
 11154                                  ;-1237         else doglob(); }
 11155                                  
 11156 00004EFA E90300                   jmp .parse579
 11157                                  .parse578:
 11158 00004EFD E83AB8                   call doglob
 11159                                  .parse579:
 11160                                  
 11161                                  ;-1238     } while(1);
 11162                                  
 11163                                  .parse577:
 11164 00004F00 B80100                   mov ax, 1
 11165 00004F03 08C0                     or  al, al
 11166 00004F05 0F840200                 je .parse580
 11167 00004F09 EB8B                     jmp .parse570
 11168                                  .parse580:
 11169                                  
 11170                                  ;-1239 }
 11171                                  
 11172                                  
 11173                                  ;-1240 
 11174                                  
 11175                                  
 11176                                  ;-1241 int getfirstchar() {
 11177                                  
 11178                                   .retnparse:
 11179 00004F0B C3                       ret
 11180 00004F0C 646566696E65206F72-     parse_0 db "define or include expected",0
 11181 00004F15 20696E636C75646520-
 11182 00004F1E 657870656374656400 
 11183                                  ENDP
 11184                                  
 11185                                  getfirstchar: PROC
 11186                                  
 11187                                  ;-1242     fgetsp=&fgetsdest;
 11188                                  
 11189 00004F27 B887BC                   mov ax, fgetsdest
 11190 00004F2A A3[6400]                 mov word [fgetsp], ax
 11191                                  
 11192                                  ;-1243     *fgetsp=0;
 11193                                  
 11194 00004F2D B80000                   mov ax, 0
 11195 00004F30 8B1E[6400]               mov  bx, [fgetsp]
 11196 00004F34 8807                     mov  [bx], al
 11197                                  
 11198                                  ;-1244     thechar=fgets1();
 11199                                  
 11200 00004F36 E81BF3                   call fgets1
 11201 00004F39 A2[2300]                 mov byte [thechar], al
 11202                                  
 11203                                  ;-1245     }
 11204                                  
 11205                                  
 11206                                  ;-1246 
 11207                                  
 11208                                  
 11209                                  ;-1247 char *arglen=0x80; char *argv=0x82;
 11210                                  
 11211 00004F3C C3                       ret
 11212                                  ENDP
 11213 00004F3D 8000                    arglen dw 128
 11214 00004F3F 8200                    argv dw 130
 11215                                  
 11216                                  ;-1248 int getarg() {
 11217                                  
 11218                                  
 11219                                  getarg: PROC
 11220                                  
 11221                                  ;-1249     int arglen1; int i; char *c;
 11222                                  
 11223                                  
 11224                                  ;-1250     arglen1=*arglen;
 11225                                  
 11226                                  ;Function : getarg, Number of local variables: 3
 11227                                  ;   # type sign width addr used name   list of local variables
 11228                                  ;  200 var sign word  1249 NULL arglen1 = bp-2
 11229                                  ;  201 var sign word  1249 NULL i = bp-4
 11230                                  ;  202 ptr sign byte  1249 NULL c = bp-6;
 11231 00004F41 C8060000                 ENTER  6,0
 11232 00004F45 8B1E[3D4F]               mov bx, [arglen]
 11233 00004F49 8A07                     mov al, [bx]
 11234 00004F4B B400                     mov ah, 0
 11235 00004F4D 8946FE                   mov [bp-2], ax
 11236                                  
 11237                                  ;-1251     if (arglen1 == 0) {
 11238                                  
 11239 00004F50 8B46FE                   mov ax, [bp-2]
 11240 00004F53 83F800                   cmp ax, 0
 11241 00004F56 0F851C00                 jne .getarg581
 11242                                  
 11243                                  ;-1252         cputs(Version1);
 11244                                  
 11245 00004F5A 8D06[0300]               lea  ax, [Version1]
 11246 00004F5E 50                       push ax
 11247 00004F5F E835B1                   call cputs
 11248 00004F62 83C402                   add  sp, 2
 11249                                  
 11250                                  ;-1253         cputs(" Usage: A.COM in_file[.C]: ");
 11251                                  
 11252 00004F65 68[A450]                 push getarg_0
 11253 00004F68 E82CB1                   call cputs
 11254 00004F6B 83C402                   add  sp, 2
 11255                                  
 11256                                  ;-1254         exitR(3);
 11257                                  
 11258 00004F6E 6A03                     push 3
 11259 00004F70 E896B1                   call exitR
 11260 00004F73 83C402                   add  sp, 2
 11261                                  
 11262                                  ;-1255         }
 11263                                  
 11264                                  
 11265                                  ;-1256     i=arglen1+129;
 11266                                  
 11267                                  .getarg581:
 11268 00004F76 8B46FE                   mov ax, [bp-2]
 11269 00004F79 058100                   add ax, 129
 11270 00004F7C 8946FC                   mov [bp-4], ax
 11271                                  
 11272                                  ;-1257     *i=0;
 11273                                  
 11274 00004F7F B80000                   mov ax, 0
 11275 00004F82 8B5EFC                   mov  bx, [bp-4]
 11276 00004F85 8907                     mov  [bx], ax
 11277                                  
 11278                                  ;-1258     arglen1--;
 11279                                  
 11280 00004F87 FF4EFE                   dec  word[bp-2]
 11281                                  
 11282                                  ;-1259     toupper(argv);
 11283                                  
 11284 00004F8A FF36[3F4F]               push word [argv]
 11285 00004F8E E863B3                   call toupper
 11286 00004F91 83C402                   add  sp, 2
 11287                                  
 11288                                  ;-1260     strcpy(namein, argv);
 11289                                  
 11290 00004F94 FF36[3F4F]               push word [argv]
 11291 00004F98 8D06666E                 lea  ax, [namein]
 11292 00004F9C 50                       push ax
 11293 00004F9D E8ADB2                   call strcpy
 11294 00004FA0 83C404                   add  sp, 4
 11295                                  
 11296                                  ;-1261     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
 11297                                  
 11298 00004FA3 6A2E                     push 46
 11299 00004FA5 8D06666E                 lea  ax, [namein]
 11300 00004FA9 50                       push ax
 11301 00004FAA E88AB3                   call instr1
 11302 00004FAD 83C404                   add  sp, 4
 11303 00004FB0 83F800                   cmp ax, 0
 11304 00004FB3 0F850E00                 jne .getarg582
 11305 00004FB7 68[C050]                 push getarg_1
 11306 00004FBA 8D06666E                 lea  ax, [namein]
 11307 00004FBE 50                       push ax
 11308 00004FBF E80DB3                   call strcat1
 11309 00004FC2 83C404                   add  sp, 4
 11310                                  
 11311                                  ;-1262     strcpy(namelst, namein);
 11312                                  
 11313                                  .getarg582:
 11314 00004FC5 8D06666E                 lea  ax, [namein]
 11315 00004FC9 50                       push ax
 11316 00004FCA 8D06A96E                 lea  ax, [namelst]
 11317 00004FCE 50                       push ax
 11318 00004FCF E87BB2                   call strcpy
 11319 00004FD2 83C404                   add  sp, 4
 11320                                  
 11321                                  ;-1263     i=strlen(namelst);
 11322                                  
 11323 00004FD5 8D06A96E                 lea  ax, [namelst]
 11324 00004FD9 50                       push ax
 11325 00004FDA E848B2                   call strlen
 11326 00004FDD 83C402                   add  sp, 2
 11327 00004FE0 8946FC                   mov [bp-4], ax
 11328                                  
 11329                                  ;-1264     i--;
 11330                                  
 11331 00004FE3 FF4EFC                   dec  word[bp-4]
 11332                                  
 11333                                  ;-1265     c=&namelst+i;
 11334                                  
 11335 00004FE6 B8A96E                   mov ax, namelst
 11336 00004FE9 0346FC                   add ax, [bp-4]
 11337 00004FEC 8946FA                   mov [bp-6], ax
 11338                                  
 11339                                  ;-1266     *c='S';
 11340                                  
 11341 00004FEF B85300                   mov ax, 83
 11342 00004FF2 8B5EFA                   mov  bx, [bp-6]
 11343 00004FF5 8807                     mov  [bx], al
 11344                                  
 11345                                  ;-1267 
 11346                                  
 11347                                  
 11348                                  ;-1268     fdin=openR (namein);
 11349                                  
 11350 00004FF7 8D06666E                 lea  ax, [namein]
 11351 00004FFB 50                       push ax
 11352 00004FFC E8DAB0                   call openR
 11353 00004FFF 83C402                   add  sp, 2
 11354 00005002 A3[1A00]                 mov word [fdin], ax
 11355                                  
 11356                                  ;-1269     if(DOS_ERR){
 11357                                  
 11358 00005005 A1[7000]                 mov ax, [DOS_ERR]
 11359 00005008 08C0                     or  al, al
 11360 0000500A 0F841C00                 je .getarg583
 11361                                  
 11362                                  ;-1270         cputs("Source file missing (.C): ");
 11363                                  
 11364 0000500E 68[C350]                 push getarg_2
 11365 00005011 E883B0                   call cputs
 11366 00005014 83C402                   add  sp, 2
 11367                                  
 11368                                  ;-1271         cputs(namein);
 11369                                  
 11370 00005017 8D06666E                 lea  ax, [namein]
 11371 0000501B 50                       push ax
 11372 0000501C E878B0                   call cputs
 11373 0000501F 83C402                   add  sp, 2
 11374                                  
 11375                                  ;-1272         exitR(1);
 11376                                  
 11377 00005022 6A01                     push 1
 11378 00005024 E8E2B0                   call exitR
 11379 00005027 83C402                   add  sp, 2
 11380                                  
 11381                                  ;-1273         }
 11382                                  
 11383                                  
 11384                                  ;-1274     fdout=creatR(namelst);
 11385                                  
 11386                                  .getarg583:
 11387 0000502A 8D06A96E                 lea  ax, [namelst]
 11388 0000502E 50                       push ax
 11389 0000502F E8B6B0                   call creatR
 11390 00005032 83C402                   add  sp, 2
 11391 00005035 A3[1C00]                 mov word [fdout], ax
 11392                                  
 11393                                  ;-1275     if(DOS_ERR){
 11394                                  
 11395 00005038 A1[7000]                 mov ax, [DOS_ERR]
 11396 0000503B 08C0                     or  al, al
 11397 0000503D 0F841C00                 je .getarg584
 11398                                  
 11399                                  ;-1276         cputs("list file not creatable: ");
 11400                                  
 11401 00005041 68[DE50]                 push getarg_3
 11402 00005044 E850B0                   call cputs
 11403 00005047 83C402                   add  sp, 2
 11404                                  
 11405                                  ;-1277         cputs(namelst);
 11406                                  
 11407 0000504A 8D06A96E                 lea  ax, [namelst]
 11408 0000504E 50                       push ax
 11409 0000504F E845B0                   call cputs
 11410 00005052 83C402                   add  sp, 2
 11411                                  
 11412                                  ;-1278         exitR(2);
 11413                                  
 11414 00005055 6A02                     push 2
 11415 00005057 E8AFB0                   call exitR
 11416 0000505A 83C402                   add  sp, 2
 11417                                  
 11418                                  ;-1279         }
 11419                                  
 11420                                  
 11421                                  ;-1280     prs("\n; ");
 11422                                  
 11423                                  .getarg584:
 11424 0000505D 68[F850]                 push getarg_4
 11425 00005060 E8E7B4                   call prs
 11426 00005063 83C402                   add  sp, 2
 11427                                  
 11428                                  ;-1281     prs(Version1);
 11429                                  
 11430 00005066 8D06[0300]               lea  ax, [Version1]
 11431 0000506A 50                       push ax
 11432 0000506B E8DCB4                   call prs
 11433 0000506E 83C402                   add  sp, 2
 11434                                  
 11435                                  ;-1282     prs(", Source: "); prs(namein);
 11436                                  
 11437 00005071 68[FD50]                 push getarg_5
 11438 00005074 E8D3B4                   call prs
 11439 00005077 83C402                   add  sp, 2
 11440 0000507A 8D06666E                 lea  ax, [namein]
 11441 0000507E 50                       push ax
 11442 0000507F E8C8B4                   call prs
 11443 00005082 83C402                   add  sp, 2
 11444                                  
 11445                                  ;-1283     prs(", Output asm: "); prs(namelst);
 11446                                  
 11447 00005085 68[0851]                 push getarg_6
 11448 00005088 E8BFB4                   call prs
 11449 0000508B 83C402                   add  sp, 2
 11450 0000508E 8D06A96E                 lea  ax, [namelst]
 11451 00005092 50                       push ax
 11452 00005093 E8B4B4                   call prs
 11453 00005096 83C402                   add  sp, 2
 11454                                  
 11455                                  ;-1284     prs("\norg  256 \njmp main");
 11456                                  
 11457 00005099 68[1751]                 push getarg_7
 11458 0000509C E8ABB4                   call prs
 11459 0000509F 83C402                   add  sp, 2
 11460                                  
 11461                                  ;-1285 }
 11462                                  
 11463                                  
 11464                                  ;-1286 
 11465                                  
 11466                                  
 11467                                  ;-1287 int setblock(unsigned int i) {
 11468 000050A2 C9                       LEAVE
 11469 000050A3 C3                       ret
 11470 000050A4 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
 11471 000050AD 2E434F4D20696E5F66-
 11472 000050B6 696C655B2E435D3A20-
 11473 000050BF 00                 
 11474 000050C0 2E4300                  getarg_1 db ".C",0
 11475 000050C3 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
 11476 000050CC 6C65206D697373696E-
 11477 000050D5 6720282E43293A2000 
 11478 000050DE 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
 11479 000050E7 206E6F742063726561-
 11480 000050F0 7461626C653A2000   
 11481 000050F8 5C6E3B2000              getarg_4 db "\n; ",0
 11482 000050FD 2C20536F757263653A-     getarg_5 db ", Source: ",0
 11483 00005106 2000               
 11484 00005108 2C204F757470757420-     getarg_6 db ", Output asm: ",0
 11485 00005111 61736D3A2000       
 11486 00005117 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
 11487 00005120 36205C6E6A6D70206D-
 11488 00005129 61696E00           
 11489                                  ENDP
 11490                                  
 11491                                  setblock: PROC
 11492                                  
 11493                                  ;-1288     DOS_ERR=0;
 11494                                  
 11495                                  ;Function : setblock, Number of local variables: 1
 11496                                  ;   # type sign width addr used name   list of local variables
 11497                                  ;  200 var unsg word  1287 NULL i = bp+4;
 11498 0000512D C8000000                 ENTER  0,0
 11499 00005131 B80000                   mov ax, 0
 11500 00005134 A3[7000]                 mov word [DOS_ERR], ax
 11501                                  
 11502                                  ;-1289     bx=i;
 11503                                  
 11504 00005137 8B5E04                   mov  bx, [bp+4]
 11505                                  
 11506                                  ;-1290     ax=cs;
 11507                                  
 11508 0000513A 8CC8                     mov  ax, cs
 11509                                  
 11510                                  ;-1291     es=ax;
 11511                                  
 11512 0000513C 8EC0                     mov  es, ax
 11513                                  
 11514                                  ;-1292     ax=0x4A00;
 11515                                  
 11516 0000513E B8004A                   mov  ax, 18944
 11517                                  
 11518                                  ;-1293     DosInt();
 11519                                  
 11520 00005141 E88CAF                   call DosInt
 11521                                  
 11522                                  ;-1294 }
 11523                                  
 11524                                  
 11525                                  ;-1295 int main() {
 11526 00005144 C9                       LEAVE
 11527 00005145 C3                       ret
 11528                                  ENDP
 11529                                  
 11530                                  main: PROC
 11531                                  
 11532                                  ;-1296     getarg();
 11533                                  
 11534 00005146 E8F8FD                   call getarg
 11535                                  
 11536                                  ;-1297 setblock(4096);
 11537                                  
 11538 00005149 680010                   push 4096
 11539 0000514C E8DEFF                   call setblock
 11540 0000514F 83C402                   add  sp, 2
 11541                                  
 11542                                  ;-1298 if (DOS_ERR) error1("SetBlock , AX=");
 11543                                  
 11544 00005152 A1[7000]                 mov ax, [DOS_ERR]
 11545 00005155 08C0                     or  al, al
 11546 00005157 0F840900                 je .main585
 11547 0000515B 68[A151]                 push main_0
 11548 0000515E E864F2                   call error1
 11549 00005161 83C402                   add  sp, 2
 11550                                  
 11551                                  ;-1299 segE=allocmem(4096);
 11552                                  
 11553                                  .main585:
 11554 00005164 680010                   push 4096
 11555 00005167 E85800                   call allocmem
 11556 0000516A 83C402                   add  sp, 2
 11557 0000516D A3[6600]                 mov word [segE], ax
 11558                                  
 11559                                  ;-1300 if (DOS_ERR)  error1("alloc memory, AX=");
 11560                                  
 11561 00005170 A1[7000]                 mov ax, [DOS_ERR]
 11562 00005173 08C0                     or  al, al
 11563 00005175 0F840900                 je .main586
 11564 00005179 68[B051]                 push main_1
 11565 0000517C E846F2                   call error1
 11566 0000517F 83C402                   add  sp, 2
 11567                                  
 11568                                  ;-1301     CNameTop=0;
 11569                                  
 11570                                  .main586:
 11571 00005182 B80000                   mov ax, 0
 11572 00005185 A3[6200]                 mov word [CNameTop], ax
 11573                                  
 11574                                  ;-1302     coname=0;
 11575                                  
 11576 00005188 B80000                   mov ax, 0
 11577 0000518B A2606D                   mov byte [coname], al
 11578                                  
 11579                                  ;-1303     orgData=ORGDATAORIG;
 11580                                  
 11581 0000518E A1[1000]                 mov ax, [ORGDATAORIG]
 11582 00005191 A3[1200]                 mov word [orgData], ax
 11583                                  
 11584                                  ;-1304     getfirstchar();
 11585                                  
 11586 00005194 E890FD                   call getfirstchar
 11587                                  
 11588                                  ;-1305     parse();
 11589                                  
 11590 00005197 E8F6FC                   call parse
 11591                                  
 11592                                  ;-1306   checkcalls();
 11593                                  
 11594 0000519A E893FB                   call checkcalls
 11595                                  
 11596                                  ;-1307   epilog();
 11597                                  
 11598 0000519D E8CAF8                   call epilog
 11599                                  
 11600                                  ;-1308 }
 11601                                  
 11602                                  
 11603                                  ;-1309 
 11604                                  
 11605                                  
 11606                                  ;-1310 
 11607                                  
 11608                                  
 11609                                  ;-1311 
 11610                                  
 11611                                  
 11612                                  ;-1312 int allocmem(unsigned int i) {
 11613                                  
 11614 000051A0 C3                       ret
 11615 000051A1 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
 11616 000051AA 2C2041583D00       
 11617 000051B0 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
 11618 000051B9 6F72792C2041583D00 
 11619                                  ENDP
 11620                                  
 11621                                  allocmem: PROC
 11622                                  
 11623                                  ;-1313     unsigned int vAX; unsigned int vBX;
 11624                                  
 11625                                  
 11626                                  ;-1314     DOS_ERR=0;
 11627                                  
 11628                                  ;Function : allocmem, Number of local variables: 3
 11629                                  ;   # type sign width addr used name   list of local variables
 11630                                  ;  200 var unsg word  1312 NULL i = bp+4
 11631                                  ;  201 var unsg word  1313 NULL vAX = bp-2
 11632                                  ;  202 var unsg word  1313 NULL vBX = bp-4;
 11633 000051C2 C8040000                 ENTER  4,0
 11634 000051C6 B80000                   mov ax, 0
 11635 000051C9 A3[7000]                 mov word [DOS_ERR], ax
 11636                                  
 11637                                  ;-1315     bx=i;
 11638                                  
 11639 000051CC 8B5E04                   mov  bx, [bp+4]
 11640                                  
 11641                                  ;-1316     ax=0x4800;
 11642                                  
 11643 000051CF B80048                   mov  ax, 18432
 11644                                  
 11645                                  ;-1317     DosInt();
 11646                                  
 11647 000051D2 E8FBAE                   call DosInt
 11648                                  
 11649                                  ;-1318     asm mov [bp-2], ax; _ vAX=ax;
 11650                                  
 11651 000051D5 8946FE                   mov [bp-2], ax; _ vAX=ax;
 11652                                  
 11653                                  ;-1319     asm mov [bp-4], bx; _ vBX=bx;
 11654                                  
 11655 000051D8 895EFC                   mov [bp-4], bx; _ vBX=bx;
 11656                                  
 11657                                  ;-1320     if(DOS_ERR) return vBX;
 11658                                  
 11659 000051DB A1[7000]                 mov ax, [DOS_ERR]
 11660 000051DE 08C0                     or  al, al
 11661 000051E0 0F840600                 je .allocmem587
 11662 000051E4 8B46FC                   mov ax, [bp-4]
 11663 000051E7 E90600                   jmp .retnallocmem
 11664                                  
 11665                                  ;-1321     return vAX;
 11666                                  
 11667                                  .allocmem587:
 11668 000051EA 8B46FE                   mov ax, [bp-2]
 11669 000051ED E90000                   jmp .retnallocmem
 11670                                  
 11671                                  ;-1322 }
 11672                                  
 11673                                  
 11674                                  ;-1323 int to_far(char *dest, char *src) {
 11675                                  
 11676 000051F0 C9                       .retnallocmem: LEAVE
 11677 000051F1 C3                       ret
 11678                                  ENDP
 11679                                  
 11680                                  to_far: PROC
 11681                                  
 11682                                  ;-1324   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di
 11683                                  
 11684                                  ;Function : to_far, Number of local variables: 2
 11685                                  ;   # type sign width addr used name   list of local variables
 11686                                  ;  200 ptr sign byte  1323 NULL dest = bp+4
 11687                                  ;  201 ptr sign byte  1323 NULL src = bp+6;
 11688 000051F2 C8000000                 ENTER  0,0
 11689 000051F6 A1[6600]                 mov ax, [segE]
 11690 000051F9 8EC0                     mov  es, ax
 11691 000051FB 8B7606                   mov  si, [bp+6]
 11692 000051FE 8B7E04                   mov  di, [bp+4]
 11693                                  
 11694                                  ;-1325   asm cld
 11695                                  
 11696 00005201 FC                       cld
 11697                                  
 11698                                  ;-1326   do{
 11699                                  
 11700                                  .to_far588:
 11701                                  
 11702                                  ;-1327   asm lodsb  ; inc si
 11703                                  
 11704 00005202 AC                       lodsb  ; inc si
 11705                                  
 11706                                  ;-1328   asm stosb  ; inc di
 11707                                  
 11708 00005203 AA                       stosb  ; inc di
 11709                                  
 11710                                  ;-1329   } while (al != 0);
 11711                                  
 11712 00005204 3C00                     cmp  al, 0
 11713 00005206 0F840200                 je  .to_far589
 11714 0000520A EBF6                     jmp .to_far588
 11715                                  .to_far589:
 11716                                  
 11717                                  ;-1330 }
 11718                                  
 11719                                  
 11720                                  ;-1331 int from_far(char *dest, char *src) {
 11721 0000520C C9                       LEAVE
 11722 0000520D C3                       ret
 11723                                  ENDP
 11724                                  
 11725                                  from_far: PROC
 11726                                  
 11727                                  ;-1332   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di
 11728                                  
 11729                                  ;Function : from_far, Number of local variables: 2
 11730                                  ;   # type sign width addr used name   list of local variables
 11731                                  ;  200 ptr sign byte  1331 NULL dest = bp+4
 11732                                  ;  201 ptr sign byte  1331 NULL src = bp+6;
 11733 0000520E C8000000                 ENTER  0,0
 11734 00005212 A1[6600]                 mov ax, [segE]
 11735 00005215 8EC0                     mov  es, ax
 11736 00005217 8B7606                   mov  si, [bp+6]
 11737 0000521A 8B7E04                   mov  di, [bp+4]
 11738                                  
 11739                                  ;-1333   do{
 11740                                  
 11741                                  .from_far590:
 11742                                  
 11743                                  ;-1334   asm mov al, [es:si]
 11744                                  
 11745 0000521D 268A04                   mov al, [es:si]
 11746                                  
 11747                                  ;-1335   asm inc si
 11748                                  
 11749 00005220 46                       inc si
 11750                                  
 11751                                  ;-1336   asm mov [di], al
 11752                                  
 11753 00005221 8805                     mov [di], al
 11754                                  
 11755                                  ;-1337   asm inc di
 11756                                  
 11757 00005223 47                       inc di
 11758                                  
 11759                                  ;-1338   } while (al != 0);
 11760                                  
 11761 00005224 3C00                     cmp  al, 0
 11762 00005226 0F840200                 je  .from_far591
 11763 0000522A EBF1                     jmp .from_far590
 11764                                  .from_far591:
 11765                                  
 11766                                  ;-1339 }
 11767 0000522C C9                       LEAVE
 11768 0000522D C3                       ret
 11769                                  ENDP
 11770                                   
 11771                                  ; missing functions: 
 11772                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 11773                                   
 11774                                  ;   # type sign width  adr used name   list of global variables
 11775                                  
 11776                                  ;    1 arr sign byte     1    2 Version1[12]
 11777                                  ;    2 def unsg byte     2    - LSTART=200
 11778                                  ;    3 def unsg byte     3    - VARMAX=300
 11779                                  ;    4 def unsg byte     4    - GNAMEMAX=4800
 11780                                  ;    5 def unsg byte     5    - FUNCMAX=300
 11781                                  ;    6 def unsg byte     6    - FNAMEMAX=4800
 11782                                  ;    7 def unsg byte     7    - CALLMAX=2000
 11783                                  ;    8 def unsg byte     8    - IDLENMAX=15
 11784                                  ;    9 def unsg byte     9    - COLUMNMAX=128
 11785                                  ;   10 def unsg byte    11    - T_NAME=256
 11786                                  ;   11 def unsg byte    12    - T_CONST=257
 11787                                  ;   12 def unsg byte    13    - T_STRING=258
 11788                                  ;   13 def unsg byte    14    - T_INCLUDE=510
 11789                                  ;   14 def unsg byte    15    - T_DEFINE=511
 11790                                  ;   15 def unsg byte    16    - T_RETURN=512
 11791                                  ;   16 def unsg byte    17    - T_IF=513
 11792                                  ;   17 def unsg byte    18    - T_ELSE=514
 11793                                  ;   18 def unsg byte    19    - T_WHILE=515
 11794                                  ;   19 def unsg byte    20    - T_DO=516
 11795                                  ;   20 def unsg byte    21    - T_INT=517
 11796                                  ;   21 def unsg byte    22    - T_ASM=518
 11797                                  ;   22 def unsg byte    23    - T_ASMBLOCK=519
 11798                                  ;   23 def unsg byte    24    - T_EMIT=520
 11799                                  ;   24 def unsg byte    25    - T_GOTO=521
 11800                                  ;   25 def unsg byte    26    - T_VOID=529
 11801                                  ;   26 def unsg byte    27    - T_CHAR=530
 11802                                  ;   27 def unsg byte    28    - T_SIGNED=531
 11803                                  ;   28 def unsg byte    29    - T_UNSIGNED=532
 11804                                  ;   29 def unsg byte    30    - T_LONG=533
 11805                                  ;   30 def unsg byte    31    - T_EQ=806
 11806                                  ;   31 def unsg byte    32    - T_NE=807
 11807                                  ;   32 def unsg byte    33    - T_GE=811
 11808                                  ;   33 def unsg byte    34    - T_LE=824
 11809                                  ;   34 def unsg byte    35    - T_PLUSPLUS=1219
 11810                                  ;   35 def unsg byte    36    - T_MINUSMINUS=1225
 11811                                  ;   36 def unsg byte    37    - T_PLUSASS=1230
 11812                                  ;   37 def unsg byte    38    - T_MINUSASS=1231
 11813                                  ;   38 def unsg byte    39    - T_MULASS=1232
 11814                                  ;   39 def unsg byte    40    - T_DIVASS=1233
 11815                                  ;   40 def unsg byte    41    - T_ANDASS=1234
 11816                                  ;   41 def unsg byte    42    - T_ORASS=1235
 11817                                  ;   42 def unsg byte    43    - T_LESSLESS=1240
 11818                                  ;   43 def unsg byte    44    - T_GREATGREAT=1241
 11819                                  ;   44 var unsg word    46    2 ORGDATAORIG
 11820                                  ;   45 var unsg word    47   10 orgData
 11821                                  ;   46 def unsg byte    48    - COMAX=3000
 11822                                  ;   47 arr sign byte    49    4 co[3000]
 11823                                  ;   48 var sign word    50    4 maxco
 11824                                  ;   49 var sign word    51    3 maxco1
 11825                                  ;   50 def unsg byte    52    - CMDLENMAX=67
 11826                                  ;   51 arr sign byte    53    3 coname[67]
 11827                                  ;   52 arr sign byte    54  103 symbol[128]
 11828                                  ;   53 arr sign byte    55   12 fname[67]
 11829                                  ;   54 arr sign byte    56    9 namein[67]
 11830                                  ;   55 arr sign byte    57    7 namelst[67]
 11831                                  ;   56 arr sign byte    58    2 archivename[67]
 11832                                  ;   57 ptr sign byte    59    5 cloc
 11833                                  ;   58 var sign word    60    6 fdin
 11834                                  ;   59 var sign word    61    4 fdout
 11835                                  ;   60 var sign word    62   41 token
 11836                                  ;   61 var sign byte    63    1 globC
 11837                                  ;   62 var sign word    64    3 column
 11838                                  ;   63 var sign byte    65   28 thechar
 11839                                  ;   64 var sign word    66    9 iscmp
 11840                                  ;   65 var sign word    67    4 nconst
 11841                                  ;   66 var sign word    68    3 nreturn
 11842                                  ;   67 var sign word    69   12 nlabel
 11843                                  ;   68 var sign word    70   24 GTop
 11844                                  ;   69 var sign word    71   20 LTop
 11845                                  ;   70 var unsg word    72   44 lexval
 11846                                  ;   71 var sign word    73    6 typei
 11847                                  ;   72 var sign byte    73    8 istype
 11848                                  ;   73 var sign word    74    6 signi
 11849                                  ;   74 var sign byte    74    5 issign
 11850                                  ;   75 var sign word    75    9 widthi
 11851                                  ;   76 var sign byte    75   19 iswidth
 11852                                  ;   77 arr sign byte    76   11 GType[300]
 11853                                  ;   78 arr sign byte    77    5 GSign[300]
 11854                                  ;   79 arr sign byte    78    5 GWidth[300]
 11855                                  ;   80 arr sign word    79    4 GAdr[300]
 11856                                  ;   81 arr sign word    80    6 GUsed[300]
 11857                                  ;   82 arr sign word    81   11 GData[300]
 11858                                  ;   83 arr sign byte    82    2 GNameField[4800]
 11859                                  ;   84 var sign word    83   26 wi
 11860                                  ;   85 var sign word    84   13 FTop
 11861                                  ;   86 var sign word    85    8 CTop
 11862                                  ;   87 arr sign byte    86    2 FType[300]
 11863                                  ;   88 arr sign byte    87    3 CType[2000]
 11864                                  ;   89 arr sign word    88    2 FAdr[300]
 11865                                  ;   90 arr sign word    89    4 CAdr[2000]
 11866                                  ;   91 arr sign word    90    4 FCalls[300]
 11867                                  ;   92 arr sign byte    91    5 FNameField[4800]
 11868                                  ;   93 arr sign byte    92    7 NameA[32]
 11869                                  ;   94 arr sign byte    93    5 fgetsdest[128]
 11870                                  ;   95 ptr unsg byte    94    8 CNameTop
 11871                                  ;   96 ptr unsg byte    95   10 fgetsp
 11872                                  ;   97 var unsg word    96    3 segE
 11873                                  ;   98 var unsg word    97   12 lineno
 11874                                  ;   99 var unsg word    98    2 linenoinclude
 11875                                  ;  100 ptr unsg byte    99   17 pt
 11876                                  ;  101 ptr unsg byte   100    8 p1
 11877                                  ;  102 var sign word   101    9 DOS_ERR
 11878                                  ;  103 var sign word   102    3 DOS_NoBytes
 11879                                  ;  104 var sign byte   103    3 DOS_ByteRead
 11880                                  ;  105 arr sign byte   318    2 doglobName[15]
 11881                                  ;  106 var sign word   488    5 mod1
 11882                                  ;  107 var sign word   488   12 ireg1
 11883                                  ;  108 var sign word   488    6 idx1
 11884                                  ;  109 var sign word   488    1 ids1
 11885                                  ;  110 var sign word   488    4 idw1
 11886                                  ;  111 var sign word   488    2 idt1
 11887                                  ;  112 var sign word   488 NULL val1
 11888                                  ;  113 var sign word   489    2 mod2
 11889                                  ;  114 var sign word   489    6 ireg2
 11890                                  ;  115 var sign word   489    6 idx2
 11891                                  ;  116 var sign word   489    1 ids2
 11892                                  ;  117 var sign word   489    4 idw2
 11893                                  ;  118 var sign word   489    2 idt2
 11894                                  ;  119 var sign word   489    2 val2
 11895                                  ;  120 arr sign byte   558    9 ops[5]
 11896                                  ;  121 arr sign byte   600    3 printregstr[74]
 11897                                  ;  122 var sign word   608    1 evalue
 11898                                  ;  123 var sign word   608    1 exprtype
 11899                                  ;  124 arr sign word   762    2 docalltype[10]
 11900                                  ;  125 arr sign word   762    2 docallvalue[10]
 11901                                  ;  126 arr sign byte   763    2 procname[17]
 11902                                  ;  127 arr sign byte   904    2 symboltemp[80]
 11903                                  ;  128 var unsg word  1167    1 MAXUI
 11904                                  ;  129 ptr sign byte  1247    1 arglen
 11905                                  ;  130 ptr sign byte  1247    2 argv
 11906                                  
 11907                                  
 11908                                  ;   # Calls Line Width  Name   list of functions
 11909                                  
 11910                                  ;    0    4  106   writetty
 11911                                  ;    1    1  107   putch
 11912                                  ;    2    6  108   cputs
 11913                                  ;    3    3  109   mkneg
 11914                                  ;    4    8  111   DosInt
 11915                                  ;    5    2  116   openR
 11916                                  ;    6    1  117   creatR
 11917                                  ;    7    2  118   fcloseR
 11918                                  ;    8    4  119   exitR
 11919                                  ;    9    1  120   readRL
 11920                                  ;   10    1  122   fputcR
 11921                                  ;   11    1  125   letter
 11922                                  ;   12    3  135   digit
 11923                                  ;   13    3  140   alnum
 11924                                  ;   14    8  146   strlen
 11925                                  ;   15   23  151   strcpy
 11926                                  ;   16   74  157   eqstr
 11927                                  ;   17    1  165   strcat1
 11928                                  ;   18    1  169   toupper
 11929                                  ;   19    2  175   instr1
 11930                                  ;   20    4  184   a
 11931                                  ;   21   21  186   v
 11932                                  ;   22    4  191   checknamelen
 11933                                  ;   23   32  197   next
 11934                                  ;   24   78  204   istoken
 11935                                  ;   25   36  211   expect
 11936                                  ;   26    6  222   eprc
 11937                                  ;   27    5  226   eprs
 11938                                  ;   28   40  234   prc
 11939                                  ;   29    3  243   prscomment
 11940                                  ;   30    7  251   prnl
 11941                                  ;   31  241  255   prs
 11942                                  ;   32    2  274   eprnum
 11943                                  ;   33    7  288   pint1
 11944                                  ;   34   33  299   prunsign1
 11945                                  ;   35   20  309   printint51
 11946                                  ;   36    1  319   doglob
 11947                                  ;   37   12  369   gettypes
 11948                                  ;   38    9  378   adrofname
 11949                                  ;   39    7  379   adrF
 11950                                  ;   40    4  381   printName
 11951                                  ;   41   12  385   searchname
 11952                                  ;   42    3  389   checkName
 11953                                  ;   43   10  394   typeName
 11954                                  ;   44    3  410   name1
 11955                                  ;   45    1  415   storecall
 11956                                  ;   46    1  421   storefunc
 11957                                  ;   47    2  425   addlocal
 11958                                  ;   48    1  431   checkFunction
 11959                                  ;   49    1  435   dofunc
 11960                                  ;   50    1  478   isvariable
 11961                                  ;   51    3  491   pexpr
 11962                                  ;   52    1  498   constantexpr
 11963                                  ;   53    3  508   exprstart
 11964                                  ;   54    1  510   expr2
 11965                                  ;   55    3  559   doreg1
 11966                                  ;   56    6  578   checkreg
 11967                                  ;   57    6  603   printreg
 11968                                  ;   58    2  609   expr
 11969                                  ;   59    4  658   compoundass
 11970                                  ;   60    2  665   dovar1
 11971                                  ;   61    8  686   rterm
 11972                                  ;   62    1  699   isreg
 11973                                  ;   63   15  717   doreg
 11974                                  ;   64    1  723   doassign
 11975                                  ;   65    1  741   domul
 11976                                  ;   66    2  747   doidiv
 11977                                  ;   67    1  760   domod
 11978                                  ;   68    1  764   docall1
 11979                                  ;   69    1  807   doinclude
 11980                                  ;   70    1  818   dodefine
 11981                                  ;   71    6  834   stmt
 11982                                  ;   72    1  866   doemit
 11983                                  ;   73    3  870   cmpneg
 11984                                  ;   74    7  883   prlabel
 11985                                  ;   75    3  884   prjump
 11986                                  ;   76    1  885   doif
 11987                                  ;   77    1  891   dodo
 11988                                  ;   78    1  895   dowhile
 11989                                  ;   79    4  898   isrelational
 11990                                  ;   80   17  905   getlex
 11991                                  ;   81    1  957   convertdefine
 11992                                  ;   82    1  964   getdigit
 11993                                  ;   83    1  973   getstring
 11994                                  ;   84    2  977   fgets1
 11995                                  ;   85    1  991   printinputline
 11996                                  ;   86    1 1013   ifEOL
 11997                                  ;   87    2 1024   end1
 11998                                  ;   88   51 1029   error1
 11999                                  ;   89    2 1049   listproc
 12000                                  ;   90    1 1065   listcall
 12001                                  ;   91    1 1074   calllisting
 12002                                  ;   92    1 1087   countcalls
 12003                                  ;   93    1 1098   listfunc
 12004                                  ;   94    1 1112   funclisting
 12005                                  ;   95    2 1131   listvar
 12006                                  ;   96    1 1168   epilog
 12007                                  ;   97    1 1198   checkcalls
 12008                                  ;   98    2 1225   parse
 12009                                  ;   99    2 1241   getfirstchar
 12010                                  ;  100    1 1248   getarg
 12011                                  ;  101    1 1287   setblock
 12012                                  ;  102 NULL 1295   main
 12013                                  ;  103    1 1312   allocmem
 12014                                  ;  104    1 1323   to_far
 12015                                  ;  105    3 1331   from_far
 12016                                  
 12017                                  ;    #  addr name   list of CALLs
 12018                                  
 12019                                  ;    0     0 writetty
 12020                                  ;    1     9 writetty
 12021                                  ;    2    18 putch
 12022                                  ;    3    24 DosInt
 12023                                  ;    4    31 DosInt
 12024                                  ;    5    38 DosInt
 12025                                  ;    6    45 DosInt
 12026                                  ;    7    52 DosInt
 12027                                  ;    8    59 DosInt
 12028                                  ;    9    66 digit
 12029                                  ;   10    72 letter
 12030                                  ;   11    79 strcpy
 12031                                  ;   12    86 printName
 12032                                  ;   13    96 prc
 12033                                  ;   14   100 printName
 12034                                  ;   15   110 prc
 12035                                  ;   16   114 strlen
 12036                                  ;   17   121 error1
 12037                                  ;   18   128 fgets1
 12038                                  ;   19   135 getlex
 12039                                  ;   20   142 istoken
 12040                                  ;   21   150 prs
 12041                                  ;   22   154 listproc
 12042                                  ;   23   163 prs
 12043                                  ;   24   167 pint1
 12044                                  ;   25   173 error1
 12045                                  ;   26   180 eprc
 12046                                  ;   27   185 writetty
 12047                                  ;   28   194 writetty
 12048                                  ;   29   203 fputcR
 12049                                  ;   30   210 prc
 12050                                  ;   31   214 prs
 12051                                  ;   32   218 prc
 12052                                  ;   33   222 eprc
 12053                                  ;   34   227 mkneg
 12054                                  ;   35   233 eprnum
 12055                                  ;   36   240 eprc
 12056                                  ;   37   245 prc
 12057                                  ;   38   249 mkneg
 12058                                  ;   39   255 pint1
 12059                                  ;   40   261 prc
 12060                                  ;   41   265 prunsign1
 12061                                  ;   42   275 prc
 12062                                  ;   43   279 prc
 12063                                  ;   44   283 prc
 12064                                  ;   45   287 prc
 12065                                  ;   46   291 prc
 12066                                  ;   47   295 prunsign1
 12067                                  ;   48   305 error1
 12068                                  ;   49   312 error1
 12069                                  ;   50   319 checknamelen
 12070                                  ;   51   332 checkName
 12071                                  ;   52   342 error1
 12072                                  ;   53   349 istoken
 12073                                  ;   54   357 istoken
 12074                                  ;   55   365 prs
 12075                                  ;   56   369 prunsign1
 12076                                  ;   57   379 prs
 12077                                  ;   58   383 prs
 12078                                  ;   59   387 prs
 12079                                  ;   60   391 prs
 12080                                  ;   61   395 prs
 12081                                  ;   62   399 prunsign1
 12082                                  ;   63   409 prs
 12083                                  ;   64   413 expect
 12084                                  ;   65   420 expect
 12085                                  ;   66   427 error1
 12086                                  ;   67   434 prs
 12087                                  ;   68   438 prs
 12088                                  ;   69   442 prs
 12089                                  ;   70   446 strcpy
 12090                                  ;   71   453 expect
 12091                                  ;   72   460 istoken
 12092                                  ;   73   468 prc
 12093                                  ;   74   472 prscomment
 12094                                  ;   75   483 prc
 12095                                  ;   76   487 prs
 12096                                  ;   77   491 strlen
 12097                                  ;   78   498 istoken
 12098                                  ;   79   506 prc
 12099                                  ;   80   510 expect
 12100                                  ;   81   517 prunsign1
 12101                                  ;   82   527 istoken
 12102                                  ;   83   535 expect
 12103                                  ;   84   542 error1
 12104                                  ;   85   549 prs
 12105                                  ;   86   553 prs
 12106                                  ;   87   557 prs
 12107                                  ;   88   561 prs
 12108                                  ;   89   565 prs
 12109                                  ;   90   569 prs
 12110                                  ;   91   573 istoken
 12111                                  ;   92   581 prc
 12112                                  ;   93   585 istoken
 12113                                  ;   94   593 expect
 12114                                  ;   95   600 prunsign1
 12115                                  ;   96   610 prunsign1
 12116                                  ;   97   620 adrofname
 12117                                  ;   98   630 strcpy
 12118                                  ;   99   637 strcpy
 12119                                  ;  100   644 expect
 12120                                  ;  101   651 adrF
 12121                                  ;  102   656 adrofname
 12122                                  ;  103   666 prs
 12123                                  ;  104   670 prs
 12124                                  ;  105   674 prc
 12125                                  ;  106   678 pint1
 12126                                  ;  107   684 prc
 12127                                  ;  108   688 checkName
 12128                                  ;  109   698 error1
 12129                                  ;  110   705 adrofname
 12130                                  ;  111   715 eqstr
 12131                                  ;  112   721 adrofname
 12132                                  ;  113   731 eqstr
 12133                                  ;  114   737 istoken
 12134                                  ;  115   745 istoken
 12135                                  ;  116   753 istoken
 12136                                  ;  117   761 istoken
 12137                                  ;  118   769 istoken
 12138                                  ;  119   777 istoken
 12139                                  ;  120   785 istoken
 12140                                  ;  121   793 istoken
 12141                                  ;  122   801 name1
 12142                                  ;  123   807 error1
 12143                                  ;  124   814 getlex
 12144                                  ;  125   821 error1
 12145                                  ;  126   828 error1
 12146                                  ;  127   835 strlen
 12147                                  ;  128   842 to_far
 12148                                  ;  129   849 error1
 12149                                  ;  130   856 adrF
 12150                                  ;  131   861 strcpy
 12151                                  ;  132   868 error1
 12152                                  ;  133   875 checkName
 12153                                  ;  134   885 error1
 12154                                  ;  135   892 adrF
 12155                                  ;  136   897 strcpy
 12156                                  ;  137   904 adrF
 12157                                  ;  138   909 eqstr
 12158                                  ;  139   915 checknamelen
 12159                                  ;  140   928 strcpy
 12160                                  ;  141   935 checkFunction
 12161                                  ;  142   949 error1
 12162                                  ;  143   956 storefunc
 12163                                  ;  144   966 prs
 12164                                  ;  145   970 prs
 12165                                  ;  146   974 prs
 12166                                  ;  147   978 expect
 12167                                  ;  148   985 istoken
 12168                                  ;  149   993 typeName
 12169                                  ;  150  1002 addlocal
 12170                                  ;  151  1011 istoken
 12171                                  ;  152  1019 expect
 12172                                  ;  153  1026 expect
 12173                                  ;  154  1033 isvariable
 12174                                  ;  155  1044 typeName
 12175                                  ;  156  1053 checknamelen
 12176                                  ;  157  1066 addlocal
 12177                                  ;  158  1075 istoken
 12178                                  ;  159  1083 expect
 12179                                  ;  160  1090 expect
 12180                                  ;  161  1097 istoken
 12181                                  ;  162  1105 expect
 12182                                  ;  163  1112 listproc
 12183                                  ;  164  1121 prs
 12184                                  ;  165  1125 mkneg
 12185                                  ;  166  1131 prunsign1
 12186                                  ;  167  1141 prs
 12187                                  ;  168  1145 istoken
 12188                                  ;  169  1153 stmt
 12189                                  ;  170  1158 prs
 12190                                  ;  171  1162 prs
 12191                                  ;  172  1166 prc
 12192                                  ;  173  1170 prs
 12193                                  ;  174  1174 prs
 12194                                  ;  175  1178 prs
 12195                                  ;  176  1182 strlen
 12196                                  ;  177  1189 strcpy
 12197                                  ;  178  1196 prs
 12198                                  ;  179  1200 expect
 12199                                  ;  180  1207 eqstr
 12200                                  ;  181  1213 constantexpr
 12201                                  ;  182  1226 checkreg
 12202                                  ;  183  1235 doreg1
 12203                                  ;  184  1242 exprstart
 12204                                  ;  185  1252 prs
 12205                                  ;  186  1256 prs
 12206                                  ;  187  1260 expect
 12207                                  ;  188  1267 getlex
 12208                                  ;  189  1274 typeName
 12209                                  ;  190  1283 searchname
 12210                                  ;  191  1294 gettypes
 12211                                  ;  192  1303 isrelational
 12212                                  ;  193  1316 error1
 12213                                  ;  194  1323 expect
 12214                                  ;  195  1330 prs
 12215                                  ;  196  1334 prs
 12216                                  ;  197  1338 gettypes
 12217                                  ;  198  1347 prs
 12218                                  ;  199  1351 prs
 12219                                  ;  200  1355 v
 12220                                  ;  201  1357 prs
 12221                                  ;  202  1361 prunsign1
 12222                                  ;  203  1371 cmpneg
 12223                                  ;  204  1378 prs
 12224                                  ;  205  1382 expect
 12225                                  ;  206  1389 eqstr
 12226                                  ;  207  1395 expr2
 12227                                  ;  208  1401 expr
 12228                                  ;  209  1406 getlex
 12229                                  ;  210  1413 typeName
 12230                                  ;  211  1422 error1
 12231                                  ;  212  1429 checkreg
 12232                                  ;  213  1438 doreg1
 12233                                  ;  214  1445 searchname
 12234                                  ;  215  1456 gettypes
 12235                                  ;  216  1465 error1
 12236                                  ;  217  1472 isrelational
 12237                                  ;  218  1485 error1
 12238                                  ;  219  1492 istoken
 12239                                  ;  220  1500 error1
 12240                                  ;  221  1507 istoken
 12241                                  ;  222  1515 prs
 12242                                  ;  223  1519 prs
 12243                                  ;  224  1523 prs
 12244                                  ;  225  1527 prs
 12245                                  ;  226  1531 prs
 12246                                  ;  227  1535 v
 12247                                  ;  228  1537 prs
 12248                                  ;  229  1541 prunsign1
 12249                                  ;  230  1551 adrofname
 12250                                  ;  231  1561 prs
 12251                                  ;  232  1565 prs
 12252                                  ;  233  1569 typeName
 12253                                  ;  234  1578 checkreg
 12254                                  ;  235  1587 prs
 12255                                  ;  236  1591 printreg
 12256                                  ;  237  1600 v
 12257                                  ;  238  1602 prs
 12258                                  ;  239  1606 printreg
 12259                                  ;  240  1615 error1
 12260                                  ;  241  1622 searchname
 12261                                  ;  242  1633 gettypes
 12262                                  ;  243  1642 error1
 12263                                  ;  244  1649 prs
 12264                                  ;  245  1653 printreg
 12265                                  ;  246  1662 error1
 12266                                  ;  247  1669 prs
 12267                                  ;  248  1673 a
 12268                                  ;  249  1675 prs
 12269                                  ;  250  1679 prs
 12270                                  ;  251  1683 prs
 12271                                  ;  252  1687 v
 12272                                  ;  253  1689 adrofname
 12273                                  ;  254  1699 prs
 12274                                  ;  255  1703 prs
 12275                                  ;  256  1707 error1
 12276                                  ;  257  1714 istoken
 12277                                  ;  258  1722 strcpy
 12278                                  ;  259  1729 istoken
 12279                                  ;  260  1737 strcpy
 12280                                  ;  261  1744 istoken
 12281                                  ;  262  1752 strcpy
 12282                                  ;  263  1759 istoken
 12283                                  ;  264  1767 strcpy
 12284                                  ;  265  1774 istoken
 12285                                  ;  266  1782 strcpy
 12286                                  ;  267  1789 istoken
 12287                                  ;  268  1797 strcpy
 12288                                  ;  269  1804 istoken
 12289                                  ;  270  1812 strcpy
 12290                                  ;  271  1819 getlex
 12291                                  ;  272  1826 isrelational
 12292                                  ;  273  1839 error1
 12293                                  ;  274  1846 strcpy
 12294                                  ;  275  1853 prnl
 12295                                  ;  276  1858 prs
 12296                                  ;  277  1862 prs
 12297                                  ;  278  1866 printreg
 12298                                  ;  279  1875 prs
 12299                                  ;  280  1879 istoken
 12300                                  ;  281  1887 prunsign1
 12301                                  ;  282  1897 typeName
 12302                                  ;  283  1906 checkreg
 12303                                  ;  284  1915 printreg
 12304                                  ;  285  1924 searchname
 12305                                  ;  286  1935 a
 12306                                  ;  287  1937 v
 12307                                  ;  288  1939 cmpneg
 12308                                  ;  289  1946 prs
 12309                                  ;  290  1950 expect
 12310                                  ;  291  1957 strlen
 12311                                  ;  292  1964 eqstr
 12312                                  ;  293  1970 eqstr
 12313                                  ;  294  1976 eqstr
 12314                                  ;  295  1982 eqstr
 12315                                  ;  296  1988 eqstr
 12316                                  ;  297  1994 eqstr
 12317                                  ;  298  2000 eqstr
 12318                                  ;  299  2006 eqstr
 12319                                  ;  300  2012 eqstr
 12320                                  ;  301  2018 eqstr
 12321                                  ;  302  2024 eqstr
 12322                                  ;  303  2030 eqstr
 12323                                  ;  304  2036 eqstr
 12324                                  ;  305  2042 eqstr
 12325                                  ;  306  2048 eqstr
 12326                                  ;  307  2054 eqstr
 12327                                  ;  308  2060 eqstr
 12328                                  ;  309  2066 eqstr
 12329                                  ;  310  2072 eqstr
 12330                                  ;  311  2078 eqstr
 12331                                  ;  312  2084 eqstr
 12332                                  ;  313  2090 eqstr
 12333                                  ;  314  2096 strlen
 12334                                  ;  315  2103 eqstr
 12335                                  ;  316  2109 eqstr
 12336                                  ;  317  2115 eqstr
 12337                                  ;  318  2121 eqstr
 12338                                  ;  319  2127 eqstr
 12339                                  ;  320  2133 eqstr
 12340                                  ;  321  2139 eqstr
 12341                                  ;  322  2145 eqstr
 12342                                  ;  323  2151 eqstr
 12343                                  ;  324  2157 prc
 12344                                  ;  325  2161 prc
 12345                                  ;  326  2165 prc
 12346                                  ;  327  2169 istoken
 12347                                  ;  328  2177 prs
 12348                                  ;  329  2181 prunsign1
 12349                                  ;  330  2191 typeName
 12350                                  ;  331  2200 checkreg
 12351                                  ;  332  2209 doreg1
 12352                                  ;  333  2216 docall1
 12353                                  ;  334  2224 isreg
 12354                                  ;  335  2230 searchname
 12355                                  ;  336  2241 gettypes
 12356                                  ;  337  2250 istoken
 12357                                  ;  338  2258 istoken
 12358                                  ;  339  2266 expect
 12359                                  ;  340  2273 searchname
 12360                                  ;  341  2284 expect
 12361                                  ;  342  2291 expect
 12362                                  ;  343  2298 gettypes
 12363                                  ;  344  2307 error1
 12364                                  ;  345  2314 istoken
 12365                                  ;  346  2322 error1
 12366                                  ;  347  2329 prs
 12367                                  ;  348  2333 prs
 12368                                  ;  349  2337 prs
 12369                                  ;  350  2341 v
 12370                                  ;  351  2343 istoken
 12371                                  ;  352  2351 error1
 12372                                  ;  353  2358 prs
 12373                                  ;  354  2362 prs
 12374                                  ;  355  2366 prs
 12375                                  ;  356  2370 v
 12376                                  ;  357  2372 istoken
 12377                                  ;  358  2380 compoundass
 12378                                  ;  359  2392 istoken
 12379                                  ;  360  2400 compoundass
 12380                                  ;  361  2412 istoken
 12381                                  ;  362  2420 compoundass
 12382                                  ;  363  2432 istoken
 12383                                  ;  364  2440 compoundass
 12384                                  ;  365  2452 istoken
 12385                                  ;  366  2460 error1
 12386                                  ;  367  2467 istoken
 12387                                  ;  368  2475 error1
 12388                                  ;  369  2482 istoken
 12389                                  ;  370  2490 expr
 12390                                  ;  371  2495 doassign
 12391                                  ;  372  2504 dovar1
 12392                                  ;  373  2511 istoken
 12393                                  ;  374  2519 rterm
 12394                                  ;  375  2525 istoken
 12395                                  ;  376  2533 rterm
 12396                                  ;  377  2539 istoken
 12397                                  ;  378  2547 rterm
 12398                                  ;  379  2553 istoken
 12399                                  ;  380  2561 rterm
 12400                                  ;  381  2567 istoken
 12401                                  ;  382  2575 rterm
 12402                                  ;  383  2581 istoken
 12403                                  ;  384  2589 rterm
 12404                                  ;  385  2595 istoken
 12405                                  ;  386  2603 domul
 12406                                  ;  387  2609 istoken
 12407                                  ;  388  2617 doidiv
 12408                                  ;  389  2624 istoken
 12409                                  ;  390  2632 domod
 12410                                  ;  391  2638 isrelational
 12411                                  ;  392  2651 rterm
 12412                                  ;  393  2657 cmpneg
 12413                                  ;  394  2664 error1
 12414                                  ;  395  2671 prnl
 12415                                  ;  396  2676 prs
 12416                                  ;  397  2680 prs
 12417                                  ;  398  2684 gettypes
 12418                                  ;  399  2693 prs
 12419                                  ;  400  2697 prs
 12420                                  ;  401  2701 v
 12421                                  ;  402  2703 prs
 12422                                  ;  403  2707 expect
 12423                                  ;  404  2714 prunsign1
 12424                                  ;  405  2724 gettypes
 12425                                  ;  406  2733 prs
 12426                                  ;  407  2737 v
 12427                                  ;  408  2739 prnl
 12428                                  ;  409  2744 prs
 12429                                  ;  410  2748 prs
 12430                                  ;  411  2752 prs
 12431                                  ;  412  2756 prnl
 12432                                  ;  413  2761 prs
 12433                                  ;  414  2765 prs
 12434                                  ;  415  2769 a
 12435                                  ;  416  2771 prs
 12436                                  ;  417  2775 v
 12437                                  ;  418  2777 prs
 12438                                  ;  419  2781 prs
 12439                                  ;  420  2785 prs
 12440                                  ;  421  2789 prs
 12441                                  ;  422  2793 prs
 12442                                  ;  423  2797 prc
 12443                                  ;  424  2801 printName
 12444                                  ;  425  2811 prs
 12445                                  ;  426  2815 prnl
 12446                                  ;  427  2820 prs
 12447                                  ;  428  2824 prs
 12448                                  ;  429  2828 prs
 12449                                  ;  430  2832 prs
 12450                                  ;  431  2836 v
 12451                                  ;  432  2838 istoken
 12452                                  ;  433  2846 prnl
 12453                                  ;  434  2851 prs
 12454                                  ;  435  2855 prs
 12455                                  ;  436  2859 prs
 12456                                  ;  437  2863 prs
 12457                                  ;  438  2867 prunsign1
 12458                                  ;  439  2877 typeName
 12459                                  ;  440  2886 searchname
 12460                                  ;  441  2897 istoken
 12461                                  ;  442  2905 searchname
 12462                                  ;  443  2916 expect
 12463                                  ;  444  2923 expect
 12464                                  ;  445  2930 gettypes
 12465                                  ;  446  2939 error1
 12466                                  ;  447  2946 eqstr
 12467                                  ;  448  2952 dovar1
 12468                                  ;  449  2959 eqstr
 12469                                  ;  450  2965 doreg
 12470                                  ;  451  2971 eqstr
 12471                                  ;  452  2977 doreg
 12472                                  ;  453  2983 eqstr
 12473                                  ;  454  2989 doreg
 12474                                  ;  455  2995 eqstr
 12475                                  ;  456  3001 doreg
 12476                                  ;  457  3007 eqstr
 12477                                  ;  458  3013 doreg
 12478                                  ;  459  3019 eqstr
 12479                                  ;  460  3025 doreg
 12480                                  ;  461  3031 eqstr
 12481                                  ;  462  3037 doreg
 12482                                  ;  463  3043 eqstr
 12483                                  ;  464  3049 doreg
 12484                                  ;  465  3055 eqstr
 12485                                  ;  466  3061 doreg
 12486                                  ;  467  3067 eqstr
 12487                                  ;  468  3073 doreg
 12488                                  ;  469  3079 eqstr
 12489                                  ;  470  3085 doreg
 12490                                  ;  471  3091 eqstr
 12491                                  ;  472  3097 doreg
 12492                                  ;  473  3103 eqstr
 12493                                  ;  474  3109 doreg
 12494                                  ;  475  3115 eqstr
 12495                                  ;  476  3121 doreg
 12496                                  ;  477  3127 eqstr
 12497                                  ;  478  3133 doreg
 12498                                  ;  479  3139 expect
 12499                                  ;  480  3146 prs
 12500                                  ;  481  3150 prs
 12501                                  ;  482  3154 prs
 12502                                  ;  483  3158 istoken
 12503                                  ;  484  3166 prunsign1
 12504                                  ;  485  3176 istoken
 12505                                  ;  486  3184 searchname
 12506                                  ;  487  3195 v
 12507                                  ;  488  3197 error1
 12508                                  ;  489  3204 gettypes
 12509                                  ;  490  3213 prs
 12510                                  ;  491  3217 v
 12511                                  ;  492  3219 prs
 12512                                  ;  493  3223 prs
 12513                                  ;  494  3227 prs
 12514                                  ;  495  3231 a
 12515                                  ;  496  3233 prs
 12516                                  ;  497  3237 prs
 12517                                  ;  498  3241 prunsign1
 12518                                  ;  499  3251 v
 12519                                  ;  500  3253 prs
 12520                                  ;  501  3257 prs
 12521                                  ;  502  3261 printName
 12522                                  ;  503  3271 prs
 12523                                  ;  504  3275 prs
 12524                                  ;  505  3279 prs
 12525                                  ;  506  3283 prs
 12526                                  ;  507  3287 v
 12527                                  ;  508  3289 prs
 12528                                  ;  509  3293 prs
 12529                                  ;  510  3297 prs
 12530                                  ;  511  3301 v
 12531                                  ;  512  3303 prs
 12532                                  ;  513  3307 prs
 12533                                  ;  514  3311 prs
 12534                                  ;  515  3315 v
 12535                                  ;  516  3317 prs
 12536                                  ;  517  3321 rterm
 12537                                  ;  518  3327 istoken
 12538                                  ;  519  3335 prs
 12539                                  ;  520  3339 prunsign1
 12540                                  ;  521  3349 prs
 12541                                  ;  522  3353 error1
 12542                                  ;  523  3360 istoken
 12543                                  ;  524  3368 prs
 12544                                  ;  525  3372 prunsign1
 12545                                  ;  526  3382 prs
 12546                                  ;  527  3386 prs
 12547                                  ;  528  3390 typeName
 12548                                  ;  529  3399 searchname
 12549                                  ;  530  3410 error1
 12550                                  ;  531  3417 gettypes
 12551                                  ;  532  3426 error1
 12552                                  ;  533  3433 error1
 12553                                  ;  534  3440 prs
 12554                                  ;  535  3444 v
 12555                                  ;  536  3446 prs
 12556                                  ;  537  3450 prs
 12557                                  ;  538  3454 doidiv
 12558                                  ;  539  3461 prs
 12559                                  ;  540  3465 checknamelen
 12560                                  ;  541  3478 strcpy
 12561                                  ;  542  3485 storecall
 12562                                  ;  543  3495 expect
 12563                                  ;  544  3502 istoken
 12564                                  ;  545  3510 error1
 12565                                  ;  546  3517 istoken
 12566                                  ;  547  3525 istoken
 12567                                  ;  548  3533 eprs
 12568                                  ;  549  3538 eprs
 12569                                  ;  550  3543 eprc
 12570                                  ;  551  3548 eprnum
 12571                                  ;  552  3555 eprs
 12572                                  ;  553  3560 eprc
 12573                                  ;  554  3565 eprs
 12574                                  ;  555  3570 eprc
 12575                                  ;  556  3575 eprs
 12576                                  ;  557  3580 istoken
 12577                                  ;  558  3588 name1
 12578                                  ;  559  3594 searchname
 12579                                  ;  560  3605 istoken
 12580                                  ;  561  3613 checkreg
 12581                                  ;  562  3622 searchname
 12582                                  ;  563  3633 error1
 12583                                  ;  564  3640 istoken
 12584                                  ;  565  3648 expect
 12585                                  ;  566  3655 prs
 12586                                  ;  567  3659 prunsign1
 12587                                  ;  568  3669 prs
 12588                                  ;  569  3673 prs
 12589                                  ;  570  3677 prc
 12590                                  ;  571  3681 prunsign1
 12591                                  ;  572  3691 prs
 12592                                  ;  573  3695 v
 12593                                  ;  574  3697 prs
 12594                                  ;  575  3701 gettypes
 12595                                  ;  576  3710 prs
 12596                                  ;  577  3714 v
 12597                                  ;  578  3716 prs
 12598                                  ;  579  3720 v
 12599                                  ;  580  3722 prs
 12600                                  ;  581  3726 prs
 12601                                  ;  582  3730 printreg
 12602                                  ;  583  3739 prs
 12603                                  ;  584  3743 prs
 12604                                  ;  585  3747 prs
 12605                                  ;  586  3751 prunsign1
 12606                                  ;  587  3761 prs
 12607                                  ;  588  3765 prs
 12608                                  ;  589  3769 openR
 12609                                  ;  590  3775 prs
 12610                                  ;  591  3779 prs
 12611                                  ;  592  3783 error1
 12612                                  ;  593  3790 parse
 12613                                  ;  594  3796 prs
 12614                                  ;  595  3800 prs
 12615                                  ;  596  3804 getfirstchar
 12616                                  ;  597  3817 getlex
 12617                                  ;  598  3824 eqstr
 12618                                  ;  599  3830 getlex
 12619                                  ;  600  3837 eqstr
 12620                                  ;  601  3843 getlex
 12621                                  ;  602  3850 prs
 12622                                  ;  603  3854 strcpy
 12623                                  ;  604  3861 prs
 12624                                  ;  605  3865 error1
 12625                                  ;  606  3872 getlex
 12626                                  ;  607  3879 expect
 12627                                  ;  608  3886 error1
 12628                                  ;  609  3893 strlen
 12629                                  ;  610  3900 error1
 12630                                  ;  611  3907 adrofname
 12631                                  ;  612  3917 strcpy
 12632                                  ;  613  3924 expect
 12633                                  ;  614  3931 istoken
 12634                                  ;  615  3939 istoken
 12635                                  ;  616  3947 stmt
 12636                                  ;  617  3952 istoken
 12637                                  ;  618  3960 doif
 12638                                  ;  619  3965 istoken
 12639                                  ;  620  3973 dodo
 12640                                  ;  621  3978 istoken
 12641                                  ;  622  3986 dowhile
 12642                                  ;  623  3994 istoken
 12643                                  ;  624  4002 prs
 12644                                  ;  625  4006 name1
 12645                                  ;  626  4012 prs
 12646                                  ;  627  4016 expect
 12647                                  ;  628  4023 prs
 12648                                  ;  629  4027 next
 12649                                  ;  630  4032 prc
 12650                                  ;  631  4036 next
 12651                                  ;  632  4041 getlex
 12652                                  ;  633  4048 istoken
 12653                                  ;  634  4056 prs
 12654                                  ;  635  4060 next
 12655                                  ;  636  4065 prc
 12656                                  ;  637  4069 next
 12657                                  ;  638  4074 getlex
 12658                                  ;  639  4081 error1
 12659                                  ;  640  4088 istoken
 12660                                  ;  641  4096 doemit
 12661                                  ;  642  4103 istoken
 12662                                  ;  643  4111 istoken
 12663                                  ;  644  4119 exprstart
 12664                                  ;  645  4129 prs
 12665                                  ;  646  4133 prs
 12666                                  ;  647  4137 expect
 12667                                  ;  648  4144 prs
 12668                                  ;  649  4148 prs
 12669                                  ;  650  4152 prc
 12670                                  ;  651  4156 expect
 12671                                  ;  652  4163 expect
 12672                                  ;  653  4170 exprstart
 12673                                  ;  654  4180 expect
 12674                                  ;  655  4187 prs
 12675                                  ;  656  4191 getlex
 12676                                  ;  657  4198 prunsign1
 12677                                  ;  658  4208 getlex
 12678                                  ;  659  4215 prc
 12679                                  ;  660  4219 expect
 12680                                  ;  661  4226 prs
 12681                                  ;  662  4230 prs
 12682                                  ;  663  4234 prs
 12683                                  ;  664  4238 prs
 12684                                  ;  665  4242 prs
 12685                                  ;  666  4246 prunsign1
 12686                                  ;  667  4256 prs
 12687                                  ;  668  4260 prs
 12688                                  ;  669  4264 prunsign1
 12689                                  ;  670  4274 prs
 12690                                  ;  671  4278 prs
 12691                                  ;  672  4282 prs
 12692                                  ;  673  4286 error1
 12693                                  ;  674  4293 prs
 12694                                  ;  675  4297 prs
 12695                                  ;  676  4301 prunsign1
 12696                                  ;  677  4311 prc
 12697                                  ;  678  4315 prs
 12698                                  ;  679  4319 prs
 12699                                  ;  680  4323 prunsign1
 12700                                  ;  681  4333 pexpr
 12701                                  ;  682  4339 pint1
 12702                                  ;  683  4345 stmt
 12703                                  ;  684  4350 istoken
 12704                                  ;  685  4358 prjump
 12705                                  ;  686  4365 prlabel
 12706                                  ;  687  4373 stmt
 12707                                  ;  688  4378 prlabel
 12708                                  ;  689  4386 prlabel
 12709                                  ;  690  4394 prlabel
 12710                                  ;  691  4402 stmt
 12711                                  ;  692  4407 expect
 12712                                  ;  693  4414 pexpr
 12713                                  ;  694  4420 pint1
 12714                                  ;  695  4426 prjump
 12715                                  ;  696  4433 prlabel
 12716                                  ;  697  4441 prlabel
 12717                                  ;  698  4449 pexpr
 12718                                  ;  699  4455 pint1
 12719                                  ;  700  4461 stmt
 12720                                  ;  701  4466 prjump
 12721                                  ;  702  4473 prlabel
 12722                                  ;  703  4481 getlex
 12723                                  ;  704  4488 next
 12724                                  ;  705  4493 next
 12725                                  ;  706  4498 next
 12726                                  ;  707  4503 next
 12727                                  ;  708  4508 next
 12728                                  ;  709  4513 next
 12729                                  ;  710  4518 next
 12730                                  ;  711  4523 next
 12731                                  ;  712  4528 next
 12732                                  ;  713  4533 next
 12733                                  ;  714  4538 next
 12734                                  ;  715  4543 next
 12735                                  ;  716  4548 next
 12736                                  ;  717  4553 next
 12737                                  ;  718  4558 next
 12738                                  ;  719  4563 instr1
 12739                                  ;  720  4570 next
 12740                                  ;  721  4575 ifEOL
 12741                                  ;  722  4581 getlex
 12742                                  ;  723  4588 next
 12743                                  ;  724  4593 next
 12744                                  ;  725  4598 getlex
 12745                                  ;  726  4605 getstring
 12746                                  ;  727  4615 digit
 12747                                  ;  728  4621 getdigit
 12748                                  ;  729  4630 next
 12749                                  ;  730  4635 next
 12750                                  ;  731  4640 next
 12751                                  ;  732  4645 alnum
 12752                                  ;  733  4651 strcpy
 12753                                  ;  734  4658 alnum
 12754                                  ;  735  4664 next
 12755                                  ;  736  4669 eqstr
 12756                                  ;  737  4675 eqstr
 12757                                  ;  738  4681 eqstr
 12758                                  ;  739  4687 eqstr
 12759                                  ;  740  4693 eqstr
 12760                                  ;  741  4699 eqstr
 12761                                  ;  742  4705 eqstr
 12762                                  ;  743  4711 eqstr
 12763                                  ;  744  4717 eqstr
 12764                                  ;  745  4723 eqstr
 12765                                  ;  746  4729 eqstr
 12766                                  ;  747  4735 eqstr
 12767                                  ;  748  4741 eqstr
 12768                                  ;  749  4747 eqstr
 12769                                  ;  750  4753 eqstr
 12770                                  ;  751  4759 eqstr
 12771                                  ;  752  4765 eqstr
 12772                                  ;  753  4771 convertdefine
 12773                                  ;  754  4785 strcpy
 12774                                  ;  755  4792 error1
 12775                                  ;  756  4799 adrofname
 12776                                  ;  757  4809 eqstr
 12777                                  ;  758  4815 next
 12778                                  ;  759  4820 alnum
 12779                                  ;  760  4826 next
 12780                                  ;  761  4831 digit
 12781                                  ;  762  4837 next
 12782                                  ;  763  4842 next
 12783                                  ;  764  4847 next
 12784                                  ;  765  4852 printinputline
 12785                                  ;  766  4867 readRL
 12786                                  ;  767  4874 error1
 12787                                  ;  768  4881 prs
 12788                                  ;  769  4885 prunsign1
 12789                                  ;  770  4895 prc
 12790                                  ;  771  4899 prscomment
 12791                                  ;  772  4910 next
 12792                                  ;  773  4915 fcloseR
 12793                                  ;  774  4923 fcloseR
 12794                                  ;  775  4931 exitR
 12795                                  ;  776  4937 prnl
 12796                                  ;  777  4942 prscomment
 12797                                  ;  778  4953 prs
 12798                                  ;  779  4957 prunsign1
 12799                                  ;  780  4967 prs
 12800                                  ;  781  4971 prs
 12801                                  ;  782  4975 prs
 12802                                  ;  783  4979 prunsign1
 12803                                  ;  784  4989 prs
 12804                                  ;  785  4993 prunsign1
 12805                                  ;  786  5003 prs
 12806                                  ;  787  5007 prs
 12807                                  ;  788  5011 end1
 12808                                  ;  789  5016 prs
 12809                                  ;  790  5020 prs
 12810                                  ;  791  5024 prs
 12811                                  ;  792  5028 prunsign1
 12812                                  ;  793  5038 prs
 12813                                  ;  794  5042 prs
 12814                                  ;  795  5046 listvar
 12815                                  ;  796  5054 prs
 12816                                  ;  797  5058 calllisting
 12817                                  ;  798  5070 prs
 12818                                  ;  799  5074 printint51
 12819                                  ;  800  5085 prc
 12820                                  ;  801  5089 prs
 12821                                  ;  802  5093 printint51
 12822                                  ;  803  5104 prc
 12823                                  ;  804  5108 from_far
 12824                                  ;  805  5117 prs
 12825                                  ;  806  5121 adrF
 12826                                  ;  807  5126 from_far
 12827                                  ;  808  5135 eqstr
 12828                                  ;  809  5141 prs
 12829                                  ;  810  5145 countcalls
 12830                                  ;  811  5156 funclisting
 12831                                  ;  812  5168 prs
 12832                                  ;  813  5172 printint51
 12833                                  ;  814  5183 printint51
 12834                                  ;  815  5194 prs
 12835                                  ;  816  5198 printint51
 12836                                  ;  817  5209 prc
 12837                                  ;  818  5213 prs
 12838                                  ;  819  5217 prs
 12839                                  ;  820  5221 prs
 12840                                  ;  821  5225 prs
 12841                                  ;  822  5229 prc
 12842                                  ;  823  5233 prc
 12843                                  ;  824  5237 adrF
 12844                                  ;  825  5242 prs
 12845                                  ;  826  5246 prs
 12846                                  ;  827  5250 printint51
 12847                                  ;  828  5261 prc
 12848                                  ;  829  5265 prs
 12849                                  ;  830  5269 prs
 12850                                  ;  831  5273 prs
 12851                                  ;  832  5277 prs
 12852                                  ;  833  5281 prs
 12853                                  ;  834  5285 prs
 12854                                  ;  835  5289 prs
 12855                                  ;  836  5293 prs
 12856                                  ;  837  5297 prs
 12857                                  ;  838  5301 printint51
 12858                                  ;  839  5312 printint51
 12859                                  ;  840  5323 prs
 12860                                  ;  841  5327 prs
 12861                                  ;  842  5331 prc
 12862                                  ;  843  5335 adrofname
 12863                                  ;  844  5345 prs
 12864                                  ;  845  5349 prc
 12865                                  ;  846  5353 prunsign1
 12866                                  ;  847  5363 prc
 12867                                  ;  848  5367 prunsign1
 12868                                  ;  849  5377 prc
 12869                                  ;  850  5381 prs
 12870                                  ;  851  5385 prc
 12871                                  ;  852  5389 pint1
 12872                                  ;  853  5395 prs
 12873                                  ;  854  5399 prs
 12874                                  ;  855  5403 listvar
 12875                                  ;  856  5411 listfunc
 12876                                  ;  857  5420 listcall
 12877                                  ;  858  5429 prs
 12878                                  ;  859  5433 prs
 12879                                  ;  860  5437 prs
 12880                                  ;  861  5441 prs
 12881                                  ;  862  5445 prs
 12882                                  ;  863  5449 printint51
 12883                                  ;  864  5460 prs
 12884                                  ;  865  5464 printint51
 12885                                  ;  866  5475 prs
 12886                                  ;  867  5479 printint51
 12887                                  ;  868  5490 prs
 12888                                  ;  869  5494 printint51
 12889                                  ;  870  5505 prs
 12890                                  ;  871  5509 printint51
 12891                                  ;  872  5520 prs
 12892                                  ;  873  5524 printint51
 12893                                  ;  874  5535 prs
 12894                                  ;  875  5539 printint51
 12895                                  ;  876  5550 prs
 12896                                  ;  877  5554 printint51
 12897                                  ;  878  5565 prs
 12898                                  ;  879  5569 prs
 12899                                  ;  880  5573 prs
 12900                                  ;  881  5577 printint51
 12901                                  ;  882  5588 prs
 12902                                  ;  883  5592 printint51
 12903                                  ;  884  5603 prs
 12904                                  ;  885  5607 prs
 12905                                  ;  886  5611 printint51
 12906                                  ;  887  5622 prs
 12907                                  ;  888  5626 end1
 12908                                  ;  889  5631 prs
 12909                                  ;  890  5635 from_far
 12910                                  ;  891  5644 adrF
 12911                                  ;  892  5649 eqstr
 12912                                  ;  893  5655 prs
 12913                                  ;  894  5659 prs
 12914                                  ;  895  5663 prs
 12915                                  ;  896  5667 printint51
 12916                                  ;  897  5678 error1
 12917                                  ;  898  5685 prs
 12918                                  ;  899  5689 getlex
 12919                                  ;  900  5696 istoken
 12920                                  ;  901  5704 istoken
 12921                                  ;  902  5712 dodefine
 12922                                  ;  903  5721 istoken
 12923                                  ;  904  5729 doinclude
 12924                                  ;  905  5739 error1
 12925                                  ;  906  5746 typeName
 12926                                  ;  907  5755 dofunc
 12927                                  ;  908  5762 doglob
 12928                                  ;  909  5769 fgets1
 12929                                  ;  910  5776 cputs
 12930                                  ;  911  5782 cputs
 12931                                  ;  912  5788 exitR
 12932                                  ;  913  5794 toupper
 12933                                  ;  914  5802 strcpy
 12934                                  ;  915  5809 instr1
 12935                                  ;  916  5816 strcat1
 12936                                  ;  917  5824 strcpy
 12937                                  ;  918  5831 strlen
 12938                                  ;  919  5838 openR
 12939                                  ;  920  5844 cputs
 12940                                  ;  921  5850 cputs
 12941                                  ;  922  5856 exitR
 12942                                  ;  923  5862 creatR
 12943                                  ;  924  5869 cputs
 12944                                  ;  925  5875 cputs
 12945                                  ;  926  5881 exitR
 12946                                  ;  927  5887 prs
 12947                                  ;  928  5891 prs
 12948                                  ;  929  5895 prs
 12949                                  ;  930  5899 prs
 12950                                  ;  931  5903 prs
 12951                                  ;  932  5907 prs
 12952                                  ;  933  5911 prs
 12953                                  ;  934  5915 DosInt
 12954                                  ;  935  5922 getarg
 12955                                  ;  936  5929 setblock
 12956                                  ;  937  5938 error1
 12957                                  ;  938  5945 allocmem
 12958                                  ;  939  5954 error1
 12959                                  ;  940  5961 getfirstchar
 12960                                  ;  941  5974 parse
 12961                                  ;  942  5980 checkcalls
 12962                                  ;  943  5991 epilog
 12963                                  ;  944  5998 DosInt
 12964                                  ;Input: A.C, List: A.S,  Lines: 1340
 12965                                  ;Glob. variables:  130 max.:  200
 12966                                  ;Functions      :  106 max.:  300
 12967                                  ;Calls          :  945 max.: 2000, NameField: 6005
 12968                                  ;Const in 'expr2' :  754 max.: 3000, stacksize: 16987
