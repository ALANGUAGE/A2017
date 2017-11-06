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
   511                                  ;-111     __emit__(0xCD,0x21);//inth 0x21;
   512                                  
   513 000000AF CD21                     db 205,33
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
  1041                                  ;-183 int eprc(char c)  {
  1042                                  
  1043 00000346 C9                       .retninstr1: LEAVE
  1044 00000347 C3                       ret
  1045                                  ENDP
  1046                                  
  1047                                  eprc: PROC
  1048                                  
  1049                                  ;-184     *cloc=c;
  1050                                  ;
  1051 00000348 C8000000                 ENTER  0,0
  1052 0000034C 8A4604                   mov al, [bp+4]
  1053 0000034F 8B1E[1800]               mov  bx, [cloc]
  1054 00000353 8807                     mov  [bx], al
  1055                                  
  1056                                  ;-185     cloc++;
  1057                                  
  1058 00000355 FF06[1800]               inc  word[cloc]
  1059                                  
  1060                                  ;-186 }
  1061                                  
  1062                                  
  1063                                  ;-187 int eprs(char *s) {
  1064 00000359 C9                       LEAVE
  1065 0000035A C3                       ret
  1066                                  ENDP
  1067                                  
  1068                                  eprs: PROC
  1069                                  
  1070                                  ;-188     char c;
  1071                                  
  1072                                  
  1073                                  ;-189     while(*s) {
  1074                                  ;
  1075 0000035B C8020000                 ENTER  2,0
  1076                                  .eprs33:
  1077 0000035F 8B5E04                   mov bx, [bp+4]
  1078 00000362 8A07                     mov al, [bx]
  1079 00000364 B400                     mov ah, 0
  1080 00000366 08C0                     or  al, al
  1081 00000368 0F841B00                 je .eprs34
  1082                                  
  1083                                  ;-190         c=*s;
  1084                                  
  1085 0000036C 8B5E04                   mov bx, [bp+4]
  1086 0000036F 8A07                     mov al, [bx]
  1087 00000371 B400                     mov ah, 0
  1088 00000373 8846FE                   mov [bp-2], al
  1089                                  
  1090                                  ;-191         eprc(c);
  1091                                  
  1092 00000376 8A46FE                   mov al, byte [bp-2]
  1093 00000379 B400                     mov ah, 0
  1094 0000037B 50                       push ax
  1095 0000037C E8C9FF                   call eprc
  1096 0000037F 83C402                   add  sp, 2
  1097                                  
  1098                                  ;-192         s++;
  1099                                  
  1100 00000382 FF4604                   inc  word[bp+4]
  1101                                  
  1102                                  ;-193     }
  1103                                  
  1104                                  
  1105                                  ;-194 }
  1106                                  
  1107 00000385 EBD8                     jmp .eprs33
  1108                                  .eprs34:
  1109                                  
  1110                                  ;-195 int prc(unsigned char c) {
  1111 00000387 C9                       LEAVE
  1112 00000388 C3                       ret
  1113                                  ENDP
  1114                                  
  1115                                  prc: PROC
  1116                                  
  1117                                  ;-196     if (c==10) {
  1118                                  ;
  1119 00000389 C8000000                 ENTER  0,0
  1120 0000038D 8A4604                   mov al, [bp+4]
  1121 00000390 3C0A                     cmp al, 10
  1122 00000392 0F850600                 jne .prc35
  1123                                  
  1124                                  ;-197         _AX=13;
  1125                                  
  1126 00000396 B80D00                   mov  ax, 13
  1127                                  
  1128                                  ;-198         writetty();
  1129                                  
  1130 00000399 E8B8FC                   call writetty
  1131                                  
  1132                                  ;-199     }
  1133                                  
  1134                                  
  1135                                  ;-200     _AL=c;
  1136                                  
  1137                                  .prc35:
  1138 0000039C 8A4604                   mov  al, [bp+4]
  1139                                  
  1140                                  ;-201     writetty();
  1141                                  
  1142 0000039F E8B2FC                   call writetty
  1143                                  
  1144                                  ;-202     fputcR(c, fdout);
  1145                                  
  1146 000003A2 FF36[1C00]               push word [fdout]
  1147 000003A6 8A4604                   mov al, byte [bp+4]
  1148 000003A9 B400                     mov ah, 0
  1149 000003AB 50                       push ax
  1150 000003AC E85CFD                   call fputcR
  1151 000003AF 83C404                   add  sp, 4
  1152                                  
  1153                                  ;-203 }
  1154                                  
  1155                                  
  1156                                  ;-204 int prscomment(unsigned char *s) {
  1157 000003B2 C9                       LEAVE
  1158 000003B3 C3                       ret
  1159                                  ENDP
  1160                                  
  1161                                  prscomment: PROC
  1162                                  
  1163                                  ;-205     unsigned char c;
  1164                                  
  1165                                  
  1166                                  ;-206     while(*s){
  1167                                  ;
  1168 000003B4 C8020000                 ENTER  2,0
  1169                                  .prscomment36:
  1170 000003B8 8B5E04                   mov bx, [bp+4]
  1171 000003BB 8A07                     mov al, [bx]
  1172 000003BD B400                     mov ah, 0
  1173 000003BF 08C0                     or  al, al
  1174 000003C1 0F841B00                 je .prscomment37
  1175                                  
  1176                                  ;-207         c=*s;
  1177                                  
  1178 000003C5 8B5E04                   mov bx, [bp+4]
  1179 000003C8 8A07                     mov al, [bx]
  1180 000003CA B400                     mov ah, 0
  1181 000003CC 8846FE                   mov [bp-2], al
  1182                                  
  1183                                  ;-208         prc(c);
  1184                                  
  1185 000003CF 8A46FE                   mov al, byte [bp-2]
  1186 000003D2 B400                     mov ah, 0
  1187 000003D4 50                       push ax
  1188 000003D5 E8B1FF                   call prc
  1189 000003D8 83C402                   add  sp, 2
  1190                                  
  1191                                  ;-209         s++;
  1192                                  
  1193 000003DB FF4604                   inc  word[bp+4]
  1194                                  
  1195                                  ;-210     }
  1196                                  
  1197                                  
  1198                                  ;-211 }
  1199                                  
  1200 000003DE EBD8                     jmp .prscomment36
  1201                                  .prscomment37:
  1202                                  
  1203                                  ;-212 int prs(unsigned char *s) {
  1204 000003E0 C9                       LEAVE
  1205 000003E1 C3                       ret
  1206                                  ENDP
  1207                                  
  1208                                  prs: PROC
  1209                                  
  1210                                  ;-213     unsigned char c; int com;
  1211                                  
  1212                                  
  1213                                  ;-214     com=0;
  1214                                  ;
  1215 000003E2 C8040000                 ENTER  4,0
  1216 000003E6 B80000                   mov ax, 0
  1217 000003E9 8946FC                   mov [bp-4], ax
  1218                                  
  1219                                  ;-215     while(*s) {
  1220                                  
  1221                                  .prs38:
  1222 000003EC 8B5E04                   mov bx, [bp+4]
  1223 000003EF 8A07                     mov al, [bx]
  1224 000003F1 B400                     mov ah, 0
  1225 000003F3 08C0                     or  al, al
  1226 000003F5 0F847B00                 je .prs39
  1227                                  
  1228                                  ;-216         c=*s;
  1229                                  
  1230 000003F9 8B5E04                   mov bx, [bp+4]
  1231 000003FC 8A07                     mov al, [bx]
  1232 000003FE B400                     mov ah, 0
  1233 00000400 8846FE                   mov [bp-2], al
  1234                                  
  1235                                  ;-217         if (c==34) if (com) com=0;
  1236                                  
  1237 00000403 8A46FE                   mov al, [bp-2]
  1238 00000406 3C22                     cmp al, 34
  1239 00000408 0F851800                 jne .prs40
  1240 0000040C 8B46FC                   mov ax, [bp-4]
  1241 0000040F 08C0                     or  al, al
  1242 00000411 0F840900                 je .prs41
  1243 00000415 B80000                   mov ax, 0
  1244 00000418 8946FC                   mov [bp-4], ax
  1245                                  
  1246                                  ;-218                    else com=1;
  1247                                  
  1248 0000041B E90600                   jmp .prs42
  1249                                  .prs41:
  1250 0000041E B80100                   mov ax, 1
  1251 00000421 8946FC                   mov [bp-4], ax
  1252                                  
  1253                                  ;-219         if (c==92) {
  1254                                  
  1255                                  .prs42:
  1256                                  .prs40:
  1257 00000424 8A46FE                   mov al, [bp-2]
  1258 00000427 3C5C                     cmp al, 92
  1259 00000429 0F853500                 jne .prs43
  1260                                  
  1261                                  ;-220             if (com==0) {
  1262                                  
  1263 0000042D 8B46FC                   mov ax, [bp-4]
  1264 00000430 83F800                   cmp ax, 0
  1265 00000433 0F852B00                 jne .prs44
  1266                                  
  1267                                  ;-221                 s++;
  1268                                  
  1269 00000437 FF4604                   inc  word[bp+4]
  1270                                  
  1271                                  ;-222                 c=*s;
  1272                                  
  1273 0000043A 8B5E04                   mov bx, [bp+4]
  1274 0000043D 8A07                     mov al, [bx]
  1275 0000043F B400                     mov ah, 0
  1276 00000441 8846FE                   mov [bp-2], al
  1277                                  
  1278                                  ;-223                 if (c=='n') c=10;
  1279                                  
  1280 00000444 8A46FE                   mov al, [bp-2]
  1281 00000447 3C6E                     cmp al, 110
  1282 00000449 0F850600                 jne .prs45
  1283 0000044D B80A00                   mov ax, 10
  1284 00000450 8846FE                   mov [bp-2], al
  1285                                  
  1286                                  ;-224                 if (c=='t') c= 9;
  1287                                  
  1288                                  .prs45:
  1289 00000453 8A46FE                   mov al, [bp-2]
  1290 00000456 3C74                     cmp al, 116
  1291 00000458 0F850600                 jne .prs46
  1292 0000045C B80900                   mov ax, 9
  1293 0000045F 8846FE                   mov [bp-2], al
  1294                                  
  1295                                  ;-225             }
  1296                                  
  1297                                  .prs46:
  1298                                  
  1299                                  ;-226         }
  1300                                  
  1301                                  .prs44:
  1302                                  
  1303                                  ;-227         prc(c);
  1304                                  
  1305                                  .prs43:
  1306 00000462 8A46FE                   mov al, byte [bp-2]
  1307 00000465 B400                     mov ah, 0
  1308 00000467 50                       push ax
  1309 00000468 E81EFF                   call prc
  1310 0000046B 83C402                   add  sp, 2
  1311                                  
  1312                                  ;-228         s++;
  1313                                  
  1314 0000046E FF4604                   inc  word[bp+4]
  1315                                  
  1316                                  ;-229     }
  1317                                  
  1318                                  
  1319                                  ;-230 }
  1320                                  
  1321 00000471 E978FF                   jmp .prs38
  1322                                  .prs39:
  1323                                  
  1324                                  ;-231 int prnl() {
  1325 00000474 C9                       LEAVE
  1326 00000475 C3                       ret
  1327                                  ENDP
  1328                                  
  1329                                  prnl: PROC
  1330                                  
  1331                                  ;-232     prs("\n ");
  1332                                  
  1333 00000476 68[8004]                 push prnl_0
  1334 00000479 E866FF                   call prs
  1335 0000047C 83C402                   add  sp, 2
  1336                                  
  1337                                  ;-233 }
  1338                                  
  1339                                  
  1340                                  ;-234 
  1341                                  
  1342                                  
  1343                                  ;-235 
  1344                                  
  1345                                  
  1346                                  ;-236 int eprnum(int n){//for docall1 procedure
  1347                                  
  1348 0000047F C3                       ret
  1349 00000480 5C6E2000                prnl_0 db "\n ",0
  1350                                  ENDP
  1351                                  
  1352                                  eprnum: PROC
  1353                                  
  1354                                  ;-237     int e;
  1355                                  
  1356                                  
  1357                                  ;-238     if(n<0) {
  1358                                  ;
  1359 00000484 C8020000                 ENTER  2,0
  1360 00000488 8B4604                   mov ax, [bp+4]
  1361 0000048B 83F800                   cmp ax, 0
  1362 0000048E 0F8D1400                 jge .eprnum47
  1363                                  
  1364                                  ;-239         eprc('-');
  1365                                  
  1366 00000492 6A2D                     push 45
  1367 00000494 E8B1FE                   call eprc
  1368 00000497 83C402                   add  sp, 2
  1369                                  
  1370                                  ;-240         n=mkneg(n);
  1371                                  
  1372 0000049A FF7604                   push word [bp+4]
  1373 0000049D E804FC                   call mkneg
  1374 000004A0 83C402                   add  sp, 2
  1375 000004A3 894604                   mov [bp+4], ax
  1376                                  
  1377                                  ;-241     }
  1378                                  
  1379                                  
  1380                                  ;-242     if (n >= 10) {
  1381                                  
  1382                                  .eprnum47:
  1383 000004A6 8B4604                   mov ax, [bp+4]
  1384 000004A9 83F80A                   cmp ax, 10 ;unsigned : 1
  1385 000004AC 0F8C1500                 jl  .eprnum48
  1386                                  
  1387                                  ;-243         e=n/10;
  1388                                  
  1389 000004B0 8B4604                   mov ax, [bp+4]
  1390 000004B3 BB0A00                   mov bx, 10
  1391 000004B6 99                       cwd
  1392 000004B7 F7FB                     idiv bx
  1393 000004B9 8946FE                   mov [bp-2], ax
  1394                                  
  1395                                  ;-244         eprnum(e);
  1396                                  
  1397 000004BC FF76FE                   push word [bp-2]
  1398 000004BF E8C2FF                   call eprnum
  1399 000004C2 83C402                   add  sp, 2
  1400                                  
  1401                                  ;-245     }
  1402                                  
  1403                                  
  1404                                  ;-246     n=n%10;
  1405                                  
  1406                                  .eprnum48:
  1407 000004C5 8B4604                   mov ax, [bp+4]
  1408 000004C8 BB0A00                   mov bx, 10
  1409 000004CB 99                       cwd
  1410 000004CC F7FB                     idiv bx
  1411 000004CE 89D0                     mov ax, dx
  1412 000004D0 894604                   mov [bp+4], ax
  1413                                  
  1414                                  ;-247     n=n+'0';
  1415                                  
  1416 000004D3 8B4604                   mov ax, [bp+4]
  1417 000004D6 83C030                   add ax, 48
  1418 000004D9 894604                   mov [bp+4], ax
  1419                                  
  1420                                  ;-248     eprc(n);
  1421                                  
  1422 000004DC FF7604                   push word [bp+4]
  1423 000004DF E866FE                   call eprc
  1424 000004E2 83C402                   add  sp, 2
  1425                                  
  1426                                  ;-249 }
  1427                                  
  1428                                  
  1429                                  ;-250 int pint1 (int n){
  1430 000004E5 C9                       LEAVE
  1431 000004E6 C3                       ret
  1432                                  ENDP
  1433                                  
  1434                                  pint1: PROC
  1435                                  
  1436                                  ;-251     int e;
  1437                                  
  1438                                  
  1439                                  ;-252     if(n<0) {  prc('-');  n=mkneg(n); }
  1440                                  ;
  1441 000004E7 C8020000                 ENTER  2,0
  1442 000004EB 8B4604                   mov ax, [bp+4]
  1443 000004EE 83F800                   cmp ax, 0
  1444 000004F1 0F8D1400                 jge .pint149
  1445 000004F5 6A2D                     push 45
  1446 000004F7 E88FFE                   call prc
  1447 000004FA 83C402                   add  sp, 2
  1448 000004FD FF7604                   push word [bp+4]
  1449 00000500 E8A1FB                   call mkneg
  1450 00000503 83C402                   add  sp, 2
  1451 00000506 894604                   mov [bp+4], ax
  1452                                  
  1453                                  ;-253     if (n >= 10) {
  1454                                  
  1455                                  .pint149:
  1456 00000509 8B4604                   mov ax, [bp+4]
  1457 0000050C 83F80A                   cmp ax, 10 ;unsigned : 1
  1458 0000050F 0F8C1500                 jl  .pint150
  1459                                  
  1460                                  ;-254         e=n/10;
  1461                                  
  1462 00000513 8B4604                   mov ax, [bp+4]
  1463 00000516 BB0A00                   mov bx, 10
  1464 00000519 99                       cwd
  1465 0000051A F7FB                     idiv bx
  1466 0000051C 8946FE                   mov [bp-2], ax
  1467                                  
  1468                                  ;-255         pint1(e);
  1469                                  
  1470 0000051F FF76FE                   push word [bp-2]
  1471 00000522 E8C2FF                   call pint1
  1472 00000525 83C402                   add  sp, 2
  1473                                  
  1474                                  ;-256     }
  1475                                  
  1476                                  
  1477                                  ;-257     n=n%10;
  1478                                  
  1479                                  .pint150:
  1480 00000528 8B4604                   mov ax, [bp+4]
  1481 0000052B BB0A00                   mov bx, 10
  1482 0000052E 99                       cwd
  1483 0000052F F7FB                     idiv bx
  1484 00000531 89D0                     mov ax, dx
  1485 00000533 894604                   mov [bp+4], ax
  1486                                  
  1487                                  ;-258     n += '0';
  1488                                  
  1489 00000536 83460430                 add  word[bp+4], 48
  1490                                  
  1491                                  ;-259     prc(n);
  1492                                  
  1493 0000053A FF7604                   push word [bp+4]
  1494 0000053D E849FE                   call prc
  1495 00000540 83C402                   add  sp, 2
  1496                                  
  1497                                  ;-260 }
  1498                                  
  1499                                  
  1500                                  ;-261 int prunsign1(unsigned int n) {
  1501 00000543 C9                       LEAVE
  1502 00000544 C3                       ret
  1503                                  ENDP
  1504                                  
  1505                                  prunsign1: PROC
  1506                                  
  1507                                  ;-262     unsigned int e;
  1508                                  
  1509                                  
  1510                                  ;-263     if (n >= 10) {
  1511                                  ;
  1512 00000545 C8020000                 ENTER  2,0
  1513 00000549 8B4604                   mov ax, [bp+4]
  1514 0000054C 83F80A                   cmp ax, 10 ;unsigned : 0
  1515 0000054F 0F821700                 jb  .prunsign151
  1516                                  
  1517                                  ;-264         e=n/10;
  1518                                  
  1519 00000553 8B4604                   mov ax, [bp+4]
  1520 00000556 BB0A00                   mov bx, 10
  1521 00000559 BA0000                   mov dx, 0
  1522 0000055C F7F3                     div bx
  1523 0000055E 8946FE                   mov [bp-2], ax
  1524                                  
  1525                                  ;-265         prunsign1(e);
  1526                                  
  1527 00000561 FF76FE                   push word [bp-2]
  1528 00000564 E8DEFF                   call prunsign1
  1529 00000567 83C402                   add  sp, 2
  1530                                  
  1531                                  ;-266     }
  1532                                  
  1533                                  
  1534                                  ;-267     n = n % 10; /*unsigned mod*/
  1535                                  
  1536                                  .prunsign151:
  1537 0000056A 8B4604                   mov ax, [bp+4]
  1538 0000056D BB0A00                   mov bx, 10
  1539 00000570 BA0000                   mov dx, 0
  1540 00000573 F7F3                     div bx
  1541 00000575 89D0                     mov ax, dx
  1542 00000577 894604                   mov [bp+4], ax
  1543                                  
  1544                                  ;-268     n += '0';
  1545                                  
  1546 0000057A 83460430                 add  word[bp+4], 48
  1547                                  
  1548                                  ;-269     prc(n);
  1549                                  
  1550 0000057E FF7604                   push word [bp+4]
  1551 00000581 E805FE                   call prc
  1552 00000584 83C402                   add  sp, 2
  1553                                  
  1554                                  ;-270 }
  1555                                  
  1556                                  
  1557                                  ;-271 int printint51(unsigned int j)  {
  1558 00000587 C9                       LEAVE
  1559 00000588 C3                       ret
  1560                                  ENDP
  1561                                  
  1562                                  printint51: PROC
  1563                                  
  1564                                  ;-272     if (j<10000) prc(32);
  1565                                  ;
  1566 00000589 C8000000                 ENTER  0,0
  1567 0000058D 8B4604                   mov ax, [bp+4]
  1568 00000590 3D1027                   cmp ax, 10000
  1569 00000593 0F8D0800                 jge .printint5152
  1570 00000597 6A20                     push 32
  1571 00000599 E8EDFD                   call prc
  1572 0000059C 83C402                   add  sp, 2
  1573                                  
  1574                                  ;-273     if (j<1000) prc(32);
  1575                                  
  1576                                  .printint5152:
  1577 0000059F 8B4604                   mov ax, [bp+4]
  1578 000005A2 3DE803                   cmp ax, 1000
  1579 000005A5 0F8D0800                 jge .printint5153
  1580 000005A9 6A20                     push 32
  1581 000005AB E8DBFD                   call prc
  1582 000005AE 83C402                   add  sp, 2
  1583                                  
  1584                                  ;-274     if (j<100) prc(32);
  1585                                  
  1586                                  .printint5153:
  1587 000005B1 8B4604                   mov ax, [bp+4]
  1588 000005B4 83F864                   cmp ax, 100
  1589 000005B7 0F8D0800                 jge .printint5154
  1590 000005BB 6A20                     push 32
  1591 000005BD E8C9FD                   call prc
  1592 000005C0 83C402                   add  sp, 2
  1593                                  
  1594                                  ;-275     if (j<10) prc(32);
  1595                                  
  1596                                  .printint5154:
  1597 000005C3 8B4604                   mov ax, [bp+4]
  1598 000005C6 83F80A                   cmp ax, 10
  1599 000005C9 0F8D0800                 jge .printint5155
  1600 000005CD 6A20                     push 32
  1601 000005CF E8B7FD                   call prc
  1602 000005D2 83C402                   add  sp, 2
  1603                                  
  1604                                  ;-276     prunsign1(j);
  1605                                  
  1606                                  .printint5155:
  1607 000005D5 FF7604                   push word [bp+4]
  1608 000005D8 E86AFF                   call prunsign1
  1609 000005DB 83C402                   add  sp, 2
  1610                                  
  1611                                  ;-277 }
  1612                                  
  1613                                  
  1614                                  ;-278 
  1615                                  
  1616                                  
  1617                                  ;-279 int error1(char *s) {
  1618 000005DE C9                       LEAVE
  1619 000005DF C3                       ret
  1620                                  ENDP
  1621                                  
  1622                                  error1: PROC
  1623                                  
  1624                                  ;-280     lineno--;
  1625                                  ;
  1626 000005E0 C8000000                 ENTER  0,0
  1627 000005E4 FF0E[4900]               dec  word[lineno]
  1628                                  
  1629                                  ;-281     prnl();
  1630                                  
  1631 000005E8 E88BFE                   call prnl
  1632                                  
  1633                                  ;-282     prscomment(&fgetsdest);
  1634                                  
  1635 000005EB 8D06A0D9                 lea  ax, [fgetsdest]
  1636 000005EF 50                       push ax
  1637 000005F0 E8C1FD                   call prscomment
  1638 000005F3 83C402                   add  sp, 2
  1639                                  
  1640                                  ;-283     prs(";Line: ");
  1641                                  
  1642 000005F6 68[5F06]                 push error1_0
  1643 000005F9 E8E6FD                   call prs
  1644 000005FC 83C402                   add  sp, 2
  1645                                  
  1646                                  ;-284     prunsign1(lineno);
  1647                                  
  1648 000005FF FF36[4900]               push word [lineno]
  1649 00000603 E83FFF                   call prunsign1
  1650 00000606 83C402                   add  sp, 2
  1651                                  
  1652                                  ;-285     prs(" ************** ERROR: ");
  1653                                  
  1654 00000609 68[6706]                 push error1_1
  1655 0000060C E8D3FD                   call prs
  1656 0000060F 83C402                   add  sp, 2
  1657                                  
  1658                                  ;-286     prs(s);
  1659                                  
  1660 00000612 FF7604                   push word [bp+4]
  1661 00000615 E8CAFD                   call prs
  1662 00000618 83C402                   add  sp, 2
  1663                                  
  1664                                  ;-287     prs("  in column: ");
  1665                                  
  1666 0000061B 68[7F06]                 push error1_2
  1667 0000061E E8C1FD                   call prs
  1668 00000621 83C402                   add  sp, 2
  1669                                  
  1670                                  ;-288     prunsign1(column);
  1671                                  
  1672 00000624 FF36[2100]               push word [column]
  1673 00000628 E81AFF                   call prunsign1
  1674 0000062B 83C402                   add  sp, 2
  1675                                  
  1676                                  ;-289     prs("\nToken: ");
  1677                                  
  1678 0000062E 68[8D06]                 push error1_3
  1679 00000631 E8AEFD                   call prs
  1680 00000634 83C402                   add  sp, 2
  1681                                  
  1682                                  ;-290     prunsign1(token);
  1683                                  
  1684 00000637 FF36[1E00]               push word [token]
  1685 0000063B E807FF                   call prunsign1
  1686 0000063E 83C402                   add  sp, 2
  1687                                  
  1688                                  ;-291     prs(", symbol: ");
  1689                                  
  1690 00000641 68[9706]                 push error1_4
  1691 00000644 E89BFD                   call prs
  1692 00000647 83C402                   add  sp, 2
  1693                                  
  1694                                  ;-292     prs(symbol);
  1695                                  
  1696 0000064A 8D06BB69                 lea  ax, [symbol]
  1697 0000064E 50                       push ax
  1698 0000064F E890FD                   call prs
  1699 00000652 83C402                   add  sp, 2
  1700                                  
  1701                                  ;-293     end1(1);
  1702                                  
  1703 00000655 6A01                     push 1
  1704 00000657 E8B036                   call end1
  1705 0000065A 83C402                   add  sp, 2
  1706                                  
  1707                                  ;-294 }
  1708                                  
  1709                                  
  1710                                  ;-295 
  1711                                  
  1712                                  
  1713                                  ;-296 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  1714 0000065D C9                       LEAVE
  1715 0000065E C3                       ret
  1716 0000065F 3B4C696E653A2000        error1_0 db ";Line: ",0
  1717 00000667 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  1718 00000670 2A2A2A2A2A2A204552-
  1719 00000679 524F523A2000       
  1720 0000067F 2020696E20636F6C75-     error1_2 db "  in column: ",0
  1721 00000688 6D6E3A2000         
  1722 0000068D 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  1723 00000696 00                 
  1724 00000697 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  1725 000006A0 2000               
  1726                                  ENDP
  1727                                  
  1728                                  ifEOL: PROC
  1729                                  
  1730                                  ;-297     if (c == 10) return 1;//LF
  1731                                  ;
  1732 000006A2 C8000000                 ENTER  0,0
  1733 000006A6 8A4604                   mov al, [bp+4]
  1734 000006A9 3C0A                     cmp al, 10
  1735 000006AB 0F850600                 jne .ifEOL56
  1736 000006AF B80100                   mov ax, 1
  1737 000006B2 E92400                   jmp .retnifEOL
  1738                                  
  1739                                  ;-298     if (c == 13) {//CR
  1740                                  
  1741                                  .ifEOL56:
  1742 000006B5 8A4604                   mov al, [bp+4]
  1743 000006B8 3C0D                     cmp al, 13
  1744 000006BA 0F851500                 jne .ifEOL57
  1745                                  
  1746                                  ;-299         if (thechar == 10) c=next();
  1747                                  
  1748 000006BE A0[2300]                 mov al, [thechar]
  1749 000006C1 3C0A                     cmp al, 10
  1750 000006C3 0F850600                 jne .ifEOL58
  1751 000006C7 E82601                   call next
  1752 000006CA 884604                   mov [bp+4], al
  1753                                  
  1754                                  ;-300         return 1;
  1755                                  
  1756                                  .ifEOL58:
  1757 000006CD B80100                   mov ax, 1
  1758 000006D0 E90600                   jmp .retnifEOL
  1759                                  
  1760                                  ;-301     }
  1761                                  
  1762                                  
  1763                                  ;-302     return 0;
  1764                                  
  1765                                  .ifEOL57:
  1766 000006D3 B80000                   mov ax, 0
  1767 000006D6 E90000                   jmp .retnifEOL
  1768                                  
  1769                                  ;-303 }
  1770                                  
  1771                                  
  1772                                  ;-304 int printinputline() {
  1773                                  
  1774 000006D9 C9                       .retnifEOL: LEAVE
  1775 000006DA C3                       ret
  1776                                  ENDP
  1777                                  
  1778                                  printinputline: PROC
  1779                                  
  1780                                  ;-305     int col;
  1781                                  
  1782                                  
  1783                                  ;-306     col=0;
  1784                                  ;
  1785 000006DB C8020000                 ENTER  2,0
  1786 000006DF B80000                   mov ax, 0
  1787 000006E2 8946FE                   mov [bp-2], ax
  1788                                  
  1789                                  ;-307     fgetsp=&fgetsdest;
  1790                                  
  1791 000006E5 B8A0D9                   mov ax, fgetsdest
  1792 000006E8 A3[4500]                 mov word [fgetsp], ax
  1793                                  
  1794                                  ;-308     do {
  1795                                  
  1796                                  .printinputline59:
  1797                                  
  1798                                  ;-309         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1799                                  
  1800 000006EB 6A01                     push 1
  1801 000006ED FF36[1A00]               push word [fdin]
  1802 000006F1 8D06[5300]               lea  ax, [DOS_ByteRead]
  1803 000006F5 50                       push ax
  1804 000006F6 E8FDF9                   call readRL
  1805 000006F9 83C406                   add  sp, 6
  1806 000006FC A3[5100]                 mov word [DOS_NoBytes], ax
  1807                                  
  1808                                  ;-310         if (DOS_NoBytes == 0) return;
  1809                                  
  1810 000006FF A1[5100]                 mov ax, [DOS_NoBytes]
  1811 00000702 83F800                   cmp ax, 0
  1812 00000705 0F850300                 jne .printinputline60
  1813 00000709 E96A00                   jmp .retnprintinputline
  1814                                  
  1815                                  ;-311         *fgetsp=DOS_ByteRead;
  1816                                  
  1817                                  .printinputline60:
  1818 0000070C A0[5300]                 mov al, [DOS_ByteRead]
  1819 0000070F 8B1E[4500]               mov  bx, [fgetsp]
  1820 00000713 8807                     mov  [bx], al
  1821                                  
  1822                                  ;-312         fgetsp++;
  1823                                  
  1824 00000715 FF06[4500]               inc  word[fgetsp]
  1825                                  
  1826                                  ;-313         col++;
  1827                                  
  1828 00000719 FF46FE                   inc  word[bp-2]
  1829                                  
  1830                                  ;-314         if (col >80) error1("input line longer than 80 char");
  1831                                  
  1832 0000071C 8B46FE                   mov ax, [bp-2]
  1833 0000071F 83F850                   cmp ax, 80
  1834 00000722 0F8E0900                 jle .printinputline61
  1835 00000726 68[7807]                 push printinputline_0
  1836 00000729 E8B4FE                   call error1
  1837 0000072C 83C402                   add  sp, 2
  1838                                  
  1839                                  ;-315         }
  1840                                  
  1841                                  .printinputline61:
  1842                                  
  1843                                  ;-316         while (DOS_ByteRead != 10);
  1844                                  
  1845 0000072F A0[5300]                 mov al, [DOS_ByteRead]
  1846 00000732 3C0A                     cmp al, 10
  1847 00000734 0F840200                 je  .printinputline62
  1848 00000738 EBB1                     jmp .printinputline59
  1849                                  .printinputline62:
  1850                                  
  1851                                  ;-317     *fgetsp=0;
  1852                                  
  1853 0000073A B80000                   mov ax, 0
  1854 0000073D 8B1E[4500]               mov  bx, [fgetsp]
  1855 00000741 8807                     mov  [bx], al
  1856                                  
  1857                                  ;-318     if (fdout) {
  1858                                  
  1859 00000743 A1[1C00]                 mov ax, [fdout]
  1860 00000746 08C0                     or  al, al
  1861 00000748 0F842A00                 je .printinputline63
  1862                                  
  1863                                  ;-319         prs("\n\n;-");
  1864                                  
  1865 0000074C 68[9707]                 push printinputline_1
  1866 0000074F E890FC                   call prs
  1867 00000752 83C402                   add  sp, 2
  1868                                  
  1869                                  ;-320         prunsign1(lineno);
  1870                                  
  1871 00000755 FF36[4900]               push word [lineno]
  1872 00000759 E8E9FD                   call prunsign1
  1873 0000075C 83C402                   add  sp, 2
  1874                                  
  1875                                  ;-321         prc(' ');
  1876                                  
  1877 0000075F 6A20                     push 32
  1878 00000761 E825FC                   call prc
  1879 00000764 83C402                   add  sp, 2
  1880                                  
  1881                                  ;-322         lineno++;
  1882                                  
  1883 00000767 FF06[4900]               inc  word[lineno]
  1884                                  
  1885                                  ;-323         prscomment(&fgetsdest);
  1886                                  
  1887 0000076B 8D06A0D9                 lea  ax, [fgetsdest]
  1888 0000076F 50                       push ax
  1889 00000770 E841FC                   call prscomment
  1890 00000773 83C402                   add  sp, 2
  1891                                  
  1892                                  ;-324         }
  1893                                  
  1894                                  
  1895                                  ;-325 }
  1896                                  
  1897                                  .printinputline63:
  1898                                  
  1899                                  ;-326 int fgets1() {
  1900                                  
  1901 00000776 C9                       .retnprintinputline: LEAVE
  1902 00000777 C3                       ret
  1903 00000778 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1904 00000781 65206C6F6E67657220-
  1905 0000078A 7468616E2038302063-
  1906 00000793 68617200           
  1907 00000797 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1908                                  ENDP
  1909                                  
  1910                                  fgets1: PROC
  1911                                  
  1912                                  ;-327     char c;
  1913                                  
  1914                                  
  1915                                  ;-328     c=*fgetsp;
  1916                                  ;
  1917 0000079E C8020000                 ENTER  2,0
  1918 000007A2 8B1E[4500]               mov bx, [fgetsp]
  1919 000007A6 8A07                     mov al, [bx]
  1920 000007A8 B400                     mov ah, 0
  1921 000007AA 8846FE                   mov [bp-2], al
  1922                                  
  1923                                  ;-329     if (c==0) {
  1924                                  
  1925 000007AD 8A46FE                   mov al, [bp-2]
  1926 000007B0 3C00                     cmp al, 0
  1927 000007B2 0F852A00                 jne .fgets164
  1928                                  
  1929                                  ;-330         printinputline();
  1930                                  
  1931 000007B6 E822FF                   call printinputline
  1932                                  
  1933                                  ;-331         if (DOS_NoBytes == 0) return 0;
  1934                                  
  1935 000007B9 A1[5100]                 mov ax, [DOS_NoBytes]
  1936 000007BC 83F800                   cmp ax, 0
  1937 000007BF 0F850600                 jne .fgets165
  1938 000007C3 B80000                   mov ax, 0
  1939 000007C6 E92500                   jmp .retnfgets1
  1940                                  
  1941                                  ;-332         fgetsp=&fgetsdest;
  1942                                  
  1943                                  .fgets165:
  1944 000007C9 B8A0D9                   mov ax, fgetsdest
  1945 000007CC A3[4500]                 mov word [fgetsp], ax
  1946                                  
  1947                                  ;-333         c=*fgetsp;
  1948                                  
  1949 000007CF 8B1E[4500]               mov bx, [fgetsp]
  1950 000007D3 8A07                     mov al, [bx]
  1951 000007D5 B400                     mov ah, 0
  1952 000007D7 8846FE                   mov [bp-2], al
  1953                                  
  1954                                  ;-334         column=0;
  1955                                  
  1956 000007DA B80000                   mov ax, 0
  1957 000007DD A3[2100]                 mov word [column], ax
  1958                                  
  1959                                  ;-335     }
  1960                                  
  1961                                  
  1962                                  ;-336     fgetsp++;
  1963                                  
  1964                                  .fgets164:
  1965 000007E0 FF06[4500]               inc  word[fgetsp]
  1966                                  
  1967                                  ;-337     column++;
  1968                                  
  1969 000007E4 FF06[2100]               inc  word[column]
  1970                                  
  1971                                  ;-338     return c;
  1972                                  
  1973 000007E8 8A46FE                   mov al, [bp-2]
  1974 000007EB E90000                   jmp .retnfgets1
  1975                                  
  1976                                  ;-339 }
  1977                                  
  1978                                  
  1979                                  ;-340 
  1980                                  
  1981                                  
  1982                                  ;-341 
  1983                                  
  1984                                  
  1985                                  ;-342 int next() {
  1986                                  
  1987 000007EE C9                       .retnfgets1: LEAVE
  1988 000007EF C3                       ret
  1989                                  ENDP
  1990                                  
  1991                                  next: PROC
  1992                                  
  1993                                  ;-343     char r;
  1994                                  
  1995                                  
  1996                                  ;-344     r = thechar;
  1997                                  ;
  1998 000007F0 C8020000                 ENTER  2,0
  1999 000007F4 A0[2300]                 mov al, [thechar]
  2000 000007F7 8846FE                   mov [bp-2], al
  2001                                  
  2002                                  ;-345     globC=r;
  2003                                  
  2004 000007FA 8A46FE                   mov al, [bp-2]
  2005 000007FD A2[2000]                 mov byte [globC], al
  2006                                  
  2007                                  ;-346     thechar = fgets1();
  2008                                  
  2009 00000800 E89BFF                   call fgets1
  2010 00000803 A2[2300]                 mov byte [thechar], al
  2011                                  
  2012                                  ;-347     return r;
  2013                                  
  2014 00000806 8A46FE                   mov al, [bp-2]
  2015 00000809 E90000                   jmp .retnnext
  2016                                  
  2017                                  ;-348 }
  2018                                  
  2019                                  
  2020                                  ;-349 int istoken(int t) {
  2021                                  
  2022 0000080C C9                       .retnnext: LEAVE
  2023 0000080D C3                       ret
  2024                                  ENDP
  2025                                  
  2026                                  istoken: PROC
  2027                                  
  2028                                  ;-350     if (token == t) {
  2029                                  ;
  2030 0000080E C8000000                 ENTER  0,0
  2031 00000812 A1[1E00]                 mov ax, [token]
  2032 00000815 3B4604                   cmp ax, [bp+4]
  2033 00000818 0F850C00                 jne .istoken66
  2034                                  
  2035                                  ;-351         token=getlex();
  2036                                  
  2037 0000081C E81D25                   call getlex
  2038 0000081F A3[1E00]                 mov word [token], ax
  2039                                  
  2040                                  ;-352         return 1;
  2041                                  
  2042 00000822 B80100                   mov ax, 1
  2043 00000825 E90600                   jmp .retnistoken
  2044                                  
  2045                                  ;-353     }
  2046                                  
  2047                                  
  2048                                  ;-354     return 0;
  2049                                  
  2050                                  .istoken66:
  2051 00000828 B80000                   mov ax, 0
  2052 0000082B E90000                   jmp .retnistoken
  2053                                  
  2054                                  ;-355 }
  2055                                  
  2056                                  
  2057                                  ;-356 int expect(int t) {
  2058                                  
  2059 0000082E C9                       .retnistoken: LEAVE
  2060 0000082F C3                       ret
  2061                                  ENDP
  2062                                  
  2063                                  expect: PROC
  2064                                  
  2065                                  ;-357     if (istoken(t)==0) {
  2066                                  ;
  2067 00000830 C8000000                 ENTER  0,0
  2068 00000834 FF7604                   push word [bp+4]
  2069 00000837 E8D4FF                   call istoken
  2070 0000083A 83C402                   add  sp, 2
  2071 0000083D 83F800                   cmp ax, 0
  2072 00000840 0F852F00                 jne .expect67
  2073                                  
  2074                                  ;-358         *cloc=0;
  2075                                  
  2076 00000844 B80000                   mov ax, 0
  2077 00000847 8B1E[1800]               mov  bx, [cloc]
  2078 0000084B 8807                     mov  [bx], al
  2079                                  
  2080                                  ;-359         prs(co);
  2081                                  
  2082 0000084D 8D06A861                 lea  ax, [co]
  2083 00000851 50                       push ax
  2084 00000852 E88DFB                   call prs
  2085 00000855 83C402                   add  sp, 2
  2086                                  
  2087                                  ;-360         prs("\nExpected ASCII(dez): ");
  2088                                  
  2089 00000858 68[7508]                 push expect_0
  2090 0000085B E884FB                   call prs
  2091 0000085E 83C402                   add  sp, 2
  2092                                  
  2093                                  ;-361         pint1(t);
  2094                                  
  2095 00000861 FF7604                   push word [bp+4]
  2096 00000864 E880FC                   call pint1
  2097 00000867 83C402                   add  sp, 2
  2098                                  
  2099                                  ;-362         error1(" not found");
  2100                                  
  2101 0000086A 68[8D08]                 push expect_1
  2102 0000086D E870FD                   call error1
  2103 00000870 83C402                   add  sp, 2
  2104                                  
  2105                                  ;-363     }
  2106                                  
  2107                                  
  2108                                  ;-364 }
  2109                                  
  2110                                  .expect67:
  2111                                  
  2112                                  ;-365 
  2113                                  
  2114                                  
  2115                                  ;-366 int printName(unsigned int i) {int j;
  2116 00000873 C9                       LEAVE
  2117 00000874 C3                       ret
  2118 00000875 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  2119 0000087E 642041534349492864-
  2120 00000887 657A293A2000       
  2121 0000088D 206E6F7420666F756E-     expect_1 db " not found",0
  2122 00000896 6400               
  2123                                  ENDP
  2124                                  
  2125                                  printName: PROC
  2126                                  
  2127                                  ;-367   if (i < LSTART) { i=adrofname(i); prs(i); }
  2128                                  ;
  2129 00000898 C8020000                 ENTER  2,0
  2130 0000089C 8B4604                   mov ax, [bp+4]
  2131 0000089F 3DC800                   cmp ax, 200
  2132 000008A2 0F8D1800                 jge .printName68
  2133 000008A6 FF7604                   push word [bp+4]
  2134 000008A9 E8ED00                   call adrofname
  2135 000008AC 83C402                   add  sp, 2
  2136 000008AF 894604                   mov [bp+4], ax
  2137 000008B2 FF7604                   push word [bp+4]
  2138 000008B5 E82AFB                   call prs
  2139 000008B8 83C402                   add  sp, 2
  2140                                  
  2141                                  ;-368   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  2142                                  
  2143 000008BB E93800                   jmp .printName69
  2144                                  .printName68:
  2145 000008BE 68[F808]                 push printName_0
  2146 000008C1 E81EFB                   call prs
  2147 000008C4 83C402                   add  sp, 2
  2148 000008C7 8B5E04                   mov bx, [bp+4]
  2149 000008CA D1E3                     shl bx, 1
  2150 000008CC 8B873873                 mov ax, [GData + bx]
  2151 000008D0 8946FE                   mov [bp-2], ax
  2152 000008D3 8B46FE                   mov ax, [bp-2]
  2153 000008D6 83F800                   cmp ax, 0
  2154 000008D9 0F8E0800                 jle .printName70
  2155 000008DD 6A2B                     push 43
  2156 000008DF E8A7FA                   call prc
  2157 000008E2 83C402                   add  sp, 2
  2158                                  .printName70:
  2159 000008E5 FF76FE                   push word [bp-2]
  2160 000008E8 E8FCFB                   call pint1
  2161 000008EB 83C402                   add  sp, 2
  2162 000008EE 6A5D                     push 93
  2163 000008F0 E896FA                   call prc
  2164 000008F3 83C402                   add  sp, 2
  2165                                  
  2166                                  ;-369 }
  2167                                  
  2168                                  .printName69:
  2169                                  
  2170                                  ;-370 
  2171                                  
  2172                                  
  2173                                  ;-371 int a(unsigned int i) { printName(i);//address
  2174 000008F6 C9                       LEAVE
  2175 000008F7 C3                       ret
  2176 000008F8 5B627000                printName_0 db "[bp",0
  2177                                  ENDP
  2178                                  
  2179                                  a: PROC;
  2180 000008FC C8000000                 ENTER  0,0
  2181 00000900 FF7604                   push word [bp+4]
  2182 00000903 E892FF                   call printName
  2183 00000906 83C402                   add  sp, 2
  2184                                  
  2185                                  ;-372 }
  2186                                  
  2187                                  
  2188                                  ;-373 int v(unsigned int i) {//value
  2189 00000909 C9                       LEAVE
  2190 0000090A C3                       ret
  2191                                  ENDP
  2192                                  
  2193                                  v: PROC
  2194                                  
  2195                                  ;-374     if (i < LSTART) prc('[');
  2196                                  ;
  2197 0000090B C8000000                 ENTER  0,0
  2198 0000090F 8B4604                   mov ax, [bp+4]
  2199 00000912 3DC800                   cmp ax, 200
  2200 00000915 0F8D0800                 jge .v71
  2201 00000919 6A5B                     push 91
  2202 0000091B E86BFA                   call prc
  2203 0000091E 83C402                   add  sp, 2
  2204                                  
  2205                                  ;-375     printName(i);
  2206                                  
  2207                                  .v71:
  2208 00000921 FF7604                   push word [bp+4]
  2209 00000924 E871FF                   call printName
  2210 00000927 83C402                   add  sp, 2
  2211                                  
  2212                                  ;-376     if (i < LSTART) prc(']');
  2213                                  
  2214 0000092A 8B4604                   mov ax, [bp+4]
  2215 0000092D 3DC800                   cmp ax, 200
  2216 00000930 0F8D0800                 jge .v72
  2217 00000934 6A5D                     push 93
  2218 00000936 E850FA                   call prc
  2219 00000939 83C402                   add  sp, 2
  2220                                  
  2221                                  ;-377 }
  2222                                  
  2223                                  .v72:
  2224                                  
  2225                                  ;-378 int checknamelen() {
  2226 0000093C C9                       LEAVE
  2227 0000093D C3                       ret
  2228                                  ENDP
  2229                                  
  2230                                  checknamelen: PROC
  2231                                  
  2232                                  ;-379     int i;
  2233                                  
  2234                                  
  2235                                  ;-380     i=strlen(symbol);
  2236                                  ;
  2237 0000093E C8020000                 ENTER  2,0
  2238 00000942 8D06BB69                 lea  ax, [symbol]
  2239 00000946 50                       push ax
  2240 00000947 E8BAF8                   call strlen
  2241 0000094A 83C402                   add  sp, 2
  2242 0000094D 8946FE                   mov [bp-2], ax
  2243                                  
  2244                                  ;-381     if (i > IDLENMAX) error1("Item name is too long in characters)");
  2245                                  
  2246 00000950 8B46FE                   mov ax, [bp-2]
  2247 00000953 83F80F                   cmp ax, 15
  2248 00000956 0F8E0900                 jle .checknamelen73
  2249 0000095A 68[6509]                 push checknamelen_0
  2250 0000095D E880FC                   call error1
  2251 00000960 83C402                   add  sp, 2
  2252                                  
  2253                                  ;-382 }
  2254                                  
  2255                                  .checknamelen73:
  2256                                  
  2257                                  ;-383 
  2258                                  
  2259                                  
  2260                                  ;-384 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  2261 00000963 C9                       LEAVE
  2262 00000964 C3                       ret
  2263 00000965 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  2264 0000096E 20697320746F6F206C-
  2265 00000977 6F6E6720696E206368-
  2266 00000980 617261637465727329-
  2267 00000989 00                 
  2268                                  ENDP
  2269                                  
  2270                                  adrF: PROC;
  2271 0000098A C8000000                 ENTER  0,0
  2272 0000098E 8B4606                   mov ax, [bp+6]
  2273 00000991 C1E004                   shl ax, 4
  2274                                  
  2275                                  ;-385   __asm{ add ax, [bp+4]  ; offset s } }
  2276                                  
  2277 00000994 034604                   add ax, [bp+4]  ; offset s 
  2278                                  
  2279                                  ;-386 
  2280                                  
  2281                                  
  2282                                  ;-387   int adrofname(unsigned int i) { adrF(GNameField, i); }
  2283 00000997 C9                       LEAVE
  2284 00000998 C3                       ret
  2285                                  ENDP
  2286                                  
  2287                                  adrofname: PROC;
  2288 00000999 C8000000                 ENTER  0,0
  2289 0000099D FF7604                   push word [bp+4]
  2290 000009A0 8D069075                 lea  ax, [GNameField]
  2291 000009A4 50                       push ax
  2292 000009A5 E8E2FF                   call adrF
  2293 000009A8 83C404                   add  sp, 4
  2294                                  
  2295                                  ;-388 
  2296                                  
  2297                                  
  2298                                  ;-389 int gettypes(int i) {int j; char c;
  2299 000009AB C9                       LEAVE
  2300 000009AC C3                       ret
  2301                                  ENDP
  2302                                  
  2303                                  gettypes: PROC
  2304                                  
  2305                                  ;-390   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  2306                                  ;
  2307 000009AD C8040000                 ENTER  4,0
  2308 000009B1 8B5E04                   mov bx, [bp+4]
  2309 000009B4 8A87306C                 mov al, [GSign + bx]
  2310 000009B8 8846FC                   mov [bp-4], al
  2311 000009BB 8A46FC                   mov al, [bp-4]
  2312 000009BE 3C53                     cmp al, 83
  2313 000009C0 0F850900                 jne .gettypes74
  2314 000009C4 B80100                   mov ax, 1
  2315 000009C7 A3[3100]                 mov word [signi], ax
  2316 000009CA E90600                   jmp .gettypes75
  2317                                  .gettypes74:
  2318 000009CD B80000                   mov ax, 0
  2319 000009D0 A3[3100]                 mov word [signi], ax
  2320                                  
  2321                                  ;-391   c=GWidth[i]; widthi=0;wi=0;
  2322                                  
  2323                                  .gettypes75:
  2324 000009D3 8B5E04                   mov bx, [bp+4]
  2325 000009D6 8A875C6D                 mov al, [GWidth + bx]
  2326 000009DA 8846FC                   mov [bp-4], al
  2327 000009DD B80000                   mov ax, 0
  2328 000009E0 A3[3400]                 mov word [widthi], ax
  2329 000009E3 B80000                   mov ax, 0
  2330 000009E6 A3[3700]                 mov word [wi], ax
  2331                                  
  2332                                  ;-392   if (c==1) {widthi=1;wi=1;}
  2333                                  
  2334 000009E9 8A46FC                   mov al, [bp-4]
  2335 000009EC 3C01                     cmp al, 1
  2336 000009EE 0F850C00                 jne .gettypes76
  2337 000009F2 B80100                   mov ax, 1
  2338 000009F5 A3[3400]                 mov word [widthi], ax
  2339 000009F8 B80100                   mov ax, 1
  2340 000009FB A3[3700]                 mov word [wi], ax
  2341                                  
  2342                                  ;-393   if (c==2) {widthi=2;wi=2;}
  2343                                  
  2344                                  .gettypes76:
  2345 000009FE 8A46FC                   mov al, [bp-4]
  2346 00000A01 3C02                     cmp al, 2
  2347 00000A03 0F850C00                 jne .gettypes77
  2348 00000A07 B80200                   mov ax, 2
  2349 00000A0A A3[3400]                 mov word [widthi], ax
  2350 00000A0D B80200                   mov ax, 2
  2351 00000A10 A3[3700]                 mov word [wi], ax
  2352                                  
  2353                                  ;-394   if (c==4) {widthi=4;wi=4;}
  2354                                  
  2355                                  .gettypes77:
  2356 00000A13 8A46FC                   mov al, [bp-4]
  2357 00000A16 3C04                     cmp al, 4
  2358 00000A18 0F850C00                 jne .gettypes78
  2359 00000A1C B80400                   mov ax, 4
  2360 00000A1F A3[3400]                 mov word [widthi], ax
  2361 00000A22 B80400                   mov ax, 4
  2362 00000A25 A3[3700]                 mov word [wi], ax
  2363                                  
  2364                                  ;-395   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  2365                                  
  2366                                  .gettypes78:
  2367 00000A28 8B5E04                   mov bx, [bp+4]
  2368 00000A2B 8A87046B                 mov al, [GType + bx]
  2369 00000A2F 8846FC                   mov [bp-4], al
  2370 00000A32 B80000                   mov ax, 0
  2371 00000A35 A3[2E00]                 mov word [typei], ax
  2372 00000A38 8A46FC                   mov al, [bp-4]
  2373 00000A3B 3C2A                     cmp al, 42
  2374 00000A3D 0F850C00                 jne .gettypes79
  2375 00000A41 B80100                   mov ax, 1
  2376 00000A44 A3[2E00]                 mov word [typei], ax
  2377 00000A47 B80200                   mov ax, 2
  2378 00000A4A A3[3700]                 mov word [wi], ax
  2379                                  
  2380                                  ;-396   if (c=='&')  typei=2;
  2381                                  
  2382                                  .gettypes79:
  2383 00000A4D 8A46FC                   mov al, [bp-4]
  2384 00000A50 3C26                     cmp al, 38
  2385 00000A52 0F850600                 jne .gettypes80
  2386 00000A56 B80200                   mov ax, 2
  2387 00000A59 A3[2E00]                 mov word [typei], ax
  2388                                  
  2389                                  ;-397   return i; }
  2390                                  
  2391                                  .gettypes80:
  2392 00000A5C 8B4604                   mov ax, [bp+4]
  2393 00000A5F E90000                   jmp .retngettypes
  2394                                  
  2395                                  ;-398 int searchname() { unsigned int i;
  2396                                  
  2397 00000A62 C9                       .retngettypes: LEAVE
  2398 00000A63 C3                       ret
  2399                                  ENDP
  2400                                  
  2401                                  searchname: PROC
  2402                                  
  2403                                  ;-399   i=checkName(); if (i == 0) error1("Variable unknown");
  2404                                  ;
  2405 00000A64 C8020000                 ENTER  2,0
  2406 00000A68 E84400                   call checkName
  2407 00000A6B 8946FE                   mov [bp-2], ax
  2408 00000A6E 8B46FE                   mov ax, [bp-2]
  2409 00000A71 83F800                   cmp ax, 0
  2410 00000A74 0F850900                 jne .searchname81
  2411 00000A78 68[9E0A]                 push searchname_0
  2412 00000A7B E862FB                   call error1
  2413 00000A7E 83C402                   add  sp, 2
  2414                                  
  2415                                  ;-400   GUsed[i]=GUsed[i] + 1; return i;
  2416                                  
  2417                                  .searchname81:
  2418 00000A81 8B5EFE                   mov bx, [bp-2]
  2419 00000A84 D1E3                     shl bx, 1
  2420 00000A86 8B87E070                 mov ax, [GUsed + bx]
  2421 00000A8A 83C001                   add ax, 1
  2422 00000A8D 8B5EFE                   mov bx, [bp-2]
  2423 00000A90 D1E3                     shl bx, 1
  2424 00000A92 8987E070                 mov [GUsed+bx], ax
  2425 00000A96 8B46FE                   mov ax, [bp-2]
  2426 00000A99 E90000                   jmp .retnsearchname
  2427                                  
  2428                                  ;-401 }
  2429                                  
  2430                                  
  2431                                  ;-402 int checkName() { unsigned int i; unsigned int j;
  2432                                  
  2433 00000A9C C9                       .retnsearchname: LEAVE
  2434 00000A9D C3                       ret
  2435 00000A9E 5661726961626C6520-     searchname_0 db "Variable unknown",0
  2436 00000AA7 756E6B6E6F776E00   
  2437                                  ENDP
  2438                                  
  2439                                  checkName: PROC
  2440                                  
  2441                                  ;-403   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2442                                  ;
  2443 00000AAF C8040000                 ENTER  4,0
  2444 00000AB3 B8C800                   mov ax, 200
  2445 00000AB6 8946FE                   mov [bp-2], ax
  2446                                  .checkName82:
  2447 00000AB9 8B46FE                   mov ax, [bp-2]
  2448 00000ABC 3B06[3B00]               cmp ax, [LTop]
  2449 00000AC0 0F8D2B00                 jge .checkName83
  2450 00000AC4 FF76FE                   push word [bp-2]
  2451 00000AC7 E8CFFE                   call adrofname
  2452 00000ACA 83C402                   add  sp, 2
  2453 00000ACD 8946FC                   mov [bp-4], ax
  2454 00000AD0 FF76FC                   push word [bp-4]
  2455 00000AD3 8D06BB69                 lea  ax, [symbol]
  2456 00000AD7 50                       push ax
  2457 00000AD8 E887F7                   call eqstr
  2458 00000ADB 83C404                   add  sp, 4
  2459 00000ADE 08C0                     or  al, al
  2460 00000AE0 0F840600                 je .checkName84
  2461 00000AE4 8B46FE                   mov ax, [bp-2]
  2462 00000AE7 E94700                   jmp .retncheckName
  2463                                  .checkName84:
  2464 00000AEA FF46FE                   inc  word[bp-2]
  2465                                  
  2466                                  ;-404   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  2467                                  
  2468 00000AED EBCA                     jmp .checkName82
  2469                                  .checkName83:
  2470 00000AEF B80100                   mov ax, 1
  2471 00000AF2 8946FE                   mov [bp-2], ax
  2472                                  .checkName85:
  2473 00000AF5 8B46FE                   mov ax, [bp-2]
  2474 00000AF8 3B06[3900]               cmp ax, [GTop]
  2475 00000AFC 0F8D2B00                 jge .checkName86
  2476 00000B00 FF76FE                   push word [bp-2]
  2477 00000B03 E893FE                   call adrofname
  2478 00000B06 83C402                   add  sp, 2
  2479 00000B09 8946FC                   mov [bp-4], ax
  2480 00000B0C FF76FC                   push word [bp-4]
  2481 00000B0F 8D06BB69                 lea  ax, [symbol]
  2482 00000B13 50                       push ax
  2483 00000B14 E84BF7                   call eqstr
  2484 00000B17 83C404                   add  sp, 4
  2485 00000B1A 08C0                     or  al, al
  2486 00000B1C 0F840600                 je .checkName87
  2487 00000B20 8B46FE                   mov ax, [bp-2]
  2488 00000B23 E90B00                   jmp .retncheckName
  2489                                  .checkName87:
  2490 00000B26 FF46FE                   inc  word[bp-2]
  2491                                  
  2492                                  ;-405   return 0;
  2493                                  
  2494 00000B29 EBCA                     jmp .checkName85
  2495                                  .checkName86:
  2496 00000B2B B80000                   mov ax, 0
  2497 00000B2E E90000                   jmp .retncheckName
  2498                                  
  2499                                  ;-406 }
  2500                                  
  2501                                  
  2502                                  ;-407 int typeName() { int m; //0=V,1=*,2=&
  2503                                  
  2504 00000B31 C9                       .retncheckName: LEAVE
  2505 00000B32 C3                       ret
  2506                                  ENDP
  2507                                  
  2508                                  typeName: PROC
  2509                                  
  2510                                  ;-408     issign='S';
  2511                                  ;
  2512 00000B33 C8020000                 ENTER  2,0
  2513 00000B37 B85300                   mov ax, 83
  2514 00000B3A A2[3300]                 mov byte [issign], al
  2515                                  
  2516                                  ;-409     if(istoken(T_SIGNED))   issign='S';
  2517                                  
  2518 00000B3D 681302                   push 531
  2519 00000B40 E8CBFC                   call istoken
  2520 00000B43 83C402                   add  sp, 2
  2521 00000B46 08C0                     or  al, al
  2522 00000B48 0F840600                 je .typeName88
  2523 00000B4C B85300                   mov ax, 83
  2524 00000B4F A2[3300]                 mov byte [issign], al
  2525                                  
  2526                                  ;-410     if(istoken(T_UNSIGNED)) issign='U';
  2527                                  
  2528                                  .typeName88:
  2529 00000B52 681402                   push 532
  2530 00000B55 E8B6FC                   call istoken
  2531 00000B58 83C402                   add  sp, 2
  2532 00000B5B 08C0                     or  al, al
  2533 00000B5D 0F840600                 je .typeName89
  2534 00000B61 B85500                   mov ax, 85
  2535 00000B64 A2[3300]                 mov byte [issign], al
  2536                                  
  2537                                  ;-411     iswidth=2;
  2538                                  
  2539                                  .typeName89:
  2540 00000B67 B80200                   mov ax, 2
  2541 00000B6A A2[3600]                 mov byte [iswidth], al
  2542                                  
  2543                                  ;-412     if(istoken(T_VOID))     iswidth=0;
  2544                                  
  2545 00000B6D 681102                   push 529
  2546 00000B70 E89BFC                   call istoken
  2547 00000B73 83C402                   add  sp, 2
  2548 00000B76 08C0                     or  al, al
  2549 00000B78 0F840600                 je .typeName90
  2550 00000B7C B80000                   mov ax, 0
  2551 00000B7F A2[3600]                 mov byte [iswidth], al
  2552                                  
  2553                                  ;-413     if(istoken(T_CHAR))     iswidth=1;
  2554                                  
  2555                                  .typeName90:
  2556 00000B82 681202                   push 530
  2557 00000B85 E886FC                   call istoken
  2558 00000B88 83C402                   add  sp, 2
  2559 00000B8B 08C0                     or  al, al
  2560 00000B8D 0F840600                 je .typeName91
  2561 00000B91 B80100                   mov ax, 1
  2562 00000B94 A2[3600]                 mov byte [iswidth], al
  2563                                  
  2564                                  ;-414     if(istoken(T_INT))      iswidth=2;
  2565                                  
  2566                                  .typeName91:
  2567 00000B97 680502                   push 517
  2568 00000B9A E871FC                   call istoken
  2569 00000B9D 83C402                   add  sp, 2
  2570 00000BA0 08C0                     or  al, al
  2571 00000BA2 0F840600                 je .typeName92
  2572 00000BA6 B80200                   mov ax, 2
  2573 00000BA9 A2[3600]                 mov byte [iswidth], al
  2574                                  
  2575                                  ;-415     if(istoken(T_LONG))     iswidth=4;
  2576                                  
  2577                                  .typeName92:
  2578 00000BAC 681502                   push 533
  2579 00000BAF E85CFC                   call istoken
  2580 00000BB2 83C402                   add  sp, 2
  2581 00000BB5 08C0                     or  al, al
  2582 00000BB7 0F840600                 je .typeName93
  2583 00000BBB B80400                   mov ax, 4
  2584 00000BBE A2[3600]                 mov byte [iswidth], al
  2585                                  
  2586                                  ;-416     istype='V';
  2587                                  
  2588                                  .typeName93:
  2589 00000BC1 B85600                   mov ax, 86
  2590 00000BC4 A2[3000]                 mov byte [istype], al
  2591                                  
  2592                                  ;-417     m=0;
  2593                                  
  2594 00000BC7 B80000                   mov ax, 0
  2595 00000BCA 8946FE                   mov [bp-2], ax
  2596                                  
  2597                                  ;-418     if(istoken('*'))  {istype='*'; m=1;}
  2598                                  
  2599 00000BCD 6A2A                     push 42
  2600 00000BCF E83CFC                   call istoken
  2601 00000BD2 83C402                   add  sp, 2
  2602 00000BD5 08C0                     or  al, al
  2603 00000BD7 0F840C00                 je .typeName94
  2604 00000BDB B82A00                   mov ax, 42
  2605 00000BDE A2[3000]                 mov byte [istype], al
  2606 00000BE1 B80100                   mov ax, 1
  2607 00000BE4 8946FE                   mov [bp-2], ax
  2608                                  
  2609                                  ;-419     if(istoken('&'))  {istype='&'; m=2;}
  2610                                  
  2611                                  .typeName94:
  2612 00000BE7 6A26                     push 38
  2613 00000BE9 E822FC                   call istoken
  2614 00000BEC 83C402                   add  sp, 2
  2615 00000BEF 08C0                     or  al, al
  2616 00000BF1 0F840C00                 je .typeName95
  2617 00000BF5 B82600                   mov ax, 38
  2618 00000BF8 A2[3000]                 mov byte [istype], al
  2619 00000BFB B80200                   mov ax, 2
  2620 00000BFE 8946FE                   mov [bp-2], ax
  2621                                  
  2622                                  ;-420     name1();
  2623                                  
  2624                                  .typeName95:
  2625 00000C01 E80800                   call name1
  2626                                  
  2627                                  ;-421     return m;
  2628                                  
  2629 00000C04 8B46FE                   mov ax, [bp-2]
  2630 00000C07 E90000                   jmp .retntypeName
  2631                                  
  2632                                  ;-422 }
  2633                                  
  2634                                  
  2635                                  ;-423 int name1() {
  2636                                  
  2637 00000C0A C9                       .retntypeName: LEAVE
  2638 00000C0B C3                       ret
  2639                                  ENDP
  2640                                  
  2641                                  name1: PROC
  2642                                  
  2643                                  ;-424     if (token!=T_NAME) error1("Name expected");
  2644                                  
  2645 00000C0C A1[1E00]                 mov ax, [token]
  2646 00000C0F 3D0001                   cmp ax, 256
  2647 00000C12 0F840900                 je  .name196
  2648 00000C16 68[260C]                 push name1_0
  2649 00000C19 E8C4F9                   call error1
  2650 00000C1C 83C402                   add  sp, 2
  2651                                  
  2652                                  ;-425     token=getlex();
  2653                                  
  2654                                  .name196:
  2655 00000C1F E81A21                   call getlex
  2656 00000C22 A3[1E00]                 mov word [token], ax
  2657                                  
  2658                                  ;-426 }
  2659                                  
  2660                                  
  2661                                  ;-427 
  2662                                  
  2663                                  
  2664                                  ;-428 int storeCall1() {//todo
  2665                                  
  2666 00000C25 C3                       ret
  2667 00000C26 4E616D652065787065-     name1_0 db "Name expected",0
  2668 00000C2F 6374656400         
  2669                                  ENDP
  2670                                  
  2671                                  storeCall1: PROC
  2672                                  
  2673                                  ;-429     unsigned int i;
  2674                                  
  2675                                  
  2676                                  ;-430     CTop++;
  2677                                  ;
  2678 00000C34 C8020000                 ENTER  2,0
  2679 00000C38 FF06[4300]               inc  word[CTop]
  2680                                  
  2681                                  ;-431     if (CTop >= CALLMAX) error1("too many calls");
  2682                                  
  2683 00000C3C A1[4300]                 mov ax, [CTop]
  2684 00000C3F 3DDC05                   cmp ax, 1500 ;unsigned : 1
  2685 00000C42 0F8C0900                 jl  .storeCall197
  2686 00000C46 68[9B0C]                 push storeCall1_0
  2687 00000C49 E894F9                   call error1
  2688 00000C4C 83C402                   add  sp, 2
  2689                                  
  2690                                  ;-432     i = CNamePtr - &CNameField;
  2691                                  
  2692                                  .storeCall197:
  2693 00000C4F A1[3F00]                 mov ax, [CNamePtr]
  2694 00000C52 2D80B2                   sub ax, CNameField
  2695 00000C55 8946FE                   mov [bp-2], ax
  2696                                  
  2697                                  ;-433     if (i >= CNAMEMAX) error1("too many call names");
  2698                                  
  2699 00000C58 8B46FE                   mov ax, [bp-2]
  2700 00000C5B 3D1027                   cmp ax, 10000 ;unsigned : 0
  2701 00000C5E 0F820900                 jb  .storeCall198
  2702 00000C62 68[AA0C]                 push storeCall1_1
  2703 00000C65 E878F9                   call error1
  2704 00000C68 83C402                   add  sp, 2
  2705                                  
  2706                                  ;-434     CType[CTop]=0;
  2707                                  
  2708                                  .storeCall198:
  2709 00000C6B B80000                   mov ax, 0
  2710 00000C6E 8B1E[4300]               mov bx, [CTop]
  2711 00000C72 8887ECA0                 mov [CType+bx], al
  2712                                  
  2713                                  ;-435     CAdr [CTop]=CNamePtr;
  2714                                  
  2715 00000C76 A1[3F00]                 mov ax, [CNamePtr]
  2716 00000C79 8B1E[4300]               mov bx, [CTop]
  2717 00000C7D D1E3                     shl bx, 1
  2718 00000C7F 8987C8A6                 mov [CAdr+bx], ax
  2719                                  
  2720                                  ;-436     CNamePtr=strcpy(CNamePtr, symbol);
  2721                                  
  2722 00000C83 8D06BB69                 lea  ax, [symbol]
  2723 00000C87 50                       push ax
  2724 00000C88 FF36[3F00]               push word [CNamePtr]
  2725 00000C8C E89DF5                   call strcpy
  2726 00000C8F 83C404                   add  sp, 4
  2727 00000C92 A3[3F00]                 mov word [CNamePtr], ax
  2728                                  
  2729                                  ;-437     CNamePtr++;
  2730                                  
  2731 00000C95 FF06[3F00]               inc  word[CNamePtr]
  2732                                  
  2733                                  ;-438 }
  2734                                  
  2735                                  
  2736                                  ;-439 
  2737                                  
  2738                                  
  2739                                  ;-440 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2740 00000C99 C9                       LEAVE
  2741 00000C9A C3                       ret
  2742 00000C9B 746F6F206D616E7920-     storeCall1_0 db "too many calls",0
  2743 00000CA4 63616C6C7300       
  2744 00000CAA 746F6F206D616E7920-     storeCall1_1 db "too many call names",0
  2745 00000CB3 63616C6C206E616D65-
  2746 00000CBC 7300               
  2747                                  ENDP
  2748                                  
  2749                                  storefunc: PROC
  2750 00000CBE A1[3D00]                 mov ax, [FTop]
  2751 00000CC1 3D2C01                   cmp ax, 300 ;unsigned : 1
  2752 00000CC4 0F8C0900                 jl  .storefunc99
  2753 00000CC8 68[1F0D]                 push storefunc_0
  2754 00000CCB E812F9                   call error1
  2755 00000CCE 83C402                   add  sp, 2
  2756                                  
  2757                                  ;-441     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2758                                  
  2759                                  .storefunc99:
  2760 00000CD1 A1[4900]                 mov ax, [lineno]
  2761 00000CD4 83E801                   sub ax, 1
  2762 00000CD7 8B1E[3D00]               mov bx, [FTop]
  2763 00000CDB D1E3                     shl bx, 1
  2764 00000CDD 89877C89                 mov [FAdr+bx], ax
  2765 00000CE1 B80000                   mov ax, 0
  2766 00000CE4 8B1E[3D00]               mov bx, [FTop]
  2767 00000CE8 D1E3                     shl bx, 1
  2768 00000CEA 8987D48B                 mov [FCalls+bx], ax
  2769 00000CEE A0[3600]                 mov al, [iswidth]
  2770 00000CF1 8B1E[3D00]               mov bx, [FTop]
  2771 00000CF5 88875088                 mov [FType+bx], al
  2772                                  
  2773                                  ;-442     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2774                                  
  2775 00000CF9 FF36[3D00]               push word [FTop]
  2776 00000CFD 8D062C8E                 lea  ax, [FNameField]
  2777 00000D01 50                       push ax
  2778 00000D02 E885FC                   call adrF
  2779 00000D05 83C404                   add  sp, 4
  2780 00000D08 A3[4B00]                 mov word [pt], ax
  2781 00000D0B 8D06BB69                 lea  ax, [symbol]
  2782 00000D0F 50                       push ax
  2783 00000D10 FF36[4B00]               push word [pt]
  2784 00000D14 E815F5                   call strcpy
  2785 00000D17 83C404                   add  sp, 4
  2786 00000D1A FF06[3D00]               inc  word[FTop]
  2787                                  
  2788                                  ;-443 }
  2789                                  
  2790                                  
  2791                                  ;-444 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2792                                  
  2793 00000D1E C3                       ret
  2794 00000D1F 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2795 00000D28 7461626C652066756C-
  2796 00000D31 6C00               
  2797                                  ENDP
  2798                                  
  2799                                  addlocal: PROC
  2800 00000D33 A1[3B00]                 mov ax, [LTop]
  2801 00000D36 3D2C01                   cmp ax, 300 ;unsigned : 1
  2802 00000D39 0F8C0900                 jl  .addlocal100
  2803 00000D3D 68[B90D]                 push addlocal_0
  2804 00000D40 E89DF8                   call error1
  2805 00000D43 83C402                   add  sp, 2
  2806                                  
  2807                                  ;-445   if (checkName() != 0) error1("Variable already defined");
  2808                                  
  2809                                  .addlocal100:
  2810 00000D46 E866FD                   call checkName
  2811 00000D49 83F800                   cmp ax, 0
  2812 00000D4C 0F840900                 je  .addlocal101
  2813 00000D50 68[D30D]                 push addlocal_1
  2814 00000D53 E88AF8                   call error1
  2815 00000D56 83C402                   add  sp, 2
  2816                                  
  2817                                  ;-446   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2818                                  
  2819                                  .addlocal101:
  2820 00000D59 A0[3300]                 mov al, [issign]
  2821 00000D5C 8B1E[3B00]               mov bx, [LTop]
  2822 00000D60 8887306C                 mov [GSign+bx], al
  2823 00000D64 A0[3600]                 mov al, [iswidth]
  2824 00000D67 8B1E[3B00]               mov bx, [LTop]
  2825 00000D6B 88875C6D                 mov [GWidth+bx], al
  2826 00000D6F A0[3000]                 mov al, [istype]
  2827 00000D72 8B1E[3B00]               mov bx, [LTop]
  2828 00000D76 8887046B                 mov [GType+bx], al
  2829                                  
  2830                                  ;-447   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2831                                  
  2832 00000D7A A1[4900]                 mov ax, [lineno]
  2833 00000D7D 83E801                   sub ax, 1
  2834 00000D80 8B1E[3B00]               mov bx, [LTop]
  2835 00000D84 D1E3                     shl bx, 1
  2836 00000D86 8987886E                 mov [GAdr+bx], ax
  2837 00000D8A B80000                   mov ax, 0
  2838 00000D8D 8B1E[3B00]               mov bx, [LTop]
  2839 00000D91 D1E3                     shl bx, 1
  2840 00000D93 8987E070                 mov [GUsed+bx], ax
  2841                                  
  2842                                  ;-448   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2843                                  
  2844 00000D97 FF36[3B00]               push word [LTop]
  2845 00000D9B 8D069075                 lea  ax, [GNameField]
  2846 00000D9F 50                       push ax
  2847 00000DA0 E8E7FB                   call adrF
  2848 00000DA3 83C404                   add  sp, 4
  2849 00000DA6 A3[4B00]                 mov word [pt], ax
  2850 00000DA9 8D06BB69                 lea  ax, [symbol]
  2851 00000DAD 50                       push ax
  2852 00000DAE FF36[4B00]               push word [pt]
  2853 00000DB2 E877F4                   call strcpy
  2854 00000DB5 83C404                   add  sp, 4
  2855                                  
  2856                                  ;-449 }
  2857                                  
  2858                                  
  2859                                  ;-450 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2860                                  
  2861 00000DB8 C3                       ret
  2862 00000DB9 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2863 00000DC2 6961626C6520746162-
  2864 00000DCB 6C652066756C6C00   
  2865 00000DD3 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2866 00000DDC 616C72656164792064-
  2867 00000DE5 6566696E656400     
  2868                                  ENDP
  2869                                  
  2870                                  checkFunction: PROC;
  2871 00000DEC C8040000                 ENTER  4,0
  2872 00000DF0 B80000                   mov ax, 0
  2873 00000DF3 8946FE                   mov [bp-2], ax
  2874                                  
  2875                                  ;-451   while (i < FTop) {
  2876                                  
  2877                                  .checkFunction102:
  2878 00000DF6 8B46FE                   mov ax, [bp-2]
  2879 00000DF9 3B06[3D00]               cmp ax, [FTop]
  2880 00000DFD 0F8D3000                 jge .checkFunction103
  2881                                  
  2882                                  ;-452     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2883                                  
  2884 00000E01 FF76FE                   push word [bp-2]
  2885 00000E04 8D062C8E                 lea  ax, [FNameField]
  2886 00000E08 50                       push ax
  2887 00000E09 E87EFB                   call adrF
  2888 00000E0C 83C404                   add  sp, 4
  2889 00000E0F 8946FC                   mov [bp-4], ax
  2890 00000E12 FF76FC                   push word [bp-4]
  2891 00000E15 8D06BB69                 lea  ax, [symbol]
  2892 00000E19 50                       push ax
  2893 00000E1A E845F4                   call eqstr
  2894 00000E1D 83C404                   add  sp, 4
  2895 00000E20 08C0                     or  al, al
  2896 00000E22 0F840600                 je .checkFunction104
  2897 00000E26 8B46FE                   mov ax, [bp-2]
  2898 00000E29 E90B00                   jmp .retncheckFunction
  2899                                  .checkFunction104:
  2900 00000E2C FF46FE                   inc  word[bp-2]
  2901                                  
  2902                                  ;-453   return 0; }
  2903                                  
  2904 00000E2F EBC5                     jmp .checkFunction102
  2905                                  .checkFunction103:
  2906 00000E31 B80000                   mov ax, 0
  2907 00000E34 E90000                   jmp .retncheckFunction
  2908                                  
  2909                                  ;-454 
  2910                                  
  2911                                  
  2912                                  ;-455 int isvariable() {
  2913                                  
  2914 00000E37 C9                       .retncheckFunction: LEAVE
  2915 00000E38 C3                       ret
  2916                                  ENDP
  2917                                  
  2918                                  isvariable: PROC
  2919                                  
  2920                                  ;-456     if(token==T_SIGNED)   goto v1;
  2921                                  
  2922 00000E39 A1[1E00]                 mov ax, [token]
  2923 00000E3C 3D1302                   cmp ax, 531
  2924 00000E3F 0F850300                 jne .isvariable105
  2925 00000E43 E93A00                   jmp .v1
  2926                                  
  2927                                  ;-457     if(token==T_UNSIGNED) goto v1;
  2928                                  
  2929                                  .isvariable105:
  2930 00000E46 A1[1E00]                 mov ax, [token]
  2931 00000E49 3D1402                   cmp ax, 532
  2932 00000E4C 0F850300                 jne .isvariable106
  2933 00000E50 E92D00                   jmp .v1
  2934                                  
  2935                                  ;-458     if(token==T_CHAR)     goto v1;
  2936                                  
  2937                                  .isvariable106:
  2938 00000E53 A1[1E00]                 mov ax, [token]
  2939 00000E56 3D1202                   cmp ax, 530
  2940 00000E59 0F850300                 jne .isvariable107
  2941 00000E5D E92000                   jmp .v1
  2942                                  
  2943                                  ;-459     if(token==T_INT)      goto v1;
  2944                                  
  2945                                  .isvariable107:
  2946 00000E60 A1[1E00]                 mov ax, [token]
  2947 00000E63 3D0502                   cmp ax, 517
  2948 00000E66 0F850300                 jne .isvariable108
  2949 00000E6A E91300                   jmp .v1
  2950                                  
  2951                                  ;-460     if(token==T_LONG)     goto v1;
  2952                                  
  2953                                  .isvariable108:
  2954 00000E6D A1[1E00]                 mov ax, [token]
  2955 00000E70 3D1502                   cmp ax, 533
  2956 00000E73 0F850300                 jne .isvariable109
  2957 00000E77 E90600                   jmp .v1
  2958                                  
  2959                                  ;-461     return 0;
  2960                                  
  2961                                  .isvariable109:
  2962 00000E7A B80000                   mov ax, 0
  2963 00000E7D E90600                   jmp .retnisvariable
  2964                                  
  2965                                  ;-462 v1: return 1;
  2966                                  
  2967                                  .v1:
  2968 00000E80 B80100                   mov ax, 1
  2969 00000E83 E90000                   jmp .retnisvariable
  2970                                  
  2971                                  ;-463 }
  2972                                  
  2973                                  
  2974                                  ;-464 
  2975                                  
  2976                                  
  2977                                  ;-465 int ireg1;
  2978                                  
  2979                                   .retnisvariable:
  2980 00000E86 C3                       ret
  2981                                  ENDP
  2982 00000E87 0000                    ireg1 dw 0
  2983                                  
  2984                                  ;-466 int mod2; int ireg2;
  2985                                  
  2986 00000E89 0000                    mod2 dw 0
  2987 00000E8B 0000                    ireg2 dw 0
  2988                                  
  2989                                  ;-467 
  2990                                  
  2991                                  
  2992                                  ;-468 int pexpr() {expect('('); iscmp=0;
  2993                                  
  2994                                  
  2995                                  pexpr: PROC
  2996 00000E8D 6A28                     push 40
  2997 00000E8F E89EF9                   call expect
  2998 00000E92 83C402                   add  sp, 2
  2999 00000E95 B80000                   mov ax, 0
  3000 00000E98 A3[2400]                 mov word [iscmp], ax
  3001                                  
  3002                                  ;-469   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  3003                                  
  3004 00000E9B A1[1E00]                 mov ax, [token]
  3005 00000E9E 3D0001                   cmp ax, 256
  3006 00000EA1 0F853400                 jne .pexpr110
  3007 00000EA5 68[080F]                 push pexpr_0
  3008 00000EA8 8D06BB69                 lea  ax, [symbol]
  3009 00000EAC 50                       push ax
  3010 00000EAD E8B2F3                   call eqstr
  3011 00000EB0 83C404                   add  sp, 4
  3012 00000EB3 08C0                     or  al, al
  3013 00000EB5 0F840600                 je .pexpr111
  3014 00000EB9 E86300                   call constantexpr
  3015 00000EBC E94800                   jmp .retnpexpr
  3016                                  
  3017                                  ;-470     ireg1=checkreg();
  3018                                  
  3019                                  .pexpr111:
  3020 00000EBF E84803                   call checkreg
  3021 00000EC2 A3[870E]                 mov word [ireg1], ax
  3022                                  
  3023                                  ;-471     if (ireg1) { doreg1(1); return; }  }
  3024                                  
  3025 00000EC5 A1[870E]                 mov ax, [ireg1]
  3026 00000EC8 08C0                     or  al, al
  3027 00000ECA 0F840B00                 je .pexpr112
  3028 00000ECE 6A01                     push 1
  3029 00000ED0 E84B01                   call doreg1
  3030 00000ED3 83C402                   add  sp, 2
  3031 00000ED6 E92E00                   jmp .retnpexpr
  3032                                  .pexpr112:
  3033                                  
  3034                                  ;-472   expr(0);
  3035                                  
  3036                                  .pexpr110:
  3037 00000ED9 6A00                     push 0
  3038 00000EDB E8AB07                   call expr
  3039 00000EDE 83C402                   add  sp, 2
  3040                                  
  3041                                  ;-473   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  3042                                  
  3043 00000EE1 A1[2400]                 mov ax, [iscmp]
  3044 00000EE4 83F800                   cmp ax, 0
  3045 00000EE7 0F850900                 jne .pexpr113
  3046 00000EEB 68[0A0F]                 push pexpr_1
  3047 00000EEE E8F1F4                   call prs
  3048 00000EF1 83C402                   add  sp, 2
  3049                                  .pexpr113:
  3050 00000EF4 8D063B6A                 lea  ax, [fname]
  3051 00000EF8 50                       push ax
  3052 00000EF9 E8E6F4                   call prs
  3053 00000EFC 83C402                   add  sp, 2
  3054                                  
  3055                                  ;-474   expect(')'); }
  3056                                  
  3057 00000EFF 6A29                     push 41
  3058 00000F01 E82CF9                   call expect
  3059 00000F04 83C402                   add  sp, 2
  3060                                  
  3061                                  ;-475 
  3062                                  
  3063                                  
  3064                                  ;-476 int constantexpr() { int mode; int id1;int ids;
  3065                                  
  3066                                   .retnpexpr:
  3067 00000F07 C3                       ret
  3068 00000F08 5F00                    pexpr_0 db "_",0
  3069 00000F0A 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  3070 00000F13 2C20616C5C6E206A65-
  3071 00000F1C 202E00             
  3072                                  ENDP
  3073                                  
  3074                                  constantexpr: PROC
  3075                                  
  3076                                  ;-477   token=getlex();   mode=typeName();
  3077                                  ;
  3078 00000F1F C8060000                 ENTER  6,0
  3079 00000F23 E8161E                   call getlex
  3080 00000F26 A3[1E00]                 mov word [token], ax
  3081 00000F29 E807FC                   call typeName
  3082 00000F2C 8946FE                   mov [bp-2], ax
  3083                                  
  3084                                  ;-478   id1=searchname(); gettypes(id1); ids=signi;
  3085                                  
  3086 00000F2F E832FB                   call searchname
  3087 00000F32 8946FC                   mov [bp-4], ax
  3088 00000F35 FF76FC                   push word [bp-4]
  3089 00000F38 E872FA                   call gettypes
  3090 00000F3B 83C402                   add  sp, 2
  3091 00000F3E A1[3100]                 mov ax, [signi]
  3092 00000F41 8946FA                   mov [bp-6], ax
  3093                                  
  3094                                  ;-479   if (isrelational() ==0) error1("Relational expression expected");
  3095                                  
  3096 00000F44 E88E1D                   call isrelational
  3097 00000F47 83F800                   cmp ax, 0
  3098 00000F4A 0F850900                 jne .constantexpr114
  3099 00000F4E 68[D40F]                 push constantexpr_0
  3100 00000F51 E88CF6                   call error1
  3101 00000F54 83C402                   add  sp, 2
  3102                                  
  3103                                  ;-480   expect(T_CONST);  prs(" ; constant expression");
  3104                                  
  3105                                  .constantexpr114:
  3106 00000F57 680101                   push 257
  3107 00000F5A E8D3F8                   call expect
  3108 00000F5D 83C402                   add  sp, 2
  3109 00000F60 68[F30F]                 push constantexpr_1
  3110 00000F63 E87CF4                   call prs
  3111 00000F66 83C402                   add  sp, 2
  3112                                  
  3113                                  ;-481   prs("\ncmp ");
  3114                                  
  3115 00000F69 68[0A10]                 push constantexpr_2
  3116 00000F6C E873F4                   call prs
  3117 00000F6F 83C402                   add  sp, 2
  3118                                  
  3119                                  ;-482   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  3120                                  
  3121 00000F72 FF76FC                   push word [bp-4]
  3122 00000F75 E835FA                   call gettypes
  3123 00000F78 83C402                   add  sp, 2
  3124 00000F7B A1[3700]                 mov ax, [wi]
  3125 00000F7E 83F802                   cmp ax, 2
  3126 00000F81 0F850C00                 jne .constantexpr115
  3127 00000F85 68[1110]                 push constantexpr_3
  3128 00000F88 E857F4                   call prs
  3129 00000F8B 83C402                   add  sp, 2
  3130 00000F8E E90900                   jmp .constantexpr116
  3131                                  .constantexpr115:
  3132 00000F91 68[1610]                 push constantexpr_4
  3133 00000F94 E84BF4                   call prs
  3134 00000F97 83C402                   add  sp, 2
  3135                                  
  3136                                  ;-483   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  3137                                  
  3138                                  .constantexpr116:
  3139 00000F9A FF76FC                   push word [bp-4]
  3140 00000F9D E86BF9                   call v
  3141 00000FA0 83C402                   add  sp, 2
  3142 00000FA3 68[1B10]                 push constantexpr_5
  3143 00000FA6 E839F4                   call prs
  3144 00000FA9 83C402                   add  sp, 2
  3145 00000FAC FF36[2C00]               push word [lexval]
  3146 00000FB0 E892F5                   call prunsign1
  3147 00000FB3 83C402                   add  sp, 2
  3148 00000FB6 FF76FA                   push word [bp-6]
  3149 00000FB9 E85B1A                   call cmpneg
  3150 00000FBC 83C402                   add  sp, 2
  3151 00000FBF 8D063B6A                 lea  ax, [fname]
  3152 00000FC3 50                       push ax
  3153 00000FC4 E81BF4                   call prs
  3154 00000FC7 83C402                   add  sp, 2
  3155                                  
  3156                                  ;-484   expect(')');
  3157                                  
  3158 00000FCA 6A29                     push 41
  3159 00000FCC E861F8                   call expect
  3160 00000FCF 83C402                   add  sp, 2
  3161                                  
  3162                                  ;-485 }
  3163                                  
  3164                                  
  3165                                  ;-486 
  3166                                  
  3167                                  
  3168                                  ;-487 char ops[5];
  3169 00000FD2 C9                       LEAVE
  3170 00000FD3 C3                       ret
  3171 00000FD4 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  3172 00000FDD 6C2065787072657373-
  3173 00000FE6 696F6E206578706563-
  3174 00000FEF 74656400           
  3175 00000FF3 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  3176 00000FFC 6E7420657870726573-
  3177 00001005 73696F6E00         
  3178 0000100A 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  3179 00001011 776F726400              constantexpr_3 db "word",0
  3180 00001016 6279746500              constantexpr_4 db "byte",0
  3181 0000101B 2C2000                  constantexpr_5 db ", ",0
  3182                                  ENDP
  3183                                  section .bss
  3184                                  absolute 55840
  3185 0000DA20 <res 00000005>          ops resb 5
  3186                                  section .text
  3187                                  
  3188                                  ;-488 int doreg1(int iscmp1) { int i;
  3189                                  
  3190                                  
  3191                                  doreg1: PROC
  3192                                  
  3193                                  ;-489   if (istoken('='))          strcpy(ops, "mov");
  3194                                  ;
  3195 0000101E C8020000                 ENTER  2,0
  3196 00001022 6A3D                     push 61
  3197 00001024 E8E7F7                   call istoken
  3198 00001027 83C402                   add  sp, 2
  3199 0000102A 08C0                     or  al, al
  3200 0000102C 0F840E00                 je .doreg1117
  3201 00001030 68[D111]                 push doreg1_0
  3202 00001033 8D0620DA                 lea  ax, [ops]
  3203 00001037 50                       push ax
  3204 00001038 E8F1F1                   call strcpy
  3205 0000103B 83C404                   add  sp, 4
  3206                                  
  3207                                  ;-490   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3208                                  
  3209                                  .doreg1117:
  3210 0000103E 68CE04                   push 1230
  3211 00001041 E8CAF7                   call istoken
  3212 00001044 83C402                   add  sp, 2
  3213 00001047 08C0                     or  al, al
  3214 00001049 0F840E00                 je .doreg1118
  3215 0000104D 68[D511]                 push doreg1_1
  3216 00001050 8D0620DA                 lea  ax, [ops]
  3217 00001054 50                       push ax
  3218 00001055 E8D4F1                   call strcpy
  3219 00001058 83C404                   add  sp, 4
  3220                                  
  3221                                  ;-491   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3222                                  
  3223                                  .doreg1118:
  3224 0000105B 68CF04                   push 1231
  3225 0000105E E8ADF7                   call istoken
  3226 00001061 83C402                   add  sp, 2
  3227 00001064 08C0                     or  al, al
  3228 00001066 0F840E00                 je .doreg1119
  3229 0000106A 68[D911]                 push doreg1_2
  3230 0000106D 8D0620DA                 lea  ax, [ops]
  3231 00001071 50                       push ax
  3232 00001072 E8B7F1                   call strcpy
  3233 00001075 83C404                   add  sp, 4
  3234                                  
  3235                                  ;-492   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3236                                  
  3237                                  .doreg1119:
  3238 00001078 68D204                   push 1234
  3239 0000107B E890F7                   call istoken
  3240 0000107E 83C402                   add  sp, 2
  3241 00001081 08C0                     or  al, al
  3242 00001083 0F840E00                 je .doreg1120
  3243 00001087 68[DD11]                 push doreg1_3
  3244 0000108A 8D0620DA                 lea  ax, [ops]
  3245 0000108E 50                       push ax
  3246 0000108F E89AF1                   call strcpy
  3247 00001092 83C404                   add  sp, 4
  3248                                  
  3249                                  ;-493   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3250                                  
  3251                                  .doreg1120:
  3252 00001095 68D304                   push 1235
  3253 00001098 E873F7                   call istoken
  3254 0000109B 83C402                   add  sp, 2
  3255 0000109E 08C0                     or  al, al
  3256 000010A0 0F840E00                 je .doreg1121
  3257 000010A4 68[E111]                 push doreg1_4
  3258 000010A7 8D0620DA                 lea  ax, [ops]
  3259 000010AB 50                       push ax
  3260 000010AC E87DF1                   call strcpy
  3261 000010AF 83C404                   add  sp, 4
  3262                                  
  3263                                  ;-494   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3264                                  
  3265                                  .doreg1121:
  3266 000010B2 68D804                   push 1240
  3267 000010B5 E856F7                   call istoken
  3268 000010B8 83C402                   add  sp, 2
  3269 000010BB 08C0                     or  al, al
  3270 000010BD 0F840E00                 je .doreg1122
  3271 000010C1 68[E411]                 push doreg1_5
  3272 000010C4 8D0620DA                 lea  ax, [ops]
  3273 000010C8 50                       push ax
  3274 000010C9 E860F1                   call strcpy
  3275 000010CC 83C404                   add  sp, 4
  3276                                  
  3277                                  ;-495   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3278                                  
  3279                                  .doreg1122:
  3280 000010CF 68D904                   push 1241
  3281 000010D2 E839F7                   call istoken
  3282 000010D5 83C402                   add  sp, 2
  3283 000010D8 08C0                     or  al, al
  3284 000010DA 0F840E00                 je .doreg1123
  3285 000010DE 68[E811]                 push doreg1_6
  3286 000010E1 8D0620DA                 lea  ax, [ops]
  3287 000010E5 50                       push ax
  3288 000010E6 E843F1                   call strcpy
  3289 000010E9 83C404                   add  sp, 4
  3290                                  
  3291                                  ;-496   if (iscmp1 == 1) { token=getlex();
  3292                                  
  3293                                  .doreg1123:
  3294 000010EC 8B4604                   mov ax, [bp+4]
  3295 000010EF 83F801                   cmp ax, 1
  3296 000010F2 0F852700                 jne .doreg1124
  3297 000010F6 E8431C                   call getlex
  3298 000010F9 A3[1E00]                 mov word [token], ax
  3299                                  
  3300                                  ;-497       if (isrelational() ==0) error1("Relational expected");
  3301                                  
  3302 000010FC E8D61B                   call isrelational
  3303 000010FF 83F800                   cmp ax, 0
  3304 00001102 0F850900                 jne .doreg1125
  3305 00001106 68[EC11]                 push doreg1_7
  3306 00001109 E8D4F4                   call error1
  3307 0000110C 83C402                   add  sp, 2
  3308                                  
  3309                                  ;-498       strcpy(ops, "cmp"); }
  3310                                  
  3311                                  .doreg1125:
  3312 0000110F 68[0012]                 push doreg1_8
  3313 00001112 8D0620DA                 lea  ax, [ops]
  3314 00001116 50                       push ax
  3315 00001117 E812F1                   call strcpy
  3316 0000111A 83C404                   add  sp, 4
  3317                                  
  3318                                  ;-499   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3319                                  
  3320                                  .doreg1124:
  3321 0000111D E856F3                   call prnl
  3322 00001120 8D0620DA                 lea  ax, [ops]
  3323 00001124 50                       push ax
  3324 00001125 E8BAF2                   call prs
  3325 00001128 83C402                   add  sp, 2
  3326 0000112B 68[0412]                 push doreg1_9
  3327 0000112E E8B1F2                   call prs
  3328 00001131 83C402                   add  sp, 2
  3329 00001134 FF36[870E]               push word [ireg1]
  3330 00001138 E8DD04                   call printreg
  3331 0000113B 83C402                   add  sp, 2
  3332 0000113E 68[0712]                 push doreg1_10
  3333 00001141 E89EF2                   call prs
  3334 00001144 83C402                   add  sp, 2
  3335                                  
  3336                                  ;-500 
  3337                                  
  3338                                  
  3339                                  ;-501   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3340                                  
  3341 00001147 680101                   push 257
  3342 0000114A E8C1F6                   call istoken
  3343 0000114D 83C402                   add  sp, 2
  3344 00001150 08C0                     or  al, al
  3345 00001152 0F840D00                 je .doreg1126
  3346 00001156 FF36[2C00]               push word [lexval]
  3347 0000115A E8E8F3                   call prunsign1
  3348 0000115D 83C402                   add  sp, 2
  3349 00001160 E94700                   jmp .reg1
  3350                                  
  3351                                  ;-502   mod2=typeName(); ireg2=checkreg();
  3352                                  
  3353                                  .doreg1126:
  3354 00001163 E8CDF9                   call typeName
  3355 00001166 A3[890E]                 mov word [mod2], ax
  3356 00001169 E89E00                   call checkreg
  3357 0000116C A3[8B0E]                 mov word [ireg2], ax
  3358                                  
  3359                                  ;-503   if (ireg2) {printreg(ireg2); goto reg1;}
  3360                                  
  3361 0000116F A1[8B0E]                 mov ax, [ireg2]
  3362 00001172 08C0                     or  al, al
  3363 00001174 0F840D00                 je .doreg1127
  3364 00001178 FF36[8B0E]               push word [ireg2]
  3365 0000117C E89904                   call printreg
  3366 0000117F 83C402                   add  sp, 2
  3367 00001182 E92500                   jmp .reg1
  3368                                  
  3369                                  ;-504   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3370                                  
  3371                                  .doreg1127:
  3372 00001185 E8DCF8                   call searchname
  3373 00001188 8946FE                   mov [bp-2], ax
  3374 0000118B A1[890E]                 mov ax, [mod2]
  3375 0000118E 83F802                   cmp ax, 2
  3376 00001191 0F850C00                 jne .doreg1128
  3377 00001195 FF76FE                   push word [bp-2]
  3378 00001198 E861F7                   call a
  3379 0000119B 83C402                   add  sp, 2
  3380 0000119E E90900                   jmp .doreg1129
  3381                                  .doreg1128:
  3382 000011A1 FF76FE                   push word [bp-2]
  3383 000011A4 E864F7                   call v
  3384 000011A7 83C402                   add  sp, 2
  3385                                  
  3386                                  ;-505   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3387                                  
  3388                                  .doreg1129:
  3389                                  .reg1:
  3390 000011AA 8B4604                   mov ax, [bp+4]
  3391 000011AD 83F801                   cmp ax, 1
  3392 000011B0 0F851B00                 jne .doreg1130
  3393 000011B4 6A00                     push 0
  3394 000011B6 E85E18                   call cmpneg
  3395 000011B9 83C402                   add  sp, 2
  3396 000011BC 8D063B6A                 lea  ax, [fname]
  3397 000011C0 50                       push ax
  3398 000011C1 E81EF2                   call prs
  3399 000011C4 83C402                   add  sp, 2
  3400 000011C7 6A29                     push 41
  3401 000011C9 E864F6                   call expect
  3402 000011CC 83C402                   add  sp, 2
  3403                                  
  3404                                  ;-506 }
  3405                                  
  3406                                  .doreg1130:
  3407                                  
  3408                                  ;-507 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3409 000011CF C9                       LEAVE
  3410 000011D0 C3                       ret
  3411 000011D1 6D6F7600                doreg1_0 db "mov",0
  3412 000011D5 61646400                doreg1_1 db "add",0
  3413 000011D9 73756200                doreg1_2 db "sub",0
  3414 000011DD 616E6400                doreg1_3 db "and",0
  3415 000011E1 6F7200                  doreg1_4 db "or",0
  3416 000011E4 73686C00                doreg1_5 db "shl",0
  3417 000011E8 73687200                doreg1_6 db "shr",0
  3418 000011EC 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3419 000011F5 6C2065787065637465-
  3420 000011FE 6400               
  3421 00001200 636D7000                doreg1_8 db "cmp",0
  3422 00001204 202000                  doreg1_9 db "  ",0
  3423 00001207 2C2000                  doreg1_10 db ", ",0
  3424                                  ENDP
  3425                                  
  3426                                  checkreg: PROC
  3427                                  
  3428                                  ;-508   if (strlen(symbol) <  2) return 0;
  3429                                  
  3430 0000120A 8D06BB69                 lea  ax, [symbol]
  3431 0000120E 50                       push ax
  3432 0000120F E8F2EF                   call strlen
  3433 00001212 83C402                   add  sp, 2
  3434 00001215 83F802                   cmp ax, 2
  3435 00001218 0F8D0600                 jge .checkreg131
  3436 0000121C B80000                   mov ax, 0
  3437 0000121F E94403                   jmp .retncheckreg
  3438                                  
  3439                                  ;-509   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3440                                  
  3441                                  .checkreg131:
  3442 00001222 68[6715]                 push checkreg_0
  3443 00001225 8D06BB69                 lea  ax, [symbol]
  3444 00001229 50                       push ax
  3445 0000122A E835F0                   call eqstr
  3446 0000122D 83C404                   add  sp, 4
  3447 00001230 08C0                     or  al, al
  3448 00001232 0F840600                 je .checkreg132
  3449 00001236 B80100                   mov ax, 1
  3450 00001239 E92A03                   jmp .retncheckreg
  3451                                  .checkreg132:
  3452 0000123C 68[6A15]                 push checkreg_1
  3453 0000123F 8D06BB69                 lea  ax, [symbol]
  3454 00001243 50                       push ax
  3455 00001244 E81BF0                   call eqstr
  3456 00001247 83C404                   add  sp, 4
  3457 0000124A 08C0                     or  al, al
  3458 0000124C 0F840600                 je .checkreg133
  3459 00001250 B80300                   mov ax, 3
  3460 00001253 E91003                   jmp .retncheckreg
  3461                                  
  3462                                  ;-510   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3463                                  
  3464                                  .checkreg133:
  3465 00001256 68[6D15]                 push checkreg_2
  3466 00001259 8D06BB69                 lea  ax, [symbol]
  3467 0000125D 50                       push ax
  3468 0000125E E801F0                   call eqstr
  3469 00001261 83C404                   add  sp, 4
  3470 00001264 08C0                     or  al, al
  3471 00001266 0F840600                 je .checkreg134
  3472 0000126A B80500                   mov ax, 5
  3473 0000126D E9F602                   jmp .retncheckreg
  3474                                  .checkreg134:
  3475 00001270 68[7015]                 push checkreg_3
  3476 00001273 8D06BB69                 lea  ax, [symbol]
  3477 00001277 50                       push ax
  3478 00001278 E8E7EF                   call eqstr
  3479 0000127B 83C404                   add  sp, 4
  3480 0000127E 08C0                     or  al, al
  3481 00001280 0F840600                 je .checkreg135
  3482 00001284 B80700                   mov ax, 7
  3483 00001287 E9DC02                   jmp .retncheckreg
  3484                                  
  3485                                  ;-511   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3486                                  
  3487                                  .checkreg135:
  3488 0000128A 68[7315]                 push checkreg_4
  3489 0000128D 8D06BB69                 lea  ax, [symbol]
  3490 00001291 50                       push ax
  3491 00001292 E8CDEF                   call eqstr
  3492 00001295 83C404                   add  sp, 4
  3493 00001298 08C0                     or  al, al
  3494 0000129A 0F840600                 je .checkreg136
  3495 0000129E B80900                   mov ax, 9
  3496 000012A1 E9C202                   jmp .retncheckreg
  3497                                  .checkreg136:
  3498 000012A4 68[7615]                 push checkreg_5
  3499 000012A7 8D06BB69                 lea  ax, [symbol]
  3500 000012AB 50                       push ax
  3501 000012AC E8B3EF                   call eqstr
  3502 000012AF 83C404                   add  sp, 4
  3503 000012B2 08C0                     or  al, al
  3504 000012B4 0F840600                 je .checkreg137
  3505 000012B8 B80B00                   mov ax, 11
  3506 000012BB E9A802                   jmp .retncheckreg
  3507                                  
  3508                                  ;-512   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3509                                  
  3510                                  .checkreg137:
  3511 000012BE 68[7915]                 push checkreg_6
  3512 000012C1 8D06BB69                 lea  ax, [symbol]
  3513 000012C5 50                       push ax
  3514 000012C6 E899EF                   call eqstr
  3515 000012C9 83C404                   add  sp, 4
  3516 000012CC 08C0                     or  al, al
  3517 000012CE 0F840600                 je .checkreg138
  3518 000012D2 B80D00                   mov ax, 13
  3519 000012D5 E98E02                   jmp .retncheckreg
  3520                                  .checkreg138:
  3521 000012D8 68[7C15]                 push checkreg_7
  3522 000012DB 8D06BB69                 lea  ax, [symbol]
  3523 000012DF 50                       push ax
  3524 000012E0 E87FEF                   call eqstr
  3525 000012E3 83C404                   add  sp, 4
  3526 000012E6 08C0                     or  al, al
  3527 000012E8 0F840600                 je .checkreg139
  3528 000012EC B80F00                   mov ax, 15
  3529 000012EF E97402                   jmp .retncheckreg
  3530                                  
  3531                                  ;-513   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3532                                  
  3533                                  .checkreg139:
  3534 000012F2 68[7F15]                 push checkreg_8
  3535 000012F5 8D06BB69                 lea  ax, [symbol]
  3536 000012F9 50                       push ax
  3537 000012FA E865EF                   call eqstr
  3538 000012FD 83C404                   add  sp, 4
  3539 00001300 08C0                     or  al, al
  3540 00001302 0F840600                 je .checkreg140
  3541 00001306 B81100                   mov ax, 17
  3542 00001309 E95A02                   jmp .retncheckreg
  3543                                  .checkreg140:
  3544 0000130C 68[8215]                 push checkreg_9
  3545 0000130F 8D06BB69                 lea  ax, [symbol]
  3546 00001313 50                       push ax
  3547 00001314 E84BEF                   call eqstr
  3548 00001317 83C404                   add  sp, 4
  3549 0000131A 08C0                     or  al, al
  3550 0000131C 0F840600                 je .checkreg141
  3551 00001320 B81300                   mov ax, 19
  3552 00001323 E94002                   jmp .retncheckreg
  3553                                  
  3554                                  ;-514   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3555                                  
  3556                                  .checkreg141:
  3557 00001326 68[8515]                 push checkreg_10
  3558 00001329 8D06BB69                 lea  ax, [symbol]
  3559 0000132D 50                       push ax
  3560 0000132E E831EF                   call eqstr
  3561 00001331 83C404                   add  sp, 4
  3562 00001334 08C0                     or  al, al
  3563 00001336 0F840600                 je .checkreg142
  3564 0000133A B81500                   mov ax, 21
  3565 0000133D E92602                   jmp .retncheckreg
  3566                                  .checkreg142:
  3567 00001340 68[8815]                 push checkreg_11
  3568 00001343 8D06BB69                 lea  ax, [symbol]
  3569 00001347 50                       push ax
  3570 00001348 E817EF                   call eqstr
  3571 0000134B 83C404                   add  sp, 4
  3572 0000134E 08C0                     or  al, al
  3573 00001350 0F840600                 je .checkreg143
  3574 00001354 B81700                   mov ax, 23
  3575 00001357 E90C02                   jmp .retncheckreg
  3576                                  
  3577                                  ;-515   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3578                                  
  3579                                  .checkreg143:
  3580 0000135A 68[8B15]                 push checkreg_12
  3581 0000135D 8D06BB69                 lea  ax, [symbol]
  3582 00001361 50                       push ax
  3583 00001362 E8FDEE                   call eqstr
  3584 00001365 83C404                   add  sp, 4
  3585 00001368 08C0                     or  al, al
  3586 0000136A 0F840600                 je .checkreg144
  3587 0000136E B81900                   mov ax, 25
  3588 00001371 E9F201                   jmp .retncheckreg
  3589                                  .checkreg144:
  3590 00001374 68[8E15]                 push checkreg_13
  3591 00001377 8D06BB69                 lea  ax, [symbol]
  3592 0000137B 50                       push ax
  3593 0000137C E8E3EE                   call eqstr
  3594 0000137F 83C404                   add  sp, 4
  3595 00001382 08C0                     or  al, al
  3596 00001384 0F840600                 je .checkreg145
  3597 00001388 B81B00                   mov ax, 27
  3598 0000138B E9D801                   jmp .retncheckreg
  3599                                  
  3600                                  ;-516   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3601                                  
  3602                                  .checkreg145:
  3603 0000138E 68[9115]                 push checkreg_14
  3604 00001391 8D06BB69                 lea  ax, [symbol]
  3605 00001395 50                       push ax
  3606 00001396 E8C9EE                   call eqstr
  3607 00001399 83C404                   add  sp, 4
  3608 0000139C 08C0                     or  al, al
  3609 0000139E 0F840600                 je .checkreg146
  3610 000013A2 B81D00                   mov ax, 29
  3611 000013A5 E9BE01                   jmp .retncheckreg
  3612                                  .checkreg146:
  3613 000013A8 68[9415]                 push checkreg_15
  3614 000013AB 8D06BB69                 lea  ax, [symbol]
  3615 000013AF 50                       push ax
  3616 000013B0 E8AFEE                   call eqstr
  3617 000013B3 83C404                   add  sp, 4
  3618 000013B6 08C0                     or  al, al
  3619 000013B8 0F840600                 je .checkreg147
  3620 000013BC B81F00                   mov ax, 31
  3621 000013BF E9A401                   jmp .retncheckreg
  3622                                  
  3623                                  ;-517   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3624                                  
  3625                                  .checkreg147:
  3626 000013C2 68[9715]                 push checkreg_16
  3627 000013C5 8D06BB69                 lea  ax, [symbol]
  3628 000013C9 50                       push ax
  3629 000013CA E895EE                   call eqstr
  3630 000013CD 83C404                   add  sp, 4
  3631 000013D0 08C0                     or  al, al
  3632 000013D2 0F840600                 je .checkreg148
  3633 000013D6 B82100                   mov ax, 33
  3634 000013D9 E98A01                   jmp .retncheckreg
  3635                                  .checkreg148:
  3636 000013DC 68[9A15]                 push checkreg_17
  3637 000013DF 8D06BB69                 lea  ax, [symbol]
  3638 000013E3 50                       push ax
  3639 000013E4 E87BEE                   call eqstr
  3640 000013E7 83C404                   add  sp, 4
  3641 000013EA 08C0                     or  al, al
  3642 000013EC 0F840600                 je .checkreg149
  3643 000013F0 B82300                   mov ax, 35
  3644 000013F3 E97001                   jmp .retncheckreg
  3645                                  
  3646                                  ;-518   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3647                                  
  3648                                  .checkreg149:
  3649 000013F6 68[9D15]                 push checkreg_18
  3650 000013F9 8D06BB69                 lea  ax, [symbol]
  3651 000013FD 50                       push ax
  3652 000013FE E861EE                   call eqstr
  3653 00001401 83C404                   add  sp, 4
  3654 00001404 08C0                     or  al, al
  3655 00001406 0F840600                 je .checkreg150
  3656 0000140A B82500                   mov ax, 37
  3657 0000140D E95601                   jmp .retncheckreg
  3658                                  .checkreg150:
  3659 00001410 68[A015]                 push checkreg_19
  3660 00001413 8D06BB69                 lea  ax, [symbol]
  3661 00001417 50                       push ax
  3662 00001418 E847EE                   call eqstr
  3663 0000141B 83C404                   add  sp, 4
  3664 0000141E 08C0                     or  al, al
  3665 00001420 0F840600                 je .checkreg151
  3666 00001424 B82700                   mov ax, 39
  3667 00001427 E93C01                   jmp .retncheckreg
  3668                                  
  3669                                  ;-519   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3670                                  
  3671                                  .checkreg151:
  3672 0000142A 68[A315]                 push checkreg_20
  3673 0000142D 8D06BB69                 lea  ax, [symbol]
  3674 00001431 50                       push ax
  3675 00001432 E82DEE                   call eqstr
  3676 00001435 83C404                   add  sp, 4
  3677 00001438 08C0                     or  al, al
  3678 0000143A 0F840600                 je .checkreg152
  3679 0000143E B82900                   mov ax, 41
  3680 00001441 E92201                   jmp .retncheckreg
  3681                                  .checkreg152:
  3682 00001444 68[A615]                 push checkreg_21
  3683 00001447 8D06BB69                 lea  ax, [symbol]
  3684 0000144B 50                       push ax
  3685 0000144C E813EE                   call eqstr
  3686 0000144F 83C404                   add  sp, 4
  3687 00001452 08C0                     or  al, al
  3688 00001454 0F840600                 je .checkreg153
  3689 00001458 B82B00                   mov ax, 43
  3690 0000145B E90801                   jmp .retncheckreg
  3691                                  
  3692                                  ;-520   // (eqstr(symbol,"ip")) return 45;
  3693                                  
  3694                                  
  3695                                  ;-521   if (strlen(symbol) >   3) return 0;
  3696                                  
  3697                                  .checkreg153:
  3698 0000145E 8D06BB69                 lea  ax, [symbol]
  3699 00001462 50                       push ax
  3700 00001463 E89EED                   call strlen
  3701 00001466 83C402                   add  sp, 2
  3702 00001469 83F803                   cmp ax, 3
  3703 0000146C 0F8E0600                 jle .checkreg154
  3704 00001470 B80000                   mov ax, 0
  3705 00001473 E9F000                   jmp .retncheckreg
  3706                                  
  3707                                  ;-522   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3708                                  
  3709                                  .checkreg154:
  3710 00001476 68[A915]                 push checkreg_22
  3711 00001479 8D06BB69                 lea  ax, [symbol]
  3712 0000147D 50                       push ax
  3713 0000147E E8E1ED                   call eqstr
  3714 00001481 83C404                   add  sp, 4
  3715 00001484 08C0                     or  al, al
  3716 00001486 0F840600                 je .checkreg155
  3717 0000148A B82F00                   mov ax, 47
  3718 0000148D E9D600                   jmp .retncheckreg
  3719                                  .checkreg155:
  3720 00001490 68[AD15]                 push checkreg_23
  3721 00001493 8D06BB69                 lea  ax, [symbol]
  3722 00001497 50                       push ax
  3723 00001498 E8C7ED                   call eqstr
  3724 0000149B 83C404                   add  sp, 4
  3725 0000149E 08C0                     or  al, al
  3726 000014A0 0F840600                 je .checkreg156
  3727 000014A4 B83200                   mov ax, 50
  3728 000014A7 E9BC00                   jmp .retncheckreg
  3729                                  
  3730                                  ;-523   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3731                                  
  3732                                  .checkreg156:
  3733 000014AA 68[B115]                 push checkreg_24
  3734 000014AD 8D06BB69                 lea  ax, [symbol]
  3735 000014B1 50                       push ax
  3736 000014B2 E8ADED                   call eqstr
  3737 000014B5 83C404                   add  sp, 4
  3738 000014B8 08C0                     or  al, al
  3739 000014BA 0F840600                 je .checkreg157
  3740 000014BE B83500                   mov ax, 53
  3741 000014C1 E9A200                   jmp .retncheckreg
  3742                                  .checkreg157:
  3743 000014C4 68[B515]                 push checkreg_25
  3744 000014C7 8D06BB69                 lea  ax, [symbol]
  3745 000014CB 50                       push ax
  3746 000014CC E893ED                   call eqstr
  3747 000014CF 83C404                   add  sp, 4
  3748 000014D2 08C0                     or  al, al
  3749 000014D4 0F840600                 je .checkreg158
  3750 000014D8 B83800                   mov ax, 56
  3751 000014DB E98800                   jmp .retncheckreg
  3752                                  
  3753                                  ;-524   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3754                                  
  3755                                  .checkreg158:
  3756 000014DE 68[B915]                 push checkreg_26
  3757 000014E1 8D06BB69                 lea  ax, [symbol]
  3758 000014E5 50                       push ax
  3759 000014E6 E879ED                   call eqstr
  3760 000014E9 83C404                   add  sp, 4
  3761 000014EC 08C0                     or  al, al
  3762 000014EE 0F840600                 je .checkreg159
  3763 000014F2 B83B00                   mov ax, 59
  3764 000014F5 E96E00                   jmp .retncheckreg
  3765                                  .checkreg159:
  3766 000014F8 68[BD15]                 push checkreg_27
  3767 000014FB 8D06BB69                 lea  ax, [symbol]
  3768 000014FF 50                       push ax
  3769 00001500 E85FED                   call eqstr
  3770 00001503 83C404                   add  sp, 4
  3771 00001506 08C0                     or  al, al
  3772 00001508 0F840600                 je .checkreg160
  3773 0000150C B83E00                   mov ax, 62
  3774 0000150F E95400                   jmp .retncheckreg
  3775                                  
  3776                                  ;-525   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3777                                  
  3778                                  .checkreg160:
  3779 00001512 68[C115]                 push checkreg_28
  3780 00001515 8D06BB69                 lea  ax, [symbol]
  3781 00001519 50                       push ax
  3782 0000151A E845ED                   call eqstr
  3783 0000151D 83C404                   add  sp, 4
  3784 00001520 08C0                     or  al, al
  3785 00001522 0F840600                 je .checkreg161
  3786 00001526 B84100                   mov ax, 65
  3787 00001529 E93A00                   jmp .retncheckreg
  3788                                  .checkreg161:
  3789 0000152C 68[C515]                 push checkreg_29
  3790 0000152F 8D06BB69                 lea  ax, [symbol]
  3791 00001533 50                       push ax
  3792 00001534 E82BED                   call eqstr
  3793 00001537 83C404                   add  sp, 4
  3794 0000153A 08C0                     or  al, al
  3795 0000153C 0F840600                 je .checkreg162
  3796 00001540 B84400                   mov ax, 68
  3797 00001543 E92000                   jmp .retncheckreg
  3798                                  
  3799                                  ;-526   if (eqstr(symbol,"cr0")) return 71;
  3800                                  
  3801                                  .checkreg162:
  3802 00001546 68[C915]                 push checkreg_30
  3803 00001549 8D06BB69                 lea  ax, [symbol]
  3804 0000154D 50                       push ax
  3805 0000154E E811ED                   call eqstr
  3806 00001551 83C404                   add  sp, 4
  3807 00001554 08C0                     or  al, al
  3808 00001556 0F840600                 je .checkreg163
  3809 0000155A B84700                   mov ax, 71
  3810 0000155D E90600                   jmp .retncheckreg
  3811                                  
  3812                                  ;-527   return 0;   }
  3813                                  
  3814                                  .checkreg163:
  3815 00001560 B80000                   mov ax, 0
  3816 00001563 E90000                   jmp .retncheckreg
  3817                                  
  3818                                  ;-528 
  3819                                  
  3820                                  
  3821                                  ;-529 char printregstr[]
  3822                                  
  3823                                   .retncheckreg:
  3824 00001566 C3                       ret
  3825 00001567 616C00                  checkreg_0 db "al",0
  3826 0000156A 636C00                  checkreg_1 db "cl",0
  3827 0000156D 646C00                  checkreg_2 db "dl",0
  3828 00001570 626C00                  checkreg_3 db "bl",0
  3829 00001573 616800                  checkreg_4 db "ah",0
  3830 00001576 636800                  checkreg_5 db "ch",0
  3831 00001579 646800                  checkreg_6 db "dh",0
  3832 0000157C 626800                  checkreg_7 db "bh",0
  3833 0000157F 617800                  checkreg_8 db "ax",0
  3834 00001582 637800                  checkreg_9 db "cx",0
  3835 00001585 647800                  checkreg_10 db "dx",0
  3836 00001588 627800                  checkreg_11 db "bx",0
  3837 0000158B 737000                  checkreg_12 db "sp",0
  3838 0000158E 627000                  checkreg_13 db "bp",0
  3839 00001591 736900                  checkreg_14 db "si",0
  3840 00001594 646900                  checkreg_15 db "di",0
  3841 00001597 657300                  checkreg_16 db "es",0
  3842 0000159A 637300                  checkreg_17 db "cs",0
  3843 0000159D 737300                  checkreg_18 db "ss",0
  3844 000015A0 647300                  checkreg_19 db "ds",0
  3845 000015A3 667300                  checkreg_20 db "fs",0
  3846 000015A6 677300                  checkreg_21 db "gs",0
  3847 000015A9 65617800                checkreg_22 db "eax",0
  3848 000015AD 65637800                checkreg_23 db "ecx",0
  3849 000015B1 65647800                checkreg_24 db "edx",0
  3850 000015B5 65627800                checkreg_25 db "ebx",0
  3851 000015B9 65737000                checkreg_26 db "esp",0
  3852 000015BD 65627000                checkreg_27 db "ebp",0
  3853 000015C1 65736900                checkreg_28 db "esi",0
  3854 000015C5 65646900                checkreg_29 db "edi",0
  3855 000015C9 63723000                checkreg_30 db "cr0",0
  3856                                  ENDP
  3857                                  
  3858                                  ;-530 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  3859                                  
  3860 000015CD 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  3861 000015D6 616863686468626861-
  3862 000015DF 786378647862787370-
  3863 000015E8 627073696469657363-
  3864 000015F1 737373647366736773-
  3865 000015FA 697065617865637865-
  3866 00001603 647865627865737065-
  3867 0000160C 627065736965646963-
  3868 00001615 723000             
  3869                                  
  3870                                  ;-531 
  3871                                  
  3872                                  
  3873                                  ;-532 int printreg(int i) {  unsigned int k; unsigned char c;
  3874                                  
  3875                                  
  3876                                  printreg: PROC
  3877                                  
  3878                                  ;-533   k = &printregstr + i; c=*k; prc(c); i++;
  3879                                  ;
  3880 00001618 C8040000                 ENTER  4,0
  3881 0000161C B8[CD15]                 mov ax, printregstr
  3882 0000161F 034604                   add ax, [bp+4]
  3883 00001622 8946FE                   mov [bp-2], ax
  3884 00001625 8B5EFE                   mov bx, [bp-2]
  3885 00001628 8B07                     mov ax, [bx]
  3886 0000162A 8846FC                   mov [bp-4], al
  3887 0000162D 8A46FC                   mov al, byte [bp-4]
  3888 00001630 B400                     mov ah, 0
  3889 00001632 50                       push ax
  3890 00001633 E853ED                   call prc
  3891 00001636 83C402                   add  sp, 2
  3892 00001639 FF4604                   inc  word[bp+4]
  3893                                  
  3894                                  ;-534   k = &printregstr + i; c=*k; prc(c);
  3895                                  
  3896 0000163C B8[CD15]                 mov ax, printregstr
  3897 0000163F 034604                   add ax, [bp+4]
  3898 00001642 8946FE                   mov [bp-2], ax
  3899 00001645 8B5EFE                   mov bx, [bp-2]
  3900 00001648 8B07                     mov ax, [bx]
  3901 0000164A 8846FC                   mov [bp-4], al
  3902 0000164D 8A46FC                   mov al, byte [bp-4]
  3903 00001650 B400                     mov ah, 0
  3904 00001652 50                       push ax
  3905 00001653 E833ED                   call prc
  3906 00001656 83C402                   add  sp, 2
  3907                                  
  3908                                  ;-535   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  3909                                  
  3910 00001659 8B4604                   mov ax, [bp+4]
  3911 0000165C 83F82F                   cmp ax, 47
  3912 0000165F 0F8E2000                 jle .printreg164
  3913 00001663 FF4604                   inc  word[bp+4]
  3914 00001666 B8[CD15]                 mov ax, printregstr
  3915 00001669 034604                   add ax, [bp+4]
  3916 0000166C 8946FE                   mov [bp-2], ax
  3917 0000166F 8B5EFE                   mov bx, [bp-2]
  3918 00001672 8B07                     mov ax, [bx]
  3919 00001674 8846FC                   mov [bp-4], al
  3920 00001677 8A46FC                   mov al, byte [bp-4]
  3921 0000167A B400                     mov ah, 0
  3922 0000167C 50                       push ax
  3923 0000167D E809ED                   call prc
  3924 00001680 83C402                   add  sp, 2
  3925                                  
  3926                                  ;-536 }
  3927                                  
  3928                                  .printreg164:
  3929                                  
  3930                                  ;-537 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  3931 00001683 C9                       LEAVE
  3932 00001684 C3                       ret
  3933                                  ENDP
  3934 00001685 0000                    evalue dw 0
  3935 00001687 0A00                    exprtype dw 10
  3936                                  
  3937                                  ;-538 int expr(int isRight)
  3938                                  
  3939                                  
  3940                                  expr: PROC
  3941                                  
  3942                                  ;-539 { int mode; int id1;     int ixarr; int ixconst;
  3943                                  
  3944                                  
  3945                                  ;-540   int ids;  int isCONST; int i;     unsigned char *p;
  3946                                  
  3947                                  
  3948                                  ;-541   if (istoken(T_CONST)) { evalue=lexval;
  3949                                  ;
  3950 00001689 C8100000                 ENTER  16,0
  3951 0000168D 680101                   push 257
  3952 00001690 E87BF1                   call istoken
  3953 00001693 83C402                   add  sp, 2
  3954 00001696 08C0                     or  al, al
  3955 00001698 0F841F00                 je .expr165
  3956 0000169C A1[2C00]                 mov ax, [lexval]
  3957 0000169F A3[8516]                 mov word [evalue], ax
  3958                                  
  3959                                  ;-542     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  3960                                  
  3961 000016A2 68[291A]                 push expr_0
  3962 000016A5 E83AED                   call prs
  3963 000016A8 83C402                   add  sp, 2
  3964 000016AB FF36[2C00]               push word [lexval]
  3965 000016AF E893EE                   call prunsign1
  3966 000016B2 83C402                   add  sp, 2
  3967 000016B5 B80400                   mov ax, 4
  3968 000016B8 E96C03                   jmp .retnexpr
  3969                                  
  3970                                  ;-543   mode=typeName(); /*0=V,1=*,2=&*/
  3971                                  
  3972                                  .expr165:
  3973 000016BB E875F4                   call typeName
  3974 000016BE 8946FE                   mov [bp-2], ax
  3975                                  
  3976                                  ;-544   ireg1=checkreg();
  3977                                  
  3978 000016C1 E846FB                   call checkreg
  3979 000016C4 A3[870E]                 mov word [ireg1], ax
  3980                                  
  3981                                  ;-545   if (ireg1) { doreg1(0); return; }
  3982                                  
  3983 000016C7 A1[870E]                 mov ax, [ireg1]
  3984 000016CA 08C0                     or  al, al
  3985 000016CC 0F840B00                 je .expr166
  3986 000016D0 6A00                     push 0
  3987 000016D2 E849F9                   call doreg1
  3988 000016D5 83C402                   add  sp, 2
  3989 000016D8 E94C03                   jmp .retnexpr
  3990                                  
  3991                                  ;-546   if (token=='(')  {docall1(); goto e1; }
  3992                                  
  3993                                  .expr166:
  3994 000016DB A1[1E00]                 mov ax, [token]
  3995 000016DE 83F828                   cmp ax, 40
  3996 000016E1 0F850600                 jne .expr167
  3997 000016E5 E82F0F                   call docall1
  3998 000016E8 E93202                   jmp .e1
  3999                                  
  4000                                  ;-547   if (isreg()) goto e1;
  4001                                  
  4002                                  .expr167:
  4003 000016EB E88407                   call isreg
  4004 000016EE 08C0                     or  al, al
  4005 000016F0 0F840300                 je .expr168
  4006 000016F4 E92602                   jmp .e1
  4007                                  
  4008                                  ;-548 
  4009                                  
  4010                                  
  4011                                  ;-549   id1=searchname(); gettypes(id1); ids=signi;
  4012                                  
  4013                                  .expr168:
  4014 000016F7 E86AF3                   call searchname
  4015 000016FA 8946FC                   mov [bp-4], ax
  4016 000016FD FF76FC                   push word [bp-4]
  4017 00001700 E8AAF2                   call gettypes
  4018 00001703 83C402                   add  sp, 2
  4019 00001706 A1[3100]                 mov ax, [signi]
  4020 00001709 8946F6                   mov [bp-10], ax
  4021                                  
  4022                                  ;-550   ixarr=0;  ixconst=0;
  4023                                  
  4024 0000170C B80000                   mov ax, 0
  4025 0000170F 8946FA                   mov [bp-6], ax
  4026 00001712 B80000                   mov ax, 0
  4027 00001715 8946F8                   mov [bp-8], ax
  4028                                  
  4029                                  ;-551     if (istoken('[')) { if (istoken(T_CONST)) {
  4030                                  
  4031 00001718 6A5B                     push 91
  4032 0000171A E8F1F0                   call istoken
  4033 0000171D 83C402                   add  sp, 2
  4034 00001720 08C0                     or  al, al
  4035 00001722 0F845900                 je .expr169
  4036 00001726 680101                   push 257
  4037 00001729 E8E2F0                   call istoken
  4038 0000172C 83C402                   add  sp, 2
  4039 0000172F 08C0                     or  al, al
  4040 00001731 0F841700                 je .expr170
  4041                                  
  4042                                  ;-552       ixconst=1; ixarr=lexval; expect(']');  }
  4043                                  
  4044 00001735 B80100                   mov ax, 1
  4045 00001738 8946F8                   mov [bp-8], ax
  4046 0000173B A1[2C00]                 mov ax, [lexval]
  4047 0000173E 8946FA                   mov [bp-6], ax
  4048 00001741 6A5D                     push 93
  4049 00001743 E8EAF0                   call expect
  4050 00001746 83C402                   add  sp, 2
  4051                                  
  4052                                  ;-553     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4053                                  
  4054 00001749 E93300                   jmp .expr171
  4055                                  .expr170:
  4056 0000174C E815F3                   call searchname
  4057 0000174F 8946FA                   mov [bp-6], ax
  4058 00001752 680001                   push 256
  4059 00001755 E8D8F0                   call expect
  4060 00001758 83C402                   add  sp, 2
  4061 0000175B 6A5D                     push 93
  4062 0000175D E8D0F0                   call expect
  4063 00001760 83C402                   add  sp, 2
  4064                                  
  4065                                  ;-554     gettypes(ixarr);
  4066                                  
  4067 00001763 FF76FA                   push word [bp-6]
  4068 00001766 E844F2                   call gettypes
  4069 00001769 83C402                   add  sp, 2
  4070                                  
  4071                                  ;-555     if (widthi != 2) error1("Array index must be number or int"); } }
  4072                                  
  4073 0000176C A1[3400]                 mov ax, [widthi]
  4074 0000176F 83F802                   cmp ax, 2
  4075 00001772 0F840900                 je  .expr172
  4076 00001776 68[351A]                 push expr_1
  4077 00001779 E864EE                   call error1
  4078 0000177C 83C402                   add  sp, 2
  4079                                  .expr172:
  4080                                  .expr171:
  4081                                  
  4082                                  ;-556   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  4083                                  
  4084                                  .expr169:
  4085 0000177F 68C304                   push 1219
  4086 00001782 E889F0                   call istoken
  4087 00001785 83C402                   add  sp, 2
  4088 00001788 08C0                     or  al, al
  4089 0000178A 0F844600                 je .expr173
  4090 0000178E 8B46FE                   mov ax, [bp-2]
  4091 00001791 08C0                     or  al, al
  4092 00001793 0F840900                 je .expr174
  4093 00001797 68[571A]                 push expr_2
  4094 0000179A E843EE                   call error1
  4095 0000179D 83C402                   add  sp, 2
  4096                                  
  4097                                  ;-557      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4098                                  
  4099                                  .expr174:
  4100 000017A0 68[681A]                 push expr_3
  4101 000017A3 E83CEC                   call prs
  4102 000017A6 83C402                   add  sp, 2
  4103 000017A9 A1[3700]                 mov ax, [wi]
  4104 000017AC 83F802                   cmp ax, 2
  4105 000017AF 0F850C00                 jne .expr175
  4106 000017B3 68[711A]                 push expr_4
  4107 000017B6 E829EC                   call prs
  4108 000017B9 83C402                   add  sp, 2
  4109 000017BC E90900                   jmp .expr176
  4110                                  .expr175:
  4111 000017BF 68[761A]                 push expr_5
  4112 000017C2 E81DEC                   call prs
  4113 000017C5 83C402                   add  sp, 2
  4114                                  
  4115                                  ;-558      v(id1); goto e1;}
  4116                                  
  4117                                  .expr176:
  4118 000017C8 FF76FC                   push word [bp-4]
  4119 000017CB E83DF1                   call v
  4120 000017CE 83C402                   add  sp, 2
  4121 000017D1 E94901                   jmp .e1
  4122                                  
  4123                                  ;-559   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  4124                                  
  4125                                  .expr173:
  4126 000017D4 68C904                   push 1225
  4127 000017D7 E834F0                   call istoken
  4128 000017DA 83C402                   add  sp, 2
  4129 000017DD 08C0                     or  al, al
  4130 000017DF 0F844600                 je .expr177
  4131 000017E3 8B46FE                   mov ax, [bp-2]
  4132 000017E6 08C0                     or  al, al
  4133 000017E8 0F840900                 je .expr178
  4134 000017EC 68[7B1A]                 push expr_6
  4135 000017EF E8EEED                   call error1
  4136 000017F2 83C402                   add  sp, 2
  4137                                  
  4138                                  ;-560      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4139                                  
  4140                                  .expr178:
  4141 000017F5 68[8C1A]                 push expr_7
  4142 000017F8 E8E7EB                   call prs
  4143 000017FB 83C402                   add  sp, 2
  4144 000017FE A1[3700]                 mov ax, [wi]
  4145 00001801 83F802                   cmp ax, 2
  4146 00001804 0F850C00                 jne .expr179
  4147 00001808 68[951A]                 push expr_8
  4148 0000180B E8D4EB                   call prs
  4149 0000180E 83C402                   add  sp, 2
  4150 00001811 E90900                   jmp .expr180
  4151                                  .expr179:
  4152 00001814 68[9A1A]                 push expr_9
  4153 00001817 E8C8EB                   call prs
  4154 0000181A 83C402                   add  sp, 2
  4155                                  
  4156                                  ;-561      v(id1); goto e1;}
  4157                                  
  4158                                  .expr180:
  4159 0000181D FF76FC                   push word [bp-4]
  4160 00001820 E8E8F0                   call v
  4161 00001823 83C402                   add  sp, 2
  4162 00001826 E9F400                   jmp .e1
  4163                                  
  4164                                  ;-562 
  4165                                  
  4166                                  
  4167                                  ;-563   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4168                                  
  4169                                  .expr177:
  4170 00001829 68CE04                   push 1230
  4171 0000182C E8DFEF                   call istoken
  4172 0000182F 83C402                   add  sp, 2
  4173 00001832 08C0                     or  al, al
  4174 00001834 0F841200                 je .expr181
  4175 00001838 FF76FC                   push word [bp-4]
  4176 0000183B FF76FE                   push word [bp-2]
  4177 0000183E 68[9F1A]                 push expr_10
  4178 00001841 E8A902                   call compoundass
  4179 00001844 83C406                   add  sp, 6
  4180 00001847 E9D300                   jmp .e1
  4181                                  
  4182                                  ;-564   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4183                                  
  4184                                  .expr181:
  4185 0000184A 68CF04                   push 1231
  4186 0000184D E8BEEF                   call istoken
  4187 00001850 83C402                   add  sp, 2
  4188 00001853 08C0                     or  al, al
  4189 00001855 0F841200                 je .expr182
  4190 00001859 FF76FC                   push word [bp-4]
  4191 0000185C FF76FE                   push word [bp-2]
  4192 0000185F 68[A31A]                 push expr_11
  4193 00001862 E88802                   call compoundass
  4194 00001865 83C406                   add  sp, 6
  4195 00001868 E9B200                   jmp .e1
  4196                                  
  4197                                  ;-565   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4198                                  
  4199                                  .expr182:
  4200 0000186B 68D204                   push 1234
  4201 0000186E E89DEF                   call istoken
  4202 00001871 83C402                   add  sp, 2
  4203 00001874 08C0                     or  al, al
  4204 00001876 0F841200                 je .expr183
  4205 0000187A FF76FC                   push word [bp-4]
  4206 0000187D FF76FE                   push word [bp-2]
  4207 00001880 68[A71A]                 push expr_12
  4208 00001883 E86702                   call compoundass
  4209 00001886 83C406                   add  sp, 6
  4210 00001889 E99100                   jmp .e1
  4211                                  
  4212                                  ;-566   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  4213                                  
  4214                                  .expr183:
  4215 0000188C 68D304                   push 1235
  4216 0000188F E87CEF                   call istoken
  4217 00001892 83C402                   add  sp, 2
  4218 00001895 08C0                     or  al, al
  4219 00001897 0F841200                 je .expr184
  4220 0000189B FF76FC                   push word [bp-4]
  4221 0000189E FF76FE                   push word [bp-2]
  4222 000018A1 68[AB1A]                 push expr_13
  4223 000018A4 E84602                   call compoundass
  4224 000018A7 83C406                   add  sp, 6
  4225 000018AA E97000                   jmp .e1
  4226                                  
  4227                                  ;-567   if (istoken(T_MULASS    )) {error1("not implemented");}
  4228                                  
  4229                                  .expr184:
  4230 000018AD 68D004                   push 1232
  4231 000018B0 E85BEF                   call istoken
  4232 000018B3 83C402                   add  sp, 2
  4233 000018B6 08C0                     or  al, al
  4234 000018B8 0F840900                 je .expr185
  4235 000018BC 68[AE1A]                 push expr_14
  4236 000018BF E81EED                   call error1
  4237 000018C2 83C402                   add  sp, 2
  4238                                  
  4239                                  ;-568   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4240                                  
  4241                                  .expr185:
  4242 000018C5 68D104                   push 1233
  4243 000018C8 E843EF                   call istoken
  4244 000018CB 83C402                   add  sp, 2
  4245 000018CE 08C0                     or  al, al
  4246 000018D0 0F840900                 je .expr186
  4247 000018D4 68[BE1A]                 push expr_15
  4248 000018D7 E806ED                   call error1
  4249 000018DA 83C402                   add  sp, 2
  4250                                  
  4251                                  ;-569 
  4252                                  
  4253                                  
  4254                                  ;-570   if (istoken('=')) { exprtype= expr(1);
  4255                                  
  4256                                  .expr186:
  4257 000018DD 6A3D                     push 61
  4258 000018DF E82CEF                   call istoken
  4259 000018E2 83C402                   add  sp, 2
  4260 000018E5 08C0                     or  al, al
  4261 000018E7 0F842000                 je .expr187
  4262 000018EB 6A01                     push 1
  4263 000018ED E899FD                   call expr
  4264 000018F0 83C402                   add  sp, 2
  4265 000018F3 A3[8716]                 mov word [exprtype], ax
  4266                                  
  4267                                  ;-571   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4268                                  
  4269 000018F6 FF76F8                   push word [bp-8]
  4270 000018F9 FF76FA                   push word [bp-6]
  4271 000018FC FF76FC                   push word [bp-4]
  4272 000018FF FF76FE                   push word [bp-2]
  4273 00001902 E85F08                   call doassign
  4274 00001905 83C408                   add  sp, 8
  4275 00001908 E91200                   jmp .e1
  4276                                  
  4277                                  ;-572   dovar1(mode, "mov", ixarr, id1);
  4278                                  
  4279                                  .expr187:
  4280 0000190B FF76FC                   push word [bp-4]
  4281 0000190E FF76FA                   push word [bp-6]
  4282 00001911 68[CE1A]                 push expr_16
  4283 00001914 FF76FE                   push word [bp-2]
  4284 00001917 E87502                   call dovar1
  4285 0000191A 83C408                   add  sp, 8
  4286                                  
  4287                                  ;-573 
  4288                                  
  4289                                  
  4290                                  ;-574 e1:    if (istoken('+')) rterm("add");
  4291                                  
  4292                                  .e1:
  4293 0000191D 6A2B                     push 43
  4294 0000191F E8ECEE                   call istoken
  4295 00001922 83C402                   add  sp, 2
  4296 00001925 08C0                     or  al, al
  4297 00001927 0F840C00                 je .expr188
  4298 0000192B 68[D21A]                 push expr_17
  4299 0000192E E82804                   call rterm
  4300 00001931 83C402                   add  sp, 2
  4301                                  
  4302                                  ;-575   else if (istoken('-')) rterm("sub" );
  4303                                  
  4304 00001934 E9CF00                   jmp .expr189
  4305                                  .expr188:
  4306 00001937 6A2D                     push 45
  4307 00001939 E8D2EE                   call istoken
  4308 0000193C 83C402                   add  sp, 2
  4309 0000193F 08C0                     or  al, al
  4310 00001941 0F840C00                 je .expr190
  4311 00001945 68[D61A]                 push expr_18
  4312 00001948 E80E04                   call rterm
  4313 0000194B 83C402                   add  sp, 2
  4314                                  
  4315                                  ;-576   else if (istoken('&')) rterm("and" );
  4316                                  
  4317 0000194E E9B500                   jmp .expr191
  4318                                  .expr190:
  4319 00001951 6A26                     push 38
  4320 00001953 E8B8EE                   call istoken
  4321 00001956 83C402                   add  sp, 2
  4322 00001959 08C0                     or  al, al
  4323 0000195B 0F840C00                 je .expr192
  4324 0000195F 68[DA1A]                 push expr_19
  4325 00001962 E8F403                   call rterm
  4326 00001965 83C402                   add  sp, 2
  4327                                  
  4328                                  ;-577   else if (istoken('|')) rterm("or" );
  4329                                  
  4330 00001968 E99B00                   jmp .expr193
  4331                                  .expr192:
  4332 0000196B 6A7C                     push 124
  4333 0000196D E89EEE                   call istoken
  4334 00001970 83C402                   add  sp, 2
  4335 00001973 08C0                     or  al, al
  4336 00001975 0F840C00                 je .expr194
  4337 00001979 68[DE1A]                 push expr_20
  4338 0000197C E8DA03                   call rterm
  4339 0000197F 83C402                   add  sp, 2
  4340                                  
  4341                                  ;-578   else if (istoken(T_LESSLESS)) rterm("shl");
  4342                                  
  4343 00001982 E98100                   jmp .expr195
  4344                                  .expr194:
  4345 00001985 68D804                   push 1240
  4346 00001988 E883EE                   call istoken
  4347 0000198B 83C402                   add  sp, 2
  4348 0000198E 08C0                     or  al, al
  4349 00001990 0F840C00                 je .expr196
  4350 00001994 68[E11A]                 push expr_21
  4351 00001997 E8BF03                   call rterm
  4352 0000199A 83C402                   add  sp, 2
  4353                                  
  4354                                  ;-579   else if (istoken(T_GREATGREAT)) rterm("shr");
  4355                                  
  4356 0000199D E96600                   jmp .expr197
  4357                                  .expr196:
  4358 000019A0 68D904                   push 1241
  4359 000019A3 E868EE                   call istoken
  4360 000019A6 83C402                   add  sp, 2
  4361 000019A9 08C0                     or  al, al
  4362 000019AB 0F840C00                 je .expr198
  4363 000019AF 68[E51A]                 push expr_22
  4364 000019B2 E8A403                   call rterm
  4365 000019B5 83C402                   add  sp, 2
  4366                                  
  4367                                  ;-580   else if (istoken('*')) domul (ids);
  4368                                  
  4369 000019B8 E94B00                   jmp .expr199
  4370                                  .expr198:
  4371 000019BB 6A2A                     push 42
  4372 000019BD E84EEE                   call istoken
  4373 000019C0 83C402                   add  sp, 2
  4374 000019C3 08C0                     or  al, al
  4375 000019C5 0F840C00                 je .expr200
  4376 000019C9 FF76F6                   push word [bp-10]
  4377 000019CC E8DE09                   call domul
  4378 000019CF 83C402                   add  sp, 2
  4379                                  
  4380                                  ;-581   else if (istoken('/')) doidiv(ids);
  4381                                  
  4382 000019D2 E93100                   jmp .expr201
  4383                                  .expr200:
  4384 000019D5 6A2F                     push 47
  4385 000019D7 E834EE                   call istoken
  4386 000019DA 83C402                   add  sp, 2
  4387 000019DD 08C0                     or  al, al
  4388 000019DF 0F840C00                 je .expr202
  4389 000019E3 FF76F6                   push word [bp-10]
  4390 000019E6 E8650A                   call doidiv
  4391 000019E9 83C402                   add  sp, 2
  4392                                  
  4393                                  ;-582   else if (istoken('%')) domod (ids);
  4394                                  
  4395 000019EC E91700                   jmp .expr203
  4396                                  .expr202:
  4397 000019EF 6A25                     push 37
  4398 000019F1 E81AEE                   call istoken
  4399 000019F4 83C402                   add  sp, 2
  4400 000019F7 08C0                     or  al, al
  4401 000019F9 0F840900                 je .expr204
  4402 000019FD FF76F6                   push word [bp-10]
  4403 00001A00 E8EE0B                   call domod
  4404 00001A03 83C402                   add  sp, 2
  4405                                  
  4406                                  ;-583   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4407                                  
  4408                                  .expr204:
  4409                                  .expr203:
  4410                                  .expr201:
  4411                                  .expr199:
  4412                                  .expr197:
  4413                                  .expr195:
  4414                                  .expr193:
  4415                                  .expr191:
  4416                                  .expr189:
  4417 00001A06 E8CC12                   call isrelational
  4418 00001A09 08C0                     or  al, al
  4419 00001A0B 0F841200                 je .expr205
  4420 00001A0F 68[E91A]                 push expr_23
  4421 00001A12 E84403                   call rterm
  4422 00001A15 83C402                   add  sp, 2
  4423 00001A18 FF76F6                   push word [bp-10]
  4424 00001A1B E8F90F                   call cmpneg
  4425 00001A1E 83C402                   add  sp, 2
  4426                                  
  4427                                  ;-584   return 0;
  4428                                  
  4429                                  .expr205:
  4430 00001A21 B80000                   mov ax, 0
  4431 00001A24 E90000                   jmp .retnexpr
  4432                                  
  4433                                  ;-585 }
  4434                                  
  4435                                  
  4436                                  ;-586 
  4437                                  
  4438                                  
  4439                                  ;-587 int compoundass(char *op, int mode, int id1) {
  4440                                  
  4441 00001A27 C9                       .retnexpr: LEAVE
  4442 00001A28 C3                       ret
  4443 00001A29 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4444 00001A32 2C2000             
  4445 00001A35 417272617920696E64-     expr_1 db "Array index must be number or int",0
  4446 00001A3E 6578206D7573742062-
  4447 00001A47 65206E756D62657220-
  4448 00001A50 6F7220696E7400     
  4449 00001A57 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  4450 00001A60 616C6C6F77656400   
  4451 00001A68 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4452 00001A71 776F726400              expr_4 db "word",0
  4453 00001A76 6279746500              expr_5 db "byte",0
  4454 00001A7B 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  4455 00001A84 616C6C6F77656400   
  4456 00001A8C 5C6E20646563202000      expr_7 db "\n dec  ",0
  4457 00001A95 776F726400              expr_8 db "word",0
  4458 00001A9A 6279746500              expr_9 db "byte",0
  4459 00001A9F 61646400                expr_10 db "add",0
  4460 00001AA3 73756200                expr_11 db "sub",0
  4461 00001AA7 616E6400                expr_12 db "and",0
  4462 00001AAB 6F7200                  expr_13 db "or",0
  4463 00001AAE 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4464 00001AB7 6D656E74656400     
  4465 00001ABE 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4466 00001AC7 6D656E74656400     
  4467 00001ACE 6D6F7600                expr_16 db "mov",0
  4468 00001AD2 61646400                expr_17 db "add",0
  4469 00001AD6 73756200                expr_18 db "sub",0
  4470 00001ADA 616E6400                expr_19 db "and",0
  4471 00001ADE 6F7200                  expr_20 db "or",0
  4472 00001AE1 73686C00                expr_21 db "shl",0
  4473 00001AE5 73687200                expr_22 db "shr",0
  4474 00001AE9 636D7000                expr_23 db "cmp",0
  4475                                  ENDP
  4476                                  
  4477                                  compoundass: PROC
  4478                                  
  4479                                  ;-588   if(mode) error1("only scalar Var allowed");
  4480                                  ;
  4481 00001AED C8000000                 ENTER  0,0
  4482 00001AF1 8B4606                   mov ax, [bp+6]
  4483 00001AF4 08C0                     or  al, al
  4484 00001AF6 0F840900                 je .compoundass206
  4485 00001AFA 68[671B]                 push compoundass_0
  4486 00001AFD E8E0EA                   call error1
  4487 00001B00 83C402                   add  sp, 2
  4488                                  
  4489                                  ;-589   prnl(); prs(op); prs("  ");
  4490                                  
  4491                                  .compoundass206:
  4492 00001B03 E870E9                   call prnl
  4493 00001B06 FF7604                   push word [bp+4]
  4494 00001B09 E8D6E8                   call prs
  4495 00001B0C 83C402                   add  sp, 2
  4496 00001B0F 68[7F1B]                 push compoundass_1
  4497 00001B12 E8CDE8                   call prs
  4498 00001B15 83C402                   add  sp, 2
  4499                                  
  4500                                  ;-590   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4501                                  
  4502 00001B18 FF7608                   push word [bp+8]
  4503 00001B1B E88FEE                   call gettypes
  4504 00001B1E 83C402                   add  sp, 2
  4505 00001B21 A1[3700]                 mov ax, [wi]
  4506 00001B24 83F802                   cmp ax, 2
  4507 00001B27 0F850C00                 jne .compoundass207
  4508 00001B2B 68[821B]                 push compoundass_2
  4509 00001B2E E8B1E8                   call prs
  4510 00001B31 83C402                   add  sp, 2
  4511 00001B34 E90900                   jmp .compoundass208
  4512                                  .compoundass207:
  4513 00001B37 68[871B]                 push compoundass_3
  4514 00001B3A E8A5E8                   call prs
  4515 00001B3D 83C402                   add  sp, 2
  4516                                  
  4517                                  ;-591   v(id1); prs(", ");
  4518                                  
  4519                                  .compoundass208:
  4520 00001B40 FF7608                   push word [bp+8]
  4521 00001B43 E8C5ED                   call v
  4522 00001B46 83C402                   add  sp, 2
  4523 00001B49 68[8C1B]                 push compoundass_4
  4524 00001B4C E893E8                   call prs
  4525 00001B4F 83C402                   add  sp, 2
  4526                                  
  4527                                  ;-592   expect(T_CONST); prunsign1(lexval);
  4528                                  
  4529 00001B52 680101                   push 257
  4530 00001B55 E8D8EC                   call expect
  4531 00001B58 83C402                   add  sp, 2
  4532 00001B5B FF36[2C00]               push word [lexval]
  4533 00001B5F E8E3E9                   call prunsign1
  4534 00001B62 83C402                   add  sp, 2
  4535                                  
  4536                                  ;-593 }
  4537                                  
  4538                                  
  4539                                  ;-594 int dovar1(int mode, int op, int ixarr, int id1) {
  4540 00001B65 C9                       LEAVE
  4541 00001B66 C3                       ret
  4542 00001B67 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4543 00001B70 61722056617220616C-
  4544 00001B79 6C6F77656400       
  4545 00001B7F 202000                  compoundass_1 db "  ",0
  4546 00001B82 776F726400              compoundass_2 db "word",0
  4547 00001B87 6279746500              compoundass_3 db "byte",0
  4548 00001B8C 2C2000                  compoundass_4 db ", ",0
  4549                                  ENDP
  4550                                  
  4551                                  dovar1: PROC
  4552                                  
  4553                                  ;-595   gettypes(id1);
  4554                                  ;
  4555 00001B8F C8000000                 ENTER  0,0
  4556 00001B93 FF760A                   push word [bp+10]
  4557 00001B96 E814EE                   call gettypes
  4558 00001B99 83C402                   add  sp, 2
  4559                                  
  4560                                  ;-596   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4561                                  
  4562 00001B9C 8B4604                   mov ax, [bp+4]
  4563 00001B9F 83F801                   cmp ax, 1
  4564 00001BA2 0F854700                 jne .dovar1209
  4565 00001BA6 68[E41C]                 push dovar1_0
  4566 00001BA9 E836E8                   call prs
  4567 00001BAC 83C402                   add  sp, 2
  4568 00001BAF FF760A                   push word [bp+10]
  4569 00001BB2 E856ED                   call v
  4570 00001BB5 83C402                   add  sp, 2
  4571 00001BB8 E8BBE8                   call prnl
  4572 00001BBB FF7606                   push word [bp+6]
  4573 00001BBE E821E8                   call prs
  4574 00001BC1 83C402                   add  sp, 2
  4575                                  
  4576                                  ;-597     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4577                                  
  4578 00001BC4 A1[3400]                 mov ax, [widthi]
  4579 00001BC7 83F801                   cmp ax, 1
  4580 00001BCA 0F850900                 jne .dovar1210
  4581 00001BCE 68[F01C]                 push dovar1_1
  4582 00001BD1 E80EE8                   call prs
  4583 00001BD4 83C402                   add  sp, 2
  4584                                  
  4585                                  ;-598     if(widthi == 2) prs(" ax, [bx]");
  4586                                  
  4587                                  .dovar1210:
  4588 00001BD7 A1[3400]                 mov ax, [widthi]
  4589 00001BDA 83F802                   cmp ax, 2
  4590 00001BDD 0F850900                 jne .dovar1211
  4591 00001BE1 68[061D]                 push dovar1_2
  4592 00001BE4 E8FBE7                   call prs
  4593 00001BE7 83C402                   add  sp, 2
  4594                                  
  4595                                  ;-599     return; }
  4596                                  
  4597                                  .dovar1211:
  4598 00001BEA E9F500                   jmp .retndovar1
  4599                                  
  4600                                  ;-600   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4601                                  
  4602                                  .dovar1209:
  4603 00001BED 8B4604                   mov ax, [bp+4]
  4604 00001BF0 83F802                   cmp ax, 2
  4605 00001BF3 0F852100                 jne .dovar1212
  4606 00001BF7 E87CE8                   call prnl
  4607 00001BFA FF7606                   push word [bp+6]
  4608 00001BFD E8E2E7                   call prs
  4609 00001C00 83C402                   add  sp, 2
  4610 00001C03 68[101D]                 push dovar1_3
  4611 00001C06 E8D9E7                   call prs
  4612 00001C09 83C402                   add  sp, 2
  4613 00001C0C FF760A                   push word [bp+10]
  4614 00001C0F E8EAEC                   call a
  4615 00001C12 83C402                   add  sp, 2
  4616 00001C15 E9CA00                   jmp .retndovar1
  4617                                  
  4618                                  ;-601   if (ixarr) {
  4619                                  
  4620                                  .dovar1212:
  4621 00001C18 8B4608                   mov ax, [bp+8]
  4622 00001C1B 08C0                     or  al, al
  4623 00001C1D 0F847300                 je .dovar1213
  4624                                  
  4625                                  ;-602     prs("\n mov bx, "); v(ixarr);
  4626                                  
  4627 00001C21 68[161D]                 push dovar1_4
  4628 00001C24 E8BBE7                   call prs
  4629 00001C27 83C402                   add  sp, 2
  4630 00001C2A FF7608                   push word [bp+8]
  4631 00001C2D E8DBEC                   call v
  4632 00001C30 83C402                   add  sp, 2
  4633                                  
  4634                                  ;-603     if (wi==2) prs("\n shl bx, 1");
  4635                                  
  4636 00001C33 A1[3700]                 mov ax, [wi]
  4637 00001C36 83F802                   cmp ax, 2
  4638 00001C39 0F850900                 jne .dovar1214
  4639 00001C3D 68[221D]                 push dovar1_5
  4640 00001C40 E89FE7                   call prs
  4641 00001C43 83C402                   add  sp, 2
  4642                                  
  4643                                  ;-604     prs("\n "); prs(op);
  4644                                  
  4645                                  .dovar1214:
  4646 00001C46 68[2F1D]                 push dovar1_6
  4647 00001C49 E896E7                   call prs
  4648 00001C4C 83C402                   add  sp, 2
  4649 00001C4F FF7606                   push word [bp+6]
  4650 00001C52 E88DE7                   call prs
  4651 00001C55 83C402                   add  sp, 2
  4652                                  
  4653                                  ;-605     if (wi==2) prs(" ax, "); else prs(" al, ");
  4654                                  
  4655 00001C58 A1[3700]                 mov ax, [wi]
  4656 00001C5B 83F802                   cmp ax, 2
  4657 00001C5E 0F850C00                 jne .dovar1215
  4658 00001C62 68[331D]                 push dovar1_7
  4659 00001C65 E87AE7                   call prs
  4660 00001C68 83C402                   add  sp, 2
  4661 00001C6B E90900                   jmp .dovar1216
  4662                                  .dovar1215:
  4663 00001C6E 68[391D]                 push dovar1_8
  4664 00001C71 E86EE7                   call prs
  4665 00001C74 83C402                   add  sp, 2
  4666                                  
  4667                                  ;-606 // v(id1); prs(" [bx]");
  4668                                  
  4669                                  
  4670                                  ;-607     prc('['); printName(id1); prs(" + bx]");
  4671                                  
  4672                                  .dovar1216:
  4673 00001C77 6A5B                     push 91
  4674 00001C79 E80DE7                   call prc
  4675 00001C7C 83C402                   add  sp, 2
  4676 00001C7F FF760A                   push word [bp+10]
  4677 00001C82 E813EC                   call printName
  4678 00001C85 83C402                   add  sp, 2
  4679 00001C88 68[3F1D]                 push dovar1_9
  4680 00001C8B E854E7                   call prs
  4681 00001C8E 83C402                   add  sp, 2
  4682                                  
  4683                                  ;-608     return; }
  4684                                  
  4685 00001C91 E94E00                   jmp .retndovar1
  4686                                  
  4687                                  ;-609   prnl();prs(op);
  4688                                  
  4689                                  .dovar1213:
  4690 00001C94 E8DFE7                   call prnl
  4691 00001C97 FF7606                   push word [bp+6]
  4692 00001C9A E845E7                   call prs
  4693 00001C9D 83C402                   add  sp, 2
  4694                                  
  4695                                  ;-610   if(wi==1) prs(" al, ");
  4696                                  
  4697 00001CA0 A1[3700]                 mov ax, [wi]
  4698 00001CA3 83F801                   cmp ax, 1
  4699 00001CA6 0F850900                 jne .dovar1217
  4700 00001CAA 68[461D]                 push dovar1_10
  4701 00001CAD E832E7                   call prs
  4702 00001CB0 83C402                   add  sp, 2
  4703                                  
  4704                                  ;-611   if(wi==2) prs(" ax, ");
  4705                                  
  4706                                  .dovar1217:
  4707 00001CB3 A1[3700]                 mov ax, [wi]
  4708 00001CB6 83F802                   cmp ax, 2
  4709 00001CB9 0F850900                 jne .dovar1218
  4710 00001CBD 68[4C1D]                 push dovar1_11
  4711 00001CC0 E81FE7                   call prs
  4712 00001CC3 83C402                   add  sp, 2
  4713                                  
  4714                                  ;-612   if(wi==4) prs(" eax, ");
  4715                                  
  4716                                  .dovar1218:
  4717 00001CC6 A1[3700]                 mov ax, [wi]
  4718 00001CC9 83F804                   cmp ax, 4
  4719 00001CCC 0F850900                 jne .dovar1219
  4720 00001CD0 68[521D]                 push dovar1_12
  4721 00001CD3 E80CE7                   call prs
  4722 00001CD6 83C402                   add  sp, 2
  4723                                  
  4724                                  ;-613   v(id1);
  4725                                  
  4726                                  .dovar1219:
  4727 00001CD9 FF760A                   push word [bp+10]
  4728 00001CDC E82CEC                   call v
  4729 00001CDF 83C402                   add  sp, 2
  4730                                  
  4731                                  ;-614 }
  4732                                  
  4733                                  
  4734                                  ;-615 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4735                                  
  4736 00001CE2 C9                       .retndovar1: LEAVE
  4737 00001CE3 C3                       ret
  4738 00001CE4 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4739 00001CED 2C2000             
  4740 00001CF0 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4741 00001CF9 5C6E206D6F76206168-
  4742 00001D02 2C203000           
  4743 00001D06 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4744 00001D0F 00                 
  4745 00001D10 2061782C2000            dovar1_3 db " ax, ",0
  4746 00001D16 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4747 00001D1F 2C2000             
  4748 00001D22 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4749 00001D2B 2C203100           
  4750 00001D2F 5C6E2000                dovar1_6 db "\n ",0
  4751 00001D33 2061782C2000            dovar1_7 db " ax, ",0
  4752 00001D39 20616C2C2000            dovar1_8 db " al, ",0
  4753 00001D3F 202B2062785D00          dovar1_9 db " + bx]",0
  4754 00001D46 20616C2C2000            dovar1_10 db " al, ",0
  4755 00001D4C 2061782C2000            dovar1_11 db " ax, ",0
  4756 00001D52 206561782C2000          dovar1_12 db " eax, ",0
  4757                                  ENDP
  4758                                  
  4759                                  rterm: PROC
  4760                                  
  4761                                  ;-616   if (istoken(T_CONST)) { prnl(); prs(op);
  4762                                  ;
  4763 00001D59 C8080000                 ENTER  8,0
  4764 00001D5D 680101                   push 257
  4765 00001D60 E8ABEA                   call istoken
  4766 00001D63 83C402                   add  sp, 2
  4767 00001D66 08C0                     or  al, al
  4768 00001D68 0F845200                 je .rterm220
  4769 00001D6C E807E7                   call prnl
  4770 00001D6F FF7604                   push word [bp+4]
  4771 00001D72 E86DE6                   call prs
  4772 00001D75 83C402                   add  sp, 2
  4773                                  
  4774                                  ;-617     if (wi==1) prs(" al, ");
  4775                                  
  4776 00001D78 A1[3700]                 mov ax, [wi]
  4777 00001D7B 83F801                   cmp ax, 1
  4778 00001D7E 0F850900                 jne .rterm221
  4779 00001D82 68[421E]                 push rterm_0
  4780 00001D85 E85AE6                   call prs
  4781 00001D88 83C402                   add  sp, 2
  4782                                  
  4783                                  ;-618     if (wi==2) prs(" ax, ");
  4784                                  
  4785                                  .rterm221:
  4786 00001D8B A1[3700]                 mov ax, [wi]
  4787 00001D8E 83F802                   cmp ax, 2
  4788 00001D91 0F850900                 jne .rterm222
  4789 00001D95 68[481E]                 push rterm_1
  4790 00001D98 E847E6                   call prs
  4791 00001D9B 83C402                   add  sp, 2
  4792                                  
  4793                                  ;-619     if (wi==4) prs(" eax, ");
  4794                                  
  4795                                  .rterm222:
  4796 00001D9E A1[3700]                 mov ax, [wi]
  4797 00001DA1 83F804                   cmp ax, 4
  4798 00001DA4 0F850900                 jne .rterm223
  4799 00001DA8 68[4E1E]                 push rterm_2
  4800 00001DAB E834E6                   call prs
  4801 00001DAE 83C402                   add  sp, 2
  4802                                  
  4803                                  ;-620     prunsign1(lexval); return;}
  4804                                  
  4805                                  .rterm223:
  4806 00001DB1 FF36[2C00]               push word [lexval]
  4807 00001DB5 E88DE7                   call prunsign1
  4808 00001DB8 83C402                   add  sp, 2
  4809 00001DBB E98200                   jmp .retnrterm
  4810                                  
  4811                                  ;-621   mode=typeName(); id1=searchname(); ixarr=0;
  4812                                  
  4813                                  .rterm220:
  4814 00001DBE E872ED                   call typeName
  4815 00001DC1 8946FE                   mov [bp-2], ax
  4816 00001DC4 E89DEC                   call searchname
  4817 00001DC7 8946F8                   mov [bp-8], ax
  4818 00001DCA B80000                   mov ax, 0
  4819 00001DCD 8946FA                   mov [bp-6], ax
  4820                                  
  4821                                  ;-622   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  4822                                  
  4823 00001DD0 6A5B                     push 91
  4824 00001DD2 E839EA                   call istoken
  4825 00001DD5 83C402                   add  sp, 2
  4826 00001DD8 08C0                     or  al, al
  4827 00001DDA 0F843300                 je .rterm224
  4828 00001DDE E883EC                   call searchname
  4829 00001DE1 8946FA                   mov [bp-6], ax
  4830 00001DE4 680001                   push 256
  4831 00001DE7 E846EA                   call expect
  4832 00001DEA 83C402                   add  sp, 2
  4833 00001DED 6A5D                     push 93
  4834 00001DEF E83EEA                   call expect
  4835 00001DF2 83C402                   add  sp, 2
  4836                                  
  4837                                  ;-623     gettypes(ixarr);
  4838                                  
  4839 00001DF5 FF76FA                   push word [bp-6]
  4840 00001DF8 E8B2EB                   call gettypes
  4841 00001DFB 83C402                   add  sp, 2
  4842                                  
  4843                                  ;-624     if (widthi != 2) error1("Arrayindex muss int sein"); }
  4844                                  
  4845 00001DFE A1[3400]                 mov ax, [widthi]
  4846 00001E01 83F802                   cmp ax, 2
  4847 00001E04 0F840900                 je  .rterm225
  4848 00001E08 68[551E]                 push rterm_3
  4849 00001E0B E8D2E7                   call error1
  4850 00001E0E 83C402                   add  sp, 2
  4851                                  .rterm225:
  4852                                  
  4853                                  ;-625   if (eqstr(symbol,"_AX")) return;
  4854                                  
  4855                                  .rterm224:
  4856 00001E11 68[6E1E]                 push rterm_4
  4857 00001E14 8D06BB69                 lea  ax, [symbol]
  4858 00001E18 50                       push ax
  4859 00001E19 E846E4                   call eqstr
  4860 00001E1C 83C404                   add  sp, 4
  4861 00001E1F 08C0                     or  al, al
  4862 00001E21 0F840300                 je .rterm226
  4863 00001E25 E91800                   jmp .retnrterm
  4864                                  
  4865                                  ;-626   opint=op; dovar1(mode, opint, ixarr, id1);
  4866                                  
  4867                                  .rterm226:
  4868 00001E28 8B4604                   mov ax, [bp+4]
  4869 00001E2B 8946FC                   mov [bp-4], ax
  4870 00001E2E FF76F8                   push word [bp-8]
  4871 00001E31 FF76FA                   push word [bp-6]
  4872 00001E34 FF76FC                   push word [bp-4]
  4873 00001E37 FF76FE                   push word [bp-2]
  4874 00001E3A E852FD                   call dovar1
  4875 00001E3D 83C408                   add  sp, 8
  4876                                  
  4877                                  ;-627 }
  4878                                  
  4879                                  
  4880                                  ;-628 int isreg() {
  4881                                  
  4882 00001E40 C9                       .retnrterm: LEAVE
  4883 00001E41 C3                       ret
  4884 00001E42 20616C2C2000            rterm_0 db " al, ",0
  4885 00001E48 2061782C2000            rterm_1 db " ax, ",0
  4886 00001E4E 206561782C2000          rterm_2 db " eax, ",0
  4887 00001E55 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  4888 00001E5E 78206D75737320696E-
  4889 00001E67 74207365696E00     
  4890 00001E6E 5F415800                rterm_4 db "_AX",0
  4891                                  ENDP
  4892                                  
  4893                                  isreg: PROC
  4894                                  
  4895                                  ;-629   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  4896                                  
  4897 00001E72 68[5F20]                 push isreg_0
  4898 00001E75 8D06BB69                 lea  ax, [symbol]
  4899 00001E79 50                       push ax
  4900 00001E7A E8E5E3                   call eqstr
  4901 00001E7D 83C404                   add  sp, 4
  4902 00001E80 08C0                     or  al, al
  4903 00001E82 0F840C00                 je .isreg227
  4904 00001E86 68[6320]                 push isreg_1
  4905 00001E89 E84202                   call doreg
  4906 00001E8C 83C402                   add  sp, 2
  4907 00001E8F E9C601                   jmp .r1
  4908                                  
  4909                                  ;-630   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  4910                                  
  4911                                  .isreg227:
  4912 00001E92 68[6620]                 push isreg_2
  4913 00001E95 8D06BB69                 lea  ax, [symbol]
  4914 00001E99 50                       push ax
  4915 00001E9A E8C5E3                   call eqstr
  4916 00001E9D 83C404                   add  sp, 4
  4917 00001EA0 08C0                     or  al, al
  4918 00001EA2 0F840C00                 je .isreg228
  4919 00001EA6 68[6A20]                 push isreg_3
  4920 00001EA9 E82202                   call doreg
  4921 00001EAC 83C402                   add  sp, 2
  4922 00001EAF E9A601                   jmp .r1
  4923                                  
  4924                                  ;-631   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  4925                                  
  4926                                  .isreg228:
  4927 00001EB2 68[6D20]                 push isreg_4
  4928 00001EB5 8D06BB69                 lea  ax, [symbol]
  4929 00001EB9 50                       push ax
  4930 00001EBA E8A5E3                   call eqstr
  4931 00001EBD 83C404                   add  sp, 4
  4932 00001EC0 08C0                     or  al, al
  4933 00001EC2 0F840C00                 je .isreg229
  4934 00001EC6 68[7120]                 push isreg_5
  4935 00001EC9 E80202                   call doreg
  4936 00001ECC 83C402                   add  sp, 2
  4937 00001ECF E98601                   jmp .r1
  4938                                  
  4939                                  ;-632   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  4940                                  
  4941                                  .isreg229:
  4942 00001ED2 68[7420]                 push isreg_6
  4943 00001ED5 8D06BB69                 lea  ax, [symbol]
  4944 00001ED9 50                       push ax
  4945 00001EDA E885E3                   call eqstr
  4946 00001EDD 83C404                   add  sp, 4
  4947 00001EE0 08C0                     or  al, al
  4948 00001EE2 0F840C00                 je .isreg230
  4949 00001EE6 68[7820]                 push isreg_7
  4950 00001EE9 E8E201                   call doreg
  4951 00001EEC 83C402                   add  sp, 2
  4952 00001EEF E96601                   jmp .r1
  4953                                  
  4954                                  ;-633   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  4955                                  
  4956                                  .isreg230:
  4957 00001EF2 68[7B20]                 push isreg_8
  4958 00001EF5 8D06BB69                 lea  ax, [symbol]
  4959 00001EF9 50                       push ax
  4960 00001EFA E865E3                   call eqstr
  4961 00001EFD 83C404                   add  sp, 4
  4962 00001F00 08C0                     or  al, al
  4963 00001F02 0F840C00                 je .isreg231
  4964 00001F06 68[7F20]                 push isreg_9
  4965 00001F09 E8C201                   call doreg
  4966 00001F0C 83C402                   add  sp, 2
  4967 00001F0F E94601                   jmp .r1
  4968                                  
  4969                                  ;-634   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  4970                                  
  4971                                  .isreg231:
  4972 00001F12 68[8220]                 push isreg_10
  4973 00001F15 8D06BB69                 lea  ax, [symbol]
  4974 00001F19 50                       push ax
  4975 00001F1A E845E3                   call eqstr
  4976 00001F1D 83C404                   add  sp, 4
  4977 00001F20 08C0                     or  al, al
  4978 00001F22 0F840C00                 je .isreg232
  4979 00001F26 68[8620]                 push isreg_11
  4980 00001F29 E8A201                   call doreg
  4981 00001F2C 83C402                   add  sp, 2
  4982 00001F2F E92601                   jmp .r1
  4983                                  
  4984                                  ;-635   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  4985                                  
  4986                                  .isreg232:
  4987 00001F32 68[8920]                 push isreg_12
  4988 00001F35 8D06BB69                 lea  ax, [symbol]
  4989 00001F39 50                       push ax
  4990 00001F3A E825E3                   call eqstr
  4991 00001F3D 83C404                   add  sp, 4
  4992 00001F40 08C0                     or  al, al
  4993 00001F42 0F840C00                 je .isreg233
  4994 00001F46 68[8D20]                 push isreg_13
  4995 00001F49 E88201                   call doreg
  4996 00001F4C 83C402                   add  sp, 2
  4997 00001F4F E90601                   jmp .r1
  4998                                  
  4999                                  ;-636   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5000                                  
  5001                                  .isreg233:
  5002 00001F52 68[9020]                 push isreg_14
  5003 00001F55 8D06BB69                 lea  ax, [symbol]
  5004 00001F59 50                       push ax
  5005 00001F5A E805E3                   call eqstr
  5006 00001F5D 83C404                   add  sp, 4
  5007 00001F60 08C0                     or  al, al
  5008 00001F62 0F840C00                 je .isreg234
  5009 00001F66 68[9420]                 push isreg_15
  5010 00001F69 E86201                   call doreg
  5011 00001F6C 83C402                   add  sp, 2
  5012 00001F6F E9E600                   jmp .r1
  5013                                  
  5014                                  ;-637   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5015                                  
  5016                                  .isreg234:
  5017 00001F72 68[9720]                 push isreg_16
  5018 00001F75 8D06BB69                 lea  ax, [symbol]
  5019 00001F79 50                       push ax
  5020 00001F7A E8E5E2                   call eqstr
  5021 00001F7D 83C404                   add  sp, 4
  5022 00001F80 08C0                     or  al, al
  5023 00001F82 0F840C00                 je .isreg235
  5024 00001F86 68[9B20]                 push isreg_17
  5025 00001F89 E84201                   call doreg
  5026 00001F8C 83C402                   add  sp, 2
  5027 00001F8F E9C600                   jmp .r1
  5028                                  
  5029                                  ;-638   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5030                                  
  5031                                  .isreg235:
  5032 00001F92 68[9E20]                 push isreg_18
  5033 00001F95 8D06BB69                 lea  ax, [symbol]
  5034 00001F99 50                       push ax
  5035 00001F9A E8C5E2                   call eqstr
  5036 00001F9D 83C404                   add  sp, 4
  5037 00001FA0 08C0                     or  al, al
  5038 00001FA2 0F840C00                 je .isreg236
  5039 00001FA6 68[A220]                 push isreg_19
  5040 00001FA9 E82201                   call doreg
  5041 00001FAC 83C402                   add  sp, 2
  5042 00001FAF E9A600                   jmp .r1
  5043                                  
  5044                                  ;-639   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5045                                  
  5046                                  .isreg236:
  5047 00001FB2 68[A520]                 push isreg_20
  5048 00001FB5 8D06BB69                 lea  ax, [symbol]
  5049 00001FB9 50                       push ax
  5050 00001FBA E8A5E2                   call eqstr
  5051 00001FBD 83C404                   add  sp, 4
  5052 00001FC0 08C0                     or  al, al
  5053 00001FC2 0F840C00                 je .isreg237
  5054 00001FC6 68[A920]                 push isreg_21
  5055 00001FC9 E80201                   call doreg
  5056 00001FCC 83C402                   add  sp, 2
  5057 00001FCF E98600                   jmp .r1
  5058                                  
  5059                                  ;-640   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5060                                  
  5061                                  .isreg237:
  5062 00001FD2 68[AC20]                 push isreg_22
  5063 00001FD5 8D06BB69                 lea  ax, [symbol]
  5064 00001FD9 50                       push ax
  5065 00001FDA E885E2                   call eqstr
  5066 00001FDD 83C404                   add  sp, 4
  5067 00001FE0 08C0                     or  al, al
  5068 00001FE2 0F840C00                 je .isreg238
  5069 00001FE6 68[B020]                 push isreg_23
  5070 00001FE9 E8E200                   call doreg
  5071 00001FEC 83C402                   add  sp, 2
  5072 00001FEF E96600                   jmp .r1
  5073                                  
  5074                                  ;-641   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5075                                  
  5076                                  .isreg238:
  5077 00001FF2 68[B320]                 push isreg_24
  5078 00001FF5 8D06BB69                 lea  ax, [symbol]
  5079 00001FF9 50                       push ax
  5080 00001FFA E865E2                   call eqstr
  5081 00001FFD 83C404                   add  sp, 4
  5082 00002000 08C0                     or  al, al
  5083 00002002 0F840C00                 je .isreg239
  5084 00002006 68[B720]                 push isreg_25
  5085 00002009 E8C200                   call doreg
  5086 0000200C 83C402                   add  sp, 2
  5087 0000200F E94600                   jmp .r1
  5088                                  
  5089                                  ;-642   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5090                                  
  5091                                  .isreg239:
  5092 00002012 68[BA20]                 push isreg_26
  5093 00002015 8D06BB69                 lea  ax, [symbol]
  5094 00002019 50                       push ax
  5095 0000201A E845E2                   call eqstr
  5096 0000201D 83C404                   add  sp, 4
  5097 00002020 08C0                     or  al, al
  5098 00002022 0F840C00                 je .isreg240
  5099 00002026 68[BE20]                 push isreg_27
  5100 00002029 E8A200                   call doreg
  5101 0000202C 83C402                   add  sp, 2
  5102 0000202F E92600                   jmp .r1
  5103                                  
  5104                                  ;-643   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5105                                  
  5106                                  .isreg240:
  5107 00002032 68[C120]                 push isreg_28
  5108 00002035 8D06BB69                 lea  ax, [symbol]
  5109 00002039 50                       push ax
  5110 0000203A E825E2                   call eqstr
  5111 0000203D 83C404                   add  sp, 4
  5112 00002040 08C0                     or  al, al
  5113 00002042 0F840C00                 je .isreg241
  5114 00002046 68[C820]                 push isreg_29
  5115 00002049 E88200                   call doreg
  5116 0000204C 83C402                   add  sp, 2
  5117 0000204F E90600                   jmp .r1
  5118                                  
  5119                                  ;-644   return 0;   r1: return 1;
  5120                                  
  5121                                  .isreg241:
  5122 00002052 B80000                   mov ax, 0
  5123 00002055 E90600                   jmp .retnisreg
  5124                                  .r1:
  5125 00002058 B80100                   mov ax, 1
  5126 0000205B E90000                   jmp .retnisreg
  5127                                  
  5128                                  ;-645 }
  5129                                  
  5130                                  
  5131                                  ;-646 int doreg(char *dr) { int i; expect('=');
  5132                                  
  5133                                   .retnisreg:
  5134 0000205E C3                       ret
  5135 0000205F 5F414800                isreg_0 db "_AH",0
  5136 00002063 616800                  isreg_1 db "ah",0
  5137 00002066 5F414C00                isreg_2 db "_AL",0
  5138 0000206A 616C00                  isreg_3 db "al",0
  5139 0000206D 5F415800                isreg_4 db "_AX",0
  5140 00002071 617800                  isreg_5 db "ax",0
  5141 00002074 5F424800                isreg_6 db "_BH",0
  5142 00002078 626800                  isreg_7 db "bh",0
  5143 0000207B 5F424C00                isreg_8 db "_BL",0
  5144 0000207F 626C00                  isreg_9 db "bl",0
  5145 00002082 5F425800                isreg_10 db "_BX",0
  5146 00002086 627800                  isreg_11 db "bx",0
  5147 00002089 5F434800                isreg_12 db "_CH",0
  5148 0000208D 636800                  isreg_13 db "ch",0
  5149 00002090 5F434C00                isreg_14 db "_CL",0
  5150 00002094 636C00                  isreg_15 db "cl",0
  5151 00002097 5F435800                isreg_16 db "_CX",0
  5152 0000209B 637800                  isreg_17 db "cx",0
  5153 0000209E 5F444800                isreg_18 db "_DH",0
  5154 000020A2 646800                  isreg_19 db "dh",0
  5155 000020A5 5F444C00                isreg_20 db "_DL",0
  5156 000020A9 646C00                  isreg_21 db "dl",0
  5157 000020AC 5F445800                isreg_22 db "_DX",0
  5158 000020B0 647800                  isreg_23 db "dx",0
  5159 000020B3 5F534900                isreg_24 db "_SI",0
  5160 000020B7 736900                  isreg_25 db "si",0
  5161 000020BA 5F444900                isreg_26 db "_DI",0
  5162 000020BE 646900                  isreg_27 db "di",0
  5163 000020C1 5F464C41475300          isreg_28 db "_FLAGS",0
  5164 000020C8 666C61677300            isreg_29 db "flags",0
  5165                                  ENDP
  5166                                  
  5167                                  doreg: PROC;
  5168 000020CE C8020000                 ENTER  2,0
  5169 000020D2 6A3D                     push 61
  5170 000020D4 E859E7                   call expect
  5171 000020D7 83C402                   add  sp, 2
  5172                                  
  5173                                  ;-647   prs("\n mov  "); prs(dr); prs(", ");
  5174                                  
  5175 000020DA 68[3D21]                 push doreg_0
  5176 000020DD E802E3                   call prs
  5177 000020E0 83C402                   add  sp, 2
  5178 000020E3 FF7604                   push word [bp+4]
  5179 000020E6 E8F9E2                   call prs
  5180 000020E9 83C402                   add  sp, 2
  5181 000020EC 68[4621]                 push doreg_1
  5182 000020EF E8F0E2                   call prs
  5183 000020F2 83C402                   add  sp, 2
  5184                                  
  5185                                  ;-648        if (istoken(T_CONST)) prunsign1(lexval);
  5186                                  
  5187 000020F5 680101                   push 257
  5188 000020F8 E813E7                   call istoken
  5189 000020FB 83C402                   add  sp, 2
  5190 000020FE 08C0                     or  al, al
  5191 00002100 0F840D00                 je .doreg242
  5192 00002104 FF36[2C00]               push word [lexval]
  5193 00002108 E83AE4                   call prunsign1
  5194 0000210B 83C402                   add  sp, 2
  5195                                  
  5196                                  ;-649   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5197                                  
  5198 0000210E E92A00                   jmp .doreg243
  5199                                  .doreg242:
  5200 00002111 680001                   push 256
  5201 00002114 E8F7E6                   call istoken
  5202 00002117 83C402                   add  sp, 2
  5203 0000211A 08C0                     or  al, al
  5204 0000211C 0F841200                 je .doreg244
  5205 00002120 E841E9                   call searchname
  5206 00002123 8946FE                   mov [bp-2], ax
  5207 00002126 FF76FE                   push word [bp-2]
  5208 00002129 E8DFE7                   call v
  5209 0000212C 83C402                   add  sp, 2
  5210                                  
  5211                                  ;-650   else error1("only number or var allowed"); }
  5212                                  
  5213 0000212F E90900                   jmp .doreg245
  5214                                  .doreg244:
  5215 00002132 68[4921]                 push doreg_2
  5216 00002135 E8A8E4                   call error1
  5217 00002138 83C402                   add  sp, 2
  5218                                  .doreg245:
  5219                                  .doreg243:
  5220                                  
  5221                                  ;-651 
  5222                                  
  5223                                  
  5224                                  ;-652 int doassign(int mode, int i, int ixarr, int ixconst) {
  5225 0000213B C9                       LEAVE
  5226 0000213C C3                       ret
  5227 0000213D 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5228 00002146 2C2000                  doreg_1 db ", ",0
  5229 00002149 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5230 00002152 6572206F7220766172-
  5231 0000215B 20616C6C6F77656400 
  5232                                  ENDP
  5233                                  
  5234                                  doassign: PROC
  5235                                  
  5236                                  ;-653   gettypes(i);
  5237                                  ;
  5238 00002164 C8000000                 ENTER  0,0
  5239 00002168 FF7606                   push word [bp+6]
  5240 0000216B E83FE8                   call gettypes
  5241 0000216E 83C402                   add  sp, 2
  5242                                  
  5243                                  ;-654   if (mode==1) {prs("\n mov  bx, ");v(i);
  5244                                  
  5245 00002171 8B4604                   mov ax, [bp+4]
  5246 00002174 83F801                   cmp ax, 1
  5247 00002177 0F853400                 jne .doassign246
  5248 0000217B 68[0123]                 push doassign_0
  5249 0000217E E861E2                   call prs
  5250 00002181 83C402                   add  sp, 2
  5251 00002184 FF7606                   push word [bp+6]
  5252 00002187 E881E7                   call v
  5253 0000218A 83C402                   add  sp, 2
  5254                                  
  5255                                  ;-655     if (widthi == 2) prs("\n mov  [bx], ax");
  5256                                  
  5257 0000218D A1[3400]                 mov ax, [widthi]
  5258 00002190 83F802                   cmp ax, 2
  5259 00002193 0F850C00                 jne .doassign247
  5260 00002197 68[0E23]                 push doassign_1
  5261 0000219A E845E2                   call prs
  5262 0000219D 83C402                   add  sp, 2
  5263                                  
  5264                                  ;-656     else  prs("\n mov  [bx], al"); return;}
  5265                                  
  5266 000021A0 E90900                   jmp .doassign248
  5267                                  .doassign247:
  5268 000021A3 68[1F23]                 push doassign_2
  5269 000021A6 E839E2                   call prs
  5270 000021A9 83C402                   add  sp, 2
  5271                                  .doassign248:
  5272 000021AC E95001                   jmp .retndoassign
  5273                                  
  5274                                  ;-657   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5275                                  
  5276                                  .doassign246:
  5277 000021AF 8B4604                   mov ax, [bp+4]
  5278 000021B2 83F802                   cmp ax, 2
  5279 000021B5 0F851E00                 jne .doassign249
  5280 000021B9 68[3023]                 push doassign_3
  5281 000021BC E823E2                   call prs
  5282 000021BF 83C402                   add  sp, 2
  5283 000021C2 FF7606                   push word [bp+6]
  5284 000021C5 E834E7                   call a
  5285 000021C8 83C402                   add  sp, 2
  5286 000021CB 68[3923]                 push doassign_4
  5287 000021CE E811E2                   call prs
  5288 000021D1 83C402                   add  sp, 2
  5289 000021D4 E92801                   jmp .retndoassign
  5290                                  
  5291                                  ;-658   if (ixarr) {  prs("\n mov bx, ");
  5292                                  
  5293                                  .doassign249:
  5294 000021D7 8B4608                   mov ax, [bp+8]
  5295 000021DA 08C0                     or  al, al
  5296 000021DC 0F846E00                 je .doassign250
  5297 000021E0 68[3E23]                 push doassign_5
  5298 000021E3 E8FCE1                   call prs
  5299 000021E6 83C402                   add  sp, 2
  5300                                  
  5301                                  ;-659     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5302                                  
  5303 000021E9 8B460A                   mov ax, [bp+10]
  5304 000021EC 08C0                     or  al, al
  5305 000021EE 0F840C00                 je .doassign251
  5306 000021F2 FF7608                   push word [bp+8]
  5307 000021F5 E84DE3                   call prunsign1
  5308 000021F8 83C402                   add  sp, 2
  5309 000021FB E90900                   jmp .doassign252
  5310                                  .doassign251:
  5311 000021FE FF7608                   push word [bp+8]
  5312 00002201 E807E7                   call v
  5313 00002204 83C402                   add  sp, 2
  5314                                  
  5315                                  ;-660     if (wi==2) prs("\n shl bx, 1");
  5316                                  
  5317                                  .doassign252:
  5318 00002207 A1[3700]                 mov ax, [wi]
  5319 0000220A 83F802                   cmp ax, 2
  5320 0000220D 0F850900                 jne .doassign253
  5321 00002211 68[4A23]                 push doassign_6
  5322 00002214 E8CBE1                   call prs
  5323 00002217 83C402                   add  sp, 2
  5324                                  
  5325                                  ;-661     prs("\n mov ["); printName(i);
  5326                                  
  5327                                  .doassign253:
  5328 0000221A 68[5723]                 push doassign_7
  5329 0000221D E8C2E1                   call prs
  5330 00002220 83C402                   add  sp, 2
  5331 00002223 FF7606                   push word [bp+6]
  5332 00002226 E86FE6                   call printName
  5333 00002229 83C402                   add  sp, 2
  5334                                  
  5335                                  ;-662     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5336                                  
  5337 0000222C A1[3700]                 mov ax, [wi]
  5338 0000222F 83F802                   cmp ax, 2
  5339 00002232 0F850C00                 jne .doassign254
  5340 00002236 68[6023]                 push doassign_8
  5341 00002239 E8A6E1                   call prs
  5342 0000223C 83C402                   add  sp, 2
  5343 0000223F E90900                   jmp .doassign255
  5344                                  .doassign254:
  5345 00002242 68[6923]                 push doassign_9
  5346 00002245 E89AE1                   call prs
  5347 00002248 83C402                   add  sp, 2
  5348                                  .doassign255:
  5349 0000224B E9B100                   jmp .retndoassign
  5350                                  
  5351                                  ;-663   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5352                                  
  5353                                  .doassign250:
  5354 0000224E A1[3700]                 mov ax, [wi]
  5355 00002251 83F801                   cmp ax, 1
  5356 00002254 0F853100                 jne .doassign256
  5357 00002258 68[7223]                 push doassign_10
  5358 0000225B E884E1                   call prs
  5359 0000225E 83C402                   add  sp, 2
  5360 00002261 8B4606                   mov ax, [bp+6]
  5361 00002264 3DC800                   cmp ax, 200
  5362 00002267 0F8D0900                 jge .doassign257
  5363 0000226B 68[7A23]                 push doassign_11
  5364 0000226E E871E1                   call prs
  5365 00002271 83C402                   add  sp, 2
  5366                                  
  5367                                  ;-664     } v(i); prs(", al"); return; }
  5368                                  
  5369                                  .doassign257:
  5370 00002274 FF7606                   push word [bp+6]
  5371 00002277 E891E6                   call v
  5372 0000227A 83C402                   add  sp, 2
  5373 0000227D 68[8023]                 push doassign_12
  5374 00002280 E85FE1                   call prs
  5375 00002283 83C402                   add  sp, 2
  5376 00002286 E97600                   jmp .retndoassign
  5377                                  
  5378                                  ;-665   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5379                                  
  5380                                  .doassign256:
  5381 00002289 A1[3700]                 mov ax, [wi]
  5382 0000228C 83F802                   cmp ax, 2
  5383 0000228F 0F853100                 jne .doassign258
  5384 00002293 68[8523]                 push doassign_13
  5385 00002296 E849E1                   call prs
  5386 00002299 83C402                   add  sp, 2
  5387 0000229C 8B4606                   mov ax, [bp+6]
  5388 0000229F 3DC800                   cmp ax, 200
  5389 000022A2 0F8D0900                 jge .doassign259
  5390 000022A6 68[8D23]                 push doassign_14
  5391 000022A9 E836E1                   call prs
  5392 000022AC 83C402                   add  sp, 2
  5393                                  
  5394                                  ;-666     } v(i); prs(", ax"); return; }
  5395                                  
  5396                                  .doassign259:
  5397 000022AF FF7606                   push word [bp+6]
  5398 000022B2 E856E6                   call v
  5399 000022B5 83C402                   add  sp, 2
  5400 000022B8 68[9323]                 push doassign_15
  5401 000022BB E824E1                   call prs
  5402 000022BE 83C402                   add  sp, 2
  5403 000022C1 E93B00                   jmp .retndoassign
  5404                                  
  5405                                  ;-667   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5406                                  
  5407                                  .doassign258:
  5408 000022C4 A1[3700]                 mov ax, [wi]
  5409 000022C7 83F804                   cmp ax, 4
  5410 000022CA 0F853100                 jne .doassign260
  5411 000022CE 68[9823]                 push doassign_16
  5412 000022D1 E80EE1                   call prs
  5413 000022D4 83C402                   add  sp, 2
  5414 000022D7 8B4606                   mov ax, [bp+6]
  5415 000022DA 3DC800                   cmp ax, 200
  5416 000022DD 0F8D0900                 jge .doassign261
  5417 000022E1 68[A023]                 push doassign_17
  5418 000022E4 E8FBE0                   call prs
  5419 000022E7 83C402                   add  sp, 2
  5420                                  
  5421                                  ;-668     } v(i); prs(", eax"); return; }
  5422                                  
  5423                                  .doassign261:
  5424 000022EA FF7606                   push word [bp+6]
  5425 000022ED E81BE6                   call v
  5426 000022F0 83C402                   add  sp, 2
  5427 000022F3 68[A723]                 push doassign_18
  5428 000022F6 E8E9E0                   call prs
  5429 000022F9 83C402                   add  sp, 2
  5430 000022FC E90000                   jmp .retndoassign
  5431                                  
  5432                                  ;-669 }
  5433                                  
  5434                                  .doassign260:
  5435                                  
  5436                                  ;-670 int domul(int ids) {
  5437                                  
  5438 000022FF C9                       .retndoassign: LEAVE
  5439 00002300 C3                       ret
  5440 00002301 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5441 0000230A 782C2000           
  5442 0000230E 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5443 00002317 62785D2C20617800   
  5444 0000231F 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5445 00002328 62785D2C20616C00   
  5446 00002330 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5447 00002339 2C20617800              doassign_4 db ", ax",0
  5448 0000233E 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5449 00002347 2C2000             
  5450 0000234A 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5451 00002353 2C203100           
  5452 00002357 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5453 00002360 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5454 00002369 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5455 00002372 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5456 0000237A 627974652000            doassign_11 db "byte ",0
  5457 00002380 2C20616C00              doassign_12 db ", al",0
  5458 00002385 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5459 0000238D 776F72642000            doassign_14 db "word ",0
  5460 00002393 2C20617800              doassign_15 db ", ax",0
  5461 00002398 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5462 000023A0 64776F72642000          doassign_17 db "dword ",0
  5463 000023A7 2C2065617800            doassign_18 db ", eax",0
  5464                                  ENDP
  5465                                  
  5466                                  domul: PROC
  5467                                  
  5468                                  ;-671   if (ids) rterm("imul"); else {
  5469                                  ;
  5470 000023AD C8000000                 ENTER  0,0
  5471 000023B1 8B4604                   mov ax, [bp+4]
  5472 000023B4 08C0                     or  al, al
  5473 000023B6 0F840C00                 je .domul262
  5474 000023BA 68[FF23]                 push domul_0
  5475 000023BD E899F9                   call rterm
  5476 000023C0 83C402                   add  sp, 2
  5477 000023C3 E93700                   jmp .domul263
  5478                                  .domul262:
  5479                                  
  5480                                  ;-672   if (istoken(T_CONST)) {
  5481                                  
  5482 000023C6 680101                   push 257
  5483 000023C9 E842E4                   call istoken
  5484 000023CC 83C402                   add  sp, 2
  5485 000023CF 08C0                     or  al, al
  5486 000023D1 0F841F00                 je .domul264
  5487                                  
  5488                                  ;-673     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5489                                  
  5490 000023D5 68[0424]                 push domul_1
  5491 000023D8 E807E0                   call prs
  5492 000023DB 83C402                   add  sp, 2
  5493 000023DE FF36[2C00]               push word [lexval]
  5494 000023E2 E860E1                   call prunsign1
  5495 000023E5 83C402                   add  sp, 2
  5496 000023E8 68[1024]                 push domul_2
  5497 000023EB E8F4DF                   call prs
  5498 000023EE 83C402                   add  sp, 2
  5499                                  
  5500                                  ;-674     }
  5501                                  
  5502                                  
  5503                                  ;-675   else error1("with MUL only const number as multiplicator allowed"); } }
  5504                                  
  5505 000023F1 E90900                   jmp .domul265
  5506                                  .domul264:
  5507 000023F4 68[1A24]                 push domul_3
  5508 000023F7 E8E6E1                   call error1
  5509 000023FA 83C402                   add  sp, 2
  5510                                  .domul265:
  5511                                  .domul263:
  5512                                  
  5513                                  ;-676 int doidiv(int ids) { int mode; int id1;
  5514 000023FD C9                       LEAVE
  5515 000023FE C3                       ret
  5516 000023FF 696D756C00              domul_0 db "imul",0
  5517 00002404 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5518 0000240D 2C2000             
  5519 00002410 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5520 00002419 00                 
  5521 0000241A 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5522 00002423 6F6E6C7920636F6E73-
  5523 0000242C 74206E756D62657220-
  5524 00002435 6173206D756C746970-
  5525 0000243E 6C696361746F722061-
  5526 00002447 6C6C6F77656400     
  5527                                  ENDP
  5528                                  
  5529                                  doidiv: PROC
  5530                                  
  5531                                  ;-677   if (istoken(T_CONST)) {
  5532                                  ;
  5533 0000244E C8040000                 ENTER  4,0
  5534 00002452 680101                   push 257
  5535 00002455 E8B6E3                   call istoken
  5536 00002458 83C402                   add  sp, 2
  5537 0000245B 08C0                     or  al, al
  5538 0000245D 0F843400                 je .doidiv266
  5539                                  
  5540                                  ;-678     prs("\n mov bx, "); prunsign1(lexval);
  5541                                  
  5542 00002461 68[1325]                 push doidiv_0
  5543 00002464 E87BDF                   call prs
  5544 00002467 83C402                   add  sp, 2
  5545 0000246A FF36[2C00]               push word [lexval]
  5546 0000246E E8D4E0                   call prunsign1
  5547 00002471 83C402                   add  sp, 2
  5548                                  
  5549                                  ;-679     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5550                                  
  5551 00002474 8B4604                   mov ax, [bp+4]
  5552 00002477 08C0                     or  al, al
  5553 00002479 0F840C00                 je .doidiv267
  5554 0000247D 68[1F25]                 push doidiv_1
  5555 00002480 E85FDF                   call prs
  5556 00002483 83C402                   add  sp, 2
  5557 00002486 E90900                   jmp .doidiv268
  5558                                  .doidiv267:
  5559 00002489 68[3025]                 push doidiv_2
  5560 0000248C E853DF                   call prs
  5561 0000248F 83C402                   add  sp, 2
  5562                                  .doidiv268:
  5563                                  
  5564                                  ;-680   else {
  5565                                  
  5566 00002492 E97C00                   jmp .doidiv269
  5567                                  .doidiv266:
  5568                                  
  5569                                  ;-681     mode=typeName(); id1=searchname();
  5570                                  
  5571 00002495 E89BE6                   call typeName
  5572 00002498 8946FE                   mov [bp-2], ax
  5573 0000249B E8C6E5                   call searchname
  5574 0000249E 8946FC                   mov [bp-4], ax
  5575                                  
  5576                                  ;-682     if (mode) error1("only const number or int as divisor allowed");
  5577                                  
  5578 000024A1 8B46FE                   mov ax, [bp-2]
  5579 000024A4 08C0                     or  al, al
  5580 000024A6 0F840900                 je .doidiv270
  5581 000024AA 68[4625]                 push doidiv_3
  5582 000024AD E830E1                   call error1
  5583 000024B0 83C402                   add  sp, 2
  5584                                  
  5585                                  ;-683     gettypes(id1);
  5586                                  
  5587                                  .doidiv270:
  5588 000024B3 FF76FC                   push word [bp-4]
  5589 000024B6 E8F4E4                   call gettypes
  5590 000024B9 83C402                   add  sp, 2
  5591                                  
  5592                                  ;-684     if (typei) error1("only int as simple var divisor allowed");
  5593                                  
  5594 000024BC A1[2E00]                 mov ax, [typei]
  5595 000024BF 08C0                     or  al, al
  5596 000024C1 0F840900                 je .doidiv271
  5597 000024C5 68[7225]                 push doidiv_4
  5598 000024C8 E815E1                   call error1
  5599 000024CB 83C402                   add  sp, 2
  5600                                  
  5601                                  ;-685     if (wi!=2) error1("only int, no byte as divisor allowed");
  5602                                  
  5603                                  .doidiv271:
  5604 000024CE A1[3700]                 mov ax, [wi]
  5605 000024D1 83F802                   cmp ax, 2
  5606 000024D4 0F840900                 je  .doidiv272
  5607 000024D8 68[9925]                 push doidiv_5
  5608 000024DB E802E1                   call error1
  5609 000024DE 83C402                   add  sp, 2
  5610                                  
  5611                                  ;-686     prs("\n mov bx, "); v(id1);
  5612                                  
  5613                                  .doidiv272:
  5614 000024E1 68[BE25]                 push doidiv_6
  5615 000024E4 E8FBDE                   call prs
  5616 000024E7 83C402                   add  sp, 2
  5617 000024EA FF76FC                   push word [bp-4]
  5618 000024ED E81BE4                   call v
  5619 000024F0 83C402                   add  sp, 2
  5620                                  
  5621                                  ;-687     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5622                                  
  5623 000024F3 8B4604                   mov ax, [bp+4]
  5624 000024F6 08C0                     or  al, al
  5625 000024F8 0F840C00                 je .doidiv273
  5626 000024FC 68[CA25]                 push doidiv_7
  5627 000024FF E8E0DE                   call prs
  5628 00002502 83C402                   add  sp, 2
  5629 00002505 E90900                   jmp .doidiv274
  5630                                  .doidiv273:
  5631 00002508 68[DB25]                 push doidiv_8
  5632 0000250B E8D4DE                   call prs
  5633 0000250E 83C402                   add  sp, 2
  5634                                  .doidiv274:
  5635                                  
  5636                                  ;-688 }
  5637                                  
  5638                                  .doidiv269:
  5639                                  
  5640                                  ;-689 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5641 00002511 C9                       LEAVE
  5642 00002512 C3                       ret
  5643 00002513 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5644 0000251C 2C2000             
  5645 0000251F 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5646 00002528 6964697620627800   
  5647 00002530 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5648 00002539 2C20305C6E20646976-
  5649 00002542 20627800           
  5650 00002546 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5651 0000254F 74206E756D62657220-
  5652 00002558 6F7220696E74206173-
  5653 00002561 2064697669736F7220-
  5654 0000256A 616C6C6F77656400   
  5655 00002572 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5656 0000257B 61732073696D706C65-
  5657 00002584 207661722064697669-
  5658 0000258D 736F7220616C6C6F77-
  5659 00002596 656400             
  5660 00002599 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5661 000025A2 206E6F206279746520-
  5662 000025AB 61732064697669736F-
  5663 000025B4 7220616C6C6F776564-
  5664 000025BD 00                 
  5665 000025BE 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5666 000025C7 2C2000             
  5667 000025CA 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5668 000025D3 6964697620627800   
  5669 000025DB 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5670 000025E4 2C20305C6E20646976-
  5671 000025ED 20627800           
  5672                                  ENDP
  5673                                  
  5674                                  domod: PROC;
  5675 000025F1 C8000000                 ENTER  0,0
  5676 000025F5 FF7604                   push word [bp+4]
  5677 000025F8 E853FE                   call doidiv
  5678 000025FB 83C402                   add  sp, 2
  5679 000025FE 68[0926]                 push domod_0
  5680 00002601 E8DEDD                   call prs
  5681 00002604 83C402                   add  sp, 2
  5682                                  
  5683                                  ;-690 
  5684                                  
  5685                                  
  5686                                  ;-691 int docalltype[10]; int docallvalue[10];
  5687 00002607 C9                       LEAVE
  5688 00002608 C3                       ret
  5689 00002609 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5690 00002612 2C20647800         
  5691                                  ENDP
  5692                                  section .bss
  5693                                  absolute 55845
  5694 0000DA25 <res 00000014>          docalltype resw 10
  5695                                  section .text
  5696                                  section .bss
  5697                                  absolute 55865
  5698 0000DA39 <res 00000014>          docallvalue resw 10
  5699                                  section .text
  5700                                  
  5701                                  ;-692 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5702                                  
  5703                                  section .bss
  5704                                  absolute 55885
  5705 0000DA4D <res 00000011>          procname resb 17
  5706                                  section .text
  5707                                  
  5708                                  ;-693 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5709                                  
  5710                                  
  5711                                  docall1: PROC
  5712                                  
  5713                                  ;-694   narg=0;  sz32=0;
  5714                                  ;
  5715 00002617 C80A0000                 ENTER  10,0
  5716 0000261B B80000                   mov ax, 0
  5717 0000261E 8946FC                   mov [bp-4], ax
  5718 00002621 B80000                   mov ax, 0
  5719 00002624 8946F6                   mov [bp-10], ax
  5720                                  
  5721                                  ;-695   checknamelen();
  5722                                  
  5723 00002627 E814E3                   call checknamelen
  5724                                  
  5725                                  ;-696   strcpy(&procname, symbol);
  5726                                  
  5727 0000262A 8D06BB69                 lea  ax, [symbol]
  5728 0000262E 50                       push ax
  5729 0000262F 8D064DDA                 lea  ax, [procname]
  5730 00002633 50                       push ax
  5731 00002634 E8F5DB                   call strcpy
  5732 00002637 83C404                   add  sp, 4
  5733                                  
  5734                                  ;-697   storeCall1();
  5735                                  
  5736 0000263A E8F7E5                   call storeCall1
  5737                                  
  5738                                  ;-698   expect('(');
  5739                                  
  5740 0000263D 6A28                     push 40
  5741 0000263F E8EEE1                   call expect
  5742 00002642 83C402                   add  sp, 2
  5743                                  
  5744                                  ;-699 	if (istoken(')') ==0 ) {
  5745                                  
  5746 00002645 6A29                     push 41
  5747 00002647 E8C4E1                   call istoken
  5748 0000264A 83C402                   add  sp, 2
  5749 0000264D 83F800                   cmp ax, 0
  5750 00002650 0F857802                 jne .docall1275
  5751                                  
  5752                                  ;-700 	  do { narg++;
  5753                                  
  5754                                  .docall1276:
  5755 00002654 FF46FC                   inc  word[bp-4]
  5756                                  
  5757                                  ;-701 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5758                                  
  5759 00002657 8B46FC                   mov ax, [bp-4]
  5760 0000265A 83F809                   cmp ax, 9
  5761 0000265D 0F8E0900                 jle .docall1277
  5762 00002661 68[1029]                 push docall1_0
  5763 00002664 E879DF                   call error1
  5764 00002667 83C402                   add  sp, 2
  5765                                  .docall1277:
  5766 0000266A B80000                   mov ax, 0
  5767 0000266D 8946FA                   mov [bp-6], ax
  5768                                  
  5769                                  ;-702       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5770                                  
  5771 00002670 680101                   push 257
  5772 00002673 E898E1                   call istoken
  5773 00002676 83C402                   add  sp, 2
  5774 00002679 08C0                     or  al, al
  5775 0000267B 0F840C00                 je .docall1278
  5776 0000267F B80100                   mov ax, 1
  5777 00002682 8946FA                   mov [bp-6], ax
  5778 00002685 A1[2C00]                 mov ax, [lexval]
  5779 00002688 8946F8                   mov [bp-8], ax
  5780                                  
  5781                                  ;-703       if(istoken(T_STRING)){t0=2; n0=nconst;
  5782                                  
  5783                                  .docall1278:
  5784 0000268B 680201                   push 258
  5785 0000268E E87DE1                   call istoken
  5786 00002691 83C402                   add  sp, 2
  5787 00002694 08C0                     or  al, al
  5788 00002696 0F846300                 je .docall1279
  5789 0000269A B80200                   mov ax, 2
  5790 0000269D 8946FA                   mov [bp-6], ax
  5791 000026A0 A1[2600]                 mov ax, [nconst]
  5792 000026A3 8946F8                   mov [bp-8], ax
  5793                                  
  5794                                  ;-704         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  5795                                  
  5796 000026A6 68[2229]                 push docall1_1
  5797 000026A9 E8AFDC                   call eprs
  5798 000026AC 83C402                   add  sp, 2
  5799 000026AF 8D063B6A                 lea  ax, [fname]
  5800 000026B3 50                       push ax
  5801 000026B4 E8A4DC                   call eprs
  5802 000026B7 83C402                   add  sp, 2
  5803 000026BA 6A5F                     push 95
  5804 000026BC E889DC                   call eprc
  5805 000026BF 83C402                   add  sp, 2
  5806 000026C2 FF36[2600]               push word [nconst]
  5807 000026C6 E8BBDD                   call eprnum
  5808 000026C9 83C402                   add  sp, 2
  5809 000026CC 68[2529]                 push docall1_2
  5810 000026CF E889DC                   call eprs
  5811 000026D2 83C402                   add  sp, 2
  5812                                  
  5813                                  ;-705         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  5814                                  
  5815 000026D5 6A22                     push 34
  5816 000026D7 E86EDC                   call eprc
  5817 000026DA 83C402                   add  sp, 2
  5818 000026DD 8D06BB69                 lea  ax, [symbol]
  5819 000026E1 50                       push ax
  5820 000026E2 E876DC                   call eprs
  5821 000026E5 83C402                   add  sp, 2
  5822 000026E8 6A22                     push 34
  5823 000026EA E85BDC                   call eprc
  5824 000026ED 83C402                   add  sp, 2
  5825 000026F0 68[2A29]                 push docall1_3
  5826 000026F3 E865DC                   call eprs
  5827 000026F6 83C402                   add  sp, 2
  5828 000026F9 FF06[2600]               inc  word[nconst]
  5829                                  
  5830                                  ;-706       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  5831                                  
  5832                                  .docall1279:
  5833 000026FD 6A26                     push 38
  5834 000026FF E80CE1                   call istoken
  5835 00002702 83C402                   add  sp, 2
  5836 00002705 08C0                     or  al, al
  5837 00002707 0F840F00                 je .docall1280
  5838 0000270B B80300                   mov ax, 3
  5839 0000270E 8946FA                   mov [bp-6], ax
  5840 00002711 E8F8E4                   call name1
  5841 00002714 E84DE3                   call searchname
  5842 00002717 8946F8                   mov [bp-8], ax
  5843                                  
  5844                                  ;-707       if(istoken(T_NAME))  { n0=checkreg();
  5845                                  
  5846                                  .docall1280:
  5847 0000271A 680001                   push 256
  5848 0000271D E8EEE0                   call istoken
  5849 00002720 83C402                   add  sp, 2
  5850 00002723 08C0                     or  al, al
  5851 00002725 0F844800                 je .docall1281
  5852 00002729 E8DEEA                   call checkreg
  5853 0000272C 8946F8                   mov [bp-8], ax
  5854                                  
  5855                                  ;-708         if (n0) t0=5;
  5856                                  
  5857 0000272F 8B46F8                   mov ax, [bp-8]
  5858 00002732 08C0                     or  al, al
  5859 00002734 0F840900                 je .docall1282
  5860 00002738 B80500                   mov ax, 5
  5861 0000273B 8946FA                   mov [bp-6], ax
  5862                                  
  5863                                  ;-709         else {t0=4; n0=searchname();
  5864                                  
  5865 0000273E E93000                   jmp .docall1283
  5866                                  .docall1282:
  5867 00002741 B80400                   mov ax, 4
  5868 00002744 8946FA                   mov [bp-6], ax
  5869 00002747 E81AE3                   call searchname
  5870 0000274A 8946F8                   mov [bp-8], ax
  5871                                  
  5872                                  ;-710           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  5873                                  
  5874 0000274D B8046B                   mov ax, GType
  5875 00002750 A3[4D00]                 mov word [p1], ax
  5876 00002753 A1[4D00]                 mov ax, [p1]
  5877 00002756 0346F8                   add ax, [bp-8]
  5878 00002759 A3[4D00]                 mov word [p1], ax
  5879 0000275C 8B1E[4D00]               mov bx, [p1]
  5880 00002760 8A07                     mov al, [bx]
  5881 00002762 B400                     mov ah, 0
  5882 00002764 83F826                   cmp ax, 38
  5883 00002767 0F850600                 jne .docall1284
  5884 0000276B B80300                   mov ax, 3
  5885 0000276E 8946FA                   mov [bp-6], ax
  5886                                  .docall1284:
  5887                                  .docall1283:
  5888                                  
  5889                                  ;-711       if (t0==0) error1("parameter not recognized (no * allowed)");
  5890                                  
  5891                                  .docall1281:
  5892 00002771 8B46FA                   mov ax, [bp-6]
  5893 00002774 83F800                   cmp ax, 0
  5894 00002777 0F850900                 jne .docall1285
  5895 0000277B 68[2D29]                 push docall1_4
  5896 0000277E E85FDE                   call error1
  5897 00002781 83C402                   add  sp, 2
  5898                                  
  5899                                  ;-712       docalltype [narg] = t0;
  5900                                  
  5901                                  .docall1285:
  5902 00002784 8B46FA                   mov ax, [bp-6]
  5903 00002787 8B5EFC                   mov bx, [bp-4]
  5904 0000278A D1E3                     shl bx, 1
  5905 0000278C 898725DA                 mov [docalltype+bx], ax
  5906                                  
  5907                                  ;-713       docallvalue[narg] = n0;
  5908                                  
  5909 00002790 8B46F8                   mov ax, [bp-8]
  5910 00002793 8B5EFC                   mov bx, [bp-4]
  5911 00002796 D1E3                     shl bx, 1
  5912 00002798 898739DA                 mov [docallvalue+bx], ax
  5913                                  
  5914                                  ;-714     } while (istoken(','));
  5915                                  
  5916 0000279C 6A2C                     push 44
  5917 0000279E E86DE0                   call istoken
  5918 000027A1 83C402                   add  sp, 2
  5919 000027A4 08C0                     or  al, al
  5920 000027A6 0F840300                 je .docall1286
  5921 000027AA E9A7FE                   jmp .docall1276
  5922                                  .docall1286:
  5923                                  
  5924                                  ;-715 
  5925                                  
  5926                                  
  5927                                  ;-716   	expect(')');  i=narg;
  5928                                  
  5929 000027AD 6A29                     push 41
  5930 000027AF E87EE0                   call expect
  5931 000027B2 83C402                   add  sp, 2
  5932 000027B5 8B46FC                   mov ax, [bp-4]
  5933 000027B8 8946FE                   mov [bp-2], ax
  5934                                  
  5935                                  ;-717     do {
  5936                                  
  5937                                  .docall1287:
  5938                                  
  5939                                  ;-718       t0 = docalltype [i];
  5940                                  
  5941 000027BB 8B5EFE                   mov bx, [bp-2]
  5942 000027BE D1E3                     shl bx, 1
  5943 000027C0 8B8725DA                 mov ax, [docalltype + bx]
  5944 000027C4 8946FA                   mov [bp-6], ax
  5945                                  
  5946                                  ;-719       n0 = docallvalue[i];
  5947                                  
  5948 000027C7 8B5EFE                   mov bx, [bp-2]
  5949 000027CA D1E3                     shl bx, 1
  5950 000027CC 8B8739DA                 mov ax, [docallvalue + bx]
  5951 000027D0 8946F8                   mov [bp-8], ax
  5952                                  
  5953                                  ;-720       if(t0==1){ prs("\n push "); prunsign1(n0);}
  5954                                  
  5955 000027D3 8B46FA                   mov ax, [bp-6]
  5956 000027D6 83F801                   cmp ax, 1
  5957 000027D9 0F851200                 jne .docall1288
  5958 000027DD 68[5529]                 push docall1_5
  5959 000027E0 E8FFDB                   call prs
  5960 000027E3 83C402                   add  sp, 2
  5961 000027E6 FF76F8                   push word [bp-8]
  5962 000027E9 E859DD                   call prunsign1
  5963 000027EC 83C402                   add  sp, 2
  5964                                  
  5965                                  ;-721       if(t0==2){ prs("\n push ");
  5966                                  
  5967                                  .docall1288:
  5968 000027EF 8B46FA                   mov ax, [bp-6]
  5969 000027F2 83F802                   cmp ax, 2
  5970 000027F5 0F852500                 jne .docall1289
  5971 000027F9 68[5E29]                 push docall1_6
  5972 000027FC E8E3DB                   call prs
  5973 000027FF 83C402                   add  sp, 2
  5974                                  
  5975                                  ;-722         prs(fname);prc(95);prunsign1(n0);}
  5976                                  
  5977 00002802 8D063B6A                 lea  ax, [fname]
  5978 00002806 50                       push ax
  5979 00002807 E8D8DB                   call prs
  5980 0000280A 83C402                   add  sp, 2
  5981 0000280D 6A5F                     push 95
  5982 0000280F E877DB                   call prc
  5983 00002812 83C402                   add  sp, 2
  5984 00002815 FF76F8                   push word [bp-8]
  5985 00002818 E82ADD                   call prunsign1
  5986 0000281B 83C402                   add  sp, 2
  5987                                  
  5988                                  ;-723       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  5989                                  
  5990                                  .docall1289:
  5991 0000281E 8B46FA                   mov ax, [bp-6]
  5992 00002821 83F803                   cmp ax, 3
  5993 00002824 0F851B00                 jne .docall1290
  5994 00002828 68[6729]                 push docall1_7
  5995 0000282B E8B4DB                   call prs
  5996 0000282E 83C402                   add  sp, 2
  5997 00002831 FF76F8                   push word [bp-8]
  5998 00002834 E8D4E0                   call v
  5999 00002837 83C402                   add  sp, 2
  6000                                  
  6001                                  ;-724         prs("\n push ax");}
  6002                                  
  6003 0000283A 68[7429]                 push docall1_8
  6004 0000283D E8A2DB                   call prs
  6005 00002840 83C402                   add  sp, 2
  6006                                  
  6007                                  ;-725       if(t0==4){ gettypes(n0);
  6008                                  
  6009                                  .docall1290:
  6010 00002843 8B46FA                   mov ax, [bp-6]
  6011 00002846 83F804                   cmp ax, 4
  6012 00002849 0F854300                 jne .docall1291
  6013 0000284D FF76F8                   push word [bp-8]
  6014 00002850 E85AE1                   call gettypes
  6015 00002853 83C402                   add  sp, 2
  6016                                  
  6017                                  ;-726         if(wi==2) { prs("\n push word "); v(n0);}
  6018                                  
  6019 00002856 A1[3700]                 mov ax, [wi]
  6020 00002859 83F802                   cmp ax, 2
  6021 0000285C 0F851500                 jne .docall1292
  6022 00002860 68[7F29]                 push docall1_9
  6023 00002863 E87CDB                   call prs
  6024 00002866 83C402                   add  sp, 2
  6025 00002869 FF76F8                   push word [bp-8]
  6026 0000286C E89CE0                   call v
  6027 0000286F 83C402                   add  sp, 2
  6028                                  
  6029                                  ;-727         else { prs("\n mov al, byte ");   v(n0);
  6030                                  
  6031 00002872 E91B00                   jmp .docall1293
  6032                                  .docall1292:
  6033 00002875 68[8D29]                 push docall1_10
  6034 00002878 E867DB                   call prs
  6035 0000287B 83C402                   add  sp, 2
  6036 0000287E FF76F8                   push word [bp-8]
  6037 00002881 E887E0                   call v
  6038 00002884 83C402                   add  sp, 2
  6039                                  
  6040                                  ;-728         prs("\n mov ah, 0\n push ax"); } }
  6041                                  
  6042 00002887 68[9E29]                 push docall1_11
  6043 0000288A E855DB                   call prs
  6044 0000288D 83C402                   add  sp, 2
  6045                                  .docall1293:
  6046                                  
  6047                                  ;-729       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6048                                  
  6049                                  .docall1291:
  6050 00002890 8B46FA                   mov ax, [bp-6]
  6051 00002893 83F805                   cmp ax, 5
  6052 00002896 0F852200                 jne .docall1294
  6053 0000289A 68[B529]                 push docall1_12
  6054 0000289D E842DB                   call prs
  6055 000028A0 83C402                   add  sp, 2
  6056 000028A3 FF76F8                   push word [bp-8]
  6057 000028A6 E86FED                   call printreg
  6058 000028A9 83C402                   add  sp, 2
  6059 000028AC 8B46F8                   mov ax, [bp-8]
  6060 000028AF 83F82F                   cmp ax, 47 ;unsigned : 1
  6061 000028B2 0F8C0600                 jl  .docall1295
  6062 000028B6 8B46F6                   mov ax, [bp-10]
  6063 000028B9 83C002                   add ax, 2
  6064                                  .docall1295:
  6065                                  
  6066                                  ;-730    i--; } while (i > 0);  }
  6067                                  
  6068                                  .docall1294:
  6069 000028BC FF4EFE                   dec  word[bp-2]
  6070 000028BF 8B46FE                   mov ax, [bp-2]
  6071 000028C2 83F800                   cmp ax, 0
  6072 000028C5 0F8E0300                 jle .docall1296
  6073 000028C9 E9EFFE                   jmp .docall1287
  6074                                  .docall1296:
  6075                                  
  6076                                  ;-731 	 prs("\n call "); prs(&procname);
  6077                                  
  6078                                  .docall1275:
  6079 000028CC 68[BE29]                 push docall1_13
  6080 000028CF E810DB                   call prs
  6081 000028D2 83C402                   add  sp, 2
  6082 000028D5 8D064DDA                 lea  ax, [procname]
  6083 000028D9 50                       push ax
  6084 000028DA E805DB                   call prs
  6085 000028DD 83C402                   add  sp, 2
  6086                                  
  6087                                  ;-732 	 if (narg>0) {prs("\n add  sp, ");
  6088                                  
  6089 000028E0 8B46FC                   mov ax, [bp-4]
  6090 000028E3 83F800                   cmp ax, 0
  6091 000028E6 0F8E2400                 jle .docall1297
  6092 000028EA 68[C729]                 push docall1_14
  6093 000028ED E8F2DA                   call prs
  6094 000028F0 83C402                   add  sp, 2
  6095                                  
  6096                                  ;-733      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6097                                  
  6098 000028F3 8B46FC                   mov ax, [bp-4]
  6099 000028F6 0346FC                   add ax, [bp-4]
  6100 000028F9 8946FC                   mov [bp-4], ax
  6101 000028FC 8B46FC                   mov ax, [bp-4]
  6102 000028FF 0346F6                   add ax, [bp-10]
  6103 00002902 8946FC                   mov [bp-4], ax
  6104 00002905 FF76FC                   push word [bp-4]
  6105 00002908 E83ADC                   call prunsign1
  6106 0000290B 83C402                   add  sp, 2
  6107                                  .docall1297:
  6108                                  
  6109                                  ;-734 /***************************************************************/
  6110                                  
  6111                                  
  6112                                  ;-735 
  6113                                  
  6114                                  
  6115                                  ;-736 int doemit() {prs("\n db ");
  6116 0000290E C9                       LEAVE
  6117 0000290F C3                       ret
  6118 00002910 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6119 00002919 72616D657465727300 
  6120 00002922 5C6E00                  docall1_1 db "\n",0
  6121 00002925 2064622000              docall1_2 db " db ",0
  6122 0000292A 2C3000                  docall1_3 db ",0",0
  6123 0000292D 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6124 00002936 206E6F74207265636F-
  6125 0000293F 676E697A656420286E-
  6126 00002948 6F202A20616C6C6F77-
  6127 00002951 65642900           
  6128 00002955 5C6E20707573682000      docall1_5 db "\n push ",0
  6129 0000295E 5C6E20707573682000      docall1_6 db "\n push ",0
  6130 00002967 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6131 00002970 782C2000           
  6132 00002974 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6133 0000297D 7800               
  6134 0000297F 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6135 00002988 6F72642000         
  6136 0000298D 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6137 00002996 2C20627974652000   
  6138 0000299E 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6139 000029A7 2C20305C6E20707573-
  6140 000029B0 6820617800         
  6141 000029B5 5C6E20707573682000      docall1_12 db "\n push ",0
  6142 000029BE 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6143 000029C7 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6144 000029D0 702C2000           
  6145                                  ENDP
  6146                                  
  6147                                  doemit: PROC
  6148 000029D4 68[102A]                 push doemit_0
  6149 000029D7 E808DA                   call prs
  6150 000029DA 83C402                   add  sp, 2
  6151                                  
  6152                                  ;-737   L1: token=getlex(); prunsign1(lexval); token=getlex();
  6153                                  
  6154                                  .L1:
  6155 000029DD E85C03                   call getlex
  6156 000029E0 A3[1E00]                 mov word [token], ax
  6157 000029E3 FF36[2C00]               push word [lexval]
  6158 000029E7 E85BDB                   call prunsign1
  6159 000029EA 83C402                   add  sp, 2
  6160 000029ED E84C03                   call getlex
  6161 000029F0 A3[1E00]                 mov word [token], ax
  6162                                  
  6163                                  ;-738     if (token== ',') {prc(','); goto L1;} expect(')'); }
  6164                                  
  6165 000029F3 A1[1E00]                 mov ax, [token]
  6166 000029F6 83F82C                   cmp ax, 44
  6167 000029F9 0F850A00                 jne .doemit298
  6168 000029FD 6A2C                     push 44
  6169 000029FF E887D9                   call prc
  6170 00002A02 83C402                   add  sp, 2
  6171 00002A05 EBD6                     jmp .L1
  6172                                  .doemit298:
  6173 00002A07 6A29                     push 41
  6174 00002A09 E824DE                   call expect
  6175 00002A0C 83C402                   add  sp, 2
  6176                                  
  6177                                  ;-739 
  6178                                  
  6179                                  
  6180                                  ;-740 int cmpneg(int ids) {
  6181                                  
  6182 00002A0F C3                       ret
  6183 00002A10 5C6E2064622000          doemit_0 db "\n db ",0
  6184                                  ENDP
  6185                                  
  6186                                  cmpneg: PROC
  6187                                  
  6188                                  ;-741        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  6189                                  ;
  6190 00002A17 C8000000                 ENTER  0,0
  6191 00002A1B A1[2400]                 mov ax, [iscmp]
  6192 00002A1E 3D2603                   cmp ax, 806
  6193 00002A21 0F850C00                 jne .cmpneg299
  6194 00002A25 68[F82A]                 push cmpneg_0
  6195 00002A28 E8B7D9                   call prs
  6196 00002A2B 83C402                   add  sp, 2
  6197                                  
  6198                                  ;-742   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  6199                                  
  6200 00002A2E E9C500                   jmp .cmpneg300
  6201                                  .cmpneg299:
  6202 00002A31 A1[2400]                 mov ax, [iscmp]
  6203 00002A34 3D2703                   cmp ax, 807
  6204 00002A37 0F850C00                 jne .cmpneg301
  6205 00002A3B 68[012B]                 push cmpneg_1
  6206 00002A3E E8A1D9                   call prs
  6207 00002A41 83C402                   add  sp, 2
  6208                                  
  6209                                  ;-743   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  6210                                  
  6211 00002A44 E9AF00                   jmp .cmpneg302
  6212                                  .cmpneg301:
  6213 00002A47 A1[2400]                 mov ax, [iscmp]
  6214 00002A4A 3D3803                   cmp ax, 824
  6215 00002A4D 0F852100                 jne .cmpneg303
  6216 00002A51 8B4604                   mov ax, [bp+4]
  6217 00002A54 08C0                     or  al, al
  6218 00002A56 0F840C00                 je .cmpneg304
  6219 00002A5A 68[0A2B]                 push cmpneg_2
  6220 00002A5D E882D9                   call prs
  6221 00002A60 83C402                   add  sp, 2
  6222                                  
  6223                                  ;-744                            else prs("\n ja  .");//ZF=0 CF=0
  6224                                  
  6225 00002A63 E90900                   jmp .cmpneg305
  6226                                  .cmpneg304:
  6227 00002A66 68[132B]                 push cmpneg_3
  6228 00002A69 E876D9                   call prs
  6229 00002A6C 83C402                   add  sp, 2
  6230                                  
  6231                                  ;-745   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  6232                                  
  6233                                  .cmpneg305:
  6234 00002A6F E98400                   jmp .cmpneg306
  6235                                  .cmpneg303:
  6236 00002A72 A1[2400]                 mov ax, [iscmp]
  6237 00002A75 3D2B03                   cmp ax, 811
  6238 00002A78 0F854500                 jne .cmpneg307
  6239 00002A7C 8B4604                   mov ax, [bp+4]
  6240 00002A7F 08C0                     or  al, al
  6241 00002A81 0F841E00                 je .cmpneg308
  6242 00002A85 68[1C2B]                 push cmpneg_4
  6243 00002A88 E857D9                   call prs
  6244 00002A8B 83C402                   add  sp, 2
  6245 00002A8E FF7604                   push word [bp+4]
  6246 00002A91 E8B1DA                   call prunsign1
  6247 00002A94 83C402                   add  sp, 2
  6248                                  
  6249                                  ;-746                                prs("\n jl  .");}//          SF!=OF
  6250                                  
  6251 00002A97 68[2A2B]                 push cmpneg_5
  6252 00002A9A E845D9                   call prs
  6253 00002A9D 83C402                   add  sp, 2
  6254                                  
  6255                                  ;-747                            else{prs(" ;unsigned : "); prunsign1(ids);
  6256                                  
  6257 00002AA0 E91B00                   jmp .cmpneg309
  6258                                  .cmpneg308:
  6259 00002AA3 68[332B]                 push cmpneg_6
  6260 00002AA6 E839D9                   call prs
  6261 00002AA9 83C402                   add  sp, 2
  6262 00002AAC FF7604                   push word [bp+4]
  6263 00002AAF E893DA                   call prunsign1
  6264 00002AB2 83C402                   add  sp, 2
  6265                                  
  6266                                  ;-748                                prs("\n jb  .");}//jb=jc=CF=1
  6267                                  
  6268 00002AB5 68[412B]                 push cmpneg_7
  6269 00002AB8 E827D9                   call prs
  6270 00002ABB 83C402                   add  sp, 2
  6271                                  
  6272                                  ;-749   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  6273                                  
  6274                                  .cmpneg309:
  6275 00002ABE E93500                   jmp .cmpneg310
  6276                                  .cmpneg307:
  6277 00002AC1 A1[2400]                 mov ax, [iscmp]
  6278 00002AC4 83F83C                   cmp ax, 60
  6279 00002AC7 0F850C00                 jne .cmpneg311
  6280 00002ACB 68[4A2B]                 push cmpneg_8
  6281 00002ACE E811D9                   call prs
  6282 00002AD1 83C402                   add  sp, 2
  6283                                  
  6284                                  ;-750   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  6285                                  
  6286 00002AD4 E91F00                   jmp .cmpneg312
  6287                                  .cmpneg311:
  6288 00002AD7 A1[2400]                 mov ax, [iscmp]
  6289 00002ADA 83F83E                   cmp ax, 62
  6290 00002ADD 0F850C00                 jne .cmpneg313
  6291 00002AE1 68[532B]                 push cmpneg_9
  6292 00002AE4 E8FBD8                   call prs
  6293 00002AE7 83C402                   add  sp, 2
  6294                                  
  6295                                  ;-751   else error1("internal error compare unknown in CMPNEG()");  }
  6296                                  
  6297 00002AEA E90900                   jmp .cmpneg314
  6298                                  .cmpneg313:
  6299 00002AED 68[5C2B]                 push cmpneg_10
  6300 00002AF0 E8EDDA                   call error1
  6301 00002AF3 83C402                   add  sp, 2
  6302                                  .cmpneg314:
  6303                                  .cmpneg312:
  6304                                  .cmpneg310:
  6305                                  .cmpneg306:
  6306                                  .cmpneg302:
  6307                                  .cmpneg300:
  6308                                  
  6309                                  ;-752 
  6310                                  
  6311                                  
  6312                                  ;-753 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  6313 00002AF6 C9                       LEAVE
  6314 00002AF7 C3                       ret
  6315 00002AF8 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  6316 00002B01 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  6317 00002B0A 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  6318 00002B13 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  6319 00002B1C 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  6320 00002B25 64203A2000         
  6321 00002B2A 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  6322 00002B33 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  6323 00002B3C 64203A2000         
  6324 00002B41 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  6325 00002B4A 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  6326 00002B53 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  6327 00002B5C 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  6328 00002B65 6572726F7220636F6D-
  6329 00002B6E 7061726520756E6B6E-
  6330 00002B77 6F776E20696E20434D-
  6331 00002B80 504E4547282900     
  6332                                  ENDP
  6333                                  
  6334                                  prlabel: PROC;
  6335 00002B87 C8000000                 ENTER  0,0
  6336 00002B8B 68[B22B]                 push prlabel_0
  6337 00002B8E E851D8                   call prs
  6338 00002B91 83C402                   add  sp, 2
  6339 00002B94 8D063B6A                 lea  ax, [fname]
  6340 00002B98 50                       push ax
  6341 00002B99 E846D8                   call prs
  6342 00002B9C 83C402                   add  sp, 2
  6343 00002B9F FF7604                   push word [bp+4]
  6344 00002BA2 E8A0D9                   call prunsign1
  6345 00002BA5 83C402                   add  sp, 2
  6346 00002BA8 6A3A                     push 58
  6347 00002BAA E8DCD7                   call prc
  6348 00002BAD 83C402                   add  sp, 2
  6349                                  
  6350                                  ;-754 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  6351 00002BB0 C9                       LEAVE
  6352 00002BB1 C3                       ret
  6353 00002BB2 5C6E2E00                prlabel_0 db "\n.",0
  6354                                  ENDP
  6355                                  
  6356                                  prjump: PROC;
  6357 00002BB6 C8000000                 ENTER  0,0
  6358 00002BBA 68[D92B]                 push prjump_0
  6359 00002BBD E822D8                   call prs
  6360 00002BC0 83C402                   add  sp, 2
  6361 00002BC3 8D063B6A                 lea  ax, [fname]
  6362 00002BC7 50                       push ax
  6363 00002BC8 E817D8                   call prs
  6364 00002BCB 83C402                   add  sp, 2
  6365 00002BCE FF7604                   push word [bp+4]
  6366 00002BD1 E871D9                   call prunsign1
  6367 00002BD4 83C402                   add  sp, 2
  6368                                  
  6369                                  ;-755 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  6370 00002BD7 C9                       LEAVE
  6371 00002BD8 C3                       ret
  6372 00002BD9 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  6373                                  ENDP
  6374                                  
  6375                                  doif: PROC;
  6376 00002BE2 C8040000                 ENTER  4,0
  6377 00002BE6 E8A4E2                   call pexpr
  6378 00002BE9 FF06[2A00]               inc  word[nlabel]
  6379 00002BED A1[2A00]                 mov ax, [nlabel]
  6380 00002BF0 8946FE                   mov [bp-2], ax
  6381                                  
  6382                                  ;-756   pint1(jdest); stmt();
  6383                                  
  6384 00002BF3 FF76FE                   push word [bp-2]
  6385 00002BF6 E8EED8                   call pint1
  6386 00002BF9 83C402                   add  sp, 2
  6387 00002BFC E8F307                   call stmt
  6388                                  
  6389                                  ;-757   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  6390                                  
  6391 00002BFF 680202                   push 514
  6392 00002C02 E809DC                   call istoken
  6393 00002C05 83C402                   add  sp, 2
  6394 00002C08 08C0                     or  al, al
  6395 00002C0A 0F842B00                 je .doif315
  6396 00002C0E FF06[2A00]               inc  word[nlabel]
  6397 00002C12 A1[2A00]                 mov ax, [nlabel]
  6398 00002C15 8946FC                   mov [bp-4], ax
  6399                                  
  6400                                  ;-758     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  6401                                  
  6402 00002C18 FF76FC                   push word [bp-4]
  6403 00002C1B E898FF                   call prjump
  6404 00002C1E 83C402                   add  sp, 2
  6405 00002C21 FF76FE                   push word [bp-2]
  6406 00002C24 E860FF                   call prlabel
  6407 00002C27 83C402                   add  sp, 2
  6408 00002C2A E8C507                   call stmt
  6409 00002C2D FF76FC                   push word [bp-4]
  6410 00002C30 E854FF                   call prlabel
  6411 00002C33 83C402                   add  sp, 2
  6412                                  
  6413                                  ;-759   else prlabel(jdest); }
  6414                                  
  6415 00002C36 E90900                   jmp .doif316
  6416                                  .doif315:
  6417 00002C39 FF76FE                   push word [bp-2]
  6418 00002C3C E848FF                   call prlabel
  6419 00002C3F 83C402                   add  sp, 2
  6420                                  .doif316:
  6421                                  
  6422                                  ;-760 
  6423                                  
  6424                                  
  6425                                  ;-761 int dodo() {int jdest; int jtemp;
  6426 00002C42 C9                       LEAVE
  6427 00002C43 C3                       ret
  6428                                  ENDP
  6429                                  
  6430                                  dodo: PROC
  6431                                  
  6432                                  ;-762   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  6433                                  ;
  6434 00002C44 C8040000                 ENTER  4,0
  6435 00002C48 FF06[2A00]               inc  word[nlabel]
  6436 00002C4C A1[2A00]                 mov ax, [nlabel]
  6437 00002C4F 8946FE                   mov [bp-2], ax
  6438 00002C52 FF76FE                   push word [bp-2]
  6439 00002C55 E82FFF                   call prlabel
  6440 00002C58 83C402                   add  sp, 2
  6441 00002C5B E89407                   call stmt
  6442                                  
  6443                                  ;-763   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  6444                                  
  6445 00002C5E 680302                   push 515
  6446 00002C61 E8CCDB                   call expect
  6447 00002C64 83C402                   add  sp, 2
  6448 00002C67 E823E2                   call pexpr
  6449 00002C6A FF06[2A00]               inc  word[nlabel]
  6450 00002C6E A1[2A00]                 mov ax, [nlabel]
  6451 00002C71 8946FC                   mov [bp-4], ax
  6452 00002C74 FF76FC                   push word [bp-4]
  6453 00002C77 E86DD8                   call pint1
  6454 00002C7A 83C402                   add  sp, 2
  6455                                  
  6456                                  ;-764   prjump(jdest); prlabel(jtemp); }
  6457                                  
  6458 00002C7D FF76FE                   push word [bp-2]
  6459 00002C80 E833FF                   call prjump
  6460 00002C83 83C402                   add  sp, 2
  6461 00002C86 FF76FC                   push word [bp-4]
  6462 00002C89 E8FBFE                   call prlabel
  6463 00002C8C 83C402                   add  sp, 2
  6464                                  
  6465                                  ;-765 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  6466 00002C8F C9                       LEAVE
  6467 00002C90 C3                       ret
  6468                                  ENDP
  6469                                  
  6470                                  dowhile: PROC;
  6471 00002C91 C8040000                 ENTER  4,0
  6472 00002C95 FF06[2A00]               inc  word[nlabel]
  6473 00002C99 A1[2A00]                 mov ax, [nlabel]
  6474 00002C9C 8946FE                   mov [bp-2], ax
  6475                                  
  6476                                  ;-766   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  6477                                  
  6478 00002C9F FF76FE                   push word [bp-2]
  6479 00002CA2 E8E2FE                   call prlabel
  6480 00002CA5 83C402                   add  sp, 2
  6481 00002CA8 E8E2E1                   call pexpr
  6482 00002CAB FF06[2A00]               inc  word[nlabel]
  6483 00002CAF A1[2A00]                 mov ax, [nlabel]
  6484 00002CB2 8946FC                   mov [bp-4], ax
  6485 00002CB5 FF76FC                   push word [bp-4]
  6486 00002CB8 E82CD8                   call pint1
  6487 00002CBB 83C402                   add  sp, 2
  6488                                  
  6489                                  ;-767   stmt(); prjump(jdest); prlabel(tst); }
  6490                                  
  6491 00002CBE E83107                   call stmt
  6492 00002CC1 FF76FE                   push word [bp-2]
  6493 00002CC4 E8EFFE                   call prjump
  6494 00002CC7 83C402                   add  sp, 2
  6495 00002CCA FF76FC                   push word [bp-4]
  6496 00002CCD E8B7FE                   call prlabel
  6497 00002CD0 83C402                   add  sp, 2
  6498                                  
  6499                                  ;-768 int isrelational() {
  6500 00002CD3 C9                       LEAVE
  6501 00002CD4 C3                       ret
  6502                                  ENDP
  6503                                  
  6504                                  isrelational: PROC
  6505                                  
  6506                                  ;-769   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  6507                                  
  6508 00002CD5 A1[1E00]                 mov ax, [token]
  6509 00002CD8 3D2603                   cmp ax, 806
  6510 00002CDB 0F850300                 jne .isrelational317
  6511 00002CDF E94700                   jmp .w
  6512                                  .isrelational317:
  6513 00002CE2 A1[1E00]                 mov ax, [token]
  6514 00002CE5 3D2703                   cmp ax, 807
  6515 00002CE8 0F850300                 jne .isrelational318
  6516 00002CEC E93A00                   jmp .w
  6517                                  
  6518                                  ;-770   if (token==T_LE) goto w; if (token==T_GE) goto w;
  6519                                  
  6520                                  .isrelational318:
  6521 00002CEF A1[1E00]                 mov ax, [token]
  6522 00002CF2 3D3803                   cmp ax, 824
  6523 00002CF5 0F850300                 jne .isrelational319
  6524 00002CF9 E92D00                   jmp .w
  6525                                  .isrelational319:
  6526 00002CFC A1[1E00]                 mov ax, [token]
  6527 00002CFF 3D2B03                   cmp ax, 811
  6528 00002D02 0F850300                 jne .isrelational320
  6529 00002D06 E92000                   jmp .w
  6530                                  
  6531                                  ;-771   if (token=='<' ) goto w; if (token=='>' ) goto w;
  6532                                  
  6533                                  .isrelational320:
  6534 00002D09 A1[1E00]                 mov ax, [token]
  6535 00002D0C 83F83C                   cmp ax, 60
  6536 00002D0F 0F850300                 jne .isrelational321
  6537 00002D13 E91300                   jmp .w
  6538                                  .isrelational321:
  6539 00002D16 A1[1E00]                 mov ax, [token]
  6540 00002D19 83F83E                   cmp ax, 62
  6541 00002D1C 0F850300                 jne .isrelational322
  6542 00002D20 E90600                   jmp .w
  6543                                  
  6544                                  ;-772   return 0;  w: iscmp=token; token=getlex(); return 1;}
  6545                                  
  6546                                  .isrelational322:
  6547 00002D23 B80000                   mov ax, 0
  6548 00002D26 E91200                   jmp .retnisrelational
  6549                                  .w:
  6550 00002D29 A1[1E00]                 mov ax, [token]
  6551 00002D2C A3[2400]                 mov word [iscmp], ax
  6552 00002D2F E80A00                   call getlex
  6553 00002D32 A3[1E00]                 mov word [token], ax
  6554 00002D35 B80100                   mov ax, 1
  6555 00002D38 E90000                   jmp .retnisrelational
  6556                                  
  6557                                  ;-773 
  6558                                  
  6559                                  
  6560                                  ;-774 char symboltemp[80];
  6561                                  
  6562                                   .retnisrelational:
  6563 00002D3B C3                       ret
  6564                                  ENDP
  6565                                  section .bss
  6566                                  absolute 55902
  6567 0000DA5E <res 00000050>          symboltemp resb 80
  6568                                  section .text
  6569                                  
  6570                                  ;-775 int getlex() { char c; char *p;
  6571                                  
  6572                                  
  6573                                  getlex: PROC
  6574                                  
  6575                                  ;-776 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  6576                                  ;
  6577 00002D3C C8040000                 ENTER  4,0
  6578                                  .g1:
  6579 00002D40 E8ADDA                   call next
  6580 00002D43 8846FE                   mov [bp-2], al
  6581 00002D46 8A46FE                   mov al, [bp-2]
  6582 00002D49 3C00                     cmp al, 0
  6583 00002D4B 0F850600                 jne .getlex323
  6584 00002D4F B80000                   mov ax, 0
  6585 00002D52 E9DA04                   jmp .retngetlex
  6586                                  .getlex323:
  6587 00002D55 8A46FE                   mov al, [bp-2]
  6588 00002D58 3C20                     cmp al, 32
  6589 00002D5A 0F8F0200                 jg  .getlex324
  6590 00002D5E EBE0                     jmp .g1
  6591                                  
  6592                                  ;-777   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  6593                                  
  6594                                  .getlex324:
  6595 00002D60 8A46FE                   mov al, [bp-2]
  6596 00002D63 3C3D                     cmp al, 61
  6597 00002D65 0F851200                 jne .getlex325
  6598 00002D69 A0[2300]                 mov al, [thechar]
  6599 00002D6C 3C3D                     cmp al, 61
  6600 00002D6E 0F850900                 jne .getlex326
  6601 00002D72 E87BDA                   call next
  6602 00002D75 B82603                   mov ax, 806
  6603 00002D78 E9B404                   jmp .retngetlex
  6604                                  .getlex326:
  6605                                  
  6606                                  ;-778   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  6607                                  
  6608                                  .getlex325:
  6609 00002D7B 8A46FE                   mov al, [bp-2]
  6610 00002D7E 3C21                     cmp al, 33
  6611 00002D80 0F851200                 jne .getlex327
  6612 00002D84 A0[2300]                 mov al, [thechar]
  6613 00002D87 3C3D                     cmp al, 61
  6614 00002D89 0F850900                 jne .getlex328
  6615 00002D8D E860DA                   call next
  6616 00002D90 B82703                   mov ax, 807
  6617 00002D93 E99904                   jmp .retngetlex
  6618                                  .getlex328:
  6619                                  
  6620                                  ;-779   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  6621                                  
  6622                                  .getlex327:
  6623 00002D96 8A46FE                   mov al, [bp-2]
  6624 00002D99 3C3C                     cmp al, 60
  6625 00002D9B 0F851200                 jne .getlex329
  6626 00002D9F A0[2300]                 mov al, [thechar]
  6627 00002DA2 3C3D                     cmp al, 61
  6628 00002DA4 0F850900                 jne .getlex330
  6629 00002DA8 E845DA                   call next
  6630 00002DAB B83803                   mov ax, 824
  6631 00002DAE E97E04                   jmp .retngetlex
  6632                                  .getlex330:
  6633                                  
  6634                                  ;-780   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  6635                                  
  6636                                  .getlex329:
  6637 00002DB1 8A46FE                   mov al, [bp-2]
  6638 00002DB4 3C3E                     cmp al, 62
  6639 00002DB6 0F851200                 jne .getlex331
  6640 00002DBA A0[2300]                 mov al, [thechar]
  6641 00002DBD 3C3D                     cmp al, 61
  6642 00002DBF 0F850900                 jne .getlex332
  6643 00002DC3 E82ADA                   call next
  6644 00002DC6 B82B03                   mov ax, 811
  6645 00002DC9 E96304                   jmp .retngetlex
  6646                                  .getlex332:
  6647                                  
  6648                                  ;-781   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  6649                                  
  6650                                  .getlex331:
  6651 00002DCC 8A46FE                   mov al, [bp-2]
  6652 00002DCF 3C3C                     cmp al, 60
  6653 00002DD1 0F851200                 jne .getlex333
  6654 00002DD5 A0[2300]                 mov al, [thechar]
  6655 00002DD8 3C3C                     cmp al, 60
  6656 00002DDA 0F850900                 jne .getlex334
  6657 00002DDE E80FDA                   call next
  6658 00002DE1 B8D804                   mov ax, 1240
  6659 00002DE4 E94804                   jmp .retngetlex
  6660                                  .getlex334:
  6661                                  
  6662                                  ;-782   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  6663                                  
  6664                                  .getlex333:
  6665 00002DE7 8A46FE                   mov al, [bp-2]
  6666 00002DEA 3C3E                     cmp al, 62
  6667 00002DEC 0F851200                 jne .getlex335
  6668 00002DF0 A0[2300]                 mov al, [thechar]
  6669 00002DF3 3C3E                     cmp al, 62
  6670 00002DF5 0F850900                 jne .getlex336
  6671 00002DF9 E8F4D9                   call next
  6672 00002DFC B8D904                   mov ax, 1241
  6673 00002DFF E92D04                   jmp .retngetlex
  6674                                  .getlex336:
  6675                                  
  6676                                  ;-783   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  6677                                  
  6678                                  .getlex335:
  6679 00002E02 8A46FE                   mov al, [bp-2]
  6680 00002E05 3C2B                     cmp al, 43
  6681 00002E07 0F851200                 jne .getlex337
  6682 00002E0B A0[2300]                 mov al, [thechar]
  6683 00002E0E 3C2B                     cmp al, 43
  6684 00002E10 0F850900                 jne .getlex338
  6685 00002E14 E8D9D9                   call next
  6686 00002E17 B8C304                   mov ax, 1219
  6687 00002E1A E91204                   jmp .retngetlex
  6688                                  .getlex338:
  6689                                  
  6690                                  ;-784   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  6691                                  
  6692                                  .getlex337:
  6693 00002E1D 8A46FE                   mov al, [bp-2]
  6694 00002E20 3C2D                     cmp al, 45
  6695 00002E22 0F851200                 jne .getlex339
  6696 00002E26 A0[2300]                 mov al, [thechar]
  6697 00002E29 3C2D                     cmp al, 45
  6698 00002E2B 0F850900                 jne .getlex340
  6699 00002E2F E8BED9                   call next
  6700 00002E32 B8C904                   mov ax, 1225
  6701 00002E35 E9F703                   jmp .retngetlex
  6702                                  .getlex340:
  6703                                  
  6704                                  ;-785   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  6705                                  
  6706                                  .getlex339:
  6707 00002E38 8A46FE                   mov al, [bp-2]
  6708 00002E3B 3C2B                     cmp al, 43
  6709 00002E3D 0F851200                 jne .getlex341
  6710 00002E41 A0[2300]                 mov al, [thechar]
  6711 00002E44 3C3D                     cmp al, 61
  6712 00002E46 0F850900                 jne .getlex342
  6713 00002E4A E8A3D9                   call next
  6714 00002E4D B8CE04                   mov ax, 1230
  6715 00002E50 E9DC03                   jmp .retngetlex
  6716                                  .getlex342:
  6717                                  
  6718                                  ;-786   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  6719                                  
  6720                                  .getlex341:
  6721 00002E53 8A46FE                   mov al, [bp-2]
  6722 00002E56 3C2D                     cmp al, 45
  6723 00002E58 0F851200                 jne .getlex343
  6724 00002E5C A0[2300]                 mov al, [thechar]
  6725 00002E5F 3C3D                     cmp al, 61
  6726 00002E61 0F850900                 jne .getlex344
  6727 00002E65 E888D9                   call next
  6728 00002E68 B8CF04                   mov ax, 1231
  6729 00002E6B E9C103                   jmp .retngetlex
  6730                                  .getlex344:
  6731                                  
  6732                                  ;-787   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  6733                                  
  6734                                  .getlex343:
  6735 00002E6E 8A46FE                   mov al, [bp-2]
  6736 00002E71 3C26                     cmp al, 38
  6737 00002E73 0F851200                 jne .getlex345
  6738 00002E77 A0[2300]                 mov al, [thechar]
  6739 00002E7A 3C3D                     cmp al, 61
  6740 00002E7C 0F850900                 jne .getlex346
  6741 00002E80 E86DD9                   call next
  6742 00002E83 B8D204                   mov ax, 1234
  6743 00002E86 E9A603                   jmp .retngetlex
  6744                                  .getlex346:
  6745                                  
  6746                                  ;-788   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  6747                                  
  6748                                  .getlex345:
  6749 00002E89 8A46FE                   mov al, [bp-2]
  6750 00002E8C 3C7C                     cmp al, 124
  6751 00002E8E 0F851200                 jne .getlex347
  6752 00002E92 A0[2300]                 mov al, [thechar]
  6753 00002E95 3C3D                     cmp al, 61
  6754 00002E97 0F850900                 jne .getlex348
  6755 00002E9B E852D9                   call next
  6756 00002E9E B8D304                   mov ax, 1235
  6757 00002EA1 E98B03                   jmp .retngetlex
  6758                                  .getlex348:
  6759                                  
  6760                                  ;-789   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  6761                                  
  6762                                  .getlex347:
  6763 00002EA4 8A46FE                   mov al, [bp-2]
  6764 00002EA7 3C2A                     cmp al, 42
  6765 00002EA9 0F851200                 jne .getlex349
  6766 00002EAD A0[2300]                 mov al, [thechar]
  6767 00002EB0 3C3D                     cmp al, 61
  6768 00002EB2 0F850900                 jne .getlex350
  6769 00002EB6 E837D9                   call next
  6770 00002EB9 B8D004                   mov ax, 1232
  6771 00002EBC E97003                   jmp .retngetlex
  6772                                  .getlex350:
  6773                                  
  6774                                  ;-790   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  6775                                  
  6776                                  .getlex349:
  6777 00002EBF 8A46FE                   mov al, [bp-2]
  6778 00002EC2 3C2F                     cmp al, 47
  6779 00002EC4 0F851200                 jne .getlex351
  6780 00002EC8 A0[2300]                 mov al, [thechar]
  6781 00002ECB 3C3D                     cmp al, 61
  6782 00002ECD 0F850900                 jne .getlex352
  6783 00002ED1 E81CD9                   call next
  6784 00002ED4 B8D104                   mov ax, 1233
  6785 00002ED7 E95503                   jmp .retngetlex
  6786                                  .getlex352:
  6787                                  
  6788                                  ;-791   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  6789                                  
  6790                                  .getlex351:
  6791 00002EDA 8A46FE                   mov al, byte [bp-2]
  6792 00002EDD B400                     mov ah, 0
  6793 00002EDF 50                       push ax
  6794 00002EE0 68[3132]                 push getlex_0
  6795 00002EE3 E830D4                   call instr1
  6796 00002EE6 83C404                   add  sp, 4
  6797 00002EE9 08C0                     or  al, al
  6798 00002EEB 0F840600                 je .getlex353
  6799 00002EEF 8A46FE                   mov al, [bp-2]
  6800 00002EF2 E93A03                   jmp .retngetlex
  6801                                  
  6802                                  ;-792   if (c == '/') { if (thechar == '/') {
  6803                                  
  6804                                  .getlex353:
  6805 00002EF5 8A46FE                   mov al, [bp-2]
  6806 00002EF8 3C2F                     cmp al, 47
  6807 00002EFA 0F852900                 jne .getlex354
  6808 00002EFE A0[2300]                 mov al, [thechar]
  6809 00002F01 3C2F                     cmp al, 47
  6810 00002F03 0F852000                 jne .getlex355
  6811                                  
  6812                                  ;-793       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  6813                                  
  6814                                  .getlex356:
  6815 00002F07 E8E6D8                   call next
  6816 00002F0A 8846FE                   mov [bp-2], al
  6817 00002F0D 8A46FE                   mov al, byte [bp-2]
  6818 00002F10 B400                     mov ah, 0
  6819 00002F12 50                       push ax
  6820 00002F13 E88CD7                   call ifEOL
  6821 00002F16 83C402                   add  sp, 2
  6822 00002F19 3C00                     cmp al, 0
  6823 00002F1B 0F850200                 jne .getlex357
  6824 00002F1F EBE6                     jmp .getlex356
  6825                                  .getlex357:
  6826 00002F21 E818FE                   call getlex
  6827 00002F24 E90803                   jmp .retngetlex
  6828                                  .getlex355:
  6829                                  
  6830                                  ;-794   if (c == '/') { if (thechar == '*') {
  6831                                  
  6832                                  .getlex354:
  6833 00002F27 8A46FE                   mov al, [bp-2]
  6834 00002F2A 3C2F                     cmp al, 47
  6835 00002F2C 0F853A00                 jne .getlex358
  6836 00002F30 A0[2300]                 mov al, [thechar]
  6837 00002F33 3C2A                     cmp al, 42
  6838 00002F35 0F852B00                 jne .getlex359
  6839                                  
  6840                                  ;-795       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  6841                                  
  6842                                  .g2:
  6843 00002F39 E8B4D8                   call next
  6844 00002F3C 8846FE                   mov [bp-2], al
  6845 00002F3F 8A46FE                   mov al, [bp-2]
  6846 00002F42 3C2A                     cmp al, 42
  6847 00002F44 0F840200                 je  .getlex360
  6848 00002F48 EBEF                     jmp .g2
  6849                                  .getlex360:
  6850 00002F4A A0[2300]                 mov al, [thechar]
  6851 00002F4D 3C2F                     cmp al, 47
  6852 00002F4F 0F840200                 je  .getlex361
  6853 00002F53 EBE4                     jmp .g2
  6854                                  
  6855                                  ;-796       c=next(); return getlex(); } else  return '/'; }
  6856                                  
  6857                                  .getlex361:
  6858 00002F55 E898D8                   call next
  6859 00002F58 8846FE                   mov [bp-2], al
  6860 00002F5B E8DEFD                   call getlex
  6861 00002F5E E9CE02                   jmp .retngetlex
  6862 00002F61 E90600                   jmp .getlex362
  6863                                  .getlex359:
  6864 00002F64 B82F00                   mov ax, 47
  6865 00002F67 E9C502                   jmp .retngetlex
  6866                                  .getlex362:
  6867                                  
  6868                                  ;-797   if (c == '"') {getstring(c); return T_STRING;}
  6869                                  
  6870                                  .getlex358:
  6871 00002F6A 8A46FE                   mov al, [bp-2]
  6872 00002F6D 3C22                     cmp al, 34
  6873 00002F6F 0F851200                 jne .getlex363
  6874 00002F73 8A46FE                   mov al, byte [bp-2]
  6875 00002F76 B400                     mov ah, 0
  6876 00002F78 50                       push ax
  6877 00002F79 E88F06                   call getstring
  6878 00002F7C 83C402                   add  sp, 2
  6879 00002F7F B80201                   mov ax, 258
  6880 00002F82 E9AA02                   jmp .retngetlex
  6881                                  
  6882                                  ;-798   if (digit(c)) { getdigit(c); return T_CONST; }
  6883                                  
  6884                                  .getlex363:
  6885 00002F85 8A46FE                   mov al, byte [bp-2]
  6886 00002F88 B400                     mov ah, 0
  6887 00002F8A 50                       push ax
  6888 00002F8B E810D2                   call digit
  6889 00002F8E 83C402                   add  sp, 2
  6890 00002F91 08C0                     or  al, al
  6891 00002F93 0F841200                 je .getlex364
  6892 00002F97 8A46FE                   mov al, byte [bp-2]
  6893 00002F9A B400                     mov ah, 0
  6894 00002F9C 50                       push ax
  6895 00002F9D E87C03                   call getdigit
  6896 00002FA0 83C402                   add  sp, 2
  6897 00002FA3 B80101                   mov ax, 257
  6898 00002FA6 E98602                   jmp .retngetlex
  6899                                  
  6900                                  ;-799   if (c==39) { lexval=next();
  6901                                  
  6902                                  .getlex364:
  6903 00002FA9 8A46FE                   mov al, [bp-2]
  6904 00002FAC 3C27                     cmp al, 39
  6905 00002FAE 0F854F00                 jne .getlex365
  6906 00002FB2 E83BD8                   call next
  6907 00002FB5 A3[2C00]                 mov word [lexval], ax
  6908                                  
  6909                                  ;-800     if (lexval==92) {lexval=next();
  6910                                  
  6911 00002FB8 A1[2C00]                 mov ax, [lexval]
  6912 00002FBB 83F85C                   cmp ax, 92
  6913 00002FBE 0F853600                 jne .getlex366
  6914 00002FC2 E82BD8                   call next
  6915 00002FC5 A3[2C00]                 mov word [lexval], ax
  6916                                  
  6917                                  ;-801       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  6918                                  
  6919 00002FC8 A1[2C00]                 mov ax, [lexval]
  6920 00002FCB 83F86E                   cmp ax, 110
  6921 00002FCE 0F850600                 jne .getlex367
  6922 00002FD2 B80A00                   mov ax, 10
  6923 00002FD5 A3[2C00]                 mov word [lexval], ax
  6924                                  .getlex367:
  6925 00002FD8 A1[2C00]                 mov ax, [lexval]
  6926 00002FDB 83F874                   cmp ax, 116
  6927 00002FDE 0F850600                 jne .getlex368
  6928 00002FE2 B80900                   mov ax, 9
  6929 00002FE5 A3[2C00]                 mov word [lexval], ax
  6930                                  
  6931                                  ;-802       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  6932                                  
  6933                                  .getlex368:
  6934 00002FE8 A1[2C00]                 mov ax, [lexval]
  6935 00002FEB 83F830                   cmp ax, 48
  6936 00002FEE 0F850600                 jne .getlex369
  6937 00002FF2 B80000                   mov ax, 0
  6938 00002FF5 A3[2C00]                 mov word [lexval], ax
  6939                                  .getlex369:
  6940                                  .getlex366:
  6941 00002FF8 E8F5D7                   call next
  6942 00002FFB B80101                   mov ax, 257
  6943 00002FFE E92E02                   jmp .retngetlex
  6944                                  
  6945                                  ;-803   if (alnum(c)) {
  6946                                  
  6947                                  .getlex365:
  6948 00003001 8A46FE                   mov al, byte [bp-2]
  6949 00003004 B400                     mov ah, 0
  6950 00003006 50                       push ax
  6951 00003007 E8BED1                   call alnum
  6952 0000300A 83C402                   add  sp, 2
  6953 0000300D 08C0                     or  al, al
  6954 0000300F 0F841302                 je .getlex370
  6955                                  
  6956                                  ;-804     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  6957                                  
  6958 00003013 8D06BB69                 lea  ax, [symbol]
  6959 00003017 50                       push ax
  6960 00003018 8D065EDA                 lea  ax, [symboltemp]
  6961 0000301C 50                       push ax
  6962 0000301D E80CD2                   call strcpy
  6963 00003020 83C404                   add  sp, 4
  6964 00003023 B8BB69                   mov ax, symbol
  6965 00003026 8946FC                   mov [bp-4], ax
  6966 00003029 8A46FE                   mov al, [bp-2]
  6967 0000302C 8B5EFC                   mov  bx, [bp-4]
  6968 0000302F 8807                     mov  [bx], al
  6969 00003031 FF46FC                   inc  word[bp-4]
  6970                                  
  6971                                  ;-805     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  6972                                  
  6973                                  .getlex371:
  6974 00003034 A0[2300]                 mov al, byte [thechar]
  6975 00003037 B400                     mov ah, 0
  6976 00003039 50                       push ax
  6977 0000303A E88BD1                   call alnum
  6978 0000303D 83C402                   add  sp, 2
  6979 00003040 08C0                     or  al, al
  6980 00003042 0F841300                 je .getlex372
  6981 00003046 E8A7D7                   call next
  6982 00003049 8846FE                   mov [bp-2], al
  6983 0000304C 8A46FE                   mov al, [bp-2]
  6984 0000304F 8B5EFC                   mov  bx, [bp-4]
  6985 00003052 8807                     mov  [bx], al
  6986 00003054 FF46FC                   inc  word[bp-4]
  6987                                  
  6988                                  ;-806       *p=0;
  6989                                  
  6990 00003057 EBDB                     jmp .getlex371
  6991                                  .getlex372:
  6992 00003059 B80000                   mov ax, 0
  6993 0000305C 8B5EFC                   mov  bx, [bp-4]
  6994 0000305F 8807                     mov  [bx], al
  6995                                  
  6996                                  ;-807     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  6997                                  
  6998 00003061 68[4732]                 push getlex_1
  6999 00003064 8D06BB69                 lea  ax, [symbol]
  7000 00003068 50                       push ax
  7001 00003069 E8F6D1                   call eqstr
  7002 0000306C 83C404                   add  sp, 4
  7003 0000306F 08C0                     or  al, al
  7004 00003071 0F840600                 je .getlex373
  7005 00003075 B81302                   mov ax, 531
  7006 00003078 E9B401                   jmp .retngetlex
  7007                                  
  7008                                  ;-808     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  7009                                  
  7010                                  .getlex373:
  7011 0000307B 68[4E32]                 push getlex_2
  7012 0000307E 8D06BB69                 lea  ax, [symbol]
  7013 00003082 50                       push ax
  7014 00003083 E8DCD1                   call eqstr
  7015 00003086 83C404                   add  sp, 4
  7016 00003089 08C0                     or  al, al
  7017 0000308B 0F840600                 je .getlex374
  7018 0000308F B81402                   mov ax, 532
  7019 00003092 E99A01                   jmp .retngetlex
  7020                                  
  7021                                  ;-809     if (eqstr(symbol,"void"    )) return T_VOID;
  7022                                  
  7023                                  .getlex374:
  7024 00003095 68[5732]                 push getlex_3
  7025 00003098 8D06BB69                 lea  ax, [symbol]
  7026 0000309C 50                       push ax
  7027 0000309D E8C2D1                   call eqstr
  7028 000030A0 83C404                   add  sp, 4
  7029 000030A3 08C0                     or  al, al
  7030 000030A5 0F840600                 je .getlex375
  7031 000030A9 B81102                   mov ax, 529
  7032 000030AC E98001                   jmp .retngetlex
  7033                                  
  7034                                  ;-810     if (eqstr(symbol,"int"     )) return T_INT;
  7035                                  
  7036                                  .getlex375:
  7037 000030AF 68[5C32]                 push getlex_4
  7038 000030B2 8D06BB69                 lea  ax, [symbol]
  7039 000030B6 50                       push ax
  7040 000030B7 E8A8D1                   call eqstr
  7041 000030BA 83C404                   add  sp, 4
  7042 000030BD 08C0                     or  al, al
  7043 000030BF 0F840600                 je .getlex376
  7044 000030C3 B80502                   mov ax, 517
  7045 000030C6 E96601                   jmp .retngetlex
  7046                                  
  7047                                  ;-811     if (eqstr(symbol,"long"    )) return T_LONG;
  7048                                  
  7049                                  .getlex376:
  7050 000030C9 68[6032]                 push getlex_5
  7051 000030CC 8D06BB69                 lea  ax, [symbol]
  7052 000030D0 50                       push ax
  7053 000030D1 E88ED1                   call eqstr
  7054 000030D4 83C404                   add  sp, 4
  7055 000030D7 08C0                     or  al, al
  7056 000030D9 0F840600                 je .getlex377
  7057 000030DD B81502                   mov ax, 533
  7058 000030E0 E94C01                   jmp .retngetlex
  7059                                  
  7060                                  ;-812     if (eqstr(symbol,"char"    )) return T_CHAR;
  7061                                  
  7062                                  .getlex377:
  7063 000030E3 68[6532]                 push getlex_6
  7064 000030E6 8D06BB69                 lea  ax, [symbol]
  7065 000030EA 50                       push ax
  7066 000030EB E874D1                   call eqstr
  7067 000030EE 83C404                   add  sp, 4
  7068 000030F1 08C0                     or  al, al
  7069 000030F3 0F840600                 je .getlex378
  7070 000030F7 B81202                   mov ax, 530
  7071 000030FA E93201                   jmp .retngetlex
  7072                                  
  7073                                  ;-813     if (eqstr(symbol,"asm"     )) return T_ASM;
  7074                                  
  7075                                  .getlex378:
  7076 000030FD 68[6A32]                 push getlex_7
  7077 00003100 8D06BB69                 lea  ax, [symbol]
  7078 00003104 50                       push ax
  7079 00003105 E85AD1                   call eqstr
  7080 00003108 83C404                   add  sp, 4
  7081 0000310B 08C0                     or  al, al
  7082 0000310D 0F840600                 je .getlex379
  7083 00003111 B80602                   mov ax, 518
  7084 00003114 E91801                   jmp .retngetlex
  7085                                  
  7086                                  ;-814     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  7087                                  
  7088                                  .getlex379:
  7089 00003117 68[6E32]                 push getlex_8
  7090 0000311A 8D06BB69                 lea  ax, [symbol]
  7091 0000311E 50                       push ax
  7092 0000311F E840D1                   call eqstr
  7093 00003122 83C404                   add  sp, 4
  7094 00003125 08C0                     or  al, al
  7095 00003127 0F840600                 je .getlex380
  7096 0000312B B80702                   mov ax, 519
  7097 0000312E E9FE00                   jmp .retngetlex
  7098                                  
  7099                                  ;-815     if (eqstr(symbol,"__emit__")) return T_EMIT;
  7100                                  
  7101                                  .getlex380:
  7102 00003131 68[7432]                 push getlex_9
  7103 00003134 8D06BB69                 lea  ax, [symbol]
  7104 00003138 50                       push ax
  7105 00003139 E826D1                   call eqstr
  7106 0000313C 83C404                   add  sp, 4
  7107 0000313F 08C0                     or  al, al
  7108 00003141 0F840600                 je .getlex381
  7109 00003145 B80802                   mov ax, 520
  7110 00003148 E9E400                   jmp .retngetlex
  7111                                  
  7112                                  ;-816     if (eqstr(symbol,"return"  )) return T_RETURN;
  7113                                  
  7114                                  .getlex381:
  7115 0000314B 68[7D32]                 push getlex_10
  7116 0000314E 8D06BB69                 lea  ax, [symbol]
  7117 00003152 50                       push ax
  7118 00003153 E80CD1                   call eqstr
  7119 00003156 83C404                   add  sp, 4
  7120 00003159 08C0                     or  al, al
  7121 0000315B 0F840600                 je .getlex382
  7122 0000315F B80002                   mov ax, 512
  7123 00003162 E9CA00                   jmp .retngetlex
  7124                                  
  7125                                  ;-817     if (eqstr(symbol,"if"      )) return T_IF;
  7126                                  
  7127                                  .getlex382:
  7128 00003165 68[8432]                 push getlex_11
  7129 00003168 8D06BB69                 lea  ax, [symbol]
  7130 0000316C 50                       push ax
  7131 0000316D E8F2D0                   call eqstr
  7132 00003170 83C404                   add  sp, 4
  7133 00003173 08C0                     or  al, al
  7134 00003175 0F840600                 je .getlex383
  7135 00003179 B80102                   mov ax, 513
  7136 0000317C E9B000                   jmp .retngetlex
  7137                                  
  7138                                  ;-818     if (eqstr(symbol,"else"    )) return T_ELSE;
  7139                                  
  7140                                  .getlex383:
  7141 0000317F 68[8732]                 push getlex_12
  7142 00003182 8D06BB69                 lea  ax, [symbol]
  7143 00003186 50                       push ax
  7144 00003187 E8D8D0                   call eqstr
  7145 0000318A 83C404                   add  sp, 4
  7146 0000318D 08C0                     or  al, al
  7147 0000318F 0F840600                 je .getlex384
  7148 00003193 B80202                   mov ax, 514
  7149 00003196 E99600                   jmp .retngetlex
  7150                                  
  7151                                  ;-819     if (eqstr(symbol,"while"   )) return T_WHILE;
  7152                                  
  7153                                  .getlex384:
  7154 00003199 68[8C32]                 push getlex_13
  7155 0000319C 8D06BB69                 lea  ax, [symbol]
  7156 000031A0 50                       push ax
  7157 000031A1 E8BED0                   call eqstr
  7158 000031A4 83C404                   add  sp, 4
  7159 000031A7 08C0                     or  al, al
  7160 000031A9 0F840600                 je .getlex385
  7161 000031AD B80302                   mov ax, 515
  7162 000031B0 E97C00                   jmp .retngetlex
  7163                                  
  7164                                  ;-820     if (eqstr(symbol,"do"      )) return T_DO;
  7165                                  
  7166                                  .getlex385:
  7167 000031B3 68[9232]                 push getlex_14
  7168 000031B6 8D06BB69                 lea  ax, [symbol]
  7169 000031BA 50                       push ax
  7170 000031BB E8A4D0                   call eqstr
  7171 000031BE 83C404                   add  sp, 4
  7172 000031C1 08C0                     or  al, al
  7173 000031C3 0F840600                 je .getlex386
  7174 000031C7 B80402                   mov ax, 516
  7175 000031CA E96200                   jmp .retngetlex
  7176                                  
  7177                                  ;-821     if (eqstr(symbol,"goto"    )) return T_GOTO;
  7178                                  
  7179                                  .getlex386:
  7180 000031CD 68[9532]                 push getlex_15
  7181 000031D0 8D06BB69                 lea  ax, [symbol]
  7182 000031D4 50                       push ax
  7183 000031D5 E88AD0                   call eqstr
  7184 000031D8 83C404                   add  sp, 4
  7185 000031DB 08C0                     or  al, al
  7186 000031DD 0F840600                 je .getlex387
  7187 000031E1 B80902                   mov ax, 521
  7188 000031E4 E94800                   jmp .retngetlex
  7189                                  
  7190                                  ;-822     if (eqstr(symbol,"define"  )) return T_DEFINE;
  7191                                  
  7192                                  .getlex387:
  7193 000031E7 68[9A32]                 push getlex_16
  7194 000031EA 8D06BB69                 lea  ax, [symbol]
  7195 000031EE 50                       push ax
  7196 000031EF E870D0                   call eqstr
  7197 000031F2 83C404                   add  sp, 4
  7198 000031F5 08C0                     or  al, al
  7199 000031F7 0F840600                 je .getlex388
  7200 000031FB B8FF01                   mov ax, 511
  7201 000031FE E92E00                   jmp .retngetlex
  7202                                  
  7203                                  ;-823     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  7204                                  
  7205                                  .getlex388:
  7206 00003201 E8B700                   call convertdefine
  7207 00003204 08C0                     or  al, al
  7208 00003206 0F841600                 je .getlex389
  7209 0000320A 8D065EDA                 lea  ax, [symboltemp]
  7210 0000320E 50                       push ax
  7211 0000320F 8D06BB69                 lea  ax, [symbol]
  7212 00003213 50                       push ax
  7213 00003214 E815D0                   call strcpy
  7214 00003217 83C404                   add  sp, 4
  7215 0000321A B80101                   mov ax, 257
  7216 0000321D E90F00                   jmp .retngetlex
  7217                                  
  7218                                  ;-824     return T_NAME; } error1("Input item not recognized"); }
  7219                                  
  7220                                  .getlex389:
  7221 00003220 B80001                   mov ax, 256
  7222 00003223 E90900                   jmp .retngetlex
  7223                                  .getlex370:
  7224 00003226 68[A132]                 push getlex_17
  7225 00003229 E8B4D3                   call error1
  7226 0000322C 83C402                   add  sp, 2
  7227                                  
  7228                                  ;-825 
  7229                                  
  7230                                  
  7231                                  ;-826 int convertdefine() { int i; int j;   i=0;
  7232                                  
  7233 0000322F C9                       .retngetlex: LEAVE
  7234 00003230 C3                       ret
  7235 00003231 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  7236 0000323A 3A252D3E3C3D2B2126-
  7237 00003243 7C233F00           
  7238 00003247 7369676E656400          getlex_1 db "signed",0
  7239 0000324E 756E7369676E656400      getlex_2 db "unsigned",0
  7240 00003257 766F696400              getlex_3 db "void",0
  7241 0000325C 696E7400                getlex_4 db "int",0
  7242 00003260 6C6F6E6700              getlex_5 db "long",0
  7243 00003265 6368617200              getlex_6 db "char",0
  7244 0000326A 61736D00                getlex_7 db "asm",0
  7245 0000326E 5F5F61736D00            getlex_8 db "__asm",0
  7246 00003274 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  7247 0000327D 72657475726E00          getlex_10 db "return",0
  7248 00003284 696600                  getlex_11 db "if",0
  7249 00003287 656C736500              getlex_12 db "else",0
  7250 0000328C 7768696C6500            getlex_13 db "while",0
  7251 00003292 646F00                  getlex_14 db "do",0
  7252 00003295 676F746F00              getlex_15 db "goto",0
  7253 0000329A 646566696E6500          getlex_16 db "define",0
  7254 000032A1 496E70757420697465-     getlex_17 db "Input item not recognized",0
  7255 000032AA 6D206E6F7420726563-
  7256 000032B3 6F676E697A656400   
  7257                                  ENDP
  7258                                  
  7259                                  convertdefine: PROC;
  7260 000032BB C8040000                 ENTER  4,0
  7261 000032BF B80000                   mov ax, 0
  7262 000032C2 8946FE                   mov [bp-2], ax
  7263                                  
  7264                                  ;-827   while (i < GTop) {
  7265                                  
  7266                                  .convertdefine390:
  7267 000032C5 8B46FE                   mov ax, [bp-2]
  7268 000032C8 3B06[3900]               cmp ax, [GTop]
  7269 000032CC 0F8D4400                 jge .convertdefine391
  7270                                  
  7271                                  ;-828    j=adrofname(i);
  7272                                  
  7273 000032D0 FF76FE                   push word [bp-2]
  7274 000032D3 E8C3D6                   call adrofname
  7275 000032D6 83C402                   add  sp, 2
  7276 000032D9 8946FC                   mov [bp-4], ax
  7277                                  
  7278                                  ;-829    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  7279                                  
  7280 000032DC FF76FC                   push word [bp-4]
  7281 000032DF 8D06BB69                 lea  ax, [symbol]
  7282 000032E3 50                       push ax
  7283 000032E4 E87BCF                   call eqstr
  7284 000032E7 83C404                   add  sp, 4
  7285 000032EA 08C0                     or  al, al
  7286 000032EC 0F841F00                 je .convertdefine392
  7287 000032F0 8B5EFE                   mov bx, [bp-2]
  7288 000032F3 8A87046B                 mov al, [GType + bx]
  7289 000032F7 3C23                     cmp al, 35
  7290 000032F9 0F851200                 jne .convertdefine393
  7291 000032FD 8B5EFE                   mov bx, [bp-2]
  7292 00003300 D1E3                     shl bx, 1
  7293 00003302 8B873873                 mov ax, [GData + bx]
  7294 00003306 A3[2C00]                 mov word [lexval], ax
  7295                                  
  7296                                  ;-830    return T_CONST; } }
  7297                                  
  7298 00003309 B80101                   mov ax, 257
  7299 0000330C E90B00                   jmp .retnconvertdefine
  7300                                  .convertdefine393:
  7301                                  
  7302                                  ;-831    i++; }
  7303                                  
  7304                                  .convertdefine392:
  7305 0000330F FF46FE                   inc  word[bp-2]
  7306                                  
  7307                                  ;-832    return 0; }
  7308                                  
  7309 00003312 EBB1                     jmp .convertdefine390
  7310                                  .convertdefine391:
  7311 00003314 B80000                   mov ax, 0
  7312 00003317 E90000                   jmp .retnconvertdefine
  7313                                  
  7314                                  ;-833 
  7315                                  
  7316                                  
  7317                                  ;-834 int getdigit(char c) { int i;
  7318                                  
  7319 0000331A C9                       .retnconvertdefine: LEAVE
  7320 0000331B C3                       ret
  7321                                  ENDP
  7322                                  
  7323                                  getdigit: PROC
  7324                                  
  7325                                  ;-835     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  7326                                  ;
  7327 0000331C C8020000                 ENTER  2,0
  7328 00003320 B80000                   mov ax, 0
  7329 00003323 A3[2C00]                 mov word [lexval], ax
  7330 00003326 8A4604                   mov al, [bp+4]
  7331 00003329 2C30                     sub al, 48
  7332 0000332B A3[2C00]                 mov word [lexval], ax
  7333                                  
  7334                                  ;-836     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  7335                                  
  7336 0000332E A0[2300]                 mov al, [thechar]
  7337 00003331 3C78                     cmp al, 120
  7338 00003333 0F850600                 jne .getdigit394
  7339 00003337 B85800                   mov ax, 88
  7340 0000333A A2[2300]                 mov byte [thechar], al
  7341                                  .getdigit394:
  7342 0000333D A0[2300]                 mov al, [thechar]
  7343 00003340 3C58                     cmp al, 88
  7344 00003342 0F856800                 jne .getdigit395
  7345 00003346 E8A7D4                   call next
  7346                                  
  7347                                  ;-837       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  7348                                  
  7349                                  .getdigit396:
  7350 00003349 A0[2300]                 mov al, byte [thechar]
  7351 0000334C B400                     mov ah, 0
  7352 0000334E 50                       push ax
  7353 0000334F E876CE                   call alnum
  7354 00003352 83C402                   add  sp, 2
  7355 00003355 08C0                     or  al, al
  7356 00003357 0F845000                 je .getdigit397
  7357 0000335B E892D4                   call next
  7358 0000335E 884604                   mov [bp+4], al
  7359 00003361 8A4604                   mov al, [bp+4]
  7360 00003364 3C60                     cmp al, 96
  7361 00003366 0F8E0800                 jle .getdigit398
  7362 0000336A 8A4604                   mov al, [bp+4]
  7363 0000336D 2C27                     sub al, 39
  7364 0000336F 884604                   mov [bp+4], al
  7365                                  
  7366                                  ;-838 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  7367                                  
  7368                                  .getdigit398:
  7369 00003372 8A4604                   mov al, [bp+4]
  7370 00003375 3C40                     cmp al, 64
  7371 00003377 0F8E0800                 jle .getdigit399
  7372 0000337B 8A4604                   mov al, [bp+4]
  7373 0000337E 2C07                     sub al, 7
  7374 00003380 884604                   mov [bp+4], al
  7375                                  .getdigit399:
  7376 00003383 8A4604                   mov al, [bp+4]
  7377 00003386 2C30                     sub al, 48
  7378 00003388 884604                   mov [bp+4], al
  7379 0000338B A1[2C00]                 mov ax, [lexval]
  7380 0000338E C1E004                   shl ax, 4
  7381 00003391 A3[2C00]                 mov word [lexval], ax
  7382                                  
  7383                                  ;-839      i=0; i=c; lexval=lexval+i;}
  7384                                  
  7385 00003394 B80000                   mov ax, 0
  7386 00003397 8946FE                   mov [bp-2], ax
  7387 0000339A 8A4604                   mov al, [bp+4]
  7388 0000339D 8946FE                   mov [bp-2], ax
  7389 000033A0 A1[2C00]                 mov ax, [lexval]
  7390 000033A3 0346FE                   add ax, [bp-2]
  7391 000033A6 A3[2C00]                 mov word [lexval], ax
  7392                                  
  7393                                  ;-840     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  7394                                  
  7395 000033A9 EB9E                     jmp .getdigit396
  7396                                  .getdigit397:
  7397 000033AB E94200                   jmp .getdigit400
  7398                                  .getdigit395:
  7399                                  .getdigit401:
  7400 000033AE A0[2300]                 mov al, byte [thechar]
  7401 000033B1 B400                     mov ah, 0
  7402 000033B3 50                       push ax
  7403 000033B4 E8E7CD                   call digit
  7404 000033B7 83C402                   add  sp, 2
  7405 000033BA 08C0                     or  al, al
  7406 000033BC 0F843000                 je .getdigit402
  7407 000033C0 E82DD4                   call next
  7408 000033C3 884604                   mov [bp+4], al
  7409 000033C6 8A4604                   mov al, [bp+4]
  7410 000033C9 2C30                     sub al, 48
  7411 000033CB 884604                   mov [bp+4], al
  7412 000033CE A1[2C00]                 mov ax, [lexval]
  7413 000033D1 BB0A00                   mov bx, 10
  7414 000033D4 F7E3                     mul bx
  7415 000033D6 A3[2C00]                 mov word [lexval], ax
  7416                                  
  7417                                  ;-841      i=0; i=c; lexval=lexval+i; } }
  7418                                  
  7419 000033D9 B80000                   mov ax, 0
  7420 000033DC 8946FE                   mov [bp-2], ax
  7421 000033DF 8A4604                   mov al, [bp+4]
  7422 000033E2 8946FE                   mov [bp-2], ax
  7423 000033E5 A1[2C00]                 mov ax, [lexval]
  7424 000033E8 0346FE                   add ax, [bp-2]
  7425 000033EB A3[2C00]                 mov word [lexval], ax
  7426 000033EE EBBE                     jmp .getdigit401
  7427                                  .getdigit402:
  7428                                  
  7429                                  ;-842 }
  7430                                  
  7431                                  .getdigit400:
  7432                                  
  7433                                  ;-843 
  7434                                  
  7435                                  
  7436                                  ;-844 int stmt() { int c; char cha;
  7437 000033F0 C9                       LEAVE
  7438 000033F1 C3                       ret
  7439                                  ENDP
  7440                                  
  7441                                  stmt: PROC
  7442                                  
  7443                                  ;-845        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7444                                  ;
  7445 000033F2 C8040000                 ENTER  4,0
  7446 000033F6 6A7B                     push 123
  7447 000033F8 E813D4                   call istoken
  7448 000033FB 83C402                   add  sp, 2
  7449 000033FE 08C0                     or  al, al
  7450 00003400 0F841700                 je .stmt403
  7451                                  .stmt404:
  7452 00003404 6A7D                     push 125
  7453 00003406 E805D4                   call istoken
  7454 00003409 83C402                   add  sp, 2
  7455 0000340C 83F800                   cmp ax, 0
  7456 0000340F 0F850500                 jne .stmt405
  7457 00003413 E8DCFF                   call stmt
  7458 00003416 EBEC                     jmp .stmt404
  7459                                  .stmt405:
  7460                                  
  7461                                  ;-846   else if(istoken(T_IF))    doif();
  7462                                  
  7463 00003418 E9BA01                   jmp .stmt406
  7464                                  .stmt403:
  7465 0000341B 680102                   push 513
  7466 0000341E E8EDD3                   call istoken
  7467 00003421 83C402                   add  sp, 2
  7468 00003424 08C0                     or  al, al
  7469 00003426 0F840600                 je .stmt407
  7470 0000342A E8B5F7                   call doif
  7471                                  
  7472                                  ;-847   else if(istoken(T_DO))    dodo();
  7473                                  
  7474 0000342D E9A501                   jmp .stmt408
  7475                                  .stmt407:
  7476 00003430 680402                   push 516
  7477 00003433 E8D8D3                   call istoken
  7478 00003436 83C402                   add  sp, 2
  7479 00003439 08C0                     or  al, al
  7480 0000343B 0F840600                 je .stmt409
  7481 0000343F E802F8                   call dodo
  7482                                  
  7483                                  ;-848   else if(istoken(T_WHILE)) dowhile();
  7484                                  
  7485 00003442 E99001                   jmp .stmt410
  7486                                  .stmt409:
  7487 00003445 680302                   push 515
  7488 00003448 E8C3D3                   call istoken
  7489 0000344B 83C402                   add  sp, 2
  7490 0000344E 08C0                     or  al, al
  7491 00003450 0F840600                 je .stmt411
  7492 00003454 E83AF8                   call dowhile
  7493                                  
  7494                                  ;-849   else if(istoken(T_GOTO))  {
  7495                                  
  7496 00003457 E97B01                   jmp .stmt412
  7497                                  .stmt411:
  7498 0000345A 680902                   push 521
  7499 0000345D E8AED3                   call istoken
  7500 00003460 83C402                   add  sp, 2
  7501 00003463 08C0                     or  al, al
  7502 00003465 0F842200                 je .stmt413
  7503                                  
  7504                                  ;-850     prs("\n jmp .");name1();prs(symbol);expect(';');}
  7505                                  
  7506 00003469 68[D735]                 push stmt_0
  7507 0000346C E873CF                   call prs
  7508 0000346F 83C402                   add  sp, 2
  7509 00003472 E897D7                   call name1
  7510 00003475 8D06BB69                 lea  ax, [symbol]
  7511 00003479 50                       push ax
  7512 0000347A E865CF                   call prs
  7513 0000347D 83C402                   add  sp, 2
  7514 00003480 6A3B                     push 59
  7515 00003482 E8ABD3                   call expect
  7516 00003485 83C402                   add  sp, 2
  7517                                  
  7518                                  ;-851   else if(token==T_ASM)     {prs("\n"); c=next();
  7519                                  
  7520 00003488 E94A01                   jmp .stmt414
  7521                                  .stmt413:
  7522 0000348B A1[1E00]                 mov ax, [token]
  7523 0000348E 3D0602                   cmp ax, 518
  7524 00003491 0F853300                 jne .stmt415
  7525 00003495 68[E035]                 push stmt_1
  7526 00003498 E847CF                   call prs
  7527 0000349B 83C402                   add  sp, 2
  7528 0000349E E84FD3                   call next
  7529 000034A1 8946FE                   mov [bp-2], ax
  7530                                  
  7531                                  ;-852         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7532                                  
  7533                                  .stmt416:
  7534 000034A4 8B46FE                   mov ax, [bp-2]
  7535 000034A7 83F80A                   cmp ax, 10
  7536 000034AA 0F841100                 je  .stmt417
  7537 000034AE FF76FE                   push word [bp-2]
  7538 000034B1 E8D5CE                   call prc
  7539 000034B4 83C402                   add  sp, 2
  7540 000034B7 E836D3                   call next
  7541 000034BA 8946FE                   mov [bp-2], ax
  7542 000034BD EBE5                     jmp .stmt416
  7543                                  .stmt417:
  7544 000034BF E87AF8                   call getlex
  7545 000034C2 A3[1E00]                 mov word [token], ax
  7546                                  
  7547                                  ;-853   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  7548                                  
  7549 000034C5 E90D01                   jmp .stmt418
  7550                                  .stmt415:
  7551 000034C8 680702                   push 519
  7552 000034CB E840D3                   call istoken
  7553 000034CE 83C402                   add  sp, 2
  7554 000034D1 08C0                     or  al, al
  7555 000034D3 0F844B00                 je .stmt419
  7556 000034D7 A1[1E00]                 mov ax, [token]
  7557 000034DA 83F87B                   cmp ax, 123
  7558 000034DD 0F853500                 jne .stmt420
  7559 000034E1 68[E335]                 push stmt_2
  7560 000034E4 E8FBCE                   call prs
  7561 000034E7 83C402                   add  sp, 2
  7562 000034EA E803D3                   call next
  7563 000034ED 8846FC                   mov [bp-4], al
  7564                                  
  7565                                  ;-854         while(cha!= '}') { prc(cha); cha=next(); }
  7566                                  
  7567                                  .stmt421:
  7568 000034F0 8A46FC                   mov al, [bp-4]
  7569 000034F3 3C7D                     cmp al, 125
  7570 000034F5 0F841400                 je  .stmt422
  7571 000034F9 8A46FC                   mov al, byte [bp-4]
  7572 000034FC B400                     mov ah, 0
  7573 000034FE 50                       push ax
  7574 000034FF E887CE                   call prc
  7575 00003502 83C402                   add  sp, 2
  7576 00003505 E8E8D2                   call next
  7577 00003508 8846FC                   mov [bp-4], al
  7578                                  
  7579                                  ;-855         token=getlex(); }
  7580                                  
  7581 0000350B EBE3                     jmp .stmt421
  7582                                  .stmt422:
  7583 0000350D E82CF8                   call getlex
  7584 00003510 A3[1E00]                 mov word [token], ax
  7585                                  
  7586                                  ;-856         else error1("Curly open expected");
  7587                                  
  7588 00003513 E90900                   jmp .stmt423
  7589                                  .stmt420:
  7590 00003516 68[E635]                 push stmt_3
  7591 00003519 E8C4D0                   call error1
  7592 0000351C 83C402                   add  sp, 2
  7593                                  
  7594                                  ;-857         }
  7595                                  
  7596                                  .stmt423:
  7597                                  
  7598                                  ;-858   else if(istoken(T_EMIT))   doemit();
  7599                                  
  7600 0000351F E9B300                   jmp .stmt424
  7601                                  .stmt419:
  7602 00003522 680802                   push 520
  7603 00003525 E8E6D2                   call istoken
  7604 00003528 83C402                   add  sp, 2
  7605 0000352B 08C0                     or  al, al
  7606 0000352D 0F840600                 je .stmt425
  7607 00003531 E8A0F4                   call doemit
  7608                                  
  7609                                  ;-859   else if(istoken(';'))      { }
  7610                                  
  7611 00003534 E99E00                   jmp .stmt426
  7612                                  .stmt425:
  7613 00003537 6A3B                     push 59
  7614 00003539 E8D2D2                   call istoken
  7615 0000353C 83C402                   add  sp, 2
  7616 0000353F 08C0                     or  al, al
  7617 00003541 0F840300                 je .stmt427
  7618                                  
  7619                                  ;-860   else if(istoken(T_RETURN)) {
  7620                                  
  7621 00003545 E98D00                   jmp .stmt428
  7622                                  .stmt427:
  7623 00003548 680002                   push 512
  7624 0000354B E8C0D2                   call istoken
  7625 0000354E 83C402                   add  sp, 2
  7626 00003551 08C0                     or  al, al
  7627 00003553 0F843500                 je .stmt429
  7628                                  
  7629                                  ;-861         if (token!=';') expr(0);
  7630                                  
  7631 00003557 A1[1E00]                 mov ax, [token]
  7632 0000355A 83F83B                   cmp ax, 59
  7633 0000355D 0F840800                 je  .stmt430
  7634 00003561 6A00                     push 0
  7635 00003563 E823E1                   call expr
  7636 00003566 83C402                   add  sp, 2
  7637                                  
  7638                                  ;-862         prs("\n jmp .retn");
  7639                                  
  7640                                  .stmt430:
  7641 00003569 68[FA35]                 push stmt_4
  7642 0000356C E873CE                   call prs
  7643 0000356F 83C402                   add  sp, 2
  7644                                  
  7645                                  ;-863         prs(fname);
  7646                                  
  7647 00003572 8D063B6A                 lea  ax, [fname]
  7648 00003576 50                       push ax
  7649 00003577 E868CE                   call prs
  7650 0000357A 83C402                   add  sp, 2
  7651                                  
  7652                                  ;-864         nreturn++;
  7653                                  
  7654 0000357D FF06[2800]               inc  word[nreturn]
  7655                                  
  7656                                  ;-865         expect(';');
  7657                                  
  7658 00003581 6A3B                     push 59
  7659 00003583 E8AAD2                   call expect
  7660 00003586 83C402                   add  sp, 2
  7661                                  
  7662                                  ;-866         }
  7663                                  
  7664                                  
  7665                                  ;-867   else if(thechar==':')      {
  7666                                  
  7667 00003589 E94900                   jmp .stmt431
  7668                                  .stmt429:
  7669 0000358C A0[2300]                 mov al, [thechar]
  7670 0000358F 3C3A                     cmp al, 58
  7671 00003591 0F853000                 jne .stmt432
  7672                                  
  7673                                  ;-868         prs("\n."); // Label
  7674                                  
  7675 00003595 68[0736]                 push stmt_5
  7676 00003598 E847CE                   call prs
  7677 0000359B 83C402                   add  sp, 2
  7678                                  
  7679                                  ;-869         prs(symbol); prc(':');
  7680                                  
  7681 0000359E 8D06BB69                 lea  ax, [symbol]
  7682 000035A2 50                       push ax
  7683 000035A3 E83CCE                   call prs
  7684 000035A6 83C402                   add  sp, 2
  7685 000035A9 6A3A                     push 58
  7686 000035AB E8DBCD                   call prc
  7687 000035AE 83C402                   add  sp, 2
  7688                                  
  7689                                  ;-870         expect(T_NAME);
  7690                                  
  7691 000035B1 680001                   push 256
  7692 000035B4 E879D2                   call expect
  7693 000035B7 83C402                   add  sp, 2
  7694                                  
  7695                                  ;-871         expect(':');
  7696                                  
  7697 000035BA 6A3A                     push 58
  7698 000035BC E871D2                   call expect
  7699 000035BF 83C402                   add  sp, 2
  7700                                  
  7701                                  ;-872         }
  7702                                  
  7703                                  
  7704                                  ;-873   else  {expr(0);; expect(';'); }
  7705                                  
  7706 000035C2 E91000                   jmp .stmt433
  7707                                  .stmt432:
  7708 000035C5 6A00                     push 0
  7709 000035C7 E8BFE0                   call expr
  7710 000035CA 83C402                   add  sp, 2
  7711 000035CD 6A3B                     push 59
  7712 000035CF E85ED2                   call expect
  7713 000035D2 83C402                   add  sp, 2
  7714                                  
  7715                                  ;-874 }
  7716                                  
  7717                                  .stmt433:
  7718                                  .stmt431:
  7719                                  .stmt428:
  7720                                  .stmt426:
  7721                                  .stmt424:
  7722                                  .stmt418:
  7723                                  .stmt414:
  7724                                  .stmt412:
  7725                                  .stmt410:
  7726                                  .stmt408:
  7727                                  .stmt406:
  7728                                  
  7729                                  ;-875 
  7730                                  
  7731                                  
  7732                                  ;-876 int getstring(int delim) {
  7733 000035D5 C9                       LEAVE
  7734 000035D6 C3                       ret
  7735 000035D7 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7736 000035E0 5C6E00                  stmt_1 db "\n",0
  7737 000035E3 5C6E00                  stmt_2 db "\n",0
  7738 000035E6 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7739 000035EF 6E2065787065637465-
  7740 000035F8 6400               
  7741 000035FA 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7742 00003603 65746E00           
  7743 00003607 5C6E2E00                stmt_5 db "\n.",0
  7744                                  ENDP
  7745                                  
  7746                                  getstring: PROC
  7747                                  
  7748                                  ;-877     int c; char *p;
  7749                                  
  7750                                  
  7751                                  ;-878     p=&symbol;
  7752                                  ;
  7753 0000360B C8040000                 ENTER  4,0
  7754 0000360F B8BB69                   mov ax, symbol
  7755 00003612 8946FC                   mov [bp-4], ax
  7756                                  
  7757                                  ;-879     c=next();
  7758                                  
  7759 00003615 E8D8D1                   call next
  7760 00003618 8946FE                   mov [bp-2], ax
  7761                                  
  7762                                  ;-880     while (c != delim) {
  7763                                  
  7764                                  .getstring434:
  7765 0000361B 8B46FE                   mov ax, [bp-2]
  7766 0000361E 3B4604                   cmp ax, [bp+4]
  7767 00003621 0F841300                 je  .getstring435
  7768                                  
  7769                                  ;-881         *p=c;
  7770                                  
  7771 00003625 8B46FE                   mov ax, [bp-2]
  7772 00003628 8B5EFC                   mov  bx, [bp-4]
  7773 0000362B 8807                     mov  [bx], al
  7774                                  
  7775                                  ;-882         p++;
  7776                                  
  7777 0000362D FF46FC                   inc  word[bp-4]
  7778                                  
  7779                                  ;-883         c=next();
  7780                                  
  7781 00003630 E8BDD1                   call next
  7782 00003633 8946FE                   mov [bp-2], ax
  7783                                  
  7784                                  ;-884     }
  7785                                  
  7786                                  
  7787                                  ;-885     *p=0;
  7788                                  
  7789 00003636 EBE3                     jmp .getstring434
  7790                                  .getstring435:
  7791 00003638 B80000                   mov ax, 0
  7792 0000363B 8B5EFC                   mov  bx, [bp-4]
  7793 0000363E 8807                     mov  [bx], al
  7794                                  
  7795                                  ;-886 }
  7796                                  
  7797                                  
  7798                                  ;-887 
  7799                                  
  7800                                  
  7801                                  ;-888 
  7802                                  
  7803                                  
  7804                                  ;-889 int dofunc() { int nloc; int i; int narg;
  7805 00003640 C9                       LEAVE
  7806 00003641 C3                       ret
  7807                                  ENDP
  7808                                  
  7809                                  dofunc: PROC
  7810                                  
  7811                                  ;-890   cloc=&co;
  7812                                  ;
  7813 00003642 C8060000                 ENTER  6,0
  7814 00003646 B8A861                   mov ax, co
  7815 00003649 A3[1800]                 mov word [cloc], ax
  7816                                  
  7817                                  ;-891   checknamelen();
  7818                                  
  7819 0000364C E8EFD2                   call checknamelen
  7820                                  
  7821                                  ;-892   strcpy(fname, symbol);
  7822                                  
  7823 0000364F 8D06BB69                 lea  ax, [symbol]
  7824 00003653 50                       push ax
  7825 00003654 8D063B6A                 lea  ax, [fname]
  7826 00003658 50                       push ax
  7827 00003659 E8D0CB                   call strcpy
  7828 0000365C 83C404                   add  sp, 4
  7829                                  
  7830                                  ;-893   if (checkFunction() ) error1("Function already defined");
  7831                                  
  7832 0000365F E88AD7                   call checkFunction
  7833 00003662 08C0                     or  al, al
  7834 00003664 0F840900                 je .dofunc436
  7835 00003668 68[8938]                 push dofunc_0
  7836 0000366B E872CF                   call error1
  7837 0000366E 83C402                   add  sp, 2
  7838                                  
  7839                                  ;-894   storefunc();
  7840                                  
  7841                                  .dofunc436:
  7842 00003671 E84AD6                   call storefunc
  7843                                  
  7844                                  ;-895   prs("\n\n"); prs(symbol); prs(": PROC");
  7845                                  
  7846 00003674 68[A238]                 push dofunc_1
  7847 00003677 E868CD                   call prs
  7848 0000367A 83C402                   add  sp, 2
  7849 0000367D 8D06BB69                 lea  ax, [symbol]
  7850 00003681 50                       push ax
  7851 00003682 E85DCD                   call prs
  7852 00003685 83C402                   add  sp, 2
  7853 00003688 68[A738]                 push dofunc_2
  7854 0000368B E854CD                   call prs
  7855 0000368E 83C402                   add  sp, 2
  7856                                  
  7857                                  ;-896   expect('('); LTop=LSTART;  i=0;
  7858                                  
  7859 00003691 6A28                     push 40
  7860 00003693 E89AD1                   call expect
  7861 00003696 83C402                   add  sp, 2
  7862 00003699 B8C800                   mov ax, 200
  7863 0000369C A3[3B00]                 mov word [LTop], ax
  7864 0000369F B80000                   mov ax, 0
  7865 000036A2 8946FC                   mov [bp-4], ax
  7866                                  
  7867                                  ;-897   if (istoken(')')==0) { narg=2;
  7868                                  
  7869 000036A5 6A29                     push 41
  7870 000036A7 E864D1                   call istoken
  7871 000036AA 83C402                   add  sp, 2
  7872 000036AD 83F800                   cmp ax, 0
  7873 000036B0 0F854600                 jne .dofunc437
  7874 000036B4 B80200                   mov ax, 2
  7875 000036B7 8946FA                   mov [bp-6], ax
  7876                                  
  7877                                  ;-898     do { typeName();  addlocal(); narg+=2;
  7878                                  
  7879                                  .dofunc438:
  7880 000036BA E876D4                   call typeName
  7881 000036BD E873D6                   call addlocal
  7882 000036C0 8346FA02                 add  word[bp-6], 2
  7883                                  
  7884                                  ;-899          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7885                                  
  7886 000036C4 8B46FA                   mov ax, [bp-6]
  7887 000036C7 8B1E[3B00]               mov bx, [LTop]
  7888 000036CB D1E3                     shl bx, 1
  7889 000036CD 89873873                 mov [GData+bx], ax
  7890 000036D1 A0[3600]                 mov al, [iswidth]
  7891 000036D4 3C04                     cmp al, 4
  7892 000036D6 0F850400                 jne .dofunc439
  7893 000036DA 8346FA02                 add  word[bp-6], 2
  7894                                  .dofunc439:
  7895 000036DE FF06[3B00]               inc  word[LTop]
  7896                                  
  7897                                  ;-900     while (istoken(','));  expect(')'); }
  7898                                  
  7899 000036E2 6A2C                     push 44
  7900 000036E4 E827D1                   call istoken
  7901 000036E7 83C402                   add  sp, 2
  7902 000036EA 08C0                     or  al, al
  7903 000036EC 0F840200                 je .dofunc440
  7904 000036F0 EBC8                     jmp .dofunc438
  7905                                  .dofunc440:
  7906 000036F2 6A29                     push 41
  7907 000036F4 E839D1                   call expect
  7908 000036F7 83C402                   add  sp, 2
  7909                                  
  7910                                  ;-901 
  7911                                  
  7912                                  
  7913                                  ;-902   expect('{'); /*body*/
  7914                                  
  7915                                  .dofunc437:
  7916 000036FA 6A7B                     push 123
  7917 000036FC E831D1                   call expect
  7918 000036FF 83C402                   add  sp, 2
  7919                                  
  7920                                  ;-903   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  7921                                  
  7922 00003702 B80000                   mov ax, 0
  7923 00003705 8946FE                   mov [bp-2], ax
  7924 00003708 B80000                   mov ax, 0
  7925 0000370B A3[2800]                 mov word [nreturn], ax
  7926 0000370E B80000                   mov ax, 0
  7927 00003711 A3[2600]                 mov word [nconst], ax
  7928 00003714 B80000                   mov ax, 0
  7929 00003717 8946FC                   mov [bp-4], ax
  7930                                  
  7931                                  ;-904   while(isvariable()) {
  7932                                  
  7933                                  .dofunc441:
  7934 0000371A E81CD7                   call isvariable
  7935 0000371D 08C0                     or  al, al
  7936 0000371F 0F849200                 je .dofunc442
  7937                                  
  7938                                  ;-905     do {typeName();
  7939                                  
  7940                                  .dofunc443:
  7941 00003723 E80DD4                   call typeName
  7942                                  
  7943                                  ;-906         checknamelen();
  7944                                  
  7945 00003726 E815D2                   call checknamelen
  7946                                  
  7947                                  ;-907         addlocal(); nloc-=2;
  7948                                  
  7949 00003729 E807D6                   call addlocal
  7950 0000372C 836EFE02                 sub  word[bp-2], 2
  7951                                  
  7952                                  ;-908         if (iswidth == 4) nloc-=2;
  7953                                  
  7954 00003730 A0[3600]                 mov al, [iswidth]
  7955 00003733 3C04                     cmp al, 4
  7956 00003735 0F850400                 jne .dofunc444
  7957 00003739 836EFE02                 sub  word[bp-2], 2
  7958                                  
  7959                                  ;-909         GData[LTop]=nloc;
  7960                                  
  7961                                  .dofunc444:
  7962 0000373D 8B46FE                   mov ax, [bp-2]
  7963 00003740 8B1E[3B00]               mov bx, [LTop]
  7964 00003744 D1E3                     shl bx, 1
  7965 00003746 89873873                 mov [GData+bx], ax
  7966                                  
  7967                                  ;-910         if (istoken('[')){
  7968                                  
  7969 0000374A 6A5B                     push 91
  7970 0000374C E8BFD0                   call istoken
  7971 0000374F 83C402                   add  sp, 2
  7972 00003752 08C0                     or  al, al
  7973 00003754 0F843D00                 je .dofunc445
  7974                                  
  7975                                  ;-911             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  7976                                  
  7977 00003758 B82600                   mov ax, 38
  7978 0000375B A2[3000]                 mov byte [istype], al
  7979 0000375E B82600                   mov ax, 38
  7980 00003761 8B1E[3B00]               mov bx, [LTop]
  7981 00003765 8887046B                 mov [GType+bx], al
  7982 00003769 680101                   push 257
  7983 0000376C E8C1D0                   call expect
  7984 0000376F 83C402                   add  sp, 2
  7985 00003772 6A5D                     push 93
  7986 00003774 E8B9D0                   call expect
  7987 00003777 83C402                   add  sp, 2
  7988                                  
  7989                                  ;-912             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  7990                                  
  7991 0000377A 8B46FE                   mov ax, [bp-2]
  7992 0000377D 2B06[2C00]               sub ax, [lexval]
  7993 00003781 8946FE                   mov [bp-2], ax
  7994 00003784 8346FE02                 add  word[bp-2], 2
  7995 00003788 8B46FE                   mov ax, [bp-2]
  7996 0000378B 8B1E[3B00]               mov bx, [LTop]
  7997 0000378F D1E3                     shl bx, 1
  7998 00003791 89873873                 mov [GData+bx], ax
  7999                                  
  8000                                  ;-913             }
  8001                                  
  8002                                  
  8003                                  ;-914         LTop++;
  8004                                  
  8005                                  .dofunc445:
  8006 00003795 FF06[3B00]               inc  word[LTop]
  8007                                  
  8008                                  ;-915       } while (istoken(',')); expect(';'); }
  8009                                  
  8010 00003799 6A2C                     push 44
  8011 0000379B E870D0                   call istoken
  8012 0000379E 83C402                   add  sp, 2
  8013 000037A1 08C0                     or  al, al
  8014 000037A3 0F840300                 je .dofunc446
  8015 000037A7 E979FF                   jmp .dofunc443
  8016                                  .dofunc446:
  8017 000037AA 6A3B                     push 59
  8018 000037AC E881D0                   call expect
  8019 000037AF 83C402                   add  sp, 2
  8020                                  
  8021                                  ;-916   if (LTop>LSTART){prs(";\n ENTER  ");
  8022                                  
  8023 000037B2 E965FF                   jmp .dofunc441
  8024                                  .dofunc442:
  8025 000037B5 A1[3B00]                 mov ax, [LTop]
  8026 000037B8 3DC800                   cmp ax, 200
  8027 000037BB 0F8E2700                 jle .dofunc447
  8028 000037BF 68[AE38]                 push dofunc_3
  8029 000037C2 E81DCC                   call prs
  8030 000037C5 83C402                   add  sp, 2
  8031                                  
  8032                                  ;-917     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8033                                  
  8034 000037C8 FF76FE                   push word [bp-2]
  8035 000037CB E8D6C8                   call mkneg
  8036 000037CE 83C402                   add  sp, 2
  8037 000037D1 8946FE                   mov [bp-2], ax
  8038 000037D4 FF76FE                   push word [bp-2]
  8039 000037D7 E86BCD                   call prunsign1
  8040 000037DA 83C402                   add  sp, 2
  8041 000037DD 68[BA38]                 push dofunc_4
  8042 000037E0 E8FFCB                   call prs
  8043 000037E3 83C402                   add  sp, 2
  8044                                  
  8045                                  ;-918   while(istoken('}')==0)   stmt();
  8046                                  
  8047                                  .dofunc447:
  8048                                  .dofunc448:
  8049 000037E6 6A7D                     push 125
  8050 000037E8 E823D0                   call istoken
  8051 000037EB 83C402                   add  sp, 2
  8052 000037EE 83F800                   cmp ax, 0
  8053 000037F1 0F850500                 jne .dofunc449
  8054 000037F5 E8FAFB                   call stmt
  8055                                  
  8056                                  ;-919   if (nreturn) {
  8057                                  
  8058 000037F8 EBEC                     jmp .dofunc448
  8059                                  .dofunc449:
  8060 000037FA A1[2800]                 mov ax, [nreturn]
  8061 000037FD 08C0                     or  al, al
  8062 000037FF 0F841C00                 je .dofunc450
  8063                                  
  8064                                  ;-920         prs("\n .retn");
  8065                                  
  8066 00003803 68[BD38]                 push dofunc_5
  8067 00003806 E8D9CB                   call prs
  8068 00003809 83C402                   add  sp, 2
  8069                                  
  8070                                  ;-921         prs(fname);
  8071                                  
  8072 0000380C 8D063B6A                 lea  ax, [fname]
  8073 00003810 50                       push ax
  8074 00003811 E8CECB                   call prs
  8075 00003814 83C402                   add  sp, 2
  8076                                  
  8077                                  ;-922         prc(':');
  8078                                  
  8079 00003817 6A3A                     push 58
  8080 00003819 E86DCB                   call prc
  8081 0000381C 83C402                   add  sp, 2
  8082                                  
  8083                                  ;-923         }
  8084                                  
  8085                                  
  8086                                  ;-924   if (LTop > LSTART) prs(" LEAVE");
  8087                                  
  8088                                  .dofunc450:
  8089 0000381F A1[3B00]                 mov ax, [LTop]
  8090 00003822 3DC800                   cmp ax, 200
  8091 00003825 0F8E0900                 jle .dofunc451
  8092 00003829 68[C638]                 push dofunc_6
  8093 0000382C E8B3CB                   call prs
  8094 0000382F 83C402                   add  sp, 2
  8095                                  
  8096                                  ;-925   prs("\n ret");
  8097                                  
  8098                                  .dofunc451:
  8099 00003832 68[CD38]                 push dofunc_7
  8100 00003835 E8AACB                   call prs
  8101 00003838 83C402                   add  sp, 2
  8102                                  
  8103                                  ;-926   *cloc=0; prs(co);
  8104                                  
  8105 0000383B B80000                   mov ax, 0
  8106 0000383E 8B1E[1800]               mov  bx, [cloc]
  8107 00003842 8807                     mov  [bx], al
  8108 00003844 8D06A861                 lea  ax, [co]
  8109 00003848 50                       push ax
  8110 00003849 E896CB                   call prs
  8111 0000384C 83C402                   add  sp, 2
  8112                                  
  8113                                  ;-927   maxco1=strlen(co);
  8114                                  
  8115 0000384F 8D06A861                 lea  ax, [co]
  8116 00003853 50                       push ax
  8117 00003854 E8ADC9                   call strlen
  8118 00003857 83C402                   add  sp, 2
  8119 0000385A A3[1600]                 mov word [maxco1], ax
  8120                                  
  8121                                  ;-928   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  8122                                  
  8123 0000385D A1[1600]                 mov ax, [maxco1]
  8124 00003860 3B06[1400]               cmp ax, [maxco]
  8125 00003864 0F8E1600                 jle .dofunc452
  8126 00003868 A1[1600]                 mov ax, [maxco1]
  8127 0000386B A3[1400]                 mov word [maxco], ax
  8128 0000386E 8D063B6A                 lea  ax, [fname]
  8129 00003872 50                       push ax
  8130 00003873 8D067869                 lea  ax, [coname]
  8131 00003877 50                       push ax
  8132 00003878 E8B1C9                   call strcpy
  8133 0000387B 83C404                   add  sp, 4
  8134                                  
  8135                                  ;-929   prs("\nENDP");
  8136                                  
  8137                                  .dofunc452:
  8138 0000387E 68[D438]                 push dofunc_8
  8139 00003881 E85ECB                   call prs
  8140 00003884 83C402                   add  sp, 2
  8141                                  
  8142                                  ;-930 }
  8143                                  
  8144                                  
  8145                                  ;-931 
  8146                                  
  8147                                  
  8148                                  ;-932 char doglobName[IDLENMAX];
  8149 00003887 C9                       LEAVE
  8150 00003888 C3                       ret
  8151 00003889 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8152 00003892 616C72656164792064-
  8153 0000389B 6566696E656400     
  8154 000038A2 5C6E5C6E00              dofunc_1 db "\n\n",0
  8155 000038A7 3A2050524F4300          dofunc_2 db ": PROC",0
  8156 000038AE 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  8157 000038B7 202000             
  8158 000038BA 2C3000                  dofunc_4 db ",0",0
  8159 000038BD 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  8160 000038C6 204C4541564500          dofunc_6 db " LEAVE",0
  8161 000038CD 5C6E2072657400          dofunc_7 db "\n ret",0
  8162 000038D4 5C6E454E445000          dofunc_8 db "\nENDP",0
  8163                                  ENDP
  8164                                  section .bss
  8165                                  absolute 55982
  8166 0000DAAE <res 0000000F>          doglobName resb 15
  8167                                  section .text
  8168                                  
  8169                                  ;-933 int doglob() {
  8170                                  
  8171                                  
  8172                                  doglob: PROC
  8173                                  
  8174                                  ;-934     int i; int j; int isstrarr; isstrarr=0;
  8175                                  ;
  8176 000038DB C8060000                 ENTER  6,0
  8177 000038DF B80000                   mov ax, 0
  8178 000038E2 8946FA                   mov [bp-6], ax
  8179                                  
  8180                                  ;-935   if (GTop >= LSTART) error1("Global table full");
  8181                                  
  8182 000038E5 A1[3900]                 mov ax, [GTop]
  8183 000038E8 3DC800                   cmp ax, 200 ;unsigned : 1
  8184 000038EB 0F8C0900                 jl  .doglob453
  8185 000038EF 68[303C]                 push doglob_0
  8186 000038F2 E8EBCC                   call error1
  8187 000038F5 83C402                   add  sp, 2
  8188                                  
  8189                                  ;-936   if (iswidth == 0) error1("no VOID as var type");
  8190                                  
  8191                                  .doglob453:
  8192 000038F8 A0[3600]                 mov al, [iswidth]
  8193 000038FB 3C00                     cmp al, 0
  8194 000038FD 0F850900                 jne .doglob454
  8195 00003901 68[423C]                 push doglob_1
  8196 00003904 E8D9CC                   call error1
  8197 00003907 83C402                   add  sp, 2
  8198                                  
  8199                                  ;-937   checknamelen();
  8200                                  
  8201                                  .doglob454:
  8202 0000390A E831D0                   call checknamelen
  8203                                  
  8204                                  ;-938   if (checkName() != 0) error1("Variable already defined");
  8205                                  
  8206 0000390D E89FD1                   call checkName
  8207 00003910 3C00                     cmp al, 0
  8208 00003912 0F840900                 je  .doglob455
  8209 00003916 68[563C]                 push doglob_2
  8210 00003919 E8C4CC                   call error1
  8211 0000391C 83C402                   add  sp, 2
  8212                                  
  8213                                  ;-939   if (istoken('[')) { istype='&';
  8214                                  
  8215                                  .doglob455:
  8216 0000391F 6A5B                     push 91
  8217 00003921 E8EACE                   call istoken
  8218 00003924 83C402                   add  sp, 2
  8219 00003927 08C0                     or  al, al
  8220 00003929 0F84E201                 je .doglob456
  8221 0000392D B82600                   mov ax, 38
  8222 00003930 A2[3000]                 mov byte [istype], al
  8223                                  
  8224                                  ;-940     if (istoken(T_CONST)) {
  8225                                  
  8226 00003933 680101                   push 257
  8227 00003936 E8D5CE                   call istoken
  8228 00003939 83C402                   add  sp, 2
  8229 0000393C 08C0                     or  al, al
  8230 0000393E 0F84C200                 je .doglob457
  8231                                  
  8232                                  ;-941       prs("\nsection .bss\nabsolute ");
  8233                                  
  8234 00003942 68[6F3C]                 push doglob_3
  8235 00003945 E89ACA                   call prs
  8236 00003948 83C402                   add  sp, 2
  8237                                  
  8238                                  ;-942       prunsign1(orgData);
  8239                                  
  8240 0000394B FF36[1200]               push word [orgData]
  8241 0000394F E8F3CB                   call prunsign1
  8242 00003952 83C402                   add  sp, 2
  8243                                  
  8244                                  ;-943       prs("\n"); prs(symbol);
  8245                                  
  8246 00003955 68[893C]                 push doglob_4
  8247 00003958 E887CA                   call prs
  8248 0000395B 83C402                   add  sp, 2
  8249 0000395E 8D06BB69                 lea  ax, [symbol]
  8250 00003962 50                       push ax
  8251 00003963 E87CCA                   call prs
  8252 00003966 83C402                   add  sp, 2
  8253                                  
  8254                                  ;-944       if (iswidth==1) prs(" resb ");
  8255                                  
  8256 00003969 A0[3600]                 mov al, [iswidth]
  8257 0000396C 3C01                     cmp al, 1
  8258 0000396E 0F850900                 jne .doglob458
  8259 00003972 68[8C3C]                 push doglob_5
  8260 00003975 E86ACA                   call prs
  8261 00003978 83C402                   add  sp, 2
  8262                                  
  8263                                  ;-945       if (iswidth==2) prs(" resw ");
  8264                                  
  8265                                  .doglob458:
  8266 0000397B A0[3600]                 mov al, [iswidth]
  8267 0000397E 3C02                     cmp al, 2
  8268 00003980 0F850900                 jne .doglob459
  8269 00003984 68[933C]                 push doglob_6
  8270 00003987 E858CA                   call prs
  8271 0000398A 83C402                   add  sp, 2
  8272                                  
  8273                                  ;-946       if (iswidth==4) prs(" resd ");
  8274                                  
  8275                                  .doglob459:
  8276 0000398D A0[3600]                 mov al, [iswidth]
  8277 00003990 3C04                     cmp al, 4
  8278 00003992 0F850900                 jne .doglob460
  8279 00003996 68[9A3C]                 push doglob_7
  8280 00003999 E846CA                   call prs
  8281 0000399C 83C402                   add  sp, 2
  8282                                  
  8283                                  ;-947       prunsign1(lexval);
  8284                                  
  8285                                  .doglob460:
  8286 0000399F FF36[2C00]               push word [lexval]
  8287 000039A3 E89FCB                   call prunsign1
  8288 000039A6 83C402                   add  sp, 2
  8289                                  
  8290                                  ;-948       prs("\nsection .text");
  8291                                  
  8292 000039A9 68[A13C]                 push doglob_8
  8293 000039AC E833CA                   call prs
  8294 000039AF 83C402                   add  sp, 2
  8295                                  
  8296                                  ;-949       orgData=orgData+lexval;
  8297                                  
  8298 000039B2 A1[1200]                 mov ax, [orgData]
  8299 000039B5 0306[2C00]               add ax, [lexval]
  8300 000039B9 A3[1200]                 mov word [orgData], ax
  8301                                  
  8302                                  ;-950       if (iswidth==2) orgData=orgData+lexval;
  8303                                  
  8304 000039BC A0[3600]                 mov al, [iswidth]
  8305 000039BF 3C02                     cmp al, 2
  8306 000039C1 0F850A00                 jne .doglob461
  8307 000039C5 A1[1200]                 mov ax, [orgData]
  8308 000039C8 0306[2C00]               add ax, [lexval]
  8309 000039CC A3[1200]                 mov word [orgData], ax
  8310                                  
  8311                                  ;-951       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8312                                  
  8313                                  .doglob461:
  8314 000039CF A0[3600]                 mov al, [iswidth]
  8315 000039D2 3C04                     cmp al, 4
  8316 000039D4 0F851400                 jne .doglob462
  8317 000039D8 A1[2C00]                 mov ax, [lexval]
  8318 000039DB BB0300                   mov bx, 3
  8319 000039DE F7E3                     mul bx
  8320 000039E0 8946FE                   mov [bp-2], ax
  8321 000039E3 A1[1200]                 mov ax, [orgData]
  8322 000039E6 0346FE                   add ax, [bp-2]
  8323 000039E9 A3[1200]                 mov word [orgData], ax
  8324                                  
  8325                                  ;-952       GData[GTop]=lexval; expect(']');
  8326                                  
  8327                                  .doglob462:
  8328 000039EC A1[2C00]                 mov ax, [lexval]
  8329 000039EF 8B1E[3900]               mov bx, [GTop]
  8330 000039F3 D1E3                     shl bx, 1
  8331 000039F5 89873873                 mov [GData+bx], ax
  8332 000039F9 6A5D                     push 93
  8333 000039FB E832CE                   call expect
  8334 000039FE 83C402                   add  sp, 2
  8335                                  
  8336                                  ;-953     }else { expect(']');
  8337                                  
  8338 00003A01 E90801                   jmp .doglob463
  8339                                  .doglob457:
  8340 00003A04 6A5D                     push 93
  8341 00003A06 E827CE                   call expect
  8342 00003A09 83C402                   add  sp, 2
  8343                                  
  8344                                  ;-954       if (iswidth != 1) error1("Only ByteArray allowed");
  8345                                  
  8346 00003A0C A0[3600]                 mov al, [iswidth]
  8347 00003A0F 3C01                     cmp al, 1
  8348 00003A11 0F840900                 je  .doglob464
  8349 00003A15 68[B13C]                 push doglob_9
  8350 00003A18 E8C5CB                   call error1
  8351 00003A1B 83C402                   add  sp, 2
  8352                                  
  8353                                  ;-955       prs("\n"); prs(symbol); prs(" db ");
  8354                                  
  8355                                  .doglob464:
  8356 00003A1E 68[C83C]                 push doglob_10
  8357 00003A21 E8BEC9                   call prs
  8358 00003A24 83C402                   add  sp, 2
  8359 00003A27 8D06BB69                 lea  ax, [symbol]
  8360 00003A2B 50                       push ax
  8361 00003A2C E8B3C9                   call prs
  8362 00003A2F 83C402                   add  sp, 2
  8363 00003A32 68[CB3C]                 push doglob_11
  8364 00003A35 E8AAC9                   call prs
  8365 00003A38 83C402                   add  sp, 2
  8366                                  
  8367                                  ;-956       isstrarr=1; strcpy(doglobName, symbol);
  8368                                  
  8369 00003A3B B80100                   mov ax, 1
  8370 00003A3E 8946FA                   mov [bp-6], ax
  8371 00003A41 8D06BB69                 lea  ax, [symbol]
  8372 00003A45 50                       push ax
  8373 00003A46 8D06AEDA                 lea  ax, [doglobName]
  8374 00003A4A 50                       push ax
  8375 00003A4B E8DEC7                   call strcpy
  8376 00003A4E 83C404                   add  sp, 4
  8377                                  
  8378                                  ;-957       expect('=');
  8379                                  
  8380 00003A51 6A3D                     push 61
  8381 00003A53 E8DACD                   call expect
  8382 00003A56 83C402                   add  sp, 2
  8383                                  
  8384                                  ;-958       if (istoken(T_STRING)) {
  8385                                  
  8386 00003A59 680201                   push 258
  8387 00003A5C E8AFCD                   call istoken
  8388 00003A5F 83C402                   add  sp, 2
  8389 00003A62 08C0                     or  al, al
  8390 00003A64 0F844200                 je .doglob465
  8391                                  
  8392                                  ;-959         prc(34); prscomment(symbol); prc(34); prs(",0");
  8393                                  
  8394 00003A68 6A22                     push 34
  8395 00003A6A E81CC9                   call prc
  8396 00003A6D 83C402                   add  sp, 2
  8397 00003A70 8D06BB69                 lea  ax, [symbol]
  8398 00003A74 50                       push ax
  8399 00003A75 E83CC9                   call prscomment
  8400 00003A78 83C402                   add  sp, 2
  8401 00003A7B 6A22                     push 34
  8402 00003A7D E809C9                   call prc
  8403 00003A80 83C402                   add  sp, 2
  8404 00003A83 68[D03C]                 push doglob_12
  8405 00003A86 E859C9                   call prs
  8406 00003A89 83C402                   add  sp, 2
  8407                                  
  8408                                  ;-960         i=strlen(symbol); GData[GTop]=i; }
  8409                                  
  8410 00003A8C 8D06BB69                 lea  ax, [symbol]
  8411 00003A90 50                       push ax
  8412 00003A91 E870C7                   call strlen
  8413 00003A94 83C402                   add  sp, 2
  8414 00003A97 8946FE                   mov [bp-2], ax
  8415 00003A9A 8B46FE                   mov ax, [bp-2]
  8416 00003A9D 8B1E[3900]               mov bx, [GTop]
  8417 00003AA1 D1E3                     shl bx, 1
  8418 00003AA3 89873873                 mov [GData+bx], ax
  8419                                  
  8420                                  ;-961       else if (istoken('{' )) { i=0;
  8421                                  
  8422 00003AA7 E96200                   jmp .doglob466
  8423                                  .doglob465:
  8424 00003AAA 6A7B                     push 123
  8425 00003AAC E85FCD                   call istoken
  8426 00003AAF 83C402                   add  sp, 2
  8427 00003AB2 08C0                     or  al, al
  8428 00003AB4 0F844B00                 je .doglob467
  8429 00003AB8 B80000                   mov ax, 0
  8430 00003ABB 8946FE                   mov [bp-2], ax
  8431                                  
  8432                                  ;-962         do { if(i) prc(',');
  8433                                  
  8434                                  .doglob468:
  8435 00003ABE 8B46FE                   mov ax, [bp-2]
  8436 00003AC1 08C0                     or  al, al
  8437 00003AC3 0F840800                 je .doglob469
  8438 00003AC7 6A2C                     push 44
  8439 00003AC9 E8BDC8                   call prc
  8440 00003ACC 83C402                   add  sp, 2
  8441                                  
  8442                                  ;-963           expect(T_CONST); prunsign1(lexval); i=1; }
  8443                                  
  8444                                  .doglob469:
  8445 00003ACF 680101                   push 257
  8446 00003AD2 E85BCD                   call expect
  8447 00003AD5 83C402                   add  sp, 2
  8448 00003AD8 FF36[2C00]               push word [lexval]
  8449 00003ADC E866CA                   call prunsign1
  8450 00003ADF 83C402                   add  sp, 2
  8451 00003AE2 B80100                   mov ax, 1
  8452 00003AE5 8946FE                   mov [bp-2], ax
  8453                                  
  8454                                  ;-964         while (istoken(',')); expect('}'); }
  8455                                  
  8456 00003AE8 6A2C                     push 44
  8457 00003AEA E821CD                   call istoken
  8458 00003AED 83C402                   add  sp, 2
  8459 00003AF0 08C0                     or  al, al
  8460 00003AF2 0F840200                 je .doglob470
  8461 00003AF6 EBC6                     jmp .doglob468
  8462                                  .doglob470:
  8463 00003AF8 6A7D                     push 125
  8464 00003AFA E833CD                   call expect
  8465 00003AFD 83C402                   add  sp, 2
  8466                                  
  8467                                  ;-965       else error1("String or number array expected");
  8468                                  
  8469 00003B00 E90900                   jmp .doglob471
  8470                                  .doglob467:
  8471 00003B03 68[D33C]                 push doglob_13
  8472 00003B06 E8D7CA                   call error1
  8473 00003B09 83C402                   add  sp, 2
  8474                                  
  8475                                  ;-966       };
  8476                                  
  8477                                  .doglob471:
  8478                                  .doglob466:
  8479                                  .doglob463:
  8480                                  
  8481                                  ;-967   }else { //expect('=');
  8482                                  
  8483 00003B0C E99E00                   jmp .doglob472
  8484                                  .doglob456:
  8485                                  
  8486                                  ;-968     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8487                                  
  8488 00003B0F 68[F33C]                 push doglob_14
  8489 00003B12 E8CDC8                   call prs
  8490 00003B15 83C402                   add  sp, 2
  8491 00003B18 8D06BB69                 lea  ax, [symbol]
  8492 00003B1C 50                       push ax
  8493 00003B1D E8C2C8                   call prs
  8494 00003B20 83C402                   add  sp, 2
  8495 00003B23 A0[3000]                 mov al, [istype]
  8496 00003B26 3C2A                     cmp al, 42
  8497 00003B28 0F850C00                 jne .doglob473
  8498 00003B2C 68[F63C]                 push doglob_15
  8499 00003B2F E8B0C8                   call prs
  8500 00003B32 83C402                   add  sp, 2
  8501                                  
  8502                                  ;-969     else {
  8503                                  
  8504 00003B35 E93300                   jmp .doglob474
  8505                                  .doglob473:
  8506                                  
  8507                                  ;-970       if      (iswidth==1) prs(" db ");
  8508                                  
  8509 00003B38 A0[3600]                 mov al, [iswidth]
  8510 00003B3B 3C01                     cmp al, 1
  8511 00003B3D 0F850C00                 jne .doglob475
  8512 00003B41 68[FB3C]                 push doglob_16
  8513 00003B44 E89BC8                   call prs
  8514 00003B47 83C402                   add  sp, 2
  8515                                  
  8516                                  ;-971       else if (iswidth==2) prs(" dw ");
  8517                                  
  8518 00003B4A E91E00                   jmp .doglob476
  8519                                  .doglob475:
  8520 00003B4D A0[3600]                 mov al, [iswidth]
  8521 00003B50 3C02                     cmp al, 2
  8522 00003B52 0F850C00                 jne .doglob477
  8523 00003B56 68[003D]                 push doglob_17
  8524 00003B59 E886C8                   call prs
  8525 00003B5C 83C402                   add  sp, 2
  8526                                  
  8527                                  ;-972       else                 prs(" dd ");
  8528                                  
  8529 00003B5F E90900                   jmp .doglob478
  8530                                  .doglob477:
  8531 00003B62 68[053D]                 push doglob_18
  8532 00003B65 E87AC8                   call prs
  8533 00003B68 83C402                   add  sp, 2
  8534                                  
  8535                                  ;-973     }
  8536                                  
  8537                                  .doglob478:
  8538                                  .doglob476:
  8539                                  
  8540                                  ;-974     if(istoken('-')) prc('-');
  8541                                  
  8542                                  .doglob474:
  8543 00003B6B 6A2D                     push 45
  8544 00003B6D E89ECC                   call istoken
  8545 00003B70 83C402                   add  sp, 2
  8546 00003B73 08C0                     or  al, al
  8547 00003B75 0F840800                 je .doglob479
  8548 00003B79 6A2D                     push 45
  8549 00003B7B E80BC8                   call prc
  8550 00003B7E 83C402                   add  sp, 2
  8551                                  
  8552                                  ;-975     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8553                                  
  8554                                  .doglob479:
  8555 00003B81 6A3D                     push 61
  8556 00003B83 E888CC                   call istoken
  8557 00003B86 83C402                   add  sp, 2
  8558 00003B89 08C0                     or  al, al
  8559 00003B8B 0F841600                 je .doglob480
  8560 00003B8F 680101                   push 257
  8561 00003B92 E89BCC                   call expect
  8562 00003B95 83C402                   add  sp, 2
  8563 00003B98 FF36[2C00]               push word [lexval]
  8564 00003B9C E8A6C9                   call prunsign1
  8565 00003B9F 83C402                   add  sp, 2
  8566                                  
  8567                                  ;-976     else prunsign1(0); }
  8568                                  
  8569 00003BA2 E90800                   jmp .doglob481
  8570                                  .doglob480:
  8571 00003BA5 6A00                     push 0
  8572 00003BA7 E89BC9                   call prunsign1
  8573 00003BAA 83C402                   add  sp, 2
  8574                                  .doglob481:
  8575                                  
  8576                                  ;-977   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8577                                  
  8578                                  .doglob472:
  8579 00003BAD A0[3300]                 mov al, [issign]
  8580 00003BB0 8B1E[3900]               mov bx, [GTop]
  8581 00003BB4 8887306C                 mov [GSign+bx], al
  8582 00003BB8 A0[3600]                 mov al, [iswidth]
  8583 00003BBB 8B1E[3900]               mov bx, [GTop]
  8584 00003BBF 88875C6D                 mov [GWidth+bx], al
  8585 00003BC3 A0[3000]                 mov al, [istype]
  8586 00003BC6 8B1E[3900]               mov bx, [GTop]
  8587 00003BCA 8887046B                 mov [GType+bx], al
  8588                                  
  8589                                  ;-978   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  8590                                  
  8591 00003BCE A1[4900]                 mov ax, [lineno]
  8592 00003BD1 83E801                   sub ax, 1
  8593 00003BD4 8B1E[3900]               mov bx, [GTop]
  8594 00003BD8 D1E3                     shl bx, 1
  8595 00003BDA 8987886E                 mov [GAdr+bx], ax
  8596 00003BDE B80000                   mov ax, 0
  8597 00003BE1 8B1E[3900]               mov bx, [GTop]
  8598 00003BE5 D1E3                     shl bx, 1
  8599 00003BE7 8987E070                 mov [GUsed+bx], ax
  8600                                  
  8601                                  ;-979   pt=adrofname(GTop);
  8602                                  
  8603 00003BEB FF36[3900]               push word [GTop]
  8604 00003BEF E8A7CD                   call adrofname
  8605 00003BF2 83C402                   add  sp, 2
  8606 00003BF5 A3[4B00]                 mov word [pt], ax
  8607                                  
  8608                                  ;-980   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8609                                  
  8610 00003BF8 8B46FA                   mov ax, [bp-6]
  8611 00003BFB 08C0                     or  al, al
  8612 00003BFD 0F841200                 je .doglob482
  8613 00003C01 8D06AEDA                 lea  ax, [doglobName]
  8614 00003C05 50                       push ax
  8615 00003C06 FF36[4B00]               push word [pt]
  8616 00003C0A E81FC6                   call strcpy
  8617 00003C0D 83C404                   add  sp, 4
  8618 00003C10 E90F00                   jmp .doglob483
  8619                                  .doglob482:
  8620 00003C13 8D06BB69                 lea  ax, [symbol]
  8621 00003C17 50                       push ax
  8622 00003C18 FF36[4B00]               push word [pt]
  8623 00003C1C E80DC6                   call strcpy
  8624 00003C1F 83C404                   add  sp, 4
  8625                                  
  8626                                  ;-981   GTop++; expect(';'); }
  8627                                  
  8628                                  .doglob483:
  8629 00003C22 FF06[3900]               inc  word[GTop]
  8630 00003C26 6A3B                     push 59
  8631 00003C28 E805CC                   call expect
  8632 00003C2B 83C402                   add  sp, 2
  8633                                  
  8634                                  ;-982 
  8635                                  
  8636                                  
  8637                                  ;-983 int end1(int n) {
  8638 00003C2E C9                       LEAVE
  8639 00003C2F C3                       ret
  8640 00003C30 476C6F62616C207461-     doglob_0 db "Global table full",0
  8641 00003C39 626C652066756C6C00 
  8642 00003C42 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8643 00003C4B 732076617220747970-
  8644 00003C54 6500               
  8645 00003C56 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8646 00003C5F 616C72656164792064-
  8647 00003C68 6566696E656400     
  8648 00003C6F 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8649 00003C78 202E6273735C6E6162-
  8650 00003C81 736F6C7574652000   
  8651 00003C89 5C6E00                  doglob_4 db "\n",0
  8652 00003C8C 20726573622000          doglob_5 db " resb ",0
  8653 00003C93 20726573772000          doglob_6 db " resw ",0
  8654 00003C9A 20726573642000          doglob_7 db " resd ",0
  8655 00003CA1 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8656 00003CAA 202E7465787400     
  8657 00003CB1 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8658 00003CBA 417272617920616C6C-
  8659 00003CC3 6F77656400         
  8660 00003CC8 5C6E00                  doglob_10 db "\n",0
  8661 00003CCB 2064622000              doglob_11 db " db ",0
  8662 00003CD0 2C3000                  doglob_12 db ",0",0
  8663 00003CD3 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8664 00003CDC 206E756D6265722061-
  8665 00003CE5 727261792065787065-
  8666 00003CEE 6374656400         
  8667 00003CF3 5C6E00                  doglob_14 db "\n",0
  8668 00003CF6 2064772000              doglob_15 db " dw ",0
  8669 00003CFB 2064622000              doglob_16 db " db ",0
  8670 00003D00 2064772000              doglob_17 db " dw ",0
  8671 00003D05 2064642000              doglob_18 db " dd ",0
  8672                                  ENDP
  8673                                  
  8674                                  end1: PROC
  8675                                  
  8676                                  ;-984     fcloseR(fdin);
  8677                                  ;
  8678 00003D0A C8000000                 ENTER  0,0
  8679 00003D0E FF36[1A00]               push word [fdin]
  8680 00003D12 E8C4C3                   call fcloseR
  8681 00003D15 83C402                   add  sp, 2
  8682                                  
  8683                                  ;-985     fcloseR(fdout);
  8684                                  
  8685 00003D18 FF36[1C00]               push word [fdout]
  8686 00003D1C E8BAC3                   call fcloseR
  8687 00003D1F 83C402                   add  sp, 2
  8688                                  
  8689                                  ;-986     exitR(n);
  8690                                  
  8691 00003D22 FF7604                   push word [bp+4]
  8692 00003D25 E8C0C3                   call exitR
  8693 00003D28 83C402                   add  sp, 2
  8694                                  
  8695                                  ;-987 }
  8696                                  
  8697                                  
  8698                                  ;-988 
  8699                                  
  8700                                  
  8701                                  ;-989 unsigned int MAXUI=65535;
  8702 00003D2B C9                       LEAVE
  8703 00003D2C C3                       ret
  8704                                  ENDP
  8705 00003D2D FFFF                    MAXUI dw 65535
  8706                                  
  8707                                  ;-990 int epilog() {
  8708                                  
  8709                                  
  8710                                  epilog: PROC
  8711                                  
  8712                                  ;-991     unsigned int i;
  8713                                  
  8714                                  
  8715                                  ;-992     prs("\n;Input: "); prs(&namein);
  8716                                  ;
  8717 00003D2F C8020000                 ENTER  2,0
  8718 00003D33 68[A33E]                 push epilog_0
  8719 00003D36 E8A9C6                   call prs
  8720 00003D39 83C402                   add  sp, 2
  8721 00003D3C 8D067E6A                 lea  ax, [namein]
  8722 00003D40 50                       push ax
  8723 00003D41 E89EC6                   call prs
  8724 00003D44 83C402                   add  sp, 2
  8725                                  
  8726                                  ;-993     prs(", List: ");   prs(&namelst);
  8727                                  
  8728 00003D47 68[AE3E]                 push epilog_1
  8729 00003D4A E895C6                   call prs
  8730 00003D4D 83C402                   add  sp, 2
  8731 00003D50 8D06C16A                 lea  ax, [namelst]
  8732 00003D54 50                       push ax
  8733 00003D55 E88AC6                   call prs
  8734 00003D58 83C402                   add  sp, 2
  8735                                  
  8736                                  ;-994     prs(",  Lines:"); printint51(lineno);
  8737                                  
  8738 00003D5B 68[B73E]                 push epilog_2
  8739 00003D5E E881C6                   call prs
  8740 00003D61 83C402                   add  sp, 2
  8741 00003D64 FF36[4900]               push word [lineno]
  8742 00003D68 E81EC8                   call printint51
  8743 00003D6B 83C402                   add  sp, 2
  8744                                  
  8745                                  ;-995     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  8746                                  
  8747 00003D6E 68[C13E]                 push epilog_3
  8748 00003D71 E86EC6                   call prs
  8749 00003D74 83C402                   add  sp, 2
  8750 00003D77 FF0E[3900]               dec  word[GTop]
  8751 00003D7B FF36[3900]               push word [GTop]
  8752 00003D7F E807C8                   call printint51
  8753 00003D82 83C402                   add  sp, 2
  8754                                  
  8755                                  ;-996     prs(" max.:"); printint51(LSTART);
  8756                                  
  8757 00003D85 68[D53E]                 push epilog_4
  8758 00003D88 E857C6                   call prs
  8759 00003D8B 83C402                   add  sp, 2
  8760 00003D8E 68C800                   push 200
  8761 00003D91 E8F5C7                   call printint51
  8762 00003D94 83C402                   add  sp, 2
  8763                                  
  8764                                  ;-997     prs("\n;Functions      :"); printint51(FTop);
  8765                                  
  8766 00003D97 68[DC3E]                 push epilog_5
  8767 00003D9A E845C6                   call prs
  8768 00003D9D 83C402                   add  sp, 2
  8769 00003DA0 FF36[3D00]               push word [FTop]
  8770 00003DA4 E8E2C7                   call printint51
  8771 00003DA7 83C402                   add  sp, 2
  8772                                  
  8773                                  ;-998     prs(" max.:"); printint51(FUNCMAX);
  8774                                  
  8775 00003DAA 68[F03E]                 push epilog_6
  8776 00003DAD E832C6                   call prs
  8777 00003DB0 83C402                   add  sp, 2
  8778 00003DB3 682C01                   push 300
  8779 00003DB6 E8D0C7                   call printint51
  8780 00003DB9 83C402                   add  sp, 2
  8781                                  
  8782                                  ;-999     prs("\n;Calls          :"); printint51(CTop);
  8783                                  
  8784 00003DBC 68[F73E]                 push epilog_7
  8785 00003DBF E820C6                   call prs
  8786 00003DC2 83C402                   add  sp, 2
  8787 00003DC5 FF36[4300]               push word [CTop]
  8788 00003DC9 E8BDC7                   call printint51
  8789 00003DCC 83C402                   add  sp, 2
  8790                                  
  8791                                  ;-1000     prs(" max.:"); printint51(CALLMAX);
  8792                                  
  8793 00003DCF 68[0B3F]                 push epilog_8
  8794 00003DD2 E80DC6                   call prs
  8795 00003DD5 83C402                   add  sp, 2
  8796 00003DD8 68DC05                   push 1500
  8797 00003DDB E8ABC7                   call printint51
  8798 00003DDE 83C402                   add  sp, 2
  8799                                  
  8800                                  ;-1001     i = CNamePtr - &CNameField;
  8801                                  
  8802 00003DE1 A1[3F00]                 mov ax, [CNamePtr]
  8803 00003DE4 2D80B2                   sub ax, CNameField
  8804 00003DE7 8946FE                   mov [bp-2], ax
  8805                                  
  8806                                  ;-1002     prs("\n;NameField      :"); printint51(i);
  8807                                  
  8808 00003DEA 68[123F]                 push epilog_9
  8809 00003DED E8F2C5                   call prs
  8810 00003DF0 83C402                   add  sp, 2
  8811 00003DF3 FF76FE                   push word [bp-2]
  8812 00003DF6 E890C7                   call printint51
  8813 00003DF9 83C402                   add  sp, 2
  8814                                  
  8815                                  ;-1003     prs(" max.:"); printint51(CNAMEMAX);
  8816                                  
  8817 00003DFC 68[263F]                 push epilog_10
  8818 00003DFF E8E0C5                   call prs
  8819 00003E02 83C402                   add  sp, 2
  8820 00003E05 681027                   push 10000
  8821 00003E08 E87EC7                   call printint51
  8822 00003E0B 83C402                   add  sp, 2
  8823                                  
  8824                                  ;-1004     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
  8825                                  
  8826 00003E0E 68[2D3F]                 push epilog_11
  8827 00003E11 E8CEC5                   call prs
  8828 00003E14 83C402                   add  sp, 2
  8829 00003E17 8D067869                 lea  ax, [coname]
  8830 00003E1B 50                       push ax
  8831 00003E1C E8C3C5                   call prs
  8832 00003E1F 83C402                   add  sp, 2
  8833 00003E22 68[3B3F]                 push epilog_12
  8834 00003E25 E8BAC5                   call prs
  8835 00003E28 83C402                   add  sp, 2
  8836 00003E2B FF36[1400]               push word [maxco]
  8837 00003E2F E857C7                   call printint51
  8838 00003E32 83C402                   add  sp, 2
  8839                                  
  8840                                  ;-1005     prs(" max.:"); printint51(COMAX);
  8841                                  
  8842 00003E35 68[3F3F]                 push epilog_13
  8843 00003E38 E8A7C5                   call prs
  8844 00003E3B 83C402                   add  sp, 2
  8845 00003E3E 68D007                   push 2000
  8846 00003E41 E845C7                   call printint51
  8847 00003E44 83C402                   add  sp, 2
  8848                                  
  8849                                  ;-1006     i=COMAX; i=i-maxco;
  8850                                  
  8851 00003E47 B8D007                   mov ax, 2000
  8852 00003E4A 8946FE                   mov [bp-2], ax
  8853 00003E4D 8B46FE                   mov ax, [bp-2]
  8854 00003E50 2B06[1400]               sub ax, [maxco]
  8855 00003E54 8946FE                   mov [bp-2], ax
  8856                                  
  8857                                  ;-1007     if (i <= 1000)prs(" *** Warning *** constant area too small");
  8858                                  
  8859 00003E57 8B46FE                   mov ax, [bp-2]
  8860 00003E5A 3DE803                   cmp ax, 1000
  8861 00003E5D 0F870900                 ja  .epilog484
  8862 00003E61 68[463F]                 push epilog_14
  8863 00003E64 E87BC5                   call prs
  8864 00003E67 83C402                   add  sp, 2
  8865                                  
  8866                                  ;-1008     prs(", stacksize: ");
  8867                                  
  8868                                  .epilog484:
  8869 00003E6A 68[6F3F]                 push epilog_15
  8870 00003E6D E872C5                   call prs
  8871 00003E70 83C402                   add  sp, 2
  8872                                  
  8873                                  ;-1009     i=MAXUI-orgData; printint51(i);
  8874                                  
  8875 00003E73 A1[2D3D]                 mov ax, [MAXUI]
  8876 00003E76 2B06[1200]               sub ax, [orgData]
  8877 00003E7A 8946FE                   mov [bp-2], ax
  8878 00003E7D FF76FE                   push word [bp-2]
  8879 00003E80 E806C7                   call printint51
  8880 00003E83 83C402                   add  sp, 2
  8881                                  
  8882                                  ;-1010     if (i <= 1000) prs(" *** Warning *** Stack too small");
  8883                                  
  8884 00003E86 8B46FE                   mov ax, [bp-2]
  8885 00003E89 3DE803                   cmp ax, 1000
  8886 00003E8C 0F870900                 ja  .epilog485
  8887 00003E90 68[7D3F]                 push epilog_16
  8888 00003E93 E84CC5                   call prs
  8889 00003E96 83C402                   add  sp, 2
  8890                                  
  8891                                  ;-1011   end1(0);}
  8892                                  
  8893                                  .epilog485:
  8894 00003E99 6A00                     push 0
  8895 00003E9B E86CFE                   call end1
  8896 00003E9E 83C402                   add  sp, 2
  8897                                  
  8898                                  ;-1012 
  8899                                  
  8900                                  
  8901                                  ;-1013 int dodefine() {
  8902 00003EA1 C9                       LEAVE
  8903 00003EA2 C3                       ret
  8904 00003EA3 5C6E3B496E7075743A-     epilog_0 db "\n;Input: ",0
  8905 00003EAC 2000               
  8906 00003EAE 2C204C6973743A2000      epilog_1 db ", List: ",0
  8907 00003EB7 2C20204C696E65733A-     epilog_2 db ",  Lines:",0
  8908 00003EC0 00                 
  8909 00003EC1 5C6E3B476C6F622E20-     epilog_3 db "\n;Glob. variables:",0
  8910 00003ECA 7661726961626C6573-
  8911 00003ED3 3A00               
  8912 00003ED5 206D61782E3A00          epilog_4 db " max.:",0
  8913 00003EDC 5C6E3B46756E637469-     epilog_5 db "\n;Functions      :",0
  8914 00003EE5 6F6E73202020202020-
  8915 00003EEE 3A00               
  8916 00003EF0 206D61782E3A00          epilog_6 db " max.:",0
  8917 00003EF7 5C6E3B43616C6C7320-     epilog_7 db "\n;Calls          :",0
  8918 00003F00 202020202020202020-
  8919 00003F09 3A00               
  8920 00003F0B 206D61782E3A00          epilog_8 db " max.:",0
  8921 00003F12 5C6E3B4E616D654669-     epilog_9 db "\n;NameField      :",0
  8922 00003F1B 656C64202020202020-
  8923 00003F24 3A00               
  8924 00003F26 206D61782E3A00          epilog_10 db " max.:",0
  8925 00003F2D 5C6E3B436F6E737420-     epilog_11 db "\n;Const in '",0
  8926 00003F36 696E202700         
  8927 00003F3B 27203A00                epilog_12 db "' :",0
  8928 00003F3F 206D61782E3A00          epilog_13 db " max.:",0
  8929 00003F46 202A2A2A205761726E-     epilog_14 db " *** Warning *** constant area too small",0
  8930 00003F4F 696E67202A2A2A2063-
  8931 00003F58 6F6E7374616E742061-
  8932 00003F61 72656120746F6F2073-
  8933 00003F6A 6D616C6C00         
  8934 00003F6F 2C20737461636B7369-     epilog_15 db ", stacksize: ",0
  8935 00003F78 7A653A2000         
  8936 00003F7D 202A2A2A205761726E-     epilog_16 db " *** Warning *** Stack too small",0
  8937 00003F86 696E67202A2A2A2053-
  8938 00003F8F 7461636B20746F6F20-
  8939 00003F98 736D616C6C00       
  8940                                  ENDP
  8941                                  
  8942                                  dodefine: PROC
  8943                                  
  8944                                  ;-1014     int i; int j; int fdtemp;
  8945                                  
  8946                                  
  8947                                  ;-1015     if (eqstr(symbol, "ORGDATA")) {
  8948                                  ;
  8949 00003F9E C8060000                 ENTER  6,0
  8950 00003FA2 68[8840]                 push dodefine_0
  8951 00003FA5 8D06BB69                 lea  ax, [symbol]
  8952 00003FA9 50                       push ax
  8953 00003FAA E8B5C2                   call eqstr
  8954 00003FAD 83C404                   add  sp, 4
  8955 00003FB0 08C0                     or  al, al
  8956 00003FB2 0F841500                 je .dodefine486
  8957                                  
  8958                                  ;-1016         token=getlex();
  8959                                  
  8960 00003FB6 E883ED                   call getlex
  8961 00003FB9 A3[1E00]                 mov word [token], ax
  8962                                  
  8963                                  ;-1017         ORGDATAORIG=lexval;
  8964                                  
  8965 00003FBC A1[2C00]                 mov ax, [lexval]
  8966 00003FBF A3[1000]                 mov word [ORGDATAORIG], ax
  8967                                  
  8968                                  ;-1018         orgData=lexval;
  8969                                  
  8970 00003FC2 A1[2C00]                 mov ax, [lexval]
  8971 00003FC5 A3[1200]                 mov word [orgData], ax
  8972                                  
  8973                                  ;-1019         return;
  8974                                  
  8975 00003FC8 E9BB00                   jmp .retndodefine
  8976                                  
  8977                                  ;-1020     }
  8978                                  
  8979                                  
  8980                                  ;-1021     expect(T_NAME);
  8981                                  
  8982                                  .dodefine486:
  8983 00003FCB 680001                   push 256
  8984 00003FCE E85FC8                   call expect
  8985 00003FD1 83C402                   add  sp, 2
  8986                                  
  8987                                  ;-1022     if (token==T_CONST) {
  8988                                  
  8989 00003FD4 A1[1E00]                 mov ax, [token]
  8990 00003FD7 3D0101                   cmp ax, 257
  8991 00003FDA 0F85A800                 jne .dodefine487
  8992                                  
  8993                                  ;-1023         if (GTop >= LSTART) error1("global table (define) full");
  8994                                  
  8995 00003FDE A1[3900]                 mov ax, [GTop]
  8996 00003FE1 3DC800                   cmp ax, 200 ;unsigned : 1
  8997 00003FE4 0F8C0900                 jl  .dodefine488
  8998 00003FE8 68[9040]                 push dodefine_1
  8999 00003FEB E8F2C5                   call error1
  9000 00003FEE 83C402                   add  sp, 2
  9001                                  
  9002                                  ;-1024         i=strlen(symbol);
  9003                                  
  9004                                  .dodefine488:
  9005 00003FF1 8D06BB69                 lea  ax, [symbol]
  9006 00003FF5 50                       push ax
  9007 00003FF6 E80BC2                   call strlen
  9008 00003FF9 83C402                   add  sp, 2
  9009 00003FFC 8946FE                   mov [bp-2], ax
  9010                                  
  9011                                  ;-1025         if (i>15) error1("Define name longer 15 char");
  9012                                  
  9013 00003FFF 8B46FE                   mov ax, [bp-2]
  9014 00004002 83F80F                   cmp ax, 15
  9015 00004005 0F8E0900                 jle .dodefine489
  9016 00004009 68[AB40]                 push dodefine_2
  9017 0000400C E8D1C5                   call error1
  9018 0000400F 83C402                   add  sp, 2
  9019                                  
  9020                                  ;-1026         GSign [GTop]='U';
  9021                                  
  9022                                  .dodefine489:
  9023 00004012 B85500                   mov ax, 85
  9024 00004015 8B1E[3900]               mov bx, [GTop]
  9025 00004019 8887306C                 mov [GSign+bx], al
  9026                                  
  9027                                  ;-1027         GWidth[GTop]=1;
  9028                                  
  9029 0000401D B80100                   mov ax, 1
  9030 00004020 8B1E[3900]               mov bx, [GTop]
  9031 00004024 88875C6D                 mov [GWidth+bx], al
  9032                                  
  9033                                  ;-1028         GType [GTop]='#';
  9034                                  
  9035 00004028 B82300                   mov ax, 35
  9036 0000402B 8B1E[3900]               mov bx, [GTop]
  9037 0000402F 8887046B                 mov [GType+bx], al
  9038                                  
  9039                                  ;-1029         GAdr [GTop]=lineno-1;
  9040                                  
  9041 00004033 A1[4900]                 mov ax, [lineno]
  9042 00004036 83E801                   sub ax, 1
  9043 00004039 8B1E[3900]               mov bx, [GTop]
  9044 0000403D D1E3                     shl bx, 1
  9045 0000403F 8987886E                 mov [GAdr+bx], ax
  9046                                  
  9047                                  ;-1030         GUsed [GTop]=0;
  9048                                  
  9049 00004043 B80000                   mov ax, 0
  9050 00004046 8B1E[3900]               mov bx, [GTop]
  9051 0000404A D1E3                     shl bx, 1
  9052 0000404C 8987E070                 mov [GUsed+bx], ax
  9053                                  
  9054                                  ;-1031         pt=adrofname(GTop);
  9055                                  
  9056 00004050 FF36[3900]               push word [GTop]
  9057 00004054 E842C9                   call adrofname
  9058 00004057 83C402                   add  sp, 2
  9059 0000405A A3[4B00]                 mov word [pt], ax
  9060                                  
  9061                                  ;-1032         strcpy(pt, symbol);
  9062                                  
  9063 0000405D 8D06BB69                 lea  ax, [symbol]
  9064 00004061 50                       push ax
  9065 00004062 FF36[4B00]               push word [pt]
  9066 00004066 E8C3C1                   call strcpy
  9067 00004069 83C404                   add  sp, 4
  9068                                  
  9069                                  ;-1033         GData[GTop]=lexval;
  9070                                  
  9071 0000406C A1[2C00]                 mov ax, [lexval]
  9072 0000406F 8B1E[3900]               mov bx, [GTop]
  9073 00004073 D1E3                     shl bx, 1
  9074 00004075 89873873                 mov [GData+bx], ax
  9075                                  
  9076                                  ;-1034         expect(T_CONST);
  9077                                  
  9078 00004079 680101                   push 257
  9079 0000407C E8B1C7                   call expect
  9080 0000407F 83C402                   add  sp, 2
  9081                                  
  9082                                  ;-1035         GTop++;
  9083                                  
  9084 00004082 FF06[3900]               inc  word[GTop]
  9085                                  
  9086                                  ;-1036     }
  9087                                  
  9088                                  
  9089                                  ;-1037 }
  9090                                  
  9091                                  .dodefine487:
  9092                                  
  9093                                  ;-1038 
  9094                                  
  9095                                  
  9096                                  ;-1039 int parse() {
  9097                                  
  9098 00004086 C9                       .retndodefine: LEAVE
  9099 00004087 C3                       ret
  9100 00004088 4F52474441544100        dodefine_0 db "ORGDATA",0
  9101 00004090 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  9102 00004099 626C65202864656669-
  9103 000040A2 6E65292066756C6C00 
  9104 000040AB 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  9105 000040B4 6D65206C6F6E676572-
  9106 000040BD 203135206368617200 
  9107                                  ENDP
  9108                                  
  9109                                  parse: PROC
  9110                                  
  9111                                  ;-1040     CNamePtr = &CNameField;
  9112                                  
  9113 000040C6 B880B2                   mov ax, CNameField
  9114 000040C9 A3[3F00]                 mov word [CNamePtr], ax
  9115                                  
  9116                                  ;-1041     token=getlex();
  9117                                  
  9118 000040CC E86DEC                   call getlex
  9119 000040CF A3[1E00]                 mov word [token], ax
  9120                                  
  9121                                  ;-1042     do {
  9122                                  
  9123                                  .parse490:
  9124                                  
  9125                                  ;-1043         if (token <= 0) return 1;
  9126                                  
  9127 000040D2 A1[1E00]                 mov ax, [token]
  9128 000040D5 83F800                   cmp ax, 0
  9129 000040D8 0F8F0600                 jg  .parse491
  9130 000040DC B80100                   mov ax, 1
  9131 000040DF E95000                   jmp .retnparse
  9132                                  
  9133                                  ;-1044         if (istoken('#')) {
  9134                                  
  9135                                  .parse491:
  9136 000040E2 6A23                     push 35
  9137 000040E4 E827C7                   call istoken
  9138 000040E7 83C402                   add  sp, 2
  9139 000040EA 08C0                     or  al, al
  9140 000040EC 0F842100                 je .parse492
  9141                                  
  9142                                  ;-1045              if (istoken(T_DEFINE))  dodefine();
  9143                                  
  9144 000040F0 68FF01                   push 511
  9145 000040F3 E818C7                   call istoken
  9146 000040F6 83C402                   add  sp, 2
  9147 000040F9 08C0                     or  al, al
  9148 000040FB 0F840600                 je .parse493
  9149 000040FF E89CFE                   call dodefine
  9150                                  
  9151                                  ;-1046              else error1("define expected");
  9152                                  
  9153 00004102 E90900                   jmp .parse494
  9154                                  .parse493:
  9155 00004105 68[3341]                 push parse_0
  9156 00004108 E8D5C4                   call error1
  9157 0000410B 83C402                   add  sp, 2
  9158                                  
  9159                                  ;-1047         }
  9160                                  
  9161                                  .parse494:
  9162                                  
  9163                                  ;-1048     else{
  9164                                  
  9165 0000410E E91600                   jmp .parse495
  9166                                  .parse492:
  9167                                  
  9168                                  ;-1049         typeName();
  9169                                  
  9170 00004111 E81FCA                   call typeName
  9171                                  
  9172                                  ;-1050         if (token=='(') dofunc();
  9173                                  
  9174 00004114 A1[1E00]                 mov ax, [token]
  9175 00004117 83F828                   cmp ax, 40
  9176 0000411A 0F850600                 jne .parse496
  9177 0000411E E821F5                   call dofunc
  9178                                  
  9179                                  ;-1051         else doglob(); }
  9180                                  
  9181 00004121 E90300                   jmp .parse497
  9182                                  .parse496:
  9183 00004124 E8B4F7                   call doglob
  9184                                  .parse497:
  9185                                  
  9186                                  ;-1052     } while(1);
  9187                                  
  9188                                  .parse495:
  9189 00004127 B80100                   mov ax, 1
  9190 0000412A 08C0                     or  al, al
  9191 0000412C 0F840200                 je .parse498
  9192 00004130 EBA0                     jmp .parse490
  9193                                  .parse498:
  9194                                  
  9195                                  ;-1053 }
  9196                                  
  9197                                  
  9198                                  ;-1054 
  9199                                  
  9200                                  
  9201                                  ;-1055 int getfirstchar() {
  9202                                  
  9203                                   .retnparse:
  9204 00004132 C3                       ret
  9205 00004133 646566696E65206578-     parse_0 db "define expected",0
  9206 0000413C 70656374656400     
  9207                                  ENDP
  9208                                  
  9209                                  getfirstchar: PROC
  9210                                  
  9211                                  ;-1056     fgetsp=&fgetsdest;
  9212                                  
  9213 00004143 B8A0D9                   mov ax, fgetsdest
  9214 00004146 A3[4500]                 mov word [fgetsp], ax
  9215                                  
  9216                                  ;-1057     *fgetsp=0;
  9217                                  
  9218 00004149 B80000                   mov ax, 0
  9219 0000414C 8B1E[4500]               mov  bx, [fgetsp]
  9220 00004150 8807                     mov  [bx], al
  9221                                  
  9222                                  ;-1058     thechar=fgets1();
  9223                                  
  9224 00004152 E849C6                   call fgets1
  9225 00004155 A2[2300]                 mov byte [thechar], al
  9226                                  
  9227                                  ;-1059     }
  9228                                  
  9229                                  
  9230                                  ;-1060 
  9231                                  
  9232                                  
  9233                                  ;-1061 char *arglen=0x80; char *argv=0x82;
  9234                                  
  9235 00004158 C3                       ret
  9236                                  ENDP
  9237 00004159 8000                    arglen dw 128
  9238 0000415B 8200                    argv dw 130
  9239                                  
  9240                                  ;-1062 int getarg() {
  9241                                  
  9242                                  
  9243                                  getarg: PROC
  9244                                  
  9245                                  ;-1063     int arglen1; int i; char *c;
  9246                                  
  9247                                  
  9248                                  ;-1064     arglen1=*arglen;
  9249                                  ;
  9250 0000415D C8060000                 ENTER  6,0
  9251 00004161 8B1E[5941]               mov bx, [arglen]
  9252 00004165 8A07                     mov al, [bx]
  9253 00004167 B400                     mov ah, 0
  9254 00004169 8946FE                   mov [bp-2], ax
  9255                                  
  9256                                  ;-1065     if (arglen1 == 0) {
  9257                                  
  9258 0000416C 8B46FE                   mov ax, [bp-2]
  9259 0000416F 83F800                   cmp ax, 0
  9260 00004172 0F851C00                 jne .getarg499
  9261                                  
  9262                                  ;-1066         cputs(Version1);
  9263                                  
  9264 00004176 8D06[0300]               lea  ax, [Version1]
  9265 0000417A 50                       push ax
  9266 0000417B E8F8BE                   call cputs
  9267 0000417E 83C402                   add  sp, 2
  9268                                  
  9269                                  ;-1067         cputs(" Usage: A.COM in_file[.C]: ");
  9270                                  
  9271 00004181 68[C042]                 push getarg_0
  9272 00004184 E8EFBE                   call cputs
  9273 00004187 83C402                   add  sp, 2
  9274                                  
  9275                                  ;-1068         exitR(3);
  9276                                  
  9277 0000418A 6A03                     push 3
  9278 0000418C E859BF                   call exitR
  9279 0000418F 83C402                   add  sp, 2
  9280                                  
  9281                                  ;-1069         }
  9282                                  
  9283                                  
  9284                                  ;-1070     i=arglen1+129;
  9285                                  
  9286                                  .getarg499:
  9287 00004192 8B46FE                   mov ax, [bp-2]
  9288 00004195 058100                   add ax, 129
  9289 00004198 8946FC                   mov [bp-4], ax
  9290                                  
  9291                                  ;-1071     *i=0;
  9292                                  
  9293 0000419B B80000                   mov ax, 0
  9294 0000419E 8B5EFC                   mov  bx, [bp-4]
  9295 000041A1 8907                     mov  [bx], ax
  9296                                  
  9297                                  ;-1072     arglen1--;
  9298                                  
  9299 000041A3 FF4EFE                   dec  word[bp-2]
  9300                                  
  9301                                  ;-1073     toupper(argv);
  9302                                  
  9303 000041A6 FF36[5B41]               push word [argv]
  9304 000041AA E826C1                   call toupper
  9305 000041AD 83C402                   add  sp, 2
  9306                                  
  9307                                  ;-1074     strcpy(namein, argv);
  9308                                  
  9309 000041B0 FF36[5B41]               push word [argv]
  9310 000041B4 8D067E6A                 lea  ax, [namein]
  9311 000041B8 50                       push ax
  9312 000041B9 E870C0                   call strcpy
  9313 000041BC 83C404                   add  sp, 4
  9314                                  
  9315                                  ;-1075     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9316                                  
  9317 000041BF 6A2E                     push 46
  9318 000041C1 8D067E6A                 lea  ax, [namein]
  9319 000041C5 50                       push ax
  9320 000041C6 E84DC1                   call instr1
  9321 000041C9 83C404                   add  sp, 4
  9322 000041CC 83F800                   cmp ax, 0
  9323 000041CF 0F850E00                 jne .getarg500
  9324 000041D3 68[DC42]                 push getarg_1
  9325 000041D6 8D067E6A                 lea  ax, [namein]
  9326 000041DA 50                       push ax
  9327 000041DB E8D0C0                   call strcat1
  9328 000041DE 83C404                   add  sp, 4
  9329                                  
  9330                                  ;-1076     strcpy(namelst, namein);
  9331                                  
  9332                                  .getarg500:
  9333 000041E1 8D067E6A                 lea  ax, [namein]
  9334 000041E5 50                       push ax
  9335 000041E6 8D06C16A                 lea  ax, [namelst]
  9336 000041EA 50                       push ax
  9337 000041EB E83EC0                   call strcpy
  9338 000041EE 83C404                   add  sp, 4
  9339                                  
  9340                                  ;-1077     i=strlen(namelst);
  9341                                  
  9342 000041F1 8D06C16A                 lea  ax, [namelst]
  9343 000041F5 50                       push ax
  9344 000041F6 E80BC0                   call strlen
  9345 000041F9 83C402                   add  sp, 2
  9346 000041FC 8946FC                   mov [bp-4], ax
  9347                                  
  9348                                  ;-1078     i--;
  9349                                  
  9350 000041FF FF4EFC                   dec  word[bp-4]
  9351                                  
  9352                                  ;-1079     c=&namelst+i;
  9353                                  
  9354 00004202 B8C16A                   mov ax, namelst
  9355 00004205 0346FC                   add ax, [bp-4]
  9356 00004208 8946FA                   mov [bp-6], ax
  9357                                  
  9358                                  ;-1080     *c='S';
  9359                                  
  9360 0000420B B85300                   mov ax, 83
  9361 0000420E 8B5EFA                   mov  bx, [bp-6]
  9362 00004211 8807                     mov  [bx], al
  9363                                  
  9364                                  ;-1081 
  9365                                  
  9366                                  
  9367                                  ;-1082     fdin=openR (namein);
  9368                                  
  9369 00004213 8D067E6A                 lea  ax, [namein]
  9370 00004217 50                       push ax
  9371 00004218 E89DBE                   call openR
  9372 0000421B 83C402                   add  sp, 2
  9373 0000421E A3[1A00]                 mov word [fdin], ax
  9374                                  
  9375                                  ;-1083     if(DOS_ERR){
  9376                                  
  9377 00004221 A1[4F00]                 mov ax, [DOS_ERR]
  9378 00004224 08C0                     or  al, al
  9379 00004226 0F841C00                 je .getarg501
  9380                                  
  9381                                  ;-1084         cputs("Source file missing (.C): ");
  9382                                  
  9383 0000422A 68[DF42]                 push getarg_2
  9384 0000422D E846BE                   call cputs
  9385 00004230 83C402                   add  sp, 2
  9386                                  
  9387                                  ;-1085         cputs(namein);
  9388                                  
  9389 00004233 8D067E6A                 lea  ax, [namein]
  9390 00004237 50                       push ax
  9391 00004238 E83BBE                   call cputs
  9392 0000423B 83C402                   add  sp, 2
  9393                                  
  9394                                  ;-1086         exitR(1);
  9395                                  
  9396 0000423E 6A01                     push 1
  9397 00004240 E8A5BE                   call exitR
  9398 00004243 83C402                   add  sp, 2
  9399                                  
  9400                                  ;-1087         }
  9401                                  
  9402                                  
  9403                                  ;-1088     fdout=creatR(namelst);
  9404                                  
  9405                                  .getarg501:
  9406 00004246 8D06C16A                 lea  ax, [namelst]
  9407 0000424A 50                       push ax
  9408 0000424B E879BE                   call creatR
  9409 0000424E 83C402                   add  sp, 2
  9410 00004251 A3[1C00]                 mov word [fdout], ax
  9411                                  
  9412                                  ;-1089     if(DOS_ERR){
  9413                                  
  9414 00004254 A1[4F00]                 mov ax, [DOS_ERR]
  9415 00004257 08C0                     or  al, al
  9416 00004259 0F841C00                 je .getarg502
  9417                                  
  9418                                  ;-1090         cputs("list file not creatable: ");
  9419                                  
  9420 0000425D 68[FA42]                 push getarg_3
  9421 00004260 E813BE                   call cputs
  9422 00004263 83C402                   add  sp, 2
  9423                                  
  9424                                  ;-1091         cputs(namelst);
  9425                                  
  9426 00004266 8D06C16A                 lea  ax, [namelst]
  9427 0000426A 50                       push ax
  9428 0000426B E808BE                   call cputs
  9429 0000426E 83C402                   add  sp, 2
  9430                                  
  9431                                  ;-1092         exitR(2);
  9432                                  
  9433 00004271 6A02                     push 2
  9434 00004273 E872BE                   call exitR
  9435 00004276 83C402                   add  sp, 2
  9436                                  
  9437                                  ;-1093         }
  9438                                  
  9439                                  
  9440                                  ;-1094     prs("\n; ");
  9441                                  
  9442                                  .getarg502:
  9443 00004279 68[1443]                 push getarg_4
  9444 0000427C E863C1                   call prs
  9445 0000427F 83C402                   add  sp, 2
  9446                                  
  9447                                  ;-1095     prs(Version1);
  9448                                  
  9449 00004282 8D06[0300]               lea  ax, [Version1]
  9450 00004286 50                       push ax
  9451 00004287 E858C1                   call prs
  9452 0000428A 83C402                   add  sp, 2
  9453                                  
  9454                                  ;-1096     prs(", Source: "); prs(namein);
  9455                                  
  9456 0000428D 68[1943]                 push getarg_5
  9457 00004290 E84FC1                   call prs
  9458 00004293 83C402                   add  sp, 2
  9459 00004296 8D067E6A                 lea  ax, [namein]
  9460 0000429A 50                       push ax
  9461 0000429B E844C1                   call prs
  9462 0000429E 83C402                   add  sp, 2
  9463                                  
  9464                                  ;-1097     prs(", Output asm: "); prs(namelst);
  9465                                  
  9466 000042A1 68[2443]                 push getarg_6
  9467 000042A4 E83BC1                   call prs
  9468 000042A7 83C402                   add  sp, 2
  9469 000042AA 8D06C16A                 lea  ax, [namelst]
  9470 000042AE 50                       push ax
  9471 000042AF E830C1                   call prs
  9472 000042B2 83C402                   add  sp, 2
  9473                                  
  9474                                  ;-1098     prs("\norg  256 \njmp main");
  9475                                  
  9476 000042B5 68[3343]                 push getarg_7
  9477 000042B8 E827C1                   call prs
  9478 000042BB 83C402                   add  sp, 2
  9479                                  
  9480                                  ;-1099 }
  9481                                  
  9482                                  
  9483                                  ;-1100 
  9484                                  
  9485                                  
  9486                                  ;-1101 int main() {
  9487 000042BE C9                       LEAVE
  9488 000042BF C3                       ret
  9489 000042C0 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  9490 000042C9 2E434F4D20696E5F66-
  9491 000042D2 696C655B2E435D3A20-
  9492 000042DB 00                 
  9493 000042DC 2E4300                  getarg_1 db ".C",0
  9494 000042DF 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  9495 000042E8 6C65206D697373696E-
  9496 000042F1 6720282E43293A2000 
  9497 000042FA 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  9498 00004303 206E6F742063726561-
  9499 0000430C 7461626C653A2000   
  9500 00004314 5C6E3B2000              getarg_4 db "\n; ",0
  9501 00004319 2C20536F757263653A-     getarg_5 db ", Source: ",0
  9502 00004322 2000               
  9503 00004324 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  9504 0000432D 61736D3A2000       
  9505 00004333 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  9506 0000433C 36205C6E6A6D70206D-
  9507 00004345 61696E00           
  9508                                  ENDP
  9509                                  
  9510                                  main: PROC
  9511                                  
  9512                                  ;-1102     getarg();
  9513                                  
  9514 00004349 E811FE                   call getarg
  9515                                  
  9516                                  ;-1103     CNameTop=0;
  9517                                  
  9518 0000434C B80000                   mov ax, 0
  9519 0000434F A3[4100]                 mov word [CNameTop], ax
  9520                                  
  9521                                  ;-1104     coname=0;
  9522                                  
  9523 00004352 B80000                   mov ax, 0
  9524 00004355 A27869                   mov byte [coname], al
  9525                                  
  9526                                  ;-1105     orgData=ORGDATAORIG;
  9527                                  
  9528 00004358 A1[1000]                 mov ax, [ORGDATAORIG]
  9529 0000435B A3[1200]                 mov word [orgData], ax
  9530                                  
  9531                                  ;-1106     getfirstchar();
  9532                                  
  9533 0000435E E8E2FD                   call getfirstchar
  9534                                  
  9535                                  ;-1107     parse();
  9536                                  
  9537 00004361 E862FD                   call parse
  9538                                  
  9539                                  ;-1108   epilog();
  9540                                  
  9541 00004364 E8C8F9                   call epilog
  9542                                  
  9543                                  ;-1109 }
  9544                                  
  9545 00004367 C3                       ret
  9546                                  ENDP
  9547                                  ;Input: A.C, List: A.S,  Lines: 1110
  9548                                  ;Glob. variables:  118 max.:  200
  9549                                  ;Functions      :   91 max.:  300
  9550                                  ;Calls          :  786 max.: 1500
  9551                                  ;NameField      : 4999 max.:10000
  9552                                  ;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538
