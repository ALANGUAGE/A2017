     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9C04B                  jmp main
     5                                  
     6                                  ;-1 char Version1[]="A.COM V0.9.2";//todo: 2. op=reg not recognized
     7                                  
     8 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9.2",0
     9 0000000C 392E3200           
    10                                  
    11                                  ;-2 #define IDLENMAX       15//max length of names
    12                                  
    13                                  
    14                                  ;-3 #define COLUMNMAX     128//output, input is 80
    15                                  
    16                                  
    17                                  ;-4 #define T_NAME        256//the following defines for better clearity
    18                                  
    19                                  
    20                                  ;-5 #define T_CONST       257
    21                                  
    22                                  
    23                                  ;-6 #define T_STRING      258
    24                                  
    25                                  
    26                                  ;-7 #define T_DEFINE      511
    27                                  
    28                                  
    29                                  ;-8 #define T_RETURN      512
    30                                  
    31                                  
    32                                  ;-9 #define T_IF          513
    33                                  
    34                                  
    35                                  ;-10 #define T_ELSE        514
    36                                  
    37                                  
    38                                  ;-11 #define T_WHILE       515
    39                                  
    40                                  
    41                                  ;-12 #define T_DO          516
    42                                  
    43                                  
    44                                  ;-13 #define T_INT         517
    45                                  
    46                                  
    47                                  ;-14 #define T_ASM         518
    48                                  
    49                                  
    50                                  ;-15 #define T_ASMBLOCK    519
    51                                  
    52                                  
    53                                  ;-16 #define T_EMIT        520
    54                                  
    55                                  
    56                                  ;-17 #define T_GOTO        521
    57                                  
    58                                  
    59                                  ;-18 #define T_VOID        529
    60                                  
    61                                  
    62                                  ;-19 #define T_CHAR        530
    63                                  
    64                                  
    65                                  ;-20 #define T_SIGNED      531
    66                                  
    67                                  
    68                                  ;-21 #define T_UNSIGNED    532
    69                                  
    70                                  
    71                                  ;-22 #define T_LONG        533
    72                                  
    73                                  
    74                                  ;-23 #define T_EQ          806
    75                                  
    76                                  
    77                                  ;-24 #define T_NE          807
    78                                  
    79                                  
    80                                  ;-25 #define T_GE          811
    81                                  
    82                                  
    83                                  ;-26 #define T_LE          824
    84                                  
    85                                  
    86                                  ;-27 #define T_PLUSPLUS   1219
    87                                  
    88                                  
    89                                  ;-28 #define T_MINUSMINUS 1225
    90                                  
    91                                  
    92                                  ;-29 #define T_PLUSASS    1230
    93                                  
    94                                  
    95                                  ;-30 #define T_MINUSASS   1231
    96                                  
    97                                  
    98                                  ;-31 #define T_MULASS     1232
    99                                  
   100                                  
   101                                  ;-32 #define T_DIVASS     1233
   102                                  
   103                                  
   104                                  ;-33 #define T_ANDASS     1234
   105                                  
   106                                  
   107                                  ;-34 #define T_ORASS      1235
   108                                  
   109                                  
   110                                  ;-35 #define T_LESSLESS   1240
   111                                  
   112                                  
   113                                  ;-36 #define T_GREATGREAT 1241
   114                                  
   115                                  
   116                                  ;-37 
   117                                  
   118                                  
   119                                  ;-38 unsigned int ORGDATAORIG=25000;//start of arrays
   120                                  
   121 00000010 A861                    ORGDATAORIG dw 25000
   122                                  
   123                                  ;-39 unsigned int orgData;//actual max of array, must be less than stack
   124                                  
   125 00000012 0000                    orgData dw 0
   126                                  
   127                                  ;-40 #define COMAX        2000
   128                                  
   129                                  
   130                                  ;-41 char co[COMAX];//constant storage
   131                                  
   132                                  section .bss
   133                                  absolute 25000
   134 000061A8 <res 000007D0>          co resb 2000
   135                                  section .text
   136                                  
   137                                  ;-42 int maxco=0;
   138                                  
   139 00000014 0000                    maxco dw 0
   140                                  
   141                                  ;-43 int maxco1=0;
   142                                  
   143 00000016 0000                    maxco1 dw 0
   144                                  
   145                                  ;-44 #define CMDLENMAX      67
   146                                  
   147                                  
   148                                  ;-45 char coname[CMDLENMAX];
   149                                  
   150                                  section .bss
   151                                  absolute 27000
   152 00006978 <res 00000043>          coname resb 67
   153                                  section .text
   154                                  
   155                                  ;-46 char symbol[COLUMNMAX];
   156                                  
   157                                  section .bss
   158                                  absolute 27067
   159 000069BB <res 00000080>          symbol resb 128
   160                                  section .text
   161                                  
   162                                  ;-47 char fname[CMDLENMAX];
   163                                  
   164                                  section .bss
   165                                  absolute 27195
   166 00006A3B <res 00000043>          fname resb 67
   167                                  section .text
   168                                  
   169                                  ;-48 char namein[CMDLENMAX];
   170                                  
   171                                  section .bss
   172                                  absolute 27262
   173 00006A7E <res 00000043>          namein resb 67
   174                                  section .text
   175                                  
   176                                  ;-49 char namelst[CMDLENMAX];
   177                                  
   178                                  section .bss
   179                                  absolute 27329
   180 00006AC1 <res 00000043>          namelst resb 67
   181                                  section .text
   182                                  
   183                                  ;-50 char *cloc=0;
   184                                  
   185 00000018 0000                    cloc dw 0
   186                                  
   187                                  ;-51 int fdin=0;
   188                                  
   189 0000001A 0000                    fdin dw 0
   190                                  
   191                                  ;-52 int fdout=0;
   192                                  
   193 0000001C 0000                    fdout dw 0
   194                                  
   195                                  ;-53 int token=0;
   196                                  
   197 0000001E 0000                    token dw 0
   198                                  
   199                                  ;-54 char globC=0;
   200                                  
   201 00000020 00                      globC db 0
   202                                  
   203                                  ;-55 int column=0;
   204                                  
   205 00000021 0000                    column dw 0
   206                                  
   207                                  ;-56 char thechar=0;   //reads one char forward
   208                                  
   209 00000023 00                      thechar db 0
   210                                  
   211                                  ;-57 int iscmp=0;
   212                                  
   213 00000024 0000                    iscmp dw 0
   214                                  
   215                                  ;-58 int nconst=0;
   216                                  
   217 00000026 0000                    nconst dw 0
   218                                  
   219                                  ;-59 int nreturn=0;
   220                                  
   221 00000028 0000                    nreturn dw 0
   222                                  
   223                                  ;-60 int nlabel=0;
   224                                  
   225 0000002A 0000                    nlabel dw 0
   226                                  
   227                                  ;-61 unsigned int lexval=0;
   228                                  
   229 0000002C 0000                    lexval dw 0
   230                                  
   231                                  ;-62 int typei;       char istype;
   232                                  
   233 0000002E 0000                    typei dw 0
   234 00000030 00                      istype db 0
   235                                  
   236                                  ;-63 int signi;       char issign;
   237                                  
   238 00000031 0000                    signi dw 0
   239 00000033 00                      issign db 0
   240                                  
   241                                  ;-64 int widthi;      char iswidth;
   242                                  
   243 00000034 0000                    widthi dw 0
   244 00000036 00                      iswidth db 0
   245                                  
   246                                  ;-65 int wi=0;
   247                                  
   248 00000037 0000                    wi dw 0
   249                                  
   250                                  ;-66 #define VARMAX        300//max global and local var
   251                                  
   252                                  
   253                                  ;-67 #define LSTART        200//max global var
   254                                  
   255                                  
   256                                  ;-68 #define GNAMEMAX     4800// 16*VARMAX
   257                                  
   258                                  
   259                                  ;-69 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   260                                  
   261                                  section .bss
   262                                  absolute 27396
   263 00006B04 <res 0000012C>          GType resb 300
   264                                  section .text
   265                                  
   266                                  ;-70 char GSign [VARMAX]; // 0=U, 1=S
   267                                  
   268                                  section .bss
   269                                  absolute 27696
   270 00006C30 <res 0000012C>          GSign resb 300
   271                                  section .text
   272                                  
   273                                  ;-71 char GWidth[VARMAX]; // 0, 1, 2, 4
   274                                  
   275                                  section .bss
   276                                  absolute 27996
   277 00006D5C <res 0000012C>          GWidth resb 300
   278                                  section .text
   279                                  
   280                                  ;-72 int GAdr  [VARMAX];
   281                                  
   282                                  section .bss
   283                                  absolute 28296
   284 00006E88 <res 00000258>          GAdr resw 300
   285                                  section .text
   286                                  
   287                                  ;-73 int GUsed [VARMAX];
   288                                  
   289                                  section .bss
   290                                  absolute 28896
   291 000070E0 <res 00000258>          GUsed resw 300
   292                                  section .text
   293                                  
   294                                  ;-74 int GData [VARMAX];
   295                                  
   296                                  section .bss
   297                                  absolute 29496
   298 00007338 <res 00000258>          GData resw 300
   299                                  section .text
   300                                  
   301                                  ;-75 char GNameField[GNAMEMAX];
   302                                  
   303                                  section .bss
   304                                  absolute 30096
   305 00007590 <res 000012C0>          GNameField resb 4800
   306                                  section .text
   307                                  
   308                                  ;-76 int GTop=1;
   309                                  
   310 00000039 0100                    GTop dw 1
   311                                  
   312                                  ;-77 int LTop=LSTART;
   313                                  
   314 0000003B C800                    LTop dw 200
   315                                  
   316                                  ;-78 #define FUNCMAX       300//max functions
   317                                  
   318                                  
   319                                  ;-79 #define FNAMEMAX     4800// 16*FUNCMAX
   320                                  
   321                                  
   322                                  ;-80 char FType [FUNCMAX];
   323                                  
   324                                  section .bss
   325                                  absolute 34896
   326 00008850 <res 0000012C>          FType resb 300
   327                                  section .text
   328                                  
   329                                  ;-81 int  FAdr  [FUNCMAX];
   330                                  
   331                                  section .bss
   332                                  absolute 35196
   333 0000897C <res 00000258>          FAdr resw 300
   334                                  section .text
   335                                  
   336                                  ;-82 int  FCalls[FUNCMAX];
   337                                  
   338                                  section .bss
   339                                  absolute 35796
   340 00008BD4 <res 00000258>          FCalls resw 300
   341                                  section .text
   342                                  
   343                                  ;-83 char FNameField[FNAMEMAX];
   344                                  
   345                                  section .bss
   346                                  absolute 36396
   347 00008E2C <res 000012C0>          FNameField resb 4800
   348                                  section .text
   349                                  
   350                                  ;-84 int  FTop=0;
   351                                  
   352 0000003D 0000                    FTop dw 0
   353                                  
   354                                  ;-85 #define CALLMAX      1500//max call
   355                                  
   356                                  
   357                                  ;-86 char CType[CALLMAX];
   358                                  
   359                                  section .bss
   360                                  absolute 41196
   361 0000A0EC <res 000005DC>          CType resb 1500
   362                                  section .text
   363                                  
   364                                  ;-87 int  CAdr [CALLMAX];
   365                                  
   366                                  section .bss
   367                                  absolute 42696
   368 0000A6C8 <res 00000BB8>          CAdr resw 1500
   369                                  section .text
   370                                  
   371                                  ;-88 #define CNAMEMAX    10000//space for call names
   372                                  
   373                                  
   374                                  ;-89 char CNameField[10016];//CNAMEMAX+IDLENMAX+1
   375                                  
   376                                  section .bss
   377                                  absolute 45696
   378 0000B280 <res 00002720>          CNameField resb 10016
   379                                  section .text
   380                                  
   381                                  ;-90 char *CNamePtr;     //first free position in CNameField
   382                                  
   383 0000003F 0000                    CNamePtr dw 0
   384                                  
   385                                  ;-91 unsigned char *CNameTop=0;
   386                                  
   387 00000041 0000                    CNameTop dw 0
   388                                  
   389                                  ;-92 int  CTop=0;
   390                                  
   391 00000043 0000                    CTop dw 0
   392                                  
   393                                  ;-93 
   394                                  
   395                                  
   396                                  ;-94 
   397                                  
   398                                  
   399                                  ;-95 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   400                                  
   401 00000045 313233343536373839-     NameA db "12345678901234567890123456789012",0
   402 0000004E 303132333435363738-
   403 00000057 393031323334353637-
   404 00000060 383930313200       
   405                                  
   406                                  ;-96 char fgetsdest[COLUMNMAX];
   407                                  
   408                                  section .bss
   409                                  absolute 55712
   410 0000D9A0 <res 00000080>          fgetsdest resb 128
   411                                  section .text
   412                                  
   413                                  ;-97 unsigned char *fgetsp=0;
   414                                  
   415 00000066 0000                    fgetsp dw 0
   416                                  
   417                                  ;-98 unsigned int segE;
   418                                  
   419 00000068 0000                    segE dw 0
   420                                  
   421                                  ;-99 unsigned int lineno=1;
   422                                  
   423 0000006A 0100                    lineno dw 1
   424                                  
   425                                  ;-100 unsigned int linenoinclude=1;
   426                                  
   427 0000006C 0100                    linenoinclude dw 1
   428                                  
   429                                  ;-101 unsigned char *pt=0;
   430                                  
   431 0000006E 0000                    pt dw 0
   432                                  
   433                                  ;-102 unsigned char *p1=0;
   434                                  
   435 00000070 0000                    p1 dw 0
   436                                  
   437                                  ;-103 int DOS_ERR=0;
   438                                  
   439 00000072 0000                    DOS_ERR dw 0
   440                                  
   441                                  ;-104 int DOS_NoBytes=0;
   442                                  
   443 00000074 0000                    DOS_NoBytes dw 0
   444                                  
   445                                  ;-105 char DOS_ByteRead=0;
   446                                  
   447 00000076 00                      DOS_ByteRead db 0
   448                                  
   449                                  ;-106 
   450                                  
   451                                  
   452                                  ;-107 
   453                                  
   454                                  
   455                                  ;-108 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   456                                  
   457                                  
   458                                  writetty: PROC
   459 00000077 B40E                     mov  ah, 14
   460 00000079 BB0000                   mov  bx, 0
   461 0000007C CD10                     db 205,16
   462                                  
   463                                  ;-109 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   464                                  
   465 0000007E C3                       ret
   466                                  ENDP
   467                                  
   468                                  putch: PROC
   469                                  ;Function : putch, Number of local variables: 1
   470                                  ;   # type sign width addr used name   list of local variables
   471                                  ;  200 var sign byte   109 NULL c = bp+4;
   472 0000007F C8000000                 ENTER  0,0
   473 00000083 8A4604                   mov al, [bp+4]
   474 00000086 3C0A                     cmp al, 10
   475 00000088 0F850500                 jne .putch1
   476 0000008C B00D                     mov  al, 13
   477 0000008E E8E6FF                   call writetty
   478                                  .putch1:
   479 00000091 8A4604                   mov  al, [bp+4]
   480 00000094 E8E0FF                   call writetty
   481                                  
   482                                  ;-110 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   483 00000097 C9                       LEAVE
   484 00000098 C3                       ret
   485                                  ENDP
   486                                  
   487                                  cputs: PROC
   488                                  ;Function : cputs, Number of local variables: 2
   489                                  ;   # type sign width addr used name   list of local variables
   490                                  ;  200 ptr sign byte   110 NULL s = bp+4
   491                                  ;  201 var sign byte   110 NULL c = bp-2;
   492 00000099 C8020000                 ENTER  2,0
   493                                  .cputs2:
   494 0000009D 8B5E04                   mov bx, [bp+4]
   495 000000A0 8A07                     mov al, [bx]
   496 000000A2 B400                     mov ah, 0
   497 000000A4 08C0                     or  al, al
   498 000000A6 0F841B00                 je .cputs3
   499 000000AA 8B5E04                   mov bx, [bp+4]
   500 000000AD 8A07                     mov al, [bx]
   501 000000AF B400                     mov ah, 0
   502 000000B1 8846FE                   mov [bp-2], al
   503 000000B4 8A46FE                   mov al, byte [bp-2]
   504 000000B7 B400                     mov ah, 0
   505 000000B9 50                       push ax
   506 000000BA E8C2FF                   call putch
   507 000000BD 83C402                   add  sp, 2
   508 000000C0 FF4604                   inc  word[bp+4]
   509 000000C3 EBD8                     jmp .cputs2
   510                                  .cputs3:
   511                                  
   512                                  ;-111 int mkneg(int n)   { n; __asm {neg ax} }
   513 000000C5 C9                       LEAVE
   514 000000C6 C3                       ret
   515                                  ENDP
   516                                  
   517                                  mkneg: PROC
   518                                  ;Function : mkneg, Number of local variables: 1
   519                                  ;   # type sign width addr used name   list of local variables
   520                                  ;  200 var sign word   111 NULL n = bp+4;
   521 000000C7 C8000000                 ENTER  0,0
   522 000000CB 8B4604                   mov ax, [bp+4]
   523 000000CE F7D8                    neg ax
   524                                  
   525                                  ;-112 
   526                                  
   527                                  
   528                                  ;-113 int DosInt() {
   529 000000D0 C9                       LEAVE
   530 000000D1 C3                       ret
   531                                  ENDP
   532                                  
   533                                  DosInt: PROC
   534                                  
   535                                  ;-114     __emit__(0xCD,0x21);//inth 0x21;
   536                                  
   537 000000D2 CD21                     db 205,33
   538                                  
   539                                  ;-115     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   540                                  
   541 000000D4 7304                     db 115,4
   542                                  
   543                                  ;-116     DOS_ERR++;
   544                                  
   545 000000D6 FF06[7200]               inc  word[DOS_ERR]
   546                                  
   547                                  ;-117 }
   548                                  
   549                                  
   550                                  ;-118 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   551                                  
   552 000000DA C3                       ret
   553                                  ENDP
   554                                  
   555                                  openR: PROC
   556                                  ;Function : openR, Number of local variables: 1
   557                                  ;   # type sign width addr used name   list of local variables
   558                                  ;  200 ptr sign byte   118 NULL s = bp+4;
   559 000000DB C8000000                 ENTER  0,0
   560 000000DF 8B5604                   mov  dx, [bp+4]
   561 000000E2 B8023D                   mov  ax, 15618
   562 000000E5 E8EAFF                   call DosInt
   563                                  
   564                                  ;-119 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   565 000000E8 C9                       LEAVE
   566 000000E9 C3                       ret
   567                                  ENDP
   568                                  
   569                                  creatR: PROC
   570                                  ;Function : creatR, Number of local variables: 1
   571                                  ;   # type sign width addr used name   list of local variables
   572                                  ;  200 ptr sign byte   119 NULL s = bp+4;
   573 000000EA C8000000                 ENTER  0,0
   574 000000EE 8B5604                   mov  dx, [bp+4]
   575 000000F1 B90000                   mov  cx, 0
   576 000000F4 B8003C                   mov  ax, 15360
   577 000000F7 E8D8FF                   call DosInt
   578                                  
   579                                  ;-120 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   580 000000FA C9                       LEAVE
   581 000000FB C3                       ret
   582                                  ENDP
   583                                  
   584                                  fcloseR: PROC
   585                                  ;Function : fcloseR, Number of local variables: 1
   586                                  ;   # type sign width addr used name   list of local variables
   587                                  ;  200 var sign word   120 NULL fd = bp+4;
   588 000000FC C8000000                 ENTER  0,0
   589 00000100 8B5E04                   mov  bx, [bp+4]
   590 00000103 B8003E                   mov  ax, 15872
   591 00000106 E8C9FF                   call DosInt
   592                                  
   593                                  ;-121 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   594 00000109 C9                       LEAVE
   595 0000010A C3                       ret
   596                                  ENDP
   597                                  
   598                                  exitR: PROC
   599                                  ;Function : exitR, Number of local variables: 1
   600                                  ;   # type sign width addr used name   list of local variables
   601                                  ;  200 var sign byte   121 NULL c = bp+4;
   602 0000010B C8000000                 ENTER  0,0
   603 0000010F B44C                     mov  ah, 76
   604 00000111 8A4604                   mov  al, [bp+4]
   605 00000114 E8BBFF                   call DosInt
   606                                  
   607                                  ;-122 int readRL(char *s, int fd, int len){
   608 00000117 C9                       LEAVE
   609 00000118 C3                       ret
   610                                  ENDP
   611                                  
   612                                  readRL: PROC
   613                                  
   614                                  ;-123     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   615                                  
   616                                  ;Function : readRL, Number of local variables: 3
   617                                  ;   # type sign width addr used name   list of local variables
   618                                  ;  200 ptr sign byte   122 NULL s = bp+4
   619                                  ;  201 var sign word   122 NULL fd = bp+6
   620                                  ;  202 var sign word   122 NULL len = bp+8;
   621 00000119 C8000000                 ENTER  0,0
   622 0000011D 8B5604                   mov  dx, [bp+4]
   623 00000120 8B4E08                   mov  cx, [bp+8]
   624 00000123 8B5E06                   mov  bx, [bp+6]
   625 00000126 B8003F                   mov  ax, 16128
   626 00000129 E8A6FF                   call DosInt
   627                                  
   628                                  ;-124 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   629 0000012C C9                       LEAVE
   630 0000012D C3                       ret
   631                                  ENDP
   632                                  
   633                                  fputcR: PROC
   634                                  ;Function : fputcR, Number of local variables: 2
   635                                  ;   # type sign width addr used name   list of local variables
   636                                  ;  200 ptr sign byte   124 NULL n = bp+4
   637                                  ;  201 var sign word   124 NULL fd = bp+6;
   638 0000012E C8000000                 ENTER  0,0
   639 00000132 8D5604                  lea dx, [bp+4]
   640                                  
   641                                  ;-125   cx=1; bx=fd; ax=0x4000; DosInt(); }
   642                                  
   643 00000135 B90100                   mov  cx, 1
   644 00000138 8B5E06                   mov  bx, [bp+6]
   645 0000013B B80040                   mov  ax, 16384
   646 0000013E E891FF                   call DosInt
   647                                  
   648                                  ;-126 
   649                                  
   650                                  
   651                                  ;-127   int letter(char c) {
   652 00000141 C9                       LEAVE
   653 00000142 C3                       ret
   654                                  ENDP
   655                                  
   656                                  letter: PROC
   657                                  
   658                                  ;-128       if (c=='_') return 1;
   659                                  
   660                                  ;Function : letter, Number of local variables: 1
   661                                  ;   # type sign width addr used name   list of local variables
   662                                  ;  200 var sign byte   127 NULL c = bp+4;
   663 00000143 C8000000                 ENTER  0,0
   664 00000147 8A4604                   mov al, [bp+4]
   665 0000014A 3C5F                     cmp al, 95
   666 0000014C 0F850600                 jne .letter4
   667 00000150 B80100                   mov ax, 1
   668 00000153 E96900                   jmp .retnletter
   669                                  
   670                                  ;-129       if (c=='.') return 1;
   671                                  
   672                                  .letter4:
   673 00000156 8A4604                   mov al, [bp+4]
   674 00000159 3C2E                     cmp al, 46
   675 0000015B 0F850600                 jne .letter5
   676 0000015F B80100                   mov ax, 1
   677 00000162 E95A00                   jmp .retnletter
   678                                  
   679                                  ;-130       if (c=='?') return 1;
   680                                  
   681                                  .letter5:
   682 00000165 8A4604                   mov al, [bp+4]
   683 00000168 3C3F                     cmp al, 63
   684 0000016A 0F850600                 jne .letter6
   685 0000016E B80100                   mov ax, 1
   686 00000171 E94B00                   jmp .retnletter
   687                                  
   688                                  ;-131       if (c=='$') return 1;
   689                                  
   690                                  .letter6:
   691 00000174 8A4604                   mov al, [bp+4]
   692 00000177 3C24                     cmp al, 36
   693 00000179 0F850600                 jne .letter7
   694 0000017D B80100                   mov ax, 1
   695 00000180 E93C00                   jmp .retnletter
   696                                  
   697                                  ;-132       if (c> 'z') return 0;
   698                                  
   699                                  .letter7:
   700 00000183 8A4604                   mov al, [bp+4]
   701 00000186 3C7A                     cmp al, 122
   702 00000188 0F8E0600                 jle .letter8
   703 0000018C B80000                   mov ax, 0
   704 0000018F E92D00                   jmp .retnletter
   705                                  
   706                                  ;-133       if (c< '@') return 0;// at included
   707                                  
   708                                  .letter8:
   709 00000192 8A4604                   mov al, [bp+4]
   710 00000195 3C40                     cmp al, 64
   711 00000197 0F8D0600                 jge .letter9
   712 0000019B B80000                   mov ax, 0
   713 0000019E E91E00                   jmp .retnletter
   714                                  
   715                                  ;-134       if (c> 'Z') { if (c< 'a') return 0; }
   716                                  
   717                                  .letter9:
   718 000001A1 8A4604                   mov al, [bp+4]
   719 000001A4 3C5A                     cmp al, 90
   720 000001A6 0F8E0F00                 jle .letter10
   721 000001AA 8A4604                   mov al, [bp+4]
   722 000001AD 3C61                     cmp al, 97
   723 000001AF 0F8D0600                 jge .letter11
   724 000001B3 B80000                   mov ax, 0
   725 000001B6 E90600                   jmp .retnletter
   726                                  .letter11:
   727                                  
   728                                  ;-135       return 1;
   729                                  
   730                                  .letter10:
   731 000001B9 B80100                   mov ax, 1
   732 000001BC E90000                   jmp .retnletter
   733                                  
   734                                  ;-136   }
   735                                  
   736                                  
   737                                  ;-137   int digit(char c){
   738                                  
   739 000001BF C9                       .retnletter: LEAVE
   740 000001C0 C3                       ret
   741                                  ENDP
   742                                  
   743                                  digit: PROC
   744                                  
   745                                  ;-138       if(c<'0') return 0;
   746                                  
   747                                  ;Function : digit, Number of local variables: 1
   748                                  ;   # type sign width addr used name   list of local variables
   749                                  ;  200 var sign byte   137 NULL c = bp+4;
   750 000001C1 C8000000                 ENTER  0,0
   751 000001C5 8A4604                   mov al, [bp+4]
   752 000001C8 3C30                     cmp al, 48
   753 000001CA 0F8D0600                 jge .digit12
   754 000001CE B80000                   mov ax, 0
   755 000001D1 E91500                   jmp .retndigit
   756                                  
   757                                  ;-139       if(c>'9') return 0;
   758                                  
   759                                  .digit12:
   760 000001D4 8A4604                   mov al, [bp+4]
   761 000001D7 3C39                     cmp al, 57
   762 000001D9 0F8E0600                 jle .digit13
   763 000001DD B80000                   mov ax, 0
   764 000001E0 E90600                   jmp .retndigit
   765                                  
   766                                  ;-140       return 1;
   767                                  
   768                                  .digit13:
   769 000001E3 B80100                   mov ax, 1
   770 000001E6 E90000                   jmp .retndigit
   771                                  
   772                                  ;-141   }
   773                                  
   774                                  
   775                                  ;-142   int alnum(char c) {
   776                                  
   777 000001E9 C9                       .retndigit: LEAVE
   778 000001EA C3                       ret
   779                                  ENDP
   780                                  
   781                                  alnum: PROC
   782                                  
   783                                  ;-143     if (digit (c)) return 1;
   784                                  
   785                                  ;Function : alnum, Number of local variables: 1
   786                                  ;   # type sign width addr used name   list of local variables
   787                                  ;  200 var sign byte   142 NULL c = bp+4;
   788 000001EB C8000000                 ENTER  0,0
   789 000001EF 8A4604                   mov al, byte [bp+4]
   790 000001F2 B400                     mov ah, 0
   791 000001F4 50                       push ax
   792 000001F5 E8C9FF                   call digit
   793 000001F8 83C402                   add  sp, 2
   794 000001FB 08C0                     or  al, al
   795 000001FD 0F840600                 je .alnum14
   796 00000201 B80100                   mov ax, 1
   797 00000204 E91E00                   jmp .retnalnum
   798                                  
   799                                  ;-144     if (letter(c)) return 1;
   800                                  
   801                                  .alnum14:
   802 00000207 8A4604                   mov al, byte [bp+4]
   803 0000020A B400                     mov ah, 0
   804 0000020C 50                       push ax
   805 0000020D E833FF                   call letter
   806 00000210 83C402                   add  sp, 2
   807 00000213 08C0                     or  al, al
   808 00000215 0F840600                 je .alnum15
   809 00000219 B80100                   mov ax, 1
   810 0000021C E90600                   jmp .retnalnum
   811                                  
   812                                  ;-145     return 0;
   813                                  
   814                                  .alnum15:
   815 0000021F B80000                   mov ax, 0
   816 00000222 E90000                   jmp .retnalnum
   817                                  
   818                                  ;-146   }
   819                                  
   820                                  
   821                                  ;-147 
   822                                  
   823                                  
   824                                  ;-148 int strlen(char *s) { int c;
   825                                  
   826 00000225 C9                       .retnalnum: LEAVE
   827 00000226 C3                       ret
   828                                  ENDP
   829                                  
   830                                  strlen: PROC
   831                                  
   832                                  ;-149     c=0;
   833                                  
   834                                  ;Function : strlen, Number of local variables: 2
   835                                  ;   # type sign width addr used name   list of local variables
   836                                  ;  200 ptr sign byte   148 NULL s = bp+4
   837                                  ;  201 var sign word   148 NULL c = bp-2;
   838 00000227 C8020000                 ENTER  2,0
   839 0000022B B80000                   mov ax, 0
   840 0000022E 8946FE                   mov [bp-2], ax
   841                                  
   842                                  ;-150     while (*s!=0) {s++; c++;}
   843                                  
   844                                  .strlen16:
   845 00000231 8B5E04                   mov bx, [bp+4]
   846 00000234 8A07                     mov al, [bx]
   847 00000236 B400                     mov ah, 0
   848 00000238 83F800                   cmp ax, 0
   849 0000023B 0F840800                 je  .strlen17
   850 0000023F FF4604                   inc  word[bp+4]
   851 00000242 FF46FE                   inc  word[bp-2]
   852                                  
   853                                  ;-151     return c;
   854                                  
   855 00000245 EBEA                     jmp .strlen16
   856                                  .strlen17:
   857 00000247 8B46FE                   mov ax, [bp-2]
   858 0000024A E90000                   jmp .retnstrlen
   859                                  
   860                                  ;-152 }
   861                                  
   862                                  
   863                                  ;-153 int strcpy(char *s, char *t) {
   864                                  
   865 0000024D C9                       .retnstrlen: LEAVE
   866 0000024E C3                       ret
   867                                  ENDP
   868                                  
   869                                  strcpy: PROC
   870                                  
   871                                  ;-154     do { *s=*t; s++; t++; }
   872                                  
   873                                  ;Function : strcpy, Number of local variables: 2
   874                                  ;   # type sign width addr used name   list of local variables
   875                                  ;  200 ptr sign byte   153 NULL s = bp+4
   876                                  ;  201 ptr sign byte   153 NULL t = bp+6;
   877 0000024F C8000000                 ENTER  0,0
   878                                  .strcpy18:
   879 00000253 8B5E06                   mov bx, [bp+6]
   880 00000256 8A07                     mov al, [bx]
   881 00000258 B400                     mov ah, 0
   882 0000025A 8B5E04                   mov  bx, [bp+4]
   883 0000025D 8807                     mov  [bx], al
   884 0000025F FF4604                   inc  word[bp+4]
   885 00000262 FF4606                   inc  word[bp+6]
   886                                  
   887                                  ;-155     while (*t!=0);
   888                                  
   889 00000265 8B5E06                   mov bx, [bp+6]
   890 00000268 8A07                     mov al, [bx]
   891 0000026A B400                     mov ah, 0
   892 0000026C 83F800                   cmp ax, 0
   893 0000026F 0F840200                 je  .strcpy19
   894 00000273 EBDE                     jmp .strcpy18
   895                                  .strcpy19:
   896                                  
   897                                  ;-156     *s=0;
   898                                  
   899 00000275 B80000                   mov ax, 0
   900 00000278 8B5E04                   mov  bx, [bp+4]
   901 0000027B 8807                     mov  [bx], al
   902                                  
   903                                  ;-157     return s;
   904                                  
   905 0000027D 8B4604                   mov ax, [bp+4]
   906 00000280 E90000                   jmp .retnstrcpy
   907                                  
   908                                  ;-158 }
   909                                  
   910                                  
   911                                  ;-159 int eqstr(char *p, char *q) {
   912                                  
   913 00000283 C9                       .retnstrcpy: LEAVE
   914 00000284 C3                       ret
   915                                  ENDP
   916                                  
   917                                  eqstr: PROC
   918                                  
   919                                  ;-160     while(*p) {
   920                                  
   921                                  ;Function : eqstr, Number of local variables: 2
   922                                  ;   # type sign width addr used name   list of local variables
   923                                  ;  200 ptr sign byte   159 NULL p = bp+4
   924                                  ;  201 ptr sign byte   159 NULL q = bp+6;
   925 00000285 C8000000                 ENTER  0,0
   926                                  .eqstr20:
   927 00000289 8B5E04                   mov bx, [bp+4]
   928 0000028C 8A07                     mov al, [bx]
   929 0000028E B400                     mov ah, 0
   930 00000290 08C0                     or  al, al
   931 00000292 0F842000                 je .eqstr21
   932                                  
   933                                  ;-161         if (*p != *q) return 0;
   934                                  
   935 00000296 8B5E04                   mov bx, [bp+4]
   936 00000299 8A07                     mov al, [bx]
   937 0000029B B400                     mov ah, 0
   938 0000029D 8B5E06                   mov bx, [bp+6]
   939 000002A0 3A07                     cmp al, [bx]
   940 000002A2 B400                     mov ah, 0
   941 000002A4 0F840600                 je  .eqstr22
   942 000002A8 B80000                   mov ax, 0
   943 000002AB E92100                   jmp .retneqstr
   944                                  
   945                                  ;-162         p++;
   946                                  
   947                                  .eqstr22:
   948 000002AE FF4604                   inc  word[bp+4]
   949                                  
   950                                  ;-163         q++;
   951                                  
   952 000002B1 FF4606                   inc  word[bp+6]
   953                                  
   954                                  ;-164     }
   955                                  
   956                                  
   957                                  ;-165     if(*q) return 0;
   958                                  
   959 000002B4 EBD3                     jmp .eqstr20
   960                                  .eqstr21:
   961 000002B6 8B5E06                   mov bx, [bp+6]
   962 000002B9 8A07                     mov al, [bx]
   963 000002BB B400                     mov ah, 0
   964 000002BD 08C0                     or  al, al
   965 000002BF 0F840600                 je .eqstr23
   966 000002C3 B80000                   mov ax, 0
   967 000002C6 E90600                   jmp .retneqstr
   968                                  
   969                                  ;-166     return 1; }
   970                                  
   971                                  .eqstr23:
   972 000002C9 B80100                   mov ax, 1
   973 000002CC E90000                   jmp .retneqstr
   974                                  
   975                                  ;-167 int strcat1(char *s, char *t) {
   976                                  
   977 000002CF C9                       .retneqstr: LEAVE
   978 000002D0 C3                       ret
   979                                  ENDP
   980                                  
   981                                  strcat1: PROC
   982                                  
   983                                  ;-168     while (*s != 0) s++;
   984                                  
   985                                  ;Function : strcat1, Number of local variables: 2
   986                                  ;   # type sign width addr used name   list of local variables
   987                                  ;  200 ptr sign byte   167 NULL s = bp+4
   988                                  ;  201 ptr sign byte   167 NULL t = bp+6;
   989 000002D1 C8000000                 ENTER  0,0
   990                                  .strcat124:
   991 000002D5 8B5E04                   mov bx, [bp+4]
   992 000002D8 8A07                     mov al, [bx]
   993 000002DA B400                     mov ah, 0
   994 000002DC 83F800                   cmp ax, 0
   995 000002DF 0F840500                 je  .strcat125
   996 000002E3 FF4604                   inc  word[bp+4]
   997                                  
   998                                  ;-169     strcpy(s, t);
   999                                  
  1000 000002E6 EBED                     jmp .strcat124
  1001                                  .strcat125:
  1002 000002E8 FF7606                   push word [bp+6]
  1003 000002EB FF7604                   push word [bp+4]
  1004 000002EE E85EFF                   call strcpy
  1005 000002F1 83C404                   add  sp, 4
  1006                                  
  1007                                  ;-170 }
  1008                                  
  1009                                  
  1010                                  ;-171 int toupper(char *s) {
  1011 000002F4 C9                       LEAVE
  1012 000002F5 C3                       ret
  1013                                  ENDP
  1014                                  
  1015                                  toupper: PROC
  1016                                  
  1017                                  ;-172     while(*s) {
  1018                                  
  1019                                  ;Function : toupper, Number of local variables: 1
  1020                                  ;   # type sign width addr used name   list of local variables
  1021                                  ;  200 ptr sign byte   171 NULL s = bp+4;
  1022 000002F6 C8000000                 ENTER  0,0
  1023                                  .toupper26:
  1024 000002FA 8B5E04                   mov bx, [bp+4]
  1025 000002FD 8A07                     mov al, [bx]
  1026 000002FF B400                     mov ah, 0
  1027 00000301 08C0                     or  al, al
  1028 00000303 0F843000                 je .toupper27
  1029                                  
  1030                                  ;-173         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
  1031                                  
  1032 00000307 8B5E04                   mov bx, [bp+4]
  1033 0000030A 8A07                     mov al, [bx]
  1034 0000030C B400                     mov ah, 0
  1035 0000030E 83F861                   cmp ax, 97 ;unsigned : 1
  1036 00000311 0F8C1D00                 jl  .toupper28
  1037 00000315 8B5E04                   mov bx, [bp+4]
  1038 00000318 8A07                     mov al, [bx]
  1039 0000031A B400                     mov ah, 0
  1040 0000031C 83F87A                   cmp ax, 122
  1041 0000031F 0F8F0F00                 jg  .toupper29
  1042 00000323 8B5E04                   mov bx, [bp+4]
  1043 00000326 8A07                     mov al, [bx]
  1044 00000328 B400                     mov ah, 0
  1045 0000032A 83E820                   sub ax, 32
  1046 0000032D 8B5E04                   mov  bx, [bp+4]
  1047 00000330 8807                     mov  [bx], al
  1048                                  
  1049                                  ;-174         s++;
  1050                                  
  1051                                  .toupper29:
  1052                                  .toupper28:
  1053 00000332 FF4604                   inc  word[bp+4]
  1054                                  
  1055                                  ;-175     }
  1056                                  
  1057                                  
  1058                                  ;-176 }
  1059                                  
  1060 00000335 EBC3                     jmp .toupper26
  1061                                  .toupper27:
  1062                                  
  1063                                  ;-177 int instr1(char *s, char c) {
  1064 00000337 C9                       LEAVE
  1065 00000338 C3                       ret
  1066                                  ENDP
  1067                                  
  1068                                  instr1: PROC
  1069                                  
  1070                                  ;-178     while(*s) {
  1071                                  
  1072                                  ;Function : instr1, Number of local variables: 2
  1073                                  ;   # type sign width addr used name   list of local variables
  1074                                  ;  200 ptr sign byte   177 NULL s = bp+4
  1075                                  ;  201 var sign byte   177 NULL c = bp+6;
  1076 00000339 C8000000                 ENTER  0,0
  1077                                  .instr130:
  1078 0000033D 8B5E04                   mov bx, [bp+4]
  1079 00000340 8A07                     mov al, [bx]
  1080 00000342 B400                     mov ah, 0
  1081 00000344 08C0                     or  al, al
  1082 00000346 0F841900                 je .instr131
  1083                                  
  1084                                  ;-179         if (*s==c) return 1;
  1085                                  
  1086 0000034A 8B5E04                   mov bx, [bp+4]
  1087 0000034D 8A07                     mov al, [bx]
  1088 0000034F B400                     mov ah, 0
  1089 00000351 3A4606                   cmp al, [bp+6]
  1090 00000354 0F850600                 jne .instr132
  1091 00000358 B80100                   mov ax, 1
  1092 0000035B E90B00                   jmp .retninstr1
  1093                                  
  1094                                  ;-180         s++;
  1095                                  
  1096                                  .instr132:
  1097 0000035E FF4604                   inc  word[bp+4]
  1098                                  
  1099                                  ;-181     }
  1100                                  
  1101                                  
  1102                                  ;-182     return 0;
  1103                                  
  1104 00000361 EBDA                     jmp .instr130
  1105                                  .instr131:
  1106 00000363 B80000                   mov ax, 0
  1107 00000366 E90000                   jmp .retninstr1
  1108                                  
  1109                                  ;-183 }
  1110                                  
  1111                                  
  1112                                  ;-184 
  1113                                  
  1114                                  
  1115                                  ;-185 
  1116                                  
  1117                                  
  1118                                  ;-186 int a(unsigned int i) { printName(i);//address
  1119                                  
  1120 00000369 C9                       .retninstr1: LEAVE
  1121 0000036A C3                       ret
  1122                                  ENDP
  1123                                  
  1124                                  a: PROC
  1125                                  ;Function : a, Number of local variables: 1
  1126                                  ;   # type sign width addr used name   list of local variables
  1127                                  ;  200 var unsg word   186 NULL i = bp+4;
  1128 0000036B C8000000                 ENTER  0,0
  1129 0000036F FF7604                   push word [bp+4]
  1130 00000372 E8D008                   call printName
  1131 00000375 83C402                   add  sp, 2
  1132                                  
  1133                                  ;-187 }
  1134                                  
  1135                                  
  1136                                  ;-188 int v(unsigned int i) {//value
  1137 00000378 C9                       LEAVE
  1138 00000379 C3                       ret
  1139                                  ENDP
  1140                                  
  1141                                  v: PROC
  1142                                  
  1143                                  ;-189     if (i < LSTART) prc('[');
  1144                                  
  1145                                  ;Function : v, Number of local variables: 1
  1146                                  ;   # type sign width addr used name   list of local variables
  1147                                  ;  200 var unsg word   188 NULL i = bp+4;
  1148 0000037A C8000000                 ENTER  0,0
  1149 0000037E 8B4604                   mov ax, [bp+4]
  1150 00000381 3DC800                   cmp ax, 200
  1151 00000384 0F8D0800                 jge .v33
  1152 00000388 6A5B                     push 91
  1153 0000038A E85801                   call prc
  1154 0000038D 83C402                   add  sp, 2
  1155                                  
  1156                                  ;-190     printName(i);
  1157                                  
  1158                                  .v33:
  1159 00000390 FF7604                   push word [bp+4]
  1160 00000393 E8AF08                   call printName
  1161 00000396 83C402                   add  sp, 2
  1162                                  
  1163                                  ;-191     if (i < LSTART) prc(']');
  1164                                  
  1165 00000399 8B4604                   mov ax, [bp+4]
  1166 0000039C 3DC800                   cmp ax, 200
  1167 0000039F 0F8D0800                 jge .v34
  1168 000003A3 6A5D                     push 93
  1169 000003A5 E83D01                   call prc
  1170 000003A8 83C402                   add  sp, 2
  1171                                  
  1172                                  ;-192 }
  1173                                  
  1174                                  .v34:
  1175                                  
  1176                                  ;-193 int checknamelen() {
  1177 000003AB C9                       LEAVE
  1178 000003AC C3                       ret
  1179                                  ENDP
  1180                                  
  1181                                  checknamelen: PROC
  1182                                  
  1183                                  ;-194     int i;
  1184                                  
  1185                                  
  1186                                  ;-195     i=strlen(symbol);
  1187                                  
  1188                                  ;Function : checknamelen, Number of local variables: 1
  1189                                  ;   # type sign width addr used name   list of local variables
  1190                                  ;  200 var sign word   194 NULL i = bp-2;
  1191 000003AD C8020000                 ENTER  2,0
  1192 000003B1 8D06BB69                 lea  ax, [symbol]
  1193 000003B5 50                       push ax
  1194 000003B6 E86EFE                   call strlen
  1195 000003B9 83C402                   add  sp, 2
  1196 000003BC 8946FE                   mov [bp-2], ax
  1197                                  
  1198                                  ;-196     if (i > IDLENMAX) error1("Item name is too long in characters)");
  1199                                  
  1200 000003BF 8B46FE                   mov ax, [bp-2]
  1201 000003C2 83F80F                   cmp ax, 15
  1202 000003C5 0F8E0900                 jle .checknamelen35
  1203 000003C9 68[D403]                 push checknamelen_0
  1204 000003CC E86539                   call error1
  1205 000003CF 83C402                   add  sp, 2
  1206                                  
  1207                                  ;-197 }
  1208                                  
  1209                                  .checknamelen35:
  1210                                  
  1211                                  ;-198 
  1212                                  
  1213                                  
  1214                                  ;-199 int next() {
  1215 000003D2 C9                       LEAVE
  1216 000003D3 C3                       ret
  1217 000003D4 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1218 000003DD 20697320746F6F206C-
  1219 000003E6 6F6E6720696E206368-
  1220 000003EF 617261637465727329-
  1221 000003F8 00                 
  1222                                  ENDP
  1223                                  
  1224                                  next: PROC
  1225                                  
  1226                                  ;-200     char r;
  1227                                  
  1228                                  
  1229                                  ;-201     r = thechar;
  1230                                  
  1231                                  ;Function : next, Number of local variables: 1
  1232                                  ;   # type sign width addr used name   list of local variables
  1233                                  ;  200 var sign byte   200 NULL r = bp-2;
  1234 000003F9 C8020000                 ENTER  2,0
  1235 000003FD A0[2300]                 mov al, [thechar]
  1236 00000400 8846FE                   mov [bp-2], al
  1237                                  
  1238                                  ;-202     globC=r;
  1239                                  
  1240 00000403 8A46FE                   mov al, [bp-2]
  1241 00000406 A2[2000]                 mov byte [globC], al
  1242                                  
  1243                                  ;-203     thechar = fgets1();
  1244                                  
  1245 00000409 E8B737                   call fgets1
  1246 0000040C A2[2300]                 mov byte [thechar], al
  1247                                  
  1248                                  ;-204     return r;
  1249                                  
  1250 0000040F 8A46FE                   mov al, [bp-2]
  1251 00000412 E90000                   jmp .retnnext
  1252                                  
  1253                                  ;-205 }
  1254                                  
  1255                                  
  1256                                  ;-206 int istoken(int t) {
  1257                                  
  1258 00000415 C9                       .retnnext: LEAVE
  1259 00000416 C3                       ret
  1260                                  ENDP
  1261                                  
  1262                                  istoken: PROC
  1263                                  
  1264                                  ;-207     if (token == t) {
  1265                                  
  1266                                  ;Function : istoken, Number of local variables: 1
  1267                                  ;   # type sign width addr used name   list of local variables
  1268                                  ;  200 var sign word   206 NULL t = bp+4;
  1269 00000417 C8000000                 ENTER  0,0
  1270 0000041B A1[1E00]                 mov ax, [token]
  1271 0000041E 3B4604                   cmp ax, [bp+4]
  1272 00000421 0F850C00                 jne .istoken36
  1273                                  
  1274                                  ;-208         token=getlex();
  1275                                  
  1276 00000425 E8952E                   call getlex
  1277 00000428 A3[1E00]                 mov word [token], ax
  1278                                  
  1279                                  ;-209         return 1;
  1280                                  
  1281 0000042B B80100                   mov ax, 1
  1282 0000042E E90600                   jmp .retnistoken
  1283                                  
  1284                                  ;-210     }
  1285                                  
  1286                                  
  1287                                  ;-211     return 0;
  1288                                  
  1289                                  .istoken36:
  1290 00000431 B80000                   mov ax, 0
  1291 00000434 E90000                   jmp .retnistoken
  1292                                  
  1293                                  ;-212 }
  1294                                  
  1295                                  
  1296                                  ;-213 int expect(int t) {
  1297                                  
  1298 00000437 C9                       .retnistoken: LEAVE
  1299 00000438 C3                       ret
  1300                                  ENDP
  1301                                  
  1302                                  expect: PROC
  1303                                  
  1304                                  ;-214     if (istoken(t)==0) {
  1305                                  
  1306                                  ;Function : expect, Number of local variables: 1
  1307                                  ;   # type sign width addr used name   list of local variables
  1308                                  ;  200 var sign word   213 NULL t = bp+4;
  1309 00000439 C8000000                 ENTER  0,0
  1310 0000043D FF7604                   push word [bp+4]
  1311 00000440 E8D4FF                   call istoken
  1312 00000443 83C402                   add  sp, 2
  1313 00000446 83F800                   cmp ax, 0
  1314 00000449 0F853200                 jne .expect37
  1315                                  
  1316                                  ;-215         *cloc=0;
  1317                                  
  1318 0000044D B80000                   mov ax, 0
  1319 00000450 8B1E[1800]               mov  bx, [cloc]
  1320 00000454 8807                     mov  [bx], al
  1321                                  
  1322                                  ;-216         prs(co);
  1323                                  
  1324 00000456 8D06A861                 lea  ax, [co]
  1325 0000045A 50                       push ax
  1326 0000045B E8EE00                   call prs
  1327 0000045E 83C402                   add  sp, 2
  1328                                  
  1329                                  ;-217         listproc();
  1330                                  
  1331 00000461 E89239                   call listproc
  1332                                  
  1333                                  ;-218         prs("\nExpected ASCII(dez): ");
  1334                                  
  1335 00000464 68[8104]                 push expect_0
  1336 00000467 E8E200                   call prs
  1337 0000046A 83C402                   add  sp, 2
  1338                                  
  1339                                  ;-219         pint1(t);
  1340                                  
  1341 0000046D FF7604                   push word [bp+4]
  1342 00000470 E8D001                   call pint1
  1343 00000473 83C402                   add  sp, 2
  1344                                  
  1345                                  ;-220         error1(" not found");
  1346                                  
  1347 00000476 68[9904]                 push expect_1
  1348 00000479 E8B838                   call error1
  1349 0000047C 83C402                   add  sp, 2
  1350                                  
  1351                                  ;-221     }
  1352                                  
  1353                                  
  1354                                  ;-222 }
  1355                                  
  1356                                  .expect37:
  1357                                  
  1358                                  ;-223 
  1359                                  
  1360                                  
  1361                                  ;-224 int eprc(char c)  {
  1362 0000047F C9                       LEAVE
  1363 00000480 C3                       ret
  1364 00000481 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  1365 0000048A 642041534349492864-
  1366 00000493 657A293A2000       
  1367 00000499 206E6F7420666F756E-     expect_1 db " not found",0
  1368 000004A2 6400               
  1369                                  ENDP
  1370                                  
  1371                                  eprc: PROC
  1372                                  
  1373                                  ;-225     *cloc=c;
  1374                                  
  1375                                  ;Function : eprc, Number of local variables: 1
  1376                                  ;   # type sign width addr used name   list of local variables
  1377                                  ;  200 var sign byte   224 NULL c = bp+4;
  1378 000004A4 C8000000                 ENTER  0,0
  1379 000004A8 8A4604                   mov al, [bp+4]
  1380 000004AB 8B1E[1800]               mov  bx, [cloc]
  1381 000004AF 8807                     mov  [bx], al
  1382                                  
  1383                                  ;-226     cloc++;
  1384                                  
  1385 000004B1 FF06[1800]               inc  word[cloc]
  1386                                  
  1387                                  ;-227 }
  1388                                  
  1389                                  
  1390                                  ;-228 int eprs(char *s) {
  1391 000004B5 C9                       LEAVE
  1392 000004B6 C3                       ret
  1393                                  ENDP
  1394                                  
  1395                                  eprs: PROC
  1396                                  
  1397                                  ;-229     char c;
  1398                                  
  1399                                  
  1400                                  ;-230     while(*s) {
  1401                                  
  1402                                  ;Function : eprs, Number of local variables: 2
  1403                                  ;   # type sign width addr used name   list of local variables
  1404                                  ;  200 ptr sign byte   228 NULL s = bp+4
  1405                                  ;  201 var sign byte   229 NULL c = bp-2;
  1406 000004B7 C8020000                 ENTER  2,0
  1407                                  .eprs38:
  1408 000004BB 8B5E04                   mov bx, [bp+4]
  1409 000004BE 8A07                     mov al, [bx]
  1410 000004C0 B400                     mov ah, 0
  1411 000004C2 08C0                     or  al, al
  1412 000004C4 0F841B00                 je .eprs39
  1413                                  
  1414                                  ;-231         c=*s;
  1415                                  
  1416 000004C8 8B5E04                   mov bx, [bp+4]
  1417 000004CB 8A07                     mov al, [bx]
  1418 000004CD B400                     mov ah, 0
  1419 000004CF 8846FE                   mov [bp-2], al
  1420                                  
  1421                                  ;-232         eprc(c);
  1422                                  
  1423 000004D2 8A46FE                   mov al, byte [bp-2]
  1424 000004D5 B400                     mov ah, 0
  1425 000004D7 50                       push ax
  1426 000004D8 E8C9FF                   call eprc
  1427 000004DB 83C402                   add  sp, 2
  1428                                  
  1429                                  ;-233         s++;
  1430                                  
  1431 000004DE FF4604                   inc  word[bp+4]
  1432                                  
  1433                                  ;-234     }
  1434                                  
  1435                                  
  1436                                  ;-235 }
  1437                                  
  1438 000004E1 EBD8                     jmp .eprs38
  1439                                  .eprs39:
  1440                                  
  1441                                  ;-236 int prc(unsigned char c) {
  1442 000004E3 C9                       LEAVE
  1443 000004E4 C3                       ret
  1444                                  ENDP
  1445                                  
  1446                                  prc: PROC
  1447                                  
  1448                                  ;-237     if (c==10) {
  1449                                  
  1450                                  ;Function : prc, Number of local variables: 1
  1451                                  ;   # type sign width addr used name   list of local variables
  1452                                  ;  200 var unsg byte   236 NULL c = bp+4;
  1453 000004E5 C8000000                 ENTER  0,0
  1454 000004E9 8A4604                   mov al, [bp+4]
  1455 000004EC 3C0A                     cmp al, 10
  1456 000004EE 0F850600                 jne .prc40
  1457                                  
  1458                                  ;-238         _AX=13;
  1459                                  
  1460 000004F2 B80D00                   mov  ax, 13
  1461                                  
  1462                                  ;-239         writetty();
  1463                                  
  1464 000004F5 E87FFB                   call writetty
  1465                                  
  1466                                  ;-240     }
  1467                                  
  1468                                  
  1469                                  ;-241     _AL=c;
  1470                                  
  1471                                  .prc40:
  1472 000004F8 8A4604                   mov  al, [bp+4]
  1473                                  
  1474                                  ;-242     writetty();
  1475                                  
  1476 000004FB E879FB                   call writetty
  1477                                  
  1478                                  ;-243     fputcR(c, fdout);
  1479                                  
  1480 000004FE FF36[1C00]               push word [fdout]
  1481 00000502 8A4604                   mov al, byte [bp+4]
  1482 00000505 B400                     mov ah, 0
  1483 00000507 50                       push ax
  1484 00000508 E823FC                   call fputcR
  1485 0000050B 83C404                   add  sp, 4
  1486                                  
  1487                                  ;-244 }
  1488                                  
  1489                                  
  1490                                  ;-245 int prscomment(unsigned char *s) {
  1491 0000050E C9                       LEAVE
  1492 0000050F C3                       ret
  1493                                  ENDP
  1494                                  
  1495                                  prscomment: PROC
  1496                                  
  1497                                  ;-246     unsigned char c;
  1498                                  
  1499                                  
  1500                                  ;-247     while(*s){
  1501                                  
  1502                                  ;Function : prscomment, Number of local variables: 2
  1503                                  ;   # type sign width addr used name   list of local variables
  1504                                  ;  200 ptr unsg byte   245 NULL s = bp+4
  1505                                  ;  201 var unsg byte   246 NULL c = bp-2;
  1506 00000510 C8020000                 ENTER  2,0
  1507                                  .prscomment41:
  1508 00000514 8B5E04                   mov bx, [bp+4]
  1509 00000517 8A07                     mov al, [bx]
  1510 00000519 B400                     mov ah, 0
  1511 0000051B 08C0                     or  al, al
  1512 0000051D 0F841B00                 je .prscomment42
  1513                                  
  1514                                  ;-248         c=*s;
  1515                                  
  1516 00000521 8B5E04                   mov bx, [bp+4]
  1517 00000524 8A07                     mov al, [bx]
  1518 00000526 B400                     mov ah, 0
  1519 00000528 8846FE                   mov [bp-2], al
  1520                                  
  1521                                  ;-249         prc(c);
  1522                                  
  1523 0000052B 8A46FE                   mov al, byte [bp-2]
  1524 0000052E B400                     mov ah, 0
  1525 00000530 50                       push ax
  1526 00000531 E8B1FF                   call prc
  1527 00000534 83C402                   add  sp, 2
  1528                                  
  1529                                  ;-250         s++;
  1530                                  
  1531 00000537 FF4604                   inc  word[bp+4]
  1532                                  
  1533                                  ;-251     }
  1534                                  
  1535                                  
  1536                                  ;-252 }
  1537                                  
  1538 0000053A EBD8                     jmp .prscomment41
  1539                                  .prscomment42:
  1540                                  
  1541                                  ;-253 int prnl() {
  1542 0000053C C9                       LEAVE
  1543 0000053D C3                       ret
  1544                                  ENDP
  1545                                  
  1546                                  prnl: PROC
  1547                                  
  1548                                  ;-254     prs("\n ");
  1549                                  
  1550 0000053E 68[4805]                 push prnl_0
  1551 00000541 E80800                   call prs
  1552 00000544 83C402                   add  sp, 2
  1553                                  
  1554                                  ;-255 }
  1555                                  
  1556                                  
  1557                                  ;-256 
  1558                                  
  1559                                  
  1560                                  ;-257 int prs(unsigned char *s) {
  1561                                  
  1562 00000547 C3                       ret
  1563 00000548 5C6E2000                prnl_0 db "\n ",0
  1564                                  ENDP
  1565                                  
  1566                                  prs: PROC
  1567                                  
  1568                                  ;-258     unsigned char c; int com;
  1569                                  
  1570                                  
  1571                                  ;-259     com=0;
  1572                                  
  1573                                  ;Function : prs, Number of local variables: 3
  1574                                  ;   # type sign width addr used name   list of local variables
  1575                                  ;  200 ptr unsg byte   257 NULL s = bp+4
  1576                                  ;  201 var unsg byte   258 NULL c = bp-2
  1577                                  ;  202 var sign word   258 NULL com = bp-4;
  1578 0000054C C8040000                 ENTER  4,0
  1579 00000550 B80000                   mov ax, 0
  1580 00000553 8946FC                   mov [bp-4], ax
  1581                                  
  1582                                  ;-260     while(*s) {
  1583                                  
  1584                                  .prs43:
  1585 00000556 8B5E04                   mov bx, [bp+4]
  1586 00000559 8A07                     mov al, [bx]
  1587 0000055B B400                     mov ah, 0
  1588 0000055D 08C0                     or  al, al
  1589 0000055F 0F847B00                 je .prs44
  1590                                  
  1591                                  ;-261         c=*s;
  1592                                  
  1593 00000563 8B5E04                   mov bx, [bp+4]
  1594 00000566 8A07                     mov al, [bx]
  1595 00000568 B400                     mov ah, 0
  1596 0000056A 8846FE                   mov [bp-2], al
  1597                                  
  1598                                  ;-262         if (c==34) if (com) com=0;
  1599                                  
  1600 0000056D 8A46FE                   mov al, [bp-2]
  1601 00000570 3C22                     cmp al, 34
  1602 00000572 0F851800                 jne .prs45
  1603 00000576 8B46FC                   mov ax, [bp-4]
  1604 00000579 08C0                     or  al, al
  1605 0000057B 0F840900                 je .prs46
  1606 0000057F B80000                   mov ax, 0
  1607 00000582 8946FC                   mov [bp-4], ax
  1608                                  
  1609                                  ;-263                    else com=1;
  1610                                  
  1611 00000585 E90600                   jmp .prs47
  1612                                  .prs46:
  1613 00000588 B80100                   mov ax, 1
  1614 0000058B 8946FC                   mov [bp-4], ax
  1615                                  
  1616                                  ;-264         if (c==92) {
  1617                                  
  1618                                  .prs47:
  1619                                  .prs45:
  1620 0000058E 8A46FE                   mov al, [bp-2]
  1621 00000591 3C5C                     cmp al, 92
  1622 00000593 0F853500                 jne .prs48
  1623                                  
  1624                                  ;-265             if (com==0) {
  1625                                  
  1626 00000597 8B46FC                   mov ax, [bp-4]
  1627 0000059A 83F800                   cmp ax, 0
  1628 0000059D 0F852B00                 jne .prs49
  1629                                  
  1630                                  ;-266                 s++;
  1631                                  
  1632 000005A1 FF4604                   inc  word[bp+4]
  1633                                  
  1634                                  ;-267                 c=*s;
  1635                                  
  1636 000005A4 8B5E04                   mov bx, [bp+4]
  1637 000005A7 8A07                     mov al, [bx]
  1638 000005A9 B400                     mov ah, 0
  1639 000005AB 8846FE                   mov [bp-2], al
  1640                                  
  1641                                  ;-268                 if (c=='n') c=10;
  1642                                  
  1643 000005AE 8A46FE                   mov al, [bp-2]
  1644 000005B1 3C6E                     cmp al, 110
  1645 000005B3 0F850600                 jne .prs50
  1646 000005B7 B80A00                   mov ax, 10
  1647 000005BA 8846FE                   mov [bp-2], al
  1648                                  
  1649                                  ;-269                 if (c=='t') c= 9;
  1650                                  
  1651                                  .prs50:
  1652 000005BD 8A46FE                   mov al, [bp-2]
  1653 000005C0 3C74                     cmp al, 116
  1654 000005C2 0F850600                 jne .prs51
  1655 000005C6 B80900                   mov ax, 9
  1656 000005C9 8846FE                   mov [bp-2], al
  1657                                  
  1658                                  ;-270             }
  1659                                  
  1660                                  .prs51:
  1661                                  
  1662                                  ;-271         }
  1663                                  
  1664                                  .prs49:
  1665                                  
  1666                                  ;-272         prc(c);
  1667                                  
  1668                                  .prs48:
  1669 000005CC 8A46FE                   mov al, byte [bp-2]
  1670 000005CF B400                     mov ah, 0
  1671 000005D1 50                       push ax
  1672 000005D2 E810FF                   call prc
  1673 000005D5 83C402                   add  sp, 2
  1674                                  
  1675                                  ;-273         s++;
  1676                                  
  1677 000005D8 FF4604                   inc  word[bp+4]
  1678                                  
  1679                                  ;-274     }
  1680                                  
  1681                                  
  1682                                  ;-275 }
  1683                                  
  1684 000005DB E978FF                   jmp .prs43
  1685                                  .prs44:
  1686                                  
  1687                                  ;-276 int eprnum(int n){//for docall1 procedure
  1688 000005DE C9                       LEAVE
  1689 000005DF C3                       ret
  1690                                  ENDP
  1691                                  
  1692                                  eprnum: PROC
  1693                                  
  1694                                  ;-277     int e;
  1695                                  
  1696                                  
  1697                                  ;-278     if(n<0) {
  1698                                  
  1699                                  ;Function : eprnum, Number of local variables: 2
  1700                                  ;   # type sign width addr used name   list of local variables
  1701                                  ;  200 var sign word   276 NULL n = bp+4
  1702                                  ;  201 var sign word   277 NULL e = bp-2;
  1703 000005E0 C8020000                 ENTER  2,0
  1704 000005E4 8B4604                   mov ax, [bp+4]
  1705 000005E7 83F800                   cmp ax, 0
  1706 000005EA 0F8D1400                 jge .eprnum52
  1707                                  
  1708                                  ;-279         eprc('-');
  1709                                  
  1710 000005EE 6A2D                     push 45
  1711 000005F0 E8B1FE                   call eprc
  1712 000005F3 83C402                   add  sp, 2
  1713                                  
  1714                                  ;-280         n=mkneg(n);
  1715                                  
  1716 000005F6 FF7604                   push word [bp+4]
  1717 000005F9 E8CBFA                   call mkneg
  1718 000005FC 83C402                   add  sp, 2
  1719 000005FF 894604                   mov [bp+4], ax
  1720                                  
  1721                                  ;-281     }
  1722                                  
  1723                                  
  1724                                  ;-282     if (n >= 10) {
  1725                                  
  1726                                  .eprnum52:
  1727 00000602 8B4604                   mov ax, [bp+4]
  1728 00000605 83F80A                   cmp ax, 10 ;unsigned : 1
  1729 00000608 0F8C1500                 jl  .eprnum53
  1730                                  
  1731                                  ;-283         e=n/10;
  1732                                  
  1733 0000060C 8B4604                   mov ax, [bp+4]
  1734 0000060F BB0A00                   mov bx, 10
  1735 00000612 99                       cwd
  1736 00000613 F7FB                     idiv bx
  1737 00000615 8946FE                   mov [bp-2], ax
  1738                                  
  1739                                  ;-284         eprnum(e);
  1740                                  
  1741 00000618 FF76FE                   push word [bp-2]
  1742 0000061B E8C2FF                   call eprnum
  1743 0000061E 83C402                   add  sp, 2
  1744                                  
  1745                                  ;-285     }
  1746                                  
  1747                                  
  1748                                  ;-286     n=n%10;
  1749                                  
  1750                                  .eprnum53:
  1751 00000621 8B4604                   mov ax, [bp+4]
  1752 00000624 BB0A00                   mov bx, 10
  1753 00000627 99                       cwd
  1754 00000628 F7FB                     idiv bx
  1755 0000062A 89D0                     mov ax, dx
  1756 0000062C 894604                   mov [bp+4], ax
  1757                                  
  1758                                  ;-287     n=n+'0';
  1759                                  
  1760 0000062F 8B4604                   mov ax, [bp+4]
  1761 00000632 83C030                   add ax, 48
  1762 00000635 894604                   mov [bp+4], ax
  1763                                  
  1764                                  ;-288     eprc(n);
  1765                                  
  1766 00000638 FF7604                   push word [bp+4]
  1767 0000063B E866FE                   call eprc
  1768 0000063E 83C402                   add  sp, 2
  1769                                  
  1770                                  ;-289 }
  1771                                  
  1772                                  
  1773                                  ;-290 int pint1 (int n){
  1774 00000641 C9                       LEAVE
  1775 00000642 C3                       ret
  1776                                  ENDP
  1777                                  
  1778                                  pint1: PROC
  1779                                  
  1780                                  ;-291     int e;
  1781                                  
  1782                                  
  1783                                  ;-292     if(n<0) {  prc('-');  n=mkneg(n); }
  1784                                  
  1785                                  ;Function : pint1, Number of local variables: 2
  1786                                  ;   # type sign width addr used name   list of local variables
  1787                                  ;  200 var sign word   290 NULL n = bp+4
  1788                                  ;  201 var sign word   291 NULL e = bp-2;
  1789 00000643 C8020000                 ENTER  2,0
  1790 00000647 8B4604                   mov ax, [bp+4]
  1791 0000064A 83F800                   cmp ax, 0
  1792 0000064D 0F8D1400                 jge .pint154
  1793 00000651 6A2D                     push 45
  1794 00000653 E88FFE                   call prc
  1795 00000656 83C402                   add  sp, 2
  1796 00000659 FF7604                   push word [bp+4]
  1797 0000065C E868FA                   call mkneg
  1798 0000065F 83C402                   add  sp, 2
  1799 00000662 894604                   mov [bp+4], ax
  1800                                  
  1801                                  ;-293     if (n >= 10) {
  1802                                  
  1803                                  .pint154:
  1804 00000665 8B4604                   mov ax, [bp+4]
  1805 00000668 83F80A                   cmp ax, 10 ;unsigned : 1
  1806 0000066B 0F8C1500                 jl  .pint155
  1807                                  
  1808                                  ;-294         e=n/10;
  1809                                  
  1810 0000066F 8B4604                   mov ax, [bp+4]
  1811 00000672 BB0A00                   mov bx, 10
  1812 00000675 99                       cwd
  1813 00000676 F7FB                     idiv bx
  1814 00000678 8946FE                   mov [bp-2], ax
  1815                                  
  1816                                  ;-295         pint1(e);
  1817                                  
  1818 0000067B FF76FE                   push word [bp-2]
  1819 0000067E E8C2FF                   call pint1
  1820 00000681 83C402                   add  sp, 2
  1821                                  
  1822                                  ;-296     }
  1823                                  
  1824                                  
  1825                                  ;-297     n=n%10;
  1826                                  
  1827                                  .pint155:
  1828 00000684 8B4604                   mov ax, [bp+4]
  1829 00000687 BB0A00                   mov bx, 10
  1830 0000068A 99                       cwd
  1831 0000068B F7FB                     idiv bx
  1832 0000068D 89D0                     mov ax, dx
  1833 0000068F 894604                   mov [bp+4], ax
  1834                                  
  1835                                  ;-298     n += '0';
  1836                                  
  1837 00000692 83460430                 add  word[bp+4], 48
  1838                                  
  1839                                  ;-299     prc(n);
  1840                                  
  1841 00000696 FF7604                   push word [bp+4]
  1842 00000699 E849FE                   call prc
  1843 0000069C 83C402                   add  sp, 2
  1844                                  
  1845                                  ;-300 }
  1846                                  
  1847                                  
  1848                                  ;-301 int prunsign1(unsigned int n) {
  1849 0000069F C9                       LEAVE
  1850 000006A0 C3                       ret
  1851                                  ENDP
  1852                                  
  1853                                  prunsign1: PROC
  1854                                  
  1855                                  ;-302     unsigned int e;
  1856                                  
  1857                                  
  1858                                  ;-303     if (n >= 10) {
  1859                                  
  1860                                  ;Function : prunsign1, Number of local variables: 2
  1861                                  ;   # type sign width addr used name   list of local variables
  1862                                  ;  200 var unsg word   301 NULL n = bp+4
  1863                                  ;  201 var unsg word   302 NULL e = bp-2;
  1864 000006A1 C8020000                 ENTER  2,0
  1865 000006A5 8B4604                   mov ax, [bp+4]
  1866 000006A8 83F80A                   cmp ax, 10 ;unsigned : 0
  1867 000006AB 0F821700                 jb  .prunsign156
  1868                                  
  1869                                  ;-304         e=n/10;
  1870                                  
  1871 000006AF 8B4604                   mov ax, [bp+4]
  1872 000006B2 BB0A00                   mov bx, 10
  1873 000006B5 BA0000                   mov dx, 0
  1874 000006B8 F7F3                     div bx
  1875 000006BA 8946FE                   mov [bp-2], ax
  1876                                  
  1877                                  ;-305         prunsign1(e);
  1878                                  
  1879 000006BD FF76FE                   push word [bp-2]
  1880 000006C0 E8DEFF                   call prunsign1
  1881 000006C3 83C402                   add  sp, 2
  1882                                  
  1883                                  ;-306     }
  1884                                  
  1885                                  
  1886                                  ;-307     n = n % 10; /*unsigned mod*/
  1887                                  
  1888                                  .prunsign156:
  1889 000006C6 8B4604                   mov ax, [bp+4]
  1890 000006C9 BB0A00                   mov bx, 10
  1891 000006CC BA0000                   mov dx, 0
  1892 000006CF F7F3                     div bx
  1893 000006D1 89D0                     mov ax, dx
  1894 000006D3 894604                   mov [bp+4], ax
  1895                                  
  1896                                  ;-308     n += '0';
  1897                                  
  1898 000006D6 83460430                 add  word[bp+4], 48
  1899                                  
  1900                                  ;-309     prc(n);
  1901                                  
  1902 000006DA FF7604                   push word [bp+4]
  1903 000006DD E805FE                   call prc
  1904 000006E0 83C402                   add  sp, 2
  1905                                  
  1906                                  ;-310 }
  1907                                  
  1908                                  
  1909                                  ;-311 int printint51(unsigned int j)  {
  1910 000006E3 C9                       LEAVE
  1911 000006E4 C3                       ret
  1912                                  ENDP
  1913                                  
  1914                                  printint51: PROC
  1915                                  
  1916                                  ;-312     if (j<10000) prc(32);
  1917                                  
  1918                                  ;Function : printint51, Number of local variables: 1
  1919                                  ;   # type sign width addr used name   list of local variables
  1920                                  ;  200 var unsg word   311 NULL j = bp+4;
  1921 000006E5 C8000000                 ENTER  0,0
  1922 000006E9 8B4604                   mov ax, [bp+4]
  1923 000006EC 3D1027                   cmp ax, 10000
  1924 000006EF 0F8D0800                 jge .printint5157
  1925 000006F3 6A20                     push 32
  1926 000006F5 E8EDFD                   call prc
  1927 000006F8 83C402                   add  sp, 2
  1928                                  
  1929                                  ;-313     if (j<1000) prc(32);
  1930                                  
  1931                                  .printint5157:
  1932 000006FB 8B4604                   mov ax, [bp+4]
  1933 000006FE 3DE803                   cmp ax, 1000
  1934 00000701 0F8D0800                 jge .printint5158
  1935 00000705 6A20                     push 32
  1936 00000707 E8DBFD                   call prc
  1937 0000070A 83C402                   add  sp, 2
  1938                                  
  1939                                  ;-314     if (j<100) prc(32);
  1940                                  
  1941                                  .printint5158:
  1942 0000070D 8B4604                   mov ax, [bp+4]
  1943 00000710 83F864                   cmp ax, 100
  1944 00000713 0F8D0800                 jge .printint5159
  1945 00000717 6A20                     push 32
  1946 00000719 E8C9FD                   call prc
  1947 0000071C 83C402                   add  sp, 2
  1948                                  
  1949                                  ;-315     if (j<10) prc(32);
  1950                                  
  1951                                  .printint5159:
  1952 0000071F 8B4604                   mov ax, [bp+4]
  1953 00000722 83F80A                   cmp ax, 10
  1954 00000725 0F8D0800                 jge .printint5160
  1955 00000729 6A20                     push 32
  1956 0000072B E8B7FD                   call prc
  1957 0000072E 83C402                   add  sp, 2
  1958                                  
  1959                                  ;-316     prunsign1(j);
  1960                                  
  1961                                  .printint5160:
  1962 00000731 FF7604                   push word [bp+4]
  1963 00000734 E86AFF                   call prunsign1
  1964 00000737 83C402                   add  sp, 2
  1965                                  
  1966                                  ;-317 }
  1967                                  
  1968                                  
  1969                                  ;-318 
  1970                                  
  1971                                  
  1972                                  ;-319 
  1973                                  
  1974                                  
  1975                                  ;-320 char doglobName[IDLENMAX];
  1976 0000073A C9                       LEAVE
  1977 0000073B C3                       ret
  1978                                  ENDP
  1979                                  section .bss
  1980                                  absolute 55840
  1981 0000DA20 <res 0000000F>          doglobName resb 15
  1982                                  section .text
  1983                                  
  1984                                  ;-321 int doglob() {
  1985                                  
  1986                                  
  1987                                  doglob: PROC
  1988                                  
  1989                                  ;-322     int i; int j; int isstrarr; isstrarr=0;
  1990                                  
  1991                                  ;Function : doglob, Number of local variables: 3
  1992                                  ;   # type sign width addr used name   list of local variables
  1993                                  ;  200 var sign word   322 NULL i = bp-2
  1994                                  ;  201 var sign word   322 NULL j = bp-4
  1995                                  ;  202 var sign word   322 NULL isstrarr = bp-6;
  1996 0000073C C8060000                 ENTER  6,0
  1997 00000740 B80000                   mov ax, 0
  1998 00000743 8946FA                   mov [bp-6], ax
  1999                                  
  2000                                  ;-323   if (GTop >= LSTART) error1("Global table full");
  2001                                  
  2002 00000746 A1[3900]                 mov ax, [GTop]
  2003 00000749 3DC800                   cmp ax, 200 ;unsigned : 1
  2004 0000074C 0F8C0900                 jl  .doglob61
  2005 00000750 68[910A]                 push doglob_0
  2006 00000753 E8DE35                   call error1
  2007 00000756 83C402                   add  sp, 2
  2008                                  
  2009                                  ;-324   if (iswidth == 0) error1("no VOID as var type");
  2010                                  
  2011                                  .doglob61:
  2012 00000759 A0[3600]                 mov al, [iswidth]
  2013 0000075C 3C00                     cmp al, 0
  2014 0000075E 0F850900                 jne .doglob62
  2015 00000762 68[A30A]                 push doglob_1
  2016 00000765 E8CC35                   call error1
  2017 00000768 83C402                   add  sp, 2
  2018                                  
  2019                                  ;-325   checknamelen();
  2020                                  
  2021                                  .doglob62:
  2022 0000076B E83FFC                   call checknamelen
  2023                                  
  2024                                  ;-326   if (checkName() != 0) error1("Variable already defined");
  2025                                  
  2026 0000076E E88305                   call checkName
  2027 00000771 3C00                     cmp al, 0
  2028 00000773 0F840900                 je  .doglob63
  2029 00000777 68[B70A]                 push doglob_2
  2030 0000077A E8B735                   call error1
  2031 0000077D 83C402                   add  sp, 2
  2032                                  
  2033                                  ;-327   if (istoken('[')) { istype='&';
  2034                                  
  2035                                  .doglob63:
  2036 00000780 6A5B                     push 91
  2037 00000782 E892FC                   call istoken
  2038 00000785 83C402                   add  sp, 2
  2039 00000788 08C0                     or  al, al
  2040 0000078A 0F84E201                 je .doglob64
  2041 0000078E B82600                   mov ax, 38
  2042 00000791 A2[3000]                 mov byte [istype], al
  2043                                  
  2044                                  ;-328     if (istoken(T_CONST)) {
  2045                                  
  2046 00000794 680101                   push 257
  2047 00000797 E87DFC                   call istoken
  2048 0000079A 83C402                   add  sp, 2
  2049 0000079D 08C0                     or  al, al
  2050 0000079F 0F84C200                 je .doglob65
  2051                                  
  2052                                  ;-329       prs("\nsection .bss\nabsolute ");
  2053                                  
  2054 000007A3 68[D00A]                 push doglob_3
  2055 000007A6 E8A3FD                   call prs
  2056 000007A9 83C402                   add  sp, 2
  2057                                  
  2058                                  ;-330       prunsign1(orgData);
  2059                                  
  2060 000007AC FF36[1200]               push word [orgData]
  2061 000007B0 E8EEFE                   call prunsign1
  2062 000007B3 83C402                   add  sp, 2
  2063                                  
  2064                                  ;-331       prs("\n"); prs(symbol);
  2065                                  
  2066 000007B6 68[EA0A]                 push doglob_4
  2067 000007B9 E890FD                   call prs
  2068 000007BC 83C402                   add  sp, 2
  2069 000007BF 8D06BB69                 lea  ax, [symbol]
  2070 000007C3 50                       push ax
  2071 000007C4 E885FD                   call prs
  2072 000007C7 83C402                   add  sp, 2
  2073                                  
  2074                                  ;-332       if (iswidth==1) prs(" resb ");
  2075                                  
  2076 000007CA A0[3600]                 mov al, [iswidth]
  2077 000007CD 3C01                     cmp al, 1
  2078 000007CF 0F850900                 jne .doglob66
  2079 000007D3 68[ED0A]                 push doglob_5
  2080 000007D6 E873FD                   call prs
  2081 000007D9 83C402                   add  sp, 2
  2082                                  
  2083                                  ;-333       if (iswidth==2) prs(" resw ");
  2084                                  
  2085                                  .doglob66:
  2086 000007DC A0[3600]                 mov al, [iswidth]
  2087 000007DF 3C02                     cmp al, 2
  2088 000007E1 0F850900                 jne .doglob67
  2089 000007E5 68[F40A]                 push doglob_6
  2090 000007E8 E861FD                   call prs
  2091 000007EB 83C402                   add  sp, 2
  2092                                  
  2093                                  ;-334       if (iswidth==4) prs(" resd ");
  2094                                  
  2095                                  .doglob67:
  2096 000007EE A0[3600]                 mov al, [iswidth]
  2097 000007F1 3C04                     cmp al, 4
  2098 000007F3 0F850900                 jne .doglob68
  2099 000007F7 68[FB0A]                 push doglob_7
  2100 000007FA E84FFD                   call prs
  2101 000007FD 83C402                   add  sp, 2
  2102                                  
  2103                                  ;-335       prunsign1(lexval);
  2104                                  
  2105                                  .doglob68:
  2106 00000800 FF36[2C00]               push word [lexval]
  2107 00000804 E89AFE                   call prunsign1
  2108 00000807 83C402                   add  sp, 2
  2109                                  
  2110                                  ;-336       prs("\nsection .text");
  2111                                  
  2112 0000080A 68[020B]                 push doglob_8
  2113 0000080D E83CFD                   call prs
  2114 00000810 83C402                   add  sp, 2
  2115                                  
  2116                                  ;-337       orgData=orgData+lexval;
  2117                                  
  2118 00000813 A1[1200]                 mov ax, [orgData]
  2119 00000816 0306[2C00]               add ax, [lexval]
  2120 0000081A A3[1200]                 mov word [orgData], ax
  2121                                  
  2122                                  ;-338       if (iswidth==2) orgData=orgData+lexval;
  2123                                  
  2124 0000081D A0[3600]                 mov al, [iswidth]
  2125 00000820 3C02                     cmp al, 2
  2126 00000822 0F850A00                 jne .doglob69
  2127 00000826 A1[1200]                 mov ax, [orgData]
  2128 00000829 0306[2C00]               add ax, [lexval]
  2129 0000082D A3[1200]                 mov word [orgData], ax
  2130                                  
  2131                                  ;-339       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  2132                                  
  2133                                  .doglob69:
  2134 00000830 A0[3600]                 mov al, [iswidth]
  2135 00000833 3C04                     cmp al, 4
  2136 00000835 0F851400                 jne .doglob70
  2137 00000839 A1[2C00]                 mov ax, [lexval]
  2138 0000083C BB0300                   mov bx, 3
  2139 0000083F F7E3                     mul bx
  2140 00000841 8946FE                   mov [bp-2], ax
  2141 00000844 A1[1200]                 mov ax, [orgData]
  2142 00000847 0346FE                   add ax, [bp-2]
  2143 0000084A A3[1200]                 mov word [orgData], ax
  2144                                  
  2145                                  ;-340       GData[GTop]=lexval; expect(']');
  2146                                  
  2147                                  .doglob70:
  2148 0000084D A1[2C00]                 mov ax, [lexval]
  2149 00000850 8B1E[3900]               mov bx, [GTop]
  2150 00000854 D1E3                     shl bx, 1
  2151 00000856 89873873                 mov [GData+bx], ax
  2152 0000085A 6A5D                     push 93
  2153 0000085C E8DAFB                   call expect
  2154 0000085F 83C402                   add  sp, 2
  2155                                  
  2156                                  ;-341     }else { expect(']');
  2157                                  
  2158 00000862 E90801                   jmp .doglob71
  2159                                  .doglob65:
  2160 00000865 6A5D                     push 93
  2161 00000867 E8CFFB                   call expect
  2162 0000086A 83C402                   add  sp, 2
  2163                                  
  2164                                  ;-342       if (iswidth != 1) error1("Only ByteArray allowed");
  2165                                  
  2166 0000086D A0[3600]                 mov al, [iswidth]
  2167 00000870 3C01                     cmp al, 1
  2168 00000872 0F840900                 je  .doglob72
  2169 00000876 68[120B]                 push doglob_9
  2170 00000879 E8B834                   call error1
  2171 0000087C 83C402                   add  sp, 2
  2172                                  
  2173                                  ;-343       prs("\n"); prs(symbol); prs(" db ");
  2174                                  
  2175                                  .doglob72:
  2176 0000087F 68[290B]                 push doglob_10
  2177 00000882 E8C7FC                   call prs
  2178 00000885 83C402                   add  sp, 2
  2179 00000888 8D06BB69                 lea  ax, [symbol]
  2180 0000088C 50                       push ax
  2181 0000088D E8BCFC                   call prs
  2182 00000890 83C402                   add  sp, 2
  2183 00000893 68[2C0B]                 push doglob_11
  2184 00000896 E8B3FC                   call prs
  2185 00000899 83C402                   add  sp, 2
  2186                                  
  2187                                  ;-344       isstrarr=1; strcpy(doglobName, symbol);
  2188                                  
  2189 0000089C B80100                   mov ax, 1
  2190 0000089F 8946FA                   mov [bp-6], ax
  2191 000008A2 8D06BB69                 lea  ax, [symbol]
  2192 000008A6 50                       push ax
  2193 000008A7 8D0620DA                 lea  ax, [doglobName]
  2194 000008AB 50                       push ax
  2195 000008AC E8A0F9                   call strcpy
  2196 000008AF 83C404                   add  sp, 4
  2197                                  
  2198                                  ;-345       expect('=');
  2199                                  
  2200 000008B2 6A3D                     push 61
  2201 000008B4 E882FB                   call expect
  2202 000008B7 83C402                   add  sp, 2
  2203                                  
  2204                                  ;-346       if (istoken(T_STRING)) {
  2205                                  
  2206 000008BA 680201                   push 258
  2207 000008BD E857FB                   call istoken
  2208 000008C0 83C402                   add  sp, 2
  2209 000008C3 08C0                     or  al, al
  2210 000008C5 0F844200                 je .doglob73
  2211                                  
  2212                                  ;-347         prc(34); prscomment(symbol); prc(34); prs(",0");
  2213                                  
  2214 000008C9 6A22                     push 34
  2215 000008CB E817FC                   call prc
  2216 000008CE 83C402                   add  sp, 2
  2217 000008D1 8D06BB69                 lea  ax, [symbol]
  2218 000008D5 50                       push ax
  2219 000008D6 E837FC                   call prscomment
  2220 000008D9 83C402                   add  sp, 2
  2221 000008DC 6A22                     push 34
  2222 000008DE E804FC                   call prc
  2223 000008E1 83C402                   add  sp, 2
  2224 000008E4 68[310B]                 push doglob_12
  2225 000008E7 E862FC                   call prs
  2226 000008EA 83C402                   add  sp, 2
  2227                                  
  2228                                  ;-348         i=strlen(symbol); GData[GTop]=i; }
  2229                                  
  2230 000008ED 8D06BB69                 lea  ax, [symbol]
  2231 000008F1 50                       push ax
  2232 000008F2 E832F9                   call strlen
  2233 000008F5 83C402                   add  sp, 2
  2234 000008F8 8946FE                   mov [bp-2], ax
  2235 000008FB 8B46FE                   mov ax, [bp-2]
  2236 000008FE 8B1E[3900]               mov bx, [GTop]
  2237 00000902 D1E3                     shl bx, 1
  2238 00000904 89873873                 mov [GData+bx], ax
  2239                                  
  2240                                  ;-349       else if (istoken('{' )) { i=0;
  2241                                  
  2242 00000908 E96200                   jmp .doglob74
  2243                                  .doglob73:
  2244 0000090B 6A7B                     push 123
  2245 0000090D E807FB                   call istoken
  2246 00000910 83C402                   add  sp, 2
  2247 00000913 08C0                     or  al, al
  2248 00000915 0F844B00                 je .doglob75
  2249 00000919 B80000                   mov ax, 0
  2250 0000091C 8946FE                   mov [bp-2], ax
  2251                                  
  2252                                  ;-350         do { if(i) prc(',');
  2253                                  
  2254                                  .doglob76:
  2255 0000091F 8B46FE                   mov ax, [bp-2]
  2256 00000922 08C0                     or  al, al
  2257 00000924 0F840800                 je .doglob77
  2258 00000928 6A2C                     push 44
  2259 0000092A E8B8FB                   call prc
  2260 0000092D 83C402                   add  sp, 2
  2261                                  
  2262                                  ;-351           expect(T_CONST); prunsign1(lexval); i=1; }
  2263                                  
  2264                                  .doglob77:
  2265 00000930 680101                   push 257
  2266 00000933 E803FB                   call expect
  2267 00000936 83C402                   add  sp, 2
  2268 00000939 FF36[2C00]               push word [lexval]
  2269 0000093D E861FD                   call prunsign1
  2270 00000940 83C402                   add  sp, 2
  2271 00000943 B80100                   mov ax, 1
  2272 00000946 8946FE                   mov [bp-2], ax
  2273                                  
  2274                                  ;-352         while (istoken(',')); expect('}'); }
  2275                                  
  2276 00000949 6A2C                     push 44
  2277 0000094B E8C9FA                   call istoken
  2278 0000094E 83C402                   add  sp, 2
  2279 00000951 08C0                     or  al, al
  2280 00000953 0F840200                 je .doglob78
  2281 00000957 EBC6                     jmp .doglob76
  2282                                  .doglob78:
  2283 00000959 6A7D                     push 125
  2284 0000095B E8DBFA                   call expect
  2285 0000095E 83C402                   add  sp, 2
  2286                                  
  2287                                  ;-353       else error1("String or number array expected");
  2288                                  
  2289 00000961 E90900                   jmp .doglob79
  2290                                  .doglob75:
  2291 00000964 68[340B]                 push doglob_13
  2292 00000967 E8CA33                   call error1
  2293 0000096A 83C402                   add  sp, 2
  2294                                  
  2295                                  ;-354       };
  2296                                  
  2297                                  .doglob79:
  2298                                  .doglob74:
  2299                                  .doglob71:
  2300                                  
  2301                                  ;-355   }else { //expect('=');
  2302                                  
  2303 0000096D E99E00                   jmp .doglob80
  2304                                  .doglob64:
  2305                                  
  2306                                  ;-356     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  2307                                  
  2308 00000970 68[540B]                 push doglob_14
  2309 00000973 E8D6FB                   call prs
  2310 00000976 83C402                   add  sp, 2
  2311 00000979 8D06BB69                 lea  ax, [symbol]
  2312 0000097D 50                       push ax
  2313 0000097E E8CBFB                   call prs
  2314 00000981 83C402                   add  sp, 2
  2315 00000984 A0[3000]                 mov al, [istype]
  2316 00000987 3C2A                     cmp al, 42
  2317 00000989 0F850C00                 jne .doglob81
  2318 0000098D 68[570B]                 push doglob_15
  2319 00000990 E8B9FB                   call prs
  2320 00000993 83C402                   add  sp, 2
  2321                                  
  2322                                  ;-357     else {
  2323                                  
  2324 00000996 E93300                   jmp .doglob82
  2325                                  .doglob81:
  2326                                  
  2327                                  ;-358       if      (iswidth==1) prs(" db ");
  2328                                  
  2329 00000999 A0[3600]                 mov al, [iswidth]
  2330 0000099C 3C01                     cmp al, 1
  2331 0000099E 0F850C00                 jne .doglob83
  2332 000009A2 68[5C0B]                 push doglob_16
  2333 000009A5 E8A4FB                   call prs
  2334 000009A8 83C402                   add  sp, 2
  2335                                  
  2336                                  ;-359       else if (iswidth==2) prs(" dw ");
  2337                                  
  2338 000009AB E91E00                   jmp .doglob84
  2339                                  .doglob83:
  2340 000009AE A0[3600]                 mov al, [iswidth]
  2341 000009B1 3C02                     cmp al, 2
  2342 000009B3 0F850C00                 jne .doglob85
  2343 000009B7 68[610B]                 push doglob_17
  2344 000009BA E88FFB                   call prs
  2345 000009BD 83C402                   add  sp, 2
  2346                                  
  2347                                  ;-360       else                 prs(" dd ");
  2348                                  
  2349 000009C0 E90900                   jmp .doglob86
  2350                                  .doglob85:
  2351 000009C3 68[660B]                 push doglob_18
  2352 000009C6 E883FB                   call prs
  2353 000009C9 83C402                   add  sp, 2
  2354                                  
  2355                                  ;-361     }
  2356                                  
  2357                                  .doglob86:
  2358                                  .doglob84:
  2359                                  
  2360                                  ;-362     if(istoken('-')) prc('-');
  2361                                  
  2362                                  .doglob82:
  2363 000009CC 6A2D                     push 45
  2364 000009CE E846FA                   call istoken
  2365 000009D1 83C402                   add  sp, 2
  2366 000009D4 08C0                     or  al, al
  2367 000009D6 0F840800                 je .doglob87
  2368 000009DA 6A2D                     push 45
  2369 000009DC E806FB                   call prc
  2370 000009DF 83C402                   add  sp, 2
  2371                                  
  2372                                  ;-363     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  2373                                  
  2374                                  .doglob87:
  2375 000009E2 6A3D                     push 61
  2376 000009E4 E830FA                   call istoken
  2377 000009E7 83C402                   add  sp, 2
  2378 000009EA 08C0                     or  al, al
  2379 000009EC 0F841600                 je .doglob88
  2380 000009F0 680101                   push 257
  2381 000009F3 E843FA                   call expect
  2382 000009F6 83C402                   add  sp, 2
  2383 000009F9 FF36[2C00]               push word [lexval]
  2384 000009FD E8A1FC                   call prunsign1
  2385 00000A00 83C402                   add  sp, 2
  2386                                  
  2387                                  ;-364     else prunsign1(0); }
  2388                                  
  2389 00000A03 E90800                   jmp .doglob89
  2390                                  .doglob88:
  2391 00000A06 6A00                     push 0
  2392 00000A08 E896FC                   call prunsign1
  2393 00000A0B 83C402                   add  sp, 2
  2394                                  .doglob89:
  2395                                  
  2396                                  ;-365   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  2397                                  
  2398                                  .doglob80:
  2399 00000A0E A0[3300]                 mov al, [issign]
  2400 00000A11 8B1E[3900]               mov bx, [GTop]
  2401 00000A15 8887306C                 mov [GSign+bx], al
  2402 00000A19 A0[3600]                 mov al, [iswidth]
  2403 00000A1C 8B1E[3900]               mov bx, [GTop]
  2404 00000A20 88875C6D                 mov [GWidth+bx], al
  2405 00000A24 A0[3000]                 mov al, [istype]
  2406 00000A27 8B1E[3900]               mov bx, [GTop]
  2407 00000A2B 8887046B                 mov [GType+bx], al
  2408                                  
  2409                                  ;-366   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  2410                                  
  2411 00000A2F A1[6A00]                 mov ax, [lineno]
  2412 00000A32 83E801                   sub ax, 1
  2413 00000A35 8B1E[3900]               mov bx, [GTop]
  2414 00000A39 D1E3                     shl bx, 1
  2415 00000A3B 8987886E                 mov [GAdr+bx], ax
  2416 00000A3F B80000                   mov ax, 0
  2417 00000A42 8B1E[3900]               mov bx, [GTop]
  2418 00000A46 D1E3                     shl bx, 1
  2419 00000A48 8987E070                 mov [GUsed+bx], ax
  2420                                  
  2421                                  ;-367   pt=adrofname(GTop);
  2422                                  
  2423 00000A4C FF36[3900]               push word [GTop]
  2424 00000A50 E8CF01                   call adrofname
  2425 00000A53 83C402                   add  sp, 2
  2426 00000A56 A3[6E00]                 mov word [pt], ax
  2427                                  
  2428                                  ;-368   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  2429                                  
  2430 00000A59 8B46FA                   mov ax, [bp-6]
  2431 00000A5C 08C0                     or  al, al
  2432 00000A5E 0F841200                 je .doglob90
  2433 00000A62 8D0620DA                 lea  ax, [doglobName]
  2434 00000A66 50                       push ax
  2435 00000A67 FF36[6E00]               push word [pt]
  2436 00000A6B E8E1F7                   call strcpy
  2437 00000A6E 83C404                   add  sp, 4
  2438 00000A71 E90F00                   jmp .doglob91
  2439                                  .doglob90:
  2440 00000A74 8D06BB69                 lea  ax, [symbol]
  2441 00000A78 50                       push ax
  2442 00000A79 FF36[6E00]               push word [pt]
  2443 00000A7D E8CFF7                   call strcpy
  2444 00000A80 83C404                   add  sp, 4
  2445                                  
  2446                                  ;-369   GTop++; expect(';'); }
  2447                                  
  2448                                  .doglob91:
  2449 00000A83 FF06[3900]               inc  word[GTop]
  2450 00000A87 6A3B                     push 59
  2451 00000A89 E8ADF9                   call expect
  2452 00000A8C 83C402                   add  sp, 2
  2453                                  
  2454                                  ;-370 
  2455                                  
  2456                                  
  2457                                  ;-371 int gettypes(int i) {int j; char c;
  2458 00000A8F C9                       LEAVE
  2459 00000A90 C3                       ret
  2460 00000A91 476C6F62616C207461-     doglob_0 db "Global table full",0
  2461 00000A9A 626C652066756C6C00 
  2462 00000AA3 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  2463 00000AAC 732076617220747970-
  2464 00000AB5 6500               
  2465 00000AB7 5661726961626C6520-     doglob_2 db "Variable already defined",0
  2466 00000AC0 616C72656164792064-
  2467 00000AC9 6566696E656400     
  2468 00000AD0 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  2469 00000AD9 202E6273735C6E6162-
  2470 00000AE2 736F6C7574652000   
  2471 00000AEA 5C6E00                  doglob_4 db "\n",0
  2472 00000AED 20726573622000          doglob_5 db " resb ",0
  2473 00000AF4 20726573772000          doglob_6 db " resw ",0
  2474 00000AFB 20726573642000          doglob_7 db " resd ",0
  2475 00000B02 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  2476 00000B0B 202E7465787400     
  2477 00000B12 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  2478 00000B1B 417272617920616C6C-
  2479 00000B24 6F77656400         
  2480 00000B29 5C6E00                  doglob_10 db "\n",0
  2481 00000B2C 2064622000              doglob_11 db " db ",0
  2482 00000B31 2C3000                  doglob_12 db ",0",0
  2483 00000B34 537472696E67206F72-     doglob_13 db "String or number array expected",0
  2484 00000B3D 206E756D6265722061-
  2485 00000B46 727261792065787065-
  2486 00000B4F 6374656400         
  2487 00000B54 5C6E00                  doglob_14 db "\n",0
  2488 00000B57 2064772000              doglob_15 db " dw ",0
  2489 00000B5C 2064622000              doglob_16 db " db ",0
  2490 00000B61 2064772000              doglob_17 db " dw ",0
  2491 00000B66 2064642000              doglob_18 db " dd ",0
  2492                                  ENDP
  2493                                  
  2494                                  gettypes: PROC
  2495                                  
  2496                                  ;-372   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  2497                                  
  2498                                  ;Function : gettypes, Number of local variables: 3
  2499                                  ;   # type sign width addr used name   list of local variables
  2500                                  ;  200 var sign word   371 NULL i = bp+4
  2501                                  ;  201 var sign word   371 NULL j = bp-2
  2502                                  ;  202 var sign byte   371 NULL c = bp-4;
  2503 00000B6B C8040000                 ENTER  4,0
  2504 00000B6F 8B5E04                   mov bx, [bp+4]
  2505 00000B72 8A87306C                 mov al, [GSign + bx]
  2506 00000B76 8846FC                   mov [bp-4], al
  2507 00000B79 8A46FC                   mov al, [bp-4]
  2508 00000B7C 3C53                     cmp al, 83
  2509 00000B7E 0F850900                 jne .gettypes92
  2510 00000B82 B80100                   mov ax, 1
  2511 00000B85 A3[3100]                 mov word [signi], ax
  2512 00000B88 E90600                   jmp .gettypes93
  2513                                  .gettypes92:
  2514 00000B8B B80000                   mov ax, 0
  2515 00000B8E A3[3100]                 mov word [signi], ax
  2516                                  
  2517                                  ;-373   c=GWidth[i]; widthi=0;wi=0;
  2518                                  
  2519                                  .gettypes93:
  2520 00000B91 8B5E04                   mov bx, [bp+4]
  2521 00000B94 8A875C6D                 mov al, [GWidth + bx]
  2522 00000B98 8846FC                   mov [bp-4], al
  2523 00000B9B B80000                   mov ax, 0
  2524 00000B9E A3[3400]                 mov word [widthi], ax
  2525 00000BA1 B80000                   mov ax, 0
  2526 00000BA4 A3[3700]                 mov word [wi], ax
  2527                                  
  2528                                  ;-374   if (c==1) {widthi=1;wi=1;}
  2529                                  
  2530 00000BA7 8A46FC                   mov al, [bp-4]
  2531 00000BAA 3C01                     cmp al, 1
  2532 00000BAC 0F850C00                 jne .gettypes94
  2533 00000BB0 B80100                   mov ax, 1
  2534 00000BB3 A3[3400]                 mov word [widthi], ax
  2535 00000BB6 B80100                   mov ax, 1
  2536 00000BB9 A3[3700]                 mov word [wi], ax
  2537                                  
  2538                                  ;-375   if (c==2) {widthi=2;wi=2;}
  2539                                  
  2540                                  .gettypes94:
  2541 00000BBC 8A46FC                   mov al, [bp-4]
  2542 00000BBF 3C02                     cmp al, 2
  2543 00000BC1 0F850C00                 jne .gettypes95
  2544 00000BC5 B80200                   mov ax, 2
  2545 00000BC8 A3[3400]                 mov word [widthi], ax
  2546 00000BCB B80200                   mov ax, 2
  2547 00000BCE A3[3700]                 mov word [wi], ax
  2548                                  
  2549                                  ;-376   if (c==4) {widthi=4;wi=4;}
  2550                                  
  2551                                  .gettypes95:
  2552 00000BD1 8A46FC                   mov al, [bp-4]
  2553 00000BD4 3C04                     cmp al, 4
  2554 00000BD6 0F850C00                 jne .gettypes96
  2555 00000BDA B80400                   mov ax, 4
  2556 00000BDD A3[3400]                 mov word [widthi], ax
  2557 00000BE0 B80400                   mov ax, 4
  2558 00000BE3 A3[3700]                 mov word [wi], ax
  2559                                  
  2560                                  ;-377   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  2561                                  
  2562                                  .gettypes96:
  2563 00000BE6 8B5E04                   mov bx, [bp+4]
  2564 00000BE9 8A87046B                 mov al, [GType + bx]
  2565 00000BED 8846FC                   mov [bp-4], al
  2566 00000BF0 B80000                   mov ax, 0
  2567 00000BF3 A3[2E00]                 mov word [typei], ax
  2568 00000BF6 8A46FC                   mov al, [bp-4]
  2569 00000BF9 3C2A                     cmp al, 42
  2570 00000BFB 0F850C00                 jne .gettypes97
  2571 00000BFF B80100                   mov ax, 1
  2572 00000C02 A3[2E00]                 mov word [typei], ax
  2573 00000C05 B80200                   mov ax, 2
  2574 00000C08 A3[3700]                 mov word [wi], ax
  2575                                  
  2576                                  ;-378   if (c=='&')  typei=2;
  2577                                  
  2578                                  .gettypes97:
  2579 00000C0B 8A46FC                   mov al, [bp-4]
  2580 00000C0E 3C26                     cmp al, 38
  2581 00000C10 0F850600                 jne .gettypes98
  2582 00000C14 B80200                   mov ax, 2
  2583 00000C17 A3[2E00]                 mov word [typei], ax
  2584                                  
  2585                                  ;-379   return i; }
  2586                                  
  2587                                  .gettypes98:
  2588 00000C1A 8B4604                   mov ax, [bp+4]
  2589 00000C1D E90000                   jmp .retngettypes
  2590                                  
  2591                                  ;-380 int adrofname(unsigned int i) { adrF(GNameField, i); }
  2592                                  
  2593 00000C20 C9                       .retngettypes: LEAVE
  2594 00000C21 C3                       ret
  2595                                  ENDP
  2596                                  
  2597                                  adrofname: PROC
  2598                                  ;Function : adrofname, Number of local variables: 1
  2599                                  ;   # type sign width addr used name   list of local variables
  2600                                  ;  200 var unsg word   380 NULL i = bp+4;
  2601 00000C22 C8000000                 ENTER  0,0
  2602 00000C26 FF7604                   push word [bp+4]
  2603 00000C29 8D069075                 lea  ax, [GNameField]
  2604 00000C2D 50                       push ax
  2605 00000C2E E80500                   call adrF
  2606 00000C31 83C404                   add  sp, 4
  2607                                  
  2608                                  ;-381 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  2609 00000C34 C9                       LEAVE
  2610 00000C35 C3                       ret
  2611                                  ENDP
  2612                                  
  2613                                  adrF: PROC
  2614                                  ;Function : adrF, Number of local variables: 2
  2615                                  ;   # type sign width addr used name   list of local variables
  2616                                  ;  200 ptr sign byte   381 NULL s = bp+4
  2617                                  ;  201 var unsg word   381 NULL i = bp+6;
  2618 00000C36 C8000000                 ENTER  0,0
  2619 00000C3A 8B4606                   mov ax, [bp+6]
  2620 00000C3D C1E004                   shl ax, 4
  2621                                  
  2622                                  ;-382   __asm{ add ax, [bp+4]  ; offset s } }
  2623                                  
  2624 00000C40 034604                   add ax, [bp+4]  ; offset s 
  2625                                  
  2626                                  ;-383 int printName(unsigned int i) {int j;
  2627 00000C43 C9                       LEAVE
  2628 00000C44 C3                       ret
  2629                                  ENDP
  2630                                  
  2631                                  printName: PROC
  2632                                  
  2633                                  ;-384   if (i < LSTART) { i=adrofname(i); prs(i); }
  2634                                  
  2635                                  ;Function : printName, Number of local variables: 2
  2636                                  ;   # type sign width addr used name   list of local variables
  2637                                  ;  200 var unsg word   383 NULL i = bp+4
  2638                                  ;  201 var sign word   383 NULL j = bp-2;
  2639 00000C45 C8020000                 ENTER  2,0
  2640 00000C49 8B4604                   mov ax, [bp+4]
  2641 00000C4C 3DC800                   cmp ax, 200
  2642 00000C4F 0F8D1800                 jge .printName99
  2643 00000C53 FF7604                   push word [bp+4]
  2644 00000C56 E8C9FF                   call adrofname
  2645 00000C59 83C402                   add  sp, 2
  2646 00000C5C 894604                   mov [bp+4], ax
  2647 00000C5F FF7604                   push word [bp+4]
  2648 00000C62 E8E7F8                   call prs
  2649 00000C65 83C402                   add  sp, 2
  2650                                  
  2651                                  ;-385   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  2652                                  
  2653 00000C68 E93800                   jmp .printName100
  2654                                  .printName99:
  2655 00000C6B 68[A50C]                 push printName_0
  2656 00000C6E E8DBF8                   call prs
  2657 00000C71 83C402                   add  sp, 2
  2658 00000C74 8B5E04                   mov bx, [bp+4]
  2659 00000C77 D1E3                     shl bx, 1
  2660 00000C79 8B873873                 mov ax, [GData + bx]
  2661 00000C7D 8946FE                   mov [bp-2], ax
  2662 00000C80 8B46FE                   mov ax, [bp-2]
  2663 00000C83 83F800                   cmp ax, 0
  2664 00000C86 0F8E0800                 jle .printName101
  2665 00000C8A 6A2B                     push 43
  2666 00000C8C E856F8                   call prc
  2667 00000C8F 83C402                   add  sp, 2
  2668                                  .printName101:
  2669 00000C92 FF76FE                   push word [bp-2]
  2670 00000C95 E8ABF9                   call pint1
  2671 00000C98 83C402                   add  sp, 2
  2672 00000C9B 6A5D                     push 93
  2673 00000C9D E845F8                   call prc
  2674 00000CA0 83C402                   add  sp, 2
  2675                                  
  2676                                  ;-386 }
  2677                                  
  2678                                  .printName100:
  2679                                  
  2680                                  ;-387 int searchname() { unsigned int i;
  2681 00000CA3 C9                       LEAVE
  2682 00000CA4 C3                       ret
  2683 00000CA5 5B627000                printName_0 db "[bp",0
  2684                                  ENDP
  2685                                  
  2686                                  searchname: PROC
  2687                                  
  2688                                  ;-388   i=checkName(); if (i == 0) error1("Variable unknown");
  2689                                  
  2690                                  ;Function : searchname, Number of local variables: 1
  2691                                  ;   # type sign width addr used name   list of local variables
  2692                                  ;  200 var unsg word   387 NULL i = bp-2;
  2693 00000CA9 C8020000                 ENTER  2,0
  2694 00000CAD E84400                   call checkName
  2695 00000CB0 8946FE                   mov [bp-2], ax
  2696 00000CB3 8B46FE                   mov ax, [bp-2]
  2697 00000CB6 83F800                   cmp ax, 0
  2698 00000CB9 0F850900                 jne .searchname102
  2699 00000CBD 68[E30C]                 push searchname_0
  2700 00000CC0 E87130                   call error1
  2701 00000CC3 83C402                   add  sp, 2
  2702                                  
  2703                                  ;-389   GUsed[i]=GUsed[i] + 1; return i;
  2704                                  
  2705                                  .searchname102:
  2706 00000CC6 8B5EFE                   mov bx, [bp-2]
  2707 00000CC9 D1E3                     shl bx, 1
  2708 00000CCB 8B87E070                 mov ax, [GUsed + bx]
  2709 00000CCF 83C001                   add ax, 1
  2710 00000CD2 8B5EFE                   mov bx, [bp-2]
  2711 00000CD5 D1E3                     shl bx, 1
  2712 00000CD7 8987E070                 mov [GUsed+bx], ax
  2713 00000CDB 8B46FE                   mov ax, [bp-2]
  2714 00000CDE E90000                   jmp .retnsearchname
  2715                                  
  2716                                  ;-390 }
  2717                                  
  2718                                  
  2719                                  ;-391 int checkName() { unsigned int i; unsigned int j;
  2720                                  
  2721 00000CE1 C9                       .retnsearchname: LEAVE
  2722 00000CE2 C3                       ret
  2723 00000CE3 5661726961626C6520-     searchname_0 db "Variable unknown",0
  2724 00000CEC 756E6B6E6F776E00   
  2725                                  ENDP
  2726                                  
  2727                                  checkName: PROC
  2728                                  
  2729                                  ;-392   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2730                                  
  2731                                  ;Function : checkName, Number of local variables: 2
  2732                                  ;   # type sign width addr used name   list of local variables
  2733                                  ;  200 var unsg word   391 NULL i = bp-2
  2734                                  ;  201 var unsg word   391 NULL j = bp-4;
  2735 00000CF4 C8040000                 ENTER  4,0
  2736 00000CF8 B8C800                   mov ax, 200
  2737 00000CFB 8946FE                   mov [bp-2], ax
  2738                                  .checkName103:
  2739 00000CFE 8B46FE                   mov ax, [bp-2]
  2740 00000D01 3B06[3B00]               cmp ax, [LTop]
  2741 00000D05 0F8D2B00                 jge .checkName104
  2742 00000D09 FF76FE                   push word [bp-2]
  2743 00000D0C E813FF                   call adrofname
  2744 00000D0F 83C402                   add  sp, 2
  2745 00000D12 8946FC                   mov [bp-4], ax
  2746 00000D15 FF76FC                   push word [bp-4]
  2747 00000D18 8D06BB69                 lea  ax, [symbol]
  2748 00000D1C 50                       push ax
  2749 00000D1D E865F5                   call eqstr
  2750 00000D20 83C404                   add  sp, 4
  2751 00000D23 08C0                     or  al, al
  2752 00000D25 0F840600                 je .checkName105
  2753 00000D29 8B46FE                   mov ax, [bp-2]
  2754 00000D2C E94700                   jmp .retncheckName
  2755                                  .checkName105:
  2756 00000D2F FF46FE                   inc  word[bp-2]
  2757                                  
  2758                                  ;-393   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2759                                  
  2760 00000D32 EBCA                     jmp .checkName103
  2761                                  .checkName104:
  2762 00000D34 B80100                   mov ax, 1
  2763 00000D37 8946FE                   mov [bp-2], ax
  2764                                  .checkName106:
  2765 00000D3A 8B46FE                   mov ax, [bp-2]
  2766 00000D3D 3B06[3900]               cmp ax, [GTop]
  2767 00000D41 0F8D2B00                 jge .checkName107
  2768 00000D45 FF76FE                   push word [bp-2]
  2769 00000D48 E8D7FE                   call adrofname
  2770 00000D4B 83C402                   add  sp, 2
  2771 00000D4E 8946FC                   mov [bp-4], ax
  2772 00000D51 FF76FC                   push word [bp-4]
  2773 00000D54 8D06BB69                 lea  ax, [symbol]
  2774 00000D58 50                       push ax
  2775 00000D59 E829F5                   call eqstr
  2776 00000D5C 83C404                   add  sp, 4
  2777 00000D5F 08C0                     or  al, al
  2778 00000D61 0F840600                 je .checkName108
  2779 00000D65 8B46FE                   mov ax, [bp-2]
  2780 00000D68 E90B00                   jmp .retncheckName
  2781                                  .checkName108:
  2782 00000D6B FF46FE                   inc  word[bp-2]
  2783                                  
  2784                                  ;-394   return 0;
  2785                                  
  2786 00000D6E EBCA                     jmp .checkName106
  2787                                  .checkName107:
  2788 00000D70 B80000                   mov ax, 0
  2789 00000D73 E90000                   jmp .retncheckName
  2790                                  
  2791                                  ;-395 }
  2792                                  
  2793                                  
  2794                                  ;-396 int typeName() { int m; //0=V,1=*,2=&
  2795                                  
  2796 00000D76 C9                       .retncheckName: LEAVE
  2797 00000D77 C3                       ret
  2798                                  ENDP
  2799                                  
  2800                                  typeName: PROC
  2801                                  
  2802                                  ;-397     issign='S';
  2803                                  
  2804                                  ;Function : typeName, Number of local variables: 1
  2805                                  ;   # type sign width addr used name   list of local variables
  2806                                  ;  200 var sign word   396 NULL m = bp-2;
  2807 00000D78 C8020000                 ENTER  2,0
  2808 00000D7C B85300                   mov ax, 83
  2809 00000D7F A2[3300]                 mov byte [issign], al
  2810                                  
  2811                                  ;-398     if(istoken(T_SIGNED))   issign='S';
  2812                                  
  2813 00000D82 681302                   push 531
  2814 00000D85 E88FF6                   call istoken
  2815 00000D88 83C402                   add  sp, 2
  2816 00000D8B 08C0                     or  al, al
  2817 00000D8D 0F840600                 je .typeName109
  2818 00000D91 B85300                   mov ax, 83
  2819 00000D94 A2[3300]                 mov byte [issign], al
  2820                                  
  2821                                  ;-399     if(istoken(T_UNSIGNED)) issign='U';
  2822                                  
  2823                                  .typeName109:
  2824 00000D97 681402                   push 532
  2825 00000D9A E87AF6                   call istoken
  2826 00000D9D 83C402                   add  sp, 2
  2827 00000DA0 08C0                     or  al, al
  2828 00000DA2 0F840600                 je .typeName110
  2829 00000DA6 B85500                   mov ax, 85
  2830 00000DA9 A2[3300]                 mov byte [issign], al
  2831                                  
  2832                                  ;-400     iswidth=2;
  2833                                  
  2834                                  .typeName110:
  2835 00000DAC B80200                   mov ax, 2
  2836 00000DAF A2[3600]                 mov byte [iswidth], al
  2837                                  
  2838                                  ;-401     if(istoken(T_VOID))     iswidth=0;
  2839                                  
  2840 00000DB2 681102                   push 529
  2841 00000DB5 E85FF6                   call istoken
  2842 00000DB8 83C402                   add  sp, 2
  2843 00000DBB 08C0                     or  al, al
  2844 00000DBD 0F840600                 je .typeName111
  2845 00000DC1 B80000                   mov ax, 0
  2846 00000DC4 A2[3600]                 mov byte [iswidth], al
  2847                                  
  2848                                  ;-402     if(istoken(T_CHAR))     iswidth=1;
  2849                                  
  2850                                  .typeName111:
  2851 00000DC7 681202                   push 530
  2852 00000DCA E84AF6                   call istoken
  2853 00000DCD 83C402                   add  sp, 2
  2854 00000DD0 08C0                     or  al, al
  2855 00000DD2 0F840600                 je .typeName112
  2856 00000DD6 B80100                   mov ax, 1
  2857 00000DD9 A2[3600]                 mov byte [iswidth], al
  2858                                  
  2859                                  ;-403     if(istoken(T_INT))      iswidth=2;
  2860                                  
  2861                                  .typeName112:
  2862 00000DDC 680502                   push 517
  2863 00000DDF E835F6                   call istoken
  2864 00000DE2 83C402                   add  sp, 2
  2865 00000DE5 08C0                     or  al, al
  2866 00000DE7 0F840600                 je .typeName113
  2867 00000DEB B80200                   mov ax, 2
  2868 00000DEE A2[3600]                 mov byte [iswidth], al
  2869                                  
  2870                                  ;-404     if(istoken(T_LONG))     iswidth=4;
  2871                                  
  2872                                  .typeName113:
  2873 00000DF1 681502                   push 533
  2874 00000DF4 E820F6                   call istoken
  2875 00000DF7 83C402                   add  sp, 2
  2876 00000DFA 08C0                     or  al, al
  2877 00000DFC 0F840600                 je .typeName114
  2878 00000E00 B80400                   mov ax, 4
  2879 00000E03 A2[3600]                 mov byte [iswidth], al
  2880                                  
  2881                                  ;-405     istype='V';
  2882                                  
  2883                                  .typeName114:
  2884 00000E06 B85600                   mov ax, 86
  2885 00000E09 A2[3000]                 mov byte [istype], al
  2886                                  
  2887                                  ;-406     m=0;
  2888                                  
  2889 00000E0C B80000                   mov ax, 0
  2890 00000E0F 8946FE                   mov [bp-2], ax
  2891                                  
  2892                                  ;-407     if(istoken('*'))  {istype='*'; m=1;}
  2893                                  
  2894 00000E12 6A2A                     push 42
  2895 00000E14 E800F6                   call istoken
  2896 00000E17 83C402                   add  sp, 2
  2897 00000E1A 08C0                     or  al, al
  2898 00000E1C 0F840C00                 je .typeName115
  2899 00000E20 B82A00                   mov ax, 42
  2900 00000E23 A2[3000]                 mov byte [istype], al
  2901 00000E26 B80100                   mov ax, 1
  2902 00000E29 8946FE                   mov [bp-2], ax
  2903                                  
  2904                                  ;-408     if(istoken('&'))  {istype='&'; m=2;}
  2905                                  
  2906                                  .typeName115:
  2907 00000E2C 6A26                     push 38
  2908 00000E2E E8E6F5                   call istoken
  2909 00000E31 83C402                   add  sp, 2
  2910 00000E34 08C0                     or  al, al
  2911 00000E36 0F840C00                 je .typeName116
  2912 00000E3A B82600                   mov ax, 38
  2913 00000E3D A2[3000]                 mov byte [istype], al
  2914 00000E40 B80200                   mov ax, 2
  2915 00000E43 8946FE                   mov [bp-2], ax
  2916                                  
  2917                                  ;-409     name1();
  2918                                  
  2919                                  .typeName116:
  2920 00000E46 E80800                   call name1
  2921                                  
  2922                                  ;-410     return m;
  2923                                  
  2924 00000E49 8B46FE                   mov ax, [bp-2]
  2925 00000E4C E90000                   jmp .retntypeName
  2926                                  
  2927                                  ;-411 }
  2928                                  
  2929                                  
  2930                                  ;-412 int name1() {
  2931                                  
  2932 00000E4F C9                       .retntypeName: LEAVE
  2933 00000E50 C3                       ret
  2934                                  ENDP
  2935                                  
  2936                                  name1: PROC
  2937                                  
  2938                                  ;-413     if (token!=T_NAME) error1("Name expected");
  2939                                  
  2940 00000E51 A1[1E00]                 mov ax, [token]
  2941 00000E54 3D0001                   cmp ax, 256
  2942 00000E57 0F840900                 je  .name1117
  2943 00000E5B 68[6B0E]                 push name1_0
  2944 00000E5E E8D32E                   call error1
  2945 00000E61 83C402                   add  sp, 2
  2946                                  
  2947                                  ;-414     token=getlex();
  2948                                  
  2949                                  .name1117:
  2950 00000E64 E85624                   call getlex
  2951 00000E67 A3[1E00]                 mov word [token], ax
  2952                                  
  2953                                  ;-415 }
  2954                                  
  2955                                  
  2956                                  ;-416 
  2957                                  
  2958                                  
  2959                                  ;-417 int storeCall1() {//todo
  2960                                  
  2961 00000E6A C3                       ret
  2962 00000E6B 4E616D652065787065-     name1_0 db "Name expected",0
  2963 00000E74 6374656400         
  2964                                  ENDP
  2965                                  
  2966                                  storeCall1: PROC
  2967                                  
  2968                                  ;-418     unsigned int i;
  2969                                  
  2970                                  
  2971                                  ;-419     CTop++;
  2972                                  
  2973                                  ;Function : storeCall1, Number of local variables: 1
  2974                                  ;   # type sign width addr used name   list of local variables
  2975                                  ;  200 var unsg word   418 NULL i = bp-2;
  2976 00000E79 C8020000                 ENTER  2,0
  2977 00000E7D FF06[4300]               inc  word[CTop]
  2978                                  
  2979                                  ;-420     if (CTop >= CALLMAX) error1("too many calls");
  2980                                  
  2981 00000E81 A1[4300]                 mov ax, [CTop]
  2982 00000E84 3DDC05                   cmp ax, 1500 ;unsigned : 1
  2983 00000E87 0F8C0900                 jl  .storeCall1118
  2984 00000E8B 68[E80E]                 push storeCall1_0
  2985 00000E8E E8A32E                   call error1
  2986 00000E91 83C402                   add  sp, 2
  2987                                  
  2988                                  ;-421     i = CNamePtr - &CNameField;
  2989                                  
  2990                                  .storeCall1118:
  2991 00000E94 A1[3F00]                 mov ax, [CNamePtr]
  2992 00000E97 2D80B2                   sub ax, CNameField
  2993 00000E9A 8946FE                   mov [bp-2], ax
  2994                                  
  2995                                  ;-422     if (i >= CNAMEMAX) error1("too many call names");
  2996                                  
  2997 00000E9D 8B46FE                   mov ax, [bp-2]
  2998 00000EA0 3D1027                   cmp ax, 10000 ;unsigned : 0
  2999 00000EA3 0F820900                 jb  .storeCall1119
  3000 00000EA7 68[F70E]                 push storeCall1_1
  3001 00000EAA E8872E                   call error1
  3002 00000EAD 83C402                   add  sp, 2
  3003                                  
  3004                                  ;-423     CType[CTop]=0;
  3005                                  
  3006                                  .storeCall1119:
  3007 00000EB0 B80000                   mov ax, 0
  3008 00000EB3 8B1E[4300]               mov bx, [CTop]
  3009 00000EB7 8887ECA0                 mov [CType+bx], al
  3010                                  
  3011                                  ;-424     CAdr [CTop]=CNamePtr;
  3012                                  
  3013 00000EBB A1[3F00]                 mov ax, [CNamePtr]
  3014 00000EBE 8B1E[4300]               mov bx, [CTop]
  3015 00000EC2 D1E3                     shl bx, 1
  3016 00000EC4 8987C8A6                 mov [CAdr+bx], ax
  3017                                  
  3018                                  ;-425     CNamePtr=strcpy(CNamePtr, symbol);
  3019                                  
  3020 00000EC8 8D06BB69                 lea  ax, [symbol]
  3021 00000ECC 50                       push ax
  3022 00000ECD FF36[3F00]               push word [CNamePtr]
  3023 00000ED1 E87BF3                   call strcpy
  3024 00000ED4 83C404                   add  sp, 4
  3025 00000ED7 A3[3F00]                 mov word [CNamePtr], ax
  3026                                  
  3027                                  ;-426     CNamePtr++;
  3028                                  
  3029 00000EDA FF06[3F00]               inc  word[CNamePtr]
  3030                                  
  3031                                  ;-427     CNameTop++;
  3032                                  
  3033 00000EDE FF06[4100]               inc  word[CNameTop]
  3034                                  
  3035                                  ;-428     CTop++;
  3036                                  
  3037 00000EE2 FF06[4300]               inc  word[CTop]
  3038                                  
  3039                                  ;-429 }
  3040                                  
  3041                                  
  3042                                  ;-430 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  3043 00000EE6 C9                       LEAVE
  3044 00000EE7 C3                       ret
  3045 00000EE8 746F6F206D616E7920-     storeCall1_0 db "too many calls",0
  3046 00000EF1 63616C6C7300       
  3047 00000EF7 746F6F206D616E7920-     storeCall1_1 db "too many call names",0
  3048 00000F00 63616C6C206E616D65-
  3049 00000F09 7300               
  3050                                  ENDP
  3051                                  
  3052                                  storecall: PROC
  3053                                  ;Function : storecall, Number of local variables: 1
  3054                                  ;   # type sign width addr used name   list of local variables
  3055                                  ;  200 var sign word   430 NULL i = bp-2;
  3056 00000F0B C8020000                 ENTER  2,0
  3057 00000F0F A1[4300]                 mov ax, [CTop]
  3058 00000F12 3DDC05                   cmp ax, 1500 ;unsigned : 1
  3059 00000F15 0F8C0900                 jl  .storecall120
  3060 00000F19 68[7D0F]                 push storecall_0
  3061 00000F1C E8152E                   call error1
  3062 00000F1F 83C402                   add  sp, 2
  3063                                  
  3064                                  ;-431   if (CNameTop >= 65468) error1("Call name table fuill");
  3065                                  
  3066                                  .storecall120:
  3067 00000F22 A1[4100]                 mov ax, [CNameTop]
  3068 00000F25 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  3069 00000F28 0F820900                 jb  .storecall121
  3070 00000F2C 68[8D0F]                 push storecall_1
  3071 00000F2F E8022E                   call error1
  3072 00000F32 83C402                   add  sp, 2
  3073                                  
  3074                                  ;-432     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  3075                                  
  3076                                  .storecall121:
  3077 00000F35 B80000                   mov ax, 0
  3078 00000F38 8B1E[4300]               mov bx, [CTop]
  3079 00000F3C 8887ECA0                 mov [CType+bx], al
  3080 00000F40 A1[4100]                 mov ax, [CNameTop]
  3081 00000F43 8B1E[4300]               mov bx, [CTop]
  3082 00000F47 D1E3                     shl bx, 1
  3083 00000F49 8987C8A6                 mov [CAdr+bx], ax
  3084 00000F4D 8D06BB69                 lea  ax, [symbol]
  3085 00000F51 50                       push ax
  3086 00000F52 E8D2F2                   call strlen
  3087 00000F55 83C402                   add  sp, 2
  3088 00000F58 8946FE                   mov [bp-2], ax
  3089                                  
  3090                                  ;-433     to_far(CNameTop, symbol);
  3091                                  
  3092 00000F5B 8D06BB69                 lea  ax, [symbol]
  3093 00000F5F 50                       push ax
  3094 00000F60 FF36[4100]               push word [CNameTop]
  3095 00000F64 E8083D                   call to_far
  3096 00000F67 83C404                   add  sp, 4
  3097                                  
  3098                                  ;-434     CNameTop=CNameTop+i; CNameTop++; CTop++;
  3099                                  
  3100 00000F6A A1[4100]                 mov ax, [CNameTop]
  3101 00000F6D 0346FE                   add ax, [bp-2]
  3102 00000F70 A3[4100]                 mov word [CNameTop], ax
  3103 00000F73 FF06[4100]               inc  word[CNameTop]
  3104 00000F77 FF06[4300]               inc  word[CTop]
  3105                                  
  3106                                  ;-435 }
  3107                                  
  3108                                  
  3109                                  ;-436 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  3110 00000F7B C9                       LEAVE
  3111 00000F7C C3                       ret
  3112 00000F7D 43616C6C207461626C-     storecall_0 db "Call table full",0
  3113 00000F86 652066756C6C00     
  3114 00000F8D 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  3115 00000F96 207461626C65206675-
  3116 00000F9F 696C6C00           
  3117                                  ENDP
  3118                                  
  3119                                  storefunc: PROC
  3120 00000FA3 A1[3D00]                 mov ax, [FTop]
  3121 00000FA6 3D2C01                   cmp ax, 300 ;unsigned : 1
  3122 00000FA9 0F8C0900                 jl  .storefunc122
  3123 00000FAD 68[0410]                 push storefunc_0
  3124 00000FB0 E8812D                   call error1
  3125 00000FB3 83C402                   add  sp, 2
  3126                                  
  3127                                  ;-437     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3128                                  
  3129                                  .storefunc122:
  3130 00000FB6 A1[6A00]                 mov ax, [lineno]
  3131 00000FB9 83E801                   sub ax, 1
  3132 00000FBC 8B1E[3D00]               mov bx, [FTop]
  3133 00000FC0 D1E3                     shl bx, 1
  3134 00000FC2 89877C89                 mov [FAdr+bx], ax
  3135 00000FC6 B80000                   mov ax, 0
  3136 00000FC9 8B1E[3D00]               mov bx, [FTop]
  3137 00000FCD D1E3                     shl bx, 1
  3138 00000FCF 8987D48B                 mov [FCalls+bx], ax
  3139 00000FD3 A0[3600]                 mov al, [iswidth]
  3140 00000FD6 8B1E[3D00]               mov bx, [FTop]
  3141 00000FDA 88875088                 mov [FType+bx], al
  3142                                  
  3143                                  ;-438     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3144                                  
  3145 00000FDE FF36[3D00]               push word [FTop]
  3146 00000FE2 8D062C8E                 lea  ax, [FNameField]
  3147 00000FE6 50                       push ax
  3148 00000FE7 E84CFC                   call adrF
  3149 00000FEA 83C404                   add  sp, 4
  3150 00000FED A3[6E00]                 mov word [pt], ax
  3151 00000FF0 8D06BB69                 lea  ax, [symbol]
  3152 00000FF4 50                       push ax
  3153 00000FF5 FF36[6E00]               push word [pt]
  3154 00000FF9 E853F2                   call strcpy
  3155 00000FFC 83C404                   add  sp, 4
  3156 00000FFF FF06[3D00]               inc  word[FTop]
  3157                                  
  3158                                  ;-439 }
  3159                                  
  3160                                  
  3161                                  ;-440 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3162                                  
  3163 00001003 C3                       ret
  3164 00001004 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  3165 0000100D 7461626C652066756C-
  3166 00001016 6C00               
  3167                                  ENDP
  3168                                  
  3169                                  addlocal: PROC
  3170 00001018 A1[3B00]                 mov ax, [LTop]
  3171 0000101B 3D2C01                   cmp ax, 300 ;unsigned : 1
  3172 0000101E 0F8C0900                 jl  .addlocal123
  3173 00001022 68[9E10]                 push addlocal_0
  3174 00001025 E80C2D                   call error1
  3175 00001028 83C402                   add  sp, 2
  3176                                  
  3177                                  ;-441   if (checkName() != 0) error1("Variable already defined");
  3178                                  
  3179                                  .addlocal123:
  3180 0000102B E8C6FC                   call checkName
  3181 0000102E 83F800                   cmp ax, 0
  3182 00001031 0F840900                 je  .addlocal124
  3183 00001035 68[B810]                 push addlocal_1
  3184 00001038 E8F92C                   call error1
  3185 0000103B 83C402                   add  sp, 2
  3186                                  
  3187                                  ;-442   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3188                                  
  3189                                  .addlocal124:
  3190 0000103E A0[3300]                 mov al, [issign]
  3191 00001041 8B1E[3B00]               mov bx, [LTop]
  3192 00001045 8887306C                 mov [GSign+bx], al
  3193 00001049 A0[3600]                 mov al, [iswidth]
  3194 0000104C 8B1E[3B00]               mov bx, [LTop]
  3195 00001050 88875C6D                 mov [GWidth+bx], al
  3196 00001054 A0[3000]                 mov al, [istype]
  3197 00001057 8B1E[3B00]               mov bx, [LTop]
  3198 0000105B 8887046B                 mov [GType+bx], al
  3199                                  
  3200                                  ;-443   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3201                                  
  3202 0000105F A1[6A00]                 mov ax, [lineno]
  3203 00001062 83E801                   sub ax, 1
  3204 00001065 8B1E[3B00]               mov bx, [LTop]
  3205 00001069 D1E3                     shl bx, 1
  3206 0000106B 8987886E                 mov [GAdr+bx], ax
  3207 0000106F B80000                   mov ax, 0
  3208 00001072 8B1E[3B00]               mov bx, [LTop]
  3209 00001076 D1E3                     shl bx, 1
  3210 00001078 8987E070                 mov [GUsed+bx], ax
  3211                                  
  3212                                  ;-444   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3213                                  
  3214 0000107C FF36[3B00]               push word [LTop]
  3215 00001080 8D069075                 lea  ax, [GNameField]
  3216 00001084 50                       push ax
  3217 00001085 E8AEFB                   call adrF
  3218 00001088 83C404                   add  sp, 4
  3219 0000108B A3[6E00]                 mov word [pt], ax
  3220 0000108E 8D06BB69                 lea  ax, [symbol]
  3221 00001092 50                       push ax
  3222 00001093 FF36[6E00]               push word [pt]
  3223 00001097 E8B5F1                   call strcpy
  3224 0000109A 83C404                   add  sp, 4
  3225                                  
  3226                                  ;-445 }
  3227                                  
  3228                                  
  3229                                  ;-446 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3230                                  
  3231 0000109D C3                       ret
  3232 0000109E 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3233 000010A7 6961626C6520746162-
  3234 000010B0 6C652066756C6C00   
  3235 000010B8 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3236 000010C1 616C72656164792064-
  3237 000010CA 6566696E656400     
  3238                                  ENDP
  3239                                  
  3240                                  checkFunction: PROC
  3241                                  ;Function : checkFunction, Number of local variables: 2
  3242                                  ;   # type sign width addr used name   list of local variables
  3243                                  ;  200 var unsg word   446 NULL i = bp-2
  3244                                  ;  201 var unsg word   446 NULL j = bp-4;
  3245 000010D1 C8040000                 ENTER  4,0
  3246 000010D5 B80000                   mov ax, 0
  3247 000010D8 8946FE                   mov [bp-2], ax
  3248                                  
  3249                                  ;-447   while (i < FTop) {
  3250                                  
  3251                                  .checkFunction125:
  3252 000010DB 8B46FE                   mov ax, [bp-2]
  3253 000010DE 3B06[3D00]               cmp ax, [FTop]
  3254 000010E2 0F8D3000                 jge .checkFunction126
  3255                                  
  3256                                  ;-448     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3257                                  
  3258 000010E6 FF76FE                   push word [bp-2]
  3259 000010E9 8D062C8E                 lea  ax, [FNameField]
  3260 000010ED 50                       push ax
  3261 000010EE E845FB                   call adrF
  3262 000010F1 83C404                   add  sp, 4
  3263 000010F4 8946FC                   mov [bp-4], ax
  3264 000010F7 FF76FC                   push word [bp-4]
  3265 000010FA 8D06BB69                 lea  ax, [symbol]
  3266 000010FE 50                       push ax
  3267 000010FF E883F1                   call eqstr
  3268 00001102 83C404                   add  sp, 4
  3269 00001105 08C0                     or  al, al
  3270 00001107 0F840600                 je .checkFunction127
  3271 0000110B 8B46FE                   mov ax, [bp-2]
  3272 0000110E E90B00                   jmp .retncheckFunction
  3273                                  .checkFunction127:
  3274 00001111 FF46FE                   inc  word[bp-2]
  3275                                  
  3276                                  ;-449   return 0; }
  3277                                  
  3278 00001114 EBC5                     jmp .checkFunction125
  3279                                  .checkFunction126:
  3280 00001116 B80000                   mov ax, 0
  3281 00001119 E90000                   jmp .retncheckFunction
  3282                                  
  3283                                  ;-450 int dofunc() { int nloc; int i; int narg;
  3284                                  
  3285 0000111C C9                       .retncheckFunction: LEAVE
  3286 0000111D C3                       ret
  3287                                  ENDP
  3288                                  
  3289                                  dofunc: PROC
  3290                                  
  3291                                  ;-451   cloc=&co;
  3292                                  
  3293                                  ;Function : dofunc, Number of local variables: 3
  3294                                  ;   # type sign width addr used name   list of local variables
  3295                                  ;  200 var sign word   450 NULL nloc = bp-2
  3296                                  ;  201 var sign word   450 NULL i = bp-4
  3297                                  ;  202 var sign word   450 NULL narg = bp-6;
  3298 0000111E C8060000                 ENTER  6,0
  3299 00001122 B8A861                   mov ax, co
  3300 00001125 A3[1800]                 mov word [cloc], ax
  3301                                  
  3302                                  ;-452   checknamelen();
  3303                                  
  3304 00001128 E882F2                   call checknamelen
  3305                                  
  3306                                  ;-453   strcpy(fname, symbol);
  3307                                  
  3308 0000112B 8D06BB69                 lea  ax, [symbol]
  3309 0000112F 50                       push ax
  3310 00001130 8D063B6A                 lea  ax, [fname]
  3311 00001134 50                       push ax
  3312 00001135 E817F1                   call strcpy
  3313 00001138 83C404                   add  sp, 4
  3314                                  
  3315                                  ;-454   if (checkFunction() ) error1("Function already defined");
  3316                                  
  3317 0000113B E893FF                   call checkFunction
  3318 0000113E 08C0                     or  al, al
  3319 00001140 0F840900                 je .dofunc128
  3320 00001144 68[6813]                 push dofunc_0
  3321 00001147 E8EA2B                   call error1
  3322 0000114A 83C402                   add  sp, 2
  3323                                  
  3324                                  ;-455   storefunc();
  3325                                  
  3326                                  .dofunc128:
  3327 0000114D E853FE                   call storefunc
  3328                                  
  3329                                  ;-456   prs("\n\n"); prs(symbol); prs(": PROC");
  3330                                  
  3331 00001150 68[8113]                 push dofunc_1
  3332 00001153 E8F6F3                   call prs
  3333 00001156 83C402                   add  sp, 2
  3334 00001159 8D06BB69                 lea  ax, [symbol]
  3335 0000115D 50                       push ax
  3336 0000115E E8EBF3                   call prs
  3337 00001161 83C402                   add  sp, 2
  3338 00001164 68[8613]                 push dofunc_2
  3339 00001167 E8E2F3                   call prs
  3340 0000116A 83C402                   add  sp, 2
  3341                                  
  3342                                  ;-457   expect('('); LTop=LSTART;  i=0;
  3343                                  
  3344 0000116D 6A28                     push 40
  3345 0000116F E8C7F2                   call expect
  3346 00001172 83C402                   add  sp, 2
  3347 00001175 B8C800                   mov ax, 200
  3348 00001178 A3[3B00]                 mov word [LTop], ax
  3349 0000117B B80000                   mov ax, 0
  3350 0000117E 8946FC                   mov [bp-4], ax
  3351                                  
  3352                                  ;-458   if (istoken(')')==0) { narg=2;
  3353                                  
  3354 00001181 6A29                     push 41
  3355 00001183 E891F2                   call istoken
  3356 00001186 83C402                   add  sp, 2
  3357 00001189 83F800                   cmp ax, 0
  3358 0000118C 0F854600                 jne .dofunc129
  3359 00001190 B80200                   mov ax, 2
  3360 00001193 8946FA                   mov [bp-6], ax
  3361                                  
  3362                                  ;-459     do { typeName();  addlocal(); narg+=2;
  3363                                  
  3364                                  .dofunc130:
  3365 00001196 E8DFFB                   call typeName
  3366 00001199 E87CFE                   call addlocal
  3367 0000119C 8346FA02                 add  word[bp-6], 2
  3368                                  
  3369                                  ;-460          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  3370                                  
  3371 000011A0 8B46FA                   mov ax, [bp-6]
  3372 000011A3 8B1E[3B00]               mov bx, [LTop]
  3373 000011A7 D1E3                     shl bx, 1
  3374 000011A9 89873873                 mov [GData+bx], ax
  3375 000011AD A0[3600]                 mov al, [iswidth]
  3376 000011B0 3C04                     cmp al, 4
  3377 000011B2 0F850400                 jne .dofunc131
  3378 000011B6 8346FA02                 add  word[bp-6], 2
  3379                                  .dofunc131:
  3380 000011BA FF06[3B00]               inc  word[LTop]
  3381                                  
  3382                                  ;-461     while (istoken(','));  expect(')'); }
  3383                                  
  3384 000011BE 6A2C                     push 44
  3385 000011C0 E854F2                   call istoken
  3386 000011C3 83C402                   add  sp, 2
  3387 000011C6 08C0                     or  al, al
  3388 000011C8 0F840200                 je .dofunc132
  3389 000011CC EBC8                     jmp .dofunc130
  3390                                  .dofunc132:
  3391 000011CE 6A29                     push 41
  3392 000011D0 E866F2                   call expect
  3393 000011D3 83C402                   add  sp, 2
  3394                                  
  3395                                  ;-462 
  3396                                  
  3397                                  
  3398                                  ;-463   expect('{'); /*body*/
  3399                                  
  3400                                  .dofunc129:
  3401 000011D6 6A7B                     push 123
  3402 000011D8 E85EF2                   call expect
  3403 000011DB 83C402                   add  sp, 2
  3404                                  
  3405                                  ;-464   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  3406                                  
  3407 000011DE B80000                   mov ax, 0
  3408 000011E1 8946FE                   mov [bp-2], ax
  3409 000011E4 B80000                   mov ax, 0
  3410 000011E7 A3[2800]                 mov word [nreturn], ax
  3411 000011EA B80000                   mov ax, 0
  3412 000011ED A3[2600]                 mov word [nconst], ax
  3413 000011F0 B80000                   mov ax, 0
  3414 000011F3 8946FC                   mov [bp-4], ax
  3415                                  
  3416                                  ;-465   while(isvariable()) {
  3417                                  
  3418                                  .dofunc133:
  3419 000011F6 E8C101                   call isvariable
  3420 000011F9 08C0                     or  al, al
  3421 000011FB 0F849200                 je .dofunc134
  3422                                  
  3423                                  ;-466     do {typeName();
  3424                                  
  3425                                  .dofunc135:
  3426 000011FF E876FB                   call typeName
  3427                                  
  3428                                  ;-467         checknamelen();
  3429                                  
  3430 00001202 E8A8F1                   call checknamelen
  3431                                  
  3432                                  ;-468         addlocal(); nloc-=2;
  3433                                  
  3434 00001205 E810FE                   call addlocal
  3435 00001208 836EFE02                 sub  word[bp-2], 2
  3436                                  
  3437                                  ;-469         if (iswidth == 4) nloc-=2;
  3438                                  
  3439 0000120C A0[3600]                 mov al, [iswidth]
  3440 0000120F 3C04                     cmp al, 4
  3441 00001211 0F850400                 jne .dofunc136
  3442 00001215 836EFE02                 sub  word[bp-2], 2
  3443                                  
  3444                                  ;-470         GData[LTop]=nloc;
  3445                                  
  3446                                  .dofunc136:
  3447 00001219 8B46FE                   mov ax, [bp-2]
  3448 0000121C 8B1E[3B00]               mov bx, [LTop]
  3449 00001220 D1E3                     shl bx, 1
  3450 00001222 89873873                 mov [GData+bx], ax
  3451                                  
  3452                                  ;-471         if (istoken('[')){
  3453                                  
  3454 00001226 6A5B                     push 91
  3455 00001228 E8ECF1                   call istoken
  3456 0000122B 83C402                   add  sp, 2
  3457 0000122E 08C0                     or  al, al
  3458 00001230 0F843D00                 je .dofunc137
  3459                                  
  3460                                  ;-472             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  3461                                  
  3462 00001234 B82600                   mov ax, 38
  3463 00001237 A2[3000]                 mov byte [istype], al
  3464 0000123A B82600                   mov ax, 38
  3465 0000123D 8B1E[3B00]               mov bx, [LTop]
  3466 00001241 8887046B                 mov [GType+bx], al
  3467 00001245 680101                   push 257
  3468 00001248 E8EEF1                   call expect
  3469 0000124B 83C402                   add  sp, 2
  3470 0000124E 6A5D                     push 93
  3471 00001250 E8E6F1                   call expect
  3472 00001253 83C402                   add  sp, 2
  3473                                  
  3474                                  ;-473             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  3475                                  
  3476 00001256 8B46FE                   mov ax, [bp-2]
  3477 00001259 2B06[2C00]               sub ax, [lexval]
  3478 0000125D 8946FE                   mov [bp-2], ax
  3479 00001260 8346FE02                 add  word[bp-2], 2
  3480 00001264 8B46FE                   mov ax, [bp-2]
  3481 00001267 8B1E[3B00]               mov bx, [LTop]
  3482 0000126B D1E3                     shl bx, 1
  3483 0000126D 89873873                 mov [GData+bx], ax
  3484                                  
  3485                                  ;-474             }
  3486                                  
  3487                                  
  3488                                  ;-475         LTop++;
  3489                                  
  3490                                  .dofunc137:
  3491 00001271 FF06[3B00]               inc  word[LTop]
  3492                                  
  3493                                  ;-476       } while (istoken(',')); expect(';'); }
  3494                                  
  3495 00001275 6A2C                     push 44
  3496 00001277 E89DF1                   call istoken
  3497 0000127A 83C402                   add  sp, 2
  3498 0000127D 08C0                     or  al, al
  3499 0000127F 0F840300                 je .dofunc138
  3500 00001283 E979FF                   jmp .dofunc135
  3501                                  .dofunc138:
  3502 00001286 6A3B                     push 59
  3503 00001288 E8AEF1                   call expect
  3504 0000128B 83C402                   add  sp, 2
  3505                                  
  3506                                  ;-477   listproc();
  3507                                  
  3508 0000128E E965FF                   jmp .dofunc133
  3509                                  .dofunc134:
  3510 00001291 E8622B                   call listproc
  3511                                  
  3512                                  ;-478   if (LTop>LSTART){prs(";\n ENTER  ");
  3513                                  
  3514 00001294 A1[3B00]                 mov ax, [LTop]
  3515 00001297 3DC800                   cmp ax, 200
  3516 0000129A 0F8E2700                 jle .dofunc139
  3517 0000129E 68[8D13]                 push dofunc_3
  3518 000012A1 E8A8F2                   call prs
  3519 000012A4 83C402                   add  sp, 2
  3520                                  
  3521                                  ;-479     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  3522                                  
  3523 000012A7 FF76FE                   push word [bp-2]
  3524 000012AA E81AEE                   call mkneg
  3525 000012AD 83C402                   add  sp, 2
  3526 000012B0 8946FE                   mov [bp-2], ax
  3527 000012B3 FF76FE                   push word [bp-2]
  3528 000012B6 E8E8F3                   call prunsign1
  3529 000012B9 83C402                   add  sp, 2
  3530 000012BC 68[9913]                 push dofunc_4
  3531 000012BF E88AF2                   call prs
  3532 000012C2 83C402                   add  sp, 2
  3533                                  
  3534                                  ;-480   while(istoken('}')==0)   stmt();
  3535                                  
  3536                                  .dofunc139:
  3537                                  .dofunc140:
  3538 000012C5 6A7D                     push 125
  3539 000012C7 E84DF1                   call istoken
  3540 000012CA 83C402                   add  sp, 2
  3541 000012CD 83F800                   cmp ax, 0
  3542 000012D0 0F850500                 jne .dofunc141
  3543 000012D4 E89C26                   call stmt
  3544                                  
  3545                                  ;-481   if (nreturn) {
  3546                                  
  3547 000012D7 EBEC                     jmp .dofunc140
  3548                                  .dofunc141:
  3549 000012D9 A1[2800]                 mov ax, [nreturn]
  3550 000012DC 08C0                     or  al, al
  3551 000012DE 0F841C00                 je .dofunc142
  3552                                  
  3553                                  ;-482         prs("\n .retn");
  3554                                  
  3555 000012E2 68[9C13]                 push dofunc_5
  3556 000012E5 E864F2                   call prs
  3557 000012E8 83C402                   add  sp, 2
  3558                                  
  3559                                  ;-483         prs(fname);
  3560                                  
  3561 000012EB 8D063B6A                 lea  ax, [fname]
  3562 000012EF 50                       push ax
  3563 000012F0 E859F2                   call prs
  3564 000012F3 83C402                   add  sp, 2
  3565                                  
  3566                                  ;-484         prc(':');
  3567                                  
  3568 000012F6 6A3A                     push 58
  3569 000012F8 E8EAF1                   call prc
  3570 000012FB 83C402                   add  sp, 2
  3571                                  
  3572                                  ;-485         }
  3573                                  
  3574                                  
  3575                                  ;-486   if (LTop > LSTART) prs(" LEAVE");
  3576                                  
  3577                                  .dofunc142:
  3578 000012FE A1[3B00]                 mov ax, [LTop]
  3579 00001301 3DC800                   cmp ax, 200
  3580 00001304 0F8E0900                 jle .dofunc143
  3581 00001308 68[A513]                 push dofunc_6
  3582 0000130B E83EF2                   call prs
  3583 0000130E 83C402                   add  sp, 2
  3584                                  
  3585                                  ;-487   prs("\n ret");
  3586                                  
  3587                                  .dofunc143:
  3588 00001311 68[AC13]                 push dofunc_7
  3589 00001314 E835F2                   call prs
  3590 00001317 83C402                   add  sp, 2
  3591                                  
  3592                                  ;-488   *cloc=0; prs(co);
  3593                                  
  3594 0000131A B80000                   mov ax, 0
  3595 0000131D 8B1E[1800]               mov  bx, [cloc]
  3596 00001321 8807                     mov  [bx], al
  3597 00001323 8D06A861                 lea  ax, [co]
  3598 00001327 50                       push ax
  3599 00001328 E821F2                   call prs
  3600 0000132B 83C402                   add  sp, 2
  3601                                  
  3602                                  ;-489   maxco1=strlen(co);
  3603                                  
  3604 0000132E 8D06A861                 lea  ax, [co]
  3605 00001332 50                       push ax
  3606 00001333 E8F1EE                   call strlen
  3607 00001336 83C402                   add  sp, 2
  3608 00001339 A3[1600]                 mov word [maxco1], ax
  3609                                  
  3610                                  ;-490   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  3611                                  
  3612 0000133C A1[1600]                 mov ax, [maxco1]
  3613 0000133F 3B06[1400]               cmp ax, [maxco]
  3614 00001343 0F8E1600                 jle .dofunc144
  3615 00001347 A1[1600]                 mov ax, [maxco1]
  3616 0000134A A3[1400]                 mov word [maxco], ax
  3617 0000134D 8D063B6A                 lea  ax, [fname]
  3618 00001351 50                       push ax
  3619 00001352 8D067869                 lea  ax, [coname]
  3620 00001356 50                       push ax
  3621 00001357 E8F5EE                   call strcpy
  3622 0000135A 83C404                   add  sp, 4
  3623                                  
  3624                                  ;-491   prs("\nENDP");
  3625                                  
  3626                                  .dofunc144:
  3627 0000135D 68[B313]                 push dofunc_8
  3628 00001360 E8E9F1                   call prs
  3629 00001363 83C402                   add  sp, 2
  3630                                  
  3631                                  ;-492 }
  3632                                  
  3633                                  
  3634                                  ;-493 int isvariable() {
  3635 00001366 C9                       LEAVE
  3636 00001367 C3                       ret
  3637 00001368 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  3638 00001371 616C72656164792064-
  3639 0000137A 6566696E656400     
  3640 00001381 5C6E5C6E00              dofunc_1 db "\n\n",0
  3641 00001386 3A2050524F4300          dofunc_2 db ": PROC",0
  3642 0000138D 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  3643 00001396 202000             
  3644 00001399 2C3000                  dofunc_4 db ",0",0
  3645 0000139C 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  3646 000013A5 204C4541564500          dofunc_6 db " LEAVE",0
  3647 000013AC 5C6E2072657400          dofunc_7 db "\n ret",0
  3648 000013B3 5C6E454E445000          dofunc_8 db "\nENDP",0
  3649                                  ENDP
  3650                                  
  3651                                  isvariable: PROC
  3652                                  
  3653                                  ;-494     if(token==T_SIGNED)   goto v1;
  3654                                  
  3655 000013BA A1[1E00]                 mov ax, [token]
  3656 000013BD 3D1302                   cmp ax, 531
  3657 000013C0 0F850300                 jne .isvariable145
  3658 000013C4 E93A00                   jmp .v1
  3659                                  
  3660                                  ;-495     if(token==T_UNSIGNED) goto v1;
  3661                                  
  3662                                  .isvariable145:
  3663 000013C7 A1[1E00]                 mov ax, [token]
  3664 000013CA 3D1402                   cmp ax, 532
  3665 000013CD 0F850300                 jne .isvariable146
  3666 000013D1 E92D00                   jmp .v1
  3667                                  
  3668                                  ;-496     if(token==T_CHAR)     goto v1;
  3669                                  
  3670                                  .isvariable146:
  3671 000013D4 A1[1E00]                 mov ax, [token]
  3672 000013D7 3D1202                   cmp ax, 530
  3673 000013DA 0F850300                 jne .isvariable147
  3674 000013DE E92000                   jmp .v1
  3675                                  
  3676                                  ;-497     if(token==T_INT)      goto v1;
  3677                                  
  3678                                  .isvariable147:
  3679 000013E1 A1[1E00]                 mov ax, [token]
  3680 000013E4 3D0502                   cmp ax, 517
  3681 000013E7 0F850300                 jne .isvariable148
  3682 000013EB E91300                   jmp .v1
  3683                                  
  3684                                  ;-498     if(token==T_LONG)     goto v1;
  3685                                  
  3686                                  .isvariable148:
  3687 000013EE A1[1E00]                 mov ax, [token]
  3688 000013F1 3D1502                   cmp ax, 533
  3689 000013F4 0F850300                 jne .isvariable149
  3690 000013F8 E90600                   jmp .v1
  3691                                  
  3692                                  ;-499     return 0;
  3693                                  
  3694                                  .isvariable149:
  3695 000013FB B80000                   mov ax, 0
  3696 000013FE E90600                   jmp .retnisvariable
  3697                                  
  3698                                  ;-500 v1: return 1;
  3699                                  
  3700                                  .v1:
  3701 00001401 B80100                   mov ax, 1
  3702 00001404 E90000                   jmp .retnisvariable
  3703                                  
  3704                                  ;-501 }
  3705                                  
  3706                                  
  3707                                  ;-502 
  3708                                  
  3709                                  
  3710                                  ;-503 int ireg1;
  3711                                  
  3712                                   .retnisvariable:
  3713 00001407 C3                       ret
  3714                                  ENDP
  3715 00001408 0000                    ireg1 dw 0
  3716                                  
  3717                                  ;-504 int mod2; int ireg2;
  3718                                  
  3719 0000140A 0000                    mod2 dw 0
  3720 0000140C 0000                    ireg2 dw 0
  3721                                  
  3722                                  ;-505 
  3723                                  
  3724                                  
  3725                                  ;-506 int pexpr() {expect('('); iscmp=0;
  3726                                  
  3727                                  
  3728                                  pexpr: PROC
  3729 0000140E 6A28                     push 40
  3730 00001410 E826F0                   call expect
  3731 00001413 83C402                   add  sp, 2
  3732 00001416 B80000                   mov ax, 0
  3733 00001419 A3[2400]                 mov word [iscmp], ax
  3734                                  
  3735                                  ;-507   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  3736                                  
  3737 0000141C A1[1E00]                 mov ax, [token]
  3738 0000141F 3D0001                   cmp ax, 256
  3739 00001422 0F853400                 jne .pexpr150
  3740 00001426 68[8914]                 push pexpr_0
  3741 00001429 8D06BB69                 lea  ax, [symbol]
  3742 0000142D 50                       push ax
  3743 0000142E E854EE                   call eqstr
  3744 00001431 83C404                   add  sp, 4
  3745 00001434 08C0                     or  al, al
  3746 00001436 0F840600                 je .pexpr151
  3747 0000143A E86300                   call constantexpr
  3748 0000143D E94800                   jmp .retnpexpr
  3749                                  
  3750                                  ;-508     ireg1=checkreg();
  3751                                  
  3752                                  .pexpr151:
  3753 00001440 E84803                   call checkreg
  3754 00001443 A3[0814]                 mov word [ireg1], ax
  3755                                  
  3756                                  ;-509     if (ireg1) { doreg1(1); return; }  }
  3757                                  
  3758 00001446 A1[0814]                 mov ax, [ireg1]
  3759 00001449 08C0                     or  al, al
  3760 0000144B 0F840B00                 je .pexpr152
  3761 0000144F 6A01                     push 1
  3762 00001451 E84B01                   call doreg1
  3763 00001454 83C402                   add  sp, 2
  3764 00001457 E92E00                   jmp .retnpexpr
  3765                                  .pexpr152:
  3766                                  
  3767                                  ;-510   expr(0);
  3768                                  
  3769                                  .pexpr150:
  3770 0000145A 6A00                     push 0
  3771 0000145C E8AB07                   call expr
  3772 0000145F 83C402                   add  sp, 2
  3773                                  
  3774                                  ;-511   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  3775                                  
  3776 00001462 A1[2400]                 mov ax, [iscmp]
  3777 00001465 83F800                   cmp ax, 0
  3778 00001468 0F850900                 jne .pexpr153
  3779 0000146C 68[8B14]                 push pexpr_1
  3780 0000146F E8DAF0                   call prs
  3781 00001472 83C402                   add  sp, 2
  3782                                  .pexpr153:
  3783 00001475 8D063B6A                 lea  ax, [fname]
  3784 00001479 50                       push ax
  3785 0000147A E8CFF0                   call prs
  3786 0000147D 83C402                   add  sp, 2
  3787                                  
  3788                                  ;-512   expect(')'); }
  3789                                  
  3790 00001480 6A29                     push 41
  3791 00001482 E8B4EF                   call expect
  3792 00001485 83C402                   add  sp, 2
  3793                                  
  3794                                  ;-513 
  3795                                  
  3796                                  
  3797                                  ;-514 int constantexpr() { int mode; int id1;int ids;
  3798                                  
  3799                                   .retnpexpr:
  3800 00001488 C3                       ret
  3801 00001489 5F00                    pexpr_0 db "_",0
  3802 0000148B 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  3803 00001494 2C20616C5C6E206A65-
  3804 0000149D 202E00             
  3805                                  ENDP
  3806                                  
  3807                                  constantexpr: PROC
  3808                                  
  3809                                  ;-515   token=getlex();   mode=typeName();
  3810                                  
  3811                                  ;Function : constantexpr, Number of local variables: 3
  3812                                  ;   # type sign width addr used name   list of local variables
  3813                                  ;  200 var sign word   514 NULL mode = bp-2
  3814                                  ;  201 var sign word   514 NULL id1 = bp-4
  3815                                  ;  202 var sign word   514 NULL ids = bp-6;
  3816 000014A0 C8060000                 ENTER  6,0
  3817 000014A4 E8161E                   call getlex
  3818 000014A7 A3[1E00]                 mov word [token], ax
  3819 000014AA E8CBF8                   call typeName
  3820 000014AD 8946FE                   mov [bp-2], ax
  3821                                  
  3822                                  ;-516   id1=searchname(); gettypes(id1); ids=signi;
  3823                                  
  3824 000014B0 E8F6F7                   call searchname
  3825 000014B3 8946FC                   mov [bp-4], ax
  3826 000014B6 FF76FC                   push word [bp-4]
  3827 000014B9 E8AFF6                   call gettypes
  3828 000014BC 83C402                   add  sp, 2
  3829 000014BF A1[3100]                 mov ax, [signi]
  3830 000014C2 8946FA                   mov [bp-6], ax
  3831                                  
  3832                                  ;-517   if (isrelational() ==0) error1("Relational expression expected");
  3833                                  
  3834 000014C5 E88E1D                   call isrelational
  3835 000014C8 83F800                   cmp ax, 0
  3836 000014CB 0F850900                 jne .constantexpr154
  3837 000014CF 68[5515]                 push constantexpr_0
  3838 000014D2 E85F28                   call error1
  3839 000014D5 83C402                   add  sp, 2
  3840                                  
  3841                                  ;-518   expect(T_CONST);  prs(" ; constant expression");
  3842                                  
  3843                                  .constantexpr154:
  3844 000014D8 680101                   push 257
  3845 000014DB E85BEF                   call expect
  3846 000014DE 83C402                   add  sp, 2
  3847 000014E1 68[7415]                 push constantexpr_1
  3848 000014E4 E865F0                   call prs
  3849 000014E7 83C402                   add  sp, 2
  3850                                  
  3851                                  ;-519   prs("\ncmp ");
  3852                                  
  3853 000014EA 68[8B15]                 push constantexpr_2
  3854 000014ED E85CF0                   call prs
  3855 000014F0 83C402                   add  sp, 2
  3856                                  
  3857                                  ;-520   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  3858                                  
  3859 000014F3 FF76FC                   push word [bp-4]
  3860 000014F6 E872F6                   call gettypes
  3861 000014F9 83C402                   add  sp, 2
  3862 000014FC A1[3700]                 mov ax, [wi]
  3863 000014FF 83F802                   cmp ax, 2
  3864 00001502 0F850C00                 jne .constantexpr155
  3865 00001506 68[9215]                 push constantexpr_3
  3866 00001509 E840F0                   call prs
  3867 0000150C 83C402                   add  sp, 2
  3868 0000150F E90900                   jmp .constantexpr156
  3869                                  .constantexpr155:
  3870 00001512 68[9715]                 push constantexpr_4
  3871 00001515 E834F0                   call prs
  3872 00001518 83C402                   add  sp, 2
  3873                                  
  3874                                  ;-521   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  3875                                  
  3876                                  .constantexpr156:
  3877 0000151B FF76FC                   push word [bp-4]
  3878 0000151E E859EE                   call v
  3879 00001521 83C402                   add  sp, 2
  3880 00001524 68[9C15]                 push constantexpr_5
  3881 00001527 E822F0                   call prs
  3882 0000152A 83C402                   add  sp, 2
  3883 0000152D FF36[2C00]               push word [lexval]
  3884 00001531 E86DF1                   call prunsign1
  3885 00001534 83C402                   add  sp, 2
  3886 00001537 FF76FA                   push word [bp-6]
  3887 0000153A E85B1A                   call cmpneg
  3888 0000153D 83C402                   add  sp, 2
  3889 00001540 8D063B6A                 lea  ax, [fname]
  3890 00001544 50                       push ax
  3891 00001545 E804F0                   call prs
  3892 00001548 83C402                   add  sp, 2
  3893                                  
  3894                                  ;-522   expect(')');
  3895                                  
  3896 0000154B 6A29                     push 41
  3897 0000154D E8E9EE                   call expect
  3898 00001550 83C402                   add  sp, 2
  3899                                  
  3900                                  ;-523 }
  3901                                  
  3902                                  
  3903                                  ;-524 
  3904                                  
  3905                                  
  3906                                  ;-525 char ops[5];
  3907 00001553 C9                       LEAVE
  3908 00001554 C3                       ret
  3909 00001555 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  3910 0000155E 6C2065787072657373-
  3911 00001567 696F6E206578706563-
  3912 00001570 74656400           
  3913 00001574 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  3914 0000157D 6E7420657870726573-
  3915 00001586 73696F6E00         
  3916 0000158B 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  3917 00001592 776F726400              constantexpr_3 db "word",0
  3918 00001597 6279746500              constantexpr_4 db "byte",0
  3919 0000159C 2C2000                  constantexpr_5 db ", ",0
  3920                                  ENDP
  3921                                  section .bss
  3922                                  absolute 55855
  3923 0000DA2F <res 00000005>          ops resb 5
  3924                                  section .text
  3925                                  
  3926                                  ;-526 int doreg1(int iscmp1) { int i;
  3927                                  
  3928                                  
  3929                                  doreg1: PROC
  3930                                  
  3931                                  ;-527   if (istoken('='))          strcpy(ops, "mov");
  3932                                  
  3933                                  ;Function : doreg1, Number of local variables: 2
  3934                                  ;   # type sign width addr used name   list of local variables
  3935                                  ;  200 var sign word   526 NULL iscmp1 = bp+4
  3936                                  ;  201 var sign word   526 NULL i = bp-2;
  3937 0000159F C8020000                 ENTER  2,0
  3938 000015A3 6A3D                     push 61
  3939 000015A5 E86FEE                   call istoken
  3940 000015A8 83C402                   add  sp, 2
  3941 000015AB 08C0                     or  al, al
  3942 000015AD 0F840E00                 je .doreg1157
  3943 000015B1 68[5217]                 push doreg1_0
  3944 000015B4 8D062FDA                 lea  ax, [ops]
  3945 000015B8 50                       push ax
  3946 000015B9 E893EC                   call strcpy
  3947 000015BC 83C404                   add  sp, 4
  3948                                  
  3949                                  ;-528   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3950                                  
  3951                                  .doreg1157:
  3952 000015BF 68CE04                   push 1230
  3953 000015C2 E852EE                   call istoken
  3954 000015C5 83C402                   add  sp, 2
  3955 000015C8 08C0                     or  al, al
  3956 000015CA 0F840E00                 je .doreg1158
  3957 000015CE 68[5617]                 push doreg1_1
  3958 000015D1 8D062FDA                 lea  ax, [ops]
  3959 000015D5 50                       push ax
  3960 000015D6 E876EC                   call strcpy
  3961 000015D9 83C404                   add  sp, 4
  3962                                  
  3963                                  ;-529   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3964                                  
  3965                                  .doreg1158:
  3966 000015DC 68CF04                   push 1231
  3967 000015DF E835EE                   call istoken
  3968 000015E2 83C402                   add  sp, 2
  3969 000015E5 08C0                     or  al, al
  3970 000015E7 0F840E00                 je .doreg1159
  3971 000015EB 68[5A17]                 push doreg1_2
  3972 000015EE 8D062FDA                 lea  ax, [ops]
  3973 000015F2 50                       push ax
  3974 000015F3 E859EC                   call strcpy
  3975 000015F6 83C404                   add  sp, 4
  3976                                  
  3977                                  ;-530   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3978                                  
  3979                                  .doreg1159:
  3980 000015F9 68D204                   push 1234
  3981 000015FC E818EE                   call istoken
  3982 000015FF 83C402                   add  sp, 2
  3983 00001602 08C0                     or  al, al
  3984 00001604 0F840E00                 je .doreg1160
  3985 00001608 68[5E17]                 push doreg1_3
  3986 0000160B 8D062FDA                 lea  ax, [ops]
  3987 0000160F 50                       push ax
  3988 00001610 E83CEC                   call strcpy
  3989 00001613 83C404                   add  sp, 4
  3990                                  
  3991                                  ;-531   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3992                                  
  3993                                  .doreg1160:
  3994 00001616 68D304                   push 1235
  3995 00001619 E8FBED                   call istoken
  3996 0000161C 83C402                   add  sp, 2
  3997 0000161F 08C0                     or  al, al
  3998 00001621 0F840E00                 je .doreg1161
  3999 00001625 68[6217]                 push doreg1_4
  4000 00001628 8D062FDA                 lea  ax, [ops]
  4001 0000162C 50                       push ax
  4002 0000162D E81FEC                   call strcpy
  4003 00001630 83C404                   add  sp, 4
  4004                                  
  4005                                  ;-532   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4006                                  
  4007                                  .doreg1161:
  4008 00001633 68D804                   push 1240
  4009 00001636 E8DEED                   call istoken
  4010 00001639 83C402                   add  sp, 2
  4011 0000163C 08C0                     or  al, al
  4012 0000163E 0F840E00                 je .doreg1162
  4013 00001642 68[6517]                 push doreg1_5
  4014 00001645 8D062FDA                 lea  ax, [ops]
  4015 00001649 50                       push ax
  4016 0000164A E802EC                   call strcpy
  4017 0000164D 83C404                   add  sp, 4
  4018                                  
  4019                                  ;-533   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4020                                  
  4021                                  .doreg1162:
  4022 00001650 68D904                   push 1241
  4023 00001653 E8C1ED                   call istoken
  4024 00001656 83C402                   add  sp, 2
  4025 00001659 08C0                     or  al, al
  4026 0000165B 0F840E00                 je .doreg1163
  4027 0000165F 68[6917]                 push doreg1_6
  4028 00001662 8D062FDA                 lea  ax, [ops]
  4029 00001666 50                       push ax
  4030 00001667 E8E5EB                   call strcpy
  4031 0000166A 83C404                   add  sp, 4
  4032                                  
  4033                                  ;-534   if (iscmp1 == 1) { token=getlex();
  4034                                  
  4035                                  .doreg1163:
  4036 0000166D 8B4604                   mov ax, [bp+4]
  4037 00001670 83F801                   cmp ax, 1
  4038 00001673 0F852700                 jne .doreg1164
  4039 00001677 E8431C                   call getlex
  4040 0000167A A3[1E00]                 mov word [token], ax
  4041                                  
  4042                                  ;-535       if (isrelational() ==0) error1("Relational expected");
  4043                                  
  4044 0000167D E8D61B                   call isrelational
  4045 00001680 83F800                   cmp ax, 0
  4046 00001683 0F850900                 jne .doreg1165
  4047 00001687 68[6D17]                 push doreg1_7
  4048 0000168A E8A726                   call error1
  4049 0000168D 83C402                   add  sp, 2
  4050                                  
  4051                                  ;-536       strcpy(ops, "cmp"); }
  4052                                  
  4053                                  .doreg1165:
  4054 00001690 68[8117]                 push doreg1_8
  4055 00001693 8D062FDA                 lea  ax, [ops]
  4056 00001697 50                       push ax
  4057 00001698 E8B4EB                   call strcpy
  4058 0000169B 83C404                   add  sp, 4
  4059                                  
  4060                                  ;-537   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4061                                  
  4062                                  .doreg1164:
  4063 0000169E E89DEE                   call prnl
  4064 000016A1 8D062FDA                 lea  ax, [ops]
  4065 000016A5 50                       push ax
  4066 000016A6 E8A3EE                   call prs
  4067 000016A9 83C402                   add  sp, 2
  4068 000016AC 68[8517]                 push doreg1_9
  4069 000016AF E89AEE                   call prs
  4070 000016B2 83C402                   add  sp, 2
  4071 000016B5 FF36[0814]               push word [ireg1]
  4072 000016B9 E8DD04                   call printreg
  4073 000016BC 83C402                   add  sp, 2
  4074 000016BF 68[8817]                 push doreg1_10
  4075 000016C2 E887EE                   call prs
  4076 000016C5 83C402                   add  sp, 2
  4077                                  
  4078                                  ;-538 
  4079                                  
  4080                                  
  4081                                  ;-539   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4082                                  
  4083 000016C8 680101                   push 257
  4084 000016CB E849ED                   call istoken
  4085 000016CE 83C402                   add  sp, 2
  4086 000016D1 08C0                     or  al, al
  4087 000016D3 0F840D00                 je .doreg1166
  4088 000016D7 FF36[2C00]               push word [lexval]
  4089 000016DB E8C3EF                   call prunsign1
  4090 000016DE 83C402                   add  sp, 2
  4091 000016E1 E94700                   jmp .reg1
  4092                                  
  4093                                  ;-540   mod2=typeName(); ireg2=checkreg();
  4094                                  
  4095                                  .doreg1166:
  4096 000016E4 E891F6                   call typeName
  4097 000016E7 A3[0A14]                 mov word [mod2], ax
  4098 000016EA E89E00                   call checkreg
  4099 000016ED A3[0C14]                 mov word [ireg2], ax
  4100                                  
  4101                                  ;-541   if (ireg2) {printreg(ireg2); goto reg1;}
  4102                                  
  4103 000016F0 A1[0C14]                 mov ax, [ireg2]
  4104 000016F3 08C0                     or  al, al
  4105 000016F5 0F840D00                 je .doreg1167
  4106 000016F9 FF36[0C14]               push word [ireg2]
  4107 000016FD E89904                   call printreg
  4108 00001700 83C402                   add  sp, 2
  4109 00001703 E92500                   jmp .reg1
  4110                                  
  4111                                  ;-542   i=searchname();  if (mod2 == 2) a(i); else v(i);
  4112                                  
  4113                                  .doreg1167:
  4114 00001706 E8A0F5                   call searchname
  4115 00001709 8946FE                   mov [bp-2], ax
  4116 0000170C A1[0A14]                 mov ax, [mod2]
  4117 0000170F 83F802                   cmp ax, 2
  4118 00001712 0F850C00                 jne .doreg1168
  4119 00001716 FF76FE                   push word [bp-2]
  4120 00001719 E84FEC                   call a
  4121 0000171C 83C402                   add  sp, 2
  4122 0000171F E90900                   jmp .doreg1169
  4123                                  .doreg1168:
  4124 00001722 FF76FE                   push word [bp-2]
  4125 00001725 E852EC                   call v
  4126 00001728 83C402                   add  sp, 2
  4127                                  
  4128                                  ;-543   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4129                                  
  4130                                  .doreg1169:
  4131                                  .reg1:
  4132 0000172B 8B4604                   mov ax, [bp+4]
  4133 0000172E 83F801                   cmp ax, 1
  4134 00001731 0F851B00                 jne .doreg1170
  4135 00001735 6A00                     push 0
  4136 00001737 E85E18                   call cmpneg
  4137 0000173A 83C402                   add  sp, 2
  4138 0000173D 8D063B6A                 lea  ax, [fname]
  4139 00001741 50                       push ax
  4140 00001742 E807EE                   call prs
  4141 00001745 83C402                   add  sp, 2
  4142 00001748 6A29                     push 41
  4143 0000174A E8ECEC                   call expect
  4144 0000174D 83C402                   add  sp, 2
  4145                                  
  4146                                  ;-544 }
  4147                                  
  4148                                  .doreg1170:
  4149                                  
  4150                                  ;-545 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4151 00001750 C9                       LEAVE
  4152 00001751 C3                       ret
  4153 00001752 6D6F7600                doreg1_0 db "mov",0
  4154 00001756 61646400                doreg1_1 db "add",0
  4155 0000175A 73756200                doreg1_2 db "sub",0
  4156 0000175E 616E6400                doreg1_3 db "and",0
  4157 00001762 6F7200                  doreg1_4 db "or",0
  4158 00001765 73686C00                doreg1_5 db "shl",0
  4159 00001769 73687200                doreg1_6 db "shr",0
  4160 0000176D 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4161 00001776 6C2065787065637465-
  4162 0000177F 6400               
  4163 00001781 636D7000                doreg1_8 db "cmp",0
  4164 00001785 202000                  doreg1_9 db "  ",0
  4165 00001788 2C2000                  doreg1_10 db ", ",0
  4166                                  ENDP
  4167                                  
  4168                                  checkreg: PROC
  4169                                  
  4170                                  ;-546   if (strlen(symbol) <  2) return 0;
  4171                                  
  4172 0000178B 8D06BB69                 lea  ax, [symbol]
  4173 0000178F 50                       push ax
  4174 00001790 E894EA                   call strlen
  4175 00001793 83C402                   add  sp, 2
  4176 00001796 83F802                   cmp ax, 2
  4177 00001799 0F8D0600                 jge .checkreg171
  4178 0000179D B80000                   mov ax, 0
  4179 000017A0 E94403                   jmp .retncheckreg
  4180                                  
  4181                                  ;-547   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4182                                  
  4183                                  .checkreg171:
  4184 000017A3 68[E81A]                 push checkreg_0
  4185 000017A6 8D06BB69                 lea  ax, [symbol]
  4186 000017AA 50                       push ax
  4187 000017AB E8D7EA                   call eqstr
  4188 000017AE 83C404                   add  sp, 4
  4189 000017B1 08C0                     or  al, al
  4190 000017B3 0F840600                 je .checkreg172
  4191 000017B7 B80100                   mov ax, 1
  4192 000017BA E92A03                   jmp .retncheckreg
  4193                                  .checkreg172:
  4194 000017BD 68[EB1A]                 push checkreg_1
  4195 000017C0 8D06BB69                 lea  ax, [symbol]
  4196 000017C4 50                       push ax
  4197 000017C5 E8BDEA                   call eqstr
  4198 000017C8 83C404                   add  sp, 4
  4199 000017CB 08C0                     or  al, al
  4200 000017CD 0F840600                 je .checkreg173
  4201 000017D1 B80300                   mov ax, 3
  4202 000017D4 E91003                   jmp .retncheckreg
  4203                                  
  4204                                  ;-548   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4205                                  
  4206                                  .checkreg173:
  4207 000017D7 68[EE1A]                 push checkreg_2
  4208 000017DA 8D06BB69                 lea  ax, [symbol]
  4209 000017DE 50                       push ax
  4210 000017DF E8A3EA                   call eqstr
  4211 000017E2 83C404                   add  sp, 4
  4212 000017E5 08C0                     or  al, al
  4213 000017E7 0F840600                 je .checkreg174
  4214 000017EB B80500                   mov ax, 5
  4215 000017EE E9F602                   jmp .retncheckreg
  4216                                  .checkreg174:
  4217 000017F1 68[F11A]                 push checkreg_3
  4218 000017F4 8D06BB69                 lea  ax, [symbol]
  4219 000017F8 50                       push ax
  4220 000017F9 E889EA                   call eqstr
  4221 000017FC 83C404                   add  sp, 4
  4222 000017FF 08C0                     or  al, al
  4223 00001801 0F840600                 je .checkreg175
  4224 00001805 B80700                   mov ax, 7
  4225 00001808 E9DC02                   jmp .retncheckreg
  4226                                  
  4227                                  ;-549   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4228                                  
  4229                                  .checkreg175:
  4230 0000180B 68[F41A]                 push checkreg_4
  4231 0000180E 8D06BB69                 lea  ax, [symbol]
  4232 00001812 50                       push ax
  4233 00001813 E86FEA                   call eqstr
  4234 00001816 83C404                   add  sp, 4
  4235 00001819 08C0                     or  al, al
  4236 0000181B 0F840600                 je .checkreg176
  4237 0000181F B80900                   mov ax, 9
  4238 00001822 E9C202                   jmp .retncheckreg
  4239                                  .checkreg176:
  4240 00001825 68[F71A]                 push checkreg_5
  4241 00001828 8D06BB69                 lea  ax, [symbol]
  4242 0000182C 50                       push ax
  4243 0000182D E855EA                   call eqstr
  4244 00001830 83C404                   add  sp, 4
  4245 00001833 08C0                     or  al, al
  4246 00001835 0F840600                 je .checkreg177
  4247 00001839 B80B00                   mov ax, 11
  4248 0000183C E9A802                   jmp .retncheckreg
  4249                                  
  4250                                  ;-550   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4251                                  
  4252                                  .checkreg177:
  4253 0000183F 68[FA1A]                 push checkreg_6
  4254 00001842 8D06BB69                 lea  ax, [symbol]
  4255 00001846 50                       push ax
  4256 00001847 E83BEA                   call eqstr
  4257 0000184A 83C404                   add  sp, 4
  4258 0000184D 08C0                     or  al, al
  4259 0000184F 0F840600                 je .checkreg178
  4260 00001853 B80D00                   mov ax, 13
  4261 00001856 E98E02                   jmp .retncheckreg
  4262                                  .checkreg178:
  4263 00001859 68[FD1A]                 push checkreg_7
  4264 0000185C 8D06BB69                 lea  ax, [symbol]
  4265 00001860 50                       push ax
  4266 00001861 E821EA                   call eqstr
  4267 00001864 83C404                   add  sp, 4
  4268 00001867 08C0                     or  al, al
  4269 00001869 0F840600                 je .checkreg179
  4270 0000186D B80F00                   mov ax, 15
  4271 00001870 E97402                   jmp .retncheckreg
  4272                                  
  4273                                  ;-551   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4274                                  
  4275                                  .checkreg179:
  4276 00001873 68[001B]                 push checkreg_8
  4277 00001876 8D06BB69                 lea  ax, [symbol]
  4278 0000187A 50                       push ax
  4279 0000187B E807EA                   call eqstr
  4280 0000187E 83C404                   add  sp, 4
  4281 00001881 08C0                     or  al, al
  4282 00001883 0F840600                 je .checkreg180
  4283 00001887 B81100                   mov ax, 17
  4284 0000188A E95A02                   jmp .retncheckreg
  4285                                  .checkreg180:
  4286 0000188D 68[031B]                 push checkreg_9
  4287 00001890 8D06BB69                 lea  ax, [symbol]
  4288 00001894 50                       push ax
  4289 00001895 E8EDE9                   call eqstr
  4290 00001898 83C404                   add  sp, 4
  4291 0000189B 08C0                     or  al, al
  4292 0000189D 0F840600                 je .checkreg181
  4293 000018A1 B81300                   mov ax, 19
  4294 000018A4 E94002                   jmp .retncheckreg
  4295                                  
  4296                                  ;-552   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4297                                  
  4298                                  .checkreg181:
  4299 000018A7 68[061B]                 push checkreg_10
  4300 000018AA 8D06BB69                 lea  ax, [symbol]
  4301 000018AE 50                       push ax
  4302 000018AF E8D3E9                   call eqstr
  4303 000018B2 83C404                   add  sp, 4
  4304 000018B5 08C0                     or  al, al
  4305 000018B7 0F840600                 je .checkreg182
  4306 000018BB B81500                   mov ax, 21
  4307 000018BE E92602                   jmp .retncheckreg
  4308                                  .checkreg182:
  4309 000018C1 68[091B]                 push checkreg_11
  4310 000018C4 8D06BB69                 lea  ax, [symbol]
  4311 000018C8 50                       push ax
  4312 000018C9 E8B9E9                   call eqstr
  4313 000018CC 83C404                   add  sp, 4
  4314 000018CF 08C0                     or  al, al
  4315 000018D1 0F840600                 je .checkreg183
  4316 000018D5 B81700                   mov ax, 23
  4317 000018D8 E90C02                   jmp .retncheckreg
  4318                                  
  4319                                  ;-553   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4320                                  
  4321                                  .checkreg183:
  4322 000018DB 68[0C1B]                 push checkreg_12
  4323 000018DE 8D06BB69                 lea  ax, [symbol]
  4324 000018E2 50                       push ax
  4325 000018E3 E89FE9                   call eqstr
  4326 000018E6 83C404                   add  sp, 4
  4327 000018E9 08C0                     or  al, al
  4328 000018EB 0F840600                 je .checkreg184
  4329 000018EF B81900                   mov ax, 25
  4330 000018F2 E9F201                   jmp .retncheckreg
  4331                                  .checkreg184:
  4332 000018F5 68[0F1B]                 push checkreg_13
  4333 000018F8 8D06BB69                 lea  ax, [symbol]
  4334 000018FC 50                       push ax
  4335 000018FD E885E9                   call eqstr
  4336 00001900 83C404                   add  sp, 4
  4337 00001903 08C0                     or  al, al
  4338 00001905 0F840600                 je .checkreg185
  4339 00001909 B81B00                   mov ax, 27
  4340 0000190C E9D801                   jmp .retncheckreg
  4341                                  
  4342                                  ;-554   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4343                                  
  4344                                  .checkreg185:
  4345 0000190F 68[121B]                 push checkreg_14
  4346 00001912 8D06BB69                 lea  ax, [symbol]
  4347 00001916 50                       push ax
  4348 00001917 E86BE9                   call eqstr
  4349 0000191A 83C404                   add  sp, 4
  4350 0000191D 08C0                     or  al, al
  4351 0000191F 0F840600                 je .checkreg186
  4352 00001923 B81D00                   mov ax, 29
  4353 00001926 E9BE01                   jmp .retncheckreg
  4354                                  .checkreg186:
  4355 00001929 68[151B]                 push checkreg_15
  4356 0000192C 8D06BB69                 lea  ax, [symbol]
  4357 00001930 50                       push ax
  4358 00001931 E851E9                   call eqstr
  4359 00001934 83C404                   add  sp, 4
  4360 00001937 08C0                     or  al, al
  4361 00001939 0F840600                 je .checkreg187
  4362 0000193D B81F00                   mov ax, 31
  4363 00001940 E9A401                   jmp .retncheckreg
  4364                                  
  4365                                  ;-555   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4366                                  
  4367                                  .checkreg187:
  4368 00001943 68[181B]                 push checkreg_16
  4369 00001946 8D06BB69                 lea  ax, [symbol]
  4370 0000194A 50                       push ax
  4371 0000194B E837E9                   call eqstr
  4372 0000194E 83C404                   add  sp, 4
  4373 00001951 08C0                     or  al, al
  4374 00001953 0F840600                 je .checkreg188
  4375 00001957 B82100                   mov ax, 33
  4376 0000195A E98A01                   jmp .retncheckreg
  4377                                  .checkreg188:
  4378 0000195D 68[1B1B]                 push checkreg_17
  4379 00001960 8D06BB69                 lea  ax, [symbol]
  4380 00001964 50                       push ax
  4381 00001965 E81DE9                   call eqstr
  4382 00001968 83C404                   add  sp, 4
  4383 0000196B 08C0                     or  al, al
  4384 0000196D 0F840600                 je .checkreg189
  4385 00001971 B82300                   mov ax, 35
  4386 00001974 E97001                   jmp .retncheckreg
  4387                                  
  4388                                  ;-556   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4389                                  
  4390                                  .checkreg189:
  4391 00001977 68[1E1B]                 push checkreg_18
  4392 0000197A 8D06BB69                 lea  ax, [symbol]
  4393 0000197E 50                       push ax
  4394 0000197F E803E9                   call eqstr
  4395 00001982 83C404                   add  sp, 4
  4396 00001985 08C0                     or  al, al
  4397 00001987 0F840600                 je .checkreg190
  4398 0000198B B82500                   mov ax, 37
  4399 0000198E E95601                   jmp .retncheckreg
  4400                                  .checkreg190:
  4401 00001991 68[211B]                 push checkreg_19
  4402 00001994 8D06BB69                 lea  ax, [symbol]
  4403 00001998 50                       push ax
  4404 00001999 E8E9E8                   call eqstr
  4405 0000199C 83C404                   add  sp, 4
  4406 0000199F 08C0                     or  al, al
  4407 000019A1 0F840600                 je .checkreg191
  4408 000019A5 B82700                   mov ax, 39
  4409 000019A8 E93C01                   jmp .retncheckreg
  4410                                  
  4411                                  ;-557   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4412                                  
  4413                                  .checkreg191:
  4414 000019AB 68[241B]                 push checkreg_20
  4415 000019AE 8D06BB69                 lea  ax, [symbol]
  4416 000019B2 50                       push ax
  4417 000019B3 E8CFE8                   call eqstr
  4418 000019B6 83C404                   add  sp, 4
  4419 000019B9 08C0                     or  al, al
  4420 000019BB 0F840600                 je .checkreg192
  4421 000019BF B82900                   mov ax, 41
  4422 000019C2 E92201                   jmp .retncheckreg
  4423                                  .checkreg192:
  4424 000019C5 68[271B]                 push checkreg_21
  4425 000019C8 8D06BB69                 lea  ax, [symbol]
  4426 000019CC 50                       push ax
  4427 000019CD E8B5E8                   call eqstr
  4428 000019D0 83C404                   add  sp, 4
  4429 000019D3 08C0                     or  al, al
  4430 000019D5 0F840600                 je .checkreg193
  4431 000019D9 B82B00                   mov ax, 43
  4432 000019DC E90801                   jmp .retncheckreg
  4433                                  
  4434                                  ;-558   // (eqstr(symbol,"ip")) return 45;
  4435                                  
  4436                                  
  4437                                  ;-559   if (strlen(symbol) >   3) return 0;
  4438                                  
  4439                                  .checkreg193:
  4440 000019DF 8D06BB69                 lea  ax, [symbol]
  4441 000019E3 50                       push ax
  4442 000019E4 E840E8                   call strlen
  4443 000019E7 83C402                   add  sp, 2
  4444 000019EA 83F803                   cmp ax, 3
  4445 000019ED 0F8E0600                 jle .checkreg194
  4446 000019F1 B80000                   mov ax, 0
  4447 000019F4 E9F000                   jmp .retncheckreg
  4448                                  
  4449                                  ;-560   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4450                                  
  4451                                  .checkreg194:
  4452 000019F7 68[2A1B]                 push checkreg_22
  4453 000019FA 8D06BB69                 lea  ax, [symbol]
  4454 000019FE 50                       push ax
  4455 000019FF E883E8                   call eqstr
  4456 00001A02 83C404                   add  sp, 4
  4457 00001A05 08C0                     or  al, al
  4458 00001A07 0F840600                 je .checkreg195
  4459 00001A0B B82F00                   mov ax, 47
  4460 00001A0E E9D600                   jmp .retncheckreg
  4461                                  .checkreg195:
  4462 00001A11 68[2E1B]                 push checkreg_23
  4463 00001A14 8D06BB69                 lea  ax, [symbol]
  4464 00001A18 50                       push ax
  4465 00001A19 E869E8                   call eqstr
  4466 00001A1C 83C404                   add  sp, 4
  4467 00001A1F 08C0                     or  al, al
  4468 00001A21 0F840600                 je .checkreg196
  4469 00001A25 B83200                   mov ax, 50
  4470 00001A28 E9BC00                   jmp .retncheckreg
  4471                                  
  4472                                  ;-561   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4473                                  
  4474                                  .checkreg196:
  4475 00001A2B 68[321B]                 push checkreg_24
  4476 00001A2E 8D06BB69                 lea  ax, [symbol]
  4477 00001A32 50                       push ax
  4478 00001A33 E84FE8                   call eqstr
  4479 00001A36 83C404                   add  sp, 4
  4480 00001A39 08C0                     or  al, al
  4481 00001A3B 0F840600                 je .checkreg197
  4482 00001A3F B83500                   mov ax, 53
  4483 00001A42 E9A200                   jmp .retncheckreg
  4484                                  .checkreg197:
  4485 00001A45 68[361B]                 push checkreg_25
  4486 00001A48 8D06BB69                 lea  ax, [symbol]
  4487 00001A4C 50                       push ax
  4488 00001A4D E835E8                   call eqstr
  4489 00001A50 83C404                   add  sp, 4
  4490 00001A53 08C0                     or  al, al
  4491 00001A55 0F840600                 je .checkreg198
  4492 00001A59 B83800                   mov ax, 56
  4493 00001A5C E98800                   jmp .retncheckreg
  4494                                  
  4495                                  ;-562   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4496                                  
  4497                                  .checkreg198:
  4498 00001A5F 68[3A1B]                 push checkreg_26
  4499 00001A62 8D06BB69                 lea  ax, [symbol]
  4500 00001A66 50                       push ax
  4501 00001A67 E81BE8                   call eqstr
  4502 00001A6A 83C404                   add  sp, 4
  4503 00001A6D 08C0                     or  al, al
  4504 00001A6F 0F840600                 je .checkreg199
  4505 00001A73 B83B00                   mov ax, 59
  4506 00001A76 E96E00                   jmp .retncheckreg
  4507                                  .checkreg199:
  4508 00001A79 68[3E1B]                 push checkreg_27
  4509 00001A7C 8D06BB69                 lea  ax, [symbol]
  4510 00001A80 50                       push ax
  4511 00001A81 E801E8                   call eqstr
  4512 00001A84 83C404                   add  sp, 4
  4513 00001A87 08C0                     or  al, al
  4514 00001A89 0F840600                 je .checkreg200
  4515 00001A8D B83E00                   mov ax, 62
  4516 00001A90 E95400                   jmp .retncheckreg
  4517                                  
  4518                                  ;-563   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4519                                  
  4520                                  .checkreg200:
  4521 00001A93 68[421B]                 push checkreg_28
  4522 00001A96 8D06BB69                 lea  ax, [symbol]
  4523 00001A9A 50                       push ax
  4524 00001A9B E8E7E7                   call eqstr
  4525 00001A9E 83C404                   add  sp, 4
  4526 00001AA1 08C0                     or  al, al
  4527 00001AA3 0F840600                 je .checkreg201
  4528 00001AA7 B84100                   mov ax, 65
  4529 00001AAA E93A00                   jmp .retncheckreg
  4530                                  .checkreg201:
  4531 00001AAD 68[461B]                 push checkreg_29
  4532 00001AB0 8D06BB69                 lea  ax, [symbol]
  4533 00001AB4 50                       push ax
  4534 00001AB5 E8CDE7                   call eqstr
  4535 00001AB8 83C404                   add  sp, 4
  4536 00001ABB 08C0                     or  al, al
  4537 00001ABD 0F840600                 je .checkreg202
  4538 00001AC1 B84400                   mov ax, 68
  4539 00001AC4 E92000                   jmp .retncheckreg
  4540                                  
  4541                                  ;-564   if (eqstr(symbol,"cr0")) return 71;
  4542                                  
  4543                                  .checkreg202:
  4544 00001AC7 68[4A1B]                 push checkreg_30
  4545 00001ACA 8D06BB69                 lea  ax, [symbol]
  4546 00001ACE 50                       push ax
  4547 00001ACF E8B3E7                   call eqstr
  4548 00001AD2 83C404                   add  sp, 4
  4549 00001AD5 08C0                     or  al, al
  4550 00001AD7 0F840600                 je .checkreg203
  4551 00001ADB B84700                   mov ax, 71
  4552 00001ADE E90600                   jmp .retncheckreg
  4553                                  
  4554                                  ;-565   return 0;   }
  4555                                  
  4556                                  .checkreg203:
  4557 00001AE1 B80000                   mov ax, 0
  4558 00001AE4 E90000                   jmp .retncheckreg
  4559                                  
  4560                                  ;-566 
  4561                                  
  4562                                  
  4563                                  ;-567 char printregstr[]
  4564                                  
  4565                                   .retncheckreg:
  4566 00001AE7 C3                       ret
  4567 00001AE8 616C00                  checkreg_0 db "al",0
  4568 00001AEB 636C00                  checkreg_1 db "cl",0
  4569 00001AEE 646C00                  checkreg_2 db "dl",0
  4570 00001AF1 626C00                  checkreg_3 db "bl",0
  4571 00001AF4 616800                  checkreg_4 db "ah",0
  4572 00001AF7 636800                  checkreg_5 db "ch",0
  4573 00001AFA 646800                  checkreg_6 db "dh",0
  4574 00001AFD 626800                  checkreg_7 db "bh",0
  4575 00001B00 617800                  checkreg_8 db "ax",0
  4576 00001B03 637800                  checkreg_9 db "cx",0
  4577 00001B06 647800                  checkreg_10 db "dx",0
  4578 00001B09 627800                  checkreg_11 db "bx",0
  4579 00001B0C 737000                  checkreg_12 db "sp",0
  4580 00001B0F 627000                  checkreg_13 db "bp",0
  4581 00001B12 736900                  checkreg_14 db "si",0
  4582 00001B15 646900                  checkreg_15 db "di",0
  4583 00001B18 657300                  checkreg_16 db "es",0
  4584 00001B1B 637300                  checkreg_17 db "cs",0
  4585 00001B1E 737300                  checkreg_18 db "ss",0
  4586 00001B21 647300                  checkreg_19 db "ds",0
  4587 00001B24 667300                  checkreg_20 db "fs",0
  4588 00001B27 677300                  checkreg_21 db "gs",0
  4589 00001B2A 65617800                checkreg_22 db "eax",0
  4590 00001B2E 65637800                checkreg_23 db "ecx",0
  4591 00001B32 65647800                checkreg_24 db "edx",0
  4592 00001B36 65627800                checkreg_25 db "ebx",0
  4593 00001B3A 65737000                checkreg_26 db "esp",0
  4594 00001B3E 65627000                checkreg_27 db "ebp",0
  4595 00001B42 65736900                checkreg_28 db "esi",0
  4596 00001B46 65646900                checkreg_29 db "edi",0
  4597 00001B4A 63723000                checkreg_30 db "cr0",0
  4598                                  ENDP
  4599                                  
  4600                                  ;-568 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4601                                  
  4602 00001B4E 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4603 00001B57 616863686468626861-
  4604 00001B60 786378647862787370-
  4605 00001B69 627073696469657363-
  4606 00001B72 737373647366736773-
  4607 00001B7B 697065617865637865-
  4608 00001B84 647865627865737065-
  4609 00001B8D 627065736965646963-
  4610 00001B96 723000             
  4611                                  
  4612                                  ;-569 
  4613                                  
  4614                                  
  4615                                  ;-570 int printreg(int i) {  unsigned int k; unsigned char c;
  4616                                  
  4617                                  
  4618                                  printreg: PROC
  4619                                  
  4620                                  ;-571   k = &printregstr + i; c=*k; prc(c); i++;
  4621                                  
  4622                                  ;Function : printreg, Number of local variables: 3
  4623                                  ;   # type sign width addr used name   list of local variables
  4624                                  ;  200 var sign word   570 NULL i = bp+4
  4625                                  ;  201 var unsg word   570 NULL k = bp-2
  4626                                  ;  202 var unsg byte   570 NULL c = bp-4;
  4627 00001B99 C8040000                 ENTER  4,0
  4628 00001B9D B8[4E1B]                 mov ax, printregstr
  4629 00001BA0 034604                   add ax, [bp+4]
  4630 00001BA3 8946FE                   mov [bp-2], ax
  4631 00001BA6 8B5EFE                   mov bx, [bp-2]
  4632 00001BA9 8B07                     mov ax, [bx]
  4633 00001BAB 8846FC                   mov [bp-4], al
  4634 00001BAE 8A46FC                   mov al, byte [bp-4]
  4635 00001BB1 B400                     mov ah, 0
  4636 00001BB3 50                       push ax
  4637 00001BB4 E82EE9                   call prc
  4638 00001BB7 83C402                   add  sp, 2
  4639 00001BBA FF4604                   inc  word[bp+4]
  4640                                  
  4641                                  ;-572   k = &printregstr + i; c=*k; prc(c);
  4642                                  
  4643 00001BBD B8[4E1B]                 mov ax, printregstr
  4644 00001BC0 034604                   add ax, [bp+4]
  4645 00001BC3 8946FE                   mov [bp-2], ax
  4646 00001BC6 8B5EFE                   mov bx, [bp-2]
  4647 00001BC9 8B07                     mov ax, [bx]
  4648 00001BCB 8846FC                   mov [bp-4], al
  4649 00001BCE 8A46FC                   mov al, byte [bp-4]
  4650 00001BD1 B400                     mov ah, 0
  4651 00001BD3 50                       push ax
  4652 00001BD4 E80EE9                   call prc
  4653 00001BD7 83C402                   add  sp, 2
  4654                                  
  4655                                  ;-573   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4656                                  
  4657 00001BDA 8B4604                   mov ax, [bp+4]
  4658 00001BDD 83F82F                   cmp ax, 47
  4659 00001BE0 0F8E2000                 jle .printreg204
  4660 00001BE4 FF4604                   inc  word[bp+4]
  4661 00001BE7 B8[4E1B]                 mov ax, printregstr
  4662 00001BEA 034604                   add ax, [bp+4]
  4663 00001BED 8946FE                   mov [bp-2], ax
  4664 00001BF0 8B5EFE                   mov bx, [bp-2]
  4665 00001BF3 8B07                     mov ax, [bx]
  4666 00001BF5 8846FC                   mov [bp-4], al
  4667 00001BF8 8A46FC                   mov al, byte [bp-4]
  4668 00001BFB B400                     mov ah, 0
  4669 00001BFD 50                       push ax
  4670 00001BFE E8E4E8                   call prc
  4671 00001C01 83C402                   add  sp, 2
  4672                                  
  4673                                  ;-574 }
  4674                                  
  4675                                  .printreg204:
  4676                                  
  4677                                  ;-575 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4678 00001C04 C9                       LEAVE
  4679 00001C05 C3                       ret
  4680                                  ENDP
  4681 00001C06 0000                    evalue dw 0
  4682 00001C08 0A00                    exprtype dw 10
  4683                                  
  4684                                  ;-576 int expr(int isRight)
  4685                                  
  4686                                  
  4687                                  expr: PROC
  4688                                  
  4689                                  ;-577 { int mode; int id1;     int ixarr; int ixconst;
  4690                                  
  4691                                  
  4692                                  ;-578   int ids;  int isCONST; int i;     unsigned char *p;
  4693                                  
  4694                                  
  4695                                  ;-579   if (istoken(T_CONST)) { evalue=lexval;
  4696                                  
  4697                                  ;Function : expr, Number of local variables: 9
  4698                                  ;   # type sign width addr used name   list of local variables
  4699                                  ;  200 var sign word   576 NULL isRight = bp+4
  4700                                  ;  201 var sign word   577 NULL mode = bp-2
  4701                                  ;  202 var sign word   577 NULL id1 = bp-4
  4702                                  ;  203 var sign word   577 NULL ixarr = bp-6
  4703                                  ;  204 var sign word   577 NULL ixconst = bp-8
  4704                                  ;  205 var sign word   578 NULL ids = bp-10
  4705                                  ;  206 var sign word   578 NULL isCONST = bp-12
  4706                                  ;  207 var sign word   578 NULL i = bp-14
  4707                                  ;  208 ptr unsg byte   578 NULL p = bp-16;
  4708 00001C0A C8100000                 ENTER  16,0
  4709 00001C0E 680101                   push 257
  4710 00001C11 E803E8                   call istoken
  4711 00001C14 83C402                   add  sp, 2
  4712 00001C17 08C0                     or  al, al
  4713 00001C19 0F841F00                 je .expr205
  4714 00001C1D A1[2C00]                 mov ax, [lexval]
  4715 00001C20 A3[061C]                 mov word [evalue], ax
  4716                                  
  4717                                  ;-580     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4718                                  
  4719 00001C23 68[AA1F]                 push expr_0
  4720 00001C26 E823E9                   call prs
  4721 00001C29 83C402                   add  sp, 2
  4722 00001C2C FF36[2C00]               push word [lexval]
  4723 00001C30 E86EEA                   call prunsign1
  4724 00001C33 83C402                   add  sp, 2
  4725 00001C36 B80400                   mov ax, 4
  4726 00001C39 E96C03                   jmp .retnexpr
  4727                                  
  4728                                  ;-581   mode=typeName(); /*0=V,1=*,2=&*/
  4729                                  
  4730                                  .expr205:
  4731 00001C3C E839F1                   call typeName
  4732 00001C3F 8946FE                   mov [bp-2], ax
  4733                                  
  4734                                  ;-582   ireg1=checkreg();
  4735                                  
  4736 00001C42 E846FB                   call checkreg
  4737 00001C45 A3[0814]                 mov word [ireg1], ax
  4738                                  
  4739                                  ;-583   if (ireg1) { doreg1(0); return; }
  4740                                  
  4741 00001C48 A1[0814]                 mov ax, [ireg1]
  4742 00001C4B 08C0                     or  al, al
  4743 00001C4D 0F840B00                 je .expr206
  4744 00001C51 6A00                     push 0
  4745 00001C53 E849F9                   call doreg1
  4746 00001C56 83C402                   add  sp, 2
  4747 00001C59 E94C03                   jmp .retnexpr
  4748                                  
  4749                                  ;-584   if (token=='(')  {docall1(); goto e1; }
  4750                                  
  4751                                  .expr206:
  4752 00001C5C A1[1E00]                 mov ax, [token]
  4753 00001C5F 83F828                   cmp ax, 40
  4754 00001C62 0F850600                 jne .expr207
  4755 00001C66 E82F0F                   call docall1
  4756 00001C69 E93202                   jmp .e1
  4757                                  
  4758                                  ;-585   if (isreg()) goto e1;
  4759                                  
  4760                                  .expr207:
  4761 00001C6C E88407                   call isreg
  4762 00001C6F 08C0                     or  al, al
  4763 00001C71 0F840300                 je .expr208
  4764 00001C75 E92602                   jmp .e1
  4765                                  
  4766                                  ;-586 
  4767                                  
  4768                                  
  4769                                  ;-587   id1=searchname(); gettypes(id1); ids=signi;
  4770                                  
  4771                                  .expr208:
  4772 00001C78 E82EF0                   call searchname
  4773 00001C7B 8946FC                   mov [bp-4], ax
  4774 00001C7E FF76FC                   push word [bp-4]
  4775 00001C81 E8E7EE                   call gettypes
  4776 00001C84 83C402                   add  sp, 2
  4777 00001C87 A1[3100]                 mov ax, [signi]
  4778 00001C8A 8946F6                   mov [bp-10], ax
  4779                                  
  4780                                  ;-588   ixarr=0;  ixconst=0;
  4781                                  
  4782 00001C8D B80000                   mov ax, 0
  4783 00001C90 8946FA                   mov [bp-6], ax
  4784 00001C93 B80000                   mov ax, 0
  4785 00001C96 8946F8                   mov [bp-8], ax
  4786                                  
  4787                                  ;-589     if (istoken('[')) { if (istoken(T_CONST)) {
  4788                                  
  4789 00001C99 6A5B                     push 91
  4790 00001C9B E879E7                   call istoken
  4791 00001C9E 83C402                   add  sp, 2
  4792 00001CA1 08C0                     or  al, al
  4793 00001CA3 0F845900                 je .expr209
  4794 00001CA7 680101                   push 257
  4795 00001CAA E86AE7                   call istoken
  4796 00001CAD 83C402                   add  sp, 2
  4797 00001CB0 08C0                     or  al, al
  4798 00001CB2 0F841700                 je .expr210
  4799                                  
  4800                                  ;-590       ixconst=1; ixarr=lexval; expect(']');  }
  4801                                  
  4802 00001CB6 B80100                   mov ax, 1
  4803 00001CB9 8946F8                   mov [bp-8], ax
  4804 00001CBC A1[2C00]                 mov ax, [lexval]
  4805 00001CBF 8946FA                   mov [bp-6], ax
  4806 00001CC2 6A5D                     push 93
  4807 00001CC4 E872E7                   call expect
  4808 00001CC7 83C402                   add  sp, 2
  4809                                  
  4810                                  ;-591     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4811                                  
  4812 00001CCA E93300                   jmp .expr211
  4813                                  .expr210:
  4814 00001CCD E8D9EF                   call searchname
  4815 00001CD0 8946FA                   mov [bp-6], ax
  4816 00001CD3 680001                   push 256
  4817 00001CD6 E860E7                   call expect
  4818 00001CD9 83C402                   add  sp, 2
  4819 00001CDC 6A5D                     push 93
  4820 00001CDE E858E7                   call expect
  4821 00001CE1 83C402                   add  sp, 2
  4822                                  
  4823                                  ;-592     gettypes(ixarr);
  4824                                  
  4825 00001CE4 FF76FA                   push word [bp-6]
  4826 00001CE7 E881EE                   call gettypes
  4827 00001CEA 83C402                   add  sp, 2
  4828                                  
  4829                                  ;-593     if (widthi != 2) error1("Array index must be number or int"); } }
  4830                                  
  4831 00001CED A1[3400]                 mov ax, [widthi]
  4832 00001CF0 83F802                   cmp ax, 2
  4833 00001CF3 0F840900                 je  .expr212
  4834 00001CF7 68[B61F]                 push expr_1
  4835 00001CFA E83720                   call error1
  4836 00001CFD 83C402                   add  sp, 2
  4837                                  .expr212:
  4838                                  .expr211:
  4839                                  
  4840                                  ;-594   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  4841                                  
  4842                                  .expr209:
  4843 00001D00 68C304                   push 1219
  4844 00001D03 E811E7                   call istoken
  4845 00001D06 83C402                   add  sp, 2
  4846 00001D09 08C0                     or  al, al
  4847 00001D0B 0F844600                 je .expr213
  4848 00001D0F 8B46FE                   mov ax, [bp-2]
  4849 00001D12 08C0                     or  al, al
  4850 00001D14 0F840900                 je .expr214
  4851 00001D18 68[D81F]                 push expr_2
  4852 00001D1B E81620                   call error1
  4853 00001D1E 83C402                   add  sp, 2
  4854                                  
  4855                                  ;-595      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4856                                  
  4857                                  .expr214:
  4858 00001D21 68[E91F]                 push expr_3
  4859 00001D24 E825E8                   call prs
  4860 00001D27 83C402                   add  sp, 2
  4861 00001D2A A1[3700]                 mov ax, [wi]
  4862 00001D2D 83F802                   cmp ax, 2
  4863 00001D30 0F850C00                 jne .expr215
  4864 00001D34 68[F21F]                 push expr_4
  4865 00001D37 E812E8                   call prs
  4866 00001D3A 83C402                   add  sp, 2
  4867 00001D3D E90900                   jmp .expr216
  4868                                  .expr215:
  4869 00001D40 68[F71F]                 push expr_5
  4870 00001D43 E806E8                   call prs
  4871 00001D46 83C402                   add  sp, 2
  4872                                  
  4873                                  ;-596      v(id1); goto e1;}
  4874                                  
  4875                                  .expr216:
  4876 00001D49 FF76FC                   push word [bp-4]
  4877 00001D4C E82BE6                   call v
  4878 00001D4F 83C402                   add  sp, 2
  4879 00001D52 E94901                   jmp .e1
  4880                                  
  4881                                  ;-597   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  4882                                  
  4883                                  .expr213:
  4884 00001D55 68C904                   push 1225
  4885 00001D58 E8BCE6                   call istoken
  4886 00001D5B 83C402                   add  sp, 2
  4887 00001D5E 08C0                     or  al, al
  4888 00001D60 0F844600                 je .expr217
  4889 00001D64 8B46FE                   mov ax, [bp-2]
  4890 00001D67 08C0                     or  al, al
  4891 00001D69 0F840900                 je .expr218
  4892 00001D6D 68[FC1F]                 push expr_6
  4893 00001D70 E8C11F                   call error1
  4894 00001D73 83C402                   add  sp, 2
  4895                                  
  4896                                  ;-598      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4897                                  
  4898                                  .expr218:
  4899 00001D76 68[0D20]                 push expr_7
  4900 00001D79 E8D0E7                   call prs
  4901 00001D7C 83C402                   add  sp, 2
  4902 00001D7F A1[3700]                 mov ax, [wi]
  4903 00001D82 83F802                   cmp ax, 2
  4904 00001D85 0F850C00                 jne .expr219
  4905 00001D89 68[1620]                 push expr_8
  4906 00001D8C E8BDE7                   call prs
  4907 00001D8F 83C402                   add  sp, 2
  4908 00001D92 E90900                   jmp .expr220
  4909                                  .expr219:
  4910 00001D95 68[1B20]                 push expr_9
  4911 00001D98 E8B1E7                   call prs
  4912 00001D9B 83C402                   add  sp, 2
  4913                                  
  4914                                  ;-599      v(id1); goto e1;}
  4915                                  
  4916                                  .expr220:
  4917 00001D9E FF76FC                   push word [bp-4]
  4918 00001DA1 E8D6E5                   call v
  4919 00001DA4 83C402                   add  sp, 2
  4920 00001DA7 E9F400                   jmp .e1
  4921                                  
  4922                                  ;-600 
  4923                                  
  4924                                  
  4925                                  ;-601   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4926                                  
  4927                                  .expr217:
  4928 00001DAA 68CE04                   push 1230
  4929 00001DAD E867E6                   call istoken
  4930 00001DB0 83C402                   add  sp, 2
  4931 00001DB3 08C0                     or  al, al
  4932 00001DB5 0F841200                 je .expr221
  4933 00001DB9 FF76FC                   push word [bp-4]
  4934 00001DBC FF76FE                   push word [bp-2]
  4935 00001DBF 68[2020]                 push expr_10
  4936 00001DC2 E8A902                   call compoundass
  4937 00001DC5 83C406                   add  sp, 6
  4938 00001DC8 E9D300                   jmp .e1
  4939                                  
  4940                                  ;-602   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4941                                  
  4942                                  .expr221:
  4943 00001DCB 68CF04                   push 1231
  4944 00001DCE E846E6                   call istoken
  4945 00001DD1 83C402                   add  sp, 2
  4946 00001DD4 08C0                     or  al, al
  4947 00001DD6 0F841200                 je .expr222
  4948 00001DDA FF76FC                   push word [bp-4]
  4949 00001DDD FF76FE                   push word [bp-2]
  4950 00001DE0 68[2420]                 push expr_11
  4951 00001DE3 E88802                   call compoundass
  4952 00001DE6 83C406                   add  sp, 6
  4953 00001DE9 E9B200                   jmp .e1
  4954                                  
  4955                                  ;-603   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4956                                  
  4957                                  .expr222:
  4958 00001DEC 68D204                   push 1234
  4959 00001DEF E825E6                   call istoken
  4960 00001DF2 83C402                   add  sp, 2
  4961 00001DF5 08C0                     or  al, al
  4962 00001DF7 0F841200                 je .expr223
  4963 00001DFB FF76FC                   push word [bp-4]
  4964 00001DFE FF76FE                   push word [bp-2]
  4965 00001E01 68[2820]                 push expr_12
  4966 00001E04 E86702                   call compoundass
  4967 00001E07 83C406                   add  sp, 6
  4968 00001E0A E99100                   jmp .e1
  4969                                  
  4970                                  ;-604   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  4971                                  
  4972                                  .expr223:
  4973 00001E0D 68D304                   push 1235
  4974 00001E10 E804E6                   call istoken
  4975 00001E13 83C402                   add  sp, 2
  4976 00001E16 08C0                     or  al, al
  4977 00001E18 0F841200                 je .expr224
  4978 00001E1C FF76FC                   push word [bp-4]
  4979 00001E1F FF76FE                   push word [bp-2]
  4980 00001E22 68[2C20]                 push expr_13
  4981 00001E25 E84602                   call compoundass
  4982 00001E28 83C406                   add  sp, 6
  4983 00001E2B E97000                   jmp .e1
  4984                                  
  4985                                  ;-605   if (istoken(T_MULASS    )) {error1("not implemented");}
  4986                                  
  4987                                  .expr224:
  4988 00001E2E 68D004                   push 1232
  4989 00001E31 E8E3E5                   call istoken
  4990 00001E34 83C402                   add  sp, 2
  4991 00001E37 08C0                     or  al, al
  4992 00001E39 0F840900                 je .expr225
  4993 00001E3D 68[2F20]                 push expr_14
  4994 00001E40 E8F11E                   call error1
  4995 00001E43 83C402                   add  sp, 2
  4996                                  
  4997                                  ;-606   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4998                                  
  4999                                  .expr225:
  5000 00001E46 68D104                   push 1233
  5001 00001E49 E8CBE5                   call istoken
  5002 00001E4C 83C402                   add  sp, 2
  5003 00001E4F 08C0                     or  al, al
  5004 00001E51 0F840900                 je .expr226
  5005 00001E55 68[3F20]                 push expr_15
  5006 00001E58 E8D91E                   call error1
  5007 00001E5B 83C402                   add  sp, 2
  5008                                  
  5009                                  ;-607 
  5010                                  
  5011                                  
  5012                                  ;-608   if (istoken('=')) { exprtype= expr(1);
  5013                                  
  5014                                  .expr226:
  5015 00001E5E 6A3D                     push 61
  5016 00001E60 E8B4E5                   call istoken
  5017 00001E63 83C402                   add  sp, 2
  5018 00001E66 08C0                     or  al, al
  5019 00001E68 0F842000                 je .expr227
  5020 00001E6C 6A01                     push 1
  5021 00001E6E E899FD                   call expr
  5022 00001E71 83C402                   add  sp, 2
  5023 00001E74 A3[081C]                 mov word [exprtype], ax
  5024                                  
  5025                                  ;-609   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  5026                                  
  5027 00001E77 FF76F8                   push word [bp-8]
  5028 00001E7A FF76FA                   push word [bp-6]
  5029 00001E7D FF76FC                   push word [bp-4]
  5030 00001E80 FF76FE                   push word [bp-2]
  5031 00001E83 E85F08                   call doassign
  5032 00001E86 83C408                   add  sp, 8
  5033 00001E89 E91200                   jmp .e1
  5034                                  
  5035                                  ;-610   dovar1(mode, "mov", ixarr, id1);
  5036                                  
  5037                                  .expr227:
  5038 00001E8C FF76FC                   push word [bp-4]
  5039 00001E8F FF76FA                   push word [bp-6]
  5040 00001E92 68[4F20]                 push expr_16
  5041 00001E95 FF76FE                   push word [bp-2]
  5042 00001E98 E87502                   call dovar1
  5043 00001E9B 83C408                   add  sp, 8
  5044                                  
  5045                                  ;-611 
  5046                                  
  5047                                  
  5048                                  ;-612 e1:    if (istoken('+')) rterm("add");
  5049                                  
  5050                                  .e1:
  5051 00001E9E 6A2B                     push 43
  5052 00001EA0 E874E5                   call istoken
  5053 00001EA3 83C402                   add  sp, 2
  5054 00001EA6 08C0                     or  al, al
  5055 00001EA8 0F840C00                 je .expr228
  5056 00001EAC 68[5320]                 push expr_17
  5057 00001EAF E82804                   call rterm
  5058 00001EB2 83C402                   add  sp, 2
  5059                                  
  5060                                  ;-613   else if (istoken('-')) rterm("sub" );
  5061                                  
  5062 00001EB5 E9CF00                   jmp .expr229
  5063                                  .expr228:
  5064 00001EB8 6A2D                     push 45
  5065 00001EBA E85AE5                   call istoken
  5066 00001EBD 83C402                   add  sp, 2
  5067 00001EC0 08C0                     or  al, al
  5068 00001EC2 0F840C00                 je .expr230
  5069 00001EC6 68[5720]                 push expr_18
  5070 00001EC9 E80E04                   call rterm
  5071 00001ECC 83C402                   add  sp, 2
  5072                                  
  5073                                  ;-614   else if (istoken('&')) rterm("and" );
  5074                                  
  5075 00001ECF E9B500                   jmp .expr231
  5076                                  .expr230:
  5077 00001ED2 6A26                     push 38
  5078 00001ED4 E840E5                   call istoken
  5079 00001ED7 83C402                   add  sp, 2
  5080 00001EDA 08C0                     or  al, al
  5081 00001EDC 0F840C00                 je .expr232
  5082 00001EE0 68[5B20]                 push expr_19
  5083 00001EE3 E8F403                   call rterm
  5084 00001EE6 83C402                   add  sp, 2
  5085                                  
  5086                                  ;-615   else if (istoken('|')) rterm("or" );
  5087                                  
  5088 00001EE9 E99B00                   jmp .expr233
  5089                                  .expr232:
  5090 00001EEC 6A7C                     push 124
  5091 00001EEE E826E5                   call istoken
  5092 00001EF1 83C402                   add  sp, 2
  5093 00001EF4 08C0                     or  al, al
  5094 00001EF6 0F840C00                 je .expr234
  5095 00001EFA 68[5F20]                 push expr_20
  5096 00001EFD E8DA03                   call rterm
  5097 00001F00 83C402                   add  sp, 2
  5098                                  
  5099                                  ;-616   else if (istoken(T_LESSLESS)) rterm("shl");
  5100                                  
  5101 00001F03 E98100                   jmp .expr235
  5102                                  .expr234:
  5103 00001F06 68D804                   push 1240
  5104 00001F09 E80BE5                   call istoken
  5105 00001F0C 83C402                   add  sp, 2
  5106 00001F0F 08C0                     or  al, al
  5107 00001F11 0F840C00                 je .expr236
  5108 00001F15 68[6220]                 push expr_21
  5109 00001F18 E8BF03                   call rterm
  5110 00001F1B 83C402                   add  sp, 2
  5111                                  
  5112                                  ;-617   else if (istoken(T_GREATGREAT)) rterm("shr");
  5113                                  
  5114 00001F1E E96600                   jmp .expr237
  5115                                  .expr236:
  5116 00001F21 68D904                   push 1241
  5117 00001F24 E8F0E4                   call istoken
  5118 00001F27 83C402                   add  sp, 2
  5119 00001F2A 08C0                     or  al, al
  5120 00001F2C 0F840C00                 je .expr238
  5121 00001F30 68[6620]                 push expr_22
  5122 00001F33 E8A403                   call rterm
  5123 00001F36 83C402                   add  sp, 2
  5124                                  
  5125                                  ;-618   else if (istoken('*')) domul (ids);
  5126                                  
  5127 00001F39 E94B00                   jmp .expr239
  5128                                  .expr238:
  5129 00001F3C 6A2A                     push 42
  5130 00001F3E E8D6E4                   call istoken
  5131 00001F41 83C402                   add  sp, 2
  5132 00001F44 08C0                     or  al, al
  5133 00001F46 0F840C00                 je .expr240
  5134 00001F4A FF76F6                   push word [bp-10]
  5135 00001F4D E8DE09                   call domul
  5136 00001F50 83C402                   add  sp, 2
  5137                                  
  5138                                  ;-619   else if (istoken('/')) doidiv(ids);
  5139                                  
  5140 00001F53 E93100                   jmp .expr241
  5141                                  .expr240:
  5142 00001F56 6A2F                     push 47
  5143 00001F58 E8BCE4                   call istoken
  5144 00001F5B 83C402                   add  sp, 2
  5145 00001F5E 08C0                     or  al, al
  5146 00001F60 0F840C00                 je .expr242
  5147 00001F64 FF76F6                   push word [bp-10]
  5148 00001F67 E8650A                   call doidiv
  5149 00001F6A 83C402                   add  sp, 2
  5150                                  
  5151                                  ;-620   else if (istoken('%')) domod (ids);
  5152                                  
  5153 00001F6D E91700                   jmp .expr243
  5154                                  .expr242:
  5155 00001F70 6A25                     push 37
  5156 00001F72 E8A2E4                   call istoken
  5157 00001F75 83C402                   add  sp, 2
  5158 00001F78 08C0                     or  al, al
  5159 00001F7A 0F840900                 je .expr244
  5160 00001F7E FF76F6                   push word [bp-10]
  5161 00001F81 E8EE0B                   call domod
  5162 00001F84 83C402                   add  sp, 2
  5163                                  
  5164                                  ;-621   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  5165                                  
  5166                                  .expr244:
  5167                                  .expr243:
  5168                                  .expr241:
  5169                                  .expr239:
  5170                                  .expr237:
  5171                                  .expr235:
  5172                                  .expr233:
  5173                                  .expr231:
  5174                                  .expr229:
  5175 00001F87 E8CC12                   call isrelational
  5176 00001F8A 08C0                     or  al, al
  5177 00001F8C 0F841200                 je .expr245
  5178 00001F90 68[6A20]                 push expr_23
  5179 00001F93 E84403                   call rterm
  5180 00001F96 83C402                   add  sp, 2
  5181 00001F99 FF76F6                   push word [bp-10]
  5182 00001F9C E8F90F                   call cmpneg
  5183 00001F9F 83C402                   add  sp, 2
  5184                                  
  5185                                  ;-622   return 0;
  5186                                  
  5187                                  .expr245:
  5188 00001FA2 B80000                   mov ax, 0
  5189 00001FA5 E90000                   jmp .retnexpr
  5190                                  
  5191                                  ;-623 }
  5192                                  
  5193                                  
  5194                                  ;-624 
  5195                                  
  5196                                  
  5197                                  ;-625 int compoundass(char *op, int mode, int id1) {
  5198                                  
  5199 00001FA8 C9                       .retnexpr: LEAVE
  5200 00001FA9 C3                       ret
  5201 00001FAA 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  5202 00001FB3 2C2000             
  5203 00001FB6 417272617920696E64-     expr_1 db "Array index must be number or int",0
  5204 00001FBF 6578206D7573742062-
  5205 00001FC8 65206E756D62657220-
  5206 00001FD1 6F7220696E7400     
  5207 00001FD8 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  5208 00001FE1 616C6C6F77656400   
  5209 00001FE9 5C6E20696E63202000      expr_3 db "\n inc  ",0
  5210 00001FF2 776F726400              expr_4 db "word",0
  5211 00001FF7 6279746500              expr_5 db "byte",0
  5212 00001FFC 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  5213 00002005 616C6C6F77656400   
  5214 0000200D 5C6E20646563202000      expr_7 db "\n dec  ",0
  5215 00002016 776F726400              expr_8 db "word",0
  5216 0000201B 6279746500              expr_9 db "byte",0
  5217 00002020 61646400                expr_10 db "add",0
  5218 00002024 73756200                expr_11 db "sub",0
  5219 00002028 616E6400                expr_12 db "and",0
  5220 0000202C 6F7200                  expr_13 db "or",0
  5221 0000202F 6E6F7420696D706C65-     expr_14 db "not implemented",0
  5222 00002038 6D656E74656400     
  5223 0000203F 6E6F7420696D706C65-     expr_15 db "not implemented",0
  5224 00002048 6D656E74656400     
  5225 0000204F 6D6F7600                expr_16 db "mov",0
  5226 00002053 61646400                expr_17 db "add",0
  5227 00002057 73756200                expr_18 db "sub",0
  5228 0000205B 616E6400                expr_19 db "and",0
  5229 0000205F 6F7200                  expr_20 db "or",0
  5230 00002062 73686C00                expr_21 db "shl",0
  5231 00002066 73687200                expr_22 db "shr",0
  5232 0000206A 636D7000                expr_23 db "cmp",0
  5233                                  ENDP
  5234                                  
  5235                                  compoundass: PROC
  5236                                  
  5237                                  ;-626   if(mode) error1("only scalar Var allowed");
  5238                                  
  5239                                  ;Function : compoundass, Number of local variables: 3
  5240                                  ;   # type sign width addr used name   list of local variables
  5241                                  ;  200 ptr sign byte   625 NULL op = bp+4
  5242                                  ;  201 var sign word   625 NULL mode = bp+6
  5243                                  ;  202 var sign word   625 NULL id1 = bp+8;
  5244 0000206E C8000000                 ENTER  0,0
  5245 00002072 8B4606                   mov ax, [bp+6]
  5246 00002075 08C0                     or  al, al
  5247 00002077 0F840900                 je .compoundass246
  5248 0000207B 68[E820]                 push compoundass_0
  5249 0000207E E8B31C                   call error1
  5250 00002081 83C402                   add  sp, 2
  5251                                  
  5252                                  ;-627   prnl(); prs(op); prs("  ");
  5253                                  
  5254                                  .compoundass246:
  5255 00002084 E8B7E4                   call prnl
  5256 00002087 FF7604                   push word [bp+4]
  5257 0000208A E8BFE4                   call prs
  5258 0000208D 83C402                   add  sp, 2
  5259 00002090 68[0021]                 push compoundass_1
  5260 00002093 E8B6E4                   call prs
  5261 00002096 83C402                   add  sp, 2
  5262                                  
  5263                                  ;-628   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5264                                  
  5265 00002099 FF7608                   push word [bp+8]
  5266 0000209C E8CCEA                   call gettypes
  5267 0000209F 83C402                   add  sp, 2
  5268 000020A2 A1[3700]                 mov ax, [wi]
  5269 000020A5 83F802                   cmp ax, 2
  5270 000020A8 0F850C00                 jne .compoundass247
  5271 000020AC 68[0321]                 push compoundass_2
  5272 000020AF E89AE4                   call prs
  5273 000020B2 83C402                   add  sp, 2
  5274 000020B5 E90900                   jmp .compoundass248
  5275                                  .compoundass247:
  5276 000020B8 68[0821]                 push compoundass_3
  5277 000020BB E88EE4                   call prs
  5278 000020BE 83C402                   add  sp, 2
  5279                                  
  5280                                  ;-629   v(id1); prs(", ");
  5281                                  
  5282                                  .compoundass248:
  5283 000020C1 FF7608                   push word [bp+8]
  5284 000020C4 E8B3E2                   call v
  5285 000020C7 83C402                   add  sp, 2
  5286 000020CA 68[0D21]                 push compoundass_4
  5287 000020CD E87CE4                   call prs
  5288 000020D0 83C402                   add  sp, 2
  5289                                  
  5290                                  ;-630   expect(T_CONST); prunsign1(lexval);
  5291                                  
  5292 000020D3 680101                   push 257
  5293 000020D6 E860E3                   call expect
  5294 000020D9 83C402                   add  sp, 2
  5295 000020DC FF36[2C00]               push word [lexval]
  5296 000020E0 E8BEE5                   call prunsign1
  5297 000020E3 83C402                   add  sp, 2
  5298                                  
  5299                                  ;-631 }
  5300                                  
  5301                                  
  5302                                  ;-632 int dovar1(int mode, int op, int ixarr, int id1) {
  5303 000020E6 C9                       LEAVE
  5304 000020E7 C3                       ret
  5305 000020E8 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5306 000020F1 61722056617220616C-
  5307 000020FA 6C6F77656400       
  5308 00002100 202000                  compoundass_1 db "  ",0
  5309 00002103 776F726400              compoundass_2 db "word",0
  5310 00002108 6279746500              compoundass_3 db "byte",0
  5311 0000210D 2C2000                  compoundass_4 db ", ",0
  5312                                  ENDP
  5313                                  
  5314                                  dovar1: PROC
  5315                                  
  5316                                  ;-633   gettypes(id1);
  5317                                  
  5318                                  ;Function : dovar1, Number of local variables: 4
  5319                                  ;   # type sign width addr used name   list of local variables
  5320                                  ;  200 var sign word   632 NULL mode = bp+4
  5321                                  ;  201 var sign word   632 NULL op = bp+6
  5322                                  ;  202 var sign word   632 NULL ixarr = bp+8
  5323                                  ;  203 var sign word   632 NULL id1 = bp+10;
  5324 00002110 C8000000                 ENTER  0,0
  5325 00002114 FF760A                   push word [bp+10]
  5326 00002117 E851EA                   call gettypes
  5327 0000211A 83C402                   add  sp, 2
  5328                                  
  5329                                  ;-634   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5330                                  
  5331 0000211D 8B4604                   mov ax, [bp+4]
  5332 00002120 83F801                   cmp ax, 1
  5333 00002123 0F854700                 jne .dovar1249
  5334 00002127 68[6522]                 push dovar1_0
  5335 0000212A E81FE4                   call prs
  5336 0000212D 83C402                   add  sp, 2
  5337 00002130 FF760A                   push word [bp+10]
  5338 00002133 E844E2                   call v
  5339 00002136 83C402                   add  sp, 2
  5340 00002139 E802E4                   call prnl
  5341 0000213C FF7606                   push word [bp+6]
  5342 0000213F E80AE4                   call prs
  5343 00002142 83C402                   add  sp, 2
  5344                                  
  5345                                  ;-635     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5346                                  
  5347 00002145 A1[3400]                 mov ax, [widthi]
  5348 00002148 83F801                   cmp ax, 1
  5349 0000214B 0F850900                 jne .dovar1250
  5350 0000214F 68[7122]                 push dovar1_1
  5351 00002152 E8F7E3                   call prs
  5352 00002155 83C402                   add  sp, 2
  5353                                  
  5354                                  ;-636     if(widthi == 2) prs(" ax, [bx]");
  5355                                  
  5356                                  .dovar1250:
  5357 00002158 A1[3400]                 mov ax, [widthi]
  5358 0000215B 83F802                   cmp ax, 2
  5359 0000215E 0F850900                 jne .dovar1251
  5360 00002162 68[8722]                 push dovar1_2
  5361 00002165 E8E4E3                   call prs
  5362 00002168 83C402                   add  sp, 2
  5363                                  
  5364                                  ;-637     return; }
  5365                                  
  5366                                  .dovar1251:
  5367 0000216B E9F500                   jmp .retndovar1
  5368                                  
  5369                                  ;-638   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5370                                  
  5371                                  .dovar1249:
  5372 0000216E 8B4604                   mov ax, [bp+4]
  5373 00002171 83F802                   cmp ax, 2
  5374 00002174 0F852100                 jne .dovar1252
  5375 00002178 E8C3E3                   call prnl
  5376 0000217B FF7606                   push word [bp+6]
  5377 0000217E E8CBE3                   call prs
  5378 00002181 83C402                   add  sp, 2
  5379 00002184 68[9122]                 push dovar1_3
  5380 00002187 E8C2E3                   call prs
  5381 0000218A 83C402                   add  sp, 2
  5382 0000218D FF760A                   push word [bp+10]
  5383 00002190 E8D8E1                   call a
  5384 00002193 83C402                   add  sp, 2
  5385 00002196 E9CA00                   jmp .retndovar1
  5386                                  
  5387                                  ;-639   if (ixarr) {
  5388                                  
  5389                                  .dovar1252:
  5390 00002199 8B4608                   mov ax, [bp+8]
  5391 0000219C 08C0                     or  al, al
  5392 0000219E 0F847300                 je .dovar1253
  5393                                  
  5394                                  ;-640     prs("\n mov bx, "); v(ixarr);
  5395                                  
  5396 000021A2 68[9722]                 push dovar1_4
  5397 000021A5 E8A4E3                   call prs
  5398 000021A8 83C402                   add  sp, 2
  5399 000021AB FF7608                   push word [bp+8]
  5400 000021AE E8C9E1                   call v
  5401 000021B1 83C402                   add  sp, 2
  5402                                  
  5403                                  ;-641     if (wi==2) prs("\n shl bx, 1");
  5404                                  
  5405 000021B4 A1[3700]                 mov ax, [wi]
  5406 000021B7 83F802                   cmp ax, 2
  5407 000021BA 0F850900                 jne .dovar1254
  5408 000021BE 68[A322]                 push dovar1_5
  5409 000021C1 E888E3                   call prs
  5410 000021C4 83C402                   add  sp, 2
  5411                                  
  5412                                  ;-642     prs("\n "); prs(op);
  5413                                  
  5414                                  .dovar1254:
  5415 000021C7 68[B022]                 push dovar1_6
  5416 000021CA E87FE3                   call prs
  5417 000021CD 83C402                   add  sp, 2
  5418 000021D0 FF7606                   push word [bp+6]
  5419 000021D3 E876E3                   call prs
  5420 000021D6 83C402                   add  sp, 2
  5421                                  
  5422                                  ;-643     if (wi==2) prs(" ax, "); else prs(" al, ");
  5423                                  
  5424 000021D9 A1[3700]                 mov ax, [wi]
  5425 000021DC 83F802                   cmp ax, 2
  5426 000021DF 0F850C00                 jne .dovar1255
  5427 000021E3 68[B422]                 push dovar1_7
  5428 000021E6 E863E3                   call prs
  5429 000021E9 83C402                   add  sp, 2
  5430 000021EC E90900                   jmp .dovar1256
  5431                                  .dovar1255:
  5432 000021EF 68[BA22]                 push dovar1_8
  5433 000021F2 E857E3                   call prs
  5434 000021F5 83C402                   add  sp, 2
  5435                                  
  5436                                  ;-644 // v(id1); prs(" [bx]");
  5437                                  
  5438                                  
  5439                                  ;-645     prc('['); printName(id1); prs(" + bx]");
  5440                                  
  5441                                  .dovar1256:
  5442 000021F8 6A5B                     push 91
  5443 000021FA E8E8E2                   call prc
  5444 000021FD 83C402                   add  sp, 2
  5445 00002200 FF760A                   push word [bp+10]
  5446 00002203 E83FEA                   call printName
  5447 00002206 83C402                   add  sp, 2
  5448 00002209 68[C022]                 push dovar1_9
  5449 0000220C E83DE3                   call prs
  5450 0000220F 83C402                   add  sp, 2
  5451                                  
  5452                                  ;-646     return; }
  5453                                  
  5454 00002212 E94E00                   jmp .retndovar1
  5455                                  
  5456                                  ;-647   prnl();prs(op);
  5457                                  
  5458                                  .dovar1253:
  5459 00002215 E826E3                   call prnl
  5460 00002218 FF7606                   push word [bp+6]
  5461 0000221B E82EE3                   call prs
  5462 0000221E 83C402                   add  sp, 2
  5463                                  
  5464                                  ;-648   if(wi==1) prs(" al, ");
  5465                                  
  5466 00002221 A1[3700]                 mov ax, [wi]
  5467 00002224 83F801                   cmp ax, 1
  5468 00002227 0F850900                 jne .dovar1257
  5469 0000222B 68[C722]                 push dovar1_10
  5470 0000222E E81BE3                   call prs
  5471 00002231 83C402                   add  sp, 2
  5472                                  
  5473                                  ;-649   if(wi==2) prs(" ax, ");
  5474                                  
  5475                                  .dovar1257:
  5476 00002234 A1[3700]                 mov ax, [wi]
  5477 00002237 83F802                   cmp ax, 2
  5478 0000223A 0F850900                 jne .dovar1258
  5479 0000223E 68[CD22]                 push dovar1_11
  5480 00002241 E808E3                   call prs
  5481 00002244 83C402                   add  sp, 2
  5482                                  
  5483                                  ;-650   if(wi==4) prs(" eax, ");
  5484                                  
  5485                                  .dovar1258:
  5486 00002247 A1[3700]                 mov ax, [wi]
  5487 0000224A 83F804                   cmp ax, 4
  5488 0000224D 0F850900                 jne .dovar1259
  5489 00002251 68[D322]                 push dovar1_12
  5490 00002254 E8F5E2                   call prs
  5491 00002257 83C402                   add  sp, 2
  5492                                  
  5493                                  ;-651   v(id1);
  5494                                  
  5495                                  .dovar1259:
  5496 0000225A FF760A                   push word [bp+10]
  5497 0000225D E81AE1                   call v
  5498 00002260 83C402                   add  sp, 2
  5499                                  
  5500                                  ;-652 }
  5501                                  
  5502                                  
  5503                                  ;-653 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5504                                  
  5505 00002263 C9                       .retndovar1: LEAVE
  5506 00002264 C3                       ret
  5507 00002265 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5508 0000226E 2C2000             
  5509 00002271 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5510 0000227A 5C6E206D6F76206168-
  5511 00002283 2C203000           
  5512 00002287 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5513 00002290 00                 
  5514 00002291 2061782C2000            dovar1_3 db " ax, ",0
  5515 00002297 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5516 000022A0 2C2000             
  5517 000022A3 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5518 000022AC 2C203100           
  5519 000022B0 5C6E2000                dovar1_6 db "\n ",0
  5520 000022B4 2061782C2000            dovar1_7 db " ax, ",0
  5521 000022BA 20616C2C2000            dovar1_8 db " al, ",0
  5522 000022C0 202B2062785D00          dovar1_9 db " + bx]",0
  5523 000022C7 20616C2C2000            dovar1_10 db " al, ",0
  5524 000022CD 2061782C2000            dovar1_11 db " ax, ",0
  5525 000022D3 206561782C2000          dovar1_12 db " eax, ",0
  5526                                  ENDP
  5527                                  
  5528                                  rterm: PROC
  5529                                  
  5530                                  ;-654   if (istoken(T_CONST)) { prnl(); prs(op);
  5531                                  
  5532                                  ;Function : rterm, Number of local variables: 5
  5533                                  ;   # type sign width addr used name   list of local variables
  5534                                  ;  200 ptr sign byte   653 NULL op = bp+4
  5535                                  ;  201 var sign word   653 NULL mode = bp-2
  5536                                  ;  202 var sign word   653 NULL opint = bp-4
  5537                                  ;  203 var sign word   653 NULL ixarr = bp-6
  5538                                  ;  204 var sign word   653 NULL id1 = bp-8;
  5539 000022DA C8080000                 ENTER  8,0
  5540 000022DE 680101                   push 257
  5541 000022E1 E833E1                   call istoken
  5542 000022E4 83C402                   add  sp, 2
  5543 000022E7 08C0                     or  al, al
  5544 000022E9 0F845200                 je .rterm260
  5545 000022ED E84EE2                   call prnl
  5546 000022F0 FF7604                   push word [bp+4]
  5547 000022F3 E856E2                   call prs
  5548 000022F6 83C402                   add  sp, 2
  5549                                  
  5550                                  ;-655     if (wi==1) prs(" al, ");
  5551                                  
  5552 000022F9 A1[3700]                 mov ax, [wi]
  5553 000022FC 83F801                   cmp ax, 1
  5554 000022FF 0F850900                 jne .rterm261
  5555 00002303 68[C323]                 push rterm_0
  5556 00002306 E843E2                   call prs
  5557 00002309 83C402                   add  sp, 2
  5558                                  
  5559                                  ;-656     if (wi==2) prs(" ax, ");
  5560                                  
  5561                                  .rterm261:
  5562 0000230C A1[3700]                 mov ax, [wi]
  5563 0000230F 83F802                   cmp ax, 2
  5564 00002312 0F850900                 jne .rterm262
  5565 00002316 68[C923]                 push rterm_1
  5566 00002319 E830E2                   call prs
  5567 0000231C 83C402                   add  sp, 2
  5568                                  
  5569                                  ;-657     if (wi==4) prs(" eax, ");
  5570                                  
  5571                                  .rterm262:
  5572 0000231F A1[3700]                 mov ax, [wi]
  5573 00002322 83F804                   cmp ax, 4
  5574 00002325 0F850900                 jne .rterm263
  5575 00002329 68[CF23]                 push rterm_2
  5576 0000232C E81DE2                   call prs
  5577 0000232F 83C402                   add  sp, 2
  5578                                  
  5579                                  ;-658     prunsign1(lexval); return;}
  5580                                  
  5581                                  .rterm263:
  5582 00002332 FF36[2C00]               push word [lexval]
  5583 00002336 E868E3                   call prunsign1
  5584 00002339 83C402                   add  sp, 2
  5585 0000233C E98200                   jmp .retnrterm
  5586                                  
  5587                                  ;-659   mode=typeName(); id1=searchname(); ixarr=0;
  5588                                  
  5589                                  .rterm260:
  5590 0000233F E836EA                   call typeName
  5591 00002342 8946FE                   mov [bp-2], ax
  5592 00002345 E861E9                   call searchname
  5593 00002348 8946F8                   mov [bp-8], ax
  5594 0000234B B80000                   mov ax, 0
  5595 0000234E 8946FA                   mov [bp-6], ax
  5596                                  
  5597                                  ;-660   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5598                                  
  5599 00002351 6A5B                     push 91
  5600 00002353 E8C1E0                   call istoken
  5601 00002356 83C402                   add  sp, 2
  5602 00002359 08C0                     or  al, al
  5603 0000235B 0F843300                 je .rterm264
  5604 0000235F E847E9                   call searchname
  5605 00002362 8946FA                   mov [bp-6], ax
  5606 00002365 680001                   push 256
  5607 00002368 E8CEE0                   call expect
  5608 0000236B 83C402                   add  sp, 2
  5609 0000236E 6A5D                     push 93
  5610 00002370 E8C6E0                   call expect
  5611 00002373 83C402                   add  sp, 2
  5612                                  
  5613                                  ;-661     gettypes(ixarr);
  5614                                  
  5615 00002376 FF76FA                   push word [bp-6]
  5616 00002379 E8EFE7                   call gettypes
  5617 0000237C 83C402                   add  sp, 2
  5618                                  
  5619                                  ;-662     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5620                                  
  5621 0000237F A1[3400]                 mov ax, [widthi]
  5622 00002382 83F802                   cmp ax, 2
  5623 00002385 0F840900                 je  .rterm265
  5624 00002389 68[D623]                 push rterm_3
  5625 0000238C E8A519                   call error1
  5626 0000238F 83C402                   add  sp, 2
  5627                                  .rterm265:
  5628                                  
  5629                                  ;-663   if (eqstr(symbol,"_AX")) return;
  5630                                  
  5631                                  .rterm264:
  5632 00002392 68[EF23]                 push rterm_4
  5633 00002395 8D06BB69                 lea  ax, [symbol]
  5634 00002399 50                       push ax
  5635 0000239A E8E8DE                   call eqstr
  5636 0000239D 83C404                   add  sp, 4
  5637 000023A0 08C0                     or  al, al
  5638 000023A2 0F840300                 je .rterm266
  5639 000023A6 E91800                   jmp .retnrterm
  5640                                  
  5641                                  ;-664   opint=op; dovar1(mode, opint, ixarr, id1);
  5642                                  
  5643                                  .rterm266:
  5644 000023A9 8B4604                   mov ax, [bp+4]
  5645 000023AC 8946FC                   mov [bp-4], ax
  5646 000023AF FF76F8                   push word [bp-8]
  5647 000023B2 FF76FA                   push word [bp-6]
  5648 000023B5 FF76FC                   push word [bp-4]
  5649 000023B8 FF76FE                   push word [bp-2]
  5650 000023BB E852FD                   call dovar1
  5651 000023BE 83C408                   add  sp, 8
  5652                                  
  5653                                  ;-665 }
  5654                                  
  5655                                  
  5656                                  ;-666 int isreg() {
  5657                                  
  5658 000023C1 C9                       .retnrterm: LEAVE
  5659 000023C2 C3                       ret
  5660 000023C3 20616C2C2000            rterm_0 db " al, ",0
  5661 000023C9 2061782C2000            rterm_1 db " ax, ",0
  5662 000023CF 206561782C2000          rterm_2 db " eax, ",0
  5663 000023D6 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5664 000023DF 78206D75737320696E-
  5665 000023E8 74207365696E00     
  5666 000023EF 5F415800                rterm_4 db "_AX",0
  5667                                  ENDP
  5668                                  
  5669                                  isreg: PROC
  5670                                  
  5671                                  ;-667   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5672                                  
  5673 000023F3 68[E025]                 push isreg_0
  5674 000023F6 8D06BB69                 lea  ax, [symbol]
  5675 000023FA 50                       push ax
  5676 000023FB E887DE                   call eqstr
  5677 000023FE 83C404                   add  sp, 4
  5678 00002401 08C0                     or  al, al
  5679 00002403 0F840C00                 je .isreg267
  5680 00002407 68[E425]                 push isreg_1
  5681 0000240A E84202                   call doreg
  5682 0000240D 83C402                   add  sp, 2
  5683 00002410 E9C601                   jmp .r1
  5684                                  
  5685                                  ;-668   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5686                                  
  5687                                  .isreg267:
  5688 00002413 68[E725]                 push isreg_2
  5689 00002416 8D06BB69                 lea  ax, [symbol]
  5690 0000241A 50                       push ax
  5691 0000241B E867DE                   call eqstr
  5692 0000241E 83C404                   add  sp, 4
  5693 00002421 08C0                     or  al, al
  5694 00002423 0F840C00                 je .isreg268
  5695 00002427 68[EB25]                 push isreg_3
  5696 0000242A E82202                   call doreg
  5697 0000242D 83C402                   add  sp, 2
  5698 00002430 E9A601                   jmp .r1
  5699                                  
  5700                                  ;-669   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5701                                  
  5702                                  .isreg268:
  5703 00002433 68[EE25]                 push isreg_4
  5704 00002436 8D06BB69                 lea  ax, [symbol]
  5705 0000243A 50                       push ax
  5706 0000243B E847DE                   call eqstr
  5707 0000243E 83C404                   add  sp, 4
  5708 00002441 08C0                     or  al, al
  5709 00002443 0F840C00                 je .isreg269
  5710 00002447 68[F225]                 push isreg_5
  5711 0000244A E80202                   call doreg
  5712 0000244D 83C402                   add  sp, 2
  5713 00002450 E98601                   jmp .r1
  5714                                  
  5715                                  ;-670   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5716                                  
  5717                                  .isreg269:
  5718 00002453 68[F525]                 push isreg_6
  5719 00002456 8D06BB69                 lea  ax, [symbol]
  5720 0000245A 50                       push ax
  5721 0000245B E827DE                   call eqstr
  5722 0000245E 83C404                   add  sp, 4
  5723 00002461 08C0                     or  al, al
  5724 00002463 0F840C00                 je .isreg270
  5725 00002467 68[F925]                 push isreg_7
  5726 0000246A E8E201                   call doreg
  5727 0000246D 83C402                   add  sp, 2
  5728 00002470 E96601                   jmp .r1
  5729                                  
  5730                                  ;-671   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5731                                  
  5732                                  .isreg270:
  5733 00002473 68[FC25]                 push isreg_8
  5734 00002476 8D06BB69                 lea  ax, [symbol]
  5735 0000247A 50                       push ax
  5736 0000247B E807DE                   call eqstr
  5737 0000247E 83C404                   add  sp, 4
  5738 00002481 08C0                     or  al, al
  5739 00002483 0F840C00                 je .isreg271
  5740 00002487 68[0026]                 push isreg_9
  5741 0000248A E8C201                   call doreg
  5742 0000248D 83C402                   add  sp, 2
  5743 00002490 E94601                   jmp .r1
  5744                                  
  5745                                  ;-672   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5746                                  
  5747                                  .isreg271:
  5748 00002493 68[0326]                 push isreg_10
  5749 00002496 8D06BB69                 lea  ax, [symbol]
  5750 0000249A 50                       push ax
  5751 0000249B E8E7DD                   call eqstr
  5752 0000249E 83C404                   add  sp, 4
  5753 000024A1 08C0                     or  al, al
  5754 000024A3 0F840C00                 je .isreg272
  5755 000024A7 68[0726]                 push isreg_11
  5756 000024AA E8A201                   call doreg
  5757 000024AD 83C402                   add  sp, 2
  5758 000024B0 E92601                   jmp .r1
  5759                                  
  5760                                  ;-673   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5761                                  
  5762                                  .isreg272:
  5763 000024B3 68[0A26]                 push isreg_12
  5764 000024B6 8D06BB69                 lea  ax, [symbol]
  5765 000024BA 50                       push ax
  5766 000024BB E8C7DD                   call eqstr
  5767 000024BE 83C404                   add  sp, 4
  5768 000024C1 08C0                     or  al, al
  5769 000024C3 0F840C00                 je .isreg273
  5770 000024C7 68[0E26]                 push isreg_13
  5771 000024CA E88201                   call doreg
  5772 000024CD 83C402                   add  sp, 2
  5773 000024D0 E90601                   jmp .r1
  5774                                  
  5775                                  ;-674   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5776                                  
  5777                                  .isreg273:
  5778 000024D3 68[1126]                 push isreg_14
  5779 000024D6 8D06BB69                 lea  ax, [symbol]
  5780 000024DA 50                       push ax
  5781 000024DB E8A7DD                   call eqstr
  5782 000024DE 83C404                   add  sp, 4
  5783 000024E1 08C0                     or  al, al
  5784 000024E3 0F840C00                 je .isreg274
  5785 000024E7 68[1526]                 push isreg_15
  5786 000024EA E86201                   call doreg
  5787 000024ED 83C402                   add  sp, 2
  5788 000024F0 E9E600                   jmp .r1
  5789                                  
  5790                                  ;-675   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5791                                  
  5792                                  .isreg274:
  5793 000024F3 68[1826]                 push isreg_16
  5794 000024F6 8D06BB69                 lea  ax, [symbol]
  5795 000024FA 50                       push ax
  5796 000024FB E887DD                   call eqstr
  5797 000024FE 83C404                   add  sp, 4
  5798 00002501 08C0                     or  al, al
  5799 00002503 0F840C00                 je .isreg275
  5800 00002507 68[1C26]                 push isreg_17
  5801 0000250A E84201                   call doreg
  5802 0000250D 83C402                   add  sp, 2
  5803 00002510 E9C600                   jmp .r1
  5804                                  
  5805                                  ;-676   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5806                                  
  5807                                  .isreg275:
  5808 00002513 68[1F26]                 push isreg_18
  5809 00002516 8D06BB69                 lea  ax, [symbol]
  5810 0000251A 50                       push ax
  5811 0000251B E867DD                   call eqstr
  5812 0000251E 83C404                   add  sp, 4
  5813 00002521 08C0                     or  al, al
  5814 00002523 0F840C00                 je .isreg276
  5815 00002527 68[2326]                 push isreg_19
  5816 0000252A E82201                   call doreg
  5817 0000252D 83C402                   add  sp, 2
  5818 00002530 E9A600                   jmp .r1
  5819                                  
  5820                                  ;-677   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5821                                  
  5822                                  .isreg276:
  5823 00002533 68[2626]                 push isreg_20
  5824 00002536 8D06BB69                 lea  ax, [symbol]
  5825 0000253A 50                       push ax
  5826 0000253B E847DD                   call eqstr
  5827 0000253E 83C404                   add  sp, 4
  5828 00002541 08C0                     or  al, al
  5829 00002543 0F840C00                 je .isreg277
  5830 00002547 68[2A26]                 push isreg_21
  5831 0000254A E80201                   call doreg
  5832 0000254D 83C402                   add  sp, 2
  5833 00002550 E98600                   jmp .r1
  5834                                  
  5835                                  ;-678   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5836                                  
  5837                                  .isreg277:
  5838 00002553 68[2D26]                 push isreg_22
  5839 00002556 8D06BB69                 lea  ax, [symbol]
  5840 0000255A 50                       push ax
  5841 0000255B E827DD                   call eqstr
  5842 0000255E 83C404                   add  sp, 4
  5843 00002561 08C0                     or  al, al
  5844 00002563 0F840C00                 je .isreg278
  5845 00002567 68[3126]                 push isreg_23
  5846 0000256A E8E200                   call doreg
  5847 0000256D 83C402                   add  sp, 2
  5848 00002570 E96600                   jmp .r1
  5849                                  
  5850                                  ;-679   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5851                                  
  5852                                  .isreg278:
  5853 00002573 68[3426]                 push isreg_24
  5854 00002576 8D06BB69                 lea  ax, [symbol]
  5855 0000257A 50                       push ax
  5856 0000257B E807DD                   call eqstr
  5857 0000257E 83C404                   add  sp, 4
  5858 00002581 08C0                     or  al, al
  5859 00002583 0F840C00                 je .isreg279
  5860 00002587 68[3826]                 push isreg_25
  5861 0000258A E8C200                   call doreg
  5862 0000258D 83C402                   add  sp, 2
  5863 00002590 E94600                   jmp .r1
  5864                                  
  5865                                  ;-680   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5866                                  
  5867                                  .isreg279:
  5868 00002593 68[3B26]                 push isreg_26
  5869 00002596 8D06BB69                 lea  ax, [symbol]
  5870 0000259A 50                       push ax
  5871 0000259B E8E7DC                   call eqstr
  5872 0000259E 83C404                   add  sp, 4
  5873 000025A1 08C0                     or  al, al
  5874 000025A3 0F840C00                 je .isreg280
  5875 000025A7 68[3F26]                 push isreg_27
  5876 000025AA E8A200                   call doreg
  5877 000025AD 83C402                   add  sp, 2
  5878 000025B0 E92600                   jmp .r1
  5879                                  
  5880                                  ;-681   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5881                                  
  5882                                  .isreg280:
  5883 000025B3 68[4226]                 push isreg_28
  5884 000025B6 8D06BB69                 lea  ax, [symbol]
  5885 000025BA 50                       push ax
  5886 000025BB E8C7DC                   call eqstr
  5887 000025BE 83C404                   add  sp, 4
  5888 000025C1 08C0                     or  al, al
  5889 000025C3 0F840C00                 je .isreg281
  5890 000025C7 68[4926]                 push isreg_29
  5891 000025CA E88200                   call doreg
  5892 000025CD 83C402                   add  sp, 2
  5893 000025D0 E90600                   jmp .r1
  5894                                  
  5895                                  ;-682   return 0;   r1: return 1;
  5896                                  
  5897                                  .isreg281:
  5898 000025D3 B80000                   mov ax, 0
  5899 000025D6 E90600                   jmp .retnisreg
  5900                                  .r1:
  5901 000025D9 B80100                   mov ax, 1
  5902 000025DC E90000                   jmp .retnisreg
  5903                                  
  5904                                  ;-683 }
  5905                                  
  5906                                  
  5907                                  ;-684 int doreg(char *dr) { int i; expect('=');
  5908                                  
  5909                                   .retnisreg:
  5910 000025DF C3                       ret
  5911 000025E0 5F414800                isreg_0 db "_AH",0
  5912 000025E4 616800                  isreg_1 db "ah",0
  5913 000025E7 5F414C00                isreg_2 db "_AL",0
  5914 000025EB 616C00                  isreg_3 db "al",0
  5915 000025EE 5F415800                isreg_4 db "_AX",0
  5916 000025F2 617800                  isreg_5 db "ax",0
  5917 000025F5 5F424800                isreg_6 db "_BH",0
  5918 000025F9 626800                  isreg_7 db "bh",0
  5919 000025FC 5F424C00                isreg_8 db "_BL",0
  5920 00002600 626C00                  isreg_9 db "bl",0
  5921 00002603 5F425800                isreg_10 db "_BX",0
  5922 00002607 627800                  isreg_11 db "bx",0
  5923 0000260A 5F434800                isreg_12 db "_CH",0
  5924 0000260E 636800                  isreg_13 db "ch",0
  5925 00002611 5F434C00                isreg_14 db "_CL",0
  5926 00002615 636C00                  isreg_15 db "cl",0
  5927 00002618 5F435800                isreg_16 db "_CX",0
  5928 0000261C 637800                  isreg_17 db "cx",0
  5929 0000261F 5F444800                isreg_18 db "_DH",0
  5930 00002623 646800                  isreg_19 db "dh",0
  5931 00002626 5F444C00                isreg_20 db "_DL",0
  5932 0000262A 646C00                  isreg_21 db "dl",0
  5933 0000262D 5F445800                isreg_22 db "_DX",0
  5934 00002631 647800                  isreg_23 db "dx",0
  5935 00002634 5F534900                isreg_24 db "_SI",0
  5936 00002638 736900                  isreg_25 db "si",0
  5937 0000263B 5F444900                isreg_26 db "_DI",0
  5938 0000263F 646900                  isreg_27 db "di",0
  5939 00002642 5F464C41475300          isreg_28 db "_FLAGS",0
  5940 00002649 666C61677300            isreg_29 db "flags",0
  5941                                  ENDP
  5942                                  
  5943                                  doreg: PROC
  5944                                  ;Function : doreg, Number of local variables: 2
  5945                                  ;   # type sign width addr used name   list of local variables
  5946                                  ;  200 ptr sign byte   684 NULL dr = bp+4
  5947                                  ;  201 var sign word   684 NULL i = bp-2;
  5948 0000264F C8020000                 ENTER  2,0
  5949 00002653 6A3D                     push 61
  5950 00002655 E8E1DD                   call expect
  5951 00002658 83C402                   add  sp, 2
  5952                                  
  5953                                  ;-685   prs("\n mov  "); prs(dr); prs(", ");
  5954                                  
  5955 0000265B 68[BE26]                 push doreg_0
  5956 0000265E E8EBDE                   call prs
  5957 00002661 83C402                   add  sp, 2
  5958 00002664 FF7604                   push word [bp+4]
  5959 00002667 E8E2DE                   call prs
  5960 0000266A 83C402                   add  sp, 2
  5961 0000266D 68[C726]                 push doreg_1
  5962 00002670 E8D9DE                   call prs
  5963 00002673 83C402                   add  sp, 2
  5964                                  
  5965                                  ;-686        if (istoken(T_CONST)) prunsign1(lexval);
  5966                                  
  5967 00002676 680101                   push 257
  5968 00002679 E89BDD                   call istoken
  5969 0000267C 83C402                   add  sp, 2
  5970 0000267F 08C0                     or  al, al
  5971 00002681 0F840D00                 je .doreg282
  5972 00002685 FF36[2C00]               push word [lexval]
  5973 00002689 E815E0                   call prunsign1
  5974 0000268C 83C402                   add  sp, 2
  5975                                  
  5976                                  ;-687   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5977                                  
  5978 0000268F E92A00                   jmp .doreg283
  5979                                  .doreg282:
  5980 00002692 680001                   push 256
  5981 00002695 E87FDD                   call istoken
  5982 00002698 83C402                   add  sp, 2
  5983 0000269B 08C0                     or  al, al
  5984 0000269D 0F841200                 je .doreg284
  5985 000026A1 E805E6                   call searchname
  5986 000026A4 8946FE                   mov [bp-2], ax
  5987 000026A7 FF76FE                   push word [bp-2]
  5988 000026AA E8CDDC                   call v
  5989 000026AD 83C402                   add  sp, 2
  5990                                  
  5991                                  ;-688   else error1("only number or var allowed"); }
  5992                                  
  5993 000026B0 E90900                   jmp .doreg285
  5994                                  .doreg284:
  5995 000026B3 68[CA26]                 push doreg_2
  5996 000026B6 E87B16                   call error1
  5997 000026B9 83C402                   add  sp, 2
  5998                                  .doreg285:
  5999                                  .doreg283:
  6000                                  
  6001                                  ;-689 
  6002                                  
  6003                                  
  6004                                  ;-690 int doassign(int mode, int i, int ixarr, int ixconst) {
  6005 000026BC C9                       LEAVE
  6006 000026BD C3                       ret
  6007 000026BE 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  6008 000026C7 2C2000                  doreg_1 db ", ",0
  6009 000026CA 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  6010 000026D3 6572206F7220766172-
  6011 000026DC 20616C6C6F77656400 
  6012                                  ENDP
  6013                                  
  6014                                  doassign: PROC
  6015                                  
  6016                                  ;-691   gettypes(i);
  6017                                  
  6018                                  ;Function : doassign, Number of local variables: 4
  6019                                  ;   # type sign width addr used name   list of local variables
  6020                                  ;  200 var sign word   690 NULL mode = bp+4
  6021                                  ;  201 var sign word   690 NULL i = bp+6
  6022                                  ;  202 var sign word   690 NULL ixarr = bp+8
  6023                                  ;  203 var sign word   690 NULL ixconst = bp+10;
  6024 000026E5 C8000000                 ENTER  0,0
  6025 000026E9 FF7606                   push word [bp+6]
  6026 000026EC E87CE4                   call gettypes
  6027 000026EF 83C402                   add  sp, 2
  6028                                  
  6029                                  ;-692   if (mode==1) {prs("\n mov  bx, ");v(i);
  6030                                  
  6031 000026F2 8B4604                   mov ax, [bp+4]
  6032 000026F5 83F801                   cmp ax, 1
  6033 000026F8 0F853400                 jne .doassign286
  6034 000026FC 68[8228]                 push doassign_0
  6035 000026FF E84ADE                   call prs
  6036 00002702 83C402                   add  sp, 2
  6037 00002705 FF7606                   push word [bp+6]
  6038 00002708 E86FDC                   call v
  6039 0000270B 83C402                   add  sp, 2
  6040                                  
  6041                                  ;-693     if (widthi == 2) prs("\n mov  [bx], ax");
  6042                                  
  6043 0000270E A1[3400]                 mov ax, [widthi]
  6044 00002711 83F802                   cmp ax, 2
  6045 00002714 0F850C00                 jne .doassign287
  6046 00002718 68[8F28]                 push doassign_1
  6047 0000271B E82EDE                   call prs
  6048 0000271E 83C402                   add  sp, 2
  6049                                  
  6050                                  ;-694     else  prs("\n mov  [bx], al"); return;}
  6051                                  
  6052 00002721 E90900                   jmp .doassign288
  6053                                  .doassign287:
  6054 00002724 68[A028]                 push doassign_2
  6055 00002727 E822DE                   call prs
  6056 0000272A 83C402                   add  sp, 2
  6057                                  .doassign288:
  6058 0000272D E95001                   jmp .retndoassign
  6059                                  
  6060                                  ;-695   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  6061                                  
  6062                                  .doassign286:
  6063 00002730 8B4604                   mov ax, [bp+4]
  6064 00002733 83F802                   cmp ax, 2
  6065 00002736 0F851E00                 jne .doassign289
  6066 0000273A 68[B128]                 push doassign_3
  6067 0000273D E80CDE                   call prs
  6068 00002740 83C402                   add  sp, 2
  6069 00002743 FF7606                   push word [bp+6]
  6070 00002746 E822DC                   call a
  6071 00002749 83C402                   add  sp, 2
  6072 0000274C 68[BA28]                 push doassign_4
  6073 0000274F E8FADD                   call prs
  6074 00002752 83C402                   add  sp, 2
  6075 00002755 E92801                   jmp .retndoassign
  6076                                  
  6077                                  ;-696   if (ixarr) {  prs("\n mov bx, ");
  6078                                  
  6079                                  .doassign289:
  6080 00002758 8B4608                   mov ax, [bp+8]
  6081 0000275B 08C0                     or  al, al
  6082 0000275D 0F846E00                 je .doassign290
  6083 00002761 68[BF28]                 push doassign_5
  6084 00002764 E8E5DD                   call prs
  6085 00002767 83C402                   add  sp, 2
  6086                                  
  6087                                  ;-697     if(ixconst) prunsign1(ixarr); else v(ixarr);
  6088                                  
  6089 0000276A 8B460A                   mov ax, [bp+10]
  6090 0000276D 08C0                     or  al, al
  6091 0000276F 0F840C00                 je .doassign291
  6092 00002773 FF7608                   push word [bp+8]
  6093 00002776 E828DF                   call prunsign1
  6094 00002779 83C402                   add  sp, 2
  6095 0000277C E90900                   jmp .doassign292
  6096                                  .doassign291:
  6097 0000277F FF7608                   push word [bp+8]
  6098 00002782 E8F5DB                   call v
  6099 00002785 83C402                   add  sp, 2
  6100                                  
  6101                                  ;-698     if (wi==2) prs("\n shl bx, 1");
  6102                                  
  6103                                  .doassign292:
  6104 00002788 A1[3700]                 mov ax, [wi]
  6105 0000278B 83F802                   cmp ax, 2
  6106 0000278E 0F850900                 jne .doassign293
  6107 00002792 68[CB28]                 push doassign_6
  6108 00002795 E8B4DD                   call prs
  6109 00002798 83C402                   add  sp, 2
  6110                                  
  6111                                  ;-699     prs("\n mov ["); printName(i);
  6112                                  
  6113                                  .doassign293:
  6114 0000279B 68[D828]                 push doassign_7
  6115 0000279E E8ABDD                   call prs
  6116 000027A1 83C402                   add  sp, 2
  6117 000027A4 FF7606                   push word [bp+6]
  6118 000027A7 E89BE4                   call printName
  6119 000027AA 83C402                   add  sp, 2
  6120                                  
  6121                                  ;-700     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  6122                                  
  6123 000027AD A1[3700]                 mov ax, [wi]
  6124 000027B0 83F802                   cmp ax, 2
  6125 000027B3 0F850C00                 jne .doassign294
  6126 000027B7 68[E128]                 push doassign_8
  6127 000027BA E88FDD                   call prs
  6128 000027BD 83C402                   add  sp, 2
  6129 000027C0 E90900                   jmp .doassign295
  6130                                  .doassign294:
  6131 000027C3 68[EA28]                 push doassign_9
  6132 000027C6 E883DD                   call prs
  6133 000027C9 83C402                   add  sp, 2
  6134                                  .doassign295:
  6135 000027CC E9B100                   jmp .retndoassign
  6136                                  
  6137                                  ;-701   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  6138                                  
  6139                                  .doassign290:
  6140 000027CF A1[3700]                 mov ax, [wi]
  6141 000027D2 83F801                   cmp ax, 1
  6142 000027D5 0F853100                 jne .doassign296
  6143 000027D9 68[F328]                 push doassign_10
  6144 000027DC E86DDD                   call prs
  6145 000027DF 83C402                   add  sp, 2
  6146 000027E2 8B4606                   mov ax, [bp+6]
  6147 000027E5 3DC800                   cmp ax, 200
  6148 000027E8 0F8D0900                 jge .doassign297
  6149 000027EC 68[FB28]                 push doassign_11
  6150 000027EF E85ADD                   call prs
  6151 000027F2 83C402                   add  sp, 2
  6152                                  
  6153                                  ;-702     } v(i); prs(", al"); return; }
  6154                                  
  6155                                  .doassign297:
  6156 000027F5 FF7606                   push word [bp+6]
  6157 000027F8 E87FDB                   call v
  6158 000027FB 83C402                   add  sp, 2
  6159 000027FE 68[0129]                 push doassign_12
  6160 00002801 E848DD                   call prs
  6161 00002804 83C402                   add  sp, 2
  6162 00002807 E97600                   jmp .retndoassign
  6163                                  
  6164                                  ;-703   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  6165                                  
  6166                                  .doassign296:
  6167 0000280A A1[3700]                 mov ax, [wi]
  6168 0000280D 83F802                   cmp ax, 2
  6169 00002810 0F853100                 jne .doassign298
  6170 00002814 68[0629]                 push doassign_13
  6171 00002817 E832DD                   call prs
  6172 0000281A 83C402                   add  sp, 2
  6173 0000281D 8B4606                   mov ax, [bp+6]
  6174 00002820 3DC800                   cmp ax, 200
  6175 00002823 0F8D0900                 jge .doassign299
  6176 00002827 68[0E29]                 push doassign_14
  6177 0000282A E81FDD                   call prs
  6178 0000282D 83C402                   add  sp, 2
  6179                                  
  6180                                  ;-704     } v(i); prs(", ax"); return; }
  6181                                  
  6182                                  .doassign299:
  6183 00002830 FF7606                   push word [bp+6]
  6184 00002833 E844DB                   call v
  6185 00002836 83C402                   add  sp, 2
  6186 00002839 68[1429]                 push doassign_15
  6187 0000283C E80DDD                   call prs
  6188 0000283F 83C402                   add  sp, 2
  6189 00002842 E93B00                   jmp .retndoassign
  6190                                  
  6191                                  ;-705   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  6192                                  
  6193                                  .doassign298:
  6194 00002845 A1[3700]                 mov ax, [wi]
  6195 00002848 83F804                   cmp ax, 4
  6196 0000284B 0F853100                 jne .doassign300
  6197 0000284F 68[1929]                 push doassign_16
  6198 00002852 E8F7DC                   call prs
  6199 00002855 83C402                   add  sp, 2
  6200 00002858 8B4606                   mov ax, [bp+6]
  6201 0000285B 3DC800                   cmp ax, 200
  6202 0000285E 0F8D0900                 jge .doassign301
  6203 00002862 68[2129]                 push doassign_17
  6204 00002865 E8E4DC                   call prs
  6205 00002868 83C402                   add  sp, 2
  6206                                  
  6207                                  ;-706     } v(i); prs(", eax"); return; }
  6208                                  
  6209                                  .doassign301:
  6210 0000286B FF7606                   push word [bp+6]
  6211 0000286E E809DB                   call v
  6212 00002871 83C402                   add  sp, 2
  6213 00002874 68[2829]                 push doassign_18
  6214 00002877 E8D2DC                   call prs
  6215 0000287A 83C402                   add  sp, 2
  6216 0000287D E90000                   jmp .retndoassign
  6217                                  
  6218                                  ;-707 }
  6219                                  
  6220                                  .doassign300:
  6221                                  
  6222                                  ;-708 int domul(int ids) {
  6223                                  
  6224 00002880 C9                       .retndoassign: LEAVE
  6225 00002881 C3                       ret
  6226 00002882 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  6227 0000288B 782C2000           
  6228 0000288F 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  6229 00002898 62785D2C20617800   
  6230 000028A0 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  6231 000028A9 62785D2C20616C00   
  6232 000028B1 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  6233 000028BA 2C20617800              doassign_4 db ", ax",0
  6234 000028BF 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  6235 000028C8 2C2000             
  6236 000028CB 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  6237 000028D4 2C203100           
  6238 000028D8 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  6239 000028E1 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  6240 000028EA 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  6241 000028F3 5C6E206D6F762000        doassign_10 db "\n mov ",0
  6242 000028FB 627974652000            doassign_11 db "byte ",0
  6243 00002901 2C20616C00              doassign_12 db ", al",0
  6244 00002906 5C6E206D6F762000        doassign_13 db "\n mov ",0
  6245 0000290E 776F72642000            doassign_14 db "word ",0
  6246 00002914 2C20617800              doassign_15 db ", ax",0
  6247 00002919 5C6E206D6F762000        doassign_16 db "\n mov ",0
  6248 00002921 64776F72642000          doassign_17 db "dword ",0
  6249 00002928 2C2065617800            doassign_18 db ", eax",0
  6250                                  ENDP
  6251                                  
  6252                                  domul: PROC
  6253                                  
  6254                                  ;-709   if (ids) rterm("imul"); else {
  6255                                  
  6256                                  ;Function : domul, Number of local variables: 1
  6257                                  ;   # type sign width addr used name   list of local variables
  6258                                  ;  200 var sign word   708 NULL ids = bp+4;
  6259 0000292E C8000000                 ENTER  0,0
  6260 00002932 8B4604                   mov ax, [bp+4]
  6261 00002935 08C0                     or  al, al
  6262 00002937 0F840C00                 je .domul302
  6263 0000293B 68[8029]                 push domul_0
  6264 0000293E E899F9                   call rterm
  6265 00002941 83C402                   add  sp, 2
  6266 00002944 E93700                   jmp .domul303
  6267                                  .domul302:
  6268                                  
  6269                                  ;-710   if (istoken(T_CONST)) {
  6270                                  
  6271 00002947 680101                   push 257
  6272 0000294A E8CADA                   call istoken
  6273 0000294D 83C402                   add  sp, 2
  6274 00002950 08C0                     or  al, al
  6275 00002952 0F841F00                 je .domul304
  6276                                  
  6277                                  ;-711     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6278                                  
  6279 00002956 68[8529]                 push domul_1
  6280 00002959 E8F0DB                   call prs
  6281 0000295C 83C402                   add  sp, 2
  6282 0000295F FF36[2C00]               push word [lexval]
  6283 00002963 E83BDD                   call prunsign1
  6284 00002966 83C402                   add  sp, 2
  6285 00002969 68[9129]                 push domul_2
  6286 0000296C E8DDDB                   call prs
  6287 0000296F 83C402                   add  sp, 2
  6288                                  
  6289                                  ;-712     }
  6290                                  
  6291                                  
  6292                                  ;-713   else error1("with MUL only const number as multiplicator allowed"); } }
  6293                                  
  6294 00002972 E90900                   jmp .domul305
  6295                                  .domul304:
  6296 00002975 68[9B29]                 push domul_3
  6297 00002978 E8B913                   call error1
  6298 0000297B 83C402                   add  sp, 2
  6299                                  .domul305:
  6300                                  .domul303:
  6301                                  
  6302                                  ;-714 int doidiv(int ids) { int mode; int id1;
  6303 0000297E C9                       LEAVE
  6304 0000297F C3                       ret
  6305 00002980 696D756C00              domul_0 db "imul",0
  6306 00002985 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6307 0000298E 2C2000             
  6308 00002991 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6309 0000299A 00                 
  6310 0000299B 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6311 000029A4 6F6E6C7920636F6E73-
  6312 000029AD 74206E756D62657220-
  6313 000029B6 6173206D756C746970-
  6314 000029BF 6C696361746F722061-
  6315 000029C8 6C6C6F77656400     
  6316                                  ENDP
  6317                                  
  6318                                  doidiv: PROC
  6319                                  
  6320                                  ;-715   if (istoken(T_CONST)) {
  6321                                  
  6322                                  ;Function : doidiv, Number of local variables: 3
  6323                                  ;   # type sign width addr used name   list of local variables
  6324                                  ;  200 var sign word   714 NULL ids = bp+4
  6325                                  ;  201 var sign word   714 NULL mode = bp-2
  6326                                  ;  202 var sign word   714 NULL id1 = bp-4;
  6327 000029CF C8040000                 ENTER  4,0
  6328 000029D3 680101                   push 257
  6329 000029D6 E83EDA                   call istoken
  6330 000029D9 83C402                   add  sp, 2
  6331 000029DC 08C0                     or  al, al
  6332 000029DE 0F843400                 je .doidiv306
  6333                                  
  6334                                  ;-716     prs("\n mov bx, "); prunsign1(lexval);
  6335                                  
  6336 000029E2 68[942A]                 push doidiv_0
  6337 000029E5 E864DB                   call prs
  6338 000029E8 83C402                   add  sp, 2
  6339 000029EB FF36[2C00]               push word [lexval]
  6340 000029EF E8AFDC                   call prunsign1
  6341 000029F2 83C402                   add  sp, 2
  6342                                  
  6343                                  ;-717     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6344                                  
  6345 000029F5 8B4604                   mov ax, [bp+4]
  6346 000029F8 08C0                     or  al, al
  6347 000029FA 0F840C00                 je .doidiv307
  6348 000029FE 68[A02A]                 push doidiv_1
  6349 00002A01 E848DB                   call prs
  6350 00002A04 83C402                   add  sp, 2
  6351 00002A07 E90900                   jmp .doidiv308
  6352                                  .doidiv307:
  6353 00002A0A 68[B12A]                 push doidiv_2
  6354 00002A0D E83CDB                   call prs
  6355 00002A10 83C402                   add  sp, 2
  6356                                  .doidiv308:
  6357                                  
  6358                                  ;-718   else {
  6359                                  
  6360 00002A13 E97C00                   jmp .doidiv309
  6361                                  .doidiv306:
  6362                                  
  6363                                  ;-719     mode=typeName(); id1=searchname();
  6364                                  
  6365 00002A16 E85FE3                   call typeName
  6366 00002A19 8946FE                   mov [bp-2], ax
  6367 00002A1C E88AE2                   call searchname
  6368 00002A1F 8946FC                   mov [bp-4], ax
  6369                                  
  6370                                  ;-720     if (mode) error1("only const number or int as divisor allowed");
  6371                                  
  6372 00002A22 8B46FE                   mov ax, [bp-2]
  6373 00002A25 08C0                     or  al, al
  6374 00002A27 0F840900                 je .doidiv310
  6375 00002A2B 68[C72A]                 push doidiv_3
  6376 00002A2E E80313                   call error1
  6377 00002A31 83C402                   add  sp, 2
  6378                                  
  6379                                  ;-721     gettypes(id1);
  6380                                  
  6381                                  .doidiv310:
  6382 00002A34 FF76FC                   push word [bp-4]
  6383 00002A37 E831E1                   call gettypes
  6384 00002A3A 83C402                   add  sp, 2
  6385                                  
  6386                                  ;-722     if (typei) error1("only int as simple var divisor allowed");
  6387                                  
  6388 00002A3D A1[2E00]                 mov ax, [typei]
  6389 00002A40 08C0                     or  al, al
  6390 00002A42 0F840900                 je .doidiv311
  6391 00002A46 68[F32A]                 push doidiv_4
  6392 00002A49 E8E812                   call error1
  6393 00002A4C 83C402                   add  sp, 2
  6394                                  
  6395                                  ;-723     if (wi!=2) error1("only int, no byte as divisor allowed");
  6396                                  
  6397                                  .doidiv311:
  6398 00002A4F A1[3700]                 mov ax, [wi]
  6399 00002A52 83F802                   cmp ax, 2
  6400 00002A55 0F840900                 je  .doidiv312
  6401 00002A59 68[1A2B]                 push doidiv_5
  6402 00002A5C E8D512                   call error1
  6403 00002A5F 83C402                   add  sp, 2
  6404                                  
  6405                                  ;-724     prs("\n mov bx, "); v(id1);
  6406                                  
  6407                                  .doidiv312:
  6408 00002A62 68[3F2B]                 push doidiv_6
  6409 00002A65 E8E4DA                   call prs
  6410 00002A68 83C402                   add  sp, 2
  6411 00002A6B FF76FC                   push word [bp-4]
  6412 00002A6E E809D9                   call v
  6413 00002A71 83C402                   add  sp, 2
  6414                                  
  6415                                  ;-725     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6416                                  
  6417 00002A74 8B4604                   mov ax, [bp+4]
  6418 00002A77 08C0                     or  al, al
  6419 00002A79 0F840C00                 je .doidiv313
  6420 00002A7D 68[4B2B]                 push doidiv_7
  6421 00002A80 E8C9DA                   call prs
  6422 00002A83 83C402                   add  sp, 2
  6423 00002A86 E90900                   jmp .doidiv314
  6424                                  .doidiv313:
  6425 00002A89 68[5C2B]                 push doidiv_8
  6426 00002A8C E8BDDA                   call prs
  6427 00002A8F 83C402                   add  sp, 2
  6428                                  .doidiv314:
  6429                                  
  6430                                  ;-726 }
  6431                                  
  6432                                  .doidiv309:
  6433                                  
  6434                                  ;-727 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6435 00002A92 C9                       LEAVE
  6436 00002A93 C3                       ret
  6437 00002A94 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6438 00002A9D 2C2000             
  6439 00002AA0 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6440 00002AA9 6964697620627800   
  6441 00002AB1 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6442 00002ABA 2C20305C6E20646976-
  6443 00002AC3 20627800           
  6444 00002AC7 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6445 00002AD0 74206E756D62657220-
  6446 00002AD9 6F7220696E74206173-
  6447 00002AE2 2064697669736F7220-
  6448 00002AEB 616C6C6F77656400   
  6449 00002AF3 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6450 00002AFC 61732073696D706C65-
  6451 00002B05 207661722064697669-
  6452 00002B0E 736F7220616C6C6F77-
  6453 00002B17 656400             
  6454 00002B1A 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6455 00002B23 206E6F206279746520-
  6456 00002B2C 61732064697669736F-
  6457 00002B35 7220616C6C6F776564-
  6458 00002B3E 00                 
  6459 00002B3F 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6460 00002B48 2C2000             
  6461 00002B4B 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6462 00002B54 6964697620627800   
  6463 00002B5C 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6464 00002B65 2C20305C6E20646976-
  6465 00002B6E 20627800           
  6466                                  ENDP
  6467                                  
  6468                                  domod: PROC
  6469                                  ;Function : domod, Number of local variables: 1
  6470                                  ;   # type sign width addr used name   list of local variables
  6471                                  ;  200 var sign word   727 NULL ids = bp+4;
  6472 00002B72 C8000000                 ENTER  0,0
  6473 00002B76 FF7604                   push word [bp+4]
  6474 00002B79 E853FE                   call doidiv
  6475 00002B7C 83C402                   add  sp, 2
  6476 00002B7F 68[8A2B]                 push domod_0
  6477 00002B82 E8C7D9                   call prs
  6478 00002B85 83C402                   add  sp, 2
  6479                                  
  6480                                  ;-728 
  6481                                  
  6482                                  
  6483                                  ;-729 int docalltype[10]; int docallvalue[10];
  6484 00002B88 C9                       LEAVE
  6485 00002B89 C3                       ret
  6486 00002B8A 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6487 00002B93 2C20647800         
  6488                                  ENDP
  6489                                  section .bss
  6490                                  absolute 55860
  6491 0000DA34 <res 00000014>          docalltype resw 10
  6492                                  section .text
  6493                                  section .bss
  6494                                  absolute 55880
  6495 0000DA48 <res 00000014>          docallvalue resw 10
  6496                                  section .text
  6497                                  
  6498                                  ;-730 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6499                                  
  6500                                  section .bss
  6501                                  absolute 55900
  6502 0000DA5C <res 00000011>          procname resb 17
  6503                                  section .text
  6504                                  
  6505                                  ;-731 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6506                                  
  6507                                  
  6508                                  docall1: PROC
  6509                                  
  6510                                  ;-732   narg=0;  sz32=0;
  6511                                  
  6512                                  ;Function : docall1, Number of local variables: 5
  6513                                  ;   # type sign width addr used name   list of local variables
  6514                                  ;  200 var sign word   731 NULL i = bp-2
  6515                                  ;  201 var sign word   731 NULL narg = bp-4
  6516                                  ;  202 var sign word   731 NULL t0 = bp-6
  6517                                  ;  203 var sign word   731 NULL n0 = bp-8
  6518                                  ;  204 var sign word   731 NULL sz32 = bp-10;
  6519 00002B98 C80A0000                 ENTER  10,0
  6520 00002B9C B80000                   mov ax, 0
  6521 00002B9F 8946FC                   mov [bp-4], ax
  6522 00002BA2 B80000                   mov ax, 0
  6523 00002BA5 8946F6                   mov [bp-10], ax
  6524                                  
  6525                                  ;-733   checknamelen();
  6526                                  
  6527 00002BA8 E802D8                   call checknamelen
  6528                                  
  6529                                  ;-734   strcpy(&procname, symbol);
  6530                                  
  6531 00002BAB 8D06BB69                 lea  ax, [symbol]
  6532 00002BAF 50                       push ax
  6533 00002BB0 8D065CDA                 lea  ax, [procname]
  6534 00002BB4 50                       push ax
  6535 00002BB5 E897D6                   call strcpy
  6536 00002BB8 83C404                   add  sp, 4
  6537                                  
  6538                                  ;-735   storecall();
  6539                                  
  6540 00002BBB E84DE3                   call storecall
  6541                                  
  6542                                  ;-736   expect('(');
  6543                                  
  6544 00002BBE 6A28                     push 40
  6545 00002BC0 E876D8                   call expect
  6546 00002BC3 83C402                   add  sp, 2
  6547                                  
  6548                                  ;-737 	if (istoken(')') ==0 ) {
  6549                                  
  6550 00002BC6 6A29                     push 41
  6551 00002BC8 E84CD8                   call istoken
  6552 00002BCB 83C402                   add  sp, 2
  6553 00002BCE 83F800                   cmp ax, 0
  6554 00002BD1 0F857802                 jne .docall1315
  6555                                  
  6556                                  ;-738 	  do { narg++;
  6557                                  
  6558                                  .docall1316:
  6559 00002BD5 FF46FC                   inc  word[bp-4]
  6560                                  
  6561                                  ;-739 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6562                                  
  6563 00002BD8 8B46FC                   mov ax, [bp-4]
  6564 00002BDB 83F809                   cmp ax, 9
  6565 00002BDE 0F8E0900                 jle .docall1317
  6566 00002BE2 68[912E]                 push docall1_0
  6567 00002BE5 E84C11                   call error1
  6568 00002BE8 83C402                   add  sp, 2
  6569                                  .docall1317:
  6570 00002BEB B80000                   mov ax, 0
  6571 00002BEE 8946FA                   mov [bp-6], ax
  6572                                  
  6573                                  ;-740       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6574                                  
  6575 00002BF1 680101                   push 257
  6576 00002BF4 E820D8                   call istoken
  6577 00002BF7 83C402                   add  sp, 2
  6578 00002BFA 08C0                     or  al, al
  6579 00002BFC 0F840C00                 je .docall1318
  6580 00002C00 B80100                   mov ax, 1
  6581 00002C03 8946FA                   mov [bp-6], ax
  6582 00002C06 A1[2C00]                 mov ax, [lexval]
  6583 00002C09 8946F8                   mov [bp-8], ax
  6584                                  
  6585                                  ;-741       if(istoken(T_STRING)){t0=2; n0=nconst;
  6586                                  
  6587                                  .docall1318:
  6588 00002C0C 680201                   push 258
  6589 00002C0F E805D8                   call istoken
  6590 00002C12 83C402                   add  sp, 2
  6591 00002C15 08C0                     or  al, al
  6592 00002C17 0F846300                 je .docall1319
  6593 00002C1B B80200                   mov ax, 2
  6594 00002C1E 8946FA                   mov [bp-6], ax
  6595 00002C21 A1[2600]                 mov ax, [nconst]
  6596 00002C24 8946F8                   mov [bp-8], ax
  6597                                  
  6598                                  ;-742         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6599                                  
  6600 00002C27 68[A32E]                 push docall1_1
  6601 00002C2A E88AD8                   call eprs
  6602 00002C2D 83C402                   add  sp, 2
  6603 00002C30 8D063B6A                 lea  ax, [fname]
  6604 00002C34 50                       push ax
  6605 00002C35 E87FD8                   call eprs
  6606 00002C38 83C402                   add  sp, 2
  6607 00002C3B 6A5F                     push 95
  6608 00002C3D E864D8                   call eprc
  6609 00002C40 83C402                   add  sp, 2
  6610 00002C43 FF36[2600]               push word [nconst]
  6611 00002C47 E896D9                   call eprnum
  6612 00002C4A 83C402                   add  sp, 2
  6613 00002C4D 68[A62E]                 push docall1_2
  6614 00002C50 E864D8                   call eprs
  6615 00002C53 83C402                   add  sp, 2
  6616                                  
  6617                                  ;-743         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6618                                  
  6619 00002C56 6A22                     push 34
  6620 00002C58 E849D8                   call eprc
  6621 00002C5B 83C402                   add  sp, 2
  6622 00002C5E 8D06BB69                 lea  ax, [symbol]
  6623 00002C62 50                       push ax
  6624 00002C63 E851D8                   call eprs
  6625 00002C66 83C402                   add  sp, 2
  6626 00002C69 6A22                     push 34
  6627 00002C6B E836D8                   call eprc
  6628 00002C6E 83C402                   add  sp, 2
  6629 00002C71 68[AB2E]                 push docall1_3
  6630 00002C74 E840D8                   call eprs
  6631 00002C77 83C402                   add  sp, 2
  6632 00002C7A FF06[2600]               inc  word[nconst]
  6633                                  
  6634                                  ;-744       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6635                                  
  6636                                  .docall1319:
  6637 00002C7E 6A26                     push 38
  6638 00002C80 E894D7                   call istoken
  6639 00002C83 83C402                   add  sp, 2
  6640 00002C86 08C0                     or  al, al
  6641 00002C88 0F840F00                 je .docall1320
  6642 00002C8C B80300                   mov ax, 3
  6643 00002C8F 8946FA                   mov [bp-6], ax
  6644 00002C92 E8BCE1                   call name1
  6645 00002C95 E811E0                   call searchname
  6646 00002C98 8946F8                   mov [bp-8], ax
  6647                                  
  6648                                  ;-745       if(istoken(T_NAME))  { n0=checkreg();
  6649                                  
  6650                                  .docall1320:
  6651 00002C9B 680001                   push 256
  6652 00002C9E E876D7                   call istoken
  6653 00002CA1 83C402                   add  sp, 2
  6654 00002CA4 08C0                     or  al, al
  6655 00002CA6 0F844800                 je .docall1321
  6656 00002CAA E8DEEA                   call checkreg
  6657 00002CAD 8946F8                   mov [bp-8], ax
  6658                                  
  6659                                  ;-746         if (n0) t0=5;
  6660                                  
  6661 00002CB0 8B46F8                   mov ax, [bp-8]
  6662 00002CB3 08C0                     or  al, al
  6663 00002CB5 0F840900                 je .docall1322
  6664 00002CB9 B80500                   mov ax, 5
  6665 00002CBC 8946FA                   mov [bp-6], ax
  6666                                  
  6667                                  ;-747         else {t0=4; n0=searchname();
  6668                                  
  6669 00002CBF E93000                   jmp .docall1323
  6670                                  .docall1322:
  6671 00002CC2 B80400                   mov ax, 4
  6672 00002CC5 8946FA                   mov [bp-6], ax
  6673 00002CC8 E8DEDF                   call searchname
  6674 00002CCB 8946F8                   mov [bp-8], ax
  6675                                  
  6676                                  ;-748           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6677                                  
  6678 00002CCE B8046B                   mov ax, GType
  6679 00002CD1 A3[7000]                 mov word [p1], ax
  6680 00002CD4 A1[7000]                 mov ax, [p1]
  6681 00002CD7 0346F8                   add ax, [bp-8]
  6682 00002CDA A3[7000]                 mov word [p1], ax
  6683 00002CDD 8B1E[7000]               mov bx, [p1]
  6684 00002CE1 8A07                     mov al, [bx]
  6685 00002CE3 B400                     mov ah, 0
  6686 00002CE5 83F826                   cmp ax, 38
  6687 00002CE8 0F850600                 jne .docall1324
  6688 00002CEC B80300                   mov ax, 3
  6689 00002CEF 8946FA                   mov [bp-6], ax
  6690                                  .docall1324:
  6691                                  .docall1323:
  6692                                  
  6693                                  ;-749       if (t0==0) error1("parameter not recognized (no * allowed)");
  6694                                  
  6695                                  .docall1321:
  6696 00002CF2 8B46FA                   mov ax, [bp-6]
  6697 00002CF5 83F800                   cmp ax, 0
  6698 00002CF8 0F850900                 jne .docall1325
  6699 00002CFC 68[AE2E]                 push docall1_4
  6700 00002CFF E83210                   call error1
  6701 00002D02 83C402                   add  sp, 2
  6702                                  
  6703                                  ;-750       docalltype [narg] = t0;
  6704                                  
  6705                                  .docall1325:
  6706 00002D05 8B46FA                   mov ax, [bp-6]
  6707 00002D08 8B5EFC                   mov bx, [bp-4]
  6708 00002D0B D1E3                     shl bx, 1
  6709 00002D0D 898734DA                 mov [docalltype+bx], ax
  6710                                  
  6711                                  ;-751       docallvalue[narg] = n0;
  6712                                  
  6713 00002D11 8B46F8                   mov ax, [bp-8]
  6714 00002D14 8B5EFC                   mov bx, [bp-4]
  6715 00002D17 D1E3                     shl bx, 1
  6716 00002D19 898748DA                 mov [docallvalue+bx], ax
  6717                                  
  6718                                  ;-752     } while (istoken(','));
  6719                                  
  6720 00002D1D 6A2C                     push 44
  6721 00002D1F E8F5D6                   call istoken
  6722 00002D22 83C402                   add  sp, 2
  6723 00002D25 08C0                     or  al, al
  6724 00002D27 0F840300                 je .docall1326
  6725 00002D2B E9A7FE                   jmp .docall1316
  6726                                  .docall1326:
  6727                                  
  6728                                  ;-753 
  6729                                  
  6730                                  
  6731                                  ;-754   	expect(')');  i=narg;
  6732                                  
  6733 00002D2E 6A29                     push 41
  6734 00002D30 E806D7                   call expect
  6735 00002D33 83C402                   add  sp, 2
  6736 00002D36 8B46FC                   mov ax, [bp-4]
  6737 00002D39 8946FE                   mov [bp-2], ax
  6738                                  
  6739                                  ;-755     do {
  6740                                  
  6741                                  .docall1327:
  6742                                  
  6743                                  ;-756       t0 = docalltype [i];
  6744                                  
  6745 00002D3C 8B5EFE                   mov bx, [bp-2]
  6746 00002D3F D1E3                     shl bx, 1
  6747 00002D41 8B8734DA                 mov ax, [docalltype + bx]
  6748 00002D45 8946FA                   mov [bp-6], ax
  6749                                  
  6750                                  ;-757       n0 = docallvalue[i];
  6751                                  
  6752 00002D48 8B5EFE                   mov bx, [bp-2]
  6753 00002D4B D1E3                     shl bx, 1
  6754 00002D4D 8B8748DA                 mov ax, [docallvalue + bx]
  6755 00002D51 8946F8                   mov [bp-8], ax
  6756                                  
  6757                                  ;-758       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6758                                  
  6759 00002D54 8B46FA                   mov ax, [bp-6]
  6760 00002D57 83F801                   cmp ax, 1
  6761 00002D5A 0F851200                 jne .docall1328
  6762 00002D5E 68[D62E]                 push docall1_5
  6763 00002D61 E8E8D7                   call prs
  6764 00002D64 83C402                   add  sp, 2
  6765 00002D67 FF76F8                   push word [bp-8]
  6766 00002D6A E834D9                   call prunsign1
  6767 00002D6D 83C402                   add  sp, 2
  6768                                  
  6769                                  ;-759       if(t0==2){ prs("\n push ");
  6770                                  
  6771                                  .docall1328:
  6772 00002D70 8B46FA                   mov ax, [bp-6]
  6773 00002D73 83F802                   cmp ax, 2
  6774 00002D76 0F852500                 jne .docall1329
  6775 00002D7A 68[DF2E]                 push docall1_6
  6776 00002D7D E8CCD7                   call prs
  6777 00002D80 83C402                   add  sp, 2
  6778                                  
  6779                                  ;-760         prs(fname);prc(95);prunsign1(n0);}
  6780                                  
  6781 00002D83 8D063B6A                 lea  ax, [fname]
  6782 00002D87 50                       push ax
  6783 00002D88 E8C1D7                   call prs
  6784 00002D8B 83C402                   add  sp, 2
  6785 00002D8E 6A5F                     push 95
  6786 00002D90 E852D7                   call prc
  6787 00002D93 83C402                   add  sp, 2
  6788 00002D96 FF76F8                   push word [bp-8]
  6789 00002D99 E805D9                   call prunsign1
  6790 00002D9C 83C402                   add  sp, 2
  6791                                  
  6792                                  ;-761       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6793                                  
  6794                                  .docall1329:
  6795 00002D9F 8B46FA                   mov ax, [bp-6]
  6796 00002DA2 83F803                   cmp ax, 3
  6797 00002DA5 0F851B00                 jne .docall1330
  6798 00002DA9 68[E82E]                 push docall1_7
  6799 00002DAC E89DD7                   call prs
  6800 00002DAF 83C402                   add  sp, 2
  6801 00002DB2 FF76F8                   push word [bp-8]
  6802 00002DB5 E8C2D5                   call v
  6803 00002DB8 83C402                   add  sp, 2
  6804                                  
  6805                                  ;-762         prs("\n push ax");}
  6806                                  
  6807 00002DBB 68[F52E]                 push docall1_8
  6808 00002DBE E88BD7                   call prs
  6809 00002DC1 83C402                   add  sp, 2
  6810                                  
  6811                                  ;-763       if(t0==4){ gettypes(n0);
  6812                                  
  6813                                  .docall1330:
  6814 00002DC4 8B46FA                   mov ax, [bp-6]
  6815 00002DC7 83F804                   cmp ax, 4
  6816 00002DCA 0F854300                 jne .docall1331
  6817 00002DCE FF76F8                   push word [bp-8]
  6818 00002DD1 E897DD                   call gettypes
  6819 00002DD4 83C402                   add  sp, 2
  6820                                  
  6821                                  ;-764         if(wi==2) { prs("\n push word "); v(n0);}
  6822                                  
  6823 00002DD7 A1[3700]                 mov ax, [wi]
  6824 00002DDA 83F802                   cmp ax, 2
  6825 00002DDD 0F851500                 jne .docall1332
  6826 00002DE1 68[002F]                 push docall1_9
  6827 00002DE4 E865D7                   call prs
  6828 00002DE7 83C402                   add  sp, 2
  6829 00002DEA FF76F8                   push word [bp-8]
  6830 00002DED E88AD5                   call v
  6831 00002DF0 83C402                   add  sp, 2
  6832                                  
  6833                                  ;-765         else { prs("\n mov al, byte ");   v(n0);
  6834                                  
  6835 00002DF3 E91B00                   jmp .docall1333
  6836                                  .docall1332:
  6837 00002DF6 68[0E2F]                 push docall1_10
  6838 00002DF9 E850D7                   call prs
  6839 00002DFC 83C402                   add  sp, 2
  6840 00002DFF FF76F8                   push word [bp-8]
  6841 00002E02 E875D5                   call v
  6842 00002E05 83C402                   add  sp, 2
  6843                                  
  6844                                  ;-766         prs("\n mov ah, 0\n push ax"); } }
  6845                                  
  6846 00002E08 68[1F2F]                 push docall1_11
  6847 00002E0B E83ED7                   call prs
  6848 00002E0E 83C402                   add  sp, 2
  6849                                  .docall1333:
  6850                                  
  6851                                  ;-767       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6852                                  
  6853                                  .docall1331:
  6854 00002E11 8B46FA                   mov ax, [bp-6]
  6855 00002E14 83F805                   cmp ax, 5
  6856 00002E17 0F852200                 jne .docall1334
  6857 00002E1B 68[362F]                 push docall1_12
  6858 00002E1E E82BD7                   call prs
  6859 00002E21 83C402                   add  sp, 2
  6860 00002E24 FF76F8                   push word [bp-8]
  6861 00002E27 E86FED                   call printreg
  6862 00002E2A 83C402                   add  sp, 2
  6863 00002E2D 8B46F8                   mov ax, [bp-8]
  6864 00002E30 83F82F                   cmp ax, 47 ;unsigned : 1
  6865 00002E33 0F8C0600                 jl  .docall1335
  6866 00002E37 8B46F6                   mov ax, [bp-10]
  6867 00002E3A 83C002                   add ax, 2
  6868                                  .docall1335:
  6869                                  
  6870                                  ;-768    i--; } while (i > 0);  }
  6871                                  
  6872                                  .docall1334:
  6873 00002E3D FF4EFE                   dec  word[bp-2]
  6874 00002E40 8B46FE                   mov ax, [bp-2]
  6875 00002E43 83F800                   cmp ax, 0
  6876 00002E46 0F8E0300                 jle .docall1336
  6877 00002E4A E9EFFE                   jmp .docall1327
  6878                                  .docall1336:
  6879                                  
  6880                                  ;-769 	 prs("\n call "); prs(&procname);
  6881                                  
  6882                                  .docall1315:
  6883 00002E4D 68[3F2F]                 push docall1_13
  6884 00002E50 E8F9D6                   call prs
  6885 00002E53 83C402                   add  sp, 2
  6886 00002E56 8D065CDA                 lea  ax, [procname]
  6887 00002E5A 50                       push ax
  6888 00002E5B E8EED6                   call prs
  6889 00002E5E 83C402                   add  sp, 2
  6890                                  
  6891                                  ;-770 	 if (narg>0) {prs("\n add  sp, ");
  6892                                  
  6893 00002E61 8B46FC                   mov ax, [bp-4]
  6894 00002E64 83F800                   cmp ax, 0
  6895 00002E67 0F8E2400                 jle .docall1337
  6896 00002E6B 68[482F]                 push docall1_14
  6897 00002E6E E8DBD6                   call prs
  6898 00002E71 83C402                   add  sp, 2
  6899                                  
  6900                                  ;-771      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6901                                  
  6902 00002E74 8B46FC                   mov ax, [bp-4]
  6903 00002E77 0346FC                   add ax, [bp-4]
  6904 00002E7A 8946FC                   mov [bp-4], ax
  6905 00002E7D 8B46FC                   mov ax, [bp-4]
  6906 00002E80 0346F6                   add ax, [bp-10]
  6907 00002E83 8946FC                   mov [bp-4], ax
  6908 00002E86 FF76FC                   push word [bp-4]
  6909 00002E89 E815D8                   call prunsign1
  6910 00002E8C 83C402                   add  sp, 2
  6911                                  .docall1337:
  6912                                  
  6913                                  ;-772 /***************************************************************/
  6914                                  
  6915                                  
  6916                                  ;-773 
  6917                                  
  6918                                  
  6919                                  ;-774 int doemit() {prs("\n db ");
  6920 00002E8F C9                       LEAVE
  6921 00002E90 C3                       ret
  6922 00002E91 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6923 00002E9A 72616D657465727300 
  6924 00002EA3 5C6E00                  docall1_1 db "\n",0
  6925 00002EA6 2064622000              docall1_2 db " db ",0
  6926 00002EAB 2C3000                  docall1_3 db ",0",0
  6927 00002EAE 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6928 00002EB7 206E6F74207265636F-
  6929 00002EC0 676E697A656420286E-
  6930 00002EC9 6F202A20616C6C6F77-
  6931 00002ED2 65642900           
  6932 00002ED6 5C6E20707573682000      docall1_5 db "\n push ",0
  6933 00002EDF 5C6E20707573682000      docall1_6 db "\n push ",0
  6934 00002EE8 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6935 00002EF1 782C2000           
  6936 00002EF5 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6937 00002EFE 7800               
  6938 00002F00 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6939 00002F09 6F72642000         
  6940 00002F0E 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6941 00002F17 2C20627974652000   
  6942 00002F1F 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6943 00002F28 2C20305C6E20707573-
  6944 00002F31 6820617800         
  6945 00002F36 5C6E20707573682000      docall1_12 db "\n push ",0
  6946 00002F3F 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6947 00002F48 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6948 00002F51 702C2000           
  6949                                  ENDP
  6950                                  
  6951                                  doemit: PROC
  6952 00002F55 68[912F]                 push doemit_0
  6953 00002F58 E8F1D5                   call prs
  6954 00002F5B 83C402                   add  sp, 2
  6955                                  
  6956                                  ;-775   L1: token=getlex(); prunsign1(lexval); token=getlex();
  6957                                  
  6958                                  .L1:
  6959 00002F5E E85C03                   call getlex
  6960 00002F61 A3[1E00]                 mov word [token], ax
  6961 00002F64 FF36[2C00]               push word [lexval]
  6962 00002F68 E836D7                   call prunsign1
  6963 00002F6B 83C402                   add  sp, 2
  6964 00002F6E E84C03                   call getlex
  6965 00002F71 A3[1E00]                 mov word [token], ax
  6966                                  
  6967                                  ;-776     if (token== ',') {prc(','); goto L1;} expect(')'); }
  6968                                  
  6969 00002F74 A1[1E00]                 mov ax, [token]
  6970 00002F77 83F82C                   cmp ax, 44
  6971 00002F7A 0F850A00                 jne .doemit338
  6972 00002F7E 6A2C                     push 44
  6973 00002F80 E862D5                   call prc
  6974 00002F83 83C402                   add  sp, 2
  6975 00002F86 EBD6                     jmp .L1
  6976                                  .doemit338:
  6977 00002F88 6A29                     push 41
  6978 00002F8A E8ACD4                   call expect
  6979 00002F8D 83C402                   add  sp, 2
  6980                                  
  6981                                  ;-777 
  6982                                  
  6983                                  
  6984                                  ;-778 int cmpneg(int ids) {
  6985                                  
  6986 00002F90 C3                       ret
  6987 00002F91 5C6E2064622000          doemit_0 db "\n db ",0
  6988                                  ENDP
  6989                                  
  6990                                  cmpneg: PROC
  6991                                  
  6992                                  ;-779        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  6993                                  
  6994                                  ;Function : cmpneg, Number of local variables: 1
  6995                                  ;   # type sign width addr used name   list of local variables
  6996                                  ;  200 var sign word   778 NULL ids = bp+4;
  6997 00002F98 C8000000                 ENTER  0,0
  6998 00002F9C A1[2400]                 mov ax, [iscmp]
  6999 00002F9F 3D2603                   cmp ax, 806
  7000 00002FA2 0F850C00                 jne .cmpneg339
  7001 00002FA6 68[7930]                 push cmpneg_0
  7002 00002FA9 E8A0D5                   call prs
  7003 00002FAC 83C402                   add  sp, 2
  7004                                  
  7005                                  ;-780   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7006                                  
  7007 00002FAF E9C500                   jmp .cmpneg340
  7008                                  .cmpneg339:
  7009 00002FB2 A1[2400]                 mov ax, [iscmp]
  7010 00002FB5 3D2703                   cmp ax, 807
  7011 00002FB8 0F850C00                 jne .cmpneg341
  7012 00002FBC 68[8230]                 push cmpneg_1
  7013 00002FBF E88AD5                   call prs
  7014 00002FC2 83C402                   add  sp, 2
  7015                                  
  7016                                  ;-781   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7017                                  
  7018 00002FC5 E9AF00                   jmp .cmpneg342
  7019                                  .cmpneg341:
  7020 00002FC8 A1[2400]                 mov ax, [iscmp]
  7021 00002FCB 3D3803                   cmp ax, 824
  7022 00002FCE 0F852100                 jne .cmpneg343
  7023 00002FD2 8B4604                   mov ax, [bp+4]
  7024 00002FD5 08C0                     or  al, al
  7025 00002FD7 0F840C00                 je .cmpneg344
  7026 00002FDB 68[8B30]                 push cmpneg_2
  7027 00002FDE E86BD5                   call prs
  7028 00002FE1 83C402                   add  sp, 2
  7029                                  
  7030                                  ;-782                            else prs("\n ja  .");//ZF=0 CF=0
  7031                                  
  7032 00002FE4 E90900                   jmp .cmpneg345
  7033                                  .cmpneg344:
  7034 00002FE7 68[9430]                 push cmpneg_3
  7035 00002FEA E85FD5                   call prs
  7036 00002FED 83C402                   add  sp, 2
  7037                                  
  7038                                  ;-783   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7039                                  
  7040                                  .cmpneg345:
  7041 00002FF0 E98400                   jmp .cmpneg346
  7042                                  .cmpneg343:
  7043 00002FF3 A1[2400]                 mov ax, [iscmp]
  7044 00002FF6 3D2B03                   cmp ax, 811
  7045 00002FF9 0F854500                 jne .cmpneg347
  7046 00002FFD 8B4604                   mov ax, [bp+4]
  7047 00003000 08C0                     or  al, al
  7048 00003002 0F841E00                 je .cmpneg348
  7049 00003006 68[9D30]                 push cmpneg_4
  7050 00003009 E840D5                   call prs
  7051 0000300C 83C402                   add  sp, 2
  7052 0000300F FF7604                   push word [bp+4]
  7053 00003012 E88CD6                   call prunsign1
  7054 00003015 83C402                   add  sp, 2
  7055                                  
  7056                                  ;-784                                prs("\n jl  .");}//          SF!=OF
  7057                                  
  7058 00003018 68[AB30]                 push cmpneg_5
  7059 0000301B E82ED5                   call prs
  7060 0000301E 83C402                   add  sp, 2
  7061                                  
  7062                                  ;-785                            else{prs(" ;unsigned : "); prunsign1(ids);
  7063                                  
  7064 00003021 E91B00                   jmp .cmpneg349
  7065                                  .cmpneg348:
  7066 00003024 68[B430]                 push cmpneg_6
  7067 00003027 E822D5                   call prs
  7068 0000302A 83C402                   add  sp, 2
  7069 0000302D FF7604                   push word [bp+4]
  7070 00003030 E86ED6                   call prunsign1
  7071 00003033 83C402                   add  sp, 2
  7072                                  
  7073                                  ;-786                                prs("\n jb  .");}//jb=jc=CF=1
  7074                                  
  7075 00003036 68[C230]                 push cmpneg_7
  7076 00003039 E810D5                   call prs
  7077 0000303C 83C402                   add  sp, 2
  7078                                  
  7079                                  ;-787   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7080                                  
  7081                                  .cmpneg349:
  7082 0000303F E93500                   jmp .cmpneg350
  7083                                  .cmpneg347:
  7084 00003042 A1[2400]                 mov ax, [iscmp]
  7085 00003045 83F83C                   cmp ax, 60
  7086 00003048 0F850C00                 jne .cmpneg351
  7087 0000304C 68[CB30]                 push cmpneg_8
  7088 0000304F E8FAD4                   call prs
  7089 00003052 83C402                   add  sp, 2
  7090                                  
  7091                                  ;-788   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7092                                  
  7093 00003055 E91F00                   jmp .cmpneg352
  7094                                  .cmpneg351:
  7095 00003058 A1[2400]                 mov ax, [iscmp]
  7096 0000305B 83F83E                   cmp ax, 62
  7097 0000305E 0F850C00                 jne .cmpneg353
  7098 00003062 68[D430]                 push cmpneg_9
  7099 00003065 E8E4D4                   call prs
  7100 00003068 83C402                   add  sp, 2
  7101                                  
  7102                                  ;-789   else error1("internal error compare unknown in CMPNEG()");  }
  7103                                  
  7104 0000306B E90900                   jmp .cmpneg354
  7105                                  .cmpneg353:
  7106 0000306E 68[DD30]                 push cmpneg_10
  7107 00003071 E8C00C                   call error1
  7108 00003074 83C402                   add  sp, 2
  7109                                  .cmpneg354:
  7110                                  .cmpneg352:
  7111                                  .cmpneg350:
  7112                                  .cmpneg346:
  7113                                  .cmpneg342:
  7114                                  .cmpneg340:
  7115                                  
  7116                                  ;-790 
  7117                                  
  7118                                  
  7119                                  ;-791 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7120 00003077 C9                       LEAVE
  7121 00003078 C3                       ret
  7122 00003079 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7123 00003082 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7124 0000308B 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7125 00003094 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7126 0000309D 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7127 000030A6 64203A2000         
  7128 000030AB 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7129 000030B4 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7130 000030BD 64203A2000         
  7131 000030C2 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7132 000030CB 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7133 000030D4 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7134 000030DD 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7135 000030E6 6572726F7220636F6D-
  7136 000030EF 7061726520756E6B6E-
  7137 000030F8 6F776E20696E20434D-
  7138 00003101 504E4547282900     
  7139                                  ENDP
  7140                                  
  7141                                  prlabel: PROC
  7142                                  ;Function : prlabel, Number of local variables: 1
  7143                                  ;   # type sign width addr used name   list of local variables
  7144                                  ;  200 var sign word   791 NULL n = bp+4;
  7145 00003108 C8000000                 ENTER  0,0
  7146 0000310C 68[3331]                 push prlabel_0
  7147 0000310F E83AD4                   call prs
  7148 00003112 83C402                   add  sp, 2
  7149 00003115 8D063B6A                 lea  ax, [fname]
  7150 00003119 50                       push ax
  7151 0000311A E82FD4                   call prs
  7152 0000311D 83C402                   add  sp, 2
  7153 00003120 FF7604                   push word [bp+4]
  7154 00003123 E87BD5                   call prunsign1
  7155 00003126 83C402                   add  sp, 2
  7156 00003129 6A3A                     push 58
  7157 0000312B E8B7D3                   call prc
  7158 0000312E 83C402                   add  sp, 2
  7159                                  
  7160                                  ;-792 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7161 00003131 C9                       LEAVE
  7162 00003132 C3                       ret
  7163 00003133 5C6E2E00                prlabel_0 db "\n.",0
  7164                                  ENDP
  7165                                  
  7166                                  prjump: PROC
  7167                                  ;Function : prjump, Number of local variables: 1
  7168                                  ;   # type sign width addr used name   list of local variables
  7169                                  ;  200 var sign word   792 NULL n = bp+4;
  7170 00003137 C8000000                 ENTER  0,0
  7171 0000313B 68[5A31]                 push prjump_0
  7172 0000313E E80BD4                   call prs
  7173 00003141 83C402                   add  sp, 2
  7174 00003144 8D063B6A                 lea  ax, [fname]
  7175 00003148 50                       push ax
  7176 00003149 E800D4                   call prs
  7177 0000314C 83C402                   add  sp, 2
  7178 0000314F FF7604                   push word [bp+4]
  7179 00003152 E84CD5                   call prunsign1
  7180 00003155 83C402                   add  sp, 2
  7181                                  
  7182                                  ;-793 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7183 00003158 C9                       LEAVE
  7184 00003159 C3                       ret
  7185 0000315A 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7186                                  ENDP
  7187                                  
  7188                                  doif: PROC
  7189                                  ;Function : doif, Number of local variables: 2
  7190                                  ;   # type sign width addr used name   list of local variables
  7191                                  ;  200 var sign word   793 NULL jdest = bp-2
  7192                                  ;  201 var sign word   793 NULL tst = bp-4;
  7193 00003163 C8040000                 ENTER  4,0
  7194 00003167 E8A4E2                   call pexpr
  7195 0000316A FF06[2A00]               inc  word[nlabel]
  7196 0000316E A1[2A00]                 mov ax, [nlabel]
  7197 00003171 8946FE                   mov [bp-2], ax
  7198                                  
  7199                                  ;-794   pint1(jdest); stmt();
  7200                                  
  7201 00003174 FF76FE                   push word [bp-2]
  7202 00003177 E8C9D4                   call pint1
  7203 0000317A 83C402                   add  sp, 2
  7204 0000317D E8F307                   call stmt
  7205                                  
  7206                                  ;-795   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7207                                  
  7208 00003180 680202                   push 514
  7209 00003183 E891D2                   call istoken
  7210 00003186 83C402                   add  sp, 2
  7211 00003189 08C0                     or  al, al
  7212 0000318B 0F842B00                 je .doif355
  7213 0000318F FF06[2A00]               inc  word[nlabel]
  7214 00003193 A1[2A00]                 mov ax, [nlabel]
  7215 00003196 8946FC                   mov [bp-4], ax
  7216                                  
  7217                                  ;-796     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7218                                  
  7219 00003199 FF76FC                   push word [bp-4]
  7220 0000319C E898FF                   call prjump
  7221 0000319F 83C402                   add  sp, 2
  7222 000031A2 FF76FE                   push word [bp-2]
  7223 000031A5 E860FF                   call prlabel
  7224 000031A8 83C402                   add  sp, 2
  7225 000031AB E8C507                   call stmt
  7226 000031AE FF76FC                   push word [bp-4]
  7227 000031B1 E854FF                   call prlabel
  7228 000031B4 83C402                   add  sp, 2
  7229                                  
  7230                                  ;-797   else prlabel(jdest); }
  7231                                  
  7232 000031B7 E90900                   jmp .doif356
  7233                                  .doif355:
  7234 000031BA FF76FE                   push word [bp-2]
  7235 000031BD E848FF                   call prlabel
  7236 000031C0 83C402                   add  sp, 2
  7237                                  .doif356:
  7238                                  
  7239                                  ;-798 
  7240                                  
  7241                                  
  7242                                  ;-799 int dodo() {int jdest; int jtemp;
  7243 000031C3 C9                       LEAVE
  7244 000031C4 C3                       ret
  7245                                  ENDP
  7246                                  
  7247                                  dodo: PROC
  7248                                  
  7249                                  ;-800   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7250                                  
  7251                                  ;Function : dodo, Number of local variables: 2
  7252                                  ;   # type sign width addr used name   list of local variables
  7253                                  ;  200 var sign word   799 NULL jdest = bp-2
  7254                                  ;  201 var sign word   799 NULL jtemp = bp-4;
  7255 000031C5 C8040000                 ENTER  4,0
  7256 000031C9 FF06[2A00]               inc  word[nlabel]
  7257 000031CD A1[2A00]                 mov ax, [nlabel]
  7258 000031D0 8946FE                   mov [bp-2], ax
  7259 000031D3 FF76FE                   push word [bp-2]
  7260 000031D6 E82FFF                   call prlabel
  7261 000031D9 83C402                   add  sp, 2
  7262 000031DC E89407                   call stmt
  7263                                  
  7264                                  ;-801   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7265                                  
  7266 000031DF 680302                   push 515
  7267 000031E2 E854D2                   call expect
  7268 000031E5 83C402                   add  sp, 2
  7269 000031E8 E823E2                   call pexpr
  7270 000031EB FF06[2A00]               inc  word[nlabel]
  7271 000031EF A1[2A00]                 mov ax, [nlabel]
  7272 000031F2 8946FC                   mov [bp-4], ax
  7273 000031F5 FF76FC                   push word [bp-4]
  7274 000031F8 E848D4                   call pint1
  7275 000031FB 83C402                   add  sp, 2
  7276                                  
  7277                                  ;-802   prjump(jdest); prlabel(jtemp); }
  7278                                  
  7279 000031FE FF76FE                   push word [bp-2]
  7280 00003201 E833FF                   call prjump
  7281 00003204 83C402                   add  sp, 2
  7282 00003207 FF76FC                   push word [bp-4]
  7283 0000320A E8FBFE                   call prlabel
  7284 0000320D 83C402                   add  sp, 2
  7285                                  
  7286                                  ;-803 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7287 00003210 C9                       LEAVE
  7288 00003211 C3                       ret
  7289                                  ENDP
  7290                                  
  7291                                  dowhile: PROC
  7292                                  ;Function : dowhile, Number of local variables: 2
  7293                                  ;   # type sign width addr used name   list of local variables
  7294                                  ;  200 var sign word   803 NULL jdest = bp-2
  7295                                  ;  201 var sign word   803 NULL tst = bp-4;
  7296 00003212 C8040000                 ENTER  4,0
  7297 00003216 FF06[2A00]               inc  word[nlabel]
  7298 0000321A A1[2A00]                 mov ax, [nlabel]
  7299 0000321D 8946FE                   mov [bp-2], ax
  7300                                  
  7301                                  ;-804   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7302                                  
  7303 00003220 FF76FE                   push word [bp-2]
  7304 00003223 E8E2FE                   call prlabel
  7305 00003226 83C402                   add  sp, 2
  7306 00003229 E8E2E1                   call pexpr
  7307 0000322C FF06[2A00]               inc  word[nlabel]
  7308 00003230 A1[2A00]                 mov ax, [nlabel]
  7309 00003233 8946FC                   mov [bp-4], ax
  7310 00003236 FF76FC                   push word [bp-4]
  7311 00003239 E807D4                   call pint1
  7312 0000323C 83C402                   add  sp, 2
  7313                                  
  7314                                  ;-805   stmt(); prjump(jdest); prlabel(tst); }
  7315                                  
  7316 0000323F E83107                   call stmt
  7317 00003242 FF76FE                   push word [bp-2]
  7318 00003245 E8EFFE                   call prjump
  7319 00003248 83C402                   add  sp, 2
  7320 0000324B FF76FC                   push word [bp-4]
  7321 0000324E E8B7FE                   call prlabel
  7322 00003251 83C402                   add  sp, 2
  7323                                  
  7324                                  ;-806 int isrelational() {
  7325 00003254 C9                       LEAVE
  7326 00003255 C3                       ret
  7327                                  ENDP
  7328                                  
  7329                                  isrelational: PROC
  7330                                  
  7331                                  ;-807   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7332                                  
  7333 00003256 A1[1E00]                 mov ax, [token]
  7334 00003259 3D2603                   cmp ax, 806
  7335 0000325C 0F850300                 jne .isrelational357
  7336 00003260 E94700                   jmp .w
  7337                                  .isrelational357:
  7338 00003263 A1[1E00]                 mov ax, [token]
  7339 00003266 3D2703                   cmp ax, 807
  7340 00003269 0F850300                 jne .isrelational358
  7341 0000326D E93A00                   jmp .w
  7342                                  
  7343                                  ;-808   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7344                                  
  7345                                  .isrelational358:
  7346 00003270 A1[1E00]                 mov ax, [token]
  7347 00003273 3D3803                   cmp ax, 824
  7348 00003276 0F850300                 jne .isrelational359
  7349 0000327A E92D00                   jmp .w
  7350                                  .isrelational359:
  7351 0000327D A1[1E00]                 mov ax, [token]
  7352 00003280 3D2B03                   cmp ax, 811
  7353 00003283 0F850300                 jne .isrelational360
  7354 00003287 E92000                   jmp .w
  7355                                  
  7356                                  ;-809   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7357                                  
  7358                                  .isrelational360:
  7359 0000328A A1[1E00]                 mov ax, [token]
  7360 0000328D 83F83C                   cmp ax, 60
  7361 00003290 0F850300                 jne .isrelational361
  7362 00003294 E91300                   jmp .w
  7363                                  .isrelational361:
  7364 00003297 A1[1E00]                 mov ax, [token]
  7365 0000329A 83F83E                   cmp ax, 62
  7366 0000329D 0F850300                 jne .isrelational362
  7367 000032A1 E90600                   jmp .w
  7368                                  
  7369                                  ;-810   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7370                                  
  7371                                  .isrelational362:
  7372 000032A4 B80000                   mov ax, 0
  7373 000032A7 E91200                   jmp .retnisrelational
  7374                                  .w:
  7375 000032AA A1[1E00]                 mov ax, [token]
  7376 000032AD A3[2400]                 mov word [iscmp], ax
  7377 000032B0 E80A00                   call getlex
  7378 000032B3 A3[1E00]                 mov word [token], ax
  7379 000032B6 B80100                   mov ax, 1
  7380 000032B9 E90000                   jmp .retnisrelational
  7381                                  
  7382                                  ;-811 
  7383                                  
  7384                                  
  7385                                  ;-812 char symboltemp[80];
  7386                                  
  7387                                   .retnisrelational:
  7388 000032BC C3                       ret
  7389                                  ENDP
  7390                                  section .bss
  7391                                  absolute 55917
  7392 0000DA6D <res 00000050>          symboltemp resb 80
  7393                                  section .text
  7394                                  
  7395                                  ;-813 int getlex() { char c; char *p;
  7396                                  
  7397                                  
  7398                                  getlex: PROC
  7399                                  
  7400                                  ;-814 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7401                                  
  7402                                  ;Function : getlex, Number of local variables: 2
  7403                                  ;   # type sign width addr used name   list of local variables
  7404                                  ;  200 var sign byte   813 NULL c = bp-2
  7405                                  ;  201 ptr sign byte   813 NULL p = bp-4;
  7406 000032BD C8040000                 ENTER  4,0
  7407                                  .g1:
  7408 000032C1 E835D1                   call next
  7409 000032C4 8846FE                   mov [bp-2], al
  7410 000032C7 8A46FE                   mov al, [bp-2]
  7411 000032CA 3C00                     cmp al, 0
  7412 000032CC 0F850600                 jne .getlex363
  7413 000032D0 B80000                   mov ax, 0
  7414 000032D3 E9DA04                   jmp .retngetlex
  7415                                  .getlex363:
  7416 000032D6 8A46FE                   mov al, [bp-2]
  7417 000032D9 3C20                     cmp al, 32
  7418 000032DB 0F8F0200                 jg  .getlex364
  7419 000032DF EBE0                     jmp .g1
  7420                                  
  7421                                  ;-815   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7422                                  
  7423                                  .getlex364:
  7424 000032E1 8A46FE                   mov al, [bp-2]
  7425 000032E4 3C3D                     cmp al, 61
  7426 000032E6 0F851200                 jne .getlex365
  7427 000032EA A0[2300]                 mov al, [thechar]
  7428 000032ED 3C3D                     cmp al, 61
  7429 000032EF 0F850900                 jne .getlex366
  7430 000032F3 E803D1                   call next
  7431 000032F6 B82603                   mov ax, 806
  7432 000032F9 E9B404                   jmp .retngetlex
  7433                                  .getlex366:
  7434                                  
  7435                                  ;-816   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7436                                  
  7437                                  .getlex365:
  7438 000032FC 8A46FE                   mov al, [bp-2]
  7439 000032FF 3C21                     cmp al, 33
  7440 00003301 0F851200                 jne .getlex367
  7441 00003305 A0[2300]                 mov al, [thechar]
  7442 00003308 3C3D                     cmp al, 61
  7443 0000330A 0F850900                 jne .getlex368
  7444 0000330E E8E8D0                   call next
  7445 00003311 B82703                   mov ax, 807
  7446 00003314 E99904                   jmp .retngetlex
  7447                                  .getlex368:
  7448                                  
  7449                                  ;-817   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7450                                  
  7451                                  .getlex367:
  7452 00003317 8A46FE                   mov al, [bp-2]
  7453 0000331A 3C3C                     cmp al, 60
  7454 0000331C 0F851200                 jne .getlex369
  7455 00003320 A0[2300]                 mov al, [thechar]
  7456 00003323 3C3D                     cmp al, 61
  7457 00003325 0F850900                 jne .getlex370
  7458 00003329 E8CDD0                   call next
  7459 0000332C B83803                   mov ax, 824
  7460 0000332F E97E04                   jmp .retngetlex
  7461                                  .getlex370:
  7462                                  
  7463                                  ;-818   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  7464                                  
  7465                                  .getlex369:
  7466 00003332 8A46FE                   mov al, [bp-2]
  7467 00003335 3C3E                     cmp al, 62
  7468 00003337 0F851200                 jne .getlex371
  7469 0000333B A0[2300]                 mov al, [thechar]
  7470 0000333E 3C3D                     cmp al, 61
  7471 00003340 0F850900                 jne .getlex372
  7472 00003344 E8B2D0                   call next
  7473 00003347 B82B03                   mov ax, 811
  7474 0000334A E96304                   jmp .retngetlex
  7475                                  .getlex372:
  7476                                  
  7477                                  ;-819   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  7478                                  
  7479                                  .getlex371:
  7480 0000334D 8A46FE                   mov al, [bp-2]
  7481 00003350 3C3C                     cmp al, 60
  7482 00003352 0F851200                 jne .getlex373
  7483 00003356 A0[2300]                 mov al, [thechar]
  7484 00003359 3C3C                     cmp al, 60
  7485 0000335B 0F850900                 jne .getlex374
  7486 0000335F E897D0                   call next
  7487 00003362 B8D804                   mov ax, 1240
  7488 00003365 E94804                   jmp .retngetlex
  7489                                  .getlex374:
  7490                                  
  7491                                  ;-820   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  7492                                  
  7493                                  .getlex373:
  7494 00003368 8A46FE                   mov al, [bp-2]
  7495 0000336B 3C3E                     cmp al, 62
  7496 0000336D 0F851200                 jne .getlex375
  7497 00003371 A0[2300]                 mov al, [thechar]
  7498 00003374 3C3E                     cmp al, 62
  7499 00003376 0F850900                 jne .getlex376
  7500 0000337A E87CD0                   call next
  7501 0000337D B8D904                   mov ax, 1241
  7502 00003380 E92D04                   jmp .retngetlex
  7503                                  .getlex376:
  7504                                  
  7505                                  ;-821   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  7506                                  
  7507                                  .getlex375:
  7508 00003383 8A46FE                   mov al, [bp-2]
  7509 00003386 3C2B                     cmp al, 43
  7510 00003388 0F851200                 jne .getlex377
  7511 0000338C A0[2300]                 mov al, [thechar]
  7512 0000338F 3C2B                     cmp al, 43
  7513 00003391 0F850900                 jne .getlex378
  7514 00003395 E861D0                   call next
  7515 00003398 B8C304                   mov ax, 1219
  7516 0000339B E91204                   jmp .retngetlex
  7517                                  .getlex378:
  7518                                  
  7519                                  ;-822   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  7520                                  
  7521                                  .getlex377:
  7522 0000339E 8A46FE                   mov al, [bp-2]
  7523 000033A1 3C2D                     cmp al, 45
  7524 000033A3 0F851200                 jne .getlex379
  7525 000033A7 A0[2300]                 mov al, [thechar]
  7526 000033AA 3C2D                     cmp al, 45
  7527 000033AC 0F850900                 jne .getlex380
  7528 000033B0 E846D0                   call next
  7529 000033B3 B8C904                   mov ax, 1225
  7530 000033B6 E9F703                   jmp .retngetlex
  7531                                  .getlex380:
  7532                                  
  7533                                  ;-823   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  7534                                  
  7535                                  .getlex379:
  7536 000033B9 8A46FE                   mov al, [bp-2]
  7537 000033BC 3C2B                     cmp al, 43
  7538 000033BE 0F851200                 jne .getlex381
  7539 000033C2 A0[2300]                 mov al, [thechar]
  7540 000033C5 3C3D                     cmp al, 61
  7541 000033C7 0F850900                 jne .getlex382
  7542 000033CB E82BD0                   call next
  7543 000033CE B8CE04                   mov ax, 1230
  7544 000033D1 E9DC03                   jmp .retngetlex
  7545                                  .getlex382:
  7546                                  
  7547                                  ;-824   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  7548                                  
  7549                                  .getlex381:
  7550 000033D4 8A46FE                   mov al, [bp-2]
  7551 000033D7 3C2D                     cmp al, 45
  7552 000033D9 0F851200                 jne .getlex383
  7553 000033DD A0[2300]                 mov al, [thechar]
  7554 000033E0 3C3D                     cmp al, 61
  7555 000033E2 0F850900                 jne .getlex384
  7556 000033E6 E810D0                   call next
  7557 000033E9 B8CF04                   mov ax, 1231
  7558 000033EC E9C103                   jmp .retngetlex
  7559                                  .getlex384:
  7560                                  
  7561                                  ;-825   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  7562                                  
  7563                                  .getlex383:
  7564 000033EF 8A46FE                   mov al, [bp-2]
  7565 000033F2 3C26                     cmp al, 38
  7566 000033F4 0F851200                 jne .getlex385
  7567 000033F8 A0[2300]                 mov al, [thechar]
  7568 000033FB 3C3D                     cmp al, 61
  7569 000033FD 0F850900                 jne .getlex386
  7570 00003401 E8F5CF                   call next
  7571 00003404 B8D204                   mov ax, 1234
  7572 00003407 E9A603                   jmp .retngetlex
  7573                                  .getlex386:
  7574                                  
  7575                                  ;-826   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  7576                                  
  7577                                  .getlex385:
  7578 0000340A 8A46FE                   mov al, [bp-2]
  7579 0000340D 3C7C                     cmp al, 124
  7580 0000340F 0F851200                 jne .getlex387
  7581 00003413 A0[2300]                 mov al, [thechar]
  7582 00003416 3C3D                     cmp al, 61
  7583 00003418 0F850900                 jne .getlex388
  7584 0000341C E8DACF                   call next
  7585 0000341F B8D304                   mov ax, 1235
  7586 00003422 E98B03                   jmp .retngetlex
  7587                                  .getlex388:
  7588                                  
  7589                                  ;-827   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  7590                                  
  7591                                  .getlex387:
  7592 00003425 8A46FE                   mov al, [bp-2]
  7593 00003428 3C2A                     cmp al, 42
  7594 0000342A 0F851200                 jne .getlex389
  7595 0000342E A0[2300]                 mov al, [thechar]
  7596 00003431 3C3D                     cmp al, 61
  7597 00003433 0F850900                 jne .getlex390
  7598 00003437 E8BFCF                   call next
  7599 0000343A B8D004                   mov ax, 1232
  7600 0000343D E97003                   jmp .retngetlex
  7601                                  .getlex390:
  7602                                  
  7603                                  ;-828   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  7604                                  
  7605                                  .getlex389:
  7606 00003440 8A46FE                   mov al, [bp-2]
  7607 00003443 3C2F                     cmp al, 47
  7608 00003445 0F851200                 jne .getlex391
  7609 00003449 A0[2300]                 mov al, [thechar]
  7610 0000344C 3C3D                     cmp al, 61
  7611 0000344E 0F850900                 jne .getlex392
  7612 00003452 E8A4CF                   call next
  7613 00003455 B8D104                   mov ax, 1233
  7614 00003458 E95503                   jmp .retngetlex
  7615                                  .getlex392:
  7616                                  
  7617                                  ;-829   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  7618                                  
  7619                                  .getlex391:
  7620 0000345B 8A46FE                   mov al, byte [bp-2]
  7621 0000345E B400                     mov ah, 0
  7622 00003460 50                       push ax
  7623 00003461 68[B237]                 push getlex_0
  7624 00003464 E8D2CE                   call instr1
  7625 00003467 83C404                   add  sp, 4
  7626 0000346A 08C0                     or  al, al
  7627 0000346C 0F840600                 je .getlex393
  7628 00003470 8A46FE                   mov al, [bp-2]
  7629 00003473 E93A03                   jmp .retngetlex
  7630                                  
  7631                                  ;-830   if (c == '/') { if (thechar == '/') {
  7632                                  
  7633                                  .getlex393:
  7634 00003476 8A46FE                   mov al, [bp-2]
  7635 00003479 3C2F                     cmp al, 47
  7636 0000347B 0F852900                 jne .getlex394
  7637 0000347F A0[2300]                 mov al, [thechar]
  7638 00003482 3C2F                     cmp al, 47
  7639 00003484 0F852000                 jne .getlex395
  7640                                  
  7641                                  ;-831       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  7642                                  
  7643                                  .getlex396:
  7644 00003488 E86ECF                   call next
  7645 0000348B 8846FE                   mov [bp-2], al
  7646 0000348E 8A46FE                   mov al, byte [bp-2]
  7647 00003491 B400                     mov ah, 0
  7648 00003493 50                       push ax
  7649 00003494 E84108                   call ifEOL
  7650 00003497 83C402                   add  sp, 2
  7651 0000349A 3C00                     cmp al, 0
  7652 0000349C 0F850200                 jne .getlex397
  7653 000034A0 EBE6                     jmp .getlex396
  7654                                  .getlex397:
  7655 000034A2 E818FE                   call getlex
  7656 000034A5 E90803                   jmp .retngetlex
  7657                                  .getlex395:
  7658                                  
  7659                                  ;-832   if (c == '/') { if (thechar == '*') {
  7660                                  
  7661                                  .getlex394:
  7662 000034A8 8A46FE                   mov al, [bp-2]
  7663 000034AB 3C2F                     cmp al, 47
  7664 000034AD 0F853A00                 jne .getlex398
  7665 000034B1 A0[2300]                 mov al, [thechar]
  7666 000034B4 3C2A                     cmp al, 42
  7667 000034B6 0F852B00                 jne .getlex399
  7668                                  
  7669                                  ;-833       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  7670                                  
  7671                                  .g2:
  7672 000034BA E83CCF                   call next
  7673 000034BD 8846FE                   mov [bp-2], al
  7674 000034C0 8A46FE                   mov al, [bp-2]
  7675 000034C3 3C2A                     cmp al, 42
  7676 000034C5 0F840200                 je  .getlex400
  7677 000034C9 EBEF                     jmp .g2
  7678                                  .getlex400:
  7679 000034CB A0[2300]                 mov al, [thechar]
  7680 000034CE 3C2F                     cmp al, 47
  7681 000034D0 0F840200                 je  .getlex401
  7682 000034D4 EBE4                     jmp .g2
  7683                                  
  7684                                  ;-834       c=next(); return getlex(); } else  return '/'; }
  7685                                  
  7686                                  .getlex401:
  7687 000034D6 E820CF                   call next
  7688 000034D9 8846FE                   mov [bp-2], al
  7689 000034DC E8DEFD                   call getlex
  7690 000034DF E9CE02                   jmp .retngetlex
  7691 000034E2 E90600                   jmp .getlex402
  7692                                  .getlex399:
  7693 000034E5 B82F00                   mov ax, 47
  7694 000034E8 E9C502                   jmp .retngetlex
  7695                                  .getlex402:
  7696                                  
  7697                                  ;-835   if (c == '"') {getstring(c); return T_STRING;}
  7698                                  
  7699                                  .getlex398:
  7700 000034EB 8A46FE                   mov al, [bp-2]
  7701 000034EE 3C22                     cmp al, 34
  7702 000034F0 0F851200                 jne .getlex403
  7703 000034F4 8A46FE                   mov al, byte [bp-2]
  7704 000034F7 B400                     mov ah, 0
  7705 000034F9 50                       push ax
  7706 000034FA E88F06                   call getstring
  7707 000034FD 83C402                   add  sp, 2
  7708 00003500 B80201                   mov ax, 258
  7709 00003503 E9AA02                   jmp .retngetlex
  7710                                  
  7711                                  ;-836   if (digit(c)) { getdigit(c); return T_CONST; }
  7712                                  
  7713                                  .getlex403:
  7714 00003506 8A46FE                   mov al, byte [bp-2]
  7715 00003509 B400                     mov ah, 0
  7716 0000350B 50                       push ax
  7717 0000350C E8B2CC                   call digit
  7718 0000350F 83C402                   add  sp, 2
  7719 00003512 08C0                     or  al, al
  7720 00003514 0F841200                 je .getlex404
  7721 00003518 8A46FE                   mov al, byte [bp-2]
  7722 0000351B B400                     mov ah, 0
  7723 0000351D 50                       push ax
  7724 0000351E E87C03                   call getdigit
  7725 00003521 83C402                   add  sp, 2
  7726 00003524 B80101                   mov ax, 257
  7727 00003527 E98602                   jmp .retngetlex
  7728                                  
  7729                                  ;-837   if (c==39) { lexval=next();
  7730                                  
  7731                                  .getlex404:
  7732 0000352A 8A46FE                   mov al, [bp-2]
  7733 0000352D 3C27                     cmp al, 39
  7734 0000352F 0F854F00                 jne .getlex405
  7735 00003533 E8C3CE                   call next
  7736 00003536 A3[2C00]                 mov word [lexval], ax
  7737                                  
  7738                                  ;-838     if (lexval==92) {lexval=next();
  7739                                  
  7740 00003539 A1[2C00]                 mov ax, [lexval]
  7741 0000353C 83F85C                   cmp ax, 92
  7742 0000353F 0F853600                 jne .getlex406
  7743 00003543 E8B3CE                   call next
  7744 00003546 A3[2C00]                 mov word [lexval], ax
  7745                                  
  7746                                  ;-839       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  7747                                  
  7748 00003549 A1[2C00]                 mov ax, [lexval]
  7749 0000354C 83F86E                   cmp ax, 110
  7750 0000354F 0F850600                 jne .getlex407
  7751 00003553 B80A00                   mov ax, 10
  7752 00003556 A3[2C00]                 mov word [lexval], ax
  7753                                  .getlex407:
  7754 00003559 A1[2C00]                 mov ax, [lexval]
  7755 0000355C 83F874                   cmp ax, 116
  7756 0000355F 0F850600                 jne .getlex408
  7757 00003563 B80900                   mov ax, 9
  7758 00003566 A3[2C00]                 mov word [lexval], ax
  7759                                  
  7760                                  ;-840       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  7761                                  
  7762                                  .getlex408:
  7763 00003569 A1[2C00]                 mov ax, [lexval]
  7764 0000356C 83F830                   cmp ax, 48
  7765 0000356F 0F850600                 jne .getlex409
  7766 00003573 B80000                   mov ax, 0
  7767 00003576 A3[2C00]                 mov word [lexval], ax
  7768                                  .getlex409:
  7769                                  .getlex406:
  7770 00003579 E87DCE                   call next
  7771 0000357C B80101                   mov ax, 257
  7772 0000357F E92E02                   jmp .retngetlex
  7773                                  
  7774                                  ;-841   if (alnum(c)) {
  7775                                  
  7776                                  .getlex405:
  7777 00003582 8A46FE                   mov al, byte [bp-2]
  7778 00003585 B400                     mov ah, 0
  7779 00003587 50                       push ax
  7780 00003588 E860CC                   call alnum
  7781 0000358B 83C402                   add  sp, 2
  7782 0000358E 08C0                     or  al, al
  7783 00003590 0F841302                 je .getlex410
  7784                                  
  7785                                  ;-842     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  7786                                  
  7787 00003594 8D06BB69                 lea  ax, [symbol]
  7788 00003598 50                       push ax
  7789 00003599 8D066DDA                 lea  ax, [symboltemp]
  7790 0000359D 50                       push ax
  7791 0000359E E8AECC                   call strcpy
  7792 000035A1 83C404                   add  sp, 4
  7793 000035A4 B8BB69                   mov ax, symbol
  7794 000035A7 8946FC                   mov [bp-4], ax
  7795 000035AA 8A46FE                   mov al, [bp-2]
  7796 000035AD 8B5EFC                   mov  bx, [bp-4]
  7797 000035B0 8807                     mov  [bx], al
  7798 000035B2 FF46FC                   inc  word[bp-4]
  7799                                  
  7800                                  ;-843     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  7801                                  
  7802                                  .getlex411:
  7803 000035B5 A0[2300]                 mov al, byte [thechar]
  7804 000035B8 B400                     mov ah, 0
  7805 000035BA 50                       push ax
  7806 000035BB E82DCC                   call alnum
  7807 000035BE 83C402                   add  sp, 2
  7808 000035C1 08C0                     or  al, al
  7809 000035C3 0F841300                 je .getlex412
  7810 000035C7 E82FCE                   call next
  7811 000035CA 8846FE                   mov [bp-2], al
  7812 000035CD 8A46FE                   mov al, [bp-2]
  7813 000035D0 8B5EFC                   mov  bx, [bp-4]
  7814 000035D3 8807                     mov  [bx], al
  7815 000035D5 FF46FC                   inc  word[bp-4]
  7816                                  
  7817                                  ;-844       *p=0;
  7818                                  
  7819 000035D8 EBDB                     jmp .getlex411
  7820                                  .getlex412:
  7821 000035DA B80000                   mov ax, 0
  7822 000035DD 8B5EFC                   mov  bx, [bp-4]
  7823 000035E0 8807                     mov  [bx], al
  7824                                  
  7825                                  ;-845     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  7826                                  
  7827 000035E2 68[C837]                 push getlex_1
  7828 000035E5 8D06BB69                 lea  ax, [symbol]
  7829 000035E9 50                       push ax
  7830 000035EA E898CC                   call eqstr
  7831 000035ED 83C404                   add  sp, 4
  7832 000035F0 08C0                     or  al, al
  7833 000035F2 0F840600                 je .getlex413
  7834 000035F6 B81302                   mov ax, 531
  7835 000035F9 E9B401                   jmp .retngetlex
  7836                                  
  7837                                  ;-846     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  7838                                  
  7839                                  .getlex413:
  7840 000035FC 68[CF37]                 push getlex_2
  7841 000035FF 8D06BB69                 lea  ax, [symbol]
  7842 00003603 50                       push ax
  7843 00003604 E87ECC                   call eqstr
  7844 00003607 83C404                   add  sp, 4
  7845 0000360A 08C0                     or  al, al
  7846 0000360C 0F840600                 je .getlex414
  7847 00003610 B81402                   mov ax, 532
  7848 00003613 E99A01                   jmp .retngetlex
  7849                                  
  7850                                  ;-847     if (eqstr(symbol,"void"    )) return T_VOID;
  7851                                  
  7852                                  .getlex414:
  7853 00003616 68[D837]                 push getlex_3
  7854 00003619 8D06BB69                 lea  ax, [symbol]
  7855 0000361D 50                       push ax
  7856 0000361E E864CC                   call eqstr
  7857 00003621 83C404                   add  sp, 4
  7858 00003624 08C0                     or  al, al
  7859 00003626 0F840600                 je .getlex415
  7860 0000362A B81102                   mov ax, 529
  7861 0000362D E98001                   jmp .retngetlex
  7862                                  
  7863                                  ;-848     if (eqstr(symbol,"int"     )) return T_INT;
  7864                                  
  7865                                  .getlex415:
  7866 00003630 68[DD37]                 push getlex_4
  7867 00003633 8D06BB69                 lea  ax, [symbol]
  7868 00003637 50                       push ax
  7869 00003638 E84ACC                   call eqstr
  7870 0000363B 83C404                   add  sp, 4
  7871 0000363E 08C0                     or  al, al
  7872 00003640 0F840600                 je .getlex416
  7873 00003644 B80502                   mov ax, 517
  7874 00003647 E96601                   jmp .retngetlex
  7875                                  
  7876                                  ;-849     if (eqstr(symbol,"long"    )) return T_LONG;
  7877                                  
  7878                                  .getlex416:
  7879 0000364A 68[E137]                 push getlex_5
  7880 0000364D 8D06BB69                 lea  ax, [symbol]
  7881 00003651 50                       push ax
  7882 00003652 E830CC                   call eqstr
  7883 00003655 83C404                   add  sp, 4
  7884 00003658 08C0                     or  al, al
  7885 0000365A 0F840600                 je .getlex417
  7886 0000365E B81502                   mov ax, 533
  7887 00003661 E94C01                   jmp .retngetlex
  7888                                  
  7889                                  ;-850     if (eqstr(symbol,"char"    )) return T_CHAR;
  7890                                  
  7891                                  .getlex417:
  7892 00003664 68[E637]                 push getlex_6
  7893 00003667 8D06BB69                 lea  ax, [symbol]
  7894 0000366B 50                       push ax
  7895 0000366C E816CC                   call eqstr
  7896 0000366F 83C404                   add  sp, 4
  7897 00003672 08C0                     or  al, al
  7898 00003674 0F840600                 je .getlex418
  7899 00003678 B81202                   mov ax, 530
  7900 0000367B E93201                   jmp .retngetlex
  7901                                  
  7902                                  ;-851     if (eqstr(symbol,"asm"     )) return T_ASM;
  7903                                  
  7904                                  .getlex418:
  7905 0000367E 68[EB37]                 push getlex_7
  7906 00003681 8D06BB69                 lea  ax, [symbol]
  7907 00003685 50                       push ax
  7908 00003686 E8FCCB                   call eqstr
  7909 00003689 83C404                   add  sp, 4
  7910 0000368C 08C0                     or  al, al
  7911 0000368E 0F840600                 je .getlex419
  7912 00003692 B80602                   mov ax, 518
  7913 00003695 E91801                   jmp .retngetlex
  7914                                  
  7915                                  ;-852     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  7916                                  
  7917                                  .getlex419:
  7918 00003698 68[EF37]                 push getlex_8
  7919 0000369B 8D06BB69                 lea  ax, [symbol]
  7920 0000369F 50                       push ax
  7921 000036A0 E8E2CB                   call eqstr
  7922 000036A3 83C404                   add  sp, 4
  7923 000036A6 08C0                     or  al, al
  7924 000036A8 0F840600                 je .getlex420
  7925 000036AC B80702                   mov ax, 519
  7926 000036AF E9FE00                   jmp .retngetlex
  7927                                  
  7928                                  ;-853     if (eqstr(symbol,"__emit__")) return T_EMIT;
  7929                                  
  7930                                  .getlex420:
  7931 000036B2 68[F537]                 push getlex_9
  7932 000036B5 8D06BB69                 lea  ax, [symbol]
  7933 000036B9 50                       push ax
  7934 000036BA E8C8CB                   call eqstr
  7935 000036BD 83C404                   add  sp, 4
  7936 000036C0 08C0                     or  al, al
  7937 000036C2 0F840600                 je .getlex421
  7938 000036C6 B80802                   mov ax, 520
  7939 000036C9 E9E400                   jmp .retngetlex
  7940                                  
  7941                                  ;-854     if (eqstr(symbol,"return"  )) return T_RETURN;
  7942                                  
  7943                                  .getlex421:
  7944 000036CC 68[FE37]                 push getlex_10
  7945 000036CF 8D06BB69                 lea  ax, [symbol]
  7946 000036D3 50                       push ax
  7947 000036D4 E8AECB                   call eqstr
  7948 000036D7 83C404                   add  sp, 4
  7949 000036DA 08C0                     or  al, al
  7950 000036DC 0F840600                 je .getlex422
  7951 000036E0 B80002                   mov ax, 512
  7952 000036E3 E9CA00                   jmp .retngetlex
  7953                                  
  7954                                  ;-855     if (eqstr(symbol,"if"      )) return T_IF;
  7955                                  
  7956                                  .getlex422:
  7957 000036E6 68[0538]                 push getlex_11
  7958 000036E9 8D06BB69                 lea  ax, [symbol]
  7959 000036ED 50                       push ax
  7960 000036EE E894CB                   call eqstr
  7961 000036F1 83C404                   add  sp, 4
  7962 000036F4 08C0                     or  al, al
  7963 000036F6 0F840600                 je .getlex423
  7964 000036FA B80102                   mov ax, 513
  7965 000036FD E9B000                   jmp .retngetlex
  7966                                  
  7967                                  ;-856     if (eqstr(symbol,"else"    )) return T_ELSE;
  7968                                  
  7969                                  .getlex423:
  7970 00003700 68[0838]                 push getlex_12
  7971 00003703 8D06BB69                 lea  ax, [symbol]
  7972 00003707 50                       push ax
  7973 00003708 E87ACB                   call eqstr
  7974 0000370B 83C404                   add  sp, 4
  7975 0000370E 08C0                     or  al, al
  7976 00003710 0F840600                 je .getlex424
  7977 00003714 B80202                   mov ax, 514
  7978 00003717 E99600                   jmp .retngetlex
  7979                                  
  7980                                  ;-857     if (eqstr(symbol,"while"   )) return T_WHILE;
  7981                                  
  7982                                  .getlex424:
  7983 0000371A 68[0D38]                 push getlex_13
  7984 0000371D 8D06BB69                 lea  ax, [symbol]
  7985 00003721 50                       push ax
  7986 00003722 E860CB                   call eqstr
  7987 00003725 83C404                   add  sp, 4
  7988 00003728 08C0                     or  al, al
  7989 0000372A 0F840600                 je .getlex425
  7990 0000372E B80302                   mov ax, 515
  7991 00003731 E97C00                   jmp .retngetlex
  7992                                  
  7993                                  ;-858     if (eqstr(symbol,"do"      )) return T_DO;
  7994                                  
  7995                                  .getlex425:
  7996 00003734 68[1338]                 push getlex_14
  7997 00003737 8D06BB69                 lea  ax, [symbol]
  7998 0000373B 50                       push ax
  7999 0000373C E846CB                   call eqstr
  8000 0000373F 83C404                   add  sp, 4
  8001 00003742 08C0                     or  al, al
  8002 00003744 0F840600                 je .getlex426
  8003 00003748 B80402                   mov ax, 516
  8004 0000374B E96200                   jmp .retngetlex
  8005                                  
  8006                                  ;-859     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8007                                  
  8008                                  .getlex426:
  8009 0000374E 68[1638]                 push getlex_15
  8010 00003751 8D06BB69                 lea  ax, [symbol]
  8011 00003755 50                       push ax
  8012 00003756 E82CCB                   call eqstr
  8013 00003759 83C404                   add  sp, 4
  8014 0000375C 08C0                     or  al, al
  8015 0000375E 0F840600                 je .getlex427
  8016 00003762 B80902                   mov ax, 521
  8017 00003765 E94800                   jmp .retngetlex
  8018                                  
  8019                                  ;-860     if (eqstr(symbol,"define"  )) return T_DEFINE;
  8020                                  
  8021                                  .getlex427:
  8022 00003768 68[1B38]                 push getlex_16
  8023 0000376B 8D06BB69                 lea  ax, [symbol]
  8024 0000376F 50                       push ax
  8025 00003770 E812CB                   call eqstr
  8026 00003773 83C404                   add  sp, 4
  8027 00003776 08C0                     or  al, al
  8028 00003778 0F840600                 je .getlex428
  8029 0000377C B8FF01                   mov ax, 511
  8030 0000377F E92E00                   jmp .retngetlex
  8031                                  
  8032                                  ;-861     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8033                                  
  8034                                  .getlex428:
  8035 00003782 E8B700                   call convertdefine
  8036 00003785 08C0                     or  al, al
  8037 00003787 0F841600                 je .getlex429
  8038 0000378B 8D066DDA                 lea  ax, [symboltemp]
  8039 0000378F 50                       push ax
  8040 00003790 8D06BB69                 lea  ax, [symbol]
  8041 00003794 50                       push ax
  8042 00003795 E8B7CA                   call strcpy
  8043 00003798 83C404                   add  sp, 4
  8044 0000379B B80101                   mov ax, 257
  8045 0000379E E90F00                   jmp .retngetlex
  8046                                  
  8047                                  ;-862     return T_NAME; } error1("Input item not recognized"); }
  8048                                  
  8049                                  .getlex429:
  8050 000037A1 B80001                   mov ax, 256
  8051 000037A4 E90900                   jmp .retngetlex
  8052                                  .getlex410:
  8053 000037A7 68[2238]                 push getlex_17
  8054 000037AA E88705                   call error1
  8055 000037AD 83C402                   add  sp, 2
  8056                                  
  8057                                  ;-863 
  8058                                  
  8059                                  
  8060                                  ;-864 int convertdefine() { int i; int j;   i=0;
  8061                                  
  8062 000037B0 C9                       .retngetlex: LEAVE
  8063 000037B1 C3                       ret
  8064 000037B2 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8065 000037BB 3A252D3E3C3D2B2126-
  8066 000037C4 7C233F00           
  8067 000037C8 7369676E656400          getlex_1 db "signed",0
  8068 000037CF 756E7369676E656400      getlex_2 db "unsigned",0
  8069 000037D8 766F696400              getlex_3 db "void",0
  8070 000037DD 696E7400                getlex_4 db "int",0
  8071 000037E1 6C6F6E6700              getlex_5 db "long",0
  8072 000037E6 6368617200              getlex_6 db "char",0
  8073 000037EB 61736D00                getlex_7 db "asm",0
  8074 000037EF 5F5F61736D00            getlex_8 db "__asm",0
  8075 000037F5 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8076 000037FE 72657475726E00          getlex_10 db "return",0
  8077 00003805 696600                  getlex_11 db "if",0
  8078 00003808 656C736500              getlex_12 db "else",0
  8079 0000380D 7768696C6500            getlex_13 db "while",0
  8080 00003813 646F00                  getlex_14 db "do",0
  8081 00003816 676F746F00              getlex_15 db "goto",0
  8082 0000381B 646566696E6500          getlex_16 db "define",0
  8083 00003822 496E70757420697465-     getlex_17 db "Input item not recognized",0
  8084 0000382B 6D206E6F7420726563-
  8085 00003834 6F676E697A656400   
  8086                                  ENDP
  8087                                  
  8088                                  convertdefine: PROC
  8089                                  ;Function : convertdefine, Number of local variables: 2
  8090                                  ;   # type sign width addr used name   list of local variables
  8091                                  ;  200 var sign word   864 NULL i = bp-2
  8092                                  ;  201 var sign word   864 NULL j = bp-4;
  8093 0000383C C8040000                 ENTER  4,0
  8094 00003840 B80000                   mov ax, 0
  8095 00003843 8946FE                   mov [bp-2], ax
  8096                                  
  8097                                  ;-865   while (i < GTop) {
  8098                                  
  8099                                  .convertdefine430:
  8100 00003846 8B46FE                   mov ax, [bp-2]
  8101 00003849 3B06[3900]               cmp ax, [GTop]
  8102 0000384D 0F8D4400                 jge .convertdefine431
  8103                                  
  8104                                  ;-866    j=adrofname(i);
  8105                                  
  8106 00003851 FF76FE                   push word [bp-2]
  8107 00003854 E8CBD3                   call adrofname
  8108 00003857 83C402                   add  sp, 2
  8109 0000385A 8946FC                   mov [bp-4], ax
  8110                                  
  8111                                  ;-867    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8112                                  
  8113 0000385D FF76FC                   push word [bp-4]
  8114 00003860 8D06BB69                 lea  ax, [symbol]
  8115 00003864 50                       push ax
  8116 00003865 E81DCA                   call eqstr
  8117 00003868 83C404                   add  sp, 4
  8118 0000386B 08C0                     or  al, al
  8119 0000386D 0F841F00                 je .convertdefine432
  8120 00003871 8B5EFE                   mov bx, [bp-2]
  8121 00003874 8A87046B                 mov al, [GType + bx]
  8122 00003878 3C23                     cmp al, 35
  8123 0000387A 0F851200                 jne .convertdefine433
  8124 0000387E 8B5EFE                   mov bx, [bp-2]
  8125 00003881 D1E3                     shl bx, 1
  8126 00003883 8B873873                 mov ax, [GData + bx]
  8127 00003887 A3[2C00]                 mov word [lexval], ax
  8128                                  
  8129                                  ;-868    return T_CONST; } }
  8130                                  
  8131 0000388A B80101                   mov ax, 257
  8132 0000388D E90B00                   jmp .retnconvertdefine
  8133                                  .convertdefine433:
  8134                                  
  8135                                  ;-869    i++; }
  8136                                  
  8137                                  .convertdefine432:
  8138 00003890 FF46FE                   inc  word[bp-2]
  8139                                  
  8140                                  ;-870    return 0; }
  8141                                  
  8142 00003893 EBB1                     jmp .convertdefine430
  8143                                  .convertdefine431:
  8144 00003895 B80000                   mov ax, 0
  8145 00003898 E90000                   jmp .retnconvertdefine
  8146                                  
  8147                                  ;-871 
  8148                                  
  8149                                  
  8150                                  ;-872 int getdigit(char c) { int i;
  8151                                  
  8152 0000389B C9                       .retnconvertdefine: LEAVE
  8153 0000389C C3                       ret
  8154                                  ENDP
  8155                                  
  8156                                  getdigit: PROC
  8157                                  
  8158                                  ;-873     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8159                                  
  8160                                  ;Function : getdigit, Number of local variables: 2
  8161                                  ;   # type sign width addr used name   list of local variables
  8162                                  ;  200 var sign byte   872 NULL c = bp+4
  8163                                  ;  201 var sign word   872 NULL i = bp-2;
  8164 0000389D C8020000                 ENTER  2,0
  8165 000038A1 B80000                   mov ax, 0
  8166 000038A4 A3[2C00]                 mov word [lexval], ax
  8167 000038A7 8A4604                   mov al, [bp+4]
  8168 000038AA 2C30                     sub al, 48
  8169 000038AC A3[2C00]                 mov word [lexval], ax
  8170                                  
  8171                                  ;-874     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8172                                  
  8173 000038AF A0[2300]                 mov al, [thechar]
  8174 000038B2 3C78                     cmp al, 120
  8175 000038B4 0F850600                 jne .getdigit434
  8176 000038B8 B85800                   mov ax, 88
  8177 000038BB A2[2300]                 mov byte [thechar], al
  8178                                  .getdigit434:
  8179 000038BE A0[2300]                 mov al, [thechar]
  8180 000038C1 3C58                     cmp al, 88
  8181 000038C3 0F856800                 jne .getdigit435
  8182 000038C7 E82FCB                   call next
  8183                                  
  8184                                  ;-875       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8185                                  
  8186                                  .getdigit436:
  8187 000038CA A0[2300]                 mov al, byte [thechar]
  8188 000038CD B400                     mov ah, 0
  8189 000038CF 50                       push ax
  8190 000038D0 E818C9                   call alnum
  8191 000038D3 83C402                   add  sp, 2
  8192 000038D6 08C0                     or  al, al
  8193 000038D8 0F845000                 je .getdigit437
  8194 000038DC E81ACB                   call next
  8195 000038DF 884604                   mov [bp+4], al
  8196 000038E2 8A4604                   mov al, [bp+4]
  8197 000038E5 3C60                     cmp al, 96
  8198 000038E7 0F8E0800                 jle .getdigit438
  8199 000038EB 8A4604                   mov al, [bp+4]
  8200 000038EE 2C27                     sub al, 39
  8201 000038F0 884604                   mov [bp+4], al
  8202                                  
  8203                                  ;-876 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8204                                  
  8205                                  .getdigit438:
  8206 000038F3 8A4604                   mov al, [bp+4]
  8207 000038F6 3C40                     cmp al, 64
  8208 000038F8 0F8E0800                 jle .getdigit439
  8209 000038FC 8A4604                   mov al, [bp+4]
  8210 000038FF 2C07                     sub al, 7
  8211 00003901 884604                   mov [bp+4], al
  8212                                  .getdigit439:
  8213 00003904 8A4604                   mov al, [bp+4]
  8214 00003907 2C30                     sub al, 48
  8215 00003909 884604                   mov [bp+4], al
  8216 0000390C A1[2C00]                 mov ax, [lexval]
  8217 0000390F C1E004                   shl ax, 4
  8218 00003912 A3[2C00]                 mov word [lexval], ax
  8219                                  
  8220                                  ;-877      i=0; i=c; lexval=lexval+i;}
  8221                                  
  8222 00003915 B80000                   mov ax, 0
  8223 00003918 8946FE                   mov [bp-2], ax
  8224 0000391B 8A4604                   mov al, [bp+4]
  8225 0000391E 8946FE                   mov [bp-2], ax
  8226 00003921 A1[2C00]                 mov ax, [lexval]
  8227 00003924 0346FE                   add ax, [bp-2]
  8228 00003927 A3[2C00]                 mov word [lexval], ax
  8229                                  
  8230                                  ;-878     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  8231                                  
  8232 0000392A EB9E                     jmp .getdigit436
  8233                                  .getdigit437:
  8234 0000392C E94200                   jmp .getdigit440
  8235                                  .getdigit435:
  8236                                  .getdigit441:
  8237 0000392F A0[2300]                 mov al, byte [thechar]
  8238 00003932 B400                     mov ah, 0
  8239 00003934 50                       push ax
  8240 00003935 E889C8                   call digit
  8241 00003938 83C402                   add  sp, 2
  8242 0000393B 08C0                     or  al, al
  8243 0000393D 0F843000                 je .getdigit442
  8244 00003941 E8B5CA                   call next
  8245 00003944 884604                   mov [bp+4], al
  8246 00003947 8A4604                   mov al, [bp+4]
  8247 0000394A 2C30                     sub al, 48
  8248 0000394C 884604                   mov [bp+4], al
  8249 0000394F A1[2C00]                 mov ax, [lexval]
  8250 00003952 BB0A00                   mov bx, 10
  8251 00003955 F7E3                     mul bx
  8252 00003957 A3[2C00]                 mov word [lexval], ax
  8253                                  
  8254                                  ;-879      i=0; i=c; lexval=lexval+i; } }
  8255                                  
  8256 0000395A B80000                   mov ax, 0
  8257 0000395D 8946FE                   mov [bp-2], ax
  8258 00003960 8A4604                   mov al, [bp+4]
  8259 00003963 8946FE                   mov [bp-2], ax
  8260 00003966 A1[2C00]                 mov ax, [lexval]
  8261 00003969 0346FE                   add ax, [bp-2]
  8262 0000396C A3[2C00]                 mov word [lexval], ax
  8263 0000396F EBBE                     jmp .getdigit441
  8264                                  .getdigit442:
  8265                                  
  8266                                  ;-880 }
  8267                                  
  8268                                  .getdigit440:
  8269                                  
  8270                                  ;-881 
  8271                                  
  8272                                  
  8273                                  ;-882 int stmt() { int c; char cha;
  8274 00003971 C9                       LEAVE
  8275 00003972 C3                       ret
  8276                                  ENDP
  8277                                  
  8278                                  stmt: PROC
  8279                                  
  8280                                  ;-883        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  8281                                  
  8282                                  ;Function : stmt, Number of local variables: 2
  8283                                  ;   # type sign width addr used name   list of local variables
  8284                                  ;  200 var sign word   882 NULL c = bp-2
  8285                                  ;  201 var sign byte   882 NULL cha = bp-4;
  8286 00003973 C8040000                 ENTER  4,0
  8287 00003977 6A7B                     push 123
  8288 00003979 E89BCA                   call istoken
  8289 0000397C 83C402                   add  sp, 2
  8290 0000397F 08C0                     or  al, al
  8291 00003981 0F841700                 je .stmt443
  8292                                  .stmt444:
  8293 00003985 6A7D                     push 125
  8294 00003987 E88DCA                   call istoken
  8295 0000398A 83C402                   add  sp, 2
  8296 0000398D 83F800                   cmp ax, 0
  8297 00003990 0F850500                 jne .stmt445
  8298 00003994 E8DCFF                   call stmt
  8299 00003997 EBEC                     jmp .stmt444
  8300                                  .stmt445:
  8301                                  
  8302                                  ;-884   else if(istoken(T_IF))    doif();
  8303                                  
  8304 00003999 E9BA01                   jmp .stmt446
  8305                                  .stmt443:
  8306 0000399C 680102                   push 513
  8307 0000399F E875CA                   call istoken
  8308 000039A2 83C402                   add  sp, 2
  8309 000039A5 08C0                     or  al, al
  8310 000039A7 0F840600                 je .stmt447
  8311 000039AB E8B5F7                   call doif
  8312                                  
  8313                                  ;-885   else if(istoken(T_DO))    dodo();
  8314                                  
  8315 000039AE E9A501                   jmp .stmt448
  8316                                  .stmt447:
  8317 000039B1 680402                   push 516
  8318 000039B4 E860CA                   call istoken
  8319 000039B7 83C402                   add  sp, 2
  8320 000039BA 08C0                     or  al, al
  8321 000039BC 0F840600                 je .stmt449
  8322 000039C0 E802F8                   call dodo
  8323                                  
  8324                                  ;-886   else if(istoken(T_WHILE)) dowhile();
  8325                                  
  8326 000039C3 E99001                   jmp .stmt450
  8327                                  .stmt449:
  8328 000039C6 680302                   push 515
  8329 000039C9 E84BCA                   call istoken
  8330 000039CC 83C402                   add  sp, 2
  8331 000039CF 08C0                     or  al, al
  8332 000039D1 0F840600                 je .stmt451
  8333 000039D5 E83AF8                   call dowhile
  8334                                  
  8335                                  ;-887   else if(istoken(T_GOTO))  {
  8336                                  
  8337 000039D8 E97B01                   jmp .stmt452
  8338                                  .stmt451:
  8339 000039DB 680902                   push 521
  8340 000039DE E836CA                   call istoken
  8341 000039E1 83C402                   add  sp, 2
  8342 000039E4 08C0                     or  al, al
  8343 000039E6 0F842200                 je .stmt453
  8344                                  
  8345                                  ;-888     prs("\n jmp .");name1();prs(symbol);expect(';');}
  8346                                  
  8347 000039EA 68[583B]                 push stmt_0
  8348 000039ED E85CCB                   call prs
  8349 000039F0 83C402                   add  sp, 2
  8350 000039F3 E85BD4                   call name1
  8351 000039F6 8D06BB69                 lea  ax, [symbol]
  8352 000039FA 50                       push ax
  8353 000039FB E84ECB                   call prs
  8354 000039FE 83C402                   add  sp, 2
  8355 00003A01 6A3B                     push 59
  8356 00003A03 E833CA                   call expect
  8357 00003A06 83C402                   add  sp, 2
  8358                                  
  8359                                  ;-889   else if(token==T_ASM)     {prs("\n"); c=next();
  8360                                  
  8361 00003A09 E94A01                   jmp .stmt454
  8362                                  .stmt453:
  8363 00003A0C A1[1E00]                 mov ax, [token]
  8364 00003A0F 3D0602                   cmp ax, 518
  8365 00003A12 0F853300                 jne .stmt455
  8366 00003A16 68[613B]                 push stmt_1
  8367 00003A19 E830CB                   call prs
  8368 00003A1C 83C402                   add  sp, 2
  8369 00003A1F E8D7C9                   call next
  8370 00003A22 8946FE                   mov [bp-2], ax
  8371                                  
  8372                                  ;-890         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  8373                                  
  8374                                  .stmt456:
  8375 00003A25 8B46FE                   mov ax, [bp-2]
  8376 00003A28 83F80A                   cmp ax, 10
  8377 00003A2B 0F841100                 je  .stmt457
  8378 00003A2F FF76FE                   push word [bp-2]
  8379 00003A32 E8B0CA                   call prc
  8380 00003A35 83C402                   add  sp, 2
  8381 00003A38 E8BEC9                   call next
  8382 00003A3B 8946FE                   mov [bp-2], ax
  8383 00003A3E EBE5                     jmp .stmt456
  8384                                  .stmt457:
  8385 00003A40 E87AF8                   call getlex
  8386 00003A43 A3[1E00]                 mov word [token], ax
  8387                                  
  8388                                  ;-891   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  8389                                  
  8390 00003A46 E90D01                   jmp .stmt458
  8391                                  .stmt455:
  8392 00003A49 680702                   push 519
  8393 00003A4C E8C8C9                   call istoken
  8394 00003A4F 83C402                   add  sp, 2
  8395 00003A52 08C0                     or  al, al
  8396 00003A54 0F844B00                 je .stmt459
  8397 00003A58 A1[1E00]                 mov ax, [token]
  8398 00003A5B 83F87B                   cmp ax, 123
  8399 00003A5E 0F853500                 jne .stmt460
  8400 00003A62 68[643B]                 push stmt_2
  8401 00003A65 E8E4CA                   call prs
  8402 00003A68 83C402                   add  sp, 2
  8403 00003A6B E88BC9                   call next
  8404 00003A6E 8846FC                   mov [bp-4], al
  8405                                  
  8406                                  ;-892         while(cha!= '}') { prc(cha); cha=next(); }
  8407                                  
  8408                                  .stmt461:
  8409 00003A71 8A46FC                   mov al, [bp-4]
  8410 00003A74 3C7D                     cmp al, 125
  8411 00003A76 0F841400                 je  .stmt462
  8412 00003A7A 8A46FC                   mov al, byte [bp-4]
  8413 00003A7D B400                     mov ah, 0
  8414 00003A7F 50                       push ax
  8415 00003A80 E862CA                   call prc
  8416 00003A83 83C402                   add  sp, 2
  8417 00003A86 E870C9                   call next
  8418 00003A89 8846FC                   mov [bp-4], al
  8419                                  
  8420                                  ;-893         token=getlex(); }
  8421                                  
  8422 00003A8C EBE3                     jmp .stmt461
  8423                                  .stmt462:
  8424 00003A8E E82CF8                   call getlex
  8425 00003A91 A3[1E00]                 mov word [token], ax
  8426                                  
  8427                                  ;-894         else error1("Curly open expected");
  8428                                  
  8429 00003A94 E90900                   jmp .stmt463
  8430                                  .stmt460:
  8431 00003A97 68[673B]                 push stmt_3
  8432 00003A9A E89702                   call error1
  8433 00003A9D 83C402                   add  sp, 2
  8434                                  
  8435                                  ;-895         }
  8436                                  
  8437                                  .stmt463:
  8438                                  
  8439                                  ;-896   else if(istoken(T_EMIT))   doemit();
  8440                                  
  8441 00003AA0 E9B300                   jmp .stmt464
  8442                                  .stmt459:
  8443 00003AA3 680802                   push 520
  8444 00003AA6 E86EC9                   call istoken
  8445 00003AA9 83C402                   add  sp, 2
  8446 00003AAC 08C0                     or  al, al
  8447 00003AAE 0F840600                 je .stmt465
  8448 00003AB2 E8A0F4                   call doemit
  8449                                  
  8450                                  ;-897   else if(istoken(';'))      { }
  8451                                  
  8452 00003AB5 E99E00                   jmp .stmt466
  8453                                  .stmt465:
  8454 00003AB8 6A3B                     push 59
  8455 00003ABA E85AC9                   call istoken
  8456 00003ABD 83C402                   add  sp, 2
  8457 00003AC0 08C0                     or  al, al
  8458 00003AC2 0F840300                 je .stmt467
  8459                                  
  8460                                  ;-898   else if(istoken(T_RETURN)) {
  8461                                  
  8462 00003AC6 E98D00                   jmp .stmt468
  8463                                  .stmt467:
  8464 00003AC9 680002                   push 512
  8465 00003ACC E848C9                   call istoken
  8466 00003ACF 83C402                   add  sp, 2
  8467 00003AD2 08C0                     or  al, al
  8468 00003AD4 0F843500                 je .stmt469
  8469                                  
  8470                                  ;-899         if (token!=';') expr(0);
  8471                                  
  8472 00003AD8 A1[1E00]                 mov ax, [token]
  8473 00003ADB 83F83B                   cmp ax, 59
  8474 00003ADE 0F840800                 je  .stmt470
  8475 00003AE2 6A00                     push 0
  8476 00003AE4 E823E1                   call expr
  8477 00003AE7 83C402                   add  sp, 2
  8478                                  
  8479                                  ;-900         prs("\n jmp .retn");
  8480                                  
  8481                                  .stmt470:
  8482 00003AEA 68[7B3B]                 push stmt_4
  8483 00003AED E85CCA                   call prs
  8484 00003AF0 83C402                   add  sp, 2
  8485                                  
  8486                                  ;-901         prs(fname);
  8487                                  
  8488 00003AF3 8D063B6A                 lea  ax, [fname]
  8489 00003AF7 50                       push ax
  8490 00003AF8 E851CA                   call prs
  8491 00003AFB 83C402                   add  sp, 2
  8492                                  
  8493                                  ;-902         nreturn++;
  8494                                  
  8495 00003AFE FF06[2800]               inc  word[nreturn]
  8496                                  
  8497                                  ;-903         expect(';');
  8498                                  
  8499 00003B02 6A3B                     push 59
  8500 00003B04 E832C9                   call expect
  8501 00003B07 83C402                   add  sp, 2
  8502                                  
  8503                                  ;-904         }
  8504                                  
  8505                                  
  8506                                  ;-905   else if(thechar==':')      {
  8507                                  
  8508 00003B0A E94900                   jmp .stmt471
  8509                                  .stmt469:
  8510 00003B0D A0[2300]                 mov al, [thechar]
  8511 00003B10 3C3A                     cmp al, 58
  8512 00003B12 0F853000                 jne .stmt472
  8513                                  
  8514                                  ;-906         prs("\n."); // Label
  8515                                  
  8516 00003B16 68[883B]                 push stmt_5
  8517 00003B19 E830CA                   call prs
  8518 00003B1C 83C402                   add  sp, 2
  8519                                  
  8520                                  ;-907         prs(symbol); prc(':');
  8521                                  
  8522 00003B1F 8D06BB69                 lea  ax, [symbol]
  8523 00003B23 50                       push ax
  8524 00003B24 E825CA                   call prs
  8525 00003B27 83C402                   add  sp, 2
  8526 00003B2A 6A3A                     push 58
  8527 00003B2C E8B6C9                   call prc
  8528 00003B2F 83C402                   add  sp, 2
  8529                                  
  8530                                  ;-908         expect(T_NAME);
  8531                                  
  8532 00003B32 680001                   push 256
  8533 00003B35 E801C9                   call expect
  8534 00003B38 83C402                   add  sp, 2
  8535                                  
  8536                                  ;-909         expect(':');
  8537                                  
  8538 00003B3B 6A3A                     push 58
  8539 00003B3D E8F9C8                   call expect
  8540 00003B40 83C402                   add  sp, 2
  8541                                  
  8542                                  ;-910         }
  8543                                  
  8544                                  
  8545                                  ;-911   else  {expr(0);; expect(';'); }
  8546                                  
  8547 00003B43 E91000                   jmp .stmt473
  8548                                  .stmt472:
  8549 00003B46 6A00                     push 0
  8550 00003B48 E8BFE0                   call expr
  8551 00003B4B 83C402                   add  sp, 2
  8552 00003B4E 6A3B                     push 59
  8553 00003B50 E8E6C8                   call expect
  8554 00003B53 83C402                   add  sp, 2
  8555                                  
  8556                                  ;-912 }
  8557                                  
  8558                                  .stmt473:
  8559                                  .stmt471:
  8560                                  .stmt468:
  8561                                  .stmt466:
  8562                                  .stmt464:
  8563                                  .stmt458:
  8564                                  .stmt454:
  8565                                  .stmt452:
  8566                                  .stmt450:
  8567                                  .stmt448:
  8568                                  .stmt446:
  8569                                  
  8570                                  ;-913 
  8571                                  
  8572                                  
  8573                                  ;-914 int getstring(int delim) {
  8574 00003B56 C9                       LEAVE
  8575 00003B57 C3                       ret
  8576 00003B58 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  8577 00003B61 5C6E00                  stmt_1 db "\n",0
  8578 00003B64 5C6E00                  stmt_2 db "\n",0
  8579 00003B67 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  8580 00003B70 6E2065787065637465-
  8581 00003B79 6400               
  8582 00003B7B 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  8583 00003B84 65746E00           
  8584 00003B88 5C6E2E00                stmt_5 db "\n.",0
  8585                                  ENDP
  8586                                  
  8587                                  getstring: PROC
  8588                                  
  8589                                  ;-915     int c; char *p;
  8590                                  
  8591                                  
  8592                                  ;-916     p=&symbol;
  8593                                  
  8594                                  ;Function : getstring, Number of local variables: 3
  8595                                  ;   # type sign width addr used name   list of local variables
  8596                                  ;  200 var sign word   914 NULL delim = bp+4
  8597                                  ;  201 var sign word   915 NULL c = bp-2
  8598                                  ;  202 ptr sign byte   915 NULL p = bp-4;
  8599 00003B8C C8040000                 ENTER  4,0
  8600 00003B90 B8BB69                   mov ax, symbol
  8601 00003B93 8946FC                   mov [bp-4], ax
  8602                                  
  8603                                  ;-917     c=next();
  8604                                  
  8605 00003B96 E860C8                   call next
  8606 00003B99 8946FE                   mov [bp-2], ax
  8607                                  
  8608                                  ;-918     while (c != delim) {
  8609                                  
  8610                                  .getstring474:
  8611 00003B9C 8B46FE                   mov ax, [bp-2]
  8612 00003B9F 3B4604                   cmp ax, [bp+4]
  8613 00003BA2 0F841300                 je  .getstring475
  8614                                  
  8615                                  ;-919         *p=c;
  8616                                  
  8617 00003BA6 8B46FE                   mov ax, [bp-2]
  8618 00003BA9 8B5EFC                   mov  bx, [bp-4]
  8619 00003BAC 8807                     mov  [bx], al
  8620                                  
  8621                                  ;-920         p++;
  8622                                  
  8623 00003BAE FF46FC                   inc  word[bp-4]
  8624                                  
  8625                                  ;-921         c=next();
  8626                                  
  8627 00003BB1 E845C8                   call next
  8628 00003BB4 8946FE                   mov [bp-2], ax
  8629                                  
  8630                                  ;-922     }
  8631                                  
  8632                                  
  8633                                  ;-923     *p=0;
  8634                                  
  8635 00003BB7 EBE3                     jmp .getstring474
  8636                                  .getstring475:
  8637 00003BB9 B80000                   mov ax, 0
  8638 00003BBC 8B5EFC                   mov  bx, [bp-4]
  8639 00003BBF 8807                     mov  [bx], al
  8640                                  
  8641                                  ;-924 }
  8642                                  
  8643                                  
  8644                                  ;-925 
  8645                                  
  8646                                  
  8647                                  ;-926 int fgets1() {
  8648 00003BC1 C9                       LEAVE
  8649 00003BC2 C3                       ret
  8650                                  ENDP
  8651                                  
  8652                                  fgets1: PROC
  8653                                  
  8654                                  ;-927     char c;
  8655                                  
  8656                                  
  8657                                  ;-928     c=*fgetsp;
  8658                                  
  8659                                  ;Function : fgets1, Number of local variables: 1
  8660                                  ;   # type sign width addr used name   list of local variables
  8661                                  ;  200 var sign byte   927 NULL c = bp-2;
  8662 00003BC3 C8020000                 ENTER  2,0
  8663 00003BC7 8B1E[6600]               mov bx, [fgetsp]
  8664 00003BCB 8A07                     mov al, [bx]
  8665 00003BCD B400                     mov ah, 0
  8666 00003BCF 8846FE                   mov [bp-2], al
  8667                                  
  8668                                  ;-929     if (c==0) {
  8669                                  
  8670 00003BD2 8A46FE                   mov al, [bp-2]
  8671 00003BD5 3C00                     cmp al, 0
  8672 00003BD7 0F852A00                 jne .fgets1476
  8673                                  
  8674                                  ;-930         printinputline();
  8675                                  
  8676 00003BDB E83700                   call printinputline
  8677                                  
  8678                                  ;-931         if (DOS_NoBytes == 0) return 0;
  8679                                  
  8680 00003BDE A1[7400]                 mov ax, [DOS_NoBytes]
  8681 00003BE1 83F800                   cmp ax, 0
  8682 00003BE4 0F850600                 jne .fgets1477
  8683 00003BE8 B80000                   mov ax, 0
  8684 00003BEB E92500                   jmp .retnfgets1
  8685                                  
  8686                                  ;-932         fgetsp=&fgetsdest;
  8687                                  
  8688                                  .fgets1477:
  8689 00003BEE B8A0D9                   mov ax, fgetsdest
  8690 00003BF1 A3[6600]                 mov word [fgetsp], ax
  8691                                  
  8692                                  ;-933         c=*fgetsp;
  8693                                  
  8694 00003BF4 8B1E[6600]               mov bx, [fgetsp]
  8695 00003BF8 8A07                     mov al, [bx]
  8696 00003BFA B400                     mov ah, 0
  8697 00003BFC 8846FE                   mov [bp-2], al
  8698                                  
  8699                                  ;-934         column=0;
  8700                                  
  8701 00003BFF B80000                   mov ax, 0
  8702 00003C02 A3[2100]                 mov word [column], ax
  8703                                  
  8704                                  ;-935     }
  8705                                  
  8706                                  
  8707                                  ;-936     fgetsp++;
  8708                                  
  8709                                  .fgets1476:
  8710 00003C05 FF06[6600]               inc  word[fgetsp]
  8711                                  
  8712                                  ;-937     column++;
  8713                                  
  8714 00003C09 FF06[2100]               inc  word[column]
  8715                                  
  8716                                  ;-938     return c;
  8717                                  
  8718 00003C0D 8A46FE                   mov al, [bp-2]
  8719 00003C10 E90000                   jmp .retnfgets1
  8720                                  
  8721                                  ;-939 }
  8722                                  
  8723                                  
  8724                                  ;-940 int printinputline() {
  8725                                  
  8726 00003C13 C9                       .retnfgets1: LEAVE
  8727 00003C14 C3                       ret
  8728                                  ENDP
  8729                                  
  8730                                  printinputline: PROC
  8731                                  
  8732                                  ;-941     int col;
  8733                                  
  8734                                  
  8735                                  ;-942     col=0;
  8736                                  
  8737                                  ;Function : printinputline, Number of local variables: 1
  8738                                  ;   # type sign width addr used name   list of local variables
  8739                                  ;  200 var sign word   941 NULL col = bp-2;
  8740 00003C15 C8020000                 ENTER  2,0
  8741 00003C19 B80000                   mov ax, 0
  8742 00003C1C 8946FE                   mov [bp-2], ax
  8743                                  
  8744                                  ;-943     fgetsp=&fgetsdest;
  8745                                  
  8746 00003C1F B8A0D9                   mov ax, fgetsdest
  8747 00003C22 A3[6600]                 mov word [fgetsp], ax
  8748                                  
  8749                                  ;-944     do {
  8750                                  
  8751                                  .printinputline478:
  8752                                  
  8753                                  ;-945         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  8754                                  
  8755 00003C25 6A01                     push 1
  8756 00003C27 FF36[1A00]               push word [fdin]
  8757 00003C2B 8D06[7600]               lea  ax, [DOS_ByteRead]
  8758 00003C2F 50                       push ax
  8759 00003C30 E8E6C4                   call readRL
  8760 00003C33 83C406                   add  sp, 6
  8761 00003C36 A3[7400]                 mov word [DOS_NoBytes], ax
  8762                                  
  8763                                  ;-946         if (DOS_NoBytes == 0) return;
  8764                                  
  8765 00003C39 A1[7400]                 mov ax, [DOS_NoBytes]
  8766 00003C3C 83F800                   cmp ax, 0
  8767 00003C3F 0F850300                 jne .printinputline479
  8768 00003C43 E96A00                   jmp .retnprintinputline
  8769                                  
  8770                                  ;-947         *fgetsp=DOS_ByteRead;
  8771                                  
  8772                                  .printinputline479:
  8773 00003C46 A0[7600]                 mov al, [DOS_ByteRead]
  8774 00003C49 8B1E[6600]               mov  bx, [fgetsp]
  8775 00003C4D 8807                     mov  [bx], al
  8776                                  
  8777                                  ;-948         fgetsp++;
  8778                                  
  8779 00003C4F FF06[6600]               inc  word[fgetsp]
  8780                                  
  8781                                  ;-949         col++;
  8782                                  
  8783 00003C53 FF46FE                   inc  word[bp-2]
  8784                                  
  8785                                  ;-950         if (col >80) error1("input line longer than 80 char");
  8786                                  
  8787 00003C56 8B46FE                   mov ax, [bp-2]
  8788 00003C59 83F850                   cmp ax, 80
  8789 00003C5C 0F8E0900                 jle .printinputline480
  8790 00003C60 68[B23C]                 push printinputline_0
  8791 00003C63 E8CE00                   call error1
  8792 00003C66 83C402                   add  sp, 2
  8793                                  
  8794                                  ;-951         }
  8795                                  
  8796                                  .printinputline480:
  8797                                  
  8798                                  ;-952         while (DOS_ByteRead != 10);
  8799                                  
  8800 00003C69 A0[7600]                 mov al, [DOS_ByteRead]
  8801 00003C6C 3C0A                     cmp al, 10
  8802 00003C6E 0F840200                 je  .printinputline481
  8803 00003C72 EBB1                     jmp .printinputline478
  8804                                  .printinputline481:
  8805                                  
  8806                                  ;-953     *fgetsp=0;
  8807                                  
  8808 00003C74 B80000                   mov ax, 0
  8809 00003C77 8B1E[6600]               mov  bx, [fgetsp]
  8810 00003C7B 8807                     mov  [bx], al
  8811                                  
  8812                                  ;-954     if (fdout) {
  8813                                  
  8814 00003C7D A1[1C00]                 mov ax, [fdout]
  8815 00003C80 08C0                     or  al, al
  8816 00003C82 0F842A00                 je .printinputline482
  8817                                  
  8818                                  ;-955         prs("\n\n;-");
  8819                                  
  8820 00003C86 68[D13C]                 push printinputline_1
  8821 00003C89 E8C0C8                   call prs
  8822 00003C8C 83C402                   add  sp, 2
  8823                                  
  8824                                  ;-956         prunsign1(lineno);
  8825                                  
  8826 00003C8F FF36[6A00]               push word [lineno]
  8827 00003C93 E80BCA                   call prunsign1
  8828 00003C96 83C402                   add  sp, 2
  8829                                  
  8830                                  ;-957         prc(' ');
  8831                                  
  8832 00003C99 6A20                     push 32
  8833 00003C9B E847C8                   call prc
  8834 00003C9E 83C402                   add  sp, 2
  8835                                  
  8836                                  ;-958         lineno++;
  8837                                  
  8838 00003CA1 FF06[6A00]               inc  word[lineno]
  8839                                  
  8840                                  ;-959         prscomment(&fgetsdest);
  8841                                  
  8842 00003CA5 8D06A0D9                 lea  ax, [fgetsdest]
  8843 00003CA9 50                       push ax
  8844 00003CAA E863C8                   call prscomment
  8845 00003CAD 83C402                   add  sp, 2
  8846                                  
  8847                                  ;-960         }
  8848                                  
  8849                                  
  8850                                  ;-961 }
  8851                                  
  8852                                  .printinputline482:
  8853                                  
  8854                                  ;-962 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  8855                                  
  8856 00003CB0 C9                       .retnprintinputline: LEAVE
  8857 00003CB1 C3                       ret
  8858 00003CB2 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  8859 00003CBB 65206C6F6E67657220-
  8860 00003CC4 7468616E2038302063-
  8861 00003CCD 68617200           
  8862 00003CD1 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  8863                                  ENDP
  8864                                  
  8865                                  ifEOL: PROC
  8866                                  
  8867                                  ;-963     if (c == 10) return 1;//LF
  8868                                  
  8869                                  ;Function : ifEOL, Number of local variables: 1
  8870                                  ;   # type sign width addr used name   list of local variables
  8871                                  ;  200 var sign byte   962 NULL c = bp+4;
  8872 00003CD8 C8000000                 ENTER  0,0
  8873 00003CDC 8A4604                   mov al, [bp+4]
  8874 00003CDF 3C0A                     cmp al, 10
  8875 00003CE1 0F850600                 jne .ifEOL483
  8876 00003CE5 B80100                   mov ax, 1
  8877 00003CE8 E92400                   jmp .retnifEOL
  8878                                  
  8879                                  ;-964     if (c == 13) {//CR
  8880                                  
  8881                                  .ifEOL483:
  8882 00003CEB 8A4604                   mov al, [bp+4]
  8883 00003CEE 3C0D                     cmp al, 13
  8884 00003CF0 0F851500                 jne .ifEOL484
  8885                                  
  8886                                  ;-965         if (thechar == 10) c=next();
  8887                                  
  8888 00003CF4 A0[2300]                 mov al, [thechar]
  8889 00003CF7 3C0A                     cmp al, 10
  8890 00003CF9 0F850600                 jne .ifEOL485
  8891 00003CFD E8F9C6                   call next
  8892 00003D00 884604                   mov [bp+4], al
  8893                                  
  8894                                  ;-966         return 1;
  8895                                  
  8896                                  .ifEOL485:
  8897 00003D03 B80100                   mov ax, 1
  8898 00003D06 E90600                   jmp .retnifEOL
  8899                                  
  8900                                  ;-967     }
  8901                                  
  8902                                  
  8903                                  ;-968     return 0;
  8904                                  
  8905                                  .ifEOL484:
  8906 00003D09 B80000                   mov ax, 0
  8907 00003D0C E90000                   jmp .retnifEOL
  8908                                  
  8909                                  ;-969 }
  8910                                  
  8911                                  
  8912                                  ;-970 
  8913                                  
  8914                                  
  8915                                  ;-971 int end1(int n) {
  8916                                  
  8917 00003D0F C9                       .retnifEOL: LEAVE
  8918 00003D10 C3                       ret
  8919                                  ENDP
  8920                                  
  8921                                  end1: PROC
  8922                                  
  8923                                  ;-972     fcloseR(fdin);
  8924                                  
  8925                                  ;Function : end1, Number of local variables: 1
  8926                                  ;   # type sign width addr used name   list of local variables
  8927                                  ;  200 var sign word   971 NULL n = bp+4;
  8928 00003D11 C8000000                 ENTER  0,0
  8929 00003D15 FF36[1A00]               push word [fdin]
  8930 00003D19 E8E0C3                   call fcloseR
  8931 00003D1C 83C402                   add  sp, 2
  8932                                  
  8933                                  ;-973     fcloseR(fdout);
  8934                                  
  8935 00003D1F FF36[1C00]               push word [fdout]
  8936 00003D23 E8D6C3                   call fcloseR
  8937 00003D26 83C402                   add  sp, 2
  8938                                  
  8939                                  ;-974     exitR(n);
  8940                                  
  8941 00003D29 FF7604                   push word [bp+4]
  8942 00003D2C E8DCC3                   call exitR
  8943 00003D2F 83C402                   add  sp, 2
  8944                                  
  8945                                  ;-975 }
  8946                                  
  8947                                  
  8948                                  ;-976 int error1(char *s) {
  8949 00003D32 C9                       LEAVE
  8950 00003D33 C3                       ret
  8951                                  ENDP
  8952                                  
  8953                                  error1: PROC
  8954                                  
  8955                                  ;-977     lineno--;
  8956                                  
  8957                                  ;Function : error1, Number of local variables: 1
  8958                                  ;   # type sign width addr used name   list of local variables
  8959                                  ;  200 ptr sign byte   976 NULL s = bp+4;
  8960 00003D34 C8000000                 ENTER  0,0
  8961 00003D38 FF0E[6A00]               dec  word[lineno]
  8962                                  
  8963                                  ;-978     prnl();
  8964                                  
  8965 00003D3C E8FFC7                   call prnl
  8966                                  
  8967                                  ;-979     prscomment(&fgetsdest);
  8968                                  
  8969 00003D3F 8D06A0D9                 lea  ax, [fgetsdest]
  8970 00003D43 50                       push ax
  8971 00003D44 E8C9C7                   call prscomment
  8972 00003D47 83C402                   add  sp, 2
  8973                                  
  8974                                  ;-980     prs(";Line: ");
  8975                                  
  8976 00003D4A 68[B33D]                 push error1_0
  8977 00003D4D E8FCC7                   call prs
  8978 00003D50 83C402                   add  sp, 2
  8979                                  
  8980                                  ;-981     prunsign1(lineno);
  8981                                  
  8982 00003D53 FF36[6A00]               push word [lineno]
  8983 00003D57 E847C9                   call prunsign1
  8984 00003D5A 83C402                   add  sp, 2
  8985                                  
  8986                                  ;-982     prs(" ************** ERROR: ");
  8987                                  
  8988 00003D5D 68[BB3D]                 push error1_1
  8989 00003D60 E8E9C7                   call prs
  8990 00003D63 83C402                   add  sp, 2
  8991                                  
  8992                                  ;-983     prs(s);
  8993                                  
  8994 00003D66 FF7604                   push word [bp+4]
  8995 00003D69 E8E0C7                   call prs
  8996 00003D6C 83C402                   add  sp, 2
  8997                                  
  8998                                  ;-984     prs("  in column: ");
  8999                                  
  9000 00003D6F 68[D33D]                 push error1_2
  9001 00003D72 E8D7C7                   call prs
  9002 00003D75 83C402                   add  sp, 2
  9003                                  
  9004                                  ;-985     prunsign1(column);
  9005                                  
  9006 00003D78 FF36[2100]               push word [column]
  9007 00003D7C E822C9                   call prunsign1
  9008 00003D7F 83C402                   add  sp, 2
  9009                                  
  9010                                  ;-986     prs("\nToken: ");
  9011                                  
  9012 00003D82 68[E13D]                 push error1_3
  9013 00003D85 E8C4C7                   call prs
  9014 00003D88 83C402                   add  sp, 2
  9015                                  
  9016                                  ;-987     prunsign1(token);
  9017                                  
  9018 00003D8B FF36[1E00]               push word [token]
  9019 00003D8F E80FC9                   call prunsign1
  9020 00003D92 83C402                   add  sp, 2
  9021                                  
  9022                                  ;-988 //    prs(", globC: ");
  9023                                  
  9024                                  
  9025                                  ;-989 //    prc(globC);
  9026                                  
  9027                                  
  9028                                  ;-990 //    prs(", thechar: ");
  9029                                  
  9030                                  
  9031                                  ;-991 //    prunsign1(thechar);
  9032                                  
  9033                                  
  9034                                  ;-992     prs(", symbol: ");
  9035                                  
  9036 00003D95 68[EB3D]                 push error1_4
  9037 00003D98 E8B1C7                   call prs
  9038 00003D9B 83C402                   add  sp, 2
  9039                                  
  9040                                  ;-993     prs(symbol);
  9041                                  
  9042 00003D9E 8D06BB69                 lea  ax, [symbol]
  9043 00003DA2 50                       push ax
  9044 00003DA3 E8A6C7                   call prs
  9045 00003DA6 83C402                   add  sp, 2
  9046                                  
  9047                                  ;-994     end1(1);
  9048                                  
  9049 00003DA9 6A01                     push 1
  9050 00003DAB E863FF                   call end1
  9051 00003DAE 83C402                   add  sp, 2
  9052                                  
  9053                                  ;-995 }
  9054                                  
  9055                                  
  9056                                  ;-996 int listproc() {
  9057 00003DB1 C9                       LEAVE
  9058 00003DB2 C3                       ret
  9059 00003DB3 3B4C696E653A2000        error1_0 db ";Line: ",0
  9060 00003DBB 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9061 00003DC4 2A2A2A2A2A2A204552-
  9062 00003DCD 524F523A2000       
  9063 00003DD3 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9064 00003DDC 6D6E3A2000         
  9065 00003DE1 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9066 00003DEA 00                 
  9067 00003DEB 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  9068 00003DF4 2000               
  9069                                  ENDP
  9070                                  
  9071                                  listproc: PROC
  9072                                  
  9073                                  ;-997     int i;
  9074                                  
  9075                                  
  9076                                  ;-998     if (LTop > LSTART) {
  9077                                  
  9078                                  ;Function : listproc, Number of local variables: 1
  9079                                  ;   # type sign width addr used name   list of local variables
  9080                                  ;  200 var sign word   997 NULL i = bp-2;
  9081 00003DF6 C8020000                 ENTER  2,0
  9082 00003DFA A1[3B00]                 mov ax, [LTop]
  9083 00003DFD 3DC800                   cmp ax, 200
  9084 00003E00 0F8E6000                 jle .listproc486
  9085                                  
  9086                                  ;-999         prs("\n;Function : "); prs(fname);
  9087                                  
  9088 00003E04 68[663E]                 push listproc_0
  9089 00003E07 E842C7                   call prs
  9090 00003E0A 83C402                   add  sp, 2
  9091 00003E0D 8D063B6A                 lea  ax, [fname]
  9092 00003E11 50                       push ax
  9093 00003E12 E837C7                   call prs
  9094 00003E15 83C402                   add  sp, 2
  9095                                  
  9096                                  ;-1000         prs(", Number of local variables: ");
  9097                                  
  9098 00003E18 68[753E]                 push listproc_1
  9099 00003E1B E82EC7                   call prs
  9100 00003E1E 83C402                   add  sp, 2
  9101                                  
  9102                                  ;-1001         i=LTop - LSTART;
  9103                                  
  9104 00003E21 A1[3B00]                 mov ax, [LTop]
  9105 00003E24 2DC800                   sub ax, 200
  9106 00003E27 8946FE                   mov [bp-2], ax
  9107                                  
  9108                                  ;-1002         prunsign1(i);
  9109                                  
  9110 00003E2A FF76FE                   push word [bp-2]
  9111 00003E2D E871C8                   call prunsign1
  9112 00003E30 83C402                   add  sp, 2
  9113                                  
  9114                                  ;-1003         prs("\n;   # type sign width addr used name");
  9115                                  
  9116 00003E33 68[933E]                 push listproc_2
  9117 00003E36 E813C7                   call prs
  9118 00003E39 83C402                   add  sp, 2
  9119                                  
  9120                                  ;-1004         prs("   list of local variables");
  9121                                  
  9122 00003E3C 68[BA3E]                 push listproc_3
  9123 00003E3F E80AC7                   call prs
  9124 00003E42 83C402                   add  sp, 2
  9125                                  
  9126                                  ;-1005         i=LSTART;
  9127                                  
  9128 00003E45 B8C800                   mov ax, 200
  9129 00003E48 8946FE                   mov [bp-2], ax
  9130                                  
  9131                                  ;-1006         while (i < LTop) {
  9132                                  
  9133                                  .listproc487:
  9134 00003E4B 8B46FE                   mov ax, [bp-2]
  9135 00003E4E 3B06[3B00]               cmp ax, [LTop]
  9136 00003E52 0F8D0E00                 jge .listproc488
  9137                                  
  9138                                  ;-1007             listvar(i);
  9139                                  
  9140 00003E56 FF76FE                   push word [bp-2]
  9141 00003E59 E84703                   call listvar
  9142 00003E5C 83C402                   add  sp, 2
  9143                                  
  9144                                  ;-1008             i++;
  9145                                  
  9146 00003E5F FF46FE                   inc  word[bp-2]
  9147                                  
  9148                                  ;-1009             }
  9149                                  
  9150                                  
  9151                                  ;-1010         }
  9152                                  
  9153 00003E62 EBE7                     jmp .listproc487
  9154                                  .listproc488:
  9155                                  
  9156                                  ;-1011 }
  9157                                  
  9158                                  .listproc486:
  9159                                  
  9160                                  ;-1012 int listcall() {
  9161 00003E64 C9                       LEAVE
  9162 00003E65 C3                       ret
  9163 00003E66 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9164 00003E6F 6F6E203A2000       
  9165 00003E75 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9166 00003E7E 6F66206C6F63616C20-
  9167 00003E87 7661726961626C6573-
  9168 00003E90 3A2000             
  9169 00003E93 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name",0
  9170 00003E9C 797065207369676E20-
  9171 00003EA5 776964746820616464-
  9172 00003EAE 722075736564206E61-
  9173 00003EB7 6D6500             
  9174 00003EBA 2020206C697374206F-     listproc_3 db "   list of local variables",0
  9175 00003EC3 66206C6F63616C2076-
  9176 00003ECC 61726961626C657300 
  9177                                  ENDP
  9178                                  
  9179                                  listcall: PROC
  9180                                  
  9181                                  ;-1013     int i;
  9182                                  
  9183                                  
  9184                                  ;-1014     prs("\n\n;    #  addr name   list of CALLs\n");
  9185                                  
  9186                                  ;Function : listcall, Number of local variables: 1
  9187                                  ;   # type sign width addr used name   list of local variables
  9188                                  ;  200 var sign word  1013 NULL i = bp-2;
  9189 00003ED5 C8020000                 ENTER  2,0
  9190 00003ED9 68[033F]                 push listcall_0
  9191 00003EDC E86DC6                   call prs
  9192 00003EDF 83C402                   add  sp, 2
  9193                                  
  9194                                  ;-1015     i=0;
  9195                                  
  9196 00003EE2 B80000                   mov ax, 0
  9197 00003EE5 8946FE                   mov [bp-2], ax
  9198                                  
  9199                                  ;-1016     while (i< CTop) {
  9200                                  
  9201                                  .listcall489:
  9202 00003EE8 8B46FE                   mov ax, [bp-2]
  9203 00003EEB 3B06[4300]               cmp ax, [CTop]
  9204 00003EEF 0F8D0E00                 jge .listcall490
  9205                                  
  9206                                  ;-1017         calllisting(i);
  9207                                  
  9208 00003EF3 FF76FE                   push word [bp-2]
  9209 00003EF6 E83200                   call calllisting
  9210 00003EF9 83C402                   add  sp, 2
  9211                                  
  9212                                  ;-1018         i++;
  9213                                  
  9214 00003EFC FF46FE                   inc  word[bp-2]
  9215                                  
  9216                                  ;-1019         }
  9217                                  
  9218                                  
  9219                                  ;-1020 }
  9220                                  
  9221 00003EFF EBE7                     jmp .listcall489
  9222                                  .listcall490:
  9223                                  
  9224                                  ;-1021 int calllisting(int i) {
  9225 00003F01 C9                       LEAVE
  9226 00003F02 C3                       ret
  9227 00003F03 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9228 00003F0C 23202061646472206E-
  9229 00003F15 616D652020206C6973-
  9230 00003F1E 74206F662043414C4C-
  9231 00003F27 735C6E00           
  9232                                  ENDP
  9233                                  
  9234                                  calllisting: PROC
  9235                                  
  9236                                  ;-1022     char c; int j;
  9237                                  
  9238                                  
  9239                                  ;-1023     prs("\n;");
  9240                                  
  9241                                  ;Function : calllisting, Number of local variables: 3
  9242                                  ;   # type sign width addr used name   list of local variables
  9243                                  ;  200 var sign word  1021 NULL i = bp+4
  9244                                  ;  201 var sign byte  1022 NULL c = bp-2
  9245                                  ;  202 var sign word  1022 NULL j = bp-4;
  9246 00003F2B C8040000                 ENTER  4,0
  9247 00003F2F 68[9D3F]                 push calllisting_0
  9248 00003F32 E817C6                   call prs
  9249 00003F35 83C402                   add  sp, 2
  9250                                  
  9251                                  ;-1024     printint51(i);
  9252                                  
  9253 00003F38 FF7604                   push word [bp+4]
  9254 00003F3B E8A7C7                   call printint51
  9255 00003F3E 83C402                   add  sp, 2
  9256                                  
  9257                                  ;-1025     prc(32);
  9258                                  
  9259 00003F41 6A20                     push 32
  9260 00003F43 E89FC5                   call prc
  9261 00003F46 83C402                   add  sp, 2
  9262                                  
  9263                                  ;-1026     c=CType [i];
  9264                                  
  9265 00003F49 8B5E04                   mov bx, [bp+4]
  9266 00003F4C 8A87ECA0                 mov al, [CType + bx]
  9267 00003F50 8846FE                   mov [bp-2], al
  9268                                  
  9269                                  ;-1027     if(c==0)prs("unresolved ");
  9270                                  
  9271 00003F53 8A46FE                   mov al, [bp-2]
  9272 00003F56 3C00                     cmp al, 0
  9273 00003F58 0F850900                 jne .calllisting491
  9274 00003F5C 68[A13F]                 push calllisting_1
  9275 00003F5F E8EAC5                   call prs
  9276 00003F62 83C402                   add  sp, 2
  9277                                  
  9278                                  ;-1028     j=CAdr[i];
  9279                                  
  9280                                  .calllisting491:
  9281 00003F65 8B5E04                   mov bx, [bp+4]
  9282 00003F68 D1E3                     shl bx, 1
  9283 00003F6A 8B87C8A6                 mov ax, [CAdr + bx]
  9284 00003F6E 8946FC                   mov [bp-4], ax
  9285                                  
  9286                                  ;-1029     printint51(j);
  9287                                  
  9288 00003F71 FF76FC                   push word [bp-4]
  9289 00003F74 E86EC7                   call printint51
  9290 00003F77 83C402                   add  sp, 2
  9291                                  
  9292                                  ;-1030     prc(32);
  9293                                  
  9294 00003F7A 6A20                     push 32
  9295 00003F7C E866C5                   call prc
  9296 00003F7F 83C402                   add  sp, 2
  9297                                  
  9298                                  ;-1031     from_far(NameA, j);
  9299                                  
  9300 00003F82 FF76FC                   push word [bp-4]
  9301 00003F85 8D06[4500]               lea  ax, [NameA]
  9302 00003F89 50                       push ax
  9303 00003F8A E8FE0C                   call from_far
  9304 00003F8D 83C404                   add  sp, 4
  9305                                  
  9306                                  ;-1032     prs(NameA);
  9307                                  
  9308 00003F90 8D06[4500]               lea  ax, [NameA]
  9309 00003F94 50                       push ax
  9310 00003F95 E8B4C5                   call prs
  9311 00003F98 83C402                   add  sp, 2
  9312                                  
  9313                                  ;-1033 }
  9314                                  
  9315                                  
  9316                                  ;-1034 int countcalls(int f) {
  9317 00003F9B C9                       LEAVE
  9318 00003F9C C3                       ret
  9319 00003F9D 5C6E3B00                calllisting_0 db "\n;",0
  9320 00003FA1 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
  9321 00003FAA 642000             
  9322                                  ENDP
  9323                                  
  9324                                  countcalls: PROC
  9325                                  
  9326                                  ;-1035     unsigned int i;
  9327                                  
  9328                                  
  9329                                  ;-1036     pt=adrF(FNameField, f);
  9330                                  
  9331                                  ;Function : countcalls, Number of local variables: 2
  9332                                  ;   # type sign width addr used name   list of local variables
  9333                                  ;  200 var sign word  1034 NULL f = bp+4
  9334                                  ;  201 var unsg word  1035 NULL i = bp-2;
  9335 00003FAD C8020000                 ENTER  2,0
  9336 00003FB1 FF7604                   push word [bp+4]
  9337 00003FB4 8D062C8E                 lea  ax, [FNameField]
  9338 00003FB8 50                       push ax
  9339 00003FB9 E87ACC                   call adrF
  9340 00003FBC 83C404                   add  sp, 4
  9341 00003FBF A3[6E00]                 mov word [pt], ax
  9342                                  
  9343                                  ;-1037     i=0;
  9344                                  
  9345 00003FC2 B80000                   mov ax, 0
  9346 00003FC5 8946FE                   mov [bp-2], ax
  9347                                  
  9348                                  ;-1038     while (i < CTop) {
  9349                                  
  9350                                  .countcalls492:
  9351 00003FC8 8B46FE                   mov ax, [bp-2]
  9352 00003FCB 3B06[4300]               cmp ax, [CTop]
  9353 00003FCF 0F8D4A00                 jge .countcalls493
  9354                                  
  9355                                  ;-1039         p1=CAdr[i];
  9356                                  
  9357 00003FD3 8B5EFE                   mov bx, [bp-2]
  9358 00003FD6 D1E3                     shl bx, 1
  9359 00003FD8 8B87C8A6                 mov ax, [CAdr + bx]
  9360 00003FDC A3[7000]                 mov word [p1], ax
  9361                                  
  9362                                  ;-1040         from_far(NameA, p1);
  9363                                  
  9364 00003FDF FF36[7000]               push word [p1]
  9365 00003FE3 8D06[4500]               lea  ax, [NameA]
  9366 00003FE7 50                       push ax
  9367 00003FE8 E8A00C                   call from_far
  9368 00003FEB 83C404                   add  sp, 4
  9369                                  
  9370                                  ;-1041         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
  9371                                  
  9372 00003FEE 8D06[4500]               lea  ax, [NameA]
  9373 00003FF2 50                       push ax
  9374 00003FF3 FF36[6E00]               push word [pt]
  9375 00003FF7 E88BC2                   call eqstr
  9376 00003FFA 83C404                   add  sp, 4
  9377 00003FFD 08C0                     or  al, al
  9378 00003FFF 0F841500                 je .countcalls494
  9379 00004003 8B5E04                   mov bx, [bp+4]
  9380 00004006 D1E3                     shl bx, 1
  9381 00004008 8B87D48B                 mov ax, [FCalls + bx]
  9382 0000400C 83C001                   add ax, 1
  9383 0000400F 8B5E04                   mov bx, [bp+4]
  9384 00004012 D1E3                     shl bx, 1
  9385 00004014 8987D48B                 mov [FCalls+bx], ax
  9386                                  
  9387                                  ;-1042         i++;
  9388                                  
  9389                                  .countcalls494:
  9390 00004018 FF46FE                   inc  word[bp-2]
  9391                                  
  9392                                  ;-1043         }
  9393                                  
  9394                                  
  9395                                  ;-1044 }
  9396                                  
  9397 0000401B EBAB                     jmp .countcalls492
  9398                                  .countcalls493:
  9399                                  
  9400                                  ;-1045 int listfunc() {
  9401 0000401D C9                       LEAVE
  9402 0000401E C3                       ret
  9403                                  ENDP
  9404                                  
  9405                                  listfunc: PROC
  9406                                  
  9407                                  ;-1046     int i;
  9408                                  
  9409                                  
  9410                                  ;-1047     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
  9411                                  
  9412                                  ;Function : listfunc, Number of local variables: 1
  9413                                  ;   # type sign width addr used name   list of local variables
  9414                                  ;  200 var sign word  1046 NULL i = bp-2;
  9415 0000401F C8020000                 ENTER  2,0
  9416 00004023 68[6C40]                 push listfunc_0
  9417 00004026 E823C5                   call prs
  9418 00004029 83C402                   add  sp, 2
  9419                                  
  9420                                  ;-1048     i=0;
  9421                                  
  9422 0000402C B80000                   mov ax, 0
  9423 0000402F 8946FE                   mov [bp-2], ax
  9424                                  
  9425                                  ;-1049     while (i < FTop) {
  9426                                  
  9427                                  .listfunc495:
  9428 00004032 8B46FE                   mov ax, [bp-2]
  9429 00004035 3B06[3D00]               cmp ax, [FTop]
  9430 00004039 0F8D0E00                 jge .listfunc496
  9431                                  
  9432                                  ;-1050         countcalls (i);
  9433                                  
  9434 0000403D FF76FE                   push word [bp-2]
  9435 00004040 E86AFF                   call countcalls
  9436 00004043 83C402                   add  sp, 2
  9437                                  
  9438                                  ;-1051         i++;
  9439                                  
  9440 00004046 FF46FE                   inc  word[bp-2]
  9441                                  
  9442                                  ;-1052         }
  9443                                  
  9444                                  
  9445                                  ;-1053     i=0;
  9446                                  
  9447 00004049 EBE7                     jmp .listfunc495
  9448                                  .listfunc496:
  9449 0000404B B80000                   mov ax, 0
  9450 0000404E 8946FE                   mov [bp-2], ax
  9451                                  
  9452                                  ;-1054     while (i < FTop) {
  9453                                  
  9454                                  .listfunc497:
  9455 00004051 8B46FE                   mov ax, [bp-2]
  9456 00004054 3B06[3D00]               cmp ax, [FTop]
  9457 00004058 0F8D0E00                 jge .listfunc498
  9458                                  
  9459                                  ;-1055         funclisting(i);
  9460                                  
  9461 0000405C FF76FE                   push word [bp-2]
  9462 0000405F E84300                   call funclisting
  9463 00004062 83C402                   add  sp, 2
  9464                                  
  9465                                  ;-1056         i++;
  9466                                  
  9467 00004065 FF46FE                   inc  word[bp-2]
  9468                                  
  9469                                  ;-1057         }
  9470                                  
  9471                                  
  9472                                  ;-1058 }
  9473                                  
  9474 00004068 EBE7                     jmp .listfunc497
  9475                                  .listfunc498:
  9476                                  
  9477                                  ;-1059 int funclisting(int i) {
  9478 0000406A C9                       LEAVE
  9479 0000406B C3                       ret
  9480 0000406C 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
  9481 00004075 20232043616C6C7320-
  9482 0000407E 4C696E652057696474-
  9483 00004087 6820204E616D652020-
  9484 00004090 206C697374206F6620-
  9485 00004099 66756E6374696F6E73-
  9486 000040A2 5C6E00             
  9487                                  ENDP
  9488                                  
  9489                                  funclisting: PROC
  9490                                  
  9491                                  ;-1060     int j;  char c;
  9492                                  
  9493                                  
  9494                                  ;-1061     prs("\n;");    printint51(i);
  9495                                  
  9496                                  ;Function : funclisting, Number of local variables: 3
  9497                                  ;   # type sign width addr used name   list of local variables
  9498                                  ;  200 var sign word  1059 NULL i = bp+4
  9499                                  ;  201 var sign word  1060 NULL j = bp-2
  9500                                  ;  202 var sign byte  1060 NULL c = bp-4;
  9501 000040A5 C8040000                 ENTER  4,0
  9502 000040A9 68[8141]                 push funclisting_0
  9503 000040AC E89DC4                   call prs
  9504 000040AF 83C402                   add  sp, 2
  9505 000040B2 FF7604                   push word [bp+4]
  9506 000040B5 E82DC6                   call printint51
  9507 000040B8 83C402                   add  sp, 2
  9508                                  
  9509                                  ;-1062     j = FCalls[i];
  9510                                  
  9511 000040BB 8B5E04                   mov bx, [bp+4]
  9512 000040BE D1E3                     shl bx, 1
  9513 000040C0 8B87D48B                 mov ax, [FCalls + bx]
  9514 000040C4 8946FE                   mov [bp-2], ax
  9515                                  
  9516                                  ;-1063     if (j) printint51(j);
  9517                                  
  9518 000040C7 8B46FE                   mov ax, [bp-2]
  9519 000040CA 08C0                     or  al, al
  9520 000040CC 0F840C00                 je .funclisting499
  9521 000040D0 FF76FE                   push word [bp-2]
  9522 000040D3 E80FC6                   call printint51
  9523 000040D6 83C402                   add  sp, 2
  9524                                  
  9525                                  ;-1064         else prs(" NULL");
  9526                                  
  9527 000040D9 E90900                   jmp .funclisting500
  9528                                  .funclisting499:
  9529 000040DC 68[8541]                 push funclisting_1
  9530 000040DF E86AC4                   call prs
  9531 000040E2 83C402                   add  sp, 2
  9532                                  
  9533                                  ;-1065     j = FAdr[i];
  9534                                  
  9535                                  .funclisting500:
  9536 000040E5 8B5E04                   mov bx, [bp+4]
  9537 000040E8 D1E3                     shl bx, 1
  9538 000040EA 8B877C89                 mov ax, [FAdr + bx]
  9539 000040EE 8946FE                   mov [bp-2], ax
  9540                                  
  9541                                  ;-1066     printint51(j);
  9542                                  
  9543 000040F1 FF76FE                   push word [bp-2]
  9544 000040F4 E8EEC5                   call printint51
  9545 000040F7 83C402                   add  sp, 2
  9546                                  
  9547                                  ;-1067     prc(32);
  9548                                  
  9549 000040FA 6A20                     push 32
  9550 000040FC E8E6C3                   call prc
  9551 000040FF 83C402                   add  sp, 2
  9552                                  
  9553                                  ;-1068     c=FType[i];
  9554                                  
  9555 00004102 8B5E04                   mov bx, [bp+4]
  9556 00004105 8A875088                 mov al, [FType + bx]
  9557 00004109 8846FC                   mov [bp-4], al
  9558                                  
  9559                                  ;-1069     if(c=='V')prs("void " );
  9560                                  
  9561 0000410C 8A46FC                   mov al, [bp-4]
  9562 0000410F 3C56                     cmp al, 86
  9563 00004111 0F850900                 jne .funclisting501
  9564 00004115 68[8B41]                 push funclisting_2
  9565 00004118 E831C4                   call prs
  9566 0000411B 83C402                   add  sp, 2
  9567                                  
  9568                                  ;-1070     if(c=='B')prs("byte " );
  9569                                  
  9570                                  .funclisting501:
  9571 0000411E 8A46FC                   mov al, [bp-4]
  9572 00004121 3C42                     cmp al, 66
  9573 00004123 0F850900                 jne .funclisting502
  9574 00004127 68[9141]                 push funclisting_3
  9575 0000412A E81FC4                   call prs
  9576 0000412D 83C402                   add  sp, 2
  9577                                  
  9578                                  ;-1071     if(c=='W')prs("word " );
  9579                                  
  9580                                  .funclisting502:
  9581 00004130 8A46FC                   mov al, [bp-4]
  9582 00004133 3C57                     cmp al, 87
  9583 00004135 0F850900                 jne .funclisting503
  9584 00004139 68[9741]                 push funclisting_4
  9585 0000413C E80DC4                   call prs
  9586 0000413F 83C402                   add  sp, 2
  9587                                  
  9588                                  ;-1072     if(c=='D')prs("dwrd " );
  9589                                  
  9590                                  .funclisting503:
  9591 00004142 8A46FC                   mov al, [bp-4]
  9592 00004145 3C44                     cmp al, 68
  9593 00004147 0F850900                 jne .funclisting504
  9594 0000414B 68[9D41]                 push funclisting_5
  9595 0000414E E8FBC3                   call prs
  9596 00004151 83C402                   add  sp, 2
  9597                                  
  9598                                  ;-1073     prc(32); prc(32);
  9599                                  
  9600                                  .funclisting504:
  9601 00004154 6A20                     push 32
  9602 00004156 E88CC3                   call prc
  9603 00004159 83C402                   add  sp, 2
  9604 0000415C 6A20                     push 32
  9605 0000415E E884C3                   call prc
  9606 00004161 83C402                   add  sp, 2
  9607                                  
  9608                                  ;-1074     pt=adrF(FNameField, i);
  9609                                  
  9610 00004164 FF7604                   push word [bp+4]
  9611 00004167 8D062C8E                 lea  ax, [FNameField]
  9612 0000416B 50                       push ax
  9613 0000416C E8C7CA                   call adrF
  9614 0000416F 83C404                   add  sp, 4
  9615 00004172 A3[6E00]                 mov word [pt], ax
  9616                                  
  9617                                  ;-1075     prs(pt);
  9618                                  
  9619 00004175 FF36[6E00]               push word [pt]
  9620 00004179 E8D0C3                   call prs
  9621 0000417C 83C402                   add  sp, 2
  9622                                  
  9623                                  ;-1076 }
  9624                                  
  9625                                  
  9626                                  ;-1077 
  9627                                  
  9628                                  
  9629                                  ;-1078 int listvar(unsigned int i) {
  9630 0000417F C9                       LEAVE
  9631 00004180 C3                       ret
  9632 00004181 5C6E3B00                funclisting_0 db "\n;",0
  9633 00004185 204E554C4C00            funclisting_1 db " NULL",0
  9634 0000418B 766F69642000            funclisting_2 db "void ",0
  9635 00004191 627974652000            funclisting_3 db "byte ",0
  9636 00004197 776F72642000            funclisting_4 db "word ",0
  9637 0000419D 647772642000            funclisting_5 db "dwrd ",0
  9638                                  ENDP
  9639                                  
  9640                                  listvar: PROC
  9641                                  
  9642                                  ;-1079     unsigned int j; char c;
  9643                                  
  9644                                  
  9645                                  ;-1080     prs("\n;"); printint51(i); prc(32);
  9646                                  
  9647                                  ;Function : listvar, Number of local variables: 3
  9648                                  ;   # type sign width addr used name   list of local variables
  9649                                  ;  200 var unsg word  1078 NULL i = bp+4
  9650                                  ;  201 var unsg word  1079 NULL j = bp-2
  9651                                  ;  202 var sign byte  1079 NULL c = bp-4;
  9652 000041A3 C8040000                 ENTER  4,0
  9653 000041A7 68[8F43]                 push listvar_0
  9654 000041AA E89FC3                   call prs
  9655 000041AD 83C402                   add  sp, 2
  9656 000041B0 FF7604                   push word [bp+4]
  9657 000041B3 E82FC5                   call printint51
  9658 000041B6 83C402                   add  sp, 2
  9659 000041B9 6A20                     push 32
  9660 000041BB E827C3                   call prc
  9661 000041BE 83C402                   add  sp, 2
  9662                                  
  9663                                  ;-1081     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9664                                  
  9665 000041C1 8B5E04                   mov bx, [bp+4]
  9666 000041C4 8A87046B                 mov al, [GType + bx]
  9667 000041C8 8846FC                   mov [bp-4], al
  9668 000041CB 8A46FC                   mov al, [bp-4]
  9669 000041CE 3C56                     cmp al, 86
  9670 000041D0 0F850900                 jne .listvar505
  9671 000041D4 68[9343]                 push listvar_1
  9672 000041D7 E872C3                   call prs
  9673 000041DA 83C402                   add  sp, 2
  9674                                  .listvar505:
  9675 000041DD 8A46FC                   mov al, [bp-4]
  9676 000041E0 3C2A                     cmp al, 42
  9677 000041E2 0F850900                 jne .listvar506
  9678 000041E6 68[9843]                 push listvar_2
  9679 000041E9 E860C3                   call prs
  9680 000041EC 83C402                   add  sp, 2
  9681                                  
  9682                                  ;-1082                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9683                                  
  9684                                  .listvar506:
  9685 000041EF 8A46FC                   mov al, [bp-4]
  9686 000041F2 3C26                     cmp al, 38
  9687 000041F4 0F850900                 jne .listvar507
  9688 000041F8 68[9D43]                 push listvar_3
  9689 000041FB E84EC3                   call prs
  9690 000041FE 83C402                   add  sp, 2
  9691                                  .listvar507:
  9692 00004201 8A46FC                   mov al, [bp-4]
  9693 00004204 3C23                     cmp al, 35
  9694 00004206 0F850900                 jne .listvar508
  9695 0000420A 68[A243]                 push listvar_4
  9696 0000420D E83CC3                   call prs
  9697 00004210 83C402                   add  sp, 2
  9698                                  
  9699                                  ;-1083     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9700                                  
  9701                                  .listvar508:
  9702 00004213 8B5E04                   mov bx, [bp+4]
  9703 00004216 8A87306C                 mov al, [GSign + bx]
  9704 0000421A 8846FC                   mov [bp-4], al
  9705 0000421D 8A46FC                   mov al, [bp-4]
  9706 00004220 3C53                     cmp al, 83
  9707 00004222 0F850900                 jne .listvar509
  9708 00004226 68[A743]                 push listvar_5
  9709 00004229 E820C3                   call prs
  9710 0000422C 83C402                   add  sp, 2
  9711                                  .listvar509:
  9712 0000422F 8A46FC                   mov al, [bp-4]
  9713 00004232 3C55                     cmp al, 85
  9714 00004234 0F850900                 jne .listvar510
  9715 00004238 68[AD43]                 push listvar_6
  9716 0000423B E80EC3                   call prs
  9717 0000423E 83C402                   add  sp, 2
  9718                                  
  9719                                  ;-1084     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9720                                  
  9721                                  .listvar510:
  9722 00004241 8B5E04                   mov bx, [bp+4]
  9723 00004244 8A875C6D                 mov al, [GWidth + bx]
  9724 00004248 8846FC                   mov [bp-4], al
  9725 0000424B 8A46FC                   mov al, [bp-4]
  9726 0000424E 3C01                     cmp al, 1
  9727 00004250 0F850900                 jne .listvar511
  9728 00004254 68[B343]                 push listvar_7
  9729 00004257 E8F2C2                   call prs
  9730 0000425A 83C402                   add  sp, 2
  9731                                  .listvar511:
  9732 0000425D 8A46FC                   mov al, [bp-4]
  9733 00004260 3C02                     cmp al, 2
  9734 00004262 0F850900                 jne .listvar512
  9735 00004266 68[B943]                 push listvar_8
  9736 00004269 E8E0C2                   call prs
  9737 0000426C 83C402                   add  sp, 2
  9738                                  
  9739                                  ;-1085                  if(c==  4)prs("dwrd " );
  9740                                  
  9741                                  .listvar512:
  9742 0000426F 8A46FC                   mov al, [bp-4]
  9743 00004272 3C04                     cmp al, 4
  9744 00004274 0F850900                 jne .listvar513
  9745 00004278 68[BF43]                 push listvar_9
  9746 0000427B E8CEC2                   call prs
  9747 0000427E 83C402                   add  sp, 2
  9748                                  
  9749                                  ;-1086     j=GAdr[i]; printint51(j);
  9750                                  
  9751                                  .listvar513:
  9752 00004281 8B5E04                   mov bx, [bp+4]
  9753 00004284 D1E3                     shl bx, 1
  9754 00004286 8B87886E                 mov ax, [GAdr + bx]
  9755 0000428A 8946FE                   mov [bp-2], ax
  9756 0000428D FF76FE                   push word [bp-2]
  9757 00004290 E852C4                   call printint51
  9758 00004293 83C402                   add  sp, 2
  9759                                  
  9760                                  ;-1087     j=GUsed[i];
  9761                                  
  9762 00004296 8B5E04                   mov bx, [bp+4]
  9763 00004299 D1E3                     shl bx, 1
  9764 0000429B 8B87E070                 mov ax, [GUsed + bx]
  9765 0000429F 8946FE                   mov [bp-2], ax
  9766                                  
  9767                                  ;-1088     if (j) printint51(j);
  9768                                  
  9769 000042A2 8B46FE                   mov ax, [bp-2]
  9770 000042A5 08C0                     or  al, al
  9771 000042A7 0F840C00                 je .listvar514
  9772 000042AB FF76FE                   push word [bp-2]
  9773 000042AE E834C4                   call printint51
  9774 000042B1 83C402                   add  sp, 2
  9775                                  
  9776                                  ;-1089     else {
  9777                                  
  9778 000042B4 E92200                   jmp .listvar515
  9779                                  .listvar514:
  9780                                  
  9781                                  ;-1090         if(GType[i]=='#') prs("    -");
  9782                                  
  9783 000042B7 8B5E04                   mov bx, [bp+4]
  9784 000042BA 8A87046B                 mov al, [GType + bx]
  9785 000042BE 3C23                     cmp al, 35
  9786 000042C0 0F850C00                 jne .listvar516
  9787 000042C4 68[C543]                 push listvar_10
  9788 000042C7 E882C2                   call prs
  9789 000042CA 83C402                   add  sp, 2
  9790                                  
  9791                                  ;-1091         else prs(" NULL");
  9792                                  
  9793 000042CD E90900                   jmp .listvar517
  9794                                  .listvar516:
  9795 000042D0 68[CB43]                 push listvar_11
  9796 000042D3 E876C2                   call prs
  9797 000042D6 83C402                   add  sp, 2
  9798                                  
  9799                                  ;-1092          }
  9800                                  
  9801                                  .listvar517:
  9802                                  
  9803                                  ;-1093     prc(32);
  9804                                  
  9805                                  .listvar515:
  9806 000042D9 6A20                     push 32
  9807 000042DB E807C2                   call prc
  9808 000042DE 83C402                   add  sp, 2
  9809                                  
  9810                                  ;-1094     pt=adrofname(i); prs(pt);
  9811                                  
  9812 000042E1 FF7604                   push word [bp+4]
  9813 000042E4 E83BC9                   call adrofname
  9814 000042E7 83C402                   add  sp, 2
  9815 000042EA A3[6E00]                 mov word [pt], ax
  9816 000042ED FF36[6E00]               push word [pt]
  9817 000042F1 E858C2                   call prs
  9818 000042F4 83C402                   add  sp, 2
  9819                                  
  9820                                  ;-1095     if(GType[i]=='#') {
  9821                                  
  9822 000042F7 8B5E04                   mov bx, [bp+4]
  9823 000042FA 8A87046B                 mov al, [GType + bx]
  9824 000042FE 3C23                     cmp al, 35
  9825 00004300 0F851D00                 jne .listvar518
  9826                                  
  9827                                  ;-1096         prc('=');
  9828                                  
  9829 00004304 6A3D                     push 61
  9830 00004306 E8DCC1                   call prc
  9831 00004309 83C402                   add  sp, 2
  9832                                  
  9833                                  ;-1097         j=GData[i];
  9834                                  
  9835 0000430C 8B5E04                   mov bx, [bp+4]
  9836 0000430F D1E3                     shl bx, 1
  9837 00004311 8B873873                 mov ax, [GData + bx]
  9838 00004315 8946FE                   mov [bp-2], ax
  9839                                  
  9840                                  ;-1098         prunsign1(j);
  9841                                  
  9842 00004318 FF76FE                   push word [bp-2]
  9843 0000431B E883C3                   call prunsign1
  9844 0000431E 83C402                   add  sp, 2
  9845                                  
  9846                                  ;-1099         }
  9847                                  
  9848                                  
  9849                                  ;-1100     if(GType[i]=='&') {
  9850                                  
  9851                                  .listvar518:
  9852 00004321 8B5E04                   mov bx, [bp+4]
  9853 00004324 8A87046B                 mov al, [GType + bx]
  9854 00004328 3C26                     cmp al, 38
  9855 0000432A 0F852500                 jne .listvar519
  9856                                  
  9857                                  ;-1101         prc('[');
  9858                                  
  9859 0000432E 6A5B                     push 91
  9860 00004330 E8B2C1                   call prc
  9861 00004333 83C402                   add  sp, 2
  9862                                  
  9863                                  ;-1102         j=GData[i];
  9864                                  
  9865 00004336 8B5E04                   mov bx, [bp+4]
  9866 00004339 D1E3                     shl bx, 1
  9867 0000433B 8B873873                 mov ax, [GData + bx]
  9868 0000433F 8946FE                   mov [bp-2], ax
  9869                                  
  9870                                  ;-1103         prunsign1(j);
  9871                                  
  9872 00004342 FF76FE                   push word [bp-2]
  9873 00004345 E859C3                   call prunsign1
  9874 00004348 83C402                   add  sp, 2
  9875                                  
  9876                                  ;-1104         prc(']');
  9877                                  
  9878 0000434B 6A5D                     push 93
  9879 0000434D E895C1                   call prc
  9880 00004350 83C402                   add  sp, 2
  9881                                  
  9882                                  ;-1105         }
  9883                                  
  9884                                  
  9885                                  ;-1106     if (i >= LSTART) {
  9886                                  
  9887                                  .listvar519:
  9888 00004353 8B4604                   mov ax, [bp+4]
  9889 00004356 3DC800                   cmp ax, 200 ;unsigned : 0
  9890 00004359 0F823000                 jb  .listvar520
  9891                                  
  9892                                  ;-1107         prs(" = bp");
  9893                                  
  9894 0000435D 68[D143]                 push listvar_12
  9895 00004360 E8E9C1                   call prs
  9896 00004363 83C402                   add  sp, 2
  9897                                  
  9898                                  ;-1108         j=GData[i];
  9899                                  
  9900 00004366 8B5E04                   mov bx, [bp+4]
  9901 00004369 D1E3                     shl bx, 1
  9902 0000436B 8B873873                 mov ax, [GData + bx]
  9903 0000436F 8946FE                   mov [bp-2], ax
  9904                                  
  9905                                  ;-1109         if (j > 0) prc('+');
  9906                                  
  9907 00004372 8B46FE                   mov ax, [bp-2]
  9908 00004375 83F800                   cmp ax, 0
  9909 00004378 0F8E0800                 jle .listvar521
  9910 0000437C 6A2B                     push 43
  9911 0000437E E864C1                   call prc
  9912 00004381 83C402                   add  sp, 2
  9913                                  
  9914                                  ;-1110         pint1(j);
  9915                                  
  9916                                  .listvar521:
  9917 00004384 FF76FE                   push word [bp-2]
  9918 00004387 E8B9C2                   call pint1
  9919 0000438A 83C402                   add  sp, 2
  9920                                  
  9921                                  ;-1111     }
  9922                                  
  9923                                  
  9924                                  ;-1112 }
  9925                                  
  9926                                  .listvar520:
  9927                                  
  9928                                  ;-1113 
  9929                                  
  9930                                  
  9931                                  ;-1114 unsigned int MAXUI=65535;
  9932 0000438D C9                       LEAVE
  9933 0000438E C3                       ret
  9934 0000438F 5C6E3B00                listvar_0 db "\n;",0
  9935 00004393 7661722000              listvar_1 db "var ",0
  9936 00004398 7074722000              listvar_2 db "ptr ",0
  9937 0000439D 6172722000              listvar_3 db "arr ",0
  9938 000043A2 6465662000              listvar_4 db "def ",0
  9939 000043A7 7369676E2000            listvar_5 db "sign ",0
  9940 000043AD 756E73672000            listvar_6 db "unsg ",0
  9941 000043B3 627974652000            listvar_7 db "byte ",0
  9942 000043B9 776F72642000            listvar_8 db "word ",0
  9943 000043BF 647772642000            listvar_9 db "dwrd ",0
  9944 000043C5 202020202D00            listvar_10 db "    -",0
  9945 000043CB 204E554C4C00            listvar_11 db " NULL",0
  9946 000043D1 203D20627000            listvar_12 db " = bp",0
  9947                                  ENDP
  9948 000043D7 FFFF                    MAXUI dw 65535
  9949                                  
  9950                                  ;-1115 int epilog() {
  9951                                  
  9952                                  
  9953                                  epilog: PROC
  9954                                  
  9955                                  ;-1116     unsigned int i;
  9956                                  
  9957                                  
  9958                                  ;-1117     prs("\n \n;   # type sign width  adr used name");
  9959                                  
  9960                                  ;Function : epilog, Number of local variables: 1
  9961                                  ;   # type sign width addr used name   list of local variables
  9962                                  ;  200 var unsg word  1116 NULL i = bp-2;
  9963 000043D9 C8020000                 ENTER  2,0
  9964 000043DD 68[6A45]                 push epilog_0
  9965 000043E0 E869C1                   call prs
  9966 000043E3 83C402                   add  sp, 2
  9967                                  
  9968                                  ;-1118     prs("   list of global variables\n");
  9969                                  
  9970 000043E6 68[9445]                 push epilog_1
  9971 000043E9 E860C1                   call prs
  9972 000043EC 83C402                   add  sp, 2
  9973                                  
  9974                                  ;-1119     i=1;
  9975                                  
  9976 000043EF B80100                   mov ax, 1
  9977 000043F2 8946FE                   mov [bp-2], ax
  9978                                  
  9979                                  ;-1120     while (i< GTop) {
  9980                                  
  9981                                  .epilog522:
  9982 000043F5 8B46FE                   mov ax, [bp-2]
  9983 000043F8 3B06[3900]               cmp ax, [GTop]
  9984 000043FC 0F8D0E00                 jge .epilog523
  9985                                  
  9986                                  ;-1121         listvar(i);
  9987                                  
  9988 00004400 FF76FE                   push word [bp-2]
  9989 00004403 E89DFD                   call listvar
  9990 00004406 83C402                   add  sp, 2
  9991                                  
  9992                                  ;-1122         i++;
  9993                                  
  9994 00004409 FF46FE                   inc  word[bp-2]
  9995                                  
  9996                                  ;-1123         }
  9997                                  
  9998                                  
  9999                                  ;-1124     listfunc();
 10000                                  
 10001 0000440C EBE7                     jmp .epilog522
 10002                                  .epilog523:
 10003 0000440E E80EFC                   call listfunc
 10004                                  
 10005                                  ;-1125     listcall();
 10006                                  
 10007 00004411 E8C1FA                   call listcall
 10008                                  
 10009                                  ;-1126     prs("\n;Input: "); prs(&namein);
 10010                                  
 10011 00004414 68[B245]                 push epilog_2
 10012 00004417 E832C1                   call prs
 10013 0000441A 83C402                   add  sp, 2
 10014 0000441D 8D067E6A                 lea  ax, [namein]
 10015 00004421 50                       push ax
 10016 00004422 E827C1                   call prs
 10017 00004425 83C402                   add  sp, 2
 10018                                  
 10019                                  ;-1127     prs(", List: ");   prs(&namelst);
 10020                                  
 10021 00004428 68[BD45]                 push epilog_3
 10022 0000442B E81EC1                   call prs
 10023 0000442E 83C402                   add  sp, 2
 10024 00004431 8D06C16A                 lea  ax, [namelst]
 10025 00004435 50                       push ax
 10026 00004436 E813C1                   call prs
 10027 00004439 83C402                   add  sp, 2
 10028                                  
 10029                                  ;-1128     prs(",  Lines:"); printint51(lineno);
 10030                                  
 10031 0000443C 68[C645]                 push epilog_4
 10032 0000443F E80AC1                   call prs
 10033 00004442 83C402                   add  sp, 2
 10034 00004445 FF36[6A00]               push word [lineno]
 10035 00004449 E899C2                   call printint51
 10036 0000444C 83C402                   add  sp, 2
 10037                                  
 10038                                  ;-1129     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10039                                  
 10040 0000444F 68[D045]                 push epilog_5
 10041 00004452 E8F7C0                   call prs
 10042 00004455 83C402                   add  sp, 2
 10043 00004458 FF0E[3900]               dec  word[GTop]
 10044 0000445C FF36[3900]               push word [GTop]
 10045 00004460 E882C2                   call printint51
 10046 00004463 83C402                   add  sp, 2
 10047                                  
 10048                                  ;-1130     prs(" max.:"); printint51(LSTART);
 10049                                  
 10050 00004466 68[E445]                 push epilog_6
 10051 00004469 E8E0C0                   call prs
 10052 0000446C 83C402                   add  sp, 2
 10053 0000446F 68C800                   push 200
 10054 00004472 E870C2                   call printint51
 10055 00004475 83C402                   add  sp, 2
 10056                                  
 10057                                  ;-1131     prs("\n;Functions      :"); printint51(FTop);
 10058                                  
 10059 00004478 68[EB45]                 push epilog_7
 10060 0000447B E8CEC0                   call prs
 10061 0000447E 83C402                   add  sp, 2
 10062 00004481 FF36[3D00]               push word [FTop]
 10063 00004485 E85DC2                   call printint51
 10064 00004488 83C402                   add  sp, 2
 10065                                  
 10066                                  ;-1132     prs(" max.:"); printint51(FUNCMAX);
 10067                                  
 10068 0000448B 68[FF45]                 push epilog_8
 10069 0000448E E8BBC0                   call prs
 10070 00004491 83C402                   add  sp, 2
 10071 00004494 682C01                   push 300
 10072 00004497 E84BC2                   call printint51
 10073 0000449A 83C402                   add  sp, 2
 10074                                  
 10075                                  ;-1133     prs("\n;Calls          :"); printint51(CTop);
 10076                                  
 10077 0000449D 68[0646]                 push epilog_9
 10078 000044A0 E8A9C0                   call prs
 10079 000044A3 83C402                   add  sp, 2
 10080 000044A6 FF36[4300]               push word [CTop]
 10081 000044AA E838C2                   call printint51
 10082 000044AD 83C402                   add  sp, 2
 10083                                  
 10084                                  ;-1134     prs(" max.:"); printint51(CALLMAX);
 10085                                  
 10086 000044B0 68[1A46]                 push epilog_10
 10087 000044B3 E896C0                   call prs
 10088 000044B6 83C402                   add  sp, 2
 10089 000044B9 68DC05                   push 1500
 10090 000044BC E826C2                   call printint51
 10091 000044BF 83C402                   add  sp, 2
 10092                                  
 10093                                  ;-1135     prs(", NameField:"); printint51(CNameTop);
 10094                                  
 10095 000044C2 68[2146]                 push epilog_11
 10096 000044C5 E884C0                   call prs
 10097 000044C8 83C402                   add  sp, 2
 10098 000044CB FF36[4100]               push word [CNameTop]
 10099 000044CF E813C2                   call printint51
 10100 000044D2 83C402                   add  sp, 2
 10101                                  
 10102                                  ;-1136 //    prs(" max.:");
 10103                                  
 10104                                  
 10105                                  ;-1137     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10106                                  
 10107 000044D5 68[2E46]                 push epilog_12
 10108 000044D8 E871C0                   call prs
 10109 000044DB 83C402                   add  sp, 2
 10110 000044DE 8D067869                 lea  ax, [coname]
 10111 000044E2 50                       push ax
 10112 000044E3 E866C0                   call prs
 10113 000044E6 83C402                   add  sp, 2
 10114 000044E9 68[3C46]                 push epilog_13
 10115 000044EC E85DC0                   call prs
 10116 000044EF 83C402                   add  sp, 2
 10117 000044F2 FF36[1400]               push word [maxco]
 10118 000044F6 E8ECC1                   call printint51
 10119 000044F9 83C402                   add  sp, 2
 10120                                  
 10121                                  ;-1138     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;
 10122                                  
 10123 000044FC 68[4046]                 push epilog_14
 10124 000044FF E84AC0                   call prs
 10125 00004502 83C402                   add  sp, 2
 10126 00004505 68D007                   push 2000
 10127 00004508 E8DAC1                   call printint51
 10128 0000450B 83C402                   add  sp, 2
 10129 0000450E B8D007                   mov ax, 2000
 10130 00004511 8946FE                   mov [bp-2], ax
 10131 00004514 8B46FE                   mov ax, [bp-2]
 10132 00004517 2B06[1400]               sub ax, [maxco]
 10133 0000451B 8946FE                   mov [bp-2], ax
 10134                                  
 10135                                  ;-1139     if (i <= 1000)prs(" *** Warning *** constant area too small");
 10136                                  
 10137 0000451E 8B46FE                   mov ax, [bp-2]
 10138 00004521 3DE803                   cmp ax, 1000
 10139 00004524 0F870900                 ja  .epilog524
 10140 00004528 68[4746]                 push epilog_15
 10141 0000452B E81EC0                   call prs
 10142 0000452E 83C402                   add  sp, 2
 10143                                  
 10144                                  ;-1140     prs(", stacksize: ");
 10145                                  
 10146                                  .epilog524:
 10147 00004531 68[7046]                 push epilog_16
 10148 00004534 E815C0                   call prs
 10149 00004537 83C402                   add  sp, 2
 10150                                  
 10151                                  ;-1141     i=MAXUI-orgData; printint51(i);
 10152                                  
 10153 0000453A A1[D743]                 mov ax, [MAXUI]
 10154 0000453D 2B06[1200]               sub ax, [orgData]
 10155 00004541 8946FE                   mov [bp-2], ax
 10156 00004544 FF76FE                   push word [bp-2]
 10157 00004547 E89BC1                   call printint51
 10158 0000454A 83C402                   add  sp, 2
 10159                                  
 10160                                  ;-1142     if (i <= 1000) prs(" *** Warning *** Stack too small");
 10161                                  
 10162 0000454D 8B46FE                   mov ax, [bp-2]
 10163 00004550 3DE803                   cmp ax, 1000
 10164 00004553 0F870900                 ja  .epilog525
 10165 00004557 68[7E46]                 push epilog_17
 10166 0000455A E8EFBF                   call prs
 10167 0000455D 83C402                   add  sp, 2
 10168                                  
 10169                                  ;-1143   end1(0);}
 10170                                  
 10171                                  .epilog525:
 10172 00004560 6A00                     push 0
 10173 00004562 E8ACF7                   call end1
 10174 00004565 83C402                   add  sp, 2
 10175                                  
 10176                                  ;-1144 
 10177                                  
 10178                                  
 10179                                  ;-1145 int checkcalls() {
 10180 00004568 C9                       LEAVE
 10181 00004569 C3                       ret
 10182 0000456A 5C6E205C6E3B202020-     epilog_0 db "\n \n;   # type sign width  adr used name",0
 10183 00004573 232074797065207369-
 10184 0000457C 676E20776964746820-
 10185 00004585 206164722075736564-
 10186 0000458E 206E616D6500       
 10187 00004594 2020206C697374206F-     epilog_1 db "   list of global variables\n",0
 10188 0000459D 6620676C6F62616C20-
 10189 000045A6 7661726961626C6573-
 10190 000045AF 5C6E00             
 10191 000045B2 5C6E3B496E7075743A-     epilog_2 db "\n;Input: ",0
 10192 000045BB 2000               
 10193 000045BD 2C204C6973743A2000      epilog_3 db ", List: ",0
 10194 000045C6 2C20204C696E65733A-     epilog_4 db ",  Lines:",0
 10195 000045CF 00                 
 10196 000045D0 5C6E3B476C6F622E20-     epilog_5 db "\n;Glob. variables:",0
 10197 000045D9 7661726961626C6573-
 10198 000045E2 3A00               
 10199 000045E4 206D61782E3A00          epilog_6 db " max.:",0
 10200 000045EB 5C6E3B46756E637469-     epilog_7 db "\n;Functions      :",0
 10201 000045F4 6F6E73202020202020-
 10202 000045FD 3A00               
 10203 000045FF 206D61782E3A00          epilog_8 db " max.:",0
 10204 00004606 5C6E3B43616C6C7320-     epilog_9 db "\n;Calls          :",0
 10205 0000460F 202020202020202020-
 10206 00004618 3A00               
 10207 0000461A 206D61782E3A00          epilog_10 db " max.:",0
 10208 00004621 2C204E616D65466965-     epilog_11 db ", NameField:",0
 10209 0000462A 6C643A00           
 10210 0000462E 5C6E3B436F6E737420-     epilog_12 db "\n;Const in '",0
 10211 00004637 696E202700         
 10212 0000463C 27203A00                epilog_13 db "' :",0
 10213 00004640 206D61782E3A00          epilog_14 db " max.:",0
 10214 00004647 202A2A2A205761726E-     epilog_15 db " *** Warning *** constant area too small",0
 10215 00004650 696E67202A2A2A2063-
 10216 00004659 6F6E7374616E742061-
 10217 00004662 72656120746F6F2073-
 10218 0000466B 6D616C6C00         
 10219 00004670 2C20737461636B7369-     epilog_16 db ", stacksize: ",0
 10220 00004679 7A653A2000         
 10221 0000467E 202A2A2A205761726E-     epilog_17 db " *** Warning *** Stack too small",0
 10222 00004687 696E67202A2A2A2053-
 10223 00004690 7461636B20746F6F20-
 10224 00004699 736D616C6C00       
 10225                                  ENDP
 10226                                  
 10227                                  checkcalls: PROC
 10228                                  
 10229                                  ;-1146     int i; int j; int k;
 10230                                  
 10231                                  
 10232                                  ;-1147     prs("\n \n; missing functions: ");
 10233                                  
 10234                                  ;Function : checkcalls, Number of local variables: 3
 10235                                  ;   # type sign width addr used name   list of local variables
 10236                                  ;  200 var sign word  1146 NULL i = bp-2
 10237                                  ;  201 var sign word  1146 NULL j = bp-4
 10238                                  ;  202 var sign word  1146 NULL k = bp-6;
 10239 0000469F C8060000                 ENTER  6,0
 10240 000046A3 68[8547]                 push checkcalls_0
 10241 000046A6 E8A3BE                   call prs
 10242 000046A9 83C402                   add  sp, 2
 10243                                  
 10244                                  ;-1148     i=0;  k=0;
 10245                                  
 10246 000046AC B80000                   mov ax, 0
 10247 000046AF 8946FE                   mov [bp-2], ax
 10248 000046B2 B80000                   mov ax, 0
 10249 000046B5 8946FA                   mov [bp-6], ax
 10250                                  
 10251                                  ;-1149     while (i < CTop) {
 10252                                  
 10253                                  .checkcalls526:
 10254 000046B8 8B46FE                   mov ax, [bp-2]
 10255 000046BB 3B06[4300]               cmp ax, [CTop]
 10256 000046BF 0F8D8F00                 jge .checkcalls527
 10257                                  
 10258                                  ;-1150         pt=CAdr[i];
 10259                                  
 10260 000046C3 8B5EFE                   mov bx, [bp-2]
 10261 000046C6 D1E3                     shl bx, 1
 10262 000046C8 8B87C8A6                 mov ax, [CAdr + bx]
 10263 000046CC A3[6E00]                 mov word [pt], ax
 10264                                  
 10265                                  ;-1151         from_far(NameA, pt);
 10266                                  
 10267 000046CF FF36[6E00]               push word [pt]
 10268 000046D3 8D06[4500]               lea  ax, [NameA]
 10269 000046D7 50                       push ax
 10270 000046D8 E8B005                   call from_far
 10271 000046DB 83C404                   add  sp, 4
 10272                                  
 10273                                  ;-1152         j=0;
 10274                                  
 10275 000046DE B80000                   mov ax, 0
 10276 000046E1 8946FC                   mov [bp-4], ax
 10277                                  
 10278                                  ;-1153         do {
 10279                                  
 10280                                  .checkcalls528:
 10281                                  
 10282                                  ;-1154             p1=adrF(FNameField, j);
 10283                                  
 10284 000046E4 FF76FC                   push word [bp-4]
 10285 000046E7 8D062C8E                 lea  ax, [FNameField]
 10286 000046EB 50                       push ax
 10287 000046EC E847C5                   call adrF
 10288 000046EF 83C404                   add  sp, 4
 10289 000046F2 A3[7000]                 mov word [p1], ax
 10290                                  
 10291                                  ;-1155             if (eqstr(NameA, p1)){
 10292                                  
 10293 000046F5 FF36[7000]               push word [p1]
 10294 000046F9 8D06[4500]               lea  ax, [NameA]
 10295 000046FD 50                       push ax
 10296 000046FE E884BB                   call eqstr
 10297 00004701 83C404                   add  sp, 4
 10298 00004704 08C0                     or  al, al
 10299 00004706 0F841000                 je .checkcalls529
 10300                                  
 10301                                  ;-1156                 CType[i]=1;
 10302                                  
 10303 0000470A B80100                   mov ax, 1
 10304 0000470D 8B5EFE                   mov bx, [bp-2]
 10305 00004710 8887ECA0                 mov [CType+bx], al
 10306                                  
 10307                                  ;-1157                 j=FTop;
 10308                                  
 10309 00004714 A1[3D00]                 mov ax, [FTop]
 10310 00004717 8946FC                   mov [bp-4], ax
 10311                                  
 10312                                  ;-1158                 }
 10313                                  
 10314                                  
 10315                                  ;-1159             j++;
 10316                                  
 10317                                  .checkcalls529:
 10318 0000471A FF46FC                   inc  word[bp-4]
 10319                                  
 10320                                  ;-1160             } while (j < FTop);
 10321                                  
 10322 0000471D 8B46FC                   mov ax, [bp-4]
 10323 00004720 3B06[3D00]               cmp ax, [FTop]
 10324 00004724 0F8D0200                 jge .checkcalls530
 10325 00004728 EBBA                     jmp .checkcalls528
 10326                                  .checkcalls530:
 10327                                  
 10328                                  ;-1161         if (j == FTop) {
 10329                                  
 10330 0000472A 8B46FC                   mov ax, [bp-4]
 10331 0000472D 3B06[3D00]               cmp ax, [FTop]
 10332 00004731 0F851700                 jne .checkcalls531
 10333                                  
 10334                                  ;-1162             k++; prs("\n; ");
 10335                                  
 10336 00004735 FF46FA                   inc  word[bp-6]
 10337 00004738 68[A047]                 push checkcalls_1
 10338 0000473B E80EBE                   call prs
 10339 0000473E 83C402                   add  sp, 2
 10340                                  
 10341                                  ;-1163             prs(NameA);
 10342                                  
 10343 00004741 8D06[4500]               lea  ax, [NameA]
 10344 00004745 50                       push ax
 10345 00004746 E803BE                   call prs
 10346 00004749 83C402                   add  sp, 2
 10347                                  
 10348                                  ;-1164         }
 10349                                  
 10350                                  
 10351                                  ;-1165         i++;
 10352                                  
 10353                                  .checkcalls531:
 10354 0000474C FF46FE                   inc  word[bp-2]
 10355                                  
 10356                                  ;-1166     }
 10357                                  
 10358                                  
 10359                                  ;-1167     prs("\n; Number of unresolved CALLs :"); printint51(k);
 10360                                  
 10361 0000474F E966FF                   jmp .checkcalls526
 10362                                  .checkcalls527:
 10363 00004752 68[A547]                 push checkcalls_2
 10364 00004755 E8F4BD                   call prs
 10365 00004758 83C402                   add  sp, 2
 10366 0000475B FF76FA                   push word [bp-6]
 10367 0000475E E884BF                   call printint51
 10368 00004761 83C402                   add  sp, 2
 10369                                  
 10370                                  ;-1168     if (k!=0) error1("At least 1 function is missing! ");
 10371                                  
 10372 00004764 8B46FA                   mov ax, [bp-6]
 10373 00004767 83F800                   cmp ax, 0
 10374 0000476A 0F840C00                 je  .checkcalls532
 10375 0000476E 68[C647]                 push checkcalls_3
 10376 00004771 E8C0F5                   call error1
 10377 00004774 83C402                   add  sp, 2
 10378                                  
 10379                                  ;-1169     else prs(" All FUNCTIONs in place");
 10380                                  
 10381 00004777 E90900                   jmp .checkcalls533
 10382                                  .checkcalls532:
 10383 0000477A 68[E747]                 push checkcalls_4
 10384 0000477D E8CCBD                   call prs
 10385 00004780 83C402                   add  sp, 2
 10386                                  
 10387                                  ;-1170 }
 10388                                  
 10389                                  .checkcalls533:
 10390                                  
 10391                                  ;-1171 
 10392                                  
 10393                                  
 10394                                  ;-1172 int dodefine() {
 10395 00004783 C9                       LEAVE
 10396 00004784 C3                       ret
 10397 00004785 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
 10398 0000478E 7373696E672066756E-
 10399 00004797 6374696F6E733A2000 
 10400 000047A0 5C6E3B2000              checkcalls_1 db "\n; ",0
 10401 000047A5 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
 10402 000047AE 72206F6620756E7265-
 10403 000047B7 736F6C766564204341-
 10404 000047C0 4C4C73203A00       
 10405 000047C6 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
 10406 000047CF 312066756E6374696F-
 10407 000047D8 6E206973206D697373-
 10408 000047E1 696E67212000       
 10409 000047E7 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
 10410 000047F0 54494F4E7320696E20-
 10411 000047F9 706C61636500       
 10412                                  ENDP
 10413                                  
 10414                                  dodefine: PROC
 10415                                  
 10416                                  ;-1173     int i; int j; int fdtemp;
 10417                                  
 10418                                  
 10419                                  ;-1174     if (eqstr(symbol, "ORGDATA")) {
 10420                                  
 10421                                  ;Function : dodefine, Number of local variables: 3
 10422                                  ;   # type sign width addr used name   list of local variables
 10423                                  ;  200 var sign word  1173 NULL i = bp-2
 10424                                  ;  201 var sign word  1173 NULL j = bp-4
 10425                                  ;  202 var sign word  1173 NULL fdtemp = bp-6;
 10426 000047FF C8060000                 ENTER  6,0
 10427 00004803 68[E948]                 push dodefine_0
 10428 00004806 8D06BB69                 lea  ax, [symbol]
 10429 0000480A 50                       push ax
 10430 0000480B E877BA                   call eqstr
 10431 0000480E 83C404                   add  sp, 4
 10432 00004811 08C0                     or  al, al
 10433 00004813 0F841500                 je .dodefine534
 10434                                  
 10435                                  ;-1175         token=getlex();
 10436                                  
 10437 00004817 E8A3EA                   call getlex
 10438 0000481A A3[1E00]                 mov word [token], ax
 10439                                  
 10440                                  ;-1176         ORGDATAORIG=lexval;
 10441                                  
 10442 0000481D A1[2C00]                 mov ax, [lexval]
 10443 00004820 A3[1000]                 mov word [ORGDATAORIG], ax
 10444                                  
 10445                                  ;-1177         orgData=lexval;
 10446                                  
 10447 00004823 A1[2C00]                 mov ax, [lexval]
 10448 00004826 A3[1200]                 mov word [orgData], ax
 10449                                  
 10450                                  ;-1178         return;
 10451                                  
 10452 00004829 E9BB00                   jmp .retndodefine
 10453                                  
 10454                                  ;-1179     }
 10455                                  
 10456                                  
 10457                                  ;-1180     expect(T_NAME);
 10458                                  
 10459                                  .dodefine534:
 10460 0000482C 680001                   push 256
 10461 0000482F E807BC                   call expect
 10462 00004832 83C402                   add  sp, 2
 10463                                  
 10464                                  ;-1181     if (token==T_CONST) {
 10465                                  
 10466 00004835 A1[1E00]                 mov ax, [token]
 10467 00004838 3D0101                   cmp ax, 257
 10468 0000483B 0F85A800                 jne .dodefine535
 10469                                  
 10470                                  ;-1182         if (GTop >= LSTART) error1("global table (define) full");
 10471                                  
 10472 0000483F A1[3900]                 mov ax, [GTop]
 10473 00004842 3DC800                   cmp ax, 200 ;unsigned : 1
 10474 00004845 0F8C0900                 jl  .dodefine536
 10475 00004849 68[F148]                 push dodefine_1
 10476 0000484C E8E5F4                   call error1
 10477 0000484F 83C402                   add  sp, 2
 10478                                  
 10479                                  ;-1183         i=strlen(symbol);
 10480                                  
 10481                                  .dodefine536:
 10482 00004852 8D06BB69                 lea  ax, [symbol]
 10483 00004856 50                       push ax
 10484 00004857 E8CDB9                   call strlen
 10485 0000485A 83C402                   add  sp, 2
 10486 0000485D 8946FE                   mov [bp-2], ax
 10487                                  
 10488                                  ;-1184         if (i>15) error1("Define name longer 15 char");
 10489                                  
 10490 00004860 8B46FE                   mov ax, [bp-2]
 10491 00004863 83F80F                   cmp ax, 15
 10492 00004866 0F8E0900                 jle .dodefine537
 10493 0000486A 68[0C49]                 push dodefine_2
 10494 0000486D E8C4F4                   call error1
 10495 00004870 83C402                   add  sp, 2
 10496                                  
 10497                                  ;-1185         GSign [GTop]='U';
 10498                                  
 10499                                  .dodefine537:
 10500 00004873 B85500                   mov ax, 85
 10501 00004876 8B1E[3900]               mov bx, [GTop]
 10502 0000487A 8887306C                 mov [GSign+bx], al
 10503                                  
 10504                                  ;-1186         GWidth[GTop]=1;
 10505                                  
 10506 0000487E B80100                   mov ax, 1
 10507 00004881 8B1E[3900]               mov bx, [GTop]
 10508 00004885 88875C6D                 mov [GWidth+bx], al
 10509                                  
 10510                                  ;-1187         GType [GTop]='#';
 10511                                  
 10512 00004889 B82300                   mov ax, 35
 10513 0000488C 8B1E[3900]               mov bx, [GTop]
 10514 00004890 8887046B                 mov [GType+bx], al
 10515                                  
 10516                                  ;-1188         GAdr [GTop]=lineno-1;
 10517                                  
 10518 00004894 A1[6A00]                 mov ax, [lineno]
 10519 00004897 83E801                   sub ax, 1
 10520 0000489A 8B1E[3900]               mov bx, [GTop]
 10521 0000489E D1E3                     shl bx, 1
 10522 000048A0 8987886E                 mov [GAdr+bx], ax
 10523                                  
 10524                                  ;-1189         GUsed [GTop]=0;
 10525                                  
 10526 000048A4 B80000                   mov ax, 0
 10527 000048A7 8B1E[3900]               mov bx, [GTop]
 10528 000048AB D1E3                     shl bx, 1
 10529 000048AD 8987E070                 mov [GUsed+bx], ax
 10530                                  
 10531                                  ;-1190         pt=adrofname(GTop);
 10532                                  
 10533 000048B1 FF36[3900]               push word [GTop]
 10534 000048B5 E86AC3                   call adrofname
 10535 000048B8 83C402                   add  sp, 2
 10536 000048BB A3[6E00]                 mov word [pt], ax
 10537                                  
 10538                                  ;-1191         strcpy(pt, symbol);
 10539                                  
 10540 000048BE 8D06BB69                 lea  ax, [symbol]
 10541 000048C2 50                       push ax
 10542 000048C3 FF36[6E00]               push word [pt]
 10543 000048C7 E885B9                   call strcpy
 10544 000048CA 83C404                   add  sp, 4
 10545                                  
 10546                                  ;-1192         GData[GTop]=lexval;
 10547                                  
 10548 000048CD A1[2C00]                 mov ax, [lexval]
 10549 000048D0 8B1E[3900]               mov bx, [GTop]
 10550 000048D4 D1E3                     shl bx, 1
 10551 000048D6 89873873                 mov [GData+bx], ax
 10552                                  
 10553                                  ;-1193         expect(T_CONST);
 10554                                  
 10555 000048DA 680101                   push 257
 10556 000048DD E859BB                   call expect
 10557 000048E0 83C402                   add  sp, 2
 10558                                  
 10559                                  ;-1194         GTop++;
 10560                                  
 10561 000048E3 FF06[3900]               inc  word[GTop]
 10562                                  
 10563                                  ;-1195     }
 10564                                  
 10565                                  
 10566                                  ;-1196 }
 10567                                  
 10568                                  .dodefine535:
 10569                                  
 10570                                  ;-1197 
 10571                                  
 10572                                  
 10573                                  ;-1198 int parse() {
 10574                                  
 10575 000048E7 C9                       .retndodefine: LEAVE
 10576 000048E8 C3                       ret
 10577 000048E9 4F52474441544100        dodefine_0 db "ORGDATA",0
 10578 000048F1 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
 10579 000048FA 626C65202864656669-
 10580 00004903 6E65292066756C6C00 
 10581 0000490C 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
 10582 00004915 6D65206C6F6E676572-
 10583 0000491E 203135206368617200 
 10584                                  ENDP
 10585                                  
 10586                                  parse: PROC
 10587                                  
 10588                                  ;-1199     CNamePtr = &CNameField;
 10589                                  
 10590 00004927 B880B2                   mov ax, CNameField
 10591 0000492A A3[3F00]                 mov word [CNamePtr], ax
 10592                                  
 10593                                  ;-1200     token=getlex();
 10594                                  
 10595 0000492D E88DE9                   call getlex
 10596 00004930 A3[1E00]                 mov word [token], ax
 10597                                  
 10598                                  ;-1201     do {
 10599                                  
 10600                                  .parse538:
 10601                                  
 10602                                  ;-1202         if (token <= 0) return 1;
 10603                                  
 10604 00004933 A1[1E00]                 mov ax, [token]
 10605 00004936 83F800                   cmp ax, 0
 10606 00004939 0F8F0600                 jg  .parse539
 10607 0000493D B80100                   mov ax, 1
 10608 00004940 E95000                   jmp .retnparse
 10609                                  
 10610                                  ;-1203         if (istoken('#')) {
 10611                                  
 10612                                  .parse539:
 10613 00004943 6A23                     push 35
 10614 00004945 E8CFBA                   call istoken
 10615 00004948 83C402                   add  sp, 2
 10616 0000494B 08C0                     or  al, al
 10617 0000494D 0F842100                 je .parse540
 10618                                  
 10619                                  ;-1204              if (istoken(T_DEFINE))  dodefine();
 10620                                  
 10621 00004951 68FF01                   push 511
 10622 00004954 E8C0BA                   call istoken
 10623 00004957 83C402                   add  sp, 2
 10624 0000495A 08C0                     or  al, al
 10625 0000495C 0F840600                 je .parse541
 10626 00004960 E89CFE                   call dodefine
 10627                                  
 10628                                  ;-1205              else error1("define expected");
 10629                                  
 10630 00004963 E90900                   jmp .parse542
 10631                                  .parse541:
 10632 00004966 68[9449]                 push parse_0
 10633 00004969 E8C8F3                   call error1
 10634 0000496C 83C402                   add  sp, 2
 10635                                  
 10636                                  ;-1206         }
 10637                                  
 10638                                  .parse542:
 10639                                  
 10640                                  ;-1207     else{
 10641                                  
 10642 0000496F E91600                   jmp .parse543
 10643                                  .parse540:
 10644                                  
 10645                                  ;-1208         typeName();
 10646                                  
 10647 00004972 E803C4                   call typeName
 10648                                  
 10649                                  ;-1209         if (token=='(') dofunc();
 10650                                  
 10651 00004975 A1[1E00]                 mov ax, [token]
 10652 00004978 83F828                   cmp ax, 40
 10653 0000497B 0F850600                 jne .parse544
 10654 0000497F E89CC7                   call dofunc
 10655                                  
 10656                                  ;-1210         else doglob(); }
 10657                                  
 10658 00004982 E90300                   jmp .parse545
 10659                                  .parse544:
 10660 00004985 E8B4BD                   call doglob
 10661                                  .parse545:
 10662                                  
 10663                                  ;-1211     } while(1);
 10664                                  
 10665                                  .parse543:
 10666 00004988 B80100                   mov ax, 1
 10667 0000498B 08C0                     or  al, al
 10668 0000498D 0F840200                 je .parse546
 10669 00004991 EBA0                     jmp .parse538
 10670                                  .parse546:
 10671                                  
 10672                                  ;-1212 }
 10673                                  
 10674                                  
 10675                                  ;-1213 
 10676                                  
 10677                                  
 10678                                  ;-1214 int getfirstchar() {
 10679                                  
 10680                                   .retnparse:
 10681 00004993 C3                       ret
 10682 00004994 646566696E65206578-     parse_0 db "define expected",0
 10683 0000499D 70656374656400     
 10684                                  ENDP
 10685                                  
 10686                                  getfirstchar: PROC
 10687                                  
 10688                                  ;-1215     fgetsp=&fgetsdest;
 10689                                  
 10690 000049A4 B8A0D9                   mov ax, fgetsdest
 10691 000049A7 A3[6600]                 mov word [fgetsp], ax
 10692                                  
 10693                                  ;-1216     *fgetsp=0;
 10694                                  
 10695 000049AA B80000                   mov ax, 0
 10696 000049AD 8B1E[6600]               mov  bx, [fgetsp]
 10697 000049B1 8807                     mov  [bx], al
 10698                                  
 10699                                  ;-1217     thechar=fgets1();
 10700                                  
 10701 000049B3 E80DF2                   call fgets1
 10702 000049B6 A2[2300]                 mov byte [thechar], al
 10703                                  
 10704                                  ;-1218     }
 10705                                  
 10706                                  
 10707                                  ;-1219 
 10708                                  
 10709                                  
 10710                                  ;-1220 char *arglen=0x80; char *argv=0x82;
 10711                                  
 10712 000049B9 C3                       ret
 10713                                  ENDP
 10714 000049BA 8000                    arglen dw 128
 10715 000049BC 8200                    argv dw 130
 10716                                  
 10717                                  ;-1221 int getarg() {
 10718                                  
 10719                                  
 10720                                  getarg: PROC
 10721                                  
 10722                                  ;-1222     int arglen1; int i; char *c;
 10723                                  
 10724                                  
 10725                                  ;-1223     arglen1=*arglen;
 10726                                  
 10727                                  ;Function : getarg, Number of local variables: 3
 10728                                  ;   # type sign width addr used name   list of local variables
 10729                                  ;  200 var sign word  1222 NULL arglen1 = bp-2
 10730                                  ;  201 var sign word  1222 NULL i = bp-4
 10731                                  ;  202 ptr sign byte  1222 NULL c = bp-6;
 10732 000049BE C8060000                 ENTER  6,0
 10733 000049C2 8B1E[BA49]               mov bx, [arglen]
 10734 000049C6 8A07                     mov al, [bx]
 10735 000049C8 B400                     mov ah, 0
 10736 000049CA 8946FE                   mov [bp-2], ax
 10737                                  
 10738                                  ;-1224     if (arglen1 == 0) {
 10739                                  
 10740 000049CD 8B46FE                   mov ax, [bp-2]
 10741 000049D0 83F800                   cmp ax, 0
 10742 000049D3 0F851C00                 jne .getarg547
 10743                                  
 10744                                  ;-1225         cputs(Version1);
 10745                                  
 10746 000049D7 8D06[0300]               lea  ax, [Version1]
 10747 000049DB 50                       push ax
 10748 000049DC E8BAB6                   call cputs
 10749 000049DF 83C402                   add  sp, 2
 10750                                  
 10751                                  ;-1226         cputs(" Usage: A.COM in_file[.C]: ");
 10752                                  
 10753 000049E2 68[214B]                 push getarg_0
 10754 000049E5 E8B1B6                   call cputs
 10755 000049E8 83C402                   add  sp, 2
 10756                                  
 10757                                  ;-1227         exitR(3);
 10758                                  
 10759 000049EB 6A03                     push 3
 10760 000049ED E81BB7                   call exitR
 10761 000049F0 83C402                   add  sp, 2
 10762                                  
 10763                                  ;-1228         }
 10764                                  
 10765                                  
 10766                                  ;-1229     i=arglen1+129;
 10767                                  
 10768                                  .getarg547:
 10769 000049F3 8B46FE                   mov ax, [bp-2]
 10770 000049F6 058100                   add ax, 129
 10771 000049F9 8946FC                   mov [bp-4], ax
 10772                                  
 10773                                  ;-1230     *i=0;
 10774                                  
 10775 000049FC B80000                   mov ax, 0
 10776 000049FF 8B5EFC                   mov  bx, [bp-4]
 10777 00004A02 8907                     mov  [bx], ax
 10778                                  
 10779                                  ;-1231     arglen1--;
 10780                                  
 10781 00004A04 FF4EFE                   dec  word[bp-2]
 10782                                  
 10783                                  ;-1232     toupper(argv);
 10784                                  
 10785 00004A07 FF36[BC49]               push word [argv]
 10786 00004A0B E8E8B8                   call toupper
 10787 00004A0E 83C402                   add  sp, 2
 10788                                  
 10789                                  ;-1233     strcpy(namein, argv);
 10790                                  
 10791 00004A11 FF36[BC49]               push word [argv]
 10792 00004A15 8D067E6A                 lea  ax, [namein]
 10793 00004A19 50                       push ax
 10794 00004A1A E832B8                   call strcpy
 10795 00004A1D 83C404                   add  sp, 4
 10796                                  
 10797                                  ;-1234     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
 10798                                  
 10799 00004A20 6A2E                     push 46
 10800 00004A22 8D067E6A                 lea  ax, [namein]
 10801 00004A26 50                       push ax
 10802 00004A27 E80FB9                   call instr1
 10803 00004A2A 83C404                   add  sp, 4
 10804 00004A2D 83F800                   cmp ax, 0
 10805 00004A30 0F850E00                 jne .getarg548
 10806 00004A34 68[3D4B]                 push getarg_1
 10807 00004A37 8D067E6A                 lea  ax, [namein]
 10808 00004A3B 50                       push ax
 10809 00004A3C E892B8                   call strcat1
 10810 00004A3F 83C404                   add  sp, 4
 10811                                  
 10812                                  ;-1235     strcpy(namelst, namein);
 10813                                  
 10814                                  .getarg548:
 10815 00004A42 8D067E6A                 lea  ax, [namein]
 10816 00004A46 50                       push ax
 10817 00004A47 8D06C16A                 lea  ax, [namelst]
 10818 00004A4B 50                       push ax
 10819 00004A4C E800B8                   call strcpy
 10820 00004A4F 83C404                   add  sp, 4
 10821                                  
 10822                                  ;-1236     i=strlen(namelst);
 10823                                  
 10824 00004A52 8D06C16A                 lea  ax, [namelst]
 10825 00004A56 50                       push ax
 10826 00004A57 E8CDB7                   call strlen
 10827 00004A5A 83C402                   add  sp, 2
 10828 00004A5D 8946FC                   mov [bp-4], ax
 10829                                  
 10830                                  ;-1237     i--;
 10831                                  
 10832 00004A60 FF4EFC                   dec  word[bp-4]
 10833                                  
 10834                                  ;-1238     c=&namelst+i;
 10835                                  
 10836 00004A63 B8C16A                   mov ax, namelst
 10837 00004A66 0346FC                   add ax, [bp-4]
 10838 00004A69 8946FA                   mov [bp-6], ax
 10839                                  
 10840                                  ;-1239     *c='S';
 10841                                  
 10842 00004A6C B85300                   mov ax, 83
 10843 00004A6F 8B5EFA                   mov  bx, [bp-6]
 10844 00004A72 8807                     mov  [bx], al
 10845                                  
 10846                                  ;-1240 
 10847                                  
 10848                                  
 10849                                  ;-1241     fdin=openR (namein);
 10850                                  
 10851 00004A74 8D067E6A                 lea  ax, [namein]
 10852 00004A78 50                       push ax
 10853 00004A79 E85FB6                   call openR
 10854 00004A7C 83C402                   add  sp, 2
 10855 00004A7F A3[1A00]                 mov word [fdin], ax
 10856                                  
 10857                                  ;-1242     if(DOS_ERR){
 10858                                  
 10859 00004A82 A1[7200]                 mov ax, [DOS_ERR]
 10860 00004A85 08C0                     or  al, al
 10861 00004A87 0F841C00                 je .getarg549
 10862                                  
 10863                                  ;-1243         cputs("Source file missing (.C): ");
 10864                                  
 10865 00004A8B 68[404B]                 push getarg_2
 10866 00004A8E E808B6                   call cputs
 10867 00004A91 83C402                   add  sp, 2
 10868                                  
 10869                                  ;-1244         cputs(namein);
 10870                                  
 10871 00004A94 8D067E6A                 lea  ax, [namein]
 10872 00004A98 50                       push ax
 10873 00004A99 E8FDB5                   call cputs
 10874 00004A9C 83C402                   add  sp, 2
 10875                                  
 10876                                  ;-1245         exitR(1);
 10877                                  
 10878 00004A9F 6A01                     push 1
 10879 00004AA1 E867B6                   call exitR
 10880 00004AA4 83C402                   add  sp, 2
 10881                                  
 10882                                  ;-1246         }
 10883                                  
 10884                                  
 10885                                  ;-1247     fdout=creatR(namelst);
 10886                                  
 10887                                  .getarg549:
 10888 00004AA7 8D06C16A                 lea  ax, [namelst]
 10889 00004AAB 50                       push ax
 10890 00004AAC E83BB6                   call creatR
 10891 00004AAF 83C402                   add  sp, 2
 10892 00004AB2 A3[1C00]                 mov word [fdout], ax
 10893                                  
 10894                                  ;-1248     if(DOS_ERR){
 10895                                  
 10896 00004AB5 A1[7200]                 mov ax, [DOS_ERR]
 10897 00004AB8 08C0                     or  al, al
 10898 00004ABA 0F841C00                 je .getarg550
 10899                                  
 10900                                  ;-1249         cputs("list file not creatable: ");
 10901                                  
 10902 00004ABE 68[5B4B]                 push getarg_3
 10903 00004AC1 E8D5B5                   call cputs
 10904 00004AC4 83C402                   add  sp, 2
 10905                                  
 10906                                  ;-1250         cputs(namelst);
 10907                                  
 10908 00004AC7 8D06C16A                 lea  ax, [namelst]
 10909 00004ACB 50                       push ax
 10910 00004ACC E8CAB5                   call cputs
 10911 00004ACF 83C402                   add  sp, 2
 10912                                  
 10913                                  ;-1251         exitR(2);
 10914                                  
 10915 00004AD2 6A02                     push 2
 10916 00004AD4 E834B6                   call exitR
 10917 00004AD7 83C402                   add  sp, 2
 10918                                  
 10919                                  ;-1252         }
 10920                                  
 10921                                  
 10922                                  ;-1253     prs("\n; ");
 10923                                  
 10924                                  .getarg550:
 10925 00004ADA 68[754B]                 push getarg_4
 10926 00004ADD E86CBA                   call prs
 10927 00004AE0 83C402                   add  sp, 2
 10928                                  
 10929                                  ;-1254     prs(Version1);
 10930                                  
 10931 00004AE3 8D06[0300]               lea  ax, [Version1]
 10932 00004AE7 50                       push ax
 10933 00004AE8 E861BA                   call prs
 10934 00004AEB 83C402                   add  sp, 2
 10935                                  
 10936                                  ;-1255     prs(", Source: "); prs(namein);
 10937                                  
 10938 00004AEE 68[7A4B]                 push getarg_5
 10939 00004AF1 E858BA                   call prs
 10940 00004AF4 83C402                   add  sp, 2
 10941 00004AF7 8D067E6A                 lea  ax, [namein]
 10942 00004AFB 50                       push ax
 10943 00004AFC E84DBA                   call prs
 10944 00004AFF 83C402                   add  sp, 2
 10945                                  
 10946                                  ;-1256     prs(", Output asm: "); prs(namelst);
 10947                                  
 10948 00004B02 68[854B]                 push getarg_6
 10949 00004B05 E844BA                   call prs
 10950 00004B08 83C402                   add  sp, 2
 10951 00004B0B 8D06C16A                 lea  ax, [namelst]
 10952 00004B0F 50                       push ax
 10953 00004B10 E839BA                   call prs
 10954 00004B13 83C402                   add  sp, 2
 10955                                  
 10956                                  ;-1257     prs("\norg  256 \njmp main");
 10957                                  
 10958 00004B16 68[944B]                 push getarg_7
 10959 00004B19 E830BA                   call prs
 10960 00004B1C 83C402                   add  sp, 2
 10961                                  
 10962                                  ;-1258 }
 10963                                  
 10964                                  
 10965                                  ;-1259 
 10966                                  
 10967                                  
 10968                                  ;-1260 int setblock(unsigned int i) {
 10969 00004B1F C9                       LEAVE
 10970 00004B20 C3                       ret
 10971 00004B21 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
 10972 00004B2A 2E434F4D20696E5F66-
 10973 00004B33 696C655B2E435D3A20-
 10974 00004B3C 00                 
 10975 00004B3D 2E4300                  getarg_1 db ".C",0
 10976 00004B40 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
 10977 00004B49 6C65206D697373696E-
 10978 00004B52 6720282E43293A2000 
 10979 00004B5B 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
 10980 00004B64 206E6F742063726561-
 10981 00004B6D 7461626C653A2000   
 10982 00004B75 5C6E3B2000              getarg_4 db "\n; ",0
 10983 00004B7A 2C20536F757263653A-     getarg_5 db ", Source: ",0
 10984 00004B83 2000               
 10985 00004B85 2C204F757470757420-     getarg_6 db ", Output asm: ",0
 10986 00004B8E 61736D3A2000       
 10987 00004B94 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
 10988 00004B9D 36205C6E6A6D70206D-
 10989 00004BA6 61696E00           
 10990                                  ENDP
 10991                                  
 10992                                  setblock: PROC
 10993                                  
 10994                                  ;-1261     DOS_ERR=0;
 10995                                  
 10996                                  ;Function : setblock, Number of local variables: 1
 10997                                  ;   # type sign width addr used name   list of local variables
 10998                                  ;  200 var unsg word  1260 NULL i = bp+4;
 10999 00004BAA C8000000                 ENTER  0,0
 11000 00004BAE B80000                   mov ax, 0
 11001 00004BB1 A3[7200]                 mov word [DOS_ERR], ax
 11002                                  
 11003                                  ;-1262     bx=i;
 11004                                  
 11005 00004BB4 8B5E04                   mov  bx, [bp+4]
 11006                                  
 11007                                  ;-1263     ax=cs;
 11008                                  
 11009 00004BB7 8CC8                     mov  ax, cs
 11010                                  
 11011                                  ;-1264     es=ax;
 11012                                  
 11013 00004BB9 8EC0                     mov  es, ax
 11014                                  
 11015                                  ;-1265     ax=0x4A00;
 11016                                  
 11017 00004BBB B8004A                   mov  ax, 18944
 11018                                  
 11019                                  ;-1266     DosInt();
 11020                                  
 11021 00004BBE E811B5                   call DosInt
 11022                                  
 11023                                  ;-1267 }
 11024                                  
 11025                                  
 11026                                  ;-1268 int main() {
 11027 00004BC1 C9                       LEAVE
 11028 00004BC2 C3                       ret
 11029                                  ENDP
 11030                                  
 11031                                  main: PROC
 11032                                  
 11033                                  ;-1269     getarg();
 11034                                  
 11035 00004BC3 E8F8FD                   call getarg
 11036                                  
 11037                                  ;-1270 setblock(4096);
 11038                                  
 11039 00004BC6 680010                   push 4096
 11040 00004BC9 E8DEFF                   call setblock
 11041 00004BCC 83C402                   add  sp, 2
 11042                                  
 11043                                  ;-1271 if (DOS_ERR) error1("SetBlock , AX=");
 11044                                  
 11045 00004BCF A1[7200]                 mov ax, [DOS_ERR]
 11046 00004BD2 08C0                     or  al, al
 11047 00004BD4 0F840900                 je .main551
 11048 00004BD8 68[1E4C]                 push main_0
 11049 00004BDB E856F1                   call error1
 11050 00004BDE 83C402                   add  sp, 2
 11051                                  
 11052                                  ;-1272 segE=allocmem(4096);
 11053                                  
 11054                                  .main551:
 11055 00004BE1 680010                   push 4096
 11056 00004BE4 E85800                   call allocmem
 11057 00004BE7 83C402                   add  sp, 2
 11058 00004BEA A3[6800]                 mov word [segE], ax
 11059                                  
 11060                                  ;-1273 if (DOS_ERR)  error1("alloc memory, AX=");
 11061                                  
 11062 00004BED A1[7200]                 mov ax, [DOS_ERR]
 11063 00004BF0 08C0                     or  al, al
 11064 00004BF2 0F840900                 je .main552
 11065 00004BF6 68[2D4C]                 push main_1
 11066 00004BF9 E838F1                   call error1
 11067 00004BFC 83C402                   add  sp, 2
 11068                                  
 11069                                  ;-1274     CNameTop=0;
 11070                                  
 11071                                  .main552:
 11072 00004BFF B80000                   mov ax, 0
 11073 00004C02 A3[4100]                 mov word [CNameTop], ax
 11074                                  
 11075                                  ;-1275     coname=0;
 11076                                  
 11077 00004C05 B80000                   mov ax, 0
 11078 00004C08 A27869                   mov byte [coname], al
 11079                                  
 11080                                  ;-1276     orgData=ORGDATAORIG;
 11081                                  
 11082 00004C0B A1[1000]                 mov ax, [ORGDATAORIG]
 11083 00004C0E A3[1200]                 mov word [orgData], ax
 11084                                  
 11085                                  ;-1277     getfirstchar();
 11086                                  
 11087 00004C11 E890FD                   call getfirstchar
 11088                                  
 11089                                  ;-1278     parse();
 11090                                  
 11091 00004C14 E810FD                   call parse
 11092                                  
 11093                                  ;-1279   checkcalls();
 11094                                  
 11095 00004C17 E885FA                   call checkcalls
 11096                                  
 11097                                  ;-1280   epilog();
 11098                                  
 11099 00004C1A E8BCF7                   call epilog
 11100                                  
 11101                                  ;-1281 }
 11102                                  
 11103                                  
 11104                                  ;-1282 
 11105                                  
 11106                                  
 11107                                  ;-1283 
 11108                                  
 11109                                  
 11110                                  ;-1284 
 11111                                  
 11112                                  
 11113                                  ;-1285 int allocmem(unsigned int i) {
 11114                                  
 11115 00004C1D C3                       ret
 11116 00004C1E 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
 11117 00004C27 2C2041583D00       
 11118 00004C2D 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
 11119 00004C36 6F72792C2041583D00 
 11120                                  ENDP
 11121                                  
 11122                                  allocmem: PROC
 11123                                  
 11124                                  ;-1286     unsigned int vAX; unsigned int vBX;
 11125                                  
 11126                                  
 11127                                  ;-1287     DOS_ERR=0;
 11128                                  
 11129                                  ;Function : allocmem, Number of local variables: 3
 11130                                  ;   # type sign width addr used name   list of local variables
 11131                                  ;  200 var unsg word  1285 NULL i = bp+4
 11132                                  ;  201 var unsg word  1286 NULL vAX = bp-2
 11133                                  ;  202 var unsg word  1286 NULL vBX = bp-4;
 11134 00004C3F C8040000                 ENTER  4,0
 11135 00004C43 B80000                   mov ax, 0
 11136 00004C46 A3[7200]                 mov word [DOS_ERR], ax
 11137                                  
 11138                                  ;-1288     bx=i;
 11139                                  
 11140 00004C49 8B5E04                   mov  bx, [bp+4]
 11141                                  
 11142                                  ;-1289     ax=0x4800;
 11143                                  
 11144 00004C4C B80048                   mov  ax, 18432
 11145                                  
 11146                                  ;-1290     DosInt();
 11147                                  
 11148 00004C4F E880B4                   call DosInt
 11149                                  
 11150                                  ;-1291     asm mov [bp-2], ax; _ vAX=ax;
 11151                                  
 11152 00004C52 8946FE                   mov [bp-2], ax; _ vAX=ax;
 11153                                  
 11154                                  ;-1292     asm mov [bp-4], bx; _ vBX=bx;
 11155                                  
 11156 00004C55 895EFC                   mov [bp-4], bx; _ vBX=bx;
 11157                                  
 11158                                  ;-1293     if(DOS_ERR) return vBX;
 11159                                  
 11160 00004C58 A1[7200]                 mov ax, [DOS_ERR]
 11161 00004C5B 08C0                     or  al, al
 11162 00004C5D 0F840600                 je .allocmem553
 11163 00004C61 8B46FC                   mov ax, [bp-4]
 11164 00004C64 E90600                   jmp .retnallocmem
 11165                                  
 11166                                  ;-1294     return vAX;
 11167                                  
 11168                                  .allocmem553:
 11169 00004C67 8B46FE                   mov ax, [bp-2]
 11170 00004C6A E90000                   jmp .retnallocmem
 11171                                  
 11172                                  ;-1295 }
 11173                                  
 11174                                  
 11175                                  ;-1296 int to_far(char *dest, char *src) {
 11176                                  
 11177 00004C6D C9                       .retnallocmem: LEAVE
 11178 00004C6E C3                       ret
 11179                                  ENDP
 11180                                  
 11181                                  to_far: PROC
 11182                                  
 11183                                  ;-1297   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di
 11184                                  
 11185                                  ;Function : to_far, Number of local variables: 2
 11186                                  ;   # type sign width addr used name   list of local variables
 11187                                  ;  200 ptr sign byte  1296 NULL dest = bp+4
 11188                                  ;  201 ptr sign byte  1296 NULL src = bp+6;
 11189 00004C6F C8000000                 ENTER  0,0
 11190 00004C73 A1[6800]                 mov ax, [segE]
 11191 00004C76 8EC0                     mov  es, ax
 11192 00004C78 8B7606                   mov  si, [bp+6]
 11193 00004C7B 8B7E04                   mov  di, [bp+4]
 11194                                  
 11195                                  ;-1298   asm cld
 11196                                  
 11197 00004C7E FC                       cld
 11198                                  
 11199                                  ;-1299   do{
 11200                                  
 11201                                  .to_far554:
 11202                                  
 11203                                  ;-1300   asm lodsb  ; inc si
 11204                                  
 11205 00004C7F AC                       lodsb  ; inc si
 11206                                  
 11207                                  ;-1301   asm stosb  ; inc di
 11208                                  
 11209 00004C80 AA                       stosb  ; inc di
 11210                                  
 11211                                  ;-1302   } while (al != 0);
 11212                                  
 11213 00004C81 3C00                     cmp  al, 0
 11214 00004C83 0F840200                 je  .to_far555
 11215 00004C87 EBF6                     jmp .to_far554
 11216                                  .to_far555:
 11217                                  
 11218                                  ;-1303 }
 11219                                  
 11220                                  
 11221                                  ;-1304 int from_far(char *dest, char *src) {
 11222 00004C89 C9                       LEAVE
 11223 00004C8A C3                       ret
 11224                                  ENDP
 11225                                  
 11226                                  from_far: PROC
 11227                                  
 11228                                  ;-1305   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di
 11229                                  
 11230                                  ;Function : from_far, Number of local variables: 2
 11231                                  ;   # type sign width addr used name   list of local variables
 11232                                  ;  200 ptr sign byte  1304 NULL dest = bp+4
 11233                                  ;  201 ptr sign byte  1304 NULL src = bp+6;
 11234 00004C8B C8000000                 ENTER  0,0
 11235 00004C8F A1[6800]                 mov ax, [segE]
 11236 00004C92 8EC0                     mov  es, ax
 11237 00004C94 8B7606                   mov  si, [bp+6]
 11238 00004C97 8B7E04                   mov  di, [bp+4]
 11239                                  
 11240                                  ;-1306   do{
 11241                                  
 11242                                  .from_far556:
 11243                                  
 11244                                  ;-1307   asm mov al, [es:si]
 11245                                  
 11246 00004C9A 268A04                   mov al, [es:si]
 11247                                  
 11248                                  ;-1308   asm inc si
 11249                                  
 11250 00004C9D 46                       inc si
 11251                                  
 11252                                  ;-1309   asm mov [di], al
 11253                                  
 11254 00004C9E 8805                     mov [di], al
 11255                                  
 11256                                  ;-1310   asm inc di
 11257                                  
 11258 00004CA0 47                       inc di
 11259                                  
 11260                                  ;-1311   } while (al != 0);
 11261                                  
 11262 00004CA1 3C00                     cmp  al, 0
 11263 00004CA3 0F840200                 je  .from_far557
 11264 00004CA7 EBF1                     jmp .from_far556
 11265                                  .from_far557:
 11266                                  
 11267                                  ;-1312 }
 11268 00004CA9 C9                       LEAVE
 11269 00004CAA C3                       ret
 11270                                  ENDP
 11271                                   
 11272                                  ; missing functions: 
 11273                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 11274                                   
 11275                                  ;   # type sign width  adr used name   list of global variables
 11276                                  
 11277                                  ;    1 arr sign byte     1    2 Version1[12]
 11278                                  ;    2 def unsg byte     2    - IDLENMAX=15
 11279                                  ;    3 def unsg byte     3    - COLUMNMAX=128
 11280                                  ;    4 def unsg byte     4    - T_NAME=256
 11281                                  ;    5 def unsg byte     5    - T_CONST=257
 11282                                  ;    6 def unsg byte     6    - T_STRING=258
 11283                                  ;    7 def unsg byte     7    - T_DEFINE=511
 11284                                  ;    8 def unsg byte     8    - T_RETURN=512
 11285                                  ;    9 def unsg byte     9    - T_IF=513
 11286                                  ;   10 def unsg byte    10    - T_ELSE=514
 11287                                  ;   11 def unsg byte    11    - T_WHILE=515
 11288                                  ;   12 def unsg byte    12    - T_DO=516
 11289                                  ;   13 def unsg byte    13    - T_INT=517
 11290                                  ;   14 def unsg byte    14    - T_ASM=518
 11291                                  ;   15 def unsg byte    15    - T_ASMBLOCK=519
 11292                                  ;   16 def unsg byte    16    - T_EMIT=520
 11293                                  ;   17 def unsg byte    17    - T_GOTO=521
 11294                                  ;   18 def unsg byte    18    - T_VOID=529
 11295                                  ;   19 def unsg byte    19    - T_CHAR=530
 11296                                  ;   20 def unsg byte    20    - T_SIGNED=531
 11297                                  ;   21 def unsg byte    21    - T_UNSIGNED=532
 11298                                  ;   22 def unsg byte    22    - T_LONG=533
 11299                                  ;   23 def unsg byte    23    - T_EQ=806
 11300                                  ;   24 def unsg byte    24    - T_NE=807
 11301                                  ;   25 def unsg byte    25    - T_GE=811
 11302                                  ;   26 def unsg byte    26    - T_LE=824
 11303                                  ;   27 def unsg byte    27    - T_PLUSPLUS=1219
 11304                                  ;   28 def unsg byte    28    - T_MINUSMINUS=1225
 11305                                  ;   29 def unsg byte    29    - T_PLUSASS=1230
 11306                                  ;   30 def unsg byte    30    - T_MINUSASS=1231
 11307                                  ;   31 def unsg byte    31    - T_MULASS=1232
 11308                                  ;   32 def unsg byte    32    - T_DIVASS=1233
 11309                                  ;   33 def unsg byte    33    - T_ANDASS=1234
 11310                                  ;   34 def unsg byte    34    - T_ORASS=1235
 11311                                  ;   35 def unsg byte    35    - T_LESSLESS=1240
 11312                                  ;   36 def unsg byte    36    - T_GREATGREAT=1241
 11313                                  ;   37 var unsg word    38    2 ORGDATAORIG
 11314                                  ;   38 var unsg word    39   10 orgData
 11315                                  ;   39 def unsg byte    40    - COMAX=2000
 11316                                  ;   40 arr sign byte    41    4 co[2000]
 11317                                  ;   41 var sign word    42    4 maxco
 11318                                  ;   42 var sign word    43    3 maxco1
 11319                                  ;   43 def unsg byte    44    - CMDLENMAX=67
 11320                                  ;   44 arr sign byte    45    3 coname[67]
 11321                                  ;   45 arr sign byte    46   97 symbol[128]
 11322                                  ;   46 arr sign byte    47   12 fname[67]
 11323                                  ;   47 arr sign byte    48    8 namein[67]
 11324                                  ;   48 arr sign byte    49    7 namelst[67]
 11325                                  ;   49 ptr sign byte    50    5 cloc
 11326                                  ;   50 var sign word    51    3 fdin
 11327                                  ;   51 var sign word    52    4 fdout
 11328                                  ;   52 var sign word    53   35 token
 11329                                  ;   53 var sign byte    54    1 globC
 11330                                  ;   54 var sign word    55    3 column
 11331                                  ;   55 var sign byte    56   28 thechar
 11332                                  ;   56 var sign word    57    9 iscmp
 11333                                  ;   57 var sign word    58    4 nconst
 11334                                  ;   58 var sign word    59    3 nreturn
 11335                                  ;   59 var sign word    60   12 nlabel
 11336                                  ;   60 var unsg word    61   43 lexval
 11337                                  ;   61 var sign word    62    4 typei
 11338                                  ;   62 var sign byte    62    8 istype
 11339                                  ;   63 var sign word    63    4 signi
 11340                                  ;   64 var sign byte    63    5 issign
 11341                                  ;   65 var sign word    64    9 widthi
 11342                                  ;   66 var sign byte    64   19 iswidth
 11343                                  ;   67 var sign word    65   24 wi
 11344                                  ;   68 def unsg byte    66    - VARMAX=300
 11345                                  ;   69 def unsg byte    67    - LSTART=200
 11346                                  ;   70 def unsg byte    68    - GNAMEMAX=4800
 11347                                  ;   71 arr sign byte    69   11 GType[300]
 11348                                  ;   72 arr sign byte    70    5 GSign[300]
 11349                                  ;   73 arr sign byte    71    5 GWidth[300]
 11350                                  ;   74 arr sign word    72    4 GAdr[300]
 11351                                  ;   75 arr sign word    73    6 GUsed[300]
 11352                                  ;   76 arr sign word    74   11 GData[300]
 11353                                  ;   77 arr sign byte    75    2 GNameField[4800]
 11354                                  ;   78 var sign word    76   24 GTop
 11355                                  ;   79 var sign word    77   20 LTop
 11356                                  ;   80 def unsg byte    78    - FUNCMAX=300
 11357                                  ;   81 def unsg byte    79    - FNAMEMAX=4800
 11358                                  ;   82 arr sign byte    80    2 FType[300]
 11359                                  ;   83 arr sign word    81    2 FAdr[300]
 11360                                  ;   84 arr sign word    82    4 FCalls[300]
 11361                                  ;   85 arr sign byte    83    5 FNameField[4800]
 11362                                  ;   86 var sign word    84   13 FTop
 11363                                  ;   87 def unsg byte    85    - CALLMAX=1500
 11364                                  ;   88 arr sign byte    86    4 CType[1500]
 11365                                  ;   89 arr sign word    87    5 CAdr[1500]
 11366                                  ;   90 def unsg byte    88    - CNAMEMAX=10000
 11367                                  ;   91 arr sign byte    89    2 CNameField[10016]
 11368                                  ;   92 ptr sign byte    90    6 CNamePtr
 11369                                  ;   93 ptr unsg byte    91    9 CNameTop
 11370                                  ;   94 var sign word    92   13 CTop
 11371                                  ;   95 arr sign byte    95    7 NameA[32]
 11372                                  ;   96 arr sign byte    96    5 fgetsdest[128]
 11373                                  ;   97 ptr unsg byte    97   10 fgetsp
 11374                                  ;   98 var unsg word    98    3 segE
 11375                                  ;   99 var unsg word    99    9 lineno
 11376                                  ;  100 var unsg word   100 NULL linenoinclude
 11377                                  ;  101 ptr unsg byte   101   17 pt
 11378                                  ;  102 ptr unsg byte   102    8 p1
 11379                                  ;  103 var sign word   103    8 DOS_ERR
 11380                                  ;  104 var sign word   104    3 DOS_NoBytes
 11381                                  ;  105 var sign byte   105    3 DOS_ByteRead
 11382                                  ;  106 arr sign byte   320    2 doglobName[15]
 11383                                  ;  107 var sign word   503    5 ireg1
 11384                                  ;  108 var sign word   504    2 mod2
 11385                                  ;  109 var sign word   504    3 ireg2
 11386                                  ;  110 arr sign byte   525    9 ops[5]
 11387                                  ;  111 arr sign byte   568    3 printregstr[74]
 11388                                  ;  112 var sign word   575    1 evalue
 11389                                  ;  113 var sign word   575    1 exprtype
 11390                                  ;  114 arr sign word   729    2 docalltype[10]
 11391                                  ;  115 arr sign word   729    2 docallvalue[10]
 11392                                  ;  116 arr sign byte   730    2 procname[17]
 11393                                  ;  117 arr sign byte   812    2 symboltemp[80]
 11394                                  ;  118 var unsg word  1114    1 MAXUI
 11395                                  ;  119 ptr sign byte  1220    1 arglen
 11396                                  ;  120 ptr sign byte  1220    2 argv
 11397                                  
 11398                                  
 11399                                  ;   # Calls Line Width  Name   list of functions
 11400                                  
 11401                                  ;    0    4  108   writetty
 11402                                  ;    1    1  109   putch
 11403                                  ;    2    6  110   cputs
 11404                                  ;    3    3  111   mkneg
 11405                                  ;    4    8  113   DosInt
 11406                                  ;    5    1  118   openR
 11407                                  ;    6    1  119   creatR
 11408                                  ;    7    2  120   fcloseR
 11409                                  ;    8    4  121   exitR
 11410                                  ;    9    1  122   readRL
 11411                                  ;   10    1  124   fputcR
 11412                                  ;   11    1  127   letter
 11413                                  ;   12    3  137   digit
 11414                                  ;   13    3  142   alnum
 11415                                  ;   14    8  148   strlen
 11416                                  ;   15   23  153   strcpy
 11417                                  ;   16   71  159   eqstr
 11418                                  ;   17    1  167   strcat1
 11419                                  ;   18    1  171   toupper
 11420                                  ;   19    2  177   instr1
 11421                                  ;   20    3  186   a
 11422                                  ;   21   18  188   v
 11423                                  ;   22    4  193   checknamelen
 11424                                  ;   23   32  199   next
 11425                                  ;   24   75  206   istoken
 11426                                  ;   25   36  213   expect
 11427                                  ;   26    6  224   eprc
 11428                                  ;   27    5  228   eprs
 11429                                  ;   28   40  236   prc
 11430                                  ;   29    3  245   prscomment
 11431                                  ;   30    7  253   prnl
 11432                                  ;   31  216  257   prs
 11433                                  ;   32    2  276   eprnum
 11434                                  ;   33    7  290   pint1
 11435                                  ;   34   32  301   prunsign1
 11436                                  ;   35   20  311   printint51
 11437                                  ;   36    1  321   doglob
 11438                                  ;   37   10  371   gettypes
 11439                                  ;   38    7  380   adrofname
 11440                                  ;   39    7  381   adrF
 11441                                  ;   40    4  383   printName
 11442                                  ;   41   10  387   searchname
 11443                                  ;   42    3  391   checkName
 11444                                  ;   43    8  396   typeName
 11445                                  ;   44    3  412   name1
 11446                                  ;   45 NULL  417   storeCall1
 11447                                  ;   46    1  430   storecall
 11448                                  ;   47    1  436   storefunc
 11449                                  ;   48    2  440   addlocal
 11450                                  ;   49    1  446   checkFunction
 11451                                  ;   50    1  450   dofunc
 11452                                  ;   51    1  493   isvariable
 11453                                  ;   52    3  506   pexpr
 11454                                  ;   53    1  514   constantexpr
 11455                                  ;   54    2  526   doreg1
 11456                                  ;   55    4  545   checkreg
 11457                                  ;   56    3  570   printreg
 11458                                  ;   57    4  576   expr
 11459                                  ;   58    4  625   compoundass
 11460                                  ;   59    2  632   dovar1
 11461                                  ;   60    8  653   rterm
 11462                                  ;   61    1  666   isreg
 11463                                  ;   62   15  684   doreg
 11464                                  ;   63    1  690   doassign
 11465                                  ;   64    1  708   domul
 11466                                  ;   65    2  714   doidiv
 11467                                  ;   66    1  727   domod
 11468                                  ;   67    1  731   docall1
 11469                                  ;   68    1  774   doemit
 11470                                  ;   69    3  778   cmpneg
 11471                                  ;   70    7  791   prlabel
 11472                                  ;   71    3  792   prjump
 11473                                  ;   72    1  793   doif
 11474                                  ;   73    1  799   dodo
 11475                                  ;   74    1  803   dowhile
 11476                                  ;   75    3  806   isrelational
 11477                                  ;   76   13  813   getlex
 11478                                  ;   77    1  864   convertdefine
 11479                                  ;   78    1  872   getdigit
 11480                                  ;   79    6  882   stmt
 11481                                  ;   80    1  914   getstring
 11482                                  ;   81    2  926   fgets1
 11483                                  ;   82    1  940   printinputline
 11484                                  ;   83    1  962   ifEOL
 11485                                  ;   84    2  971   end1
 11486                                  ;   85   43  976   error1
 11487                                  ;   86    2  996   listproc
 11488                                  ;   87    1 1012   listcall
 11489                                  ;   88    1 1021   calllisting
 11490                                  ;   89    1 1034   countcalls
 11491                                  ;   90    1 1045   listfunc
 11492                                  ;   91    1 1059   funclisting
 11493                                  ;   92    2 1078   listvar
 11494                                  ;   93    1 1115   epilog
 11495                                  ;   94    1 1145   checkcalls
 11496                                  ;   95    1 1172   dodefine
 11497                                  ;   96    1 1198   parse
 11498                                  ;   97    1 1214   getfirstchar
 11499                                  ;   98    1 1221   getarg
 11500                                  ;   99    1 1260   setblock
 11501                                  ;  100 NULL 1268   main
 11502                                  ;  101    1 1285   allocmem
 11503                                  ;  102    1 1296   to_far
 11504                                  ;  103    3 1304   from_far
 11505                                  
 11506                                  ;    #  addr name   list of CALLs
 11507                                  
 11508                                  ;    0     0 writetty
 11509                                  ;    1     9 writetty
 11510                                  ;    2    18 putch
 11511                                  ;    3    24 DosInt
 11512                                  ;    4    31 DosInt
 11513                                  ;    5    38 DosInt
 11514                                  ;    6    45 DosInt
 11515                                  ;    7    52 DosInt
 11516                                  ;    8    59 DosInt
 11517                                  ;    9    66 digit
 11518                                  ;   10    72 letter
 11519                                  ;   11    79 strcpy
 11520                                  ;   12    86 printName
 11521                                  ;   13    96 prc
 11522                                  ;   14   100 printName
 11523                                  ;   15   110 prc
 11524                                  ;   16   114 strlen
 11525                                  ;   17   121 error1
 11526                                  ;   18   128 fgets1
 11527                                  ;   19   135 getlex
 11528                                  ;   20   142 istoken
 11529                                  ;   21   150 prs
 11530                                  ;   22   154 listproc
 11531                                  ;   23   163 prs
 11532                                  ;   24   167 pint1
 11533                                  ;   25   173 error1
 11534                                  ;   26   180 eprc
 11535                                  ;   27   185 writetty
 11536                                  ;   28   194 writetty
 11537                                  ;   29   203 fputcR
 11538                                  ;   30   210 prc
 11539                                  ;   31   214 prs
 11540                                  ;   32   218 prc
 11541                                  ;   33   222 eprc
 11542                                  ;   34   227 mkneg
 11543                                  ;   35   233 eprnum
 11544                                  ;   36   240 eprc
 11545                                  ;   37   245 prc
 11546                                  ;   38   249 mkneg
 11547                                  ;   39   255 pint1
 11548                                  ;   40   261 prc
 11549                                  ;   41   265 prunsign1
 11550                                  ;   42   275 prc
 11551                                  ;   43   279 prc
 11552                                  ;   44   283 prc
 11553                                  ;   45   287 prc
 11554                                  ;   46   291 prc
 11555                                  ;   47   295 prunsign1
 11556                                  ;   48   305 error1
 11557                                  ;   49   312 error1
 11558                                  ;   50   319 checknamelen
 11559                                  ;   51   332 checkName
 11560                                  ;   52   342 error1
 11561                                  ;   53   349 istoken
 11562                                  ;   54   357 istoken
 11563                                  ;   55   365 prs
 11564                                  ;   56   369 prunsign1
 11565                                  ;   57   379 prs
 11566                                  ;   58   383 prs
 11567                                  ;   59   387 prs
 11568                                  ;   60   391 prs
 11569                                  ;   61   395 prs
 11570                                  ;   62   399 prunsign1
 11571                                  ;   63   409 prs
 11572                                  ;   64   413 expect
 11573                                  ;   65   420 expect
 11574                                  ;   66   427 error1
 11575                                  ;   67   434 prs
 11576                                  ;   68   438 prs
 11577                                  ;   69   442 prs
 11578                                  ;   70   446 strcpy
 11579                                  ;   71   453 expect
 11580                                  ;   72   460 istoken
 11581                                  ;   73   468 prc
 11582                                  ;   74   472 prscomment
 11583                                  ;   75   483 prc
 11584                                  ;   76   487 prs
 11585                                  ;   77   491 strlen
 11586                                  ;   78   498 istoken
 11587                                  ;   79   506 prc
 11588                                  ;   80   510 expect
 11589                                  ;   81   517 prunsign1
 11590                                  ;   82   527 istoken
 11591                                  ;   83   535 expect
 11592                                  ;   84   542 error1
 11593                                  ;   85   549 prs
 11594                                  ;   86   553 prs
 11595                                  ;   87   557 prs
 11596                                  ;   88   561 prs
 11597                                  ;   89   565 prs
 11598                                  ;   90   569 prs
 11599                                  ;   91   573 istoken
 11600                                  ;   92   581 prc
 11601                                  ;   93   585 istoken
 11602                                  ;   94   593 expect
 11603                                  ;   95   600 prunsign1
 11604                                  ;   96   610 prunsign1
 11605                                  ;   97   620 adrofname
 11606                                  ;   98   630 strcpy
 11607                                  ;   99   637 strcpy
 11608                                  ;  100   644 expect
 11609                                  ;  101   651 adrF
 11610                                  ;  102   656 adrofname
 11611                                  ;  103   666 prs
 11612                                  ;  104   670 prs
 11613                                  ;  105   674 prc
 11614                                  ;  106   678 pint1
 11615                                  ;  107   684 prc
 11616                                  ;  108   688 checkName
 11617                                  ;  109   698 error1
 11618                                  ;  110   705 adrofname
 11619                                  ;  111   715 eqstr
 11620                                  ;  112   721 adrofname
 11621                                  ;  113   731 eqstr
 11622                                  ;  114   737 istoken
 11623                                  ;  115   745 istoken
 11624                                  ;  116   753 istoken
 11625                                  ;  117   761 istoken
 11626                                  ;  118   769 istoken
 11627                                  ;  119   777 istoken
 11628                                  ;  120   785 istoken
 11629                                  ;  121   793 istoken
 11630                                  ;  122   801 name1
 11631                                  ;  123   807 error1
 11632                                  ;  124   814 getlex
 11633                                  ;  125   821 error1
 11634                                  ;  126   828 error1
 11635                                  ;  127   835 strcpy
 11636                                  ;  128   842 error1
 11637                                  ;  129   849 error1
 11638                                  ;  130   856 strlen
 11639                                  ;  131   863 to_far
 11640                                  ;  132   870 error1
 11641                                  ;  133   877 adrF
 11642                                  ;  134   882 strcpy
 11643                                  ;  135   889 error1
 11644                                  ;  136   896 checkName
 11645                                  ;  137   906 error1
 11646                                  ;  138   913 adrF
 11647                                  ;  139   918 strcpy
 11648                                  ;  140   925 adrF
 11649                                  ;  141   930 eqstr
 11650                                  ;  142   936 checknamelen
 11651                                  ;  143   949 strcpy
 11652                                  ;  144   956 checkFunction
 11653                                  ;  145   970 error1
 11654                                  ;  146   977 storefunc
 11655                                  ;  147   987 prs
 11656                                  ;  148   991 prs
 11657                                  ;  149   995 prs
 11658                                  ;  150   999 expect
 11659                                  ;  151  1006 istoken
 11660                                  ;  152  1014 typeName
 11661                                  ;  153  1023 addlocal
 11662                                  ;  154  1032 istoken
 11663                                  ;  155  1040 expect
 11664                                  ;  156  1047 expect
 11665                                  ;  157  1054 isvariable
 11666                                  ;  158  1065 typeName
 11667                                  ;  159  1074 checknamelen
 11668                                  ;  160  1087 addlocal
 11669                                  ;  161  1096 istoken
 11670                                  ;  162  1104 expect
 11671                                  ;  163  1111 expect
 11672                                  ;  164  1118 istoken
 11673                                  ;  165  1126 expect
 11674                                  ;  166  1133 listproc
 11675                                  ;  167  1142 prs
 11676                                  ;  168  1146 mkneg
 11677                                  ;  169  1152 prunsign1
 11678                                  ;  170  1162 prs
 11679                                  ;  171  1166 istoken
 11680                                  ;  172  1174 stmt
 11681                                  ;  173  1179 prs
 11682                                  ;  174  1183 prs
 11683                                  ;  175  1187 prc
 11684                                  ;  176  1191 prs
 11685                                  ;  177  1195 prs
 11686                                  ;  178  1199 prs
 11687                                  ;  179  1203 strlen
 11688                                  ;  180  1210 strcpy
 11689                                  ;  181  1217 prs
 11690                                  ;  182  1221 expect
 11691                                  ;  183  1228 eqstr
 11692                                  ;  184  1234 constantexpr
 11693                                  ;  185  1247 checkreg
 11694                                  ;  186  1256 doreg1
 11695                                  ;  187  1263 expr
 11696                                  ;  188  1268 prs
 11697                                  ;  189  1272 prs
 11698                                  ;  190  1276 expect
 11699                                  ;  191  1283 getlex
 11700                                  ;  192  1290 typeName
 11701                                  ;  193  1299 searchname
 11702                                  ;  194  1310 gettypes
 11703                                  ;  195  1319 isrelational
 11704                                  ;  196  1332 error1
 11705                                  ;  197  1339 expect
 11706                                  ;  198  1346 prs
 11707                                  ;  199  1350 prs
 11708                                  ;  200  1354 gettypes
 11709                                  ;  201  1363 prs
 11710                                  ;  202  1367 prs
 11711                                  ;  203  1371 v
 11712                                  ;  204  1373 prs
 11713                                  ;  205  1377 prunsign1
 11714                                  ;  206  1387 cmpneg
 11715                                  ;  207  1394 prs
 11716                                  ;  208  1398 expect
 11717                                  ;  209  1405 istoken
 11718                                  ;  210  1413 strcpy
 11719                                  ;  211  1420 istoken
 11720                                  ;  212  1428 strcpy
 11721                                  ;  213  1435 istoken
 11722                                  ;  214  1443 strcpy
 11723                                  ;  215  1450 istoken
 11724                                  ;  216  1458 strcpy
 11725                                  ;  217  1465 istoken
 11726                                  ;  218  1473 strcpy
 11727                                  ;  219  1480 istoken
 11728                                  ;  220  1488 strcpy
 11729                                  ;  221  1495 istoken
 11730                                  ;  222  1503 strcpy
 11731                                  ;  223  1510 getlex
 11732                                  ;  224  1517 isrelational
 11733                                  ;  225  1530 error1
 11734                                  ;  226  1537 strcpy
 11735                                  ;  227  1544 prnl
 11736                                  ;  228  1549 prs
 11737                                  ;  229  1553 prs
 11738                                  ;  230  1557 printreg
 11739                                  ;  231  1566 prs
 11740                                  ;  232  1570 istoken
 11741                                  ;  233  1578 prunsign1
 11742                                  ;  234  1588 typeName
 11743                                  ;  235  1597 checkreg
 11744                                  ;  236  1606 printreg
 11745                                  ;  237  1615 searchname
 11746                                  ;  238  1626 a
 11747                                  ;  239  1628 v
 11748                                  ;  240  1630 cmpneg
 11749                                  ;  241  1637 prs
 11750                                  ;  242  1641 expect
 11751                                  ;  243  1648 strlen
 11752                                  ;  244  1655 eqstr
 11753                                  ;  245  1661 eqstr
 11754                                  ;  246  1667 eqstr
 11755                                  ;  247  1673 eqstr
 11756                                  ;  248  1679 eqstr
 11757                                  ;  249  1685 eqstr
 11758                                  ;  250  1691 eqstr
 11759                                  ;  251  1697 eqstr
 11760                                  ;  252  1703 eqstr
 11761                                  ;  253  1709 eqstr
 11762                                  ;  254  1715 eqstr
 11763                                  ;  255  1721 eqstr
 11764                                  ;  256  1727 eqstr
 11765                                  ;  257  1733 eqstr
 11766                                  ;  258  1739 eqstr
 11767                                  ;  259  1745 eqstr
 11768                                  ;  260  1751 eqstr
 11769                                  ;  261  1757 eqstr
 11770                                  ;  262  1763 eqstr
 11771                                  ;  263  1769 eqstr
 11772                                  ;  264  1775 eqstr
 11773                                  ;  265  1781 eqstr
 11774                                  ;  266  1787 strlen
 11775                                  ;  267  1794 eqstr
 11776                                  ;  268  1800 eqstr
 11777                                  ;  269  1806 eqstr
 11778                                  ;  270  1812 eqstr
 11779                                  ;  271  1818 eqstr
 11780                                  ;  272  1824 eqstr
 11781                                  ;  273  1830 eqstr
 11782                                  ;  274  1836 eqstr
 11783                                  ;  275  1842 eqstr
 11784                                  ;  276  1848 prc
 11785                                  ;  277  1852 prc
 11786                                  ;  278  1856 prc
 11787                                  ;  279  1860 istoken
 11788                                  ;  280  1868 prs
 11789                                  ;  281  1872 prunsign1
 11790                                  ;  282  1882 typeName
 11791                                  ;  283  1891 checkreg
 11792                                  ;  284  1900 doreg1
 11793                                  ;  285  1907 docall1
 11794                                  ;  286  1915 isreg
 11795                                  ;  287  1921 searchname
 11796                                  ;  288  1932 gettypes
 11797                                  ;  289  1941 istoken
 11798                                  ;  290  1949 istoken
 11799                                  ;  291  1957 expect
 11800                                  ;  292  1964 searchname
 11801                                  ;  293  1975 expect
 11802                                  ;  294  1982 expect
 11803                                  ;  295  1989 gettypes
 11804                                  ;  296  1998 error1
 11805                                  ;  297  2005 istoken
 11806                                  ;  298  2013 error1
 11807                                  ;  299  2020 prs
 11808                                  ;  300  2024 prs
 11809                                  ;  301  2028 prs
 11810                                  ;  302  2032 v
 11811                                  ;  303  2034 istoken
 11812                                  ;  304  2042 error1
 11813                                  ;  305  2049 prs
 11814                                  ;  306  2053 prs
 11815                                  ;  307  2057 prs
 11816                                  ;  308  2061 v
 11817                                  ;  309  2063 istoken
 11818                                  ;  310  2071 compoundass
 11819                                  ;  311  2083 istoken
 11820                                  ;  312  2091 compoundass
 11821                                  ;  313  2103 istoken
 11822                                  ;  314  2111 compoundass
 11823                                  ;  315  2123 istoken
 11824                                  ;  316  2131 compoundass
 11825                                  ;  317  2143 istoken
 11826                                  ;  318  2151 error1
 11827                                  ;  319  2158 istoken
 11828                                  ;  320  2166 error1
 11829                                  ;  321  2173 istoken
 11830                                  ;  322  2181 expr
 11831                                  ;  323  2186 doassign
 11832                                  ;  324  2195 dovar1
 11833                                  ;  325  2202 istoken
 11834                                  ;  326  2210 rterm
 11835                                  ;  327  2216 istoken
 11836                                  ;  328  2224 rterm
 11837                                  ;  329  2230 istoken
 11838                                  ;  330  2238 rterm
 11839                                  ;  331  2244 istoken
 11840                                  ;  332  2252 rterm
 11841                                  ;  333  2258 istoken
 11842                                  ;  334  2266 rterm
 11843                                  ;  335  2272 istoken
 11844                                  ;  336  2280 rterm
 11845                                  ;  337  2286 istoken
 11846                                  ;  338  2294 domul
 11847                                  ;  339  2300 istoken
 11848                                  ;  340  2308 doidiv
 11849                                  ;  341  2315 istoken
 11850                                  ;  342  2323 domod
 11851                                  ;  343  2329 isrelational
 11852                                  ;  344  2342 rterm
 11853                                  ;  345  2348 cmpneg
 11854                                  ;  346  2355 error1
 11855                                  ;  347  2362 prnl
 11856                                  ;  348  2367 prs
 11857                                  ;  349  2371 prs
 11858                                  ;  350  2375 gettypes
 11859                                  ;  351  2384 prs
 11860                                  ;  352  2388 prs
 11861                                  ;  353  2392 v
 11862                                  ;  354  2394 prs
 11863                                  ;  355  2398 expect
 11864                                  ;  356  2405 prunsign1
 11865                                  ;  357  2415 gettypes
 11866                                  ;  358  2424 prs
 11867                                  ;  359  2428 v
 11868                                  ;  360  2430 prnl
 11869                                  ;  361  2435 prs
 11870                                  ;  362  2439 prs
 11871                                  ;  363  2443 prs
 11872                                  ;  364  2447 prnl
 11873                                  ;  365  2452 prs
 11874                                  ;  366  2456 prs
 11875                                  ;  367  2460 a
 11876                                  ;  368  2462 prs
 11877                                  ;  369  2466 v
 11878                                  ;  370  2468 prs
 11879                                  ;  371  2472 prs
 11880                                  ;  372  2476 prs
 11881                                  ;  373  2480 prs
 11882                                  ;  374  2484 prs
 11883                                  ;  375  2488 prc
 11884                                  ;  376  2492 printName
 11885                                  ;  377  2502 prs
 11886                                  ;  378  2506 prnl
 11887                                  ;  379  2511 prs
 11888                                  ;  380  2515 prs
 11889                                  ;  381  2519 prs
 11890                                  ;  382  2523 prs
 11891                                  ;  383  2527 v
 11892                                  ;  384  2529 istoken
 11893                                  ;  385  2537 prnl
 11894                                  ;  386  2542 prs
 11895                                  ;  387  2546 prs
 11896                                  ;  388  2550 prs
 11897                                  ;  389  2554 prs
 11898                                  ;  390  2558 prunsign1
 11899                                  ;  391  2568 typeName
 11900                                  ;  392  2577 searchname
 11901                                  ;  393  2588 istoken
 11902                                  ;  394  2596 searchname
 11903                                  ;  395  2607 expect
 11904                                  ;  396  2614 expect
 11905                                  ;  397  2621 gettypes
 11906                                  ;  398  2630 error1
 11907                                  ;  399  2637 eqstr
 11908                                  ;  400  2643 dovar1
 11909                                  ;  401  2650 eqstr
 11910                                  ;  402  2656 doreg
 11911                                  ;  403  2662 eqstr
 11912                                  ;  404  2668 doreg
 11913                                  ;  405  2674 eqstr
 11914                                  ;  406  2680 doreg
 11915                                  ;  407  2686 eqstr
 11916                                  ;  408  2692 doreg
 11917                                  ;  409  2698 eqstr
 11918                                  ;  410  2704 doreg
 11919                                  ;  411  2710 eqstr
 11920                                  ;  412  2716 doreg
 11921                                  ;  413  2722 eqstr
 11922                                  ;  414  2728 doreg
 11923                                  ;  415  2734 eqstr
 11924                                  ;  416  2740 doreg
 11925                                  ;  417  2746 eqstr
 11926                                  ;  418  2752 doreg
 11927                                  ;  419  2758 eqstr
 11928                                  ;  420  2764 doreg
 11929                                  ;  421  2770 eqstr
 11930                                  ;  422  2776 doreg
 11931                                  ;  423  2782 eqstr
 11932                                  ;  424  2788 doreg
 11933                                  ;  425  2794 eqstr
 11934                                  ;  426  2800 doreg
 11935                                  ;  427  2806 eqstr
 11936                                  ;  428  2812 doreg
 11937                                  ;  429  2818 eqstr
 11938                                  ;  430  2824 doreg
 11939                                  ;  431  2830 expect
 11940                                  ;  432  2837 prs
 11941                                  ;  433  2841 prs
 11942                                  ;  434  2845 prs
 11943                                  ;  435  2849 istoken
 11944                                  ;  436  2857 prunsign1
 11945                                  ;  437  2867 istoken
 11946                                  ;  438  2875 searchname
 11947                                  ;  439  2886 v
 11948                                  ;  440  2888 error1
 11949                                  ;  441  2895 gettypes
 11950                                  ;  442  2904 prs
 11951                                  ;  443  2908 v
 11952                                  ;  444  2910 prs
 11953                                  ;  445  2914 prs
 11954                                  ;  446  2918 prs
 11955                                  ;  447  2922 a
 11956                                  ;  448  2924 prs
 11957                                  ;  449  2928 prs
 11958                                  ;  450  2932 prunsign1
 11959                                  ;  451  2942 v
 11960                                  ;  452  2944 prs
 11961                                  ;  453  2948 prs
 11962                                  ;  454  2952 printName
 11963                                  ;  455  2962 prs
 11964                                  ;  456  2966 prs
 11965                                  ;  457  2970 prs
 11966                                  ;  458  2974 prs
 11967                                  ;  459  2978 v
 11968                                  ;  460  2980 prs
 11969                                  ;  461  2984 prs
 11970                                  ;  462  2988 prs
 11971                                  ;  463  2992 v
 11972                                  ;  464  2994 prs
 11973                                  ;  465  2998 prs
 11974                                  ;  466  3002 prs
 11975                                  ;  467  3006 v
 11976                                  ;  468  3008 prs
 11977                                  ;  469  3012 rterm
 11978                                  ;  470  3018 istoken
 11979                                  ;  471  3026 prs
 11980                                  ;  472  3030 prunsign1
 11981                                  ;  473  3040 prs
 11982                                  ;  474  3044 error1
 11983                                  ;  475  3051 istoken
 11984                                  ;  476  3059 prs
 11985                                  ;  477  3063 prunsign1
 11986                                  ;  478  3073 prs
 11987                                  ;  479  3077 prs
 11988                                  ;  480  3081 typeName
 11989                                  ;  481  3090 searchname
 11990                                  ;  482  3101 error1
 11991                                  ;  483  3108 gettypes
 11992                                  ;  484  3117 error1
 11993                                  ;  485  3124 error1
 11994                                  ;  486  3131 prs
 11995                                  ;  487  3135 v
 11996                                  ;  488  3137 prs
 11997                                  ;  489  3141 prs
 11998                                  ;  490  3145 doidiv
 11999                                  ;  491  3152 prs
 12000                                  ;  492  3156 checknamelen
 12001                                  ;  493  3169 strcpy
 12002                                  ;  494  3176 storecall
 12003                                  ;  495  3186 expect
 12004                                  ;  496  3193 istoken
 12005                                  ;  497  3201 error1
 12006                                  ;  498  3208 istoken
 12007                                  ;  499  3216 istoken
 12008                                  ;  500  3224 eprs
 12009                                  ;  501  3229 eprs
 12010                                  ;  502  3234 eprc
 12011                                  ;  503  3239 eprnum
 12012                                  ;  504  3246 eprs
 12013                                  ;  505  3251 eprc
 12014                                  ;  506  3256 eprs
 12015                                  ;  507  3261 eprc
 12016                                  ;  508  3266 eprs
 12017                                  ;  509  3271 istoken
 12018                                  ;  510  3279 name1
 12019                                  ;  511  3285 searchname
 12020                                  ;  512  3296 istoken
 12021                                  ;  513  3304 checkreg
 12022                                  ;  514  3313 searchname
 12023                                  ;  515  3324 error1
 12024                                  ;  516  3331 istoken
 12025                                  ;  517  3339 expect
 12026                                  ;  518  3346 prs
 12027                                  ;  519  3350 prunsign1
 12028                                  ;  520  3360 prs
 12029                                  ;  521  3364 prs
 12030                                  ;  522  3368 prc
 12031                                  ;  523  3372 prunsign1
 12032                                  ;  524  3382 prs
 12033                                  ;  525  3386 v
 12034                                  ;  526  3388 prs
 12035                                  ;  527  3392 gettypes
 12036                                  ;  528  3401 prs
 12037                                  ;  529  3405 v
 12038                                  ;  530  3407 prs
 12039                                  ;  531  3411 v
 12040                                  ;  532  3413 prs
 12041                                  ;  533  3417 prs
 12042                                  ;  534  3421 printreg
 12043                                  ;  535  3430 prs
 12044                                  ;  536  3434 prs
 12045                                  ;  537  3438 prs
 12046                                  ;  538  3442 prunsign1
 12047                                  ;  539  3452 prs
 12048                                  ;  540  3456 getlex
 12049                                  ;  541  3463 prunsign1
 12050                                  ;  542  3473 getlex
 12051                                  ;  543  3480 prc
 12052                                  ;  544  3484 expect
 12053                                  ;  545  3491 prs
 12054                                  ;  546  3495 prs
 12055                                  ;  547  3499 prs
 12056                                  ;  548  3503 prs
 12057                                  ;  549  3507 prs
 12058                                  ;  550  3511 prunsign1
 12059                                  ;  551  3521 prs
 12060                                  ;  552  3525 prs
 12061                                  ;  553  3529 prunsign1
 12062                                  ;  554  3539 prs
 12063                                  ;  555  3543 prs
 12064                                  ;  556  3547 prs
 12065                                  ;  557  3551 error1
 12066                                  ;  558  3558 prs
 12067                                  ;  559  3562 prs
 12068                                  ;  560  3566 prunsign1
 12069                                  ;  561  3576 prc
 12070                                  ;  562  3580 prs
 12071                                  ;  563  3584 prs
 12072                                  ;  564  3588 prunsign1
 12073                                  ;  565  3598 pexpr
 12074                                  ;  566  3604 pint1
 12075                                  ;  567  3610 stmt
 12076                                  ;  568  3615 istoken
 12077                                  ;  569  3623 prjump
 12078                                  ;  570  3630 prlabel
 12079                                  ;  571  3638 stmt
 12080                                  ;  572  3643 prlabel
 12081                                  ;  573  3651 prlabel
 12082                                  ;  574  3659 prlabel
 12083                                  ;  575  3667 stmt
 12084                                  ;  576  3672 expect
 12085                                  ;  577  3679 pexpr
 12086                                  ;  578  3685 pint1
 12087                                  ;  579  3691 prjump
 12088                                  ;  580  3698 prlabel
 12089                                  ;  581  3706 prlabel
 12090                                  ;  582  3714 pexpr
 12091                                  ;  583  3720 pint1
 12092                                  ;  584  3726 stmt
 12093                                  ;  585  3731 prjump
 12094                                  ;  586  3738 prlabel
 12095                                  ;  587  3746 getlex
 12096                                  ;  588  3753 next
 12097                                  ;  589  3758 next
 12098                                  ;  590  3763 next
 12099                                  ;  591  3768 next
 12100                                  ;  592  3773 next
 12101                                  ;  593  3778 next
 12102                                  ;  594  3783 next
 12103                                  ;  595  3788 next
 12104                                  ;  596  3793 next
 12105                                  ;  597  3798 next
 12106                                  ;  598  3803 next
 12107                                  ;  599  3808 next
 12108                                  ;  600  3813 next
 12109                                  ;  601  3818 next
 12110                                  ;  602  3823 next
 12111                                  ;  603  3828 instr1
 12112                                  ;  604  3835 next
 12113                                  ;  605  3840 ifEOL
 12114                                  ;  606  3846 getlex
 12115                                  ;  607  3853 next
 12116                                  ;  608  3858 next
 12117                                  ;  609  3863 getlex
 12118                                  ;  610  3870 getstring
 12119                                  ;  611  3880 digit
 12120                                  ;  612  3886 getdigit
 12121                                  ;  613  3895 next
 12122                                  ;  614  3900 next
 12123                                  ;  615  3905 next
 12124                                  ;  616  3910 alnum
 12125                                  ;  617  3916 strcpy
 12126                                  ;  618  3923 alnum
 12127                                  ;  619  3929 next
 12128                                  ;  620  3934 eqstr
 12129                                  ;  621  3940 eqstr
 12130                                  ;  622  3946 eqstr
 12131                                  ;  623  3952 eqstr
 12132                                  ;  624  3958 eqstr
 12133                                  ;  625  3964 eqstr
 12134                                  ;  626  3970 eqstr
 12135                                  ;  627  3976 eqstr
 12136                                  ;  628  3982 eqstr
 12137                                  ;  629  3988 eqstr
 12138                                  ;  630  3994 eqstr
 12139                                  ;  631  4000 eqstr
 12140                                  ;  632  4006 eqstr
 12141                                  ;  633  4012 eqstr
 12142                                  ;  634  4018 eqstr
 12143                                  ;  635  4024 eqstr
 12144                                  ;  636  4030 convertdefine
 12145                                  ;  637  4044 strcpy
 12146                                  ;  638  4051 error1
 12147                                  ;  639  4058 adrofname
 12148                                  ;  640  4068 eqstr
 12149                                  ;  641  4074 next
 12150                                  ;  642  4079 alnum
 12151                                  ;  643  4085 next
 12152                                  ;  644  4090 digit
 12153                                  ;  645  4096 next
 12154                                  ;  646  4101 istoken
 12155                                  ;  647  4109 istoken
 12156                                  ;  648  4117 stmt
 12157                                  ;  649  4122 istoken
 12158                                  ;  650  4130 doif
 12159                                  ;  651  4135 istoken
 12160                                  ;  652  4143 dodo
 12161                                  ;  653  4148 istoken
 12162                                  ;  654  4156 dowhile
 12163                                  ;  655  4164 istoken
 12164                                  ;  656  4172 prs
 12165                                  ;  657  4176 name1
 12166                                  ;  658  4182 prs
 12167                                  ;  659  4186 expect
 12168                                  ;  660  4193 prs
 12169                                  ;  661  4197 next
 12170                                  ;  662  4202 prc
 12171                                  ;  663  4206 next
 12172                                  ;  664  4211 getlex
 12173                                  ;  665  4218 istoken
 12174                                  ;  666  4226 prs
 12175                                  ;  667  4230 next
 12176                                  ;  668  4235 prc
 12177                                  ;  669  4239 next
 12178                                  ;  670  4244 getlex
 12179                                  ;  671  4251 error1
 12180                                  ;  672  4258 istoken
 12181                                  ;  673  4266 doemit
 12182                                  ;  674  4273 istoken
 12183                                  ;  675  4281 istoken
 12184                                  ;  676  4289 expr
 12185                                  ;  677  4294 prs
 12186                                  ;  678  4298 prs
 12187                                  ;  679  4302 expect
 12188                                  ;  680  4309 prs
 12189                                  ;  681  4313 prs
 12190                                  ;  682  4317 prc
 12191                                  ;  683  4321 expect
 12192                                  ;  684  4328 expect
 12193                                  ;  685  4335 expr
 12194                                  ;  686  4340 expect
 12195                                  ;  687  4347 next
 12196                                  ;  688  4352 next
 12197                                  ;  689  4357 printinputline
 12198                                  ;  690  4372 readRL
 12199                                  ;  691  4379 error1
 12200                                  ;  692  4386 prs
 12201                                  ;  693  4390 prunsign1
 12202                                  ;  694  4400 prc
 12203                                  ;  695  4404 prscomment
 12204                                  ;  696  4415 next
 12205                                  ;  697  4420 fcloseR
 12206                                  ;  698  4428 fcloseR
 12207                                  ;  699  4436 exitR
 12208                                  ;  700  4442 prnl
 12209                                  ;  701  4447 prscomment
 12210                                  ;  702  4458 prs
 12211                                  ;  703  4462 prunsign1
 12212                                  ;  704  4472 prs
 12213                                  ;  705  4476 prs
 12214                                  ;  706  4480 prs
 12215                                  ;  707  4484 prunsign1
 12216                                  ;  708  4494 prs
 12217                                  ;  709  4498 prunsign1
 12218                                  ;  710  4508 prs
 12219                                  ;  711  4512 prs
 12220                                  ;  712  4516 end1
 12221                                  ;  713  4521 prs
 12222                                  ;  714  4525 prs
 12223                                  ;  715  4529 prs
 12224                                  ;  716  4533 prunsign1
 12225                                  ;  717  4543 prs
 12226                                  ;  718  4547 prs
 12227                                  ;  719  4551 listvar
 12228                                  ;  720  4559 prs
 12229                                  ;  721  4563 calllisting
 12230                                  ;  722  4575 prs
 12231                                  ;  723  4579 printint51
 12232                                  ;  724  4590 prc
 12233                                  ;  725  4594 prs
 12234                                  ;  726  4598 printint51
 12235                                  ;  727  4609 prc
 12236                                  ;  728  4613 from_far
 12237                                  ;  729  4622 prs
 12238                                  ;  730  4626 adrF
 12239                                  ;  731  4631 from_far
 12240                                  ;  732  4640 eqstr
 12241                                  ;  733  4646 prs
 12242                                  ;  734  4650 countcalls
 12243                                  ;  735  4661 funclisting
 12244                                  ;  736  4673 prs
 12245                                  ;  737  4677 printint51
 12246                                  ;  738  4688 printint51
 12247                                  ;  739  4699 prs
 12248                                  ;  740  4703 printint51
 12249                                  ;  741  4714 prc
 12250                                  ;  742  4718 prs
 12251                                  ;  743  4722 prs
 12252                                  ;  744  4726 prs
 12253                                  ;  745  4730 prs
 12254                                  ;  746  4734 prc
 12255                                  ;  747  4738 prc
 12256                                  ;  748  4742 adrF
 12257                                  ;  749  4747 prs
 12258                                  ;  750  4751 prs
 12259                                  ;  751  4755 printint51
 12260                                  ;  752  4766 prc
 12261                                  ;  753  4770 prs
 12262                                  ;  754  4774 prs
 12263                                  ;  755  4778 prs
 12264                                  ;  756  4782 prs
 12265                                  ;  757  4786 prs
 12266                                  ;  758  4790 prs
 12267                                  ;  759  4794 prs
 12268                                  ;  760  4798 prs
 12269                                  ;  761  4802 prs
 12270                                  ;  762  4806 printint51
 12271                                  ;  763  4817 printint51
 12272                                  ;  764  4828 prs
 12273                                  ;  765  4832 prs
 12274                                  ;  766  4836 prc
 12275                                  ;  767  4840 adrofname
 12276                                  ;  768  4850 prs
 12277                                  ;  769  4854 prc
 12278                                  ;  770  4858 prunsign1
 12279                                  ;  771  4868 prc
 12280                                  ;  772  4872 prunsign1
 12281                                  ;  773  4882 prc
 12282                                  ;  774  4886 prs
 12283                                  ;  775  4890 prc
 12284                                  ;  776  4894 pint1
 12285                                  ;  777  4900 prs
 12286                                  ;  778  4904 prs
 12287                                  ;  779  4908 listvar
 12288                                  ;  780  4916 listfunc
 12289                                  ;  781  4925 listcall
 12290                                  ;  782  4934 prs
 12291                                  ;  783  4938 prs
 12292                                  ;  784  4942 prs
 12293                                  ;  785  4946 prs
 12294                                  ;  786  4950 prs
 12295                                  ;  787  4954 printint51
 12296                                  ;  788  4965 prs
 12297                                  ;  789  4969 printint51
 12298                                  ;  790  4980 prs
 12299                                  ;  791  4984 printint51
 12300                                  ;  792  4995 prs
 12301                                  ;  793  4999 printint51
 12302                                  ;  794  5010 prs
 12303                                  ;  795  5014 printint51
 12304                                  ;  796  5025 prs
 12305                                  ;  797  5029 printint51
 12306                                  ;  798  5040 prs
 12307                                  ;  799  5044 printint51
 12308                                  ;  800  5055 prs
 12309                                  ;  801  5059 printint51
 12310                                  ;  802  5070 prs
 12311                                  ;  803  5074 prs
 12312                                  ;  804  5078 prs
 12313                                  ;  805  5082 printint51
 12314                                  ;  806  5093 prs
 12315                                  ;  807  5097 printint51
 12316                                  ;  808  5108 prs
 12317                                  ;  809  5112 prs
 12318                                  ;  810  5116 printint51
 12319                                  ;  811  5127 prs
 12320                                  ;  812  5131 end1
 12321                                  ;  813  5136 prs
 12322                                  ;  814  5140 from_far
 12323                                  ;  815  5149 adrF
 12324                                  ;  816  5154 eqstr
 12325                                  ;  817  5160 prs
 12326                                  ;  818  5164 prs
 12327                                  ;  819  5168 prs
 12328                                  ;  820  5172 printint51
 12329                                  ;  821  5183 error1
 12330                                  ;  822  5190 prs
 12331                                  ;  823  5194 eqstr
 12332                                  ;  824  5200 getlex
 12333                                  ;  825  5207 expect
 12334                                  ;  826  5214 error1
 12335                                  ;  827  5221 strlen
 12336                                  ;  828  5228 error1
 12337                                  ;  829  5235 adrofname
 12338                                  ;  830  5245 strcpy
 12339                                  ;  831  5252 expect
 12340                                  ;  832  5259 getlex
 12341                                  ;  833  5266 istoken
 12342                                  ;  834  5274 istoken
 12343                                  ;  835  5282 dodefine
 12344                                  ;  836  5291 error1
 12345                                  ;  837  5298 typeName
 12346                                  ;  838  5307 dofunc
 12347                                  ;  839  5314 doglob
 12348                                  ;  840  5321 fgets1
 12349                                  ;  841  5328 cputs
 12350                                  ;  842  5334 cputs
 12351                                  ;  843  5340 exitR
 12352                                  ;  844  5346 toupper
 12353                                  ;  845  5354 strcpy
 12354                                  ;  846  5361 instr1
 12355                                  ;  847  5368 strcat1
 12356                                  ;  848  5376 strcpy
 12357                                  ;  849  5383 strlen
 12358                                  ;  850  5390 openR
 12359                                  ;  851  5396 cputs
 12360                                  ;  852  5402 cputs
 12361                                  ;  853  5408 exitR
 12362                                  ;  854  5414 creatR
 12363                                  ;  855  5421 cputs
 12364                                  ;  856  5427 cputs
 12365                                  ;  857  5433 exitR
 12366                                  ;  858  5439 prs
 12367                                  ;  859  5443 prs
 12368                                  ;  860  5447 prs
 12369                                  ;  861  5451 prs
 12370                                  ;  862  5455 prs
 12371                                  ;  863  5459 prs
 12372                                  ;  864  5463 prs
 12373                                  ;  865  5467 DosInt
 12374                                  ;  866  5474 getarg
 12375                                  ;  867  5481 setblock
 12376                                  ;  868  5490 error1
 12377                                  ;  869  5497 allocmem
 12378                                  ;  870  5506 error1
 12379                                  ;  871  5513 getfirstchar
 12380                                  ;  872  5526 parse
 12381                                  ;  873  5532 checkcalls
 12382                                  ;  874  5543 epilog
 12383                                  ;  875  5550 DosInt
 12384                                  ;Input: A.C, List: A.S,  Lines: 1313
 12385                                  ;Glob. variables:  120 max.:  200
 12386                                  ;Functions      :  104 max.:  300
 12387                                  ;Calls          :  876 max.: 1500, NameField: 5557
 12388                                  ;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538
