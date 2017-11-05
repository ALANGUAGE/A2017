     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E94643                  jmp main
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
   357                                  ;-86 char CType[CALLMAX]; //0=unresolved,  1=resolved
   358                                  
   359                                  section .bss
   360                                  absolute 41196
   361 0000A0EC <res 000005DC>          CType resb 1500
   362                                  section .text
   363                                  
   364                                  ;-87 int  CAdr [CALLMAX]; //start of nameof address in CNameField
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
   396                                  ;-94 char fgetsdest[COLUMNMAX];
   397                                  
   398                                  section .bss
   399                                  absolute 55712
   400 0000D9A0 <res 00000080>          fgetsdest resb 128
   401                                  section .text
   402                                  
   403                                  ;-95 unsigned char *fgetsp=0;
   404                                  
   405 00000045 0000                    fgetsp dw 0
   406                                  
   407                                  ;-96 unsigned int segE;
   408                                  
   409 00000047 0000                    segE dw 0
   410                                  
   411                                  ;-97 unsigned int lineno=1;
   412                                  
   413 00000049 0100                    lineno dw 1
   414                                  
   415                                  ;-98 unsigned char *pt=0;
   416                                  
   417 0000004B 0000                    pt dw 0
   418                                  
   419                                  ;-99 unsigned char *p1=0;
   420                                  
   421 0000004D 0000                    p1 dw 0
   422                                  
   423                                  ;-100 int DOS_ERR=0;
   424                                  
   425 0000004F 0000                    DOS_ERR dw 0
   426                                  
   427                                  ;-101 int DOS_NoBytes=0;
   428                                  
   429 00000051 0000                    DOS_NoBytes dw 0
   430                                  
   431                                  ;-102 char DOS_ByteRead=0;
   432                                  
   433 00000053 00                      DOS_ByteRead db 0
   434                                  
   435                                  ;-103 
   436                                  
   437                                  
   438                                  ;-104 
   439                                  
   440                                  
   441                                  ;-105 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   442                                  
   443                                  
   444                                  writetty: PROC
   445 00000054 B40E                     mov  ah, 14
   446 00000056 BB0000                   mov  bx, 0
   447 00000059 CD10                     db 205,16
   448                                  
   449                                  ;-106 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   450                                  
   451 0000005B C3                       ret
   452                                  ENDP
   453                                  
   454                                  putch: PROC;
   455 0000005C C8000000                 ENTER  0,0
   456 00000060 8A4604                   mov al, [bp+4]
   457 00000063 3C0A                     cmp al, 10
   458 00000065 0F850500                 jne .putch1
   459 00000069 B00D                     mov  al, 13
   460 0000006B E8E6FF                   call writetty
   461                                  .putch1:
   462 0000006E 8A4604                   mov  al, [bp+4]
   463 00000071 E8E0FF                   call writetty
   464                                  
   465                                  ;-107 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   466 00000074 C9                       LEAVE
   467 00000075 C3                       ret
   468                                  ENDP
   469                                  
   470                                  cputs: PROC;
   471 00000076 C8020000                 ENTER  2,0
   472                                  .cputs2:
   473 0000007A 8B5E04                   mov bx, [bp+4]
   474 0000007D 8A07                     mov al, [bx]
   475 0000007F B400                     mov ah, 0
   476 00000081 08C0                     or  al, al
   477 00000083 0F841B00                 je .cputs3
   478 00000087 8B5E04                   mov bx, [bp+4]
   479 0000008A 8A07                     mov al, [bx]
   480 0000008C B400                     mov ah, 0
   481 0000008E 8846FE                   mov [bp-2], al
   482 00000091 8A46FE                   mov al, byte [bp-2]
   483 00000094 B400                     mov ah, 0
   484 00000096 50                       push ax
   485 00000097 E8C2FF                   call putch
   486 0000009A 83C402                   add  sp, 2
   487 0000009D FF4604                   inc  word[bp+4]
   488 000000A0 EBD8                     jmp .cputs2
   489                                  .cputs3:
   490                                  
   491                                  ;-108 int mkneg(int n)   { n; __asm {neg ax} }
   492 000000A2 C9                       LEAVE
   493 000000A3 C3                       ret
   494                                  ENDP
   495                                  
   496                                  mkneg: PROC;
   497 000000A4 C8000000                 ENTER  0,0
   498 000000A8 8B4604                   mov ax, [bp+4]
   499 000000AB F7D8                    neg ax
   500                                  
   501                                  ;-109 
   502                                  
   503                                  
   504                                  ;-110 int DosInt() {
   505 000000AD C9                       LEAVE
   506 000000AE C3                       ret
   507                                  ENDP
   508                                  
   509                                  DosInt: PROC
   510                                  
   511                                  ;-111     asm int 0x21
   512                                  
   513 000000AF CD21                     int 0x21
   514                                  
   515                                  ;-112     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   516                                  
   517 000000B1 7304                     db 115,4
   518                                  
   519                                  ;-113     DOS_ERR++;
   520                                  
   521 000000B3 FF06[4F00]               inc  word[DOS_ERR]
   522                                  
   523                                  ;-114 }
   524                                  
   525                                  
   526                                  ;-115 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   527                                  
   528 000000B7 C3                       ret
   529                                  ENDP
   530                                  
   531                                  openR: PROC;
   532 000000B8 C8000000                 ENTER  0,0
   533 000000BC 8B5604                   mov  dx, [bp+4]
   534 000000BF B8023D                   mov  ax, 15618
   535 000000C2 E8EAFF                   call DosInt
   536                                  
   537                                  ;-116 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   538 000000C5 C9                       LEAVE
   539 000000C6 C3                       ret
   540                                  ENDP
   541                                  
   542                                  creatR: PROC;
   543 000000C7 C8000000                 ENTER  0,0
   544 000000CB 8B5604                   mov  dx, [bp+4]
   545 000000CE B90000                   mov  cx, 0
   546 000000D1 B8003C                   mov  ax, 15360
   547 000000D4 E8D8FF                   call DosInt
   548                                  
   549                                  ;-117 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   550 000000D7 C9                       LEAVE
   551 000000D8 C3                       ret
   552                                  ENDP
   553                                  
   554                                  fcloseR: PROC;
   555 000000D9 C8000000                 ENTER  0,0
   556 000000DD 8B5E04                   mov  bx, [bp+4]
   557 000000E0 B8003E                   mov  ax, 15872
   558 000000E3 E8C9FF                   call DosInt
   559                                  
   560                                  ;-118 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   561 000000E6 C9                       LEAVE
   562 000000E7 C3                       ret
   563                                  ENDP
   564                                  
   565                                  exitR: PROC;
   566 000000E8 C8000000                 ENTER  0,0
   567 000000EC B44C                     mov  ah, 76
   568 000000EE 8A4604                   mov  al, [bp+4]
   569 000000F1 E8BBFF                   call DosInt
   570                                  
   571                                  ;-119 int readRL(char *s, int fd, int len){
   572 000000F4 C9                       LEAVE
   573 000000F5 C3                       ret
   574                                  ENDP
   575                                  
   576                                  readRL: PROC
   577                                  
   578                                  ;-120     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   579                                  ;
   580 000000F6 C8000000                 ENTER  0,0
   581 000000FA 8B5604                   mov  dx, [bp+4]
   582 000000FD 8B4E08                   mov  cx, [bp+8]
   583 00000100 8B5E06                   mov  bx, [bp+6]
   584 00000103 B8003F                   mov  ax, 16128
   585 00000106 E8A6FF                   call DosInt
   586                                  
   587                                  ;-121 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   588 00000109 C9                       LEAVE
   589 0000010A C3                       ret
   590                                  ENDP
   591                                  
   592                                  fputcR: PROC;
   593 0000010B C8000000                 ENTER  0,0
   594 0000010F 8D5604                  lea dx, [bp+4]
   595                                  
   596                                  ;-122   cx=1; bx=fd; ax=0x4000; DosInt(); }
   597                                  
   598 00000112 B90100                   mov  cx, 1
   599 00000115 8B5E06                   mov  bx, [bp+6]
   600 00000118 B80040                   mov  ax, 16384
   601 0000011B E891FF                   call DosInt
   602                                  
   603                                  ;-123 
   604                                  
   605                                  
   606                                  ;-124   int letter(char c) {
   607 0000011E C9                       LEAVE
   608 0000011F C3                       ret
   609                                  ENDP
   610                                  
   611                                  letter: PROC
   612                                  
   613                                  ;-125       if (c=='_') return 1;
   614                                  ;
   615 00000120 C8000000                 ENTER  0,0
   616 00000124 8A4604                   mov al, [bp+4]
   617 00000127 3C5F                     cmp al, 95
   618 00000129 0F850600                 jne .letter4
   619 0000012D B80100                   mov ax, 1
   620 00000130 E96900                   jmp .retnletter
   621                                  
   622                                  ;-126       if (c=='.') return 1;
   623                                  
   624                                  .letter4:
   625 00000133 8A4604                   mov al, [bp+4]
   626 00000136 3C2E                     cmp al, 46
   627 00000138 0F850600                 jne .letter5
   628 0000013C B80100                   mov ax, 1
   629 0000013F E95A00                   jmp .retnletter
   630                                  
   631                                  ;-127       if (c=='?') return 1;
   632                                  
   633                                  .letter5:
   634 00000142 8A4604                   mov al, [bp+4]
   635 00000145 3C3F                     cmp al, 63
   636 00000147 0F850600                 jne .letter6
   637 0000014B B80100                   mov ax, 1
   638 0000014E E94B00                   jmp .retnletter
   639                                  
   640                                  ;-128       if (c=='$') return 1;
   641                                  
   642                                  .letter6:
   643 00000151 8A4604                   mov al, [bp+4]
   644 00000154 3C24                     cmp al, 36
   645 00000156 0F850600                 jne .letter7
   646 0000015A B80100                   mov ax, 1
   647 0000015D E93C00                   jmp .retnletter
   648                                  
   649                                  ;-129       if (c> 'z') return 0;
   650                                  
   651                                  .letter7:
   652 00000160 8A4604                   mov al, [bp+4]
   653 00000163 3C7A                     cmp al, 122
   654 00000165 0F8E0600                 jle .letter8
   655 00000169 B80000                   mov ax, 0
   656 0000016C E92D00                   jmp .retnletter
   657                                  
   658                                  ;-130       if (c< '@') return 0;// at included
   659                                  
   660                                  .letter8:
   661 0000016F 8A4604                   mov al, [bp+4]
   662 00000172 3C40                     cmp al, 64
   663 00000174 0F8D0600                 jge .letter9
   664 00000178 B80000                   mov ax, 0
   665 0000017B E91E00                   jmp .retnletter
   666                                  
   667                                  ;-131       if (c> 'Z') { if (c< 'a') return 0; }
   668                                  
   669                                  .letter9:
   670 0000017E 8A4604                   mov al, [bp+4]
   671 00000181 3C5A                     cmp al, 90
   672 00000183 0F8E0F00                 jle .letter10
   673 00000187 8A4604                   mov al, [bp+4]
   674 0000018A 3C61                     cmp al, 97
   675 0000018C 0F8D0600                 jge .letter11
   676 00000190 B80000                   mov ax, 0
   677 00000193 E90600                   jmp .retnletter
   678                                  .letter11:
   679                                  
   680                                  ;-132       return 1;
   681                                  
   682                                  .letter10:
   683 00000196 B80100                   mov ax, 1
   684 00000199 E90000                   jmp .retnletter
   685                                  
   686                                  ;-133   }
   687                                  
   688                                  
   689                                  ;-134   int digit(char c){
   690                                  
   691 0000019C C9                       .retnletter: LEAVE
   692 0000019D C3                       ret
   693                                  ENDP
   694                                  
   695                                  digit: PROC
   696                                  
   697                                  ;-135       if(c<'0') return 0;
   698                                  ;
   699 0000019E C8000000                 ENTER  0,0
   700 000001A2 8A4604                   mov al, [bp+4]
   701 000001A5 3C30                     cmp al, 48
   702 000001A7 0F8D0600                 jge .digit12
   703 000001AB B80000                   mov ax, 0
   704 000001AE E91500                   jmp .retndigit
   705                                  
   706                                  ;-136       if(c>'9') return 0;
   707                                  
   708                                  .digit12:
   709 000001B1 8A4604                   mov al, [bp+4]
   710 000001B4 3C39                     cmp al, 57
   711 000001B6 0F8E0600                 jle .digit13
   712 000001BA B80000                   mov ax, 0
   713 000001BD E90600                   jmp .retndigit
   714                                  
   715                                  ;-137       return 1;
   716                                  
   717                                  .digit13:
   718 000001C0 B80100                   mov ax, 1
   719 000001C3 E90000                   jmp .retndigit
   720                                  
   721                                  ;-138   }
   722                                  
   723                                  
   724                                  ;-139   int alnum(char c) {
   725                                  
   726 000001C6 C9                       .retndigit: LEAVE
   727 000001C7 C3                       ret
   728                                  ENDP
   729                                  
   730                                  alnum: PROC
   731                                  
   732                                  ;-140     if (digit (c)) return 1;
   733                                  ;
   734 000001C8 C8000000                 ENTER  0,0
   735 000001CC 8A4604                   mov al, byte [bp+4]
   736 000001CF B400                     mov ah, 0
   737 000001D1 50                       push ax
   738 000001D2 E8C9FF                   call digit
   739 000001D5 83C402                   add  sp, 2
   740 000001D8 08C0                     or  al, al
   741 000001DA 0F840600                 je .alnum14
   742 000001DE B80100                   mov ax, 1
   743 000001E1 E91E00                   jmp .retnalnum
   744                                  
   745                                  ;-141     if (letter(c)) return 1;
   746                                  
   747                                  .alnum14:
   748 000001E4 8A4604                   mov al, byte [bp+4]
   749 000001E7 B400                     mov ah, 0
   750 000001E9 50                       push ax
   751 000001EA E833FF                   call letter
   752 000001ED 83C402                   add  sp, 2
   753 000001F0 08C0                     or  al, al
   754 000001F2 0F840600                 je .alnum15
   755 000001F6 B80100                   mov ax, 1
   756 000001F9 E90600                   jmp .retnalnum
   757                                  
   758                                  ;-142     return 0;
   759                                  
   760                                  .alnum15:
   761 000001FC B80000                   mov ax, 0
   762 000001FF E90000                   jmp .retnalnum
   763                                  
   764                                  ;-143   }
   765                                  
   766                                  
   767                                  ;-144 
   768                                  
   769                                  
   770                                  ;-145 int strlen(char *s) { int c;
   771                                  
   772 00000202 C9                       .retnalnum: LEAVE
   773 00000203 C3                       ret
   774                                  ENDP
   775                                  
   776                                  strlen: PROC
   777                                  
   778                                  ;-146     c=0;
   779                                  ;
   780 00000204 C8020000                 ENTER  2,0
   781 00000208 B80000                   mov ax, 0
   782 0000020B 8946FE                   mov [bp-2], ax
   783                                  
   784                                  ;-147     while (*s!=0) {s++; c++;}
   785                                  
   786                                  .strlen16:
   787 0000020E 8B5E04                   mov bx, [bp+4]
   788 00000211 8A07                     mov al, [bx]
   789 00000213 B400                     mov ah, 0
   790 00000215 83F800                   cmp ax, 0
   791 00000218 0F840800                 je  .strlen17
   792 0000021C FF4604                   inc  word[bp+4]
   793 0000021F FF46FE                   inc  word[bp-2]
   794                                  
   795                                  ;-148     return c;
   796                                  
   797 00000222 EBEA                     jmp .strlen16
   798                                  .strlen17:
   799 00000224 8B46FE                   mov ax, [bp-2]
   800 00000227 E90000                   jmp .retnstrlen
   801                                  
   802                                  ;-149 }
   803                                  
   804                                  
   805                                  ;-150 int strcpy(char *s, char *t) {
   806                                  
   807 0000022A C9                       .retnstrlen: LEAVE
   808 0000022B C3                       ret
   809                                  ENDP
   810                                  
   811                                  strcpy: PROC
   812                                  
   813                                  ;-151     do { *s=*t; s++; t++; }
   814                                  ;
   815 0000022C C8000000                 ENTER  0,0
   816                                  .strcpy18:
   817 00000230 8B5E06                   mov bx, [bp+6]
   818 00000233 8A07                     mov al, [bx]
   819 00000235 B400                     mov ah, 0
   820 00000237 8B5E04                   mov  bx, [bp+4]
   821 0000023A 8807                     mov  [bx], al
   822 0000023C FF4604                   inc  word[bp+4]
   823 0000023F FF4606                   inc  word[bp+6]
   824                                  
   825                                  ;-152     while (*t!=0);
   826                                  
   827 00000242 8B5E06                   mov bx, [bp+6]
   828 00000245 8A07                     mov al, [bx]
   829 00000247 B400                     mov ah, 0
   830 00000249 83F800                   cmp ax, 0
   831 0000024C 0F840200                 je  .strcpy19
   832 00000250 EBDE                     jmp .strcpy18
   833                                  .strcpy19:
   834                                  
   835                                  ;-153     *s=0;
   836                                  
   837 00000252 B80000                   mov ax, 0
   838 00000255 8B5E04                   mov  bx, [bp+4]
   839 00000258 8807                     mov  [bx], al
   840                                  
   841                                  ;-154     return s;
   842                                  
   843 0000025A 8B4604                   mov ax, [bp+4]
   844 0000025D E90000                   jmp .retnstrcpy
   845                                  
   846                                  ;-155 }
   847                                  
   848                                  
   849                                  ;-156 int eqstr(char *p, char *q) {
   850                                  
   851 00000260 C9                       .retnstrcpy: LEAVE
   852 00000261 C3                       ret
   853                                  ENDP
   854                                  
   855                                  eqstr: PROC
   856                                  
   857                                  ;-157     while(*p) {
   858                                  ;
   859 00000262 C8000000                 ENTER  0,0
   860                                  .eqstr20:
   861 00000266 8B5E04                   mov bx, [bp+4]
   862 00000269 8A07                     mov al, [bx]
   863 0000026B B400                     mov ah, 0
   864 0000026D 08C0                     or  al, al
   865 0000026F 0F842000                 je .eqstr21
   866                                  
   867                                  ;-158         if (*p != *q) return 0;
   868                                  
   869 00000273 8B5E04                   mov bx, [bp+4]
   870 00000276 8A07                     mov al, [bx]
   871 00000278 B400                     mov ah, 0
   872 0000027A 8B5E06                   mov bx, [bp+6]
   873 0000027D 3A07                     cmp al, [bx]
   874 0000027F B400                     mov ah, 0
   875 00000281 0F840600                 je  .eqstr22
   876 00000285 B80000                   mov ax, 0
   877 00000288 E92100                   jmp .retneqstr
   878                                  
   879                                  ;-159         p++;
   880                                  
   881                                  .eqstr22:
   882 0000028B FF4604                   inc  word[bp+4]
   883                                  
   884                                  ;-160         q++;
   885                                  
   886 0000028E FF4606                   inc  word[bp+6]
   887                                  
   888                                  ;-161     }
   889                                  
   890                                  
   891                                  ;-162     if(*q) return 0;
   892                                  
   893 00000291 EBD3                     jmp .eqstr20
   894                                  .eqstr21:
   895 00000293 8B5E06                   mov bx, [bp+6]
   896 00000296 8A07                     mov al, [bx]
   897 00000298 B400                     mov ah, 0
   898 0000029A 08C0                     or  al, al
   899 0000029C 0F840600                 je .eqstr23
   900 000002A0 B80000                   mov ax, 0
   901 000002A3 E90600                   jmp .retneqstr
   902                                  
   903                                  ;-163     return 1; }
   904                                  
   905                                  .eqstr23:
   906 000002A6 B80100                   mov ax, 1
   907 000002A9 E90000                   jmp .retneqstr
   908                                  
   909                                  ;-164 int strcat1(char *s, char *t) {
   910                                  
   911 000002AC C9                       .retneqstr: LEAVE
   912 000002AD C3                       ret
   913                                  ENDP
   914                                  
   915                                  strcat1: PROC
   916                                  
   917                                  ;-165     while (*s != 0) s++;
   918                                  ;
   919 000002AE C8000000                 ENTER  0,0
   920                                  .strcat124:
   921 000002B2 8B5E04                   mov bx, [bp+4]
   922 000002B5 8A07                     mov al, [bx]
   923 000002B7 B400                     mov ah, 0
   924 000002B9 83F800                   cmp ax, 0
   925 000002BC 0F840500                 je  .strcat125
   926 000002C0 FF4604                   inc  word[bp+4]
   927                                  
   928                                  ;-166     strcpy(s, t);
   929                                  
   930 000002C3 EBED                     jmp .strcat124
   931                                  .strcat125:
   932 000002C5 FF7606                   push word [bp+6]
   933 000002C8 FF7604                   push word [bp+4]
   934 000002CB E85EFF                   call strcpy
   935 000002CE 83C404                   add  sp, 4
   936                                  
   937                                  ;-167 }
   938                                  
   939                                  
   940                                  ;-168 int toupper(char *s) {
   941 000002D1 C9                       LEAVE
   942 000002D2 C3                       ret
   943                                  ENDP
   944                                  
   945                                  toupper: PROC
   946                                  
   947                                  ;-169     while(*s) {
   948                                  ;
   949 000002D3 C8000000                 ENTER  0,0
   950                                  .toupper26:
   951 000002D7 8B5E04                   mov bx, [bp+4]
   952 000002DA 8A07                     mov al, [bx]
   953 000002DC B400                     mov ah, 0
   954 000002DE 08C0                     or  al, al
   955 000002E0 0F843000                 je .toupper27
   956                                  
   957                                  ;-170         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
   958                                  
   959 000002E4 8B5E04                   mov bx, [bp+4]
   960 000002E7 8A07                     mov al, [bx]
   961 000002E9 B400                     mov ah, 0
   962 000002EB 83F861                   cmp ax, 97 ;unsigned : 1
   963 000002EE 0F8C1D00                 jl  .toupper28
   964 000002F2 8B5E04                   mov bx, [bp+4]
   965 000002F5 8A07                     mov al, [bx]
   966 000002F7 B400                     mov ah, 0
   967 000002F9 83F87A                   cmp ax, 122
   968 000002FC 0F8F0F00                 jg  .toupper29
   969 00000300 8B5E04                   mov bx, [bp+4]
   970 00000303 8A07                     mov al, [bx]
   971 00000305 B400                     mov ah, 0
   972 00000307 83E820                   sub ax, 32
   973 0000030A 8B5E04                   mov  bx, [bp+4]
   974 0000030D 8807                     mov  [bx], al
   975                                  
   976                                  ;-171         s++;
   977                                  
   978                                  .toupper29:
   979                                  .toupper28:
   980 0000030F FF4604                   inc  word[bp+4]
   981                                  
   982                                  ;-172     }
   983                                  
   984                                  
   985                                  ;-173 }
   986                                  
   987 00000312 EBC3                     jmp .toupper26
   988                                  .toupper27:
   989                                  
   990                                  ;-174 int instr1(char *s, char c) {
   991 00000314 C9                       LEAVE
   992 00000315 C3                       ret
   993                                  ENDP
   994                                  
   995                                  instr1: PROC
   996                                  
   997                                  ;-175     while(*s) {
   998                                  ;
   999 00000316 C8000000                 ENTER  0,0
  1000                                  .instr130:
  1001 0000031A 8B5E04                   mov bx, [bp+4]
  1002 0000031D 8A07                     mov al, [bx]
  1003 0000031F B400                     mov ah, 0
  1004 00000321 08C0                     or  al, al
  1005 00000323 0F841900                 je .instr131
  1006                                  
  1007                                  ;-176         if (*s==c) return 1;
  1008                                  
  1009 00000327 8B5E04                   mov bx, [bp+4]
  1010 0000032A 8A07                     mov al, [bx]
  1011 0000032C B400                     mov ah, 0
  1012 0000032E 3A4606                   cmp al, [bp+6]
  1013 00000331 0F850600                 jne .instr132
  1014 00000335 B80100                   mov ax, 1
  1015 00000338 E90B00                   jmp .retninstr1
  1016                                  
  1017                                  ;-177         s++;
  1018                                  
  1019                                  .instr132:
  1020 0000033B FF4604                   inc  word[bp+4]
  1021                                  
  1022                                  ;-178     }
  1023                                  
  1024                                  
  1025                                  ;-179     return 0;
  1026                                  
  1027 0000033E EBDA                     jmp .instr130
  1028                                  .instr131:
  1029 00000340 B80000                   mov ax, 0
  1030 00000343 E90000                   jmp .retninstr1
  1031                                  
  1032                                  ;-180 }
  1033                                  
  1034                                  
  1035                                  ;-181 
  1036                                  
  1037                                  
  1038                                  ;-182 
  1039                                  
  1040                                  
  1041                                  ;-183 int a(unsigned int i) { printName(i);//address
  1042                                  
  1043 00000346 C9                       .retninstr1: LEAVE
  1044 00000347 C3                       ret
  1045                                  ENDP
  1046                                  
  1047                                  a: PROC;
  1048 00000348 C8000000                 ENTER  0,0
  1049 0000034C FF7604                   push word [bp+4]
  1050 0000034F E8CD08                   call printName
  1051 00000352 83C402                   add  sp, 2
  1052                                  
  1053                                  ;-184 }
  1054                                  
  1055                                  
  1056                                  ;-185 int v(unsigned int i) {//value
  1057 00000355 C9                       LEAVE
  1058 00000356 C3                       ret
  1059                                  ENDP
  1060                                  
  1061                                  v: PROC
  1062                                  
  1063                                  ;-186     if (i < LSTART) prc('[');
  1064                                  ;
  1065 00000357 C8000000                 ENTER  0,0
  1066 0000035B 8B4604                   mov ax, [bp+4]
  1067 0000035E 3DC800                   cmp ax, 200
  1068 00000361 0F8D0800                 jge .v33
  1069 00000365 6A5B                     push 91
  1070 00000367 E85501                   call prc
  1071 0000036A 83C402                   add  sp, 2
  1072                                  
  1073                                  ;-187     printName(i);
  1074                                  
  1075                                  .v33:
  1076 0000036D FF7604                   push word [bp+4]
  1077 00000370 E8AC08                   call printName
  1078 00000373 83C402                   add  sp, 2
  1079                                  
  1080                                  ;-188     if (i < LSTART) prc(']');
  1081                                  
  1082 00000376 8B4604                   mov ax, [bp+4]
  1083 00000379 3DC800                   cmp ax, 200
  1084 0000037C 0F8D0800                 jge .v34
  1085 00000380 6A5D                     push 93
  1086 00000382 E83A01                   call prc
  1087 00000385 83C402                   add  sp, 2
  1088                                  
  1089                                  ;-189 }
  1090                                  
  1091                                  .v34:
  1092                                  
  1093                                  ;-190 int checknamelen() {
  1094 00000388 C9                       LEAVE
  1095 00000389 C3                       ret
  1096                                  ENDP
  1097                                  
  1098                                  checknamelen: PROC
  1099                                  
  1100                                  ;-191     int i;
  1101                                  
  1102                                  
  1103                                  ;-192     i=strlen(symbol);
  1104                                  ;
  1105 0000038A C8020000                 ENTER  2,0
  1106 0000038E 8D06BB69                 lea  ax, [symbol]
  1107 00000392 50                       push ax
  1108 00000393 E86EFE                   call strlen
  1109 00000396 83C402                   add  sp, 2
  1110 00000399 8946FE                   mov [bp-2], ax
  1111                                  
  1112                                  ;-193     if (i > IDLENMAX) error1("Item name is too long in characters)");
  1113                                  
  1114 0000039C 8B46FE                   mov ax, [bp-2]
  1115 0000039F 83F80F                   cmp ax, 15
  1116 000003A2 0F8E0900                 jle .checknamelen35
  1117 000003A6 68[B103]                 push checknamelen_0
  1118 000003A9 E8BF38                   call error1
  1119 000003AC 83C402                   add  sp, 2
  1120                                  
  1121                                  ;-194 }
  1122                                  
  1123                                  .checknamelen35:
  1124                                  
  1125                                  ;-195 
  1126                                  
  1127                                  
  1128                                  ;-196 int next() {
  1129 000003AF C9                       LEAVE
  1130 000003B0 C3                       ret
  1131 000003B1 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1132 000003BA 20697320746F6F206C-
  1133 000003C3 6F6E6720696E206368-
  1134 000003CC 617261637465727329-
  1135 000003D5 00                 
  1136                                  ENDP
  1137                                  
  1138                                  next: PROC
  1139                                  
  1140                                  ;-197     char r;
  1141                                  
  1142                                  
  1143                                  ;-198     r = thechar;
  1144                                  ;
  1145 000003D6 C8020000                 ENTER  2,0
  1146 000003DA A0[2300]                 mov al, [thechar]
  1147 000003DD 8846FE                   mov [bp-2], al
  1148                                  
  1149                                  ;-199     globC=r;
  1150                                  
  1151 000003E0 8A46FE                   mov al, [bp-2]
  1152 000003E3 A2[2000]                 mov byte [globC], al
  1153                                  
  1154                                  ;-200     thechar = fgets1();
  1155                                  
  1156 000003E6 E81137                   call fgets1
  1157 000003E9 A2[2300]                 mov byte [thechar], al
  1158                                  
  1159                                  ;-201     return r;
  1160                                  
  1161 000003EC 8A46FE                   mov al, [bp-2]
  1162 000003EF E90000                   jmp .retnnext
  1163                                  
  1164                                  ;-202 }
  1165                                  
  1166                                  
  1167                                  ;-203 int istoken(int t) {
  1168                                  
  1169 000003F2 C9                       .retnnext: LEAVE
  1170 000003F3 C3                       ret
  1171                                  ENDP
  1172                                  
  1173                                  istoken: PROC
  1174                                  
  1175                                  ;-204     if (token == t) {
  1176                                  ;
  1177 000003F4 C8000000                 ENTER  0,0
  1178 000003F8 A1[1E00]                 mov ax, [token]
  1179 000003FB 3B4604                   cmp ax, [bp+4]
  1180 000003FE 0F850C00                 jne .istoken36
  1181                                  
  1182                                  ;-205         token=getlex();
  1183                                  
  1184 00000402 E8EF2D                   call getlex
  1185 00000405 A3[1E00]                 mov word [token], ax
  1186                                  
  1187                                  ;-206         return 1;
  1188                                  
  1189 00000408 B80100                   mov ax, 1
  1190 0000040B E90600                   jmp .retnistoken
  1191                                  
  1192                                  ;-207     }
  1193                                  
  1194                                  
  1195                                  ;-208     return 0;
  1196                                  
  1197                                  .istoken36:
  1198 0000040E B80000                   mov ax, 0
  1199 00000411 E90000                   jmp .retnistoken
  1200                                  
  1201                                  ;-209 }
  1202                                  
  1203                                  
  1204                                  ;-210 int expect(int t) {
  1205                                  
  1206 00000414 C9                       .retnistoken: LEAVE
  1207 00000415 C3                       ret
  1208                                  ENDP
  1209                                  
  1210                                  expect: PROC
  1211                                  
  1212                                  ;-211     if (istoken(t)==0) {
  1213                                  ;
  1214 00000416 C8000000                 ENTER  0,0
  1215 0000041A FF7604                   push word [bp+4]
  1216 0000041D E8D4FF                   call istoken
  1217 00000420 83C402                   add  sp, 2
  1218 00000423 83F800                   cmp ax, 0
  1219 00000426 0F852F00                 jne .expect37
  1220                                  
  1221                                  ;-212         *cloc=0;
  1222                                  
  1223 0000042A B80000                   mov ax, 0
  1224 0000042D 8B1E[1800]               mov  bx, [cloc]
  1225 00000431 8807                     mov  [bx], al
  1226                                  
  1227                                  ;-213         prs(co);
  1228                                  
  1229 00000433 8D06A861                 lea  ax, [co]
  1230 00000437 50                       push ax
  1231 00000438 E8EB00                   call prs
  1232 0000043B 83C402                   add  sp, 2
  1233                                  
  1234                                  ;-214         prs("\nExpected ASCII(dez): ");
  1235                                  
  1236 0000043E 68[5B04]                 push expect_0
  1237 00000441 E8E200                   call prs
  1238 00000444 83C402                   add  sp, 2
  1239                                  
  1240                                  ;-215         pint1(t);
  1241                                  
  1242 00000447 FF7604                   push word [bp+4]
  1243 0000044A E8D001                   call pint1
  1244 0000044D 83C402                   add  sp, 2
  1245                                  
  1246                                  ;-216         error1(" not found");
  1247                                  
  1248 00000450 68[7304]                 push expect_1
  1249 00000453 E81538                   call error1
  1250 00000456 83C402                   add  sp, 2
  1251                                  
  1252                                  ;-217     }
  1253                                  
  1254                                  
  1255                                  ;-218 }
  1256                                  
  1257                                  .expect37:
  1258                                  
  1259                                  ;-219 
  1260                                  
  1261                                  
  1262                                  ;-220 int eprc(char c)  {
  1263 00000459 C9                       LEAVE
  1264 0000045A C3                       ret
  1265 0000045B 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  1266 00000464 642041534349492864-
  1267 0000046D 657A293A2000       
  1268 00000473 206E6F7420666F756E-     expect_1 db " not found",0
  1269 0000047C 6400               
  1270                                  ENDP
  1271                                  
  1272                                  eprc: PROC
  1273                                  
  1274                                  ;-221     *cloc=c;
  1275                                  ;
  1276 0000047E C8000000                 ENTER  0,0
  1277 00000482 8A4604                   mov al, [bp+4]
  1278 00000485 8B1E[1800]               mov  bx, [cloc]
  1279 00000489 8807                     mov  [bx], al
  1280                                  
  1281                                  ;-222     cloc++;
  1282                                  
  1283 0000048B FF06[1800]               inc  word[cloc]
  1284                                  
  1285                                  ;-223 }
  1286                                  
  1287                                  
  1288                                  ;-224 int eprs(char *s) {
  1289 0000048F C9                       LEAVE
  1290 00000490 C3                       ret
  1291                                  ENDP
  1292                                  
  1293                                  eprs: PROC
  1294                                  
  1295                                  ;-225     char c;
  1296                                  
  1297                                  
  1298                                  ;-226     while(*s) {
  1299                                  ;
  1300 00000491 C8020000                 ENTER  2,0
  1301                                  .eprs38:
  1302 00000495 8B5E04                   mov bx, [bp+4]
  1303 00000498 8A07                     mov al, [bx]
  1304 0000049A B400                     mov ah, 0
  1305 0000049C 08C0                     or  al, al
  1306 0000049E 0F841B00                 je .eprs39
  1307                                  
  1308                                  ;-227         c=*s;
  1309                                  
  1310 000004A2 8B5E04                   mov bx, [bp+4]
  1311 000004A5 8A07                     mov al, [bx]
  1312 000004A7 B400                     mov ah, 0
  1313 000004A9 8846FE                   mov [bp-2], al
  1314                                  
  1315                                  ;-228         eprc(c);
  1316                                  
  1317 000004AC 8A46FE                   mov al, byte [bp-2]
  1318 000004AF B400                     mov ah, 0
  1319 000004B1 50                       push ax
  1320 000004B2 E8C9FF                   call eprc
  1321 000004B5 83C402                   add  sp, 2
  1322                                  
  1323                                  ;-229         s++;
  1324                                  
  1325 000004B8 FF4604                   inc  word[bp+4]
  1326                                  
  1327                                  ;-230     }
  1328                                  
  1329                                  
  1330                                  ;-231 }
  1331                                  
  1332 000004BB EBD8                     jmp .eprs38
  1333                                  .eprs39:
  1334                                  
  1335                                  ;-232 int prc(unsigned char c) {
  1336 000004BD C9                       LEAVE
  1337 000004BE C3                       ret
  1338                                  ENDP
  1339                                  
  1340                                  prc: PROC
  1341                                  
  1342                                  ;-233     if (c==10) {
  1343                                  ;
  1344 000004BF C8000000                 ENTER  0,0
  1345 000004C3 8A4604                   mov al, [bp+4]
  1346 000004C6 3C0A                     cmp al, 10
  1347 000004C8 0F850600                 jne .prc40
  1348                                  
  1349                                  ;-234         _AX=13;
  1350                                  
  1351 000004CC B80D00                   mov  ax, 13
  1352                                  
  1353                                  ;-235         writetty();
  1354                                  
  1355 000004CF E882FB                   call writetty
  1356                                  
  1357                                  ;-236     }
  1358                                  
  1359                                  
  1360                                  ;-237     _AL=c;
  1361                                  
  1362                                  .prc40:
  1363 000004D2 8A4604                   mov  al, [bp+4]
  1364                                  
  1365                                  ;-238     writetty();
  1366                                  
  1367 000004D5 E87CFB                   call writetty
  1368                                  
  1369                                  ;-239     fputcR(c, fdout);
  1370                                  
  1371 000004D8 FF36[1C00]               push word [fdout]
  1372 000004DC 8A4604                   mov al, byte [bp+4]
  1373 000004DF B400                     mov ah, 0
  1374 000004E1 50                       push ax
  1375 000004E2 E826FC                   call fputcR
  1376 000004E5 83C404                   add  sp, 4
  1377                                  
  1378                                  ;-240 }
  1379                                  
  1380                                  
  1381                                  ;-241 int prscomment(unsigned char *s) {
  1382 000004E8 C9                       LEAVE
  1383 000004E9 C3                       ret
  1384                                  ENDP
  1385                                  
  1386                                  prscomment: PROC
  1387                                  
  1388                                  ;-242     unsigned char c;
  1389                                  
  1390                                  
  1391                                  ;-243     while(*s){
  1392                                  ;
  1393 000004EA C8020000                 ENTER  2,0
  1394                                  .prscomment41:
  1395 000004EE 8B5E04                   mov bx, [bp+4]
  1396 000004F1 8A07                     mov al, [bx]
  1397 000004F3 B400                     mov ah, 0
  1398 000004F5 08C0                     or  al, al
  1399 000004F7 0F841B00                 je .prscomment42
  1400                                  
  1401                                  ;-244         c=*s;
  1402                                  
  1403 000004FB 8B5E04                   mov bx, [bp+4]
  1404 000004FE 8A07                     mov al, [bx]
  1405 00000500 B400                     mov ah, 0
  1406 00000502 8846FE                   mov [bp-2], al
  1407                                  
  1408                                  ;-245         prc(c);
  1409                                  
  1410 00000505 8A46FE                   mov al, byte [bp-2]
  1411 00000508 B400                     mov ah, 0
  1412 0000050A 50                       push ax
  1413 0000050B E8B1FF                   call prc
  1414 0000050E 83C402                   add  sp, 2
  1415                                  
  1416                                  ;-246         s++;
  1417                                  
  1418 00000511 FF4604                   inc  word[bp+4]
  1419                                  
  1420                                  ;-247     }
  1421                                  
  1422                                  
  1423                                  ;-248 }
  1424                                  
  1425 00000514 EBD8                     jmp .prscomment41
  1426                                  .prscomment42:
  1427                                  
  1428                                  ;-249 int prnl() {
  1429 00000516 C9                       LEAVE
  1430 00000517 C3                       ret
  1431                                  ENDP
  1432                                  
  1433                                  prnl: PROC
  1434                                  
  1435                                  ;-250     prs("\n ");
  1436                                  
  1437 00000518 68[2205]                 push prnl_0
  1438 0000051B E80800                   call prs
  1439 0000051E 83C402                   add  sp, 2
  1440                                  
  1441                                  ;-251 }
  1442                                  
  1443                                  
  1444                                  ;-252 
  1445                                  
  1446                                  
  1447                                  ;-253 int prs(unsigned char *s) {
  1448                                  
  1449 00000521 C3                       ret
  1450 00000522 5C6E2000                prnl_0 db "\n ",0
  1451                                  ENDP
  1452                                  
  1453                                  prs: PROC
  1454                                  
  1455                                  ;-254     unsigned char c; int com;
  1456                                  
  1457                                  
  1458                                  ;-255     com=0;
  1459                                  ;
  1460 00000526 C8040000                 ENTER  4,0
  1461 0000052A B80000                   mov ax, 0
  1462 0000052D 8946FC                   mov [bp-4], ax
  1463                                  
  1464                                  ;-256     while(*s) {
  1465                                  
  1466                                  .prs43:
  1467 00000530 8B5E04                   mov bx, [bp+4]
  1468 00000533 8A07                     mov al, [bx]
  1469 00000535 B400                     mov ah, 0
  1470 00000537 08C0                     or  al, al
  1471 00000539 0F847B00                 je .prs44
  1472                                  
  1473                                  ;-257         c=*s;
  1474                                  
  1475 0000053D 8B5E04                   mov bx, [bp+4]
  1476 00000540 8A07                     mov al, [bx]
  1477 00000542 B400                     mov ah, 0
  1478 00000544 8846FE                   mov [bp-2], al
  1479                                  
  1480                                  ;-258         if (c==34) if (com) com=0;
  1481                                  
  1482 00000547 8A46FE                   mov al, [bp-2]
  1483 0000054A 3C22                     cmp al, 34
  1484 0000054C 0F851800                 jne .prs45
  1485 00000550 8B46FC                   mov ax, [bp-4]
  1486 00000553 08C0                     or  al, al
  1487 00000555 0F840900                 je .prs46
  1488 00000559 B80000                   mov ax, 0
  1489 0000055C 8946FC                   mov [bp-4], ax
  1490                                  
  1491                                  ;-259                    else com=1;
  1492                                  
  1493 0000055F E90600                   jmp .prs47
  1494                                  .prs46:
  1495 00000562 B80100                   mov ax, 1
  1496 00000565 8946FC                   mov [bp-4], ax
  1497                                  
  1498                                  ;-260         if (c==92) {
  1499                                  
  1500                                  .prs47:
  1501                                  .prs45:
  1502 00000568 8A46FE                   mov al, [bp-2]
  1503 0000056B 3C5C                     cmp al, 92
  1504 0000056D 0F853500                 jne .prs48
  1505                                  
  1506                                  ;-261             if (com==0) {
  1507                                  
  1508 00000571 8B46FC                   mov ax, [bp-4]
  1509 00000574 83F800                   cmp ax, 0
  1510 00000577 0F852B00                 jne .prs49
  1511                                  
  1512                                  ;-262                 s++;
  1513                                  
  1514 0000057B FF4604                   inc  word[bp+4]
  1515                                  
  1516                                  ;-263                 c=*s;
  1517                                  
  1518 0000057E 8B5E04                   mov bx, [bp+4]
  1519 00000581 8A07                     mov al, [bx]
  1520 00000583 B400                     mov ah, 0
  1521 00000585 8846FE                   mov [bp-2], al
  1522                                  
  1523                                  ;-264                 if (c=='n') c=10;
  1524                                  
  1525 00000588 8A46FE                   mov al, [bp-2]
  1526 0000058B 3C6E                     cmp al, 110
  1527 0000058D 0F850600                 jne .prs50
  1528 00000591 B80A00                   mov ax, 10
  1529 00000594 8846FE                   mov [bp-2], al
  1530                                  
  1531                                  ;-265                 if (c=='t') c= 9;
  1532                                  
  1533                                  .prs50:
  1534 00000597 8A46FE                   mov al, [bp-2]
  1535 0000059A 3C74                     cmp al, 116
  1536 0000059C 0F850600                 jne .prs51
  1537 000005A0 B80900                   mov ax, 9
  1538 000005A3 8846FE                   mov [bp-2], al
  1539                                  
  1540                                  ;-266             }
  1541                                  
  1542                                  .prs51:
  1543                                  
  1544                                  ;-267         }
  1545                                  
  1546                                  .prs49:
  1547                                  
  1548                                  ;-268         prc(c);
  1549                                  
  1550                                  .prs48:
  1551 000005A6 8A46FE                   mov al, byte [bp-2]
  1552 000005A9 B400                     mov ah, 0
  1553 000005AB 50                       push ax
  1554 000005AC E810FF                   call prc
  1555 000005AF 83C402                   add  sp, 2
  1556                                  
  1557                                  ;-269         s++;
  1558                                  
  1559 000005B2 FF4604                   inc  word[bp+4]
  1560                                  
  1561                                  ;-270     }
  1562                                  
  1563                                  
  1564                                  ;-271 }
  1565                                  
  1566 000005B5 E978FF                   jmp .prs43
  1567                                  .prs44:
  1568                                  
  1569                                  ;-272 int eprnum(int n){//for docall1 procedure
  1570 000005B8 C9                       LEAVE
  1571 000005B9 C3                       ret
  1572                                  ENDP
  1573                                  
  1574                                  eprnum: PROC
  1575                                  
  1576                                  ;-273     int e;
  1577                                  
  1578                                  
  1579                                  ;-274     if(n<0) {
  1580                                  ;
  1581 000005BA C8020000                 ENTER  2,0
  1582 000005BE 8B4604                   mov ax, [bp+4]
  1583 000005C1 83F800                   cmp ax, 0
  1584 000005C4 0F8D1400                 jge .eprnum52
  1585                                  
  1586                                  ;-275         eprc('-');
  1587                                  
  1588 000005C8 6A2D                     push 45
  1589 000005CA E8B1FE                   call eprc
  1590 000005CD 83C402                   add  sp, 2
  1591                                  
  1592                                  ;-276         n=mkneg(n);
  1593                                  
  1594 000005D0 FF7604                   push word [bp+4]
  1595 000005D3 E8CEFA                   call mkneg
  1596 000005D6 83C402                   add  sp, 2
  1597 000005D9 894604                   mov [bp+4], ax
  1598                                  
  1599                                  ;-277     }
  1600                                  
  1601                                  
  1602                                  ;-278     if (n >= 10) {
  1603                                  
  1604                                  .eprnum52:
  1605 000005DC 8B4604                   mov ax, [bp+4]
  1606 000005DF 83F80A                   cmp ax, 10 ;unsigned : 1
  1607 000005E2 0F8C1500                 jl  .eprnum53
  1608                                  
  1609                                  ;-279         e=n/10;
  1610                                  
  1611 000005E6 8B4604                   mov ax, [bp+4]
  1612 000005E9 BB0A00                   mov bx, 10
  1613 000005EC 99                       cwd
  1614 000005ED F7FB                     idiv bx
  1615 000005EF 8946FE                   mov [bp-2], ax
  1616                                  
  1617                                  ;-280         eprnum(e);
  1618                                  
  1619 000005F2 FF76FE                   push word [bp-2]
  1620 000005F5 E8C2FF                   call eprnum
  1621 000005F8 83C402                   add  sp, 2
  1622                                  
  1623                                  ;-281     }
  1624                                  
  1625                                  
  1626                                  ;-282     n=n%10;
  1627                                  
  1628                                  .eprnum53:
  1629 000005FB 8B4604                   mov ax, [bp+4]
  1630 000005FE BB0A00                   mov bx, 10
  1631 00000601 99                       cwd
  1632 00000602 F7FB                     idiv bx
  1633 00000604 89D0                     mov ax, dx
  1634 00000606 894604                   mov [bp+4], ax
  1635                                  
  1636                                  ;-283     n=n+'0';
  1637                                  
  1638 00000609 8B4604                   mov ax, [bp+4]
  1639 0000060C 83C030                   add ax, 48
  1640 0000060F 894604                   mov [bp+4], ax
  1641                                  
  1642                                  ;-284     eprc(n);
  1643                                  
  1644 00000612 FF7604                   push word [bp+4]
  1645 00000615 E866FE                   call eprc
  1646 00000618 83C402                   add  sp, 2
  1647                                  
  1648                                  ;-285 }
  1649                                  
  1650                                  
  1651                                  ;-286 int pint1 (int n){
  1652 0000061B C9                       LEAVE
  1653 0000061C C3                       ret
  1654                                  ENDP
  1655                                  
  1656                                  pint1: PROC
  1657                                  
  1658                                  ;-287     int e;
  1659                                  
  1660                                  
  1661                                  ;-288     if(n<0) {  prc('-');  n=mkneg(n); }
  1662                                  ;
  1663 0000061D C8020000                 ENTER  2,0
  1664 00000621 8B4604                   mov ax, [bp+4]
  1665 00000624 83F800                   cmp ax, 0
  1666 00000627 0F8D1400                 jge .pint154
  1667 0000062B 6A2D                     push 45
  1668 0000062D E88FFE                   call prc
  1669 00000630 83C402                   add  sp, 2
  1670 00000633 FF7604                   push word [bp+4]
  1671 00000636 E86BFA                   call mkneg
  1672 00000639 83C402                   add  sp, 2
  1673 0000063C 894604                   mov [bp+4], ax
  1674                                  
  1675                                  ;-289     if (n >= 10) {
  1676                                  
  1677                                  .pint154:
  1678 0000063F 8B4604                   mov ax, [bp+4]
  1679 00000642 83F80A                   cmp ax, 10 ;unsigned : 1
  1680 00000645 0F8C1500                 jl  .pint155
  1681                                  
  1682                                  ;-290         e=n/10;
  1683                                  
  1684 00000649 8B4604                   mov ax, [bp+4]
  1685 0000064C BB0A00                   mov bx, 10
  1686 0000064F 99                       cwd
  1687 00000650 F7FB                     idiv bx
  1688 00000652 8946FE                   mov [bp-2], ax
  1689                                  
  1690                                  ;-291         pint1(e);
  1691                                  
  1692 00000655 FF76FE                   push word [bp-2]
  1693 00000658 E8C2FF                   call pint1
  1694 0000065B 83C402                   add  sp, 2
  1695                                  
  1696                                  ;-292     }
  1697                                  
  1698                                  
  1699                                  ;-293     n=n%10;
  1700                                  
  1701                                  .pint155:
  1702 0000065E 8B4604                   mov ax, [bp+4]
  1703 00000661 BB0A00                   mov bx, 10
  1704 00000664 99                       cwd
  1705 00000665 F7FB                     idiv bx
  1706 00000667 89D0                     mov ax, dx
  1707 00000669 894604                   mov [bp+4], ax
  1708                                  
  1709                                  ;-294     n += '0';
  1710                                  
  1711 0000066C 83460430                 add  word[bp+4], 48
  1712                                  
  1713                                  ;-295     prc(n);
  1714                                  
  1715 00000670 FF7604                   push word [bp+4]
  1716 00000673 E849FE                   call prc
  1717 00000676 83C402                   add  sp, 2
  1718                                  
  1719                                  ;-296 }
  1720                                  
  1721                                  
  1722                                  ;-297 int prunsign1(unsigned int n) {
  1723 00000679 C9                       LEAVE
  1724 0000067A C3                       ret
  1725                                  ENDP
  1726                                  
  1727                                  prunsign1: PROC
  1728                                  
  1729                                  ;-298     unsigned int e;
  1730                                  
  1731                                  
  1732                                  ;-299     if (n >= 10) {
  1733                                  ;
  1734 0000067B C8020000                 ENTER  2,0
  1735 0000067F 8B4604                   mov ax, [bp+4]
  1736 00000682 83F80A                   cmp ax, 10 ;unsigned : 0
  1737 00000685 0F821700                 jb  .prunsign156
  1738                                  
  1739                                  ;-300         e=n/10;
  1740                                  
  1741 00000689 8B4604                   mov ax, [bp+4]
  1742 0000068C BB0A00                   mov bx, 10
  1743 0000068F BA0000                   mov dx, 0
  1744 00000692 F7F3                     div bx
  1745 00000694 8946FE                   mov [bp-2], ax
  1746                                  
  1747                                  ;-301         prunsign1(e);
  1748                                  
  1749 00000697 FF76FE                   push word [bp-2]
  1750 0000069A E8DEFF                   call prunsign1
  1751 0000069D 83C402                   add  sp, 2
  1752                                  
  1753                                  ;-302     }
  1754                                  
  1755                                  
  1756                                  ;-303     n = n % 10; /*unsigned mod*/
  1757                                  
  1758                                  .prunsign156:
  1759 000006A0 8B4604                   mov ax, [bp+4]
  1760 000006A3 BB0A00                   mov bx, 10
  1761 000006A6 BA0000                   mov dx, 0
  1762 000006A9 F7F3                     div bx
  1763 000006AB 89D0                     mov ax, dx
  1764 000006AD 894604                   mov [bp+4], ax
  1765                                  
  1766                                  ;-304     n += '0';
  1767                                  
  1768 000006B0 83460430                 add  word[bp+4], 48
  1769                                  
  1770                                  ;-305     prc(n);
  1771                                  
  1772 000006B4 FF7604                   push word [bp+4]
  1773 000006B7 E805FE                   call prc
  1774 000006BA 83C402                   add  sp, 2
  1775                                  
  1776                                  ;-306 }
  1777                                  
  1778                                  
  1779                                  ;-307 int printint51(unsigned int j)  {
  1780 000006BD C9                       LEAVE
  1781 000006BE C3                       ret
  1782                                  ENDP
  1783                                  
  1784                                  printint51: PROC
  1785                                  
  1786                                  ;-308     if (j<10000) prc(32);
  1787                                  ;
  1788 000006BF C8000000                 ENTER  0,0
  1789 000006C3 8B4604                   mov ax, [bp+4]
  1790 000006C6 3D1027                   cmp ax, 10000
  1791 000006C9 0F8D0800                 jge .printint5157
  1792 000006CD 6A20                     push 32
  1793 000006CF E8EDFD                   call prc
  1794 000006D2 83C402                   add  sp, 2
  1795                                  
  1796                                  ;-309     if (j<1000) prc(32);
  1797                                  
  1798                                  .printint5157:
  1799 000006D5 8B4604                   mov ax, [bp+4]
  1800 000006D8 3DE803                   cmp ax, 1000
  1801 000006DB 0F8D0800                 jge .printint5158
  1802 000006DF 6A20                     push 32
  1803 000006E1 E8DBFD                   call prc
  1804 000006E4 83C402                   add  sp, 2
  1805                                  
  1806                                  ;-310     if (j<100) prc(32);
  1807                                  
  1808                                  .printint5158:
  1809 000006E7 8B4604                   mov ax, [bp+4]
  1810 000006EA 83F864                   cmp ax, 100
  1811 000006ED 0F8D0800                 jge .printint5159
  1812 000006F1 6A20                     push 32
  1813 000006F3 E8C9FD                   call prc
  1814 000006F6 83C402                   add  sp, 2
  1815                                  
  1816                                  ;-311     if (j<10) prc(32);
  1817                                  
  1818                                  .printint5159:
  1819 000006F9 8B4604                   mov ax, [bp+4]
  1820 000006FC 83F80A                   cmp ax, 10
  1821 000006FF 0F8D0800                 jge .printint5160
  1822 00000703 6A20                     push 32
  1823 00000705 E8B7FD                   call prc
  1824 00000708 83C402                   add  sp, 2
  1825                                  
  1826                                  ;-312     prunsign1(j);
  1827                                  
  1828                                  .printint5160:
  1829 0000070B FF7604                   push word [bp+4]
  1830 0000070E E86AFF                   call prunsign1
  1831 00000711 83C402                   add  sp, 2
  1832                                  
  1833                                  ;-313 }
  1834                                  
  1835                                  
  1836                                  ;-314 
  1837                                  
  1838                                  
  1839                                  ;-315 
  1840                                  
  1841                                  
  1842                                  ;-316 char doglobName[IDLENMAX];
  1843 00000714 C9                       LEAVE
  1844 00000715 C3                       ret
  1845                                  ENDP
  1846                                  section .bss
  1847                                  absolute 55840
  1848 0000DA20 <res 0000000F>          doglobName resb 15
  1849                                  section .text
  1850                                  
  1851                                  ;-317 int doglob() {
  1852                                  
  1853                                  
  1854                                  doglob: PROC
  1855                                  
  1856                                  ;-318     int i; int j; int isstrarr; isstrarr=0;
  1857                                  ;
  1858 00000716 C8060000                 ENTER  6,0
  1859 0000071A B80000                   mov ax, 0
  1860 0000071D 8946FA                   mov [bp-6], ax
  1861                                  
  1862                                  ;-319   if (GTop >= LSTART) error1("Global table full");
  1863                                  
  1864 00000720 A1[3900]                 mov ax, [GTop]
  1865 00000723 3DC800                   cmp ax, 200 ;unsigned : 1
  1866 00000726 0F8C0900                 jl  .doglob61
  1867 0000072A 68[6B0A]                 push doglob_0
  1868 0000072D E83B35                   call error1
  1869 00000730 83C402                   add  sp, 2
  1870                                  
  1871                                  ;-320   if (iswidth == 0) error1("no VOID as var type");
  1872                                  
  1873                                  .doglob61:
  1874 00000733 A0[3600]                 mov al, [iswidth]
  1875 00000736 3C00                     cmp al, 0
  1876 00000738 0F850900                 jne .doglob62
  1877 0000073C 68[7D0A]                 push doglob_1
  1878 0000073F E82935                   call error1
  1879 00000742 83C402                   add  sp, 2
  1880                                  
  1881                                  ;-321   checknamelen();
  1882                                  
  1883                                  .doglob62:
  1884 00000745 E842FC                   call checknamelen
  1885                                  
  1886                                  ;-322   if (checkName() != 0) error1("Variable already defined");
  1887                                  
  1888 00000748 E88305                   call checkName
  1889 0000074B 3C00                     cmp al, 0
  1890 0000074D 0F840900                 je  .doglob63
  1891 00000751 68[910A]                 push doglob_2
  1892 00000754 E81435                   call error1
  1893 00000757 83C402                   add  sp, 2
  1894                                  
  1895                                  ;-323   if (istoken('[')) { istype='&';
  1896                                  
  1897                                  .doglob63:
  1898 0000075A 6A5B                     push 91
  1899 0000075C E895FC                   call istoken
  1900 0000075F 83C402                   add  sp, 2
  1901 00000762 08C0                     or  al, al
  1902 00000764 0F84E201                 je .doglob64
  1903 00000768 B82600                   mov ax, 38
  1904 0000076B A2[3000]                 mov byte [istype], al
  1905                                  
  1906                                  ;-324     if (istoken(T_CONST)) {
  1907                                  
  1908 0000076E 680101                   push 257
  1909 00000771 E880FC                   call istoken
  1910 00000774 83C402                   add  sp, 2
  1911 00000777 08C0                     or  al, al
  1912 00000779 0F84C200                 je .doglob65
  1913                                  
  1914                                  ;-325       prs("\nsection .bss\nabsolute ");
  1915                                  
  1916 0000077D 68[AA0A]                 push doglob_3
  1917 00000780 E8A3FD                   call prs
  1918 00000783 83C402                   add  sp, 2
  1919                                  
  1920                                  ;-326       prunsign1(orgData);
  1921                                  
  1922 00000786 FF36[1200]               push word [orgData]
  1923 0000078A E8EEFE                   call prunsign1
  1924 0000078D 83C402                   add  sp, 2
  1925                                  
  1926                                  ;-327       prs("\n"); prs(symbol);
  1927                                  
  1928 00000790 68[C40A]                 push doglob_4
  1929 00000793 E890FD                   call prs
  1930 00000796 83C402                   add  sp, 2
  1931 00000799 8D06BB69                 lea  ax, [symbol]
  1932 0000079D 50                       push ax
  1933 0000079E E885FD                   call prs
  1934 000007A1 83C402                   add  sp, 2
  1935                                  
  1936                                  ;-328       if (iswidth==1) prs(" resb ");
  1937                                  
  1938 000007A4 A0[3600]                 mov al, [iswidth]
  1939 000007A7 3C01                     cmp al, 1
  1940 000007A9 0F850900                 jne .doglob66
  1941 000007AD 68[C70A]                 push doglob_5
  1942 000007B0 E873FD                   call prs
  1943 000007B3 83C402                   add  sp, 2
  1944                                  
  1945                                  ;-329       if (iswidth==2) prs(" resw ");
  1946                                  
  1947                                  .doglob66:
  1948 000007B6 A0[3600]                 mov al, [iswidth]
  1949 000007B9 3C02                     cmp al, 2
  1950 000007BB 0F850900                 jne .doglob67
  1951 000007BF 68[CE0A]                 push doglob_6
  1952 000007C2 E861FD                   call prs
  1953 000007C5 83C402                   add  sp, 2
  1954                                  
  1955                                  ;-330       if (iswidth==4) prs(" resd ");
  1956                                  
  1957                                  .doglob67:
  1958 000007C8 A0[3600]                 mov al, [iswidth]
  1959 000007CB 3C04                     cmp al, 4
  1960 000007CD 0F850900                 jne .doglob68
  1961 000007D1 68[D50A]                 push doglob_7
  1962 000007D4 E84FFD                   call prs
  1963 000007D7 83C402                   add  sp, 2
  1964                                  
  1965                                  ;-331       prunsign1(lexval);
  1966                                  
  1967                                  .doglob68:
  1968 000007DA FF36[2C00]               push word [lexval]
  1969 000007DE E89AFE                   call prunsign1
  1970 000007E1 83C402                   add  sp, 2
  1971                                  
  1972                                  ;-332       prs("\nsection .text");
  1973                                  
  1974 000007E4 68[DC0A]                 push doglob_8
  1975 000007E7 E83CFD                   call prs
  1976 000007EA 83C402                   add  sp, 2
  1977                                  
  1978                                  ;-333       orgData=orgData+lexval;
  1979                                  
  1980 000007ED A1[1200]                 mov ax, [orgData]
  1981 000007F0 0306[2C00]               add ax, [lexval]
  1982 000007F4 A3[1200]                 mov word [orgData], ax
  1983                                  
  1984                                  ;-334       if (iswidth==2) orgData=orgData+lexval;
  1985                                  
  1986 000007F7 A0[3600]                 mov al, [iswidth]
  1987 000007FA 3C02                     cmp al, 2
  1988 000007FC 0F850A00                 jne .doglob69
  1989 00000800 A1[1200]                 mov ax, [orgData]
  1990 00000803 0306[2C00]               add ax, [lexval]
  1991 00000807 A3[1200]                 mov word [orgData], ax
  1992                                  
  1993                                  ;-335       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1994                                  
  1995                                  .doglob69:
  1996 0000080A A0[3600]                 mov al, [iswidth]
  1997 0000080D 3C04                     cmp al, 4
  1998 0000080F 0F851400                 jne .doglob70
  1999 00000813 A1[2C00]                 mov ax, [lexval]
  2000 00000816 BB0300                   mov bx, 3
  2001 00000819 F7E3                     mul bx
  2002 0000081B 8946FE                   mov [bp-2], ax
  2003 0000081E A1[1200]                 mov ax, [orgData]
  2004 00000821 0346FE                   add ax, [bp-2]
  2005 00000824 A3[1200]                 mov word [orgData], ax
  2006                                  
  2007                                  ;-336       GData[GTop]=lexval; expect(']');
  2008                                  
  2009                                  .doglob70:
  2010 00000827 A1[2C00]                 mov ax, [lexval]
  2011 0000082A 8B1E[3900]               mov bx, [GTop]
  2012 0000082E D1E3                     shl bx, 1
  2013 00000830 89873873                 mov [GData+bx], ax
  2014 00000834 6A5D                     push 93
  2015 00000836 E8DDFB                   call expect
  2016 00000839 83C402                   add  sp, 2
  2017                                  
  2018                                  ;-337     }else { expect(']');
  2019                                  
  2020 0000083C E90801                   jmp .doglob71
  2021                                  .doglob65:
  2022 0000083F 6A5D                     push 93
  2023 00000841 E8D2FB                   call expect
  2024 00000844 83C402                   add  sp, 2
  2025                                  
  2026                                  ;-338       if (iswidth != 1) error1("Only ByteArray allowed");
  2027                                  
  2028 00000847 A0[3600]                 mov al, [iswidth]
  2029 0000084A 3C01                     cmp al, 1
  2030 0000084C 0F840900                 je  .doglob72
  2031 00000850 68[EC0A]                 push doglob_9
  2032 00000853 E81534                   call error1
  2033 00000856 83C402                   add  sp, 2
  2034                                  
  2035                                  ;-339       prs("\n"); prs(symbol); prs(" db ");
  2036                                  
  2037                                  .doglob72:
  2038 00000859 68[030B]                 push doglob_10
  2039 0000085C E8C7FC                   call prs
  2040 0000085F 83C402                   add  sp, 2
  2041 00000862 8D06BB69                 lea  ax, [symbol]
  2042 00000866 50                       push ax
  2043 00000867 E8BCFC                   call prs
  2044 0000086A 83C402                   add  sp, 2
  2045 0000086D 68[060B]                 push doglob_11
  2046 00000870 E8B3FC                   call prs
  2047 00000873 83C402                   add  sp, 2
  2048                                  
  2049                                  ;-340       isstrarr=1; strcpy(doglobName, symbol);
  2050                                  
  2051 00000876 B80100                   mov ax, 1
  2052 00000879 8946FA                   mov [bp-6], ax
  2053 0000087C 8D06BB69                 lea  ax, [symbol]
  2054 00000880 50                       push ax
  2055 00000881 8D0620DA                 lea  ax, [doglobName]
  2056 00000885 50                       push ax
  2057 00000886 E8A3F9                   call strcpy
  2058 00000889 83C404                   add  sp, 4
  2059                                  
  2060                                  ;-341       expect('=');
  2061                                  
  2062 0000088C 6A3D                     push 61
  2063 0000088E E885FB                   call expect
  2064 00000891 83C402                   add  sp, 2
  2065                                  
  2066                                  ;-342       if (istoken(T_STRING)) {
  2067                                  
  2068 00000894 680201                   push 258
  2069 00000897 E85AFB                   call istoken
  2070 0000089A 83C402                   add  sp, 2
  2071 0000089D 08C0                     or  al, al
  2072 0000089F 0F844200                 je .doglob73
  2073                                  
  2074                                  ;-343         prc(34); prscomment(symbol); prc(34); prs(",0");
  2075                                  
  2076 000008A3 6A22                     push 34
  2077 000008A5 E817FC                   call prc
  2078 000008A8 83C402                   add  sp, 2
  2079 000008AB 8D06BB69                 lea  ax, [symbol]
  2080 000008AF 50                       push ax
  2081 000008B0 E837FC                   call prscomment
  2082 000008B3 83C402                   add  sp, 2
  2083 000008B6 6A22                     push 34
  2084 000008B8 E804FC                   call prc
  2085 000008BB 83C402                   add  sp, 2
  2086 000008BE 68[0B0B]                 push doglob_12
  2087 000008C1 E862FC                   call prs
  2088 000008C4 83C402                   add  sp, 2
  2089                                  
  2090                                  ;-344         i=strlen(symbol); GData[GTop]=i; }
  2091                                  
  2092 000008C7 8D06BB69                 lea  ax, [symbol]
  2093 000008CB 50                       push ax
  2094 000008CC E835F9                   call strlen
  2095 000008CF 83C402                   add  sp, 2
  2096 000008D2 8946FE                   mov [bp-2], ax
  2097 000008D5 8B46FE                   mov ax, [bp-2]
  2098 000008D8 8B1E[3900]               mov bx, [GTop]
  2099 000008DC D1E3                     shl bx, 1
  2100 000008DE 89873873                 mov [GData+bx], ax
  2101                                  
  2102                                  ;-345       else if (istoken('{' )) { i=0;
  2103                                  
  2104 000008E2 E96200                   jmp .doglob74
  2105                                  .doglob73:
  2106 000008E5 6A7B                     push 123
  2107 000008E7 E80AFB                   call istoken
  2108 000008EA 83C402                   add  sp, 2
  2109 000008ED 08C0                     or  al, al
  2110 000008EF 0F844B00                 je .doglob75
  2111 000008F3 B80000                   mov ax, 0
  2112 000008F6 8946FE                   mov [bp-2], ax
  2113                                  
  2114                                  ;-346         do { if(i) prc(',');
  2115                                  
  2116                                  .doglob76:
  2117 000008F9 8B46FE                   mov ax, [bp-2]
  2118 000008FC 08C0                     or  al, al
  2119 000008FE 0F840800                 je .doglob77
  2120 00000902 6A2C                     push 44
  2121 00000904 E8B8FB                   call prc
  2122 00000907 83C402                   add  sp, 2
  2123                                  
  2124                                  ;-347           expect(T_CONST); prunsign1(lexval); i=1; }
  2125                                  
  2126                                  .doglob77:
  2127 0000090A 680101                   push 257
  2128 0000090D E806FB                   call expect
  2129 00000910 83C402                   add  sp, 2
  2130 00000913 FF36[2C00]               push word [lexval]
  2131 00000917 E861FD                   call prunsign1
  2132 0000091A 83C402                   add  sp, 2
  2133 0000091D B80100                   mov ax, 1
  2134 00000920 8946FE                   mov [bp-2], ax
  2135                                  
  2136                                  ;-348         while (istoken(',')); expect('}'); }
  2137                                  
  2138 00000923 6A2C                     push 44
  2139 00000925 E8CCFA                   call istoken
  2140 00000928 83C402                   add  sp, 2
  2141 0000092B 08C0                     or  al, al
  2142 0000092D 0F840200                 je .doglob78
  2143 00000931 EBC6                     jmp .doglob76
  2144                                  .doglob78:
  2145 00000933 6A7D                     push 125
  2146 00000935 E8DEFA                   call expect
  2147 00000938 83C402                   add  sp, 2
  2148                                  
  2149                                  ;-349       else error1("String or number array expected");
  2150                                  
  2151 0000093B E90900                   jmp .doglob79
  2152                                  .doglob75:
  2153 0000093E 68[0E0B]                 push doglob_13
  2154 00000941 E82733                   call error1
  2155 00000944 83C402                   add  sp, 2
  2156                                  
  2157                                  ;-350       };
  2158                                  
  2159                                  .doglob79:
  2160                                  .doglob74:
  2161                                  .doglob71:
  2162                                  
  2163                                  ;-351   }else { //expect('=');
  2164                                  
  2165 00000947 E99E00                   jmp .doglob80
  2166                                  .doglob64:
  2167                                  
  2168                                  ;-352     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  2169                                  
  2170 0000094A 68[2E0B]                 push doglob_14
  2171 0000094D E8D6FB                   call prs
  2172 00000950 83C402                   add  sp, 2
  2173 00000953 8D06BB69                 lea  ax, [symbol]
  2174 00000957 50                       push ax
  2175 00000958 E8CBFB                   call prs
  2176 0000095B 83C402                   add  sp, 2
  2177 0000095E A0[3000]                 mov al, [istype]
  2178 00000961 3C2A                     cmp al, 42
  2179 00000963 0F850C00                 jne .doglob81
  2180 00000967 68[310B]                 push doglob_15
  2181 0000096A E8B9FB                   call prs
  2182 0000096D 83C402                   add  sp, 2
  2183                                  
  2184                                  ;-353     else {
  2185                                  
  2186 00000970 E93300                   jmp .doglob82
  2187                                  .doglob81:
  2188                                  
  2189                                  ;-354       if      (iswidth==1) prs(" db ");
  2190                                  
  2191 00000973 A0[3600]                 mov al, [iswidth]
  2192 00000976 3C01                     cmp al, 1
  2193 00000978 0F850C00                 jne .doglob83
  2194 0000097C 68[360B]                 push doglob_16
  2195 0000097F E8A4FB                   call prs
  2196 00000982 83C402                   add  sp, 2
  2197                                  
  2198                                  ;-355       else if (iswidth==2) prs(" dw ");
  2199                                  
  2200 00000985 E91E00                   jmp .doglob84
  2201                                  .doglob83:
  2202 00000988 A0[3600]                 mov al, [iswidth]
  2203 0000098B 3C02                     cmp al, 2
  2204 0000098D 0F850C00                 jne .doglob85
  2205 00000991 68[3B0B]                 push doglob_17
  2206 00000994 E88FFB                   call prs
  2207 00000997 83C402                   add  sp, 2
  2208                                  
  2209                                  ;-356       else                 prs(" dd ");
  2210                                  
  2211 0000099A E90900                   jmp .doglob86
  2212                                  .doglob85:
  2213 0000099D 68[400B]                 push doglob_18
  2214 000009A0 E883FB                   call prs
  2215 000009A3 83C402                   add  sp, 2
  2216                                  
  2217                                  ;-357     }
  2218                                  
  2219                                  .doglob86:
  2220                                  .doglob84:
  2221                                  
  2222                                  ;-358     if(istoken('-')) prc('-');
  2223                                  
  2224                                  .doglob82:
  2225 000009A6 6A2D                     push 45
  2226 000009A8 E849FA                   call istoken
  2227 000009AB 83C402                   add  sp, 2
  2228 000009AE 08C0                     or  al, al
  2229 000009B0 0F840800                 je .doglob87
  2230 000009B4 6A2D                     push 45
  2231 000009B6 E806FB                   call prc
  2232 000009B9 83C402                   add  sp, 2
  2233                                  
  2234                                  ;-359     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  2235                                  
  2236                                  .doglob87:
  2237 000009BC 6A3D                     push 61
  2238 000009BE E833FA                   call istoken
  2239 000009C1 83C402                   add  sp, 2
  2240 000009C4 08C0                     or  al, al
  2241 000009C6 0F841600                 je .doglob88
  2242 000009CA 680101                   push 257
  2243 000009CD E846FA                   call expect
  2244 000009D0 83C402                   add  sp, 2
  2245 000009D3 FF36[2C00]               push word [lexval]
  2246 000009D7 E8A1FC                   call prunsign1
  2247 000009DA 83C402                   add  sp, 2
  2248                                  
  2249                                  ;-360     else prunsign1(0); }
  2250                                  
  2251 000009DD E90800                   jmp .doglob89
  2252                                  .doglob88:
  2253 000009E0 6A00                     push 0
  2254 000009E2 E896FC                   call prunsign1
  2255 000009E5 83C402                   add  sp, 2
  2256                                  .doglob89:
  2257                                  
  2258                                  ;-361   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  2259                                  
  2260                                  .doglob80:
  2261 000009E8 A0[3300]                 mov al, [issign]
  2262 000009EB 8B1E[3900]               mov bx, [GTop]
  2263 000009EF 8887306C                 mov [GSign+bx], al
  2264 000009F3 A0[3600]                 mov al, [iswidth]
  2265 000009F6 8B1E[3900]               mov bx, [GTop]
  2266 000009FA 88875C6D                 mov [GWidth+bx], al
  2267 000009FE A0[3000]                 mov al, [istype]
  2268 00000A01 8B1E[3900]               mov bx, [GTop]
  2269 00000A05 8887046B                 mov [GType+bx], al
  2270                                  
  2271                                  ;-362   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  2272                                  
  2273 00000A09 A1[4900]                 mov ax, [lineno]
  2274 00000A0C 83E801                   sub ax, 1
  2275 00000A0F 8B1E[3900]               mov bx, [GTop]
  2276 00000A13 D1E3                     shl bx, 1
  2277 00000A15 8987886E                 mov [GAdr+bx], ax
  2278 00000A19 B80000                   mov ax, 0
  2279 00000A1C 8B1E[3900]               mov bx, [GTop]
  2280 00000A20 D1E3                     shl bx, 1
  2281 00000A22 8987E070                 mov [GUsed+bx], ax
  2282                                  
  2283                                  ;-363   pt=adrofname(GTop);
  2284                                  
  2285 00000A26 FF36[3900]               push word [GTop]
  2286 00000A2A E8CF01                   call adrofname
  2287 00000A2D 83C402                   add  sp, 2
  2288 00000A30 A3[4B00]                 mov word [pt], ax
  2289                                  
  2290                                  ;-364   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  2291                                  
  2292 00000A33 8B46FA                   mov ax, [bp-6]
  2293 00000A36 08C0                     or  al, al
  2294 00000A38 0F841200                 je .doglob90
  2295 00000A3C 8D0620DA                 lea  ax, [doglobName]
  2296 00000A40 50                       push ax
  2297 00000A41 FF36[4B00]               push word [pt]
  2298 00000A45 E8E4F7                   call strcpy
  2299 00000A48 83C404                   add  sp, 4
  2300 00000A4B E90F00                   jmp .doglob91
  2301                                  .doglob90:
  2302 00000A4E 8D06BB69                 lea  ax, [symbol]
  2303 00000A52 50                       push ax
  2304 00000A53 FF36[4B00]               push word [pt]
  2305 00000A57 E8D2F7                   call strcpy
  2306 00000A5A 83C404                   add  sp, 4
  2307                                  
  2308                                  ;-365   GTop++; expect(';'); }
  2309                                  
  2310                                  .doglob91:
  2311 00000A5D FF06[3900]               inc  word[GTop]
  2312 00000A61 6A3B                     push 59
  2313 00000A63 E8B0F9                   call expect
  2314 00000A66 83C402                   add  sp, 2
  2315                                  
  2316                                  ;-366 
  2317                                  
  2318                                  
  2319                                  ;-367 int gettypes(int i) {int j; char c;
  2320 00000A69 C9                       LEAVE
  2321 00000A6A C3                       ret
  2322 00000A6B 476C6F62616C207461-     doglob_0 db "Global table full",0
  2323 00000A74 626C652066756C6C00 
  2324 00000A7D 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  2325 00000A86 732076617220747970-
  2326 00000A8F 6500               
  2327 00000A91 5661726961626C6520-     doglob_2 db "Variable already defined",0
  2328 00000A9A 616C72656164792064-
  2329 00000AA3 6566696E656400     
  2330 00000AAA 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  2331 00000AB3 202E6273735C6E6162-
  2332 00000ABC 736F6C7574652000   
  2333 00000AC4 5C6E00                  doglob_4 db "\n",0
  2334 00000AC7 20726573622000          doglob_5 db " resb ",0
  2335 00000ACE 20726573772000          doglob_6 db " resw ",0
  2336 00000AD5 20726573642000          doglob_7 db " resd ",0
  2337 00000ADC 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  2338 00000AE5 202E7465787400     
  2339 00000AEC 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  2340 00000AF5 417272617920616C6C-
  2341 00000AFE 6F77656400         
  2342 00000B03 5C6E00                  doglob_10 db "\n",0
  2343 00000B06 2064622000              doglob_11 db " db ",0
  2344 00000B0B 2C3000                  doglob_12 db ",0",0
  2345 00000B0E 537472696E67206F72-     doglob_13 db "String or number array expected",0
  2346 00000B17 206E756D6265722061-
  2347 00000B20 727261792065787065-
  2348 00000B29 6374656400         
  2349 00000B2E 5C6E00                  doglob_14 db "\n",0
  2350 00000B31 2064772000              doglob_15 db " dw ",0
  2351 00000B36 2064622000              doglob_16 db " db ",0
  2352 00000B3B 2064772000              doglob_17 db " dw ",0
  2353 00000B40 2064642000              doglob_18 db " dd ",0
  2354                                  ENDP
  2355                                  
  2356                                  gettypes: PROC
  2357                                  
  2358                                  ;-368   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  2359                                  ;
  2360 00000B45 C8040000                 ENTER  4,0
  2361 00000B49 8B5E04                   mov bx, [bp+4]
  2362 00000B4C 8A87306C                 mov al, [GSign + bx]
  2363 00000B50 8846FC                   mov [bp-4], al
  2364 00000B53 8A46FC                   mov al, [bp-4]
  2365 00000B56 3C53                     cmp al, 83
  2366 00000B58 0F850900                 jne .gettypes92
  2367 00000B5C B80100                   mov ax, 1
  2368 00000B5F A3[3100]                 mov word [signi], ax
  2369 00000B62 E90600                   jmp .gettypes93
  2370                                  .gettypes92:
  2371 00000B65 B80000                   mov ax, 0
  2372 00000B68 A3[3100]                 mov word [signi], ax
  2373                                  
  2374                                  ;-369   c=GWidth[i]; widthi=0;wi=0;
  2375                                  
  2376                                  .gettypes93:
  2377 00000B6B 8B5E04                   mov bx, [bp+4]
  2378 00000B6E 8A875C6D                 mov al, [GWidth + bx]
  2379 00000B72 8846FC                   mov [bp-4], al
  2380 00000B75 B80000                   mov ax, 0
  2381 00000B78 A3[3400]                 mov word [widthi], ax
  2382 00000B7B B80000                   mov ax, 0
  2383 00000B7E A3[3700]                 mov word [wi], ax
  2384                                  
  2385                                  ;-370   if (c==1) {widthi=1;wi=1;}
  2386                                  
  2387 00000B81 8A46FC                   mov al, [bp-4]
  2388 00000B84 3C01                     cmp al, 1
  2389 00000B86 0F850C00                 jne .gettypes94
  2390 00000B8A B80100                   mov ax, 1
  2391 00000B8D A3[3400]                 mov word [widthi], ax
  2392 00000B90 B80100                   mov ax, 1
  2393 00000B93 A3[3700]                 mov word [wi], ax
  2394                                  
  2395                                  ;-371   if (c==2) {widthi=2;wi=2;}
  2396                                  
  2397                                  .gettypes94:
  2398 00000B96 8A46FC                   mov al, [bp-4]
  2399 00000B99 3C02                     cmp al, 2
  2400 00000B9B 0F850C00                 jne .gettypes95
  2401 00000B9F B80200                   mov ax, 2
  2402 00000BA2 A3[3400]                 mov word [widthi], ax
  2403 00000BA5 B80200                   mov ax, 2
  2404 00000BA8 A3[3700]                 mov word [wi], ax
  2405                                  
  2406                                  ;-372   if (c==4) {widthi=4;wi=4;}
  2407                                  
  2408                                  .gettypes95:
  2409 00000BAB 8A46FC                   mov al, [bp-4]
  2410 00000BAE 3C04                     cmp al, 4
  2411 00000BB0 0F850C00                 jne .gettypes96
  2412 00000BB4 B80400                   mov ax, 4
  2413 00000BB7 A3[3400]                 mov word [widthi], ax
  2414 00000BBA B80400                   mov ax, 4
  2415 00000BBD A3[3700]                 mov word [wi], ax
  2416                                  
  2417                                  ;-373   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  2418                                  
  2419                                  .gettypes96:
  2420 00000BC0 8B5E04                   mov bx, [bp+4]
  2421 00000BC3 8A87046B                 mov al, [GType + bx]
  2422 00000BC7 8846FC                   mov [bp-4], al
  2423 00000BCA B80000                   mov ax, 0
  2424 00000BCD A3[2E00]                 mov word [typei], ax
  2425 00000BD0 8A46FC                   mov al, [bp-4]
  2426 00000BD3 3C2A                     cmp al, 42
  2427 00000BD5 0F850C00                 jne .gettypes97
  2428 00000BD9 B80100                   mov ax, 1
  2429 00000BDC A3[2E00]                 mov word [typei], ax
  2430 00000BDF B80200                   mov ax, 2
  2431 00000BE2 A3[3700]                 mov word [wi], ax
  2432                                  
  2433                                  ;-374   if (c=='&')  typei=2;
  2434                                  
  2435                                  .gettypes97:
  2436 00000BE5 8A46FC                   mov al, [bp-4]
  2437 00000BE8 3C26                     cmp al, 38
  2438 00000BEA 0F850600                 jne .gettypes98
  2439 00000BEE B80200                   mov ax, 2
  2440 00000BF1 A3[2E00]                 mov word [typei], ax
  2441                                  
  2442                                  ;-375   return i; }
  2443                                  
  2444                                  .gettypes98:
  2445 00000BF4 8B4604                   mov ax, [bp+4]
  2446 00000BF7 E90000                   jmp .retngettypes
  2447                                  
  2448                                  ;-376 int adrofname(unsigned int i) { adrF(GNameField, i); }
  2449                                  
  2450 00000BFA C9                       .retngettypes: LEAVE
  2451 00000BFB C3                       ret
  2452                                  ENDP
  2453                                  
  2454                                  adrofname: PROC;
  2455 00000BFC C8000000                 ENTER  0,0
  2456 00000C00 FF7604                   push word [bp+4]
  2457 00000C03 8D069075                 lea  ax, [GNameField]
  2458 00000C07 50                       push ax
  2459 00000C08 E80500                   call adrF
  2460 00000C0B 83C404                   add  sp, 4
  2461                                  
  2462                                  ;-377 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  2463 00000C0E C9                       LEAVE
  2464 00000C0F C3                       ret
  2465                                  ENDP
  2466                                  
  2467                                  adrF: PROC;
  2468 00000C10 C8000000                 ENTER  0,0
  2469 00000C14 8B4606                   mov ax, [bp+6]
  2470 00000C17 C1E004                   shl ax, 4
  2471                                  
  2472                                  ;-378   __asm{ add ax, [bp+4]  ; offset s } }
  2473                                  
  2474 00000C1A 034604                   add ax, [bp+4]  ; offset s 
  2475                                  
  2476                                  ;-379 int printName(unsigned int i) {int j;
  2477 00000C1D C9                       LEAVE
  2478 00000C1E C3                       ret
  2479                                  ENDP
  2480                                  
  2481                                  printName: PROC
  2482                                  
  2483                                  ;-380   if (i < LSTART) { i=adrofname(i); prs(i); }
  2484                                  ;
  2485 00000C1F C8020000                 ENTER  2,0
  2486 00000C23 8B4604                   mov ax, [bp+4]
  2487 00000C26 3DC800                   cmp ax, 200
  2488 00000C29 0F8D1800                 jge .printName99
  2489 00000C2D FF7604                   push word [bp+4]
  2490 00000C30 E8C9FF                   call adrofname
  2491 00000C33 83C402                   add  sp, 2
  2492 00000C36 894604                   mov [bp+4], ax
  2493 00000C39 FF7604                   push word [bp+4]
  2494 00000C3C E8E7F8                   call prs
  2495 00000C3F 83C402                   add  sp, 2
  2496                                  
  2497                                  ;-381   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  2498                                  
  2499 00000C42 E93800                   jmp .printName100
  2500                                  .printName99:
  2501 00000C45 68[7F0C]                 push printName_0
  2502 00000C48 E8DBF8                   call prs
  2503 00000C4B 83C402                   add  sp, 2
  2504 00000C4E 8B5E04                   mov bx, [bp+4]
  2505 00000C51 D1E3                     shl bx, 1
  2506 00000C53 8B873873                 mov ax, [GData + bx]
  2507 00000C57 8946FE                   mov [bp-2], ax
  2508 00000C5A 8B46FE                   mov ax, [bp-2]
  2509 00000C5D 83F800                   cmp ax, 0
  2510 00000C60 0F8E0800                 jle .printName101
  2511 00000C64 6A2B                     push 43
  2512 00000C66 E856F8                   call prc
  2513 00000C69 83C402                   add  sp, 2
  2514                                  .printName101:
  2515 00000C6C FF76FE                   push word [bp-2]
  2516 00000C6F E8ABF9                   call pint1
  2517 00000C72 83C402                   add  sp, 2
  2518 00000C75 6A5D                     push 93
  2519 00000C77 E845F8                   call prc
  2520 00000C7A 83C402                   add  sp, 2
  2521                                  
  2522                                  ;-382 }
  2523                                  
  2524                                  .printName100:
  2525                                  
  2526                                  ;-383 int searchname() { unsigned int i;
  2527 00000C7D C9                       LEAVE
  2528 00000C7E C3                       ret
  2529 00000C7F 5B627000                printName_0 db "[bp",0
  2530                                  ENDP
  2531                                  
  2532                                  searchname: PROC
  2533                                  
  2534                                  ;-384   i=checkName(); if (i == 0) error1("Variable unknown");
  2535                                  ;
  2536 00000C83 C8020000                 ENTER  2,0
  2537 00000C87 E84400                   call checkName
  2538 00000C8A 8946FE                   mov [bp-2], ax
  2539 00000C8D 8B46FE                   mov ax, [bp-2]
  2540 00000C90 83F800                   cmp ax, 0
  2541 00000C93 0F850900                 jne .searchname102
  2542 00000C97 68[BD0C]                 push searchname_0
  2543 00000C9A E8CE2F                   call error1
  2544 00000C9D 83C402                   add  sp, 2
  2545                                  
  2546                                  ;-385   GUsed[i]=GUsed[i] + 1; return i;
  2547                                  
  2548                                  .searchname102:
  2549 00000CA0 8B5EFE                   mov bx, [bp-2]
  2550 00000CA3 D1E3                     shl bx, 1
  2551 00000CA5 8B87E070                 mov ax, [GUsed + bx]
  2552 00000CA9 83C001                   add ax, 1
  2553 00000CAC 8B5EFE                   mov bx, [bp-2]
  2554 00000CAF D1E3                     shl bx, 1
  2555 00000CB1 8987E070                 mov [GUsed+bx], ax
  2556 00000CB5 8B46FE                   mov ax, [bp-2]
  2557 00000CB8 E90000                   jmp .retnsearchname
  2558                                  
  2559                                  ;-386 }
  2560                                  
  2561                                  
  2562                                  ;-387 int checkName() { unsigned int i; unsigned int j;
  2563                                  
  2564 00000CBB C9                       .retnsearchname: LEAVE
  2565 00000CBC C3                       ret
  2566 00000CBD 5661726961626C6520-     searchname_0 db "Variable unknown",0
  2567 00000CC6 756E6B6E6F776E00   
  2568                                  ENDP
  2569                                  
  2570                                  checkName: PROC
  2571                                  
  2572                                  ;-388   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2573                                  ;
  2574 00000CCE C8040000                 ENTER  4,0
  2575 00000CD2 B8C800                   mov ax, 200
  2576 00000CD5 8946FE                   mov [bp-2], ax
  2577                                  .checkName103:
  2578 00000CD8 8B46FE                   mov ax, [bp-2]
  2579 00000CDB 3B06[3B00]               cmp ax, [LTop]
  2580 00000CDF 0F8D2B00                 jge .checkName104
  2581 00000CE3 FF76FE                   push word [bp-2]
  2582 00000CE6 E813FF                   call adrofname
  2583 00000CE9 83C402                   add  sp, 2
  2584 00000CEC 8946FC                   mov [bp-4], ax
  2585 00000CEF FF76FC                   push word [bp-4]
  2586 00000CF2 8D06BB69                 lea  ax, [symbol]
  2587 00000CF6 50                       push ax
  2588 00000CF7 E868F5                   call eqstr
  2589 00000CFA 83C404                   add  sp, 4
  2590 00000CFD 08C0                     or  al, al
  2591 00000CFF 0F840600                 je .checkName105
  2592 00000D03 8B46FE                   mov ax, [bp-2]
  2593 00000D06 E94700                   jmp .retncheckName
  2594                                  .checkName105:
  2595 00000D09 FF46FE                   inc  word[bp-2]
  2596                                  
  2597                                  ;-389   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2598                                  
  2599 00000D0C EBCA                     jmp .checkName103
  2600                                  .checkName104:
  2601 00000D0E B80100                   mov ax, 1
  2602 00000D11 8946FE                   mov [bp-2], ax
  2603                                  .checkName106:
  2604 00000D14 8B46FE                   mov ax, [bp-2]
  2605 00000D17 3B06[3900]               cmp ax, [GTop]
  2606 00000D1B 0F8D2B00                 jge .checkName107
  2607 00000D1F FF76FE                   push word [bp-2]
  2608 00000D22 E8D7FE                   call adrofname
  2609 00000D25 83C402                   add  sp, 2
  2610 00000D28 8946FC                   mov [bp-4], ax
  2611 00000D2B FF76FC                   push word [bp-4]
  2612 00000D2E 8D06BB69                 lea  ax, [symbol]
  2613 00000D32 50                       push ax
  2614 00000D33 E82CF5                   call eqstr
  2615 00000D36 83C404                   add  sp, 4
  2616 00000D39 08C0                     or  al, al
  2617 00000D3B 0F840600                 je .checkName108
  2618 00000D3F 8B46FE                   mov ax, [bp-2]
  2619 00000D42 E90B00                   jmp .retncheckName
  2620                                  .checkName108:
  2621 00000D45 FF46FE                   inc  word[bp-2]
  2622                                  
  2623                                  ;-390   return 0;
  2624                                  
  2625 00000D48 EBCA                     jmp .checkName106
  2626                                  .checkName107:
  2627 00000D4A B80000                   mov ax, 0
  2628 00000D4D E90000                   jmp .retncheckName
  2629                                  
  2630                                  ;-391 }
  2631                                  
  2632                                  
  2633                                  ;-392 int typeName() { int m; //0=V,1=*,2=&
  2634                                  
  2635 00000D50 C9                       .retncheckName: LEAVE
  2636 00000D51 C3                       ret
  2637                                  ENDP
  2638                                  
  2639                                  typeName: PROC
  2640                                  
  2641                                  ;-393     issign='S';
  2642                                  ;
  2643 00000D52 C8020000                 ENTER  2,0
  2644 00000D56 B85300                   mov ax, 83
  2645 00000D59 A2[3300]                 mov byte [issign], al
  2646                                  
  2647                                  ;-394     if(istoken(T_SIGNED))   issign='S';
  2648                                  
  2649 00000D5C 681302                   push 531
  2650 00000D5F E892F6                   call istoken
  2651 00000D62 83C402                   add  sp, 2
  2652 00000D65 08C0                     or  al, al
  2653 00000D67 0F840600                 je .typeName109
  2654 00000D6B B85300                   mov ax, 83
  2655 00000D6E A2[3300]                 mov byte [issign], al
  2656                                  
  2657                                  ;-395     if(istoken(T_UNSIGNED)) issign='U';
  2658                                  
  2659                                  .typeName109:
  2660 00000D71 681402                   push 532
  2661 00000D74 E87DF6                   call istoken
  2662 00000D77 83C402                   add  sp, 2
  2663 00000D7A 08C0                     or  al, al
  2664 00000D7C 0F840600                 je .typeName110
  2665 00000D80 B85500                   mov ax, 85
  2666 00000D83 A2[3300]                 mov byte [issign], al
  2667                                  
  2668                                  ;-396     iswidth=2;
  2669                                  
  2670                                  .typeName110:
  2671 00000D86 B80200                   mov ax, 2
  2672 00000D89 A2[3600]                 mov byte [iswidth], al
  2673                                  
  2674                                  ;-397     if(istoken(T_VOID))     iswidth=0;
  2675                                  
  2676 00000D8C 681102                   push 529
  2677 00000D8F E862F6                   call istoken
  2678 00000D92 83C402                   add  sp, 2
  2679 00000D95 08C0                     or  al, al
  2680 00000D97 0F840600                 je .typeName111
  2681 00000D9B B80000                   mov ax, 0
  2682 00000D9E A2[3600]                 mov byte [iswidth], al
  2683                                  
  2684                                  ;-398     if(istoken(T_CHAR))     iswidth=1;
  2685                                  
  2686                                  .typeName111:
  2687 00000DA1 681202                   push 530
  2688 00000DA4 E84DF6                   call istoken
  2689 00000DA7 83C402                   add  sp, 2
  2690 00000DAA 08C0                     or  al, al
  2691 00000DAC 0F840600                 je .typeName112
  2692 00000DB0 B80100                   mov ax, 1
  2693 00000DB3 A2[3600]                 mov byte [iswidth], al
  2694                                  
  2695                                  ;-399     if(istoken(T_INT))      iswidth=2;
  2696                                  
  2697                                  .typeName112:
  2698 00000DB6 680502                   push 517
  2699 00000DB9 E838F6                   call istoken
  2700 00000DBC 83C402                   add  sp, 2
  2701 00000DBF 08C0                     or  al, al
  2702 00000DC1 0F840600                 je .typeName113
  2703 00000DC5 B80200                   mov ax, 2
  2704 00000DC8 A2[3600]                 mov byte [iswidth], al
  2705                                  
  2706                                  ;-400     if(istoken(T_LONG))     iswidth=4;
  2707                                  
  2708                                  .typeName113:
  2709 00000DCB 681502                   push 533
  2710 00000DCE E823F6                   call istoken
  2711 00000DD1 83C402                   add  sp, 2
  2712 00000DD4 08C0                     or  al, al
  2713 00000DD6 0F840600                 je .typeName114
  2714 00000DDA B80400                   mov ax, 4
  2715 00000DDD A2[3600]                 mov byte [iswidth], al
  2716                                  
  2717                                  ;-401     istype='V';
  2718                                  
  2719                                  .typeName114:
  2720 00000DE0 B85600                   mov ax, 86
  2721 00000DE3 A2[3000]                 mov byte [istype], al
  2722                                  
  2723                                  ;-402     m=0;
  2724                                  
  2725 00000DE6 B80000                   mov ax, 0
  2726 00000DE9 8946FE                   mov [bp-2], ax
  2727                                  
  2728                                  ;-403     if(istoken('*'))  {istype='*'; m=1;}
  2729                                  
  2730 00000DEC 6A2A                     push 42
  2731 00000DEE E803F6                   call istoken
  2732 00000DF1 83C402                   add  sp, 2
  2733 00000DF4 08C0                     or  al, al
  2734 00000DF6 0F840C00                 je .typeName115
  2735 00000DFA B82A00                   mov ax, 42
  2736 00000DFD A2[3000]                 mov byte [istype], al
  2737 00000E00 B80100                   mov ax, 1
  2738 00000E03 8946FE                   mov [bp-2], ax
  2739                                  
  2740                                  ;-404     if(istoken('&'))  {istype='&'; m=2;}
  2741                                  
  2742                                  .typeName115:
  2743 00000E06 6A26                     push 38
  2744 00000E08 E8E9F5                   call istoken
  2745 00000E0B 83C402                   add  sp, 2
  2746 00000E0E 08C0                     or  al, al
  2747 00000E10 0F840C00                 je .typeName116
  2748 00000E14 B82600                   mov ax, 38
  2749 00000E17 A2[3000]                 mov byte [istype], al
  2750 00000E1A B80200                   mov ax, 2
  2751 00000E1D 8946FE                   mov [bp-2], ax
  2752                                  
  2753                                  ;-405     name1();
  2754                                  
  2755                                  .typeName116:
  2756 00000E20 E80800                   call name1
  2757                                  
  2758                                  ;-406     return m;
  2759                                  
  2760 00000E23 8B46FE                   mov ax, [bp-2]
  2761 00000E26 E90000                   jmp .retntypeName
  2762                                  
  2763                                  ;-407 }
  2764                                  
  2765                                  
  2766                                  ;-408 int name1() {
  2767                                  
  2768 00000E29 C9                       .retntypeName: LEAVE
  2769 00000E2A C3                       ret
  2770                                  ENDP
  2771                                  
  2772                                  name1: PROC
  2773                                  
  2774                                  ;-409     if (token!=T_NAME) error1("Name expected");
  2775                                  
  2776 00000E2B A1[1E00]                 mov ax, [token]
  2777 00000E2E 3D0001                   cmp ax, 256
  2778 00000E31 0F840900                 je  .name1117
  2779 00000E35 68[450E]                 push name1_0
  2780 00000E38 E8302E                   call error1
  2781 00000E3B 83C402                   add  sp, 2
  2782                                  
  2783                                  ;-410     token=getlex();
  2784                                  
  2785                                  .name1117:
  2786 00000E3E E8B323                   call getlex
  2787 00000E41 A3[1E00]                 mov word [token], ax
  2788                                  
  2789                                  ;-411 }
  2790                                  
  2791                                  
  2792                                  ;-412 
  2793                                  
  2794                                  
  2795                                  ;-413 int storeCall1() {//todo
  2796                                  
  2797 00000E44 C3                       ret
  2798 00000E45 4E616D652065787065-     name1_0 db "Name expected",0
  2799 00000E4E 6374656400         
  2800                                  ENDP
  2801                                  
  2802                                  storeCall1: PROC
  2803                                  
  2804                                  ;-414     unsigned int i;
  2805                                  
  2806                                  
  2807                                  ;-415     CTop++;
  2808                                  ;
  2809 00000E53 C8020000                 ENTER  2,0
  2810 00000E57 FF06[4300]               inc  word[CTop]
  2811                                  
  2812                                  ;-416     if (CTop >= CALLMAX) error1("too many calls");
  2813                                  
  2814 00000E5B A1[4300]                 mov ax, [CTop]
  2815 00000E5E 3DDC05                   cmp ax, 1500 ;unsigned : 1
  2816 00000E61 0F8C0900                 jl  .storeCall1118
  2817 00000E65 68[BA0E]                 push storeCall1_0
  2818 00000E68 E8002E                   call error1
  2819 00000E6B 83C402                   add  sp, 2
  2820                                  
  2821                                  ;-417     i = CNamePtr - &CNameField;
  2822                                  
  2823                                  .storeCall1118:
  2824 00000E6E A1[3F00]                 mov ax, [CNamePtr]
  2825 00000E71 2D80B2                   sub ax, CNameField
  2826 00000E74 8946FE                   mov [bp-2], ax
  2827                                  
  2828                                  ;-418     if (i >= CNAMEMAX) error1("too many call names");
  2829                                  
  2830 00000E77 8B46FE                   mov ax, [bp-2]
  2831 00000E7A 3D1027                   cmp ax, 10000 ;unsigned : 0
  2832 00000E7D 0F820900                 jb  .storeCall1119
  2833 00000E81 68[C90E]                 push storeCall1_1
  2834 00000E84 E8E42D                   call error1
  2835 00000E87 83C402                   add  sp, 2
  2836                                  
  2837                                  ;-419     CType[CTop]=0;
  2838                                  
  2839                                  .storeCall1119:
  2840 00000E8A B80000                   mov ax, 0
  2841 00000E8D 8B1E[4300]               mov bx, [CTop]
  2842 00000E91 8887ECA0                 mov [CType+bx], al
  2843                                  
  2844                                  ;-420     CAdr [CTop]=CNamePtr;
  2845                                  
  2846 00000E95 A1[3F00]                 mov ax, [CNamePtr]
  2847 00000E98 8B1E[4300]               mov bx, [CTop]
  2848 00000E9C D1E3                     shl bx, 1
  2849 00000E9E 8987C8A6                 mov [CAdr+bx], ax
  2850                                  
  2851                                  ;-421     CNamePtr=strcpy(CNamePtr, symbol);
  2852                                  
  2853 00000EA2 8D06BB69                 lea  ax, [symbol]
  2854 00000EA6 50                       push ax
  2855 00000EA7 FF36[3F00]               push word [CNamePtr]
  2856 00000EAB E87EF3                   call strcpy
  2857 00000EAE 83C404                   add  sp, 4
  2858 00000EB1 A3[3F00]                 mov word [CNamePtr], ax
  2859                                  
  2860                                  ;-422     CNamePtr++;
  2861                                  
  2862 00000EB4 FF06[3F00]               inc  word[CNamePtr]
  2863                                  
  2864                                  ;-423 }
  2865                                  
  2866                                  
  2867                                  ;-424 
  2868                                  
  2869                                  
  2870                                  ;-425 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2871 00000EB8 C9                       LEAVE
  2872 00000EB9 C3                       ret
  2873 00000EBA 746F6F206D616E7920-     storeCall1_0 db "too many calls",0
  2874 00000EC3 63616C6C7300       
  2875 00000EC9 746F6F206D616E7920-     storeCall1_1 db "too many call names",0
  2876 00000ED2 63616C6C206E616D65-
  2877 00000EDB 7300               
  2878                                  ENDP
  2879                                  
  2880                                  storefunc: PROC
  2881 00000EDD A1[3D00]                 mov ax, [FTop]
  2882 00000EE0 3D2C01                   cmp ax, 300 ;unsigned : 1
  2883 00000EE3 0F8C0900                 jl  .storefunc120
  2884 00000EE7 68[3E0F]                 push storefunc_0
  2885 00000EEA E87E2D                   call error1
  2886 00000EED 83C402                   add  sp, 2
  2887                                  
  2888                                  ;-426     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2889                                  
  2890                                  .storefunc120:
  2891 00000EF0 A1[4900]                 mov ax, [lineno]
  2892 00000EF3 83E801                   sub ax, 1
  2893 00000EF6 8B1E[3D00]               mov bx, [FTop]
  2894 00000EFA D1E3                     shl bx, 1
  2895 00000EFC 89877C89                 mov [FAdr+bx], ax
  2896 00000F00 B80000                   mov ax, 0
  2897 00000F03 8B1E[3D00]               mov bx, [FTop]
  2898 00000F07 D1E3                     shl bx, 1
  2899 00000F09 8987D48B                 mov [FCalls+bx], ax
  2900 00000F0D A0[3600]                 mov al, [iswidth]
  2901 00000F10 8B1E[3D00]               mov bx, [FTop]
  2902 00000F14 88875088                 mov [FType+bx], al
  2903                                  
  2904                                  ;-427     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2905                                  
  2906 00000F18 FF36[3D00]               push word [FTop]
  2907 00000F1C 8D062C8E                 lea  ax, [FNameField]
  2908 00000F20 50                       push ax
  2909 00000F21 E8ECFC                   call adrF
  2910 00000F24 83C404                   add  sp, 4
  2911 00000F27 A3[4B00]                 mov word [pt], ax
  2912 00000F2A 8D06BB69                 lea  ax, [symbol]
  2913 00000F2E 50                       push ax
  2914 00000F2F FF36[4B00]               push word [pt]
  2915 00000F33 E8F6F2                   call strcpy
  2916 00000F36 83C404                   add  sp, 4
  2917 00000F39 FF06[3D00]               inc  word[FTop]
  2918                                  
  2919                                  ;-428 }
  2920                                  
  2921                                  
  2922                                  ;-429 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2923                                  
  2924 00000F3D C3                       ret
  2925 00000F3E 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2926 00000F47 7461626C652066756C-
  2927 00000F50 6C00               
  2928                                  ENDP
  2929                                  
  2930                                  addlocal: PROC
  2931 00000F52 A1[3B00]                 mov ax, [LTop]
  2932 00000F55 3D2C01                   cmp ax, 300 ;unsigned : 1
  2933 00000F58 0F8C0900                 jl  .addlocal121
  2934 00000F5C 68[D80F]                 push addlocal_0
  2935 00000F5F E8092D                   call error1
  2936 00000F62 83C402                   add  sp, 2
  2937                                  
  2938                                  ;-430   if (checkName() != 0) error1("Variable already defined");
  2939                                  
  2940                                  .addlocal121:
  2941 00000F65 E866FD                   call checkName
  2942 00000F68 83F800                   cmp ax, 0
  2943 00000F6B 0F840900                 je  .addlocal122
  2944 00000F6F 68[F20F]                 push addlocal_1
  2945 00000F72 E8F62C                   call error1
  2946 00000F75 83C402                   add  sp, 2
  2947                                  
  2948                                  ;-431   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2949                                  
  2950                                  .addlocal122:
  2951 00000F78 A0[3300]                 mov al, [issign]
  2952 00000F7B 8B1E[3B00]               mov bx, [LTop]
  2953 00000F7F 8887306C                 mov [GSign+bx], al
  2954 00000F83 A0[3600]                 mov al, [iswidth]
  2955 00000F86 8B1E[3B00]               mov bx, [LTop]
  2956 00000F8A 88875C6D                 mov [GWidth+bx], al
  2957 00000F8E A0[3000]                 mov al, [istype]
  2958 00000F91 8B1E[3B00]               mov bx, [LTop]
  2959 00000F95 8887046B                 mov [GType+bx], al
  2960                                  
  2961                                  ;-432   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2962                                  
  2963 00000F99 A1[4900]                 mov ax, [lineno]
  2964 00000F9C 83E801                   sub ax, 1
  2965 00000F9F 8B1E[3B00]               mov bx, [LTop]
  2966 00000FA3 D1E3                     shl bx, 1
  2967 00000FA5 8987886E                 mov [GAdr+bx], ax
  2968 00000FA9 B80000                   mov ax, 0
  2969 00000FAC 8B1E[3B00]               mov bx, [LTop]
  2970 00000FB0 D1E3                     shl bx, 1
  2971 00000FB2 8987E070                 mov [GUsed+bx], ax
  2972                                  
  2973                                  ;-433   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2974                                  
  2975 00000FB6 FF36[3B00]               push word [LTop]
  2976 00000FBA 8D069075                 lea  ax, [GNameField]
  2977 00000FBE 50                       push ax
  2978 00000FBF E84EFC                   call adrF
  2979 00000FC2 83C404                   add  sp, 4
  2980 00000FC5 A3[4B00]                 mov word [pt], ax
  2981 00000FC8 8D06BB69                 lea  ax, [symbol]
  2982 00000FCC 50                       push ax
  2983 00000FCD FF36[4B00]               push word [pt]
  2984 00000FD1 E858F2                   call strcpy
  2985 00000FD4 83C404                   add  sp, 4
  2986                                  
  2987                                  ;-434 }
  2988                                  
  2989                                  
  2990                                  ;-435 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2991                                  
  2992 00000FD7 C3                       ret
  2993 00000FD8 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2994 00000FE1 6961626C6520746162-
  2995 00000FEA 6C652066756C6C00   
  2996 00000FF2 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2997 00000FFB 616C72656164792064-
  2998 00001004 6566696E656400     
  2999                                  ENDP
  3000                                  
  3001                                  checkFunction: PROC;
  3002 0000100B C8040000                 ENTER  4,0
  3003 0000100F B80000                   mov ax, 0
  3004 00001012 8946FE                   mov [bp-2], ax
  3005                                  
  3006                                  ;-436   while (i < FTop) {
  3007                                  
  3008                                  .checkFunction123:
  3009 00001015 8B46FE                   mov ax, [bp-2]
  3010 00001018 3B06[3D00]               cmp ax, [FTop]
  3011 0000101C 0F8D3000                 jge .checkFunction124
  3012                                  
  3013                                  ;-437     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3014                                  
  3015 00001020 FF76FE                   push word [bp-2]
  3016 00001023 8D062C8E                 lea  ax, [FNameField]
  3017 00001027 50                       push ax
  3018 00001028 E8E5FB                   call adrF
  3019 0000102B 83C404                   add  sp, 4
  3020 0000102E 8946FC                   mov [bp-4], ax
  3021 00001031 FF76FC                   push word [bp-4]
  3022 00001034 8D06BB69                 lea  ax, [symbol]
  3023 00001038 50                       push ax
  3024 00001039 E826F2                   call eqstr
  3025 0000103C 83C404                   add  sp, 4
  3026 0000103F 08C0                     or  al, al
  3027 00001041 0F840600                 je .checkFunction125
  3028 00001045 8B46FE                   mov ax, [bp-2]
  3029 00001048 E90B00                   jmp .retncheckFunction
  3030                                  .checkFunction125:
  3031 0000104B FF46FE                   inc  word[bp-2]
  3032                                  
  3033                                  ;-438   return 0; }
  3034                                  
  3035 0000104E EBC5                     jmp .checkFunction123
  3036                                  .checkFunction124:
  3037 00001050 B80000                   mov ax, 0
  3038 00001053 E90000                   jmp .retncheckFunction
  3039                                  
  3040                                  ;-439 int dofunc() { int nloc; int i; int narg;
  3041                                  
  3042 00001056 C9                       .retncheckFunction: LEAVE
  3043 00001057 C3                       ret
  3044                                  ENDP
  3045                                  
  3046                                  dofunc: PROC
  3047                                  
  3048                                  ;-440   cloc=&co;
  3049                                  ;
  3050 00001058 C8060000                 ENTER  6,0
  3051 0000105C B8A861                   mov ax, co
  3052 0000105F A3[1800]                 mov word [cloc], ax
  3053                                  
  3054                                  ;-441   checknamelen();
  3055                                  
  3056 00001062 E825F3                   call checknamelen
  3057                                  
  3058                                  ;-442   strcpy(fname, symbol);
  3059                                  
  3060 00001065 8D06BB69                 lea  ax, [symbol]
  3061 00001069 50                       push ax
  3062 0000106A 8D063B6A                 lea  ax, [fname]
  3063 0000106E 50                       push ax
  3064 0000106F E8BAF1                   call strcpy
  3065 00001072 83C404                   add  sp, 4
  3066                                  
  3067                                  ;-443   if (checkFunction() ) error1("Function already defined");
  3068                                  
  3069 00001075 E893FF                   call checkFunction
  3070 00001078 08C0                     or  al, al
  3071 0000107A 0F840900                 je .dofunc126
  3072 0000107E 68[9F12]                 push dofunc_0
  3073 00001081 E8E72B                   call error1
  3074 00001084 83C402                   add  sp, 2
  3075                                  
  3076                                  ;-444   storefunc();
  3077                                  
  3078                                  .dofunc126:
  3079 00001087 E853FE                   call storefunc
  3080                                  
  3081                                  ;-445   prs("\n\n"); prs(symbol); prs(": PROC");
  3082                                  
  3083 0000108A 68[B812]                 push dofunc_1
  3084 0000108D E896F4                   call prs
  3085 00001090 83C402                   add  sp, 2
  3086 00001093 8D06BB69                 lea  ax, [symbol]
  3087 00001097 50                       push ax
  3088 00001098 E88BF4                   call prs
  3089 0000109B 83C402                   add  sp, 2
  3090 0000109E 68[BD12]                 push dofunc_2
  3091 000010A1 E882F4                   call prs
  3092 000010A4 83C402                   add  sp, 2
  3093                                  
  3094                                  ;-446   expect('('); LTop=LSTART;  i=0;
  3095                                  
  3096 000010A7 6A28                     push 40
  3097 000010A9 E86AF3                   call expect
  3098 000010AC 83C402                   add  sp, 2
  3099 000010AF B8C800                   mov ax, 200
  3100 000010B2 A3[3B00]                 mov word [LTop], ax
  3101 000010B5 B80000                   mov ax, 0
  3102 000010B8 8946FC                   mov [bp-4], ax
  3103                                  
  3104                                  ;-447   if (istoken(')')==0) { narg=2;
  3105                                  
  3106 000010BB 6A29                     push 41
  3107 000010BD E834F3                   call istoken
  3108 000010C0 83C402                   add  sp, 2
  3109 000010C3 83F800                   cmp ax, 0
  3110 000010C6 0F854600                 jne .dofunc127
  3111 000010CA B80200                   mov ax, 2
  3112 000010CD 8946FA                   mov [bp-6], ax
  3113                                  
  3114                                  ;-448     do { typeName();  addlocal(); narg+=2;
  3115                                  
  3116                                  .dofunc128:
  3117 000010D0 E87FFC                   call typeName
  3118 000010D3 E87CFE                   call addlocal
  3119 000010D6 8346FA02                 add  word[bp-6], 2
  3120                                  
  3121                                  ;-449          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  3122                                  
  3123 000010DA 8B46FA                   mov ax, [bp-6]
  3124 000010DD 8B1E[3B00]               mov bx, [LTop]
  3125 000010E1 D1E3                     shl bx, 1
  3126 000010E3 89873873                 mov [GData+bx], ax
  3127 000010E7 A0[3600]                 mov al, [iswidth]
  3128 000010EA 3C04                     cmp al, 4
  3129 000010EC 0F850400                 jne .dofunc129
  3130 000010F0 8346FA02                 add  word[bp-6], 2
  3131                                  .dofunc129:
  3132 000010F4 FF06[3B00]               inc  word[LTop]
  3133                                  
  3134                                  ;-450     while (istoken(','));  expect(')'); }
  3135                                  
  3136 000010F8 6A2C                     push 44
  3137 000010FA E8F7F2                   call istoken
  3138 000010FD 83C402                   add  sp, 2
  3139 00001100 08C0                     or  al, al
  3140 00001102 0F840200                 je .dofunc130
  3141 00001106 EBC8                     jmp .dofunc128
  3142                                  .dofunc130:
  3143 00001108 6A29                     push 41
  3144 0000110A E809F3                   call expect
  3145 0000110D 83C402                   add  sp, 2
  3146                                  
  3147                                  ;-451 
  3148                                  
  3149                                  
  3150                                  ;-452   expect('{'); /*body*/
  3151                                  
  3152                                  .dofunc127:
  3153 00001110 6A7B                     push 123
  3154 00001112 E801F3                   call expect
  3155 00001115 83C402                   add  sp, 2
  3156                                  
  3157                                  ;-453   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  3158                                  
  3159 00001118 B80000                   mov ax, 0
  3160 0000111B 8946FE                   mov [bp-2], ax
  3161 0000111E B80000                   mov ax, 0
  3162 00001121 A3[2800]                 mov word [nreturn], ax
  3163 00001124 B80000                   mov ax, 0
  3164 00001127 A3[2600]                 mov word [nconst], ax
  3165 0000112A B80000                   mov ax, 0
  3166 0000112D 8946FC                   mov [bp-4], ax
  3167                                  
  3168                                  ;-454   while(isvariable()) {
  3169                                  
  3170                                  .dofunc131:
  3171 00001130 E8BE01                   call isvariable
  3172 00001133 08C0                     or  al, al
  3173 00001135 0F849200                 je .dofunc132
  3174                                  
  3175                                  ;-455     do {typeName();
  3176                                  
  3177                                  .dofunc133:
  3178 00001139 E816FC                   call typeName
  3179                                  
  3180                                  ;-456         checknamelen();
  3181                                  
  3182 0000113C E84BF2                   call checknamelen
  3183                                  
  3184                                  ;-457         addlocal(); nloc-=2;
  3185                                  
  3186 0000113F E810FE                   call addlocal
  3187 00001142 836EFE02                 sub  word[bp-2], 2
  3188                                  
  3189                                  ;-458         if (iswidth == 4) nloc-=2;
  3190                                  
  3191 00001146 A0[3600]                 mov al, [iswidth]
  3192 00001149 3C04                     cmp al, 4
  3193 0000114B 0F850400                 jne .dofunc134
  3194 0000114F 836EFE02                 sub  word[bp-2], 2
  3195                                  
  3196                                  ;-459         GData[LTop]=nloc;
  3197                                  
  3198                                  .dofunc134:
  3199 00001153 8B46FE                   mov ax, [bp-2]
  3200 00001156 8B1E[3B00]               mov bx, [LTop]
  3201 0000115A D1E3                     shl bx, 1
  3202 0000115C 89873873                 mov [GData+bx], ax
  3203                                  
  3204                                  ;-460         if (istoken('[')){
  3205                                  
  3206 00001160 6A5B                     push 91
  3207 00001162 E88FF2                   call istoken
  3208 00001165 83C402                   add  sp, 2
  3209 00001168 08C0                     or  al, al
  3210 0000116A 0F843D00                 je .dofunc135
  3211                                  
  3212                                  ;-461             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  3213                                  
  3214 0000116E B82600                   mov ax, 38
  3215 00001171 A2[3000]                 mov byte [istype], al
  3216 00001174 B82600                   mov ax, 38
  3217 00001177 8B1E[3B00]               mov bx, [LTop]
  3218 0000117B 8887046B                 mov [GType+bx], al
  3219 0000117F 680101                   push 257
  3220 00001182 E891F2                   call expect
  3221 00001185 83C402                   add  sp, 2
  3222 00001188 6A5D                     push 93
  3223 0000118A E889F2                   call expect
  3224 0000118D 83C402                   add  sp, 2
  3225                                  
  3226                                  ;-462             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  3227                                  
  3228 00001190 8B46FE                   mov ax, [bp-2]
  3229 00001193 2B06[2C00]               sub ax, [lexval]
  3230 00001197 8946FE                   mov [bp-2], ax
  3231 0000119A 8346FE02                 add  word[bp-2], 2
  3232 0000119E 8B46FE                   mov ax, [bp-2]
  3233 000011A1 8B1E[3B00]               mov bx, [LTop]
  3234 000011A5 D1E3                     shl bx, 1
  3235 000011A7 89873873                 mov [GData+bx], ax
  3236                                  
  3237                                  ;-463             }
  3238                                  
  3239                                  
  3240                                  ;-464         LTop++;
  3241                                  
  3242                                  .dofunc135:
  3243 000011AB FF06[3B00]               inc  word[LTop]
  3244                                  
  3245                                  ;-465       } while (istoken(',')); expect(';'); }
  3246                                  
  3247 000011AF 6A2C                     push 44
  3248 000011B1 E840F2                   call istoken
  3249 000011B4 83C402                   add  sp, 2
  3250 000011B7 08C0                     or  al, al
  3251 000011B9 0F840300                 je .dofunc136
  3252 000011BD E979FF                   jmp .dofunc133
  3253                                  .dofunc136:
  3254 000011C0 6A3B                     push 59
  3255 000011C2 E851F2                   call expect
  3256 000011C5 83C402                   add  sp, 2
  3257                                  
  3258                                  ;-466   if (LTop>LSTART){prs(";\n ENTER  ");
  3259                                  
  3260 000011C8 E965FF                   jmp .dofunc131
  3261                                  .dofunc132:
  3262 000011CB A1[3B00]                 mov ax, [LTop]
  3263 000011CE 3DC800                   cmp ax, 200
  3264 000011D1 0F8E2700                 jle .dofunc137
  3265 000011D5 68[C412]                 push dofunc_3
  3266 000011D8 E84BF3                   call prs
  3267 000011DB 83C402                   add  sp, 2
  3268                                  
  3269                                  ;-467     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  3270                                  
  3271 000011DE FF76FE                   push word [bp-2]
  3272 000011E1 E8C0EE                   call mkneg
  3273 000011E4 83C402                   add  sp, 2
  3274 000011E7 8946FE                   mov [bp-2], ax
  3275 000011EA FF76FE                   push word [bp-2]
  3276 000011ED E88BF4                   call prunsign1
  3277 000011F0 83C402                   add  sp, 2
  3278 000011F3 68[D012]                 push dofunc_4
  3279 000011F6 E82DF3                   call prs
  3280 000011F9 83C402                   add  sp, 2
  3281                                  
  3282                                  ;-468   while(istoken('}')==0)   stmt();
  3283                                  
  3284                                  .dofunc137:
  3285                                  .dofunc138:
  3286 000011FC 6A7D                     push 125
  3287 000011FE E8F3F1                   call istoken
  3288 00001201 83C402                   add  sp, 2
  3289 00001204 83F800                   cmp ax, 0
  3290 00001207 0F850500                 jne .dofunc139
  3291 0000120B E89C26                   call stmt
  3292                                  
  3293                                  ;-469   if (nreturn) {
  3294                                  
  3295 0000120E EBEC                     jmp .dofunc138
  3296                                  .dofunc139:
  3297 00001210 A1[2800]                 mov ax, [nreturn]
  3298 00001213 08C0                     or  al, al
  3299 00001215 0F841C00                 je .dofunc140
  3300                                  
  3301                                  ;-470         prs("\n .retn");
  3302                                  
  3303 00001219 68[D312]                 push dofunc_5
  3304 0000121C E807F3                   call prs
  3305 0000121F 83C402                   add  sp, 2
  3306                                  
  3307                                  ;-471         prs(fname);
  3308                                  
  3309 00001222 8D063B6A                 lea  ax, [fname]
  3310 00001226 50                       push ax
  3311 00001227 E8FCF2                   call prs
  3312 0000122A 83C402                   add  sp, 2
  3313                                  
  3314                                  ;-472         prc(':');
  3315                                  
  3316 0000122D 6A3A                     push 58
  3317 0000122F E88DF2                   call prc
  3318 00001232 83C402                   add  sp, 2
  3319                                  
  3320                                  ;-473         }
  3321                                  
  3322                                  
  3323                                  ;-474   if (LTop > LSTART) prs(" LEAVE");
  3324                                  
  3325                                  .dofunc140:
  3326 00001235 A1[3B00]                 mov ax, [LTop]
  3327 00001238 3DC800                   cmp ax, 200
  3328 0000123B 0F8E0900                 jle .dofunc141
  3329 0000123F 68[DC12]                 push dofunc_6
  3330 00001242 E8E1F2                   call prs
  3331 00001245 83C402                   add  sp, 2
  3332                                  
  3333                                  ;-475   prs("\n ret");
  3334                                  
  3335                                  .dofunc141:
  3336 00001248 68[E312]                 push dofunc_7
  3337 0000124B E8D8F2                   call prs
  3338 0000124E 83C402                   add  sp, 2
  3339                                  
  3340                                  ;-476   *cloc=0; prs(co);
  3341                                  
  3342 00001251 B80000                   mov ax, 0
  3343 00001254 8B1E[1800]               mov  bx, [cloc]
  3344 00001258 8807                     mov  [bx], al
  3345 0000125A 8D06A861                 lea  ax, [co]
  3346 0000125E 50                       push ax
  3347 0000125F E8C4F2                   call prs
  3348 00001262 83C402                   add  sp, 2
  3349                                  
  3350                                  ;-477   maxco1=strlen(co);
  3351                                  
  3352 00001265 8D06A861                 lea  ax, [co]
  3353 00001269 50                       push ax
  3354 0000126A E897EF                   call strlen
  3355 0000126D 83C402                   add  sp, 2
  3356 00001270 A3[1600]                 mov word [maxco1], ax
  3357                                  
  3358                                  ;-478   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  3359                                  
  3360 00001273 A1[1600]                 mov ax, [maxco1]
  3361 00001276 3B06[1400]               cmp ax, [maxco]
  3362 0000127A 0F8E1600                 jle .dofunc142
  3363 0000127E A1[1600]                 mov ax, [maxco1]
  3364 00001281 A3[1400]                 mov word [maxco], ax
  3365 00001284 8D063B6A                 lea  ax, [fname]
  3366 00001288 50                       push ax
  3367 00001289 8D067869                 lea  ax, [coname]
  3368 0000128D 50                       push ax
  3369 0000128E E89BEF                   call strcpy
  3370 00001291 83C404                   add  sp, 4
  3371                                  
  3372                                  ;-479   prs("\nENDP");
  3373                                  
  3374                                  .dofunc142:
  3375 00001294 68[EA12]                 push dofunc_8
  3376 00001297 E88CF2                   call prs
  3377 0000129A 83C402                   add  sp, 2
  3378                                  
  3379                                  ;-480 }
  3380                                  
  3381                                  
  3382                                  ;-481 int isvariable() {
  3383 0000129D C9                       LEAVE
  3384 0000129E C3                       ret
  3385 0000129F 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  3386 000012A8 616C72656164792064-
  3387 000012B1 6566696E656400     
  3388 000012B8 5C6E5C6E00              dofunc_1 db "\n\n",0
  3389 000012BD 3A2050524F4300          dofunc_2 db ": PROC",0
  3390 000012C4 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  3391 000012CD 202000             
  3392 000012D0 2C3000                  dofunc_4 db ",0",0
  3393 000012D3 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  3394 000012DC 204C4541564500          dofunc_6 db " LEAVE",0
  3395 000012E3 5C6E2072657400          dofunc_7 db "\n ret",0
  3396 000012EA 5C6E454E445000          dofunc_8 db "\nENDP",0
  3397                                  ENDP
  3398                                  
  3399                                  isvariable: PROC
  3400                                  
  3401                                  ;-482     if(token==T_SIGNED)   goto v1;
  3402                                  
  3403 000012F1 A1[1E00]                 mov ax, [token]
  3404 000012F4 3D1302                   cmp ax, 531
  3405 000012F7 0F850300                 jne .isvariable143
  3406 000012FB E93A00                   jmp .v1
  3407                                  
  3408                                  ;-483     if(token==T_UNSIGNED) goto v1;
  3409                                  
  3410                                  .isvariable143:
  3411 000012FE A1[1E00]                 mov ax, [token]
  3412 00001301 3D1402                   cmp ax, 532
  3413 00001304 0F850300                 jne .isvariable144
  3414 00001308 E92D00                   jmp .v1
  3415                                  
  3416                                  ;-484     if(token==T_CHAR)     goto v1;
  3417                                  
  3418                                  .isvariable144:
  3419 0000130B A1[1E00]                 mov ax, [token]
  3420 0000130E 3D1202                   cmp ax, 530
  3421 00001311 0F850300                 jne .isvariable145
  3422 00001315 E92000                   jmp .v1
  3423                                  
  3424                                  ;-485     if(token==T_INT)      goto v1;
  3425                                  
  3426                                  .isvariable145:
  3427 00001318 A1[1E00]                 mov ax, [token]
  3428 0000131B 3D0502                   cmp ax, 517
  3429 0000131E 0F850300                 jne .isvariable146
  3430 00001322 E91300                   jmp .v1
  3431                                  
  3432                                  ;-486     if(token==T_LONG)     goto v1;
  3433                                  
  3434                                  .isvariable146:
  3435 00001325 A1[1E00]                 mov ax, [token]
  3436 00001328 3D1502                   cmp ax, 533
  3437 0000132B 0F850300                 jne .isvariable147
  3438 0000132F E90600                   jmp .v1
  3439                                  
  3440                                  ;-487     return 0;
  3441                                  
  3442                                  .isvariable147:
  3443 00001332 B80000                   mov ax, 0
  3444 00001335 E90600                   jmp .retnisvariable
  3445                                  
  3446                                  ;-488 v1: return 1;
  3447                                  
  3448                                  .v1:
  3449 00001338 B80100                   mov ax, 1
  3450 0000133B E90000                   jmp .retnisvariable
  3451                                  
  3452                                  ;-489 }
  3453                                  
  3454                                  
  3455                                  ;-490 
  3456                                  
  3457                                  
  3458                                  ;-491 int ireg1;
  3459                                  
  3460                                   .retnisvariable:
  3461 0000133E C3                       ret
  3462                                  ENDP
  3463 0000133F 0000                    ireg1 dw 0
  3464                                  
  3465                                  ;-492 int mod2; int ireg2;
  3466                                  
  3467 00001341 0000                    mod2 dw 0
  3468 00001343 0000                    ireg2 dw 0
  3469                                  
  3470                                  ;-493 
  3471                                  
  3472                                  
  3473                                  ;-494 int pexpr() {expect('('); iscmp=0;
  3474                                  
  3475                                  
  3476                                  pexpr: PROC
  3477 00001345 6A28                     push 40
  3478 00001347 E8CCF0                   call expect
  3479 0000134A 83C402                   add  sp, 2
  3480 0000134D B80000                   mov ax, 0
  3481 00001350 A3[2400]                 mov word [iscmp], ax
  3482                                  
  3483                                  ;-495   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  3484                                  
  3485 00001353 A1[1E00]                 mov ax, [token]
  3486 00001356 3D0001                   cmp ax, 256
  3487 00001359 0F853400                 jne .pexpr148
  3488 0000135D 68[C013]                 push pexpr_0
  3489 00001360 8D06BB69                 lea  ax, [symbol]
  3490 00001364 50                       push ax
  3491 00001365 E8FAEE                   call eqstr
  3492 00001368 83C404                   add  sp, 4
  3493 0000136B 08C0                     or  al, al
  3494 0000136D 0F840600                 je .pexpr149
  3495 00001371 E86300                   call constantexpr
  3496 00001374 E94800                   jmp .retnpexpr
  3497                                  
  3498                                  ;-496     ireg1=checkreg();
  3499                                  
  3500                                  .pexpr149:
  3501 00001377 E84803                   call checkreg
  3502 0000137A A3[3F13]                 mov word [ireg1], ax
  3503                                  
  3504                                  ;-497     if (ireg1) { doreg1(1); return; }  }
  3505                                  
  3506 0000137D A1[3F13]                 mov ax, [ireg1]
  3507 00001380 08C0                     or  al, al
  3508 00001382 0F840B00                 je .pexpr150
  3509 00001386 6A01                     push 1
  3510 00001388 E84B01                   call doreg1
  3511 0000138B 83C402                   add  sp, 2
  3512 0000138E E92E00                   jmp .retnpexpr
  3513                                  .pexpr150:
  3514                                  
  3515                                  ;-498   expr(0);
  3516                                  
  3517                                  .pexpr148:
  3518 00001391 6A00                     push 0
  3519 00001393 E8AB07                   call expr
  3520 00001396 83C402                   add  sp, 2
  3521                                  
  3522                                  ;-499   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  3523                                  
  3524 00001399 A1[2400]                 mov ax, [iscmp]
  3525 0000139C 83F800                   cmp ax, 0
  3526 0000139F 0F850900                 jne .pexpr151
  3527 000013A3 68[C213]                 push pexpr_1
  3528 000013A6 E87DF1                   call prs
  3529 000013A9 83C402                   add  sp, 2
  3530                                  .pexpr151:
  3531 000013AC 8D063B6A                 lea  ax, [fname]
  3532 000013B0 50                       push ax
  3533 000013B1 E872F1                   call prs
  3534 000013B4 83C402                   add  sp, 2
  3535                                  
  3536                                  ;-500   expect(')'); }
  3537                                  
  3538 000013B7 6A29                     push 41
  3539 000013B9 E85AF0                   call expect
  3540 000013BC 83C402                   add  sp, 2
  3541                                  
  3542                                  ;-501 
  3543                                  
  3544                                  
  3545                                  ;-502 int constantexpr() { int mode; int id1;int ids;
  3546                                  
  3547                                   .retnpexpr:
  3548 000013BF C3                       ret
  3549 000013C0 5F00                    pexpr_0 db "_",0
  3550 000013C2 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  3551 000013CB 2C20616C5C6E206A65-
  3552 000013D4 202E00             
  3553                                  ENDP
  3554                                  
  3555                                  constantexpr: PROC
  3556                                  
  3557                                  ;-503   token=getlex();   mode=typeName();
  3558                                  ;
  3559 000013D7 C8060000                 ENTER  6,0
  3560 000013DB E8161E                   call getlex
  3561 000013DE A3[1E00]                 mov word [token], ax
  3562 000013E1 E86EF9                   call typeName
  3563 000013E4 8946FE                   mov [bp-2], ax
  3564                                  
  3565                                  ;-504   id1=searchname(); gettypes(id1); ids=signi;
  3566                                  
  3567 000013E7 E899F8                   call searchname
  3568 000013EA 8946FC                   mov [bp-4], ax
  3569 000013ED FF76FC                   push word [bp-4]
  3570 000013F0 E852F7                   call gettypes
  3571 000013F3 83C402                   add  sp, 2
  3572 000013F6 A1[3100]                 mov ax, [signi]
  3573 000013F9 8946FA                   mov [bp-6], ax
  3574                                  
  3575                                  ;-505   if (isrelational() ==0) error1("Relational expression expected");
  3576                                  
  3577 000013FC E88E1D                   call isrelational
  3578 000013FF 83F800                   cmp ax, 0
  3579 00001402 0F850900                 jne .constantexpr152
  3580 00001406 68[8C14]                 push constantexpr_0
  3581 00001409 E85F28                   call error1
  3582 0000140C 83C402                   add  sp, 2
  3583                                  
  3584                                  ;-506   expect(T_CONST);  prs(" ; constant expression");
  3585                                  
  3586                                  .constantexpr152:
  3587 0000140F 680101                   push 257
  3588 00001412 E801F0                   call expect
  3589 00001415 83C402                   add  sp, 2
  3590 00001418 68[AB14]                 push constantexpr_1
  3591 0000141B E808F1                   call prs
  3592 0000141E 83C402                   add  sp, 2
  3593                                  
  3594                                  ;-507   prs("\ncmp ");
  3595                                  
  3596 00001421 68[C214]                 push constantexpr_2
  3597 00001424 E8FFF0                   call prs
  3598 00001427 83C402                   add  sp, 2
  3599                                  
  3600                                  ;-508   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  3601                                  
  3602 0000142A FF76FC                   push word [bp-4]
  3603 0000142D E815F7                   call gettypes
  3604 00001430 83C402                   add  sp, 2
  3605 00001433 A1[3700]                 mov ax, [wi]
  3606 00001436 83F802                   cmp ax, 2
  3607 00001439 0F850C00                 jne .constantexpr153
  3608 0000143D 68[C914]                 push constantexpr_3
  3609 00001440 E8E3F0                   call prs
  3610 00001443 83C402                   add  sp, 2
  3611 00001446 E90900                   jmp .constantexpr154
  3612                                  .constantexpr153:
  3613 00001449 68[CE14]                 push constantexpr_4
  3614 0000144C E8D7F0                   call prs
  3615 0000144F 83C402                   add  sp, 2
  3616                                  
  3617                                  ;-509   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  3618                                  
  3619                                  .constantexpr154:
  3620 00001452 FF76FC                   push word [bp-4]
  3621 00001455 E8FFEE                   call v
  3622 00001458 83C402                   add  sp, 2
  3623 0000145B 68[D314]                 push constantexpr_5
  3624 0000145E E8C5F0                   call prs
  3625 00001461 83C402                   add  sp, 2
  3626 00001464 FF36[2C00]               push word [lexval]
  3627 00001468 E810F2                   call prunsign1
  3628 0000146B 83C402                   add  sp, 2
  3629 0000146E FF76FA                   push word [bp-6]
  3630 00001471 E85B1A                   call cmpneg
  3631 00001474 83C402                   add  sp, 2
  3632 00001477 8D063B6A                 lea  ax, [fname]
  3633 0000147B 50                       push ax
  3634 0000147C E8A7F0                   call prs
  3635 0000147F 83C402                   add  sp, 2
  3636                                  
  3637                                  ;-510   expect(')');
  3638                                  
  3639 00001482 6A29                     push 41
  3640 00001484 E88FEF                   call expect
  3641 00001487 83C402                   add  sp, 2
  3642                                  
  3643                                  ;-511 }
  3644                                  
  3645                                  
  3646                                  ;-512 
  3647                                  
  3648                                  
  3649                                  ;-513 char ops[5];
  3650 0000148A C9                       LEAVE
  3651 0000148B C3                       ret
  3652 0000148C 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  3653 00001495 6C2065787072657373-
  3654 0000149E 696F6E206578706563-
  3655 000014A7 74656400           
  3656 000014AB 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  3657 000014B4 6E7420657870726573-
  3658 000014BD 73696F6E00         
  3659 000014C2 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  3660 000014C9 776F726400              constantexpr_3 db "word",0
  3661 000014CE 6279746500              constantexpr_4 db "byte",0
  3662 000014D3 2C2000                  constantexpr_5 db ", ",0
  3663                                  ENDP
  3664                                  section .bss
  3665                                  absolute 55855
  3666 0000DA2F <res 00000005>          ops resb 5
  3667                                  section .text
  3668                                  
  3669                                  ;-514 int doreg1(int iscmp1) { int i;
  3670                                  
  3671                                  
  3672                                  doreg1: PROC
  3673                                  
  3674                                  ;-515   if (istoken('='))          strcpy(ops, "mov");
  3675                                  ;
  3676 000014D6 C8020000                 ENTER  2,0
  3677 000014DA 6A3D                     push 61
  3678 000014DC E815EF                   call istoken
  3679 000014DF 83C402                   add  sp, 2
  3680 000014E2 08C0                     or  al, al
  3681 000014E4 0F840E00                 je .doreg1155
  3682 000014E8 68[8916]                 push doreg1_0
  3683 000014EB 8D062FDA                 lea  ax, [ops]
  3684 000014EF 50                       push ax
  3685 000014F0 E839ED                   call strcpy
  3686 000014F3 83C404                   add  sp, 4
  3687                                  
  3688                                  ;-516   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3689                                  
  3690                                  .doreg1155:
  3691 000014F6 68CE04                   push 1230
  3692 000014F9 E8F8EE                   call istoken
  3693 000014FC 83C402                   add  sp, 2
  3694 000014FF 08C0                     or  al, al
  3695 00001501 0F840E00                 je .doreg1156
  3696 00001505 68[8D16]                 push doreg1_1
  3697 00001508 8D062FDA                 lea  ax, [ops]
  3698 0000150C 50                       push ax
  3699 0000150D E81CED                   call strcpy
  3700 00001510 83C404                   add  sp, 4
  3701                                  
  3702                                  ;-517   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3703                                  
  3704                                  .doreg1156:
  3705 00001513 68CF04                   push 1231
  3706 00001516 E8DBEE                   call istoken
  3707 00001519 83C402                   add  sp, 2
  3708 0000151C 08C0                     or  al, al
  3709 0000151E 0F840E00                 je .doreg1157
  3710 00001522 68[9116]                 push doreg1_2
  3711 00001525 8D062FDA                 lea  ax, [ops]
  3712 00001529 50                       push ax
  3713 0000152A E8FFEC                   call strcpy
  3714 0000152D 83C404                   add  sp, 4
  3715                                  
  3716                                  ;-518   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3717                                  
  3718                                  .doreg1157:
  3719 00001530 68D204                   push 1234
  3720 00001533 E8BEEE                   call istoken
  3721 00001536 83C402                   add  sp, 2
  3722 00001539 08C0                     or  al, al
  3723 0000153B 0F840E00                 je .doreg1158
  3724 0000153F 68[9516]                 push doreg1_3
  3725 00001542 8D062FDA                 lea  ax, [ops]
  3726 00001546 50                       push ax
  3727 00001547 E8E2EC                   call strcpy
  3728 0000154A 83C404                   add  sp, 4
  3729                                  
  3730                                  ;-519   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3731                                  
  3732                                  .doreg1158:
  3733 0000154D 68D304                   push 1235
  3734 00001550 E8A1EE                   call istoken
  3735 00001553 83C402                   add  sp, 2
  3736 00001556 08C0                     or  al, al
  3737 00001558 0F840E00                 je .doreg1159
  3738 0000155C 68[9916]                 push doreg1_4
  3739 0000155F 8D062FDA                 lea  ax, [ops]
  3740 00001563 50                       push ax
  3741 00001564 E8C5EC                   call strcpy
  3742 00001567 83C404                   add  sp, 4
  3743                                  
  3744                                  ;-520   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3745                                  
  3746                                  .doreg1159:
  3747 0000156A 68D804                   push 1240
  3748 0000156D E884EE                   call istoken
  3749 00001570 83C402                   add  sp, 2
  3750 00001573 08C0                     or  al, al
  3751 00001575 0F840E00                 je .doreg1160
  3752 00001579 68[9C16]                 push doreg1_5
  3753 0000157C 8D062FDA                 lea  ax, [ops]
  3754 00001580 50                       push ax
  3755 00001581 E8A8EC                   call strcpy
  3756 00001584 83C404                   add  sp, 4
  3757                                  
  3758                                  ;-521   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3759                                  
  3760                                  .doreg1160:
  3761 00001587 68D904                   push 1241
  3762 0000158A E867EE                   call istoken
  3763 0000158D 83C402                   add  sp, 2
  3764 00001590 08C0                     or  al, al
  3765 00001592 0F840E00                 je .doreg1161
  3766 00001596 68[A016]                 push doreg1_6
  3767 00001599 8D062FDA                 lea  ax, [ops]
  3768 0000159D 50                       push ax
  3769 0000159E E88BEC                   call strcpy
  3770 000015A1 83C404                   add  sp, 4
  3771                                  
  3772                                  ;-522   if (iscmp1 == 1) { token=getlex();
  3773                                  
  3774                                  .doreg1161:
  3775 000015A4 8B4604                   mov ax, [bp+4]
  3776 000015A7 83F801                   cmp ax, 1
  3777 000015AA 0F852700                 jne .doreg1162
  3778 000015AE E8431C                   call getlex
  3779 000015B1 A3[1E00]                 mov word [token], ax
  3780                                  
  3781                                  ;-523       if (isrelational() ==0) error1("Relational expected");
  3782                                  
  3783 000015B4 E8D61B                   call isrelational
  3784 000015B7 83F800                   cmp ax, 0
  3785 000015BA 0F850900                 jne .doreg1163
  3786 000015BE 68[A416]                 push doreg1_7
  3787 000015C1 E8A726                   call error1
  3788 000015C4 83C402                   add  sp, 2
  3789                                  
  3790                                  ;-524       strcpy(ops, "cmp"); }
  3791                                  
  3792                                  .doreg1163:
  3793 000015C7 68[B816]                 push doreg1_8
  3794 000015CA 8D062FDA                 lea  ax, [ops]
  3795 000015CE 50                       push ax
  3796 000015CF E85AEC                   call strcpy
  3797 000015D2 83C404                   add  sp, 4
  3798                                  
  3799                                  ;-525   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3800                                  
  3801                                  .doreg1162:
  3802 000015D5 E840EF                   call prnl
  3803 000015D8 8D062FDA                 lea  ax, [ops]
  3804 000015DC 50                       push ax
  3805 000015DD E846EF                   call prs
  3806 000015E0 83C402                   add  sp, 2
  3807 000015E3 68[BC16]                 push doreg1_9
  3808 000015E6 E83DEF                   call prs
  3809 000015E9 83C402                   add  sp, 2
  3810 000015EC FF36[3F13]               push word [ireg1]
  3811 000015F0 E8DD04                   call printreg
  3812 000015F3 83C402                   add  sp, 2
  3813 000015F6 68[BF16]                 push doreg1_10
  3814 000015F9 E82AEF                   call prs
  3815 000015FC 83C402                   add  sp, 2
  3816                                  
  3817                                  ;-526 
  3818                                  
  3819                                  
  3820                                  ;-527   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3821                                  
  3822 000015FF 680101                   push 257
  3823 00001602 E8EFED                   call istoken
  3824 00001605 83C402                   add  sp, 2
  3825 00001608 08C0                     or  al, al
  3826 0000160A 0F840D00                 je .doreg1164
  3827 0000160E FF36[2C00]               push word [lexval]
  3828 00001612 E866F0                   call prunsign1
  3829 00001615 83C402                   add  sp, 2
  3830 00001618 E94700                   jmp .reg1
  3831                                  
  3832                                  ;-528   mod2=typeName(); ireg2=checkreg();
  3833                                  
  3834                                  .doreg1164:
  3835 0000161B E834F7                   call typeName
  3836 0000161E A3[4113]                 mov word [mod2], ax
  3837 00001621 E89E00                   call checkreg
  3838 00001624 A3[4313]                 mov word [ireg2], ax
  3839                                  
  3840                                  ;-529   if (ireg2) {printreg(ireg2); goto reg1;}
  3841                                  
  3842 00001627 A1[4313]                 mov ax, [ireg2]
  3843 0000162A 08C0                     or  al, al
  3844 0000162C 0F840D00                 je .doreg1165
  3845 00001630 FF36[4313]               push word [ireg2]
  3846 00001634 E89904                   call printreg
  3847 00001637 83C402                   add  sp, 2
  3848 0000163A E92500                   jmp .reg1
  3849                                  
  3850                                  ;-530   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3851                                  
  3852                                  .doreg1165:
  3853 0000163D E843F6                   call searchname
  3854 00001640 8946FE                   mov [bp-2], ax
  3855 00001643 A1[4113]                 mov ax, [mod2]
  3856 00001646 83F802                   cmp ax, 2
  3857 00001649 0F850C00                 jne .doreg1166
  3858 0000164D FF76FE                   push word [bp-2]
  3859 00001650 E8F5EC                   call a
  3860 00001653 83C402                   add  sp, 2
  3861 00001656 E90900                   jmp .doreg1167
  3862                                  .doreg1166:
  3863 00001659 FF76FE                   push word [bp-2]
  3864 0000165C E8F8EC                   call v
  3865 0000165F 83C402                   add  sp, 2
  3866                                  
  3867                                  ;-531   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3868                                  
  3869                                  .doreg1167:
  3870                                  .reg1:
  3871 00001662 8B4604                   mov ax, [bp+4]
  3872 00001665 83F801                   cmp ax, 1
  3873 00001668 0F851B00                 jne .doreg1168
  3874 0000166C 6A00                     push 0
  3875 0000166E E85E18                   call cmpneg
  3876 00001671 83C402                   add  sp, 2
  3877 00001674 8D063B6A                 lea  ax, [fname]
  3878 00001678 50                       push ax
  3879 00001679 E8AAEE                   call prs
  3880 0000167C 83C402                   add  sp, 2
  3881 0000167F 6A29                     push 41
  3882 00001681 E892ED                   call expect
  3883 00001684 83C402                   add  sp, 2
  3884                                  
  3885                                  ;-532 }
  3886                                  
  3887                                  .doreg1168:
  3888                                  
  3889                                  ;-533 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3890 00001687 C9                       LEAVE
  3891 00001688 C3                       ret
  3892 00001689 6D6F7600                doreg1_0 db "mov",0
  3893 0000168D 61646400                doreg1_1 db "add",0
  3894 00001691 73756200                doreg1_2 db "sub",0
  3895 00001695 616E6400                doreg1_3 db "and",0
  3896 00001699 6F7200                  doreg1_4 db "or",0
  3897 0000169C 73686C00                doreg1_5 db "shl",0
  3898 000016A0 73687200                doreg1_6 db "shr",0
  3899 000016A4 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3900 000016AD 6C2065787065637465-
  3901 000016B6 6400               
  3902 000016B8 636D7000                doreg1_8 db "cmp",0
  3903 000016BC 202000                  doreg1_9 db "  ",0
  3904 000016BF 2C2000                  doreg1_10 db ", ",0
  3905                                  ENDP
  3906                                  
  3907                                  checkreg: PROC
  3908                                  
  3909                                  ;-534   if (strlen(symbol) <  2) return 0;
  3910                                  
  3911 000016C2 8D06BB69                 lea  ax, [symbol]
  3912 000016C6 50                       push ax
  3913 000016C7 E83AEB                   call strlen
  3914 000016CA 83C402                   add  sp, 2
  3915 000016CD 83F802                   cmp ax, 2
  3916 000016D0 0F8D0600                 jge .checkreg169
  3917 000016D4 B80000                   mov ax, 0
  3918 000016D7 E94403                   jmp .retncheckreg
  3919                                  
  3920                                  ;-535   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3921                                  
  3922                                  .checkreg169:
  3923 000016DA 68[1F1A]                 push checkreg_0
  3924 000016DD 8D06BB69                 lea  ax, [symbol]
  3925 000016E1 50                       push ax
  3926 000016E2 E87DEB                   call eqstr
  3927 000016E5 83C404                   add  sp, 4
  3928 000016E8 08C0                     or  al, al
  3929 000016EA 0F840600                 je .checkreg170
  3930 000016EE B80100                   mov ax, 1
  3931 000016F1 E92A03                   jmp .retncheckreg
  3932                                  .checkreg170:
  3933 000016F4 68[221A]                 push checkreg_1
  3934 000016F7 8D06BB69                 lea  ax, [symbol]
  3935 000016FB 50                       push ax
  3936 000016FC E863EB                   call eqstr
  3937 000016FF 83C404                   add  sp, 4
  3938 00001702 08C0                     or  al, al
  3939 00001704 0F840600                 je .checkreg171
  3940 00001708 B80300                   mov ax, 3
  3941 0000170B E91003                   jmp .retncheckreg
  3942                                  
  3943                                  ;-536   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3944                                  
  3945                                  .checkreg171:
  3946 0000170E 68[251A]                 push checkreg_2
  3947 00001711 8D06BB69                 lea  ax, [symbol]
  3948 00001715 50                       push ax
  3949 00001716 E849EB                   call eqstr
  3950 00001719 83C404                   add  sp, 4
  3951 0000171C 08C0                     or  al, al
  3952 0000171E 0F840600                 je .checkreg172
  3953 00001722 B80500                   mov ax, 5
  3954 00001725 E9F602                   jmp .retncheckreg
  3955                                  .checkreg172:
  3956 00001728 68[281A]                 push checkreg_3
  3957 0000172B 8D06BB69                 lea  ax, [symbol]
  3958 0000172F 50                       push ax
  3959 00001730 E82FEB                   call eqstr
  3960 00001733 83C404                   add  sp, 4
  3961 00001736 08C0                     or  al, al
  3962 00001738 0F840600                 je .checkreg173
  3963 0000173C B80700                   mov ax, 7
  3964 0000173F E9DC02                   jmp .retncheckreg
  3965                                  
  3966                                  ;-537   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3967                                  
  3968                                  .checkreg173:
  3969 00001742 68[2B1A]                 push checkreg_4
  3970 00001745 8D06BB69                 lea  ax, [symbol]
  3971 00001749 50                       push ax
  3972 0000174A E815EB                   call eqstr
  3973 0000174D 83C404                   add  sp, 4
  3974 00001750 08C0                     or  al, al
  3975 00001752 0F840600                 je .checkreg174
  3976 00001756 B80900                   mov ax, 9
  3977 00001759 E9C202                   jmp .retncheckreg
  3978                                  .checkreg174:
  3979 0000175C 68[2E1A]                 push checkreg_5
  3980 0000175F 8D06BB69                 lea  ax, [symbol]
  3981 00001763 50                       push ax
  3982 00001764 E8FBEA                   call eqstr
  3983 00001767 83C404                   add  sp, 4
  3984 0000176A 08C0                     or  al, al
  3985 0000176C 0F840600                 je .checkreg175
  3986 00001770 B80B00                   mov ax, 11
  3987 00001773 E9A802                   jmp .retncheckreg
  3988                                  
  3989                                  ;-538   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3990                                  
  3991                                  .checkreg175:
  3992 00001776 68[311A]                 push checkreg_6
  3993 00001779 8D06BB69                 lea  ax, [symbol]
  3994 0000177D 50                       push ax
  3995 0000177E E8E1EA                   call eqstr
  3996 00001781 83C404                   add  sp, 4
  3997 00001784 08C0                     or  al, al
  3998 00001786 0F840600                 je .checkreg176
  3999 0000178A B80D00                   mov ax, 13
  4000 0000178D E98E02                   jmp .retncheckreg
  4001                                  .checkreg176:
  4002 00001790 68[341A]                 push checkreg_7
  4003 00001793 8D06BB69                 lea  ax, [symbol]
  4004 00001797 50                       push ax
  4005 00001798 E8C7EA                   call eqstr
  4006 0000179B 83C404                   add  sp, 4
  4007 0000179E 08C0                     or  al, al
  4008 000017A0 0F840600                 je .checkreg177
  4009 000017A4 B80F00                   mov ax, 15
  4010 000017A7 E97402                   jmp .retncheckreg
  4011                                  
  4012                                  ;-539   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4013                                  
  4014                                  .checkreg177:
  4015 000017AA 68[371A]                 push checkreg_8
  4016 000017AD 8D06BB69                 lea  ax, [symbol]
  4017 000017B1 50                       push ax
  4018 000017B2 E8ADEA                   call eqstr
  4019 000017B5 83C404                   add  sp, 4
  4020 000017B8 08C0                     or  al, al
  4021 000017BA 0F840600                 je .checkreg178
  4022 000017BE B81100                   mov ax, 17
  4023 000017C1 E95A02                   jmp .retncheckreg
  4024                                  .checkreg178:
  4025 000017C4 68[3A1A]                 push checkreg_9
  4026 000017C7 8D06BB69                 lea  ax, [symbol]
  4027 000017CB 50                       push ax
  4028 000017CC E893EA                   call eqstr
  4029 000017CF 83C404                   add  sp, 4
  4030 000017D2 08C0                     or  al, al
  4031 000017D4 0F840600                 je .checkreg179
  4032 000017D8 B81300                   mov ax, 19
  4033 000017DB E94002                   jmp .retncheckreg
  4034                                  
  4035                                  ;-540   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4036                                  
  4037                                  .checkreg179:
  4038 000017DE 68[3D1A]                 push checkreg_10
  4039 000017E1 8D06BB69                 lea  ax, [symbol]
  4040 000017E5 50                       push ax
  4041 000017E6 E879EA                   call eqstr
  4042 000017E9 83C404                   add  sp, 4
  4043 000017EC 08C0                     or  al, al
  4044 000017EE 0F840600                 je .checkreg180
  4045 000017F2 B81500                   mov ax, 21
  4046 000017F5 E92602                   jmp .retncheckreg
  4047                                  .checkreg180:
  4048 000017F8 68[401A]                 push checkreg_11
  4049 000017FB 8D06BB69                 lea  ax, [symbol]
  4050 000017FF 50                       push ax
  4051 00001800 E85FEA                   call eqstr
  4052 00001803 83C404                   add  sp, 4
  4053 00001806 08C0                     or  al, al
  4054 00001808 0F840600                 je .checkreg181
  4055 0000180C B81700                   mov ax, 23
  4056 0000180F E90C02                   jmp .retncheckreg
  4057                                  
  4058                                  ;-541   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4059                                  
  4060                                  .checkreg181:
  4061 00001812 68[431A]                 push checkreg_12
  4062 00001815 8D06BB69                 lea  ax, [symbol]
  4063 00001819 50                       push ax
  4064 0000181A E845EA                   call eqstr
  4065 0000181D 83C404                   add  sp, 4
  4066 00001820 08C0                     or  al, al
  4067 00001822 0F840600                 je .checkreg182
  4068 00001826 B81900                   mov ax, 25
  4069 00001829 E9F201                   jmp .retncheckreg
  4070                                  .checkreg182:
  4071 0000182C 68[461A]                 push checkreg_13
  4072 0000182F 8D06BB69                 lea  ax, [symbol]
  4073 00001833 50                       push ax
  4074 00001834 E82BEA                   call eqstr
  4075 00001837 83C404                   add  sp, 4
  4076 0000183A 08C0                     or  al, al
  4077 0000183C 0F840600                 je .checkreg183
  4078 00001840 B81B00                   mov ax, 27
  4079 00001843 E9D801                   jmp .retncheckreg
  4080                                  
  4081                                  ;-542   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4082                                  
  4083                                  .checkreg183:
  4084 00001846 68[491A]                 push checkreg_14
  4085 00001849 8D06BB69                 lea  ax, [symbol]
  4086 0000184D 50                       push ax
  4087 0000184E E811EA                   call eqstr
  4088 00001851 83C404                   add  sp, 4
  4089 00001854 08C0                     or  al, al
  4090 00001856 0F840600                 je .checkreg184
  4091 0000185A B81D00                   mov ax, 29
  4092 0000185D E9BE01                   jmp .retncheckreg
  4093                                  .checkreg184:
  4094 00001860 68[4C1A]                 push checkreg_15
  4095 00001863 8D06BB69                 lea  ax, [symbol]
  4096 00001867 50                       push ax
  4097 00001868 E8F7E9                   call eqstr
  4098 0000186B 83C404                   add  sp, 4
  4099 0000186E 08C0                     or  al, al
  4100 00001870 0F840600                 je .checkreg185
  4101 00001874 B81F00                   mov ax, 31
  4102 00001877 E9A401                   jmp .retncheckreg
  4103                                  
  4104                                  ;-543   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4105                                  
  4106                                  .checkreg185:
  4107 0000187A 68[4F1A]                 push checkreg_16
  4108 0000187D 8D06BB69                 lea  ax, [symbol]
  4109 00001881 50                       push ax
  4110 00001882 E8DDE9                   call eqstr
  4111 00001885 83C404                   add  sp, 4
  4112 00001888 08C0                     or  al, al
  4113 0000188A 0F840600                 je .checkreg186
  4114 0000188E B82100                   mov ax, 33
  4115 00001891 E98A01                   jmp .retncheckreg
  4116                                  .checkreg186:
  4117 00001894 68[521A]                 push checkreg_17
  4118 00001897 8D06BB69                 lea  ax, [symbol]
  4119 0000189B 50                       push ax
  4120 0000189C E8C3E9                   call eqstr
  4121 0000189F 83C404                   add  sp, 4
  4122 000018A2 08C0                     or  al, al
  4123 000018A4 0F840600                 je .checkreg187
  4124 000018A8 B82300                   mov ax, 35
  4125 000018AB E97001                   jmp .retncheckreg
  4126                                  
  4127                                  ;-544   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4128                                  
  4129                                  .checkreg187:
  4130 000018AE 68[551A]                 push checkreg_18
  4131 000018B1 8D06BB69                 lea  ax, [symbol]
  4132 000018B5 50                       push ax
  4133 000018B6 E8A9E9                   call eqstr
  4134 000018B9 83C404                   add  sp, 4
  4135 000018BC 08C0                     or  al, al
  4136 000018BE 0F840600                 je .checkreg188
  4137 000018C2 B82500                   mov ax, 37
  4138 000018C5 E95601                   jmp .retncheckreg
  4139                                  .checkreg188:
  4140 000018C8 68[581A]                 push checkreg_19
  4141 000018CB 8D06BB69                 lea  ax, [symbol]
  4142 000018CF 50                       push ax
  4143 000018D0 E88FE9                   call eqstr
  4144 000018D3 83C404                   add  sp, 4
  4145 000018D6 08C0                     or  al, al
  4146 000018D8 0F840600                 je .checkreg189
  4147 000018DC B82700                   mov ax, 39
  4148 000018DF E93C01                   jmp .retncheckreg
  4149                                  
  4150                                  ;-545   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4151                                  
  4152                                  .checkreg189:
  4153 000018E2 68[5B1A]                 push checkreg_20
  4154 000018E5 8D06BB69                 lea  ax, [symbol]
  4155 000018E9 50                       push ax
  4156 000018EA E875E9                   call eqstr
  4157 000018ED 83C404                   add  sp, 4
  4158 000018F0 08C0                     or  al, al
  4159 000018F2 0F840600                 je .checkreg190
  4160 000018F6 B82900                   mov ax, 41
  4161 000018F9 E92201                   jmp .retncheckreg
  4162                                  .checkreg190:
  4163 000018FC 68[5E1A]                 push checkreg_21
  4164 000018FF 8D06BB69                 lea  ax, [symbol]
  4165 00001903 50                       push ax
  4166 00001904 E85BE9                   call eqstr
  4167 00001907 83C404                   add  sp, 4
  4168 0000190A 08C0                     or  al, al
  4169 0000190C 0F840600                 je .checkreg191
  4170 00001910 B82B00                   mov ax, 43
  4171 00001913 E90801                   jmp .retncheckreg
  4172                                  
  4173                                  ;-546   // (eqstr(symbol,"ip")) return 45;
  4174                                  
  4175                                  
  4176                                  ;-547   if (strlen(symbol) >   3) return 0;
  4177                                  
  4178                                  .checkreg191:
  4179 00001916 8D06BB69                 lea  ax, [symbol]
  4180 0000191A 50                       push ax
  4181 0000191B E8E6E8                   call strlen
  4182 0000191E 83C402                   add  sp, 2
  4183 00001921 83F803                   cmp ax, 3
  4184 00001924 0F8E0600                 jle .checkreg192
  4185 00001928 B80000                   mov ax, 0
  4186 0000192B E9F000                   jmp .retncheckreg
  4187                                  
  4188                                  ;-548   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4189                                  
  4190                                  .checkreg192:
  4191 0000192E 68[611A]                 push checkreg_22
  4192 00001931 8D06BB69                 lea  ax, [symbol]
  4193 00001935 50                       push ax
  4194 00001936 E829E9                   call eqstr
  4195 00001939 83C404                   add  sp, 4
  4196 0000193C 08C0                     or  al, al
  4197 0000193E 0F840600                 je .checkreg193
  4198 00001942 B82F00                   mov ax, 47
  4199 00001945 E9D600                   jmp .retncheckreg
  4200                                  .checkreg193:
  4201 00001948 68[651A]                 push checkreg_23
  4202 0000194B 8D06BB69                 lea  ax, [symbol]
  4203 0000194F 50                       push ax
  4204 00001950 E80FE9                   call eqstr
  4205 00001953 83C404                   add  sp, 4
  4206 00001956 08C0                     or  al, al
  4207 00001958 0F840600                 je .checkreg194
  4208 0000195C B83200                   mov ax, 50
  4209 0000195F E9BC00                   jmp .retncheckreg
  4210                                  
  4211                                  ;-549   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4212                                  
  4213                                  .checkreg194:
  4214 00001962 68[691A]                 push checkreg_24
  4215 00001965 8D06BB69                 lea  ax, [symbol]
  4216 00001969 50                       push ax
  4217 0000196A E8F5E8                   call eqstr
  4218 0000196D 83C404                   add  sp, 4
  4219 00001970 08C0                     or  al, al
  4220 00001972 0F840600                 je .checkreg195
  4221 00001976 B83500                   mov ax, 53
  4222 00001979 E9A200                   jmp .retncheckreg
  4223                                  .checkreg195:
  4224 0000197C 68[6D1A]                 push checkreg_25
  4225 0000197F 8D06BB69                 lea  ax, [symbol]
  4226 00001983 50                       push ax
  4227 00001984 E8DBE8                   call eqstr
  4228 00001987 83C404                   add  sp, 4
  4229 0000198A 08C0                     or  al, al
  4230 0000198C 0F840600                 je .checkreg196
  4231 00001990 B83800                   mov ax, 56
  4232 00001993 E98800                   jmp .retncheckreg
  4233                                  
  4234                                  ;-550   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4235                                  
  4236                                  .checkreg196:
  4237 00001996 68[711A]                 push checkreg_26
  4238 00001999 8D06BB69                 lea  ax, [symbol]
  4239 0000199D 50                       push ax
  4240 0000199E E8C1E8                   call eqstr
  4241 000019A1 83C404                   add  sp, 4
  4242 000019A4 08C0                     or  al, al
  4243 000019A6 0F840600                 je .checkreg197
  4244 000019AA B83B00                   mov ax, 59
  4245 000019AD E96E00                   jmp .retncheckreg
  4246                                  .checkreg197:
  4247 000019B0 68[751A]                 push checkreg_27
  4248 000019B3 8D06BB69                 lea  ax, [symbol]
  4249 000019B7 50                       push ax
  4250 000019B8 E8A7E8                   call eqstr
  4251 000019BB 83C404                   add  sp, 4
  4252 000019BE 08C0                     or  al, al
  4253 000019C0 0F840600                 je .checkreg198
  4254 000019C4 B83E00                   mov ax, 62
  4255 000019C7 E95400                   jmp .retncheckreg
  4256                                  
  4257                                  ;-551   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4258                                  
  4259                                  .checkreg198:
  4260 000019CA 68[791A]                 push checkreg_28
  4261 000019CD 8D06BB69                 lea  ax, [symbol]
  4262 000019D1 50                       push ax
  4263 000019D2 E88DE8                   call eqstr
  4264 000019D5 83C404                   add  sp, 4
  4265 000019D8 08C0                     or  al, al
  4266 000019DA 0F840600                 je .checkreg199
  4267 000019DE B84100                   mov ax, 65
  4268 000019E1 E93A00                   jmp .retncheckreg
  4269                                  .checkreg199:
  4270 000019E4 68[7D1A]                 push checkreg_29
  4271 000019E7 8D06BB69                 lea  ax, [symbol]
  4272 000019EB 50                       push ax
  4273 000019EC E873E8                   call eqstr
  4274 000019EF 83C404                   add  sp, 4
  4275 000019F2 08C0                     or  al, al
  4276 000019F4 0F840600                 je .checkreg200
  4277 000019F8 B84400                   mov ax, 68
  4278 000019FB E92000                   jmp .retncheckreg
  4279                                  
  4280                                  ;-552   if (eqstr(symbol,"cr0")) return 71;
  4281                                  
  4282                                  .checkreg200:
  4283 000019FE 68[811A]                 push checkreg_30
  4284 00001A01 8D06BB69                 lea  ax, [symbol]
  4285 00001A05 50                       push ax
  4286 00001A06 E859E8                   call eqstr
  4287 00001A09 83C404                   add  sp, 4
  4288 00001A0C 08C0                     or  al, al
  4289 00001A0E 0F840600                 je .checkreg201
  4290 00001A12 B84700                   mov ax, 71
  4291 00001A15 E90600                   jmp .retncheckreg
  4292                                  
  4293                                  ;-553   return 0;   }
  4294                                  
  4295                                  .checkreg201:
  4296 00001A18 B80000                   mov ax, 0
  4297 00001A1B E90000                   jmp .retncheckreg
  4298                                  
  4299                                  ;-554 
  4300                                  
  4301                                  
  4302                                  ;-555 char printregstr[]
  4303                                  
  4304                                   .retncheckreg:
  4305 00001A1E C3                       ret
  4306 00001A1F 616C00                  checkreg_0 db "al",0
  4307 00001A22 636C00                  checkreg_1 db "cl",0
  4308 00001A25 646C00                  checkreg_2 db "dl",0
  4309 00001A28 626C00                  checkreg_3 db "bl",0
  4310 00001A2B 616800                  checkreg_4 db "ah",0
  4311 00001A2E 636800                  checkreg_5 db "ch",0
  4312 00001A31 646800                  checkreg_6 db "dh",0
  4313 00001A34 626800                  checkreg_7 db "bh",0
  4314 00001A37 617800                  checkreg_8 db "ax",0
  4315 00001A3A 637800                  checkreg_9 db "cx",0
  4316 00001A3D 647800                  checkreg_10 db "dx",0
  4317 00001A40 627800                  checkreg_11 db "bx",0
  4318 00001A43 737000                  checkreg_12 db "sp",0
  4319 00001A46 627000                  checkreg_13 db "bp",0
  4320 00001A49 736900                  checkreg_14 db "si",0
  4321 00001A4C 646900                  checkreg_15 db "di",0
  4322 00001A4F 657300                  checkreg_16 db "es",0
  4323 00001A52 637300                  checkreg_17 db "cs",0
  4324 00001A55 737300                  checkreg_18 db "ss",0
  4325 00001A58 647300                  checkreg_19 db "ds",0
  4326 00001A5B 667300                  checkreg_20 db "fs",0
  4327 00001A5E 677300                  checkreg_21 db "gs",0
  4328 00001A61 65617800                checkreg_22 db "eax",0
  4329 00001A65 65637800                checkreg_23 db "ecx",0
  4330 00001A69 65647800                checkreg_24 db "edx",0
  4331 00001A6D 65627800                checkreg_25 db "ebx",0
  4332 00001A71 65737000                checkreg_26 db "esp",0
  4333 00001A75 65627000                checkreg_27 db "ebp",0
  4334 00001A79 65736900                checkreg_28 db "esi",0
  4335 00001A7D 65646900                checkreg_29 db "edi",0
  4336 00001A81 63723000                checkreg_30 db "cr0",0
  4337                                  ENDP
  4338                                  
  4339                                  ;-556 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4340                                  
  4341 00001A85 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4342 00001A8E 616863686468626861-
  4343 00001A97 786378647862787370-
  4344 00001AA0 627073696469657363-
  4345 00001AA9 737373647366736773-
  4346 00001AB2 697065617865637865-
  4347 00001ABB 647865627865737065-
  4348 00001AC4 627065736965646963-
  4349 00001ACD 723000             
  4350                                  
  4351                                  ;-557 
  4352                                  
  4353                                  
  4354                                  ;-558 int printreg(int i) {  unsigned int k; unsigned char c;
  4355                                  
  4356                                  
  4357                                  printreg: PROC
  4358                                  
  4359                                  ;-559   k = &printregstr + i; c=*k; prc(c); i++;
  4360                                  ;
  4361 00001AD0 C8040000                 ENTER  4,0
  4362 00001AD4 B8[851A]                 mov ax, printregstr
  4363 00001AD7 034604                   add ax, [bp+4]
  4364 00001ADA 8946FE                   mov [bp-2], ax
  4365 00001ADD 8B5EFE                   mov bx, [bp-2]
  4366 00001AE0 8B07                     mov ax, [bx]
  4367 00001AE2 8846FC                   mov [bp-4], al
  4368 00001AE5 8A46FC                   mov al, byte [bp-4]
  4369 00001AE8 B400                     mov ah, 0
  4370 00001AEA 50                       push ax
  4371 00001AEB E8D1E9                   call prc
  4372 00001AEE 83C402                   add  sp, 2
  4373 00001AF1 FF4604                   inc  word[bp+4]
  4374                                  
  4375                                  ;-560   k = &printregstr + i; c=*k; prc(c);
  4376                                  
  4377 00001AF4 B8[851A]                 mov ax, printregstr
  4378 00001AF7 034604                   add ax, [bp+4]
  4379 00001AFA 8946FE                   mov [bp-2], ax
  4380 00001AFD 8B5EFE                   mov bx, [bp-2]
  4381 00001B00 8B07                     mov ax, [bx]
  4382 00001B02 8846FC                   mov [bp-4], al
  4383 00001B05 8A46FC                   mov al, byte [bp-4]
  4384 00001B08 B400                     mov ah, 0
  4385 00001B0A 50                       push ax
  4386 00001B0B E8B1E9                   call prc
  4387 00001B0E 83C402                   add  sp, 2
  4388                                  
  4389                                  ;-561   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4390                                  
  4391 00001B11 8B4604                   mov ax, [bp+4]
  4392 00001B14 83F82F                   cmp ax, 47
  4393 00001B17 0F8E2000                 jle .printreg202
  4394 00001B1B FF4604                   inc  word[bp+4]
  4395 00001B1E B8[851A]                 mov ax, printregstr
  4396 00001B21 034604                   add ax, [bp+4]
  4397 00001B24 8946FE                   mov [bp-2], ax
  4398 00001B27 8B5EFE                   mov bx, [bp-2]
  4399 00001B2A 8B07                     mov ax, [bx]
  4400 00001B2C 8846FC                   mov [bp-4], al
  4401 00001B2F 8A46FC                   mov al, byte [bp-4]
  4402 00001B32 B400                     mov ah, 0
  4403 00001B34 50                       push ax
  4404 00001B35 E887E9                   call prc
  4405 00001B38 83C402                   add  sp, 2
  4406                                  
  4407                                  ;-562 }
  4408                                  
  4409                                  .printreg202:
  4410                                  
  4411                                  ;-563 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4412 00001B3B C9                       LEAVE
  4413 00001B3C C3                       ret
  4414                                  ENDP
  4415 00001B3D 0000                    evalue dw 0
  4416 00001B3F 0A00                    exprtype dw 10
  4417                                  
  4418                                  ;-564 int expr(int isRight)
  4419                                  
  4420                                  
  4421                                  expr: PROC
  4422                                  
  4423                                  ;-565 { int mode; int id1;     int ixarr; int ixconst;
  4424                                  
  4425                                  
  4426                                  ;-566   int ids;  int isCONST; int i;     unsigned char *p;
  4427                                  
  4428                                  
  4429                                  ;-567   if (istoken(T_CONST)) { evalue=lexval;
  4430                                  ;
  4431 00001B41 C8100000                 ENTER  16,0
  4432 00001B45 680101                   push 257
  4433 00001B48 E8A9E8                   call istoken
  4434 00001B4B 83C402                   add  sp, 2
  4435 00001B4E 08C0                     or  al, al
  4436 00001B50 0F841F00                 je .expr203
  4437 00001B54 A1[2C00]                 mov ax, [lexval]
  4438 00001B57 A3[3D1B]                 mov word [evalue], ax
  4439                                  
  4440                                  ;-568     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4441                                  
  4442 00001B5A 68[E11E]                 push expr_0
  4443 00001B5D E8C6E9                   call prs
  4444 00001B60 83C402                   add  sp, 2
  4445 00001B63 FF36[2C00]               push word [lexval]
  4446 00001B67 E811EB                   call prunsign1
  4447 00001B6A 83C402                   add  sp, 2
  4448 00001B6D B80400                   mov ax, 4
  4449 00001B70 E96C03                   jmp .retnexpr
  4450                                  
  4451                                  ;-569   mode=typeName(); /*0=V,1=*,2=&*/
  4452                                  
  4453                                  .expr203:
  4454 00001B73 E8DCF1                   call typeName
  4455 00001B76 8946FE                   mov [bp-2], ax
  4456                                  
  4457                                  ;-570   ireg1=checkreg();
  4458                                  
  4459 00001B79 E846FB                   call checkreg
  4460 00001B7C A3[3F13]                 mov word [ireg1], ax
  4461                                  
  4462                                  ;-571   if (ireg1) { doreg1(0); return; }
  4463                                  
  4464 00001B7F A1[3F13]                 mov ax, [ireg1]
  4465 00001B82 08C0                     or  al, al
  4466 00001B84 0F840B00                 je .expr204
  4467 00001B88 6A00                     push 0
  4468 00001B8A E849F9                   call doreg1
  4469 00001B8D 83C402                   add  sp, 2
  4470 00001B90 E94C03                   jmp .retnexpr
  4471                                  
  4472                                  ;-572   if (token=='(')  {docall1(); goto e1; }
  4473                                  
  4474                                  .expr204:
  4475 00001B93 A1[1E00]                 mov ax, [token]
  4476 00001B96 83F828                   cmp ax, 40
  4477 00001B99 0F850600                 jne .expr205
  4478 00001B9D E82F0F                   call docall1
  4479 00001BA0 E93202                   jmp .e1
  4480                                  
  4481                                  ;-573   if (isreg()) goto e1;
  4482                                  
  4483                                  .expr205:
  4484 00001BA3 E88407                   call isreg
  4485 00001BA6 08C0                     or  al, al
  4486 00001BA8 0F840300                 je .expr206
  4487 00001BAC E92602                   jmp .e1
  4488                                  
  4489                                  ;-574 
  4490                                  
  4491                                  
  4492                                  ;-575   id1=searchname(); gettypes(id1); ids=signi;
  4493                                  
  4494                                  .expr206:
  4495 00001BAF E8D1F0                   call searchname
  4496 00001BB2 8946FC                   mov [bp-4], ax
  4497 00001BB5 FF76FC                   push word [bp-4]
  4498 00001BB8 E88AEF                   call gettypes
  4499 00001BBB 83C402                   add  sp, 2
  4500 00001BBE A1[3100]                 mov ax, [signi]
  4501 00001BC1 8946F6                   mov [bp-10], ax
  4502                                  
  4503                                  ;-576   ixarr=0;  ixconst=0;
  4504                                  
  4505 00001BC4 B80000                   mov ax, 0
  4506 00001BC7 8946FA                   mov [bp-6], ax
  4507 00001BCA B80000                   mov ax, 0
  4508 00001BCD 8946F8                   mov [bp-8], ax
  4509                                  
  4510                                  ;-577     if (istoken('[')) { if (istoken(T_CONST)) {
  4511                                  
  4512 00001BD0 6A5B                     push 91
  4513 00001BD2 E81FE8                   call istoken
  4514 00001BD5 83C402                   add  sp, 2
  4515 00001BD8 08C0                     or  al, al
  4516 00001BDA 0F845900                 je .expr207
  4517 00001BDE 680101                   push 257
  4518 00001BE1 E810E8                   call istoken
  4519 00001BE4 83C402                   add  sp, 2
  4520 00001BE7 08C0                     or  al, al
  4521 00001BE9 0F841700                 je .expr208
  4522                                  
  4523                                  ;-578       ixconst=1; ixarr=lexval; expect(']');  }
  4524                                  
  4525 00001BED B80100                   mov ax, 1
  4526 00001BF0 8946F8                   mov [bp-8], ax
  4527 00001BF3 A1[2C00]                 mov ax, [lexval]
  4528 00001BF6 8946FA                   mov [bp-6], ax
  4529 00001BF9 6A5D                     push 93
  4530 00001BFB E818E8                   call expect
  4531 00001BFE 83C402                   add  sp, 2
  4532                                  
  4533                                  ;-579     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4534                                  
  4535 00001C01 E93300                   jmp .expr209
  4536                                  .expr208:
  4537 00001C04 E87CF0                   call searchname
  4538 00001C07 8946FA                   mov [bp-6], ax
  4539 00001C0A 680001                   push 256
  4540 00001C0D E806E8                   call expect
  4541 00001C10 83C402                   add  sp, 2
  4542 00001C13 6A5D                     push 93
  4543 00001C15 E8FEE7                   call expect
  4544 00001C18 83C402                   add  sp, 2
  4545                                  
  4546                                  ;-580     gettypes(ixarr);
  4547                                  
  4548 00001C1B FF76FA                   push word [bp-6]
  4549 00001C1E E824EF                   call gettypes
  4550 00001C21 83C402                   add  sp, 2
  4551                                  
  4552                                  ;-581     if (widthi != 2) error1("Array index must be number or int"); } }
  4553                                  
  4554 00001C24 A1[3400]                 mov ax, [widthi]
  4555 00001C27 83F802                   cmp ax, 2
  4556 00001C2A 0F840900                 je  .expr210
  4557 00001C2E 68[ED1E]                 push expr_1
  4558 00001C31 E83720                   call error1
  4559 00001C34 83C402                   add  sp, 2
  4560                                  .expr210:
  4561                                  .expr209:
  4562                                  
  4563                                  ;-582   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  4564                                  
  4565                                  .expr207:
  4566 00001C37 68C304                   push 1219
  4567 00001C3A E8B7E7                   call istoken
  4568 00001C3D 83C402                   add  sp, 2
  4569 00001C40 08C0                     or  al, al
  4570 00001C42 0F844600                 je .expr211
  4571 00001C46 8B46FE                   mov ax, [bp-2]
  4572 00001C49 08C0                     or  al, al
  4573 00001C4B 0F840900                 je .expr212
  4574 00001C4F 68[0F1F]                 push expr_2
  4575 00001C52 E81620                   call error1
  4576 00001C55 83C402                   add  sp, 2
  4577                                  
  4578                                  ;-583      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4579                                  
  4580                                  .expr212:
  4581 00001C58 68[201F]                 push expr_3
  4582 00001C5B E8C8E8                   call prs
  4583 00001C5E 83C402                   add  sp, 2
  4584 00001C61 A1[3700]                 mov ax, [wi]
  4585 00001C64 83F802                   cmp ax, 2
  4586 00001C67 0F850C00                 jne .expr213
  4587 00001C6B 68[291F]                 push expr_4
  4588 00001C6E E8B5E8                   call prs
  4589 00001C71 83C402                   add  sp, 2
  4590 00001C74 E90900                   jmp .expr214
  4591                                  .expr213:
  4592 00001C77 68[2E1F]                 push expr_5
  4593 00001C7A E8A9E8                   call prs
  4594 00001C7D 83C402                   add  sp, 2
  4595                                  
  4596                                  ;-584      v(id1); goto e1;}
  4597                                  
  4598                                  .expr214:
  4599 00001C80 FF76FC                   push word [bp-4]
  4600 00001C83 E8D1E6                   call v
  4601 00001C86 83C402                   add  sp, 2
  4602 00001C89 E94901                   jmp .e1
  4603                                  
  4604                                  ;-585   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  4605                                  
  4606                                  .expr211:
  4607 00001C8C 68C904                   push 1225
  4608 00001C8F E862E7                   call istoken
  4609 00001C92 83C402                   add  sp, 2
  4610 00001C95 08C0                     or  al, al
  4611 00001C97 0F844600                 je .expr215
  4612 00001C9B 8B46FE                   mov ax, [bp-2]
  4613 00001C9E 08C0                     or  al, al
  4614 00001CA0 0F840900                 je .expr216
  4615 00001CA4 68[331F]                 push expr_6
  4616 00001CA7 E8C11F                   call error1
  4617 00001CAA 83C402                   add  sp, 2
  4618                                  
  4619                                  ;-586      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4620                                  
  4621                                  .expr216:
  4622 00001CAD 68[441F]                 push expr_7
  4623 00001CB0 E873E8                   call prs
  4624 00001CB3 83C402                   add  sp, 2
  4625 00001CB6 A1[3700]                 mov ax, [wi]
  4626 00001CB9 83F802                   cmp ax, 2
  4627 00001CBC 0F850C00                 jne .expr217
  4628 00001CC0 68[4D1F]                 push expr_8
  4629 00001CC3 E860E8                   call prs
  4630 00001CC6 83C402                   add  sp, 2
  4631 00001CC9 E90900                   jmp .expr218
  4632                                  .expr217:
  4633 00001CCC 68[521F]                 push expr_9
  4634 00001CCF E854E8                   call prs
  4635 00001CD2 83C402                   add  sp, 2
  4636                                  
  4637                                  ;-587      v(id1); goto e1;}
  4638                                  
  4639                                  .expr218:
  4640 00001CD5 FF76FC                   push word [bp-4]
  4641 00001CD8 E87CE6                   call v
  4642 00001CDB 83C402                   add  sp, 2
  4643 00001CDE E9F400                   jmp .e1
  4644                                  
  4645                                  ;-588 
  4646                                  
  4647                                  
  4648                                  ;-589   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4649                                  
  4650                                  .expr215:
  4651 00001CE1 68CE04                   push 1230
  4652 00001CE4 E80DE7                   call istoken
  4653 00001CE7 83C402                   add  sp, 2
  4654 00001CEA 08C0                     or  al, al
  4655 00001CEC 0F841200                 je .expr219
  4656 00001CF0 FF76FC                   push word [bp-4]
  4657 00001CF3 FF76FE                   push word [bp-2]
  4658 00001CF6 68[571F]                 push expr_10
  4659 00001CF9 E8A902                   call compoundass
  4660 00001CFC 83C406                   add  sp, 6
  4661 00001CFF E9D300                   jmp .e1
  4662                                  
  4663                                  ;-590   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4664                                  
  4665                                  .expr219:
  4666 00001D02 68CF04                   push 1231
  4667 00001D05 E8ECE6                   call istoken
  4668 00001D08 83C402                   add  sp, 2
  4669 00001D0B 08C0                     or  al, al
  4670 00001D0D 0F841200                 je .expr220
  4671 00001D11 FF76FC                   push word [bp-4]
  4672 00001D14 FF76FE                   push word [bp-2]
  4673 00001D17 68[5B1F]                 push expr_11
  4674 00001D1A E88802                   call compoundass
  4675 00001D1D 83C406                   add  sp, 6
  4676 00001D20 E9B200                   jmp .e1
  4677                                  
  4678                                  ;-591   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4679                                  
  4680                                  .expr220:
  4681 00001D23 68D204                   push 1234
  4682 00001D26 E8CBE6                   call istoken
  4683 00001D29 83C402                   add  sp, 2
  4684 00001D2C 08C0                     or  al, al
  4685 00001D2E 0F841200                 je .expr221
  4686 00001D32 FF76FC                   push word [bp-4]
  4687 00001D35 FF76FE                   push word [bp-2]
  4688 00001D38 68[5F1F]                 push expr_12
  4689 00001D3B E86702                   call compoundass
  4690 00001D3E 83C406                   add  sp, 6
  4691 00001D41 E99100                   jmp .e1
  4692                                  
  4693                                  ;-592   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  4694                                  
  4695                                  .expr221:
  4696 00001D44 68D304                   push 1235
  4697 00001D47 E8AAE6                   call istoken
  4698 00001D4A 83C402                   add  sp, 2
  4699 00001D4D 08C0                     or  al, al
  4700 00001D4F 0F841200                 je .expr222
  4701 00001D53 FF76FC                   push word [bp-4]
  4702 00001D56 FF76FE                   push word [bp-2]
  4703 00001D59 68[631F]                 push expr_13
  4704 00001D5C E84602                   call compoundass
  4705 00001D5F 83C406                   add  sp, 6
  4706 00001D62 E97000                   jmp .e1
  4707                                  
  4708                                  ;-593   if (istoken(T_MULASS    )) {error1("not implemented");}
  4709                                  
  4710                                  .expr222:
  4711 00001D65 68D004                   push 1232
  4712 00001D68 E889E6                   call istoken
  4713 00001D6B 83C402                   add  sp, 2
  4714 00001D6E 08C0                     or  al, al
  4715 00001D70 0F840900                 je .expr223
  4716 00001D74 68[661F]                 push expr_14
  4717 00001D77 E8F11E                   call error1
  4718 00001D7A 83C402                   add  sp, 2
  4719                                  
  4720                                  ;-594   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4721                                  
  4722                                  .expr223:
  4723 00001D7D 68D104                   push 1233
  4724 00001D80 E871E6                   call istoken
  4725 00001D83 83C402                   add  sp, 2
  4726 00001D86 08C0                     or  al, al
  4727 00001D88 0F840900                 je .expr224
  4728 00001D8C 68[761F]                 push expr_15
  4729 00001D8F E8D91E                   call error1
  4730 00001D92 83C402                   add  sp, 2
  4731                                  
  4732                                  ;-595 
  4733                                  
  4734                                  
  4735                                  ;-596   if (istoken('=')) { exprtype= expr(1);
  4736                                  
  4737                                  .expr224:
  4738 00001D95 6A3D                     push 61
  4739 00001D97 E85AE6                   call istoken
  4740 00001D9A 83C402                   add  sp, 2
  4741 00001D9D 08C0                     or  al, al
  4742 00001D9F 0F842000                 je .expr225
  4743 00001DA3 6A01                     push 1
  4744 00001DA5 E899FD                   call expr
  4745 00001DA8 83C402                   add  sp, 2
  4746 00001DAB A3[3F1B]                 mov word [exprtype], ax
  4747                                  
  4748                                  ;-597   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4749                                  
  4750 00001DAE FF76F8                   push word [bp-8]
  4751 00001DB1 FF76FA                   push word [bp-6]
  4752 00001DB4 FF76FC                   push word [bp-4]
  4753 00001DB7 FF76FE                   push word [bp-2]
  4754 00001DBA E85F08                   call doassign
  4755 00001DBD 83C408                   add  sp, 8
  4756 00001DC0 E91200                   jmp .e1
  4757                                  
  4758                                  ;-598   dovar1(mode, "mov", ixarr, id1);
  4759                                  
  4760                                  .expr225:
  4761 00001DC3 FF76FC                   push word [bp-4]
  4762 00001DC6 FF76FA                   push word [bp-6]
  4763 00001DC9 68[861F]                 push expr_16
  4764 00001DCC FF76FE                   push word [bp-2]
  4765 00001DCF E87502                   call dovar1
  4766 00001DD2 83C408                   add  sp, 8
  4767                                  
  4768                                  ;-599 
  4769                                  
  4770                                  
  4771                                  ;-600 e1:    if (istoken('+')) rterm("add");
  4772                                  
  4773                                  .e1:
  4774 00001DD5 6A2B                     push 43
  4775 00001DD7 E81AE6                   call istoken
  4776 00001DDA 83C402                   add  sp, 2
  4777 00001DDD 08C0                     or  al, al
  4778 00001DDF 0F840C00                 je .expr226
  4779 00001DE3 68[8A1F]                 push expr_17
  4780 00001DE6 E82804                   call rterm
  4781 00001DE9 83C402                   add  sp, 2
  4782                                  
  4783                                  ;-601   else if (istoken('-')) rterm("sub" );
  4784                                  
  4785 00001DEC E9CF00                   jmp .expr227
  4786                                  .expr226:
  4787 00001DEF 6A2D                     push 45
  4788 00001DF1 E800E6                   call istoken
  4789 00001DF4 83C402                   add  sp, 2
  4790 00001DF7 08C0                     or  al, al
  4791 00001DF9 0F840C00                 je .expr228
  4792 00001DFD 68[8E1F]                 push expr_18
  4793 00001E00 E80E04                   call rterm
  4794 00001E03 83C402                   add  sp, 2
  4795                                  
  4796                                  ;-602   else if (istoken('&')) rterm("and" );
  4797                                  
  4798 00001E06 E9B500                   jmp .expr229
  4799                                  .expr228:
  4800 00001E09 6A26                     push 38
  4801 00001E0B E8E6E5                   call istoken
  4802 00001E0E 83C402                   add  sp, 2
  4803 00001E11 08C0                     or  al, al
  4804 00001E13 0F840C00                 je .expr230
  4805 00001E17 68[921F]                 push expr_19
  4806 00001E1A E8F403                   call rterm
  4807 00001E1D 83C402                   add  sp, 2
  4808                                  
  4809                                  ;-603   else if (istoken('|')) rterm("or" );
  4810                                  
  4811 00001E20 E99B00                   jmp .expr231
  4812                                  .expr230:
  4813 00001E23 6A7C                     push 124
  4814 00001E25 E8CCE5                   call istoken
  4815 00001E28 83C402                   add  sp, 2
  4816 00001E2B 08C0                     or  al, al
  4817 00001E2D 0F840C00                 je .expr232
  4818 00001E31 68[961F]                 push expr_20
  4819 00001E34 E8DA03                   call rterm
  4820 00001E37 83C402                   add  sp, 2
  4821                                  
  4822                                  ;-604   else if (istoken(T_LESSLESS)) rterm("shl");
  4823                                  
  4824 00001E3A E98100                   jmp .expr233
  4825                                  .expr232:
  4826 00001E3D 68D804                   push 1240
  4827 00001E40 E8B1E5                   call istoken
  4828 00001E43 83C402                   add  sp, 2
  4829 00001E46 08C0                     or  al, al
  4830 00001E48 0F840C00                 je .expr234
  4831 00001E4C 68[991F]                 push expr_21
  4832 00001E4F E8BF03                   call rterm
  4833 00001E52 83C402                   add  sp, 2
  4834                                  
  4835                                  ;-605   else if (istoken(T_GREATGREAT)) rterm("shr");
  4836                                  
  4837 00001E55 E96600                   jmp .expr235
  4838                                  .expr234:
  4839 00001E58 68D904                   push 1241
  4840 00001E5B E896E5                   call istoken
  4841 00001E5E 83C402                   add  sp, 2
  4842 00001E61 08C0                     or  al, al
  4843 00001E63 0F840C00                 je .expr236
  4844 00001E67 68[9D1F]                 push expr_22
  4845 00001E6A E8A403                   call rterm
  4846 00001E6D 83C402                   add  sp, 2
  4847                                  
  4848                                  ;-606   else if (istoken('*')) domul (ids);
  4849                                  
  4850 00001E70 E94B00                   jmp .expr237
  4851                                  .expr236:
  4852 00001E73 6A2A                     push 42
  4853 00001E75 E87CE5                   call istoken
  4854 00001E78 83C402                   add  sp, 2
  4855 00001E7B 08C0                     or  al, al
  4856 00001E7D 0F840C00                 je .expr238
  4857 00001E81 FF76F6                   push word [bp-10]
  4858 00001E84 E8DE09                   call domul
  4859 00001E87 83C402                   add  sp, 2
  4860                                  
  4861                                  ;-607   else if (istoken('/')) doidiv(ids);
  4862                                  
  4863 00001E8A E93100                   jmp .expr239
  4864                                  .expr238:
  4865 00001E8D 6A2F                     push 47
  4866 00001E8F E862E5                   call istoken
  4867 00001E92 83C402                   add  sp, 2
  4868 00001E95 08C0                     or  al, al
  4869 00001E97 0F840C00                 je .expr240
  4870 00001E9B FF76F6                   push word [bp-10]
  4871 00001E9E E8650A                   call doidiv
  4872 00001EA1 83C402                   add  sp, 2
  4873                                  
  4874                                  ;-608   else if (istoken('%')) domod (ids);
  4875                                  
  4876 00001EA4 E91700                   jmp .expr241
  4877                                  .expr240:
  4878 00001EA7 6A25                     push 37
  4879 00001EA9 E848E5                   call istoken
  4880 00001EAC 83C402                   add  sp, 2
  4881 00001EAF 08C0                     or  al, al
  4882 00001EB1 0F840900                 je .expr242
  4883 00001EB5 FF76F6                   push word [bp-10]
  4884 00001EB8 E8EE0B                   call domod
  4885 00001EBB 83C402                   add  sp, 2
  4886                                  
  4887                                  ;-609   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4888                                  
  4889                                  .expr242:
  4890                                  .expr241:
  4891                                  .expr239:
  4892                                  .expr237:
  4893                                  .expr235:
  4894                                  .expr233:
  4895                                  .expr231:
  4896                                  .expr229:
  4897                                  .expr227:
  4898 00001EBE E8CC12                   call isrelational
  4899 00001EC1 08C0                     or  al, al
  4900 00001EC3 0F841200                 je .expr243
  4901 00001EC7 68[A11F]                 push expr_23
  4902 00001ECA E84403                   call rterm
  4903 00001ECD 83C402                   add  sp, 2
  4904 00001ED0 FF76F6                   push word [bp-10]
  4905 00001ED3 E8F90F                   call cmpneg
  4906 00001ED6 83C402                   add  sp, 2
  4907                                  
  4908                                  ;-610   return 0;
  4909                                  
  4910                                  .expr243:
  4911 00001ED9 B80000                   mov ax, 0
  4912 00001EDC E90000                   jmp .retnexpr
  4913                                  
  4914                                  ;-611 }
  4915                                  
  4916                                  
  4917                                  ;-612 
  4918                                  
  4919                                  
  4920                                  ;-613 int compoundass(char *op, int mode, int id1) {
  4921                                  
  4922 00001EDF C9                       .retnexpr: LEAVE
  4923 00001EE0 C3                       ret
  4924 00001EE1 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4925 00001EEA 2C2000             
  4926 00001EED 417272617920696E64-     expr_1 db "Array index must be number or int",0
  4927 00001EF6 6578206D7573742062-
  4928 00001EFF 65206E756D62657220-
  4929 00001F08 6F7220696E7400     
  4930 00001F0F 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  4931 00001F18 616C6C6F77656400   
  4932 00001F20 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4933 00001F29 776F726400              expr_4 db "word",0
  4934 00001F2E 6279746500              expr_5 db "byte",0
  4935 00001F33 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  4936 00001F3C 616C6C6F77656400   
  4937 00001F44 5C6E20646563202000      expr_7 db "\n dec  ",0
  4938 00001F4D 776F726400              expr_8 db "word",0
  4939 00001F52 6279746500              expr_9 db "byte",0
  4940 00001F57 61646400                expr_10 db "add",0
  4941 00001F5B 73756200                expr_11 db "sub",0
  4942 00001F5F 616E6400                expr_12 db "and",0
  4943 00001F63 6F7200                  expr_13 db "or",0
  4944 00001F66 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4945 00001F6F 6D656E74656400     
  4946 00001F76 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4947 00001F7F 6D656E74656400     
  4948 00001F86 6D6F7600                expr_16 db "mov",0
  4949 00001F8A 61646400                expr_17 db "add",0
  4950 00001F8E 73756200                expr_18 db "sub",0
  4951 00001F92 616E6400                expr_19 db "and",0
  4952 00001F96 6F7200                  expr_20 db "or",0
  4953 00001F99 73686C00                expr_21 db "shl",0
  4954 00001F9D 73687200                expr_22 db "shr",0
  4955 00001FA1 636D7000                expr_23 db "cmp",0
  4956                                  ENDP
  4957                                  
  4958                                  compoundass: PROC
  4959                                  
  4960                                  ;-614   if(mode) error1("only scalar Var allowed");
  4961                                  ;
  4962 00001FA5 C8000000                 ENTER  0,0
  4963 00001FA9 8B4606                   mov ax, [bp+6]
  4964 00001FAC 08C0                     or  al, al
  4965 00001FAE 0F840900                 je .compoundass244
  4966 00001FB2 68[1F20]                 push compoundass_0
  4967 00001FB5 E8B31C                   call error1
  4968 00001FB8 83C402                   add  sp, 2
  4969                                  
  4970                                  ;-615   prnl(); prs(op); prs("  ");
  4971                                  
  4972                                  .compoundass244:
  4973 00001FBB E85AE5                   call prnl
  4974 00001FBE FF7604                   push word [bp+4]
  4975 00001FC1 E862E5                   call prs
  4976 00001FC4 83C402                   add  sp, 2
  4977 00001FC7 68[3720]                 push compoundass_1
  4978 00001FCA E859E5                   call prs
  4979 00001FCD 83C402                   add  sp, 2
  4980                                  
  4981                                  ;-616   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4982                                  
  4983 00001FD0 FF7608                   push word [bp+8]
  4984 00001FD3 E86FEB                   call gettypes
  4985 00001FD6 83C402                   add  sp, 2
  4986 00001FD9 A1[3700]                 mov ax, [wi]
  4987 00001FDC 83F802                   cmp ax, 2
  4988 00001FDF 0F850C00                 jne .compoundass245
  4989 00001FE3 68[3A20]                 push compoundass_2
  4990 00001FE6 E83DE5                   call prs
  4991 00001FE9 83C402                   add  sp, 2
  4992 00001FEC E90900                   jmp .compoundass246
  4993                                  .compoundass245:
  4994 00001FEF 68[3F20]                 push compoundass_3
  4995 00001FF2 E831E5                   call prs
  4996 00001FF5 83C402                   add  sp, 2
  4997                                  
  4998                                  ;-617   v(id1); prs(", ");
  4999                                  
  5000                                  .compoundass246:
  5001 00001FF8 FF7608                   push word [bp+8]
  5002 00001FFB E859E3                   call v
  5003 00001FFE 83C402                   add  sp, 2
  5004 00002001 68[4420]                 push compoundass_4
  5005 00002004 E81FE5                   call prs
  5006 00002007 83C402                   add  sp, 2
  5007                                  
  5008                                  ;-618   expect(T_CONST); prunsign1(lexval);
  5009                                  
  5010 0000200A 680101                   push 257
  5011 0000200D E806E4                   call expect
  5012 00002010 83C402                   add  sp, 2
  5013 00002013 FF36[2C00]               push word [lexval]
  5014 00002017 E861E6                   call prunsign1
  5015 0000201A 83C402                   add  sp, 2
  5016                                  
  5017                                  ;-619 }
  5018                                  
  5019                                  
  5020                                  ;-620 int dovar1(int mode, int op, int ixarr, int id1) {
  5021 0000201D C9                       LEAVE
  5022 0000201E C3                       ret
  5023 0000201F 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5024 00002028 61722056617220616C-
  5025 00002031 6C6F77656400       
  5026 00002037 202000                  compoundass_1 db "  ",0
  5027 0000203A 776F726400              compoundass_2 db "word",0
  5028 0000203F 6279746500              compoundass_3 db "byte",0
  5029 00002044 2C2000                  compoundass_4 db ", ",0
  5030                                  ENDP
  5031                                  
  5032                                  dovar1: PROC
  5033                                  
  5034                                  ;-621   gettypes(id1);
  5035                                  ;
  5036 00002047 C8000000                 ENTER  0,0
  5037 0000204B FF760A                   push word [bp+10]
  5038 0000204E E8F4EA                   call gettypes
  5039 00002051 83C402                   add  sp, 2
  5040                                  
  5041                                  ;-622   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5042                                  
  5043 00002054 8B4604                   mov ax, [bp+4]
  5044 00002057 83F801                   cmp ax, 1
  5045 0000205A 0F854700                 jne .dovar1247
  5046 0000205E 68[9C21]                 push dovar1_0
  5047 00002061 E8C2E4                   call prs
  5048 00002064 83C402                   add  sp, 2
  5049 00002067 FF760A                   push word [bp+10]
  5050 0000206A E8EAE2                   call v
  5051 0000206D 83C402                   add  sp, 2
  5052 00002070 E8A5E4                   call prnl
  5053 00002073 FF7606                   push word [bp+6]
  5054 00002076 E8ADE4                   call prs
  5055 00002079 83C402                   add  sp, 2
  5056                                  
  5057                                  ;-623     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5058                                  
  5059 0000207C A1[3400]                 mov ax, [widthi]
  5060 0000207F 83F801                   cmp ax, 1
  5061 00002082 0F850900                 jne .dovar1248
  5062 00002086 68[A821]                 push dovar1_1
  5063 00002089 E89AE4                   call prs
  5064 0000208C 83C402                   add  sp, 2
  5065                                  
  5066                                  ;-624     if(widthi == 2) prs(" ax, [bx]");
  5067                                  
  5068                                  .dovar1248:
  5069 0000208F A1[3400]                 mov ax, [widthi]
  5070 00002092 83F802                   cmp ax, 2
  5071 00002095 0F850900                 jne .dovar1249
  5072 00002099 68[BE21]                 push dovar1_2
  5073 0000209C E887E4                   call prs
  5074 0000209F 83C402                   add  sp, 2
  5075                                  
  5076                                  ;-625     return; }
  5077                                  
  5078                                  .dovar1249:
  5079 000020A2 E9F500                   jmp .retndovar1
  5080                                  
  5081                                  ;-626   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5082                                  
  5083                                  .dovar1247:
  5084 000020A5 8B4604                   mov ax, [bp+4]
  5085 000020A8 83F802                   cmp ax, 2
  5086 000020AB 0F852100                 jne .dovar1250
  5087 000020AF E866E4                   call prnl
  5088 000020B2 FF7606                   push word [bp+6]
  5089 000020B5 E86EE4                   call prs
  5090 000020B8 83C402                   add  sp, 2
  5091 000020BB 68[C821]                 push dovar1_3
  5092 000020BE E865E4                   call prs
  5093 000020C1 83C402                   add  sp, 2
  5094 000020C4 FF760A                   push word [bp+10]
  5095 000020C7 E87EE2                   call a
  5096 000020CA 83C402                   add  sp, 2
  5097 000020CD E9CA00                   jmp .retndovar1
  5098                                  
  5099                                  ;-627   if (ixarr) {
  5100                                  
  5101                                  .dovar1250:
  5102 000020D0 8B4608                   mov ax, [bp+8]
  5103 000020D3 08C0                     or  al, al
  5104 000020D5 0F847300                 je .dovar1251
  5105                                  
  5106                                  ;-628     prs("\n mov bx, "); v(ixarr);
  5107                                  
  5108 000020D9 68[CE21]                 push dovar1_4
  5109 000020DC E847E4                   call prs
  5110 000020DF 83C402                   add  sp, 2
  5111 000020E2 FF7608                   push word [bp+8]
  5112 000020E5 E86FE2                   call v
  5113 000020E8 83C402                   add  sp, 2
  5114                                  
  5115                                  ;-629     if (wi==2) prs("\n shl bx, 1");
  5116                                  
  5117 000020EB A1[3700]                 mov ax, [wi]
  5118 000020EE 83F802                   cmp ax, 2
  5119 000020F1 0F850900                 jne .dovar1252
  5120 000020F5 68[DA21]                 push dovar1_5
  5121 000020F8 E82BE4                   call prs
  5122 000020FB 83C402                   add  sp, 2
  5123                                  
  5124                                  ;-630     prs("\n "); prs(op);
  5125                                  
  5126                                  .dovar1252:
  5127 000020FE 68[E721]                 push dovar1_6
  5128 00002101 E822E4                   call prs
  5129 00002104 83C402                   add  sp, 2
  5130 00002107 FF7606                   push word [bp+6]
  5131 0000210A E819E4                   call prs
  5132 0000210D 83C402                   add  sp, 2
  5133                                  
  5134                                  ;-631     if (wi==2) prs(" ax, "); else prs(" al, ");
  5135                                  
  5136 00002110 A1[3700]                 mov ax, [wi]
  5137 00002113 83F802                   cmp ax, 2
  5138 00002116 0F850C00                 jne .dovar1253
  5139 0000211A 68[EB21]                 push dovar1_7
  5140 0000211D E806E4                   call prs
  5141 00002120 83C402                   add  sp, 2
  5142 00002123 E90900                   jmp .dovar1254
  5143                                  .dovar1253:
  5144 00002126 68[F121]                 push dovar1_8
  5145 00002129 E8FAE3                   call prs
  5146 0000212C 83C402                   add  sp, 2
  5147                                  
  5148                                  ;-632 // v(id1); prs(" [bx]");
  5149                                  
  5150                                  
  5151                                  ;-633     prc('['); printName(id1); prs(" + bx]");
  5152                                  
  5153                                  .dovar1254:
  5154 0000212F 6A5B                     push 91
  5155 00002131 E88BE3                   call prc
  5156 00002134 83C402                   add  sp, 2
  5157 00002137 FF760A                   push word [bp+10]
  5158 0000213A E8E2EA                   call printName
  5159 0000213D 83C402                   add  sp, 2
  5160 00002140 68[F721]                 push dovar1_9
  5161 00002143 E8E0E3                   call prs
  5162 00002146 83C402                   add  sp, 2
  5163                                  
  5164                                  ;-634     return; }
  5165                                  
  5166 00002149 E94E00                   jmp .retndovar1
  5167                                  
  5168                                  ;-635   prnl();prs(op);
  5169                                  
  5170                                  .dovar1251:
  5171 0000214C E8C9E3                   call prnl
  5172 0000214F FF7606                   push word [bp+6]
  5173 00002152 E8D1E3                   call prs
  5174 00002155 83C402                   add  sp, 2
  5175                                  
  5176                                  ;-636   if(wi==1) prs(" al, ");
  5177                                  
  5178 00002158 A1[3700]                 mov ax, [wi]
  5179 0000215B 83F801                   cmp ax, 1
  5180 0000215E 0F850900                 jne .dovar1255
  5181 00002162 68[FE21]                 push dovar1_10
  5182 00002165 E8BEE3                   call prs
  5183 00002168 83C402                   add  sp, 2
  5184                                  
  5185                                  ;-637   if(wi==2) prs(" ax, ");
  5186                                  
  5187                                  .dovar1255:
  5188 0000216B A1[3700]                 mov ax, [wi]
  5189 0000216E 83F802                   cmp ax, 2
  5190 00002171 0F850900                 jne .dovar1256
  5191 00002175 68[0422]                 push dovar1_11
  5192 00002178 E8ABE3                   call prs
  5193 0000217B 83C402                   add  sp, 2
  5194                                  
  5195                                  ;-638   if(wi==4) prs(" eax, ");
  5196                                  
  5197                                  .dovar1256:
  5198 0000217E A1[3700]                 mov ax, [wi]
  5199 00002181 83F804                   cmp ax, 4
  5200 00002184 0F850900                 jne .dovar1257
  5201 00002188 68[0A22]                 push dovar1_12
  5202 0000218B E898E3                   call prs
  5203 0000218E 83C402                   add  sp, 2
  5204                                  
  5205                                  ;-639   v(id1);
  5206                                  
  5207                                  .dovar1257:
  5208 00002191 FF760A                   push word [bp+10]
  5209 00002194 E8C0E1                   call v
  5210 00002197 83C402                   add  sp, 2
  5211                                  
  5212                                  ;-640 }
  5213                                  
  5214                                  
  5215                                  ;-641 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5216                                  
  5217 0000219A C9                       .retndovar1: LEAVE
  5218 0000219B C3                       ret
  5219 0000219C 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5220 000021A5 2C2000             
  5221 000021A8 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5222 000021B1 5C6E206D6F76206168-
  5223 000021BA 2C203000           
  5224 000021BE 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5225 000021C7 00                 
  5226 000021C8 2061782C2000            dovar1_3 db " ax, ",0
  5227 000021CE 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5228 000021D7 2C2000             
  5229 000021DA 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5230 000021E3 2C203100           
  5231 000021E7 5C6E2000                dovar1_6 db "\n ",0
  5232 000021EB 2061782C2000            dovar1_7 db " ax, ",0
  5233 000021F1 20616C2C2000            dovar1_8 db " al, ",0
  5234 000021F7 202B2062785D00          dovar1_9 db " + bx]",0
  5235 000021FE 20616C2C2000            dovar1_10 db " al, ",0
  5236 00002204 2061782C2000            dovar1_11 db " ax, ",0
  5237 0000220A 206561782C2000          dovar1_12 db " eax, ",0
  5238                                  ENDP
  5239                                  
  5240                                  rterm: PROC
  5241                                  
  5242                                  ;-642   if (istoken(T_CONST)) { prnl(); prs(op);
  5243                                  ;
  5244 00002211 C8080000                 ENTER  8,0
  5245 00002215 680101                   push 257
  5246 00002218 E8D9E1                   call istoken
  5247 0000221B 83C402                   add  sp, 2
  5248 0000221E 08C0                     or  al, al
  5249 00002220 0F845200                 je .rterm258
  5250 00002224 E8F1E2                   call prnl
  5251 00002227 FF7604                   push word [bp+4]
  5252 0000222A E8F9E2                   call prs
  5253 0000222D 83C402                   add  sp, 2
  5254                                  
  5255                                  ;-643     if (wi==1) prs(" al, ");
  5256                                  
  5257 00002230 A1[3700]                 mov ax, [wi]
  5258 00002233 83F801                   cmp ax, 1
  5259 00002236 0F850900                 jne .rterm259
  5260 0000223A 68[FA22]                 push rterm_0
  5261 0000223D E8E6E2                   call prs
  5262 00002240 83C402                   add  sp, 2
  5263                                  
  5264                                  ;-644     if (wi==2) prs(" ax, ");
  5265                                  
  5266                                  .rterm259:
  5267 00002243 A1[3700]                 mov ax, [wi]
  5268 00002246 83F802                   cmp ax, 2
  5269 00002249 0F850900                 jne .rterm260
  5270 0000224D 68[0023]                 push rterm_1
  5271 00002250 E8D3E2                   call prs
  5272 00002253 83C402                   add  sp, 2
  5273                                  
  5274                                  ;-645     if (wi==4) prs(" eax, ");
  5275                                  
  5276                                  .rterm260:
  5277 00002256 A1[3700]                 mov ax, [wi]
  5278 00002259 83F804                   cmp ax, 4
  5279 0000225C 0F850900                 jne .rterm261
  5280 00002260 68[0623]                 push rterm_2
  5281 00002263 E8C0E2                   call prs
  5282 00002266 83C402                   add  sp, 2
  5283                                  
  5284                                  ;-646     prunsign1(lexval); return;}
  5285                                  
  5286                                  .rterm261:
  5287 00002269 FF36[2C00]               push word [lexval]
  5288 0000226D E80BE4                   call prunsign1
  5289 00002270 83C402                   add  sp, 2
  5290 00002273 E98200                   jmp .retnrterm
  5291                                  
  5292                                  ;-647   mode=typeName(); id1=searchname(); ixarr=0;
  5293                                  
  5294                                  .rterm258:
  5295 00002276 E8D9EA                   call typeName
  5296 00002279 8946FE                   mov [bp-2], ax
  5297 0000227C E804EA                   call searchname
  5298 0000227F 8946F8                   mov [bp-8], ax
  5299 00002282 B80000                   mov ax, 0
  5300 00002285 8946FA                   mov [bp-6], ax
  5301                                  
  5302                                  ;-648   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5303                                  
  5304 00002288 6A5B                     push 91
  5305 0000228A E867E1                   call istoken
  5306 0000228D 83C402                   add  sp, 2
  5307 00002290 08C0                     or  al, al
  5308 00002292 0F843300                 je .rterm262
  5309 00002296 E8EAE9                   call searchname
  5310 00002299 8946FA                   mov [bp-6], ax
  5311 0000229C 680001                   push 256
  5312 0000229F E874E1                   call expect
  5313 000022A2 83C402                   add  sp, 2
  5314 000022A5 6A5D                     push 93
  5315 000022A7 E86CE1                   call expect
  5316 000022AA 83C402                   add  sp, 2
  5317                                  
  5318                                  ;-649     gettypes(ixarr);
  5319                                  
  5320 000022AD FF76FA                   push word [bp-6]
  5321 000022B0 E892E8                   call gettypes
  5322 000022B3 83C402                   add  sp, 2
  5323                                  
  5324                                  ;-650     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5325                                  
  5326 000022B6 A1[3400]                 mov ax, [widthi]
  5327 000022B9 83F802                   cmp ax, 2
  5328 000022BC 0F840900                 je  .rterm263
  5329 000022C0 68[0D23]                 push rterm_3
  5330 000022C3 E8A519                   call error1
  5331 000022C6 83C402                   add  sp, 2
  5332                                  .rterm263:
  5333                                  
  5334                                  ;-651   if (eqstr(symbol,"_AX")) return;
  5335                                  
  5336                                  .rterm262:
  5337 000022C9 68[2623]                 push rterm_4
  5338 000022CC 8D06BB69                 lea  ax, [symbol]
  5339 000022D0 50                       push ax
  5340 000022D1 E88EDF                   call eqstr
  5341 000022D4 83C404                   add  sp, 4
  5342 000022D7 08C0                     or  al, al
  5343 000022D9 0F840300                 je .rterm264
  5344 000022DD E91800                   jmp .retnrterm
  5345                                  
  5346                                  ;-652   opint=op; dovar1(mode, opint, ixarr, id1);
  5347                                  
  5348                                  .rterm264:
  5349 000022E0 8B4604                   mov ax, [bp+4]
  5350 000022E3 8946FC                   mov [bp-4], ax
  5351 000022E6 FF76F8                   push word [bp-8]
  5352 000022E9 FF76FA                   push word [bp-6]
  5353 000022EC FF76FC                   push word [bp-4]
  5354 000022EF FF76FE                   push word [bp-2]
  5355 000022F2 E852FD                   call dovar1
  5356 000022F5 83C408                   add  sp, 8
  5357                                  
  5358                                  ;-653 }
  5359                                  
  5360                                  
  5361                                  ;-654 int isreg() {
  5362                                  
  5363 000022F8 C9                       .retnrterm: LEAVE
  5364 000022F9 C3                       ret
  5365 000022FA 20616C2C2000            rterm_0 db " al, ",0
  5366 00002300 2061782C2000            rterm_1 db " ax, ",0
  5367 00002306 206561782C2000          rterm_2 db " eax, ",0
  5368 0000230D 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5369 00002316 78206D75737320696E-
  5370 0000231F 74207365696E00     
  5371 00002326 5F415800                rterm_4 db "_AX",0
  5372                                  ENDP
  5373                                  
  5374                                  isreg: PROC
  5375                                  
  5376                                  ;-655   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5377                                  
  5378 0000232A 68[1725]                 push isreg_0
  5379 0000232D 8D06BB69                 lea  ax, [symbol]
  5380 00002331 50                       push ax
  5381 00002332 E82DDF                   call eqstr
  5382 00002335 83C404                   add  sp, 4
  5383 00002338 08C0                     or  al, al
  5384 0000233A 0F840C00                 je .isreg265
  5385 0000233E 68[1B25]                 push isreg_1
  5386 00002341 E84202                   call doreg
  5387 00002344 83C402                   add  sp, 2
  5388 00002347 E9C601                   jmp .r1
  5389                                  
  5390                                  ;-656   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5391                                  
  5392                                  .isreg265:
  5393 0000234A 68[1E25]                 push isreg_2
  5394 0000234D 8D06BB69                 lea  ax, [symbol]
  5395 00002351 50                       push ax
  5396 00002352 E80DDF                   call eqstr
  5397 00002355 83C404                   add  sp, 4
  5398 00002358 08C0                     or  al, al
  5399 0000235A 0F840C00                 je .isreg266
  5400 0000235E 68[2225]                 push isreg_3
  5401 00002361 E82202                   call doreg
  5402 00002364 83C402                   add  sp, 2
  5403 00002367 E9A601                   jmp .r1
  5404                                  
  5405                                  ;-657   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5406                                  
  5407                                  .isreg266:
  5408 0000236A 68[2525]                 push isreg_4
  5409 0000236D 8D06BB69                 lea  ax, [symbol]
  5410 00002371 50                       push ax
  5411 00002372 E8EDDE                   call eqstr
  5412 00002375 83C404                   add  sp, 4
  5413 00002378 08C0                     or  al, al
  5414 0000237A 0F840C00                 je .isreg267
  5415 0000237E 68[2925]                 push isreg_5
  5416 00002381 E80202                   call doreg
  5417 00002384 83C402                   add  sp, 2
  5418 00002387 E98601                   jmp .r1
  5419                                  
  5420                                  ;-658   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5421                                  
  5422                                  .isreg267:
  5423 0000238A 68[2C25]                 push isreg_6
  5424 0000238D 8D06BB69                 lea  ax, [symbol]
  5425 00002391 50                       push ax
  5426 00002392 E8CDDE                   call eqstr
  5427 00002395 83C404                   add  sp, 4
  5428 00002398 08C0                     or  al, al
  5429 0000239A 0F840C00                 je .isreg268
  5430 0000239E 68[3025]                 push isreg_7
  5431 000023A1 E8E201                   call doreg
  5432 000023A4 83C402                   add  sp, 2
  5433 000023A7 E96601                   jmp .r1
  5434                                  
  5435                                  ;-659   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5436                                  
  5437                                  .isreg268:
  5438 000023AA 68[3325]                 push isreg_8
  5439 000023AD 8D06BB69                 lea  ax, [symbol]
  5440 000023B1 50                       push ax
  5441 000023B2 E8ADDE                   call eqstr
  5442 000023B5 83C404                   add  sp, 4
  5443 000023B8 08C0                     or  al, al
  5444 000023BA 0F840C00                 je .isreg269
  5445 000023BE 68[3725]                 push isreg_9
  5446 000023C1 E8C201                   call doreg
  5447 000023C4 83C402                   add  sp, 2
  5448 000023C7 E94601                   jmp .r1
  5449                                  
  5450                                  ;-660   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5451                                  
  5452                                  .isreg269:
  5453 000023CA 68[3A25]                 push isreg_10
  5454 000023CD 8D06BB69                 lea  ax, [symbol]
  5455 000023D1 50                       push ax
  5456 000023D2 E88DDE                   call eqstr
  5457 000023D5 83C404                   add  sp, 4
  5458 000023D8 08C0                     or  al, al
  5459 000023DA 0F840C00                 je .isreg270
  5460 000023DE 68[3E25]                 push isreg_11
  5461 000023E1 E8A201                   call doreg
  5462 000023E4 83C402                   add  sp, 2
  5463 000023E7 E92601                   jmp .r1
  5464                                  
  5465                                  ;-661   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5466                                  
  5467                                  .isreg270:
  5468 000023EA 68[4125]                 push isreg_12
  5469 000023ED 8D06BB69                 lea  ax, [symbol]
  5470 000023F1 50                       push ax
  5471 000023F2 E86DDE                   call eqstr
  5472 000023F5 83C404                   add  sp, 4
  5473 000023F8 08C0                     or  al, al
  5474 000023FA 0F840C00                 je .isreg271
  5475 000023FE 68[4525]                 push isreg_13
  5476 00002401 E88201                   call doreg
  5477 00002404 83C402                   add  sp, 2
  5478 00002407 E90601                   jmp .r1
  5479                                  
  5480                                  ;-662   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5481                                  
  5482                                  .isreg271:
  5483 0000240A 68[4825]                 push isreg_14
  5484 0000240D 8D06BB69                 lea  ax, [symbol]
  5485 00002411 50                       push ax
  5486 00002412 E84DDE                   call eqstr
  5487 00002415 83C404                   add  sp, 4
  5488 00002418 08C0                     or  al, al
  5489 0000241A 0F840C00                 je .isreg272
  5490 0000241E 68[4C25]                 push isreg_15
  5491 00002421 E86201                   call doreg
  5492 00002424 83C402                   add  sp, 2
  5493 00002427 E9E600                   jmp .r1
  5494                                  
  5495                                  ;-663   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5496                                  
  5497                                  .isreg272:
  5498 0000242A 68[4F25]                 push isreg_16
  5499 0000242D 8D06BB69                 lea  ax, [symbol]
  5500 00002431 50                       push ax
  5501 00002432 E82DDE                   call eqstr
  5502 00002435 83C404                   add  sp, 4
  5503 00002438 08C0                     or  al, al
  5504 0000243A 0F840C00                 je .isreg273
  5505 0000243E 68[5325]                 push isreg_17
  5506 00002441 E84201                   call doreg
  5507 00002444 83C402                   add  sp, 2
  5508 00002447 E9C600                   jmp .r1
  5509                                  
  5510                                  ;-664   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5511                                  
  5512                                  .isreg273:
  5513 0000244A 68[5625]                 push isreg_18
  5514 0000244D 8D06BB69                 lea  ax, [symbol]
  5515 00002451 50                       push ax
  5516 00002452 E80DDE                   call eqstr
  5517 00002455 83C404                   add  sp, 4
  5518 00002458 08C0                     or  al, al
  5519 0000245A 0F840C00                 je .isreg274
  5520 0000245E 68[5A25]                 push isreg_19
  5521 00002461 E82201                   call doreg
  5522 00002464 83C402                   add  sp, 2
  5523 00002467 E9A600                   jmp .r1
  5524                                  
  5525                                  ;-665   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5526                                  
  5527                                  .isreg274:
  5528 0000246A 68[5D25]                 push isreg_20
  5529 0000246D 8D06BB69                 lea  ax, [symbol]
  5530 00002471 50                       push ax
  5531 00002472 E8EDDD                   call eqstr
  5532 00002475 83C404                   add  sp, 4
  5533 00002478 08C0                     or  al, al
  5534 0000247A 0F840C00                 je .isreg275
  5535 0000247E 68[6125]                 push isreg_21
  5536 00002481 E80201                   call doreg
  5537 00002484 83C402                   add  sp, 2
  5538 00002487 E98600                   jmp .r1
  5539                                  
  5540                                  ;-666   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5541                                  
  5542                                  .isreg275:
  5543 0000248A 68[6425]                 push isreg_22
  5544 0000248D 8D06BB69                 lea  ax, [symbol]
  5545 00002491 50                       push ax
  5546 00002492 E8CDDD                   call eqstr
  5547 00002495 83C404                   add  sp, 4
  5548 00002498 08C0                     or  al, al
  5549 0000249A 0F840C00                 je .isreg276
  5550 0000249E 68[6825]                 push isreg_23
  5551 000024A1 E8E200                   call doreg
  5552 000024A4 83C402                   add  sp, 2
  5553 000024A7 E96600                   jmp .r1
  5554                                  
  5555                                  ;-667   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5556                                  
  5557                                  .isreg276:
  5558 000024AA 68[6B25]                 push isreg_24
  5559 000024AD 8D06BB69                 lea  ax, [symbol]
  5560 000024B1 50                       push ax
  5561 000024B2 E8ADDD                   call eqstr
  5562 000024B5 83C404                   add  sp, 4
  5563 000024B8 08C0                     or  al, al
  5564 000024BA 0F840C00                 je .isreg277
  5565 000024BE 68[6F25]                 push isreg_25
  5566 000024C1 E8C200                   call doreg
  5567 000024C4 83C402                   add  sp, 2
  5568 000024C7 E94600                   jmp .r1
  5569                                  
  5570                                  ;-668   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5571                                  
  5572                                  .isreg277:
  5573 000024CA 68[7225]                 push isreg_26
  5574 000024CD 8D06BB69                 lea  ax, [symbol]
  5575 000024D1 50                       push ax
  5576 000024D2 E88DDD                   call eqstr
  5577 000024D5 83C404                   add  sp, 4
  5578 000024D8 08C0                     or  al, al
  5579 000024DA 0F840C00                 je .isreg278
  5580 000024DE 68[7625]                 push isreg_27
  5581 000024E1 E8A200                   call doreg
  5582 000024E4 83C402                   add  sp, 2
  5583 000024E7 E92600                   jmp .r1
  5584                                  
  5585                                  ;-669   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5586                                  
  5587                                  .isreg278:
  5588 000024EA 68[7925]                 push isreg_28
  5589 000024ED 8D06BB69                 lea  ax, [symbol]
  5590 000024F1 50                       push ax
  5591 000024F2 E86DDD                   call eqstr
  5592 000024F5 83C404                   add  sp, 4
  5593 000024F8 08C0                     or  al, al
  5594 000024FA 0F840C00                 je .isreg279
  5595 000024FE 68[8025]                 push isreg_29
  5596 00002501 E88200                   call doreg
  5597 00002504 83C402                   add  sp, 2
  5598 00002507 E90600                   jmp .r1
  5599                                  
  5600                                  ;-670   return 0;   r1: return 1;
  5601                                  
  5602                                  .isreg279:
  5603 0000250A B80000                   mov ax, 0
  5604 0000250D E90600                   jmp .retnisreg
  5605                                  .r1:
  5606 00002510 B80100                   mov ax, 1
  5607 00002513 E90000                   jmp .retnisreg
  5608                                  
  5609                                  ;-671 }
  5610                                  
  5611                                  
  5612                                  ;-672 int doreg(char *dr) { int i; expect('=');
  5613                                  
  5614                                   .retnisreg:
  5615 00002516 C3                       ret
  5616 00002517 5F414800                isreg_0 db "_AH",0
  5617 0000251B 616800                  isreg_1 db "ah",0
  5618 0000251E 5F414C00                isreg_2 db "_AL",0
  5619 00002522 616C00                  isreg_3 db "al",0
  5620 00002525 5F415800                isreg_4 db "_AX",0
  5621 00002529 617800                  isreg_5 db "ax",0
  5622 0000252C 5F424800                isreg_6 db "_BH",0
  5623 00002530 626800                  isreg_7 db "bh",0
  5624 00002533 5F424C00                isreg_8 db "_BL",0
  5625 00002537 626C00                  isreg_9 db "bl",0
  5626 0000253A 5F425800                isreg_10 db "_BX",0
  5627 0000253E 627800                  isreg_11 db "bx",0
  5628 00002541 5F434800                isreg_12 db "_CH",0
  5629 00002545 636800                  isreg_13 db "ch",0
  5630 00002548 5F434C00                isreg_14 db "_CL",0
  5631 0000254C 636C00                  isreg_15 db "cl",0
  5632 0000254F 5F435800                isreg_16 db "_CX",0
  5633 00002553 637800                  isreg_17 db "cx",0
  5634 00002556 5F444800                isreg_18 db "_DH",0
  5635 0000255A 646800                  isreg_19 db "dh",0
  5636 0000255D 5F444C00                isreg_20 db "_DL",0
  5637 00002561 646C00                  isreg_21 db "dl",0
  5638 00002564 5F445800                isreg_22 db "_DX",0
  5639 00002568 647800                  isreg_23 db "dx",0
  5640 0000256B 5F534900                isreg_24 db "_SI",0
  5641 0000256F 736900                  isreg_25 db "si",0
  5642 00002572 5F444900                isreg_26 db "_DI",0
  5643 00002576 646900                  isreg_27 db "di",0
  5644 00002579 5F464C41475300          isreg_28 db "_FLAGS",0
  5645 00002580 666C61677300            isreg_29 db "flags",0
  5646                                  ENDP
  5647                                  
  5648                                  doreg: PROC;
  5649 00002586 C8020000                 ENTER  2,0
  5650 0000258A 6A3D                     push 61
  5651 0000258C E887DE                   call expect
  5652 0000258F 83C402                   add  sp, 2
  5653                                  
  5654                                  ;-673   prs("\n mov  "); prs(dr); prs(", ");
  5655                                  
  5656 00002592 68[F525]                 push doreg_0
  5657 00002595 E88EDF                   call prs
  5658 00002598 83C402                   add  sp, 2
  5659 0000259B FF7604                   push word [bp+4]
  5660 0000259E E885DF                   call prs
  5661 000025A1 83C402                   add  sp, 2
  5662 000025A4 68[FE25]                 push doreg_1
  5663 000025A7 E87CDF                   call prs
  5664 000025AA 83C402                   add  sp, 2
  5665                                  
  5666                                  ;-674        if (istoken(T_CONST)) prunsign1(lexval);
  5667                                  
  5668 000025AD 680101                   push 257
  5669 000025B0 E841DE                   call istoken
  5670 000025B3 83C402                   add  sp, 2
  5671 000025B6 08C0                     or  al, al
  5672 000025B8 0F840D00                 je .doreg280
  5673 000025BC FF36[2C00]               push word [lexval]
  5674 000025C0 E8B8E0                   call prunsign1
  5675 000025C3 83C402                   add  sp, 2
  5676                                  
  5677                                  ;-675   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5678                                  
  5679 000025C6 E92A00                   jmp .doreg281
  5680                                  .doreg280:
  5681 000025C9 680001                   push 256
  5682 000025CC E825DE                   call istoken
  5683 000025CF 83C402                   add  sp, 2
  5684 000025D2 08C0                     or  al, al
  5685 000025D4 0F841200                 je .doreg282
  5686 000025D8 E8A8E6                   call searchname
  5687 000025DB 8946FE                   mov [bp-2], ax
  5688 000025DE FF76FE                   push word [bp-2]
  5689 000025E1 E873DD                   call v
  5690 000025E4 83C402                   add  sp, 2
  5691                                  
  5692                                  ;-676   else error1("only number or var allowed"); }
  5693                                  
  5694 000025E7 E90900                   jmp .doreg283
  5695                                  .doreg282:
  5696 000025EA 68[0126]                 push doreg_2
  5697 000025ED E87B16                   call error1
  5698 000025F0 83C402                   add  sp, 2
  5699                                  .doreg283:
  5700                                  .doreg281:
  5701                                  
  5702                                  ;-677 
  5703                                  
  5704                                  
  5705                                  ;-678 int doassign(int mode, int i, int ixarr, int ixconst) {
  5706 000025F3 C9                       LEAVE
  5707 000025F4 C3                       ret
  5708 000025F5 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5709 000025FE 2C2000                  doreg_1 db ", ",0
  5710 00002601 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5711 0000260A 6572206F7220766172-
  5712 00002613 20616C6C6F77656400 
  5713                                  ENDP
  5714                                  
  5715                                  doassign: PROC
  5716                                  
  5717                                  ;-679   gettypes(i);
  5718                                  ;
  5719 0000261C C8000000                 ENTER  0,0
  5720 00002620 FF7606                   push word [bp+6]
  5721 00002623 E81FE5                   call gettypes
  5722 00002626 83C402                   add  sp, 2
  5723                                  
  5724                                  ;-680   if (mode==1) {prs("\n mov  bx, ");v(i);
  5725                                  
  5726 00002629 8B4604                   mov ax, [bp+4]
  5727 0000262C 83F801                   cmp ax, 1
  5728 0000262F 0F853400                 jne .doassign284
  5729 00002633 68[B927]                 push doassign_0
  5730 00002636 E8EDDE                   call prs
  5731 00002639 83C402                   add  sp, 2
  5732 0000263C FF7606                   push word [bp+6]
  5733 0000263F E815DD                   call v
  5734 00002642 83C402                   add  sp, 2
  5735                                  
  5736                                  ;-681     if (widthi == 2) prs("\n mov  [bx], ax");
  5737                                  
  5738 00002645 A1[3400]                 mov ax, [widthi]
  5739 00002648 83F802                   cmp ax, 2
  5740 0000264B 0F850C00                 jne .doassign285
  5741 0000264F 68[C627]                 push doassign_1
  5742 00002652 E8D1DE                   call prs
  5743 00002655 83C402                   add  sp, 2
  5744                                  
  5745                                  ;-682     else  prs("\n mov  [bx], al"); return;}
  5746                                  
  5747 00002658 E90900                   jmp .doassign286
  5748                                  .doassign285:
  5749 0000265B 68[D727]                 push doassign_2
  5750 0000265E E8C5DE                   call prs
  5751 00002661 83C402                   add  sp, 2
  5752                                  .doassign286:
  5753 00002664 E95001                   jmp .retndoassign
  5754                                  
  5755                                  ;-683   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5756                                  
  5757                                  .doassign284:
  5758 00002667 8B4604                   mov ax, [bp+4]
  5759 0000266A 83F802                   cmp ax, 2
  5760 0000266D 0F851E00                 jne .doassign287
  5761 00002671 68[E827]                 push doassign_3
  5762 00002674 E8AFDE                   call prs
  5763 00002677 83C402                   add  sp, 2
  5764 0000267A FF7606                   push word [bp+6]
  5765 0000267D E8C8DC                   call a
  5766 00002680 83C402                   add  sp, 2
  5767 00002683 68[F127]                 push doassign_4
  5768 00002686 E89DDE                   call prs
  5769 00002689 83C402                   add  sp, 2
  5770 0000268C E92801                   jmp .retndoassign
  5771                                  
  5772                                  ;-684   if (ixarr) {  prs("\n mov bx, ");
  5773                                  
  5774                                  .doassign287:
  5775 0000268F 8B4608                   mov ax, [bp+8]
  5776 00002692 08C0                     or  al, al
  5777 00002694 0F846E00                 je .doassign288
  5778 00002698 68[F627]                 push doassign_5
  5779 0000269B E888DE                   call prs
  5780 0000269E 83C402                   add  sp, 2
  5781                                  
  5782                                  ;-685     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5783                                  
  5784 000026A1 8B460A                   mov ax, [bp+10]
  5785 000026A4 08C0                     or  al, al
  5786 000026A6 0F840C00                 je .doassign289
  5787 000026AA FF7608                   push word [bp+8]
  5788 000026AD E8CBDF                   call prunsign1
  5789 000026B0 83C402                   add  sp, 2
  5790 000026B3 E90900                   jmp .doassign290
  5791                                  .doassign289:
  5792 000026B6 FF7608                   push word [bp+8]
  5793 000026B9 E89BDC                   call v
  5794 000026BC 83C402                   add  sp, 2
  5795                                  
  5796                                  ;-686     if (wi==2) prs("\n shl bx, 1");
  5797                                  
  5798                                  .doassign290:
  5799 000026BF A1[3700]                 mov ax, [wi]
  5800 000026C2 83F802                   cmp ax, 2
  5801 000026C5 0F850900                 jne .doassign291
  5802 000026C9 68[0228]                 push doassign_6
  5803 000026CC E857DE                   call prs
  5804 000026CF 83C402                   add  sp, 2
  5805                                  
  5806                                  ;-687     prs("\n mov ["); printName(i);
  5807                                  
  5808                                  .doassign291:
  5809 000026D2 68[0F28]                 push doassign_7
  5810 000026D5 E84EDE                   call prs
  5811 000026D8 83C402                   add  sp, 2
  5812 000026DB FF7606                   push word [bp+6]
  5813 000026DE E83EE5                   call printName
  5814 000026E1 83C402                   add  sp, 2
  5815                                  
  5816                                  ;-688     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5817                                  
  5818 000026E4 A1[3700]                 mov ax, [wi]
  5819 000026E7 83F802                   cmp ax, 2
  5820 000026EA 0F850C00                 jne .doassign292
  5821 000026EE 68[1828]                 push doassign_8
  5822 000026F1 E832DE                   call prs
  5823 000026F4 83C402                   add  sp, 2
  5824 000026F7 E90900                   jmp .doassign293
  5825                                  .doassign292:
  5826 000026FA 68[2128]                 push doassign_9
  5827 000026FD E826DE                   call prs
  5828 00002700 83C402                   add  sp, 2
  5829                                  .doassign293:
  5830 00002703 E9B100                   jmp .retndoassign
  5831                                  
  5832                                  ;-689   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5833                                  
  5834                                  .doassign288:
  5835 00002706 A1[3700]                 mov ax, [wi]
  5836 00002709 83F801                   cmp ax, 1
  5837 0000270C 0F853100                 jne .doassign294
  5838 00002710 68[2A28]                 push doassign_10
  5839 00002713 E810DE                   call prs
  5840 00002716 83C402                   add  sp, 2
  5841 00002719 8B4606                   mov ax, [bp+6]
  5842 0000271C 3DC800                   cmp ax, 200
  5843 0000271F 0F8D0900                 jge .doassign295
  5844 00002723 68[3228]                 push doassign_11
  5845 00002726 E8FDDD                   call prs
  5846 00002729 83C402                   add  sp, 2
  5847                                  
  5848                                  ;-690     } v(i); prs(", al"); return; }
  5849                                  
  5850                                  .doassign295:
  5851 0000272C FF7606                   push word [bp+6]
  5852 0000272F E825DC                   call v
  5853 00002732 83C402                   add  sp, 2
  5854 00002735 68[3828]                 push doassign_12
  5855 00002738 E8EBDD                   call prs
  5856 0000273B 83C402                   add  sp, 2
  5857 0000273E E97600                   jmp .retndoassign
  5858                                  
  5859                                  ;-691   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5860                                  
  5861                                  .doassign294:
  5862 00002741 A1[3700]                 mov ax, [wi]
  5863 00002744 83F802                   cmp ax, 2
  5864 00002747 0F853100                 jne .doassign296
  5865 0000274B 68[3D28]                 push doassign_13
  5866 0000274E E8D5DD                   call prs
  5867 00002751 83C402                   add  sp, 2
  5868 00002754 8B4606                   mov ax, [bp+6]
  5869 00002757 3DC800                   cmp ax, 200
  5870 0000275A 0F8D0900                 jge .doassign297
  5871 0000275E 68[4528]                 push doassign_14
  5872 00002761 E8C2DD                   call prs
  5873 00002764 83C402                   add  sp, 2
  5874                                  
  5875                                  ;-692     } v(i); prs(", ax"); return; }
  5876                                  
  5877                                  .doassign297:
  5878 00002767 FF7606                   push word [bp+6]
  5879 0000276A E8EADB                   call v
  5880 0000276D 83C402                   add  sp, 2
  5881 00002770 68[4B28]                 push doassign_15
  5882 00002773 E8B0DD                   call prs
  5883 00002776 83C402                   add  sp, 2
  5884 00002779 E93B00                   jmp .retndoassign
  5885                                  
  5886                                  ;-693   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5887                                  
  5888                                  .doassign296:
  5889 0000277C A1[3700]                 mov ax, [wi]
  5890 0000277F 83F804                   cmp ax, 4
  5891 00002782 0F853100                 jne .doassign298
  5892 00002786 68[5028]                 push doassign_16
  5893 00002789 E89ADD                   call prs
  5894 0000278C 83C402                   add  sp, 2
  5895 0000278F 8B4606                   mov ax, [bp+6]
  5896 00002792 3DC800                   cmp ax, 200
  5897 00002795 0F8D0900                 jge .doassign299
  5898 00002799 68[5828]                 push doassign_17
  5899 0000279C E887DD                   call prs
  5900 0000279F 83C402                   add  sp, 2
  5901                                  
  5902                                  ;-694     } v(i); prs(", eax"); return; }
  5903                                  
  5904                                  .doassign299:
  5905 000027A2 FF7606                   push word [bp+6]
  5906 000027A5 E8AFDB                   call v
  5907 000027A8 83C402                   add  sp, 2
  5908 000027AB 68[5F28]                 push doassign_18
  5909 000027AE E875DD                   call prs
  5910 000027B1 83C402                   add  sp, 2
  5911 000027B4 E90000                   jmp .retndoassign
  5912                                  
  5913                                  ;-695 }
  5914                                  
  5915                                  .doassign298:
  5916                                  
  5917                                  ;-696 int domul(int ids) {
  5918                                  
  5919 000027B7 C9                       .retndoassign: LEAVE
  5920 000027B8 C3                       ret
  5921 000027B9 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5922 000027C2 782C2000           
  5923 000027C6 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5924 000027CF 62785D2C20617800   
  5925 000027D7 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5926 000027E0 62785D2C20616C00   
  5927 000027E8 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5928 000027F1 2C20617800              doassign_4 db ", ax",0
  5929 000027F6 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5930 000027FF 2C2000             
  5931 00002802 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5932 0000280B 2C203100           
  5933 0000280F 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5934 00002818 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5935 00002821 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5936 0000282A 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5937 00002832 627974652000            doassign_11 db "byte ",0
  5938 00002838 2C20616C00              doassign_12 db ", al",0
  5939 0000283D 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5940 00002845 776F72642000            doassign_14 db "word ",0
  5941 0000284B 2C20617800              doassign_15 db ", ax",0
  5942 00002850 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5943 00002858 64776F72642000          doassign_17 db "dword ",0
  5944 0000285F 2C2065617800            doassign_18 db ", eax",0
  5945                                  ENDP
  5946                                  
  5947                                  domul: PROC
  5948                                  
  5949                                  ;-697   if (ids) rterm("imul"); else {
  5950                                  ;
  5951 00002865 C8000000                 ENTER  0,0
  5952 00002869 8B4604                   mov ax, [bp+4]
  5953 0000286C 08C0                     or  al, al
  5954 0000286E 0F840C00                 je .domul300
  5955 00002872 68[B728]                 push domul_0
  5956 00002875 E899F9                   call rterm
  5957 00002878 83C402                   add  sp, 2
  5958 0000287B E93700                   jmp .domul301
  5959                                  .domul300:
  5960                                  
  5961                                  ;-698   if (istoken(T_CONST)) {
  5962                                  
  5963 0000287E 680101                   push 257
  5964 00002881 E870DB                   call istoken
  5965 00002884 83C402                   add  sp, 2
  5966 00002887 08C0                     or  al, al
  5967 00002889 0F841F00                 je .domul302
  5968                                  
  5969                                  ;-699     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5970                                  
  5971 0000288D 68[BC28]                 push domul_1
  5972 00002890 E893DC                   call prs
  5973 00002893 83C402                   add  sp, 2
  5974 00002896 FF36[2C00]               push word [lexval]
  5975 0000289A E8DEDD                   call prunsign1
  5976 0000289D 83C402                   add  sp, 2
  5977 000028A0 68[C828]                 push domul_2
  5978 000028A3 E880DC                   call prs
  5979 000028A6 83C402                   add  sp, 2
  5980                                  
  5981                                  ;-700     }
  5982                                  
  5983                                  
  5984                                  ;-701   else error1("with MUL only const number as multiplicator allowed"); } }
  5985                                  
  5986 000028A9 E90900                   jmp .domul303
  5987                                  .domul302:
  5988 000028AC 68[D228]                 push domul_3
  5989 000028AF E8B913                   call error1
  5990 000028B2 83C402                   add  sp, 2
  5991                                  .domul303:
  5992                                  .domul301:
  5993                                  
  5994                                  ;-702 int doidiv(int ids) { int mode; int id1;
  5995 000028B5 C9                       LEAVE
  5996 000028B6 C3                       ret
  5997 000028B7 696D756C00              domul_0 db "imul",0
  5998 000028BC 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5999 000028C5 2C2000             
  6000 000028C8 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6001 000028D1 00                 
  6002 000028D2 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6003 000028DB 6F6E6C7920636F6E73-
  6004 000028E4 74206E756D62657220-
  6005 000028ED 6173206D756C746970-
  6006 000028F6 6C696361746F722061-
  6007 000028FF 6C6C6F77656400     
  6008                                  ENDP
  6009                                  
  6010                                  doidiv: PROC
  6011                                  
  6012                                  ;-703   if (istoken(T_CONST)) {
  6013                                  ;
  6014 00002906 C8040000                 ENTER  4,0
  6015 0000290A 680101                   push 257
  6016 0000290D E8E4DA                   call istoken
  6017 00002910 83C402                   add  sp, 2
  6018 00002913 08C0                     or  al, al
  6019 00002915 0F843400                 je .doidiv304
  6020                                  
  6021                                  ;-704     prs("\n mov bx, "); prunsign1(lexval);
  6022                                  
  6023 00002919 68[CB29]                 push doidiv_0
  6024 0000291C E807DC                   call prs
  6025 0000291F 83C402                   add  sp, 2
  6026 00002922 FF36[2C00]               push word [lexval]
  6027 00002926 E852DD                   call prunsign1
  6028 00002929 83C402                   add  sp, 2
  6029                                  
  6030                                  ;-705     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6031                                  
  6032 0000292C 8B4604                   mov ax, [bp+4]
  6033 0000292F 08C0                     or  al, al
  6034 00002931 0F840C00                 je .doidiv305
  6035 00002935 68[D729]                 push doidiv_1
  6036 00002938 E8EBDB                   call prs
  6037 0000293B 83C402                   add  sp, 2
  6038 0000293E E90900                   jmp .doidiv306
  6039                                  .doidiv305:
  6040 00002941 68[E829]                 push doidiv_2
  6041 00002944 E8DFDB                   call prs
  6042 00002947 83C402                   add  sp, 2
  6043                                  .doidiv306:
  6044                                  
  6045                                  ;-706   else {
  6046                                  
  6047 0000294A E97C00                   jmp .doidiv307
  6048                                  .doidiv304:
  6049                                  
  6050                                  ;-707     mode=typeName(); id1=searchname();
  6051                                  
  6052 0000294D E802E4                   call typeName
  6053 00002950 8946FE                   mov [bp-2], ax
  6054 00002953 E82DE3                   call searchname
  6055 00002956 8946FC                   mov [bp-4], ax
  6056                                  
  6057                                  ;-708     if (mode) error1("only const number or int as divisor allowed");
  6058                                  
  6059 00002959 8B46FE                   mov ax, [bp-2]
  6060 0000295C 08C0                     or  al, al
  6061 0000295E 0F840900                 je .doidiv308
  6062 00002962 68[FE29]                 push doidiv_3
  6063 00002965 E80313                   call error1
  6064 00002968 83C402                   add  sp, 2
  6065                                  
  6066                                  ;-709     gettypes(id1);
  6067                                  
  6068                                  .doidiv308:
  6069 0000296B FF76FC                   push word [bp-4]
  6070 0000296E E8D4E1                   call gettypes
  6071 00002971 83C402                   add  sp, 2
  6072                                  
  6073                                  ;-710     if (typei) error1("only int as simple var divisor allowed");
  6074                                  
  6075 00002974 A1[2E00]                 mov ax, [typei]
  6076 00002977 08C0                     or  al, al
  6077 00002979 0F840900                 je .doidiv309
  6078 0000297D 68[2A2A]                 push doidiv_4
  6079 00002980 E8E812                   call error1
  6080 00002983 83C402                   add  sp, 2
  6081                                  
  6082                                  ;-711     if (wi!=2) error1("only int, no byte as divisor allowed");
  6083                                  
  6084                                  .doidiv309:
  6085 00002986 A1[3700]                 mov ax, [wi]
  6086 00002989 83F802                   cmp ax, 2
  6087 0000298C 0F840900                 je  .doidiv310
  6088 00002990 68[512A]                 push doidiv_5
  6089 00002993 E8D512                   call error1
  6090 00002996 83C402                   add  sp, 2
  6091                                  
  6092                                  ;-712     prs("\n mov bx, "); v(id1);
  6093                                  
  6094                                  .doidiv310:
  6095 00002999 68[762A]                 push doidiv_6
  6096 0000299C E887DB                   call prs
  6097 0000299F 83C402                   add  sp, 2
  6098 000029A2 FF76FC                   push word [bp-4]
  6099 000029A5 E8AFD9                   call v
  6100 000029A8 83C402                   add  sp, 2
  6101                                  
  6102                                  ;-713     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6103                                  
  6104 000029AB 8B4604                   mov ax, [bp+4]
  6105 000029AE 08C0                     or  al, al
  6106 000029B0 0F840C00                 je .doidiv311
  6107 000029B4 68[822A]                 push doidiv_7
  6108 000029B7 E86CDB                   call prs
  6109 000029BA 83C402                   add  sp, 2
  6110 000029BD E90900                   jmp .doidiv312
  6111                                  .doidiv311:
  6112 000029C0 68[932A]                 push doidiv_8
  6113 000029C3 E860DB                   call prs
  6114 000029C6 83C402                   add  sp, 2
  6115                                  .doidiv312:
  6116                                  
  6117                                  ;-714 }
  6118                                  
  6119                                  .doidiv307:
  6120                                  
  6121                                  ;-715 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6122 000029C9 C9                       LEAVE
  6123 000029CA C3                       ret
  6124 000029CB 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6125 000029D4 2C2000             
  6126 000029D7 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6127 000029E0 6964697620627800   
  6128 000029E8 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6129 000029F1 2C20305C6E20646976-
  6130 000029FA 20627800           
  6131 000029FE 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6132 00002A07 74206E756D62657220-
  6133 00002A10 6F7220696E74206173-
  6134 00002A19 2064697669736F7220-
  6135 00002A22 616C6C6F77656400   
  6136 00002A2A 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6137 00002A33 61732073696D706C65-
  6138 00002A3C 207661722064697669-
  6139 00002A45 736F7220616C6C6F77-
  6140 00002A4E 656400             
  6141 00002A51 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6142 00002A5A 206E6F206279746520-
  6143 00002A63 61732064697669736F-
  6144 00002A6C 7220616C6C6F776564-
  6145 00002A75 00                 
  6146 00002A76 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6147 00002A7F 2C2000             
  6148 00002A82 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6149 00002A8B 6964697620627800   
  6150 00002A93 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6151 00002A9C 2C20305C6E20646976-
  6152 00002AA5 20627800           
  6153                                  ENDP
  6154                                  
  6155                                  domod: PROC;
  6156 00002AA9 C8000000                 ENTER  0,0
  6157 00002AAD FF7604                   push word [bp+4]
  6158 00002AB0 E853FE                   call doidiv
  6159 00002AB3 83C402                   add  sp, 2
  6160 00002AB6 68[C12A]                 push domod_0
  6161 00002AB9 E86ADA                   call prs
  6162 00002ABC 83C402                   add  sp, 2
  6163                                  
  6164                                  ;-716 
  6165                                  
  6166                                  
  6167                                  ;-717 int docalltype[10]; int docallvalue[10];
  6168 00002ABF C9                       LEAVE
  6169 00002AC0 C3                       ret
  6170 00002AC1 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6171 00002ACA 2C20647800         
  6172                                  ENDP
  6173                                  section .bss
  6174                                  absolute 55860
  6175 0000DA34 <res 00000014>          docalltype resw 10
  6176                                  section .text
  6177                                  section .bss
  6178                                  absolute 55880
  6179 0000DA48 <res 00000014>          docallvalue resw 10
  6180                                  section .text
  6181                                  
  6182                                  ;-718 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6183                                  
  6184                                  section .bss
  6185                                  absolute 55900
  6186 0000DA5C <res 00000011>          procname resb 17
  6187                                  section .text
  6188                                  
  6189                                  ;-719 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6190                                  
  6191                                  
  6192                                  docall1: PROC
  6193                                  
  6194                                  ;-720   narg=0;  sz32=0;
  6195                                  ;
  6196 00002ACF C80A0000                 ENTER  10,0
  6197 00002AD3 B80000                   mov ax, 0
  6198 00002AD6 8946FC                   mov [bp-4], ax
  6199 00002AD9 B80000                   mov ax, 0
  6200 00002ADC 8946F6                   mov [bp-10], ax
  6201                                  
  6202                                  ;-721   checknamelen();
  6203                                  
  6204 00002ADF E8A8D8                   call checknamelen
  6205                                  
  6206                                  ;-722   strcpy(&procname, symbol);
  6207                                  
  6208 00002AE2 8D06BB69                 lea  ax, [symbol]
  6209 00002AE6 50                       push ax
  6210 00002AE7 8D065CDA                 lea  ax, [procname]
  6211 00002AEB 50                       push ax
  6212 00002AEC E83DD7                   call strcpy
  6213 00002AEF 83C404                   add  sp, 4
  6214                                  
  6215                                  ;-723   storeCall1();
  6216                                  
  6217 00002AF2 E85EE3                   call storeCall1
  6218                                  
  6219                                  ;-724   expect('(');
  6220                                  
  6221 00002AF5 6A28                     push 40
  6222 00002AF7 E81CD9                   call expect
  6223 00002AFA 83C402                   add  sp, 2
  6224                                  
  6225                                  ;-725 	if (istoken(')') ==0 ) {
  6226                                  
  6227 00002AFD 6A29                     push 41
  6228 00002AFF E8F2D8                   call istoken
  6229 00002B02 83C402                   add  sp, 2
  6230 00002B05 83F800                   cmp ax, 0
  6231 00002B08 0F857802                 jne .docall1313
  6232                                  
  6233                                  ;-726 	  do { narg++;
  6234                                  
  6235                                  .docall1314:
  6236 00002B0C FF46FC                   inc  word[bp-4]
  6237                                  
  6238                                  ;-727 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6239                                  
  6240 00002B0F 8B46FC                   mov ax, [bp-4]
  6241 00002B12 83F809                   cmp ax, 9
  6242 00002B15 0F8E0900                 jle .docall1315
  6243 00002B19 68[C82D]                 push docall1_0
  6244 00002B1C E84C11                   call error1
  6245 00002B1F 83C402                   add  sp, 2
  6246                                  .docall1315:
  6247 00002B22 B80000                   mov ax, 0
  6248 00002B25 8946FA                   mov [bp-6], ax
  6249                                  
  6250                                  ;-728       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6251                                  
  6252 00002B28 680101                   push 257
  6253 00002B2B E8C6D8                   call istoken
  6254 00002B2E 83C402                   add  sp, 2
  6255 00002B31 08C0                     or  al, al
  6256 00002B33 0F840C00                 je .docall1316
  6257 00002B37 B80100                   mov ax, 1
  6258 00002B3A 8946FA                   mov [bp-6], ax
  6259 00002B3D A1[2C00]                 mov ax, [lexval]
  6260 00002B40 8946F8                   mov [bp-8], ax
  6261                                  
  6262                                  ;-729       if(istoken(T_STRING)){t0=2; n0=nconst;
  6263                                  
  6264                                  .docall1316:
  6265 00002B43 680201                   push 258
  6266 00002B46 E8ABD8                   call istoken
  6267 00002B49 83C402                   add  sp, 2
  6268 00002B4C 08C0                     or  al, al
  6269 00002B4E 0F846300                 je .docall1317
  6270 00002B52 B80200                   mov ax, 2
  6271 00002B55 8946FA                   mov [bp-6], ax
  6272 00002B58 A1[2600]                 mov ax, [nconst]
  6273 00002B5B 8946F8                   mov [bp-8], ax
  6274                                  
  6275                                  ;-730         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6276                                  
  6277 00002B5E 68[DA2D]                 push docall1_1
  6278 00002B61 E82DD9                   call eprs
  6279 00002B64 83C402                   add  sp, 2
  6280 00002B67 8D063B6A                 lea  ax, [fname]
  6281 00002B6B 50                       push ax
  6282 00002B6C E822D9                   call eprs
  6283 00002B6F 83C402                   add  sp, 2
  6284 00002B72 6A5F                     push 95
  6285 00002B74 E807D9                   call eprc
  6286 00002B77 83C402                   add  sp, 2
  6287 00002B7A FF36[2600]               push word [nconst]
  6288 00002B7E E839DA                   call eprnum
  6289 00002B81 83C402                   add  sp, 2
  6290 00002B84 68[DD2D]                 push docall1_2
  6291 00002B87 E807D9                   call eprs
  6292 00002B8A 83C402                   add  sp, 2
  6293                                  
  6294                                  ;-731         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6295                                  
  6296 00002B8D 6A22                     push 34
  6297 00002B8F E8ECD8                   call eprc
  6298 00002B92 83C402                   add  sp, 2
  6299 00002B95 8D06BB69                 lea  ax, [symbol]
  6300 00002B99 50                       push ax
  6301 00002B9A E8F4D8                   call eprs
  6302 00002B9D 83C402                   add  sp, 2
  6303 00002BA0 6A22                     push 34
  6304 00002BA2 E8D9D8                   call eprc
  6305 00002BA5 83C402                   add  sp, 2
  6306 00002BA8 68[E22D]                 push docall1_3
  6307 00002BAB E8E3D8                   call eprs
  6308 00002BAE 83C402                   add  sp, 2
  6309 00002BB1 FF06[2600]               inc  word[nconst]
  6310                                  
  6311                                  ;-732       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6312                                  
  6313                                  .docall1317:
  6314 00002BB5 6A26                     push 38
  6315 00002BB7 E83AD8                   call istoken
  6316 00002BBA 83C402                   add  sp, 2
  6317 00002BBD 08C0                     or  al, al
  6318 00002BBF 0F840F00                 je .docall1318
  6319 00002BC3 B80300                   mov ax, 3
  6320 00002BC6 8946FA                   mov [bp-6], ax
  6321 00002BC9 E85FE2                   call name1
  6322 00002BCC E8B4E0                   call searchname
  6323 00002BCF 8946F8                   mov [bp-8], ax
  6324                                  
  6325                                  ;-733       if(istoken(T_NAME))  { n0=checkreg();
  6326                                  
  6327                                  .docall1318:
  6328 00002BD2 680001                   push 256
  6329 00002BD5 E81CD8                   call istoken
  6330 00002BD8 83C402                   add  sp, 2
  6331 00002BDB 08C0                     or  al, al
  6332 00002BDD 0F844800                 je .docall1319
  6333 00002BE1 E8DEEA                   call checkreg
  6334 00002BE4 8946F8                   mov [bp-8], ax
  6335                                  
  6336                                  ;-734         if (n0) t0=5;
  6337                                  
  6338 00002BE7 8B46F8                   mov ax, [bp-8]
  6339 00002BEA 08C0                     or  al, al
  6340 00002BEC 0F840900                 je .docall1320
  6341 00002BF0 B80500                   mov ax, 5
  6342 00002BF3 8946FA                   mov [bp-6], ax
  6343                                  
  6344                                  ;-735         else {t0=4; n0=searchname();
  6345                                  
  6346 00002BF6 E93000                   jmp .docall1321
  6347                                  .docall1320:
  6348 00002BF9 B80400                   mov ax, 4
  6349 00002BFC 8946FA                   mov [bp-6], ax
  6350 00002BFF E881E0                   call searchname
  6351 00002C02 8946F8                   mov [bp-8], ax
  6352                                  
  6353                                  ;-736           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6354                                  
  6355 00002C05 B8046B                   mov ax, GType
  6356 00002C08 A3[4D00]                 mov word [p1], ax
  6357 00002C0B A1[4D00]                 mov ax, [p1]
  6358 00002C0E 0346F8                   add ax, [bp-8]
  6359 00002C11 A3[4D00]                 mov word [p1], ax
  6360 00002C14 8B1E[4D00]               mov bx, [p1]
  6361 00002C18 8A07                     mov al, [bx]
  6362 00002C1A B400                     mov ah, 0
  6363 00002C1C 83F826                   cmp ax, 38
  6364 00002C1F 0F850600                 jne .docall1322
  6365 00002C23 B80300                   mov ax, 3
  6366 00002C26 8946FA                   mov [bp-6], ax
  6367                                  .docall1322:
  6368                                  .docall1321:
  6369                                  
  6370                                  ;-737       if (t0==0) error1("parameter not recognized (no * allowed)");
  6371                                  
  6372                                  .docall1319:
  6373 00002C29 8B46FA                   mov ax, [bp-6]
  6374 00002C2C 83F800                   cmp ax, 0
  6375 00002C2F 0F850900                 jne .docall1323
  6376 00002C33 68[E52D]                 push docall1_4
  6377 00002C36 E83210                   call error1
  6378 00002C39 83C402                   add  sp, 2
  6379                                  
  6380                                  ;-738       docalltype [narg] = t0;
  6381                                  
  6382                                  .docall1323:
  6383 00002C3C 8B46FA                   mov ax, [bp-6]
  6384 00002C3F 8B5EFC                   mov bx, [bp-4]
  6385 00002C42 D1E3                     shl bx, 1
  6386 00002C44 898734DA                 mov [docalltype+bx], ax
  6387                                  
  6388                                  ;-739       docallvalue[narg] = n0;
  6389                                  
  6390 00002C48 8B46F8                   mov ax, [bp-8]
  6391 00002C4B 8B5EFC                   mov bx, [bp-4]
  6392 00002C4E D1E3                     shl bx, 1
  6393 00002C50 898748DA                 mov [docallvalue+bx], ax
  6394                                  
  6395                                  ;-740     } while (istoken(','));
  6396                                  
  6397 00002C54 6A2C                     push 44
  6398 00002C56 E89BD7                   call istoken
  6399 00002C59 83C402                   add  sp, 2
  6400 00002C5C 08C0                     or  al, al
  6401 00002C5E 0F840300                 je .docall1324
  6402 00002C62 E9A7FE                   jmp .docall1314
  6403                                  .docall1324:
  6404                                  
  6405                                  ;-741 
  6406                                  
  6407                                  
  6408                                  ;-742   	expect(')');  i=narg;
  6409                                  
  6410 00002C65 6A29                     push 41
  6411 00002C67 E8ACD7                   call expect
  6412 00002C6A 83C402                   add  sp, 2
  6413 00002C6D 8B46FC                   mov ax, [bp-4]
  6414 00002C70 8946FE                   mov [bp-2], ax
  6415                                  
  6416                                  ;-743     do {
  6417                                  
  6418                                  .docall1325:
  6419                                  
  6420                                  ;-744       t0 = docalltype [i];
  6421                                  
  6422 00002C73 8B5EFE                   mov bx, [bp-2]
  6423 00002C76 D1E3                     shl bx, 1
  6424 00002C78 8B8734DA                 mov ax, [docalltype + bx]
  6425 00002C7C 8946FA                   mov [bp-6], ax
  6426                                  
  6427                                  ;-745       n0 = docallvalue[i];
  6428                                  
  6429 00002C7F 8B5EFE                   mov bx, [bp-2]
  6430 00002C82 D1E3                     shl bx, 1
  6431 00002C84 8B8748DA                 mov ax, [docallvalue + bx]
  6432 00002C88 8946F8                   mov [bp-8], ax
  6433                                  
  6434                                  ;-746       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6435                                  
  6436 00002C8B 8B46FA                   mov ax, [bp-6]
  6437 00002C8E 83F801                   cmp ax, 1
  6438 00002C91 0F851200                 jne .docall1326
  6439 00002C95 68[0D2E]                 push docall1_5
  6440 00002C98 E88BD8                   call prs
  6441 00002C9B 83C402                   add  sp, 2
  6442 00002C9E FF76F8                   push word [bp-8]
  6443 00002CA1 E8D7D9                   call prunsign1
  6444 00002CA4 83C402                   add  sp, 2
  6445                                  
  6446                                  ;-747       if(t0==2){ prs("\n push ");
  6447                                  
  6448                                  .docall1326:
  6449 00002CA7 8B46FA                   mov ax, [bp-6]
  6450 00002CAA 83F802                   cmp ax, 2
  6451 00002CAD 0F852500                 jne .docall1327
  6452 00002CB1 68[162E]                 push docall1_6
  6453 00002CB4 E86FD8                   call prs
  6454 00002CB7 83C402                   add  sp, 2
  6455                                  
  6456                                  ;-748         prs(fname);prc(95);prunsign1(n0);}
  6457                                  
  6458 00002CBA 8D063B6A                 lea  ax, [fname]
  6459 00002CBE 50                       push ax
  6460 00002CBF E864D8                   call prs
  6461 00002CC2 83C402                   add  sp, 2
  6462 00002CC5 6A5F                     push 95
  6463 00002CC7 E8F5D7                   call prc
  6464 00002CCA 83C402                   add  sp, 2
  6465 00002CCD FF76F8                   push word [bp-8]
  6466 00002CD0 E8A8D9                   call prunsign1
  6467 00002CD3 83C402                   add  sp, 2
  6468                                  
  6469                                  ;-749       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6470                                  
  6471                                  .docall1327:
  6472 00002CD6 8B46FA                   mov ax, [bp-6]
  6473 00002CD9 83F803                   cmp ax, 3
  6474 00002CDC 0F851B00                 jne .docall1328
  6475 00002CE0 68[1F2E]                 push docall1_7
  6476 00002CE3 E840D8                   call prs
  6477 00002CE6 83C402                   add  sp, 2
  6478 00002CE9 FF76F8                   push word [bp-8]
  6479 00002CEC E868D6                   call v
  6480 00002CEF 83C402                   add  sp, 2
  6481                                  
  6482                                  ;-750         prs("\n push ax");}
  6483                                  
  6484 00002CF2 68[2C2E]                 push docall1_8
  6485 00002CF5 E82ED8                   call prs
  6486 00002CF8 83C402                   add  sp, 2
  6487                                  
  6488                                  ;-751       if(t0==4){ gettypes(n0);
  6489                                  
  6490                                  .docall1328:
  6491 00002CFB 8B46FA                   mov ax, [bp-6]
  6492 00002CFE 83F804                   cmp ax, 4
  6493 00002D01 0F854300                 jne .docall1329
  6494 00002D05 FF76F8                   push word [bp-8]
  6495 00002D08 E83ADE                   call gettypes
  6496 00002D0B 83C402                   add  sp, 2
  6497                                  
  6498                                  ;-752         if(wi==2) { prs("\n push word "); v(n0);}
  6499                                  
  6500 00002D0E A1[3700]                 mov ax, [wi]
  6501 00002D11 83F802                   cmp ax, 2
  6502 00002D14 0F851500                 jne .docall1330
  6503 00002D18 68[372E]                 push docall1_9
  6504 00002D1B E808D8                   call prs
  6505 00002D1E 83C402                   add  sp, 2
  6506 00002D21 FF76F8                   push word [bp-8]
  6507 00002D24 E830D6                   call v
  6508 00002D27 83C402                   add  sp, 2
  6509                                  
  6510                                  ;-753         else { prs("\n mov al, byte ");   v(n0);
  6511                                  
  6512 00002D2A E91B00                   jmp .docall1331
  6513                                  .docall1330:
  6514 00002D2D 68[452E]                 push docall1_10
  6515 00002D30 E8F3D7                   call prs
  6516 00002D33 83C402                   add  sp, 2
  6517 00002D36 FF76F8                   push word [bp-8]
  6518 00002D39 E81BD6                   call v
  6519 00002D3C 83C402                   add  sp, 2
  6520                                  
  6521                                  ;-754         prs("\n mov ah, 0\n push ax"); } }
  6522                                  
  6523 00002D3F 68[562E]                 push docall1_11
  6524 00002D42 E8E1D7                   call prs
  6525 00002D45 83C402                   add  sp, 2
  6526                                  .docall1331:
  6527                                  
  6528                                  ;-755       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6529                                  
  6530                                  .docall1329:
  6531 00002D48 8B46FA                   mov ax, [bp-6]
  6532 00002D4B 83F805                   cmp ax, 5
  6533 00002D4E 0F852200                 jne .docall1332
  6534 00002D52 68[6D2E]                 push docall1_12
  6535 00002D55 E8CED7                   call prs
  6536 00002D58 83C402                   add  sp, 2
  6537 00002D5B FF76F8                   push word [bp-8]
  6538 00002D5E E86FED                   call printreg
  6539 00002D61 83C402                   add  sp, 2
  6540 00002D64 8B46F8                   mov ax, [bp-8]
  6541 00002D67 83F82F                   cmp ax, 47 ;unsigned : 1
  6542 00002D6A 0F8C0600                 jl  .docall1333
  6543 00002D6E 8B46F6                   mov ax, [bp-10]
  6544 00002D71 83C002                   add ax, 2
  6545                                  .docall1333:
  6546                                  
  6547                                  ;-756    i--; } while (i > 0);  }
  6548                                  
  6549                                  .docall1332:
  6550 00002D74 FF4EFE                   dec  word[bp-2]
  6551 00002D77 8B46FE                   mov ax, [bp-2]
  6552 00002D7A 83F800                   cmp ax, 0
  6553 00002D7D 0F8E0300                 jle .docall1334
  6554 00002D81 E9EFFE                   jmp .docall1325
  6555                                  .docall1334:
  6556                                  
  6557                                  ;-757 	 prs("\n call "); prs(&procname);
  6558                                  
  6559                                  .docall1313:
  6560 00002D84 68[762E]                 push docall1_13
  6561 00002D87 E89CD7                   call prs
  6562 00002D8A 83C402                   add  sp, 2
  6563 00002D8D 8D065CDA                 lea  ax, [procname]
  6564 00002D91 50                       push ax
  6565 00002D92 E891D7                   call prs
  6566 00002D95 83C402                   add  sp, 2
  6567                                  
  6568                                  ;-758 	 if (narg>0) {prs("\n add  sp, ");
  6569                                  
  6570 00002D98 8B46FC                   mov ax, [bp-4]
  6571 00002D9B 83F800                   cmp ax, 0
  6572 00002D9E 0F8E2400                 jle .docall1335
  6573 00002DA2 68[7F2E]                 push docall1_14
  6574 00002DA5 E87ED7                   call prs
  6575 00002DA8 83C402                   add  sp, 2
  6576                                  
  6577                                  ;-759      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6578                                  
  6579 00002DAB 8B46FC                   mov ax, [bp-4]
  6580 00002DAE 0346FC                   add ax, [bp-4]
  6581 00002DB1 8946FC                   mov [bp-4], ax
  6582 00002DB4 8B46FC                   mov ax, [bp-4]
  6583 00002DB7 0346F6                   add ax, [bp-10]
  6584 00002DBA 8946FC                   mov [bp-4], ax
  6585 00002DBD FF76FC                   push word [bp-4]
  6586 00002DC0 E8B8D8                   call prunsign1
  6587 00002DC3 83C402                   add  sp, 2
  6588                                  .docall1335:
  6589                                  
  6590                                  ;-760 /***************************************************************/
  6591                                  
  6592                                  
  6593                                  ;-761 
  6594                                  
  6595                                  
  6596                                  ;-762 int doemit() {prs("\n db ");
  6597 00002DC6 C9                       LEAVE
  6598 00002DC7 C3                       ret
  6599 00002DC8 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6600 00002DD1 72616D657465727300 
  6601 00002DDA 5C6E00                  docall1_1 db "\n",0
  6602 00002DDD 2064622000              docall1_2 db " db ",0
  6603 00002DE2 2C3000                  docall1_3 db ",0",0
  6604 00002DE5 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6605 00002DEE 206E6F74207265636F-
  6606 00002DF7 676E697A656420286E-
  6607 00002E00 6F202A20616C6C6F77-
  6608 00002E09 65642900           
  6609 00002E0D 5C6E20707573682000      docall1_5 db "\n push ",0
  6610 00002E16 5C6E20707573682000      docall1_6 db "\n push ",0
  6611 00002E1F 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6612 00002E28 782C2000           
  6613 00002E2C 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6614 00002E35 7800               
  6615 00002E37 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6616 00002E40 6F72642000         
  6617 00002E45 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6618 00002E4E 2C20627974652000   
  6619 00002E56 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6620 00002E5F 2C20305C6E20707573-
  6621 00002E68 6820617800         
  6622 00002E6D 5C6E20707573682000      docall1_12 db "\n push ",0
  6623 00002E76 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6624 00002E7F 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6625 00002E88 702C2000           
  6626                                  ENDP
  6627                                  
  6628                                  doemit: PROC
  6629 00002E8C 68[C82E]                 push doemit_0
  6630 00002E8F E894D6                   call prs
  6631 00002E92 83C402                   add  sp, 2
  6632                                  
  6633                                  ;-763   L1: token=getlex(); prunsign1(lexval); token=getlex();
  6634                                  
  6635                                  .L1:
  6636 00002E95 E85C03                   call getlex
  6637 00002E98 A3[1E00]                 mov word [token], ax
  6638 00002E9B FF36[2C00]               push word [lexval]
  6639 00002E9F E8D9D7                   call prunsign1
  6640 00002EA2 83C402                   add  sp, 2
  6641 00002EA5 E84C03                   call getlex
  6642 00002EA8 A3[1E00]                 mov word [token], ax
  6643                                  
  6644                                  ;-764     if (token== ',') {prc(','); goto L1;} expect(')'); }
  6645                                  
  6646 00002EAB A1[1E00]                 mov ax, [token]
  6647 00002EAE 83F82C                   cmp ax, 44
  6648 00002EB1 0F850A00                 jne .doemit336
  6649 00002EB5 6A2C                     push 44
  6650 00002EB7 E805D6                   call prc
  6651 00002EBA 83C402                   add  sp, 2
  6652 00002EBD EBD6                     jmp .L1
  6653                                  .doemit336:
  6654 00002EBF 6A29                     push 41
  6655 00002EC1 E852D5                   call expect
  6656 00002EC4 83C402                   add  sp, 2
  6657                                  
  6658                                  ;-765 
  6659                                  
  6660                                  
  6661                                  ;-766 int cmpneg(int ids) {
  6662                                  
  6663 00002EC7 C3                       ret
  6664 00002EC8 5C6E2064622000          doemit_0 db "\n db ",0
  6665                                  ENDP
  6666                                  
  6667                                  cmpneg: PROC
  6668                                  
  6669                                  ;-767        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  6670                                  ;
  6671 00002ECF C8000000                 ENTER  0,0
  6672 00002ED3 A1[2400]                 mov ax, [iscmp]
  6673 00002ED6 3D2603                   cmp ax, 806
  6674 00002ED9 0F850C00                 jne .cmpneg337
  6675 00002EDD 68[B02F]                 push cmpneg_0
  6676 00002EE0 E843D6                   call prs
  6677 00002EE3 83C402                   add  sp, 2
  6678                                  
  6679                                  ;-768   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  6680                                  
  6681 00002EE6 E9C500                   jmp .cmpneg338
  6682                                  .cmpneg337:
  6683 00002EE9 A1[2400]                 mov ax, [iscmp]
  6684 00002EEC 3D2703                   cmp ax, 807
  6685 00002EEF 0F850C00                 jne .cmpneg339
  6686 00002EF3 68[B92F]                 push cmpneg_1
  6687 00002EF6 E82DD6                   call prs
  6688 00002EF9 83C402                   add  sp, 2
  6689                                  
  6690                                  ;-769   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  6691                                  
  6692 00002EFC E9AF00                   jmp .cmpneg340
  6693                                  .cmpneg339:
  6694 00002EFF A1[2400]                 mov ax, [iscmp]
  6695 00002F02 3D3803                   cmp ax, 824
  6696 00002F05 0F852100                 jne .cmpneg341
  6697 00002F09 8B4604                   mov ax, [bp+4]
  6698 00002F0C 08C0                     or  al, al
  6699 00002F0E 0F840C00                 je .cmpneg342
  6700 00002F12 68[C22F]                 push cmpneg_2
  6701 00002F15 E80ED6                   call prs
  6702 00002F18 83C402                   add  sp, 2
  6703                                  
  6704                                  ;-770                            else prs("\n ja  .");//ZF=0 CF=0
  6705                                  
  6706 00002F1B E90900                   jmp .cmpneg343
  6707                                  .cmpneg342:
  6708 00002F1E 68[CB2F]                 push cmpneg_3
  6709 00002F21 E802D6                   call prs
  6710 00002F24 83C402                   add  sp, 2
  6711                                  
  6712                                  ;-771   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  6713                                  
  6714                                  .cmpneg343:
  6715 00002F27 E98400                   jmp .cmpneg344
  6716                                  .cmpneg341:
  6717 00002F2A A1[2400]                 mov ax, [iscmp]
  6718 00002F2D 3D2B03                   cmp ax, 811
  6719 00002F30 0F854500                 jne .cmpneg345
  6720 00002F34 8B4604                   mov ax, [bp+4]
  6721 00002F37 08C0                     or  al, al
  6722 00002F39 0F841E00                 je .cmpneg346
  6723 00002F3D 68[D42F]                 push cmpneg_4
  6724 00002F40 E8E3D5                   call prs
  6725 00002F43 83C402                   add  sp, 2
  6726 00002F46 FF7604                   push word [bp+4]
  6727 00002F49 E82FD7                   call prunsign1
  6728 00002F4C 83C402                   add  sp, 2
  6729                                  
  6730                                  ;-772                                prs("\n jl  .");}//          SF!=OF
  6731                                  
  6732 00002F4F 68[E22F]                 push cmpneg_5
  6733 00002F52 E8D1D5                   call prs
  6734 00002F55 83C402                   add  sp, 2
  6735                                  
  6736                                  ;-773                            else{prs(" ;unsigned : "); prunsign1(ids);
  6737                                  
  6738 00002F58 E91B00                   jmp .cmpneg347
  6739                                  .cmpneg346:
  6740 00002F5B 68[EB2F]                 push cmpneg_6
  6741 00002F5E E8C5D5                   call prs
  6742 00002F61 83C402                   add  sp, 2
  6743 00002F64 FF7604                   push word [bp+4]
  6744 00002F67 E811D7                   call prunsign1
  6745 00002F6A 83C402                   add  sp, 2
  6746                                  
  6747                                  ;-774                                prs("\n jb  .");}//jb=jc=CF=1
  6748                                  
  6749 00002F6D 68[F92F]                 push cmpneg_7
  6750 00002F70 E8B3D5                   call prs
  6751 00002F73 83C402                   add  sp, 2
  6752                                  
  6753                                  ;-775   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  6754                                  
  6755                                  .cmpneg347:
  6756 00002F76 E93500                   jmp .cmpneg348
  6757                                  .cmpneg345:
  6758 00002F79 A1[2400]                 mov ax, [iscmp]
  6759 00002F7C 83F83C                   cmp ax, 60
  6760 00002F7F 0F850C00                 jne .cmpneg349
  6761 00002F83 68[0230]                 push cmpneg_8
  6762 00002F86 E89DD5                   call prs
  6763 00002F89 83C402                   add  sp, 2
  6764                                  
  6765                                  ;-776   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  6766                                  
  6767 00002F8C E91F00                   jmp .cmpneg350
  6768                                  .cmpneg349:
  6769 00002F8F A1[2400]                 mov ax, [iscmp]
  6770 00002F92 83F83E                   cmp ax, 62
  6771 00002F95 0F850C00                 jne .cmpneg351
  6772 00002F99 68[0B30]                 push cmpneg_9
  6773 00002F9C E887D5                   call prs
  6774 00002F9F 83C402                   add  sp, 2
  6775                                  
  6776                                  ;-777   else error1("internal error compare unknown in CMPNEG()");  }
  6777                                  
  6778 00002FA2 E90900                   jmp .cmpneg352
  6779                                  .cmpneg351:
  6780 00002FA5 68[1430]                 push cmpneg_10
  6781 00002FA8 E8C00C                   call error1
  6782 00002FAB 83C402                   add  sp, 2
  6783                                  .cmpneg352:
  6784                                  .cmpneg350:
  6785                                  .cmpneg348:
  6786                                  .cmpneg344:
  6787                                  .cmpneg340:
  6788                                  .cmpneg338:
  6789                                  
  6790                                  ;-778 
  6791                                  
  6792                                  
  6793                                  ;-779 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  6794 00002FAE C9                       LEAVE
  6795 00002FAF C3                       ret
  6796 00002FB0 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  6797 00002FB9 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  6798 00002FC2 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  6799 00002FCB 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  6800 00002FD4 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  6801 00002FDD 64203A2000         
  6802 00002FE2 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  6803 00002FEB 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  6804 00002FF4 64203A2000         
  6805 00002FF9 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  6806 00003002 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  6807 0000300B 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  6808 00003014 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  6809 0000301D 6572726F7220636F6D-
  6810 00003026 7061726520756E6B6E-
  6811 0000302F 6F776E20696E20434D-
  6812 00003038 504E4547282900     
  6813                                  ENDP
  6814                                  
  6815                                  prlabel: PROC;
  6816 0000303F C8000000                 ENTER  0,0
  6817 00003043 68[6A30]                 push prlabel_0
  6818 00003046 E8DDD4                   call prs
  6819 00003049 83C402                   add  sp, 2
  6820 0000304C 8D063B6A                 lea  ax, [fname]
  6821 00003050 50                       push ax
  6822 00003051 E8D2D4                   call prs
  6823 00003054 83C402                   add  sp, 2
  6824 00003057 FF7604                   push word [bp+4]
  6825 0000305A E81ED6                   call prunsign1
  6826 0000305D 83C402                   add  sp, 2
  6827 00003060 6A3A                     push 58
  6828 00003062 E85AD4                   call prc
  6829 00003065 83C402                   add  sp, 2
  6830                                  
  6831                                  ;-780 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  6832 00003068 C9                       LEAVE
  6833 00003069 C3                       ret
  6834 0000306A 5C6E2E00                prlabel_0 db "\n.",0
  6835                                  ENDP
  6836                                  
  6837                                  prjump: PROC;
  6838 0000306E C8000000                 ENTER  0,0
  6839 00003072 68[9130]                 push prjump_0
  6840 00003075 E8AED4                   call prs
  6841 00003078 83C402                   add  sp, 2
  6842 0000307B 8D063B6A                 lea  ax, [fname]
  6843 0000307F 50                       push ax
  6844 00003080 E8A3D4                   call prs
  6845 00003083 83C402                   add  sp, 2
  6846 00003086 FF7604                   push word [bp+4]
  6847 00003089 E8EFD5                   call prunsign1
  6848 0000308C 83C402                   add  sp, 2
  6849                                  
  6850                                  ;-781 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  6851 0000308F C9                       LEAVE
  6852 00003090 C3                       ret
  6853 00003091 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  6854                                  ENDP
  6855                                  
  6856                                  doif: PROC;
  6857 0000309A C8040000                 ENTER  4,0
  6858 0000309E E8A4E2                   call pexpr
  6859 000030A1 FF06[2A00]               inc  word[nlabel]
  6860 000030A5 A1[2A00]                 mov ax, [nlabel]
  6861 000030A8 8946FE                   mov [bp-2], ax
  6862                                  
  6863                                  ;-782   pint1(jdest); stmt();
  6864                                  
  6865 000030AB FF76FE                   push word [bp-2]
  6866 000030AE E86CD5                   call pint1
  6867 000030B1 83C402                   add  sp, 2
  6868 000030B4 E8F307                   call stmt
  6869                                  
  6870                                  ;-783   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  6871                                  
  6872 000030B7 680202                   push 514
  6873 000030BA E837D3                   call istoken
  6874 000030BD 83C402                   add  sp, 2
  6875 000030C0 08C0                     or  al, al
  6876 000030C2 0F842B00                 je .doif353
  6877 000030C6 FF06[2A00]               inc  word[nlabel]
  6878 000030CA A1[2A00]                 mov ax, [nlabel]
  6879 000030CD 8946FC                   mov [bp-4], ax
  6880                                  
  6881                                  ;-784     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  6882                                  
  6883 000030D0 FF76FC                   push word [bp-4]
  6884 000030D3 E898FF                   call prjump
  6885 000030D6 83C402                   add  sp, 2
  6886 000030D9 FF76FE                   push word [bp-2]
  6887 000030DC E860FF                   call prlabel
  6888 000030DF 83C402                   add  sp, 2
  6889 000030E2 E8C507                   call stmt
  6890 000030E5 FF76FC                   push word [bp-4]
  6891 000030E8 E854FF                   call prlabel
  6892 000030EB 83C402                   add  sp, 2
  6893                                  
  6894                                  ;-785   else prlabel(jdest); }
  6895                                  
  6896 000030EE E90900                   jmp .doif354
  6897                                  .doif353:
  6898 000030F1 FF76FE                   push word [bp-2]
  6899 000030F4 E848FF                   call prlabel
  6900 000030F7 83C402                   add  sp, 2
  6901                                  .doif354:
  6902                                  
  6903                                  ;-786 
  6904                                  
  6905                                  
  6906                                  ;-787 int dodo() {int jdest; int jtemp;
  6907 000030FA C9                       LEAVE
  6908 000030FB C3                       ret
  6909                                  ENDP
  6910                                  
  6911                                  dodo: PROC
  6912                                  
  6913                                  ;-788   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  6914                                  ;
  6915 000030FC C8040000                 ENTER  4,0
  6916 00003100 FF06[2A00]               inc  word[nlabel]
  6917 00003104 A1[2A00]                 mov ax, [nlabel]
  6918 00003107 8946FE                   mov [bp-2], ax
  6919 0000310A FF76FE                   push word [bp-2]
  6920 0000310D E82FFF                   call prlabel
  6921 00003110 83C402                   add  sp, 2
  6922 00003113 E89407                   call stmt
  6923                                  
  6924                                  ;-789   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  6925                                  
  6926 00003116 680302                   push 515
  6927 00003119 E8FAD2                   call expect
  6928 0000311C 83C402                   add  sp, 2
  6929 0000311F E823E2                   call pexpr
  6930 00003122 FF06[2A00]               inc  word[nlabel]
  6931 00003126 A1[2A00]                 mov ax, [nlabel]
  6932 00003129 8946FC                   mov [bp-4], ax
  6933 0000312C FF76FC                   push word [bp-4]
  6934 0000312F E8EBD4                   call pint1
  6935 00003132 83C402                   add  sp, 2
  6936                                  
  6937                                  ;-790   prjump(jdest); prlabel(jtemp); }
  6938                                  
  6939 00003135 FF76FE                   push word [bp-2]
  6940 00003138 E833FF                   call prjump
  6941 0000313B 83C402                   add  sp, 2
  6942 0000313E FF76FC                   push word [bp-4]
  6943 00003141 E8FBFE                   call prlabel
  6944 00003144 83C402                   add  sp, 2
  6945                                  
  6946                                  ;-791 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  6947 00003147 C9                       LEAVE
  6948 00003148 C3                       ret
  6949                                  ENDP
  6950                                  
  6951                                  dowhile: PROC;
  6952 00003149 C8040000                 ENTER  4,0
  6953 0000314D FF06[2A00]               inc  word[nlabel]
  6954 00003151 A1[2A00]                 mov ax, [nlabel]
  6955 00003154 8946FE                   mov [bp-2], ax
  6956                                  
  6957                                  ;-792   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  6958                                  
  6959 00003157 FF76FE                   push word [bp-2]
  6960 0000315A E8E2FE                   call prlabel
  6961 0000315D 83C402                   add  sp, 2
  6962 00003160 E8E2E1                   call pexpr
  6963 00003163 FF06[2A00]               inc  word[nlabel]
  6964 00003167 A1[2A00]                 mov ax, [nlabel]
  6965 0000316A 8946FC                   mov [bp-4], ax
  6966 0000316D FF76FC                   push word [bp-4]
  6967 00003170 E8AAD4                   call pint1
  6968 00003173 83C402                   add  sp, 2
  6969                                  
  6970                                  ;-793   stmt(); prjump(jdest); prlabel(tst); }
  6971                                  
  6972 00003176 E83107                   call stmt
  6973 00003179 FF76FE                   push word [bp-2]
  6974 0000317C E8EFFE                   call prjump
  6975 0000317F 83C402                   add  sp, 2
  6976 00003182 FF76FC                   push word [bp-4]
  6977 00003185 E8B7FE                   call prlabel
  6978 00003188 83C402                   add  sp, 2
  6979                                  
  6980                                  ;-794 int isrelational() {
  6981 0000318B C9                       LEAVE
  6982 0000318C C3                       ret
  6983                                  ENDP
  6984                                  
  6985                                  isrelational: PROC
  6986                                  
  6987                                  ;-795   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  6988                                  
  6989 0000318D A1[1E00]                 mov ax, [token]
  6990 00003190 3D2603                   cmp ax, 806
  6991 00003193 0F850300                 jne .isrelational355
  6992 00003197 E94700                   jmp .w
  6993                                  .isrelational355:
  6994 0000319A A1[1E00]                 mov ax, [token]
  6995 0000319D 3D2703                   cmp ax, 807
  6996 000031A0 0F850300                 jne .isrelational356
  6997 000031A4 E93A00                   jmp .w
  6998                                  
  6999                                  ;-796   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7000                                  
  7001                                  .isrelational356:
  7002 000031A7 A1[1E00]                 mov ax, [token]
  7003 000031AA 3D3803                   cmp ax, 824
  7004 000031AD 0F850300                 jne .isrelational357
  7005 000031B1 E92D00                   jmp .w
  7006                                  .isrelational357:
  7007 000031B4 A1[1E00]                 mov ax, [token]
  7008 000031B7 3D2B03                   cmp ax, 811
  7009 000031BA 0F850300                 jne .isrelational358
  7010 000031BE E92000                   jmp .w
  7011                                  
  7012                                  ;-797   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7013                                  
  7014                                  .isrelational358:
  7015 000031C1 A1[1E00]                 mov ax, [token]
  7016 000031C4 83F83C                   cmp ax, 60
  7017 000031C7 0F850300                 jne .isrelational359
  7018 000031CB E91300                   jmp .w
  7019                                  .isrelational359:
  7020 000031CE A1[1E00]                 mov ax, [token]
  7021 000031D1 83F83E                   cmp ax, 62
  7022 000031D4 0F850300                 jne .isrelational360
  7023 000031D8 E90600                   jmp .w
  7024                                  
  7025                                  ;-798   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7026                                  
  7027                                  .isrelational360:
  7028 000031DB B80000                   mov ax, 0
  7029 000031DE E91200                   jmp .retnisrelational
  7030                                  .w:
  7031 000031E1 A1[1E00]                 mov ax, [token]
  7032 000031E4 A3[2400]                 mov word [iscmp], ax
  7033 000031E7 E80A00                   call getlex
  7034 000031EA A3[1E00]                 mov word [token], ax
  7035 000031ED B80100                   mov ax, 1
  7036 000031F0 E90000                   jmp .retnisrelational
  7037                                  
  7038                                  ;-799 
  7039                                  
  7040                                  
  7041                                  ;-800 char symboltemp[80];
  7042                                  
  7043                                   .retnisrelational:
  7044 000031F3 C3                       ret
  7045                                  ENDP
  7046                                  section .bss
  7047                                  absolute 55917
  7048 0000DA6D <res 00000050>          symboltemp resb 80
  7049                                  section .text
  7050                                  
  7051                                  ;-801 int getlex() { char c; char *p;
  7052                                  
  7053                                  
  7054                                  getlex: PROC
  7055                                  
  7056                                  ;-802 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7057                                  ;
  7058 000031F4 C8040000                 ENTER  4,0
  7059                                  .g1:
  7060 000031F8 E8DBD1                   call next
  7061 000031FB 8846FE                   mov [bp-2], al
  7062 000031FE 8A46FE                   mov al, [bp-2]
  7063 00003201 3C00                     cmp al, 0
  7064 00003203 0F850600                 jne .getlex361
  7065 00003207 B80000                   mov ax, 0
  7066 0000320A E9DA04                   jmp .retngetlex
  7067                                  .getlex361:
  7068 0000320D 8A46FE                   mov al, [bp-2]
  7069 00003210 3C20                     cmp al, 32
  7070 00003212 0F8F0200                 jg  .getlex362
  7071 00003216 EBE0                     jmp .g1
  7072                                  
  7073                                  ;-803   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7074                                  
  7075                                  .getlex362:
  7076 00003218 8A46FE                   mov al, [bp-2]
  7077 0000321B 3C3D                     cmp al, 61
  7078 0000321D 0F851200                 jne .getlex363
  7079 00003221 A0[2300]                 mov al, [thechar]
  7080 00003224 3C3D                     cmp al, 61
  7081 00003226 0F850900                 jne .getlex364
  7082 0000322A E8A9D1                   call next
  7083 0000322D B82603                   mov ax, 806
  7084 00003230 E9B404                   jmp .retngetlex
  7085                                  .getlex364:
  7086                                  
  7087                                  ;-804   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7088                                  
  7089                                  .getlex363:
  7090 00003233 8A46FE                   mov al, [bp-2]
  7091 00003236 3C21                     cmp al, 33
  7092 00003238 0F851200                 jne .getlex365
  7093 0000323C A0[2300]                 mov al, [thechar]
  7094 0000323F 3C3D                     cmp al, 61
  7095 00003241 0F850900                 jne .getlex366
  7096 00003245 E88ED1                   call next
  7097 00003248 B82703                   mov ax, 807
  7098 0000324B E99904                   jmp .retngetlex
  7099                                  .getlex366:
  7100                                  
  7101                                  ;-805   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7102                                  
  7103                                  .getlex365:
  7104 0000324E 8A46FE                   mov al, [bp-2]
  7105 00003251 3C3C                     cmp al, 60
  7106 00003253 0F851200                 jne .getlex367
  7107 00003257 A0[2300]                 mov al, [thechar]
  7108 0000325A 3C3D                     cmp al, 61
  7109 0000325C 0F850900                 jne .getlex368
  7110 00003260 E873D1                   call next
  7111 00003263 B83803                   mov ax, 824
  7112 00003266 E97E04                   jmp .retngetlex
  7113                                  .getlex368:
  7114                                  
  7115                                  ;-806   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  7116                                  
  7117                                  .getlex367:
  7118 00003269 8A46FE                   mov al, [bp-2]
  7119 0000326C 3C3E                     cmp al, 62
  7120 0000326E 0F851200                 jne .getlex369
  7121 00003272 A0[2300]                 mov al, [thechar]
  7122 00003275 3C3D                     cmp al, 61
  7123 00003277 0F850900                 jne .getlex370
  7124 0000327B E858D1                   call next
  7125 0000327E B82B03                   mov ax, 811
  7126 00003281 E96304                   jmp .retngetlex
  7127                                  .getlex370:
  7128                                  
  7129                                  ;-807   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  7130                                  
  7131                                  .getlex369:
  7132 00003284 8A46FE                   mov al, [bp-2]
  7133 00003287 3C3C                     cmp al, 60
  7134 00003289 0F851200                 jne .getlex371
  7135 0000328D A0[2300]                 mov al, [thechar]
  7136 00003290 3C3C                     cmp al, 60
  7137 00003292 0F850900                 jne .getlex372
  7138 00003296 E83DD1                   call next
  7139 00003299 B8D804                   mov ax, 1240
  7140 0000329C E94804                   jmp .retngetlex
  7141                                  .getlex372:
  7142                                  
  7143                                  ;-808   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  7144                                  
  7145                                  .getlex371:
  7146 0000329F 8A46FE                   mov al, [bp-2]
  7147 000032A2 3C3E                     cmp al, 62
  7148 000032A4 0F851200                 jne .getlex373
  7149 000032A8 A0[2300]                 mov al, [thechar]
  7150 000032AB 3C3E                     cmp al, 62
  7151 000032AD 0F850900                 jne .getlex374
  7152 000032B1 E822D1                   call next
  7153 000032B4 B8D904                   mov ax, 1241
  7154 000032B7 E92D04                   jmp .retngetlex
  7155                                  .getlex374:
  7156                                  
  7157                                  ;-809   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  7158                                  
  7159                                  .getlex373:
  7160 000032BA 8A46FE                   mov al, [bp-2]
  7161 000032BD 3C2B                     cmp al, 43
  7162 000032BF 0F851200                 jne .getlex375
  7163 000032C3 A0[2300]                 mov al, [thechar]
  7164 000032C6 3C2B                     cmp al, 43
  7165 000032C8 0F850900                 jne .getlex376
  7166 000032CC E807D1                   call next
  7167 000032CF B8C304                   mov ax, 1219
  7168 000032D2 E91204                   jmp .retngetlex
  7169                                  .getlex376:
  7170                                  
  7171                                  ;-810   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  7172                                  
  7173                                  .getlex375:
  7174 000032D5 8A46FE                   mov al, [bp-2]
  7175 000032D8 3C2D                     cmp al, 45
  7176 000032DA 0F851200                 jne .getlex377
  7177 000032DE A0[2300]                 mov al, [thechar]
  7178 000032E1 3C2D                     cmp al, 45
  7179 000032E3 0F850900                 jne .getlex378
  7180 000032E7 E8ECD0                   call next
  7181 000032EA B8C904                   mov ax, 1225
  7182 000032ED E9F703                   jmp .retngetlex
  7183                                  .getlex378:
  7184                                  
  7185                                  ;-811   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  7186                                  
  7187                                  .getlex377:
  7188 000032F0 8A46FE                   mov al, [bp-2]
  7189 000032F3 3C2B                     cmp al, 43
  7190 000032F5 0F851200                 jne .getlex379
  7191 000032F9 A0[2300]                 mov al, [thechar]
  7192 000032FC 3C3D                     cmp al, 61
  7193 000032FE 0F850900                 jne .getlex380
  7194 00003302 E8D1D0                   call next
  7195 00003305 B8CE04                   mov ax, 1230
  7196 00003308 E9DC03                   jmp .retngetlex
  7197                                  .getlex380:
  7198                                  
  7199                                  ;-812   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  7200                                  
  7201                                  .getlex379:
  7202 0000330B 8A46FE                   mov al, [bp-2]
  7203 0000330E 3C2D                     cmp al, 45
  7204 00003310 0F851200                 jne .getlex381
  7205 00003314 A0[2300]                 mov al, [thechar]
  7206 00003317 3C3D                     cmp al, 61
  7207 00003319 0F850900                 jne .getlex382
  7208 0000331D E8B6D0                   call next
  7209 00003320 B8CF04                   mov ax, 1231
  7210 00003323 E9C103                   jmp .retngetlex
  7211                                  .getlex382:
  7212                                  
  7213                                  ;-813   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  7214                                  
  7215                                  .getlex381:
  7216 00003326 8A46FE                   mov al, [bp-2]
  7217 00003329 3C26                     cmp al, 38
  7218 0000332B 0F851200                 jne .getlex383
  7219 0000332F A0[2300]                 mov al, [thechar]
  7220 00003332 3C3D                     cmp al, 61
  7221 00003334 0F850900                 jne .getlex384
  7222 00003338 E89BD0                   call next
  7223 0000333B B8D204                   mov ax, 1234
  7224 0000333E E9A603                   jmp .retngetlex
  7225                                  .getlex384:
  7226                                  
  7227                                  ;-814   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  7228                                  
  7229                                  .getlex383:
  7230 00003341 8A46FE                   mov al, [bp-2]
  7231 00003344 3C7C                     cmp al, 124
  7232 00003346 0F851200                 jne .getlex385
  7233 0000334A A0[2300]                 mov al, [thechar]
  7234 0000334D 3C3D                     cmp al, 61
  7235 0000334F 0F850900                 jne .getlex386
  7236 00003353 E880D0                   call next
  7237 00003356 B8D304                   mov ax, 1235
  7238 00003359 E98B03                   jmp .retngetlex
  7239                                  .getlex386:
  7240                                  
  7241                                  ;-815   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  7242                                  
  7243                                  .getlex385:
  7244 0000335C 8A46FE                   mov al, [bp-2]
  7245 0000335F 3C2A                     cmp al, 42
  7246 00003361 0F851200                 jne .getlex387
  7247 00003365 A0[2300]                 mov al, [thechar]
  7248 00003368 3C3D                     cmp al, 61
  7249 0000336A 0F850900                 jne .getlex388
  7250 0000336E E865D0                   call next
  7251 00003371 B8D004                   mov ax, 1232
  7252 00003374 E97003                   jmp .retngetlex
  7253                                  .getlex388:
  7254                                  
  7255                                  ;-816   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  7256                                  
  7257                                  .getlex387:
  7258 00003377 8A46FE                   mov al, [bp-2]
  7259 0000337A 3C2F                     cmp al, 47
  7260 0000337C 0F851200                 jne .getlex389
  7261 00003380 A0[2300]                 mov al, [thechar]
  7262 00003383 3C3D                     cmp al, 61
  7263 00003385 0F850900                 jne .getlex390
  7264 00003389 E84AD0                   call next
  7265 0000338C B8D104                   mov ax, 1233
  7266 0000338F E95503                   jmp .retngetlex
  7267                                  .getlex390:
  7268                                  
  7269                                  ;-817   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  7270                                  
  7271                                  .getlex389:
  7272 00003392 8A46FE                   mov al, byte [bp-2]
  7273 00003395 B400                     mov ah, 0
  7274 00003397 50                       push ax
  7275 00003398 68[E936]                 push getlex_0
  7276 0000339B E878CF                   call instr1
  7277 0000339E 83C404                   add  sp, 4
  7278 000033A1 08C0                     or  al, al
  7279 000033A3 0F840600                 je .getlex391
  7280 000033A7 8A46FE                   mov al, [bp-2]
  7281 000033AA E93A03                   jmp .retngetlex
  7282                                  
  7283                                  ;-818   if (c == '/') { if (thechar == '/') {
  7284                                  
  7285                                  .getlex391:
  7286 000033AD 8A46FE                   mov al, [bp-2]
  7287 000033B0 3C2F                     cmp al, 47
  7288 000033B2 0F852900                 jne .getlex392
  7289 000033B6 A0[2300]                 mov al, [thechar]
  7290 000033B9 3C2F                     cmp al, 47
  7291 000033BB 0F852000                 jne .getlex393
  7292                                  
  7293                                  ;-819       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  7294                                  
  7295                                  .getlex394:
  7296 000033BF E814D0                   call next
  7297 000033C2 8846FE                   mov [bp-2], al
  7298 000033C5 8A46FE                   mov al, byte [bp-2]
  7299 000033C8 B400                     mov ah, 0
  7300 000033CA 50                       push ax
  7301 000033CB E84108                   call ifEOL
  7302 000033CE 83C402                   add  sp, 2
  7303 000033D1 3C00                     cmp al, 0
  7304 000033D3 0F850200                 jne .getlex395
  7305 000033D7 EBE6                     jmp .getlex394
  7306                                  .getlex395:
  7307 000033D9 E818FE                   call getlex
  7308 000033DC E90803                   jmp .retngetlex
  7309                                  .getlex393:
  7310                                  
  7311                                  ;-820   if (c == '/') { if (thechar == '*') {
  7312                                  
  7313                                  .getlex392:
  7314 000033DF 8A46FE                   mov al, [bp-2]
  7315 000033E2 3C2F                     cmp al, 47
  7316 000033E4 0F853A00                 jne .getlex396
  7317 000033E8 A0[2300]                 mov al, [thechar]
  7318 000033EB 3C2A                     cmp al, 42
  7319 000033ED 0F852B00                 jne .getlex397
  7320                                  
  7321                                  ;-821       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  7322                                  
  7323                                  .g2:
  7324 000033F1 E8E2CF                   call next
  7325 000033F4 8846FE                   mov [bp-2], al
  7326 000033F7 8A46FE                   mov al, [bp-2]
  7327 000033FA 3C2A                     cmp al, 42
  7328 000033FC 0F840200                 je  .getlex398
  7329 00003400 EBEF                     jmp .g2
  7330                                  .getlex398:
  7331 00003402 A0[2300]                 mov al, [thechar]
  7332 00003405 3C2F                     cmp al, 47
  7333 00003407 0F840200                 je  .getlex399
  7334 0000340B EBE4                     jmp .g2
  7335                                  
  7336                                  ;-822       c=next(); return getlex(); } else  return '/'; }
  7337                                  
  7338                                  .getlex399:
  7339 0000340D E8C6CF                   call next
  7340 00003410 8846FE                   mov [bp-2], al
  7341 00003413 E8DEFD                   call getlex
  7342 00003416 E9CE02                   jmp .retngetlex
  7343 00003419 E90600                   jmp .getlex400
  7344                                  .getlex397:
  7345 0000341C B82F00                   mov ax, 47
  7346 0000341F E9C502                   jmp .retngetlex
  7347                                  .getlex400:
  7348                                  
  7349                                  ;-823   if (c == '"') {getstring(c); return T_STRING;}
  7350                                  
  7351                                  .getlex396:
  7352 00003422 8A46FE                   mov al, [bp-2]
  7353 00003425 3C22                     cmp al, 34
  7354 00003427 0F851200                 jne .getlex401
  7355 0000342B 8A46FE                   mov al, byte [bp-2]
  7356 0000342E B400                     mov ah, 0
  7357 00003430 50                       push ax
  7358 00003431 E88F06                   call getstring
  7359 00003434 83C402                   add  sp, 2
  7360 00003437 B80201                   mov ax, 258
  7361 0000343A E9AA02                   jmp .retngetlex
  7362                                  
  7363                                  ;-824   if (digit(c)) { getdigit(c); return T_CONST; }
  7364                                  
  7365                                  .getlex401:
  7366 0000343D 8A46FE                   mov al, byte [bp-2]
  7367 00003440 B400                     mov ah, 0
  7368 00003442 50                       push ax
  7369 00003443 E858CD                   call digit
  7370 00003446 83C402                   add  sp, 2
  7371 00003449 08C0                     or  al, al
  7372 0000344B 0F841200                 je .getlex402
  7373 0000344F 8A46FE                   mov al, byte [bp-2]
  7374 00003452 B400                     mov ah, 0
  7375 00003454 50                       push ax
  7376 00003455 E87C03                   call getdigit
  7377 00003458 83C402                   add  sp, 2
  7378 0000345B B80101                   mov ax, 257
  7379 0000345E E98602                   jmp .retngetlex
  7380                                  
  7381                                  ;-825   if (c==39) { lexval=next();
  7382                                  
  7383                                  .getlex402:
  7384 00003461 8A46FE                   mov al, [bp-2]
  7385 00003464 3C27                     cmp al, 39
  7386 00003466 0F854F00                 jne .getlex403
  7387 0000346A E869CF                   call next
  7388 0000346D A3[2C00]                 mov word [lexval], ax
  7389                                  
  7390                                  ;-826     if (lexval==92) {lexval=next();
  7391                                  
  7392 00003470 A1[2C00]                 mov ax, [lexval]
  7393 00003473 83F85C                   cmp ax, 92
  7394 00003476 0F853600                 jne .getlex404
  7395 0000347A E859CF                   call next
  7396 0000347D A3[2C00]                 mov word [lexval], ax
  7397                                  
  7398                                  ;-827       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  7399                                  
  7400 00003480 A1[2C00]                 mov ax, [lexval]
  7401 00003483 83F86E                   cmp ax, 110
  7402 00003486 0F850600                 jne .getlex405
  7403 0000348A B80A00                   mov ax, 10
  7404 0000348D A3[2C00]                 mov word [lexval], ax
  7405                                  .getlex405:
  7406 00003490 A1[2C00]                 mov ax, [lexval]
  7407 00003493 83F874                   cmp ax, 116
  7408 00003496 0F850600                 jne .getlex406
  7409 0000349A B80900                   mov ax, 9
  7410 0000349D A3[2C00]                 mov word [lexval], ax
  7411                                  
  7412                                  ;-828       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  7413                                  
  7414                                  .getlex406:
  7415 000034A0 A1[2C00]                 mov ax, [lexval]
  7416 000034A3 83F830                   cmp ax, 48
  7417 000034A6 0F850600                 jne .getlex407
  7418 000034AA B80000                   mov ax, 0
  7419 000034AD A3[2C00]                 mov word [lexval], ax
  7420                                  .getlex407:
  7421                                  .getlex404:
  7422 000034B0 E823CF                   call next
  7423 000034B3 B80101                   mov ax, 257
  7424 000034B6 E92E02                   jmp .retngetlex
  7425                                  
  7426                                  ;-829   if (alnum(c)) {
  7427                                  
  7428                                  .getlex403:
  7429 000034B9 8A46FE                   mov al, byte [bp-2]
  7430 000034BC B400                     mov ah, 0
  7431 000034BE 50                       push ax
  7432 000034BF E806CD                   call alnum
  7433 000034C2 83C402                   add  sp, 2
  7434 000034C5 08C0                     or  al, al
  7435 000034C7 0F841302                 je .getlex408
  7436                                  
  7437                                  ;-830     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  7438                                  
  7439 000034CB 8D06BB69                 lea  ax, [symbol]
  7440 000034CF 50                       push ax
  7441 000034D0 8D066DDA                 lea  ax, [symboltemp]
  7442 000034D4 50                       push ax
  7443 000034D5 E854CD                   call strcpy
  7444 000034D8 83C404                   add  sp, 4
  7445 000034DB B8BB69                   mov ax, symbol
  7446 000034DE 8946FC                   mov [bp-4], ax
  7447 000034E1 8A46FE                   mov al, [bp-2]
  7448 000034E4 8B5EFC                   mov  bx, [bp-4]
  7449 000034E7 8807                     mov  [bx], al
  7450 000034E9 FF46FC                   inc  word[bp-4]
  7451                                  
  7452                                  ;-831     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  7453                                  
  7454                                  .getlex409:
  7455 000034EC A0[2300]                 mov al, byte [thechar]
  7456 000034EF B400                     mov ah, 0
  7457 000034F1 50                       push ax
  7458 000034F2 E8D3CC                   call alnum
  7459 000034F5 83C402                   add  sp, 2
  7460 000034F8 08C0                     or  al, al
  7461 000034FA 0F841300                 je .getlex410
  7462 000034FE E8D5CE                   call next
  7463 00003501 8846FE                   mov [bp-2], al
  7464 00003504 8A46FE                   mov al, [bp-2]
  7465 00003507 8B5EFC                   mov  bx, [bp-4]
  7466 0000350A 8807                     mov  [bx], al
  7467 0000350C FF46FC                   inc  word[bp-4]
  7468                                  
  7469                                  ;-832       *p=0;
  7470                                  
  7471 0000350F EBDB                     jmp .getlex409
  7472                                  .getlex410:
  7473 00003511 B80000                   mov ax, 0
  7474 00003514 8B5EFC                   mov  bx, [bp-4]
  7475 00003517 8807                     mov  [bx], al
  7476                                  
  7477                                  ;-833     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  7478                                  
  7479 00003519 68[FF36]                 push getlex_1
  7480 0000351C 8D06BB69                 lea  ax, [symbol]
  7481 00003520 50                       push ax
  7482 00003521 E83ECD                   call eqstr
  7483 00003524 83C404                   add  sp, 4
  7484 00003527 08C0                     or  al, al
  7485 00003529 0F840600                 je .getlex411
  7486 0000352D B81302                   mov ax, 531
  7487 00003530 E9B401                   jmp .retngetlex
  7488                                  
  7489                                  ;-834     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  7490                                  
  7491                                  .getlex411:
  7492 00003533 68[0637]                 push getlex_2
  7493 00003536 8D06BB69                 lea  ax, [symbol]
  7494 0000353A 50                       push ax
  7495 0000353B E824CD                   call eqstr
  7496 0000353E 83C404                   add  sp, 4
  7497 00003541 08C0                     or  al, al
  7498 00003543 0F840600                 je .getlex412
  7499 00003547 B81402                   mov ax, 532
  7500 0000354A E99A01                   jmp .retngetlex
  7501                                  
  7502                                  ;-835     if (eqstr(symbol,"void"    )) return T_VOID;
  7503                                  
  7504                                  .getlex412:
  7505 0000354D 68[0F37]                 push getlex_3
  7506 00003550 8D06BB69                 lea  ax, [symbol]
  7507 00003554 50                       push ax
  7508 00003555 E80ACD                   call eqstr
  7509 00003558 83C404                   add  sp, 4
  7510 0000355B 08C0                     or  al, al
  7511 0000355D 0F840600                 je .getlex413
  7512 00003561 B81102                   mov ax, 529
  7513 00003564 E98001                   jmp .retngetlex
  7514                                  
  7515                                  ;-836     if (eqstr(symbol,"int"     )) return T_INT;
  7516                                  
  7517                                  .getlex413:
  7518 00003567 68[1437]                 push getlex_4
  7519 0000356A 8D06BB69                 lea  ax, [symbol]
  7520 0000356E 50                       push ax
  7521 0000356F E8F0CC                   call eqstr
  7522 00003572 83C404                   add  sp, 4
  7523 00003575 08C0                     or  al, al
  7524 00003577 0F840600                 je .getlex414
  7525 0000357B B80502                   mov ax, 517
  7526 0000357E E96601                   jmp .retngetlex
  7527                                  
  7528                                  ;-837     if (eqstr(symbol,"long"    )) return T_LONG;
  7529                                  
  7530                                  .getlex414:
  7531 00003581 68[1837]                 push getlex_5
  7532 00003584 8D06BB69                 lea  ax, [symbol]
  7533 00003588 50                       push ax
  7534 00003589 E8D6CC                   call eqstr
  7535 0000358C 83C404                   add  sp, 4
  7536 0000358F 08C0                     or  al, al
  7537 00003591 0F840600                 je .getlex415
  7538 00003595 B81502                   mov ax, 533
  7539 00003598 E94C01                   jmp .retngetlex
  7540                                  
  7541                                  ;-838     if (eqstr(symbol,"char"    )) return T_CHAR;
  7542                                  
  7543                                  .getlex415:
  7544 0000359B 68[1D37]                 push getlex_6
  7545 0000359E 8D06BB69                 lea  ax, [symbol]
  7546 000035A2 50                       push ax
  7547 000035A3 E8BCCC                   call eqstr
  7548 000035A6 83C404                   add  sp, 4
  7549 000035A9 08C0                     or  al, al
  7550 000035AB 0F840600                 je .getlex416
  7551 000035AF B81202                   mov ax, 530
  7552 000035B2 E93201                   jmp .retngetlex
  7553                                  
  7554                                  ;-839     if (eqstr(symbol,"asm"     )) return T_ASM;
  7555                                  
  7556                                  .getlex416:
  7557 000035B5 68[2237]                 push getlex_7
  7558 000035B8 8D06BB69                 lea  ax, [symbol]
  7559 000035BC 50                       push ax
  7560 000035BD E8A2CC                   call eqstr
  7561 000035C0 83C404                   add  sp, 4
  7562 000035C3 08C0                     or  al, al
  7563 000035C5 0F840600                 je .getlex417
  7564 000035C9 B80602                   mov ax, 518
  7565 000035CC E91801                   jmp .retngetlex
  7566                                  
  7567                                  ;-840     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  7568                                  
  7569                                  .getlex417:
  7570 000035CF 68[2637]                 push getlex_8
  7571 000035D2 8D06BB69                 lea  ax, [symbol]
  7572 000035D6 50                       push ax
  7573 000035D7 E888CC                   call eqstr
  7574 000035DA 83C404                   add  sp, 4
  7575 000035DD 08C0                     or  al, al
  7576 000035DF 0F840600                 je .getlex418
  7577 000035E3 B80702                   mov ax, 519
  7578 000035E6 E9FE00                   jmp .retngetlex
  7579                                  
  7580                                  ;-841     if (eqstr(symbol,"__emit__")) return T_EMIT;
  7581                                  
  7582                                  .getlex418:
  7583 000035E9 68[2C37]                 push getlex_9
  7584 000035EC 8D06BB69                 lea  ax, [symbol]
  7585 000035F0 50                       push ax
  7586 000035F1 E86ECC                   call eqstr
  7587 000035F4 83C404                   add  sp, 4
  7588 000035F7 08C0                     or  al, al
  7589 000035F9 0F840600                 je .getlex419
  7590 000035FD B80802                   mov ax, 520
  7591 00003600 E9E400                   jmp .retngetlex
  7592                                  
  7593                                  ;-842     if (eqstr(symbol,"return"  )) return T_RETURN;
  7594                                  
  7595                                  .getlex419:
  7596 00003603 68[3537]                 push getlex_10
  7597 00003606 8D06BB69                 lea  ax, [symbol]
  7598 0000360A 50                       push ax
  7599 0000360B E854CC                   call eqstr
  7600 0000360E 83C404                   add  sp, 4
  7601 00003611 08C0                     or  al, al
  7602 00003613 0F840600                 je .getlex420
  7603 00003617 B80002                   mov ax, 512
  7604 0000361A E9CA00                   jmp .retngetlex
  7605                                  
  7606                                  ;-843     if (eqstr(symbol,"if"      )) return T_IF;
  7607                                  
  7608                                  .getlex420:
  7609 0000361D 68[3C37]                 push getlex_11
  7610 00003620 8D06BB69                 lea  ax, [symbol]
  7611 00003624 50                       push ax
  7612 00003625 E83ACC                   call eqstr
  7613 00003628 83C404                   add  sp, 4
  7614 0000362B 08C0                     or  al, al
  7615 0000362D 0F840600                 je .getlex421
  7616 00003631 B80102                   mov ax, 513
  7617 00003634 E9B000                   jmp .retngetlex
  7618                                  
  7619                                  ;-844     if (eqstr(symbol,"else"    )) return T_ELSE;
  7620                                  
  7621                                  .getlex421:
  7622 00003637 68[3F37]                 push getlex_12
  7623 0000363A 8D06BB69                 lea  ax, [symbol]
  7624 0000363E 50                       push ax
  7625 0000363F E820CC                   call eqstr
  7626 00003642 83C404                   add  sp, 4
  7627 00003645 08C0                     or  al, al
  7628 00003647 0F840600                 je .getlex422
  7629 0000364B B80202                   mov ax, 514
  7630 0000364E E99600                   jmp .retngetlex
  7631                                  
  7632                                  ;-845     if (eqstr(symbol,"while"   )) return T_WHILE;
  7633                                  
  7634                                  .getlex422:
  7635 00003651 68[4437]                 push getlex_13
  7636 00003654 8D06BB69                 lea  ax, [symbol]
  7637 00003658 50                       push ax
  7638 00003659 E806CC                   call eqstr
  7639 0000365C 83C404                   add  sp, 4
  7640 0000365F 08C0                     or  al, al
  7641 00003661 0F840600                 je .getlex423
  7642 00003665 B80302                   mov ax, 515
  7643 00003668 E97C00                   jmp .retngetlex
  7644                                  
  7645                                  ;-846     if (eqstr(symbol,"do"      )) return T_DO;
  7646                                  
  7647                                  .getlex423:
  7648 0000366B 68[4A37]                 push getlex_14
  7649 0000366E 8D06BB69                 lea  ax, [symbol]
  7650 00003672 50                       push ax
  7651 00003673 E8ECCB                   call eqstr
  7652 00003676 83C404                   add  sp, 4
  7653 00003679 08C0                     or  al, al
  7654 0000367B 0F840600                 je .getlex424
  7655 0000367F B80402                   mov ax, 516
  7656 00003682 E96200                   jmp .retngetlex
  7657                                  
  7658                                  ;-847     if (eqstr(symbol,"goto"    )) return T_GOTO;
  7659                                  
  7660                                  .getlex424:
  7661 00003685 68[4D37]                 push getlex_15
  7662 00003688 8D06BB69                 lea  ax, [symbol]
  7663 0000368C 50                       push ax
  7664 0000368D E8D2CB                   call eqstr
  7665 00003690 83C404                   add  sp, 4
  7666 00003693 08C0                     or  al, al
  7667 00003695 0F840600                 je .getlex425
  7668 00003699 B80902                   mov ax, 521
  7669 0000369C E94800                   jmp .retngetlex
  7670                                  
  7671                                  ;-848     if (eqstr(symbol,"define"  )) return T_DEFINE;
  7672                                  
  7673                                  .getlex425:
  7674 0000369F 68[5237]                 push getlex_16
  7675 000036A2 8D06BB69                 lea  ax, [symbol]
  7676 000036A6 50                       push ax
  7677 000036A7 E8B8CB                   call eqstr
  7678 000036AA 83C404                   add  sp, 4
  7679 000036AD 08C0                     or  al, al
  7680 000036AF 0F840600                 je .getlex426
  7681 000036B3 B8FF01                   mov ax, 511
  7682 000036B6 E92E00                   jmp .retngetlex
  7683                                  
  7684                                  ;-849     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  7685                                  
  7686                                  .getlex426:
  7687 000036B9 E8B700                   call convertdefine
  7688 000036BC 08C0                     or  al, al
  7689 000036BE 0F841600                 je .getlex427
  7690 000036C2 8D066DDA                 lea  ax, [symboltemp]
  7691 000036C6 50                       push ax
  7692 000036C7 8D06BB69                 lea  ax, [symbol]
  7693 000036CB 50                       push ax
  7694 000036CC E85DCB                   call strcpy
  7695 000036CF 83C404                   add  sp, 4
  7696 000036D2 B80101                   mov ax, 257
  7697 000036D5 E90F00                   jmp .retngetlex
  7698                                  
  7699                                  ;-850     return T_NAME; } error1("Input item not recognized"); }
  7700                                  
  7701                                  .getlex427:
  7702 000036D8 B80001                   mov ax, 256
  7703 000036DB E90900                   jmp .retngetlex
  7704                                  .getlex408:
  7705 000036DE 68[5937]                 push getlex_17
  7706 000036E1 E88705                   call error1
  7707 000036E4 83C402                   add  sp, 2
  7708                                  
  7709                                  ;-851 
  7710                                  
  7711                                  
  7712                                  ;-852 int convertdefine() { int i; int j;   i=0;
  7713                                  
  7714 000036E7 C9                       .retngetlex: LEAVE
  7715 000036E8 C3                       ret
  7716 000036E9 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  7717 000036F2 3A252D3E3C3D2B2126-
  7718 000036FB 7C233F00           
  7719 000036FF 7369676E656400          getlex_1 db "signed",0
  7720 00003706 756E7369676E656400      getlex_2 db "unsigned",0
  7721 0000370F 766F696400              getlex_3 db "void",0
  7722 00003714 696E7400                getlex_4 db "int",0
  7723 00003718 6C6F6E6700              getlex_5 db "long",0
  7724 0000371D 6368617200              getlex_6 db "char",0
  7725 00003722 61736D00                getlex_7 db "asm",0
  7726 00003726 5F5F61736D00            getlex_8 db "__asm",0
  7727 0000372C 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  7728 00003735 72657475726E00          getlex_10 db "return",0
  7729 0000373C 696600                  getlex_11 db "if",0
  7730 0000373F 656C736500              getlex_12 db "else",0
  7731 00003744 7768696C6500            getlex_13 db "while",0
  7732 0000374A 646F00                  getlex_14 db "do",0
  7733 0000374D 676F746F00              getlex_15 db "goto",0
  7734 00003752 646566696E6500          getlex_16 db "define",0
  7735 00003759 496E70757420697465-     getlex_17 db "Input item not recognized",0
  7736 00003762 6D206E6F7420726563-
  7737 0000376B 6F676E697A656400   
  7738                                  ENDP
  7739                                  
  7740                                  convertdefine: PROC;
  7741 00003773 C8040000                 ENTER  4,0
  7742 00003777 B80000                   mov ax, 0
  7743 0000377A 8946FE                   mov [bp-2], ax
  7744                                  
  7745                                  ;-853   while (i < GTop) {
  7746                                  
  7747                                  .convertdefine428:
  7748 0000377D 8B46FE                   mov ax, [bp-2]
  7749 00003780 3B06[3900]               cmp ax, [GTop]
  7750 00003784 0F8D4400                 jge .convertdefine429
  7751                                  
  7752                                  ;-854    j=adrofname(i);
  7753                                  
  7754 00003788 FF76FE                   push word [bp-2]
  7755 0000378B E86ED4                   call adrofname
  7756 0000378E 83C402                   add  sp, 2
  7757 00003791 8946FC                   mov [bp-4], ax
  7758                                  
  7759                                  ;-855    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  7760                                  
  7761 00003794 FF76FC                   push word [bp-4]
  7762 00003797 8D06BB69                 lea  ax, [symbol]
  7763 0000379B 50                       push ax
  7764 0000379C E8C3CA                   call eqstr
  7765 0000379F 83C404                   add  sp, 4
  7766 000037A2 08C0                     or  al, al
  7767 000037A4 0F841F00                 je .convertdefine430
  7768 000037A8 8B5EFE                   mov bx, [bp-2]
  7769 000037AB 8A87046B                 mov al, [GType + bx]
  7770 000037AF 3C23                     cmp al, 35
  7771 000037B1 0F851200                 jne .convertdefine431
  7772 000037B5 8B5EFE                   mov bx, [bp-2]
  7773 000037B8 D1E3                     shl bx, 1
  7774 000037BA 8B873873                 mov ax, [GData + bx]
  7775 000037BE A3[2C00]                 mov word [lexval], ax
  7776                                  
  7777                                  ;-856    return T_CONST; } }
  7778                                  
  7779 000037C1 B80101                   mov ax, 257
  7780 000037C4 E90B00                   jmp .retnconvertdefine
  7781                                  .convertdefine431:
  7782                                  
  7783                                  ;-857    i++; }
  7784                                  
  7785                                  .convertdefine430:
  7786 000037C7 FF46FE                   inc  word[bp-2]
  7787                                  
  7788                                  ;-858    return 0; }
  7789                                  
  7790 000037CA EBB1                     jmp .convertdefine428
  7791                                  .convertdefine429:
  7792 000037CC B80000                   mov ax, 0
  7793 000037CF E90000                   jmp .retnconvertdefine
  7794                                  
  7795                                  ;-859 
  7796                                  
  7797                                  
  7798                                  ;-860 int getdigit(char c) { int i;
  7799                                  
  7800 000037D2 C9                       .retnconvertdefine: LEAVE
  7801 000037D3 C3                       ret
  7802                                  ENDP
  7803                                  
  7804                                  getdigit: PROC
  7805                                  
  7806                                  ;-861     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  7807                                  ;
  7808 000037D4 C8020000                 ENTER  2,0
  7809 000037D8 B80000                   mov ax, 0
  7810 000037DB A3[2C00]                 mov word [lexval], ax
  7811 000037DE 8A4604                   mov al, [bp+4]
  7812 000037E1 2C30                     sub al, 48
  7813 000037E3 A3[2C00]                 mov word [lexval], ax
  7814                                  
  7815                                  ;-862     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  7816                                  
  7817 000037E6 A0[2300]                 mov al, [thechar]
  7818 000037E9 3C78                     cmp al, 120
  7819 000037EB 0F850600                 jne .getdigit432
  7820 000037EF B85800                   mov ax, 88
  7821 000037F2 A2[2300]                 mov byte [thechar], al
  7822                                  .getdigit432:
  7823 000037F5 A0[2300]                 mov al, [thechar]
  7824 000037F8 3C58                     cmp al, 88
  7825 000037FA 0F856800                 jne .getdigit433
  7826 000037FE E8D5CB                   call next
  7827                                  
  7828                                  ;-863       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  7829                                  
  7830                                  .getdigit434:
  7831 00003801 A0[2300]                 mov al, byte [thechar]
  7832 00003804 B400                     mov ah, 0
  7833 00003806 50                       push ax
  7834 00003807 E8BEC9                   call alnum
  7835 0000380A 83C402                   add  sp, 2
  7836 0000380D 08C0                     or  al, al
  7837 0000380F 0F845000                 je .getdigit435
  7838 00003813 E8C0CB                   call next
  7839 00003816 884604                   mov [bp+4], al
  7840 00003819 8A4604                   mov al, [bp+4]
  7841 0000381C 3C60                     cmp al, 96
  7842 0000381E 0F8E0800                 jle .getdigit436
  7843 00003822 8A4604                   mov al, [bp+4]
  7844 00003825 2C27                     sub al, 39
  7845 00003827 884604                   mov [bp+4], al
  7846                                  
  7847                                  ;-864 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  7848                                  
  7849                                  .getdigit436:
  7850 0000382A 8A4604                   mov al, [bp+4]
  7851 0000382D 3C40                     cmp al, 64
  7852 0000382F 0F8E0800                 jle .getdigit437
  7853 00003833 8A4604                   mov al, [bp+4]
  7854 00003836 2C07                     sub al, 7
  7855 00003838 884604                   mov [bp+4], al
  7856                                  .getdigit437:
  7857 0000383B 8A4604                   mov al, [bp+4]
  7858 0000383E 2C30                     sub al, 48
  7859 00003840 884604                   mov [bp+4], al
  7860 00003843 A1[2C00]                 mov ax, [lexval]
  7861 00003846 C1E004                   shl ax, 4
  7862 00003849 A3[2C00]                 mov word [lexval], ax
  7863                                  
  7864                                  ;-865      i=0; i=c; lexval=lexval+i;}
  7865                                  
  7866 0000384C B80000                   mov ax, 0
  7867 0000384F 8946FE                   mov [bp-2], ax
  7868 00003852 8A4604                   mov al, [bp+4]
  7869 00003855 8946FE                   mov [bp-2], ax
  7870 00003858 A1[2C00]                 mov ax, [lexval]
  7871 0000385B 0346FE                   add ax, [bp-2]
  7872 0000385E A3[2C00]                 mov word [lexval], ax
  7873                                  
  7874                                  ;-866     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  7875                                  
  7876 00003861 EB9E                     jmp .getdigit434
  7877                                  .getdigit435:
  7878 00003863 E94200                   jmp .getdigit438
  7879                                  .getdigit433:
  7880                                  .getdigit439:
  7881 00003866 A0[2300]                 mov al, byte [thechar]
  7882 00003869 B400                     mov ah, 0
  7883 0000386B 50                       push ax
  7884 0000386C E82FC9                   call digit
  7885 0000386F 83C402                   add  sp, 2
  7886 00003872 08C0                     or  al, al
  7887 00003874 0F843000                 je .getdigit440
  7888 00003878 E85BCB                   call next
  7889 0000387B 884604                   mov [bp+4], al
  7890 0000387E 8A4604                   mov al, [bp+4]
  7891 00003881 2C30                     sub al, 48
  7892 00003883 884604                   mov [bp+4], al
  7893 00003886 A1[2C00]                 mov ax, [lexval]
  7894 00003889 BB0A00                   mov bx, 10
  7895 0000388C F7E3                     mul bx
  7896 0000388E A3[2C00]                 mov word [lexval], ax
  7897                                  
  7898                                  ;-867      i=0; i=c; lexval=lexval+i; } }
  7899                                  
  7900 00003891 B80000                   mov ax, 0
  7901 00003894 8946FE                   mov [bp-2], ax
  7902 00003897 8A4604                   mov al, [bp+4]
  7903 0000389A 8946FE                   mov [bp-2], ax
  7904 0000389D A1[2C00]                 mov ax, [lexval]
  7905 000038A0 0346FE                   add ax, [bp-2]
  7906 000038A3 A3[2C00]                 mov word [lexval], ax
  7907 000038A6 EBBE                     jmp .getdigit439
  7908                                  .getdigit440:
  7909                                  
  7910                                  ;-868 }
  7911                                  
  7912                                  .getdigit438:
  7913                                  
  7914                                  ;-869 
  7915                                  
  7916                                  
  7917                                  ;-870 int stmt() { int c; char cha;
  7918 000038A8 C9                       LEAVE
  7919 000038A9 C3                       ret
  7920                                  ENDP
  7921                                  
  7922                                  stmt: PROC
  7923                                  
  7924                                  ;-871        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7925                                  ;
  7926 000038AA C8040000                 ENTER  4,0
  7927 000038AE 6A7B                     push 123
  7928 000038B0 E841CB                   call istoken
  7929 000038B3 83C402                   add  sp, 2
  7930 000038B6 08C0                     or  al, al
  7931 000038B8 0F841700                 je .stmt441
  7932                                  .stmt442:
  7933 000038BC 6A7D                     push 125
  7934 000038BE E833CB                   call istoken
  7935 000038C1 83C402                   add  sp, 2
  7936 000038C4 83F800                   cmp ax, 0
  7937 000038C7 0F850500                 jne .stmt443
  7938 000038CB E8DCFF                   call stmt
  7939 000038CE EBEC                     jmp .stmt442
  7940                                  .stmt443:
  7941                                  
  7942                                  ;-872   else if(istoken(T_IF))    doif();
  7943                                  
  7944 000038D0 E9BA01                   jmp .stmt444
  7945                                  .stmt441:
  7946 000038D3 680102                   push 513
  7947 000038D6 E81BCB                   call istoken
  7948 000038D9 83C402                   add  sp, 2
  7949 000038DC 08C0                     or  al, al
  7950 000038DE 0F840600                 je .stmt445
  7951 000038E2 E8B5F7                   call doif
  7952                                  
  7953                                  ;-873   else if(istoken(T_DO))    dodo();
  7954                                  
  7955 000038E5 E9A501                   jmp .stmt446
  7956                                  .stmt445:
  7957 000038E8 680402                   push 516
  7958 000038EB E806CB                   call istoken
  7959 000038EE 83C402                   add  sp, 2
  7960 000038F1 08C0                     or  al, al
  7961 000038F3 0F840600                 je .stmt447
  7962 000038F7 E802F8                   call dodo
  7963                                  
  7964                                  ;-874   else if(istoken(T_WHILE)) dowhile();
  7965                                  
  7966 000038FA E99001                   jmp .stmt448
  7967                                  .stmt447:
  7968 000038FD 680302                   push 515
  7969 00003900 E8F1CA                   call istoken
  7970 00003903 83C402                   add  sp, 2
  7971 00003906 08C0                     or  al, al
  7972 00003908 0F840600                 je .stmt449
  7973 0000390C E83AF8                   call dowhile
  7974                                  
  7975                                  ;-875   else if(istoken(T_GOTO))  {
  7976                                  
  7977 0000390F E97B01                   jmp .stmt450
  7978                                  .stmt449:
  7979 00003912 680902                   push 521
  7980 00003915 E8DCCA                   call istoken
  7981 00003918 83C402                   add  sp, 2
  7982 0000391B 08C0                     or  al, al
  7983 0000391D 0F842200                 je .stmt451
  7984                                  
  7985                                  ;-876     prs("\n jmp .");name1();prs(symbol);expect(';');}
  7986                                  
  7987 00003921 68[8F3A]                 push stmt_0
  7988 00003924 E8FFCB                   call prs
  7989 00003927 83C402                   add  sp, 2
  7990 0000392A E8FED4                   call name1
  7991 0000392D 8D06BB69                 lea  ax, [symbol]
  7992 00003931 50                       push ax
  7993 00003932 E8F1CB                   call prs
  7994 00003935 83C402                   add  sp, 2
  7995 00003938 6A3B                     push 59
  7996 0000393A E8D9CA                   call expect
  7997 0000393D 83C402                   add  sp, 2
  7998                                  
  7999                                  ;-877   else if(token==T_ASM)     {prs("\n"); c=next();
  8000                                  
  8001 00003940 E94A01                   jmp .stmt452
  8002                                  .stmt451:
  8003 00003943 A1[1E00]                 mov ax, [token]
  8004 00003946 3D0602                   cmp ax, 518
  8005 00003949 0F853300                 jne .stmt453
  8006 0000394D 68[983A]                 push stmt_1
  8007 00003950 E8D3CB                   call prs
  8008 00003953 83C402                   add  sp, 2
  8009 00003956 E87DCA                   call next
  8010 00003959 8946FE                   mov [bp-2], ax
  8011                                  
  8012                                  ;-878         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  8013                                  
  8014                                  .stmt454:
  8015 0000395C 8B46FE                   mov ax, [bp-2]
  8016 0000395F 83F80A                   cmp ax, 10
  8017 00003962 0F841100                 je  .stmt455
  8018 00003966 FF76FE                   push word [bp-2]
  8019 00003969 E853CB                   call prc
  8020 0000396C 83C402                   add  sp, 2
  8021 0000396F E864CA                   call next
  8022 00003972 8946FE                   mov [bp-2], ax
  8023 00003975 EBE5                     jmp .stmt454
  8024                                  .stmt455:
  8025 00003977 E87AF8                   call getlex
  8026 0000397A A3[1E00]                 mov word [token], ax
  8027                                  
  8028                                  ;-879   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  8029                                  
  8030 0000397D E90D01                   jmp .stmt456
  8031                                  .stmt453:
  8032 00003980 680702                   push 519
  8033 00003983 E86ECA                   call istoken
  8034 00003986 83C402                   add  sp, 2
  8035 00003989 08C0                     or  al, al
  8036 0000398B 0F844B00                 je .stmt457
  8037 0000398F A1[1E00]                 mov ax, [token]
  8038 00003992 83F87B                   cmp ax, 123
  8039 00003995 0F853500                 jne .stmt458
  8040 00003999 68[9B3A]                 push stmt_2
  8041 0000399C E887CB                   call prs
  8042 0000399F 83C402                   add  sp, 2
  8043 000039A2 E831CA                   call next
  8044 000039A5 8846FC                   mov [bp-4], al
  8045                                  
  8046                                  ;-880         while(cha!= '}') { prc(cha); cha=next(); }
  8047                                  
  8048                                  .stmt459:
  8049 000039A8 8A46FC                   mov al, [bp-4]
  8050 000039AB 3C7D                     cmp al, 125
  8051 000039AD 0F841400                 je  .stmt460
  8052 000039B1 8A46FC                   mov al, byte [bp-4]
  8053 000039B4 B400                     mov ah, 0
  8054 000039B6 50                       push ax
  8055 000039B7 E805CB                   call prc
  8056 000039BA 83C402                   add  sp, 2
  8057 000039BD E816CA                   call next
  8058 000039C0 8846FC                   mov [bp-4], al
  8059                                  
  8060                                  ;-881         token=getlex(); }
  8061                                  
  8062 000039C3 EBE3                     jmp .stmt459
  8063                                  .stmt460:
  8064 000039C5 E82CF8                   call getlex
  8065 000039C8 A3[1E00]                 mov word [token], ax
  8066                                  
  8067                                  ;-882         else error1("Curly open expected");
  8068                                  
  8069 000039CB E90900                   jmp .stmt461
  8070                                  .stmt458:
  8071 000039CE 68[9E3A]                 push stmt_3
  8072 000039D1 E89702                   call error1
  8073 000039D4 83C402                   add  sp, 2
  8074                                  
  8075                                  ;-883         }
  8076                                  
  8077                                  .stmt461:
  8078                                  
  8079                                  ;-884   else if(istoken(T_EMIT))   doemit();
  8080                                  
  8081 000039D7 E9B300                   jmp .stmt462
  8082                                  .stmt457:
  8083 000039DA 680802                   push 520
  8084 000039DD E814CA                   call istoken
  8085 000039E0 83C402                   add  sp, 2
  8086 000039E3 08C0                     or  al, al
  8087 000039E5 0F840600                 je .stmt463
  8088 000039E9 E8A0F4                   call doemit
  8089                                  
  8090                                  ;-885   else if(istoken(';'))      { }
  8091                                  
  8092 000039EC E99E00                   jmp .stmt464
  8093                                  .stmt463:
  8094 000039EF 6A3B                     push 59
  8095 000039F1 E800CA                   call istoken
  8096 000039F4 83C402                   add  sp, 2
  8097 000039F7 08C0                     or  al, al
  8098 000039F9 0F840300                 je .stmt465
  8099                                  
  8100                                  ;-886   else if(istoken(T_RETURN)) {
  8101                                  
  8102 000039FD E98D00                   jmp .stmt466
  8103                                  .stmt465:
  8104 00003A00 680002                   push 512
  8105 00003A03 E8EEC9                   call istoken
  8106 00003A06 83C402                   add  sp, 2
  8107 00003A09 08C0                     or  al, al
  8108 00003A0B 0F843500                 je .stmt467
  8109                                  
  8110                                  ;-887         if (token!=';') expr(0);
  8111                                  
  8112 00003A0F A1[1E00]                 mov ax, [token]
  8113 00003A12 83F83B                   cmp ax, 59
  8114 00003A15 0F840800                 je  .stmt468
  8115 00003A19 6A00                     push 0
  8116 00003A1B E823E1                   call expr
  8117 00003A1E 83C402                   add  sp, 2
  8118                                  
  8119                                  ;-888         prs("\n jmp .retn");
  8120                                  
  8121                                  .stmt468:
  8122 00003A21 68[B23A]                 push stmt_4
  8123 00003A24 E8FFCA                   call prs
  8124 00003A27 83C402                   add  sp, 2
  8125                                  
  8126                                  ;-889         prs(fname);
  8127                                  
  8128 00003A2A 8D063B6A                 lea  ax, [fname]
  8129 00003A2E 50                       push ax
  8130 00003A2F E8F4CA                   call prs
  8131 00003A32 83C402                   add  sp, 2
  8132                                  
  8133                                  ;-890         nreturn++;
  8134                                  
  8135 00003A35 FF06[2800]               inc  word[nreturn]
  8136                                  
  8137                                  ;-891         expect(';');
  8138                                  
  8139 00003A39 6A3B                     push 59
  8140 00003A3B E8D8C9                   call expect
  8141 00003A3E 83C402                   add  sp, 2
  8142                                  
  8143                                  ;-892         }
  8144                                  
  8145                                  
  8146                                  ;-893   else if(thechar==':')      {
  8147                                  
  8148 00003A41 E94900                   jmp .stmt469
  8149                                  .stmt467:
  8150 00003A44 A0[2300]                 mov al, [thechar]
  8151 00003A47 3C3A                     cmp al, 58
  8152 00003A49 0F853000                 jne .stmt470
  8153                                  
  8154                                  ;-894         prs("\n."); // Label
  8155                                  
  8156 00003A4D 68[BF3A]                 push stmt_5
  8157 00003A50 E8D3CA                   call prs
  8158 00003A53 83C402                   add  sp, 2
  8159                                  
  8160                                  ;-895         prs(symbol); prc(':');
  8161                                  
  8162 00003A56 8D06BB69                 lea  ax, [symbol]
  8163 00003A5A 50                       push ax
  8164 00003A5B E8C8CA                   call prs
  8165 00003A5E 83C402                   add  sp, 2
  8166 00003A61 6A3A                     push 58
  8167 00003A63 E859CA                   call prc
  8168 00003A66 83C402                   add  sp, 2
  8169                                  
  8170                                  ;-896         expect(T_NAME);
  8171                                  
  8172 00003A69 680001                   push 256
  8173 00003A6C E8A7C9                   call expect
  8174 00003A6F 83C402                   add  sp, 2
  8175                                  
  8176                                  ;-897         expect(':');
  8177                                  
  8178 00003A72 6A3A                     push 58
  8179 00003A74 E89FC9                   call expect
  8180 00003A77 83C402                   add  sp, 2
  8181                                  
  8182                                  ;-898         }
  8183                                  
  8184                                  
  8185                                  ;-899   else  {expr(0);; expect(';'); }
  8186                                  
  8187 00003A7A E91000                   jmp .stmt471
  8188                                  .stmt470:
  8189 00003A7D 6A00                     push 0
  8190 00003A7F E8BFE0                   call expr
  8191 00003A82 83C402                   add  sp, 2
  8192 00003A85 6A3B                     push 59
  8193 00003A87 E88CC9                   call expect
  8194 00003A8A 83C402                   add  sp, 2
  8195                                  
  8196                                  ;-900 }
  8197                                  
  8198                                  .stmt471:
  8199                                  .stmt469:
  8200                                  .stmt466:
  8201                                  .stmt464:
  8202                                  .stmt462:
  8203                                  .stmt456:
  8204                                  .stmt452:
  8205                                  .stmt450:
  8206                                  .stmt448:
  8207                                  .stmt446:
  8208                                  .stmt444:
  8209                                  
  8210                                  ;-901 
  8211                                  
  8212                                  
  8213                                  ;-902 int getstring(int delim) {
  8214 00003A8D C9                       LEAVE
  8215 00003A8E C3                       ret
  8216 00003A8F 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  8217 00003A98 5C6E00                  stmt_1 db "\n",0
  8218 00003A9B 5C6E00                  stmt_2 db "\n",0
  8219 00003A9E 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  8220 00003AA7 6E2065787065637465-
  8221 00003AB0 6400               
  8222 00003AB2 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  8223 00003ABB 65746E00           
  8224 00003ABF 5C6E2E00                stmt_5 db "\n.",0
  8225                                  ENDP
  8226                                  
  8227                                  getstring: PROC
  8228                                  
  8229                                  ;-903     int c; char *p;
  8230                                  
  8231                                  
  8232                                  ;-904     p=&symbol;
  8233                                  ;
  8234 00003AC3 C8040000                 ENTER  4,0
  8235 00003AC7 B8BB69                   mov ax, symbol
  8236 00003ACA 8946FC                   mov [bp-4], ax
  8237                                  
  8238                                  ;-905     c=next();
  8239                                  
  8240 00003ACD E806C9                   call next
  8241 00003AD0 8946FE                   mov [bp-2], ax
  8242                                  
  8243                                  ;-906     while (c != delim) {
  8244                                  
  8245                                  .getstring472:
  8246 00003AD3 8B46FE                   mov ax, [bp-2]
  8247 00003AD6 3B4604                   cmp ax, [bp+4]
  8248 00003AD9 0F841300                 je  .getstring473
  8249                                  
  8250                                  ;-907         *p=c;
  8251                                  
  8252 00003ADD 8B46FE                   mov ax, [bp-2]
  8253 00003AE0 8B5EFC                   mov  bx, [bp-4]
  8254 00003AE3 8807                     mov  [bx], al
  8255                                  
  8256                                  ;-908         p++;
  8257                                  
  8258 00003AE5 FF46FC                   inc  word[bp-4]
  8259                                  
  8260                                  ;-909         c=next();
  8261                                  
  8262 00003AE8 E8EBC8                   call next
  8263 00003AEB 8946FE                   mov [bp-2], ax
  8264                                  
  8265                                  ;-910     }
  8266                                  
  8267                                  
  8268                                  ;-911     *p=0;
  8269                                  
  8270 00003AEE EBE3                     jmp .getstring472
  8271                                  .getstring473:
  8272 00003AF0 B80000                   mov ax, 0
  8273 00003AF3 8B5EFC                   mov  bx, [bp-4]
  8274 00003AF6 8807                     mov  [bx], al
  8275                                  
  8276                                  ;-912 }
  8277                                  
  8278                                  
  8279                                  ;-913 
  8280                                  
  8281                                  
  8282                                  ;-914 int fgets1() {
  8283 00003AF8 C9                       LEAVE
  8284 00003AF9 C3                       ret
  8285                                  ENDP
  8286                                  
  8287                                  fgets1: PROC
  8288                                  
  8289                                  ;-915     char c;
  8290                                  
  8291                                  
  8292                                  ;-916     c=*fgetsp;
  8293                                  ;
  8294 00003AFA C8020000                 ENTER  2,0
  8295 00003AFE 8B1E[4500]               mov bx, [fgetsp]
  8296 00003B02 8A07                     mov al, [bx]
  8297 00003B04 B400                     mov ah, 0
  8298 00003B06 8846FE                   mov [bp-2], al
  8299                                  
  8300                                  ;-917     if (c==0) {
  8301                                  
  8302 00003B09 8A46FE                   mov al, [bp-2]
  8303 00003B0C 3C00                     cmp al, 0
  8304 00003B0E 0F852A00                 jne .fgets1474
  8305                                  
  8306                                  ;-918         printinputline();
  8307                                  
  8308 00003B12 E83700                   call printinputline
  8309                                  
  8310                                  ;-919         if (DOS_NoBytes == 0) return 0;
  8311                                  
  8312 00003B15 A1[5100]                 mov ax, [DOS_NoBytes]
  8313 00003B18 83F800                   cmp ax, 0
  8314 00003B1B 0F850600                 jne .fgets1475
  8315 00003B1F B80000                   mov ax, 0
  8316 00003B22 E92500                   jmp .retnfgets1
  8317                                  
  8318                                  ;-920         fgetsp=&fgetsdest;
  8319                                  
  8320                                  .fgets1475:
  8321 00003B25 B8A0D9                   mov ax, fgetsdest
  8322 00003B28 A3[4500]                 mov word [fgetsp], ax
  8323                                  
  8324                                  ;-921         c=*fgetsp;
  8325                                  
  8326 00003B2B 8B1E[4500]               mov bx, [fgetsp]
  8327 00003B2F 8A07                     mov al, [bx]
  8328 00003B31 B400                     mov ah, 0
  8329 00003B33 8846FE                   mov [bp-2], al
  8330                                  
  8331                                  ;-922         column=0;
  8332                                  
  8333 00003B36 B80000                   mov ax, 0
  8334 00003B39 A3[2100]                 mov word [column], ax
  8335                                  
  8336                                  ;-923     }
  8337                                  
  8338                                  
  8339                                  ;-924     fgetsp++;
  8340                                  
  8341                                  .fgets1474:
  8342 00003B3C FF06[4500]               inc  word[fgetsp]
  8343                                  
  8344                                  ;-925     column++;
  8345                                  
  8346 00003B40 FF06[2100]               inc  word[column]
  8347                                  
  8348                                  ;-926     return c;
  8349                                  
  8350 00003B44 8A46FE                   mov al, [bp-2]
  8351 00003B47 E90000                   jmp .retnfgets1
  8352                                  
  8353                                  ;-927 }
  8354                                  
  8355                                  
  8356                                  ;-928 int printinputline() {
  8357                                  
  8358 00003B4A C9                       .retnfgets1: LEAVE
  8359 00003B4B C3                       ret
  8360                                  ENDP
  8361                                  
  8362                                  printinputline: PROC
  8363                                  
  8364                                  ;-929     int col;
  8365                                  
  8366                                  
  8367                                  ;-930     col=0;
  8368                                  ;
  8369 00003B4C C8020000                 ENTER  2,0
  8370 00003B50 B80000                   mov ax, 0
  8371 00003B53 8946FE                   mov [bp-2], ax
  8372                                  
  8373                                  ;-931     fgetsp=&fgetsdest;
  8374                                  
  8375 00003B56 B8A0D9                   mov ax, fgetsdest
  8376 00003B59 A3[4500]                 mov word [fgetsp], ax
  8377                                  
  8378                                  ;-932     do {
  8379                                  
  8380                                  .printinputline476:
  8381                                  
  8382                                  ;-933         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  8383                                  
  8384 00003B5C 6A01                     push 1
  8385 00003B5E FF36[1A00]               push word [fdin]
  8386 00003B62 8D06[5300]               lea  ax, [DOS_ByteRead]
  8387 00003B66 50                       push ax
  8388 00003B67 E88CC5                   call readRL
  8389 00003B6A 83C406                   add  sp, 6
  8390 00003B6D A3[5100]                 mov word [DOS_NoBytes], ax
  8391                                  
  8392                                  ;-934         if (DOS_NoBytes == 0) return;
  8393                                  
  8394 00003B70 A1[5100]                 mov ax, [DOS_NoBytes]
  8395 00003B73 83F800                   cmp ax, 0
  8396 00003B76 0F850300                 jne .printinputline477
  8397 00003B7A E96A00                   jmp .retnprintinputline
  8398                                  
  8399                                  ;-935         *fgetsp=DOS_ByteRead;
  8400                                  
  8401                                  .printinputline477:
  8402 00003B7D A0[5300]                 mov al, [DOS_ByteRead]
  8403 00003B80 8B1E[4500]               mov  bx, [fgetsp]
  8404 00003B84 8807                     mov  [bx], al
  8405                                  
  8406                                  ;-936         fgetsp++;
  8407                                  
  8408 00003B86 FF06[4500]               inc  word[fgetsp]
  8409                                  
  8410                                  ;-937         col++;
  8411                                  
  8412 00003B8A FF46FE                   inc  word[bp-2]
  8413                                  
  8414                                  ;-938         if (col >80) error1("input line longer than 80 char");
  8415                                  
  8416 00003B8D 8B46FE                   mov ax, [bp-2]
  8417 00003B90 83F850                   cmp ax, 80
  8418 00003B93 0F8E0900                 jle .printinputline478
  8419 00003B97 68[E93B]                 push printinputline_0
  8420 00003B9A E8CE00                   call error1
  8421 00003B9D 83C402                   add  sp, 2
  8422                                  
  8423                                  ;-939         }
  8424                                  
  8425                                  .printinputline478:
  8426                                  
  8427                                  ;-940         while (DOS_ByteRead != 10);
  8428                                  
  8429 00003BA0 A0[5300]                 mov al, [DOS_ByteRead]
  8430 00003BA3 3C0A                     cmp al, 10
  8431 00003BA5 0F840200                 je  .printinputline479
  8432 00003BA9 EBB1                     jmp .printinputline476
  8433                                  .printinputline479:
  8434                                  
  8435                                  ;-941     *fgetsp=0;
  8436                                  
  8437 00003BAB B80000                   mov ax, 0
  8438 00003BAE 8B1E[4500]               mov  bx, [fgetsp]
  8439 00003BB2 8807                     mov  [bx], al
  8440                                  
  8441                                  ;-942     if (fdout) {
  8442                                  
  8443 00003BB4 A1[1C00]                 mov ax, [fdout]
  8444 00003BB7 08C0                     or  al, al
  8445 00003BB9 0F842A00                 je .printinputline480
  8446                                  
  8447                                  ;-943         prs("\n\n;-");
  8448                                  
  8449 00003BBD 68[083C]                 push printinputline_1
  8450 00003BC0 E863C9                   call prs
  8451 00003BC3 83C402                   add  sp, 2
  8452                                  
  8453                                  ;-944         prunsign1(lineno);
  8454                                  
  8455 00003BC6 FF36[4900]               push word [lineno]
  8456 00003BCA E8AECA                   call prunsign1
  8457 00003BCD 83C402                   add  sp, 2
  8458                                  
  8459                                  ;-945         prc(' ');
  8460                                  
  8461 00003BD0 6A20                     push 32
  8462 00003BD2 E8EAC8                   call prc
  8463 00003BD5 83C402                   add  sp, 2
  8464                                  
  8465                                  ;-946         lineno++;
  8466                                  
  8467 00003BD8 FF06[4900]               inc  word[lineno]
  8468                                  
  8469                                  ;-947         prscomment(&fgetsdest);
  8470                                  
  8471 00003BDC 8D06A0D9                 lea  ax, [fgetsdest]
  8472 00003BE0 50                       push ax
  8473 00003BE1 E806C9                   call prscomment
  8474 00003BE4 83C402                   add  sp, 2
  8475                                  
  8476                                  ;-948         }
  8477                                  
  8478                                  
  8479                                  ;-949 }
  8480                                  
  8481                                  .printinputline480:
  8482                                  
  8483                                  ;-950 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  8484                                  
  8485 00003BE7 C9                       .retnprintinputline: LEAVE
  8486 00003BE8 C3                       ret
  8487 00003BE9 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  8488 00003BF2 65206C6F6E67657220-
  8489 00003BFB 7468616E2038302063-
  8490 00003C04 68617200           
  8491 00003C08 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  8492                                  ENDP
  8493                                  
  8494                                  ifEOL: PROC
  8495                                  
  8496                                  ;-951     if (c == 10) return 1;//LF
  8497                                  ;
  8498 00003C0F C8000000                 ENTER  0,0
  8499 00003C13 8A4604                   mov al, [bp+4]
  8500 00003C16 3C0A                     cmp al, 10
  8501 00003C18 0F850600                 jne .ifEOL481
  8502 00003C1C B80100                   mov ax, 1
  8503 00003C1F E92400                   jmp .retnifEOL
  8504                                  
  8505                                  ;-952     if (c == 13) {//CR
  8506                                  
  8507                                  .ifEOL481:
  8508 00003C22 8A4604                   mov al, [bp+4]
  8509 00003C25 3C0D                     cmp al, 13
  8510 00003C27 0F851500                 jne .ifEOL482
  8511                                  
  8512                                  ;-953         if (thechar == 10) c=next();
  8513                                  
  8514 00003C2B A0[2300]                 mov al, [thechar]
  8515 00003C2E 3C0A                     cmp al, 10
  8516 00003C30 0F850600                 jne .ifEOL483
  8517 00003C34 E89FC7                   call next
  8518 00003C37 884604                   mov [bp+4], al
  8519                                  
  8520                                  ;-954         return 1;
  8521                                  
  8522                                  .ifEOL483:
  8523 00003C3A B80100                   mov ax, 1
  8524 00003C3D E90600                   jmp .retnifEOL
  8525                                  
  8526                                  ;-955     }
  8527                                  
  8528                                  
  8529                                  ;-956     return 0;
  8530                                  
  8531                                  .ifEOL482:
  8532 00003C40 B80000                   mov ax, 0
  8533 00003C43 E90000                   jmp .retnifEOL
  8534                                  
  8535                                  ;-957 }
  8536                                  
  8537                                  
  8538                                  ;-958 
  8539                                  
  8540                                  
  8541                                  ;-959 int end1(int n) {
  8542                                  
  8543 00003C46 C9                       .retnifEOL: LEAVE
  8544 00003C47 C3                       ret
  8545                                  ENDP
  8546                                  
  8547                                  end1: PROC
  8548                                  
  8549                                  ;-960     fcloseR(fdin);
  8550                                  ;
  8551 00003C48 C8000000                 ENTER  0,0
  8552 00003C4C FF36[1A00]               push word [fdin]
  8553 00003C50 E886C4                   call fcloseR
  8554 00003C53 83C402                   add  sp, 2
  8555                                  
  8556                                  ;-961     fcloseR(fdout);
  8557                                  
  8558 00003C56 FF36[1C00]               push word [fdout]
  8559 00003C5A E87CC4                   call fcloseR
  8560 00003C5D 83C402                   add  sp, 2
  8561                                  
  8562                                  ;-962     exitR(n);
  8563                                  
  8564 00003C60 FF7604                   push word [bp+4]
  8565 00003C63 E882C4                   call exitR
  8566 00003C66 83C402                   add  sp, 2
  8567                                  
  8568                                  ;-963 }
  8569                                  
  8570                                  
  8571                                  ;-964 int error1(char *s) {
  8572 00003C69 C9                       LEAVE
  8573 00003C6A C3                       ret
  8574                                  ENDP
  8575                                  
  8576                                  error1: PROC
  8577                                  
  8578                                  ;-965     lineno--;
  8579                                  ;
  8580 00003C6B C8000000                 ENTER  0,0
  8581 00003C6F FF0E[4900]               dec  word[lineno]
  8582                                  
  8583                                  ;-966     prnl();
  8584                                  
  8585 00003C73 E8A2C8                   call prnl
  8586                                  
  8587                                  ;-967     prscomment(&fgetsdest);
  8588                                  
  8589 00003C76 8D06A0D9                 lea  ax, [fgetsdest]
  8590 00003C7A 50                       push ax
  8591 00003C7B E86CC8                   call prscomment
  8592 00003C7E 83C402                   add  sp, 2
  8593                                  
  8594                                  ;-968     prs(";Line: ");
  8595                                  
  8596 00003C81 68[EA3C]                 push error1_0
  8597 00003C84 E89FC8                   call prs
  8598 00003C87 83C402                   add  sp, 2
  8599                                  
  8600                                  ;-969     prunsign1(lineno);
  8601                                  
  8602 00003C8A FF36[4900]               push word [lineno]
  8603 00003C8E E8EAC9                   call prunsign1
  8604 00003C91 83C402                   add  sp, 2
  8605                                  
  8606                                  ;-970     prs(" ************** ERROR: ");
  8607                                  
  8608 00003C94 68[F23C]                 push error1_1
  8609 00003C97 E88CC8                   call prs
  8610 00003C9A 83C402                   add  sp, 2
  8611                                  
  8612                                  ;-971     prs(s);
  8613                                  
  8614 00003C9D FF7604                   push word [bp+4]
  8615 00003CA0 E883C8                   call prs
  8616 00003CA3 83C402                   add  sp, 2
  8617                                  
  8618                                  ;-972     prs("  in column: ");
  8619                                  
  8620 00003CA6 68[0A3D]                 push error1_2
  8621 00003CA9 E87AC8                   call prs
  8622 00003CAC 83C402                   add  sp, 2
  8623                                  
  8624                                  ;-973     prunsign1(column);
  8625                                  
  8626 00003CAF FF36[2100]               push word [column]
  8627 00003CB3 E8C5C9                   call prunsign1
  8628 00003CB6 83C402                   add  sp, 2
  8629                                  
  8630                                  ;-974     prs("\nToken: ");
  8631                                  
  8632 00003CB9 68[183D]                 push error1_3
  8633 00003CBC E867C8                   call prs
  8634 00003CBF 83C402                   add  sp, 2
  8635                                  
  8636                                  ;-975     prunsign1(token);
  8637                                  
  8638 00003CC2 FF36[1E00]               push word [token]
  8639 00003CC6 E8B2C9                   call prunsign1
  8640 00003CC9 83C402                   add  sp, 2
  8641                                  
  8642                                  ;-976 //    prs(", globC: ");
  8643                                  
  8644                                  
  8645                                  ;-977 //    prc(globC);
  8646                                  
  8647                                  
  8648                                  ;-978 //    prs(", thechar: ");
  8649                                  
  8650                                  
  8651                                  ;-979 //    prunsign1(thechar);
  8652                                  
  8653                                  
  8654                                  ;-980     prs(", symbol: ");
  8655                                  
  8656 00003CCC 68[223D]                 push error1_4
  8657 00003CCF E854C8                   call prs
  8658 00003CD2 83C402                   add  sp, 2
  8659                                  
  8660                                  ;-981     prs(symbol);
  8661                                  
  8662 00003CD5 8D06BB69                 lea  ax, [symbol]
  8663 00003CD9 50                       push ax
  8664 00003CDA E849C8                   call prs
  8665 00003CDD 83C402                   add  sp, 2
  8666                                  
  8667                                  ;-982     end1(1);
  8668                                  
  8669 00003CE0 6A01                     push 1
  8670 00003CE2 E863FF                   call end1
  8671 00003CE5 83C402                   add  sp, 2
  8672                                  
  8673                                  ;-983 }
  8674                                  
  8675                                  
  8676                                  ;-984 
  8677                                  
  8678                                  
  8679                                  ;-985 unsigned int MAXUI=65535;
  8680 00003CE8 C9                       LEAVE
  8681 00003CE9 C3                       ret
  8682 00003CEA 3B4C696E653A2000        error1_0 db ";Line: ",0
  8683 00003CF2 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  8684 00003CFB 2A2A2A2A2A2A204552-
  8685 00003D04 524F523A2000       
  8686 00003D0A 2020696E20636F6C75-     error1_2 db "  in column: ",0
  8687 00003D13 6D6E3A2000         
  8688 00003D18 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  8689 00003D21 00                 
  8690 00003D22 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  8691 00003D2B 2000               
  8692                                  ENDP
  8693 00003D2D FFFF                    MAXUI dw 65535
  8694                                  
  8695                                  ;-986 int epilog() {
  8696                                  
  8697                                  
  8698                                  epilog: PROC
  8699                                  
  8700                                  ;-987     unsigned int i;
  8701                                  
  8702                                  
  8703                                  ;-988     prs("\n;Input: "); prs(&namein);
  8704                                  ;
  8705 00003D2F C8020000                 ENTER  2,0
  8706 00003D33 68[A33E]                 push epilog_0
  8707 00003D36 E8EDC7                   call prs
  8708 00003D39 83C402                   add  sp, 2
  8709 00003D3C 8D067E6A                 lea  ax, [namein]
  8710 00003D40 50                       push ax
  8711 00003D41 E8E2C7                   call prs
  8712 00003D44 83C402                   add  sp, 2
  8713                                  
  8714                                  ;-989     prs(", List: ");   prs(&namelst);
  8715                                  
  8716 00003D47 68[AE3E]                 push epilog_1
  8717 00003D4A E8D9C7                   call prs
  8718 00003D4D 83C402                   add  sp, 2
  8719 00003D50 8D06C16A                 lea  ax, [namelst]
  8720 00003D54 50                       push ax
  8721 00003D55 E8CEC7                   call prs
  8722 00003D58 83C402                   add  sp, 2
  8723                                  
  8724                                  ;-990     prs(",  Lines:"); printint51(lineno);
  8725                                  
  8726 00003D5B 68[B73E]                 push epilog_2
  8727 00003D5E E8C5C7                   call prs
  8728 00003D61 83C402                   add  sp, 2
  8729 00003D64 FF36[4900]               push word [lineno]
  8730 00003D68 E854C9                   call printint51
  8731 00003D6B 83C402                   add  sp, 2
  8732                                  
  8733                                  ;-991     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  8734                                  
  8735 00003D6E 68[C13E]                 push epilog_3
  8736 00003D71 E8B2C7                   call prs
  8737 00003D74 83C402                   add  sp, 2
  8738 00003D77 FF0E[3900]               dec  word[GTop]
  8739 00003D7B FF36[3900]               push word [GTop]
  8740 00003D7F E83DC9                   call printint51
  8741 00003D82 83C402                   add  sp, 2
  8742                                  
  8743                                  ;-992     prs(" max.:"); printint51(LSTART);
  8744                                  
  8745 00003D85 68[D53E]                 push epilog_4
  8746 00003D88 E89BC7                   call prs
  8747 00003D8B 83C402                   add  sp, 2
  8748 00003D8E 68C800                   push 200
  8749 00003D91 E82BC9                   call printint51
  8750 00003D94 83C402                   add  sp, 2
  8751                                  
  8752                                  ;-993     prs("\n;Functions      :"); printint51(FTop);
  8753                                  
  8754 00003D97 68[DC3E]                 push epilog_5
  8755 00003D9A E889C7                   call prs
  8756 00003D9D 83C402                   add  sp, 2
  8757 00003DA0 FF36[3D00]               push word [FTop]
  8758 00003DA4 E818C9                   call printint51
  8759 00003DA7 83C402                   add  sp, 2
  8760                                  
  8761                                  ;-994     prs(" max.:"); printint51(FUNCMAX);
  8762                                  
  8763 00003DAA 68[F03E]                 push epilog_6
  8764 00003DAD E876C7                   call prs
  8765 00003DB0 83C402                   add  sp, 2
  8766 00003DB3 682C01                   push 300
  8767 00003DB6 E806C9                   call printint51
  8768 00003DB9 83C402                   add  sp, 2
  8769                                  
  8770                                  ;-995     prs("\n;Calls          :"); printint51(CTop);
  8771                                  
  8772 00003DBC 68[F73E]                 push epilog_7
  8773 00003DBF E864C7                   call prs
  8774 00003DC2 83C402                   add  sp, 2
  8775 00003DC5 FF36[4300]               push word [CTop]
  8776 00003DC9 E8F3C8                   call printint51
  8777 00003DCC 83C402                   add  sp, 2
  8778                                  
  8779                                  ;-996     prs(" max.:"); printint51(CALLMAX);
  8780                                  
  8781 00003DCF 68[0B3F]                 push epilog_8
  8782 00003DD2 E851C7                   call prs
  8783 00003DD5 83C402                   add  sp, 2
  8784 00003DD8 68DC05                   push 1500
  8785 00003DDB E8E1C8                   call printint51
  8786 00003DDE 83C402                   add  sp, 2
  8787                                  
  8788                                  ;-997     i = CNamePtr - &CNameField;
  8789                                  
  8790 00003DE1 A1[3F00]                 mov ax, [CNamePtr]
  8791 00003DE4 2D80B2                   sub ax, CNameField
  8792 00003DE7 8946FE                   mov [bp-2], ax
  8793                                  
  8794                                  ;-998     prs("\n;NameField      :"); printint51(i);
  8795                                  
  8796 00003DEA 68[123F]                 push epilog_9
  8797 00003DED E836C7                   call prs
  8798 00003DF0 83C402                   add  sp, 2
  8799 00003DF3 FF76FE                   push word [bp-2]
  8800 00003DF6 E8C6C8                   call printint51
  8801 00003DF9 83C402                   add  sp, 2
  8802                                  
  8803                                  ;-999     prs(" max.:"); printint51(CNAMEMAX);
  8804                                  
  8805 00003DFC 68[263F]                 push epilog_10
  8806 00003DFF E824C7                   call prs
  8807 00003E02 83C402                   add  sp, 2
  8808 00003E05 681027                   push 10000
  8809 00003E08 E8B4C8                   call printint51
  8810 00003E0B 83C402                   add  sp, 2
  8811                                  
  8812                                  ;-1000     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
  8813                                  
  8814 00003E0E 68[2D3F]                 push epilog_11
  8815 00003E11 E812C7                   call prs
  8816 00003E14 83C402                   add  sp, 2
  8817 00003E17 8D067869                 lea  ax, [coname]
  8818 00003E1B 50                       push ax
  8819 00003E1C E807C7                   call prs
  8820 00003E1F 83C402                   add  sp, 2
  8821 00003E22 68[3B3F]                 push epilog_12
  8822 00003E25 E8FEC6                   call prs
  8823 00003E28 83C402                   add  sp, 2
  8824 00003E2B FF36[1400]               push word [maxco]
  8825 00003E2F E88DC8                   call printint51
  8826 00003E32 83C402                   add  sp, 2
  8827                                  
  8828                                  ;-1001     prs(" max.:"); printint51(COMAX);
  8829                                  
  8830 00003E35 68[3F3F]                 push epilog_13
  8831 00003E38 E8EBC6                   call prs
  8832 00003E3B 83C402                   add  sp, 2
  8833 00003E3E 68D007                   push 2000
  8834 00003E41 E87BC8                   call printint51
  8835 00003E44 83C402                   add  sp, 2
  8836                                  
  8837                                  ;-1002     i=COMAX; i=i-maxco;
  8838                                  
  8839 00003E47 B8D007                   mov ax, 2000
  8840 00003E4A 8946FE                   mov [bp-2], ax
  8841 00003E4D 8B46FE                   mov ax, [bp-2]
  8842 00003E50 2B06[1400]               sub ax, [maxco]
  8843 00003E54 8946FE                   mov [bp-2], ax
  8844                                  
  8845                                  ;-1003     if (i <= 1000)prs(" *** Warning *** constant area too small");
  8846                                  
  8847 00003E57 8B46FE                   mov ax, [bp-2]
  8848 00003E5A 3DE803                   cmp ax, 1000
  8849 00003E5D 0F870900                 ja  .epilog484
  8850 00003E61 68[463F]                 push epilog_14
  8851 00003E64 E8BFC6                   call prs
  8852 00003E67 83C402                   add  sp, 2
  8853                                  
  8854                                  ;-1004     prs(", stacksize: ");
  8855                                  
  8856                                  .epilog484:
  8857 00003E6A 68[6F3F]                 push epilog_15
  8858 00003E6D E8B6C6                   call prs
  8859 00003E70 83C402                   add  sp, 2
  8860                                  
  8861                                  ;-1005     i=MAXUI-orgData; printint51(i);
  8862                                  
  8863 00003E73 A1[2D3D]                 mov ax, [MAXUI]
  8864 00003E76 2B06[1200]               sub ax, [orgData]
  8865 00003E7A 8946FE                   mov [bp-2], ax
  8866 00003E7D FF76FE                   push word [bp-2]
  8867 00003E80 E83CC8                   call printint51
  8868 00003E83 83C402                   add  sp, 2
  8869                                  
  8870                                  ;-1006     if (i <= 1000) prs(" *** Warning *** Stack too small");
  8871                                  
  8872 00003E86 8B46FE                   mov ax, [bp-2]
  8873 00003E89 3DE803                   cmp ax, 1000
  8874 00003E8C 0F870900                 ja  .epilog485
  8875 00003E90 68[7D3F]                 push epilog_16
  8876 00003E93 E890C6                   call prs
  8877 00003E96 83C402                   add  sp, 2
  8878                                  
  8879                                  ;-1007   end1(0);}
  8880                                  
  8881                                  .epilog485:
  8882 00003E99 6A00                     push 0
  8883 00003E9B E8AAFD                   call end1
  8884 00003E9E 83C402                   add  sp, 2
  8885                                  
  8886                                  ;-1008 
  8887                                  
  8888                                  
  8889                                  ;-1009 int dodefine() {
  8890 00003EA1 C9                       LEAVE
  8891 00003EA2 C3                       ret
  8892 00003EA3 5C6E3B496E7075743A-     epilog_0 db "\n;Input: ",0
  8893 00003EAC 2000               
  8894 00003EAE 2C204C6973743A2000      epilog_1 db ", List: ",0
  8895 00003EB7 2C20204C696E65733A-     epilog_2 db ",  Lines:",0
  8896 00003EC0 00                 
  8897 00003EC1 5C6E3B476C6F622E20-     epilog_3 db "\n;Glob. variables:",0
  8898 00003ECA 7661726961626C6573-
  8899 00003ED3 3A00               
  8900 00003ED5 206D61782E3A00          epilog_4 db " max.:",0
  8901 00003EDC 5C6E3B46756E637469-     epilog_5 db "\n;Functions      :",0
  8902 00003EE5 6F6E73202020202020-
  8903 00003EEE 3A00               
  8904 00003EF0 206D61782E3A00          epilog_6 db " max.:",0
  8905 00003EF7 5C6E3B43616C6C7320-     epilog_7 db "\n;Calls          :",0
  8906 00003F00 202020202020202020-
  8907 00003F09 3A00               
  8908 00003F0B 206D61782E3A00          epilog_8 db " max.:",0
  8909 00003F12 5C6E3B4E616D654669-     epilog_9 db "\n;NameField      :",0
  8910 00003F1B 656C64202020202020-
  8911 00003F24 3A00               
  8912 00003F26 206D61782E3A00          epilog_10 db " max.:",0
  8913 00003F2D 5C6E3B436F6E737420-     epilog_11 db "\n;Const in '",0
  8914 00003F36 696E202700         
  8915 00003F3B 27203A00                epilog_12 db "' :",0
  8916 00003F3F 206D61782E3A00          epilog_13 db " max.:",0
  8917 00003F46 202A2A2A205761726E-     epilog_14 db " *** Warning *** constant area too small",0
  8918 00003F4F 696E67202A2A2A2063-
  8919 00003F58 6F6E7374616E742061-
  8920 00003F61 72656120746F6F2073-
  8921 00003F6A 6D616C6C00         
  8922 00003F6F 2C20737461636B7369-     epilog_15 db ", stacksize: ",0
  8923 00003F78 7A653A2000         
  8924 00003F7D 202A2A2A205761726E-     epilog_16 db " *** Warning *** Stack too small",0
  8925 00003F86 696E67202A2A2A2053-
  8926 00003F8F 7461636B20746F6F20-
  8927 00003F98 736D616C6C00       
  8928                                  ENDP
  8929                                  
  8930                                  dodefine: PROC
  8931                                  
  8932                                  ;-1010     int i; int j; int fdtemp;
  8933                                  
  8934                                  
  8935                                  ;-1011     if (eqstr(symbol, "ORGDATA")) {
  8936                                  ;
  8937 00003F9E C8060000                 ENTER  6,0
  8938 00003FA2 68[8840]                 push dodefine_0
  8939 00003FA5 8D06BB69                 lea  ax, [symbol]
  8940 00003FA9 50                       push ax
  8941 00003FAA E8B5C2                   call eqstr
  8942 00003FAD 83C404                   add  sp, 4
  8943 00003FB0 08C0                     or  al, al
  8944 00003FB2 0F841500                 je .dodefine486
  8945                                  
  8946                                  ;-1012         token=getlex();
  8947                                  
  8948 00003FB6 E83BF2                   call getlex
  8949 00003FB9 A3[1E00]                 mov word [token], ax
  8950                                  
  8951                                  ;-1013         ORGDATAORIG=lexval;
  8952                                  
  8953 00003FBC A1[2C00]                 mov ax, [lexval]
  8954 00003FBF A3[1000]                 mov word [ORGDATAORIG], ax
  8955                                  
  8956                                  ;-1014         orgData=lexval;
  8957                                  
  8958 00003FC2 A1[2C00]                 mov ax, [lexval]
  8959 00003FC5 A3[1200]                 mov word [orgData], ax
  8960                                  
  8961                                  ;-1015         return;
  8962                                  
  8963 00003FC8 E9BB00                   jmp .retndodefine
  8964                                  
  8965                                  ;-1016     }
  8966                                  
  8967                                  
  8968                                  ;-1017     expect(T_NAME);
  8969                                  
  8970                                  .dodefine486:
  8971 00003FCB 680001                   push 256
  8972 00003FCE E845C4                   call expect
  8973 00003FD1 83C402                   add  sp, 2
  8974                                  
  8975                                  ;-1018     if (token==T_CONST) {
  8976                                  
  8977 00003FD4 A1[1E00]                 mov ax, [token]
  8978 00003FD7 3D0101                   cmp ax, 257
  8979 00003FDA 0F85A800                 jne .dodefine487
  8980                                  
  8981                                  ;-1019         if (GTop >= LSTART) error1("global table (define) full");
  8982                                  
  8983 00003FDE A1[3900]                 mov ax, [GTop]
  8984 00003FE1 3DC800                   cmp ax, 200 ;unsigned : 1
  8985 00003FE4 0F8C0900                 jl  .dodefine488
  8986 00003FE8 68[9040]                 push dodefine_1
  8987 00003FEB E87DFC                   call error1
  8988 00003FEE 83C402                   add  sp, 2
  8989                                  
  8990                                  ;-1020         i=strlen(symbol);
  8991                                  
  8992                                  .dodefine488:
  8993 00003FF1 8D06BB69                 lea  ax, [symbol]
  8994 00003FF5 50                       push ax
  8995 00003FF6 E80BC2                   call strlen
  8996 00003FF9 83C402                   add  sp, 2
  8997 00003FFC 8946FE                   mov [bp-2], ax
  8998                                  
  8999                                  ;-1021         if (i>15) error1("Define name longer 15 char");
  9000                                  
  9001 00003FFF 8B46FE                   mov ax, [bp-2]
  9002 00004002 83F80F                   cmp ax, 15
  9003 00004005 0F8E0900                 jle .dodefine489
  9004 00004009 68[AB40]                 push dodefine_2
  9005 0000400C E85CFC                   call error1
  9006 0000400F 83C402                   add  sp, 2
  9007                                  
  9008                                  ;-1022         GSign [GTop]='U';
  9009                                  
  9010                                  .dodefine489:
  9011 00004012 B85500                   mov ax, 85
  9012 00004015 8B1E[3900]               mov bx, [GTop]
  9013 00004019 8887306C                 mov [GSign+bx], al
  9014                                  
  9015                                  ;-1023         GWidth[GTop]=1;
  9016                                  
  9017 0000401D B80100                   mov ax, 1
  9018 00004020 8B1E[3900]               mov bx, [GTop]
  9019 00004024 88875C6D                 mov [GWidth+bx], al
  9020                                  
  9021                                  ;-1024         GType [GTop]='#';
  9022                                  
  9023 00004028 B82300                   mov ax, 35
  9024 0000402B 8B1E[3900]               mov bx, [GTop]
  9025 0000402F 8887046B                 mov [GType+bx], al
  9026                                  
  9027                                  ;-1025         GAdr [GTop]=lineno-1;
  9028                                  
  9029 00004033 A1[4900]                 mov ax, [lineno]
  9030 00004036 83E801                   sub ax, 1
  9031 00004039 8B1E[3900]               mov bx, [GTop]
  9032 0000403D D1E3                     shl bx, 1
  9033 0000403F 8987886E                 mov [GAdr+bx], ax
  9034                                  
  9035                                  ;-1026         GUsed [GTop]=0;
  9036                                  
  9037 00004043 B80000                   mov ax, 0
  9038 00004046 8B1E[3900]               mov bx, [GTop]
  9039 0000404A D1E3                     shl bx, 1
  9040 0000404C 8987E070                 mov [GUsed+bx], ax
  9041                                  
  9042                                  ;-1027         pt=adrofname(GTop);
  9043                                  
  9044 00004050 FF36[3900]               push word [GTop]
  9045 00004054 E8A5CB                   call adrofname
  9046 00004057 83C402                   add  sp, 2
  9047 0000405A A3[4B00]                 mov word [pt], ax
  9048                                  
  9049                                  ;-1028         strcpy(pt, symbol);
  9050                                  
  9051 0000405D 8D06BB69                 lea  ax, [symbol]
  9052 00004061 50                       push ax
  9053 00004062 FF36[4B00]               push word [pt]
  9054 00004066 E8C3C1                   call strcpy
  9055 00004069 83C404                   add  sp, 4
  9056                                  
  9057                                  ;-1029         GData[GTop]=lexval;
  9058                                  
  9059 0000406C A1[2C00]                 mov ax, [lexval]
  9060 0000406F 8B1E[3900]               mov bx, [GTop]
  9061 00004073 D1E3                     shl bx, 1
  9062 00004075 89873873                 mov [GData+bx], ax
  9063                                  
  9064                                  ;-1030         expect(T_CONST);
  9065                                  
  9066 00004079 680101                   push 257
  9067 0000407C E897C3                   call expect
  9068 0000407F 83C402                   add  sp, 2
  9069                                  
  9070                                  ;-1031         GTop++;
  9071                                  
  9072 00004082 FF06[3900]               inc  word[GTop]
  9073                                  
  9074                                  ;-1032     }
  9075                                  
  9076                                  
  9077                                  ;-1033 }
  9078                                  
  9079                                  .dodefine487:
  9080                                  
  9081                                  ;-1034 
  9082                                  
  9083                                  
  9084                                  ;-1035 int parse() {
  9085                                  
  9086 00004086 C9                       .retndodefine: LEAVE
  9087 00004087 C3                       ret
  9088 00004088 4F52474441544100        dodefine_0 db "ORGDATA",0
  9089 00004090 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  9090 00004099 626C65202864656669-
  9091 000040A2 6E65292066756C6C00 
  9092 000040AB 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  9093 000040B4 6D65206C6F6E676572-
  9094 000040BD 203135206368617200 
  9095                                  ENDP
  9096                                  
  9097                                  parse: PROC
  9098                                  
  9099                                  ;-1036     CNamePtr = &CNameField;
  9100                                  
  9101 000040C6 B880B2                   mov ax, CNameField
  9102 000040C9 A3[3F00]                 mov word [CNamePtr], ax
  9103                                  
  9104                                  ;-1037     token=getlex();
  9105                                  
  9106 000040CC E825F1                   call getlex
  9107 000040CF A3[1E00]                 mov word [token], ax
  9108                                  
  9109                                  ;-1038     do {
  9110                                  
  9111                                  .parse490:
  9112                                  
  9113                                  ;-1039         if (token <= 0) return 1;
  9114                                  
  9115 000040D2 A1[1E00]                 mov ax, [token]
  9116 000040D5 83F800                   cmp ax, 0
  9117 000040D8 0F8F0600                 jg  .parse491
  9118 000040DC B80100                   mov ax, 1
  9119 000040DF E95000                   jmp .retnparse
  9120                                  
  9121                                  ;-1040         if (istoken('#')) {
  9122                                  
  9123                                  .parse491:
  9124 000040E2 6A23                     push 35
  9125 000040E4 E80DC3                   call istoken
  9126 000040E7 83C402                   add  sp, 2
  9127 000040EA 08C0                     or  al, al
  9128 000040EC 0F842100                 je .parse492
  9129                                  
  9130                                  ;-1041              if (istoken(T_DEFINE))  dodefine();
  9131                                  
  9132 000040F0 68FF01                   push 511
  9133 000040F3 E8FEC2                   call istoken
  9134 000040F6 83C402                   add  sp, 2
  9135 000040F9 08C0                     or  al, al
  9136 000040FB 0F840600                 je .parse493
  9137 000040FF E89CFE                   call dodefine
  9138                                  
  9139                                  ;-1042              else error1("define expected");
  9140                                  
  9141 00004102 E90900                   jmp .parse494
  9142                                  .parse493:
  9143 00004105 68[3341]                 push parse_0
  9144 00004108 E860FB                   call error1
  9145 0000410B 83C402                   add  sp, 2
  9146                                  
  9147                                  ;-1043         }
  9148                                  
  9149                                  .parse494:
  9150                                  
  9151                                  ;-1044     else{
  9152                                  
  9153 0000410E E91600                   jmp .parse495
  9154                                  .parse492:
  9155                                  
  9156                                  ;-1045         typeName();
  9157                                  
  9158 00004111 E83ECC                   call typeName
  9159                                  
  9160                                  ;-1046         if (token=='(') dofunc();
  9161                                  
  9162 00004114 A1[1E00]                 mov ax, [token]
  9163 00004117 83F828                   cmp ax, 40
  9164 0000411A 0F850600                 jne .parse496
  9165 0000411E E837CF                   call dofunc
  9166                                  
  9167                                  ;-1047         else doglob(); }
  9168                                  
  9169 00004121 E90300                   jmp .parse497
  9170                                  .parse496:
  9171 00004124 E8EFC5                   call doglob
  9172                                  .parse497:
  9173                                  
  9174                                  ;-1048     } while(1);
  9175                                  
  9176                                  .parse495:
  9177 00004127 B80100                   mov ax, 1
  9178 0000412A 08C0                     or  al, al
  9179 0000412C 0F840200                 je .parse498
  9180 00004130 EBA0                     jmp .parse490
  9181                                  .parse498:
  9182                                  
  9183                                  ;-1049 }
  9184                                  
  9185                                  
  9186                                  ;-1050 
  9187                                  
  9188                                  
  9189                                  ;-1051 int getfirstchar() {
  9190                                  
  9191                                   .retnparse:
  9192 00004132 C3                       ret
  9193 00004133 646566696E65206578-     parse_0 db "define expected",0
  9194 0000413C 70656374656400     
  9195                                  ENDP
  9196                                  
  9197                                  getfirstchar: PROC
  9198                                  
  9199                                  ;-1052     fgetsp=&fgetsdest;
  9200                                  
  9201 00004143 B8A0D9                   mov ax, fgetsdest
  9202 00004146 A3[4500]                 mov word [fgetsp], ax
  9203                                  
  9204                                  ;-1053     *fgetsp=0;
  9205                                  
  9206 00004149 B80000                   mov ax, 0
  9207 0000414C 8B1E[4500]               mov  bx, [fgetsp]
  9208 00004150 8807                     mov  [bx], al
  9209                                  
  9210                                  ;-1054     thechar=fgets1();
  9211                                  
  9212 00004152 E8A5F9                   call fgets1
  9213 00004155 A2[2300]                 mov byte [thechar], al
  9214                                  
  9215                                  ;-1055     }
  9216                                  
  9217                                  
  9218                                  ;-1056 
  9219                                  
  9220                                  
  9221                                  ;-1057 char *arglen=0x80; char *argv=0x82;
  9222                                  
  9223 00004158 C3                       ret
  9224                                  ENDP
  9225 00004159 8000                    arglen dw 128
  9226 0000415B 8200                    argv dw 130
  9227                                  
  9228                                  ;-1058 int getarg() {
  9229                                  
  9230                                  
  9231                                  getarg: PROC
  9232                                  
  9233                                  ;-1059     int arglen1; int i; char *c;
  9234                                  
  9235                                  
  9236                                  ;-1060     arglen1=*arglen;
  9237                                  ;
  9238 0000415D C8060000                 ENTER  6,0
  9239 00004161 8B1E[5941]               mov bx, [arglen]
  9240 00004165 8A07                     mov al, [bx]
  9241 00004167 B400                     mov ah, 0
  9242 00004169 8946FE                   mov [bp-2], ax
  9243                                  
  9244                                  ;-1061     if (arglen1 == 0) {
  9245                                  
  9246 0000416C 8B46FE                   mov ax, [bp-2]
  9247 0000416F 83F800                   cmp ax, 0
  9248 00004172 0F851C00                 jne .getarg499
  9249                                  
  9250                                  ;-1062         cputs(Version1);
  9251                                  
  9252 00004176 8D06[0300]               lea  ax, [Version1]
  9253 0000417A 50                       push ax
  9254 0000417B E8F8BE                   call cputs
  9255 0000417E 83C402                   add  sp, 2
  9256                                  
  9257                                  ;-1063         cputs(" Usage: A.COM in_file[.C]: ");
  9258                                  
  9259 00004181 68[C042]                 push getarg_0
  9260 00004184 E8EFBE                   call cputs
  9261 00004187 83C402                   add  sp, 2
  9262                                  
  9263                                  ;-1064         exitR(3);
  9264                                  
  9265 0000418A 6A03                     push 3
  9266 0000418C E859BF                   call exitR
  9267 0000418F 83C402                   add  sp, 2
  9268                                  
  9269                                  ;-1065         }
  9270                                  
  9271                                  
  9272                                  ;-1066     i=arglen1+129;
  9273                                  
  9274                                  .getarg499:
  9275 00004192 8B46FE                   mov ax, [bp-2]
  9276 00004195 058100                   add ax, 129
  9277 00004198 8946FC                   mov [bp-4], ax
  9278                                  
  9279                                  ;-1067     *i=0;
  9280                                  
  9281 0000419B B80000                   mov ax, 0
  9282 0000419E 8B5EFC                   mov  bx, [bp-4]
  9283 000041A1 8907                     mov  [bx], ax
  9284                                  
  9285                                  ;-1068     arglen1--;
  9286                                  
  9287 000041A3 FF4EFE                   dec  word[bp-2]
  9288                                  
  9289                                  ;-1069     toupper(argv);
  9290                                  
  9291 000041A6 FF36[5B41]               push word [argv]
  9292 000041AA E826C1                   call toupper
  9293 000041AD 83C402                   add  sp, 2
  9294                                  
  9295                                  ;-1070     strcpy(namein, argv);
  9296                                  
  9297 000041B0 FF36[5B41]               push word [argv]
  9298 000041B4 8D067E6A                 lea  ax, [namein]
  9299 000041B8 50                       push ax
  9300 000041B9 E870C0                   call strcpy
  9301 000041BC 83C404                   add  sp, 4
  9302                                  
  9303                                  ;-1071     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9304                                  
  9305 000041BF 6A2E                     push 46
  9306 000041C1 8D067E6A                 lea  ax, [namein]
  9307 000041C5 50                       push ax
  9308 000041C6 E84DC1                   call instr1
  9309 000041C9 83C404                   add  sp, 4
  9310 000041CC 83F800                   cmp ax, 0
  9311 000041CF 0F850E00                 jne .getarg500
  9312 000041D3 68[DC42]                 push getarg_1
  9313 000041D6 8D067E6A                 lea  ax, [namein]
  9314 000041DA 50                       push ax
  9315 000041DB E8D0C0                   call strcat1
  9316 000041DE 83C404                   add  sp, 4
  9317                                  
  9318                                  ;-1072     strcpy(namelst, namein);
  9319                                  
  9320                                  .getarg500:
  9321 000041E1 8D067E6A                 lea  ax, [namein]
  9322 000041E5 50                       push ax
  9323 000041E6 8D06C16A                 lea  ax, [namelst]
  9324 000041EA 50                       push ax
  9325 000041EB E83EC0                   call strcpy
  9326 000041EE 83C404                   add  sp, 4
  9327                                  
  9328                                  ;-1073     i=strlen(namelst);
  9329                                  
  9330 000041F1 8D06C16A                 lea  ax, [namelst]
  9331 000041F5 50                       push ax
  9332 000041F6 E80BC0                   call strlen
  9333 000041F9 83C402                   add  sp, 2
  9334 000041FC 8946FC                   mov [bp-4], ax
  9335                                  
  9336                                  ;-1074     i--;
  9337                                  
  9338 000041FF FF4EFC                   dec  word[bp-4]
  9339                                  
  9340                                  ;-1075     c=&namelst+i;
  9341                                  
  9342 00004202 B8C16A                   mov ax, namelst
  9343 00004205 0346FC                   add ax, [bp-4]
  9344 00004208 8946FA                   mov [bp-6], ax
  9345                                  
  9346                                  ;-1076     *c='S';
  9347                                  
  9348 0000420B B85300                   mov ax, 83
  9349 0000420E 8B5EFA                   mov  bx, [bp-6]
  9350 00004211 8807                     mov  [bx], al
  9351                                  
  9352                                  ;-1077 
  9353                                  
  9354                                  
  9355                                  ;-1078     fdin=openR (namein);
  9356                                  
  9357 00004213 8D067E6A                 lea  ax, [namein]
  9358 00004217 50                       push ax
  9359 00004218 E89DBE                   call openR
  9360 0000421B 83C402                   add  sp, 2
  9361 0000421E A3[1A00]                 mov word [fdin], ax
  9362                                  
  9363                                  ;-1079     if(DOS_ERR){
  9364                                  
  9365 00004221 A1[4F00]                 mov ax, [DOS_ERR]
  9366 00004224 08C0                     or  al, al
  9367 00004226 0F841C00                 je .getarg501
  9368                                  
  9369                                  ;-1080         cputs("Source file missing (.C): ");
  9370                                  
  9371 0000422A 68[DF42]                 push getarg_2
  9372 0000422D E846BE                   call cputs
  9373 00004230 83C402                   add  sp, 2
  9374                                  
  9375                                  ;-1081         cputs(namein);
  9376                                  
  9377 00004233 8D067E6A                 lea  ax, [namein]
  9378 00004237 50                       push ax
  9379 00004238 E83BBE                   call cputs
  9380 0000423B 83C402                   add  sp, 2
  9381                                  
  9382                                  ;-1082         exitR(1);
  9383                                  
  9384 0000423E 6A01                     push 1
  9385 00004240 E8A5BE                   call exitR
  9386 00004243 83C402                   add  sp, 2
  9387                                  
  9388                                  ;-1083         }
  9389                                  
  9390                                  
  9391                                  ;-1084     fdout=creatR(namelst);
  9392                                  
  9393                                  .getarg501:
  9394 00004246 8D06C16A                 lea  ax, [namelst]
  9395 0000424A 50                       push ax
  9396 0000424B E879BE                   call creatR
  9397 0000424E 83C402                   add  sp, 2
  9398 00004251 A3[1C00]                 mov word [fdout], ax
  9399                                  
  9400                                  ;-1085     if(DOS_ERR){
  9401                                  
  9402 00004254 A1[4F00]                 mov ax, [DOS_ERR]
  9403 00004257 08C0                     or  al, al
  9404 00004259 0F841C00                 je .getarg502
  9405                                  
  9406                                  ;-1086         cputs("list file not creatable: ");
  9407                                  
  9408 0000425D 68[FA42]                 push getarg_3
  9409 00004260 E813BE                   call cputs
  9410 00004263 83C402                   add  sp, 2
  9411                                  
  9412                                  ;-1087         cputs(namelst);
  9413                                  
  9414 00004266 8D06C16A                 lea  ax, [namelst]
  9415 0000426A 50                       push ax
  9416 0000426B E808BE                   call cputs
  9417 0000426E 83C402                   add  sp, 2
  9418                                  
  9419                                  ;-1088         exitR(2);
  9420                                  
  9421 00004271 6A02                     push 2
  9422 00004273 E872BE                   call exitR
  9423 00004276 83C402                   add  sp, 2
  9424                                  
  9425                                  ;-1089         }
  9426                                  
  9427                                  
  9428                                  ;-1090     prs("\n; ");
  9429                                  
  9430                                  .getarg502:
  9431 00004279 68[1443]                 push getarg_4
  9432 0000427C E8A7C2                   call prs
  9433 0000427F 83C402                   add  sp, 2
  9434                                  
  9435                                  ;-1091     prs(Version1);
  9436                                  
  9437 00004282 8D06[0300]               lea  ax, [Version1]
  9438 00004286 50                       push ax
  9439 00004287 E89CC2                   call prs
  9440 0000428A 83C402                   add  sp, 2
  9441                                  
  9442                                  ;-1092     prs(", Source: "); prs(namein);
  9443                                  
  9444 0000428D 68[1943]                 push getarg_5
  9445 00004290 E893C2                   call prs
  9446 00004293 83C402                   add  sp, 2
  9447 00004296 8D067E6A                 lea  ax, [namein]
  9448 0000429A 50                       push ax
  9449 0000429B E888C2                   call prs
  9450 0000429E 83C402                   add  sp, 2
  9451                                  
  9452                                  ;-1093     prs(", Output asm: "); prs(namelst);
  9453                                  
  9454 000042A1 68[2443]                 push getarg_6
  9455 000042A4 E87FC2                   call prs
  9456 000042A7 83C402                   add  sp, 2
  9457 000042AA 8D06C16A                 lea  ax, [namelst]
  9458 000042AE 50                       push ax
  9459 000042AF E874C2                   call prs
  9460 000042B2 83C402                   add  sp, 2
  9461                                  
  9462                                  ;-1094     prs("\norg  256 \njmp main");
  9463                                  
  9464 000042B5 68[3343]                 push getarg_7
  9465 000042B8 E86BC2                   call prs
  9466 000042BB 83C402                   add  sp, 2
  9467                                  
  9468                                  ;-1095 }
  9469                                  
  9470                                  
  9471                                  ;-1096 
  9472                                  
  9473                                  
  9474                                  ;-1097 int main() {
  9475 000042BE C9                       LEAVE
  9476 000042BF C3                       ret
  9477 000042C0 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  9478 000042C9 2E434F4D20696E5F66-
  9479 000042D2 696C655B2E435D3A20-
  9480 000042DB 00                 
  9481 000042DC 2E4300                  getarg_1 db ".C",0
  9482 000042DF 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  9483 000042E8 6C65206D697373696E-
  9484 000042F1 6720282E43293A2000 
  9485 000042FA 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  9486 00004303 206E6F742063726561-
  9487 0000430C 7461626C653A2000   
  9488 00004314 5C6E3B2000              getarg_4 db "\n; ",0
  9489 00004319 2C20536F757263653A-     getarg_5 db ", Source: ",0
  9490 00004322 2000               
  9491 00004324 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  9492 0000432D 61736D3A2000       
  9493 00004333 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  9494 0000433C 36205C6E6A6D70206D-
  9495 00004345 61696E00           
  9496                                  ENDP
  9497                                  
  9498                                  main: PROC
  9499                                  
  9500                                  ;-1098     getarg();
  9501                                  
  9502 00004349 E811FE                   call getarg
  9503                                  
  9504                                  ;-1099     CNameTop=0;
  9505                                  
  9506 0000434C B80000                   mov ax, 0
  9507 0000434F A3[4100]                 mov word [CNameTop], ax
  9508                                  
  9509                                  ;-1100     coname=0;
  9510                                  
  9511 00004352 B80000                   mov ax, 0
  9512 00004355 A27869                   mov byte [coname], al
  9513                                  
  9514                                  ;-1101     orgData=ORGDATAORIG;
  9515                                  
  9516 00004358 A1[1000]                 mov ax, [ORGDATAORIG]
  9517 0000435B A3[1200]                 mov word [orgData], ax
  9518                                  
  9519                                  ;-1102     getfirstchar();
  9520                                  
  9521 0000435E E8E2FD                   call getfirstchar
  9522                                  
  9523                                  ;-1103     parse();
  9524                                  
  9525 00004361 E862FD                   call parse
  9526                                  
  9527                                  ;-1104   epilog();
  9528                                  
  9529 00004364 E8C8F9                   call epilog
  9530                                  
  9531                                  ;-1105 }
  9532                                  
  9533 00004367 C3                       ret
  9534                                  ENDP
  9535                                  ;Input: A.C, List: A.S,  Lines: 1106
  9536                                  ;Glob. variables:  118 max.:  200
  9537                                  ;Functions      :   91 max.:  300
  9538                                  ;Calls          :  786 max.: 1500
  9539                                  ;NameField      : 4999 max.:10000
  9540                                  ;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538
