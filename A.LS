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
   435                                  ;-103 int ireg1;
   436                                  
   437 00000054 0000                    ireg1 dw 0
   438                                  
   439                                  ;-104 int mod2;
   440                                  
   441 00000056 0000                    mod2 dw 0
   442                                  
   443                                  ;-105 int ireg2;
   444                                  
   445 00000058 0000                    ireg2 dw 0
   446                                  
   447                                  ;-106 
   448                                  
   449                                  
   450                                  ;-107 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   451                                  
   452                                  
   453                                  writetty: PROC
   454 0000005A B40E                     mov  ah, 14
   455 0000005C BB0000                   mov  bx, 0
   456 0000005F CD10                     db 205,16
   457                                  
   458                                  ;-108 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   459                                  
   460 00000061 C3                       ret
   461                                  ENDP
   462                                  
   463                                  putch: PROC;
   464 00000062 C8000000                 ENTER  0,0
   465 00000066 8A4604                   mov al, [bp+4]
   466 00000069 3C0A                     cmp al, 10
   467 0000006B 0F850500                 jne .putch1
   468 0000006F B00D                     mov  al, 13
   469 00000071 E8E6FF                   call writetty
   470                                  .putch1:
   471 00000074 8A4604                   mov  al, [bp+4]
   472 00000077 E8E0FF                   call writetty
   473                                  
   474                                  ;-109 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   475 0000007A C9                       LEAVE
   476 0000007B C3                       ret
   477                                  ENDP
   478                                  
   479                                  cputs: PROC;
   480 0000007C C8020000                 ENTER  2,0
   481                                  .cputs2:
   482 00000080 8B5E04                   mov bx, [bp+4]
   483 00000083 8A07                     mov al, [bx]
   484 00000085 B400                     mov ah, 0
   485 00000087 08C0                     or  al, al
   486 00000089 0F841B00                 je .cputs3
   487 0000008D 8B5E04                   mov bx, [bp+4]
   488 00000090 8A07                     mov al, [bx]
   489 00000092 B400                     mov ah, 0
   490 00000094 8846FE                   mov [bp-2], al
   491 00000097 8A46FE                   mov al, byte [bp-2]
   492 0000009A B400                     mov ah, 0
   493 0000009C 50                       push ax
   494 0000009D E8C2FF                   call putch
   495 000000A0 83C402                   add  sp, 2
   496 000000A3 FF4604                   inc  word[bp+4]
   497 000000A6 EBD8                     jmp .cputs2
   498                                  .cputs3:
   499                                  
   500                                  ;-110 int mkneg(int n)   { n; __asm {neg ax} }
   501 000000A8 C9                       LEAVE
   502 000000A9 C3                       ret
   503                                  ENDP
   504                                  
   505                                  mkneg: PROC;
   506 000000AA C8000000                 ENTER  0,0
   507 000000AE 8B4604                   mov ax, [bp+4]
   508 000000B1 F7D8                    neg ax
   509                                  
   510                                  ;-111 
   511                                  
   512                                  
   513                                  ;-112 int DosInt() {
   514 000000B3 C9                       LEAVE
   515 000000B4 C3                       ret
   516                                  ENDP
   517                                  
   518                                  DosInt: PROC
   519                                  
   520                                  ;-113     __emit__(0xCD,0x21);//inth 0x21;
   521                                  
   522 000000B5 CD21                     db 205,33
   523                                  
   524                                  ;-114     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   525                                  
   526 000000B7 7304                     db 115,4
   527                                  
   528                                  ;-115     DOS_ERR++;
   529                                  
   530 000000B9 FF06[4F00]               inc  word[DOS_ERR]
   531                                  
   532                                  ;-116 }
   533                                  
   534                                  
   535                                  ;-117 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   536                                  
   537 000000BD C3                       ret
   538                                  ENDP
   539                                  
   540                                  openR: PROC;
   541 000000BE C8000000                 ENTER  0,0
   542 000000C2 8B5604                   mov  dx, [bp+4]
   543 000000C5 B8023D                   mov  ax, 15618
   544 000000C8 E8EAFF                   call DosInt
   545                                  
   546                                  ;-118 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   547 000000CB C9                       LEAVE
   548 000000CC C3                       ret
   549                                  ENDP
   550                                  
   551                                  creatR: PROC;
   552 000000CD C8000000                 ENTER  0,0
   553 000000D1 8B5604                   mov  dx, [bp+4]
   554 000000D4 B90000                   mov  cx, 0
   555 000000D7 B8003C                   mov  ax, 15360
   556 000000DA E8D8FF                   call DosInt
   557                                  
   558                                  ;-119 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   559 000000DD C9                       LEAVE
   560 000000DE C3                       ret
   561                                  ENDP
   562                                  
   563                                  fcloseR: PROC;
   564 000000DF C8000000                 ENTER  0,0
   565 000000E3 8B5E04                   mov  bx, [bp+4]
   566 000000E6 B8003E                   mov  ax, 15872
   567 000000E9 E8C9FF                   call DosInt
   568                                  
   569                                  ;-120 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   570 000000EC C9                       LEAVE
   571 000000ED C3                       ret
   572                                  ENDP
   573                                  
   574                                  exitR: PROC;
   575 000000EE C8000000                 ENTER  0,0
   576 000000F2 B44C                     mov  ah, 76
   577 000000F4 8A4604                   mov  al, [bp+4]
   578 000000F7 E8BBFF                   call DosInt
   579                                  
   580                                  ;-121 int readRL(char *s, int fd, int len){
   581 000000FA C9                       LEAVE
   582 000000FB C3                       ret
   583                                  ENDP
   584                                  
   585                                  readRL: PROC
   586                                  
   587                                  ;-122     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   588                                  ;
   589 000000FC C8000000                 ENTER  0,0
   590 00000100 8B5604                   mov  dx, [bp+4]
   591 00000103 8B4E08                   mov  cx, [bp+8]
   592 00000106 8B5E06                   mov  bx, [bp+6]
   593 00000109 B8003F                   mov  ax, 16128
   594 0000010C E8A6FF                   call DosInt
   595                                  
   596                                  ;-123 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   597 0000010F C9                       LEAVE
   598 00000110 C3                       ret
   599                                  ENDP
   600                                  
   601                                  fputcR: PROC;
   602 00000111 C8000000                 ENTER  0,0
   603 00000115 8D5604                  lea dx, [bp+4]
   604                                  
   605                                  ;-124   cx=1; bx=fd; ax=0x4000; DosInt(); }
   606                                  
   607 00000118 B90100                   mov  cx, 1
   608 0000011B 8B5E06                   mov  bx, [bp+6]
   609 0000011E B80040                   mov  ax, 16384
   610 00000121 E891FF                   call DosInt
   611                                  
   612                                  ;-125 
   613                                  
   614                                  
   615                                  ;-126   int letter(char c) {
   616 00000124 C9                       LEAVE
   617 00000125 C3                       ret
   618                                  ENDP
   619                                  
   620                                  letter: PROC
   621                                  
   622                                  ;-127       if (c=='_') return 1;
   623                                  ;
   624 00000126 C8000000                 ENTER  0,0
   625 0000012A 8A4604                   mov al, [bp+4]
   626 0000012D 3C5F                     cmp al, 95
   627 0000012F 0F850600                 jne .letter4
   628 00000133 B80100                   mov ax, 1
   629 00000136 E96900                   jmp .retnletter
   630                                  
   631                                  ;-128       if (c=='.') return 1;
   632                                  
   633                                  .letter4:
   634 00000139 8A4604                   mov al, [bp+4]
   635 0000013C 3C2E                     cmp al, 46
   636 0000013E 0F850600                 jne .letter5
   637 00000142 B80100                   mov ax, 1
   638 00000145 E95A00                   jmp .retnletter
   639                                  
   640                                  ;-129       if (c=='?') return 1;
   641                                  
   642                                  .letter5:
   643 00000148 8A4604                   mov al, [bp+4]
   644 0000014B 3C3F                     cmp al, 63
   645 0000014D 0F850600                 jne .letter6
   646 00000151 B80100                   mov ax, 1
   647 00000154 E94B00                   jmp .retnletter
   648                                  
   649                                  ;-130       if (c=='$') return 1;
   650                                  
   651                                  .letter6:
   652 00000157 8A4604                   mov al, [bp+4]
   653 0000015A 3C24                     cmp al, 36
   654 0000015C 0F850600                 jne .letter7
   655 00000160 B80100                   mov ax, 1
   656 00000163 E93C00                   jmp .retnletter
   657                                  
   658                                  ;-131       if (c> 'z') return 0;
   659                                  
   660                                  .letter7:
   661 00000166 8A4604                   mov al, [bp+4]
   662 00000169 3C7A                     cmp al, 122
   663 0000016B 0F8E0600                 jle .letter8
   664 0000016F B80000                   mov ax, 0
   665 00000172 E92D00                   jmp .retnletter
   666                                  
   667                                  ;-132       if (c< '@') return 0;// at included
   668                                  
   669                                  .letter8:
   670 00000175 8A4604                   mov al, [bp+4]
   671 00000178 3C40                     cmp al, 64
   672 0000017A 0F8D0600                 jge .letter9
   673 0000017E B80000                   mov ax, 0
   674 00000181 E91E00                   jmp .retnletter
   675                                  
   676                                  ;-133       if (c> 'Z') { if (c< 'a') return 0; }
   677                                  
   678                                  .letter9:
   679 00000184 8A4604                   mov al, [bp+4]
   680 00000187 3C5A                     cmp al, 90
   681 00000189 0F8E0F00                 jle .letter10
   682 0000018D 8A4604                   mov al, [bp+4]
   683 00000190 3C61                     cmp al, 97
   684 00000192 0F8D0600                 jge .letter11
   685 00000196 B80000                   mov ax, 0
   686 00000199 E90600                   jmp .retnletter
   687                                  .letter11:
   688                                  
   689                                  ;-134       return 1;
   690                                  
   691                                  .letter10:
   692 0000019C B80100                   mov ax, 1
   693 0000019F E90000                   jmp .retnletter
   694                                  
   695                                  ;-135   }
   696                                  
   697                                  
   698                                  ;-136   int digit(char c){
   699                                  
   700 000001A2 C9                       .retnletter: LEAVE
   701 000001A3 C3                       ret
   702                                  ENDP
   703                                  
   704                                  digit: PROC
   705                                  
   706                                  ;-137       if(c<'0') return 0;
   707                                  ;
   708 000001A4 C8000000                 ENTER  0,0
   709 000001A8 8A4604                   mov al, [bp+4]
   710 000001AB 3C30                     cmp al, 48
   711 000001AD 0F8D0600                 jge .digit12
   712 000001B1 B80000                   mov ax, 0
   713 000001B4 E91500                   jmp .retndigit
   714                                  
   715                                  ;-138       if(c>'9') return 0;
   716                                  
   717                                  .digit12:
   718 000001B7 8A4604                   mov al, [bp+4]
   719 000001BA 3C39                     cmp al, 57
   720 000001BC 0F8E0600                 jle .digit13
   721 000001C0 B80000                   mov ax, 0
   722 000001C3 E90600                   jmp .retndigit
   723                                  
   724                                  ;-139       return 1;
   725                                  
   726                                  .digit13:
   727 000001C6 B80100                   mov ax, 1
   728 000001C9 E90000                   jmp .retndigit
   729                                  
   730                                  ;-140   }
   731                                  
   732                                  
   733                                  ;-141   int alnum(char c) {
   734                                  
   735 000001CC C9                       .retndigit: LEAVE
   736 000001CD C3                       ret
   737                                  ENDP
   738                                  
   739                                  alnum: PROC
   740                                  
   741                                  ;-142     if (digit (c)) return 1;
   742                                  ;
   743 000001CE C8000000                 ENTER  0,0
   744 000001D2 8A4604                   mov al, byte [bp+4]
   745 000001D5 B400                     mov ah, 0
   746 000001D7 50                       push ax
   747 000001D8 E8C9FF                   call digit
   748 000001DB 83C402                   add  sp, 2
   749 000001DE 08C0                     or  al, al
   750 000001E0 0F840600                 je .alnum14
   751 000001E4 B80100                   mov ax, 1
   752 000001E7 E91E00                   jmp .retnalnum
   753                                  
   754                                  ;-143     if (letter(c)) return 1;
   755                                  
   756                                  .alnum14:
   757 000001EA 8A4604                   mov al, byte [bp+4]
   758 000001ED B400                     mov ah, 0
   759 000001EF 50                       push ax
   760 000001F0 E833FF                   call letter
   761 000001F3 83C402                   add  sp, 2
   762 000001F6 08C0                     or  al, al
   763 000001F8 0F840600                 je .alnum15
   764 000001FC B80100                   mov ax, 1
   765 000001FF E90600                   jmp .retnalnum
   766                                  
   767                                  ;-144     return 0;
   768                                  
   769                                  .alnum15:
   770 00000202 B80000                   mov ax, 0
   771 00000205 E90000                   jmp .retnalnum
   772                                  
   773                                  ;-145   }
   774                                  
   775                                  
   776                                  ;-146 
   777                                  
   778                                  
   779                                  ;-147 int strlen(char *s) { int c;
   780                                  
   781 00000208 C9                       .retnalnum: LEAVE
   782 00000209 C3                       ret
   783                                  ENDP
   784                                  
   785                                  strlen: PROC
   786                                  
   787                                  ;-148     c=0;
   788                                  ;
   789 0000020A C8020000                 ENTER  2,0
   790 0000020E B80000                   mov ax, 0
   791 00000211 8946FE                   mov [bp-2], ax
   792                                  
   793                                  ;-149     while (*s!=0) {s++; c++;}
   794                                  
   795                                  .strlen16:
   796 00000214 8B5E04                   mov bx, [bp+4]
   797 00000217 8A07                     mov al, [bx]
   798 00000219 B400                     mov ah, 0
   799 0000021B 83F800                   cmp ax, 0
   800 0000021E 0F840800                 je  .strlen17
   801 00000222 FF4604                   inc  word[bp+4]
   802 00000225 FF46FE                   inc  word[bp-2]
   803                                  
   804                                  ;-150     return c;
   805                                  
   806 00000228 EBEA                     jmp .strlen16
   807                                  .strlen17:
   808 0000022A 8B46FE                   mov ax, [bp-2]
   809 0000022D E90000                   jmp .retnstrlen
   810                                  
   811                                  ;-151 }
   812                                  
   813                                  
   814                                  ;-152 int strcpy(char *s, char *t) {
   815                                  
   816 00000230 C9                       .retnstrlen: LEAVE
   817 00000231 C3                       ret
   818                                  ENDP
   819                                  
   820                                  strcpy: PROC
   821                                  
   822                                  ;-153     do { *s=*t; s++; t++; }
   823                                  ;
   824 00000232 C8000000                 ENTER  0,0
   825                                  .strcpy18:
   826 00000236 8B5E06                   mov bx, [bp+6]
   827 00000239 8A07                     mov al, [bx]
   828 0000023B B400                     mov ah, 0
   829 0000023D 8B5E04                   mov  bx, [bp+4]
   830 00000240 8807                     mov  [bx], al
   831 00000242 FF4604                   inc  word[bp+4]
   832 00000245 FF4606                   inc  word[bp+6]
   833                                  
   834                                  ;-154     while (*t!=0);
   835                                  
   836 00000248 8B5E06                   mov bx, [bp+6]
   837 0000024B 8A07                     mov al, [bx]
   838 0000024D B400                     mov ah, 0
   839 0000024F 83F800                   cmp ax, 0
   840 00000252 0F840200                 je  .strcpy19
   841 00000256 EBDE                     jmp .strcpy18
   842                                  .strcpy19:
   843                                  
   844                                  ;-155     *s=0;
   845                                  
   846 00000258 B80000                   mov ax, 0
   847 0000025B 8B5E04                   mov  bx, [bp+4]
   848 0000025E 8807                     mov  [bx], al
   849                                  
   850                                  ;-156     return s;
   851                                  
   852 00000260 8B4604                   mov ax, [bp+4]
   853 00000263 E90000                   jmp .retnstrcpy
   854                                  
   855                                  ;-157 }
   856                                  
   857                                  
   858                                  ;-158 int eqstr(char *p, char *q) {
   859                                  
   860 00000266 C9                       .retnstrcpy: LEAVE
   861 00000267 C3                       ret
   862                                  ENDP
   863                                  
   864                                  eqstr: PROC
   865                                  
   866                                  ;-159     while(*p) {
   867                                  ;
   868 00000268 C8000000                 ENTER  0,0
   869                                  .eqstr20:
   870 0000026C 8B5E04                   mov bx, [bp+4]
   871 0000026F 8A07                     mov al, [bx]
   872 00000271 B400                     mov ah, 0
   873 00000273 08C0                     or  al, al
   874 00000275 0F842000                 je .eqstr21
   875                                  
   876                                  ;-160         if (*p != *q) return 0;
   877                                  
   878 00000279 8B5E04                   mov bx, [bp+4]
   879 0000027C 8A07                     mov al, [bx]
   880 0000027E B400                     mov ah, 0
   881 00000280 8B5E06                   mov bx, [bp+6]
   882 00000283 3A07                     cmp al, [bx]
   883 00000285 B400                     mov ah, 0
   884 00000287 0F840600                 je  .eqstr22
   885 0000028B B80000                   mov ax, 0
   886 0000028E E92100                   jmp .retneqstr
   887                                  
   888                                  ;-161         p++;
   889                                  
   890                                  .eqstr22:
   891 00000291 FF4604                   inc  word[bp+4]
   892                                  
   893                                  ;-162         q++;
   894                                  
   895 00000294 FF4606                   inc  word[bp+6]
   896                                  
   897                                  ;-163     }
   898                                  
   899                                  
   900                                  ;-164     if(*q) return 0;
   901                                  
   902 00000297 EBD3                     jmp .eqstr20
   903                                  .eqstr21:
   904 00000299 8B5E06                   mov bx, [bp+6]
   905 0000029C 8A07                     mov al, [bx]
   906 0000029E B400                     mov ah, 0
   907 000002A0 08C0                     or  al, al
   908 000002A2 0F840600                 je .eqstr23
   909 000002A6 B80000                   mov ax, 0
   910 000002A9 E90600                   jmp .retneqstr
   911                                  
   912                                  ;-165     return 1; }
   913                                  
   914                                  .eqstr23:
   915 000002AC B80100                   mov ax, 1
   916 000002AF E90000                   jmp .retneqstr
   917                                  
   918                                  ;-166 int strcat1(char *s, char *t) {
   919                                  
   920 000002B2 C9                       .retneqstr: LEAVE
   921 000002B3 C3                       ret
   922                                  ENDP
   923                                  
   924                                  strcat1: PROC
   925                                  
   926                                  ;-167     while (*s != 0) s++;
   927                                  ;
   928 000002B4 C8000000                 ENTER  0,0
   929                                  .strcat124:
   930 000002B8 8B5E04                   mov bx, [bp+4]
   931 000002BB 8A07                     mov al, [bx]
   932 000002BD B400                     mov ah, 0
   933 000002BF 83F800                   cmp ax, 0
   934 000002C2 0F840500                 je  .strcat125
   935 000002C6 FF4604                   inc  word[bp+4]
   936                                  
   937                                  ;-168     strcpy(s, t);
   938                                  
   939 000002C9 EBED                     jmp .strcat124
   940                                  .strcat125:
   941 000002CB FF7606                   push word [bp+6]
   942 000002CE FF7604                   push word [bp+4]
   943 000002D1 E85EFF                   call strcpy
   944 000002D4 83C404                   add  sp, 4
   945                                  
   946                                  ;-169 }
   947                                  
   948                                  
   949                                  ;-170 int toupper(char *s) {
   950 000002D7 C9                       LEAVE
   951 000002D8 C3                       ret
   952                                  ENDP
   953                                  
   954                                  toupper: PROC
   955                                  
   956                                  ;-171     while(*s) {
   957                                  ;
   958 000002D9 C8000000                 ENTER  0,0
   959                                  .toupper26:
   960 000002DD 8B5E04                   mov bx, [bp+4]
   961 000002E0 8A07                     mov al, [bx]
   962 000002E2 B400                     mov ah, 0
   963 000002E4 08C0                     or  al, al
   964 000002E6 0F843000                 je .toupper27
   965                                  
   966                                  ;-172         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
   967                                  
   968 000002EA 8B5E04                   mov bx, [bp+4]
   969 000002ED 8A07                     mov al, [bx]
   970 000002EF B400                     mov ah, 0
   971 000002F1 83F861                   cmp ax, 97 ;unsigned : 1
   972 000002F4 0F8C1D00                 jl  .toupper28
   973 000002F8 8B5E04                   mov bx, [bp+4]
   974 000002FB 8A07                     mov al, [bx]
   975 000002FD B400                     mov ah, 0
   976 000002FF 83F87A                   cmp ax, 122
   977 00000302 0F8F0F00                 jg  .toupper29
   978 00000306 8B5E04                   mov bx, [bp+4]
   979 00000309 8A07                     mov al, [bx]
   980 0000030B B400                     mov ah, 0
   981 0000030D 83E820                   sub ax, 32
   982 00000310 8B5E04                   mov  bx, [bp+4]
   983 00000313 8807                     mov  [bx], al
   984                                  
   985                                  ;-173         s++;
   986                                  
   987                                  .toupper29:
   988                                  .toupper28:
   989 00000315 FF4604                   inc  word[bp+4]
   990                                  
   991                                  ;-174     }
   992                                  
   993                                  
   994                                  ;-175 }
   995                                  
   996 00000318 EBC3                     jmp .toupper26
   997                                  .toupper27:
   998                                  
   999                                  ;-176 int instr1(char *s, char c) {
  1000 0000031A C9                       LEAVE
  1001 0000031B C3                       ret
  1002                                  ENDP
  1003                                  
  1004                                  instr1: PROC
  1005                                  
  1006                                  ;-177     while(*s) {
  1007                                  ;
  1008 0000031C C8000000                 ENTER  0,0
  1009                                  .instr130:
  1010 00000320 8B5E04                   mov bx, [bp+4]
  1011 00000323 8A07                     mov al, [bx]
  1012 00000325 B400                     mov ah, 0
  1013 00000327 08C0                     or  al, al
  1014 00000329 0F841900                 je .instr131
  1015                                  
  1016                                  ;-178         if (*s==c) return 1;
  1017                                  
  1018 0000032D 8B5E04                   mov bx, [bp+4]
  1019 00000330 8A07                     mov al, [bx]
  1020 00000332 B400                     mov ah, 0
  1021 00000334 3A4606                   cmp al, [bp+6]
  1022 00000337 0F850600                 jne .instr132
  1023 0000033B B80100                   mov ax, 1
  1024 0000033E E90B00                   jmp .retninstr1
  1025                                  
  1026                                  ;-179         s++;
  1027                                  
  1028                                  .instr132:
  1029 00000341 FF4604                   inc  word[bp+4]
  1030                                  
  1031                                  ;-180     }
  1032                                  
  1033                                  
  1034                                  ;-181     return 0;
  1035                                  
  1036 00000344 EBDA                     jmp .instr130
  1037                                  .instr131:
  1038 00000346 B80000                   mov ax, 0
  1039 00000349 E90000                   jmp .retninstr1
  1040                                  
  1041                                  ;-182 }
  1042                                  
  1043                                  
  1044                                  ;-183 
  1045                                  
  1046                                  
  1047                                  ;-184 
  1048                                  
  1049                                  
  1050                                  ;-185 int eprc(char c)  {
  1051                                  
  1052 0000034C C9                       .retninstr1: LEAVE
  1053 0000034D C3                       ret
  1054                                  ENDP
  1055                                  
  1056                                  eprc: PROC
  1057                                  
  1058                                  ;-186     *cloc=c;
  1059                                  ;
  1060 0000034E C8000000                 ENTER  0,0
  1061 00000352 8A4604                   mov al, [bp+4]
  1062 00000355 8B1E[1800]               mov  bx, [cloc]
  1063 00000359 8807                     mov  [bx], al
  1064                                  
  1065                                  ;-187     cloc++;
  1066                                  
  1067 0000035B FF06[1800]               inc  word[cloc]
  1068                                  
  1069                                  ;-188 }
  1070                                  
  1071                                  
  1072                                  ;-189 int eprs(char *s) {
  1073 0000035F C9                       LEAVE
  1074 00000360 C3                       ret
  1075                                  ENDP
  1076                                  
  1077                                  eprs: PROC
  1078                                  
  1079                                  ;-190     char c;
  1080                                  
  1081                                  
  1082                                  ;-191     while(*s) {
  1083                                  ;
  1084 00000361 C8020000                 ENTER  2,0
  1085                                  .eprs33:
  1086 00000365 8B5E04                   mov bx, [bp+4]
  1087 00000368 8A07                     mov al, [bx]
  1088 0000036A B400                     mov ah, 0
  1089 0000036C 08C0                     or  al, al
  1090 0000036E 0F841B00                 je .eprs34
  1091                                  
  1092                                  ;-192         c=*s;
  1093                                  
  1094 00000372 8B5E04                   mov bx, [bp+4]
  1095 00000375 8A07                     mov al, [bx]
  1096 00000377 B400                     mov ah, 0
  1097 00000379 8846FE                   mov [bp-2], al
  1098                                  
  1099                                  ;-193         eprc(c);
  1100                                  
  1101 0000037C 8A46FE                   mov al, byte [bp-2]
  1102 0000037F B400                     mov ah, 0
  1103 00000381 50                       push ax
  1104 00000382 E8C9FF                   call eprc
  1105 00000385 83C402                   add  sp, 2
  1106                                  
  1107                                  ;-194         s++;
  1108                                  
  1109 00000388 FF4604                   inc  word[bp+4]
  1110                                  
  1111                                  ;-195     }
  1112                                  
  1113                                  
  1114                                  ;-196 }
  1115                                  
  1116 0000038B EBD8                     jmp .eprs33
  1117                                  .eprs34:
  1118                                  
  1119                                  ;-197 int prc(unsigned char c) {
  1120 0000038D C9                       LEAVE
  1121 0000038E C3                       ret
  1122                                  ENDP
  1123                                  
  1124                                  prc: PROC
  1125                                  
  1126                                  ;-198     if (c==10) {
  1127                                  ;
  1128 0000038F C8000000                 ENTER  0,0
  1129 00000393 8A4604                   mov al, [bp+4]
  1130 00000396 3C0A                     cmp al, 10
  1131 00000398 0F850600                 jne .prc35
  1132                                  
  1133                                  ;-199         _AX=13;
  1134                                  
  1135 0000039C B80D00                   mov  ax, 13
  1136                                  
  1137                                  ;-200         writetty();
  1138                                  
  1139 0000039F E8B8FC                   call writetty
  1140                                  
  1141                                  ;-201     }
  1142                                  
  1143                                  
  1144                                  ;-202     _AL=c;
  1145                                  
  1146                                  .prc35:
  1147 000003A2 8A4604                   mov  al, [bp+4]
  1148                                  
  1149                                  ;-203     writetty();
  1150                                  
  1151 000003A5 E8B2FC                   call writetty
  1152                                  
  1153                                  ;-204     fputcR(c, fdout);
  1154                                  
  1155 000003A8 FF36[1C00]               push word [fdout]
  1156 000003AC 8A4604                   mov al, byte [bp+4]
  1157 000003AF B400                     mov ah, 0
  1158 000003B1 50                       push ax
  1159 000003B2 E85CFD                   call fputcR
  1160 000003B5 83C404                   add  sp, 4
  1161                                  
  1162                                  ;-205 }
  1163                                  
  1164                                  
  1165                                  ;-206 int prscomment(unsigned char *s) {
  1166 000003B8 C9                       LEAVE
  1167 000003B9 C3                       ret
  1168                                  ENDP
  1169                                  
  1170                                  prscomment: PROC
  1171                                  
  1172                                  ;-207     unsigned char c;
  1173                                  
  1174                                  
  1175                                  ;-208     while(*s){
  1176                                  ;
  1177 000003BA C8020000                 ENTER  2,0
  1178                                  .prscomment36:
  1179 000003BE 8B5E04                   mov bx, [bp+4]
  1180 000003C1 8A07                     mov al, [bx]
  1181 000003C3 B400                     mov ah, 0
  1182 000003C5 08C0                     or  al, al
  1183 000003C7 0F841B00                 je .prscomment37
  1184                                  
  1185                                  ;-209         c=*s;
  1186                                  
  1187 000003CB 8B5E04                   mov bx, [bp+4]
  1188 000003CE 8A07                     mov al, [bx]
  1189 000003D0 B400                     mov ah, 0
  1190 000003D2 8846FE                   mov [bp-2], al
  1191                                  
  1192                                  ;-210         prc(c);
  1193                                  
  1194 000003D5 8A46FE                   mov al, byte [bp-2]
  1195 000003D8 B400                     mov ah, 0
  1196 000003DA 50                       push ax
  1197 000003DB E8B1FF                   call prc
  1198 000003DE 83C402                   add  sp, 2
  1199                                  
  1200                                  ;-211         s++;
  1201                                  
  1202 000003E1 FF4604                   inc  word[bp+4]
  1203                                  
  1204                                  ;-212     }
  1205                                  
  1206                                  
  1207                                  ;-213 }
  1208                                  
  1209 000003E4 EBD8                     jmp .prscomment36
  1210                                  .prscomment37:
  1211                                  
  1212                                  ;-214 int prs(unsigned char *s) {
  1213 000003E6 C9                       LEAVE
  1214 000003E7 C3                       ret
  1215                                  ENDP
  1216                                  
  1217                                  prs: PROC
  1218                                  
  1219                                  ;-215     unsigned char c; int com;
  1220                                  
  1221                                  
  1222                                  ;-216     com=0;
  1223                                  ;
  1224 000003E8 C8040000                 ENTER  4,0
  1225 000003EC B80000                   mov ax, 0
  1226 000003EF 8946FC                   mov [bp-4], ax
  1227                                  
  1228                                  ;-217     while(*s) {
  1229                                  
  1230                                  .prs38:
  1231 000003F2 8B5E04                   mov bx, [bp+4]
  1232 000003F5 8A07                     mov al, [bx]
  1233 000003F7 B400                     mov ah, 0
  1234 000003F9 08C0                     or  al, al
  1235 000003FB 0F847B00                 je .prs39
  1236                                  
  1237                                  ;-218         c=*s;
  1238                                  
  1239 000003FF 8B5E04                   mov bx, [bp+4]
  1240 00000402 8A07                     mov al, [bx]
  1241 00000404 B400                     mov ah, 0
  1242 00000406 8846FE                   mov [bp-2], al
  1243                                  
  1244                                  ;-219         if (c==34) if (com) com=0;
  1245                                  
  1246 00000409 8A46FE                   mov al, [bp-2]
  1247 0000040C 3C22                     cmp al, 34
  1248 0000040E 0F851800                 jne .prs40
  1249 00000412 8B46FC                   mov ax, [bp-4]
  1250 00000415 08C0                     or  al, al
  1251 00000417 0F840900                 je .prs41
  1252 0000041B B80000                   mov ax, 0
  1253 0000041E 8946FC                   mov [bp-4], ax
  1254                                  
  1255                                  ;-220                    else com=1;
  1256                                  
  1257 00000421 E90600                   jmp .prs42
  1258                                  .prs41:
  1259 00000424 B80100                   mov ax, 1
  1260 00000427 8946FC                   mov [bp-4], ax
  1261                                  
  1262                                  ;-221         if (c==92) {
  1263                                  
  1264                                  .prs42:
  1265                                  .prs40:
  1266 0000042A 8A46FE                   mov al, [bp-2]
  1267 0000042D 3C5C                     cmp al, 92
  1268 0000042F 0F853500                 jne .prs43
  1269                                  
  1270                                  ;-222             if (com==0) {
  1271                                  
  1272 00000433 8B46FC                   mov ax, [bp-4]
  1273 00000436 83F800                   cmp ax, 0
  1274 00000439 0F852B00                 jne .prs44
  1275                                  
  1276                                  ;-223                 s++;
  1277                                  
  1278 0000043D FF4604                   inc  word[bp+4]
  1279                                  
  1280                                  ;-224                 c=*s;
  1281                                  
  1282 00000440 8B5E04                   mov bx, [bp+4]
  1283 00000443 8A07                     mov al, [bx]
  1284 00000445 B400                     mov ah, 0
  1285 00000447 8846FE                   mov [bp-2], al
  1286                                  
  1287                                  ;-225                 if (c=='n') c=10;
  1288                                  
  1289 0000044A 8A46FE                   mov al, [bp-2]
  1290 0000044D 3C6E                     cmp al, 110
  1291 0000044F 0F850600                 jne .prs45
  1292 00000453 B80A00                   mov ax, 10
  1293 00000456 8846FE                   mov [bp-2], al
  1294                                  
  1295                                  ;-226                 if (c=='t') c= 9;
  1296                                  
  1297                                  .prs45:
  1298 00000459 8A46FE                   mov al, [bp-2]
  1299 0000045C 3C74                     cmp al, 116
  1300 0000045E 0F850600                 jne .prs46
  1301 00000462 B80900                   mov ax, 9
  1302 00000465 8846FE                   mov [bp-2], al
  1303                                  
  1304                                  ;-227             }
  1305                                  
  1306                                  .prs46:
  1307                                  
  1308                                  ;-228         }
  1309                                  
  1310                                  .prs44:
  1311                                  
  1312                                  ;-229         prc(c);
  1313                                  
  1314                                  .prs43:
  1315 00000468 8A46FE                   mov al, byte [bp-2]
  1316 0000046B B400                     mov ah, 0
  1317 0000046D 50                       push ax
  1318 0000046E E81EFF                   call prc
  1319 00000471 83C402                   add  sp, 2
  1320                                  
  1321                                  ;-230         s++;
  1322                                  
  1323 00000474 FF4604                   inc  word[bp+4]
  1324                                  
  1325                                  ;-231     }
  1326                                  
  1327                                  
  1328                                  ;-232 }
  1329                                  
  1330 00000477 E978FF                   jmp .prs38
  1331                                  .prs39:
  1332                                  
  1333                                  ;-233 int prnl() {
  1334 0000047A C9                       LEAVE
  1335 0000047B C3                       ret
  1336                                  ENDP
  1337                                  
  1338                                  prnl: PROC
  1339                                  
  1340                                  ;-234     prs("\n ");
  1341                                  
  1342 0000047C 68[8604]                 push prnl_0
  1343 0000047F E866FF                   call prs
  1344 00000482 83C402                   add  sp, 2
  1345                                  
  1346                                  ;-235 }
  1347                                  
  1348                                  
  1349                                  ;-236 
  1350                                  
  1351                                  
  1352                                  ;-237 
  1353                                  
  1354                                  
  1355                                  ;-238 int eprnum(int n){//for docall1 procedure
  1356                                  
  1357 00000485 C3                       ret
  1358 00000486 5C6E2000                prnl_0 db "\n ",0
  1359                                  ENDP
  1360                                  
  1361                                  eprnum: PROC
  1362                                  
  1363                                  ;-239     int e;
  1364                                  
  1365                                  
  1366                                  ;-240     if(n<0) {
  1367                                  ;
  1368 0000048A C8020000                 ENTER  2,0
  1369 0000048E 8B4604                   mov ax, [bp+4]
  1370 00000491 83F800                   cmp ax, 0
  1371 00000494 0F8D1400                 jge .eprnum47
  1372                                  
  1373                                  ;-241         eprc('-');
  1374                                  
  1375 00000498 6A2D                     push 45
  1376 0000049A E8B1FE                   call eprc
  1377 0000049D 83C402                   add  sp, 2
  1378                                  
  1379                                  ;-242         n=mkneg(n);
  1380                                  
  1381 000004A0 FF7604                   push word [bp+4]
  1382 000004A3 E804FC                   call mkneg
  1383 000004A6 83C402                   add  sp, 2
  1384 000004A9 894604                   mov [bp+4], ax
  1385                                  
  1386                                  ;-243     }
  1387                                  
  1388                                  
  1389                                  ;-244     if (n >= 10) {
  1390                                  
  1391                                  .eprnum47:
  1392 000004AC 8B4604                   mov ax, [bp+4]
  1393 000004AF 83F80A                   cmp ax, 10 ;unsigned : 1
  1394 000004B2 0F8C1500                 jl  .eprnum48
  1395                                  
  1396                                  ;-245         e=n/10;
  1397                                  
  1398 000004B6 8B4604                   mov ax, [bp+4]
  1399 000004B9 BB0A00                   mov bx, 10
  1400 000004BC 99                       cwd
  1401 000004BD F7FB                     idiv bx
  1402 000004BF 8946FE                   mov [bp-2], ax
  1403                                  
  1404                                  ;-246         eprnum(e);
  1405                                  
  1406 000004C2 FF76FE                   push word [bp-2]
  1407 000004C5 E8C2FF                   call eprnum
  1408 000004C8 83C402                   add  sp, 2
  1409                                  
  1410                                  ;-247     }
  1411                                  
  1412                                  
  1413                                  ;-248     n=n%10;
  1414                                  
  1415                                  .eprnum48:
  1416 000004CB 8B4604                   mov ax, [bp+4]
  1417 000004CE BB0A00                   mov bx, 10
  1418 000004D1 99                       cwd
  1419 000004D2 F7FB                     idiv bx
  1420 000004D4 89D0                     mov ax, dx
  1421 000004D6 894604                   mov [bp+4], ax
  1422                                  
  1423                                  ;-249     n=n+'0';
  1424                                  
  1425 000004D9 8B4604                   mov ax, [bp+4]
  1426 000004DC 83C030                   add ax, 48
  1427 000004DF 894604                   mov [bp+4], ax
  1428                                  
  1429                                  ;-250     eprc(n);
  1430                                  
  1431 000004E2 FF7604                   push word [bp+4]
  1432 000004E5 E866FE                   call eprc
  1433 000004E8 83C402                   add  sp, 2
  1434                                  
  1435                                  ;-251 }
  1436                                  
  1437                                  
  1438                                  ;-252 int pint1 (int n){
  1439 000004EB C9                       LEAVE
  1440 000004EC C3                       ret
  1441                                  ENDP
  1442                                  
  1443                                  pint1: PROC
  1444                                  
  1445                                  ;-253     int e;
  1446                                  
  1447                                  
  1448                                  ;-254     if(n<0) {  prc('-');  n=mkneg(n); }
  1449                                  ;
  1450 000004ED C8020000                 ENTER  2,0
  1451 000004F1 8B4604                   mov ax, [bp+4]
  1452 000004F4 83F800                   cmp ax, 0
  1453 000004F7 0F8D1400                 jge .pint149
  1454 000004FB 6A2D                     push 45
  1455 000004FD E88FFE                   call prc
  1456 00000500 83C402                   add  sp, 2
  1457 00000503 FF7604                   push word [bp+4]
  1458 00000506 E8A1FB                   call mkneg
  1459 00000509 83C402                   add  sp, 2
  1460 0000050C 894604                   mov [bp+4], ax
  1461                                  
  1462                                  ;-255     if (n >= 10) {
  1463                                  
  1464                                  .pint149:
  1465 0000050F 8B4604                   mov ax, [bp+4]
  1466 00000512 83F80A                   cmp ax, 10 ;unsigned : 1
  1467 00000515 0F8C1500                 jl  .pint150
  1468                                  
  1469                                  ;-256         e=n/10;
  1470                                  
  1471 00000519 8B4604                   mov ax, [bp+4]
  1472 0000051C BB0A00                   mov bx, 10
  1473 0000051F 99                       cwd
  1474 00000520 F7FB                     idiv bx
  1475 00000522 8946FE                   mov [bp-2], ax
  1476                                  
  1477                                  ;-257         pint1(e);
  1478                                  
  1479 00000525 FF76FE                   push word [bp-2]
  1480 00000528 E8C2FF                   call pint1
  1481 0000052B 83C402                   add  sp, 2
  1482                                  
  1483                                  ;-258     }
  1484                                  
  1485                                  
  1486                                  ;-259     n=n%10;
  1487                                  
  1488                                  .pint150:
  1489 0000052E 8B4604                   mov ax, [bp+4]
  1490 00000531 BB0A00                   mov bx, 10
  1491 00000534 99                       cwd
  1492 00000535 F7FB                     idiv bx
  1493 00000537 89D0                     mov ax, dx
  1494 00000539 894604                   mov [bp+4], ax
  1495                                  
  1496                                  ;-260     n += '0';
  1497                                  
  1498 0000053C 83460430                 add  word[bp+4], 48
  1499                                  
  1500                                  ;-261     prc(n);
  1501                                  
  1502 00000540 FF7604                   push word [bp+4]
  1503 00000543 E849FE                   call prc
  1504 00000546 83C402                   add  sp, 2
  1505                                  
  1506                                  ;-262 }
  1507                                  
  1508                                  
  1509                                  ;-263 int prunsign1(unsigned int n) {
  1510 00000549 C9                       LEAVE
  1511 0000054A C3                       ret
  1512                                  ENDP
  1513                                  
  1514                                  prunsign1: PROC
  1515                                  
  1516                                  ;-264     unsigned int e;
  1517                                  
  1518                                  
  1519                                  ;-265     if (n >= 10) {
  1520                                  ;
  1521 0000054B C8020000                 ENTER  2,0
  1522 0000054F 8B4604                   mov ax, [bp+4]
  1523 00000552 83F80A                   cmp ax, 10 ;unsigned : 0
  1524 00000555 0F821700                 jb  .prunsign151
  1525                                  
  1526                                  ;-266         e=n/10;
  1527                                  
  1528 00000559 8B4604                   mov ax, [bp+4]
  1529 0000055C BB0A00                   mov bx, 10
  1530 0000055F BA0000                   mov dx, 0
  1531 00000562 F7F3                     div bx
  1532 00000564 8946FE                   mov [bp-2], ax
  1533                                  
  1534                                  ;-267         prunsign1(e);
  1535                                  
  1536 00000567 FF76FE                   push word [bp-2]
  1537 0000056A E8DEFF                   call prunsign1
  1538 0000056D 83C402                   add  sp, 2
  1539                                  
  1540                                  ;-268     }
  1541                                  
  1542                                  
  1543                                  ;-269     n = n % 10; /*unsigned mod*/
  1544                                  
  1545                                  .prunsign151:
  1546 00000570 8B4604                   mov ax, [bp+4]
  1547 00000573 BB0A00                   mov bx, 10
  1548 00000576 BA0000                   mov dx, 0
  1549 00000579 F7F3                     div bx
  1550 0000057B 89D0                     mov ax, dx
  1551 0000057D 894604                   mov [bp+4], ax
  1552                                  
  1553                                  ;-270     n += '0';
  1554                                  
  1555 00000580 83460430                 add  word[bp+4], 48
  1556                                  
  1557                                  ;-271     prc(n);
  1558                                  
  1559 00000584 FF7604                   push word [bp+4]
  1560 00000587 E805FE                   call prc
  1561 0000058A 83C402                   add  sp, 2
  1562                                  
  1563                                  ;-272 }
  1564                                  
  1565                                  
  1566                                  ;-273 int printint51(unsigned int j)  {
  1567 0000058D C9                       LEAVE
  1568 0000058E C3                       ret
  1569                                  ENDP
  1570                                  
  1571                                  printint51: PROC
  1572                                  
  1573                                  ;-274     if (j<10000) prc(32);
  1574                                  ;
  1575 0000058F C8000000                 ENTER  0,0
  1576 00000593 8B4604                   mov ax, [bp+4]
  1577 00000596 3D1027                   cmp ax, 10000
  1578 00000599 0F8D0800                 jge .printint5152
  1579 0000059D 6A20                     push 32
  1580 0000059F E8EDFD                   call prc
  1581 000005A2 83C402                   add  sp, 2
  1582                                  
  1583                                  ;-275     if (j<1000) prc(32);
  1584                                  
  1585                                  .printint5152:
  1586 000005A5 8B4604                   mov ax, [bp+4]
  1587 000005A8 3DE803                   cmp ax, 1000
  1588 000005AB 0F8D0800                 jge .printint5153
  1589 000005AF 6A20                     push 32
  1590 000005B1 E8DBFD                   call prc
  1591 000005B4 83C402                   add  sp, 2
  1592                                  
  1593                                  ;-276     if (j<100) prc(32);
  1594                                  
  1595                                  .printint5153:
  1596 000005B7 8B4604                   mov ax, [bp+4]
  1597 000005BA 83F864                   cmp ax, 100
  1598 000005BD 0F8D0800                 jge .printint5154
  1599 000005C1 6A20                     push 32
  1600 000005C3 E8C9FD                   call prc
  1601 000005C6 83C402                   add  sp, 2
  1602                                  
  1603                                  ;-277     if (j<10) prc(32);
  1604                                  
  1605                                  .printint5154:
  1606 000005C9 8B4604                   mov ax, [bp+4]
  1607 000005CC 83F80A                   cmp ax, 10
  1608 000005CF 0F8D0800                 jge .printint5155
  1609 000005D3 6A20                     push 32
  1610 000005D5 E8B7FD                   call prc
  1611 000005D8 83C402                   add  sp, 2
  1612                                  
  1613                                  ;-278     prunsign1(j);
  1614                                  
  1615                                  .printint5155:
  1616 000005DB FF7604                   push word [bp+4]
  1617 000005DE E86AFF                   call prunsign1
  1618 000005E1 83C402                   add  sp, 2
  1619                                  
  1620                                  ;-279 }
  1621                                  
  1622                                  
  1623                                  ;-280 
  1624                                  
  1625                                  
  1626                                  ;-281 int end1(int n) {
  1627 000005E4 C9                       LEAVE
  1628 000005E5 C3                       ret
  1629                                  ENDP
  1630                                  
  1631                                  end1: PROC
  1632                                  
  1633                                  ;-282     fcloseR(fdin);
  1634                                  ;
  1635 000005E6 C8000000                 ENTER  0,0
  1636 000005EA FF36[1A00]               push word [fdin]
  1637 000005EE E8EEFA                   call fcloseR
  1638 000005F1 83C402                   add  sp, 2
  1639                                  
  1640                                  ;-283     fcloseR(fdout);
  1641                                  
  1642 000005F4 FF36[1C00]               push word [fdout]
  1643 000005F8 E8E4FA                   call fcloseR
  1644 000005FB 83C402                   add  sp, 2
  1645                                  
  1646                                  ;-284     exitR(n);
  1647                                  
  1648 000005FE FF7604                   push word [bp+4]
  1649 00000601 E8EAFA                   call exitR
  1650 00000604 83C402                   add  sp, 2
  1651                                  
  1652                                  ;-285 }
  1653                                  
  1654                                  
  1655                                  ;-286 
  1656                                  
  1657                                  
  1658                                  ;-287 int error1(char *s) {
  1659 00000607 C9                       LEAVE
  1660 00000608 C3                       ret
  1661                                  ENDP
  1662                                  
  1663                                  error1: PROC
  1664                                  
  1665                                  ;-288     lineno--;
  1666                                  ;
  1667 00000609 C8000000                 ENTER  0,0
  1668 0000060D FF0E[4900]               dec  word[lineno]
  1669                                  
  1670                                  ;-289     prnl();
  1671                                  
  1672 00000611 E868FE                   call prnl
  1673                                  
  1674                                  ;-290     prscomment(&fgetsdest);
  1675                                  
  1676 00000614 8D06A0D9                 lea  ax, [fgetsdest]
  1677 00000618 50                       push ax
  1678 00000619 E89EFD                   call prscomment
  1679 0000061C 83C402                   add  sp, 2
  1680                                  
  1681                                  ;-291     prs(";Line: ");
  1682                                  
  1683 0000061F 68[8806]                 push error1_0
  1684 00000622 E8C3FD                   call prs
  1685 00000625 83C402                   add  sp, 2
  1686                                  
  1687                                  ;-292     prunsign1(lineno);
  1688                                  
  1689 00000628 FF36[4900]               push word [lineno]
  1690 0000062C E81CFF                   call prunsign1
  1691 0000062F 83C402                   add  sp, 2
  1692                                  
  1693                                  ;-293     prs(" ************** ERROR: ");
  1694                                  
  1695 00000632 68[9006]                 push error1_1
  1696 00000635 E8B0FD                   call prs
  1697 00000638 83C402                   add  sp, 2
  1698                                  
  1699                                  ;-294     prs(s);
  1700                                  
  1701 0000063B FF7604                   push word [bp+4]
  1702 0000063E E8A7FD                   call prs
  1703 00000641 83C402                   add  sp, 2
  1704                                  
  1705                                  ;-295     prs("  in column: ");
  1706                                  
  1707 00000644 68[A806]                 push error1_2
  1708 00000647 E89EFD                   call prs
  1709 0000064A 83C402                   add  sp, 2
  1710                                  
  1711                                  ;-296     prunsign1(column);
  1712                                  
  1713 0000064D FF36[2100]               push word [column]
  1714 00000651 E8F7FE                   call prunsign1
  1715 00000654 83C402                   add  sp, 2
  1716                                  
  1717                                  ;-297     prs("\nToken: ");
  1718                                  
  1719 00000657 68[B606]                 push error1_3
  1720 0000065A E88BFD                   call prs
  1721 0000065D 83C402                   add  sp, 2
  1722                                  
  1723                                  ;-298     prunsign1(token);
  1724                                  
  1725 00000660 FF36[1E00]               push word [token]
  1726 00000664 E8E4FE                   call prunsign1
  1727 00000667 83C402                   add  sp, 2
  1728                                  
  1729                                  ;-299     prs(", symbol: ");
  1730                                  
  1731 0000066A 68[C006]                 push error1_4
  1732 0000066D E878FD                   call prs
  1733 00000670 83C402                   add  sp, 2
  1734                                  
  1735                                  ;-300     prs(symbol);
  1736                                  
  1737 00000673 8D06BB69                 lea  ax, [symbol]
  1738 00000677 50                       push ax
  1739 00000678 E86DFD                   call prs
  1740 0000067B 83C402                   add  sp, 2
  1741                                  
  1742                                  ;-301     end1(1);
  1743                                  
  1744 0000067E 6A01                     push 1
  1745 00000680 E863FF                   call end1
  1746 00000683 83C402                   add  sp, 2
  1747                                  
  1748                                  ;-302 }
  1749                                  
  1750                                  
  1751                                  ;-303 
  1752                                  
  1753                                  
  1754                                  ;-304 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  1755 00000686 C9                       LEAVE
  1756 00000687 C3                       ret
  1757 00000688 3B4C696E653A2000        error1_0 db ";Line: ",0
  1758 00000690 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  1759 00000699 2A2A2A2A2A2A204552-
  1760 000006A2 524F523A2000       
  1761 000006A8 2020696E20636F6C75-     error1_2 db "  in column: ",0
  1762 000006B1 6D6E3A2000         
  1763 000006B6 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  1764 000006BF 00                 
  1765 000006C0 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  1766 000006C9 2000               
  1767                                  ENDP
  1768                                  
  1769                                  ifEOL: PROC
  1770                                  
  1771                                  ;-305     if (c == 10) return 1;//LF
  1772                                  ;
  1773 000006CB C8000000                 ENTER  0,0
  1774 000006CF 8A4604                   mov al, [bp+4]
  1775 000006D2 3C0A                     cmp al, 10
  1776 000006D4 0F850600                 jne .ifEOL56
  1777 000006D8 B80100                   mov ax, 1
  1778 000006DB E92400                   jmp .retnifEOL
  1779                                  
  1780                                  ;-306     if (c == 13) {//CR
  1781                                  
  1782                                  .ifEOL56:
  1783 000006DE 8A4604                   mov al, [bp+4]
  1784 000006E1 3C0D                     cmp al, 13
  1785 000006E3 0F851500                 jne .ifEOL57
  1786                                  
  1787                                  ;-307         if (thechar == 10) c=next();
  1788                                  
  1789 000006E7 A0[2300]                 mov al, [thechar]
  1790 000006EA 3C0A                     cmp al, 10
  1791 000006EC 0F850600                 jne .ifEOL58
  1792 000006F0 E82601                   call next
  1793 000006F3 884604                   mov [bp+4], al
  1794                                  
  1795                                  ;-308         return 1;
  1796                                  
  1797                                  .ifEOL58:
  1798 000006F6 B80100                   mov ax, 1
  1799 000006F9 E90600                   jmp .retnifEOL
  1800                                  
  1801                                  ;-309     }
  1802                                  
  1803                                  
  1804                                  ;-310     return 0;
  1805                                  
  1806                                  .ifEOL57:
  1807 000006FC B80000                   mov ax, 0
  1808 000006FF E90000                   jmp .retnifEOL
  1809                                  
  1810                                  ;-311 }
  1811                                  
  1812                                  
  1813                                  ;-312 int printinputline() {
  1814                                  
  1815 00000702 C9                       .retnifEOL: LEAVE
  1816 00000703 C3                       ret
  1817                                  ENDP
  1818                                  
  1819                                  printinputline: PROC
  1820                                  
  1821                                  ;-313     int col;
  1822                                  
  1823                                  
  1824                                  ;-314     col=0;
  1825                                  ;
  1826 00000704 C8020000                 ENTER  2,0
  1827 00000708 B80000                   mov ax, 0
  1828 0000070B 8946FE                   mov [bp-2], ax
  1829                                  
  1830                                  ;-315     fgetsp=&fgetsdest;
  1831                                  
  1832 0000070E B8A0D9                   mov ax, fgetsdest
  1833 00000711 A3[4500]                 mov word [fgetsp], ax
  1834                                  
  1835                                  ;-316     do {
  1836                                  
  1837                                  .printinputline59:
  1838                                  
  1839                                  ;-317         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1840                                  
  1841 00000714 6A01                     push 1
  1842 00000716 FF36[1A00]               push word [fdin]
  1843 0000071A 8D06[5300]               lea  ax, [DOS_ByteRead]
  1844 0000071E 50                       push ax
  1845 0000071F E8DAF9                   call readRL
  1846 00000722 83C406                   add  sp, 6
  1847 00000725 A3[5100]                 mov word [DOS_NoBytes], ax
  1848                                  
  1849                                  ;-318         if (DOS_NoBytes == 0) return;
  1850                                  
  1851 00000728 A1[5100]                 mov ax, [DOS_NoBytes]
  1852 0000072B 83F800                   cmp ax, 0
  1853 0000072E 0F850300                 jne .printinputline60
  1854 00000732 E96A00                   jmp .retnprintinputline
  1855                                  
  1856                                  ;-319         *fgetsp=DOS_ByteRead;
  1857                                  
  1858                                  .printinputline60:
  1859 00000735 A0[5300]                 mov al, [DOS_ByteRead]
  1860 00000738 8B1E[4500]               mov  bx, [fgetsp]
  1861 0000073C 8807                     mov  [bx], al
  1862                                  
  1863                                  ;-320         fgetsp++;
  1864                                  
  1865 0000073E FF06[4500]               inc  word[fgetsp]
  1866                                  
  1867                                  ;-321         col++;
  1868                                  
  1869 00000742 FF46FE                   inc  word[bp-2]
  1870                                  
  1871                                  ;-322         if (col >80) error1("input line longer than 80 char");
  1872                                  
  1873 00000745 8B46FE                   mov ax, [bp-2]
  1874 00000748 83F850                   cmp ax, 80
  1875 0000074B 0F8E0900                 jle .printinputline61
  1876 0000074F 68[A107]                 push printinputline_0
  1877 00000752 E8B4FE                   call error1
  1878 00000755 83C402                   add  sp, 2
  1879                                  
  1880                                  ;-323         }
  1881                                  
  1882                                  .printinputline61:
  1883                                  
  1884                                  ;-324         while (DOS_ByteRead != 10);
  1885                                  
  1886 00000758 A0[5300]                 mov al, [DOS_ByteRead]
  1887 0000075B 3C0A                     cmp al, 10
  1888 0000075D 0F840200                 je  .printinputline62
  1889 00000761 EBB1                     jmp .printinputline59
  1890                                  .printinputline62:
  1891                                  
  1892                                  ;-325     *fgetsp=0;
  1893                                  
  1894 00000763 B80000                   mov ax, 0
  1895 00000766 8B1E[4500]               mov  bx, [fgetsp]
  1896 0000076A 8807                     mov  [bx], al
  1897                                  
  1898                                  ;-326     if (fdout) {
  1899                                  
  1900 0000076C A1[1C00]                 mov ax, [fdout]
  1901 0000076F 08C0                     or  al, al
  1902 00000771 0F842A00                 je .printinputline63
  1903                                  
  1904                                  ;-327         prs("\n\n;-");
  1905                                  
  1906 00000775 68[C007]                 push printinputline_1
  1907 00000778 E86DFC                   call prs
  1908 0000077B 83C402                   add  sp, 2
  1909                                  
  1910                                  ;-328         prunsign1(lineno);
  1911                                  
  1912 0000077E FF36[4900]               push word [lineno]
  1913 00000782 E8C6FD                   call prunsign1
  1914 00000785 83C402                   add  sp, 2
  1915                                  
  1916                                  ;-329         prc(' ');
  1917                                  
  1918 00000788 6A20                     push 32
  1919 0000078A E802FC                   call prc
  1920 0000078D 83C402                   add  sp, 2
  1921                                  
  1922                                  ;-330         lineno++;
  1923                                  
  1924 00000790 FF06[4900]               inc  word[lineno]
  1925                                  
  1926                                  ;-331         prscomment(&fgetsdest);
  1927                                  
  1928 00000794 8D06A0D9                 lea  ax, [fgetsdest]
  1929 00000798 50                       push ax
  1930 00000799 E81EFC                   call prscomment
  1931 0000079C 83C402                   add  sp, 2
  1932                                  
  1933                                  ;-332         }
  1934                                  
  1935                                  
  1936                                  ;-333 }
  1937                                  
  1938                                  .printinputline63:
  1939                                  
  1940                                  ;-334 int fgets1() {
  1941                                  
  1942 0000079F C9                       .retnprintinputline: LEAVE
  1943 000007A0 C3                       ret
  1944 000007A1 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1945 000007AA 65206C6F6E67657220-
  1946 000007B3 7468616E2038302063-
  1947 000007BC 68617200           
  1948 000007C0 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1949                                  ENDP
  1950                                  
  1951                                  fgets1: PROC
  1952                                  
  1953                                  ;-335     char c;
  1954                                  
  1955                                  
  1956                                  ;-336     c=*fgetsp;
  1957                                  ;
  1958 000007C7 C8020000                 ENTER  2,0
  1959 000007CB 8B1E[4500]               mov bx, [fgetsp]
  1960 000007CF 8A07                     mov al, [bx]
  1961 000007D1 B400                     mov ah, 0
  1962 000007D3 8846FE                   mov [bp-2], al
  1963                                  
  1964                                  ;-337     if (c==0) {
  1965                                  
  1966 000007D6 8A46FE                   mov al, [bp-2]
  1967 000007D9 3C00                     cmp al, 0
  1968 000007DB 0F852A00                 jne .fgets164
  1969                                  
  1970                                  ;-338         printinputline();
  1971                                  
  1972 000007DF E822FF                   call printinputline
  1973                                  
  1974                                  ;-339         if (DOS_NoBytes == 0) return 0;
  1975                                  
  1976 000007E2 A1[5100]                 mov ax, [DOS_NoBytes]
  1977 000007E5 83F800                   cmp ax, 0
  1978 000007E8 0F850600                 jne .fgets165
  1979 000007EC B80000                   mov ax, 0
  1980 000007EF E92500                   jmp .retnfgets1
  1981                                  
  1982                                  ;-340         fgetsp=&fgetsdest;
  1983                                  
  1984                                  .fgets165:
  1985 000007F2 B8A0D9                   mov ax, fgetsdest
  1986 000007F5 A3[4500]                 mov word [fgetsp], ax
  1987                                  
  1988                                  ;-341         c=*fgetsp;
  1989                                  
  1990 000007F8 8B1E[4500]               mov bx, [fgetsp]
  1991 000007FC 8A07                     mov al, [bx]
  1992 000007FE B400                     mov ah, 0
  1993 00000800 8846FE                   mov [bp-2], al
  1994                                  
  1995                                  ;-342         column=0;
  1996                                  
  1997 00000803 B80000                   mov ax, 0
  1998 00000806 A3[2100]                 mov word [column], ax
  1999                                  
  2000                                  ;-343     }
  2001                                  
  2002                                  
  2003                                  ;-344     fgetsp++;
  2004                                  
  2005                                  .fgets164:
  2006 00000809 FF06[4500]               inc  word[fgetsp]
  2007                                  
  2008                                  ;-345     column++;
  2009                                  
  2010 0000080D FF06[2100]               inc  word[column]
  2011                                  
  2012                                  ;-346     return c;
  2013                                  
  2014 00000811 8A46FE                   mov al, [bp-2]
  2015 00000814 E90000                   jmp .retnfgets1
  2016                                  
  2017                                  ;-347 }
  2018                                  
  2019                                  
  2020                                  ;-348 int next() {
  2021                                  
  2022 00000817 C9                       .retnfgets1: LEAVE
  2023 00000818 C3                       ret
  2024                                  ENDP
  2025                                  
  2026                                  next: PROC
  2027                                  
  2028                                  ;-349     char r;
  2029                                  
  2030                                  
  2031                                  ;-350     r = thechar;
  2032                                  ;
  2033 00000819 C8020000                 ENTER  2,0
  2034 0000081D A0[2300]                 mov al, [thechar]
  2035 00000820 8846FE                   mov [bp-2], al
  2036                                  
  2037                                  ;-351     globC=r;
  2038                                  
  2039 00000823 8A46FE                   mov al, [bp-2]
  2040 00000826 A2[2000]                 mov byte [globC], al
  2041                                  
  2042                                  ;-352     thechar = fgets1();
  2043                                  
  2044 00000829 E89BFF                   call fgets1
  2045 0000082C A2[2300]                 mov byte [thechar], al
  2046                                  
  2047                                  ;-353     return r;
  2048                                  
  2049 0000082F 8A46FE                   mov al, [bp-2]
  2050 00000832 E90000                   jmp .retnnext
  2051                                  
  2052                                  ;-354 }
  2053                                  
  2054                                  
  2055                                  ;-355 
  2056                                  
  2057                                  
  2058                                  ;-356 int getdigit(char c) { int i;
  2059                                  
  2060 00000835 C9                       .retnnext: LEAVE
  2061 00000836 C3                       ret
  2062                                  ENDP
  2063                                  
  2064                                  getdigit: PROC
  2065                                  
  2066                                  ;-357     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  2067                                  ;
  2068 00000837 C8020000                 ENTER  2,0
  2069 0000083B B80000                   mov ax, 0
  2070 0000083E A3[2C00]                 mov word [lexval], ax
  2071 00000841 8A4604                   mov al, [bp+4]
  2072 00000844 2C30                     sub al, 48
  2073 00000846 A3[2C00]                 mov word [lexval], ax
  2074                                  
  2075                                  ;-358     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  2076                                  
  2077 00000849 A0[2300]                 mov al, [thechar]
  2078 0000084C 3C78                     cmp al, 120
  2079 0000084E 0F850600                 jne .getdigit66
  2080 00000852 B85800                   mov ax, 88
  2081 00000855 A2[2300]                 mov byte [thechar], al
  2082                                  .getdigit66:
  2083 00000858 A0[2300]                 mov al, [thechar]
  2084 0000085B 3C58                     cmp al, 88
  2085 0000085D 0F856800                 jne .getdigit67
  2086 00000861 E8B5FF                   call next
  2087                                  
  2088                                  ;-359       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  2089                                  
  2090                                  .getdigit68:
  2091 00000864 A0[2300]                 mov al, byte [thechar]
  2092 00000867 B400                     mov ah, 0
  2093 00000869 50                       push ax
  2094 0000086A E861F9                   call alnum
  2095 0000086D 83C402                   add  sp, 2
  2096 00000870 08C0                     or  al, al
  2097 00000872 0F845000                 je .getdigit69
  2098 00000876 E8A0FF                   call next
  2099 00000879 884604                   mov [bp+4], al
  2100 0000087C 8A4604                   mov al, [bp+4]
  2101 0000087F 3C60                     cmp al, 96
  2102 00000881 0F8E0800                 jle .getdigit70
  2103 00000885 8A4604                   mov al, [bp+4]
  2104 00000888 2C27                     sub al, 39
  2105 0000088A 884604                   mov [bp+4], al
  2106                                  
  2107                                  ;-360 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  2108                                  
  2109                                  .getdigit70:
  2110 0000088D 8A4604                   mov al, [bp+4]
  2111 00000890 3C40                     cmp al, 64
  2112 00000892 0F8E0800                 jle .getdigit71
  2113 00000896 8A4604                   mov al, [bp+4]
  2114 00000899 2C07                     sub al, 7
  2115 0000089B 884604                   mov [bp+4], al
  2116                                  .getdigit71:
  2117 0000089E 8A4604                   mov al, [bp+4]
  2118 000008A1 2C30                     sub al, 48
  2119 000008A3 884604                   mov [bp+4], al
  2120 000008A6 A1[2C00]                 mov ax, [lexval]
  2121 000008A9 C1E004                   shl ax, 4
  2122 000008AC A3[2C00]                 mov word [lexval], ax
  2123                                  
  2124                                  ;-361      i=0; i=c; lexval=lexval+i;}
  2125                                  
  2126 000008AF B80000                   mov ax, 0
  2127 000008B2 8946FE                   mov [bp-2], ax
  2128 000008B5 8A4604                   mov al, [bp+4]
  2129 000008B8 8946FE                   mov [bp-2], ax
  2130 000008BB A1[2C00]                 mov ax, [lexval]
  2131 000008BE 0346FE                   add ax, [bp-2]
  2132 000008C1 A3[2C00]                 mov word [lexval], ax
  2133                                  
  2134                                  ;-362     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  2135                                  
  2136 000008C4 EB9E                     jmp .getdigit68
  2137                                  .getdigit69:
  2138 000008C6 E94200                   jmp .getdigit72
  2139                                  .getdigit67:
  2140                                  .getdigit73:
  2141 000008C9 A0[2300]                 mov al, byte [thechar]
  2142 000008CC B400                     mov ah, 0
  2143 000008CE 50                       push ax
  2144 000008CF E8D2F8                   call digit
  2145 000008D2 83C402                   add  sp, 2
  2146 000008D5 08C0                     or  al, al
  2147 000008D7 0F843000                 je .getdigit74
  2148 000008DB E83BFF                   call next
  2149 000008DE 884604                   mov [bp+4], al
  2150 000008E1 8A4604                   mov al, [bp+4]
  2151 000008E4 2C30                     sub al, 48
  2152 000008E6 884604                   mov [bp+4], al
  2153 000008E9 A1[2C00]                 mov ax, [lexval]
  2154 000008EC BB0A00                   mov bx, 10
  2155 000008EF F7E3                     mul bx
  2156 000008F1 A3[2C00]                 mov word [lexval], ax
  2157                                  
  2158                                  ;-363      i=0; i=c; lexval=lexval+i; } }
  2159                                  
  2160 000008F4 B80000                   mov ax, 0
  2161 000008F7 8946FE                   mov [bp-2], ax
  2162 000008FA 8A4604                   mov al, [bp+4]
  2163 000008FD 8946FE                   mov [bp-2], ax
  2164 00000900 A1[2C00]                 mov ax, [lexval]
  2165 00000903 0346FE                   add ax, [bp-2]
  2166 00000906 A3[2C00]                 mov word [lexval], ax
  2167 00000909 EBBE                     jmp .getdigit73
  2168                                  .getdigit74:
  2169                                  
  2170                                  ;-364 }
  2171                                  
  2172                                  .getdigit72:
  2173                                  
  2174                                  ;-365 int getstring(int delim) {
  2175 0000090B C9                       LEAVE
  2176 0000090C C3                       ret
  2177                                  ENDP
  2178                                  
  2179                                  getstring: PROC
  2180                                  
  2181                                  ;-366     int c; char *p;
  2182                                  
  2183                                  
  2184                                  ;-367     p=&symbol;
  2185                                  ;
  2186 0000090D C8040000                 ENTER  4,0
  2187 00000911 B8BB69                   mov ax, symbol
  2188 00000914 8946FC                   mov [bp-4], ax
  2189                                  
  2190                                  ;-368     c=next();
  2191                                  
  2192 00000917 E8FFFE                   call next
  2193 0000091A 8946FE                   mov [bp-2], ax
  2194                                  
  2195                                  ;-369     while (c != delim) {
  2196                                  
  2197                                  .getstring75:
  2198 0000091D 8B46FE                   mov ax, [bp-2]
  2199 00000920 3B4604                   cmp ax, [bp+4]
  2200 00000923 0F841300                 je  .getstring76
  2201                                  
  2202                                  ;-370         *p=c;
  2203                                  
  2204 00000927 8B46FE                   mov ax, [bp-2]
  2205 0000092A 8B5EFC                   mov  bx, [bp-4]
  2206 0000092D 8807                     mov  [bx], al
  2207                                  
  2208                                  ;-371         p++;
  2209                                  
  2210 0000092F FF46FC                   inc  word[bp-4]
  2211                                  
  2212                                  ;-372         c=next();
  2213                                  
  2214 00000932 E8E4FE                   call next
  2215 00000935 8946FE                   mov [bp-2], ax
  2216                                  
  2217                                  ;-373     }
  2218                                  
  2219                                  
  2220                                  ;-374     *p=0;
  2221                                  
  2222 00000938 EBE3                     jmp .getstring75
  2223                                  .getstring76:
  2224 0000093A B80000                   mov ax, 0
  2225 0000093D 8B5EFC                   mov  bx, [bp-4]
  2226 00000940 8807                     mov  [bx], al
  2227                                  
  2228                                  ;-375 }
  2229                                  
  2230                                  
  2231                                  ;-376 
  2232                                  
  2233                                  
  2234                                  ;-377 char symboltemp[80];
  2235 00000942 C9                       LEAVE
  2236 00000943 C3                       ret
  2237                                  ENDP
  2238                                  section .bss
  2239                                  absolute 55840
  2240 0000DA20 <res 00000050>          symboltemp resb 80
  2241                                  section .text
  2242                                  
  2243                                  ;-378 int getlex() { char c; char *p;
  2244                                  
  2245                                  
  2246                                  getlex: PROC
  2247                                  
  2248                                  ;-379 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  2249                                  ;
  2250 00000944 C8040000                 ENTER  4,0
  2251                                  .g1:
  2252 00000948 E8CEFE                   call next
  2253 0000094B 8846FE                   mov [bp-2], al
  2254 0000094E 8A46FE                   mov al, [bp-2]
  2255 00000951 3C00                     cmp al, 0
  2256 00000953 0F850600                 jne .getlex77
  2257 00000957 B80000                   mov ax, 0
  2258 0000095A E9DA04                   jmp .retngetlex
  2259                                  .getlex77:
  2260 0000095D 8A46FE                   mov al, [bp-2]
  2261 00000960 3C20                     cmp al, 32
  2262 00000962 0F8F0200                 jg  .getlex78
  2263 00000966 EBE0                     jmp .g1
  2264                                  
  2265                                  ;-380   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2266                                  
  2267                                  .getlex78:
  2268 00000968 8A46FE                   mov al, [bp-2]
  2269 0000096B 3C3D                     cmp al, 61
  2270 0000096D 0F851200                 jne .getlex79
  2271 00000971 A0[2300]                 mov al, [thechar]
  2272 00000974 3C3D                     cmp al, 61
  2273 00000976 0F850900                 jne .getlex80
  2274 0000097A E89CFE                   call next
  2275 0000097D B82603                   mov ax, 806
  2276 00000980 E9B404                   jmp .retngetlex
  2277                                  .getlex80:
  2278                                  
  2279                                  ;-381   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2280                                  
  2281                                  .getlex79:
  2282 00000983 8A46FE                   mov al, [bp-2]
  2283 00000986 3C21                     cmp al, 33
  2284 00000988 0F851200                 jne .getlex81
  2285 0000098C A0[2300]                 mov al, [thechar]
  2286 0000098F 3C3D                     cmp al, 61
  2287 00000991 0F850900                 jne .getlex82
  2288 00000995 E881FE                   call next
  2289 00000998 B82703                   mov ax, 807
  2290 0000099B E99904                   jmp .retngetlex
  2291                                  .getlex82:
  2292                                  
  2293                                  ;-382   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2294                                  
  2295                                  .getlex81:
  2296 0000099E 8A46FE                   mov al, [bp-2]
  2297 000009A1 3C3C                     cmp al, 60
  2298 000009A3 0F851200                 jne .getlex83
  2299 000009A7 A0[2300]                 mov al, [thechar]
  2300 000009AA 3C3D                     cmp al, 61
  2301 000009AC 0F850900                 jne .getlex84
  2302 000009B0 E866FE                   call next
  2303 000009B3 B83803                   mov ax, 824
  2304 000009B6 E97E04                   jmp .retngetlex
  2305                                  .getlex84:
  2306                                  
  2307                                  ;-383   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2308                                  
  2309                                  .getlex83:
  2310 000009B9 8A46FE                   mov al, [bp-2]
  2311 000009BC 3C3E                     cmp al, 62
  2312 000009BE 0F851200                 jne .getlex85
  2313 000009C2 A0[2300]                 mov al, [thechar]
  2314 000009C5 3C3D                     cmp al, 61
  2315 000009C7 0F850900                 jne .getlex86
  2316 000009CB E84BFE                   call next
  2317 000009CE B82B03                   mov ax, 811
  2318 000009D1 E96304                   jmp .retngetlex
  2319                                  .getlex86:
  2320                                  
  2321                                  ;-384   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2322                                  
  2323                                  .getlex85:
  2324 000009D4 8A46FE                   mov al, [bp-2]
  2325 000009D7 3C3C                     cmp al, 60
  2326 000009D9 0F851200                 jne .getlex87
  2327 000009DD A0[2300]                 mov al, [thechar]
  2328 000009E0 3C3C                     cmp al, 60
  2329 000009E2 0F850900                 jne .getlex88
  2330 000009E6 E830FE                   call next
  2331 000009E9 B8D804                   mov ax, 1240
  2332 000009EC E94804                   jmp .retngetlex
  2333                                  .getlex88:
  2334                                  
  2335                                  ;-385   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2336                                  
  2337                                  .getlex87:
  2338 000009EF 8A46FE                   mov al, [bp-2]
  2339 000009F2 3C3E                     cmp al, 62
  2340 000009F4 0F851200                 jne .getlex89
  2341 000009F8 A0[2300]                 mov al, [thechar]
  2342 000009FB 3C3E                     cmp al, 62
  2343 000009FD 0F850900                 jne .getlex90
  2344 00000A01 E815FE                   call next
  2345 00000A04 B8D904                   mov ax, 1241
  2346 00000A07 E92D04                   jmp .retngetlex
  2347                                  .getlex90:
  2348                                  
  2349                                  ;-386   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2350                                  
  2351                                  .getlex89:
  2352 00000A0A 8A46FE                   mov al, [bp-2]
  2353 00000A0D 3C2B                     cmp al, 43
  2354 00000A0F 0F851200                 jne .getlex91
  2355 00000A13 A0[2300]                 mov al, [thechar]
  2356 00000A16 3C2B                     cmp al, 43
  2357 00000A18 0F850900                 jne .getlex92
  2358 00000A1C E8FAFD                   call next
  2359 00000A1F B8C304                   mov ax, 1219
  2360 00000A22 E91204                   jmp .retngetlex
  2361                                  .getlex92:
  2362                                  
  2363                                  ;-387   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2364                                  
  2365                                  .getlex91:
  2366 00000A25 8A46FE                   mov al, [bp-2]
  2367 00000A28 3C2D                     cmp al, 45
  2368 00000A2A 0F851200                 jne .getlex93
  2369 00000A2E A0[2300]                 mov al, [thechar]
  2370 00000A31 3C2D                     cmp al, 45
  2371 00000A33 0F850900                 jne .getlex94
  2372 00000A37 E8DFFD                   call next
  2373 00000A3A B8C904                   mov ax, 1225
  2374 00000A3D E9F703                   jmp .retngetlex
  2375                                  .getlex94:
  2376                                  
  2377                                  ;-388   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2378                                  
  2379                                  .getlex93:
  2380 00000A40 8A46FE                   mov al, [bp-2]
  2381 00000A43 3C2B                     cmp al, 43
  2382 00000A45 0F851200                 jne .getlex95
  2383 00000A49 A0[2300]                 mov al, [thechar]
  2384 00000A4C 3C3D                     cmp al, 61
  2385 00000A4E 0F850900                 jne .getlex96
  2386 00000A52 E8C4FD                   call next
  2387 00000A55 B8CE04                   mov ax, 1230
  2388 00000A58 E9DC03                   jmp .retngetlex
  2389                                  .getlex96:
  2390                                  
  2391                                  ;-389   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2392                                  
  2393                                  .getlex95:
  2394 00000A5B 8A46FE                   mov al, [bp-2]
  2395 00000A5E 3C2D                     cmp al, 45
  2396 00000A60 0F851200                 jne .getlex97
  2397 00000A64 A0[2300]                 mov al, [thechar]
  2398 00000A67 3C3D                     cmp al, 61
  2399 00000A69 0F850900                 jne .getlex98
  2400 00000A6D E8A9FD                   call next
  2401 00000A70 B8CF04                   mov ax, 1231
  2402 00000A73 E9C103                   jmp .retngetlex
  2403                                  .getlex98:
  2404                                  
  2405                                  ;-390   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2406                                  
  2407                                  .getlex97:
  2408 00000A76 8A46FE                   mov al, [bp-2]
  2409 00000A79 3C26                     cmp al, 38
  2410 00000A7B 0F851200                 jne .getlex99
  2411 00000A7F A0[2300]                 mov al, [thechar]
  2412 00000A82 3C3D                     cmp al, 61
  2413 00000A84 0F850900                 jne .getlex100
  2414 00000A88 E88EFD                   call next
  2415 00000A8B B8D204                   mov ax, 1234
  2416 00000A8E E9A603                   jmp .retngetlex
  2417                                  .getlex100:
  2418                                  
  2419                                  ;-391   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2420                                  
  2421                                  .getlex99:
  2422 00000A91 8A46FE                   mov al, [bp-2]
  2423 00000A94 3C7C                     cmp al, 124
  2424 00000A96 0F851200                 jne .getlex101
  2425 00000A9A A0[2300]                 mov al, [thechar]
  2426 00000A9D 3C3D                     cmp al, 61
  2427 00000A9F 0F850900                 jne .getlex102
  2428 00000AA3 E873FD                   call next
  2429 00000AA6 B8D304                   mov ax, 1235
  2430 00000AA9 E98B03                   jmp .retngetlex
  2431                                  .getlex102:
  2432                                  
  2433                                  ;-392   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2434                                  
  2435                                  .getlex101:
  2436 00000AAC 8A46FE                   mov al, [bp-2]
  2437 00000AAF 3C2A                     cmp al, 42
  2438 00000AB1 0F851200                 jne .getlex103
  2439 00000AB5 A0[2300]                 mov al, [thechar]
  2440 00000AB8 3C3D                     cmp al, 61
  2441 00000ABA 0F850900                 jne .getlex104
  2442 00000ABE E858FD                   call next
  2443 00000AC1 B8D004                   mov ax, 1232
  2444 00000AC4 E97003                   jmp .retngetlex
  2445                                  .getlex104:
  2446                                  
  2447                                  ;-393   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2448                                  
  2449                                  .getlex103:
  2450 00000AC7 8A46FE                   mov al, [bp-2]
  2451 00000ACA 3C2F                     cmp al, 47
  2452 00000ACC 0F851200                 jne .getlex105
  2453 00000AD0 A0[2300]                 mov al, [thechar]
  2454 00000AD3 3C3D                     cmp al, 61
  2455 00000AD5 0F850900                 jne .getlex106
  2456 00000AD9 E83DFD                   call next
  2457 00000ADC B8D104                   mov ax, 1233
  2458 00000ADF E95503                   jmp .retngetlex
  2459                                  .getlex106:
  2460                                  
  2461                                  ;-394   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2462                                  
  2463                                  .getlex105:
  2464 00000AE2 8A46FE                   mov al, byte [bp-2]
  2465 00000AE5 B400                     mov ah, 0
  2466 00000AE7 50                       push ax
  2467 00000AE8 68[390E]                 push getlex_0
  2468 00000AEB E82EF8                   call instr1
  2469 00000AEE 83C404                   add  sp, 4
  2470 00000AF1 08C0                     or  al, al
  2471 00000AF3 0F840600                 je .getlex107
  2472 00000AF7 8A46FE                   mov al, [bp-2]
  2473 00000AFA E93A03                   jmp .retngetlex
  2474                                  
  2475                                  ;-395   if (c == '/') { if (thechar == '/') {
  2476                                  
  2477                                  .getlex107:
  2478 00000AFD 8A46FE                   mov al, [bp-2]
  2479 00000B00 3C2F                     cmp al, 47
  2480 00000B02 0F852900                 jne .getlex108
  2481 00000B06 A0[2300]                 mov al, [thechar]
  2482 00000B09 3C2F                     cmp al, 47
  2483 00000B0B 0F852000                 jne .getlex109
  2484                                  
  2485                                  ;-396       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  2486                                  
  2487                                  .getlex110:
  2488 00000B0F E807FD                   call next
  2489 00000B12 8846FE                   mov [bp-2], al
  2490 00000B15 8A46FE                   mov al, byte [bp-2]
  2491 00000B18 B400                     mov ah, 0
  2492 00000B1A 50                       push ax
  2493 00000B1B E8ADFB                   call ifEOL
  2494 00000B1E 83C402                   add  sp, 2
  2495 00000B21 3C00                     cmp al, 0
  2496 00000B23 0F850200                 jne .getlex111
  2497 00000B27 EBE6                     jmp .getlex110
  2498                                  .getlex111:
  2499 00000B29 E818FE                   call getlex
  2500 00000B2C E90803                   jmp .retngetlex
  2501                                  .getlex109:
  2502                                  
  2503                                  ;-397   if (c == '/') { if (thechar == '*') {
  2504                                  
  2505                                  .getlex108:
  2506 00000B2F 8A46FE                   mov al, [bp-2]
  2507 00000B32 3C2F                     cmp al, 47
  2508 00000B34 0F853A00                 jne .getlex112
  2509 00000B38 A0[2300]                 mov al, [thechar]
  2510 00000B3B 3C2A                     cmp al, 42
  2511 00000B3D 0F852B00                 jne .getlex113
  2512                                  
  2513                                  ;-398       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  2514                                  
  2515                                  .g2:
  2516 00000B41 E8D5FC                   call next
  2517 00000B44 8846FE                   mov [bp-2], al
  2518 00000B47 8A46FE                   mov al, [bp-2]
  2519 00000B4A 3C2A                     cmp al, 42
  2520 00000B4C 0F840200                 je  .getlex114
  2521 00000B50 EBEF                     jmp .g2
  2522                                  .getlex114:
  2523 00000B52 A0[2300]                 mov al, [thechar]
  2524 00000B55 3C2F                     cmp al, 47
  2525 00000B57 0F840200                 je  .getlex115
  2526 00000B5B EBE4                     jmp .g2
  2527                                  
  2528                                  ;-399       c=next(); return getlex(); } else  return '/'; }
  2529                                  
  2530                                  .getlex115:
  2531 00000B5D E8B9FC                   call next
  2532 00000B60 8846FE                   mov [bp-2], al
  2533 00000B63 E8DEFD                   call getlex
  2534 00000B66 E9CE02                   jmp .retngetlex
  2535 00000B69 E90600                   jmp .getlex116
  2536                                  .getlex113:
  2537 00000B6C B82F00                   mov ax, 47
  2538 00000B6F E9C502                   jmp .retngetlex
  2539                                  .getlex116:
  2540                                  
  2541                                  ;-400   if (c == '"') {getstring(c); return T_STRING;}
  2542                                  
  2543                                  .getlex112:
  2544 00000B72 8A46FE                   mov al, [bp-2]
  2545 00000B75 3C22                     cmp al, 34
  2546 00000B77 0F851200                 jne .getlex117
  2547 00000B7B 8A46FE                   mov al, byte [bp-2]
  2548 00000B7E B400                     mov ah, 0
  2549 00000B80 50                       push ax
  2550 00000B81 E889FD                   call getstring
  2551 00000B84 83C402                   add  sp, 2
  2552 00000B87 B80201                   mov ax, 258
  2553 00000B8A E9AA02                   jmp .retngetlex
  2554                                  
  2555                                  ;-401   if (digit(c)) { getdigit(c); return T_CONST; }
  2556                                  
  2557                                  .getlex117:
  2558 00000B8D 8A46FE                   mov al, byte [bp-2]
  2559 00000B90 B400                     mov ah, 0
  2560 00000B92 50                       push ax
  2561 00000B93 E80EF6                   call digit
  2562 00000B96 83C402                   add  sp, 2
  2563 00000B99 08C0                     or  al, al
  2564 00000B9B 0F841200                 je .getlex118
  2565 00000B9F 8A46FE                   mov al, byte [bp-2]
  2566 00000BA2 B400                     mov ah, 0
  2567 00000BA4 50                       push ax
  2568 00000BA5 E88FFC                   call getdigit
  2569 00000BA8 83C402                   add  sp, 2
  2570 00000BAB B80101                   mov ax, 257
  2571 00000BAE E98602                   jmp .retngetlex
  2572                                  
  2573                                  ;-402   if (c==39) { lexval=next();
  2574                                  
  2575                                  .getlex118:
  2576 00000BB1 8A46FE                   mov al, [bp-2]
  2577 00000BB4 3C27                     cmp al, 39
  2578 00000BB6 0F854F00                 jne .getlex119
  2579 00000BBA E85CFC                   call next
  2580 00000BBD A3[2C00]                 mov word [lexval], ax
  2581                                  
  2582                                  ;-403     if (lexval==92) {lexval=next();
  2583                                  
  2584 00000BC0 A1[2C00]                 mov ax, [lexval]
  2585 00000BC3 83F85C                   cmp ax, 92
  2586 00000BC6 0F853600                 jne .getlex120
  2587 00000BCA E84CFC                   call next
  2588 00000BCD A3[2C00]                 mov word [lexval], ax
  2589                                  
  2590                                  ;-404       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  2591                                  
  2592 00000BD0 A1[2C00]                 mov ax, [lexval]
  2593 00000BD3 83F86E                   cmp ax, 110
  2594 00000BD6 0F850600                 jne .getlex121
  2595 00000BDA B80A00                   mov ax, 10
  2596 00000BDD A3[2C00]                 mov word [lexval], ax
  2597                                  .getlex121:
  2598 00000BE0 A1[2C00]                 mov ax, [lexval]
  2599 00000BE3 83F874                   cmp ax, 116
  2600 00000BE6 0F850600                 jne .getlex122
  2601 00000BEA B80900                   mov ax, 9
  2602 00000BED A3[2C00]                 mov word [lexval], ax
  2603                                  
  2604                                  ;-405       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  2605                                  
  2606                                  .getlex122:
  2607 00000BF0 A1[2C00]                 mov ax, [lexval]
  2608 00000BF3 83F830                   cmp ax, 48
  2609 00000BF6 0F850600                 jne .getlex123
  2610 00000BFA B80000                   mov ax, 0
  2611 00000BFD A3[2C00]                 mov word [lexval], ax
  2612                                  .getlex123:
  2613                                  .getlex120:
  2614 00000C00 E816FC                   call next
  2615 00000C03 B80101                   mov ax, 257
  2616 00000C06 E92E02                   jmp .retngetlex
  2617                                  
  2618                                  ;-406   if (alnum(c)) {
  2619                                  
  2620                                  .getlex119:
  2621 00000C09 8A46FE                   mov al, byte [bp-2]
  2622 00000C0C B400                     mov ah, 0
  2623 00000C0E 50                       push ax
  2624 00000C0F E8BCF5                   call alnum
  2625 00000C12 83C402                   add  sp, 2
  2626 00000C15 08C0                     or  al, al
  2627 00000C17 0F841302                 je .getlex124
  2628                                  
  2629                                  ;-407     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  2630                                  
  2631 00000C1B 8D06BB69                 lea  ax, [symbol]
  2632 00000C1F 50                       push ax
  2633 00000C20 8D0620DA                 lea  ax, [symboltemp]
  2634 00000C24 50                       push ax
  2635 00000C25 E80AF6                   call strcpy
  2636 00000C28 83C404                   add  sp, 4
  2637 00000C2B B8BB69                   mov ax, symbol
  2638 00000C2E 8946FC                   mov [bp-4], ax
  2639 00000C31 8A46FE                   mov al, [bp-2]
  2640 00000C34 8B5EFC                   mov  bx, [bp-4]
  2641 00000C37 8807                     mov  [bx], al
  2642 00000C39 FF46FC                   inc  word[bp-4]
  2643                                  
  2644                                  ;-408     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  2645                                  
  2646                                  .getlex125:
  2647 00000C3C A0[2300]                 mov al, byte [thechar]
  2648 00000C3F B400                     mov ah, 0
  2649 00000C41 50                       push ax
  2650 00000C42 E889F5                   call alnum
  2651 00000C45 83C402                   add  sp, 2
  2652 00000C48 08C0                     or  al, al
  2653 00000C4A 0F841300                 je .getlex126
  2654 00000C4E E8C8FB                   call next
  2655 00000C51 8846FE                   mov [bp-2], al
  2656 00000C54 8A46FE                   mov al, [bp-2]
  2657 00000C57 8B5EFC                   mov  bx, [bp-4]
  2658 00000C5A 8807                     mov  [bx], al
  2659 00000C5C FF46FC                   inc  word[bp-4]
  2660                                  
  2661                                  ;-409       *p=0;
  2662                                  
  2663 00000C5F EBDB                     jmp .getlex125
  2664                                  .getlex126:
  2665 00000C61 B80000                   mov ax, 0
  2666 00000C64 8B5EFC                   mov  bx, [bp-4]
  2667 00000C67 8807                     mov  [bx], al
  2668                                  
  2669                                  ;-410     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2670                                  
  2671 00000C69 68[4F0E]                 push getlex_1
  2672 00000C6C 8D06BB69                 lea  ax, [symbol]
  2673 00000C70 50                       push ax
  2674 00000C71 E8F4F5                   call eqstr
  2675 00000C74 83C404                   add  sp, 4
  2676 00000C77 08C0                     or  al, al
  2677 00000C79 0F840600                 je .getlex127
  2678 00000C7D B81302                   mov ax, 531
  2679 00000C80 E9B401                   jmp .retngetlex
  2680                                  
  2681                                  ;-411     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2682                                  
  2683                                  .getlex127:
  2684 00000C83 68[560E]                 push getlex_2
  2685 00000C86 8D06BB69                 lea  ax, [symbol]
  2686 00000C8A 50                       push ax
  2687 00000C8B E8DAF5                   call eqstr
  2688 00000C8E 83C404                   add  sp, 4
  2689 00000C91 08C0                     or  al, al
  2690 00000C93 0F840600                 je .getlex128
  2691 00000C97 B81402                   mov ax, 532
  2692 00000C9A E99A01                   jmp .retngetlex
  2693                                  
  2694                                  ;-412     if (eqstr(symbol,"void"    )) return T_VOID;
  2695                                  
  2696                                  .getlex128:
  2697 00000C9D 68[5F0E]                 push getlex_3
  2698 00000CA0 8D06BB69                 lea  ax, [symbol]
  2699 00000CA4 50                       push ax
  2700 00000CA5 E8C0F5                   call eqstr
  2701 00000CA8 83C404                   add  sp, 4
  2702 00000CAB 08C0                     or  al, al
  2703 00000CAD 0F840600                 je .getlex129
  2704 00000CB1 B81102                   mov ax, 529
  2705 00000CB4 E98001                   jmp .retngetlex
  2706                                  
  2707                                  ;-413     if (eqstr(symbol,"int"     )) return T_INT;
  2708                                  
  2709                                  .getlex129:
  2710 00000CB7 68[640E]                 push getlex_4
  2711 00000CBA 8D06BB69                 lea  ax, [symbol]
  2712 00000CBE 50                       push ax
  2713 00000CBF E8A6F5                   call eqstr
  2714 00000CC2 83C404                   add  sp, 4
  2715 00000CC5 08C0                     or  al, al
  2716 00000CC7 0F840600                 je .getlex130
  2717 00000CCB B80502                   mov ax, 517
  2718 00000CCE E96601                   jmp .retngetlex
  2719                                  
  2720                                  ;-414     if (eqstr(symbol,"long"    )) return T_LONG;
  2721                                  
  2722                                  .getlex130:
  2723 00000CD1 68[680E]                 push getlex_5
  2724 00000CD4 8D06BB69                 lea  ax, [symbol]
  2725 00000CD8 50                       push ax
  2726 00000CD9 E88CF5                   call eqstr
  2727 00000CDC 83C404                   add  sp, 4
  2728 00000CDF 08C0                     or  al, al
  2729 00000CE1 0F840600                 je .getlex131
  2730 00000CE5 B81502                   mov ax, 533
  2731 00000CE8 E94C01                   jmp .retngetlex
  2732                                  
  2733                                  ;-415     if (eqstr(symbol,"char"    )) return T_CHAR;
  2734                                  
  2735                                  .getlex131:
  2736 00000CEB 68[6D0E]                 push getlex_6
  2737 00000CEE 8D06BB69                 lea  ax, [symbol]
  2738 00000CF2 50                       push ax
  2739 00000CF3 E872F5                   call eqstr
  2740 00000CF6 83C404                   add  sp, 4
  2741 00000CF9 08C0                     or  al, al
  2742 00000CFB 0F840600                 je .getlex132
  2743 00000CFF B81202                   mov ax, 530
  2744 00000D02 E93201                   jmp .retngetlex
  2745                                  
  2746                                  ;-416     if (eqstr(symbol,"asm"     )) return T_ASM;
  2747                                  
  2748                                  .getlex132:
  2749 00000D05 68[720E]                 push getlex_7
  2750 00000D08 8D06BB69                 lea  ax, [symbol]
  2751 00000D0C 50                       push ax
  2752 00000D0D E858F5                   call eqstr
  2753 00000D10 83C404                   add  sp, 4
  2754 00000D13 08C0                     or  al, al
  2755 00000D15 0F840600                 je .getlex133
  2756 00000D19 B80602                   mov ax, 518
  2757 00000D1C E91801                   jmp .retngetlex
  2758                                  
  2759                                  ;-417     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2760                                  
  2761                                  .getlex133:
  2762 00000D1F 68[760E]                 push getlex_8
  2763 00000D22 8D06BB69                 lea  ax, [symbol]
  2764 00000D26 50                       push ax
  2765 00000D27 E83EF5                   call eqstr
  2766 00000D2A 83C404                   add  sp, 4
  2767 00000D2D 08C0                     or  al, al
  2768 00000D2F 0F840600                 je .getlex134
  2769 00000D33 B80702                   mov ax, 519
  2770 00000D36 E9FE00                   jmp .retngetlex
  2771                                  
  2772                                  ;-418     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2773                                  
  2774                                  .getlex134:
  2775 00000D39 68[7C0E]                 push getlex_9
  2776 00000D3C 8D06BB69                 lea  ax, [symbol]
  2777 00000D40 50                       push ax
  2778 00000D41 E824F5                   call eqstr
  2779 00000D44 83C404                   add  sp, 4
  2780 00000D47 08C0                     or  al, al
  2781 00000D49 0F840600                 je .getlex135
  2782 00000D4D B80802                   mov ax, 520
  2783 00000D50 E9E400                   jmp .retngetlex
  2784                                  
  2785                                  ;-419     if (eqstr(symbol,"return"  )) return T_RETURN;
  2786                                  
  2787                                  .getlex135:
  2788 00000D53 68[850E]                 push getlex_10
  2789 00000D56 8D06BB69                 lea  ax, [symbol]
  2790 00000D5A 50                       push ax
  2791 00000D5B E80AF5                   call eqstr
  2792 00000D5E 83C404                   add  sp, 4
  2793 00000D61 08C0                     or  al, al
  2794 00000D63 0F840600                 je .getlex136
  2795 00000D67 B80002                   mov ax, 512
  2796 00000D6A E9CA00                   jmp .retngetlex
  2797                                  
  2798                                  ;-420     if (eqstr(symbol,"if"      )) return T_IF;
  2799                                  
  2800                                  .getlex136:
  2801 00000D6D 68[8C0E]                 push getlex_11
  2802 00000D70 8D06BB69                 lea  ax, [symbol]
  2803 00000D74 50                       push ax
  2804 00000D75 E8F0F4                   call eqstr
  2805 00000D78 83C404                   add  sp, 4
  2806 00000D7B 08C0                     or  al, al
  2807 00000D7D 0F840600                 je .getlex137
  2808 00000D81 B80102                   mov ax, 513
  2809 00000D84 E9B000                   jmp .retngetlex
  2810                                  
  2811                                  ;-421     if (eqstr(symbol,"else"    )) return T_ELSE;
  2812                                  
  2813                                  .getlex137:
  2814 00000D87 68[8F0E]                 push getlex_12
  2815 00000D8A 8D06BB69                 lea  ax, [symbol]
  2816 00000D8E 50                       push ax
  2817 00000D8F E8D6F4                   call eqstr
  2818 00000D92 83C404                   add  sp, 4
  2819 00000D95 08C0                     or  al, al
  2820 00000D97 0F840600                 je .getlex138
  2821 00000D9B B80202                   mov ax, 514
  2822 00000D9E E99600                   jmp .retngetlex
  2823                                  
  2824                                  ;-422     if (eqstr(symbol,"while"   )) return T_WHILE;
  2825                                  
  2826                                  .getlex138:
  2827 00000DA1 68[940E]                 push getlex_13
  2828 00000DA4 8D06BB69                 lea  ax, [symbol]
  2829 00000DA8 50                       push ax
  2830 00000DA9 E8BCF4                   call eqstr
  2831 00000DAC 83C404                   add  sp, 4
  2832 00000DAF 08C0                     or  al, al
  2833 00000DB1 0F840600                 je .getlex139
  2834 00000DB5 B80302                   mov ax, 515
  2835 00000DB8 E97C00                   jmp .retngetlex
  2836                                  
  2837                                  ;-423     if (eqstr(symbol,"do"      )) return T_DO;
  2838                                  
  2839                                  .getlex139:
  2840 00000DBB 68[9A0E]                 push getlex_14
  2841 00000DBE 8D06BB69                 lea  ax, [symbol]
  2842 00000DC2 50                       push ax
  2843 00000DC3 E8A2F4                   call eqstr
  2844 00000DC6 83C404                   add  sp, 4
  2845 00000DC9 08C0                     or  al, al
  2846 00000DCB 0F840600                 je .getlex140
  2847 00000DCF B80402                   mov ax, 516
  2848 00000DD2 E96200                   jmp .retngetlex
  2849                                  
  2850                                  ;-424     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2851                                  
  2852                                  .getlex140:
  2853 00000DD5 68[9D0E]                 push getlex_15
  2854 00000DD8 8D06BB69                 lea  ax, [symbol]
  2855 00000DDC 50                       push ax
  2856 00000DDD E888F4                   call eqstr
  2857 00000DE0 83C404                   add  sp, 4
  2858 00000DE3 08C0                     or  al, al
  2859 00000DE5 0F840600                 je .getlex141
  2860 00000DE9 B80902                   mov ax, 521
  2861 00000DEC E94800                   jmp .retngetlex
  2862                                  
  2863                                  ;-425     if (eqstr(symbol,"define"  )) return T_DEFINE;
  2864                                  
  2865                                  .getlex141:
  2866 00000DEF 68[A20E]                 push getlex_16
  2867 00000DF2 8D06BB69                 lea  ax, [symbol]
  2868 00000DF6 50                       push ax
  2869 00000DF7 E86EF4                   call eqstr
  2870 00000DFA 83C404                   add  sp, 4
  2871 00000DFD 08C0                     or  al, al
  2872 00000DFF 0F840600                 je .getlex142
  2873 00000E03 B8FF01                   mov ax, 511
  2874 00000E06 E92E00                   jmp .retngetlex
  2875                                  
  2876                                  ;-426     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  2877                                  
  2878                                  .getlex142:
  2879 00000E09 E85602                   call convertdefine
  2880 00000E0C 08C0                     or  al, al
  2881 00000E0E 0F841600                 je .getlex143
  2882 00000E12 8D0620DA                 lea  ax, [symboltemp]
  2883 00000E16 50                       push ax
  2884 00000E17 8D06BB69                 lea  ax, [symbol]
  2885 00000E1B 50                       push ax
  2886 00000E1C E813F4                   call strcpy
  2887 00000E1F 83C404                   add  sp, 4
  2888 00000E22 B80101                   mov ax, 257
  2889 00000E25 E90F00                   jmp .retngetlex
  2890                                  
  2891                                  ;-427     return T_NAME; } error1("Input item not recognized"); }
  2892                                  
  2893                                  .getlex143:
  2894 00000E28 B80001                   mov ax, 256
  2895 00000E2B E90900                   jmp .retngetlex
  2896                                  .getlex124:
  2897 00000E2E 68[A90E]                 push getlex_17
  2898 00000E31 E8D5F7                   call error1
  2899 00000E34 83C402                   add  sp, 2
  2900                                  
  2901                                  ;-428 
  2902                                  
  2903                                  
  2904                                  ;-429 
  2905                                  
  2906                                  
  2907                                  ;-430 int istoken(int t) {
  2908                                  
  2909 00000E37 C9                       .retngetlex: LEAVE
  2910 00000E38 C3                       ret
  2911 00000E39 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  2912 00000E42 3A252D3E3C3D2B2126-
  2913 00000E4B 7C233F00           
  2914 00000E4F 7369676E656400          getlex_1 db "signed",0
  2915 00000E56 756E7369676E656400      getlex_2 db "unsigned",0
  2916 00000E5F 766F696400              getlex_3 db "void",0
  2917 00000E64 696E7400                getlex_4 db "int",0
  2918 00000E68 6C6F6E6700              getlex_5 db "long",0
  2919 00000E6D 6368617200              getlex_6 db "char",0
  2920 00000E72 61736D00                getlex_7 db "asm",0
  2921 00000E76 5F5F61736D00            getlex_8 db "__asm",0
  2922 00000E7C 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  2923 00000E85 72657475726E00          getlex_10 db "return",0
  2924 00000E8C 696600                  getlex_11 db "if",0
  2925 00000E8F 656C736500              getlex_12 db "else",0
  2926 00000E94 7768696C6500            getlex_13 db "while",0
  2927 00000E9A 646F00                  getlex_14 db "do",0
  2928 00000E9D 676F746F00              getlex_15 db "goto",0
  2929 00000EA2 646566696E6500          getlex_16 db "define",0
  2930 00000EA9 496E70757420697465-     getlex_17 db "Input item not recognized",0
  2931 00000EB2 6D206E6F7420726563-
  2932 00000EBB 6F676E697A656400   
  2933                                  ENDP
  2934                                  
  2935                                  istoken: PROC
  2936                                  
  2937                                  ;-431     if (token == t) {
  2938                                  ;
  2939 00000EC3 C8000000                 ENTER  0,0
  2940 00000EC7 A1[1E00]                 mov ax, [token]
  2941 00000ECA 3B4604                   cmp ax, [bp+4]
  2942 00000ECD 0F850C00                 jne .istoken144
  2943                                  
  2944                                  ;-432         token=getlex();
  2945                                  
  2946 00000ED1 E870FA                   call getlex
  2947 00000ED4 A3[1E00]                 mov word [token], ax
  2948                                  
  2949                                  ;-433         return 1;
  2950                                  
  2951 00000ED7 B80100                   mov ax, 1
  2952 00000EDA E90600                   jmp .retnistoken
  2953                                  
  2954                                  ;-434     }
  2955                                  
  2956                                  
  2957                                  ;-435     return 0;
  2958                                  
  2959                                  .istoken144:
  2960 00000EDD B80000                   mov ax, 0
  2961 00000EE0 E90000                   jmp .retnistoken
  2962                                  
  2963                                  ;-436 }
  2964                                  
  2965                                  
  2966                                  ;-437 int expect(int t) {
  2967                                  
  2968 00000EE3 C9                       .retnistoken: LEAVE
  2969 00000EE4 C3                       ret
  2970                                  ENDP
  2971                                  
  2972                                  expect: PROC
  2973                                  
  2974                                  ;-438     if (istoken(t)==0) {
  2975                                  ;
  2976 00000EE5 C8000000                 ENTER  0,0
  2977 00000EE9 FF7604                   push word [bp+4]
  2978 00000EEC E8D4FF                   call istoken
  2979 00000EEF 83C402                   add  sp, 2
  2980 00000EF2 83F800                   cmp ax, 0
  2981 00000EF5 0F852F00                 jne .expect145
  2982                                  
  2983                                  ;-439         *cloc=0;
  2984                                  
  2985 00000EF9 B80000                   mov ax, 0
  2986 00000EFC 8B1E[1800]               mov  bx, [cloc]
  2987 00000F00 8807                     mov  [bx], al
  2988                                  
  2989                                  ;-440         prs(co);
  2990                                  
  2991 00000F02 8D06A861                 lea  ax, [co]
  2992 00000F06 50                       push ax
  2993 00000F07 E8DEF4                   call prs
  2994 00000F0A 83C402                   add  sp, 2
  2995                                  
  2996                                  ;-441         prs("\nExpected ASCII(dez): ");
  2997                                  
  2998 00000F0D 68[2A0F]                 push expect_0
  2999 00000F10 E8D5F4                   call prs
  3000 00000F13 83C402                   add  sp, 2
  3001                                  
  3002                                  ;-442         pint1(t);
  3003                                  
  3004 00000F16 FF7604                   push word [bp+4]
  3005 00000F19 E8D1F5                   call pint1
  3006 00000F1C 83C402                   add  sp, 2
  3007                                  
  3008                                  ;-443         error1(" not found");
  3009                                  
  3010 00000F1F 68[420F]                 push expect_1
  3011 00000F22 E8E4F6                   call error1
  3012 00000F25 83C402                   add  sp, 2
  3013                                  
  3014                                  ;-444     }
  3015                                  
  3016                                  
  3017                                  ;-445 }
  3018                                  
  3019                                  .expect145:
  3020                                  
  3021                                  ;-446 
  3022                                  
  3023                                  
  3024                                  ;-447 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  3025 00000F28 C9                       LEAVE
  3026 00000F29 C3                       ret
  3027 00000F2A 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3028 00000F33 642041534349492864-
  3029 00000F3C 657A293A2000       
  3030 00000F42 206E6F7420666F756E-     expect_1 db " not found",0
  3031 00000F4B 6400               
  3032                                  ENDP
  3033                                  
  3034                                  adrF: PROC;
  3035 00000F4D C8000000                 ENTER  0,0
  3036 00000F51 8B4606                   mov ax, [bp+6]
  3037 00000F54 C1E004                   shl ax, 4
  3038                                  
  3039                                  ;-448   __asm{ add ax, [bp+4]  ; offset s } }
  3040                                  
  3041 00000F57 034604                   add ax, [bp+4]  ; offset s 
  3042                                  
  3043                                  ;-449 
  3044                                  
  3045                                  
  3046                                  ;-450 int adrofname(unsigned int i) { adrF(GNameField, i); }
  3047 00000F5A C9                       LEAVE
  3048 00000F5B C3                       ret
  3049                                  ENDP
  3050                                  
  3051                                  adrofname: PROC;
  3052 00000F5C C8000000                 ENTER  0,0
  3053 00000F60 FF7604                   push word [bp+4]
  3054 00000F63 8D069075                 lea  ax, [GNameField]
  3055 00000F67 50                       push ax
  3056 00000F68 E8E2FF                   call adrF
  3057 00000F6B 83C404                   add  sp, 4
  3058                                  
  3059                                  ;-451 
  3060                                  
  3061                                  
  3062                                  ;-452 int printName(unsigned int i) {int j;
  3063 00000F6E C9                       LEAVE
  3064 00000F6F C3                       ret
  3065                                  ENDP
  3066                                  
  3067                                  printName: PROC
  3068                                  
  3069                                  ;-453   if (i < LSTART) { i=adrofname(i); prs(i); }
  3070                                  ;
  3071 00000F70 C8020000                 ENTER  2,0
  3072 00000F74 8B4604                   mov ax, [bp+4]
  3073 00000F77 3DC800                   cmp ax, 200
  3074 00000F7A 0F8D1800                 jge .printName146
  3075 00000F7E FF7604                   push word [bp+4]
  3076 00000F81 E8D8FF                   call adrofname
  3077 00000F84 83C402                   add  sp, 2
  3078 00000F87 894604                   mov [bp+4], ax
  3079 00000F8A FF7604                   push word [bp+4]
  3080 00000F8D E858F4                   call prs
  3081 00000F90 83C402                   add  sp, 2
  3082                                  
  3083                                  ;-454   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  3084                                  
  3085 00000F93 E93800                   jmp .printName147
  3086                                  .printName146:
  3087 00000F96 68[D00F]                 push printName_0
  3088 00000F99 E84CF4                   call prs
  3089 00000F9C 83C402                   add  sp, 2
  3090 00000F9F 8B5E04                   mov bx, [bp+4]
  3091 00000FA2 D1E3                     shl bx, 1
  3092 00000FA4 8B873873                 mov ax, [GData + bx]
  3093 00000FA8 8946FE                   mov [bp-2], ax
  3094 00000FAB 8B46FE                   mov ax, [bp-2]
  3095 00000FAE 83F800                   cmp ax, 0
  3096 00000FB1 0F8E0800                 jle .printName148
  3097 00000FB5 6A2B                     push 43
  3098 00000FB7 E8D5F3                   call prc
  3099 00000FBA 83C402                   add  sp, 2
  3100                                  .printName148:
  3101 00000FBD FF76FE                   push word [bp-2]
  3102 00000FC0 E82AF5                   call pint1
  3103 00000FC3 83C402                   add  sp, 2
  3104 00000FC6 6A5D                     push 93
  3105 00000FC8 E8C4F3                   call prc
  3106 00000FCB 83C402                   add  sp, 2
  3107                                  
  3108                                  ;-455 }
  3109                                  
  3110                                  .printName147:
  3111                                  
  3112                                  ;-456 
  3113                                  
  3114                                  
  3115                                  ;-457 int a(unsigned int i) { printName(i);//address
  3116 00000FCE C9                       LEAVE
  3117 00000FCF C3                       ret
  3118 00000FD0 5B627000                printName_0 db "[bp",0
  3119                                  ENDP
  3120                                  
  3121                                  a: PROC;
  3122 00000FD4 C8000000                 ENTER  0,0
  3123 00000FD8 FF7604                   push word [bp+4]
  3124 00000FDB E892FF                   call printName
  3125 00000FDE 83C402                   add  sp, 2
  3126                                  
  3127                                  ;-458 }
  3128                                  
  3129                                  
  3130                                  ;-459 int v(unsigned int i) {//value
  3131 00000FE1 C9                       LEAVE
  3132 00000FE2 C3                       ret
  3133                                  ENDP
  3134                                  
  3135                                  v: PROC
  3136                                  
  3137                                  ;-460     if (i < LSTART) prc('[');
  3138                                  ;
  3139 00000FE3 C8000000                 ENTER  0,0
  3140 00000FE7 8B4604                   mov ax, [bp+4]
  3141 00000FEA 3DC800                   cmp ax, 200
  3142 00000FED 0F8D0800                 jge .v149
  3143 00000FF1 6A5B                     push 91
  3144 00000FF3 E899F3                   call prc
  3145 00000FF6 83C402                   add  sp, 2
  3146                                  
  3147                                  ;-461     printName(i);
  3148                                  
  3149                                  .v149:
  3150 00000FF9 FF7604                   push word [bp+4]
  3151 00000FFC E871FF                   call printName
  3152 00000FFF 83C402                   add  sp, 2
  3153                                  
  3154                                  ;-462     if (i < LSTART) prc(']');
  3155                                  
  3156 00001002 8B4604                   mov ax, [bp+4]
  3157 00001005 3DC800                   cmp ax, 200
  3158 00001008 0F8D0800                 jge .v150
  3159 0000100C 6A5D                     push 93
  3160 0000100E E87EF3                   call prc
  3161 00001011 83C402                   add  sp, 2
  3162                                  
  3163                                  ;-463 }
  3164                                  
  3165                                  .v150:
  3166                                  
  3167                                  ;-464 int checknamelen() {
  3168 00001014 C9                       LEAVE
  3169 00001015 C3                       ret
  3170                                  ENDP
  3171                                  
  3172                                  checknamelen: PROC
  3173                                  
  3174                                  ;-465     int i;
  3175                                  
  3176                                  
  3177                                  ;-466     i=strlen(symbol);
  3178                                  ;
  3179 00001016 C8020000                 ENTER  2,0
  3180 0000101A 8D06BB69                 lea  ax, [symbol]
  3181 0000101E 50                       push ax
  3182 0000101F E8E8F1                   call strlen
  3183 00001022 83C402                   add  sp, 2
  3184 00001025 8946FE                   mov [bp-2], ax
  3185                                  
  3186                                  ;-467     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3187                                  
  3188 00001028 8B46FE                   mov ax, [bp-2]
  3189 0000102B 83F80F                   cmp ax, 15
  3190 0000102E 0F8E0900                 jle .checknamelen151
  3191 00001032 68[3D10]                 push checknamelen_0
  3192 00001035 E8D1F5                   call error1
  3193 00001038 83C402                   add  sp, 2
  3194                                  
  3195                                  ;-468 }
  3196                                  
  3197                                  .checknamelen151:
  3198                                  
  3199                                  ;-469 int convertdefine() { int i; int j;   i=0;
  3200 0000103B C9                       LEAVE
  3201 0000103C C3                       ret
  3202 0000103D 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3203 00001046 20697320746F6F206C-
  3204 0000104F 6F6E6720696E206368-
  3205 00001058 617261637465727329-
  3206 00001061 00                 
  3207                                  ENDP
  3208                                  
  3209                                  convertdefine: PROC;
  3210 00001062 C8040000                 ENTER  4,0
  3211 00001066 B80000                   mov ax, 0
  3212 00001069 8946FE                   mov [bp-2], ax
  3213                                  
  3214                                  ;-470   while (i < GTop) {
  3215                                  
  3216                                  .convertdefine152:
  3217 0000106C 8B46FE                   mov ax, [bp-2]
  3218 0000106F 3B06[3900]               cmp ax, [GTop]
  3219 00001073 0F8D4400                 jge .convertdefine153
  3220                                  
  3221                                  ;-471    j=adrofname(i);
  3222                                  
  3223 00001077 FF76FE                   push word [bp-2]
  3224 0000107A E8DFFE                   call adrofname
  3225 0000107D 83C402                   add  sp, 2
  3226 00001080 8946FC                   mov [bp-4], ax
  3227                                  
  3228                                  ;-472    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  3229                                  
  3230 00001083 FF76FC                   push word [bp-4]
  3231 00001086 8D06BB69                 lea  ax, [symbol]
  3232 0000108A 50                       push ax
  3233 0000108B E8DAF1                   call eqstr
  3234 0000108E 83C404                   add  sp, 4
  3235 00001091 08C0                     or  al, al
  3236 00001093 0F841F00                 je .convertdefine154
  3237 00001097 8B5EFE                   mov bx, [bp-2]
  3238 0000109A 8A87046B                 mov al, [GType + bx]
  3239 0000109E 3C23                     cmp al, 35
  3240 000010A0 0F851200                 jne .convertdefine155
  3241 000010A4 8B5EFE                   mov bx, [bp-2]
  3242 000010A7 D1E3                     shl bx, 1
  3243 000010A9 8B873873                 mov ax, [GData + bx]
  3244 000010AD A3[2C00]                 mov word [lexval], ax
  3245                                  
  3246                                  ;-473    return T_CONST; } }
  3247                                  
  3248 000010B0 B80101                   mov ax, 257
  3249 000010B3 E90B00                   jmp .retnconvertdefine
  3250                                  .convertdefine155:
  3251                                  
  3252                                  ;-474    i++; }
  3253                                  
  3254                                  .convertdefine154:
  3255 000010B6 FF46FE                   inc  word[bp-2]
  3256                                  
  3257                                  ;-475    return 0; }
  3258                                  
  3259 000010B9 EBB1                     jmp .convertdefine152
  3260                                  .convertdefine153:
  3261 000010BB B80000                   mov ax, 0
  3262 000010BE E90000                   jmp .retnconvertdefine
  3263                                  
  3264                                  ;-476 
  3265                                  
  3266                                  
  3267                                  ;-477 int checkName() { unsigned int i; unsigned int j;
  3268                                  
  3269 000010C1 C9                       .retnconvertdefine: LEAVE
  3270 000010C2 C3                       ret
  3271                                  ENDP
  3272                                  
  3273                                  checkName: PROC
  3274                                  
  3275                                  ;-478   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  3276                                  ;
  3277 000010C3 C8040000                 ENTER  4,0
  3278 000010C7 B8C800                   mov ax, 200
  3279 000010CA 8946FE                   mov [bp-2], ax
  3280                                  .checkName156:
  3281 000010CD 8B46FE                   mov ax, [bp-2]
  3282 000010D0 3B06[3B00]               cmp ax, [LTop]
  3283 000010D4 0F8D2B00                 jge .checkName157
  3284 000010D8 FF76FE                   push word [bp-2]
  3285 000010DB E87EFE                   call adrofname
  3286 000010DE 83C402                   add  sp, 2
  3287 000010E1 8946FC                   mov [bp-4], ax
  3288 000010E4 FF76FC                   push word [bp-4]
  3289 000010E7 8D06BB69                 lea  ax, [symbol]
  3290 000010EB 50                       push ax
  3291 000010EC E879F1                   call eqstr
  3292 000010EF 83C404                   add  sp, 4
  3293 000010F2 08C0                     or  al, al
  3294 000010F4 0F840600                 je .checkName158
  3295 000010F8 8B46FE                   mov ax, [bp-2]
  3296 000010FB E94700                   jmp .retncheckName
  3297                                  .checkName158:
  3298 000010FE FF46FE                   inc  word[bp-2]
  3299                                  
  3300                                  ;-479   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  3301                                  
  3302 00001101 EBCA                     jmp .checkName156
  3303                                  .checkName157:
  3304 00001103 B80100                   mov ax, 1
  3305 00001106 8946FE                   mov [bp-2], ax
  3306                                  .checkName159:
  3307 00001109 8B46FE                   mov ax, [bp-2]
  3308 0000110C 3B06[3900]               cmp ax, [GTop]
  3309 00001110 0F8D2B00                 jge .checkName160
  3310 00001114 FF76FE                   push word [bp-2]
  3311 00001117 E842FE                   call adrofname
  3312 0000111A 83C402                   add  sp, 2
  3313 0000111D 8946FC                   mov [bp-4], ax
  3314 00001120 FF76FC                   push word [bp-4]
  3315 00001123 8D06BB69                 lea  ax, [symbol]
  3316 00001127 50                       push ax
  3317 00001128 E83DF1                   call eqstr
  3318 0000112B 83C404                   add  sp, 4
  3319 0000112E 08C0                     or  al, al
  3320 00001130 0F840600                 je .checkName161
  3321 00001134 8B46FE                   mov ax, [bp-2]
  3322 00001137 E90B00                   jmp .retncheckName
  3323                                  .checkName161:
  3324 0000113A FF46FE                   inc  word[bp-2]
  3325                                  
  3326                                  ;-480   return 0;
  3327                                  
  3328 0000113D EBCA                     jmp .checkName159
  3329                                  .checkName160:
  3330 0000113F B80000                   mov ax, 0
  3331 00001142 E90000                   jmp .retncheckName
  3332                                  
  3333                                  ;-481 }
  3334                                  
  3335                                  
  3336                                  ;-482 int searchname() { unsigned int i;
  3337                                  
  3338 00001145 C9                       .retncheckName: LEAVE
  3339 00001146 C3                       ret
  3340                                  ENDP
  3341                                  
  3342                                  searchname: PROC
  3343                                  
  3344                                  ;-483   i=checkName(); if (i == 0) error1("Variable unknown");
  3345                                  ;
  3346 00001147 C8020000                 ENTER  2,0
  3347 0000114B E875FF                   call checkName
  3348 0000114E 8946FE                   mov [bp-2], ax
  3349 00001151 8B46FE                   mov ax, [bp-2]
  3350 00001154 83F800                   cmp ax, 0
  3351 00001157 0F850900                 jne .searchname162
  3352 0000115B 68[8111]                 push searchname_0
  3353 0000115E E8A8F4                   call error1
  3354 00001161 83C402                   add  sp, 2
  3355                                  
  3356                                  ;-484   GUsed[i]=GUsed[i] + 1; return i;
  3357                                  
  3358                                  .searchname162:
  3359 00001164 8B5EFE                   mov bx, [bp-2]
  3360 00001167 D1E3                     shl bx, 1
  3361 00001169 8B87E070                 mov ax, [GUsed + bx]
  3362 0000116D 83C001                   add ax, 1
  3363 00001170 8B5EFE                   mov bx, [bp-2]
  3364 00001173 D1E3                     shl bx, 1
  3365 00001175 8987E070                 mov [GUsed+bx], ax
  3366 00001179 8B46FE                   mov ax, [bp-2]
  3367 0000117C E90000                   jmp .retnsearchname
  3368                                  
  3369                                  ;-485 }
  3370                                  
  3371                                  
  3372                                  ;-486 int name1() {
  3373                                  
  3374 0000117F C9                       .retnsearchname: LEAVE
  3375 00001180 C3                       ret
  3376 00001181 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3377 0000118A 756E6B6E6F776E00   
  3378                                  ENDP
  3379                                  
  3380                                  name1: PROC
  3381                                  
  3382                                  ;-487     if (token!=T_NAME) error1("Name expected");
  3383                                  
  3384 00001192 A1[1E00]                 mov ax, [token]
  3385 00001195 3D0001                   cmp ax, 256
  3386 00001198 0F840900                 je  .name1163
  3387 0000119C 68[AC11]                 push name1_0
  3388 0000119F E867F4                   call error1
  3389 000011A2 83C402                   add  sp, 2
  3390                                  
  3391                                  ;-488     token=getlex();
  3392                                  
  3393                                  .name1163:
  3394 000011A5 E89CF7                   call getlex
  3395 000011A8 A3[1E00]                 mov word [token], ax
  3396                                  
  3397                                  ;-489 }
  3398                                  
  3399                                  
  3400                                  ;-490 int typeName() { int m; //0=V,1=*,2=&
  3401                                  
  3402 000011AB C3                       ret
  3403 000011AC 4E616D652065787065-     name1_0 db "Name expected",0
  3404 000011B5 6374656400         
  3405                                  ENDP
  3406                                  
  3407                                  typeName: PROC
  3408                                  
  3409                                  ;-491     issign='S';
  3410                                  ;
  3411 000011BA C8020000                 ENTER  2,0
  3412 000011BE B85300                   mov ax, 83
  3413 000011C1 A2[3300]                 mov byte [issign], al
  3414                                  
  3415                                  ;-492     if(istoken(T_SIGNED))   issign='S';
  3416                                  
  3417 000011C4 681302                   push 531
  3418 000011C7 E8F9FC                   call istoken
  3419 000011CA 83C402                   add  sp, 2
  3420 000011CD 08C0                     or  al, al
  3421 000011CF 0F840600                 je .typeName164
  3422 000011D3 B85300                   mov ax, 83
  3423 000011D6 A2[3300]                 mov byte [issign], al
  3424                                  
  3425                                  ;-493     if(istoken(T_UNSIGNED)) issign='U';
  3426                                  
  3427                                  .typeName164:
  3428 000011D9 681402                   push 532
  3429 000011DC E8E4FC                   call istoken
  3430 000011DF 83C402                   add  sp, 2
  3431 000011E2 08C0                     or  al, al
  3432 000011E4 0F840600                 je .typeName165
  3433 000011E8 B85500                   mov ax, 85
  3434 000011EB A2[3300]                 mov byte [issign], al
  3435                                  
  3436                                  ;-494     iswidth=2;
  3437                                  
  3438                                  .typeName165:
  3439 000011EE B80200                   mov ax, 2
  3440 000011F1 A2[3600]                 mov byte [iswidth], al
  3441                                  
  3442                                  ;-495     if(istoken(T_VOID))     iswidth=0;
  3443                                  
  3444 000011F4 681102                   push 529
  3445 000011F7 E8C9FC                   call istoken
  3446 000011FA 83C402                   add  sp, 2
  3447 000011FD 08C0                     or  al, al
  3448 000011FF 0F840600                 je .typeName166
  3449 00001203 B80000                   mov ax, 0
  3450 00001206 A2[3600]                 mov byte [iswidth], al
  3451                                  
  3452                                  ;-496     if(istoken(T_CHAR))     iswidth=1;
  3453                                  
  3454                                  .typeName166:
  3455 00001209 681202                   push 530
  3456 0000120C E8B4FC                   call istoken
  3457 0000120F 83C402                   add  sp, 2
  3458 00001212 08C0                     or  al, al
  3459 00001214 0F840600                 je .typeName167
  3460 00001218 B80100                   mov ax, 1
  3461 0000121B A2[3600]                 mov byte [iswidth], al
  3462                                  
  3463                                  ;-497     if(istoken(T_INT))      iswidth=2;
  3464                                  
  3465                                  .typeName167:
  3466 0000121E 680502                   push 517
  3467 00001221 E89FFC                   call istoken
  3468 00001224 83C402                   add  sp, 2
  3469 00001227 08C0                     or  al, al
  3470 00001229 0F840600                 je .typeName168
  3471 0000122D B80200                   mov ax, 2
  3472 00001230 A2[3600]                 mov byte [iswidth], al
  3473                                  
  3474                                  ;-498     if(istoken(T_LONG))     iswidth=4;
  3475                                  
  3476                                  .typeName168:
  3477 00001233 681502                   push 533
  3478 00001236 E88AFC                   call istoken
  3479 00001239 83C402                   add  sp, 2
  3480 0000123C 08C0                     or  al, al
  3481 0000123E 0F840600                 je .typeName169
  3482 00001242 B80400                   mov ax, 4
  3483 00001245 A2[3600]                 mov byte [iswidth], al
  3484                                  
  3485                                  ;-499     istype='V';
  3486                                  
  3487                                  .typeName169:
  3488 00001248 B85600                   mov ax, 86
  3489 0000124B A2[3000]                 mov byte [istype], al
  3490                                  
  3491                                  ;-500     m=0;
  3492                                  
  3493 0000124E B80000                   mov ax, 0
  3494 00001251 8946FE                   mov [bp-2], ax
  3495                                  
  3496                                  ;-501     if(istoken('*'))  {istype='*'; m=1;}
  3497                                  
  3498 00001254 6A2A                     push 42
  3499 00001256 E86AFC                   call istoken
  3500 00001259 83C402                   add  sp, 2
  3501 0000125C 08C0                     or  al, al
  3502 0000125E 0F840C00                 je .typeName170
  3503 00001262 B82A00                   mov ax, 42
  3504 00001265 A2[3000]                 mov byte [istype], al
  3505 00001268 B80100                   mov ax, 1
  3506 0000126B 8946FE                   mov [bp-2], ax
  3507                                  
  3508                                  ;-502     if(istoken('&'))  {istype='&'; m=2;}
  3509                                  
  3510                                  .typeName170:
  3511 0000126E 6A26                     push 38
  3512 00001270 E850FC                   call istoken
  3513 00001273 83C402                   add  sp, 2
  3514 00001276 08C0                     or  al, al
  3515 00001278 0F840C00                 je .typeName171
  3516 0000127C B82600                   mov ax, 38
  3517 0000127F A2[3000]                 mov byte [istype], al
  3518 00001282 B80200                   mov ax, 2
  3519 00001285 8946FE                   mov [bp-2], ax
  3520                                  
  3521                                  ;-503     name1();
  3522                                  
  3523                                  .typeName171:
  3524 00001288 E807FF                   call name1
  3525                                  
  3526                                  ;-504     return m;
  3527                                  
  3528 0000128B 8B46FE                   mov ax, [bp-2]
  3529 0000128E E90000                   jmp .retntypeName
  3530                                  
  3531                                  ;-505 }
  3532                                  
  3533                                  
  3534                                  ;-506 int gettypes(int i) {int j; char c;
  3535                                  
  3536 00001291 C9                       .retntypeName: LEAVE
  3537 00001292 C3                       ret
  3538                                  ENDP
  3539                                  
  3540                                  gettypes: PROC
  3541                                  
  3542                                  ;-507   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3543                                  ;
  3544 00001293 C8040000                 ENTER  4,0
  3545 00001297 8B5E04                   mov bx, [bp+4]
  3546 0000129A 8A87306C                 mov al, [GSign + bx]
  3547 0000129E 8846FC                   mov [bp-4], al
  3548 000012A1 8A46FC                   mov al, [bp-4]
  3549 000012A4 3C53                     cmp al, 83
  3550 000012A6 0F850900                 jne .gettypes172
  3551 000012AA B80100                   mov ax, 1
  3552 000012AD A3[3100]                 mov word [signi], ax
  3553 000012B0 E90600                   jmp .gettypes173
  3554                                  .gettypes172:
  3555 000012B3 B80000                   mov ax, 0
  3556 000012B6 A3[3100]                 mov word [signi], ax
  3557                                  
  3558                                  ;-508   c=GWidth[i]; widthi=0;wi=0;
  3559                                  
  3560                                  .gettypes173:
  3561 000012B9 8B5E04                   mov bx, [bp+4]
  3562 000012BC 8A875C6D                 mov al, [GWidth + bx]
  3563 000012C0 8846FC                   mov [bp-4], al
  3564 000012C3 B80000                   mov ax, 0
  3565 000012C6 A3[3400]                 mov word [widthi], ax
  3566 000012C9 B80000                   mov ax, 0
  3567 000012CC A3[3700]                 mov word [wi], ax
  3568                                  
  3569                                  ;-509   if (c==1) {widthi=1;wi=1;}
  3570                                  
  3571 000012CF 8A46FC                   mov al, [bp-4]
  3572 000012D2 3C01                     cmp al, 1
  3573 000012D4 0F850C00                 jne .gettypes174
  3574 000012D8 B80100                   mov ax, 1
  3575 000012DB A3[3400]                 mov word [widthi], ax
  3576 000012DE B80100                   mov ax, 1
  3577 000012E1 A3[3700]                 mov word [wi], ax
  3578                                  
  3579                                  ;-510   if (c==2) {widthi=2;wi=2;}
  3580                                  
  3581                                  .gettypes174:
  3582 000012E4 8A46FC                   mov al, [bp-4]
  3583 000012E7 3C02                     cmp al, 2
  3584 000012E9 0F850C00                 jne .gettypes175
  3585 000012ED B80200                   mov ax, 2
  3586 000012F0 A3[3400]                 mov word [widthi], ax
  3587 000012F3 B80200                   mov ax, 2
  3588 000012F6 A3[3700]                 mov word [wi], ax
  3589                                  
  3590                                  ;-511   if (c==4) {widthi=4;wi=4;}
  3591                                  
  3592                                  .gettypes175:
  3593 000012F9 8A46FC                   mov al, [bp-4]
  3594 000012FC 3C04                     cmp al, 4
  3595 000012FE 0F850C00                 jne .gettypes176
  3596 00001302 B80400                   mov ax, 4
  3597 00001305 A3[3400]                 mov word [widthi], ax
  3598 00001308 B80400                   mov ax, 4
  3599 0000130B A3[3700]                 mov word [wi], ax
  3600                                  
  3601                                  ;-512   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3602                                  
  3603                                  .gettypes176:
  3604 0000130E 8B5E04                   mov bx, [bp+4]
  3605 00001311 8A87046B                 mov al, [GType + bx]
  3606 00001315 8846FC                   mov [bp-4], al
  3607 00001318 B80000                   mov ax, 0
  3608 0000131B A3[2E00]                 mov word [typei], ax
  3609 0000131E 8A46FC                   mov al, [bp-4]
  3610 00001321 3C2A                     cmp al, 42
  3611 00001323 0F850C00                 jne .gettypes177
  3612 00001327 B80100                   mov ax, 1
  3613 0000132A A3[2E00]                 mov word [typei], ax
  3614 0000132D B80200                   mov ax, 2
  3615 00001330 A3[3700]                 mov word [wi], ax
  3616                                  
  3617                                  ;-513   if (c=='&')  typei=2;
  3618                                  
  3619                                  .gettypes177:
  3620 00001333 8A46FC                   mov al, [bp-4]
  3621 00001336 3C26                     cmp al, 38
  3622 00001338 0F850600                 jne .gettypes178
  3623 0000133C B80200                   mov ax, 2
  3624 0000133F A3[2E00]                 mov word [typei], ax
  3625                                  
  3626                                  ;-514   return i; }
  3627                                  
  3628                                  .gettypes178:
  3629 00001342 8B4604                   mov ax, [bp+4]
  3630 00001345 E90000                   jmp .retngettypes
  3631                                  
  3632                                  ;-515 
  3633                                  
  3634                                  
  3635                                  ;-516 int storeCall1() {//todo
  3636                                  
  3637 00001348 C9                       .retngettypes: LEAVE
  3638 00001349 C3                       ret
  3639                                  ENDP
  3640                                  
  3641                                  storeCall1: PROC
  3642                                  
  3643                                  ;-517     unsigned int i;
  3644                                  
  3645                                  
  3646                                  ;-518     CTop++;
  3647                                  ;
  3648 0000134A C8020000                 ENTER  2,0
  3649 0000134E FF06[4300]               inc  word[CTop]
  3650                                  
  3651                                  ;-519     if (CTop >= CALLMAX) error1("too many calls");
  3652                                  
  3653 00001352 A1[4300]                 mov ax, [CTop]
  3654 00001355 3DDC05                   cmp ax, 1500 ;unsigned : 1
  3655 00001358 0F8C0900                 jl  .storeCall1179
  3656 0000135C 68[B113]                 push storeCall1_0
  3657 0000135F E8A7F2                   call error1
  3658 00001362 83C402                   add  sp, 2
  3659                                  
  3660                                  ;-520     i = CNamePtr - &CNameField;
  3661                                  
  3662                                  .storeCall1179:
  3663 00001365 A1[3F00]                 mov ax, [CNamePtr]
  3664 00001368 2D80B2                   sub ax, CNameField
  3665 0000136B 8946FE                   mov [bp-2], ax
  3666                                  
  3667                                  ;-521     if (i >= CNAMEMAX) error1("too many call names");
  3668                                  
  3669 0000136E 8B46FE                   mov ax, [bp-2]
  3670 00001371 3D1027                   cmp ax, 10000 ;unsigned : 0
  3671 00001374 0F820900                 jb  .storeCall1180
  3672 00001378 68[C013]                 push storeCall1_1
  3673 0000137B E88BF2                   call error1
  3674 0000137E 83C402                   add  sp, 2
  3675                                  
  3676                                  ;-522     CType[CTop]=0;
  3677                                  
  3678                                  .storeCall1180:
  3679 00001381 B80000                   mov ax, 0
  3680 00001384 8B1E[4300]               mov bx, [CTop]
  3681 00001388 8887ECA0                 mov [CType+bx], al
  3682                                  
  3683                                  ;-523     CAdr [CTop]=CNamePtr;
  3684                                  
  3685 0000138C A1[3F00]                 mov ax, [CNamePtr]
  3686 0000138F 8B1E[4300]               mov bx, [CTop]
  3687 00001393 D1E3                     shl bx, 1
  3688 00001395 8987C8A6                 mov [CAdr+bx], ax
  3689                                  
  3690                                  ;-524     CNamePtr=strcpy(CNamePtr, symbol);
  3691                                  
  3692 00001399 8D06BB69                 lea  ax, [symbol]
  3693 0000139D 50                       push ax
  3694 0000139E FF36[3F00]               push word [CNamePtr]
  3695 000013A2 E88DEE                   call strcpy
  3696 000013A5 83C404                   add  sp, 4
  3697 000013A8 A3[3F00]                 mov word [CNamePtr], ax
  3698                                  
  3699                                  ;-525     CNamePtr++;
  3700                                  
  3701 000013AB FF06[3F00]               inc  word[CNamePtr]
  3702                                  
  3703                                  ;-526 }
  3704                                  
  3705                                  
  3706                                  ;-527 
  3707                                  
  3708                                  
  3709                                  ;-528 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  3710 000013AF C9                       LEAVE
  3711 000013B0 C3                       ret
  3712 000013B1 746F6F206D616E7920-     storeCall1_0 db "too many calls",0
  3713 000013BA 63616C6C7300       
  3714 000013C0 746F6F206D616E7920-     storeCall1_1 db "too many call names",0
  3715 000013C9 63616C6C206E616D65-
  3716 000013D2 7300               
  3717                                  ENDP
  3718                                  
  3719                                  storefunc: PROC
  3720 000013D4 A1[3D00]                 mov ax, [FTop]
  3721 000013D7 3D2C01                   cmp ax, 300 ;unsigned : 1
  3722 000013DA 0F8C0900                 jl  .storefunc181
  3723 000013DE 68[3514]                 push storefunc_0
  3724 000013E1 E825F2                   call error1
  3725 000013E4 83C402                   add  sp, 2
  3726                                  
  3727                                  ;-529     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3728                                  
  3729                                  .storefunc181:
  3730 000013E7 A1[4900]                 mov ax, [lineno]
  3731 000013EA 83E801                   sub ax, 1
  3732 000013ED 8B1E[3D00]               mov bx, [FTop]
  3733 000013F1 D1E3                     shl bx, 1
  3734 000013F3 89877C89                 mov [FAdr+bx], ax
  3735 000013F7 B80000                   mov ax, 0
  3736 000013FA 8B1E[3D00]               mov bx, [FTop]
  3737 000013FE D1E3                     shl bx, 1
  3738 00001400 8987D48B                 mov [FCalls+bx], ax
  3739 00001404 A0[3600]                 mov al, [iswidth]
  3740 00001407 8B1E[3D00]               mov bx, [FTop]
  3741 0000140B 88875088                 mov [FType+bx], al
  3742                                  
  3743                                  ;-530     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3744                                  
  3745 0000140F FF36[3D00]               push word [FTop]
  3746 00001413 8D062C8E                 lea  ax, [FNameField]
  3747 00001417 50                       push ax
  3748 00001418 E832FB                   call adrF
  3749 0000141B 83C404                   add  sp, 4
  3750 0000141E A3[4B00]                 mov word [pt], ax
  3751 00001421 8D06BB69                 lea  ax, [symbol]
  3752 00001425 50                       push ax
  3753 00001426 FF36[4B00]               push word [pt]
  3754 0000142A E805EE                   call strcpy
  3755 0000142D 83C404                   add  sp, 4
  3756 00001430 FF06[3D00]               inc  word[FTop]
  3757                                  
  3758                                  ;-531 }
  3759                                  
  3760                                  
  3761                                  ;-532 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3762                                  
  3763 00001434 C3                       ret
  3764 00001435 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  3765 0000143E 7461626C652066756C-
  3766 00001447 6C00               
  3767                                  ENDP
  3768                                  
  3769                                  addlocal: PROC
  3770 00001449 A1[3B00]                 mov ax, [LTop]
  3771 0000144C 3D2C01                   cmp ax, 300 ;unsigned : 1
  3772 0000144F 0F8C0900                 jl  .addlocal182
  3773 00001453 68[CF14]                 push addlocal_0
  3774 00001456 E8B0F1                   call error1
  3775 00001459 83C402                   add  sp, 2
  3776                                  
  3777                                  ;-533   if (checkName() != 0) error1("Variable already defined");
  3778                                  
  3779                                  .addlocal182:
  3780 0000145C E864FC                   call checkName
  3781 0000145F 83F800                   cmp ax, 0
  3782 00001462 0F840900                 je  .addlocal183
  3783 00001466 68[E914]                 push addlocal_1
  3784 00001469 E89DF1                   call error1
  3785 0000146C 83C402                   add  sp, 2
  3786                                  
  3787                                  ;-534   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3788                                  
  3789                                  .addlocal183:
  3790 0000146F A0[3300]                 mov al, [issign]
  3791 00001472 8B1E[3B00]               mov bx, [LTop]
  3792 00001476 8887306C                 mov [GSign+bx], al
  3793 0000147A A0[3600]                 mov al, [iswidth]
  3794 0000147D 8B1E[3B00]               mov bx, [LTop]
  3795 00001481 88875C6D                 mov [GWidth+bx], al
  3796 00001485 A0[3000]                 mov al, [istype]
  3797 00001488 8B1E[3B00]               mov bx, [LTop]
  3798 0000148C 8887046B                 mov [GType+bx], al
  3799                                  
  3800                                  ;-535   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3801                                  
  3802 00001490 A1[4900]                 mov ax, [lineno]
  3803 00001493 83E801                   sub ax, 1
  3804 00001496 8B1E[3B00]               mov bx, [LTop]
  3805 0000149A D1E3                     shl bx, 1
  3806 0000149C 8987886E                 mov [GAdr+bx], ax
  3807 000014A0 B80000                   mov ax, 0
  3808 000014A3 8B1E[3B00]               mov bx, [LTop]
  3809 000014A7 D1E3                     shl bx, 1
  3810 000014A9 8987E070                 mov [GUsed+bx], ax
  3811                                  
  3812                                  ;-536   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3813                                  
  3814 000014AD FF36[3B00]               push word [LTop]
  3815 000014B1 8D069075                 lea  ax, [GNameField]
  3816 000014B5 50                       push ax
  3817 000014B6 E894FA                   call adrF
  3818 000014B9 83C404                   add  sp, 4
  3819 000014BC A3[4B00]                 mov word [pt], ax
  3820 000014BF 8D06BB69                 lea  ax, [symbol]
  3821 000014C3 50                       push ax
  3822 000014C4 FF36[4B00]               push word [pt]
  3823 000014C8 E867ED                   call strcpy
  3824 000014CB 83C404                   add  sp, 4
  3825                                  
  3826                                  ;-537 }
  3827                                  
  3828                                  
  3829                                  ;-538 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3830                                  
  3831 000014CE C3                       ret
  3832 000014CF 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3833 000014D8 6961626C6520746162-
  3834 000014E1 6C652066756C6C00   
  3835 000014E9 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3836 000014F2 616C72656164792064-
  3837 000014FB 6566696E656400     
  3838                                  ENDP
  3839                                  
  3840                                  checkFunction: PROC;
  3841 00001502 C8040000                 ENTER  4,0
  3842 00001506 B80000                   mov ax, 0
  3843 00001509 8946FE                   mov [bp-2], ax
  3844                                  
  3845                                  ;-539   while (i < FTop) {
  3846                                  
  3847                                  .checkFunction184:
  3848 0000150C 8B46FE                   mov ax, [bp-2]
  3849 0000150F 3B06[3D00]               cmp ax, [FTop]
  3850 00001513 0F8D3000                 jge .checkFunction185
  3851                                  
  3852                                  ;-540     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3853                                  
  3854 00001517 FF76FE                   push word [bp-2]
  3855 0000151A 8D062C8E                 lea  ax, [FNameField]
  3856 0000151E 50                       push ax
  3857 0000151F E82BFA                   call adrF
  3858 00001522 83C404                   add  sp, 4
  3859 00001525 8946FC                   mov [bp-4], ax
  3860 00001528 FF76FC                   push word [bp-4]
  3861 0000152B 8D06BB69                 lea  ax, [symbol]
  3862 0000152F 50                       push ax
  3863 00001530 E835ED                   call eqstr
  3864 00001533 83C404                   add  sp, 4
  3865 00001536 08C0                     or  al, al
  3866 00001538 0F840600                 je .checkFunction186
  3867 0000153C 8B46FE                   mov ax, [bp-2]
  3868 0000153F E90B00                   jmp .retncheckFunction
  3869                                  .checkFunction186:
  3870 00001542 FF46FE                   inc  word[bp-2]
  3871                                  
  3872                                  ;-541   return 0; }
  3873                                  
  3874 00001545 EBC5                     jmp .checkFunction184
  3875                                  .checkFunction185:
  3876 00001547 B80000                   mov ax, 0
  3877 0000154A E90000                   jmp .retncheckFunction
  3878                                  
  3879                                  ;-542 
  3880                                  
  3881                                  
  3882                                  ;-543 int isvariable() {
  3883                                  
  3884 0000154D C9                       .retncheckFunction: LEAVE
  3885 0000154E C3                       ret
  3886                                  ENDP
  3887                                  
  3888                                  isvariable: PROC
  3889                                  
  3890                                  ;-544     if(token==T_SIGNED)   goto v1;
  3891                                  
  3892 0000154F A1[1E00]                 mov ax, [token]
  3893 00001552 3D1302                   cmp ax, 531
  3894 00001555 0F850300                 jne .isvariable187
  3895 00001559 E93A00                   jmp .v1
  3896                                  
  3897                                  ;-545     if(token==T_UNSIGNED) goto v1;
  3898                                  
  3899                                  .isvariable187:
  3900 0000155C A1[1E00]                 mov ax, [token]
  3901 0000155F 3D1402                   cmp ax, 532
  3902 00001562 0F850300                 jne .isvariable188
  3903 00001566 E92D00                   jmp .v1
  3904                                  
  3905                                  ;-546     if(token==T_CHAR)     goto v1;
  3906                                  
  3907                                  .isvariable188:
  3908 00001569 A1[1E00]                 mov ax, [token]
  3909 0000156C 3D1202                   cmp ax, 530
  3910 0000156F 0F850300                 jne .isvariable189
  3911 00001573 E92000                   jmp .v1
  3912                                  
  3913                                  ;-547     if(token==T_INT)      goto v1;
  3914                                  
  3915                                  .isvariable189:
  3916 00001576 A1[1E00]                 mov ax, [token]
  3917 00001579 3D0502                   cmp ax, 517
  3918 0000157C 0F850300                 jne .isvariable190
  3919 00001580 E91300                   jmp .v1
  3920                                  
  3921                                  ;-548     if(token==T_LONG)     goto v1;
  3922                                  
  3923                                  .isvariable190:
  3924 00001583 A1[1E00]                 mov ax, [token]
  3925 00001586 3D1502                   cmp ax, 533
  3926 00001589 0F850300                 jne .isvariable191
  3927 0000158D E90600                   jmp .v1
  3928                                  
  3929                                  ;-549     return 0;
  3930                                  
  3931                                  .isvariable191:
  3932 00001590 B80000                   mov ax, 0
  3933 00001593 E90600                   jmp .retnisvariable
  3934                                  
  3935                                  ;-550 v1: return 1;
  3936                                  
  3937                                  .v1:
  3938 00001596 B80100                   mov ax, 1
  3939 00001599 E90000                   jmp .retnisvariable
  3940                                  
  3941                                  ;-551 }
  3942                                  
  3943                                  
  3944                                  ;-552 
  3945                                  
  3946                                  
  3947                                  ;-553 int cmpneg(int ids) {
  3948                                  
  3949                                   .retnisvariable:
  3950 0000159C C3                       ret
  3951                                  ENDP
  3952                                  
  3953                                  cmpneg: PROC
  3954                                  
  3955                                  ;-554        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3956                                  ;
  3957 0000159D C8000000                 ENTER  0,0
  3958 000015A1 A1[2400]                 mov ax, [iscmp]
  3959 000015A4 3D2603                   cmp ax, 806
  3960 000015A7 0F850C00                 jne .cmpneg192
  3961 000015AB 68[7E16]                 push cmpneg_0
  3962 000015AE E837EE                   call prs
  3963 000015B1 83C402                   add  sp, 2
  3964                                  
  3965                                  ;-555   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3966                                  
  3967 000015B4 E9C500                   jmp .cmpneg193
  3968                                  .cmpneg192:
  3969 000015B7 A1[2400]                 mov ax, [iscmp]
  3970 000015BA 3D2703                   cmp ax, 807
  3971 000015BD 0F850C00                 jne .cmpneg194
  3972 000015C1 68[8716]                 push cmpneg_1
  3973 000015C4 E821EE                   call prs
  3974 000015C7 83C402                   add  sp, 2
  3975                                  
  3976                                  ;-556   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3977                                  
  3978 000015CA E9AF00                   jmp .cmpneg195
  3979                                  .cmpneg194:
  3980 000015CD A1[2400]                 mov ax, [iscmp]
  3981 000015D0 3D3803                   cmp ax, 824
  3982 000015D3 0F852100                 jne .cmpneg196
  3983 000015D7 8B4604                   mov ax, [bp+4]
  3984 000015DA 08C0                     or  al, al
  3985 000015DC 0F840C00                 je .cmpneg197
  3986 000015E0 68[9016]                 push cmpneg_2
  3987 000015E3 E802EE                   call prs
  3988 000015E6 83C402                   add  sp, 2
  3989                                  
  3990                                  ;-557                            else prs("\n ja  .");//ZF=0 CF=0
  3991                                  
  3992 000015E9 E90900                   jmp .cmpneg198
  3993                                  .cmpneg197:
  3994 000015EC 68[9916]                 push cmpneg_3
  3995 000015EF E8F6ED                   call prs
  3996 000015F2 83C402                   add  sp, 2
  3997                                  
  3998                                  ;-558   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3999                                  
  4000                                  .cmpneg198:
  4001 000015F5 E98400                   jmp .cmpneg199
  4002                                  .cmpneg196:
  4003 000015F8 A1[2400]                 mov ax, [iscmp]
  4004 000015FB 3D2B03                   cmp ax, 811
  4005 000015FE 0F854500                 jne .cmpneg200
  4006 00001602 8B4604                   mov ax, [bp+4]
  4007 00001605 08C0                     or  al, al
  4008 00001607 0F841E00                 je .cmpneg201
  4009 0000160B 68[A216]                 push cmpneg_4
  4010 0000160E E8D7ED                   call prs
  4011 00001611 83C402                   add  sp, 2
  4012 00001614 FF7604                   push word [bp+4]
  4013 00001617 E831EF                   call prunsign1
  4014 0000161A 83C402                   add  sp, 2
  4015                                  
  4016                                  ;-559                                prs("\n jl  .");}//          SF!=OF
  4017                                  
  4018 0000161D 68[B016]                 push cmpneg_5
  4019 00001620 E8C5ED                   call prs
  4020 00001623 83C402                   add  sp, 2
  4021                                  
  4022                                  ;-560                            else{prs(" ;unsigned : "); prunsign1(ids);
  4023                                  
  4024 00001626 E91B00                   jmp .cmpneg202
  4025                                  .cmpneg201:
  4026 00001629 68[B916]                 push cmpneg_6
  4027 0000162C E8B9ED                   call prs
  4028 0000162F 83C402                   add  sp, 2
  4029 00001632 FF7604                   push word [bp+4]
  4030 00001635 E813EF                   call prunsign1
  4031 00001638 83C402                   add  sp, 2
  4032                                  
  4033                                  ;-561                                prs("\n jb  .");}//jb=jc=CF=1
  4034                                  
  4035 0000163B 68[C716]                 push cmpneg_7
  4036 0000163E E8A7ED                   call prs
  4037 00001641 83C402                   add  sp, 2
  4038                                  
  4039                                  ;-562   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  4040                                  
  4041                                  .cmpneg202:
  4042 00001644 E93500                   jmp .cmpneg203
  4043                                  .cmpneg200:
  4044 00001647 A1[2400]                 mov ax, [iscmp]
  4045 0000164A 83F83C                   cmp ax, 60
  4046 0000164D 0F850C00                 jne .cmpneg204
  4047 00001651 68[D016]                 push cmpneg_8
  4048 00001654 E891ED                   call prs
  4049 00001657 83C402                   add  sp, 2
  4050                                  
  4051                                  ;-563   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  4052                                  
  4053 0000165A E91F00                   jmp .cmpneg205
  4054                                  .cmpneg204:
  4055 0000165D A1[2400]                 mov ax, [iscmp]
  4056 00001660 83F83E                   cmp ax, 62
  4057 00001663 0F850C00                 jne .cmpneg206
  4058 00001667 68[D916]                 push cmpneg_9
  4059 0000166A E87BED                   call prs
  4060 0000166D 83C402                   add  sp, 2
  4061                                  
  4062                                  ;-564   else error1("internal error compare unknown in CMPNEG()");  }
  4063                                  
  4064 00001670 E90900                   jmp .cmpneg207
  4065                                  .cmpneg206:
  4066 00001673 68[E216]                 push cmpneg_10
  4067 00001676 E890EF                   call error1
  4068 00001679 83C402                   add  sp, 2
  4069                                  .cmpneg207:
  4070                                  .cmpneg205:
  4071                                  .cmpneg203:
  4072                                  .cmpneg199:
  4073                                  .cmpneg195:
  4074                                  .cmpneg193:
  4075                                  
  4076                                  ;-565 
  4077                                  
  4078                                  
  4079                                  ;-566   int isrelational() {
  4080 0000167C C9                       LEAVE
  4081 0000167D C3                       ret
  4082 0000167E 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  4083 00001687 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  4084 00001690 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  4085 00001699 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  4086 000016A2 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  4087 000016AB 64203A2000         
  4088 000016B0 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  4089 000016B9 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  4090 000016C2 64203A2000         
  4091 000016C7 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  4092 000016D0 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  4093 000016D9 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  4094 000016E2 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  4095 000016EB 6572726F7220636F6D-
  4096 000016F4 7061726520756E6B6E-
  4097 000016FD 6F776E20696E20434D-
  4098 00001706 504E4547282900     
  4099                                  ENDP
  4100                                  
  4101                                  isrelational: PROC
  4102                                  
  4103                                  ;-567     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  4104                                  
  4105 0000170D A1[1E00]                 mov ax, [token]
  4106 00001710 3D2603                   cmp ax, 806
  4107 00001713 0F850300                 jne .isrelational208
  4108 00001717 E94700                   jmp .w
  4109                                  .isrelational208:
  4110 0000171A A1[1E00]                 mov ax, [token]
  4111 0000171D 3D2703                   cmp ax, 807
  4112 00001720 0F850300                 jne .isrelational209
  4113 00001724 E93A00                   jmp .w
  4114                                  
  4115                                  ;-568     if (token==T_LE) goto w; if (token==T_GE) goto w;
  4116                                  
  4117                                  .isrelational209:
  4118 00001727 A1[1E00]                 mov ax, [token]
  4119 0000172A 3D3803                   cmp ax, 824
  4120 0000172D 0F850300                 jne .isrelational210
  4121 00001731 E92D00                   jmp .w
  4122                                  .isrelational210:
  4123 00001734 A1[1E00]                 mov ax, [token]
  4124 00001737 3D2B03                   cmp ax, 811
  4125 0000173A 0F850300                 jne .isrelational211
  4126 0000173E E92000                   jmp .w
  4127                                  
  4128                                  ;-569     if (token=='<' ) goto w; if (token=='>' ) goto w;
  4129                                  
  4130                                  .isrelational211:
  4131 00001741 A1[1E00]                 mov ax, [token]
  4132 00001744 83F83C                   cmp ax, 60
  4133 00001747 0F850300                 jne .isrelational212
  4134 0000174B E91300                   jmp .w
  4135                                  .isrelational212:
  4136 0000174E A1[1E00]                 mov ax, [token]
  4137 00001751 83F83E                   cmp ax, 62
  4138 00001754 0F850300                 jne .isrelational213
  4139 00001758 E90600                   jmp .w
  4140                                  
  4141                                  ;-570     return 0;  w: iscmp=token; token=getlex(); return 1;}
  4142                                  
  4143                                  .isrelational213:
  4144 0000175B B80000                   mov ax, 0
  4145 0000175E E91200                   jmp .retnisrelational
  4146                                  .w:
  4147 00001761 A1[1E00]                 mov ax, [token]
  4148 00001764 A3[2400]                 mov word [iscmp], ax
  4149 00001767 E8DAF1                   call getlex
  4150 0000176A A3[1E00]                 mov word [token], ax
  4151 0000176D B80100                   mov ax, 1
  4152 00001770 E90000                   jmp .retnisrelational
  4153                                  
  4154                                  ;-571 
  4155                                  
  4156                                  
  4157                                  ;-572 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4158                                  
  4159                                   .retnisrelational:
  4160 00001773 C3                       ret
  4161                                  ENDP
  4162                                  
  4163                                  checkreg: PROC
  4164                                  
  4165                                  ;-573   if (strlen(symbol) <  2) return 0;
  4166                                  
  4167 00001774 8D06BB69                 lea  ax, [symbol]
  4168 00001778 50                       push ax
  4169 00001779 E88EEA                   call strlen
  4170 0000177C 83C402                   add  sp, 2
  4171 0000177F 83F802                   cmp ax, 2
  4172 00001782 0F8D0600                 jge .checkreg214
  4173 00001786 B80000                   mov ax, 0
  4174 00001789 E94403                   jmp .retncheckreg
  4175                                  
  4176                                  ;-574   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4177                                  
  4178                                  .checkreg214:
  4179 0000178C 68[D11A]                 push checkreg_0
  4180 0000178F 8D06BB69                 lea  ax, [symbol]
  4181 00001793 50                       push ax
  4182 00001794 E8D1EA                   call eqstr
  4183 00001797 83C404                   add  sp, 4
  4184 0000179A 08C0                     or  al, al
  4185 0000179C 0F840600                 je .checkreg215
  4186 000017A0 B80100                   mov ax, 1
  4187 000017A3 E92A03                   jmp .retncheckreg
  4188                                  .checkreg215:
  4189 000017A6 68[D41A]                 push checkreg_1
  4190 000017A9 8D06BB69                 lea  ax, [symbol]
  4191 000017AD 50                       push ax
  4192 000017AE E8B7EA                   call eqstr
  4193 000017B1 83C404                   add  sp, 4
  4194 000017B4 08C0                     or  al, al
  4195 000017B6 0F840600                 je .checkreg216
  4196 000017BA B80300                   mov ax, 3
  4197 000017BD E91003                   jmp .retncheckreg
  4198                                  
  4199                                  ;-575   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4200                                  
  4201                                  .checkreg216:
  4202 000017C0 68[D71A]                 push checkreg_2
  4203 000017C3 8D06BB69                 lea  ax, [symbol]
  4204 000017C7 50                       push ax
  4205 000017C8 E89DEA                   call eqstr
  4206 000017CB 83C404                   add  sp, 4
  4207 000017CE 08C0                     or  al, al
  4208 000017D0 0F840600                 je .checkreg217
  4209 000017D4 B80500                   mov ax, 5
  4210 000017D7 E9F602                   jmp .retncheckreg
  4211                                  .checkreg217:
  4212 000017DA 68[DA1A]                 push checkreg_3
  4213 000017DD 8D06BB69                 lea  ax, [symbol]
  4214 000017E1 50                       push ax
  4215 000017E2 E883EA                   call eqstr
  4216 000017E5 83C404                   add  sp, 4
  4217 000017E8 08C0                     or  al, al
  4218 000017EA 0F840600                 je .checkreg218
  4219 000017EE B80700                   mov ax, 7
  4220 000017F1 E9DC02                   jmp .retncheckreg
  4221                                  
  4222                                  ;-576   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4223                                  
  4224                                  .checkreg218:
  4225 000017F4 68[DD1A]                 push checkreg_4
  4226 000017F7 8D06BB69                 lea  ax, [symbol]
  4227 000017FB 50                       push ax
  4228 000017FC E869EA                   call eqstr
  4229 000017FF 83C404                   add  sp, 4
  4230 00001802 08C0                     or  al, al
  4231 00001804 0F840600                 je .checkreg219
  4232 00001808 B80900                   mov ax, 9
  4233 0000180B E9C202                   jmp .retncheckreg
  4234                                  .checkreg219:
  4235 0000180E 68[E01A]                 push checkreg_5
  4236 00001811 8D06BB69                 lea  ax, [symbol]
  4237 00001815 50                       push ax
  4238 00001816 E84FEA                   call eqstr
  4239 00001819 83C404                   add  sp, 4
  4240 0000181C 08C0                     or  al, al
  4241 0000181E 0F840600                 je .checkreg220
  4242 00001822 B80B00                   mov ax, 11
  4243 00001825 E9A802                   jmp .retncheckreg
  4244                                  
  4245                                  ;-577   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4246                                  
  4247                                  .checkreg220:
  4248 00001828 68[E31A]                 push checkreg_6
  4249 0000182B 8D06BB69                 lea  ax, [symbol]
  4250 0000182F 50                       push ax
  4251 00001830 E835EA                   call eqstr
  4252 00001833 83C404                   add  sp, 4
  4253 00001836 08C0                     or  al, al
  4254 00001838 0F840600                 je .checkreg221
  4255 0000183C B80D00                   mov ax, 13
  4256 0000183F E98E02                   jmp .retncheckreg
  4257                                  .checkreg221:
  4258 00001842 68[E61A]                 push checkreg_7
  4259 00001845 8D06BB69                 lea  ax, [symbol]
  4260 00001849 50                       push ax
  4261 0000184A E81BEA                   call eqstr
  4262 0000184D 83C404                   add  sp, 4
  4263 00001850 08C0                     or  al, al
  4264 00001852 0F840600                 je .checkreg222
  4265 00001856 B80F00                   mov ax, 15
  4266 00001859 E97402                   jmp .retncheckreg
  4267                                  
  4268                                  ;-578   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4269                                  
  4270                                  .checkreg222:
  4271 0000185C 68[E91A]                 push checkreg_8
  4272 0000185F 8D06BB69                 lea  ax, [symbol]
  4273 00001863 50                       push ax
  4274 00001864 E801EA                   call eqstr
  4275 00001867 83C404                   add  sp, 4
  4276 0000186A 08C0                     or  al, al
  4277 0000186C 0F840600                 je .checkreg223
  4278 00001870 B81100                   mov ax, 17
  4279 00001873 E95A02                   jmp .retncheckreg
  4280                                  .checkreg223:
  4281 00001876 68[EC1A]                 push checkreg_9
  4282 00001879 8D06BB69                 lea  ax, [symbol]
  4283 0000187D 50                       push ax
  4284 0000187E E8E7E9                   call eqstr
  4285 00001881 83C404                   add  sp, 4
  4286 00001884 08C0                     or  al, al
  4287 00001886 0F840600                 je .checkreg224
  4288 0000188A B81300                   mov ax, 19
  4289 0000188D E94002                   jmp .retncheckreg
  4290                                  
  4291                                  ;-579   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4292                                  
  4293                                  .checkreg224:
  4294 00001890 68[EF1A]                 push checkreg_10
  4295 00001893 8D06BB69                 lea  ax, [symbol]
  4296 00001897 50                       push ax
  4297 00001898 E8CDE9                   call eqstr
  4298 0000189B 83C404                   add  sp, 4
  4299 0000189E 08C0                     or  al, al
  4300 000018A0 0F840600                 je .checkreg225
  4301 000018A4 B81500                   mov ax, 21
  4302 000018A7 E92602                   jmp .retncheckreg
  4303                                  .checkreg225:
  4304 000018AA 68[F21A]                 push checkreg_11
  4305 000018AD 8D06BB69                 lea  ax, [symbol]
  4306 000018B1 50                       push ax
  4307 000018B2 E8B3E9                   call eqstr
  4308 000018B5 83C404                   add  sp, 4
  4309 000018B8 08C0                     or  al, al
  4310 000018BA 0F840600                 je .checkreg226
  4311 000018BE B81700                   mov ax, 23
  4312 000018C1 E90C02                   jmp .retncheckreg
  4313                                  
  4314                                  ;-580   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4315                                  
  4316                                  .checkreg226:
  4317 000018C4 68[F51A]                 push checkreg_12
  4318 000018C7 8D06BB69                 lea  ax, [symbol]
  4319 000018CB 50                       push ax
  4320 000018CC E899E9                   call eqstr
  4321 000018CF 83C404                   add  sp, 4
  4322 000018D2 08C0                     or  al, al
  4323 000018D4 0F840600                 je .checkreg227
  4324 000018D8 B81900                   mov ax, 25
  4325 000018DB E9F201                   jmp .retncheckreg
  4326                                  .checkreg227:
  4327 000018DE 68[F81A]                 push checkreg_13
  4328 000018E1 8D06BB69                 lea  ax, [symbol]
  4329 000018E5 50                       push ax
  4330 000018E6 E87FE9                   call eqstr
  4331 000018E9 83C404                   add  sp, 4
  4332 000018EC 08C0                     or  al, al
  4333 000018EE 0F840600                 je .checkreg228
  4334 000018F2 B81B00                   mov ax, 27
  4335 000018F5 E9D801                   jmp .retncheckreg
  4336                                  
  4337                                  ;-581   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4338                                  
  4339                                  .checkreg228:
  4340 000018F8 68[FB1A]                 push checkreg_14
  4341 000018FB 8D06BB69                 lea  ax, [symbol]
  4342 000018FF 50                       push ax
  4343 00001900 E865E9                   call eqstr
  4344 00001903 83C404                   add  sp, 4
  4345 00001906 08C0                     or  al, al
  4346 00001908 0F840600                 je .checkreg229
  4347 0000190C B81D00                   mov ax, 29
  4348 0000190F E9BE01                   jmp .retncheckreg
  4349                                  .checkreg229:
  4350 00001912 68[FE1A]                 push checkreg_15
  4351 00001915 8D06BB69                 lea  ax, [symbol]
  4352 00001919 50                       push ax
  4353 0000191A E84BE9                   call eqstr
  4354 0000191D 83C404                   add  sp, 4
  4355 00001920 08C0                     or  al, al
  4356 00001922 0F840600                 je .checkreg230
  4357 00001926 B81F00                   mov ax, 31
  4358 00001929 E9A401                   jmp .retncheckreg
  4359                                  
  4360                                  ;-582   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4361                                  
  4362                                  .checkreg230:
  4363 0000192C 68[011B]                 push checkreg_16
  4364 0000192F 8D06BB69                 lea  ax, [symbol]
  4365 00001933 50                       push ax
  4366 00001934 E831E9                   call eqstr
  4367 00001937 83C404                   add  sp, 4
  4368 0000193A 08C0                     or  al, al
  4369 0000193C 0F840600                 je .checkreg231
  4370 00001940 B82100                   mov ax, 33
  4371 00001943 E98A01                   jmp .retncheckreg
  4372                                  .checkreg231:
  4373 00001946 68[041B]                 push checkreg_17
  4374 00001949 8D06BB69                 lea  ax, [symbol]
  4375 0000194D 50                       push ax
  4376 0000194E E817E9                   call eqstr
  4377 00001951 83C404                   add  sp, 4
  4378 00001954 08C0                     or  al, al
  4379 00001956 0F840600                 je .checkreg232
  4380 0000195A B82300                   mov ax, 35
  4381 0000195D E97001                   jmp .retncheckreg
  4382                                  
  4383                                  ;-583   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4384                                  
  4385                                  .checkreg232:
  4386 00001960 68[071B]                 push checkreg_18
  4387 00001963 8D06BB69                 lea  ax, [symbol]
  4388 00001967 50                       push ax
  4389 00001968 E8FDE8                   call eqstr
  4390 0000196B 83C404                   add  sp, 4
  4391 0000196E 08C0                     or  al, al
  4392 00001970 0F840600                 je .checkreg233
  4393 00001974 B82500                   mov ax, 37
  4394 00001977 E95601                   jmp .retncheckreg
  4395                                  .checkreg233:
  4396 0000197A 68[0A1B]                 push checkreg_19
  4397 0000197D 8D06BB69                 lea  ax, [symbol]
  4398 00001981 50                       push ax
  4399 00001982 E8E3E8                   call eqstr
  4400 00001985 83C404                   add  sp, 4
  4401 00001988 08C0                     or  al, al
  4402 0000198A 0F840600                 je .checkreg234
  4403 0000198E B82700                   mov ax, 39
  4404 00001991 E93C01                   jmp .retncheckreg
  4405                                  
  4406                                  ;-584   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4407                                  
  4408                                  .checkreg234:
  4409 00001994 68[0D1B]                 push checkreg_20
  4410 00001997 8D06BB69                 lea  ax, [symbol]
  4411 0000199B 50                       push ax
  4412 0000199C E8C9E8                   call eqstr
  4413 0000199F 83C404                   add  sp, 4
  4414 000019A2 08C0                     or  al, al
  4415 000019A4 0F840600                 je .checkreg235
  4416 000019A8 B82900                   mov ax, 41
  4417 000019AB E92201                   jmp .retncheckreg
  4418                                  .checkreg235:
  4419 000019AE 68[101B]                 push checkreg_21
  4420 000019B1 8D06BB69                 lea  ax, [symbol]
  4421 000019B5 50                       push ax
  4422 000019B6 E8AFE8                   call eqstr
  4423 000019B9 83C404                   add  sp, 4
  4424 000019BC 08C0                     or  al, al
  4425 000019BE 0F840600                 je .checkreg236
  4426 000019C2 B82B00                   mov ax, 43
  4427 000019C5 E90801                   jmp .retncheckreg
  4428                                  
  4429                                  ;-585   // (eqstr(symbol,"ip")) return 45;
  4430                                  
  4431                                  
  4432                                  ;-586   if (strlen(symbol) >   3) return 0;
  4433                                  
  4434                                  .checkreg236:
  4435 000019C8 8D06BB69                 lea  ax, [symbol]
  4436 000019CC 50                       push ax
  4437 000019CD E83AE8                   call strlen
  4438 000019D0 83C402                   add  sp, 2
  4439 000019D3 83F803                   cmp ax, 3
  4440 000019D6 0F8E0600                 jle .checkreg237
  4441 000019DA B80000                   mov ax, 0
  4442 000019DD E9F000                   jmp .retncheckreg
  4443                                  
  4444                                  ;-587   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4445                                  
  4446                                  .checkreg237:
  4447 000019E0 68[131B]                 push checkreg_22
  4448 000019E3 8D06BB69                 lea  ax, [symbol]
  4449 000019E7 50                       push ax
  4450 000019E8 E87DE8                   call eqstr
  4451 000019EB 83C404                   add  sp, 4
  4452 000019EE 08C0                     or  al, al
  4453 000019F0 0F840600                 je .checkreg238
  4454 000019F4 B82F00                   mov ax, 47
  4455 000019F7 E9D600                   jmp .retncheckreg
  4456                                  .checkreg238:
  4457 000019FA 68[171B]                 push checkreg_23
  4458 000019FD 8D06BB69                 lea  ax, [symbol]
  4459 00001A01 50                       push ax
  4460 00001A02 E863E8                   call eqstr
  4461 00001A05 83C404                   add  sp, 4
  4462 00001A08 08C0                     or  al, al
  4463 00001A0A 0F840600                 je .checkreg239
  4464 00001A0E B83200                   mov ax, 50
  4465 00001A11 E9BC00                   jmp .retncheckreg
  4466                                  
  4467                                  ;-588   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4468                                  
  4469                                  .checkreg239:
  4470 00001A14 68[1B1B]                 push checkreg_24
  4471 00001A17 8D06BB69                 lea  ax, [symbol]
  4472 00001A1B 50                       push ax
  4473 00001A1C E849E8                   call eqstr
  4474 00001A1F 83C404                   add  sp, 4
  4475 00001A22 08C0                     or  al, al
  4476 00001A24 0F840600                 je .checkreg240
  4477 00001A28 B83500                   mov ax, 53
  4478 00001A2B E9A200                   jmp .retncheckreg
  4479                                  .checkreg240:
  4480 00001A2E 68[1F1B]                 push checkreg_25
  4481 00001A31 8D06BB69                 lea  ax, [symbol]
  4482 00001A35 50                       push ax
  4483 00001A36 E82FE8                   call eqstr
  4484 00001A39 83C404                   add  sp, 4
  4485 00001A3C 08C0                     or  al, al
  4486 00001A3E 0F840600                 je .checkreg241
  4487 00001A42 B83800                   mov ax, 56
  4488 00001A45 E98800                   jmp .retncheckreg
  4489                                  
  4490                                  ;-589   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4491                                  
  4492                                  .checkreg241:
  4493 00001A48 68[231B]                 push checkreg_26
  4494 00001A4B 8D06BB69                 lea  ax, [symbol]
  4495 00001A4F 50                       push ax
  4496 00001A50 E815E8                   call eqstr
  4497 00001A53 83C404                   add  sp, 4
  4498 00001A56 08C0                     or  al, al
  4499 00001A58 0F840600                 je .checkreg242
  4500 00001A5C B83B00                   mov ax, 59
  4501 00001A5F E96E00                   jmp .retncheckreg
  4502                                  .checkreg242:
  4503 00001A62 68[271B]                 push checkreg_27
  4504 00001A65 8D06BB69                 lea  ax, [symbol]
  4505 00001A69 50                       push ax
  4506 00001A6A E8FBE7                   call eqstr
  4507 00001A6D 83C404                   add  sp, 4
  4508 00001A70 08C0                     or  al, al
  4509 00001A72 0F840600                 je .checkreg243
  4510 00001A76 B83E00                   mov ax, 62
  4511 00001A79 E95400                   jmp .retncheckreg
  4512                                  
  4513                                  ;-590   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4514                                  
  4515                                  .checkreg243:
  4516 00001A7C 68[2B1B]                 push checkreg_28
  4517 00001A7F 8D06BB69                 lea  ax, [symbol]
  4518 00001A83 50                       push ax
  4519 00001A84 E8E1E7                   call eqstr
  4520 00001A87 83C404                   add  sp, 4
  4521 00001A8A 08C0                     or  al, al
  4522 00001A8C 0F840600                 je .checkreg244
  4523 00001A90 B84100                   mov ax, 65
  4524 00001A93 E93A00                   jmp .retncheckreg
  4525                                  .checkreg244:
  4526 00001A96 68[2F1B]                 push checkreg_29
  4527 00001A99 8D06BB69                 lea  ax, [symbol]
  4528 00001A9D 50                       push ax
  4529 00001A9E E8C7E7                   call eqstr
  4530 00001AA1 83C404                   add  sp, 4
  4531 00001AA4 08C0                     or  al, al
  4532 00001AA6 0F840600                 je .checkreg245
  4533 00001AAA B84400                   mov ax, 68
  4534 00001AAD E92000                   jmp .retncheckreg
  4535                                  
  4536                                  ;-591   if (eqstr(symbol,"cr0")) return 71;
  4537                                  
  4538                                  .checkreg245:
  4539 00001AB0 68[331B]                 push checkreg_30
  4540 00001AB3 8D06BB69                 lea  ax, [symbol]
  4541 00001AB7 50                       push ax
  4542 00001AB8 E8ADE7                   call eqstr
  4543 00001ABB 83C404                   add  sp, 4
  4544 00001ABE 08C0                     or  al, al
  4545 00001AC0 0F840600                 je .checkreg246
  4546 00001AC4 B84700                   mov ax, 71
  4547 00001AC7 E90600                   jmp .retncheckreg
  4548                                  
  4549                                  ;-592   return 0;   }
  4550                                  
  4551                                  .checkreg246:
  4552 00001ACA B80000                   mov ax, 0
  4553 00001ACD E90000                   jmp .retncheckreg
  4554                                  
  4555                                  ;-593 
  4556                                  
  4557                                  
  4558                                  ;-594 char printregstr[]
  4559                                  
  4560                                   .retncheckreg:
  4561 00001AD0 C3                       ret
  4562 00001AD1 616C00                  checkreg_0 db "al",0
  4563 00001AD4 636C00                  checkreg_1 db "cl",0
  4564 00001AD7 646C00                  checkreg_2 db "dl",0
  4565 00001ADA 626C00                  checkreg_3 db "bl",0
  4566 00001ADD 616800                  checkreg_4 db "ah",0
  4567 00001AE0 636800                  checkreg_5 db "ch",0
  4568 00001AE3 646800                  checkreg_6 db "dh",0
  4569 00001AE6 626800                  checkreg_7 db "bh",0
  4570 00001AE9 617800                  checkreg_8 db "ax",0
  4571 00001AEC 637800                  checkreg_9 db "cx",0
  4572 00001AEF 647800                  checkreg_10 db "dx",0
  4573 00001AF2 627800                  checkreg_11 db "bx",0
  4574 00001AF5 737000                  checkreg_12 db "sp",0
  4575 00001AF8 627000                  checkreg_13 db "bp",0
  4576 00001AFB 736900                  checkreg_14 db "si",0
  4577 00001AFE 646900                  checkreg_15 db "di",0
  4578 00001B01 657300                  checkreg_16 db "es",0
  4579 00001B04 637300                  checkreg_17 db "cs",0
  4580 00001B07 737300                  checkreg_18 db "ss",0
  4581 00001B0A 647300                  checkreg_19 db "ds",0
  4582 00001B0D 667300                  checkreg_20 db "fs",0
  4583 00001B10 677300                  checkreg_21 db "gs",0
  4584 00001B13 65617800                checkreg_22 db "eax",0
  4585 00001B17 65637800                checkreg_23 db "ecx",0
  4586 00001B1B 65647800                checkreg_24 db "edx",0
  4587 00001B1F 65627800                checkreg_25 db "ebx",0
  4588 00001B23 65737000                checkreg_26 db "esp",0
  4589 00001B27 65627000                checkreg_27 db "ebp",0
  4590 00001B2B 65736900                checkreg_28 db "esi",0
  4591 00001B2F 65646900                checkreg_29 db "edi",0
  4592 00001B33 63723000                checkreg_30 db "cr0",0
  4593                                  ENDP
  4594                                  
  4595                                  ;-595 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4596                                  
  4597 00001B37 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4598 00001B40 616863686468626861-
  4599 00001B49 786378647862787370-
  4600 00001B52 627073696469657363-
  4601 00001B5B 737373647366736773-
  4602 00001B64 697065617865637865-
  4603 00001B6D 647865627865737065-
  4604 00001B76 627065736965646963-
  4605 00001B7F 723000             
  4606                                  
  4607                                  ;-596 
  4608                                  
  4609                                  
  4610                                  ;-597 int printreg(int i) {  unsigned int k; unsigned char c;
  4611                                  
  4612                                  
  4613                                  printreg: PROC
  4614                                  
  4615                                  ;-598   k = &printregstr + i; c=*k; prc(c); i++;
  4616                                  ;
  4617 00001B82 C8040000                 ENTER  4,0
  4618 00001B86 B8[371B]                 mov ax, printregstr
  4619 00001B89 034604                   add ax, [bp+4]
  4620 00001B8C 8946FE                   mov [bp-2], ax
  4621 00001B8F 8B5EFE                   mov bx, [bp-2]
  4622 00001B92 8B07                     mov ax, [bx]
  4623 00001B94 8846FC                   mov [bp-4], al
  4624 00001B97 8A46FC                   mov al, byte [bp-4]
  4625 00001B9A B400                     mov ah, 0
  4626 00001B9C 50                       push ax
  4627 00001B9D E8EFE7                   call prc
  4628 00001BA0 83C402                   add  sp, 2
  4629 00001BA3 FF4604                   inc  word[bp+4]
  4630                                  
  4631                                  ;-599   k = &printregstr + i; c=*k; prc(c);
  4632                                  
  4633 00001BA6 B8[371B]                 mov ax, printregstr
  4634 00001BA9 034604                   add ax, [bp+4]
  4635 00001BAC 8946FE                   mov [bp-2], ax
  4636 00001BAF 8B5EFE                   mov bx, [bp-2]
  4637 00001BB2 8B07                     mov ax, [bx]
  4638 00001BB4 8846FC                   mov [bp-4], al
  4639 00001BB7 8A46FC                   mov al, byte [bp-4]
  4640 00001BBA B400                     mov ah, 0
  4641 00001BBC 50                       push ax
  4642 00001BBD E8CFE7                   call prc
  4643 00001BC0 83C402                   add  sp, 2
  4644                                  
  4645                                  ;-600   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4646                                  
  4647 00001BC3 8B4604                   mov ax, [bp+4]
  4648 00001BC6 83F82F                   cmp ax, 47
  4649 00001BC9 0F8E2000                 jle .printreg247
  4650 00001BCD FF4604                   inc  word[bp+4]
  4651 00001BD0 B8[371B]                 mov ax, printregstr
  4652 00001BD3 034604                   add ax, [bp+4]
  4653 00001BD6 8946FE                   mov [bp-2], ax
  4654 00001BD9 8B5EFE                   mov bx, [bp-2]
  4655 00001BDC 8B07                     mov ax, [bx]
  4656 00001BDE 8846FC                   mov [bp-4], al
  4657 00001BE1 8A46FC                   mov al, byte [bp-4]
  4658 00001BE4 B400                     mov ah, 0
  4659 00001BE6 50                       push ax
  4660 00001BE7 E8A5E7                   call prc
  4661 00001BEA 83C402                   add  sp, 2
  4662                                  
  4663                                  ;-601 }
  4664                                  
  4665                                  .printreg247:
  4666                                  
  4667                                  ;-602 
  4668                                  
  4669                                  
  4670                                  ;-603 int constantexpr() { int mode; int id1;int ids;
  4671 00001BED C9                       LEAVE
  4672 00001BEE C3                       ret
  4673                                  ENDP
  4674                                  
  4675                                  constantexpr: PROC
  4676                                  
  4677                                  ;-604   token=getlex();   mode=typeName();
  4678                                  ;
  4679 00001BEF C8060000                 ENTER  6,0
  4680 00001BF3 E84EED                   call getlex
  4681 00001BF6 A3[1E00]                 mov word [token], ax
  4682 00001BF9 E8BEF5                   call typeName
  4683 00001BFC 8946FE                   mov [bp-2], ax
  4684                                  
  4685                                  ;-605   id1=searchname(); gettypes(id1); ids=signi;
  4686                                  
  4687 00001BFF E845F5                   call searchname
  4688 00001C02 8946FC                   mov [bp-4], ax
  4689 00001C05 FF76FC                   push word [bp-4]
  4690 00001C08 E888F6                   call gettypes
  4691 00001C0B 83C402                   add  sp, 2
  4692 00001C0E A1[3100]                 mov ax, [signi]
  4693 00001C11 8946FA                   mov [bp-6], ax
  4694                                  
  4695                                  ;-606   if (isrelational() ==0) error1("Relational expression expected");
  4696                                  
  4697 00001C14 E8F6FA                   call isrelational
  4698 00001C17 83F800                   cmp ax, 0
  4699 00001C1A 0F850900                 jne .constantexpr248
  4700 00001C1E 68[A41C]                 push constantexpr_0
  4701 00001C21 E8E5E9                   call error1
  4702 00001C24 83C402                   add  sp, 2
  4703                                  
  4704                                  ;-607   expect(T_CONST);  prs(" ; constant expression");
  4705                                  
  4706                                  .constantexpr248:
  4707 00001C27 680101                   push 257
  4708 00001C2A E8B8F2                   call expect
  4709 00001C2D 83C402                   add  sp, 2
  4710 00001C30 68[C31C]                 push constantexpr_1
  4711 00001C33 E8B2E7                   call prs
  4712 00001C36 83C402                   add  sp, 2
  4713                                  
  4714                                  ;-608   prs("\ncmp ");
  4715                                  
  4716 00001C39 68[DA1C]                 push constantexpr_2
  4717 00001C3C E8A9E7                   call prs
  4718 00001C3F 83C402                   add  sp, 2
  4719                                  
  4720                                  ;-609   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4721                                  
  4722 00001C42 FF76FC                   push word [bp-4]
  4723 00001C45 E84BF6                   call gettypes
  4724 00001C48 83C402                   add  sp, 2
  4725 00001C4B A1[3700]                 mov ax, [wi]
  4726 00001C4E 83F802                   cmp ax, 2
  4727 00001C51 0F850C00                 jne .constantexpr249
  4728 00001C55 68[E11C]                 push constantexpr_3
  4729 00001C58 E88DE7                   call prs
  4730 00001C5B 83C402                   add  sp, 2
  4731 00001C5E E90900                   jmp .constantexpr250
  4732                                  .constantexpr249:
  4733 00001C61 68[E61C]                 push constantexpr_4
  4734 00001C64 E881E7                   call prs
  4735 00001C67 83C402                   add  sp, 2
  4736                                  
  4737                                  ;-610   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4738                                  
  4739                                  .constantexpr250:
  4740 00001C6A FF76FC                   push word [bp-4]
  4741 00001C6D E873F3                   call v
  4742 00001C70 83C402                   add  sp, 2
  4743 00001C73 68[EB1C]                 push constantexpr_5
  4744 00001C76 E86FE7                   call prs
  4745 00001C79 83C402                   add  sp, 2
  4746 00001C7C FF36[2C00]               push word [lexval]
  4747 00001C80 E8C8E8                   call prunsign1
  4748 00001C83 83C402                   add  sp, 2
  4749 00001C86 FF76FA                   push word [bp-6]
  4750 00001C89 E811F9                   call cmpneg
  4751 00001C8C 83C402                   add  sp, 2
  4752 00001C8F 8D063B6A                 lea  ax, [fname]
  4753 00001C93 50                       push ax
  4754 00001C94 E851E7                   call prs
  4755 00001C97 83C402                   add  sp, 2
  4756                                  
  4757                                  ;-611   expect(')');
  4758                                  
  4759 00001C9A 6A29                     push 41
  4760 00001C9C E846F2                   call expect
  4761 00001C9F 83C402                   add  sp, 2
  4762                                  
  4763                                  ;-612 }
  4764                                  
  4765                                  
  4766                                  ;-613 
  4767                                  
  4768                                  
  4769                                  ;-614 char ops[5];
  4770 00001CA2 C9                       LEAVE
  4771 00001CA3 C3                       ret
  4772 00001CA4 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4773 00001CAD 6C2065787072657373-
  4774 00001CB6 696F6E206578706563-
  4775 00001CBF 74656400           
  4776 00001CC3 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4777 00001CCC 6E7420657870726573-
  4778 00001CD5 73696F6E00         
  4779 00001CDA 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4780 00001CE1 776F726400              constantexpr_3 db "word",0
  4781 00001CE6 6279746500              constantexpr_4 db "byte",0
  4782 00001CEB 2C2000                  constantexpr_5 db ", ",0
  4783                                  ENDP
  4784                                  section .bss
  4785                                  absolute 55920
  4786 0000DA70 <res 00000005>          ops resb 5
  4787                                  section .text
  4788                                  
  4789                                  ;-615 int doreg1(int iscmp1) { int i;
  4790                                  
  4791                                  
  4792                                  doreg1: PROC
  4793                                  
  4794                                  ;-616   if (istoken('='))          strcpy(ops, "mov");
  4795                                  ;
  4796 00001CEE C8020000                 ENTER  2,0
  4797 00001CF2 6A3D                     push 61
  4798 00001CF4 E8CCF1                   call istoken
  4799 00001CF7 83C402                   add  sp, 2
  4800 00001CFA 08C0                     or  al, al
  4801 00001CFC 0F840E00                 je .doreg1251
  4802 00001D00 68[A11E]                 push doreg1_0
  4803 00001D03 8D0670DA                 lea  ax, [ops]
  4804 00001D07 50                       push ax
  4805 00001D08 E827E5                   call strcpy
  4806 00001D0B 83C404                   add  sp, 4
  4807                                  
  4808                                  ;-617   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4809                                  
  4810                                  .doreg1251:
  4811 00001D0E 68CE04                   push 1230
  4812 00001D11 E8AFF1                   call istoken
  4813 00001D14 83C402                   add  sp, 2
  4814 00001D17 08C0                     or  al, al
  4815 00001D19 0F840E00                 je .doreg1252
  4816 00001D1D 68[A51E]                 push doreg1_1
  4817 00001D20 8D0670DA                 lea  ax, [ops]
  4818 00001D24 50                       push ax
  4819 00001D25 E80AE5                   call strcpy
  4820 00001D28 83C404                   add  sp, 4
  4821                                  
  4822                                  ;-618   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4823                                  
  4824                                  .doreg1252:
  4825 00001D2B 68CF04                   push 1231
  4826 00001D2E E892F1                   call istoken
  4827 00001D31 83C402                   add  sp, 2
  4828 00001D34 08C0                     or  al, al
  4829 00001D36 0F840E00                 je .doreg1253
  4830 00001D3A 68[A91E]                 push doreg1_2
  4831 00001D3D 8D0670DA                 lea  ax, [ops]
  4832 00001D41 50                       push ax
  4833 00001D42 E8EDE4                   call strcpy
  4834 00001D45 83C404                   add  sp, 4
  4835                                  
  4836                                  ;-619   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4837                                  
  4838                                  .doreg1253:
  4839 00001D48 68D204                   push 1234
  4840 00001D4B E875F1                   call istoken
  4841 00001D4E 83C402                   add  sp, 2
  4842 00001D51 08C0                     or  al, al
  4843 00001D53 0F840E00                 je .doreg1254
  4844 00001D57 68[AD1E]                 push doreg1_3
  4845 00001D5A 8D0670DA                 lea  ax, [ops]
  4846 00001D5E 50                       push ax
  4847 00001D5F E8D0E4                   call strcpy
  4848 00001D62 83C404                   add  sp, 4
  4849                                  
  4850                                  ;-620   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4851                                  
  4852                                  .doreg1254:
  4853 00001D65 68D304                   push 1235
  4854 00001D68 E858F1                   call istoken
  4855 00001D6B 83C402                   add  sp, 2
  4856 00001D6E 08C0                     or  al, al
  4857 00001D70 0F840E00                 je .doreg1255
  4858 00001D74 68[B11E]                 push doreg1_4
  4859 00001D77 8D0670DA                 lea  ax, [ops]
  4860 00001D7B 50                       push ax
  4861 00001D7C E8B3E4                   call strcpy
  4862 00001D7F 83C404                   add  sp, 4
  4863                                  
  4864                                  ;-621   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4865                                  
  4866                                  .doreg1255:
  4867 00001D82 68D804                   push 1240
  4868 00001D85 E83BF1                   call istoken
  4869 00001D88 83C402                   add  sp, 2
  4870 00001D8B 08C0                     or  al, al
  4871 00001D8D 0F840E00                 je .doreg1256
  4872 00001D91 68[B41E]                 push doreg1_5
  4873 00001D94 8D0670DA                 lea  ax, [ops]
  4874 00001D98 50                       push ax
  4875 00001D99 E896E4                   call strcpy
  4876 00001D9C 83C404                   add  sp, 4
  4877                                  
  4878                                  ;-622   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4879                                  
  4880                                  .doreg1256:
  4881 00001D9F 68D904                   push 1241
  4882 00001DA2 E81EF1                   call istoken
  4883 00001DA5 83C402                   add  sp, 2
  4884 00001DA8 08C0                     or  al, al
  4885 00001DAA 0F840E00                 je .doreg1257
  4886 00001DAE 68[B81E]                 push doreg1_6
  4887 00001DB1 8D0670DA                 lea  ax, [ops]
  4888 00001DB5 50                       push ax
  4889 00001DB6 E879E4                   call strcpy
  4890 00001DB9 83C404                   add  sp, 4
  4891                                  
  4892                                  ;-623   if (iscmp1 == 1) { token=getlex();
  4893                                  
  4894                                  .doreg1257:
  4895 00001DBC 8B4604                   mov ax, [bp+4]
  4896 00001DBF 83F801                   cmp ax, 1
  4897 00001DC2 0F852700                 jne .doreg1258
  4898 00001DC6 E87BEB                   call getlex
  4899 00001DC9 A3[1E00]                 mov word [token], ax
  4900                                  
  4901                                  ;-624       if (isrelational() ==0) error1("Relational expected");
  4902                                  
  4903 00001DCC E83EF9                   call isrelational
  4904 00001DCF 83F800                   cmp ax, 0
  4905 00001DD2 0F850900                 jne .doreg1259
  4906 00001DD6 68[BC1E]                 push doreg1_7
  4907 00001DD9 E82DE8                   call error1
  4908 00001DDC 83C402                   add  sp, 2
  4909                                  
  4910                                  ;-625       strcpy(ops, "cmp"); }
  4911                                  
  4912                                  .doreg1259:
  4913 00001DDF 68[D01E]                 push doreg1_8
  4914 00001DE2 8D0670DA                 lea  ax, [ops]
  4915 00001DE6 50                       push ax
  4916 00001DE7 E848E4                   call strcpy
  4917 00001DEA 83C404                   add  sp, 4
  4918                                  
  4919                                  ;-626   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4920                                  
  4921                                  .doreg1258:
  4922 00001DED E88CE6                   call prnl
  4923 00001DF0 8D0670DA                 lea  ax, [ops]
  4924 00001DF4 50                       push ax
  4925 00001DF5 E8F0E5                   call prs
  4926 00001DF8 83C402                   add  sp, 2
  4927 00001DFB 68[D41E]                 push doreg1_9
  4928 00001DFE E8E7E5                   call prs
  4929 00001E01 83C402                   add  sp, 2
  4930 00001E04 FF36[5400]               push word [ireg1]
  4931 00001E08 E877FD                   call printreg
  4932 00001E0B 83C402                   add  sp, 2
  4933 00001E0E 68[D71E]                 push doreg1_10
  4934 00001E11 E8D4E5                   call prs
  4935 00001E14 83C402                   add  sp, 2
  4936                                  
  4937                                  ;-627 
  4938                                  
  4939                                  
  4940                                  ;-628   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4941                                  
  4942 00001E17 680101                   push 257
  4943 00001E1A E8A6F0                   call istoken
  4944 00001E1D 83C402                   add  sp, 2
  4945 00001E20 08C0                     or  al, al
  4946 00001E22 0F840D00                 je .doreg1260
  4947 00001E26 FF36[2C00]               push word [lexval]
  4948 00001E2A E81EE7                   call prunsign1
  4949 00001E2D 83C402                   add  sp, 2
  4950 00001E30 E94700                   jmp .reg1
  4951                                  
  4952                                  ;-629   mod2=typeName(); ireg2=checkreg();
  4953                                  
  4954                                  .doreg1260:
  4955 00001E33 E884F3                   call typeName
  4956 00001E36 A3[5600]                 mov word [mod2], ax
  4957 00001E39 E838F9                   call checkreg
  4958 00001E3C A3[5800]                 mov word [ireg2], ax
  4959                                  
  4960                                  ;-630   if (ireg2) {printreg(ireg2); goto reg1;}
  4961                                  
  4962 00001E3F A1[5800]                 mov ax, [ireg2]
  4963 00001E42 08C0                     or  al, al
  4964 00001E44 0F840D00                 je .doreg1261
  4965 00001E48 FF36[5800]               push word [ireg2]
  4966 00001E4C E833FD                   call printreg
  4967 00001E4F 83C402                   add  sp, 2
  4968 00001E52 E92500                   jmp .reg1
  4969                                  
  4970                                  ;-631   i=searchname();  if (mod2 == 2) a(i); else v(i);
  4971                                  
  4972                                  .doreg1261:
  4973 00001E55 E8EFF2                   call searchname
  4974 00001E58 8946FE                   mov [bp-2], ax
  4975 00001E5B A1[5600]                 mov ax, [mod2]
  4976 00001E5E 83F802                   cmp ax, 2
  4977 00001E61 0F850C00                 jne .doreg1262
  4978 00001E65 FF76FE                   push word [bp-2]
  4979 00001E68 E869F1                   call a
  4980 00001E6B 83C402                   add  sp, 2
  4981 00001E6E E90900                   jmp .doreg1263
  4982                                  .doreg1262:
  4983 00001E71 FF76FE                   push word [bp-2]
  4984 00001E74 E86CF1                   call v
  4985 00001E77 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-632   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4988                                  
  4989                                  .doreg1263:
  4990                                  .reg1:
  4991 00001E7A 8B4604                   mov ax, [bp+4]
  4992 00001E7D 83F801                   cmp ax, 1
  4993 00001E80 0F851B00                 jne .doreg1264
  4994 00001E84 6A00                     push 0
  4995 00001E86 E814F7                   call cmpneg
  4996 00001E89 83C402                   add  sp, 2
  4997 00001E8C 8D063B6A                 lea  ax, [fname]
  4998 00001E90 50                       push ax
  4999 00001E91 E854E5                   call prs
  5000 00001E94 83C402                   add  sp, 2
  5001 00001E97 6A29                     push 41
  5002 00001E99 E849F0                   call expect
  5003 00001E9C 83C402                   add  sp, 2
  5004                                  
  5005                                  ;-633 }
  5006                                  
  5007                                  .doreg1264:
  5008                                  
  5009                                  ;-634 
  5010                                  
  5011                                  
  5012                                  ;-635 int compoundass(char *op, int mode, int id1) {
  5013 00001E9F C9                       LEAVE
  5014 00001EA0 C3                       ret
  5015 00001EA1 6D6F7600                doreg1_0 db "mov",0
  5016 00001EA5 61646400                doreg1_1 db "add",0
  5017 00001EA9 73756200                doreg1_2 db "sub",0
  5018 00001EAD 616E6400                doreg1_3 db "and",0
  5019 00001EB1 6F7200                  doreg1_4 db "or",0
  5020 00001EB4 73686C00                doreg1_5 db "shl",0
  5021 00001EB8 73687200                doreg1_6 db "shr",0
  5022 00001EBC 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  5023 00001EC5 6C2065787065637465-
  5024 00001ECE 6400               
  5025 00001ED0 636D7000                doreg1_8 db "cmp",0
  5026 00001ED4 202000                  doreg1_9 db "  ",0
  5027 00001ED7 2C2000                  doreg1_10 db ", ",0
  5028                                  ENDP
  5029                                  
  5030                                  compoundass: PROC
  5031                                  
  5032                                  ;-636   if(mode) error1("only scalar Var allowed");
  5033                                  ;
  5034 00001EDA C8000000                 ENTER  0,0
  5035 00001EDE 8B4606                   mov ax, [bp+6]
  5036 00001EE1 08C0                     or  al, al
  5037 00001EE3 0F840900                 je .compoundass265
  5038 00001EE7 68[541F]                 push compoundass_0
  5039 00001EEA E81CE7                   call error1
  5040 00001EED 83C402                   add  sp, 2
  5041                                  
  5042                                  ;-637   prnl(); prs(op); prs("  ");
  5043                                  
  5044                                  .compoundass265:
  5045 00001EF0 E889E5                   call prnl
  5046 00001EF3 FF7604                   push word [bp+4]
  5047 00001EF6 E8EFE4                   call prs
  5048 00001EF9 83C402                   add  sp, 2
  5049 00001EFC 68[6C1F]                 push compoundass_1
  5050 00001EFF E8E6E4                   call prs
  5051 00001F02 83C402                   add  sp, 2
  5052                                  
  5053                                  ;-638   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5054                                  
  5055 00001F05 FF7608                   push word [bp+8]
  5056 00001F08 E888F3                   call gettypes
  5057 00001F0B 83C402                   add  sp, 2
  5058 00001F0E A1[3700]                 mov ax, [wi]
  5059 00001F11 83F802                   cmp ax, 2
  5060 00001F14 0F850C00                 jne .compoundass266
  5061 00001F18 68[6F1F]                 push compoundass_2
  5062 00001F1B E8CAE4                   call prs
  5063 00001F1E 83C402                   add  sp, 2
  5064 00001F21 E90900                   jmp .compoundass267
  5065                                  .compoundass266:
  5066 00001F24 68[741F]                 push compoundass_3
  5067 00001F27 E8BEE4                   call prs
  5068 00001F2A 83C402                   add  sp, 2
  5069                                  
  5070                                  ;-639   v(id1); prs(", ");
  5071                                  
  5072                                  .compoundass267:
  5073 00001F2D FF7608                   push word [bp+8]
  5074 00001F30 E8B0F0                   call v
  5075 00001F33 83C402                   add  sp, 2
  5076 00001F36 68[791F]                 push compoundass_4
  5077 00001F39 E8ACE4                   call prs
  5078 00001F3C 83C402                   add  sp, 2
  5079                                  
  5080                                  ;-640   expect(T_CONST); prunsign1(lexval);
  5081                                  
  5082 00001F3F 680101                   push 257
  5083 00001F42 E8A0EF                   call expect
  5084 00001F45 83C402                   add  sp, 2
  5085 00001F48 FF36[2C00]               push word [lexval]
  5086 00001F4C E8FCE5                   call prunsign1
  5087 00001F4F 83C402                   add  sp, 2
  5088                                  
  5089                                  ;-641 }
  5090                                  
  5091                                  
  5092                                  ;-642 int dovar1(int mode, int op, int ixarr, int id1) {
  5093 00001F52 C9                       LEAVE
  5094 00001F53 C3                       ret
  5095 00001F54 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5096 00001F5D 61722056617220616C-
  5097 00001F66 6C6F77656400       
  5098 00001F6C 202000                  compoundass_1 db "  ",0
  5099 00001F6F 776F726400              compoundass_2 db "word",0
  5100 00001F74 6279746500              compoundass_3 db "byte",0
  5101 00001F79 2C2000                  compoundass_4 db ", ",0
  5102                                  ENDP
  5103                                  
  5104                                  dovar1: PROC
  5105                                  
  5106                                  ;-643   gettypes(id1);
  5107                                  ;
  5108 00001F7C C8000000                 ENTER  0,0
  5109 00001F80 FF760A                   push word [bp+10]
  5110 00001F83 E80DF3                   call gettypes
  5111 00001F86 83C402                   add  sp, 2
  5112                                  
  5113                                  ;-644   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5114                                  
  5115 00001F89 8B4604                   mov ax, [bp+4]
  5116 00001F8C 83F801                   cmp ax, 1
  5117 00001F8F 0F854700                 jne .dovar1268
  5118 00001F93 68[D120]                 push dovar1_0
  5119 00001F96 E84FE4                   call prs
  5120 00001F99 83C402                   add  sp, 2
  5121 00001F9C FF760A                   push word [bp+10]
  5122 00001F9F E841F0                   call v
  5123 00001FA2 83C402                   add  sp, 2
  5124 00001FA5 E8D4E4                   call prnl
  5125 00001FA8 FF7606                   push word [bp+6]
  5126 00001FAB E83AE4                   call prs
  5127 00001FAE 83C402                   add  sp, 2
  5128                                  
  5129                                  ;-645     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5130                                  
  5131 00001FB1 A1[3400]                 mov ax, [widthi]
  5132 00001FB4 83F801                   cmp ax, 1
  5133 00001FB7 0F850900                 jne .dovar1269
  5134 00001FBB 68[DD20]                 push dovar1_1
  5135 00001FBE E827E4                   call prs
  5136 00001FC1 83C402                   add  sp, 2
  5137                                  
  5138                                  ;-646     if(widthi == 2) prs(" ax, [bx]");
  5139                                  
  5140                                  .dovar1269:
  5141 00001FC4 A1[3400]                 mov ax, [widthi]
  5142 00001FC7 83F802                   cmp ax, 2
  5143 00001FCA 0F850900                 jne .dovar1270
  5144 00001FCE 68[F320]                 push dovar1_2
  5145 00001FD1 E814E4                   call prs
  5146 00001FD4 83C402                   add  sp, 2
  5147                                  
  5148                                  ;-647     return; }
  5149                                  
  5150                                  .dovar1270:
  5151 00001FD7 E9F500                   jmp .retndovar1
  5152                                  
  5153                                  ;-648   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5154                                  
  5155                                  .dovar1268:
  5156 00001FDA 8B4604                   mov ax, [bp+4]
  5157 00001FDD 83F802                   cmp ax, 2
  5158 00001FE0 0F852100                 jne .dovar1271
  5159 00001FE4 E895E4                   call prnl
  5160 00001FE7 FF7606                   push word [bp+6]
  5161 00001FEA E8FBE3                   call prs
  5162 00001FED 83C402                   add  sp, 2
  5163 00001FF0 68[FD20]                 push dovar1_3
  5164 00001FF3 E8F2E3                   call prs
  5165 00001FF6 83C402                   add  sp, 2
  5166 00001FF9 FF760A                   push word [bp+10]
  5167 00001FFC E8D5EF                   call a
  5168 00001FFF 83C402                   add  sp, 2
  5169 00002002 E9CA00                   jmp .retndovar1
  5170                                  
  5171                                  ;-649   if (ixarr) {
  5172                                  
  5173                                  .dovar1271:
  5174 00002005 8B4608                   mov ax, [bp+8]
  5175 00002008 08C0                     or  al, al
  5176 0000200A 0F847300                 je .dovar1272
  5177                                  
  5178                                  ;-650     prs("\n mov bx, "); v(ixarr);
  5179                                  
  5180 0000200E 68[0321]                 push dovar1_4
  5181 00002011 E8D4E3                   call prs
  5182 00002014 83C402                   add  sp, 2
  5183 00002017 FF7608                   push word [bp+8]
  5184 0000201A E8C6EF                   call v
  5185 0000201D 83C402                   add  sp, 2
  5186                                  
  5187                                  ;-651     if (wi==2) prs("\n shl bx, 1");
  5188                                  
  5189 00002020 A1[3700]                 mov ax, [wi]
  5190 00002023 83F802                   cmp ax, 2
  5191 00002026 0F850900                 jne .dovar1273
  5192 0000202A 68[0F21]                 push dovar1_5
  5193 0000202D E8B8E3                   call prs
  5194 00002030 83C402                   add  sp, 2
  5195                                  
  5196                                  ;-652     prs("\n "); prs(op);
  5197                                  
  5198                                  .dovar1273:
  5199 00002033 68[1C21]                 push dovar1_6
  5200 00002036 E8AFE3                   call prs
  5201 00002039 83C402                   add  sp, 2
  5202 0000203C FF7606                   push word [bp+6]
  5203 0000203F E8A6E3                   call prs
  5204 00002042 83C402                   add  sp, 2
  5205                                  
  5206                                  ;-653     if (wi==2) prs(" ax, "); else prs(" al, ");
  5207                                  
  5208 00002045 A1[3700]                 mov ax, [wi]
  5209 00002048 83F802                   cmp ax, 2
  5210 0000204B 0F850C00                 jne .dovar1274
  5211 0000204F 68[2021]                 push dovar1_7
  5212 00002052 E893E3                   call prs
  5213 00002055 83C402                   add  sp, 2
  5214 00002058 E90900                   jmp .dovar1275
  5215                                  .dovar1274:
  5216 0000205B 68[2621]                 push dovar1_8
  5217 0000205E E887E3                   call prs
  5218 00002061 83C402                   add  sp, 2
  5219                                  
  5220                                  ;-654 // v(id1); prs(" [bx]");
  5221                                  
  5222                                  
  5223                                  ;-655     prc('['); printName(id1); prs(" + bx]");
  5224                                  
  5225                                  .dovar1275:
  5226 00002064 6A5B                     push 91
  5227 00002066 E826E3                   call prc
  5228 00002069 83C402                   add  sp, 2
  5229 0000206C FF760A                   push word [bp+10]
  5230 0000206F E8FEEE                   call printName
  5231 00002072 83C402                   add  sp, 2
  5232 00002075 68[2C21]                 push dovar1_9
  5233 00002078 E86DE3                   call prs
  5234 0000207B 83C402                   add  sp, 2
  5235                                  
  5236                                  ;-656     return; }
  5237                                  
  5238 0000207E E94E00                   jmp .retndovar1
  5239                                  
  5240                                  ;-657   prnl();prs(op);
  5241                                  
  5242                                  .dovar1272:
  5243 00002081 E8F8E3                   call prnl
  5244 00002084 FF7606                   push word [bp+6]
  5245 00002087 E85EE3                   call prs
  5246 0000208A 83C402                   add  sp, 2
  5247                                  
  5248                                  ;-658   if(wi==1) prs(" al, ");
  5249                                  
  5250 0000208D A1[3700]                 mov ax, [wi]
  5251 00002090 83F801                   cmp ax, 1
  5252 00002093 0F850900                 jne .dovar1276
  5253 00002097 68[3321]                 push dovar1_10
  5254 0000209A E84BE3                   call prs
  5255 0000209D 83C402                   add  sp, 2
  5256                                  
  5257                                  ;-659   if(wi==2) prs(" ax, ");
  5258                                  
  5259                                  .dovar1276:
  5260 000020A0 A1[3700]                 mov ax, [wi]
  5261 000020A3 83F802                   cmp ax, 2
  5262 000020A6 0F850900                 jne .dovar1277
  5263 000020AA 68[3921]                 push dovar1_11
  5264 000020AD E838E3                   call prs
  5265 000020B0 83C402                   add  sp, 2
  5266                                  
  5267                                  ;-660   if(wi==4) prs(" eax, ");
  5268                                  
  5269                                  .dovar1277:
  5270 000020B3 A1[3700]                 mov ax, [wi]
  5271 000020B6 83F804                   cmp ax, 4
  5272 000020B9 0F850900                 jne .dovar1278
  5273 000020BD 68[3F21]                 push dovar1_12
  5274 000020C0 E825E3                   call prs
  5275 000020C3 83C402                   add  sp, 2
  5276                                  
  5277                                  ;-661   v(id1);
  5278                                  
  5279                                  .dovar1278:
  5280 000020C6 FF760A                   push word [bp+10]
  5281 000020C9 E817EF                   call v
  5282 000020CC 83C402                   add  sp, 2
  5283                                  
  5284                                  ;-662 }
  5285                                  
  5286                                  
  5287                                  ;-663 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5288                                  
  5289 000020CF C9                       .retndovar1: LEAVE
  5290 000020D0 C3                       ret
  5291 000020D1 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5292 000020DA 2C2000             
  5293 000020DD 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5294 000020E6 5C6E206D6F76206168-
  5295 000020EF 2C203000           
  5296 000020F3 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5297 000020FC 00                 
  5298 000020FD 2061782C2000            dovar1_3 db " ax, ",0
  5299 00002103 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5300 0000210C 2C2000             
  5301 0000210F 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5302 00002118 2C203100           
  5303 0000211C 5C6E2000                dovar1_6 db "\n ",0
  5304 00002120 2061782C2000            dovar1_7 db " ax, ",0
  5305 00002126 20616C2C2000            dovar1_8 db " al, ",0
  5306 0000212C 202B2062785D00          dovar1_9 db " + bx]",0
  5307 00002133 20616C2C2000            dovar1_10 db " al, ",0
  5308 00002139 2061782C2000            dovar1_11 db " ax, ",0
  5309 0000213F 206561782C2000          dovar1_12 db " eax, ",0
  5310                                  ENDP
  5311                                  
  5312                                  rterm: PROC
  5313                                  
  5314                                  ;-664   if (istoken(T_CONST)) { prnl(); prs(op);
  5315                                  ;
  5316 00002146 C8080000                 ENTER  8,0
  5317 0000214A 680101                   push 257
  5318 0000214D E873ED                   call istoken
  5319 00002150 83C402                   add  sp, 2
  5320 00002153 08C0                     or  al, al
  5321 00002155 0F845200                 je .rterm279
  5322 00002159 E820E3                   call prnl
  5323 0000215C FF7604                   push word [bp+4]
  5324 0000215F E886E2                   call prs
  5325 00002162 83C402                   add  sp, 2
  5326                                  
  5327                                  ;-665     if (wi==1) prs(" al, ");
  5328                                  
  5329 00002165 A1[3700]                 mov ax, [wi]
  5330 00002168 83F801                   cmp ax, 1
  5331 0000216B 0F850900                 jne .rterm280
  5332 0000216F 68[2F22]                 push rterm_0
  5333 00002172 E873E2                   call prs
  5334 00002175 83C402                   add  sp, 2
  5335                                  
  5336                                  ;-666     if (wi==2) prs(" ax, ");
  5337                                  
  5338                                  .rterm280:
  5339 00002178 A1[3700]                 mov ax, [wi]
  5340 0000217B 83F802                   cmp ax, 2
  5341 0000217E 0F850900                 jne .rterm281
  5342 00002182 68[3522]                 push rterm_1
  5343 00002185 E860E2                   call prs
  5344 00002188 83C402                   add  sp, 2
  5345                                  
  5346                                  ;-667     if (wi==4) prs(" eax, ");
  5347                                  
  5348                                  .rterm281:
  5349 0000218B A1[3700]                 mov ax, [wi]
  5350 0000218E 83F804                   cmp ax, 4
  5351 00002191 0F850900                 jne .rterm282
  5352 00002195 68[3B22]                 push rterm_2
  5353 00002198 E84DE2                   call prs
  5354 0000219B 83C402                   add  sp, 2
  5355                                  
  5356                                  ;-668     prunsign1(lexval); return;}
  5357                                  
  5358                                  .rterm282:
  5359 0000219E FF36[2C00]               push word [lexval]
  5360 000021A2 E8A6E3                   call prunsign1
  5361 000021A5 83C402                   add  sp, 2
  5362 000021A8 E98200                   jmp .retnrterm
  5363                                  
  5364                                  ;-669   mode=typeName(); id1=searchname(); ixarr=0;
  5365                                  
  5366                                  .rterm279:
  5367 000021AB E80CF0                   call typeName
  5368 000021AE 8946FE                   mov [bp-2], ax
  5369 000021B1 E893EF                   call searchname
  5370 000021B4 8946F8                   mov [bp-8], ax
  5371 000021B7 B80000                   mov ax, 0
  5372 000021BA 8946FA                   mov [bp-6], ax
  5373                                  
  5374                                  ;-670   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5375                                  
  5376 000021BD 6A5B                     push 91
  5377 000021BF E801ED                   call istoken
  5378 000021C2 83C402                   add  sp, 2
  5379 000021C5 08C0                     or  al, al
  5380 000021C7 0F843300                 je .rterm283
  5381 000021CB E879EF                   call searchname
  5382 000021CE 8946FA                   mov [bp-6], ax
  5383 000021D1 680001                   push 256
  5384 000021D4 E80EED                   call expect
  5385 000021D7 83C402                   add  sp, 2
  5386 000021DA 6A5D                     push 93
  5387 000021DC E806ED                   call expect
  5388 000021DF 83C402                   add  sp, 2
  5389                                  
  5390                                  ;-671     gettypes(ixarr);
  5391                                  
  5392 000021E2 FF76FA                   push word [bp-6]
  5393 000021E5 E8ABF0                   call gettypes
  5394 000021E8 83C402                   add  sp, 2
  5395                                  
  5396                                  ;-672     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5397                                  
  5398 000021EB A1[3400]                 mov ax, [widthi]
  5399 000021EE 83F802                   cmp ax, 2
  5400 000021F1 0F840900                 je  .rterm284
  5401 000021F5 68[4222]                 push rterm_3
  5402 000021F8 E80EE4                   call error1
  5403 000021FB 83C402                   add  sp, 2
  5404                                  .rterm284:
  5405                                  
  5406                                  ;-673   if (eqstr(symbol,"_AX")) return;
  5407                                  
  5408                                  .rterm283:
  5409 000021FE 68[5B22]                 push rterm_4
  5410 00002201 8D06BB69                 lea  ax, [symbol]
  5411 00002205 50                       push ax
  5412 00002206 E85FE0                   call eqstr
  5413 00002209 83C404                   add  sp, 4
  5414 0000220C 08C0                     or  al, al
  5415 0000220E 0F840300                 je .rterm285
  5416 00002212 E91800                   jmp .retnrterm
  5417                                  
  5418                                  ;-674   opint=op; dovar1(mode, opint, ixarr, id1);
  5419                                  
  5420                                  .rterm285:
  5421 00002215 8B4604                   mov ax, [bp+4]
  5422 00002218 8946FC                   mov [bp-4], ax
  5423 0000221B FF76F8                   push word [bp-8]
  5424 0000221E FF76FA                   push word [bp-6]
  5425 00002221 FF76FC                   push word [bp-4]
  5426 00002224 FF76FE                   push word [bp-2]
  5427 00002227 E852FD                   call dovar1
  5428 0000222A 83C408                   add  sp, 8
  5429                                  
  5430                                  ;-675 }
  5431                                  
  5432                                  
  5433                                  ;-676 
  5434                                  
  5435                                  
  5436                                  ;-677 int doreg(char *dr) { int i; expect('=');
  5437                                  
  5438 0000222D C9                       .retnrterm: LEAVE
  5439 0000222E C3                       ret
  5440 0000222F 20616C2C2000            rterm_0 db " al, ",0
  5441 00002235 2061782C2000            rterm_1 db " ax, ",0
  5442 0000223B 206561782C2000          rterm_2 db " eax, ",0
  5443 00002242 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5444 0000224B 78206D75737320696E-
  5445 00002254 74207365696E00     
  5446 0000225B 5F415800                rterm_4 db "_AX",0
  5447                                  ENDP
  5448                                  
  5449                                  doreg: PROC;
  5450 0000225F C8020000                 ENTER  2,0
  5451 00002263 6A3D                     push 61
  5452 00002265 E87DEC                   call expect
  5453 00002268 83C402                   add  sp, 2
  5454                                  
  5455                                  ;-678   prs("\n mov  "); prs(dr); prs(", ");
  5456                                  
  5457 0000226B 68[CE22]                 push doreg_0
  5458 0000226E E877E1                   call prs
  5459 00002271 83C402                   add  sp, 2
  5460 00002274 FF7604                   push word [bp+4]
  5461 00002277 E86EE1                   call prs
  5462 0000227A 83C402                   add  sp, 2
  5463 0000227D 68[D722]                 push doreg_1
  5464 00002280 E865E1                   call prs
  5465 00002283 83C402                   add  sp, 2
  5466                                  
  5467                                  ;-679        if (istoken(T_CONST)) prunsign1(lexval);
  5468                                  
  5469 00002286 680101                   push 257
  5470 00002289 E837EC                   call istoken
  5471 0000228C 83C402                   add  sp, 2
  5472 0000228F 08C0                     or  al, al
  5473 00002291 0F840D00                 je .doreg286
  5474 00002295 FF36[2C00]               push word [lexval]
  5475 00002299 E8AFE2                   call prunsign1
  5476 0000229C 83C402                   add  sp, 2
  5477                                  
  5478                                  ;-680   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5479                                  
  5480 0000229F E92A00                   jmp .doreg287
  5481                                  .doreg286:
  5482 000022A2 680001                   push 256
  5483 000022A5 E81BEC                   call istoken
  5484 000022A8 83C402                   add  sp, 2
  5485 000022AB 08C0                     or  al, al
  5486 000022AD 0F841200                 je .doreg288
  5487 000022B1 E893EE                   call searchname
  5488 000022B4 8946FE                   mov [bp-2], ax
  5489 000022B7 FF76FE                   push word [bp-2]
  5490 000022BA E826ED                   call v
  5491 000022BD 83C402                   add  sp, 2
  5492                                  
  5493                                  ;-681   else error1("only number or var allowed");
  5494                                  
  5495 000022C0 E90900                   jmp .doreg289
  5496                                  .doreg288:
  5497 000022C3 68[DA22]                 push doreg_2
  5498 000022C6 E840E3                   call error1
  5499 000022C9 83C402                   add  sp, 2
  5500                                  
  5501                                  ;-682 }
  5502                                  
  5503                                  .doreg289:
  5504                                  .doreg287:
  5505                                  
  5506                                  ;-683 int isreg() {
  5507 000022CC C9                       LEAVE
  5508 000022CD C3                       ret
  5509 000022CE 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5510 000022D7 2C2000                  doreg_1 db ", ",0
  5511 000022DA 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5512 000022E3 6572206F7220766172-
  5513 000022EC 20616C6C6F77656400 
  5514                                  ENDP
  5515                                  
  5516                                  isreg: PROC
  5517                                  
  5518                                  ;-684   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5519                                  
  5520 000022F5 68[E224]                 push isreg_0
  5521 000022F8 8D06BB69                 lea  ax, [symbol]
  5522 000022FC 50                       push ax
  5523 000022FD E868DF                   call eqstr
  5524 00002300 83C404                   add  sp, 4
  5525 00002303 08C0                     or  al, al
  5526 00002305 0F840C00                 je .isreg290
  5527 00002309 68[E624]                 push isreg_1
  5528 0000230C E850FF                   call doreg
  5529 0000230F 83C402                   add  sp, 2
  5530 00002312 E9C601                   jmp .r1
  5531                                  
  5532                                  ;-685   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5533                                  
  5534                                  .isreg290:
  5535 00002315 68[E924]                 push isreg_2
  5536 00002318 8D06BB69                 lea  ax, [symbol]
  5537 0000231C 50                       push ax
  5538 0000231D E848DF                   call eqstr
  5539 00002320 83C404                   add  sp, 4
  5540 00002323 08C0                     or  al, al
  5541 00002325 0F840C00                 je .isreg291
  5542 00002329 68[ED24]                 push isreg_3
  5543 0000232C E830FF                   call doreg
  5544 0000232F 83C402                   add  sp, 2
  5545 00002332 E9A601                   jmp .r1
  5546                                  
  5547                                  ;-686   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5548                                  
  5549                                  .isreg291:
  5550 00002335 68[F024]                 push isreg_4
  5551 00002338 8D06BB69                 lea  ax, [symbol]
  5552 0000233C 50                       push ax
  5553 0000233D E828DF                   call eqstr
  5554 00002340 83C404                   add  sp, 4
  5555 00002343 08C0                     or  al, al
  5556 00002345 0F840C00                 je .isreg292
  5557 00002349 68[F424]                 push isreg_5
  5558 0000234C E810FF                   call doreg
  5559 0000234F 83C402                   add  sp, 2
  5560 00002352 E98601                   jmp .r1
  5561                                  
  5562                                  ;-687   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5563                                  
  5564                                  .isreg292:
  5565 00002355 68[F724]                 push isreg_6
  5566 00002358 8D06BB69                 lea  ax, [symbol]
  5567 0000235C 50                       push ax
  5568 0000235D E808DF                   call eqstr
  5569 00002360 83C404                   add  sp, 4
  5570 00002363 08C0                     or  al, al
  5571 00002365 0F840C00                 je .isreg293
  5572 00002369 68[FB24]                 push isreg_7
  5573 0000236C E8F0FE                   call doreg
  5574 0000236F 83C402                   add  sp, 2
  5575 00002372 E96601                   jmp .r1
  5576                                  
  5577                                  ;-688   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5578                                  
  5579                                  .isreg293:
  5580 00002375 68[FE24]                 push isreg_8
  5581 00002378 8D06BB69                 lea  ax, [symbol]
  5582 0000237C 50                       push ax
  5583 0000237D E8E8DE                   call eqstr
  5584 00002380 83C404                   add  sp, 4
  5585 00002383 08C0                     or  al, al
  5586 00002385 0F840C00                 je .isreg294
  5587 00002389 68[0225]                 push isreg_9
  5588 0000238C E8D0FE                   call doreg
  5589 0000238F 83C402                   add  sp, 2
  5590 00002392 E94601                   jmp .r1
  5591                                  
  5592                                  ;-689   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5593                                  
  5594                                  .isreg294:
  5595 00002395 68[0525]                 push isreg_10
  5596 00002398 8D06BB69                 lea  ax, [symbol]
  5597 0000239C 50                       push ax
  5598 0000239D E8C8DE                   call eqstr
  5599 000023A0 83C404                   add  sp, 4
  5600 000023A3 08C0                     or  al, al
  5601 000023A5 0F840C00                 je .isreg295
  5602 000023A9 68[0925]                 push isreg_11
  5603 000023AC E8B0FE                   call doreg
  5604 000023AF 83C402                   add  sp, 2
  5605 000023B2 E92601                   jmp .r1
  5606                                  
  5607                                  ;-690   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5608                                  
  5609                                  .isreg295:
  5610 000023B5 68[0C25]                 push isreg_12
  5611 000023B8 8D06BB69                 lea  ax, [symbol]
  5612 000023BC 50                       push ax
  5613 000023BD E8A8DE                   call eqstr
  5614 000023C0 83C404                   add  sp, 4
  5615 000023C3 08C0                     or  al, al
  5616 000023C5 0F840C00                 je .isreg296
  5617 000023C9 68[1025]                 push isreg_13
  5618 000023CC E890FE                   call doreg
  5619 000023CF 83C402                   add  sp, 2
  5620 000023D2 E90601                   jmp .r1
  5621                                  
  5622                                  ;-691   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5623                                  
  5624                                  .isreg296:
  5625 000023D5 68[1325]                 push isreg_14
  5626 000023D8 8D06BB69                 lea  ax, [symbol]
  5627 000023DC 50                       push ax
  5628 000023DD E888DE                   call eqstr
  5629 000023E0 83C404                   add  sp, 4
  5630 000023E3 08C0                     or  al, al
  5631 000023E5 0F840C00                 je .isreg297
  5632 000023E9 68[1725]                 push isreg_15
  5633 000023EC E870FE                   call doreg
  5634 000023EF 83C402                   add  sp, 2
  5635 000023F2 E9E600                   jmp .r1
  5636                                  
  5637                                  ;-692   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5638                                  
  5639                                  .isreg297:
  5640 000023F5 68[1A25]                 push isreg_16
  5641 000023F8 8D06BB69                 lea  ax, [symbol]
  5642 000023FC 50                       push ax
  5643 000023FD E868DE                   call eqstr
  5644 00002400 83C404                   add  sp, 4
  5645 00002403 08C0                     or  al, al
  5646 00002405 0F840C00                 je .isreg298
  5647 00002409 68[1E25]                 push isreg_17
  5648 0000240C E850FE                   call doreg
  5649 0000240F 83C402                   add  sp, 2
  5650 00002412 E9C600                   jmp .r1
  5651                                  
  5652                                  ;-693   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5653                                  
  5654                                  .isreg298:
  5655 00002415 68[2125]                 push isreg_18
  5656 00002418 8D06BB69                 lea  ax, [symbol]
  5657 0000241C 50                       push ax
  5658 0000241D E848DE                   call eqstr
  5659 00002420 83C404                   add  sp, 4
  5660 00002423 08C0                     or  al, al
  5661 00002425 0F840C00                 je .isreg299
  5662 00002429 68[2525]                 push isreg_19
  5663 0000242C E830FE                   call doreg
  5664 0000242F 83C402                   add  sp, 2
  5665 00002432 E9A600                   jmp .r1
  5666                                  
  5667                                  ;-694   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5668                                  
  5669                                  .isreg299:
  5670 00002435 68[2825]                 push isreg_20
  5671 00002438 8D06BB69                 lea  ax, [symbol]
  5672 0000243C 50                       push ax
  5673 0000243D E828DE                   call eqstr
  5674 00002440 83C404                   add  sp, 4
  5675 00002443 08C0                     or  al, al
  5676 00002445 0F840C00                 je .isreg300
  5677 00002449 68[2C25]                 push isreg_21
  5678 0000244C E810FE                   call doreg
  5679 0000244F 83C402                   add  sp, 2
  5680 00002452 E98600                   jmp .r1
  5681                                  
  5682                                  ;-695   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5683                                  
  5684                                  .isreg300:
  5685 00002455 68[2F25]                 push isreg_22
  5686 00002458 8D06BB69                 lea  ax, [symbol]
  5687 0000245C 50                       push ax
  5688 0000245D E808DE                   call eqstr
  5689 00002460 83C404                   add  sp, 4
  5690 00002463 08C0                     or  al, al
  5691 00002465 0F840C00                 je .isreg301
  5692 00002469 68[3325]                 push isreg_23
  5693 0000246C E8F0FD                   call doreg
  5694 0000246F 83C402                   add  sp, 2
  5695 00002472 E96600                   jmp .r1
  5696                                  
  5697                                  ;-696   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5698                                  
  5699                                  .isreg301:
  5700 00002475 68[3625]                 push isreg_24
  5701 00002478 8D06BB69                 lea  ax, [symbol]
  5702 0000247C 50                       push ax
  5703 0000247D E8E8DD                   call eqstr
  5704 00002480 83C404                   add  sp, 4
  5705 00002483 08C0                     or  al, al
  5706 00002485 0F840C00                 je .isreg302
  5707 00002489 68[3A25]                 push isreg_25
  5708 0000248C E8D0FD                   call doreg
  5709 0000248F 83C402                   add  sp, 2
  5710 00002492 E94600                   jmp .r1
  5711                                  
  5712                                  ;-697   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5713                                  
  5714                                  .isreg302:
  5715 00002495 68[3D25]                 push isreg_26
  5716 00002498 8D06BB69                 lea  ax, [symbol]
  5717 0000249C 50                       push ax
  5718 0000249D E8C8DD                   call eqstr
  5719 000024A0 83C404                   add  sp, 4
  5720 000024A3 08C0                     or  al, al
  5721 000024A5 0F840C00                 je .isreg303
  5722 000024A9 68[4125]                 push isreg_27
  5723 000024AC E8B0FD                   call doreg
  5724 000024AF 83C402                   add  sp, 2
  5725 000024B2 E92600                   jmp .r1
  5726                                  
  5727                                  ;-698   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5728                                  
  5729                                  .isreg303:
  5730 000024B5 68[4425]                 push isreg_28
  5731 000024B8 8D06BB69                 lea  ax, [symbol]
  5732 000024BC 50                       push ax
  5733 000024BD E8A8DD                   call eqstr
  5734 000024C0 83C404                   add  sp, 4
  5735 000024C3 08C0                     or  al, al
  5736 000024C5 0F840C00                 je .isreg304
  5737 000024C9 68[4B25]                 push isreg_29
  5738 000024CC E890FD                   call doreg
  5739 000024CF 83C402                   add  sp, 2
  5740 000024D2 E90600                   jmp .r1
  5741                                  
  5742                                  ;-699   return 0;   r1: return 1;
  5743                                  
  5744                                  .isreg304:
  5745 000024D5 B80000                   mov ax, 0
  5746 000024D8 E90600                   jmp .retnisreg
  5747                                  .r1:
  5748 000024DB B80100                   mov ax, 1
  5749 000024DE E90000                   jmp .retnisreg
  5750                                  
  5751                                  ;-700 }
  5752                                  
  5753                                  
  5754                                  ;-701 
  5755                                  
  5756                                  
  5757                                  ;-702 int doassign(int mode, int i, int ixarr, int ixconst) {
  5758                                  
  5759                                   .retnisreg:
  5760 000024E1 C3                       ret
  5761 000024E2 5F414800                isreg_0 db "_AH",0
  5762 000024E6 616800                  isreg_1 db "ah",0
  5763 000024E9 5F414C00                isreg_2 db "_AL",0
  5764 000024ED 616C00                  isreg_3 db "al",0
  5765 000024F0 5F415800                isreg_4 db "_AX",0
  5766 000024F4 617800                  isreg_5 db "ax",0
  5767 000024F7 5F424800                isreg_6 db "_BH",0
  5768 000024FB 626800                  isreg_7 db "bh",0
  5769 000024FE 5F424C00                isreg_8 db "_BL",0
  5770 00002502 626C00                  isreg_9 db "bl",0
  5771 00002505 5F425800                isreg_10 db "_BX",0
  5772 00002509 627800                  isreg_11 db "bx",0
  5773 0000250C 5F434800                isreg_12 db "_CH",0
  5774 00002510 636800                  isreg_13 db "ch",0
  5775 00002513 5F434C00                isreg_14 db "_CL",0
  5776 00002517 636C00                  isreg_15 db "cl",0
  5777 0000251A 5F435800                isreg_16 db "_CX",0
  5778 0000251E 637800                  isreg_17 db "cx",0
  5779 00002521 5F444800                isreg_18 db "_DH",0
  5780 00002525 646800                  isreg_19 db "dh",0
  5781 00002528 5F444C00                isreg_20 db "_DL",0
  5782 0000252C 646C00                  isreg_21 db "dl",0
  5783 0000252F 5F445800                isreg_22 db "_DX",0
  5784 00002533 647800                  isreg_23 db "dx",0
  5785 00002536 5F534900                isreg_24 db "_SI",0
  5786 0000253A 736900                  isreg_25 db "si",0
  5787 0000253D 5F444900                isreg_26 db "_DI",0
  5788 00002541 646900                  isreg_27 db "di",0
  5789 00002544 5F464C41475300          isreg_28 db "_FLAGS",0
  5790 0000254B 666C61677300            isreg_29 db "flags",0
  5791                                  ENDP
  5792                                  
  5793                                  doassign: PROC
  5794                                  
  5795                                  ;-703   gettypes(i);
  5796                                  ;
  5797 00002551 C8000000                 ENTER  0,0
  5798 00002555 FF7606                   push word [bp+6]
  5799 00002558 E838ED                   call gettypes
  5800 0000255B 83C402                   add  sp, 2
  5801                                  
  5802                                  ;-704   if (mode==1) {prs("\n mov  bx, ");v(i);
  5803                                  
  5804 0000255E 8B4604                   mov ax, [bp+4]
  5805 00002561 83F801                   cmp ax, 1
  5806 00002564 0F853400                 jne .doassign305
  5807 00002568 68[EE26]                 push doassign_0
  5808 0000256B E87ADE                   call prs
  5809 0000256E 83C402                   add  sp, 2
  5810 00002571 FF7606                   push word [bp+6]
  5811 00002574 E86CEA                   call v
  5812 00002577 83C402                   add  sp, 2
  5813                                  
  5814                                  ;-705     if (widthi == 2) prs("\n mov  [bx], ax");
  5815                                  
  5816 0000257A A1[3400]                 mov ax, [widthi]
  5817 0000257D 83F802                   cmp ax, 2
  5818 00002580 0F850C00                 jne .doassign306
  5819 00002584 68[FB26]                 push doassign_1
  5820 00002587 E85EDE                   call prs
  5821 0000258A 83C402                   add  sp, 2
  5822                                  
  5823                                  ;-706     else  prs("\n mov  [bx], al"); return;}
  5824                                  
  5825 0000258D E90900                   jmp .doassign307
  5826                                  .doassign306:
  5827 00002590 68[0C27]                 push doassign_2
  5828 00002593 E852DE                   call prs
  5829 00002596 83C402                   add  sp, 2
  5830                                  .doassign307:
  5831 00002599 E95001                   jmp .retndoassign
  5832                                  
  5833                                  ;-707   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5834                                  
  5835                                  .doassign305:
  5836 0000259C 8B4604                   mov ax, [bp+4]
  5837 0000259F 83F802                   cmp ax, 2
  5838 000025A2 0F851E00                 jne .doassign308
  5839 000025A6 68[1D27]                 push doassign_3
  5840 000025A9 E83CDE                   call prs
  5841 000025AC 83C402                   add  sp, 2
  5842 000025AF FF7606                   push word [bp+6]
  5843 000025B2 E81FEA                   call a
  5844 000025B5 83C402                   add  sp, 2
  5845 000025B8 68[2627]                 push doassign_4
  5846 000025BB E82ADE                   call prs
  5847 000025BE 83C402                   add  sp, 2
  5848 000025C1 E92801                   jmp .retndoassign
  5849                                  
  5850                                  ;-708   if (ixarr) {  prs("\n mov bx, ");
  5851                                  
  5852                                  .doassign308:
  5853 000025C4 8B4608                   mov ax, [bp+8]
  5854 000025C7 08C0                     or  al, al
  5855 000025C9 0F846E00                 je .doassign309
  5856 000025CD 68[2B27]                 push doassign_5
  5857 000025D0 E815DE                   call prs
  5858 000025D3 83C402                   add  sp, 2
  5859                                  
  5860                                  ;-709     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5861                                  
  5862 000025D6 8B460A                   mov ax, [bp+10]
  5863 000025D9 08C0                     or  al, al
  5864 000025DB 0F840C00                 je .doassign310
  5865 000025DF FF7608                   push word [bp+8]
  5866 000025E2 E866DF                   call prunsign1
  5867 000025E5 83C402                   add  sp, 2
  5868 000025E8 E90900                   jmp .doassign311
  5869                                  .doassign310:
  5870 000025EB FF7608                   push word [bp+8]
  5871 000025EE E8F2E9                   call v
  5872 000025F1 83C402                   add  sp, 2
  5873                                  
  5874                                  ;-710     if (wi==2) prs("\n shl bx, 1");
  5875                                  
  5876                                  .doassign311:
  5877 000025F4 A1[3700]                 mov ax, [wi]
  5878 000025F7 83F802                   cmp ax, 2
  5879 000025FA 0F850900                 jne .doassign312
  5880 000025FE 68[3727]                 push doassign_6
  5881 00002601 E8E4DD                   call prs
  5882 00002604 83C402                   add  sp, 2
  5883                                  
  5884                                  ;-711     prs("\n mov ["); printName(i);
  5885                                  
  5886                                  .doassign312:
  5887 00002607 68[4427]                 push doassign_7
  5888 0000260A E8DBDD                   call prs
  5889 0000260D 83C402                   add  sp, 2
  5890 00002610 FF7606                   push word [bp+6]
  5891 00002613 E85AE9                   call printName
  5892 00002616 83C402                   add  sp, 2
  5893                                  
  5894                                  ;-712     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5895                                  
  5896 00002619 A1[3700]                 mov ax, [wi]
  5897 0000261C 83F802                   cmp ax, 2
  5898 0000261F 0F850C00                 jne .doassign313
  5899 00002623 68[4D27]                 push doassign_8
  5900 00002626 E8BFDD                   call prs
  5901 00002629 83C402                   add  sp, 2
  5902 0000262C E90900                   jmp .doassign314
  5903                                  .doassign313:
  5904 0000262F 68[5627]                 push doassign_9
  5905 00002632 E8B3DD                   call prs
  5906 00002635 83C402                   add  sp, 2
  5907                                  .doassign314:
  5908 00002638 E9B100                   jmp .retndoassign
  5909                                  
  5910                                  ;-713   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5911                                  
  5912                                  .doassign309:
  5913 0000263B A1[3700]                 mov ax, [wi]
  5914 0000263E 83F801                   cmp ax, 1
  5915 00002641 0F853100                 jne .doassign315
  5916 00002645 68[5F27]                 push doassign_10
  5917 00002648 E89DDD                   call prs
  5918 0000264B 83C402                   add  sp, 2
  5919 0000264E 8B4606                   mov ax, [bp+6]
  5920 00002651 3DC800                   cmp ax, 200
  5921 00002654 0F8D0900                 jge .doassign316
  5922 00002658 68[6727]                 push doassign_11
  5923 0000265B E88ADD                   call prs
  5924 0000265E 83C402                   add  sp, 2
  5925                                  
  5926                                  ;-714     } v(i); prs(", al"); return; }
  5927                                  
  5928                                  .doassign316:
  5929 00002661 FF7606                   push word [bp+6]
  5930 00002664 E87CE9                   call v
  5931 00002667 83C402                   add  sp, 2
  5932 0000266A 68[6D27]                 push doassign_12
  5933 0000266D E878DD                   call prs
  5934 00002670 83C402                   add  sp, 2
  5935 00002673 E97600                   jmp .retndoassign
  5936                                  
  5937                                  ;-715   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5938                                  
  5939                                  .doassign315:
  5940 00002676 A1[3700]                 mov ax, [wi]
  5941 00002679 83F802                   cmp ax, 2
  5942 0000267C 0F853100                 jne .doassign317
  5943 00002680 68[7227]                 push doassign_13
  5944 00002683 E862DD                   call prs
  5945 00002686 83C402                   add  sp, 2
  5946 00002689 8B4606                   mov ax, [bp+6]
  5947 0000268C 3DC800                   cmp ax, 200
  5948 0000268F 0F8D0900                 jge .doassign318
  5949 00002693 68[7A27]                 push doassign_14
  5950 00002696 E84FDD                   call prs
  5951 00002699 83C402                   add  sp, 2
  5952                                  
  5953                                  ;-716     } v(i); prs(", ax"); return; }
  5954                                  
  5955                                  .doassign318:
  5956 0000269C FF7606                   push word [bp+6]
  5957 0000269F E841E9                   call v
  5958 000026A2 83C402                   add  sp, 2
  5959 000026A5 68[8027]                 push doassign_15
  5960 000026A8 E83DDD                   call prs
  5961 000026AB 83C402                   add  sp, 2
  5962 000026AE E93B00                   jmp .retndoassign
  5963                                  
  5964                                  ;-717   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5965                                  
  5966                                  .doassign317:
  5967 000026B1 A1[3700]                 mov ax, [wi]
  5968 000026B4 83F804                   cmp ax, 4
  5969 000026B7 0F853100                 jne .doassign319
  5970 000026BB 68[8527]                 push doassign_16
  5971 000026BE E827DD                   call prs
  5972 000026C1 83C402                   add  sp, 2
  5973 000026C4 8B4606                   mov ax, [bp+6]
  5974 000026C7 3DC800                   cmp ax, 200
  5975 000026CA 0F8D0900                 jge .doassign320
  5976 000026CE 68[8D27]                 push doassign_17
  5977 000026D1 E814DD                   call prs
  5978 000026D4 83C402                   add  sp, 2
  5979                                  
  5980                                  ;-718     } v(i); prs(", eax"); return; }
  5981                                  
  5982                                  .doassign320:
  5983 000026D7 FF7606                   push word [bp+6]
  5984 000026DA E806E9                   call v
  5985 000026DD 83C402                   add  sp, 2
  5986 000026E0 68[9427]                 push doassign_18
  5987 000026E3 E802DD                   call prs
  5988 000026E6 83C402                   add  sp, 2
  5989 000026E9 E90000                   jmp .retndoassign
  5990                                  
  5991                                  ;-719 }
  5992                                  
  5993                                  .doassign319:
  5994                                  
  5995                                  ;-720 int domul(int ids) {
  5996                                  
  5997 000026EC C9                       .retndoassign: LEAVE
  5998 000026ED C3                       ret
  5999 000026EE 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  6000 000026F7 782C2000           
  6001 000026FB 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  6002 00002704 62785D2C20617800   
  6003 0000270C 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  6004 00002715 62785D2C20616C00   
  6005 0000271D 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  6006 00002726 2C20617800              doassign_4 db ", ax",0
  6007 0000272B 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  6008 00002734 2C2000             
  6009 00002737 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  6010 00002740 2C203100           
  6011 00002744 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  6012 0000274D 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  6013 00002756 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  6014 0000275F 5C6E206D6F762000        doassign_10 db "\n mov ",0
  6015 00002767 627974652000            doassign_11 db "byte ",0
  6016 0000276D 2C20616C00              doassign_12 db ", al",0
  6017 00002772 5C6E206D6F762000        doassign_13 db "\n mov ",0
  6018 0000277A 776F72642000            doassign_14 db "word ",0
  6019 00002780 2C20617800              doassign_15 db ", ax",0
  6020 00002785 5C6E206D6F762000        doassign_16 db "\n mov ",0
  6021 0000278D 64776F72642000          doassign_17 db "dword ",0
  6022 00002794 2C2065617800            doassign_18 db ", eax",0
  6023                                  ENDP
  6024                                  
  6025                                  domul: PROC
  6026                                  
  6027                                  ;-721   if (ids) rterm("imul"); else {
  6028                                  ;
  6029 0000279A C8000000                 ENTER  0,0
  6030 0000279E 8B4604                   mov ax, [bp+4]
  6031 000027A1 08C0                     or  al, al
  6032 000027A3 0F840C00                 je .domul321
  6033 000027A7 68[EC27]                 push domul_0
  6034 000027AA E899F9                   call rterm
  6035 000027AD 83C402                   add  sp, 2
  6036 000027B0 E93700                   jmp .domul322
  6037                                  .domul321:
  6038                                  
  6039                                  ;-722   if (istoken(T_CONST)) {
  6040                                  
  6041 000027B3 680101                   push 257
  6042 000027B6 E80AE7                   call istoken
  6043 000027B9 83C402                   add  sp, 2
  6044 000027BC 08C0                     or  al, al
  6045 000027BE 0F841F00                 je .domul323
  6046                                  
  6047                                  ;-723     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6048                                  
  6049 000027C2 68[F127]                 push domul_1
  6050 000027C5 E820DC                   call prs
  6051 000027C8 83C402                   add  sp, 2
  6052 000027CB FF36[2C00]               push word [lexval]
  6053 000027CF E879DD                   call prunsign1
  6054 000027D2 83C402                   add  sp, 2
  6055 000027D5 68[FD27]                 push domul_2
  6056 000027D8 E80DDC                   call prs
  6057 000027DB 83C402                   add  sp, 2
  6058                                  
  6059                                  ;-724     }
  6060                                  
  6061                                  
  6062                                  ;-725   else error1("with MUL only const number as multiplicator allowed"); } }
  6063                                  
  6064 000027DE E90900                   jmp .domul324
  6065                                  .domul323:
  6066 000027E1 68[0728]                 push domul_3
  6067 000027E4 E822DE                   call error1
  6068 000027E7 83C402                   add  sp, 2
  6069                                  .domul324:
  6070                                  .domul322:
  6071                                  
  6072                                  ;-726 int doidiv(int ids) { int mode; int id1;
  6073 000027EA C9                       LEAVE
  6074 000027EB C3                       ret
  6075 000027EC 696D756C00              domul_0 db "imul",0
  6076 000027F1 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6077 000027FA 2C2000             
  6078 000027FD 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6079 00002806 00                 
  6080 00002807 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6081 00002810 6F6E6C7920636F6E73-
  6082 00002819 74206E756D62657220-
  6083 00002822 6173206D756C746970-
  6084 0000282B 6C696361746F722061-
  6085 00002834 6C6C6F77656400     
  6086                                  ENDP
  6087                                  
  6088                                  doidiv: PROC
  6089                                  
  6090                                  ;-727   if (istoken(T_CONST)) {
  6091                                  ;
  6092 0000283B C8040000                 ENTER  4,0
  6093 0000283F 680101                   push 257
  6094 00002842 E87EE6                   call istoken
  6095 00002845 83C402                   add  sp, 2
  6096 00002848 08C0                     or  al, al
  6097 0000284A 0F843400                 je .doidiv325
  6098                                  
  6099                                  ;-728     prs("\n mov bx, "); prunsign1(lexval);
  6100                                  
  6101 0000284E 68[0029]                 push doidiv_0
  6102 00002851 E894DB                   call prs
  6103 00002854 83C402                   add  sp, 2
  6104 00002857 FF36[2C00]               push word [lexval]
  6105 0000285B E8EDDC                   call prunsign1
  6106 0000285E 83C402                   add  sp, 2
  6107                                  
  6108                                  ;-729     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6109                                  
  6110 00002861 8B4604                   mov ax, [bp+4]
  6111 00002864 08C0                     or  al, al
  6112 00002866 0F840C00                 je .doidiv326
  6113 0000286A 68[0C29]                 push doidiv_1
  6114 0000286D E878DB                   call prs
  6115 00002870 83C402                   add  sp, 2
  6116 00002873 E90900                   jmp .doidiv327
  6117                                  .doidiv326:
  6118 00002876 68[1D29]                 push doidiv_2
  6119 00002879 E86CDB                   call prs
  6120 0000287C 83C402                   add  sp, 2
  6121                                  .doidiv327:
  6122                                  
  6123                                  ;-730   else {
  6124                                  
  6125 0000287F E97C00                   jmp .doidiv328
  6126                                  .doidiv325:
  6127                                  
  6128                                  ;-731     mode=typeName(); id1=searchname();
  6129                                  
  6130 00002882 E835E9                   call typeName
  6131 00002885 8946FE                   mov [bp-2], ax
  6132 00002888 E8BCE8                   call searchname
  6133 0000288B 8946FC                   mov [bp-4], ax
  6134                                  
  6135                                  ;-732     if (mode) error1("only const number or int as divisor allowed");
  6136                                  
  6137 0000288E 8B46FE                   mov ax, [bp-2]
  6138 00002891 08C0                     or  al, al
  6139 00002893 0F840900                 je .doidiv329
  6140 00002897 68[3329]                 push doidiv_3
  6141 0000289A E86CDD                   call error1
  6142 0000289D 83C402                   add  sp, 2
  6143                                  
  6144                                  ;-733     gettypes(id1);
  6145                                  
  6146                                  .doidiv329:
  6147 000028A0 FF76FC                   push word [bp-4]
  6148 000028A3 E8EDE9                   call gettypes
  6149 000028A6 83C402                   add  sp, 2
  6150                                  
  6151                                  ;-734     if (typei) error1("only int as simple var divisor allowed");
  6152                                  
  6153 000028A9 A1[2E00]                 mov ax, [typei]
  6154 000028AC 08C0                     or  al, al
  6155 000028AE 0F840900                 je .doidiv330
  6156 000028B2 68[5F29]                 push doidiv_4
  6157 000028B5 E851DD                   call error1
  6158 000028B8 83C402                   add  sp, 2
  6159                                  
  6160                                  ;-735     if (wi!=2) error1("only int, no byte as divisor allowed");
  6161                                  
  6162                                  .doidiv330:
  6163 000028BB A1[3700]                 mov ax, [wi]
  6164 000028BE 83F802                   cmp ax, 2
  6165 000028C1 0F840900                 je  .doidiv331
  6166 000028C5 68[8629]                 push doidiv_5
  6167 000028C8 E83EDD                   call error1
  6168 000028CB 83C402                   add  sp, 2
  6169                                  
  6170                                  ;-736     prs("\n mov bx, "); v(id1);
  6171                                  
  6172                                  .doidiv331:
  6173 000028CE 68[AB29]                 push doidiv_6
  6174 000028D1 E814DB                   call prs
  6175 000028D4 83C402                   add  sp, 2
  6176 000028D7 FF76FC                   push word [bp-4]
  6177 000028DA E806E7                   call v
  6178 000028DD 83C402                   add  sp, 2
  6179                                  
  6180                                  ;-737     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6181                                  
  6182 000028E0 8B4604                   mov ax, [bp+4]
  6183 000028E3 08C0                     or  al, al
  6184 000028E5 0F840C00                 je .doidiv332
  6185 000028E9 68[B729]                 push doidiv_7
  6186 000028EC E8F9DA                   call prs
  6187 000028EF 83C402                   add  sp, 2
  6188 000028F2 E90900                   jmp .doidiv333
  6189                                  .doidiv332:
  6190 000028F5 68[C829]                 push doidiv_8
  6191 000028F8 E8EDDA                   call prs
  6192 000028FB 83C402                   add  sp, 2
  6193                                  .doidiv333:
  6194                                  
  6195                                  ;-738 }
  6196                                  
  6197                                  .doidiv328:
  6198                                  
  6199                                  ;-739 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6200 000028FE C9                       LEAVE
  6201 000028FF C3                       ret
  6202 00002900 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6203 00002909 2C2000             
  6204 0000290C 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6205 00002915 6964697620627800   
  6206 0000291D 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6207 00002926 2C20305C6E20646976-
  6208 0000292F 20627800           
  6209 00002933 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6210 0000293C 74206E756D62657220-
  6211 00002945 6F7220696E74206173-
  6212 0000294E 2064697669736F7220-
  6213 00002957 616C6C6F77656400   
  6214 0000295F 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6215 00002968 61732073696D706C65-
  6216 00002971 207661722064697669-
  6217 0000297A 736F7220616C6C6F77-
  6218 00002983 656400             
  6219 00002986 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6220 0000298F 206E6F206279746520-
  6221 00002998 61732064697669736F-
  6222 000029A1 7220616C6C6F776564-
  6223 000029AA 00                 
  6224 000029AB 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6225 000029B4 2C2000             
  6226 000029B7 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6227 000029C0 6964697620627800   
  6228 000029C8 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6229 000029D1 2C20305C6E20646976-
  6230 000029DA 20627800           
  6231                                  ENDP
  6232                                  
  6233                                  domod: PROC;
  6234 000029DE C8000000                 ENTER  0,0
  6235 000029E2 FF7604                   push word [bp+4]
  6236 000029E5 E853FE                   call doidiv
  6237 000029E8 83C402                   add  sp, 2
  6238 000029EB 68[F629]                 push domod_0
  6239 000029EE E8F7D9                   call prs
  6240 000029F1 83C402                   add  sp, 2
  6241                                  
  6242                                  ;-740 
  6243                                  
  6244                                  
  6245                                  ;-741 
  6246                                  
  6247                                  
  6248                                  ;-742 int docalltype[10]; int docallvalue[10];
  6249 000029F4 C9                       LEAVE
  6250 000029F5 C3                       ret
  6251 000029F6 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6252 000029FF 2C20647800         
  6253                                  ENDP
  6254                                  section .bss
  6255                                  absolute 55925
  6256 0000DA75 <res 00000014>          docalltype resw 10
  6257                                  section .text
  6258                                  section .bss
  6259                                  absolute 55945
  6260 0000DA89 <res 00000014>          docallvalue resw 10
  6261                                  section .text
  6262                                  
  6263                                  ;-743 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6264                                  
  6265                                  section .bss
  6266                                  absolute 55965
  6267 0000DA9D <res 00000011>          procname resb 17
  6268                                  section .text
  6269                                  
  6270                                  ;-744 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6271                                  
  6272                                  
  6273                                  docall1: PROC
  6274                                  
  6275                                  ;-745   narg=0;  sz32=0;
  6276                                  ;
  6277 00002A04 C80A0000                 ENTER  10,0
  6278 00002A08 B80000                   mov ax, 0
  6279 00002A0B 8946FC                   mov [bp-4], ax
  6280 00002A0E B80000                   mov ax, 0
  6281 00002A11 8946F6                   mov [bp-10], ax
  6282                                  
  6283                                  ;-746   checknamelen();
  6284                                  
  6285 00002A14 E8FFE5                   call checknamelen
  6286                                  
  6287                                  ;-747   strcpy(&procname, symbol);
  6288                                  
  6289 00002A17 8D06BB69                 lea  ax, [symbol]
  6290 00002A1B 50                       push ax
  6291 00002A1C 8D069DDA                 lea  ax, [procname]
  6292 00002A20 50                       push ax
  6293 00002A21 E80ED8                   call strcpy
  6294 00002A24 83C404                   add  sp, 4
  6295                                  
  6296                                  ;-748   storeCall1();
  6297                                  
  6298 00002A27 E820E9                   call storeCall1
  6299                                  
  6300                                  ;-749   expect('(');
  6301                                  
  6302 00002A2A 6A28                     push 40
  6303 00002A2C E8B6E4                   call expect
  6304 00002A2F 83C402                   add  sp, 2
  6305                                  
  6306                                  ;-750 	if (istoken(')') ==0 ) {
  6307                                  
  6308 00002A32 6A29                     push 41
  6309 00002A34 E88CE4                   call istoken
  6310 00002A37 83C402                   add  sp, 2
  6311 00002A3A 83F800                   cmp ax, 0
  6312 00002A3D 0F857802                 jne .docall1334
  6313                                  
  6314                                  ;-751 	  do { narg++;
  6315                                  
  6316                                  .docall1335:
  6317 00002A41 FF46FC                   inc  word[bp-4]
  6318                                  
  6319                                  ;-752 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6320                                  
  6321 00002A44 8B46FC                   mov ax, [bp-4]
  6322 00002A47 83F809                   cmp ax, 9
  6323 00002A4A 0F8E0900                 jle .docall1336
  6324 00002A4E 68[FD2C]                 push docall1_0
  6325 00002A51 E8B5DB                   call error1
  6326 00002A54 83C402                   add  sp, 2
  6327                                  .docall1336:
  6328 00002A57 B80000                   mov ax, 0
  6329 00002A5A 8946FA                   mov [bp-6], ax
  6330                                  
  6331                                  ;-753       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6332                                  
  6333 00002A5D 680101                   push 257
  6334 00002A60 E860E4                   call istoken
  6335 00002A63 83C402                   add  sp, 2
  6336 00002A66 08C0                     or  al, al
  6337 00002A68 0F840C00                 je .docall1337
  6338 00002A6C B80100                   mov ax, 1
  6339 00002A6F 8946FA                   mov [bp-6], ax
  6340 00002A72 A1[2C00]                 mov ax, [lexval]
  6341 00002A75 8946F8                   mov [bp-8], ax
  6342                                  
  6343                                  ;-754       if(istoken(T_STRING)){t0=2; n0=nconst;
  6344                                  
  6345                                  .docall1337:
  6346 00002A78 680201                   push 258
  6347 00002A7B E845E4                   call istoken
  6348 00002A7E 83C402                   add  sp, 2
  6349 00002A81 08C0                     or  al, al
  6350 00002A83 0F846300                 je .docall1338
  6351 00002A87 B80200                   mov ax, 2
  6352 00002A8A 8946FA                   mov [bp-6], ax
  6353 00002A8D A1[2600]                 mov ax, [nconst]
  6354 00002A90 8946F8                   mov [bp-8], ax
  6355                                  
  6356                                  ;-755         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6357                                  
  6358 00002A93 68[0F2D]                 push docall1_1
  6359 00002A96 E8C8D8                   call eprs
  6360 00002A99 83C402                   add  sp, 2
  6361 00002A9C 8D063B6A                 lea  ax, [fname]
  6362 00002AA0 50                       push ax
  6363 00002AA1 E8BDD8                   call eprs
  6364 00002AA4 83C402                   add  sp, 2
  6365 00002AA7 6A5F                     push 95
  6366 00002AA9 E8A2D8                   call eprc
  6367 00002AAC 83C402                   add  sp, 2
  6368 00002AAF FF36[2600]               push word [nconst]
  6369 00002AB3 E8D4D9                   call eprnum
  6370 00002AB6 83C402                   add  sp, 2
  6371 00002AB9 68[122D]                 push docall1_2
  6372 00002ABC E8A2D8                   call eprs
  6373 00002ABF 83C402                   add  sp, 2
  6374                                  
  6375                                  ;-756         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6376                                  
  6377 00002AC2 6A22                     push 34
  6378 00002AC4 E887D8                   call eprc
  6379 00002AC7 83C402                   add  sp, 2
  6380 00002ACA 8D06BB69                 lea  ax, [symbol]
  6381 00002ACE 50                       push ax
  6382 00002ACF E88FD8                   call eprs
  6383 00002AD2 83C402                   add  sp, 2
  6384 00002AD5 6A22                     push 34
  6385 00002AD7 E874D8                   call eprc
  6386 00002ADA 83C402                   add  sp, 2
  6387 00002ADD 68[172D]                 push docall1_3
  6388 00002AE0 E87ED8                   call eprs
  6389 00002AE3 83C402                   add  sp, 2
  6390 00002AE6 FF06[2600]               inc  word[nconst]
  6391                                  
  6392                                  ;-757       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6393                                  
  6394                                  .docall1338:
  6395 00002AEA 6A26                     push 38
  6396 00002AEC E8D4E3                   call istoken
  6397 00002AEF 83C402                   add  sp, 2
  6398 00002AF2 08C0                     or  al, al
  6399 00002AF4 0F840F00                 je .docall1339
  6400 00002AF8 B80300                   mov ax, 3
  6401 00002AFB 8946FA                   mov [bp-6], ax
  6402 00002AFE E891E6                   call name1
  6403 00002B01 E843E6                   call searchname
  6404 00002B04 8946F8                   mov [bp-8], ax
  6405                                  
  6406                                  ;-758       if(istoken(T_NAME))  { n0=checkreg();
  6407                                  
  6408                                  .docall1339:
  6409 00002B07 680001                   push 256
  6410 00002B0A E8B6E3                   call istoken
  6411 00002B0D 83C402                   add  sp, 2
  6412 00002B10 08C0                     or  al, al
  6413 00002B12 0F844800                 je .docall1340
  6414 00002B16 E85BEC                   call checkreg
  6415 00002B19 8946F8                   mov [bp-8], ax
  6416                                  
  6417                                  ;-759         if (n0) t0=5;
  6418                                  
  6419 00002B1C 8B46F8                   mov ax, [bp-8]
  6420 00002B1F 08C0                     or  al, al
  6421 00002B21 0F840900                 je .docall1341
  6422 00002B25 B80500                   mov ax, 5
  6423 00002B28 8946FA                   mov [bp-6], ax
  6424                                  
  6425                                  ;-760         else {t0=4; n0=searchname();
  6426                                  
  6427 00002B2B E93000                   jmp .docall1342
  6428                                  .docall1341:
  6429 00002B2E B80400                   mov ax, 4
  6430 00002B31 8946FA                   mov [bp-6], ax
  6431 00002B34 E810E6                   call searchname
  6432 00002B37 8946F8                   mov [bp-8], ax
  6433                                  
  6434                                  ;-761           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6435                                  
  6436 00002B3A B8046B                   mov ax, GType
  6437 00002B3D A3[4D00]                 mov word [p1], ax
  6438 00002B40 A1[4D00]                 mov ax, [p1]
  6439 00002B43 0346F8                   add ax, [bp-8]
  6440 00002B46 A3[4D00]                 mov word [p1], ax
  6441 00002B49 8B1E[4D00]               mov bx, [p1]
  6442 00002B4D 8A07                     mov al, [bx]
  6443 00002B4F B400                     mov ah, 0
  6444 00002B51 83F826                   cmp ax, 38
  6445 00002B54 0F850600                 jne .docall1343
  6446 00002B58 B80300                   mov ax, 3
  6447 00002B5B 8946FA                   mov [bp-6], ax
  6448                                  .docall1343:
  6449                                  .docall1342:
  6450                                  
  6451                                  ;-762       if (t0==0) error1("parameter not recognized (no * allowed)");
  6452                                  
  6453                                  .docall1340:
  6454 00002B5E 8B46FA                   mov ax, [bp-6]
  6455 00002B61 83F800                   cmp ax, 0
  6456 00002B64 0F850900                 jne .docall1344
  6457 00002B68 68[1A2D]                 push docall1_4
  6458 00002B6B E89BDA                   call error1
  6459 00002B6E 83C402                   add  sp, 2
  6460                                  
  6461                                  ;-763       docalltype [narg] = t0;
  6462                                  
  6463                                  .docall1344:
  6464 00002B71 8B46FA                   mov ax, [bp-6]
  6465 00002B74 8B5EFC                   mov bx, [bp-4]
  6466 00002B77 D1E3                     shl bx, 1
  6467 00002B79 898775DA                 mov [docalltype+bx], ax
  6468                                  
  6469                                  ;-764       docallvalue[narg] = n0;
  6470                                  
  6471 00002B7D 8B46F8                   mov ax, [bp-8]
  6472 00002B80 8B5EFC                   mov bx, [bp-4]
  6473 00002B83 D1E3                     shl bx, 1
  6474 00002B85 898789DA                 mov [docallvalue+bx], ax
  6475                                  
  6476                                  ;-765     } while (istoken(','));
  6477                                  
  6478 00002B89 6A2C                     push 44
  6479 00002B8B E835E3                   call istoken
  6480 00002B8E 83C402                   add  sp, 2
  6481 00002B91 08C0                     or  al, al
  6482 00002B93 0F840300                 je .docall1345
  6483 00002B97 E9A7FE                   jmp .docall1335
  6484                                  .docall1345:
  6485                                  
  6486                                  ;-766 
  6487                                  
  6488                                  
  6489                                  ;-767   	expect(')');  i=narg;
  6490                                  
  6491 00002B9A 6A29                     push 41
  6492 00002B9C E846E3                   call expect
  6493 00002B9F 83C402                   add  sp, 2
  6494 00002BA2 8B46FC                   mov ax, [bp-4]
  6495 00002BA5 8946FE                   mov [bp-2], ax
  6496                                  
  6497                                  ;-768     do {
  6498                                  
  6499                                  .docall1346:
  6500                                  
  6501                                  ;-769       t0 = docalltype [i];
  6502                                  
  6503 00002BA8 8B5EFE                   mov bx, [bp-2]
  6504 00002BAB D1E3                     shl bx, 1
  6505 00002BAD 8B8775DA                 mov ax, [docalltype + bx]
  6506 00002BB1 8946FA                   mov [bp-6], ax
  6507                                  
  6508                                  ;-770       n0 = docallvalue[i];
  6509                                  
  6510 00002BB4 8B5EFE                   mov bx, [bp-2]
  6511 00002BB7 D1E3                     shl bx, 1
  6512 00002BB9 8B8789DA                 mov ax, [docallvalue + bx]
  6513 00002BBD 8946F8                   mov [bp-8], ax
  6514                                  
  6515                                  ;-771       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6516                                  
  6517 00002BC0 8B46FA                   mov ax, [bp-6]
  6518 00002BC3 83F801                   cmp ax, 1
  6519 00002BC6 0F851200                 jne .docall1347
  6520 00002BCA 68[422D]                 push docall1_5
  6521 00002BCD E818D8                   call prs
  6522 00002BD0 83C402                   add  sp, 2
  6523 00002BD3 FF76F8                   push word [bp-8]
  6524 00002BD6 E872D9                   call prunsign1
  6525 00002BD9 83C402                   add  sp, 2
  6526                                  
  6527                                  ;-772       if(t0==2){ prs("\n push ");
  6528                                  
  6529                                  .docall1347:
  6530 00002BDC 8B46FA                   mov ax, [bp-6]
  6531 00002BDF 83F802                   cmp ax, 2
  6532 00002BE2 0F852500                 jne .docall1348
  6533 00002BE6 68[4B2D]                 push docall1_6
  6534 00002BE9 E8FCD7                   call prs
  6535 00002BEC 83C402                   add  sp, 2
  6536                                  
  6537                                  ;-773         prs(fname);prc(95);prunsign1(n0);}
  6538                                  
  6539 00002BEF 8D063B6A                 lea  ax, [fname]
  6540 00002BF3 50                       push ax
  6541 00002BF4 E8F1D7                   call prs
  6542 00002BF7 83C402                   add  sp, 2
  6543 00002BFA 6A5F                     push 95
  6544 00002BFC E890D7                   call prc
  6545 00002BFF 83C402                   add  sp, 2
  6546 00002C02 FF76F8                   push word [bp-8]
  6547 00002C05 E843D9                   call prunsign1
  6548 00002C08 83C402                   add  sp, 2
  6549                                  
  6550                                  ;-774       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6551                                  
  6552                                  .docall1348:
  6553 00002C0B 8B46FA                   mov ax, [bp-6]
  6554 00002C0E 83F803                   cmp ax, 3
  6555 00002C11 0F851B00                 jne .docall1349
  6556 00002C15 68[542D]                 push docall1_7
  6557 00002C18 E8CDD7                   call prs
  6558 00002C1B 83C402                   add  sp, 2
  6559 00002C1E FF76F8                   push word [bp-8]
  6560 00002C21 E8BFE3                   call v
  6561 00002C24 83C402                   add  sp, 2
  6562                                  
  6563                                  ;-775         prs("\n push ax");}
  6564                                  
  6565 00002C27 68[612D]                 push docall1_8
  6566 00002C2A E8BBD7                   call prs
  6567 00002C2D 83C402                   add  sp, 2
  6568                                  
  6569                                  ;-776       if(t0==4){ gettypes(n0);
  6570                                  
  6571                                  .docall1349:
  6572 00002C30 8B46FA                   mov ax, [bp-6]
  6573 00002C33 83F804                   cmp ax, 4
  6574 00002C36 0F854300                 jne .docall1350
  6575 00002C3A FF76F8                   push word [bp-8]
  6576 00002C3D E853E6                   call gettypes
  6577 00002C40 83C402                   add  sp, 2
  6578                                  
  6579                                  ;-777         if(wi==2) { prs("\n push word "); v(n0);}
  6580                                  
  6581 00002C43 A1[3700]                 mov ax, [wi]
  6582 00002C46 83F802                   cmp ax, 2
  6583 00002C49 0F851500                 jne .docall1351
  6584 00002C4D 68[6C2D]                 push docall1_9
  6585 00002C50 E895D7                   call prs
  6586 00002C53 83C402                   add  sp, 2
  6587 00002C56 FF76F8                   push word [bp-8]
  6588 00002C59 E887E3                   call v
  6589 00002C5C 83C402                   add  sp, 2
  6590                                  
  6591                                  ;-778         else { prs("\n mov al, byte ");   v(n0);
  6592                                  
  6593 00002C5F E91B00                   jmp .docall1352
  6594                                  .docall1351:
  6595 00002C62 68[7A2D]                 push docall1_10
  6596 00002C65 E880D7                   call prs
  6597 00002C68 83C402                   add  sp, 2
  6598 00002C6B FF76F8                   push word [bp-8]
  6599 00002C6E E872E3                   call v
  6600 00002C71 83C402                   add  sp, 2
  6601                                  
  6602                                  ;-779         prs("\n mov ah, 0\n push ax"); } }
  6603                                  
  6604 00002C74 68[8B2D]                 push docall1_11
  6605 00002C77 E86ED7                   call prs
  6606 00002C7A 83C402                   add  sp, 2
  6607                                  .docall1352:
  6608                                  
  6609                                  ;-780       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6610                                  
  6611                                  .docall1350:
  6612 00002C7D 8B46FA                   mov ax, [bp-6]
  6613 00002C80 83F805                   cmp ax, 5
  6614 00002C83 0F852200                 jne .docall1353
  6615 00002C87 68[A22D]                 push docall1_12
  6616 00002C8A E85BD7                   call prs
  6617 00002C8D 83C402                   add  sp, 2
  6618 00002C90 FF76F8                   push word [bp-8]
  6619 00002C93 E8ECEE                   call printreg
  6620 00002C96 83C402                   add  sp, 2
  6621 00002C99 8B46F8                   mov ax, [bp-8]
  6622 00002C9C 83F82F                   cmp ax, 47 ;unsigned : 1
  6623 00002C9F 0F8C0600                 jl  .docall1354
  6624 00002CA3 8B46F6                   mov ax, [bp-10]
  6625 00002CA6 83C002                   add ax, 2
  6626                                  .docall1354:
  6627                                  
  6628                                  ;-781    i--; } while (i > 0);  }
  6629                                  
  6630                                  .docall1353:
  6631 00002CA9 FF4EFE                   dec  word[bp-2]
  6632 00002CAC 8B46FE                   mov ax, [bp-2]
  6633 00002CAF 83F800                   cmp ax, 0
  6634 00002CB2 0F8E0300                 jle .docall1355
  6635 00002CB6 E9EFFE                   jmp .docall1346
  6636                                  .docall1355:
  6637                                  
  6638                                  ;-782 	 prs("\n call "); prs(&procname);
  6639                                  
  6640                                  .docall1334:
  6641 00002CB9 68[AB2D]                 push docall1_13
  6642 00002CBC E829D7                   call prs
  6643 00002CBF 83C402                   add  sp, 2
  6644 00002CC2 8D069DDA                 lea  ax, [procname]
  6645 00002CC6 50                       push ax
  6646 00002CC7 E81ED7                   call prs
  6647 00002CCA 83C402                   add  sp, 2
  6648                                  
  6649                                  ;-783 	 if (narg>0) {prs("\n add  sp, ");
  6650                                  
  6651 00002CCD 8B46FC                   mov ax, [bp-4]
  6652 00002CD0 83F800                   cmp ax, 0
  6653 00002CD3 0F8E2400                 jle .docall1356
  6654 00002CD7 68[B42D]                 push docall1_14
  6655 00002CDA E80BD7                   call prs
  6656 00002CDD 83C402                   add  sp, 2
  6657                                  
  6658                                  ;-784      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6659                                  
  6660 00002CE0 8B46FC                   mov ax, [bp-4]
  6661 00002CE3 0346FC                   add ax, [bp-4]
  6662 00002CE6 8946FC                   mov [bp-4], ax
  6663 00002CE9 8B46FC                   mov ax, [bp-4]
  6664 00002CEC 0346F6                   add ax, [bp-10]
  6665 00002CEF 8946FC                   mov [bp-4], ax
  6666 00002CF2 FF76FC                   push word [bp-4]
  6667 00002CF5 E853D8                   call prunsign1
  6668 00002CF8 83C402                   add  sp, 2
  6669                                  
  6670                                  ;-785  }
  6671                                  
  6672                                  .docall1356:
  6673                                  
  6674                                  ;-786 
  6675                                  
  6676                                  
  6677                                  ;-787  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  6678 00002CFB C9                       LEAVE
  6679 00002CFC C3                       ret
  6680 00002CFD 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6681 00002D06 72616D657465727300 
  6682 00002D0F 5C6E00                  docall1_1 db "\n",0
  6683 00002D12 2064622000              docall1_2 db " db ",0
  6684 00002D17 2C3000                  docall1_3 db ",0",0
  6685 00002D1A 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6686 00002D23 206E6F74207265636F-
  6687 00002D2C 676E697A656420286E-
  6688 00002D35 6F202A20616C6C6F77-
  6689 00002D3E 65642900           
  6690 00002D42 5C6E20707573682000      docall1_5 db "\n push ",0
  6691 00002D4B 5C6E20707573682000      docall1_6 db "\n push ",0
  6692 00002D54 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6693 00002D5D 782C2000           
  6694 00002D61 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6695 00002D6A 7800               
  6696 00002D6C 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6697 00002D75 6F72642000         
  6698 00002D7A 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6699 00002D83 2C20627974652000   
  6700 00002D8B 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6701 00002D94 2C20305C6E20707573-
  6702 00002D9D 6820617800         
  6703 00002DA2 5C6E20707573682000      docall1_12 db "\n push ",0
  6704 00002DAB 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6705 00002DB4 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6706 00002DBD 702C2000           
  6707                                  ENDP
  6708 00002DC1 0000                    evalue dw 0
  6709 00002DC3 0A00                    exprtype dw 10
  6710                                  
  6711                                  ;-788  int expr(int isRight)
  6712                                  
  6713                                  
  6714                                  expr: PROC
  6715                                  
  6716                                  ;-789  { int mode; int id1;     int ixarr; int ixconst;
  6717                                  
  6718                                  
  6719                                  ;-790    int ids;  int isCONST; int i;     unsigned char *p;
  6720                                  
  6721                                  
  6722                                  ;-791    if (istoken(T_CONST)) { evalue=lexval;
  6723                                  ;
  6724 00002DC5 C8100000                 ENTER  16,0
  6725 00002DC9 680101                   push 257
  6726 00002DCC E8F4E0                   call istoken
  6727 00002DCF 83C402                   add  sp, 2
  6728 00002DD2 08C0                     or  al, al
  6729 00002DD4 0F841F00                 je .expr357
  6730 00002DD8 A1[2C00]                 mov ax, [lexval]
  6731 00002DDB A3[C12D]                 mov word [evalue], ax
  6732                                  
  6733                                  ;-792      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6734                                  
  6735 00002DDE 68[6531]                 push expr_0
  6736 00002DE1 E804D6                   call prs
  6737 00002DE4 83C402                   add  sp, 2
  6738 00002DE7 FF36[2C00]               push word [lexval]
  6739 00002DEB E85DD7                   call prunsign1
  6740 00002DEE 83C402                   add  sp, 2
  6741 00002DF1 B80400                   mov ax, 4
  6742 00002DF4 E96C03                   jmp .retnexpr
  6743                                  
  6744                                  ;-793    mode=typeName(); /*0=V,1=*,2=&*/
  6745                                  
  6746                                  .expr357:
  6747 00002DF7 E8C0E3                   call typeName
  6748 00002DFA 8946FE                   mov [bp-2], ax
  6749                                  
  6750                                  ;-794    ireg1=checkreg();
  6751                                  
  6752 00002DFD E874E9                   call checkreg
  6753 00002E00 A3[5400]                 mov word [ireg1], ax
  6754                                  
  6755                                  ;-795    if (ireg1) { doreg1(0); return; }
  6756                                  
  6757 00002E03 A1[5400]                 mov ax, [ireg1]
  6758 00002E06 08C0                     or  al, al
  6759 00002E08 0F840B00                 je .expr358
  6760 00002E0C 6A00                     push 0
  6761 00002E0E E8DDEE                   call doreg1
  6762 00002E11 83C402                   add  sp, 2
  6763 00002E14 E94C03                   jmp .retnexpr
  6764                                  
  6765                                  ;-796    if (token=='(')  {docall1(); goto e1; }
  6766                                  
  6767                                  .expr358:
  6768 00002E17 A1[1E00]                 mov ax, [token]
  6769 00002E1A 83F828                   cmp ax, 40
  6770 00002E1D 0F850600                 jne .expr359
  6771 00002E21 E8E0FB                   call docall1
  6772 00002E24 E93202                   jmp .e1
  6773                                  
  6774                                  ;-797    if (isreg()) goto e1;
  6775                                  
  6776                                  .expr359:
  6777 00002E27 E8CBF4                   call isreg
  6778 00002E2A 08C0                     or  al, al
  6779 00002E2C 0F840300                 je .expr360
  6780 00002E30 E92602                   jmp .e1
  6781                                  
  6782                                  ;-798 
  6783                                  
  6784                                  
  6785                                  ;-799    id1=searchname(); gettypes(id1); ids=signi;
  6786                                  
  6787                                  .expr360:
  6788 00002E33 E811E3                   call searchname
  6789 00002E36 8946FC                   mov [bp-4], ax
  6790 00002E39 FF76FC                   push word [bp-4]
  6791 00002E3C E854E4                   call gettypes
  6792 00002E3F 83C402                   add  sp, 2
  6793 00002E42 A1[3100]                 mov ax, [signi]
  6794 00002E45 8946F6                   mov [bp-10], ax
  6795                                  
  6796                                  ;-800    ixarr=0;  ixconst=0;
  6797                                  
  6798 00002E48 B80000                   mov ax, 0
  6799 00002E4B 8946FA                   mov [bp-6], ax
  6800 00002E4E B80000                   mov ax, 0
  6801 00002E51 8946F8                   mov [bp-8], ax
  6802                                  
  6803                                  ;-801      if (istoken('[')) { if (istoken(T_CONST)) {
  6804                                  
  6805 00002E54 6A5B                     push 91
  6806 00002E56 E86AE0                   call istoken
  6807 00002E59 83C402                   add  sp, 2
  6808 00002E5C 08C0                     or  al, al
  6809 00002E5E 0F845900                 je .expr361
  6810 00002E62 680101                   push 257
  6811 00002E65 E85BE0                   call istoken
  6812 00002E68 83C402                   add  sp, 2
  6813 00002E6B 08C0                     or  al, al
  6814 00002E6D 0F841700                 je .expr362
  6815                                  
  6816                                  ;-802        ixconst=1; ixarr=lexval; expect(']');  }
  6817                                  
  6818 00002E71 B80100                   mov ax, 1
  6819 00002E74 8946F8                   mov [bp-8], ax
  6820 00002E77 A1[2C00]                 mov ax, [lexval]
  6821 00002E7A 8946FA                   mov [bp-6], ax
  6822 00002E7D 6A5D                     push 93
  6823 00002E7F E863E0                   call expect
  6824 00002E82 83C402                   add  sp, 2
  6825                                  
  6826                                  ;-803      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6827                                  
  6828 00002E85 E93300                   jmp .expr363
  6829                                  .expr362:
  6830 00002E88 E8BCE2                   call searchname
  6831 00002E8B 8946FA                   mov [bp-6], ax
  6832 00002E8E 680001                   push 256
  6833 00002E91 E851E0                   call expect
  6834 00002E94 83C402                   add  sp, 2
  6835 00002E97 6A5D                     push 93
  6836 00002E99 E849E0                   call expect
  6837 00002E9C 83C402                   add  sp, 2
  6838                                  
  6839                                  ;-804      gettypes(ixarr);
  6840                                  
  6841 00002E9F FF76FA                   push word [bp-6]
  6842 00002EA2 E8EEE3                   call gettypes
  6843 00002EA5 83C402                   add  sp, 2
  6844                                  
  6845                                  ;-805      if (widthi != 2) error1("Array index must be number or int"); } }
  6846                                  
  6847 00002EA8 A1[3400]                 mov ax, [widthi]
  6848 00002EAB 83F802                   cmp ax, 2
  6849 00002EAE 0F840900                 je  .expr364
  6850 00002EB2 68[7131]                 push expr_1
  6851 00002EB5 E851D7                   call error1
  6852 00002EB8 83C402                   add  sp, 2
  6853                                  .expr364:
  6854                                  .expr363:
  6855                                  
  6856                                  ;-806    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6857                                  
  6858                                  .expr361:
  6859 00002EBB 68C304                   push 1219
  6860 00002EBE E802E0                   call istoken
  6861 00002EC1 83C402                   add  sp, 2
  6862 00002EC4 08C0                     or  al, al
  6863 00002EC6 0F844600                 je .expr365
  6864 00002ECA 8B46FE                   mov ax, [bp-2]
  6865 00002ECD 08C0                     or  al, al
  6866 00002ECF 0F840900                 je .expr366
  6867 00002ED3 68[9331]                 push expr_2
  6868 00002ED6 E830D7                   call error1
  6869 00002ED9 83C402                   add  sp, 2
  6870                                  
  6871                                  ;-807       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6872                                  
  6873                                  .expr366:
  6874 00002EDC 68[A431]                 push expr_3
  6875 00002EDF E806D5                   call prs
  6876 00002EE2 83C402                   add  sp, 2
  6877 00002EE5 A1[3700]                 mov ax, [wi]
  6878 00002EE8 83F802                   cmp ax, 2
  6879 00002EEB 0F850C00                 jne .expr367
  6880 00002EEF 68[AD31]                 push expr_4
  6881 00002EF2 E8F3D4                   call prs
  6882 00002EF5 83C402                   add  sp, 2
  6883 00002EF8 E90900                   jmp .expr368
  6884                                  .expr367:
  6885 00002EFB 68[B231]                 push expr_5
  6886 00002EFE E8E7D4                   call prs
  6887 00002F01 83C402                   add  sp, 2
  6888                                  
  6889                                  ;-808       v(id1); goto e1;}
  6890                                  
  6891                                  .expr368:
  6892 00002F04 FF76FC                   push word [bp-4]
  6893 00002F07 E8D9E0                   call v
  6894 00002F0A 83C402                   add  sp, 2
  6895 00002F0D E94901                   jmp .e1
  6896                                  
  6897                                  ;-809    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6898                                  
  6899                                  .expr365:
  6900 00002F10 68C904                   push 1225
  6901 00002F13 E8ADDF                   call istoken
  6902 00002F16 83C402                   add  sp, 2
  6903 00002F19 08C0                     or  al, al
  6904 00002F1B 0F844600                 je .expr369
  6905 00002F1F 8B46FE                   mov ax, [bp-2]
  6906 00002F22 08C0                     or  al, al
  6907 00002F24 0F840900                 je .expr370
  6908 00002F28 68[B731]                 push expr_6
  6909 00002F2B E8DBD6                   call error1
  6910 00002F2E 83C402                   add  sp, 2
  6911                                  
  6912                                  ;-810       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6913                                  
  6914                                  .expr370:
  6915 00002F31 68[C831]                 push expr_7
  6916 00002F34 E8B1D4                   call prs
  6917 00002F37 83C402                   add  sp, 2
  6918 00002F3A A1[3700]                 mov ax, [wi]
  6919 00002F3D 83F802                   cmp ax, 2
  6920 00002F40 0F850C00                 jne .expr371
  6921 00002F44 68[D131]                 push expr_8
  6922 00002F47 E89ED4                   call prs
  6923 00002F4A 83C402                   add  sp, 2
  6924 00002F4D E90900                   jmp .expr372
  6925                                  .expr371:
  6926 00002F50 68[D631]                 push expr_9
  6927 00002F53 E892D4                   call prs
  6928 00002F56 83C402                   add  sp, 2
  6929                                  
  6930                                  ;-811       v(id1); goto e1;}
  6931                                  
  6932                                  .expr372:
  6933 00002F59 FF76FC                   push word [bp-4]
  6934 00002F5C E884E0                   call v
  6935 00002F5F 83C402                   add  sp, 2
  6936 00002F62 E9F400                   jmp .e1
  6937                                  
  6938                                  ;-812 
  6939                                  
  6940                                  
  6941                                  ;-813    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6942                                  
  6943                                  .expr369:
  6944 00002F65 68CE04                   push 1230
  6945 00002F68 E858DF                   call istoken
  6946 00002F6B 83C402                   add  sp, 2
  6947 00002F6E 08C0                     or  al, al
  6948 00002F70 0F841200                 je .expr373
  6949 00002F74 FF76FC                   push word [bp-4]
  6950 00002F77 FF76FE                   push word [bp-2]
  6951 00002F7A 68[DB31]                 push expr_10
  6952 00002F7D E85AEF                   call compoundass
  6953 00002F80 83C406                   add  sp, 6
  6954 00002F83 E9D300                   jmp .e1
  6955                                  
  6956                                  ;-814    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6957                                  
  6958                                  .expr373:
  6959 00002F86 68CF04                   push 1231
  6960 00002F89 E837DF                   call istoken
  6961 00002F8C 83C402                   add  sp, 2
  6962 00002F8F 08C0                     or  al, al
  6963 00002F91 0F841200                 je .expr374
  6964 00002F95 FF76FC                   push word [bp-4]
  6965 00002F98 FF76FE                   push word [bp-2]
  6966 00002F9B 68[DF31]                 push expr_11
  6967 00002F9E E839EF                   call compoundass
  6968 00002FA1 83C406                   add  sp, 6
  6969 00002FA4 E9B200                   jmp .e1
  6970                                  
  6971                                  ;-815    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6972                                  
  6973                                  .expr374:
  6974 00002FA7 68D204                   push 1234
  6975 00002FAA E816DF                   call istoken
  6976 00002FAD 83C402                   add  sp, 2
  6977 00002FB0 08C0                     or  al, al
  6978 00002FB2 0F841200                 je .expr375
  6979 00002FB6 FF76FC                   push word [bp-4]
  6980 00002FB9 FF76FE                   push word [bp-2]
  6981 00002FBC 68[E331]                 push expr_12
  6982 00002FBF E818EF                   call compoundass
  6983 00002FC2 83C406                   add  sp, 6
  6984 00002FC5 E99100                   jmp .e1
  6985                                  
  6986                                  ;-816    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6987                                  
  6988                                  .expr375:
  6989 00002FC8 68D304                   push 1235
  6990 00002FCB E8F5DE                   call istoken
  6991 00002FCE 83C402                   add  sp, 2
  6992 00002FD1 08C0                     or  al, al
  6993 00002FD3 0F841200                 je .expr376
  6994 00002FD7 FF76FC                   push word [bp-4]
  6995 00002FDA FF76FE                   push word [bp-2]
  6996 00002FDD 68[E731]                 push expr_13
  6997 00002FE0 E8F7EE                   call compoundass
  6998 00002FE3 83C406                   add  sp, 6
  6999 00002FE6 E97000                   jmp .e1
  7000                                  
  7001                                  ;-817    if (istoken(T_MULASS    )) {error1("not implemented");}
  7002                                  
  7003                                  .expr376:
  7004 00002FE9 68D004                   push 1232
  7005 00002FEC E8D4DE                   call istoken
  7006 00002FEF 83C402                   add  sp, 2
  7007 00002FF2 08C0                     or  al, al
  7008 00002FF4 0F840900                 je .expr377
  7009 00002FF8 68[EA31]                 push expr_14
  7010 00002FFB E80BD6                   call error1
  7011 00002FFE 83C402                   add  sp, 2
  7012                                  
  7013                                  ;-818    if (istoken(T_DIVASS    )) {error1("not implemented");}
  7014                                  
  7015                                  .expr377:
  7016 00003001 68D104                   push 1233
  7017 00003004 E8BCDE                   call istoken
  7018 00003007 83C402                   add  sp, 2
  7019 0000300A 08C0                     or  al, al
  7020 0000300C 0F840900                 je .expr378
  7021 00003010 68[FA31]                 push expr_15
  7022 00003013 E8F3D5                   call error1
  7023 00003016 83C402                   add  sp, 2
  7024                                  
  7025                                  ;-819 
  7026                                  
  7027                                  
  7028                                  ;-820    if (istoken('=')) { exprtype= expr(1);
  7029                                  
  7030                                  .expr378:
  7031 00003019 6A3D                     push 61
  7032 0000301B E8A5DE                   call istoken
  7033 0000301E 83C402                   add  sp, 2
  7034 00003021 08C0                     or  al, al
  7035 00003023 0F842000                 je .expr379
  7036 00003027 6A01                     push 1
  7037 00003029 E899FD                   call expr
  7038 0000302C 83C402                   add  sp, 2
  7039 0000302F A3[C32D]                 mov word [exprtype], ax
  7040                                  
  7041                                  ;-821    doassign(mode, id1, ixarr, ixconst); goto e1;  }
  7042                                  
  7043 00003032 FF76F8                   push word [bp-8]
  7044 00003035 FF76FA                   push word [bp-6]
  7045 00003038 FF76FC                   push word [bp-4]
  7046 0000303B FF76FE                   push word [bp-2]
  7047 0000303E E810F5                   call doassign
  7048 00003041 83C408                   add  sp, 8
  7049 00003044 E91200                   jmp .e1
  7050                                  
  7051                                  ;-822    dovar1(mode, "mov", ixarr, id1);
  7052                                  
  7053                                  .expr379:
  7054 00003047 FF76FC                   push word [bp-4]
  7055 0000304A FF76FA                   push word [bp-6]
  7056 0000304D 68[0A32]                 push expr_16
  7057 00003050 FF76FE                   push word [bp-2]
  7058 00003053 E826EF                   call dovar1
  7059 00003056 83C408                   add  sp, 8
  7060                                  
  7061                                  ;-823 
  7062                                  
  7063                                  
  7064                                  ;-824  e1:    if (istoken('+')) rterm("add");
  7065                                  
  7066                                  .e1:
  7067 00003059 6A2B                     push 43
  7068 0000305B E865DE                   call istoken
  7069 0000305E 83C402                   add  sp, 2
  7070 00003061 08C0                     or  al, al
  7071 00003063 0F840C00                 je .expr380
  7072 00003067 68[0E32]                 push expr_17
  7073 0000306A E8D9F0                   call rterm
  7074 0000306D 83C402                   add  sp, 2
  7075                                  
  7076                                  ;-825    else if (istoken('-')) rterm("sub" );
  7077                                  
  7078 00003070 E9CF00                   jmp .expr381
  7079                                  .expr380:
  7080 00003073 6A2D                     push 45
  7081 00003075 E84BDE                   call istoken
  7082 00003078 83C402                   add  sp, 2
  7083 0000307B 08C0                     or  al, al
  7084 0000307D 0F840C00                 je .expr382
  7085 00003081 68[1232]                 push expr_18
  7086 00003084 E8BFF0                   call rterm
  7087 00003087 83C402                   add  sp, 2
  7088                                  
  7089                                  ;-826    else if (istoken('&')) rterm("and" );
  7090                                  
  7091 0000308A E9B500                   jmp .expr383
  7092                                  .expr382:
  7093 0000308D 6A26                     push 38
  7094 0000308F E831DE                   call istoken
  7095 00003092 83C402                   add  sp, 2
  7096 00003095 08C0                     or  al, al
  7097 00003097 0F840C00                 je .expr384
  7098 0000309B 68[1632]                 push expr_19
  7099 0000309E E8A5F0                   call rterm
  7100 000030A1 83C402                   add  sp, 2
  7101                                  
  7102                                  ;-827    else if (istoken('|')) rterm("or" );
  7103                                  
  7104 000030A4 E99B00                   jmp .expr385
  7105                                  .expr384:
  7106 000030A7 6A7C                     push 124
  7107 000030A9 E817DE                   call istoken
  7108 000030AC 83C402                   add  sp, 2
  7109 000030AF 08C0                     or  al, al
  7110 000030B1 0F840C00                 je .expr386
  7111 000030B5 68[1A32]                 push expr_20
  7112 000030B8 E88BF0                   call rterm
  7113 000030BB 83C402                   add  sp, 2
  7114                                  
  7115                                  ;-828    else if (istoken(T_LESSLESS)) rterm("shl");
  7116                                  
  7117 000030BE E98100                   jmp .expr387
  7118                                  .expr386:
  7119 000030C1 68D804                   push 1240
  7120 000030C4 E8FCDD                   call istoken
  7121 000030C7 83C402                   add  sp, 2
  7122 000030CA 08C0                     or  al, al
  7123 000030CC 0F840C00                 je .expr388
  7124 000030D0 68[1D32]                 push expr_21
  7125 000030D3 E870F0                   call rterm
  7126 000030D6 83C402                   add  sp, 2
  7127                                  
  7128                                  ;-829    else if (istoken(T_GREATGREAT)) rterm("shr");
  7129                                  
  7130 000030D9 E96600                   jmp .expr389
  7131                                  .expr388:
  7132 000030DC 68D904                   push 1241
  7133 000030DF E8E1DD                   call istoken
  7134 000030E2 83C402                   add  sp, 2
  7135 000030E5 08C0                     or  al, al
  7136 000030E7 0F840C00                 je .expr390
  7137 000030EB 68[2132]                 push expr_22
  7138 000030EE E855F0                   call rterm
  7139 000030F1 83C402                   add  sp, 2
  7140                                  
  7141                                  ;-830    else if (istoken('*')) domul (ids);
  7142                                  
  7143 000030F4 E94B00                   jmp .expr391
  7144                                  .expr390:
  7145 000030F7 6A2A                     push 42
  7146 000030F9 E8C7DD                   call istoken
  7147 000030FC 83C402                   add  sp, 2
  7148 000030FF 08C0                     or  al, al
  7149 00003101 0F840C00                 je .expr392
  7150 00003105 FF76F6                   push word [bp-10]
  7151 00003108 E88FF6                   call domul
  7152 0000310B 83C402                   add  sp, 2
  7153                                  
  7154                                  ;-831    else if (istoken('/')) doidiv(ids);
  7155                                  
  7156 0000310E E93100                   jmp .expr393
  7157                                  .expr392:
  7158 00003111 6A2F                     push 47
  7159 00003113 E8ADDD                   call istoken
  7160 00003116 83C402                   add  sp, 2
  7161 00003119 08C0                     or  al, al
  7162 0000311B 0F840C00                 je .expr394
  7163 0000311F FF76F6                   push word [bp-10]
  7164 00003122 E816F7                   call doidiv
  7165 00003125 83C402                   add  sp, 2
  7166                                  
  7167                                  ;-832    else if (istoken('%')) domod (ids);
  7168                                  
  7169 00003128 E91700                   jmp .expr395
  7170                                  .expr394:
  7171 0000312B 6A25                     push 37
  7172 0000312D E893DD                   call istoken
  7173 00003130 83C402                   add  sp, 2
  7174 00003133 08C0                     or  al, al
  7175 00003135 0F840900                 je .expr396
  7176 00003139 FF76F6                   push word [bp-10]
  7177 0000313C E89FF8                   call domod
  7178 0000313F 83C402                   add  sp, 2
  7179                                  
  7180                                  ;-833    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  7181                                  
  7182                                  .expr396:
  7183                                  .expr395:
  7184                                  .expr393:
  7185                                  .expr391:
  7186                                  .expr389:
  7187                                  .expr387:
  7188                                  .expr385:
  7189                                  .expr383:
  7190                                  .expr381:
  7191 00003142 E8C8E5                   call isrelational
  7192 00003145 08C0                     or  al, al
  7193 00003147 0F841200                 je .expr397
  7194 0000314B 68[2532]                 push expr_23
  7195 0000314E E8F5EF                   call rterm
  7196 00003151 83C402                   add  sp, 2
  7197 00003154 FF76F6                   push word [bp-10]
  7198 00003157 E843E4                   call cmpneg
  7199 0000315A 83C402                   add  sp, 2
  7200                                  
  7201                                  ;-834    return 0;
  7202                                  
  7203                                  .expr397:
  7204 0000315D B80000                   mov ax, 0
  7205 00003160 E90000                   jmp .retnexpr
  7206                                  
  7207                                  ;-835  }
  7208                                  
  7209                                  
  7210                                  ;-836 
  7211                                  
  7212                                  
  7213                                  ;-837  int pexpr() {expect('('); iscmp=0;
  7214                                  
  7215 00003163 C9                       .retnexpr: LEAVE
  7216 00003164 C3                       ret
  7217 00003165 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7218 0000316E 2C2000             
  7219 00003171 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7220 0000317A 6578206D7573742062-
  7221 00003183 65206E756D62657220-
  7222 0000318C 6F7220696E7400     
  7223 00003193 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7224 0000319C 616C6C6F77656400   
  7225 000031A4 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7226 000031AD 776F726400              expr_4 db "word",0
  7227 000031B2 6279746500              expr_5 db "byte",0
  7228 000031B7 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7229 000031C0 616C6C6F77656400   
  7230 000031C8 5C6E20646563202000      expr_7 db "\n dec  ",0
  7231 000031D1 776F726400              expr_8 db "word",0
  7232 000031D6 6279746500              expr_9 db "byte",0
  7233 000031DB 61646400                expr_10 db "add",0
  7234 000031DF 73756200                expr_11 db "sub",0
  7235 000031E3 616E6400                expr_12 db "and",0
  7236 000031E7 6F7200                  expr_13 db "or",0
  7237 000031EA 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7238 000031F3 6D656E74656400     
  7239 000031FA 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7240 00003203 6D656E74656400     
  7241 0000320A 6D6F7600                expr_16 db "mov",0
  7242 0000320E 61646400                expr_17 db "add",0
  7243 00003212 73756200                expr_18 db "sub",0
  7244 00003216 616E6400                expr_19 db "and",0
  7245 0000321A 6F7200                  expr_20 db "or",0
  7246 0000321D 73686C00                expr_21 db "shl",0
  7247 00003221 73687200                expr_22 db "shr",0
  7248 00003225 636D7000                expr_23 db "cmp",0
  7249                                  ENDP
  7250                                  
  7251                                  pexpr: PROC
  7252 00003229 6A28                     push 40
  7253 0000322B E8B7DC                   call expect
  7254 0000322E 83C402                   add  sp, 2
  7255 00003231 B80000                   mov ax, 0
  7256 00003234 A3[2400]                 mov word [iscmp], ax
  7257                                  
  7258                                  ;-838    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7259                                  
  7260 00003237 A1[1E00]                 mov ax, [token]
  7261 0000323A 3D0001                   cmp ax, 256
  7262 0000323D 0F853400                 jne .pexpr398
  7263 00003241 68[A432]                 push pexpr_0
  7264 00003244 8D06BB69                 lea  ax, [symbol]
  7265 00003248 50                       push ax
  7266 00003249 E81CD0                   call eqstr
  7267 0000324C 83C404                   add  sp, 4
  7268 0000324F 08C0                     or  al, al
  7269 00003251 0F840600                 je .pexpr399
  7270 00003255 E897E9                   call constantexpr
  7271 00003258 E94800                   jmp .retnpexpr
  7272                                  
  7273                                  ;-839      ireg1=checkreg();
  7274                                  
  7275                                  .pexpr399:
  7276 0000325B E816E5                   call checkreg
  7277 0000325E A3[5400]                 mov word [ireg1], ax
  7278                                  
  7279                                  ;-840      if (ireg1) { doreg1(1); return; }  }
  7280                                  
  7281 00003261 A1[5400]                 mov ax, [ireg1]
  7282 00003264 08C0                     or  al, al
  7283 00003266 0F840B00                 je .pexpr400
  7284 0000326A 6A01                     push 1
  7285 0000326C E87FEA                   call doreg1
  7286 0000326F 83C402                   add  sp, 2
  7287 00003272 E92E00                   jmp .retnpexpr
  7288                                  .pexpr400:
  7289                                  
  7290                                  ;-841    expr(0);
  7291                                  
  7292                                  .pexpr398:
  7293 00003275 6A00                     push 0
  7294 00003277 E84BFB                   call expr
  7295 0000327A 83C402                   add  sp, 2
  7296                                  
  7297                                  ;-842    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7298                                  
  7299 0000327D A1[2400]                 mov ax, [iscmp]
  7300 00003280 83F800                   cmp ax, 0
  7301 00003283 0F850900                 jne .pexpr401
  7302 00003287 68[A632]                 push pexpr_1
  7303 0000328A E85BD1                   call prs
  7304 0000328D 83C402                   add  sp, 2
  7305                                  .pexpr401:
  7306 00003290 8D063B6A                 lea  ax, [fname]
  7307 00003294 50                       push ax
  7308 00003295 E850D1                   call prs
  7309 00003298 83C402                   add  sp, 2
  7310                                  
  7311                                  ;-843    expect(')');
  7312                                  
  7313 0000329B 6A29                     push 41
  7314 0000329D E845DC                   call expect
  7315 000032A0 83C402                   add  sp, 2
  7316                                  
  7317                                  ;-844  }
  7318                                  
  7319                                  
  7320                                  ;-845 
  7321                                  
  7322                                  
  7323                                  ;-846 /***************************************************************/
  7324                                  
  7325                                  
  7326                                  ;-847 
  7327                                  
  7328                                  
  7329                                  ;-848 int doemit() {prs("\n db ");
  7330                                  
  7331                                   .retnpexpr:
  7332 000032A3 C3                       ret
  7333 000032A4 5F00                    pexpr_0 db "_",0
  7334 000032A6 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7335 000032AF 2C20616C5C6E206A65-
  7336 000032B8 202E00             
  7337                                  ENDP
  7338                                  
  7339                                  doemit: PROC
  7340 000032BB 68[F732]                 push doemit_0
  7341 000032BE E827D1                   call prs
  7342 000032C1 83C402                   add  sp, 2
  7343                                  
  7344                                  ;-849   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7345                                  
  7346                                  .L1:
  7347 000032C4 E87DD6                   call getlex
  7348 000032C7 A3[1E00]                 mov word [token], ax
  7349 000032CA FF36[2C00]               push word [lexval]
  7350 000032CE E87AD2                   call prunsign1
  7351 000032D1 83C402                   add  sp, 2
  7352 000032D4 E86DD6                   call getlex
  7353 000032D7 A3[1E00]                 mov word [token], ax
  7354                                  
  7355                                  ;-850     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7356                                  
  7357 000032DA A1[1E00]                 mov ax, [token]
  7358 000032DD 83F82C                   cmp ax, 44
  7359 000032E0 0F850A00                 jne .doemit402
  7360 000032E4 6A2C                     push 44
  7361 000032E6 E8A6D0                   call prc
  7362 000032E9 83C402                   add  sp, 2
  7363 000032EC EBD6                     jmp .L1
  7364                                  .doemit402:
  7365 000032EE 6A29                     push 41
  7366 000032F0 E8F2DB                   call expect
  7367 000032F3 83C402                   add  sp, 2
  7368                                  
  7369                                  ;-851 
  7370                                  
  7371                                  
  7372                                  ;-852 
  7373                                  
  7374                                  
  7375                                  ;-853 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7376                                  
  7377 000032F6 C3                       ret
  7378 000032F7 5C6E2064622000          doemit_0 db "\n db ",0
  7379                                  ENDP
  7380                                  
  7381                                  prlabel: PROC;
  7382 000032FE C8000000                 ENTER  0,0
  7383 00003302 68[2933]                 push prlabel_0
  7384 00003305 E8E0D0                   call prs
  7385 00003308 83C402                   add  sp, 2
  7386 0000330B 8D063B6A                 lea  ax, [fname]
  7387 0000330F 50                       push ax
  7388 00003310 E8D5D0                   call prs
  7389 00003313 83C402                   add  sp, 2
  7390 00003316 FF7604                   push word [bp+4]
  7391 00003319 E82FD2                   call prunsign1
  7392 0000331C 83C402                   add  sp, 2
  7393 0000331F 6A3A                     push 58
  7394 00003321 E86BD0                   call prc
  7395 00003324 83C402                   add  sp, 2
  7396                                  
  7397                                  ;-854 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7398 00003327 C9                       LEAVE
  7399 00003328 C3                       ret
  7400 00003329 5C6E2E00                prlabel_0 db "\n.",0
  7401                                  ENDP
  7402                                  
  7403                                  prjump: PROC;
  7404 0000332D C8000000                 ENTER  0,0
  7405 00003331 68[5033]                 push prjump_0
  7406 00003334 E8B1D0                   call prs
  7407 00003337 83C402                   add  sp, 2
  7408 0000333A 8D063B6A                 lea  ax, [fname]
  7409 0000333E 50                       push ax
  7410 0000333F E8A6D0                   call prs
  7411 00003342 83C402                   add  sp, 2
  7412 00003345 FF7604                   push word [bp+4]
  7413 00003348 E800D2                   call prunsign1
  7414 0000334B 83C402                   add  sp, 2
  7415                                  
  7416                                  ;-855 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7417 0000334E C9                       LEAVE
  7418 0000334F C3                       ret
  7419 00003350 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7420                                  ENDP
  7421                                  
  7422                                  doif: PROC;
  7423 00003359 C8040000                 ENTER  4,0
  7424 0000335D E8C9FE                   call pexpr
  7425 00003360 FF06[2A00]               inc  word[nlabel]
  7426 00003364 A1[2A00]                 mov ax, [nlabel]
  7427 00003367 8946FE                   mov [bp-2], ax
  7428                                  
  7429                                  ;-856   pint1(jdest); stmt();
  7430                                  
  7431 0000336A FF76FE                   push word [bp-2]
  7432 0000336D E87DD1                   call pint1
  7433 00003370 83C402                   add  sp, 2
  7434 00003373 E8D600                   call stmt
  7435                                  
  7436                                  ;-857   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7437                                  
  7438 00003376 680202                   push 514
  7439 00003379 E847DB                   call istoken
  7440 0000337C 83C402                   add  sp, 2
  7441 0000337F 08C0                     or  al, al
  7442 00003381 0F842B00                 je .doif403
  7443 00003385 FF06[2A00]               inc  word[nlabel]
  7444 00003389 A1[2A00]                 mov ax, [nlabel]
  7445 0000338C 8946FC                   mov [bp-4], ax
  7446                                  
  7447                                  ;-858     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7448                                  
  7449 0000338F FF76FC                   push word [bp-4]
  7450 00003392 E898FF                   call prjump
  7451 00003395 83C402                   add  sp, 2
  7452 00003398 FF76FE                   push word [bp-2]
  7453 0000339B E860FF                   call prlabel
  7454 0000339E 83C402                   add  sp, 2
  7455 000033A1 E8A800                   call stmt
  7456 000033A4 FF76FC                   push word [bp-4]
  7457 000033A7 E854FF                   call prlabel
  7458 000033AA 83C402                   add  sp, 2
  7459                                  
  7460                                  ;-859   else prlabel(jdest); }
  7461                                  
  7462 000033AD E90900                   jmp .doif404
  7463                                  .doif403:
  7464 000033B0 FF76FE                   push word [bp-2]
  7465 000033B3 E848FF                   call prlabel
  7466 000033B6 83C402                   add  sp, 2
  7467                                  .doif404:
  7468                                  
  7469                                  ;-860 
  7470                                  
  7471                                  
  7472                                  ;-861 int dodo() {int jdest; int jtemp;
  7473 000033B9 C9                       LEAVE
  7474 000033BA C3                       ret
  7475                                  ENDP
  7476                                  
  7477                                  dodo: PROC
  7478                                  
  7479                                  ;-862   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7480                                  ;
  7481 000033BB C8040000                 ENTER  4,0
  7482 000033BF FF06[2A00]               inc  word[nlabel]
  7483 000033C3 A1[2A00]                 mov ax, [nlabel]
  7484 000033C6 8946FE                   mov [bp-2], ax
  7485 000033C9 FF76FE                   push word [bp-2]
  7486 000033CC E82FFF                   call prlabel
  7487 000033CF 83C402                   add  sp, 2
  7488 000033D2 E87700                   call stmt
  7489                                  
  7490                                  ;-863   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7491                                  
  7492 000033D5 680302                   push 515
  7493 000033D8 E80ADB                   call expect
  7494 000033DB 83C402                   add  sp, 2
  7495 000033DE E848FE                   call pexpr
  7496 000033E1 FF06[2A00]               inc  word[nlabel]
  7497 000033E5 A1[2A00]                 mov ax, [nlabel]
  7498 000033E8 8946FC                   mov [bp-4], ax
  7499 000033EB FF76FC                   push word [bp-4]
  7500 000033EE E8FCD0                   call pint1
  7501 000033F1 83C402                   add  sp, 2
  7502                                  
  7503                                  ;-864   prjump(jdest); prlabel(jtemp); }
  7504                                  
  7505 000033F4 FF76FE                   push word [bp-2]
  7506 000033F7 E833FF                   call prjump
  7507 000033FA 83C402                   add  sp, 2
  7508 000033FD FF76FC                   push word [bp-4]
  7509 00003400 E8FBFE                   call prlabel
  7510 00003403 83C402                   add  sp, 2
  7511                                  
  7512                                  ;-865 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7513 00003406 C9                       LEAVE
  7514 00003407 C3                       ret
  7515                                  ENDP
  7516                                  
  7517                                  dowhile: PROC;
  7518 00003408 C8040000                 ENTER  4,0
  7519 0000340C FF06[2A00]               inc  word[nlabel]
  7520 00003410 A1[2A00]                 mov ax, [nlabel]
  7521 00003413 8946FE                   mov [bp-2], ax
  7522                                  
  7523                                  ;-866   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7524                                  
  7525 00003416 FF76FE                   push word [bp-2]
  7526 00003419 E8E2FE                   call prlabel
  7527 0000341C 83C402                   add  sp, 2
  7528 0000341F E807FE                   call pexpr
  7529 00003422 FF06[2A00]               inc  word[nlabel]
  7530 00003426 A1[2A00]                 mov ax, [nlabel]
  7531 00003429 8946FC                   mov [bp-4], ax
  7532 0000342C FF76FC                   push word [bp-4]
  7533 0000342F E8BBD0                   call pint1
  7534 00003432 83C402                   add  sp, 2
  7535                                  
  7536                                  ;-867   stmt(); prjump(jdest); prlabel(tst); }
  7537                                  
  7538 00003435 E81400                   call stmt
  7539 00003438 FF76FE                   push word [bp-2]
  7540 0000343B E8EFFE                   call prjump
  7541 0000343E 83C402                   add  sp, 2
  7542 00003441 FF76FC                   push word [bp-4]
  7543 00003444 E8B7FE                   call prlabel
  7544 00003447 83C402                   add  sp, 2
  7545                                  
  7546                                  ;-868 
  7547                                  
  7548                                  
  7549                                  ;-869 int stmt() { int c; char cha;
  7550 0000344A C9                       LEAVE
  7551 0000344B C3                       ret
  7552                                  ENDP
  7553                                  
  7554                                  stmt: PROC
  7555                                  
  7556                                  ;-870        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7557                                  ;
  7558 0000344C C8040000                 ENTER  4,0
  7559 00003450 6A7B                     push 123
  7560 00003452 E86EDA                   call istoken
  7561 00003455 83C402                   add  sp, 2
  7562 00003458 08C0                     or  al, al
  7563 0000345A 0F841700                 je .stmt405
  7564                                  .stmt406:
  7565 0000345E 6A7D                     push 125
  7566 00003460 E860DA                   call istoken
  7567 00003463 83C402                   add  sp, 2
  7568 00003466 83F800                   cmp ax, 0
  7569 00003469 0F850500                 jne .stmt407
  7570 0000346D E8DCFF                   call stmt
  7571 00003470 EBEC                     jmp .stmt406
  7572                                  .stmt407:
  7573                                  
  7574                                  ;-871   else if(istoken(T_IF))    doif();
  7575                                  
  7576 00003472 E9BA01                   jmp .stmt408
  7577                                  .stmt405:
  7578 00003475 680102                   push 513
  7579 00003478 E848DA                   call istoken
  7580 0000347B 83C402                   add  sp, 2
  7581 0000347E 08C0                     or  al, al
  7582 00003480 0F840600                 je .stmt409
  7583 00003484 E8D2FE                   call doif
  7584                                  
  7585                                  ;-872   else if(istoken(T_DO))    dodo();
  7586                                  
  7587 00003487 E9A501                   jmp .stmt410
  7588                                  .stmt409:
  7589 0000348A 680402                   push 516
  7590 0000348D E833DA                   call istoken
  7591 00003490 83C402                   add  sp, 2
  7592 00003493 08C0                     or  al, al
  7593 00003495 0F840600                 je .stmt411
  7594 00003499 E81FFF                   call dodo
  7595                                  
  7596                                  ;-873   else if(istoken(T_WHILE)) dowhile();
  7597                                  
  7598 0000349C E99001                   jmp .stmt412
  7599                                  .stmt411:
  7600 0000349F 680302                   push 515
  7601 000034A2 E81EDA                   call istoken
  7602 000034A5 83C402                   add  sp, 2
  7603 000034A8 08C0                     or  al, al
  7604 000034AA 0F840600                 je .stmt413
  7605 000034AE E857FF                   call dowhile
  7606                                  
  7607                                  ;-874   else if(istoken(T_GOTO))  {
  7608                                  
  7609 000034B1 E97B01                   jmp .stmt414
  7610                                  .stmt413:
  7611 000034B4 680902                   push 521
  7612 000034B7 E809DA                   call istoken
  7613 000034BA 83C402                   add  sp, 2
  7614 000034BD 08C0                     or  al, al
  7615 000034BF 0F842200                 je .stmt415
  7616                                  
  7617                                  ;-875     prs("\n jmp .");name1();prs(symbol);expect(';');}
  7618                                  
  7619 000034C3 68[3136]                 push stmt_0
  7620 000034C6 E81FCF                   call prs
  7621 000034C9 83C402                   add  sp, 2
  7622 000034CC E8C3DC                   call name1
  7623 000034CF 8D06BB69                 lea  ax, [symbol]
  7624 000034D3 50                       push ax
  7625 000034D4 E811CF                   call prs
  7626 000034D7 83C402                   add  sp, 2
  7627 000034DA 6A3B                     push 59
  7628 000034DC E806DA                   call expect
  7629 000034DF 83C402                   add  sp, 2
  7630                                  
  7631                                  ;-876   else if(token==T_ASM)     {prs("\n"); c=next();
  7632                                  
  7633 000034E2 E94A01                   jmp .stmt416
  7634                                  .stmt415:
  7635 000034E5 A1[1E00]                 mov ax, [token]
  7636 000034E8 3D0602                   cmp ax, 518
  7637 000034EB 0F853300                 jne .stmt417
  7638 000034EF 68[3A36]                 push stmt_1
  7639 000034F2 E8F3CE                   call prs
  7640 000034F5 83C402                   add  sp, 2
  7641 000034F8 E81ED3                   call next
  7642 000034FB 8946FE                   mov [bp-2], ax
  7643                                  
  7644                                  ;-877         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7645                                  
  7646                                  .stmt418:
  7647 000034FE 8B46FE                   mov ax, [bp-2]
  7648 00003501 83F80A                   cmp ax, 10
  7649 00003504 0F841100                 je  .stmt419
  7650 00003508 FF76FE                   push word [bp-2]
  7651 0000350B E881CE                   call prc
  7652 0000350E 83C402                   add  sp, 2
  7653 00003511 E805D3                   call next
  7654 00003514 8946FE                   mov [bp-2], ax
  7655 00003517 EBE5                     jmp .stmt418
  7656                                  .stmt419:
  7657 00003519 E828D4                   call getlex
  7658 0000351C A3[1E00]                 mov word [token], ax
  7659                                  
  7660                                  ;-878   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  7661                                  
  7662 0000351F E90D01                   jmp .stmt420
  7663                                  .stmt417:
  7664 00003522 680702                   push 519
  7665 00003525 E89BD9                   call istoken
  7666 00003528 83C402                   add  sp, 2
  7667 0000352B 08C0                     or  al, al
  7668 0000352D 0F844B00                 je .stmt421
  7669 00003531 A1[1E00]                 mov ax, [token]
  7670 00003534 83F87B                   cmp ax, 123
  7671 00003537 0F853500                 jne .stmt422
  7672 0000353B 68[3D36]                 push stmt_2
  7673 0000353E E8A7CE                   call prs
  7674 00003541 83C402                   add  sp, 2
  7675 00003544 E8D2D2                   call next
  7676 00003547 8846FC                   mov [bp-4], al
  7677                                  
  7678                                  ;-879         while(cha!= '}') { prc(cha); cha=next(); }
  7679                                  
  7680                                  .stmt423:
  7681 0000354A 8A46FC                   mov al, [bp-4]
  7682 0000354D 3C7D                     cmp al, 125
  7683 0000354F 0F841400                 je  .stmt424
  7684 00003553 8A46FC                   mov al, byte [bp-4]
  7685 00003556 B400                     mov ah, 0
  7686 00003558 50                       push ax
  7687 00003559 E833CE                   call prc
  7688 0000355C 83C402                   add  sp, 2
  7689 0000355F E8B7D2                   call next
  7690 00003562 8846FC                   mov [bp-4], al
  7691                                  
  7692                                  ;-880         token=getlex(); }
  7693                                  
  7694 00003565 EBE3                     jmp .stmt423
  7695                                  .stmt424:
  7696 00003567 E8DAD3                   call getlex
  7697 0000356A A3[1E00]                 mov word [token], ax
  7698                                  
  7699                                  ;-881         else error1("Curly open expected");
  7700                                  
  7701 0000356D E90900                   jmp .stmt425
  7702                                  .stmt422:
  7703 00003570 68[4036]                 push stmt_3
  7704 00003573 E893D0                   call error1
  7705 00003576 83C402                   add  sp, 2
  7706                                  
  7707                                  ;-882         }
  7708                                  
  7709                                  .stmt425:
  7710                                  
  7711                                  ;-883   else if(istoken(T_EMIT))   doemit();
  7712                                  
  7713 00003579 E9B300                   jmp .stmt426
  7714                                  .stmt421:
  7715 0000357C 680802                   push 520
  7716 0000357F E841D9                   call istoken
  7717 00003582 83C402                   add  sp, 2
  7718 00003585 08C0                     or  al, al
  7719 00003587 0F840600                 je .stmt427
  7720 0000358B E82DFD                   call doemit
  7721                                  
  7722                                  ;-884   else if(istoken(';'))      { }
  7723                                  
  7724 0000358E E99E00                   jmp .stmt428
  7725                                  .stmt427:
  7726 00003591 6A3B                     push 59
  7727 00003593 E82DD9                   call istoken
  7728 00003596 83C402                   add  sp, 2
  7729 00003599 08C0                     or  al, al
  7730 0000359B 0F840300                 je .stmt429
  7731                                  
  7732                                  ;-885   else if(istoken(T_RETURN)) {
  7733                                  
  7734 0000359F E98D00                   jmp .stmt430
  7735                                  .stmt429:
  7736 000035A2 680002                   push 512
  7737 000035A5 E81BD9                   call istoken
  7738 000035A8 83C402                   add  sp, 2
  7739 000035AB 08C0                     or  al, al
  7740 000035AD 0F843500                 je .stmt431
  7741                                  
  7742                                  ;-886         if (token!=';') expr(0);
  7743                                  
  7744 000035B1 A1[1E00]                 mov ax, [token]
  7745 000035B4 83F83B                   cmp ax, 59
  7746 000035B7 0F840800                 je  .stmt432
  7747 000035BB 6A00                     push 0
  7748 000035BD E805F8                   call expr
  7749 000035C0 83C402                   add  sp, 2
  7750                                  
  7751                                  ;-887         prs("\n jmp .retn");
  7752                                  
  7753                                  .stmt432:
  7754 000035C3 68[5436]                 push stmt_4
  7755 000035C6 E81FCE                   call prs
  7756 000035C9 83C402                   add  sp, 2
  7757                                  
  7758                                  ;-888         prs(fname);
  7759                                  
  7760 000035CC 8D063B6A                 lea  ax, [fname]
  7761 000035D0 50                       push ax
  7762 000035D1 E814CE                   call prs
  7763 000035D4 83C402                   add  sp, 2
  7764                                  
  7765                                  ;-889         nreturn++;
  7766                                  
  7767 000035D7 FF06[2800]               inc  word[nreturn]
  7768                                  
  7769                                  ;-890         expect(';');
  7770                                  
  7771 000035DB 6A3B                     push 59
  7772 000035DD E805D9                   call expect
  7773 000035E0 83C402                   add  sp, 2
  7774                                  
  7775                                  ;-891         }
  7776                                  
  7777                                  
  7778                                  ;-892   else if(thechar==':')      {
  7779                                  
  7780 000035E3 E94900                   jmp .stmt433
  7781                                  .stmt431:
  7782 000035E6 A0[2300]                 mov al, [thechar]
  7783 000035E9 3C3A                     cmp al, 58
  7784 000035EB 0F853000                 jne .stmt434
  7785                                  
  7786                                  ;-893         prs("\n."); // Label
  7787                                  
  7788 000035EF 68[6136]                 push stmt_5
  7789 000035F2 E8F3CD                   call prs
  7790 000035F5 83C402                   add  sp, 2
  7791                                  
  7792                                  ;-894         prs(symbol); prc(':');
  7793                                  
  7794 000035F8 8D06BB69                 lea  ax, [symbol]
  7795 000035FC 50                       push ax
  7796 000035FD E8E8CD                   call prs
  7797 00003600 83C402                   add  sp, 2
  7798 00003603 6A3A                     push 58
  7799 00003605 E887CD                   call prc
  7800 00003608 83C402                   add  sp, 2
  7801                                  
  7802                                  ;-895         expect(T_NAME);
  7803                                  
  7804 0000360B 680001                   push 256
  7805 0000360E E8D4D8                   call expect
  7806 00003611 83C402                   add  sp, 2
  7807                                  
  7808                                  ;-896         expect(':');
  7809                                  
  7810 00003614 6A3A                     push 58
  7811 00003616 E8CCD8                   call expect
  7812 00003619 83C402                   add  sp, 2
  7813                                  
  7814                                  ;-897         }
  7815                                  
  7816                                  
  7817                                  ;-898   else  {expr(0);; expect(';'); }
  7818                                  
  7819 0000361C E91000                   jmp .stmt435
  7820                                  .stmt434:
  7821 0000361F 6A00                     push 0
  7822 00003621 E8A1F7                   call expr
  7823 00003624 83C402                   add  sp, 2
  7824 00003627 6A3B                     push 59
  7825 00003629 E8B9D8                   call expect
  7826 0000362C 83C402                   add  sp, 2
  7827                                  
  7828                                  ;-899 }
  7829                                  
  7830                                  .stmt435:
  7831                                  .stmt433:
  7832                                  .stmt430:
  7833                                  .stmt428:
  7834                                  .stmt426:
  7835                                  .stmt420:
  7836                                  .stmt416:
  7837                                  .stmt414:
  7838                                  .stmt412:
  7839                                  .stmt410:
  7840                                  .stmt408:
  7841                                  
  7842                                  ;-900 
  7843                                  
  7844                                  
  7845                                  ;-901 
  7846                                  
  7847                                  
  7848                                  ;-902 int dofunc() { int nloc; int i; int narg;
  7849 0000362F C9                       LEAVE
  7850 00003630 C3                       ret
  7851 00003631 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7852 0000363A 5C6E00                  stmt_1 db "\n",0
  7853 0000363D 5C6E00                  stmt_2 db "\n",0
  7854 00003640 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7855 00003649 6E2065787065637465-
  7856 00003652 6400               
  7857 00003654 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7858 0000365D 65746E00           
  7859 00003661 5C6E2E00                stmt_5 db "\n.",0
  7860                                  ENDP
  7861                                  
  7862                                  dofunc: PROC
  7863                                  
  7864                                  ;-903   cloc=&co;
  7865                                  ;
  7866 00003665 C8060000                 ENTER  6,0
  7867 00003669 B8A861                   mov ax, co
  7868 0000366C A3[1800]                 mov word [cloc], ax
  7869                                  
  7870                                  ;-904   checknamelen();
  7871                                  
  7872 0000366F E8A4D9                   call checknamelen
  7873                                  
  7874                                  ;-905   strcpy(fname, symbol);
  7875                                  
  7876 00003672 8D06BB69                 lea  ax, [symbol]
  7877 00003676 50                       push ax
  7878 00003677 8D063B6A                 lea  ax, [fname]
  7879 0000367B 50                       push ax
  7880 0000367C E8B3CB                   call strcpy
  7881 0000367F 83C404                   add  sp, 4
  7882                                  
  7883                                  ;-906   if (checkFunction() ) error1("Function already defined");
  7884                                  
  7885 00003682 E87DDE                   call checkFunction
  7886 00003685 08C0                     or  al, al
  7887 00003687 0F840900                 je .dofunc436
  7888 0000368B 68[AC38]                 push dofunc_0
  7889 0000368E E878CF                   call error1
  7890 00003691 83C402                   add  sp, 2
  7891                                  
  7892                                  ;-907   storefunc();
  7893                                  
  7894                                  .dofunc436:
  7895 00003694 E83DDD                   call storefunc
  7896                                  
  7897                                  ;-908   prs("\n\n"); prs(symbol); prs(": PROC");
  7898                                  
  7899 00003697 68[C538]                 push dofunc_1
  7900 0000369A E84BCD                   call prs
  7901 0000369D 83C402                   add  sp, 2
  7902 000036A0 8D06BB69                 lea  ax, [symbol]
  7903 000036A4 50                       push ax
  7904 000036A5 E840CD                   call prs
  7905 000036A8 83C402                   add  sp, 2
  7906 000036AB 68[CA38]                 push dofunc_2
  7907 000036AE E837CD                   call prs
  7908 000036B1 83C402                   add  sp, 2
  7909                                  
  7910                                  ;-909   expect('('); LTop=LSTART;  i=0;
  7911                                  
  7912 000036B4 6A28                     push 40
  7913 000036B6 E82CD8                   call expect
  7914 000036B9 83C402                   add  sp, 2
  7915 000036BC B8C800                   mov ax, 200
  7916 000036BF A3[3B00]                 mov word [LTop], ax
  7917 000036C2 B80000                   mov ax, 0
  7918 000036C5 8946FC                   mov [bp-4], ax
  7919                                  
  7920                                  ;-910   if (istoken(')')==0) { narg=2;
  7921                                  
  7922 000036C8 6A29                     push 41
  7923 000036CA E8F6D7                   call istoken
  7924 000036CD 83C402                   add  sp, 2
  7925 000036D0 83F800                   cmp ax, 0
  7926 000036D3 0F854600                 jne .dofunc437
  7927 000036D7 B80200                   mov ax, 2
  7928 000036DA 8946FA                   mov [bp-6], ax
  7929                                  
  7930                                  ;-911     do { typeName();  addlocal(); narg+=2;
  7931                                  
  7932                                  .dofunc438:
  7933 000036DD E8DADA                   call typeName
  7934 000036E0 E866DD                   call addlocal
  7935 000036E3 8346FA02                 add  word[bp-6], 2
  7936                                  
  7937                                  ;-912          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7938                                  
  7939 000036E7 8B46FA                   mov ax, [bp-6]
  7940 000036EA 8B1E[3B00]               mov bx, [LTop]
  7941 000036EE D1E3                     shl bx, 1
  7942 000036F0 89873873                 mov [GData+bx], ax
  7943 000036F4 A0[3600]                 mov al, [iswidth]
  7944 000036F7 3C04                     cmp al, 4
  7945 000036F9 0F850400                 jne .dofunc439
  7946 000036FD 8346FA02                 add  word[bp-6], 2
  7947                                  .dofunc439:
  7948 00003701 FF06[3B00]               inc  word[LTop]
  7949                                  
  7950                                  ;-913     while (istoken(','));  expect(')'); }
  7951                                  
  7952 00003705 6A2C                     push 44
  7953 00003707 E8B9D7                   call istoken
  7954 0000370A 83C402                   add  sp, 2
  7955 0000370D 08C0                     or  al, al
  7956 0000370F 0F840200                 je .dofunc440
  7957 00003713 EBC8                     jmp .dofunc438
  7958                                  .dofunc440:
  7959 00003715 6A29                     push 41
  7960 00003717 E8CBD7                   call expect
  7961 0000371A 83C402                   add  sp, 2
  7962                                  
  7963                                  ;-914 
  7964                                  
  7965                                  
  7966                                  ;-915   expect('{'); /*body*/
  7967                                  
  7968                                  .dofunc437:
  7969 0000371D 6A7B                     push 123
  7970 0000371F E8C3D7                   call expect
  7971 00003722 83C402                   add  sp, 2
  7972                                  
  7973                                  ;-916   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  7974                                  
  7975 00003725 B80000                   mov ax, 0
  7976 00003728 8946FE                   mov [bp-2], ax
  7977 0000372B B80000                   mov ax, 0
  7978 0000372E A3[2800]                 mov word [nreturn], ax
  7979 00003731 B80000                   mov ax, 0
  7980 00003734 A3[2600]                 mov word [nconst], ax
  7981 00003737 B80000                   mov ax, 0
  7982 0000373A 8946FC                   mov [bp-4], ax
  7983                                  
  7984                                  ;-917   while(isvariable()) {
  7985                                  
  7986                                  .dofunc441:
  7987 0000373D E80FDE                   call isvariable
  7988 00003740 08C0                     or  al, al
  7989 00003742 0F849200                 je .dofunc442
  7990                                  
  7991                                  ;-918     do {typeName();
  7992                                  
  7993                                  .dofunc443:
  7994 00003746 E871DA                   call typeName
  7995                                  
  7996                                  ;-919         checknamelen();
  7997                                  
  7998 00003749 E8CAD8                   call checknamelen
  7999                                  
  8000                                  ;-920         addlocal(); nloc-=2;
  8001                                  
  8002 0000374C E8FADC                   call addlocal
  8003 0000374F 836EFE02                 sub  word[bp-2], 2
  8004                                  
  8005                                  ;-921         if (iswidth == 4) nloc-=2;
  8006                                  
  8007 00003753 A0[3600]                 mov al, [iswidth]
  8008 00003756 3C04                     cmp al, 4
  8009 00003758 0F850400                 jne .dofunc444
  8010 0000375C 836EFE02                 sub  word[bp-2], 2
  8011                                  
  8012                                  ;-922         GData[LTop]=nloc;
  8013                                  
  8014                                  .dofunc444:
  8015 00003760 8B46FE                   mov ax, [bp-2]
  8016 00003763 8B1E[3B00]               mov bx, [LTop]
  8017 00003767 D1E3                     shl bx, 1
  8018 00003769 89873873                 mov [GData+bx], ax
  8019                                  
  8020                                  ;-923         if (istoken('[')){
  8021                                  
  8022 0000376D 6A5B                     push 91
  8023 0000376F E851D7                   call istoken
  8024 00003772 83C402                   add  sp, 2
  8025 00003775 08C0                     or  al, al
  8026 00003777 0F843D00                 je .dofunc445
  8027                                  
  8028                                  ;-924             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  8029                                  
  8030 0000377B B82600                   mov ax, 38
  8031 0000377E A2[3000]                 mov byte [istype], al
  8032 00003781 B82600                   mov ax, 38
  8033 00003784 8B1E[3B00]               mov bx, [LTop]
  8034 00003788 8887046B                 mov [GType+bx], al
  8035 0000378C 680101                   push 257
  8036 0000378F E853D7                   call expect
  8037 00003792 83C402                   add  sp, 2
  8038 00003795 6A5D                     push 93
  8039 00003797 E84BD7                   call expect
  8040 0000379A 83C402                   add  sp, 2
  8041                                  
  8042                                  ;-925             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  8043                                  
  8044 0000379D 8B46FE                   mov ax, [bp-2]
  8045 000037A0 2B06[2C00]               sub ax, [lexval]
  8046 000037A4 8946FE                   mov [bp-2], ax
  8047 000037A7 8346FE02                 add  word[bp-2], 2
  8048 000037AB 8B46FE                   mov ax, [bp-2]
  8049 000037AE 8B1E[3B00]               mov bx, [LTop]
  8050 000037B2 D1E3                     shl bx, 1
  8051 000037B4 89873873                 mov [GData+bx], ax
  8052                                  
  8053                                  ;-926             }
  8054                                  
  8055                                  
  8056                                  ;-927         LTop++;
  8057                                  
  8058                                  .dofunc445:
  8059 000037B8 FF06[3B00]               inc  word[LTop]
  8060                                  
  8061                                  ;-928       } while (istoken(',')); expect(';'); }
  8062                                  
  8063 000037BC 6A2C                     push 44
  8064 000037BE E802D7                   call istoken
  8065 000037C1 83C402                   add  sp, 2
  8066 000037C4 08C0                     or  al, al
  8067 000037C6 0F840300                 je .dofunc446
  8068 000037CA E979FF                   jmp .dofunc443
  8069                                  .dofunc446:
  8070 000037CD 6A3B                     push 59
  8071 000037CF E813D7                   call expect
  8072 000037D2 83C402                   add  sp, 2
  8073                                  
  8074                                  ;-929   if (LTop>LSTART){prs(";\n ENTER  ");
  8075                                  
  8076 000037D5 E965FF                   jmp .dofunc441
  8077                                  .dofunc442:
  8078 000037D8 A1[3B00]                 mov ax, [LTop]
  8079 000037DB 3DC800                   cmp ax, 200
  8080 000037DE 0F8E2700                 jle .dofunc447
  8081 000037E2 68[D138]                 push dofunc_3
  8082 000037E5 E800CC                   call prs
  8083 000037E8 83C402                   add  sp, 2
  8084                                  
  8085                                  ;-930     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8086                                  
  8087 000037EB FF76FE                   push word [bp-2]
  8088 000037EE E8B9C8                   call mkneg
  8089 000037F1 83C402                   add  sp, 2
  8090 000037F4 8946FE                   mov [bp-2], ax
  8091 000037F7 FF76FE                   push word [bp-2]
  8092 000037FA E84ECD                   call prunsign1
  8093 000037FD 83C402                   add  sp, 2
  8094 00003800 68[DD38]                 push dofunc_4
  8095 00003803 E8E2CB                   call prs
  8096 00003806 83C402                   add  sp, 2
  8097                                  
  8098                                  ;-931   while(istoken('}')==0)   stmt();
  8099                                  
  8100                                  .dofunc447:
  8101                                  .dofunc448:
  8102 00003809 6A7D                     push 125
  8103 0000380B E8B5D6                   call istoken
  8104 0000380E 83C402                   add  sp, 2
  8105 00003811 83F800                   cmp ax, 0
  8106 00003814 0F850500                 jne .dofunc449
  8107 00003818 E831FC                   call stmt
  8108                                  
  8109                                  ;-932   if (nreturn) {
  8110                                  
  8111 0000381B EBEC                     jmp .dofunc448
  8112                                  .dofunc449:
  8113 0000381D A1[2800]                 mov ax, [nreturn]
  8114 00003820 08C0                     or  al, al
  8115 00003822 0F841C00                 je .dofunc450
  8116                                  
  8117                                  ;-933         prs("\n .retn");
  8118                                  
  8119 00003826 68[E038]                 push dofunc_5
  8120 00003829 E8BCCB                   call prs
  8121 0000382C 83C402                   add  sp, 2
  8122                                  
  8123                                  ;-934         prs(fname);
  8124                                  
  8125 0000382F 8D063B6A                 lea  ax, [fname]
  8126 00003833 50                       push ax
  8127 00003834 E8B1CB                   call prs
  8128 00003837 83C402                   add  sp, 2
  8129                                  
  8130                                  ;-935         prc(':');
  8131                                  
  8132 0000383A 6A3A                     push 58
  8133 0000383C E850CB                   call prc
  8134 0000383F 83C402                   add  sp, 2
  8135                                  
  8136                                  ;-936         }
  8137                                  
  8138                                  
  8139                                  ;-937   if (LTop > LSTART) prs(" LEAVE");
  8140                                  
  8141                                  .dofunc450:
  8142 00003842 A1[3B00]                 mov ax, [LTop]
  8143 00003845 3DC800                   cmp ax, 200
  8144 00003848 0F8E0900                 jle .dofunc451
  8145 0000384C 68[E938]                 push dofunc_6
  8146 0000384F E896CB                   call prs
  8147 00003852 83C402                   add  sp, 2
  8148                                  
  8149                                  ;-938   prs("\n ret");
  8150                                  
  8151                                  .dofunc451:
  8152 00003855 68[F038]                 push dofunc_7
  8153 00003858 E88DCB                   call prs
  8154 0000385B 83C402                   add  sp, 2
  8155                                  
  8156                                  ;-939   *cloc=0; prs(co);
  8157                                  
  8158 0000385E B80000                   mov ax, 0
  8159 00003861 8B1E[1800]               mov  bx, [cloc]
  8160 00003865 8807                     mov  [bx], al
  8161 00003867 8D06A861                 lea  ax, [co]
  8162 0000386B 50                       push ax
  8163 0000386C E879CB                   call prs
  8164 0000386F 83C402                   add  sp, 2
  8165                                  
  8166                                  ;-940   maxco1=strlen(co);
  8167                                  
  8168 00003872 8D06A861                 lea  ax, [co]
  8169 00003876 50                       push ax
  8170 00003877 E890C9                   call strlen
  8171 0000387A 83C402                   add  sp, 2
  8172 0000387D A3[1600]                 mov word [maxco1], ax
  8173                                  
  8174                                  ;-941   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  8175                                  
  8176 00003880 A1[1600]                 mov ax, [maxco1]
  8177 00003883 3B06[1400]               cmp ax, [maxco]
  8178 00003887 0F8E1600                 jle .dofunc452
  8179 0000388B A1[1600]                 mov ax, [maxco1]
  8180 0000388E A3[1400]                 mov word [maxco], ax
  8181 00003891 8D063B6A                 lea  ax, [fname]
  8182 00003895 50                       push ax
  8183 00003896 8D067869                 lea  ax, [coname]
  8184 0000389A 50                       push ax
  8185 0000389B E894C9                   call strcpy
  8186 0000389E 83C404                   add  sp, 4
  8187                                  
  8188                                  ;-942   prs("\nENDP");
  8189                                  
  8190                                  .dofunc452:
  8191 000038A1 68[F738]                 push dofunc_8
  8192 000038A4 E841CB                   call prs
  8193 000038A7 83C402                   add  sp, 2
  8194                                  
  8195                                  ;-943 }
  8196                                  
  8197                                  
  8198                                  ;-944 
  8199                                  
  8200                                  
  8201                                  ;-945 char doglobName[IDLENMAX];
  8202 000038AA C9                       LEAVE
  8203 000038AB C3                       ret
  8204 000038AC 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8205 000038B5 616C72656164792064-
  8206 000038BE 6566696E656400     
  8207 000038C5 5C6E5C6E00              dofunc_1 db "\n\n",0
  8208 000038CA 3A2050524F4300          dofunc_2 db ": PROC",0
  8209 000038D1 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  8210 000038DA 202000             
  8211 000038DD 2C3000                  dofunc_4 db ",0",0
  8212 000038E0 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  8213 000038E9 204C4541564500          dofunc_6 db " LEAVE",0
  8214 000038F0 5C6E2072657400          dofunc_7 db "\n ret",0
  8215 000038F7 5C6E454E445000          dofunc_8 db "\nENDP",0
  8216                                  ENDP
  8217                                  section .bss
  8218                                  absolute 55982
  8219 0000DAAE <res 0000000F>          doglobName resb 15
  8220                                  section .text
  8221                                  
  8222                                  ;-946 int doglob() {
  8223                                  
  8224                                  
  8225                                  doglob: PROC
  8226                                  
  8227                                  ;-947     int i; int j; int isstrarr; isstrarr=0;
  8228                                  ;
  8229 000038FE C8060000                 ENTER  6,0
  8230 00003902 B80000                   mov ax, 0
  8231 00003905 8946FA                   mov [bp-6], ax
  8232                                  
  8233                                  ;-948   if (GTop >= LSTART) error1("Global table full");
  8234                                  
  8235 00003908 A1[3900]                 mov ax, [GTop]
  8236 0000390B 3DC800                   cmp ax, 200 ;unsigned : 1
  8237 0000390E 0F8C0900                 jl  .doglob453
  8238 00003912 68[533C]                 push doglob_0
  8239 00003915 E8F1CC                   call error1
  8240 00003918 83C402                   add  sp, 2
  8241                                  
  8242                                  ;-949   if (iswidth == 0) error1("no VOID as var type");
  8243                                  
  8244                                  .doglob453:
  8245 0000391B A0[3600]                 mov al, [iswidth]
  8246 0000391E 3C00                     cmp al, 0
  8247 00003920 0F850900                 jne .doglob454
  8248 00003924 68[653C]                 push doglob_1
  8249 00003927 E8DFCC                   call error1
  8250 0000392A 83C402                   add  sp, 2
  8251                                  
  8252                                  ;-950   checknamelen();
  8253                                  
  8254                                  .doglob454:
  8255 0000392D E8E6D6                   call checknamelen
  8256                                  
  8257                                  ;-951   if (checkName() != 0) error1("Variable already defined");
  8258                                  
  8259 00003930 E890D7                   call checkName
  8260 00003933 3C00                     cmp al, 0
  8261 00003935 0F840900                 je  .doglob455
  8262 00003939 68[793C]                 push doglob_2
  8263 0000393C E8CACC                   call error1
  8264 0000393F 83C402                   add  sp, 2
  8265                                  
  8266                                  ;-952   if (istoken('[')) { istype='&';
  8267                                  
  8268                                  .doglob455:
  8269 00003942 6A5B                     push 91
  8270 00003944 E87CD5                   call istoken
  8271 00003947 83C402                   add  sp, 2
  8272 0000394A 08C0                     or  al, al
  8273 0000394C 0F84E201                 je .doglob456
  8274 00003950 B82600                   mov ax, 38
  8275 00003953 A2[3000]                 mov byte [istype], al
  8276                                  
  8277                                  ;-953     if (istoken(T_CONST)) {
  8278                                  
  8279 00003956 680101                   push 257
  8280 00003959 E867D5                   call istoken
  8281 0000395C 83C402                   add  sp, 2
  8282 0000395F 08C0                     or  al, al
  8283 00003961 0F84C200                 je .doglob457
  8284                                  
  8285                                  ;-954       prs("\nsection .bss\nabsolute ");
  8286                                  
  8287 00003965 68[923C]                 push doglob_3
  8288 00003968 E87DCA                   call prs
  8289 0000396B 83C402                   add  sp, 2
  8290                                  
  8291                                  ;-955       prunsign1(orgData);
  8292                                  
  8293 0000396E FF36[1200]               push word [orgData]
  8294 00003972 E8D6CB                   call prunsign1
  8295 00003975 83C402                   add  sp, 2
  8296                                  
  8297                                  ;-956       prs("\n"); prs(symbol);
  8298                                  
  8299 00003978 68[AC3C]                 push doglob_4
  8300 0000397B E86ACA                   call prs
  8301 0000397E 83C402                   add  sp, 2
  8302 00003981 8D06BB69                 lea  ax, [symbol]
  8303 00003985 50                       push ax
  8304 00003986 E85FCA                   call prs
  8305 00003989 83C402                   add  sp, 2
  8306                                  
  8307                                  ;-957       if (iswidth==1) prs(" resb ");
  8308                                  
  8309 0000398C A0[3600]                 mov al, [iswidth]
  8310 0000398F 3C01                     cmp al, 1
  8311 00003991 0F850900                 jne .doglob458
  8312 00003995 68[AF3C]                 push doglob_5
  8313 00003998 E84DCA                   call prs
  8314 0000399B 83C402                   add  sp, 2
  8315                                  
  8316                                  ;-958       if (iswidth==2) prs(" resw ");
  8317                                  
  8318                                  .doglob458:
  8319 0000399E A0[3600]                 mov al, [iswidth]
  8320 000039A1 3C02                     cmp al, 2
  8321 000039A3 0F850900                 jne .doglob459
  8322 000039A7 68[B63C]                 push doglob_6
  8323 000039AA E83BCA                   call prs
  8324 000039AD 83C402                   add  sp, 2
  8325                                  
  8326                                  ;-959       if (iswidth==4) prs(" resd ");
  8327                                  
  8328                                  .doglob459:
  8329 000039B0 A0[3600]                 mov al, [iswidth]
  8330 000039B3 3C04                     cmp al, 4
  8331 000039B5 0F850900                 jne .doglob460
  8332 000039B9 68[BD3C]                 push doglob_7
  8333 000039BC E829CA                   call prs
  8334 000039BF 83C402                   add  sp, 2
  8335                                  
  8336                                  ;-960       prunsign1(lexval);
  8337                                  
  8338                                  .doglob460:
  8339 000039C2 FF36[2C00]               push word [lexval]
  8340 000039C6 E882CB                   call prunsign1
  8341 000039C9 83C402                   add  sp, 2
  8342                                  
  8343                                  ;-961       prs("\nsection .text");
  8344                                  
  8345 000039CC 68[C43C]                 push doglob_8
  8346 000039CF E816CA                   call prs
  8347 000039D2 83C402                   add  sp, 2
  8348                                  
  8349                                  ;-962       orgData=orgData+lexval;
  8350                                  
  8351 000039D5 A1[1200]                 mov ax, [orgData]
  8352 000039D8 0306[2C00]               add ax, [lexval]
  8353 000039DC A3[1200]                 mov word [orgData], ax
  8354                                  
  8355                                  ;-963       if (iswidth==2) orgData=orgData+lexval;
  8356                                  
  8357 000039DF A0[3600]                 mov al, [iswidth]
  8358 000039E2 3C02                     cmp al, 2
  8359 000039E4 0F850A00                 jne .doglob461
  8360 000039E8 A1[1200]                 mov ax, [orgData]
  8361 000039EB 0306[2C00]               add ax, [lexval]
  8362 000039EF A3[1200]                 mov word [orgData], ax
  8363                                  
  8364                                  ;-964       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8365                                  
  8366                                  .doglob461:
  8367 000039F2 A0[3600]                 mov al, [iswidth]
  8368 000039F5 3C04                     cmp al, 4
  8369 000039F7 0F851400                 jne .doglob462
  8370 000039FB A1[2C00]                 mov ax, [lexval]
  8371 000039FE BB0300                   mov bx, 3
  8372 00003A01 F7E3                     mul bx
  8373 00003A03 8946FE                   mov [bp-2], ax
  8374 00003A06 A1[1200]                 mov ax, [orgData]
  8375 00003A09 0346FE                   add ax, [bp-2]
  8376 00003A0C A3[1200]                 mov word [orgData], ax
  8377                                  
  8378                                  ;-965       GData[GTop]=lexval; expect(']');
  8379                                  
  8380                                  .doglob462:
  8381 00003A0F A1[2C00]                 mov ax, [lexval]
  8382 00003A12 8B1E[3900]               mov bx, [GTop]
  8383 00003A16 D1E3                     shl bx, 1
  8384 00003A18 89873873                 mov [GData+bx], ax
  8385 00003A1C 6A5D                     push 93
  8386 00003A1E E8C4D4                   call expect
  8387 00003A21 83C402                   add  sp, 2
  8388                                  
  8389                                  ;-966     }else { expect(']');
  8390                                  
  8391 00003A24 E90801                   jmp .doglob463
  8392                                  .doglob457:
  8393 00003A27 6A5D                     push 93
  8394 00003A29 E8B9D4                   call expect
  8395 00003A2C 83C402                   add  sp, 2
  8396                                  
  8397                                  ;-967       if (iswidth != 1) error1("Only ByteArray allowed");
  8398                                  
  8399 00003A2F A0[3600]                 mov al, [iswidth]
  8400 00003A32 3C01                     cmp al, 1
  8401 00003A34 0F840900                 je  .doglob464
  8402 00003A38 68[D43C]                 push doglob_9
  8403 00003A3B E8CBCB                   call error1
  8404 00003A3E 83C402                   add  sp, 2
  8405                                  
  8406                                  ;-968       prs("\n"); prs(symbol); prs(" db ");
  8407                                  
  8408                                  .doglob464:
  8409 00003A41 68[EB3C]                 push doglob_10
  8410 00003A44 E8A1C9                   call prs
  8411 00003A47 83C402                   add  sp, 2
  8412 00003A4A 8D06BB69                 lea  ax, [symbol]
  8413 00003A4E 50                       push ax
  8414 00003A4F E896C9                   call prs
  8415 00003A52 83C402                   add  sp, 2
  8416 00003A55 68[EE3C]                 push doglob_11
  8417 00003A58 E88DC9                   call prs
  8418 00003A5B 83C402                   add  sp, 2
  8419                                  
  8420                                  ;-969       isstrarr=1; strcpy(doglobName, symbol);
  8421                                  
  8422 00003A5E B80100                   mov ax, 1
  8423 00003A61 8946FA                   mov [bp-6], ax
  8424 00003A64 8D06BB69                 lea  ax, [symbol]
  8425 00003A68 50                       push ax
  8426 00003A69 8D06AEDA                 lea  ax, [doglobName]
  8427 00003A6D 50                       push ax
  8428 00003A6E E8C1C7                   call strcpy
  8429 00003A71 83C404                   add  sp, 4
  8430                                  
  8431                                  ;-970       expect('=');
  8432                                  
  8433 00003A74 6A3D                     push 61
  8434 00003A76 E86CD4                   call expect
  8435 00003A79 83C402                   add  sp, 2
  8436                                  
  8437                                  ;-971       if (istoken(T_STRING)) {
  8438                                  
  8439 00003A7C 680201                   push 258
  8440 00003A7F E841D4                   call istoken
  8441 00003A82 83C402                   add  sp, 2
  8442 00003A85 08C0                     or  al, al
  8443 00003A87 0F844200                 je .doglob465
  8444                                  
  8445                                  ;-972         prc(34); prscomment(symbol); prc(34); prs(",0");
  8446                                  
  8447 00003A8B 6A22                     push 34
  8448 00003A8D E8FFC8                   call prc
  8449 00003A90 83C402                   add  sp, 2
  8450 00003A93 8D06BB69                 lea  ax, [symbol]
  8451 00003A97 50                       push ax
  8452 00003A98 E81FC9                   call prscomment
  8453 00003A9B 83C402                   add  sp, 2
  8454 00003A9E 6A22                     push 34
  8455 00003AA0 E8ECC8                   call prc
  8456 00003AA3 83C402                   add  sp, 2
  8457 00003AA6 68[F33C]                 push doglob_12
  8458 00003AA9 E83CC9                   call prs
  8459 00003AAC 83C402                   add  sp, 2
  8460                                  
  8461                                  ;-973         i=strlen(symbol); GData[GTop]=i; }
  8462                                  
  8463 00003AAF 8D06BB69                 lea  ax, [symbol]
  8464 00003AB3 50                       push ax
  8465 00003AB4 E853C7                   call strlen
  8466 00003AB7 83C402                   add  sp, 2
  8467 00003ABA 8946FE                   mov [bp-2], ax
  8468 00003ABD 8B46FE                   mov ax, [bp-2]
  8469 00003AC0 8B1E[3900]               mov bx, [GTop]
  8470 00003AC4 D1E3                     shl bx, 1
  8471 00003AC6 89873873                 mov [GData+bx], ax
  8472                                  
  8473                                  ;-974       else if (istoken('{' )) { i=0;
  8474                                  
  8475 00003ACA E96200                   jmp .doglob466
  8476                                  .doglob465:
  8477 00003ACD 6A7B                     push 123
  8478 00003ACF E8F1D3                   call istoken
  8479 00003AD2 83C402                   add  sp, 2
  8480 00003AD5 08C0                     or  al, al
  8481 00003AD7 0F844B00                 je .doglob467
  8482 00003ADB B80000                   mov ax, 0
  8483 00003ADE 8946FE                   mov [bp-2], ax
  8484                                  
  8485                                  ;-975         do { if(i) prc(',');
  8486                                  
  8487                                  .doglob468:
  8488 00003AE1 8B46FE                   mov ax, [bp-2]
  8489 00003AE4 08C0                     or  al, al
  8490 00003AE6 0F840800                 je .doglob469
  8491 00003AEA 6A2C                     push 44
  8492 00003AEC E8A0C8                   call prc
  8493 00003AEF 83C402                   add  sp, 2
  8494                                  
  8495                                  ;-976           expect(T_CONST); prunsign1(lexval); i=1; }
  8496                                  
  8497                                  .doglob469:
  8498 00003AF2 680101                   push 257
  8499 00003AF5 E8EDD3                   call expect
  8500 00003AF8 83C402                   add  sp, 2
  8501 00003AFB FF36[2C00]               push word [lexval]
  8502 00003AFF E849CA                   call prunsign1
  8503 00003B02 83C402                   add  sp, 2
  8504 00003B05 B80100                   mov ax, 1
  8505 00003B08 8946FE                   mov [bp-2], ax
  8506                                  
  8507                                  ;-977         while (istoken(',')); expect('}'); }
  8508                                  
  8509 00003B0B 6A2C                     push 44
  8510 00003B0D E8B3D3                   call istoken
  8511 00003B10 83C402                   add  sp, 2
  8512 00003B13 08C0                     or  al, al
  8513 00003B15 0F840200                 je .doglob470
  8514 00003B19 EBC6                     jmp .doglob468
  8515                                  .doglob470:
  8516 00003B1B 6A7D                     push 125
  8517 00003B1D E8C5D3                   call expect
  8518 00003B20 83C402                   add  sp, 2
  8519                                  
  8520                                  ;-978       else error1("String or number array expected");
  8521                                  
  8522 00003B23 E90900                   jmp .doglob471
  8523                                  .doglob467:
  8524 00003B26 68[F63C]                 push doglob_13
  8525 00003B29 E8DDCA                   call error1
  8526 00003B2C 83C402                   add  sp, 2
  8527                                  
  8528                                  ;-979       };
  8529                                  
  8530                                  .doglob471:
  8531                                  .doglob466:
  8532                                  .doglob463:
  8533                                  
  8534                                  ;-980   }else { //expect('=');
  8535                                  
  8536 00003B2F E99E00                   jmp .doglob472
  8537                                  .doglob456:
  8538                                  
  8539                                  ;-981     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8540                                  
  8541 00003B32 68[163D]                 push doglob_14
  8542 00003B35 E8B0C8                   call prs
  8543 00003B38 83C402                   add  sp, 2
  8544 00003B3B 8D06BB69                 lea  ax, [symbol]
  8545 00003B3F 50                       push ax
  8546 00003B40 E8A5C8                   call prs
  8547 00003B43 83C402                   add  sp, 2
  8548 00003B46 A0[3000]                 mov al, [istype]
  8549 00003B49 3C2A                     cmp al, 42
  8550 00003B4B 0F850C00                 jne .doglob473
  8551 00003B4F 68[193D]                 push doglob_15
  8552 00003B52 E893C8                   call prs
  8553 00003B55 83C402                   add  sp, 2
  8554                                  
  8555                                  ;-982     else {
  8556                                  
  8557 00003B58 E93300                   jmp .doglob474
  8558                                  .doglob473:
  8559                                  
  8560                                  ;-983       if      (iswidth==1) prs(" db ");
  8561                                  
  8562 00003B5B A0[3600]                 mov al, [iswidth]
  8563 00003B5E 3C01                     cmp al, 1
  8564 00003B60 0F850C00                 jne .doglob475
  8565 00003B64 68[1E3D]                 push doglob_16
  8566 00003B67 E87EC8                   call prs
  8567 00003B6A 83C402                   add  sp, 2
  8568                                  
  8569                                  ;-984       else if (iswidth==2) prs(" dw ");
  8570                                  
  8571 00003B6D E91E00                   jmp .doglob476
  8572                                  .doglob475:
  8573 00003B70 A0[3600]                 mov al, [iswidth]
  8574 00003B73 3C02                     cmp al, 2
  8575 00003B75 0F850C00                 jne .doglob477
  8576 00003B79 68[233D]                 push doglob_17
  8577 00003B7C E869C8                   call prs
  8578 00003B7F 83C402                   add  sp, 2
  8579                                  
  8580                                  ;-985       else                 prs(" dd ");
  8581                                  
  8582 00003B82 E90900                   jmp .doglob478
  8583                                  .doglob477:
  8584 00003B85 68[283D]                 push doglob_18
  8585 00003B88 E85DC8                   call prs
  8586 00003B8B 83C402                   add  sp, 2
  8587                                  
  8588                                  ;-986     }
  8589                                  
  8590                                  .doglob478:
  8591                                  .doglob476:
  8592                                  
  8593                                  ;-987     if(istoken('-')) prc('-');
  8594                                  
  8595                                  .doglob474:
  8596 00003B8E 6A2D                     push 45
  8597 00003B90 E830D3                   call istoken
  8598 00003B93 83C402                   add  sp, 2
  8599 00003B96 08C0                     or  al, al
  8600 00003B98 0F840800                 je .doglob479
  8601 00003B9C 6A2D                     push 45
  8602 00003B9E E8EEC7                   call prc
  8603 00003BA1 83C402                   add  sp, 2
  8604                                  
  8605                                  ;-988     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8606                                  
  8607                                  .doglob479:
  8608 00003BA4 6A3D                     push 61
  8609 00003BA6 E81AD3                   call istoken
  8610 00003BA9 83C402                   add  sp, 2
  8611 00003BAC 08C0                     or  al, al
  8612 00003BAE 0F841600                 je .doglob480
  8613 00003BB2 680101                   push 257
  8614 00003BB5 E82DD3                   call expect
  8615 00003BB8 83C402                   add  sp, 2
  8616 00003BBB FF36[2C00]               push word [lexval]
  8617 00003BBF E889C9                   call prunsign1
  8618 00003BC2 83C402                   add  sp, 2
  8619                                  
  8620                                  ;-989     else prunsign1(0); }
  8621                                  
  8622 00003BC5 E90800                   jmp .doglob481
  8623                                  .doglob480:
  8624 00003BC8 6A00                     push 0
  8625 00003BCA E87EC9                   call prunsign1
  8626 00003BCD 83C402                   add  sp, 2
  8627                                  .doglob481:
  8628                                  
  8629                                  ;-990   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8630                                  
  8631                                  .doglob472:
  8632 00003BD0 A0[3300]                 mov al, [issign]
  8633 00003BD3 8B1E[3900]               mov bx, [GTop]
  8634 00003BD7 8887306C                 mov [GSign+bx], al
  8635 00003BDB A0[3600]                 mov al, [iswidth]
  8636 00003BDE 8B1E[3900]               mov bx, [GTop]
  8637 00003BE2 88875C6D                 mov [GWidth+bx], al
  8638 00003BE6 A0[3000]                 mov al, [istype]
  8639 00003BE9 8B1E[3900]               mov bx, [GTop]
  8640 00003BED 8887046B                 mov [GType+bx], al
  8641                                  
  8642                                  ;-991   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  8643                                  
  8644 00003BF1 A1[4900]                 mov ax, [lineno]
  8645 00003BF4 83E801                   sub ax, 1
  8646 00003BF7 8B1E[3900]               mov bx, [GTop]
  8647 00003BFB D1E3                     shl bx, 1
  8648 00003BFD 8987886E                 mov [GAdr+bx], ax
  8649 00003C01 B80000                   mov ax, 0
  8650 00003C04 8B1E[3900]               mov bx, [GTop]
  8651 00003C08 D1E3                     shl bx, 1
  8652 00003C0A 8987E070                 mov [GUsed+bx], ax
  8653                                  
  8654                                  ;-992   pt=adrofname(GTop);
  8655                                  
  8656 00003C0E FF36[3900]               push word [GTop]
  8657 00003C12 E847D3                   call adrofname
  8658 00003C15 83C402                   add  sp, 2
  8659 00003C18 A3[4B00]                 mov word [pt], ax
  8660                                  
  8661                                  ;-993   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8662                                  
  8663 00003C1B 8B46FA                   mov ax, [bp-6]
  8664 00003C1E 08C0                     or  al, al
  8665 00003C20 0F841200                 je .doglob482
  8666 00003C24 8D06AEDA                 lea  ax, [doglobName]
  8667 00003C28 50                       push ax
  8668 00003C29 FF36[4B00]               push word [pt]
  8669 00003C2D E802C6                   call strcpy
  8670 00003C30 83C404                   add  sp, 4
  8671 00003C33 E90F00                   jmp .doglob483
  8672                                  .doglob482:
  8673 00003C36 8D06BB69                 lea  ax, [symbol]
  8674 00003C3A 50                       push ax
  8675 00003C3B FF36[4B00]               push word [pt]
  8676 00003C3F E8F0C5                   call strcpy
  8677 00003C42 83C404                   add  sp, 4
  8678                                  
  8679                                  ;-994   GTop++; expect(';'); }
  8680                                  
  8681                                  .doglob483:
  8682 00003C45 FF06[3900]               inc  word[GTop]
  8683 00003C49 6A3B                     push 59
  8684 00003C4B E897D2                   call expect
  8685 00003C4E 83C402                   add  sp, 2
  8686                                  
  8687                                  ;-995 
  8688                                  
  8689                                  
  8690                                  ;-996 unsigned int MAXUI=65535;
  8691 00003C51 C9                       LEAVE
  8692 00003C52 C3                       ret
  8693 00003C53 476C6F62616C207461-     doglob_0 db "Global table full",0
  8694 00003C5C 626C652066756C6C00 
  8695 00003C65 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8696 00003C6E 732076617220747970-
  8697 00003C77 6500               
  8698 00003C79 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8699 00003C82 616C72656164792064-
  8700 00003C8B 6566696E656400     
  8701 00003C92 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8702 00003C9B 202E6273735C6E6162-
  8703 00003CA4 736F6C7574652000   
  8704 00003CAC 5C6E00                  doglob_4 db "\n",0
  8705 00003CAF 20726573622000          doglob_5 db " resb ",0
  8706 00003CB6 20726573772000          doglob_6 db " resw ",0
  8707 00003CBD 20726573642000          doglob_7 db " resd ",0
  8708 00003CC4 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8709 00003CCD 202E7465787400     
  8710 00003CD4 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8711 00003CDD 417272617920616C6C-
  8712 00003CE6 6F77656400         
  8713 00003CEB 5C6E00                  doglob_10 db "\n",0
  8714 00003CEE 2064622000              doglob_11 db " db ",0
  8715 00003CF3 2C3000                  doglob_12 db ",0",0
  8716 00003CF6 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8717 00003CFF 206E756D6265722061-
  8718 00003D08 727261792065787065-
  8719 00003D11 6374656400         
  8720 00003D16 5C6E00                  doglob_14 db "\n",0
  8721 00003D19 2064772000              doglob_15 db " dw ",0
  8722 00003D1E 2064622000              doglob_16 db " db ",0
  8723 00003D23 2064772000              doglob_17 db " dw ",0
  8724 00003D28 2064642000              doglob_18 db " dd ",0
  8725                                  ENDP
  8726 00003D2D FFFF                    MAXUI dw 65535
  8727                                  
  8728                                  ;-997 int epilog() {
  8729                                  
  8730                                  
  8731                                  epilog: PROC
  8732                                  
  8733                                  ;-998     unsigned int i;
  8734                                  
  8735                                  
  8736                                  ;-999     prs("\n;Input: "); prs(&namein);
  8737                                  ;
  8738 00003D2F C8020000                 ENTER  2,0
  8739 00003D33 68[A33E]                 push epilog_0
  8740 00003D36 E8AFC6                   call prs
  8741 00003D39 83C402                   add  sp, 2
  8742 00003D3C 8D067E6A                 lea  ax, [namein]
  8743 00003D40 50                       push ax
  8744 00003D41 E8A4C6                   call prs
  8745 00003D44 83C402                   add  sp, 2
  8746                                  
  8747                                  ;-1000     prs(", List: ");   prs(&namelst);
  8748                                  
  8749 00003D47 68[AE3E]                 push epilog_1
  8750 00003D4A E89BC6                   call prs
  8751 00003D4D 83C402                   add  sp, 2
  8752 00003D50 8D06C16A                 lea  ax, [namelst]
  8753 00003D54 50                       push ax
  8754 00003D55 E890C6                   call prs
  8755 00003D58 83C402                   add  sp, 2
  8756                                  
  8757                                  ;-1001     prs(",  Lines:"); printint51(lineno);
  8758                                  
  8759 00003D5B 68[B73E]                 push epilog_2
  8760 00003D5E E887C6                   call prs
  8761 00003D61 83C402                   add  sp, 2
  8762 00003D64 FF36[4900]               push word [lineno]
  8763 00003D68 E824C8                   call printint51
  8764 00003D6B 83C402                   add  sp, 2
  8765                                  
  8766                                  ;-1002     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  8767                                  
  8768 00003D6E 68[C13E]                 push epilog_3
  8769 00003D71 E874C6                   call prs
  8770 00003D74 83C402                   add  sp, 2
  8771 00003D77 FF0E[3900]               dec  word[GTop]
  8772 00003D7B FF36[3900]               push word [GTop]
  8773 00003D7F E80DC8                   call printint51
  8774 00003D82 83C402                   add  sp, 2
  8775                                  
  8776                                  ;-1003     prs(" max.:"); printint51(LSTART);
  8777                                  
  8778 00003D85 68[D53E]                 push epilog_4
  8779 00003D88 E85DC6                   call prs
  8780 00003D8B 83C402                   add  sp, 2
  8781 00003D8E 68C800                   push 200
  8782 00003D91 E8FBC7                   call printint51
  8783 00003D94 83C402                   add  sp, 2
  8784                                  
  8785                                  ;-1004     prs("\n;Functions      :"); printint51(FTop);
  8786                                  
  8787 00003D97 68[DC3E]                 push epilog_5
  8788 00003D9A E84BC6                   call prs
  8789 00003D9D 83C402                   add  sp, 2
  8790 00003DA0 FF36[3D00]               push word [FTop]
  8791 00003DA4 E8E8C7                   call printint51
  8792 00003DA7 83C402                   add  sp, 2
  8793                                  
  8794                                  ;-1005     prs(" max.:"); printint51(FUNCMAX);
  8795                                  
  8796 00003DAA 68[F03E]                 push epilog_6
  8797 00003DAD E838C6                   call prs
  8798 00003DB0 83C402                   add  sp, 2
  8799 00003DB3 682C01                   push 300
  8800 00003DB6 E8D6C7                   call printint51
  8801 00003DB9 83C402                   add  sp, 2
  8802                                  
  8803                                  ;-1006     prs("\n;Calls          :"); printint51(CTop);
  8804                                  
  8805 00003DBC 68[F73E]                 push epilog_7
  8806 00003DBF E826C6                   call prs
  8807 00003DC2 83C402                   add  sp, 2
  8808 00003DC5 FF36[4300]               push word [CTop]
  8809 00003DC9 E8C3C7                   call printint51
  8810 00003DCC 83C402                   add  sp, 2
  8811                                  
  8812                                  ;-1007     prs(" max.:"); printint51(CALLMAX);
  8813                                  
  8814 00003DCF 68[0B3F]                 push epilog_8
  8815 00003DD2 E813C6                   call prs
  8816 00003DD5 83C402                   add  sp, 2
  8817 00003DD8 68DC05                   push 1500
  8818 00003DDB E8B1C7                   call printint51
  8819 00003DDE 83C402                   add  sp, 2
  8820                                  
  8821                                  ;-1008     i = CNamePtr - &CNameField;
  8822                                  
  8823 00003DE1 A1[3F00]                 mov ax, [CNamePtr]
  8824 00003DE4 2D80B2                   sub ax, CNameField
  8825 00003DE7 8946FE                   mov [bp-2], ax
  8826                                  
  8827                                  ;-1009     prs("\n;NameField      :"); printint51(i);
  8828                                  
  8829 00003DEA 68[123F]                 push epilog_9
  8830 00003DED E8F8C5                   call prs
  8831 00003DF0 83C402                   add  sp, 2
  8832 00003DF3 FF76FE                   push word [bp-2]
  8833 00003DF6 E896C7                   call printint51
  8834 00003DF9 83C402                   add  sp, 2
  8835                                  
  8836                                  ;-1010     prs(" max.:"); printint51(CNAMEMAX);
  8837                                  
  8838 00003DFC 68[263F]                 push epilog_10
  8839 00003DFF E8E6C5                   call prs
  8840 00003E02 83C402                   add  sp, 2
  8841 00003E05 681027                   push 10000
  8842 00003E08 E884C7                   call printint51
  8843 00003E0B 83C402                   add  sp, 2
  8844                                  
  8845                                  ;-1011     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
  8846                                  
  8847 00003E0E 68[2D3F]                 push epilog_11
  8848 00003E11 E8D4C5                   call prs
  8849 00003E14 83C402                   add  sp, 2
  8850 00003E17 8D067869                 lea  ax, [coname]
  8851 00003E1B 50                       push ax
  8852 00003E1C E8C9C5                   call prs
  8853 00003E1F 83C402                   add  sp, 2
  8854 00003E22 68[3B3F]                 push epilog_12
  8855 00003E25 E8C0C5                   call prs
  8856 00003E28 83C402                   add  sp, 2
  8857 00003E2B FF36[1400]               push word [maxco]
  8858 00003E2F E85DC7                   call printint51
  8859 00003E32 83C402                   add  sp, 2
  8860                                  
  8861                                  ;-1012     prs(" max.:"); printint51(COMAX);
  8862                                  
  8863 00003E35 68[3F3F]                 push epilog_13
  8864 00003E38 E8ADC5                   call prs
  8865 00003E3B 83C402                   add  sp, 2
  8866 00003E3E 68D007                   push 2000
  8867 00003E41 E84BC7                   call printint51
  8868 00003E44 83C402                   add  sp, 2
  8869                                  
  8870                                  ;-1013     i=COMAX; i=i-maxco;
  8871                                  
  8872 00003E47 B8D007                   mov ax, 2000
  8873 00003E4A 8946FE                   mov [bp-2], ax
  8874 00003E4D 8B46FE                   mov ax, [bp-2]
  8875 00003E50 2B06[1400]               sub ax, [maxco]
  8876 00003E54 8946FE                   mov [bp-2], ax
  8877                                  
  8878                                  ;-1014     if (i <= 1000)prs(" *** Warning *** constant area too small");
  8879                                  
  8880 00003E57 8B46FE                   mov ax, [bp-2]
  8881 00003E5A 3DE803                   cmp ax, 1000
  8882 00003E5D 0F870900                 ja  .epilog484
  8883 00003E61 68[463F]                 push epilog_14
  8884 00003E64 E881C5                   call prs
  8885 00003E67 83C402                   add  sp, 2
  8886                                  
  8887                                  ;-1015     prs(", stacksize: ");
  8888                                  
  8889                                  .epilog484:
  8890 00003E6A 68[6F3F]                 push epilog_15
  8891 00003E6D E878C5                   call prs
  8892 00003E70 83C402                   add  sp, 2
  8893                                  
  8894                                  ;-1016     i=MAXUI-orgData; printint51(i);
  8895                                  
  8896 00003E73 A1[2D3D]                 mov ax, [MAXUI]
  8897 00003E76 2B06[1200]               sub ax, [orgData]
  8898 00003E7A 8946FE                   mov [bp-2], ax
  8899 00003E7D FF76FE                   push word [bp-2]
  8900 00003E80 E80CC7                   call printint51
  8901 00003E83 83C402                   add  sp, 2
  8902                                  
  8903                                  ;-1017     if (i <= 1000) prs(" *** Warning *** Stack too small");
  8904                                  
  8905 00003E86 8B46FE                   mov ax, [bp-2]
  8906 00003E89 3DE803                   cmp ax, 1000
  8907 00003E8C 0F870900                 ja  .epilog485
  8908 00003E90 68[7D3F]                 push epilog_16
  8909 00003E93 E852C5                   call prs
  8910 00003E96 83C402                   add  sp, 2
  8911                                  
  8912                                  ;-1018   end1(0);}
  8913                                  
  8914                                  .epilog485:
  8915 00003E99 6A00                     push 0
  8916 00003E9B E848C7                   call end1
  8917 00003E9E 83C402                   add  sp, 2
  8918                                  
  8919                                  ;-1019 
  8920                                  
  8921                                  
  8922                                  ;-1020 int dodefine() {
  8923 00003EA1 C9                       LEAVE
  8924 00003EA2 C3                       ret
  8925 00003EA3 5C6E3B496E7075743A-     epilog_0 db "\n;Input: ",0
  8926 00003EAC 2000               
  8927 00003EAE 2C204C6973743A2000      epilog_1 db ", List: ",0
  8928 00003EB7 2C20204C696E65733A-     epilog_2 db ",  Lines:",0
  8929 00003EC0 00                 
  8930 00003EC1 5C6E3B476C6F622E20-     epilog_3 db "\n;Glob. variables:",0
  8931 00003ECA 7661726961626C6573-
  8932 00003ED3 3A00               
  8933 00003ED5 206D61782E3A00          epilog_4 db " max.:",0
  8934 00003EDC 5C6E3B46756E637469-     epilog_5 db "\n;Functions      :",0
  8935 00003EE5 6F6E73202020202020-
  8936 00003EEE 3A00               
  8937 00003EF0 206D61782E3A00          epilog_6 db " max.:",0
  8938 00003EF7 5C6E3B43616C6C7320-     epilog_7 db "\n;Calls          :",0
  8939 00003F00 202020202020202020-
  8940 00003F09 3A00               
  8941 00003F0B 206D61782E3A00          epilog_8 db " max.:",0
  8942 00003F12 5C6E3B4E616D654669-     epilog_9 db "\n;NameField      :",0
  8943 00003F1B 656C64202020202020-
  8944 00003F24 3A00               
  8945 00003F26 206D61782E3A00          epilog_10 db " max.:",0
  8946 00003F2D 5C6E3B436F6E737420-     epilog_11 db "\n;Const in '",0
  8947 00003F36 696E202700         
  8948 00003F3B 27203A00                epilog_12 db "' :",0
  8949 00003F3F 206D61782E3A00          epilog_13 db " max.:",0
  8950 00003F46 202A2A2A205761726E-     epilog_14 db " *** Warning *** constant area too small",0
  8951 00003F4F 696E67202A2A2A2063-
  8952 00003F58 6F6E7374616E742061-
  8953 00003F61 72656120746F6F2073-
  8954 00003F6A 6D616C6C00         
  8955 00003F6F 2C20737461636B7369-     epilog_15 db ", stacksize: ",0
  8956 00003F78 7A653A2000         
  8957 00003F7D 202A2A2A205761726E-     epilog_16 db " *** Warning *** Stack too small",0
  8958 00003F86 696E67202A2A2A2053-
  8959 00003F8F 7461636B20746F6F20-
  8960 00003F98 736D616C6C00       
  8961                                  ENDP
  8962                                  
  8963                                  dodefine: PROC
  8964                                  
  8965                                  ;-1021     int i; int j; int fdtemp;
  8966                                  
  8967                                  
  8968                                  ;-1022     if (eqstr(symbol, "ORGDATA")) {
  8969                                  ;
  8970 00003F9E C8060000                 ENTER  6,0
  8971 00003FA2 68[8840]                 push dodefine_0
  8972 00003FA5 8D06BB69                 lea  ax, [symbol]
  8973 00003FA9 50                       push ax
  8974 00003FAA E8BBC2                   call eqstr
  8975 00003FAD 83C404                   add  sp, 4
  8976 00003FB0 08C0                     or  al, al
  8977 00003FB2 0F841500                 je .dodefine486
  8978                                  
  8979                                  ;-1023         token=getlex();
  8980                                  
  8981 00003FB6 E88BC9                   call getlex
  8982 00003FB9 A3[1E00]                 mov word [token], ax
  8983                                  
  8984                                  ;-1024         ORGDATAORIG=lexval;
  8985                                  
  8986 00003FBC A1[2C00]                 mov ax, [lexval]
  8987 00003FBF A3[1000]                 mov word [ORGDATAORIG], ax
  8988                                  
  8989                                  ;-1025         orgData=lexval;
  8990                                  
  8991 00003FC2 A1[2C00]                 mov ax, [lexval]
  8992 00003FC5 A3[1200]                 mov word [orgData], ax
  8993                                  
  8994                                  ;-1026         return;
  8995                                  
  8996 00003FC8 E9BB00                   jmp .retndodefine
  8997                                  
  8998                                  ;-1027     }
  8999                                  
  9000                                  
  9001                                  ;-1028     expect(T_NAME);
  9002                                  
  9003                                  .dodefine486:
  9004 00003FCB 680001                   push 256
  9005 00003FCE E814CF                   call expect
  9006 00003FD1 83C402                   add  sp, 2
  9007                                  
  9008                                  ;-1029     if (token==T_CONST) {
  9009                                  
  9010 00003FD4 A1[1E00]                 mov ax, [token]
  9011 00003FD7 3D0101                   cmp ax, 257
  9012 00003FDA 0F85A800                 jne .dodefine487
  9013                                  
  9014                                  ;-1030         if (GTop >= LSTART) error1("global table (define) full");
  9015                                  
  9016 00003FDE A1[3900]                 mov ax, [GTop]
  9017 00003FE1 3DC800                   cmp ax, 200 ;unsigned : 1
  9018 00003FE4 0F8C0900                 jl  .dodefine488
  9019 00003FE8 68[9040]                 push dodefine_1
  9020 00003FEB E81BC6                   call error1
  9021 00003FEE 83C402                   add  sp, 2
  9022                                  
  9023                                  ;-1031         i=strlen(symbol);
  9024                                  
  9025                                  .dodefine488:
  9026 00003FF1 8D06BB69                 lea  ax, [symbol]
  9027 00003FF5 50                       push ax
  9028 00003FF6 E811C2                   call strlen
  9029 00003FF9 83C402                   add  sp, 2
  9030 00003FFC 8946FE                   mov [bp-2], ax
  9031                                  
  9032                                  ;-1032         if (i>15) error1("Define name longer 15 char");
  9033                                  
  9034 00003FFF 8B46FE                   mov ax, [bp-2]
  9035 00004002 83F80F                   cmp ax, 15
  9036 00004005 0F8E0900                 jle .dodefine489
  9037 00004009 68[AB40]                 push dodefine_2
  9038 0000400C E8FAC5                   call error1
  9039 0000400F 83C402                   add  sp, 2
  9040                                  
  9041                                  ;-1033         GSign [GTop]='U';
  9042                                  
  9043                                  .dodefine489:
  9044 00004012 B85500                   mov ax, 85
  9045 00004015 8B1E[3900]               mov bx, [GTop]
  9046 00004019 8887306C                 mov [GSign+bx], al
  9047                                  
  9048                                  ;-1034         GWidth[GTop]=1;
  9049                                  
  9050 0000401D B80100                   mov ax, 1
  9051 00004020 8B1E[3900]               mov bx, [GTop]
  9052 00004024 88875C6D                 mov [GWidth+bx], al
  9053                                  
  9054                                  ;-1035         GType [GTop]='#';
  9055                                  
  9056 00004028 B82300                   mov ax, 35
  9057 0000402B 8B1E[3900]               mov bx, [GTop]
  9058 0000402F 8887046B                 mov [GType+bx], al
  9059                                  
  9060                                  ;-1036         GAdr [GTop]=lineno-1;
  9061                                  
  9062 00004033 A1[4900]                 mov ax, [lineno]
  9063 00004036 83E801                   sub ax, 1
  9064 00004039 8B1E[3900]               mov bx, [GTop]
  9065 0000403D D1E3                     shl bx, 1
  9066 0000403F 8987886E                 mov [GAdr+bx], ax
  9067                                  
  9068                                  ;-1037         GUsed [GTop]=0;
  9069                                  
  9070 00004043 B80000                   mov ax, 0
  9071 00004046 8B1E[3900]               mov bx, [GTop]
  9072 0000404A D1E3                     shl bx, 1
  9073 0000404C 8987E070                 mov [GUsed+bx], ax
  9074                                  
  9075                                  ;-1038         pt=adrofname(GTop);
  9076                                  
  9077 00004050 FF36[3900]               push word [GTop]
  9078 00004054 E805CF                   call adrofname
  9079 00004057 83C402                   add  sp, 2
  9080 0000405A A3[4B00]                 mov word [pt], ax
  9081                                  
  9082                                  ;-1039         strcpy(pt, symbol);
  9083                                  
  9084 0000405D 8D06BB69                 lea  ax, [symbol]
  9085 00004061 50                       push ax
  9086 00004062 FF36[4B00]               push word [pt]
  9087 00004066 E8C9C1                   call strcpy
  9088 00004069 83C404                   add  sp, 4
  9089                                  
  9090                                  ;-1040         GData[GTop]=lexval;
  9091                                  
  9092 0000406C A1[2C00]                 mov ax, [lexval]
  9093 0000406F 8B1E[3900]               mov bx, [GTop]
  9094 00004073 D1E3                     shl bx, 1
  9095 00004075 89873873                 mov [GData+bx], ax
  9096                                  
  9097                                  ;-1041         expect(T_CONST);
  9098                                  
  9099 00004079 680101                   push 257
  9100 0000407C E866CE                   call expect
  9101 0000407F 83C402                   add  sp, 2
  9102                                  
  9103                                  ;-1042         GTop++;
  9104                                  
  9105 00004082 FF06[3900]               inc  word[GTop]
  9106                                  
  9107                                  ;-1043     }
  9108                                  
  9109                                  
  9110                                  ;-1044 }
  9111                                  
  9112                                  .dodefine487:
  9113                                  
  9114                                  ;-1045 
  9115                                  
  9116                                  
  9117                                  ;-1046 int parse() {
  9118                                  
  9119 00004086 C9                       .retndodefine: LEAVE
  9120 00004087 C3                       ret
  9121 00004088 4F52474441544100        dodefine_0 db "ORGDATA",0
  9122 00004090 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  9123 00004099 626C65202864656669-
  9124 000040A2 6E65292066756C6C00 
  9125 000040AB 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  9126 000040B4 6D65206C6F6E676572-
  9127 000040BD 203135206368617200 
  9128                                  ENDP
  9129                                  
  9130                                  parse: PROC
  9131                                  
  9132                                  ;-1047     CNamePtr = &CNameField;
  9133                                  
  9134 000040C6 B880B2                   mov ax, CNameField
  9135 000040C9 A3[3F00]                 mov word [CNamePtr], ax
  9136                                  
  9137                                  ;-1048     token=getlex();
  9138                                  
  9139 000040CC E875C8                   call getlex
  9140 000040CF A3[1E00]                 mov word [token], ax
  9141                                  
  9142                                  ;-1049     do {
  9143                                  
  9144                                  .parse490:
  9145                                  
  9146                                  ;-1050         if (token <= 0) return 1;
  9147                                  
  9148 000040D2 A1[1E00]                 mov ax, [token]
  9149 000040D5 83F800                   cmp ax, 0
  9150 000040D8 0F8F0600                 jg  .parse491
  9151 000040DC B80100                   mov ax, 1
  9152 000040DF E95000                   jmp .retnparse
  9153                                  
  9154                                  ;-1051         if (istoken('#')) {
  9155                                  
  9156                                  .parse491:
  9157 000040E2 6A23                     push 35
  9158 000040E4 E8DCCD                   call istoken
  9159 000040E7 83C402                   add  sp, 2
  9160 000040EA 08C0                     or  al, al
  9161 000040EC 0F842100                 je .parse492
  9162                                  
  9163                                  ;-1052              if (istoken(T_DEFINE))  dodefine();
  9164                                  
  9165 000040F0 68FF01                   push 511
  9166 000040F3 E8CDCD                   call istoken
  9167 000040F6 83C402                   add  sp, 2
  9168 000040F9 08C0                     or  al, al
  9169 000040FB 0F840600                 je .parse493
  9170 000040FF E89CFE                   call dodefine
  9171                                  
  9172                                  ;-1053              else error1("define expected");
  9173                                  
  9174 00004102 E90900                   jmp .parse494
  9175                                  .parse493:
  9176 00004105 68[3341]                 push parse_0
  9177 00004108 E8FEC4                   call error1
  9178 0000410B 83C402                   add  sp, 2
  9179                                  
  9180                                  ;-1054         }
  9181                                  
  9182                                  .parse494:
  9183                                  
  9184                                  ;-1055     else{
  9185                                  
  9186 0000410E E91600                   jmp .parse495
  9187                                  .parse492:
  9188                                  
  9189                                  ;-1056         typeName();
  9190                                  
  9191 00004111 E8A6D0                   call typeName
  9192                                  
  9193                                  ;-1057         if (token=='(') dofunc();
  9194                                  
  9195 00004114 A1[1E00]                 mov ax, [token]
  9196 00004117 83F828                   cmp ax, 40
  9197 0000411A 0F850600                 jne .parse496
  9198 0000411E E844F5                   call dofunc
  9199                                  
  9200                                  ;-1058         else doglob(); }
  9201                                  
  9202 00004121 E90300                   jmp .parse497
  9203                                  .parse496:
  9204 00004124 E8D7F7                   call doglob
  9205                                  .parse497:
  9206                                  
  9207                                  ;-1059     } while(1);
  9208                                  
  9209                                  .parse495:
  9210 00004127 B80100                   mov ax, 1
  9211 0000412A 08C0                     or  al, al
  9212 0000412C 0F840200                 je .parse498
  9213 00004130 EBA0                     jmp .parse490
  9214                                  .parse498:
  9215                                  
  9216                                  ;-1060 }
  9217                                  
  9218                                  
  9219                                  ;-1061 
  9220                                  
  9221                                  
  9222                                  ;-1062 int getfirstchar() {
  9223                                  
  9224                                   .retnparse:
  9225 00004132 C3                       ret
  9226 00004133 646566696E65206578-     parse_0 db "define expected",0
  9227 0000413C 70656374656400     
  9228                                  ENDP
  9229                                  
  9230                                  getfirstchar: PROC
  9231                                  
  9232                                  ;-1063     fgetsp=&fgetsdest;
  9233                                  
  9234 00004143 B8A0D9                   mov ax, fgetsdest
  9235 00004146 A3[4500]                 mov word [fgetsp], ax
  9236                                  
  9237                                  ;-1064     *fgetsp=0;
  9238                                  
  9239 00004149 B80000                   mov ax, 0
  9240 0000414C 8B1E[4500]               mov  bx, [fgetsp]
  9241 00004150 8807                     mov  [bx], al
  9242                                  
  9243                                  ;-1065     thechar=fgets1();
  9244                                  
  9245 00004152 E872C6                   call fgets1
  9246 00004155 A2[2300]                 mov byte [thechar], al
  9247                                  
  9248                                  ;-1066     }
  9249                                  
  9250                                  
  9251                                  ;-1067 
  9252                                  
  9253                                  
  9254                                  ;-1068 char *arglen=0x80; char *argv=0x82;
  9255                                  
  9256 00004158 C3                       ret
  9257                                  ENDP
  9258 00004159 8000                    arglen dw 128
  9259 0000415B 8200                    argv dw 130
  9260                                  
  9261                                  ;-1069 int getarg() {
  9262                                  
  9263                                  
  9264                                  getarg: PROC
  9265                                  
  9266                                  ;-1070     int arglen1; int i; char *c;
  9267                                  
  9268                                  
  9269                                  ;-1071     arglen1=*arglen;
  9270                                  ;
  9271 0000415D C8060000                 ENTER  6,0
  9272 00004161 8B1E[5941]               mov bx, [arglen]
  9273 00004165 8A07                     mov al, [bx]
  9274 00004167 B400                     mov ah, 0
  9275 00004169 8946FE                   mov [bp-2], ax
  9276                                  
  9277                                  ;-1072     if (arglen1 == 0) {
  9278                                  
  9279 0000416C 8B46FE                   mov ax, [bp-2]
  9280 0000416F 83F800                   cmp ax, 0
  9281 00004172 0F851C00                 jne .getarg499
  9282                                  
  9283                                  ;-1073         cputs(Version1);
  9284                                  
  9285 00004176 8D06[0300]               lea  ax, [Version1]
  9286 0000417A 50                       push ax
  9287 0000417B E8FEBE                   call cputs
  9288 0000417E 83C402                   add  sp, 2
  9289                                  
  9290                                  ;-1074         cputs(" Usage: A.COM in_file[.C]: ");
  9291                                  
  9292 00004181 68[C042]                 push getarg_0
  9293 00004184 E8F5BE                   call cputs
  9294 00004187 83C402                   add  sp, 2
  9295                                  
  9296                                  ;-1075         exitR(3);
  9297                                  
  9298 0000418A 6A03                     push 3
  9299 0000418C E85FBF                   call exitR
  9300 0000418F 83C402                   add  sp, 2
  9301                                  
  9302                                  ;-1076         }
  9303                                  
  9304                                  
  9305                                  ;-1077     i=arglen1+129;
  9306                                  
  9307                                  .getarg499:
  9308 00004192 8B46FE                   mov ax, [bp-2]
  9309 00004195 058100                   add ax, 129
  9310 00004198 8946FC                   mov [bp-4], ax
  9311                                  
  9312                                  ;-1078     *i=0;
  9313                                  
  9314 0000419B B80000                   mov ax, 0
  9315 0000419E 8B5EFC                   mov  bx, [bp-4]
  9316 000041A1 8907                     mov  [bx], ax
  9317                                  
  9318                                  ;-1079     arglen1--;
  9319                                  
  9320 000041A3 FF4EFE                   dec  word[bp-2]
  9321                                  
  9322                                  ;-1080     toupper(argv);
  9323                                  
  9324 000041A6 FF36[5B41]               push word [argv]
  9325 000041AA E82CC1                   call toupper
  9326 000041AD 83C402                   add  sp, 2
  9327                                  
  9328                                  ;-1081     strcpy(namein, argv);
  9329                                  
  9330 000041B0 FF36[5B41]               push word [argv]
  9331 000041B4 8D067E6A                 lea  ax, [namein]
  9332 000041B8 50                       push ax
  9333 000041B9 E876C0                   call strcpy
  9334 000041BC 83C404                   add  sp, 4
  9335                                  
  9336                                  ;-1082     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9337                                  
  9338 000041BF 6A2E                     push 46
  9339 000041C1 8D067E6A                 lea  ax, [namein]
  9340 000041C5 50                       push ax
  9341 000041C6 E853C1                   call instr1
  9342 000041C9 83C404                   add  sp, 4
  9343 000041CC 83F800                   cmp ax, 0
  9344 000041CF 0F850E00                 jne .getarg500
  9345 000041D3 68[DC42]                 push getarg_1
  9346 000041D6 8D067E6A                 lea  ax, [namein]
  9347 000041DA 50                       push ax
  9348 000041DB E8D6C0                   call strcat1
  9349 000041DE 83C404                   add  sp, 4
  9350                                  
  9351                                  ;-1083     strcpy(namelst, namein);
  9352                                  
  9353                                  .getarg500:
  9354 000041E1 8D067E6A                 lea  ax, [namein]
  9355 000041E5 50                       push ax
  9356 000041E6 8D06C16A                 lea  ax, [namelst]
  9357 000041EA 50                       push ax
  9358 000041EB E844C0                   call strcpy
  9359 000041EE 83C404                   add  sp, 4
  9360                                  
  9361                                  ;-1084     i=strlen(namelst);
  9362                                  
  9363 000041F1 8D06C16A                 lea  ax, [namelst]
  9364 000041F5 50                       push ax
  9365 000041F6 E811C0                   call strlen
  9366 000041F9 83C402                   add  sp, 2
  9367 000041FC 8946FC                   mov [bp-4], ax
  9368                                  
  9369                                  ;-1085     i--;
  9370                                  
  9371 000041FF FF4EFC                   dec  word[bp-4]
  9372                                  
  9373                                  ;-1086     c=&namelst+i;
  9374                                  
  9375 00004202 B8C16A                   mov ax, namelst
  9376 00004205 0346FC                   add ax, [bp-4]
  9377 00004208 8946FA                   mov [bp-6], ax
  9378                                  
  9379                                  ;-1087     *c='S';
  9380                                  
  9381 0000420B B85300                   mov ax, 83
  9382 0000420E 8B5EFA                   mov  bx, [bp-6]
  9383 00004211 8807                     mov  [bx], al
  9384                                  
  9385                                  ;-1088 
  9386                                  
  9387                                  
  9388                                  ;-1089     fdin=openR (namein);
  9389                                  
  9390 00004213 8D067E6A                 lea  ax, [namein]
  9391 00004217 50                       push ax
  9392 00004218 E8A3BE                   call openR
  9393 0000421B 83C402                   add  sp, 2
  9394 0000421E A3[1A00]                 mov word [fdin], ax
  9395                                  
  9396                                  ;-1090     if(DOS_ERR){
  9397                                  
  9398 00004221 A1[4F00]                 mov ax, [DOS_ERR]
  9399 00004224 08C0                     or  al, al
  9400 00004226 0F841C00                 je .getarg501
  9401                                  
  9402                                  ;-1091         cputs("Source file missing (.C): ");
  9403                                  
  9404 0000422A 68[DF42]                 push getarg_2
  9405 0000422D E84CBE                   call cputs
  9406 00004230 83C402                   add  sp, 2
  9407                                  
  9408                                  ;-1092         cputs(namein);
  9409                                  
  9410 00004233 8D067E6A                 lea  ax, [namein]
  9411 00004237 50                       push ax
  9412 00004238 E841BE                   call cputs
  9413 0000423B 83C402                   add  sp, 2
  9414                                  
  9415                                  ;-1093         exitR(1);
  9416                                  
  9417 0000423E 6A01                     push 1
  9418 00004240 E8ABBE                   call exitR
  9419 00004243 83C402                   add  sp, 2
  9420                                  
  9421                                  ;-1094         }
  9422                                  
  9423                                  
  9424                                  ;-1095     fdout=creatR(namelst);
  9425                                  
  9426                                  .getarg501:
  9427 00004246 8D06C16A                 lea  ax, [namelst]
  9428 0000424A 50                       push ax
  9429 0000424B E87FBE                   call creatR
  9430 0000424E 83C402                   add  sp, 2
  9431 00004251 A3[1C00]                 mov word [fdout], ax
  9432                                  
  9433                                  ;-1096     if(DOS_ERR){
  9434                                  
  9435 00004254 A1[4F00]                 mov ax, [DOS_ERR]
  9436 00004257 08C0                     or  al, al
  9437 00004259 0F841C00                 je .getarg502
  9438                                  
  9439                                  ;-1097         cputs("list file not creatable: ");
  9440                                  
  9441 0000425D 68[FA42]                 push getarg_3
  9442 00004260 E819BE                   call cputs
  9443 00004263 83C402                   add  sp, 2
  9444                                  
  9445                                  ;-1098         cputs(namelst);
  9446                                  
  9447 00004266 8D06C16A                 lea  ax, [namelst]
  9448 0000426A 50                       push ax
  9449 0000426B E80EBE                   call cputs
  9450 0000426E 83C402                   add  sp, 2
  9451                                  
  9452                                  ;-1099         exitR(2);
  9453                                  
  9454 00004271 6A02                     push 2
  9455 00004273 E878BE                   call exitR
  9456 00004276 83C402                   add  sp, 2
  9457                                  
  9458                                  ;-1100         }
  9459                                  
  9460                                  
  9461                                  ;-1101     prs("\n; ");
  9462                                  
  9463                                  .getarg502:
  9464 00004279 68[1443]                 push getarg_4
  9465 0000427C E869C1                   call prs
  9466 0000427F 83C402                   add  sp, 2
  9467                                  
  9468                                  ;-1102     prs(Version1);
  9469                                  
  9470 00004282 8D06[0300]               lea  ax, [Version1]
  9471 00004286 50                       push ax
  9472 00004287 E85EC1                   call prs
  9473 0000428A 83C402                   add  sp, 2
  9474                                  
  9475                                  ;-1103     prs(", Source: "); prs(namein);
  9476                                  
  9477 0000428D 68[1943]                 push getarg_5
  9478 00004290 E855C1                   call prs
  9479 00004293 83C402                   add  sp, 2
  9480 00004296 8D067E6A                 lea  ax, [namein]
  9481 0000429A 50                       push ax
  9482 0000429B E84AC1                   call prs
  9483 0000429E 83C402                   add  sp, 2
  9484                                  
  9485                                  ;-1104     prs(", Output asm: "); prs(namelst);
  9486                                  
  9487 000042A1 68[2443]                 push getarg_6
  9488 000042A4 E841C1                   call prs
  9489 000042A7 83C402                   add  sp, 2
  9490 000042AA 8D06C16A                 lea  ax, [namelst]
  9491 000042AE 50                       push ax
  9492 000042AF E836C1                   call prs
  9493 000042B2 83C402                   add  sp, 2
  9494                                  
  9495                                  ;-1105     prs("\norg  256 \njmp main");
  9496                                  
  9497 000042B5 68[3343]                 push getarg_7
  9498 000042B8 E82DC1                   call prs
  9499 000042BB 83C402                   add  sp, 2
  9500                                  
  9501                                  ;-1106 }
  9502                                  
  9503                                  
  9504                                  ;-1107 
  9505                                  
  9506                                  
  9507                                  ;-1108 int main() {
  9508 000042BE C9                       LEAVE
  9509 000042BF C3                       ret
  9510 000042C0 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  9511 000042C9 2E434F4D20696E5F66-
  9512 000042D2 696C655B2E435D3A20-
  9513 000042DB 00                 
  9514 000042DC 2E4300                  getarg_1 db ".C",0
  9515 000042DF 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  9516 000042E8 6C65206D697373696E-
  9517 000042F1 6720282E43293A2000 
  9518 000042FA 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  9519 00004303 206E6F742063726561-
  9520 0000430C 7461626C653A2000   
  9521 00004314 5C6E3B2000              getarg_4 db "\n; ",0
  9522 00004319 2C20536F757263653A-     getarg_5 db ", Source: ",0
  9523 00004322 2000               
  9524 00004324 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  9525 0000432D 61736D3A2000       
  9526 00004333 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  9527 0000433C 36205C6E6A6D70206D-
  9528 00004345 61696E00           
  9529                                  ENDP
  9530                                  
  9531                                  main: PROC
  9532                                  
  9533                                  ;-1109     getarg();
  9534                                  
  9535 00004349 E811FE                   call getarg
  9536                                  
  9537                                  ;-1110     CNameTop=0;
  9538                                  
  9539 0000434C B80000                   mov ax, 0
  9540 0000434F A3[4100]                 mov word [CNameTop], ax
  9541                                  
  9542                                  ;-1111     coname=0;
  9543                                  
  9544 00004352 B80000                   mov ax, 0
  9545 00004355 A27869                   mov byte [coname], al
  9546                                  
  9547                                  ;-1112     orgData=ORGDATAORIG;
  9548                                  
  9549 00004358 A1[1000]                 mov ax, [ORGDATAORIG]
  9550 0000435B A3[1200]                 mov word [orgData], ax
  9551                                  
  9552                                  ;-1113     getfirstchar();
  9553                                  
  9554 0000435E E8E2FD                   call getfirstchar
  9555                                  
  9556                                  ;-1114     parse();
  9557                                  
  9558 00004361 E862FD                   call parse
  9559                                  
  9560                                  ;-1115   epilog();
  9561                                  
  9562 00004364 E8C8F9                   call epilog
  9563                                  
  9564                                  ;-1116 }
  9565                                  
  9566 00004367 C3                       ret
  9567                                  ENDP
  9568                                  ;Input: A.C, List: A.S,  Lines: 1117
  9569                                  ;Glob. variables:  118 max.:  200
  9570                                  ;Functions      :   91 max.:  300
  9571                                  ;Calls          :  786 max.: 1500
  9572                                  ;NameField      : 4999 max.:10000
  9573                                  ;Const in 'checkreg' :  712 max.: 2000, stacksize: 
